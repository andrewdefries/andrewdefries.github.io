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
-3.254832, -1.097697, -2.183774, 1, 0, 0, 1,
-2.999475, 1.81472, -2.425013, 1, 0.007843138, 0, 1,
-2.956008, 1.334428, -1.903656, 1, 0.01176471, 0, 1,
-2.839041, 0.8923342, -1.616996, 1, 0.01960784, 0, 1,
-2.449511, 0.4869978, -0.7911904, 1, 0.02352941, 0, 1,
-2.446237, -0.3698624, -2.282714, 1, 0.03137255, 0, 1,
-2.345945, 0.7677249, -0.9173965, 1, 0.03529412, 0, 1,
-2.330956, -1.010229, -1.027567, 1, 0.04313726, 0, 1,
-2.305354, -0.8960602, -1.979719, 1, 0.04705882, 0, 1,
-2.302438, 1.114275, 0.01148678, 1, 0.05490196, 0, 1,
-2.262848, -0.1406352, 0.335607, 1, 0.05882353, 0, 1,
-2.245149, -1.116718, -2.89108, 1, 0.06666667, 0, 1,
-2.212467, 1.104581, -1.831682, 1, 0.07058824, 0, 1,
-2.186632, 0.9174271, -0.1244814, 1, 0.07843138, 0, 1,
-2.134892, 1.111737, 1.24691, 1, 0.08235294, 0, 1,
-2.09779, 0.1097029, -1.774135, 1, 0.09019608, 0, 1,
-2.090698, -2.41639, -3.254255, 1, 0.09411765, 0, 1,
-2.068086, 0.2790526, -1.094038, 1, 0.1019608, 0, 1,
-2.002312, 0.250432, -1.283747, 1, 0.1098039, 0, 1,
-2.001323, -0.3948066, -2.279799, 1, 0.1137255, 0, 1,
-1.988622, 0.04549598, -1.239103, 1, 0.1215686, 0, 1,
-1.965453, 0.4720812, -3.407595, 1, 0.1254902, 0, 1,
-1.959059, -0.4657617, -0.91334, 1, 0.1333333, 0, 1,
-1.954362, -0.01894689, -2.482469, 1, 0.1372549, 0, 1,
-1.952138, -1.388355, -1.895116, 1, 0.145098, 0, 1,
-1.948277, -0.1513242, -0.5335368, 1, 0.1490196, 0, 1,
-1.934797, -0.5856565, -1.487487, 1, 0.1568628, 0, 1,
-1.910779, 1.342894, 0.1945057, 1, 0.1607843, 0, 1,
-1.903706, -0.4034255, -1.177512, 1, 0.1686275, 0, 1,
-1.88546, -0.572795, -2.166202, 1, 0.172549, 0, 1,
-1.87256, 0.1406527, -0.3862194, 1, 0.1803922, 0, 1,
-1.870037, -1.030291, -1.020976, 1, 0.1843137, 0, 1,
-1.855121, -1.323503, -1.171438, 1, 0.1921569, 0, 1,
-1.840563, -0.2227177, 0.6206207, 1, 0.1960784, 0, 1,
-1.82703, 0.9704304, -0.9857997, 1, 0.2039216, 0, 1,
-1.821099, -1.068302, -1.852275, 1, 0.2117647, 0, 1,
-1.820688, 1.934183, -2.080295, 1, 0.2156863, 0, 1,
-1.817146, 2.652294, 0.2275845, 1, 0.2235294, 0, 1,
-1.806115, -0.01367844, -1.820074, 1, 0.227451, 0, 1,
-1.786437, 0.6971678, -1.488256, 1, 0.2352941, 0, 1,
-1.770565, 0.01542857, 0.5101741, 1, 0.2392157, 0, 1,
-1.767923, 0.2295869, -2.416332, 1, 0.2470588, 0, 1,
-1.763459, 0.8610963, -2.312358, 1, 0.2509804, 0, 1,
-1.759235, -1.098092, -0.7713956, 1, 0.2588235, 0, 1,
-1.748051, -0.05269505, -1.737038, 1, 0.2627451, 0, 1,
-1.745201, 0.09628406, -1.723471, 1, 0.2705882, 0, 1,
-1.737635, 0.4564413, -1.709132, 1, 0.2745098, 0, 1,
-1.73407, 0.1500378, -1.602275, 1, 0.282353, 0, 1,
-1.728638, 0.1867481, -3.790524, 1, 0.2862745, 0, 1,
-1.727601, -3.1944, -2.167363, 1, 0.2941177, 0, 1,
-1.723993, -1.26969, -2.17963, 1, 0.3019608, 0, 1,
-1.707715, 1.926475, 0.01298653, 1, 0.3058824, 0, 1,
-1.704755, 0.8383445, -3.138131, 1, 0.3137255, 0, 1,
-1.700897, 0.08491172, -1.67568, 1, 0.3176471, 0, 1,
-1.683195, -0.9858499, -0.9405479, 1, 0.3254902, 0, 1,
-1.664396, -0.7135784, -3.590052, 1, 0.3294118, 0, 1,
-1.654414, -0.174335, -2.174473, 1, 0.3372549, 0, 1,
-1.642003, -0.8190461, -2.566421, 1, 0.3411765, 0, 1,
-1.617913, -0.2932914, -2.718172, 1, 0.3490196, 0, 1,
-1.611652, 0.4531378, -1.892963, 1, 0.3529412, 0, 1,
-1.611023, -1.142739, -2.685976, 1, 0.3607843, 0, 1,
-1.599455, -1.263182, -2.150676, 1, 0.3647059, 0, 1,
-1.598467, 0.02749466, -1.628906, 1, 0.372549, 0, 1,
-1.59517, 1.29773, 0.4414309, 1, 0.3764706, 0, 1,
-1.594366, 0.2652277, -1.176122, 1, 0.3843137, 0, 1,
-1.588993, 0.1768375, -3.485795, 1, 0.3882353, 0, 1,
-1.568787, -0.836623, -1.329422, 1, 0.3960784, 0, 1,
-1.556131, 1.107445, -2.808538, 1, 0.4039216, 0, 1,
-1.546256, -0.5681033, -1.410631, 1, 0.4078431, 0, 1,
-1.545814, 0.7698913, 0.5609592, 1, 0.4156863, 0, 1,
-1.529204, -1.733422, -3.002836, 1, 0.4196078, 0, 1,
-1.525812, 0.1876012, -1.250811, 1, 0.427451, 0, 1,
-1.520181, -0.4710985, -3.201746, 1, 0.4313726, 0, 1,
-1.515574, 0.3083256, -1.102509, 1, 0.4392157, 0, 1,
-1.511344, 0.558822, -0.7981671, 1, 0.4431373, 0, 1,
-1.508463, -1.322631, -1.343997, 1, 0.4509804, 0, 1,
-1.507844, -1.03427, -2.982717, 1, 0.454902, 0, 1,
-1.49205, -1.06194, -3.643418, 1, 0.4627451, 0, 1,
-1.491211, 1.212462, -2.38313, 1, 0.4666667, 0, 1,
-1.477619, -0.1336959, -3.666193, 1, 0.4745098, 0, 1,
-1.467245, 0.04116107, -1.437865, 1, 0.4784314, 0, 1,
-1.466425, 1.35608, -1.14879, 1, 0.4862745, 0, 1,
-1.464489, -0.3660763, -3.035674, 1, 0.4901961, 0, 1,
-1.45171, -1.707031, -2.76866, 1, 0.4980392, 0, 1,
-1.451519, 0.6567148, -1.270578, 1, 0.5058824, 0, 1,
-1.435508, 0.07443664, -1.761634, 1, 0.509804, 0, 1,
-1.433668, -0.05058556, -0.6894103, 1, 0.5176471, 0, 1,
-1.427881, -3.229276, -3.059651, 1, 0.5215687, 0, 1,
-1.41362, -0.6945623, -1.601027, 1, 0.5294118, 0, 1,
-1.411737, 0.9938905, -2.523474, 1, 0.5333334, 0, 1,
-1.40974, -0.5818963, -1.699398, 1, 0.5411765, 0, 1,
-1.40151, 0.3574497, -1.83142, 1, 0.5450981, 0, 1,
-1.383116, -0.421946, -1.696596, 1, 0.5529412, 0, 1,
-1.382899, 1.842297, 1.391108, 1, 0.5568628, 0, 1,
-1.368928, 0.3875797, -1.542271, 1, 0.5647059, 0, 1,
-1.368766, -0.9779322, -1.266879, 1, 0.5686275, 0, 1,
-1.368764, 0.5643802, -2.392763, 1, 0.5764706, 0, 1,
-1.367496, 0.8308995, -1.76619, 1, 0.5803922, 0, 1,
-1.365738, -1.061865, -2.694097, 1, 0.5882353, 0, 1,
-1.364159, 1.306431, 0.2628342, 1, 0.5921569, 0, 1,
-1.357967, -1.084155, -1.919334, 1, 0.6, 0, 1,
-1.346967, 1.433205, 0.9601464, 1, 0.6078432, 0, 1,
-1.340166, 1.946295, -1.687285, 1, 0.6117647, 0, 1,
-1.340131, 0.1809834, -2.558511, 1, 0.6196079, 0, 1,
-1.335802, 0.5311872, -1.33553, 1, 0.6235294, 0, 1,
-1.328386, -0.150437, -1.489065, 1, 0.6313726, 0, 1,
-1.318045, 0.01160952, -0.4468006, 1, 0.6352941, 0, 1,
-1.306955, 1.289488, 0.6115865, 1, 0.6431373, 0, 1,
-1.306353, 0.7290781, -3.354287, 1, 0.6470588, 0, 1,
-1.294843, 0.6784081, -0.8292649, 1, 0.654902, 0, 1,
-1.281638, 0.484257, -4.066283, 1, 0.6588235, 0, 1,
-1.280752, 1.430208, -1.008842, 1, 0.6666667, 0, 1,
-1.275737, 0.9080738, -1.077073, 1, 0.6705883, 0, 1,
-1.275458, -0.7130049, -1.382936, 1, 0.6784314, 0, 1,
-1.26407, -1.334157, -3.288466, 1, 0.682353, 0, 1,
-1.260368, 0.5274218, -2.072397, 1, 0.6901961, 0, 1,
-1.260156, 1.245521, -0.9639037, 1, 0.6941177, 0, 1,
-1.256076, 0.5653114, -2.14693, 1, 0.7019608, 0, 1,
-1.249226, 0.4928471, -0.9549463, 1, 0.7098039, 0, 1,
-1.24766, 1.432908, -0.3850626, 1, 0.7137255, 0, 1,
-1.240973, -0.6905268, -2.915393, 1, 0.7215686, 0, 1,
-1.230422, 1.92614, -2.808334, 1, 0.7254902, 0, 1,
-1.227867, 0.8019568, -2.627081, 1, 0.7333333, 0, 1,
-1.2257, 1.10712, -1.902681, 1, 0.7372549, 0, 1,
-1.205846, 1.27993, 0.4549311, 1, 0.7450981, 0, 1,
-1.198047, -0.479571, -0.6730627, 1, 0.7490196, 0, 1,
-1.197697, 0.02792619, -2.314377, 1, 0.7568628, 0, 1,
-1.19752, 0.3956205, -1.756064, 1, 0.7607843, 0, 1,
-1.196896, -1.30803, -2.558276, 1, 0.7686275, 0, 1,
-1.194364, -0.9674632, -2.668682, 1, 0.772549, 0, 1,
-1.186081, 1.007893, -1.736565, 1, 0.7803922, 0, 1,
-1.179798, -0.3820542, -1.671496, 1, 0.7843137, 0, 1,
-1.175359, 1.118805, 0.08604687, 1, 0.7921569, 0, 1,
-1.172083, 0.02215576, 0.7101032, 1, 0.7960784, 0, 1,
-1.170109, -0.1869271, -2.269999, 1, 0.8039216, 0, 1,
-1.169513, -1.048039, -2.881029, 1, 0.8117647, 0, 1,
-1.15895, -0.2997541, -1.67912, 1, 0.8156863, 0, 1,
-1.150603, -1.270157, -3.194529, 1, 0.8235294, 0, 1,
-1.146718, 0.2766396, -2.837927, 1, 0.827451, 0, 1,
-1.146689, 1.244801, -0.7170729, 1, 0.8352941, 0, 1,
-1.143252, -0.7071065, -3.622563, 1, 0.8392157, 0, 1,
-1.142337, 1.14133, -1.172642, 1, 0.8470588, 0, 1,
-1.139976, 0.01911965, -2.886578, 1, 0.8509804, 0, 1,
-1.13876, 0.08958233, 0.5950991, 1, 0.8588235, 0, 1,
-1.138548, 1.311713, 0.7164987, 1, 0.8627451, 0, 1,
-1.13657, 1.299536, -0.7847535, 1, 0.8705882, 0, 1,
-1.134144, -0.7251563, -0.3369583, 1, 0.8745098, 0, 1,
-1.123809, -1.032692, -1.839027, 1, 0.8823529, 0, 1,
-1.119181, -2.304061, -2.62258, 1, 0.8862745, 0, 1,
-1.105687, -1.982343, -0.8575515, 1, 0.8941177, 0, 1,
-1.102602, 1.480431, -0.1032404, 1, 0.8980392, 0, 1,
-1.101694, -2.047355, -2.327316, 1, 0.9058824, 0, 1,
-1.084184, -1.717601, -2.106516, 1, 0.9137255, 0, 1,
-1.073141, 1.949799, 0.3271582, 1, 0.9176471, 0, 1,
-1.068693, -0.1410835, -0.4193636, 1, 0.9254902, 0, 1,
-1.068137, 2.48471, -0.4932362, 1, 0.9294118, 0, 1,
-1.059245, -1.17569, -2.062911, 1, 0.9372549, 0, 1,
-1.041195, -0.1423928, -1.675491, 1, 0.9411765, 0, 1,
-1.032823, 0.4102273, -0.8931625, 1, 0.9490196, 0, 1,
-1.03198, 1.595843, -1.270325, 1, 0.9529412, 0, 1,
-1.02966, 0.06626863, -1.150016, 1, 0.9607843, 0, 1,
-1.024292, -1.569701, -1.823247, 1, 0.9647059, 0, 1,
-1.014721, -1.547821, -2.091692, 1, 0.972549, 0, 1,
-1.01394, -2.403497, -0.8299021, 1, 0.9764706, 0, 1,
-1.012008, 1.098124, -2.251798, 1, 0.9843137, 0, 1,
-1.011628, -0.742016, -2.335207, 1, 0.9882353, 0, 1,
-1.010416, -0.9758328, -2.863539, 1, 0.9960784, 0, 1,
-1.000076, -0.8182827, -2.179418, 0.9960784, 1, 0, 1,
-0.9979128, 2.45994, -1.398581, 0.9921569, 1, 0, 1,
-0.9977501, 1.502255, -0.4703518, 0.9843137, 1, 0, 1,
-0.9973683, 0.07560734, -1.890183, 0.9803922, 1, 0, 1,
-0.9948378, -0.4189424, -0.7637183, 0.972549, 1, 0, 1,
-0.9907081, 0.06270467, -1.345695, 0.9686275, 1, 0, 1,
-0.9898049, 0.6030877, -0.7121688, 0.9607843, 1, 0, 1,
-0.9867201, 1.149499, -0.803431, 0.9568627, 1, 0, 1,
-0.9852822, -1.572789, -0.8294925, 0.9490196, 1, 0, 1,
-0.9840475, -1.325469, -2.662235, 0.945098, 1, 0, 1,
-0.9836855, -0.1459831, -0.2858421, 0.9372549, 1, 0, 1,
-0.9799209, -0.3844079, -2.550711, 0.9333333, 1, 0, 1,
-0.9778161, -0.3466525, -1.324767, 0.9254902, 1, 0, 1,
-0.9747503, -0.8258348, -0.7206231, 0.9215686, 1, 0, 1,
-0.9738714, -0.112667, -1.233837, 0.9137255, 1, 0, 1,
-0.9686905, -1.690901, -2.743527, 0.9098039, 1, 0, 1,
-0.9668943, -0.4895745, -2.143237, 0.9019608, 1, 0, 1,
-0.9662575, -0.9901057, -1.95451, 0.8941177, 1, 0, 1,
-0.9567954, 0.5595643, -0.5801055, 0.8901961, 1, 0, 1,
-0.9542828, -0.1914607, -0.3559434, 0.8823529, 1, 0, 1,
-0.9494199, 1.245573, -0.3202913, 0.8784314, 1, 0, 1,
-0.9463086, -0.01150986, -3.297533, 0.8705882, 1, 0, 1,
-0.9450537, -0.9000655, -4.526021, 0.8666667, 1, 0, 1,
-0.9421894, 0.3782654, -0.7583243, 0.8588235, 1, 0, 1,
-0.9406008, 1.051232, 0.8044144, 0.854902, 1, 0, 1,
-0.9312237, -0.655596, -3.670777, 0.8470588, 1, 0, 1,
-0.929711, 0.6094429, -1.343672, 0.8431373, 1, 0, 1,
-0.9283096, -0.1759696, 0.8947092, 0.8352941, 1, 0, 1,
-0.926457, -0.3240464, -1.5335, 0.8313726, 1, 0, 1,
-0.9193943, 0.02598615, -2.076997, 0.8235294, 1, 0, 1,
-0.9149277, 1.521296, 0.483717, 0.8196079, 1, 0, 1,
-0.9036584, -0.2706947, -1.50758, 0.8117647, 1, 0, 1,
-0.8965609, -0.958636, -3.042704, 0.8078431, 1, 0, 1,
-0.8951687, 0.8856413, -1.227519, 0.8, 1, 0, 1,
-0.8921756, 0.04363241, -1.554556, 0.7921569, 1, 0, 1,
-0.8918913, -0.7814842, -1.931586, 0.7882353, 1, 0, 1,
-0.8891121, 0.2574914, -0.6577133, 0.7803922, 1, 0, 1,
-0.8879452, 0.9698355, -0.8030984, 0.7764706, 1, 0, 1,
-0.8784768, -0.182826, -1.771806, 0.7686275, 1, 0, 1,
-0.8756689, -0.5445315, -0.9866575, 0.7647059, 1, 0, 1,
-0.875185, 1.131083, 0.1319526, 0.7568628, 1, 0, 1,
-0.8684696, 0.07480851, -2.035838, 0.7529412, 1, 0, 1,
-0.8672509, -0.4298269, -1.977329, 0.7450981, 1, 0, 1,
-0.8595156, -0.7744803, -2.257372, 0.7411765, 1, 0, 1,
-0.857057, 1.305472, -0.4591067, 0.7333333, 1, 0, 1,
-0.8565382, 0.8138004, 0.01565284, 0.7294118, 1, 0, 1,
-0.8494053, -0.548384, -1.893423, 0.7215686, 1, 0, 1,
-0.847344, -0.03097708, -1.866432, 0.7176471, 1, 0, 1,
-0.8429571, -0.986116, -3.282996, 0.7098039, 1, 0, 1,
-0.8373094, -0.8044471, -0.7948695, 0.7058824, 1, 0, 1,
-0.8230289, -1.3888, -2.69709, 0.6980392, 1, 0, 1,
-0.8223665, -1.134462, -1.90143, 0.6901961, 1, 0, 1,
-0.811345, 0.1384052, -1.560253, 0.6862745, 1, 0, 1,
-0.8109258, -0.2954176, 0.5287794, 0.6784314, 1, 0, 1,
-0.8070292, 0.9811971, -0.5131328, 0.6745098, 1, 0, 1,
-0.8013507, -0.9704617, -2.416158, 0.6666667, 1, 0, 1,
-0.797164, 1.770429, 1.445049, 0.6627451, 1, 0, 1,
-0.7968671, 0.6497009, -1.45383, 0.654902, 1, 0, 1,
-0.7964047, 1.285097, 0.5722227, 0.6509804, 1, 0, 1,
-0.7950832, -1.484308, -2.204937, 0.6431373, 1, 0, 1,
-0.795064, 0.2278242, 0.3127676, 0.6392157, 1, 0, 1,
-0.7862846, 0.6145998, 0.04559523, 0.6313726, 1, 0, 1,
-0.7853171, 0.673943, -1.572654, 0.627451, 1, 0, 1,
-0.7805454, 0.4731424, 0.9219206, 0.6196079, 1, 0, 1,
-0.7784529, 0.696654, -0.1578041, 0.6156863, 1, 0, 1,
-0.7761731, -0.4470088, -0.876102, 0.6078432, 1, 0, 1,
-0.7660749, 1.084216, -1.677434, 0.6039216, 1, 0, 1,
-0.7632754, 1.374353, 0.240519, 0.5960785, 1, 0, 1,
-0.7628397, -0.06943587, -1.320038, 0.5882353, 1, 0, 1,
-0.7598959, -0.9152591, -1.970691, 0.5843138, 1, 0, 1,
-0.7502785, -0.4174003, -1.338297, 0.5764706, 1, 0, 1,
-0.7439077, -1.142282, -1.536396, 0.572549, 1, 0, 1,
-0.7386485, -0.6322622, -2.783296, 0.5647059, 1, 0, 1,
-0.7365996, 1.250709, -0.9993581, 0.5607843, 1, 0, 1,
-0.7341881, -0.6082572, -2.110555, 0.5529412, 1, 0, 1,
-0.726247, 0.6981081, -2.221318, 0.5490196, 1, 0, 1,
-0.7257216, 0.1088731, -3.561861, 0.5411765, 1, 0, 1,
-0.7099739, 0.4975877, -3.09344, 0.5372549, 1, 0, 1,
-0.7079527, 0.2553965, -1.989147, 0.5294118, 1, 0, 1,
-0.7021992, 1.488474, -1.183295, 0.5254902, 1, 0, 1,
-0.6997558, 1.141846, -2.463133, 0.5176471, 1, 0, 1,
-0.6987921, 2.470986, 0.1240124, 0.5137255, 1, 0, 1,
-0.6983419, -0.8252239, -1.054081, 0.5058824, 1, 0, 1,
-0.6972276, 2.430635, -1.757397, 0.5019608, 1, 0, 1,
-0.6966815, 0.7521769, 0.1199357, 0.4941176, 1, 0, 1,
-0.6935518, -0.6245974, -2.340399, 0.4862745, 1, 0, 1,
-0.6921022, 0.09226996, -2.610391, 0.4823529, 1, 0, 1,
-0.6813905, -1.36215, -3.319874, 0.4745098, 1, 0, 1,
-0.6747563, 0.9627486, 0.3060468, 0.4705882, 1, 0, 1,
-0.6726015, 0.872825, 0.3346551, 0.4627451, 1, 0, 1,
-0.6714357, -1.237596, -1.944255, 0.4588235, 1, 0, 1,
-0.6703464, -1.493961, -3.45103, 0.4509804, 1, 0, 1,
-0.6646276, -0.199232, -2.916091, 0.4470588, 1, 0, 1,
-0.6637458, 0.4336558, -0.682968, 0.4392157, 1, 0, 1,
-0.6617647, 0.9656865, 0.8646154, 0.4352941, 1, 0, 1,
-0.6564111, 0.4131035, 0.7172198, 0.427451, 1, 0, 1,
-0.6447579, -0.801329, -2.783835, 0.4235294, 1, 0, 1,
-0.644033, -1.449522, -1.577319, 0.4156863, 1, 0, 1,
-0.6411365, -0.5163246, -2.174331, 0.4117647, 1, 0, 1,
-0.6348051, -0.1816303, -1.663796, 0.4039216, 1, 0, 1,
-0.6338241, -0.2008507, -2.982139, 0.3960784, 1, 0, 1,
-0.6335754, 0.6972741, 1.056377, 0.3921569, 1, 0, 1,
-0.6312672, 0.8129226, -0.9620705, 0.3843137, 1, 0, 1,
-0.6308488, -0.1208928, -2.5107, 0.3803922, 1, 0, 1,
-0.6298648, 0.7997868, -0.9822536, 0.372549, 1, 0, 1,
-0.6287177, -0.9285801, -2.507918, 0.3686275, 1, 0, 1,
-0.6286394, 0.7540472, 0.2165607, 0.3607843, 1, 0, 1,
-0.6219044, -0.59824, -2.489546, 0.3568628, 1, 0, 1,
-0.6217039, -0.1615593, -1.100711, 0.3490196, 1, 0, 1,
-0.6102979, -0.3553781, -1.228125, 0.345098, 1, 0, 1,
-0.609765, 0.6550394, -1.526158, 0.3372549, 1, 0, 1,
-0.6096717, -1.082558, -2.188966, 0.3333333, 1, 0, 1,
-0.6094696, -0.331319, -1.588696, 0.3254902, 1, 0, 1,
-0.6054674, -1.138022, -0.8375906, 0.3215686, 1, 0, 1,
-0.6050149, 0.01997527, -0.2271916, 0.3137255, 1, 0, 1,
-0.6028836, 0.9204766, -1.937824, 0.3098039, 1, 0, 1,
-0.590732, 0.1465413, -0.6864331, 0.3019608, 1, 0, 1,
-0.5871078, 1.543848, -0.461316, 0.2941177, 1, 0, 1,
-0.5826178, 0.008039032, 0.3573324, 0.2901961, 1, 0, 1,
-0.5809587, 0.6824119, -1.075636, 0.282353, 1, 0, 1,
-0.5759368, 1.196912, 1.205091, 0.2784314, 1, 0, 1,
-0.5730472, -0.904662, -1.70814, 0.2705882, 1, 0, 1,
-0.5713348, 0.8281991, 0.1898402, 0.2666667, 1, 0, 1,
-0.558645, -0.9185206, -2.082738, 0.2588235, 1, 0, 1,
-0.5551444, 0.8244089, -1.776031, 0.254902, 1, 0, 1,
-0.5539123, -1.249991, -1.145841, 0.2470588, 1, 0, 1,
-0.5530525, -0.219483, -2.11803, 0.2431373, 1, 0, 1,
-0.5511692, 1.132252, 0.2211674, 0.2352941, 1, 0, 1,
-0.5510806, -0.3772705, -2.125605, 0.2313726, 1, 0, 1,
-0.5492664, -0.7712054, -1.567026, 0.2235294, 1, 0, 1,
-0.5491772, -0.4193888, -1.916952, 0.2196078, 1, 0, 1,
-0.5439546, -2.575061, -2.402256, 0.2117647, 1, 0, 1,
-0.5429018, -1.973879, -1.369337, 0.2078431, 1, 0, 1,
-0.5373316, -0.8803775, -1.450518, 0.2, 1, 0, 1,
-0.5356654, -0.7108456, -2.993225, 0.1921569, 1, 0, 1,
-0.5324108, 0.1913195, -0.6383967, 0.1882353, 1, 0, 1,
-0.5308177, -0.5209795, -1.110137, 0.1803922, 1, 0, 1,
-0.5305602, -0.3239795, -1.660679, 0.1764706, 1, 0, 1,
-0.5282356, -1.164046, -4.015626, 0.1686275, 1, 0, 1,
-0.5254652, 0.7333645, 0.7540734, 0.1647059, 1, 0, 1,
-0.524288, 0.6391938, -0.6427696, 0.1568628, 1, 0, 1,
-0.5139346, 0.8458763, -0.7188803, 0.1529412, 1, 0, 1,
-0.5073271, -1.19151, -4.279837, 0.145098, 1, 0, 1,
-0.5069155, 1.49553, -0.4641474, 0.1411765, 1, 0, 1,
-0.506213, 0.121277, -1.142106, 0.1333333, 1, 0, 1,
-0.5056803, 0.120755, -1.681769, 0.1294118, 1, 0, 1,
-0.5056385, 0.2382531, -0.1178129, 0.1215686, 1, 0, 1,
-0.5054312, -1.433523, -3.16434, 0.1176471, 1, 0, 1,
-0.5045471, -1.029867, -3.660465, 0.1098039, 1, 0, 1,
-0.5024407, 0.02880728, -1.914353, 0.1058824, 1, 0, 1,
-0.501855, 0.229588, -2.943316, 0.09803922, 1, 0, 1,
-0.4996538, 0.1664502, -2.238297, 0.09019608, 1, 0, 1,
-0.4978961, 0.2506462, -1.882352, 0.08627451, 1, 0, 1,
-0.4974889, -0.6706612, -2.460181, 0.07843138, 1, 0, 1,
-0.4948231, -1.514314, -1.248661, 0.07450981, 1, 0, 1,
-0.4944188, -0.7695053, -1.700336, 0.06666667, 1, 0, 1,
-0.4820306, -1.651324, -2.379541, 0.0627451, 1, 0, 1,
-0.480217, -1.024349, -3.474013, 0.05490196, 1, 0, 1,
-0.4790311, -1.046464, -1.235624, 0.05098039, 1, 0, 1,
-0.4764586, 1.326391, -0.4048063, 0.04313726, 1, 0, 1,
-0.4694651, -0.3842613, -2.141283, 0.03921569, 1, 0, 1,
-0.4672744, 1.089529, -1.335562, 0.03137255, 1, 0, 1,
-0.4589613, 0.03287334, -1.405867, 0.02745098, 1, 0, 1,
-0.4573254, -1.655922, -4.420326, 0.01960784, 1, 0, 1,
-0.4497293, 1.006069, -1.053801, 0.01568628, 1, 0, 1,
-0.4445623, -0.135818, -0.9824673, 0.007843138, 1, 0, 1,
-0.4435486, 0.3625125, -0.5955524, 0.003921569, 1, 0, 1,
-0.4401956, 0.8259451, 0.9737387, 0, 1, 0.003921569, 1,
-0.4377085, 0.9335689, -0.9281116, 0, 1, 0.01176471, 1,
-0.4354015, 0.8080298, -0.3853596, 0, 1, 0.01568628, 1,
-0.4322537, -1.049987, -2.214624, 0, 1, 0.02352941, 1,
-0.4276176, 0.9357833, -1.823348, 0, 1, 0.02745098, 1,
-0.4272553, -0.9603806, -3.22876, 0, 1, 0.03529412, 1,
-0.4272053, 0.6252154, 0.07975978, 0, 1, 0.03921569, 1,
-0.4212419, 1.522571, 0.8348776, 0, 1, 0.04705882, 1,
-0.416976, -3.115943, -2.489451, 0, 1, 0.05098039, 1,
-0.4114696, 1.553999, 0.7825209, 0, 1, 0.05882353, 1,
-0.4053661, -0.4803863, -1.176439, 0, 1, 0.0627451, 1,
-0.404817, -1.236298, -2.965445, 0, 1, 0.07058824, 1,
-0.4041539, -0.503729, -2.052935, 0, 1, 0.07450981, 1,
-0.4037237, 0.5767058, 0.2098724, 0, 1, 0.08235294, 1,
-0.4025554, -0.1470959, -0.6349923, 0, 1, 0.08627451, 1,
-0.4025314, -0.8045748, -2.081301, 0, 1, 0.09411765, 1,
-0.4015049, 1.051915, -2.753301, 0, 1, 0.1019608, 1,
-0.4014166, 1.406118, -0.1566287, 0, 1, 0.1058824, 1,
-0.3937416, -1.380408, -2.696739, 0, 1, 0.1137255, 1,
-0.3936585, 0.5176197, 0.2095879, 0, 1, 0.1176471, 1,
-0.3907878, -1.111716, -3.52453, 0, 1, 0.1254902, 1,
-0.3852432, -0.5742267, -1.229444, 0, 1, 0.1294118, 1,
-0.3764812, 0.03578977, -1.764534, 0, 1, 0.1372549, 1,
-0.376385, -0.8459948, -1.889238, 0, 1, 0.1411765, 1,
-0.3758704, 2.237516, -1.073727, 0, 1, 0.1490196, 1,
-0.3742993, -0.3018792, -1.512987, 0, 1, 0.1529412, 1,
-0.3742782, -0.7053615, -1.676323, 0, 1, 0.1607843, 1,
-0.3741299, -0.3452773, -1.628442, 0, 1, 0.1647059, 1,
-0.3730397, -0.4061832, -2.141385, 0, 1, 0.172549, 1,
-0.3709041, 1.453577, 1.813545, 0, 1, 0.1764706, 1,
-0.3698606, 0.8256834, -0.03326757, 0, 1, 0.1843137, 1,
-0.3686791, 0.5886154, -1.012783, 0, 1, 0.1882353, 1,
-0.364022, -0.5945517, -3.151574, 0, 1, 0.1960784, 1,
-0.360763, 2.048514, 1.622541, 0, 1, 0.2039216, 1,
-0.3591287, -0.8495694, -1.441536, 0, 1, 0.2078431, 1,
-0.3581572, 0.2771831, -2.382221, 0, 1, 0.2156863, 1,
-0.3579623, -2.257706, -2.656992, 0, 1, 0.2196078, 1,
-0.3537457, 1.804484, -0.6965216, 0, 1, 0.227451, 1,
-0.3495818, 0.1376379, -2.148054, 0, 1, 0.2313726, 1,
-0.3479919, -0.2559461, -2.999694, 0, 1, 0.2392157, 1,
-0.3478465, -0.3501071, -2.586317, 0, 1, 0.2431373, 1,
-0.3465936, -0.3204741, -1.337103, 0, 1, 0.2509804, 1,
-0.3419465, -1.3508, -2.392736, 0, 1, 0.254902, 1,
-0.3396505, 0.009735606, 0.7313656, 0, 1, 0.2627451, 1,
-0.3382981, 1.310587, 0.8532639, 0, 1, 0.2666667, 1,
-0.3378283, 0.1757967, 0.3260363, 0, 1, 0.2745098, 1,
-0.3377346, -1.871091, -2.868636, 0, 1, 0.2784314, 1,
-0.3315691, -1.343218, -2.745752, 0, 1, 0.2862745, 1,
-0.3256857, 0.1439522, -0.1033236, 0, 1, 0.2901961, 1,
-0.3234716, -0.408153, -1.012221, 0, 1, 0.2980392, 1,
-0.3157746, -0.7508696, -4.016068, 0, 1, 0.3058824, 1,
-0.3137535, -0.4007173, -1.123341, 0, 1, 0.3098039, 1,
-0.3107359, 0.8516103, -0.6538866, 0, 1, 0.3176471, 1,
-0.3098878, 1.876325, 1.275071, 0, 1, 0.3215686, 1,
-0.3090763, 0.2398338, 1.166062, 0, 1, 0.3294118, 1,
-0.3070439, -1.275787, -4.13638, 0, 1, 0.3333333, 1,
-0.3031816, 1.009097, -0.2860143, 0, 1, 0.3411765, 1,
-0.3024383, -1.061609, -3.775321, 0, 1, 0.345098, 1,
-0.3021412, 0.276806, -0.6063876, 0, 1, 0.3529412, 1,
-0.3006918, -1.672766, -3.520436, 0, 1, 0.3568628, 1,
-0.3006729, -0.1289642, -2.682067, 0, 1, 0.3647059, 1,
-0.2993043, -1.323078, -2.694448, 0, 1, 0.3686275, 1,
-0.2990686, -1.044302, -4.017315, 0, 1, 0.3764706, 1,
-0.2988918, 1.01878, 0.1435191, 0, 1, 0.3803922, 1,
-0.2981494, 1.52611, -0.236997, 0, 1, 0.3882353, 1,
-0.2900786, -0.5527307, -1.363108, 0, 1, 0.3921569, 1,
-0.2857035, 0.4680299, -1.427363, 0, 1, 0.4, 1,
-0.2783886, 0.60207, 0.7879874, 0, 1, 0.4078431, 1,
-0.2770407, -0.6761876, -2.320353, 0, 1, 0.4117647, 1,
-0.2638156, -1.055982, -4.654315, 0, 1, 0.4196078, 1,
-0.2613018, 1.696122, -1.386978, 0, 1, 0.4235294, 1,
-0.2592281, -0.7083982, -2.129608, 0, 1, 0.4313726, 1,
-0.2586878, -1.471765, -2.31129, 0, 1, 0.4352941, 1,
-0.2579007, -0.7722024, -1.8433, 0, 1, 0.4431373, 1,
-0.2569194, -0.01859537, -3.538471, 0, 1, 0.4470588, 1,
-0.2565472, -0.3832091, -4.180954, 0, 1, 0.454902, 1,
-0.2537011, 0.03892802, -1.877867, 0, 1, 0.4588235, 1,
-0.24571, -0.4635058, 0.08502655, 0, 1, 0.4666667, 1,
-0.2397974, 1.286451, 0.521564, 0, 1, 0.4705882, 1,
-0.2375762, 0.4065631, -1.094671, 0, 1, 0.4784314, 1,
-0.2175127, -0.4161927, -2.609089, 0, 1, 0.4823529, 1,
-0.2153759, 0.6648626, -0.5904891, 0, 1, 0.4901961, 1,
-0.2147528, -1.541968, -2.831961, 0, 1, 0.4941176, 1,
-0.2100152, -1.531784, -3.383979, 0, 1, 0.5019608, 1,
-0.2096307, 0.2920511, 0.3395689, 0, 1, 0.509804, 1,
-0.2072517, 0.727451, -2.369043, 0, 1, 0.5137255, 1,
-0.2058162, 1.509807, 0.3411161, 0, 1, 0.5215687, 1,
-0.1937694, -1.216181, -2.636861, 0, 1, 0.5254902, 1,
-0.1935726, 1.384102, -0.9751992, 0, 1, 0.5333334, 1,
-0.1930289, -1.426918, -3.262008, 0, 1, 0.5372549, 1,
-0.1917325, 1.660142, -1.118293, 0, 1, 0.5450981, 1,
-0.1908791, -1.141275, -1.170155, 0, 1, 0.5490196, 1,
-0.1901787, 1.805336, 0.8397522, 0, 1, 0.5568628, 1,
-0.180787, 0.8281022, -0.5577322, 0, 1, 0.5607843, 1,
-0.1799155, -0.5216119, -3.070809, 0, 1, 0.5686275, 1,
-0.1787876, -0.2621385, -2.805387, 0, 1, 0.572549, 1,
-0.1783874, -2.843252, -3.433066, 0, 1, 0.5803922, 1,
-0.1781442, -1.536165, -2.432819, 0, 1, 0.5843138, 1,
-0.1774449, 0.5666668, -0.6031128, 0, 1, 0.5921569, 1,
-0.1764684, 0.3844591, 1.054865, 0, 1, 0.5960785, 1,
-0.1733156, -0.6041755, -1.625214, 0, 1, 0.6039216, 1,
-0.1679163, -0.8747849, -2.402024, 0, 1, 0.6117647, 1,
-0.1648113, -0.2339223, -1.834966, 0, 1, 0.6156863, 1,
-0.1623867, 0.769694, -0.1966157, 0, 1, 0.6235294, 1,
-0.1576931, -0.7955998, -4.019041, 0, 1, 0.627451, 1,
-0.1574518, -0.2815337, -1.712663, 0, 1, 0.6352941, 1,
-0.1541703, 1.703254, 0.7769816, 0, 1, 0.6392157, 1,
-0.1511585, -1.235695, -4.554841, 0, 1, 0.6470588, 1,
-0.1499517, 0.9120419, -0.3146505, 0, 1, 0.6509804, 1,
-0.1498943, -0.4877782, -3.495129, 0, 1, 0.6588235, 1,
-0.1482387, 1.376796, 0.5415531, 0, 1, 0.6627451, 1,
-0.148092, 1.533026, 0.1364794, 0, 1, 0.6705883, 1,
-0.1471576, 0.6129645, -0.8263872, 0, 1, 0.6745098, 1,
-0.1470891, -0.0630253, -1.180838, 0, 1, 0.682353, 1,
-0.1459579, 0.0207302, -3.000782, 0, 1, 0.6862745, 1,
-0.1457055, -1.939973, -4.276977, 0, 1, 0.6941177, 1,
-0.1447237, 1.289894, -0.4408535, 0, 1, 0.7019608, 1,
-0.1424834, -0.511457, -4.146638, 0, 1, 0.7058824, 1,
-0.1415894, 1.404688, 0.9033906, 0, 1, 0.7137255, 1,
-0.141049, -1.203911, -1.610614, 0, 1, 0.7176471, 1,
-0.1363397, 1.689017, -0.4526675, 0, 1, 0.7254902, 1,
-0.1360834, -0.06710756, -1.954455, 0, 1, 0.7294118, 1,
-0.1303056, -0.3996365, -3.31002, 0, 1, 0.7372549, 1,
-0.1299269, 0.1062878, -1.503347, 0, 1, 0.7411765, 1,
-0.1282292, 0.4265418, -1.015038, 0, 1, 0.7490196, 1,
-0.1236711, 0.1152836, -0.7906238, 0, 1, 0.7529412, 1,
-0.1219297, 0.292645, -1.315457, 0, 1, 0.7607843, 1,
-0.1194656, 0.6682176, 0.7634346, 0, 1, 0.7647059, 1,
-0.1188121, -0.3825355, -0.6215066, 0, 1, 0.772549, 1,
-0.1176944, 0.6837337, -0.8717015, 0, 1, 0.7764706, 1,
-0.1149734, 1.806291, -0.3739024, 0, 1, 0.7843137, 1,
-0.112851, 1.471232, -0.3360752, 0, 1, 0.7882353, 1,
-0.1126628, 1.964759, -0.5341759, 0, 1, 0.7960784, 1,
-0.1123319, -0.1806298, -2.885989, 0, 1, 0.8039216, 1,
-0.1104044, 0.1464275, 1.020058, 0, 1, 0.8078431, 1,
-0.1053897, 0.2057932, -0.6425259, 0, 1, 0.8156863, 1,
-0.1039032, -0.4212421, -2.396642, 0, 1, 0.8196079, 1,
-0.1015292, 0.4223614, 0.4156511, 0, 1, 0.827451, 1,
-0.1013709, -0.182175, -3.478713, 0, 1, 0.8313726, 1,
-0.0965401, 0.3795089, -1.703305, 0, 1, 0.8392157, 1,
-0.09458154, 0.7520461, -0.7829584, 0, 1, 0.8431373, 1,
-0.08970777, 0.3279788, 0.533595, 0, 1, 0.8509804, 1,
-0.08860608, -0.1111127, -3.356341, 0, 1, 0.854902, 1,
-0.08738257, 0.6019546, 0.6128153, 0, 1, 0.8627451, 1,
-0.08610106, 0.1901001, 0.3736242, 0, 1, 0.8666667, 1,
-0.08440579, 0.5206169, -0.4950246, 0, 1, 0.8745098, 1,
-0.08366624, -1.79441, -4.113969, 0, 1, 0.8784314, 1,
-0.0825946, 1.150918, -1.138839, 0, 1, 0.8862745, 1,
-0.08105841, -1.288606, -2.830464, 0, 1, 0.8901961, 1,
-0.07732908, 1.626639, 0.7666328, 0, 1, 0.8980392, 1,
-0.07320815, -0.6494594, -2.315441, 0, 1, 0.9058824, 1,
-0.07262472, 1.502696, -0.9770705, 0, 1, 0.9098039, 1,
-0.07079146, -0.2247829, -3.309443, 0, 1, 0.9176471, 1,
-0.06981769, 0.0929789, -0.01840993, 0, 1, 0.9215686, 1,
-0.06933725, -0.9469243, -4.531542, 0, 1, 0.9294118, 1,
-0.06468423, 1.254649, 1.232056, 0, 1, 0.9333333, 1,
-0.06405456, -0.1944709, -0.6502139, 0, 1, 0.9411765, 1,
-0.05663684, 0.3647615, -1.113046, 0, 1, 0.945098, 1,
-0.04897773, 2.261091, -0.2719497, 0, 1, 0.9529412, 1,
-0.04894897, 0.131594, -1.096732, 0, 1, 0.9568627, 1,
-0.04755899, 0.7996884, -0.4180505, 0, 1, 0.9647059, 1,
-0.04387529, 0.9610667, 0.965278, 0, 1, 0.9686275, 1,
-0.03730874, 0.330038, 0.8357061, 0, 1, 0.9764706, 1,
-0.03691556, 1.753335, -2.299335, 0, 1, 0.9803922, 1,
-0.03301752, 0.02858414, -0.7506164, 0, 1, 0.9882353, 1,
-0.03188524, -0.905212, -2.408969, 0, 1, 0.9921569, 1,
-0.02712418, 0.6926214, -0.7771932, 0, 1, 1, 1,
-0.0245586, 0.7165299, 0.7104875, 0, 0.9921569, 1, 1,
-0.0242281, -0.38864, -3.616067, 0, 0.9882353, 1, 1,
-0.02117886, -0.4616889, -3.011351, 0, 0.9803922, 1, 1,
-0.01830859, -0.5734406, -3.964489, 0, 0.9764706, 1, 1,
-0.01825972, 0.0001930348, -0.9398709, 0, 0.9686275, 1, 1,
-0.0182221, 0.1191909, 0.717288, 0, 0.9647059, 1, 1,
-0.01744537, -0.4165844, -1.730506, 0, 0.9568627, 1, 1,
-0.01325858, -0.7646716, -3.50938, 0, 0.9529412, 1, 1,
-0.00951293, 0.1708945, 0.6206492, 0, 0.945098, 1, 1,
-0.006637356, -1.667564, -3.803142, 0, 0.9411765, 1, 1,
-0.005876204, 0.6604596, -1.356627, 0, 0.9333333, 1, 1,
-0.003527416, -0.03095263, -2.605974, 0, 0.9294118, 1, 1,
-0.002149493, -1.28145, -3.459137, 0, 0.9215686, 1, 1,
-0.001516846, 0.7390395, 0.1175795, 0, 0.9176471, 1, 1,
-0.001411018, 0.1282817, 0.03614406, 0, 0.9098039, 1, 1,
0.007964707, 0.4246105, -0.3623824, 0, 0.9058824, 1, 1,
0.008090453, 0.6888051, -1.134888, 0, 0.8980392, 1, 1,
0.009873981, 0.1755547, -0.6217473, 0, 0.8901961, 1, 1,
0.01168857, 0.2225981, 0.1993926, 0, 0.8862745, 1, 1,
0.01328012, 2.214344, 2.029388, 0, 0.8784314, 1, 1,
0.01456591, -1.610368, 3.195147, 0, 0.8745098, 1, 1,
0.01903873, -0.3551447, 2.618224, 0, 0.8666667, 1, 1,
0.01943002, -0.08841068, 3.379301, 0, 0.8627451, 1, 1,
0.01949448, 1.292294, 0.1612628, 0, 0.854902, 1, 1,
0.02152113, -2.097641, 2.683233, 0, 0.8509804, 1, 1,
0.03052056, 0.3950765, -2.213485, 0, 0.8431373, 1, 1,
0.03052495, 0.2468776, 0.6698317, 0, 0.8392157, 1, 1,
0.03401266, -1.153731, 3.053294, 0, 0.8313726, 1, 1,
0.03613696, 0.3427239, 0.6038666, 0, 0.827451, 1, 1,
0.03759107, 1.325695, -0.3136418, 0, 0.8196079, 1, 1,
0.03968679, 1.342241, -0.4048531, 0, 0.8156863, 1, 1,
0.04371262, -0.3311218, 3.477129, 0, 0.8078431, 1, 1,
0.04530879, -1.16295, 5.386448, 0, 0.8039216, 1, 1,
0.04550244, -0.4491917, 4.233116, 0, 0.7960784, 1, 1,
0.04664349, 0.130291, 0.4624604, 0, 0.7882353, 1, 1,
0.05374507, 0.001084826, 0.7486356, 0, 0.7843137, 1, 1,
0.05549652, -0.4100145, 2.236689, 0, 0.7764706, 1, 1,
0.05607572, 0.3638923, 0.2678941, 0, 0.772549, 1, 1,
0.06194806, -0.09265957, 2.774776, 0, 0.7647059, 1, 1,
0.06200326, -0.388213, 4.074125, 0, 0.7607843, 1, 1,
0.06724079, 1.013809, -0.5351338, 0, 0.7529412, 1, 1,
0.07903825, 0.3979371, 0.2848362, 0, 0.7490196, 1, 1,
0.07907546, 1.789548, -0.3279633, 0, 0.7411765, 1, 1,
0.08036739, -0.1507729, 2.621516, 0, 0.7372549, 1, 1,
0.084364, -0.008093907, 2.45352, 0, 0.7294118, 1, 1,
0.08986604, 1.478573, 0.5974773, 0, 0.7254902, 1, 1,
0.09581083, 0.2812777, 1.590515, 0, 0.7176471, 1, 1,
0.09742503, 1.267907, 0.4638842, 0, 0.7137255, 1, 1,
0.09994544, -1.356299, 1.875195, 0, 0.7058824, 1, 1,
0.1007015, 0.2423822, -0.4000209, 0, 0.6980392, 1, 1,
0.1062185, -0.5499567, 2.344769, 0, 0.6941177, 1, 1,
0.1098902, -1.4692, 2.97976, 0, 0.6862745, 1, 1,
0.1134615, 0.3259183, -0.005542734, 0, 0.682353, 1, 1,
0.1160244, 0.3598997, 0.6325277, 0, 0.6745098, 1, 1,
0.1213784, -0.791985, 4.572948, 0, 0.6705883, 1, 1,
0.1215797, -0.5810495, 3.934816, 0, 0.6627451, 1, 1,
0.1264108, 0.7984322, -0.2694885, 0, 0.6588235, 1, 1,
0.1278095, 0.5133277, 0.3801699, 0, 0.6509804, 1, 1,
0.1284761, -1.103348, 3.848877, 0, 0.6470588, 1, 1,
0.1285244, -1.240665, 2.702987, 0, 0.6392157, 1, 1,
0.1294258, -0.407622, 2.211515, 0, 0.6352941, 1, 1,
0.1314817, 1.204284, 1.336761, 0, 0.627451, 1, 1,
0.1371869, -1.795607, 4.210928, 0, 0.6235294, 1, 1,
0.1381076, 0.2895026, 0.02559847, 0, 0.6156863, 1, 1,
0.14154, 0.7280161, 0.2704476, 0, 0.6117647, 1, 1,
0.1416553, -0.9405578, 2.558293, 0, 0.6039216, 1, 1,
0.1427031, -0.6593739, 4.300229, 0, 0.5960785, 1, 1,
0.1435028, -1.015216, 2.341612, 0, 0.5921569, 1, 1,
0.1470939, -0.1838118, 4.045282, 0, 0.5843138, 1, 1,
0.1491457, 0.4896553, 0.5391799, 0, 0.5803922, 1, 1,
0.1497855, 1.206017, -0.7090704, 0, 0.572549, 1, 1,
0.1597154, -0.7112368, 4.222047, 0, 0.5686275, 1, 1,
0.1649594, 0.9176094, 1.580297, 0, 0.5607843, 1, 1,
0.1679206, -0.1343705, 2.915777, 0, 0.5568628, 1, 1,
0.1682746, -0.2863036, 3.493136, 0, 0.5490196, 1, 1,
0.1734095, -0.4371252, 2.446246, 0, 0.5450981, 1, 1,
0.1765034, -2.752134, 3.967573, 0, 0.5372549, 1, 1,
0.1770321, 1.511442, 1.643003, 0, 0.5333334, 1, 1,
0.183358, -0.1361775, 2.535321, 0, 0.5254902, 1, 1,
0.1891855, -1.894373, 2.895168, 0, 0.5215687, 1, 1,
0.1914319, 2.017579, 0.1184774, 0, 0.5137255, 1, 1,
0.1924489, 0.1829076, -0.334403, 0, 0.509804, 1, 1,
0.1943699, 0.7690711, 0.7784145, 0, 0.5019608, 1, 1,
0.1943705, -1.101792, 4.07577, 0, 0.4941176, 1, 1,
0.1982998, -0.7928834, 3.281011, 0, 0.4901961, 1, 1,
0.2043895, 0.1716232, 1.039546, 0, 0.4823529, 1, 1,
0.2058162, -1.528331, 1.618219, 0, 0.4784314, 1, 1,
0.2100775, -0.4416603, 1.730994, 0, 0.4705882, 1, 1,
0.210839, -1.39627, 2.785258, 0, 0.4666667, 1, 1,
0.2108503, -0.9971695, 3.935889, 0, 0.4588235, 1, 1,
0.2126162, 1.593623, -0.2247489, 0, 0.454902, 1, 1,
0.2193719, 1.879369, 1.965933, 0, 0.4470588, 1, 1,
0.2204219, 0.3557474, 1.363322, 0, 0.4431373, 1, 1,
0.2212857, 1.850735, 0.7980661, 0, 0.4352941, 1, 1,
0.2221539, -2.61895, 1.43584, 0, 0.4313726, 1, 1,
0.2273632, -0.3748171, 3.207571, 0, 0.4235294, 1, 1,
0.2317448, -1.112043, 2.142263, 0, 0.4196078, 1, 1,
0.2321078, 0.06089596, 0.7058017, 0, 0.4117647, 1, 1,
0.2334893, 0.9923269, -1.013449, 0, 0.4078431, 1, 1,
0.2336207, -0.236342, 3.173668, 0, 0.4, 1, 1,
0.2363666, 0.5805863, 1.929255, 0, 0.3921569, 1, 1,
0.2369822, 1.382257, -0.5676888, 0, 0.3882353, 1, 1,
0.2508651, 0.4619181, 0.1644482, 0, 0.3803922, 1, 1,
0.251932, -0.885237, 0.541558, 0, 0.3764706, 1, 1,
0.2592287, -1.014203, 4.507882, 0, 0.3686275, 1, 1,
0.2616335, -0.8334651, 2.334679, 0, 0.3647059, 1, 1,
0.2660881, 1.018846, 1.124775, 0, 0.3568628, 1, 1,
0.2725538, -0.9479396, 3.218658, 0, 0.3529412, 1, 1,
0.2727353, -0.5456374, 2.361526, 0, 0.345098, 1, 1,
0.2742313, 0.214034, 1.710274, 0, 0.3411765, 1, 1,
0.2821133, 0.4884644, 0.1406183, 0, 0.3333333, 1, 1,
0.2837305, -0.285335, 3.449319, 0, 0.3294118, 1, 1,
0.2868907, -1.14427, 1.894628, 0, 0.3215686, 1, 1,
0.2885318, 2.000807, -0.7557181, 0, 0.3176471, 1, 1,
0.2912814, 0.3489886, 1.081636, 0, 0.3098039, 1, 1,
0.2917921, -0.1204574, 2.932383, 0, 0.3058824, 1, 1,
0.2953102, 1.668109, -1.166925, 0, 0.2980392, 1, 1,
0.2959337, -0.1971682, 2.707065, 0, 0.2901961, 1, 1,
0.2972229, -0.4564601, 3.580676, 0, 0.2862745, 1, 1,
0.2978333, -0.218857, 2.653637, 0, 0.2784314, 1, 1,
0.3129346, 0.9889407, 2.273928, 0, 0.2745098, 1, 1,
0.3137627, -0.1906036, 3.120402, 0, 0.2666667, 1, 1,
0.3145367, -0.3901046, 1.192305, 0, 0.2627451, 1, 1,
0.3159194, -1.1261, 3.36426, 0, 0.254902, 1, 1,
0.3185455, 1.022431, 1.011421, 0, 0.2509804, 1, 1,
0.3211359, 1.489327, 0.8546773, 0, 0.2431373, 1, 1,
0.3213794, -0.06568518, 0.7142063, 0, 0.2392157, 1, 1,
0.3255139, 0.3117967, -0.146635, 0, 0.2313726, 1, 1,
0.3301124, 0.6259879, -1.076534, 0, 0.227451, 1, 1,
0.3303504, -0.6009144, 1.140281, 0, 0.2196078, 1, 1,
0.3321668, -0.9803436, 3.567414, 0, 0.2156863, 1, 1,
0.3328592, 0.878986, 0.8604193, 0, 0.2078431, 1, 1,
0.3352878, 0.372816, 0.7721644, 0, 0.2039216, 1, 1,
0.3373328, -2.118193, 2.498884, 0, 0.1960784, 1, 1,
0.3382735, -0.5325576, 4.998188, 0, 0.1882353, 1, 1,
0.3394096, 0.9990313, 0.8898014, 0, 0.1843137, 1, 1,
0.3400181, 0.7920025, 1.286635, 0, 0.1764706, 1, 1,
0.3418197, -1.491459, 2.909142, 0, 0.172549, 1, 1,
0.3462127, 0.2884471, 2.278093, 0, 0.1647059, 1, 1,
0.3470761, -2.908283, 1.574438, 0, 0.1607843, 1, 1,
0.3534889, -0.8088104, 1.020017, 0, 0.1529412, 1, 1,
0.3565184, -0.7183324, 2.907063, 0, 0.1490196, 1, 1,
0.3568218, -0.5287436, 2.014055, 0, 0.1411765, 1, 1,
0.3590629, -0.2545973, 2.481208, 0, 0.1372549, 1, 1,
0.3597991, -0.5317518, 2.674799, 0, 0.1294118, 1, 1,
0.3640271, -0.05518399, 2.449883, 0, 0.1254902, 1, 1,
0.3673016, -0.7522935, 3.432121, 0, 0.1176471, 1, 1,
0.3685896, -0.06146555, 1.74524, 0, 0.1137255, 1, 1,
0.3689678, 1.48071, 0.6048005, 0, 0.1058824, 1, 1,
0.3702864, 1.381973, 0.6810157, 0, 0.09803922, 1, 1,
0.3723881, -1.405506, 2.357373, 0, 0.09411765, 1, 1,
0.3738213, -0.7531299, 2.987134, 0, 0.08627451, 1, 1,
0.374891, -0.2325999, 2.544436, 0, 0.08235294, 1, 1,
0.3821712, -0.2498168, 1.965262, 0, 0.07450981, 1, 1,
0.3836398, -0.3415301, 1.07945, 0, 0.07058824, 1, 1,
0.384449, -0.02558168, -0.7035698, 0, 0.0627451, 1, 1,
0.3869527, 0.540469, 0.4980194, 0, 0.05882353, 1, 1,
0.3883072, 0.197475, 0.8531122, 0, 0.05098039, 1, 1,
0.3897896, 0.1329455, 2.900841, 0, 0.04705882, 1, 1,
0.3902484, -0.6999303, 2.470928, 0, 0.03921569, 1, 1,
0.3959956, -0.01622779, 0.8325461, 0, 0.03529412, 1, 1,
0.3976103, 0.04267437, 3.036304, 0, 0.02745098, 1, 1,
0.401852, 1.579912, 0.05801127, 0, 0.02352941, 1, 1,
0.4021669, 0.3506419, -0.407418, 0, 0.01568628, 1, 1,
0.4078116, -0.945492, 2.94667, 0, 0.01176471, 1, 1,
0.4110437, -0.0803646, 1.310224, 0, 0.003921569, 1, 1,
0.4201479, 1.096189, 1.167528, 0.003921569, 0, 1, 1,
0.4209868, 0.3579984, 2.295499, 0.007843138, 0, 1, 1,
0.4221149, 0.7326529, 0.5155406, 0.01568628, 0, 1, 1,
0.4239579, 1.860156, 0.7903416, 0.01960784, 0, 1, 1,
0.4271821, 0.7273986, -0.3703091, 0.02745098, 0, 1, 1,
0.430349, -0.2773668, 2.26033, 0.03137255, 0, 1, 1,
0.4357969, -0.43728, 2.050377, 0.03921569, 0, 1, 1,
0.4361663, 0.9715428, -0.8015521, 0.04313726, 0, 1, 1,
0.4385853, -1.503108, 1.613667, 0.05098039, 0, 1, 1,
0.4398864, 0.131593, 0.5545907, 0.05490196, 0, 1, 1,
0.4442231, -0.864245, 2.858517, 0.0627451, 0, 1, 1,
0.4471393, -0.0447542, 1.784444, 0.06666667, 0, 1, 1,
0.4475085, -0.05558746, 0.5892741, 0.07450981, 0, 1, 1,
0.4484049, -1.362, 1.947617, 0.07843138, 0, 1, 1,
0.4491753, -0.5252088, 1.953384, 0.08627451, 0, 1, 1,
0.4514478, 1.434707, 1.622625, 0.09019608, 0, 1, 1,
0.4530135, -1.0734, 1.441754, 0.09803922, 0, 1, 1,
0.4593179, -0.3707469, 2.786731, 0.1058824, 0, 1, 1,
0.4596698, 0.4751034, 0.4336416, 0.1098039, 0, 1, 1,
0.4604345, -0.8498153, 2.99461, 0.1176471, 0, 1, 1,
0.4623189, 0.8724105, 0.3236733, 0.1215686, 0, 1, 1,
0.4656613, -0.4622075, 2.403885, 0.1294118, 0, 1, 1,
0.466884, 0.7707251, 0.7743468, 0.1333333, 0, 1, 1,
0.472939, -0.1476693, 2.004749, 0.1411765, 0, 1, 1,
0.484619, -0.4485022, 3.817986, 0.145098, 0, 1, 1,
0.48652, -1.12496, 2.064718, 0.1529412, 0, 1, 1,
0.4881514, 0.2473036, 1.0486, 0.1568628, 0, 1, 1,
0.4883135, 0.8017786, 1.868846, 0.1647059, 0, 1, 1,
0.4894625, 0.008492363, 0.3731855, 0.1686275, 0, 1, 1,
0.4930032, -0.6074867, 2.166627, 0.1764706, 0, 1, 1,
0.4946645, -0.6888443, 1.95307, 0.1803922, 0, 1, 1,
0.4977348, -0.9178925, 0.7939917, 0.1882353, 0, 1, 1,
0.4984161, -0.4849356, 3.140079, 0.1921569, 0, 1, 1,
0.5034276, -0.2284714, 2.084628, 0.2, 0, 1, 1,
0.5043595, -0.4309128, 1.362116, 0.2078431, 0, 1, 1,
0.5056493, 1.012942, 0.8623169, 0.2117647, 0, 1, 1,
0.5090925, -0.5815154, 2.089655, 0.2196078, 0, 1, 1,
0.5097561, -0.3048358, 3.991875, 0.2235294, 0, 1, 1,
0.5120532, -1.444121, 4.305367, 0.2313726, 0, 1, 1,
0.5149371, -2.197628, 1.651563, 0.2352941, 0, 1, 1,
0.5171027, 0.4329481, 1.468318, 0.2431373, 0, 1, 1,
0.5238272, 0.002577568, 0.3038247, 0.2470588, 0, 1, 1,
0.5242413, -0.1664753, 2.03931, 0.254902, 0, 1, 1,
0.53111, -1.573252, 2.367942, 0.2588235, 0, 1, 1,
0.5333433, -0.2884163, 2.969983, 0.2666667, 0, 1, 1,
0.5346719, 1.538368, 0.5349081, 0.2705882, 0, 1, 1,
0.5355635, -0.8331717, 3.814849, 0.2784314, 0, 1, 1,
0.5380339, 0.9758143, 1.189658, 0.282353, 0, 1, 1,
0.5389833, 0.1533751, 0.4238558, 0.2901961, 0, 1, 1,
0.5410553, 0.9891985, 0.5997684, 0.2941177, 0, 1, 1,
0.5416811, 1.80501, 1.517513, 0.3019608, 0, 1, 1,
0.5443682, 0.8145477, 0.7675986, 0.3098039, 0, 1, 1,
0.5469937, 0.8396534, 0.2954398, 0.3137255, 0, 1, 1,
0.547224, -0.7986494, 2.652567, 0.3215686, 0, 1, 1,
0.5478629, -1.173738, 5.231839, 0.3254902, 0, 1, 1,
0.5557669, 0.8716461, -0.4531866, 0.3333333, 0, 1, 1,
0.5574231, -0.2455109, 2.460203, 0.3372549, 0, 1, 1,
0.5603763, -1.092233, 3.486068, 0.345098, 0, 1, 1,
0.5613633, -1.210939, 3.220722, 0.3490196, 0, 1, 1,
0.567333, -1.258967, 1.860286, 0.3568628, 0, 1, 1,
0.5684489, 0.1545123, 0.1920595, 0.3607843, 0, 1, 1,
0.5703704, -0.1406347, 3.179468, 0.3686275, 0, 1, 1,
0.5724965, 0.4145679, 2.49605, 0.372549, 0, 1, 1,
0.5740203, 1.031654, 1.308081, 0.3803922, 0, 1, 1,
0.5831933, -0.2865283, 0.1904363, 0.3843137, 0, 1, 1,
0.5897391, 0.4664419, 1.063443, 0.3921569, 0, 1, 1,
0.5954062, 0.06371224, 1.529393, 0.3960784, 0, 1, 1,
0.5969666, -1.514729, 4.251095, 0.4039216, 0, 1, 1,
0.6038558, 0.982852, 0.1637388, 0.4117647, 0, 1, 1,
0.6061257, 0.9040671, 1.541742, 0.4156863, 0, 1, 1,
0.611561, 1.282339, 0.9547121, 0.4235294, 0, 1, 1,
0.6163037, 0.4240592, 1.977928, 0.427451, 0, 1, 1,
0.6192526, -0.06676304, -0.5773943, 0.4352941, 0, 1, 1,
0.6243297, -1.445637, 2.646858, 0.4392157, 0, 1, 1,
0.6246316, -2.237445, 5.134113, 0.4470588, 0, 1, 1,
0.6313021, -0.02323812, 3.601458, 0.4509804, 0, 1, 1,
0.6320877, -2.01595, 3.363745, 0.4588235, 0, 1, 1,
0.6327375, -0.08880776, 1.808498, 0.4627451, 0, 1, 1,
0.6482965, -0.01459622, 1.541709, 0.4705882, 0, 1, 1,
0.6487625, -0.0004651085, 2.51211, 0.4745098, 0, 1, 1,
0.6503677, 0.006733923, 2.694578, 0.4823529, 0, 1, 1,
0.6511756, 0.3892816, 3.012667, 0.4862745, 0, 1, 1,
0.653718, -0.133344, 1.136195, 0.4941176, 0, 1, 1,
0.6550632, -0.9188061, 1.76319, 0.5019608, 0, 1, 1,
0.6558225, 0.3917002, 0.2670942, 0.5058824, 0, 1, 1,
0.6608773, -1.083757, 0.8672633, 0.5137255, 0, 1, 1,
0.6697176, 0.3608558, 0.239867, 0.5176471, 0, 1, 1,
0.67186, -0.2606175, 3.321364, 0.5254902, 0, 1, 1,
0.6739147, -1.098635, 3.720116, 0.5294118, 0, 1, 1,
0.6740415, -1.232461, 1.755736, 0.5372549, 0, 1, 1,
0.6826707, 0.2028873, 0.8899922, 0.5411765, 0, 1, 1,
0.6862695, -1.60192, 2.40792, 0.5490196, 0, 1, 1,
0.6865358, 1.323241, 0.4901696, 0.5529412, 0, 1, 1,
0.6880793, 0.3107878, 2.382114, 0.5607843, 0, 1, 1,
0.6910024, -0.3327397, 1.569493, 0.5647059, 0, 1, 1,
0.6918993, 1.034513, -0.7787515, 0.572549, 0, 1, 1,
0.6952028, 0.08517074, 0.8001161, 0.5764706, 0, 1, 1,
0.6958193, -0.1049296, 2.052326, 0.5843138, 0, 1, 1,
0.6992688, 0.7098, 0.5362498, 0.5882353, 0, 1, 1,
0.7031868, 0.4944086, 0.001746297, 0.5960785, 0, 1, 1,
0.7035657, -1.10934, 3.833796, 0.6039216, 0, 1, 1,
0.708066, -0.2207959, 0.7306361, 0.6078432, 0, 1, 1,
0.7114782, 0.6691414, 0.2653874, 0.6156863, 0, 1, 1,
0.7142739, 0.6647862, 1.225417, 0.6196079, 0, 1, 1,
0.7167917, 0.5625452, 4.031397, 0.627451, 0, 1, 1,
0.7236424, 0.292225, 1.479471, 0.6313726, 0, 1, 1,
0.7263251, 0.737929, 2.422368, 0.6392157, 0, 1, 1,
0.7276837, -0.9093301, 0.7279334, 0.6431373, 0, 1, 1,
0.7377406, -1.306511, 3.785097, 0.6509804, 0, 1, 1,
0.7463908, -0.724449, 3.031616, 0.654902, 0, 1, 1,
0.7472591, -1.103044, 1.78238, 0.6627451, 0, 1, 1,
0.7500246, -0.2673336, 0.1770055, 0.6666667, 0, 1, 1,
0.7605359, -2.962321, 4.883586, 0.6745098, 0, 1, 1,
0.7608427, 0.3488109, 1.383681, 0.6784314, 0, 1, 1,
0.7677074, -0.4126758, 1.980539, 0.6862745, 0, 1, 1,
0.7691531, -1.724868, 2.316149, 0.6901961, 0, 1, 1,
0.769445, 0.8592045, 2.017209, 0.6980392, 0, 1, 1,
0.7708553, 1.748766, 0.8172007, 0.7058824, 0, 1, 1,
0.7718664, -1.110995, 3.060489, 0.7098039, 0, 1, 1,
0.7793145, -0.5509979, 3.234621, 0.7176471, 0, 1, 1,
0.7795864, 1.56868, -0.6874311, 0.7215686, 0, 1, 1,
0.781718, -2.328959, 1.385483, 0.7294118, 0, 1, 1,
0.7834199, -0.759713, 1.878253, 0.7333333, 0, 1, 1,
0.7850996, -0.8354396, 1.774821, 0.7411765, 0, 1, 1,
0.789773, -0.4680436, 0.973757, 0.7450981, 0, 1, 1,
0.7910336, 0.3413441, 3.801948, 0.7529412, 0, 1, 1,
0.7921872, 2.07657, 0.2029428, 0.7568628, 0, 1, 1,
0.7933949, -1.091322, 2.543571, 0.7647059, 0, 1, 1,
0.7981366, -0.9822258, 3.70654, 0.7686275, 0, 1, 1,
0.8049047, -0.6342572, 2.074957, 0.7764706, 0, 1, 1,
0.8049117, -0.5613272, 1.866549, 0.7803922, 0, 1, 1,
0.8055038, 0.5332013, -0.0865011, 0.7882353, 0, 1, 1,
0.8057738, -1.047389, 3.404205, 0.7921569, 0, 1, 1,
0.815055, 0.04063988, 2.107161, 0.8, 0, 1, 1,
0.8171213, -1.305949, 2.005278, 0.8078431, 0, 1, 1,
0.8197743, -0.7503362, 3.381202, 0.8117647, 0, 1, 1,
0.8213933, -0.2046638, 3.555621, 0.8196079, 0, 1, 1,
0.8216474, -0.1195443, 1.743857, 0.8235294, 0, 1, 1,
0.8242592, -1.446255, 1.987269, 0.8313726, 0, 1, 1,
0.8249882, -0.2200013, 3.227382, 0.8352941, 0, 1, 1,
0.8256837, 0.6633996, 0.3497703, 0.8431373, 0, 1, 1,
0.8266852, 0.2900874, 1.09999, 0.8470588, 0, 1, 1,
0.8289489, 1.554951, 2.116373, 0.854902, 0, 1, 1,
0.8393104, 0.6082649, 0.9192052, 0.8588235, 0, 1, 1,
0.8412254, 0.1329512, 1.050271, 0.8666667, 0, 1, 1,
0.847162, -0.6942008, 1.203231, 0.8705882, 0, 1, 1,
0.8517479, 0.3027349, 1.785887, 0.8784314, 0, 1, 1,
0.8518441, 0.8247495, 1.356697, 0.8823529, 0, 1, 1,
0.8534417, 0.5757831, 2.853122, 0.8901961, 0, 1, 1,
0.8551435, -0.5861143, 2.482317, 0.8941177, 0, 1, 1,
0.8655818, -0.4270319, 2.167073, 0.9019608, 0, 1, 1,
0.8666876, 0.4840794, 1.617576, 0.9098039, 0, 1, 1,
0.8675971, -0.4766089, 0.2619889, 0.9137255, 0, 1, 1,
0.8713933, -1.806006, 3.890188, 0.9215686, 0, 1, 1,
0.8783995, -0.9031534, 1.775204, 0.9254902, 0, 1, 1,
0.8789432, 0.320722, 1.007422, 0.9333333, 0, 1, 1,
0.883088, -1.323789, 2.941328, 0.9372549, 0, 1, 1,
0.8832631, -0.5150059, 2.018036, 0.945098, 0, 1, 1,
0.8888671, -0.5434876, 2.645142, 0.9490196, 0, 1, 1,
0.8984818, -0.7284805, 2.440691, 0.9568627, 0, 1, 1,
0.9043497, -0.4634713, 3.41549, 0.9607843, 0, 1, 1,
0.9088539, -0.8130426, 1.97104, 0.9686275, 0, 1, 1,
0.9197538, -1.258214, 3.037155, 0.972549, 0, 1, 1,
0.9222425, 0.1400172, 1.307308, 0.9803922, 0, 1, 1,
0.9326009, -0.1897554, 0.8794218, 0.9843137, 0, 1, 1,
0.9357429, -0.1046337, -0.2849928, 0.9921569, 0, 1, 1,
0.9559602, -1.318227, 4.254028, 0.9960784, 0, 1, 1,
0.9598107, -0.1273038, 2.492764, 1, 0, 0.9960784, 1,
0.964552, -0.1304169, 3.255129, 1, 0, 0.9882353, 1,
0.9648222, 1.056907, -0.4166134, 1, 0, 0.9843137, 1,
0.9712813, -1.49004, 0.7188529, 1, 0, 0.9764706, 1,
0.9764647, -0.8221485, 2.566024, 1, 0, 0.972549, 1,
0.9792373, 2.092682, -0.2593919, 1, 0, 0.9647059, 1,
0.9794074, 1.791026, 0.5742017, 1, 0, 0.9607843, 1,
0.9830103, -1.075205, 2.208985, 1, 0, 0.9529412, 1,
0.9939801, -1.150417, 2.67712, 1, 0, 0.9490196, 1,
0.9944028, -0.844074, 0.2679251, 1, 0, 0.9411765, 1,
0.9944227, 0.9604859, 2.110668, 1, 0, 0.9372549, 1,
1.005292, -1.720239, 1.775259, 1, 0, 0.9294118, 1,
1.009787, -0.1049604, -0.4294184, 1, 0, 0.9254902, 1,
1.01079, -0.4688074, 2.301708, 1, 0, 0.9176471, 1,
1.012201, 0.6271468, 0.5292485, 1, 0, 0.9137255, 1,
1.013369, -0.3992352, 1.01203, 1, 0, 0.9058824, 1,
1.013375, 0.7110868, 0.8284227, 1, 0, 0.9019608, 1,
1.014656, 0.4212713, 1.612875, 1, 0, 0.8941177, 1,
1.016429, 0.4471772, 1.919297, 1, 0, 0.8862745, 1,
1.019452, 0.4350265, -0.1106374, 1, 0, 0.8823529, 1,
1.024808, 0.4239244, 0.5726501, 1, 0, 0.8745098, 1,
1.027709, 1.20969, 0.3555753, 1, 0, 0.8705882, 1,
1.029025, -0.04456959, 1.570751, 1, 0, 0.8627451, 1,
1.029456, -0.929443, 3.624786, 1, 0, 0.8588235, 1,
1.030549, 2.045949, 1.628241, 1, 0, 0.8509804, 1,
1.032398, 0.9681514, 0.9951822, 1, 0, 0.8470588, 1,
1.048243, 0.1030455, 0.02492484, 1, 0, 0.8392157, 1,
1.050045, -0.2712318, 3.351147, 1, 0, 0.8352941, 1,
1.051002, 0.398877, 0.9452778, 1, 0, 0.827451, 1,
1.051435, 0.04672358, 1.658533, 1, 0, 0.8235294, 1,
1.053025, -1.590474, 2.882156, 1, 0, 0.8156863, 1,
1.062204, 0.4352336, 2.014192, 1, 0, 0.8117647, 1,
1.064001, 1.067428, 0.9143456, 1, 0, 0.8039216, 1,
1.065646, -0.7535285, 2.008719, 1, 0, 0.7960784, 1,
1.070269, -0.9715967, 3.798106, 1, 0, 0.7921569, 1,
1.071737, -1.683686, 2.947393, 1, 0, 0.7843137, 1,
1.072364, 1.317212, 0.7058071, 1, 0, 0.7803922, 1,
1.077741, -2.034561, 2.603103, 1, 0, 0.772549, 1,
1.087493, 2.001227, -0.16593, 1, 0, 0.7686275, 1,
1.088277, 2.364148, 1.231557, 1, 0, 0.7607843, 1,
1.090172, -0.5436937, 0.117502, 1, 0, 0.7568628, 1,
1.092848, 1.444644, 0.4741429, 1, 0, 0.7490196, 1,
1.094954, 1.89708, -0.978327, 1, 0, 0.7450981, 1,
1.101975, 0.7161618, 0.2341597, 1, 0, 0.7372549, 1,
1.106855, 0.078591, 3.826364, 1, 0, 0.7333333, 1,
1.107964, 1.641556, 0.8388026, 1, 0, 0.7254902, 1,
1.11075, 0.331591, 1.115022, 1, 0, 0.7215686, 1,
1.125943, -0.1227786, 1.702926, 1, 0, 0.7137255, 1,
1.128942, 0.9153584, 1.504789, 1, 0, 0.7098039, 1,
1.133068, -0.3447801, 1.474585, 1, 0, 0.7019608, 1,
1.135557, 0.398153, 1.463865, 1, 0, 0.6941177, 1,
1.136715, 0.928772, 0.8727638, 1, 0, 0.6901961, 1,
1.151519, 1.638244, 1.060558, 1, 0, 0.682353, 1,
1.151677, -0.5637197, 1.457317, 1, 0, 0.6784314, 1,
1.160244, -1.560436, -0.1047123, 1, 0, 0.6705883, 1,
1.160865, -0.07030964, 0.586208, 1, 0, 0.6666667, 1,
1.164775, -1.075803, 1.071305, 1, 0, 0.6588235, 1,
1.170854, 0.3022998, 1.583014, 1, 0, 0.654902, 1,
1.171884, -0.2249884, 0.4410511, 1, 0, 0.6470588, 1,
1.180488, 0.3561867, 1.682273, 1, 0, 0.6431373, 1,
1.200615, -0.1658187, 1.067155, 1, 0, 0.6352941, 1,
1.207864, -0.8954388, 2.504578, 1, 0, 0.6313726, 1,
1.213472, -0.2060908, 1.455786, 1, 0, 0.6235294, 1,
1.216983, 1.765545, 1.074463, 1, 0, 0.6196079, 1,
1.219105, 0.7617418, 2.108343, 1, 0, 0.6117647, 1,
1.231632, -0.972475, 1.237288, 1, 0, 0.6078432, 1,
1.24305, 0.4666592, 2.261032, 1, 0, 0.6, 1,
1.244423, 0.8143473, 0.4979205, 1, 0, 0.5921569, 1,
1.245164, 1.208362, 1.856859, 1, 0, 0.5882353, 1,
1.247641, 1.000804, 1.126266, 1, 0, 0.5803922, 1,
1.251577, 1.079788, -0.8141789, 1, 0, 0.5764706, 1,
1.256125, 0.7082367, 2.144906, 1, 0, 0.5686275, 1,
1.25788, 0.1772278, 3.150472, 1, 0, 0.5647059, 1,
1.25796, 1.485796, 0.5369336, 1, 0, 0.5568628, 1,
1.268089, 0.5422199, 1.442748, 1, 0, 0.5529412, 1,
1.278113, 1.658342, 1.387007, 1, 0, 0.5450981, 1,
1.283768, -0.5240626, 3.757122, 1, 0, 0.5411765, 1,
1.286306, -0.5557535, 1.922994, 1, 0, 0.5333334, 1,
1.296943, 1.641577, 0.9632779, 1, 0, 0.5294118, 1,
1.307764, 0.2902367, 1.729647, 1, 0, 0.5215687, 1,
1.309727, -0.6451359, 2.841817, 1, 0, 0.5176471, 1,
1.311601, 0.1385423, 1.368063, 1, 0, 0.509804, 1,
1.326677, -0.8460443, 3.404608, 1, 0, 0.5058824, 1,
1.332165, -1.445515, 3.294913, 1, 0, 0.4980392, 1,
1.339853, -0.1349004, 0.2593434, 1, 0, 0.4901961, 1,
1.345139, 0.431431, 2.000606, 1, 0, 0.4862745, 1,
1.350953, 2.208423, 2.126408, 1, 0, 0.4784314, 1,
1.360065, -1.646135, 1.50413, 1, 0, 0.4745098, 1,
1.381342, 1.091284, 1.839253, 1, 0, 0.4666667, 1,
1.383951, -1.217175, 1.940274, 1, 0, 0.4627451, 1,
1.390359, 0.9350473, 0.05498213, 1, 0, 0.454902, 1,
1.391001, -0.1905359, 2.459976, 1, 0, 0.4509804, 1,
1.408666, -0.6607668, 2.002661, 1, 0, 0.4431373, 1,
1.426784, 0.9592805, 0.7610175, 1, 0, 0.4392157, 1,
1.4294, 0.2203259, 1.366469, 1, 0, 0.4313726, 1,
1.436876, 1.693663, -0.2323818, 1, 0, 0.427451, 1,
1.438858, 0.2066425, 1.915305, 1, 0, 0.4196078, 1,
1.44092, 1.10944, 1.510297, 1, 0, 0.4156863, 1,
1.441633, 1.593959, 0.8582742, 1, 0, 0.4078431, 1,
1.445138, -0.3719386, 2.089469, 1, 0, 0.4039216, 1,
1.462064, -1.150428, 2.830894, 1, 0, 0.3960784, 1,
1.46238, -0.3905398, 1.81692, 1, 0, 0.3882353, 1,
1.471736, -0.6214694, 2.059674, 1, 0, 0.3843137, 1,
1.475152, 1.345306, 1.315046, 1, 0, 0.3764706, 1,
1.477897, 0.5166612, 1.334484, 1, 0, 0.372549, 1,
1.492008, 1.74504, 1.158436, 1, 0, 0.3647059, 1,
1.506298, -0.3229765, 2.714717, 1, 0, 0.3607843, 1,
1.511217, -0.5232764, 0.5870512, 1, 0, 0.3529412, 1,
1.518151, 1.51337, 1.869994, 1, 0, 0.3490196, 1,
1.523747, 1.076136, 0.5813456, 1, 0, 0.3411765, 1,
1.527089, 0.1674007, 0.3913293, 1, 0, 0.3372549, 1,
1.532943, 0.9889504, 0.1575585, 1, 0, 0.3294118, 1,
1.535283, -0.5527199, 3.619948, 1, 0, 0.3254902, 1,
1.550648, 0.04701407, 3.469072, 1, 0, 0.3176471, 1,
1.559396, 0.8007288, 0.3872891, 1, 0, 0.3137255, 1,
1.565665, 1.383942, 3.23941, 1, 0, 0.3058824, 1,
1.570628, -0.8181238, 1.901616, 1, 0, 0.2980392, 1,
1.600897, 0.2035845, 2.7981, 1, 0, 0.2941177, 1,
1.603677, 2.52377, 1.10303, 1, 0, 0.2862745, 1,
1.624553, 0.4263889, 2.33634, 1, 0, 0.282353, 1,
1.624695, 0.6052687, 1.429991, 1, 0, 0.2745098, 1,
1.644016, 0.4793123, 1.054149, 1, 0, 0.2705882, 1,
1.664352, -0.7039828, 2.044956, 1, 0, 0.2627451, 1,
1.676226, 0.1626433, 1.280101, 1, 0, 0.2588235, 1,
1.702314, -1.505347, 1.497321, 1, 0, 0.2509804, 1,
1.732969, 0.6467872, 0.6844574, 1, 0, 0.2470588, 1,
1.734012, -0.008080639, -0.439481, 1, 0, 0.2392157, 1,
1.739218, -1.06533, 0.7599868, 1, 0, 0.2352941, 1,
1.750029, -1.11217, 2.196896, 1, 0, 0.227451, 1,
1.758497, 0.04352731, 2.01118, 1, 0, 0.2235294, 1,
1.75912, 0.8417257, 1.109237, 1, 0, 0.2156863, 1,
1.776638, -0.06111539, 1.538842, 1, 0, 0.2117647, 1,
1.819233, -1.310691, 2.263182, 1, 0, 0.2039216, 1,
1.851796, -1.859542, 1.180821, 1, 0, 0.1960784, 1,
1.854681, 0.3572442, 0.5855196, 1, 0, 0.1921569, 1,
1.88176, -0.3232647, 1.124993, 1, 0, 0.1843137, 1,
1.89697, 1.98387, 1.964017, 1, 0, 0.1803922, 1,
1.922673, -0.467932, 2.326705, 1, 0, 0.172549, 1,
1.935153, 0.6063552, 1.461405, 1, 0, 0.1686275, 1,
1.962464, -0.2492039, 1.724721, 1, 0, 0.1607843, 1,
1.970905, 0.05665737, 1.545462, 1, 0, 0.1568628, 1,
1.98697, -0.2992995, 2.755877, 1, 0, 0.1490196, 1,
2.009306, -1.361451, 2.491818, 1, 0, 0.145098, 1,
2.017087, -0.2895016, 0.3185395, 1, 0, 0.1372549, 1,
2.038058, 0.6349741, 1.094632, 1, 0, 0.1333333, 1,
2.040616, -0.5900641, 1.775028, 1, 0, 0.1254902, 1,
2.050931, -0.7138433, 1.476962, 1, 0, 0.1215686, 1,
2.082956, -1.318323, 1.2432, 1, 0, 0.1137255, 1,
2.122015, -1.511173, 2.741578, 1, 0, 0.1098039, 1,
2.155498, 1.085382, -1.665642, 1, 0, 0.1019608, 1,
2.229736, 0.3556441, 1.28166, 1, 0, 0.09411765, 1,
2.249274, -0.501437, 1.116984, 1, 0, 0.09019608, 1,
2.262172, 0.3274966, 1.709026, 1, 0, 0.08235294, 1,
2.292054, 0.9721295, 1.980347, 1, 0, 0.07843138, 1,
2.295023, 1.015099, 2.997413, 1, 0, 0.07058824, 1,
2.305485, -0.06741942, -0.1561132, 1, 0, 0.06666667, 1,
2.400731, 0.5967953, 0.3292525, 1, 0, 0.05882353, 1,
2.568959, -0.3152296, 3.056557, 1, 0, 0.05490196, 1,
2.595522, 0.2358682, 0.9280289, 1, 0, 0.04705882, 1,
2.614415, -1.615603, 1.774567, 1, 0, 0.04313726, 1,
2.672057, 0.7343073, 2.030529, 1, 0, 0.03529412, 1,
2.702723, -0.7527732, 3.532961, 1, 0, 0.03137255, 1,
2.877493, 0.4520654, 0.8196517, 1, 0, 0.02352941, 1,
2.880711, 0.2001811, 0.9406332, 1, 0, 0.01960784, 1,
3.202729, -1.320019, -0.4806359, 1, 0, 0.01176471, 1,
3.608686, 1.666045, 1.904705, 1, 0, 0.007843138, 1
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
0.1769271, -4.226202, -6.356225, 0, -0.5, 0.5, 0.5,
0.1769271, -4.226202, -6.356225, 1, -0.5, 0.5, 0.5,
0.1769271, -4.226202, -6.356225, 1, 1.5, 0.5, 0.5,
0.1769271, -4.226202, -6.356225, 0, 1.5, 0.5, 0.5
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
-4.418198, -0.2884909, -6.356225, 0, -0.5, 0.5, 0.5,
-4.418198, -0.2884909, -6.356225, 1, -0.5, 0.5, 0.5,
-4.418198, -0.2884909, -6.356225, 1, 1.5, 0.5, 0.5,
-4.418198, -0.2884909, -6.356225, 0, 1.5, 0.5, 0.5
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
-4.418198, -4.226202, 0.3660665, 0, -0.5, 0.5, 0.5,
-4.418198, -4.226202, 0.3660665, 1, -0.5, 0.5, 0.5,
-4.418198, -4.226202, 0.3660665, 1, 1.5, 0.5, 0.5,
-4.418198, -4.226202, 0.3660665, 0, 1.5, 0.5, 0.5
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
-3, -3.317499, -4.804927,
3, -3.317499, -4.804927,
-3, -3.317499, -4.804927,
-3, -3.46895, -5.063477,
-2, -3.317499, -4.804927,
-2, -3.46895, -5.063477,
-1, -3.317499, -4.804927,
-1, -3.46895, -5.063477,
0, -3.317499, -4.804927,
0, -3.46895, -5.063477,
1, -3.317499, -4.804927,
1, -3.46895, -5.063477,
2, -3.317499, -4.804927,
2, -3.46895, -5.063477,
3, -3.317499, -4.804927,
3, -3.46895, -5.063477
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
-3, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
-3, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
-3, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
-3, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
-2, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
-2, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
-2, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
-2, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
-1, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
-1, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
-1, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
-1, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
0, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
0, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
0, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
0, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
1, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
1, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
1, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
1, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
2, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
2, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
2, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
2, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5,
3, -3.771851, -5.580576, 0, -0.5, 0.5, 0.5,
3, -3.771851, -5.580576, 1, -0.5, 0.5, 0.5,
3, -3.771851, -5.580576, 1, 1.5, 0.5, 0.5,
3, -3.771851, -5.580576, 0, 1.5, 0.5, 0.5
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
-3.357785, -3, -4.804927,
-3.357785, 2, -4.804927,
-3.357785, -3, -4.804927,
-3.53452, -3, -5.063477,
-3.357785, -2, -4.804927,
-3.53452, -2, -5.063477,
-3.357785, -1, -4.804927,
-3.53452, -1, -5.063477,
-3.357785, 0, -4.804927,
-3.53452, 0, -5.063477,
-3.357785, 1, -4.804927,
-3.53452, 1, -5.063477,
-3.357785, 2, -4.804927,
-3.53452, 2, -5.063477
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
"2"
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
-3.887991, -3, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, -3, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, -3, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, -3, -5.580576, 0, 1.5, 0.5, 0.5,
-3.887991, -2, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, -2, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, -2, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, -2, -5.580576, 0, 1.5, 0.5, 0.5,
-3.887991, -1, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, -1, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, -1, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, -1, -5.580576, 0, 1.5, 0.5, 0.5,
-3.887991, 0, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, 0, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, 0, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, 0, -5.580576, 0, 1.5, 0.5, 0.5,
-3.887991, 1, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, 1, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, 1, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, 1, -5.580576, 0, 1.5, 0.5, 0.5,
-3.887991, 2, -5.580576, 0, -0.5, 0.5, 0.5,
-3.887991, 2, -5.580576, 1, -0.5, 0.5, 0.5,
-3.887991, 2, -5.580576, 1, 1.5, 0.5, 0.5,
-3.887991, 2, -5.580576, 0, 1.5, 0.5, 0.5
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
-3.357785, -3.317499, -4,
-3.357785, -3.317499, 4,
-3.357785, -3.317499, -4,
-3.53452, -3.46895, -4,
-3.357785, -3.317499, -2,
-3.53452, -3.46895, -2,
-3.357785, -3.317499, 0,
-3.53452, -3.46895, 0,
-3.357785, -3.317499, 2,
-3.53452, -3.46895, 2,
-3.357785, -3.317499, 4,
-3.53452, -3.46895, 4
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
-3.887991, -3.771851, -4, 0, -0.5, 0.5, 0.5,
-3.887991, -3.771851, -4, 1, -0.5, 0.5, 0.5,
-3.887991, -3.771851, -4, 1, 1.5, 0.5, 0.5,
-3.887991, -3.771851, -4, 0, 1.5, 0.5, 0.5,
-3.887991, -3.771851, -2, 0, -0.5, 0.5, 0.5,
-3.887991, -3.771851, -2, 1, -0.5, 0.5, 0.5,
-3.887991, -3.771851, -2, 1, 1.5, 0.5, 0.5,
-3.887991, -3.771851, -2, 0, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 0, 0, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 0, 1, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 0, 1, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 0, 0, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 2, 0, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 2, 1, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 2, 1, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 2, 0, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 4, 0, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 4, 1, -0.5, 0.5, 0.5,
-3.887991, -3.771851, 4, 1, 1.5, 0.5, 0.5,
-3.887991, -3.771851, 4, 0, 1.5, 0.5, 0.5
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
-3.357785, -3.317499, -4.804927,
-3.357785, 2.740518, -4.804927,
-3.357785, -3.317499, 5.53706,
-3.357785, 2.740518, 5.53706,
-3.357785, -3.317499, -4.804927,
-3.357785, -3.317499, 5.53706,
-3.357785, 2.740518, -4.804927,
-3.357785, 2.740518, 5.53706,
-3.357785, -3.317499, -4.804927,
3.711639, -3.317499, -4.804927,
-3.357785, -3.317499, 5.53706,
3.711639, -3.317499, 5.53706,
-3.357785, 2.740518, -4.804927,
3.711639, 2.740518, -4.804927,
-3.357785, 2.740518, 5.53706,
3.711639, 2.740518, 5.53706,
3.711639, -3.317499, -4.804927,
3.711639, 2.740518, -4.804927,
3.711639, -3.317499, 5.53706,
3.711639, 2.740518, 5.53706,
3.711639, -3.317499, -4.804927,
3.711639, -3.317499, 5.53706,
3.711639, 2.740518, -4.804927,
3.711639, 2.740518, 5.53706
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
var radius = 7.430451;
var distance = 33.05891;
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
mvMatrix.translate( -0.1769271, 0.2884909, -0.3660665 );
mvMatrix.scale( 1.136436, 1.326168, 0.7768284 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.05891);
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
Ossian<-read.table("Ossian.xyz")
```

```
## Error in read.table("Ossian.xyz"): no lines available in input
```

```r
x<-Ossian$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
y<-Ossian$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
z<-Ossian$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
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
-3.254832, -1.097697, -2.183774, 0, 0, 1, 1, 1,
-2.999475, 1.81472, -2.425013, 1, 0, 0, 1, 1,
-2.956008, 1.334428, -1.903656, 1, 0, 0, 1, 1,
-2.839041, 0.8923342, -1.616996, 1, 0, 0, 1, 1,
-2.449511, 0.4869978, -0.7911904, 1, 0, 0, 1, 1,
-2.446237, -0.3698624, -2.282714, 1, 0, 0, 1, 1,
-2.345945, 0.7677249, -0.9173965, 0, 0, 0, 1, 1,
-2.330956, -1.010229, -1.027567, 0, 0, 0, 1, 1,
-2.305354, -0.8960602, -1.979719, 0, 0, 0, 1, 1,
-2.302438, 1.114275, 0.01148678, 0, 0, 0, 1, 1,
-2.262848, -0.1406352, 0.335607, 0, 0, 0, 1, 1,
-2.245149, -1.116718, -2.89108, 0, 0, 0, 1, 1,
-2.212467, 1.104581, -1.831682, 0, 0, 0, 1, 1,
-2.186632, 0.9174271, -0.1244814, 1, 1, 1, 1, 1,
-2.134892, 1.111737, 1.24691, 1, 1, 1, 1, 1,
-2.09779, 0.1097029, -1.774135, 1, 1, 1, 1, 1,
-2.090698, -2.41639, -3.254255, 1, 1, 1, 1, 1,
-2.068086, 0.2790526, -1.094038, 1, 1, 1, 1, 1,
-2.002312, 0.250432, -1.283747, 1, 1, 1, 1, 1,
-2.001323, -0.3948066, -2.279799, 1, 1, 1, 1, 1,
-1.988622, 0.04549598, -1.239103, 1, 1, 1, 1, 1,
-1.965453, 0.4720812, -3.407595, 1, 1, 1, 1, 1,
-1.959059, -0.4657617, -0.91334, 1, 1, 1, 1, 1,
-1.954362, -0.01894689, -2.482469, 1, 1, 1, 1, 1,
-1.952138, -1.388355, -1.895116, 1, 1, 1, 1, 1,
-1.948277, -0.1513242, -0.5335368, 1, 1, 1, 1, 1,
-1.934797, -0.5856565, -1.487487, 1, 1, 1, 1, 1,
-1.910779, 1.342894, 0.1945057, 1, 1, 1, 1, 1,
-1.903706, -0.4034255, -1.177512, 0, 0, 1, 1, 1,
-1.88546, -0.572795, -2.166202, 1, 0, 0, 1, 1,
-1.87256, 0.1406527, -0.3862194, 1, 0, 0, 1, 1,
-1.870037, -1.030291, -1.020976, 1, 0, 0, 1, 1,
-1.855121, -1.323503, -1.171438, 1, 0, 0, 1, 1,
-1.840563, -0.2227177, 0.6206207, 1, 0, 0, 1, 1,
-1.82703, 0.9704304, -0.9857997, 0, 0, 0, 1, 1,
-1.821099, -1.068302, -1.852275, 0, 0, 0, 1, 1,
-1.820688, 1.934183, -2.080295, 0, 0, 0, 1, 1,
-1.817146, 2.652294, 0.2275845, 0, 0, 0, 1, 1,
-1.806115, -0.01367844, -1.820074, 0, 0, 0, 1, 1,
-1.786437, 0.6971678, -1.488256, 0, 0, 0, 1, 1,
-1.770565, 0.01542857, 0.5101741, 0, 0, 0, 1, 1,
-1.767923, 0.2295869, -2.416332, 1, 1, 1, 1, 1,
-1.763459, 0.8610963, -2.312358, 1, 1, 1, 1, 1,
-1.759235, -1.098092, -0.7713956, 1, 1, 1, 1, 1,
-1.748051, -0.05269505, -1.737038, 1, 1, 1, 1, 1,
-1.745201, 0.09628406, -1.723471, 1, 1, 1, 1, 1,
-1.737635, 0.4564413, -1.709132, 1, 1, 1, 1, 1,
-1.73407, 0.1500378, -1.602275, 1, 1, 1, 1, 1,
-1.728638, 0.1867481, -3.790524, 1, 1, 1, 1, 1,
-1.727601, -3.1944, -2.167363, 1, 1, 1, 1, 1,
-1.723993, -1.26969, -2.17963, 1, 1, 1, 1, 1,
-1.707715, 1.926475, 0.01298653, 1, 1, 1, 1, 1,
-1.704755, 0.8383445, -3.138131, 1, 1, 1, 1, 1,
-1.700897, 0.08491172, -1.67568, 1, 1, 1, 1, 1,
-1.683195, -0.9858499, -0.9405479, 1, 1, 1, 1, 1,
-1.664396, -0.7135784, -3.590052, 1, 1, 1, 1, 1,
-1.654414, -0.174335, -2.174473, 0, 0, 1, 1, 1,
-1.642003, -0.8190461, -2.566421, 1, 0, 0, 1, 1,
-1.617913, -0.2932914, -2.718172, 1, 0, 0, 1, 1,
-1.611652, 0.4531378, -1.892963, 1, 0, 0, 1, 1,
-1.611023, -1.142739, -2.685976, 1, 0, 0, 1, 1,
-1.599455, -1.263182, -2.150676, 1, 0, 0, 1, 1,
-1.598467, 0.02749466, -1.628906, 0, 0, 0, 1, 1,
-1.59517, 1.29773, 0.4414309, 0, 0, 0, 1, 1,
-1.594366, 0.2652277, -1.176122, 0, 0, 0, 1, 1,
-1.588993, 0.1768375, -3.485795, 0, 0, 0, 1, 1,
-1.568787, -0.836623, -1.329422, 0, 0, 0, 1, 1,
-1.556131, 1.107445, -2.808538, 0, 0, 0, 1, 1,
-1.546256, -0.5681033, -1.410631, 0, 0, 0, 1, 1,
-1.545814, 0.7698913, 0.5609592, 1, 1, 1, 1, 1,
-1.529204, -1.733422, -3.002836, 1, 1, 1, 1, 1,
-1.525812, 0.1876012, -1.250811, 1, 1, 1, 1, 1,
-1.520181, -0.4710985, -3.201746, 1, 1, 1, 1, 1,
-1.515574, 0.3083256, -1.102509, 1, 1, 1, 1, 1,
-1.511344, 0.558822, -0.7981671, 1, 1, 1, 1, 1,
-1.508463, -1.322631, -1.343997, 1, 1, 1, 1, 1,
-1.507844, -1.03427, -2.982717, 1, 1, 1, 1, 1,
-1.49205, -1.06194, -3.643418, 1, 1, 1, 1, 1,
-1.491211, 1.212462, -2.38313, 1, 1, 1, 1, 1,
-1.477619, -0.1336959, -3.666193, 1, 1, 1, 1, 1,
-1.467245, 0.04116107, -1.437865, 1, 1, 1, 1, 1,
-1.466425, 1.35608, -1.14879, 1, 1, 1, 1, 1,
-1.464489, -0.3660763, -3.035674, 1, 1, 1, 1, 1,
-1.45171, -1.707031, -2.76866, 1, 1, 1, 1, 1,
-1.451519, 0.6567148, -1.270578, 0, 0, 1, 1, 1,
-1.435508, 0.07443664, -1.761634, 1, 0, 0, 1, 1,
-1.433668, -0.05058556, -0.6894103, 1, 0, 0, 1, 1,
-1.427881, -3.229276, -3.059651, 1, 0, 0, 1, 1,
-1.41362, -0.6945623, -1.601027, 1, 0, 0, 1, 1,
-1.411737, 0.9938905, -2.523474, 1, 0, 0, 1, 1,
-1.40974, -0.5818963, -1.699398, 0, 0, 0, 1, 1,
-1.40151, 0.3574497, -1.83142, 0, 0, 0, 1, 1,
-1.383116, -0.421946, -1.696596, 0, 0, 0, 1, 1,
-1.382899, 1.842297, 1.391108, 0, 0, 0, 1, 1,
-1.368928, 0.3875797, -1.542271, 0, 0, 0, 1, 1,
-1.368766, -0.9779322, -1.266879, 0, 0, 0, 1, 1,
-1.368764, 0.5643802, -2.392763, 0, 0, 0, 1, 1,
-1.367496, 0.8308995, -1.76619, 1, 1, 1, 1, 1,
-1.365738, -1.061865, -2.694097, 1, 1, 1, 1, 1,
-1.364159, 1.306431, 0.2628342, 1, 1, 1, 1, 1,
-1.357967, -1.084155, -1.919334, 1, 1, 1, 1, 1,
-1.346967, 1.433205, 0.9601464, 1, 1, 1, 1, 1,
-1.340166, 1.946295, -1.687285, 1, 1, 1, 1, 1,
-1.340131, 0.1809834, -2.558511, 1, 1, 1, 1, 1,
-1.335802, 0.5311872, -1.33553, 1, 1, 1, 1, 1,
-1.328386, -0.150437, -1.489065, 1, 1, 1, 1, 1,
-1.318045, 0.01160952, -0.4468006, 1, 1, 1, 1, 1,
-1.306955, 1.289488, 0.6115865, 1, 1, 1, 1, 1,
-1.306353, 0.7290781, -3.354287, 1, 1, 1, 1, 1,
-1.294843, 0.6784081, -0.8292649, 1, 1, 1, 1, 1,
-1.281638, 0.484257, -4.066283, 1, 1, 1, 1, 1,
-1.280752, 1.430208, -1.008842, 1, 1, 1, 1, 1,
-1.275737, 0.9080738, -1.077073, 0, 0, 1, 1, 1,
-1.275458, -0.7130049, -1.382936, 1, 0, 0, 1, 1,
-1.26407, -1.334157, -3.288466, 1, 0, 0, 1, 1,
-1.260368, 0.5274218, -2.072397, 1, 0, 0, 1, 1,
-1.260156, 1.245521, -0.9639037, 1, 0, 0, 1, 1,
-1.256076, 0.5653114, -2.14693, 1, 0, 0, 1, 1,
-1.249226, 0.4928471, -0.9549463, 0, 0, 0, 1, 1,
-1.24766, 1.432908, -0.3850626, 0, 0, 0, 1, 1,
-1.240973, -0.6905268, -2.915393, 0, 0, 0, 1, 1,
-1.230422, 1.92614, -2.808334, 0, 0, 0, 1, 1,
-1.227867, 0.8019568, -2.627081, 0, 0, 0, 1, 1,
-1.2257, 1.10712, -1.902681, 0, 0, 0, 1, 1,
-1.205846, 1.27993, 0.4549311, 0, 0, 0, 1, 1,
-1.198047, -0.479571, -0.6730627, 1, 1, 1, 1, 1,
-1.197697, 0.02792619, -2.314377, 1, 1, 1, 1, 1,
-1.19752, 0.3956205, -1.756064, 1, 1, 1, 1, 1,
-1.196896, -1.30803, -2.558276, 1, 1, 1, 1, 1,
-1.194364, -0.9674632, -2.668682, 1, 1, 1, 1, 1,
-1.186081, 1.007893, -1.736565, 1, 1, 1, 1, 1,
-1.179798, -0.3820542, -1.671496, 1, 1, 1, 1, 1,
-1.175359, 1.118805, 0.08604687, 1, 1, 1, 1, 1,
-1.172083, 0.02215576, 0.7101032, 1, 1, 1, 1, 1,
-1.170109, -0.1869271, -2.269999, 1, 1, 1, 1, 1,
-1.169513, -1.048039, -2.881029, 1, 1, 1, 1, 1,
-1.15895, -0.2997541, -1.67912, 1, 1, 1, 1, 1,
-1.150603, -1.270157, -3.194529, 1, 1, 1, 1, 1,
-1.146718, 0.2766396, -2.837927, 1, 1, 1, 1, 1,
-1.146689, 1.244801, -0.7170729, 1, 1, 1, 1, 1,
-1.143252, -0.7071065, -3.622563, 0, 0, 1, 1, 1,
-1.142337, 1.14133, -1.172642, 1, 0, 0, 1, 1,
-1.139976, 0.01911965, -2.886578, 1, 0, 0, 1, 1,
-1.13876, 0.08958233, 0.5950991, 1, 0, 0, 1, 1,
-1.138548, 1.311713, 0.7164987, 1, 0, 0, 1, 1,
-1.13657, 1.299536, -0.7847535, 1, 0, 0, 1, 1,
-1.134144, -0.7251563, -0.3369583, 0, 0, 0, 1, 1,
-1.123809, -1.032692, -1.839027, 0, 0, 0, 1, 1,
-1.119181, -2.304061, -2.62258, 0, 0, 0, 1, 1,
-1.105687, -1.982343, -0.8575515, 0, 0, 0, 1, 1,
-1.102602, 1.480431, -0.1032404, 0, 0, 0, 1, 1,
-1.101694, -2.047355, -2.327316, 0, 0, 0, 1, 1,
-1.084184, -1.717601, -2.106516, 0, 0, 0, 1, 1,
-1.073141, 1.949799, 0.3271582, 1, 1, 1, 1, 1,
-1.068693, -0.1410835, -0.4193636, 1, 1, 1, 1, 1,
-1.068137, 2.48471, -0.4932362, 1, 1, 1, 1, 1,
-1.059245, -1.17569, -2.062911, 1, 1, 1, 1, 1,
-1.041195, -0.1423928, -1.675491, 1, 1, 1, 1, 1,
-1.032823, 0.4102273, -0.8931625, 1, 1, 1, 1, 1,
-1.03198, 1.595843, -1.270325, 1, 1, 1, 1, 1,
-1.02966, 0.06626863, -1.150016, 1, 1, 1, 1, 1,
-1.024292, -1.569701, -1.823247, 1, 1, 1, 1, 1,
-1.014721, -1.547821, -2.091692, 1, 1, 1, 1, 1,
-1.01394, -2.403497, -0.8299021, 1, 1, 1, 1, 1,
-1.012008, 1.098124, -2.251798, 1, 1, 1, 1, 1,
-1.011628, -0.742016, -2.335207, 1, 1, 1, 1, 1,
-1.010416, -0.9758328, -2.863539, 1, 1, 1, 1, 1,
-1.000076, -0.8182827, -2.179418, 1, 1, 1, 1, 1,
-0.9979128, 2.45994, -1.398581, 0, 0, 1, 1, 1,
-0.9977501, 1.502255, -0.4703518, 1, 0, 0, 1, 1,
-0.9973683, 0.07560734, -1.890183, 1, 0, 0, 1, 1,
-0.9948378, -0.4189424, -0.7637183, 1, 0, 0, 1, 1,
-0.9907081, 0.06270467, -1.345695, 1, 0, 0, 1, 1,
-0.9898049, 0.6030877, -0.7121688, 1, 0, 0, 1, 1,
-0.9867201, 1.149499, -0.803431, 0, 0, 0, 1, 1,
-0.9852822, -1.572789, -0.8294925, 0, 0, 0, 1, 1,
-0.9840475, -1.325469, -2.662235, 0, 0, 0, 1, 1,
-0.9836855, -0.1459831, -0.2858421, 0, 0, 0, 1, 1,
-0.9799209, -0.3844079, -2.550711, 0, 0, 0, 1, 1,
-0.9778161, -0.3466525, -1.324767, 0, 0, 0, 1, 1,
-0.9747503, -0.8258348, -0.7206231, 0, 0, 0, 1, 1,
-0.9738714, -0.112667, -1.233837, 1, 1, 1, 1, 1,
-0.9686905, -1.690901, -2.743527, 1, 1, 1, 1, 1,
-0.9668943, -0.4895745, -2.143237, 1, 1, 1, 1, 1,
-0.9662575, -0.9901057, -1.95451, 1, 1, 1, 1, 1,
-0.9567954, 0.5595643, -0.5801055, 1, 1, 1, 1, 1,
-0.9542828, -0.1914607, -0.3559434, 1, 1, 1, 1, 1,
-0.9494199, 1.245573, -0.3202913, 1, 1, 1, 1, 1,
-0.9463086, -0.01150986, -3.297533, 1, 1, 1, 1, 1,
-0.9450537, -0.9000655, -4.526021, 1, 1, 1, 1, 1,
-0.9421894, 0.3782654, -0.7583243, 1, 1, 1, 1, 1,
-0.9406008, 1.051232, 0.8044144, 1, 1, 1, 1, 1,
-0.9312237, -0.655596, -3.670777, 1, 1, 1, 1, 1,
-0.929711, 0.6094429, -1.343672, 1, 1, 1, 1, 1,
-0.9283096, -0.1759696, 0.8947092, 1, 1, 1, 1, 1,
-0.926457, -0.3240464, -1.5335, 1, 1, 1, 1, 1,
-0.9193943, 0.02598615, -2.076997, 0, 0, 1, 1, 1,
-0.9149277, 1.521296, 0.483717, 1, 0, 0, 1, 1,
-0.9036584, -0.2706947, -1.50758, 1, 0, 0, 1, 1,
-0.8965609, -0.958636, -3.042704, 1, 0, 0, 1, 1,
-0.8951687, 0.8856413, -1.227519, 1, 0, 0, 1, 1,
-0.8921756, 0.04363241, -1.554556, 1, 0, 0, 1, 1,
-0.8918913, -0.7814842, -1.931586, 0, 0, 0, 1, 1,
-0.8891121, 0.2574914, -0.6577133, 0, 0, 0, 1, 1,
-0.8879452, 0.9698355, -0.8030984, 0, 0, 0, 1, 1,
-0.8784768, -0.182826, -1.771806, 0, 0, 0, 1, 1,
-0.8756689, -0.5445315, -0.9866575, 0, 0, 0, 1, 1,
-0.875185, 1.131083, 0.1319526, 0, 0, 0, 1, 1,
-0.8684696, 0.07480851, -2.035838, 0, 0, 0, 1, 1,
-0.8672509, -0.4298269, -1.977329, 1, 1, 1, 1, 1,
-0.8595156, -0.7744803, -2.257372, 1, 1, 1, 1, 1,
-0.857057, 1.305472, -0.4591067, 1, 1, 1, 1, 1,
-0.8565382, 0.8138004, 0.01565284, 1, 1, 1, 1, 1,
-0.8494053, -0.548384, -1.893423, 1, 1, 1, 1, 1,
-0.847344, -0.03097708, -1.866432, 1, 1, 1, 1, 1,
-0.8429571, -0.986116, -3.282996, 1, 1, 1, 1, 1,
-0.8373094, -0.8044471, -0.7948695, 1, 1, 1, 1, 1,
-0.8230289, -1.3888, -2.69709, 1, 1, 1, 1, 1,
-0.8223665, -1.134462, -1.90143, 1, 1, 1, 1, 1,
-0.811345, 0.1384052, -1.560253, 1, 1, 1, 1, 1,
-0.8109258, -0.2954176, 0.5287794, 1, 1, 1, 1, 1,
-0.8070292, 0.9811971, -0.5131328, 1, 1, 1, 1, 1,
-0.8013507, -0.9704617, -2.416158, 1, 1, 1, 1, 1,
-0.797164, 1.770429, 1.445049, 1, 1, 1, 1, 1,
-0.7968671, 0.6497009, -1.45383, 0, 0, 1, 1, 1,
-0.7964047, 1.285097, 0.5722227, 1, 0, 0, 1, 1,
-0.7950832, -1.484308, -2.204937, 1, 0, 0, 1, 1,
-0.795064, 0.2278242, 0.3127676, 1, 0, 0, 1, 1,
-0.7862846, 0.6145998, 0.04559523, 1, 0, 0, 1, 1,
-0.7853171, 0.673943, -1.572654, 1, 0, 0, 1, 1,
-0.7805454, 0.4731424, 0.9219206, 0, 0, 0, 1, 1,
-0.7784529, 0.696654, -0.1578041, 0, 0, 0, 1, 1,
-0.7761731, -0.4470088, -0.876102, 0, 0, 0, 1, 1,
-0.7660749, 1.084216, -1.677434, 0, 0, 0, 1, 1,
-0.7632754, 1.374353, 0.240519, 0, 0, 0, 1, 1,
-0.7628397, -0.06943587, -1.320038, 0, 0, 0, 1, 1,
-0.7598959, -0.9152591, -1.970691, 0, 0, 0, 1, 1,
-0.7502785, -0.4174003, -1.338297, 1, 1, 1, 1, 1,
-0.7439077, -1.142282, -1.536396, 1, 1, 1, 1, 1,
-0.7386485, -0.6322622, -2.783296, 1, 1, 1, 1, 1,
-0.7365996, 1.250709, -0.9993581, 1, 1, 1, 1, 1,
-0.7341881, -0.6082572, -2.110555, 1, 1, 1, 1, 1,
-0.726247, 0.6981081, -2.221318, 1, 1, 1, 1, 1,
-0.7257216, 0.1088731, -3.561861, 1, 1, 1, 1, 1,
-0.7099739, 0.4975877, -3.09344, 1, 1, 1, 1, 1,
-0.7079527, 0.2553965, -1.989147, 1, 1, 1, 1, 1,
-0.7021992, 1.488474, -1.183295, 1, 1, 1, 1, 1,
-0.6997558, 1.141846, -2.463133, 1, 1, 1, 1, 1,
-0.6987921, 2.470986, 0.1240124, 1, 1, 1, 1, 1,
-0.6983419, -0.8252239, -1.054081, 1, 1, 1, 1, 1,
-0.6972276, 2.430635, -1.757397, 1, 1, 1, 1, 1,
-0.6966815, 0.7521769, 0.1199357, 1, 1, 1, 1, 1,
-0.6935518, -0.6245974, -2.340399, 0, 0, 1, 1, 1,
-0.6921022, 0.09226996, -2.610391, 1, 0, 0, 1, 1,
-0.6813905, -1.36215, -3.319874, 1, 0, 0, 1, 1,
-0.6747563, 0.9627486, 0.3060468, 1, 0, 0, 1, 1,
-0.6726015, 0.872825, 0.3346551, 1, 0, 0, 1, 1,
-0.6714357, -1.237596, -1.944255, 1, 0, 0, 1, 1,
-0.6703464, -1.493961, -3.45103, 0, 0, 0, 1, 1,
-0.6646276, -0.199232, -2.916091, 0, 0, 0, 1, 1,
-0.6637458, 0.4336558, -0.682968, 0, 0, 0, 1, 1,
-0.6617647, 0.9656865, 0.8646154, 0, 0, 0, 1, 1,
-0.6564111, 0.4131035, 0.7172198, 0, 0, 0, 1, 1,
-0.6447579, -0.801329, -2.783835, 0, 0, 0, 1, 1,
-0.644033, -1.449522, -1.577319, 0, 0, 0, 1, 1,
-0.6411365, -0.5163246, -2.174331, 1, 1, 1, 1, 1,
-0.6348051, -0.1816303, -1.663796, 1, 1, 1, 1, 1,
-0.6338241, -0.2008507, -2.982139, 1, 1, 1, 1, 1,
-0.6335754, 0.6972741, 1.056377, 1, 1, 1, 1, 1,
-0.6312672, 0.8129226, -0.9620705, 1, 1, 1, 1, 1,
-0.6308488, -0.1208928, -2.5107, 1, 1, 1, 1, 1,
-0.6298648, 0.7997868, -0.9822536, 1, 1, 1, 1, 1,
-0.6287177, -0.9285801, -2.507918, 1, 1, 1, 1, 1,
-0.6286394, 0.7540472, 0.2165607, 1, 1, 1, 1, 1,
-0.6219044, -0.59824, -2.489546, 1, 1, 1, 1, 1,
-0.6217039, -0.1615593, -1.100711, 1, 1, 1, 1, 1,
-0.6102979, -0.3553781, -1.228125, 1, 1, 1, 1, 1,
-0.609765, 0.6550394, -1.526158, 1, 1, 1, 1, 1,
-0.6096717, -1.082558, -2.188966, 1, 1, 1, 1, 1,
-0.6094696, -0.331319, -1.588696, 1, 1, 1, 1, 1,
-0.6054674, -1.138022, -0.8375906, 0, 0, 1, 1, 1,
-0.6050149, 0.01997527, -0.2271916, 1, 0, 0, 1, 1,
-0.6028836, 0.9204766, -1.937824, 1, 0, 0, 1, 1,
-0.590732, 0.1465413, -0.6864331, 1, 0, 0, 1, 1,
-0.5871078, 1.543848, -0.461316, 1, 0, 0, 1, 1,
-0.5826178, 0.008039032, 0.3573324, 1, 0, 0, 1, 1,
-0.5809587, 0.6824119, -1.075636, 0, 0, 0, 1, 1,
-0.5759368, 1.196912, 1.205091, 0, 0, 0, 1, 1,
-0.5730472, -0.904662, -1.70814, 0, 0, 0, 1, 1,
-0.5713348, 0.8281991, 0.1898402, 0, 0, 0, 1, 1,
-0.558645, -0.9185206, -2.082738, 0, 0, 0, 1, 1,
-0.5551444, 0.8244089, -1.776031, 0, 0, 0, 1, 1,
-0.5539123, -1.249991, -1.145841, 0, 0, 0, 1, 1,
-0.5530525, -0.219483, -2.11803, 1, 1, 1, 1, 1,
-0.5511692, 1.132252, 0.2211674, 1, 1, 1, 1, 1,
-0.5510806, -0.3772705, -2.125605, 1, 1, 1, 1, 1,
-0.5492664, -0.7712054, -1.567026, 1, 1, 1, 1, 1,
-0.5491772, -0.4193888, -1.916952, 1, 1, 1, 1, 1,
-0.5439546, -2.575061, -2.402256, 1, 1, 1, 1, 1,
-0.5429018, -1.973879, -1.369337, 1, 1, 1, 1, 1,
-0.5373316, -0.8803775, -1.450518, 1, 1, 1, 1, 1,
-0.5356654, -0.7108456, -2.993225, 1, 1, 1, 1, 1,
-0.5324108, 0.1913195, -0.6383967, 1, 1, 1, 1, 1,
-0.5308177, -0.5209795, -1.110137, 1, 1, 1, 1, 1,
-0.5305602, -0.3239795, -1.660679, 1, 1, 1, 1, 1,
-0.5282356, -1.164046, -4.015626, 1, 1, 1, 1, 1,
-0.5254652, 0.7333645, 0.7540734, 1, 1, 1, 1, 1,
-0.524288, 0.6391938, -0.6427696, 1, 1, 1, 1, 1,
-0.5139346, 0.8458763, -0.7188803, 0, 0, 1, 1, 1,
-0.5073271, -1.19151, -4.279837, 1, 0, 0, 1, 1,
-0.5069155, 1.49553, -0.4641474, 1, 0, 0, 1, 1,
-0.506213, 0.121277, -1.142106, 1, 0, 0, 1, 1,
-0.5056803, 0.120755, -1.681769, 1, 0, 0, 1, 1,
-0.5056385, 0.2382531, -0.1178129, 1, 0, 0, 1, 1,
-0.5054312, -1.433523, -3.16434, 0, 0, 0, 1, 1,
-0.5045471, -1.029867, -3.660465, 0, 0, 0, 1, 1,
-0.5024407, 0.02880728, -1.914353, 0, 0, 0, 1, 1,
-0.501855, 0.229588, -2.943316, 0, 0, 0, 1, 1,
-0.4996538, 0.1664502, -2.238297, 0, 0, 0, 1, 1,
-0.4978961, 0.2506462, -1.882352, 0, 0, 0, 1, 1,
-0.4974889, -0.6706612, -2.460181, 0, 0, 0, 1, 1,
-0.4948231, -1.514314, -1.248661, 1, 1, 1, 1, 1,
-0.4944188, -0.7695053, -1.700336, 1, 1, 1, 1, 1,
-0.4820306, -1.651324, -2.379541, 1, 1, 1, 1, 1,
-0.480217, -1.024349, -3.474013, 1, 1, 1, 1, 1,
-0.4790311, -1.046464, -1.235624, 1, 1, 1, 1, 1,
-0.4764586, 1.326391, -0.4048063, 1, 1, 1, 1, 1,
-0.4694651, -0.3842613, -2.141283, 1, 1, 1, 1, 1,
-0.4672744, 1.089529, -1.335562, 1, 1, 1, 1, 1,
-0.4589613, 0.03287334, -1.405867, 1, 1, 1, 1, 1,
-0.4573254, -1.655922, -4.420326, 1, 1, 1, 1, 1,
-0.4497293, 1.006069, -1.053801, 1, 1, 1, 1, 1,
-0.4445623, -0.135818, -0.9824673, 1, 1, 1, 1, 1,
-0.4435486, 0.3625125, -0.5955524, 1, 1, 1, 1, 1,
-0.4401956, 0.8259451, 0.9737387, 1, 1, 1, 1, 1,
-0.4377085, 0.9335689, -0.9281116, 1, 1, 1, 1, 1,
-0.4354015, 0.8080298, -0.3853596, 0, 0, 1, 1, 1,
-0.4322537, -1.049987, -2.214624, 1, 0, 0, 1, 1,
-0.4276176, 0.9357833, -1.823348, 1, 0, 0, 1, 1,
-0.4272553, -0.9603806, -3.22876, 1, 0, 0, 1, 1,
-0.4272053, 0.6252154, 0.07975978, 1, 0, 0, 1, 1,
-0.4212419, 1.522571, 0.8348776, 1, 0, 0, 1, 1,
-0.416976, -3.115943, -2.489451, 0, 0, 0, 1, 1,
-0.4114696, 1.553999, 0.7825209, 0, 0, 0, 1, 1,
-0.4053661, -0.4803863, -1.176439, 0, 0, 0, 1, 1,
-0.404817, -1.236298, -2.965445, 0, 0, 0, 1, 1,
-0.4041539, -0.503729, -2.052935, 0, 0, 0, 1, 1,
-0.4037237, 0.5767058, 0.2098724, 0, 0, 0, 1, 1,
-0.4025554, -0.1470959, -0.6349923, 0, 0, 0, 1, 1,
-0.4025314, -0.8045748, -2.081301, 1, 1, 1, 1, 1,
-0.4015049, 1.051915, -2.753301, 1, 1, 1, 1, 1,
-0.4014166, 1.406118, -0.1566287, 1, 1, 1, 1, 1,
-0.3937416, -1.380408, -2.696739, 1, 1, 1, 1, 1,
-0.3936585, 0.5176197, 0.2095879, 1, 1, 1, 1, 1,
-0.3907878, -1.111716, -3.52453, 1, 1, 1, 1, 1,
-0.3852432, -0.5742267, -1.229444, 1, 1, 1, 1, 1,
-0.3764812, 0.03578977, -1.764534, 1, 1, 1, 1, 1,
-0.376385, -0.8459948, -1.889238, 1, 1, 1, 1, 1,
-0.3758704, 2.237516, -1.073727, 1, 1, 1, 1, 1,
-0.3742993, -0.3018792, -1.512987, 1, 1, 1, 1, 1,
-0.3742782, -0.7053615, -1.676323, 1, 1, 1, 1, 1,
-0.3741299, -0.3452773, -1.628442, 1, 1, 1, 1, 1,
-0.3730397, -0.4061832, -2.141385, 1, 1, 1, 1, 1,
-0.3709041, 1.453577, 1.813545, 1, 1, 1, 1, 1,
-0.3698606, 0.8256834, -0.03326757, 0, 0, 1, 1, 1,
-0.3686791, 0.5886154, -1.012783, 1, 0, 0, 1, 1,
-0.364022, -0.5945517, -3.151574, 1, 0, 0, 1, 1,
-0.360763, 2.048514, 1.622541, 1, 0, 0, 1, 1,
-0.3591287, -0.8495694, -1.441536, 1, 0, 0, 1, 1,
-0.3581572, 0.2771831, -2.382221, 1, 0, 0, 1, 1,
-0.3579623, -2.257706, -2.656992, 0, 0, 0, 1, 1,
-0.3537457, 1.804484, -0.6965216, 0, 0, 0, 1, 1,
-0.3495818, 0.1376379, -2.148054, 0, 0, 0, 1, 1,
-0.3479919, -0.2559461, -2.999694, 0, 0, 0, 1, 1,
-0.3478465, -0.3501071, -2.586317, 0, 0, 0, 1, 1,
-0.3465936, -0.3204741, -1.337103, 0, 0, 0, 1, 1,
-0.3419465, -1.3508, -2.392736, 0, 0, 0, 1, 1,
-0.3396505, 0.009735606, 0.7313656, 1, 1, 1, 1, 1,
-0.3382981, 1.310587, 0.8532639, 1, 1, 1, 1, 1,
-0.3378283, 0.1757967, 0.3260363, 1, 1, 1, 1, 1,
-0.3377346, -1.871091, -2.868636, 1, 1, 1, 1, 1,
-0.3315691, -1.343218, -2.745752, 1, 1, 1, 1, 1,
-0.3256857, 0.1439522, -0.1033236, 1, 1, 1, 1, 1,
-0.3234716, -0.408153, -1.012221, 1, 1, 1, 1, 1,
-0.3157746, -0.7508696, -4.016068, 1, 1, 1, 1, 1,
-0.3137535, -0.4007173, -1.123341, 1, 1, 1, 1, 1,
-0.3107359, 0.8516103, -0.6538866, 1, 1, 1, 1, 1,
-0.3098878, 1.876325, 1.275071, 1, 1, 1, 1, 1,
-0.3090763, 0.2398338, 1.166062, 1, 1, 1, 1, 1,
-0.3070439, -1.275787, -4.13638, 1, 1, 1, 1, 1,
-0.3031816, 1.009097, -0.2860143, 1, 1, 1, 1, 1,
-0.3024383, -1.061609, -3.775321, 1, 1, 1, 1, 1,
-0.3021412, 0.276806, -0.6063876, 0, 0, 1, 1, 1,
-0.3006918, -1.672766, -3.520436, 1, 0, 0, 1, 1,
-0.3006729, -0.1289642, -2.682067, 1, 0, 0, 1, 1,
-0.2993043, -1.323078, -2.694448, 1, 0, 0, 1, 1,
-0.2990686, -1.044302, -4.017315, 1, 0, 0, 1, 1,
-0.2988918, 1.01878, 0.1435191, 1, 0, 0, 1, 1,
-0.2981494, 1.52611, -0.236997, 0, 0, 0, 1, 1,
-0.2900786, -0.5527307, -1.363108, 0, 0, 0, 1, 1,
-0.2857035, 0.4680299, -1.427363, 0, 0, 0, 1, 1,
-0.2783886, 0.60207, 0.7879874, 0, 0, 0, 1, 1,
-0.2770407, -0.6761876, -2.320353, 0, 0, 0, 1, 1,
-0.2638156, -1.055982, -4.654315, 0, 0, 0, 1, 1,
-0.2613018, 1.696122, -1.386978, 0, 0, 0, 1, 1,
-0.2592281, -0.7083982, -2.129608, 1, 1, 1, 1, 1,
-0.2586878, -1.471765, -2.31129, 1, 1, 1, 1, 1,
-0.2579007, -0.7722024, -1.8433, 1, 1, 1, 1, 1,
-0.2569194, -0.01859537, -3.538471, 1, 1, 1, 1, 1,
-0.2565472, -0.3832091, -4.180954, 1, 1, 1, 1, 1,
-0.2537011, 0.03892802, -1.877867, 1, 1, 1, 1, 1,
-0.24571, -0.4635058, 0.08502655, 1, 1, 1, 1, 1,
-0.2397974, 1.286451, 0.521564, 1, 1, 1, 1, 1,
-0.2375762, 0.4065631, -1.094671, 1, 1, 1, 1, 1,
-0.2175127, -0.4161927, -2.609089, 1, 1, 1, 1, 1,
-0.2153759, 0.6648626, -0.5904891, 1, 1, 1, 1, 1,
-0.2147528, -1.541968, -2.831961, 1, 1, 1, 1, 1,
-0.2100152, -1.531784, -3.383979, 1, 1, 1, 1, 1,
-0.2096307, 0.2920511, 0.3395689, 1, 1, 1, 1, 1,
-0.2072517, 0.727451, -2.369043, 1, 1, 1, 1, 1,
-0.2058162, 1.509807, 0.3411161, 0, 0, 1, 1, 1,
-0.1937694, -1.216181, -2.636861, 1, 0, 0, 1, 1,
-0.1935726, 1.384102, -0.9751992, 1, 0, 0, 1, 1,
-0.1930289, -1.426918, -3.262008, 1, 0, 0, 1, 1,
-0.1917325, 1.660142, -1.118293, 1, 0, 0, 1, 1,
-0.1908791, -1.141275, -1.170155, 1, 0, 0, 1, 1,
-0.1901787, 1.805336, 0.8397522, 0, 0, 0, 1, 1,
-0.180787, 0.8281022, -0.5577322, 0, 0, 0, 1, 1,
-0.1799155, -0.5216119, -3.070809, 0, 0, 0, 1, 1,
-0.1787876, -0.2621385, -2.805387, 0, 0, 0, 1, 1,
-0.1783874, -2.843252, -3.433066, 0, 0, 0, 1, 1,
-0.1781442, -1.536165, -2.432819, 0, 0, 0, 1, 1,
-0.1774449, 0.5666668, -0.6031128, 0, 0, 0, 1, 1,
-0.1764684, 0.3844591, 1.054865, 1, 1, 1, 1, 1,
-0.1733156, -0.6041755, -1.625214, 1, 1, 1, 1, 1,
-0.1679163, -0.8747849, -2.402024, 1, 1, 1, 1, 1,
-0.1648113, -0.2339223, -1.834966, 1, 1, 1, 1, 1,
-0.1623867, 0.769694, -0.1966157, 1, 1, 1, 1, 1,
-0.1576931, -0.7955998, -4.019041, 1, 1, 1, 1, 1,
-0.1574518, -0.2815337, -1.712663, 1, 1, 1, 1, 1,
-0.1541703, 1.703254, 0.7769816, 1, 1, 1, 1, 1,
-0.1511585, -1.235695, -4.554841, 1, 1, 1, 1, 1,
-0.1499517, 0.9120419, -0.3146505, 1, 1, 1, 1, 1,
-0.1498943, -0.4877782, -3.495129, 1, 1, 1, 1, 1,
-0.1482387, 1.376796, 0.5415531, 1, 1, 1, 1, 1,
-0.148092, 1.533026, 0.1364794, 1, 1, 1, 1, 1,
-0.1471576, 0.6129645, -0.8263872, 1, 1, 1, 1, 1,
-0.1470891, -0.0630253, -1.180838, 1, 1, 1, 1, 1,
-0.1459579, 0.0207302, -3.000782, 0, 0, 1, 1, 1,
-0.1457055, -1.939973, -4.276977, 1, 0, 0, 1, 1,
-0.1447237, 1.289894, -0.4408535, 1, 0, 0, 1, 1,
-0.1424834, -0.511457, -4.146638, 1, 0, 0, 1, 1,
-0.1415894, 1.404688, 0.9033906, 1, 0, 0, 1, 1,
-0.141049, -1.203911, -1.610614, 1, 0, 0, 1, 1,
-0.1363397, 1.689017, -0.4526675, 0, 0, 0, 1, 1,
-0.1360834, -0.06710756, -1.954455, 0, 0, 0, 1, 1,
-0.1303056, -0.3996365, -3.31002, 0, 0, 0, 1, 1,
-0.1299269, 0.1062878, -1.503347, 0, 0, 0, 1, 1,
-0.1282292, 0.4265418, -1.015038, 0, 0, 0, 1, 1,
-0.1236711, 0.1152836, -0.7906238, 0, 0, 0, 1, 1,
-0.1219297, 0.292645, -1.315457, 0, 0, 0, 1, 1,
-0.1194656, 0.6682176, 0.7634346, 1, 1, 1, 1, 1,
-0.1188121, -0.3825355, -0.6215066, 1, 1, 1, 1, 1,
-0.1176944, 0.6837337, -0.8717015, 1, 1, 1, 1, 1,
-0.1149734, 1.806291, -0.3739024, 1, 1, 1, 1, 1,
-0.112851, 1.471232, -0.3360752, 1, 1, 1, 1, 1,
-0.1126628, 1.964759, -0.5341759, 1, 1, 1, 1, 1,
-0.1123319, -0.1806298, -2.885989, 1, 1, 1, 1, 1,
-0.1104044, 0.1464275, 1.020058, 1, 1, 1, 1, 1,
-0.1053897, 0.2057932, -0.6425259, 1, 1, 1, 1, 1,
-0.1039032, -0.4212421, -2.396642, 1, 1, 1, 1, 1,
-0.1015292, 0.4223614, 0.4156511, 1, 1, 1, 1, 1,
-0.1013709, -0.182175, -3.478713, 1, 1, 1, 1, 1,
-0.0965401, 0.3795089, -1.703305, 1, 1, 1, 1, 1,
-0.09458154, 0.7520461, -0.7829584, 1, 1, 1, 1, 1,
-0.08970777, 0.3279788, 0.533595, 1, 1, 1, 1, 1,
-0.08860608, -0.1111127, -3.356341, 0, 0, 1, 1, 1,
-0.08738257, 0.6019546, 0.6128153, 1, 0, 0, 1, 1,
-0.08610106, 0.1901001, 0.3736242, 1, 0, 0, 1, 1,
-0.08440579, 0.5206169, -0.4950246, 1, 0, 0, 1, 1,
-0.08366624, -1.79441, -4.113969, 1, 0, 0, 1, 1,
-0.0825946, 1.150918, -1.138839, 1, 0, 0, 1, 1,
-0.08105841, -1.288606, -2.830464, 0, 0, 0, 1, 1,
-0.07732908, 1.626639, 0.7666328, 0, 0, 0, 1, 1,
-0.07320815, -0.6494594, -2.315441, 0, 0, 0, 1, 1,
-0.07262472, 1.502696, -0.9770705, 0, 0, 0, 1, 1,
-0.07079146, -0.2247829, -3.309443, 0, 0, 0, 1, 1,
-0.06981769, 0.0929789, -0.01840993, 0, 0, 0, 1, 1,
-0.06933725, -0.9469243, -4.531542, 0, 0, 0, 1, 1,
-0.06468423, 1.254649, 1.232056, 1, 1, 1, 1, 1,
-0.06405456, -0.1944709, -0.6502139, 1, 1, 1, 1, 1,
-0.05663684, 0.3647615, -1.113046, 1, 1, 1, 1, 1,
-0.04897773, 2.261091, -0.2719497, 1, 1, 1, 1, 1,
-0.04894897, 0.131594, -1.096732, 1, 1, 1, 1, 1,
-0.04755899, 0.7996884, -0.4180505, 1, 1, 1, 1, 1,
-0.04387529, 0.9610667, 0.965278, 1, 1, 1, 1, 1,
-0.03730874, 0.330038, 0.8357061, 1, 1, 1, 1, 1,
-0.03691556, 1.753335, -2.299335, 1, 1, 1, 1, 1,
-0.03301752, 0.02858414, -0.7506164, 1, 1, 1, 1, 1,
-0.03188524, -0.905212, -2.408969, 1, 1, 1, 1, 1,
-0.02712418, 0.6926214, -0.7771932, 1, 1, 1, 1, 1,
-0.0245586, 0.7165299, 0.7104875, 1, 1, 1, 1, 1,
-0.0242281, -0.38864, -3.616067, 1, 1, 1, 1, 1,
-0.02117886, -0.4616889, -3.011351, 1, 1, 1, 1, 1,
-0.01830859, -0.5734406, -3.964489, 0, 0, 1, 1, 1,
-0.01825972, 0.0001930348, -0.9398709, 1, 0, 0, 1, 1,
-0.0182221, 0.1191909, 0.717288, 1, 0, 0, 1, 1,
-0.01744537, -0.4165844, -1.730506, 1, 0, 0, 1, 1,
-0.01325858, -0.7646716, -3.50938, 1, 0, 0, 1, 1,
-0.00951293, 0.1708945, 0.6206492, 1, 0, 0, 1, 1,
-0.006637356, -1.667564, -3.803142, 0, 0, 0, 1, 1,
-0.005876204, 0.6604596, -1.356627, 0, 0, 0, 1, 1,
-0.003527416, -0.03095263, -2.605974, 0, 0, 0, 1, 1,
-0.002149493, -1.28145, -3.459137, 0, 0, 0, 1, 1,
-0.001516846, 0.7390395, 0.1175795, 0, 0, 0, 1, 1,
-0.001411018, 0.1282817, 0.03614406, 0, 0, 0, 1, 1,
0.007964707, 0.4246105, -0.3623824, 0, 0, 0, 1, 1,
0.008090453, 0.6888051, -1.134888, 1, 1, 1, 1, 1,
0.009873981, 0.1755547, -0.6217473, 1, 1, 1, 1, 1,
0.01168857, 0.2225981, 0.1993926, 1, 1, 1, 1, 1,
0.01328012, 2.214344, 2.029388, 1, 1, 1, 1, 1,
0.01456591, -1.610368, 3.195147, 1, 1, 1, 1, 1,
0.01903873, -0.3551447, 2.618224, 1, 1, 1, 1, 1,
0.01943002, -0.08841068, 3.379301, 1, 1, 1, 1, 1,
0.01949448, 1.292294, 0.1612628, 1, 1, 1, 1, 1,
0.02152113, -2.097641, 2.683233, 1, 1, 1, 1, 1,
0.03052056, 0.3950765, -2.213485, 1, 1, 1, 1, 1,
0.03052495, 0.2468776, 0.6698317, 1, 1, 1, 1, 1,
0.03401266, -1.153731, 3.053294, 1, 1, 1, 1, 1,
0.03613696, 0.3427239, 0.6038666, 1, 1, 1, 1, 1,
0.03759107, 1.325695, -0.3136418, 1, 1, 1, 1, 1,
0.03968679, 1.342241, -0.4048531, 1, 1, 1, 1, 1,
0.04371262, -0.3311218, 3.477129, 0, 0, 1, 1, 1,
0.04530879, -1.16295, 5.386448, 1, 0, 0, 1, 1,
0.04550244, -0.4491917, 4.233116, 1, 0, 0, 1, 1,
0.04664349, 0.130291, 0.4624604, 1, 0, 0, 1, 1,
0.05374507, 0.001084826, 0.7486356, 1, 0, 0, 1, 1,
0.05549652, -0.4100145, 2.236689, 1, 0, 0, 1, 1,
0.05607572, 0.3638923, 0.2678941, 0, 0, 0, 1, 1,
0.06194806, -0.09265957, 2.774776, 0, 0, 0, 1, 1,
0.06200326, -0.388213, 4.074125, 0, 0, 0, 1, 1,
0.06724079, 1.013809, -0.5351338, 0, 0, 0, 1, 1,
0.07903825, 0.3979371, 0.2848362, 0, 0, 0, 1, 1,
0.07907546, 1.789548, -0.3279633, 0, 0, 0, 1, 1,
0.08036739, -0.1507729, 2.621516, 0, 0, 0, 1, 1,
0.084364, -0.008093907, 2.45352, 1, 1, 1, 1, 1,
0.08986604, 1.478573, 0.5974773, 1, 1, 1, 1, 1,
0.09581083, 0.2812777, 1.590515, 1, 1, 1, 1, 1,
0.09742503, 1.267907, 0.4638842, 1, 1, 1, 1, 1,
0.09994544, -1.356299, 1.875195, 1, 1, 1, 1, 1,
0.1007015, 0.2423822, -0.4000209, 1, 1, 1, 1, 1,
0.1062185, -0.5499567, 2.344769, 1, 1, 1, 1, 1,
0.1098902, -1.4692, 2.97976, 1, 1, 1, 1, 1,
0.1134615, 0.3259183, -0.005542734, 1, 1, 1, 1, 1,
0.1160244, 0.3598997, 0.6325277, 1, 1, 1, 1, 1,
0.1213784, -0.791985, 4.572948, 1, 1, 1, 1, 1,
0.1215797, -0.5810495, 3.934816, 1, 1, 1, 1, 1,
0.1264108, 0.7984322, -0.2694885, 1, 1, 1, 1, 1,
0.1278095, 0.5133277, 0.3801699, 1, 1, 1, 1, 1,
0.1284761, -1.103348, 3.848877, 1, 1, 1, 1, 1,
0.1285244, -1.240665, 2.702987, 0, 0, 1, 1, 1,
0.1294258, -0.407622, 2.211515, 1, 0, 0, 1, 1,
0.1314817, 1.204284, 1.336761, 1, 0, 0, 1, 1,
0.1371869, -1.795607, 4.210928, 1, 0, 0, 1, 1,
0.1381076, 0.2895026, 0.02559847, 1, 0, 0, 1, 1,
0.14154, 0.7280161, 0.2704476, 1, 0, 0, 1, 1,
0.1416553, -0.9405578, 2.558293, 0, 0, 0, 1, 1,
0.1427031, -0.6593739, 4.300229, 0, 0, 0, 1, 1,
0.1435028, -1.015216, 2.341612, 0, 0, 0, 1, 1,
0.1470939, -0.1838118, 4.045282, 0, 0, 0, 1, 1,
0.1491457, 0.4896553, 0.5391799, 0, 0, 0, 1, 1,
0.1497855, 1.206017, -0.7090704, 0, 0, 0, 1, 1,
0.1597154, -0.7112368, 4.222047, 0, 0, 0, 1, 1,
0.1649594, 0.9176094, 1.580297, 1, 1, 1, 1, 1,
0.1679206, -0.1343705, 2.915777, 1, 1, 1, 1, 1,
0.1682746, -0.2863036, 3.493136, 1, 1, 1, 1, 1,
0.1734095, -0.4371252, 2.446246, 1, 1, 1, 1, 1,
0.1765034, -2.752134, 3.967573, 1, 1, 1, 1, 1,
0.1770321, 1.511442, 1.643003, 1, 1, 1, 1, 1,
0.183358, -0.1361775, 2.535321, 1, 1, 1, 1, 1,
0.1891855, -1.894373, 2.895168, 1, 1, 1, 1, 1,
0.1914319, 2.017579, 0.1184774, 1, 1, 1, 1, 1,
0.1924489, 0.1829076, -0.334403, 1, 1, 1, 1, 1,
0.1943699, 0.7690711, 0.7784145, 1, 1, 1, 1, 1,
0.1943705, -1.101792, 4.07577, 1, 1, 1, 1, 1,
0.1982998, -0.7928834, 3.281011, 1, 1, 1, 1, 1,
0.2043895, 0.1716232, 1.039546, 1, 1, 1, 1, 1,
0.2058162, -1.528331, 1.618219, 1, 1, 1, 1, 1,
0.2100775, -0.4416603, 1.730994, 0, 0, 1, 1, 1,
0.210839, -1.39627, 2.785258, 1, 0, 0, 1, 1,
0.2108503, -0.9971695, 3.935889, 1, 0, 0, 1, 1,
0.2126162, 1.593623, -0.2247489, 1, 0, 0, 1, 1,
0.2193719, 1.879369, 1.965933, 1, 0, 0, 1, 1,
0.2204219, 0.3557474, 1.363322, 1, 0, 0, 1, 1,
0.2212857, 1.850735, 0.7980661, 0, 0, 0, 1, 1,
0.2221539, -2.61895, 1.43584, 0, 0, 0, 1, 1,
0.2273632, -0.3748171, 3.207571, 0, 0, 0, 1, 1,
0.2317448, -1.112043, 2.142263, 0, 0, 0, 1, 1,
0.2321078, 0.06089596, 0.7058017, 0, 0, 0, 1, 1,
0.2334893, 0.9923269, -1.013449, 0, 0, 0, 1, 1,
0.2336207, -0.236342, 3.173668, 0, 0, 0, 1, 1,
0.2363666, 0.5805863, 1.929255, 1, 1, 1, 1, 1,
0.2369822, 1.382257, -0.5676888, 1, 1, 1, 1, 1,
0.2508651, 0.4619181, 0.1644482, 1, 1, 1, 1, 1,
0.251932, -0.885237, 0.541558, 1, 1, 1, 1, 1,
0.2592287, -1.014203, 4.507882, 1, 1, 1, 1, 1,
0.2616335, -0.8334651, 2.334679, 1, 1, 1, 1, 1,
0.2660881, 1.018846, 1.124775, 1, 1, 1, 1, 1,
0.2725538, -0.9479396, 3.218658, 1, 1, 1, 1, 1,
0.2727353, -0.5456374, 2.361526, 1, 1, 1, 1, 1,
0.2742313, 0.214034, 1.710274, 1, 1, 1, 1, 1,
0.2821133, 0.4884644, 0.1406183, 1, 1, 1, 1, 1,
0.2837305, -0.285335, 3.449319, 1, 1, 1, 1, 1,
0.2868907, -1.14427, 1.894628, 1, 1, 1, 1, 1,
0.2885318, 2.000807, -0.7557181, 1, 1, 1, 1, 1,
0.2912814, 0.3489886, 1.081636, 1, 1, 1, 1, 1,
0.2917921, -0.1204574, 2.932383, 0, 0, 1, 1, 1,
0.2953102, 1.668109, -1.166925, 1, 0, 0, 1, 1,
0.2959337, -0.1971682, 2.707065, 1, 0, 0, 1, 1,
0.2972229, -0.4564601, 3.580676, 1, 0, 0, 1, 1,
0.2978333, -0.218857, 2.653637, 1, 0, 0, 1, 1,
0.3129346, 0.9889407, 2.273928, 1, 0, 0, 1, 1,
0.3137627, -0.1906036, 3.120402, 0, 0, 0, 1, 1,
0.3145367, -0.3901046, 1.192305, 0, 0, 0, 1, 1,
0.3159194, -1.1261, 3.36426, 0, 0, 0, 1, 1,
0.3185455, 1.022431, 1.011421, 0, 0, 0, 1, 1,
0.3211359, 1.489327, 0.8546773, 0, 0, 0, 1, 1,
0.3213794, -0.06568518, 0.7142063, 0, 0, 0, 1, 1,
0.3255139, 0.3117967, -0.146635, 0, 0, 0, 1, 1,
0.3301124, 0.6259879, -1.076534, 1, 1, 1, 1, 1,
0.3303504, -0.6009144, 1.140281, 1, 1, 1, 1, 1,
0.3321668, -0.9803436, 3.567414, 1, 1, 1, 1, 1,
0.3328592, 0.878986, 0.8604193, 1, 1, 1, 1, 1,
0.3352878, 0.372816, 0.7721644, 1, 1, 1, 1, 1,
0.3373328, -2.118193, 2.498884, 1, 1, 1, 1, 1,
0.3382735, -0.5325576, 4.998188, 1, 1, 1, 1, 1,
0.3394096, 0.9990313, 0.8898014, 1, 1, 1, 1, 1,
0.3400181, 0.7920025, 1.286635, 1, 1, 1, 1, 1,
0.3418197, -1.491459, 2.909142, 1, 1, 1, 1, 1,
0.3462127, 0.2884471, 2.278093, 1, 1, 1, 1, 1,
0.3470761, -2.908283, 1.574438, 1, 1, 1, 1, 1,
0.3534889, -0.8088104, 1.020017, 1, 1, 1, 1, 1,
0.3565184, -0.7183324, 2.907063, 1, 1, 1, 1, 1,
0.3568218, -0.5287436, 2.014055, 1, 1, 1, 1, 1,
0.3590629, -0.2545973, 2.481208, 0, 0, 1, 1, 1,
0.3597991, -0.5317518, 2.674799, 1, 0, 0, 1, 1,
0.3640271, -0.05518399, 2.449883, 1, 0, 0, 1, 1,
0.3673016, -0.7522935, 3.432121, 1, 0, 0, 1, 1,
0.3685896, -0.06146555, 1.74524, 1, 0, 0, 1, 1,
0.3689678, 1.48071, 0.6048005, 1, 0, 0, 1, 1,
0.3702864, 1.381973, 0.6810157, 0, 0, 0, 1, 1,
0.3723881, -1.405506, 2.357373, 0, 0, 0, 1, 1,
0.3738213, -0.7531299, 2.987134, 0, 0, 0, 1, 1,
0.374891, -0.2325999, 2.544436, 0, 0, 0, 1, 1,
0.3821712, -0.2498168, 1.965262, 0, 0, 0, 1, 1,
0.3836398, -0.3415301, 1.07945, 0, 0, 0, 1, 1,
0.384449, -0.02558168, -0.7035698, 0, 0, 0, 1, 1,
0.3869527, 0.540469, 0.4980194, 1, 1, 1, 1, 1,
0.3883072, 0.197475, 0.8531122, 1, 1, 1, 1, 1,
0.3897896, 0.1329455, 2.900841, 1, 1, 1, 1, 1,
0.3902484, -0.6999303, 2.470928, 1, 1, 1, 1, 1,
0.3959956, -0.01622779, 0.8325461, 1, 1, 1, 1, 1,
0.3976103, 0.04267437, 3.036304, 1, 1, 1, 1, 1,
0.401852, 1.579912, 0.05801127, 1, 1, 1, 1, 1,
0.4021669, 0.3506419, -0.407418, 1, 1, 1, 1, 1,
0.4078116, -0.945492, 2.94667, 1, 1, 1, 1, 1,
0.4110437, -0.0803646, 1.310224, 1, 1, 1, 1, 1,
0.4201479, 1.096189, 1.167528, 1, 1, 1, 1, 1,
0.4209868, 0.3579984, 2.295499, 1, 1, 1, 1, 1,
0.4221149, 0.7326529, 0.5155406, 1, 1, 1, 1, 1,
0.4239579, 1.860156, 0.7903416, 1, 1, 1, 1, 1,
0.4271821, 0.7273986, -0.3703091, 1, 1, 1, 1, 1,
0.430349, -0.2773668, 2.26033, 0, 0, 1, 1, 1,
0.4357969, -0.43728, 2.050377, 1, 0, 0, 1, 1,
0.4361663, 0.9715428, -0.8015521, 1, 0, 0, 1, 1,
0.4385853, -1.503108, 1.613667, 1, 0, 0, 1, 1,
0.4398864, 0.131593, 0.5545907, 1, 0, 0, 1, 1,
0.4442231, -0.864245, 2.858517, 1, 0, 0, 1, 1,
0.4471393, -0.0447542, 1.784444, 0, 0, 0, 1, 1,
0.4475085, -0.05558746, 0.5892741, 0, 0, 0, 1, 1,
0.4484049, -1.362, 1.947617, 0, 0, 0, 1, 1,
0.4491753, -0.5252088, 1.953384, 0, 0, 0, 1, 1,
0.4514478, 1.434707, 1.622625, 0, 0, 0, 1, 1,
0.4530135, -1.0734, 1.441754, 0, 0, 0, 1, 1,
0.4593179, -0.3707469, 2.786731, 0, 0, 0, 1, 1,
0.4596698, 0.4751034, 0.4336416, 1, 1, 1, 1, 1,
0.4604345, -0.8498153, 2.99461, 1, 1, 1, 1, 1,
0.4623189, 0.8724105, 0.3236733, 1, 1, 1, 1, 1,
0.4656613, -0.4622075, 2.403885, 1, 1, 1, 1, 1,
0.466884, 0.7707251, 0.7743468, 1, 1, 1, 1, 1,
0.472939, -0.1476693, 2.004749, 1, 1, 1, 1, 1,
0.484619, -0.4485022, 3.817986, 1, 1, 1, 1, 1,
0.48652, -1.12496, 2.064718, 1, 1, 1, 1, 1,
0.4881514, 0.2473036, 1.0486, 1, 1, 1, 1, 1,
0.4883135, 0.8017786, 1.868846, 1, 1, 1, 1, 1,
0.4894625, 0.008492363, 0.3731855, 1, 1, 1, 1, 1,
0.4930032, -0.6074867, 2.166627, 1, 1, 1, 1, 1,
0.4946645, -0.6888443, 1.95307, 1, 1, 1, 1, 1,
0.4977348, -0.9178925, 0.7939917, 1, 1, 1, 1, 1,
0.4984161, -0.4849356, 3.140079, 1, 1, 1, 1, 1,
0.5034276, -0.2284714, 2.084628, 0, 0, 1, 1, 1,
0.5043595, -0.4309128, 1.362116, 1, 0, 0, 1, 1,
0.5056493, 1.012942, 0.8623169, 1, 0, 0, 1, 1,
0.5090925, -0.5815154, 2.089655, 1, 0, 0, 1, 1,
0.5097561, -0.3048358, 3.991875, 1, 0, 0, 1, 1,
0.5120532, -1.444121, 4.305367, 1, 0, 0, 1, 1,
0.5149371, -2.197628, 1.651563, 0, 0, 0, 1, 1,
0.5171027, 0.4329481, 1.468318, 0, 0, 0, 1, 1,
0.5238272, 0.002577568, 0.3038247, 0, 0, 0, 1, 1,
0.5242413, -0.1664753, 2.03931, 0, 0, 0, 1, 1,
0.53111, -1.573252, 2.367942, 0, 0, 0, 1, 1,
0.5333433, -0.2884163, 2.969983, 0, 0, 0, 1, 1,
0.5346719, 1.538368, 0.5349081, 0, 0, 0, 1, 1,
0.5355635, -0.8331717, 3.814849, 1, 1, 1, 1, 1,
0.5380339, 0.9758143, 1.189658, 1, 1, 1, 1, 1,
0.5389833, 0.1533751, 0.4238558, 1, 1, 1, 1, 1,
0.5410553, 0.9891985, 0.5997684, 1, 1, 1, 1, 1,
0.5416811, 1.80501, 1.517513, 1, 1, 1, 1, 1,
0.5443682, 0.8145477, 0.7675986, 1, 1, 1, 1, 1,
0.5469937, 0.8396534, 0.2954398, 1, 1, 1, 1, 1,
0.547224, -0.7986494, 2.652567, 1, 1, 1, 1, 1,
0.5478629, -1.173738, 5.231839, 1, 1, 1, 1, 1,
0.5557669, 0.8716461, -0.4531866, 1, 1, 1, 1, 1,
0.5574231, -0.2455109, 2.460203, 1, 1, 1, 1, 1,
0.5603763, -1.092233, 3.486068, 1, 1, 1, 1, 1,
0.5613633, -1.210939, 3.220722, 1, 1, 1, 1, 1,
0.567333, -1.258967, 1.860286, 1, 1, 1, 1, 1,
0.5684489, 0.1545123, 0.1920595, 1, 1, 1, 1, 1,
0.5703704, -0.1406347, 3.179468, 0, 0, 1, 1, 1,
0.5724965, 0.4145679, 2.49605, 1, 0, 0, 1, 1,
0.5740203, 1.031654, 1.308081, 1, 0, 0, 1, 1,
0.5831933, -0.2865283, 0.1904363, 1, 0, 0, 1, 1,
0.5897391, 0.4664419, 1.063443, 1, 0, 0, 1, 1,
0.5954062, 0.06371224, 1.529393, 1, 0, 0, 1, 1,
0.5969666, -1.514729, 4.251095, 0, 0, 0, 1, 1,
0.6038558, 0.982852, 0.1637388, 0, 0, 0, 1, 1,
0.6061257, 0.9040671, 1.541742, 0, 0, 0, 1, 1,
0.611561, 1.282339, 0.9547121, 0, 0, 0, 1, 1,
0.6163037, 0.4240592, 1.977928, 0, 0, 0, 1, 1,
0.6192526, -0.06676304, -0.5773943, 0, 0, 0, 1, 1,
0.6243297, -1.445637, 2.646858, 0, 0, 0, 1, 1,
0.6246316, -2.237445, 5.134113, 1, 1, 1, 1, 1,
0.6313021, -0.02323812, 3.601458, 1, 1, 1, 1, 1,
0.6320877, -2.01595, 3.363745, 1, 1, 1, 1, 1,
0.6327375, -0.08880776, 1.808498, 1, 1, 1, 1, 1,
0.6482965, -0.01459622, 1.541709, 1, 1, 1, 1, 1,
0.6487625, -0.0004651085, 2.51211, 1, 1, 1, 1, 1,
0.6503677, 0.006733923, 2.694578, 1, 1, 1, 1, 1,
0.6511756, 0.3892816, 3.012667, 1, 1, 1, 1, 1,
0.653718, -0.133344, 1.136195, 1, 1, 1, 1, 1,
0.6550632, -0.9188061, 1.76319, 1, 1, 1, 1, 1,
0.6558225, 0.3917002, 0.2670942, 1, 1, 1, 1, 1,
0.6608773, -1.083757, 0.8672633, 1, 1, 1, 1, 1,
0.6697176, 0.3608558, 0.239867, 1, 1, 1, 1, 1,
0.67186, -0.2606175, 3.321364, 1, 1, 1, 1, 1,
0.6739147, -1.098635, 3.720116, 1, 1, 1, 1, 1,
0.6740415, -1.232461, 1.755736, 0, 0, 1, 1, 1,
0.6826707, 0.2028873, 0.8899922, 1, 0, 0, 1, 1,
0.6862695, -1.60192, 2.40792, 1, 0, 0, 1, 1,
0.6865358, 1.323241, 0.4901696, 1, 0, 0, 1, 1,
0.6880793, 0.3107878, 2.382114, 1, 0, 0, 1, 1,
0.6910024, -0.3327397, 1.569493, 1, 0, 0, 1, 1,
0.6918993, 1.034513, -0.7787515, 0, 0, 0, 1, 1,
0.6952028, 0.08517074, 0.8001161, 0, 0, 0, 1, 1,
0.6958193, -0.1049296, 2.052326, 0, 0, 0, 1, 1,
0.6992688, 0.7098, 0.5362498, 0, 0, 0, 1, 1,
0.7031868, 0.4944086, 0.001746297, 0, 0, 0, 1, 1,
0.7035657, -1.10934, 3.833796, 0, 0, 0, 1, 1,
0.708066, -0.2207959, 0.7306361, 0, 0, 0, 1, 1,
0.7114782, 0.6691414, 0.2653874, 1, 1, 1, 1, 1,
0.7142739, 0.6647862, 1.225417, 1, 1, 1, 1, 1,
0.7167917, 0.5625452, 4.031397, 1, 1, 1, 1, 1,
0.7236424, 0.292225, 1.479471, 1, 1, 1, 1, 1,
0.7263251, 0.737929, 2.422368, 1, 1, 1, 1, 1,
0.7276837, -0.9093301, 0.7279334, 1, 1, 1, 1, 1,
0.7377406, -1.306511, 3.785097, 1, 1, 1, 1, 1,
0.7463908, -0.724449, 3.031616, 1, 1, 1, 1, 1,
0.7472591, -1.103044, 1.78238, 1, 1, 1, 1, 1,
0.7500246, -0.2673336, 0.1770055, 1, 1, 1, 1, 1,
0.7605359, -2.962321, 4.883586, 1, 1, 1, 1, 1,
0.7608427, 0.3488109, 1.383681, 1, 1, 1, 1, 1,
0.7677074, -0.4126758, 1.980539, 1, 1, 1, 1, 1,
0.7691531, -1.724868, 2.316149, 1, 1, 1, 1, 1,
0.769445, 0.8592045, 2.017209, 1, 1, 1, 1, 1,
0.7708553, 1.748766, 0.8172007, 0, 0, 1, 1, 1,
0.7718664, -1.110995, 3.060489, 1, 0, 0, 1, 1,
0.7793145, -0.5509979, 3.234621, 1, 0, 0, 1, 1,
0.7795864, 1.56868, -0.6874311, 1, 0, 0, 1, 1,
0.781718, -2.328959, 1.385483, 1, 0, 0, 1, 1,
0.7834199, -0.759713, 1.878253, 1, 0, 0, 1, 1,
0.7850996, -0.8354396, 1.774821, 0, 0, 0, 1, 1,
0.789773, -0.4680436, 0.973757, 0, 0, 0, 1, 1,
0.7910336, 0.3413441, 3.801948, 0, 0, 0, 1, 1,
0.7921872, 2.07657, 0.2029428, 0, 0, 0, 1, 1,
0.7933949, -1.091322, 2.543571, 0, 0, 0, 1, 1,
0.7981366, -0.9822258, 3.70654, 0, 0, 0, 1, 1,
0.8049047, -0.6342572, 2.074957, 0, 0, 0, 1, 1,
0.8049117, -0.5613272, 1.866549, 1, 1, 1, 1, 1,
0.8055038, 0.5332013, -0.0865011, 1, 1, 1, 1, 1,
0.8057738, -1.047389, 3.404205, 1, 1, 1, 1, 1,
0.815055, 0.04063988, 2.107161, 1, 1, 1, 1, 1,
0.8171213, -1.305949, 2.005278, 1, 1, 1, 1, 1,
0.8197743, -0.7503362, 3.381202, 1, 1, 1, 1, 1,
0.8213933, -0.2046638, 3.555621, 1, 1, 1, 1, 1,
0.8216474, -0.1195443, 1.743857, 1, 1, 1, 1, 1,
0.8242592, -1.446255, 1.987269, 1, 1, 1, 1, 1,
0.8249882, -0.2200013, 3.227382, 1, 1, 1, 1, 1,
0.8256837, 0.6633996, 0.3497703, 1, 1, 1, 1, 1,
0.8266852, 0.2900874, 1.09999, 1, 1, 1, 1, 1,
0.8289489, 1.554951, 2.116373, 1, 1, 1, 1, 1,
0.8393104, 0.6082649, 0.9192052, 1, 1, 1, 1, 1,
0.8412254, 0.1329512, 1.050271, 1, 1, 1, 1, 1,
0.847162, -0.6942008, 1.203231, 0, 0, 1, 1, 1,
0.8517479, 0.3027349, 1.785887, 1, 0, 0, 1, 1,
0.8518441, 0.8247495, 1.356697, 1, 0, 0, 1, 1,
0.8534417, 0.5757831, 2.853122, 1, 0, 0, 1, 1,
0.8551435, -0.5861143, 2.482317, 1, 0, 0, 1, 1,
0.8655818, -0.4270319, 2.167073, 1, 0, 0, 1, 1,
0.8666876, 0.4840794, 1.617576, 0, 0, 0, 1, 1,
0.8675971, -0.4766089, 0.2619889, 0, 0, 0, 1, 1,
0.8713933, -1.806006, 3.890188, 0, 0, 0, 1, 1,
0.8783995, -0.9031534, 1.775204, 0, 0, 0, 1, 1,
0.8789432, 0.320722, 1.007422, 0, 0, 0, 1, 1,
0.883088, -1.323789, 2.941328, 0, 0, 0, 1, 1,
0.8832631, -0.5150059, 2.018036, 0, 0, 0, 1, 1,
0.8888671, -0.5434876, 2.645142, 1, 1, 1, 1, 1,
0.8984818, -0.7284805, 2.440691, 1, 1, 1, 1, 1,
0.9043497, -0.4634713, 3.41549, 1, 1, 1, 1, 1,
0.9088539, -0.8130426, 1.97104, 1, 1, 1, 1, 1,
0.9197538, -1.258214, 3.037155, 1, 1, 1, 1, 1,
0.9222425, 0.1400172, 1.307308, 1, 1, 1, 1, 1,
0.9326009, -0.1897554, 0.8794218, 1, 1, 1, 1, 1,
0.9357429, -0.1046337, -0.2849928, 1, 1, 1, 1, 1,
0.9559602, -1.318227, 4.254028, 1, 1, 1, 1, 1,
0.9598107, -0.1273038, 2.492764, 1, 1, 1, 1, 1,
0.964552, -0.1304169, 3.255129, 1, 1, 1, 1, 1,
0.9648222, 1.056907, -0.4166134, 1, 1, 1, 1, 1,
0.9712813, -1.49004, 0.7188529, 1, 1, 1, 1, 1,
0.9764647, -0.8221485, 2.566024, 1, 1, 1, 1, 1,
0.9792373, 2.092682, -0.2593919, 1, 1, 1, 1, 1,
0.9794074, 1.791026, 0.5742017, 0, 0, 1, 1, 1,
0.9830103, -1.075205, 2.208985, 1, 0, 0, 1, 1,
0.9939801, -1.150417, 2.67712, 1, 0, 0, 1, 1,
0.9944028, -0.844074, 0.2679251, 1, 0, 0, 1, 1,
0.9944227, 0.9604859, 2.110668, 1, 0, 0, 1, 1,
1.005292, -1.720239, 1.775259, 1, 0, 0, 1, 1,
1.009787, -0.1049604, -0.4294184, 0, 0, 0, 1, 1,
1.01079, -0.4688074, 2.301708, 0, 0, 0, 1, 1,
1.012201, 0.6271468, 0.5292485, 0, 0, 0, 1, 1,
1.013369, -0.3992352, 1.01203, 0, 0, 0, 1, 1,
1.013375, 0.7110868, 0.8284227, 0, 0, 0, 1, 1,
1.014656, 0.4212713, 1.612875, 0, 0, 0, 1, 1,
1.016429, 0.4471772, 1.919297, 0, 0, 0, 1, 1,
1.019452, 0.4350265, -0.1106374, 1, 1, 1, 1, 1,
1.024808, 0.4239244, 0.5726501, 1, 1, 1, 1, 1,
1.027709, 1.20969, 0.3555753, 1, 1, 1, 1, 1,
1.029025, -0.04456959, 1.570751, 1, 1, 1, 1, 1,
1.029456, -0.929443, 3.624786, 1, 1, 1, 1, 1,
1.030549, 2.045949, 1.628241, 1, 1, 1, 1, 1,
1.032398, 0.9681514, 0.9951822, 1, 1, 1, 1, 1,
1.048243, 0.1030455, 0.02492484, 1, 1, 1, 1, 1,
1.050045, -0.2712318, 3.351147, 1, 1, 1, 1, 1,
1.051002, 0.398877, 0.9452778, 1, 1, 1, 1, 1,
1.051435, 0.04672358, 1.658533, 1, 1, 1, 1, 1,
1.053025, -1.590474, 2.882156, 1, 1, 1, 1, 1,
1.062204, 0.4352336, 2.014192, 1, 1, 1, 1, 1,
1.064001, 1.067428, 0.9143456, 1, 1, 1, 1, 1,
1.065646, -0.7535285, 2.008719, 1, 1, 1, 1, 1,
1.070269, -0.9715967, 3.798106, 0, 0, 1, 1, 1,
1.071737, -1.683686, 2.947393, 1, 0, 0, 1, 1,
1.072364, 1.317212, 0.7058071, 1, 0, 0, 1, 1,
1.077741, -2.034561, 2.603103, 1, 0, 0, 1, 1,
1.087493, 2.001227, -0.16593, 1, 0, 0, 1, 1,
1.088277, 2.364148, 1.231557, 1, 0, 0, 1, 1,
1.090172, -0.5436937, 0.117502, 0, 0, 0, 1, 1,
1.092848, 1.444644, 0.4741429, 0, 0, 0, 1, 1,
1.094954, 1.89708, -0.978327, 0, 0, 0, 1, 1,
1.101975, 0.7161618, 0.2341597, 0, 0, 0, 1, 1,
1.106855, 0.078591, 3.826364, 0, 0, 0, 1, 1,
1.107964, 1.641556, 0.8388026, 0, 0, 0, 1, 1,
1.11075, 0.331591, 1.115022, 0, 0, 0, 1, 1,
1.125943, -0.1227786, 1.702926, 1, 1, 1, 1, 1,
1.128942, 0.9153584, 1.504789, 1, 1, 1, 1, 1,
1.133068, -0.3447801, 1.474585, 1, 1, 1, 1, 1,
1.135557, 0.398153, 1.463865, 1, 1, 1, 1, 1,
1.136715, 0.928772, 0.8727638, 1, 1, 1, 1, 1,
1.151519, 1.638244, 1.060558, 1, 1, 1, 1, 1,
1.151677, -0.5637197, 1.457317, 1, 1, 1, 1, 1,
1.160244, -1.560436, -0.1047123, 1, 1, 1, 1, 1,
1.160865, -0.07030964, 0.586208, 1, 1, 1, 1, 1,
1.164775, -1.075803, 1.071305, 1, 1, 1, 1, 1,
1.170854, 0.3022998, 1.583014, 1, 1, 1, 1, 1,
1.171884, -0.2249884, 0.4410511, 1, 1, 1, 1, 1,
1.180488, 0.3561867, 1.682273, 1, 1, 1, 1, 1,
1.200615, -0.1658187, 1.067155, 1, 1, 1, 1, 1,
1.207864, -0.8954388, 2.504578, 1, 1, 1, 1, 1,
1.213472, -0.2060908, 1.455786, 0, 0, 1, 1, 1,
1.216983, 1.765545, 1.074463, 1, 0, 0, 1, 1,
1.219105, 0.7617418, 2.108343, 1, 0, 0, 1, 1,
1.231632, -0.972475, 1.237288, 1, 0, 0, 1, 1,
1.24305, 0.4666592, 2.261032, 1, 0, 0, 1, 1,
1.244423, 0.8143473, 0.4979205, 1, 0, 0, 1, 1,
1.245164, 1.208362, 1.856859, 0, 0, 0, 1, 1,
1.247641, 1.000804, 1.126266, 0, 0, 0, 1, 1,
1.251577, 1.079788, -0.8141789, 0, 0, 0, 1, 1,
1.256125, 0.7082367, 2.144906, 0, 0, 0, 1, 1,
1.25788, 0.1772278, 3.150472, 0, 0, 0, 1, 1,
1.25796, 1.485796, 0.5369336, 0, 0, 0, 1, 1,
1.268089, 0.5422199, 1.442748, 0, 0, 0, 1, 1,
1.278113, 1.658342, 1.387007, 1, 1, 1, 1, 1,
1.283768, -0.5240626, 3.757122, 1, 1, 1, 1, 1,
1.286306, -0.5557535, 1.922994, 1, 1, 1, 1, 1,
1.296943, 1.641577, 0.9632779, 1, 1, 1, 1, 1,
1.307764, 0.2902367, 1.729647, 1, 1, 1, 1, 1,
1.309727, -0.6451359, 2.841817, 1, 1, 1, 1, 1,
1.311601, 0.1385423, 1.368063, 1, 1, 1, 1, 1,
1.326677, -0.8460443, 3.404608, 1, 1, 1, 1, 1,
1.332165, -1.445515, 3.294913, 1, 1, 1, 1, 1,
1.339853, -0.1349004, 0.2593434, 1, 1, 1, 1, 1,
1.345139, 0.431431, 2.000606, 1, 1, 1, 1, 1,
1.350953, 2.208423, 2.126408, 1, 1, 1, 1, 1,
1.360065, -1.646135, 1.50413, 1, 1, 1, 1, 1,
1.381342, 1.091284, 1.839253, 1, 1, 1, 1, 1,
1.383951, -1.217175, 1.940274, 1, 1, 1, 1, 1,
1.390359, 0.9350473, 0.05498213, 0, 0, 1, 1, 1,
1.391001, -0.1905359, 2.459976, 1, 0, 0, 1, 1,
1.408666, -0.6607668, 2.002661, 1, 0, 0, 1, 1,
1.426784, 0.9592805, 0.7610175, 1, 0, 0, 1, 1,
1.4294, 0.2203259, 1.366469, 1, 0, 0, 1, 1,
1.436876, 1.693663, -0.2323818, 1, 0, 0, 1, 1,
1.438858, 0.2066425, 1.915305, 0, 0, 0, 1, 1,
1.44092, 1.10944, 1.510297, 0, 0, 0, 1, 1,
1.441633, 1.593959, 0.8582742, 0, 0, 0, 1, 1,
1.445138, -0.3719386, 2.089469, 0, 0, 0, 1, 1,
1.462064, -1.150428, 2.830894, 0, 0, 0, 1, 1,
1.46238, -0.3905398, 1.81692, 0, 0, 0, 1, 1,
1.471736, -0.6214694, 2.059674, 0, 0, 0, 1, 1,
1.475152, 1.345306, 1.315046, 1, 1, 1, 1, 1,
1.477897, 0.5166612, 1.334484, 1, 1, 1, 1, 1,
1.492008, 1.74504, 1.158436, 1, 1, 1, 1, 1,
1.506298, -0.3229765, 2.714717, 1, 1, 1, 1, 1,
1.511217, -0.5232764, 0.5870512, 1, 1, 1, 1, 1,
1.518151, 1.51337, 1.869994, 1, 1, 1, 1, 1,
1.523747, 1.076136, 0.5813456, 1, 1, 1, 1, 1,
1.527089, 0.1674007, 0.3913293, 1, 1, 1, 1, 1,
1.532943, 0.9889504, 0.1575585, 1, 1, 1, 1, 1,
1.535283, -0.5527199, 3.619948, 1, 1, 1, 1, 1,
1.550648, 0.04701407, 3.469072, 1, 1, 1, 1, 1,
1.559396, 0.8007288, 0.3872891, 1, 1, 1, 1, 1,
1.565665, 1.383942, 3.23941, 1, 1, 1, 1, 1,
1.570628, -0.8181238, 1.901616, 1, 1, 1, 1, 1,
1.600897, 0.2035845, 2.7981, 1, 1, 1, 1, 1,
1.603677, 2.52377, 1.10303, 0, 0, 1, 1, 1,
1.624553, 0.4263889, 2.33634, 1, 0, 0, 1, 1,
1.624695, 0.6052687, 1.429991, 1, 0, 0, 1, 1,
1.644016, 0.4793123, 1.054149, 1, 0, 0, 1, 1,
1.664352, -0.7039828, 2.044956, 1, 0, 0, 1, 1,
1.676226, 0.1626433, 1.280101, 1, 0, 0, 1, 1,
1.702314, -1.505347, 1.497321, 0, 0, 0, 1, 1,
1.732969, 0.6467872, 0.6844574, 0, 0, 0, 1, 1,
1.734012, -0.008080639, -0.439481, 0, 0, 0, 1, 1,
1.739218, -1.06533, 0.7599868, 0, 0, 0, 1, 1,
1.750029, -1.11217, 2.196896, 0, 0, 0, 1, 1,
1.758497, 0.04352731, 2.01118, 0, 0, 0, 1, 1,
1.75912, 0.8417257, 1.109237, 0, 0, 0, 1, 1,
1.776638, -0.06111539, 1.538842, 1, 1, 1, 1, 1,
1.819233, -1.310691, 2.263182, 1, 1, 1, 1, 1,
1.851796, -1.859542, 1.180821, 1, 1, 1, 1, 1,
1.854681, 0.3572442, 0.5855196, 1, 1, 1, 1, 1,
1.88176, -0.3232647, 1.124993, 1, 1, 1, 1, 1,
1.89697, 1.98387, 1.964017, 1, 1, 1, 1, 1,
1.922673, -0.467932, 2.326705, 1, 1, 1, 1, 1,
1.935153, 0.6063552, 1.461405, 1, 1, 1, 1, 1,
1.962464, -0.2492039, 1.724721, 1, 1, 1, 1, 1,
1.970905, 0.05665737, 1.545462, 1, 1, 1, 1, 1,
1.98697, -0.2992995, 2.755877, 1, 1, 1, 1, 1,
2.009306, -1.361451, 2.491818, 1, 1, 1, 1, 1,
2.017087, -0.2895016, 0.3185395, 1, 1, 1, 1, 1,
2.038058, 0.6349741, 1.094632, 1, 1, 1, 1, 1,
2.040616, -0.5900641, 1.775028, 1, 1, 1, 1, 1,
2.050931, -0.7138433, 1.476962, 0, 0, 1, 1, 1,
2.082956, -1.318323, 1.2432, 1, 0, 0, 1, 1,
2.122015, -1.511173, 2.741578, 1, 0, 0, 1, 1,
2.155498, 1.085382, -1.665642, 1, 0, 0, 1, 1,
2.229736, 0.3556441, 1.28166, 1, 0, 0, 1, 1,
2.249274, -0.501437, 1.116984, 1, 0, 0, 1, 1,
2.262172, 0.3274966, 1.709026, 0, 0, 0, 1, 1,
2.292054, 0.9721295, 1.980347, 0, 0, 0, 1, 1,
2.295023, 1.015099, 2.997413, 0, 0, 0, 1, 1,
2.305485, -0.06741942, -0.1561132, 0, 0, 0, 1, 1,
2.400731, 0.5967953, 0.3292525, 0, 0, 0, 1, 1,
2.568959, -0.3152296, 3.056557, 0, 0, 0, 1, 1,
2.595522, 0.2358682, 0.9280289, 0, 0, 0, 1, 1,
2.614415, -1.615603, 1.774567, 1, 1, 1, 1, 1,
2.672057, 0.7343073, 2.030529, 1, 1, 1, 1, 1,
2.702723, -0.7527732, 3.532961, 1, 1, 1, 1, 1,
2.877493, 0.4520654, 0.8196517, 1, 1, 1, 1, 1,
2.880711, 0.2001811, 0.9406332, 1, 1, 1, 1, 1,
3.202729, -1.320019, -0.4806359, 1, 1, 1, 1, 1,
3.608686, 1.666045, 1.904705, 1, 1, 1, 1, 1
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
var radius = 9.295831;
var distance = 32.65121;
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
mvMatrix.translate( -0.1769271, 0.2884908, -0.3660665 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.65121);
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
