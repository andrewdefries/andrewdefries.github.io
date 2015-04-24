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
-3.237388, 1.181085, -1.72939, 1, 0, 0, 1,
-3.199731, 0.8359305, -2.66108, 1, 0.007843138, 0, 1,
-2.876728, 0.3791859, -1.129175, 1, 0.01176471, 0, 1,
-2.616227, 1.741586, -0.1600757, 1, 0.01960784, 0, 1,
-2.584523, 2.151165, -1.16788, 1, 0.02352941, 0, 1,
-2.55604, 0.6471907, -1.335657, 1, 0.03137255, 0, 1,
-2.553984, 0.08056499, -1.827524, 1, 0.03529412, 0, 1,
-2.495573, 1.125485, -4.090961, 1, 0.04313726, 0, 1,
-2.436258, -0.2968732, -0.5083603, 1, 0.04705882, 0, 1,
-2.42827, -0.7043245, -2.80219, 1, 0.05490196, 0, 1,
-2.413279, -0.6672384, -0.7354116, 1, 0.05882353, 0, 1,
-2.387029, 2.235115, -1.558537, 1, 0.06666667, 0, 1,
-2.360867, 0.4679056, 0.1266929, 1, 0.07058824, 0, 1,
-2.256242, -0.3933588, -1.830266, 1, 0.07843138, 0, 1,
-2.243729, 0.1871881, -3.654739, 1, 0.08235294, 0, 1,
-2.229224, 0.6324806, 0.7065536, 1, 0.09019608, 0, 1,
-2.222077, -0.2822756, -0.7136702, 1, 0.09411765, 0, 1,
-2.178793, 0.1981367, -2.735141, 1, 0.1019608, 0, 1,
-2.176253, -0.2831431, -2.602385, 1, 0.1098039, 0, 1,
-2.122893, -2.100876, -2.555616, 1, 0.1137255, 0, 1,
-2.12023, -1.818687, -0.3281486, 1, 0.1215686, 0, 1,
-2.119991, -0.5563036, -2.430397, 1, 0.1254902, 0, 1,
-2.057582, -1.955462, -3.497375, 1, 0.1333333, 0, 1,
-2.035249, -1.109955, -1.291353, 1, 0.1372549, 0, 1,
-2.024799, -0.7322822, -2.465056, 1, 0.145098, 0, 1,
-1.99033, 0.04505698, -0.2511809, 1, 0.1490196, 0, 1,
-1.977167, -0.6304047, -1.605507, 1, 0.1568628, 0, 1,
-1.96826, 1.498264, -1.332265, 1, 0.1607843, 0, 1,
-1.950859, 0.2539275, -3.437164, 1, 0.1686275, 0, 1,
-1.948162, 0.05696792, -2.292016, 1, 0.172549, 0, 1,
-1.928703, -0.3111102, -3.973971, 1, 0.1803922, 0, 1,
-1.924315, -0.09826512, -3.553849, 1, 0.1843137, 0, 1,
-1.912499, -1.839354, -2.578109, 1, 0.1921569, 0, 1,
-1.903761, 0.002957498, -1.800239, 1, 0.1960784, 0, 1,
-1.87369, -1.184833, -4.190241, 1, 0.2039216, 0, 1,
-1.870755, -1.813817, -3.832411, 1, 0.2117647, 0, 1,
-1.857843, 0.348593, -2.288308, 1, 0.2156863, 0, 1,
-1.856387, 1.621106, -0.5578377, 1, 0.2235294, 0, 1,
-1.841409, 0.1046897, -1.315364, 1, 0.227451, 0, 1,
-1.838158, 0.7301235, -2.183548, 1, 0.2352941, 0, 1,
-1.81625, 0.7881019, -1.112712, 1, 0.2392157, 0, 1,
-1.80558, 0.6333902, -0.3220623, 1, 0.2470588, 0, 1,
-1.805357, 2.357585, -1.015175, 1, 0.2509804, 0, 1,
-1.799986, 0.5683466, -1.844259, 1, 0.2588235, 0, 1,
-1.792, -1.533405, -3.145396, 1, 0.2627451, 0, 1,
-1.789899, 1.587864, -1.879221, 1, 0.2705882, 0, 1,
-1.78483, -0.5219221, -1.516627, 1, 0.2745098, 0, 1,
-1.781744, 1.220021, -2.770679, 1, 0.282353, 0, 1,
-1.768189, 0.434184, -0.8804839, 1, 0.2862745, 0, 1,
-1.764781, 1.42739, 0.4298579, 1, 0.2941177, 0, 1,
-1.762219, -0.402407, -2.466228, 1, 0.3019608, 0, 1,
-1.748546, -2.142614, -3.877321, 1, 0.3058824, 0, 1,
-1.736587, 0.4122111, 0.6210948, 1, 0.3137255, 0, 1,
-1.714425, 0.4281697, -0.5372047, 1, 0.3176471, 0, 1,
-1.709314, 1.000629, -1.683545, 1, 0.3254902, 0, 1,
-1.690043, -0.4757701, -1.111734, 1, 0.3294118, 0, 1,
-1.684134, -0.233993, -0.9253312, 1, 0.3372549, 0, 1,
-1.683263, 0.9964226, -2.943484, 1, 0.3411765, 0, 1,
-1.671479, 0.8016383, -1.932121, 1, 0.3490196, 0, 1,
-1.651443, -0.8833491, -2.046123, 1, 0.3529412, 0, 1,
-1.644446, -0.5911689, -1.60749, 1, 0.3607843, 0, 1,
-1.629224, -0.2387912, -1.752083, 1, 0.3647059, 0, 1,
-1.610049, -1.454695, -2.30351, 1, 0.372549, 0, 1,
-1.571164, -1.225002, -0.4680628, 1, 0.3764706, 0, 1,
-1.566183, 1.552091, -0.9775468, 1, 0.3843137, 0, 1,
-1.564709, 1.157467, -0.1600228, 1, 0.3882353, 0, 1,
-1.543473, 0.4741997, 1.045089, 1, 0.3960784, 0, 1,
-1.543055, 2.088629, 0.1886873, 1, 0.4039216, 0, 1,
-1.540063, 0.3746113, -0.188602, 1, 0.4078431, 0, 1,
-1.528424, 1.865211, 1.475113, 1, 0.4156863, 0, 1,
-1.528035, -2.039291, -3.025551, 1, 0.4196078, 0, 1,
-1.524815, 0.6726363, 1.489704, 1, 0.427451, 0, 1,
-1.524612, 0.8514082, -2.615716, 1, 0.4313726, 0, 1,
-1.499953, -0.2350427, -1.959095, 1, 0.4392157, 0, 1,
-1.493436, 0.3697436, -2.156792, 1, 0.4431373, 0, 1,
-1.493424, -0.8803285, -2.772095, 1, 0.4509804, 0, 1,
-1.473418, -1.695743, -1.354616, 1, 0.454902, 0, 1,
-1.464484, -1.294595, -2.83876, 1, 0.4627451, 0, 1,
-1.451268, 0.8200523, -1.754587, 1, 0.4666667, 0, 1,
-1.435925, 1.107008, -1.082004, 1, 0.4745098, 0, 1,
-1.43493, 1.725302, -0.9257081, 1, 0.4784314, 0, 1,
-1.434824, -0.04232252, -0.7370293, 1, 0.4862745, 0, 1,
-1.431436, 2.184755, -1.725058, 1, 0.4901961, 0, 1,
-1.429542, -0.6895472, -1.702097, 1, 0.4980392, 0, 1,
-1.42312, -1.599038, -1.788878, 1, 0.5058824, 0, 1,
-1.412401, 0.4534279, 0.7793078, 1, 0.509804, 0, 1,
-1.409936, 0.480127, -2.338467, 1, 0.5176471, 0, 1,
-1.407155, 0.5113233, 0.3386155, 1, 0.5215687, 0, 1,
-1.405771, 0.04990021, -1.964628, 1, 0.5294118, 0, 1,
-1.405628, -0.3361018, -3.257352, 1, 0.5333334, 0, 1,
-1.396957, 0.1087987, 0.3288609, 1, 0.5411765, 0, 1,
-1.395505, 0.5112372, 0.5138575, 1, 0.5450981, 0, 1,
-1.393533, -1.663493, -3.541745, 1, 0.5529412, 0, 1,
-1.392606, 0.2440744, -1.424686, 1, 0.5568628, 0, 1,
-1.392532, 0.5315528, 0.2565108, 1, 0.5647059, 0, 1,
-1.39118, -0.8708391, -3.036822, 1, 0.5686275, 0, 1,
-1.388044, -0.1066665, -0.1355947, 1, 0.5764706, 0, 1,
-1.38777, 0.3660683, -2.457945, 1, 0.5803922, 0, 1,
-1.385962, 0.2262713, -2.073513, 1, 0.5882353, 0, 1,
-1.365456, -0.07112557, -3.428422, 1, 0.5921569, 0, 1,
-1.354418, 1.116032, -0.4390478, 1, 0.6, 0, 1,
-1.346606, -1.547341, -3.350083, 1, 0.6078432, 0, 1,
-1.345514, -0.5540137, -2.509025, 1, 0.6117647, 0, 1,
-1.342524, -0.5455573, -1.225989, 1, 0.6196079, 0, 1,
-1.337659, -0.2307499, -3.285567, 1, 0.6235294, 0, 1,
-1.337026, 0.6207573, -0.537303, 1, 0.6313726, 0, 1,
-1.325757, -0.708629, -2.245619, 1, 0.6352941, 0, 1,
-1.323072, -1.055295, -4.460255, 1, 0.6431373, 0, 1,
-1.310071, 0.05357098, -2.415348, 1, 0.6470588, 0, 1,
-1.291826, 0.4645486, -2.160846, 1, 0.654902, 0, 1,
-1.288159, 1.333656, -1.209625, 1, 0.6588235, 0, 1,
-1.277694, -1.195001, -1.068701, 1, 0.6666667, 0, 1,
-1.273589, -1.473284, -2.767772, 1, 0.6705883, 0, 1,
-1.271952, 0.527568, -1.111788, 1, 0.6784314, 0, 1,
-1.268686, -0.5788724, -1.654289, 1, 0.682353, 0, 1,
-1.267215, -0.8141608, -2.463926, 1, 0.6901961, 0, 1,
-1.266658, -0.3839248, -3.072176, 1, 0.6941177, 0, 1,
-1.263166, 1.775615, -0.8143759, 1, 0.7019608, 0, 1,
-1.262163, 0.8820133, 0.2495988, 1, 0.7098039, 0, 1,
-1.261534, 1.906322, 0.9706049, 1, 0.7137255, 0, 1,
-1.257269, -1.832002, -2.599245, 1, 0.7215686, 0, 1,
-1.253908, -0.425064, -1.637246, 1, 0.7254902, 0, 1,
-1.232964, -0.6237653, -1.511362, 1, 0.7333333, 0, 1,
-1.231539, -1.520954, -2.839287, 1, 0.7372549, 0, 1,
-1.230368, -1.220312, -2.14284, 1, 0.7450981, 0, 1,
-1.230141, 0.8425582, -0.2861968, 1, 0.7490196, 0, 1,
-1.221853, -2.009044, -3.652465, 1, 0.7568628, 0, 1,
-1.204142, 0.2039396, -0.3289558, 1, 0.7607843, 0, 1,
-1.193869, 0.3073512, -0.3447833, 1, 0.7686275, 0, 1,
-1.187418, -0.1675263, -0.8254037, 1, 0.772549, 0, 1,
-1.172768, 0.6442579, -2.55071, 1, 0.7803922, 0, 1,
-1.171499, 0.01372537, -2.184171, 1, 0.7843137, 0, 1,
-1.170792, 0.496743, -1.244884, 1, 0.7921569, 0, 1,
-1.167308, 0.3088679, 0.3879005, 1, 0.7960784, 0, 1,
-1.163938, 2.185127, -0.3431856, 1, 0.8039216, 0, 1,
-1.153216, 0.8593408, -1.542808, 1, 0.8117647, 0, 1,
-1.15246, 0.3291769, -1.530702, 1, 0.8156863, 0, 1,
-1.147745, -0.2401949, -3.259063, 1, 0.8235294, 0, 1,
-1.144919, -0.7269772, -1.836132, 1, 0.827451, 0, 1,
-1.138132, 0.827098, -1.497397, 1, 0.8352941, 0, 1,
-1.127257, 0.4880396, -0.9659253, 1, 0.8392157, 0, 1,
-1.12601, -0.2203509, -0.9692218, 1, 0.8470588, 0, 1,
-1.120681, -1.524776, -3.371102, 1, 0.8509804, 0, 1,
-1.115269, 0.3245987, -0.9276862, 1, 0.8588235, 0, 1,
-1.112083, -0.2113699, -0.830586, 1, 0.8627451, 0, 1,
-1.107748, -0.3060738, -2.040209, 1, 0.8705882, 0, 1,
-1.107611, 0.7652355, -0.6268616, 1, 0.8745098, 0, 1,
-1.096597, 0.3011293, -3.363166, 1, 0.8823529, 0, 1,
-1.083989, -0.04873106, -1.904944, 1, 0.8862745, 0, 1,
-1.049956, 0.7594399, -1.205583, 1, 0.8941177, 0, 1,
-1.04978, -1.246641, -3.072463, 1, 0.8980392, 0, 1,
-1.049005, -0.2918828, -3.03345, 1, 0.9058824, 0, 1,
-1.040262, -0.6582266, -2.51165, 1, 0.9137255, 0, 1,
-1.035898, 0.7683612, -0.1117305, 1, 0.9176471, 0, 1,
-1.024294, -2.335022, -1.615897, 1, 0.9254902, 0, 1,
-1.021457, 0.2535374, -1.142315, 1, 0.9294118, 0, 1,
-1.01929, -1.428898, -3.486696, 1, 0.9372549, 0, 1,
-1.016949, -1.11762, -1.177725, 1, 0.9411765, 0, 1,
-1.010302, -1.64187, -3.990409, 1, 0.9490196, 0, 1,
-1.005412, 0.7796339, 0.6448338, 1, 0.9529412, 0, 1,
-1.004988, -0.2478315, -1.964522, 1, 0.9607843, 0, 1,
-1.004675, 1.658646, 1.512924, 1, 0.9647059, 0, 1,
-1.002702, -0.8980947, -2.005405, 1, 0.972549, 0, 1,
-0.9992012, -0.3631935, -0.6484446, 1, 0.9764706, 0, 1,
-0.9917549, 0.5629064, -2.555814, 1, 0.9843137, 0, 1,
-0.9880103, -0.2593416, -1.131511, 1, 0.9882353, 0, 1,
-0.9823568, 0.5415409, -1.409014, 1, 0.9960784, 0, 1,
-0.9812409, -0.3366347, -2.544312, 0.9960784, 1, 0, 1,
-0.9725005, -0.8333114, -3.689954, 0.9921569, 1, 0, 1,
-0.9700853, 0.4819247, -0.5880179, 0.9843137, 1, 0, 1,
-0.9600462, -1.320226, -4.192737, 0.9803922, 1, 0, 1,
-0.9536258, 1.429403, -0.4840636, 0.972549, 1, 0, 1,
-0.9528344, -0.4202744, -2.223292, 0.9686275, 1, 0, 1,
-0.9475695, -0.4937978, -2.713542, 0.9607843, 1, 0, 1,
-0.9416455, -0.2256381, -1.693654, 0.9568627, 1, 0, 1,
-0.9370669, 0.6350566, -1.249408, 0.9490196, 1, 0, 1,
-0.93461, -1.611945, -2.315327, 0.945098, 1, 0, 1,
-0.9341533, 0.876293, -0.3895349, 0.9372549, 1, 0, 1,
-0.9327583, 0.5345957, -0.9475679, 0.9333333, 1, 0, 1,
-0.932056, -1.078778, -3.246765, 0.9254902, 1, 0, 1,
-0.9292049, -0.7925034, -3.296968, 0.9215686, 1, 0, 1,
-0.9289211, -0.2797008, -2.500615, 0.9137255, 1, 0, 1,
-0.92279, 0.3805196, -0.1464237, 0.9098039, 1, 0, 1,
-0.9193701, -0.9945838, -2.440343, 0.9019608, 1, 0, 1,
-0.915983, 1.458303, 1.299379, 0.8941177, 1, 0, 1,
-0.9099482, -1.117533, -2.558487, 0.8901961, 1, 0, 1,
-0.9025979, -1.154079, -2.237152, 0.8823529, 1, 0, 1,
-0.9016435, -2.413557, -2.189704, 0.8784314, 1, 0, 1,
-0.8945278, -2.476686, -1.212216, 0.8705882, 1, 0, 1,
-0.8854513, 0.1505799, -3.48981, 0.8666667, 1, 0, 1,
-0.8839589, 0.05189335, -0.6530656, 0.8588235, 1, 0, 1,
-0.8774461, -0.2694057, -0.2805199, 0.854902, 1, 0, 1,
-0.8759794, -0.004461531, -0.3200447, 0.8470588, 1, 0, 1,
-0.8744041, -1.515324, -3.99082, 0.8431373, 1, 0, 1,
-0.8701403, -0.3826734, -1.63796, 0.8352941, 1, 0, 1,
-0.8656687, -0.9328133, -0.5364315, 0.8313726, 1, 0, 1,
-0.8628462, -0.01850608, -2.722696, 0.8235294, 1, 0, 1,
-0.8623387, -0.4607526, -3.537936, 0.8196079, 1, 0, 1,
-0.8612127, 2.171715, -1.144138, 0.8117647, 1, 0, 1,
-0.8596105, 1.376212, -1.417255, 0.8078431, 1, 0, 1,
-0.8593907, -2.331708, -2.498786, 0.8, 1, 0, 1,
-0.8485457, -1.144769, -1.163327, 0.7921569, 1, 0, 1,
-0.8471435, -0.0241556, -2.142198, 0.7882353, 1, 0, 1,
-0.8452864, 0.974438, -1.019908, 0.7803922, 1, 0, 1,
-0.8447375, 1.076591, -1.197717, 0.7764706, 1, 0, 1,
-0.8446038, -1.020144, -1.292693, 0.7686275, 1, 0, 1,
-0.8415448, 0.16487, -1.397813, 0.7647059, 1, 0, 1,
-0.836158, 1.171338, -0.6481963, 0.7568628, 1, 0, 1,
-0.8310975, -0.8262948, -1.605685, 0.7529412, 1, 0, 1,
-0.8294179, 1.259232, -1.404774, 0.7450981, 1, 0, 1,
-0.8289945, -0.5982739, -1.51053, 0.7411765, 1, 0, 1,
-0.8274767, 0.7756249, -0.8839108, 0.7333333, 1, 0, 1,
-0.8206277, 0.859426, -1.168415, 0.7294118, 1, 0, 1,
-0.8176061, 0.2122423, -1.961109, 0.7215686, 1, 0, 1,
-0.8089457, -1.087195, -1.776736, 0.7176471, 1, 0, 1,
-0.8085824, -0.1612317, -1.121024, 0.7098039, 1, 0, 1,
-0.8068731, -0.8556284, -2.969664, 0.7058824, 1, 0, 1,
-0.8066238, 0.1605819, -1.437127, 0.6980392, 1, 0, 1,
-0.8049963, 1.759991, -0.7122281, 0.6901961, 1, 0, 1,
-0.8003466, -0.6912737, -2.03438, 0.6862745, 1, 0, 1,
-0.7991291, 5.215097e-05, -2.511898, 0.6784314, 1, 0, 1,
-0.7983578, -0.1265674, -0.6544368, 0.6745098, 1, 0, 1,
-0.79646, 2.027517, -0.4038125, 0.6666667, 1, 0, 1,
-0.794187, 0.3358714, -1.573543, 0.6627451, 1, 0, 1,
-0.7932289, -0.9429041, -3.803477, 0.654902, 1, 0, 1,
-0.7891082, 1.526008, 0.3950003, 0.6509804, 1, 0, 1,
-0.7867774, 1.240141, -1.424761, 0.6431373, 1, 0, 1,
-0.7856121, -1.61673, -4.784791, 0.6392157, 1, 0, 1,
-0.7843811, 0.8342808, -1.484047, 0.6313726, 1, 0, 1,
-0.7825791, -0.8347358, -2.384568, 0.627451, 1, 0, 1,
-0.7793861, -0.2836983, -0.0514844, 0.6196079, 1, 0, 1,
-0.7770688, -0.1370398, -2.752882, 0.6156863, 1, 0, 1,
-0.7756464, -1.62011, -3.172766, 0.6078432, 1, 0, 1,
-0.7740591, 0.4280861, -1.271267, 0.6039216, 1, 0, 1,
-0.7716752, -0.6666782, -2.206829, 0.5960785, 1, 0, 1,
-0.7676281, -0.9753504, -2.520694, 0.5882353, 1, 0, 1,
-0.7616457, 0.6534259, -0.3617145, 0.5843138, 1, 0, 1,
-0.7593998, -0.4966025, -0.01537735, 0.5764706, 1, 0, 1,
-0.7591977, 0.1089032, -1.38879, 0.572549, 1, 0, 1,
-0.7556003, 0.7173522, 0.7032534, 0.5647059, 1, 0, 1,
-0.7552495, 1.103572, -0.3008393, 0.5607843, 1, 0, 1,
-0.752559, -0.171435, -1.570176, 0.5529412, 1, 0, 1,
-0.7490462, -0.007544518, -2.085748, 0.5490196, 1, 0, 1,
-0.7454813, 0.3078234, -0.4821009, 0.5411765, 1, 0, 1,
-0.7398239, -0.5130414, -0.1027469, 0.5372549, 1, 0, 1,
-0.7363583, 0.3785001, -1.27418, 0.5294118, 1, 0, 1,
-0.7360119, 0.7394975, -1.664442, 0.5254902, 1, 0, 1,
-0.7346764, -0.4178253, -3.224862, 0.5176471, 1, 0, 1,
-0.7274938, 0.06305404, -0.6588364, 0.5137255, 1, 0, 1,
-0.7228242, 1.494705, 0.6071956, 0.5058824, 1, 0, 1,
-0.7228094, 0.6427817, -0.2033114, 0.5019608, 1, 0, 1,
-0.7208048, 1.472576, 0.2073325, 0.4941176, 1, 0, 1,
-0.7172607, 0.07596697, -0.8004583, 0.4862745, 1, 0, 1,
-0.7127208, -0.1180035, -4.243022, 0.4823529, 1, 0, 1,
-0.7104497, 0.4067127, -1.926751, 0.4745098, 1, 0, 1,
-0.7091722, 0.6614876, -0.5618394, 0.4705882, 1, 0, 1,
-0.7024671, 1.097423, -0.3849476, 0.4627451, 1, 0, 1,
-0.7005896, -1.719821, -2.051499, 0.4588235, 1, 0, 1,
-0.6998795, -0.863774, -1.184388, 0.4509804, 1, 0, 1,
-0.6864507, -0.07853862, -2.421749, 0.4470588, 1, 0, 1,
-0.6761415, 2.272405, -0.4861927, 0.4392157, 1, 0, 1,
-0.6651086, 1.460973, 0.8005588, 0.4352941, 1, 0, 1,
-0.6649886, 0.4857362, -0.6666334, 0.427451, 1, 0, 1,
-0.65732, -0.3501785, -2.125112, 0.4235294, 1, 0, 1,
-0.6519929, -0.3847973, -4.754835, 0.4156863, 1, 0, 1,
-0.6436245, -2.015091, -2.861523, 0.4117647, 1, 0, 1,
-0.6435556, -0.4799469, -3.901027, 0.4039216, 1, 0, 1,
-0.641904, -1.030478, -3.054365, 0.3960784, 1, 0, 1,
-0.6416179, 0.9693251, -0.2919387, 0.3921569, 1, 0, 1,
-0.640306, 0.09971642, -2.139328, 0.3843137, 1, 0, 1,
-0.6392346, 0.1523994, -0.2334064, 0.3803922, 1, 0, 1,
-0.6373099, 0.2212117, -1.380186, 0.372549, 1, 0, 1,
-0.6329418, 0.3318334, 0.4021129, 0.3686275, 1, 0, 1,
-0.6311131, -0.09698208, -2.763407, 0.3607843, 1, 0, 1,
-0.6297327, 1.151062, -1.83382, 0.3568628, 1, 0, 1,
-0.6276811, 0.357862, -1.16667, 0.3490196, 1, 0, 1,
-0.6261309, 0.1289248, -1.678508, 0.345098, 1, 0, 1,
-0.6245837, -0.1006839, 0.1430693, 0.3372549, 1, 0, 1,
-0.6144322, -0.4853182, -1.283006, 0.3333333, 1, 0, 1,
-0.6112739, -0.4348034, -1.667521, 0.3254902, 1, 0, 1,
-0.6097819, -1.517618, -2.648092, 0.3215686, 1, 0, 1,
-0.607857, 0.6758752, -2.617878, 0.3137255, 1, 0, 1,
-0.5999644, 1.174698, -0.5368998, 0.3098039, 1, 0, 1,
-0.5986771, -2.506151, -2.893968, 0.3019608, 1, 0, 1,
-0.5973764, -1.24341, -2.873838, 0.2941177, 1, 0, 1,
-0.5925333, -0.9268056, -2.038111, 0.2901961, 1, 0, 1,
-0.5903009, -2.060726, -1.875092, 0.282353, 1, 0, 1,
-0.5883486, 1.317749, -1.434345, 0.2784314, 1, 0, 1,
-0.5852969, 0.05640736, -1.571752, 0.2705882, 1, 0, 1,
-0.5795978, 0.1875387, -1.671008, 0.2666667, 1, 0, 1,
-0.5784194, -0.5718246, -0.4976395, 0.2588235, 1, 0, 1,
-0.5779838, 0.8893006, -1.986764, 0.254902, 1, 0, 1,
-0.5778345, -0.05755126, -3.227954, 0.2470588, 1, 0, 1,
-0.575212, -0.1063609, -1.173083, 0.2431373, 1, 0, 1,
-0.5699673, -0.2428458, -3.188442, 0.2352941, 1, 0, 1,
-0.5674723, -0.8029175, -2.998621, 0.2313726, 1, 0, 1,
-0.5643761, -0.09915673, -2.703065, 0.2235294, 1, 0, 1,
-0.5470524, -0.03395698, -0.5807807, 0.2196078, 1, 0, 1,
-0.5466494, 0.02206891, -0.82301, 0.2117647, 1, 0, 1,
-0.5311853, 0.02822576, -0.6127884, 0.2078431, 1, 0, 1,
-0.527226, 1.516379, 1.359166, 0.2, 1, 0, 1,
-0.5265259, 0.3512795, -2.900486, 0.1921569, 1, 0, 1,
-0.5231634, 0.3764596, -0.07012141, 0.1882353, 1, 0, 1,
-0.5205271, 2.591823, 0.1958714, 0.1803922, 1, 0, 1,
-0.5204807, 0.2800072, -0.8180763, 0.1764706, 1, 0, 1,
-0.5173061, -2.974845, -2.335582, 0.1686275, 1, 0, 1,
-0.5172299, 1.389532, -0.08159819, 0.1647059, 1, 0, 1,
-0.5138274, 0.6992252, -0.7305165, 0.1568628, 1, 0, 1,
-0.510929, -1.664015, -2.94489, 0.1529412, 1, 0, 1,
-0.5099064, -0.6998369, -0.8868538, 0.145098, 1, 0, 1,
-0.5083933, -0.3729932, -2.552248, 0.1411765, 1, 0, 1,
-0.5038005, 0.3064315, -1.731436, 0.1333333, 1, 0, 1,
-0.5012517, 1.125721, -2.049814, 0.1294118, 1, 0, 1,
-0.498997, 0.5614946, -1.777431, 0.1215686, 1, 0, 1,
-0.4950138, -0.6288722, -2.350115, 0.1176471, 1, 0, 1,
-0.4947615, 1.551856, 1.00953, 0.1098039, 1, 0, 1,
-0.4941093, 0.6356975, -0.8737151, 0.1058824, 1, 0, 1,
-0.4933355, -0.2921386, -1.279618, 0.09803922, 1, 0, 1,
-0.4889029, -0.3367583, -3.300308, 0.09019608, 1, 0, 1,
-0.4873442, 0.3339359, -0.4659803, 0.08627451, 1, 0, 1,
-0.4872993, 0.08325368, 0.564295, 0.07843138, 1, 0, 1,
-0.4853446, -0.923018, -3.606659, 0.07450981, 1, 0, 1,
-0.4852422, 1.080492, -1.189616, 0.06666667, 1, 0, 1,
-0.4851386, -0.5835689, -3.145776, 0.0627451, 1, 0, 1,
-0.48451, 2.212909, -0.3227489, 0.05490196, 1, 0, 1,
-0.4810477, 1.91416, 0.1113319, 0.05098039, 1, 0, 1,
-0.4767407, -1.894146, -3.986234, 0.04313726, 1, 0, 1,
-0.4759917, 0.997634, -1.017711, 0.03921569, 1, 0, 1,
-0.4735688, 0.1724214, -2.194582, 0.03137255, 1, 0, 1,
-0.470461, 0.9647996, -0.4120527, 0.02745098, 1, 0, 1,
-0.4655958, -0.4615962, -1.914777, 0.01960784, 1, 0, 1,
-0.4607818, -1.503163, -2.380201, 0.01568628, 1, 0, 1,
-0.4593767, 1.212374, 0.86484, 0.007843138, 1, 0, 1,
-0.4591787, 0.9477507, 0.3011179, 0.003921569, 1, 0, 1,
-0.4578265, -0.2647146, -3.436339, 0, 1, 0.003921569, 1,
-0.4566826, -1.166017, -2.672788, 0, 1, 0.01176471, 1,
-0.4513716, -1.440696, -4.36696, 0, 1, 0.01568628, 1,
-0.4481188, -0.6714805, -2.230665, 0, 1, 0.02352941, 1,
-0.4473478, -1.075025, -2.584171, 0, 1, 0.02745098, 1,
-0.4418043, 0.3508456, -1.032522, 0, 1, 0.03529412, 1,
-0.4413024, -1.008728, -2.309546, 0, 1, 0.03921569, 1,
-0.4398497, -0.3602334, -2.530993, 0, 1, 0.04705882, 1,
-0.4396635, 0.7096379, -0.4307137, 0, 1, 0.05098039, 1,
-0.439544, 0.3249811, -0.3192886, 0, 1, 0.05882353, 1,
-0.439392, -1.401084, -1.677858, 0, 1, 0.0627451, 1,
-0.4379115, -0.4485286, -2.690713, 0, 1, 0.07058824, 1,
-0.4375426, -0.5790045, -2.966418, 0, 1, 0.07450981, 1,
-0.4318611, 1.115777, 0.06305799, 0, 1, 0.08235294, 1,
-0.4299462, 1.187835, -0.6877015, 0, 1, 0.08627451, 1,
-0.4285028, -1.901309, -3.193329, 0, 1, 0.09411765, 1,
-0.4225355, -0.2654758, -3.991363, 0, 1, 0.1019608, 1,
-0.4223191, -0.4548818, -2.070374, 0, 1, 0.1058824, 1,
-0.4185398, 0.1879013, -1.530989, 0, 1, 0.1137255, 1,
-0.4113691, -0.62399, -3.34614, 0, 1, 0.1176471, 1,
-0.3997984, -1.04597, -1.008109, 0, 1, 0.1254902, 1,
-0.3987504, 0.1648199, -1.554783, 0, 1, 0.1294118, 1,
-0.3956975, -2.638275, -3.03683, 0, 1, 0.1372549, 1,
-0.3925477, -0.1485099, -0.9936971, 0, 1, 0.1411765, 1,
-0.3900828, -1.384346, -2.940734, 0, 1, 0.1490196, 1,
-0.3898819, 0.7706227, -1.019672, 0, 1, 0.1529412, 1,
-0.3880937, -2.613397, -2.684953, 0, 1, 0.1607843, 1,
-0.3871455, 0.8870888, -0.6971211, 0, 1, 0.1647059, 1,
-0.3870142, 2.558063, 0.7488421, 0, 1, 0.172549, 1,
-0.3836505, 0.7766809, -0.6512021, 0, 1, 0.1764706, 1,
-0.3808205, -1.008393, -2.635153, 0, 1, 0.1843137, 1,
-0.3762892, 0.01393374, -2.895437, 0, 1, 0.1882353, 1,
-0.374674, 0.9541803, 0.34162, 0, 1, 0.1960784, 1,
-0.3697415, 0.8111013, 1.108901, 0, 1, 0.2039216, 1,
-0.3692366, 0.8986152, -2.054514, 0, 1, 0.2078431, 1,
-0.3627765, -0.7914696, -3.5901, 0, 1, 0.2156863, 1,
-0.3619049, 1.411604, 0.1611919, 0, 1, 0.2196078, 1,
-0.3582272, -0.2296056, -3.411532, 0, 1, 0.227451, 1,
-0.3547409, 2.733354, -1.134191, 0, 1, 0.2313726, 1,
-0.3529603, 0.8614603, -1.412211, 0, 1, 0.2392157, 1,
-0.3501163, 0.01446045, -0.3346024, 0, 1, 0.2431373, 1,
-0.3476777, 1.592966, 0.6001628, 0, 1, 0.2509804, 1,
-0.3472885, -0.4841115, -3.108305, 0, 1, 0.254902, 1,
-0.3426641, -1.03576, -5.093616, 0, 1, 0.2627451, 1,
-0.3411851, -0.4639511, -3.334152, 0, 1, 0.2666667, 1,
-0.3392644, -0.7934822, -1.179687, 0, 1, 0.2745098, 1,
-0.3368589, -1.236213, -3.298463, 0, 1, 0.2784314, 1,
-0.3331386, -0.2570837, -2.18563, 0, 1, 0.2862745, 1,
-0.3281288, -0.3611738, -3.623973, 0, 1, 0.2901961, 1,
-0.3270648, 0.5238121, -1.348699, 0, 1, 0.2980392, 1,
-0.3205471, 0.9907029, -0.4787672, 0, 1, 0.3058824, 1,
-0.3172438, 0.6059188, -0.4007065, 0, 1, 0.3098039, 1,
-0.315183, 0.08613605, -0.8260711, 0, 1, 0.3176471, 1,
-0.3093994, 0.1194929, -0.9666897, 0, 1, 0.3215686, 1,
-0.3048916, 0.9642166, 0.7544464, 0, 1, 0.3294118, 1,
-0.3043196, 0.8707067, 1.480391, 0, 1, 0.3333333, 1,
-0.2991464, -1.287455, -2.104776, 0, 1, 0.3411765, 1,
-0.2990277, 1.630494, 2.077335, 0, 1, 0.345098, 1,
-0.2967072, -1.365424, -2.404958, 0, 1, 0.3529412, 1,
-0.2961841, 0.1126592, -2.124666, 0, 1, 0.3568628, 1,
-0.2938835, 0.4208434, -0.1054489, 0, 1, 0.3647059, 1,
-0.29068, 0.9850206, -1.54186, 0, 1, 0.3686275, 1,
-0.2903772, 0.1365719, -1.620326, 0, 1, 0.3764706, 1,
-0.2901488, 1.438563, -1.060463, 0, 1, 0.3803922, 1,
-0.2896397, -0.05310631, -3.056139, 0, 1, 0.3882353, 1,
-0.2887405, 2.69101, 1.153692, 0, 1, 0.3921569, 1,
-0.2745969, 0.2271137, -1.452726, 0, 1, 0.4, 1,
-0.2696499, 0.5647045, 0.4030451, 0, 1, 0.4078431, 1,
-0.2684852, 0.5241989, 1.123632, 0, 1, 0.4117647, 1,
-0.2666276, -1.862511, -2.78188, 0, 1, 0.4196078, 1,
-0.2659526, -0.8788088, -1.424849, 0, 1, 0.4235294, 1,
-0.265263, 0.3466241, -0.4598674, 0, 1, 0.4313726, 1,
-0.2624314, 0.4002077, -1.431518, 0, 1, 0.4352941, 1,
-0.2566639, -0.6344067, -3.739608, 0, 1, 0.4431373, 1,
-0.2562105, -0.8902172, -2.169131, 0, 1, 0.4470588, 1,
-0.2561679, -0.527908, -2.081841, 0, 1, 0.454902, 1,
-0.2557102, -1.131253, -3.080958, 0, 1, 0.4588235, 1,
-0.2546417, -0.500724, -2.296719, 0, 1, 0.4666667, 1,
-0.2507004, -1.089658, -2.683668, 0, 1, 0.4705882, 1,
-0.2498052, 1.163744, 1.224669, 0, 1, 0.4784314, 1,
-0.2478973, 1.005715, 0.7184156, 0, 1, 0.4823529, 1,
-0.2472427, -0.2764312, -1.693558, 0, 1, 0.4901961, 1,
-0.2470484, 2.29721, -0.4570644, 0, 1, 0.4941176, 1,
-0.2435916, -0.05104975, -2.144831, 0, 1, 0.5019608, 1,
-0.2423693, 0.7100927, 2.24638, 0, 1, 0.509804, 1,
-0.2407301, -2.198547, -3.603865, 0, 1, 0.5137255, 1,
-0.240323, 0.3425296, -0.8636101, 0, 1, 0.5215687, 1,
-0.2371488, -0.6566465, -1.918573, 0, 1, 0.5254902, 1,
-0.2339467, -0.5416217, -2.433222, 0, 1, 0.5333334, 1,
-0.2316428, 0.0001296232, -3.228002, 0, 1, 0.5372549, 1,
-0.2276102, 0.4480257, -1.055962, 0, 1, 0.5450981, 1,
-0.2263236, -1.477692, -3.652586, 0, 1, 0.5490196, 1,
-0.2223123, 0.3888338, 1.483397, 0, 1, 0.5568628, 1,
-0.2214882, -0.4346253, -1.734217, 0, 1, 0.5607843, 1,
-0.219926, -1.142766, -2.85625, 0, 1, 0.5686275, 1,
-0.2085736, -0.8066726, -1.947932, 0, 1, 0.572549, 1,
-0.2072869, 1.344409, 0.0769017, 0, 1, 0.5803922, 1,
-0.2014491, 0.05757917, -2.350971, 0, 1, 0.5843138, 1,
-0.1975621, -0.9987156, -2.403491, 0, 1, 0.5921569, 1,
-0.194673, -1.759184, -3.304426, 0, 1, 0.5960785, 1,
-0.193927, 0.2718183, -1.725517, 0, 1, 0.6039216, 1,
-0.1893681, 0.5981093, 0.6675473, 0, 1, 0.6117647, 1,
-0.1884175, 1.428848, -0.1191402, 0, 1, 0.6156863, 1,
-0.1807803, -1.034977, -2.327371, 0, 1, 0.6235294, 1,
-0.1795592, 0.3045891, 0.1103421, 0, 1, 0.627451, 1,
-0.1784932, 0.1864972, -0.7288139, 0, 1, 0.6352941, 1,
-0.1766883, 1.115548, 2.087971, 0, 1, 0.6392157, 1,
-0.175562, 0.02877239, 0.5136367, 0, 1, 0.6470588, 1,
-0.1754671, 0.8143074, 0.2966509, 0, 1, 0.6509804, 1,
-0.1739915, -0.028306, -2.25034, 0, 1, 0.6588235, 1,
-0.166022, 0.9964036, 1.236866, 0, 1, 0.6627451, 1,
-0.1648113, 0.3357595, -0.231955, 0, 1, 0.6705883, 1,
-0.1639602, -0.7967585, -2.942932, 0, 1, 0.6745098, 1,
-0.1619075, 0.7462584, 0.6657003, 0, 1, 0.682353, 1,
-0.1571017, -0.9116471, -2.594719, 0, 1, 0.6862745, 1,
-0.1558884, -0.1243516, -2.16892, 0, 1, 0.6941177, 1,
-0.1440766, -1.943167, -3.022511, 0, 1, 0.7019608, 1,
-0.1435892, -0.2851834, -1.436706, 0, 1, 0.7058824, 1,
-0.1427151, -0.4032426, -4.426231, 0, 1, 0.7137255, 1,
-0.1382683, -0.3469179, -3.103067, 0, 1, 0.7176471, 1,
-0.137726, -0.3111019, -3.632225, 0, 1, 0.7254902, 1,
-0.1356025, -1.145224, -2.183674, 0, 1, 0.7294118, 1,
-0.1338216, 0.6289578, 0.8199884, 0, 1, 0.7372549, 1,
-0.1332049, 2.127955, 0.8142004, 0, 1, 0.7411765, 1,
-0.1276004, -0.8877524, -2.434223, 0, 1, 0.7490196, 1,
-0.1241595, 0.2100747, -1.064332, 0, 1, 0.7529412, 1,
-0.12224, -0.2060233, -2.688021, 0, 1, 0.7607843, 1,
-0.1215268, 1.679872, 1.56569, 0, 1, 0.7647059, 1,
-0.1206849, 1.822275, 1.142944, 0, 1, 0.772549, 1,
-0.1206112, 0.8018356, -0.321858, 0, 1, 0.7764706, 1,
-0.1205001, -0.1623193, -0.5528191, 0, 1, 0.7843137, 1,
-0.1203085, -0.5200414, -3.585626, 0, 1, 0.7882353, 1,
-0.1198291, -0.35472, -2.595599, 0, 1, 0.7960784, 1,
-0.1107855, -0.04211307, -3.204911, 0, 1, 0.8039216, 1,
-0.1100007, 0.3049038, 1.225205, 0, 1, 0.8078431, 1,
-0.1061964, 0.9581966, -0.4091895, 0, 1, 0.8156863, 1,
-0.1059636, -0.3112549, -2.171193, 0, 1, 0.8196079, 1,
-0.1050452, 0.5308902, -1.798131, 0, 1, 0.827451, 1,
-0.104783, -1.962115, -2.69463, 0, 1, 0.8313726, 1,
-0.1024731, 0.6897253, -1.308908, 0, 1, 0.8392157, 1,
-0.1016976, 0.7477693, -0.08870444, 0, 1, 0.8431373, 1,
-0.09277059, 0.5008955, -0.08623948, 0, 1, 0.8509804, 1,
-0.09023688, 0.8575366, 0.3525575, 0, 1, 0.854902, 1,
-0.08992552, 0.2828464, -0.5856696, 0, 1, 0.8627451, 1,
-0.08907589, -0.3309081, -3.036113, 0, 1, 0.8666667, 1,
-0.08432315, 1.507269, 0.9122573, 0, 1, 0.8745098, 1,
-0.08188012, 0.5535739, 0.6691284, 0, 1, 0.8784314, 1,
-0.08070794, -0.4999005, -3.788202, 0, 1, 0.8862745, 1,
-0.08014696, -0.4597662, -2.200173, 0, 1, 0.8901961, 1,
-0.07627676, 1.616447, 0.333548, 0, 1, 0.8980392, 1,
-0.0755642, 0.09311996, -2.215492, 0, 1, 0.9058824, 1,
-0.07492134, 0.3038597, 2.166407, 0, 1, 0.9098039, 1,
-0.07312088, 0.7375919, -0.5321284, 0, 1, 0.9176471, 1,
-0.0694593, -1.047635, -4.364815, 0, 1, 0.9215686, 1,
-0.06913358, -0.1696429, -2.159053, 0, 1, 0.9294118, 1,
-0.06875467, -0.3848658, -0.1619423, 0, 1, 0.9333333, 1,
-0.06372628, -0.5976021, -1.7317, 0, 1, 0.9411765, 1,
-0.06344045, 0.2676867, 0.9222559, 0, 1, 0.945098, 1,
-0.06286365, -2.295569, -3.575154, 0, 1, 0.9529412, 1,
-0.05162328, 0.6060022, 0.9727871, 0, 1, 0.9568627, 1,
-0.0504235, -1.158312, -2.420445, 0, 1, 0.9647059, 1,
-0.05005779, -1.877998, -3.734999, 0, 1, 0.9686275, 1,
-0.04658132, 0.1491558, -0.647174, 0, 1, 0.9764706, 1,
-0.0462251, -0.7349679, -2.230544, 0, 1, 0.9803922, 1,
-0.0411519, 0.2754534, 1.246089, 0, 1, 0.9882353, 1,
-0.04082374, -0.7811772, -2.830339, 0, 1, 0.9921569, 1,
-0.04027028, -0.405422, -2.71191, 0, 1, 1, 1,
-0.03839745, -0.9488053, -3.237714, 0, 0.9921569, 1, 1,
-0.03663417, 0.8015877, 2.619764, 0, 0.9882353, 1, 1,
-0.03579305, 0.4198785, 0.4356835, 0, 0.9803922, 1, 1,
-0.03132455, -0.8574752, -3.670756, 0, 0.9764706, 1, 1,
-0.02871347, 1.344978, 1.07264, 0, 0.9686275, 1, 1,
-0.0255081, 0.2598086, 0.5082542, 0, 0.9647059, 1, 1,
-0.02464817, 0.3312645, 1.589325, 0, 0.9568627, 1, 1,
-0.02194442, 1.514022, -0.746056, 0, 0.9529412, 1, 1,
-0.02026762, 1.138075, -0.5765993, 0, 0.945098, 1, 1,
-0.01750339, -0.6024181, -4.738396, 0, 0.9411765, 1, 1,
-0.01746452, -1.418782, -2.757999, 0, 0.9333333, 1, 1,
-0.01654892, -0.3790984, -3.272405, 0, 0.9294118, 1, 1,
-0.01628386, -0.7198791, -2.859392, 0, 0.9215686, 1, 1,
-0.01417249, -0.4783963, -1.378675, 0, 0.9176471, 1, 1,
-0.007276097, -0.06634806, -3.782798, 0, 0.9098039, 1, 1,
-0.006435308, -2.41872, -2.85916, 0, 0.9058824, 1, 1,
-0.005107862, -2.080733, -3.7238, 0, 0.8980392, 1, 1,
-0.003098523, 0.1624648, 0.7261825, 0, 0.8901961, 1, 1,
-0.001090349, 0.3262129, 1.228676, 0, 0.8862745, 1, 1,
0.0006780317, 0.162499, -1.055188, 0, 0.8784314, 1, 1,
0.003741429, -0.9457824, 2.234455, 0, 0.8745098, 1, 1,
0.007909164, 0.1968922, 0.6172513, 0, 0.8666667, 1, 1,
0.008177548, 0.8822956, -0.549237, 0, 0.8627451, 1, 1,
0.01137519, 0.7536921, 0.4432049, 0, 0.854902, 1, 1,
0.01233073, -0.4596026, 4.004174, 0, 0.8509804, 1, 1,
0.01649517, -0.8664781, 2.245974, 0, 0.8431373, 1, 1,
0.02361121, -1.393989, 2.795771, 0, 0.8392157, 1, 1,
0.02406719, 0.01462828, 1.479207, 0, 0.8313726, 1, 1,
0.02452261, 0.3575623, 0.5803978, 0, 0.827451, 1, 1,
0.02560019, 1.24133, 0.4245976, 0, 0.8196079, 1, 1,
0.0364451, 1.567631, -0.6153467, 0, 0.8156863, 1, 1,
0.04097526, 0.998723, 0.07625075, 0, 0.8078431, 1, 1,
0.04163351, -0.4308217, 2.247121, 0, 0.8039216, 1, 1,
0.04617105, 1.095551, -0.7345881, 0, 0.7960784, 1, 1,
0.04659208, 0.9004626, -0.6311151, 0, 0.7882353, 1, 1,
0.04919224, -0.7766607, 3.408934, 0, 0.7843137, 1, 1,
0.05142556, -0.5321587, 2.031143, 0, 0.7764706, 1, 1,
0.05404728, 0.3702883, 1.557873, 0, 0.772549, 1, 1,
0.05630651, 0.6888657, -0.5154125, 0, 0.7647059, 1, 1,
0.05684357, -0.394206, 4.6348, 0, 0.7607843, 1, 1,
0.05703249, -0.7383535, 3.28712, 0, 0.7529412, 1, 1,
0.06085876, 0.7458318, 0.9841456, 0, 0.7490196, 1, 1,
0.06145579, -0.4464387, 2.659057, 0, 0.7411765, 1, 1,
0.06252382, -0.6392, 2.806163, 0, 0.7372549, 1, 1,
0.06282052, 0.1450223, -0.270287, 0, 0.7294118, 1, 1,
0.06363739, 1.297398, 1.511508, 0, 0.7254902, 1, 1,
0.06393631, 1.112926, 0.7450179, 0, 0.7176471, 1, 1,
0.06471103, 2.055684, 0.1869047, 0, 0.7137255, 1, 1,
0.06816746, 0.4610507, 0.8932671, 0, 0.7058824, 1, 1,
0.0715472, -0.4825097, 2.895045, 0, 0.6980392, 1, 1,
0.07662401, -0.8164279, 3.172407, 0, 0.6941177, 1, 1,
0.07810834, 0.6947896, -0.1454725, 0, 0.6862745, 1, 1,
0.07980915, -0.7884848, 3.503474, 0, 0.682353, 1, 1,
0.08145645, 0.3053073, 0.833331, 0, 0.6745098, 1, 1,
0.08516905, 0.6183184, -1.132029, 0, 0.6705883, 1, 1,
0.08764168, -0.0002161392, -0.6661091, 0, 0.6627451, 1, 1,
0.0901804, -0.6210228, 2.329412, 0, 0.6588235, 1, 1,
0.09102318, -1.214089, 2.284112, 0, 0.6509804, 1, 1,
0.09216325, 0.3192494, -0.7410557, 0, 0.6470588, 1, 1,
0.09729445, 1.790168, -0.09868592, 0, 0.6392157, 1, 1,
0.09755411, -0.5529836, 2.020467, 0, 0.6352941, 1, 1,
0.1009213, -0.2708856, 2.710416, 0, 0.627451, 1, 1,
0.1025696, 0.3146591, -1.586497, 0, 0.6235294, 1, 1,
0.102907, -0.4910463, 2.798303, 0, 0.6156863, 1, 1,
0.103242, 1.43986, -1.400293, 0, 0.6117647, 1, 1,
0.103917, 0.03531526, 1.39903, 0, 0.6039216, 1, 1,
0.1055921, 1.404598, 0.599603, 0, 0.5960785, 1, 1,
0.1064009, 0.6916082, -1.991899, 0, 0.5921569, 1, 1,
0.1093475, -0.19331, 4.944433, 0, 0.5843138, 1, 1,
0.1116993, 0.8398936, 1.575876, 0, 0.5803922, 1, 1,
0.1125003, -0.7499266, 3.418581, 0, 0.572549, 1, 1,
0.114063, -1.141002, 3.632268, 0, 0.5686275, 1, 1,
0.1168183, -0.262417, 2.187334, 0, 0.5607843, 1, 1,
0.1246417, 0.5605995, 0.7081923, 0, 0.5568628, 1, 1,
0.1303629, 0.4380431, 1.121341, 0, 0.5490196, 1, 1,
0.1379677, -0.1341809, 1.52335, 0, 0.5450981, 1, 1,
0.140464, 2.448001, 1.70997, 0, 0.5372549, 1, 1,
0.1426784, 0.1751909, 1.103541, 0, 0.5333334, 1, 1,
0.1429269, -0.1505584, 2.795775, 0, 0.5254902, 1, 1,
0.1432925, -0.04187904, 2.829962, 0, 0.5215687, 1, 1,
0.1498085, -2.090791, -0.3393956, 0, 0.5137255, 1, 1,
0.1505583, -0.1772205, 1.366774, 0, 0.509804, 1, 1,
0.1574467, -0.3762467, 4.302841, 0, 0.5019608, 1, 1,
0.1582917, 0.2987271, 1.637712, 0, 0.4941176, 1, 1,
0.1636847, -1.514081, 3.421708, 0, 0.4901961, 1, 1,
0.1658103, -0.8078288, 6.474183, 0, 0.4823529, 1, 1,
0.1660865, -2.625776, 4.202995, 0, 0.4784314, 1, 1,
0.1669807, 0.445213, -0.6577374, 0, 0.4705882, 1, 1,
0.1688286, 1.410433, -0.4261241, 0, 0.4666667, 1, 1,
0.1725835, -0.6228384, 2.891798, 0, 0.4588235, 1, 1,
0.1739259, 0.5341664, 0.7376287, 0, 0.454902, 1, 1,
0.1746441, 0.09225858, -0.2803195, 0, 0.4470588, 1, 1,
0.1775655, -0.7832761, 2.82322, 0, 0.4431373, 1, 1,
0.1785484, -0.5707117, 1.765351, 0, 0.4352941, 1, 1,
0.1792419, 1.119938, 0.7411258, 0, 0.4313726, 1, 1,
0.1798883, 0.3762642, 1.389235, 0, 0.4235294, 1, 1,
0.1799381, 0.227614, 0.7724218, 0, 0.4196078, 1, 1,
0.1810909, -0.3802958, 2.601174, 0, 0.4117647, 1, 1,
0.1840441, 3.230694, 0.2464099, 0, 0.4078431, 1, 1,
0.1843198, -1.108233, 4.25068, 0, 0.4, 1, 1,
0.1851783, 0.5611358, 2.398279, 0, 0.3921569, 1, 1,
0.1913476, -1.275136, 2.642598, 0, 0.3882353, 1, 1,
0.1928623, -0.09161124, -0.02689087, 0, 0.3803922, 1, 1,
0.1981893, 1.322201, -1.176066, 0, 0.3764706, 1, 1,
0.1985717, -0.08218016, 0.7817951, 0, 0.3686275, 1, 1,
0.2024269, 0.2409528, -0.2728163, 0, 0.3647059, 1, 1,
0.2071917, 0.2083866, 0.5850922, 0, 0.3568628, 1, 1,
0.2073007, -0.7253991, 3.006179, 0, 0.3529412, 1, 1,
0.2193243, 0.9653777, 0.2472071, 0, 0.345098, 1, 1,
0.2202391, 1.114116, 0.8634191, 0, 0.3411765, 1, 1,
0.2232581, -0.3784201, 2.65838, 0, 0.3333333, 1, 1,
0.2257087, 1.60543, 2.154464, 0, 0.3294118, 1, 1,
0.2259876, 0.8926692, 0.2562455, 0, 0.3215686, 1, 1,
0.2267874, 0.07687879, 2.521196, 0, 0.3176471, 1, 1,
0.2301663, 1.220406, 1.751991, 0, 0.3098039, 1, 1,
0.2303924, -0.2978409, 1.882458, 0, 0.3058824, 1, 1,
0.2322674, 0.2545893, 1.319697, 0, 0.2980392, 1, 1,
0.233733, -1.982963, 3.764571, 0, 0.2901961, 1, 1,
0.2349769, 2.139451, 1.945581, 0, 0.2862745, 1, 1,
0.2399321, -1.380494, 2.010802, 0, 0.2784314, 1, 1,
0.2422977, -0.3550871, 2.963669, 0, 0.2745098, 1, 1,
0.2425735, 1.430824, 0.08307137, 0, 0.2666667, 1, 1,
0.2426188, 1.114942, -0.2800763, 0, 0.2627451, 1, 1,
0.2436918, -1.056851, 2.568939, 0, 0.254902, 1, 1,
0.2476407, -0.6104841, 4.395189, 0, 0.2509804, 1, 1,
0.2491338, -0.8751172, 2.50832, 0, 0.2431373, 1, 1,
0.2523335, -1.023944, 1.580275, 0, 0.2392157, 1, 1,
0.2554286, 0.8476665, -0.1306419, 0, 0.2313726, 1, 1,
0.2557873, 0.5677622, -1.041096, 0, 0.227451, 1, 1,
0.2565245, 0.5808749, 0.2245308, 0, 0.2196078, 1, 1,
0.2567424, -1.096614, 2.804899, 0, 0.2156863, 1, 1,
0.2613455, 0.7056301, -0.3827175, 0, 0.2078431, 1, 1,
0.2636676, 2.029351, 1.156677, 0, 0.2039216, 1, 1,
0.2643885, -0.8192649, 0.9300426, 0, 0.1960784, 1, 1,
0.2680934, -0.2394059, 2.623369, 0, 0.1882353, 1, 1,
0.2700133, 0.04800849, 0.8037181, 0, 0.1843137, 1, 1,
0.2709888, -0.7706251, 4.232734, 0, 0.1764706, 1, 1,
0.2738948, -0.1017575, 1.816461, 0, 0.172549, 1, 1,
0.2762253, 0.9404866, -0.08604313, 0, 0.1647059, 1, 1,
0.2791046, 0.2140899, 1.836722, 0, 0.1607843, 1, 1,
0.2806684, 0.6778321, 0.8970914, 0, 0.1529412, 1, 1,
0.2846653, -0.6789278, 2.986052, 0, 0.1490196, 1, 1,
0.2850885, 0.885325, 1.053295, 0, 0.1411765, 1, 1,
0.2889565, -1.389409, 3.454124, 0, 0.1372549, 1, 1,
0.2909454, 1.062741, 0.1694898, 0, 0.1294118, 1, 1,
0.3039062, -1.207419, 3.278575, 0, 0.1254902, 1, 1,
0.304779, 1.577465, 0.3465713, 0, 0.1176471, 1, 1,
0.3086042, -0.3210557, 3.149447, 0, 0.1137255, 1, 1,
0.3104875, -0.6551868, 1.846352, 0, 0.1058824, 1, 1,
0.3114999, 0.7709298, 0.3564781, 0, 0.09803922, 1, 1,
0.3117242, -0.1094775, -0.9756103, 0, 0.09411765, 1, 1,
0.3145262, 1.74357, 1.851107, 0, 0.08627451, 1, 1,
0.3183488, 0.7486155, -0.1244197, 0, 0.08235294, 1, 1,
0.3183957, -1.151356, 1.788116, 0, 0.07450981, 1, 1,
0.3224928, 1.400216, -0.607855, 0, 0.07058824, 1, 1,
0.3226317, -0.8623291, 2.936794, 0, 0.0627451, 1, 1,
0.3255532, -0.8297755, 2.797481, 0, 0.05882353, 1, 1,
0.3299392, 1.525528, 1.82696, 0, 0.05098039, 1, 1,
0.3305142, -0.4387548, 2.255401, 0, 0.04705882, 1, 1,
0.335216, 1.059715, 0.6310691, 0, 0.03921569, 1, 1,
0.3377709, -0.1515903, 2.606431, 0, 0.03529412, 1, 1,
0.3395488, -1.618657, 2.481291, 0, 0.02745098, 1, 1,
0.3395779, -0.4808768, 2.534054, 0, 0.02352941, 1, 1,
0.3410942, -0.6585151, 1.77112, 0, 0.01568628, 1, 1,
0.3416255, 0.3450827, 2.270007, 0, 0.01176471, 1, 1,
0.3421538, 0.8941516, 0.3627446, 0, 0.003921569, 1, 1,
0.3553806, 0.7986231, 2.507267, 0.003921569, 0, 1, 1,
0.3610844, 1.066191, 0.7914595, 0.007843138, 0, 1, 1,
0.3616868, 0.6272616, 1.939606, 0.01568628, 0, 1, 1,
0.3715514, 0.6734701, 1.457489, 0.01960784, 0, 1, 1,
0.3747275, -0.6335632, 2.838718, 0.02745098, 0, 1, 1,
0.3790478, 1.385123, 1.537201, 0.03137255, 0, 1, 1,
0.3851796, -0.6431143, 3.522115, 0.03921569, 0, 1, 1,
0.3900027, 0.5246332, -0.6873074, 0.04313726, 0, 1, 1,
0.390726, 0.2805769, -0.8369257, 0.05098039, 0, 1, 1,
0.3937606, -1.45525, 3.112247, 0.05490196, 0, 1, 1,
0.3956059, -0.5408426, 0.804642, 0.0627451, 0, 1, 1,
0.3972522, 0.1914232, -0.08859294, 0.06666667, 0, 1, 1,
0.3997194, -0.6162359, 3.256449, 0.07450981, 0, 1, 1,
0.4000507, 0.7723501, 0.2882779, 0.07843138, 0, 1, 1,
0.4026849, 0.7035785, -1.2165, 0.08627451, 0, 1, 1,
0.4093423, 1.474542, 1.294954, 0.09019608, 0, 1, 1,
0.4151323, -0.8094782, 2.536731, 0.09803922, 0, 1, 1,
0.4219645, 0.3901539, 0.795906, 0.1058824, 0, 1, 1,
0.4226868, 0.2800032, 2.222142, 0.1098039, 0, 1, 1,
0.4246847, -0.3842094, 3.523284, 0.1176471, 0, 1, 1,
0.4247762, -0.4808759, 1.492227, 0.1215686, 0, 1, 1,
0.42743, -0.7361423, 2.69624, 0.1294118, 0, 1, 1,
0.4279541, -0.9491081, 2.84287, 0.1333333, 0, 1, 1,
0.431126, 2.113537, -0.7010251, 0.1411765, 0, 1, 1,
0.4347581, -1.012713, 1.641321, 0.145098, 0, 1, 1,
0.4352886, -1.78938, 4.731699, 0.1529412, 0, 1, 1,
0.438336, -0.3111449, 1.986957, 0.1568628, 0, 1, 1,
0.4386613, 0.09567982, 2.270084, 0.1647059, 0, 1, 1,
0.444437, 1.700892, -1.757728, 0.1686275, 0, 1, 1,
0.4476464, -1.145169, 1.828301, 0.1764706, 0, 1, 1,
0.4533691, 1.063548, -1.329683, 0.1803922, 0, 1, 1,
0.4615258, 0.1608228, 1.653077, 0.1882353, 0, 1, 1,
0.4646158, 0.9214674, 1.13634, 0.1921569, 0, 1, 1,
0.4702508, 2.035148, 0.7117704, 0.2, 0, 1, 1,
0.4745313, -0.2026451, 1.951871, 0.2078431, 0, 1, 1,
0.4787669, -0.3595066, 3.361782, 0.2117647, 0, 1, 1,
0.4796808, 0.4463086, 2.272001, 0.2196078, 0, 1, 1,
0.4811588, 1.65801, 1.738319, 0.2235294, 0, 1, 1,
0.4871452, 0.9193544, -0.2371083, 0.2313726, 0, 1, 1,
0.4882262, 0.02746954, 1.874893, 0.2352941, 0, 1, 1,
0.4890082, -0.4789531, 2.798253, 0.2431373, 0, 1, 1,
0.4960312, -1.17656, 1.84425, 0.2470588, 0, 1, 1,
0.4971399, 1.771325, 0.4103186, 0.254902, 0, 1, 1,
0.498393, 0.1167554, -0.2562278, 0.2588235, 0, 1, 1,
0.5001109, -1.629342, 1.773237, 0.2666667, 0, 1, 1,
0.5004066, -0.9620736, 0.9154971, 0.2705882, 0, 1, 1,
0.5012946, 0.4444365, 2.329265, 0.2784314, 0, 1, 1,
0.5065633, -0.6510067, 1.969838, 0.282353, 0, 1, 1,
0.5083716, 0.5117069, 0.2355714, 0.2901961, 0, 1, 1,
0.5126801, -0.4093396, 2.783383, 0.2941177, 0, 1, 1,
0.5139316, -1.319206, 1.833011, 0.3019608, 0, 1, 1,
0.514394, -0.7571543, 2.026512, 0.3098039, 0, 1, 1,
0.5196527, -2.596616, 3.770025, 0.3137255, 0, 1, 1,
0.5207554, 0.3943812, -0.2631725, 0.3215686, 0, 1, 1,
0.5232417, 0.3707846, 0.3670557, 0.3254902, 0, 1, 1,
0.5238408, 0.7602418, 1.169711, 0.3333333, 0, 1, 1,
0.5264943, 0.7080888, 0.8827712, 0.3372549, 0, 1, 1,
0.5265855, 0.7083502, 0.2995985, 0.345098, 0, 1, 1,
0.5298151, 0.8699949, 1.341237, 0.3490196, 0, 1, 1,
0.5311354, -1.758263, 0.5270315, 0.3568628, 0, 1, 1,
0.5340365, -0.5239524, 0.7026774, 0.3607843, 0, 1, 1,
0.5476059, -0.04992673, 2.23538, 0.3686275, 0, 1, 1,
0.560456, 3.05362, 1.173355, 0.372549, 0, 1, 1,
0.5739611, -0.4192503, 3.426268, 0.3803922, 0, 1, 1,
0.5808176, -0.8276157, 1.550815, 0.3843137, 0, 1, 1,
0.5836552, -1.464596, 1.933845, 0.3921569, 0, 1, 1,
0.5878536, 0.6565755, 1.701943, 0.3960784, 0, 1, 1,
0.5938247, 0.8805367, 0.9796035, 0.4039216, 0, 1, 1,
0.6039656, 1.629776, 0.4806975, 0.4117647, 0, 1, 1,
0.6041712, 1.106689, -0.03611564, 0.4156863, 0, 1, 1,
0.6063955, 0.6126486, 1.913008, 0.4235294, 0, 1, 1,
0.6100643, -1.943266, 3.102978, 0.427451, 0, 1, 1,
0.6165081, -0.5320098, 2.005007, 0.4352941, 0, 1, 1,
0.6172047, 0.2118297, -0.3464393, 0.4392157, 0, 1, 1,
0.6175197, -1.300152, 1.686266, 0.4470588, 0, 1, 1,
0.6181604, -2.339895, 3.576005, 0.4509804, 0, 1, 1,
0.6221045, -0.4023367, 2.218062, 0.4588235, 0, 1, 1,
0.6293144, 1.601703, -0.5191386, 0.4627451, 0, 1, 1,
0.6390295, 1.011554, 0.8138903, 0.4705882, 0, 1, 1,
0.63921, 1.594631, -0.3193587, 0.4745098, 0, 1, 1,
0.6431604, 0.1337118, 0.884322, 0.4823529, 0, 1, 1,
0.6458172, 0.03936519, 2.698147, 0.4862745, 0, 1, 1,
0.647315, -0.231704, 2.699194, 0.4941176, 0, 1, 1,
0.6488928, -0.6261635, 2.640848, 0.5019608, 0, 1, 1,
0.6505229, 0.1590722, 1.608804, 0.5058824, 0, 1, 1,
0.6519092, -0.9403601, 3.474567, 0.5137255, 0, 1, 1,
0.653299, -0.377894, 1.263908, 0.5176471, 0, 1, 1,
0.6546593, -1.249402, 4.067621, 0.5254902, 0, 1, 1,
0.6549938, -0.9684502, 2.810886, 0.5294118, 0, 1, 1,
0.6566026, 0.115101, 1.207438, 0.5372549, 0, 1, 1,
0.6583112, -0.3413158, 1.744476, 0.5411765, 0, 1, 1,
0.6586264, 1.692077, 0.7518911, 0.5490196, 0, 1, 1,
0.6590676, -1.646721, 3.058854, 0.5529412, 0, 1, 1,
0.6631691, -0.9081801, 1.334966, 0.5607843, 0, 1, 1,
0.6647413, -0.835403, 3.209894, 0.5647059, 0, 1, 1,
0.6660702, 0.08657674, -0.3272227, 0.572549, 0, 1, 1,
0.668891, -0.2686076, 1.543893, 0.5764706, 0, 1, 1,
0.670328, 1.841032, -0.3641793, 0.5843138, 0, 1, 1,
0.6773597, 0.1757343, 1.215834, 0.5882353, 0, 1, 1,
0.6825304, -0.8750979, 2.843842, 0.5960785, 0, 1, 1,
0.6958241, 0.4704025, 1.616257, 0.6039216, 0, 1, 1,
0.7003711, 0.2508294, 0.692588, 0.6078432, 0, 1, 1,
0.7009691, -0.8827332, 2.881663, 0.6156863, 0, 1, 1,
0.7044133, -1.340649, 3.29321, 0.6196079, 0, 1, 1,
0.7052632, 0.619179, 2.233805, 0.627451, 0, 1, 1,
0.7120862, -1.834712, 3.097958, 0.6313726, 0, 1, 1,
0.7222508, -0.07837752, 1.933286, 0.6392157, 0, 1, 1,
0.7224385, -0.03273936, 0.02148228, 0.6431373, 0, 1, 1,
0.7238313, -0.03014659, 1.661035, 0.6509804, 0, 1, 1,
0.7252124, -0.5906166, 1.847775, 0.654902, 0, 1, 1,
0.7338217, 0.180627, 1.461049, 0.6627451, 0, 1, 1,
0.7354253, -0.167713, 1.734201, 0.6666667, 0, 1, 1,
0.7374674, 1.473029, 2.653628, 0.6745098, 0, 1, 1,
0.742754, -0.2928604, 1.578082, 0.6784314, 0, 1, 1,
0.7444858, -0.8742214, 2.902762, 0.6862745, 0, 1, 1,
0.7453801, 1.295617, 1.773119, 0.6901961, 0, 1, 1,
0.7462704, 1.107148, 1.703582, 0.6980392, 0, 1, 1,
0.7491938, -0.5687208, 2.385572, 0.7058824, 0, 1, 1,
0.7537217, 1.128562, 1.460831, 0.7098039, 0, 1, 1,
0.7567066, -0.8077379, 2.021391, 0.7176471, 0, 1, 1,
0.7672616, 0.8737351, 1.054877, 0.7215686, 0, 1, 1,
0.7690771, 0.05186488, 1.090146, 0.7294118, 0, 1, 1,
0.77138, -0.1728227, 0.979148, 0.7333333, 0, 1, 1,
0.7714126, 0.6497052, 0.6480055, 0.7411765, 0, 1, 1,
0.7715878, 0.268301, 0.01683934, 0.7450981, 0, 1, 1,
0.7735606, -0.2596139, 0.2991705, 0.7529412, 0, 1, 1,
0.7736152, -0.6988087, 1.097487, 0.7568628, 0, 1, 1,
0.7742041, 0.8177854, -1.773676, 0.7647059, 0, 1, 1,
0.7759629, -1.293079, 1.711266, 0.7686275, 0, 1, 1,
0.7860496, 0.7681091, -0.0936498, 0.7764706, 0, 1, 1,
0.7900145, 0.5268661, -1.020151, 0.7803922, 0, 1, 1,
0.7905262, -0.2967103, -0.06767442, 0.7882353, 0, 1, 1,
0.7981094, 0.17414, -0.6050296, 0.7921569, 0, 1, 1,
0.8012378, 0.7139148, 0.6250408, 0.8, 0, 1, 1,
0.8143424, 0.1765659, 1.632249, 0.8078431, 0, 1, 1,
0.8173765, -0.7149171, 1.557553, 0.8117647, 0, 1, 1,
0.8198393, 0.5610595, 1.937493, 0.8196079, 0, 1, 1,
0.8229989, 1.286887, -1.103834, 0.8235294, 0, 1, 1,
0.8235683, -1.578766, -0.2302956, 0.8313726, 0, 1, 1,
0.824759, 0.2551663, 0.9737336, 0.8352941, 0, 1, 1,
0.833288, 0.1231437, 2.823057, 0.8431373, 0, 1, 1,
0.8463082, -0.1855652, 1.866197, 0.8470588, 0, 1, 1,
0.8516321, 0.9766633, 0.8048083, 0.854902, 0, 1, 1,
0.8602434, -1.943913, 1.468297, 0.8588235, 0, 1, 1,
0.8609047, 1.086682, 1.481788, 0.8666667, 0, 1, 1,
0.8656213, 0.04313643, 1.961596, 0.8705882, 0, 1, 1,
0.8681703, -0.4274221, 2.630575, 0.8784314, 0, 1, 1,
0.8706338, -0.0346421, 0.3381737, 0.8823529, 0, 1, 1,
0.8711117, 1.160532, -0.5219303, 0.8901961, 0, 1, 1,
0.8741147, 0.03822188, -0.04574155, 0.8941177, 0, 1, 1,
0.8857837, -0.7991638, 2.786114, 0.9019608, 0, 1, 1,
0.8871104, 0.6241353, -0.8934679, 0.9098039, 0, 1, 1,
0.8872482, -0.2530343, 1.954383, 0.9137255, 0, 1, 1,
0.8880739, 0.4051237, -0.6865368, 0.9215686, 0, 1, 1,
0.8916577, 1.477617, 0.5795108, 0.9254902, 0, 1, 1,
0.8938209, 1.00181, 0.9431238, 0.9333333, 0, 1, 1,
0.8942516, 0.289017, 1.697492, 0.9372549, 0, 1, 1,
0.9006265, -1.232213, 4.016582, 0.945098, 0, 1, 1,
0.9014694, -1.080709, 1.731615, 0.9490196, 0, 1, 1,
0.9057246, 0.001509934, 1.37556, 0.9568627, 0, 1, 1,
0.9072685, 0.09290567, 2.174966, 0.9607843, 0, 1, 1,
0.9104067, 1.698619, 1.194136, 0.9686275, 0, 1, 1,
0.9148551, 0.1755329, 1.322783, 0.972549, 0, 1, 1,
0.9164751, -1.821965, 3.334985, 0.9803922, 0, 1, 1,
0.9213809, -0.2012274, -0.4415725, 0.9843137, 0, 1, 1,
0.9330423, -0.6691646, 3.781847, 0.9921569, 0, 1, 1,
0.9361262, 0.8544197, 0.7138551, 0.9960784, 0, 1, 1,
0.9459718, 0.3826133, 1.703744, 1, 0, 0.9960784, 1,
0.9465941, 0.8608432, 1.960872, 1, 0, 0.9882353, 1,
0.9493967, -0.7549858, 2.052413, 1, 0, 0.9843137, 1,
0.9524854, 1.536, -0.2155185, 1, 0, 0.9764706, 1,
0.9525217, -1.667625, 2.275411, 1, 0, 0.972549, 1,
0.9534175, 0.6524718, 2.035375, 1, 0, 0.9647059, 1,
0.9586705, 0.2469659, 2.155915, 1, 0, 0.9607843, 1,
0.9590381, 1.420962, 1.756521, 1, 0, 0.9529412, 1,
0.9628199, 1.001305, 0.9009262, 1, 0, 0.9490196, 1,
0.9685902, 0.5592144, 0.2921433, 1, 0, 0.9411765, 1,
0.998893, -0.4202181, 3.851038, 1, 0, 0.9372549, 1,
1.003525, -1.116922, 3.232537, 1, 0, 0.9294118, 1,
1.009975, 0.5135522, 0.5102976, 1, 0, 0.9254902, 1,
1.010262, 1.203637, 0.9209928, 1, 0, 0.9176471, 1,
1.015557, 2.357965, -0.5638923, 1, 0, 0.9137255, 1,
1.017535, -0.05233138, 1.743289, 1, 0, 0.9058824, 1,
1.022472, -0.04676079, 1.307187, 1, 0, 0.9019608, 1,
1.028194, 0.9255552, 3.310959, 1, 0, 0.8941177, 1,
1.049551, -0.669345, 2.41231, 1, 0, 0.8862745, 1,
1.05045, 0.3813463, 0.6463163, 1, 0, 0.8823529, 1,
1.051126, 1.340054, 1.709351, 1, 0, 0.8745098, 1,
1.054835, 2.686176, 1.244594, 1, 0, 0.8705882, 1,
1.069247, 0.8107143, 1.392674, 1, 0, 0.8627451, 1,
1.072666, 0.3024845, -0.2761737, 1, 0, 0.8588235, 1,
1.073723, -0.07205687, 3.147581, 1, 0, 0.8509804, 1,
1.07428, 0.1828893, 1.027676, 1, 0, 0.8470588, 1,
1.074385, 0.1838806, 2.098694, 1, 0, 0.8392157, 1,
1.079743, -0.1945712, 0.9218562, 1, 0, 0.8352941, 1,
1.082231, -1.681206, 3.255469, 1, 0, 0.827451, 1,
1.086544, -0.3723235, -0.05324896, 1, 0, 0.8235294, 1,
1.089464, 1.617743, 1.750162, 1, 0, 0.8156863, 1,
1.09243, 0.3938214, 0.6541631, 1, 0, 0.8117647, 1,
1.093568, 1.043747, 1.997642, 1, 0, 0.8039216, 1,
1.096018, -0.08991712, 2.348884, 1, 0, 0.7960784, 1,
1.102674, 1.252979, 0.5276428, 1, 0, 0.7921569, 1,
1.108947, -0.8973085, 1.792504, 1, 0, 0.7843137, 1,
1.109071, 1.653111, -0.4201685, 1, 0, 0.7803922, 1,
1.109637, -1.132672, 2.238709, 1, 0, 0.772549, 1,
1.114869, -1.639069, 1.847677, 1, 0, 0.7686275, 1,
1.11566, -0.07713649, 1.102991, 1, 0, 0.7607843, 1,
1.116522, 1.205347, 0.7073265, 1, 0, 0.7568628, 1,
1.119875, -1.820043, 3.626897, 1, 0, 0.7490196, 1,
1.120686, -0.92414, 1.377614, 1, 0, 0.7450981, 1,
1.126248, 0.07404834, 2.810484, 1, 0, 0.7372549, 1,
1.127277, 0.7346134, 0.7473201, 1, 0, 0.7333333, 1,
1.139211, -0.9408126, 3.712993, 1, 0, 0.7254902, 1,
1.141648, -0.3120577, 2.964317, 1, 0, 0.7215686, 1,
1.142811, -1.009634, 1.357266, 1, 0, 0.7137255, 1,
1.144368, 0.06472655, -0.2861258, 1, 0, 0.7098039, 1,
1.145404, -1.495067, 2.926336, 1, 0, 0.7019608, 1,
1.147697, 1.080483, 0.7396696, 1, 0, 0.6941177, 1,
1.149731, 1.87105, 0.5369028, 1, 0, 0.6901961, 1,
1.149854, 0.2464775, 0.6083736, 1, 0, 0.682353, 1,
1.158415, 0.8333282, 1.552946, 1, 0, 0.6784314, 1,
1.169614, 2.530942, -0.03292671, 1, 0, 0.6705883, 1,
1.182134, -1.21074, 2.606742, 1, 0, 0.6666667, 1,
1.188151, -1.113116, 1.152048, 1, 0, 0.6588235, 1,
1.188159, -1.267716, 0.9455751, 1, 0, 0.654902, 1,
1.190629, -1.116787, 2.224174, 1, 0, 0.6470588, 1,
1.196487, 1.198343, 1.940856, 1, 0, 0.6431373, 1,
1.214048, -0.2116209, 0.5632489, 1, 0, 0.6352941, 1,
1.216407, -0.109178, 0.448529, 1, 0, 0.6313726, 1,
1.225311, 0.1048284, 1.114894, 1, 0, 0.6235294, 1,
1.225891, -1.26502, 1.179242, 1, 0, 0.6196079, 1,
1.22615, -0.06784719, 2.551375, 1, 0, 0.6117647, 1,
1.226649, -0.1256055, 2.754806, 1, 0, 0.6078432, 1,
1.22865, -0.9356082, 1.871373, 1, 0, 0.6, 1,
1.236031, -2.154278, 1.792173, 1, 0, 0.5921569, 1,
1.237162, 0.8785935, 0.3379318, 1, 0, 0.5882353, 1,
1.237778, 0.01963518, 0.7233589, 1, 0, 0.5803922, 1,
1.242316, -0.6500595, 0.9989575, 1, 0, 0.5764706, 1,
1.25679, -0.6234059, 1.027964, 1, 0, 0.5686275, 1,
1.257436, 1.082871, 1.820319, 1, 0, 0.5647059, 1,
1.25764, 0.9384988, 0.7537966, 1, 0, 0.5568628, 1,
1.260961, 1.070416, -0.4066567, 1, 0, 0.5529412, 1,
1.263476, 0.2679457, 0.7564934, 1, 0, 0.5450981, 1,
1.263516, -0.6881917, 3.298756, 1, 0, 0.5411765, 1,
1.280891, 2.076482, 2.242239, 1, 0, 0.5333334, 1,
1.288501, 0.2864079, 2.934015, 1, 0, 0.5294118, 1,
1.300157, 0.06182018, 2.606278, 1, 0, 0.5215687, 1,
1.3019, 0.4591381, 0.4653281, 1, 0, 0.5176471, 1,
1.302159, -0.1157876, 1.566648, 1, 0, 0.509804, 1,
1.307725, 0.1842108, 1.325011, 1, 0, 0.5058824, 1,
1.318518, -0.1890852, 1.265436, 1, 0, 0.4980392, 1,
1.321552, -1.543028, 3.557065, 1, 0, 0.4901961, 1,
1.336201, 0.1186222, -0.3765949, 1, 0, 0.4862745, 1,
1.337517, -0.5325439, 2.31287, 1, 0, 0.4784314, 1,
1.346119, -0.7730194, 1.583094, 1, 0, 0.4745098, 1,
1.349601, 0.410482, 2.540195, 1, 0, 0.4666667, 1,
1.356866, 0.7497708, 0.6675586, 1, 0, 0.4627451, 1,
1.36533, 0.5093846, 2.015568, 1, 0, 0.454902, 1,
1.370431, 0.5934325, 2.05543, 1, 0, 0.4509804, 1,
1.376636, -0.3685459, 3.292783, 1, 0, 0.4431373, 1,
1.383626, -0.07343762, 2.186642, 1, 0, 0.4392157, 1,
1.396822, 0.2864935, 2.230747, 1, 0, 0.4313726, 1,
1.408286, -1.106129, 2.227779, 1, 0, 0.427451, 1,
1.41277, 1.112421, -0.1293668, 1, 0, 0.4196078, 1,
1.425997, 0.1847977, 2.729061, 1, 0, 0.4156863, 1,
1.43541, -0.9988643, 3.003889, 1, 0, 0.4078431, 1,
1.442301, 1.205273, -0.5098207, 1, 0, 0.4039216, 1,
1.446943, 1.401258, 1.889673, 1, 0, 0.3960784, 1,
1.448473, -0.5133455, 2.11008, 1, 0, 0.3882353, 1,
1.45275, 2.012613, 0.9832678, 1, 0, 0.3843137, 1,
1.465458, -0.4547195, 1.665814, 1, 0, 0.3764706, 1,
1.466827, -0.2808163, 1.397792, 1, 0, 0.372549, 1,
1.469665, -0.2967505, 1.555934, 1, 0, 0.3647059, 1,
1.471621, 0.497904, 0.7304407, 1, 0, 0.3607843, 1,
1.475108, 0.2990963, 1.657212, 1, 0, 0.3529412, 1,
1.496777, 0.3332548, 0.5210491, 1, 0, 0.3490196, 1,
1.498077, -1.041196, 3.835357, 1, 0, 0.3411765, 1,
1.499464, -2.021241, 2.355219, 1, 0, 0.3372549, 1,
1.500605, -2.190325, 2.677658, 1, 0, 0.3294118, 1,
1.512632, 0.2282215, 1.391524, 1, 0, 0.3254902, 1,
1.521009, 0.5162985, 3.048954, 1, 0, 0.3176471, 1,
1.52412, -0.9238478, 0.9177469, 1, 0, 0.3137255, 1,
1.572125, 0.7808664, 0.958277, 1, 0, 0.3058824, 1,
1.586024, -0.5996239, 2.651012, 1, 0, 0.2980392, 1,
1.629342, -1.229851, 0.003983682, 1, 0, 0.2941177, 1,
1.630601, 1.297076, 1.875025, 1, 0, 0.2862745, 1,
1.654691, 0.4013367, 1.800924, 1, 0, 0.282353, 1,
1.660151, -0.8320724, 2.281681, 1, 0, 0.2745098, 1,
1.675016, 0.6420978, 0.521628, 1, 0, 0.2705882, 1,
1.680868, -0.1689825, 1.987744, 1, 0, 0.2627451, 1,
1.689463, 1.056482, -0.0449156, 1, 0, 0.2588235, 1,
1.721609, 1.164094, 0.9185366, 1, 0, 0.2509804, 1,
1.738962, 1.040854, -0.1289787, 1, 0, 0.2470588, 1,
1.739573, 1.15879, 1.498688, 1, 0, 0.2392157, 1,
1.746074, 1.567967, 0.557053, 1, 0, 0.2352941, 1,
1.752793, -1.639857, 1.107189, 1, 0, 0.227451, 1,
1.764941, 0.5477003, 0.1860015, 1, 0, 0.2235294, 1,
1.767102, -1.47338, 3.297075, 1, 0, 0.2156863, 1,
1.767327, -1.918694, 2.382961, 1, 0, 0.2117647, 1,
1.773357, 0.9069777, 3.318175, 1, 0, 0.2039216, 1,
1.774536, 0.3221449, 2.427034, 1, 0, 0.1960784, 1,
1.787366, -0.46569, 0.9609309, 1, 0, 0.1921569, 1,
1.790343, -1.176122, 1.888983, 1, 0, 0.1843137, 1,
1.862965, 0.8409528, 0.6510891, 1, 0, 0.1803922, 1,
1.86387, -1.059086, 1.538085, 1, 0, 0.172549, 1,
1.872413, 0.9728832, 0.8045417, 1, 0, 0.1686275, 1,
1.887234, 1.473395, -0.1791864, 1, 0, 0.1607843, 1,
1.894946, 0.2455258, 2.098372, 1, 0, 0.1568628, 1,
1.899596, 0.6077682, -0.5537764, 1, 0, 0.1490196, 1,
1.919168, 0.07440341, 1.766525, 1, 0, 0.145098, 1,
1.921797, -1.344676, 1.736579, 1, 0, 0.1372549, 1,
1.932661, -1.278295, 1.432917, 1, 0, 0.1333333, 1,
1.948811, 1.045331, 0.2490841, 1, 0, 0.1254902, 1,
1.992548, 1.059327, 1.218491, 1, 0, 0.1215686, 1,
1.995054, -2.261806, 2.734562, 1, 0, 0.1137255, 1,
2.007656, 0.4001681, 3.62897, 1, 0, 0.1098039, 1,
2.020366, 0.154562, 1.709299, 1, 0, 0.1019608, 1,
2.046062, 1.631161, 1.032192, 1, 0, 0.09411765, 1,
2.064656, -0.6593446, 3.744002, 1, 0, 0.09019608, 1,
2.18858, 0.1229739, 0.3892244, 1, 0, 0.08235294, 1,
2.200763, -0.2626491, 1.578709, 1, 0, 0.07843138, 1,
2.220264, 0.1570774, 1.598535, 1, 0, 0.07058824, 1,
2.239611, -0.9902179, 1.218856, 1, 0, 0.06666667, 1,
2.293435, 0.8850518, 2.981731, 1, 0, 0.05882353, 1,
2.304328, -1.526666, 3.743179, 1, 0, 0.05490196, 1,
2.310357, -1.227392, 2.821268, 1, 0, 0.04705882, 1,
2.370307, -0.4449185, 3.656808, 1, 0, 0.04313726, 1,
2.508897, 1.463023, 1.118766, 1, 0, 0.03529412, 1,
2.707118, -0.7130103, 2.717485, 1, 0, 0.03137255, 1,
2.713016, -1.222847, 3.564022, 1, 0, 0.02352941, 1,
2.805639, 0.7618175, 0.7590395, 1, 0, 0.01960784, 1,
2.905988, 0.6979957, -0.7432958, 1, 0, 0.01176471, 1,
3.036529, -0.03143941, 1.930001, 1, 0, 0.007843138, 1
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
-0.1004297, -4.026684, -7.054358, 0, -0.5, 0.5, 0.5,
-0.1004297, -4.026684, -7.054358, 1, -0.5, 0.5, 0.5,
-0.1004297, -4.026684, -7.054358, 1, 1.5, 0.5, 0.5,
-0.1004297, -4.026684, -7.054358, 0, 1.5, 0.5, 0.5
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
-4.300817, 0.1279243, -7.054358, 0, -0.5, 0.5, 0.5,
-4.300817, 0.1279243, -7.054358, 1, -0.5, 0.5, 0.5,
-4.300817, 0.1279243, -7.054358, 1, 1.5, 0.5, 0.5,
-4.300817, 0.1279243, -7.054358, 0, 1.5, 0.5, 0.5
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
-4.300817, -4.026684, 0.6902835, 0, -0.5, 0.5, 0.5,
-4.300817, -4.026684, 0.6902835, 1, -0.5, 0.5, 0.5,
-4.300817, -4.026684, 0.6902835, 1, 1.5, 0.5, 0.5,
-4.300817, -4.026684, 0.6902835, 0, 1.5, 0.5, 0.5
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
-3, -3.067928, -5.267133,
3, -3.067928, -5.267133,
-3, -3.067928, -5.267133,
-3, -3.227721, -5.565004,
-2, -3.067928, -5.267133,
-2, -3.227721, -5.565004,
-1, -3.067928, -5.267133,
-1, -3.227721, -5.565004,
0, -3.067928, -5.267133,
0, -3.227721, -5.565004,
1, -3.067928, -5.267133,
1, -3.227721, -5.565004,
2, -3.067928, -5.267133,
2, -3.227721, -5.565004,
3, -3.067928, -5.267133,
3, -3.227721, -5.565004
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
-3, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
-3, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
-3, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
-2, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
-2, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
-2, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
-2, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
-1, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
-1, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
-1, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
-1, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
0, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
0, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
0, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
0, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
1, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
1, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
1, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
1, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
2, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
2, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
2, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
2, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5,
3, -3.547306, -6.160746, 0, -0.5, 0.5, 0.5,
3, -3.547306, -6.160746, 1, -0.5, 0.5, 0.5,
3, -3.547306, -6.160746, 1, 1.5, 0.5, 0.5,
3, -3.547306, -6.160746, 0, 1.5, 0.5, 0.5
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
-3.331497, -2, -5.267133,
-3.331497, 3, -5.267133,
-3.331497, -2, -5.267133,
-3.493051, -2, -5.565004,
-3.331497, -1, -5.267133,
-3.493051, -1, -5.565004,
-3.331497, 0, -5.267133,
-3.493051, 0, -5.565004,
-3.331497, 1, -5.267133,
-3.493051, 1, -5.565004,
-3.331497, 2, -5.267133,
-3.493051, 2, -5.565004,
-3.331497, 3, -5.267133,
-3.493051, 3, -5.565004
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
-3.816157, -2, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, -2, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, -2, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, -2, -6.160746, 0, 1.5, 0.5, 0.5,
-3.816157, -1, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, -1, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, -1, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, -1, -6.160746, 0, 1.5, 0.5, 0.5,
-3.816157, 0, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, 0, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, 0, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, 0, -6.160746, 0, 1.5, 0.5, 0.5,
-3.816157, 1, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, 1, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, 1, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, 1, -6.160746, 0, 1.5, 0.5, 0.5,
-3.816157, 2, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, 2, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, 2, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, 2, -6.160746, 0, 1.5, 0.5, 0.5,
-3.816157, 3, -6.160746, 0, -0.5, 0.5, 0.5,
-3.816157, 3, -6.160746, 1, -0.5, 0.5, 0.5,
-3.816157, 3, -6.160746, 1, 1.5, 0.5, 0.5,
-3.816157, 3, -6.160746, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.331497, -3.067928, -4,
-3.331497, -3.067928, 6,
-3.331497, -3.067928, -4,
-3.493051, -3.227721, -4,
-3.331497, -3.067928, -2,
-3.493051, -3.227721, -2,
-3.331497, -3.067928, 0,
-3.493051, -3.227721, 0,
-3.331497, -3.067928, 2,
-3.493051, -3.227721, 2,
-3.331497, -3.067928, 4,
-3.493051, -3.227721, 4,
-3.331497, -3.067928, 6,
-3.493051, -3.227721, 6
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
"4",
"6"
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
-3.816157, -3.547306, -4, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, -4, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, -4, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, -4, 0, 1.5, 0.5, 0.5,
-3.816157, -3.547306, -2, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, -2, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, -2, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, -2, 0, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 0, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 0, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 0, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 0, 0, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 2, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 2, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 2, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 2, 0, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 4, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 4, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 4, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 4, 0, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 6, 0, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 6, 1, -0.5, 0.5, 0.5,
-3.816157, -3.547306, 6, 1, 1.5, 0.5, 0.5,
-3.816157, -3.547306, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.331497, -3.067928, -5.267133,
-3.331497, 3.323777, -5.267133,
-3.331497, -3.067928, 6.6477,
-3.331497, 3.323777, 6.6477,
-3.331497, -3.067928, -5.267133,
-3.331497, -3.067928, 6.6477,
-3.331497, 3.323777, -5.267133,
-3.331497, 3.323777, 6.6477,
-3.331497, -3.067928, -5.267133,
3.130638, -3.067928, -5.267133,
-3.331497, -3.067928, 6.6477,
3.130638, -3.067928, 6.6477,
-3.331497, 3.323777, -5.267133,
3.130638, 3.323777, -5.267133,
-3.331497, 3.323777, 6.6477,
3.130638, 3.323777, 6.6477,
3.130638, -3.067928, -5.267133,
3.130638, 3.323777, -5.267133,
3.130638, -3.067928, 6.6477,
3.130638, 3.323777, 6.6477,
3.130638, -3.067928, -5.267133,
3.130638, -3.067928, 6.6477,
3.130638, 3.323777, -5.267133,
3.130638, 3.323777, 6.6477
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
var radius = 8.002164;
var distance = 35.60253;
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
mvMatrix.translate( 0.1004297, -0.1279243, -0.6902835 );
mvMatrix.scale( 1.338891, 1.353644, 0.7261618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.60253);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Naled<-read.table("Naled.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Naled$V2
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
```

```r
y<-Naled$V3
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
```

```r
z<-Naled$V4
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
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
-3.237388, 1.181085, -1.72939, 0, 0, 1, 1, 1,
-3.199731, 0.8359305, -2.66108, 1, 0, 0, 1, 1,
-2.876728, 0.3791859, -1.129175, 1, 0, 0, 1, 1,
-2.616227, 1.741586, -0.1600757, 1, 0, 0, 1, 1,
-2.584523, 2.151165, -1.16788, 1, 0, 0, 1, 1,
-2.55604, 0.6471907, -1.335657, 1, 0, 0, 1, 1,
-2.553984, 0.08056499, -1.827524, 0, 0, 0, 1, 1,
-2.495573, 1.125485, -4.090961, 0, 0, 0, 1, 1,
-2.436258, -0.2968732, -0.5083603, 0, 0, 0, 1, 1,
-2.42827, -0.7043245, -2.80219, 0, 0, 0, 1, 1,
-2.413279, -0.6672384, -0.7354116, 0, 0, 0, 1, 1,
-2.387029, 2.235115, -1.558537, 0, 0, 0, 1, 1,
-2.360867, 0.4679056, 0.1266929, 0, 0, 0, 1, 1,
-2.256242, -0.3933588, -1.830266, 1, 1, 1, 1, 1,
-2.243729, 0.1871881, -3.654739, 1, 1, 1, 1, 1,
-2.229224, 0.6324806, 0.7065536, 1, 1, 1, 1, 1,
-2.222077, -0.2822756, -0.7136702, 1, 1, 1, 1, 1,
-2.178793, 0.1981367, -2.735141, 1, 1, 1, 1, 1,
-2.176253, -0.2831431, -2.602385, 1, 1, 1, 1, 1,
-2.122893, -2.100876, -2.555616, 1, 1, 1, 1, 1,
-2.12023, -1.818687, -0.3281486, 1, 1, 1, 1, 1,
-2.119991, -0.5563036, -2.430397, 1, 1, 1, 1, 1,
-2.057582, -1.955462, -3.497375, 1, 1, 1, 1, 1,
-2.035249, -1.109955, -1.291353, 1, 1, 1, 1, 1,
-2.024799, -0.7322822, -2.465056, 1, 1, 1, 1, 1,
-1.99033, 0.04505698, -0.2511809, 1, 1, 1, 1, 1,
-1.977167, -0.6304047, -1.605507, 1, 1, 1, 1, 1,
-1.96826, 1.498264, -1.332265, 1, 1, 1, 1, 1,
-1.950859, 0.2539275, -3.437164, 0, 0, 1, 1, 1,
-1.948162, 0.05696792, -2.292016, 1, 0, 0, 1, 1,
-1.928703, -0.3111102, -3.973971, 1, 0, 0, 1, 1,
-1.924315, -0.09826512, -3.553849, 1, 0, 0, 1, 1,
-1.912499, -1.839354, -2.578109, 1, 0, 0, 1, 1,
-1.903761, 0.002957498, -1.800239, 1, 0, 0, 1, 1,
-1.87369, -1.184833, -4.190241, 0, 0, 0, 1, 1,
-1.870755, -1.813817, -3.832411, 0, 0, 0, 1, 1,
-1.857843, 0.348593, -2.288308, 0, 0, 0, 1, 1,
-1.856387, 1.621106, -0.5578377, 0, 0, 0, 1, 1,
-1.841409, 0.1046897, -1.315364, 0, 0, 0, 1, 1,
-1.838158, 0.7301235, -2.183548, 0, 0, 0, 1, 1,
-1.81625, 0.7881019, -1.112712, 0, 0, 0, 1, 1,
-1.80558, 0.6333902, -0.3220623, 1, 1, 1, 1, 1,
-1.805357, 2.357585, -1.015175, 1, 1, 1, 1, 1,
-1.799986, 0.5683466, -1.844259, 1, 1, 1, 1, 1,
-1.792, -1.533405, -3.145396, 1, 1, 1, 1, 1,
-1.789899, 1.587864, -1.879221, 1, 1, 1, 1, 1,
-1.78483, -0.5219221, -1.516627, 1, 1, 1, 1, 1,
-1.781744, 1.220021, -2.770679, 1, 1, 1, 1, 1,
-1.768189, 0.434184, -0.8804839, 1, 1, 1, 1, 1,
-1.764781, 1.42739, 0.4298579, 1, 1, 1, 1, 1,
-1.762219, -0.402407, -2.466228, 1, 1, 1, 1, 1,
-1.748546, -2.142614, -3.877321, 1, 1, 1, 1, 1,
-1.736587, 0.4122111, 0.6210948, 1, 1, 1, 1, 1,
-1.714425, 0.4281697, -0.5372047, 1, 1, 1, 1, 1,
-1.709314, 1.000629, -1.683545, 1, 1, 1, 1, 1,
-1.690043, -0.4757701, -1.111734, 1, 1, 1, 1, 1,
-1.684134, -0.233993, -0.9253312, 0, 0, 1, 1, 1,
-1.683263, 0.9964226, -2.943484, 1, 0, 0, 1, 1,
-1.671479, 0.8016383, -1.932121, 1, 0, 0, 1, 1,
-1.651443, -0.8833491, -2.046123, 1, 0, 0, 1, 1,
-1.644446, -0.5911689, -1.60749, 1, 0, 0, 1, 1,
-1.629224, -0.2387912, -1.752083, 1, 0, 0, 1, 1,
-1.610049, -1.454695, -2.30351, 0, 0, 0, 1, 1,
-1.571164, -1.225002, -0.4680628, 0, 0, 0, 1, 1,
-1.566183, 1.552091, -0.9775468, 0, 0, 0, 1, 1,
-1.564709, 1.157467, -0.1600228, 0, 0, 0, 1, 1,
-1.543473, 0.4741997, 1.045089, 0, 0, 0, 1, 1,
-1.543055, 2.088629, 0.1886873, 0, 0, 0, 1, 1,
-1.540063, 0.3746113, -0.188602, 0, 0, 0, 1, 1,
-1.528424, 1.865211, 1.475113, 1, 1, 1, 1, 1,
-1.528035, -2.039291, -3.025551, 1, 1, 1, 1, 1,
-1.524815, 0.6726363, 1.489704, 1, 1, 1, 1, 1,
-1.524612, 0.8514082, -2.615716, 1, 1, 1, 1, 1,
-1.499953, -0.2350427, -1.959095, 1, 1, 1, 1, 1,
-1.493436, 0.3697436, -2.156792, 1, 1, 1, 1, 1,
-1.493424, -0.8803285, -2.772095, 1, 1, 1, 1, 1,
-1.473418, -1.695743, -1.354616, 1, 1, 1, 1, 1,
-1.464484, -1.294595, -2.83876, 1, 1, 1, 1, 1,
-1.451268, 0.8200523, -1.754587, 1, 1, 1, 1, 1,
-1.435925, 1.107008, -1.082004, 1, 1, 1, 1, 1,
-1.43493, 1.725302, -0.9257081, 1, 1, 1, 1, 1,
-1.434824, -0.04232252, -0.7370293, 1, 1, 1, 1, 1,
-1.431436, 2.184755, -1.725058, 1, 1, 1, 1, 1,
-1.429542, -0.6895472, -1.702097, 1, 1, 1, 1, 1,
-1.42312, -1.599038, -1.788878, 0, 0, 1, 1, 1,
-1.412401, 0.4534279, 0.7793078, 1, 0, 0, 1, 1,
-1.409936, 0.480127, -2.338467, 1, 0, 0, 1, 1,
-1.407155, 0.5113233, 0.3386155, 1, 0, 0, 1, 1,
-1.405771, 0.04990021, -1.964628, 1, 0, 0, 1, 1,
-1.405628, -0.3361018, -3.257352, 1, 0, 0, 1, 1,
-1.396957, 0.1087987, 0.3288609, 0, 0, 0, 1, 1,
-1.395505, 0.5112372, 0.5138575, 0, 0, 0, 1, 1,
-1.393533, -1.663493, -3.541745, 0, 0, 0, 1, 1,
-1.392606, 0.2440744, -1.424686, 0, 0, 0, 1, 1,
-1.392532, 0.5315528, 0.2565108, 0, 0, 0, 1, 1,
-1.39118, -0.8708391, -3.036822, 0, 0, 0, 1, 1,
-1.388044, -0.1066665, -0.1355947, 0, 0, 0, 1, 1,
-1.38777, 0.3660683, -2.457945, 1, 1, 1, 1, 1,
-1.385962, 0.2262713, -2.073513, 1, 1, 1, 1, 1,
-1.365456, -0.07112557, -3.428422, 1, 1, 1, 1, 1,
-1.354418, 1.116032, -0.4390478, 1, 1, 1, 1, 1,
-1.346606, -1.547341, -3.350083, 1, 1, 1, 1, 1,
-1.345514, -0.5540137, -2.509025, 1, 1, 1, 1, 1,
-1.342524, -0.5455573, -1.225989, 1, 1, 1, 1, 1,
-1.337659, -0.2307499, -3.285567, 1, 1, 1, 1, 1,
-1.337026, 0.6207573, -0.537303, 1, 1, 1, 1, 1,
-1.325757, -0.708629, -2.245619, 1, 1, 1, 1, 1,
-1.323072, -1.055295, -4.460255, 1, 1, 1, 1, 1,
-1.310071, 0.05357098, -2.415348, 1, 1, 1, 1, 1,
-1.291826, 0.4645486, -2.160846, 1, 1, 1, 1, 1,
-1.288159, 1.333656, -1.209625, 1, 1, 1, 1, 1,
-1.277694, -1.195001, -1.068701, 1, 1, 1, 1, 1,
-1.273589, -1.473284, -2.767772, 0, 0, 1, 1, 1,
-1.271952, 0.527568, -1.111788, 1, 0, 0, 1, 1,
-1.268686, -0.5788724, -1.654289, 1, 0, 0, 1, 1,
-1.267215, -0.8141608, -2.463926, 1, 0, 0, 1, 1,
-1.266658, -0.3839248, -3.072176, 1, 0, 0, 1, 1,
-1.263166, 1.775615, -0.8143759, 1, 0, 0, 1, 1,
-1.262163, 0.8820133, 0.2495988, 0, 0, 0, 1, 1,
-1.261534, 1.906322, 0.9706049, 0, 0, 0, 1, 1,
-1.257269, -1.832002, -2.599245, 0, 0, 0, 1, 1,
-1.253908, -0.425064, -1.637246, 0, 0, 0, 1, 1,
-1.232964, -0.6237653, -1.511362, 0, 0, 0, 1, 1,
-1.231539, -1.520954, -2.839287, 0, 0, 0, 1, 1,
-1.230368, -1.220312, -2.14284, 0, 0, 0, 1, 1,
-1.230141, 0.8425582, -0.2861968, 1, 1, 1, 1, 1,
-1.221853, -2.009044, -3.652465, 1, 1, 1, 1, 1,
-1.204142, 0.2039396, -0.3289558, 1, 1, 1, 1, 1,
-1.193869, 0.3073512, -0.3447833, 1, 1, 1, 1, 1,
-1.187418, -0.1675263, -0.8254037, 1, 1, 1, 1, 1,
-1.172768, 0.6442579, -2.55071, 1, 1, 1, 1, 1,
-1.171499, 0.01372537, -2.184171, 1, 1, 1, 1, 1,
-1.170792, 0.496743, -1.244884, 1, 1, 1, 1, 1,
-1.167308, 0.3088679, 0.3879005, 1, 1, 1, 1, 1,
-1.163938, 2.185127, -0.3431856, 1, 1, 1, 1, 1,
-1.153216, 0.8593408, -1.542808, 1, 1, 1, 1, 1,
-1.15246, 0.3291769, -1.530702, 1, 1, 1, 1, 1,
-1.147745, -0.2401949, -3.259063, 1, 1, 1, 1, 1,
-1.144919, -0.7269772, -1.836132, 1, 1, 1, 1, 1,
-1.138132, 0.827098, -1.497397, 1, 1, 1, 1, 1,
-1.127257, 0.4880396, -0.9659253, 0, 0, 1, 1, 1,
-1.12601, -0.2203509, -0.9692218, 1, 0, 0, 1, 1,
-1.120681, -1.524776, -3.371102, 1, 0, 0, 1, 1,
-1.115269, 0.3245987, -0.9276862, 1, 0, 0, 1, 1,
-1.112083, -0.2113699, -0.830586, 1, 0, 0, 1, 1,
-1.107748, -0.3060738, -2.040209, 1, 0, 0, 1, 1,
-1.107611, 0.7652355, -0.6268616, 0, 0, 0, 1, 1,
-1.096597, 0.3011293, -3.363166, 0, 0, 0, 1, 1,
-1.083989, -0.04873106, -1.904944, 0, 0, 0, 1, 1,
-1.049956, 0.7594399, -1.205583, 0, 0, 0, 1, 1,
-1.04978, -1.246641, -3.072463, 0, 0, 0, 1, 1,
-1.049005, -0.2918828, -3.03345, 0, 0, 0, 1, 1,
-1.040262, -0.6582266, -2.51165, 0, 0, 0, 1, 1,
-1.035898, 0.7683612, -0.1117305, 1, 1, 1, 1, 1,
-1.024294, -2.335022, -1.615897, 1, 1, 1, 1, 1,
-1.021457, 0.2535374, -1.142315, 1, 1, 1, 1, 1,
-1.01929, -1.428898, -3.486696, 1, 1, 1, 1, 1,
-1.016949, -1.11762, -1.177725, 1, 1, 1, 1, 1,
-1.010302, -1.64187, -3.990409, 1, 1, 1, 1, 1,
-1.005412, 0.7796339, 0.6448338, 1, 1, 1, 1, 1,
-1.004988, -0.2478315, -1.964522, 1, 1, 1, 1, 1,
-1.004675, 1.658646, 1.512924, 1, 1, 1, 1, 1,
-1.002702, -0.8980947, -2.005405, 1, 1, 1, 1, 1,
-0.9992012, -0.3631935, -0.6484446, 1, 1, 1, 1, 1,
-0.9917549, 0.5629064, -2.555814, 1, 1, 1, 1, 1,
-0.9880103, -0.2593416, -1.131511, 1, 1, 1, 1, 1,
-0.9823568, 0.5415409, -1.409014, 1, 1, 1, 1, 1,
-0.9812409, -0.3366347, -2.544312, 1, 1, 1, 1, 1,
-0.9725005, -0.8333114, -3.689954, 0, 0, 1, 1, 1,
-0.9700853, 0.4819247, -0.5880179, 1, 0, 0, 1, 1,
-0.9600462, -1.320226, -4.192737, 1, 0, 0, 1, 1,
-0.9536258, 1.429403, -0.4840636, 1, 0, 0, 1, 1,
-0.9528344, -0.4202744, -2.223292, 1, 0, 0, 1, 1,
-0.9475695, -0.4937978, -2.713542, 1, 0, 0, 1, 1,
-0.9416455, -0.2256381, -1.693654, 0, 0, 0, 1, 1,
-0.9370669, 0.6350566, -1.249408, 0, 0, 0, 1, 1,
-0.93461, -1.611945, -2.315327, 0, 0, 0, 1, 1,
-0.9341533, 0.876293, -0.3895349, 0, 0, 0, 1, 1,
-0.9327583, 0.5345957, -0.9475679, 0, 0, 0, 1, 1,
-0.932056, -1.078778, -3.246765, 0, 0, 0, 1, 1,
-0.9292049, -0.7925034, -3.296968, 0, 0, 0, 1, 1,
-0.9289211, -0.2797008, -2.500615, 1, 1, 1, 1, 1,
-0.92279, 0.3805196, -0.1464237, 1, 1, 1, 1, 1,
-0.9193701, -0.9945838, -2.440343, 1, 1, 1, 1, 1,
-0.915983, 1.458303, 1.299379, 1, 1, 1, 1, 1,
-0.9099482, -1.117533, -2.558487, 1, 1, 1, 1, 1,
-0.9025979, -1.154079, -2.237152, 1, 1, 1, 1, 1,
-0.9016435, -2.413557, -2.189704, 1, 1, 1, 1, 1,
-0.8945278, -2.476686, -1.212216, 1, 1, 1, 1, 1,
-0.8854513, 0.1505799, -3.48981, 1, 1, 1, 1, 1,
-0.8839589, 0.05189335, -0.6530656, 1, 1, 1, 1, 1,
-0.8774461, -0.2694057, -0.2805199, 1, 1, 1, 1, 1,
-0.8759794, -0.004461531, -0.3200447, 1, 1, 1, 1, 1,
-0.8744041, -1.515324, -3.99082, 1, 1, 1, 1, 1,
-0.8701403, -0.3826734, -1.63796, 1, 1, 1, 1, 1,
-0.8656687, -0.9328133, -0.5364315, 1, 1, 1, 1, 1,
-0.8628462, -0.01850608, -2.722696, 0, 0, 1, 1, 1,
-0.8623387, -0.4607526, -3.537936, 1, 0, 0, 1, 1,
-0.8612127, 2.171715, -1.144138, 1, 0, 0, 1, 1,
-0.8596105, 1.376212, -1.417255, 1, 0, 0, 1, 1,
-0.8593907, -2.331708, -2.498786, 1, 0, 0, 1, 1,
-0.8485457, -1.144769, -1.163327, 1, 0, 0, 1, 1,
-0.8471435, -0.0241556, -2.142198, 0, 0, 0, 1, 1,
-0.8452864, 0.974438, -1.019908, 0, 0, 0, 1, 1,
-0.8447375, 1.076591, -1.197717, 0, 0, 0, 1, 1,
-0.8446038, -1.020144, -1.292693, 0, 0, 0, 1, 1,
-0.8415448, 0.16487, -1.397813, 0, 0, 0, 1, 1,
-0.836158, 1.171338, -0.6481963, 0, 0, 0, 1, 1,
-0.8310975, -0.8262948, -1.605685, 0, 0, 0, 1, 1,
-0.8294179, 1.259232, -1.404774, 1, 1, 1, 1, 1,
-0.8289945, -0.5982739, -1.51053, 1, 1, 1, 1, 1,
-0.8274767, 0.7756249, -0.8839108, 1, 1, 1, 1, 1,
-0.8206277, 0.859426, -1.168415, 1, 1, 1, 1, 1,
-0.8176061, 0.2122423, -1.961109, 1, 1, 1, 1, 1,
-0.8089457, -1.087195, -1.776736, 1, 1, 1, 1, 1,
-0.8085824, -0.1612317, -1.121024, 1, 1, 1, 1, 1,
-0.8068731, -0.8556284, -2.969664, 1, 1, 1, 1, 1,
-0.8066238, 0.1605819, -1.437127, 1, 1, 1, 1, 1,
-0.8049963, 1.759991, -0.7122281, 1, 1, 1, 1, 1,
-0.8003466, -0.6912737, -2.03438, 1, 1, 1, 1, 1,
-0.7991291, 5.215097e-05, -2.511898, 1, 1, 1, 1, 1,
-0.7983578, -0.1265674, -0.6544368, 1, 1, 1, 1, 1,
-0.79646, 2.027517, -0.4038125, 1, 1, 1, 1, 1,
-0.794187, 0.3358714, -1.573543, 1, 1, 1, 1, 1,
-0.7932289, -0.9429041, -3.803477, 0, 0, 1, 1, 1,
-0.7891082, 1.526008, 0.3950003, 1, 0, 0, 1, 1,
-0.7867774, 1.240141, -1.424761, 1, 0, 0, 1, 1,
-0.7856121, -1.61673, -4.784791, 1, 0, 0, 1, 1,
-0.7843811, 0.8342808, -1.484047, 1, 0, 0, 1, 1,
-0.7825791, -0.8347358, -2.384568, 1, 0, 0, 1, 1,
-0.7793861, -0.2836983, -0.0514844, 0, 0, 0, 1, 1,
-0.7770688, -0.1370398, -2.752882, 0, 0, 0, 1, 1,
-0.7756464, -1.62011, -3.172766, 0, 0, 0, 1, 1,
-0.7740591, 0.4280861, -1.271267, 0, 0, 0, 1, 1,
-0.7716752, -0.6666782, -2.206829, 0, 0, 0, 1, 1,
-0.7676281, -0.9753504, -2.520694, 0, 0, 0, 1, 1,
-0.7616457, 0.6534259, -0.3617145, 0, 0, 0, 1, 1,
-0.7593998, -0.4966025, -0.01537735, 1, 1, 1, 1, 1,
-0.7591977, 0.1089032, -1.38879, 1, 1, 1, 1, 1,
-0.7556003, 0.7173522, 0.7032534, 1, 1, 1, 1, 1,
-0.7552495, 1.103572, -0.3008393, 1, 1, 1, 1, 1,
-0.752559, -0.171435, -1.570176, 1, 1, 1, 1, 1,
-0.7490462, -0.007544518, -2.085748, 1, 1, 1, 1, 1,
-0.7454813, 0.3078234, -0.4821009, 1, 1, 1, 1, 1,
-0.7398239, -0.5130414, -0.1027469, 1, 1, 1, 1, 1,
-0.7363583, 0.3785001, -1.27418, 1, 1, 1, 1, 1,
-0.7360119, 0.7394975, -1.664442, 1, 1, 1, 1, 1,
-0.7346764, -0.4178253, -3.224862, 1, 1, 1, 1, 1,
-0.7274938, 0.06305404, -0.6588364, 1, 1, 1, 1, 1,
-0.7228242, 1.494705, 0.6071956, 1, 1, 1, 1, 1,
-0.7228094, 0.6427817, -0.2033114, 1, 1, 1, 1, 1,
-0.7208048, 1.472576, 0.2073325, 1, 1, 1, 1, 1,
-0.7172607, 0.07596697, -0.8004583, 0, 0, 1, 1, 1,
-0.7127208, -0.1180035, -4.243022, 1, 0, 0, 1, 1,
-0.7104497, 0.4067127, -1.926751, 1, 0, 0, 1, 1,
-0.7091722, 0.6614876, -0.5618394, 1, 0, 0, 1, 1,
-0.7024671, 1.097423, -0.3849476, 1, 0, 0, 1, 1,
-0.7005896, -1.719821, -2.051499, 1, 0, 0, 1, 1,
-0.6998795, -0.863774, -1.184388, 0, 0, 0, 1, 1,
-0.6864507, -0.07853862, -2.421749, 0, 0, 0, 1, 1,
-0.6761415, 2.272405, -0.4861927, 0, 0, 0, 1, 1,
-0.6651086, 1.460973, 0.8005588, 0, 0, 0, 1, 1,
-0.6649886, 0.4857362, -0.6666334, 0, 0, 0, 1, 1,
-0.65732, -0.3501785, -2.125112, 0, 0, 0, 1, 1,
-0.6519929, -0.3847973, -4.754835, 0, 0, 0, 1, 1,
-0.6436245, -2.015091, -2.861523, 1, 1, 1, 1, 1,
-0.6435556, -0.4799469, -3.901027, 1, 1, 1, 1, 1,
-0.641904, -1.030478, -3.054365, 1, 1, 1, 1, 1,
-0.6416179, 0.9693251, -0.2919387, 1, 1, 1, 1, 1,
-0.640306, 0.09971642, -2.139328, 1, 1, 1, 1, 1,
-0.6392346, 0.1523994, -0.2334064, 1, 1, 1, 1, 1,
-0.6373099, 0.2212117, -1.380186, 1, 1, 1, 1, 1,
-0.6329418, 0.3318334, 0.4021129, 1, 1, 1, 1, 1,
-0.6311131, -0.09698208, -2.763407, 1, 1, 1, 1, 1,
-0.6297327, 1.151062, -1.83382, 1, 1, 1, 1, 1,
-0.6276811, 0.357862, -1.16667, 1, 1, 1, 1, 1,
-0.6261309, 0.1289248, -1.678508, 1, 1, 1, 1, 1,
-0.6245837, -0.1006839, 0.1430693, 1, 1, 1, 1, 1,
-0.6144322, -0.4853182, -1.283006, 1, 1, 1, 1, 1,
-0.6112739, -0.4348034, -1.667521, 1, 1, 1, 1, 1,
-0.6097819, -1.517618, -2.648092, 0, 0, 1, 1, 1,
-0.607857, 0.6758752, -2.617878, 1, 0, 0, 1, 1,
-0.5999644, 1.174698, -0.5368998, 1, 0, 0, 1, 1,
-0.5986771, -2.506151, -2.893968, 1, 0, 0, 1, 1,
-0.5973764, -1.24341, -2.873838, 1, 0, 0, 1, 1,
-0.5925333, -0.9268056, -2.038111, 1, 0, 0, 1, 1,
-0.5903009, -2.060726, -1.875092, 0, 0, 0, 1, 1,
-0.5883486, 1.317749, -1.434345, 0, 0, 0, 1, 1,
-0.5852969, 0.05640736, -1.571752, 0, 0, 0, 1, 1,
-0.5795978, 0.1875387, -1.671008, 0, 0, 0, 1, 1,
-0.5784194, -0.5718246, -0.4976395, 0, 0, 0, 1, 1,
-0.5779838, 0.8893006, -1.986764, 0, 0, 0, 1, 1,
-0.5778345, -0.05755126, -3.227954, 0, 0, 0, 1, 1,
-0.575212, -0.1063609, -1.173083, 1, 1, 1, 1, 1,
-0.5699673, -0.2428458, -3.188442, 1, 1, 1, 1, 1,
-0.5674723, -0.8029175, -2.998621, 1, 1, 1, 1, 1,
-0.5643761, -0.09915673, -2.703065, 1, 1, 1, 1, 1,
-0.5470524, -0.03395698, -0.5807807, 1, 1, 1, 1, 1,
-0.5466494, 0.02206891, -0.82301, 1, 1, 1, 1, 1,
-0.5311853, 0.02822576, -0.6127884, 1, 1, 1, 1, 1,
-0.527226, 1.516379, 1.359166, 1, 1, 1, 1, 1,
-0.5265259, 0.3512795, -2.900486, 1, 1, 1, 1, 1,
-0.5231634, 0.3764596, -0.07012141, 1, 1, 1, 1, 1,
-0.5205271, 2.591823, 0.1958714, 1, 1, 1, 1, 1,
-0.5204807, 0.2800072, -0.8180763, 1, 1, 1, 1, 1,
-0.5173061, -2.974845, -2.335582, 1, 1, 1, 1, 1,
-0.5172299, 1.389532, -0.08159819, 1, 1, 1, 1, 1,
-0.5138274, 0.6992252, -0.7305165, 1, 1, 1, 1, 1,
-0.510929, -1.664015, -2.94489, 0, 0, 1, 1, 1,
-0.5099064, -0.6998369, -0.8868538, 1, 0, 0, 1, 1,
-0.5083933, -0.3729932, -2.552248, 1, 0, 0, 1, 1,
-0.5038005, 0.3064315, -1.731436, 1, 0, 0, 1, 1,
-0.5012517, 1.125721, -2.049814, 1, 0, 0, 1, 1,
-0.498997, 0.5614946, -1.777431, 1, 0, 0, 1, 1,
-0.4950138, -0.6288722, -2.350115, 0, 0, 0, 1, 1,
-0.4947615, 1.551856, 1.00953, 0, 0, 0, 1, 1,
-0.4941093, 0.6356975, -0.8737151, 0, 0, 0, 1, 1,
-0.4933355, -0.2921386, -1.279618, 0, 0, 0, 1, 1,
-0.4889029, -0.3367583, -3.300308, 0, 0, 0, 1, 1,
-0.4873442, 0.3339359, -0.4659803, 0, 0, 0, 1, 1,
-0.4872993, 0.08325368, 0.564295, 0, 0, 0, 1, 1,
-0.4853446, -0.923018, -3.606659, 1, 1, 1, 1, 1,
-0.4852422, 1.080492, -1.189616, 1, 1, 1, 1, 1,
-0.4851386, -0.5835689, -3.145776, 1, 1, 1, 1, 1,
-0.48451, 2.212909, -0.3227489, 1, 1, 1, 1, 1,
-0.4810477, 1.91416, 0.1113319, 1, 1, 1, 1, 1,
-0.4767407, -1.894146, -3.986234, 1, 1, 1, 1, 1,
-0.4759917, 0.997634, -1.017711, 1, 1, 1, 1, 1,
-0.4735688, 0.1724214, -2.194582, 1, 1, 1, 1, 1,
-0.470461, 0.9647996, -0.4120527, 1, 1, 1, 1, 1,
-0.4655958, -0.4615962, -1.914777, 1, 1, 1, 1, 1,
-0.4607818, -1.503163, -2.380201, 1, 1, 1, 1, 1,
-0.4593767, 1.212374, 0.86484, 1, 1, 1, 1, 1,
-0.4591787, 0.9477507, 0.3011179, 1, 1, 1, 1, 1,
-0.4578265, -0.2647146, -3.436339, 1, 1, 1, 1, 1,
-0.4566826, -1.166017, -2.672788, 1, 1, 1, 1, 1,
-0.4513716, -1.440696, -4.36696, 0, 0, 1, 1, 1,
-0.4481188, -0.6714805, -2.230665, 1, 0, 0, 1, 1,
-0.4473478, -1.075025, -2.584171, 1, 0, 0, 1, 1,
-0.4418043, 0.3508456, -1.032522, 1, 0, 0, 1, 1,
-0.4413024, -1.008728, -2.309546, 1, 0, 0, 1, 1,
-0.4398497, -0.3602334, -2.530993, 1, 0, 0, 1, 1,
-0.4396635, 0.7096379, -0.4307137, 0, 0, 0, 1, 1,
-0.439544, 0.3249811, -0.3192886, 0, 0, 0, 1, 1,
-0.439392, -1.401084, -1.677858, 0, 0, 0, 1, 1,
-0.4379115, -0.4485286, -2.690713, 0, 0, 0, 1, 1,
-0.4375426, -0.5790045, -2.966418, 0, 0, 0, 1, 1,
-0.4318611, 1.115777, 0.06305799, 0, 0, 0, 1, 1,
-0.4299462, 1.187835, -0.6877015, 0, 0, 0, 1, 1,
-0.4285028, -1.901309, -3.193329, 1, 1, 1, 1, 1,
-0.4225355, -0.2654758, -3.991363, 1, 1, 1, 1, 1,
-0.4223191, -0.4548818, -2.070374, 1, 1, 1, 1, 1,
-0.4185398, 0.1879013, -1.530989, 1, 1, 1, 1, 1,
-0.4113691, -0.62399, -3.34614, 1, 1, 1, 1, 1,
-0.3997984, -1.04597, -1.008109, 1, 1, 1, 1, 1,
-0.3987504, 0.1648199, -1.554783, 1, 1, 1, 1, 1,
-0.3956975, -2.638275, -3.03683, 1, 1, 1, 1, 1,
-0.3925477, -0.1485099, -0.9936971, 1, 1, 1, 1, 1,
-0.3900828, -1.384346, -2.940734, 1, 1, 1, 1, 1,
-0.3898819, 0.7706227, -1.019672, 1, 1, 1, 1, 1,
-0.3880937, -2.613397, -2.684953, 1, 1, 1, 1, 1,
-0.3871455, 0.8870888, -0.6971211, 1, 1, 1, 1, 1,
-0.3870142, 2.558063, 0.7488421, 1, 1, 1, 1, 1,
-0.3836505, 0.7766809, -0.6512021, 1, 1, 1, 1, 1,
-0.3808205, -1.008393, -2.635153, 0, 0, 1, 1, 1,
-0.3762892, 0.01393374, -2.895437, 1, 0, 0, 1, 1,
-0.374674, 0.9541803, 0.34162, 1, 0, 0, 1, 1,
-0.3697415, 0.8111013, 1.108901, 1, 0, 0, 1, 1,
-0.3692366, 0.8986152, -2.054514, 1, 0, 0, 1, 1,
-0.3627765, -0.7914696, -3.5901, 1, 0, 0, 1, 1,
-0.3619049, 1.411604, 0.1611919, 0, 0, 0, 1, 1,
-0.3582272, -0.2296056, -3.411532, 0, 0, 0, 1, 1,
-0.3547409, 2.733354, -1.134191, 0, 0, 0, 1, 1,
-0.3529603, 0.8614603, -1.412211, 0, 0, 0, 1, 1,
-0.3501163, 0.01446045, -0.3346024, 0, 0, 0, 1, 1,
-0.3476777, 1.592966, 0.6001628, 0, 0, 0, 1, 1,
-0.3472885, -0.4841115, -3.108305, 0, 0, 0, 1, 1,
-0.3426641, -1.03576, -5.093616, 1, 1, 1, 1, 1,
-0.3411851, -0.4639511, -3.334152, 1, 1, 1, 1, 1,
-0.3392644, -0.7934822, -1.179687, 1, 1, 1, 1, 1,
-0.3368589, -1.236213, -3.298463, 1, 1, 1, 1, 1,
-0.3331386, -0.2570837, -2.18563, 1, 1, 1, 1, 1,
-0.3281288, -0.3611738, -3.623973, 1, 1, 1, 1, 1,
-0.3270648, 0.5238121, -1.348699, 1, 1, 1, 1, 1,
-0.3205471, 0.9907029, -0.4787672, 1, 1, 1, 1, 1,
-0.3172438, 0.6059188, -0.4007065, 1, 1, 1, 1, 1,
-0.315183, 0.08613605, -0.8260711, 1, 1, 1, 1, 1,
-0.3093994, 0.1194929, -0.9666897, 1, 1, 1, 1, 1,
-0.3048916, 0.9642166, 0.7544464, 1, 1, 1, 1, 1,
-0.3043196, 0.8707067, 1.480391, 1, 1, 1, 1, 1,
-0.2991464, -1.287455, -2.104776, 1, 1, 1, 1, 1,
-0.2990277, 1.630494, 2.077335, 1, 1, 1, 1, 1,
-0.2967072, -1.365424, -2.404958, 0, 0, 1, 1, 1,
-0.2961841, 0.1126592, -2.124666, 1, 0, 0, 1, 1,
-0.2938835, 0.4208434, -0.1054489, 1, 0, 0, 1, 1,
-0.29068, 0.9850206, -1.54186, 1, 0, 0, 1, 1,
-0.2903772, 0.1365719, -1.620326, 1, 0, 0, 1, 1,
-0.2901488, 1.438563, -1.060463, 1, 0, 0, 1, 1,
-0.2896397, -0.05310631, -3.056139, 0, 0, 0, 1, 1,
-0.2887405, 2.69101, 1.153692, 0, 0, 0, 1, 1,
-0.2745969, 0.2271137, -1.452726, 0, 0, 0, 1, 1,
-0.2696499, 0.5647045, 0.4030451, 0, 0, 0, 1, 1,
-0.2684852, 0.5241989, 1.123632, 0, 0, 0, 1, 1,
-0.2666276, -1.862511, -2.78188, 0, 0, 0, 1, 1,
-0.2659526, -0.8788088, -1.424849, 0, 0, 0, 1, 1,
-0.265263, 0.3466241, -0.4598674, 1, 1, 1, 1, 1,
-0.2624314, 0.4002077, -1.431518, 1, 1, 1, 1, 1,
-0.2566639, -0.6344067, -3.739608, 1, 1, 1, 1, 1,
-0.2562105, -0.8902172, -2.169131, 1, 1, 1, 1, 1,
-0.2561679, -0.527908, -2.081841, 1, 1, 1, 1, 1,
-0.2557102, -1.131253, -3.080958, 1, 1, 1, 1, 1,
-0.2546417, -0.500724, -2.296719, 1, 1, 1, 1, 1,
-0.2507004, -1.089658, -2.683668, 1, 1, 1, 1, 1,
-0.2498052, 1.163744, 1.224669, 1, 1, 1, 1, 1,
-0.2478973, 1.005715, 0.7184156, 1, 1, 1, 1, 1,
-0.2472427, -0.2764312, -1.693558, 1, 1, 1, 1, 1,
-0.2470484, 2.29721, -0.4570644, 1, 1, 1, 1, 1,
-0.2435916, -0.05104975, -2.144831, 1, 1, 1, 1, 1,
-0.2423693, 0.7100927, 2.24638, 1, 1, 1, 1, 1,
-0.2407301, -2.198547, -3.603865, 1, 1, 1, 1, 1,
-0.240323, 0.3425296, -0.8636101, 0, 0, 1, 1, 1,
-0.2371488, -0.6566465, -1.918573, 1, 0, 0, 1, 1,
-0.2339467, -0.5416217, -2.433222, 1, 0, 0, 1, 1,
-0.2316428, 0.0001296232, -3.228002, 1, 0, 0, 1, 1,
-0.2276102, 0.4480257, -1.055962, 1, 0, 0, 1, 1,
-0.2263236, -1.477692, -3.652586, 1, 0, 0, 1, 1,
-0.2223123, 0.3888338, 1.483397, 0, 0, 0, 1, 1,
-0.2214882, -0.4346253, -1.734217, 0, 0, 0, 1, 1,
-0.219926, -1.142766, -2.85625, 0, 0, 0, 1, 1,
-0.2085736, -0.8066726, -1.947932, 0, 0, 0, 1, 1,
-0.2072869, 1.344409, 0.0769017, 0, 0, 0, 1, 1,
-0.2014491, 0.05757917, -2.350971, 0, 0, 0, 1, 1,
-0.1975621, -0.9987156, -2.403491, 0, 0, 0, 1, 1,
-0.194673, -1.759184, -3.304426, 1, 1, 1, 1, 1,
-0.193927, 0.2718183, -1.725517, 1, 1, 1, 1, 1,
-0.1893681, 0.5981093, 0.6675473, 1, 1, 1, 1, 1,
-0.1884175, 1.428848, -0.1191402, 1, 1, 1, 1, 1,
-0.1807803, -1.034977, -2.327371, 1, 1, 1, 1, 1,
-0.1795592, 0.3045891, 0.1103421, 1, 1, 1, 1, 1,
-0.1784932, 0.1864972, -0.7288139, 1, 1, 1, 1, 1,
-0.1766883, 1.115548, 2.087971, 1, 1, 1, 1, 1,
-0.175562, 0.02877239, 0.5136367, 1, 1, 1, 1, 1,
-0.1754671, 0.8143074, 0.2966509, 1, 1, 1, 1, 1,
-0.1739915, -0.028306, -2.25034, 1, 1, 1, 1, 1,
-0.166022, 0.9964036, 1.236866, 1, 1, 1, 1, 1,
-0.1648113, 0.3357595, -0.231955, 1, 1, 1, 1, 1,
-0.1639602, -0.7967585, -2.942932, 1, 1, 1, 1, 1,
-0.1619075, 0.7462584, 0.6657003, 1, 1, 1, 1, 1,
-0.1571017, -0.9116471, -2.594719, 0, 0, 1, 1, 1,
-0.1558884, -0.1243516, -2.16892, 1, 0, 0, 1, 1,
-0.1440766, -1.943167, -3.022511, 1, 0, 0, 1, 1,
-0.1435892, -0.2851834, -1.436706, 1, 0, 0, 1, 1,
-0.1427151, -0.4032426, -4.426231, 1, 0, 0, 1, 1,
-0.1382683, -0.3469179, -3.103067, 1, 0, 0, 1, 1,
-0.137726, -0.3111019, -3.632225, 0, 0, 0, 1, 1,
-0.1356025, -1.145224, -2.183674, 0, 0, 0, 1, 1,
-0.1338216, 0.6289578, 0.8199884, 0, 0, 0, 1, 1,
-0.1332049, 2.127955, 0.8142004, 0, 0, 0, 1, 1,
-0.1276004, -0.8877524, -2.434223, 0, 0, 0, 1, 1,
-0.1241595, 0.2100747, -1.064332, 0, 0, 0, 1, 1,
-0.12224, -0.2060233, -2.688021, 0, 0, 0, 1, 1,
-0.1215268, 1.679872, 1.56569, 1, 1, 1, 1, 1,
-0.1206849, 1.822275, 1.142944, 1, 1, 1, 1, 1,
-0.1206112, 0.8018356, -0.321858, 1, 1, 1, 1, 1,
-0.1205001, -0.1623193, -0.5528191, 1, 1, 1, 1, 1,
-0.1203085, -0.5200414, -3.585626, 1, 1, 1, 1, 1,
-0.1198291, -0.35472, -2.595599, 1, 1, 1, 1, 1,
-0.1107855, -0.04211307, -3.204911, 1, 1, 1, 1, 1,
-0.1100007, 0.3049038, 1.225205, 1, 1, 1, 1, 1,
-0.1061964, 0.9581966, -0.4091895, 1, 1, 1, 1, 1,
-0.1059636, -0.3112549, -2.171193, 1, 1, 1, 1, 1,
-0.1050452, 0.5308902, -1.798131, 1, 1, 1, 1, 1,
-0.104783, -1.962115, -2.69463, 1, 1, 1, 1, 1,
-0.1024731, 0.6897253, -1.308908, 1, 1, 1, 1, 1,
-0.1016976, 0.7477693, -0.08870444, 1, 1, 1, 1, 1,
-0.09277059, 0.5008955, -0.08623948, 1, 1, 1, 1, 1,
-0.09023688, 0.8575366, 0.3525575, 0, 0, 1, 1, 1,
-0.08992552, 0.2828464, -0.5856696, 1, 0, 0, 1, 1,
-0.08907589, -0.3309081, -3.036113, 1, 0, 0, 1, 1,
-0.08432315, 1.507269, 0.9122573, 1, 0, 0, 1, 1,
-0.08188012, 0.5535739, 0.6691284, 1, 0, 0, 1, 1,
-0.08070794, -0.4999005, -3.788202, 1, 0, 0, 1, 1,
-0.08014696, -0.4597662, -2.200173, 0, 0, 0, 1, 1,
-0.07627676, 1.616447, 0.333548, 0, 0, 0, 1, 1,
-0.0755642, 0.09311996, -2.215492, 0, 0, 0, 1, 1,
-0.07492134, 0.3038597, 2.166407, 0, 0, 0, 1, 1,
-0.07312088, 0.7375919, -0.5321284, 0, 0, 0, 1, 1,
-0.0694593, -1.047635, -4.364815, 0, 0, 0, 1, 1,
-0.06913358, -0.1696429, -2.159053, 0, 0, 0, 1, 1,
-0.06875467, -0.3848658, -0.1619423, 1, 1, 1, 1, 1,
-0.06372628, -0.5976021, -1.7317, 1, 1, 1, 1, 1,
-0.06344045, 0.2676867, 0.9222559, 1, 1, 1, 1, 1,
-0.06286365, -2.295569, -3.575154, 1, 1, 1, 1, 1,
-0.05162328, 0.6060022, 0.9727871, 1, 1, 1, 1, 1,
-0.0504235, -1.158312, -2.420445, 1, 1, 1, 1, 1,
-0.05005779, -1.877998, -3.734999, 1, 1, 1, 1, 1,
-0.04658132, 0.1491558, -0.647174, 1, 1, 1, 1, 1,
-0.0462251, -0.7349679, -2.230544, 1, 1, 1, 1, 1,
-0.0411519, 0.2754534, 1.246089, 1, 1, 1, 1, 1,
-0.04082374, -0.7811772, -2.830339, 1, 1, 1, 1, 1,
-0.04027028, -0.405422, -2.71191, 1, 1, 1, 1, 1,
-0.03839745, -0.9488053, -3.237714, 1, 1, 1, 1, 1,
-0.03663417, 0.8015877, 2.619764, 1, 1, 1, 1, 1,
-0.03579305, 0.4198785, 0.4356835, 1, 1, 1, 1, 1,
-0.03132455, -0.8574752, -3.670756, 0, 0, 1, 1, 1,
-0.02871347, 1.344978, 1.07264, 1, 0, 0, 1, 1,
-0.0255081, 0.2598086, 0.5082542, 1, 0, 0, 1, 1,
-0.02464817, 0.3312645, 1.589325, 1, 0, 0, 1, 1,
-0.02194442, 1.514022, -0.746056, 1, 0, 0, 1, 1,
-0.02026762, 1.138075, -0.5765993, 1, 0, 0, 1, 1,
-0.01750339, -0.6024181, -4.738396, 0, 0, 0, 1, 1,
-0.01746452, -1.418782, -2.757999, 0, 0, 0, 1, 1,
-0.01654892, -0.3790984, -3.272405, 0, 0, 0, 1, 1,
-0.01628386, -0.7198791, -2.859392, 0, 0, 0, 1, 1,
-0.01417249, -0.4783963, -1.378675, 0, 0, 0, 1, 1,
-0.007276097, -0.06634806, -3.782798, 0, 0, 0, 1, 1,
-0.006435308, -2.41872, -2.85916, 0, 0, 0, 1, 1,
-0.005107862, -2.080733, -3.7238, 1, 1, 1, 1, 1,
-0.003098523, 0.1624648, 0.7261825, 1, 1, 1, 1, 1,
-0.001090349, 0.3262129, 1.228676, 1, 1, 1, 1, 1,
0.0006780317, 0.162499, -1.055188, 1, 1, 1, 1, 1,
0.003741429, -0.9457824, 2.234455, 1, 1, 1, 1, 1,
0.007909164, 0.1968922, 0.6172513, 1, 1, 1, 1, 1,
0.008177548, 0.8822956, -0.549237, 1, 1, 1, 1, 1,
0.01137519, 0.7536921, 0.4432049, 1, 1, 1, 1, 1,
0.01233073, -0.4596026, 4.004174, 1, 1, 1, 1, 1,
0.01649517, -0.8664781, 2.245974, 1, 1, 1, 1, 1,
0.02361121, -1.393989, 2.795771, 1, 1, 1, 1, 1,
0.02406719, 0.01462828, 1.479207, 1, 1, 1, 1, 1,
0.02452261, 0.3575623, 0.5803978, 1, 1, 1, 1, 1,
0.02560019, 1.24133, 0.4245976, 1, 1, 1, 1, 1,
0.0364451, 1.567631, -0.6153467, 1, 1, 1, 1, 1,
0.04097526, 0.998723, 0.07625075, 0, 0, 1, 1, 1,
0.04163351, -0.4308217, 2.247121, 1, 0, 0, 1, 1,
0.04617105, 1.095551, -0.7345881, 1, 0, 0, 1, 1,
0.04659208, 0.9004626, -0.6311151, 1, 0, 0, 1, 1,
0.04919224, -0.7766607, 3.408934, 1, 0, 0, 1, 1,
0.05142556, -0.5321587, 2.031143, 1, 0, 0, 1, 1,
0.05404728, 0.3702883, 1.557873, 0, 0, 0, 1, 1,
0.05630651, 0.6888657, -0.5154125, 0, 0, 0, 1, 1,
0.05684357, -0.394206, 4.6348, 0, 0, 0, 1, 1,
0.05703249, -0.7383535, 3.28712, 0, 0, 0, 1, 1,
0.06085876, 0.7458318, 0.9841456, 0, 0, 0, 1, 1,
0.06145579, -0.4464387, 2.659057, 0, 0, 0, 1, 1,
0.06252382, -0.6392, 2.806163, 0, 0, 0, 1, 1,
0.06282052, 0.1450223, -0.270287, 1, 1, 1, 1, 1,
0.06363739, 1.297398, 1.511508, 1, 1, 1, 1, 1,
0.06393631, 1.112926, 0.7450179, 1, 1, 1, 1, 1,
0.06471103, 2.055684, 0.1869047, 1, 1, 1, 1, 1,
0.06816746, 0.4610507, 0.8932671, 1, 1, 1, 1, 1,
0.0715472, -0.4825097, 2.895045, 1, 1, 1, 1, 1,
0.07662401, -0.8164279, 3.172407, 1, 1, 1, 1, 1,
0.07810834, 0.6947896, -0.1454725, 1, 1, 1, 1, 1,
0.07980915, -0.7884848, 3.503474, 1, 1, 1, 1, 1,
0.08145645, 0.3053073, 0.833331, 1, 1, 1, 1, 1,
0.08516905, 0.6183184, -1.132029, 1, 1, 1, 1, 1,
0.08764168, -0.0002161392, -0.6661091, 1, 1, 1, 1, 1,
0.0901804, -0.6210228, 2.329412, 1, 1, 1, 1, 1,
0.09102318, -1.214089, 2.284112, 1, 1, 1, 1, 1,
0.09216325, 0.3192494, -0.7410557, 1, 1, 1, 1, 1,
0.09729445, 1.790168, -0.09868592, 0, 0, 1, 1, 1,
0.09755411, -0.5529836, 2.020467, 1, 0, 0, 1, 1,
0.1009213, -0.2708856, 2.710416, 1, 0, 0, 1, 1,
0.1025696, 0.3146591, -1.586497, 1, 0, 0, 1, 1,
0.102907, -0.4910463, 2.798303, 1, 0, 0, 1, 1,
0.103242, 1.43986, -1.400293, 1, 0, 0, 1, 1,
0.103917, 0.03531526, 1.39903, 0, 0, 0, 1, 1,
0.1055921, 1.404598, 0.599603, 0, 0, 0, 1, 1,
0.1064009, 0.6916082, -1.991899, 0, 0, 0, 1, 1,
0.1093475, -0.19331, 4.944433, 0, 0, 0, 1, 1,
0.1116993, 0.8398936, 1.575876, 0, 0, 0, 1, 1,
0.1125003, -0.7499266, 3.418581, 0, 0, 0, 1, 1,
0.114063, -1.141002, 3.632268, 0, 0, 0, 1, 1,
0.1168183, -0.262417, 2.187334, 1, 1, 1, 1, 1,
0.1246417, 0.5605995, 0.7081923, 1, 1, 1, 1, 1,
0.1303629, 0.4380431, 1.121341, 1, 1, 1, 1, 1,
0.1379677, -0.1341809, 1.52335, 1, 1, 1, 1, 1,
0.140464, 2.448001, 1.70997, 1, 1, 1, 1, 1,
0.1426784, 0.1751909, 1.103541, 1, 1, 1, 1, 1,
0.1429269, -0.1505584, 2.795775, 1, 1, 1, 1, 1,
0.1432925, -0.04187904, 2.829962, 1, 1, 1, 1, 1,
0.1498085, -2.090791, -0.3393956, 1, 1, 1, 1, 1,
0.1505583, -0.1772205, 1.366774, 1, 1, 1, 1, 1,
0.1574467, -0.3762467, 4.302841, 1, 1, 1, 1, 1,
0.1582917, 0.2987271, 1.637712, 1, 1, 1, 1, 1,
0.1636847, -1.514081, 3.421708, 1, 1, 1, 1, 1,
0.1658103, -0.8078288, 6.474183, 1, 1, 1, 1, 1,
0.1660865, -2.625776, 4.202995, 1, 1, 1, 1, 1,
0.1669807, 0.445213, -0.6577374, 0, 0, 1, 1, 1,
0.1688286, 1.410433, -0.4261241, 1, 0, 0, 1, 1,
0.1725835, -0.6228384, 2.891798, 1, 0, 0, 1, 1,
0.1739259, 0.5341664, 0.7376287, 1, 0, 0, 1, 1,
0.1746441, 0.09225858, -0.2803195, 1, 0, 0, 1, 1,
0.1775655, -0.7832761, 2.82322, 1, 0, 0, 1, 1,
0.1785484, -0.5707117, 1.765351, 0, 0, 0, 1, 1,
0.1792419, 1.119938, 0.7411258, 0, 0, 0, 1, 1,
0.1798883, 0.3762642, 1.389235, 0, 0, 0, 1, 1,
0.1799381, 0.227614, 0.7724218, 0, 0, 0, 1, 1,
0.1810909, -0.3802958, 2.601174, 0, 0, 0, 1, 1,
0.1840441, 3.230694, 0.2464099, 0, 0, 0, 1, 1,
0.1843198, -1.108233, 4.25068, 0, 0, 0, 1, 1,
0.1851783, 0.5611358, 2.398279, 1, 1, 1, 1, 1,
0.1913476, -1.275136, 2.642598, 1, 1, 1, 1, 1,
0.1928623, -0.09161124, -0.02689087, 1, 1, 1, 1, 1,
0.1981893, 1.322201, -1.176066, 1, 1, 1, 1, 1,
0.1985717, -0.08218016, 0.7817951, 1, 1, 1, 1, 1,
0.2024269, 0.2409528, -0.2728163, 1, 1, 1, 1, 1,
0.2071917, 0.2083866, 0.5850922, 1, 1, 1, 1, 1,
0.2073007, -0.7253991, 3.006179, 1, 1, 1, 1, 1,
0.2193243, 0.9653777, 0.2472071, 1, 1, 1, 1, 1,
0.2202391, 1.114116, 0.8634191, 1, 1, 1, 1, 1,
0.2232581, -0.3784201, 2.65838, 1, 1, 1, 1, 1,
0.2257087, 1.60543, 2.154464, 1, 1, 1, 1, 1,
0.2259876, 0.8926692, 0.2562455, 1, 1, 1, 1, 1,
0.2267874, 0.07687879, 2.521196, 1, 1, 1, 1, 1,
0.2301663, 1.220406, 1.751991, 1, 1, 1, 1, 1,
0.2303924, -0.2978409, 1.882458, 0, 0, 1, 1, 1,
0.2322674, 0.2545893, 1.319697, 1, 0, 0, 1, 1,
0.233733, -1.982963, 3.764571, 1, 0, 0, 1, 1,
0.2349769, 2.139451, 1.945581, 1, 0, 0, 1, 1,
0.2399321, -1.380494, 2.010802, 1, 0, 0, 1, 1,
0.2422977, -0.3550871, 2.963669, 1, 0, 0, 1, 1,
0.2425735, 1.430824, 0.08307137, 0, 0, 0, 1, 1,
0.2426188, 1.114942, -0.2800763, 0, 0, 0, 1, 1,
0.2436918, -1.056851, 2.568939, 0, 0, 0, 1, 1,
0.2476407, -0.6104841, 4.395189, 0, 0, 0, 1, 1,
0.2491338, -0.8751172, 2.50832, 0, 0, 0, 1, 1,
0.2523335, -1.023944, 1.580275, 0, 0, 0, 1, 1,
0.2554286, 0.8476665, -0.1306419, 0, 0, 0, 1, 1,
0.2557873, 0.5677622, -1.041096, 1, 1, 1, 1, 1,
0.2565245, 0.5808749, 0.2245308, 1, 1, 1, 1, 1,
0.2567424, -1.096614, 2.804899, 1, 1, 1, 1, 1,
0.2613455, 0.7056301, -0.3827175, 1, 1, 1, 1, 1,
0.2636676, 2.029351, 1.156677, 1, 1, 1, 1, 1,
0.2643885, -0.8192649, 0.9300426, 1, 1, 1, 1, 1,
0.2680934, -0.2394059, 2.623369, 1, 1, 1, 1, 1,
0.2700133, 0.04800849, 0.8037181, 1, 1, 1, 1, 1,
0.2709888, -0.7706251, 4.232734, 1, 1, 1, 1, 1,
0.2738948, -0.1017575, 1.816461, 1, 1, 1, 1, 1,
0.2762253, 0.9404866, -0.08604313, 1, 1, 1, 1, 1,
0.2791046, 0.2140899, 1.836722, 1, 1, 1, 1, 1,
0.2806684, 0.6778321, 0.8970914, 1, 1, 1, 1, 1,
0.2846653, -0.6789278, 2.986052, 1, 1, 1, 1, 1,
0.2850885, 0.885325, 1.053295, 1, 1, 1, 1, 1,
0.2889565, -1.389409, 3.454124, 0, 0, 1, 1, 1,
0.2909454, 1.062741, 0.1694898, 1, 0, 0, 1, 1,
0.3039062, -1.207419, 3.278575, 1, 0, 0, 1, 1,
0.304779, 1.577465, 0.3465713, 1, 0, 0, 1, 1,
0.3086042, -0.3210557, 3.149447, 1, 0, 0, 1, 1,
0.3104875, -0.6551868, 1.846352, 1, 0, 0, 1, 1,
0.3114999, 0.7709298, 0.3564781, 0, 0, 0, 1, 1,
0.3117242, -0.1094775, -0.9756103, 0, 0, 0, 1, 1,
0.3145262, 1.74357, 1.851107, 0, 0, 0, 1, 1,
0.3183488, 0.7486155, -0.1244197, 0, 0, 0, 1, 1,
0.3183957, -1.151356, 1.788116, 0, 0, 0, 1, 1,
0.3224928, 1.400216, -0.607855, 0, 0, 0, 1, 1,
0.3226317, -0.8623291, 2.936794, 0, 0, 0, 1, 1,
0.3255532, -0.8297755, 2.797481, 1, 1, 1, 1, 1,
0.3299392, 1.525528, 1.82696, 1, 1, 1, 1, 1,
0.3305142, -0.4387548, 2.255401, 1, 1, 1, 1, 1,
0.335216, 1.059715, 0.6310691, 1, 1, 1, 1, 1,
0.3377709, -0.1515903, 2.606431, 1, 1, 1, 1, 1,
0.3395488, -1.618657, 2.481291, 1, 1, 1, 1, 1,
0.3395779, -0.4808768, 2.534054, 1, 1, 1, 1, 1,
0.3410942, -0.6585151, 1.77112, 1, 1, 1, 1, 1,
0.3416255, 0.3450827, 2.270007, 1, 1, 1, 1, 1,
0.3421538, 0.8941516, 0.3627446, 1, 1, 1, 1, 1,
0.3553806, 0.7986231, 2.507267, 1, 1, 1, 1, 1,
0.3610844, 1.066191, 0.7914595, 1, 1, 1, 1, 1,
0.3616868, 0.6272616, 1.939606, 1, 1, 1, 1, 1,
0.3715514, 0.6734701, 1.457489, 1, 1, 1, 1, 1,
0.3747275, -0.6335632, 2.838718, 1, 1, 1, 1, 1,
0.3790478, 1.385123, 1.537201, 0, 0, 1, 1, 1,
0.3851796, -0.6431143, 3.522115, 1, 0, 0, 1, 1,
0.3900027, 0.5246332, -0.6873074, 1, 0, 0, 1, 1,
0.390726, 0.2805769, -0.8369257, 1, 0, 0, 1, 1,
0.3937606, -1.45525, 3.112247, 1, 0, 0, 1, 1,
0.3956059, -0.5408426, 0.804642, 1, 0, 0, 1, 1,
0.3972522, 0.1914232, -0.08859294, 0, 0, 0, 1, 1,
0.3997194, -0.6162359, 3.256449, 0, 0, 0, 1, 1,
0.4000507, 0.7723501, 0.2882779, 0, 0, 0, 1, 1,
0.4026849, 0.7035785, -1.2165, 0, 0, 0, 1, 1,
0.4093423, 1.474542, 1.294954, 0, 0, 0, 1, 1,
0.4151323, -0.8094782, 2.536731, 0, 0, 0, 1, 1,
0.4219645, 0.3901539, 0.795906, 0, 0, 0, 1, 1,
0.4226868, 0.2800032, 2.222142, 1, 1, 1, 1, 1,
0.4246847, -0.3842094, 3.523284, 1, 1, 1, 1, 1,
0.4247762, -0.4808759, 1.492227, 1, 1, 1, 1, 1,
0.42743, -0.7361423, 2.69624, 1, 1, 1, 1, 1,
0.4279541, -0.9491081, 2.84287, 1, 1, 1, 1, 1,
0.431126, 2.113537, -0.7010251, 1, 1, 1, 1, 1,
0.4347581, -1.012713, 1.641321, 1, 1, 1, 1, 1,
0.4352886, -1.78938, 4.731699, 1, 1, 1, 1, 1,
0.438336, -0.3111449, 1.986957, 1, 1, 1, 1, 1,
0.4386613, 0.09567982, 2.270084, 1, 1, 1, 1, 1,
0.444437, 1.700892, -1.757728, 1, 1, 1, 1, 1,
0.4476464, -1.145169, 1.828301, 1, 1, 1, 1, 1,
0.4533691, 1.063548, -1.329683, 1, 1, 1, 1, 1,
0.4615258, 0.1608228, 1.653077, 1, 1, 1, 1, 1,
0.4646158, 0.9214674, 1.13634, 1, 1, 1, 1, 1,
0.4702508, 2.035148, 0.7117704, 0, 0, 1, 1, 1,
0.4745313, -0.2026451, 1.951871, 1, 0, 0, 1, 1,
0.4787669, -0.3595066, 3.361782, 1, 0, 0, 1, 1,
0.4796808, 0.4463086, 2.272001, 1, 0, 0, 1, 1,
0.4811588, 1.65801, 1.738319, 1, 0, 0, 1, 1,
0.4871452, 0.9193544, -0.2371083, 1, 0, 0, 1, 1,
0.4882262, 0.02746954, 1.874893, 0, 0, 0, 1, 1,
0.4890082, -0.4789531, 2.798253, 0, 0, 0, 1, 1,
0.4960312, -1.17656, 1.84425, 0, 0, 0, 1, 1,
0.4971399, 1.771325, 0.4103186, 0, 0, 0, 1, 1,
0.498393, 0.1167554, -0.2562278, 0, 0, 0, 1, 1,
0.5001109, -1.629342, 1.773237, 0, 0, 0, 1, 1,
0.5004066, -0.9620736, 0.9154971, 0, 0, 0, 1, 1,
0.5012946, 0.4444365, 2.329265, 1, 1, 1, 1, 1,
0.5065633, -0.6510067, 1.969838, 1, 1, 1, 1, 1,
0.5083716, 0.5117069, 0.2355714, 1, 1, 1, 1, 1,
0.5126801, -0.4093396, 2.783383, 1, 1, 1, 1, 1,
0.5139316, -1.319206, 1.833011, 1, 1, 1, 1, 1,
0.514394, -0.7571543, 2.026512, 1, 1, 1, 1, 1,
0.5196527, -2.596616, 3.770025, 1, 1, 1, 1, 1,
0.5207554, 0.3943812, -0.2631725, 1, 1, 1, 1, 1,
0.5232417, 0.3707846, 0.3670557, 1, 1, 1, 1, 1,
0.5238408, 0.7602418, 1.169711, 1, 1, 1, 1, 1,
0.5264943, 0.7080888, 0.8827712, 1, 1, 1, 1, 1,
0.5265855, 0.7083502, 0.2995985, 1, 1, 1, 1, 1,
0.5298151, 0.8699949, 1.341237, 1, 1, 1, 1, 1,
0.5311354, -1.758263, 0.5270315, 1, 1, 1, 1, 1,
0.5340365, -0.5239524, 0.7026774, 1, 1, 1, 1, 1,
0.5476059, -0.04992673, 2.23538, 0, 0, 1, 1, 1,
0.560456, 3.05362, 1.173355, 1, 0, 0, 1, 1,
0.5739611, -0.4192503, 3.426268, 1, 0, 0, 1, 1,
0.5808176, -0.8276157, 1.550815, 1, 0, 0, 1, 1,
0.5836552, -1.464596, 1.933845, 1, 0, 0, 1, 1,
0.5878536, 0.6565755, 1.701943, 1, 0, 0, 1, 1,
0.5938247, 0.8805367, 0.9796035, 0, 0, 0, 1, 1,
0.6039656, 1.629776, 0.4806975, 0, 0, 0, 1, 1,
0.6041712, 1.106689, -0.03611564, 0, 0, 0, 1, 1,
0.6063955, 0.6126486, 1.913008, 0, 0, 0, 1, 1,
0.6100643, -1.943266, 3.102978, 0, 0, 0, 1, 1,
0.6165081, -0.5320098, 2.005007, 0, 0, 0, 1, 1,
0.6172047, 0.2118297, -0.3464393, 0, 0, 0, 1, 1,
0.6175197, -1.300152, 1.686266, 1, 1, 1, 1, 1,
0.6181604, -2.339895, 3.576005, 1, 1, 1, 1, 1,
0.6221045, -0.4023367, 2.218062, 1, 1, 1, 1, 1,
0.6293144, 1.601703, -0.5191386, 1, 1, 1, 1, 1,
0.6390295, 1.011554, 0.8138903, 1, 1, 1, 1, 1,
0.63921, 1.594631, -0.3193587, 1, 1, 1, 1, 1,
0.6431604, 0.1337118, 0.884322, 1, 1, 1, 1, 1,
0.6458172, 0.03936519, 2.698147, 1, 1, 1, 1, 1,
0.647315, -0.231704, 2.699194, 1, 1, 1, 1, 1,
0.6488928, -0.6261635, 2.640848, 1, 1, 1, 1, 1,
0.6505229, 0.1590722, 1.608804, 1, 1, 1, 1, 1,
0.6519092, -0.9403601, 3.474567, 1, 1, 1, 1, 1,
0.653299, -0.377894, 1.263908, 1, 1, 1, 1, 1,
0.6546593, -1.249402, 4.067621, 1, 1, 1, 1, 1,
0.6549938, -0.9684502, 2.810886, 1, 1, 1, 1, 1,
0.6566026, 0.115101, 1.207438, 0, 0, 1, 1, 1,
0.6583112, -0.3413158, 1.744476, 1, 0, 0, 1, 1,
0.6586264, 1.692077, 0.7518911, 1, 0, 0, 1, 1,
0.6590676, -1.646721, 3.058854, 1, 0, 0, 1, 1,
0.6631691, -0.9081801, 1.334966, 1, 0, 0, 1, 1,
0.6647413, -0.835403, 3.209894, 1, 0, 0, 1, 1,
0.6660702, 0.08657674, -0.3272227, 0, 0, 0, 1, 1,
0.668891, -0.2686076, 1.543893, 0, 0, 0, 1, 1,
0.670328, 1.841032, -0.3641793, 0, 0, 0, 1, 1,
0.6773597, 0.1757343, 1.215834, 0, 0, 0, 1, 1,
0.6825304, -0.8750979, 2.843842, 0, 0, 0, 1, 1,
0.6958241, 0.4704025, 1.616257, 0, 0, 0, 1, 1,
0.7003711, 0.2508294, 0.692588, 0, 0, 0, 1, 1,
0.7009691, -0.8827332, 2.881663, 1, 1, 1, 1, 1,
0.7044133, -1.340649, 3.29321, 1, 1, 1, 1, 1,
0.7052632, 0.619179, 2.233805, 1, 1, 1, 1, 1,
0.7120862, -1.834712, 3.097958, 1, 1, 1, 1, 1,
0.7222508, -0.07837752, 1.933286, 1, 1, 1, 1, 1,
0.7224385, -0.03273936, 0.02148228, 1, 1, 1, 1, 1,
0.7238313, -0.03014659, 1.661035, 1, 1, 1, 1, 1,
0.7252124, -0.5906166, 1.847775, 1, 1, 1, 1, 1,
0.7338217, 0.180627, 1.461049, 1, 1, 1, 1, 1,
0.7354253, -0.167713, 1.734201, 1, 1, 1, 1, 1,
0.7374674, 1.473029, 2.653628, 1, 1, 1, 1, 1,
0.742754, -0.2928604, 1.578082, 1, 1, 1, 1, 1,
0.7444858, -0.8742214, 2.902762, 1, 1, 1, 1, 1,
0.7453801, 1.295617, 1.773119, 1, 1, 1, 1, 1,
0.7462704, 1.107148, 1.703582, 1, 1, 1, 1, 1,
0.7491938, -0.5687208, 2.385572, 0, 0, 1, 1, 1,
0.7537217, 1.128562, 1.460831, 1, 0, 0, 1, 1,
0.7567066, -0.8077379, 2.021391, 1, 0, 0, 1, 1,
0.7672616, 0.8737351, 1.054877, 1, 0, 0, 1, 1,
0.7690771, 0.05186488, 1.090146, 1, 0, 0, 1, 1,
0.77138, -0.1728227, 0.979148, 1, 0, 0, 1, 1,
0.7714126, 0.6497052, 0.6480055, 0, 0, 0, 1, 1,
0.7715878, 0.268301, 0.01683934, 0, 0, 0, 1, 1,
0.7735606, -0.2596139, 0.2991705, 0, 0, 0, 1, 1,
0.7736152, -0.6988087, 1.097487, 0, 0, 0, 1, 1,
0.7742041, 0.8177854, -1.773676, 0, 0, 0, 1, 1,
0.7759629, -1.293079, 1.711266, 0, 0, 0, 1, 1,
0.7860496, 0.7681091, -0.0936498, 0, 0, 0, 1, 1,
0.7900145, 0.5268661, -1.020151, 1, 1, 1, 1, 1,
0.7905262, -0.2967103, -0.06767442, 1, 1, 1, 1, 1,
0.7981094, 0.17414, -0.6050296, 1, 1, 1, 1, 1,
0.8012378, 0.7139148, 0.6250408, 1, 1, 1, 1, 1,
0.8143424, 0.1765659, 1.632249, 1, 1, 1, 1, 1,
0.8173765, -0.7149171, 1.557553, 1, 1, 1, 1, 1,
0.8198393, 0.5610595, 1.937493, 1, 1, 1, 1, 1,
0.8229989, 1.286887, -1.103834, 1, 1, 1, 1, 1,
0.8235683, -1.578766, -0.2302956, 1, 1, 1, 1, 1,
0.824759, 0.2551663, 0.9737336, 1, 1, 1, 1, 1,
0.833288, 0.1231437, 2.823057, 1, 1, 1, 1, 1,
0.8463082, -0.1855652, 1.866197, 1, 1, 1, 1, 1,
0.8516321, 0.9766633, 0.8048083, 1, 1, 1, 1, 1,
0.8602434, -1.943913, 1.468297, 1, 1, 1, 1, 1,
0.8609047, 1.086682, 1.481788, 1, 1, 1, 1, 1,
0.8656213, 0.04313643, 1.961596, 0, 0, 1, 1, 1,
0.8681703, -0.4274221, 2.630575, 1, 0, 0, 1, 1,
0.8706338, -0.0346421, 0.3381737, 1, 0, 0, 1, 1,
0.8711117, 1.160532, -0.5219303, 1, 0, 0, 1, 1,
0.8741147, 0.03822188, -0.04574155, 1, 0, 0, 1, 1,
0.8857837, -0.7991638, 2.786114, 1, 0, 0, 1, 1,
0.8871104, 0.6241353, -0.8934679, 0, 0, 0, 1, 1,
0.8872482, -0.2530343, 1.954383, 0, 0, 0, 1, 1,
0.8880739, 0.4051237, -0.6865368, 0, 0, 0, 1, 1,
0.8916577, 1.477617, 0.5795108, 0, 0, 0, 1, 1,
0.8938209, 1.00181, 0.9431238, 0, 0, 0, 1, 1,
0.8942516, 0.289017, 1.697492, 0, 0, 0, 1, 1,
0.9006265, -1.232213, 4.016582, 0, 0, 0, 1, 1,
0.9014694, -1.080709, 1.731615, 1, 1, 1, 1, 1,
0.9057246, 0.001509934, 1.37556, 1, 1, 1, 1, 1,
0.9072685, 0.09290567, 2.174966, 1, 1, 1, 1, 1,
0.9104067, 1.698619, 1.194136, 1, 1, 1, 1, 1,
0.9148551, 0.1755329, 1.322783, 1, 1, 1, 1, 1,
0.9164751, -1.821965, 3.334985, 1, 1, 1, 1, 1,
0.9213809, -0.2012274, -0.4415725, 1, 1, 1, 1, 1,
0.9330423, -0.6691646, 3.781847, 1, 1, 1, 1, 1,
0.9361262, 0.8544197, 0.7138551, 1, 1, 1, 1, 1,
0.9459718, 0.3826133, 1.703744, 1, 1, 1, 1, 1,
0.9465941, 0.8608432, 1.960872, 1, 1, 1, 1, 1,
0.9493967, -0.7549858, 2.052413, 1, 1, 1, 1, 1,
0.9524854, 1.536, -0.2155185, 1, 1, 1, 1, 1,
0.9525217, -1.667625, 2.275411, 1, 1, 1, 1, 1,
0.9534175, 0.6524718, 2.035375, 1, 1, 1, 1, 1,
0.9586705, 0.2469659, 2.155915, 0, 0, 1, 1, 1,
0.9590381, 1.420962, 1.756521, 1, 0, 0, 1, 1,
0.9628199, 1.001305, 0.9009262, 1, 0, 0, 1, 1,
0.9685902, 0.5592144, 0.2921433, 1, 0, 0, 1, 1,
0.998893, -0.4202181, 3.851038, 1, 0, 0, 1, 1,
1.003525, -1.116922, 3.232537, 1, 0, 0, 1, 1,
1.009975, 0.5135522, 0.5102976, 0, 0, 0, 1, 1,
1.010262, 1.203637, 0.9209928, 0, 0, 0, 1, 1,
1.015557, 2.357965, -0.5638923, 0, 0, 0, 1, 1,
1.017535, -0.05233138, 1.743289, 0, 0, 0, 1, 1,
1.022472, -0.04676079, 1.307187, 0, 0, 0, 1, 1,
1.028194, 0.9255552, 3.310959, 0, 0, 0, 1, 1,
1.049551, -0.669345, 2.41231, 0, 0, 0, 1, 1,
1.05045, 0.3813463, 0.6463163, 1, 1, 1, 1, 1,
1.051126, 1.340054, 1.709351, 1, 1, 1, 1, 1,
1.054835, 2.686176, 1.244594, 1, 1, 1, 1, 1,
1.069247, 0.8107143, 1.392674, 1, 1, 1, 1, 1,
1.072666, 0.3024845, -0.2761737, 1, 1, 1, 1, 1,
1.073723, -0.07205687, 3.147581, 1, 1, 1, 1, 1,
1.07428, 0.1828893, 1.027676, 1, 1, 1, 1, 1,
1.074385, 0.1838806, 2.098694, 1, 1, 1, 1, 1,
1.079743, -0.1945712, 0.9218562, 1, 1, 1, 1, 1,
1.082231, -1.681206, 3.255469, 1, 1, 1, 1, 1,
1.086544, -0.3723235, -0.05324896, 1, 1, 1, 1, 1,
1.089464, 1.617743, 1.750162, 1, 1, 1, 1, 1,
1.09243, 0.3938214, 0.6541631, 1, 1, 1, 1, 1,
1.093568, 1.043747, 1.997642, 1, 1, 1, 1, 1,
1.096018, -0.08991712, 2.348884, 1, 1, 1, 1, 1,
1.102674, 1.252979, 0.5276428, 0, 0, 1, 1, 1,
1.108947, -0.8973085, 1.792504, 1, 0, 0, 1, 1,
1.109071, 1.653111, -0.4201685, 1, 0, 0, 1, 1,
1.109637, -1.132672, 2.238709, 1, 0, 0, 1, 1,
1.114869, -1.639069, 1.847677, 1, 0, 0, 1, 1,
1.11566, -0.07713649, 1.102991, 1, 0, 0, 1, 1,
1.116522, 1.205347, 0.7073265, 0, 0, 0, 1, 1,
1.119875, -1.820043, 3.626897, 0, 0, 0, 1, 1,
1.120686, -0.92414, 1.377614, 0, 0, 0, 1, 1,
1.126248, 0.07404834, 2.810484, 0, 0, 0, 1, 1,
1.127277, 0.7346134, 0.7473201, 0, 0, 0, 1, 1,
1.139211, -0.9408126, 3.712993, 0, 0, 0, 1, 1,
1.141648, -0.3120577, 2.964317, 0, 0, 0, 1, 1,
1.142811, -1.009634, 1.357266, 1, 1, 1, 1, 1,
1.144368, 0.06472655, -0.2861258, 1, 1, 1, 1, 1,
1.145404, -1.495067, 2.926336, 1, 1, 1, 1, 1,
1.147697, 1.080483, 0.7396696, 1, 1, 1, 1, 1,
1.149731, 1.87105, 0.5369028, 1, 1, 1, 1, 1,
1.149854, 0.2464775, 0.6083736, 1, 1, 1, 1, 1,
1.158415, 0.8333282, 1.552946, 1, 1, 1, 1, 1,
1.169614, 2.530942, -0.03292671, 1, 1, 1, 1, 1,
1.182134, -1.21074, 2.606742, 1, 1, 1, 1, 1,
1.188151, -1.113116, 1.152048, 1, 1, 1, 1, 1,
1.188159, -1.267716, 0.9455751, 1, 1, 1, 1, 1,
1.190629, -1.116787, 2.224174, 1, 1, 1, 1, 1,
1.196487, 1.198343, 1.940856, 1, 1, 1, 1, 1,
1.214048, -0.2116209, 0.5632489, 1, 1, 1, 1, 1,
1.216407, -0.109178, 0.448529, 1, 1, 1, 1, 1,
1.225311, 0.1048284, 1.114894, 0, 0, 1, 1, 1,
1.225891, -1.26502, 1.179242, 1, 0, 0, 1, 1,
1.22615, -0.06784719, 2.551375, 1, 0, 0, 1, 1,
1.226649, -0.1256055, 2.754806, 1, 0, 0, 1, 1,
1.22865, -0.9356082, 1.871373, 1, 0, 0, 1, 1,
1.236031, -2.154278, 1.792173, 1, 0, 0, 1, 1,
1.237162, 0.8785935, 0.3379318, 0, 0, 0, 1, 1,
1.237778, 0.01963518, 0.7233589, 0, 0, 0, 1, 1,
1.242316, -0.6500595, 0.9989575, 0, 0, 0, 1, 1,
1.25679, -0.6234059, 1.027964, 0, 0, 0, 1, 1,
1.257436, 1.082871, 1.820319, 0, 0, 0, 1, 1,
1.25764, 0.9384988, 0.7537966, 0, 0, 0, 1, 1,
1.260961, 1.070416, -0.4066567, 0, 0, 0, 1, 1,
1.263476, 0.2679457, 0.7564934, 1, 1, 1, 1, 1,
1.263516, -0.6881917, 3.298756, 1, 1, 1, 1, 1,
1.280891, 2.076482, 2.242239, 1, 1, 1, 1, 1,
1.288501, 0.2864079, 2.934015, 1, 1, 1, 1, 1,
1.300157, 0.06182018, 2.606278, 1, 1, 1, 1, 1,
1.3019, 0.4591381, 0.4653281, 1, 1, 1, 1, 1,
1.302159, -0.1157876, 1.566648, 1, 1, 1, 1, 1,
1.307725, 0.1842108, 1.325011, 1, 1, 1, 1, 1,
1.318518, -0.1890852, 1.265436, 1, 1, 1, 1, 1,
1.321552, -1.543028, 3.557065, 1, 1, 1, 1, 1,
1.336201, 0.1186222, -0.3765949, 1, 1, 1, 1, 1,
1.337517, -0.5325439, 2.31287, 1, 1, 1, 1, 1,
1.346119, -0.7730194, 1.583094, 1, 1, 1, 1, 1,
1.349601, 0.410482, 2.540195, 1, 1, 1, 1, 1,
1.356866, 0.7497708, 0.6675586, 1, 1, 1, 1, 1,
1.36533, 0.5093846, 2.015568, 0, 0, 1, 1, 1,
1.370431, 0.5934325, 2.05543, 1, 0, 0, 1, 1,
1.376636, -0.3685459, 3.292783, 1, 0, 0, 1, 1,
1.383626, -0.07343762, 2.186642, 1, 0, 0, 1, 1,
1.396822, 0.2864935, 2.230747, 1, 0, 0, 1, 1,
1.408286, -1.106129, 2.227779, 1, 0, 0, 1, 1,
1.41277, 1.112421, -0.1293668, 0, 0, 0, 1, 1,
1.425997, 0.1847977, 2.729061, 0, 0, 0, 1, 1,
1.43541, -0.9988643, 3.003889, 0, 0, 0, 1, 1,
1.442301, 1.205273, -0.5098207, 0, 0, 0, 1, 1,
1.446943, 1.401258, 1.889673, 0, 0, 0, 1, 1,
1.448473, -0.5133455, 2.11008, 0, 0, 0, 1, 1,
1.45275, 2.012613, 0.9832678, 0, 0, 0, 1, 1,
1.465458, -0.4547195, 1.665814, 1, 1, 1, 1, 1,
1.466827, -0.2808163, 1.397792, 1, 1, 1, 1, 1,
1.469665, -0.2967505, 1.555934, 1, 1, 1, 1, 1,
1.471621, 0.497904, 0.7304407, 1, 1, 1, 1, 1,
1.475108, 0.2990963, 1.657212, 1, 1, 1, 1, 1,
1.496777, 0.3332548, 0.5210491, 1, 1, 1, 1, 1,
1.498077, -1.041196, 3.835357, 1, 1, 1, 1, 1,
1.499464, -2.021241, 2.355219, 1, 1, 1, 1, 1,
1.500605, -2.190325, 2.677658, 1, 1, 1, 1, 1,
1.512632, 0.2282215, 1.391524, 1, 1, 1, 1, 1,
1.521009, 0.5162985, 3.048954, 1, 1, 1, 1, 1,
1.52412, -0.9238478, 0.9177469, 1, 1, 1, 1, 1,
1.572125, 0.7808664, 0.958277, 1, 1, 1, 1, 1,
1.586024, -0.5996239, 2.651012, 1, 1, 1, 1, 1,
1.629342, -1.229851, 0.003983682, 1, 1, 1, 1, 1,
1.630601, 1.297076, 1.875025, 0, 0, 1, 1, 1,
1.654691, 0.4013367, 1.800924, 1, 0, 0, 1, 1,
1.660151, -0.8320724, 2.281681, 1, 0, 0, 1, 1,
1.675016, 0.6420978, 0.521628, 1, 0, 0, 1, 1,
1.680868, -0.1689825, 1.987744, 1, 0, 0, 1, 1,
1.689463, 1.056482, -0.0449156, 1, 0, 0, 1, 1,
1.721609, 1.164094, 0.9185366, 0, 0, 0, 1, 1,
1.738962, 1.040854, -0.1289787, 0, 0, 0, 1, 1,
1.739573, 1.15879, 1.498688, 0, 0, 0, 1, 1,
1.746074, 1.567967, 0.557053, 0, 0, 0, 1, 1,
1.752793, -1.639857, 1.107189, 0, 0, 0, 1, 1,
1.764941, 0.5477003, 0.1860015, 0, 0, 0, 1, 1,
1.767102, -1.47338, 3.297075, 0, 0, 0, 1, 1,
1.767327, -1.918694, 2.382961, 1, 1, 1, 1, 1,
1.773357, 0.9069777, 3.318175, 1, 1, 1, 1, 1,
1.774536, 0.3221449, 2.427034, 1, 1, 1, 1, 1,
1.787366, -0.46569, 0.9609309, 1, 1, 1, 1, 1,
1.790343, -1.176122, 1.888983, 1, 1, 1, 1, 1,
1.862965, 0.8409528, 0.6510891, 1, 1, 1, 1, 1,
1.86387, -1.059086, 1.538085, 1, 1, 1, 1, 1,
1.872413, 0.9728832, 0.8045417, 1, 1, 1, 1, 1,
1.887234, 1.473395, -0.1791864, 1, 1, 1, 1, 1,
1.894946, 0.2455258, 2.098372, 1, 1, 1, 1, 1,
1.899596, 0.6077682, -0.5537764, 1, 1, 1, 1, 1,
1.919168, 0.07440341, 1.766525, 1, 1, 1, 1, 1,
1.921797, -1.344676, 1.736579, 1, 1, 1, 1, 1,
1.932661, -1.278295, 1.432917, 1, 1, 1, 1, 1,
1.948811, 1.045331, 0.2490841, 1, 1, 1, 1, 1,
1.992548, 1.059327, 1.218491, 0, 0, 1, 1, 1,
1.995054, -2.261806, 2.734562, 1, 0, 0, 1, 1,
2.007656, 0.4001681, 3.62897, 1, 0, 0, 1, 1,
2.020366, 0.154562, 1.709299, 1, 0, 0, 1, 1,
2.046062, 1.631161, 1.032192, 1, 0, 0, 1, 1,
2.064656, -0.6593446, 3.744002, 1, 0, 0, 1, 1,
2.18858, 0.1229739, 0.3892244, 0, 0, 0, 1, 1,
2.200763, -0.2626491, 1.578709, 0, 0, 0, 1, 1,
2.220264, 0.1570774, 1.598535, 0, 0, 0, 1, 1,
2.239611, -0.9902179, 1.218856, 0, 0, 0, 1, 1,
2.293435, 0.8850518, 2.981731, 0, 0, 0, 1, 1,
2.304328, -1.526666, 3.743179, 0, 0, 0, 1, 1,
2.310357, -1.227392, 2.821268, 0, 0, 0, 1, 1,
2.370307, -0.4449185, 3.656808, 1, 1, 1, 1, 1,
2.508897, 1.463023, 1.118766, 1, 1, 1, 1, 1,
2.707118, -0.7130103, 2.717485, 1, 1, 1, 1, 1,
2.713016, -1.222847, 3.564022, 1, 1, 1, 1, 1,
2.805639, 0.7618175, 0.7590395, 1, 1, 1, 1, 1,
2.905988, 0.6979957, -0.7432958, 1, 1, 1, 1, 1,
3.036529, -0.03143941, 1.930001, 1, 1, 1, 1, 1
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
var radius = 9.836758;
var distance = 34.55119;
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
mvMatrix.translate( 0.1004298, -0.1279243, -0.6902835 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55119);
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