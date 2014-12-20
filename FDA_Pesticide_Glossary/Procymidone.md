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
-3.418193, 0.2652184, -2.440662, 1, 0, 0, 1,
-2.727083, -0.9156031, -0.4984579, 1, 0.007843138, 0, 1,
-2.52845, 0.6822715, -1.482389, 1, 0.01176471, 0, 1,
-2.496662, 0.03963398, -1.565427, 1, 0.01960784, 0, 1,
-2.479483, 1.010703, -0.3739326, 1, 0.02352941, 0, 1,
-2.424899, -1.585449, -1.285312, 1, 0.03137255, 0, 1,
-2.42471, 0.5109364, -1.250215, 1, 0.03529412, 0, 1,
-2.319733, -0.2473278, -1.08713, 1, 0.04313726, 0, 1,
-2.302184, 1.673878, -1.067237, 1, 0.04705882, 0, 1,
-2.299151, -1.655616, -0.5355853, 1, 0.05490196, 0, 1,
-2.274454, -0.02590231, -2.125582, 1, 0.05882353, 0, 1,
-2.242047, 1.374008, -0.487731, 1, 0.06666667, 0, 1,
-2.232178, -1.534438, -2.547945, 1, 0.07058824, 0, 1,
-2.1864, -1.411116, -2.633388, 1, 0.07843138, 0, 1,
-2.118813, -0.3213304, -1.732085, 1, 0.08235294, 0, 1,
-2.112733, -0.9696354, -2.057847, 1, 0.09019608, 0, 1,
-2.111498, 0.8878679, -1.355925, 1, 0.09411765, 0, 1,
-2.074434, -1.838761, -1.188352, 1, 0.1019608, 0, 1,
-2.011912, 0.09607708, -0.8099498, 1, 0.1098039, 0, 1,
-2.002249, 1.212204, -1.708387, 1, 0.1137255, 0, 1,
-1.979054, -1.525588, -5.127346, 1, 0.1215686, 0, 1,
-1.975125, -1.689427, -3.795792, 1, 0.1254902, 0, 1,
-1.969819, -0.8897718, -3.267501, 1, 0.1333333, 0, 1,
-1.937308, 0.1183828, -1.551328, 1, 0.1372549, 0, 1,
-1.906727, -0.8067905, -2.198532, 1, 0.145098, 0, 1,
-1.895355, -0.7703364, -1.956134, 1, 0.1490196, 0, 1,
-1.872267, 0.07853482, -2.200471, 1, 0.1568628, 0, 1,
-1.856656, -1.213678, -1.919291, 1, 0.1607843, 0, 1,
-1.836533, -1.077278, -3.223666, 1, 0.1686275, 0, 1,
-1.824057, -0.3771466, -2.382368, 1, 0.172549, 0, 1,
-1.795465, -1.024652, -0.04986288, 1, 0.1803922, 0, 1,
-1.78766, -0.2458319, -1.263841, 1, 0.1843137, 0, 1,
-1.775693, -1.059612, -1.201716, 1, 0.1921569, 0, 1,
-1.766929, -0.9883948, -3.265944, 1, 0.1960784, 0, 1,
-1.75483, 1.179762, -1.297659, 1, 0.2039216, 0, 1,
-1.753628, 0.745689, -0.6068186, 1, 0.2117647, 0, 1,
-1.747087, 0.5354, -1.104188, 1, 0.2156863, 0, 1,
-1.72905, 0.2846119, 0.5966853, 1, 0.2235294, 0, 1,
-1.724079, -0.9583452, -2.975457, 1, 0.227451, 0, 1,
-1.703966, 0.3297283, -2.745776, 1, 0.2352941, 0, 1,
-1.702129, -0.8010868, -1.521047, 1, 0.2392157, 0, 1,
-1.68519, -1.591492, -0.7853082, 1, 0.2470588, 0, 1,
-1.671918, -0.5487116, -1.95748, 1, 0.2509804, 0, 1,
-1.667641, 0.3585267, -2.343537, 1, 0.2588235, 0, 1,
-1.655544, 1.567687, -1.078683, 1, 0.2627451, 0, 1,
-1.611714, -1.270049, -2.509629, 1, 0.2705882, 0, 1,
-1.607667, 0.9147441, -0.8008758, 1, 0.2745098, 0, 1,
-1.585011, 0.9442897, 0.4712465, 1, 0.282353, 0, 1,
-1.580605, 0.3260833, -2.774558, 1, 0.2862745, 0, 1,
-1.572155, 1.116406, 0.2134424, 1, 0.2941177, 0, 1,
-1.569728, -0.4261779, -2.104547, 1, 0.3019608, 0, 1,
-1.558498, -0.09931666, -1.788103, 1, 0.3058824, 0, 1,
-1.548634, 0.7117469, 1.800616, 1, 0.3137255, 0, 1,
-1.533673, -0.5744225, -1.6308, 1, 0.3176471, 0, 1,
-1.525933, 1.10494, -0.6359289, 1, 0.3254902, 0, 1,
-1.523032, -1.105712, -0.9775789, 1, 0.3294118, 0, 1,
-1.522141, -1.742945, -3.06408, 1, 0.3372549, 0, 1,
-1.515889, -1.262604, -1.818329, 1, 0.3411765, 0, 1,
-1.508449, 0.4990169, -0.6127036, 1, 0.3490196, 0, 1,
-1.506961, 0.1509459, -1.209593, 1, 0.3529412, 0, 1,
-1.506842, -0.2632822, -2.437769, 1, 0.3607843, 0, 1,
-1.497194, -1.098804, -0.7974256, 1, 0.3647059, 0, 1,
-1.487909, 0.1144792, -3.702249, 1, 0.372549, 0, 1,
-1.480767, 1.714209, 0.1113738, 1, 0.3764706, 0, 1,
-1.435104, 0.5762373, -2.586888, 1, 0.3843137, 0, 1,
-1.428995, 0.08508966, -1.361278, 1, 0.3882353, 0, 1,
-1.427504, -0.0199612, -1.454509, 1, 0.3960784, 0, 1,
-1.423079, -1.405852, -2.451063, 1, 0.4039216, 0, 1,
-1.421653, -0.9494153, -1.63785, 1, 0.4078431, 0, 1,
-1.420148, -1.499386, -0.3407964, 1, 0.4156863, 0, 1,
-1.417718, 0.8385513, -0.5809826, 1, 0.4196078, 0, 1,
-1.416627, 1.472829, -0.4895715, 1, 0.427451, 0, 1,
-1.414974, 0.1309846, -0.4604736, 1, 0.4313726, 0, 1,
-1.404053, 1.404648, -3.090731, 1, 0.4392157, 0, 1,
-1.398795, -0.06041121, -2.619924, 1, 0.4431373, 0, 1,
-1.391549, -0.1822085, -0.5526751, 1, 0.4509804, 0, 1,
-1.389105, 0.2397857, -2.228694, 1, 0.454902, 0, 1,
-1.384115, -0.3424511, -3.155018, 1, 0.4627451, 0, 1,
-1.382112, 0.8426585, 0.6467338, 1, 0.4666667, 0, 1,
-1.372002, -0.8218998, -1.297284, 1, 0.4745098, 0, 1,
-1.368011, -0.9291627, -1.955409, 1, 0.4784314, 0, 1,
-1.367728, -0.2606618, -1.312936, 1, 0.4862745, 0, 1,
-1.362006, 0.08281951, -2.677125, 1, 0.4901961, 0, 1,
-1.358835, 1.710167, 0.03183193, 1, 0.4980392, 0, 1,
-1.35758, 1.770017, 0.7056825, 1, 0.5058824, 0, 1,
-1.356299, -0.1475765, -3.392599, 1, 0.509804, 0, 1,
-1.347625, 0.1577452, -1.446463, 1, 0.5176471, 0, 1,
-1.33643, -0.5877652, -0.5899324, 1, 0.5215687, 0, 1,
-1.326945, 1.276907, -0.05851753, 1, 0.5294118, 0, 1,
-1.324547, -0.4331648, -2.293697, 1, 0.5333334, 0, 1,
-1.324545, -0.7059351, -0.7896813, 1, 0.5411765, 0, 1,
-1.321909, -0.4800153, -3.178215, 1, 0.5450981, 0, 1,
-1.300977, -0.3790407, -1.731953, 1, 0.5529412, 0, 1,
-1.300439, -0.06941641, -1.494253, 1, 0.5568628, 0, 1,
-1.283292, 0.7320963, -0.01758253, 1, 0.5647059, 0, 1,
-1.281425, 0.6161529, -0.3674108, 1, 0.5686275, 0, 1,
-1.279465, -0.727726, -1.498795, 1, 0.5764706, 0, 1,
-1.263452, 1.007227, -2.453562, 1, 0.5803922, 0, 1,
-1.261965, -1.138544, -3.588455, 1, 0.5882353, 0, 1,
-1.257552, -1.537221, -1.986265, 1, 0.5921569, 0, 1,
-1.255794, -0.6534287, -2.082221, 1, 0.6, 0, 1,
-1.249194, -1.114104, -3.662693, 1, 0.6078432, 0, 1,
-1.232826, 0.07946897, -0.8364477, 1, 0.6117647, 0, 1,
-1.226697, 1.444522, -1.248761, 1, 0.6196079, 0, 1,
-1.225915, -0.8379045, -1.223076, 1, 0.6235294, 0, 1,
-1.223817, 0.4784647, -0.2047255, 1, 0.6313726, 0, 1,
-1.222341, -1.210993, -2.553499, 1, 0.6352941, 0, 1,
-1.212078, -0.6561139, -1.877009, 1, 0.6431373, 0, 1,
-1.209997, -0.3079399, -2.674885, 1, 0.6470588, 0, 1,
-1.204827, -0.8587587, -3.433885, 1, 0.654902, 0, 1,
-1.200549, 0.16703, -1.275152, 1, 0.6588235, 0, 1,
-1.1982, 0.2348348, -0.8126725, 1, 0.6666667, 0, 1,
-1.195701, 3.191507, 0.7003478, 1, 0.6705883, 0, 1,
-1.194875, 0.1977843, -3.808174, 1, 0.6784314, 0, 1,
-1.193357, 0.01663624, -2.501456, 1, 0.682353, 0, 1,
-1.184215, -0.1164337, -1.834681, 1, 0.6901961, 0, 1,
-1.184059, 1.230972, -0.7269295, 1, 0.6941177, 0, 1,
-1.183234, 0.8060421, -1.218767, 1, 0.7019608, 0, 1,
-1.182867, -0.6422382, -0.1430351, 1, 0.7098039, 0, 1,
-1.18036, 0.1862209, 0.2171305, 1, 0.7137255, 0, 1,
-1.178697, 1.959031, 1.510098, 1, 0.7215686, 0, 1,
-1.173129, 1.947308, -1.031112, 1, 0.7254902, 0, 1,
-1.160966, -0.006166239, -2.115081, 1, 0.7333333, 0, 1,
-1.156903, -1.660448, -3.719363, 1, 0.7372549, 0, 1,
-1.155607, -0.06505156, -2.155884, 1, 0.7450981, 0, 1,
-1.147922, 0.3992203, -1.755746, 1, 0.7490196, 0, 1,
-1.140569, 0.9443717, -2.685258, 1, 0.7568628, 0, 1,
-1.136882, -0.6348612, -1.144251, 1, 0.7607843, 0, 1,
-1.135664, 0.5698797, -2.114975, 1, 0.7686275, 0, 1,
-1.133491, -2.622749, -1.868881, 1, 0.772549, 0, 1,
-1.133036, 0.6909645, -0.03915264, 1, 0.7803922, 0, 1,
-1.132434, -1.278705, -1.900162, 1, 0.7843137, 0, 1,
-1.129798, 1.389784, 0.7589744, 1, 0.7921569, 0, 1,
-1.128363, -0.4776639, -3.981101, 1, 0.7960784, 0, 1,
-1.121001, 1.27061, 1.313917, 1, 0.8039216, 0, 1,
-1.120716, 1.06869, -1.470119, 1, 0.8117647, 0, 1,
-1.120488, -0.0005377508, -2.293697, 1, 0.8156863, 0, 1,
-1.119139, 0.2247129, -1.162638, 1, 0.8235294, 0, 1,
-1.114133, -0.427057, -0.9473185, 1, 0.827451, 0, 1,
-1.099275, 1.928827, 0.8868033, 1, 0.8352941, 0, 1,
-1.093583, 2.071689, -0.7828021, 1, 0.8392157, 0, 1,
-1.083535, 0.2153884, -2.749298, 1, 0.8470588, 0, 1,
-1.077496, 0.6068676, -0.7508156, 1, 0.8509804, 0, 1,
-1.07357, 1.581044, -0.2168692, 1, 0.8588235, 0, 1,
-1.072122, -1.601567, -0.6491194, 1, 0.8627451, 0, 1,
-1.069942, -0.7889616, -0.4162434, 1, 0.8705882, 0, 1,
-1.063781, 1.10259, -1.477105, 1, 0.8745098, 0, 1,
-1.061019, -0.01457862, -1.30977, 1, 0.8823529, 0, 1,
-1.060553, 1.769174, -1.878726, 1, 0.8862745, 0, 1,
-1.058166, -0.04858086, -1.958467, 1, 0.8941177, 0, 1,
-1.05175, -0.107478, -1.041246, 1, 0.8980392, 0, 1,
-1.051037, 0.1565324, -2.978953, 1, 0.9058824, 0, 1,
-1.04424, -0.06841346, -1.795131, 1, 0.9137255, 0, 1,
-1.042832, 1.295349, -0.3558737, 1, 0.9176471, 0, 1,
-1.042623, -0.3646213, -1.351909, 1, 0.9254902, 0, 1,
-1.029473, -0.6276838, -2.192506, 1, 0.9294118, 0, 1,
-1.029269, 0.4399799, -2.300139, 1, 0.9372549, 0, 1,
-1.024775, 0.7896929, -0.6540198, 1, 0.9411765, 0, 1,
-1.023608, -1.512389, -2.032907, 1, 0.9490196, 0, 1,
-1.018265, -0.8063923, -1.590483, 1, 0.9529412, 0, 1,
-1.001243, -0.8250436, -3.445521, 1, 0.9607843, 0, 1,
-1.00115, 0.3222578, 0.7978899, 1, 0.9647059, 0, 1,
-0.9908604, 1.576166, 0.9279188, 1, 0.972549, 0, 1,
-0.9893116, 0.6178709, -1.706538, 1, 0.9764706, 0, 1,
-0.9859526, -1.179129, 0.2034232, 1, 0.9843137, 0, 1,
-0.976914, 1.12541, -1.847525, 1, 0.9882353, 0, 1,
-0.9577219, -0.4174865, -1.843619, 1, 0.9960784, 0, 1,
-0.9560913, 1.219393, 0.3629305, 0.9960784, 1, 0, 1,
-0.9552533, -0.06339695, -2.920823, 0.9921569, 1, 0, 1,
-0.9498188, 2.131587, -0.1196809, 0.9843137, 1, 0, 1,
-0.9490631, -0.3140259, -1.647326, 0.9803922, 1, 0, 1,
-0.9448567, 0.2061283, -1.367072, 0.972549, 1, 0, 1,
-0.9422169, -0.4995009, -2.851212, 0.9686275, 1, 0, 1,
-0.9419433, 0.4334621, -0.9028825, 0.9607843, 1, 0, 1,
-0.9361285, -0.413005, -1.62365, 0.9568627, 1, 0, 1,
-0.9347607, 0.5674764, -0.02144763, 0.9490196, 1, 0, 1,
-0.9263184, 1.312759, -0.4534742, 0.945098, 1, 0, 1,
-0.9234405, -0.1346141, -0.8935349, 0.9372549, 1, 0, 1,
-0.9205508, 2.433579, -0.6468211, 0.9333333, 1, 0, 1,
-0.9143534, 1.506428, -0.7287532, 0.9254902, 1, 0, 1,
-0.9085874, 0.3642775, -0.8042462, 0.9215686, 1, 0, 1,
-0.9022142, -1.562123, -3.285083, 0.9137255, 1, 0, 1,
-0.9000481, -1.231388, -0.8552329, 0.9098039, 1, 0, 1,
-0.8998454, -0.6754413, -2.78539, 0.9019608, 1, 0, 1,
-0.8964289, -0.1276326, -1.750322, 0.8941177, 1, 0, 1,
-0.8939325, -0.3182821, -1.57542, 0.8901961, 1, 0, 1,
-0.8830729, 1.000264, -2.448246, 0.8823529, 1, 0, 1,
-0.88096, 1.087975, 0.2730236, 0.8784314, 1, 0, 1,
-0.8758269, 1.341247, 0.8388704, 0.8705882, 1, 0, 1,
-0.869583, 0.455146, -0.734436, 0.8666667, 1, 0, 1,
-0.868247, -0.08911652, -1.959566, 0.8588235, 1, 0, 1,
-0.8664313, 1.272189, -1.310234, 0.854902, 1, 0, 1,
-0.863786, -2.317181, -3.301555, 0.8470588, 1, 0, 1,
-0.8575959, -1.106245, -2.061539, 0.8431373, 1, 0, 1,
-0.8526445, -0.06348035, -0.7106443, 0.8352941, 1, 0, 1,
-0.8466163, 0.6988879, -0.6631565, 0.8313726, 1, 0, 1,
-0.8391711, 0.437439, 0.2741087, 0.8235294, 1, 0, 1,
-0.8376155, -0.2017814, -1.87084, 0.8196079, 1, 0, 1,
-0.8296779, -0.7834072, -2.507093, 0.8117647, 1, 0, 1,
-0.8253732, -1.034762, -1.88825, 0.8078431, 1, 0, 1,
-0.8242074, 0.6107964, -0.4309551, 0.8, 1, 0, 1,
-0.8201244, 0.410708, -1.49095, 0.7921569, 1, 0, 1,
-0.8194815, -1.442011, -3.336345, 0.7882353, 1, 0, 1,
-0.8132897, 2.004144, -1.626593, 0.7803922, 1, 0, 1,
-0.8130025, 0.09660058, -2.442894, 0.7764706, 1, 0, 1,
-0.8123504, 0.6028556, -0.03441599, 0.7686275, 1, 0, 1,
-0.8067895, 1.353267, -0.3750384, 0.7647059, 1, 0, 1,
-0.805885, 0.9288303, 0.3520361, 0.7568628, 1, 0, 1,
-0.8038676, 0.1727918, -0.9999595, 0.7529412, 1, 0, 1,
-0.8038045, -0.8775073, -1.990832, 0.7450981, 1, 0, 1,
-0.8005747, -0.5824291, -2.143919, 0.7411765, 1, 0, 1,
-0.7929202, 0.6312703, -0.3028721, 0.7333333, 1, 0, 1,
-0.7885362, 1.565489, -0.4147362, 0.7294118, 1, 0, 1,
-0.7879292, -0.1353868, -3.445438, 0.7215686, 1, 0, 1,
-0.7718566, 0.1179109, -2.770073, 0.7176471, 1, 0, 1,
-0.7652389, -0.8948509, -1.997452, 0.7098039, 1, 0, 1,
-0.7640749, -1.83873, -1.465348, 0.7058824, 1, 0, 1,
-0.7637541, 0.5465721, -2.606869, 0.6980392, 1, 0, 1,
-0.7471139, 1.751388, -0.4820364, 0.6901961, 1, 0, 1,
-0.7466027, -0.4945498, -1.157804, 0.6862745, 1, 0, 1,
-0.7456841, 1.200158, 1.171196, 0.6784314, 1, 0, 1,
-0.7415336, 0.4660464, -0.3884992, 0.6745098, 1, 0, 1,
-0.7376207, -0.04492712, 0.09301767, 0.6666667, 1, 0, 1,
-0.7364409, -1.521454, -3.854558, 0.6627451, 1, 0, 1,
-0.7355886, -2.160227, -1.704758, 0.654902, 1, 0, 1,
-0.7271581, -0.04731819, -1.235742, 0.6509804, 1, 0, 1,
-0.7229739, 1.756374, -1.288582, 0.6431373, 1, 0, 1,
-0.7224733, -0.8849465, -2.31392, 0.6392157, 1, 0, 1,
-0.7203175, 0.7332925, -1.070421, 0.6313726, 1, 0, 1,
-0.7202032, -0.5606712, -3.660204, 0.627451, 1, 0, 1,
-0.7195752, -0.1811468, -2.46378, 0.6196079, 1, 0, 1,
-0.7189293, -1.049829, -0.2710027, 0.6156863, 1, 0, 1,
-0.7113857, -0.1235341, -1.77687, 0.6078432, 1, 0, 1,
-0.7087293, 0.4369305, -1.272545, 0.6039216, 1, 0, 1,
-0.7079697, -1.103172, -0.936313, 0.5960785, 1, 0, 1,
-0.7027122, 0.08124853, -2.069406, 0.5882353, 1, 0, 1,
-0.6984931, 1.601756, 1.513334, 0.5843138, 1, 0, 1,
-0.6972587, -1.300536, -1.203016, 0.5764706, 1, 0, 1,
-0.6968077, 0.622956, -1.159215, 0.572549, 1, 0, 1,
-0.6946768, -2.535521, -3.23307, 0.5647059, 1, 0, 1,
-0.6931729, 0.1026088, -1.414306, 0.5607843, 1, 0, 1,
-0.6852406, -0.01201716, -2.21209, 0.5529412, 1, 0, 1,
-0.6825049, -1.356573, -3.700781, 0.5490196, 1, 0, 1,
-0.6775786, -0.5590033, -3.791227, 0.5411765, 1, 0, 1,
-0.6748477, -0.05657209, -0.08800986, 0.5372549, 1, 0, 1,
-0.6724985, 0.383718, -0.5590852, 0.5294118, 1, 0, 1,
-0.6724892, 1.266257, -0.2354941, 0.5254902, 1, 0, 1,
-0.6720915, 2.053427, 1.09665, 0.5176471, 1, 0, 1,
-0.669551, 0.08237205, -1.269751, 0.5137255, 1, 0, 1,
-0.6685585, -0.3811473, -1.928295, 0.5058824, 1, 0, 1,
-0.6671873, 1.296167, -1.637843, 0.5019608, 1, 0, 1,
-0.666406, -1.041244, -2.226351, 0.4941176, 1, 0, 1,
-0.6662173, -0.7843897, -2.488124, 0.4862745, 1, 0, 1,
-0.6639048, 0.03131427, -1.585291, 0.4823529, 1, 0, 1,
-0.6596409, 1.056725, -0.4327257, 0.4745098, 1, 0, 1,
-0.6563447, -1.587655, -1.510359, 0.4705882, 1, 0, 1,
-0.6507626, -0.265007, -2.946572, 0.4627451, 1, 0, 1,
-0.6463497, -0.06884286, -2.289977, 0.4588235, 1, 0, 1,
-0.6411918, 0.3550713, 0.6265869, 0.4509804, 1, 0, 1,
-0.6406138, -0.3332765, -1.929442, 0.4470588, 1, 0, 1,
-0.6396496, 1.588805, -1.154943, 0.4392157, 1, 0, 1,
-0.6377252, 0.2534598, -1.561994, 0.4352941, 1, 0, 1,
-0.6354139, -0.4378589, -3.688514, 0.427451, 1, 0, 1,
-0.6309626, 0.7071202, 0.3887572, 0.4235294, 1, 0, 1,
-0.6283092, -0.1354306, -2.325789, 0.4156863, 1, 0, 1,
-0.6271414, 0.7805337, -1.44391, 0.4117647, 1, 0, 1,
-0.6242692, -0.4583605, -3.310236, 0.4039216, 1, 0, 1,
-0.6241215, 0.1266162, -1.796064, 0.3960784, 1, 0, 1,
-0.6191071, 1.868799, 0.89245, 0.3921569, 1, 0, 1,
-0.6183783, 0.3366241, -1.29527, 0.3843137, 1, 0, 1,
-0.6161761, 1.410115, 1.658699, 0.3803922, 1, 0, 1,
-0.6148366, 1.549518, 0.3487304, 0.372549, 1, 0, 1,
-0.6147077, -1.559431, -2.758167, 0.3686275, 1, 0, 1,
-0.6125286, -1.338362, -4.521576, 0.3607843, 1, 0, 1,
-0.6109614, 1.09915, -0.3080234, 0.3568628, 1, 0, 1,
-0.6097845, 1.771068, -1.107894, 0.3490196, 1, 0, 1,
-0.6068268, 0.6747971, -0.6565, 0.345098, 1, 0, 1,
-0.5964606, -0.9683746, -3.915891, 0.3372549, 1, 0, 1,
-0.5936899, -2.351747, -0.4654557, 0.3333333, 1, 0, 1,
-0.5895447, 0.3679632, 0.178035, 0.3254902, 1, 0, 1,
-0.5884709, 1.4089, -0.9029257, 0.3215686, 1, 0, 1,
-0.5816006, 0.249441, -1.088052, 0.3137255, 1, 0, 1,
-0.5784391, -0.1185328, -2.06274, 0.3098039, 1, 0, 1,
-0.5780654, 1.076541, -1.084022, 0.3019608, 1, 0, 1,
-0.5753962, -0.8376952, -4.16443, 0.2941177, 1, 0, 1,
-0.5717109, 1.203919, -0.9221341, 0.2901961, 1, 0, 1,
-0.5708836, 1.271454, -0.4412673, 0.282353, 1, 0, 1,
-0.5702969, 0.04192676, -1.606149, 0.2784314, 1, 0, 1,
-0.5702938, -0.7115263, -3.194123, 0.2705882, 1, 0, 1,
-0.5694803, -1.764325, -1.527404, 0.2666667, 1, 0, 1,
-0.5693388, 0.5528547, -0.6696308, 0.2588235, 1, 0, 1,
-0.567051, -0.9467027, -0.8440378, 0.254902, 1, 0, 1,
-0.5644386, 0.05870559, -2.480298, 0.2470588, 1, 0, 1,
-0.5600097, -0.3257812, -2.800728, 0.2431373, 1, 0, 1,
-0.5595278, 0.1482084, -1.33687, 0.2352941, 1, 0, 1,
-0.5547218, -1.234805, -2.541451, 0.2313726, 1, 0, 1,
-0.5546783, -0.03449027, -1.627718, 0.2235294, 1, 0, 1,
-0.5533917, 0.464769, 1.114681, 0.2196078, 1, 0, 1,
-0.5521805, -0.8801725, -1.818123, 0.2117647, 1, 0, 1,
-0.5508243, 0.3763873, 0.0537537, 0.2078431, 1, 0, 1,
-0.5503615, 0.6343706, 1.081229, 0.2, 1, 0, 1,
-0.5501047, -1.095363, -4.483757, 0.1921569, 1, 0, 1,
-0.5466555, -0.6678853, -2.90543, 0.1882353, 1, 0, 1,
-0.5411909, -0.03445816, -0.7144935, 0.1803922, 1, 0, 1,
-0.5396293, -0.6476104, -1.83914, 0.1764706, 1, 0, 1,
-0.5390277, 1.075368, -0.9232181, 0.1686275, 1, 0, 1,
-0.5357554, 0.6549755, -0.004948295, 0.1647059, 1, 0, 1,
-0.5356937, -0.4659674, -1.055655, 0.1568628, 1, 0, 1,
-0.5291072, -3.374507, -4.087055, 0.1529412, 1, 0, 1,
-0.5255544, -1.1676, -1.153742, 0.145098, 1, 0, 1,
-0.5150136, 0.01925931, -1.883734, 0.1411765, 1, 0, 1,
-0.5087779, 0.06108639, -1.880031, 0.1333333, 1, 0, 1,
-0.5081547, 1.047756, 0.6712445, 0.1294118, 1, 0, 1,
-0.5035676, -0.07282535, -1.668512, 0.1215686, 1, 0, 1,
-0.5022635, 1.504327, 0.2261181, 0.1176471, 1, 0, 1,
-0.5017269, -0.7472763, -3.20371, 0.1098039, 1, 0, 1,
-0.5006549, -0.3395063, -2.612711, 0.1058824, 1, 0, 1,
-0.4995551, 0.4591684, 0.2865397, 0.09803922, 1, 0, 1,
-0.4949089, 0.3868083, -0.1243173, 0.09019608, 1, 0, 1,
-0.4915662, 0.9094034, -0.9231157, 0.08627451, 1, 0, 1,
-0.4863742, 1.527809, 0.1884727, 0.07843138, 1, 0, 1,
-0.4709543, -1.877398, -2.849647, 0.07450981, 1, 0, 1,
-0.4708505, 0.8247411, 0.06750346, 0.06666667, 1, 0, 1,
-0.4683072, 0.02031051, 0.1874679, 0.0627451, 1, 0, 1,
-0.4674999, -0.9680967, -3.117214, 0.05490196, 1, 0, 1,
-0.4636835, 2.343185, 0.5842674, 0.05098039, 1, 0, 1,
-0.4633203, -0.1694162, -4.165543, 0.04313726, 1, 0, 1,
-0.4566712, -1.947563, -3.892759, 0.03921569, 1, 0, 1,
-0.4530932, -1.486737, -2.581667, 0.03137255, 1, 0, 1,
-0.449666, 0.3862452, -1.288854, 0.02745098, 1, 0, 1,
-0.4449772, -0.6479067, -5.268227, 0.01960784, 1, 0, 1,
-0.4443241, 0.4835483, 0.6306108, 0.01568628, 1, 0, 1,
-0.4383442, 0.4276567, -0.8035748, 0.007843138, 1, 0, 1,
-0.4361427, -0.6224174, -2.852012, 0.003921569, 1, 0, 1,
-0.4357935, -0.3400958, -1.807243, 0, 1, 0.003921569, 1,
-0.4351565, -1.051306, -4.183473, 0, 1, 0.01176471, 1,
-0.4303271, 0.0904481, -2.217899, 0, 1, 0.01568628, 1,
-0.427092, 0.2230991, -0.06575548, 0, 1, 0.02352941, 1,
-0.4260283, 1.347726, 1.287708, 0, 1, 0.02745098, 1,
-0.4216755, -0.8029281, -1.735725, 0, 1, 0.03529412, 1,
-0.41499, 0.4062333, 0.7773922, 0, 1, 0.03921569, 1,
-0.4143049, 0.2659772, -1.144572, 0, 1, 0.04705882, 1,
-0.4140083, 0.6764868, -1.632243, 0, 1, 0.05098039, 1,
-0.4132255, 0.02293829, -2.670048, 0, 1, 0.05882353, 1,
-0.4076691, -0.1005682, -0.9166332, 0, 1, 0.0627451, 1,
-0.4069288, -0.6196032, -2.557871, 0, 1, 0.07058824, 1,
-0.4064037, 0.1946872, 1.693126, 0, 1, 0.07450981, 1,
-0.4032546, 0.8848488, 0.01939845, 0, 1, 0.08235294, 1,
-0.4027599, 1.353595, 0.6210969, 0, 1, 0.08627451, 1,
-0.4006066, -1.021934, -3.289671, 0, 1, 0.09411765, 1,
-0.3974452, 0.2654434, -1.16353, 0, 1, 0.1019608, 1,
-0.3884421, -0.2835198, -4.242171, 0, 1, 0.1058824, 1,
-0.3873579, 0.00366204, -0.6260981, 0, 1, 0.1137255, 1,
-0.384813, -0.1781936, -2.464203, 0, 1, 0.1176471, 1,
-0.3809443, 0.02089967, 0.9490019, 0, 1, 0.1254902, 1,
-0.3762152, 0.004662531, -2.334882, 0, 1, 0.1294118, 1,
-0.3758754, -0.155512, -2.223491, 0, 1, 0.1372549, 1,
-0.3699661, 0.2282778, -0.5228631, 0, 1, 0.1411765, 1,
-0.3667396, -0.8199983, -2.628262, 0, 1, 0.1490196, 1,
-0.3637281, 0.3502519, -2.449312, 0, 1, 0.1529412, 1,
-0.3576588, -0.2569649, -3.222832, 0, 1, 0.1607843, 1,
-0.3559362, 1.949011, -0.8679922, 0, 1, 0.1647059, 1,
-0.3533418, -0.6517835, -3.73224, 0, 1, 0.172549, 1,
-0.3526338, -0.04144567, -1.71852, 0, 1, 0.1764706, 1,
-0.3494538, 0.4776941, 0.2319864, 0, 1, 0.1843137, 1,
-0.3471934, 0.4040228, -1.722943, 0, 1, 0.1882353, 1,
-0.3464978, 1.241603, 1.122462, 0, 1, 0.1960784, 1,
-0.3433584, -0.6600348, -1.638003, 0, 1, 0.2039216, 1,
-0.3419932, -1.015949, -3.517212, 0, 1, 0.2078431, 1,
-0.3373502, 0.3842725, -1.384527, 0, 1, 0.2156863, 1,
-0.3366889, 0.5299517, -1.343182, 0, 1, 0.2196078, 1,
-0.3320301, -0.5469189, -4.146422, 0, 1, 0.227451, 1,
-0.3280609, -0.3952126, -2.485672, 0, 1, 0.2313726, 1,
-0.3208111, -1.944116, -4.395557, 0, 1, 0.2392157, 1,
-0.3164202, -0.7137519, -1.99962, 0, 1, 0.2431373, 1,
-0.316331, 0.1257237, 0.4735294, 0, 1, 0.2509804, 1,
-0.3147991, -0.7717546, -3.596799, 0, 1, 0.254902, 1,
-0.3116068, -0.737354, -3.315309, 0, 1, 0.2627451, 1,
-0.3035133, -2.107666, -1.397661, 0, 1, 0.2666667, 1,
-0.3015478, -0.01416419, -2.587605, 0, 1, 0.2745098, 1,
-0.2986251, 0.05474033, -2.345863, 0, 1, 0.2784314, 1,
-0.295577, -0.009135397, -2.90913, 0, 1, 0.2862745, 1,
-0.2953252, -0.8595541, -2.724964, 0, 1, 0.2901961, 1,
-0.2953069, 0.2189018, -0.5850298, 0, 1, 0.2980392, 1,
-0.2943826, -0.2376848, -2.879683, 0, 1, 0.3058824, 1,
-0.2930709, 0.3009485, -2.099445, 0, 1, 0.3098039, 1,
-0.2900903, -1.542885, -3.004228, 0, 1, 0.3176471, 1,
-0.2897539, 0.5732109, -0.05196711, 0, 1, 0.3215686, 1,
-0.2880959, 0.9463062, -0.6067811, 0, 1, 0.3294118, 1,
-0.2879211, 0.2393576, -3.183186, 0, 1, 0.3333333, 1,
-0.2826155, 1.591697, -0.6260365, 0, 1, 0.3411765, 1,
-0.2785259, 0.5294945, -0.2991095, 0, 1, 0.345098, 1,
-0.2715102, -0.2867997, -2.310059, 0, 1, 0.3529412, 1,
-0.2714032, 1.286653, -0.2968728, 0, 1, 0.3568628, 1,
-0.2688846, 0.242162, 0.04065886, 0, 1, 0.3647059, 1,
-0.2644273, 1.224548, 0.4158762, 0, 1, 0.3686275, 1,
-0.263225, 1.723177, -0.06601569, 0, 1, 0.3764706, 1,
-0.2627192, -0.8302425, -1.395472, 0, 1, 0.3803922, 1,
-0.2602995, -0.06223071, -3.163797, 0, 1, 0.3882353, 1,
-0.2583236, -0.2647952, -1.393847, 0, 1, 0.3921569, 1,
-0.2527454, -0.4285167, -1.679089, 0, 1, 0.4, 1,
-0.2487328, -0.2679588, -2.137265, 0, 1, 0.4078431, 1,
-0.2477405, -0.8417286, -0.186743, 0, 1, 0.4117647, 1,
-0.2438933, 0.3186531, 0.6520725, 0, 1, 0.4196078, 1,
-0.2426372, -2.099566, -3.073937, 0, 1, 0.4235294, 1,
-0.2318266, 0.4999884, 0.06036353, 0, 1, 0.4313726, 1,
-0.2303005, 1.213694, -0.05546553, 0, 1, 0.4352941, 1,
-0.2264374, 1.518031, 0.1745106, 0, 1, 0.4431373, 1,
-0.2241764, -0.568452, -3.766881, 0, 1, 0.4470588, 1,
-0.2223473, -0.1495311, -2.593439, 0, 1, 0.454902, 1,
-0.2216391, -0.4156451, -1.472901, 0, 1, 0.4588235, 1,
-0.2204405, -1.639113, -1.413177, 0, 1, 0.4666667, 1,
-0.2201187, -0.346198, -1.855208, 0, 1, 0.4705882, 1,
-0.2182565, -0.7172971, -2.413118, 0, 1, 0.4784314, 1,
-0.2155208, 1.721335, 0.7572495, 0, 1, 0.4823529, 1,
-0.2147164, 0.5968387, 0.6231545, 0, 1, 0.4901961, 1,
-0.2092981, -0.9632066, -4.457104, 0, 1, 0.4941176, 1,
-0.2089576, 0.3196941, -1.123051, 0, 1, 0.5019608, 1,
-0.2064632, 1.444216, 1.706646, 0, 1, 0.509804, 1,
-0.2029134, -1.355957, -3.499276, 0, 1, 0.5137255, 1,
-0.1988899, 2.585204, -0.2560469, 0, 1, 0.5215687, 1,
-0.1965064, 0.7466254, -1.398015, 0, 1, 0.5254902, 1,
-0.1943966, 1.69547, -0.2371802, 0, 1, 0.5333334, 1,
-0.1939308, 0.7909474, -0.3492254, 0, 1, 0.5372549, 1,
-0.1895834, 0.03696207, -1.855499, 0, 1, 0.5450981, 1,
-0.1886009, -1.256256, -2.68146, 0, 1, 0.5490196, 1,
-0.1884033, 0.5194961, -0.5031472, 0, 1, 0.5568628, 1,
-0.1878922, -0.2738669, -2.784498, 0, 1, 0.5607843, 1,
-0.1857599, -0.8728675, -2.221412, 0, 1, 0.5686275, 1,
-0.1843606, -0.06914179, -1.494791, 0, 1, 0.572549, 1,
-0.183684, -1.566401, -2.963596, 0, 1, 0.5803922, 1,
-0.1836128, 0.294071, 0.613447, 0, 1, 0.5843138, 1,
-0.1802395, -1.447457, -2.686547, 0, 1, 0.5921569, 1,
-0.1786984, 0.4553676, -0.4451541, 0, 1, 0.5960785, 1,
-0.1691558, 1.008252, -1.137308, 0, 1, 0.6039216, 1,
-0.1688721, -0.6207795, -1.538452, 0, 1, 0.6117647, 1,
-0.1614114, -0.1959416, -2.805488, 0, 1, 0.6156863, 1,
-0.1611761, 0.130114, -0.9447633, 0, 1, 0.6235294, 1,
-0.1569575, -2.298662, -2.532459, 0, 1, 0.627451, 1,
-0.1566494, -2.261122, -2.281856, 0, 1, 0.6352941, 1,
-0.1548304, 1.509145, 0.605956, 0, 1, 0.6392157, 1,
-0.1539779, -0.9722745, -3.167723, 0, 1, 0.6470588, 1,
-0.1532595, 1.049239, -1.790916, 0, 1, 0.6509804, 1,
-0.1527052, 0.1127025, -1.292397, 0, 1, 0.6588235, 1,
-0.1521825, -1.386805, -2.496969, 0, 1, 0.6627451, 1,
-0.1416683, -1.353414, -2.966727, 0, 1, 0.6705883, 1,
-0.1406412, -0.489804, -3.344111, 0, 1, 0.6745098, 1,
-0.1387939, 1.602816, -0.6717173, 0, 1, 0.682353, 1,
-0.13519, 0.2306265, 0.124541, 0, 1, 0.6862745, 1,
-0.1341916, 1.638103, -1.180009, 0, 1, 0.6941177, 1,
-0.1327662, -1.414087, -3.319852, 0, 1, 0.7019608, 1,
-0.1248404, 0.3903426, -0.8898337, 0, 1, 0.7058824, 1,
-0.1244014, -0.1091022, -1.66396, 0, 1, 0.7137255, 1,
-0.1222878, -0.7910227, -1.593806, 0, 1, 0.7176471, 1,
-0.119437, -0.8363066, -3.644304, 0, 1, 0.7254902, 1,
-0.1142209, -1.386143, -3.304875, 0, 1, 0.7294118, 1,
-0.1124206, -0.804746, -2.516422, 0, 1, 0.7372549, 1,
-0.1100248, -0.4437424, -3.554192, 0, 1, 0.7411765, 1,
-0.109758, -1.033894, -2.354024, 0, 1, 0.7490196, 1,
-0.1077149, 1.814303, 0.5288234, 0, 1, 0.7529412, 1,
-0.1034103, 0.809328, -0.02836686, 0, 1, 0.7607843, 1,
-0.09782582, 0.1777656, 2.299606, 0, 1, 0.7647059, 1,
-0.09660779, -0.557685, -2.794884, 0, 1, 0.772549, 1,
-0.08694968, 0.4821445, 1.163228, 0, 1, 0.7764706, 1,
-0.08601512, 0.6099788, 0.5972413, 0, 1, 0.7843137, 1,
-0.08266853, 0.0757661, -1.666159, 0, 1, 0.7882353, 1,
-0.07901388, 0.148936, 0.4429079, 0, 1, 0.7960784, 1,
-0.07611077, -1.377743, -1.485149, 0, 1, 0.8039216, 1,
-0.07596818, -0.5934686, -4.03637, 0, 1, 0.8078431, 1,
-0.07533851, 1.477334, 1.028125, 0, 1, 0.8156863, 1,
-0.06752985, -2.208145, -4.342037, 0, 1, 0.8196079, 1,
-0.06700719, -1.300693, -4.183281, 0, 1, 0.827451, 1,
-0.06384007, 0.2536922, -0.9495537, 0, 1, 0.8313726, 1,
-0.05581313, 0.5254074, -0.2544059, 0, 1, 0.8392157, 1,
-0.05510867, -1.717447, -3.549869, 0, 1, 0.8431373, 1,
-0.05494408, 0.9281894, 0.9834469, 0, 1, 0.8509804, 1,
-0.05230692, -1.382598, -4.290215, 0, 1, 0.854902, 1,
-0.05045803, 0.6855457, 0.9539969, 0, 1, 0.8627451, 1,
-0.05035024, -2.848351, -5.643029, 0, 1, 0.8666667, 1,
-0.04986793, -1.427294, -2.911409, 0, 1, 0.8745098, 1,
-0.04729184, -1.903395, -1.364339, 0, 1, 0.8784314, 1,
-0.04728416, 0.930545, 0.144823, 0, 1, 0.8862745, 1,
-0.04188782, 1.129917, -0.05858389, 0, 1, 0.8901961, 1,
-0.04127826, 1.488027, -0.08255149, 0, 1, 0.8980392, 1,
-0.03703713, 0.106183, 0.3772808, 0, 1, 0.9058824, 1,
-0.03452416, 0.1282848, -1.2861, 0, 1, 0.9098039, 1,
-0.03332024, 0.2557575, -1.096437, 0, 1, 0.9176471, 1,
-0.03164442, -0.5850855, -3.958716, 0, 1, 0.9215686, 1,
-0.02959949, -0.01265125, -1.728197, 0, 1, 0.9294118, 1,
-0.0254017, 0.5033212, -0.05625334, 0, 1, 0.9333333, 1,
-0.02300073, 0.06601238, 1.141907, 0, 1, 0.9411765, 1,
-0.01843627, 0.2117699, 1.204386, 0, 1, 0.945098, 1,
-0.01835631, 1.093526, 0.929864, 0, 1, 0.9529412, 1,
-0.008173693, 1.925794, -0.5017543, 0, 1, 0.9568627, 1,
-0.00058679, 0.5344157, 0.7130026, 0, 1, 0.9647059, 1,
0.0005030019, 0.476562, 0.157001, 0, 1, 0.9686275, 1,
0.004299226, 0.175394, 0.3275088, 0, 1, 0.9764706, 1,
0.009799661, 0.2463741, -0.007044666, 0, 1, 0.9803922, 1,
0.01312321, -2.34859, 2.796171, 0, 1, 0.9882353, 1,
0.0179309, -0.8811045, 3.002334, 0, 1, 0.9921569, 1,
0.02252581, -0.7494717, 2.819816, 0, 1, 1, 1,
0.0251219, -0.6846385, 1.741335, 0, 0.9921569, 1, 1,
0.02655781, -0.5852677, 3.556783, 0, 0.9882353, 1, 1,
0.02857246, -1.474695, 4.210253, 0, 0.9803922, 1, 1,
0.03090771, 0.2651959, 1.214227, 0, 0.9764706, 1, 1,
0.03145837, 0.1032748, -1.428548, 0, 0.9686275, 1, 1,
0.03168282, -0.4280446, 4.011008, 0, 0.9647059, 1, 1,
0.03438225, 0.4156947, -0.9556804, 0, 0.9568627, 1, 1,
0.03801212, -0.5002189, 3.249292, 0, 0.9529412, 1, 1,
0.03834876, 0.7198712, -0.2145118, 0, 0.945098, 1, 1,
0.03897809, 1.159048, 0.3052475, 0, 0.9411765, 1, 1,
0.03946523, -1.710772, 3.515011, 0, 0.9333333, 1, 1,
0.04213225, 0.717073, -0.4877007, 0, 0.9294118, 1, 1,
0.04303176, 0.6141292, 0.8117049, 0, 0.9215686, 1, 1,
0.04392556, -0.2010646, 2.373122, 0, 0.9176471, 1, 1,
0.04452141, -0.02465696, 1.367753, 0, 0.9098039, 1, 1,
0.04511231, 0.3804971, 1.745691, 0, 0.9058824, 1, 1,
0.04656783, 0.2327358, -0.9909573, 0, 0.8980392, 1, 1,
0.05300415, -0.3412696, 3.095057, 0, 0.8901961, 1, 1,
0.05487766, -1.99763, 2.833368, 0, 0.8862745, 1, 1,
0.05520085, -1.516415, 3.859182, 0, 0.8784314, 1, 1,
0.0556148, -0.7420603, 3.319999, 0, 0.8745098, 1, 1,
0.05583594, -0.6794642, 3.670565, 0, 0.8666667, 1, 1,
0.05637175, -0.1383837, 3.553331, 0, 0.8627451, 1, 1,
0.05719705, -0.6147797, 2.685819, 0, 0.854902, 1, 1,
0.05855193, -0.6034065, 3.653437, 0, 0.8509804, 1, 1,
0.0622392, -0.3347143, 2.129456, 0, 0.8431373, 1, 1,
0.06252898, 1.279285, -2.120557, 0, 0.8392157, 1, 1,
0.06611955, -0.2498859, 1.172904, 0, 0.8313726, 1, 1,
0.06871841, -1.640992, 3.196746, 0, 0.827451, 1, 1,
0.06925666, 1.493877, 0.2110144, 0, 0.8196079, 1, 1,
0.07664205, -1.161455, 2.944348, 0, 0.8156863, 1, 1,
0.08639487, -0.09837257, 1.211184, 0, 0.8078431, 1, 1,
0.08658376, -1.241043, 3.873852, 0, 0.8039216, 1, 1,
0.09097791, 1.405549, 0.02514517, 0, 0.7960784, 1, 1,
0.09156307, -0.3248323, 3.25258, 0, 0.7882353, 1, 1,
0.09343655, 0.9000351, 0.627152, 0, 0.7843137, 1, 1,
0.09933323, 0.1491275, 1.798073, 0, 0.7764706, 1, 1,
0.1078466, -0.5715494, 4.051088, 0, 0.772549, 1, 1,
0.1117851, -1.230942, 2.656443, 0, 0.7647059, 1, 1,
0.1121029, 0.3366404, -1.132879, 0, 0.7607843, 1, 1,
0.1128596, 0.3591357, 3.314583, 0, 0.7529412, 1, 1,
0.1147683, -0.2931671, 1.539045, 0, 0.7490196, 1, 1,
0.1156023, -1.38418, 4.522855, 0, 0.7411765, 1, 1,
0.1181972, 0.9540745, -2.179713, 0, 0.7372549, 1, 1,
0.1347405, 0.5239198, 0.8854236, 0, 0.7294118, 1, 1,
0.1362368, -0.03472373, 1.973625, 0, 0.7254902, 1, 1,
0.1393324, 0.5373912, 0.8278604, 0, 0.7176471, 1, 1,
0.1413137, 0.5886697, 1.403933, 0, 0.7137255, 1, 1,
0.141438, -0.4499969, 3.752803, 0, 0.7058824, 1, 1,
0.1419428, -0.1880643, 2.966835, 0, 0.6980392, 1, 1,
0.1445494, 1.003958, -0.8247969, 0, 0.6941177, 1, 1,
0.14746, 0.8265341, 0.1011387, 0, 0.6862745, 1, 1,
0.1538776, -0.2722318, 1.350785, 0, 0.682353, 1, 1,
0.1630376, -0.463441, 2.306148, 0, 0.6745098, 1, 1,
0.1636713, 0.9300339, 0.4785735, 0, 0.6705883, 1, 1,
0.1637443, 0.8457176, -0.3297367, 0, 0.6627451, 1, 1,
0.1658206, 0.4799133, 1.653245, 0, 0.6588235, 1, 1,
0.1685357, 0.01555607, 1.371073, 0, 0.6509804, 1, 1,
0.168901, 0.9096605, -1.717873, 0, 0.6470588, 1, 1,
0.1697483, -0.1385966, 2.564929, 0, 0.6392157, 1, 1,
0.1700318, -0.06469859, 1.656184, 0, 0.6352941, 1, 1,
0.1719383, -0.4959513, 2.547955, 0, 0.627451, 1, 1,
0.1751679, -1.459313, 4.22095, 0, 0.6235294, 1, 1,
0.1760005, 0.7679982, -0.8648867, 0, 0.6156863, 1, 1,
0.1782875, -1.376526, 2.585234, 0, 0.6117647, 1, 1,
0.1838709, 0.7402892, 0.1548239, 0, 0.6039216, 1, 1,
0.1866099, -0.9180778, 5.233295, 0, 0.5960785, 1, 1,
0.1892533, -0.1569516, 4.561565, 0, 0.5921569, 1, 1,
0.1910655, -1.816817, 2.08384, 0, 0.5843138, 1, 1,
0.1921511, -0.1502002, 2.673815, 0, 0.5803922, 1, 1,
0.1942631, 0.9163864, 1.473584, 0, 0.572549, 1, 1,
0.195144, 1.035017, -0.5131945, 0, 0.5686275, 1, 1,
0.1964651, 1.397497, 0.4873067, 0, 0.5607843, 1, 1,
0.1977434, 1.484555, -0.6614525, 0, 0.5568628, 1, 1,
0.199034, 0.4566899, 0.08895882, 0, 0.5490196, 1, 1,
0.2018081, 1.501854, 1.318967, 0, 0.5450981, 1, 1,
0.2104612, 1.126265, 1.752618, 0, 0.5372549, 1, 1,
0.2122369, 1.028458, -0.06838875, 0, 0.5333334, 1, 1,
0.2140276, -0.06484478, 1.932166, 0, 0.5254902, 1, 1,
0.2147181, 1.645486, -0.3648753, 0, 0.5215687, 1, 1,
0.2197318, 0.6958817, -1.711827, 0, 0.5137255, 1, 1,
0.2200631, -0.1984959, 2.234247, 0, 0.509804, 1, 1,
0.2293373, -0.3047808, 2.651982, 0, 0.5019608, 1, 1,
0.2310112, 0.5005957, -0.05273899, 0, 0.4941176, 1, 1,
0.2311864, -0.854392, 4.715027, 0, 0.4901961, 1, 1,
0.2369082, 0.2703564, 0.2542777, 0, 0.4823529, 1, 1,
0.2377903, -0.2749507, -0.728757, 0, 0.4784314, 1, 1,
0.2393369, -0.1257836, 2.510858, 0, 0.4705882, 1, 1,
0.2402285, 0.4338302, -0.1113356, 0, 0.4666667, 1, 1,
0.2418624, -1.770926, 3.348181, 0, 0.4588235, 1, 1,
0.2489142, 0.04582415, 2.016947, 0, 0.454902, 1, 1,
0.2507327, -2.331489, 2.490464, 0, 0.4470588, 1, 1,
0.2546997, -1.546767, 3.659311, 0, 0.4431373, 1, 1,
0.2567745, 0.5756397, -0.3708535, 0, 0.4352941, 1, 1,
0.2579386, -0.7729705, 2.386204, 0, 0.4313726, 1, 1,
0.2623179, -0.9607281, 2.574065, 0, 0.4235294, 1, 1,
0.2652702, 0.3275087, 1.59003, 0, 0.4196078, 1, 1,
0.2665415, -0.2688894, 1.642127, 0, 0.4117647, 1, 1,
0.2704184, 2.940629, 0.5666271, 0, 0.4078431, 1, 1,
0.2710432, 0.2964791, 0.9053741, 0, 0.4, 1, 1,
0.2745773, -0.5848678, 1.943508, 0, 0.3921569, 1, 1,
0.2789885, 0.1571229, 2.540236, 0, 0.3882353, 1, 1,
0.2802228, -0.6382814, 2.806712, 0, 0.3803922, 1, 1,
0.2802941, -1.146293, 2.724977, 0, 0.3764706, 1, 1,
0.2830473, -1.095482, 2.687034, 0, 0.3686275, 1, 1,
0.2885715, 0.4347228, -0.1688206, 0, 0.3647059, 1, 1,
0.2902462, -0.8116906, 2.904351, 0, 0.3568628, 1, 1,
0.2923662, 0.5482718, 1.381741, 0, 0.3529412, 1, 1,
0.2937072, 0.1832036, 1.429509, 0, 0.345098, 1, 1,
0.2940348, -0.5136232, 2.289668, 0, 0.3411765, 1, 1,
0.2956342, -0.7422268, 2.687421, 0, 0.3333333, 1, 1,
0.2982175, 0.109555, 3.09594, 0, 0.3294118, 1, 1,
0.3064197, -1.298907, 2.557211, 0, 0.3215686, 1, 1,
0.3069191, -0.2557845, 4.746862, 0, 0.3176471, 1, 1,
0.3077008, 1.011653, 1.015591, 0, 0.3098039, 1, 1,
0.3121012, 0.8950385, 1.170117, 0, 0.3058824, 1, 1,
0.3137103, 1.488719, 0.9767537, 0, 0.2980392, 1, 1,
0.3185454, 0.1432923, 0.04394129, 0, 0.2901961, 1, 1,
0.3229755, -0.9598164, 1.407923, 0, 0.2862745, 1, 1,
0.3263366, -0.3846457, 1.762882, 0, 0.2784314, 1, 1,
0.3309811, -0.949961, 1.933413, 0, 0.2745098, 1, 1,
0.3326328, -0.8482352, 2.022492, 0, 0.2666667, 1, 1,
0.3415488, -0.3500915, 2.419934, 0, 0.2627451, 1, 1,
0.3423748, -0.8627093, 2.877661, 0, 0.254902, 1, 1,
0.342429, -2.445001, 3.558652, 0, 0.2509804, 1, 1,
0.3472227, 0.2658401, 0.1591564, 0, 0.2431373, 1, 1,
0.3499107, 0.3423086, 1.256562, 0, 0.2392157, 1, 1,
0.35101, -0.4866278, 1.829291, 0, 0.2313726, 1, 1,
0.3549692, -0.131169, 1.259244, 0, 0.227451, 1, 1,
0.3586231, 1.24742, -1.253167, 0, 0.2196078, 1, 1,
0.3613762, -2.228768, 2.894145, 0, 0.2156863, 1, 1,
0.3665464, 0.1648804, 1.332519, 0, 0.2078431, 1, 1,
0.3686397, 0.5040513, 1.314421, 0, 0.2039216, 1, 1,
0.3703588, 0.4545986, 2.11968, 0, 0.1960784, 1, 1,
0.3729409, 0.0670886, 2.693446, 0, 0.1882353, 1, 1,
0.3730609, -0.9113563, 2.260774, 0, 0.1843137, 1, 1,
0.374055, 1.120369, -1.451385, 0, 0.1764706, 1, 1,
0.3841493, -0.4077467, 2.708748, 0, 0.172549, 1, 1,
0.3878897, -0.4845457, 1.465636, 0, 0.1647059, 1, 1,
0.3905016, 1.849643, 2.122062, 0, 0.1607843, 1, 1,
0.391091, -0.2752527, 3.100155, 0, 0.1529412, 1, 1,
0.3923101, 1.468538, -0.02437219, 0, 0.1490196, 1, 1,
0.3944364, -1.372664, 4.69822, 0, 0.1411765, 1, 1,
0.3945502, 0.1593025, 1.929004, 0, 0.1372549, 1, 1,
0.4009514, 0.07472005, 1.065821, 0, 0.1294118, 1, 1,
0.4025105, 0.8457608, -2.797155, 0, 0.1254902, 1, 1,
0.4106291, -2.014538, 4.434855, 0, 0.1176471, 1, 1,
0.4111676, -1.331899, 3.040885, 0, 0.1137255, 1, 1,
0.4120258, -0.7339386, 1.772496, 0, 0.1058824, 1, 1,
0.4149749, -1.279531, 2.524922, 0, 0.09803922, 1, 1,
0.4181622, 0.6971698, -1.668401, 0, 0.09411765, 1, 1,
0.4205349, -1.10245, 2.847747, 0, 0.08627451, 1, 1,
0.4267909, -1.531611, 0.6087511, 0, 0.08235294, 1, 1,
0.4277632, -0.426534, 1.412083, 0, 0.07450981, 1, 1,
0.4279501, 0.03352555, 0.4627326, 0, 0.07058824, 1, 1,
0.4291781, -0.2412158, 2.583905, 0, 0.0627451, 1, 1,
0.4300162, 1.471973, -0.80391, 0, 0.05882353, 1, 1,
0.4302908, 1.038292, 1.102131, 0, 0.05098039, 1, 1,
0.4330252, -0.238498, 1.638507, 0, 0.04705882, 1, 1,
0.4372216, -0.8160864, 3.412446, 0, 0.03921569, 1, 1,
0.437426, -0.2905276, 3.133567, 0, 0.03529412, 1, 1,
0.4375411, -0.1372192, 3.315034, 0, 0.02745098, 1, 1,
0.4383932, 0.217945, 1.266721, 0, 0.02352941, 1, 1,
0.4402765, 0.4182854, 2.432266, 0, 0.01568628, 1, 1,
0.4421319, 0.0100941, 3.38141, 0, 0.01176471, 1, 1,
0.4428828, 1.184028, 0.6345066, 0, 0.003921569, 1, 1,
0.4440272, 0.02999767, 1.016496, 0.003921569, 0, 1, 1,
0.4491937, -0.4178182, 0.735914, 0.007843138, 0, 1, 1,
0.4501772, 1.393337, 1.297775, 0.01568628, 0, 1, 1,
0.4517521, -1.047001, 3.399484, 0.01960784, 0, 1, 1,
0.4528788, -0.29813, 1.584933, 0.02745098, 0, 1, 1,
0.4577519, 0.1443622, 0.7513061, 0.03137255, 0, 1, 1,
0.4717234, 0.8957778, 0.8293679, 0.03921569, 0, 1, 1,
0.4758046, -1.275345, 2.916855, 0.04313726, 0, 1, 1,
0.4843414, -0.02043397, 2.150954, 0.05098039, 0, 1, 1,
0.484931, -0.8908572, 2.795485, 0.05490196, 0, 1, 1,
0.4883806, -2.310052, 1.436304, 0.0627451, 0, 1, 1,
0.48866, -0.8274271, 2.634521, 0.06666667, 0, 1, 1,
0.4898601, -0.6345254, 1.688805, 0.07450981, 0, 1, 1,
0.4907486, 0.7230284, 0.442705, 0.07843138, 0, 1, 1,
0.4935587, -2.139976, 2.310164, 0.08627451, 0, 1, 1,
0.49974, 0.4440859, 1.070501, 0.09019608, 0, 1, 1,
0.5154278, 0.8002472, 1.37519, 0.09803922, 0, 1, 1,
0.5182973, 0.4305627, -1.44567, 0.1058824, 0, 1, 1,
0.5185109, 0.3090884, 2.530682, 0.1098039, 0, 1, 1,
0.5203095, 0.01247661, 1.319941, 0.1176471, 0, 1, 1,
0.5222737, -0.2652552, 3.108879, 0.1215686, 0, 1, 1,
0.5250593, 0.02991215, 0.880738, 0.1294118, 0, 1, 1,
0.5268703, 2.823068, 2.512712, 0.1333333, 0, 1, 1,
0.5302763, 0.9771534, 0.7254987, 0.1411765, 0, 1, 1,
0.5374591, -1.37827, 3.975264, 0.145098, 0, 1, 1,
0.5390044, 0.3703941, 0.4054425, 0.1529412, 0, 1, 1,
0.5408791, 1.511242, 1.861754, 0.1568628, 0, 1, 1,
0.5415152, 1.354306, -1.563471, 0.1647059, 0, 1, 1,
0.5425752, 1.487519, -0.6051316, 0.1686275, 0, 1, 1,
0.5502188, -1.273184, 1.288913, 0.1764706, 0, 1, 1,
0.5502859, -0.2391857, 2.146361, 0.1803922, 0, 1, 1,
0.5533337, -1.78049, 2.430882, 0.1882353, 0, 1, 1,
0.5539473, 0.2995104, -0.2417917, 0.1921569, 0, 1, 1,
0.5706331, 1.222726, 1.91004, 0.2, 0, 1, 1,
0.5721372, -0.8948347, 0.3129337, 0.2078431, 0, 1, 1,
0.5724673, -0.8090631, 2.234454, 0.2117647, 0, 1, 1,
0.5726336, -0.7992352, 3.45873, 0.2196078, 0, 1, 1,
0.5755175, 0.9692921, -0.5808386, 0.2235294, 0, 1, 1,
0.575986, -0.3209983, 2.675148, 0.2313726, 0, 1, 1,
0.5793495, 0.869641, 2.095839, 0.2352941, 0, 1, 1,
0.5799896, 0.1228328, 2.002224, 0.2431373, 0, 1, 1,
0.5815619, 1.512282, 0.1119076, 0.2470588, 0, 1, 1,
0.5819127, 0.01190609, 2.367763, 0.254902, 0, 1, 1,
0.5823101, -0.8112676, 1.435897, 0.2588235, 0, 1, 1,
0.5844736, 0.807037, 0.5121306, 0.2666667, 0, 1, 1,
0.5893729, 0.129586, 1.143856, 0.2705882, 0, 1, 1,
0.5906832, 0.2575659, -0.7570187, 0.2784314, 0, 1, 1,
0.5927706, -1.21631, 3.73205, 0.282353, 0, 1, 1,
0.5944123, 1.66664, 1.2251, 0.2901961, 0, 1, 1,
0.5976461, -0.08782198, 1.119617, 0.2941177, 0, 1, 1,
0.5999131, 0.03508651, 1.870679, 0.3019608, 0, 1, 1,
0.6001375, 0.5949261, -1.872327, 0.3098039, 0, 1, 1,
0.6004217, -0.8112371, 3.494868, 0.3137255, 0, 1, 1,
0.6074991, -1.803971, 2.108961, 0.3215686, 0, 1, 1,
0.6080527, 0.4675092, 1.470191, 0.3254902, 0, 1, 1,
0.6107374, -0.2205676, 0.8783342, 0.3333333, 0, 1, 1,
0.6150311, -1.226947, 2.08005, 0.3372549, 0, 1, 1,
0.615591, 1.45546, -0.2950736, 0.345098, 0, 1, 1,
0.625779, 1.702016, 0.3681202, 0.3490196, 0, 1, 1,
0.6259698, -0.3649536, 2.757402, 0.3568628, 0, 1, 1,
0.6260945, -2.511344, 2.958, 0.3607843, 0, 1, 1,
0.6266738, -0.7923402, 2.777523, 0.3686275, 0, 1, 1,
0.6368378, 1.709709, -0.8065755, 0.372549, 0, 1, 1,
0.6404724, -0.3888542, 2.640182, 0.3803922, 0, 1, 1,
0.6431755, 0.9356876, 0.003203436, 0.3843137, 0, 1, 1,
0.6434458, 0.07229838, 1.439138, 0.3921569, 0, 1, 1,
0.6470551, 0.5718117, 0.1743623, 0.3960784, 0, 1, 1,
0.6485019, 1.219109, 0.04609917, 0.4039216, 0, 1, 1,
0.6521845, -0.5687492, 1.569076, 0.4117647, 0, 1, 1,
0.6556089, 0.3877977, 0.1405387, 0.4156863, 0, 1, 1,
0.6563212, -2.528042, 0.2312372, 0.4235294, 0, 1, 1,
0.658544, 1.328431, -0.7888361, 0.427451, 0, 1, 1,
0.6607379, 2.158493, -0.2551664, 0.4352941, 0, 1, 1,
0.6627851, -0.09286989, 2.307945, 0.4392157, 0, 1, 1,
0.6643461, 0.1458048, 2.624458, 0.4470588, 0, 1, 1,
0.6715314, 1.061285, 0.2730842, 0.4509804, 0, 1, 1,
0.6752558, 1.637724, 0.4156366, 0.4588235, 0, 1, 1,
0.6785162, 2.131678, 0.174055, 0.4627451, 0, 1, 1,
0.6788586, 0.4623041, 0.860683, 0.4705882, 0, 1, 1,
0.679118, 1.35473, -1.348921, 0.4745098, 0, 1, 1,
0.6880538, 0.03845983, 0.5888234, 0.4823529, 0, 1, 1,
0.6925059, 0.9825934, 1.012573, 0.4862745, 0, 1, 1,
0.6927049, 1.624428, 1.984493, 0.4941176, 0, 1, 1,
0.6928318, 1.174459, 0.3010418, 0.5019608, 0, 1, 1,
0.7017448, 0.9690043, 0.6680883, 0.5058824, 0, 1, 1,
0.7025843, 0.5723584, -0.2090603, 0.5137255, 0, 1, 1,
0.7048413, -0.03720477, 0.9270142, 0.5176471, 0, 1, 1,
0.7069863, 0.0311512, 2.539996, 0.5254902, 0, 1, 1,
0.7146139, 2.205933, 0.8066927, 0.5294118, 0, 1, 1,
0.7353114, 0.5864262, 0.4478675, 0.5372549, 0, 1, 1,
0.7396919, 1.06256, -1.493636, 0.5411765, 0, 1, 1,
0.7402318, -0.4532427, 3.058781, 0.5490196, 0, 1, 1,
0.7437813, -0.2139351, 2.716805, 0.5529412, 0, 1, 1,
0.7445459, -1.11453, 4.824501, 0.5607843, 0, 1, 1,
0.7454066, 0.1704229, 1.091292, 0.5647059, 0, 1, 1,
0.7501081, 0.2771176, 1.997602, 0.572549, 0, 1, 1,
0.7561213, -0.4777867, 3.289376, 0.5764706, 0, 1, 1,
0.7587293, -2.195382, 1.205716, 0.5843138, 0, 1, 1,
0.7647492, 0.1313049, 1.046358, 0.5882353, 0, 1, 1,
0.7670146, 0.9949213, 0.6823912, 0.5960785, 0, 1, 1,
0.7677226, 1.41453, -0.4856081, 0.6039216, 0, 1, 1,
0.7703745, -1.511631, 2.158911, 0.6078432, 0, 1, 1,
0.7707456, 0.3300286, 2.842577, 0.6156863, 0, 1, 1,
0.7765107, 0.315086, 2.447231, 0.6196079, 0, 1, 1,
0.7833473, 0.6574596, 1.314101, 0.627451, 0, 1, 1,
0.7945707, -0.1106661, 2.176523, 0.6313726, 0, 1, 1,
0.8063228, 0.3353632, 1.468804, 0.6392157, 0, 1, 1,
0.807053, -0.1743853, -0.04480497, 0.6431373, 0, 1, 1,
0.814393, 0.5131661, -0.9183115, 0.6509804, 0, 1, 1,
0.8146374, 0.0008430007, 0.7666246, 0.654902, 0, 1, 1,
0.8153255, -0.506753, 2.762479, 0.6627451, 0, 1, 1,
0.8246066, 0.5225138, 1.616834, 0.6666667, 0, 1, 1,
0.827454, 0.2202747, 0.02651143, 0.6745098, 0, 1, 1,
0.8392385, -2.173278, 4.13464, 0.6784314, 0, 1, 1,
0.8396183, 0.2133797, 0.07724473, 0.6862745, 0, 1, 1,
0.8420497, 0.2806751, 1.724681, 0.6901961, 0, 1, 1,
0.8459912, 0.3844299, 1.445704, 0.6980392, 0, 1, 1,
0.8474427, -1.591178, 1.321638, 0.7058824, 0, 1, 1,
0.8501422, 0.01350098, -0.08183975, 0.7098039, 0, 1, 1,
0.8503398, 0.8625438, 0.6990227, 0.7176471, 0, 1, 1,
0.8530045, -0.1028803, 1.472816, 0.7215686, 0, 1, 1,
0.8535735, 1.294492, -0.2524839, 0.7294118, 0, 1, 1,
0.8569061, 0.4381535, 1.454929, 0.7333333, 0, 1, 1,
0.8591816, -0.2607481, 0.6960599, 0.7411765, 0, 1, 1,
0.8601469, -0.4666539, 0.4387178, 0.7450981, 0, 1, 1,
0.8642259, -0.4975734, -0.996025, 0.7529412, 0, 1, 1,
0.8746044, 0.004250046, 0.9868474, 0.7568628, 0, 1, 1,
0.8751528, -0.7762465, 2.133133, 0.7647059, 0, 1, 1,
0.8817359, 1.177132, 1.826762, 0.7686275, 0, 1, 1,
0.8877679, -0.6896251, 2.367108, 0.7764706, 0, 1, 1,
0.8884217, 1.733413, 0.9602622, 0.7803922, 0, 1, 1,
0.8887213, 0.5524814, 0.7076927, 0.7882353, 0, 1, 1,
0.8914146, 0.5814591, 0.154446, 0.7921569, 0, 1, 1,
0.8954939, -0.8557363, 4.384371, 0.8, 0, 1, 1,
0.9023011, -0.6967627, 3.476873, 0.8078431, 0, 1, 1,
0.903606, -0.4493366, 0.4473512, 0.8117647, 0, 1, 1,
0.9049423, 1.418955, 1.658809, 0.8196079, 0, 1, 1,
0.9176959, 1.246696, 0.442286, 0.8235294, 0, 1, 1,
0.9223657, 1.528703, 0.3019181, 0.8313726, 0, 1, 1,
0.9240063, 0.298942, 1.181182, 0.8352941, 0, 1, 1,
0.9244712, 0.06989425, -0.06946222, 0.8431373, 0, 1, 1,
0.928065, 1.88187, -0.8096766, 0.8470588, 0, 1, 1,
0.9331697, 0.2175073, 0.6588244, 0.854902, 0, 1, 1,
0.9356752, -1.743075, 3.198575, 0.8588235, 0, 1, 1,
0.9367144, -0.5690873, 1.495434, 0.8666667, 0, 1, 1,
0.9367879, -1.492867, 2.528848, 0.8705882, 0, 1, 1,
0.9395063, -1.346678, 2.343141, 0.8784314, 0, 1, 1,
0.9399586, -0.01077123, 1.149346, 0.8823529, 0, 1, 1,
0.9413792, -0.1779865, 3.917447, 0.8901961, 0, 1, 1,
0.9501162, 0.7254864, 1.594613, 0.8941177, 0, 1, 1,
0.9529521, 0.2827455, 3.563839, 0.9019608, 0, 1, 1,
0.9542317, 1.015299, 1.530259, 0.9098039, 0, 1, 1,
0.9547107, -0.1617596, 2.679305, 0.9137255, 0, 1, 1,
0.9577227, 0.6958453, 1.576519, 0.9215686, 0, 1, 1,
0.9598287, 0.6875665, 1.051616, 0.9254902, 0, 1, 1,
0.9641799, 0.2580663, 3.484206, 0.9333333, 0, 1, 1,
0.9705294, 1.364608, -0.9446567, 0.9372549, 0, 1, 1,
0.9732229, 0.8816425, 1.19006, 0.945098, 0, 1, 1,
0.9770464, 0.4020866, 1.302328, 0.9490196, 0, 1, 1,
0.977852, 1.154016, 0.1364784, 0.9568627, 0, 1, 1,
0.979148, 0.2607182, 1.916466, 0.9607843, 0, 1, 1,
0.9804496, -1.272547, 2.235398, 0.9686275, 0, 1, 1,
0.9824958, -1.034977, 0.7743313, 0.972549, 0, 1, 1,
0.9899426, 0.8037742, -0.1896553, 0.9803922, 0, 1, 1,
0.9933807, 0.2831093, 2.364093, 0.9843137, 0, 1, 1,
0.9943064, -1.572116, 4.381441, 0.9921569, 0, 1, 1,
0.9949262, -1.776769, 3.488535, 0.9960784, 0, 1, 1,
1.002162, 0.0379702, 0.9517026, 1, 0, 0.9960784, 1,
1.005326, 0.2303144, 0.6984299, 1, 0, 0.9882353, 1,
1.007563, -1.217881, 3.057012, 1, 0, 0.9843137, 1,
1.013294, -1.132539, 2.334016, 1, 0, 0.9764706, 1,
1.013948, 0.7786644, 1.557361, 1, 0, 0.972549, 1,
1.01467, 0.1754515, 2.511634, 1, 0, 0.9647059, 1,
1.019946, 0.3820421, 2.200635, 1, 0, 0.9607843, 1,
1.026313, -0.04272579, 2.615317, 1, 0, 0.9529412, 1,
1.02754, 0.4515155, -0.2048616, 1, 0, 0.9490196, 1,
1.028827, 1.90756, -0.9628648, 1, 0, 0.9411765, 1,
1.036949, 1.532985, -0.914894, 1, 0, 0.9372549, 1,
1.040205, -0.751034, 0.5952439, 1, 0, 0.9294118, 1,
1.047542, -0.08484315, 0.3023982, 1, 0, 0.9254902, 1,
1.049055, -0.1491605, 1.227533, 1, 0, 0.9176471, 1,
1.052848, -0.5380682, 2.639352, 1, 0, 0.9137255, 1,
1.05316, -2.354338, 2.742599, 1, 0, 0.9058824, 1,
1.059837, 1.674055, 0.005493824, 1, 0, 0.9019608, 1,
1.062491, -1.091755, 1.244335, 1, 0, 0.8941177, 1,
1.063112, 1.077842, 1.391142, 1, 0, 0.8862745, 1,
1.065438, 0.7673836, -0.05254805, 1, 0, 0.8823529, 1,
1.066684, 0.3992414, 1.160931, 1, 0, 0.8745098, 1,
1.069158, 0.7152489, 1.208263, 1, 0, 0.8705882, 1,
1.07086, -1.06731, 1.818065, 1, 0, 0.8627451, 1,
1.07091, -0.4882187, 1.413296, 1, 0, 0.8588235, 1,
1.074688, 0.2836058, 1.78731, 1, 0, 0.8509804, 1,
1.081903, -0.5568745, 1.949412, 1, 0, 0.8470588, 1,
1.087169, 0.8177115, 1.751597, 1, 0, 0.8392157, 1,
1.089242, 0.2108455, 0.9188692, 1, 0, 0.8352941, 1,
1.089308, -1.018599, 0.6430967, 1, 0, 0.827451, 1,
1.089641, -1.337304, 1.366276, 1, 0, 0.8235294, 1,
1.091272, -0.05536952, 1.518705, 1, 0, 0.8156863, 1,
1.092535, 2.028186, 0.130511, 1, 0, 0.8117647, 1,
1.097013, 0.3829909, 1.465496, 1, 0, 0.8039216, 1,
1.101731, -1.113467, 3.161256, 1, 0, 0.7960784, 1,
1.123303, -0.3419541, 2.286885, 1, 0, 0.7921569, 1,
1.129141, 0.6624977, 1.33356, 1, 0, 0.7843137, 1,
1.135266, 0.3040211, 0.05053414, 1, 0, 0.7803922, 1,
1.139037, -0.08638383, 2.73348, 1, 0, 0.772549, 1,
1.166032, -2.320778, 1.832847, 1, 0, 0.7686275, 1,
1.169033, -0.3114406, -0.5025812, 1, 0, 0.7607843, 1,
1.173032, -1.847705, 1.739545, 1, 0, 0.7568628, 1,
1.173714, 0.1632353, 0.6811434, 1, 0, 0.7490196, 1,
1.174807, 0.7981744, -0.04763819, 1, 0, 0.7450981, 1,
1.179383, -0.5876896, 1.336587, 1, 0, 0.7372549, 1,
1.18005, -0.4362664, 0.6675718, 1, 0, 0.7333333, 1,
1.18881, 0.1299731, 0.4000888, 1, 0, 0.7254902, 1,
1.189952, -0.9450211, 3.096675, 1, 0, 0.7215686, 1,
1.191411, 0.3277592, 2.533358, 1, 0, 0.7137255, 1,
1.197722, 0.4046192, 0.139645, 1, 0, 0.7098039, 1,
1.211648, -0.7262993, 2.761937, 1, 0, 0.7019608, 1,
1.226429, -0.319207, 3.197728, 1, 0, 0.6941177, 1,
1.229486, -0.351483, 2.12817, 1, 0, 0.6901961, 1,
1.231395, 0.4199031, 1.947653, 1, 0, 0.682353, 1,
1.233591, -0.3400883, 0.808751, 1, 0, 0.6784314, 1,
1.253667, 1.345639, 0.4151979, 1, 0, 0.6705883, 1,
1.255973, 1.017315, 1.587672, 1, 0, 0.6666667, 1,
1.25705, 0.02661446, 1.428769, 1, 0, 0.6588235, 1,
1.257203, -1.551826, 2.517541, 1, 0, 0.654902, 1,
1.25947, 0.7085077, 0.2146596, 1, 0, 0.6470588, 1,
1.266477, 1.313111, 1.366668, 1, 0, 0.6431373, 1,
1.268248, 0.8356847, 1.821383, 1, 0, 0.6352941, 1,
1.270885, -1.220666, 1.748405, 1, 0, 0.6313726, 1,
1.275154, -0.1636339, 3.110021, 1, 0, 0.6235294, 1,
1.279333, 0.1852016, 0.7999023, 1, 0, 0.6196079, 1,
1.279537, 0.251817, 2.43949, 1, 0, 0.6117647, 1,
1.283461, 0.6141652, 0.05132955, 1, 0, 0.6078432, 1,
1.290861, 0.3984853, 0.3280047, 1, 0, 0.6, 1,
1.297303, -0.4182351, 2.133925, 1, 0, 0.5921569, 1,
1.311041, -2.09043, 3.321903, 1, 0, 0.5882353, 1,
1.314096, -0.711294, 3.42145, 1, 0, 0.5803922, 1,
1.323208, -0.3617036, 1.233165, 1, 0, 0.5764706, 1,
1.326546, -0.4626105, 1.353967, 1, 0, 0.5686275, 1,
1.342297, -1.293269, 2.065688, 1, 0, 0.5647059, 1,
1.343096, -0.5315496, 1.709165, 1, 0, 0.5568628, 1,
1.345991, -0.7206325, -0.1242496, 1, 0, 0.5529412, 1,
1.351369, 0.9098958, 1.38588, 1, 0, 0.5450981, 1,
1.351614, 1.870424, 1.739372, 1, 0, 0.5411765, 1,
1.360949, -1.341269, 2.714666, 1, 0, 0.5333334, 1,
1.361973, -1.045144, 1.650204, 1, 0, 0.5294118, 1,
1.372804, 1.531988, 0.4281854, 1, 0, 0.5215687, 1,
1.379699, -1.153056, 1.572866, 1, 0, 0.5176471, 1,
1.38466, -0.9222661, 1.829814, 1, 0, 0.509804, 1,
1.390211, 0.5911724, -0.4679093, 1, 0, 0.5058824, 1,
1.39451, 1.037297, -0.3924987, 1, 0, 0.4980392, 1,
1.395785, -2.028938, -0.6054595, 1, 0, 0.4901961, 1,
1.3974, 0.7166228, 0.9361559, 1, 0, 0.4862745, 1,
1.403153, 0.144385, -0.06375316, 1, 0, 0.4784314, 1,
1.404217, 0.2506248, 0.8488302, 1, 0, 0.4745098, 1,
1.411389, 0.2003663, 0.4350382, 1, 0, 0.4666667, 1,
1.412061, -2.016187, 2.105392, 1, 0, 0.4627451, 1,
1.412776, 0.8292245, 1.152953, 1, 0, 0.454902, 1,
1.429563, -0.4230901, 0.5561855, 1, 0, 0.4509804, 1,
1.436892, 2.141547, 0.02356534, 1, 0, 0.4431373, 1,
1.436946, 0.4799053, -0.2399633, 1, 0, 0.4392157, 1,
1.438344, -1.275672, 2.911672, 1, 0, 0.4313726, 1,
1.44056, -0.01757321, 1.942224, 1, 0, 0.427451, 1,
1.444072, -0.3906163, 0.9997241, 1, 0, 0.4196078, 1,
1.446359, -1.094041, 4.416504, 1, 0, 0.4156863, 1,
1.45414, 0.4214918, 1.045898, 1, 0, 0.4078431, 1,
1.470344, -0.8152387, 2.91006, 1, 0, 0.4039216, 1,
1.472961, 1.488874, 0.02728952, 1, 0, 0.3960784, 1,
1.48313, 0.5331305, 1.204092, 1, 0, 0.3882353, 1,
1.484413, 0.07619332, 1.94499, 1, 0, 0.3843137, 1,
1.487357, -1.442779, 2.562483, 1, 0, 0.3764706, 1,
1.492799, -1.090011, 1.381107, 1, 0, 0.372549, 1,
1.504584, -0.4857329, 1.509113, 1, 0, 0.3647059, 1,
1.515685, -0.1472548, 1.843273, 1, 0, 0.3607843, 1,
1.518507, -0.4933931, 2.325003, 1, 0, 0.3529412, 1,
1.526457, -0.3869197, 2.296896, 1, 0, 0.3490196, 1,
1.531427, -0.1731534, 1.169097, 1, 0, 0.3411765, 1,
1.542753, -0.2437141, 1.131717, 1, 0, 0.3372549, 1,
1.543175, 1.00253, 1.277292, 1, 0, 0.3294118, 1,
1.54533, 0.09525055, -0.1121459, 1, 0, 0.3254902, 1,
1.554742, 0.3901387, 2.432599, 1, 0, 0.3176471, 1,
1.575386, 1.280107, 0.8194125, 1, 0, 0.3137255, 1,
1.577057, 0.8740509, 0.4532467, 1, 0, 0.3058824, 1,
1.594066, 2.268349, -1.845223, 1, 0, 0.2980392, 1,
1.606775, 1.079537, 0.4833954, 1, 0, 0.2941177, 1,
1.617069, -1.916086, 1.379729, 1, 0, 0.2862745, 1,
1.641902, -0.0009058844, 1.963549, 1, 0, 0.282353, 1,
1.646536, -0.9754497, 2.937581, 1, 0, 0.2745098, 1,
1.647328, 0.5556101, 2.002661, 1, 0, 0.2705882, 1,
1.650303, -0.4370317, 0.9614053, 1, 0, 0.2627451, 1,
1.657907, -0.5009984, 1.145273, 1, 0, 0.2588235, 1,
1.668938, 0.3194174, -0.9448367, 1, 0, 0.2509804, 1,
1.684498, -1.935583, 2.922451, 1, 0, 0.2470588, 1,
1.689053, 1.318874, 2.200107, 1, 0, 0.2392157, 1,
1.717225, -0.3720857, 2.623258, 1, 0, 0.2352941, 1,
1.742639, -0.6513661, 2.793781, 1, 0, 0.227451, 1,
1.755182, -0.01073445, 2.297309, 1, 0, 0.2235294, 1,
1.76166, 0.714679, 1.400743, 1, 0, 0.2156863, 1,
1.761718, -0.9867257, 1.678612, 1, 0, 0.2117647, 1,
1.763321, -1.329951, 2.790645, 1, 0, 0.2039216, 1,
1.774054, 0.1352359, 1.159126, 1, 0, 0.1960784, 1,
1.809651, 1.656964, 1.546979, 1, 0, 0.1921569, 1,
1.821188, 0.519808, 2.549819, 1, 0, 0.1843137, 1,
1.863561, 0.005236018, 1.989006, 1, 0, 0.1803922, 1,
1.868631, -0.7638307, 0.5231601, 1, 0, 0.172549, 1,
1.879651, 0.9477555, -0.3264623, 1, 0, 0.1686275, 1,
1.928415, 0.7887896, 1.995037, 1, 0, 0.1607843, 1,
1.941665, 0.466836, 1.507395, 1, 0, 0.1568628, 1,
1.953936, -0.512581, 2.413727, 1, 0, 0.1490196, 1,
1.958724, 0.05503409, 1.532739, 1, 0, 0.145098, 1,
1.978221, 0.221309, 1.96964, 1, 0, 0.1372549, 1,
2.03144, -1.204234, 2.158838, 1, 0, 0.1333333, 1,
2.068065, -0.6397063, 0.7760456, 1, 0, 0.1254902, 1,
2.078577, 2.435214, 0.8781825, 1, 0, 0.1215686, 1,
2.093539, 0.5095038, 2.131233, 1, 0, 0.1137255, 1,
2.154054, 0.2791103, 1.159714, 1, 0, 0.1098039, 1,
2.165383, -1.876627, 2.070102, 1, 0, 0.1019608, 1,
2.181247, -0.2314416, 2.043974, 1, 0, 0.09411765, 1,
2.207358, 0.5274886, -0.2188438, 1, 0, 0.09019608, 1,
2.20794, -1.841284, 3.003999, 1, 0, 0.08235294, 1,
2.215276, -0.7111162, -0.2885102, 1, 0, 0.07843138, 1,
2.232077, -0.2924434, 2.245118, 1, 0, 0.07058824, 1,
2.290354, 0.9950908, 1.861678, 1, 0, 0.06666667, 1,
2.307729, -0.1020807, 1.691741, 1, 0, 0.05882353, 1,
2.318066, -0.1025109, 2.281871, 1, 0, 0.05490196, 1,
2.366358, -0.8551618, 2.089223, 1, 0, 0.04705882, 1,
2.625664, 0.08169412, 0.5979024, 1, 0, 0.04313726, 1,
2.824193, -0.2254111, 1.572302, 1, 0, 0.03529412, 1,
2.99342, 0.6974873, 1.51359, 1, 0, 0.03137255, 1,
2.993599, -0.3140089, 2.681327, 1, 0, 0.02352941, 1,
3.047199, 0.03082137, 1.800308, 1, 0, 0.01960784, 1,
3.218824, -1.295759, 4.027278, 1, 0, 0.01176471, 1,
3.230544, -0.6451147, 1.919835, 1, 0, 0.007843138, 1
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
-0.09382439, -4.487447, -7.486566, 0, -0.5, 0.5, 0.5,
-0.09382439, -4.487447, -7.486566, 1, -0.5, 0.5, 0.5,
-0.09382439, -4.487447, -7.486566, 1, 1.5, 0.5, 0.5,
-0.09382439, -4.487447, -7.486566, 0, 1.5, 0.5, 0.5
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
-4.545154, -0.09149992, -7.486566, 0, -0.5, 0.5, 0.5,
-4.545154, -0.09149992, -7.486566, 1, -0.5, 0.5, 0.5,
-4.545154, -0.09149992, -7.486566, 1, 1.5, 0.5, 0.5,
-4.545154, -0.09149992, -7.486566, 0, 1.5, 0.5, 0.5
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
-4.545154, -4.487447, -0.2048669, 0, -0.5, 0.5, 0.5,
-4.545154, -4.487447, -0.2048669, 1, -0.5, 0.5, 0.5,
-4.545154, -4.487447, -0.2048669, 1, 1.5, 0.5, 0.5,
-4.545154, -4.487447, -0.2048669, 0, 1.5, 0.5, 0.5
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
-3, -3.472997, -5.806174,
3, -3.472997, -5.806174,
-3, -3.472997, -5.806174,
-3, -3.642072, -6.086239,
-2, -3.472997, -5.806174,
-2, -3.642072, -6.086239,
-1, -3.472997, -5.806174,
-1, -3.642072, -6.086239,
0, -3.472997, -5.806174,
0, -3.642072, -6.086239,
1, -3.472997, -5.806174,
1, -3.642072, -6.086239,
2, -3.472997, -5.806174,
2, -3.642072, -6.086239,
3, -3.472997, -5.806174,
3, -3.642072, -6.086239
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
-3, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
-3, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
-3, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
-3, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
-2, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
-2, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
-2, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
-2, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
-1, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
-1, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
-1, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
-1, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
0, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
0, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
0, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
0, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
1, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
1, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
1, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
1, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
2, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
2, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
2, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
2, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5,
3, -3.980222, -6.646369, 0, -0.5, 0.5, 0.5,
3, -3.980222, -6.646369, 1, -0.5, 0.5, 0.5,
3, -3.980222, -6.646369, 1, 1.5, 0.5, 0.5,
3, -3.980222, -6.646369, 0, 1.5, 0.5, 0.5
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
-3.517924, -3, -5.806174,
-3.517924, 3, -5.806174,
-3.517924, -3, -5.806174,
-3.689129, -3, -6.086239,
-3.517924, -2, -5.806174,
-3.689129, -2, -6.086239,
-3.517924, -1, -5.806174,
-3.689129, -1, -6.086239,
-3.517924, 0, -5.806174,
-3.689129, 0, -6.086239,
-3.517924, 1, -5.806174,
-3.689129, 1, -6.086239,
-3.517924, 2, -5.806174,
-3.689129, 2, -6.086239,
-3.517924, 3, -5.806174,
-3.689129, 3, -6.086239
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
-4.031539, -3, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, -3, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, -3, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, -3, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, -2, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, -2, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, -2, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, -2, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, -1, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, -1, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, -1, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, -1, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, 0, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, 0, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, 0, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, 0, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, 1, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, 1, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, 1, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, 1, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, 2, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, 2, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, 2, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, 2, -6.646369, 0, 1.5, 0.5, 0.5,
-4.031539, 3, -6.646369, 0, -0.5, 0.5, 0.5,
-4.031539, 3, -6.646369, 1, -0.5, 0.5, 0.5,
-4.031539, 3, -6.646369, 1, 1.5, 0.5, 0.5,
-4.031539, 3, -6.646369, 0, 1.5, 0.5, 0.5
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
-3.517924, -3.472997, -4,
-3.517924, -3.472997, 4,
-3.517924, -3.472997, -4,
-3.689129, -3.642072, -4,
-3.517924, -3.472997, -2,
-3.689129, -3.642072, -2,
-3.517924, -3.472997, 0,
-3.689129, -3.642072, 0,
-3.517924, -3.472997, 2,
-3.689129, -3.642072, 2,
-3.517924, -3.472997, 4,
-3.689129, -3.642072, 4
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
-4.031539, -3.980222, -4, 0, -0.5, 0.5, 0.5,
-4.031539, -3.980222, -4, 1, -0.5, 0.5, 0.5,
-4.031539, -3.980222, -4, 1, 1.5, 0.5, 0.5,
-4.031539, -3.980222, -4, 0, 1.5, 0.5, 0.5,
-4.031539, -3.980222, -2, 0, -0.5, 0.5, 0.5,
-4.031539, -3.980222, -2, 1, -0.5, 0.5, 0.5,
-4.031539, -3.980222, -2, 1, 1.5, 0.5, 0.5,
-4.031539, -3.980222, -2, 0, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 0, 0, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 0, 1, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 0, 1, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 0, 0, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 2, 0, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 2, 1, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 2, 1, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 2, 0, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 4, 0, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 4, 1, -0.5, 0.5, 0.5,
-4.031539, -3.980222, 4, 1, 1.5, 0.5, 0.5,
-4.031539, -3.980222, 4, 0, 1.5, 0.5, 0.5
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
-3.517924, -3.472997, -5.806174,
-3.517924, 3.289998, -5.806174,
-3.517924, -3.472997, 5.39644,
-3.517924, 3.289998, 5.39644,
-3.517924, -3.472997, -5.806174,
-3.517924, -3.472997, 5.39644,
-3.517924, 3.289998, -5.806174,
-3.517924, 3.289998, 5.39644,
-3.517924, -3.472997, -5.806174,
3.330275, -3.472997, -5.806174,
-3.517924, -3.472997, 5.39644,
3.330275, -3.472997, 5.39644,
-3.517924, 3.289998, -5.806174,
3.330275, 3.289998, -5.806174,
-3.517924, 3.289998, 5.39644,
3.330275, 3.289998, 5.39644,
3.330275, -3.472997, -5.806174,
3.330275, 3.289998, -5.806174,
3.330275, -3.472997, 5.39644,
3.330275, 3.289998, 5.39644,
3.330275, -3.472997, -5.806174,
3.330275, -3.472997, 5.39644,
3.330275, 3.289998, -5.806174,
3.330275, 3.289998, 5.39644
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
var radius = 7.88656;
var distance = 35.0882;
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
mvMatrix.translate( 0.09382439, 0.09149992, 0.2048669 );
mvMatrix.scale( 1.24516, 1.260847, 0.7611709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0882);
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
Procymidone<-read.table("Procymidone.xyz")
```

```
## Error in read.table("Procymidone.xyz"): no lines available in input
```

```r
x<-Procymidone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
```

```r
y<-Procymidone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
```

```r
z<-Procymidone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
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
-3.418193, 0.2652184, -2.440662, 0, 0, 1, 1, 1,
-2.727083, -0.9156031, -0.4984579, 1, 0, 0, 1, 1,
-2.52845, 0.6822715, -1.482389, 1, 0, 0, 1, 1,
-2.496662, 0.03963398, -1.565427, 1, 0, 0, 1, 1,
-2.479483, 1.010703, -0.3739326, 1, 0, 0, 1, 1,
-2.424899, -1.585449, -1.285312, 1, 0, 0, 1, 1,
-2.42471, 0.5109364, -1.250215, 0, 0, 0, 1, 1,
-2.319733, -0.2473278, -1.08713, 0, 0, 0, 1, 1,
-2.302184, 1.673878, -1.067237, 0, 0, 0, 1, 1,
-2.299151, -1.655616, -0.5355853, 0, 0, 0, 1, 1,
-2.274454, -0.02590231, -2.125582, 0, 0, 0, 1, 1,
-2.242047, 1.374008, -0.487731, 0, 0, 0, 1, 1,
-2.232178, -1.534438, -2.547945, 0, 0, 0, 1, 1,
-2.1864, -1.411116, -2.633388, 1, 1, 1, 1, 1,
-2.118813, -0.3213304, -1.732085, 1, 1, 1, 1, 1,
-2.112733, -0.9696354, -2.057847, 1, 1, 1, 1, 1,
-2.111498, 0.8878679, -1.355925, 1, 1, 1, 1, 1,
-2.074434, -1.838761, -1.188352, 1, 1, 1, 1, 1,
-2.011912, 0.09607708, -0.8099498, 1, 1, 1, 1, 1,
-2.002249, 1.212204, -1.708387, 1, 1, 1, 1, 1,
-1.979054, -1.525588, -5.127346, 1, 1, 1, 1, 1,
-1.975125, -1.689427, -3.795792, 1, 1, 1, 1, 1,
-1.969819, -0.8897718, -3.267501, 1, 1, 1, 1, 1,
-1.937308, 0.1183828, -1.551328, 1, 1, 1, 1, 1,
-1.906727, -0.8067905, -2.198532, 1, 1, 1, 1, 1,
-1.895355, -0.7703364, -1.956134, 1, 1, 1, 1, 1,
-1.872267, 0.07853482, -2.200471, 1, 1, 1, 1, 1,
-1.856656, -1.213678, -1.919291, 1, 1, 1, 1, 1,
-1.836533, -1.077278, -3.223666, 0, 0, 1, 1, 1,
-1.824057, -0.3771466, -2.382368, 1, 0, 0, 1, 1,
-1.795465, -1.024652, -0.04986288, 1, 0, 0, 1, 1,
-1.78766, -0.2458319, -1.263841, 1, 0, 0, 1, 1,
-1.775693, -1.059612, -1.201716, 1, 0, 0, 1, 1,
-1.766929, -0.9883948, -3.265944, 1, 0, 0, 1, 1,
-1.75483, 1.179762, -1.297659, 0, 0, 0, 1, 1,
-1.753628, 0.745689, -0.6068186, 0, 0, 0, 1, 1,
-1.747087, 0.5354, -1.104188, 0, 0, 0, 1, 1,
-1.72905, 0.2846119, 0.5966853, 0, 0, 0, 1, 1,
-1.724079, -0.9583452, -2.975457, 0, 0, 0, 1, 1,
-1.703966, 0.3297283, -2.745776, 0, 0, 0, 1, 1,
-1.702129, -0.8010868, -1.521047, 0, 0, 0, 1, 1,
-1.68519, -1.591492, -0.7853082, 1, 1, 1, 1, 1,
-1.671918, -0.5487116, -1.95748, 1, 1, 1, 1, 1,
-1.667641, 0.3585267, -2.343537, 1, 1, 1, 1, 1,
-1.655544, 1.567687, -1.078683, 1, 1, 1, 1, 1,
-1.611714, -1.270049, -2.509629, 1, 1, 1, 1, 1,
-1.607667, 0.9147441, -0.8008758, 1, 1, 1, 1, 1,
-1.585011, 0.9442897, 0.4712465, 1, 1, 1, 1, 1,
-1.580605, 0.3260833, -2.774558, 1, 1, 1, 1, 1,
-1.572155, 1.116406, 0.2134424, 1, 1, 1, 1, 1,
-1.569728, -0.4261779, -2.104547, 1, 1, 1, 1, 1,
-1.558498, -0.09931666, -1.788103, 1, 1, 1, 1, 1,
-1.548634, 0.7117469, 1.800616, 1, 1, 1, 1, 1,
-1.533673, -0.5744225, -1.6308, 1, 1, 1, 1, 1,
-1.525933, 1.10494, -0.6359289, 1, 1, 1, 1, 1,
-1.523032, -1.105712, -0.9775789, 1, 1, 1, 1, 1,
-1.522141, -1.742945, -3.06408, 0, 0, 1, 1, 1,
-1.515889, -1.262604, -1.818329, 1, 0, 0, 1, 1,
-1.508449, 0.4990169, -0.6127036, 1, 0, 0, 1, 1,
-1.506961, 0.1509459, -1.209593, 1, 0, 0, 1, 1,
-1.506842, -0.2632822, -2.437769, 1, 0, 0, 1, 1,
-1.497194, -1.098804, -0.7974256, 1, 0, 0, 1, 1,
-1.487909, 0.1144792, -3.702249, 0, 0, 0, 1, 1,
-1.480767, 1.714209, 0.1113738, 0, 0, 0, 1, 1,
-1.435104, 0.5762373, -2.586888, 0, 0, 0, 1, 1,
-1.428995, 0.08508966, -1.361278, 0, 0, 0, 1, 1,
-1.427504, -0.0199612, -1.454509, 0, 0, 0, 1, 1,
-1.423079, -1.405852, -2.451063, 0, 0, 0, 1, 1,
-1.421653, -0.9494153, -1.63785, 0, 0, 0, 1, 1,
-1.420148, -1.499386, -0.3407964, 1, 1, 1, 1, 1,
-1.417718, 0.8385513, -0.5809826, 1, 1, 1, 1, 1,
-1.416627, 1.472829, -0.4895715, 1, 1, 1, 1, 1,
-1.414974, 0.1309846, -0.4604736, 1, 1, 1, 1, 1,
-1.404053, 1.404648, -3.090731, 1, 1, 1, 1, 1,
-1.398795, -0.06041121, -2.619924, 1, 1, 1, 1, 1,
-1.391549, -0.1822085, -0.5526751, 1, 1, 1, 1, 1,
-1.389105, 0.2397857, -2.228694, 1, 1, 1, 1, 1,
-1.384115, -0.3424511, -3.155018, 1, 1, 1, 1, 1,
-1.382112, 0.8426585, 0.6467338, 1, 1, 1, 1, 1,
-1.372002, -0.8218998, -1.297284, 1, 1, 1, 1, 1,
-1.368011, -0.9291627, -1.955409, 1, 1, 1, 1, 1,
-1.367728, -0.2606618, -1.312936, 1, 1, 1, 1, 1,
-1.362006, 0.08281951, -2.677125, 1, 1, 1, 1, 1,
-1.358835, 1.710167, 0.03183193, 1, 1, 1, 1, 1,
-1.35758, 1.770017, 0.7056825, 0, 0, 1, 1, 1,
-1.356299, -0.1475765, -3.392599, 1, 0, 0, 1, 1,
-1.347625, 0.1577452, -1.446463, 1, 0, 0, 1, 1,
-1.33643, -0.5877652, -0.5899324, 1, 0, 0, 1, 1,
-1.326945, 1.276907, -0.05851753, 1, 0, 0, 1, 1,
-1.324547, -0.4331648, -2.293697, 1, 0, 0, 1, 1,
-1.324545, -0.7059351, -0.7896813, 0, 0, 0, 1, 1,
-1.321909, -0.4800153, -3.178215, 0, 0, 0, 1, 1,
-1.300977, -0.3790407, -1.731953, 0, 0, 0, 1, 1,
-1.300439, -0.06941641, -1.494253, 0, 0, 0, 1, 1,
-1.283292, 0.7320963, -0.01758253, 0, 0, 0, 1, 1,
-1.281425, 0.6161529, -0.3674108, 0, 0, 0, 1, 1,
-1.279465, -0.727726, -1.498795, 0, 0, 0, 1, 1,
-1.263452, 1.007227, -2.453562, 1, 1, 1, 1, 1,
-1.261965, -1.138544, -3.588455, 1, 1, 1, 1, 1,
-1.257552, -1.537221, -1.986265, 1, 1, 1, 1, 1,
-1.255794, -0.6534287, -2.082221, 1, 1, 1, 1, 1,
-1.249194, -1.114104, -3.662693, 1, 1, 1, 1, 1,
-1.232826, 0.07946897, -0.8364477, 1, 1, 1, 1, 1,
-1.226697, 1.444522, -1.248761, 1, 1, 1, 1, 1,
-1.225915, -0.8379045, -1.223076, 1, 1, 1, 1, 1,
-1.223817, 0.4784647, -0.2047255, 1, 1, 1, 1, 1,
-1.222341, -1.210993, -2.553499, 1, 1, 1, 1, 1,
-1.212078, -0.6561139, -1.877009, 1, 1, 1, 1, 1,
-1.209997, -0.3079399, -2.674885, 1, 1, 1, 1, 1,
-1.204827, -0.8587587, -3.433885, 1, 1, 1, 1, 1,
-1.200549, 0.16703, -1.275152, 1, 1, 1, 1, 1,
-1.1982, 0.2348348, -0.8126725, 1, 1, 1, 1, 1,
-1.195701, 3.191507, 0.7003478, 0, 0, 1, 1, 1,
-1.194875, 0.1977843, -3.808174, 1, 0, 0, 1, 1,
-1.193357, 0.01663624, -2.501456, 1, 0, 0, 1, 1,
-1.184215, -0.1164337, -1.834681, 1, 0, 0, 1, 1,
-1.184059, 1.230972, -0.7269295, 1, 0, 0, 1, 1,
-1.183234, 0.8060421, -1.218767, 1, 0, 0, 1, 1,
-1.182867, -0.6422382, -0.1430351, 0, 0, 0, 1, 1,
-1.18036, 0.1862209, 0.2171305, 0, 0, 0, 1, 1,
-1.178697, 1.959031, 1.510098, 0, 0, 0, 1, 1,
-1.173129, 1.947308, -1.031112, 0, 0, 0, 1, 1,
-1.160966, -0.006166239, -2.115081, 0, 0, 0, 1, 1,
-1.156903, -1.660448, -3.719363, 0, 0, 0, 1, 1,
-1.155607, -0.06505156, -2.155884, 0, 0, 0, 1, 1,
-1.147922, 0.3992203, -1.755746, 1, 1, 1, 1, 1,
-1.140569, 0.9443717, -2.685258, 1, 1, 1, 1, 1,
-1.136882, -0.6348612, -1.144251, 1, 1, 1, 1, 1,
-1.135664, 0.5698797, -2.114975, 1, 1, 1, 1, 1,
-1.133491, -2.622749, -1.868881, 1, 1, 1, 1, 1,
-1.133036, 0.6909645, -0.03915264, 1, 1, 1, 1, 1,
-1.132434, -1.278705, -1.900162, 1, 1, 1, 1, 1,
-1.129798, 1.389784, 0.7589744, 1, 1, 1, 1, 1,
-1.128363, -0.4776639, -3.981101, 1, 1, 1, 1, 1,
-1.121001, 1.27061, 1.313917, 1, 1, 1, 1, 1,
-1.120716, 1.06869, -1.470119, 1, 1, 1, 1, 1,
-1.120488, -0.0005377508, -2.293697, 1, 1, 1, 1, 1,
-1.119139, 0.2247129, -1.162638, 1, 1, 1, 1, 1,
-1.114133, -0.427057, -0.9473185, 1, 1, 1, 1, 1,
-1.099275, 1.928827, 0.8868033, 1, 1, 1, 1, 1,
-1.093583, 2.071689, -0.7828021, 0, 0, 1, 1, 1,
-1.083535, 0.2153884, -2.749298, 1, 0, 0, 1, 1,
-1.077496, 0.6068676, -0.7508156, 1, 0, 0, 1, 1,
-1.07357, 1.581044, -0.2168692, 1, 0, 0, 1, 1,
-1.072122, -1.601567, -0.6491194, 1, 0, 0, 1, 1,
-1.069942, -0.7889616, -0.4162434, 1, 0, 0, 1, 1,
-1.063781, 1.10259, -1.477105, 0, 0, 0, 1, 1,
-1.061019, -0.01457862, -1.30977, 0, 0, 0, 1, 1,
-1.060553, 1.769174, -1.878726, 0, 0, 0, 1, 1,
-1.058166, -0.04858086, -1.958467, 0, 0, 0, 1, 1,
-1.05175, -0.107478, -1.041246, 0, 0, 0, 1, 1,
-1.051037, 0.1565324, -2.978953, 0, 0, 0, 1, 1,
-1.04424, -0.06841346, -1.795131, 0, 0, 0, 1, 1,
-1.042832, 1.295349, -0.3558737, 1, 1, 1, 1, 1,
-1.042623, -0.3646213, -1.351909, 1, 1, 1, 1, 1,
-1.029473, -0.6276838, -2.192506, 1, 1, 1, 1, 1,
-1.029269, 0.4399799, -2.300139, 1, 1, 1, 1, 1,
-1.024775, 0.7896929, -0.6540198, 1, 1, 1, 1, 1,
-1.023608, -1.512389, -2.032907, 1, 1, 1, 1, 1,
-1.018265, -0.8063923, -1.590483, 1, 1, 1, 1, 1,
-1.001243, -0.8250436, -3.445521, 1, 1, 1, 1, 1,
-1.00115, 0.3222578, 0.7978899, 1, 1, 1, 1, 1,
-0.9908604, 1.576166, 0.9279188, 1, 1, 1, 1, 1,
-0.9893116, 0.6178709, -1.706538, 1, 1, 1, 1, 1,
-0.9859526, -1.179129, 0.2034232, 1, 1, 1, 1, 1,
-0.976914, 1.12541, -1.847525, 1, 1, 1, 1, 1,
-0.9577219, -0.4174865, -1.843619, 1, 1, 1, 1, 1,
-0.9560913, 1.219393, 0.3629305, 1, 1, 1, 1, 1,
-0.9552533, -0.06339695, -2.920823, 0, 0, 1, 1, 1,
-0.9498188, 2.131587, -0.1196809, 1, 0, 0, 1, 1,
-0.9490631, -0.3140259, -1.647326, 1, 0, 0, 1, 1,
-0.9448567, 0.2061283, -1.367072, 1, 0, 0, 1, 1,
-0.9422169, -0.4995009, -2.851212, 1, 0, 0, 1, 1,
-0.9419433, 0.4334621, -0.9028825, 1, 0, 0, 1, 1,
-0.9361285, -0.413005, -1.62365, 0, 0, 0, 1, 1,
-0.9347607, 0.5674764, -0.02144763, 0, 0, 0, 1, 1,
-0.9263184, 1.312759, -0.4534742, 0, 0, 0, 1, 1,
-0.9234405, -0.1346141, -0.8935349, 0, 0, 0, 1, 1,
-0.9205508, 2.433579, -0.6468211, 0, 0, 0, 1, 1,
-0.9143534, 1.506428, -0.7287532, 0, 0, 0, 1, 1,
-0.9085874, 0.3642775, -0.8042462, 0, 0, 0, 1, 1,
-0.9022142, -1.562123, -3.285083, 1, 1, 1, 1, 1,
-0.9000481, -1.231388, -0.8552329, 1, 1, 1, 1, 1,
-0.8998454, -0.6754413, -2.78539, 1, 1, 1, 1, 1,
-0.8964289, -0.1276326, -1.750322, 1, 1, 1, 1, 1,
-0.8939325, -0.3182821, -1.57542, 1, 1, 1, 1, 1,
-0.8830729, 1.000264, -2.448246, 1, 1, 1, 1, 1,
-0.88096, 1.087975, 0.2730236, 1, 1, 1, 1, 1,
-0.8758269, 1.341247, 0.8388704, 1, 1, 1, 1, 1,
-0.869583, 0.455146, -0.734436, 1, 1, 1, 1, 1,
-0.868247, -0.08911652, -1.959566, 1, 1, 1, 1, 1,
-0.8664313, 1.272189, -1.310234, 1, 1, 1, 1, 1,
-0.863786, -2.317181, -3.301555, 1, 1, 1, 1, 1,
-0.8575959, -1.106245, -2.061539, 1, 1, 1, 1, 1,
-0.8526445, -0.06348035, -0.7106443, 1, 1, 1, 1, 1,
-0.8466163, 0.6988879, -0.6631565, 1, 1, 1, 1, 1,
-0.8391711, 0.437439, 0.2741087, 0, 0, 1, 1, 1,
-0.8376155, -0.2017814, -1.87084, 1, 0, 0, 1, 1,
-0.8296779, -0.7834072, -2.507093, 1, 0, 0, 1, 1,
-0.8253732, -1.034762, -1.88825, 1, 0, 0, 1, 1,
-0.8242074, 0.6107964, -0.4309551, 1, 0, 0, 1, 1,
-0.8201244, 0.410708, -1.49095, 1, 0, 0, 1, 1,
-0.8194815, -1.442011, -3.336345, 0, 0, 0, 1, 1,
-0.8132897, 2.004144, -1.626593, 0, 0, 0, 1, 1,
-0.8130025, 0.09660058, -2.442894, 0, 0, 0, 1, 1,
-0.8123504, 0.6028556, -0.03441599, 0, 0, 0, 1, 1,
-0.8067895, 1.353267, -0.3750384, 0, 0, 0, 1, 1,
-0.805885, 0.9288303, 0.3520361, 0, 0, 0, 1, 1,
-0.8038676, 0.1727918, -0.9999595, 0, 0, 0, 1, 1,
-0.8038045, -0.8775073, -1.990832, 1, 1, 1, 1, 1,
-0.8005747, -0.5824291, -2.143919, 1, 1, 1, 1, 1,
-0.7929202, 0.6312703, -0.3028721, 1, 1, 1, 1, 1,
-0.7885362, 1.565489, -0.4147362, 1, 1, 1, 1, 1,
-0.7879292, -0.1353868, -3.445438, 1, 1, 1, 1, 1,
-0.7718566, 0.1179109, -2.770073, 1, 1, 1, 1, 1,
-0.7652389, -0.8948509, -1.997452, 1, 1, 1, 1, 1,
-0.7640749, -1.83873, -1.465348, 1, 1, 1, 1, 1,
-0.7637541, 0.5465721, -2.606869, 1, 1, 1, 1, 1,
-0.7471139, 1.751388, -0.4820364, 1, 1, 1, 1, 1,
-0.7466027, -0.4945498, -1.157804, 1, 1, 1, 1, 1,
-0.7456841, 1.200158, 1.171196, 1, 1, 1, 1, 1,
-0.7415336, 0.4660464, -0.3884992, 1, 1, 1, 1, 1,
-0.7376207, -0.04492712, 0.09301767, 1, 1, 1, 1, 1,
-0.7364409, -1.521454, -3.854558, 1, 1, 1, 1, 1,
-0.7355886, -2.160227, -1.704758, 0, 0, 1, 1, 1,
-0.7271581, -0.04731819, -1.235742, 1, 0, 0, 1, 1,
-0.7229739, 1.756374, -1.288582, 1, 0, 0, 1, 1,
-0.7224733, -0.8849465, -2.31392, 1, 0, 0, 1, 1,
-0.7203175, 0.7332925, -1.070421, 1, 0, 0, 1, 1,
-0.7202032, -0.5606712, -3.660204, 1, 0, 0, 1, 1,
-0.7195752, -0.1811468, -2.46378, 0, 0, 0, 1, 1,
-0.7189293, -1.049829, -0.2710027, 0, 0, 0, 1, 1,
-0.7113857, -0.1235341, -1.77687, 0, 0, 0, 1, 1,
-0.7087293, 0.4369305, -1.272545, 0, 0, 0, 1, 1,
-0.7079697, -1.103172, -0.936313, 0, 0, 0, 1, 1,
-0.7027122, 0.08124853, -2.069406, 0, 0, 0, 1, 1,
-0.6984931, 1.601756, 1.513334, 0, 0, 0, 1, 1,
-0.6972587, -1.300536, -1.203016, 1, 1, 1, 1, 1,
-0.6968077, 0.622956, -1.159215, 1, 1, 1, 1, 1,
-0.6946768, -2.535521, -3.23307, 1, 1, 1, 1, 1,
-0.6931729, 0.1026088, -1.414306, 1, 1, 1, 1, 1,
-0.6852406, -0.01201716, -2.21209, 1, 1, 1, 1, 1,
-0.6825049, -1.356573, -3.700781, 1, 1, 1, 1, 1,
-0.6775786, -0.5590033, -3.791227, 1, 1, 1, 1, 1,
-0.6748477, -0.05657209, -0.08800986, 1, 1, 1, 1, 1,
-0.6724985, 0.383718, -0.5590852, 1, 1, 1, 1, 1,
-0.6724892, 1.266257, -0.2354941, 1, 1, 1, 1, 1,
-0.6720915, 2.053427, 1.09665, 1, 1, 1, 1, 1,
-0.669551, 0.08237205, -1.269751, 1, 1, 1, 1, 1,
-0.6685585, -0.3811473, -1.928295, 1, 1, 1, 1, 1,
-0.6671873, 1.296167, -1.637843, 1, 1, 1, 1, 1,
-0.666406, -1.041244, -2.226351, 1, 1, 1, 1, 1,
-0.6662173, -0.7843897, -2.488124, 0, 0, 1, 1, 1,
-0.6639048, 0.03131427, -1.585291, 1, 0, 0, 1, 1,
-0.6596409, 1.056725, -0.4327257, 1, 0, 0, 1, 1,
-0.6563447, -1.587655, -1.510359, 1, 0, 0, 1, 1,
-0.6507626, -0.265007, -2.946572, 1, 0, 0, 1, 1,
-0.6463497, -0.06884286, -2.289977, 1, 0, 0, 1, 1,
-0.6411918, 0.3550713, 0.6265869, 0, 0, 0, 1, 1,
-0.6406138, -0.3332765, -1.929442, 0, 0, 0, 1, 1,
-0.6396496, 1.588805, -1.154943, 0, 0, 0, 1, 1,
-0.6377252, 0.2534598, -1.561994, 0, 0, 0, 1, 1,
-0.6354139, -0.4378589, -3.688514, 0, 0, 0, 1, 1,
-0.6309626, 0.7071202, 0.3887572, 0, 0, 0, 1, 1,
-0.6283092, -0.1354306, -2.325789, 0, 0, 0, 1, 1,
-0.6271414, 0.7805337, -1.44391, 1, 1, 1, 1, 1,
-0.6242692, -0.4583605, -3.310236, 1, 1, 1, 1, 1,
-0.6241215, 0.1266162, -1.796064, 1, 1, 1, 1, 1,
-0.6191071, 1.868799, 0.89245, 1, 1, 1, 1, 1,
-0.6183783, 0.3366241, -1.29527, 1, 1, 1, 1, 1,
-0.6161761, 1.410115, 1.658699, 1, 1, 1, 1, 1,
-0.6148366, 1.549518, 0.3487304, 1, 1, 1, 1, 1,
-0.6147077, -1.559431, -2.758167, 1, 1, 1, 1, 1,
-0.6125286, -1.338362, -4.521576, 1, 1, 1, 1, 1,
-0.6109614, 1.09915, -0.3080234, 1, 1, 1, 1, 1,
-0.6097845, 1.771068, -1.107894, 1, 1, 1, 1, 1,
-0.6068268, 0.6747971, -0.6565, 1, 1, 1, 1, 1,
-0.5964606, -0.9683746, -3.915891, 1, 1, 1, 1, 1,
-0.5936899, -2.351747, -0.4654557, 1, 1, 1, 1, 1,
-0.5895447, 0.3679632, 0.178035, 1, 1, 1, 1, 1,
-0.5884709, 1.4089, -0.9029257, 0, 0, 1, 1, 1,
-0.5816006, 0.249441, -1.088052, 1, 0, 0, 1, 1,
-0.5784391, -0.1185328, -2.06274, 1, 0, 0, 1, 1,
-0.5780654, 1.076541, -1.084022, 1, 0, 0, 1, 1,
-0.5753962, -0.8376952, -4.16443, 1, 0, 0, 1, 1,
-0.5717109, 1.203919, -0.9221341, 1, 0, 0, 1, 1,
-0.5708836, 1.271454, -0.4412673, 0, 0, 0, 1, 1,
-0.5702969, 0.04192676, -1.606149, 0, 0, 0, 1, 1,
-0.5702938, -0.7115263, -3.194123, 0, 0, 0, 1, 1,
-0.5694803, -1.764325, -1.527404, 0, 0, 0, 1, 1,
-0.5693388, 0.5528547, -0.6696308, 0, 0, 0, 1, 1,
-0.567051, -0.9467027, -0.8440378, 0, 0, 0, 1, 1,
-0.5644386, 0.05870559, -2.480298, 0, 0, 0, 1, 1,
-0.5600097, -0.3257812, -2.800728, 1, 1, 1, 1, 1,
-0.5595278, 0.1482084, -1.33687, 1, 1, 1, 1, 1,
-0.5547218, -1.234805, -2.541451, 1, 1, 1, 1, 1,
-0.5546783, -0.03449027, -1.627718, 1, 1, 1, 1, 1,
-0.5533917, 0.464769, 1.114681, 1, 1, 1, 1, 1,
-0.5521805, -0.8801725, -1.818123, 1, 1, 1, 1, 1,
-0.5508243, 0.3763873, 0.0537537, 1, 1, 1, 1, 1,
-0.5503615, 0.6343706, 1.081229, 1, 1, 1, 1, 1,
-0.5501047, -1.095363, -4.483757, 1, 1, 1, 1, 1,
-0.5466555, -0.6678853, -2.90543, 1, 1, 1, 1, 1,
-0.5411909, -0.03445816, -0.7144935, 1, 1, 1, 1, 1,
-0.5396293, -0.6476104, -1.83914, 1, 1, 1, 1, 1,
-0.5390277, 1.075368, -0.9232181, 1, 1, 1, 1, 1,
-0.5357554, 0.6549755, -0.004948295, 1, 1, 1, 1, 1,
-0.5356937, -0.4659674, -1.055655, 1, 1, 1, 1, 1,
-0.5291072, -3.374507, -4.087055, 0, 0, 1, 1, 1,
-0.5255544, -1.1676, -1.153742, 1, 0, 0, 1, 1,
-0.5150136, 0.01925931, -1.883734, 1, 0, 0, 1, 1,
-0.5087779, 0.06108639, -1.880031, 1, 0, 0, 1, 1,
-0.5081547, 1.047756, 0.6712445, 1, 0, 0, 1, 1,
-0.5035676, -0.07282535, -1.668512, 1, 0, 0, 1, 1,
-0.5022635, 1.504327, 0.2261181, 0, 0, 0, 1, 1,
-0.5017269, -0.7472763, -3.20371, 0, 0, 0, 1, 1,
-0.5006549, -0.3395063, -2.612711, 0, 0, 0, 1, 1,
-0.4995551, 0.4591684, 0.2865397, 0, 0, 0, 1, 1,
-0.4949089, 0.3868083, -0.1243173, 0, 0, 0, 1, 1,
-0.4915662, 0.9094034, -0.9231157, 0, 0, 0, 1, 1,
-0.4863742, 1.527809, 0.1884727, 0, 0, 0, 1, 1,
-0.4709543, -1.877398, -2.849647, 1, 1, 1, 1, 1,
-0.4708505, 0.8247411, 0.06750346, 1, 1, 1, 1, 1,
-0.4683072, 0.02031051, 0.1874679, 1, 1, 1, 1, 1,
-0.4674999, -0.9680967, -3.117214, 1, 1, 1, 1, 1,
-0.4636835, 2.343185, 0.5842674, 1, 1, 1, 1, 1,
-0.4633203, -0.1694162, -4.165543, 1, 1, 1, 1, 1,
-0.4566712, -1.947563, -3.892759, 1, 1, 1, 1, 1,
-0.4530932, -1.486737, -2.581667, 1, 1, 1, 1, 1,
-0.449666, 0.3862452, -1.288854, 1, 1, 1, 1, 1,
-0.4449772, -0.6479067, -5.268227, 1, 1, 1, 1, 1,
-0.4443241, 0.4835483, 0.6306108, 1, 1, 1, 1, 1,
-0.4383442, 0.4276567, -0.8035748, 1, 1, 1, 1, 1,
-0.4361427, -0.6224174, -2.852012, 1, 1, 1, 1, 1,
-0.4357935, -0.3400958, -1.807243, 1, 1, 1, 1, 1,
-0.4351565, -1.051306, -4.183473, 1, 1, 1, 1, 1,
-0.4303271, 0.0904481, -2.217899, 0, 0, 1, 1, 1,
-0.427092, 0.2230991, -0.06575548, 1, 0, 0, 1, 1,
-0.4260283, 1.347726, 1.287708, 1, 0, 0, 1, 1,
-0.4216755, -0.8029281, -1.735725, 1, 0, 0, 1, 1,
-0.41499, 0.4062333, 0.7773922, 1, 0, 0, 1, 1,
-0.4143049, 0.2659772, -1.144572, 1, 0, 0, 1, 1,
-0.4140083, 0.6764868, -1.632243, 0, 0, 0, 1, 1,
-0.4132255, 0.02293829, -2.670048, 0, 0, 0, 1, 1,
-0.4076691, -0.1005682, -0.9166332, 0, 0, 0, 1, 1,
-0.4069288, -0.6196032, -2.557871, 0, 0, 0, 1, 1,
-0.4064037, 0.1946872, 1.693126, 0, 0, 0, 1, 1,
-0.4032546, 0.8848488, 0.01939845, 0, 0, 0, 1, 1,
-0.4027599, 1.353595, 0.6210969, 0, 0, 0, 1, 1,
-0.4006066, -1.021934, -3.289671, 1, 1, 1, 1, 1,
-0.3974452, 0.2654434, -1.16353, 1, 1, 1, 1, 1,
-0.3884421, -0.2835198, -4.242171, 1, 1, 1, 1, 1,
-0.3873579, 0.00366204, -0.6260981, 1, 1, 1, 1, 1,
-0.384813, -0.1781936, -2.464203, 1, 1, 1, 1, 1,
-0.3809443, 0.02089967, 0.9490019, 1, 1, 1, 1, 1,
-0.3762152, 0.004662531, -2.334882, 1, 1, 1, 1, 1,
-0.3758754, -0.155512, -2.223491, 1, 1, 1, 1, 1,
-0.3699661, 0.2282778, -0.5228631, 1, 1, 1, 1, 1,
-0.3667396, -0.8199983, -2.628262, 1, 1, 1, 1, 1,
-0.3637281, 0.3502519, -2.449312, 1, 1, 1, 1, 1,
-0.3576588, -0.2569649, -3.222832, 1, 1, 1, 1, 1,
-0.3559362, 1.949011, -0.8679922, 1, 1, 1, 1, 1,
-0.3533418, -0.6517835, -3.73224, 1, 1, 1, 1, 1,
-0.3526338, -0.04144567, -1.71852, 1, 1, 1, 1, 1,
-0.3494538, 0.4776941, 0.2319864, 0, 0, 1, 1, 1,
-0.3471934, 0.4040228, -1.722943, 1, 0, 0, 1, 1,
-0.3464978, 1.241603, 1.122462, 1, 0, 0, 1, 1,
-0.3433584, -0.6600348, -1.638003, 1, 0, 0, 1, 1,
-0.3419932, -1.015949, -3.517212, 1, 0, 0, 1, 1,
-0.3373502, 0.3842725, -1.384527, 1, 0, 0, 1, 1,
-0.3366889, 0.5299517, -1.343182, 0, 0, 0, 1, 1,
-0.3320301, -0.5469189, -4.146422, 0, 0, 0, 1, 1,
-0.3280609, -0.3952126, -2.485672, 0, 0, 0, 1, 1,
-0.3208111, -1.944116, -4.395557, 0, 0, 0, 1, 1,
-0.3164202, -0.7137519, -1.99962, 0, 0, 0, 1, 1,
-0.316331, 0.1257237, 0.4735294, 0, 0, 0, 1, 1,
-0.3147991, -0.7717546, -3.596799, 0, 0, 0, 1, 1,
-0.3116068, -0.737354, -3.315309, 1, 1, 1, 1, 1,
-0.3035133, -2.107666, -1.397661, 1, 1, 1, 1, 1,
-0.3015478, -0.01416419, -2.587605, 1, 1, 1, 1, 1,
-0.2986251, 0.05474033, -2.345863, 1, 1, 1, 1, 1,
-0.295577, -0.009135397, -2.90913, 1, 1, 1, 1, 1,
-0.2953252, -0.8595541, -2.724964, 1, 1, 1, 1, 1,
-0.2953069, 0.2189018, -0.5850298, 1, 1, 1, 1, 1,
-0.2943826, -0.2376848, -2.879683, 1, 1, 1, 1, 1,
-0.2930709, 0.3009485, -2.099445, 1, 1, 1, 1, 1,
-0.2900903, -1.542885, -3.004228, 1, 1, 1, 1, 1,
-0.2897539, 0.5732109, -0.05196711, 1, 1, 1, 1, 1,
-0.2880959, 0.9463062, -0.6067811, 1, 1, 1, 1, 1,
-0.2879211, 0.2393576, -3.183186, 1, 1, 1, 1, 1,
-0.2826155, 1.591697, -0.6260365, 1, 1, 1, 1, 1,
-0.2785259, 0.5294945, -0.2991095, 1, 1, 1, 1, 1,
-0.2715102, -0.2867997, -2.310059, 0, 0, 1, 1, 1,
-0.2714032, 1.286653, -0.2968728, 1, 0, 0, 1, 1,
-0.2688846, 0.242162, 0.04065886, 1, 0, 0, 1, 1,
-0.2644273, 1.224548, 0.4158762, 1, 0, 0, 1, 1,
-0.263225, 1.723177, -0.06601569, 1, 0, 0, 1, 1,
-0.2627192, -0.8302425, -1.395472, 1, 0, 0, 1, 1,
-0.2602995, -0.06223071, -3.163797, 0, 0, 0, 1, 1,
-0.2583236, -0.2647952, -1.393847, 0, 0, 0, 1, 1,
-0.2527454, -0.4285167, -1.679089, 0, 0, 0, 1, 1,
-0.2487328, -0.2679588, -2.137265, 0, 0, 0, 1, 1,
-0.2477405, -0.8417286, -0.186743, 0, 0, 0, 1, 1,
-0.2438933, 0.3186531, 0.6520725, 0, 0, 0, 1, 1,
-0.2426372, -2.099566, -3.073937, 0, 0, 0, 1, 1,
-0.2318266, 0.4999884, 0.06036353, 1, 1, 1, 1, 1,
-0.2303005, 1.213694, -0.05546553, 1, 1, 1, 1, 1,
-0.2264374, 1.518031, 0.1745106, 1, 1, 1, 1, 1,
-0.2241764, -0.568452, -3.766881, 1, 1, 1, 1, 1,
-0.2223473, -0.1495311, -2.593439, 1, 1, 1, 1, 1,
-0.2216391, -0.4156451, -1.472901, 1, 1, 1, 1, 1,
-0.2204405, -1.639113, -1.413177, 1, 1, 1, 1, 1,
-0.2201187, -0.346198, -1.855208, 1, 1, 1, 1, 1,
-0.2182565, -0.7172971, -2.413118, 1, 1, 1, 1, 1,
-0.2155208, 1.721335, 0.7572495, 1, 1, 1, 1, 1,
-0.2147164, 0.5968387, 0.6231545, 1, 1, 1, 1, 1,
-0.2092981, -0.9632066, -4.457104, 1, 1, 1, 1, 1,
-0.2089576, 0.3196941, -1.123051, 1, 1, 1, 1, 1,
-0.2064632, 1.444216, 1.706646, 1, 1, 1, 1, 1,
-0.2029134, -1.355957, -3.499276, 1, 1, 1, 1, 1,
-0.1988899, 2.585204, -0.2560469, 0, 0, 1, 1, 1,
-0.1965064, 0.7466254, -1.398015, 1, 0, 0, 1, 1,
-0.1943966, 1.69547, -0.2371802, 1, 0, 0, 1, 1,
-0.1939308, 0.7909474, -0.3492254, 1, 0, 0, 1, 1,
-0.1895834, 0.03696207, -1.855499, 1, 0, 0, 1, 1,
-0.1886009, -1.256256, -2.68146, 1, 0, 0, 1, 1,
-0.1884033, 0.5194961, -0.5031472, 0, 0, 0, 1, 1,
-0.1878922, -0.2738669, -2.784498, 0, 0, 0, 1, 1,
-0.1857599, -0.8728675, -2.221412, 0, 0, 0, 1, 1,
-0.1843606, -0.06914179, -1.494791, 0, 0, 0, 1, 1,
-0.183684, -1.566401, -2.963596, 0, 0, 0, 1, 1,
-0.1836128, 0.294071, 0.613447, 0, 0, 0, 1, 1,
-0.1802395, -1.447457, -2.686547, 0, 0, 0, 1, 1,
-0.1786984, 0.4553676, -0.4451541, 1, 1, 1, 1, 1,
-0.1691558, 1.008252, -1.137308, 1, 1, 1, 1, 1,
-0.1688721, -0.6207795, -1.538452, 1, 1, 1, 1, 1,
-0.1614114, -0.1959416, -2.805488, 1, 1, 1, 1, 1,
-0.1611761, 0.130114, -0.9447633, 1, 1, 1, 1, 1,
-0.1569575, -2.298662, -2.532459, 1, 1, 1, 1, 1,
-0.1566494, -2.261122, -2.281856, 1, 1, 1, 1, 1,
-0.1548304, 1.509145, 0.605956, 1, 1, 1, 1, 1,
-0.1539779, -0.9722745, -3.167723, 1, 1, 1, 1, 1,
-0.1532595, 1.049239, -1.790916, 1, 1, 1, 1, 1,
-0.1527052, 0.1127025, -1.292397, 1, 1, 1, 1, 1,
-0.1521825, -1.386805, -2.496969, 1, 1, 1, 1, 1,
-0.1416683, -1.353414, -2.966727, 1, 1, 1, 1, 1,
-0.1406412, -0.489804, -3.344111, 1, 1, 1, 1, 1,
-0.1387939, 1.602816, -0.6717173, 1, 1, 1, 1, 1,
-0.13519, 0.2306265, 0.124541, 0, 0, 1, 1, 1,
-0.1341916, 1.638103, -1.180009, 1, 0, 0, 1, 1,
-0.1327662, -1.414087, -3.319852, 1, 0, 0, 1, 1,
-0.1248404, 0.3903426, -0.8898337, 1, 0, 0, 1, 1,
-0.1244014, -0.1091022, -1.66396, 1, 0, 0, 1, 1,
-0.1222878, -0.7910227, -1.593806, 1, 0, 0, 1, 1,
-0.119437, -0.8363066, -3.644304, 0, 0, 0, 1, 1,
-0.1142209, -1.386143, -3.304875, 0, 0, 0, 1, 1,
-0.1124206, -0.804746, -2.516422, 0, 0, 0, 1, 1,
-0.1100248, -0.4437424, -3.554192, 0, 0, 0, 1, 1,
-0.109758, -1.033894, -2.354024, 0, 0, 0, 1, 1,
-0.1077149, 1.814303, 0.5288234, 0, 0, 0, 1, 1,
-0.1034103, 0.809328, -0.02836686, 0, 0, 0, 1, 1,
-0.09782582, 0.1777656, 2.299606, 1, 1, 1, 1, 1,
-0.09660779, -0.557685, -2.794884, 1, 1, 1, 1, 1,
-0.08694968, 0.4821445, 1.163228, 1, 1, 1, 1, 1,
-0.08601512, 0.6099788, 0.5972413, 1, 1, 1, 1, 1,
-0.08266853, 0.0757661, -1.666159, 1, 1, 1, 1, 1,
-0.07901388, 0.148936, 0.4429079, 1, 1, 1, 1, 1,
-0.07611077, -1.377743, -1.485149, 1, 1, 1, 1, 1,
-0.07596818, -0.5934686, -4.03637, 1, 1, 1, 1, 1,
-0.07533851, 1.477334, 1.028125, 1, 1, 1, 1, 1,
-0.06752985, -2.208145, -4.342037, 1, 1, 1, 1, 1,
-0.06700719, -1.300693, -4.183281, 1, 1, 1, 1, 1,
-0.06384007, 0.2536922, -0.9495537, 1, 1, 1, 1, 1,
-0.05581313, 0.5254074, -0.2544059, 1, 1, 1, 1, 1,
-0.05510867, -1.717447, -3.549869, 1, 1, 1, 1, 1,
-0.05494408, 0.9281894, 0.9834469, 1, 1, 1, 1, 1,
-0.05230692, -1.382598, -4.290215, 0, 0, 1, 1, 1,
-0.05045803, 0.6855457, 0.9539969, 1, 0, 0, 1, 1,
-0.05035024, -2.848351, -5.643029, 1, 0, 0, 1, 1,
-0.04986793, -1.427294, -2.911409, 1, 0, 0, 1, 1,
-0.04729184, -1.903395, -1.364339, 1, 0, 0, 1, 1,
-0.04728416, 0.930545, 0.144823, 1, 0, 0, 1, 1,
-0.04188782, 1.129917, -0.05858389, 0, 0, 0, 1, 1,
-0.04127826, 1.488027, -0.08255149, 0, 0, 0, 1, 1,
-0.03703713, 0.106183, 0.3772808, 0, 0, 0, 1, 1,
-0.03452416, 0.1282848, -1.2861, 0, 0, 0, 1, 1,
-0.03332024, 0.2557575, -1.096437, 0, 0, 0, 1, 1,
-0.03164442, -0.5850855, -3.958716, 0, 0, 0, 1, 1,
-0.02959949, -0.01265125, -1.728197, 0, 0, 0, 1, 1,
-0.0254017, 0.5033212, -0.05625334, 1, 1, 1, 1, 1,
-0.02300073, 0.06601238, 1.141907, 1, 1, 1, 1, 1,
-0.01843627, 0.2117699, 1.204386, 1, 1, 1, 1, 1,
-0.01835631, 1.093526, 0.929864, 1, 1, 1, 1, 1,
-0.008173693, 1.925794, -0.5017543, 1, 1, 1, 1, 1,
-0.00058679, 0.5344157, 0.7130026, 1, 1, 1, 1, 1,
0.0005030019, 0.476562, 0.157001, 1, 1, 1, 1, 1,
0.004299226, 0.175394, 0.3275088, 1, 1, 1, 1, 1,
0.009799661, 0.2463741, -0.007044666, 1, 1, 1, 1, 1,
0.01312321, -2.34859, 2.796171, 1, 1, 1, 1, 1,
0.0179309, -0.8811045, 3.002334, 1, 1, 1, 1, 1,
0.02252581, -0.7494717, 2.819816, 1, 1, 1, 1, 1,
0.0251219, -0.6846385, 1.741335, 1, 1, 1, 1, 1,
0.02655781, -0.5852677, 3.556783, 1, 1, 1, 1, 1,
0.02857246, -1.474695, 4.210253, 1, 1, 1, 1, 1,
0.03090771, 0.2651959, 1.214227, 0, 0, 1, 1, 1,
0.03145837, 0.1032748, -1.428548, 1, 0, 0, 1, 1,
0.03168282, -0.4280446, 4.011008, 1, 0, 0, 1, 1,
0.03438225, 0.4156947, -0.9556804, 1, 0, 0, 1, 1,
0.03801212, -0.5002189, 3.249292, 1, 0, 0, 1, 1,
0.03834876, 0.7198712, -0.2145118, 1, 0, 0, 1, 1,
0.03897809, 1.159048, 0.3052475, 0, 0, 0, 1, 1,
0.03946523, -1.710772, 3.515011, 0, 0, 0, 1, 1,
0.04213225, 0.717073, -0.4877007, 0, 0, 0, 1, 1,
0.04303176, 0.6141292, 0.8117049, 0, 0, 0, 1, 1,
0.04392556, -0.2010646, 2.373122, 0, 0, 0, 1, 1,
0.04452141, -0.02465696, 1.367753, 0, 0, 0, 1, 1,
0.04511231, 0.3804971, 1.745691, 0, 0, 0, 1, 1,
0.04656783, 0.2327358, -0.9909573, 1, 1, 1, 1, 1,
0.05300415, -0.3412696, 3.095057, 1, 1, 1, 1, 1,
0.05487766, -1.99763, 2.833368, 1, 1, 1, 1, 1,
0.05520085, -1.516415, 3.859182, 1, 1, 1, 1, 1,
0.0556148, -0.7420603, 3.319999, 1, 1, 1, 1, 1,
0.05583594, -0.6794642, 3.670565, 1, 1, 1, 1, 1,
0.05637175, -0.1383837, 3.553331, 1, 1, 1, 1, 1,
0.05719705, -0.6147797, 2.685819, 1, 1, 1, 1, 1,
0.05855193, -0.6034065, 3.653437, 1, 1, 1, 1, 1,
0.0622392, -0.3347143, 2.129456, 1, 1, 1, 1, 1,
0.06252898, 1.279285, -2.120557, 1, 1, 1, 1, 1,
0.06611955, -0.2498859, 1.172904, 1, 1, 1, 1, 1,
0.06871841, -1.640992, 3.196746, 1, 1, 1, 1, 1,
0.06925666, 1.493877, 0.2110144, 1, 1, 1, 1, 1,
0.07664205, -1.161455, 2.944348, 1, 1, 1, 1, 1,
0.08639487, -0.09837257, 1.211184, 0, 0, 1, 1, 1,
0.08658376, -1.241043, 3.873852, 1, 0, 0, 1, 1,
0.09097791, 1.405549, 0.02514517, 1, 0, 0, 1, 1,
0.09156307, -0.3248323, 3.25258, 1, 0, 0, 1, 1,
0.09343655, 0.9000351, 0.627152, 1, 0, 0, 1, 1,
0.09933323, 0.1491275, 1.798073, 1, 0, 0, 1, 1,
0.1078466, -0.5715494, 4.051088, 0, 0, 0, 1, 1,
0.1117851, -1.230942, 2.656443, 0, 0, 0, 1, 1,
0.1121029, 0.3366404, -1.132879, 0, 0, 0, 1, 1,
0.1128596, 0.3591357, 3.314583, 0, 0, 0, 1, 1,
0.1147683, -0.2931671, 1.539045, 0, 0, 0, 1, 1,
0.1156023, -1.38418, 4.522855, 0, 0, 0, 1, 1,
0.1181972, 0.9540745, -2.179713, 0, 0, 0, 1, 1,
0.1347405, 0.5239198, 0.8854236, 1, 1, 1, 1, 1,
0.1362368, -0.03472373, 1.973625, 1, 1, 1, 1, 1,
0.1393324, 0.5373912, 0.8278604, 1, 1, 1, 1, 1,
0.1413137, 0.5886697, 1.403933, 1, 1, 1, 1, 1,
0.141438, -0.4499969, 3.752803, 1, 1, 1, 1, 1,
0.1419428, -0.1880643, 2.966835, 1, 1, 1, 1, 1,
0.1445494, 1.003958, -0.8247969, 1, 1, 1, 1, 1,
0.14746, 0.8265341, 0.1011387, 1, 1, 1, 1, 1,
0.1538776, -0.2722318, 1.350785, 1, 1, 1, 1, 1,
0.1630376, -0.463441, 2.306148, 1, 1, 1, 1, 1,
0.1636713, 0.9300339, 0.4785735, 1, 1, 1, 1, 1,
0.1637443, 0.8457176, -0.3297367, 1, 1, 1, 1, 1,
0.1658206, 0.4799133, 1.653245, 1, 1, 1, 1, 1,
0.1685357, 0.01555607, 1.371073, 1, 1, 1, 1, 1,
0.168901, 0.9096605, -1.717873, 1, 1, 1, 1, 1,
0.1697483, -0.1385966, 2.564929, 0, 0, 1, 1, 1,
0.1700318, -0.06469859, 1.656184, 1, 0, 0, 1, 1,
0.1719383, -0.4959513, 2.547955, 1, 0, 0, 1, 1,
0.1751679, -1.459313, 4.22095, 1, 0, 0, 1, 1,
0.1760005, 0.7679982, -0.8648867, 1, 0, 0, 1, 1,
0.1782875, -1.376526, 2.585234, 1, 0, 0, 1, 1,
0.1838709, 0.7402892, 0.1548239, 0, 0, 0, 1, 1,
0.1866099, -0.9180778, 5.233295, 0, 0, 0, 1, 1,
0.1892533, -0.1569516, 4.561565, 0, 0, 0, 1, 1,
0.1910655, -1.816817, 2.08384, 0, 0, 0, 1, 1,
0.1921511, -0.1502002, 2.673815, 0, 0, 0, 1, 1,
0.1942631, 0.9163864, 1.473584, 0, 0, 0, 1, 1,
0.195144, 1.035017, -0.5131945, 0, 0, 0, 1, 1,
0.1964651, 1.397497, 0.4873067, 1, 1, 1, 1, 1,
0.1977434, 1.484555, -0.6614525, 1, 1, 1, 1, 1,
0.199034, 0.4566899, 0.08895882, 1, 1, 1, 1, 1,
0.2018081, 1.501854, 1.318967, 1, 1, 1, 1, 1,
0.2104612, 1.126265, 1.752618, 1, 1, 1, 1, 1,
0.2122369, 1.028458, -0.06838875, 1, 1, 1, 1, 1,
0.2140276, -0.06484478, 1.932166, 1, 1, 1, 1, 1,
0.2147181, 1.645486, -0.3648753, 1, 1, 1, 1, 1,
0.2197318, 0.6958817, -1.711827, 1, 1, 1, 1, 1,
0.2200631, -0.1984959, 2.234247, 1, 1, 1, 1, 1,
0.2293373, -0.3047808, 2.651982, 1, 1, 1, 1, 1,
0.2310112, 0.5005957, -0.05273899, 1, 1, 1, 1, 1,
0.2311864, -0.854392, 4.715027, 1, 1, 1, 1, 1,
0.2369082, 0.2703564, 0.2542777, 1, 1, 1, 1, 1,
0.2377903, -0.2749507, -0.728757, 1, 1, 1, 1, 1,
0.2393369, -0.1257836, 2.510858, 0, 0, 1, 1, 1,
0.2402285, 0.4338302, -0.1113356, 1, 0, 0, 1, 1,
0.2418624, -1.770926, 3.348181, 1, 0, 0, 1, 1,
0.2489142, 0.04582415, 2.016947, 1, 0, 0, 1, 1,
0.2507327, -2.331489, 2.490464, 1, 0, 0, 1, 1,
0.2546997, -1.546767, 3.659311, 1, 0, 0, 1, 1,
0.2567745, 0.5756397, -0.3708535, 0, 0, 0, 1, 1,
0.2579386, -0.7729705, 2.386204, 0, 0, 0, 1, 1,
0.2623179, -0.9607281, 2.574065, 0, 0, 0, 1, 1,
0.2652702, 0.3275087, 1.59003, 0, 0, 0, 1, 1,
0.2665415, -0.2688894, 1.642127, 0, 0, 0, 1, 1,
0.2704184, 2.940629, 0.5666271, 0, 0, 0, 1, 1,
0.2710432, 0.2964791, 0.9053741, 0, 0, 0, 1, 1,
0.2745773, -0.5848678, 1.943508, 1, 1, 1, 1, 1,
0.2789885, 0.1571229, 2.540236, 1, 1, 1, 1, 1,
0.2802228, -0.6382814, 2.806712, 1, 1, 1, 1, 1,
0.2802941, -1.146293, 2.724977, 1, 1, 1, 1, 1,
0.2830473, -1.095482, 2.687034, 1, 1, 1, 1, 1,
0.2885715, 0.4347228, -0.1688206, 1, 1, 1, 1, 1,
0.2902462, -0.8116906, 2.904351, 1, 1, 1, 1, 1,
0.2923662, 0.5482718, 1.381741, 1, 1, 1, 1, 1,
0.2937072, 0.1832036, 1.429509, 1, 1, 1, 1, 1,
0.2940348, -0.5136232, 2.289668, 1, 1, 1, 1, 1,
0.2956342, -0.7422268, 2.687421, 1, 1, 1, 1, 1,
0.2982175, 0.109555, 3.09594, 1, 1, 1, 1, 1,
0.3064197, -1.298907, 2.557211, 1, 1, 1, 1, 1,
0.3069191, -0.2557845, 4.746862, 1, 1, 1, 1, 1,
0.3077008, 1.011653, 1.015591, 1, 1, 1, 1, 1,
0.3121012, 0.8950385, 1.170117, 0, 0, 1, 1, 1,
0.3137103, 1.488719, 0.9767537, 1, 0, 0, 1, 1,
0.3185454, 0.1432923, 0.04394129, 1, 0, 0, 1, 1,
0.3229755, -0.9598164, 1.407923, 1, 0, 0, 1, 1,
0.3263366, -0.3846457, 1.762882, 1, 0, 0, 1, 1,
0.3309811, -0.949961, 1.933413, 1, 0, 0, 1, 1,
0.3326328, -0.8482352, 2.022492, 0, 0, 0, 1, 1,
0.3415488, -0.3500915, 2.419934, 0, 0, 0, 1, 1,
0.3423748, -0.8627093, 2.877661, 0, 0, 0, 1, 1,
0.342429, -2.445001, 3.558652, 0, 0, 0, 1, 1,
0.3472227, 0.2658401, 0.1591564, 0, 0, 0, 1, 1,
0.3499107, 0.3423086, 1.256562, 0, 0, 0, 1, 1,
0.35101, -0.4866278, 1.829291, 0, 0, 0, 1, 1,
0.3549692, -0.131169, 1.259244, 1, 1, 1, 1, 1,
0.3586231, 1.24742, -1.253167, 1, 1, 1, 1, 1,
0.3613762, -2.228768, 2.894145, 1, 1, 1, 1, 1,
0.3665464, 0.1648804, 1.332519, 1, 1, 1, 1, 1,
0.3686397, 0.5040513, 1.314421, 1, 1, 1, 1, 1,
0.3703588, 0.4545986, 2.11968, 1, 1, 1, 1, 1,
0.3729409, 0.0670886, 2.693446, 1, 1, 1, 1, 1,
0.3730609, -0.9113563, 2.260774, 1, 1, 1, 1, 1,
0.374055, 1.120369, -1.451385, 1, 1, 1, 1, 1,
0.3841493, -0.4077467, 2.708748, 1, 1, 1, 1, 1,
0.3878897, -0.4845457, 1.465636, 1, 1, 1, 1, 1,
0.3905016, 1.849643, 2.122062, 1, 1, 1, 1, 1,
0.391091, -0.2752527, 3.100155, 1, 1, 1, 1, 1,
0.3923101, 1.468538, -0.02437219, 1, 1, 1, 1, 1,
0.3944364, -1.372664, 4.69822, 1, 1, 1, 1, 1,
0.3945502, 0.1593025, 1.929004, 0, 0, 1, 1, 1,
0.4009514, 0.07472005, 1.065821, 1, 0, 0, 1, 1,
0.4025105, 0.8457608, -2.797155, 1, 0, 0, 1, 1,
0.4106291, -2.014538, 4.434855, 1, 0, 0, 1, 1,
0.4111676, -1.331899, 3.040885, 1, 0, 0, 1, 1,
0.4120258, -0.7339386, 1.772496, 1, 0, 0, 1, 1,
0.4149749, -1.279531, 2.524922, 0, 0, 0, 1, 1,
0.4181622, 0.6971698, -1.668401, 0, 0, 0, 1, 1,
0.4205349, -1.10245, 2.847747, 0, 0, 0, 1, 1,
0.4267909, -1.531611, 0.6087511, 0, 0, 0, 1, 1,
0.4277632, -0.426534, 1.412083, 0, 0, 0, 1, 1,
0.4279501, 0.03352555, 0.4627326, 0, 0, 0, 1, 1,
0.4291781, -0.2412158, 2.583905, 0, 0, 0, 1, 1,
0.4300162, 1.471973, -0.80391, 1, 1, 1, 1, 1,
0.4302908, 1.038292, 1.102131, 1, 1, 1, 1, 1,
0.4330252, -0.238498, 1.638507, 1, 1, 1, 1, 1,
0.4372216, -0.8160864, 3.412446, 1, 1, 1, 1, 1,
0.437426, -0.2905276, 3.133567, 1, 1, 1, 1, 1,
0.4375411, -0.1372192, 3.315034, 1, 1, 1, 1, 1,
0.4383932, 0.217945, 1.266721, 1, 1, 1, 1, 1,
0.4402765, 0.4182854, 2.432266, 1, 1, 1, 1, 1,
0.4421319, 0.0100941, 3.38141, 1, 1, 1, 1, 1,
0.4428828, 1.184028, 0.6345066, 1, 1, 1, 1, 1,
0.4440272, 0.02999767, 1.016496, 1, 1, 1, 1, 1,
0.4491937, -0.4178182, 0.735914, 1, 1, 1, 1, 1,
0.4501772, 1.393337, 1.297775, 1, 1, 1, 1, 1,
0.4517521, -1.047001, 3.399484, 1, 1, 1, 1, 1,
0.4528788, -0.29813, 1.584933, 1, 1, 1, 1, 1,
0.4577519, 0.1443622, 0.7513061, 0, 0, 1, 1, 1,
0.4717234, 0.8957778, 0.8293679, 1, 0, 0, 1, 1,
0.4758046, -1.275345, 2.916855, 1, 0, 0, 1, 1,
0.4843414, -0.02043397, 2.150954, 1, 0, 0, 1, 1,
0.484931, -0.8908572, 2.795485, 1, 0, 0, 1, 1,
0.4883806, -2.310052, 1.436304, 1, 0, 0, 1, 1,
0.48866, -0.8274271, 2.634521, 0, 0, 0, 1, 1,
0.4898601, -0.6345254, 1.688805, 0, 0, 0, 1, 1,
0.4907486, 0.7230284, 0.442705, 0, 0, 0, 1, 1,
0.4935587, -2.139976, 2.310164, 0, 0, 0, 1, 1,
0.49974, 0.4440859, 1.070501, 0, 0, 0, 1, 1,
0.5154278, 0.8002472, 1.37519, 0, 0, 0, 1, 1,
0.5182973, 0.4305627, -1.44567, 0, 0, 0, 1, 1,
0.5185109, 0.3090884, 2.530682, 1, 1, 1, 1, 1,
0.5203095, 0.01247661, 1.319941, 1, 1, 1, 1, 1,
0.5222737, -0.2652552, 3.108879, 1, 1, 1, 1, 1,
0.5250593, 0.02991215, 0.880738, 1, 1, 1, 1, 1,
0.5268703, 2.823068, 2.512712, 1, 1, 1, 1, 1,
0.5302763, 0.9771534, 0.7254987, 1, 1, 1, 1, 1,
0.5374591, -1.37827, 3.975264, 1, 1, 1, 1, 1,
0.5390044, 0.3703941, 0.4054425, 1, 1, 1, 1, 1,
0.5408791, 1.511242, 1.861754, 1, 1, 1, 1, 1,
0.5415152, 1.354306, -1.563471, 1, 1, 1, 1, 1,
0.5425752, 1.487519, -0.6051316, 1, 1, 1, 1, 1,
0.5502188, -1.273184, 1.288913, 1, 1, 1, 1, 1,
0.5502859, -0.2391857, 2.146361, 1, 1, 1, 1, 1,
0.5533337, -1.78049, 2.430882, 1, 1, 1, 1, 1,
0.5539473, 0.2995104, -0.2417917, 1, 1, 1, 1, 1,
0.5706331, 1.222726, 1.91004, 0, 0, 1, 1, 1,
0.5721372, -0.8948347, 0.3129337, 1, 0, 0, 1, 1,
0.5724673, -0.8090631, 2.234454, 1, 0, 0, 1, 1,
0.5726336, -0.7992352, 3.45873, 1, 0, 0, 1, 1,
0.5755175, 0.9692921, -0.5808386, 1, 0, 0, 1, 1,
0.575986, -0.3209983, 2.675148, 1, 0, 0, 1, 1,
0.5793495, 0.869641, 2.095839, 0, 0, 0, 1, 1,
0.5799896, 0.1228328, 2.002224, 0, 0, 0, 1, 1,
0.5815619, 1.512282, 0.1119076, 0, 0, 0, 1, 1,
0.5819127, 0.01190609, 2.367763, 0, 0, 0, 1, 1,
0.5823101, -0.8112676, 1.435897, 0, 0, 0, 1, 1,
0.5844736, 0.807037, 0.5121306, 0, 0, 0, 1, 1,
0.5893729, 0.129586, 1.143856, 0, 0, 0, 1, 1,
0.5906832, 0.2575659, -0.7570187, 1, 1, 1, 1, 1,
0.5927706, -1.21631, 3.73205, 1, 1, 1, 1, 1,
0.5944123, 1.66664, 1.2251, 1, 1, 1, 1, 1,
0.5976461, -0.08782198, 1.119617, 1, 1, 1, 1, 1,
0.5999131, 0.03508651, 1.870679, 1, 1, 1, 1, 1,
0.6001375, 0.5949261, -1.872327, 1, 1, 1, 1, 1,
0.6004217, -0.8112371, 3.494868, 1, 1, 1, 1, 1,
0.6074991, -1.803971, 2.108961, 1, 1, 1, 1, 1,
0.6080527, 0.4675092, 1.470191, 1, 1, 1, 1, 1,
0.6107374, -0.2205676, 0.8783342, 1, 1, 1, 1, 1,
0.6150311, -1.226947, 2.08005, 1, 1, 1, 1, 1,
0.615591, 1.45546, -0.2950736, 1, 1, 1, 1, 1,
0.625779, 1.702016, 0.3681202, 1, 1, 1, 1, 1,
0.6259698, -0.3649536, 2.757402, 1, 1, 1, 1, 1,
0.6260945, -2.511344, 2.958, 1, 1, 1, 1, 1,
0.6266738, -0.7923402, 2.777523, 0, 0, 1, 1, 1,
0.6368378, 1.709709, -0.8065755, 1, 0, 0, 1, 1,
0.6404724, -0.3888542, 2.640182, 1, 0, 0, 1, 1,
0.6431755, 0.9356876, 0.003203436, 1, 0, 0, 1, 1,
0.6434458, 0.07229838, 1.439138, 1, 0, 0, 1, 1,
0.6470551, 0.5718117, 0.1743623, 1, 0, 0, 1, 1,
0.6485019, 1.219109, 0.04609917, 0, 0, 0, 1, 1,
0.6521845, -0.5687492, 1.569076, 0, 0, 0, 1, 1,
0.6556089, 0.3877977, 0.1405387, 0, 0, 0, 1, 1,
0.6563212, -2.528042, 0.2312372, 0, 0, 0, 1, 1,
0.658544, 1.328431, -0.7888361, 0, 0, 0, 1, 1,
0.6607379, 2.158493, -0.2551664, 0, 0, 0, 1, 1,
0.6627851, -0.09286989, 2.307945, 0, 0, 0, 1, 1,
0.6643461, 0.1458048, 2.624458, 1, 1, 1, 1, 1,
0.6715314, 1.061285, 0.2730842, 1, 1, 1, 1, 1,
0.6752558, 1.637724, 0.4156366, 1, 1, 1, 1, 1,
0.6785162, 2.131678, 0.174055, 1, 1, 1, 1, 1,
0.6788586, 0.4623041, 0.860683, 1, 1, 1, 1, 1,
0.679118, 1.35473, -1.348921, 1, 1, 1, 1, 1,
0.6880538, 0.03845983, 0.5888234, 1, 1, 1, 1, 1,
0.6925059, 0.9825934, 1.012573, 1, 1, 1, 1, 1,
0.6927049, 1.624428, 1.984493, 1, 1, 1, 1, 1,
0.6928318, 1.174459, 0.3010418, 1, 1, 1, 1, 1,
0.7017448, 0.9690043, 0.6680883, 1, 1, 1, 1, 1,
0.7025843, 0.5723584, -0.2090603, 1, 1, 1, 1, 1,
0.7048413, -0.03720477, 0.9270142, 1, 1, 1, 1, 1,
0.7069863, 0.0311512, 2.539996, 1, 1, 1, 1, 1,
0.7146139, 2.205933, 0.8066927, 1, 1, 1, 1, 1,
0.7353114, 0.5864262, 0.4478675, 0, 0, 1, 1, 1,
0.7396919, 1.06256, -1.493636, 1, 0, 0, 1, 1,
0.7402318, -0.4532427, 3.058781, 1, 0, 0, 1, 1,
0.7437813, -0.2139351, 2.716805, 1, 0, 0, 1, 1,
0.7445459, -1.11453, 4.824501, 1, 0, 0, 1, 1,
0.7454066, 0.1704229, 1.091292, 1, 0, 0, 1, 1,
0.7501081, 0.2771176, 1.997602, 0, 0, 0, 1, 1,
0.7561213, -0.4777867, 3.289376, 0, 0, 0, 1, 1,
0.7587293, -2.195382, 1.205716, 0, 0, 0, 1, 1,
0.7647492, 0.1313049, 1.046358, 0, 0, 0, 1, 1,
0.7670146, 0.9949213, 0.6823912, 0, 0, 0, 1, 1,
0.7677226, 1.41453, -0.4856081, 0, 0, 0, 1, 1,
0.7703745, -1.511631, 2.158911, 0, 0, 0, 1, 1,
0.7707456, 0.3300286, 2.842577, 1, 1, 1, 1, 1,
0.7765107, 0.315086, 2.447231, 1, 1, 1, 1, 1,
0.7833473, 0.6574596, 1.314101, 1, 1, 1, 1, 1,
0.7945707, -0.1106661, 2.176523, 1, 1, 1, 1, 1,
0.8063228, 0.3353632, 1.468804, 1, 1, 1, 1, 1,
0.807053, -0.1743853, -0.04480497, 1, 1, 1, 1, 1,
0.814393, 0.5131661, -0.9183115, 1, 1, 1, 1, 1,
0.8146374, 0.0008430007, 0.7666246, 1, 1, 1, 1, 1,
0.8153255, -0.506753, 2.762479, 1, 1, 1, 1, 1,
0.8246066, 0.5225138, 1.616834, 1, 1, 1, 1, 1,
0.827454, 0.2202747, 0.02651143, 1, 1, 1, 1, 1,
0.8392385, -2.173278, 4.13464, 1, 1, 1, 1, 1,
0.8396183, 0.2133797, 0.07724473, 1, 1, 1, 1, 1,
0.8420497, 0.2806751, 1.724681, 1, 1, 1, 1, 1,
0.8459912, 0.3844299, 1.445704, 1, 1, 1, 1, 1,
0.8474427, -1.591178, 1.321638, 0, 0, 1, 1, 1,
0.8501422, 0.01350098, -0.08183975, 1, 0, 0, 1, 1,
0.8503398, 0.8625438, 0.6990227, 1, 0, 0, 1, 1,
0.8530045, -0.1028803, 1.472816, 1, 0, 0, 1, 1,
0.8535735, 1.294492, -0.2524839, 1, 0, 0, 1, 1,
0.8569061, 0.4381535, 1.454929, 1, 0, 0, 1, 1,
0.8591816, -0.2607481, 0.6960599, 0, 0, 0, 1, 1,
0.8601469, -0.4666539, 0.4387178, 0, 0, 0, 1, 1,
0.8642259, -0.4975734, -0.996025, 0, 0, 0, 1, 1,
0.8746044, 0.004250046, 0.9868474, 0, 0, 0, 1, 1,
0.8751528, -0.7762465, 2.133133, 0, 0, 0, 1, 1,
0.8817359, 1.177132, 1.826762, 0, 0, 0, 1, 1,
0.8877679, -0.6896251, 2.367108, 0, 0, 0, 1, 1,
0.8884217, 1.733413, 0.9602622, 1, 1, 1, 1, 1,
0.8887213, 0.5524814, 0.7076927, 1, 1, 1, 1, 1,
0.8914146, 0.5814591, 0.154446, 1, 1, 1, 1, 1,
0.8954939, -0.8557363, 4.384371, 1, 1, 1, 1, 1,
0.9023011, -0.6967627, 3.476873, 1, 1, 1, 1, 1,
0.903606, -0.4493366, 0.4473512, 1, 1, 1, 1, 1,
0.9049423, 1.418955, 1.658809, 1, 1, 1, 1, 1,
0.9176959, 1.246696, 0.442286, 1, 1, 1, 1, 1,
0.9223657, 1.528703, 0.3019181, 1, 1, 1, 1, 1,
0.9240063, 0.298942, 1.181182, 1, 1, 1, 1, 1,
0.9244712, 0.06989425, -0.06946222, 1, 1, 1, 1, 1,
0.928065, 1.88187, -0.8096766, 1, 1, 1, 1, 1,
0.9331697, 0.2175073, 0.6588244, 1, 1, 1, 1, 1,
0.9356752, -1.743075, 3.198575, 1, 1, 1, 1, 1,
0.9367144, -0.5690873, 1.495434, 1, 1, 1, 1, 1,
0.9367879, -1.492867, 2.528848, 0, 0, 1, 1, 1,
0.9395063, -1.346678, 2.343141, 1, 0, 0, 1, 1,
0.9399586, -0.01077123, 1.149346, 1, 0, 0, 1, 1,
0.9413792, -0.1779865, 3.917447, 1, 0, 0, 1, 1,
0.9501162, 0.7254864, 1.594613, 1, 0, 0, 1, 1,
0.9529521, 0.2827455, 3.563839, 1, 0, 0, 1, 1,
0.9542317, 1.015299, 1.530259, 0, 0, 0, 1, 1,
0.9547107, -0.1617596, 2.679305, 0, 0, 0, 1, 1,
0.9577227, 0.6958453, 1.576519, 0, 0, 0, 1, 1,
0.9598287, 0.6875665, 1.051616, 0, 0, 0, 1, 1,
0.9641799, 0.2580663, 3.484206, 0, 0, 0, 1, 1,
0.9705294, 1.364608, -0.9446567, 0, 0, 0, 1, 1,
0.9732229, 0.8816425, 1.19006, 0, 0, 0, 1, 1,
0.9770464, 0.4020866, 1.302328, 1, 1, 1, 1, 1,
0.977852, 1.154016, 0.1364784, 1, 1, 1, 1, 1,
0.979148, 0.2607182, 1.916466, 1, 1, 1, 1, 1,
0.9804496, -1.272547, 2.235398, 1, 1, 1, 1, 1,
0.9824958, -1.034977, 0.7743313, 1, 1, 1, 1, 1,
0.9899426, 0.8037742, -0.1896553, 1, 1, 1, 1, 1,
0.9933807, 0.2831093, 2.364093, 1, 1, 1, 1, 1,
0.9943064, -1.572116, 4.381441, 1, 1, 1, 1, 1,
0.9949262, -1.776769, 3.488535, 1, 1, 1, 1, 1,
1.002162, 0.0379702, 0.9517026, 1, 1, 1, 1, 1,
1.005326, 0.2303144, 0.6984299, 1, 1, 1, 1, 1,
1.007563, -1.217881, 3.057012, 1, 1, 1, 1, 1,
1.013294, -1.132539, 2.334016, 1, 1, 1, 1, 1,
1.013948, 0.7786644, 1.557361, 1, 1, 1, 1, 1,
1.01467, 0.1754515, 2.511634, 1, 1, 1, 1, 1,
1.019946, 0.3820421, 2.200635, 0, 0, 1, 1, 1,
1.026313, -0.04272579, 2.615317, 1, 0, 0, 1, 1,
1.02754, 0.4515155, -0.2048616, 1, 0, 0, 1, 1,
1.028827, 1.90756, -0.9628648, 1, 0, 0, 1, 1,
1.036949, 1.532985, -0.914894, 1, 0, 0, 1, 1,
1.040205, -0.751034, 0.5952439, 1, 0, 0, 1, 1,
1.047542, -0.08484315, 0.3023982, 0, 0, 0, 1, 1,
1.049055, -0.1491605, 1.227533, 0, 0, 0, 1, 1,
1.052848, -0.5380682, 2.639352, 0, 0, 0, 1, 1,
1.05316, -2.354338, 2.742599, 0, 0, 0, 1, 1,
1.059837, 1.674055, 0.005493824, 0, 0, 0, 1, 1,
1.062491, -1.091755, 1.244335, 0, 0, 0, 1, 1,
1.063112, 1.077842, 1.391142, 0, 0, 0, 1, 1,
1.065438, 0.7673836, -0.05254805, 1, 1, 1, 1, 1,
1.066684, 0.3992414, 1.160931, 1, 1, 1, 1, 1,
1.069158, 0.7152489, 1.208263, 1, 1, 1, 1, 1,
1.07086, -1.06731, 1.818065, 1, 1, 1, 1, 1,
1.07091, -0.4882187, 1.413296, 1, 1, 1, 1, 1,
1.074688, 0.2836058, 1.78731, 1, 1, 1, 1, 1,
1.081903, -0.5568745, 1.949412, 1, 1, 1, 1, 1,
1.087169, 0.8177115, 1.751597, 1, 1, 1, 1, 1,
1.089242, 0.2108455, 0.9188692, 1, 1, 1, 1, 1,
1.089308, -1.018599, 0.6430967, 1, 1, 1, 1, 1,
1.089641, -1.337304, 1.366276, 1, 1, 1, 1, 1,
1.091272, -0.05536952, 1.518705, 1, 1, 1, 1, 1,
1.092535, 2.028186, 0.130511, 1, 1, 1, 1, 1,
1.097013, 0.3829909, 1.465496, 1, 1, 1, 1, 1,
1.101731, -1.113467, 3.161256, 1, 1, 1, 1, 1,
1.123303, -0.3419541, 2.286885, 0, 0, 1, 1, 1,
1.129141, 0.6624977, 1.33356, 1, 0, 0, 1, 1,
1.135266, 0.3040211, 0.05053414, 1, 0, 0, 1, 1,
1.139037, -0.08638383, 2.73348, 1, 0, 0, 1, 1,
1.166032, -2.320778, 1.832847, 1, 0, 0, 1, 1,
1.169033, -0.3114406, -0.5025812, 1, 0, 0, 1, 1,
1.173032, -1.847705, 1.739545, 0, 0, 0, 1, 1,
1.173714, 0.1632353, 0.6811434, 0, 0, 0, 1, 1,
1.174807, 0.7981744, -0.04763819, 0, 0, 0, 1, 1,
1.179383, -0.5876896, 1.336587, 0, 0, 0, 1, 1,
1.18005, -0.4362664, 0.6675718, 0, 0, 0, 1, 1,
1.18881, 0.1299731, 0.4000888, 0, 0, 0, 1, 1,
1.189952, -0.9450211, 3.096675, 0, 0, 0, 1, 1,
1.191411, 0.3277592, 2.533358, 1, 1, 1, 1, 1,
1.197722, 0.4046192, 0.139645, 1, 1, 1, 1, 1,
1.211648, -0.7262993, 2.761937, 1, 1, 1, 1, 1,
1.226429, -0.319207, 3.197728, 1, 1, 1, 1, 1,
1.229486, -0.351483, 2.12817, 1, 1, 1, 1, 1,
1.231395, 0.4199031, 1.947653, 1, 1, 1, 1, 1,
1.233591, -0.3400883, 0.808751, 1, 1, 1, 1, 1,
1.253667, 1.345639, 0.4151979, 1, 1, 1, 1, 1,
1.255973, 1.017315, 1.587672, 1, 1, 1, 1, 1,
1.25705, 0.02661446, 1.428769, 1, 1, 1, 1, 1,
1.257203, -1.551826, 2.517541, 1, 1, 1, 1, 1,
1.25947, 0.7085077, 0.2146596, 1, 1, 1, 1, 1,
1.266477, 1.313111, 1.366668, 1, 1, 1, 1, 1,
1.268248, 0.8356847, 1.821383, 1, 1, 1, 1, 1,
1.270885, -1.220666, 1.748405, 1, 1, 1, 1, 1,
1.275154, -0.1636339, 3.110021, 0, 0, 1, 1, 1,
1.279333, 0.1852016, 0.7999023, 1, 0, 0, 1, 1,
1.279537, 0.251817, 2.43949, 1, 0, 0, 1, 1,
1.283461, 0.6141652, 0.05132955, 1, 0, 0, 1, 1,
1.290861, 0.3984853, 0.3280047, 1, 0, 0, 1, 1,
1.297303, -0.4182351, 2.133925, 1, 0, 0, 1, 1,
1.311041, -2.09043, 3.321903, 0, 0, 0, 1, 1,
1.314096, -0.711294, 3.42145, 0, 0, 0, 1, 1,
1.323208, -0.3617036, 1.233165, 0, 0, 0, 1, 1,
1.326546, -0.4626105, 1.353967, 0, 0, 0, 1, 1,
1.342297, -1.293269, 2.065688, 0, 0, 0, 1, 1,
1.343096, -0.5315496, 1.709165, 0, 0, 0, 1, 1,
1.345991, -0.7206325, -0.1242496, 0, 0, 0, 1, 1,
1.351369, 0.9098958, 1.38588, 1, 1, 1, 1, 1,
1.351614, 1.870424, 1.739372, 1, 1, 1, 1, 1,
1.360949, -1.341269, 2.714666, 1, 1, 1, 1, 1,
1.361973, -1.045144, 1.650204, 1, 1, 1, 1, 1,
1.372804, 1.531988, 0.4281854, 1, 1, 1, 1, 1,
1.379699, -1.153056, 1.572866, 1, 1, 1, 1, 1,
1.38466, -0.9222661, 1.829814, 1, 1, 1, 1, 1,
1.390211, 0.5911724, -0.4679093, 1, 1, 1, 1, 1,
1.39451, 1.037297, -0.3924987, 1, 1, 1, 1, 1,
1.395785, -2.028938, -0.6054595, 1, 1, 1, 1, 1,
1.3974, 0.7166228, 0.9361559, 1, 1, 1, 1, 1,
1.403153, 0.144385, -0.06375316, 1, 1, 1, 1, 1,
1.404217, 0.2506248, 0.8488302, 1, 1, 1, 1, 1,
1.411389, 0.2003663, 0.4350382, 1, 1, 1, 1, 1,
1.412061, -2.016187, 2.105392, 1, 1, 1, 1, 1,
1.412776, 0.8292245, 1.152953, 0, 0, 1, 1, 1,
1.429563, -0.4230901, 0.5561855, 1, 0, 0, 1, 1,
1.436892, 2.141547, 0.02356534, 1, 0, 0, 1, 1,
1.436946, 0.4799053, -0.2399633, 1, 0, 0, 1, 1,
1.438344, -1.275672, 2.911672, 1, 0, 0, 1, 1,
1.44056, -0.01757321, 1.942224, 1, 0, 0, 1, 1,
1.444072, -0.3906163, 0.9997241, 0, 0, 0, 1, 1,
1.446359, -1.094041, 4.416504, 0, 0, 0, 1, 1,
1.45414, 0.4214918, 1.045898, 0, 0, 0, 1, 1,
1.470344, -0.8152387, 2.91006, 0, 0, 0, 1, 1,
1.472961, 1.488874, 0.02728952, 0, 0, 0, 1, 1,
1.48313, 0.5331305, 1.204092, 0, 0, 0, 1, 1,
1.484413, 0.07619332, 1.94499, 0, 0, 0, 1, 1,
1.487357, -1.442779, 2.562483, 1, 1, 1, 1, 1,
1.492799, -1.090011, 1.381107, 1, 1, 1, 1, 1,
1.504584, -0.4857329, 1.509113, 1, 1, 1, 1, 1,
1.515685, -0.1472548, 1.843273, 1, 1, 1, 1, 1,
1.518507, -0.4933931, 2.325003, 1, 1, 1, 1, 1,
1.526457, -0.3869197, 2.296896, 1, 1, 1, 1, 1,
1.531427, -0.1731534, 1.169097, 1, 1, 1, 1, 1,
1.542753, -0.2437141, 1.131717, 1, 1, 1, 1, 1,
1.543175, 1.00253, 1.277292, 1, 1, 1, 1, 1,
1.54533, 0.09525055, -0.1121459, 1, 1, 1, 1, 1,
1.554742, 0.3901387, 2.432599, 1, 1, 1, 1, 1,
1.575386, 1.280107, 0.8194125, 1, 1, 1, 1, 1,
1.577057, 0.8740509, 0.4532467, 1, 1, 1, 1, 1,
1.594066, 2.268349, -1.845223, 1, 1, 1, 1, 1,
1.606775, 1.079537, 0.4833954, 1, 1, 1, 1, 1,
1.617069, -1.916086, 1.379729, 0, 0, 1, 1, 1,
1.641902, -0.0009058844, 1.963549, 1, 0, 0, 1, 1,
1.646536, -0.9754497, 2.937581, 1, 0, 0, 1, 1,
1.647328, 0.5556101, 2.002661, 1, 0, 0, 1, 1,
1.650303, -0.4370317, 0.9614053, 1, 0, 0, 1, 1,
1.657907, -0.5009984, 1.145273, 1, 0, 0, 1, 1,
1.668938, 0.3194174, -0.9448367, 0, 0, 0, 1, 1,
1.684498, -1.935583, 2.922451, 0, 0, 0, 1, 1,
1.689053, 1.318874, 2.200107, 0, 0, 0, 1, 1,
1.717225, -0.3720857, 2.623258, 0, 0, 0, 1, 1,
1.742639, -0.6513661, 2.793781, 0, 0, 0, 1, 1,
1.755182, -0.01073445, 2.297309, 0, 0, 0, 1, 1,
1.76166, 0.714679, 1.400743, 0, 0, 0, 1, 1,
1.761718, -0.9867257, 1.678612, 1, 1, 1, 1, 1,
1.763321, -1.329951, 2.790645, 1, 1, 1, 1, 1,
1.774054, 0.1352359, 1.159126, 1, 1, 1, 1, 1,
1.809651, 1.656964, 1.546979, 1, 1, 1, 1, 1,
1.821188, 0.519808, 2.549819, 1, 1, 1, 1, 1,
1.863561, 0.005236018, 1.989006, 1, 1, 1, 1, 1,
1.868631, -0.7638307, 0.5231601, 1, 1, 1, 1, 1,
1.879651, 0.9477555, -0.3264623, 1, 1, 1, 1, 1,
1.928415, 0.7887896, 1.995037, 1, 1, 1, 1, 1,
1.941665, 0.466836, 1.507395, 1, 1, 1, 1, 1,
1.953936, -0.512581, 2.413727, 1, 1, 1, 1, 1,
1.958724, 0.05503409, 1.532739, 1, 1, 1, 1, 1,
1.978221, 0.221309, 1.96964, 1, 1, 1, 1, 1,
2.03144, -1.204234, 2.158838, 1, 1, 1, 1, 1,
2.068065, -0.6397063, 0.7760456, 1, 1, 1, 1, 1,
2.078577, 2.435214, 0.8781825, 0, 0, 1, 1, 1,
2.093539, 0.5095038, 2.131233, 1, 0, 0, 1, 1,
2.154054, 0.2791103, 1.159714, 1, 0, 0, 1, 1,
2.165383, -1.876627, 2.070102, 1, 0, 0, 1, 1,
2.181247, -0.2314416, 2.043974, 1, 0, 0, 1, 1,
2.207358, 0.5274886, -0.2188438, 1, 0, 0, 1, 1,
2.20794, -1.841284, 3.003999, 0, 0, 0, 1, 1,
2.215276, -0.7111162, -0.2885102, 0, 0, 0, 1, 1,
2.232077, -0.2924434, 2.245118, 0, 0, 0, 1, 1,
2.290354, 0.9950908, 1.861678, 0, 0, 0, 1, 1,
2.307729, -0.1020807, 1.691741, 0, 0, 0, 1, 1,
2.318066, -0.1025109, 2.281871, 0, 0, 0, 1, 1,
2.366358, -0.8551618, 2.089223, 0, 0, 0, 1, 1,
2.625664, 0.08169412, 0.5979024, 1, 1, 1, 1, 1,
2.824193, -0.2254111, 1.572302, 1, 1, 1, 1, 1,
2.99342, 0.6974873, 1.51359, 1, 1, 1, 1, 1,
2.993599, -0.3140089, 2.681327, 1, 1, 1, 1, 1,
3.047199, 0.03082137, 1.800308, 1, 1, 1, 1, 1,
3.218824, -1.295759, 4.027278, 1, 1, 1, 1, 1,
3.230544, -0.6451147, 1.919835, 1, 1, 1, 1, 1
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
var radius = 9.745667;
var distance = 34.23124;
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
mvMatrix.translate( 0.09382439, 0.09149981, 0.2048669 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23124);
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
