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
-3.447912, 0.2874672, -1.977286, 1, 0, 0, 1,
-2.814934, -0.7074999, -0.0359895, 1, 0.007843138, 0, 1,
-2.603184, 0.0133484, -1.812727, 1, 0.01176471, 0, 1,
-2.510676, 0.7601646, -1.117078, 1, 0.01960784, 0, 1,
-2.441993, 0.3075725, -0.8770266, 1, 0.02352941, 0, 1,
-2.412179, -0.8103036, -1.389401, 1, 0.03137255, 0, 1,
-2.410592, 0.8751009, -2.336885, 1, 0.03529412, 0, 1,
-2.385971, -0.2573728, -0.729584, 1, 0.04313726, 0, 1,
-2.362671, 0.2061431, -1.955192, 1, 0.04705882, 0, 1,
-2.362072, -0.5892115, -2.59246, 1, 0.05490196, 0, 1,
-2.294097, 0.8745975, -1.706078, 1, 0.05882353, 0, 1,
-2.242315, -0.5000418, -2.483658, 1, 0.06666667, 0, 1,
-2.231216, 0.2630346, -0.301734, 1, 0.07058824, 0, 1,
-2.172176, 0.9089831, -1.286821, 1, 0.07843138, 0, 1,
-2.153494, -1.659198, -1.485121, 1, 0.08235294, 0, 1,
-2.1479, -0.5296877, -1.960065, 1, 0.09019608, 0, 1,
-2.131173, -1.523869, -1.528829, 1, 0.09411765, 0, 1,
-2.094942, -0.8462624, -1.114973, 1, 0.1019608, 0, 1,
-2.089348, -0.8754374, -2.59627, 1, 0.1098039, 0, 1,
-2.046, 1.195647, -1.095827, 1, 0.1137255, 0, 1,
-1.999109, -1.116473, -2.717619, 1, 0.1215686, 0, 1,
-1.998203, 0.0177476, -0.6186459, 1, 0.1254902, 0, 1,
-1.982776, -0.03092436, -0.9468199, 1, 0.1333333, 0, 1,
-1.975955, 0.9835335, -0.356638, 1, 0.1372549, 0, 1,
-1.944556, -2.318458, -3.791058, 1, 0.145098, 0, 1,
-1.933249, 0.3808929, -0.6313999, 1, 0.1490196, 0, 1,
-1.887793, -2.340918, -3.244188, 1, 0.1568628, 0, 1,
-1.87982, -1.21701, -2.637528, 1, 0.1607843, 0, 1,
-1.879755, -1.394398, -1.673382, 1, 0.1686275, 0, 1,
-1.802837, -0.3523217, -2.809616, 1, 0.172549, 0, 1,
-1.801139, -0.1278977, 0.2709173, 1, 0.1803922, 0, 1,
-1.799965, -1.118422, -3.731233, 1, 0.1843137, 0, 1,
-1.79967, -0.6477844, -0.1687166, 1, 0.1921569, 0, 1,
-1.769864, -0.7556409, -0.3774906, 1, 0.1960784, 0, 1,
-1.764383, -0.2627244, -1.841824, 1, 0.2039216, 0, 1,
-1.755154, 0.6732156, 0.3104086, 1, 0.2117647, 0, 1,
-1.753338, -0.1059383, -1.119428, 1, 0.2156863, 0, 1,
-1.752052, 0.1506096, -1.910644, 1, 0.2235294, 0, 1,
-1.747212, 0.628798, 0.3860243, 1, 0.227451, 0, 1,
-1.743895, 0.2572482, -3.352311, 1, 0.2352941, 0, 1,
-1.731764, -0.3767247, 0.1343764, 1, 0.2392157, 0, 1,
-1.711499, 0.3235994, -1.111561, 1, 0.2470588, 0, 1,
-1.70418, -1.038669, -1.863974, 1, 0.2509804, 0, 1,
-1.703849, -2.131057, -1.881931, 1, 0.2588235, 0, 1,
-1.702702, -1.070646, -1.342845, 1, 0.2627451, 0, 1,
-1.695604, 1.845103, -0.5634748, 1, 0.2705882, 0, 1,
-1.68088, 0.6891283, -1.335238, 1, 0.2745098, 0, 1,
-1.679958, 0.3341569, -2.494955, 1, 0.282353, 0, 1,
-1.674964, -0.5076863, -2.131487, 1, 0.2862745, 0, 1,
-1.655014, -1.039848, -3.138179, 1, 0.2941177, 0, 1,
-1.595642, 0.2340609, -2.490564, 1, 0.3019608, 0, 1,
-1.58387, -0.2761597, -2.571578, 1, 0.3058824, 0, 1,
-1.562776, 1.602071, -0.4897478, 1, 0.3137255, 0, 1,
-1.557701, 0.5990846, -1.739034, 1, 0.3176471, 0, 1,
-1.556187, -0.4987265, -3.658525, 1, 0.3254902, 0, 1,
-1.554402, -0.2547973, -2.459818, 1, 0.3294118, 0, 1,
-1.550943, 1.657204, -3.503049, 1, 0.3372549, 0, 1,
-1.540916, -0.6737892, -1.019838, 1, 0.3411765, 0, 1,
-1.52895, -0.6379612, -2.344473, 1, 0.3490196, 0, 1,
-1.527934, -1.928813, -3.351196, 1, 0.3529412, 0, 1,
-1.526435, -0.6239508, -2.180126, 1, 0.3607843, 0, 1,
-1.513995, -0.2916448, -1.816806, 1, 0.3647059, 0, 1,
-1.510074, -0.4765839, -1.397161, 1, 0.372549, 0, 1,
-1.493913, -1.63423, -3.603823, 1, 0.3764706, 0, 1,
-1.485588, -0.03345917, -1.728076, 1, 0.3843137, 0, 1,
-1.480888, -1.456701, -2.869381, 1, 0.3882353, 0, 1,
-1.472614, -0.1609743, -1.925714, 1, 0.3960784, 0, 1,
-1.462731, -1.309086, -1.298569, 1, 0.4039216, 0, 1,
-1.46005, -0.7746574, -2.311127, 1, 0.4078431, 0, 1,
-1.458636, -0.6230591, -3.260926, 1, 0.4156863, 0, 1,
-1.442808, 0.01775588, -2.785625, 1, 0.4196078, 0, 1,
-1.442692, -1.633645, -2.1565, 1, 0.427451, 0, 1,
-1.437439, -0.6563956, 0.1221422, 1, 0.4313726, 0, 1,
-1.432658, 0.747023, -1.986712, 1, 0.4392157, 0, 1,
-1.429271, 0.7312309, -0.0861772, 1, 0.4431373, 0, 1,
-1.414704, 0.3677339, -1.525469, 1, 0.4509804, 0, 1,
-1.413763, 0.1341007, -2.075513, 1, 0.454902, 0, 1,
-1.406346, -0.8787833, -3.044067, 1, 0.4627451, 0, 1,
-1.388028, -1.016889, -2.200806, 1, 0.4666667, 0, 1,
-1.375987, 1.381723, -0.8374245, 1, 0.4745098, 0, 1,
-1.362028, -0.280524, -3.463795, 1, 0.4784314, 0, 1,
-1.344321, -0.9691331, -1.212524, 1, 0.4862745, 0, 1,
-1.342375, -1.484011, 0.3610626, 1, 0.4901961, 0, 1,
-1.337467, 1.452735, 0.5276567, 1, 0.4980392, 0, 1,
-1.32922, 0.2313798, -1.433923, 1, 0.5058824, 0, 1,
-1.326503, 0.2441655, -2.867622, 1, 0.509804, 0, 1,
-1.306032, -0.1477349, -2.264875, 1, 0.5176471, 0, 1,
-1.293843, 0.822139, -0.7513084, 1, 0.5215687, 0, 1,
-1.291395, 0.5490438, -0.1424532, 1, 0.5294118, 0, 1,
-1.291275, -0.6337334, -1.105924, 1, 0.5333334, 0, 1,
-1.291209, 0.9600089, -0.3006755, 1, 0.5411765, 0, 1,
-1.282453, -0.4942423, -1.76746, 1, 0.5450981, 0, 1,
-1.272429, -0.187389, -0.9846855, 1, 0.5529412, 0, 1,
-1.270129, -1.00299, -1.828873, 1, 0.5568628, 0, 1,
-1.256644, -0.5242014, -1.440625, 1, 0.5647059, 0, 1,
-1.253785, -1.107291, -2.920053, 1, 0.5686275, 0, 1,
-1.248847, -0.2358564, -1.738556, 1, 0.5764706, 0, 1,
-1.244598, 1.347937, -0.9926425, 1, 0.5803922, 0, 1,
-1.236644, -1.810813, -1.828349, 1, 0.5882353, 0, 1,
-1.232777, -0.03324543, -0.3552166, 1, 0.5921569, 0, 1,
-1.228303, -0.01472351, -1.623517, 1, 0.6, 0, 1,
-1.22808, 0.5526922, -0.8024648, 1, 0.6078432, 0, 1,
-1.222724, -0.6646666, -2.095073, 1, 0.6117647, 0, 1,
-1.216552, -1.684017, -1.761001, 1, 0.6196079, 0, 1,
-1.214595, -0.8080878, -0.2035151, 1, 0.6235294, 0, 1,
-1.210316, -1.873302, -2.895757, 1, 0.6313726, 0, 1,
-1.210046, -0.9769971, -1.533264, 1, 0.6352941, 0, 1,
-1.204409, -2.287338, -0.6509552, 1, 0.6431373, 0, 1,
-1.200706, 0.5588039, -0.7499897, 1, 0.6470588, 0, 1,
-1.190415, -0.7792639, -0.03197787, 1, 0.654902, 0, 1,
-1.190133, -0.06581077, -1.962841, 1, 0.6588235, 0, 1,
-1.182219, 0.2079514, -0.403675, 1, 0.6666667, 0, 1,
-1.17238, -1.339902, -2.755748, 1, 0.6705883, 0, 1,
-1.165722, -0.1198776, -2.245869, 1, 0.6784314, 0, 1,
-1.160954, -0.3196185, 0.625071, 1, 0.682353, 0, 1,
-1.160189, -1.309472, -3.425871, 1, 0.6901961, 0, 1,
-1.142933, -0.7054169, -3.396661, 1, 0.6941177, 0, 1,
-1.141121, -0.392518, -2.664223, 1, 0.7019608, 0, 1,
-1.138459, 0.05758986, 0.4407967, 1, 0.7098039, 0, 1,
-1.135149, -0.251664, -2.924337, 1, 0.7137255, 0, 1,
-1.129594, 0.9214073, 0.1672914, 1, 0.7215686, 0, 1,
-1.117506, -0.6927325, -2.71128, 1, 0.7254902, 0, 1,
-1.116138, -0.06834642, -1.486829, 1, 0.7333333, 0, 1,
-1.10977, -0.9046441, -0.2975748, 1, 0.7372549, 0, 1,
-1.102245, -1.015104, -2.408418, 1, 0.7450981, 0, 1,
-1.095995, 0.08858532, -0.6593089, 1, 0.7490196, 0, 1,
-1.09499, -0.6425468, -1.972597, 1, 0.7568628, 0, 1,
-1.088053, -0.4687349, -1.634929, 1, 0.7607843, 0, 1,
-1.085864, -0.2822888, -3.172664, 1, 0.7686275, 0, 1,
-1.079211, -2.172271, -3.019111, 1, 0.772549, 0, 1,
-1.076069, 1.17854, -0.2375883, 1, 0.7803922, 0, 1,
-1.066271, -0.6304013, -0.8806575, 1, 0.7843137, 0, 1,
-1.064078, -0.3109785, -0.5204283, 1, 0.7921569, 0, 1,
-1.064037, -0.1257736, -0.2305423, 1, 0.7960784, 0, 1,
-1.062445, -0.8778915, -3.518977, 1, 0.8039216, 0, 1,
-1.050328, -0.1559464, -1.90972, 1, 0.8117647, 0, 1,
-1.048316, -0.215398, -1.131285, 1, 0.8156863, 0, 1,
-1.045152, 0.6251882, -1.772487, 1, 0.8235294, 0, 1,
-1.04005, -0.7142178, -2.758022, 1, 0.827451, 0, 1,
-1.039803, 0.5250213, -2.512691, 1, 0.8352941, 0, 1,
-1.033442, 0.6231844, -1.354172, 1, 0.8392157, 0, 1,
-1.031808, 1.733276, -0.2405092, 1, 0.8470588, 0, 1,
-1.01992, 0.5023789, -1.511454, 1, 0.8509804, 0, 1,
-1.01447, -0.3289378, -0.8443238, 1, 0.8588235, 0, 1,
-1.010472, -0.268624, -2.030723, 1, 0.8627451, 0, 1,
-1.009177, 0.3741943, 0.07441375, 1, 0.8705882, 0, 1,
-1.007936, 0.1684421, -1.532534, 1, 0.8745098, 0, 1,
-1.007248, -0.2726692, -3.220102, 1, 0.8823529, 0, 1,
-0.9978428, 0.8369459, -1.558811, 1, 0.8862745, 0, 1,
-0.9715878, -0.3246545, -1.712663, 1, 0.8941177, 0, 1,
-0.9619923, -0.525943, -0.9989637, 1, 0.8980392, 0, 1,
-0.9612128, -1.746731, -2.611017, 1, 0.9058824, 0, 1,
-0.9583675, 1.969912, -1.029251, 1, 0.9137255, 0, 1,
-0.9577847, 0.07004389, -1.586611, 1, 0.9176471, 0, 1,
-0.9521222, 2.767304, -0.1045534, 1, 0.9254902, 0, 1,
-0.9485157, -0.9602019, -2.871182, 1, 0.9294118, 0, 1,
-0.9396314, 0.3874123, -0.9684119, 1, 0.9372549, 0, 1,
-0.9366485, -1.0154, -1.587457, 1, 0.9411765, 0, 1,
-0.9364533, 0.4729041, -0.2835704, 1, 0.9490196, 0, 1,
-0.9356759, 0.1457458, -1.609492, 1, 0.9529412, 0, 1,
-0.9349011, -0.3983292, -1.288876, 1, 0.9607843, 0, 1,
-0.9342849, -0.1382032, -3.4675, 1, 0.9647059, 0, 1,
-0.9235656, 0.01671277, -1.92818, 1, 0.972549, 0, 1,
-0.9164549, 1.926365, 1.585686, 1, 0.9764706, 0, 1,
-0.9157735, -0.862087, -1.941376, 1, 0.9843137, 0, 1,
-0.9101577, 1.541879, -2.836536, 1, 0.9882353, 0, 1,
-0.9052442, 0.7770441, -2.820338, 1, 0.9960784, 0, 1,
-0.9050274, 1.546936, -0.03388457, 0.9960784, 1, 0, 1,
-0.8995857, 1.263648, -1.239661, 0.9921569, 1, 0, 1,
-0.8978786, 1.653208, 0.7723594, 0.9843137, 1, 0, 1,
-0.8906969, 1.366356, -1.482072, 0.9803922, 1, 0, 1,
-0.8888445, -0.5174478, -1.600187, 0.972549, 1, 0, 1,
-0.8864694, -0.004657465, -2.564325, 0.9686275, 1, 0, 1,
-0.8850033, 0.8869882, -1.572364, 0.9607843, 1, 0, 1,
-0.8830405, 0.8165174, -1.746181, 0.9568627, 1, 0, 1,
-0.8829857, 0.03338798, -1.532188, 0.9490196, 1, 0, 1,
-0.8806294, -2.146324, -4.755476, 0.945098, 1, 0, 1,
-0.880152, -2.001488, -3.443322, 0.9372549, 1, 0, 1,
-0.8799706, 0.4630401, -2.223918, 0.9333333, 1, 0, 1,
-0.8798573, 2.113681, 1.31408, 0.9254902, 1, 0, 1,
-0.8787444, 0.1460219, -2.080293, 0.9215686, 1, 0, 1,
-0.8742064, 0.05143307, -2.139347, 0.9137255, 1, 0, 1,
-0.8696276, -0.4261753, -0.5731553, 0.9098039, 1, 0, 1,
-0.8636063, -1.112477, -2.874324, 0.9019608, 1, 0, 1,
-0.8534786, 0.2688639, -0.4869735, 0.8941177, 1, 0, 1,
-0.8531025, -0.09463786, -1.982136, 0.8901961, 1, 0, 1,
-0.85021, 0.04670752, -0.9374107, 0.8823529, 1, 0, 1,
-0.8400002, 2.718529, -1.459445, 0.8784314, 1, 0, 1,
-0.838721, -0.803628, -2.386717, 0.8705882, 1, 0, 1,
-0.8370564, -0.4936969, -1.339124, 0.8666667, 1, 0, 1,
-0.8344505, 1.368572, -2.020701, 0.8588235, 1, 0, 1,
-0.8320986, 1.281884, -0.3818799, 0.854902, 1, 0, 1,
-0.8304611, -0.2316879, -0.09922636, 0.8470588, 1, 0, 1,
-0.8258663, 1.314668, -0.259461, 0.8431373, 1, 0, 1,
-0.8256167, 1.381184, 1.619181, 0.8352941, 1, 0, 1,
-0.8213599, 0.3848611, -2.54003, 0.8313726, 1, 0, 1,
-0.8212709, -0.06336553, -1.300113, 0.8235294, 1, 0, 1,
-0.8183376, 0.6114864, -0.2932689, 0.8196079, 1, 0, 1,
-0.8157289, -0.8372078, -1.004393, 0.8117647, 1, 0, 1,
-0.8150143, -0.325267, 0.8039916, 0.8078431, 1, 0, 1,
-0.8119523, -0.245883, -2.115825, 0.8, 1, 0, 1,
-0.8067417, 1.491844, -0.05157903, 0.7921569, 1, 0, 1,
-0.806637, -1.759384, -3.315941, 0.7882353, 1, 0, 1,
-0.8052485, -1.129133, -3.592256, 0.7803922, 1, 0, 1,
-0.8029757, 0.5019448, -2.102357, 0.7764706, 1, 0, 1,
-0.8001356, 2.768856, -0.4866179, 0.7686275, 1, 0, 1,
-0.7988625, -1.477454, -3.245214, 0.7647059, 1, 0, 1,
-0.7986251, -0.8549396, -1.540913, 0.7568628, 1, 0, 1,
-0.7977296, 0.06831299, -0.6199164, 0.7529412, 1, 0, 1,
-0.7930007, -1.145219, -2.976089, 0.7450981, 1, 0, 1,
-0.7911895, 0.3021671, -1.00246, 0.7411765, 1, 0, 1,
-0.7894745, 0.4789288, -2.285083, 0.7333333, 1, 0, 1,
-0.7808387, 0.4104539, -0.8344871, 0.7294118, 1, 0, 1,
-0.7750837, -0.755702, -2.932995, 0.7215686, 1, 0, 1,
-0.7740393, 1.817941, -0.346533, 0.7176471, 1, 0, 1,
-0.7736571, 1.386674, -0.3537788, 0.7098039, 1, 0, 1,
-0.7734568, -0.1660295, -1.393847, 0.7058824, 1, 0, 1,
-0.7690145, 0.2090697, -1.19032, 0.6980392, 1, 0, 1,
-0.7591469, 0.4562746, -0.7798297, 0.6901961, 1, 0, 1,
-0.7579783, 0.7611533, -0.8325077, 0.6862745, 1, 0, 1,
-0.7573905, 0.0432223, -2.330278, 0.6784314, 1, 0, 1,
-0.7555446, -0.06949776, -4.31335, 0.6745098, 1, 0, 1,
-0.7547315, -0.3266064, -3.579639, 0.6666667, 1, 0, 1,
-0.7525957, -0.8974183, -1.691916, 0.6627451, 1, 0, 1,
-0.7495987, -1.312878, -2.356399, 0.654902, 1, 0, 1,
-0.7374557, 0.2122986, -2.500926, 0.6509804, 1, 0, 1,
-0.7318827, 0.313637, -1.124521, 0.6431373, 1, 0, 1,
-0.7266562, -0.2481075, -1.637321, 0.6392157, 1, 0, 1,
-0.7229095, -0.5989423, -2.656894, 0.6313726, 1, 0, 1,
-0.7137216, 1.020515, 0.2274698, 0.627451, 1, 0, 1,
-0.6995093, -1.337258, -3.548195, 0.6196079, 1, 0, 1,
-0.6980227, -1.505723, -3.044292, 0.6156863, 1, 0, 1,
-0.697331, -0.005750632, -0.1817401, 0.6078432, 1, 0, 1,
-0.6893393, -1.546122, -1.987799, 0.6039216, 1, 0, 1,
-0.6881294, -0.9795541, -2.810945, 0.5960785, 1, 0, 1,
-0.680881, -3.045826, -2.829278, 0.5882353, 1, 0, 1,
-0.6661366, 0.9841931, -2.232182, 0.5843138, 1, 0, 1,
-0.6643177, -1.278053, -3.07167, 0.5764706, 1, 0, 1,
-0.6600954, -0.5683028, -0.7566745, 0.572549, 1, 0, 1,
-0.6544381, -0.6635455, -0.9592981, 0.5647059, 1, 0, 1,
-0.6513557, -0.2877428, -2.39464, 0.5607843, 1, 0, 1,
-0.6511975, 1.232408, -1.209023, 0.5529412, 1, 0, 1,
-0.6439595, -0.02205651, 0.3121084, 0.5490196, 1, 0, 1,
-0.6409667, -0.2035093, -0.8496222, 0.5411765, 1, 0, 1,
-0.6396215, 1.103097, 1.232123, 0.5372549, 1, 0, 1,
-0.6392674, -0.3561814, -3.136061, 0.5294118, 1, 0, 1,
-0.6365043, -1.378935, -1.533898, 0.5254902, 1, 0, 1,
-0.6345116, -1.55368, -3.077518, 0.5176471, 1, 0, 1,
-0.6336653, -0.2499941, -1.236904, 0.5137255, 1, 0, 1,
-0.6325154, 0.4698741, -2.893559, 0.5058824, 1, 0, 1,
-0.631259, -0.9653689, -3.174273, 0.5019608, 1, 0, 1,
-0.630034, -0.03686107, -0.3465067, 0.4941176, 1, 0, 1,
-0.6296364, 0.4768638, -0.7661681, 0.4862745, 1, 0, 1,
-0.629309, 0.8831642, -0.1617778, 0.4823529, 1, 0, 1,
-0.6245161, -0.2580971, -2.883591, 0.4745098, 1, 0, 1,
-0.620472, -0.3242729, -0.5043646, 0.4705882, 1, 0, 1,
-0.6202805, 0.07407467, -0.7468183, 0.4627451, 1, 0, 1,
-0.6202097, -0.3457523, -2.5595, 0.4588235, 1, 0, 1,
-0.6150079, -1.807501, -2.818678, 0.4509804, 1, 0, 1,
-0.6146839, -0.467106, -3.499693, 0.4470588, 1, 0, 1,
-0.6138951, 0.7513177, -0.7925209, 0.4392157, 1, 0, 1,
-0.6079319, -0.3024459, -2.508606, 0.4352941, 1, 0, 1,
-0.607538, -2.398224, -2.803446, 0.427451, 1, 0, 1,
-0.6017306, -0.09716129, -3.654348, 0.4235294, 1, 0, 1,
-0.5959287, 0.07513635, -3.690657, 0.4156863, 1, 0, 1,
-0.5953402, 0.3148857, -1.028454, 0.4117647, 1, 0, 1,
-0.5933005, 1.345316, -0.6191463, 0.4039216, 1, 0, 1,
-0.593167, 0.9882833, -0.6162521, 0.3960784, 1, 0, 1,
-0.5931395, 2.383832, -0.2554148, 0.3921569, 1, 0, 1,
-0.5918842, 0.5224544, -1.249106, 0.3843137, 1, 0, 1,
-0.5838651, -1.067118, -2.395846, 0.3803922, 1, 0, 1,
-0.5831745, -0.2295923, -0.01494498, 0.372549, 1, 0, 1,
-0.5770515, 0.1689924, -2.194613, 0.3686275, 1, 0, 1,
-0.5706643, -0.2807498, -1.794854, 0.3607843, 1, 0, 1,
-0.5672064, -1.033751, -2.222331, 0.3568628, 1, 0, 1,
-0.5644169, -0.5838229, -2.594327, 0.3490196, 1, 0, 1,
-0.5628769, -1.594925, -3.026706, 0.345098, 1, 0, 1,
-0.5625082, -0.1844667, -2.179362, 0.3372549, 1, 0, 1,
-0.5609494, 1.869682, -0.8277101, 0.3333333, 1, 0, 1,
-0.5593474, -1.580131, -1.890697, 0.3254902, 1, 0, 1,
-0.5589445, -0.6152726, -2.473353, 0.3215686, 1, 0, 1,
-0.558611, 0.004238574, -1.610553, 0.3137255, 1, 0, 1,
-0.552428, 0.9992507, -2.888346, 0.3098039, 1, 0, 1,
-0.5506241, -0.2261841, -1.943902, 0.3019608, 1, 0, 1,
-0.5451969, 0.1121492, 0.8704639, 0.2941177, 1, 0, 1,
-0.5437531, -0.3302918, -3.141669, 0.2901961, 1, 0, 1,
-0.5402837, -0.4177662, -2.054781, 0.282353, 1, 0, 1,
-0.5380852, -0.05738881, -1.648717, 0.2784314, 1, 0, 1,
-0.5333544, -0.5821018, -2.49854, 0.2705882, 1, 0, 1,
-0.5298851, 0.6644549, -0.3256863, 0.2666667, 1, 0, 1,
-0.5292267, 1.172541, 0.8081609, 0.2588235, 1, 0, 1,
-0.5282631, -0.374532, -2.64994, 0.254902, 1, 0, 1,
-0.5252788, 1.069648, -0.09368814, 0.2470588, 1, 0, 1,
-0.5252758, 0.1383535, 0.2319981, 0.2431373, 1, 0, 1,
-0.5214216, 0.9271213, -1.010032, 0.2352941, 1, 0, 1,
-0.520965, 0.5985522, -0.3006985, 0.2313726, 1, 0, 1,
-0.5135589, -2.176514, -2.758862, 0.2235294, 1, 0, 1,
-0.5126109, 1.77768, -0.02556188, 0.2196078, 1, 0, 1,
-0.501181, -0.4498326, -2.691988, 0.2117647, 1, 0, 1,
-0.4987742, 0.2147397, -0.9785591, 0.2078431, 1, 0, 1,
-0.497744, 0.993735, -0.2065535, 0.2, 1, 0, 1,
-0.4964888, 0.7419764, 0.4519157, 0.1921569, 1, 0, 1,
-0.4868114, -1.281082, -4.32487, 0.1882353, 1, 0, 1,
-0.4813398, -1.998978, -3.851847, 0.1803922, 1, 0, 1,
-0.4777477, -1.773414, -2.499907, 0.1764706, 1, 0, 1,
-0.4733215, 1.152204, -1.895355, 0.1686275, 1, 0, 1,
-0.4732784, -1.325318, -0.4475773, 0.1647059, 1, 0, 1,
-0.470135, 0.9826022, 0.4228632, 0.1568628, 1, 0, 1,
-0.4698457, 0.2687059, -0.9396743, 0.1529412, 1, 0, 1,
-0.4686497, 1.199241, 0.1444178, 0.145098, 1, 0, 1,
-0.4679971, 0.4446331, -1.339123, 0.1411765, 1, 0, 1,
-0.4671888, -1.135157, -3.309219, 0.1333333, 1, 0, 1,
-0.4670077, -0.1136218, -2.314922, 0.1294118, 1, 0, 1,
-0.4666381, 0.7412094, -0.8581182, 0.1215686, 1, 0, 1,
-0.4614107, -1.828448, -4.024493, 0.1176471, 1, 0, 1,
-0.4583898, 0.3306925, 1.00242, 0.1098039, 1, 0, 1,
-0.4545985, 1.326845, -0.1035007, 0.1058824, 1, 0, 1,
-0.4541872, -1.483659, -3.364736, 0.09803922, 1, 0, 1,
-0.4520182, -0.3812068, -2.444713, 0.09019608, 1, 0, 1,
-0.4443313, -0.4149771, -1.595064, 0.08627451, 1, 0, 1,
-0.4440449, -1.294761, -3.016367, 0.07843138, 1, 0, 1,
-0.442987, -1.059063, -1.215427, 0.07450981, 1, 0, 1,
-0.4408219, -0.1212833, -2.534609, 0.06666667, 1, 0, 1,
-0.4374278, 0.2001664, -2.26727, 0.0627451, 1, 0, 1,
-0.4350682, -1.116304, -2.413658, 0.05490196, 1, 0, 1,
-0.4338388, 1.068227, -2.352706, 0.05098039, 1, 0, 1,
-0.4291815, -1.034598, -4.00615, 0.04313726, 1, 0, 1,
-0.429137, -0.05505234, -1.415721, 0.03921569, 1, 0, 1,
-0.427902, 0.5074704, -0.3613283, 0.03137255, 1, 0, 1,
-0.4157556, -0.3034745, -0.3545658, 0.02745098, 1, 0, 1,
-0.4148761, -0.8396158, -4.58683, 0.01960784, 1, 0, 1,
-0.4133546, 0.1066905, -1.242783, 0.01568628, 1, 0, 1,
-0.4126003, 0.4874756, -0.8960884, 0.007843138, 1, 0, 1,
-0.4081002, -0.3787001, -2.219326, 0.003921569, 1, 0, 1,
-0.4076246, -0.3000548, -2.597249, 0, 1, 0.003921569, 1,
-0.406424, 0.4663323, -1.077052, 0, 1, 0.01176471, 1,
-0.4037229, 0.4585074, -2.237013, 0, 1, 0.01568628, 1,
-0.3991839, -0.30091, -2.281034, 0, 1, 0.02352941, 1,
-0.3944152, 1.739052, 0.914313, 0, 1, 0.02745098, 1,
-0.3935458, 0.9857575, -0.03320593, 0, 1, 0.03529412, 1,
-0.3935294, -0.08693227, -1.356437, 0, 1, 0.03921569, 1,
-0.3905226, 0.1360477, -0.3206988, 0, 1, 0.04705882, 1,
-0.3896706, 1.16161, 0.1154853, 0, 1, 0.05098039, 1,
-0.3880896, -1.2099, -2.545077, 0, 1, 0.05882353, 1,
-0.3869139, -0.5817646, -1.921104, 0, 1, 0.0627451, 1,
-0.3849694, -1.659812, -3.325966, 0, 1, 0.07058824, 1,
-0.384844, 0.03203979, -1.944724, 0, 1, 0.07450981, 1,
-0.3781264, 0.31519, -0.1803014, 0, 1, 0.08235294, 1,
-0.3765765, -0.6081815, -1.324755, 0, 1, 0.08627451, 1,
-0.3751517, -0.1516285, -2.081692, 0, 1, 0.09411765, 1,
-0.3747416, 0.9137836, 0.6999296, 0, 1, 0.1019608, 1,
-0.3733068, 1.386995, 0.08520266, 0, 1, 0.1058824, 1,
-0.3705951, -0.7277589, -3.118661, 0, 1, 0.1137255, 1,
-0.37023, -0.8652054, -3.585536, 0, 1, 0.1176471, 1,
-0.3674339, -0.5256778, -2.649277, 0, 1, 0.1254902, 1,
-0.3627918, 0.4652572, 1.09707, 0, 1, 0.1294118, 1,
-0.3612547, -0.6375296, -1.700561, 0, 1, 0.1372549, 1,
-0.3564397, -0.6885267, -1.759293, 0, 1, 0.1411765, 1,
-0.3563532, 0.2376236, 0.230883, 0, 1, 0.1490196, 1,
-0.3559088, 0.5648146, -0.2781508, 0, 1, 0.1529412, 1,
-0.3539155, 0.8459365, -0.9238548, 0, 1, 0.1607843, 1,
-0.3519785, 0.2763961, -0.6697232, 0, 1, 0.1647059, 1,
-0.3489968, -0.4171704, -2.09931, 0, 1, 0.172549, 1,
-0.3381115, 1.411808, 0.5390547, 0, 1, 0.1764706, 1,
-0.3372703, -1.033562, -2.665047, 0, 1, 0.1843137, 1,
-0.3338341, -0.4230369, -2.031403, 0, 1, 0.1882353, 1,
-0.3331349, -0.7986805, -2.137047, 0, 1, 0.1960784, 1,
-0.3291696, -0.2683274, -0.5114898, 0, 1, 0.2039216, 1,
-0.3247337, 0.5391129, 0.6072708, 0, 1, 0.2078431, 1,
-0.3245673, -0.5972067, -3.008764, 0, 1, 0.2156863, 1,
-0.3244153, -0.444884, -2.904573, 0, 1, 0.2196078, 1,
-0.3198729, -0.2767152, -1.619816, 0, 1, 0.227451, 1,
-0.3151033, -0.5389321, -2.309128, 0, 1, 0.2313726, 1,
-0.3139702, -0.6990511, -3.919945, 0, 1, 0.2392157, 1,
-0.3059233, 0.925366, -0.279658, 0, 1, 0.2431373, 1,
-0.3033192, -0.2524874, -1.237943, 0, 1, 0.2509804, 1,
-0.2996348, 0.3772272, -0.2491081, 0, 1, 0.254902, 1,
-0.2985187, -0.8043143, -3.468863, 0, 1, 0.2627451, 1,
-0.2916785, -0.1307463, -2.834182, 0, 1, 0.2666667, 1,
-0.2897533, 0.6883629, -0.5246484, 0, 1, 0.2745098, 1,
-0.2844925, -0.1790076, -2.710255, 0, 1, 0.2784314, 1,
-0.2839946, 0.5406231, -0.3633913, 0, 1, 0.2862745, 1,
-0.2810818, -1.250793, -2.514365, 0, 1, 0.2901961, 1,
-0.2786972, -0.3158961, -2.629813, 0, 1, 0.2980392, 1,
-0.2750211, -0.03775464, -1.931915, 0, 1, 0.3058824, 1,
-0.272457, -1.520865, -2.202472, 0, 1, 0.3098039, 1,
-0.2668159, 0.8760445, 0.2543162, 0, 1, 0.3176471, 1,
-0.2618546, -0.1079952, -2.472955, 0, 1, 0.3215686, 1,
-0.261405, -0.3423739, -1.139016, 0, 1, 0.3294118, 1,
-0.2608254, -1.107109, -2.156531, 0, 1, 0.3333333, 1,
-0.258505, 0.463518, -1.793221, 0, 1, 0.3411765, 1,
-0.2472247, -0.4294118, -3.493923, 0, 1, 0.345098, 1,
-0.2471422, -0.1621063, -2.776194, 0, 1, 0.3529412, 1,
-0.2468019, 0.4739114, -1.816472, 0, 1, 0.3568628, 1,
-0.2421463, 0.451056, -2.051255, 0, 1, 0.3647059, 1,
-0.2418025, 1.061759, 0.6075532, 0, 1, 0.3686275, 1,
-0.238553, -0.3425319, -1.044561, 0, 1, 0.3764706, 1,
-0.2358098, 0.7793025, 0.5307374, 0, 1, 0.3803922, 1,
-0.2320375, -1.958106, -2.959639, 0, 1, 0.3882353, 1,
-0.2261631, -1.693149, -5.060349, 0, 1, 0.3921569, 1,
-0.225804, 0.4943202, -1.090706, 0, 1, 0.4, 1,
-0.2250624, -0.3270424, -2.089508, 0, 1, 0.4078431, 1,
-0.218872, 0.3807015, -0.4334026, 0, 1, 0.4117647, 1,
-0.218439, -0.6673104, -2.205285, 0, 1, 0.4196078, 1,
-0.2172068, -0.9309305, -4.174068, 0, 1, 0.4235294, 1,
-0.2170169, -0.2583067, -1.831346, 0, 1, 0.4313726, 1,
-0.2139486, -0.8943421, -2.604944, 0, 1, 0.4352941, 1,
-0.2129052, -0.1250537, -1.335313, 0, 1, 0.4431373, 1,
-0.2123933, -0.9675369, -1.980275, 0, 1, 0.4470588, 1,
-0.2120075, 0.3964145, 1.359352, 0, 1, 0.454902, 1,
-0.2099285, -0.748704, -2.674781, 0, 1, 0.4588235, 1,
-0.2066957, -0.1240033, -1.29947, 0, 1, 0.4666667, 1,
-0.2051611, 0.8945413, -1.620677, 0, 1, 0.4705882, 1,
-0.2047829, 0.590792, 0.8282523, 0, 1, 0.4784314, 1,
-0.196772, -0.6198949, -1.462797, 0, 1, 0.4823529, 1,
-0.1946581, -1.257679, -3.336708, 0, 1, 0.4901961, 1,
-0.1896164, 0.1993615, 0.7136328, 0, 1, 0.4941176, 1,
-0.1835278, -1.360011, -2.941454, 0, 1, 0.5019608, 1,
-0.1812138, -0.7018475, -1.765253, 0, 1, 0.509804, 1,
-0.1785918, 0.8477501, 0.3216551, 0, 1, 0.5137255, 1,
-0.1748149, -1.846302, -2.968244, 0, 1, 0.5215687, 1,
-0.1740312, -1.555209, -3.026112, 0, 1, 0.5254902, 1,
-0.1727145, -2.014696, -2.907862, 0, 1, 0.5333334, 1,
-0.1726561, 0.3300379, 0.3355968, 0, 1, 0.5372549, 1,
-0.1617295, 0.2037426, -0.5074673, 0, 1, 0.5450981, 1,
-0.157737, 0.4373814, 0.7346507, 0, 1, 0.5490196, 1,
-0.1560094, -0.4702263, -3.802194, 0, 1, 0.5568628, 1,
-0.1549621, 0.4677097, -1.105343, 0, 1, 0.5607843, 1,
-0.1529585, 1.18629, -0.2124111, 0, 1, 0.5686275, 1,
-0.1529419, 0.2643221, -0.5026556, 0, 1, 0.572549, 1,
-0.1508023, -0.3471262, -1.448767, 0, 1, 0.5803922, 1,
-0.150748, 0.5424144, 0.4415804, 0, 1, 0.5843138, 1,
-0.1466035, -0.963679, -3.307894, 0, 1, 0.5921569, 1,
-0.1425748, -1.474994, -2.900724, 0, 1, 0.5960785, 1,
-0.1422581, -1.838403, -3.64696, 0, 1, 0.6039216, 1,
-0.1399132, 1.270441, -0.9211342, 0, 1, 0.6117647, 1,
-0.1368272, -1.739408, -1.920862, 0, 1, 0.6156863, 1,
-0.1329132, -0.1087794, -2.482424, 0, 1, 0.6235294, 1,
-0.1322076, -0.7779676, -2.846836, 0, 1, 0.627451, 1,
-0.1246202, 0.536177, -0.1062781, 0, 1, 0.6352941, 1,
-0.1245698, 0.177554, 0.5865038, 0, 1, 0.6392157, 1,
-0.117923, -1.577593, -2.261576, 0, 1, 0.6470588, 1,
-0.1176246, 0.7750219, 0.263122, 0, 1, 0.6509804, 1,
-0.1170701, 1.332328, 1.519862, 0, 1, 0.6588235, 1,
-0.1153985, -0.319685, -1.415344, 0, 1, 0.6627451, 1,
-0.115379, 1.733611, -0.7237424, 0, 1, 0.6705883, 1,
-0.1150363, -0.4933337, -3.726146, 0, 1, 0.6745098, 1,
-0.1115411, -0.5829241, -4.507164, 0, 1, 0.682353, 1,
-0.110855, -1.52695, -3.956279, 0, 1, 0.6862745, 1,
-0.1098843, -0.134444, -1.770191, 0, 1, 0.6941177, 1,
-0.109772, -0.2595902, -0.9979743, 0, 1, 0.7019608, 1,
-0.1090331, -1.492305, -3.021042, 0, 1, 0.7058824, 1,
-0.1007301, -0.8967541, -2.633518, 0, 1, 0.7137255, 1,
-0.1004604, 1.644211, -0.5181505, 0, 1, 0.7176471, 1,
-0.09869679, -0.251328, -2.992856, 0, 1, 0.7254902, 1,
-0.09745071, -0.512108, -2.751005, 0, 1, 0.7294118, 1,
-0.09743659, -0.3343925, -3.748015, 0, 1, 0.7372549, 1,
-0.09718411, -0.08496612, -1.935797, 0, 1, 0.7411765, 1,
-0.09458118, 1.619045, -0.1434388, 0, 1, 0.7490196, 1,
-0.09456869, -1.472939, -3.355275, 0, 1, 0.7529412, 1,
-0.09397462, -2.112536, -2.434898, 0, 1, 0.7607843, 1,
-0.08806958, -1.381704, -4.298441, 0, 1, 0.7647059, 1,
-0.08485696, -0.6492459, -2.296983, 0, 1, 0.772549, 1,
-0.08399338, 0.9469027, -0.3420713, 0, 1, 0.7764706, 1,
-0.08243069, 1.681334, 0.6250806, 0, 1, 0.7843137, 1,
-0.08077214, 0.1761733, -1.8279, 0, 1, 0.7882353, 1,
-0.07981449, -0.09880184, -3.359879, 0, 1, 0.7960784, 1,
-0.07865251, -0.04326971, -1.824659, 0, 1, 0.8039216, 1,
-0.07848481, -0.713892, -2.013444, 0, 1, 0.8078431, 1,
-0.07081803, -0.0331292, -0.2426081, 0, 1, 0.8156863, 1,
-0.07057469, 0.8319865, -0.436731, 0, 1, 0.8196079, 1,
-0.07004046, 0.02882576, -0.9436615, 0, 1, 0.827451, 1,
-0.06926295, 1.18775, -1.337513, 0, 1, 0.8313726, 1,
-0.06857338, -0.8440332, -3.337011, 0, 1, 0.8392157, 1,
-0.06563888, 0.0131757, -1.925489, 0, 1, 0.8431373, 1,
-0.06538401, 0.9231214, -1.765929, 0, 1, 0.8509804, 1,
-0.0626374, 0.8529105, -0.09518193, 0, 1, 0.854902, 1,
-0.05465399, -0.7360962, -3.124728, 0, 1, 0.8627451, 1,
-0.05161039, 0.3967093, -1.090234, 0, 1, 0.8666667, 1,
-0.04934183, -0.2451391, -3.339118, 0, 1, 0.8745098, 1,
-0.04901437, -0.6455169, -2.124799, 0, 1, 0.8784314, 1,
-0.04668925, 1.283499, -0.4666627, 0, 1, 0.8862745, 1,
-0.04093641, -1.366735, -3.377153, 0, 1, 0.8901961, 1,
-0.03889572, -0.01089843, -1.668342, 0, 1, 0.8980392, 1,
-0.03781752, 0.588548, 0.1744075, 0, 1, 0.9058824, 1,
-0.03755075, -0.06102528, -2.331086, 0, 1, 0.9098039, 1,
-0.03521738, -1.182864, -3.152956, 0, 1, 0.9176471, 1,
-0.03245632, -0.4287427, -2.912915, 0, 1, 0.9215686, 1,
-0.02806679, 1.45377, 0.02943064, 0, 1, 0.9294118, 1,
-0.02558193, -0.04808457, -1.269679, 0, 1, 0.9333333, 1,
-0.02042168, 1.610376, -1.143302, 0, 1, 0.9411765, 1,
-0.01966802, 1.657277, -0.07488819, 0, 1, 0.945098, 1,
-0.01157308, 0.1790481, -0.3877178, 0, 1, 0.9529412, 1,
-0.01123313, -0.7325181, -3.441159, 0, 1, 0.9568627, 1,
-0.0081308, -1.434132, -2.203484, 0, 1, 0.9647059, 1,
-0.006428912, -1.209569, -2.661723, 0, 1, 0.9686275, 1,
-0.002667907, 0.06881495, 0.8793733, 0, 1, 0.9764706, 1,
-0.001977129, 1.176629, 0.8200023, 0, 1, 0.9803922, 1,
-0.0004542308, 1.28556, 0.5914044, 0, 1, 0.9882353, 1,
-0.0003792389, -0.7310891, -4.153923, 0, 1, 0.9921569, 1,
0.004094077, -0.3841958, 1.662314, 0, 1, 1, 1,
0.005228899, -0.1093911, 3.280779, 0, 0.9921569, 1, 1,
0.01304837, -0.5727367, 3.108829, 0, 0.9882353, 1, 1,
0.01329281, 1.55321, 2.164336, 0, 0.9803922, 1, 1,
0.01767001, -1.470997, 4.49118, 0, 0.9764706, 1, 1,
0.01994424, -1.603082, 3.311498, 0, 0.9686275, 1, 1,
0.01999133, -1.605771, 3.42408, 0, 0.9647059, 1, 1,
0.02061916, 0.7490673, 0.008696978, 0, 0.9568627, 1, 1,
0.0246758, 2.066761, -0.8362339, 0, 0.9529412, 1, 1,
0.02495418, -0.4566734, 1.136761, 0, 0.945098, 1, 1,
0.02858583, -0.603704, 3.407737, 0, 0.9411765, 1, 1,
0.02906191, 0.0296844, 1.180213, 0, 0.9333333, 1, 1,
0.03120867, 0.9070144, -0.8160415, 0, 0.9294118, 1, 1,
0.03802501, -0.1824911, 3.008508, 0, 0.9215686, 1, 1,
0.04196388, 0.5533692, 0.3994794, 0, 0.9176471, 1, 1,
0.04344462, 0.5886748, 0.830004, 0, 0.9098039, 1, 1,
0.05009427, -1.855956, 2.975245, 0, 0.9058824, 1, 1,
0.05077861, 1.092685, 0.03161821, 0, 0.8980392, 1, 1,
0.05603115, -0.1717715, 1.896615, 0, 0.8901961, 1, 1,
0.06682488, -0.5152468, 3.533257, 0, 0.8862745, 1, 1,
0.06697111, -1.790627, 4.303274, 0, 0.8784314, 1, 1,
0.07032054, 0.07399017, 2.274837, 0, 0.8745098, 1, 1,
0.0713599, -1.501047, 2.835369, 0, 0.8666667, 1, 1,
0.07212637, 0.1923261, -2.178467, 0, 0.8627451, 1, 1,
0.07268036, -0.1309399, 2.332918, 0, 0.854902, 1, 1,
0.07327452, -1.699542, 3.23194, 0, 0.8509804, 1, 1,
0.07503202, 1.45782, -1.458185, 0, 0.8431373, 1, 1,
0.07592155, 0.02131917, 1.842841, 0, 0.8392157, 1, 1,
0.08063577, -1.567437, 5.31443, 0, 0.8313726, 1, 1,
0.08091365, 0.1700267, -0.03496067, 0, 0.827451, 1, 1,
0.08573081, -0.9265471, 3.985669, 0, 0.8196079, 1, 1,
0.08647095, 1.038553, 0.3687693, 0, 0.8156863, 1, 1,
0.08724583, -0.1097089, 1.770506, 0, 0.8078431, 1, 1,
0.09359803, 0.7559199, 1.295395, 0, 0.8039216, 1, 1,
0.09713321, 0.09180347, 1.059549, 0, 0.7960784, 1, 1,
0.0976392, -0.005209717, 1.264464, 0, 0.7882353, 1, 1,
0.0977375, -1.148749, 5.144243, 0, 0.7843137, 1, 1,
0.1010914, -0.5490844, 2.051229, 0, 0.7764706, 1, 1,
0.1012007, 0.2828008, -0.1918871, 0, 0.772549, 1, 1,
0.101303, -0.04809466, 2.066254, 0, 0.7647059, 1, 1,
0.1036697, -2.203147, 2.446242, 0, 0.7607843, 1, 1,
0.1046969, -2.169929, 3.256746, 0, 0.7529412, 1, 1,
0.1062663, -0.5550141, 3.792663, 0, 0.7490196, 1, 1,
0.1064243, 1.110491, 0.9998811, 0, 0.7411765, 1, 1,
0.1092536, 1.866684, 1.103557, 0, 0.7372549, 1, 1,
0.110805, 0.3013151, 0.9350978, 0, 0.7294118, 1, 1,
0.1111512, 0.4376861, 2.116001, 0, 0.7254902, 1, 1,
0.1117506, -0.7022657, 2.725842, 0, 0.7176471, 1, 1,
0.1120823, -1.972183, 3.567073, 0, 0.7137255, 1, 1,
0.1122287, 1.040258, 1.147851, 0, 0.7058824, 1, 1,
0.1146868, 1.48879, 0.2614464, 0, 0.6980392, 1, 1,
0.1161821, 1.923198, -0.9476163, 0, 0.6941177, 1, 1,
0.1168861, 1.373861, 0.5624096, 0, 0.6862745, 1, 1,
0.1170853, 0.2400616, 0.9157062, 0, 0.682353, 1, 1,
0.1239956, 0.5478991, 1.963574, 0, 0.6745098, 1, 1,
0.1250416, -0.7206988, 3.294674, 0, 0.6705883, 1, 1,
0.1264515, -1.476043, 4.042135, 0, 0.6627451, 1, 1,
0.1273299, 1.389485, 0.324751, 0, 0.6588235, 1, 1,
0.127525, 1.551172, 0.2947524, 0, 0.6509804, 1, 1,
0.1290445, 1.76407, -0.6781865, 0, 0.6470588, 1, 1,
0.1312101, -0.7932597, 2.282127, 0, 0.6392157, 1, 1,
0.131603, -0.04727621, 1.046323, 0, 0.6352941, 1, 1,
0.1321609, 0.9839092, -0.4565382, 0, 0.627451, 1, 1,
0.1324096, -1.012548, 3.762328, 0, 0.6235294, 1, 1,
0.1369756, 1.854052, 0.07318386, 0, 0.6156863, 1, 1,
0.1378233, -0.7708818, 2.101536, 0, 0.6117647, 1, 1,
0.1422404, -1.382968, 1.656812, 0, 0.6039216, 1, 1,
0.1434398, -1.476242, 3.717362, 0, 0.5960785, 1, 1,
0.1442744, 0.202621, -1.170244, 0, 0.5921569, 1, 1,
0.145193, -1.807901, 3.917057, 0, 0.5843138, 1, 1,
0.1461365, -1.602032, 2.37075, 0, 0.5803922, 1, 1,
0.1480158, 0.3523767, -0.6836213, 0, 0.572549, 1, 1,
0.1535626, 0.2383091, 0.8560352, 0, 0.5686275, 1, 1,
0.1575218, 0.4547441, 0.01627431, 0, 0.5607843, 1, 1,
0.1600972, 0.3688574, -0.3990414, 0, 0.5568628, 1, 1,
0.1616185, 0.6323794, 1.223999, 0, 0.5490196, 1, 1,
0.1636551, -1.098493, 2.856459, 0, 0.5450981, 1, 1,
0.1665644, -0.2208814, 3.830846, 0, 0.5372549, 1, 1,
0.1678417, 1.044898, -1.832726, 0, 0.5333334, 1, 1,
0.1703681, 0.1074326, 1.117499, 0, 0.5254902, 1, 1,
0.1705042, 0.03812457, 0.3677932, 0, 0.5215687, 1, 1,
0.1793367, 0.8529676, 0.6737239, 0, 0.5137255, 1, 1,
0.1850533, 1.51018, -0.8437049, 0, 0.509804, 1, 1,
0.1936888, -0.1402437, 3.788313, 0, 0.5019608, 1, 1,
0.1942771, 0.2193543, 0.7874441, 0, 0.4941176, 1, 1,
0.195077, 0.8128577, -0.09068641, 0, 0.4901961, 1, 1,
0.1970293, 1.2005, -0.4693964, 0, 0.4823529, 1, 1,
0.1983758, -0.1734784, 1.541996, 0, 0.4784314, 1, 1,
0.2018644, 1.33571, -0.3287753, 0, 0.4705882, 1, 1,
0.2096192, -0.6682686, 2.161131, 0, 0.4666667, 1, 1,
0.2108898, 0.1982358, -0.005315407, 0, 0.4588235, 1, 1,
0.2142484, -0.579083, 3.042204, 0, 0.454902, 1, 1,
0.2166597, 0.9571494, 0.1709875, 0, 0.4470588, 1, 1,
0.2199331, -0.2108469, 0.698041, 0, 0.4431373, 1, 1,
0.2255526, -0.0313087, 1.289082, 0, 0.4352941, 1, 1,
0.2316407, 0.2725616, -0.4305579, 0, 0.4313726, 1, 1,
0.235213, -1.515933, 3.760129, 0, 0.4235294, 1, 1,
0.2381963, -1.883136, 3.236292, 0, 0.4196078, 1, 1,
0.2407559, 0.1449763, 1.021936, 0, 0.4117647, 1, 1,
0.2429656, -1.00129, 3.54474, 0, 0.4078431, 1, 1,
0.2433544, 0.08340749, 0.673986, 0, 0.4, 1, 1,
0.2475461, -0.3632298, 4.169898, 0, 0.3921569, 1, 1,
0.2483001, -0.7119648, 2.587866, 0, 0.3882353, 1, 1,
0.2511396, 0.2440514, 2.183131, 0, 0.3803922, 1, 1,
0.2538658, 0.2126102, 1.446101, 0, 0.3764706, 1, 1,
0.2568733, -0.7530847, 1.942114, 0, 0.3686275, 1, 1,
0.2603622, 1.523184, 0.3030229, 0, 0.3647059, 1, 1,
0.2674633, -0.4409209, 3.539835, 0, 0.3568628, 1, 1,
0.2709753, 0.4764159, 0.5661017, 0, 0.3529412, 1, 1,
0.2739321, 0.6925167, 0.2484181, 0, 0.345098, 1, 1,
0.276909, -0.7500676, 1.610323, 0, 0.3411765, 1, 1,
0.2805106, -1.553542, 1.17964, 0, 0.3333333, 1, 1,
0.2818409, -1.366786, 1.597023, 0, 0.3294118, 1, 1,
0.2834575, 0.7486021, 0.2704735, 0, 0.3215686, 1, 1,
0.2892212, 0.8255222, -1.502641, 0, 0.3176471, 1, 1,
0.2902385, -0.5442913, 3.309763, 0, 0.3098039, 1, 1,
0.2927349, 0.6599001, 0.9072192, 0, 0.3058824, 1, 1,
0.2986942, 1.491179, -0.1588422, 0, 0.2980392, 1, 1,
0.2997807, 0.5237738, 1.494301, 0, 0.2901961, 1, 1,
0.3019345, -2.885369, 2.553694, 0, 0.2862745, 1, 1,
0.3042524, 0.8525307, -1.646953, 0, 0.2784314, 1, 1,
0.3067913, -0.1074652, 3.168536, 0, 0.2745098, 1, 1,
0.308526, 0.4158142, 0.4308565, 0, 0.2666667, 1, 1,
0.3143963, -1.170523, 2.080936, 0, 0.2627451, 1, 1,
0.3144869, 0.6505128, -1.073629, 0, 0.254902, 1, 1,
0.3147419, -0.2382743, 1.943107, 0, 0.2509804, 1, 1,
0.3147509, -0.4776896, 3.317629, 0, 0.2431373, 1, 1,
0.3154324, 0.4323775, -0.1970306, 0, 0.2392157, 1, 1,
0.3187799, 2.686331, -0.20007, 0, 0.2313726, 1, 1,
0.3217448, 1.035785, -0.1111769, 0, 0.227451, 1, 1,
0.3222762, -0.1472957, 1.490749, 0, 0.2196078, 1, 1,
0.3229343, -2.194371, 3.809213, 0, 0.2156863, 1, 1,
0.32876, -1.013194, 2.663849, 0, 0.2078431, 1, 1,
0.3377207, -1.808977, 2.212884, 0, 0.2039216, 1, 1,
0.3459936, -1.172745, 1.776494, 0, 0.1960784, 1, 1,
0.3486937, 0.5025967, 0.5933784, 0, 0.1882353, 1, 1,
0.3504755, 1.352031, 1.685007, 0, 0.1843137, 1, 1,
0.3571365, 0.2225958, -0.4693705, 0, 0.1764706, 1, 1,
0.3576875, 1.957294, -0.2188975, 0, 0.172549, 1, 1,
0.3637428, -0.4114971, 1.487322, 0, 0.1647059, 1, 1,
0.3649203, -0.3488348, 1.810374, 0, 0.1607843, 1, 1,
0.3697486, 0.7609426, -0.6836154, 0, 0.1529412, 1, 1,
0.3711809, -0.7814649, 3.980721, 0, 0.1490196, 1, 1,
0.3759451, -2.021154, 2.272471, 0, 0.1411765, 1, 1,
0.377973, 0.4041579, 0.3713432, 0, 0.1372549, 1, 1,
0.3816124, -1.187019, 3.482459, 0, 0.1294118, 1, 1,
0.3827011, 0.6301373, 1.768274, 0, 0.1254902, 1, 1,
0.3883843, -1.169052, 4.443748, 0, 0.1176471, 1, 1,
0.3927957, 1.336291, 0.03874857, 0, 0.1137255, 1, 1,
0.3989107, -0.2802402, 2.115983, 0, 0.1058824, 1, 1,
0.3994725, 0.5913669, 0.7781686, 0, 0.09803922, 1, 1,
0.4014273, -0.4556392, 1.923202, 0, 0.09411765, 1, 1,
0.4069203, -0.05979838, 1.140184, 0, 0.08627451, 1, 1,
0.408789, 1.639546, -0.08096167, 0, 0.08235294, 1, 1,
0.4096398, 0.3928022, 1.370399, 0, 0.07450981, 1, 1,
0.4115686, 0.5837619, 2.356205, 0, 0.07058824, 1, 1,
0.4200933, 0.1480816, 3.083694, 0, 0.0627451, 1, 1,
0.420866, -0.06843758, 1.749641, 0, 0.05882353, 1, 1,
0.421655, 0.6911956, 0.4179009, 0, 0.05098039, 1, 1,
0.4252685, 1.251952, -0.9900564, 0, 0.04705882, 1, 1,
0.42637, -0.04769513, 0.7633992, 0, 0.03921569, 1, 1,
0.4288616, -0.1391014, 3.349804, 0, 0.03529412, 1, 1,
0.4294581, -1.535755, 4.102643, 0, 0.02745098, 1, 1,
0.4302616, -0.1600718, 0.8895983, 0, 0.02352941, 1, 1,
0.4351086, 0.8623049, 2.281956, 0, 0.01568628, 1, 1,
0.4389069, 2.421593, 1.418888, 0, 0.01176471, 1, 1,
0.4441878, -0.8610572, 1.286334, 0, 0.003921569, 1, 1,
0.4443722, 0.5205904, 0.3060753, 0.003921569, 0, 1, 1,
0.4481398, 0.09013171, 1.361326, 0.007843138, 0, 1, 1,
0.4495977, 0.1432584, 0.6011491, 0.01568628, 0, 1, 1,
0.4526757, 0.1877825, 0.0479875, 0.01960784, 0, 1, 1,
0.4527496, 0.3139832, -0.3094933, 0.02745098, 0, 1, 1,
0.4584891, 1.622048, 0.4598036, 0.03137255, 0, 1, 1,
0.4616961, -0.1689134, 2.37558, 0.03921569, 0, 1, 1,
0.4618305, 1.024385, 2.448681, 0.04313726, 0, 1, 1,
0.4661649, 0.166089, 0.7090627, 0.05098039, 0, 1, 1,
0.4708846, -1.399106, 3.012694, 0.05490196, 0, 1, 1,
0.4720022, 1.153356, 2.215185, 0.0627451, 0, 1, 1,
0.4728392, -0.09677404, -0.04618979, 0.06666667, 0, 1, 1,
0.4744057, -0.1502854, 1.680143, 0.07450981, 0, 1, 1,
0.4842558, 0.5027891, 0.7051323, 0.07843138, 0, 1, 1,
0.4855779, 0.8788801, -1.592304, 0.08627451, 0, 1, 1,
0.4930538, 0.5173386, 0.4629965, 0.09019608, 0, 1, 1,
0.4942816, -1.48333, 2.601211, 0.09803922, 0, 1, 1,
0.4966181, 1.43413, -0.2942268, 0.1058824, 0, 1, 1,
0.497212, -0.4284085, 3.897521, 0.1098039, 0, 1, 1,
0.4974237, -0.1752225, 2.230601, 0.1176471, 0, 1, 1,
0.498189, -0.1680906, 2.16685, 0.1215686, 0, 1, 1,
0.4994941, 0.3631038, 0.4477002, 0.1294118, 0, 1, 1,
0.5039799, -0.8454593, 2.8878, 0.1333333, 0, 1, 1,
0.5087668, 0.9883166, 0.6905283, 0.1411765, 0, 1, 1,
0.5117143, 1.20583, 0.516946, 0.145098, 0, 1, 1,
0.5127961, -0.8874306, 4.614625, 0.1529412, 0, 1, 1,
0.5129819, 1.597904, 1.610317, 0.1568628, 0, 1, 1,
0.5138658, 0.1050654, 2.066679, 0.1647059, 0, 1, 1,
0.5167041, -0.2000062, 2.176297, 0.1686275, 0, 1, 1,
0.5183071, -0.6420556, 1.685131, 0.1764706, 0, 1, 1,
0.5209904, 2.935732, -1.382448, 0.1803922, 0, 1, 1,
0.5220875, -0.590482, 1.091451, 0.1882353, 0, 1, 1,
0.5226817, 0.9707922, 1.769882, 0.1921569, 0, 1, 1,
0.5236828, -0.1781248, 1.308044, 0.2, 0, 1, 1,
0.5261667, -0.5737534, 2.431131, 0.2078431, 0, 1, 1,
0.5327731, -0.6707651, 2.101851, 0.2117647, 0, 1, 1,
0.5328358, 0.1646632, 0.6009648, 0.2196078, 0, 1, 1,
0.5358647, 1.091554, 2.412091, 0.2235294, 0, 1, 1,
0.5361899, -1.43166, 5.375694, 0.2313726, 0, 1, 1,
0.5395913, 0.2529882, 1.092566, 0.2352941, 0, 1, 1,
0.5404855, -0.3002988, 2.308033, 0.2431373, 0, 1, 1,
0.5408402, 0.7020781, -0.1321678, 0.2470588, 0, 1, 1,
0.5425484, 0.8008732, 0.3110822, 0.254902, 0, 1, 1,
0.5438263, 1.23504, -0.8169575, 0.2588235, 0, 1, 1,
0.5441505, -0.9824319, 3.564775, 0.2666667, 0, 1, 1,
0.5457484, -0.3350756, 0.9982266, 0.2705882, 0, 1, 1,
0.5473829, -2.072956, 3.042035, 0.2784314, 0, 1, 1,
0.5491319, -2.229068, 2.594716, 0.282353, 0, 1, 1,
0.5500921, -1.393884, 1.472069, 0.2901961, 0, 1, 1,
0.5507748, 1.587007, 0.8315552, 0.2941177, 0, 1, 1,
0.5567258, -0.9020917, 1.006171, 0.3019608, 0, 1, 1,
0.5582407, 0.8571894, 0.7606663, 0.3098039, 0, 1, 1,
0.5595232, -0.3120414, 2.500452, 0.3137255, 0, 1, 1,
0.5614625, -1.475146, 4.602714, 0.3215686, 0, 1, 1,
0.5666969, 0.3215212, -0.5701293, 0.3254902, 0, 1, 1,
0.5706707, -2.319494, 3.842377, 0.3333333, 0, 1, 1,
0.5730144, 0.3123792, 0.8790417, 0.3372549, 0, 1, 1,
0.5760905, 0.7793584, -0.01084409, 0.345098, 0, 1, 1,
0.5766696, 1.705606, 0.7337456, 0.3490196, 0, 1, 1,
0.5781315, -1.758675, 2.547037, 0.3568628, 0, 1, 1,
0.5832662, -0.3861924, 3.541585, 0.3607843, 0, 1, 1,
0.5833381, -1.945584, 0.6930996, 0.3686275, 0, 1, 1,
0.584959, -0.3563454, 2.828952, 0.372549, 0, 1, 1,
0.5853756, -0.2651791, 3.173297, 0.3803922, 0, 1, 1,
0.5860392, -0.9062327, 1.715975, 0.3843137, 0, 1, 1,
0.5865455, -0.1757251, 2.563677, 0.3921569, 0, 1, 1,
0.5885077, 1.242941, 3.045718, 0.3960784, 0, 1, 1,
0.5891718, -0.466483, 2.537131, 0.4039216, 0, 1, 1,
0.5915081, -0.3517304, 3.557525, 0.4117647, 0, 1, 1,
0.5960286, -1.071752, 2.700371, 0.4156863, 0, 1, 1,
0.6007967, 2.021176, 0.7396279, 0.4235294, 0, 1, 1,
0.6044363, -1.062208, 0.07989965, 0.427451, 0, 1, 1,
0.6086762, 0.2568868, 0.4977708, 0.4352941, 0, 1, 1,
0.6105399, -0.8981115, 2.77868, 0.4392157, 0, 1, 1,
0.6135818, 0.8334472, -0.09991226, 0.4470588, 0, 1, 1,
0.6218187, -0.09464893, 2.200757, 0.4509804, 0, 1, 1,
0.6241386, 0.3591315, 1.864258, 0.4588235, 0, 1, 1,
0.6302468, -0.5807486, -0.4744338, 0.4627451, 0, 1, 1,
0.6338618, 0.09278445, 1.365756, 0.4705882, 0, 1, 1,
0.6367446, -0.8804277, 1.200211, 0.4745098, 0, 1, 1,
0.6382884, 0.0877958, 3.010201, 0.4823529, 0, 1, 1,
0.6402377, -0.2164484, 1.887209, 0.4862745, 0, 1, 1,
0.6403964, -0.180689, 1.025081, 0.4941176, 0, 1, 1,
0.6416124, 0.6002864, 0.7653009, 0.5019608, 0, 1, 1,
0.6445273, 0.2464822, 0.9096442, 0.5058824, 0, 1, 1,
0.646449, -0.08370495, 1.482141, 0.5137255, 0, 1, 1,
0.6489605, 0.4237924, -0.1534805, 0.5176471, 0, 1, 1,
0.6499278, -1.687135, 2.601495, 0.5254902, 0, 1, 1,
0.6574485, 0.9733135, -0.391869, 0.5294118, 0, 1, 1,
0.6622781, 0.2242445, 1.279692, 0.5372549, 0, 1, 1,
0.6626076, -0.7772173, 3.621254, 0.5411765, 0, 1, 1,
0.663296, -2.143559, 4.156727, 0.5490196, 0, 1, 1,
0.6642852, 0.8232158, 0.1550125, 0.5529412, 0, 1, 1,
0.670141, -0.3644625, 0.5831577, 0.5607843, 0, 1, 1,
0.6708667, 1.459563, -0.159529, 0.5647059, 0, 1, 1,
0.6778567, 0.751109, 1.056087, 0.572549, 0, 1, 1,
0.6789487, 1.085644, -1.430077, 0.5764706, 0, 1, 1,
0.6801582, 1.860034, -0.7747459, 0.5843138, 0, 1, 1,
0.6807142, -0.2555764, 0.4973449, 0.5882353, 0, 1, 1,
0.6827717, 0.3187158, 2.492456, 0.5960785, 0, 1, 1,
0.6842527, 0.9868692, -1.527534, 0.6039216, 0, 1, 1,
0.685406, 0.01615808, 2.235974, 0.6078432, 0, 1, 1,
0.6972724, 0.8947701, -0.6572071, 0.6156863, 0, 1, 1,
0.6975048, 0.4602771, 1.778134, 0.6196079, 0, 1, 1,
0.6976336, -0.02344052, 2.470014, 0.627451, 0, 1, 1,
0.6992622, 0.7202435, 0.5662575, 0.6313726, 0, 1, 1,
0.7061775, 1.001871, 1.586127, 0.6392157, 0, 1, 1,
0.7086123, 1.104411, 0.9053082, 0.6431373, 0, 1, 1,
0.710149, -0.7472327, 2.903145, 0.6509804, 0, 1, 1,
0.712025, -0.5831853, 1.963773, 0.654902, 0, 1, 1,
0.716483, -0.2298418, 2.383237, 0.6627451, 0, 1, 1,
0.7268358, -1.936106, 3.308674, 0.6666667, 0, 1, 1,
0.732453, 0.2202213, 0.8785899, 0.6745098, 0, 1, 1,
0.7335718, 0.09029808, 1.142021, 0.6784314, 0, 1, 1,
0.7338836, 1.060371, -0.0710695, 0.6862745, 0, 1, 1,
0.736178, 1.395449, 0.1574975, 0.6901961, 0, 1, 1,
0.738866, -1.734285, 2.072048, 0.6980392, 0, 1, 1,
0.7405793, 0.1601216, 3.09987, 0.7058824, 0, 1, 1,
0.7432061, -1.396669, 3.400976, 0.7098039, 0, 1, 1,
0.7545327, 1.754075, -0.4815515, 0.7176471, 0, 1, 1,
0.7626468, 0.3256058, 0.990843, 0.7215686, 0, 1, 1,
0.7641288, 0.1321802, 1.878844, 0.7294118, 0, 1, 1,
0.7668388, 0.1324758, 0.2592959, 0.7333333, 0, 1, 1,
0.7676302, 0.8601634, -0.4302222, 0.7411765, 0, 1, 1,
0.7681457, -0.2964593, 2.22402, 0.7450981, 0, 1, 1,
0.7699861, -0.4515181, 1.780167, 0.7529412, 0, 1, 1,
0.7722917, -1.18472, 3.880249, 0.7568628, 0, 1, 1,
0.7818798, -0.1397634, 0.7042242, 0.7647059, 0, 1, 1,
0.7833275, 0.09367274, 2.21204, 0.7686275, 0, 1, 1,
0.7858782, 1.396191, 0.7810139, 0.7764706, 0, 1, 1,
0.7931982, -0.7263027, 2.024235, 0.7803922, 0, 1, 1,
0.8005904, 0.612165, 0.8201051, 0.7882353, 0, 1, 1,
0.8023773, -0.4115394, 0.5125102, 0.7921569, 0, 1, 1,
0.8035748, -0.1104279, 0.3462984, 0.8, 0, 1, 1,
0.805482, -1.461851, 2.383588, 0.8078431, 0, 1, 1,
0.8060396, -0.02734848, 1.667255, 0.8117647, 0, 1, 1,
0.8110062, 0.498172, 2.299548, 0.8196079, 0, 1, 1,
0.8136317, 0.6093209, 1.809061, 0.8235294, 0, 1, 1,
0.8136775, -0.04904581, 2.05629, 0.8313726, 0, 1, 1,
0.815225, -1.76482, 1.965414, 0.8352941, 0, 1, 1,
0.8185689, -1.051061, 0.8379037, 0.8431373, 0, 1, 1,
0.8186918, 0.6177189, -0.1281327, 0.8470588, 0, 1, 1,
0.8214201, 0.4153835, 1.428115, 0.854902, 0, 1, 1,
0.8343429, 0.8046859, 1.099267, 0.8588235, 0, 1, 1,
0.8351015, -0.1698622, 2.459206, 0.8666667, 0, 1, 1,
0.8368247, -1.19765, 3.005603, 0.8705882, 0, 1, 1,
0.8383994, -0.6950636, 2.488565, 0.8784314, 0, 1, 1,
0.839778, 0.5756932, 0.5949137, 0.8823529, 0, 1, 1,
0.8398618, 0.5475041, 2.176313, 0.8901961, 0, 1, 1,
0.8421332, 0.3666566, 1.663456, 0.8941177, 0, 1, 1,
0.8456076, 0.3106008, 0.6603962, 0.9019608, 0, 1, 1,
0.8505447, 0.2560956, 2.071825, 0.9098039, 0, 1, 1,
0.8544879, 0.4996176, 3.806427, 0.9137255, 0, 1, 1,
0.8579935, 1.294575, 0.7688723, 0.9215686, 0, 1, 1,
0.8592939, 0.5405969, 1.967583, 0.9254902, 0, 1, 1,
0.864186, -1.33215, 1.869259, 0.9333333, 0, 1, 1,
0.8649005, 0.3373133, -0.0750438, 0.9372549, 0, 1, 1,
0.8753773, -0.3431237, 1.297488, 0.945098, 0, 1, 1,
0.8757864, -0.3570112, 3.956445, 0.9490196, 0, 1, 1,
0.8801298, 0.794462, -1.854133, 0.9568627, 0, 1, 1,
0.8819693, 1.055533, 0.4743337, 0.9607843, 0, 1, 1,
0.8869085, 0.2129873, 1.003261, 0.9686275, 0, 1, 1,
0.88883, 0.0931101, 2.22591, 0.972549, 0, 1, 1,
0.9104061, 0.4829503, 0.471543, 0.9803922, 0, 1, 1,
0.9128302, -0.4195291, 2.410111, 0.9843137, 0, 1, 1,
0.9129354, -0.9747264, 2.031104, 0.9921569, 0, 1, 1,
0.9152422, 0.8088995, 1.568975, 0.9960784, 0, 1, 1,
0.9157289, 0.846487, 2.09761, 1, 0, 0.9960784, 1,
0.9272822, -0.002707586, 2.876805, 1, 0, 0.9882353, 1,
0.9325926, -0.1050426, 2.306896, 1, 0, 0.9843137, 1,
0.939258, -0.4960507, 1.855488, 1, 0, 0.9764706, 1,
0.9433511, 0.6260186, 0.5325609, 1, 0, 0.972549, 1,
0.9519092, -1.812682, 3.181197, 1, 0, 0.9647059, 1,
0.9534696, 0.5125935, 2.324219, 1, 0, 0.9607843, 1,
0.9580693, -0.03484828, 1.35458, 1, 0, 0.9529412, 1,
0.9590121, -1.05658, 1.805616, 1, 0, 0.9490196, 1,
0.9719275, -0.6942148, 3.462214, 1, 0, 0.9411765, 1,
0.9749256, -0.4266657, 1.934162, 1, 0, 0.9372549, 1,
0.975452, -0.6183679, 4.433632, 1, 0, 0.9294118, 1,
0.9850876, 0.746778, 0.4941005, 1, 0, 0.9254902, 1,
0.9880239, 0.02970576, 0.6973886, 1, 0, 0.9176471, 1,
0.9955199, 1.739202, -0.09794658, 1, 0, 0.9137255, 1,
1.007817, 1.340028, 0.5483581, 1, 0, 0.9058824, 1,
1.016481, 1.864385, 0.02487135, 1, 0, 0.9019608, 1,
1.018188, 0.2465308, 3.188609, 1, 0, 0.8941177, 1,
1.019145, 0.180252, 1.84529, 1, 0, 0.8862745, 1,
1.020225, 0.9609913, -0.5421062, 1, 0, 0.8823529, 1,
1.025221, 0.7281163, 0.9022783, 1, 0, 0.8745098, 1,
1.028461, 1.181053, -1.808409, 1, 0, 0.8705882, 1,
1.035918, 0.3323593, 0.1110551, 1, 0, 0.8627451, 1,
1.051723, 1.06283, 1.136105, 1, 0, 0.8588235, 1,
1.05735, 2.099455, -0.5223915, 1, 0, 0.8509804, 1,
1.057837, 0.5391846, 0.4794396, 1, 0, 0.8470588, 1,
1.058497, -0.5654426, 3.012826, 1, 0, 0.8392157, 1,
1.067159, -0.2060988, 0.4679929, 1, 0, 0.8352941, 1,
1.06842, -0.01449195, 2.095718, 1, 0, 0.827451, 1,
1.07259, 1.910388, 0.8520984, 1, 0, 0.8235294, 1,
1.074432, 1.037204, 1.581504, 1, 0, 0.8156863, 1,
1.077114, -0.8369281, 2.94566, 1, 0, 0.8117647, 1,
1.078538, -1.221863, 2.587494, 1, 0, 0.8039216, 1,
1.09039, 0.4776284, 2.122915, 1, 0, 0.7960784, 1,
1.090587, 1.014698, 1.115797, 1, 0, 0.7921569, 1,
1.091676, -1.425893, 2.93293, 1, 0, 0.7843137, 1,
1.095019, -1.004268, 2.412463, 1, 0, 0.7803922, 1,
1.095332, 0.4649909, 1.15492, 1, 0, 0.772549, 1,
1.098371, 0.06924785, 2.403692, 1, 0, 0.7686275, 1,
1.098541, -0.9402101, 1.627502, 1, 0, 0.7607843, 1,
1.106582, 0.5462347, -0.3208109, 1, 0, 0.7568628, 1,
1.118919, 1.53916, -0.4442989, 1, 0, 0.7490196, 1,
1.122925, -1.173296, 3.330988, 1, 0, 0.7450981, 1,
1.124492, -0.2901759, 2.30731, 1, 0, 0.7372549, 1,
1.125771, 0.6962135, -0.05046527, 1, 0, 0.7333333, 1,
1.126283, -0.4700643, 1.966225, 1, 0, 0.7254902, 1,
1.131168, 0.6793683, 1.130278, 1, 0, 0.7215686, 1,
1.136824, -0.4495399, 1.859459, 1, 0, 0.7137255, 1,
1.141769, 0.4551795, 1.058339, 1, 0, 0.7098039, 1,
1.148062, -0.2360807, 0.4519955, 1, 0, 0.7019608, 1,
1.150576, 1.430865, 2.582417, 1, 0, 0.6941177, 1,
1.150595, -0.6187335, 2.391194, 1, 0, 0.6901961, 1,
1.156733, -0.9774982, 1.794186, 1, 0, 0.682353, 1,
1.171937, 1.861524, 0.64387, 1, 0, 0.6784314, 1,
1.17344, -1.163851, 0.9616975, 1, 0, 0.6705883, 1,
1.191547, 0.07412337, 3.323971, 1, 0, 0.6666667, 1,
1.19335, -1.124011, 2.111061, 1, 0, 0.6588235, 1,
1.1961, -0.2172193, 1.011365, 1, 0, 0.654902, 1,
1.201241, 0.2989165, -0.670002, 1, 0, 0.6470588, 1,
1.204907, 0.5054629, 0.4538973, 1, 0, 0.6431373, 1,
1.209765, -0.132561, 4.638718, 1, 0, 0.6352941, 1,
1.220331, 0.6723713, 0.8659235, 1, 0, 0.6313726, 1,
1.222901, -0.09616841, 1.004799, 1, 0, 0.6235294, 1,
1.239123, 0.190129, 1.273764, 1, 0, 0.6196079, 1,
1.240852, 1.894191, -0.2860054, 1, 0, 0.6117647, 1,
1.24104, -0.3019709, 3.202676, 1, 0, 0.6078432, 1,
1.241628, 0.005836868, 0.3655828, 1, 0, 0.6, 1,
1.24811, -0.5461696, 1.753785, 1, 0, 0.5921569, 1,
1.251048, 0.3328702, 2.67257, 1, 0, 0.5882353, 1,
1.256141, 1.767255, -0.02287913, 1, 0, 0.5803922, 1,
1.256735, -0.4531676, 1.573482, 1, 0, 0.5764706, 1,
1.260164, 1.13557, -1.41316, 1, 0, 0.5686275, 1,
1.261558, 0.8797004, 0.6702766, 1, 0, 0.5647059, 1,
1.261609, -0.4814474, 0.5094656, 1, 0, 0.5568628, 1,
1.265375, 1.709776, 0.9575841, 1, 0, 0.5529412, 1,
1.268492, 1.318214, 0.681503, 1, 0, 0.5450981, 1,
1.270346, 0.2257476, 0.1921489, 1, 0, 0.5411765, 1,
1.28188, -0.5903036, -0.3604948, 1, 0, 0.5333334, 1,
1.283034, -0.6101214, 3.636496, 1, 0, 0.5294118, 1,
1.284721, 1.650355, 0.5912881, 1, 0, 0.5215687, 1,
1.289708, -0.1953346, 0.02655017, 1, 0, 0.5176471, 1,
1.291733, -0.202193, 3.141684, 1, 0, 0.509804, 1,
1.292451, 1.506802, -0.320073, 1, 0, 0.5058824, 1,
1.294044, -0.3877535, 2.256494, 1, 0, 0.4980392, 1,
1.305321, 0.1837789, 2.532087, 1, 0, 0.4901961, 1,
1.31661, 1.559011, 0.4483482, 1, 0, 0.4862745, 1,
1.320331, 1.303517, 0.8477879, 1, 0, 0.4784314, 1,
1.328179, -0.7331111, 1.942472, 1, 0, 0.4745098, 1,
1.329224, -0.3226411, 1.466676, 1, 0, 0.4666667, 1,
1.329552, -0.05907991, 3.297752, 1, 0, 0.4627451, 1,
1.35087, -0.8826239, 3.195461, 1, 0, 0.454902, 1,
1.350876, -0.7552952, 0.07912795, 1, 0, 0.4509804, 1,
1.352994, 0.2783384, 0.475467, 1, 0, 0.4431373, 1,
1.356234, 0.0167989, 2.275878, 1, 0, 0.4392157, 1,
1.357355, -0.7981547, 3.622213, 1, 0, 0.4313726, 1,
1.36834, 0.85065, 1.526392, 1, 0, 0.427451, 1,
1.373208, 0.174667, 0.6877592, 1, 0, 0.4196078, 1,
1.373919, 0.6772284, 0.7844779, 1, 0, 0.4156863, 1,
1.379021, -0.5476003, 1.906863, 1, 0, 0.4078431, 1,
1.383673, -0.6882176, 3.438095, 1, 0, 0.4039216, 1,
1.384822, -0.2510945, 2.292686, 1, 0, 0.3960784, 1,
1.388946, 0.1809626, 1.196083, 1, 0, 0.3882353, 1,
1.408202, -0.2631351, 1.684005, 1, 0, 0.3843137, 1,
1.408333, 0.7338287, 0.8271996, 1, 0, 0.3764706, 1,
1.416093, 1.239115, 0.7184899, 1, 0, 0.372549, 1,
1.419112, 1.125976, 1.997601, 1, 0, 0.3647059, 1,
1.419472, 1.935065, 1.594041, 1, 0, 0.3607843, 1,
1.432853, -0.4906702, -0.1149324, 1, 0, 0.3529412, 1,
1.443744, 0.3553478, 0.8162119, 1, 0, 0.3490196, 1,
1.446053, -0.3728333, 1.527057, 1, 0, 0.3411765, 1,
1.447446, -0.1968888, 2.154634, 1, 0, 0.3372549, 1,
1.461365, 0.5562799, 1.439225, 1, 0, 0.3294118, 1,
1.471399, 0.6418543, 1.351633, 1, 0, 0.3254902, 1,
1.523558, 0.1688044, 0.3078101, 1, 0, 0.3176471, 1,
1.535111, 1.714119, 2.504196, 1, 0, 0.3137255, 1,
1.541313, -0.4717489, 2.467785, 1, 0, 0.3058824, 1,
1.546374, 0.7876022, 2.923695, 1, 0, 0.2980392, 1,
1.556116, 0.7679343, 0.9590659, 1, 0, 0.2941177, 1,
1.57158, 1.52851, -0.6483887, 1, 0, 0.2862745, 1,
1.581216, 2.015286, 0.4216817, 1, 0, 0.282353, 1,
1.585618, -0.1684103, 1.546302, 1, 0, 0.2745098, 1,
1.606954, -0.2352068, 1.112381, 1, 0, 0.2705882, 1,
1.614688, 0.9147441, 3.427583, 1, 0, 0.2627451, 1,
1.614814, -0.3826269, 1.693403, 1, 0, 0.2588235, 1,
1.62069, 0.2207633, 1.898559, 1, 0, 0.2509804, 1,
1.622603, 0.07927243, 1.218594, 1, 0, 0.2470588, 1,
1.635002, -0.6682584, 0.7697507, 1, 0, 0.2392157, 1,
1.639917, -1.048227, 3.265335, 1, 0, 0.2352941, 1,
1.643004, -0.4050485, 0.9529595, 1, 0, 0.227451, 1,
1.658058, 1.048636, 0.01136024, 1, 0, 0.2235294, 1,
1.659247, -0.7296947, 1.044546, 1, 0, 0.2156863, 1,
1.664522, -0.7762308, 2.234018, 1, 0, 0.2117647, 1,
1.665849, 0.626914, 0.7521, 1, 0, 0.2039216, 1,
1.674936, -0.8775644, 2.148783, 1, 0, 0.1960784, 1,
1.696878, 0.6017227, 0.3473351, 1, 0, 0.1921569, 1,
1.716699, -0.5925884, 1.884633, 1, 0, 0.1843137, 1,
1.751019, -0.1421496, 1.901827, 1, 0, 0.1803922, 1,
1.771632, -0.6306978, 0.8435212, 1, 0, 0.172549, 1,
1.779743, 1.636642, 1.10961, 1, 0, 0.1686275, 1,
1.785857, 1.023117, 2.158562, 1, 0, 0.1607843, 1,
1.842518, 0.5854096, 3.448144, 1, 0, 0.1568628, 1,
1.947838, 1.093101, 0.935083, 1, 0, 0.1490196, 1,
1.954709, -1.535542, 3.256454, 1, 0, 0.145098, 1,
1.963343, 1.185236, 1.297222, 1, 0, 0.1372549, 1,
1.977411, -0.227257, 1.417913, 1, 0, 0.1333333, 1,
2.009433, -0.5807693, 1.940011, 1, 0, 0.1254902, 1,
2.012521, 1.371815, 0.7030721, 1, 0, 0.1215686, 1,
2.026492, 0.1531308, 0.8661942, 1, 0, 0.1137255, 1,
2.094687, -0.4206181, 3.203576, 1, 0, 0.1098039, 1,
2.17216, -1.488635, 3.600808, 1, 0, 0.1019608, 1,
2.244211, 0.9232241, 1.268832, 1, 0, 0.09411765, 1,
2.259114, 0.0008105919, 0.1279851, 1, 0, 0.09019608, 1,
2.260642, 1.120986, 0.4504423, 1, 0, 0.08235294, 1,
2.29747, 0.05502164, 2.370944, 1, 0, 0.07843138, 1,
2.310232, -0.1180824, -0.3185467, 1, 0, 0.07058824, 1,
2.31205, -2.334042, 2.092653, 1, 0, 0.06666667, 1,
2.346521, -0.05218866, 1.395923, 1, 0, 0.05882353, 1,
2.452325, 2.1752, 0.3809937, 1, 0, 0.05490196, 1,
2.533727, -0.03846418, 1.891801, 1, 0, 0.04705882, 1,
2.550829, -0.01484661, 1.206178, 1, 0, 0.04313726, 1,
2.564816, 1.042794, 0.7480986, 1, 0, 0.03529412, 1,
2.617491, 1.462135, 1.854132, 1, 0, 0.03137255, 1,
2.666917, 0.04401703, 2.600401, 1, 0, 0.02352941, 1,
2.832095, -0.5923232, 1.902831, 1, 0, 0.01960784, 1,
3.384558, -1.016161, 4.165058, 1, 0, 0.01176471, 1,
3.823681, -0.5165119, 1.673919, 1, 0, 0.007843138, 1
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
0.1878847, -4.0597, -6.829259, 0, -0.5, 0.5, 0.5,
0.1878847, -4.0597, -6.829259, 1, -0.5, 0.5, 0.5,
0.1878847, -4.0597, -6.829259, 1, 1.5, 0.5, 0.5,
0.1878847, -4.0597, -6.829259, 0, 1.5, 0.5, 0.5
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
-4.680447, -0.05504727, -6.829259, 0, -0.5, 0.5, 0.5,
-4.680447, -0.05504727, -6.829259, 1, -0.5, 0.5, 0.5,
-4.680447, -0.05504727, -6.829259, 1, 1.5, 0.5, 0.5,
-4.680447, -0.05504727, -6.829259, 0, 1.5, 0.5, 0.5
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
-4.680447, -4.0597, 0.1576722, 0, -0.5, 0.5, 0.5,
-4.680447, -4.0597, 0.1576722, 1, -0.5, 0.5, 0.5,
-4.680447, -4.0597, 0.1576722, 1, 1.5, 0.5, 0.5,
-4.680447, -4.0597, 0.1576722, 0, 1.5, 0.5, 0.5
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
-2, -3.13555, -5.21689,
2, -3.13555, -5.21689,
-2, -3.13555, -5.21689,
-2, -3.289575, -5.485618,
0, -3.13555, -5.21689,
0, -3.289575, -5.485618,
2, -3.13555, -5.21689,
2, -3.289575, -5.485618
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
"2"
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
-2, -3.597625, -6.023075, 0, -0.5, 0.5, 0.5,
-2, -3.597625, -6.023075, 1, -0.5, 0.5, 0.5,
-2, -3.597625, -6.023075, 1, 1.5, 0.5, 0.5,
-2, -3.597625, -6.023075, 0, 1.5, 0.5, 0.5,
0, -3.597625, -6.023075, 0, -0.5, 0.5, 0.5,
0, -3.597625, -6.023075, 1, -0.5, 0.5, 0.5,
0, -3.597625, -6.023075, 1, 1.5, 0.5, 0.5,
0, -3.597625, -6.023075, 0, 1.5, 0.5, 0.5,
2, -3.597625, -6.023075, 0, -0.5, 0.5, 0.5,
2, -3.597625, -6.023075, 1, -0.5, 0.5, 0.5,
2, -3.597625, -6.023075, 1, 1.5, 0.5, 0.5,
2, -3.597625, -6.023075, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.556985, -3, -5.21689,
-3.556985, 2, -5.21689,
-3.556985, -3, -5.21689,
-3.744229, -3, -5.485618,
-3.556985, -2, -5.21689,
-3.744229, -2, -5.485618,
-3.556985, -1, -5.21689,
-3.744229, -1, -5.485618,
-3.556985, 0, -5.21689,
-3.744229, 0, -5.485618,
-3.556985, 1, -5.21689,
-3.744229, 1, -5.485618,
-3.556985, 2, -5.21689,
-3.744229, 2, -5.485618
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
-4.118716, -3, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, -3, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, -3, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, -3, -6.023075, 0, 1.5, 0.5, 0.5,
-4.118716, -2, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, -2, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, -2, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, -2, -6.023075, 0, 1.5, 0.5, 0.5,
-4.118716, -1, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, -1, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, -1, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, -1, -6.023075, 0, 1.5, 0.5, 0.5,
-4.118716, 0, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, 0, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, 0, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, 0, -6.023075, 0, 1.5, 0.5, 0.5,
-4.118716, 1, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, 1, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, 1, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, 1, -6.023075, 0, 1.5, 0.5, 0.5,
-4.118716, 2, -6.023075, 0, -0.5, 0.5, 0.5,
-4.118716, 2, -6.023075, 1, -0.5, 0.5, 0.5,
-4.118716, 2, -6.023075, 1, 1.5, 0.5, 0.5,
-4.118716, 2, -6.023075, 0, 1.5, 0.5, 0.5
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
-3.556985, -3.13555, -4,
-3.556985, -3.13555, 4,
-3.556985, -3.13555, -4,
-3.744229, -3.289575, -4,
-3.556985, -3.13555, -2,
-3.744229, -3.289575, -2,
-3.556985, -3.13555, 0,
-3.744229, -3.289575, 0,
-3.556985, -3.13555, 2,
-3.744229, -3.289575, 2,
-3.556985, -3.13555, 4,
-3.744229, -3.289575, 4
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
-4.118716, -3.597625, -4, 0, -0.5, 0.5, 0.5,
-4.118716, -3.597625, -4, 1, -0.5, 0.5, 0.5,
-4.118716, -3.597625, -4, 1, 1.5, 0.5, 0.5,
-4.118716, -3.597625, -4, 0, 1.5, 0.5, 0.5,
-4.118716, -3.597625, -2, 0, -0.5, 0.5, 0.5,
-4.118716, -3.597625, -2, 1, -0.5, 0.5, 0.5,
-4.118716, -3.597625, -2, 1, 1.5, 0.5, 0.5,
-4.118716, -3.597625, -2, 0, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 0, 0, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 0, 1, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 0, 1, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 0, 0, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 2, 0, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 2, 1, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 2, 1, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 2, 0, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 4, 0, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 4, 1, -0.5, 0.5, 0.5,
-4.118716, -3.597625, 4, 1, 1.5, 0.5, 0.5,
-4.118716, -3.597625, 4, 0, 1.5, 0.5, 0.5
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
-3.556985, -3.13555, -5.21689,
-3.556985, 3.025455, -5.21689,
-3.556985, -3.13555, 5.532235,
-3.556985, 3.025455, 5.532235,
-3.556985, -3.13555, -5.21689,
-3.556985, -3.13555, 5.532235,
-3.556985, 3.025455, -5.21689,
-3.556985, 3.025455, 5.532235,
-3.556985, -3.13555, -5.21689,
3.932755, -3.13555, -5.21689,
-3.556985, -3.13555, 5.532235,
3.932755, -3.13555, 5.532235,
-3.556985, 3.025455, -5.21689,
3.932755, 3.025455, -5.21689,
-3.556985, 3.025455, 5.532235,
3.932755, 3.025455, 5.532235,
3.932755, -3.13555, -5.21689,
3.932755, 3.025455, -5.21689,
3.932755, -3.13555, 5.532235,
3.932755, 3.025455, 5.532235,
3.932755, -3.13555, -5.21689,
3.932755, -3.13555, 5.532235,
3.932755, 3.025455, -5.21689,
3.932755, 3.025455, 5.532235
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
var radius = 7.730702;
var distance = 34.39476;
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
mvMatrix.translate( -0.1878847, 0.05504727, -0.1576722 );
mvMatrix.scale( 1.116005, 1.356692, 0.7776062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39476);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
S-2-ethylsulfinyleth<-read.table("S-2-ethylsulfinyleth.xyz")
```

```
## Error in read.table("S-2-ethylsulfinyleth.xyz"): no lines available in input
```

```r
x<-S-2-ethylsulfinyleth$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-2-ethylsulfinyleth$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-2-ethylsulfinyleth$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.447912, 0.2874672, -1.977286, 0, 0, 1, 1, 1,
-2.814934, -0.7074999, -0.0359895, 1, 0, 0, 1, 1,
-2.603184, 0.0133484, -1.812727, 1, 0, 0, 1, 1,
-2.510676, 0.7601646, -1.117078, 1, 0, 0, 1, 1,
-2.441993, 0.3075725, -0.8770266, 1, 0, 0, 1, 1,
-2.412179, -0.8103036, -1.389401, 1, 0, 0, 1, 1,
-2.410592, 0.8751009, -2.336885, 0, 0, 0, 1, 1,
-2.385971, -0.2573728, -0.729584, 0, 0, 0, 1, 1,
-2.362671, 0.2061431, -1.955192, 0, 0, 0, 1, 1,
-2.362072, -0.5892115, -2.59246, 0, 0, 0, 1, 1,
-2.294097, 0.8745975, -1.706078, 0, 0, 0, 1, 1,
-2.242315, -0.5000418, -2.483658, 0, 0, 0, 1, 1,
-2.231216, 0.2630346, -0.301734, 0, 0, 0, 1, 1,
-2.172176, 0.9089831, -1.286821, 1, 1, 1, 1, 1,
-2.153494, -1.659198, -1.485121, 1, 1, 1, 1, 1,
-2.1479, -0.5296877, -1.960065, 1, 1, 1, 1, 1,
-2.131173, -1.523869, -1.528829, 1, 1, 1, 1, 1,
-2.094942, -0.8462624, -1.114973, 1, 1, 1, 1, 1,
-2.089348, -0.8754374, -2.59627, 1, 1, 1, 1, 1,
-2.046, 1.195647, -1.095827, 1, 1, 1, 1, 1,
-1.999109, -1.116473, -2.717619, 1, 1, 1, 1, 1,
-1.998203, 0.0177476, -0.6186459, 1, 1, 1, 1, 1,
-1.982776, -0.03092436, -0.9468199, 1, 1, 1, 1, 1,
-1.975955, 0.9835335, -0.356638, 1, 1, 1, 1, 1,
-1.944556, -2.318458, -3.791058, 1, 1, 1, 1, 1,
-1.933249, 0.3808929, -0.6313999, 1, 1, 1, 1, 1,
-1.887793, -2.340918, -3.244188, 1, 1, 1, 1, 1,
-1.87982, -1.21701, -2.637528, 1, 1, 1, 1, 1,
-1.879755, -1.394398, -1.673382, 0, 0, 1, 1, 1,
-1.802837, -0.3523217, -2.809616, 1, 0, 0, 1, 1,
-1.801139, -0.1278977, 0.2709173, 1, 0, 0, 1, 1,
-1.799965, -1.118422, -3.731233, 1, 0, 0, 1, 1,
-1.79967, -0.6477844, -0.1687166, 1, 0, 0, 1, 1,
-1.769864, -0.7556409, -0.3774906, 1, 0, 0, 1, 1,
-1.764383, -0.2627244, -1.841824, 0, 0, 0, 1, 1,
-1.755154, 0.6732156, 0.3104086, 0, 0, 0, 1, 1,
-1.753338, -0.1059383, -1.119428, 0, 0, 0, 1, 1,
-1.752052, 0.1506096, -1.910644, 0, 0, 0, 1, 1,
-1.747212, 0.628798, 0.3860243, 0, 0, 0, 1, 1,
-1.743895, 0.2572482, -3.352311, 0, 0, 0, 1, 1,
-1.731764, -0.3767247, 0.1343764, 0, 0, 0, 1, 1,
-1.711499, 0.3235994, -1.111561, 1, 1, 1, 1, 1,
-1.70418, -1.038669, -1.863974, 1, 1, 1, 1, 1,
-1.703849, -2.131057, -1.881931, 1, 1, 1, 1, 1,
-1.702702, -1.070646, -1.342845, 1, 1, 1, 1, 1,
-1.695604, 1.845103, -0.5634748, 1, 1, 1, 1, 1,
-1.68088, 0.6891283, -1.335238, 1, 1, 1, 1, 1,
-1.679958, 0.3341569, -2.494955, 1, 1, 1, 1, 1,
-1.674964, -0.5076863, -2.131487, 1, 1, 1, 1, 1,
-1.655014, -1.039848, -3.138179, 1, 1, 1, 1, 1,
-1.595642, 0.2340609, -2.490564, 1, 1, 1, 1, 1,
-1.58387, -0.2761597, -2.571578, 1, 1, 1, 1, 1,
-1.562776, 1.602071, -0.4897478, 1, 1, 1, 1, 1,
-1.557701, 0.5990846, -1.739034, 1, 1, 1, 1, 1,
-1.556187, -0.4987265, -3.658525, 1, 1, 1, 1, 1,
-1.554402, -0.2547973, -2.459818, 1, 1, 1, 1, 1,
-1.550943, 1.657204, -3.503049, 0, 0, 1, 1, 1,
-1.540916, -0.6737892, -1.019838, 1, 0, 0, 1, 1,
-1.52895, -0.6379612, -2.344473, 1, 0, 0, 1, 1,
-1.527934, -1.928813, -3.351196, 1, 0, 0, 1, 1,
-1.526435, -0.6239508, -2.180126, 1, 0, 0, 1, 1,
-1.513995, -0.2916448, -1.816806, 1, 0, 0, 1, 1,
-1.510074, -0.4765839, -1.397161, 0, 0, 0, 1, 1,
-1.493913, -1.63423, -3.603823, 0, 0, 0, 1, 1,
-1.485588, -0.03345917, -1.728076, 0, 0, 0, 1, 1,
-1.480888, -1.456701, -2.869381, 0, 0, 0, 1, 1,
-1.472614, -0.1609743, -1.925714, 0, 0, 0, 1, 1,
-1.462731, -1.309086, -1.298569, 0, 0, 0, 1, 1,
-1.46005, -0.7746574, -2.311127, 0, 0, 0, 1, 1,
-1.458636, -0.6230591, -3.260926, 1, 1, 1, 1, 1,
-1.442808, 0.01775588, -2.785625, 1, 1, 1, 1, 1,
-1.442692, -1.633645, -2.1565, 1, 1, 1, 1, 1,
-1.437439, -0.6563956, 0.1221422, 1, 1, 1, 1, 1,
-1.432658, 0.747023, -1.986712, 1, 1, 1, 1, 1,
-1.429271, 0.7312309, -0.0861772, 1, 1, 1, 1, 1,
-1.414704, 0.3677339, -1.525469, 1, 1, 1, 1, 1,
-1.413763, 0.1341007, -2.075513, 1, 1, 1, 1, 1,
-1.406346, -0.8787833, -3.044067, 1, 1, 1, 1, 1,
-1.388028, -1.016889, -2.200806, 1, 1, 1, 1, 1,
-1.375987, 1.381723, -0.8374245, 1, 1, 1, 1, 1,
-1.362028, -0.280524, -3.463795, 1, 1, 1, 1, 1,
-1.344321, -0.9691331, -1.212524, 1, 1, 1, 1, 1,
-1.342375, -1.484011, 0.3610626, 1, 1, 1, 1, 1,
-1.337467, 1.452735, 0.5276567, 1, 1, 1, 1, 1,
-1.32922, 0.2313798, -1.433923, 0, 0, 1, 1, 1,
-1.326503, 0.2441655, -2.867622, 1, 0, 0, 1, 1,
-1.306032, -0.1477349, -2.264875, 1, 0, 0, 1, 1,
-1.293843, 0.822139, -0.7513084, 1, 0, 0, 1, 1,
-1.291395, 0.5490438, -0.1424532, 1, 0, 0, 1, 1,
-1.291275, -0.6337334, -1.105924, 1, 0, 0, 1, 1,
-1.291209, 0.9600089, -0.3006755, 0, 0, 0, 1, 1,
-1.282453, -0.4942423, -1.76746, 0, 0, 0, 1, 1,
-1.272429, -0.187389, -0.9846855, 0, 0, 0, 1, 1,
-1.270129, -1.00299, -1.828873, 0, 0, 0, 1, 1,
-1.256644, -0.5242014, -1.440625, 0, 0, 0, 1, 1,
-1.253785, -1.107291, -2.920053, 0, 0, 0, 1, 1,
-1.248847, -0.2358564, -1.738556, 0, 0, 0, 1, 1,
-1.244598, 1.347937, -0.9926425, 1, 1, 1, 1, 1,
-1.236644, -1.810813, -1.828349, 1, 1, 1, 1, 1,
-1.232777, -0.03324543, -0.3552166, 1, 1, 1, 1, 1,
-1.228303, -0.01472351, -1.623517, 1, 1, 1, 1, 1,
-1.22808, 0.5526922, -0.8024648, 1, 1, 1, 1, 1,
-1.222724, -0.6646666, -2.095073, 1, 1, 1, 1, 1,
-1.216552, -1.684017, -1.761001, 1, 1, 1, 1, 1,
-1.214595, -0.8080878, -0.2035151, 1, 1, 1, 1, 1,
-1.210316, -1.873302, -2.895757, 1, 1, 1, 1, 1,
-1.210046, -0.9769971, -1.533264, 1, 1, 1, 1, 1,
-1.204409, -2.287338, -0.6509552, 1, 1, 1, 1, 1,
-1.200706, 0.5588039, -0.7499897, 1, 1, 1, 1, 1,
-1.190415, -0.7792639, -0.03197787, 1, 1, 1, 1, 1,
-1.190133, -0.06581077, -1.962841, 1, 1, 1, 1, 1,
-1.182219, 0.2079514, -0.403675, 1, 1, 1, 1, 1,
-1.17238, -1.339902, -2.755748, 0, 0, 1, 1, 1,
-1.165722, -0.1198776, -2.245869, 1, 0, 0, 1, 1,
-1.160954, -0.3196185, 0.625071, 1, 0, 0, 1, 1,
-1.160189, -1.309472, -3.425871, 1, 0, 0, 1, 1,
-1.142933, -0.7054169, -3.396661, 1, 0, 0, 1, 1,
-1.141121, -0.392518, -2.664223, 1, 0, 0, 1, 1,
-1.138459, 0.05758986, 0.4407967, 0, 0, 0, 1, 1,
-1.135149, -0.251664, -2.924337, 0, 0, 0, 1, 1,
-1.129594, 0.9214073, 0.1672914, 0, 0, 0, 1, 1,
-1.117506, -0.6927325, -2.71128, 0, 0, 0, 1, 1,
-1.116138, -0.06834642, -1.486829, 0, 0, 0, 1, 1,
-1.10977, -0.9046441, -0.2975748, 0, 0, 0, 1, 1,
-1.102245, -1.015104, -2.408418, 0, 0, 0, 1, 1,
-1.095995, 0.08858532, -0.6593089, 1, 1, 1, 1, 1,
-1.09499, -0.6425468, -1.972597, 1, 1, 1, 1, 1,
-1.088053, -0.4687349, -1.634929, 1, 1, 1, 1, 1,
-1.085864, -0.2822888, -3.172664, 1, 1, 1, 1, 1,
-1.079211, -2.172271, -3.019111, 1, 1, 1, 1, 1,
-1.076069, 1.17854, -0.2375883, 1, 1, 1, 1, 1,
-1.066271, -0.6304013, -0.8806575, 1, 1, 1, 1, 1,
-1.064078, -0.3109785, -0.5204283, 1, 1, 1, 1, 1,
-1.064037, -0.1257736, -0.2305423, 1, 1, 1, 1, 1,
-1.062445, -0.8778915, -3.518977, 1, 1, 1, 1, 1,
-1.050328, -0.1559464, -1.90972, 1, 1, 1, 1, 1,
-1.048316, -0.215398, -1.131285, 1, 1, 1, 1, 1,
-1.045152, 0.6251882, -1.772487, 1, 1, 1, 1, 1,
-1.04005, -0.7142178, -2.758022, 1, 1, 1, 1, 1,
-1.039803, 0.5250213, -2.512691, 1, 1, 1, 1, 1,
-1.033442, 0.6231844, -1.354172, 0, 0, 1, 1, 1,
-1.031808, 1.733276, -0.2405092, 1, 0, 0, 1, 1,
-1.01992, 0.5023789, -1.511454, 1, 0, 0, 1, 1,
-1.01447, -0.3289378, -0.8443238, 1, 0, 0, 1, 1,
-1.010472, -0.268624, -2.030723, 1, 0, 0, 1, 1,
-1.009177, 0.3741943, 0.07441375, 1, 0, 0, 1, 1,
-1.007936, 0.1684421, -1.532534, 0, 0, 0, 1, 1,
-1.007248, -0.2726692, -3.220102, 0, 0, 0, 1, 1,
-0.9978428, 0.8369459, -1.558811, 0, 0, 0, 1, 1,
-0.9715878, -0.3246545, -1.712663, 0, 0, 0, 1, 1,
-0.9619923, -0.525943, -0.9989637, 0, 0, 0, 1, 1,
-0.9612128, -1.746731, -2.611017, 0, 0, 0, 1, 1,
-0.9583675, 1.969912, -1.029251, 0, 0, 0, 1, 1,
-0.9577847, 0.07004389, -1.586611, 1, 1, 1, 1, 1,
-0.9521222, 2.767304, -0.1045534, 1, 1, 1, 1, 1,
-0.9485157, -0.9602019, -2.871182, 1, 1, 1, 1, 1,
-0.9396314, 0.3874123, -0.9684119, 1, 1, 1, 1, 1,
-0.9366485, -1.0154, -1.587457, 1, 1, 1, 1, 1,
-0.9364533, 0.4729041, -0.2835704, 1, 1, 1, 1, 1,
-0.9356759, 0.1457458, -1.609492, 1, 1, 1, 1, 1,
-0.9349011, -0.3983292, -1.288876, 1, 1, 1, 1, 1,
-0.9342849, -0.1382032, -3.4675, 1, 1, 1, 1, 1,
-0.9235656, 0.01671277, -1.92818, 1, 1, 1, 1, 1,
-0.9164549, 1.926365, 1.585686, 1, 1, 1, 1, 1,
-0.9157735, -0.862087, -1.941376, 1, 1, 1, 1, 1,
-0.9101577, 1.541879, -2.836536, 1, 1, 1, 1, 1,
-0.9052442, 0.7770441, -2.820338, 1, 1, 1, 1, 1,
-0.9050274, 1.546936, -0.03388457, 1, 1, 1, 1, 1,
-0.8995857, 1.263648, -1.239661, 0, 0, 1, 1, 1,
-0.8978786, 1.653208, 0.7723594, 1, 0, 0, 1, 1,
-0.8906969, 1.366356, -1.482072, 1, 0, 0, 1, 1,
-0.8888445, -0.5174478, -1.600187, 1, 0, 0, 1, 1,
-0.8864694, -0.004657465, -2.564325, 1, 0, 0, 1, 1,
-0.8850033, 0.8869882, -1.572364, 1, 0, 0, 1, 1,
-0.8830405, 0.8165174, -1.746181, 0, 0, 0, 1, 1,
-0.8829857, 0.03338798, -1.532188, 0, 0, 0, 1, 1,
-0.8806294, -2.146324, -4.755476, 0, 0, 0, 1, 1,
-0.880152, -2.001488, -3.443322, 0, 0, 0, 1, 1,
-0.8799706, 0.4630401, -2.223918, 0, 0, 0, 1, 1,
-0.8798573, 2.113681, 1.31408, 0, 0, 0, 1, 1,
-0.8787444, 0.1460219, -2.080293, 0, 0, 0, 1, 1,
-0.8742064, 0.05143307, -2.139347, 1, 1, 1, 1, 1,
-0.8696276, -0.4261753, -0.5731553, 1, 1, 1, 1, 1,
-0.8636063, -1.112477, -2.874324, 1, 1, 1, 1, 1,
-0.8534786, 0.2688639, -0.4869735, 1, 1, 1, 1, 1,
-0.8531025, -0.09463786, -1.982136, 1, 1, 1, 1, 1,
-0.85021, 0.04670752, -0.9374107, 1, 1, 1, 1, 1,
-0.8400002, 2.718529, -1.459445, 1, 1, 1, 1, 1,
-0.838721, -0.803628, -2.386717, 1, 1, 1, 1, 1,
-0.8370564, -0.4936969, -1.339124, 1, 1, 1, 1, 1,
-0.8344505, 1.368572, -2.020701, 1, 1, 1, 1, 1,
-0.8320986, 1.281884, -0.3818799, 1, 1, 1, 1, 1,
-0.8304611, -0.2316879, -0.09922636, 1, 1, 1, 1, 1,
-0.8258663, 1.314668, -0.259461, 1, 1, 1, 1, 1,
-0.8256167, 1.381184, 1.619181, 1, 1, 1, 1, 1,
-0.8213599, 0.3848611, -2.54003, 1, 1, 1, 1, 1,
-0.8212709, -0.06336553, -1.300113, 0, 0, 1, 1, 1,
-0.8183376, 0.6114864, -0.2932689, 1, 0, 0, 1, 1,
-0.8157289, -0.8372078, -1.004393, 1, 0, 0, 1, 1,
-0.8150143, -0.325267, 0.8039916, 1, 0, 0, 1, 1,
-0.8119523, -0.245883, -2.115825, 1, 0, 0, 1, 1,
-0.8067417, 1.491844, -0.05157903, 1, 0, 0, 1, 1,
-0.806637, -1.759384, -3.315941, 0, 0, 0, 1, 1,
-0.8052485, -1.129133, -3.592256, 0, 0, 0, 1, 1,
-0.8029757, 0.5019448, -2.102357, 0, 0, 0, 1, 1,
-0.8001356, 2.768856, -0.4866179, 0, 0, 0, 1, 1,
-0.7988625, -1.477454, -3.245214, 0, 0, 0, 1, 1,
-0.7986251, -0.8549396, -1.540913, 0, 0, 0, 1, 1,
-0.7977296, 0.06831299, -0.6199164, 0, 0, 0, 1, 1,
-0.7930007, -1.145219, -2.976089, 1, 1, 1, 1, 1,
-0.7911895, 0.3021671, -1.00246, 1, 1, 1, 1, 1,
-0.7894745, 0.4789288, -2.285083, 1, 1, 1, 1, 1,
-0.7808387, 0.4104539, -0.8344871, 1, 1, 1, 1, 1,
-0.7750837, -0.755702, -2.932995, 1, 1, 1, 1, 1,
-0.7740393, 1.817941, -0.346533, 1, 1, 1, 1, 1,
-0.7736571, 1.386674, -0.3537788, 1, 1, 1, 1, 1,
-0.7734568, -0.1660295, -1.393847, 1, 1, 1, 1, 1,
-0.7690145, 0.2090697, -1.19032, 1, 1, 1, 1, 1,
-0.7591469, 0.4562746, -0.7798297, 1, 1, 1, 1, 1,
-0.7579783, 0.7611533, -0.8325077, 1, 1, 1, 1, 1,
-0.7573905, 0.0432223, -2.330278, 1, 1, 1, 1, 1,
-0.7555446, -0.06949776, -4.31335, 1, 1, 1, 1, 1,
-0.7547315, -0.3266064, -3.579639, 1, 1, 1, 1, 1,
-0.7525957, -0.8974183, -1.691916, 1, 1, 1, 1, 1,
-0.7495987, -1.312878, -2.356399, 0, 0, 1, 1, 1,
-0.7374557, 0.2122986, -2.500926, 1, 0, 0, 1, 1,
-0.7318827, 0.313637, -1.124521, 1, 0, 0, 1, 1,
-0.7266562, -0.2481075, -1.637321, 1, 0, 0, 1, 1,
-0.7229095, -0.5989423, -2.656894, 1, 0, 0, 1, 1,
-0.7137216, 1.020515, 0.2274698, 1, 0, 0, 1, 1,
-0.6995093, -1.337258, -3.548195, 0, 0, 0, 1, 1,
-0.6980227, -1.505723, -3.044292, 0, 0, 0, 1, 1,
-0.697331, -0.005750632, -0.1817401, 0, 0, 0, 1, 1,
-0.6893393, -1.546122, -1.987799, 0, 0, 0, 1, 1,
-0.6881294, -0.9795541, -2.810945, 0, 0, 0, 1, 1,
-0.680881, -3.045826, -2.829278, 0, 0, 0, 1, 1,
-0.6661366, 0.9841931, -2.232182, 0, 0, 0, 1, 1,
-0.6643177, -1.278053, -3.07167, 1, 1, 1, 1, 1,
-0.6600954, -0.5683028, -0.7566745, 1, 1, 1, 1, 1,
-0.6544381, -0.6635455, -0.9592981, 1, 1, 1, 1, 1,
-0.6513557, -0.2877428, -2.39464, 1, 1, 1, 1, 1,
-0.6511975, 1.232408, -1.209023, 1, 1, 1, 1, 1,
-0.6439595, -0.02205651, 0.3121084, 1, 1, 1, 1, 1,
-0.6409667, -0.2035093, -0.8496222, 1, 1, 1, 1, 1,
-0.6396215, 1.103097, 1.232123, 1, 1, 1, 1, 1,
-0.6392674, -0.3561814, -3.136061, 1, 1, 1, 1, 1,
-0.6365043, -1.378935, -1.533898, 1, 1, 1, 1, 1,
-0.6345116, -1.55368, -3.077518, 1, 1, 1, 1, 1,
-0.6336653, -0.2499941, -1.236904, 1, 1, 1, 1, 1,
-0.6325154, 0.4698741, -2.893559, 1, 1, 1, 1, 1,
-0.631259, -0.9653689, -3.174273, 1, 1, 1, 1, 1,
-0.630034, -0.03686107, -0.3465067, 1, 1, 1, 1, 1,
-0.6296364, 0.4768638, -0.7661681, 0, 0, 1, 1, 1,
-0.629309, 0.8831642, -0.1617778, 1, 0, 0, 1, 1,
-0.6245161, -0.2580971, -2.883591, 1, 0, 0, 1, 1,
-0.620472, -0.3242729, -0.5043646, 1, 0, 0, 1, 1,
-0.6202805, 0.07407467, -0.7468183, 1, 0, 0, 1, 1,
-0.6202097, -0.3457523, -2.5595, 1, 0, 0, 1, 1,
-0.6150079, -1.807501, -2.818678, 0, 0, 0, 1, 1,
-0.6146839, -0.467106, -3.499693, 0, 0, 0, 1, 1,
-0.6138951, 0.7513177, -0.7925209, 0, 0, 0, 1, 1,
-0.6079319, -0.3024459, -2.508606, 0, 0, 0, 1, 1,
-0.607538, -2.398224, -2.803446, 0, 0, 0, 1, 1,
-0.6017306, -0.09716129, -3.654348, 0, 0, 0, 1, 1,
-0.5959287, 0.07513635, -3.690657, 0, 0, 0, 1, 1,
-0.5953402, 0.3148857, -1.028454, 1, 1, 1, 1, 1,
-0.5933005, 1.345316, -0.6191463, 1, 1, 1, 1, 1,
-0.593167, 0.9882833, -0.6162521, 1, 1, 1, 1, 1,
-0.5931395, 2.383832, -0.2554148, 1, 1, 1, 1, 1,
-0.5918842, 0.5224544, -1.249106, 1, 1, 1, 1, 1,
-0.5838651, -1.067118, -2.395846, 1, 1, 1, 1, 1,
-0.5831745, -0.2295923, -0.01494498, 1, 1, 1, 1, 1,
-0.5770515, 0.1689924, -2.194613, 1, 1, 1, 1, 1,
-0.5706643, -0.2807498, -1.794854, 1, 1, 1, 1, 1,
-0.5672064, -1.033751, -2.222331, 1, 1, 1, 1, 1,
-0.5644169, -0.5838229, -2.594327, 1, 1, 1, 1, 1,
-0.5628769, -1.594925, -3.026706, 1, 1, 1, 1, 1,
-0.5625082, -0.1844667, -2.179362, 1, 1, 1, 1, 1,
-0.5609494, 1.869682, -0.8277101, 1, 1, 1, 1, 1,
-0.5593474, -1.580131, -1.890697, 1, 1, 1, 1, 1,
-0.5589445, -0.6152726, -2.473353, 0, 0, 1, 1, 1,
-0.558611, 0.004238574, -1.610553, 1, 0, 0, 1, 1,
-0.552428, 0.9992507, -2.888346, 1, 0, 0, 1, 1,
-0.5506241, -0.2261841, -1.943902, 1, 0, 0, 1, 1,
-0.5451969, 0.1121492, 0.8704639, 1, 0, 0, 1, 1,
-0.5437531, -0.3302918, -3.141669, 1, 0, 0, 1, 1,
-0.5402837, -0.4177662, -2.054781, 0, 0, 0, 1, 1,
-0.5380852, -0.05738881, -1.648717, 0, 0, 0, 1, 1,
-0.5333544, -0.5821018, -2.49854, 0, 0, 0, 1, 1,
-0.5298851, 0.6644549, -0.3256863, 0, 0, 0, 1, 1,
-0.5292267, 1.172541, 0.8081609, 0, 0, 0, 1, 1,
-0.5282631, -0.374532, -2.64994, 0, 0, 0, 1, 1,
-0.5252788, 1.069648, -0.09368814, 0, 0, 0, 1, 1,
-0.5252758, 0.1383535, 0.2319981, 1, 1, 1, 1, 1,
-0.5214216, 0.9271213, -1.010032, 1, 1, 1, 1, 1,
-0.520965, 0.5985522, -0.3006985, 1, 1, 1, 1, 1,
-0.5135589, -2.176514, -2.758862, 1, 1, 1, 1, 1,
-0.5126109, 1.77768, -0.02556188, 1, 1, 1, 1, 1,
-0.501181, -0.4498326, -2.691988, 1, 1, 1, 1, 1,
-0.4987742, 0.2147397, -0.9785591, 1, 1, 1, 1, 1,
-0.497744, 0.993735, -0.2065535, 1, 1, 1, 1, 1,
-0.4964888, 0.7419764, 0.4519157, 1, 1, 1, 1, 1,
-0.4868114, -1.281082, -4.32487, 1, 1, 1, 1, 1,
-0.4813398, -1.998978, -3.851847, 1, 1, 1, 1, 1,
-0.4777477, -1.773414, -2.499907, 1, 1, 1, 1, 1,
-0.4733215, 1.152204, -1.895355, 1, 1, 1, 1, 1,
-0.4732784, -1.325318, -0.4475773, 1, 1, 1, 1, 1,
-0.470135, 0.9826022, 0.4228632, 1, 1, 1, 1, 1,
-0.4698457, 0.2687059, -0.9396743, 0, 0, 1, 1, 1,
-0.4686497, 1.199241, 0.1444178, 1, 0, 0, 1, 1,
-0.4679971, 0.4446331, -1.339123, 1, 0, 0, 1, 1,
-0.4671888, -1.135157, -3.309219, 1, 0, 0, 1, 1,
-0.4670077, -0.1136218, -2.314922, 1, 0, 0, 1, 1,
-0.4666381, 0.7412094, -0.8581182, 1, 0, 0, 1, 1,
-0.4614107, -1.828448, -4.024493, 0, 0, 0, 1, 1,
-0.4583898, 0.3306925, 1.00242, 0, 0, 0, 1, 1,
-0.4545985, 1.326845, -0.1035007, 0, 0, 0, 1, 1,
-0.4541872, -1.483659, -3.364736, 0, 0, 0, 1, 1,
-0.4520182, -0.3812068, -2.444713, 0, 0, 0, 1, 1,
-0.4443313, -0.4149771, -1.595064, 0, 0, 0, 1, 1,
-0.4440449, -1.294761, -3.016367, 0, 0, 0, 1, 1,
-0.442987, -1.059063, -1.215427, 1, 1, 1, 1, 1,
-0.4408219, -0.1212833, -2.534609, 1, 1, 1, 1, 1,
-0.4374278, 0.2001664, -2.26727, 1, 1, 1, 1, 1,
-0.4350682, -1.116304, -2.413658, 1, 1, 1, 1, 1,
-0.4338388, 1.068227, -2.352706, 1, 1, 1, 1, 1,
-0.4291815, -1.034598, -4.00615, 1, 1, 1, 1, 1,
-0.429137, -0.05505234, -1.415721, 1, 1, 1, 1, 1,
-0.427902, 0.5074704, -0.3613283, 1, 1, 1, 1, 1,
-0.4157556, -0.3034745, -0.3545658, 1, 1, 1, 1, 1,
-0.4148761, -0.8396158, -4.58683, 1, 1, 1, 1, 1,
-0.4133546, 0.1066905, -1.242783, 1, 1, 1, 1, 1,
-0.4126003, 0.4874756, -0.8960884, 1, 1, 1, 1, 1,
-0.4081002, -0.3787001, -2.219326, 1, 1, 1, 1, 1,
-0.4076246, -0.3000548, -2.597249, 1, 1, 1, 1, 1,
-0.406424, 0.4663323, -1.077052, 1, 1, 1, 1, 1,
-0.4037229, 0.4585074, -2.237013, 0, 0, 1, 1, 1,
-0.3991839, -0.30091, -2.281034, 1, 0, 0, 1, 1,
-0.3944152, 1.739052, 0.914313, 1, 0, 0, 1, 1,
-0.3935458, 0.9857575, -0.03320593, 1, 0, 0, 1, 1,
-0.3935294, -0.08693227, -1.356437, 1, 0, 0, 1, 1,
-0.3905226, 0.1360477, -0.3206988, 1, 0, 0, 1, 1,
-0.3896706, 1.16161, 0.1154853, 0, 0, 0, 1, 1,
-0.3880896, -1.2099, -2.545077, 0, 0, 0, 1, 1,
-0.3869139, -0.5817646, -1.921104, 0, 0, 0, 1, 1,
-0.3849694, -1.659812, -3.325966, 0, 0, 0, 1, 1,
-0.384844, 0.03203979, -1.944724, 0, 0, 0, 1, 1,
-0.3781264, 0.31519, -0.1803014, 0, 0, 0, 1, 1,
-0.3765765, -0.6081815, -1.324755, 0, 0, 0, 1, 1,
-0.3751517, -0.1516285, -2.081692, 1, 1, 1, 1, 1,
-0.3747416, 0.9137836, 0.6999296, 1, 1, 1, 1, 1,
-0.3733068, 1.386995, 0.08520266, 1, 1, 1, 1, 1,
-0.3705951, -0.7277589, -3.118661, 1, 1, 1, 1, 1,
-0.37023, -0.8652054, -3.585536, 1, 1, 1, 1, 1,
-0.3674339, -0.5256778, -2.649277, 1, 1, 1, 1, 1,
-0.3627918, 0.4652572, 1.09707, 1, 1, 1, 1, 1,
-0.3612547, -0.6375296, -1.700561, 1, 1, 1, 1, 1,
-0.3564397, -0.6885267, -1.759293, 1, 1, 1, 1, 1,
-0.3563532, 0.2376236, 0.230883, 1, 1, 1, 1, 1,
-0.3559088, 0.5648146, -0.2781508, 1, 1, 1, 1, 1,
-0.3539155, 0.8459365, -0.9238548, 1, 1, 1, 1, 1,
-0.3519785, 0.2763961, -0.6697232, 1, 1, 1, 1, 1,
-0.3489968, -0.4171704, -2.09931, 1, 1, 1, 1, 1,
-0.3381115, 1.411808, 0.5390547, 1, 1, 1, 1, 1,
-0.3372703, -1.033562, -2.665047, 0, 0, 1, 1, 1,
-0.3338341, -0.4230369, -2.031403, 1, 0, 0, 1, 1,
-0.3331349, -0.7986805, -2.137047, 1, 0, 0, 1, 1,
-0.3291696, -0.2683274, -0.5114898, 1, 0, 0, 1, 1,
-0.3247337, 0.5391129, 0.6072708, 1, 0, 0, 1, 1,
-0.3245673, -0.5972067, -3.008764, 1, 0, 0, 1, 1,
-0.3244153, -0.444884, -2.904573, 0, 0, 0, 1, 1,
-0.3198729, -0.2767152, -1.619816, 0, 0, 0, 1, 1,
-0.3151033, -0.5389321, -2.309128, 0, 0, 0, 1, 1,
-0.3139702, -0.6990511, -3.919945, 0, 0, 0, 1, 1,
-0.3059233, 0.925366, -0.279658, 0, 0, 0, 1, 1,
-0.3033192, -0.2524874, -1.237943, 0, 0, 0, 1, 1,
-0.2996348, 0.3772272, -0.2491081, 0, 0, 0, 1, 1,
-0.2985187, -0.8043143, -3.468863, 1, 1, 1, 1, 1,
-0.2916785, -0.1307463, -2.834182, 1, 1, 1, 1, 1,
-0.2897533, 0.6883629, -0.5246484, 1, 1, 1, 1, 1,
-0.2844925, -0.1790076, -2.710255, 1, 1, 1, 1, 1,
-0.2839946, 0.5406231, -0.3633913, 1, 1, 1, 1, 1,
-0.2810818, -1.250793, -2.514365, 1, 1, 1, 1, 1,
-0.2786972, -0.3158961, -2.629813, 1, 1, 1, 1, 1,
-0.2750211, -0.03775464, -1.931915, 1, 1, 1, 1, 1,
-0.272457, -1.520865, -2.202472, 1, 1, 1, 1, 1,
-0.2668159, 0.8760445, 0.2543162, 1, 1, 1, 1, 1,
-0.2618546, -0.1079952, -2.472955, 1, 1, 1, 1, 1,
-0.261405, -0.3423739, -1.139016, 1, 1, 1, 1, 1,
-0.2608254, -1.107109, -2.156531, 1, 1, 1, 1, 1,
-0.258505, 0.463518, -1.793221, 1, 1, 1, 1, 1,
-0.2472247, -0.4294118, -3.493923, 1, 1, 1, 1, 1,
-0.2471422, -0.1621063, -2.776194, 0, 0, 1, 1, 1,
-0.2468019, 0.4739114, -1.816472, 1, 0, 0, 1, 1,
-0.2421463, 0.451056, -2.051255, 1, 0, 0, 1, 1,
-0.2418025, 1.061759, 0.6075532, 1, 0, 0, 1, 1,
-0.238553, -0.3425319, -1.044561, 1, 0, 0, 1, 1,
-0.2358098, 0.7793025, 0.5307374, 1, 0, 0, 1, 1,
-0.2320375, -1.958106, -2.959639, 0, 0, 0, 1, 1,
-0.2261631, -1.693149, -5.060349, 0, 0, 0, 1, 1,
-0.225804, 0.4943202, -1.090706, 0, 0, 0, 1, 1,
-0.2250624, -0.3270424, -2.089508, 0, 0, 0, 1, 1,
-0.218872, 0.3807015, -0.4334026, 0, 0, 0, 1, 1,
-0.218439, -0.6673104, -2.205285, 0, 0, 0, 1, 1,
-0.2172068, -0.9309305, -4.174068, 0, 0, 0, 1, 1,
-0.2170169, -0.2583067, -1.831346, 1, 1, 1, 1, 1,
-0.2139486, -0.8943421, -2.604944, 1, 1, 1, 1, 1,
-0.2129052, -0.1250537, -1.335313, 1, 1, 1, 1, 1,
-0.2123933, -0.9675369, -1.980275, 1, 1, 1, 1, 1,
-0.2120075, 0.3964145, 1.359352, 1, 1, 1, 1, 1,
-0.2099285, -0.748704, -2.674781, 1, 1, 1, 1, 1,
-0.2066957, -0.1240033, -1.29947, 1, 1, 1, 1, 1,
-0.2051611, 0.8945413, -1.620677, 1, 1, 1, 1, 1,
-0.2047829, 0.590792, 0.8282523, 1, 1, 1, 1, 1,
-0.196772, -0.6198949, -1.462797, 1, 1, 1, 1, 1,
-0.1946581, -1.257679, -3.336708, 1, 1, 1, 1, 1,
-0.1896164, 0.1993615, 0.7136328, 1, 1, 1, 1, 1,
-0.1835278, -1.360011, -2.941454, 1, 1, 1, 1, 1,
-0.1812138, -0.7018475, -1.765253, 1, 1, 1, 1, 1,
-0.1785918, 0.8477501, 0.3216551, 1, 1, 1, 1, 1,
-0.1748149, -1.846302, -2.968244, 0, 0, 1, 1, 1,
-0.1740312, -1.555209, -3.026112, 1, 0, 0, 1, 1,
-0.1727145, -2.014696, -2.907862, 1, 0, 0, 1, 1,
-0.1726561, 0.3300379, 0.3355968, 1, 0, 0, 1, 1,
-0.1617295, 0.2037426, -0.5074673, 1, 0, 0, 1, 1,
-0.157737, 0.4373814, 0.7346507, 1, 0, 0, 1, 1,
-0.1560094, -0.4702263, -3.802194, 0, 0, 0, 1, 1,
-0.1549621, 0.4677097, -1.105343, 0, 0, 0, 1, 1,
-0.1529585, 1.18629, -0.2124111, 0, 0, 0, 1, 1,
-0.1529419, 0.2643221, -0.5026556, 0, 0, 0, 1, 1,
-0.1508023, -0.3471262, -1.448767, 0, 0, 0, 1, 1,
-0.150748, 0.5424144, 0.4415804, 0, 0, 0, 1, 1,
-0.1466035, -0.963679, -3.307894, 0, 0, 0, 1, 1,
-0.1425748, -1.474994, -2.900724, 1, 1, 1, 1, 1,
-0.1422581, -1.838403, -3.64696, 1, 1, 1, 1, 1,
-0.1399132, 1.270441, -0.9211342, 1, 1, 1, 1, 1,
-0.1368272, -1.739408, -1.920862, 1, 1, 1, 1, 1,
-0.1329132, -0.1087794, -2.482424, 1, 1, 1, 1, 1,
-0.1322076, -0.7779676, -2.846836, 1, 1, 1, 1, 1,
-0.1246202, 0.536177, -0.1062781, 1, 1, 1, 1, 1,
-0.1245698, 0.177554, 0.5865038, 1, 1, 1, 1, 1,
-0.117923, -1.577593, -2.261576, 1, 1, 1, 1, 1,
-0.1176246, 0.7750219, 0.263122, 1, 1, 1, 1, 1,
-0.1170701, 1.332328, 1.519862, 1, 1, 1, 1, 1,
-0.1153985, -0.319685, -1.415344, 1, 1, 1, 1, 1,
-0.115379, 1.733611, -0.7237424, 1, 1, 1, 1, 1,
-0.1150363, -0.4933337, -3.726146, 1, 1, 1, 1, 1,
-0.1115411, -0.5829241, -4.507164, 1, 1, 1, 1, 1,
-0.110855, -1.52695, -3.956279, 0, 0, 1, 1, 1,
-0.1098843, -0.134444, -1.770191, 1, 0, 0, 1, 1,
-0.109772, -0.2595902, -0.9979743, 1, 0, 0, 1, 1,
-0.1090331, -1.492305, -3.021042, 1, 0, 0, 1, 1,
-0.1007301, -0.8967541, -2.633518, 1, 0, 0, 1, 1,
-0.1004604, 1.644211, -0.5181505, 1, 0, 0, 1, 1,
-0.09869679, -0.251328, -2.992856, 0, 0, 0, 1, 1,
-0.09745071, -0.512108, -2.751005, 0, 0, 0, 1, 1,
-0.09743659, -0.3343925, -3.748015, 0, 0, 0, 1, 1,
-0.09718411, -0.08496612, -1.935797, 0, 0, 0, 1, 1,
-0.09458118, 1.619045, -0.1434388, 0, 0, 0, 1, 1,
-0.09456869, -1.472939, -3.355275, 0, 0, 0, 1, 1,
-0.09397462, -2.112536, -2.434898, 0, 0, 0, 1, 1,
-0.08806958, -1.381704, -4.298441, 1, 1, 1, 1, 1,
-0.08485696, -0.6492459, -2.296983, 1, 1, 1, 1, 1,
-0.08399338, 0.9469027, -0.3420713, 1, 1, 1, 1, 1,
-0.08243069, 1.681334, 0.6250806, 1, 1, 1, 1, 1,
-0.08077214, 0.1761733, -1.8279, 1, 1, 1, 1, 1,
-0.07981449, -0.09880184, -3.359879, 1, 1, 1, 1, 1,
-0.07865251, -0.04326971, -1.824659, 1, 1, 1, 1, 1,
-0.07848481, -0.713892, -2.013444, 1, 1, 1, 1, 1,
-0.07081803, -0.0331292, -0.2426081, 1, 1, 1, 1, 1,
-0.07057469, 0.8319865, -0.436731, 1, 1, 1, 1, 1,
-0.07004046, 0.02882576, -0.9436615, 1, 1, 1, 1, 1,
-0.06926295, 1.18775, -1.337513, 1, 1, 1, 1, 1,
-0.06857338, -0.8440332, -3.337011, 1, 1, 1, 1, 1,
-0.06563888, 0.0131757, -1.925489, 1, 1, 1, 1, 1,
-0.06538401, 0.9231214, -1.765929, 1, 1, 1, 1, 1,
-0.0626374, 0.8529105, -0.09518193, 0, 0, 1, 1, 1,
-0.05465399, -0.7360962, -3.124728, 1, 0, 0, 1, 1,
-0.05161039, 0.3967093, -1.090234, 1, 0, 0, 1, 1,
-0.04934183, -0.2451391, -3.339118, 1, 0, 0, 1, 1,
-0.04901437, -0.6455169, -2.124799, 1, 0, 0, 1, 1,
-0.04668925, 1.283499, -0.4666627, 1, 0, 0, 1, 1,
-0.04093641, -1.366735, -3.377153, 0, 0, 0, 1, 1,
-0.03889572, -0.01089843, -1.668342, 0, 0, 0, 1, 1,
-0.03781752, 0.588548, 0.1744075, 0, 0, 0, 1, 1,
-0.03755075, -0.06102528, -2.331086, 0, 0, 0, 1, 1,
-0.03521738, -1.182864, -3.152956, 0, 0, 0, 1, 1,
-0.03245632, -0.4287427, -2.912915, 0, 0, 0, 1, 1,
-0.02806679, 1.45377, 0.02943064, 0, 0, 0, 1, 1,
-0.02558193, -0.04808457, -1.269679, 1, 1, 1, 1, 1,
-0.02042168, 1.610376, -1.143302, 1, 1, 1, 1, 1,
-0.01966802, 1.657277, -0.07488819, 1, 1, 1, 1, 1,
-0.01157308, 0.1790481, -0.3877178, 1, 1, 1, 1, 1,
-0.01123313, -0.7325181, -3.441159, 1, 1, 1, 1, 1,
-0.0081308, -1.434132, -2.203484, 1, 1, 1, 1, 1,
-0.006428912, -1.209569, -2.661723, 1, 1, 1, 1, 1,
-0.002667907, 0.06881495, 0.8793733, 1, 1, 1, 1, 1,
-0.001977129, 1.176629, 0.8200023, 1, 1, 1, 1, 1,
-0.0004542308, 1.28556, 0.5914044, 1, 1, 1, 1, 1,
-0.0003792389, -0.7310891, -4.153923, 1, 1, 1, 1, 1,
0.004094077, -0.3841958, 1.662314, 1, 1, 1, 1, 1,
0.005228899, -0.1093911, 3.280779, 1, 1, 1, 1, 1,
0.01304837, -0.5727367, 3.108829, 1, 1, 1, 1, 1,
0.01329281, 1.55321, 2.164336, 1, 1, 1, 1, 1,
0.01767001, -1.470997, 4.49118, 0, 0, 1, 1, 1,
0.01994424, -1.603082, 3.311498, 1, 0, 0, 1, 1,
0.01999133, -1.605771, 3.42408, 1, 0, 0, 1, 1,
0.02061916, 0.7490673, 0.008696978, 1, 0, 0, 1, 1,
0.0246758, 2.066761, -0.8362339, 1, 0, 0, 1, 1,
0.02495418, -0.4566734, 1.136761, 1, 0, 0, 1, 1,
0.02858583, -0.603704, 3.407737, 0, 0, 0, 1, 1,
0.02906191, 0.0296844, 1.180213, 0, 0, 0, 1, 1,
0.03120867, 0.9070144, -0.8160415, 0, 0, 0, 1, 1,
0.03802501, -0.1824911, 3.008508, 0, 0, 0, 1, 1,
0.04196388, 0.5533692, 0.3994794, 0, 0, 0, 1, 1,
0.04344462, 0.5886748, 0.830004, 0, 0, 0, 1, 1,
0.05009427, -1.855956, 2.975245, 0, 0, 0, 1, 1,
0.05077861, 1.092685, 0.03161821, 1, 1, 1, 1, 1,
0.05603115, -0.1717715, 1.896615, 1, 1, 1, 1, 1,
0.06682488, -0.5152468, 3.533257, 1, 1, 1, 1, 1,
0.06697111, -1.790627, 4.303274, 1, 1, 1, 1, 1,
0.07032054, 0.07399017, 2.274837, 1, 1, 1, 1, 1,
0.0713599, -1.501047, 2.835369, 1, 1, 1, 1, 1,
0.07212637, 0.1923261, -2.178467, 1, 1, 1, 1, 1,
0.07268036, -0.1309399, 2.332918, 1, 1, 1, 1, 1,
0.07327452, -1.699542, 3.23194, 1, 1, 1, 1, 1,
0.07503202, 1.45782, -1.458185, 1, 1, 1, 1, 1,
0.07592155, 0.02131917, 1.842841, 1, 1, 1, 1, 1,
0.08063577, -1.567437, 5.31443, 1, 1, 1, 1, 1,
0.08091365, 0.1700267, -0.03496067, 1, 1, 1, 1, 1,
0.08573081, -0.9265471, 3.985669, 1, 1, 1, 1, 1,
0.08647095, 1.038553, 0.3687693, 1, 1, 1, 1, 1,
0.08724583, -0.1097089, 1.770506, 0, 0, 1, 1, 1,
0.09359803, 0.7559199, 1.295395, 1, 0, 0, 1, 1,
0.09713321, 0.09180347, 1.059549, 1, 0, 0, 1, 1,
0.0976392, -0.005209717, 1.264464, 1, 0, 0, 1, 1,
0.0977375, -1.148749, 5.144243, 1, 0, 0, 1, 1,
0.1010914, -0.5490844, 2.051229, 1, 0, 0, 1, 1,
0.1012007, 0.2828008, -0.1918871, 0, 0, 0, 1, 1,
0.101303, -0.04809466, 2.066254, 0, 0, 0, 1, 1,
0.1036697, -2.203147, 2.446242, 0, 0, 0, 1, 1,
0.1046969, -2.169929, 3.256746, 0, 0, 0, 1, 1,
0.1062663, -0.5550141, 3.792663, 0, 0, 0, 1, 1,
0.1064243, 1.110491, 0.9998811, 0, 0, 0, 1, 1,
0.1092536, 1.866684, 1.103557, 0, 0, 0, 1, 1,
0.110805, 0.3013151, 0.9350978, 1, 1, 1, 1, 1,
0.1111512, 0.4376861, 2.116001, 1, 1, 1, 1, 1,
0.1117506, -0.7022657, 2.725842, 1, 1, 1, 1, 1,
0.1120823, -1.972183, 3.567073, 1, 1, 1, 1, 1,
0.1122287, 1.040258, 1.147851, 1, 1, 1, 1, 1,
0.1146868, 1.48879, 0.2614464, 1, 1, 1, 1, 1,
0.1161821, 1.923198, -0.9476163, 1, 1, 1, 1, 1,
0.1168861, 1.373861, 0.5624096, 1, 1, 1, 1, 1,
0.1170853, 0.2400616, 0.9157062, 1, 1, 1, 1, 1,
0.1239956, 0.5478991, 1.963574, 1, 1, 1, 1, 1,
0.1250416, -0.7206988, 3.294674, 1, 1, 1, 1, 1,
0.1264515, -1.476043, 4.042135, 1, 1, 1, 1, 1,
0.1273299, 1.389485, 0.324751, 1, 1, 1, 1, 1,
0.127525, 1.551172, 0.2947524, 1, 1, 1, 1, 1,
0.1290445, 1.76407, -0.6781865, 1, 1, 1, 1, 1,
0.1312101, -0.7932597, 2.282127, 0, 0, 1, 1, 1,
0.131603, -0.04727621, 1.046323, 1, 0, 0, 1, 1,
0.1321609, 0.9839092, -0.4565382, 1, 0, 0, 1, 1,
0.1324096, -1.012548, 3.762328, 1, 0, 0, 1, 1,
0.1369756, 1.854052, 0.07318386, 1, 0, 0, 1, 1,
0.1378233, -0.7708818, 2.101536, 1, 0, 0, 1, 1,
0.1422404, -1.382968, 1.656812, 0, 0, 0, 1, 1,
0.1434398, -1.476242, 3.717362, 0, 0, 0, 1, 1,
0.1442744, 0.202621, -1.170244, 0, 0, 0, 1, 1,
0.145193, -1.807901, 3.917057, 0, 0, 0, 1, 1,
0.1461365, -1.602032, 2.37075, 0, 0, 0, 1, 1,
0.1480158, 0.3523767, -0.6836213, 0, 0, 0, 1, 1,
0.1535626, 0.2383091, 0.8560352, 0, 0, 0, 1, 1,
0.1575218, 0.4547441, 0.01627431, 1, 1, 1, 1, 1,
0.1600972, 0.3688574, -0.3990414, 1, 1, 1, 1, 1,
0.1616185, 0.6323794, 1.223999, 1, 1, 1, 1, 1,
0.1636551, -1.098493, 2.856459, 1, 1, 1, 1, 1,
0.1665644, -0.2208814, 3.830846, 1, 1, 1, 1, 1,
0.1678417, 1.044898, -1.832726, 1, 1, 1, 1, 1,
0.1703681, 0.1074326, 1.117499, 1, 1, 1, 1, 1,
0.1705042, 0.03812457, 0.3677932, 1, 1, 1, 1, 1,
0.1793367, 0.8529676, 0.6737239, 1, 1, 1, 1, 1,
0.1850533, 1.51018, -0.8437049, 1, 1, 1, 1, 1,
0.1936888, -0.1402437, 3.788313, 1, 1, 1, 1, 1,
0.1942771, 0.2193543, 0.7874441, 1, 1, 1, 1, 1,
0.195077, 0.8128577, -0.09068641, 1, 1, 1, 1, 1,
0.1970293, 1.2005, -0.4693964, 1, 1, 1, 1, 1,
0.1983758, -0.1734784, 1.541996, 1, 1, 1, 1, 1,
0.2018644, 1.33571, -0.3287753, 0, 0, 1, 1, 1,
0.2096192, -0.6682686, 2.161131, 1, 0, 0, 1, 1,
0.2108898, 0.1982358, -0.005315407, 1, 0, 0, 1, 1,
0.2142484, -0.579083, 3.042204, 1, 0, 0, 1, 1,
0.2166597, 0.9571494, 0.1709875, 1, 0, 0, 1, 1,
0.2199331, -0.2108469, 0.698041, 1, 0, 0, 1, 1,
0.2255526, -0.0313087, 1.289082, 0, 0, 0, 1, 1,
0.2316407, 0.2725616, -0.4305579, 0, 0, 0, 1, 1,
0.235213, -1.515933, 3.760129, 0, 0, 0, 1, 1,
0.2381963, -1.883136, 3.236292, 0, 0, 0, 1, 1,
0.2407559, 0.1449763, 1.021936, 0, 0, 0, 1, 1,
0.2429656, -1.00129, 3.54474, 0, 0, 0, 1, 1,
0.2433544, 0.08340749, 0.673986, 0, 0, 0, 1, 1,
0.2475461, -0.3632298, 4.169898, 1, 1, 1, 1, 1,
0.2483001, -0.7119648, 2.587866, 1, 1, 1, 1, 1,
0.2511396, 0.2440514, 2.183131, 1, 1, 1, 1, 1,
0.2538658, 0.2126102, 1.446101, 1, 1, 1, 1, 1,
0.2568733, -0.7530847, 1.942114, 1, 1, 1, 1, 1,
0.2603622, 1.523184, 0.3030229, 1, 1, 1, 1, 1,
0.2674633, -0.4409209, 3.539835, 1, 1, 1, 1, 1,
0.2709753, 0.4764159, 0.5661017, 1, 1, 1, 1, 1,
0.2739321, 0.6925167, 0.2484181, 1, 1, 1, 1, 1,
0.276909, -0.7500676, 1.610323, 1, 1, 1, 1, 1,
0.2805106, -1.553542, 1.17964, 1, 1, 1, 1, 1,
0.2818409, -1.366786, 1.597023, 1, 1, 1, 1, 1,
0.2834575, 0.7486021, 0.2704735, 1, 1, 1, 1, 1,
0.2892212, 0.8255222, -1.502641, 1, 1, 1, 1, 1,
0.2902385, -0.5442913, 3.309763, 1, 1, 1, 1, 1,
0.2927349, 0.6599001, 0.9072192, 0, 0, 1, 1, 1,
0.2986942, 1.491179, -0.1588422, 1, 0, 0, 1, 1,
0.2997807, 0.5237738, 1.494301, 1, 0, 0, 1, 1,
0.3019345, -2.885369, 2.553694, 1, 0, 0, 1, 1,
0.3042524, 0.8525307, -1.646953, 1, 0, 0, 1, 1,
0.3067913, -0.1074652, 3.168536, 1, 0, 0, 1, 1,
0.308526, 0.4158142, 0.4308565, 0, 0, 0, 1, 1,
0.3143963, -1.170523, 2.080936, 0, 0, 0, 1, 1,
0.3144869, 0.6505128, -1.073629, 0, 0, 0, 1, 1,
0.3147419, -0.2382743, 1.943107, 0, 0, 0, 1, 1,
0.3147509, -0.4776896, 3.317629, 0, 0, 0, 1, 1,
0.3154324, 0.4323775, -0.1970306, 0, 0, 0, 1, 1,
0.3187799, 2.686331, -0.20007, 0, 0, 0, 1, 1,
0.3217448, 1.035785, -0.1111769, 1, 1, 1, 1, 1,
0.3222762, -0.1472957, 1.490749, 1, 1, 1, 1, 1,
0.3229343, -2.194371, 3.809213, 1, 1, 1, 1, 1,
0.32876, -1.013194, 2.663849, 1, 1, 1, 1, 1,
0.3377207, -1.808977, 2.212884, 1, 1, 1, 1, 1,
0.3459936, -1.172745, 1.776494, 1, 1, 1, 1, 1,
0.3486937, 0.5025967, 0.5933784, 1, 1, 1, 1, 1,
0.3504755, 1.352031, 1.685007, 1, 1, 1, 1, 1,
0.3571365, 0.2225958, -0.4693705, 1, 1, 1, 1, 1,
0.3576875, 1.957294, -0.2188975, 1, 1, 1, 1, 1,
0.3637428, -0.4114971, 1.487322, 1, 1, 1, 1, 1,
0.3649203, -0.3488348, 1.810374, 1, 1, 1, 1, 1,
0.3697486, 0.7609426, -0.6836154, 1, 1, 1, 1, 1,
0.3711809, -0.7814649, 3.980721, 1, 1, 1, 1, 1,
0.3759451, -2.021154, 2.272471, 1, 1, 1, 1, 1,
0.377973, 0.4041579, 0.3713432, 0, 0, 1, 1, 1,
0.3816124, -1.187019, 3.482459, 1, 0, 0, 1, 1,
0.3827011, 0.6301373, 1.768274, 1, 0, 0, 1, 1,
0.3883843, -1.169052, 4.443748, 1, 0, 0, 1, 1,
0.3927957, 1.336291, 0.03874857, 1, 0, 0, 1, 1,
0.3989107, -0.2802402, 2.115983, 1, 0, 0, 1, 1,
0.3994725, 0.5913669, 0.7781686, 0, 0, 0, 1, 1,
0.4014273, -0.4556392, 1.923202, 0, 0, 0, 1, 1,
0.4069203, -0.05979838, 1.140184, 0, 0, 0, 1, 1,
0.408789, 1.639546, -0.08096167, 0, 0, 0, 1, 1,
0.4096398, 0.3928022, 1.370399, 0, 0, 0, 1, 1,
0.4115686, 0.5837619, 2.356205, 0, 0, 0, 1, 1,
0.4200933, 0.1480816, 3.083694, 0, 0, 0, 1, 1,
0.420866, -0.06843758, 1.749641, 1, 1, 1, 1, 1,
0.421655, 0.6911956, 0.4179009, 1, 1, 1, 1, 1,
0.4252685, 1.251952, -0.9900564, 1, 1, 1, 1, 1,
0.42637, -0.04769513, 0.7633992, 1, 1, 1, 1, 1,
0.4288616, -0.1391014, 3.349804, 1, 1, 1, 1, 1,
0.4294581, -1.535755, 4.102643, 1, 1, 1, 1, 1,
0.4302616, -0.1600718, 0.8895983, 1, 1, 1, 1, 1,
0.4351086, 0.8623049, 2.281956, 1, 1, 1, 1, 1,
0.4389069, 2.421593, 1.418888, 1, 1, 1, 1, 1,
0.4441878, -0.8610572, 1.286334, 1, 1, 1, 1, 1,
0.4443722, 0.5205904, 0.3060753, 1, 1, 1, 1, 1,
0.4481398, 0.09013171, 1.361326, 1, 1, 1, 1, 1,
0.4495977, 0.1432584, 0.6011491, 1, 1, 1, 1, 1,
0.4526757, 0.1877825, 0.0479875, 1, 1, 1, 1, 1,
0.4527496, 0.3139832, -0.3094933, 1, 1, 1, 1, 1,
0.4584891, 1.622048, 0.4598036, 0, 0, 1, 1, 1,
0.4616961, -0.1689134, 2.37558, 1, 0, 0, 1, 1,
0.4618305, 1.024385, 2.448681, 1, 0, 0, 1, 1,
0.4661649, 0.166089, 0.7090627, 1, 0, 0, 1, 1,
0.4708846, -1.399106, 3.012694, 1, 0, 0, 1, 1,
0.4720022, 1.153356, 2.215185, 1, 0, 0, 1, 1,
0.4728392, -0.09677404, -0.04618979, 0, 0, 0, 1, 1,
0.4744057, -0.1502854, 1.680143, 0, 0, 0, 1, 1,
0.4842558, 0.5027891, 0.7051323, 0, 0, 0, 1, 1,
0.4855779, 0.8788801, -1.592304, 0, 0, 0, 1, 1,
0.4930538, 0.5173386, 0.4629965, 0, 0, 0, 1, 1,
0.4942816, -1.48333, 2.601211, 0, 0, 0, 1, 1,
0.4966181, 1.43413, -0.2942268, 0, 0, 0, 1, 1,
0.497212, -0.4284085, 3.897521, 1, 1, 1, 1, 1,
0.4974237, -0.1752225, 2.230601, 1, 1, 1, 1, 1,
0.498189, -0.1680906, 2.16685, 1, 1, 1, 1, 1,
0.4994941, 0.3631038, 0.4477002, 1, 1, 1, 1, 1,
0.5039799, -0.8454593, 2.8878, 1, 1, 1, 1, 1,
0.5087668, 0.9883166, 0.6905283, 1, 1, 1, 1, 1,
0.5117143, 1.20583, 0.516946, 1, 1, 1, 1, 1,
0.5127961, -0.8874306, 4.614625, 1, 1, 1, 1, 1,
0.5129819, 1.597904, 1.610317, 1, 1, 1, 1, 1,
0.5138658, 0.1050654, 2.066679, 1, 1, 1, 1, 1,
0.5167041, -0.2000062, 2.176297, 1, 1, 1, 1, 1,
0.5183071, -0.6420556, 1.685131, 1, 1, 1, 1, 1,
0.5209904, 2.935732, -1.382448, 1, 1, 1, 1, 1,
0.5220875, -0.590482, 1.091451, 1, 1, 1, 1, 1,
0.5226817, 0.9707922, 1.769882, 1, 1, 1, 1, 1,
0.5236828, -0.1781248, 1.308044, 0, 0, 1, 1, 1,
0.5261667, -0.5737534, 2.431131, 1, 0, 0, 1, 1,
0.5327731, -0.6707651, 2.101851, 1, 0, 0, 1, 1,
0.5328358, 0.1646632, 0.6009648, 1, 0, 0, 1, 1,
0.5358647, 1.091554, 2.412091, 1, 0, 0, 1, 1,
0.5361899, -1.43166, 5.375694, 1, 0, 0, 1, 1,
0.5395913, 0.2529882, 1.092566, 0, 0, 0, 1, 1,
0.5404855, -0.3002988, 2.308033, 0, 0, 0, 1, 1,
0.5408402, 0.7020781, -0.1321678, 0, 0, 0, 1, 1,
0.5425484, 0.8008732, 0.3110822, 0, 0, 0, 1, 1,
0.5438263, 1.23504, -0.8169575, 0, 0, 0, 1, 1,
0.5441505, -0.9824319, 3.564775, 0, 0, 0, 1, 1,
0.5457484, -0.3350756, 0.9982266, 0, 0, 0, 1, 1,
0.5473829, -2.072956, 3.042035, 1, 1, 1, 1, 1,
0.5491319, -2.229068, 2.594716, 1, 1, 1, 1, 1,
0.5500921, -1.393884, 1.472069, 1, 1, 1, 1, 1,
0.5507748, 1.587007, 0.8315552, 1, 1, 1, 1, 1,
0.5567258, -0.9020917, 1.006171, 1, 1, 1, 1, 1,
0.5582407, 0.8571894, 0.7606663, 1, 1, 1, 1, 1,
0.5595232, -0.3120414, 2.500452, 1, 1, 1, 1, 1,
0.5614625, -1.475146, 4.602714, 1, 1, 1, 1, 1,
0.5666969, 0.3215212, -0.5701293, 1, 1, 1, 1, 1,
0.5706707, -2.319494, 3.842377, 1, 1, 1, 1, 1,
0.5730144, 0.3123792, 0.8790417, 1, 1, 1, 1, 1,
0.5760905, 0.7793584, -0.01084409, 1, 1, 1, 1, 1,
0.5766696, 1.705606, 0.7337456, 1, 1, 1, 1, 1,
0.5781315, -1.758675, 2.547037, 1, 1, 1, 1, 1,
0.5832662, -0.3861924, 3.541585, 1, 1, 1, 1, 1,
0.5833381, -1.945584, 0.6930996, 0, 0, 1, 1, 1,
0.584959, -0.3563454, 2.828952, 1, 0, 0, 1, 1,
0.5853756, -0.2651791, 3.173297, 1, 0, 0, 1, 1,
0.5860392, -0.9062327, 1.715975, 1, 0, 0, 1, 1,
0.5865455, -0.1757251, 2.563677, 1, 0, 0, 1, 1,
0.5885077, 1.242941, 3.045718, 1, 0, 0, 1, 1,
0.5891718, -0.466483, 2.537131, 0, 0, 0, 1, 1,
0.5915081, -0.3517304, 3.557525, 0, 0, 0, 1, 1,
0.5960286, -1.071752, 2.700371, 0, 0, 0, 1, 1,
0.6007967, 2.021176, 0.7396279, 0, 0, 0, 1, 1,
0.6044363, -1.062208, 0.07989965, 0, 0, 0, 1, 1,
0.6086762, 0.2568868, 0.4977708, 0, 0, 0, 1, 1,
0.6105399, -0.8981115, 2.77868, 0, 0, 0, 1, 1,
0.6135818, 0.8334472, -0.09991226, 1, 1, 1, 1, 1,
0.6218187, -0.09464893, 2.200757, 1, 1, 1, 1, 1,
0.6241386, 0.3591315, 1.864258, 1, 1, 1, 1, 1,
0.6302468, -0.5807486, -0.4744338, 1, 1, 1, 1, 1,
0.6338618, 0.09278445, 1.365756, 1, 1, 1, 1, 1,
0.6367446, -0.8804277, 1.200211, 1, 1, 1, 1, 1,
0.6382884, 0.0877958, 3.010201, 1, 1, 1, 1, 1,
0.6402377, -0.2164484, 1.887209, 1, 1, 1, 1, 1,
0.6403964, -0.180689, 1.025081, 1, 1, 1, 1, 1,
0.6416124, 0.6002864, 0.7653009, 1, 1, 1, 1, 1,
0.6445273, 0.2464822, 0.9096442, 1, 1, 1, 1, 1,
0.646449, -0.08370495, 1.482141, 1, 1, 1, 1, 1,
0.6489605, 0.4237924, -0.1534805, 1, 1, 1, 1, 1,
0.6499278, -1.687135, 2.601495, 1, 1, 1, 1, 1,
0.6574485, 0.9733135, -0.391869, 1, 1, 1, 1, 1,
0.6622781, 0.2242445, 1.279692, 0, 0, 1, 1, 1,
0.6626076, -0.7772173, 3.621254, 1, 0, 0, 1, 1,
0.663296, -2.143559, 4.156727, 1, 0, 0, 1, 1,
0.6642852, 0.8232158, 0.1550125, 1, 0, 0, 1, 1,
0.670141, -0.3644625, 0.5831577, 1, 0, 0, 1, 1,
0.6708667, 1.459563, -0.159529, 1, 0, 0, 1, 1,
0.6778567, 0.751109, 1.056087, 0, 0, 0, 1, 1,
0.6789487, 1.085644, -1.430077, 0, 0, 0, 1, 1,
0.6801582, 1.860034, -0.7747459, 0, 0, 0, 1, 1,
0.6807142, -0.2555764, 0.4973449, 0, 0, 0, 1, 1,
0.6827717, 0.3187158, 2.492456, 0, 0, 0, 1, 1,
0.6842527, 0.9868692, -1.527534, 0, 0, 0, 1, 1,
0.685406, 0.01615808, 2.235974, 0, 0, 0, 1, 1,
0.6972724, 0.8947701, -0.6572071, 1, 1, 1, 1, 1,
0.6975048, 0.4602771, 1.778134, 1, 1, 1, 1, 1,
0.6976336, -0.02344052, 2.470014, 1, 1, 1, 1, 1,
0.6992622, 0.7202435, 0.5662575, 1, 1, 1, 1, 1,
0.7061775, 1.001871, 1.586127, 1, 1, 1, 1, 1,
0.7086123, 1.104411, 0.9053082, 1, 1, 1, 1, 1,
0.710149, -0.7472327, 2.903145, 1, 1, 1, 1, 1,
0.712025, -0.5831853, 1.963773, 1, 1, 1, 1, 1,
0.716483, -0.2298418, 2.383237, 1, 1, 1, 1, 1,
0.7268358, -1.936106, 3.308674, 1, 1, 1, 1, 1,
0.732453, 0.2202213, 0.8785899, 1, 1, 1, 1, 1,
0.7335718, 0.09029808, 1.142021, 1, 1, 1, 1, 1,
0.7338836, 1.060371, -0.0710695, 1, 1, 1, 1, 1,
0.736178, 1.395449, 0.1574975, 1, 1, 1, 1, 1,
0.738866, -1.734285, 2.072048, 1, 1, 1, 1, 1,
0.7405793, 0.1601216, 3.09987, 0, 0, 1, 1, 1,
0.7432061, -1.396669, 3.400976, 1, 0, 0, 1, 1,
0.7545327, 1.754075, -0.4815515, 1, 0, 0, 1, 1,
0.7626468, 0.3256058, 0.990843, 1, 0, 0, 1, 1,
0.7641288, 0.1321802, 1.878844, 1, 0, 0, 1, 1,
0.7668388, 0.1324758, 0.2592959, 1, 0, 0, 1, 1,
0.7676302, 0.8601634, -0.4302222, 0, 0, 0, 1, 1,
0.7681457, -0.2964593, 2.22402, 0, 0, 0, 1, 1,
0.7699861, -0.4515181, 1.780167, 0, 0, 0, 1, 1,
0.7722917, -1.18472, 3.880249, 0, 0, 0, 1, 1,
0.7818798, -0.1397634, 0.7042242, 0, 0, 0, 1, 1,
0.7833275, 0.09367274, 2.21204, 0, 0, 0, 1, 1,
0.7858782, 1.396191, 0.7810139, 0, 0, 0, 1, 1,
0.7931982, -0.7263027, 2.024235, 1, 1, 1, 1, 1,
0.8005904, 0.612165, 0.8201051, 1, 1, 1, 1, 1,
0.8023773, -0.4115394, 0.5125102, 1, 1, 1, 1, 1,
0.8035748, -0.1104279, 0.3462984, 1, 1, 1, 1, 1,
0.805482, -1.461851, 2.383588, 1, 1, 1, 1, 1,
0.8060396, -0.02734848, 1.667255, 1, 1, 1, 1, 1,
0.8110062, 0.498172, 2.299548, 1, 1, 1, 1, 1,
0.8136317, 0.6093209, 1.809061, 1, 1, 1, 1, 1,
0.8136775, -0.04904581, 2.05629, 1, 1, 1, 1, 1,
0.815225, -1.76482, 1.965414, 1, 1, 1, 1, 1,
0.8185689, -1.051061, 0.8379037, 1, 1, 1, 1, 1,
0.8186918, 0.6177189, -0.1281327, 1, 1, 1, 1, 1,
0.8214201, 0.4153835, 1.428115, 1, 1, 1, 1, 1,
0.8343429, 0.8046859, 1.099267, 1, 1, 1, 1, 1,
0.8351015, -0.1698622, 2.459206, 1, 1, 1, 1, 1,
0.8368247, -1.19765, 3.005603, 0, 0, 1, 1, 1,
0.8383994, -0.6950636, 2.488565, 1, 0, 0, 1, 1,
0.839778, 0.5756932, 0.5949137, 1, 0, 0, 1, 1,
0.8398618, 0.5475041, 2.176313, 1, 0, 0, 1, 1,
0.8421332, 0.3666566, 1.663456, 1, 0, 0, 1, 1,
0.8456076, 0.3106008, 0.6603962, 1, 0, 0, 1, 1,
0.8505447, 0.2560956, 2.071825, 0, 0, 0, 1, 1,
0.8544879, 0.4996176, 3.806427, 0, 0, 0, 1, 1,
0.8579935, 1.294575, 0.7688723, 0, 0, 0, 1, 1,
0.8592939, 0.5405969, 1.967583, 0, 0, 0, 1, 1,
0.864186, -1.33215, 1.869259, 0, 0, 0, 1, 1,
0.8649005, 0.3373133, -0.0750438, 0, 0, 0, 1, 1,
0.8753773, -0.3431237, 1.297488, 0, 0, 0, 1, 1,
0.8757864, -0.3570112, 3.956445, 1, 1, 1, 1, 1,
0.8801298, 0.794462, -1.854133, 1, 1, 1, 1, 1,
0.8819693, 1.055533, 0.4743337, 1, 1, 1, 1, 1,
0.8869085, 0.2129873, 1.003261, 1, 1, 1, 1, 1,
0.88883, 0.0931101, 2.22591, 1, 1, 1, 1, 1,
0.9104061, 0.4829503, 0.471543, 1, 1, 1, 1, 1,
0.9128302, -0.4195291, 2.410111, 1, 1, 1, 1, 1,
0.9129354, -0.9747264, 2.031104, 1, 1, 1, 1, 1,
0.9152422, 0.8088995, 1.568975, 1, 1, 1, 1, 1,
0.9157289, 0.846487, 2.09761, 1, 1, 1, 1, 1,
0.9272822, -0.002707586, 2.876805, 1, 1, 1, 1, 1,
0.9325926, -0.1050426, 2.306896, 1, 1, 1, 1, 1,
0.939258, -0.4960507, 1.855488, 1, 1, 1, 1, 1,
0.9433511, 0.6260186, 0.5325609, 1, 1, 1, 1, 1,
0.9519092, -1.812682, 3.181197, 1, 1, 1, 1, 1,
0.9534696, 0.5125935, 2.324219, 0, 0, 1, 1, 1,
0.9580693, -0.03484828, 1.35458, 1, 0, 0, 1, 1,
0.9590121, -1.05658, 1.805616, 1, 0, 0, 1, 1,
0.9719275, -0.6942148, 3.462214, 1, 0, 0, 1, 1,
0.9749256, -0.4266657, 1.934162, 1, 0, 0, 1, 1,
0.975452, -0.6183679, 4.433632, 1, 0, 0, 1, 1,
0.9850876, 0.746778, 0.4941005, 0, 0, 0, 1, 1,
0.9880239, 0.02970576, 0.6973886, 0, 0, 0, 1, 1,
0.9955199, 1.739202, -0.09794658, 0, 0, 0, 1, 1,
1.007817, 1.340028, 0.5483581, 0, 0, 0, 1, 1,
1.016481, 1.864385, 0.02487135, 0, 0, 0, 1, 1,
1.018188, 0.2465308, 3.188609, 0, 0, 0, 1, 1,
1.019145, 0.180252, 1.84529, 0, 0, 0, 1, 1,
1.020225, 0.9609913, -0.5421062, 1, 1, 1, 1, 1,
1.025221, 0.7281163, 0.9022783, 1, 1, 1, 1, 1,
1.028461, 1.181053, -1.808409, 1, 1, 1, 1, 1,
1.035918, 0.3323593, 0.1110551, 1, 1, 1, 1, 1,
1.051723, 1.06283, 1.136105, 1, 1, 1, 1, 1,
1.05735, 2.099455, -0.5223915, 1, 1, 1, 1, 1,
1.057837, 0.5391846, 0.4794396, 1, 1, 1, 1, 1,
1.058497, -0.5654426, 3.012826, 1, 1, 1, 1, 1,
1.067159, -0.2060988, 0.4679929, 1, 1, 1, 1, 1,
1.06842, -0.01449195, 2.095718, 1, 1, 1, 1, 1,
1.07259, 1.910388, 0.8520984, 1, 1, 1, 1, 1,
1.074432, 1.037204, 1.581504, 1, 1, 1, 1, 1,
1.077114, -0.8369281, 2.94566, 1, 1, 1, 1, 1,
1.078538, -1.221863, 2.587494, 1, 1, 1, 1, 1,
1.09039, 0.4776284, 2.122915, 1, 1, 1, 1, 1,
1.090587, 1.014698, 1.115797, 0, 0, 1, 1, 1,
1.091676, -1.425893, 2.93293, 1, 0, 0, 1, 1,
1.095019, -1.004268, 2.412463, 1, 0, 0, 1, 1,
1.095332, 0.4649909, 1.15492, 1, 0, 0, 1, 1,
1.098371, 0.06924785, 2.403692, 1, 0, 0, 1, 1,
1.098541, -0.9402101, 1.627502, 1, 0, 0, 1, 1,
1.106582, 0.5462347, -0.3208109, 0, 0, 0, 1, 1,
1.118919, 1.53916, -0.4442989, 0, 0, 0, 1, 1,
1.122925, -1.173296, 3.330988, 0, 0, 0, 1, 1,
1.124492, -0.2901759, 2.30731, 0, 0, 0, 1, 1,
1.125771, 0.6962135, -0.05046527, 0, 0, 0, 1, 1,
1.126283, -0.4700643, 1.966225, 0, 0, 0, 1, 1,
1.131168, 0.6793683, 1.130278, 0, 0, 0, 1, 1,
1.136824, -0.4495399, 1.859459, 1, 1, 1, 1, 1,
1.141769, 0.4551795, 1.058339, 1, 1, 1, 1, 1,
1.148062, -0.2360807, 0.4519955, 1, 1, 1, 1, 1,
1.150576, 1.430865, 2.582417, 1, 1, 1, 1, 1,
1.150595, -0.6187335, 2.391194, 1, 1, 1, 1, 1,
1.156733, -0.9774982, 1.794186, 1, 1, 1, 1, 1,
1.171937, 1.861524, 0.64387, 1, 1, 1, 1, 1,
1.17344, -1.163851, 0.9616975, 1, 1, 1, 1, 1,
1.191547, 0.07412337, 3.323971, 1, 1, 1, 1, 1,
1.19335, -1.124011, 2.111061, 1, 1, 1, 1, 1,
1.1961, -0.2172193, 1.011365, 1, 1, 1, 1, 1,
1.201241, 0.2989165, -0.670002, 1, 1, 1, 1, 1,
1.204907, 0.5054629, 0.4538973, 1, 1, 1, 1, 1,
1.209765, -0.132561, 4.638718, 1, 1, 1, 1, 1,
1.220331, 0.6723713, 0.8659235, 1, 1, 1, 1, 1,
1.222901, -0.09616841, 1.004799, 0, 0, 1, 1, 1,
1.239123, 0.190129, 1.273764, 1, 0, 0, 1, 1,
1.240852, 1.894191, -0.2860054, 1, 0, 0, 1, 1,
1.24104, -0.3019709, 3.202676, 1, 0, 0, 1, 1,
1.241628, 0.005836868, 0.3655828, 1, 0, 0, 1, 1,
1.24811, -0.5461696, 1.753785, 1, 0, 0, 1, 1,
1.251048, 0.3328702, 2.67257, 0, 0, 0, 1, 1,
1.256141, 1.767255, -0.02287913, 0, 0, 0, 1, 1,
1.256735, -0.4531676, 1.573482, 0, 0, 0, 1, 1,
1.260164, 1.13557, -1.41316, 0, 0, 0, 1, 1,
1.261558, 0.8797004, 0.6702766, 0, 0, 0, 1, 1,
1.261609, -0.4814474, 0.5094656, 0, 0, 0, 1, 1,
1.265375, 1.709776, 0.9575841, 0, 0, 0, 1, 1,
1.268492, 1.318214, 0.681503, 1, 1, 1, 1, 1,
1.270346, 0.2257476, 0.1921489, 1, 1, 1, 1, 1,
1.28188, -0.5903036, -0.3604948, 1, 1, 1, 1, 1,
1.283034, -0.6101214, 3.636496, 1, 1, 1, 1, 1,
1.284721, 1.650355, 0.5912881, 1, 1, 1, 1, 1,
1.289708, -0.1953346, 0.02655017, 1, 1, 1, 1, 1,
1.291733, -0.202193, 3.141684, 1, 1, 1, 1, 1,
1.292451, 1.506802, -0.320073, 1, 1, 1, 1, 1,
1.294044, -0.3877535, 2.256494, 1, 1, 1, 1, 1,
1.305321, 0.1837789, 2.532087, 1, 1, 1, 1, 1,
1.31661, 1.559011, 0.4483482, 1, 1, 1, 1, 1,
1.320331, 1.303517, 0.8477879, 1, 1, 1, 1, 1,
1.328179, -0.7331111, 1.942472, 1, 1, 1, 1, 1,
1.329224, -0.3226411, 1.466676, 1, 1, 1, 1, 1,
1.329552, -0.05907991, 3.297752, 1, 1, 1, 1, 1,
1.35087, -0.8826239, 3.195461, 0, 0, 1, 1, 1,
1.350876, -0.7552952, 0.07912795, 1, 0, 0, 1, 1,
1.352994, 0.2783384, 0.475467, 1, 0, 0, 1, 1,
1.356234, 0.0167989, 2.275878, 1, 0, 0, 1, 1,
1.357355, -0.7981547, 3.622213, 1, 0, 0, 1, 1,
1.36834, 0.85065, 1.526392, 1, 0, 0, 1, 1,
1.373208, 0.174667, 0.6877592, 0, 0, 0, 1, 1,
1.373919, 0.6772284, 0.7844779, 0, 0, 0, 1, 1,
1.379021, -0.5476003, 1.906863, 0, 0, 0, 1, 1,
1.383673, -0.6882176, 3.438095, 0, 0, 0, 1, 1,
1.384822, -0.2510945, 2.292686, 0, 0, 0, 1, 1,
1.388946, 0.1809626, 1.196083, 0, 0, 0, 1, 1,
1.408202, -0.2631351, 1.684005, 0, 0, 0, 1, 1,
1.408333, 0.7338287, 0.8271996, 1, 1, 1, 1, 1,
1.416093, 1.239115, 0.7184899, 1, 1, 1, 1, 1,
1.419112, 1.125976, 1.997601, 1, 1, 1, 1, 1,
1.419472, 1.935065, 1.594041, 1, 1, 1, 1, 1,
1.432853, -0.4906702, -0.1149324, 1, 1, 1, 1, 1,
1.443744, 0.3553478, 0.8162119, 1, 1, 1, 1, 1,
1.446053, -0.3728333, 1.527057, 1, 1, 1, 1, 1,
1.447446, -0.1968888, 2.154634, 1, 1, 1, 1, 1,
1.461365, 0.5562799, 1.439225, 1, 1, 1, 1, 1,
1.471399, 0.6418543, 1.351633, 1, 1, 1, 1, 1,
1.523558, 0.1688044, 0.3078101, 1, 1, 1, 1, 1,
1.535111, 1.714119, 2.504196, 1, 1, 1, 1, 1,
1.541313, -0.4717489, 2.467785, 1, 1, 1, 1, 1,
1.546374, 0.7876022, 2.923695, 1, 1, 1, 1, 1,
1.556116, 0.7679343, 0.9590659, 1, 1, 1, 1, 1,
1.57158, 1.52851, -0.6483887, 0, 0, 1, 1, 1,
1.581216, 2.015286, 0.4216817, 1, 0, 0, 1, 1,
1.585618, -0.1684103, 1.546302, 1, 0, 0, 1, 1,
1.606954, -0.2352068, 1.112381, 1, 0, 0, 1, 1,
1.614688, 0.9147441, 3.427583, 1, 0, 0, 1, 1,
1.614814, -0.3826269, 1.693403, 1, 0, 0, 1, 1,
1.62069, 0.2207633, 1.898559, 0, 0, 0, 1, 1,
1.622603, 0.07927243, 1.218594, 0, 0, 0, 1, 1,
1.635002, -0.6682584, 0.7697507, 0, 0, 0, 1, 1,
1.639917, -1.048227, 3.265335, 0, 0, 0, 1, 1,
1.643004, -0.4050485, 0.9529595, 0, 0, 0, 1, 1,
1.658058, 1.048636, 0.01136024, 0, 0, 0, 1, 1,
1.659247, -0.7296947, 1.044546, 0, 0, 0, 1, 1,
1.664522, -0.7762308, 2.234018, 1, 1, 1, 1, 1,
1.665849, 0.626914, 0.7521, 1, 1, 1, 1, 1,
1.674936, -0.8775644, 2.148783, 1, 1, 1, 1, 1,
1.696878, 0.6017227, 0.3473351, 1, 1, 1, 1, 1,
1.716699, -0.5925884, 1.884633, 1, 1, 1, 1, 1,
1.751019, -0.1421496, 1.901827, 1, 1, 1, 1, 1,
1.771632, -0.6306978, 0.8435212, 1, 1, 1, 1, 1,
1.779743, 1.636642, 1.10961, 1, 1, 1, 1, 1,
1.785857, 1.023117, 2.158562, 1, 1, 1, 1, 1,
1.842518, 0.5854096, 3.448144, 1, 1, 1, 1, 1,
1.947838, 1.093101, 0.935083, 1, 1, 1, 1, 1,
1.954709, -1.535542, 3.256454, 1, 1, 1, 1, 1,
1.963343, 1.185236, 1.297222, 1, 1, 1, 1, 1,
1.977411, -0.227257, 1.417913, 1, 1, 1, 1, 1,
2.009433, -0.5807693, 1.940011, 1, 1, 1, 1, 1,
2.012521, 1.371815, 0.7030721, 0, 0, 1, 1, 1,
2.026492, 0.1531308, 0.8661942, 1, 0, 0, 1, 1,
2.094687, -0.4206181, 3.203576, 1, 0, 0, 1, 1,
2.17216, -1.488635, 3.600808, 1, 0, 0, 1, 1,
2.244211, 0.9232241, 1.268832, 1, 0, 0, 1, 1,
2.259114, 0.0008105919, 0.1279851, 1, 0, 0, 1, 1,
2.260642, 1.120986, 0.4504423, 0, 0, 0, 1, 1,
2.29747, 0.05502164, 2.370944, 0, 0, 0, 1, 1,
2.310232, -0.1180824, -0.3185467, 0, 0, 0, 1, 1,
2.31205, -2.334042, 2.092653, 0, 0, 0, 1, 1,
2.346521, -0.05218866, 1.395923, 0, 0, 0, 1, 1,
2.452325, 2.1752, 0.3809937, 0, 0, 0, 1, 1,
2.533727, -0.03846418, 1.891801, 0, 0, 0, 1, 1,
2.550829, -0.01484661, 1.206178, 1, 1, 1, 1, 1,
2.564816, 1.042794, 0.7480986, 1, 1, 1, 1, 1,
2.617491, 1.462135, 1.854132, 1, 1, 1, 1, 1,
2.666917, 0.04401703, 2.600401, 1, 1, 1, 1, 1,
2.832095, -0.5923232, 1.902831, 1, 1, 1, 1, 1,
3.384558, -1.016161, 4.165058, 1, 1, 1, 1, 1,
3.823681, -0.5165119, 1.673919, 1, 1, 1, 1, 1
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
var radius = 9.594669;
var distance = 33.70087;
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
mvMatrix.translate( -0.1878848, 0.05504727, -0.1576722 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70087);
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
