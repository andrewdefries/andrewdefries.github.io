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
-3.219876, 0.9344463, -2.012851, 1, 0, 0, 1,
-3.15707, -0.04210401, -1.698507, 1, 0.007843138, 0, 1,
-3.11285, -1.049467, -2.098621, 1, 0.01176471, 0, 1,
-2.790349, -1.007559, -2.566735, 1, 0.01960784, 0, 1,
-2.570783, 0.9508155, -1.831632, 1, 0.02352941, 0, 1,
-2.56386, 0.3102895, -1.101985, 1, 0.03137255, 0, 1,
-2.489185, -1.038905, 0.2479572, 1, 0.03529412, 0, 1,
-2.470228, 0.8565142, -2.083994, 1, 0.04313726, 0, 1,
-2.364048, 0.2452991, -1.836018, 1, 0.04705882, 0, 1,
-2.363744, -0.7679036, -2.994265, 1, 0.05490196, 0, 1,
-2.349814, 0.6090645, -2.543437, 1, 0.05882353, 0, 1,
-2.341791, -0.5877405, -2.156727, 1, 0.06666667, 0, 1,
-2.26018, 0.3679266, -0.549413, 1, 0.07058824, 0, 1,
-2.24256, -1.287868, -0.7651077, 1, 0.07843138, 0, 1,
-2.209521, -1.29107, -1.627569, 1, 0.08235294, 0, 1,
-2.193919, -1.173457, -1.838467, 1, 0.09019608, 0, 1,
-2.138011, -0.9557589, -1.623813, 1, 0.09411765, 0, 1,
-2.106737, 0.0774996, -1.16356, 1, 0.1019608, 0, 1,
-2.060604, 0.2762857, 0.2203031, 1, 0.1098039, 0, 1,
-2.035275, 0.2018813, -0.6961907, 1, 0.1137255, 0, 1,
-2.031243, 0.1573686, -1.674303, 1, 0.1215686, 0, 1,
-2.015149, -0.2707895, -3.355575, 1, 0.1254902, 0, 1,
-2.00678, 0.3855245, -1.672523, 1, 0.1333333, 0, 1,
-1.995927, 0.2287129, -1.112177, 1, 0.1372549, 0, 1,
-1.99402, -0.7599818, -1.415309, 1, 0.145098, 0, 1,
-1.982158, 1.182848, 0.3693436, 1, 0.1490196, 0, 1,
-1.968819, 0.2576429, -2.503584, 1, 0.1568628, 0, 1,
-1.955665, -1.355242, -3.020945, 1, 0.1607843, 0, 1,
-1.950973, 0.3949866, -1.44366, 1, 0.1686275, 0, 1,
-1.920443, -0.5508036, -1.416354, 1, 0.172549, 0, 1,
-1.918568, 0.2810171, -1.057352, 1, 0.1803922, 0, 1,
-1.912393, -1.905689, -4.514944, 1, 0.1843137, 0, 1,
-1.912159, 0.7839264, -1.554961, 1, 0.1921569, 0, 1,
-1.911616, 0.5262241, 0.09464592, 1, 0.1960784, 0, 1,
-1.887216, -1.092664, -1.797311, 1, 0.2039216, 0, 1,
-1.851492, 0.00821048, -1.997283, 1, 0.2117647, 0, 1,
-1.841914, 0.9440688, -2.787125, 1, 0.2156863, 0, 1,
-1.80737, -0.6143784, -2.208429, 1, 0.2235294, 0, 1,
-1.807343, 0.949423, -1.896751, 1, 0.227451, 0, 1,
-1.794481, -2.155333, -2.041916, 1, 0.2352941, 0, 1,
-1.792467, 1.034376, -0.9546118, 1, 0.2392157, 0, 1,
-1.786235, 0.4955293, -1.032888, 1, 0.2470588, 0, 1,
-1.769422, -0.172686, -1.847559, 1, 0.2509804, 0, 1,
-1.766444, -0.3280526, -2.575061, 1, 0.2588235, 0, 1,
-1.763543, -1.377723, -3.466213, 1, 0.2627451, 0, 1,
-1.759503, -0.360617, -3.233419, 1, 0.2705882, 0, 1,
-1.741434, -2.088436, -3.792363, 1, 0.2745098, 0, 1,
-1.739576, -2.766065, -1.260162, 1, 0.282353, 0, 1,
-1.70461, -1.644792, -1.64411, 1, 0.2862745, 0, 1,
-1.702576, -1.982406, -5.269321, 1, 0.2941177, 0, 1,
-1.697417, -1.267666, -1.233116, 1, 0.3019608, 0, 1,
-1.650327, 0.3123309, -1.154236, 1, 0.3058824, 0, 1,
-1.639373, 1.284505, -1.568344, 1, 0.3137255, 0, 1,
-1.635966, 0.6542867, -1.57327, 1, 0.3176471, 0, 1,
-1.632125, 0.5473585, -0.3960824, 1, 0.3254902, 0, 1,
-1.617665, 0.03136173, -1.62944, 1, 0.3294118, 0, 1,
-1.605833, 0.7488008, -0.6423457, 1, 0.3372549, 0, 1,
-1.59551, 0.1098412, -0.924773, 1, 0.3411765, 0, 1,
-1.587851, -0.4615134, -1.895697, 1, 0.3490196, 0, 1,
-1.58785, -0.555438, -3.31081, 1, 0.3529412, 0, 1,
-1.584919, 0.0989596, -0.09057913, 1, 0.3607843, 0, 1,
-1.584729, 1.422617, -2.066513, 1, 0.3647059, 0, 1,
-1.567433, 0.8638454, -1.116668, 1, 0.372549, 0, 1,
-1.563991, -0.8325406, -1.98521, 1, 0.3764706, 0, 1,
-1.559691, 1.240437, -0.4441415, 1, 0.3843137, 0, 1,
-1.553104, -0.248087, 0.2951548, 1, 0.3882353, 0, 1,
-1.550038, -0.795832, -2.998251, 1, 0.3960784, 0, 1,
-1.544202, -1.479129, -2.907961, 1, 0.4039216, 0, 1,
-1.542372, -0.6200487, -1.984874, 1, 0.4078431, 0, 1,
-1.539676, 1.144267, -0.4878152, 1, 0.4156863, 0, 1,
-1.531619, -0.7053179, -2.926224, 1, 0.4196078, 0, 1,
-1.515076, 0.1688155, -0.6664131, 1, 0.427451, 0, 1,
-1.480548, 0.008458917, -0.5909866, 1, 0.4313726, 0, 1,
-1.470826, -0.7439781, -2.322824, 1, 0.4392157, 0, 1,
-1.448957, 0.5060744, -1.737492, 1, 0.4431373, 0, 1,
-1.442479, 0.5219634, -0.9696865, 1, 0.4509804, 0, 1,
-1.440146, -0.1083341, -0.9868761, 1, 0.454902, 0, 1,
-1.437078, -0.1905997, -0.4779473, 1, 0.4627451, 0, 1,
-1.434582, -0.3936329, -2.368056, 1, 0.4666667, 0, 1,
-1.433824, -0.1711537, -2.027832, 1, 0.4745098, 0, 1,
-1.414943, -1.120724, -4.025665, 1, 0.4784314, 0, 1,
-1.405236, 1.212369, 0.8056782, 1, 0.4862745, 0, 1,
-1.405016, 0.2867029, -0.4579533, 1, 0.4901961, 0, 1,
-1.403331, 0.787118, -1.581615, 1, 0.4980392, 0, 1,
-1.387058, -0.2383345, -2.681143, 1, 0.5058824, 0, 1,
-1.386543, 0.2474798, -1.279242, 1, 0.509804, 0, 1,
-1.379323, -0.7839451, -2.281176, 1, 0.5176471, 0, 1,
-1.376972, 1.515635, -0.3122939, 1, 0.5215687, 0, 1,
-1.376603, 0.9824592, 0.2057623, 1, 0.5294118, 0, 1,
-1.37205, -0.2104285, -1.662403, 1, 0.5333334, 0, 1,
-1.358738, -0.05222674, -2.883239, 1, 0.5411765, 0, 1,
-1.346932, -0.4186985, -2.507149, 1, 0.5450981, 0, 1,
-1.337999, 1.352805, -0.8580036, 1, 0.5529412, 0, 1,
-1.316202, -0.8432555, -0.9311137, 1, 0.5568628, 0, 1,
-1.314666, 0.1361327, -1.965388, 1, 0.5647059, 0, 1,
-1.306554, -0.1278711, -2.005867, 1, 0.5686275, 0, 1,
-1.304747, -0.4153812, -2.370583, 1, 0.5764706, 0, 1,
-1.304524, -0.2458503, 1.387983, 1, 0.5803922, 0, 1,
-1.298753, 1.120197, -0.3800287, 1, 0.5882353, 0, 1,
-1.297285, 0.1556785, -0.5587222, 1, 0.5921569, 0, 1,
-1.295991, -0.9820209, -0.1079576, 1, 0.6, 0, 1,
-1.293544, -0.1379352, -1.649901, 1, 0.6078432, 0, 1,
-1.289687, 0.262431, -1.330581, 1, 0.6117647, 0, 1,
-1.284602, -0.4722783, -0.4798319, 1, 0.6196079, 0, 1,
-1.270771, -0.4430429, -1.35845, 1, 0.6235294, 0, 1,
-1.269044, 0.7368309, -1.271541, 1, 0.6313726, 0, 1,
-1.262327, 0.02232872, -1.870485, 1, 0.6352941, 0, 1,
-1.25868, 0.007241413, -0.5328656, 1, 0.6431373, 0, 1,
-1.245407, 0.8295857, -0.4883413, 1, 0.6470588, 0, 1,
-1.242363, 1.375259, -1.725435, 1, 0.654902, 0, 1,
-1.241354, 1.395367, -0.4991145, 1, 0.6588235, 0, 1,
-1.236333, 0.9540469, -1.153844, 1, 0.6666667, 0, 1,
-1.233656, 1.448247, -1.298013, 1, 0.6705883, 0, 1,
-1.233135, 1.478854, -2.025944, 1, 0.6784314, 0, 1,
-1.230064, 0.4152588, -0.3971811, 1, 0.682353, 0, 1,
-1.228316, -1.562197, -2.136079, 1, 0.6901961, 0, 1,
-1.223289, -1.472185, -1.734853, 1, 0.6941177, 0, 1,
-1.22009, -1.223976, -2.641407, 1, 0.7019608, 0, 1,
-1.218186, 0.2362068, -1.818847, 1, 0.7098039, 0, 1,
-1.209405, 0.03394356, -0.1781493, 1, 0.7137255, 0, 1,
-1.20936, 1.114431, -0.6414978, 1, 0.7215686, 0, 1,
-1.209233, -1.277867, -0.7208709, 1, 0.7254902, 0, 1,
-1.204169, 0.4117159, -1.403943, 1, 0.7333333, 0, 1,
-1.198849, 0.2032413, -2.152833, 1, 0.7372549, 0, 1,
-1.197102, -1.94436, -2.83804, 1, 0.7450981, 0, 1,
-1.195651, 0.5330077, -1.979037, 1, 0.7490196, 0, 1,
-1.180404, -0.8298646, -0.8852011, 1, 0.7568628, 0, 1,
-1.175292, 0.5293014, -0.569281, 1, 0.7607843, 0, 1,
-1.148475, 1.666774, -0.1956943, 1, 0.7686275, 0, 1,
-1.14156, 0.950859, -1.08367, 1, 0.772549, 0, 1,
-1.139852, 2.787772, 0.04839436, 1, 0.7803922, 0, 1,
-1.134083, -0.06623655, 0.06113822, 1, 0.7843137, 0, 1,
-1.131761, -0.4561611, -2.423432, 1, 0.7921569, 0, 1,
-1.107824, 2.697047, -0.02719929, 1, 0.7960784, 0, 1,
-1.105127, -0.8103444, -2.912178, 1, 0.8039216, 0, 1,
-1.096095, -0.9671662, -0.8412979, 1, 0.8117647, 0, 1,
-1.093824, -1.266835, -2.3577, 1, 0.8156863, 0, 1,
-1.092388, -0.3276413, -3.344968, 1, 0.8235294, 0, 1,
-1.089105, -1.359168, -3.389257, 1, 0.827451, 0, 1,
-1.084967, 1.308213, -0.1079023, 1, 0.8352941, 0, 1,
-1.083006, -2.310984, -1.179273, 1, 0.8392157, 0, 1,
-1.072345, -0.1883279, -1.449865, 1, 0.8470588, 0, 1,
-1.07222, -0.4178545, -0.9235201, 1, 0.8509804, 0, 1,
-1.067067, -0.585482, -1.474634, 1, 0.8588235, 0, 1,
-1.066979, -0.8306456, -2.846217, 1, 0.8627451, 0, 1,
-1.06327, 0.5507312, -1.970437, 1, 0.8705882, 0, 1,
-1.050441, -2.14117, -3.633845, 1, 0.8745098, 0, 1,
-1.048526, -0.3098762, -1.22438, 1, 0.8823529, 0, 1,
-1.039262, 1.895387, -0.296862, 1, 0.8862745, 0, 1,
-1.037019, 0.3340896, -0.5344435, 1, 0.8941177, 0, 1,
-1.036114, -0.656094, -3.965569, 1, 0.8980392, 0, 1,
-1.028687, 0.5580071, -2.158621, 1, 0.9058824, 0, 1,
-1.028041, 1.816453, -1.163004, 1, 0.9137255, 0, 1,
-1.026096, 0.5635933, -1.485211, 1, 0.9176471, 0, 1,
-1.021897, 1.469952, -2.30972, 1, 0.9254902, 0, 1,
-1.017559, -0.7391879, -1.494085, 1, 0.9294118, 0, 1,
-1.016134, -1.282794, -2.72764, 1, 0.9372549, 0, 1,
-1.009984, 0.2358106, -0.8022878, 1, 0.9411765, 0, 1,
-1.00552, -0.9112067, -2.292962, 1, 0.9490196, 0, 1,
-1.004087, 0.000975923, -0.9495741, 1, 0.9529412, 0, 1,
-1.002729, -1.688267, -2.637842, 1, 0.9607843, 0, 1,
-0.9816539, 0.3252621, -1.535719, 1, 0.9647059, 0, 1,
-0.9809432, 1.164432, 0.3728204, 1, 0.972549, 0, 1,
-0.978211, -1.1421, -4.486501, 1, 0.9764706, 0, 1,
-0.9746047, -0.9529172, -1.736161, 1, 0.9843137, 0, 1,
-0.9740509, 1.405529, 1.045751, 1, 0.9882353, 0, 1,
-0.9736555, 0.2682, -1.127027, 1, 0.9960784, 0, 1,
-0.97122, -0.1207491, -0.3296522, 0.9960784, 1, 0, 1,
-0.9701901, -0.8721739, -1.633029, 0.9921569, 1, 0, 1,
-0.9685646, -0.1324644, -2.903444, 0.9843137, 1, 0, 1,
-0.9668986, 0.1808829, -1.315348, 0.9803922, 1, 0, 1,
-0.9665454, 0.3536579, -1.813956, 0.972549, 1, 0, 1,
-0.9632865, 0.06961799, -1.283821, 0.9686275, 1, 0, 1,
-0.9624463, -0.1711495, -3.070505, 0.9607843, 1, 0, 1,
-0.9571166, -1.116077, -0.4093378, 0.9568627, 1, 0, 1,
-0.9506821, -0.2827466, -0.3219245, 0.9490196, 1, 0, 1,
-0.9506156, -0.7688581, -2.039187, 0.945098, 1, 0, 1,
-0.9447906, -0.4245726, -2.130999, 0.9372549, 1, 0, 1,
-0.943402, 0.5741553, -0.6212493, 0.9333333, 1, 0, 1,
-0.9430568, -2.650256, -1.726673, 0.9254902, 1, 0, 1,
-0.9403547, 0.8013988, -1.930918, 0.9215686, 1, 0, 1,
-0.9396839, -0.3905847, -1.479533, 0.9137255, 1, 0, 1,
-0.9371617, -0.2583496, 0.4846263, 0.9098039, 1, 0, 1,
-0.9337804, -0.3589285, -2.747641, 0.9019608, 1, 0, 1,
-0.9206821, 0.9928719, -1.894693, 0.8941177, 1, 0, 1,
-0.9171831, -0.743953, -1.359586, 0.8901961, 1, 0, 1,
-0.9166051, 0.4759931, -1.029889, 0.8823529, 1, 0, 1,
-0.9165627, 0.2046774, -2.299197, 0.8784314, 1, 0, 1,
-0.9132919, 0.08596545, -1.017253, 0.8705882, 1, 0, 1,
-0.912526, 0.7028489, -1.646099, 0.8666667, 1, 0, 1,
-0.9026197, 2.850144, 0.9556146, 0.8588235, 1, 0, 1,
-0.8909713, 0.5571906, -2.743095, 0.854902, 1, 0, 1,
-0.8872893, -0.2881996, -1.759751, 0.8470588, 1, 0, 1,
-0.8827667, 0.5093054, 0.2575479, 0.8431373, 1, 0, 1,
-0.8800192, 0.5458695, -1.119427, 0.8352941, 1, 0, 1,
-0.8789526, 0.1419336, -2.400672, 0.8313726, 1, 0, 1,
-0.8738016, -0.03983941, -1.320633, 0.8235294, 1, 0, 1,
-0.8687553, 0.5824266, -3.125361, 0.8196079, 1, 0, 1,
-0.8604407, 0.6683009, -3.814342, 0.8117647, 1, 0, 1,
-0.8576861, 2.102775, -0.3854242, 0.8078431, 1, 0, 1,
-0.8571249, -0.4786851, -2.111422, 0.8, 1, 0, 1,
-0.8555146, -2.414073, -2.951606, 0.7921569, 1, 0, 1,
-0.8548215, -2.335912, -4.550998, 0.7882353, 1, 0, 1,
-0.8520519, 0.01175324, -2.111807, 0.7803922, 1, 0, 1,
-0.844556, -0.06722058, -1.305054, 0.7764706, 1, 0, 1,
-0.8405687, -0.3394814, -1.650708, 0.7686275, 1, 0, 1,
-0.8365501, -0.3138995, -0.8087797, 0.7647059, 1, 0, 1,
-0.8281358, 0.05774714, -0.8652723, 0.7568628, 1, 0, 1,
-0.8240667, -2.037834, -3.47024, 0.7529412, 1, 0, 1,
-0.8147838, -0.800161, -2.34473, 0.7450981, 1, 0, 1,
-0.8135723, 0.04854287, -1.176603, 0.7411765, 1, 0, 1,
-0.8105873, -0.6927625, -2.280398, 0.7333333, 1, 0, 1,
-0.8086951, 0.9512751, -0.3481767, 0.7294118, 1, 0, 1,
-0.8068363, -0.4544251, -1.323953, 0.7215686, 1, 0, 1,
-0.8067815, -0.458913, -3.707528, 0.7176471, 1, 0, 1,
-0.7942983, -1.624783, -4.039571, 0.7098039, 1, 0, 1,
-0.7918503, 1.098136, -0.1999651, 0.7058824, 1, 0, 1,
-0.7814422, 1.692475, -1.882884, 0.6980392, 1, 0, 1,
-0.7805668, -1.785913, -3.918378, 0.6901961, 1, 0, 1,
-0.7777998, -0.06538451, -0.1633281, 0.6862745, 1, 0, 1,
-0.7762316, 0.6726225, -0.2762617, 0.6784314, 1, 0, 1,
-0.7750166, 0.6403923, -1.132145, 0.6745098, 1, 0, 1,
-0.7745138, 0.4065136, -2.024374, 0.6666667, 1, 0, 1,
-0.7727582, -0.4061534, -3.265494, 0.6627451, 1, 0, 1,
-0.7722945, 0.2581209, -3.738237, 0.654902, 1, 0, 1,
-0.7661473, -0.9186406, -2.389934, 0.6509804, 1, 0, 1,
-0.7619771, -0.2013731, -1.611534, 0.6431373, 1, 0, 1,
-0.7558618, -0.5994952, -1.799622, 0.6392157, 1, 0, 1,
-0.7437953, -0.1772066, -1.636822, 0.6313726, 1, 0, 1,
-0.7384395, -0.191069, -0.6791455, 0.627451, 1, 0, 1,
-0.7365375, -0.1507483, -1.247436, 0.6196079, 1, 0, 1,
-0.7343785, -0.1296369, -3.322673, 0.6156863, 1, 0, 1,
-0.7334101, -0.103472, -1.46586, 0.6078432, 1, 0, 1,
-0.7304775, 0.572439, -2.432527, 0.6039216, 1, 0, 1,
-0.7280768, 0.1795052, -0.804592, 0.5960785, 1, 0, 1,
-0.7223049, 1.815816, -0.5565181, 0.5882353, 1, 0, 1,
-0.7207651, -0.5629392, -2.447459, 0.5843138, 1, 0, 1,
-0.7118793, 0.3275436, -0.765879, 0.5764706, 1, 0, 1,
-0.7109317, 0.9502431, -1.367255, 0.572549, 1, 0, 1,
-0.708633, -0.02485232, -1.323533, 0.5647059, 1, 0, 1,
-0.7068744, -1.009195, -4.230558, 0.5607843, 1, 0, 1,
-0.7065139, 0.1277277, -1.066852, 0.5529412, 1, 0, 1,
-0.7012006, -0.4664924, -1.279259, 0.5490196, 1, 0, 1,
-0.6975886, -0.6876408, -2.428061, 0.5411765, 1, 0, 1,
-0.6941971, 0.3066564, -0.6194428, 0.5372549, 1, 0, 1,
-0.6910174, 0.177156, -1.740932, 0.5294118, 1, 0, 1,
-0.6764998, -0.5283267, -2.17983, 0.5254902, 1, 0, 1,
-0.673979, 0.4299459, 0.4418229, 0.5176471, 1, 0, 1,
-0.6651072, 0.2263069, -0.743606, 0.5137255, 1, 0, 1,
-0.6627702, -1.46153, -1.785263, 0.5058824, 1, 0, 1,
-0.6550588, -0.6366947, -2.011693, 0.5019608, 1, 0, 1,
-0.654761, -0.7464697, -2.313087, 0.4941176, 1, 0, 1,
-0.654015, -1.592257, -2.806701, 0.4862745, 1, 0, 1,
-0.6509112, 1.160118, -1.989135, 0.4823529, 1, 0, 1,
-0.6473781, -1.447045, -0.9102136, 0.4745098, 1, 0, 1,
-0.6401142, 0.454098, -1.339514, 0.4705882, 1, 0, 1,
-0.636176, -0.1250161, -0.962286, 0.4627451, 1, 0, 1,
-0.6351977, 1.490631, -0.7459686, 0.4588235, 1, 0, 1,
-0.631796, -0.4392158, -2.736765, 0.4509804, 1, 0, 1,
-0.6281329, -1.71157, -3.873873, 0.4470588, 1, 0, 1,
-0.6251835, -1.34792, -2.404823, 0.4392157, 1, 0, 1,
-0.6247461, 1.050345, -1.071561, 0.4352941, 1, 0, 1,
-0.6233842, -0.8949885, -4.560227, 0.427451, 1, 0, 1,
-0.6231661, 1.093484, 0.2659165, 0.4235294, 1, 0, 1,
-0.6181836, 0.7984145, -3.475786, 0.4156863, 1, 0, 1,
-0.616825, 0.215847, -0.6590982, 0.4117647, 1, 0, 1,
-0.6162098, 0.0613953, -0.4553607, 0.4039216, 1, 0, 1,
-0.6066772, 0.2627948, -1.28832, 0.3960784, 1, 0, 1,
-0.6048421, 0.6367266, 0.3079478, 0.3921569, 1, 0, 1,
-0.6043485, 1.273489, -1.461659, 0.3843137, 1, 0, 1,
-0.6012213, 0.1605098, -1.113429, 0.3803922, 1, 0, 1,
-0.5982541, -2.682861, -0.8089719, 0.372549, 1, 0, 1,
-0.5970589, -0.4890494, -1.360323, 0.3686275, 1, 0, 1,
-0.5954276, -0.5652511, -3.718906, 0.3607843, 1, 0, 1,
-0.5891719, -0.5741776, -2.599694, 0.3568628, 1, 0, 1,
-0.5834986, -1.473196, -2.355661, 0.3490196, 1, 0, 1,
-0.582262, -0.8468289, -2.707474, 0.345098, 1, 0, 1,
-0.5729979, 0.319654, -2.164266, 0.3372549, 1, 0, 1,
-0.5700585, 0.6243276, -0.4485872, 0.3333333, 1, 0, 1,
-0.5655873, -1.068694, -1.050299, 0.3254902, 1, 0, 1,
-0.5637711, -1.121686, -3.60051, 0.3215686, 1, 0, 1,
-0.5615171, -0.1624396, -1.431383, 0.3137255, 1, 0, 1,
-0.5590152, -0.531531, -2.375573, 0.3098039, 1, 0, 1,
-0.5551501, 2.155147, -0.9023103, 0.3019608, 1, 0, 1,
-0.5517362, -0.2524873, -0.5842888, 0.2941177, 1, 0, 1,
-0.5483697, 0.1455655, -1.192781, 0.2901961, 1, 0, 1,
-0.5439457, -0.9307382, -2.0771, 0.282353, 1, 0, 1,
-0.5425472, 0.8274387, -0.01396535, 0.2784314, 1, 0, 1,
-0.5394369, 1.45295, 0.2478075, 0.2705882, 1, 0, 1,
-0.5387684, 0.3494506, -0.4970076, 0.2666667, 1, 0, 1,
-0.5376098, 0.7626377, -0.646628, 0.2588235, 1, 0, 1,
-0.5374805, 0.2965421, -1.16149, 0.254902, 1, 0, 1,
-0.5372891, -0.3528112, -1.239515, 0.2470588, 1, 0, 1,
-0.5370824, -0.2991027, -4.181158, 0.2431373, 1, 0, 1,
-0.5342464, 0.2618231, -1.035186, 0.2352941, 1, 0, 1,
-0.5270509, 0.05697874, 0.1023006, 0.2313726, 1, 0, 1,
-0.5209528, 0.6998418, -1.600782, 0.2235294, 1, 0, 1,
-0.5205142, -0.03773547, -0.761593, 0.2196078, 1, 0, 1,
-0.5168379, 0.3297047, 0.7728637, 0.2117647, 1, 0, 1,
-0.5143884, -0.5624568, -1.655163, 0.2078431, 1, 0, 1,
-0.5111139, -0.384116, -3.271073, 0.2, 1, 0, 1,
-0.5106792, -1.413992, -1.705141, 0.1921569, 1, 0, 1,
-0.5105161, -1.619434, -2.717517, 0.1882353, 1, 0, 1,
-0.5104223, 1.575027, -0.630155, 0.1803922, 1, 0, 1,
-0.5046452, -0.1692554, -1.007273, 0.1764706, 1, 0, 1,
-0.4991256, -1.418033, -2.540293, 0.1686275, 1, 0, 1,
-0.4968153, 0.736088, 0.1027936, 0.1647059, 1, 0, 1,
-0.4967872, 1.106237, 0.148899, 0.1568628, 1, 0, 1,
-0.4950643, -0.6739474, -1.6007, 0.1529412, 1, 0, 1,
-0.4839476, 0.8504553, 0.7687612, 0.145098, 1, 0, 1,
-0.4765842, 0.8945148, -0.6950326, 0.1411765, 1, 0, 1,
-0.4740717, 0.9763124, -0.3822604, 0.1333333, 1, 0, 1,
-0.4707193, 0.3169521, -0.1145571, 0.1294118, 1, 0, 1,
-0.4703443, 2.079861, 0.6263371, 0.1215686, 1, 0, 1,
-0.4681953, 0.1449116, -3.08317, 0.1176471, 1, 0, 1,
-0.4673541, 0.1890639, -0.6059349, 0.1098039, 1, 0, 1,
-0.4661443, 0.3996938, -0.6635215, 0.1058824, 1, 0, 1,
-0.4634456, 1.04178, -0.7653605, 0.09803922, 1, 0, 1,
-0.4624543, -0.557858, -2.435813, 0.09019608, 1, 0, 1,
-0.4534591, 0.2279282, -1.108619, 0.08627451, 1, 0, 1,
-0.4501697, -1.061214, -1.972467, 0.07843138, 1, 0, 1,
-0.4460782, -0.07945106, -0.4785862, 0.07450981, 1, 0, 1,
-0.4440567, -1.035315, -3.430713, 0.06666667, 1, 0, 1,
-0.4406199, 0.07273704, -1.281708, 0.0627451, 1, 0, 1,
-0.4397568, 0.9473926, -0.837397, 0.05490196, 1, 0, 1,
-0.4373008, 0.4833944, 0.3087299, 0.05098039, 1, 0, 1,
-0.4339947, -1.353055, -3.853132, 0.04313726, 1, 0, 1,
-0.4336006, -1.060955, -2.020606, 0.03921569, 1, 0, 1,
-0.4328082, 0.7205548, -1.889818, 0.03137255, 1, 0, 1,
-0.4280001, 1.751198, 0.3072788, 0.02745098, 1, 0, 1,
-0.4271313, -0.2926344, -3.120181, 0.01960784, 1, 0, 1,
-0.4213114, -0.9305828, -2.772729, 0.01568628, 1, 0, 1,
-0.4206541, 2.835927, -0.2152832, 0.007843138, 1, 0, 1,
-0.4203599, -0.6898665, -2.688603, 0.003921569, 1, 0, 1,
-0.4193293, 1.144892, -0.3858221, 0, 1, 0.003921569, 1,
-0.4192138, -0.005484174, -0.397683, 0, 1, 0.01176471, 1,
-0.4116054, -0.9470345, -0.9599816, 0, 1, 0.01568628, 1,
-0.4095527, 0.2080946, -1.312461, 0, 1, 0.02352941, 1,
-0.4021009, 1.108482, -2.296177, 0, 1, 0.02745098, 1,
-0.4013023, -0.3853121, -1.363994, 0, 1, 0.03529412, 1,
-0.392774, 1.036608, -1.348891, 0, 1, 0.03921569, 1,
-0.3898338, -0.3116592, -2.504237, 0, 1, 0.04705882, 1,
-0.3893666, 1.360407, -2.207602, 0, 1, 0.05098039, 1,
-0.3882511, 1.289544, -1.313303, 0, 1, 0.05882353, 1,
-0.3877564, -0.008936252, -1.181712, 0, 1, 0.0627451, 1,
-0.3874249, 0.3688918, 0.2766891, 0, 1, 0.07058824, 1,
-0.3806097, 0.6876741, 0.4999345, 0, 1, 0.07450981, 1,
-0.3796707, -1.14964, -2.854019, 0, 1, 0.08235294, 1,
-0.3760003, 0.9755498, -0.8138928, 0, 1, 0.08627451, 1,
-0.3734527, 0.1577892, -1.794696, 0, 1, 0.09411765, 1,
-0.3724595, 0.3380062, 0.6661154, 0, 1, 0.1019608, 1,
-0.3721331, 0.2732568, -1.129126, 0, 1, 0.1058824, 1,
-0.3661557, -0.2466467, -0.7796957, 0, 1, 0.1137255, 1,
-0.3640412, -1.147795, -4.179895, 0, 1, 0.1176471, 1,
-0.362485, 0.1200676, -0.3023274, 0, 1, 0.1254902, 1,
-0.3619078, -0.07223079, -2.73962, 0, 1, 0.1294118, 1,
-0.3602593, 1.22603, -1.131536, 0, 1, 0.1372549, 1,
-0.3550345, -0.8620279, -2.978548, 0, 1, 0.1411765, 1,
-0.3473414, -1.925084, -3.81707, 0, 1, 0.1490196, 1,
-0.3431254, 0.5958821, 0.5836027, 0, 1, 0.1529412, 1,
-0.3429521, -0.5116891, -2.579225, 0, 1, 0.1607843, 1,
-0.3414708, -1.036556, -2.974823, 0, 1, 0.1647059, 1,
-0.3393787, -1.907811, -2.813825, 0, 1, 0.172549, 1,
-0.3338464, 0.6556364, -0.5138622, 0, 1, 0.1764706, 1,
-0.3323993, 0.5257387, -0.864934, 0, 1, 0.1843137, 1,
-0.3319645, -0.1838576, -2.766923, 0, 1, 0.1882353, 1,
-0.330704, 1.171518, 1.085776, 0, 1, 0.1960784, 1,
-0.3303897, -0.6698055, -2.21102, 0, 1, 0.2039216, 1,
-0.3299999, 0.6829821, -0.3335932, 0, 1, 0.2078431, 1,
-0.329423, -0.1265542, -3.667985, 0, 1, 0.2156863, 1,
-0.3269069, -0.2431067, -0.9031393, 0, 1, 0.2196078, 1,
-0.3222143, -2.096235, -2.908053, 0, 1, 0.227451, 1,
-0.3211356, 1.504812, 1.57389, 0, 1, 0.2313726, 1,
-0.3198883, 0.01301494, -1.427942, 0, 1, 0.2392157, 1,
-0.3169228, 0.2099822, -0.4688828, 0, 1, 0.2431373, 1,
-0.3106872, 0.7069053, -1.069533, 0, 1, 0.2509804, 1,
-0.3053267, -1.211508, -1.640605, 0, 1, 0.254902, 1,
-0.3018272, 1.66667, -0.4476035, 0, 1, 0.2627451, 1,
-0.3004813, -0.08355723, -1.651394, 0, 1, 0.2666667, 1,
-0.3004593, 0.4100533, -2.523265, 0, 1, 0.2745098, 1,
-0.2975911, 1.38663, 0.1788396, 0, 1, 0.2784314, 1,
-0.2975757, 0.2879028, -1.178473, 0, 1, 0.2862745, 1,
-0.2956538, 1.082484, -0.3141803, 0, 1, 0.2901961, 1,
-0.2909007, 0.3049491, 0.363492, 0, 1, 0.2980392, 1,
-0.2852361, -0.6302696, -3.513475, 0, 1, 0.3058824, 1,
-0.2828198, -0.7005485, -3.250344, 0, 1, 0.3098039, 1,
-0.280332, -0.2852371, -2.25409, 0, 1, 0.3176471, 1,
-0.2802358, -0.5392584, -1.302885, 0, 1, 0.3215686, 1,
-0.2797371, 1.341827, -0.9814371, 0, 1, 0.3294118, 1,
-0.2771501, 0.1851787, -1.184349, 0, 1, 0.3333333, 1,
-0.2735311, -0.1042508, -2.743026, 0, 1, 0.3411765, 1,
-0.2728456, 0.2926606, 0.1852793, 0, 1, 0.345098, 1,
-0.2692777, 1.36349, 0.5013925, 0, 1, 0.3529412, 1,
-0.2684502, 1.086435, 0.4296971, 0, 1, 0.3568628, 1,
-0.2673627, 1.160986, -0.220424, 0, 1, 0.3647059, 1,
-0.2625835, 0.5112187, 0.6834137, 0, 1, 0.3686275, 1,
-0.2624315, 0.4338251, -0.6821488, 0, 1, 0.3764706, 1,
-0.2572784, -0.06530114, -2.400996, 0, 1, 0.3803922, 1,
-0.2556888, -1.623909, -4.122052, 0, 1, 0.3882353, 1,
-0.2491363, 1.93252, -0.7164664, 0, 1, 0.3921569, 1,
-0.2490745, 0.5924667, -0.2727702, 0, 1, 0.4, 1,
-0.247384, 1.769213, 0.6976784, 0, 1, 0.4078431, 1,
-0.2472484, 0.1322886, -2.398247, 0, 1, 0.4117647, 1,
-0.246206, -0.4383535, -0.8425797, 0, 1, 0.4196078, 1,
-0.2450808, -0.1723251, -0.707258, 0, 1, 0.4235294, 1,
-0.244484, -0.9232644, -2.126237, 0, 1, 0.4313726, 1,
-0.2430538, -1.266297, -1.826958, 0, 1, 0.4352941, 1,
-0.2421614, -1.574789, -3.717266, 0, 1, 0.4431373, 1,
-0.2395673, 0.1681165, -1.676175, 0, 1, 0.4470588, 1,
-0.2393614, -0.3031551, -3.078472, 0, 1, 0.454902, 1,
-0.2352411, 0.7930725, 1.517665, 0, 1, 0.4588235, 1,
-0.2327993, -1.589377, -3.329657, 0, 1, 0.4666667, 1,
-0.2326186, 1.285246, 1.258805, 0, 1, 0.4705882, 1,
-0.2305872, 0.01792883, -1.217636, 0, 1, 0.4784314, 1,
-0.2282551, 1.320981, -0.3934073, 0, 1, 0.4823529, 1,
-0.2282258, -1.584701, -3.460602, 0, 1, 0.4901961, 1,
-0.2253465, 1.906142, 1.419527, 0, 1, 0.4941176, 1,
-0.2212751, -1.481459, -4.111132, 0, 1, 0.5019608, 1,
-0.220874, 0.04249298, -1.501023, 0, 1, 0.509804, 1,
-0.2205508, -0.1414, -2.482309, 0, 1, 0.5137255, 1,
-0.2190175, 1.857587, 0.7173631, 0, 1, 0.5215687, 1,
-0.2119871, -1.017837, -3.547808, 0, 1, 0.5254902, 1,
-0.2066514, 0.2130829, -1.508545, 0, 1, 0.5333334, 1,
-0.2060962, -0.5487194, -1.871367, 0, 1, 0.5372549, 1,
-0.2058442, 0.1917314, -0.6693531, 0, 1, 0.5450981, 1,
-0.1986251, -2.717255, -3.419009, 0, 1, 0.5490196, 1,
-0.1956183, 0.06688123, -0.6556196, 0, 1, 0.5568628, 1,
-0.1954233, 0.4188757, -1.123815, 0, 1, 0.5607843, 1,
-0.1945921, -2.116507, -2.21505, 0, 1, 0.5686275, 1,
-0.1936472, 1.234627, 1.841172, 0, 1, 0.572549, 1,
-0.1884425, 0.08251873, -1.414417, 0, 1, 0.5803922, 1,
-0.1791083, 2.002206, -1.344556, 0, 1, 0.5843138, 1,
-0.1779275, -1.318468, -4.449374, 0, 1, 0.5921569, 1,
-0.1727912, 1.548704, 1.820406, 0, 1, 0.5960785, 1,
-0.1722783, -0.2118828, -2.675709, 0, 1, 0.6039216, 1,
-0.1717364, 0.7403595, -0.8186113, 0, 1, 0.6117647, 1,
-0.1686027, 0.265886, -0.02460828, 0, 1, 0.6156863, 1,
-0.1645585, 0.7532656, -2.233554, 0, 1, 0.6235294, 1,
-0.1606319, 1.831675, 0.02063051, 0, 1, 0.627451, 1,
-0.159808, 0.1750506, -0.7603424, 0, 1, 0.6352941, 1,
-0.1566842, 0.362925, -0.5279347, 0, 1, 0.6392157, 1,
-0.1546346, -0.2632835, -2.136173, 0, 1, 0.6470588, 1,
-0.1499989, 1.128493, -1.293689, 0, 1, 0.6509804, 1,
-0.1489517, 1.45375, -2.596667, 0, 1, 0.6588235, 1,
-0.1488483, 0.5899122, -1.460094, 0, 1, 0.6627451, 1,
-0.1453695, -0.02632629, -3.306336, 0, 1, 0.6705883, 1,
-0.1425609, 1.300983, 1.30872, 0, 1, 0.6745098, 1,
-0.1409608, -0.3780895, -3.848991, 0, 1, 0.682353, 1,
-0.1408712, -1.515621, -3.122787, 0, 1, 0.6862745, 1,
-0.1376867, -0.3350473, -2.783557, 0, 1, 0.6941177, 1,
-0.1363665, 0.5151791, 1.458438, 0, 1, 0.7019608, 1,
-0.1353072, 0.4776032, -1.323228, 0, 1, 0.7058824, 1,
-0.1342485, 0.1680769, 0.180196, 0, 1, 0.7137255, 1,
-0.1328551, -0.9021379, -1.632348, 0, 1, 0.7176471, 1,
-0.1318541, -2.339098, -2.082683, 0, 1, 0.7254902, 1,
-0.1255483, 0.926459, 0.4771334, 0, 1, 0.7294118, 1,
-0.1176252, 0.04514448, -1.307018, 0, 1, 0.7372549, 1,
-0.1146903, -0.5572635, -3.444865, 0, 1, 0.7411765, 1,
-0.1130842, 1.871562, -0.8036569, 0, 1, 0.7490196, 1,
-0.1101771, 0.5455565, -0.9451255, 0, 1, 0.7529412, 1,
-0.1100506, -1.091281, -3.200794, 0, 1, 0.7607843, 1,
-0.1044388, -2.288297, -2.2589, 0, 1, 0.7647059, 1,
-0.1028084, 1.177448, 0.9566751, 0, 1, 0.772549, 1,
-0.1025222, 0.8494913, 0.4072517, 0, 1, 0.7764706, 1,
-0.09869149, 0.8475898, 0.02077264, 0, 1, 0.7843137, 1,
-0.09644487, 0.1136384, -1.430718, 0, 1, 0.7882353, 1,
-0.09497577, -0.8242794, -2.036021, 0, 1, 0.7960784, 1,
-0.08843119, 0.4765717, -0.3243186, 0, 1, 0.8039216, 1,
-0.08819768, -0.6709735, -2.970227, 0, 1, 0.8078431, 1,
-0.08206185, -0.6885934, -3.637827, 0, 1, 0.8156863, 1,
-0.07904557, -0.7955279, -2.372388, 0, 1, 0.8196079, 1,
-0.07557183, -1.60156, -3.241134, 0, 1, 0.827451, 1,
-0.07279817, 0.08747321, -1.94354, 0, 1, 0.8313726, 1,
-0.07235421, -0.5688541, -1.853454, 0, 1, 0.8392157, 1,
-0.07229208, -1.008511, -2.018888, 0, 1, 0.8431373, 1,
-0.07122726, 0.7698622, -0.451985, 0, 1, 0.8509804, 1,
-0.07122236, -1.699383, -1.288781, 0, 1, 0.854902, 1,
-0.06645549, -0.4814079, -4.737336, 0, 1, 0.8627451, 1,
-0.06530526, 0.2821759, 1.231216, 0, 1, 0.8666667, 1,
-0.06521345, -0.8728604, -2.399166, 0, 1, 0.8745098, 1,
-0.06392718, 0.3521917, 0.2076968, 0, 1, 0.8784314, 1,
-0.06308086, -0.1847886, -1.794189, 0, 1, 0.8862745, 1,
-0.05986243, -1.320269, -3.396585, 0, 1, 0.8901961, 1,
-0.05779197, 1.680569, -1.169418, 0, 1, 0.8980392, 1,
-0.05639574, -1.692441, -2.302333, 0, 1, 0.9058824, 1,
-0.05190706, -0.02044197, -1.96977, 0, 1, 0.9098039, 1,
-0.04624147, -1.53458, -4.640639, 0, 1, 0.9176471, 1,
-0.04502928, -1.056856, -2.130573, 0, 1, 0.9215686, 1,
-0.03161375, 1.757783, -0.3568458, 0, 1, 0.9294118, 1,
-0.03085327, 0.7244903, 1.480529, 0, 1, 0.9333333, 1,
-0.02910335, 0.9295518, -0.3271709, 0, 1, 0.9411765, 1,
-0.02500699, -0.558214, -3.356123, 0, 1, 0.945098, 1,
-0.02490732, -0.4872553, -3.670491, 0, 1, 0.9529412, 1,
-0.02361441, -1.226554, -4.961117, 0, 1, 0.9568627, 1,
-0.02316182, 0.07839811, -0.406264, 0, 1, 0.9647059, 1,
-0.01601976, -0.2484744, -5.459711, 0, 1, 0.9686275, 1,
-0.01047082, -0.1567927, -5.326893, 0, 1, 0.9764706, 1,
-0.007976202, 0.05061979, 1.031264, 0, 1, 0.9803922, 1,
-0.005448135, -1.241416, -3.458637, 0, 1, 0.9882353, 1,
-0.005320321, -1.525201, -3.624589, 0, 1, 0.9921569, 1,
-0.002017958, -0.2999441, -3.787924, 0, 1, 1, 1,
-0.001674506, -0.8200861, -3.326971, 0, 0.9921569, 1, 1,
-0.001510998, 0.0427478, -0.5403115, 0, 0.9882353, 1, 1,
-0.001308443, -1.400612, -3.332738, 0, 0.9803922, 1, 1,
-0.0002438674, 1.222877, -0.4340602, 0, 0.9764706, 1, 1,
0.0005105431, -1.016569, 4.133498, 0, 0.9686275, 1, 1,
0.001319277, 0.4518709, 1.319305, 0, 0.9647059, 1, 1,
0.003577205, -0.8143439, 1.88057, 0, 0.9568627, 1, 1,
0.005768779, -0.7718642, 4.135711, 0, 0.9529412, 1, 1,
0.006159248, 0.9993848, -0.8554723, 0, 0.945098, 1, 1,
0.009311351, 1.901712, -0.3430673, 0, 0.9411765, 1, 1,
0.01044796, -1.640558, 5.405847, 0, 0.9333333, 1, 1,
0.01146395, -1.248459, 3.771073, 0, 0.9294118, 1, 1,
0.01527546, -1.017858, 2.90281, 0, 0.9215686, 1, 1,
0.01747877, -0.2581388, 3.764745, 0, 0.9176471, 1, 1,
0.02007638, -0.4876433, 5.210454, 0, 0.9098039, 1, 1,
0.02832045, 0.7975733, 0.1734626, 0, 0.9058824, 1, 1,
0.03317528, 1.690972, 1.149626, 0, 0.8980392, 1, 1,
0.03707295, -0.7229057, 3.324553, 0, 0.8901961, 1, 1,
0.03750573, 1.620759, 0.5566337, 0, 0.8862745, 1, 1,
0.03954452, 0.9799734, 1.843847, 0, 0.8784314, 1, 1,
0.04314616, -1.55575, 1.539764, 0, 0.8745098, 1, 1,
0.04574183, 0.84961, -1.717614, 0, 0.8666667, 1, 1,
0.04653506, -0.8701858, 2.279933, 0, 0.8627451, 1, 1,
0.04743397, 0.8284906, 1.833217, 0, 0.854902, 1, 1,
0.05100398, -2.145769, 3.466161, 0, 0.8509804, 1, 1,
0.05382545, 0.1222256, 0.1078378, 0, 0.8431373, 1, 1,
0.05436451, 0.658606, 0.8357931, 0, 0.8392157, 1, 1,
0.05841128, -0.2553113, 2.893285, 0, 0.8313726, 1, 1,
0.06054293, 1.892955, -0.08746815, 0, 0.827451, 1, 1,
0.06176324, -0.7580092, 2.961795, 0, 0.8196079, 1, 1,
0.06656403, -1.119165, 3.065136, 0, 0.8156863, 1, 1,
0.07422983, 0.4609678, -0.4646401, 0, 0.8078431, 1, 1,
0.07592171, -0.2418967, 1.743997, 0, 0.8039216, 1, 1,
0.08353049, -0.4394506, 2.402589, 0, 0.7960784, 1, 1,
0.08640079, 0.6166293, -0.4053585, 0, 0.7882353, 1, 1,
0.08759905, -0.8664099, 1.339152, 0, 0.7843137, 1, 1,
0.09093519, -0.3017242, 1.05677, 0, 0.7764706, 1, 1,
0.09223805, 0.0993809, 0.9595249, 0, 0.772549, 1, 1,
0.100081, -0.4062644, 1.503941, 0, 0.7647059, 1, 1,
0.1037362, 1.120064, 0.009405411, 0, 0.7607843, 1, 1,
0.1058955, -0.123662, 1.76852, 0, 0.7529412, 1, 1,
0.1079292, -0.5348531, 2.137658, 0, 0.7490196, 1, 1,
0.1083656, 1.574471, 0.434634, 0, 0.7411765, 1, 1,
0.1098911, -0.228031, 2.010211, 0, 0.7372549, 1, 1,
0.1119841, -0.594157, 3.291322, 0, 0.7294118, 1, 1,
0.1156131, -0.9825085, 3.251292, 0, 0.7254902, 1, 1,
0.116581, -1.426075, 3.733392, 0, 0.7176471, 1, 1,
0.117122, 0.4115129, 0.9913885, 0, 0.7137255, 1, 1,
0.1184299, 0.01719921, 2.212493, 0, 0.7058824, 1, 1,
0.1206577, -1.274119, 2.523801, 0, 0.6980392, 1, 1,
0.1277744, 0.3146342, -1.020838, 0, 0.6941177, 1, 1,
0.1287598, -1.09502, 2.094712, 0, 0.6862745, 1, 1,
0.1292811, -0.2828275, 2.723426, 0, 0.682353, 1, 1,
0.1302542, -1.103777, 2.13235, 0, 0.6745098, 1, 1,
0.1312045, 0.02472046, 0.7172222, 0, 0.6705883, 1, 1,
0.1331706, 0.4756505, 0.6326045, 0, 0.6627451, 1, 1,
0.1350175, -0.6879992, 2.44732, 0, 0.6588235, 1, 1,
0.1361502, -0.6849912, 3.558353, 0, 0.6509804, 1, 1,
0.1408251, -1.711115, 2.716143, 0, 0.6470588, 1, 1,
0.1451777, -0.4053315, 1.576933, 0, 0.6392157, 1, 1,
0.1535248, 0.1810587, 1.166458, 0, 0.6352941, 1, 1,
0.1552433, 0.3859349, 1.555454, 0, 0.627451, 1, 1,
0.1561588, -0.4684154, 5.801298, 0, 0.6235294, 1, 1,
0.1598568, 2.872454, -1.447175, 0, 0.6156863, 1, 1,
0.1602694, -0.4385372, 2.406844, 0, 0.6117647, 1, 1,
0.1611039, -0.02454041, -0.2641493, 0, 0.6039216, 1, 1,
0.1650349, -0.3629504, 2.80608, 0, 0.5960785, 1, 1,
0.1700661, -0.4147064, 1.05494, 0, 0.5921569, 1, 1,
0.1702042, 0.09920602, -0.3383175, 0, 0.5843138, 1, 1,
0.1741317, -0.416283, 2.248651, 0, 0.5803922, 1, 1,
0.174433, 1.212986, 1.093879, 0, 0.572549, 1, 1,
0.1746452, -0.1615086, 1.724185, 0, 0.5686275, 1, 1,
0.1787278, -0.6127616, 3.006181, 0, 0.5607843, 1, 1,
0.1791741, -0.5083559, 2.155347, 0, 0.5568628, 1, 1,
0.1812355, 0.7472443, -0.5842763, 0, 0.5490196, 1, 1,
0.1937199, 1.160357, -1.330117, 0, 0.5450981, 1, 1,
0.1945727, -1.414377, 4.90056, 0, 0.5372549, 1, 1,
0.2017245, 0.6778825, -2.300885, 0, 0.5333334, 1, 1,
0.2018716, -0.8560058, 1.661804, 0, 0.5254902, 1, 1,
0.2051991, 0.2717789, -0.05683731, 0, 0.5215687, 1, 1,
0.2057244, -0.5599816, 2.829705, 0, 0.5137255, 1, 1,
0.2063849, -0.3244119, 1.749782, 0, 0.509804, 1, 1,
0.2068856, 0.5653588, 0.6067737, 0, 0.5019608, 1, 1,
0.2217247, -1.284155, 5.410381, 0, 0.4941176, 1, 1,
0.2246024, 1.147149, -1.695501, 0, 0.4901961, 1, 1,
0.2311144, -0.2401524, 1.717559, 0, 0.4823529, 1, 1,
0.2334977, -2.909123, 0.9544239, 0, 0.4784314, 1, 1,
0.2385951, -0.3298192, 1.866509, 0, 0.4705882, 1, 1,
0.2430082, -0.7798224, 2.582519, 0, 0.4666667, 1, 1,
0.245144, 1.020373, 0.9027888, 0, 0.4588235, 1, 1,
0.2483121, 0.5835823, 1.04898, 0, 0.454902, 1, 1,
0.2505555, -0.7602755, 2.803381, 0, 0.4470588, 1, 1,
0.2521393, 0.05327077, 1.159398, 0, 0.4431373, 1, 1,
0.2580296, -0.1098499, 1.36582, 0, 0.4352941, 1, 1,
0.2584337, -0.5109736, 2.977845, 0, 0.4313726, 1, 1,
0.2656675, 1.135903, -0.1786238, 0, 0.4235294, 1, 1,
0.2723144, -1.26618, 0.1447199, 0, 0.4196078, 1, 1,
0.2752533, 0.8151066, 1.732306, 0, 0.4117647, 1, 1,
0.2761748, 2.60712, 0.8830214, 0, 0.4078431, 1, 1,
0.2792776, -0.3171862, 2.372561, 0, 0.4, 1, 1,
0.2840136, 1.01673, 1.416701, 0, 0.3921569, 1, 1,
0.2847103, -1.287228, 2.783008, 0, 0.3882353, 1, 1,
0.2850295, -0.4286655, 3.655075, 0, 0.3803922, 1, 1,
0.2859477, -0.4854587, 3.904798, 0, 0.3764706, 1, 1,
0.2933684, -0.625134, 4.003943, 0, 0.3686275, 1, 1,
0.2933942, -0.5500495, 1.944819, 0, 0.3647059, 1, 1,
0.2957671, 0.7978411, -1.483558, 0, 0.3568628, 1, 1,
0.3018264, -1.951194, 3.873234, 0, 0.3529412, 1, 1,
0.3041369, -2.142819, 3.118705, 0, 0.345098, 1, 1,
0.3067699, 0.4058458, 1.391501, 0, 0.3411765, 1, 1,
0.3105607, 0.1892472, 1.878324, 0, 0.3333333, 1, 1,
0.3120422, 1.603683, 1.768223, 0, 0.3294118, 1, 1,
0.3155974, -0.2600975, 2.04953, 0, 0.3215686, 1, 1,
0.31655, 1.247283, 0.5954152, 0, 0.3176471, 1, 1,
0.3173512, -0.7768444, 3.201457, 0, 0.3098039, 1, 1,
0.3178421, 0.8197241, 0.7269878, 0, 0.3058824, 1, 1,
0.3188344, -1.702326, 2.619313, 0, 0.2980392, 1, 1,
0.3202695, 1.076218, -0.7943144, 0, 0.2901961, 1, 1,
0.3203315, 0.4390036, 1.302343, 0, 0.2862745, 1, 1,
0.3227734, 1.264236, 1.072371, 0, 0.2784314, 1, 1,
0.3244502, -0.2013503, 4.669314, 0, 0.2745098, 1, 1,
0.3300714, -0.1211811, 1.886907, 0, 0.2666667, 1, 1,
0.3313217, 0.4193977, 0.02788601, 0, 0.2627451, 1, 1,
0.3355952, 0.3559074, -0.5958515, 0, 0.254902, 1, 1,
0.3371642, -1.764844, 2.175169, 0, 0.2509804, 1, 1,
0.3389523, -1.755981, 3.098817, 0, 0.2431373, 1, 1,
0.3424589, -1.945895, 2.798117, 0, 0.2392157, 1, 1,
0.3441506, 0.6226637, -1.523137, 0, 0.2313726, 1, 1,
0.3458765, 0.9594782, 1.337872, 0, 0.227451, 1, 1,
0.3460117, 0.8591397, 0.2058313, 0, 0.2196078, 1, 1,
0.3471631, -0.3459281, 3.938112, 0, 0.2156863, 1, 1,
0.3483758, 0.4650352, 0.1725568, 0, 0.2078431, 1, 1,
0.3508746, -2.080237, 2.472551, 0, 0.2039216, 1, 1,
0.3513566, -0.7560756, 2.871887, 0, 0.1960784, 1, 1,
0.3532862, -1.08836, 2.689177, 0, 0.1882353, 1, 1,
0.3538605, 1.04227, -0.3853537, 0, 0.1843137, 1, 1,
0.3549605, -0.9355304, 4.034063, 0, 0.1764706, 1, 1,
0.3564957, -0.2076833, 1.525641, 0, 0.172549, 1, 1,
0.3574916, -1.268086, 3.685345, 0, 0.1647059, 1, 1,
0.3615935, -0.7967014, 3.139861, 0, 0.1607843, 1, 1,
0.3694225, 0.9105883, 0.6942648, 0, 0.1529412, 1, 1,
0.3702234, 0.8682922, 1.069924, 0, 0.1490196, 1, 1,
0.3705302, 0.08248351, 2.223809, 0, 0.1411765, 1, 1,
0.3753306, -1.209801, 1.283639, 0, 0.1372549, 1, 1,
0.3798043, 0.6344229, -2.337859, 0, 0.1294118, 1, 1,
0.3805675, 0.008493467, 2.021631, 0, 0.1254902, 1, 1,
0.38302, 0.7708032, 0.6023633, 0, 0.1176471, 1, 1,
0.3856356, 1.154095, -1.210607, 0, 0.1137255, 1, 1,
0.3879695, -0.7340195, 3.489075, 0, 0.1058824, 1, 1,
0.3907624, 0.2806306, -0.1649832, 0, 0.09803922, 1, 1,
0.391167, -0.9781113, 2.920948, 0, 0.09411765, 1, 1,
0.39546, 1.750112, 2.400363, 0, 0.08627451, 1, 1,
0.3973955, -0.5121064, 3.985023, 0, 0.08235294, 1, 1,
0.3994265, -1.957109, 2.146278, 0, 0.07450981, 1, 1,
0.4009404, -0.1850909, 1.265781, 0, 0.07058824, 1, 1,
0.4039, -0.7539064, 0.9149168, 0, 0.0627451, 1, 1,
0.4053345, -0.587228, 0.9334735, 0, 0.05882353, 1, 1,
0.4054172, 1.236253, -0.6741706, 0, 0.05098039, 1, 1,
0.4107833, -0.6956361, 1.977245, 0, 0.04705882, 1, 1,
0.4128498, -0.2294734, 1.043783, 0, 0.03921569, 1, 1,
0.4128541, -0.4397744, 2.078278, 0, 0.03529412, 1, 1,
0.4128952, -1.411245, 0.4085422, 0, 0.02745098, 1, 1,
0.4147639, -1.11683, 2.948544, 0, 0.02352941, 1, 1,
0.4207876, 1.539491, -0.4750648, 0, 0.01568628, 1, 1,
0.4236144, 0.8152596, -1.049209, 0, 0.01176471, 1, 1,
0.4239595, 1.702455, 2.492882, 0, 0.003921569, 1, 1,
0.4245045, -0.9494033, 2.146426, 0.003921569, 0, 1, 1,
0.4254502, 0.2336169, 1.253819, 0.007843138, 0, 1, 1,
0.4284036, 0.6871991, 0.1390608, 0.01568628, 0, 1, 1,
0.4340117, 0.2866839, 3.045795, 0.01960784, 0, 1, 1,
0.4410412, 0.8663828, 1.11446, 0.02745098, 0, 1, 1,
0.4423116, -0.006814351, -0.2691881, 0.03137255, 0, 1, 1,
0.4423721, -0.7636337, 4.256772, 0.03921569, 0, 1, 1,
0.4454702, -0.2627437, 1.982278, 0.04313726, 0, 1, 1,
0.4536612, -1.003899, 1.604296, 0.05098039, 0, 1, 1,
0.4578949, -0.4569409, 0.472076, 0.05490196, 0, 1, 1,
0.4756107, 0.2448548, 1.317323, 0.0627451, 0, 1, 1,
0.4762897, 0.173644, -0.912433, 0.06666667, 0, 1, 1,
0.4805002, 1.166179, 1.027406, 0.07450981, 0, 1, 1,
0.4805458, -0.4111255, 2.46252, 0.07843138, 0, 1, 1,
0.4900789, -0.4954305, 1.902941, 0.08627451, 0, 1, 1,
0.4902782, 0.6422247, 1.599944, 0.09019608, 0, 1, 1,
0.4927745, 0.02028231, 1.946847, 0.09803922, 0, 1, 1,
0.4937611, 2.176841, 1.165389, 0.1058824, 0, 1, 1,
0.4991675, -0.02692241, 2.066685, 0.1098039, 0, 1, 1,
0.4992503, 2.140025, 1.124289, 0.1176471, 0, 1, 1,
0.499505, -0.3654842, 1.305858, 0.1215686, 0, 1, 1,
0.5068403, -1.643579, 2.979094, 0.1294118, 0, 1, 1,
0.5078173, -1.80322, 2.071317, 0.1333333, 0, 1, 1,
0.5089054, 1.388096, 0.8227688, 0.1411765, 0, 1, 1,
0.5108759, 0.4703374, -1.215162, 0.145098, 0, 1, 1,
0.5133645, 1.521203, 0.5873528, 0.1529412, 0, 1, 1,
0.5187523, -2.747504, 2.781064, 0.1568628, 0, 1, 1,
0.5199711, 1.271971, 0.09021182, 0.1647059, 0, 1, 1,
0.5214488, 0.6917685, 0.7447889, 0.1686275, 0, 1, 1,
0.5226758, 0.2766099, 0.7496707, 0.1764706, 0, 1, 1,
0.5270544, 0.3840334, 1.506697, 0.1803922, 0, 1, 1,
0.5271322, -0.04380811, 2.640894, 0.1882353, 0, 1, 1,
0.5283741, 0.7408029, 0.04500458, 0.1921569, 0, 1, 1,
0.5286319, 1.437504, 0.832709, 0.2, 0, 1, 1,
0.5320978, -0.5903983, 1.43408, 0.2078431, 0, 1, 1,
0.5367427, -0.9739546, 3.285571, 0.2117647, 0, 1, 1,
0.5384426, -1.49767, 3.296386, 0.2196078, 0, 1, 1,
0.5391667, -0.1366512, 1.890326, 0.2235294, 0, 1, 1,
0.5415562, 2.647839, 0.2020734, 0.2313726, 0, 1, 1,
0.5464434, 0.523096, -1.111785, 0.2352941, 0, 1, 1,
0.5508914, 0.3397128, 0.7601814, 0.2431373, 0, 1, 1,
0.5557686, -0.1347187, 1.898413, 0.2470588, 0, 1, 1,
0.5604988, -0.5865339, 3.346837, 0.254902, 0, 1, 1,
0.5628027, 1.153163, 0.04944837, 0.2588235, 0, 1, 1,
0.5679811, 0.1424219, 1.684935, 0.2666667, 0, 1, 1,
0.5764289, -0.1125748, 0.9178147, 0.2705882, 0, 1, 1,
0.5794999, 0.4767708, 0.1157642, 0.2784314, 0, 1, 1,
0.5832084, -1.492355, 3.26063, 0.282353, 0, 1, 1,
0.5849329, 0.7253157, -0.3741204, 0.2901961, 0, 1, 1,
0.590418, -0.6229301, 2.72669, 0.2941177, 0, 1, 1,
0.5950066, -0.1141974, 0.2518347, 0.3019608, 0, 1, 1,
0.5954427, -1.753992, 2.847822, 0.3098039, 0, 1, 1,
0.5998219, 1.303666, 1.206606, 0.3137255, 0, 1, 1,
0.6014731, -0.5059549, 1.630095, 0.3215686, 0, 1, 1,
0.6036472, -0.8735919, 1.639012, 0.3254902, 0, 1, 1,
0.6072547, 1.347127, -1.709977, 0.3333333, 0, 1, 1,
0.6088365, -1.901649, 2.238554, 0.3372549, 0, 1, 1,
0.6096925, -0.2366204, 1.776148, 0.345098, 0, 1, 1,
0.6133873, -0.4100843, 2.99177, 0.3490196, 0, 1, 1,
0.6163782, 2.416714, -0.06754747, 0.3568628, 0, 1, 1,
0.6207924, -1.996591, 1.800473, 0.3607843, 0, 1, 1,
0.627846, -0.205871, 2.950678, 0.3686275, 0, 1, 1,
0.6345969, 2.34108, -1.215101, 0.372549, 0, 1, 1,
0.6349062, -0.9923943, 1.966841, 0.3803922, 0, 1, 1,
0.6353548, -0.1137766, 1.413991, 0.3843137, 0, 1, 1,
0.6386171, 0.67763, 0.1869897, 0.3921569, 0, 1, 1,
0.6388025, 0.145862, 2.598401, 0.3960784, 0, 1, 1,
0.6414813, -1.202451, 3.85568, 0.4039216, 0, 1, 1,
0.6461906, 0.005937654, 1.804336, 0.4117647, 0, 1, 1,
0.6473102, -0.5195976, 2.504274, 0.4156863, 0, 1, 1,
0.6503848, -2.730486, 2.671139, 0.4235294, 0, 1, 1,
0.6513159, 0.9276536, 0.8022072, 0.427451, 0, 1, 1,
0.6534266, -0.6615041, 2.20871, 0.4352941, 0, 1, 1,
0.6549006, 0.7778508, -0.07896004, 0.4392157, 0, 1, 1,
0.6550667, 0.556154, 0.81099, 0.4470588, 0, 1, 1,
0.6552796, 2.306776, 2.205215, 0.4509804, 0, 1, 1,
0.6555976, -0.01375685, 0.2125923, 0.4588235, 0, 1, 1,
0.6583882, 0.08233099, -0.9043815, 0.4627451, 0, 1, 1,
0.6591474, -0.2227048, 1.973026, 0.4705882, 0, 1, 1,
0.6620468, -1.006721, 4.280461, 0.4745098, 0, 1, 1,
0.6666514, -0.4164061, 2.914955, 0.4823529, 0, 1, 1,
0.6820624, -0.6769421, 2.245023, 0.4862745, 0, 1, 1,
0.6841419, -0.2319651, 0.1947732, 0.4941176, 0, 1, 1,
0.6846403, 0.7032273, 2.221511, 0.5019608, 0, 1, 1,
0.6865674, -0.8954506, 2.193937, 0.5058824, 0, 1, 1,
0.689872, 0.7099868, 1.176971, 0.5137255, 0, 1, 1,
0.6913116, -2.087981, 4.236499, 0.5176471, 0, 1, 1,
0.6930443, -1.208611, 3.793597, 0.5254902, 0, 1, 1,
0.6983696, 0.7934649, 2.155257, 0.5294118, 0, 1, 1,
0.7011847, 1.033757, 0.8949776, 0.5372549, 0, 1, 1,
0.7047092, -0.7331291, 3.165188, 0.5411765, 0, 1, 1,
0.7055769, 1.582951, -0.03772288, 0.5490196, 0, 1, 1,
0.7127785, -1.313252, 2.578819, 0.5529412, 0, 1, 1,
0.7145264, 1.197852, -0.5227839, 0.5607843, 0, 1, 1,
0.7215901, -0.2518443, 1.836302, 0.5647059, 0, 1, 1,
0.7220169, 1.822555, 1.498756, 0.572549, 0, 1, 1,
0.7291532, -1.210982, 2.969967, 0.5764706, 0, 1, 1,
0.7303715, 1.009198, 0.1433383, 0.5843138, 0, 1, 1,
0.7307197, 1.231387, 0.7494063, 0.5882353, 0, 1, 1,
0.7309927, 0.8120241, 1.587547, 0.5960785, 0, 1, 1,
0.7330006, 0.7342424, -0.5649976, 0.6039216, 0, 1, 1,
0.7330521, -0.9913754, 2.946585, 0.6078432, 0, 1, 1,
0.7332819, -1.926139, 1.603971, 0.6156863, 0, 1, 1,
0.7336817, 0.6707041, 0.90368, 0.6196079, 0, 1, 1,
0.7348393, -0.2037078, -0.7607154, 0.627451, 0, 1, 1,
0.734924, -0.2097341, 1.945259, 0.6313726, 0, 1, 1,
0.7398313, -0.2272156, 1.828532, 0.6392157, 0, 1, 1,
0.7489917, 0.5764655, 2.061839, 0.6431373, 0, 1, 1,
0.7510213, -0.4550422, 2.829237, 0.6509804, 0, 1, 1,
0.7531725, -0.9596319, 2.782619, 0.654902, 0, 1, 1,
0.7558843, 1.647294, -0.4788857, 0.6627451, 0, 1, 1,
0.7587736, 1.084117, 0.7160596, 0.6666667, 0, 1, 1,
0.7624157, 0.07145654, 1.012645, 0.6745098, 0, 1, 1,
0.7649558, -1.05026, 2.595242, 0.6784314, 0, 1, 1,
0.7676625, 0.3387566, 1.056828, 0.6862745, 0, 1, 1,
0.7678229, -1.361767, 1.778715, 0.6901961, 0, 1, 1,
0.7733555, -0.3148025, 3.272856, 0.6980392, 0, 1, 1,
0.786137, -1.236123, 0.3793778, 0.7058824, 0, 1, 1,
0.7881592, 0.5524451, 0.357818, 0.7098039, 0, 1, 1,
0.7903217, -0.8778223, 2.251648, 0.7176471, 0, 1, 1,
0.7925078, -0.6742609, 2.856632, 0.7215686, 0, 1, 1,
0.7992835, 0.5689798, 1.839614, 0.7294118, 0, 1, 1,
0.8011366, -1.294239, 3.123797, 0.7333333, 0, 1, 1,
0.8028815, -1.361878, 2.416307, 0.7411765, 0, 1, 1,
0.8204696, 0.4210521, 1.562247, 0.7450981, 0, 1, 1,
0.8239018, 1.513785, 1.351472, 0.7529412, 0, 1, 1,
0.8275635, 0.6254679, 1.158569, 0.7568628, 0, 1, 1,
0.8333284, 1.186151, 1.927012, 0.7647059, 0, 1, 1,
0.8344358, 0.1564349, 2.460447, 0.7686275, 0, 1, 1,
0.8356993, 0.6104386, 1.583895, 0.7764706, 0, 1, 1,
0.8395438, -1.215931, 2.235934, 0.7803922, 0, 1, 1,
0.8397339, -0.1095576, 2.951254, 0.7882353, 0, 1, 1,
0.8459425, -0.8170031, 2.323527, 0.7921569, 0, 1, 1,
0.8493106, -2.525543, 1.42125, 0.8, 0, 1, 1,
0.8531728, 0.01912138, 0.02387757, 0.8078431, 0, 1, 1,
0.8560479, 0.9135157, 0.5028279, 0.8117647, 0, 1, 1,
0.8599523, -1.063473, 3.448457, 0.8196079, 0, 1, 1,
0.8601756, -0.7362655, 2.949229, 0.8235294, 0, 1, 1,
0.8627357, -1.168752, 3.974161, 0.8313726, 0, 1, 1,
0.8657869, -0.4061251, 1.863686, 0.8352941, 0, 1, 1,
0.8688226, 0.3467057, 0.09691855, 0.8431373, 0, 1, 1,
0.8914535, 0.8474606, -1.368879, 0.8470588, 0, 1, 1,
0.8973473, -0.2489533, 2.183415, 0.854902, 0, 1, 1,
0.8974871, -1.559823, 2.758348, 0.8588235, 0, 1, 1,
0.9012716, 2.011625, 1.5955, 0.8666667, 0, 1, 1,
0.9022732, 0.5340214, 0.4190273, 0.8705882, 0, 1, 1,
0.9032964, -0.685385, 3.144367, 0.8784314, 0, 1, 1,
0.9068853, -0.9358366, 2.507539, 0.8823529, 0, 1, 1,
0.9109607, -1.241065, 1.698294, 0.8901961, 0, 1, 1,
0.917578, 1.75616, 0.01559425, 0.8941177, 0, 1, 1,
0.9204583, -0.6200437, 0.0387477, 0.9019608, 0, 1, 1,
0.9249119, -1.581715, 3.523234, 0.9098039, 0, 1, 1,
0.9290572, -1.122589, 2.828873, 0.9137255, 0, 1, 1,
0.9372154, 0.404303, 2.514746, 0.9215686, 0, 1, 1,
0.9454458, 0.2441215, 1.018593, 0.9254902, 0, 1, 1,
0.9479554, 0.06926368, -0.4955367, 0.9333333, 0, 1, 1,
0.9633574, -0.9509536, 1.561039, 0.9372549, 0, 1, 1,
0.9655918, -1.370222, 1.841643, 0.945098, 0, 1, 1,
0.9668789, -1.514751, 1.358725, 0.9490196, 0, 1, 1,
0.9672915, 1.199416, -0.1356493, 0.9568627, 0, 1, 1,
0.9915047, -1.336122, 3.727625, 0.9607843, 0, 1, 1,
0.9952146, 0.699162, 1.795851, 0.9686275, 0, 1, 1,
0.9963845, -1.783807, 2.774174, 0.972549, 0, 1, 1,
0.9978058, 0.2800357, 0.9342686, 0.9803922, 0, 1, 1,
1.001639, 0.4123577, 1.197048, 0.9843137, 0, 1, 1,
1.002302, -0.3908533, 2.424379, 0.9921569, 0, 1, 1,
1.002366, -1.886971, 2.161177, 0.9960784, 0, 1, 1,
1.003473, -0.06577317, 0.07400719, 1, 0, 0.9960784, 1,
1.005077, -0.06061353, 1.213478, 1, 0, 0.9882353, 1,
1.010067, 1.999645, -0.09080883, 1, 0, 0.9843137, 1,
1.010585, -2.415866, 3.246732, 1, 0, 0.9764706, 1,
1.011538, -0.09617714, 2.935966, 1, 0, 0.972549, 1,
1.014855, 0.2817518, 1.088025, 1, 0, 0.9647059, 1,
1.015031, 1.994696, 0.8055303, 1, 0, 0.9607843, 1,
1.016777, -1.02711, 2.40154, 1, 0, 0.9529412, 1,
1.017172, 0.4787375, 1.742645, 1, 0, 0.9490196, 1,
1.018057, -0.1437738, 0.9765884, 1, 0, 0.9411765, 1,
1.027192, 0.3754487, 2.802627, 1, 0, 0.9372549, 1,
1.037396, 0.2361444, 2.086731, 1, 0, 0.9294118, 1,
1.037783, -1.163642, 3.2098, 1, 0, 0.9254902, 1,
1.049105, 0.3543847, 1.671413, 1, 0, 0.9176471, 1,
1.050089, -0.1682362, 1.50738, 1, 0, 0.9137255, 1,
1.05035, 0.3587945, 2.075084, 1, 0, 0.9058824, 1,
1.052191, -0.1358265, 1.616753, 1, 0, 0.9019608, 1,
1.052883, 0.2471155, 0.4094841, 1, 0, 0.8941177, 1,
1.055179, 0.8812227, 0.3689829, 1, 0, 0.8862745, 1,
1.065955, 0.7627531, 2.344112, 1, 0, 0.8823529, 1,
1.067426, 1.494103, 0.9903459, 1, 0, 0.8745098, 1,
1.070428, 0.6354415, 4.187965, 1, 0, 0.8705882, 1,
1.071913, -0.02122758, 1.678495, 1, 0, 0.8627451, 1,
1.072987, -1.344928, 2.206033, 1, 0, 0.8588235, 1,
1.107755, 1.201571, 0.8046306, 1, 0, 0.8509804, 1,
1.116312, -0.9845285, 1.794003, 1, 0, 0.8470588, 1,
1.117351, -1.091612, 1.256785, 1, 0, 0.8392157, 1,
1.119562, 1.573908, 1.811662, 1, 0, 0.8352941, 1,
1.13275, -0.7814965, 1.27998, 1, 0, 0.827451, 1,
1.13571, -0.440026, 1.535523, 1, 0, 0.8235294, 1,
1.14076, -0.1199681, 0.8506981, 1, 0, 0.8156863, 1,
1.143125, 1.44476, 0.8397698, 1, 0, 0.8117647, 1,
1.14791, -2.285709, 2.766502, 1, 0, 0.8039216, 1,
1.148791, -1.077797, 3.216377, 1, 0, 0.7960784, 1,
1.158804, -0.9367474, 2.289283, 1, 0, 0.7921569, 1,
1.161347, 0.2324807, 0.7852971, 1, 0, 0.7843137, 1,
1.163711, -0.08330975, 0.722638, 1, 0, 0.7803922, 1,
1.173396, -1.400171, 2.114579, 1, 0, 0.772549, 1,
1.176809, 1.002752, 0.682942, 1, 0, 0.7686275, 1,
1.183604, -0.6113271, 0.2211047, 1, 0, 0.7607843, 1,
1.190956, -0.1051123, 1.904414, 1, 0, 0.7568628, 1,
1.197887, 0.9158302, 1.35543, 1, 0, 0.7490196, 1,
1.198611, -0.1196721, 0.5577322, 1, 0, 0.7450981, 1,
1.200349, 0.5103354, -0.3588519, 1, 0, 0.7372549, 1,
1.211588, -0.06811944, 3.247589, 1, 0, 0.7333333, 1,
1.219257, -1.098843, 2.316918, 1, 0, 0.7254902, 1,
1.220083, 0.9760842, 2.896359, 1, 0, 0.7215686, 1,
1.225444, -0.3087726, 1.795452, 1, 0, 0.7137255, 1,
1.226585, -0.4151385, 2.408879, 1, 0, 0.7098039, 1,
1.227626, -1.074956, 2.076487, 1, 0, 0.7019608, 1,
1.232135, -1.335367, 3.468398, 1, 0, 0.6941177, 1,
1.237499, 0.83482, 2.124046, 1, 0, 0.6901961, 1,
1.242929, 1.069387, -0.05012044, 1, 0, 0.682353, 1,
1.245338, 0.294602, 0.7831473, 1, 0, 0.6784314, 1,
1.252502, 0.173158, 0.02819645, 1, 0, 0.6705883, 1,
1.26759, -0.1142471, 2.324626, 1, 0, 0.6666667, 1,
1.272002, -1.078636, 0.8787777, 1, 0, 0.6588235, 1,
1.281243, -1.146588, 1.129091, 1, 0, 0.654902, 1,
1.286235, 1.374305, 0.4821269, 1, 0, 0.6470588, 1,
1.292119, 0.2636558, 0.8174816, 1, 0, 0.6431373, 1,
1.292458, 0.01633969, 2.999495, 1, 0, 0.6352941, 1,
1.294338, -1.240705, 2.766384, 1, 0, 0.6313726, 1,
1.294358, -0.919082, 3.487941, 1, 0, 0.6235294, 1,
1.295054, 0.4794477, 0.6774052, 1, 0, 0.6196079, 1,
1.300731, -0.5221259, 2.166975, 1, 0, 0.6117647, 1,
1.309092, -1.289874, 1.435633, 1, 0, 0.6078432, 1,
1.313855, 0.9182126, 1.211272, 1, 0, 0.6, 1,
1.322208, -2.093054, 3.18171, 1, 0, 0.5921569, 1,
1.322664, 1.980032, 1.877361, 1, 0, 0.5882353, 1,
1.328665, 0.1666654, 0.1570789, 1, 0, 0.5803922, 1,
1.334437, -0.9764885, 2.272431, 1, 0, 0.5764706, 1,
1.335237, 0.07385049, 1.48853, 1, 0, 0.5686275, 1,
1.339062, 0.4100809, 0.2147087, 1, 0, 0.5647059, 1,
1.341727, 0.3443451, 1.235436, 1, 0, 0.5568628, 1,
1.343778, -0.1694487, 2.14335, 1, 0, 0.5529412, 1,
1.347449, 0.5019717, 1.327898, 1, 0, 0.5450981, 1,
1.34943, -1.007079, 2.639015, 1, 0, 0.5411765, 1,
1.351117, 0.3756831, 1.628806, 1, 0, 0.5333334, 1,
1.363002, -0.09804138, 2.339615, 1, 0, 0.5294118, 1,
1.367996, -0.05039013, 3.461812, 1, 0, 0.5215687, 1,
1.404246, 1.197071, 1.700933, 1, 0, 0.5176471, 1,
1.407294, -0.156892, 1.194039, 1, 0, 0.509804, 1,
1.40878, 0.576546, 1.918416, 1, 0, 0.5058824, 1,
1.430952, 0.4459033, -0.2243905, 1, 0, 0.4980392, 1,
1.43439, -1.698626, 2.039574, 1, 0, 0.4901961, 1,
1.453038, 0.3013443, 1.401404, 1, 0, 0.4862745, 1,
1.455176, -1.401589, 0.8969095, 1, 0, 0.4784314, 1,
1.472338, 1.592504, -0.735744, 1, 0, 0.4745098, 1,
1.475598, -0.6573806, 2.692649, 1, 0, 0.4666667, 1,
1.479789, -1.599114, 0.6461936, 1, 0, 0.4627451, 1,
1.480064, -1.480538, 2.549264, 1, 0, 0.454902, 1,
1.480273, -1.884817, 2.384742, 1, 0, 0.4509804, 1,
1.489869, 0.432256, 0.8053549, 1, 0, 0.4431373, 1,
1.495126, -1.250605, 0.8608285, 1, 0, 0.4392157, 1,
1.500167, 1.528832, 1.55898, 1, 0, 0.4313726, 1,
1.503986, -0.09576762, 1.78098, 1, 0, 0.427451, 1,
1.505387, -0.7926719, 0.4461071, 1, 0, 0.4196078, 1,
1.506573, 1.997865, 1.830918, 1, 0, 0.4156863, 1,
1.509493, -0.4611407, 0.8133633, 1, 0, 0.4078431, 1,
1.515733, 0.2816822, 1.591343, 1, 0, 0.4039216, 1,
1.520092, -1.195197, 2.872952, 1, 0, 0.3960784, 1,
1.524356, -0.6479732, 2.551717, 1, 0, 0.3882353, 1,
1.537339, -0.07740415, 1.198694, 1, 0, 0.3843137, 1,
1.539808, -2.883345, 1.377747, 1, 0, 0.3764706, 1,
1.542357, -0.7109922, 2.814037, 1, 0, 0.372549, 1,
1.563763, -1.037544, 2.031494, 1, 0, 0.3647059, 1,
1.571053, -2.662342, 1.401747, 1, 0, 0.3607843, 1,
1.571299, 1.47146, -0.5164681, 1, 0, 0.3529412, 1,
1.578776, 0.4620225, 0.09239714, 1, 0, 0.3490196, 1,
1.583718, 1.408623, 2.021374, 1, 0, 0.3411765, 1,
1.587093, 1.175032, 1.911416, 1, 0, 0.3372549, 1,
1.588779, 0.4074078, 0.2195493, 1, 0, 0.3294118, 1,
1.593963, -1.423508, 3.25134, 1, 0, 0.3254902, 1,
1.612376, -2.314325, 1.573385, 1, 0, 0.3176471, 1,
1.619269, -0.180186, 1.663699, 1, 0, 0.3137255, 1,
1.621016, -0.833949, 1.499135, 1, 0, 0.3058824, 1,
1.622831, 0.3484519, 0.666092, 1, 0, 0.2980392, 1,
1.62669, 0.06090653, 1.293008, 1, 0, 0.2941177, 1,
1.645906, 1.644827, -0.006442918, 1, 0, 0.2862745, 1,
1.655267, -0.1081612, 2.008781, 1, 0, 0.282353, 1,
1.655931, 1.620869, -1.040461, 1, 0, 0.2745098, 1,
1.693167, 1.076073, 0.2018639, 1, 0, 0.2705882, 1,
1.696349, -0.05428776, 0.7903028, 1, 0, 0.2627451, 1,
1.696363, -2.126344, 2.337353, 1, 0, 0.2588235, 1,
1.725008, -0.4953032, 1.134744, 1, 0, 0.2509804, 1,
1.72808, -1.022455, 1.12061, 1, 0, 0.2470588, 1,
1.741083, -0.6017368, 3.652311, 1, 0, 0.2392157, 1,
1.75387, 0.1813403, 0.888544, 1, 0, 0.2352941, 1,
1.770867, 0.3297493, 1.467704, 1, 0, 0.227451, 1,
1.785176, 0.4840424, 1.733885, 1, 0, 0.2235294, 1,
1.786653, 1.075601, 1.931554, 1, 0, 0.2156863, 1,
1.794109, -1.483274, 2.605143, 1, 0, 0.2117647, 1,
1.852499, -0.1671457, 2.038538, 1, 0, 0.2039216, 1,
1.855032, -0.02031177, 2.382803, 1, 0, 0.1960784, 1,
1.863625, 1.206306, 1.308968, 1, 0, 0.1921569, 1,
1.868625, -1.169023, 2.511001, 1, 0, 0.1843137, 1,
1.88103, -1.341911, 2.726865, 1, 0, 0.1803922, 1,
1.883263, 0.9273943, 1.278344, 1, 0, 0.172549, 1,
1.887135, 0.2827466, 2.505756, 1, 0, 0.1686275, 1,
1.899271, -1.455736, 2.598278, 1, 0, 0.1607843, 1,
1.900323, 0.8009754, 0.8027034, 1, 0, 0.1568628, 1,
1.909362, -0.7908379, 1.171718, 1, 0, 0.1490196, 1,
1.912447, 0.6241543, 3.199187, 1, 0, 0.145098, 1,
1.963403, -1.018891, 1.714152, 1, 0, 0.1372549, 1,
1.973396, -0.8047915, 3.3266, 1, 0, 0.1333333, 1,
1.980695, -0.5296311, 1.358287, 1, 0, 0.1254902, 1,
1.997216, 0.6333022, 0.8312543, 1, 0, 0.1215686, 1,
2.006078, -2.466745, 3.143733, 1, 0, 0.1137255, 1,
2.040359, 0.583141, 0.1389589, 1, 0, 0.1098039, 1,
2.056312, -0.6887669, 3.493583, 1, 0, 0.1019608, 1,
2.074075, -0.08024856, 0.7099224, 1, 0, 0.09411765, 1,
2.075026, 2.442825, 2.296769, 1, 0, 0.09019608, 1,
2.078789, 0.05610254, 1.033421, 1, 0, 0.08235294, 1,
2.13583, -0.2029473, 1.452831, 1, 0, 0.07843138, 1,
2.142216, -1.137231, 1.503417, 1, 0, 0.07058824, 1,
2.20282, -0.2038446, 2.539461, 1, 0, 0.06666667, 1,
2.256178, -1.312089, 2.399347, 1, 0, 0.05882353, 1,
2.344661, 0.4303854, -0.144797, 1, 0, 0.05490196, 1,
2.388358, -0.2222658, 1.891342, 1, 0, 0.04705882, 1,
2.479144, 0.4889503, 3.431036, 1, 0, 0.04313726, 1,
2.525918, -0.3657005, 1.553496, 1, 0, 0.03529412, 1,
2.584412, -1.217732, 1.825145, 1, 0, 0.03137255, 1,
2.665879, -0.9400669, 2.045179, 1, 0, 0.02352941, 1,
2.712352, -0.4719466, 2.216204, 1, 0, 0.01960784, 1,
2.773069, 2.684067, 0.5595351, 1, 0, 0.01176471, 1,
2.80669, -0.443438, 2.437024, 1, 0, 0.007843138, 1
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
-0.206593, -3.8891, -7.368452, 0, -0.5, 0.5, 0.5,
-0.206593, -3.8891, -7.368452, 1, -0.5, 0.5, 0.5,
-0.206593, -3.8891, -7.368452, 1, 1.5, 0.5, 0.5,
-0.206593, -3.8891, -7.368452, 0, 1.5, 0.5, 0.5
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
-4.241378, -0.01833451, -7.368452, 0, -0.5, 0.5, 0.5,
-4.241378, -0.01833451, -7.368452, 1, -0.5, 0.5, 0.5,
-4.241378, -0.01833451, -7.368452, 1, 1.5, 0.5, 0.5,
-4.241378, -0.01833451, -7.368452, 0, 1.5, 0.5, 0.5
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
-4.241378, -3.8891, 0.1707938, 0, -0.5, 0.5, 0.5,
-4.241378, -3.8891, 0.1707938, 1, -0.5, 0.5, 0.5,
-4.241378, -3.8891, 0.1707938, 1, 1.5, 0.5, 0.5,
-4.241378, -3.8891, 0.1707938, 0, 1.5, 0.5, 0.5
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
-3, -2.995847, -5.628626,
2, -2.995847, -5.628626,
-3, -2.995847, -5.628626,
-3, -3.144722, -5.918597,
-2, -2.995847, -5.628626,
-2, -3.144722, -5.918597,
-1, -2.995847, -5.628626,
-1, -3.144722, -5.918597,
0, -2.995847, -5.628626,
0, -3.144722, -5.918597,
1, -2.995847, -5.628626,
1, -3.144722, -5.918597,
2, -2.995847, -5.628626,
2, -3.144722, -5.918597
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
-3, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
-3, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
-3, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
-3, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5,
-2, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
-2, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
-2, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
-2, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5,
-1, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
-1, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
-1, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
-1, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5,
0, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
0, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
0, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
0, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5,
1, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
1, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
1, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
1, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5,
2, -3.442473, -6.498538, 0, -0.5, 0.5, 0.5,
2, -3.442473, -6.498538, 1, -0.5, 0.5, 0.5,
2, -3.442473, -6.498538, 1, 1.5, 0.5, 0.5,
2, -3.442473, -6.498538, 0, 1.5, 0.5, 0.5
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
-3.310274, -2, -5.628626,
-3.310274, 2, -5.628626,
-3.310274, -2, -5.628626,
-3.465458, -2, -5.918597,
-3.310274, -1, -5.628626,
-3.465458, -1, -5.918597,
-3.310274, 0, -5.628626,
-3.465458, 0, -5.918597,
-3.310274, 1, -5.628626,
-3.465458, 1, -5.918597,
-3.310274, 2, -5.628626,
-3.465458, 2, -5.918597
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
-3.775826, -2, -6.498538, 0, -0.5, 0.5, 0.5,
-3.775826, -2, -6.498538, 1, -0.5, 0.5, 0.5,
-3.775826, -2, -6.498538, 1, 1.5, 0.5, 0.5,
-3.775826, -2, -6.498538, 0, 1.5, 0.5, 0.5,
-3.775826, -1, -6.498538, 0, -0.5, 0.5, 0.5,
-3.775826, -1, -6.498538, 1, -0.5, 0.5, 0.5,
-3.775826, -1, -6.498538, 1, 1.5, 0.5, 0.5,
-3.775826, -1, -6.498538, 0, 1.5, 0.5, 0.5,
-3.775826, 0, -6.498538, 0, -0.5, 0.5, 0.5,
-3.775826, 0, -6.498538, 1, -0.5, 0.5, 0.5,
-3.775826, 0, -6.498538, 1, 1.5, 0.5, 0.5,
-3.775826, 0, -6.498538, 0, 1.5, 0.5, 0.5,
-3.775826, 1, -6.498538, 0, -0.5, 0.5, 0.5,
-3.775826, 1, -6.498538, 1, -0.5, 0.5, 0.5,
-3.775826, 1, -6.498538, 1, 1.5, 0.5, 0.5,
-3.775826, 1, -6.498538, 0, 1.5, 0.5, 0.5,
-3.775826, 2, -6.498538, 0, -0.5, 0.5, 0.5,
-3.775826, 2, -6.498538, 1, -0.5, 0.5, 0.5,
-3.775826, 2, -6.498538, 1, 1.5, 0.5, 0.5,
-3.775826, 2, -6.498538, 0, 1.5, 0.5, 0.5
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
-3.310274, -2.995847, -4,
-3.310274, -2.995847, 4,
-3.310274, -2.995847, -4,
-3.465458, -3.144722, -4,
-3.310274, -2.995847, -2,
-3.465458, -3.144722, -2,
-3.310274, -2.995847, 0,
-3.465458, -3.144722, 0,
-3.310274, -2.995847, 2,
-3.465458, -3.144722, 2,
-3.310274, -2.995847, 4,
-3.465458, -3.144722, 4
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
-3.775826, -3.442473, -4, 0, -0.5, 0.5, 0.5,
-3.775826, -3.442473, -4, 1, -0.5, 0.5, 0.5,
-3.775826, -3.442473, -4, 1, 1.5, 0.5, 0.5,
-3.775826, -3.442473, -4, 0, 1.5, 0.5, 0.5,
-3.775826, -3.442473, -2, 0, -0.5, 0.5, 0.5,
-3.775826, -3.442473, -2, 1, -0.5, 0.5, 0.5,
-3.775826, -3.442473, -2, 1, 1.5, 0.5, 0.5,
-3.775826, -3.442473, -2, 0, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 0, 0, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 0, 1, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 0, 1, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 0, 0, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 2, 0, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 2, 1, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 2, 1, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 2, 0, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 4, 0, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 4, 1, -0.5, 0.5, 0.5,
-3.775826, -3.442473, 4, 1, 1.5, 0.5, 0.5,
-3.775826, -3.442473, 4, 0, 1.5, 0.5, 0.5
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
-3.310274, -2.995847, -5.628626,
-3.310274, 2.959177, -5.628626,
-3.310274, -2.995847, 5.970213,
-3.310274, 2.959177, 5.970213,
-3.310274, -2.995847, -5.628626,
-3.310274, -2.995847, 5.970213,
-3.310274, 2.959177, -5.628626,
-3.310274, 2.959177, 5.970213,
-3.310274, -2.995847, -5.628626,
2.897088, -2.995847, -5.628626,
-3.310274, -2.995847, 5.970213,
2.897088, -2.995847, 5.970213,
-3.310274, 2.959177, -5.628626,
2.897088, 2.959177, -5.628626,
-3.310274, 2.959177, 5.970213,
2.897088, 2.959177, 5.970213,
2.897088, -2.995847, -5.628626,
2.897088, 2.959177, -5.628626,
2.897088, -2.995847, 5.970213,
2.897088, 2.959177, 5.970213,
2.897088, -2.995847, -5.628626,
2.897088, -2.995847, 5.970213,
2.897088, 2.959177, -5.628626,
2.897088, 2.959177, 5.970213
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
var radius = 7.710922;
var distance = 34.30676;
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
mvMatrix.translate( 0.206593, 0.01833451, -0.1707938 );
mvMatrix.scale( 1.343115, 1.400028, 0.7187961 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.30676);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Sulfone<-read.table("Sulfone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sulfone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
```

```r
y<-Sulfone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
```

```r
z<-Sulfone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
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
-3.219876, 0.9344463, -2.012851, 0, 0, 1, 1, 1,
-3.15707, -0.04210401, -1.698507, 1, 0, 0, 1, 1,
-3.11285, -1.049467, -2.098621, 1, 0, 0, 1, 1,
-2.790349, -1.007559, -2.566735, 1, 0, 0, 1, 1,
-2.570783, 0.9508155, -1.831632, 1, 0, 0, 1, 1,
-2.56386, 0.3102895, -1.101985, 1, 0, 0, 1, 1,
-2.489185, -1.038905, 0.2479572, 0, 0, 0, 1, 1,
-2.470228, 0.8565142, -2.083994, 0, 0, 0, 1, 1,
-2.364048, 0.2452991, -1.836018, 0, 0, 0, 1, 1,
-2.363744, -0.7679036, -2.994265, 0, 0, 0, 1, 1,
-2.349814, 0.6090645, -2.543437, 0, 0, 0, 1, 1,
-2.341791, -0.5877405, -2.156727, 0, 0, 0, 1, 1,
-2.26018, 0.3679266, -0.549413, 0, 0, 0, 1, 1,
-2.24256, -1.287868, -0.7651077, 1, 1, 1, 1, 1,
-2.209521, -1.29107, -1.627569, 1, 1, 1, 1, 1,
-2.193919, -1.173457, -1.838467, 1, 1, 1, 1, 1,
-2.138011, -0.9557589, -1.623813, 1, 1, 1, 1, 1,
-2.106737, 0.0774996, -1.16356, 1, 1, 1, 1, 1,
-2.060604, 0.2762857, 0.2203031, 1, 1, 1, 1, 1,
-2.035275, 0.2018813, -0.6961907, 1, 1, 1, 1, 1,
-2.031243, 0.1573686, -1.674303, 1, 1, 1, 1, 1,
-2.015149, -0.2707895, -3.355575, 1, 1, 1, 1, 1,
-2.00678, 0.3855245, -1.672523, 1, 1, 1, 1, 1,
-1.995927, 0.2287129, -1.112177, 1, 1, 1, 1, 1,
-1.99402, -0.7599818, -1.415309, 1, 1, 1, 1, 1,
-1.982158, 1.182848, 0.3693436, 1, 1, 1, 1, 1,
-1.968819, 0.2576429, -2.503584, 1, 1, 1, 1, 1,
-1.955665, -1.355242, -3.020945, 1, 1, 1, 1, 1,
-1.950973, 0.3949866, -1.44366, 0, 0, 1, 1, 1,
-1.920443, -0.5508036, -1.416354, 1, 0, 0, 1, 1,
-1.918568, 0.2810171, -1.057352, 1, 0, 0, 1, 1,
-1.912393, -1.905689, -4.514944, 1, 0, 0, 1, 1,
-1.912159, 0.7839264, -1.554961, 1, 0, 0, 1, 1,
-1.911616, 0.5262241, 0.09464592, 1, 0, 0, 1, 1,
-1.887216, -1.092664, -1.797311, 0, 0, 0, 1, 1,
-1.851492, 0.00821048, -1.997283, 0, 0, 0, 1, 1,
-1.841914, 0.9440688, -2.787125, 0, 0, 0, 1, 1,
-1.80737, -0.6143784, -2.208429, 0, 0, 0, 1, 1,
-1.807343, 0.949423, -1.896751, 0, 0, 0, 1, 1,
-1.794481, -2.155333, -2.041916, 0, 0, 0, 1, 1,
-1.792467, 1.034376, -0.9546118, 0, 0, 0, 1, 1,
-1.786235, 0.4955293, -1.032888, 1, 1, 1, 1, 1,
-1.769422, -0.172686, -1.847559, 1, 1, 1, 1, 1,
-1.766444, -0.3280526, -2.575061, 1, 1, 1, 1, 1,
-1.763543, -1.377723, -3.466213, 1, 1, 1, 1, 1,
-1.759503, -0.360617, -3.233419, 1, 1, 1, 1, 1,
-1.741434, -2.088436, -3.792363, 1, 1, 1, 1, 1,
-1.739576, -2.766065, -1.260162, 1, 1, 1, 1, 1,
-1.70461, -1.644792, -1.64411, 1, 1, 1, 1, 1,
-1.702576, -1.982406, -5.269321, 1, 1, 1, 1, 1,
-1.697417, -1.267666, -1.233116, 1, 1, 1, 1, 1,
-1.650327, 0.3123309, -1.154236, 1, 1, 1, 1, 1,
-1.639373, 1.284505, -1.568344, 1, 1, 1, 1, 1,
-1.635966, 0.6542867, -1.57327, 1, 1, 1, 1, 1,
-1.632125, 0.5473585, -0.3960824, 1, 1, 1, 1, 1,
-1.617665, 0.03136173, -1.62944, 1, 1, 1, 1, 1,
-1.605833, 0.7488008, -0.6423457, 0, 0, 1, 1, 1,
-1.59551, 0.1098412, -0.924773, 1, 0, 0, 1, 1,
-1.587851, -0.4615134, -1.895697, 1, 0, 0, 1, 1,
-1.58785, -0.555438, -3.31081, 1, 0, 0, 1, 1,
-1.584919, 0.0989596, -0.09057913, 1, 0, 0, 1, 1,
-1.584729, 1.422617, -2.066513, 1, 0, 0, 1, 1,
-1.567433, 0.8638454, -1.116668, 0, 0, 0, 1, 1,
-1.563991, -0.8325406, -1.98521, 0, 0, 0, 1, 1,
-1.559691, 1.240437, -0.4441415, 0, 0, 0, 1, 1,
-1.553104, -0.248087, 0.2951548, 0, 0, 0, 1, 1,
-1.550038, -0.795832, -2.998251, 0, 0, 0, 1, 1,
-1.544202, -1.479129, -2.907961, 0, 0, 0, 1, 1,
-1.542372, -0.6200487, -1.984874, 0, 0, 0, 1, 1,
-1.539676, 1.144267, -0.4878152, 1, 1, 1, 1, 1,
-1.531619, -0.7053179, -2.926224, 1, 1, 1, 1, 1,
-1.515076, 0.1688155, -0.6664131, 1, 1, 1, 1, 1,
-1.480548, 0.008458917, -0.5909866, 1, 1, 1, 1, 1,
-1.470826, -0.7439781, -2.322824, 1, 1, 1, 1, 1,
-1.448957, 0.5060744, -1.737492, 1, 1, 1, 1, 1,
-1.442479, 0.5219634, -0.9696865, 1, 1, 1, 1, 1,
-1.440146, -0.1083341, -0.9868761, 1, 1, 1, 1, 1,
-1.437078, -0.1905997, -0.4779473, 1, 1, 1, 1, 1,
-1.434582, -0.3936329, -2.368056, 1, 1, 1, 1, 1,
-1.433824, -0.1711537, -2.027832, 1, 1, 1, 1, 1,
-1.414943, -1.120724, -4.025665, 1, 1, 1, 1, 1,
-1.405236, 1.212369, 0.8056782, 1, 1, 1, 1, 1,
-1.405016, 0.2867029, -0.4579533, 1, 1, 1, 1, 1,
-1.403331, 0.787118, -1.581615, 1, 1, 1, 1, 1,
-1.387058, -0.2383345, -2.681143, 0, 0, 1, 1, 1,
-1.386543, 0.2474798, -1.279242, 1, 0, 0, 1, 1,
-1.379323, -0.7839451, -2.281176, 1, 0, 0, 1, 1,
-1.376972, 1.515635, -0.3122939, 1, 0, 0, 1, 1,
-1.376603, 0.9824592, 0.2057623, 1, 0, 0, 1, 1,
-1.37205, -0.2104285, -1.662403, 1, 0, 0, 1, 1,
-1.358738, -0.05222674, -2.883239, 0, 0, 0, 1, 1,
-1.346932, -0.4186985, -2.507149, 0, 0, 0, 1, 1,
-1.337999, 1.352805, -0.8580036, 0, 0, 0, 1, 1,
-1.316202, -0.8432555, -0.9311137, 0, 0, 0, 1, 1,
-1.314666, 0.1361327, -1.965388, 0, 0, 0, 1, 1,
-1.306554, -0.1278711, -2.005867, 0, 0, 0, 1, 1,
-1.304747, -0.4153812, -2.370583, 0, 0, 0, 1, 1,
-1.304524, -0.2458503, 1.387983, 1, 1, 1, 1, 1,
-1.298753, 1.120197, -0.3800287, 1, 1, 1, 1, 1,
-1.297285, 0.1556785, -0.5587222, 1, 1, 1, 1, 1,
-1.295991, -0.9820209, -0.1079576, 1, 1, 1, 1, 1,
-1.293544, -0.1379352, -1.649901, 1, 1, 1, 1, 1,
-1.289687, 0.262431, -1.330581, 1, 1, 1, 1, 1,
-1.284602, -0.4722783, -0.4798319, 1, 1, 1, 1, 1,
-1.270771, -0.4430429, -1.35845, 1, 1, 1, 1, 1,
-1.269044, 0.7368309, -1.271541, 1, 1, 1, 1, 1,
-1.262327, 0.02232872, -1.870485, 1, 1, 1, 1, 1,
-1.25868, 0.007241413, -0.5328656, 1, 1, 1, 1, 1,
-1.245407, 0.8295857, -0.4883413, 1, 1, 1, 1, 1,
-1.242363, 1.375259, -1.725435, 1, 1, 1, 1, 1,
-1.241354, 1.395367, -0.4991145, 1, 1, 1, 1, 1,
-1.236333, 0.9540469, -1.153844, 1, 1, 1, 1, 1,
-1.233656, 1.448247, -1.298013, 0, 0, 1, 1, 1,
-1.233135, 1.478854, -2.025944, 1, 0, 0, 1, 1,
-1.230064, 0.4152588, -0.3971811, 1, 0, 0, 1, 1,
-1.228316, -1.562197, -2.136079, 1, 0, 0, 1, 1,
-1.223289, -1.472185, -1.734853, 1, 0, 0, 1, 1,
-1.22009, -1.223976, -2.641407, 1, 0, 0, 1, 1,
-1.218186, 0.2362068, -1.818847, 0, 0, 0, 1, 1,
-1.209405, 0.03394356, -0.1781493, 0, 0, 0, 1, 1,
-1.20936, 1.114431, -0.6414978, 0, 0, 0, 1, 1,
-1.209233, -1.277867, -0.7208709, 0, 0, 0, 1, 1,
-1.204169, 0.4117159, -1.403943, 0, 0, 0, 1, 1,
-1.198849, 0.2032413, -2.152833, 0, 0, 0, 1, 1,
-1.197102, -1.94436, -2.83804, 0, 0, 0, 1, 1,
-1.195651, 0.5330077, -1.979037, 1, 1, 1, 1, 1,
-1.180404, -0.8298646, -0.8852011, 1, 1, 1, 1, 1,
-1.175292, 0.5293014, -0.569281, 1, 1, 1, 1, 1,
-1.148475, 1.666774, -0.1956943, 1, 1, 1, 1, 1,
-1.14156, 0.950859, -1.08367, 1, 1, 1, 1, 1,
-1.139852, 2.787772, 0.04839436, 1, 1, 1, 1, 1,
-1.134083, -0.06623655, 0.06113822, 1, 1, 1, 1, 1,
-1.131761, -0.4561611, -2.423432, 1, 1, 1, 1, 1,
-1.107824, 2.697047, -0.02719929, 1, 1, 1, 1, 1,
-1.105127, -0.8103444, -2.912178, 1, 1, 1, 1, 1,
-1.096095, -0.9671662, -0.8412979, 1, 1, 1, 1, 1,
-1.093824, -1.266835, -2.3577, 1, 1, 1, 1, 1,
-1.092388, -0.3276413, -3.344968, 1, 1, 1, 1, 1,
-1.089105, -1.359168, -3.389257, 1, 1, 1, 1, 1,
-1.084967, 1.308213, -0.1079023, 1, 1, 1, 1, 1,
-1.083006, -2.310984, -1.179273, 0, 0, 1, 1, 1,
-1.072345, -0.1883279, -1.449865, 1, 0, 0, 1, 1,
-1.07222, -0.4178545, -0.9235201, 1, 0, 0, 1, 1,
-1.067067, -0.585482, -1.474634, 1, 0, 0, 1, 1,
-1.066979, -0.8306456, -2.846217, 1, 0, 0, 1, 1,
-1.06327, 0.5507312, -1.970437, 1, 0, 0, 1, 1,
-1.050441, -2.14117, -3.633845, 0, 0, 0, 1, 1,
-1.048526, -0.3098762, -1.22438, 0, 0, 0, 1, 1,
-1.039262, 1.895387, -0.296862, 0, 0, 0, 1, 1,
-1.037019, 0.3340896, -0.5344435, 0, 0, 0, 1, 1,
-1.036114, -0.656094, -3.965569, 0, 0, 0, 1, 1,
-1.028687, 0.5580071, -2.158621, 0, 0, 0, 1, 1,
-1.028041, 1.816453, -1.163004, 0, 0, 0, 1, 1,
-1.026096, 0.5635933, -1.485211, 1, 1, 1, 1, 1,
-1.021897, 1.469952, -2.30972, 1, 1, 1, 1, 1,
-1.017559, -0.7391879, -1.494085, 1, 1, 1, 1, 1,
-1.016134, -1.282794, -2.72764, 1, 1, 1, 1, 1,
-1.009984, 0.2358106, -0.8022878, 1, 1, 1, 1, 1,
-1.00552, -0.9112067, -2.292962, 1, 1, 1, 1, 1,
-1.004087, 0.000975923, -0.9495741, 1, 1, 1, 1, 1,
-1.002729, -1.688267, -2.637842, 1, 1, 1, 1, 1,
-0.9816539, 0.3252621, -1.535719, 1, 1, 1, 1, 1,
-0.9809432, 1.164432, 0.3728204, 1, 1, 1, 1, 1,
-0.978211, -1.1421, -4.486501, 1, 1, 1, 1, 1,
-0.9746047, -0.9529172, -1.736161, 1, 1, 1, 1, 1,
-0.9740509, 1.405529, 1.045751, 1, 1, 1, 1, 1,
-0.9736555, 0.2682, -1.127027, 1, 1, 1, 1, 1,
-0.97122, -0.1207491, -0.3296522, 1, 1, 1, 1, 1,
-0.9701901, -0.8721739, -1.633029, 0, 0, 1, 1, 1,
-0.9685646, -0.1324644, -2.903444, 1, 0, 0, 1, 1,
-0.9668986, 0.1808829, -1.315348, 1, 0, 0, 1, 1,
-0.9665454, 0.3536579, -1.813956, 1, 0, 0, 1, 1,
-0.9632865, 0.06961799, -1.283821, 1, 0, 0, 1, 1,
-0.9624463, -0.1711495, -3.070505, 1, 0, 0, 1, 1,
-0.9571166, -1.116077, -0.4093378, 0, 0, 0, 1, 1,
-0.9506821, -0.2827466, -0.3219245, 0, 0, 0, 1, 1,
-0.9506156, -0.7688581, -2.039187, 0, 0, 0, 1, 1,
-0.9447906, -0.4245726, -2.130999, 0, 0, 0, 1, 1,
-0.943402, 0.5741553, -0.6212493, 0, 0, 0, 1, 1,
-0.9430568, -2.650256, -1.726673, 0, 0, 0, 1, 1,
-0.9403547, 0.8013988, -1.930918, 0, 0, 0, 1, 1,
-0.9396839, -0.3905847, -1.479533, 1, 1, 1, 1, 1,
-0.9371617, -0.2583496, 0.4846263, 1, 1, 1, 1, 1,
-0.9337804, -0.3589285, -2.747641, 1, 1, 1, 1, 1,
-0.9206821, 0.9928719, -1.894693, 1, 1, 1, 1, 1,
-0.9171831, -0.743953, -1.359586, 1, 1, 1, 1, 1,
-0.9166051, 0.4759931, -1.029889, 1, 1, 1, 1, 1,
-0.9165627, 0.2046774, -2.299197, 1, 1, 1, 1, 1,
-0.9132919, 0.08596545, -1.017253, 1, 1, 1, 1, 1,
-0.912526, 0.7028489, -1.646099, 1, 1, 1, 1, 1,
-0.9026197, 2.850144, 0.9556146, 1, 1, 1, 1, 1,
-0.8909713, 0.5571906, -2.743095, 1, 1, 1, 1, 1,
-0.8872893, -0.2881996, -1.759751, 1, 1, 1, 1, 1,
-0.8827667, 0.5093054, 0.2575479, 1, 1, 1, 1, 1,
-0.8800192, 0.5458695, -1.119427, 1, 1, 1, 1, 1,
-0.8789526, 0.1419336, -2.400672, 1, 1, 1, 1, 1,
-0.8738016, -0.03983941, -1.320633, 0, 0, 1, 1, 1,
-0.8687553, 0.5824266, -3.125361, 1, 0, 0, 1, 1,
-0.8604407, 0.6683009, -3.814342, 1, 0, 0, 1, 1,
-0.8576861, 2.102775, -0.3854242, 1, 0, 0, 1, 1,
-0.8571249, -0.4786851, -2.111422, 1, 0, 0, 1, 1,
-0.8555146, -2.414073, -2.951606, 1, 0, 0, 1, 1,
-0.8548215, -2.335912, -4.550998, 0, 0, 0, 1, 1,
-0.8520519, 0.01175324, -2.111807, 0, 0, 0, 1, 1,
-0.844556, -0.06722058, -1.305054, 0, 0, 0, 1, 1,
-0.8405687, -0.3394814, -1.650708, 0, 0, 0, 1, 1,
-0.8365501, -0.3138995, -0.8087797, 0, 0, 0, 1, 1,
-0.8281358, 0.05774714, -0.8652723, 0, 0, 0, 1, 1,
-0.8240667, -2.037834, -3.47024, 0, 0, 0, 1, 1,
-0.8147838, -0.800161, -2.34473, 1, 1, 1, 1, 1,
-0.8135723, 0.04854287, -1.176603, 1, 1, 1, 1, 1,
-0.8105873, -0.6927625, -2.280398, 1, 1, 1, 1, 1,
-0.8086951, 0.9512751, -0.3481767, 1, 1, 1, 1, 1,
-0.8068363, -0.4544251, -1.323953, 1, 1, 1, 1, 1,
-0.8067815, -0.458913, -3.707528, 1, 1, 1, 1, 1,
-0.7942983, -1.624783, -4.039571, 1, 1, 1, 1, 1,
-0.7918503, 1.098136, -0.1999651, 1, 1, 1, 1, 1,
-0.7814422, 1.692475, -1.882884, 1, 1, 1, 1, 1,
-0.7805668, -1.785913, -3.918378, 1, 1, 1, 1, 1,
-0.7777998, -0.06538451, -0.1633281, 1, 1, 1, 1, 1,
-0.7762316, 0.6726225, -0.2762617, 1, 1, 1, 1, 1,
-0.7750166, 0.6403923, -1.132145, 1, 1, 1, 1, 1,
-0.7745138, 0.4065136, -2.024374, 1, 1, 1, 1, 1,
-0.7727582, -0.4061534, -3.265494, 1, 1, 1, 1, 1,
-0.7722945, 0.2581209, -3.738237, 0, 0, 1, 1, 1,
-0.7661473, -0.9186406, -2.389934, 1, 0, 0, 1, 1,
-0.7619771, -0.2013731, -1.611534, 1, 0, 0, 1, 1,
-0.7558618, -0.5994952, -1.799622, 1, 0, 0, 1, 1,
-0.7437953, -0.1772066, -1.636822, 1, 0, 0, 1, 1,
-0.7384395, -0.191069, -0.6791455, 1, 0, 0, 1, 1,
-0.7365375, -0.1507483, -1.247436, 0, 0, 0, 1, 1,
-0.7343785, -0.1296369, -3.322673, 0, 0, 0, 1, 1,
-0.7334101, -0.103472, -1.46586, 0, 0, 0, 1, 1,
-0.7304775, 0.572439, -2.432527, 0, 0, 0, 1, 1,
-0.7280768, 0.1795052, -0.804592, 0, 0, 0, 1, 1,
-0.7223049, 1.815816, -0.5565181, 0, 0, 0, 1, 1,
-0.7207651, -0.5629392, -2.447459, 0, 0, 0, 1, 1,
-0.7118793, 0.3275436, -0.765879, 1, 1, 1, 1, 1,
-0.7109317, 0.9502431, -1.367255, 1, 1, 1, 1, 1,
-0.708633, -0.02485232, -1.323533, 1, 1, 1, 1, 1,
-0.7068744, -1.009195, -4.230558, 1, 1, 1, 1, 1,
-0.7065139, 0.1277277, -1.066852, 1, 1, 1, 1, 1,
-0.7012006, -0.4664924, -1.279259, 1, 1, 1, 1, 1,
-0.6975886, -0.6876408, -2.428061, 1, 1, 1, 1, 1,
-0.6941971, 0.3066564, -0.6194428, 1, 1, 1, 1, 1,
-0.6910174, 0.177156, -1.740932, 1, 1, 1, 1, 1,
-0.6764998, -0.5283267, -2.17983, 1, 1, 1, 1, 1,
-0.673979, 0.4299459, 0.4418229, 1, 1, 1, 1, 1,
-0.6651072, 0.2263069, -0.743606, 1, 1, 1, 1, 1,
-0.6627702, -1.46153, -1.785263, 1, 1, 1, 1, 1,
-0.6550588, -0.6366947, -2.011693, 1, 1, 1, 1, 1,
-0.654761, -0.7464697, -2.313087, 1, 1, 1, 1, 1,
-0.654015, -1.592257, -2.806701, 0, 0, 1, 1, 1,
-0.6509112, 1.160118, -1.989135, 1, 0, 0, 1, 1,
-0.6473781, -1.447045, -0.9102136, 1, 0, 0, 1, 1,
-0.6401142, 0.454098, -1.339514, 1, 0, 0, 1, 1,
-0.636176, -0.1250161, -0.962286, 1, 0, 0, 1, 1,
-0.6351977, 1.490631, -0.7459686, 1, 0, 0, 1, 1,
-0.631796, -0.4392158, -2.736765, 0, 0, 0, 1, 1,
-0.6281329, -1.71157, -3.873873, 0, 0, 0, 1, 1,
-0.6251835, -1.34792, -2.404823, 0, 0, 0, 1, 1,
-0.6247461, 1.050345, -1.071561, 0, 0, 0, 1, 1,
-0.6233842, -0.8949885, -4.560227, 0, 0, 0, 1, 1,
-0.6231661, 1.093484, 0.2659165, 0, 0, 0, 1, 1,
-0.6181836, 0.7984145, -3.475786, 0, 0, 0, 1, 1,
-0.616825, 0.215847, -0.6590982, 1, 1, 1, 1, 1,
-0.6162098, 0.0613953, -0.4553607, 1, 1, 1, 1, 1,
-0.6066772, 0.2627948, -1.28832, 1, 1, 1, 1, 1,
-0.6048421, 0.6367266, 0.3079478, 1, 1, 1, 1, 1,
-0.6043485, 1.273489, -1.461659, 1, 1, 1, 1, 1,
-0.6012213, 0.1605098, -1.113429, 1, 1, 1, 1, 1,
-0.5982541, -2.682861, -0.8089719, 1, 1, 1, 1, 1,
-0.5970589, -0.4890494, -1.360323, 1, 1, 1, 1, 1,
-0.5954276, -0.5652511, -3.718906, 1, 1, 1, 1, 1,
-0.5891719, -0.5741776, -2.599694, 1, 1, 1, 1, 1,
-0.5834986, -1.473196, -2.355661, 1, 1, 1, 1, 1,
-0.582262, -0.8468289, -2.707474, 1, 1, 1, 1, 1,
-0.5729979, 0.319654, -2.164266, 1, 1, 1, 1, 1,
-0.5700585, 0.6243276, -0.4485872, 1, 1, 1, 1, 1,
-0.5655873, -1.068694, -1.050299, 1, 1, 1, 1, 1,
-0.5637711, -1.121686, -3.60051, 0, 0, 1, 1, 1,
-0.5615171, -0.1624396, -1.431383, 1, 0, 0, 1, 1,
-0.5590152, -0.531531, -2.375573, 1, 0, 0, 1, 1,
-0.5551501, 2.155147, -0.9023103, 1, 0, 0, 1, 1,
-0.5517362, -0.2524873, -0.5842888, 1, 0, 0, 1, 1,
-0.5483697, 0.1455655, -1.192781, 1, 0, 0, 1, 1,
-0.5439457, -0.9307382, -2.0771, 0, 0, 0, 1, 1,
-0.5425472, 0.8274387, -0.01396535, 0, 0, 0, 1, 1,
-0.5394369, 1.45295, 0.2478075, 0, 0, 0, 1, 1,
-0.5387684, 0.3494506, -0.4970076, 0, 0, 0, 1, 1,
-0.5376098, 0.7626377, -0.646628, 0, 0, 0, 1, 1,
-0.5374805, 0.2965421, -1.16149, 0, 0, 0, 1, 1,
-0.5372891, -0.3528112, -1.239515, 0, 0, 0, 1, 1,
-0.5370824, -0.2991027, -4.181158, 1, 1, 1, 1, 1,
-0.5342464, 0.2618231, -1.035186, 1, 1, 1, 1, 1,
-0.5270509, 0.05697874, 0.1023006, 1, 1, 1, 1, 1,
-0.5209528, 0.6998418, -1.600782, 1, 1, 1, 1, 1,
-0.5205142, -0.03773547, -0.761593, 1, 1, 1, 1, 1,
-0.5168379, 0.3297047, 0.7728637, 1, 1, 1, 1, 1,
-0.5143884, -0.5624568, -1.655163, 1, 1, 1, 1, 1,
-0.5111139, -0.384116, -3.271073, 1, 1, 1, 1, 1,
-0.5106792, -1.413992, -1.705141, 1, 1, 1, 1, 1,
-0.5105161, -1.619434, -2.717517, 1, 1, 1, 1, 1,
-0.5104223, 1.575027, -0.630155, 1, 1, 1, 1, 1,
-0.5046452, -0.1692554, -1.007273, 1, 1, 1, 1, 1,
-0.4991256, -1.418033, -2.540293, 1, 1, 1, 1, 1,
-0.4968153, 0.736088, 0.1027936, 1, 1, 1, 1, 1,
-0.4967872, 1.106237, 0.148899, 1, 1, 1, 1, 1,
-0.4950643, -0.6739474, -1.6007, 0, 0, 1, 1, 1,
-0.4839476, 0.8504553, 0.7687612, 1, 0, 0, 1, 1,
-0.4765842, 0.8945148, -0.6950326, 1, 0, 0, 1, 1,
-0.4740717, 0.9763124, -0.3822604, 1, 0, 0, 1, 1,
-0.4707193, 0.3169521, -0.1145571, 1, 0, 0, 1, 1,
-0.4703443, 2.079861, 0.6263371, 1, 0, 0, 1, 1,
-0.4681953, 0.1449116, -3.08317, 0, 0, 0, 1, 1,
-0.4673541, 0.1890639, -0.6059349, 0, 0, 0, 1, 1,
-0.4661443, 0.3996938, -0.6635215, 0, 0, 0, 1, 1,
-0.4634456, 1.04178, -0.7653605, 0, 0, 0, 1, 1,
-0.4624543, -0.557858, -2.435813, 0, 0, 0, 1, 1,
-0.4534591, 0.2279282, -1.108619, 0, 0, 0, 1, 1,
-0.4501697, -1.061214, -1.972467, 0, 0, 0, 1, 1,
-0.4460782, -0.07945106, -0.4785862, 1, 1, 1, 1, 1,
-0.4440567, -1.035315, -3.430713, 1, 1, 1, 1, 1,
-0.4406199, 0.07273704, -1.281708, 1, 1, 1, 1, 1,
-0.4397568, 0.9473926, -0.837397, 1, 1, 1, 1, 1,
-0.4373008, 0.4833944, 0.3087299, 1, 1, 1, 1, 1,
-0.4339947, -1.353055, -3.853132, 1, 1, 1, 1, 1,
-0.4336006, -1.060955, -2.020606, 1, 1, 1, 1, 1,
-0.4328082, 0.7205548, -1.889818, 1, 1, 1, 1, 1,
-0.4280001, 1.751198, 0.3072788, 1, 1, 1, 1, 1,
-0.4271313, -0.2926344, -3.120181, 1, 1, 1, 1, 1,
-0.4213114, -0.9305828, -2.772729, 1, 1, 1, 1, 1,
-0.4206541, 2.835927, -0.2152832, 1, 1, 1, 1, 1,
-0.4203599, -0.6898665, -2.688603, 1, 1, 1, 1, 1,
-0.4193293, 1.144892, -0.3858221, 1, 1, 1, 1, 1,
-0.4192138, -0.005484174, -0.397683, 1, 1, 1, 1, 1,
-0.4116054, -0.9470345, -0.9599816, 0, 0, 1, 1, 1,
-0.4095527, 0.2080946, -1.312461, 1, 0, 0, 1, 1,
-0.4021009, 1.108482, -2.296177, 1, 0, 0, 1, 1,
-0.4013023, -0.3853121, -1.363994, 1, 0, 0, 1, 1,
-0.392774, 1.036608, -1.348891, 1, 0, 0, 1, 1,
-0.3898338, -0.3116592, -2.504237, 1, 0, 0, 1, 1,
-0.3893666, 1.360407, -2.207602, 0, 0, 0, 1, 1,
-0.3882511, 1.289544, -1.313303, 0, 0, 0, 1, 1,
-0.3877564, -0.008936252, -1.181712, 0, 0, 0, 1, 1,
-0.3874249, 0.3688918, 0.2766891, 0, 0, 0, 1, 1,
-0.3806097, 0.6876741, 0.4999345, 0, 0, 0, 1, 1,
-0.3796707, -1.14964, -2.854019, 0, 0, 0, 1, 1,
-0.3760003, 0.9755498, -0.8138928, 0, 0, 0, 1, 1,
-0.3734527, 0.1577892, -1.794696, 1, 1, 1, 1, 1,
-0.3724595, 0.3380062, 0.6661154, 1, 1, 1, 1, 1,
-0.3721331, 0.2732568, -1.129126, 1, 1, 1, 1, 1,
-0.3661557, -0.2466467, -0.7796957, 1, 1, 1, 1, 1,
-0.3640412, -1.147795, -4.179895, 1, 1, 1, 1, 1,
-0.362485, 0.1200676, -0.3023274, 1, 1, 1, 1, 1,
-0.3619078, -0.07223079, -2.73962, 1, 1, 1, 1, 1,
-0.3602593, 1.22603, -1.131536, 1, 1, 1, 1, 1,
-0.3550345, -0.8620279, -2.978548, 1, 1, 1, 1, 1,
-0.3473414, -1.925084, -3.81707, 1, 1, 1, 1, 1,
-0.3431254, 0.5958821, 0.5836027, 1, 1, 1, 1, 1,
-0.3429521, -0.5116891, -2.579225, 1, 1, 1, 1, 1,
-0.3414708, -1.036556, -2.974823, 1, 1, 1, 1, 1,
-0.3393787, -1.907811, -2.813825, 1, 1, 1, 1, 1,
-0.3338464, 0.6556364, -0.5138622, 1, 1, 1, 1, 1,
-0.3323993, 0.5257387, -0.864934, 0, 0, 1, 1, 1,
-0.3319645, -0.1838576, -2.766923, 1, 0, 0, 1, 1,
-0.330704, 1.171518, 1.085776, 1, 0, 0, 1, 1,
-0.3303897, -0.6698055, -2.21102, 1, 0, 0, 1, 1,
-0.3299999, 0.6829821, -0.3335932, 1, 0, 0, 1, 1,
-0.329423, -0.1265542, -3.667985, 1, 0, 0, 1, 1,
-0.3269069, -0.2431067, -0.9031393, 0, 0, 0, 1, 1,
-0.3222143, -2.096235, -2.908053, 0, 0, 0, 1, 1,
-0.3211356, 1.504812, 1.57389, 0, 0, 0, 1, 1,
-0.3198883, 0.01301494, -1.427942, 0, 0, 0, 1, 1,
-0.3169228, 0.2099822, -0.4688828, 0, 0, 0, 1, 1,
-0.3106872, 0.7069053, -1.069533, 0, 0, 0, 1, 1,
-0.3053267, -1.211508, -1.640605, 0, 0, 0, 1, 1,
-0.3018272, 1.66667, -0.4476035, 1, 1, 1, 1, 1,
-0.3004813, -0.08355723, -1.651394, 1, 1, 1, 1, 1,
-0.3004593, 0.4100533, -2.523265, 1, 1, 1, 1, 1,
-0.2975911, 1.38663, 0.1788396, 1, 1, 1, 1, 1,
-0.2975757, 0.2879028, -1.178473, 1, 1, 1, 1, 1,
-0.2956538, 1.082484, -0.3141803, 1, 1, 1, 1, 1,
-0.2909007, 0.3049491, 0.363492, 1, 1, 1, 1, 1,
-0.2852361, -0.6302696, -3.513475, 1, 1, 1, 1, 1,
-0.2828198, -0.7005485, -3.250344, 1, 1, 1, 1, 1,
-0.280332, -0.2852371, -2.25409, 1, 1, 1, 1, 1,
-0.2802358, -0.5392584, -1.302885, 1, 1, 1, 1, 1,
-0.2797371, 1.341827, -0.9814371, 1, 1, 1, 1, 1,
-0.2771501, 0.1851787, -1.184349, 1, 1, 1, 1, 1,
-0.2735311, -0.1042508, -2.743026, 1, 1, 1, 1, 1,
-0.2728456, 0.2926606, 0.1852793, 1, 1, 1, 1, 1,
-0.2692777, 1.36349, 0.5013925, 0, 0, 1, 1, 1,
-0.2684502, 1.086435, 0.4296971, 1, 0, 0, 1, 1,
-0.2673627, 1.160986, -0.220424, 1, 0, 0, 1, 1,
-0.2625835, 0.5112187, 0.6834137, 1, 0, 0, 1, 1,
-0.2624315, 0.4338251, -0.6821488, 1, 0, 0, 1, 1,
-0.2572784, -0.06530114, -2.400996, 1, 0, 0, 1, 1,
-0.2556888, -1.623909, -4.122052, 0, 0, 0, 1, 1,
-0.2491363, 1.93252, -0.7164664, 0, 0, 0, 1, 1,
-0.2490745, 0.5924667, -0.2727702, 0, 0, 0, 1, 1,
-0.247384, 1.769213, 0.6976784, 0, 0, 0, 1, 1,
-0.2472484, 0.1322886, -2.398247, 0, 0, 0, 1, 1,
-0.246206, -0.4383535, -0.8425797, 0, 0, 0, 1, 1,
-0.2450808, -0.1723251, -0.707258, 0, 0, 0, 1, 1,
-0.244484, -0.9232644, -2.126237, 1, 1, 1, 1, 1,
-0.2430538, -1.266297, -1.826958, 1, 1, 1, 1, 1,
-0.2421614, -1.574789, -3.717266, 1, 1, 1, 1, 1,
-0.2395673, 0.1681165, -1.676175, 1, 1, 1, 1, 1,
-0.2393614, -0.3031551, -3.078472, 1, 1, 1, 1, 1,
-0.2352411, 0.7930725, 1.517665, 1, 1, 1, 1, 1,
-0.2327993, -1.589377, -3.329657, 1, 1, 1, 1, 1,
-0.2326186, 1.285246, 1.258805, 1, 1, 1, 1, 1,
-0.2305872, 0.01792883, -1.217636, 1, 1, 1, 1, 1,
-0.2282551, 1.320981, -0.3934073, 1, 1, 1, 1, 1,
-0.2282258, -1.584701, -3.460602, 1, 1, 1, 1, 1,
-0.2253465, 1.906142, 1.419527, 1, 1, 1, 1, 1,
-0.2212751, -1.481459, -4.111132, 1, 1, 1, 1, 1,
-0.220874, 0.04249298, -1.501023, 1, 1, 1, 1, 1,
-0.2205508, -0.1414, -2.482309, 1, 1, 1, 1, 1,
-0.2190175, 1.857587, 0.7173631, 0, 0, 1, 1, 1,
-0.2119871, -1.017837, -3.547808, 1, 0, 0, 1, 1,
-0.2066514, 0.2130829, -1.508545, 1, 0, 0, 1, 1,
-0.2060962, -0.5487194, -1.871367, 1, 0, 0, 1, 1,
-0.2058442, 0.1917314, -0.6693531, 1, 0, 0, 1, 1,
-0.1986251, -2.717255, -3.419009, 1, 0, 0, 1, 1,
-0.1956183, 0.06688123, -0.6556196, 0, 0, 0, 1, 1,
-0.1954233, 0.4188757, -1.123815, 0, 0, 0, 1, 1,
-0.1945921, -2.116507, -2.21505, 0, 0, 0, 1, 1,
-0.1936472, 1.234627, 1.841172, 0, 0, 0, 1, 1,
-0.1884425, 0.08251873, -1.414417, 0, 0, 0, 1, 1,
-0.1791083, 2.002206, -1.344556, 0, 0, 0, 1, 1,
-0.1779275, -1.318468, -4.449374, 0, 0, 0, 1, 1,
-0.1727912, 1.548704, 1.820406, 1, 1, 1, 1, 1,
-0.1722783, -0.2118828, -2.675709, 1, 1, 1, 1, 1,
-0.1717364, 0.7403595, -0.8186113, 1, 1, 1, 1, 1,
-0.1686027, 0.265886, -0.02460828, 1, 1, 1, 1, 1,
-0.1645585, 0.7532656, -2.233554, 1, 1, 1, 1, 1,
-0.1606319, 1.831675, 0.02063051, 1, 1, 1, 1, 1,
-0.159808, 0.1750506, -0.7603424, 1, 1, 1, 1, 1,
-0.1566842, 0.362925, -0.5279347, 1, 1, 1, 1, 1,
-0.1546346, -0.2632835, -2.136173, 1, 1, 1, 1, 1,
-0.1499989, 1.128493, -1.293689, 1, 1, 1, 1, 1,
-0.1489517, 1.45375, -2.596667, 1, 1, 1, 1, 1,
-0.1488483, 0.5899122, -1.460094, 1, 1, 1, 1, 1,
-0.1453695, -0.02632629, -3.306336, 1, 1, 1, 1, 1,
-0.1425609, 1.300983, 1.30872, 1, 1, 1, 1, 1,
-0.1409608, -0.3780895, -3.848991, 1, 1, 1, 1, 1,
-0.1408712, -1.515621, -3.122787, 0, 0, 1, 1, 1,
-0.1376867, -0.3350473, -2.783557, 1, 0, 0, 1, 1,
-0.1363665, 0.5151791, 1.458438, 1, 0, 0, 1, 1,
-0.1353072, 0.4776032, -1.323228, 1, 0, 0, 1, 1,
-0.1342485, 0.1680769, 0.180196, 1, 0, 0, 1, 1,
-0.1328551, -0.9021379, -1.632348, 1, 0, 0, 1, 1,
-0.1318541, -2.339098, -2.082683, 0, 0, 0, 1, 1,
-0.1255483, 0.926459, 0.4771334, 0, 0, 0, 1, 1,
-0.1176252, 0.04514448, -1.307018, 0, 0, 0, 1, 1,
-0.1146903, -0.5572635, -3.444865, 0, 0, 0, 1, 1,
-0.1130842, 1.871562, -0.8036569, 0, 0, 0, 1, 1,
-0.1101771, 0.5455565, -0.9451255, 0, 0, 0, 1, 1,
-0.1100506, -1.091281, -3.200794, 0, 0, 0, 1, 1,
-0.1044388, -2.288297, -2.2589, 1, 1, 1, 1, 1,
-0.1028084, 1.177448, 0.9566751, 1, 1, 1, 1, 1,
-0.1025222, 0.8494913, 0.4072517, 1, 1, 1, 1, 1,
-0.09869149, 0.8475898, 0.02077264, 1, 1, 1, 1, 1,
-0.09644487, 0.1136384, -1.430718, 1, 1, 1, 1, 1,
-0.09497577, -0.8242794, -2.036021, 1, 1, 1, 1, 1,
-0.08843119, 0.4765717, -0.3243186, 1, 1, 1, 1, 1,
-0.08819768, -0.6709735, -2.970227, 1, 1, 1, 1, 1,
-0.08206185, -0.6885934, -3.637827, 1, 1, 1, 1, 1,
-0.07904557, -0.7955279, -2.372388, 1, 1, 1, 1, 1,
-0.07557183, -1.60156, -3.241134, 1, 1, 1, 1, 1,
-0.07279817, 0.08747321, -1.94354, 1, 1, 1, 1, 1,
-0.07235421, -0.5688541, -1.853454, 1, 1, 1, 1, 1,
-0.07229208, -1.008511, -2.018888, 1, 1, 1, 1, 1,
-0.07122726, 0.7698622, -0.451985, 1, 1, 1, 1, 1,
-0.07122236, -1.699383, -1.288781, 0, 0, 1, 1, 1,
-0.06645549, -0.4814079, -4.737336, 1, 0, 0, 1, 1,
-0.06530526, 0.2821759, 1.231216, 1, 0, 0, 1, 1,
-0.06521345, -0.8728604, -2.399166, 1, 0, 0, 1, 1,
-0.06392718, 0.3521917, 0.2076968, 1, 0, 0, 1, 1,
-0.06308086, -0.1847886, -1.794189, 1, 0, 0, 1, 1,
-0.05986243, -1.320269, -3.396585, 0, 0, 0, 1, 1,
-0.05779197, 1.680569, -1.169418, 0, 0, 0, 1, 1,
-0.05639574, -1.692441, -2.302333, 0, 0, 0, 1, 1,
-0.05190706, -0.02044197, -1.96977, 0, 0, 0, 1, 1,
-0.04624147, -1.53458, -4.640639, 0, 0, 0, 1, 1,
-0.04502928, -1.056856, -2.130573, 0, 0, 0, 1, 1,
-0.03161375, 1.757783, -0.3568458, 0, 0, 0, 1, 1,
-0.03085327, 0.7244903, 1.480529, 1, 1, 1, 1, 1,
-0.02910335, 0.9295518, -0.3271709, 1, 1, 1, 1, 1,
-0.02500699, -0.558214, -3.356123, 1, 1, 1, 1, 1,
-0.02490732, -0.4872553, -3.670491, 1, 1, 1, 1, 1,
-0.02361441, -1.226554, -4.961117, 1, 1, 1, 1, 1,
-0.02316182, 0.07839811, -0.406264, 1, 1, 1, 1, 1,
-0.01601976, -0.2484744, -5.459711, 1, 1, 1, 1, 1,
-0.01047082, -0.1567927, -5.326893, 1, 1, 1, 1, 1,
-0.007976202, 0.05061979, 1.031264, 1, 1, 1, 1, 1,
-0.005448135, -1.241416, -3.458637, 1, 1, 1, 1, 1,
-0.005320321, -1.525201, -3.624589, 1, 1, 1, 1, 1,
-0.002017958, -0.2999441, -3.787924, 1, 1, 1, 1, 1,
-0.001674506, -0.8200861, -3.326971, 1, 1, 1, 1, 1,
-0.001510998, 0.0427478, -0.5403115, 1, 1, 1, 1, 1,
-0.001308443, -1.400612, -3.332738, 1, 1, 1, 1, 1,
-0.0002438674, 1.222877, -0.4340602, 0, 0, 1, 1, 1,
0.0005105431, -1.016569, 4.133498, 1, 0, 0, 1, 1,
0.001319277, 0.4518709, 1.319305, 1, 0, 0, 1, 1,
0.003577205, -0.8143439, 1.88057, 1, 0, 0, 1, 1,
0.005768779, -0.7718642, 4.135711, 1, 0, 0, 1, 1,
0.006159248, 0.9993848, -0.8554723, 1, 0, 0, 1, 1,
0.009311351, 1.901712, -0.3430673, 0, 0, 0, 1, 1,
0.01044796, -1.640558, 5.405847, 0, 0, 0, 1, 1,
0.01146395, -1.248459, 3.771073, 0, 0, 0, 1, 1,
0.01527546, -1.017858, 2.90281, 0, 0, 0, 1, 1,
0.01747877, -0.2581388, 3.764745, 0, 0, 0, 1, 1,
0.02007638, -0.4876433, 5.210454, 0, 0, 0, 1, 1,
0.02832045, 0.7975733, 0.1734626, 0, 0, 0, 1, 1,
0.03317528, 1.690972, 1.149626, 1, 1, 1, 1, 1,
0.03707295, -0.7229057, 3.324553, 1, 1, 1, 1, 1,
0.03750573, 1.620759, 0.5566337, 1, 1, 1, 1, 1,
0.03954452, 0.9799734, 1.843847, 1, 1, 1, 1, 1,
0.04314616, -1.55575, 1.539764, 1, 1, 1, 1, 1,
0.04574183, 0.84961, -1.717614, 1, 1, 1, 1, 1,
0.04653506, -0.8701858, 2.279933, 1, 1, 1, 1, 1,
0.04743397, 0.8284906, 1.833217, 1, 1, 1, 1, 1,
0.05100398, -2.145769, 3.466161, 1, 1, 1, 1, 1,
0.05382545, 0.1222256, 0.1078378, 1, 1, 1, 1, 1,
0.05436451, 0.658606, 0.8357931, 1, 1, 1, 1, 1,
0.05841128, -0.2553113, 2.893285, 1, 1, 1, 1, 1,
0.06054293, 1.892955, -0.08746815, 1, 1, 1, 1, 1,
0.06176324, -0.7580092, 2.961795, 1, 1, 1, 1, 1,
0.06656403, -1.119165, 3.065136, 1, 1, 1, 1, 1,
0.07422983, 0.4609678, -0.4646401, 0, 0, 1, 1, 1,
0.07592171, -0.2418967, 1.743997, 1, 0, 0, 1, 1,
0.08353049, -0.4394506, 2.402589, 1, 0, 0, 1, 1,
0.08640079, 0.6166293, -0.4053585, 1, 0, 0, 1, 1,
0.08759905, -0.8664099, 1.339152, 1, 0, 0, 1, 1,
0.09093519, -0.3017242, 1.05677, 1, 0, 0, 1, 1,
0.09223805, 0.0993809, 0.9595249, 0, 0, 0, 1, 1,
0.100081, -0.4062644, 1.503941, 0, 0, 0, 1, 1,
0.1037362, 1.120064, 0.009405411, 0, 0, 0, 1, 1,
0.1058955, -0.123662, 1.76852, 0, 0, 0, 1, 1,
0.1079292, -0.5348531, 2.137658, 0, 0, 0, 1, 1,
0.1083656, 1.574471, 0.434634, 0, 0, 0, 1, 1,
0.1098911, -0.228031, 2.010211, 0, 0, 0, 1, 1,
0.1119841, -0.594157, 3.291322, 1, 1, 1, 1, 1,
0.1156131, -0.9825085, 3.251292, 1, 1, 1, 1, 1,
0.116581, -1.426075, 3.733392, 1, 1, 1, 1, 1,
0.117122, 0.4115129, 0.9913885, 1, 1, 1, 1, 1,
0.1184299, 0.01719921, 2.212493, 1, 1, 1, 1, 1,
0.1206577, -1.274119, 2.523801, 1, 1, 1, 1, 1,
0.1277744, 0.3146342, -1.020838, 1, 1, 1, 1, 1,
0.1287598, -1.09502, 2.094712, 1, 1, 1, 1, 1,
0.1292811, -0.2828275, 2.723426, 1, 1, 1, 1, 1,
0.1302542, -1.103777, 2.13235, 1, 1, 1, 1, 1,
0.1312045, 0.02472046, 0.7172222, 1, 1, 1, 1, 1,
0.1331706, 0.4756505, 0.6326045, 1, 1, 1, 1, 1,
0.1350175, -0.6879992, 2.44732, 1, 1, 1, 1, 1,
0.1361502, -0.6849912, 3.558353, 1, 1, 1, 1, 1,
0.1408251, -1.711115, 2.716143, 1, 1, 1, 1, 1,
0.1451777, -0.4053315, 1.576933, 0, 0, 1, 1, 1,
0.1535248, 0.1810587, 1.166458, 1, 0, 0, 1, 1,
0.1552433, 0.3859349, 1.555454, 1, 0, 0, 1, 1,
0.1561588, -0.4684154, 5.801298, 1, 0, 0, 1, 1,
0.1598568, 2.872454, -1.447175, 1, 0, 0, 1, 1,
0.1602694, -0.4385372, 2.406844, 1, 0, 0, 1, 1,
0.1611039, -0.02454041, -0.2641493, 0, 0, 0, 1, 1,
0.1650349, -0.3629504, 2.80608, 0, 0, 0, 1, 1,
0.1700661, -0.4147064, 1.05494, 0, 0, 0, 1, 1,
0.1702042, 0.09920602, -0.3383175, 0, 0, 0, 1, 1,
0.1741317, -0.416283, 2.248651, 0, 0, 0, 1, 1,
0.174433, 1.212986, 1.093879, 0, 0, 0, 1, 1,
0.1746452, -0.1615086, 1.724185, 0, 0, 0, 1, 1,
0.1787278, -0.6127616, 3.006181, 1, 1, 1, 1, 1,
0.1791741, -0.5083559, 2.155347, 1, 1, 1, 1, 1,
0.1812355, 0.7472443, -0.5842763, 1, 1, 1, 1, 1,
0.1937199, 1.160357, -1.330117, 1, 1, 1, 1, 1,
0.1945727, -1.414377, 4.90056, 1, 1, 1, 1, 1,
0.2017245, 0.6778825, -2.300885, 1, 1, 1, 1, 1,
0.2018716, -0.8560058, 1.661804, 1, 1, 1, 1, 1,
0.2051991, 0.2717789, -0.05683731, 1, 1, 1, 1, 1,
0.2057244, -0.5599816, 2.829705, 1, 1, 1, 1, 1,
0.2063849, -0.3244119, 1.749782, 1, 1, 1, 1, 1,
0.2068856, 0.5653588, 0.6067737, 1, 1, 1, 1, 1,
0.2217247, -1.284155, 5.410381, 1, 1, 1, 1, 1,
0.2246024, 1.147149, -1.695501, 1, 1, 1, 1, 1,
0.2311144, -0.2401524, 1.717559, 1, 1, 1, 1, 1,
0.2334977, -2.909123, 0.9544239, 1, 1, 1, 1, 1,
0.2385951, -0.3298192, 1.866509, 0, 0, 1, 1, 1,
0.2430082, -0.7798224, 2.582519, 1, 0, 0, 1, 1,
0.245144, 1.020373, 0.9027888, 1, 0, 0, 1, 1,
0.2483121, 0.5835823, 1.04898, 1, 0, 0, 1, 1,
0.2505555, -0.7602755, 2.803381, 1, 0, 0, 1, 1,
0.2521393, 0.05327077, 1.159398, 1, 0, 0, 1, 1,
0.2580296, -0.1098499, 1.36582, 0, 0, 0, 1, 1,
0.2584337, -0.5109736, 2.977845, 0, 0, 0, 1, 1,
0.2656675, 1.135903, -0.1786238, 0, 0, 0, 1, 1,
0.2723144, -1.26618, 0.1447199, 0, 0, 0, 1, 1,
0.2752533, 0.8151066, 1.732306, 0, 0, 0, 1, 1,
0.2761748, 2.60712, 0.8830214, 0, 0, 0, 1, 1,
0.2792776, -0.3171862, 2.372561, 0, 0, 0, 1, 1,
0.2840136, 1.01673, 1.416701, 1, 1, 1, 1, 1,
0.2847103, -1.287228, 2.783008, 1, 1, 1, 1, 1,
0.2850295, -0.4286655, 3.655075, 1, 1, 1, 1, 1,
0.2859477, -0.4854587, 3.904798, 1, 1, 1, 1, 1,
0.2933684, -0.625134, 4.003943, 1, 1, 1, 1, 1,
0.2933942, -0.5500495, 1.944819, 1, 1, 1, 1, 1,
0.2957671, 0.7978411, -1.483558, 1, 1, 1, 1, 1,
0.3018264, -1.951194, 3.873234, 1, 1, 1, 1, 1,
0.3041369, -2.142819, 3.118705, 1, 1, 1, 1, 1,
0.3067699, 0.4058458, 1.391501, 1, 1, 1, 1, 1,
0.3105607, 0.1892472, 1.878324, 1, 1, 1, 1, 1,
0.3120422, 1.603683, 1.768223, 1, 1, 1, 1, 1,
0.3155974, -0.2600975, 2.04953, 1, 1, 1, 1, 1,
0.31655, 1.247283, 0.5954152, 1, 1, 1, 1, 1,
0.3173512, -0.7768444, 3.201457, 1, 1, 1, 1, 1,
0.3178421, 0.8197241, 0.7269878, 0, 0, 1, 1, 1,
0.3188344, -1.702326, 2.619313, 1, 0, 0, 1, 1,
0.3202695, 1.076218, -0.7943144, 1, 0, 0, 1, 1,
0.3203315, 0.4390036, 1.302343, 1, 0, 0, 1, 1,
0.3227734, 1.264236, 1.072371, 1, 0, 0, 1, 1,
0.3244502, -0.2013503, 4.669314, 1, 0, 0, 1, 1,
0.3300714, -0.1211811, 1.886907, 0, 0, 0, 1, 1,
0.3313217, 0.4193977, 0.02788601, 0, 0, 0, 1, 1,
0.3355952, 0.3559074, -0.5958515, 0, 0, 0, 1, 1,
0.3371642, -1.764844, 2.175169, 0, 0, 0, 1, 1,
0.3389523, -1.755981, 3.098817, 0, 0, 0, 1, 1,
0.3424589, -1.945895, 2.798117, 0, 0, 0, 1, 1,
0.3441506, 0.6226637, -1.523137, 0, 0, 0, 1, 1,
0.3458765, 0.9594782, 1.337872, 1, 1, 1, 1, 1,
0.3460117, 0.8591397, 0.2058313, 1, 1, 1, 1, 1,
0.3471631, -0.3459281, 3.938112, 1, 1, 1, 1, 1,
0.3483758, 0.4650352, 0.1725568, 1, 1, 1, 1, 1,
0.3508746, -2.080237, 2.472551, 1, 1, 1, 1, 1,
0.3513566, -0.7560756, 2.871887, 1, 1, 1, 1, 1,
0.3532862, -1.08836, 2.689177, 1, 1, 1, 1, 1,
0.3538605, 1.04227, -0.3853537, 1, 1, 1, 1, 1,
0.3549605, -0.9355304, 4.034063, 1, 1, 1, 1, 1,
0.3564957, -0.2076833, 1.525641, 1, 1, 1, 1, 1,
0.3574916, -1.268086, 3.685345, 1, 1, 1, 1, 1,
0.3615935, -0.7967014, 3.139861, 1, 1, 1, 1, 1,
0.3694225, 0.9105883, 0.6942648, 1, 1, 1, 1, 1,
0.3702234, 0.8682922, 1.069924, 1, 1, 1, 1, 1,
0.3705302, 0.08248351, 2.223809, 1, 1, 1, 1, 1,
0.3753306, -1.209801, 1.283639, 0, 0, 1, 1, 1,
0.3798043, 0.6344229, -2.337859, 1, 0, 0, 1, 1,
0.3805675, 0.008493467, 2.021631, 1, 0, 0, 1, 1,
0.38302, 0.7708032, 0.6023633, 1, 0, 0, 1, 1,
0.3856356, 1.154095, -1.210607, 1, 0, 0, 1, 1,
0.3879695, -0.7340195, 3.489075, 1, 0, 0, 1, 1,
0.3907624, 0.2806306, -0.1649832, 0, 0, 0, 1, 1,
0.391167, -0.9781113, 2.920948, 0, 0, 0, 1, 1,
0.39546, 1.750112, 2.400363, 0, 0, 0, 1, 1,
0.3973955, -0.5121064, 3.985023, 0, 0, 0, 1, 1,
0.3994265, -1.957109, 2.146278, 0, 0, 0, 1, 1,
0.4009404, -0.1850909, 1.265781, 0, 0, 0, 1, 1,
0.4039, -0.7539064, 0.9149168, 0, 0, 0, 1, 1,
0.4053345, -0.587228, 0.9334735, 1, 1, 1, 1, 1,
0.4054172, 1.236253, -0.6741706, 1, 1, 1, 1, 1,
0.4107833, -0.6956361, 1.977245, 1, 1, 1, 1, 1,
0.4128498, -0.2294734, 1.043783, 1, 1, 1, 1, 1,
0.4128541, -0.4397744, 2.078278, 1, 1, 1, 1, 1,
0.4128952, -1.411245, 0.4085422, 1, 1, 1, 1, 1,
0.4147639, -1.11683, 2.948544, 1, 1, 1, 1, 1,
0.4207876, 1.539491, -0.4750648, 1, 1, 1, 1, 1,
0.4236144, 0.8152596, -1.049209, 1, 1, 1, 1, 1,
0.4239595, 1.702455, 2.492882, 1, 1, 1, 1, 1,
0.4245045, -0.9494033, 2.146426, 1, 1, 1, 1, 1,
0.4254502, 0.2336169, 1.253819, 1, 1, 1, 1, 1,
0.4284036, 0.6871991, 0.1390608, 1, 1, 1, 1, 1,
0.4340117, 0.2866839, 3.045795, 1, 1, 1, 1, 1,
0.4410412, 0.8663828, 1.11446, 1, 1, 1, 1, 1,
0.4423116, -0.006814351, -0.2691881, 0, 0, 1, 1, 1,
0.4423721, -0.7636337, 4.256772, 1, 0, 0, 1, 1,
0.4454702, -0.2627437, 1.982278, 1, 0, 0, 1, 1,
0.4536612, -1.003899, 1.604296, 1, 0, 0, 1, 1,
0.4578949, -0.4569409, 0.472076, 1, 0, 0, 1, 1,
0.4756107, 0.2448548, 1.317323, 1, 0, 0, 1, 1,
0.4762897, 0.173644, -0.912433, 0, 0, 0, 1, 1,
0.4805002, 1.166179, 1.027406, 0, 0, 0, 1, 1,
0.4805458, -0.4111255, 2.46252, 0, 0, 0, 1, 1,
0.4900789, -0.4954305, 1.902941, 0, 0, 0, 1, 1,
0.4902782, 0.6422247, 1.599944, 0, 0, 0, 1, 1,
0.4927745, 0.02028231, 1.946847, 0, 0, 0, 1, 1,
0.4937611, 2.176841, 1.165389, 0, 0, 0, 1, 1,
0.4991675, -0.02692241, 2.066685, 1, 1, 1, 1, 1,
0.4992503, 2.140025, 1.124289, 1, 1, 1, 1, 1,
0.499505, -0.3654842, 1.305858, 1, 1, 1, 1, 1,
0.5068403, -1.643579, 2.979094, 1, 1, 1, 1, 1,
0.5078173, -1.80322, 2.071317, 1, 1, 1, 1, 1,
0.5089054, 1.388096, 0.8227688, 1, 1, 1, 1, 1,
0.5108759, 0.4703374, -1.215162, 1, 1, 1, 1, 1,
0.5133645, 1.521203, 0.5873528, 1, 1, 1, 1, 1,
0.5187523, -2.747504, 2.781064, 1, 1, 1, 1, 1,
0.5199711, 1.271971, 0.09021182, 1, 1, 1, 1, 1,
0.5214488, 0.6917685, 0.7447889, 1, 1, 1, 1, 1,
0.5226758, 0.2766099, 0.7496707, 1, 1, 1, 1, 1,
0.5270544, 0.3840334, 1.506697, 1, 1, 1, 1, 1,
0.5271322, -0.04380811, 2.640894, 1, 1, 1, 1, 1,
0.5283741, 0.7408029, 0.04500458, 1, 1, 1, 1, 1,
0.5286319, 1.437504, 0.832709, 0, 0, 1, 1, 1,
0.5320978, -0.5903983, 1.43408, 1, 0, 0, 1, 1,
0.5367427, -0.9739546, 3.285571, 1, 0, 0, 1, 1,
0.5384426, -1.49767, 3.296386, 1, 0, 0, 1, 1,
0.5391667, -0.1366512, 1.890326, 1, 0, 0, 1, 1,
0.5415562, 2.647839, 0.2020734, 1, 0, 0, 1, 1,
0.5464434, 0.523096, -1.111785, 0, 0, 0, 1, 1,
0.5508914, 0.3397128, 0.7601814, 0, 0, 0, 1, 1,
0.5557686, -0.1347187, 1.898413, 0, 0, 0, 1, 1,
0.5604988, -0.5865339, 3.346837, 0, 0, 0, 1, 1,
0.5628027, 1.153163, 0.04944837, 0, 0, 0, 1, 1,
0.5679811, 0.1424219, 1.684935, 0, 0, 0, 1, 1,
0.5764289, -0.1125748, 0.9178147, 0, 0, 0, 1, 1,
0.5794999, 0.4767708, 0.1157642, 1, 1, 1, 1, 1,
0.5832084, -1.492355, 3.26063, 1, 1, 1, 1, 1,
0.5849329, 0.7253157, -0.3741204, 1, 1, 1, 1, 1,
0.590418, -0.6229301, 2.72669, 1, 1, 1, 1, 1,
0.5950066, -0.1141974, 0.2518347, 1, 1, 1, 1, 1,
0.5954427, -1.753992, 2.847822, 1, 1, 1, 1, 1,
0.5998219, 1.303666, 1.206606, 1, 1, 1, 1, 1,
0.6014731, -0.5059549, 1.630095, 1, 1, 1, 1, 1,
0.6036472, -0.8735919, 1.639012, 1, 1, 1, 1, 1,
0.6072547, 1.347127, -1.709977, 1, 1, 1, 1, 1,
0.6088365, -1.901649, 2.238554, 1, 1, 1, 1, 1,
0.6096925, -0.2366204, 1.776148, 1, 1, 1, 1, 1,
0.6133873, -0.4100843, 2.99177, 1, 1, 1, 1, 1,
0.6163782, 2.416714, -0.06754747, 1, 1, 1, 1, 1,
0.6207924, -1.996591, 1.800473, 1, 1, 1, 1, 1,
0.627846, -0.205871, 2.950678, 0, 0, 1, 1, 1,
0.6345969, 2.34108, -1.215101, 1, 0, 0, 1, 1,
0.6349062, -0.9923943, 1.966841, 1, 0, 0, 1, 1,
0.6353548, -0.1137766, 1.413991, 1, 0, 0, 1, 1,
0.6386171, 0.67763, 0.1869897, 1, 0, 0, 1, 1,
0.6388025, 0.145862, 2.598401, 1, 0, 0, 1, 1,
0.6414813, -1.202451, 3.85568, 0, 0, 0, 1, 1,
0.6461906, 0.005937654, 1.804336, 0, 0, 0, 1, 1,
0.6473102, -0.5195976, 2.504274, 0, 0, 0, 1, 1,
0.6503848, -2.730486, 2.671139, 0, 0, 0, 1, 1,
0.6513159, 0.9276536, 0.8022072, 0, 0, 0, 1, 1,
0.6534266, -0.6615041, 2.20871, 0, 0, 0, 1, 1,
0.6549006, 0.7778508, -0.07896004, 0, 0, 0, 1, 1,
0.6550667, 0.556154, 0.81099, 1, 1, 1, 1, 1,
0.6552796, 2.306776, 2.205215, 1, 1, 1, 1, 1,
0.6555976, -0.01375685, 0.2125923, 1, 1, 1, 1, 1,
0.6583882, 0.08233099, -0.9043815, 1, 1, 1, 1, 1,
0.6591474, -0.2227048, 1.973026, 1, 1, 1, 1, 1,
0.6620468, -1.006721, 4.280461, 1, 1, 1, 1, 1,
0.6666514, -0.4164061, 2.914955, 1, 1, 1, 1, 1,
0.6820624, -0.6769421, 2.245023, 1, 1, 1, 1, 1,
0.6841419, -0.2319651, 0.1947732, 1, 1, 1, 1, 1,
0.6846403, 0.7032273, 2.221511, 1, 1, 1, 1, 1,
0.6865674, -0.8954506, 2.193937, 1, 1, 1, 1, 1,
0.689872, 0.7099868, 1.176971, 1, 1, 1, 1, 1,
0.6913116, -2.087981, 4.236499, 1, 1, 1, 1, 1,
0.6930443, -1.208611, 3.793597, 1, 1, 1, 1, 1,
0.6983696, 0.7934649, 2.155257, 1, 1, 1, 1, 1,
0.7011847, 1.033757, 0.8949776, 0, 0, 1, 1, 1,
0.7047092, -0.7331291, 3.165188, 1, 0, 0, 1, 1,
0.7055769, 1.582951, -0.03772288, 1, 0, 0, 1, 1,
0.7127785, -1.313252, 2.578819, 1, 0, 0, 1, 1,
0.7145264, 1.197852, -0.5227839, 1, 0, 0, 1, 1,
0.7215901, -0.2518443, 1.836302, 1, 0, 0, 1, 1,
0.7220169, 1.822555, 1.498756, 0, 0, 0, 1, 1,
0.7291532, -1.210982, 2.969967, 0, 0, 0, 1, 1,
0.7303715, 1.009198, 0.1433383, 0, 0, 0, 1, 1,
0.7307197, 1.231387, 0.7494063, 0, 0, 0, 1, 1,
0.7309927, 0.8120241, 1.587547, 0, 0, 0, 1, 1,
0.7330006, 0.7342424, -0.5649976, 0, 0, 0, 1, 1,
0.7330521, -0.9913754, 2.946585, 0, 0, 0, 1, 1,
0.7332819, -1.926139, 1.603971, 1, 1, 1, 1, 1,
0.7336817, 0.6707041, 0.90368, 1, 1, 1, 1, 1,
0.7348393, -0.2037078, -0.7607154, 1, 1, 1, 1, 1,
0.734924, -0.2097341, 1.945259, 1, 1, 1, 1, 1,
0.7398313, -0.2272156, 1.828532, 1, 1, 1, 1, 1,
0.7489917, 0.5764655, 2.061839, 1, 1, 1, 1, 1,
0.7510213, -0.4550422, 2.829237, 1, 1, 1, 1, 1,
0.7531725, -0.9596319, 2.782619, 1, 1, 1, 1, 1,
0.7558843, 1.647294, -0.4788857, 1, 1, 1, 1, 1,
0.7587736, 1.084117, 0.7160596, 1, 1, 1, 1, 1,
0.7624157, 0.07145654, 1.012645, 1, 1, 1, 1, 1,
0.7649558, -1.05026, 2.595242, 1, 1, 1, 1, 1,
0.7676625, 0.3387566, 1.056828, 1, 1, 1, 1, 1,
0.7678229, -1.361767, 1.778715, 1, 1, 1, 1, 1,
0.7733555, -0.3148025, 3.272856, 1, 1, 1, 1, 1,
0.786137, -1.236123, 0.3793778, 0, 0, 1, 1, 1,
0.7881592, 0.5524451, 0.357818, 1, 0, 0, 1, 1,
0.7903217, -0.8778223, 2.251648, 1, 0, 0, 1, 1,
0.7925078, -0.6742609, 2.856632, 1, 0, 0, 1, 1,
0.7992835, 0.5689798, 1.839614, 1, 0, 0, 1, 1,
0.8011366, -1.294239, 3.123797, 1, 0, 0, 1, 1,
0.8028815, -1.361878, 2.416307, 0, 0, 0, 1, 1,
0.8204696, 0.4210521, 1.562247, 0, 0, 0, 1, 1,
0.8239018, 1.513785, 1.351472, 0, 0, 0, 1, 1,
0.8275635, 0.6254679, 1.158569, 0, 0, 0, 1, 1,
0.8333284, 1.186151, 1.927012, 0, 0, 0, 1, 1,
0.8344358, 0.1564349, 2.460447, 0, 0, 0, 1, 1,
0.8356993, 0.6104386, 1.583895, 0, 0, 0, 1, 1,
0.8395438, -1.215931, 2.235934, 1, 1, 1, 1, 1,
0.8397339, -0.1095576, 2.951254, 1, 1, 1, 1, 1,
0.8459425, -0.8170031, 2.323527, 1, 1, 1, 1, 1,
0.8493106, -2.525543, 1.42125, 1, 1, 1, 1, 1,
0.8531728, 0.01912138, 0.02387757, 1, 1, 1, 1, 1,
0.8560479, 0.9135157, 0.5028279, 1, 1, 1, 1, 1,
0.8599523, -1.063473, 3.448457, 1, 1, 1, 1, 1,
0.8601756, -0.7362655, 2.949229, 1, 1, 1, 1, 1,
0.8627357, -1.168752, 3.974161, 1, 1, 1, 1, 1,
0.8657869, -0.4061251, 1.863686, 1, 1, 1, 1, 1,
0.8688226, 0.3467057, 0.09691855, 1, 1, 1, 1, 1,
0.8914535, 0.8474606, -1.368879, 1, 1, 1, 1, 1,
0.8973473, -0.2489533, 2.183415, 1, 1, 1, 1, 1,
0.8974871, -1.559823, 2.758348, 1, 1, 1, 1, 1,
0.9012716, 2.011625, 1.5955, 1, 1, 1, 1, 1,
0.9022732, 0.5340214, 0.4190273, 0, 0, 1, 1, 1,
0.9032964, -0.685385, 3.144367, 1, 0, 0, 1, 1,
0.9068853, -0.9358366, 2.507539, 1, 0, 0, 1, 1,
0.9109607, -1.241065, 1.698294, 1, 0, 0, 1, 1,
0.917578, 1.75616, 0.01559425, 1, 0, 0, 1, 1,
0.9204583, -0.6200437, 0.0387477, 1, 0, 0, 1, 1,
0.9249119, -1.581715, 3.523234, 0, 0, 0, 1, 1,
0.9290572, -1.122589, 2.828873, 0, 0, 0, 1, 1,
0.9372154, 0.404303, 2.514746, 0, 0, 0, 1, 1,
0.9454458, 0.2441215, 1.018593, 0, 0, 0, 1, 1,
0.9479554, 0.06926368, -0.4955367, 0, 0, 0, 1, 1,
0.9633574, -0.9509536, 1.561039, 0, 0, 0, 1, 1,
0.9655918, -1.370222, 1.841643, 0, 0, 0, 1, 1,
0.9668789, -1.514751, 1.358725, 1, 1, 1, 1, 1,
0.9672915, 1.199416, -0.1356493, 1, 1, 1, 1, 1,
0.9915047, -1.336122, 3.727625, 1, 1, 1, 1, 1,
0.9952146, 0.699162, 1.795851, 1, 1, 1, 1, 1,
0.9963845, -1.783807, 2.774174, 1, 1, 1, 1, 1,
0.9978058, 0.2800357, 0.9342686, 1, 1, 1, 1, 1,
1.001639, 0.4123577, 1.197048, 1, 1, 1, 1, 1,
1.002302, -0.3908533, 2.424379, 1, 1, 1, 1, 1,
1.002366, -1.886971, 2.161177, 1, 1, 1, 1, 1,
1.003473, -0.06577317, 0.07400719, 1, 1, 1, 1, 1,
1.005077, -0.06061353, 1.213478, 1, 1, 1, 1, 1,
1.010067, 1.999645, -0.09080883, 1, 1, 1, 1, 1,
1.010585, -2.415866, 3.246732, 1, 1, 1, 1, 1,
1.011538, -0.09617714, 2.935966, 1, 1, 1, 1, 1,
1.014855, 0.2817518, 1.088025, 1, 1, 1, 1, 1,
1.015031, 1.994696, 0.8055303, 0, 0, 1, 1, 1,
1.016777, -1.02711, 2.40154, 1, 0, 0, 1, 1,
1.017172, 0.4787375, 1.742645, 1, 0, 0, 1, 1,
1.018057, -0.1437738, 0.9765884, 1, 0, 0, 1, 1,
1.027192, 0.3754487, 2.802627, 1, 0, 0, 1, 1,
1.037396, 0.2361444, 2.086731, 1, 0, 0, 1, 1,
1.037783, -1.163642, 3.2098, 0, 0, 0, 1, 1,
1.049105, 0.3543847, 1.671413, 0, 0, 0, 1, 1,
1.050089, -0.1682362, 1.50738, 0, 0, 0, 1, 1,
1.05035, 0.3587945, 2.075084, 0, 0, 0, 1, 1,
1.052191, -0.1358265, 1.616753, 0, 0, 0, 1, 1,
1.052883, 0.2471155, 0.4094841, 0, 0, 0, 1, 1,
1.055179, 0.8812227, 0.3689829, 0, 0, 0, 1, 1,
1.065955, 0.7627531, 2.344112, 1, 1, 1, 1, 1,
1.067426, 1.494103, 0.9903459, 1, 1, 1, 1, 1,
1.070428, 0.6354415, 4.187965, 1, 1, 1, 1, 1,
1.071913, -0.02122758, 1.678495, 1, 1, 1, 1, 1,
1.072987, -1.344928, 2.206033, 1, 1, 1, 1, 1,
1.107755, 1.201571, 0.8046306, 1, 1, 1, 1, 1,
1.116312, -0.9845285, 1.794003, 1, 1, 1, 1, 1,
1.117351, -1.091612, 1.256785, 1, 1, 1, 1, 1,
1.119562, 1.573908, 1.811662, 1, 1, 1, 1, 1,
1.13275, -0.7814965, 1.27998, 1, 1, 1, 1, 1,
1.13571, -0.440026, 1.535523, 1, 1, 1, 1, 1,
1.14076, -0.1199681, 0.8506981, 1, 1, 1, 1, 1,
1.143125, 1.44476, 0.8397698, 1, 1, 1, 1, 1,
1.14791, -2.285709, 2.766502, 1, 1, 1, 1, 1,
1.148791, -1.077797, 3.216377, 1, 1, 1, 1, 1,
1.158804, -0.9367474, 2.289283, 0, 0, 1, 1, 1,
1.161347, 0.2324807, 0.7852971, 1, 0, 0, 1, 1,
1.163711, -0.08330975, 0.722638, 1, 0, 0, 1, 1,
1.173396, -1.400171, 2.114579, 1, 0, 0, 1, 1,
1.176809, 1.002752, 0.682942, 1, 0, 0, 1, 1,
1.183604, -0.6113271, 0.2211047, 1, 0, 0, 1, 1,
1.190956, -0.1051123, 1.904414, 0, 0, 0, 1, 1,
1.197887, 0.9158302, 1.35543, 0, 0, 0, 1, 1,
1.198611, -0.1196721, 0.5577322, 0, 0, 0, 1, 1,
1.200349, 0.5103354, -0.3588519, 0, 0, 0, 1, 1,
1.211588, -0.06811944, 3.247589, 0, 0, 0, 1, 1,
1.219257, -1.098843, 2.316918, 0, 0, 0, 1, 1,
1.220083, 0.9760842, 2.896359, 0, 0, 0, 1, 1,
1.225444, -0.3087726, 1.795452, 1, 1, 1, 1, 1,
1.226585, -0.4151385, 2.408879, 1, 1, 1, 1, 1,
1.227626, -1.074956, 2.076487, 1, 1, 1, 1, 1,
1.232135, -1.335367, 3.468398, 1, 1, 1, 1, 1,
1.237499, 0.83482, 2.124046, 1, 1, 1, 1, 1,
1.242929, 1.069387, -0.05012044, 1, 1, 1, 1, 1,
1.245338, 0.294602, 0.7831473, 1, 1, 1, 1, 1,
1.252502, 0.173158, 0.02819645, 1, 1, 1, 1, 1,
1.26759, -0.1142471, 2.324626, 1, 1, 1, 1, 1,
1.272002, -1.078636, 0.8787777, 1, 1, 1, 1, 1,
1.281243, -1.146588, 1.129091, 1, 1, 1, 1, 1,
1.286235, 1.374305, 0.4821269, 1, 1, 1, 1, 1,
1.292119, 0.2636558, 0.8174816, 1, 1, 1, 1, 1,
1.292458, 0.01633969, 2.999495, 1, 1, 1, 1, 1,
1.294338, -1.240705, 2.766384, 1, 1, 1, 1, 1,
1.294358, -0.919082, 3.487941, 0, 0, 1, 1, 1,
1.295054, 0.4794477, 0.6774052, 1, 0, 0, 1, 1,
1.300731, -0.5221259, 2.166975, 1, 0, 0, 1, 1,
1.309092, -1.289874, 1.435633, 1, 0, 0, 1, 1,
1.313855, 0.9182126, 1.211272, 1, 0, 0, 1, 1,
1.322208, -2.093054, 3.18171, 1, 0, 0, 1, 1,
1.322664, 1.980032, 1.877361, 0, 0, 0, 1, 1,
1.328665, 0.1666654, 0.1570789, 0, 0, 0, 1, 1,
1.334437, -0.9764885, 2.272431, 0, 0, 0, 1, 1,
1.335237, 0.07385049, 1.48853, 0, 0, 0, 1, 1,
1.339062, 0.4100809, 0.2147087, 0, 0, 0, 1, 1,
1.341727, 0.3443451, 1.235436, 0, 0, 0, 1, 1,
1.343778, -0.1694487, 2.14335, 0, 0, 0, 1, 1,
1.347449, 0.5019717, 1.327898, 1, 1, 1, 1, 1,
1.34943, -1.007079, 2.639015, 1, 1, 1, 1, 1,
1.351117, 0.3756831, 1.628806, 1, 1, 1, 1, 1,
1.363002, -0.09804138, 2.339615, 1, 1, 1, 1, 1,
1.367996, -0.05039013, 3.461812, 1, 1, 1, 1, 1,
1.404246, 1.197071, 1.700933, 1, 1, 1, 1, 1,
1.407294, -0.156892, 1.194039, 1, 1, 1, 1, 1,
1.40878, 0.576546, 1.918416, 1, 1, 1, 1, 1,
1.430952, 0.4459033, -0.2243905, 1, 1, 1, 1, 1,
1.43439, -1.698626, 2.039574, 1, 1, 1, 1, 1,
1.453038, 0.3013443, 1.401404, 1, 1, 1, 1, 1,
1.455176, -1.401589, 0.8969095, 1, 1, 1, 1, 1,
1.472338, 1.592504, -0.735744, 1, 1, 1, 1, 1,
1.475598, -0.6573806, 2.692649, 1, 1, 1, 1, 1,
1.479789, -1.599114, 0.6461936, 1, 1, 1, 1, 1,
1.480064, -1.480538, 2.549264, 0, 0, 1, 1, 1,
1.480273, -1.884817, 2.384742, 1, 0, 0, 1, 1,
1.489869, 0.432256, 0.8053549, 1, 0, 0, 1, 1,
1.495126, -1.250605, 0.8608285, 1, 0, 0, 1, 1,
1.500167, 1.528832, 1.55898, 1, 0, 0, 1, 1,
1.503986, -0.09576762, 1.78098, 1, 0, 0, 1, 1,
1.505387, -0.7926719, 0.4461071, 0, 0, 0, 1, 1,
1.506573, 1.997865, 1.830918, 0, 0, 0, 1, 1,
1.509493, -0.4611407, 0.8133633, 0, 0, 0, 1, 1,
1.515733, 0.2816822, 1.591343, 0, 0, 0, 1, 1,
1.520092, -1.195197, 2.872952, 0, 0, 0, 1, 1,
1.524356, -0.6479732, 2.551717, 0, 0, 0, 1, 1,
1.537339, -0.07740415, 1.198694, 0, 0, 0, 1, 1,
1.539808, -2.883345, 1.377747, 1, 1, 1, 1, 1,
1.542357, -0.7109922, 2.814037, 1, 1, 1, 1, 1,
1.563763, -1.037544, 2.031494, 1, 1, 1, 1, 1,
1.571053, -2.662342, 1.401747, 1, 1, 1, 1, 1,
1.571299, 1.47146, -0.5164681, 1, 1, 1, 1, 1,
1.578776, 0.4620225, 0.09239714, 1, 1, 1, 1, 1,
1.583718, 1.408623, 2.021374, 1, 1, 1, 1, 1,
1.587093, 1.175032, 1.911416, 1, 1, 1, 1, 1,
1.588779, 0.4074078, 0.2195493, 1, 1, 1, 1, 1,
1.593963, -1.423508, 3.25134, 1, 1, 1, 1, 1,
1.612376, -2.314325, 1.573385, 1, 1, 1, 1, 1,
1.619269, -0.180186, 1.663699, 1, 1, 1, 1, 1,
1.621016, -0.833949, 1.499135, 1, 1, 1, 1, 1,
1.622831, 0.3484519, 0.666092, 1, 1, 1, 1, 1,
1.62669, 0.06090653, 1.293008, 1, 1, 1, 1, 1,
1.645906, 1.644827, -0.006442918, 0, 0, 1, 1, 1,
1.655267, -0.1081612, 2.008781, 1, 0, 0, 1, 1,
1.655931, 1.620869, -1.040461, 1, 0, 0, 1, 1,
1.693167, 1.076073, 0.2018639, 1, 0, 0, 1, 1,
1.696349, -0.05428776, 0.7903028, 1, 0, 0, 1, 1,
1.696363, -2.126344, 2.337353, 1, 0, 0, 1, 1,
1.725008, -0.4953032, 1.134744, 0, 0, 0, 1, 1,
1.72808, -1.022455, 1.12061, 0, 0, 0, 1, 1,
1.741083, -0.6017368, 3.652311, 0, 0, 0, 1, 1,
1.75387, 0.1813403, 0.888544, 0, 0, 0, 1, 1,
1.770867, 0.3297493, 1.467704, 0, 0, 0, 1, 1,
1.785176, 0.4840424, 1.733885, 0, 0, 0, 1, 1,
1.786653, 1.075601, 1.931554, 0, 0, 0, 1, 1,
1.794109, -1.483274, 2.605143, 1, 1, 1, 1, 1,
1.852499, -0.1671457, 2.038538, 1, 1, 1, 1, 1,
1.855032, -0.02031177, 2.382803, 1, 1, 1, 1, 1,
1.863625, 1.206306, 1.308968, 1, 1, 1, 1, 1,
1.868625, -1.169023, 2.511001, 1, 1, 1, 1, 1,
1.88103, -1.341911, 2.726865, 1, 1, 1, 1, 1,
1.883263, 0.9273943, 1.278344, 1, 1, 1, 1, 1,
1.887135, 0.2827466, 2.505756, 1, 1, 1, 1, 1,
1.899271, -1.455736, 2.598278, 1, 1, 1, 1, 1,
1.900323, 0.8009754, 0.8027034, 1, 1, 1, 1, 1,
1.909362, -0.7908379, 1.171718, 1, 1, 1, 1, 1,
1.912447, 0.6241543, 3.199187, 1, 1, 1, 1, 1,
1.963403, -1.018891, 1.714152, 1, 1, 1, 1, 1,
1.973396, -0.8047915, 3.3266, 1, 1, 1, 1, 1,
1.980695, -0.5296311, 1.358287, 1, 1, 1, 1, 1,
1.997216, 0.6333022, 0.8312543, 0, 0, 1, 1, 1,
2.006078, -2.466745, 3.143733, 1, 0, 0, 1, 1,
2.040359, 0.583141, 0.1389589, 1, 0, 0, 1, 1,
2.056312, -0.6887669, 3.493583, 1, 0, 0, 1, 1,
2.074075, -0.08024856, 0.7099224, 1, 0, 0, 1, 1,
2.075026, 2.442825, 2.296769, 1, 0, 0, 1, 1,
2.078789, 0.05610254, 1.033421, 0, 0, 0, 1, 1,
2.13583, -0.2029473, 1.452831, 0, 0, 0, 1, 1,
2.142216, -1.137231, 1.503417, 0, 0, 0, 1, 1,
2.20282, -0.2038446, 2.539461, 0, 0, 0, 1, 1,
2.256178, -1.312089, 2.399347, 0, 0, 0, 1, 1,
2.344661, 0.4303854, -0.144797, 0, 0, 0, 1, 1,
2.388358, -0.2222658, 1.891342, 0, 0, 0, 1, 1,
2.479144, 0.4889503, 3.431036, 1, 1, 1, 1, 1,
2.525918, -0.3657005, 1.553496, 1, 1, 1, 1, 1,
2.584412, -1.217732, 1.825145, 1, 1, 1, 1, 1,
2.665879, -0.9400669, 2.045179, 1, 1, 1, 1, 1,
2.712352, -0.4719466, 2.216204, 1, 1, 1, 1, 1,
2.773069, 2.684067, 0.5595351, 1, 1, 1, 1, 1,
2.80669, -0.443438, 2.437024, 1, 1, 1, 1, 1
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
var radius = 9.539496;
var distance = 33.50708;
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
mvMatrix.translate( 0.2065929, 0.01833451, -0.1707938 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50708);
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
