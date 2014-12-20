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
-3.098442, -0.01569425, 0.05832063, 1, 0, 0, 1,
-2.724321, -0.002651113, -1.824252, 1, 0.007843138, 0, 1,
-2.630646, -0.1083896, -3.03027, 1, 0.01176471, 0, 1,
-2.630368, 0.1609842, -0.8378581, 1, 0.01960784, 0, 1,
-2.546876, 0.9471902, -1.693331, 1, 0.02352941, 0, 1,
-2.540549, 0.9812721, -0.96595, 1, 0.03137255, 0, 1,
-2.433778, 0.1026023, -1.160319, 1, 0.03529412, 0, 1,
-2.34302, 0.6234869, -2.210781, 1, 0.04313726, 0, 1,
-2.330711, 0.2282444, -2.51724, 1, 0.04705882, 0, 1,
-2.299853, -0.05161154, -2.678162, 1, 0.05490196, 0, 1,
-2.278572, 0.2229816, -1.366853, 1, 0.05882353, 0, 1,
-2.256336, 0.404613, -1.82317, 1, 0.06666667, 0, 1,
-2.239406, -1.458225, -2.585087, 1, 0.07058824, 0, 1,
-2.226056, -0.656427, -1.32284, 1, 0.07843138, 0, 1,
-2.213946, 0.5200258, -1.575753, 1, 0.08235294, 0, 1,
-2.177957, 0.05036802, -2.363684, 1, 0.09019608, 0, 1,
-2.147813, -0.506541, -0.3392095, 1, 0.09411765, 0, 1,
-2.090361, -1.13542, -3.354636, 1, 0.1019608, 0, 1,
-2.08441, 1.082906, -2.940284, 1, 0.1098039, 0, 1,
-2.046038, 0.4382459, -0.9244902, 1, 0.1137255, 0, 1,
-2.040414, 1.080473, -1.241043, 1, 0.1215686, 0, 1,
-2.031726, 0.8096824, -1.372383, 1, 0.1254902, 0, 1,
-2.021032, -0.1270621, -1.82835, 1, 0.1333333, 0, 1,
-1.955469, 0.6132187, -0.8519198, 1, 0.1372549, 0, 1,
-1.933215, -1.230809, -2.400187, 1, 0.145098, 0, 1,
-1.932311, 0.0710163, -1.172357, 1, 0.1490196, 0, 1,
-1.928837, -1.230349, -2.515904, 1, 0.1568628, 0, 1,
-1.913332, -0.9164312, -2.274469, 1, 0.1607843, 0, 1,
-1.890666, -0.6637507, -1.303973, 1, 0.1686275, 0, 1,
-1.871457, -0.1158649, -1.217399, 1, 0.172549, 0, 1,
-1.856192, -1.612472, -2.53184, 1, 0.1803922, 0, 1,
-1.814351, 1.351269, -2.183865, 1, 0.1843137, 0, 1,
-1.795955, -1.174604, -1.330251, 1, 0.1921569, 0, 1,
-1.794588, 1.201063, 0.233653, 1, 0.1960784, 0, 1,
-1.78336, 0.3769801, -0.1454618, 1, 0.2039216, 0, 1,
-1.782247, 1.213215, -1.363657, 1, 0.2117647, 0, 1,
-1.77275, -0.1200661, -2.283602, 1, 0.2156863, 0, 1,
-1.764171, 0.1883145, -2.53196, 1, 0.2235294, 0, 1,
-1.755251, 0.1849486, -1.005906, 1, 0.227451, 0, 1,
-1.741715, 0.6998906, -0.8353434, 1, 0.2352941, 0, 1,
-1.710755, -1.284637, -2.990238, 1, 0.2392157, 0, 1,
-1.70431, 0.8562043, -0.4078892, 1, 0.2470588, 0, 1,
-1.70408, -0.002813808, -2.407537, 1, 0.2509804, 0, 1,
-1.702768, 0.2777646, -0.8036897, 1, 0.2588235, 0, 1,
-1.700474, 1.259996, -0.1422345, 1, 0.2627451, 0, 1,
-1.685299, 0.1520437, -1.773908, 1, 0.2705882, 0, 1,
-1.680404, -0.741839, -2.805918, 1, 0.2745098, 0, 1,
-1.679135, -0.9766673, -3.659062, 1, 0.282353, 0, 1,
-1.672266, 0.4337764, -2.292525, 1, 0.2862745, 0, 1,
-1.671107, -0.4962678, 0.2615909, 1, 0.2941177, 0, 1,
-1.645497, 0.1104532, -2.128986, 1, 0.3019608, 0, 1,
-1.63997, -0.8437015, -1.976267, 1, 0.3058824, 0, 1,
-1.625379, 0.02680993, -0.1005779, 1, 0.3137255, 0, 1,
-1.624016, 0.7831348, -3.388618, 1, 0.3176471, 0, 1,
-1.61434, -2.01182, -3.373702, 1, 0.3254902, 0, 1,
-1.612391, -0.9554945, -3.469403, 1, 0.3294118, 0, 1,
-1.605101, 0.7489969, 0.8986332, 1, 0.3372549, 0, 1,
-1.599199, 0.2732403, -0.2716098, 1, 0.3411765, 0, 1,
-1.595629, 0.5902803, -0.1592661, 1, 0.3490196, 0, 1,
-1.588059, 1.307778, -0.3574173, 1, 0.3529412, 0, 1,
-1.581638, 1.679261, -1.374213, 1, 0.3607843, 0, 1,
-1.581599, -0.2390073, -1.85913, 1, 0.3647059, 0, 1,
-1.581266, -1.057031, -2.367236, 1, 0.372549, 0, 1,
-1.57675, 1.044403, 0.5276328, 1, 0.3764706, 0, 1,
-1.567181, 0.1693455, -2.735739, 1, 0.3843137, 0, 1,
-1.550509, -0.5511985, -3.438596, 1, 0.3882353, 0, 1,
-1.535748, -0.5015309, -3.227748, 1, 0.3960784, 0, 1,
-1.528237, -0.5604288, -3.286836, 1, 0.4039216, 0, 1,
-1.519159, 0.2754813, -2.018949, 1, 0.4078431, 0, 1,
-1.510993, -1.226204, -0.6452872, 1, 0.4156863, 0, 1,
-1.506253, 0.3832717, -0.8902026, 1, 0.4196078, 0, 1,
-1.493303, -1.044397, -3.208838, 1, 0.427451, 0, 1,
-1.490973, 0.2971658, -0.8888186, 1, 0.4313726, 0, 1,
-1.484786, 0.3924438, -1.282688, 1, 0.4392157, 0, 1,
-1.48123, 0.581421, -1.846693, 1, 0.4431373, 0, 1,
-1.47467, -0.138124, -2.988235, 1, 0.4509804, 0, 1,
-1.465557, 0.861679, -1.250554, 1, 0.454902, 0, 1,
-1.460267, 0.01679502, -0.6832392, 1, 0.4627451, 0, 1,
-1.448106, -0.3681231, -2.420094, 1, 0.4666667, 0, 1,
-1.43609, -0.5907953, -2.768939, 1, 0.4745098, 0, 1,
-1.433241, -0.7741416, -5.537134, 1, 0.4784314, 0, 1,
-1.427575, -0.04912523, -2.183743, 1, 0.4862745, 0, 1,
-1.423217, 1.260978, 0.8495457, 1, 0.4901961, 0, 1,
-1.413173, -0.6393813, -0.5732751, 1, 0.4980392, 0, 1,
-1.410699, -0.8422635, -1.559464, 1, 0.5058824, 0, 1,
-1.408728, -1.268316, -4.311164, 1, 0.509804, 0, 1,
-1.40687, -0.08544502, -2.264999, 1, 0.5176471, 0, 1,
-1.406854, -0.8824939, -0.7481574, 1, 0.5215687, 0, 1,
-1.406574, -1.432112, -4.082195, 1, 0.5294118, 0, 1,
-1.403412, 0.5207322, -2.230438, 1, 0.5333334, 0, 1,
-1.397407, -0.6144878, -2.892322, 1, 0.5411765, 0, 1,
-1.385122, -0.2628576, -4.130737, 1, 0.5450981, 0, 1,
-1.384851, -0.21079, -0.6932811, 1, 0.5529412, 0, 1,
-1.382032, -1.847137, -2.643245, 1, 0.5568628, 0, 1,
-1.380418, -0.8558841, -1.864888, 1, 0.5647059, 0, 1,
-1.366493, -0.2692928, -1.048312, 1, 0.5686275, 0, 1,
-1.365044, 0.08400558, 0.3570724, 1, 0.5764706, 0, 1,
-1.364192, -0.04756837, -2.18651, 1, 0.5803922, 0, 1,
-1.363098, -1.424737, -2.138651, 1, 0.5882353, 0, 1,
-1.357453, -0.1924096, -1.797207, 1, 0.5921569, 0, 1,
-1.350984, -0.5685927, -3.120172, 1, 0.6, 0, 1,
-1.350881, -0.04806136, -1.503301, 1, 0.6078432, 0, 1,
-1.340362, 1.146088, -1.436049, 1, 0.6117647, 0, 1,
-1.338624, 1.989776, -1.344626, 1, 0.6196079, 0, 1,
-1.318893, 0.8892788, -0.6411605, 1, 0.6235294, 0, 1,
-1.313921, -0.5002806, -1.088016, 1, 0.6313726, 0, 1,
-1.309116, 1.445233, -0.0882501, 1, 0.6352941, 0, 1,
-1.289916, -0.3554337, -3.003192, 1, 0.6431373, 0, 1,
-1.28674, -0.1392517, -1.215484, 1, 0.6470588, 0, 1,
-1.281585, -1.974458, -1.489049, 1, 0.654902, 0, 1,
-1.271021, -2.13658, -1.348758, 1, 0.6588235, 0, 1,
-1.270436, 0.7517146, 0.05680253, 1, 0.6666667, 0, 1,
-1.266993, 0.2711563, 0.115148, 1, 0.6705883, 0, 1,
-1.259955, -0.2944421, -2.346562, 1, 0.6784314, 0, 1,
-1.258307, 0.3297563, -1.246901, 1, 0.682353, 0, 1,
-1.256009, -0.3016134, -3.604202, 1, 0.6901961, 0, 1,
-1.25565, 0.2644802, -1.468283, 1, 0.6941177, 0, 1,
-1.24909, -1.721357, -0.5063186, 1, 0.7019608, 0, 1,
-1.247057, -2.711382, -1.720433, 1, 0.7098039, 0, 1,
-1.245646, -1.368637, -1.943137, 1, 0.7137255, 0, 1,
-1.240161, -1.03458, -2.434289, 1, 0.7215686, 0, 1,
-1.233909, -0.4701605, -2.165353, 1, 0.7254902, 0, 1,
-1.232543, -0.7919688, -2.637837, 1, 0.7333333, 0, 1,
-1.221372, -0.4938163, -2.876491, 1, 0.7372549, 0, 1,
-1.221212, -0.6726997, -1.575588, 1, 0.7450981, 0, 1,
-1.219808, -0.3045155, -1.799132, 1, 0.7490196, 0, 1,
-1.212061, 1.892512, -1.445639, 1, 0.7568628, 0, 1,
-1.211945, -1.589072, -1.896945, 1, 0.7607843, 0, 1,
-1.203271, -0.5873471, -2.717633, 1, 0.7686275, 0, 1,
-1.196647, 0.330835, -1.911938, 1, 0.772549, 0, 1,
-1.194335, 0.9192882, -2.202456, 1, 0.7803922, 0, 1,
-1.186842, 0.7137199, -1.009618, 1, 0.7843137, 0, 1,
-1.184491, 1.726656, -0.2375476, 1, 0.7921569, 0, 1,
-1.180602, -0.7912049, -2.080409, 1, 0.7960784, 0, 1,
-1.178627, -0.2282193, -1.273275, 1, 0.8039216, 0, 1,
-1.177729, 0.9386535, -0.04396003, 1, 0.8117647, 0, 1,
-1.177636, -1.263358, -1.185817, 1, 0.8156863, 0, 1,
-1.17133, 0.1347851, -0.9153666, 1, 0.8235294, 0, 1,
-1.170802, -1.087108, -2.196279, 1, 0.827451, 0, 1,
-1.162224, 1.024945, -0.2094868, 1, 0.8352941, 0, 1,
-1.146133, -0.4332556, -1.875933, 1, 0.8392157, 0, 1,
-1.139361, -2.190186, -2.642551, 1, 0.8470588, 0, 1,
-1.139254, 0.1062283, -2.405011, 1, 0.8509804, 0, 1,
-1.139036, -2.03226, -3.976247, 1, 0.8588235, 0, 1,
-1.137342, -0.9251973, -1.659393, 1, 0.8627451, 0, 1,
-1.13272, 0.07238187, -2.957877, 1, 0.8705882, 0, 1,
-1.130315, -0.977655, -3.622844, 1, 0.8745098, 0, 1,
-1.125145, -0.7718425, -1.889517, 1, 0.8823529, 0, 1,
-1.123399, 1.051211, -0.7341917, 1, 0.8862745, 0, 1,
-1.11309, 1.060459, -2.184446, 1, 0.8941177, 0, 1,
-1.111385, -0.749075, -4.332577, 1, 0.8980392, 0, 1,
-1.107212, 0.4861311, -0.4586432, 1, 0.9058824, 0, 1,
-1.10646, -0.819953, -2.692342, 1, 0.9137255, 0, 1,
-1.10607, 1.250434, -0.0935192, 1, 0.9176471, 0, 1,
-1.104931, -1.081327, -3.121004, 1, 0.9254902, 0, 1,
-1.099792, 0.6219679, -1.296012, 1, 0.9294118, 0, 1,
-1.096401, 0.7628722, -0.7826875, 1, 0.9372549, 0, 1,
-1.086327, 1.441951, 0.7146375, 1, 0.9411765, 0, 1,
-1.08418, 2.364003, -0.2638431, 1, 0.9490196, 0, 1,
-1.083295, 0.05020742, -2.024865, 1, 0.9529412, 0, 1,
-1.081889, -2.479369, -3.179186, 1, 0.9607843, 0, 1,
-1.076967, 1.109399, -0.1467718, 1, 0.9647059, 0, 1,
-1.074636, 0.118644, -2.71719, 1, 0.972549, 0, 1,
-1.068809, 0.7992471, -1.266663, 1, 0.9764706, 0, 1,
-1.06846, 0.9885913, -0.06314691, 1, 0.9843137, 0, 1,
-1.067992, 0.4600257, -1.915226, 1, 0.9882353, 0, 1,
-1.066848, 0.6799579, -2.22113, 1, 0.9960784, 0, 1,
-1.05831, 0.801746, -0.6572662, 0.9960784, 1, 0, 1,
-1.057714, 1.849875, 0.4545406, 0.9921569, 1, 0, 1,
-1.049722, 0.4973089, -0.5919107, 0.9843137, 1, 0, 1,
-1.049707, -0.2790306, -1.380996, 0.9803922, 1, 0, 1,
-1.04802, 0.3479216, -1.21734, 0.972549, 1, 0, 1,
-1.045239, -0.7660394, -2.04687, 0.9686275, 1, 0, 1,
-1.034047, 1.439329, -1.437515, 0.9607843, 1, 0, 1,
-1.032677, 2.137717, 0.568152, 0.9568627, 1, 0, 1,
-1.032245, -1.014738, -2.94749, 0.9490196, 1, 0, 1,
-1.030144, -0.7910085, -2.708516, 0.945098, 1, 0, 1,
-1.01457, -1.285141, -1.364139, 0.9372549, 1, 0, 1,
-1.011901, 0.8956936, -1.331453, 0.9333333, 1, 0, 1,
-1.010653, -0.8464514, -3.551079, 0.9254902, 1, 0, 1,
-1.005025, -0.8986233, -0.8723207, 0.9215686, 1, 0, 1,
-1.003903, 0.1919754, -1.200163, 0.9137255, 1, 0, 1,
-1.000365, 0.7326143, -0.00575754, 0.9098039, 1, 0, 1,
-0.9978276, -0.4876967, -0.47436, 0.9019608, 1, 0, 1,
-0.9967735, 0.9417075, -0.9543242, 0.8941177, 1, 0, 1,
-0.9917914, -0.5214338, -1.646244, 0.8901961, 1, 0, 1,
-0.9900913, 0.5323185, -1.152853, 0.8823529, 1, 0, 1,
-0.9851437, -0.8988123, -1.397043, 0.8784314, 1, 0, 1,
-0.9801362, -0.115475, -0.5912856, 0.8705882, 1, 0, 1,
-0.9705445, -0.9308961, -2.046789, 0.8666667, 1, 0, 1,
-0.9704924, -0.1886097, -3.192307, 0.8588235, 1, 0, 1,
-0.9566575, -0.1078982, -2.492434, 0.854902, 1, 0, 1,
-0.9520377, 0.2029447, -1.414458, 0.8470588, 1, 0, 1,
-0.9406565, -0.4887426, -1.328009, 0.8431373, 1, 0, 1,
-0.9389475, 0.7657724, -1.95812, 0.8352941, 1, 0, 1,
-0.9382497, 0.8634717, -0.4141937, 0.8313726, 1, 0, 1,
-0.9346302, -1.004798, -3.562968, 0.8235294, 1, 0, 1,
-0.9328521, 0.6597131, -1.266807, 0.8196079, 1, 0, 1,
-0.9324156, 0.8243666, 0.04013158, 0.8117647, 1, 0, 1,
-0.9292852, -0.4181546, -1.772451, 0.8078431, 1, 0, 1,
-0.9208624, -1.188047, -3.609601, 0.8, 1, 0, 1,
-0.90631, 1.14651, -0.207497, 0.7921569, 1, 0, 1,
-0.904381, 0.4971315, -0.501609, 0.7882353, 1, 0, 1,
-0.9035494, 1.533977, -0.4258059, 0.7803922, 1, 0, 1,
-0.9033214, 0.4544036, -1.054297, 0.7764706, 1, 0, 1,
-0.8969479, 0.2202056, -0.862793, 0.7686275, 1, 0, 1,
-0.8918607, 1.020232, -0.628844, 0.7647059, 1, 0, 1,
-0.8751007, 0.04386765, -0.723424, 0.7568628, 1, 0, 1,
-0.8689374, 0.8278286, -1.091729, 0.7529412, 1, 0, 1,
-0.8659201, 0.09607156, -1.370736, 0.7450981, 1, 0, 1,
-0.8626413, 0.557578, -0.4238959, 0.7411765, 1, 0, 1,
-0.8542488, -0.3563195, -3.50694, 0.7333333, 1, 0, 1,
-0.8469607, 0.7077184, -1.372429, 0.7294118, 1, 0, 1,
-0.8453785, 0.1821944, -2.502341, 0.7215686, 1, 0, 1,
-0.8433716, -0.9836541, -3.618413, 0.7176471, 1, 0, 1,
-0.8408664, 1.866803, -1.050447, 0.7098039, 1, 0, 1,
-0.8333797, -0.6622872, -2.256159, 0.7058824, 1, 0, 1,
-0.8317271, 0.325323, -1.141085, 0.6980392, 1, 0, 1,
-0.8295283, -0.8973117, -2.83066, 0.6901961, 1, 0, 1,
-0.8278702, 0.5274392, -1.305937, 0.6862745, 1, 0, 1,
-0.8263933, 0.2035217, -2.464963, 0.6784314, 1, 0, 1,
-0.825037, 0.389409, 0.1748849, 0.6745098, 1, 0, 1,
-0.8249916, -1.561842, -1.271787, 0.6666667, 1, 0, 1,
-0.8247905, 1.875837, -0.5695242, 0.6627451, 1, 0, 1,
-0.8196648, 1.387421, -0.1885177, 0.654902, 1, 0, 1,
-0.8181884, 0.6563454, -1.936978, 0.6509804, 1, 0, 1,
-0.8171806, -0.7173078, -3.426934, 0.6431373, 1, 0, 1,
-0.8030329, -0.3289217, -2.895254, 0.6392157, 1, 0, 1,
-0.8021668, -0.6025287, -2.275737, 0.6313726, 1, 0, 1,
-0.797303, 0.5874714, -1.70921, 0.627451, 1, 0, 1,
-0.7972975, -0.464101, -1.346124, 0.6196079, 1, 0, 1,
-0.7948527, 0.05850967, -3.269221, 0.6156863, 1, 0, 1,
-0.7870966, -1.682769, -3.403392, 0.6078432, 1, 0, 1,
-0.7851741, -1.605083, -4.364233, 0.6039216, 1, 0, 1,
-0.7782314, 0.3488381, -1.915944, 0.5960785, 1, 0, 1,
-0.7734447, -2.2574, -1.692992, 0.5882353, 1, 0, 1,
-0.766559, -1.693505, -1.705848, 0.5843138, 1, 0, 1,
-0.7638786, 0.1230564, -0.7350675, 0.5764706, 1, 0, 1,
-0.7631067, -0.1976821, -1.558097, 0.572549, 1, 0, 1,
-0.7530726, 1.507136, -0.4144443, 0.5647059, 1, 0, 1,
-0.7476652, 2.830997, -1.361008, 0.5607843, 1, 0, 1,
-0.7461047, -0.6130214, -3.211115, 0.5529412, 1, 0, 1,
-0.7457865, 1.80109, -0.4820056, 0.5490196, 1, 0, 1,
-0.7440054, 2.147242, -0.3056451, 0.5411765, 1, 0, 1,
-0.7415451, 1.239129, -1.594632, 0.5372549, 1, 0, 1,
-0.7373731, -0.3204643, -2.297313, 0.5294118, 1, 0, 1,
-0.7369203, 0.6070212, -0.7159107, 0.5254902, 1, 0, 1,
-0.7368413, -0.1598689, -0.953966, 0.5176471, 1, 0, 1,
-0.7304851, 0.2202959, -0.8677293, 0.5137255, 1, 0, 1,
-0.7247584, 1.42562, 0.5803163, 0.5058824, 1, 0, 1,
-0.7160558, -1.288279, -2.480048, 0.5019608, 1, 0, 1,
-0.7135379, -0.8046796, -2.139424, 0.4941176, 1, 0, 1,
-0.7126077, -0.6473296, -1.82917, 0.4862745, 1, 0, 1,
-0.7040389, 1.053794, -2.051287, 0.4823529, 1, 0, 1,
-0.7037517, 2.694733, -0.2052695, 0.4745098, 1, 0, 1,
-0.7023349, 0.4348963, -0.8881317, 0.4705882, 1, 0, 1,
-0.702069, 1.720748, 0.1101624, 0.4627451, 1, 0, 1,
-0.6962758, -0.1878694, -0.8027222, 0.4588235, 1, 0, 1,
-0.693792, 0.3540514, -0.9757875, 0.4509804, 1, 0, 1,
-0.6921915, 1.620824, 0.7856446, 0.4470588, 1, 0, 1,
-0.6892051, 0.9476596, 1.039695, 0.4392157, 1, 0, 1,
-0.6871592, -1.162279, 0.04836836, 0.4352941, 1, 0, 1,
-0.6856523, 0.01214971, -0.9555049, 0.427451, 1, 0, 1,
-0.6837428, 0.1132384, -1.582691, 0.4235294, 1, 0, 1,
-0.6807036, 1.217294, -0.2212406, 0.4156863, 1, 0, 1,
-0.6802205, 1.915604, 0.3912886, 0.4117647, 1, 0, 1,
-0.6773263, -1.112828, 0.4953433, 0.4039216, 1, 0, 1,
-0.6696958, -0.2980653, 0.442238, 0.3960784, 1, 0, 1,
-0.6694471, -0.7023127, -2.539133, 0.3921569, 1, 0, 1,
-0.6592184, 0.6582154, -1.850062, 0.3843137, 1, 0, 1,
-0.6579078, 0.4871368, -2.318097, 0.3803922, 1, 0, 1,
-0.6555752, 0.6184076, -1.981549, 0.372549, 1, 0, 1,
-0.6546959, 0.3111233, 0.2495389, 0.3686275, 1, 0, 1,
-0.6535289, -0.07211118, -2.646512, 0.3607843, 1, 0, 1,
-0.6515934, 0.4140078, -2.137339, 0.3568628, 1, 0, 1,
-0.6477093, 1.236475, -1.177321, 0.3490196, 1, 0, 1,
-0.6469247, -1.637924, -3.801997, 0.345098, 1, 0, 1,
-0.6445265, 0.6211921, -2.841251, 0.3372549, 1, 0, 1,
-0.6332521, -0.6545829, -0.9552751, 0.3333333, 1, 0, 1,
-0.6323748, -1.002194, -1.433663, 0.3254902, 1, 0, 1,
-0.6297027, 0.06776594, -0.2842202, 0.3215686, 1, 0, 1,
-0.6015487, -0.2573844, -2.525859, 0.3137255, 1, 0, 1,
-0.6005033, 0.2349199, -1.713278, 0.3098039, 1, 0, 1,
-0.59753, -1.219353, -1.016626, 0.3019608, 1, 0, 1,
-0.5937087, 1.016363, 0.609884, 0.2941177, 1, 0, 1,
-0.5924465, -0.6136348, -2.714664, 0.2901961, 1, 0, 1,
-0.5886861, -0.2124371, -2.874725, 0.282353, 1, 0, 1,
-0.5862306, 0.8590188, -0.3493711, 0.2784314, 1, 0, 1,
-0.5855784, -0.8898913, -2.099223, 0.2705882, 1, 0, 1,
-0.580506, -0.46255, -3.088547, 0.2666667, 1, 0, 1,
-0.5776629, -0.1741793, -1.883039, 0.2588235, 1, 0, 1,
-0.5757508, -1.979056, -2.600356, 0.254902, 1, 0, 1,
-0.573885, -0.1018013, -0.07795545, 0.2470588, 1, 0, 1,
-0.5713068, -0.1167068, -1.550893, 0.2431373, 1, 0, 1,
-0.5697008, -1.310198, -4.527912, 0.2352941, 1, 0, 1,
-0.5609658, -1.059794, -3.540933, 0.2313726, 1, 0, 1,
-0.5552468, 1.11987, 1.245155, 0.2235294, 1, 0, 1,
-0.5550857, 0.8570538, -1.559899, 0.2196078, 1, 0, 1,
-0.5520471, 0.2645509, -1.096722, 0.2117647, 1, 0, 1,
-0.5504622, -0.4327961, -1.502587, 0.2078431, 1, 0, 1,
-0.5481716, -1.148576, -3.629052, 0.2, 1, 0, 1,
-0.5464321, -2.449908, -4.414521, 0.1921569, 1, 0, 1,
-0.5429604, -1.693311, -4.405655, 0.1882353, 1, 0, 1,
-0.5394218, 1.061398, -1.021162, 0.1803922, 1, 0, 1,
-0.5384931, 0.2568451, -1.722958, 0.1764706, 1, 0, 1,
-0.5380068, -1.319667, -4.154439, 0.1686275, 1, 0, 1,
-0.5366548, 0.621872, 0.2541445, 0.1647059, 1, 0, 1,
-0.5321153, -0.9788405, -4.337441, 0.1568628, 1, 0, 1,
-0.5168787, -1.665634, -3.277496, 0.1529412, 1, 0, 1,
-0.5156261, -1.725586, -3.357757, 0.145098, 1, 0, 1,
-0.507894, -0.4472552, -2.538218, 0.1411765, 1, 0, 1,
-0.498666, 1.394105, -0.6196141, 0.1333333, 1, 0, 1,
-0.498253, -0.4598011, -1.926994, 0.1294118, 1, 0, 1,
-0.4974215, 0.4342771, -1.020782, 0.1215686, 1, 0, 1,
-0.4949317, 0.2346193, -3.254265, 0.1176471, 1, 0, 1,
-0.4944415, -1.532177, -4.358715, 0.1098039, 1, 0, 1,
-0.4940787, -1.04315, -1.249923, 0.1058824, 1, 0, 1,
-0.4911529, 0.3357003, -2.344306, 0.09803922, 1, 0, 1,
-0.4868867, -0.1052891, -4.508287, 0.09019608, 1, 0, 1,
-0.4840025, 1.817615, -0.6537063, 0.08627451, 1, 0, 1,
-0.4815234, -1.444444, -3.997255, 0.07843138, 1, 0, 1,
-0.4810265, 1.864081, -0.9289341, 0.07450981, 1, 0, 1,
-0.4780532, -0.6479208, -2.805588, 0.06666667, 1, 0, 1,
-0.4776785, 0.03944895, -2.692087, 0.0627451, 1, 0, 1,
-0.4773809, 1.32906, 0.513607, 0.05490196, 1, 0, 1,
-0.4740365, -0.4569659, -1.382419, 0.05098039, 1, 0, 1,
-0.4722504, 0.4635501, -0.868229, 0.04313726, 1, 0, 1,
-0.4722233, -0.5782356, -0.9161259, 0.03921569, 1, 0, 1,
-0.4716254, 0.4789552, -2.263632, 0.03137255, 1, 0, 1,
-0.4715407, 0.9158855, 0.854668, 0.02745098, 1, 0, 1,
-0.4709414, 0.5360355, 0.2273522, 0.01960784, 1, 0, 1,
-0.4682368, 3.340119, 0.5417987, 0.01568628, 1, 0, 1,
-0.463585, 0.8202557, -1.473096, 0.007843138, 1, 0, 1,
-0.462701, -1.352001, -4.218031, 0.003921569, 1, 0, 1,
-0.4599126, 0.2175159, -0.4678287, 0, 1, 0.003921569, 1,
-0.4553336, -0.3922614, -2.061167, 0, 1, 0.01176471, 1,
-0.4405614, -0.01710569, -1.224501, 0, 1, 0.01568628, 1,
-0.4362578, 1.543621, 0.006556943, 0, 1, 0.02352941, 1,
-0.4336362, 0.2778589, -1.257248, 0, 1, 0.02745098, 1,
-0.4283122, 0.05179613, -2.086367, 0, 1, 0.03529412, 1,
-0.4273212, 0.1491745, -1.208284, 0, 1, 0.03921569, 1,
-0.4262697, 0.2822562, -1.018991, 0, 1, 0.04705882, 1,
-0.4258535, 0.4829243, -1.504233, 0, 1, 0.05098039, 1,
-0.4190196, -0.7988145, -2.27249, 0, 1, 0.05882353, 1,
-0.4165798, 0.5160133, 0.6674182, 0, 1, 0.0627451, 1,
-0.411936, -0.6897364, -2.516076, 0, 1, 0.07058824, 1,
-0.4118641, 0.6454588, -2.204781, 0, 1, 0.07450981, 1,
-0.4114928, -0.5959687, -3.011389, 0, 1, 0.08235294, 1,
-0.4099029, -0.7429044, -4.114459, 0, 1, 0.08627451, 1,
-0.4065103, 1.050359, -0.5840166, 0, 1, 0.09411765, 1,
-0.4052182, -0.593604, -2.613983, 0, 1, 0.1019608, 1,
-0.4024964, -0.5065492, -2.607011, 0, 1, 0.1058824, 1,
-0.3999064, -0.3676578, -2.894352, 0, 1, 0.1137255, 1,
-0.3966605, 1.484359, -0.8852157, 0, 1, 0.1176471, 1,
-0.3963583, -0.0726046, -1.098275, 0, 1, 0.1254902, 1,
-0.3915223, 0.7188705, 1.026528, 0, 1, 0.1294118, 1,
-0.3868683, -0.3207475, -1.392605, 0, 1, 0.1372549, 1,
-0.3858854, 0.9348009, 0.4983238, 0, 1, 0.1411765, 1,
-0.3851109, -1.067703, -3.33627, 0, 1, 0.1490196, 1,
-0.3838223, 1.632609, -0.727421, 0, 1, 0.1529412, 1,
-0.3809991, -1.711526, -2.553713, 0, 1, 0.1607843, 1,
-0.3757082, -2.628006, -3.45761, 0, 1, 0.1647059, 1,
-0.3747589, 0.194749, -2.601417, 0, 1, 0.172549, 1,
-0.3731081, 0.3621363, 0.5796509, 0, 1, 0.1764706, 1,
-0.3701054, -0.01858117, -2.805032, 0, 1, 0.1843137, 1,
-0.3680126, 0.655783, -0.6869062, 0, 1, 0.1882353, 1,
-0.3542024, -0.7507666, -3.219561, 0, 1, 0.1960784, 1,
-0.3536912, 0.5682843, 0.1636361, 0, 1, 0.2039216, 1,
-0.3499247, -0.03401482, -2.37101, 0, 1, 0.2078431, 1,
-0.3465416, -1.683867, -3.07998, 0, 1, 0.2156863, 1,
-0.3448232, 0.2702634, -1.403927, 0, 1, 0.2196078, 1,
-0.3445542, -0.2598585, -1.284234, 0, 1, 0.227451, 1,
-0.3376424, -1.658247, -1.801484, 0, 1, 0.2313726, 1,
-0.3370698, 0.3820463, -1.568115, 0, 1, 0.2392157, 1,
-0.3366889, 1.703726, -0.3532362, 0, 1, 0.2431373, 1,
-0.3336857, -0.8335676, -2.958175, 0, 1, 0.2509804, 1,
-0.3335142, 1.314296, -0.2462976, 0, 1, 0.254902, 1,
-0.3321762, 2.158921, -0.2694373, 0, 1, 0.2627451, 1,
-0.3313884, -0.6882503, -2.574342, 0, 1, 0.2666667, 1,
-0.3306475, 0.8829498, -0.354223, 0, 1, 0.2745098, 1,
-0.3276296, 0.3448665, -1.36197, 0, 1, 0.2784314, 1,
-0.3234092, 0.6335241, -1.119267, 0, 1, 0.2862745, 1,
-0.3214724, 0.5708986, 0.1341543, 0, 1, 0.2901961, 1,
-0.3211122, 0.10357, -1.027184, 0, 1, 0.2980392, 1,
-0.3200282, -0.9142783, -2.422348, 0, 1, 0.3058824, 1,
-0.313791, -1.505206, -3.614288, 0, 1, 0.3098039, 1,
-0.303036, -0.8857173, -3.300477, 0, 1, 0.3176471, 1,
-0.3022699, 0.4688411, 0.9489819, 0, 1, 0.3215686, 1,
-0.3021142, -0.927765, -3.02999, 0, 1, 0.3294118, 1,
-0.3013141, 1.297303, 0.5684733, 0, 1, 0.3333333, 1,
-0.2985453, 0.4366316, -0.2535305, 0, 1, 0.3411765, 1,
-0.2983674, -0.1103088, -1.210639, 0, 1, 0.345098, 1,
-0.2899896, 0.4516747, 0.1838899, 0, 1, 0.3529412, 1,
-0.2894809, -0.2810633, -2.963019, 0, 1, 0.3568628, 1,
-0.2892251, -0.4799638, -2.899151, 0, 1, 0.3647059, 1,
-0.287414, 0.3252431, -2.13887, 0, 1, 0.3686275, 1,
-0.2872665, -1.002731, -3.080283, 0, 1, 0.3764706, 1,
-0.2773109, -0.7051033, -1.753924, 0, 1, 0.3803922, 1,
-0.2738823, -0.1406229, -2.35118, 0, 1, 0.3882353, 1,
-0.2675585, -1.411934, -2.807197, 0, 1, 0.3921569, 1,
-0.2636664, 0.6479896, -1.532741, 0, 1, 0.4, 1,
-0.259862, -1.848482, -3.261044, 0, 1, 0.4078431, 1,
-0.2562947, 1.676991, 0.2808802, 0, 1, 0.4117647, 1,
-0.2556328, -0.4408635, -1.760745, 0, 1, 0.4196078, 1,
-0.2539958, 0.06259321, -0.920041, 0, 1, 0.4235294, 1,
-0.2517906, 0.458277, -0.9600301, 0, 1, 0.4313726, 1,
-0.2501559, 1.545311, 0.6600333, 0, 1, 0.4352941, 1,
-0.2419934, 0.4570104, -0.34576, 0, 1, 0.4431373, 1,
-0.239271, 0.746255, -2.358432, 0, 1, 0.4470588, 1,
-0.2391515, 0.2301258, -0.3728807, 0, 1, 0.454902, 1,
-0.2381572, 0.8324404, -0.3199538, 0, 1, 0.4588235, 1,
-0.2326564, -0.72093, -4.133405, 0, 1, 0.4666667, 1,
-0.2316638, -0.1753034, -1.653204, 0, 1, 0.4705882, 1,
-0.2266824, -0.179998, -1.818154, 0, 1, 0.4784314, 1,
-0.2227155, -1.485564, -2.990148, 0, 1, 0.4823529, 1,
-0.2209023, 0.5649471, -0.5505129, 0, 1, 0.4901961, 1,
-0.2202634, 1.660426, -1.162964, 0, 1, 0.4941176, 1,
-0.2169182, 0.3070332, -0.7355664, 0, 1, 0.5019608, 1,
-0.210252, 0.3729455, 0.4281485, 0, 1, 0.509804, 1,
-0.2071185, 1.453143, 0.7823886, 0, 1, 0.5137255, 1,
-0.203305, 0.7380321, -0.4607085, 0, 1, 0.5215687, 1,
-0.2018164, 0.2821563, 0.06666316, 0, 1, 0.5254902, 1,
-0.1987982, -0.5072401, -2.381512, 0, 1, 0.5333334, 1,
-0.1958839, 0.5302436, -3.400663, 0, 1, 0.5372549, 1,
-0.1943821, -1.748369, -3.71963, 0, 1, 0.5450981, 1,
-0.1926784, -1.798207, -2.222306, 0, 1, 0.5490196, 1,
-0.1910911, -0.9300138, -3.021193, 0, 1, 0.5568628, 1,
-0.1888482, 0.5598421, -1.002538, 0, 1, 0.5607843, 1,
-0.1848963, 0.316845, 1.09324, 0, 1, 0.5686275, 1,
-0.1776796, -0.6149372, -4.932042, 0, 1, 0.572549, 1,
-0.1774867, 0.1913051, -2.341005, 0, 1, 0.5803922, 1,
-0.176241, 0.7038097, -0.5058136, 0, 1, 0.5843138, 1,
-0.1734247, -1.029128, -3.357267, 0, 1, 0.5921569, 1,
-0.1621164, 0.2164706, -0.6191918, 0, 1, 0.5960785, 1,
-0.1617423, -0.2208088, -3.771069, 0, 1, 0.6039216, 1,
-0.1544741, -0.2021583, -4.958927, 0, 1, 0.6117647, 1,
-0.1541506, -0.6877931, -3.982179, 0, 1, 0.6156863, 1,
-0.1538432, 0.09617976, -3.202107, 0, 1, 0.6235294, 1,
-0.1522396, -0.3285438, -2.056802, 0, 1, 0.627451, 1,
-0.1511835, 0.105063, -1.206923, 0, 1, 0.6352941, 1,
-0.1439016, -0.3521052, -4.229015, 0, 1, 0.6392157, 1,
-0.1355866, -0.1146214, -2.921283, 0, 1, 0.6470588, 1,
-0.1301704, -2.282887, -3.003983, 0, 1, 0.6509804, 1,
-0.1274253, -0.05845742, -2.050576, 0, 1, 0.6588235, 1,
-0.1223184, -0.83208, -3.2472, 0, 1, 0.6627451, 1,
-0.1203152, -0.3125582, -5.760735, 0, 1, 0.6705883, 1,
-0.1202435, -1.797806, -2.227415, 0, 1, 0.6745098, 1,
-0.1195566, 0.549363, 0.2121635, 0, 1, 0.682353, 1,
-0.1162177, -0.5265022, -1.595834, 0, 1, 0.6862745, 1,
-0.1087802, 1.060777, -0.02640898, 0, 1, 0.6941177, 1,
-0.106232, -0.05496391, -5.180169, 0, 1, 0.7019608, 1,
-0.1051314, -1.641101, -1.987196, 0, 1, 0.7058824, 1,
-0.1036914, -2.101063, -1.754477, 0, 1, 0.7137255, 1,
-0.0995442, 0.5912083, -0.616727, 0, 1, 0.7176471, 1,
-0.09615073, 1.298532, 0.08969484, 0, 1, 0.7254902, 1,
-0.09492691, -0.4314968, -3.530064, 0, 1, 0.7294118, 1,
-0.09461831, 0.818683, -1.393765, 0, 1, 0.7372549, 1,
-0.09340148, 0.119448, -1.034662, 0, 1, 0.7411765, 1,
-0.09275033, -0.05270955, -0.7840011, 0, 1, 0.7490196, 1,
-0.08927089, 0.2807174, -0.6482397, 0, 1, 0.7529412, 1,
-0.08901335, 1.448681, 0.3743688, 0, 1, 0.7607843, 1,
-0.0834927, -0.3819081, -1.47222, 0, 1, 0.7647059, 1,
-0.08201556, -0.7799523, -2.247195, 0, 1, 0.772549, 1,
-0.07831506, -0.7519798, -2.57268, 0, 1, 0.7764706, 1,
-0.07680656, -0.5390218, -3.185191, 0, 1, 0.7843137, 1,
-0.07262149, 1.228972, -0.1611347, 0, 1, 0.7882353, 1,
-0.06312378, 1.889458, -1.660325, 0, 1, 0.7960784, 1,
-0.06275935, -0.5684731, -3.48892, 0, 1, 0.8039216, 1,
-0.06065753, -1.692295, -2.765182, 0, 1, 0.8078431, 1,
-0.0603413, 1.165095, -1.580724, 0, 1, 0.8156863, 1,
-0.05984579, 0.8394623, 0.354429, 0, 1, 0.8196079, 1,
-0.05867771, -0.3927662, -1.466195, 0, 1, 0.827451, 1,
-0.0585469, -1.034983, -1.694688, 0, 1, 0.8313726, 1,
-0.05846141, -1.787753, -3.216789, 0, 1, 0.8392157, 1,
-0.05596922, -0.02953046, -2.572987, 0, 1, 0.8431373, 1,
-0.05488747, 0.8267501, 0.7241951, 0, 1, 0.8509804, 1,
-0.05466888, 1.396591, -1.924075, 0, 1, 0.854902, 1,
-0.05452132, -0.3879553, -1.737473, 0, 1, 0.8627451, 1,
-0.05418891, 0.08888002, -1.50492, 0, 1, 0.8666667, 1,
-0.04235056, -0.04987068, -2.16088, 0, 1, 0.8745098, 1,
-0.04086433, 0.7772598, -0.5817916, 0, 1, 0.8784314, 1,
-0.03769562, 0.2523397, -0.934698, 0, 1, 0.8862745, 1,
-0.03726523, 0.5213503, 0.02696197, 0, 1, 0.8901961, 1,
-0.03597314, 1.741026, -0.4020248, 0, 1, 0.8980392, 1,
-0.0344043, -1.432478, -4.521576, 0, 1, 0.9058824, 1,
-0.03105609, 0.04963285, 0.6714197, 0, 1, 0.9098039, 1,
-0.02924574, 1.716004, -0.280872, 0, 1, 0.9176471, 1,
-0.0288638, -0.8775998, -1.425047, 0, 1, 0.9215686, 1,
-0.02526984, -2.90074, -2.399406, 0, 1, 0.9294118, 1,
-0.02308001, -0.2483957, -1.150997, 0, 1, 0.9333333, 1,
-0.01951028, -0.3486497, -3.086744, 0, 1, 0.9411765, 1,
-0.01670097, 1.29672, 0.8451527, 0, 1, 0.945098, 1,
-0.01541431, 0.1461151, 0.9345018, 0, 1, 0.9529412, 1,
-0.01119659, -1.043872, -2.514865, 0, 1, 0.9568627, 1,
-0.00724022, 0.5165899, -0.1769876, 0, 1, 0.9647059, 1,
-0.005751179, 1.145272, 0.3182782, 0, 1, 0.9686275, 1,
-0.004994731, -0.3676666, -3.951062, 0, 1, 0.9764706, 1,
-0.00131091, -1.685771, -3.528949, 0, 1, 0.9803922, 1,
-0.001262273, -1.711777, -4.801692, 0, 1, 0.9882353, 1,
0.006472414, -0.006942199, 1.501739, 0, 1, 0.9921569, 1,
0.007896701, -1.534742, 1.266178, 0, 1, 1, 1,
0.008186807, 0.5578207, -1.344022, 0, 0.9921569, 1, 1,
0.01322965, 0.0315474, -0.08581965, 0, 0.9882353, 1, 1,
0.01522229, 1.404731, 0.9526072, 0, 0.9803922, 1, 1,
0.01699803, 2.104291, -0.6453634, 0, 0.9764706, 1, 1,
0.01735255, -1.234698, 4.270636, 0, 0.9686275, 1, 1,
0.01797485, 1.611547, -0.3608761, 0, 0.9647059, 1, 1,
0.01833277, -0.7507028, 3.365776, 0, 0.9568627, 1, 1,
0.0220889, 0.2934569, 0.1222478, 0, 0.9529412, 1, 1,
0.02576072, 1.391959, -0.8505288, 0, 0.945098, 1, 1,
0.0296677, -1.45422, 2.889107, 0, 0.9411765, 1, 1,
0.03028115, -0.1196317, 1.203984, 0, 0.9333333, 1, 1,
0.03485073, 0.8328803, -0.7250596, 0, 0.9294118, 1, 1,
0.0507609, -0.131381, 3.377726, 0, 0.9215686, 1, 1,
0.05363863, 0.1428431, -0.2289716, 0, 0.9176471, 1, 1,
0.05554583, 0.3034929, 0.9405813, 0, 0.9098039, 1, 1,
0.05566704, 1.040936, 0.8679204, 0, 0.9058824, 1, 1,
0.06234209, -0.7091697, 4.472675, 0, 0.8980392, 1, 1,
0.0635874, -1.489795, 2.855733, 0, 0.8901961, 1, 1,
0.06363718, 0.3972841, -0.05984318, 0, 0.8862745, 1, 1,
0.06670059, 0.527684, -0.1750778, 0, 0.8784314, 1, 1,
0.06686426, 1.351498, -1.106322, 0, 0.8745098, 1, 1,
0.06720342, -1.517849, 3.832743, 0, 0.8666667, 1, 1,
0.06722464, -0.5499342, 3.558212, 0, 0.8627451, 1, 1,
0.0729655, 0.6271472, -0.9268459, 0, 0.854902, 1, 1,
0.07451389, 0.02776744, -1.731199, 0, 0.8509804, 1, 1,
0.07978387, -1.794196, 4.281915, 0, 0.8431373, 1, 1,
0.08159192, 0.6714755, -0.2312448, 0, 0.8392157, 1, 1,
0.0836625, 0.08976883, -0.4777278, 0, 0.8313726, 1, 1,
0.08415964, 0.6684148, -0.825321, 0, 0.827451, 1, 1,
0.0940111, -1.310167, 3.969001, 0, 0.8196079, 1, 1,
0.09645243, 1.163349, -1.004364, 0, 0.8156863, 1, 1,
0.1010771, 1.460066, 2.4509, 0, 0.8078431, 1, 1,
0.1061134, 0.6462988, 0.717488, 0, 0.8039216, 1, 1,
0.1072939, 0.3332873, -1.62014, 0, 0.7960784, 1, 1,
0.1073756, 0.5286371, 0.4473502, 0, 0.7882353, 1, 1,
0.1122095, -0.1897977, 4.065566, 0, 0.7843137, 1, 1,
0.1123632, -0.9613382, 2.149067, 0, 0.7764706, 1, 1,
0.1216793, 0.4222378, 0.5044205, 0, 0.772549, 1, 1,
0.1242266, 0.1907042, 1.508895, 0, 0.7647059, 1, 1,
0.1259243, -0.9626573, 4.026102, 0, 0.7607843, 1, 1,
0.1269158, -0.5535699, 2.987948, 0, 0.7529412, 1, 1,
0.1296917, -1.964742, 4.945511, 0, 0.7490196, 1, 1,
0.1344303, 0.613653, -0.4390281, 0, 0.7411765, 1, 1,
0.1360533, 1.947763, -0.332643, 0, 0.7372549, 1, 1,
0.139515, 0.3336872, 0.01747648, 0, 0.7294118, 1, 1,
0.1402071, -0.1076519, 3.42372, 0, 0.7254902, 1, 1,
0.1469149, 0.4078943, 0.1453551, 0, 0.7176471, 1, 1,
0.1482199, 1.513208, -0.5856509, 0, 0.7137255, 1, 1,
0.1487512, 0.4576959, 0.156521, 0, 0.7058824, 1, 1,
0.1574211, 0.8907976, 1.058774, 0, 0.6980392, 1, 1,
0.1602536, 0.6168924, -1.288391, 0, 0.6941177, 1, 1,
0.1608177, 0.3682535, 1.352482, 0, 0.6862745, 1, 1,
0.1609175, -2.030525, 4.33328, 0, 0.682353, 1, 1,
0.1654763, -1.804468, 4.056252, 0, 0.6745098, 1, 1,
0.1689335, 1.092383, -1.679582, 0, 0.6705883, 1, 1,
0.1697564, 0.01202912, -0.5692943, 0, 0.6627451, 1, 1,
0.1698946, 0.2398415, 1.030509, 0, 0.6588235, 1, 1,
0.1746136, -1.233164, 2.205708, 0, 0.6509804, 1, 1,
0.1770802, -0.03953918, 2.282639, 0, 0.6470588, 1, 1,
0.1807518, 0.7778831, 2.394602, 0, 0.6392157, 1, 1,
0.1852794, -1.869689, 2.463053, 0, 0.6352941, 1, 1,
0.1876056, 0.3189984, 0.2477349, 0, 0.627451, 1, 1,
0.1920057, 0.4483728, -0.2441505, 0, 0.6235294, 1, 1,
0.1940153, 1.870764, -1.401744, 0, 0.6156863, 1, 1,
0.1971104, -2.537482, 4.31759, 0, 0.6117647, 1, 1,
0.2033408, 0.6558099, -0.1721925, 0, 0.6039216, 1, 1,
0.2040326, 1.236549, -0.590963, 0, 0.5960785, 1, 1,
0.2046804, 2.914584, 0.3574996, 0, 0.5921569, 1, 1,
0.2050394, -0.03309941, 2.361291, 0, 0.5843138, 1, 1,
0.2107109, -1.269554, 3.620547, 0, 0.5803922, 1, 1,
0.2159373, -1.070966, 2.836929, 0, 0.572549, 1, 1,
0.216897, 0.8643201, 1.829597, 0, 0.5686275, 1, 1,
0.21731, -1.542497, 1.844432, 0, 0.5607843, 1, 1,
0.2200248, 0.823137, 2.3918, 0, 0.5568628, 1, 1,
0.2212355, -1.121536, 3.487112, 0, 0.5490196, 1, 1,
0.221756, -0.6092999, 2.675372, 0, 0.5450981, 1, 1,
0.2217686, 0.4850529, -0.529956, 0, 0.5372549, 1, 1,
0.2243121, -0.4666504, 2.85732, 0, 0.5333334, 1, 1,
0.2265232, -1.703924, 3.720511, 0, 0.5254902, 1, 1,
0.2274967, -0.4037331, 3.380138, 0, 0.5215687, 1, 1,
0.2275819, 0.8100073, 1.315187, 0, 0.5137255, 1, 1,
0.2283404, 1.630119, 2.296506, 0, 0.509804, 1, 1,
0.2292625, -0.7652339, 2.218986, 0, 0.5019608, 1, 1,
0.2293776, 0.2991589, 0.05259253, 0, 0.4941176, 1, 1,
0.2295285, -0.9213536, 2.297092, 0, 0.4901961, 1, 1,
0.2300791, -1.640532, 2.799012, 0, 0.4823529, 1, 1,
0.2305656, -0.793631, 1.592156, 0, 0.4784314, 1, 1,
0.2328064, -1.540568, 3.605343, 0, 0.4705882, 1, 1,
0.2344593, -0.6340007, 3.052607, 0, 0.4666667, 1, 1,
0.2347293, -0.8514058, 4.420875, 0, 0.4588235, 1, 1,
0.2401939, 0.4852055, -0.5300266, 0, 0.454902, 1, 1,
0.2406805, 0.2417578, 0.9009068, 0, 0.4470588, 1, 1,
0.242438, 0.7519087, -0.08589256, 0, 0.4431373, 1, 1,
0.2502775, 0.408114, 0.001996481, 0, 0.4352941, 1, 1,
0.2524664, 0.9377612, -0.4449795, 0, 0.4313726, 1, 1,
0.2549656, -0.6682475, 2.86825, 0, 0.4235294, 1, 1,
0.2557051, -0.8855943, 0.8424523, 0, 0.4196078, 1, 1,
0.2596851, -1.702464, 2.933971, 0, 0.4117647, 1, 1,
0.2596959, 0.9153185, 0.4088182, 0, 0.4078431, 1, 1,
0.2618438, 0.7374533, 0.3331414, 0, 0.4, 1, 1,
0.2619123, -1.25741, 0.3295574, 0, 0.3921569, 1, 1,
0.2640981, -1.268446, 3.261934, 0, 0.3882353, 1, 1,
0.2677139, -1.788165, 3.413791, 0, 0.3803922, 1, 1,
0.2687639, 0.7354378, 1.363384, 0, 0.3764706, 1, 1,
0.2706147, 1.027959, -0.2175517, 0, 0.3686275, 1, 1,
0.2710343, -0.02252454, 2.214267, 0, 0.3647059, 1, 1,
0.2751008, 0.121099, 0.6056887, 0, 0.3568628, 1, 1,
0.2772175, -0.3182789, 1.198649, 0, 0.3529412, 1, 1,
0.2813769, -0.4489732, 2.149777, 0, 0.345098, 1, 1,
0.2846128, -0.5440291, 2.001666, 0, 0.3411765, 1, 1,
0.2877639, -1.468181, 2.84759, 0, 0.3333333, 1, 1,
0.2997723, -0.4507644, 2.461143, 0, 0.3294118, 1, 1,
0.3006064, 0.8223381, 0.4402684, 0, 0.3215686, 1, 1,
0.3024763, -0.7621011, 2.538305, 0, 0.3176471, 1, 1,
0.3062499, -0.3493515, 2.64831, 0, 0.3098039, 1, 1,
0.3078928, -1.203755, 3.862878, 0, 0.3058824, 1, 1,
0.310204, -0.6577018, 3.259591, 0, 0.2980392, 1, 1,
0.3139115, -0.4565767, 3.592021, 0, 0.2901961, 1, 1,
0.3194936, 0.8871939, 0.878587, 0, 0.2862745, 1, 1,
0.3219364, 0.8118407, 0.5276002, 0, 0.2784314, 1, 1,
0.3283946, -0.2418541, 4.490685, 0, 0.2745098, 1, 1,
0.3307262, -0.6230139, 3.699357, 0, 0.2666667, 1, 1,
0.3377952, 1.622727, -0.6888768, 0, 0.2627451, 1, 1,
0.3395758, -2.072464, 2.412691, 0, 0.254902, 1, 1,
0.340404, -0.2910292, 2.204013, 0, 0.2509804, 1, 1,
0.3458209, 0.2232994, 1.510635, 0, 0.2431373, 1, 1,
0.3485097, 0.1678343, 3.407029, 0, 0.2392157, 1, 1,
0.3486989, -1.144351, 3.140379, 0, 0.2313726, 1, 1,
0.3490274, 0.9243872, 1.32249, 0, 0.227451, 1, 1,
0.3493558, -1.382612, 2.321629, 0, 0.2196078, 1, 1,
0.3520632, 1.457904, 0.0209571, 0, 0.2156863, 1, 1,
0.3528318, 0.8884779, 0.88955, 0, 0.2078431, 1, 1,
0.3583906, 0.08127365, -0.238373, 0, 0.2039216, 1, 1,
0.3593546, -0.04757774, 1.550124, 0, 0.1960784, 1, 1,
0.3599642, 0.7290037, 0.8433033, 0, 0.1882353, 1, 1,
0.3602783, 0.1734753, -0.07259765, 0, 0.1843137, 1, 1,
0.3627078, 0.02860886, 2.416197, 0, 0.1764706, 1, 1,
0.3630377, -1.737129, 2.029159, 0, 0.172549, 1, 1,
0.3652364, -0.4085455, 2.669821, 0, 0.1647059, 1, 1,
0.3658544, 0.1294504, -0.02510001, 0, 0.1607843, 1, 1,
0.366041, 0.3885673, -0.2289175, 0, 0.1529412, 1, 1,
0.3660747, -0.3871947, 2.947137, 0, 0.1490196, 1, 1,
0.3671803, 2.130105, -0.5149233, 0, 0.1411765, 1, 1,
0.371243, -0.4114082, 3.408013, 0, 0.1372549, 1, 1,
0.3747008, -0.224807, 3.238481, 0, 0.1294118, 1, 1,
0.3815935, 0.7925256, 1.498184, 0, 0.1254902, 1, 1,
0.3818608, -1.061476, 3.561364, 0, 0.1176471, 1, 1,
0.3831119, -0.1999768, 1.376567, 0, 0.1137255, 1, 1,
0.3854144, -1.895557, 2.948477, 0, 0.1058824, 1, 1,
0.385769, -1.078722, 1.492012, 0, 0.09803922, 1, 1,
0.3873432, -0.4727049, 2.840053, 0, 0.09411765, 1, 1,
0.3891872, 1.327868, -0.01354985, 0, 0.08627451, 1, 1,
0.4012346, -0.2073981, 5.631453, 0, 0.08235294, 1, 1,
0.4020363, -1.994087, 2.236005, 0, 0.07450981, 1, 1,
0.403119, -0.1147327, 3.334006, 0, 0.07058824, 1, 1,
0.4033438, 0.3191451, 0.0963027, 0, 0.0627451, 1, 1,
0.4042784, -0.08504748, 0.9570978, 0, 0.05882353, 1, 1,
0.4043608, 1.620516, -0.7038423, 0, 0.05098039, 1, 1,
0.4069403, 1.246908, -0.5962818, 0, 0.04705882, 1, 1,
0.4137112, 0.6711577, -0.4621, 0, 0.03921569, 1, 1,
0.4137583, 0.6624956, 0.8407586, 0, 0.03529412, 1, 1,
0.4140451, -1.775918, 2.458611, 0, 0.02745098, 1, 1,
0.4146365, 0.2933283, -0.1580495, 0, 0.02352941, 1, 1,
0.4149698, -0.0414427, 1.636877, 0, 0.01568628, 1, 1,
0.4200424, -0.2912504, 3.348379, 0, 0.01176471, 1, 1,
0.4227193, -0.9587464, 3.783211, 0, 0.003921569, 1, 1,
0.4244908, -0.02117457, 0.7070031, 0.003921569, 0, 1, 1,
0.4260951, -0.03746679, 3.584235, 0.007843138, 0, 1, 1,
0.426304, -0.1396274, 2.218676, 0.01568628, 0, 1, 1,
0.4311984, -0.4176719, 1.839351, 0.01960784, 0, 1, 1,
0.4318942, -2.199441, 2.979786, 0.02745098, 0, 1, 1,
0.4343978, 1.507508, 2.291108, 0.03137255, 0, 1, 1,
0.4361565, 2.07379, -0.1413222, 0.03921569, 0, 1, 1,
0.4407777, -0.02803706, 2.669926, 0.04313726, 0, 1, 1,
0.4416427, -1.768602, 2.829924, 0.05098039, 0, 1, 1,
0.4431247, -0.9837344, 2.413517, 0.05490196, 0, 1, 1,
0.4433525, 2.381978, -1.117994, 0.0627451, 0, 1, 1,
0.4440066, 1.800066, -0.3673747, 0.06666667, 0, 1, 1,
0.4485702, -0.4638695, 1.849453, 0.07450981, 0, 1, 1,
0.448763, -0.6267495, 1.219183, 0.07843138, 0, 1, 1,
0.4531464, 2.49427, 0.7348925, 0.08627451, 0, 1, 1,
0.4568785, -0.3324686, 0.9331553, 0.09019608, 0, 1, 1,
0.4569786, 0.4970747, -0.3534603, 0.09803922, 0, 1, 1,
0.4592569, -0.4856566, 5.40378, 0.1058824, 0, 1, 1,
0.4624836, 0.3916, 1.389671, 0.1098039, 0, 1, 1,
0.4658365, 0.3163027, 2.72675, 0.1176471, 0, 1, 1,
0.4665402, 0.357391, 1.954541, 0.1215686, 0, 1, 1,
0.4681609, 0.8084329, -2.40683, 0.1294118, 0, 1, 1,
0.471305, 0.5883267, -0.5899978, 0.1333333, 0, 1, 1,
0.4753715, 0.8583588, -0.03199612, 0.1411765, 0, 1, 1,
0.4810768, 1.758895, -1.571574, 0.145098, 0, 1, 1,
0.4815728, -0.9047092, 1.421349, 0.1529412, 0, 1, 1,
0.4837435, -1.953547, 3.09737, 0.1568628, 0, 1, 1,
0.4912968, 0.8231547, 1.439195, 0.1647059, 0, 1, 1,
0.4935304, -0.1050207, 1.495156, 0.1686275, 0, 1, 1,
0.4956801, 1.522981, 0.1600799, 0.1764706, 0, 1, 1,
0.4961758, 1.340646, 1.425046, 0.1803922, 0, 1, 1,
0.49817, -1.298653, 1.928504, 0.1882353, 0, 1, 1,
0.4983649, -0.9252568, 2.658346, 0.1921569, 0, 1, 1,
0.4998233, 0.6121181, -0.09625063, 0.2, 0, 1, 1,
0.5027939, 1.243618, -2.651122, 0.2078431, 0, 1, 1,
0.5094345, 0.4677621, 1.009082, 0.2117647, 0, 1, 1,
0.5101919, 1.0692, 1.400814, 0.2196078, 0, 1, 1,
0.5135419, -0.8627233, 3.155165, 0.2235294, 0, 1, 1,
0.5224989, 1.052385, -0.3776044, 0.2313726, 0, 1, 1,
0.5231394, -1.475021, 1.3834, 0.2352941, 0, 1, 1,
0.5235111, -0.2412437, 0.5674655, 0.2431373, 0, 1, 1,
0.5244617, 2.067358, -0.4806715, 0.2470588, 0, 1, 1,
0.5252871, 1.351359, -0.4534438, 0.254902, 0, 1, 1,
0.5288137, -0.4847017, 1.227661, 0.2588235, 0, 1, 1,
0.5327719, -2.257632, 2.692376, 0.2666667, 0, 1, 1,
0.543403, -1.69694, 3.111956, 0.2705882, 0, 1, 1,
0.5474746, 0.1452772, 2.210108, 0.2784314, 0, 1, 1,
0.5567368, -0.5217864, 3.32952, 0.282353, 0, 1, 1,
0.5570235, -0.6636181, 1.996632, 0.2901961, 0, 1, 1,
0.5582188, -0.7344084, 0.3572215, 0.2941177, 0, 1, 1,
0.5597115, -0.3022672, 2.135268, 0.3019608, 0, 1, 1,
0.5634357, 0.002664793, 0.5274369, 0.3098039, 0, 1, 1,
0.5663021, 1.19236, 0.06859575, 0.3137255, 0, 1, 1,
0.5664862, -0.7737974, 3.471483, 0.3215686, 0, 1, 1,
0.5687253, 1.601695, 0.136854, 0.3254902, 0, 1, 1,
0.5735112, -0.01334262, 2.11514, 0.3333333, 0, 1, 1,
0.5781782, -1.674006, 2.504991, 0.3372549, 0, 1, 1,
0.5787912, -0.4841984, 2.580787, 0.345098, 0, 1, 1,
0.5799354, -1.134732, 2.138657, 0.3490196, 0, 1, 1,
0.5800683, -2.274533, 3.518445, 0.3568628, 0, 1, 1,
0.5806344, 0.408549, -0.1241871, 0.3607843, 0, 1, 1,
0.5833664, -0.2063921, 1.854072, 0.3686275, 0, 1, 1,
0.5921111, 0.8490517, 0.5178031, 0.372549, 0, 1, 1,
0.5929378, 0.7767982, 1.228915, 0.3803922, 0, 1, 1,
0.5976449, -0.9464369, 3.343759, 0.3843137, 0, 1, 1,
0.5979545, -0.1968393, 2.378087, 0.3921569, 0, 1, 1,
0.6006064, 0.7654721, 2.492426, 0.3960784, 0, 1, 1,
0.6012346, -1.568253, 1.243937, 0.4039216, 0, 1, 1,
0.604264, 0.02897613, 0.8724865, 0.4117647, 0, 1, 1,
0.6045934, 1.00637, 1.125332, 0.4156863, 0, 1, 1,
0.6061628, 0.486182, 2.730268, 0.4235294, 0, 1, 1,
0.6063862, -0.3926514, 2.09943, 0.427451, 0, 1, 1,
0.6064264, 0.4238291, -1.003722, 0.4352941, 0, 1, 1,
0.6085727, 0.08504628, 0.2412518, 0.4392157, 0, 1, 1,
0.6110698, -0.04230862, 2.749369, 0.4470588, 0, 1, 1,
0.6151465, 0.9602482, 0.8430902, 0.4509804, 0, 1, 1,
0.6155808, 0.8486883, 2.434853, 0.4588235, 0, 1, 1,
0.6158, 0.5620555, 1.640766, 0.4627451, 0, 1, 1,
0.6193275, -0.5682178, 3.401495, 0.4705882, 0, 1, 1,
0.6223675, -0.3958076, 2.780088, 0.4745098, 0, 1, 1,
0.6237859, 0.8341454, -0.1006968, 0.4823529, 0, 1, 1,
0.6282401, 0.727761, 1.345344, 0.4862745, 0, 1, 1,
0.6288171, -0.09712549, 2.23987, 0.4941176, 0, 1, 1,
0.6305658, 0.8514292, 1.01845, 0.5019608, 0, 1, 1,
0.631575, -0.1850626, 3.234744, 0.5058824, 0, 1, 1,
0.6351319, 0.962783, 1.300064, 0.5137255, 0, 1, 1,
0.6354219, -0.1360557, 3.707307, 0.5176471, 0, 1, 1,
0.6381108, -1.22366, 4.149319, 0.5254902, 0, 1, 1,
0.6404554, 0.2873293, -0.1288074, 0.5294118, 0, 1, 1,
0.6651556, -0.292889, 2.6952, 0.5372549, 0, 1, 1,
0.6679066, -1.067115, 2.167337, 0.5411765, 0, 1, 1,
0.6734176, 0.2454609, 0.9228599, 0.5490196, 0, 1, 1,
0.6818151, -0.3162161, 2.378806, 0.5529412, 0, 1, 1,
0.6826803, 1.318608, -0.1771775, 0.5607843, 0, 1, 1,
0.6853393, 1.30065, -0.6914178, 0.5647059, 0, 1, 1,
0.6909524, -1.154228, 1.225898, 0.572549, 0, 1, 1,
0.6946537, 0.2929758, 2.034652, 0.5764706, 0, 1, 1,
0.6950982, -1.408349, 0.9357629, 0.5843138, 0, 1, 1,
0.6990672, 0.00942009, 2.815255, 0.5882353, 0, 1, 1,
0.709244, -1.822477, 1.849223, 0.5960785, 0, 1, 1,
0.7121077, 1.658916, 0.255892, 0.6039216, 0, 1, 1,
0.7136648, 0.7475761, 0.8197237, 0.6078432, 0, 1, 1,
0.7137647, -0.5535796, 1.700275, 0.6156863, 0, 1, 1,
0.7211692, 0.1276374, 1.583437, 0.6196079, 0, 1, 1,
0.7257765, 1.093317, 1.318457, 0.627451, 0, 1, 1,
0.7323126, 0.7067431, 2.596336, 0.6313726, 0, 1, 1,
0.735357, 0.9831881, 0.2031767, 0.6392157, 0, 1, 1,
0.7354337, 0.2112376, 0.09959219, 0.6431373, 0, 1, 1,
0.7375537, 0.9047957, 0.2925072, 0.6509804, 0, 1, 1,
0.7481343, -0.2608978, 1.704708, 0.654902, 0, 1, 1,
0.74872, -0.8067566, 1.242414, 0.6627451, 0, 1, 1,
0.7504652, -0.2319261, 2.360522, 0.6666667, 0, 1, 1,
0.752704, 0.4382522, 0.5286699, 0.6745098, 0, 1, 1,
0.7617506, 0.6549795, 2.049782, 0.6784314, 0, 1, 1,
0.7630234, 0.09619591, -0.8361857, 0.6862745, 0, 1, 1,
0.7640859, 0.2246939, 1.891915, 0.6901961, 0, 1, 1,
0.7755046, 1.109674, 0.5718352, 0.6980392, 0, 1, 1,
0.7756602, 0.6462238, 1.549521, 0.7058824, 0, 1, 1,
0.7771258, 0.07511757, 2.329656, 0.7098039, 0, 1, 1,
0.779647, 0.9280283, -1.917738, 0.7176471, 0, 1, 1,
0.7815413, -0.9191922, 2.210509, 0.7215686, 0, 1, 1,
0.7823557, 1.566414, 1.448024, 0.7294118, 0, 1, 1,
0.7827884, -1.270648, 2.319891, 0.7333333, 0, 1, 1,
0.7868247, 0.9101426, 0.9461756, 0.7411765, 0, 1, 1,
0.7922422, 0.1650964, 2.444421, 0.7450981, 0, 1, 1,
0.7933439, 0.8627116, -1.038516, 0.7529412, 0, 1, 1,
0.7970597, 1.313975, -1.372371, 0.7568628, 0, 1, 1,
0.7974533, 0.02752695, 2.797499, 0.7647059, 0, 1, 1,
0.800975, -0.6662887, 2.29453, 0.7686275, 0, 1, 1,
0.8110839, 0.215258, 0.2218962, 0.7764706, 0, 1, 1,
0.8126417, 1.809989, -0.2184134, 0.7803922, 0, 1, 1,
0.8129, 0.4182564, 1.471233, 0.7882353, 0, 1, 1,
0.8195939, -1.362354, 1.958093, 0.7921569, 0, 1, 1,
0.8238748, -1.380703, 3.363302, 0.8, 0, 1, 1,
0.8254531, -0.9650258, 3.303698, 0.8078431, 0, 1, 1,
0.8299552, 0.1020301, 1.581467, 0.8117647, 0, 1, 1,
0.8393326, 0.3247901, 2.245132, 0.8196079, 0, 1, 1,
0.846984, -0.4050355, -0.6685109, 0.8235294, 0, 1, 1,
0.8487197, -0.3446237, 2.192476, 0.8313726, 0, 1, 1,
0.8587998, -0.5042303, 3.239377, 0.8352941, 0, 1, 1,
0.8609392, 0.956202, -0.1802272, 0.8431373, 0, 1, 1,
0.8669467, 1.860862, -0.3462497, 0.8470588, 0, 1, 1,
0.8696772, 0.3363511, 0.6056608, 0.854902, 0, 1, 1,
0.870821, 0.3572314, -0.02620268, 0.8588235, 0, 1, 1,
0.8745857, 1.277333, 2.100367, 0.8666667, 0, 1, 1,
0.8854398, 0.05151222, -0.04278823, 0.8705882, 0, 1, 1,
0.8864056, 0.7217611, 2.111616, 0.8784314, 0, 1, 1,
0.8909491, 0.5367566, 1.068202, 0.8823529, 0, 1, 1,
0.8921252, 0.3418776, 0.07528142, 0.8901961, 0, 1, 1,
0.8945246, 0.8691798, 2.145072, 0.8941177, 0, 1, 1,
0.9002889, 0.4234941, 2.031773, 0.9019608, 0, 1, 1,
0.9047231, 0.1561801, 0.236823, 0.9098039, 0, 1, 1,
0.9050283, 1.125416, 0.7193228, 0.9137255, 0, 1, 1,
0.907176, 0.4375957, 1.199047, 0.9215686, 0, 1, 1,
0.9108582, 1.302246, -0.6916401, 0.9254902, 0, 1, 1,
0.9164378, 0.4902671, -0.2483591, 0.9333333, 0, 1, 1,
0.917931, -0.9552666, 2.932496, 0.9372549, 0, 1, 1,
0.9217435, 1.453142, 1.174773, 0.945098, 0, 1, 1,
0.9282036, 1.104359, -0.2067844, 0.9490196, 0, 1, 1,
0.9310328, -0.2410524, 1.532668, 0.9568627, 0, 1, 1,
0.9314447, -1.163897, 2.97336, 0.9607843, 0, 1, 1,
0.9341403, -0.4058673, 2.486902, 0.9686275, 0, 1, 1,
0.9433383, 1.149554, 0.5157433, 0.972549, 0, 1, 1,
0.946654, -0.3539863, 2.508673, 0.9803922, 0, 1, 1,
0.9503993, 0.00335921, 2.535675, 0.9843137, 0, 1, 1,
0.9520374, 0.6545469, 1.801943, 0.9921569, 0, 1, 1,
0.9567003, 0.08459844, 0.9341349, 0.9960784, 0, 1, 1,
0.9603385, -0.2774205, 2.240333, 1, 0, 0.9960784, 1,
0.9608929, 0.6510637, 1.428575, 1, 0, 0.9882353, 1,
0.9679263, 0.5566791, 0.8661417, 1, 0, 0.9843137, 1,
0.9808848, 1.371329, 0.1230683, 1, 0, 0.9764706, 1,
0.985389, -1.675712, 2.747303, 1, 0, 0.972549, 1,
0.9859587, 1.834667, 1.021223, 1, 0, 0.9647059, 1,
0.9871417, -1.038199, 3.40877, 1, 0, 0.9607843, 1,
0.9882016, 2.046371, -0.4456381, 1, 0, 0.9529412, 1,
0.9891278, -0.7922452, 2.59156, 1, 0, 0.9490196, 1,
0.9941333, 0.2056029, 1.085449, 1, 0, 0.9411765, 1,
1.007256, -0.2580788, 0.8912116, 1, 0, 0.9372549, 1,
1.010588, -1.324506, 1.908676, 1, 0, 0.9294118, 1,
1.019706, 0.9011922, -0.3029734, 1, 0, 0.9254902, 1,
1.02084, 0.6439547, -1.3207, 1, 0, 0.9176471, 1,
1.024179, -1.009552, 0.9714308, 1, 0, 0.9137255, 1,
1.036254, 0.6609934, 0.09552013, 1, 0, 0.9058824, 1,
1.037105, 0.502272, 1.657823, 1, 0, 0.9019608, 1,
1.042625, -0.3852266, 3.695642, 1, 0, 0.8941177, 1,
1.058747, 0.4311323, 0.8353879, 1, 0, 0.8862745, 1,
1.060076, 0.4629658, 2.885931, 1, 0, 0.8823529, 1,
1.062567, -0.4445535, 2.036367, 1, 0, 0.8745098, 1,
1.06819, -1.464192, 3.044937, 1, 0, 0.8705882, 1,
1.070642, -1.072652, 4.465057, 1, 0, 0.8627451, 1,
1.078835, 0.9980678, 0.4083079, 1, 0, 0.8588235, 1,
1.079113, 1.131436, 1.275631, 1, 0, 0.8509804, 1,
1.08195, -0.325933, 3.603448, 1, 0, 0.8470588, 1,
1.081989, 0.8344094, 1.360519, 1, 0, 0.8392157, 1,
1.084721, -0.03210523, 1.262234, 1, 0, 0.8352941, 1,
1.08605, -0.08308464, 1.538674, 1, 0, 0.827451, 1,
1.100166, 1.52391, -0.4553036, 1, 0, 0.8235294, 1,
1.104024, 3.231424, 0.3963111, 1, 0, 0.8156863, 1,
1.106213, -0.1559263, 1.041565, 1, 0, 0.8117647, 1,
1.111878, 0.989622, 1.553348, 1, 0, 0.8039216, 1,
1.114981, 1.204713, -1.326928, 1, 0, 0.7960784, 1,
1.116081, -1.268695, 2.023583, 1, 0, 0.7921569, 1,
1.121506, -1.128571, 1.307376, 1, 0, 0.7843137, 1,
1.127036, 1.194294, 1.794996, 1, 0, 0.7803922, 1,
1.129761, -1.016054, 3.701344, 1, 0, 0.772549, 1,
1.134604, 1.333059, -0.2074604, 1, 0, 0.7686275, 1,
1.136546, 0.7976357, 0.7574872, 1, 0, 0.7607843, 1,
1.154991, 1.127577, 0.8308703, 1, 0, 0.7568628, 1,
1.159051, -0.6540298, 2.977495, 1, 0, 0.7490196, 1,
1.171592, 0.5198246, 1.365443, 1, 0, 0.7450981, 1,
1.173675, -1.311261, 3.849862, 1, 0, 0.7372549, 1,
1.174967, -0.274893, 1.199613, 1, 0, 0.7333333, 1,
1.177709, -0.4352313, 3.312458, 1, 0, 0.7254902, 1,
1.180534, -1.50758, 2.641117, 1, 0, 0.7215686, 1,
1.181363, -0.4412141, 2.200184, 1, 0, 0.7137255, 1,
1.183548, 0.8882959, 1.620647, 1, 0, 0.7098039, 1,
1.198815, -1.436697, 0.7886319, 1, 0, 0.7019608, 1,
1.202946, 1.463625, 2.50052, 1, 0, 0.6941177, 1,
1.205324, -2.186743, 3.310684, 1, 0, 0.6901961, 1,
1.205486, -0.6482087, 1.822629, 1, 0, 0.682353, 1,
1.217127, -2.226424, 3.397314, 1, 0, 0.6784314, 1,
1.217558, -0.2405249, 1.015208, 1, 0, 0.6705883, 1,
1.222913, 0.06969354, 0.4553034, 1, 0, 0.6666667, 1,
1.230595, -0.01858739, 2.248524, 1, 0, 0.6588235, 1,
1.233443, 1.594213, 0.3524511, 1, 0, 0.654902, 1,
1.238752, 0.1216772, 1.84117, 1, 0, 0.6470588, 1,
1.240099, 0.6461541, -0.2741179, 1, 0, 0.6431373, 1,
1.250011, -1.180946, 3.938916, 1, 0, 0.6352941, 1,
1.253126, -0.4371496, 2.935461, 1, 0, 0.6313726, 1,
1.260318, -0.3861574, 3.693929, 1, 0, 0.6235294, 1,
1.260843, 0.319576, 1.907107, 1, 0, 0.6196079, 1,
1.262544, -1.068399, 1.450689, 1, 0, 0.6117647, 1,
1.268492, -0.5428249, 1.769469, 1, 0, 0.6078432, 1,
1.278735, 1.997479, 1.023768, 1, 0, 0.6, 1,
1.282123, -1.025132, 3.440607, 1, 0, 0.5921569, 1,
1.282345, 0.8974579, 1.068612, 1, 0, 0.5882353, 1,
1.288059, -0.4457323, 4.36447, 1, 0, 0.5803922, 1,
1.291813, 0.1369226, 1.194141, 1, 0, 0.5764706, 1,
1.294249, -1.034595, 1.032815, 1, 0, 0.5686275, 1,
1.296026, -0.6168908, 2.889066, 1, 0, 0.5647059, 1,
1.298873, 1.690499, 1.514882, 1, 0, 0.5568628, 1,
1.30064, 0.2779628, 2.650221, 1, 0, 0.5529412, 1,
1.302207, -0.233887, 0.3447486, 1, 0, 0.5450981, 1,
1.30457, 0.5639456, 2.335672, 1, 0, 0.5411765, 1,
1.308161, 0.7597895, 1.342445, 1, 0, 0.5333334, 1,
1.315429, 0.2515943, 3.404803, 1, 0, 0.5294118, 1,
1.316125, 1.512683, 0.4956713, 1, 0, 0.5215687, 1,
1.318033, -0.3351921, 2.107934, 1, 0, 0.5176471, 1,
1.324435, -2.14982, 3.758889, 1, 0, 0.509804, 1,
1.326476, -0.2026518, 1.768128, 1, 0, 0.5058824, 1,
1.330945, 0.4434289, 3.387203, 1, 0, 0.4980392, 1,
1.33292, -1.149345, 0.1735471, 1, 0, 0.4901961, 1,
1.339317, -0.251379, 0.8249092, 1, 0, 0.4862745, 1,
1.348593, -1.152566, 3.432722, 1, 0, 0.4784314, 1,
1.359006, -1.637361, 0.4772901, 1, 0, 0.4745098, 1,
1.376415, 0.3814236, 1.10406, 1, 0, 0.4666667, 1,
1.382359, -0.7217255, 1.008346, 1, 0, 0.4627451, 1,
1.382772, 0.5816259, 0.5232511, 1, 0, 0.454902, 1,
1.40407, 0.4300149, 1.849264, 1, 0, 0.4509804, 1,
1.405895, 0.6471711, 1.174584, 1, 0, 0.4431373, 1,
1.418382, 0.1602327, 1.002715, 1, 0, 0.4392157, 1,
1.421055, 0.1310012, -0.3447076, 1, 0, 0.4313726, 1,
1.435172, -0.5357013, 1.823005, 1, 0, 0.427451, 1,
1.444416, 0.1547232, 0.4519846, 1, 0, 0.4196078, 1,
1.455614, -1.073313, 1.350242, 1, 0, 0.4156863, 1,
1.466717, -1.878183, 2.54845, 1, 0, 0.4078431, 1,
1.469703, 0.6163033, 1.270965, 1, 0, 0.4039216, 1,
1.47876, 0.6254107, 2.673565, 1, 0, 0.3960784, 1,
1.499806, -0.7577497, 1.917536, 1, 0, 0.3882353, 1,
1.503907, -0.6019484, 2.376266, 1, 0, 0.3843137, 1,
1.505112, -0.1511474, 1.98439, 1, 0, 0.3764706, 1,
1.518881, -0.5895165, 3.315187, 1, 0, 0.372549, 1,
1.519174, -0.04646542, 1.839209, 1, 0, 0.3647059, 1,
1.521705, -0.1899485, 1.731716, 1, 0, 0.3607843, 1,
1.557652, 0.3393652, 1.434763, 1, 0, 0.3529412, 1,
1.570391, -1.759007, 2.298367, 1, 0, 0.3490196, 1,
1.605847, -0.03229387, 1.632202, 1, 0, 0.3411765, 1,
1.631037, -0.4933515, 2.347312, 1, 0, 0.3372549, 1,
1.640323, 1.132791, 1.11437, 1, 0, 0.3294118, 1,
1.649602, 0.6709903, -0.3417379, 1, 0, 0.3254902, 1,
1.685665, 0.3613512, 2.213096, 1, 0, 0.3176471, 1,
1.712089, -1.096471, 1.012535, 1, 0, 0.3137255, 1,
1.713292, -0.7716886, 2.136462, 1, 0, 0.3058824, 1,
1.730741, 0.9123269, 0.197619, 1, 0, 0.2980392, 1,
1.732762, -1.260945, 1.548904, 1, 0, 0.2941177, 1,
1.755943, -0.8328351, 2.296056, 1, 0, 0.2862745, 1,
1.768418, -0.3400857, 2.829794, 1, 0, 0.282353, 1,
1.789789, 0.123235, 1.144496, 1, 0, 0.2745098, 1,
1.819759, -0.9379932, 2.513959, 1, 0, 0.2705882, 1,
1.826081, -0.8743917, 3.028119, 1, 0, 0.2627451, 1,
1.829477, 1.351807, 1.431476, 1, 0, 0.2588235, 1,
1.83058, 0.7803272, 0.5149212, 1, 0, 0.2509804, 1,
1.83123, -0.04206238, 1.164338, 1, 0, 0.2470588, 1,
1.833005, 0.2389934, 2.817193, 1, 0, 0.2392157, 1,
1.844623, 0.4916846, 2.196784, 1, 0, 0.2352941, 1,
1.852305, 0.1819815, 0.6744735, 1, 0, 0.227451, 1,
1.860971, -1.400546, 2.15225, 1, 0, 0.2235294, 1,
1.868745, 0.8924553, 2.445591, 1, 0, 0.2156863, 1,
1.880803, 1.099287, 1.04041, 1, 0, 0.2117647, 1,
1.922506, 0.3253422, 2.673755, 1, 0, 0.2039216, 1,
1.957982, 0.3054632, 1.434845, 1, 0, 0.1960784, 1,
1.969638, 1.002285, 0.1911144, 1, 0, 0.1921569, 1,
2.037141, 0.6677499, 1.072695, 1, 0, 0.1843137, 1,
2.044898, -0.3353628, 2.579834, 1, 0, 0.1803922, 1,
2.047563, 0.8107301, 1.571249, 1, 0, 0.172549, 1,
2.049955, 1.133089, 2.120317, 1, 0, 0.1686275, 1,
2.055918, 0.9149523, 1.702736, 1, 0, 0.1607843, 1,
2.056113, 0.7658, 1.263178, 1, 0, 0.1568628, 1,
2.108991, -0.5284589, 3.277421, 1, 0, 0.1490196, 1,
2.148198, -1.072899, 3.140142, 1, 0, 0.145098, 1,
2.21583, 0.7039944, 1.494442, 1, 0, 0.1372549, 1,
2.233974, -0.8180322, 0.4226726, 1, 0, 0.1333333, 1,
2.242341, -1.184626, 1.535532, 1, 0, 0.1254902, 1,
2.247223, -0.7140754, 1.763412, 1, 0, 0.1215686, 1,
2.266968, -1.620924, 1.596114, 1, 0, 0.1137255, 1,
2.338618, 1.095812, 0.3841597, 1, 0, 0.1098039, 1,
2.338852, -3.488024, 3.51389, 1, 0, 0.1019608, 1,
2.387448, 0.9992915, 0.09941652, 1, 0, 0.09411765, 1,
2.415883, 0.2226347, 0.01943567, 1, 0, 0.09019608, 1,
2.517512, 1.189736, 1.973886, 1, 0, 0.08235294, 1,
2.551416, -2.578509, 1.829581, 1, 0, 0.07843138, 1,
2.551778, -1.215083, 1.575565, 1, 0, 0.07058824, 1,
2.577114, 1.326628, 1.172279, 1, 0, 0.06666667, 1,
2.683171, -0.8974059, 2.238197, 1, 0, 0.05882353, 1,
2.729549, -0.2964665, 1.890559, 1, 0, 0.05490196, 1,
2.75404, -1.079774, 3.726521, 1, 0, 0.04705882, 1,
2.762707, 0.8622564, 1.064049, 1, 0, 0.04313726, 1,
2.855072, -0.1883734, 2.702932, 1, 0, 0.03529412, 1,
2.861877, -0.157343, 1.10386, 1, 0, 0.03137255, 1,
2.932952, 0.03181989, 1.44346, 1, 0, 0.02352941, 1,
2.939496, 0.4273576, 1.242641, 1, 0, 0.01960784, 1,
3.255532, -1.50129, 2.563492, 1, 0, 0.01176471, 1,
3.525205, 0.1835078, 0.8062662, 1, 0, 0.007843138, 1
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
0.2133819, -4.645394, -7.691711, 0, -0.5, 0.5, 0.5,
0.2133819, -4.645394, -7.691711, 1, -0.5, 0.5, 0.5,
0.2133819, -4.645394, -7.691711, 1, 1.5, 0.5, 0.5,
0.2133819, -4.645394, -7.691711, 0, 1.5, 0.5, 0.5
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
-4.22115, -0.0739522, -7.691711, 0, -0.5, 0.5, 0.5,
-4.22115, -0.0739522, -7.691711, 1, -0.5, 0.5, 0.5,
-4.22115, -0.0739522, -7.691711, 1, 1.5, 0.5, 0.5,
-4.22115, -0.0739522, -7.691711, 0, 1.5, 0.5, 0.5
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
-4.22115, -4.645394, -0.06464124, 0, -0.5, 0.5, 0.5,
-4.22115, -4.645394, -0.06464124, 1, -0.5, 0.5, 0.5,
-4.22115, -4.645394, -0.06464124, 1, 1.5, 0.5, 0.5,
-4.22115, -4.645394, -0.06464124, 0, 1.5, 0.5, 0.5
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
-3, -3.590446, -5.931618,
3, -3.590446, -5.931618,
-3, -3.590446, -5.931618,
-3, -3.766271, -6.224967,
-2, -3.590446, -5.931618,
-2, -3.766271, -6.224967,
-1, -3.590446, -5.931618,
-1, -3.766271, -6.224967,
0, -3.590446, -5.931618,
0, -3.766271, -6.224967,
1, -3.590446, -5.931618,
1, -3.766271, -6.224967,
2, -3.590446, -5.931618,
2, -3.766271, -6.224967,
3, -3.590446, -5.931618,
3, -3.766271, -6.224967
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
-3, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
-3, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
-3, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
-3, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
-2, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
-2, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
-2, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
-2, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
-1, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
-1, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
-1, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
-1, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
0, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
0, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
0, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
0, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
1, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
1, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
1, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
1, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
2, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
2, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
2, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
2, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5,
3, -4.11792, -6.811664, 0, -0.5, 0.5, 0.5,
3, -4.11792, -6.811664, 1, -0.5, 0.5, 0.5,
3, -4.11792, -6.811664, 1, 1.5, 0.5, 0.5,
3, -4.11792, -6.811664, 0, 1.5, 0.5, 0.5
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
-3.197796, -3, -5.931618,
-3.197796, 3, -5.931618,
-3.197796, -3, -5.931618,
-3.368355, -3, -6.224967,
-3.197796, -2, -5.931618,
-3.368355, -2, -6.224967,
-3.197796, -1, -5.931618,
-3.368355, -1, -6.224967,
-3.197796, 0, -5.931618,
-3.368355, 0, -6.224967,
-3.197796, 1, -5.931618,
-3.368355, 1, -6.224967,
-3.197796, 2, -5.931618,
-3.368355, 2, -6.224967,
-3.197796, 3, -5.931618,
-3.368355, 3, -6.224967
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
-3.709473, -3, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, -3, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, -3, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, -3, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, -2, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, -2, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, -2, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, -2, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, -1, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, -1, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, -1, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, -1, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, 0, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, 0, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, 0, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, 0, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, 1, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, 1, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, 1, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, 1, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, 2, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, 2, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, 2, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, 2, -6.811664, 0, 1.5, 0.5, 0.5,
-3.709473, 3, -6.811664, 0, -0.5, 0.5, 0.5,
-3.709473, 3, -6.811664, 1, -0.5, 0.5, 0.5,
-3.709473, 3, -6.811664, 1, 1.5, 0.5, 0.5,
-3.709473, 3, -6.811664, 0, 1.5, 0.5, 0.5
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
-3.197796, -3.590446, -4,
-3.197796, -3.590446, 4,
-3.197796, -3.590446, -4,
-3.368355, -3.766271, -4,
-3.197796, -3.590446, -2,
-3.368355, -3.766271, -2,
-3.197796, -3.590446, 0,
-3.368355, -3.766271, 0,
-3.197796, -3.590446, 2,
-3.368355, -3.766271, 2,
-3.197796, -3.590446, 4,
-3.368355, -3.766271, 4
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
-3.709473, -4.11792, -4, 0, -0.5, 0.5, 0.5,
-3.709473, -4.11792, -4, 1, -0.5, 0.5, 0.5,
-3.709473, -4.11792, -4, 1, 1.5, 0.5, 0.5,
-3.709473, -4.11792, -4, 0, 1.5, 0.5, 0.5,
-3.709473, -4.11792, -2, 0, -0.5, 0.5, 0.5,
-3.709473, -4.11792, -2, 1, -0.5, 0.5, 0.5,
-3.709473, -4.11792, -2, 1, 1.5, 0.5, 0.5,
-3.709473, -4.11792, -2, 0, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 0, 0, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 0, 1, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 0, 1, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 0, 0, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 2, 0, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 2, 1, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 2, 1, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 2, 0, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 4, 0, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 4, 1, -0.5, 0.5, 0.5,
-3.709473, -4.11792, 4, 1, 1.5, 0.5, 0.5,
-3.709473, -4.11792, 4, 0, 1.5, 0.5, 0.5
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
-3.197796, -3.590446, -5.931618,
-3.197796, 3.442542, -5.931618,
-3.197796, -3.590446, 5.802335,
-3.197796, 3.442542, 5.802335,
-3.197796, -3.590446, -5.931618,
-3.197796, -3.590446, 5.802335,
-3.197796, 3.442542, -5.931618,
-3.197796, 3.442542, 5.802335,
-3.197796, -3.590446, -5.931618,
3.62456, -3.590446, -5.931618,
-3.197796, -3.590446, 5.802335,
3.62456, -3.590446, 5.802335,
-3.197796, 3.442542, -5.931618,
3.62456, 3.442542, -5.931618,
-3.197796, 3.442542, 5.802335,
3.62456, 3.442542, 5.802335,
3.62456, -3.590446, -5.931618,
3.62456, 3.442542, -5.931618,
3.62456, -3.590446, 5.802335,
3.62456, 3.442542, 5.802335,
3.62456, -3.590446, -5.931618,
3.62456, -3.590446, 5.802335,
3.62456, 3.442542, -5.931618,
3.62456, 3.442542, 5.802335
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
var radius = 8.162974;
var distance = 36.318;
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
mvMatrix.translate( -0.2133819, 0.0739522, 0.06464124 );
mvMatrix.scale( 1.293683, 1.254939, 0.7521734 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.318);
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
Naphthacenecarboxami<-read.table("Naphthacenecarboxami.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Naphthacenecarboxami$V2
```

```
## Error in eval(expr, envir, enclos): object 'Naphthacenecarboxami' not found
```

```r
y<-Naphthacenecarboxami$V3
```

```
## Error in eval(expr, envir, enclos): object 'Naphthacenecarboxami' not found
```

```r
z<-Naphthacenecarboxami$V4
```

```
## Error in eval(expr, envir, enclos): object 'Naphthacenecarboxami' not found
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
-3.098442, -0.01569425, 0.05832063, 0, 0, 1, 1, 1,
-2.724321, -0.002651113, -1.824252, 1, 0, 0, 1, 1,
-2.630646, -0.1083896, -3.03027, 1, 0, 0, 1, 1,
-2.630368, 0.1609842, -0.8378581, 1, 0, 0, 1, 1,
-2.546876, 0.9471902, -1.693331, 1, 0, 0, 1, 1,
-2.540549, 0.9812721, -0.96595, 1, 0, 0, 1, 1,
-2.433778, 0.1026023, -1.160319, 0, 0, 0, 1, 1,
-2.34302, 0.6234869, -2.210781, 0, 0, 0, 1, 1,
-2.330711, 0.2282444, -2.51724, 0, 0, 0, 1, 1,
-2.299853, -0.05161154, -2.678162, 0, 0, 0, 1, 1,
-2.278572, 0.2229816, -1.366853, 0, 0, 0, 1, 1,
-2.256336, 0.404613, -1.82317, 0, 0, 0, 1, 1,
-2.239406, -1.458225, -2.585087, 0, 0, 0, 1, 1,
-2.226056, -0.656427, -1.32284, 1, 1, 1, 1, 1,
-2.213946, 0.5200258, -1.575753, 1, 1, 1, 1, 1,
-2.177957, 0.05036802, -2.363684, 1, 1, 1, 1, 1,
-2.147813, -0.506541, -0.3392095, 1, 1, 1, 1, 1,
-2.090361, -1.13542, -3.354636, 1, 1, 1, 1, 1,
-2.08441, 1.082906, -2.940284, 1, 1, 1, 1, 1,
-2.046038, 0.4382459, -0.9244902, 1, 1, 1, 1, 1,
-2.040414, 1.080473, -1.241043, 1, 1, 1, 1, 1,
-2.031726, 0.8096824, -1.372383, 1, 1, 1, 1, 1,
-2.021032, -0.1270621, -1.82835, 1, 1, 1, 1, 1,
-1.955469, 0.6132187, -0.8519198, 1, 1, 1, 1, 1,
-1.933215, -1.230809, -2.400187, 1, 1, 1, 1, 1,
-1.932311, 0.0710163, -1.172357, 1, 1, 1, 1, 1,
-1.928837, -1.230349, -2.515904, 1, 1, 1, 1, 1,
-1.913332, -0.9164312, -2.274469, 1, 1, 1, 1, 1,
-1.890666, -0.6637507, -1.303973, 0, 0, 1, 1, 1,
-1.871457, -0.1158649, -1.217399, 1, 0, 0, 1, 1,
-1.856192, -1.612472, -2.53184, 1, 0, 0, 1, 1,
-1.814351, 1.351269, -2.183865, 1, 0, 0, 1, 1,
-1.795955, -1.174604, -1.330251, 1, 0, 0, 1, 1,
-1.794588, 1.201063, 0.233653, 1, 0, 0, 1, 1,
-1.78336, 0.3769801, -0.1454618, 0, 0, 0, 1, 1,
-1.782247, 1.213215, -1.363657, 0, 0, 0, 1, 1,
-1.77275, -0.1200661, -2.283602, 0, 0, 0, 1, 1,
-1.764171, 0.1883145, -2.53196, 0, 0, 0, 1, 1,
-1.755251, 0.1849486, -1.005906, 0, 0, 0, 1, 1,
-1.741715, 0.6998906, -0.8353434, 0, 0, 0, 1, 1,
-1.710755, -1.284637, -2.990238, 0, 0, 0, 1, 1,
-1.70431, 0.8562043, -0.4078892, 1, 1, 1, 1, 1,
-1.70408, -0.002813808, -2.407537, 1, 1, 1, 1, 1,
-1.702768, 0.2777646, -0.8036897, 1, 1, 1, 1, 1,
-1.700474, 1.259996, -0.1422345, 1, 1, 1, 1, 1,
-1.685299, 0.1520437, -1.773908, 1, 1, 1, 1, 1,
-1.680404, -0.741839, -2.805918, 1, 1, 1, 1, 1,
-1.679135, -0.9766673, -3.659062, 1, 1, 1, 1, 1,
-1.672266, 0.4337764, -2.292525, 1, 1, 1, 1, 1,
-1.671107, -0.4962678, 0.2615909, 1, 1, 1, 1, 1,
-1.645497, 0.1104532, -2.128986, 1, 1, 1, 1, 1,
-1.63997, -0.8437015, -1.976267, 1, 1, 1, 1, 1,
-1.625379, 0.02680993, -0.1005779, 1, 1, 1, 1, 1,
-1.624016, 0.7831348, -3.388618, 1, 1, 1, 1, 1,
-1.61434, -2.01182, -3.373702, 1, 1, 1, 1, 1,
-1.612391, -0.9554945, -3.469403, 1, 1, 1, 1, 1,
-1.605101, 0.7489969, 0.8986332, 0, 0, 1, 1, 1,
-1.599199, 0.2732403, -0.2716098, 1, 0, 0, 1, 1,
-1.595629, 0.5902803, -0.1592661, 1, 0, 0, 1, 1,
-1.588059, 1.307778, -0.3574173, 1, 0, 0, 1, 1,
-1.581638, 1.679261, -1.374213, 1, 0, 0, 1, 1,
-1.581599, -0.2390073, -1.85913, 1, 0, 0, 1, 1,
-1.581266, -1.057031, -2.367236, 0, 0, 0, 1, 1,
-1.57675, 1.044403, 0.5276328, 0, 0, 0, 1, 1,
-1.567181, 0.1693455, -2.735739, 0, 0, 0, 1, 1,
-1.550509, -0.5511985, -3.438596, 0, 0, 0, 1, 1,
-1.535748, -0.5015309, -3.227748, 0, 0, 0, 1, 1,
-1.528237, -0.5604288, -3.286836, 0, 0, 0, 1, 1,
-1.519159, 0.2754813, -2.018949, 0, 0, 0, 1, 1,
-1.510993, -1.226204, -0.6452872, 1, 1, 1, 1, 1,
-1.506253, 0.3832717, -0.8902026, 1, 1, 1, 1, 1,
-1.493303, -1.044397, -3.208838, 1, 1, 1, 1, 1,
-1.490973, 0.2971658, -0.8888186, 1, 1, 1, 1, 1,
-1.484786, 0.3924438, -1.282688, 1, 1, 1, 1, 1,
-1.48123, 0.581421, -1.846693, 1, 1, 1, 1, 1,
-1.47467, -0.138124, -2.988235, 1, 1, 1, 1, 1,
-1.465557, 0.861679, -1.250554, 1, 1, 1, 1, 1,
-1.460267, 0.01679502, -0.6832392, 1, 1, 1, 1, 1,
-1.448106, -0.3681231, -2.420094, 1, 1, 1, 1, 1,
-1.43609, -0.5907953, -2.768939, 1, 1, 1, 1, 1,
-1.433241, -0.7741416, -5.537134, 1, 1, 1, 1, 1,
-1.427575, -0.04912523, -2.183743, 1, 1, 1, 1, 1,
-1.423217, 1.260978, 0.8495457, 1, 1, 1, 1, 1,
-1.413173, -0.6393813, -0.5732751, 1, 1, 1, 1, 1,
-1.410699, -0.8422635, -1.559464, 0, 0, 1, 1, 1,
-1.408728, -1.268316, -4.311164, 1, 0, 0, 1, 1,
-1.40687, -0.08544502, -2.264999, 1, 0, 0, 1, 1,
-1.406854, -0.8824939, -0.7481574, 1, 0, 0, 1, 1,
-1.406574, -1.432112, -4.082195, 1, 0, 0, 1, 1,
-1.403412, 0.5207322, -2.230438, 1, 0, 0, 1, 1,
-1.397407, -0.6144878, -2.892322, 0, 0, 0, 1, 1,
-1.385122, -0.2628576, -4.130737, 0, 0, 0, 1, 1,
-1.384851, -0.21079, -0.6932811, 0, 0, 0, 1, 1,
-1.382032, -1.847137, -2.643245, 0, 0, 0, 1, 1,
-1.380418, -0.8558841, -1.864888, 0, 0, 0, 1, 1,
-1.366493, -0.2692928, -1.048312, 0, 0, 0, 1, 1,
-1.365044, 0.08400558, 0.3570724, 0, 0, 0, 1, 1,
-1.364192, -0.04756837, -2.18651, 1, 1, 1, 1, 1,
-1.363098, -1.424737, -2.138651, 1, 1, 1, 1, 1,
-1.357453, -0.1924096, -1.797207, 1, 1, 1, 1, 1,
-1.350984, -0.5685927, -3.120172, 1, 1, 1, 1, 1,
-1.350881, -0.04806136, -1.503301, 1, 1, 1, 1, 1,
-1.340362, 1.146088, -1.436049, 1, 1, 1, 1, 1,
-1.338624, 1.989776, -1.344626, 1, 1, 1, 1, 1,
-1.318893, 0.8892788, -0.6411605, 1, 1, 1, 1, 1,
-1.313921, -0.5002806, -1.088016, 1, 1, 1, 1, 1,
-1.309116, 1.445233, -0.0882501, 1, 1, 1, 1, 1,
-1.289916, -0.3554337, -3.003192, 1, 1, 1, 1, 1,
-1.28674, -0.1392517, -1.215484, 1, 1, 1, 1, 1,
-1.281585, -1.974458, -1.489049, 1, 1, 1, 1, 1,
-1.271021, -2.13658, -1.348758, 1, 1, 1, 1, 1,
-1.270436, 0.7517146, 0.05680253, 1, 1, 1, 1, 1,
-1.266993, 0.2711563, 0.115148, 0, 0, 1, 1, 1,
-1.259955, -0.2944421, -2.346562, 1, 0, 0, 1, 1,
-1.258307, 0.3297563, -1.246901, 1, 0, 0, 1, 1,
-1.256009, -0.3016134, -3.604202, 1, 0, 0, 1, 1,
-1.25565, 0.2644802, -1.468283, 1, 0, 0, 1, 1,
-1.24909, -1.721357, -0.5063186, 1, 0, 0, 1, 1,
-1.247057, -2.711382, -1.720433, 0, 0, 0, 1, 1,
-1.245646, -1.368637, -1.943137, 0, 0, 0, 1, 1,
-1.240161, -1.03458, -2.434289, 0, 0, 0, 1, 1,
-1.233909, -0.4701605, -2.165353, 0, 0, 0, 1, 1,
-1.232543, -0.7919688, -2.637837, 0, 0, 0, 1, 1,
-1.221372, -0.4938163, -2.876491, 0, 0, 0, 1, 1,
-1.221212, -0.6726997, -1.575588, 0, 0, 0, 1, 1,
-1.219808, -0.3045155, -1.799132, 1, 1, 1, 1, 1,
-1.212061, 1.892512, -1.445639, 1, 1, 1, 1, 1,
-1.211945, -1.589072, -1.896945, 1, 1, 1, 1, 1,
-1.203271, -0.5873471, -2.717633, 1, 1, 1, 1, 1,
-1.196647, 0.330835, -1.911938, 1, 1, 1, 1, 1,
-1.194335, 0.9192882, -2.202456, 1, 1, 1, 1, 1,
-1.186842, 0.7137199, -1.009618, 1, 1, 1, 1, 1,
-1.184491, 1.726656, -0.2375476, 1, 1, 1, 1, 1,
-1.180602, -0.7912049, -2.080409, 1, 1, 1, 1, 1,
-1.178627, -0.2282193, -1.273275, 1, 1, 1, 1, 1,
-1.177729, 0.9386535, -0.04396003, 1, 1, 1, 1, 1,
-1.177636, -1.263358, -1.185817, 1, 1, 1, 1, 1,
-1.17133, 0.1347851, -0.9153666, 1, 1, 1, 1, 1,
-1.170802, -1.087108, -2.196279, 1, 1, 1, 1, 1,
-1.162224, 1.024945, -0.2094868, 1, 1, 1, 1, 1,
-1.146133, -0.4332556, -1.875933, 0, 0, 1, 1, 1,
-1.139361, -2.190186, -2.642551, 1, 0, 0, 1, 1,
-1.139254, 0.1062283, -2.405011, 1, 0, 0, 1, 1,
-1.139036, -2.03226, -3.976247, 1, 0, 0, 1, 1,
-1.137342, -0.9251973, -1.659393, 1, 0, 0, 1, 1,
-1.13272, 0.07238187, -2.957877, 1, 0, 0, 1, 1,
-1.130315, -0.977655, -3.622844, 0, 0, 0, 1, 1,
-1.125145, -0.7718425, -1.889517, 0, 0, 0, 1, 1,
-1.123399, 1.051211, -0.7341917, 0, 0, 0, 1, 1,
-1.11309, 1.060459, -2.184446, 0, 0, 0, 1, 1,
-1.111385, -0.749075, -4.332577, 0, 0, 0, 1, 1,
-1.107212, 0.4861311, -0.4586432, 0, 0, 0, 1, 1,
-1.10646, -0.819953, -2.692342, 0, 0, 0, 1, 1,
-1.10607, 1.250434, -0.0935192, 1, 1, 1, 1, 1,
-1.104931, -1.081327, -3.121004, 1, 1, 1, 1, 1,
-1.099792, 0.6219679, -1.296012, 1, 1, 1, 1, 1,
-1.096401, 0.7628722, -0.7826875, 1, 1, 1, 1, 1,
-1.086327, 1.441951, 0.7146375, 1, 1, 1, 1, 1,
-1.08418, 2.364003, -0.2638431, 1, 1, 1, 1, 1,
-1.083295, 0.05020742, -2.024865, 1, 1, 1, 1, 1,
-1.081889, -2.479369, -3.179186, 1, 1, 1, 1, 1,
-1.076967, 1.109399, -0.1467718, 1, 1, 1, 1, 1,
-1.074636, 0.118644, -2.71719, 1, 1, 1, 1, 1,
-1.068809, 0.7992471, -1.266663, 1, 1, 1, 1, 1,
-1.06846, 0.9885913, -0.06314691, 1, 1, 1, 1, 1,
-1.067992, 0.4600257, -1.915226, 1, 1, 1, 1, 1,
-1.066848, 0.6799579, -2.22113, 1, 1, 1, 1, 1,
-1.05831, 0.801746, -0.6572662, 1, 1, 1, 1, 1,
-1.057714, 1.849875, 0.4545406, 0, 0, 1, 1, 1,
-1.049722, 0.4973089, -0.5919107, 1, 0, 0, 1, 1,
-1.049707, -0.2790306, -1.380996, 1, 0, 0, 1, 1,
-1.04802, 0.3479216, -1.21734, 1, 0, 0, 1, 1,
-1.045239, -0.7660394, -2.04687, 1, 0, 0, 1, 1,
-1.034047, 1.439329, -1.437515, 1, 0, 0, 1, 1,
-1.032677, 2.137717, 0.568152, 0, 0, 0, 1, 1,
-1.032245, -1.014738, -2.94749, 0, 0, 0, 1, 1,
-1.030144, -0.7910085, -2.708516, 0, 0, 0, 1, 1,
-1.01457, -1.285141, -1.364139, 0, 0, 0, 1, 1,
-1.011901, 0.8956936, -1.331453, 0, 0, 0, 1, 1,
-1.010653, -0.8464514, -3.551079, 0, 0, 0, 1, 1,
-1.005025, -0.8986233, -0.8723207, 0, 0, 0, 1, 1,
-1.003903, 0.1919754, -1.200163, 1, 1, 1, 1, 1,
-1.000365, 0.7326143, -0.00575754, 1, 1, 1, 1, 1,
-0.9978276, -0.4876967, -0.47436, 1, 1, 1, 1, 1,
-0.9967735, 0.9417075, -0.9543242, 1, 1, 1, 1, 1,
-0.9917914, -0.5214338, -1.646244, 1, 1, 1, 1, 1,
-0.9900913, 0.5323185, -1.152853, 1, 1, 1, 1, 1,
-0.9851437, -0.8988123, -1.397043, 1, 1, 1, 1, 1,
-0.9801362, -0.115475, -0.5912856, 1, 1, 1, 1, 1,
-0.9705445, -0.9308961, -2.046789, 1, 1, 1, 1, 1,
-0.9704924, -0.1886097, -3.192307, 1, 1, 1, 1, 1,
-0.9566575, -0.1078982, -2.492434, 1, 1, 1, 1, 1,
-0.9520377, 0.2029447, -1.414458, 1, 1, 1, 1, 1,
-0.9406565, -0.4887426, -1.328009, 1, 1, 1, 1, 1,
-0.9389475, 0.7657724, -1.95812, 1, 1, 1, 1, 1,
-0.9382497, 0.8634717, -0.4141937, 1, 1, 1, 1, 1,
-0.9346302, -1.004798, -3.562968, 0, 0, 1, 1, 1,
-0.9328521, 0.6597131, -1.266807, 1, 0, 0, 1, 1,
-0.9324156, 0.8243666, 0.04013158, 1, 0, 0, 1, 1,
-0.9292852, -0.4181546, -1.772451, 1, 0, 0, 1, 1,
-0.9208624, -1.188047, -3.609601, 1, 0, 0, 1, 1,
-0.90631, 1.14651, -0.207497, 1, 0, 0, 1, 1,
-0.904381, 0.4971315, -0.501609, 0, 0, 0, 1, 1,
-0.9035494, 1.533977, -0.4258059, 0, 0, 0, 1, 1,
-0.9033214, 0.4544036, -1.054297, 0, 0, 0, 1, 1,
-0.8969479, 0.2202056, -0.862793, 0, 0, 0, 1, 1,
-0.8918607, 1.020232, -0.628844, 0, 0, 0, 1, 1,
-0.8751007, 0.04386765, -0.723424, 0, 0, 0, 1, 1,
-0.8689374, 0.8278286, -1.091729, 0, 0, 0, 1, 1,
-0.8659201, 0.09607156, -1.370736, 1, 1, 1, 1, 1,
-0.8626413, 0.557578, -0.4238959, 1, 1, 1, 1, 1,
-0.8542488, -0.3563195, -3.50694, 1, 1, 1, 1, 1,
-0.8469607, 0.7077184, -1.372429, 1, 1, 1, 1, 1,
-0.8453785, 0.1821944, -2.502341, 1, 1, 1, 1, 1,
-0.8433716, -0.9836541, -3.618413, 1, 1, 1, 1, 1,
-0.8408664, 1.866803, -1.050447, 1, 1, 1, 1, 1,
-0.8333797, -0.6622872, -2.256159, 1, 1, 1, 1, 1,
-0.8317271, 0.325323, -1.141085, 1, 1, 1, 1, 1,
-0.8295283, -0.8973117, -2.83066, 1, 1, 1, 1, 1,
-0.8278702, 0.5274392, -1.305937, 1, 1, 1, 1, 1,
-0.8263933, 0.2035217, -2.464963, 1, 1, 1, 1, 1,
-0.825037, 0.389409, 0.1748849, 1, 1, 1, 1, 1,
-0.8249916, -1.561842, -1.271787, 1, 1, 1, 1, 1,
-0.8247905, 1.875837, -0.5695242, 1, 1, 1, 1, 1,
-0.8196648, 1.387421, -0.1885177, 0, 0, 1, 1, 1,
-0.8181884, 0.6563454, -1.936978, 1, 0, 0, 1, 1,
-0.8171806, -0.7173078, -3.426934, 1, 0, 0, 1, 1,
-0.8030329, -0.3289217, -2.895254, 1, 0, 0, 1, 1,
-0.8021668, -0.6025287, -2.275737, 1, 0, 0, 1, 1,
-0.797303, 0.5874714, -1.70921, 1, 0, 0, 1, 1,
-0.7972975, -0.464101, -1.346124, 0, 0, 0, 1, 1,
-0.7948527, 0.05850967, -3.269221, 0, 0, 0, 1, 1,
-0.7870966, -1.682769, -3.403392, 0, 0, 0, 1, 1,
-0.7851741, -1.605083, -4.364233, 0, 0, 0, 1, 1,
-0.7782314, 0.3488381, -1.915944, 0, 0, 0, 1, 1,
-0.7734447, -2.2574, -1.692992, 0, 0, 0, 1, 1,
-0.766559, -1.693505, -1.705848, 0, 0, 0, 1, 1,
-0.7638786, 0.1230564, -0.7350675, 1, 1, 1, 1, 1,
-0.7631067, -0.1976821, -1.558097, 1, 1, 1, 1, 1,
-0.7530726, 1.507136, -0.4144443, 1, 1, 1, 1, 1,
-0.7476652, 2.830997, -1.361008, 1, 1, 1, 1, 1,
-0.7461047, -0.6130214, -3.211115, 1, 1, 1, 1, 1,
-0.7457865, 1.80109, -0.4820056, 1, 1, 1, 1, 1,
-0.7440054, 2.147242, -0.3056451, 1, 1, 1, 1, 1,
-0.7415451, 1.239129, -1.594632, 1, 1, 1, 1, 1,
-0.7373731, -0.3204643, -2.297313, 1, 1, 1, 1, 1,
-0.7369203, 0.6070212, -0.7159107, 1, 1, 1, 1, 1,
-0.7368413, -0.1598689, -0.953966, 1, 1, 1, 1, 1,
-0.7304851, 0.2202959, -0.8677293, 1, 1, 1, 1, 1,
-0.7247584, 1.42562, 0.5803163, 1, 1, 1, 1, 1,
-0.7160558, -1.288279, -2.480048, 1, 1, 1, 1, 1,
-0.7135379, -0.8046796, -2.139424, 1, 1, 1, 1, 1,
-0.7126077, -0.6473296, -1.82917, 0, 0, 1, 1, 1,
-0.7040389, 1.053794, -2.051287, 1, 0, 0, 1, 1,
-0.7037517, 2.694733, -0.2052695, 1, 0, 0, 1, 1,
-0.7023349, 0.4348963, -0.8881317, 1, 0, 0, 1, 1,
-0.702069, 1.720748, 0.1101624, 1, 0, 0, 1, 1,
-0.6962758, -0.1878694, -0.8027222, 1, 0, 0, 1, 1,
-0.693792, 0.3540514, -0.9757875, 0, 0, 0, 1, 1,
-0.6921915, 1.620824, 0.7856446, 0, 0, 0, 1, 1,
-0.6892051, 0.9476596, 1.039695, 0, 0, 0, 1, 1,
-0.6871592, -1.162279, 0.04836836, 0, 0, 0, 1, 1,
-0.6856523, 0.01214971, -0.9555049, 0, 0, 0, 1, 1,
-0.6837428, 0.1132384, -1.582691, 0, 0, 0, 1, 1,
-0.6807036, 1.217294, -0.2212406, 0, 0, 0, 1, 1,
-0.6802205, 1.915604, 0.3912886, 1, 1, 1, 1, 1,
-0.6773263, -1.112828, 0.4953433, 1, 1, 1, 1, 1,
-0.6696958, -0.2980653, 0.442238, 1, 1, 1, 1, 1,
-0.6694471, -0.7023127, -2.539133, 1, 1, 1, 1, 1,
-0.6592184, 0.6582154, -1.850062, 1, 1, 1, 1, 1,
-0.6579078, 0.4871368, -2.318097, 1, 1, 1, 1, 1,
-0.6555752, 0.6184076, -1.981549, 1, 1, 1, 1, 1,
-0.6546959, 0.3111233, 0.2495389, 1, 1, 1, 1, 1,
-0.6535289, -0.07211118, -2.646512, 1, 1, 1, 1, 1,
-0.6515934, 0.4140078, -2.137339, 1, 1, 1, 1, 1,
-0.6477093, 1.236475, -1.177321, 1, 1, 1, 1, 1,
-0.6469247, -1.637924, -3.801997, 1, 1, 1, 1, 1,
-0.6445265, 0.6211921, -2.841251, 1, 1, 1, 1, 1,
-0.6332521, -0.6545829, -0.9552751, 1, 1, 1, 1, 1,
-0.6323748, -1.002194, -1.433663, 1, 1, 1, 1, 1,
-0.6297027, 0.06776594, -0.2842202, 0, 0, 1, 1, 1,
-0.6015487, -0.2573844, -2.525859, 1, 0, 0, 1, 1,
-0.6005033, 0.2349199, -1.713278, 1, 0, 0, 1, 1,
-0.59753, -1.219353, -1.016626, 1, 0, 0, 1, 1,
-0.5937087, 1.016363, 0.609884, 1, 0, 0, 1, 1,
-0.5924465, -0.6136348, -2.714664, 1, 0, 0, 1, 1,
-0.5886861, -0.2124371, -2.874725, 0, 0, 0, 1, 1,
-0.5862306, 0.8590188, -0.3493711, 0, 0, 0, 1, 1,
-0.5855784, -0.8898913, -2.099223, 0, 0, 0, 1, 1,
-0.580506, -0.46255, -3.088547, 0, 0, 0, 1, 1,
-0.5776629, -0.1741793, -1.883039, 0, 0, 0, 1, 1,
-0.5757508, -1.979056, -2.600356, 0, 0, 0, 1, 1,
-0.573885, -0.1018013, -0.07795545, 0, 0, 0, 1, 1,
-0.5713068, -0.1167068, -1.550893, 1, 1, 1, 1, 1,
-0.5697008, -1.310198, -4.527912, 1, 1, 1, 1, 1,
-0.5609658, -1.059794, -3.540933, 1, 1, 1, 1, 1,
-0.5552468, 1.11987, 1.245155, 1, 1, 1, 1, 1,
-0.5550857, 0.8570538, -1.559899, 1, 1, 1, 1, 1,
-0.5520471, 0.2645509, -1.096722, 1, 1, 1, 1, 1,
-0.5504622, -0.4327961, -1.502587, 1, 1, 1, 1, 1,
-0.5481716, -1.148576, -3.629052, 1, 1, 1, 1, 1,
-0.5464321, -2.449908, -4.414521, 1, 1, 1, 1, 1,
-0.5429604, -1.693311, -4.405655, 1, 1, 1, 1, 1,
-0.5394218, 1.061398, -1.021162, 1, 1, 1, 1, 1,
-0.5384931, 0.2568451, -1.722958, 1, 1, 1, 1, 1,
-0.5380068, -1.319667, -4.154439, 1, 1, 1, 1, 1,
-0.5366548, 0.621872, 0.2541445, 1, 1, 1, 1, 1,
-0.5321153, -0.9788405, -4.337441, 1, 1, 1, 1, 1,
-0.5168787, -1.665634, -3.277496, 0, 0, 1, 1, 1,
-0.5156261, -1.725586, -3.357757, 1, 0, 0, 1, 1,
-0.507894, -0.4472552, -2.538218, 1, 0, 0, 1, 1,
-0.498666, 1.394105, -0.6196141, 1, 0, 0, 1, 1,
-0.498253, -0.4598011, -1.926994, 1, 0, 0, 1, 1,
-0.4974215, 0.4342771, -1.020782, 1, 0, 0, 1, 1,
-0.4949317, 0.2346193, -3.254265, 0, 0, 0, 1, 1,
-0.4944415, -1.532177, -4.358715, 0, 0, 0, 1, 1,
-0.4940787, -1.04315, -1.249923, 0, 0, 0, 1, 1,
-0.4911529, 0.3357003, -2.344306, 0, 0, 0, 1, 1,
-0.4868867, -0.1052891, -4.508287, 0, 0, 0, 1, 1,
-0.4840025, 1.817615, -0.6537063, 0, 0, 0, 1, 1,
-0.4815234, -1.444444, -3.997255, 0, 0, 0, 1, 1,
-0.4810265, 1.864081, -0.9289341, 1, 1, 1, 1, 1,
-0.4780532, -0.6479208, -2.805588, 1, 1, 1, 1, 1,
-0.4776785, 0.03944895, -2.692087, 1, 1, 1, 1, 1,
-0.4773809, 1.32906, 0.513607, 1, 1, 1, 1, 1,
-0.4740365, -0.4569659, -1.382419, 1, 1, 1, 1, 1,
-0.4722504, 0.4635501, -0.868229, 1, 1, 1, 1, 1,
-0.4722233, -0.5782356, -0.9161259, 1, 1, 1, 1, 1,
-0.4716254, 0.4789552, -2.263632, 1, 1, 1, 1, 1,
-0.4715407, 0.9158855, 0.854668, 1, 1, 1, 1, 1,
-0.4709414, 0.5360355, 0.2273522, 1, 1, 1, 1, 1,
-0.4682368, 3.340119, 0.5417987, 1, 1, 1, 1, 1,
-0.463585, 0.8202557, -1.473096, 1, 1, 1, 1, 1,
-0.462701, -1.352001, -4.218031, 1, 1, 1, 1, 1,
-0.4599126, 0.2175159, -0.4678287, 1, 1, 1, 1, 1,
-0.4553336, -0.3922614, -2.061167, 1, 1, 1, 1, 1,
-0.4405614, -0.01710569, -1.224501, 0, 0, 1, 1, 1,
-0.4362578, 1.543621, 0.006556943, 1, 0, 0, 1, 1,
-0.4336362, 0.2778589, -1.257248, 1, 0, 0, 1, 1,
-0.4283122, 0.05179613, -2.086367, 1, 0, 0, 1, 1,
-0.4273212, 0.1491745, -1.208284, 1, 0, 0, 1, 1,
-0.4262697, 0.2822562, -1.018991, 1, 0, 0, 1, 1,
-0.4258535, 0.4829243, -1.504233, 0, 0, 0, 1, 1,
-0.4190196, -0.7988145, -2.27249, 0, 0, 0, 1, 1,
-0.4165798, 0.5160133, 0.6674182, 0, 0, 0, 1, 1,
-0.411936, -0.6897364, -2.516076, 0, 0, 0, 1, 1,
-0.4118641, 0.6454588, -2.204781, 0, 0, 0, 1, 1,
-0.4114928, -0.5959687, -3.011389, 0, 0, 0, 1, 1,
-0.4099029, -0.7429044, -4.114459, 0, 0, 0, 1, 1,
-0.4065103, 1.050359, -0.5840166, 1, 1, 1, 1, 1,
-0.4052182, -0.593604, -2.613983, 1, 1, 1, 1, 1,
-0.4024964, -0.5065492, -2.607011, 1, 1, 1, 1, 1,
-0.3999064, -0.3676578, -2.894352, 1, 1, 1, 1, 1,
-0.3966605, 1.484359, -0.8852157, 1, 1, 1, 1, 1,
-0.3963583, -0.0726046, -1.098275, 1, 1, 1, 1, 1,
-0.3915223, 0.7188705, 1.026528, 1, 1, 1, 1, 1,
-0.3868683, -0.3207475, -1.392605, 1, 1, 1, 1, 1,
-0.3858854, 0.9348009, 0.4983238, 1, 1, 1, 1, 1,
-0.3851109, -1.067703, -3.33627, 1, 1, 1, 1, 1,
-0.3838223, 1.632609, -0.727421, 1, 1, 1, 1, 1,
-0.3809991, -1.711526, -2.553713, 1, 1, 1, 1, 1,
-0.3757082, -2.628006, -3.45761, 1, 1, 1, 1, 1,
-0.3747589, 0.194749, -2.601417, 1, 1, 1, 1, 1,
-0.3731081, 0.3621363, 0.5796509, 1, 1, 1, 1, 1,
-0.3701054, -0.01858117, -2.805032, 0, 0, 1, 1, 1,
-0.3680126, 0.655783, -0.6869062, 1, 0, 0, 1, 1,
-0.3542024, -0.7507666, -3.219561, 1, 0, 0, 1, 1,
-0.3536912, 0.5682843, 0.1636361, 1, 0, 0, 1, 1,
-0.3499247, -0.03401482, -2.37101, 1, 0, 0, 1, 1,
-0.3465416, -1.683867, -3.07998, 1, 0, 0, 1, 1,
-0.3448232, 0.2702634, -1.403927, 0, 0, 0, 1, 1,
-0.3445542, -0.2598585, -1.284234, 0, 0, 0, 1, 1,
-0.3376424, -1.658247, -1.801484, 0, 0, 0, 1, 1,
-0.3370698, 0.3820463, -1.568115, 0, 0, 0, 1, 1,
-0.3366889, 1.703726, -0.3532362, 0, 0, 0, 1, 1,
-0.3336857, -0.8335676, -2.958175, 0, 0, 0, 1, 1,
-0.3335142, 1.314296, -0.2462976, 0, 0, 0, 1, 1,
-0.3321762, 2.158921, -0.2694373, 1, 1, 1, 1, 1,
-0.3313884, -0.6882503, -2.574342, 1, 1, 1, 1, 1,
-0.3306475, 0.8829498, -0.354223, 1, 1, 1, 1, 1,
-0.3276296, 0.3448665, -1.36197, 1, 1, 1, 1, 1,
-0.3234092, 0.6335241, -1.119267, 1, 1, 1, 1, 1,
-0.3214724, 0.5708986, 0.1341543, 1, 1, 1, 1, 1,
-0.3211122, 0.10357, -1.027184, 1, 1, 1, 1, 1,
-0.3200282, -0.9142783, -2.422348, 1, 1, 1, 1, 1,
-0.313791, -1.505206, -3.614288, 1, 1, 1, 1, 1,
-0.303036, -0.8857173, -3.300477, 1, 1, 1, 1, 1,
-0.3022699, 0.4688411, 0.9489819, 1, 1, 1, 1, 1,
-0.3021142, -0.927765, -3.02999, 1, 1, 1, 1, 1,
-0.3013141, 1.297303, 0.5684733, 1, 1, 1, 1, 1,
-0.2985453, 0.4366316, -0.2535305, 1, 1, 1, 1, 1,
-0.2983674, -0.1103088, -1.210639, 1, 1, 1, 1, 1,
-0.2899896, 0.4516747, 0.1838899, 0, 0, 1, 1, 1,
-0.2894809, -0.2810633, -2.963019, 1, 0, 0, 1, 1,
-0.2892251, -0.4799638, -2.899151, 1, 0, 0, 1, 1,
-0.287414, 0.3252431, -2.13887, 1, 0, 0, 1, 1,
-0.2872665, -1.002731, -3.080283, 1, 0, 0, 1, 1,
-0.2773109, -0.7051033, -1.753924, 1, 0, 0, 1, 1,
-0.2738823, -0.1406229, -2.35118, 0, 0, 0, 1, 1,
-0.2675585, -1.411934, -2.807197, 0, 0, 0, 1, 1,
-0.2636664, 0.6479896, -1.532741, 0, 0, 0, 1, 1,
-0.259862, -1.848482, -3.261044, 0, 0, 0, 1, 1,
-0.2562947, 1.676991, 0.2808802, 0, 0, 0, 1, 1,
-0.2556328, -0.4408635, -1.760745, 0, 0, 0, 1, 1,
-0.2539958, 0.06259321, -0.920041, 0, 0, 0, 1, 1,
-0.2517906, 0.458277, -0.9600301, 1, 1, 1, 1, 1,
-0.2501559, 1.545311, 0.6600333, 1, 1, 1, 1, 1,
-0.2419934, 0.4570104, -0.34576, 1, 1, 1, 1, 1,
-0.239271, 0.746255, -2.358432, 1, 1, 1, 1, 1,
-0.2391515, 0.2301258, -0.3728807, 1, 1, 1, 1, 1,
-0.2381572, 0.8324404, -0.3199538, 1, 1, 1, 1, 1,
-0.2326564, -0.72093, -4.133405, 1, 1, 1, 1, 1,
-0.2316638, -0.1753034, -1.653204, 1, 1, 1, 1, 1,
-0.2266824, -0.179998, -1.818154, 1, 1, 1, 1, 1,
-0.2227155, -1.485564, -2.990148, 1, 1, 1, 1, 1,
-0.2209023, 0.5649471, -0.5505129, 1, 1, 1, 1, 1,
-0.2202634, 1.660426, -1.162964, 1, 1, 1, 1, 1,
-0.2169182, 0.3070332, -0.7355664, 1, 1, 1, 1, 1,
-0.210252, 0.3729455, 0.4281485, 1, 1, 1, 1, 1,
-0.2071185, 1.453143, 0.7823886, 1, 1, 1, 1, 1,
-0.203305, 0.7380321, -0.4607085, 0, 0, 1, 1, 1,
-0.2018164, 0.2821563, 0.06666316, 1, 0, 0, 1, 1,
-0.1987982, -0.5072401, -2.381512, 1, 0, 0, 1, 1,
-0.1958839, 0.5302436, -3.400663, 1, 0, 0, 1, 1,
-0.1943821, -1.748369, -3.71963, 1, 0, 0, 1, 1,
-0.1926784, -1.798207, -2.222306, 1, 0, 0, 1, 1,
-0.1910911, -0.9300138, -3.021193, 0, 0, 0, 1, 1,
-0.1888482, 0.5598421, -1.002538, 0, 0, 0, 1, 1,
-0.1848963, 0.316845, 1.09324, 0, 0, 0, 1, 1,
-0.1776796, -0.6149372, -4.932042, 0, 0, 0, 1, 1,
-0.1774867, 0.1913051, -2.341005, 0, 0, 0, 1, 1,
-0.176241, 0.7038097, -0.5058136, 0, 0, 0, 1, 1,
-0.1734247, -1.029128, -3.357267, 0, 0, 0, 1, 1,
-0.1621164, 0.2164706, -0.6191918, 1, 1, 1, 1, 1,
-0.1617423, -0.2208088, -3.771069, 1, 1, 1, 1, 1,
-0.1544741, -0.2021583, -4.958927, 1, 1, 1, 1, 1,
-0.1541506, -0.6877931, -3.982179, 1, 1, 1, 1, 1,
-0.1538432, 0.09617976, -3.202107, 1, 1, 1, 1, 1,
-0.1522396, -0.3285438, -2.056802, 1, 1, 1, 1, 1,
-0.1511835, 0.105063, -1.206923, 1, 1, 1, 1, 1,
-0.1439016, -0.3521052, -4.229015, 1, 1, 1, 1, 1,
-0.1355866, -0.1146214, -2.921283, 1, 1, 1, 1, 1,
-0.1301704, -2.282887, -3.003983, 1, 1, 1, 1, 1,
-0.1274253, -0.05845742, -2.050576, 1, 1, 1, 1, 1,
-0.1223184, -0.83208, -3.2472, 1, 1, 1, 1, 1,
-0.1203152, -0.3125582, -5.760735, 1, 1, 1, 1, 1,
-0.1202435, -1.797806, -2.227415, 1, 1, 1, 1, 1,
-0.1195566, 0.549363, 0.2121635, 1, 1, 1, 1, 1,
-0.1162177, -0.5265022, -1.595834, 0, 0, 1, 1, 1,
-0.1087802, 1.060777, -0.02640898, 1, 0, 0, 1, 1,
-0.106232, -0.05496391, -5.180169, 1, 0, 0, 1, 1,
-0.1051314, -1.641101, -1.987196, 1, 0, 0, 1, 1,
-0.1036914, -2.101063, -1.754477, 1, 0, 0, 1, 1,
-0.0995442, 0.5912083, -0.616727, 1, 0, 0, 1, 1,
-0.09615073, 1.298532, 0.08969484, 0, 0, 0, 1, 1,
-0.09492691, -0.4314968, -3.530064, 0, 0, 0, 1, 1,
-0.09461831, 0.818683, -1.393765, 0, 0, 0, 1, 1,
-0.09340148, 0.119448, -1.034662, 0, 0, 0, 1, 1,
-0.09275033, -0.05270955, -0.7840011, 0, 0, 0, 1, 1,
-0.08927089, 0.2807174, -0.6482397, 0, 0, 0, 1, 1,
-0.08901335, 1.448681, 0.3743688, 0, 0, 0, 1, 1,
-0.0834927, -0.3819081, -1.47222, 1, 1, 1, 1, 1,
-0.08201556, -0.7799523, -2.247195, 1, 1, 1, 1, 1,
-0.07831506, -0.7519798, -2.57268, 1, 1, 1, 1, 1,
-0.07680656, -0.5390218, -3.185191, 1, 1, 1, 1, 1,
-0.07262149, 1.228972, -0.1611347, 1, 1, 1, 1, 1,
-0.06312378, 1.889458, -1.660325, 1, 1, 1, 1, 1,
-0.06275935, -0.5684731, -3.48892, 1, 1, 1, 1, 1,
-0.06065753, -1.692295, -2.765182, 1, 1, 1, 1, 1,
-0.0603413, 1.165095, -1.580724, 1, 1, 1, 1, 1,
-0.05984579, 0.8394623, 0.354429, 1, 1, 1, 1, 1,
-0.05867771, -0.3927662, -1.466195, 1, 1, 1, 1, 1,
-0.0585469, -1.034983, -1.694688, 1, 1, 1, 1, 1,
-0.05846141, -1.787753, -3.216789, 1, 1, 1, 1, 1,
-0.05596922, -0.02953046, -2.572987, 1, 1, 1, 1, 1,
-0.05488747, 0.8267501, 0.7241951, 1, 1, 1, 1, 1,
-0.05466888, 1.396591, -1.924075, 0, 0, 1, 1, 1,
-0.05452132, -0.3879553, -1.737473, 1, 0, 0, 1, 1,
-0.05418891, 0.08888002, -1.50492, 1, 0, 0, 1, 1,
-0.04235056, -0.04987068, -2.16088, 1, 0, 0, 1, 1,
-0.04086433, 0.7772598, -0.5817916, 1, 0, 0, 1, 1,
-0.03769562, 0.2523397, -0.934698, 1, 0, 0, 1, 1,
-0.03726523, 0.5213503, 0.02696197, 0, 0, 0, 1, 1,
-0.03597314, 1.741026, -0.4020248, 0, 0, 0, 1, 1,
-0.0344043, -1.432478, -4.521576, 0, 0, 0, 1, 1,
-0.03105609, 0.04963285, 0.6714197, 0, 0, 0, 1, 1,
-0.02924574, 1.716004, -0.280872, 0, 0, 0, 1, 1,
-0.0288638, -0.8775998, -1.425047, 0, 0, 0, 1, 1,
-0.02526984, -2.90074, -2.399406, 0, 0, 0, 1, 1,
-0.02308001, -0.2483957, -1.150997, 1, 1, 1, 1, 1,
-0.01951028, -0.3486497, -3.086744, 1, 1, 1, 1, 1,
-0.01670097, 1.29672, 0.8451527, 1, 1, 1, 1, 1,
-0.01541431, 0.1461151, 0.9345018, 1, 1, 1, 1, 1,
-0.01119659, -1.043872, -2.514865, 1, 1, 1, 1, 1,
-0.00724022, 0.5165899, -0.1769876, 1, 1, 1, 1, 1,
-0.005751179, 1.145272, 0.3182782, 1, 1, 1, 1, 1,
-0.004994731, -0.3676666, -3.951062, 1, 1, 1, 1, 1,
-0.00131091, -1.685771, -3.528949, 1, 1, 1, 1, 1,
-0.001262273, -1.711777, -4.801692, 1, 1, 1, 1, 1,
0.006472414, -0.006942199, 1.501739, 1, 1, 1, 1, 1,
0.007896701, -1.534742, 1.266178, 1, 1, 1, 1, 1,
0.008186807, 0.5578207, -1.344022, 1, 1, 1, 1, 1,
0.01322965, 0.0315474, -0.08581965, 1, 1, 1, 1, 1,
0.01522229, 1.404731, 0.9526072, 1, 1, 1, 1, 1,
0.01699803, 2.104291, -0.6453634, 0, 0, 1, 1, 1,
0.01735255, -1.234698, 4.270636, 1, 0, 0, 1, 1,
0.01797485, 1.611547, -0.3608761, 1, 0, 0, 1, 1,
0.01833277, -0.7507028, 3.365776, 1, 0, 0, 1, 1,
0.0220889, 0.2934569, 0.1222478, 1, 0, 0, 1, 1,
0.02576072, 1.391959, -0.8505288, 1, 0, 0, 1, 1,
0.0296677, -1.45422, 2.889107, 0, 0, 0, 1, 1,
0.03028115, -0.1196317, 1.203984, 0, 0, 0, 1, 1,
0.03485073, 0.8328803, -0.7250596, 0, 0, 0, 1, 1,
0.0507609, -0.131381, 3.377726, 0, 0, 0, 1, 1,
0.05363863, 0.1428431, -0.2289716, 0, 0, 0, 1, 1,
0.05554583, 0.3034929, 0.9405813, 0, 0, 0, 1, 1,
0.05566704, 1.040936, 0.8679204, 0, 0, 0, 1, 1,
0.06234209, -0.7091697, 4.472675, 1, 1, 1, 1, 1,
0.0635874, -1.489795, 2.855733, 1, 1, 1, 1, 1,
0.06363718, 0.3972841, -0.05984318, 1, 1, 1, 1, 1,
0.06670059, 0.527684, -0.1750778, 1, 1, 1, 1, 1,
0.06686426, 1.351498, -1.106322, 1, 1, 1, 1, 1,
0.06720342, -1.517849, 3.832743, 1, 1, 1, 1, 1,
0.06722464, -0.5499342, 3.558212, 1, 1, 1, 1, 1,
0.0729655, 0.6271472, -0.9268459, 1, 1, 1, 1, 1,
0.07451389, 0.02776744, -1.731199, 1, 1, 1, 1, 1,
0.07978387, -1.794196, 4.281915, 1, 1, 1, 1, 1,
0.08159192, 0.6714755, -0.2312448, 1, 1, 1, 1, 1,
0.0836625, 0.08976883, -0.4777278, 1, 1, 1, 1, 1,
0.08415964, 0.6684148, -0.825321, 1, 1, 1, 1, 1,
0.0940111, -1.310167, 3.969001, 1, 1, 1, 1, 1,
0.09645243, 1.163349, -1.004364, 1, 1, 1, 1, 1,
0.1010771, 1.460066, 2.4509, 0, 0, 1, 1, 1,
0.1061134, 0.6462988, 0.717488, 1, 0, 0, 1, 1,
0.1072939, 0.3332873, -1.62014, 1, 0, 0, 1, 1,
0.1073756, 0.5286371, 0.4473502, 1, 0, 0, 1, 1,
0.1122095, -0.1897977, 4.065566, 1, 0, 0, 1, 1,
0.1123632, -0.9613382, 2.149067, 1, 0, 0, 1, 1,
0.1216793, 0.4222378, 0.5044205, 0, 0, 0, 1, 1,
0.1242266, 0.1907042, 1.508895, 0, 0, 0, 1, 1,
0.1259243, -0.9626573, 4.026102, 0, 0, 0, 1, 1,
0.1269158, -0.5535699, 2.987948, 0, 0, 0, 1, 1,
0.1296917, -1.964742, 4.945511, 0, 0, 0, 1, 1,
0.1344303, 0.613653, -0.4390281, 0, 0, 0, 1, 1,
0.1360533, 1.947763, -0.332643, 0, 0, 0, 1, 1,
0.139515, 0.3336872, 0.01747648, 1, 1, 1, 1, 1,
0.1402071, -0.1076519, 3.42372, 1, 1, 1, 1, 1,
0.1469149, 0.4078943, 0.1453551, 1, 1, 1, 1, 1,
0.1482199, 1.513208, -0.5856509, 1, 1, 1, 1, 1,
0.1487512, 0.4576959, 0.156521, 1, 1, 1, 1, 1,
0.1574211, 0.8907976, 1.058774, 1, 1, 1, 1, 1,
0.1602536, 0.6168924, -1.288391, 1, 1, 1, 1, 1,
0.1608177, 0.3682535, 1.352482, 1, 1, 1, 1, 1,
0.1609175, -2.030525, 4.33328, 1, 1, 1, 1, 1,
0.1654763, -1.804468, 4.056252, 1, 1, 1, 1, 1,
0.1689335, 1.092383, -1.679582, 1, 1, 1, 1, 1,
0.1697564, 0.01202912, -0.5692943, 1, 1, 1, 1, 1,
0.1698946, 0.2398415, 1.030509, 1, 1, 1, 1, 1,
0.1746136, -1.233164, 2.205708, 1, 1, 1, 1, 1,
0.1770802, -0.03953918, 2.282639, 1, 1, 1, 1, 1,
0.1807518, 0.7778831, 2.394602, 0, 0, 1, 1, 1,
0.1852794, -1.869689, 2.463053, 1, 0, 0, 1, 1,
0.1876056, 0.3189984, 0.2477349, 1, 0, 0, 1, 1,
0.1920057, 0.4483728, -0.2441505, 1, 0, 0, 1, 1,
0.1940153, 1.870764, -1.401744, 1, 0, 0, 1, 1,
0.1971104, -2.537482, 4.31759, 1, 0, 0, 1, 1,
0.2033408, 0.6558099, -0.1721925, 0, 0, 0, 1, 1,
0.2040326, 1.236549, -0.590963, 0, 0, 0, 1, 1,
0.2046804, 2.914584, 0.3574996, 0, 0, 0, 1, 1,
0.2050394, -0.03309941, 2.361291, 0, 0, 0, 1, 1,
0.2107109, -1.269554, 3.620547, 0, 0, 0, 1, 1,
0.2159373, -1.070966, 2.836929, 0, 0, 0, 1, 1,
0.216897, 0.8643201, 1.829597, 0, 0, 0, 1, 1,
0.21731, -1.542497, 1.844432, 1, 1, 1, 1, 1,
0.2200248, 0.823137, 2.3918, 1, 1, 1, 1, 1,
0.2212355, -1.121536, 3.487112, 1, 1, 1, 1, 1,
0.221756, -0.6092999, 2.675372, 1, 1, 1, 1, 1,
0.2217686, 0.4850529, -0.529956, 1, 1, 1, 1, 1,
0.2243121, -0.4666504, 2.85732, 1, 1, 1, 1, 1,
0.2265232, -1.703924, 3.720511, 1, 1, 1, 1, 1,
0.2274967, -0.4037331, 3.380138, 1, 1, 1, 1, 1,
0.2275819, 0.8100073, 1.315187, 1, 1, 1, 1, 1,
0.2283404, 1.630119, 2.296506, 1, 1, 1, 1, 1,
0.2292625, -0.7652339, 2.218986, 1, 1, 1, 1, 1,
0.2293776, 0.2991589, 0.05259253, 1, 1, 1, 1, 1,
0.2295285, -0.9213536, 2.297092, 1, 1, 1, 1, 1,
0.2300791, -1.640532, 2.799012, 1, 1, 1, 1, 1,
0.2305656, -0.793631, 1.592156, 1, 1, 1, 1, 1,
0.2328064, -1.540568, 3.605343, 0, 0, 1, 1, 1,
0.2344593, -0.6340007, 3.052607, 1, 0, 0, 1, 1,
0.2347293, -0.8514058, 4.420875, 1, 0, 0, 1, 1,
0.2401939, 0.4852055, -0.5300266, 1, 0, 0, 1, 1,
0.2406805, 0.2417578, 0.9009068, 1, 0, 0, 1, 1,
0.242438, 0.7519087, -0.08589256, 1, 0, 0, 1, 1,
0.2502775, 0.408114, 0.001996481, 0, 0, 0, 1, 1,
0.2524664, 0.9377612, -0.4449795, 0, 0, 0, 1, 1,
0.2549656, -0.6682475, 2.86825, 0, 0, 0, 1, 1,
0.2557051, -0.8855943, 0.8424523, 0, 0, 0, 1, 1,
0.2596851, -1.702464, 2.933971, 0, 0, 0, 1, 1,
0.2596959, 0.9153185, 0.4088182, 0, 0, 0, 1, 1,
0.2618438, 0.7374533, 0.3331414, 0, 0, 0, 1, 1,
0.2619123, -1.25741, 0.3295574, 1, 1, 1, 1, 1,
0.2640981, -1.268446, 3.261934, 1, 1, 1, 1, 1,
0.2677139, -1.788165, 3.413791, 1, 1, 1, 1, 1,
0.2687639, 0.7354378, 1.363384, 1, 1, 1, 1, 1,
0.2706147, 1.027959, -0.2175517, 1, 1, 1, 1, 1,
0.2710343, -0.02252454, 2.214267, 1, 1, 1, 1, 1,
0.2751008, 0.121099, 0.6056887, 1, 1, 1, 1, 1,
0.2772175, -0.3182789, 1.198649, 1, 1, 1, 1, 1,
0.2813769, -0.4489732, 2.149777, 1, 1, 1, 1, 1,
0.2846128, -0.5440291, 2.001666, 1, 1, 1, 1, 1,
0.2877639, -1.468181, 2.84759, 1, 1, 1, 1, 1,
0.2997723, -0.4507644, 2.461143, 1, 1, 1, 1, 1,
0.3006064, 0.8223381, 0.4402684, 1, 1, 1, 1, 1,
0.3024763, -0.7621011, 2.538305, 1, 1, 1, 1, 1,
0.3062499, -0.3493515, 2.64831, 1, 1, 1, 1, 1,
0.3078928, -1.203755, 3.862878, 0, 0, 1, 1, 1,
0.310204, -0.6577018, 3.259591, 1, 0, 0, 1, 1,
0.3139115, -0.4565767, 3.592021, 1, 0, 0, 1, 1,
0.3194936, 0.8871939, 0.878587, 1, 0, 0, 1, 1,
0.3219364, 0.8118407, 0.5276002, 1, 0, 0, 1, 1,
0.3283946, -0.2418541, 4.490685, 1, 0, 0, 1, 1,
0.3307262, -0.6230139, 3.699357, 0, 0, 0, 1, 1,
0.3377952, 1.622727, -0.6888768, 0, 0, 0, 1, 1,
0.3395758, -2.072464, 2.412691, 0, 0, 0, 1, 1,
0.340404, -0.2910292, 2.204013, 0, 0, 0, 1, 1,
0.3458209, 0.2232994, 1.510635, 0, 0, 0, 1, 1,
0.3485097, 0.1678343, 3.407029, 0, 0, 0, 1, 1,
0.3486989, -1.144351, 3.140379, 0, 0, 0, 1, 1,
0.3490274, 0.9243872, 1.32249, 1, 1, 1, 1, 1,
0.3493558, -1.382612, 2.321629, 1, 1, 1, 1, 1,
0.3520632, 1.457904, 0.0209571, 1, 1, 1, 1, 1,
0.3528318, 0.8884779, 0.88955, 1, 1, 1, 1, 1,
0.3583906, 0.08127365, -0.238373, 1, 1, 1, 1, 1,
0.3593546, -0.04757774, 1.550124, 1, 1, 1, 1, 1,
0.3599642, 0.7290037, 0.8433033, 1, 1, 1, 1, 1,
0.3602783, 0.1734753, -0.07259765, 1, 1, 1, 1, 1,
0.3627078, 0.02860886, 2.416197, 1, 1, 1, 1, 1,
0.3630377, -1.737129, 2.029159, 1, 1, 1, 1, 1,
0.3652364, -0.4085455, 2.669821, 1, 1, 1, 1, 1,
0.3658544, 0.1294504, -0.02510001, 1, 1, 1, 1, 1,
0.366041, 0.3885673, -0.2289175, 1, 1, 1, 1, 1,
0.3660747, -0.3871947, 2.947137, 1, 1, 1, 1, 1,
0.3671803, 2.130105, -0.5149233, 1, 1, 1, 1, 1,
0.371243, -0.4114082, 3.408013, 0, 0, 1, 1, 1,
0.3747008, -0.224807, 3.238481, 1, 0, 0, 1, 1,
0.3815935, 0.7925256, 1.498184, 1, 0, 0, 1, 1,
0.3818608, -1.061476, 3.561364, 1, 0, 0, 1, 1,
0.3831119, -0.1999768, 1.376567, 1, 0, 0, 1, 1,
0.3854144, -1.895557, 2.948477, 1, 0, 0, 1, 1,
0.385769, -1.078722, 1.492012, 0, 0, 0, 1, 1,
0.3873432, -0.4727049, 2.840053, 0, 0, 0, 1, 1,
0.3891872, 1.327868, -0.01354985, 0, 0, 0, 1, 1,
0.4012346, -0.2073981, 5.631453, 0, 0, 0, 1, 1,
0.4020363, -1.994087, 2.236005, 0, 0, 0, 1, 1,
0.403119, -0.1147327, 3.334006, 0, 0, 0, 1, 1,
0.4033438, 0.3191451, 0.0963027, 0, 0, 0, 1, 1,
0.4042784, -0.08504748, 0.9570978, 1, 1, 1, 1, 1,
0.4043608, 1.620516, -0.7038423, 1, 1, 1, 1, 1,
0.4069403, 1.246908, -0.5962818, 1, 1, 1, 1, 1,
0.4137112, 0.6711577, -0.4621, 1, 1, 1, 1, 1,
0.4137583, 0.6624956, 0.8407586, 1, 1, 1, 1, 1,
0.4140451, -1.775918, 2.458611, 1, 1, 1, 1, 1,
0.4146365, 0.2933283, -0.1580495, 1, 1, 1, 1, 1,
0.4149698, -0.0414427, 1.636877, 1, 1, 1, 1, 1,
0.4200424, -0.2912504, 3.348379, 1, 1, 1, 1, 1,
0.4227193, -0.9587464, 3.783211, 1, 1, 1, 1, 1,
0.4244908, -0.02117457, 0.7070031, 1, 1, 1, 1, 1,
0.4260951, -0.03746679, 3.584235, 1, 1, 1, 1, 1,
0.426304, -0.1396274, 2.218676, 1, 1, 1, 1, 1,
0.4311984, -0.4176719, 1.839351, 1, 1, 1, 1, 1,
0.4318942, -2.199441, 2.979786, 1, 1, 1, 1, 1,
0.4343978, 1.507508, 2.291108, 0, 0, 1, 1, 1,
0.4361565, 2.07379, -0.1413222, 1, 0, 0, 1, 1,
0.4407777, -0.02803706, 2.669926, 1, 0, 0, 1, 1,
0.4416427, -1.768602, 2.829924, 1, 0, 0, 1, 1,
0.4431247, -0.9837344, 2.413517, 1, 0, 0, 1, 1,
0.4433525, 2.381978, -1.117994, 1, 0, 0, 1, 1,
0.4440066, 1.800066, -0.3673747, 0, 0, 0, 1, 1,
0.4485702, -0.4638695, 1.849453, 0, 0, 0, 1, 1,
0.448763, -0.6267495, 1.219183, 0, 0, 0, 1, 1,
0.4531464, 2.49427, 0.7348925, 0, 0, 0, 1, 1,
0.4568785, -0.3324686, 0.9331553, 0, 0, 0, 1, 1,
0.4569786, 0.4970747, -0.3534603, 0, 0, 0, 1, 1,
0.4592569, -0.4856566, 5.40378, 0, 0, 0, 1, 1,
0.4624836, 0.3916, 1.389671, 1, 1, 1, 1, 1,
0.4658365, 0.3163027, 2.72675, 1, 1, 1, 1, 1,
0.4665402, 0.357391, 1.954541, 1, 1, 1, 1, 1,
0.4681609, 0.8084329, -2.40683, 1, 1, 1, 1, 1,
0.471305, 0.5883267, -0.5899978, 1, 1, 1, 1, 1,
0.4753715, 0.8583588, -0.03199612, 1, 1, 1, 1, 1,
0.4810768, 1.758895, -1.571574, 1, 1, 1, 1, 1,
0.4815728, -0.9047092, 1.421349, 1, 1, 1, 1, 1,
0.4837435, -1.953547, 3.09737, 1, 1, 1, 1, 1,
0.4912968, 0.8231547, 1.439195, 1, 1, 1, 1, 1,
0.4935304, -0.1050207, 1.495156, 1, 1, 1, 1, 1,
0.4956801, 1.522981, 0.1600799, 1, 1, 1, 1, 1,
0.4961758, 1.340646, 1.425046, 1, 1, 1, 1, 1,
0.49817, -1.298653, 1.928504, 1, 1, 1, 1, 1,
0.4983649, -0.9252568, 2.658346, 1, 1, 1, 1, 1,
0.4998233, 0.6121181, -0.09625063, 0, 0, 1, 1, 1,
0.5027939, 1.243618, -2.651122, 1, 0, 0, 1, 1,
0.5094345, 0.4677621, 1.009082, 1, 0, 0, 1, 1,
0.5101919, 1.0692, 1.400814, 1, 0, 0, 1, 1,
0.5135419, -0.8627233, 3.155165, 1, 0, 0, 1, 1,
0.5224989, 1.052385, -0.3776044, 1, 0, 0, 1, 1,
0.5231394, -1.475021, 1.3834, 0, 0, 0, 1, 1,
0.5235111, -0.2412437, 0.5674655, 0, 0, 0, 1, 1,
0.5244617, 2.067358, -0.4806715, 0, 0, 0, 1, 1,
0.5252871, 1.351359, -0.4534438, 0, 0, 0, 1, 1,
0.5288137, -0.4847017, 1.227661, 0, 0, 0, 1, 1,
0.5327719, -2.257632, 2.692376, 0, 0, 0, 1, 1,
0.543403, -1.69694, 3.111956, 0, 0, 0, 1, 1,
0.5474746, 0.1452772, 2.210108, 1, 1, 1, 1, 1,
0.5567368, -0.5217864, 3.32952, 1, 1, 1, 1, 1,
0.5570235, -0.6636181, 1.996632, 1, 1, 1, 1, 1,
0.5582188, -0.7344084, 0.3572215, 1, 1, 1, 1, 1,
0.5597115, -0.3022672, 2.135268, 1, 1, 1, 1, 1,
0.5634357, 0.002664793, 0.5274369, 1, 1, 1, 1, 1,
0.5663021, 1.19236, 0.06859575, 1, 1, 1, 1, 1,
0.5664862, -0.7737974, 3.471483, 1, 1, 1, 1, 1,
0.5687253, 1.601695, 0.136854, 1, 1, 1, 1, 1,
0.5735112, -0.01334262, 2.11514, 1, 1, 1, 1, 1,
0.5781782, -1.674006, 2.504991, 1, 1, 1, 1, 1,
0.5787912, -0.4841984, 2.580787, 1, 1, 1, 1, 1,
0.5799354, -1.134732, 2.138657, 1, 1, 1, 1, 1,
0.5800683, -2.274533, 3.518445, 1, 1, 1, 1, 1,
0.5806344, 0.408549, -0.1241871, 1, 1, 1, 1, 1,
0.5833664, -0.2063921, 1.854072, 0, 0, 1, 1, 1,
0.5921111, 0.8490517, 0.5178031, 1, 0, 0, 1, 1,
0.5929378, 0.7767982, 1.228915, 1, 0, 0, 1, 1,
0.5976449, -0.9464369, 3.343759, 1, 0, 0, 1, 1,
0.5979545, -0.1968393, 2.378087, 1, 0, 0, 1, 1,
0.6006064, 0.7654721, 2.492426, 1, 0, 0, 1, 1,
0.6012346, -1.568253, 1.243937, 0, 0, 0, 1, 1,
0.604264, 0.02897613, 0.8724865, 0, 0, 0, 1, 1,
0.6045934, 1.00637, 1.125332, 0, 0, 0, 1, 1,
0.6061628, 0.486182, 2.730268, 0, 0, 0, 1, 1,
0.6063862, -0.3926514, 2.09943, 0, 0, 0, 1, 1,
0.6064264, 0.4238291, -1.003722, 0, 0, 0, 1, 1,
0.6085727, 0.08504628, 0.2412518, 0, 0, 0, 1, 1,
0.6110698, -0.04230862, 2.749369, 1, 1, 1, 1, 1,
0.6151465, 0.9602482, 0.8430902, 1, 1, 1, 1, 1,
0.6155808, 0.8486883, 2.434853, 1, 1, 1, 1, 1,
0.6158, 0.5620555, 1.640766, 1, 1, 1, 1, 1,
0.6193275, -0.5682178, 3.401495, 1, 1, 1, 1, 1,
0.6223675, -0.3958076, 2.780088, 1, 1, 1, 1, 1,
0.6237859, 0.8341454, -0.1006968, 1, 1, 1, 1, 1,
0.6282401, 0.727761, 1.345344, 1, 1, 1, 1, 1,
0.6288171, -0.09712549, 2.23987, 1, 1, 1, 1, 1,
0.6305658, 0.8514292, 1.01845, 1, 1, 1, 1, 1,
0.631575, -0.1850626, 3.234744, 1, 1, 1, 1, 1,
0.6351319, 0.962783, 1.300064, 1, 1, 1, 1, 1,
0.6354219, -0.1360557, 3.707307, 1, 1, 1, 1, 1,
0.6381108, -1.22366, 4.149319, 1, 1, 1, 1, 1,
0.6404554, 0.2873293, -0.1288074, 1, 1, 1, 1, 1,
0.6651556, -0.292889, 2.6952, 0, 0, 1, 1, 1,
0.6679066, -1.067115, 2.167337, 1, 0, 0, 1, 1,
0.6734176, 0.2454609, 0.9228599, 1, 0, 0, 1, 1,
0.6818151, -0.3162161, 2.378806, 1, 0, 0, 1, 1,
0.6826803, 1.318608, -0.1771775, 1, 0, 0, 1, 1,
0.6853393, 1.30065, -0.6914178, 1, 0, 0, 1, 1,
0.6909524, -1.154228, 1.225898, 0, 0, 0, 1, 1,
0.6946537, 0.2929758, 2.034652, 0, 0, 0, 1, 1,
0.6950982, -1.408349, 0.9357629, 0, 0, 0, 1, 1,
0.6990672, 0.00942009, 2.815255, 0, 0, 0, 1, 1,
0.709244, -1.822477, 1.849223, 0, 0, 0, 1, 1,
0.7121077, 1.658916, 0.255892, 0, 0, 0, 1, 1,
0.7136648, 0.7475761, 0.8197237, 0, 0, 0, 1, 1,
0.7137647, -0.5535796, 1.700275, 1, 1, 1, 1, 1,
0.7211692, 0.1276374, 1.583437, 1, 1, 1, 1, 1,
0.7257765, 1.093317, 1.318457, 1, 1, 1, 1, 1,
0.7323126, 0.7067431, 2.596336, 1, 1, 1, 1, 1,
0.735357, 0.9831881, 0.2031767, 1, 1, 1, 1, 1,
0.7354337, 0.2112376, 0.09959219, 1, 1, 1, 1, 1,
0.7375537, 0.9047957, 0.2925072, 1, 1, 1, 1, 1,
0.7481343, -0.2608978, 1.704708, 1, 1, 1, 1, 1,
0.74872, -0.8067566, 1.242414, 1, 1, 1, 1, 1,
0.7504652, -0.2319261, 2.360522, 1, 1, 1, 1, 1,
0.752704, 0.4382522, 0.5286699, 1, 1, 1, 1, 1,
0.7617506, 0.6549795, 2.049782, 1, 1, 1, 1, 1,
0.7630234, 0.09619591, -0.8361857, 1, 1, 1, 1, 1,
0.7640859, 0.2246939, 1.891915, 1, 1, 1, 1, 1,
0.7755046, 1.109674, 0.5718352, 1, 1, 1, 1, 1,
0.7756602, 0.6462238, 1.549521, 0, 0, 1, 1, 1,
0.7771258, 0.07511757, 2.329656, 1, 0, 0, 1, 1,
0.779647, 0.9280283, -1.917738, 1, 0, 0, 1, 1,
0.7815413, -0.9191922, 2.210509, 1, 0, 0, 1, 1,
0.7823557, 1.566414, 1.448024, 1, 0, 0, 1, 1,
0.7827884, -1.270648, 2.319891, 1, 0, 0, 1, 1,
0.7868247, 0.9101426, 0.9461756, 0, 0, 0, 1, 1,
0.7922422, 0.1650964, 2.444421, 0, 0, 0, 1, 1,
0.7933439, 0.8627116, -1.038516, 0, 0, 0, 1, 1,
0.7970597, 1.313975, -1.372371, 0, 0, 0, 1, 1,
0.7974533, 0.02752695, 2.797499, 0, 0, 0, 1, 1,
0.800975, -0.6662887, 2.29453, 0, 0, 0, 1, 1,
0.8110839, 0.215258, 0.2218962, 0, 0, 0, 1, 1,
0.8126417, 1.809989, -0.2184134, 1, 1, 1, 1, 1,
0.8129, 0.4182564, 1.471233, 1, 1, 1, 1, 1,
0.8195939, -1.362354, 1.958093, 1, 1, 1, 1, 1,
0.8238748, -1.380703, 3.363302, 1, 1, 1, 1, 1,
0.8254531, -0.9650258, 3.303698, 1, 1, 1, 1, 1,
0.8299552, 0.1020301, 1.581467, 1, 1, 1, 1, 1,
0.8393326, 0.3247901, 2.245132, 1, 1, 1, 1, 1,
0.846984, -0.4050355, -0.6685109, 1, 1, 1, 1, 1,
0.8487197, -0.3446237, 2.192476, 1, 1, 1, 1, 1,
0.8587998, -0.5042303, 3.239377, 1, 1, 1, 1, 1,
0.8609392, 0.956202, -0.1802272, 1, 1, 1, 1, 1,
0.8669467, 1.860862, -0.3462497, 1, 1, 1, 1, 1,
0.8696772, 0.3363511, 0.6056608, 1, 1, 1, 1, 1,
0.870821, 0.3572314, -0.02620268, 1, 1, 1, 1, 1,
0.8745857, 1.277333, 2.100367, 1, 1, 1, 1, 1,
0.8854398, 0.05151222, -0.04278823, 0, 0, 1, 1, 1,
0.8864056, 0.7217611, 2.111616, 1, 0, 0, 1, 1,
0.8909491, 0.5367566, 1.068202, 1, 0, 0, 1, 1,
0.8921252, 0.3418776, 0.07528142, 1, 0, 0, 1, 1,
0.8945246, 0.8691798, 2.145072, 1, 0, 0, 1, 1,
0.9002889, 0.4234941, 2.031773, 1, 0, 0, 1, 1,
0.9047231, 0.1561801, 0.236823, 0, 0, 0, 1, 1,
0.9050283, 1.125416, 0.7193228, 0, 0, 0, 1, 1,
0.907176, 0.4375957, 1.199047, 0, 0, 0, 1, 1,
0.9108582, 1.302246, -0.6916401, 0, 0, 0, 1, 1,
0.9164378, 0.4902671, -0.2483591, 0, 0, 0, 1, 1,
0.917931, -0.9552666, 2.932496, 0, 0, 0, 1, 1,
0.9217435, 1.453142, 1.174773, 0, 0, 0, 1, 1,
0.9282036, 1.104359, -0.2067844, 1, 1, 1, 1, 1,
0.9310328, -0.2410524, 1.532668, 1, 1, 1, 1, 1,
0.9314447, -1.163897, 2.97336, 1, 1, 1, 1, 1,
0.9341403, -0.4058673, 2.486902, 1, 1, 1, 1, 1,
0.9433383, 1.149554, 0.5157433, 1, 1, 1, 1, 1,
0.946654, -0.3539863, 2.508673, 1, 1, 1, 1, 1,
0.9503993, 0.00335921, 2.535675, 1, 1, 1, 1, 1,
0.9520374, 0.6545469, 1.801943, 1, 1, 1, 1, 1,
0.9567003, 0.08459844, 0.9341349, 1, 1, 1, 1, 1,
0.9603385, -0.2774205, 2.240333, 1, 1, 1, 1, 1,
0.9608929, 0.6510637, 1.428575, 1, 1, 1, 1, 1,
0.9679263, 0.5566791, 0.8661417, 1, 1, 1, 1, 1,
0.9808848, 1.371329, 0.1230683, 1, 1, 1, 1, 1,
0.985389, -1.675712, 2.747303, 1, 1, 1, 1, 1,
0.9859587, 1.834667, 1.021223, 1, 1, 1, 1, 1,
0.9871417, -1.038199, 3.40877, 0, 0, 1, 1, 1,
0.9882016, 2.046371, -0.4456381, 1, 0, 0, 1, 1,
0.9891278, -0.7922452, 2.59156, 1, 0, 0, 1, 1,
0.9941333, 0.2056029, 1.085449, 1, 0, 0, 1, 1,
1.007256, -0.2580788, 0.8912116, 1, 0, 0, 1, 1,
1.010588, -1.324506, 1.908676, 1, 0, 0, 1, 1,
1.019706, 0.9011922, -0.3029734, 0, 0, 0, 1, 1,
1.02084, 0.6439547, -1.3207, 0, 0, 0, 1, 1,
1.024179, -1.009552, 0.9714308, 0, 0, 0, 1, 1,
1.036254, 0.6609934, 0.09552013, 0, 0, 0, 1, 1,
1.037105, 0.502272, 1.657823, 0, 0, 0, 1, 1,
1.042625, -0.3852266, 3.695642, 0, 0, 0, 1, 1,
1.058747, 0.4311323, 0.8353879, 0, 0, 0, 1, 1,
1.060076, 0.4629658, 2.885931, 1, 1, 1, 1, 1,
1.062567, -0.4445535, 2.036367, 1, 1, 1, 1, 1,
1.06819, -1.464192, 3.044937, 1, 1, 1, 1, 1,
1.070642, -1.072652, 4.465057, 1, 1, 1, 1, 1,
1.078835, 0.9980678, 0.4083079, 1, 1, 1, 1, 1,
1.079113, 1.131436, 1.275631, 1, 1, 1, 1, 1,
1.08195, -0.325933, 3.603448, 1, 1, 1, 1, 1,
1.081989, 0.8344094, 1.360519, 1, 1, 1, 1, 1,
1.084721, -0.03210523, 1.262234, 1, 1, 1, 1, 1,
1.08605, -0.08308464, 1.538674, 1, 1, 1, 1, 1,
1.100166, 1.52391, -0.4553036, 1, 1, 1, 1, 1,
1.104024, 3.231424, 0.3963111, 1, 1, 1, 1, 1,
1.106213, -0.1559263, 1.041565, 1, 1, 1, 1, 1,
1.111878, 0.989622, 1.553348, 1, 1, 1, 1, 1,
1.114981, 1.204713, -1.326928, 1, 1, 1, 1, 1,
1.116081, -1.268695, 2.023583, 0, 0, 1, 1, 1,
1.121506, -1.128571, 1.307376, 1, 0, 0, 1, 1,
1.127036, 1.194294, 1.794996, 1, 0, 0, 1, 1,
1.129761, -1.016054, 3.701344, 1, 0, 0, 1, 1,
1.134604, 1.333059, -0.2074604, 1, 0, 0, 1, 1,
1.136546, 0.7976357, 0.7574872, 1, 0, 0, 1, 1,
1.154991, 1.127577, 0.8308703, 0, 0, 0, 1, 1,
1.159051, -0.6540298, 2.977495, 0, 0, 0, 1, 1,
1.171592, 0.5198246, 1.365443, 0, 0, 0, 1, 1,
1.173675, -1.311261, 3.849862, 0, 0, 0, 1, 1,
1.174967, -0.274893, 1.199613, 0, 0, 0, 1, 1,
1.177709, -0.4352313, 3.312458, 0, 0, 0, 1, 1,
1.180534, -1.50758, 2.641117, 0, 0, 0, 1, 1,
1.181363, -0.4412141, 2.200184, 1, 1, 1, 1, 1,
1.183548, 0.8882959, 1.620647, 1, 1, 1, 1, 1,
1.198815, -1.436697, 0.7886319, 1, 1, 1, 1, 1,
1.202946, 1.463625, 2.50052, 1, 1, 1, 1, 1,
1.205324, -2.186743, 3.310684, 1, 1, 1, 1, 1,
1.205486, -0.6482087, 1.822629, 1, 1, 1, 1, 1,
1.217127, -2.226424, 3.397314, 1, 1, 1, 1, 1,
1.217558, -0.2405249, 1.015208, 1, 1, 1, 1, 1,
1.222913, 0.06969354, 0.4553034, 1, 1, 1, 1, 1,
1.230595, -0.01858739, 2.248524, 1, 1, 1, 1, 1,
1.233443, 1.594213, 0.3524511, 1, 1, 1, 1, 1,
1.238752, 0.1216772, 1.84117, 1, 1, 1, 1, 1,
1.240099, 0.6461541, -0.2741179, 1, 1, 1, 1, 1,
1.250011, -1.180946, 3.938916, 1, 1, 1, 1, 1,
1.253126, -0.4371496, 2.935461, 1, 1, 1, 1, 1,
1.260318, -0.3861574, 3.693929, 0, 0, 1, 1, 1,
1.260843, 0.319576, 1.907107, 1, 0, 0, 1, 1,
1.262544, -1.068399, 1.450689, 1, 0, 0, 1, 1,
1.268492, -0.5428249, 1.769469, 1, 0, 0, 1, 1,
1.278735, 1.997479, 1.023768, 1, 0, 0, 1, 1,
1.282123, -1.025132, 3.440607, 1, 0, 0, 1, 1,
1.282345, 0.8974579, 1.068612, 0, 0, 0, 1, 1,
1.288059, -0.4457323, 4.36447, 0, 0, 0, 1, 1,
1.291813, 0.1369226, 1.194141, 0, 0, 0, 1, 1,
1.294249, -1.034595, 1.032815, 0, 0, 0, 1, 1,
1.296026, -0.6168908, 2.889066, 0, 0, 0, 1, 1,
1.298873, 1.690499, 1.514882, 0, 0, 0, 1, 1,
1.30064, 0.2779628, 2.650221, 0, 0, 0, 1, 1,
1.302207, -0.233887, 0.3447486, 1, 1, 1, 1, 1,
1.30457, 0.5639456, 2.335672, 1, 1, 1, 1, 1,
1.308161, 0.7597895, 1.342445, 1, 1, 1, 1, 1,
1.315429, 0.2515943, 3.404803, 1, 1, 1, 1, 1,
1.316125, 1.512683, 0.4956713, 1, 1, 1, 1, 1,
1.318033, -0.3351921, 2.107934, 1, 1, 1, 1, 1,
1.324435, -2.14982, 3.758889, 1, 1, 1, 1, 1,
1.326476, -0.2026518, 1.768128, 1, 1, 1, 1, 1,
1.330945, 0.4434289, 3.387203, 1, 1, 1, 1, 1,
1.33292, -1.149345, 0.1735471, 1, 1, 1, 1, 1,
1.339317, -0.251379, 0.8249092, 1, 1, 1, 1, 1,
1.348593, -1.152566, 3.432722, 1, 1, 1, 1, 1,
1.359006, -1.637361, 0.4772901, 1, 1, 1, 1, 1,
1.376415, 0.3814236, 1.10406, 1, 1, 1, 1, 1,
1.382359, -0.7217255, 1.008346, 1, 1, 1, 1, 1,
1.382772, 0.5816259, 0.5232511, 0, 0, 1, 1, 1,
1.40407, 0.4300149, 1.849264, 1, 0, 0, 1, 1,
1.405895, 0.6471711, 1.174584, 1, 0, 0, 1, 1,
1.418382, 0.1602327, 1.002715, 1, 0, 0, 1, 1,
1.421055, 0.1310012, -0.3447076, 1, 0, 0, 1, 1,
1.435172, -0.5357013, 1.823005, 1, 0, 0, 1, 1,
1.444416, 0.1547232, 0.4519846, 0, 0, 0, 1, 1,
1.455614, -1.073313, 1.350242, 0, 0, 0, 1, 1,
1.466717, -1.878183, 2.54845, 0, 0, 0, 1, 1,
1.469703, 0.6163033, 1.270965, 0, 0, 0, 1, 1,
1.47876, 0.6254107, 2.673565, 0, 0, 0, 1, 1,
1.499806, -0.7577497, 1.917536, 0, 0, 0, 1, 1,
1.503907, -0.6019484, 2.376266, 0, 0, 0, 1, 1,
1.505112, -0.1511474, 1.98439, 1, 1, 1, 1, 1,
1.518881, -0.5895165, 3.315187, 1, 1, 1, 1, 1,
1.519174, -0.04646542, 1.839209, 1, 1, 1, 1, 1,
1.521705, -0.1899485, 1.731716, 1, 1, 1, 1, 1,
1.557652, 0.3393652, 1.434763, 1, 1, 1, 1, 1,
1.570391, -1.759007, 2.298367, 1, 1, 1, 1, 1,
1.605847, -0.03229387, 1.632202, 1, 1, 1, 1, 1,
1.631037, -0.4933515, 2.347312, 1, 1, 1, 1, 1,
1.640323, 1.132791, 1.11437, 1, 1, 1, 1, 1,
1.649602, 0.6709903, -0.3417379, 1, 1, 1, 1, 1,
1.685665, 0.3613512, 2.213096, 1, 1, 1, 1, 1,
1.712089, -1.096471, 1.012535, 1, 1, 1, 1, 1,
1.713292, -0.7716886, 2.136462, 1, 1, 1, 1, 1,
1.730741, 0.9123269, 0.197619, 1, 1, 1, 1, 1,
1.732762, -1.260945, 1.548904, 1, 1, 1, 1, 1,
1.755943, -0.8328351, 2.296056, 0, 0, 1, 1, 1,
1.768418, -0.3400857, 2.829794, 1, 0, 0, 1, 1,
1.789789, 0.123235, 1.144496, 1, 0, 0, 1, 1,
1.819759, -0.9379932, 2.513959, 1, 0, 0, 1, 1,
1.826081, -0.8743917, 3.028119, 1, 0, 0, 1, 1,
1.829477, 1.351807, 1.431476, 1, 0, 0, 1, 1,
1.83058, 0.7803272, 0.5149212, 0, 0, 0, 1, 1,
1.83123, -0.04206238, 1.164338, 0, 0, 0, 1, 1,
1.833005, 0.2389934, 2.817193, 0, 0, 0, 1, 1,
1.844623, 0.4916846, 2.196784, 0, 0, 0, 1, 1,
1.852305, 0.1819815, 0.6744735, 0, 0, 0, 1, 1,
1.860971, -1.400546, 2.15225, 0, 0, 0, 1, 1,
1.868745, 0.8924553, 2.445591, 0, 0, 0, 1, 1,
1.880803, 1.099287, 1.04041, 1, 1, 1, 1, 1,
1.922506, 0.3253422, 2.673755, 1, 1, 1, 1, 1,
1.957982, 0.3054632, 1.434845, 1, 1, 1, 1, 1,
1.969638, 1.002285, 0.1911144, 1, 1, 1, 1, 1,
2.037141, 0.6677499, 1.072695, 1, 1, 1, 1, 1,
2.044898, -0.3353628, 2.579834, 1, 1, 1, 1, 1,
2.047563, 0.8107301, 1.571249, 1, 1, 1, 1, 1,
2.049955, 1.133089, 2.120317, 1, 1, 1, 1, 1,
2.055918, 0.9149523, 1.702736, 1, 1, 1, 1, 1,
2.056113, 0.7658, 1.263178, 1, 1, 1, 1, 1,
2.108991, -0.5284589, 3.277421, 1, 1, 1, 1, 1,
2.148198, -1.072899, 3.140142, 1, 1, 1, 1, 1,
2.21583, 0.7039944, 1.494442, 1, 1, 1, 1, 1,
2.233974, -0.8180322, 0.4226726, 1, 1, 1, 1, 1,
2.242341, -1.184626, 1.535532, 1, 1, 1, 1, 1,
2.247223, -0.7140754, 1.763412, 0, 0, 1, 1, 1,
2.266968, -1.620924, 1.596114, 1, 0, 0, 1, 1,
2.338618, 1.095812, 0.3841597, 1, 0, 0, 1, 1,
2.338852, -3.488024, 3.51389, 1, 0, 0, 1, 1,
2.387448, 0.9992915, 0.09941652, 1, 0, 0, 1, 1,
2.415883, 0.2226347, 0.01943567, 1, 0, 0, 1, 1,
2.517512, 1.189736, 1.973886, 0, 0, 0, 1, 1,
2.551416, -2.578509, 1.829581, 0, 0, 0, 1, 1,
2.551778, -1.215083, 1.575565, 0, 0, 0, 1, 1,
2.577114, 1.326628, 1.172279, 0, 0, 0, 1, 1,
2.683171, -0.8974059, 2.238197, 0, 0, 0, 1, 1,
2.729549, -0.2964665, 1.890559, 0, 0, 0, 1, 1,
2.75404, -1.079774, 3.726521, 0, 0, 0, 1, 1,
2.762707, 0.8622564, 1.064049, 1, 1, 1, 1, 1,
2.855072, -0.1883734, 2.702932, 1, 1, 1, 1, 1,
2.861877, -0.157343, 1.10386, 1, 1, 1, 1, 1,
2.932952, 0.03181989, 1.44346, 1, 1, 1, 1, 1,
2.939496, 0.4273576, 1.242641, 1, 1, 1, 1, 1,
3.255532, -1.50129, 2.563492, 1, 1, 1, 1, 1,
3.525205, 0.1835078, 0.8062662, 1, 1, 1, 1, 1
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
var radius = 10.01625;
var distance = 35.18167;
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
mvMatrix.translate( -0.213382, 0.0739522, 0.06464124 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.18167);
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
