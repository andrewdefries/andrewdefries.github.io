---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.866966, -0.6764773, -1.826198, 1, 0, 0, 1,
-3.240963, -1.300181, -0.1797781, 1, 0.007843138, 0, 1,
-2.959219, -0.4566654, -0.6803116, 1, 0.01176471, 0, 1,
-2.946448, 0.9849734, -0.1839533, 1, 0.01960784, 0, 1,
-2.922938, -0.3366174, -2.548661, 1, 0.02352941, 0, 1,
-2.733041, 1.064342, -1.875736, 1, 0.03137255, 0, 1,
-2.505865, -1.180997, -2.549321, 1, 0.03529412, 0, 1,
-2.364004, -0.08458241, -2.163047, 1, 0.04313726, 0, 1,
-2.276838, -0.2153128, -2.118086, 1, 0.04705882, 0, 1,
-2.224636, -1.653286, -1.648484, 1, 0.05490196, 0, 1,
-2.220063, 1.439198, -0.8609858, 1, 0.05882353, 0, 1,
-2.212551, -2.021452, -1.669558, 1, 0.06666667, 0, 1,
-2.205167, -0.1041403, -3.391446, 1, 0.07058824, 0, 1,
-2.166172, -1.752025, -3.821672, 1, 0.07843138, 0, 1,
-2.130543, -1.801509, -3.42741, 1, 0.08235294, 0, 1,
-2.128329, 0.3803598, -1.340594, 1, 0.09019608, 0, 1,
-2.083282, -0.04803304, -2.727051, 1, 0.09411765, 0, 1,
-2.06327, 1.300819, 0.009801179, 1, 0.1019608, 0, 1,
-2.034068, -0.389616, -3.13549, 1, 0.1098039, 0, 1,
-2.028029, -0.3545388, -1.851909, 1, 0.1137255, 0, 1,
-2.003693, 0.8655601, -3.604844, 1, 0.1215686, 0, 1,
-2.00035, -0.6382042, -1.516804, 1, 0.1254902, 0, 1,
-1.986039, 1.572873, -2.480804, 1, 0.1333333, 0, 1,
-1.97407, -1.304927, -2.050948, 1, 0.1372549, 0, 1,
-1.955593, -0.6210972, -1.663316, 1, 0.145098, 0, 1,
-1.952849, 0.5977635, -1.581259, 1, 0.1490196, 0, 1,
-1.951737, -1.056008, -2.179565, 1, 0.1568628, 0, 1,
-1.947552, 0.1926028, -2.394357, 1, 0.1607843, 0, 1,
-1.9181, 0.9071736, -1.083356, 1, 0.1686275, 0, 1,
-1.867286, -1.424765, -2.312428, 1, 0.172549, 0, 1,
-1.866903, -0.5541617, -2.138789, 1, 0.1803922, 0, 1,
-1.858386, 0.6797925, -0.9154752, 1, 0.1843137, 0, 1,
-1.837258, 0.3263603, -1.09308, 1, 0.1921569, 0, 1,
-1.833646, -0.1903094, -3.016266, 1, 0.1960784, 0, 1,
-1.825453, -0.6970324, -3.866556, 1, 0.2039216, 0, 1,
-1.770894, -0.5645698, -1.638744, 1, 0.2117647, 0, 1,
-1.761897, 1.482238, 0.3819101, 1, 0.2156863, 0, 1,
-1.759895, 1.177086, -1.194348, 1, 0.2235294, 0, 1,
-1.733848, -0.018802, -1.232932, 1, 0.227451, 0, 1,
-1.732233, 1.234748, -1.343163, 1, 0.2352941, 0, 1,
-1.731577, -0.3099052, -0.9169118, 1, 0.2392157, 0, 1,
-1.710685, -2.464275, -0.9319479, 1, 0.2470588, 0, 1,
-1.7047, 0.268368, -2.035809, 1, 0.2509804, 0, 1,
-1.700999, -0.05747587, -1.29873, 1, 0.2588235, 0, 1,
-1.66285, 0.01932267, -1.542751, 1, 0.2627451, 0, 1,
-1.654147, 0.3157008, 0.7839997, 1, 0.2705882, 0, 1,
-1.643431, 0.3088116, -0.1088574, 1, 0.2745098, 0, 1,
-1.631978, -0.9468536, -1.127427, 1, 0.282353, 0, 1,
-1.625763, -0.3575577, -1.980717, 1, 0.2862745, 0, 1,
-1.604279, -1.357217, -1.866393, 1, 0.2941177, 0, 1,
-1.60182, 0.9561824, -0.6932105, 1, 0.3019608, 0, 1,
-1.581436, -0.4650794, -2.698858, 1, 0.3058824, 0, 1,
-1.572347, 1.152861, -1.013875, 1, 0.3137255, 0, 1,
-1.570539, 1.425601, -0.2275784, 1, 0.3176471, 0, 1,
-1.567483, -0.4185249, -3.451615, 1, 0.3254902, 0, 1,
-1.553785, -0.9423544, -4.029446, 1, 0.3294118, 0, 1,
-1.54069, -1.704169, -2.701514, 1, 0.3372549, 0, 1,
-1.539199, 1.368535, 0.9330336, 1, 0.3411765, 0, 1,
-1.538048, -0.6714716, -2.623272, 1, 0.3490196, 0, 1,
-1.53084, 0.4512649, -0.4760778, 1, 0.3529412, 0, 1,
-1.527755, -0.9542622, -2.642993, 1, 0.3607843, 0, 1,
-1.511005, -0.8778467, -3.264259, 1, 0.3647059, 0, 1,
-1.50777, -0.5131063, -1.102818, 1, 0.372549, 0, 1,
-1.501092, -0.1955272, -1.474318, 1, 0.3764706, 0, 1,
-1.48226, -0.0631059, -1.416537, 1, 0.3843137, 0, 1,
-1.476873, -0.3776382, -1.66064, 1, 0.3882353, 0, 1,
-1.459969, 0.0398831, -3.040791, 1, 0.3960784, 0, 1,
-1.45751, 1.493299, 0.4894726, 1, 0.4039216, 0, 1,
-1.449066, 1.296751, -0.4671997, 1, 0.4078431, 0, 1,
-1.443861, -1.391049, -3.386327, 1, 0.4156863, 0, 1,
-1.431048, -0.4953443, -2.398456, 1, 0.4196078, 0, 1,
-1.429264, -3.087563, -4.019865, 1, 0.427451, 0, 1,
-1.428785, -1.702091, -3.455541, 1, 0.4313726, 0, 1,
-1.427517, 1.472237, -1.949216, 1, 0.4392157, 0, 1,
-1.424794, -0.9835671, -2.193379, 1, 0.4431373, 0, 1,
-1.423156, -0.535751, -1.550979, 1, 0.4509804, 0, 1,
-1.397052, -0.6980448, -3.107594, 1, 0.454902, 0, 1,
-1.387081, 0.5775397, -1.148322, 1, 0.4627451, 0, 1,
-1.37984, -0.4446149, 0.5888173, 1, 0.4666667, 0, 1,
-1.376081, -0.9069059, -1.698526, 1, 0.4745098, 0, 1,
-1.373212, -0.09726124, -1.880394, 1, 0.4784314, 0, 1,
-1.370897, -0.2733783, -2.961743, 1, 0.4862745, 0, 1,
-1.368937, 1.571993, -0.6784434, 1, 0.4901961, 0, 1,
-1.360581, -0.1732564, -0.1613207, 1, 0.4980392, 0, 1,
-1.358587, 2.2343, -1.03318, 1, 0.5058824, 0, 1,
-1.341931, -0.5514165, -0.9485447, 1, 0.509804, 0, 1,
-1.325671, -0.4342174, -1.876597, 1, 0.5176471, 0, 1,
-1.321815, 1.535066, -0.8164622, 1, 0.5215687, 0, 1,
-1.320012, 0.02185222, -1.113227, 1, 0.5294118, 0, 1,
-1.314313, -1.173894, -1.736623, 1, 0.5333334, 0, 1,
-1.310099, 0.8794523, -2.023826, 1, 0.5411765, 0, 1,
-1.297991, 0.2596138, -1.015555, 1, 0.5450981, 0, 1,
-1.296897, -0.2988666, -1.485934, 1, 0.5529412, 0, 1,
-1.29272, -0.1429878, -1.578977, 1, 0.5568628, 0, 1,
-1.287139, -0.4937956, -1.685879, 1, 0.5647059, 0, 1,
-1.28711, 0.6602725, 0.2684603, 1, 0.5686275, 0, 1,
-1.282717, 0.3941897, -1.584158, 1, 0.5764706, 0, 1,
-1.275137, -1.767832, -2.26709, 1, 0.5803922, 0, 1,
-1.270707, -0.2709752, -1.650575, 1, 0.5882353, 0, 1,
-1.268548, 0.5329405, -2.520185, 1, 0.5921569, 0, 1,
-1.268251, -0.4720044, -2.25149, 1, 0.6, 0, 1,
-1.26673, -0.3025702, -1.957918, 1, 0.6078432, 0, 1,
-1.260721, 0.4757265, -1.908588, 1, 0.6117647, 0, 1,
-1.252838, -1.898714, -2.605919, 1, 0.6196079, 0, 1,
-1.252202, 2.38812, -0.9263914, 1, 0.6235294, 0, 1,
-1.248365, -0.5746921, -1.121177, 1, 0.6313726, 0, 1,
-1.247264, 1.213109, 1.320642, 1, 0.6352941, 0, 1,
-1.241009, -0.5146383, -3.038568, 1, 0.6431373, 0, 1,
-1.228808, 1.754602, -0.1640649, 1, 0.6470588, 0, 1,
-1.221197, 1.750146, -0.6740095, 1, 0.654902, 0, 1,
-1.217867, 0.2081512, -1.050031, 1, 0.6588235, 0, 1,
-1.21026, -0.973064, -2.944143, 1, 0.6666667, 0, 1,
-1.206917, 0.1572981, -2.307789, 1, 0.6705883, 0, 1,
-1.204768, -1.92495, -1.267501, 1, 0.6784314, 0, 1,
-1.203663, 0.8441043, -0.4358659, 1, 0.682353, 0, 1,
-1.201833, 1.32269, -0.6214068, 1, 0.6901961, 0, 1,
-1.197194, -0.8543704, -0.1083717, 1, 0.6941177, 0, 1,
-1.19114, 0.9580622, -1.332667, 1, 0.7019608, 0, 1,
-1.187633, -1.107377, -1.015368, 1, 0.7098039, 0, 1,
-1.183517, 2.127505, -1.806773, 1, 0.7137255, 0, 1,
-1.182152, -0.02422697, -2.424739, 1, 0.7215686, 0, 1,
-1.169948, -0.5597392, -3.579921, 1, 0.7254902, 0, 1,
-1.169891, -0.3157147, -3.297454, 1, 0.7333333, 0, 1,
-1.168047, 0.5747266, -0.2511727, 1, 0.7372549, 0, 1,
-1.167181, 0.06185923, 0.1566018, 1, 0.7450981, 0, 1,
-1.165683, -0.2537602, -3.202411, 1, 0.7490196, 0, 1,
-1.16472, 1.12246, -2.049089, 1, 0.7568628, 0, 1,
-1.163994, -0.9339043, -3.358842, 1, 0.7607843, 0, 1,
-1.158577, -0.5478018, -1.372639, 1, 0.7686275, 0, 1,
-1.158571, -0.005217523, -1.346358, 1, 0.772549, 0, 1,
-1.149889, 1.520815, 0.2296697, 1, 0.7803922, 0, 1,
-1.149737, -1.794406, -0.9944935, 1, 0.7843137, 0, 1,
-1.144997, 0.3980551, -2.927742, 1, 0.7921569, 0, 1,
-1.140253, 0.9182158, -2.284566, 1, 0.7960784, 0, 1,
-1.13926, 0.2428088, -1.896415, 1, 0.8039216, 0, 1,
-1.139188, 0.07454365, -0.5928393, 1, 0.8117647, 0, 1,
-1.136191, -0.8451579, -2.332875, 1, 0.8156863, 0, 1,
-1.134874, 0.01512288, -2.71768, 1, 0.8235294, 0, 1,
-1.118634, 0.08156342, 1.328152, 1, 0.827451, 0, 1,
-1.116482, 0.7058022, 0.0119148, 1, 0.8352941, 0, 1,
-1.115553, 1.420377, -0.7768571, 1, 0.8392157, 0, 1,
-1.110995, 2.159352, 0.07347174, 1, 0.8470588, 0, 1,
-1.104689, 0.4030949, -1.556006, 1, 0.8509804, 0, 1,
-1.102069, -1.865107, -4.989007, 1, 0.8588235, 0, 1,
-1.101215, 0.2702178, -0.5779954, 1, 0.8627451, 0, 1,
-1.088762, 0.7812225, -1.384361, 1, 0.8705882, 0, 1,
-1.086996, 0.4147236, -1.438962, 1, 0.8745098, 0, 1,
-1.086738, 0.170897, 0.4985623, 1, 0.8823529, 0, 1,
-1.069077, -0.4028091, -1.178361, 1, 0.8862745, 0, 1,
-1.066957, -1.044568, -1.815272, 1, 0.8941177, 0, 1,
-1.066326, -0.5793898, -0.3900394, 1, 0.8980392, 0, 1,
-1.058347, -0.7566727, -2.825279, 1, 0.9058824, 0, 1,
-1.037582, 1.263278, -0.6961368, 1, 0.9137255, 0, 1,
-1.034611, 2.127668, 0.5933747, 1, 0.9176471, 0, 1,
-1.032615, 0.2523406, -2.896528, 1, 0.9254902, 0, 1,
-1.030467, -0.06567862, -3.992129, 1, 0.9294118, 0, 1,
-1.029919, -2.154535, -3.614907, 1, 0.9372549, 0, 1,
-1.024774, 0.6090606, -1.46171, 1, 0.9411765, 0, 1,
-1.023926, -0.2439414, -2.641263, 1, 0.9490196, 0, 1,
-1.019393, 0.6615545, -0.8164363, 1, 0.9529412, 0, 1,
-1.019385, 0.5521208, -0.4556239, 1, 0.9607843, 0, 1,
-1.017334, 1.76393, -1.052637, 1, 0.9647059, 0, 1,
-1.016766, -1.031607, -3.750218, 1, 0.972549, 0, 1,
-1.01465, -1.305083, -1.443244, 1, 0.9764706, 0, 1,
-1.011841, -1.074693, -1.131742, 1, 0.9843137, 0, 1,
-1.004077, 1.791599, -0.3876162, 1, 0.9882353, 0, 1,
-1.002391, 1.144235, -1.03553, 1, 0.9960784, 0, 1,
-1.000083, -0.3862525, -1.056197, 0.9960784, 1, 0, 1,
-0.9930953, -1.426285, -1.388035, 0.9921569, 1, 0, 1,
-0.989498, -0.3706018, -0.2040098, 0.9843137, 1, 0, 1,
-0.9856444, -0.7534897, -2.2199, 0.9803922, 1, 0, 1,
-0.9832153, 0.953824, -1.056602, 0.972549, 1, 0, 1,
-0.9788101, 1.155209, -1.297226, 0.9686275, 1, 0, 1,
-0.9719946, -0.4638087, -3.027534, 0.9607843, 1, 0, 1,
-0.9706642, 0.6878635, -2.088108, 0.9568627, 1, 0, 1,
-0.9622103, -1.141893, -2.526897, 0.9490196, 1, 0, 1,
-0.9608921, 0.6011613, -1.507252, 0.945098, 1, 0, 1,
-0.9598217, 0.00810595, -2.267506, 0.9372549, 1, 0, 1,
-0.9558985, -0.1153344, -0.3245487, 0.9333333, 1, 0, 1,
-0.9496615, -1.146364, -2.198781, 0.9254902, 1, 0, 1,
-0.9491429, -0.2188239, -1.406085, 0.9215686, 1, 0, 1,
-0.9483269, -0.7922449, -1.376823, 0.9137255, 1, 0, 1,
-0.9433123, 2.758772, 0.3760697, 0.9098039, 1, 0, 1,
-0.9357661, -0.2211058, -3.734305, 0.9019608, 1, 0, 1,
-0.9241287, -0.6585974, -4.137638, 0.8941177, 1, 0, 1,
-0.9202721, -0.0248844, -3.823417, 0.8901961, 1, 0, 1,
-0.9197363, 0.2554046, -2.059553, 0.8823529, 1, 0, 1,
-0.9195638, 0.5424144, -0.1821105, 0.8784314, 1, 0, 1,
-0.918408, 0.4275483, -0.9409168, 0.8705882, 1, 0, 1,
-0.9178474, -2.188152, -1.253658, 0.8666667, 1, 0, 1,
-0.91423, -0.5889424, -0.5709296, 0.8588235, 1, 0, 1,
-0.9000164, 1.176517, 0.3457012, 0.854902, 1, 0, 1,
-0.8993773, 0.4443016, 0.141376, 0.8470588, 1, 0, 1,
-0.896126, -0.3854104, -0.5290561, 0.8431373, 1, 0, 1,
-0.8895146, 0.2852507, -2.161889, 0.8352941, 1, 0, 1,
-0.8879622, 0.8270599, 0.7051719, 0.8313726, 1, 0, 1,
-0.8804705, -1.991905, -1.115236, 0.8235294, 1, 0, 1,
-0.8791283, -0.0311745, -1.471639, 0.8196079, 1, 0, 1,
-0.878418, -0.7657628, -4.106954, 0.8117647, 1, 0, 1,
-0.865773, 0.3321832, -0.9374849, 0.8078431, 1, 0, 1,
-0.8640137, 0.8648244, -0.9337472, 0.8, 1, 0, 1,
-0.8626042, -0.33291, -0.3090063, 0.7921569, 1, 0, 1,
-0.8603971, -2.402467, -1.960013, 0.7882353, 1, 0, 1,
-0.8549697, -1.001234, -3.845263, 0.7803922, 1, 0, 1,
-0.8494581, -1.559234, -1.158413, 0.7764706, 1, 0, 1,
-0.8431708, 1.649797, -1.007578, 0.7686275, 1, 0, 1,
-0.8359905, 0.4227521, -1.255073, 0.7647059, 1, 0, 1,
-0.8348005, 0.2755926, -1.566078, 0.7568628, 1, 0, 1,
-0.8296695, 0.3727604, -0.2895736, 0.7529412, 1, 0, 1,
-0.8261856, -0.1763878, -2.043004, 0.7450981, 1, 0, 1,
-0.8251749, 0.6010457, -0.3769108, 0.7411765, 1, 0, 1,
-0.8196933, 1.697967, -0.9965093, 0.7333333, 1, 0, 1,
-0.8143236, 0.07141599, -3.874656, 0.7294118, 1, 0, 1,
-0.8112755, 0.2819283, -3.822286, 0.7215686, 1, 0, 1,
-0.8101785, 0.20588, -1.387016, 0.7176471, 1, 0, 1,
-0.8050233, -0.712938, -2.858592, 0.7098039, 1, 0, 1,
-0.8011433, -0.6837575, -0.7550086, 0.7058824, 1, 0, 1,
-0.7964513, -1.601133, -2.226099, 0.6980392, 1, 0, 1,
-0.7925581, 2.245199, 0.2736136, 0.6901961, 1, 0, 1,
-0.7915454, 0.4821521, -1.98144, 0.6862745, 1, 0, 1,
-0.7878596, 2.148973, 0.2290109, 0.6784314, 1, 0, 1,
-0.7844067, -1.104379, -2.213548, 0.6745098, 1, 0, 1,
-0.783888, -1.133604, -3.153434, 0.6666667, 1, 0, 1,
-0.7812843, 0.2787858, -1.764816, 0.6627451, 1, 0, 1,
-0.7797965, -0.8445397, -0.3767784, 0.654902, 1, 0, 1,
-0.7788484, -1.09919, -3.204037, 0.6509804, 1, 0, 1,
-0.7728122, -0.5825513, 0.04911436, 0.6431373, 1, 0, 1,
-0.7725847, 1.753106, -0.6021571, 0.6392157, 1, 0, 1,
-0.7718925, 0.7448274, -1.534246, 0.6313726, 1, 0, 1,
-0.7713877, 1.597006, -1.654978, 0.627451, 1, 0, 1,
-0.7659814, 0.1905821, -1.061835, 0.6196079, 1, 0, 1,
-0.7630404, -0.04487531, -1.222803, 0.6156863, 1, 0, 1,
-0.7593982, 0.911534, -1.9579, 0.6078432, 1, 0, 1,
-0.7519409, -0.842791, -1.547533, 0.6039216, 1, 0, 1,
-0.7484172, 1.666868, 0.9715197, 0.5960785, 1, 0, 1,
-0.7473012, -0.7984293, -2.885142, 0.5882353, 1, 0, 1,
-0.7471097, 0.5542468, -1.158842, 0.5843138, 1, 0, 1,
-0.744845, 0.0715728, -0.6547311, 0.5764706, 1, 0, 1,
-0.743166, 0.06890052, -3.741804, 0.572549, 1, 0, 1,
-0.7420328, -0.1356519, -0.128589, 0.5647059, 1, 0, 1,
-0.7394087, 0.184366, -2.494465, 0.5607843, 1, 0, 1,
-0.7336, 1.696343, -0.3409917, 0.5529412, 1, 0, 1,
-0.7326182, -0.4143213, -3.367265, 0.5490196, 1, 0, 1,
-0.7296854, 0.7309209, -0.8213568, 0.5411765, 1, 0, 1,
-0.7237779, -0.2749504, -2.084262, 0.5372549, 1, 0, 1,
-0.7222182, 1.362076, -0.4264986, 0.5294118, 1, 0, 1,
-0.7193506, -0.1797274, -2.813999, 0.5254902, 1, 0, 1,
-0.7180457, 1.269954, 0.09703968, 0.5176471, 1, 0, 1,
-0.7168357, 1.264962, 2.068866, 0.5137255, 1, 0, 1,
-0.7162741, -0.3065416, -1.532389, 0.5058824, 1, 0, 1,
-0.7148263, 1.310894, -1.492911, 0.5019608, 1, 0, 1,
-0.7090532, 1.173004, -0.6096999, 0.4941176, 1, 0, 1,
-0.7057586, 1.101318, -1.199406, 0.4862745, 1, 0, 1,
-0.7016367, 0.9286925, -0.927701, 0.4823529, 1, 0, 1,
-0.7011462, -0.7301734, -0.8805228, 0.4745098, 1, 0, 1,
-0.6984547, 1.38941, -1.695644, 0.4705882, 1, 0, 1,
-0.6979304, 0.4762607, -1.029152, 0.4627451, 1, 0, 1,
-0.6974849, 0.37714, -2.799836, 0.4588235, 1, 0, 1,
-0.6889687, -0.8425301, -1.730692, 0.4509804, 1, 0, 1,
-0.6888219, 1.335929, 0.6370158, 0.4470588, 1, 0, 1,
-0.6862861, 1.453356, -0.09066755, 0.4392157, 1, 0, 1,
-0.6732728, 0.4662108, -1.564457, 0.4352941, 1, 0, 1,
-0.6730887, 1.157881, 1.001288, 0.427451, 1, 0, 1,
-0.6695197, 0.3002125, -1.145465, 0.4235294, 1, 0, 1,
-0.6687556, 0.2645575, -0.8301942, 0.4156863, 1, 0, 1,
-0.668272, -0.1205377, -1.606685, 0.4117647, 1, 0, 1,
-0.6675436, -1.55097, -1.74358, 0.4039216, 1, 0, 1,
-0.6674529, -0.1156758, -2.970703, 0.3960784, 1, 0, 1,
-0.666133, -0.05143805, -1.132115, 0.3921569, 1, 0, 1,
-0.6624517, 0.2681909, -0.8541797, 0.3843137, 1, 0, 1,
-0.6598719, -0.122765, -2.711968, 0.3803922, 1, 0, 1,
-0.6548767, 0.7494924, -0.3463703, 0.372549, 1, 0, 1,
-0.6476543, 1.222011, -0.4655172, 0.3686275, 1, 0, 1,
-0.6447613, -1.152145, -2.586492, 0.3607843, 1, 0, 1,
-0.6386505, -1.459245, -1.530851, 0.3568628, 1, 0, 1,
-0.623246, -1.517947, -5.094185, 0.3490196, 1, 0, 1,
-0.6189018, 0.4770469, -0.2247161, 0.345098, 1, 0, 1,
-0.618816, 0.07805607, -2.589786, 0.3372549, 1, 0, 1,
-0.6179295, -1.172407, -0.5423799, 0.3333333, 1, 0, 1,
-0.6163222, 0.6627863, -1.150709, 0.3254902, 1, 0, 1,
-0.6158621, -0.2069906, -1.389799, 0.3215686, 1, 0, 1,
-0.6152126, 1.780823, 0.9662524, 0.3137255, 1, 0, 1,
-0.6124831, 2.162275, 1.997406, 0.3098039, 1, 0, 1,
-0.6099055, 1.241667, -0.2082472, 0.3019608, 1, 0, 1,
-0.6065543, 0.2996625, 0.4221643, 0.2941177, 1, 0, 1,
-0.5972867, 0.1367235, 1.713776, 0.2901961, 1, 0, 1,
-0.5961925, -0.2218133, -1.581283, 0.282353, 1, 0, 1,
-0.5851819, -0.1993704, -1.242282, 0.2784314, 1, 0, 1,
-0.5840636, -0.4373038, -1.378647, 0.2705882, 1, 0, 1,
-0.5832211, 0.5545909, -0.8538479, 0.2666667, 1, 0, 1,
-0.5770433, 1.319667, 0.9968691, 0.2588235, 1, 0, 1,
-0.573931, -1.492103, -0.6124012, 0.254902, 1, 0, 1,
-0.573694, -1.463172, -3.555494, 0.2470588, 1, 0, 1,
-0.5688434, -0.09636351, -2.709895, 0.2431373, 1, 0, 1,
-0.5681809, 0.561359, -0.5298138, 0.2352941, 1, 0, 1,
-0.5675768, -0.4457272, -1.256711, 0.2313726, 1, 0, 1,
-0.567341, 0.3054186, 0.05888847, 0.2235294, 1, 0, 1,
-0.5631825, -0.3105434, -2.574453, 0.2196078, 1, 0, 1,
-0.5627062, 1.560262, 0.6309087, 0.2117647, 1, 0, 1,
-0.5601188, -0.4510264, -1.961476, 0.2078431, 1, 0, 1,
-0.5577244, 0.5462961, -0.6595173, 0.2, 1, 0, 1,
-0.5554087, 1.171805, -1.906679, 0.1921569, 1, 0, 1,
-0.5517703, -0.5477777, -1.059369, 0.1882353, 1, 0, 1,
-0.5512592, 0.6704636, -0.3545467, 0.1803922, 1, 0, 1,
-0.5492747, -0.3104653, -2.507896, 0.1764706, 1, 0, 1,
-0.5483199, -1.801027, -1.856362, 0.1686275, 1, 0, 1,
-0.5460966, -0.6227939, -1.012605, 0.1647059, 1, 0, 1,
-0.5453873, -1.127137, -2.855119, 0.1568628, 1, 0, 1,
-0.5406415, 0.9064983, 1.142198, 0.1529412, 1, 0, 1,
-0.534296, 0.5826471, -1.637908, 0.145098, 1, 0, 1,
-0.5293214, 1.360787, -0.1440517, 0.1411765, 1, 0, 1,
-0.5288865, 0.1487965, -1.819874, 0.1333333, 1, 0, 1,
-0.5206541, -0.04986189, -2.360344, 0.1294118, 1, 0, 1,
-0.5053214, -1.389609, -2.611716, 0.1215686, 1, 0, 1,
-0.5023929, 0.382247, 0.2538794, 0.1176471, 1, 0, 1,
-0.5002801, -0.7213355, -1.313729, 0.1098039, 1, 0, 1,
-0.4996259, 0.2545719, -0.8234549, 0.1058824, 1, 0, 1,
-0.4925281, 0.2746259, -3.679103, 0.09803922, 1, 0, 1,
-0.4856924, -0.4228343, -1.101571, 0.09019608, 1, 0, 1,
-0.4846814, -0.7927784, -2.238436, 0.08627451, 1, 0, 1,
-0.4814654, 0.6289495, -0.9890238, 0.07843138, 1, 0, 1,
-0.4808111, -0.9151794, -3.165135, 0.07450981, 1, 0, 1,
-0.4775279, 0.2983054, -0.6230518, 0.06666667, 1, 0, 1,
-0.4756414, 0.4336922, -0.6161354, 0.0627451, 1, 0, 1,
-0.4712719, 1.018192, -1.728321, 0.05490196, 1, 0, 1,
-0.4677558, 1.09664, -0.3897302, 0.05098039, 1, 0, 1,
-0.4672917, 0.7304241, -1.668889, 0.04313726, 1, 0, 1,
-0.4641405, 0.8138811, 0.04119023, 0.03921569, 1, 0, 1,
-0.4638852, 0.5996106, 0.5766702, 0.03137255, 1, 0, 1,
-0.4610378, -0.1333276, -3.06816, 0.02745098, 1, 0, 1,
-0.4538817, -0.3037988, -3.020157, 0.01960784, 1, 0, 1,
-0.4501428, 0.755426, -1.049659, 0.01568628, 1, 0, 1,
-0.4488415, -1.322636, -1.885574, 0.007843138, 1, 0, 1,
-0.448495, 0.5221377, -1.748088, 0.003921569, 1, 0, 1,
-0.4469059, 0.3202023, 0.6453073, 0, 1, 0.003921569, 1,
-0.4457816, 0.206448, -0.7821161, 0, 1, 0.01176471, 1,
-0.44129, -0.4503379, -2.015078, 0, 1, 0.01568628, 1,
-0.4407968, 1.112226, -0.2617051, 0, 1, 0.02352941, 1,
-0.430811, -1.226362, -2.108035, 0, 1, 0.02745098, 1,
-0.4294934, -0.3408861, -1.606356, 0, 1, 0.03529412, 1,
-0.4274208, 1.774189, -1.216362, 0, 1, 0.03921569, 1,
-0.4241597, 1.830116, -0.04986687, 0, 1, 0.04705882, 1,
-0.4237286, 1.104433, -1.365686, 0, 1, 0.05098039, 1,
-0.4208679, 0.004932428, -1.997751, 0, 1, 0.05882353, 1,
-0.4207131, -0.9669048, -2.017541, 0, 1, 0.0627451, 1,
-0.4180067, 1.131751, -0.7058209, 0, 1, 0.07058824, 1,
-0.4174103, -2.116614, -3.670464, 0, 1, 0.07450981, 1,
-0.4166222, -1.139155, -1.781533, 0, 1, 0.08235294, 1,
-0.4137725, -0.4072343, -2.56331, 0, 1, 0.08627451, 1,
-0.4133285, 1.192603, 0.5712841, 0, 1, 0.09411765, 1,
-0.4084145, 0.3412319, 1.330308, 0, 1, 0.1019608, 1,
-0.4076039, 0.4467445, -1.488344, 0, 1, 0.1058824, 1,
-0.4051047, 0.9325629, -0.1664279, 0, 1, 0.1137255, 1,
-0.4044614, 1.094694, 1.582671, 0, 1, 0.1176471, 1,
-0.4020529, -0.8969158, -3.386373, 0, 1, 0.1254902, 1,
-0.396481, 1.387381, 0.1460873, 0, 1, 0.1294118, 1,
-0.3951961, -0.9996406, -2.87034, 0, 1, 0.1372549, 1,
-0.3951858, -2.613029, -3.666208, 0, 1, 0.1411765, 1,
-0.3915578, -0.4742335, -1.73428, 0, 1, 0.1490196, 1,
-0.389114, -1.373234, -1.51943, 0, 1, 0.1529412, 1,
-0.3860108, -1.312663, -2.680341, 0, 1, 0.1607843, 1,
-0.384584, 1.773692, -0.3693586, 0, 1, 0.1647059, 1,
-0.3838532, -0.5347117, -3.666968, 0, 1, 0.172549, 1,
-0.3817217, -0.6544762, -3.246949, 0, 1, 0.1764706, 1,
-0.3816878, -1.687057, -3.502712, 0, 1, 0.1843137, 1,
-0.3787302, 0.03012885, -2.960516, 0, 1, 0.1882353, 1,
-0.3781881, 0.1966813, -1.146364, 0, 1, 0.1960784, 1,
-0.3758423, -0.1663131, -2.473223, 0, 1, 0.2039216, 1,
-0.3734538, 0.2245551, -0.8698378, 0, 1, 0.2078431, 1,
-0.3706334, 0.249322, -1.701153, 0, 1, 0.2156863, 1,
-0.3700138, -0.8178828, -2.215908, 0, 1, 0.2196078, 1,
-0.3697884, 1.176941, -0.9717079, 0, 1, 0.227451, 1,
-0.3683914, -0.6550174, -2.484839, 0, 1, 0.2313726, 1,
-0.3621431, -1.185253, -1.180004, 0, 1, 0.2392157, 1,
-0.3549842, 1.692717, 1.361469, 0, 1, 0.2431373, 1,
-0.35484, 1.826405, -0.4614103, 0, 1, 0.2509804, 1,
-0.3532034, 0.05320212, -1.789515, 0, 1, 0.254902, 1,
-0.3498186, 2.020395, -0.08767582, 0, 1, 0.2627451, 1,
-0.3469578, -1.748156, -2.171968, 0, 1, 0.2666667, 1,
-0.3407406, 0.08582116, -0.5152513, 0, 1, 0.2745098, 1,
-0.3396299, 0.3088972, -1.883973, 0, 1, 0.2784314, 1,
-0.3393192, 0.3303475, -1.472795, 0, 1, 0.2862745, 1,
-0.3326851, -2.260175, -2.559391, 0, 1, 0.2901961, 1,
-0.3305137, 0.4147557, -0.821306, 0, 1, 0.2980392, 1,
-0.3284782, 0.8885731, -0.7797322, 0, 1, 0.3058824, 1,
-0.3268093, -0.635354, -2.979326, 0, 1, 0.3098039, 1,
-0.3241042, 1.267852, -1.746291, 0, 1, 0.3176471, 1,
-0.3239468, -0.5999794, -3.993061, 0, 1, 0.3215686, 1,
-0.3233209, 1.348324, 0.1418045, 0, 1, 0.3294118, 1,
-0.3231938, 0.3255296, -2.290786, 0, 1, 0.3333333, 1,
-0.3227681, 1.168089, 0.6366137, 0, 1, 0.3411765, 1,
-0.320498, 0.3446067, -2.163648, 0, 1, 0.345098, 1,
-0.3177229, 1.647328, 0.7223465, 0, 1, 0.3529412, 1,
-0.3127989, -0.4379225, -0.8944819, 0, 1, 0.3568628, 1,
-0.3094858, 1.069209, -0.005247151, 0, 1, 0.3647059, 1,
-0.3031946, 0.3033356, -0.4340936, 0, 1, 0.3686275, 1,
-0.3014945, -0.3842749, -3.733583, 0, 1, 0.3764706, 1,
-0.2926493, -0.5879326, -3.738496, 0, 1, 0.3803922, 1,
-0.2907364, -0.8809339, -3.005376, 0, 1, 0.3882353, 1,
-0.2901713, 0.4037883, 0.1979111, 0, 1, 0.3921569, 1,
-0.2856924, 1.159311, -0.118724, 0, 1, 0.4, 1,
-0.2851879, -0.7866303, -1.49645, 0, 1, 0.4078431, 1,
-0.2826046, 0.3291691, -0.5994421, 0, 1, 0.4117647, 1,
-0.2805496, 1.028674, -0.1689333, 0, 1, 0.4196078, 1,
-0.2764708, 1.288341, 1.289273, 0, 1, 0.4235294, 1,
-0.2748669, 0.5838405, 0.7282289, 0, 1, 0.4313726, 1,
-0.2728459, 0.5110647, -0.5718208, 0, 1, 0.4352941, 1,
-0.268922, 0.7864508, -0.3438497, 0, 1, 0.4431373, 1,
-0.268736, 0.0212988, -1.699283, 0, 1, 0.4470588, 1,
-0.2681429, -0.07510952, -2.97419, 0, 1, 0.454902, 1,
-0.2642651, 0.2582924, -0.5130816, 0, 1, 0.4588235, 1,
-0.2616007, -1.770357, -1.499451, 0, 1, 0.4666667, 1,
-0.2574164, 0.253389, -0.3525045, 0, 1, 0.4705882, 1,
-0.2564883, -2.21746, -2.76745, 0, 1, 0.4784314, 1,
-0.2556778, 2.22785, 0.484, 0, 1, 0.4823529, 1,
-0.2543883, 0.006975774, -1.23885, 0, 1, 0.4901961, 1,
-0.2499412, 0.4806464, 0.3395857, 0, 1, 0.4941176, 1,
-0.2468777, 0.4606364, -1.90182, 0, 1, 0.5019608, 1,
-0.2467455, 0.5207221, -1.238277, 0, 1, 0.509804, 1,
-0.2436534, -0.04214714, -1.515109, 0, 1, 0.5137255, 1,
-0.2394413, 0.5002713, -0.7958652, 0, 1, 0.5215687, 1,
-0.2389015, 0.2520245, -0.7976589, 0, 1, 0.5254902, 1,
-0.2344383, 1.164122, -0.3068371, 0, 1, 0.5333334, 1,
-0.2316612, -1.003619, -4.878134, 0, 1, 0.5372549, 1,
-0.2301014, 0.2404638, -1.421602, 0, 1, 0.5450981, 1,
-0.2295913, -1.528124, -2.105957, 0, 1, 0.5490196, 1,
-0.2294664, 0.91895, 0.6627435, 0, 1, 0.5568628, 1,
-0.2261749, -0.3365484, -2.54627, 0, 1, 0.5607843, 1,
-0.2256005, 1.994764, -0.3322397, 0, 1, 0.5686275, 1,
-0.2153493, -1.231931, -2.470687, 0, 1, 0.572549, 1,
-0.212995, -0.5233063, -3.614072, 0, 1, 0.5803922, 1,
-0.2129157, 0.5501934, -1.133922, 0, 1, 0.5843138, 1,
-0.211551, 1.221426, -1.449023, 0, 1, 0.5921569, 1,
-0.2099717, 0.9576843, -2.212357, 0, 1, 0.5960785, 1,
-0.2041193, 0.5728055, 0.0949128, 0, 1, 0.6039216, 1,
-0.1965333, -0.4837544, -3.551238, 0, 1, 0.6117647, 1,
-0.1944158, -0.8073549, -3.14019, 0, 1, 0.6156863, 1,
-0.190005, -0.2766063, -3.119915, 0, 1, 0.6235294, 1,
-0.1878723, 1.289521, 0.06945696, 0, 1, 0.627451, 1,
-0.1878222, -0.4324881, -4.691056, 0, 1, 0.6352941, 1,
-0.1846416, -1.832847, -4.830289, 0, 1, 0.6392157, 1,
-0.1828368, -1.223852, -3.310349, 0, 1, 0.6470588, 1,
-0.1710557, -0.893398, -3.082078, 0, 1, 0.6509804, 1,
-0.1664218, 1.060007, -0.07743354, 0, 1, 0.6588235, 1,
-0.1592938, 0.6606337, 0.4366126, 0, 1, 0.6627451, 1,
-0.1589999, 0.8195701, -2.194769, 0, 1, 0.6705883, 1,
-0.1533676, 0.2327751, -0.5364304, 0, 1, 0.6745098, 1,
-0.1477875, 0.05935065, -0.6205708, 0, 1, 0.682353, 1,
-0.1428476, 0.431248, -1.704386, 0, 1, 0.6862745, 1,
-0.1384447, 0.02181677, -0.7396516, 0, 1, 0.6941177, 1,
-0.1299098, -0.5206501, -3.099252, 0, 1, 0.7019608, 1,
-0.1286149, 2.394197, -1.341578, 0, 1, 0.7058824, 1,
-0.1263242, 1.716466, -1.415413, 0, 1, 0.7137255, 1,
-0.124128, 2.913129, -1.957003, 0, 1, 0.7176471, 1,
-0.121121, 0.4472456, -0.1943936, 0, 1, 0.7254902, 1,
-0.1130636, -1.56834, -2.437083, 0, 1, 0.7294118, 1,
-0.1112009, -2.074211, -3.376621, 0, 1, 0.7372549, 1,
-0.111072, 0.6965898, 0.7648615, 0, 1, 0.7411765, 1,
-0.1106082, 1.642558, 1.037248, 0, 1, 0.7490196, 1,
-0.1098015, -0.7055181, -3.159547, 0, 1, 0.7529412, 1,
-0.1090495, 0.2807304, 0.3721276, 0, 1, 0.7607843, 1,
-0.1084349, -0.06631311, -2.848016, 0, 1, 0.7647059, 1,
-0.1033596, -0.3562736, -3.182647, 0, 1, 0.772549, 1,
-0.09971521, 0.4738494, -0.6999485, 0, 1, 0.7764706, 1,
-0.09342442, 0.1076893, 0.4236217, 0, 1, 0.7843137, 1,
-0.09283715, 1.204963, -0.5809966, 0, 1, 0.7882353, 1,
-0.08952598, 0.3934773, -0.4660261, 0, 1, 0.7960784, 1,
-0.08757155, 0.07818174, -0.6328272, 0, 1, 0.8039216, 1,
-0.08576513, -0.2754142, -0.6488987, 0, 1, 0.8078431, 1,
-0.08331239, -0.4355276, -4.320378, 0, 1, 0.8156863, 1,
-0.08046524, -1.32083, -2.39, 0, 1, 0.8196079, 1,
-0.07991176, 0.6331869, -0.07538644, 0, 1, 0.827451, 1,
-0.07986213, 0.8022544, 0.6926523, 0, 1, 0.8313726, 1,
-0.07799491, -0.266633, -3.661806, 0, 1, 0.8392157, 1,
-0.07588556, -0.4811809, -3.404394, 0, 1, 0.8431373, 1,
-0.07347432, -0.02951546, -2.051241, 0, 1, 0.8509804, 1,
-0.07216465, -1.02627, -5.212063, 0, 1, 0.854902, 1,
-0.06456666, 1.852595, 0.8197863, 0, 1, 0.8627451, 1,
-0.06250086, -1.286727, -3.12675, 0, 1, 0.8666667, 1,
-0.06128591, -0.3869346, -3.187305, 0, 1, 0.8745098, 1,
-0.0572007, 0.4814697, 0.5235326, 0, 1, 0.8784314, 1,
-0.05717592, -0.5663392, -3.604926, 0, 1, 0.8862745, 1,
-0.05551509, -0.8459062, -2.335684, 0, 1, 0.8901961, 1,
-0.05446747, 0.6159176, 0.4926671, 0, 1, 0.8980392, 1,
-0.05178944, 0.5617611, -0.763944, 0, 1, 0.9058824, 1,
-0.04974886, 0.4103369, 0.5687249, 0, 1, 0.9098039, 1,
-0.04594143, 1.342964, 2.158687, 0, 1, 0.9176471, 1,
-0.04175425, 0.3214665, -1.297822, 0, 1, 0.9215686, 1,
-0.04060775, -0.1240984, -2.001453, 0, 1, 0.9294118, 1,
-0.04033704, 0.9005116, 0.7171534, 0, 1, 0.9333333, 1,
-0.03805311, -0.2935426, -2.445226, 0, 1, 0.9411765, 1,
-0.0366377, 0.3298132, -0.4073476, 0, 1, 0.945098, 1,
-0.03558933, -0.6797752, -2.397866, 0, 1, 0.9529412, 1,
-0.02953816, -1.423664, -2.599005, 0, 1, 0.9568627, 1,
-0.02648119, 1.364041, -0.5111281, 0, 1, 0.9647059, 1,
-0.02547804, -0.9457151, -2.641691, 0, 1, 0.9686275, 1,
-0.02357755, -0.3682691, -2.818706, 0, 1, 0.9764706, 1,
-0.02238736, 0.1849001, -0.2154452, 0, 1, 0.9803922, 1,
-0.01943949, 0.4416876, -2.169798, 0, 1, 0.9882353, 1,
-0.01855371, 1.266983, 1.174453, 0, 1, 0.9921569, 1,
-0.01834862, -0.1536233, -1.676979, 0, 1, 1, 1,
-0.01757933, 0.2619612, -0.4323955, 0, 0.9921569, 1, 1,
-0.01730574, -2.372464, -2.516566, 0, 0.9882353, 1, 1,
-0.01679634, 0.2031367, -1.069193, 0, 0.9803922, 1, 1,
-0.01568369, -0.1004121, -1.518031, 0, 0.9764706, 1, 1,
-0.01568324, -0.2689653, -3.61284, 0, 0.9686275, 1, 1,
-0.01336474, -0.5685951, -1.930851, 0, 0.9647059, 1, 1,
-0.005936678, -1.156529, -1.467303, 0, 0.9568627, 1, 1,
-0.005449532, -0.01397999, -5.344441, 0, 0.9529412, 1, 1,
-0.001912986, -0.458687, -2.924527, 0, 0.945098, 1, 1,
0.0007686146, 1.444759, -0.06008478, 0, 0.9411765, 1, 1,
0.001543653, -0.02344397, 3.884484, 0, 0.9333333, 1, 1,
0.002129199, -0.04734195, 3.359609, 0, 0.9294118, 1, 1,
0.003386003, 0.301465, 0.9383246, 0, 0.9215686, 1, 1,
0.003758109, 2.574804, 0.1706321, 0, 0.9176471, 1, 1,
0.00380136, 0.05600772, -0.5957797, 0, 0.9098039, 1, 1,
0.005504793, 1.095529, -0.1245173, 0, 0.9058824, 1, 1,
0.006555359, 0.4253172, 0.4536301, 0, 0.8980392, 1, 1,
0.00741753, 0.599894, 0.7543641, 0, 0.8901961, 1, 1,
0.007461416, -0.2099045, 3.368884, 0, 0.8862745, 1, 1,
0.008805365, 0.2245206, 0.1177744, 0, 0.8784314, 1, 1,
0.009836354, -1.107448, 2.956304, 0, 0.8745098, 1, 1,
0.01187281, 0.02847756, 1.585172, 0, 0.8666667, 1, 1,
0.01936638, -1.745637, 3.674296, 0, 0.8627451, 1, 1,
0.02057723, 0.6738595, -0.2983825, 0, 0.854902, 1, 1,
0.0247671, -0.1807326, 2.22225, 0, 0.8509804, 1, 1,
0.02634628, 0.009516592, -0.7966231, 0, 0.8431373, 1, 1,
0.02760112, -1.028898, 2.280651, 0, 0.8392157, 1, 1,
0.03104548, 1.583443, 1.216797, 0, 0.8313726, 1, 1,
0.03125339, 2.837324, 0.930639, 0, 0.827451, 1, 1,
0.03233451, 0.2036125, -1.06047, 0, 0.8196079, 1, 1,
0.03347471, 0.07364442, -0.302324, 0, 0.8156863, 1, 1,
0.03769878, -0.4568585, 1.579107, 0, 0.8078431, 1, 1,
0.05075672, -1.03576, 2.208371, 0, 0.8039216, 1, 1,
0.05190403, -0.5501533, 4.03274, 0, 0.7960784, 1, 1,
0.05604785, 0.06561638, 0.4649176, 0, 0.7882353, 1, 1,
0.05832789, -2.067872, 3.665607, 0, 0.7843137, 1, 1,
0.06112495, -0.704793, 3.603471, 0, 0.7764706, 1, 1,
0.0622649, 0.5661818, -0.04756049, 0, 0.772549, 1, 1,
0.06328765, 1.313409, 0.1423504, 0, 0.7647059, 1, 1,
0.06564701, 1.690893, 1.412146, 0, 0.7607843, 1, 1,
0.06758903, -0.3086606, 4.074162, 0, 0.7529412, 1, 1,
0.06814601, -0.7907679, 1.714283, 0, 0.7490196, 1, 1,
0.06860916, 0.8229308, 1.025614, 0, 0.7411765, 1, 1,
0.06925043, -0.1035512, 2.138925, 0, 0.7372549, 1, 1,
0.07118525, 0.9453748, 0.9449225, 0, 0.7294118, 1, 1,
0.07504444, 2.479684, -0.009876514, 0, 0.7254902, 1, 1,
0.07702026, 0.3371275, 0.2150744, 0, 0.7176471, 1, 1,
0.07858597, -0.3490112, 5.066684, 0, 0.7137255, 1, 1,
0.08031771, -0.1375289, 2.488457, 0, 0.7058824, 1, 1,
0.08425821, 0.8323617, -0.8216019, 0, 0.6980392, 1, 1,
0.08690708, -0.3379279, 1.560407, 0, 0.6941177, 1, 1,
0.08760297, -0.5161433, 4.414593, 0, 0.6862745, 1, 1,
0.08871578, -1.249694, 4.421357, 0, 0.682353, 1, 1,
0.1047335, 0.3713543, 0.9766945, 0, 0.6745098, 1, 1,
0.1085301, 0.4592807, -0.4455482, 0, 0.6705883, 1, 1,
0.1105788, 0.5655044, 0.6657268, 0, 0.6627451, 1, 1,
0.1106489, -0.8886442, 3.371199, 0, 0.6588235, 1, 1,
0.1112452, -0.7715657, 2.644434, 0, 0.6509804, 1, 1,
0.1113976, 0.508786, -0.06063528, 0, 0.6470588, 1, 1,
0.1181054, 0.4225684, -1.056663, 0, 0.6392157, 1, 1,
0.1195004, -0.08503832, 3.110831, 0, 0.6352941, 1, 1,
0.1241759, 0.7670671, 0.1194381, 0, 0.627451, 1, 1,
0.1246746, -0.2582898, 1.595367, 0, 0.6235294, 1, 1,
0.1270812, 0.3155962, 0.7373572, 0, 0.6156863, 1, 1,
0.1281625, 0.5387242, 0.8154046, 0, 0.6117647, 1, 1,
0.1292598, 0.9007212, 1.42313, 0, 0.6039216, 1, 1,
0.1306293, -0.6671407, 3.95158, 0, 0.5960785, 1, 1,
0.131227, 2.030867, -0.5138359, 0, 0.5921569, 1, 1,
0.1326491, -1.261057, 2.847535, 0, 0.5843138, 1, 1,
0.1327143, -1.711217, 4.190526, 0, 0.5803922, 1, 1,
0.1336391, -1.253484, 2.152066, 0, 0.572549, 1, 1,
0.1422538, -0.9497973, 2.948629, 0, 0.5686275, 1, 1,
0.1432435, -1.676831, 1.706805, 0, 0.5607843, 1, 1,
0.1443877, 1.37416, 0.1941927, 0, 0.5568628, 1, 1,
0.1477102, -0.8038192, 0.1533146, 0, 0.5490196, 1, 1,
0.1482681, -0.1029263, 1.60609, 0, 0.5450981, 1, 1,
0.151423, -0.8461332, 2.734382, 0, 0.5372549, 1, 1,
0.1551552, -0.5124664, 2.415949, 0, 0.5333334, 1, 1,
0.1569722, 0.4581763, 1.609593, 0, 0.5254902, 1, 1,
0.1579888, 0.1647428, 0.0887581, 0, 0.5215687, 1, 1,
0.1607606, -1.826896, 2.587488, 0, 0.5137255, 1, 1,
0.1672637, -0.3175813, 3.107832, 0, 0.509804, 1, 1,
0.1687974, -0.3791544, 4.578681, 0, 0.5019608, 1, 1,
0.1750103, -1.693885, 0.3349101, 0, 0.4941176, 1, 1,
0.1781182, 0.2160935, 0.6202862, 0, 0.4901961, 1, 1,
0.1906655, -0.368148, 1.416087, 0, 0.4823529, 1, 1,
0.1926173, -1.551673, 3.868841, 0, 0.4784314, 1, 1,
0.1944727, 2.612112, 0.674697, 0, 0.4705882, 1, 1,
0.1970454, 0.1946117, 0.7732576, 0, 0.4666667, 1, 1,
0.1971015, -1.851211, 2.820775, 0, 0.4588235, 1, 1,
0.2085773, -0.2909743, 2.393005, 0, 0.454902, 1, 1,
0.2097323, 0.20828, 0.6274719, 0, 0.4470588, 1, 1,
0.2156077, 0.3576859, 0.5095847, 0, 0.4431373, 1, 1,
0.2163734, -0.0008764412, 0.7380683, 0, 0.4352941, 1, 1,
0.2202013, -0.8548794, 3.05957, 0, 0.4313726, 1, 1,
0.2252115, -2.582699, 4.165552, 0, 0.4235294, 1, 1,
0.2256418, -0.2425124, 3.274187, 0, 0.4196078, 1, 1,
0.2321517, -0.3441714, 1.553759, 0, 0.4117647, 1, 1,
0.2331231, 1.678736, -0.1421908, 0, 0.4078431, 1, 1,
0.2337346, -0.8107852, 1.312132, 0, 0.4, 1, 1,
0.2371944, 0.2695448, 0.8044775, 0, 0.3921569, 1, 1,
0.2377085, 2.066904, -0.6619925, 0, 0.3882353, 1, 1,
0.2398123, -1.055173, 2.874855, 0, 0.3803922, 1, 1,
0.2401845, 1.002939, -0.6127369, 0, 0.3764706, 1, 1,
0.2434165, 0.466354, 0.4621441, 0, 0.3686275, 1, 1,
0.2458638, -0.02712838, 1.433795, 0, 0.3647059, 1, 1,
0.2464308, 1.683244, -0.2318213, 0, 0.3568628, 1, 1,
0.2539811, 0.3826177, -0.350439, 0, 0.3529412, 1, 1,
0.2550012, 0.532454, -0.1571622, 0, 0.345098, 1, 1,
0.2572601, -0.4833247, 2.319115, 0, 0.3411765, 1, 1,
0.2583699, -0.3650659, 1.20235, 0, 0.3333333, 1, 1,
0.2589441, 0.1862567, 0.6911139, 0, 0.3294118, 1, 1,
0.2594334, 0.5826373, -0.04052349, 0, 0.3215686, 1, 1,
0.2633615, -0.2253952, 0.6959319, 0, 0.3176471, 1, 1,
0.265276, -1.06701, 1.04087, 0, 0.3098039, 1, 1,
0.2673532, 0.5039667, 1.005553, 0, 0.3058824, 1, 1,
0.2679024, -0.9656781, 2.701129, 0, 0.2980392, 1, 1,
0.2679593, 0.9260343, -0.3396483, 0, 0.2901961, 1, 1,
0.2681334, 1.274329, 0.07940734, 0, 0.2862745, 1, 1,
0.2691394, 0.7171077, 1.613344, 0, 0.2784314, 1, 1,
0.2755973, 0.5396661, 0.4723033, 0, 0.2745098, 1, 1,
0.2794147, -0.02003978, 2.266164, 0, 0.2666667, 1, 1,
0.281429, -0.0972721, 3.181303, 0, 0.2627451, 1, 1,
0.2825959, -0.5511943, 1.46023, 0, 0.254902, 1, 1,
0.2830843, -1.11918, 4.008867, 0, 0.2509804, 1, 1,
0.2831273, -0.8857881, 3.355549, 0, 0.2431373, 1, 1,
0.2850372, -0.8089773, 3.776997, 0, 0.2392157, 1, 1,
0.2864149, -0.7706589, 1.717035, 0, 0.2313726, 1, 1,
0.2872279, 1.085692, 0.5773404, 0, 0.227451, 1, 1,
0.2876208, 0.5711376, 0.3518924, 0, 0.2196078, 1, 1,
0.2890057, 0.2012559, 1.955557, 0, 0.2156863, 1, 1,
0.2921716, 0.6157427, 0.7492695, 0, 0.2078431, 1, 1,
0.2943563, -1.322206, 2.122478, 0, 0.2039216, 1, 1,
0.2992812, 0.3902572, -0.2758224, 0, 0.1960784, 1, 1,
0.3035018, -1.20873, 2.481583, 0, 0.1882353, 1, 1,
0.3115814, 1.072837, 1.030732, 0, 0.1843137, 1, 1,
0.3119692, 0.1777075, 1.377382, 0, 0.1764706, 1, 1,
0.3129468, -1.024975, 2.433995, 0, 0.172549, 1, 1,
0.3207666, 0.6129546, 1.233586, 0, 0.1647059, 1, 1,
0.3236867, -0.6928362, 1.315608, 0, 0.1607843, 1, 1,
0.3247245, -0.4142958, 4.76677, 0, 0.1529412, 1, 1,
0.3253125, -0.256314, 2.901384, 0, 0.1490196, 1, 1,
0.3288348, 0.1717987, 0.5417994, 0, 0.1411765, 1, 1,
0.3302019, 1.234997, 2.011151, 0, 0.1372549, 1, 1,
0.3352854, -1.253788, 1.878021, 0, 0.1294118, 1, 1,
0.3384456, -1.292944, 2.359458, 0, 0.1254902, 1, 1,
0.3414378, 1.332139, -0.3459907, 0, 0.1176471, 1, 1,
0.3539425, 0.3925946, 1.814938, 0, 0.1137255, 1, 1,
0.3595801, -0.8863972, 3.121914, 0, 0.1058824, 1, 1,
0.3605183, -0.253821, 2.816297, 0, 0.09803922, 1, 1,
0.3656488, -1.920987, 0.486444, 0, 0.09411765, 1, 1,
0.3733643, -0.8995621, 1.955037, 0, 0.08627451, 1, 1,
0.37378, 0.2469152, 1.406804, 0, 0.08235294, 1, 1,
0.3739703, 1.037839, -0.4107894, 0, 0.07450981, 1, 1,
0.3768796, 0.0292778, 1.626647, 0, 0.07058824, 1, 1,
0.3769134, -0.6271095, 2.719913, 0, 0.0627451, 1, 1,
0.3786621, 0.5366881, 0.1485117, 0, 0.05882353, 1, 1,
0.3796213, 1.009762, 2.444717, 0, 0.05098039, 1, 1,
0.3810192, 1.323116, 1.093101, 0, 0.04705882, 1, 1,
0.3906345, 0.2942525, -0.5798075, 0, 0.03921569, 1, 1,
0.3938851, 1.174708, 1.84569, 0, 0.03529412, 1, 1,
0.3960667, -2.281049, 3.315018, 0, 0.02745098, 1, 1,
0.4007757, 0.4799061, 0.9618364, 0, 0.02352941, 1, 1,
0.400881, -0.9714572, 3.341124, 0, 0.01568628, 1, 1,
0.4043353, -0.8930179, 3.828448, 0, 0.01176471, 1, 1,
0.4048664, 0.6775088, -1.122653, 0, 0.003921569, 1, 1,
0.4071841, 1.190512, 0.5403727, 0.003921569, 0, 1, 1,
0.4136008, 1.253167, 0.214524, 0.007843138, 0, 1, 1,
0.4146004, 1.202862, 1.069079, 0.01568628, 0, 1, 1,
0.4150708, 0.3153843, 3.091074, 0.01960784, 0, 1, 1,
0.4187482, -0.08055575, 1.334688, 0.02745098, 0, 1, 1,
0.4211542, 2.206377, -0.3788095, 0.03137255, 0, 1, 1,
0.4219384, -0.4830469, 2.914088, 0.03921569, 0, 1, 1,
0.4252889, -0.8988949, 4.055728, 0.04313726, 0, 1, 1,
0.4254845, 0.2764446, 1.026245, 0.05098039, 0, 1, 1,
0.4296406, -0.2200782, 2.183225, 0.05490196, 0, 1, 1,
0.434677, -0.1204204, 0.9240873, 0.0627451, 0, 1, 1,
0.4386817, 0.3940473, 1.693381, 0.06666667, 0, 1, 1,
0.4402068, 0.1363604, 0.8891357, 0.07450981, 0, 1, 1,
0.4437887, -1.895033, 4.28393, 0.07843138, 0, 1, 1,
0.4461887, 0.136123, 1.259662, 0.08627451, 0, 1, 1,
0.446309, 0.2930304, 2.535159, 0.09019608, 0, 1, 1,
0.4471048, -1.7687, 3.140972, 0.09803922, 0, 1, 1,
0.4579899, 0.04766244, 1.507877, 0.1058824, 0, 1, 1,
0.4588238, -0.3292709, 2.559662, 0.1098039, 0, 1, 1,
0.4718149, -0.08522511, 1.608451, 0.1176471, 0, 1, 1,
0.4742893, 0.8879342, 0.7215717, 0.1215686, 0, 1, 1,
0.4762586, 1.475326, 0.4874579, 0.1294118, 0, 1, 1,
0.4773856, 0.9510691, 1.262465, 0.1333333, 0, 1, 1,
0.4845059, 1.739422, -1.166194, 0.1411765, 0, 1, 1,
0.4903135, -0.4642872, 3.083246, 0.145098, 0, 1, 1,
0.4917617, -0.246938, 0.02990424, 0.1529412, 0, 1, 1,
0.492024, -0.06031428, 2.66633, 0.1568628, 0, 1, 1,
0.4998019, -2.267429, 0.4534352, 0.1647059, 0, 1, 1,
0.5004007, -0.06841422, 0.1612011, 0.1686275, 0, 1, 1,
0.5085239, 0.09734058, 0.9435493, 0.1764706, 0, 1, 1,
0.5108847, -0.1792427, 1.130272, 0.1803922, 0, 1, 1,
0.5149041, -0.13244, 2.774012, 0.1882353, 0, 1, 1,
0.515205, 0.2800804, 0.3189307, 0.1921569, 0, 1, 1,
0.5161954, 0.1962621, 2.679877, 0.2, 0, 1, 1,
0.5200972, 0.5758062, 2.460194, 0.2078431, 0, 1, 1,
0.5256382, 1.127461, 0.7717523, 0.2117647, 0, 1, 1,
0.5338557, -1.109075, 2.40085, 0.2196078, 0, 1, 1,
0.5340918, -0.4881386, 1.067544, 0.2235294, 0, 1, 1,
0.5366287, 1.62231, -0.4303006, 0.2313726, 0, 1, 1,
0.5371776, 1.03319, 1.26506, 0.2352941, 0, 1, 1,
0.5376469, -0.2615815, 4.493077, 0.2431373, 0, 1, 1,
0.5393329, -0.2013586, 3.652823, 0.2470588, 0, 1, 1,
0.5398558, -0.2799472, 0.8586611, 0.254902, 0, 1, 1,
0.5408348, 1.666132, -0.6583959, 0.2588235, 0, 1, 1,
0.5418088, 0.02427379, 2.239732, 0.2666667, 0, 1, 1,
0.5431967, -0.7816997, 1.673124, 0.2705882, 0, 1, 1,
0.5450236, 0.3595116, 3.282935, 0.2784314, 0, 1, 1,
0.5452792, -0.1534761, 2.543287, 0.282353, 0, 1, 1,
0.547699, -0.255831, 1.809888, 0.2901961, 0, 1, 1,
0.548874, -0.7003886, -0.2720373, 0.2941177, 0, 1, 1,
0.557514, -1.054585, 3.080668, 0.3019608, 0, 1, 1,
0.5580782, -0.3523301, 2.956348, 0.3098039, 0, 1, 1,
0.559772, -0.2424471, 3.619084, 0.3137255, 0, 1, 1,
0.5598922, -1.12228, 1.73796, 0.3215686, 0, 1, 1,
0.5618397, -1.619219, 2.139405, 0.3254902, 0, 1, 1,
0.5694702, 0.1731572, 0.3579805, 0.3333333, 0, 1, 1,
0.5735879, 0.7156826, 2.138543, 0.3372549, 0, 1, 1,
0.5738113, 0.519046, 1.34783, 0.345098, 0, 1, 1,
0.5761543, -1.273271, 4.539243, 0.3490196, 0, 1, 1,
0.576872, -1.32722, 1.981274, 0.3568628, 0, 1, 1,
0.5771952, 0.519627, 0.5915505, 0.3607843, 0, 1, 1,
0.590883, -0.06757448, 2.215717, 0.3686275, 0, 1, 1,
0.5998442, 1.082908, -0.07059095, 0.372549, 0, 1, 1,
0.6002052, -0.09130257, 0.3061514, 0.3803922, 0, 1, 1,
0.6007696, -0.2565074, 1.316016, 0.3843137, 0, 1, 1,
0.6035022, 2.351325, 0.651807, 0.3921569, 0, 1, 1,
0.6073778, -0.6098648, 1.40453, 0.3960784, 0, 1, 1,
0.608213, -0.1558856, 3.209425, 0.4039216, 0, 1, 1,
0.610284, 0.6268721, 0.3073519, 0.4117647, 0, 1, 1,
0.6117229, 0.5231118, -1.65237, 0.4156863, 0, 1, 1,
0.6131524, 2.740595, 1.59658, 0.4235294, 0, 1, 1,
0.6212441, 1.312172, 0.9544666, 0.427451, 0, 1, 1,
0.6215816, -1.873666, 3.149318, 0.4352941, 0, 1, 1,
0.6228424, 0.02822389, 0.504414, 0.4392157, 0, 1, 1,
0.6245433, -0.05019532, 1.788111, 0.4470588, 0, 1, 1,
0.6252422, -0.6992833, 2.398058, 0.4509804, 0, 1, 1,
0.6272466, -0.7655783, 4.905709, 0.4588235, 0, 1, 1,
0.6319182, -0.3588163, 2.7773, 0.4627451, 0, 1, 1,
0.6345814, -1.393845, 3.573267, 0.4705882, 0, 1, 1,
0.636421, -1.475053, 1.920652, 0.4745098, 0, 1, 1,
0.6387165, 0.8307352, 0.4370112, 0.4823529, 0, 1, 1,
0.6405407, -0.7857798, 0.9668459, 0.4862745, 0, 1, 1,
0.6415489, 0.4882508, 0.6757768, 0.4941176, 0, 1, 1,
0.6435028, -0.8191923, 3.015988, 0.5019608, 0, 1, 1,
0.6437371, -1.21472, 2.159532, 0.5058824, 0, 1, 1,
0.645793, -0.7618735, 3.132388, 0.5137255, 0, 1, 1,
0.6499652, 1.251552, 0.08435462, 0.5176471, 0, 1, 1,
0.6505385, 0.7371118, 0.7992331, 0.5254902, 0, 1, 1,
0.6508054, 0.4708388, 0.4617795, 0.5294118, 0, 1, 1,
0.6511173, -1.25034, 1.444768, 0.5372549, 0, 1, 1,
0.6555359, 1.341242, -0.5253367, 0.5411765, 0, 1, 1,
0.6648854, -0.1761748, 4.039948, 0.5490196, 0, 1, 1,
0.6648968, -1.835316, 1.608459, 0.5529412, 0, 1, 1,
0.6742014, -1.40867, 2.965414, 0.5607843, 0, 1, 1,
0.6828668, -1.378769, 2.502736, 0.5647059, 0, 1, 1,
0.6834351, -0.9730415, 2.184765, 0.572549, 0, 1, 1,
0.6852555, 0.6299555, 1.486916, 0.5764706, 0, 1, 1,
0.6852592, 0.4651388, 1.300845, 0.5843138, 0, 1, 1,
0.6917059, -0.0106449, 1.01945, 0.5882353, 0, 1, 1,
0.6986867, -0.62884, 3.393442, 0.5960785, 0, 1, 1,
0.7054531, -0.8881666, 3.422819, 0.6039216, 0, 1, 1,
0.7076585, -0.08603358, 0.9788696, 0.6078432, 0, 1, 1,
0.7088853, 1.178199, 1.717853, 0.6156863, 0, 1, 1,
0.7161794, -0.3266658, 2.878354, 0.6196079, 0, 1, 1,
0.7188227, -1.014758, 3.092448, 0.627451, 0, 1, 1,
0.7299171, 0.1592792, 1.25312, 0.6313726, 0, 1, 1,
0.730481, 0.8009964, 0.8719374, 0.6392157, 0, 1, 1,
0.7396086, 0.9140694, 1.341032, 0.6431373, 0, 1, 1,
0.7399245, 0.8515748, 0.001281413, 0.6509804, 0, 1, 1,
0.7435179, -1.223024, 2.25983, 0.654902, 0, 1, 1,
0.7516339, -0.9877062, 3.617889, 0.6627451, 0, 1, 1,
0.755023, -0.9044631, 3.759321, 0.6666667, 0, 1, 1,
0.7589168, 0.2846317, 0.8821715, 0.6745098, 0, 1, 1,
0.7593195, -0.6376706, 3.449027, 0.6784314, 0, 1, 1,
0.7599376, -0.3922042, 1.023333, 0.6862745, 0, 1, 1,
0.7628706, -0.1222528, 0.7079685, 0.6901961, 0, 1, 1,
0.7698277, -0.007920668, 2.139203, 0.6980392, 0, 1, 1,
0.7744499, -1.328557, 2.14121, 0.7058824, 0, 1, 1,
0.7810716, -0.827593, 2.969316, 0.7098039, 0, 1, 1,
0.7898218, 0.000381131, 2.03166, 0.7176471, 0, 1, 1,
0.7912843, 1.313048, 0.3131504, 0.7215686, 0, 1, 1,
0.7943244, -0.1602637, 0.1186704, 0.7294118, 0, 1, 1,
0.7976928, 2.483921, -0.02121416, 0.7333333, 0, 1, 1,
0.8027955, -0.3277014, 2.424532, 0.7411765, 0, 1, 1,
0.8032939, -0.4257223, 1.48352, 0.7450981, 0, 1, 1,
0.8036211, -1.180763, 2.005337, 0.7529412, 0, 1, 1,
0.8057325, -0.1204033, 2.209022, 0.7568628, 0, 1, 1,
0.8076265, 0.1413188, 3.171763, 0.7647059, 0, 1, 1,
0.8081059, -0.4521597, 0.9631749, 0.7686275, 0, 1, 1,
0.809617, -0.3406035, 2.194086, 0.7764706, 0, 1, 1,
0.8114178, -0.7690505, 2.340257, 0.7803922, 0, 1, 1,
0.8168003, -1.235153, 2.694074, 0.7882353, 0, 1, 1,
0.8179444, -0.09036829, 2.023281, 0.7921569, 0, 1, 1,
0.8200021, -0.2814634, 1.743404, 0.8, 0, 1, 1,
0.8256397, -0.9407815, 1.101294, 0.8078431, 0, 1, 1,
0.826026, -1.227345, 1.642871, 0.8117647, 0, 1, 1,
0.8310524, 0.9949317, 3.577572, 0.8196079, 0, 1, 1,
0.831098, 0.194333, 2.150459, 0.8235294, 0, 1, 1,
0.8325866, -0.5230456, 3.960192, 0.8313726, 0, 1, 1,
0.8331106, -0.5131534, 1.749325, 0.8352941, 0, 1, 1,
0.834312, 0.4911128, 1.117558, 0.8431373, 0, 1, 1,
0.8383301, -0.1786081, 2.531533, 0.8470588, 0, 1, 1,
0.8384234, -0.2105442, 0.7062749, 0.854902, 0, 1, 1,
0.8409861, -2.784213, 1.620365, 0.8588235, 0, 1, 1,
0.8418904, 1.238032, 0.906624, 0.8666667, 0, 1, 1,
0.8466256, -0.5933384, 0.3622721, 0.8705882, 0, 1, 1,
0.8494491, -1.204765, 3.604516, 0.8784314, 0, 1, 1,
0.8538569, -1.096151, 2.102196, 0.8823529, 0, 1, 1,
0.8608733, 1.791311, 0.1381094, 0.8901961, 0, 1, 1,
0.864898, 0.9450256, 1.689875, 0.8941177, 0, 1, 1,
0.8679394, 1.085835, 0.46882, 0.9019608, 0, 1, 1,
0.8758383, 0.3140982, 0.8100939, 0.9098039, 0, 1, 1,
0.8761742, 0.4865707, -0.07946272, 0.9137255, 0, 1, 1,
0.8817719, 0.6105208, 1.765559, 0.9215686, 0, 1, 1,
0.8837867, 1.243329, 0.7978635, 0.9254902, 0, 1, 1,
0.891766, 0.6639295, 0.8133104, 0.9333333, 0, 1, 1,
0.8942775, -0.6529335, 0.6030367, 0.9372549, 0, 1, 1,
0.895458, -0.2438133, 1.833827, 0.945098, 0, 1, 1,
0.9121139, -0.5584902, 3.228793, 0.9490196, 0, 1, 1,
0.9130145, 0.0803495, 3.312832, 0.9568627, 0, 1, 1,
0.9190481, -1.467629, 1.777696, 0.9607843, 0, 1, 1,
0.9197758, 0.3689539, 0.9581265, 0.9686275, 0, 1, 1,
0.9291006, 0.2836167, 1.999408, 0.972549, 0, 1, 1,
0.9345561, 0.5762494, 0.200971, 0.9803922, 0, 1, 1,
0.9366702, -1.072765, 3.148421, 0.9843137, 0, 1, 1,
0.9410538, 0.3495969, 2.150347, 0.9921569, 0, 1, 1,
0.9418752, -1.526251, 3.621877, 0.9960784, 0, 1, 1,
0.9506142, 1.91399, 1.948445, 1, 0, 0.9960784, 1,
0.9516065, -1.349439, 3.080016, 1, 0, 0.9882353, 1,
0.9519923, 2.117011, -0.1483696, 1, 0, 0.9843137, 1,
0.9527444, 0.3152593, 1.114875, 1, 0, 0.9764706, 1,
0.9574833, 1.090343, -0.2245846, 1, 0, 0.972549, 1,
0.9601222, 1.161641, 1.442532, 1, 0, 0.9647059, 1,
0.9611182, 1.503543, 1.323125, 1, 0, 0.9607843, 1,
0.9615367, 0.5949468, -0.1336726, 1, 0, 0.9529412, 1,
0.9630176, -1.653826, 0.8655465, 1, 0, 0.9490196, 1,
0.973793, -1.468084, 4.228943, 1, 0, 0.9411765, 1,
0.9754692, 1.648487, 1.660834, 1, 0, 0.9372549, 1,
0.9792411, -1.09553, 3.543355, 1, 0, 0.9294118, 1,
0.986818, -0.5586723, 2.80212, 1, 0, 0.9254902, 1,
0.989281, -0.816929, 2.273052, 1, 0, 0.9176471, 1,
0.9894693, 0.8486357, -0.734717, 1, 0, 0.9137255, 1,
0.9916317, 0.1239206, 1.437566, 1, 0, 0.9058824, 1,
0.9957588, -0.6241913, 1.562873, 1, 0, 0.9019608, 1,
0.9964355, 1.203514, 0.05592534, 1, 0, 0.8941177, 1,
0.9980856, -0.6028079, 4.448298, 1, 0, 0.8862745, 1,
1.004398, 1.736855, 1.987374, 1, 0, 0.8823529, 1,
1.008733, -0.9765702, 1.700125, 1, 0, 0.8745098, 1,
1.02117, -0.4741306, 2.008356, 1, 0, 0.8705882, 1,
1.022209, 0.01054449, 2.043613, 1, 0, 0.8627451, 1,
1.022293, -2.342793, 3.932471, 1, 0, 0.8588235, 1,
1.022355, -0.1293001, 0.8690249, 1, 0, 0.8509804, 1,
1.023519, -2.86381, 2.293755, 1, 0, 0.8470588, 1,
1.03231, -1.673931, 4.126483, 1, 0, 0.8392157, 1,
1.041309, 1.379079, -0.3900288, 1, 0, 0.8352941, 1,
1.04208, -1.325348, 2.437788, 1, 0, 0.827451, 1,
1.042829, 2.003903, -0.2271723, 1, 0, 0.8235294, 1,
1.047369, 0.111896, 1.433162, 1, 0, 0.8156863, 1,
1.04851, -0.9295183, 0.2550444, 1, 0, 0.8117647, 1,
1.049329, -0.1917572, 2.108401, 1, 0, 0.8039216, 1,
1.057769, 1.745403, 1.342244, 1, 0, 0.7960784, 1,
1.06264, -0.7059841, 2.792942, 1, 0, 0.7921569, 1,
1.068922, 1.087921, 1.110438, 1, 0, 0.7843137, 1,
1.070877, -1.243265, 2.313381, 1, 0, 0.7803922, 1,
1.071224, -1.267833, 3.174566, 1, 0, 0.772549, 1,
1.081162, -0.1564879, 1.272855, 1, 0, 0.7686275, 1,
1.091001, 1.24175, 1.242082, 1, 0, 0.7607843, 1,
1.120649, 0.6161693, 0.5130269, 1, 0, 0.7568628, 1,
1.127288, -1.029028, 3.701555, 1, 0, 0.7490196, 1,
1.129765, -1.874239, 2.408622, 1, 0, 0.7450981, 1,
1.131732, -0.3588891, 0.7392794, 1, 0, 0.7372549, 1,
1.141146, 1.790191, -0.5693231, 1, 0, 0.7333333, 1,
1.142645, -0.4048298, 0.6675197, 1, 0, 0.7254902, 1,
1.150472, 3.108846, 0.7877162, 1, 0, 0.7215686, 1,
1.154637, 0.9760121, 1.256246, 1, 0, 0.7137255, 1,
1.154652, -0.4958299, 1.884694, 1, 0, 0.7098039, 1,
1.155274, -1.060586, 2.556971, 1, 0, 0.7019608, 1,
1.160237, -0.3391974, 1.754508, 1, 0, 0.6941177, 1,
1.161013, -1.399912, 1.999307, 1, 0, 0.6901961, 1,
1.163999, -1.404259, 2.301309, 1, 0, 0.682353, 1,
1.175836, -1.975964, 4.453255, 1, 0, 0.6784314, 1,
1.177467, -1.134543, 2.336324, 1, 0, 0.6705883, 1,
1.183961, -1.023527, 3.153397, 1, 0, 0.6666667, 1,
1.185963, 1.007102, 0.2502499, 1, 0, 0.6588235, 1,
1.191309, 0.7134444, 0.8186388, 1, 0, 0.654902, 1,
1.195331, 1.874725, 0.2598659, 1, 0, 0.6470588, 1,
1.195945, -0.6743482, 1.403758, 1, 0, 0.6431373, 1,
1.203514, 0.6721811, 1.160524, 1, 0, 0.6352941, 1,
1.205601, 0.5622628, 0.8690534, 1, 0, 0.6313726, 1,
1.21292, 1.235526, 1.46694, 1, 0, 0.6235294, 1,
1.21293, 0.1288763, 0.7398815, 1, 0, 0.6196079, 1,
1.214701, -0.1787315, 3.881439, 1, 0, 0.6117647, 1,
1.215539, 1.972568, -0.765591, 1, 0, 0.6078432, 1,
1.218706, -0.3523271, 2.321041, 1, 0, 0.6, 1,
1.223868, 0.8701234, 1.86341, 1, 0, 0.5921569, 1,
1.237791, 0.6965117, -0.4569344, 1, 0, 0.5882353, 1,
1.238861, -1.869876, 2.304275, 1, 0, 0.5803922, 1,
1.238964, 0.3987321, 3.143653, 1, 0, 0.5764706, 1,
1.257134, -0.9186101, 1.032393, 1, 0, 0.5686275, 1,
1.258813, -0.1100133, 1.108349, 1, 0, 0.5647059, 1,
1.262702, 2.059234, 0.3866377, 1, 0, 0.5568628, 1,
1.280735, 0.1356834, 2.273811, 1, 0, 0.5529412, 1,
1.291821, -0.7956045, 3.965371, 1, 0, 0.5450981, 1,
1.301062, -1.964293, 2.606711, 1, 0, 0.5411765, 1,
1.323209, -0.436141, 1.418705, 1, 0, 0.5333334, 1,
1.32338, -0.7785243, 0.3738723, 1, 0, 0.5294118, 1,
1.341822, -0.7337341, 1.801999, 1, 0, 0.5215687, 1,
1.344234, 0.6917821, 1.912614, 1, 0, 0.5176471, 1,
1.347873, 0.5212398, -0.3595983, 1, 0, 0.509804, 1,
1.349084, -0.9145778, 2.998685, 1, 0, 0.5058824, 1,
1.361094, 2.911822, -1.601819, 1, 0, 0.4980392, 1,
1.366339, -1.419122, 3.451436, 1, 0, 0.4901961, 1,
1.373165, 2.429692, -1.047652, 1, 0, 0.4862745, 1,
1.382161, -0.1744215, 1.890896, 1, 0, 0.4784314, 1,
1.383299, -0.8076223, 2.232028, 1, 0, 0.4745098, 1,
1.399485, -1.504042, 3.036523, 1, 0, 0.4666667, 1,
1.403391, -1.546633, 1.642593, 1, 0, 0.4627451, 1,
1.412363, 0.3746818, 1.419235, 1, 0, 0.454902, 1,
1.415663, 1.740367, 0.9558269, 1, 0, 0.4509804, 1,
1.420129, 0.07296766, 1.905746, 1, 0, 0.4431373, 1,
1.47036, -0.2934297, 1.582535, 1, 0, 0.4392157, 1,
1.47843, -0.01183776, -0.5650548, 1, 0, 0.4313726, 1,
1.487327, -1.143957, 2.216954, 1, 0, 0.427451, 1,
1.495044, -0.6858625, 1.960205, 1, 0, 0.4196078, 1,
1.498251, 1.406648, 0.5530038, 1, 0, 0.4156863, 1,
1.520592, 0.0306907, 1.139483, 1, 0, 0.4078431, 1,
1.533731, 0.6779357, 0.02814275, 1, 0, 0.4039216, 1,
1.536213, -0.7578489, 0.41191, 1, 0, 0.3960784, 1,
1.540717, 1.644828, 1.083698, 1, 0, 0.3882353, 1,
1.541784, 0.4856126, 1.804239, 1, 0, 0.3843137, 1,
1.548402, 0.9238139, 1.417477, 1, 0, 0.3764706, 1,
1.549757, 1.524823, 0.7287702, 1, 0, 0.372549, 1,
1.563248, 1.196036, -1.416508, 1, 0, 0.3647059, 1,
1.583438, 0.8841572, 2.055749, 1, 0, 0.3607843, 1,
1.585427, -0.4216645, 3.18272, 1, 0, 0.3529412, 1,
1.58696, 1.376419, 1.302722, 1, 0, 0.3490196, 1,
1.588719, -1.594408, 1.683845, 1, 0, 0.3411765, 1,
1.597588, 0.3775898, 2.6992, 1, 0, 0.3372549, 1,
1.610193, 0.616464, 0.7818897, 1, 0, 0.3294118, 1,
1.618441, -0.5887347, 1.689474, 1, 0, 0.3254902, 1,
1.619291, -0.2695292, 1.399144, 1, 0, 0.3176471, 1,
1.622274, 0.2822665, 0.6509434, 1, 0, 0.3137255, 1,
1.622983, -0.2527911, 2.477318, 1, 0, 0.3058824, 1,
1.636389, -0.411065, 0.7697746, 1, 0, 0.2980392, 1,
1.640021, -0.4313632, 1.206036, 1, 0, 0.2941177, 1,
1.645598, 0.8484168, 2.374858, 1, 0, 0.2862745, 1,
1.648277, 0.3053716, 1.641456, 1, 0, 0.282353, 1,
1.652017, -2.129302, 4.166619, 1, 0, 0.2745098, 1,
1.653468, 1.723508, 0.8128558, 1, 0, 0.2705882, 1,
1.660167, 0.1699615, 2.575926, 1, 0, 0.2627451, 1,
1.676576, -0.9469854, 1.898614, 1, 0, 0.2588235, 1,
1.678506, 0.2320811, 2.647901, 1, 0, 0.2509804, 1,
1.678756, 1.72357, 0.5177478, 1, 0, 0.2470588, 1,
1.685196, 0.05330515, 1.107267, 1, 0, 0.2392157, 1,
1.740494, 1.11509, 1.800079, 1, 0, 0.2352941, 1,
1.745443, 0.3018769, 1.007714, 1, 0, 0.227451, 1,
1.751155, -0.4450099, 3.048766, 1, 0, 0.2235294, 1,
1.765208, -0.3837079, 1.117411, 1, 0, 0.2156863, 1,
1.774704, -0.3676879, 1.446815, 1, 0, 0.2117647, 1,
1.790115, 0.1786309, 1.191265, 1, 0, 0.2039216, 1,
1.793592, 0.06356383, 1.288981, 1, 0, 0.1960784, 1,
1.8218, -2.304799, 3.11927, 1, 0, 0.1921569, 1,
1.823867, -1.243142, 2.751722, 1, 0, 0.1843137, 1,
1.828904, -0.03884181, 0.7033607, 1, 0, 0.1803922, 1,
1.831779, -2.089079, 2.35726, 1, 0, 0.172549, 1,
1.836173, -0.7833169, -0.12414, 1, 0, 0.1686275, 1,
1.838555, -1.378012, 2.367531, 1, 0, 0.1607843, 1,
1.87685, 0.1911996, 2.083672, 1, 0, 0.1568628, 1,
1.881397, -0.007378247, 0.7723151, 1, 0, 0.1490196, 1,
1.881684, -1.200057, 1.132609, 1, 0, 0.145098, 1,
1.919177, 0.7889013, 1.274247, 1, 0, 0.1372549, 1,
1.950498, -1.396062, 1.633618, 1, 0, 0.1333333, 1,
1.968862, 1.376291, -0.09062776, 1, 0, 0.1254902, 1,
2.020868, -0.5710985, 0.5908141, 1, 0, 0.1215686, 1,
2.026907, 1.279831, 2.065453, 1, 0, 0.1137255, 1,
2.041124, -0.6713721, 0.7911285, 1, 0, 0.1098039, 1,
2.041495, -0.8295189, 0.7425078, 1, 0, 0.1019608, 1,
2.086744, -0.3863669, 1.796368, 1, 0, 0.09411765, 1,
2.115506, 0.4262441, 1.217654, 1, 0, 0.09019608, 1,
2.121408, -0.2069527, 1.196974, 1, 0, 0.08235294, 1,
2.151259, -1.176809, 4.036381, 1, 0, 0.07843138, 1,
2.159379, -1.394912, 3.199878, 1, 0, 0.07058824, 1,
2.198188, -0.1180492, 2.056533, 1, 0, 0.06666667, 1,
2.225637, -0.1529222, 1.754948, 1, 0, 0.05882353, 1,
2.235878, -0.8953394, 2.756318, 1, 0, 0.05490196, 1,
2.250854, -0.7164298, 2.227102, 1, 0, 0.04705882, 1,
2.25269, -0.9138838, 0.6233602, 1, 0, 0.04313726, 1,
2.334028, 0.9642131, 1.40741, 1, 0, 0.03529412, 1,
2.344053, -0.6893552, -1.064004, 1, 0, 0.03137255, 1,
2.710175, -0.306212, 0.4120536, 1, 0, 0.02352941, 1,
2.736053, 1.408315, -0.182722, 1, 0, 0.01960784, 1,
2.87257, -0.7248675, 1.210149, 1, 0, 0.01176471, 1,
4.030861, 1.199095, 0.4444979, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.0819478, -4.137854, -7.109127, 0, -0.5, 0.5, 0.5,
0.0819478, -4.137854, -7.109127, 1, -0.5, 0.5, 0.5,
0.0819478, -4.137854, -7.109127, 1, 1.5, 0.5, 0.5,
0.0819478, -4.137854, -7.109127, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.205647, 0.01064169, -7.109127, 0, -0.5, 0.5, 0.5,
-5.205647, 0.01064169, -7.109127, 1, -0.5, 0.5, 0.5,
-5.205647, 0.01064169, -7.109127, 1, 1.5, 0.5, 0.5,
-5.205647, 0.01064169, -7.109127, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.205647, -4.137854, -0.1388786, 0, -0.5, 0.5, 0.5,
-5.205647, -4.137854, -0.1388786, 1, -0.5, 0.5, 0.5,
-5.205647, -4.137854, -0.1388786, 1, 1.5, 0.5, 0.5,
-5.205647, -4.137854, -0.1388786, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.180509, -5.500608,
4, -3.180509, -5.500608,
-2, -3.180509, -5.500608,
-2, -3.340066, -5.768695,
0, -3.180509, -5.500608,
0, -3.340066, -5.768695,
2, -3.180509, -5.500608,
2, -3.340066, -5.768695,
4, -3.180509, -5.500608,
4, -3.340066, -5.768695
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.659181, -6.304868, 0, -0.5, 0.5, 0.5,
-2, -3.659181, -6.304868, 1, -0.5, 0.5, 0.5,
-2, -3.659181, -6.304868, 1, 1.5, 0.5, 0.5,
-2, -3.659181, -6.304868, 0, 1.5, 0.5, 0.5,
0, -3.659181, -6.304868, 0, -0.5, 0.5, 0.5,
0, -3.659181, -6.304868, 1, -0.5, 0.5, 0.5,
0, -3.659181, -6.304868, 1, 1.5, 0.5, 0.5,
0, -3.659181, -6.304868, 0, 1.5, 0.5, 0.5,
2, -3.659181, -6.304868, 0, -0.5, 0.5, 0.5,
2, -3.659181, -6.304868, 1, -0.5, 0.5, 0.5,
2, -3.659181, -6.304868, 1, 1.5, 0.5, 0.5,
2, -3.659181, -6.304868, 0, 1.5, 0.5, 0.5,
4, -3.659181, -6.304868, 0, -0.5, 0.5, 0.5,
4, -3.659181, -6.304868, 1, -0.5, 0.5, 0.5,
4, -3.659181, -6.304868, 1, 1.5, 0.5, 0.5,
4, -3.659181, -6.304868, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.985433, -3, -5.500608,
-3.985433, 3, -5.500608,
-3.985433, -3, -5.500608,
-4.188802, -3, -5.768695,
-3.985433, -2, -5.500608,
-4.188802, -2, -5.768695,
-3.985433, -1, -5.500608,
-4.188802, -1, -5.768695,
-3.985433, 0, -5.500608,
-4.188802, 0, -5.768695,
-3.985433, 1, -5.500608,
-4.188802, 1, -5.768695,
-3.985433, 2, -5.500608,
-4.188802, 2, -5.768695,
-3.985433, 3, -5.500608,
-4.188802, 3, -5.768695
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.595541, -3, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, -3, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, -3, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, -3, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, -2, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, -2, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, -2, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, -2, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, -1, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, -1, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, -1, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, -1, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, 0, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, 0, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, 0, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, 0, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, 1, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, 1, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, 1, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, 1, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, 2, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, 2, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, 2, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, 2, -6.304868, 0, 1.5, 0.5, 0.5,
-4.595541, 3, -6.304868, 0, -0.5, 0.5, 0.5,
-4.595541, 3, -6.304868, 1, -0.5, 0.5, 0.5,
-4.595541, 3, -6.304868, 1, 1.5, 0.5, 0.5,
-4.595541, 3, -6.304868, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.985433, -3.180509, -4,
-3.985433, -3.180509, 4,
-3.985433, -3.180509, -4,
-4.188802, -3.340066, -4,
-3.985433, -3.180509, -2,
-4.188802, -3.340066, -2,
-3.985433, -3.180509, 0,
-4.188802, -3.340066, 0,
-3.985433, -3.180509, 2,
-4.188802, -3.340066, 2,
-3.985433, -3.180509, 4,
-4.188802, -3.340066, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.595541, -3.659181, -4, 0, -0.5, 0.5, 0.5,
-4.595541, -3.659181, -4, 1, -0.5, 0.5, 0.5,
-4.595541, -3.659181, -4, 1, 1.5, 0.5, 0.5,
-4.595541, -3.659181, -4, 0, 1.5, 0.5, 0.5,
-4.595541, -3.659181, -2, 0, -0.5, 0.5, 0.5,
-4.595541, -3.659181, -2, 1, -0.5, 0.5, 0.5,
-4.595541, -3.659181, -2, 1, 1.5, 0.5, 0.5,
-4.595541, -3.659181, -2, 0, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 0, 0, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 0, 1, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 0, 1, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 0, 0, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 2, 0, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 2, 1, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 2, 1, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 2, 0, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 4, 0, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 4, 1, -0.5, 0.5, 0.5,
-4.595541, -3.659181, 4, 1, 1.5, 0.5, 0.5,
-4.595541, -3.659181, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.985433, -3.180509, -5.500608,
-3.985433, 3.201792, -5.500608,
-3.985433, -3.180509, 5.222851,
-3.985433, 3.201792, 5.222851,
-3.985433, -3.180509, -5.500608,
-3.985433, -3.180509, 5.222851,
-3.985433, 3.201792, -5.500608,
-3.985433, 3.201792, 5.222851,
-3.985433, -3.180509, -5.500608,
4.149329, -3.180509, -5.500608,
-3.985433, -3.180509, 5.222851,
4.149329, -3.180509, 5.222851,
-3.985433, 3.201792, -5.500608,
4.149329, 3.201792, -5.500608,
-3.985433, 3.201792, 5.222851,
4.149329, 3.201792, 5.222851,
4.149329, -3.180509, -5.500608,
4.149329, 3.201792, -5.500608,
4.149329, -3.180509, 5.222851,
4.149329, 3.201792, 5.222851,
4.149329, -3.180509, -5.500608,
4.149329, -3.180509, 5.222851,
4.149329, 3.201792, -5.500608,
4.149329, 3.201792, 5.222851
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.954352;
var distance = 35.38981;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.0819478, -0.01064169, 0.1388786 );
mvMatrix.scale( 1.057241, 1.347539, 0.8020174 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38981);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Pyridate<-read.table("Pyridate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyridate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyridate' not found
```

```r
y<-Pyridate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyridate' not found
```

```r
z<-Pyridate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyridate' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.866966, -0.6764773, -1.826198, 0, 0, 1, 1, 1,
-3.240963, -1.300181, -0.1797781, 1, 0, 0, 1, 1,
-2.959219, -0.4566654, -0.6803116, 1, 0, 0, 1, 1,
-2.946448, 0.9849734, -0.1839533, 1, 0, 0, 1, 1,
-2.922938, -0.3366174, -2.548661, 1, 0, 0, 1, 1,
-2.733041, 1.064342, -1.875736, 1, 0, 0, 1, 1,
-2.505865, -1.180997, -2.549321, 0, 0, 0, 1, 1,
-2.364004, -0.08458241, -2.163047, 0, 0, 0, 1, 1,
-2.276838, -0.2153128, -2.118086, 0, 0, 0, 1, 1,
-2.224636, -1.653286, -1.648484, 0, 0, 0, 1, 1,
-2.220063, 1.439198, -0.8609858, 0, 0, 0, 1, 1,
-2.212551, -2.021452, -1.669558, 0, 0, 0, 1, 1,
-2.205167, -0.1041403, -3.391446, 0, 0, 0, 1, 1,
-2.166172, -1.752025, -3.821672, 1, 1, 1, 1, 1,
-2.130543, -1.801509, -3.42741, 1, 1, 1, 1, 1,
-2.128329, 0.3803598, -1.340594, 1, 1, 1, 1, 1,
-2.083282, -0.04803304, -2.727051, 1, 1, 1, 1, 1,
-2.06327, 1.300819, 0.009801179, 1, 1, 1, 1, 1,
-2.034068, -0.389616, -3.13549, 1, 1, 1, 1, 1,
-2.028029, -0.3545388, -1.851909, 1, 1, 1, 1, 1,
-2.003693, 0.8655601, -3.604844, 1, 1, 1, 1, 1,
-2.00035, -0.6382042, -1.516804, 1, 1, 1, 1, 1,
-1.986039, 1.572873, -2.480804, 1, 1, 1, 1, 1,
-1.97407, -1.304927, -2.050948, 1, 1, 1, 1, 1,
-1.955593, -0.6210972, -1.663316, 1, 1, 1, 1, 1,
-1.952849, 0.5977635, -1.581259, 1, 1, 1, 1, 1,
-1.951737, -1.056008, -2.179565, 1, 1, 1, 1, 1,
-1.947552, 0.1926028, -2.394357, 1, 1, 1, 1, 1,
-1.9181, 0.9071736, -1.083356, 0, 0, 1, 1, 1,
-1.867286, -1.424765, -2.312428, 1, 0, 0, 1, 1,
-1.866903, -0.5541617, -2.138789, 1, 0, 0, 1, 1,
-1.858386, 0.6797925, -0.9154752, 1, 0, 0, 1, 1,
-1.837258, 0.3263603, -1.09308, 1, 0, 0, 1, 1,
-1.833646, -0.1903094, -3.016266, 1, 0, 0, 1, 1,
-1.825453, -0.6970324, -3.866556, 0, 0, 0, 1, 1,
-1.770894, -0.5645698, -1.638744, 0, 0, 0, 1, 1,
-1.761897, 1.482238, 0.3819101, 0, 0, 0, 1, 1,
-1.759895, 1.177086, -1.194348, 0, 0, 0, 1, 1,
-1.733848, -0.018802, -1.232932, 0, 0, 0, 1, 1,
-1.732233, 1.234748, -1.343163, 0, 0, 0, 1, 1,
-1.731577, -0.3099052, -0.9169118, 0, 0, 0, 1, 1,
-1.710685, -2.464275, -0.9319479, 1, 1, 1, 1, 1,
-1.7047, 0.268368, -2.035809, 1, 1, 1, 1, 1,
-1.700999, -0.05747587, -1.29873, 1, 1, 1, 1, 1,
-1.66285, 0.01932267, -1.542751, 1, 1, 1, 1, 1,
-1.654147, 0.3157008, 0.7839997, 1, 1, 1, 1, 1,
-1.643431, 0.3088116, -0.1088574, 1, 1, 1, 1, 1,
-1.631978, -0.9468536, -1.127427, 1, 1, 1, 1, 1,
-1.625763, -0.3575577, -1.980717, 1, 1, 1, 1, 1,
-1.604279, -1.357217, -1.866393, 1, 1, 1, 1, 1,
-1.60182, 0.9561824, -0.6932105, 1, 1, 1, 1, 1,
-1.581436, -0.4650794, -2.698858, 1, 1, 1, 1, 1,
-1.572347, 1.152861, -1.013875, 1, 1, 1, 1, 1,
-1.570539, 1.425601, -0.2275784, 1, 1, 1, 1, 1,
-1.567483, -0.4185249, -3.451615, 1, 1, 1, 1, 1,
-1.553785, -0.9423544, -4.029446, 1, 1, 1, 1, 1,
-1.54069, -1.704169, -2.701514, 0, 0, 1, 1, 1,
-1.539199, 1.368535, 0.9330336, 1, 0, 0, 1, 1,
-1.538048, -0.6714716, -2.623272, 1, 0, 0, 1, 1,
-1.53084, 0.4512649, -0.4760778, 1, 0, 0, 1, 1,
-1.527755, -0.9542622, -2.642993, 1, 0, 0, 1, 1,
-1.511005, -0.8778467, -3.264259, 1, 0, 0, 1, 1,
-1.50777, -0.5131063, -1.102818, 0, 0, 0, 1, 1,
-1.501092, -0.1955272, -1.474318, 0, 0, 0, 1, 1,
-1.48226, -0.0631059, -1.416537, 0, 0, 0, 1, 1,
-1.476873, -0.3776382, -1.66064, 0, 0, 0, 1, 1,
-1.459969, 0.0398831, -3.040791, 0, 0, 0, 1, 1,
-1.45751, 1.493299, 0.4894726, 0, 0, 0, 1, 1,
-1.449066, 1.296751, -0.4671997, 0, 0, 0, 1, 1,
-1.443861, -1.391049, -3.386327, 1, 1, 1, 1, 1,
-1.431048, -0.4953443, -2.398456, 1, 1, 1, 1, 1,
-1.429264, -3.087563, -4.019865, 1, 1, 1, 1, 1,
-1.428785, -1.702091, -3.455541, 1, 1, 1, 1, 1,
-1.427517, 1.472237, -1.949216, 1, 1, 1, 1, 1,
-1.424794, -0.9835671, -2.193379, 1, 1, 1, 1, 1,
-1.423156, -0.535751, -1.550979, 1, 1, 1, 1, 1,
-1.397052, -0.6980448, -3.107594, 1, 1, 1, 1, 1,
-1.387081, 0.5775397, -1.148322, 1, 1, 1, 1, 1,
-1.37984, -0.4446149, 0.5888173, 1, 1, 1, 1, 1,
-1.376081, -0.9069059, -1.698526, 1, 1, 1, 1, 1,
-1.373212, -0.09726124, -1.880394, 1, 1, 1, 1, 1,
-1.370897, -0.2733783, -2.961743, 1, 1, 1, 1, 1,
-1.368937, 1.571993, -0.6784434, 1, 1, 1, 1, 1,
-1.360581, -0.1732564, -0.1613207, 1, 1, 1, 1, 1,
-1.358587, 2.2343, -1.03318, 0, 0, 1, 1, 1,
-1.341931, -0.5514165, -0.9485447, 1, 0, 0, 1, 1,
-1.325671, -0.4342174, -1.876597, 1, 0, 0, 1, 1,
-1.321815, 1.535066, -0.8164622, 1, 0, 0, 1, 1,
-1.320012, 0.02185222, -1.113227, 1, 0, 0, 1, 1,
-1.314313, -1.173894, -1.736623, 1, 0, 0, 1, 1,
-1.310099, 0.8794523, -2.023826, 0, 0, 0, 1, 1,
-1.297991, 0.2596138, -1.015555, 0, 0, 0, 1, 1,
-1.296897, -0.2988666, -1.485934, 0, 0, 0, 1, 1,
-1.29272, -0.1429878, -1.578977, 0, 0, 0, 1, 1,
-1.287139, -0.4937956, -1.685879, 0, 0, 0, 1, 1,
-1.28711, 0.6602725, 0.2684603, 0, 0, 0, 1, 1,
-1.282717, 0.3941897, -1.584158, 0, 0, 0, 1, 1,
-1.275137, -1.767832, -2.26709, 1, 1, 1, 1, 1,
-1.270707, -0.2709752, -1.650575, 1, 1, 1, 1, 1,
-1.268548, 0.5329405, -2.520185, 1, 1, 1, 1, 1,
-1.268251, -0.4720044, -2.25149, 1, 1, 1, 1, 1,
-1.26673, -0.3025702, -1.957918, 1, 1, 1, 1, 1,
-1.260721, 0.4757265, -1.908588, 1, 1, 1, 1, 1,
-1.252838, -1.898714, -2.605919, 1, 1, 1, 1, 1,
-1.252202, 2.38812, -0.9263914, 1, 1, 1, 1, 1,
-1.248365, -0.5746921, -1.121177, 1, 1, 1, 1, 1,
-1.247264, 1.213109, 1.320642, 1, 1, 1, 1, 1,
-1.241009, -0.5146383, -3.038568, 1, 1, 1, 1, 1,
-1.228808, 1.754602, -0.1640649, 1, 1, 1, 1, 1,
-1.221197, 1.750146, -0.6740095, 1, 1, 1, 1, 1,
-1.217867, 0.2081512, -1.050031, 1, 1, 1, 1, 1,
-1.21026, -0.973064, -2.944143, 1, 1, 1, 1, 1,
-1.206917, 0.1572981, -2.307789, 0, 0, 1, 1, 1,
-1.204768, -1.92495, -1.267501, 1, 0, 0, 1, 1,
-1.203663, 0.8441043, -0.4358659, 1, 0, 0, 1, 1,
-1.201833, 1.32269, -0.6214068, 1, 0, 0, 1, 1,
-1.197194, -0.8543704, -0.1083717, 1, 0, 0, 1, 1,
-1.19114, 0.9580622, -1.332667, 1, 0, 0, 1, 1,
-1.187633, -1.107377, -1.015368, 0, 0, 0, 1, 1,
-1.183517, 2.127505, -1.806773, 0, 0, 0, 1, 1,
-1.182152, -0.02422697, -2.424739, 0, 0, 0, 1, 1,
-1.169948, -0.5597392, -3.579921, 0, 0, 0, 1, 1,
-1.169891, -0.3157147, -3.297454, 0, 0, 0, 1, 1,
-1.168047, 0.5747266, -0.2511727, 0, 0, 0, 1, 1,
-1.167181, 0.06185923, 0.1566018, 0, 0, 0, 1, 1,
-1.165683, -0.2537602, -3.202411, 1, 1, 1, 1, 1,
-1.16472, 1.12246, -2.049089, 1, 1, 1, 1, 1,
-1.163994, -0.9339043, -3.358842, 1, 1, 1, 1, 1,
-1.158577, -0.5478018, -1.372639, 1, 1, 1, 1, 1,
-1.158571, -0.005217523, -1.346358, 1, 1, 1, 1, 1,
-1.149889, 1.520815, 0.2296697, 1, 1, 1, 1, 1,
-1.149737, -1.794406, -0.9944935, 1, 1, 1, 1, 1,
-1.144997, 0.3980551, -2.927742, 1, 1, 1, 1, 1,
-1.140253, 0.9182158, -2.284566, 1, 1, 1, 1, 1,
-1.13926, 0.2428088, -1.896415, 1, 1, 1, 1, 1,
-1.139188, 0.07454365, -0.5928393, 1, 1, 1, 1, 1,
-1.136191, -0.8451579, -2.332875, 1, 1, 1, 1, 1,
-1.134874, 0.01512288, -2.71768, 1, 1, 1, 1, 1,
-1.118634, 0.08156342, 1.328152, 1, 1, 1, 1, 1,
-1.116482, 0.7058022, 0.0119148, 1, 1, 1, 1, 1,
-1.115553, 1.420377, -0.7768571, 0, 0, 1, 1, 1,
-1.110995, 2.159352, 0.07347174, 1, 0, 0, 1, 1,
-1.104689, 0.4030949, -1.556006, 1, 0, 0, 1, 1,
-1.102069, -1.865107, -4.989007, 1, 0, 0, 1, 1,
-1.101215, 0.2702178, -0.5779954, 1, 0, 0, 1, 1,
-1.088762, 0.7812225, -1.384361, 1, 0, 0, 1, 1,
-1.086996, 0.4147236, -1.438962, 0, 0, 0, 1, 1,
-1.086738, 0.170897, 0.4985623, 0, 0, 0, 1, 1,
-1.069077, -0.4028091, -1.178361, 0, 0, 0, 1, 1,
-1.066957, -1.044568, -1.815272, 0, 0, 0, 1, 1,
-1.066326, -0.5793898, -0.3900394, 0, 0, 0, 1, 1,
-1.058347, -0.7566727, -2.825279, 0, 0, 0, 1, 1,
-1.037582, 1.263278, -0.6961368, 0, 0, 0, 1, 1,
-1.034611, 2.127668, 0.5933747, 1, 1, 1, 1, 1,
-1.032615, 0.2523406, -2.896528, 1, 1, 1, 1, 1,
-1.030467, -0.06567862, -3.992129, 1, 1, 1, 1, 1,
-1.029919, -2.154535, -3.614907, 1, 1, 1, 1, 1,
-1.024774, 0.6090606, -1.46171, 1, 1, 1, 1, 1,
-1.023926, -0.2439414, -2.641263, 1, 1, 1, 1, 1,
-1.019393, 0.6615545, -0.8164363, 1, 1, 1, 1, 1,
-1.019385, 0.5521208, -0.4556239, 1, 1, 1, 1, 1,
-1.017334, 1.76393, -1.052637, 1, 1, 1, 1, 1,
-1.016766, -1.031607, -3.750218, 1, 1, 1, 1, 1,
-1.01465, -1.305083, -1.443244, 1, 1, 1, 1, 1,
-1.011841, -1.074693, -1.131742, 1, 1, 1, 1, 1,
-1.004077, 1.791599, -0.3876162, 1, 1, 1, 1, 1,
-1.002391, 1.144235, -1.03553, 1, 1, 1, 1, 1,
-1.000083, -0.3862525, -1.056197, 1, 1, 1, 1, 1,
-0.9930953, -1.426285, -1.388035, 0, 0, 1, 1, 1,
-0.989498, -0.3706018, -0.2040098, 1, 0, 0, 1, 1,
-0.9856444, -0.7534897, -2.2199, 1, 0, 0, 1, 1,
-0.9832153, 0.953824, -1.056602, 1, 0, 0, 1, 1,
-0.9788101, 1.155209, -1.297226, 1, 0, 0, 1, 1,
-0.9719946, -0.4638087, -3.027534, 1, 0, 0, 1, 1,
-0.9706642, 0.6878635, -2.088108, 0, 0, 0, 1, 1,
-0.9622103, -1.141893, -2.526897, 0, 0, 0, 1, 1,
-0.9608921, 0.6011613, -1.507252, 0, 0, 0, 1, 1,
-0.9598217, 0.00810595, -2.267506, 0, 0, 0, 1, 1,
-0.9558985, -0.1153344, -0.3245487, 0, 0, 0, 1, 1,
-0.9496615, -1.146364, -2.198781, 0, 0, 0, 1, 1,
-0.9491429, -0.2188239, -1.406085, 0, 0, 0, 1, 1,
-0.9483269, -0.7922449, -1.376823, 1, 1, 1, 1, 1,
-0.9433123, 2.758772, 0.3760697, 1, 1, 1, 1, 1,
-0.9357661, -0.2211058, -3.734305, 1, 1, 1, 1, 1,
-0.9241287, -0.6585974, -4.137638, 1, 1, 1, 1, 1,
-0.9202721, -0.0248844, -3.823417, 1, 1, 1, 1, 1,
-0.9197363, 0.2554046, -2.059553, 1, 1, 1, 1, 1,
-0.9195638, 0.5424144, -0.1821105, 1, 1, 1, 1, 1,
-0.918408, 0.4275483, -0.9409168, 1, 1, 1, 1, 1,
-0.9178474, -2.188152, -1.253658, 1, 1, 1, 1, 1,
-0.91423, -0.5889424, -0.5709296, 1, 1, 1, 1, 1,
-0.9000164, 1.176517, 0.3457012, 1, 1, 1, 1, 1,
-0.8993773, 0.4443016, 0.141376, 1, 1, 1, 1, 1,
-0.896126, -0.3854104, -0.5290561, 1, 1, 1, 1, 1,
-0.8895146, 0.2852507, -2.161889, 1, 1, 1, 1, 1,
-0.8879622, 0.8270599, 0.7051719, 1, 1, 1, 1, 1,
-0.8804705, -1.991905, -1.115236, 0, 0, 1, 1, 1,
-0.8791283, -0.0311745, -1.471639, 1, 0, 0, 1, 1,
-0.878418, -0.7657628, -4.106954, 1, 0, 0, 1, 1,
-0.865773, 0.3321832, -0.9374849, 1, 0, 0, 1, 1,
-0.8640137, 0.8648244, -0.9337472, 1, 0, 0, 1, 1,
-0.8626042, -0.33291, -0.3090063, 1, 0, 0, 1, 1,
-0.8603971, -2.402467, -1.960013, 0, 0, 0, 1, 1,
-0.8549697, -1.001234, -3.845263, 0, 0, 0, 1, 1,
-0.8494581, -1.559234, -1.158413, 0, 0, 0, 1, 1,
-0.8431708, 1.649797, -1.007578, 0, 0, 0, 1, 1,
-0.8359905, 0.4227521, -1.255073, 0, 0, 0, 1, 1,
-0.8348005, 0.2755926, -1.566078, 0, 0, 0, 1, 1,
-0.8296695, 0.3727604, -0.2895736, 0, 0, 0, 1, 1,
-0.8261856, -0.1763878, -2.043004, 1, 1, 1, 1, 1,
-0.8251749, 0.6010457, -0.3769108, 1, 1, 1, 1, 1,
-0.8196933, 1.697967, -0.9965093, 1, 1, 1, 1, 1,
-0.8143236, 0.07141599, -3.874656, 1, 1, 1, 1, 1,
-0.8112755, 0.2819283, -3.822286, 1, 1, 1, 1, 1,
-0.8101785, 0.20588, -1.387016, 1, 1, 1, 1, 1,
-0.8050233, -0.712938, -2.858592, 1, 1, 1, 1, 1,
-0.8011433, -0.6837575, -0.7550086, 1, 1, 1, 1, 1,
-0.7964513, -1.601133, -2.226099, 1, 1, 1, 1, 1,
-0.7925581, 2.245199, 0.2736136, 1, 1, 1, 1, 1,
-0.7915454, 0.4821521, -1.98144, 1, 1, 1, 1, 1,
-0.7878596, 2.148973, 0.2290109, 1, 1, 1, 1, 1,
-0.7844067, -1.104379, -2.213548, 1, 1, 1, 1, 1,
-0.783888, -1.133604, -3.153434, 1, 1, 1, 1, 1,
-0.7812843, 0.2787858, -1.764816, 1, 1, 1, 1, 1,
-0.7797965, -0.8445397, -0.3767784, 0, 0, 1, 1, 1,
-0.7788484, -1.09919, -3.204037, 1, 0, 0, 1, 1,
-0.7728122, -0.5825513, 0.04911436, 1, 0, 0, 1, 1,
-0.7725847, 1.753106, -0.6021571, 1, 0, 0, 1, 1,
-0.7718925, 0.7448274, -1.534246, 1, 0, 0, 1, 1,
-0.7713877, 1.597006, -1.654978, 1, 0, 0, 1, 1,
-0.7659814, 0.1905821, -1.061835, 0, 0, 0, 1, 1,
-0.7630404, -0.04487531, -1.222803, 0, 0, 0, 1, 1,
-0.7593982, 0.911534, -1.9579, 0, 0, 0, 1, 1,
-0.7519409, -0.842791, -1.547533, 0, 0, 0, 1, 1,
-0.7484172, 1.666868, 0.9715197, 0, 0, 0, 1, 1,
-0.7473012, -0.7984293, -2.885142, 0, 0, 0, 1, 1,
-0.7471097, 0.5542468, -1.158842, 0, 0, 0, 1, 1,
-0.744845, 0.0715728, -0.6547311, 1, 1, 1, 1, 1,
-0.743166, 0.06890052, -3.741804, 1, 1, 1, 1, 1,
-0.7420328, -0.1356519, -0.128589, 1, 1, 1, 1, 1,
-0.7394087, 0.184366, -2.494465, 1, 1, 1, 1, 1,
-0.7336, 1.696343, -0.3409917, 1, 1, 1, 1, 1,
-0.7326182, -0.4143213, -3.367265, 1, 1, 1, 1, 1,
-0.7296854, 0.7309209, -0.8213568, 1, 1, 1, 1, 1,
-0.7237779, -0.2749504, -2.084262, 1, 1, 1, 1, 1,
-0.7222182, 1.362076, -0.4264986, 1, 1, 1, 1, 1,
-0.7193506, -0.1797274, -2.813999, 1, 1, 1, 1, 1,
-0.7180457, 1.269954, 0.09703968, 1, 1, 1, 1, 1,
-0.7168357, 1.264962, 2.068866, 1, 1, 1, 1, 1,
-0.7162741, -0.3065416, -1.532389, 1, 1, 1, 1, 1,
-0.7148263, 1.310894, -1.492911, 1, 1, 1, 1, 1,
-0.7090532, 1.173004, -0.6096999, 1, 1, 1, 1, 1,
-0.7057586, 1.101318, -1.199406, 0, 0, 1, 1, 1,
-0.7016367, 0.9286925, -0.927701, 1, 0, 0, 1, 1,
-0.7011462, -0.7301734, -0.8805228, 1, 0, 0, 1, 1,
-0.6984547, 1.38941, -1.695644, 1, 0, 0, 1, 1,
-0.6979304, 0.4762607, -1.029152, 1, 0, 0, 1, 1,
-0.6974849, 0.37714, -2.799836, 1, 0, 0, 1, 1,
-0.6889687, -0.8425301, -1.730692, 0, 0, 0, 1, 1,
-0.6888219, 1.335929, 0.6370158, 0, 0, 0, 1, 1,
-0.6862861, 1.453356, -0.09066755, 0, 0, 0, 1, 1,
-0.6732728, 0.4662108, -1.564457, 0, 0, 0, 1, 1,
-0.6730887, 1.157881, 1.001288, 0, 0, 0, 1, 1,
-0.6695197, 0.3002125, -1.145465, 0, 0, 0, 1, 1,
-0.6687556, 0.2645575, -0.8301942, 0, 0, 0, 1, 1,
-0.668272, -0.1205377, -1.606685, 1, 1, 1, 1, 1,
-0.6675436, -1.55097, -1.74358, 1, 1, 1, 1, 1,
-0.6674529, -0.1156758, -2.970703, 1, 1, 1, 1, 1,
-0.666133, -0.05143805, -1.132115, 1, 1, 1, 1, 1,
-0.6624517, 0.2681909, -0.8541797, 1, 1, 1, 1, 1,
-0.6598719, -0.122765, -2.711968, 1, 1, 1, 1, 1,
-0.6548767, 0.7494924, -0.3463703, 1, 1, 1, 1, 1,
-0.6476543, 1.222011, -0.4655172, 1, 1, 1, 1, 1,
-0.6447613, -1.152145, -2.586492, 1, 1, 1, 1, 1,
-0.6386505, -1.459245, -1.530851, 1, 1, 1, 1, 1,
-0.623246, -1.517947, -5.094185, 1, 1, 1, 1, 1,
-0.6189018, 0.4770469, -0.2247161, 1, 1, 1, 1, 1,
-0.618816, 0.07805607, -2.589786, 1, 1, 1, 1, 1,
-0.6179295, -1.172407, -0.5423799, 1, 1, 1, 1, 1,
-0.6163222, 0.6627863, -1.150709, 1, 1, 1, 1, 1,
-0.6158621, -0.2069906, -1.389799, 0, 0, 1, 1, 1,
-0.6152126, 1.780823, 0.9662524, 1, 0, 0, 1, 1,
-0.6124831, 2.162275, 1.997406, 1, 0, 0, 1, 1,
-0.6099055, 1.241667, -0.2082472, 1, 0, 0, 1, 1,
-0.6065543, 0.2996625, 0.4221643, 1, 0, 0, 1, 1,
-0.5972867, 0.1367235, 1.713776, 1, 0, 0, 1, 1,
-0.5961925, -0.2218133, -1.581283, 0, 0, 0, 1, 1,
-0.5851819, -0.1993704, -1.242282, 0, 0, 0, 1, 1,
-0.5840636, -0.4373038, -1.378647, 0, 0, 0, 1, 1,
-0.5832211, 0.5545909, -0.8538479, 0, 0, 0, 1, 1,
-0.5770433, 1.319667, 0.9968691, 0, 0, 0, 1, 1,
-0.573931, -1.492103, -0.6124012, 0, 0, 0, 1, 1,
-0.573694, -1.463172, -3.555494, 0, 0, 0, 1, 1,
-0.5688434, -0.09636351, -2.709895, 1, 1, 1, 1, 1,
-0.5681809, 0.561359, -0.5298138, 1, 1, 1, 1, 1,
-0.5675768, -0.4457272, -1.256711, 1, 1, 1, 1, 1,
-0.567341, 0.3054186, 0.05888847, 1, 1, 1, 1, 1,
-0.5631825, -0.3105434, -2.574453, 1, 1, 1, 1, 1,
-0.5627062, 1.560262, 0.6309087, 1, 1, 1, 1, 1,
-0.5601188, -0.4510264, -1.961476, 1, 1, 1, 1, 1,
-0.5577244, 0.5462961, -0.6595173, 1, 1, 1, 1, 1,
-0.5554087, 1.171805, -1.906679, 1, 1, 1, 1, 1,
-0.5517703, -0.5477777, -1.059369, 1, 1, 1, 1, 1,
-0.5512592, 0.6704636, -0.3545467, 1, 1, 1, 1, 1,
-0.5492747, -0.3104653, -2.507896, 1, 1, 1, 1, 1,
-0.5483199, -1.801027, -1.856362, 1, 1, 1, 1, 1,
-0.5460966, -0.6227939, -1.012605, 1, 1, 1, 1, 1,
-0.5453873, -1.127137, -2.855119, 1, 1, 1, 1, 1,
-0.5406415, 0.9064983, 1.142198, 0, 0, 1, 1, 1,
-0.534296, 0.5826471, -1.637908, 1, 0, 0, 1, 1,
-0.5293214, 1.360787, -0.1440517, 1, 0, 0, 1, 1,
-0.5288865, 0.1487965, -1.819874, 1, 0, 0, 1, 1,
-0.5206541, -0.04986189, -2.360344, 1, 0, 0, 1, 1,
-0.5053214, -1.389609, -2.611716, 1, 0, 0, 1, 1,
-0.5023929, 0.382247, 0.2538794, 0, 0, 0, 1, 1,
-0.5002801, -0.7213355, -1.313729, 0, 0, 0, 1, 1,
-0.4996259, 0.2545719, -0.8234549, 0, 0, 0, 1, 1,
-0.4925281, 0.2746259, -3.679103, 0, 0, 0, 1, 1,
-0.4856924, -0.4228343, -1.101571, 0, 0, 0, 1, 1,
-0.4846814, -0.7927784, -2.238436, 0, 0, 0, 1, 1,
-0.4814654, 0.6289495, -0.9890238, 0, 0, 0, 1, 1,
-0.4808111, -0.9151794, -3.165135, 1, 1, 1, 1, 1,
-0.4775279, 0.2983054, -0.6230518, 1, 1, 1, 1, 1,
-0.4756414, 0.4336922, -0.6161354, 1, 1, 1, 1, 1,
-0.4712719, 1.018192, -1.728321, 1, 1, 1, 1, 1,
-0.4677558, 1.09664, -0.3897302, 1, 1, 1, 1, 1,
-0.4672917, 0.7304241, -1.668889, 1, 1, 1, 1, 1,
-0.4641405, 0.8138811, 0.04119023, 1, 1, 1, 1, 1,
-0.4638852, 0.5996106, 0.5766702, 1, 1, 1, 1, 1,
-0.4610378, -0.1333276, -3.06816, 1, 1, 1, 1, 1,
-0.4538817, -0.3037988, -3.020157, 1, 1, 1, 1, 1,
-0.4501428, 0.755426, -1.049659, 1, 1, 1, 1, 1,
-0.4488415, -1.322636, -1.885574, 1, 1, 1, 1, 1,
-0.448495, 0.5221377, -1.748088, 1, 1, 1, 1, 1,
-0.4469059, 0.3202023, 0.6453073, 1, 1, 1, 1, 1,
-0.4457816, 0.206448, -0.7821161, 1, 1, 1, 1, 1,
-0.44129, -0.4503379, -2.015078, 0, 0, 1, 1, 1,
-0.4407968, 1.112226, -0.2617051, 1, 0, 0, 1, 1,
-0.430811, -1.226362, -2.108035, 1, 0, 0, 1, 1,
-0.4294934, -0.3408861, -1.606356, 1, 0, 0, 1, 1,
-0.4274208, 1.774189, -1.216362, 1, 0, 0, 1, 1,
-0.4241597, 1.830116, -0.04986687, 1, 0, 0, 1, 1,
-0.4237286, 1.104433, -1.365686, 0, 0, 0, 1, 1,
-0.4208679, 0.004932428, -1.997751, 0, 0, 0, 1, 1,
-0.4207131, -0.9669048, -2.017541, 0, 0, 0, 1, 1,
-0.4180067, 1.131751, -0.7058209, 0, 0, 0, 1, 1,
-0.4174103, -2.116614, -3.670464, 0, 0, 0, 1, 1,
-0.4166222, -1.139155, -1.781533, 0, 0, 0, 1, 1,
-0.4137725, -0.4072343, -2.56331, 0, 0, 0, 1, 1,
-0.4133285, 1.192603, 0.5712841, 1, 1, 1, 1, 1,
-0.4084145, 0.3412319, 1.330308, 1, 1, 1, 1, 1,
-0.4076039, 0.4467445, -1.488344, 1, 1, 1, 1, 1,
-0.4051047, 0.9325629, -0.1664279, 1, 1, 1, 1, 1,
-0.4044614, 1.094694, 1.582671, 1, 1, 1, 1, 1,
-0.4020529, -0.8969158, -3.386373, 1, 1, 1, 1, 1,
-0.396481, 1.387381, 0.1460873, 1, 1, 1, 1, 1,
-0.3951961, -0.9996406, -2.87034, 1, 1, 1, 1, 1,
-0.3951858, -2.613029, -3.666208, 1, 1, 1, 1, 1,
-0.3915578, -0.4742335, -1.73428, 1, 1, 1, 1, 1,
-0.389114, -1.373234, -1.51943, 1, 1, 1, 1, 1,
-0.3860108, -1.312663, -2.680341, 1, 1, 1, 1, 1,
-0.384584, 1.773692, -0.3693586, 1, 1, 1, 1, 1,
-0.3838532, -0.5347117, -3.666968, 1, 1, 1, 1, 1,
-0.3817217, -0.6544762, -3.246949, 1, 1, 1, 1, 1,
-0.3816878, -1.687057, -3.502712, 0, 0, 1, 1, 1,
-0.3787302, 0.03012885, -2.960516, 1, 0, 0, 1, 1,
-0.3781881, 0.1966813, -1.146364, 1, 0, 0, 1, 1,
-0.3758423, -0.1663131, -2.473223, 1, 0, 0, 1, 1,
-0.3734538, 0.2245551, -0.8698378, 1, 0, 0, 1, 1,
-0.3706334, 0.249322, -1.701153, 1, 0, 0, 1, 1,
-0.3700138, -0.8178828, -2.215908, 0, 0, 0, 1, 1,
-0.3697884, 1.176941, -0.9717079, 0, 0, 0, 1, 1,
-0.3683914, -0.6550174, -2.484839, 0, 0, 0, 1, 1,
-0.3621431, -1.185253, -1.180004, 0, 0, 0, 1, 1,
-0.3549842, 1.692717, 1.361469, 0, 0, 0, 1, 1,
-0.35484, 1.826405, -0.4614103, 0, 0, 0, 1, 1,
-0.3532034, 0.05320212, -1.789515, 0, 0, 0, 1, 1,
-0.3498186, 2.020395, -0.08767582, 1, 1, 1, 1, 1,
-0.3469578, -1.748156, -2.171968, 1, 1, 1, 1, 1,
-0.3407406, 0.08582116, -0.5152513, 1, 1, 1, 1, 1,
-0.3396299, 0.3088972, -1.883973, 1, 1, 1, 1, 1,
-0.3393192, 0.3303475, -1.472795, 1, 1, 1, 1, 1,
-0.3326851, -2.260175, -2.559391, 1, 1, 1, 1, 1,
-0.3305137, 0.4147557, -0.821306, 1, 1, 1, 1, 1,
-0.3284782, 0.8885731, -0.7797322, 1, 1, 1, 1, 1,
-0.3268093, -0.635354, -2.979326, 1, 1, 1, 1, 1,
-0.3241042, 1.267852, -1.746291, 1, 1, 1, 1, 1,
-0.3239468, -0.5999794, -3.993061, 1, 1, 1, 1, 1,
-0.3233209, 1.348324, 0.1418045, 1, 1, 1, 1, 1,
-0.3231938, 0.3255296, -2.290786, 1, 1, 1, 1, 1,
-0.3227681, 1.168089, 0.6366137, 1, 1, 1, 1, 1,
-0.320498, 0.3446067, -2.163648, 1, 1, 1, 1, 1,
-0.3177229, 1.647328, 0.7223465, 0, 0, 1, 1, 1,
-0.3127989, -0.4379225, -0.8944819, 1, 0, 0, 1, 1,
-0.3094858, 1.069209, -0.005247151, 1, 0, 0, 1, 1,
-0.3031946, 0.3033356, -0.4340936, 1, 0, 0, 1, 1,
-0.3014945, -0.3842749, -3.733583, 1, 0, 0, 1, 1,
-0.2926493, -0.5879326, -3.738496, 1, 0, 0, 1, 1,
-0.2907364, -0.8809339, -3.005376, 0, 0, 0, 1, 1,
-0.2901713, 0.4037883, 0.1979111, 0, 0, 0, 1, 1,
-0.2856924, 1.159311, -0.118724, 0, 0, 0, 1, 1,
-0.2851879, -0.7866303, -1.49645, 0, 0, 0, 1, 1,
-0.2826046, 0.3291691, -0.5994421, 0, 0, 0, 1, 1,
-0.2805496, 1.028674, -0.1689333, 0, 0, 0, 1, 1,
-0.2764708, 1.288341, 1.289273, 0, 0, 0, 1, 1,
-0.2748669, 0.5838405, 0.7282289, 1, 1, 1, 1, 1,
-0.2728459, 0.5110647, -0.5718208, 1, 1, 1, 1, 1,
-0.268922, 0.7864508, -0.3438497, 1, 1, 1, 1, 1,
-0.268736, 0.0212988, -1.699283, 1, 1, 1, 1, 1,
-0.2681429, -0.07510952, -2.97419, 1, 1, 1, 1, 1,
-0.2642651, 0.2582924, -0.5130816, 1, 1, 1, 1, 1,
-0.2616007, -1.770357, -1.499451, 1, 1, 1, 1, 1,
-0.2574164, 0.253389, -0.3525045, 1, 1, 1, 1, 1,
-0.2564883, -2.21746, -2.76745, 1, 1, 1, 1, 1,
-0.2556778, 2.22785, 0.484, 1, 1, 1, 1, 1,
-0.2543883, 0.006975774, -1.23885, 1, 1, 1, 1, 1,
-0.2499412, 0.4806464, 0.3395857, 1, 1, 1, 1, 1,
-0.2468777, 0.4606364, -1.90182, 1, 1, 1, 1, 1,
-0.2467455, 0.5207221, -1.238277, 1, 1, 1, 1, 1,
-0.2436534, -0.04214714, -1.515109, 1, 1, 1, 1, 1,
-0.2394413, 0.5002713, -0.7958652, 0, 0, 1, 1, 1,
-0.2389015, 0.2520245, -0.7976589, 1, 0, 0, 1, 1,
-0.2344383, 1.164122, -0.3068371, 1, 0, 0, 1, 1,
-0.2316612, -1.003619, -4.878134, 1, 0, 0, 1, 1,
-0.2301014, 0.2404638, -1.421602, 1, 0, 0, 1, 1,
-0.2295913, -1.528124, -2.105957, 1, 0, 0, 1, 1,
-0.2294664, 0.91895, 0.6627435, 0, 0, 0, 1, 1,
-0.2261749, -0.3365484, -2.54627, 0, 0, 0, 1, 1,
-0.2256005, 1.994764, -0.3322397, 0, 0, 0, 1, 1,
-0.2153493, -1.231931, -2.470687, 0, 0, 0, 1, 1,
-0.212995, -0.5233063, -3.614072, 0, 0, 0, 1, 1,
-0.2129157, 0.5501934, -1.133922, 0, 0, 0, 1, 1,
-0.211551, 1.221426, -1.449023, 0, 0, 0, 1, 1,
-0.2099717, 0.9576843, -2.212357, 1, 1, 1, 1, 1,
-0.2041193, 0.5728055, 0.0949128, 1, 1, 1, 1, 1,
-0.1965333, -0.4837544, -3.551238, 1, 1, 1, 1, 1,
-0.1944158, -0.8073549, -3.14019, 1, 1, 1, 1, 1,
-0.190005, -0.2766063, -3.119915, 1, 1, 1, 1, 1,
-0.1878723, 1.289521, 0.06945696, 1, 1, 1, 1, 1,
-0.1878222, -0.4324881, -4.691056, 1, 1, 1, 1, 1,
-0.1846416, -1.832847, -4.830289, 1, 1, 1, 1, 1,
-0.1828368, -1.223852, -3.310349, 1, 1, 1, 1, 1,
-0.1710557, -0.893398, -3.082078, 1, 1, 1, 1, 1,
-0.1664218, 1.060007, -0.07743354, 1, 1, 1, 1, 1,
-0.1592938, 0.6606337, 0.4366126, 1, 1, 1, 1, 1,
-0.1589999, 0.8195701, -2.194769, 1, 1, 1, 1, 1,
-0.1533676, 0.2327751, -0.5364304, 1, 1, 1, 1, 1,
-0.1477875, 0.05935065, -0.6205708, 1, 1, 1, 1, 1,
-0.1428476, 0.431248, -1.704386, 0, 0, 1, 1, 1,
-0.1384447, 0.02181677, -0.7396516, 1, 0, 0, 1, 1,
-0.1299098, -0.5206501, -3.099252, 1, 0, 0, 1, 1,
-0.1286149, 2.394197, -1.341578, 1, 0, 0, 1, 1,
-0.1263242, 1.716466, -1.415413, 1, 0, 0, 1, 1,
-0.124128, 2.913129, -1.957003, 1, 0, 0, 1, 1,
-0.121121, 0.4472456, -0.1943936, 0, 0, 0, 1, 1,
-0.1130636, -1.56834, -2.437083, 0, 0, 0, 1, 1,
-0.1112009, -2.074211, -3.376621, 0, 0, 0, 1, 1,
-0.111072, 0.6965898, 0.7648615, 0, 0, 0, 1, 1,
-0.1106082, 1.642558, 1.037248, 0, 0, 0, 1, 1,
-0.1098015, -0.7055181, -3.159547, 0, 0, 0, 1, 1,
-0.1090495, 0.2807304, 0.3721276, 0, 0, 0, 1, 1,
-0.1084349, -0.06631311, -2.848016, 1, 1, 1, 1, 1,
-0.1033596, -0.3562736, -3.182647, 1, 1, 1, 1, 1,
-0.09971521, 0.4738494, -0.6999485, 1, 1, 1, 1, 1,
-0.09342442, 0.1076893, 0.4236217, 1, 1, 1, 1, 1,
-0.09283715, 1.204963, -0.5809966, 1, 1, 1, 1, 1,
-0.08952598, 0.3934773, -0.4660261, 1, 1, 1, 1, 1,
-0.08757155, 0.07818174, -0.6328272, 1, 1, 1, 1, 1,
-0.08576513, -0.2754142, -0.6488987, 1, 1, 1, 1, 1,
-0.08331239, -0.4355276, -4.320378, 1, 1, 1, 1, 1,
-0.08046524, -1.32083, -2.39, 1, 1, 1, 1, 1,
-0.07991176, 0.6331869, -0.07538644, 1, 1, 1, 1, 1,
-0.07986213, 0.8022544, 0.6926523, 1, 1, 1, 1, 1,
-0.07799491, -0.266633, -3.661806, 1, 1, 1, 1, 1,
-0.07588556, -0.4811809, -3.404394, 1, 1, 1, 1, 1,
-0.07347432, -0.02951546, -2.051241, 1, 1, 1, 1, 1,
-0.07216465, -1.02627, -5.212063, 0, 0, 1, 1, 1,
-0.06456666, 1.852595, 0.8197863, 1, 0, 0, 1, 1,
-0.06250086, -1.286727, -3.12675, 1, 0, 0, 1, 1,
-0.06128591, -0.3869346, -3.187305, 1, 0, 0, 1, 1,
-0.0572007, 0.4814697, 0.5235326, 1, 0, 0, 1, 1,
-0.05717592, -0.5663392, -3.604926, 1, 0, 0, 1, 1,
-0.05551509, -0.8459062, -2.335684, 0, 0, 0, 1, 1,
-0.05446747, 0.6159176, 0.4926671, 0, 0, 0, 1, 1,
-0.05178944, 0.5617611, -0.763944, 0, 0, 0, 1, 1,
-0.04974886, 0.4103369, 0.5687249, 0, 0, 0, 1, 1,
-0.04594143, 1.342964, 2.158687, 0, 0, 0, 1, 1,
-0.04175425, 0.3214665, -1.297822, 0, 0, 0, 1, 1,
-0.04060775, -0.1240984, -2.001453, 0, 0, 0, 1, 1,
-0.04033704, 0.9005116, 0.7171534, 1, 1, 1, 1, 1,
-0.03805311, -0.2935426, -2.445226, 1, 1, 1, 1, 1,
-0.0366377, 0.3298132, -0.4073476, 1, 1, 1, 1, 1,
-0.03558933, -0.6797752, -2.397866, 1, 1, 1, 1, 1,
-0.02953816, -1.423664, -2.599005, 1, 1, 1, 1, 1,
-0.02648119, 1.364041, -0.5111281, 1, 1, 1, 1, 1,
-0.02547804, -0.9457151, -2.641691, 1, 1, 1, 1, 1,
-0.02357755, -0.3682691, -2.818706, 1, 1, 1, 1, 1,
-0.02238736, 0.1849001, -0.2154452, 1, 1, 1, 1, 1,
-0.01943949, 0.4416876, -2.169798, 1, 1, 1, 1, 1,
-0.01855371, 1.266983, 1.174453, 1, 1, 1, 1, 1,
-0.01834862, -0.1536233, -1.676979, 1, 1, 1, 1, 1,
-0.01757933, 0.2619612, -0.4323955, 1, 1, 1, 1, 1,
-0.01730574, -2.372464, -2.516566, 1, 1, 1, 1, 1,
-0.01679634, 0.2031367, -1.069193, 1, 1, 1, 1, 1,
-0.01568369, -0.1004121, -1.518031, 0, 0, 1, 1, 1,
-0.01568324, -0.2689653, -3.61284, 1, 0, 0, 1, 1,
-0.01336474, -0.5685951, -1.930851, 1, 0, 0, 1, 1,
-0.005936678, -1.156529, -1.467303, 1, 0, 0, 1, 1,
-0.005449532, -0.01397999, -5.344441, 1, 0, 0, 1, 1,
-0.001912986, -0.458687, -2.924527, 1, 0, 0, 1, 1,
0.0007686146, 1.444759, -0.06008478, 0, 0, 0, 1, 1,
0.001543653, -0.02344397, 3.884484, 0, 0, 0, 1, 1,
0.002129199, -0.04734195, 3.359609, 0, 0, 0, 1, 1,
0.003386003, 0.301465, 0.9383246, 0, 0, 0, 1, 1,
0.003758109, 2.574804, 0.1706321, 0, 0, 0, 1, 1,
0.00380136, 0.05600772, -0.5957797, 0, 0, 0, 1, 1,
0.005504793, 1.095529, -0.1245173, 0, 0, 0, 1, 1,
0.006555359, 0.4253172, 0.4536301, 1, 1, 1, 1, 1,
0.00741753, 0.599894, 0.7543641, 1, 1, 1, 1, 1,
0.007461416, -0.2099045, 3.368884, 1, 1, 1, 1, 1,
0.008805365, 0.2245206, 0.1177744, 1, 1, 1, 1, 1,
0.009836354, -1.107448, 2.956304, 1, 1, 1, 1, 1,
0.01187281, 0.02847756, 1.585172, 1, 1, 1, 1, 1,
0.01936638, -1.745637, 3.674296, 1, 1, 1, 1, 1,
0.02057723, 0.6738595, -0.2983825, 1, 1, 1, 1, 1,
0.0247671, -0.1807326, 2.22225, 1, 1, 1, 1, 1,
0.02634628, 0.009516592, -0.7966231, 1, 1, 1, 1, 1,
0.02760112, -1.028898, 2.280651, 1, 1, 1, 1, 1,
0.03104548, 1.583443, 1.216797, 1, 1, 1, 1, 1,
0.03125339, 2.837324, 0.930639, 1, 1, 1, 1, 1,
0.03233451, 0.2036125, -1.06047, 1, 1, 1, 1, 1,
0.03347471, 0.07364442, -0.302324, 1, 1, 1, 1, 1,
0.03769878, -0.4568585, 1.579107, 0, 0, 1, 1, 1,
0.05075672, -1.03576, 2.208371, 1, 0, 0, 1, 1,
0.05190403, -0.5501533, 4.03274, 1, 0, 0, 1, 1,
0.05604785, 0.06561638, 0.4649176, 1, 0, 0, 1, 1,
0.05832789, -2.067872, 3.665607, 1, 0, 0, 1, 1,
0.06112495, -0.704793, 3.603471, 1, 0, 0, 1, 1,
0.0622649, 0.5661818, -0.04756049, 0, 0, 0, 1, 1,
0.06328765, 1.313409, 0.1423504, 0, 0, 0, 1, 1,
0.06564701, 1.690893, 1.412146, 0, 0, 0, 1, 1,
0.06758903, -0.3086606, 4.074162, 0, 0, 0, 1, 1,
0.06814601, -0.7907679, 1.714283, 0, 0, 0, 1, 1,
0.06860916, 0.8229308, 1.025614, 0, 0, 0, 1, 1,
0.06925043, -0.1035512, 2.138925, 0, 0, 0, 1, 1,
0.07118525, 0.9453748, 0.9449225, 1, 1, 1, 1, 1,
0.07504444, 2.479684, -0.009876514, 1, 1, 1, 1, 1,
0.07702026, 0.3371275, 0.2150744, 1, 1, 1, 1, 1,
0.07858597, -0.3490112, 5.066684, 1, 1, 1, 1, 1,
0.08031771, -0.1375289, 2.488457, 1, 1, 1, 1, 1,
0.08425821, 0.8323617, -0.8216019, 1, 1, 1, 1, 1,
0.08690708, -0.3379279, 1.560407, 1, 1, 1, 1, 1,
0.08760297, -0.5161433, 4.414593, 1, 1, 1, 1, 1,
0.08871578, -1.249694, 4.421357, 1, 1, 1, 1, 1,
0.1047335, 0.3713543, 0.9766945, 1, 1, 1, 1, 1,
0.1085301, 0.4592807, -0.4455482, 1, 1, 1, 1, 1,
0.1105788, 0.5655044, 0.6657268, 1, 1, 1, 1, 1,
0.1106489, -0.8886442, 3.371199, 1, 1, 1, 1, 1,
0.1112452, -0.7715657, 2.644434, 1, 1, 1, 1, 1,
0.1113976, 0.508786, -0.06063528, 1, 1, 1, 1, 1,
0.1181054, 0.4225684, -1.056663, 0, 0, 1, 1, 1,
0.1195004, -0.08503832, 3.110831, 1, 0, 0, 1, 1,
0.1241759, 0.7670671, 0.1194381, 1, 0, 0, 1, 1,
0.1246746, -0.2582898, 1.595367, 1, 0, 0, 1, 1,
0.1270812, 0.3155962, 0.7373572, 1, 0, 0, 1, 1,
0.1281625, 0.5387242, 0.8154046, 1, 0, 0, 1, 1,
0.1292598, 0.9007212, 1.42313, 0, 0, 0, 1, 1,
0.1306293, -0.6671407, 3.95158, 0, 0, 0, 1, 1,
0.131227, 2.030867, -0.5138359, 0, 0, 0, 1, 1,
0.1326491, -1.261057, 2.847535, 0, 0, 0, 1, 1,
0.1327143, -1.711217, 4.190526, 0, 0, 0, 1, 1,
0.1336391, -1.253484, 2.152066, 0, 0, 0, 1, 1,
0.1422538, -0.9497973, 2.948629, 0, 0, 0, 1, 1,
0.1432435, -1.676831, 1.706805, 1, 1, 1, 1, 1,
0.1443877, 1.37416, 0.1941927, 1, 1, 1, 1, 1,
0.1477102, -0.8038192, 0.1533146, 1, 1, 1, 1, 1,
0.1482681, -0.1029263, 1.60609, 1, 1, 1, 1, 1,
0.151423, -0.8461332, 2.734382, 1, 1, 1, 1, 1,
0.1551552, -0.5124664, 2.415949, 1, 1, 1, 1, 1,
0.1569722, 0.4581763, 1.609593, 1, 1, 1, 1, 1,
0.1579888, 0.1647428, 0.0887581, 1, 1, 1, 1, 1,
0.1607606, -1.826896, 2.587488, 1, 1, 1, 1, 1,
0.1672637, -0.3175813, 3.107832, 1, 1, 1, 1, 1,
0.1687974, -0.3791544, 4.578681, 1, 1, 1, 1, 1,
0.1750103, -1.693885, 0.3349101, 1, 1, 1, 1, 1,
0.1781182, 0.2160935, 0.6202862, 1, 1, 1, 1, 1,
0.1906655, -0.368148, 1.416087, 1, 1, 1, 1, 1,
0.1926173, -1.551673, 3.868841, 1, 1, 1, 1, 1,
0.1944727, 2.612112, 0.674697, 0, 0, 1, 1, 1,
0.1970454, 0.1946117, 0.7732576, 1, 0, 0, 1, 1,
0.1971015, -1.851211, 2.820775, 1, 0, 0, 1, 1,
0.2085773, -0.2909743, 2.393005, 1, 0, 0, 1, 1,
0.2097323, 0.20828, 0.6274719, 1, 0, 0, 1, 1,
0.2156077, 0.3576859, 0.5095847, 1, 0, 0, 1, 1,
0.2163734, -0.0008764412, 0.7380683, 0, 0, 0, 1, 1,
0.2202013, -0.8548794, 3.05957, 0, 0, 0, 1, 1,
0.2252115, -2.582699, 4.165552, 0, 0, 0, 1, 1,
0.2256418, -0.2425124, 3.274187, 0, 0, 0, 1, 1,
0.2321517, -0.3441714, 1.553759, 0, 0, 0, 1, 1,
0.2331231, 1.678736, -0.1421908, 0, 0, 0, 1, 1,
0.2337346, -0.8107852, 1.312132, 0, 0, 0, 1, 1,
0.2371944, 0.2695448, 0.8044775, 1, 1, 1, 1, 1,
0.2377085, 2.066904, -0.6619925, 1, 1, 1, 1, 1,
0.2398123, -1.055173, 2.874855, 1, 1, 1, 1, 1,
0.2401845, 1.002939, -0.6127369, 1, 1, 1, 1, 1,
0.2434165, 0.466354, 0.4621441, 1, 1, 1, 1, 1,
0.2458638, -0.02712838, 1.433795, 1, 1, 1, 1, 1,
0.2464308, 1.683244, -0.2318213, 1, 1, 1, 1, 1,
0.2539811, 0.3826177, -0.350439, 1, 1, 1, 1, 1,
0.2550012, 0.532454, -0.1571622, 1, 1, 1, 1, 1,
0.2572601, -0.4833247, 2.319115, 1, 1, 1, 1, 1,
0.2583699, -0.3650659, 1.20235, 1, 1, 1, 1, 1,
0.2589441, 0.1862567, 0.6911139, 1, 1, 1, 1, 1,
0.2594334, 0.5826373, -0.04052349, 1, 1, 1, 1, 1,
0.2633615, -0.2253952, 0.6959319, 1, 1, 1, 1, 1,
0.265276, -1.06701, 1.04087, 1, 1, 1, 1, 1,
0.2673532, 0.5039667, 1.005553, 0, 0, 1, 1, 1,
0.2679024, -0.9656781, 2.701129, 1, 0, 0, 1, 1,
0.2679593, 0.9260343, -0.3396483, 1, 0, 0, 1, 1,
0.2681334, 1.274329, 0.07940734, 1, 0, 0, 1, 1,
0.2691394, 0.7171077, 1.613344, 1, 0, 0, 1, 1,
0.2755973, 0.5396661, 0.4723033, 1, 0, 0, 1, 1,
0.2794147, -0.02003978, 2.266164, 0, 0, 0, 1, 1,
0.281429, -0.0972721, 3.181303, 0, 0, 0, 1, 1,
0.2825959, -0.5511943, 1.46023, 0, 0, 0, 1, 1,
0.2830843, -1.11918, 4.008867, 0, 0, 0, 1, 1,
0.2831273, -0.8857881, 3.355549, 0, 0, 0, 1, 1,
0.2850372, -0.8089773, 3.776997, 0, 0, 0, 1, 1,
0.2864149, -0.7706589, 1.717035, 0, 0, 0, 1, 1,
0.2872279, 1.085692, 0.5773404, 1, 1, 1, 1, 1,
0.2876208, 0.5711376, 0.3518924, 1, 1, 1, 1, 1,
0.2890057, 0.2012559, 1.955557, 1, 1, 1, 1, 1,
0.2921716, 0.6157427, 0.7492695, 1, 1, 1, 1, 1,
0.2943563, -1.322206, 2.122478, 1, 1, 1, 1, 1,
0.2992812, 0.3902572, -0.2758224, 1, 1, 1, 1, 1,
0.3035018, -1.20873, 2.481583, 1, 1, 1, 1, 1,
0.3115814, 1.072837, 1.030732, 1, 1, 1, 1, 1,
0.3119692, 0.1777075, 1.377382, 1, 1, 1, 1, 1,
0.3129468, -1.024975, 2.433995, 1, 1, 1, 1, 1,
0.3207666, 0.6129546, 1.233586, 1, 1, 1, 1, 1,
0.3236867, -0.6928362, 1.315608, 1, 1, 1, 1, 1,
0.3247245, -0.4142958, 4.76677, 1, 1, 1, 1, 1,
0.3253125, -0.256314, 2.901384, 1, 1, 1, 1, 1,
0.3288348, 0.1717987, 0.5417994, 1, 1, 1, 1, 1,
0.3302019, 1.234997, 2.011151, 0, 0, 1, 1, 1,
0.3352854, -1.253788, 1.878021, 1, 0, 0, 1, 1,
0.3384456, -1.292944, 2.359458, 1, 0, 0, 1, 1,
0.3414378, 1.332139, -0.3459907, 1, 0, 0, 1, 1,
0.3539425, 0.3925946, 1.814938, 1, 0, 0, 1, 1,
0.3595801, -0.8863972, 3.121914, 1, 0, 0, 1, 1,
0.3605183, -0.253821, 2.816297, 0, 0, 0, 1, 1,
0.3656488, -1.920987, 0.486444, 0, 0, 0, 1, 1,
0.3733643, -0.8995621, 1.955037, 0, 0, 0, 1, 1,
0.37378, 0.2469152, 1.406804, 0, 0, 0, 1, 1,
0.3739703, 1.037839, -0.4107894, 0, 0, 0, 1, 1,
0.3768796, 0.0292778, 1.626647, 0, 0, 0, 1, 1,
0.3769134, -0.6271095, 2.719913, 0, 0, 0, 1, 1,
0.3786621, 0.5366881, 0.1485117, 1, 1, 1, 1, 1,
0.3796213, 1.009762, 2.444717, 1, 1, 1, 1, 1,
0.3810192, 1.323116, 1.093101, 1, 1, 1, 1, 1,
0.3906345, 0.2942525, -0.5798075, 1, 1, 1, 1, 1,
0.3938851, 1.174708, 1.84569, 1, 1, 1, 1, 1,
0.3960667, -2.281049, 3.315018, 1, 1, 1, 1, 1,
0.4007757, 0.4799061, 0.9618364, 1, 1, 1, 1, 1,
0.400881, -0.9714572, 3.341124, 1, 1, 1, 1, 1,
0.4043353, -0.8930179, 3.828448, 1, 1, 1, 1, 1,
0.4048664, 0.6775088, -1.122653, 1, 1, 1, 1, 1,
0.4071841, 1.190512, 0.5403727, 1, 1, 1, 1, 1,
0.4136008, 1.253167, 0.214524, 1, 1, 1, 1, 1,
0.4146004, 1.202862, 1.069079, 1, 1, 1, 1, 1,
0.4150708, 0.3153843, 3.091074, 1, 1, 1, 1, 1,
0.4187482, -0.08055575, 1.334688, 1, 1, 1, 1, 1,
0.4211542, 2.206377, -0.3788095, 0, 0, 1, 1, 1,
0.4219384, -0.4830469, 2.914088, 1, 0, 0, 1, 1,
0.4252889, -0.8988949, 4.055728, 1, 0, 0, 1, 1,
0.4254845, 0.2764446, 1.026245, 1, 0, 0, 1, 1,
0.4296406, -0.2200782, 2.183225, 1, 0, 0, 1, 1,
0.434677, -0.1204204, 0.9240873, 1, 0, 0, 1, 1,
0.4386817, 0.3940473, 1.693381, 0, 0, 0, 1, 1,
0.4402068, 0.1363604, 0.8891357, 0, 0, 0, 1, 1,
0.4437887, -1.895033, 4.28393, 0, 0, 0, 1, 1,
0.4461887, 0.136123, 1.259662, 0, 0, 0, 1, 1,
0.446309, 0.2930304, 2.535159, 0, 0, 0, 1, 1,
0.4471048, -1.7687, 3.140972, 0, 0, 0, 1, 1,
0.4579899, 0.04766244, 1.507877, 0, 0, 0, 1, 1,
0.4588238, -0.3292709, 2.559662, 1, 1, 1, 1, 1,
0.4718149, -0.08522511, 1.608451, 1, 1, 1, 1, 1,
0.4742893, 0.8879342, 0.7215717, 1, 1, 1, 1, 1,
0.4762586, 1.475326, 0.4874579, 1, 1, 1, 1, 1,
0.4773856, 0.9510691, 1.262465, 1, 1, 1, 1, 1,
0.4845059, 1.739422, -1.166194, 1, 1, 1, 1, 1,
0.4903135, -0.4642872, 3.083246, 1, 1, 1, 1, 1,
0.4917617, -0.246938, 0.02990424, 1, 1, 1, 1, 1,
0.492024, -0.06031428, 2.66633, 1, 1, 1, 1, 1,
0.4998019, -2.267429, 0.4534352, 1, 1, 1, 1, 1,
0.5004007, -0.06841422, 0.1612011, 1, 1, 1, 1, 1,
0.5085239, 0.09734058, 0.9435493, 1, 1, 1, 1, 1,
0.5108847, -0.1792427, 1.130272, 1, 1, 1, 1, 1,
0.5149041, -0.13244, 2.774012, 1, 1, 1, 1, 1,
0.515205, 0.2800804, 0.3189307, 1, 1, 1, 1, 1,
0.5161954, 0.1962621, 2.679877, 0, 0, 1, 1, 1,
0.5200972, 0.5758062, 2.460194, 1, 0, 0, 1, 1,
0.5256382, 1.127461, 0.7717523, 1, 0, 0, 1, 1,
0.5338557, -1.109075, 2.40085, 1, 0, 0, 1, 1,
0.5340918, -0.4881386, 1.067544, 1, 0, 0, 1, 1,
0.5366287, 1.62231, -0.4303006, 1, 0, 0, 1, 1,
0.5371776, 1.03319, 1.26506, 0, 0, 0, 1, 1,
0.5376469, -0.2615815, 4.493077, 0, 0, 0, 1, 1,
0.5393329, -0.2013586, 3.652823, 0, 0, 0, 1, 1,
0.5398558, -0.2799472, 0.8586611, 0, 0, 0, 1, 1,
0.5408348, 1.666132, -0.6583959, 0, 0, 0, 1, 1,
0.5418088, 0.02427379, 2.239732, 0, 0, 0, 1, 1,
0.5431967, -0.7816997, 1.673124, 0, 0, 0, 1, 1,
0.5450236, 0.3595116, 3.282935, 1, 1, 1, 1, 1,
0.5452792, -0.1534761, 2.543287, 1, 1, 1, 1, 1,
0.547699, -0.255831, 1.809888, 1, 1, 1, 1, 1,
0.548874, -0.7003886, -0.2720373, 1, 1, 1, 1, 1,
0.557514, -1.054585, 3.080668, 1, 1, 1, 1, 1,
0.5580782, -0.3523301, 2.956348, 1, 1, 1, 1, 1,
0.559772, -0.2424471, 3.619084, 1, 1, 1, 1, 1,
0.5598922, -1.12228, 1.73796, 1, 1, 1, 1, 1,
0.5618397, -1.619219, 2.139405, 1, 1, 1, 1, 1,
0.5694702, 0.1731572, 0.3579805, 1, 1, 1, 1, 1,
0.5735879, 0.7156826, 2.138543, 1, 1, 1, 1, 1,
0.5738113, 0.519046, 1.34783, 1, 1, 1, 1, 1,
0.5761543, -1.273271, 4.539243, 1, 1, 1, 1, 1,
0.576872, -1.32722, 1.981274, 1, 1, 1, 1, 1,
0.5771952, 0.519627, 0.5915505, 1, 1, 1, 1, 1,
0.590883, -0.06757448, 2.215717, 0, 0, 1, 1, 1,
0.5998442, 1.082908, -0.07059095, 1, 0, 0, 1, 1,
0.6002052, -0.09130257, 0.3061514, 1, 0, 0, 1, 1,
0.6007696, -0.2565074, 1.316016, 1, 0, 0, 1, 1,
0.6035022, 2.351325, 0.651807, 1, 0, 0, 1, 1,
0.6073778, -0.6098648, 1.40453, 1, 0, 0, 1, 1,
0.608213, -0.1558856, 3.209425, 0, 0, 0, 1, 1,
0.610284, 0.6268721, 0.3073519, 0, 0, 0, 1, 1,
0.6117229, 0.5231118, -1.65237, 0, 0, 0, 1, 1,
0.6131524, 2.740595, 1.59658, 0, 0, 0, 1, 1,
0.6212441, 1.312172, 0.9544666, 0, 0, 0, 1, 1,
0.6215816, -1.873666, 3.149318, 0, 0, 0, 1, 1,
0.6228424, 0.02822389, 0.504414, 0, 0, 0, 1, 1,
0.6245433, -0.05019532, 1.788111, 1, 1, 1, 1, 1,
0.6252422, -0.6992833, 2.398058, 1, 1, 1, 1, 1,
0.6272466, -0.7655783, 4.905709, 1, 1, 1, 1, 1,
0.6319182, -0.3588163, 2.7773, 1, 1, 1, 1, 1,
0.6345814, -1.393845, 3.573267, 1, 1, 1, 1, 1,
0.636421, -1.475053, 1.920652, 1, 1, 1, 1, 1,
0.6387165, 0.8307352, 0.4370112, 1, 1, 1, 1, 1,
0.6405407, -0.7857798, 0.9668459, 1, 1, 1, 1, 1,
0.6415489, 0.4882508, 0.6757768, 1, 1, 1, 1, 1,
0.6435028, -0.8191923, 3.015988, 1, 1, 1, 1, 1,
0.6437371, -1.21472, 2.159532, 1, 1, 1, 1, 1,
0.645793, -0.7618735, 3.132388, 1, 1, 1, 1, 1,
0.6499652, 1.251552, 0.08435462, 1, 1, 1, 1, 1,
0.6505385, 0.7371118, 0.7992331, 1, 1, 1, 1, 1,
0.6508054, 0.4708388, 0.4617795, 1, 1, 1, 1, 1,
0.6511173, -1.25034, 1.444768, 0, 0, 1, 1, 1,
0.6555359, 1.341242, -0.5253367, 1, 0, 0, 1, 1,
0.6648854, -0.1761748, 4.039948, 1, 0, 0, 1, 1,
0.6648968, -1.835316, 1.608459, 1, 0, 0, 1, 1,
0.6742014, -1.40867, 2.965414, 1, 0, 0, 1, 1,
0.6828668, -1.378769, 2.502736, 1, 0, 0, 1, 1,
0.6834351, -0.9730415, 2.184765, 0, 0, 0, 1, 1,
0.6852555, 0.6299555, 1.486916, 0, 0, 0, 1, 1,
0.6852592, 0.4651388, 1.300845, 0, 0, 0, 1, 1,
0.6917059, -0.0106449, 1.01945, 0, 0, 0, 1, 1,
0.6986867, -0.62884, 3.393442, 0, 0, 0, 1, 1,
0.7054531, -0.8881666, 3.422819, 0, 0, 0, 1, 1,
0.7076585, -0.08603358, 0.9788696, 0, 0, 0, 1, 1,
0.7088853, 1.178199, 1.717853, 1, 1, 1, 1, 1,
0.7161794, -0.3266658, 2.878354, 1, 1, 1, 1, 1,
0.7188227, -1.014758, 3.092448, 1, 1, 1, 1, 1,
0.7299171, 0.1592792, 1.25312, 1, 1, 1, 1, 1,
0.730481, 0.8009964, 0.8719374, 1, 1, 1, 1, 1,
0.7396086, 0.9140694, 1.341032, 1, 1, 1, 1, 1,
0.7399245, 0.8515748, 0.001281413, 1, 1, 1, 1, 1,
0.7435179, -1.223024, 2.25983, 1, 1, 1, 1, 1,
0.7516339, -0.9877062, 3.617889, 1, 1, 1, 1, 1,
0.755023, -0.9044631, 3.759321, 1, 1, 1, 1, 1,
0.7589168, 0.2846317, 0.8821715, 1, 1, 1, 1, 1,
0.7593195, -0.6376706, 3.449027, 1, 1, 1, 1, 1,
0.7599376, -0.3922042, 1.023333, 1, 1, 1, 1, 1,
0.7628706, -0.1222528, 0.7079685, 1, 1, 1, 1, 1,
0.7698277, -0.007920668, 2.139203, 1, 1, 1, 1, 1,
0.7744499, -1.328557, 2.14121, 0, 0, 1, 1, 1,
0.7810716, -0.827593, 2.969316, 1, 0, 0, 1, 1,
0.7898218, 0.000381131, 2.03166, 1, 0, 0, 1, 1,
0.7912843, 1.313048, 0.3131504, 1, 0, 0, 1, 1,
0.7943244, -0.1602637, 0.1186704, 1, 0, 0, 1, 1,
0.7976928, 2.483921, -0.02121416, 1, 0, 0, 1, 1,
0.8027955, -0.3277014, 2.424532, 0, 0, 0, 1, 1,
0.8032939, -0.4257223, 1.48352, 0, 0, 0, 1, 1,
0.8036211, -1.180763, 2.005337, 0, 0, 0, 1, 1,
0.8057325, -0.1204033, 2.209022, 0, 0, 0, 1, 1,
0.8076265, 0.1413188, 3.171763, 0, 0, 0, 1, 1,
0.8081059, -0.4521597, 0.9631749, 0, 0, 0, 1, 1,
0.809617, -0.3406035, 2.194086, 0, 0, 0, 1, 1,
0.8114178, -0.7690505, 2.340257, 1, 1, 1, 1, 1,
0.8168003, -1.235153, 2.694074, 1, 1, 1, 1, 1,
0.8179444, -0.09036829, 2.023281, 1, 1, 1, 1, 1,
0.8200021, -0.2814634, 1.743404, 1, 1, 1, 1, 1,
0.8256397, -0.9407815, 1.101294, 1, 1, 1, 1, 1,
0.826026, -1.227345, 1.642871, 1, 1, 1, 1, 1,
0.8310524, 0.9949317, 3.577572, 1, 1, 1, 1, 1,
0.831098, 0.194333, 2.150459, 1, 1, 1, 1, 1,
0.8325866, -0.5230456, 3.960192, 1, 1, 1, 1, 1,
0.8331106, -0.5131534, 1.749325, 1, 1, 1, 1, 1,
0.834312, 0.4911128, 1.117558, 1, 1, 1, 1, 1,
0.8383301, -0.1786081, 2.531533, 1, 1, 1, 1, 1,
0.8384234, -0.2105442, 0.7062749, 1, 1, 1, 1, 1,
0.8409861, -2.784213, 1.620365, 1, 1, 1, 1, 1,
0.8418904, 1.238032, 0.906624, 1, 1, 1, 1, 1,
0.8466256, -0.5933384, 0.3622721, 0, 0, 1, 1, 1,
0.8494491, -1.204765, 3.604516, 1, 0, 0, 1, 1,
0.8538569, -1.096151, 2.102196, 1, 0, 0, 1, 1,
0.8608733, 1.791311, 0.1381094, 1, 0, 0, 1, 1,
0.864898, 0.9450256, 1.689875, 1, 0, 0, 1, 1,
0.8679394, 1.085835, 0.46882, 1, 0, 0, 1, 1,
0.8758383, 0.3140982, 0.8100939, 0, 0, 0, 1, 1,
0.8761742, 0.4865707, -0.07946272, 0, 0, 0, 1, 1,
0.8817719, 0.6105208, 1.765559, 0, 0, 0, 1, 1,
0.8837867, 1.243329, 0.7978635, 0, 0, 0, 1, 1,
0.891766, 0.6639295, 0.8133104, 0, 0, 0, 1, 1,
0.8942775, -0.6529335, 0.6030367, 0, 0, 0, 1, 1,
0.895458, -0.2438133, 1.833827, 0, 0, 0, 1, 1,
0.9121139, -0.5584902, 3.228793, 1, 1, 1, 1, 1,
0.9130145, 0.0803495, 3.312832, 1, 1, 1, 1, 1,
0.9190481, -1.467629, 1.777696, 1, 1, 1, 1, 1,
0.9197758, 0.3689539, 0.9581265, 1, 1, 1, 1, 1,
0.9291006, 0.2836167, 1.999408, 1, 1, 1, 1, 1,
0.9345561, 0.5762494, 0.200971, 1, 1, 1, 1, 1,
0.9366702, -1.072765, 3.148421, 1, 1, 1, 1, 1,
0.9410538, 0.3495969, 2.150347, 1, 1, 1, 1, 1,
0.9418752, -1.526251, 3.621877, 1, 1, 1, 1, 1,
0.9506142, 1.91399, 1.948445, 1, 1, 1, 1, 1,
0.9516065, -1.349439, 3.080016, 1, 1, 1, 1, 1,
0.9519923, 2.117011, -0.1483696, 1, 1, 1, 1, 1,
0.9527444, 0.3152593, 1.114875, 1, 1, 1, 1, 1,
0.9574833, 1.090343, -0.2245846, 1, 1, 1, 1, 1,
0.9601222, 1.161641, 1.442532, 1, 1, 1, 1, 1,
0.9611182, 1.503543, 1.323125, 0, 0, 1, 1, 1,
0.9615367, 0.5949468, -0.1336726, 1, 0, 0, 1, 1,
0.9630176, -1.653826, 0.8655465, 1, 0, 0, 1, 1,
0.973793, -1.468084, 4.228943, 1, 0, 0, 1, 1,
0.9754692, 1.648487, 1.660834, 1, 0, 0, 1, 1,
0.9792411, -1.09553, 3.543355, 1, 0, 0, 1, 1,
0.986818, -0.5586723, 2.80212, 0, 0, 0, 1, 1,
0.989281, -0.816929, 2.273052, 0, 0, 0, 1, 1,
0.9894693, 0.8486357, -0.734717, 0, 0, 0, 1, 1,
0.9916317, 0.1239206, 1.437566, 0, 0, 0, 1, 1,
0.9957588, -0.6241913, 1.562873, 0, 0, 0, 1, 1,
0.9964355, 1.203514, 0.05592534, 0, 0, 0, 1, 1,
0.9980856, -0.6028079, 4.448298, 0, 0, 0, 1, 1,
1.004398, 1.736855, 1.987374, 1, 1, 1, 1, 1,
1.008733, -0.9765702, 1.700125, 1, 1, 1, 1, 1,
1.02117, -0.4741306, 2.008356, 1, 1, 1, 1, 1,
1.022209, 0.01054449, 2.043613, 1, 1, 1, 1, 1,
1.022293, -2.342793, 3.932471, 1, 1, 1, 1, 1,
1.022355, -0.1293001, 0.8690249, 1, 1, 1, 1, 1,
1.023519, -2.86381, 2.293755, 1, 1, 1, 1, 1,
1.03231, -1.673931, 4.126483, 1, 1, 1, 1, 1,
1.041309, 1.379079, -0.3900288, 1, 1, 1, 1, 1,
1.04208, -1.325348, 2.437788, 1, 1, 1, 1, 1,
1.042829, 2.003903, -0.2271723, 1, 1, 1, 1, 1,
1.047369, 0.111896, 1.433162, 1, 1, 1, 1, 1,
1.04851, -0.9295183, 0.2550444, 1, 1, 1, 1, 1,
1.049329, -0.1917572, 2.108401, 1, 1, 1, 1, 1,
1.057769, 1.745403, 1.342244, 1, 1, 1, 1, 1,
1.06264, -0.7059841, 2.792942, 0, 0, 1, 1, 1,
1.068922, 1.087921, 1.110438, 1, 0, 0, 1, 1,
1.070877, -1.243265, 2.313381, 1, 0, 0, 1, 1,
1.071224, -1.267833, 3.174566, 1, 0, 0, 1, 1,
1.081162, -0.1564879, 1.272855, 1, 0, 0, 1, 1,
1.091001, 1.24175, 1.242082, 1, 0, 0, 1, 1,
1.120649, 0.6161693, 0.5130269, 0, 0, 0, 1, 1,
1.127288, -1.029028, 3.701555, 0, 0, 0, 1, 1,
1.129765, -1.874239, 2.408622, 0, 0, 0, 1, 1,
1.131732, -0.3588891, 0.7392794, 0, 0, 0, 1, 1,
1.141146, 1.790191, -0.5693231, 0, 0, 0, 1, 1,
1.142645, -0.4048298, 0.6675197, 0, 0, 0, 1, 1,
1.150472, 3.108846, 0.7877162, 0, 0, 0, 1, 1,
1.154637, 0.9760121, 1.256246, 1, 1, 1, 1, 1,
1.154652, -0.4958299, 1.884694, 1, 1, 1, 1, 1,
1.155274, -1.060586, 2.556971, 1, 1, 1, 1, 1,
1.160237, -0.3391974, 1.754508, 1, 1, 1, 1, 1,
1.161013, -1.399912, 1.999307, 1, 1, 1, 1, 1,
1.163999, -1.404259, 2.301309, 1, 1, 1, 1, 1,
1.175836, -1.975964, 4.453255, 1, 1, 1, 1, 1,
1.177467, -1.134543, 2.336324, 1, 1, 1, 1, 1,
1.183961, -1.023527, 3.153397, 1, 1, 1, 1, 1,
1.185963, 1.007102, 0.2502499, 1, 1, 1, 1, 1,
1.191309, 0.7134444, 0.8186388, 1, 1, 1, 1, 1,
1.195331, 1.874725, 0.2598659, 1, 1, 1, 1, 1,
1.195945, -0.6743482, 1.403758, 1, 1, 1, 1, 1,
1.203514, 0.6721811, 1.160524, 1, 1, 1, 1, 1,
1.205601, 0.5622628, 0.8690534, 1, 1, 1, 1, 1,
1.21292, 1.235526, 1.46694, 0, 0, 1, 1, 1,
1.21293, 0.1288763, 0.7398815, 1, 0, 0, 1, 1,
1.214701, -0.1787315, 3.881439, 1, 0, 0, 1, 1,
1.215539, 1.972568, -0.765591, 1, 0, 0, 1, 1,
1.218706, -0.3523271, 2.321041, 1, 0, 0, 1, 1,
1.223868, 0.8701234, 1.86341, 1, 0, 0, 1, 1,
1.237791, 0.6965117, -0.4569344, 0, 0, 0, 1, 1,
1.238861, -1.869876, 2.304275, 0, 0, 0, 1, 1,
1.238964, 0.3987321, 3.143653, 0, 0, 0, 1, 1,
1.257134, -0.9186101, 1.032393, 0, 0, 0, 1, 1,
1.258813, -0.1100133, 1.108349, 0, 0, 0, 1, 1,
1.262702, 2.059234, 0.3866377, 0, 0, 0, 1, 1,
1.280735, 0.1356834, 2.273811, 0, 0, 0, 1, 1,
1.291821, -0.7956045, 3.965371, 1, 1, 1, 1, 1,
1.301062, -1.964293, 2.606711, 1, 1, 1, 1, 1,
1.323209, -0.436141, 1.418705, 1, 1, 1, 1, 1,
1.32338, -0.7785243, 0.3738723, 1, 1, 1, 1, 1,
1.341822, -0.7337341, 1.801999, 1, 1, 1, 1, 1,
1.344234, 0.6917821, 1.912614, 1, 1, 1, 1, 1,
1.347873, 0.5212398, -0.3595983, 1, 1, 1, 1, 1,
1.349084, -0.9145778, 2.998685, 1, 1, 1, 1, 1,
1.361094, 2.911822, -1.601819, 1, 1, 1, 1, 1,
1.366339, -1.419122, 3.451436, 1, 1, 1, 1, 1,
1.373165, 2.429692, -1.047652, 1, 1, 1, 1, 1,
1.382161, -0.1744215, 1.890896, 1, 1, 1, 1, 1,
1.383299, -0.8076223, 2.232028, 1, 1, 1, 1, 1,
1.399485, -1.504042, 3.036523, 1, 1, 1, 1, 1,
1.403391, -1.546633, 1.642593, 1, 1, 1, 1, 1,
1.412363, 0.3746818, 1.419235, 0, 0, 1, 1, 1,
1.415663, 1.740367, 0.9558269, 1, 0, 0, 1, 1,
1.420129, 0.07296766, 1.905746, 1, 0, 0, 1, 1,
1.47036, -0.2934297, 1.582535, 1, 0, 0, 1, 1,
1.47843, -0.01183776, -0.5650548, 1, 0, 0, 1, 1,
1.487327, -1.143957, 2.216954, 1, 0, 0, 1, 1,
1.495044, -0.6858625, 1.960205, 0, 0, 0, 1, 1,
1.498251, 1.406648, 0.5530038, 0, 0, 0, 1, 1,
1.520592, 0.0306907, 1.139483, 0, 0, 0, 1, 1,
1.533731, 0.6779357, 0.02814275, 0, 0, 0, 1, 1,
1.536213, -0.7578489, 0.41191, 0, 0, 0, 1, 1,
1.540717, 1.644828, 1.083698, 0, 0, 0, 1, 1,
1.541784, 0.4856126, 1.804239, 0, 0, 0, 1, 1,
1.548402, 0.9238139, 1.417477, 1, 1, 1, 1, 1,
1.549757, 1.524823, 0.7287702, 1, 1, 1, 1, 1,
1.563248, 1.196036, -1.416508, 1, 1, 1, 1, 1,
1.583438, 0.8841572, 2.055749, 1, 1, 1, 1, 1,
1.585427, -0.4216645, 3.18272, 1, 1, 1, 1, 1,
1.58696, 1.376419, 1.302722, 1, 1, 1, 1, 1,
1.588719, -1.594408, 1.683845, 1, 1, 1, 1, 1,
1.597588, 0.3775898, 2.6992, 1, 1, 1, 1, 1,
1.610193, 0.616464, 0.7818897, 1, 1, 1, 1, 1,
1.618441, -0.5887347, 1.689474, 1, 1, 1, 1, 1,
1.619291, -0.2695292, 1.399144, 1, 1, 1, 1, 1,
1.622274, 0.2822665, 0.6509434, 1, 1, 1, 1, 1,
1.622983, -0.2527911, 2.477318, 1, 1, 1, 1, 1,
1.636389, -0.411065, 0.7697746, 1, 1, 1, 1, 1,
1.640021, -0.4313632, 1.206036, 1, 1, 1, 1, 1,
1.645598, 0.8484168, 2.374858, 0, 0, 1, 1, 1,
1.648277, 0.3053716, 1.641456, 1, 0, 0, 1, 1,
1.652017, -2.129302, 4.166619, 1, 0, 0, 1, 1,
1.653468, 1.723508, 0.8128558, 1, 0, 0, 1, 1,
1.660167, 0.1699615, 2.575926, 1, 0, 0, 1, 1,
1.676576, -0.9469854, 1.898614, 1, 0, 0, 1, 1,
1.678506, 0.2320811, 2.647901, 0, 0, 0, 1, 1,
1.678756, 1.72357, 0.5177478, 0, 0, 0, 1, 1,
1.685196, 0.05330515, 1.107267, 0, 0, 0, 1, 1,
1.740494, 1.11509, 1.800079, 0, 0, 0, 1, 1,
1.745443, 0.3018769, 1.007714, 0, 0, 0, 1, 1,
1.751155, -0.4450099, 3.048766, 0, 0, 0, 1, 1,
1.765208, -0.3837079, 1.117411, 0, 0, 0, 1, 1,
1.774704, -0.3676879, 1.446815, 1, 1, 1, 1, 1,
1.790115, 0.1786309, 1.191265, 1, 1, 1, 1, 1,
1.793592, 0.06356383, 1.288981, 1, 1, 1, 1, 1,
1.8218, -2.304799, 3.11927, 1, 1, 1, 1, 1,
1.823867, -1.243142, 2.751722, 1, 1, 1, 1, 1,
1.828904, -0.03884181, 0.7033607, 1, 1, 1, 1, 1,
1.831779, -2.089079, 2.35726, 1, 1, 1, 1, 1,
1.836173, -0.7833169, -0.12414, 1, 1, 1, 1, 1,
1.838555, -1.378012, 2.367531, 1, 1, 1, 1, 1,
1.87685, 0.1911996, 2.083672, 1, 1, 1, 1, 1,
1.881397, -0.007378247, 0.7723151, 1, 1, 1, 1, 1,
1.881684, -1.200057, 1.132609, 1, 1, 1, 1, 1,
1.919177, 0.7889013, 1.274247, 1, 1, 1, 1, 1,
1.950498, -1.396062, 1.633618, 1, 1, 1, 1, 1,
1.968862, 1.376291, -0.09062776, 1, 1, 1, 1, 1,
2.020868, -0.5710985, 0.5908141, 0, 0, 1, 1, 1,
2.026907, 1.279831, 2.065453, 1, 0, 0, 1, 1,
2.041124, -0.6713721, 0.7911285, 1, 0, 0, 1, 1,
2.041495, -0.8295189, 0.7425078, 1, 0, 0, 1, 1,
2.086744, -0.3863669, 1.796368, 1, 0, 0, 1, 1,
2.115506, 0.4262441, 1.217654, 1, 0, 0, 1, 1,
2.121408, -0.2069527, 1.196974, 0, 0, 0, 1, 1,
2.151259, -1.176809, 4.036381, 0, 0, 0, 1, 1,
2.159379, -1.394912, 3.199878, 0, 0, 0, 1, 1,
2.198188, -0.1180492, 2.056533, 0, 0, 0, 1, 1,
2.225637, -0.1529222, 1.754948, 0, 0, 0, 1, 1,
2.235878, -0.8953394, 2.756318, 0, 0, 0, 1, 1,
2.250854, -0.7164298, 2.227102, 0, 0, 0, 1, 1,
2.25269, -0.9138838, 0.6233602, 1, 1, 1, 1, 1,
2.334028, 0.9642131, 1.40741, 1, 1, 1, 1, 1,
2.344053, -0.6893552, -1.064004, 1, 1, 1, 1, 1,
2.710175, -0.306212, 0.4120536, 1, 1, 1, 1, 1,
2.736053, 1.408315, -0.182722, 1, 1, 1, 1, 1,
2.87257, -0.7248675, 1.210149, 1, 1, 1, 1, 1,
4.030861, 1.199095, 0.4444979, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.826149;
var distance = 34.51393;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.0819478, -0.01064157, 0.1388786 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.51393);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
