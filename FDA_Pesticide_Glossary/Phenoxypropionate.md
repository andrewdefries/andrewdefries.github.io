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
-3.182544, -1.017437, -2.363046, 1, 0, 0, 1,
-3.092506, -0.6056485, -3.480601, 1, 0.007843138, 0, 1,
-3.077857, -0.1138815, -1.880206, 1, 0.01176471, 0, 1,
-2.781493, 0.1448283, -2.288869, 1, 0.01960784, 0, 1,
-2.676642, -1.452277, -2.593321, 1, 0.02352941, 0, 1,
-2.491629, 2.233869, -1.937897, 1, 0.03137255, 0, 1,
-2.37516, 0.9791625, 0.04578919, 1, 0.03529412, 0, 1,
-2.306462, -1.443864, -3.197196, 1, 0.04313726, 0, 1,
-2.294997, 0.1463133, -1.161846, 1, 0.04705882, 0, 1,
-2.227608, 1.189076, -1.595534, 1, 0.05490196, 0, 1,
-2.201284, -0.5245149, -1.047782, 1, 0.05882353, 0, 1,
-2.19968, -1.518801, -1.471122, 1, 0.06666667, 0, 1,
-2.19644, 1.585771, -1.723921, 1, 0.07058824, 0, 1,
-2.185825, -0.1150474, -1.412065, 1, 0.07843138, 0, 1,
-2.148252, 0.9910881, -0.5031889, 1, 0.08235294, 0, 1,
-2.135912, 0.7669626, -1.715893, 1, 0.09019608, 0, 1,
-2.061735, 1.639476, 1.221335, 1, 0.09411765, 0, 1,
-2.049213, 0.7778699, -1.095131, 1, 0.1019608, 0, 1,
-2.037902, 0.05902607, -2.947546, 1, 0.1098039, 0, 1,
-2.034731, -0.1825715, -2.075117, 1, 0.1137255, 0, 1,
-2.033079, -0.2072982, -2.797261, 1, 0.1215686, 0, 1,
-2.019343, 0.5911505, -1.140143, 1, 0.1254902, 0, 1,
-1.995219, 0.5661341, -1.366102, 1, 0.1333333, 0, 1,
-1.987642, 2.33096, 0.2598464, 1, 0.1372549, 0, 1,
-1.982493, -0.9887875, -3.015304, 1, 0.145098, 0, 1,
-1.963243, -1.903489, -1.927891, 1, 0.1490196, 0, 1,
-1.940057, -0.08411951, -3.236917, 1, 0.1568628, 0, 1,
-1.90817, -0.8416995, -3.402111, 1, 0.1607843, 0, 1,
-1.90649, -1.212347, -3.045274, 1, 0.1686275, 0, 1,
-1.900108, 1.36535, -1.991977, 1, 0.172549, 0, 1,
-1.88853, 0.3647924, -0.4236713, 1, 0.1803922, 0, 1,
-1.882389, -1.680878, -0.3362971, 1, 0.1843137, 0, 1,
-1.879824, 0.5900899, -2.63759, 1, 0.1921569, 0, 1,
-1.874575, 1.653302, 0.5149921, 1, 0.1960784, 0, 1,
-1.859753, 1.207721, -1.157015, 1, 0.2039216, 0, 1,
-1.850251, -0.2964173, -1.462561, 1, 0.2117647, 0, 1,
-1.83948, 0.9368539, -2.844213, 1, 0.2156863, 0, 1,
-1.838006, -0.08420251, -1.316351, 1, 0.2235294, 0, 1,
-1.82655, 0.4005219, -1.365185, 1, 0.227451, 0, 1,
-1.791464, 1.122247, -1.444209, 1, 0.2352941, 0, 1,
-1.771225, -0.4638433, -1.412571, 1, 0.2392157, 0, 1,
-1.767281, 1.489958, 0.1685378, 1, 0.2470588, 0, 1,
-1.75893, 0.1284702, -1.561542, 1, 0.2509804, 0, 1,
-1.707755, -0.03153931, -3.202844, 1, 0.2588235, 0, 1,
-1.704231, -0.6057537, -3.328799, 1, 0.2627451, 0, 1,
-1.656663, -1.539254, -2.086226, 1, 0.2705882, 0, 1,
-1.629117, -1.034616, -1.17069, 1, 0.2745098, 0, 1,
-1.614214, -0.2316468, -0.04077578, 1, 0.282353, 0, 1,
-1.611071, -0.1216113, -1.661043, 1, 0.2862745, 0, 1,
-1.607727, 0.4584222, -2.296943, 1, 0.2941177, 0, 1,
-1.599156, -0.04269951, -3.75765, 1, 0.3019608, 0, 1,
-1.594747, 0.6942386, -0.8623413, 1, 0.3058824, 0, 1,
-1.590497, -1.023348, -2.61523, 1, 0.3137255, 0, 1,
-1.585206, 1.062343, 0.02761172, 1, 0.3176471, 0, 1,
-1.584699, 0.681473, -0.4850545, 1, 0.3254902, 0, 1,
-1.579574, 0.9883516, -1.248673, 1, 0.3294118, 0, 1,
-1.560519, 0.4786896, -1.6982, 1, 0.3372549, 0, 1,
-1.556384, 1.364086, 0.5266964, 1, 0.3411765, 0, 1,
-1.523279, 0.07693175, -0.5184676, 1, 0.3490196, 0, 1,
-1.510816, -0.6637373, -4.202213, 1, 0.3529412, 0, 1,
-1.5028, 0.008981048, -2.075292, 1, 0.3607843, 0, 1,
-1.502527, -1.322349, -1.071308, 1, 0.3647059, 0, 1,
-1.48622, -1.905777, 0.1222398, 1, 0.372549, 0, 1,
-1.48009, -2.034302, -1.736309, 1, 0.3764706, 0, 1,
-1.47078, -1.097787, -1.114341, 1, 0.3843137, 0, 1,
-1.462197, -0.7136397, -2.066618, 1, 0.3882353, 0, 1,
-1.454057, -0.8452411, -0.6821002, 1, 0.3960784, 0, 1,
-1.451429, 0.861184, -1.132629, 1, 0.4039216, 0, 1,
-1.43555, -0.7035922, -1.761139, 1, 0.4078431, 0, 1,
-1.429725, 1.593226, -1.645205, 1, 0.4156863, 0, 1,
-1.418967, 0.4644367, 0.1583923, 1, 0.4196078, 0, 1,
-1.412032, 0.9686244, 1.057072, 1, 0.427451, 0, 1,
-1.407808, -0.162271, -0.7490839, 1, 0.4313726, 0, 1,
-1.402603, -0.5081539, -1.153217, 1, 0.4392157, 0, 1,
-1.389975, 2.327204, 0.4722255, 1, 0.4431373, 0, 1,
-1.382563, 0.4944144, -1.230119, 1, 0.4509804, 0, 1,
-1.381113, -1.056544, -2.293576, 1, 0.454902, 0, 1,
-1.380045, -0.889388, -1.376919, 1, 0.4627451, 0, 1,
-1.368954, -0.3777002, -2.797761, 1, 0.4666667, 0, 1,
-1.36748, -0.1980413, -1.407982, 1, 0.4745098, 0, 1,
-1.363646, 0.2780886, -1.199449, 1, 0.4784314, 0, 1,
-1.358039, -2.715256, -2.880692, 1, 0.4862745, 0, 1,
-1.357884, -0.5788857, -2.031758, 1, 0.4901961, 0, 1,
-1.345819, 0.6276259, -0.8708764, 1, 0.4980392, 0, 1,
-1.333434, -1.556811, -2.155958, 1, 0.5058824, 0, 1,
-1.328567, -1.330618, -2.047968, 1, 0.509804, 0, 1,
-1.312601, -1.236552, -2.032126, 1, 0.5176471, 0, 1,
-1.311074, -0.4286129, -1.208083, 1, 0.5215687, 0, 1,
-1.310353, -0.922327, -0.941431, 1, 0.5294118, 0, 1,
-1.30876, -2.592542, -1.527548, 1, 0.5333334, 0, 1,
-1.30294, -0.6268724, -2.544125, 1, 0.5411765, 0, 1,
-1.297977, 0.6740254, -0.1579693, 1, 0.5450981, 0, 1,
-1.290418, -1.142494, -2.260527, 1, 0.5529412, 0, 1,
-1.264787, -0.3584163, -1.755532, 1, 0.5568628, 0, 1,
-1.257797, -0.05297657, -2.84215, 1, 0.5647059, 0, 1,
-1.245277, -1.997218, -1.636639, 1, 0.5686275, 0, 1,
-1.241596, -0.395297, -1.862138, 1, 0.5764706, 0, 1,
-1.233859, 0.4886796, -3.639946, 1, 0.5803922, 0, 1,
-1.219911, 0.2231482, -1.227365, 1, 0.5882353, 0, 1,
-1.216845, 0.5179371, 0.5508599, 1, 0.5921569, 0, 1,
-1.214552, -0.3676195, -1.513171, 1, 0.6, 0, 1,
-1.212937, -0.7096108, -2.002573, 1, 0.6078432, 0, 1,
-1.208652, 0.7215708, -0.8657607, 1, 0.6117647, 0, 1,
-1.207167, 0.02690757, -1.334702, 1, 0.6196079, 0, 1,
-1.206529, 0.9747573, -1.289955, 1, 0.6235294, 0, 1,
-1.203833, 1.002446, -2.054173, 1, 0.6313726, 0, 1,
-1.203349, 0.8198661, -1.015029, 1, 0.6352941, 0, 1,
-1.199091, -0.03437848, -3.000143, 1, 0.6431373, 0, 1,
-1.197404, -0.9242949, -1.74839, 1, 0.6470588, 0, 1,
-1.188268, -0.03378719, -1.795749, 1, 0.654902, 0, 1,
-1.175183, 0.2242992, -0.2620884, 1, 0.6588235, 0, 1,
-1.172633, 0.1630447, -1.939562, 1, 0.6666667, 0, 1,
-1.168687, 0.08705159, -1.951468, 1, 0.6705883, 0, 1,
-1.168154, 0.4200096, -1.153591, 1, 0.6784314, 0, 1,
-1.165771, 0.3041369, -1.835868, 1, 0.682353, 0, 1,
-1.164217, 0.1276475, -1.401635, 1, 0.6901961, 0, 1,
-1.144292, -1.943956, -1.889701, 1, 0.6941177, 0, 1,
-1.140629, 1.206659, -1.260391, 1, 0.7019608, 0, 1,
-1.140359, 0.8541372, -0.06986116, 1, 0.7098039, 0, 1,
-1.126472, 0.272813, -0.6927513, 1, 0.7137255, 0, 1,
-1.115534, 0.3871365, 1.251935, 1, 0.7215686, 0, 1,
-1.108545, 0.3719262, -1.200373, 1, 0.7254902, 0, 1,
-1.104744, -0.1688964, -2.558063, 1, 0.7333333, 0, 1,
-1.101982, 1.008346, -0.4147729, 1, 0.7372549, 0, 1,
-1.090578, -0.5394077, -3.283919, 1, 0.7450981, 0, 1,
-1.086678, -1.31903, -3.008377, 1, 0.7490196, 0, 1,
-1.077741, 0.7326062, 0.1461902, 1, 0.7568628, 0, 1,
-1.064092, -0.2573006, -2.011232, 1, 0.7607843, 0, 1,
-1.063907, 0.9772787, -1.220004, 1, 0.7686275, 0, 1,
-1.062624, 1.18516, -1.785191, 1, 0.772549, 0, 1,
-1.061544, -2.795587, -3.610213, 1, 0.7803922, 0, 1,
-1.054642, 0.5567909, 0.5935274, 1, 0.7843137, 0, 1,
-1.050802, -0.1240096, -1.368987, 1, 0.7921569, 0, 1,
-1.05042, -0.6909642, -2.0602, 1, 0.7960784, 0, 1,
-1.050377, -0.894182, -3.253456, 1, 0.8039216, 0, 1,
-1.049652, -0.06308823, -3.531255, 1, 0.8117647, 0, 1,
-1.046092, -2.23184, -2.969523, 1, 0.8156863, 0, 1,
-1.040246, 0.1261643, -3.304543, 1, 0.8235294, 0, 1,
-1.036484, 2.406102, -0.4087982, 1, 0.827451, 0, 1,
-1.033217, 1.734344, -1.916972, 1, 0.8352941, 0, 1,
-1.031277, -0.7253275, -2.194739, 1, 0.8392157, 0, 1,
-1.029076, 1.153305, -0.8821942, 1, 0.8470588, 0, 1,
-1.027899, 1.504094, -1.138071, 1, 0.8509804, 0, 1,
-1.019678, -0.01225623, -1.279193, 1, 0.8588235, 0, 1,
-1.016658, 0.1508959, -1.228924, 1, 0.8627451, 0, 1,
-1.009901, 0.7347017, -1.901494, 1, 0.8705882, 0, 1,
-1.008, -0.4418985, -2.172486, 1, 0.8745098, 0, 1,
-1.006924, -0.5808898, -2.185934, 1, 0.8823529, 0, 1,
-1.005856, 0.6454669, -1.893895, 1, 0.8862745, 0, 1,
-1.004285, 0.6867747, -2.1685, 1, 0.8941177, 0, 1,
-1.002233, 0.2978277, -0.00396236, 1, 0.8980392, 0, 1,
-0.9939412, 0.9810328, -0.9177687, 1, 0.9058824, 0, 1,
-0.9922262, 0.1489339, -0.3209947, 1, 0.9137255, 0, 1,
-0.9764683, -0.7120019, -2.818872, 1, 0.9176471, 0, 1,
-0.975454, -0.9618548, -0.7130904, 1, 0.9254902, 0, 1,
-0.9732558, -0.2298506, -2.735512, 1, 0.9294118, 0, 1,
-0.9711493, -0.1935669, -1.333819, 1, 0.9372549, 0, 1,
-0.9707474, 0.5213376, -1.376727, 1, 0.9411765, 0, 1,
-0.9596224, -1.80592, -2.182823, 1, 0.9490196, 0, 1,
-0.9575818, 0.6846979, 0.003289577, 1, 0.9529412, 0, 1,
-0.9415697, 0.5064703, -0.9088615, 1, 0.9607843, 0, 1,
-0.9385524, -0.9901041, -1.92074, 1, 0.9647059, 0, 1,
-0.9362541, -0.5333684, -1.705335, 1, 0.972549, 0, 1,
-0.935572, -0.4321411, -1.324307, 1, 0.9764706, 0, 1,
-0.9306372, -0.7959827, -1.533816, 1, 0.9843137, 0, 1,
-0.9258339, -0.9516949, -2.83806, 1, 0.9882353, 0, 1,
-0.9255066, -1.138155, -1.955932, 1, 0.9960784, 0, 1,
-0.9165737, -1.612491, -4.708358, 0.9960784, 1, 0, 1,
-0.9139294, -0.2827713, -2.625819, 0.9921569, 1, 0, 1,
-0.9091949, -0.8985066, -2.557235, 0.9843137, 1, 0, 1,
-0.8992698, 0.3215012, -2.720983, 0.9803922, 1, 0, 1,
-0.8970773, -0.1294835, -0.5853396, 0.972549, 1, 0, 1,
-0.8907245, 0.01609157, -3.29871, 0.9686275, 1, 0, 1,
-0.8862437, -0.4950169, -0.3176591, 0.9607843, 1, 0, 1,
-0.8854589, -0.7759408, -2.578709, 0.9568627, 1, 0, 1,
-0.8789072, -0.4374398, -3.791388, 0.9490196, 1, 0, 1,
-0.878067, -0.9820444, -1.610725, 0.945098, 1, 0, 1,
-0.8764555, 0.1921328, -0.2731438, 0.9372549, 1, 0, 1,
-0.8708473, 0.441828, -0.588918, 0.9333333, 1, 0, 1,
-0.8662612, -0.01864245, -1.24392, 0.9254902, 1, 0, 1,
-0.8657976, -0.8913283, -2.69814, 0.9215686, 1, 0, 1,
-0.8638315, 1.006884, -1.456319, 0.9137255, 1, 0, 1,
-0.8580103, -1.194592, -3.208982, 0.9098039, 1, 0, 1,
-0.8535659, -0.4760183, -1.026237, 0.9019608, 1, 0, 1,
-0.8490069, -0.2107497, -1.591065, 0.8941177, 1, 0, 1,
-0.8472205, -0.08964577, -1.064875, 0.8901961, 1, 0, 1,
-0.8399846, -0.4430008, -3.524345, 0.8823529, 1, 0, 1,
-0.8392555, -0.3970967, 0.3403443, 0.8784314, 1, 0, 1,
-0.8340588, 0.5957816, -2.08764, 0.8705882, 1, 0, 1,
-0.8332174, -0.7273137, -0.3652592, 0.8666667, 1, 0, 1,
-0.8292819, -2.038447, -1.86885, 0.8588235, 1, 0, 1,
-0.825894, -0.2550446, -2.021536, 0.854902, 1, 0, 1,
-0.8239318, 0.8775442, -1.809097, 0.8470588, 1, 0, 1,
-0.8135051, 1.612881, -0.4909967, 0.8431373, 1, 0, 1,
-0.8118907, -0.604946, -0.2555573, 0.8352941, 1, 0, 1,
-0.8092483, -1.049207, -3.099491, 0.8313726, 1, 0, 1,
-0.8069222, 0.5459937, -1.481083, 0.8235294, 1, 0, 1,
-0.8053572, -0.5882959, -2.357291, 0.8196079, 1, 0, 1,
-0.8050944, -0.8570039, -1.482965, 0.8117647, 1, 0, 1,
-0.8039751, -0.4304127, -1.684979, 0.8078431, 1, 0, 1,
-0.7986592, 1.127102, 0.5264149, 0.8, 1, 0, 1,
-0.7889149, -1.427985, 0.132439, 0.7921569, 1, 0, 1,
-0.7877719, -0.9397289, -3.055672, 0.7882353, 1, 0, 1,
-0.7845017, -0.05867382, -2.44423, 0.7803922, 1, 0, 1,
-0.7819726, 0.5278677, -1.50843, 0.7764706, 1, 0, 1,
-0.7815635, -0.2506687, -3.141055, 0.7686275, 1, 0, 1,
-0.7777377, -0.5060458, -3.743023, 0.7647059, 1, 0, 1,
-0.7776062, -0.4617316, -3.085618, 0.7568628, 1, 0, 1,
-0.7775503, -0.01032872, -1.776543, 0.7529412, 1, 0, 1,
-0.7729184, 0.1673363, -3.097533, 0.7450981, 1, 0, 1,
-0.7724026, 1.097062, 1.321357, 0.7411765, 1, 0, 1,
-0.7720491, 1.313002, -1.397249, 0.7333333, 1, 0, 1,
-0.7719952, -1.321827, -4.192563, 0.7294118, 1, 0, 1,
-0.7688714, 0.6920469, 0.4226426, 0.7215686, 1, 0, 1,
-0.7686215, -1.599781, -2.651466, 0.7176471, 1, 0, 1,
-0.7683597, 0.7760221, 0.4296993, 0.7098039, 1, 0, 1,
-0.7668016, -0.3530576, -2.447008, 0.7058824, 1, 0, 1,
-0.7655551, -0.3853905, -2.14013, 0.6980392, 1, 0, 1,
-0.7629713, 0.814837, 0.002751613, 0.6901961, 1, 0, 1,
-0.7608306, -0.7131757, -1.433001, 0.6862745, 1, 0, 1,
-0.760783, -0.4210362, -1.928636, 0.6784314, 1, 0, 1,
-0.7579421, 1.101312, 0.3032053, 0.6745098, 1, 0, 1,
-0.7574018, -0.2317572, -0.7409184, 0.6666667, 1, 0, 1,
-0.7543095, 1.266143, -1.478505, 0.6627451, 1, 0, 1,
-0.7493923, -0.5407985, -3.849925, 0.654902, 1, 0, 1,
-0.7383064, 0.237271, -3.351179, 0.6509804, 1, 0, 1,
-0.7361969, -0.9828943, -2.3052, 0.6431373, 1, 0, 1,
-0.7356794, -0.8276618, -3.982023, 0.6392157, 1, 0, 1,
-0.733944, -0.07910872, -2.617506, 0.6313726, 1, 0, 1,
-0.7330398, -0.5026293, -1.227132, 0.627451, 1, 0, 1,
-0.7290431, -1.275875, -1.920254, 0.6196079, 1, 0, 1,
-0.7208629, 0.5620164, -0.3492459, 0.6156863, 1, 0, 1,
-0.7188736, 2.31369, 0.5599753, 0.6078432, 1, 0, 1,
-0.716999, -0.4032709, -1.666272, 0.6039216, 1, 0, 1,
-0.7122189, -0.6832108, -1.439371, 0.5960785, 1, 0, 1,
-0.7114694, 0.00283702, -2.520947, 0.5882353, 1, 0, 1,
-0.7069529, -0.4128919, -1.092382, 0.5843138, 1, 0, 1,
-0.7003714, -0.5092013, -1.679645, 0.5764706, 1, 0, 1,
-0.6992394, -0.6180176, -2.115136, 0.572549, 1, 0, 1,
-0.6962053, -0.6300615, -1.889329, 0.5647059, 1, 0, 1,
-0.6944119, 3.300598, 0.3613529, 0.5607843, 1, 0, 1,
-0.6895623, -0.6855602, -3.539031, 0.5529412, 1, 0, 1,
-0.6861069, -0.1415835, -0.9178175, 0.5490196, 1, 0, 1,
-0.6805697, 2.27055, 0.7155864, 0.5411765, 1, 0, 1,
-0.6767439, -0.2595291, -1.599924, 0.5372549, 1, 0, 1,
-0.675281, -2.103156, -3.98471, 0.5294118, 1, 0, 1,
-0.6718667, 0.6901814, -0.08351616, 0.5254902, 1, 0, 1,
-0.6679015, -1.059403, -1.345059, 0.5176471, 1, 0, 1,
-0.6675314, 0.7978842, -1.30036, 0.5137255, 1, 0, 1,
-0.6656504, -0.05041946, -2.157678, 0.5058824, 1, 0, 1,
-0.6638237, -0.01656985, -2.025529, 0.5019608, 1, 0, 1,
-0.662499, 0.4685542, -0.3418818, 0.4941176, 1, 0, 1,
-0.6615608, -1.485112, -4.247867, 0.4862745, 1, 0, 1,
-0.6602426, 0.2638146, -2.672689, 0.4823529, 1, 0, 1,
-0.6524011, -0.05314293, -0.5138052, 0.4745098, 1, 0, 1,
-0.6521338, 0.2516972, 0.3514198, 0.4705882, 1, 0, 1,
-0.6520895, 1.718887, -1.744915, 0.4627451, 1, 0, 1,
-0.6502082, -1.263185, -2.070427, 0.4588235, 1, 0, 1,
-0.6437415, 1.180062, 0.1515146, 0.4509804, 1, 0, 1,
-0.639535, 1.82232, -0.2122748, 0.4470588, 1, 0, 1,
-0.6378356, 1.464262, 0.1381912, 0.4392157, 1, 0, 1,
-0.6304144, -0.8836318, -3.848224, 0.4352941, 1, 0, 1,
-0.6246547, -0.5207353, -1.830336, 0.427451, 1, 0, 1,
-0.6194368, 0.2126315, -2.559896, 0.4235294, 1, 0, 1,
-0.6189519, 1.001444, -0.6059402, 0.4156863, 1, 0, 1,
-0.6114259, 0.8481904, -0.902976, 0.4117647, 1, 0, 1,
-0.6112983, -0.8203312, -0.8432054, 0.4039216, 1, 0, 1,
-0.6047517, -2.348578, -2.272439, 0.3960784, 1, 0, 1,
-0.6015045, -1.844998, -2.317405, 0.3921569, 1, 0, 1,
-0.6014897, -0.6232098, -1.959829, 0.3843137, 1, 0, 1,
-0.59496, 0.4015163, -1.456451, 0.3803922, 1, 0, 1,
-0.5902341, -1.613342, -4.165249, 0.372549, 1, 0, 1,
-0.5888194, 2.439966, -0.7600462, 0.3686275, 1, 0, 1,
-0.5812594, 0.01358224, -0.7049903, 0.3607843, 1, 0, 1,
-0.5758994, 0.6271124, 1.34555, 0.3568628, 1, 0, 1,
-0.5736979, -1.016093, -2.717963, 0.3490196, 1, 0, 1,
-0.5722671, -0.9215332, -3.481805, 0.345098, 1, 0, 1,
-0.5720805, -0.2118592, -0.8317248, 0.3372549, 1, 0, 1,
-0.571141, -1.311132, -2.899812, 0.3333333, 1, 0, 1,
-0.5699143, -0.001573246, -3.248057, 0.3254902, 1, 0, 1,
-0.5675919, -0.6073427, -1.194508, 0.3215686, 1, 0, 1,
-0.5659016, 1.046697, -1.908291, 0.3137255, 1, 0, 1,
-0.562529, 1.097721, -0.2443164, 0.3098039, 1, 0, 1,
-0.5618464, 0.6807455, -0.608214, 0.3019608, 1, 0, 1,
-0.5591341, 0.7518407, -1.293784, 0.2941177, 1, 0, 1,
-0.5583036, 0.8788413, -0.841024, 0.2901961, 1, 0, 1,
-0.5570419, -1.340869, -3.268032, 0.282353, 1, 0, 1,
-0.5523537, 0.6339158, 0.2724049, 0.2784314, 1, 0, 1,
-0.5486895, -0.8535467, -1.776919, 0.2705882, 1, 0, 1,
-0.5474858, 1.710999, -0.06329196, 0.2666667, 1, 0, 1,
-0.5351654, -0.3840185, -2.350908, 0.2588235, 1, 0, 1,
-0.5334601, -1.205124, -1.763698, 0.254902, 1, 0, 1,
-0.5334079, -0.4069778, -2.795579, 0.2470588, 1, 0, 1,
-0.5327959, -0.8073911, -2.371356, 0.2431373, 1, 0, 1,
-0.5283928, 1.529449, -0.385466, 0.2352941, 1, 0, 1,
-0.5195944, -1.063162, -3.414634, 0.2313726, 1, 0, 1,
-0.5137435, -2.123217, -3.035141, 0.2235294, 1, 0, 1,
-0.5096013, 0.138739, -0.3136893, 0.2196078, 1, 0, 1,
-0.5079733, 1.798689, -0.5348994, 0.2117647, 1, 0, 1,
-0.5001754, 0.5580089, -0.6281858, 0.2078431, 1, 0, 1,
-0.4990048, 1.396977, -0.495701, 0.2, 1, 0, 1,
-0.495796, -0.5739391, -1.593389, 0.1921569, 1, 0, 1,
-0.4921792, 0.5149543, -1.28853, 0.1882353, 1, 0, 1,
-0.4920002, -0.1818484, -1.592237, 0.1803922, 1, 0, 1,
-0.4914076, -0.8636189, -3.704995, 0.1764706, 1, 0, 1,
-0.4828164, 0.5092166, -1.081515, 0.1686275, 1, 0, 1,
-0.482054, 0.5061522, -2.536802, 0.1647059, 1, 0, 1,
-0.4811962, -0.465122, -2.359235, 0.1568628, 1, 0, 1,
-0.4802065, 0.5094414, -1.537792, 0.1529412, 1, 0, 1,
-0.4800854, -0.7609867, -1.52413, 0.145098, 1, 0, 1,
-0.4798875, -0.2477276, -2.757298, 0.1411765, 1, 0, 1,
-0.4773911, -1.536986, -2.787826, 0.1333333, 1, 0, 1,
-0.4766636, -1.120728, -3.44731, 0.1294118, 1, 0, 1,
-0.4752722, -0.8837574, -3.739465, 0.1215686, 1, 0, 1,
-0.474141, -1.981847, -2.887452, 0.1176471, 1, 0, 1,
-0.4721561, 0.8740539, 1.159027, 0.1098039, 1, 0, 1,
-0.4687349, 0.2418947, -1.063923, 0.1058824, 1, 0, 1,
-0.4637669, 1.969799, -0.2935134, 0.09803922, 1, 0, 1,
-0.4617391, -0.7908309, -3.161791, 0.09019608, 1, 0, 1,
-0.4584495, -1.733345, -1.541283, 0.08627451, 1, 0, 1,
-0.457711, -1.118951, -4.126039, 0.07843138, 1, 0, 1,
-0.454948, -0.9865894, -3.566545, 0.07450981, 1, 0, 1,
-0.4522928, -0.100287, -2.099888, 0.06666667, 1, 0, 1,
-0.4448881, -0.3421108, -1.553577, 0.0627451, 1, 0, 1,
-0.4433289, -1.427488, -2.386169, 0.05490196, 1, 0, 1,
-0.4326208, -1.454512, -1.458983, 0.05098039, 1, 0, 1,
-0.4281313, -1.545306, -2.707015, 0.04313726, 1, 0, 1,
-0.4273891, 0.8411804, -0.5771632, 0.03921569, 1, 0, 1,
-0.4256581, 1.126845, -0.7493215, 0.03137255, 1, 0, 1,
-0.4225824, 0.5613639, -1.019584, 0.02745098, 1, 0, 1,
-0.4201496, -0.03600594, -2.641933, 0.01960784, 1, 0, 1,
-0.4182796, 0.7610729, -1.536049, 0.01568628, 1, 0, 1,
-0.4156334, -0.4124895, -0.8597513, 0.007843138, 1, 0, 1,
-0.4126856, -0.2195197, -2.137043, 0.003921569, 1, 0, 1,
-0.4096743, 0.3756755, 0.3099335, 0, 1, 0.003921569, 1,
-0.4070167, 1.479702, -0.04225868, 0, 1, 0.01176471, 1,
-0.4052213, 0.06492326, -0.5416805, 0, 1, 0.01568628, 1,
-0.4032379, 0.7932359, 0.1748726, 0, 1, 0.02352941, 1,
-0.3996235, -1.424666, -3.118138, 0, 1, 0.02745098, 1,
-0.3950895, -0.2363679, -1.240132, 0, 1, 0.03529412, 1,
-0.3870929, -0.2647353, -1.838386, 0, 1, 0.03921569, 1,
-0.3854854, 0.7495163, 1.399647, 0, 1, 0.04705882, 1,
-0.3845187, -0.8960284, -3.451945, 0, 1, 0.05098039, 1,
-0.3836125, -2.438851, -4.457139, 0, 1, 0.05882353, 1,
-0.3823142, -0.7414416, -1.821241, 0, 1, 0.0627451, 1,
-0.3809922, -0.5757433, -1.989144, 0, 1, 0.07058824, 1,
-0.3772178, 0.7854558, -0.8532377, 0, 1, 0.07450981, 1,
-0.3770188, -1.194805, -0.5280781, 0, 1, 0.08235294, 1,
-0.3732581, -1.141832, -0.5501732, 0, 1, 0.08627451, 1,
-0.3724386, 0.7034924, 0.2246169, 0, 1, 0.09411765, 1,
-0.3671954, -0.03695422, -1.919124, 0, 1, 0.1019608, 1,
-0.3587731, 0.004847439, -1.273258, 0, 1, 0.1058824, 1,
-0.3581063, 0.6696839, -0.1103058, 0, 1, 0.1137255, 1,
-0.354844, 1.15758, -1.446937, 0, 1, 0.1176471, 1,
-0.3525537, -1.620268, -1.679, 0, 1, 0.1254902, 1,
-0.3499968, 0.3761597, -2.398163, 0, 1, 0.1294118, 1,
-0.3391401, -0.9657063, -2.894191, 0, 1, 0.1372549, 1,
-0.3375669, 0.358993, -1.134431, 0, 1, 0.1411765, 1,
-0.3306425, 1.194336, 0.6440061, 0, 1, 0.1490196, 1,
-0.3284117, -0.5568225, -3.454098, 0, 1, 0.1529412, 1,
-0.326073, 0.1780121, -1.230002, 0, 1, 0.1607843, 1,
-0.3251581, -0.5585538, -3.787776, 0, 1, 0.1647059, 1,
-0.3220292, 0.6659017, -3.77376, 0, 1, 0.172549, 1,
-0.3210879, 0.2501243, -1.035685, 0, 1, 0.1764706, 1,
-0.3201046, -1.408911, -2.919089, 0, 1, 0.1843137, 1,
-0.3169448, -1.687035, -1.732502, 0, 1, 0.1882353, 1,
-0.3094934, 1.269184, 0.3217483, 0, 1, 0.1960784, 1,
-0.3035852, 0.006490231, 0.1397748, 0, 1, 0.2039216, 1,
-0.30352, -0.7753645, -3.572548, 0, 1, 0.2078431, 1,
-0.3034234, 0.356477, -1.218287, 0, 1, 0.2156863, 1,
-0.3018789, -1.256814, -2.486927, 0, 1, 0.2196078, 1,
-0.3007308, -0.4169654, -2.180077, 0, 1, 0.227451, 1,
-0.3000889, 0.6038709, 1.318313, 0, 1, 0.2313726, 1,
-0.2846342, 0.8873277, -0.3761395, 0, 1, 0.2392157, 1,
-0.2834675, 0.2738954, -0.8528073, 0, 1, 0.2431373, 1,
-0.2748512, -0.6466413, -3.176796, 0, 1, 0.2509804, 1,
-0.27466, 0.1594039, -0.909977, 0, 1, 0.254902, 1,
-0.2739272, -0.3899598, -3.226598, 0, 1, 0.2627451, 1,
-0.2726418, -0.3383667, -3.170088, 0, 1, 0.2666667, 1,
-0.2681486, 1.760435, 0.9292955, 0, 1, 0.2745098, 1,
-0.2677937, 0.5666215, -0.4638584, 0, 1, 0.2784314, 1,
-0.2669494, 0.9233589, 1.467596, 0, 1, 0.2862745, 1,
-0.2651376, 0.1901838, -1.071108, 0, 1, 0.2901961, 1,
-0.2638873, -0.4573336, -2.86419, 0, 1, 0.2980392, 1,
-0.2599261, 0.0952073, -1.617722, 0, 1, 0.3058824, 1,
-0.2552282, 0.7486666, -0.5745358, 0, 1, 0.3098039, 1,
-0.2510737, -0.06054909, -2.25613, 0, 1, 0.3176471, 1,
-0.2499802, -1.078261, -3.868197, 0, 1, 0.3215686, 1,
-0.2472348, -0.612296, -2.419034, 0, 1, 0.3294118, 1,
-0.2446692, 0.1651421, -0.5263242, 0, 1, 0.3333333, 1,
-0.2443953, 1.474993, 0.8400072, 0, 1, 0.3411765, 1,
-0.2387526, 1.035177, 0.06071193, 0, 1, 0.345098, 1,
-0.2371302, 0.3145824, -1.004874, 0, 1, 0.3529412, 1,
-0.2293698, 1.772081, -0.09253136, 0, 1, 0.3568628, 1,
-0.2216037, 2.374913, -0.9161863, 0, 1, 0.3647059, 1,
-0.2168254, -0.5329435, -2.084588, 0, 1, 0.3686275, 1,
-0.2166166, 0.1163544, -0.8110849, 0, 1, 0.3764706, 1,
-0.2136654, 0.6605565, -0.7419758, 0, 1, 0.3803922, 1,
-0.2046935, -0.1263024, -1.648766, 0, 1, 0.3882353, 1,
-0.2027979, 0.06120485, -0.3590372, 0, 1, 0.3921569, 1,
-0.2008666, -1.66846, -2.020665, 0, 1, 0.4, 1,
-0.200797, -0.4899646, -1.773062, 0, 1, 0.4078431, 1,
-0.199527, 0.4314059, -0.4535351, 0, 1, 0.4117647, 1,
-0.1981784, 0.01710544, -1.650315, 0, 1, 0.4196078, 1,
-0.1959472, -0.6264635, -3.0934, 0, 1, 0.4235294, 1,
-0.1941202, 0.4755, 1.720534, 0, 1, 0.4313726, 1,
-0.1911284, 0.19934, -0.8242878, 0, 1, 0.4352941, 1,
-0.1886577, 0.4388369, 0.6784777, 0, 1, 0.4431373, 1,
-0.1850144, -0.0711634, -1.299494, 0, 1, 0.4470588, 1,
-0.18245, -0.1764193, -0.08505616, 0, 1, 0.454902, 1,
-0.1744153, 0.2837482, -0.7105668, 0, 1, 0.4588235, 1,
-0.173743, 0.9495143, 0.02633687, 0, 1, 0.4666667, 1,
-0.1733438, -0.4067501, -3.812094, 0, 1, 0.4705882, 1,
-0.166919, 0.6748041, -1.169413, 0, 1, 0.4784314, 1,
-0.1668325, 0.1617059, 0.01753435, 0, 1, 0.4823529, 1,
-0.1666574, -0.9019645, -3.68663, 0, 1, 0.4901961, 1,
-0.1660032, 0.6229925, -0.00073176, 0, 1, 0.4941176, 1,
-0.1653856, 0.3847474, -1.083993, 0, 1, 0.5019608, 1,
-0.1649169, 1.681312, 0.2586905, 0, 1, 0.509804, 1,
-0.163226, 1.605528, -1.141722, 0, 1, 0.5137255, 1,
-0.1626103, 0.7469841, -0.7650387, 0, 1, 0.5215687, 1,
-0.1600631, 0.9630754, 0.5227666, 0, 1, 0.5254902, 1,
-0.1577529, 0.1155613, -0.955879, 0, 1, 0.5333334, 1,
-0.1569201, 0.01243918, -1.997457, 0, 1, 0.5372549, 1,
-0.1525236, 0.3300134, -1.423266, 0, 1, 0.5450981, 1,
-0.1500141, 0.2938317, -0.3697802, 0, 1, 0.5490196, 1,
-0.1499318, -0.8510308, -2.744915, 0, 1, 0.5568628, 1,
-0.1446204, 0.5503016, -2.76314, 0, 1, 0.5607843, 1,
-0.1416828, -0.02131005, -2.177466, 0, 1, 0.5686275, 1,
-0.1396576, -1.158892, -2.901965, 0, 1, 0.572549, 1,
-0.1383796, 1.289506, -0.5429784, 0, 1, 0.5803922, 1,
-0.1367434, -0.9664108, -1.34165, 0, 1, 0.5843138, 1,
-0.1360349, -0.7848864, -3.004041, 0, 1, 0.5921569, 1,
-0.1209437, 1.76709, -0.7110894, 0, 1, 0.5960785, 1,
-0.1192024, -1.219347, -3.946029, 0, 1, 0.6039216, 1,
-0.1189101, -0.02128213, -0.6876559, 0, 1, 0.6117647, 1,
-0.1168696, -0.09166567, -2.336727, 0, 1, 0.6156863, 1,
-0.1142462, -0.2866393, -2.684434, 0, 1, 0.6235294, 1,
-0.113126, -0.4670959, -3.336862, 0, 1, 0.627451, 1,
-0.1094117, -0.1760669, -2.584234, 0, 1, 0.6352941, 1,
-0.1056829, 0.6653759, -0.970031, 0, 1, 0.6392157, 1,
-0.1035905, 0.1278527, -1.607101, 0, 1, 0.6470588, 1,
-0.1024299, -1.355845, -2.906581, 0, 1, 0.6509804, 1,
-0.09935237, -0.6826779, -2.780564, 0, 1, 0.6588235, 1,
-0.09703588, -1.340939, -1.950921, 0, 1, 0.6627451, 1,
-0.0948074, -0.622632, -3.636266, 0, 1, 0.6705883, 1,
-0.09460779, -0.06152686, -3.250618, 0, 1, 0.6745098, 1,
-0.09382185, 0.4326868, -0.5022996, 0, 1, 0.682353, 1,
-0.08805835, -0.6278954, -3.194562, 0, 1, 0.6862745, 1,
-0.08711643, -0.4291876, -2.422762, 0, 1, 0.6941177, 1,
-0.08296215, -0.7900714, -2.549349, 0, 1, 0.7019608, 1,
-0.08062927, -0.04957235, -3.778765, 0, 1, 0.7058824, 1,
-0.07930562, 1.613294, 0.08338279, 0, 1, 0.7137255, 1,
-0.07738103, -0.6241881, -4.070793, 0, 1, 0.7176471, 1,
-0.07491248, 0.4023339, 1.476275, 0, 1, 0.7254902, 1,
-0.07144882, -0.6501778, -2.872421, 0, 1, 0.7294118, 1,
-0.07116046, -0.7929084, -2.586592, 0, 1, 0.7372549, 1,
-0.07096808, 0.6093429, 1.392387, 0, 1, 0.7411765, 1,
-0.06830911, -0.3657181, -3.296191, 0, 1, 0.7490196, 1,
-0.06302902, -0.05445191, -1.283484, 0, 1, 0.7529412, 1,
-0.06214999, -2.389318, -3.215164, 0, 1, 0.7607843, 1,
-0.05690286, -1.899848, -1.434546, 0, 1, 0.7647059, 1,
-0.05294817, 0.3693539, 0.2710749, 0, 1, 0.772549, 1,
-0.05058433, 0.8294934, 1.198586, 0, 1, 0.7764706, 1,
-0.04401124, -0.3350021, -1.917497, 0, 1, 0.7843137, 1,
-0.0401063, 0.08828137, -1.007296, 0, 1, 0.7882353, 1,
-0.04004212, -0.4327795, -2.436022, 0, 1, 0.7960784, 1,
-0.03959205, 0.5817303, 0.1544817, 0, 1, 0.8039216, 1,
-0.03954988, -1.131557, -4.836604, 0, 1, 0.8078431, 1,
-0.03759518, -0.48917, -3.684976, 0, 1, 0.8156863, 1,
-0.037184, -0.004497993, -1.735289, 0, 1, 0.8196079, 1,
-0.03429778, 0.05249124, 0.009561802, 0, 1, 0.827451, 1,
-0.02706072, 2.021692, 2.208185, 0, 1, 0.8313726, 1,
-0.02550057, -0.348495, -2.637644, 0, 1, 0.8392157, 1,
-0.02358813, 1.872023, -1.918787, 0, 1, 0.8431373, 1,
-0.02224207, -0.411349, -3.208157, 0, 1, 0.8509804, 1,
-0.02062821, -0.6146969, -4.059724, 0, 1, 0.854902, 1,
-0.01936978, -1.328447, -2.5894, 0, 1, 0.8627451, 1,
-0.01871674, 0.1346269, -0.9838765, 0, 1, 0.8666667, 1,
-0.0181757, -0.03306442, -3.426476, 0, 1, 0.8745098, 1,
-0.01717798, -0.4651988, -3.043734, 0, 1, 0.8784314, 1,
-0.01523243, 0.9271153, 0.143015, 0, 1, 0.8862745, 1,
-0.0124979, 0.4380563, -0.8344233, 0, 1, 0.8901961, 1,
-0.01199057, 1.565611, 0.384563, 0, 1, 0.8980392, 1,
-0.01044012, 2.042917, 0.4757881, 0, 1, 0.9058824, 1,
-0.009075073, -0.1345459, -4.659866, 0, 1, 0.9098039, 1,
-0.008872021, -0.7681665, -2.598679, 0, 1, 0.9176471, 1,
-0.004883486, -0.6656938, -3.692836, 0, 1, 0.9215686, 1,
-0.00361024, -1.172714, -1.338574, 0, 1, 0.9294118, 1,
-0.001882563, 1.067972, -0.1707206, 0, 1, 0.9333333, 1,
0.004498649, 0.1121993, 0.6718576, 0, 1, 0.9411765, 1,
0.01038532, -1.012568, 1.801459, 0, 1, 0.945098, 1,
0.01104446, -0.2305899, 5.17745, 0, 1, 0.9529412, 1,
0.01296597, 0.3412017, -0.8116974, 0, 1, 0.9568627, 1,
0.01531069, -0.380635, 2.301843, 0, 1, 0.9647059, 1,
0.02112049, -1.961893, 1.13427, 0, 1, 0.9686275, 1,
0.02274684, -0.6808214, 2.892381, 0, 1, 0.9764706, 1,
0.02688605, 0.9439551, -0.09986018, 0, 1, 0.9803922, 1,
0.03111806, -1.111998, 3.740024, 0, 1, 0.9882353, 1,
0.03270599, 0.1627338, -0.139615, 0, 1, 0.9921569, 1,
0.03381173, -1.101758, 3.620133, 0, 1, 1, 1,
0.03874646, 0.812184, 1.15567, 0, 0.9921569, 1, 1,
0.04142933, 0.6466766, -0.9246747, 0, 0.9882353, 1, 1,
0.04601807, -1.697232, 3.916296, 0, 0.9803922, 1, 1,
0.0475415, 1.443432, -0.57669, 0, 0.9764706, 1, 1,
0.05400702, -0.6435603, 2.410758, 0, 0.9686275, 1, 1,
0.05553813, -1.719136, 4.067049, 0, 0.9647059, 1, 1,
0.05577648, 0.5950913, -1.051645, 0, 0.9568627, 1, 1,
0.05594722, -2.198971, 3.12629, 0, 0.9529412, 1, 1,
0.06009037, -0.5367976, 2.564106, 0, 0.945098, 1, 1,
0.06245102, -0.9180819, 3.836413, 0, 0.9411765, 1, 1,
0.06437344, -0.5659541, 2.066889, 0, 0.9333333, 1, 1,
0.07515015, 0.7776476, -0.7307587, 0, 0.9294118, 1, 1,
0.07558128, -1.003696, 4.185066, 0, 0.9215686, 1, 1,
0.07734546, 0.8536258, -0.615008, 0, 0.9176471, 1, 1,
0.08324317, -1.518122, 3.353271, 0, 0.9098039, 1, 1,
0.08426269, 0.9997279, 0.2927818, 0, 0.9058824, 1, 1,
0.08625332, 2.029558, 0.3559168, 0, 0.8980392, 1, 1,
0.0863499, 0.920909, 0.347428, 0, 0.8901961, 1, 1,
0.08641279, 2.09019, -1.132945, 0, 0.8862745, 1, 1,
0.08766896, -1.048716, 2.713025, 0, 0.8784314, 1, 1,
0.08785921, -0.1082625, 1.841712, 0, 0.8745098, 1, 1,
0.09404411, 0.2817071, 1.353523, 0, 0.8666667, 1, 1,
0.09454475, -1.1745, 2.724057, 0, 0.8627451, 1, 1,
0.09480421, -0.7891269, 2.984818, 0, 0.854902, 1, 1,
0.09780528, 1.047, -0.3266661, 0, 0.8509804, 1, 1,
0.09845207, 0.700636, -0.7418869, 0, 0.8431373, 1, 1,
0.09896505, 0.6928701, 0.9097658, 0, 0.8392157, 1, 1,
0.0992488, -0.4138624, 1.344828, 0, 0.8313726, 1, 1,
0.1007113, 1.267614, -1.022097, 0, 0.827451, 1, 1,
0.1051901, 0.2939376, -1.789954, 0, 0.8196079, 1, 1,
0.1072602, 1.629869, 1.107144, 0, 0.8156863, 1, 1,
0.1104398, -0.8806304, 2.857281, 0, 0.8078431, 1, 1,
0.1107601, 0.8408237, -1.334947, 0, 0.8039216, 1, 1,
0.1108819, -0.2685317, 1.566802, 0, 0.7960784, 1, 1,
0.112112, -0.8961585, 2.164693, 0, 0.7882353, 1, 1,
0.1122535, 2.325745, -1.200131, 0, 0.7843137, 1, 1,
0.1155831, 2.230473, -0.5814838, 0, 0.7764706, 1, 1,
0.1156439, -1.481504, 3.414521, 0, 0.772549, 1, 1,
0.1168497, -0.251812, 3.965743, 0, 0.7647059, 1, 1,
0.1170192, 1.997071, 0.03492493, 0, 0.7607843, 1, 1,
0.1174042, 0.3703014, 0.2686924, 0, 0.7529412, 1, 1,
0.119446, 1.488405, -0.7983759, 0, 0.7490196, 1, 1,
0.1198899, -1.219096, 4.399866, 0, 0.7411765, 1, 1,
0.1269893, -0.5055323, 2.827301, 0, 0.7372549, 1, 1,
0.1317498, 0.7509049, 0.161534, 0, 0.7294118, 1, 1,
0.1403159, 0.9323444, -0.6374881, 0, 0.7254902, 1, 1,
0.1429175, 0.1553735, -0.5449057, 0, 0.7176471, 1, 1,
0.1429221, 1.582984, -0.5725821, 0, 0.7137255, 1, 1,
0.1476715, 1.019859, -1.18628, 0, 0.7058824, 1, 1,
0.149914, -0.6768634, 2.349564, 0, 0.6980392, 1, 1,
0.1502325, 0.2529802, -2.20908, 0, 0.6941177, 1, 1,
0.1528451, 2.037027, 0.1816691, 0, 0.6862745, 1, 1,
0.1545515, -1.151364, 2.680987, 0, 0.682353, 1, 1,
0.1605996, -0.568786, 3.12698, 0, 0.6745098, 1, 1,
0.1615822, 0.06668586, 0.4509717, 0, 0.6705883, 1, 1,
0.1668597, -0.04299642, 2.437631, 0, 0.6627451, 1, 1,
0.1669667, -1.563168, 2.736181, 0, 0.6588235, 1, 1,
0.1674207, -0.5852267, 1.948107, 0, 0.6509804, 1, 1,
0.1686472, 0.3340486, 0.1004212, 0, 0.6470588, 1, 1,
0.1691732, -1.059112, 1.882329, 0, 0.6392157, 1, 1,
0.176692, -0.03952452, 1.371453, 0, 0.6352941, 1, 1,
0.1768795, -0.9384461, 1.460445, 0, 0.627451, 1, 1,
0.1774444, 1.487939, 0.9582448, 0, 0.6235294, 1, 1,
0.1789919, -1.543679, 2.867345, 0, 0.6156863, 1, 1,
0.1801038, 0.5321798, 0.1373841, 0, 0.6117647, 1, 1,
0.1803717, -0.9311191, 3.36171, 0, 0.6039216, 1, 1,
0.1845711, -1.836094, 1.938057, 0, 0.5960785, 1, 1,
0.1869651, -1.808912, 1.866397, 0, 0.5921569, 1, 1,
0.1929378, 1.050297, 0.1399186, 0, 0.5843138, 1, 1,
0.1937589, -0.3972025, 2.278547, 0, 0.5803922, 1, 1,
0.1949327, 0.7194415, 1.73426, 0, 0.572549, 1, 1,
0.194985, -0.4944509, 2.690311, 0, 0.5686275, 1, 1,
0.198747, -0.2078486, 0.5910761, 0, 0.5607843, 1, 1,
0.2012296, 0.08329258, 2.136694, 0, 0.5568628, 1, 1,
0.202766, -0.3927737, 3.846895, 0, 0.5490196, 1, 1,
0.2065209, -0.1142593, 2.406605, 0, 0.5450981, 1, 1,
0.2082556, 0.361816, 0.8766977, 0, 0.5372549, 1, 1,
0.2091647, -0.7053362, 3.27053, 0, 0.5333334, 1, 1,
0.2127169, -0.3119529, 3.043127, 0, 0.5254902, 1, 1,
0.2154833, 0.4987596, -1.53474, 0, 0.5215687, 1, 1,
0.216791, 0.2014994, 1.329972, 0, 0.5137255, 1, 1,
0.219619, 0.6534309, 0.2970606, 0, 0.509804, 1, 1,
0.2240372, 2.27854, -0.9361315, 0, 0.5019608, 1, 1,
0.2250242, 2.213695, -0.6485308, 0, 0.4941176, 1, 1,
0.2269161, 0.5375295, 1.301973, 0, 0.4901961, 1, 1,
0.2346516, 0.4164377, 0.8209683, 0, 0.4823529, 1, 1,
0.2404823, 1.298883, 0.6993513, 0, 0.4784314, 1, 1,
0.242412, 0.0748698, 2.681424, 0, 0.4705882, 1, 1,
0.244287, -0.3986361, 4.072709, 0, 0.4666667, 1, 1,
0.2506421, 0.2221623, 2.571003, 0, 0.4588235, 1, 1,
0.2507066, -1.197325, 3.973152, 0, 0.454902, 1, 1,
0.25114, -0.2745582, 3.744054, 0, 0.4470588, 1, 1,
0.2566323, 0.5835048, 1.306795, 0, 0.4431373, 1, 1,
0.2594154, 0.9503981, 0.8587855, 0, 0.4352941, 1, 1,
0.2598997, 0.7836491, -0.2964705, 0, 0.4313726, 1, 1,
0.2621599, -0.2115523, 1.953011, 0, 0.4235294, 1, 1,
0.2641054, -0.4778707, 3.586994, 0, 0.4196078, 1, 1,
0.2674308, 2.394152, -1.987811, 0, 0.4117647, 1, 1,
0.2695383, -0.4692661, 3.354819, 0, 0.4078431, 1, 1,
0.2707685, -0.7961971, 1.604475, 0, 0.4, 1, 1,
0.2902875, 1.050409, 1.828225, 0, 0.3921569, 1, 1,
0.2910426, -0.08669201, 1.027297, 0, 0.3882353, 1, 1,
0.2956406, 0.1569882, -2.16224, 0, 0.3803922, 1, 1,
0.2958783, 0.07575136, 2.102748, 0, 0.3764706, 1, 1,
0.298393, 1.644549, 0.9913853, 0, 0.3686275, 1, 1,
0.2988601, 1.215007, 0.3812719, 0, 0.3647059, 1, 1,
0.3002616, -0.0889625, 3.082969, 0, 0.3568628, 1, 1,
0.3016947, -1.40435, 2.758443, 0, 0.3529412, 1, 1,
0.3020173, -0.07234839, 2.059184, 0, 0.345098, 1, 1,
0.3020175, -1.659011, 2.820161, 0, 0.3411765, 1, 1,
0.3154897, 0.8013957, 1.213709, 0, 0.3333333, 1, 1,
0.3172068, -1.799623, 1.842446, 0, 0.3294118, 1, 1,
0.3195209, -1.377105, 1.755079, 0, 0.3215686, 1, 1,
0.3198796, -2.401892, 3.798679, 0, 0.3176471, 1, 1,
0.3218512, -0.4329967, 1.652582, 0, 0.3098039, 1, 1,
0.3221781, 0.293592, 1.84225, 0, 0.3058824, 1, 1,
0.3255426, -0.1218067, 0.7167099, 0, 0.2980392, 1, 1,
0.3259685, 0.9608263, 1.71413, 0, 0.2901961, 1, 1,
0.3284697, 0.4971031, 0.1536795, 0, 0.2862745, 1, 1,
0.3321521, -0.2606869, 2.653332, 0, 0.2784314, 1, 1,
0.3328275, 1.363187, 0.5935106, 0, 0.2745098, 1, 1,
0.334023, 1.975968, -0.4916672, 0, 0.2666667, 1, 1,
0.3341913, -0.1816528, 1.264862, 0, 0.2627451, 1, 1,
0.3355041, -0.394328, 1.279535, 0, 0.254902, 1, 1,
0.3363109, -0.5301644, 2.284125, 0, 0.2509804, 1, 1,
0.3387528, 0.4478194, 0.453597, 0, 0.2431373, 1, 1,
0.3398198, 1.401036, 1.927687, 0, 0.2392157, 1, 1,
0.3412288, 0.06129178, -0.2132214, 0, 0.2313726, 1, 1,
0.3458526, 0.1661089, -0.753661, 0, 0.227451, 1, 1,
0.349696, 0.6819349, 1.274702, 0, 0.2196078, 1, 1,
0.3519893, -1.03921, 3.607863, 0, 0.2156863, 1, 1,
0.3528524, 0.5873625, 1.605514, 0, 0.2078431, 1, 1,
0.3563762, 1.839062, -0.3124907, 0, 0.2039216, 1, 1,
0.3568916, -1.617164, 3.88205, 0, 0.1960784, 1, 1,
0.3598561, -0.2662742, 3.554112, 0, 0.1882353, 1, 1,
0.362023, -0.1540812, 3.086663, 0, 0.1843137, 1, 1,
0.3620566, 1.088228, 0.5370628, 0, 0.1764706, 1, 1,
0.3673694, 1.752993, -0.1242137, 0, 0.172549, 1, 1,
0.3695073, 0.0004527742, 3.733164, 0, 0.1647059, 1, 1,
0.3701358, 0.5213963, 0.9484379, 0, 0.1607843, 1, 1,
0.3719509, 1.156912, 0.5455771, 0, 0.1529412, 1, 1,
0.372306, 0.8855555, 0.8896365, 0, 0.1490196, 1, 1,
0.3743207, -0.7803506, 4.503051, 0, 0.1411765, 1, 1,
0.3747529, 0.5562956, 0.3867817, 0, 0.1372549, 1, 1,
0.3816587, 0.469681, 1.794277, 0, 0.1294118, 1, 1,
0.3819702, 0.4276702, 1.291113, 0, 0.1254902, 1, 1,
0.3825314, 0.7915784, 0.5606527, 0, 0.1176471, 1, 1,
0.3856693, 0.6884618, 1.942326, 0, 0.1137255, 1, 1,
0.3935383, 0.04424785, 0.8754579, 0, 0.1058824, 1, 1,
0.3940355, -0.29218, 2.645731, 0, 0.09803922, 1, 1,
0.3940731, 0.5969627, -0.7591082, 0, 0.09411765, 1, 1,
0.3946359, -0.6171974, 4.149288, 0, 0.08627451, 1, 1,
0.3957135, 1.434724, 0.5757629, 0, 0.08235294, 1, 1,
0.3972295, -0.9618939, 2.88066, 0, 0.07450981, 1, 1,
0.3986665, -0.6401918, 1.572353, 0, 0.07058824, 1, 1,
0.400699, -1.233268, 2.702091, 0, 0.0627451, 1, 1,
0.4024574, -1.068882, 3.519238, 0, 0.05882353, 1, 1,
0.4069425, -0.09817067, 3.172099, 0, 0.05098039, 1, 1,
0.4115431, 0.9957256, -0.2121757, 0, 0.04705882, 1, 1,
0.4117449, 0.384354, 0.7264899, 0, 0.03921569, 1, 1,
0.4119399, -0.3750107, 3.520075, 0, 0.03529412, 1, 1,
0.4166861, 0.4661661, 0.2003426, 0, 0.02745098, 1, 1,
0.4167067, 1.677409, -1.872255, 0, 0.02352941, 1, 1,
0.4170913, 0.7043946, 1.432266, 0, 0.01568628, 1, 1,
0.4210091, 0.09128892, 0.2477105, 0, 0.01176471, 1, 1,
0.4272835, -1.376575, 3.599755, 0, 0.003921569, 1, 1,
0.4291079, -0.6991161, 4.017825, 0.003921569, 0, 1, 1,
0.4315535, -0.7783261, 4.427901, 0.007843138, 0, 1, 1,
0.4324074, -1.073469, 3.19873, 0.01568628, 0, 1, 1,
0.4331874, 0.7114031, -0.3496573, 0.01960784, 0, 1, 1,
0.4349717, -0.7660705, 3.346665, 0.02745098, 0, 1, 1,
0.4390702, 0.9523268, -0.3122606, 0.03137255, 0, 1, 1,
0.4402576, 1.286457, 2.048357, 0.03921569, 0, 1, 1,
0.4410194, 0.588607, 1.631066, 0.04313726, 0, 1, 1,
0.44329, -0.9394397, 0.9718113, 0.05098039, 0, 1, 1,
0.4433561, -0.8820916, 2.543584, 0.05490196, 0, 1, 1,
0.4449255, 1.306121, 0.9520578, 0.0627451, 0, 1, 1,
0.4479888, 1.042481, 0.6862083, 0.06666667, 0, 1, 1,
0.4529659, -0.745362, 2.528026, 0.07450981, 0, 1, 1,
0.454605, 0.241165, 0.1003268, 0.07843138, 0, 1, 1,
0.4560574, -0.5246558, 2.570284, 0.08627451, 0, 1, 1,
0.4567226, 1.80864, -1.421656, 0.09019608, 0, 1, 1,
0.4573787, 1.000177, 1.282841, 0.09803922, 0, 1, 1,
0.4602493, 0.9645182, 0.7276218, 0.1058824, 0, 1, 1,
0.4626765, -0.6660777, 0.4069219, 0.1098039, 0, 1, 1,
0.4638661, 1.563893, 0.7393397, 0.1176471, 0, 1, 1,
0.4687662, -0.06344076, 1.5712, 0.1215686, 0, 1, 1,
0.4696951, 0.5040967, 0.570947, 0.1294118, 0, 1, 1,
0.4783904, -0.3442601, 0.2584747, 0.1333333, 0, 1, 1,
0.4797659, -0.04358967, 2.156788, 0.1411765, 0, 1, 1,
0.4808096, -0.4917588, 4.321115, 0.145098, 0, 1, 1,
0.4848881, 0.1725765, 1.488706, 0.1529412, 0, 1, 1,
0.4890035, 0.01296556, 2.345047, 0.1568628, 0, 1, 1,
0.4923343, -0.5060142, 3.874529, 0.1647059, 0, 1, 1,
0.4938126, -0.9937122, 3.652846, 0.1686275, 0, 1, 1,
0.500096, 0.9116203, -0.02937039, 0.1764706, 0, 1, 1,
0.5046413, -0.3039076, 0.9470468, 0.1803922, 0, 1, 1,
0.5062364, 0.7488834, 2.157347, 0.1882353, 0, 1, 1,
0.5084668, -0.553993, 2.267019, 0.1921569, 0, 1, 1,
0.513154, 2.067387, -0.7965844, 0.2, 0, 1, 1,
0.5159985, -0.2281657, 3.244152, 0.2078431, 0, 1, 1,
0.5191849, 0.902836, 0.4393216, 0.2117647, 0, 1, 1,
0.5223439, 1.342176, 0.5114808, 0.2196078, 0, 1, 1,
0.5264904, -0.2962694, 2.950563, 0.2235294, 0, 1, 1,
0.5271336, 0.821147, 1.769842, 0.2313726, 0, 1, 1,
0.5353253, -0.6459467, 2.472997, 0.2352941, 0, 1, 1,
0.5415545, -0.1702126, 1.812126, 0.2431373, 0, 1, 1,
0.5489324, -0.8593053, 4.069256, 0.2470588, 0, 1, 1,
0.5496156, -0.1447792, 2.506342, 0.254902, 0, 1, 1,
0.5566712, -1.123316, 3.678153, 0.2588235, 0, 1, 1,
0.5574135, 1.55409, -0.2122949, 0.2666667, 0, 1, 1,
0.5585696, 0.5168324, 3.362111, 0.2705882, 0, 1, 1,
0.5594109, -0.03991537, 1.476453, 0.2784314, 0, 1, 1,
0.560961, 1.400363, 0.6322759, 0.282353, 0, 1, 1,
0.571453, -0.9459179, 2.634976, 0.2901961, 0, 1, 1,
0.5725543, -0.3395203, 2.521195, 0.2941177, 0, 1, 1,
0.5744473, -0.3723547, 2.574668, 0.3019608, 0, 1, 1,
0.5773542, 1.496833, -0.01497202, 0.3098039, 0, 1, 1,
0.5809158, 1.639699, -1.578897, 0.3137255, 0, 1, 1,
0.583542, -0.2294794, 2.19188, 0.3215686, 0, 1, 1,
0.5891014, -0.3275994, 1.804638, 0.3254902, 0, 1, 1,
0.5924079, -0.3304565, 2.720545, 0.3333333, 0, 1, 1,
0.5945331, -0.03076421, 0.3871252, 0.3372549, 0, 1, 1,
0.5951353, 1.740931, 0.8789929, 0.345098, 0, 1, 1,
0.6010067, 0.1155695, 2.073319, 0.3490196, 0, 1, 1,
0.6020501, 0.4256686, 1.862073, 0.3568628, 0, 1, 1,
0.6035243, 1.103249, 1.100356, 0.3607843, 0, 1, 1,
0.6063922, 0.9888497, 2.724123, 0.3686275, 0, 1, 1,
0.6086667, -1.18473, 3.914546, 0.372549, 0, 1, 1,
0.6114303, 0.0007880692, 1.96858, 0.3803922, 0, 1, 1,
0.6170513, 1.581657, 0.6783384, 0.3843137, 0, 1, 1,
0.6203311, 0.04894188, 0.7300031, 0.3921569, 0, 1, 1,
0.6252188, 1.936863, 0.8749881, 0.3960784, 0, 1, 1,
0.6302024, 2.072914, -0.1980766, 0.4039216, 0, 1, 1,
0.6312222, 1.009019, 1.42779, 0.4117647, 0, 1, 1,
0.6362689, 1.050016, -0.120715, 0.4156863, 0, 1, 1,
0.6382046, -0.2653831, 1.696795, 0.4235294, 0, 1, 1,
0.6435462, -0.3353254, 3.142928, 0.427451, 0, 1, 1,
0.6441144, 1.023401, -1.04796, 0.4352941, 0, 1, 1,
0.6446518, -0.7029297, 1.914685, 0.4392157, 0, 1, 1,
0.6508156, -1.176781, 2.642163, 0.4470588, 0, 1, 1,
0.6534618, -1.499237, 2.678783, 0.4509804, 0, 1, 1,
0.6577486, 0.4395198, 1.264931, 0.4588235, 0, 1, 1,
0.6607463, 0.03179312, 2.739796, 0.4627451, 0, 1, 1,
0.6726136, -0.1116875, 2.79118, 0.4705882, 0, 1, 1,
0.6736824, -0.4464474, 1.716998, 0.4745098, 0, 1, 1,
0.6768215, -0.2109727, 0.2865363, 0.4823529, 0, 1, 1,
0.6847102, -0.6733704, 2.634055, 0.4862745, 0, 1, 1,
0.6863579, -0.3037952, 1.197502, 0.4941176, 0, 1, 1,
0.6873878, -0.1413194, 2.472647, 0.5019608, 0, 1, 1,
0.6880716, 1.008208, -0.5271578, 0.5058824, 0, 1, 1,
0.691099, -0.3928702, 2.693041, 0.5137255, 0, 1, 1,
0.6947291, -1.178168, 2.578616, 0.5176471, 0, 1, 1,
0.6952312, 0.1236464, 1.887894, 0.5254902, 0, 1, 1,
0.6976777, -0.7337095, 1.794026, 0.5294118, 0, 1, 1,
0.6996738, -0.1903688, 1.855168, 0.5372549, 0, 1, 1,
0.7029567, -1.531276, 1.660648, 0.5411765, 0, 1, 1,
0.7053003, 0.2028167, 1.194625, 0.5490196, 0, 1, 1,
0.710697, -0.2304256, 2.918572, 0.5529412, 0, 1, 1,
0.7136021, -1.983872, 0.9860619, 0.5607843, 0, 1, 1,
0.7142961, 1.291423, 0.3542715, 0.5647059, 0, 1, 1,
0.7166528, 1.034169, -0.5273114, 0.572549, 0, 1, 1,
0.7176987, 0.2545148, 0.3642079, 0.5764706, 0, 1, 1,
0.7184198, -1.669881, 2.896027, 0.5843138, 0, 1, 1,
0.719477, -0.03729543, 2.324447, 0.5882353, 0, 1, 1,
0.7218247, 0.1340615, 3.062248, 0.5960785, 0, 1, 1,
0.7224292, -0.4769359, 1.913445, 0.6039216, 0, 1, 1,
0.7245851, 0.9179271, 4.143599, 0.6078432, 0, 1, 1,
0.7247542, 0.7901759, 0.7259406, 0.6156863, 0, 1, 1,
0.7279126, -0.001964702, 1.164145, 0.6196079, 0, 1, 1,
0.7390165, 0.7369814, 2.17478, 0.627451, 0, 1, 1,
0.7442825, 0.6884322, 1.245908, 0.6313726, 0, 1, 1,
0.7451574, -1.647921, 0.167942, 0.6392157, 0, 1, 1,
0.7484488, 0.01788509, 2.570469, 0.6431373, 0, 1, 1,
0.748472, 0.230397, -1.716861, 0.6509804, 0, 1, 1,
0.7504404, 0.6929247, 0.8567926, 0.654902, 0, 1, 1,
0.7589604, -0.7213962, 1.540578, 0.6627451, 0, 1, 1,
0.7602995, 0.05696631, 2.414372, 0.6666667, 0, 1, 1,
0.7615196, 0.5340672, -0.3722183, 0.6745098, 0, 1, 1,
0.7710028, 2.336535, 1.099793, 0.6784314, 0, 1, 1,
0.7718346, 1.214352, 1.085185, 0.6862745, 0, 1, 1,
0.7737325, 0.3668114, 2.153535, 0.6901961, 0, 1, 1,
0.7761567, 0.07072178, 0.9411135, 0.6980392, 0, 1, 1,
0.780332, 0.179459, 2.886659, 0.7058824, 0, 1, 1,
0.7816746, -0.9828702, 2.590409, 0.7098039, 0, 1, 1,
0.7851582, -0.03782969, 0.5043752, 0.7176471, 0, 1, 1,
0.7871359, -0.2145708, 1.788875, 0.7215686, 0, 1, 1,
0.7887312, -0.6961287, 1.879744, 0.7294118, 0, 1, 1,
0.80553, 0.113854, 1.576762, 0.7333333, 0, 1, 1,
0.8108447, -0.1258386, 2.145713, 0.7411765, 0, 1, 1,
0.8146756, 0.4346571, -0.4300995, 0.7450981, 0, 1, 1,
0.819086, 1.744185, 0.9566915, 0.7529412, 0, 1, 1,
0.8211059, 0.4599883, 0.2846614, 0.7568628, 0, 1, 1,
0.8331038, 0.07706364, 0.08484285, 0.7647059, 0, 1, 1,
0.8350351, 0.5201493, -0.218964, 0.7686275, 0, 1, 1,
0.8378303, -1.354, 2.113714, 0.7764706, 0, 1, 1,
0.8477783, 0.1178335, 1.411404, 0.7803922, 0, 1, 1,
0.8568353, -0.8712397, 0.6978548, 0.7882353, 0, 1, 1,
0.8584843, -0.2972241, 1.70261, 0.7921569, 0, 1, 1,
0.8586515, -0.7399527, 1.427334, 0.8, 0, 1, 1,
0.8600445, 0.8117306, 1.213476, 0.8078431, 0, 1, 1,
0.8666912, 0.6180342, 0.5300667, 0.8117647, 0, 1, 1,
0.8674539, -1.343372, 3.770595, 0.8196079, 0, 1, 1,
0.875393, 0.1124008, 2.150945, 0.8235294, 0, 1, 1,
0.8764494, 0.01181717, 1.868194, 0.8313726, 0, 1, 1,
0.8802481, -0.0601173, 1.164104, 0.8352941, 0, 1, 1,
0.8824943, -0.6386458, 3.366886, 0.8431373, 0, 1, 1,
0.8907263, -0.3451457, 1.18635, 0.8470588, 0, 1, 1,
0.8941197, 0.5770382, -0.6044453, 0.854902, 0, 1, 1,
0.8970762, 0.9299263, 1.672131, 0.8588235, 0, 1, 1,
0.89793, -0.2254944, 2.823188, 0.8666667, 0, 1, 1,
0.9050482, 0.3839443, -0.4950092, 0.8705882, 0, 1, 1,
0.9093199, 1.207185, 0.09363098, 0.8784314, 0, 1, 1,
0.9123544, 0.3482231, 0.02369078, 0.8823529, 0, 1, 1,
0.9187092, -0.8129054, 4.056304, 0.8901961, 0, 1, 1,
0.9199864, -0.446853, 2.174941, 0.8941177, 0, 1, 1,
0.9254873, 1.910483, 0.002479267, 0.9019608, 0, 1, 1,
0.9281749, 0.8522868, 1.514894, 0.9098039, 0, 1, 1,
0.9329443, -0.08876558, 1.890481, 0.9137255, 0, 1, 1,
0.936743, -0.1894672, 2.395937, 0.9215686, 0, 1, 1,
0.9481572, -0.05644469, 2.603895, 0.9254902, 0, 1, 1,
0.9517016, 0.6189163, 0.1989595, 0.9333333, 0, 1, 1,
0.9543208, -1.405349, 3.252922, 0.9372549, 0, 1, 1,
0.9634064, -0.3127133, 4.061109, 0.945098, 0, 1, 1,
0.9690353, -0.6174807, 2.372498, 0.9490196, 0, 1, 1,
0.9699473, 0.03901482, 0.6806994, 0.9568627, 0, 1, 1,
0.9706094, -0.697249, 3.656201, 0.9607843, 0, 1, 1,
0.9729803, -0.02599399, -0.177788, 0.9686275, 0, 1, 1,
0.9732753, -0.3707801, 0.9657035, 0.972549, 0, 1, 1,
0.9830768, -0.7957121, 1.599555, 0.9803922, 0, 1, 1,
0.9851387, 0.411094, 1.372363, 0.9843137, 0, 1, 1,
0.9869775, 1.395729, -1.690045, 0.9921569, 0, 1, 1,
0.9871913, -0.5254559, 2.629617, 0.9960784, 0, 1, 1,
0.9917527, -1.405547, 1.683163, 1, 0, 0.9960784, 1,
0.9918885, -1.046575, 2.436175, 1, 0, 0.9882353, 1,
0.9920448, 1.909949, 1.020946, 1, 0, 0.9843137, 1,
0.9937676, 0.3664795, -0.07069832, 1, 0, 0.9764706, 1,
0.995938, 1.340312, 2.142602, 1, 0, 0.972549, 1,
0.9959465, 0.9116889, 2.367633, 1, 0, 0.9647059, 1,
0.9962205, -0.2717579, 2.367418, 1, 0, 0.9607843, 1,
0.9995803, 1.247935, 2.025017, 1, 0, 0.9529412, 1,
0.9997596, -0.6196445, 1.999931, 1, 0, 0.9490196, 1,
1.00061, -0.6718243, 1.672148, 1, 0, 0.9411765, 1,
1.000896, -0.7048463, 1.885436, 1, 0, 0.9372549, 1,
1.00144, -0.1540968, 1.042267, 1, 0, 0.9294118, 1,
1.002496, 0.1933018, 1.297726, 1, 0, 0.9254902, 1,
1.008836, 0.05074621, 1.168347, 1, 0, 0.9176471, 1,
1.01006, -0.2995363, 2.308213, 1, 0, 0.9137255, 1,
1.01676, -0.008008706, 1.807563, 1, 0, 0.9058824, 1,
1.021979, 0.4988433, 0.7593383, 1, 0, 0.9019608, 1,
1.022207, -1.820336, 2.981386, 1, 0, 0.8941177, 1,
1.030255, -0.9994658, 0.49415, 1, 0, 0.8862745, 1,
1.030954, -0.765827, 1.847137, 1, 0, 0.8823529, 1,
1.036269, 0.4262873, -0.3826593, 1, 0, 0.8745098, 1,
1.036526, 3.006793, 0.7929578, 1, 0, 0.8705882, 1,
1.04501, -0.6347687, 1.07496, 1, 0, 0.8627451, 1,
1.047635, 0.2311035, 1.61062, 1, 0, 0.8588235, 1,
1.049677, -0.7163538, 0.5655144, 1, 0, 0.8509804, 1,
1.064686, 2.014082, -1.461079, 1, 0, 0.8470588, 1,
1.071937, -1.035642, 3.034102, 1, 0, 0.8392157, 1,
1.075113, 0.9250295, 1.114301, 1, 0, 0.8352941, 1,
1.075536, -1.271597, 1.462172, 1, 0, 0.827451, 1,
1.085056, -1.292752, 1.368308, 1, 0, 0.8235294, 1,
1.085459, 0.4134, 0.193776, 1, 0, 0.8156863, 1,
1.094537, 0.9698895, 2.152366, 1, 0, 0.8117647, 1,
1.096771, 0.7400527, 0.1590594, 1, 0, 0.8039216, 1,
1.097664, 0.1979985, 0.3025586, 1, 0, 0.7960784, 1,
1.099282, 0.8692391, 0.1571225, 1, 0, 0.7921569, 1,
1.101457, 0.2233747, 1.307851, 1, 0, 0.7843137, 1,
1.102033, -0.05401978, 3.579551, 1, 0, 0.7803922, 1,
1.106496, 1.034188, -0.2884641, 1, 0, 0.772549, 1,
1.109953, 0.03679992, 3.263408, 1, 0, 0.7686275, 1,
1.118192, -1.086252, 2.437203, 1, 0, 0.7607843, 1,
1.144132, 1.614915, 0.07140071, 1, 0, 0.7568628, 1,
1.153664, 0.3710816, 0.8425874, 1, 0, 0.7490196, 1,
1.154959, 0.748956, 1.975944, 1, 0, 0.7450981, 1,
1.156912, 0.5833024, 2.025974, 1, 0, 0.7372549, 1,
1.159386, -0.8468509, 3.766215, 1, 0, 0.7333333, 1,
1.16012, -2.263865, 4.461714, 1, 0, 0.7254902, 1,
1.168739, -2.015, 4.2286, 1, 0, 0.7215686, 1,
1.171541, 0.5186448, 0.2033047, 1, 0, 0.7137255, 1,
1.173641, 1.509587, 1.420376, 1, 0, 0.7098039, 1,
1.178749, 0.9068676, 1.022792, 1, 0, 0.7019608, 1,
1.194086, -0.09905694, 2.550338, 1, 0, 0.6941177, 1,
1.194393, -0.973911, 2.215544, 1, 0, 0.6901961, 1,
1.208478, -0.4981525, 1.341404, 1, 0, 0.682353, 1,
1.214945, -0.6839629, 0.1958033, 1, 0, 0.6784314, 1,
1.217451, -0.08324053, 2.932526, 1, 0, 0.6705883, 1,
1.222121, -1.056385, 1.029658, 1, 0, 0.6666667, 1,
1.237055, 0.8671315, -0.1102709, 1, 0, 0.6588235, 1,
1.239558, 1.044585, 2.25131, 1, 0, 0.654902, 1,
1.239609, -1.714766, 3.59307, 1, 0, 0.6470588, 1,
1.244926, -0.3118619, 1.324314, 1, 0, 0.6431373, 1,
1.245351, -2.377356, 1.204907, 1, 0, 0.6352941, 1,
1.251267, 0.4916652, 1.434486, 1, 0, 0.6313726, 1,
1.280338, -1.218385, 2.745848, 1, 0, 0.6235294, 1,
1.288815, -1.857117, 4.255786, 1, 0, 0.6196079, 1,
1.289426, 0.9605684, 1.757898, 1, 0, 0.6117647, 1,
1.298178, 0.855956, 0.935541, 1, 0, 0.6078432, 1,
1.3072, -0.5351034, 3.439066, 1, 0, 0.6, 1,
1.307523, 0.5778462, 0.9788135, 1, 0, 0.5921569, 1,
1.308418, 1.263134, 0.4721774, 1, 0, 0.5882353, 1,
1.310269, -0.6430681, 1.078943, 1, 0, 0.5803922, 1,
1.32356, -0.3807323, 1.661759, 1, 0, 0.5764706, 1,
1.325682, -1.278368, 3.379131, 1, 0, 0.5686275, 1,
1.326669, 0.4351248, 3.079518, 1, 0, 0.5647059, 1,
1.329816, -0.6441578, 0.8350276, 1, 0, 0.5568628, 1,
1.343654, 0.8805144, 1.63442, 1, 0, 0.5529412, 1,
1.349091, 1.171163, 0.9958935, 1, 0, 0.5450981, 1,
1.354506, 0.06090028, 2.238867, 1, 0, 0.5411765, 1,
1.358498, 1.613877, 0.1432736, 1, 0, 0.5333334, 1,
1.364979, -0.9714337, 3.488263, 1, 0, 0.5294118, 1,
1.365919, 0.645223, 2.65806, 1, 0, 0.5215687, 1,
1.373081, -0.8344468, 2.558122, 1, 0, 0.5176471, 1,
1.376107, -0.4827445, 1.237611, 1, 0, 0.509804, 1,
1.417793, 1.756151, -1.101912, 1, 0, 0.5058824, 1,
1.422412, 0.3567184, 2.346486, 1, 0, 0.4980392, 1,
1.426431, -0.7866753, 2.072071, 1, 0, 0.4901961, 1,
1.427322, 0.6751739, 0.7639478, 1, 0, 0.4862745, 1,
1.430303, -0.9146007, 4.029254, 1, 0, 0.4784314, 1,
1.437634, 0.9383108, 1.263356, 1, 0, 0.4745098, 1,
1.438548, 0.01725299, 1.878818, 1, 0, 0.4666667, 1,
1.444598, -0.4090368, 1.793223, 1, 0, 0.4627451, 1,
1.477537, 0.9099635, 0.8004134, 1, 0, 0.454902, 1,
1.48302, -0.4322194, 2.001175, 1, 0, 0.4509804, 1,
1.487571, 1.257525, 0.1466958, 1, 0, 0.4431373, 1,
1.488275, 0.1250787, 1.859484, 1, 0, 0.4392157, 1,
1.489072, 0.1485522, 1.022687, 1, 0, 0.4313726, 1,
1.499448, -0.8761356, 3.417056, 1, 0, 0.427451, 1,
1.502736, -1.846497, 2.648596, 1, 0, 0.4196078, 1,
1.52352, -0.2030686, 1.995215, 1, 0, 0.4156863, 1,
1.52697, 0.06199692, 0.96009, 1, 0, 0.4078431, 1,
1.534971, -0.5321342, 1.270445, 1, 0, 0.4039216, 1,
1.543686, 0.4101828, 0.1179102, 1, 0, 0.3960784, 1,
1.545972, -0.2214194, 0.9103411, 1, 0, 0.3882353, 1,
1.548767, -0.7866431, 1.849049, 1, 0, 0.3843137, 1,
1.553805, 0.04120824, 1.429186, 1, 0, 0.3764706, 1,
1.559117, -0.9676605, 2.359321, 1, 0, 0.372549, 1,
1.563652, -0.5871763, 1.624421, 1, 0, 0.3647059, 1,
1.58048, -0.07516886, 0.7142307, 1, 0, 0.3607843, 1,
1.588392, -0.3651231, 1.743412, 1, 0, 0.3529412, 1,
1.595801, 0.5149247, 0.8346447, 1, 0, 0.3490196, 1,
1.606424, 0.3212044, 1.362102, 1, 0, 0.3411765, 1,
1.625796, -0.904632, 1.72758, 1, 0, 0.3372549, 1,
1.631442, -0.3657195, 1.752904, 1, 0, 0.3294118, 1,
1.63548, -0.6323402, 3.011719, 1, 0, 0.3254902, 1,
1.646592, -0.3521498, 2.783663, 1, 0, 0.3176471, 1,
1.659057, -0.3284911, 1.104994, 1, 0, 0.3137255, 1,
1.664292, -0.9839851, 0.9143699, 1, 0, 0.3058824, 1,
1.706096, 0.469444, 1.090496, 1, 0, 0.2980392, 1,
1.709841, 1.224805, 0.6716141, 1, 0, 0.2941177, 1,
1.714058, -2.125975, 0.8809351, 1, 0, 0.2862745, 1,
1.715375, -0.9497073, 2.361363, 1, 0, 0.282353, 1,
1.71819, -0.1349507, 1.463214, 1, 0, 0.2745098, 1,
1.719744, 2.08581, 0.5076047, 1, 0, 0.2705882, 1,
1.733564, -0.684701, 0.5873747, 1, 0, 0.2627451, 1,
1.736013, -0.4570876, 2.288701, 1, 0, 0.2588235, 1,
1.741212, 0.5410513, 1.111549, 1, 0, 0.2509804, 1,
1.751734, -1.282935, 2.376564, 1, 0, 0.2470588, 1,
1.763179, 0.2408058, 1.288053, 1, 0, 0.2392157, 1,
1.764525, 0.2325435, 2.35817, 1, 0, 0.2352941, 1,
1.766795, -0.2609314, 0.7717183, 1, 0, 0.227451, 1,
1.773732, 0.9799321, -0.5135416, 1, 0, 0.2235294, 1,
1.787374, 1.314647, 0.3078259, 1, 0, 0.2156863, 1,
1.813994, 1.393445, 0.4441197, 1, 0, 0.2117647, 1,
1.821011, -0.488374, 3.374184, 1, 0, 0.2039216, 1,
1.830809, -1.216536, 0.9931274, 1, 0, 0.1960784, 1,
1.835673, 0.6532531, 0.3903206, 1, 0, 0.1921569, 1,
1.846135, 1.58489, 0.5572365, 1, 0, 0.1843137, 1,
1.849611, 0.4110572, 0.6305528, 1, 0, 0.1803922, 1,
1.892333, -1.388208, 0.6220474, 1, 0, 0.172549, 1,
1.909868, 0.1230105, 0.8630518, 1, 0, 0.1686275, 1,
1.917235, 0.6642315, 1.470304, 1, 0, 0.1607843, 1,
1.929245, 1.735802, 1.218617, 1, 0, 0.1568628, 1,
1.956433, 0.2532257, 1.9037, 1, 0, 0.1490196, 1,
1.957592, 1.067758, 0.8627942, 1, 0, 0.145098, 1,
1.983127, 1.54466, 0.8140309, 1, 0, 0.1372549, 1,
1.984651, 0.0523767, 1.134324, 1, 0, 0.1333333, 1,
2.010653, -0.4056764, 0.6379862, 1, 0, 0.1254902, 1,
2.013866, 0.8098853, 1.358814, 1, 0, 0.1215686, 1,
2.016547, 1.738729, 1.58735, 1, 0, 0.1137255, 1,
2.027624, 0.3101904, 1.077717, 1, 0, 0.1098039, 1,
2.030675, 1.100259, 0.29769, 1, 0, 0.1019608, 1,
2.04156, 0.5613561, 0.1393761, 1, 0, 0.09411765, 1,
2.094695, -0.7568068, 2.374058, 1, 0, 0.09019608, 1,
2.128123, 0.9537908, 0.9889683, 1, 0, 0.08235294, 1,
2.20776, -0.2025776, 1.782814, 1, 0, 0.07843138, 1,
2.224045, 0.3219079, -1.206976, 1, 0, 0.07058824, 1,
2.231372, -0.9539002, 1.997948, 1, 0, 0.06666667, 1,
2.248024, -0.6068394, 1.534419, 1, 0, 0.05882353, 1,
2.25537, 1.643145, 1.687104, 1, 0, 0.05490196, 1,
2.308327, -2.719599, 2.610711, 1, 0, 0.04705882, 1,
2.343954, -0.6489692, 2.531361, 1, 0, 0.04313726, 1,
2.376388, 0.1068828, 3.562593, 1, 0, 0.03529412, 1,
2.471061, -0.5320279, 1.311958, 1, 0, 0.03137255, 1,
2.634919, 1.1413, 2.09857, 1, 0, 0.02352941, 1,
2.880344, 0.1388657, 1.34793, 1, 0, 0.01960784, 1,
2.955086, 0.05483869, 2.501721, 1, 0, 0.01176471, 1,
3.267318, 1.172, 1.153238, 1, 0, 0.007843138, 1
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
0.04238665, -3.828891, -6.533986, 0, -0.5, 0.5, 0.5,
0.04238665, -3.828891, -6.533986, 1, -0.5, 0.5, 0.5,
0.04238665, -3.828891, -6.533986, 1, 1.5, 0.5, 0.5,
0.04238665, -3.828891, -6.533986, 0, 1.5, 0.5, 0.5
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
-4.275796, 0.2525055, -6.533986, 0, -0.5, 0.5, 0.5,
-4.275796, 0.2525055, -6.533986, 1, -0.5, 0.5, 0.5,
-4.275796, 0.2525055, -6.533986, 1, 1.5, 0.5, 0.5,
-4.275796, 0.2525055, -6.533986, 0, 1.5, 0.5, 0.5
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
-4.275796, -3.828891, 0.170423, 0, -0.5, 0.5, 0.5,
-4.275796, -3.828891, 0.170423, 1, -0.5, 0.5, 0.5,
-4.275796, -3.828891, 0.170423, 1, 1.5, 0.5, 0.5,
-4.275796, -3.828891, 0.170423, 0, 1.5, 0.5, 0.5
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
-3, -2.88703, -4.986814,
3, -2.88703, -4.986814,
-3, -2.88703, -4.986814,
-3, -3.044007, -5.244676,
-2, -2.88703, -4.986814,
-2, -3.044007, -5.244676,
-1, -2.88703, -4.986814,
-1, -3.044007, -5.244676,
0, -2.88703, -4.986814,
0, -3.044007, -5.244676,
1, -2.88703, -4.986814,
1, -3.044007, -5.244676,
2, -2.88703, -4.986814,
2, -3.044007, -5.244676,
3, -2.88703, -4.986814,
3, -3.044007, -5.244676
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
-3, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
-3, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
-3, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
-3, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
-2, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
-2, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
-2, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
-2, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
-1, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
-1, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
-1, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
-1, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
0, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
0, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
0, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
0, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
1, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
1, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
1, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
1, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
2, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
2, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
2, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
2, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5,
3, -3.35796, -5.7604, 0, -0.5, 0.5, 0.5,
3, -3.35796, -5.7604, 1, -0.5, 0.5, 0.5,
3, -3.35796, -5.7604, 1, 1.5, 0.5, 0.5,
3, -3.35796, -5.7604, 0, 1.5, 0.5, 0.5
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
-3.279292, -2, -4.986814,
-3.279292, 3, -4.986814,
-3.279292, -2, -4.986814,
-3.445376, -2, -5.244676,
-3.279292, -1, -4.986814,
-3.445376, -1, -5.244676,
-3.279292, 0, -4.986814,
-3.445376, 0, -5.244676,
-3.279292, 1, -4.986814,
-3.445376, 1, -5.244676,
-3.279292, 2, -4.986814,
-3.445376, 2, -5.244676,
-3.279292, 3, -4.986814,
-3.445376, 3, -5.244676
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
-3.777544, -2, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, -2, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, -2, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, -2, -5.7604, 0, 1.5, 0.5, 0.5,
-3.777544, -1, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, -1, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, -1, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, -1, -5.7604, 0, 1.5, 0.5, 0.5,
-3.777544, 0, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, 0, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, 0, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, 0, -5.7604, 0, 1.5, 0.5, 0.5,
-3.777544, 1, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, 1, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, 1, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, 1, -5.7604, 0, 1.5, 0.5, 0.5,
-3.777544, 2, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, 2, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, 2, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, 2, -5.7604, 0, 1.5, 0.5, 0.5,
-3.777544, 3, -5.7604, 0, -0.5, 0.5, 0.5,
-3.777544, 3, -5.7604, 1, -0.5, 0.5, 0.5,
-3.777544, 3, -5.7604, 1, 1.5, 0.5, 0.5,
-3.777544, 3, -5.7604, 0, 1.5, 0.5, 0.5
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
-3.279292, -2.88703, -4,
-3.279292, -2.88703, 4,
-3.279292, -2.88703, -4,
-3.445376, -3.044007, -4,
-3.279292, -2.88703, -2,
-3.445376, -3.044007, -2,
-3.279292, -2.88703, 0,
-3.445376, -3.044007, 0,
-3.279292, -2.88703, 2,
-3.445376, -3.044007, 2,
-3.279292, -2.88703, 4,
-3.445376, -3.044007, 4
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
-3.777544, -3.35796, -4, 0, -0.5, 0.5, 0.5,
-3.777544, -3.35796, -4, 1, -0.5, 0.5, 0.5,
-3.777544, -3.35796, -4, 1, 1.5, 0.5, 0.5,
-3.777544, -3.35796, -4, 0, 1.5, 0.5, 0.5,
-3.777544, -3.35796, -2, 0, -0.5, 0.5, 0.5,
-3.777544, -3.35796, -2, 1, -0.5, 0.5, 0.5,
-3.777544, -3.35796, -2, 1, 1.5, 0.5, 0.5,
-3.777544, -3.35796, -2, 0, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 0, 0, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 0, 1, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 0, 1, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 0, 0, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 2, 0, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 2, 1, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 2, 1, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 2, 0, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 4, 0, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 4, 1, -0.5, 0.5, 0.5,
-3.777544, -3.35796, 4, 1, 1.5, 0.5, 0.5,
-3.777544, -3.35796, 4, 0, 1.5, 0.5, 0.5
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
-3.279292, -2.88703, -4.986814,
-3.279292, 3.392041, -4.986814,
-3.279292, -2.88703, 5.327661,
-3.279292, 3.392041, 5.327661,
-3.279292, -2.88703, -4.986814,
-3.279292, -2.88703, 5.327661,
-3.279292, 3.392041, -4.986814,
-3.279292, 3.392041, 5.327661,
-3.279292, -2.88703, -4.986814,
3.364065, -2.88703, -4.986814,
-3.279292, -2.88703, 5.327661,
3.364065, -2.88703, 5.327661,
-3.279292, 3.392041, -4.986814,
3.364065, 3.392041, -4.986814,
-3.279292, 3.392041, 5.327661,
3.364065, 3.392041, 5.327661,
3.364065, -2.88703, -4.986814,
3.364065, 3.392041, -4.986814,
3.364065, -2.88703, 5.327661,
3.364065, 3.392041, 5.327661,
3.364065, -2.88703, -4.986814,
3.364065, -2.88703, 5.327661,
3.364065, 3.392041, -4.986814,
3.364065, 3.392041, 5.327661
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
var radius = 7.359433;
var distance = 32.74295;
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
mvMatrix.translate( -0.04238665, -0.2525055, -0.170423 );
mvMatrix.scale( 1.197762, 1.267252, 0.7714559 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.74295);
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
Phenoxypropionate<-read.table("Phenoxypropionate.xyz")
```

```
## Error in read.table("Phenoxypropionate.xyz"): no lines available in input
```

```r
x<-Phenoxypropionate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
y<-Phenoxypropionate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
z<-Phenoxypropionate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
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
-3.182544, -1.017437, -2.363046, 0, 0, 1, 1, 1,
-3.092506, -0.6056485, -3.480601, 1, 0, 0, 1, 1,
-3.077857, -0.1138815, -1.880206, 1, 0, 0, 1, 1,
-2.781493, 0.1448283, -2.288869, 1, 0, 0, 1, 1,
-2.676642, -1.452277, -2.593321, 1, 0, 0, 1, 1,
-2.491629, 2.233869, -1.937897, 1, 0, 0, 1, 1,
-2.37516, 0.9791625, 0.04578919, 0, 0, 0, 1, 1,
-2.306462, -1.443864, -3.197196, 0, 0, 0, 1, 1,
-2.294997, 0.1463133, -1.161846, 0, 0, 0, 1, 1,
-2.227608, 1.189076, -1.595534, 0, 0, 0, 1, 1,
-2.201284, -0.5245149, -1.047782, 0, 0, 0, 1, 1,
-2.19968, -1.518801, -1.471122, 0, 0, 0, 1, 1,
-2.19644, 1.585771, -1.723921, 0, 0, 0, 1, 1,
-2.185825, -0.1150474, -1.412065, 1, 1, 1, 1, 1,
-2.148252, 0.9910881, -0.5031889, 1, 1, 1, 1, 1,
-2.135912, 0.7669626, -1.715893, 1, 1, 1, 1, 1,
-2.061735, 1.639476, 1.221335, 1, 1, 1, 1, 1,
-2.049213, 0.7778699, -1.095131, 1, 1, 1, 1, 1,
-2.037902, 0.05902607, -2.947546, 1, 1, 1, 1, 1,
-2.034731, -0.1825715, -2.075117, 1, 1, 1, 1, 1,
-2.033079, -0.2072982, -2.797261, 1, 1, 1, 1, 1,
-2.019343, 0.5911505, -1.140143, 1, 1, 1, 1, 1,
-1.995219, 0.5661341, -1.366102, 1, 1, 1, 1, 1,
-1.987642, 2.33096, 0.2598464, 1, 1, 1, 1, 1,
-1.982493, -0.9887875, -3.015304, 1, 1, 1, 1, 1,
-1.963243, -1.903489, -1.927891, 1, 1, 1, 1, 1,
-1.940057, -0.08411951, -3.236917, 1, 1, 1, 1, 1,
-1.90817, -0.8416995, -3.402111, 1, 1, 1, 1, 1,
-1.90649, -1.212347, -3.045274, 0, 0, 1, 1, 1,
-1.900108, 1.36535, -1.991977, 1, 0, 0, 1, 1,
-1.88853, 0.3647924, -0.4236713, 1, 0, 0, 1, 1,
-1.882389, -1.680878, -0.3362971, 1, 0, 0, 1, 1,
-1.879824, 0.5900899, -2.63759, 1, 0, 0, 1, 1,
-1.874575, 1.653302, 0.5149921, 1, 0, 0, 1, 1,
-1.859753, 1.207721, -1.157015, 0, 0, 0, 1, 1,
-1.850251, -0.2964173, -1.462561, 0, 0, 0, 1, 1,
-1.83948, 0.9368539, -2.844213, 0, 0, 0, 1, 1,
-1.838006, -0.08420251, -1.316351, 0, 0, 0, 1, 1,
-1.82655, 0.4005219, -1.365185, 0, 0, 0, 1, 1,
-1.791464, 1.122247, -1.444209, 0, 0, 0, 1, 1,
-1.771225, -0.4638433, -1.412571, 0, 0, 0, 1, 1,
-1.767281, 1.489958, 0.1685378, 1, 1, 1, 1, 1,
-1.75893, 0.1284702, -1.561542, 1, 1, 1, 1, 1,
-1.707755, -0.03153931, -3.202844, 1, 1, 1, 1, 1,
-1.704231, -0.6057537, -3.328799, 1, 1, 1, 1, 1,
-1.656663, -1.539254, -2.086226, 1, 1, 1, 1, 1,
-1.629117, -1.034616, -1.17069, 1, 1, 1, 1, 1,
-1.614214, -0.2316468, -0.04077578, 1, 1, 1, 1, 1,
-1.611071, -0.1216113, -1.661043, 1, 1, 1, 1, 1,
-1.607727, 0.4584222, -2.296943, 1, 1, 1, 1, 1,
-1.599156, -0.04269951, -3.75765, 1, 1, 1, 1, 1,
-1.594747, 0.6942386, -0.8623413, 1, 1, 1, 1, 1,
-1.590497, -1.023348, -2.61523, 1, 1, 1, 1, 1,
-1.585206, 1.062343, 0.02761172, 1, 1, 1, 1, 1,
-1.584699, 0.681473, -0.4850545, 1, 1, 1, 1, 1,
-1.579574, 0.9883516, -1.248673, 1, 1, 1, 1, 1,
-1.560519, 0.4786896, -1.6982, 0, 0, 1, 1, 1,
-1.556384, 1.364086, 0.5266964, 1, 0, 0, 1, 1,
-1.523279, 0.07693175, -0.5184676, 1, 0, 0, 1, 1,
-1.510816, -0.6637373, -4.202213, 1, 0, 0, 1, 1,
-1.5028, 0.008981048, -2.075292, 1, 0, 0, 1, 1,
-1.502527, -1.322349, -1.071308, 1, 0, 0, 1, 1,
-1.48622, -1.905777, 0.1222398, 0, 0, 0, 1, 1,
-1.48009, -2.034302, -1.736309, 0, 0, 0, 1, 1,
-1.47078, -1.097787, -1.114341, 0, 0, 0, 1, 1,
-1.462197, -0.7136397, -2.066618, 0, 0, 0, 1, 1,
-1.454057, -0.8452411, -0.6821002, 0, 0, 0, 1, 1,
-1.451429, 0.861184, -1.132629, 0, 0, 0, 1, 1,
-1.43555, -0.7035922, -1.761139, 0, 0, 0, 1, 1,
-1.429725, 1.593226, -1.645205, 1, 1, 1, 1, 1,
-1.418967, 0.4644367, 0.1583923, 1, 1, 1, 1, 1,
-1.412032, 0.9686244, 1.057072, 1, 1, 1, 1, 1,
-1.407808, -0.162271, -0.7490839, 1, 1, 1, 1, 1,
-1.402603, -0.5081539, -1.153217, 1, 1, 1, 1, 1,
-1.389975, 2.327204, 0.4722255, 1, 1, 1, 1, 1,
-1.382563, 0.4944144, -1.230119, 1, 1, 1, 1, 1,
-1.381113, -1.056544, -2.293576, 1, 1, 1, 1, 1,
-1.380045, -0.889388, -1.376919, 1, 1, 1, 1, 1,
-1.368954, -0.3777002, -2.797761, 1, 1, 1, 1, 1,
-1.36748, -0.1980413, -1.407982, 1, 1, 1, 1, 1,
-1.363646, 0.2780886, -1.199449, 1, 1, 1, 1, 1,
-1.358039, -2.715256, -2.880692, 1, 1, 1, 1, 1,
-1.357884, -0.5788857, -2.031758, 1, 1, 1, 1, 1,
-1.345819, 0.6276259, -0.8708764, 1, 1, 1, 1, 1,
-1.333434, -1.556811, -2.155958, 0, 0, 1, 1, 1,
-1.328567, -1.330618, -2.047968, 1, 0, 0, 1, 1,
-1.312601, -1.236552, -2.032126, 1, 0, 0, 1, 1,
-1.311074, -0.4286129, -1.208083, 1, 0, 0, 1, 1,
-1.310353, -0.922327, -0.941431, 1, 0, 0, 1, 1,
-1.30876, -2.592542, -1.527548, 1, 0, 0, 1, 1,
-1.30294, -0.6268724, -2.544125, 0, 0, 0, 1, 1,
-1.297977, 0.6740254, -0.1579693, 0, 0, 0, 1, 1,
-1.290418, -1.142494, -2.260527, 0, 0, 0, 1, 1,
-1.264787, -0.3584163, -1.755532, 0, 0, 0, 1, 1,
-1.257797, -0.05297657, -2.84215, 0, 0, 0, 1, 1,
-1.245277, -1.997218, -1.636639, 0, 0, 0, 1, 1,
-1.241596, -0.395297, -1.862138, 0, 0, 0, 1, 1,
-1.233859, 0.4886796, -3.639946, 1, 1, 1, 1, 1,
-1.219911, 0.2231482, -1.227365, 1, 1, 1, 1, 1,
-1.216845, 0.5179371, 0.5508599, 1, 1, 1, 1, 1,
-1.214552, -0.3676195, -1.513171, 1, 1, 1, 1, 1,
-1.212937, -0.7096108, -2.002573, 1, 1, 1, 1, 1,
-1.208652, 0.7215708, -0.8657607, 1, 1, 1, 1, 1,
-1.207167, 0.02690757, -1.334702, 1, 1, 1, 1, 1,
-1.206529, 0.9747573, -1.289955, 1, 1, 1, 1, 1,
-1.203833, 1.002446, -2.054173, 1, 1, 1, 1, 1,
-1.203349, 0.8198661, -1.015029, 1, 1, 1, 1, 1,
-1.199091, -0.03437848, -3.000143, 1, 1, 1, 1, 1,
-1.197404, -0.9242949, -1.74839, 1, 1, 1, 1, 1,
-1.188268, -0.03378719, -1.795749, 1, 1, 1, 1, 1,
-1.175183, 0.2242992, -0.2620884, 1, 1, 1, 1, 1,
-1.172633, 0.1630447, -1.939562, 1, 1, 1, 1, 1,
-1.168687, 0.08705159, -1.951468, 0, 0, 1, 1, 1,
-1.168154, 0.4200096, -1.153591, 1, 0, 0, 1, 1,
-1.165771, 0.3041369, -1.835868, 1, 0, 0, 1, 1,
-1.164217, 0.1276475, -1.401635, 1, 0, 0, 1, 1,
-1.144292, -1.943956, -1.889701, 1, 0, 0, 1, 1,
-1.140629, 1.206659, -1.260391, 1, 0, 0, 1, 1,
-1.140359, 0.8541372, -0.06986116, 0, 0, 0, 1, 1,
-1.126472, 0.272813, -0.6927513, 0, 0, 0, 1, 1,
-1.115534, 0.3871365, 1.251935, 0, 0, 0, 1, 1,
-1.108545, 0.3719262, -1.200373, 0, 0, 0, 1, 1,
-1.104744, -0.1688964, -2.558063, 0, 0, 0, 1, 1,
-1.101982, 1.008346, -0.4147729, 0, 0, 0, 1, 1,
-1.090578, -0.5394077, -3.283919, 0, 0, 0, 1, 1,
-1.086678, -1.31903, -3.008377, 1, 1, 1, 1, 1,
-1.077741, 0.7326062, 0.1461902, 1, 1, 1, 1, 1,
-1.064092, -0.2573006, -2.011232, 1, 1, 1, 1, 1,
-1.063907, 0.9772787, -1.220004, 1, 1, 1, 1, 1,
-1.062624, 1.18516, -1.785191, 1, 1, 1, 1, 1,
-1.061544, -2.795587, -3.610213, 1, 1, 1, 1, 1,
-1.054642, 0.5567909, 0.5935274, 1, 1, 1, 1, 1,
-1.050802, -0.1240096, -1.368987, 1, 1, 1, 1, 1,
-1.05042, -0.6909642, -2.0602, 1, 1, 1, 1, 1,
-1.050377, -0.894182, -3.253456, 1, 1, 1, 1, 1,
-1.049652, -0.06308823, -3.531255, 1, 1, 1, 1, 1,
-1.046092, -2.23184, -2.969523, 1, 1, 1, 1, 1,
-1.040246, 0.1261643, -3.304543, 1, 1, 1, 1, 1,
-1.036484, 2.406102, -0.4087982, 1, 1, 1, 1, 1,
-1.033217, 1.734344, -1.916972, 1, 1, 1, 1, 1,
-1.031277, -0.7253275, -2.194739, 0, 0, 1, 1, 1,
-1.029076, 1.153305, -0.8821942, 1, 0, 0, 1, 1,
-1.027899, 1.504094, -1.138071, 1, 0, 0, 1, 1,
-1.019678, -0.01225623, -1.279193, 1, 0, 0, 1, 1,
-1.016658, 0.1508959, -1.228924, 1, 0, 0, 1, 1,
-1.009901, 0.7347017, -1.901494, 1, 0, 0, 1, 1,
-1.008, -0.4418985, -2.172486, 0, 0, 0, 1, 1,
-1.006924, -0.5808898, -2.185934, 0, 0, 0, 1, 1,
-1.005856, 0.6454669, -1.893895, 0, 0, 0, 1, 1,
-1.004285, 0.6867747, -2.1685, 0, 0, 0, 1, 1,
-1.002233, 0.2978277, -0.00396236, 0, 0, 0, 1, 1,
-0.9939412, 0.9810328, -0.9177687, 0, 0, 0, 1, 1,
-0.9922262, 0.1489339, -0.3209947, 0, 0, 0, 1, 1,
-0.9764683, -0.7120019, -2.818872, 1, 1, 1, 1, 1,
-0.975454, -0.9618548, -0.7130904, 1, 1, 1, 1, 1,
-0.9732558, -0.2298506, -2.735512, 1, 1, 1, 1, 1,
-0.9711493, -0.1935669, -1.333819, 1, 1, 1, 1, 1,
-0.9707474, 0.5213376, -1.376727, 1, 1, 1, 1, 1,
-0.9596224, -1.80592, -2.182823, 1, 1, 1, 1, 1,
-0.9575818, 0.6846979, 0.003289577, 1, 1, 1, 1, 1,
-0.9415697, 0.5064703, -0.9088615, 1, 1, 1, 1, 1,
-0.9385524, -0.9901041, -1.92074, 1, 1, 1, 1, 1,
-0.9362541, -0.5333684, -1.705335, 1, 1, 1, 1, 1,
-0.935572, -0.4321411, -1.324307, 1, 1, 1, 1, 1,
-0.9306372, -0.7959827, -1.533816, 1, 1, 1, 1, 1,
-0.9258339, -0.9516949, -2.83806, 1, 1, 1, 1, 1,
-0.9255066, -1.138155, -1.955932, 1, 1, 1, 1, 1,
-0.9165737, -1.612491, -4.708358, 1, 1, 1, 1, 1,
-0.9139294, -0.2827713, -2.625819, 0, 0, 1, 1, 1,
-0.9091949, -0.8985066, -2.557235, 1, 0, 0, 1, 1,
-0.8992698, 0.3215012, -2.720983, 1, 0, 0, 1, 1,
-0.8970773, -0.1294835, -0.5853396, 1, 0, 0, 1, 1,
-0.8907245, 0.01609157, -3.29871, 1, 0, 0, 1, 1,
-0.8862437, -0.4950169, -0.3176591, 1, 0, 0, 1, 1,
-0.8854589, -0.7759408, -2.578709, 0, 0, 0, 1, 1,
-0.8789072, -0.4374398, -3.791388, 0, 0, 0, 1, 1,
-0.878067, -0.9820444, -1.610725, 0, 0, 0, 1, 1,
-0.8764555, 0.1921328, -0.2731438, 0, 0, 0, 1, 1,
-0.8708473, 0.441828, -0.588918, 0, 0, 0, 1, 1,
-0.8662612, -0.01864245, -1.24392, 0, 0, 0, 1, 1,
-0.8657976, -0.8913283, -2.69814, 0, 0, 0, 1, 1,
-0.8638315, 1.006884, -1.456319, 1, 1, 1, 1, 1,
-0.8580103, -1.194592, -3.208982, 1, 1, 1, 1, 1,
-0.8535659, -0.4760183, -1.026237, 1, 1, 1, 1, 1,
-0.8490069, -0.2107497, -1.591065, 1, 1, 1, 1, 1,
-0.8472205, -0.08964577, -1.064875, 1, 1, 1, 1, 1,
-0.8399846, -0.4430008, -3.524345, 1, 1, 1, 1, 1,
-0.8392555, -0.3970967, 0.3403443, 1, 1, 1, 1, 1,
-0.8340588, 0.5957816, -2.08764, 1, 1, 1, 1, 1,
-0.8332174, -0.7273137, -0.3652592, 1, 1, 1, 1, 1,
-0.8292819, -2.038447, -1.86885, 1, 1, 1, 1, 1,
-0.825894, -0.2550446, -2.021536, 1, 1, 1, 1, 1,
-0.8239318, 0.8775442, -1.809097, 1, 1, 1, 1, 1,
-0.8135051, 1.612881, -0.4909967, 1, 1, 1, 1, 1,
-0.8118907, -0.604946, -0.2555573, 1, 1, 1, 1, 1,
-0.8092483, -1.049207, -3.099491, 1, 1, 1, 1, 1,
-0.8069222, 0.5459937, -1.481083, 0, 0, 1, 1, 1,
-0.8053572, -0.5882959, -2.357291, 1, 0, 0, 1, 1,
-0.8050944, -0.8570039, -1.482965, 1, 0, 0, 1, 1,
-0.8039751, -0.4304127, -1.684979, 1, 0, 0, 1, 1,
-0.7986592, 1.127102, 0.5264149, 1, 0, 0, 1, 1,
-0.7889149, -1.427985, 0.132439, 1, 0, 0, 1, 1,
-0.7877719, -0.9397289, -3.055672, 0, 0, 0, 1, 1,
-0.7845017, -0.05867382, -2.44423, 0, 0, 0, 1, 1,
-0.7819726, 0.5278677, -1.50843, 0, 0, 0, 1, 1,
-0.7815635, -0.2506687, -3.141055, 0, 0, 0, 1, 1,
-0.7777377, -0.5060458, -3.743023, 0, 0, 0, 1, 1,
-0.7776062, -0.4617316, -3.085618, 0, 0, 0, 1, 1,
-0.7775503, -0.01032872, -1.776543, 0, 0, 0, 1, 1,
-0.7729184, 0.1673363, -3.097533, 1, 1, 1, 1, 1,
-0.7724026, 1.097062, 1.321357, 1, 1, 1, 1, 1,
-0.7720491, 1.313002, -1.397249, 1, 1, 1, 1, 1,
-0.7719952, -1.321827, -4.192563, 1, 1, 1, 1, 1,
-0.7688714, 0.6920469, 0.4226426, 1, 1, 1, 1, 1,
-0.7686215, -1.599781, -2.651466, 1, 1, 1, 1, 1,
-0.7683597, 0.7760221, 0.4296993, 1, 1, 1, 1, 1,
-0.7668016, -0.3530576, -2.447008, 1, 1, 1, 1, 1,
-0.7655551, -0.3853905, -2.14013, 1, 1, 1, 1, 1,
-0.7629713, 0.814837, 0.002751613, 1, 1, 1, 1, 1,
-0.7608306, -0.7131757, -1.433001, 1, 1, 1, 1, 1,
-0.760783, -0.4210362, -1.928636, 1, 1, 1, 1, 1,
-0.7579421, 1.101312, 0.3032053, 1, 1, 1, 1, 1,
-0.7574018, -0.2317572, -0.7409184, 1, 1, 1, 1, 1,
-0.7543095, 1.266143, -1.478505, 1, 1, 1, 1, 1,
-0.7493923, -0.5407985, -3.849925, 0, 0, 1, 1, 1,
-0.7383064, 0.237271, -3.351179, 1, 0, 0, 1, 1,
-0.7361969, -0.9828943, -2.3052, 1, 0, 0, 1, 1,
-0.7356794, -0.8276618, -3.982023, 1, 0, 0, 1, 1,
-0.733944, -0.07910872, -2.617506, 1, 0, 0, 1, 1,
-0.7330398, -0.5026293, -1.227132, 1, 0, 0, 1, 1,
-0.7290431, -1.275875, -1.920254, 0, 0, 0, 1, 1,
-0.7208629, 0.5620164, -0.3492459, 0, 0, 0, 1, 1,
-0.7188736, 2.31369, 0.5599753, 0, 0, 0, 1, 1,
-0.716999, -0.4032709, -1.666272, 0, 0, 0, 1, 1,
-0.7122189, -0.6832108, -1.439371, 0, 0, 0, 1, 1,
-0.7114694, 0.00283702, -2.520947, 0, 0, 0, 1, 1,
-0.7069529, -0.4128919, -1.092382, 0, 0, 0, 1, 1,
-0.7003714, -0.5092013, -1.679645, 1, 1, 1, 1, 1,
-0.6992394, -0.6180176, -2.115136, 1, 1, 1, 1, 1,
-0.6962053, -0.6300615, -1.889329, 1, 1, 1, 1, 1,
-0.6944119, 3.300598, 0.3613529, 1, 1, 1, 1, 1,
-0.6895623, -0.6855602, -3.539031, 1, 1, 1, 1, 1,
-0.6861069, -0.1415835, -0.9178175, 1, 1, 1, 1, 1,
-0.6805697, 2.27055, 0.7155864, 1, 1, 1, 1, 1,
-0.6767439, -0.2595291, -1.599924, 1, 1, 1, 1, 1,
-0.675281, -2.103156, -3.98471, 1, 1, 1, 1, 1,
-0.6718667, 0.6901814, -0.08351616, 1, 1, 1, 1, 1,
-0.6679015, -1.059403, -1.345059, 1, 1, 1, 1, 1,
-0.6675314, 0.7978842, -1.30036, 1, 1, 1, 1, 1,
-0.6656504, -0.05041946, -2.157678, 1, 1, 1, 1, 1,
-0.6638237, -0.01656985, -2.025529, 1, 1, 1, 1, 1,
-0.662499, 0.4685542, -0.3418818, 1, 1, 1, 1, 1,
-0.6615608, -1.485112, -4.247867, 0, 0, 1, 1, 1,
-0.6602426, 0.2638146, -2.672689, 1, 0, 0, 1, 1,
-0.6524011, -0.05314293, -0.5138052, 1, 0, 0, 1, 1,
-0.6521338, 0.2516972, 0.3514198, 1, 0, 0, 1, 1,
-0.6520895, 1.718887, -1.744915, 1, 0, 0, 1, 1,
-0.6502082, -1.263185, -2.070427, 1, 0, 0, 1, 1,
-0.6437415, 1.180062, 0.1515146, 0, 0, 0, 1, 1,
-0.639535, 1.82232, -0.2122748, 0, 0, 0, 1, 1,
-0.6378356, 1.464262, 0.1381912, 0, 0, 0, 1, 1,
-0.6304144, -0.8836318, -3.848224, 0, 0, 0, 1, 1,
-0.6246547, -0.5207353, -1.830336, 0, 0, 0, 1, 1,
-0.6194368, 0.2126315, -2.559896, 0, 0, 0, 1, 1,
-0.6189519, 1.001444, -0.6059402, 0, 0, 0, 1, 1,
-0.6114259, 0.8481904, -0.902976, 1, 1, 1, 1, 1,
-0.6112983, -0.8203312, -0.8432054, 1, 1, 1, 1, 1,
-0.6047517, -2.348578, -2.272439, 1, 1, 1, 1, 1,
-0.6015045, -1.844998, -2.317405, 1, 1, 1, 1, 1,
-0.6014897, -0.6232098, -1.959829, 1, 1, 1, 1, 1,
-0.59496, 0.4015163, -1.456451, 1, 1, 1, 1, 1,
-0.5902341, -1.613342, -4.165249, 1, 1, 1, 1, 1,
-0.5888194, 2.439966, -0.7600462, 1, 1, 1, 1, 1,
-0.5812594, 0.01358224, -0.7049903, 1, 1, 1, 1, 1,
-0.5758994, 0.6271124, 1.34555, 1, 1, 1, 1, 1,
-0.5736979, -1.016093, -2.717963, 1, 1, 1, 1, 1,
-0.5722671, -0.9215332, -3.481805, 1, 1, 1, 1, 1,
-0.5720805, -0.2118592, -0.8317248, 1, 1, 1, 1, 1,
-0.571141, -1.311132, -2.899812, 1, 1, 1, 1, 1,
-0.5699143, -0.001573246, -3.248057, 1, 1, 1, 1, 1,
-0.5675919, -0.6073427, -1.194508, 0, 0, 1, 1, 1,
-0.5659016, 1.046697, -1.908291, 1, 0, 0, 1, 1,
-0.562529, 1.097721, -0.2443164, 1, 0, 0, 1, 1,
-0.5618464, 0.6807455, -0.608214, 1, 0, 0, 1, 1,
-0.5591341, 0.7518407, -1.293784, 1, 0, 0, 1, 1,
-0.5583036, 0.8788413, -0.841024, 1, 0, 0, 1, 1,
-0.5570419, -1.340869, -3.268032, 0, 0, 0, 1, 1,
-0.5523537, 0.6339158, 0.2724049, 0, 0, 0, 1, 1,
-0.5486895, -0.8535467, -1.776919, 0, 0, 0, 1, 1,
-0.5474858, 1.710999, -0.06329196, 0, 0, 0, 1, 1,
-0.5351654, -0.3840185, -2.350908, 0, 0, 0, 1, 1,
-0.5334601, -1.205124, -1.763698, 0, 0, 0, 1, 1,
-0.5334079, -0.4069778, -2.795579, 0, 0, 0, 1, 1,
-0.5327959, -0.8073911, -2.371356, 1, 1, 1, 1, 1,
-0.5283928, 1.529449, -0.385466, 1, 1, 1, 1, 1,
-0.5195944, -1.063162, -3.414634, 1, 1, 1, 1, 1,
-0.5137435, -2.123217, -3.035141, 1, 1, 1, 1, 1,
-0.5096013, 0.138739, -0.3136893, 1, 1, 1, 1, 1,
-0.5079733, 1.798689, -0.5348994, 1, 1, 1, 1, 1,
-0.5001754, 0.5580089, -0.6281858, 1, 1, 1, 1, 1,
-0.4990048, 1.396977, -0.495701, 1, 1, 1, 1, 1,
-0.495796, -0.5739391, -1.593389, 1, 1, 1, 1, 1,
-0.4921792, 0.5149543, -1.28853, 1, 1, 1, 1, 1,
-0.4920002, -0.1818484, -1.592237, 1, 1, 1, 1, 1,
-0.4914076, -0.8636189, -3.704995, 1, 1, 1, 1, 1,
-0.4828164, 0.5092166, -1.081515, 1, 1, 1, 1, 1,
-0.482054, 0.5061522, -2.536802, 1, 1, 1, 1, 1,
-0.4811962, -0.465122, -2.359235, 1, 1, 1, 1, 1,
-0.4802065, 0.5094414, -1.537792, 0, 0, 1, 1, 1,
-0.4800854, -0.7609867, -1.52413, 1, 0, 0, 1, 1,
-0.4798875, -0.2477276, -2.757298, 1, 0, 0, 1, 1,
-0.4773911, -1.536986, -2.787826, 1, 0, 0, 1, 1,
-0.4766636, -1.120728, -3.44731, 1, 0, 0, 1, 1,
-0.4752722, -0.8837574, -3.739465, 1, 0, 0, 1, 1,
-0.474141, -1.981847, -2.887452, 0, 0, 0, 1, 1,
-0.4721561, 0.8740539, 1.159027, 0, 0, 0, 1, 1,
-0.4687349, 0.2418947, -1.063923, 0, 0, 0, 1, 1,
-0.4637669, 1.969799, -0.2935134, 0, 0, 0, 1, 1,
-0.4617391, -0.7908309, -3.161791, 0, 0, 0, 1, 1,
-0.4584495, -1.733345, -1.541283, 0, 0, 0, 1, 1,
-0.457711, -1.118951, -4.126039, 0, 0, 0, 1, 1,
-0.454948, -0.9865894, -3.566545, 1, 1, 1, 1, 1,
-0.4522928, -0.100287, -2.099888, 1, 1, 1, 1, 1,
-0.4448881, -0.3421108, -1.553577, 1, 1, 1, 1, 1,
-0.4433289, -1.427488, -2.386169, 1, 1, 1, 1, 1,
-0.4326208, -1.454512, -1.458983, 1, 1, 1, 1, 1,
-0.4281313, -1.545306, -2.707015, 1, 1, 1, 1, 1,
-0.4273891, 0.8411804, -0.5771632, 1, 1, 1, 1, 1,
-0.4256581, 1.126845, -0.7493215, 1, 1, 1, 1, 1,
-0.4225824, 0.5613639, -1.019584, 1, 1, 1, 1, 1,
-0.4201496, -0.03600594, -2.641933, 1, 1, 1, 1, 1,
-0.4182796, 0.7610729, -1.536049, 1, 1, 1, 1, 1,
-0.4156334, -0.4124895, -0.8597513, 1, 1, 1, 1, 1,
-0.4126856, -0.2195197, -2.137043, 1, 1, 1, 1, 1,
-0.4096743, 0.3756755, 0.3099335, 1, 1, 1, 1, 1,
-0.4070167, 1.479702, -0.04225868, 1, 1, 1, 1, 1,
-0.4052213, 0.06492326, -0.5416805, 0, 0, 1, 1, 1,
-0.4032379, 0.7932359, 0.1748726, 1, 0, 0, 1, 1,
-0.3996235, -1.424666, -3.118138, 1, 0, 0, 1, 1,
-0.3950895, -0.2363679, -1.240132, 1, 0, 0, 1, 1,
-0.3870929, -0.2647353, -1.838386, 1, 0, 0, 1, 1,
-0.3854854, 0.7495163, 1.399647, 1, 0, 0, 1, 1,
-0.3845187, -0.8960284, -3.451945, 0, 0, 0, 1, 1,
-0.3836125, -2.438851, -4.457139, 0, 0, 0, 1, 1,
-0.3823142, -0.7414416, -1.821241, 0, 0, 0, 1, 1,
-0.3809922, -0.5757433, -1.989144, 0, 0, 0, 1, 1,
-0.3772178, 0.7854558, -0.8532377, 0, 0, 0, 1, 1,
-0.3770188, -1.194805, -0.5280781, 0, 0, 0, 1, 1,
-0.3732581, -1.141832, -0.5501732, 0, 0, 0, 1, 1,
-0.3724386, 0.7034924, 0.2246169, 1, 1, 1, 1, 1,
-0.3671954, -0.03695422, -1.919124, 1, 1, 1, 1, 1,
-0.3587731, 0.004847439, -1.273258, 1, 1, 1, 1, 1,
-0.3581063, 0.6696839, -0.1103058, 1, 1, 1, 1, 1,
-0.354844, 1.15758, -1.446937, 1, 1, 1, 1, 1,
-0.3525537, -1.620268, -1.679, 1, 1, 1, 1, 1,
-0.3499968, 0.3761597, -2.398163, 1, 1, 1, 1, 1,
-0.3391401, -0.9657063, -2.894191, 1, 1, 1, 1, 1,
-0.3375669, 0.358993, -1.134431, 1, 1, 1, 1, 1,
-0.3306425, 1.194336, 0.6440061, 1, 1, 1, 1, 1,
-0.3284117, -0.5568225, -3.454098, 1, 1, 1, 1, 1,
-0.326073, 0.1780121, -1.230002, 1, 1, 1, 1, 1,
-0.3251581, -0.5585538, -3.787776, 1, 1, 1, 1, 1,
-0.3220292, 0.6659017, -3.77376, 1, 1, 1, 1, 1,
-0.3210879, 0.2501243, -1.035685, 1, 1, 1, 1, 1,
-0.3201046, -1.408911, -2.919089, 0, 0, 1, 1, 1,
-0.3169448, -1.687035, -1.732502, 1, 0, 0, 1, 1,
-0.3094934, 1.269184, 0.3217483, 1, 0, 0, 1, 1,
-0.3035852, 0.006490231, 0.1397748, 1, 0, 0, 1, 1,
-0.30352, -0.7753645, -3.572548, 1, 0, 0, 1, 1,
-0.3034234, 0.356477, -1.218287, 1, 0, 0, 1, 1,
-0.3018789, -1.256814, -2.486927, 0, 0, 0, 1, 1,
-0.3007308, -0.4169654, -2.180077, 0, 0, 0, 1, 1,
-0.3000889, 0.6038709, 1.318313, 0, 0, 0, 1, 1,
-0.2846342, 0.8873277, -0.3761395, 0, 0, 0, 1, 1,
-0.2834675, 0.2738954, -0.8528073, 0, 0, 0, 1, 1,
-0.2748512, -0.6466413, -3.176796, 0, 0, 0, 1, 1,
-0.27466, 0.1594039, -0.909977, 0, 0, 0, 1, 1,
-0.2739272, -0.3899598, -3.226598, 1, 1, 1, 1, 1,
-0.2726418, -0.3383667, -3.170088, 1, 1, 1, 1, 1,
-0.2681486, 1.760435, 0.9292955, 1, 1, 1, 1, 1,
-0.2677937, 0.5666215, -0.4638584, 1, 1, 1, 1, 1,
-0.2669494, 0.9233589, 1.467596, 1, 1, 1, 1, 1,
-0.2651376, 0.1901838, -1.071108, 1, 1, 1, 1, 1,
-0.2638873, -0.4573336, -2.86419, 1, 1, 1, 1, 1,
-0.2599261, 0.0952073, -1.617722, 1, 1, 1, 1, 1,
-0.2552282, 0.7486666, -0.5745358, 1, 1, 1, 1, 1,
-0.2510737, -0.06054909, -2.25613, 1, 1, 1, 1, 1,
-0.2499802, -1.078261, -3.868197, 1, 1, 1, 1, 1,
-0.2472348, -0.612296, -2.419034, 1, 1, 1, 1, 1,
-0.2446692, 0.1651421, -0.5263242, 1, 1, 1, 1, 1,
-0.2443953, 1.474993, 0.8400072, 1, 1, 1, 1, 1,
-0.2387526, 1.035177, 0.06071193, 1, 1, 1, 1, 1,
-0.2371302, 0.3145824, -1.004874, 0, 0, 1, 1, 1,
-0.2293698, 1.772081, -0.09253136, 1, 0, 0, 1, 1,
-0.2216037, 2.374913, -0.9161863, 1, 0, 0, 1, 1,
-0.2168254, -0.5329435, -2.084588, 1, 0, 0, 1, 1,
-0.2166166, 0.1163544, -0.8110849, 1, 0, 0, 1, 1,
-0.2136654, 0.6605565, -0.7419758, 1, 0, 0, 1, 1,
-0.2046935, -0.1263024, -1.648766, 0, 0, 0, 1, 1,
-0.2027979, 0.06120485, -0.3590372, 0, 0, 0, 1, 1,
-0.2008666, -1.66846, -2.020665, 0, 0, 0, 1, 1,
-0.200797, -0.4899646, -1.773062, 0, 0, 0, 1, 1,
-0.199527, 0.4314059, -0.4535351, 0, 0, 0, 1, 1,
-0.1981784, 0.01710544, -1.650315, 0, 0, 0, 1, 1,
-0.1959472, -0.6264635, -3.0934, 0, 0, 0, 1, 1,
-0.1941202, 0.4755, 1.720534, 1, 1, 1, 1, 1,
-0.1911284, 0.19934, -0.8242878, 1, 1, 1, 1, 1,
-0.1886577, 0.4388369, 0.6784777, 1, 1, 1, 1, 1,
-0.1850144, -0.0711634, -1.299494, 1, 1, 1, 1, 1,
-0.18245, -0.1764193, -0.08505616, 1, 1, 1, 1, 1,
-0.1744153, 0.2837482, -0.7105668, 1, 1, 1, 1, 1,
-0.173743, 0.9495143, 0.02633687, 1, 1, 1, 1, 1,
-0.1733438, -0.4067501, -3.812094, 1, 1, 1, 1, 1,
-0.166919, 0.6748041, -1.169413, 1, 1, 1, 1, 1,
-0.1668325, 0.1617059, 0.01753435, 1, 1, 1, 1, 1,
-0.1666574, -0.9019645, -3.68663, 1, 1, 1, 1, 1,
-0.1660032, 0.6229925, -0.00073176, 1, 1, 1, 1, 1,
-0.1653856, 0.3847474, -1.083993, 1, 1, 1, 1, 1,
-0.1649169, 1.681312, 0.2586905, 1, 1, 1, 1, 1,
-0.163226, 1.605528, -1.141722, 1, 1, 1, 1, 1,
-0.1626103, 0.7469841, -0.7650387, 0, 0, 1, 1, 1,
-0.1600631, 0.9630754, 0.5227666, 1, 0, 0, 1, 1,
-0.1577529, 0.1155613, -0.955879, 1, 0, 0, 1, 1,
-0.1569201, 0.01243918, -1.997457, 1, 0, 0, 1, 1,
-0.1525236, 0.3300134, -1.423266, 1, 0, 0, 1, 1,
-0.1500141, 0.2938317, -0.3697802, 1, 0, 0, 1, 1,
-0.1499318, -0.8510308, -2.744915, 0, 0, 0, 1, 1,
-0.1446204, 0.5503016, -2.76314, 0, 0, 0, 1, 1,
-0.1416828, -0.02131005, -2.177466, 0, 0, 0, 1, 1,
-0.1396576, -1.158892, -2.901965, 0, 0, 0, 1, 1,
-0.1383796, 1.289506, -0.5429784, 0, 0, 0, 1, 1,
-0.1367434, -0.9664108, -1.34165, 0, 0, 0, 1, 1,
-0.1360349, -0.7848864, -3.004041, 0, 0, 0, 1, 1,
-0.1209437, 1.76709, -0.7110894, 1, 1, 1, 1, 1,
-0.1192024, -1.219347, -3.946029, 1, 1, 1, 1, 1,
-0.1189101, -0.02128213, -0.6876559, 1, 1, 1, 1, 1,
-0.1168696, -0.09166567, -2.336727, 1, 1, 1, 1, 1,
-0.1142462, -0.2866393, -2.684434, 1, 1, 1, 1, 1,
-0.113126, -0.4670959, -3.336862, 1, 1, 1, 1, 1,
-0.1094117, -0.1760669, -2.584234, 1, 1, 1, 1, 1,
-0.1056829, 0.6653759, -0.970031, 1, 1, 1, 1, 1,
-0.1035905, 0.1278527, -1.607101, 1, 1, 1, 1, 1,
-0.1024299, -1.355845, -2.906581, 1, 1, 1, 1, 1,
-0.09935237, -0.6826779, -2.780564, 1, 1, 1, 1, 1,
-0.09703588, -1.340939, -1.950921, 1, 1, 1, 1, 1,
-0.0948074, -0.622632, -3.636266, 1, 1, 1, 1, 1,
-0.09460779, -0.06152686, -3.250618, 1, 1, 1, 1, 1,
-0.09382185, 0.4326868, -0.5022996, 1, 1, 1, 1, 1,
-0.08805835, -0.6278954, -3.194562, 0, 0, 1, 1, 1,
-0.08711643, -0.4291876, -2.422762, 1, 0, 0, 1, 1,
-0.08296215, -0.7900714, -2.549349, 1, 0, 0, 1, 1,
-0.08062927, -0.04957235, -3.778765, 1, 0, 0, 1, 1,
-0.07930562, 1.613294, 0.08338279, 1, 0, 0, 1, 1,
-0.07738103, -0.6241881, -4.070793, 1, 0, 0, 1, 1,
-0.07491248, 0.4023339, 1.476275, 0, 0, 0, 1, 1,
-0.07144882, -0.6501778, -2.872421, 0, 0, 0, 1, 1,
-0.07116046, -0.7929084, -2.586592, 0, 0, 0, 1, 1,
-0.07096808, 0.6093429, 1.392387, 0, 0, 0, 1, 1,
-0.06830911, -0.3657181, -3.296191, 0, 0, 0, 1, 1,
-0.06302902, -0.05445191, -1.283484, 0, 0, 0, 1, 1,
-0.06214999, -2.389318, -3.215164, 0, 0, 0, 1, 1,
-0.05690286, -1.899848, -1.434546, 1, 1, 1, 1, 1,
-0.05294817, 0.3693539, 0.2710749, 1, 1, 1, 1, 1,
-0.05058433, 0.8294934, 1.198586, 1, 1, 1, 1, 1,
-0.04401124, -0.3350021, -1.917497, 1, 1, 1, 1, 1,
-0.0401063, 0.08828137, -1.007296, 1, 1, 1, 1, 1,
-0.04004212, -0.4327795, -2.436022, 1, 1, 1, 1, 1,
-0.03959205, 0.5817303, 0.1544817, 1, 1, 1, 1, 1,
-0.03954988, -1.131557, -4.836604, 1, 1, 1, 1, 1,
-0.03759518, -0.48917, -3.684976, 1, 1, 1, 1, 1,
-0.037184, -0.004497993, -1.735289, 1, 1, 1, 1, 1,
-0.03429778, 0.05249124, 0.009561802, 1, 1, 1, 1, 1,
-0.02706072, 2.021692, 2.208185, 1, 1, 1, 1, 1,
-0.02550057, -0.348495, -2.637644, 1, 1, 1, 1, 1,
-0.02358813, 1.872023, -1.918787, 1, 1, 1, 1, 1,
-0.02224207, -0.411349, -3.208157, 1, 1, 1, 1, 1,
-0.02062821, -0.6146969, -4.059724, 0, 0, 1, 1, 1,
-0.01936978, -1.328447, -2.5894, 1, 0, 0, 1, 1,
-0.01871674, 0.1346269, -0.9838765, 1, 0, 0, 1, 1,
-0.0181757, -0.03306442, -3.426476, 1, 0, 0, 1, 1,
-0.01717798, -0.4651988, -3.043734, 1, 0, 0, 1, 1,
-0.01523243, 0.9271153, 0.143015, 1, 0, 0, 1, 1,
-0.0124979, 0.4380563, -0.8344233, 0, 0, 0, 1, 1,
-0.01199057, 1.565611, 0.384563, 0, 0, 0, 1, 1,
-0.01044012, 2.042917, 0.4757881, 0, 0, 0, 1, 1,
-0.009075073, -0.1345459, -4.659866, 0, 0, 0, 1, 1,
-0.008872021, -0.7681665, -2.598679, 0, 0, 0, 1, 1,
-0.004883486, -0.6656938, -3.692836, 0, 0, 0, 1, 1,
-0.00361024, -1.172714, -1.338574, 0, 0, 0, 1, 1,
-0.001882563, 1.067972, -0.1707206, 1, 1, 1, 1, 1,
0.004498649, 0.1121993, 0.6718576, 1, 1, 1, 1, 1,
0.01038532, -1.012568, 1.801459, 1, 1, 1, 1, 1,
0.01104446, -0.2305899, 5.17745, 1, 1, 1, 1, 1,
0.01296597, 0.3412017, -0.8116974, 1, 1, 1, 1, 1,
0.01531069, -0.380635, 2.301843, 1, 1, 1, 1, 1,
0.02112049, -1.961893, 1.13427, 1, 1, 1, 1, 1,
0.02274684, -0.6808214, 2.892381, 1, 1, 1, 1, 1,
0.02688605, 0.9439551, -0.09986018, 1, 1, 1, 1, 1,
0.03111806, -1.111998, 3.740024, 1, 1, 1, 1, 1,
0.03270599, 0.1627338, -0.139615, 1, 1, 1, 1, 1,
0.03381173, -1.101758, 3.620133, 1, 1, 1, 1, 1,
0.03874646, 0.812184, 1.15567, 1, 1, 1, 1, 1,
0.04142933, 0.6466766, -0.9246747, 1, 1, 1, 1, 1,
0.04601807, -1.697232, 3.916296, 1, 1, 1, 1, 1,
0.0475415, 1.443432, -0.57669, 0, 0, 1, 1, 1,
0.05400702, -0.6435603, 2.410758, 1, 0, 0, 1, 1,
0.05553813, -1.719136, 4.067049, 1, 0, 0, 1, 1,
0.05577648, 0.5950913, -1.051645, 1, 0, 0, 1, 1,
0.05594722, -2.198971, 3.12629, 1, 0, 0, 1, 1,
0.06009037, -0.5367976, 2.564106, 1, 0, 0, 1, 1,
0.06245102, -0.9180819, 3.836413, 0, 0, 0, 1, 1,
0.06437344, -0.5659541, 2.066889, 0, 0, 0, 1, 1,
0.07515015, 0.7776476, -0.7307587, 0, 0, 0, 1, 1,
0.07558128, -1.003696, 4.185066, 0, 0, 0, 1, 1,
0.07734546, 0.8536258, -0.615008, 0, 0, 0, 1, 1,
0.08324317, -1.518122, 3.353271, 0, 0, 0, 1, 1,
0.08426269, 0.9997279, 0.2927818, 0, 0, 0, 1, 1,
0.08625332, 2.029558, 0.3559168, 1, 1, 1, 1, 1,
0.0863499, 0.920909, 0.347428, 1, 1, 1, 1, 1,
0.08641279, 2.09019, -1.132945, 1, 1, 1, 1, 1,
0.08766896, -1.048716, 2.713025, 1, 1, 1, 1, 1,
0.08785921, -0.1082625, 1.841712, 1, 1, 1, 1, 1,
0.09404411, 0.2817071, 1.353523, 1, 1, 1, 1, 1,
0.09454475, -1.1745, 2.724057, 1, 1, 1, 1, 1,
0.09480421, -0.7891269, 2.984818, 1, 1, 1, 1, 1,
0.09780528, 1.047, -0.3266661, 1, 1, 1, 1, 1,
0.09845207, 0.700636, -0.7418869, 1, 1, 1, 1, 1,
0.09896505, 0.6928701, 0.9097658, 1, 1, 1, 1, 1,
0.0992488, -0.4138624, 1.344828, 1, 1, 1, 1, 1,
0.1007113, 1.267614, -1.022097, 1, 1, 1, 1, 1,
0.1051901, 0.2939376, -1.789954, 1, 1, 1, 1, 1,
0.1072602, 1.629869, 1.107144, 1, 1, 1, 1, 1,
0.1104398, -0.8806304, 2.857281, 0, 0, 1, 1, 1,
0.1107601, 0.8408237, -1.334947, 1, 0, 0, 1, 1,
0.1108819, -0.2685317, 1.566802, 1, 0, 0, 1, 1,
0.112112, -0.8961585, 2.164693, 1, 0, 0, 1, 1,
0.1122535, 2.325745, -1.200131, 1, 0, 0, 1, 1,
0.1155831, 2.230473, -0.5814838, 1, 0, 0, 1, 1,
0.1156439, -1.481504, 3.414521, 0, 0, 0, 1, 1,
0.1168497, -0.251812, 3.965743, 0, 0, 0, 1, 1,
0.1170192, 1.997071, 0.03492493, 0, 0, 0, 1, 1,
0.1174042, 0.3703014, 0.2686924, 0, 0, 0, 1, 1,
0.119446, 1.488405, -0.7983759, 0, 0, 0, 1, 1,
0.1198899, -1.219096, 4.399866, 0, 0, 0, 1, 1,
0.1269893, -0.5055323, 2.827301, 0, 0, 0, 1, 1,
0.1317498, 0.7509049, 0.161534, 1, 1, 1, 1, 1,
0.1403159, 0.9323444, -0.6374881, 1, 1, 1, 1, 1,
0.1429175, 0.1553735, -0.5449057, 1, 1, 1, 1, 1,
0.1429221, 1.582984, -0.5725821, 1, 1, 1, 1, 1,
0.1476715, 1.019859, -1.18628, 1, 1, 1, 1, 1,
0.149914, -0.6768634, 2.349564, 1, 1, 1, 1, 1,
0.1502325, 0.2529802, -2.20908, 1, 1, 1, 1, 1,
0.1528451, 2.037027, 0.1816691, 1, 1, 1, 1, 1,
0.1545515, -1.151364, 2.680987, 1, 1, 1, 1, 1,
0.1605996, -0.568786, 3.12698, 1, 1, 1, 1, 1,
0.1615822, 0.06668586, 0.4509717, 1, 1, 1, 1, 1,
0.1668597, -0.04299642, 2.437631, 1, 1, 1, 1, 1,
0.1669667, -1.563168, 2.736181, 1, 1, 1, 1, 1,
0.1674207, -0.5852267, 1.948107, 1, 1, 1, 1, 1,
0.1686472, 0.3340486, 0.1004212, 1, 1, 1, 1, 1,
0.1691732, -1.059112, 1.882329, 0, 0, 1, 1, 1,
0.176692, -0.03952452, 1.371453, 1, 0, 0, 1, 1,
0.1768795, -0.9384461, 1.460445, 1, 0, 0, 1, 1,
0.1774444, 1.487939, 0.9582448, 1, 0, 0, 1, 1,
0.1789919, -1.543679, 2.867345, 1, 0, 0, 1, 1,
0.1801038, 0.5321798, 0.1373841, 1, 0, 0, 1, 1,
0.1803717, -0.9311191, 3.36171, 0, 0, 0, 1, 1,
0.1845711, -1.836094, 1.938057, 0, 0, 0, 1, 1,
0.1869651, -1.808912, 1.866397, 0, 0, 0, 1, 1,
0.1929378, 1.050297, 0.1399186, 0, 0, 0, 1, 1,
0.1937589, -0.3972025, 2.278547, 0, 0, 0, 1, 1,
0.1949327, 0.7194415, 1.73426, 0, 0, 0, 1, 1,
0.194985, -0.4944509, 2.690311, 0, 0, 0, 1, 1,
0.198747, -0.2078486, 0.5910761, 1, 1, 1, 1, 1,
0.2012296, 0.08329258, 2.136694, 1, 1, 1, 1, 1,
0.202766, -0.3927737, 3.846895, 1, 1, 1, 1, 1,
0.2065209, -0.1142593, 2.406605, 1, 1, 1, 1, 1,
0.2082556, 0.361816, 0.8766977, 1, 1, 1, 1, 1,
0.2091647, -0.7053362, 3.27053, 1, 1, 1, 1, 1,
0.2127169, -0.3119529, 3.043127, 1, 1, 1, 1, 1,
0.2154833, 0.4987596, -1.53474, 1, 1, 1, 1, 1,
0.216791, 0.2014994, 1.329972, 1, 1, 1, 1, 1,
0.219619, 0.6534309, 0.2970606, 1, 1, 1, 1, 1,
0.2240372, 2.27854, -0.9361315, 1, 1, 1, 1, 1,
0.2250242, 2.213695, -0.6485308, 1, 1, 1, 1, 1,
0.2269161, 0.5375295, 1.301973, 1, 1, 1, 1, 1,
0.2346516, 0.4164377, 0.8209683, 1, 1, 1, 1, 1,
0.2404823, 1.298883, 0.6993513, 1, 1, 1, 1, 1,
0.242412, 0.0748698, 2.681424, 0, 0, 1, 1, 1,
0.244287, -0.3986361, 4.072709, 1, 0, 0, 1, 1,
0.2506421, 0.2221623, 2.571003, 1, 0, 0, 1, 1,
0.2507066, -1.197325, 3.973152, 1, 0, 0, 1, 1,
0.25114, -0.2745582, 3.744054, 1, 0, 0, 1, 1,
0.2566323, 0.5835048, 1.306795, 1, 0, 0, 1, 1,
0.2594154, 0.9503981, 0.8587855, 0, 0, 0, 1, 1,
0.2598997, 0.7836491, -0.2964705, 0, 0, 0, 1, 1,
0.2621599, -0.2115523, 1.953011, 0, 0, 0, 1, 1,
0.2641054, -0.4778707, 3.586994, 0, 0, 0, 1, 1,
0.2674308, 2.394152, -1.987811, 0, 0, 0, 1, 1,
0.2695383, -0.4692661, 3.354819, 0, 0, 0, 1, 1,
0.2707685, -0.7961971, 1.604475, 0, 0, 0, 1, 1,
0.2902875, 1.050409, 1.828225, 1, 1, 1, 1, 1,
0.2910426, -0.08669201, 1.027297, 1, 1, 1, 1, 1,
0.2956406, 0.1569882, -2.16224, 1, 1, 1, 1, 1,
0.2958783, 0.07575136, 2.102748, 1, 1, 1, 1, 1,
0.298393, 1.644549, 0.9913853, 1, 1, 1, 1, 1,
0.2988601, 1.215007, 0.3812719, 1, 1, 1, 1, 1,
0.3002616, -0.0889625, 3.082969, 1, 1, 1, 1, 1,
0.3016947, -1.40435, 2.758443, 1, 1, 1, 1, 1,
0.3020173, -0.07234839, 2.059184, 1, 1, 1, 1, 1,
0.3020175, -1.659011, 2.820161, 1, 1, 1, 1, 1,
0.3154897, 0.8013957, 1.213709, 1, 1, 1, 1, 1,
0.3172068, -1.799623, 1.842446, 1, 1, 1, 1, 1,
0.3195209, -1.377105, 1.755079, 1, 1, 1, 1, 1,
0.3198796, -2.401892, 3.798679, 1, 1, 1, 1, 1,
0.3218512, -0.4329967, 1.652582, 1, 1, 1, 1, 1,
0.3221781, 0.293592, 1.84225, 0, 0, 1, 1, 1,
0.3255426, -0.1218067, 0.7167099, 1, 0, 0, 1, 1,
0.3259685, 0.9608263, 1.71413, 1, 0, 0, 1, 1,
0.3284697, 0.4971031, 0.1536795, 1, 0, 0, 1, 1,
0.3321521, -0.2606869, 2.653332, 1, 0, 0, 1, 1,
0.3328275, 1.363187, 0.5935106, 1, 0, 0, 1, 1,
0.334023, 1.975968, -0.4916672, 0, 0, 0, 1, 1,
0.3341913, -0.1816528, 1.264862, 0, 0, 0, 1, 1,
0.3355041, -0.394328, 1.279535, 0, 0, 0, 1, 1,
0.3363109, -0.5301644, 2.284125, 0, 0, 0, 1, 1,
0.3387528, 0.4478194, 0.453597, 0, 0, 0, 1, 1,
0.3398198, 1.401036, 1.927687, 0, 0, 0, 1, 1,
0.3412288, 0.06129178, -0.2132214, 0, 0, 0, 1, 1,
0.3458526, 0.1661089, -0.753661, 1, 1, 1, 1, 1,
0.349696, 0.6819349, 1.274702, 1, 1, 1, 1, 1,
0.3519893, -1.03921, 3.607863, 1, 1, 1, 1, 1,
0.3528524, 0.5873625, 1.605514, 1, 1, 1, 1, 1,
0.3563762, 1.839062, -0.3124907, 1, 1, 1, 1, 1,
0.3568916, -1.617164, 3.88205, 1, 1, 1, 1, 1,
0.3598561, -0.2662742, 3.554112, 1, 1, 1, 1, 1,
0.362023, -0.1540812, 3.086663, 1, 1, 1, 1, 1,
0.3620566, 1.088228, 0.5370628, 1, 1, 1, 1, 1,
0.3673694, 1.752993, -0.1242137, 1, 1, 1, 1, 1,
0.3695073, 0.0004527742, 3.733164, 1, 1, 1, 1, 1,
0.3701358, 0.5213963, 0.9484379, 1, 1, 1, 1, 1,
0.3719509, 1.156912, 0.5455771, 1, 1, 1, 1, 1,
0.372306, 0.8855555, 0.8896365, 1, 1, 1, 1, 1,
0.3743207, -0.7803506, 4.503051, 1, 1, 1, 1, 1,
0.3747529, 0.5562956, 0.3867817, 0, 0, 1, 1, 1,
0.3816587, 0.469681, 1.794277, 1, 0, 0, 1, 1,
0.3819702, 0.4276702, 1.291113, 1, 0, 0, 1, 1,
0.3825314, 0.7915784, 0.5606527, 1, 0, 0, 1, 1,
0.3856693, 0.6884618, 1.942326, 1, 0, 0, 1, 1,
0.3935383, 0.04424785, 0.8754579, 1, 0, 0, 1, 1,
0.3940355, -0.29218, 2.645731, 0, 0, 0, 1, 1,
0.3940731, 0.5969627, -0.7591082, 0, 0, 0, 1, 1,
0.3946359, -0.6171974, 4.149288, 0, 0, 0, 1, 1,
0.3957135, 1.434724, 0.5757629, 0, 0, 0, 1, 1,
0.3972295, -0.9618939, 2.88066, 0, 0, 0, 1, 1,
0.3986665, -0.6401918, 1.572353, 0, 0, 0, 1, 1,
0.400699, -1.233268, 2.702091, 0, 0, 0, 1, 1,
0.4024574, -1.068882, 3.519238, 1, 1, 1, 1, 1,
0.4069425, -0.09817067, 3.172099, 1, 1, 1, 1, 1,
0.4115431, 0.9957256, -0.2121757, 1, 1, 1, 1, 1,
0.4117449, 0.384354, 0.7264899, 1, 1, 1, 1, 1,
0.4119399, -0.3750107, 3.520075, 1, 1, 1, 1, 1,
0.4166861, 0.4661661, 0.2003426, 1, 1, 1, 1, 1,
0.4167067, 1.677409, -1.872255, 1, 1, 1, 1, 1,
0.4170913, 0.7043946, 1.432266, 1, 1, 1, 1, 1,
0.4210091, 0.09128892, 0.2477105, 1, 1, 1, 1, 1,
0.4272835, -1.376575, 3.599755, 1, 1, 1, 1, 1,
0.4291079, -0.6991161, 4.017825, 1, 1, 1, 1, 1,
0.4315535, -0.7783261, 4.427901, 1, 1, 1, 1, 1,
0.4324074, -1.073469, 3.19873, 1, 1, 1, 1, 1,
0.4331874, 0.7114031, -0.3496573, 1, 1, 1, 1, 1,
0.4349717, -0.7660705, 3.346665, 1, 1, 1, 1, 1,
0.4390702, 0.9523268, -0.3122606, 0, 0, 1, 1, 1,
0.4402576, 1.286457, 2.048357, 1, 0, 0, 1, 1,
0.4410194, 0.588607, 1.631066, 1, 0, 0, 1, 1,
0.44329, -0.9394397, 0.9718113, 1, 0, 0, 1, 1,
0.4433561, -0.8820916, 2.543584, 1, 0, 0, 1, 1,
0.4449255, 1.306121, 0.9520578, 1, 0, 0, 1, 1,
0.4479888, 1.042481, 0.6862083, 0, 0, 0, 1, 1,
0.4529659, -0.745362, 2.528026, 0, 0, 0, 1, 1,
0.454605, 0.241165, 0.1003268, 0, 0, 0, 1, 1,
0.4560574, -0.5246558, 2.570284, 0, 0, 0, 1, 1,
0.4567226, 1.80864, -1.421656, 0, 0, 0, 1, 1,
0.4573787, 1.000177, 1.282841, 0, 0, 0, 1, 1,
0.4602493, 0.9645182, 0.7276218, 0, 0, 0, 1, 1,
0.4626765, -0.6660777, 0.4069219, 1, 1, 1, 1, 1,
0.4638661, 1.563893, 0.7393397, 1, 1, 1, 1, 1,
0.4687662, -0.06344076, 1.5712, 1, 1, 1, 1, 1,
0.4696951, 0.5040967, 0.570947, 1, 1, 1, 1, 1,
0.4783904, -0.3442601, 0.2584747, 1, 1, 1, 1, 1,
0.4797659, -0.04358967, 2.156788, 1, 1, 1, 1, 1,
0.4808096, -0.4917588, 4.321115, 1, 1, 1, 1, 1,
0.4848881, 0.1725765, 1.488706, 1, 1, 1, 1, 1,
0.4890035, 0.01296556, 2.345047, 1, 1, 1, 1, 1,
0.4923343, -0.5060142, 3.874529, 1, 1, 1, 1, 1,
0.4938126, -0.9937122, 3.652846, 1, 1, 1, 1, 1,
0.500096, 0.9116203, -0.02937039, 1, 1, 1, 1, 1,
0.5046413, -0.3039076, 0.9470468, 1, 1, 1, 1, 1,
0.5062364, 0.7488834, 2.157347, 1, 1, 1, 1, 1,
0.5084668, -0.553993, 2.267019, 1, 1, 1, 1, 1,
0.513154, 2.067387, -0.7965844, 0, 0, 1, 1, 1,
0.5159985, -0.2281657, 3.244152, 1, 0, 0, 1, 1,
0.5191849, 0.902836, 0.4393216, 1, 0, 0, 1, 1,
0.5223439, 1.342176, 0.5114808, 1, 0, 0, 1, 1,
0.5264904, -0.2962694, 2.950563, 1, 0, 0, 1, 1,
0.5271336, 0.821147, 1.769842, 1, 0, 0, 1, 1,
0.5353253, -0.6459467, 2.472997, 0, 0, 0, 1, 1,
0.5415545, -0.1702126, 1.812126, 0, 0, 0, 1, 1,
0.5489324, -0.8593053, 4.069256, 0, 0, 0, 1, 1,
0.5496156, -0.1447792, 2.506342, 0, 0, 0, 1, 1,
0.5566712, -1.123316, 3.678153, 0, 0, 0, 1, 1,
0.5574135, 1.55409, -0.2122949, 0, 0, 0, 1, 1,
0.5585696, 0.5168324, 3.362111, 0, 0, 0, 1, 1,
0.5594109, -0.03991537, 1.476453, 1, 1, 1, 1, 1,
0.560961, 1.400363, 0.6322759, 1, 1, 1, 1, 1,
0.571453, -0.9459179, 2.634976, 1, 1, 1, 1, 1,
0.5725543, -0.3395203, 2.521195, 1, 1, 1, 1, 1,
0.5744473, -0.3723547, 2.574668, 1, 1, 1, 1, 1,
0.5773542, 1.496833, -0.01497202, 1, 1, 1, 1, 1,
0.5809158, 1.639699, -1.578897, 1, 1, 1, 1, 1,
0.583542, -0.2294794, 2.19188, 1, 1, 1, 1, 1,
0.5891014, -0.3275994, 1.804638, 1, 1, 1, 1, 1,
0.5924079, -0.3304565, 2.720545, 1, 1, 1, 1, 1,
0.5945331, -0.03076421, 0.3871252, 1, 1, 1, 1, 1,
0.5951353, 1.740931, 0.8789929, 1, 1, 1, 1, 1,
0.6010067, 0.1155695, 2.073319, 1, 1, 1, 1, 1,
0.6020501, 0.4256686, 1.862073, 1, 1, 1, 1, 1,
0.6035243, 1.103249, 1.100356, 1, 1, 1, 1, 1,
0.6063922, 0.9888497, 2.724123, 0, 0, 1, 1, 1,
0.6086667, -1.18473, 3.914546, 1, 0, 0, 1, 1,
0.6114303, 0.0007880692, 1.96858, 1, 0, 0, 1, 1,
0.6170513, 1.581657, 0.6783384, 1, 0, 0, 1, 1,
0.6203311, 0.04894188, 0.7300031, 1, 0, 0, 1, 1,
0.6252188, 1.936863, 0.8749881, 1, 0, 0, 1, 1,
0.6302024, 2.072914, -0.1980766, 0, 0, 0, 1, 1,
0.6312222, 1.009019, 1.42779, 0, 0, 0, 1, 1,
0.6362689, 1.050016, -0.120715, 0, 0, 0, 1, 1,
0.6382046, -0.2653831, 1.696795, 0, 0, 0, 1, 1,
0.6435462, -0.3353254, 3.142928, 0, 0, 0, 1, 1,
0.6441144, 1.023401, -1.04796, 0, 0, 0, 1, 1,
0.6446518, -0.7029297, 1.914685, 0, 0, 0, 1, 1,
0.6508156, -1.176781, 2.642163, 1, 1, 1, 1, 1,
0.6534618, -1.499237, 2.678783, 1, 1, 1, 1, 1,
0.6577486, 0.4395198, 1.264931, 1, 1, 1, 1, 1,
0.6607463, 0.03179312, 2.739796, 1, 1, 1, 1, 1,
0.6726136, -0.1116875, 2.79118, 1, 1, 1, 1, 1,
0.6736824, -0.4464474, 1.716998, 1, 1, 1, 1, 1,
0.6768215, -0.2109727, 0.2865363, 1, 1, 1, 1, 1,
0.6847102, -0.6733704, 2.634055, 1, 1, 1, 1, 1,
0.6863579, -0.3037952, 1.197502, 1, 1, 1, 1, 1,
0.6873878, -0.1413194, 2.472647, 1, 1, 1, 1, 1,
0.6880716, 1.008208, -0.5271578, 1, 1, 1, 1, 1,
0.691099, -0.3928702, 2.693041, 1, 1, 1, 1, 1,
0.6947291, -1.178168, 2.578616, 1, 1, 1, 1, 1,
0.6952312, 0.1236464, 1.887894, 1, 1, 1, 1, 1,
0.6976777, -0.7337095, 1.794026, 1, 1, 1, 1, 1,
0.6996738, -0.1903688, 1.855168, 0, 0, 1, 1, 1,
0.7029567, -1.531276, 1.660648, 1, 0, 0, 1, 1,
0.7053003, 0.2028167, 1.194625, 1, 0, 0, 1, 1,
0.710697, -0.2304256, 2.918572, 1, 0, 0, 1, 1,
0.7136021, -1.983872, 0.9860619, 1, 0, 0, 1, 1,
0.7142961, 1.291423, 0.3542715, 1, 0, 0, 1, 1,
0.7166528, 1.034169, -0.5273114, 0, 0, 0, 1, 1,
0.7176987, 0.2545148, 0.3642079, 0, 0, 0, 1, 1,
0.7184198, -1.669881, 2.896027, 0, 0, 0, 1, 1,
0.719477, -0.03729543, 2.324447, 0, 0, 0, 1, 1,
0.7218247, 0.1340615, 3.062248, 0, 0, 0, 1, 1,
0.7224292, -0.4769359, 1.913445, 0, 0, 0, 1, 1,
0.7245851, 0.9179271, 4.143599, 0, 0, 0, 1, 1,
0.7247542, 0.7901759, 0.7259406, 1, 1, 1, 1, 1,
0.7279126, -0.001964702, 1.164145, 1, 1, 1, 1, 1,
0.7390165, 0.7369814, 2.17478, 1, 1, 1, 1, 1,
0.7442825, 0.6884322, 1.245908, 1, 1, 1, 1, 1,
0.7451574, -1.647921, 0.167942, 1, 1, 1, 1, 1,
0.7484488, 0.01788509, 2.570469, 1, 1, 1, 1, 1,
0.748472, 0.230397, -1.716861, 1, 1, 1, 1, 1,
0.7504404, 0.6929247, 0.8567926, 1, 1, 1, 1, 1,
0.7589604, -0.7213962, 1.540578, 1, 1, 1, 1, 1,
0.7602995, 0.05696631, 2.414372, 1, 1, 1, 1, 1,
0.7615196, 0.5340672, -0.3722183, 1, 1, 1, 1, 1,
0.7710028, 2.336535, 1.099793, 1, 1, 1, 1, 1,
0.7718346, 1.214352, 1.085185, 1, 1, 1, 1, 1,
0.7737325, 0.3668114, 2.153535, 1, 1, 1, 1, 1,
0.7761567, 0.07072178, 0.9411135, 1, 1, 1, 1, 1,
0.780332, 0.179459, 2.886659, 0, 0, 1, 1, 1,
0.7816746, -0.9828702, 2.590409, 1, 0, 0, 1, 1,
0.7851582, -0.03782969, 0.5043752, 1, 0, 0, 1, 1,
0.7871359, -0.2145708, 1.788875, 1, 0, 0, 1, 1,
0.7887312, -0.6961287, 1.879744, 1, 0, 0, 1, 1,
0.80553, 0.113854, 1.576762, 1, 0, 0, 1, 1,
0.8108447, -0.1258386, 2.145713, 0, 0, 0, 1, 1,
0.8146756, 0.4346571, -0.4300995, 0, 0, 0, 1, 1,
0.819086, 1.744185, 0.9566915, 0, 0, 0, 1, 1,
0.8211059, 0.4599883, 0.2846614, 0, 0, 0, 1, 1,
0.8331038, 0.07706364, 0.08484285, 0, 0, 0, 1, 1,
0.8350351, 0.5201493, -0.218964, 0, 0, 0, 1, 1,
0.8378303, -1.354, 2.113714, 0, 0, 0, 1, 1,
0.8477783, 0.1178335, 1.411404, 1, 1, 1, 1, 1,
0.8568353, -0.8712397, 0.6978548, 1, 1, 1, 1, 1,
0.8584843, -0.2972241, 1.70261, 1, 1, 1, 1, 1,
0.8586515, -0.7399527, 1.427334, 1, 1, 1, 1, 1,
0.8600445, 0.8117306, 1.213476, 1, 1, 1, 1, 1,
0.8666912, 0.6180342, 0.5300667, 1, 1, 1, 1, 1,
0.8674539, -1.343372, 3.770595, 1, 1, 1, 1, 1,
0.875393, 0.1124008, 2.150945, 1, 1, 1, 1, 1,
0.8764494, 0.01181717, 1.868194, 1, 1, 1, 1, 1,
0.8802481, -0.0601173, 1.164104, 1, 1, 1, 1, 1,
0.8824943, -0.6386458, 3.366886, 1, 1, 1, 1, 1,
0.8907263, -0.3451457, 1.18635, 1, 1, 1, 1, 1,
0.8941197, 0.5770382, -0.6044453, 1, 1, 1, 1, 1,
0.8970762, 0.9299263, 1.672131, 1, 1, 1, 1, 1,
0.89793, -0.2254944, 2.823188, 1, 1, 1, 1, 1,
0.9050482, 0.3839443, -0.4950092, 0, 0, 1, 1, 1,
0.9093199, 1.207185, 0.09363098, 1, 0, 0, 1, 1,
0.9123544, 0.3482231, 0.02369078, 1, 0, 0, 1, 1,
0.9187092, -0.8129054, 4.056304, 1, 0, 0, 1, 1,
0.9199864, -0.446853, 2.174941, 1, 0, 0, 1, 1,
0.9254873, 1.910483, 0.002479267, 1, 0, 0, 1, 1,
0.9281749, 0.8522868, 1.514894, 0, 0, 0, 1, 1,
0.9329443, -0.08876558, 1.890481, 0, 0, 0, 1, 1,
0.936743, -0.1894672, 2.395937, 0, 0, 0, 1, 1,
0.9481572, -0.05644469, 2.603895, 0, 0, 0, 1, 1,
0.9517016, 0.6189163, 0.1989595, 0, 0, 0, 1, 1,
0.9543208, -1.405349, 3.252922, 0, 0, 0, 1, 1,
0.9634064, -0.3127133, 4.061109, 0, 0, 0, 1, 1,
0.9690353, -0.6174807, 2.372498, 1, 1, 1, 1, 1,
0.9699473, 0.03901482, 0.6806994, 1, 1, 1, 1, 1,
0.9706094, -0.697249, 3.656201, 1, 1, 1, 1, 1,
0.9729803, -0.02599399, -0.177788, 1, 1, 1, 1, 1,
0.9732753, -0.3707801, 0.9657035, 1, 1, 1, 1, 1,
0.9830768, -0.7957121, 1.599555, 1, 1, 1, 1, 1,
0.9851387, 0.411094, 1.372363, 1, 1, 1, 1, 1,
0.9869775, 1.395729, -1.690045, 1, 1, 1, 1, 1,
0.9871913, -0.5254559, 2.629617, 1, 1, 1, 1, 1,
0.9917527, -1.405547, 1.683163, 1, 1, 1, 1, 1,
0.9918885, -1.046575, 2.436175, 1, 1, 1, 1, 1,
0.9920448, 1.909949, 1.020946, 1, 1, 1, 1, 1,
0.9937676, 0.3664795, -0.07069832, 1, 1, 1, 1, 1,
0.995938, 1.340312, 2.142602, 1, 1, 1, 1, 1,
0.9959465, 0.9116889, 2.367633, 1, 1, 1, 1, 1,
0.9962205, -0.2717579, 2.367418, 0, 0, 1, 1, 1,
0.9995803, 1.247935, 2.025017, 1, 0, 0, 1, 1,
0.9997596, -0.6196445, 1.999931, 1, 0, 0, 1, 1,
1.00061, -0.6718243, 1.672148, 1, 0, 0, 1, 1,
1.000896, -0.7048463, 1.885436, 1, 0, 0, 1, 1,
1.00144, -0.1540968, 1.042267, 1, 0, 0, 1, 1,
1.002496, 0.1933018, 1.297726, 0, 0, 0, 1, 1,
1.008836, 0.05074621, 1.168347, 0, 0, 0, 1, 1,
1.01006, -0.2995363, 2.308213, 0, 0, 0, 1, 1,
1.01676, -0.008008706, 1.807563, 0, 0, 0, 1, 1,
1.021979, 0.4988433, 0.7593383, 0, 0, 0, 1, 1,
1.022207, -1.820336, 2.981386, 0, 0, 0, 1, 1,
1.030255, -0.9994658, 0.49415, 0, 0, 0, 1, 1,
1.030954, -0.765827, 1.847137, 1, 1, 1, 1, 1,
1.036269, 0.4262873, -0.3826593, 1, 1, 1, 1, 1,
1.036526, 3.006793, 0.7929578, 1, 1, 1, 1, 1,
1.04501, -0.6347687, 1.07496, 1, 1, 1, 1, 1,
1.047635, 0.2311035, 1.61062, 1, 1, 1, 1, 1,
1.049677, -0.7163538, 0.5655144, 1, 1, 1, 1, 1,
1.064686, 2.014082, -1.461079, 1, 1, 1, 1, 1,
1.071937, -1.035642, 3.034102, 1, 1, 1, 1, 1,
1.075113, 0.9250295, 1.114301, 1, 1, 1, 1, 1,
1.075536, -1.271597, 1.462172, 1, 1, 1, 1, 1,
1.085056, -1.292752, 1.368308, 1, 1, 1, 1, 1,
1.085459, 0.4134, 0.193776, 1, 1, 1, 1, 1,
1.094537, 0.9698895, 2.152366, 1, 1, 1, 1, 1,
1.096771, 0.7400527, 0.1590594, 1, 1, 1, 1, 1,
1.097664, 0.1979985, 0.3025586, 1, 1, 1, 1, 1,
1.099282, 0.8692391, 0.1571225, 0, 0, 1, 1, 1,
1.101457, 0.2233747, 1.307851, 1, 0, 0, 1, 1,
1.102033, -0.05401978, 3.579551, 1, 0, 0, 1, 1,
1.106496, 1.034188, -0.2884641, 1, 0, 0, 1, 1,
1.109953, 0.03679992, 3.263408, 1, 0, 0, 1, 1,
1.118192, -1.086252, 2.437203, 1, 0, 0, 1, 1,
1.144132, 1.614915, 0.07140071, 0, 0, 0, 1, 1,
1.153664, 0.3710816, 0.8425874, 0, 0, 0, 1, 1,
1.154959, 0.748956, 1.975944, 0, 0, 0, 1, 1,
1.156912, 0.5833024, 2.025974, 0, 0, 0, 1, 1,
1.159386, -0.8468509, 3.766215, 0, 0, 0, 1, 1,
1.16012, -2.263865, 4.461714, 0, 0, 0, 1, 1,
1.168739, -2.015, 4.2286, 0, 0, 0, 1, 1,
1.171541, 0.5186448, 0.2033047, 1, 1, 1, 1, 1,
1.173641, 1.509587, 1.420376, 1, 1, 1, 1, 1,
1.178749, 0.9068676, 1.022792, 1, 1, 1, 1, 1,
1.194086, -0.09905694, 2.550338, 1, 1, 1, 1, 1,
1.194393, -0.973911, 2.215544, 1, 1, 1, 1, 1,
1.208478, -0.4981525, 1.341404, 1, 1, 1, 1, 1,
1.214945, -0.6839629, 0.1958033, 1, 1, 1, 1, 1,
1.217451, -0.08324053, 2.932526, 1, 1, 1, 1, 1,
1.222121, -1.056385, 1.029658, 1, 1, 1, 1, 1,
1.237055, 0.8671315, -0.1102709, 1, 1, 1, 1, 1,
1.239558, 1.044585, 2.25131, 1, 1, 1, 1, 1,
1.239609, -1.714766, 3.59307, 1, 1, 1, 1, 1,
1.244926, -0.3118619, 1.324314, 1, 1, 1, 1, 1,
1.245351, -2.377356, 1.204907, 1, 1, 1, 1, 1,
1.251267, 0.4916652, 1.434486, 1, 1, 1, 1, 1,
1.280338, -1.218385, 2.745848, 0, 0, 1, 1, 1,
1.288815, -1.857117, 4.255786, 1, 0, 0, 1, 1,
1.289426, 0.9605684, 1.757898, 1, 0, 0, 1, 1,
1.298178, 0.855956, 0.935541, 1, 0, 0, 1, 1,
1.3072, -0.5351034, 3.439066, 1, 0, 0, 1, 1,
1.307523, 0.5778462, 0.9788135, 1, 0, 0, 1, 1,
1.308418, 1.263134, 0.4721774, 0, 0, 0, 1, 1,
1.310269, -0.6430681, 1.078943, 0, 0, 0, 1, 1,
1.32356, -0.3807323, 1.661759, 0, 0, 0, 1, 1,
1.325682, -1.278368, 3.379131, 0, 0, 0, 1, 1,
1.326669, 0.4351248, 3.079518, 0, 0, 0, 1, 1,
1.329816, -0.6441578, 0.8350276, 0, 0, 0, 1, 1,
1.343654, 0.8805144, 1.63442, 0, 0, 0, 1, 1,
1.349091, 1.171163, 0.9958935, 1, 1, 1, 1, 1,
1.354506, 0.06090028, 2.238867, 1, 1, 1, 1, 1,
1.358498, 1.613877, 0.1432736, 1, 1, 1, 1, 1,
1.364979, -0.9714337, 3.488263, 1, 1, 1, 1, 1,
1.365919, 0.645223, 2.65806, 1, 1, 1, 1, 1,
1.373081, -0.8344468, 2.558122, 1, 1, 1, 1, 1,
1.376107, -0.4827445, 1.237611, 1, 1, 1, 1, 1,
1.417793, 1.756151, -1.101912, 1, 1, 1, 1, 1,
1.422412, 0.3567184, 2.346486, 1, 1, 1, 1, 1,
1.426431, -0.7866753, 2.072071, 1, 1, 1, 1, 1,
1.427322, 0.6751739, 0.7639478, 1, 1, 1, 1, 1,
1.430303, -0.9146007, 4.029254, 1, 1, 1, 1, 1,
1.437634, 0.9383108, 1.263356, 1, 1, 1, 1, 1,
1.438548, 0.01725299, 1.878818, 1, 1, 1, 1, 1,
1.444598, -0.4090368, 1.793223, 1, 1, 1, 1, 1,
1.477537, 0.9099635, 0.8004134, 0, 0, 1, 1, 1,
1.48302, -0.4322194, 2.001175, 1, 0, 0, 1, 1,
1.487571, 1.257525, 0.1466958, 1, 0, 0, 1, 1,
1.488275, 0.1250787, 1.859484, 1, 0, 0, 1, 1,
1.489072, 0.1485522, 1.022687, 1, 0, 0, 1, 1,
1.499448, -0.8761356, 3.417056, 1, 0, 0, 1, 1,
1.502736, -1.846497, 2.648596, 0, 0, 0, 1, 1,
1.52352, -0.2030686, 1.995215, 0, 0, 0, 1, 1,
1.52697, 0.06199692, 0.96009, 0, 0, 0, 1, 1,
1.534971, -0.5321342, 1.270445, 0, 0, 0, 1, 1,
1.543686, 0.4101828, 0.1179102, 0, 0, 0, 1, 1,
1.545972, -0.2214194, 0.9103411, 0, 0, 0, 1, 1,
1.548767, -0.7866431, 1.849049, 0, 0, 0, 1, 1,
1.553805, 0.04120824, 1.429186, 1, 1, 1, 1, 1,
1.559117, -0.9676605, 2.359321, 1, 1, 1, 1, 1,
1.563652, -0.5871763, 1.624421, 1, 1, 1, 1, 1,
1.58048, -0.07516886, 0.7142307, 1, 1, 1, 1, 1,
1.588392, -0.3651231, 1.743412, 1, 1, 1, 1, 1,
1.595801, 0.5149247, 0.8346447, 1, 1, 1, 1, 1,
1.606424, 0.3212044, 1.362102, 1, 1, 1, 1, 1,
1.625796, -0.904632, 1.72758, 1, 1, 1, 1, 1,
1.631442, -0.3657195, 1.752904, 1, 1, 1, 1, 1,
1.63548, -0.6323402, 3.011719, 1, 1, 1, 1, 1,
1.646592, -0.3521498, 2.783663, 1, 1, 1, 1, 1,
1.659057, -0.3284911, 1.104994, 1, 1, 1, 1, 1,
1.664292, -0.9839851, 0.9143699, 1, 1, 1, 1, 1,
1.706096, 0.469444, 1.090496, 1, 1, 1, 1, 1,
1.709841, 1.224805, 0.6716141, 1, 1, 1, 1, 1,
1.714058, -2.125975, 0.8809351, 0, 0, 1, 1, 1,
1.715375, -0.9497073, 2.361363, 1, 0, 0, 1, 1,
1.71819, -0.1349507, 1.463214, 1, 0, 0, 1, 1,
1.719744, 2.08581, 0.5076047, 1, 0, 0, 1, 1,
1.733564, -0.684701, 0.5873747, 1, 0, 0, 1, 1,
1.736013, -0.4570876, 2.288701, 1, 0, 0, 1, 1,
1.741212, 0.5410513, 1.111549, 0, 0, 0, 1, 1,
1.751734, -1.282935, 2.376564, 0, 0, 0, 1, 1,
1.763179, 0.2408058, 1.288053, 0, 0, 0, 1, 1,
1.764525, 0.2325435, 2.35817, 0, 0, 0, 1, 1,
1.766795, -0.2609314, 0.7717183, 0, 0, 0, 1, 1,
1.773732, 0.9799321, -0.5135416, 0, 0, 0, 1, 1,
1.787374, 1.314647, 0.3078259, 0, 0, 0, 1, 1,
1.813994, 1.393445, 0.4441197, 1, 1, 1, 1, 1,
1.821011, -0.488374, 3.374184, 1, 1, 1, 1, 1,
1.830809, -1.216536, 0.9931274, 1, 1, 1, 1, 1,
1.835673, 0.6532531, 0.3903206, 1, 1, 1, 1, 1,
1.846135, 1.58489, 0.5572365, 1, 1, 1, 1, 1,
1.849611, 0.4110572, 0.6305528, 1, 1, 1, 1, 1,
1.892333, -1.388208, 0.6220474, 1, 1, 1, 1, 1,
1.909868, 0.1230105, 0.8630518, 1, 1, 1, 1, 1,
1.917235, 0.6642315, 1.470304, 1, 1, 1, 1, 1,
1.929245, 1.735802, 1.218617, 1, 1, 1, 1, 1,
1.956433, 0.2532257, 1.9037, 1, 1, 1, 1, 1,
1.957592, 1.067758, 0.8627942, 1, 1, 1, 1, 1,
1.983127, 1.54466, 0.8140309, 1, 1, 1, 1, 1,
1.984651, 0.0523767, 1.134324, 1, 1, 1, 1, 1,
2.010653, -0.4056764, 0.6379862, 1, 1, 1, 1, 1,
2.013866, 0.8098853, 1.358814, 0, 0, 1, 1, 1,
2.016547, 1.738729, 1.58735, 1, 0, 0, 1, 1,
2.027624, 0.3101904, 1.077717, 1, 0, 0, 1, 1,
2.030675, 1.100259, 0.29769, 1, 0, 0, 1, 1,
2.04156, 0.5613561, 0.1393761, 1, 0, 0, 1, 1,
2.094695, -0.7568068, 2.374058, 1, 0, 0, 1, 1,
2.128123, 0.9537908, 0.9889683, 0, 0, 0, 1, 1,
2.20776, -0.2025776, 1.782814, 0, 0, 0, 1, 1,
2.224045, 0.3219079, -1.206976, 0, 0, 0, 1, 1,
2.231372, -0.9539002, 1.997948, 0, 0, 0, 1, 1,
2.248024, -0.6068394, 1.534419, 0, 0, 0, 1, 1,
2.25537, 1.643145, 1.687104, 0, 0, 0, 1, 1,
2.308327, -2.719599, 2.610711, 0, 0, 0, 1, 1,
2.343954, -0.6489692, 2.531361, 1, 1, 1, 1, 1,
2.376388, 0.1068828, 3.562593, 1, 1, 1, 1, 1,
2.471061, -0.5320279, 1.311958, 1, 1, 1, 1, 1,
2.634919, 1.1413, 2.09857, 1, 1, 1, 1, 1,
2.880344, 0.1388657, 1.34793, 1, 1, 1, 1, 1,
2.955086, 0.05483869, 2.501721, 1, 1, 1, 1, 1,
3.267318, 1.172, 1.153238, 1, 1, 1, 1, 1
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
var radius = 9.224368;
var distance = 32.4002;
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
mvMatrix.translate( -0.04238677, -0.2525054, -0.170423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.4002);
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
