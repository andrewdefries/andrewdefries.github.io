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
-3.537483, -1.475035, -2.486722, 1, 0, 0, 1,
-3.444336, -0.08411615, -0.3096732, 1, 0.007843138, 0, 1,
-2.830502, -0.3977696, -1.554849, 1, 0.01176471, 0, 1,
-2.781563, 1.201332, -0.5733646, 1, 0.01960784, 0, 1,
-2.748881, 0.278796, -0.9802159, 1, 0.02352941, 0, 1,
-2.721484, -0.4779972, -0.3152319, 1, 0.03137255, 0, 1,
-2.539315, 1.693032, -1.503873, 1, 0.03529412, 0, 1,
-2.373206, 0.02864854, -1.964059, 1, 0.04313726, 0, 1,
-2.317307, -0.3044326, -1.480263, 1, 0.04705882, 0, 1,
-2.233464, -0.0755381, -1.404687, 1, 0.05490196, 0, 1,
-2.231187, 0.01653723, -0.5802138, 1, 0.05882353, 0, 1,
-2.187459, -0.6775607, -3.528998, 1, 0.06666667, 0, 1,
-2.17682, -0.2890788, -0.6932973, 1, 0.07058824, 0, 1,
-2.170636, 0.2425178, 0.5807911, 1, 0.07843138, 0, 1,
-2.14712, 0.2480985, -0.7446871, 1, 0.08235294, 0, 1,
-2.14621, -1.338476, -1.670257, 1, 0.09019608, 0, 1,
-2.144125, 0.5616453, -0.9368788, 1, 0.09411765, 0, 1,
-2.135734, 0.8458549, -2.618511, 1, 0.1019608, 0, 1,
-2.126642, 0.5470075, -2.791873, 1, 0.1098039, 0, 1,
-2.119418, 0.1402566, -0.4513146, 1, 0.1137255, 0, 1,
-2.067863, 1.993011, -0.7678924, 1, 0.1215686, 0, 1,
-2.065187, -1.725309, -1.688286, 1, 0.1254902, 0, 1,
-2.046548, -0.9706157, -3.24228, 1, 0.1333333, 0, 1,
-2.043337, 0.1359256, -2.980213, 1, 0.1372549, 0, 1,
-2.017839, 0.5503616, -2.89464, 1, 0.145098, 0, 1,
-2.016756, -1.374388, -2.072305, 1, 0.1490196, 0, 1,
-1.974102, 0.03351976, -1.280554, 1, 0.1568628, 0, 1,
-1.97246, -0.5238736, -2.478655, 1, 0.1607843, 0, 1,
-1.903294, -0.2906636, -3.930418, 1, 0.1686275, 0, 1,
-1.89571, -0.4204188, -1.70771, 1, 0.172549, 0, 1,
-1.884648, 0.7674952, -1.365915, 1, 0.1803922, 0, 1,
-1.860357, 0.1783225, -3.458152, 1, 0.1843137, 0, 1,
-1.839057, 0.8514557, -2.417521, 1, 0.1921569, 0, 1,
-1.826567, -0.2683805, -1.470206, 1, 0.1960784, 0, 1,
-1.819241, 1.149243, -0.8276615, 1, 0.2039216, 0, 1,
-1.814, -0.485522, -3.18437, 1, 0.2117647, 0, 1,
-1.813924, -1.809031, -1.436172, 1, 0.2156863, 0, 1,
-1.798526, 0.3739771, -1.184374, 1, 0.2235294, 0, 1,
-1.794384, 0.1478645, -1.701384, 1, 0.227451, 0, 1,
-1.790856, -2.585413, -1.166487, 1, 0.2352941, 0, 1,
-1.790532, -0.815252, -2.150184, 1, 0.2392157, 0, 1,
-1.785501, -0.06888007, -0.9986045, 1, 0.2470588, 0, 1,
-1.773813, -0.4349551, -3.8584, 1, 0.2509804, 0, 1,
-1.772853, 1.083403, 2.332953, 1, 0.2588235, 0, 1,
-1.759007, 0.4661489, -1.68298, 1, 0.2627451, 0, 1,
-1.756415, 0.6904162, -1.413567, 1, 0.2705882, 0, 1,
-1.752995, -1.050602, -3.024664, 1, 0.2745098, 0, 1,
-1.736682, 0.03964247, 0.1707983, 1, 0.282353, 0, 1,
-1.733046, -0.676903, -2.668967, 1, 0.2862745, 0, 1,
-1.723049, -1.370135, -1.827603, 1, 0.2941177, 0, 1,
-1.712935, 0.4652562, -0.4303546, 1, 0.3019608, 0, 1,
-1.705546, 0.4639297, -1.21743, 1, 0.3058824, 0, 1,
-1.704957, -0.01426456, -0.7334046, 1, 0.3137255, 0, 1,
-1.683382, 1.025959, -0.4645313, 1, 0.3176471, 0, 1,
-1.678085, -0.4236199, -2.211839, 1, 0.3254902, 0, 1,
-1.676221, -0.3342366, -2.42571, 1, 0.3294118, 0, 1,
-1.661991, -0.6184543, -2.216137, 1, 0.3372549, 0, 1,
-1.657319, -2.673024, -3.425894, 1, 0.3411765, 0, 1,
-1.642103, 0.08498222, 0.5011885, 1, 0.3490196, 0, 1,
-1.639992, -0.7492017, 0.319438, 1, 0.3529412, 0, 1,
-1.637997, 0.2658259, -1.147079, 1, 0.3607843, 0, 1,
-1.637788, 0.1539151, -2.325209, 1, 0.3647059, 0, 1,
-1.619569, -0.2685847, 0.8305272, 1, 0.372549, 0, 1,
-1.593988, -0.6364225, -1.221855, 1, 0.3764706, 0, 1,
-1.589661, -0.2943344, -1.342422, 1, 0.3843137, 0, 1,
-1.588437, 0.2485863, -1.888948, 1, 0.3882353, 0, 1,
-1.563475, -0.6140495, -1.618183, 1, 0.3960784, 0, 1,
-1.54609, 2.010762, -2.30797, 1, 0.4039216, 0, 1,
-1.53582, 0.8458579, 0.4227022, 1, 0.4078431, 0, 1,
-1.533571, -1.945767, -1.785903, 1, 0.4156863, 0, 1,
-1.517, -1.426234, -1.94836, 1, 0.4196078, 0, 1,
-1.508298, -1.760025, -2.614461, 1, 0.427451, 0, 1,
-1.489755, 0.002098993, -1.064898, 1, 0.4313726, 0, 1,
-1.486798, 0.7881469, -0.3590545, 1, 0.4392157, 0, 1,
-1.484646, -0.3704009, 0.4557503, 1, 0.4431373, 0, 1,
-1.484307, 0.2548241, -2.559528, 1, 0.4509804, 0, 1,
-1.480384, -0.8274967, -4.739141, 1, 0.454902, 0, 1,
-1.480363, 1.061685, -1.799186, 1, 0.4627451, 0, 1,
-1.474365, -1.145721, -1.654222, 1, 0.4666667, 0, 1,
-1.46956, 1.028398, -0.3983633, 1, 0.4745098, 0, 1,
-1.468353, -0.363279, -2.522224, 1, 0.4784314, 0, 1,
-1.467557, -0.5643766, -1.101159, 1, 0.4862745, 0, 1,
-1.458201, -0.5290779, -1.459939, 1, 0.4901961, 0, 1,
-1.452509, 0.938503, -2.189856, 1, 0.4980392, 0, 1,
-1.442694, -1.507829, -3.323147, 1, 0.5058824, 0, 1,
-1.406864, -0.4014919, -3.026382, 1, 0.509804, 0, 1,
-1.40285, -0.7792697, -0.531795, 1, 0.5176471, 0, 1,
-1.373873, -0.6890581, -1.989961, 1, 0.5215687, 0, 1,
-1.364142, -1.033538, -3.140311, 1, 0.5294118, 0, 1,
-1.363339, 0.4961892, -0.6365887, 1, 0.5333334, 0, 1,
-1.354775, -0.9266275, -2.66234, 1, 0.5411765, 0, 1,
-1.342166, -0.8748354, -2.671098, 1, 0.5450981, 0, 1,
-1.33512, -1.210604, -2.931657, 1, 0.5529412, 0, 1,
-1.334509, 0.8923258, -1.681372, 1, 0.5568628, 0, 1,
-1.334319, 0.6295111, -1.343498, 1, 0.5647059, 0, 1,
-1.319522, -1.919384, -1.67292, 1, 0.5686275, 0, 1,
-1.317131, 0.7200087, -1.086884, 1, 0.5764706, 0, 1,
-1.316845, -0.9164709, -1.974869, 1, 0.5803922, 0, 1,
-1.313552, 0.02631968, -2.485707, 1, 0.5882353, 0, 1,
-1.294363, 0.3009818, -3.038516, 1, 0.5921569, 0, 1,
-1.266809, -0.1657661, -0.9417968, 1, 0.6, 0, 1,
-1.251117, 0.1807449, -1.427089, 1, 0.6078432, 0, 1,
-1.245263, 1.304985, 1.535828, 1, 0.6117647, 0, 1,
-1.241825, 1.268166, -1.53896, 1, 0.6196079, 0, 1,
-1.239731, -0.074858, -2.260485, 1, 0.6235294, 0, 1,
-1.226858, 0.2291421, -1.617029, 1, 0.6313726, 0, 1,
-1.219017, 0.5247225, -0.4572168, 1, 0.6352941, 0, 1,
-1.211571, -0.8571527, -0.9793695, 1, 0.6431373, 0, 1,
-1.202264, -0.3215475, 0.08983988, 1, 0.6470588, 0, 1,
-1.195041, 0.2857709, -1.584696, 1, 0.654902, 0, 1,
-1.186543, -0.8166727, -1.656094, 1, 0.6588235, 0, 1,
-1.185567, 1.121953, -0.5325909, 1, 0.6666667, 0, 1,
-1.179659, -1.02381, -0.8737042, 1, 0.6705883, 0, 1,
-1.175989, -0.1308701, -1.823299, 1, 0.6784314, 0, 1,
-1.173114, -1.734835, -1.251672, 1, 0.682353, 0, 1,
-1.170434, -0.9168733, -4.066598, 1, 0.6901961, 0, 1,
-1.169974, 1.59852, -0.1316936, 1, 0.6941177, 0, 1,
-1.162147, -0.7843437, -1.849672, 1, 0.7019608, 0, 1,
-1.158174, 0.05145465, -1.919337, 1, 0.7098039, 0, 1,
-1.147787, 1.057908, -0.6347663, 1, 0.7137255, 0, 1,
-1.146484, -0.7095265, -2.168806, 1, 0.7215686, 0, 1,
-1.145371, -0.0237093, -1.461802, 1, 0.7254902, 0, 1,
-1.142512, 0.5131375, -2.472355, 1, 0.7333333, 0, 1,
-1.139471, 0.7974629, -0.8180772, 1, 0.7372549, 0, 1,
-1.132833, 0.4875385, -2.819524, 1, 0.7450981, 0, 1,
-1.129965, 0.1635313, -1.381536, 1, 0.7490196, 0, 1,
-1.126516, -2.500626, -2.534033, 1, 0.7568628, 0, 1,
-1.122172, -0.06708482, -0.729888, 1, 0.7607843, 0, 1,
-1.11583, -0.8656998, -2.31825, 1, 0.7686275, 0, 1,
-1.093834, 1.280726, -1.177438, 1, 0.772549, 0, 1,
-1.09207, -0.1846998, -2.296922, 1, 0.7803922, 0, 1,
-1.091733, 0.437257, -2.529174, 1, 0.7843137, 0, 1,
-1.090886, 0.3125669, -1.264613, 1, 0.7921569, 0, 1,
-1.090485, -0.5914949, -1.480464, 1, 0.7960784, 0, 1,
-1.083439, -1.259663, -2.417686, 1, 0.8039216, 0, 1,
-1.083384, -0.5980375, -1.601683, 1, 0.8117647, 0, 1,
-1.080793, 0.9842917, -0.3382092, 1, 0.8156863, 0, 1,
-1.07967, 0.3847021, -1.418753, 1, 0.8235294, 0, 1,
-1.077517, 0.6045634, -2.373254, 1, 0.827451, 0, 1,
-1.074985, 0.7038417, -1.292478, 1, 0.8352941, 0, 1,
-1.069782, -0.6417102, -2.987175, 1, 0.8392157, 0, 1,
-1.067359, -0.7559427, -2.062672, 1, 0.8470588, 0, 1,
-1.06313, 0.6581624, 0.07662119, 1, 0.8509804, 0, 1,
-1.063081, 1.626989, -0.4179102, 1, 0.8588235, 0, 1,
-1.05332, 1.174766, -1.238985, 1, 0.8627451, 0, 1,
-1.045558, -2.697073, -1.910565, 1, 0.8705882, 0, 1,
-1.042609, -0.3392915, -1.672816, 1, 0.8745098, 0, 1,
-1.021293, -1.060683, -2.313681, 1, 0.8823529, 0, 1,
-1.020834, -0.4644869, -1.430501, 1, 0.8862745, 0, 1,
-1.01798, -1.882014, -4.607544, 1, 0.8941177, 0, 1,
-1.016923, -0.04607958, -2.214069, 1, 0.8980392, 0, 1,
-1.016873, -0.7674494, -1.79351, 1, 0.9058824, 0, 1,
-1.016739, -2.015666, -3.075994, 1, 0.9137255, 0, 1,
-1.015063, -1.05091, -1.437782, 1, 0.9176471, 0, 1,
-1.012575, 0.1320862, -0.4762781, 1, 0.9254902, 0, 1,
-1.011242, -0.9949108, -1.595951, 1, 0.9294118, 0, 1,
-1.008995, 0.009644997, -0.7733878, 1, 0.9372549, 0, 1,
-1.007672, 1.134316, -1.459742, 1, 0.9411765, 0, 1,
-0.9997171, 0.2795331, -2.198293, 1, 0.9490196, 0, 1,
-0.9959833, 1.467426, -1.086426, 1, 0.9529412, 0, 1,
-0.9867455, -0.8301812, -1.900324, 1, 0.9607843, 0, 1,
-0.9799867, 0.9499878, 0.1380363, 1, 0.9647059, 0, 1,
-0.979681, 0.0168818, -0.47495, 1, 0.972549, 0, 1,
-0.9735013, 0.9515232, 0.4542445, 1, 0.9764706, 0, 1,
-0.9726507, -0.561231, -3.224036, 1, 0.9843137, 0, 1,
-0.971185, 0.4301855, -1.333704, 1, 0.9882353, 0, 1,
-0.9705775, -0.584008, -4.274679, 1, 0.9960784, 0, 1,
-0.9682438, 0.8890905, 0.7571498, 0.9960784, 1, 0, 1,
-0.9674155, -0.3766884, 0.1693671, 0.9921569, 1, 0, 1,
-0.9636468, -1.926406, -3.779005, 0.9843137, 1, 0, 1,
-0.95504, -0.5696436, -1.135027, 0.9803922, 1, 0, 1,
-0.9527675, -0.9140176, -1.701631, 0.972549, 1, 0, 1,
-0.950205, 0.4720131, -0.43343, 0.9686275, 1, 0, 1,
-0.9496906, 1.409841, 0.9501357, 0.9607843, 1, 0, 1,
-0.9476799, 3.343801, 0.6130083, 0.9568627, 1, 0, 1,
-0.9476406, 0.4259392, -0.4277492, 0.9490196, 1, 0, 1,
-0.9473561, 1.794867, -0.1256955, 0.945098, 1, 0, 1,
-0.9469051, 0.04855126, -1.825122, 0.9372549, 1, 0, 1,
-0.9462117, -0.06066944, -0.8689519, 0.9333333, 1, 0, 1,
-0.9434548, -0.4110229, -3.042565, 0.9254902, 1, 0, 1,
-0.9425662, 0.2875282, -1.412018, 0.9215686, 1, 0, 1,
-0.9320086, 1.667836, -0.8368874, 0.9137255, 1, 0, 1,
-0.9284151, 0.6080917, -0.3490034, 0.9098039, 1, 0, 1,
-0.9276883, 2.54912, 1.127153, 0.9019608, 1, 0, 1,
-0.9269037, 1.393502, -1.303996, 0.8941177, 1, 0, 1,
-0.9259441, 0.02852574, -1.463943, 0.8901961, 1, 0, 1,
-0.9163178, 1.882031, -2.119905, 0.8823529, 1, 0, 1,
-0.9153697, 0.9780775, -0.4717205, 0.8784314, 1, 0, 1,
-0.9113343, -1.066273, -2.990492, 0.8705882, 1, 0, 1,
-0.9077978, 0.7309107, -0.6397811, 0.8666667, 1, 0, 1,
-0.9046, -1.291813, -2.539576, 0.8588235, 1, 0, 1,
-0.9005782, -0.4386143, -1.685708, 0.854902, 1, 0, 1,
-0.8945253, 0.7527452, -0.717753, 0.8470588, 1, 0, 1,
-0.8897552, -0.4552284, -2.354926, 0.8431373, 1, 0, 1,
-0.879661, 0.03026913, -1.529626, 0.8352941, 1, 0, 1,
-0.8794798, -0.2760733, -1.747515, 0.8313726, 1, 0, 1,
-0.8793499, -0.864769, -1.456728, 0.8235294, 1, 0, 1,
-0.8645551, 1.005681, -1.638986, 0.8196079, 1, 0, 1,
-0.863401, 0.7836201, -1.561036, 0.8117647, 1, 0, 1,
-0.8593231, -1.731931, -4.815182, 0.8078431, 1, 0, 1,
-0.8568632, 0.6538978, -0.3667063, 0.8, 1, 0, 1,
-0.8549785, -0.2902347, -4.551964, 0.7921569, 1, 0, 1,
-0.8508761, 0.1790901, -1.552918, 0.7882353, 1, 0, 1,
-0.8497732, -0.2650472, -0.6281232, 0.7803922, 1, 0, 1,
-0.8370974, -0.7226121, -3.697994, 0.7764706, 1, 0, 1,
-0.836803, 1.879227, -0.8735067, 0.7686275, 1, 0, 1,
-0.8304971, -0.1162589, -0.4999226, 0.7647059, 1, 0, 1,
-0.8276656, -0.3284379, -1.04713, 0.7568628, 1, 0, 1,
-0.8246535, 0.8835267, 0.06814121, 0.7529412, 1, 0, 1,
-0.8245295, -1.867653, -3.937188, 0.7450981, 1, 0, 1,
-0.8120427, 0.2983046, -1.733313, 0.7411765, 1, 0, 1,
-0.8111537, -1.024515, -2.366011, 0.7333333, 1, 0, 1,
-0.806968, 0.4853921, -1.464039, 0.7294118, 1, 0, 1,
-0.8053641, -0.2565071, -1.817258, 0.7215686, 1, 0, 1,
-0.8012179, -0.4037401, -2.783708, 0.7176471, 1, 0, 1,
-0.7997127, -0.5141226, -2.558852, 0.7098039, 1, 0, 1,
-0.7990189, -0.7981018, -2.805081, 0.7058824, 1, 0, 1,
-0.7952216, 1.938177, -0.7493203, 0.6980392, 1, 0, 1,
-0.7915175, 0.3751857, -0.6804126, 0.6901961, 1, 0, 1,
-0.7870126, -0.4223586, -2.442347, 0.6862745, 1, 0, 1,
-0.7829815, -2.094784, -4.209391, 0.6784314, 1, 0, 1,
-0.780429, 0.1227872, -1.095146, 0.6745098, 1, 0, 1,
-0.7783016, -0.4705628, -1.082394, 0.6666667, 1, 0, 1,
-0.7777066, 1.048499, -0.5424179, 0.6627451, 1, 0, 1,
-0.774627, 0.8167158, -0.5095015, 0.654902, 1, 0, 1,
-0.7742246, 0.1937121, -2.821855, 0.6509804, 1, 0, 1,
-0.7711148, 0.327471, 0.0627469, 0.6431373, 1, 0, 1,
-0.7706141, -0.1477087, -1.375538, 0.6392157, 1, 0, 1,
-0.7704698, 0.6060805, -0.2122648, 0.6313726, 1, 0, 1,
-0.7696288, -2.222529, -2.273359, 0.627451, 1, 0, 1,
-0.7682933, -2.038639, -3.958529, 0.6196079, 1, 0, 1,
-0.7653978, 0.6833336, -1.878173, 0.6156863, 1, 0, 1,
-0.7599376, -0.2089841, -1.070004, 0.6078432, 1, 0, 1,
-0.7532844, -0.07962462, -2.280949, 0.6039216, 1, 0, 1,
-0.7484297, 1.457434, 0.1117784, 0.5960785, 1, 0, 1,
-0.7412115, -0.8767527, -2.421154, 0.5882353, 1, 0, 1,
-0.739893, -0.4675617, -3.837561, 0.5843138, 1, 0, 1,
-0.7350098, -1.587867, -2.227012, 0.5764706, 1, 0, 1,
-0.7305331, 0.8828097, -0.5678899, 0.572549, 1, 0, 1,
-0.7269902, -0.4774568, -1.916802, 0.5647059, 1, 0, 1,
-0.7239713, -1.426634, -2.760041, 0.5607843, 1, 0, 1,
-0.7218248, -2.198918, -3.240078, 0.5529412, 1, 0, 1,
-0.7209525, -0.6119148, -0.004101823, 0.5490196, 1, 0, 1,
-0.7154379, 0.8272666, -0.8690598, 0.5411765, 1, 0, 1,
-0.7153392, -1.038574, -2.327534, 0.5372549, 1, 0, 1,
-0.7080719, 1.766604, 0.8396071, 0.5294118, 1, 0, 1,
-0.7036031, -1.066506, -2.874306, 0.5254902, 1, 0, 1,
-0.7009114, 0.07800636, -0.8022845, 0.5176471, 1, 0, 1,
-0.6996505, 1.566303, -1.175653, 0.5137255, 1, 0, 1,
-0.6990857, 0.6799389, -2.027747, 0.5058824, 1, 0, 1,
-0.6958416, -0.7736623, -3.2158, 0.5019608, 1, 0, 1,
-0.6949415, -0.5048781, -1.087391, 0.4941176, 1, 0, 1,
-0.6940937, -1.244203, -1.723892, 0.4862745, 1, 0, 1,
-0.6887509, 0.8389736, -0.7713996, 0.4823529, 1, 0, 1,
-0.6885978, 0.3727174, -1.377217, 0.4745098, 1, 0, 1,
-0.6850516, 1.390422, -0.9704446, 0.4705882, 1, 0, 1,
-0.6823325, -1.302843, -2.005549, 0.4627451, 1, 0, 1,
-0.6780785, 2.029951, 0.9455696, 0.4588235, 1, 0, 1,
-0.6747037, -0.6299703, -1.552318, 0.4509804, 1, 0, 1,
-0.6708577, 0.9607001, -2.233669, 0.4470588, 1, 0, 1,
-0.6619257, -0.4709275, -2.689464, 0.4392157, 1, 0, 1,
-0.6522643, -0.1757644, -0.3079686, 0.4352941, 1, 0, 1,
-0.6502023, 1.629608, 1.165587, 0.427451, 1, 0, 1,
-0.6482019, -0.4392413, -2.591263, 0.4235294, 1, 0, 1,
-0.645935, 1.435976, -0.7369813, 0.4156863, 1, 0, 1,
-0.643133, 1.413948, 1.325317, 0.4117647, 1, 0, 1,
-0.6425211, 1.398954, -1.493819, 0.4039216, 1, 0, 1,
-0.6416948, -0.3222854, -2.444072, 0.3960784, 1, 0, 1,
-0.6410286, -1.731573, -2.336385, 0.3921569, 1, 0, 1,
-0.6397827, -0.1275657, -1.711221, 0.3843137, 1, 0, 1,
-0.6395868, 0.691346, 0.3878927, 0.3803922, 1, 0, 1,
-0.6386914, -0.6458373, -1.958066, 0.372549, 1, 0, 1,
-0.6351035, -1.144795, -3.741904, 0.3686275, 1, 0, 1,
-0.6287727, 0.7093624, -2.097471, 0.3607843, 1, 0, 1,
-0.6284941, 0.2830763, -1.51349, 0.3568628, 1, 0, 1,
-0.62713, -0.6041895, -4.451822, 0.3490196, 1, 0, 1,
-0.6250738, 0.8474747, -0.8934717, 0.345098, 1, 0, 1,
-0.6229017, -0.09847096, -0.9829447, 0.3372549, 1, 0, 1,
-0.6190106, -2.333166, -4.106599, 0.3333333, 1, 0, 1,
-0.6169031, 0.06284922, 0.03329055, 0.3254902, 1, 0, 1,
-0.6117802, 0.4411455, -0.4602377, 0.3215686, 1, 0, 1,
-0.6040962, 0.9184133, -0.6321029, 0.3137255, 1, 0, 1,
-0.6004249, -0.3355035, -2.332985, 0.3098039, 1, 0, 1,
-0.5956756, 1.172999, -0.7010493, 0.3019608, 1, 0, 1,
-0.5946529, 0.2965906, -0.379626, 0.2941177, 1, 0, 1,
-0.5940939, -0.1336502, -2.462236, 0.2901961, 1, 0, 1,
-0.5921348, 0.811871, -0.3547195, 0.282353, 1, 0, 1,
-0.5904972, 0.824266, -1.363838, 0.2784314, 1, 0, 1,
-0.5892704, -1.206058, -3.62431, 0.2705882, 1, 0, 1,
-0.5872041, -2.007597, -3.167282, 0.2666667, 1, 0, 1,
-0.5796649, -0.3747891, 0.3808113, 0.2588235, 1, 0, 1,
-0.578041, -0.009164761, -0.6795064, 0.254902, 1, 0, 1,
-0.5714155, -0.6043777, -2.040231, 0.2470588, 1, 0, 1,
-0.5652987, 2.05024, 1.481195, 0.2431373, 1, 0, 1,
-0.5621699, -0.4276822, -4.07368, 0.2352941, 1, 0, 1,
-0.5593514, 0.4559049, -0.1973533, 0.2313726, 1, 0, 1,
-0.5589643, 0.8868302, -1.572891, 0.2235294, 1, 0, 1,
-0.5579792, -0.2240196, -2.793466, 0.2196078, 1, 0, 1,
-0.5532492, -1.21802, -3.530724, 0.2117647, 1, 0, 1,
-0.552911, 0.4548091, 0.9640303, 0.2078431, 1, 0, 1,
-0.5514229, 0.03797787, -2.044568, 0.2, 1, 0, 1,
-0.5512451, 0.616397, -2.746749, 0.1921569, 1, 0, 1,
-0.5502054, 0.6055648, -0.8010437, 0.1882353, 1, 0, 1,
-0.5493329, 1.048753, -1.446151, 0.1803922, 1, 0, 1,
-0.5475141, -0.206433, -2.339747, 0.1764706, 1, 0, 1,
-0.5461838, 1.98355, -0.4335954, 0.1686275, 1, 0, 1,
-0.5448979, -0.8733595, -3.046722, 0.1647059, 1, 0, 1,
-0.5444311, 0.03602907, -2.382033, 0.1568628, 1, 0, 1,
-0.5425816, 1.057076, 0.5851496, 0.1529412, 1, 0, 1,
-0.5424784, -0.145695, -0.8077596, 0.145098, 1, 0, 1,
-0.538821, -2.856706, -3.373432, 0.1411765, 1, 0, 1,
-0.5316552, 0.6220503, -0.9950951, 0.1333333, 1, 0, 1,
-0.530709, 0.01068374, -1.923157, 0.1294118, 1, 0, 1,
-0.5305489, 0.603794, -1.575356, 0.1215686, 1, 0, 1,
-0.5279555, 0.0197833, -1.400597, 0.1176471, 1, 0, 1,
-0.5219377, -0.5867986, -2.765542, 0.1098039, 1, 0, 1,
-0.5202082, 0.4685683, -0.8751446, 0.1058824, 1, 0, 1,
-0.5167624, 3.255038, 0.4217708, 0.09803922, 1, 0, 1,
-0.5162104, 0.2621694, -0.07392029, 0.09019608, 1, 0, 1,
-0.5142124, -1.048322, -0.5473443, 0.08627451, 1, 0, 1,
-0.5008295, 1.716661, -1.510312, 0.07843138, 1, 0, 1,
-0.4911735, 1.123025, 1.138358, 0.07450981, 1, 0, 1,
-0.4788966, 0.06513937, -1.843624, 0.06666667, 1, 0, 1,
-0.474035, -0.191873, -2.198502, 0.0627451, 1, 0, 1,
-0.4675631, -0.3986909, -1.199283, 0.05490196, 1, 0, 1,
-0.464412, 1.500167, 1.155871, 0.05098039, 1, 0, 1,
-0.4636555, 1.025396, -1.08049, 0.04313726, 1, 0, 1,
-0.4614486, 2.096622, 0.311669, 0.03921569, 1, 0, 1,
-0.4582805, 0.355412, -0.840794, 0.03137255, 1, 0, 1,
-0.4579991, -0.2706321, -2.725207, 0.02745098, 1, 0, 1,
-0.4533416, 0.9180695, 0.7102382, 0.01960784, 1, 0, 1,
-0.452132, -0.2977225, -1.786822, 0.01568628, 1, 0, 1,
-0.4499482, 0.6588399, -0.8724172, 0.007843138, 1, 0, 1,
-0.4469425, -0.04622632, -2.734321, 0.003921569, 1, 0, 1,
-0.4441952, -0.4665974, -3.45189, 0, 1, 0.003921569, 1,
-0.4427894, 0.03191533, -0.8561539, 0, 1, 0.01176471, 1,
-0.4420634, 0.2979262, 0.8309172, 0, 1, 0.01568628, 1,
-0.4400404, 0.07867935, -0.01686673, 0, 1, 0.02352941, 1,
-0.438938, -0.3191402, -2.394407, 0, 1, 0.02745098, 1,
-0.4362595, -2.616015, -4.540238, 0, 1, 0.03529412, 1,
-0.430117, 0.4298365, -0.4247793, 0, 1, 0.03921569, 1,
-0.4292353, 0.4279243, -1.553024, 0, 1, 0.04705882, 1,
-0.4245209, -0.1945791, -3.40968, 0, 1, 0.05098039, 1,
-0.4206459, 1.746625, -2.038844, 0, 1, 0.05882353, 1,
-0.4183745, -1.000949, -4.904482, 0, 1, 0.0627451, 1,
-0.417861, -0.6311254, -4.781958, 0, 1, 0.07058824, 1,
-0.4172598, 0.9060181, 0.8920552, 0, 1, 0.07450981, 1,
-0.4140156, 1.305208, 0.8298194, 0, 1, 0.08235294, 1,
-0.4104624, 1.075351, 0.6035939, 0, 1, 0.08627451, 1,
-0.3974999, -0.5574744, -4.32923, 0, 1, 0.09411765, 1,
-0.3911971, -0.1627641, -2.003476, 0, 1, 0.1019608, 1,
-0.3894648, 0.5424222, -2.355114, 0, 1, 0.1058824, 1,
-0.3880042, -0.8815171, -0.6719628, 0, 1, 0.1137255, 1,
-0.387976, -0.1836679, -1.409392, 0, 1, 0.1176471, 1,
-0.3814307, -0.344913, -2.884151, 0, 1, 0.1254902, 1,
-0.3803572, -0.8077019, -3.803768, 0, 1, 0.1294118, 1,
-0.3802102, -0.4335649, -0.8066487, 0, 1, 0.1372549, 1,
-0.3790196, 0.8852355, -0.3718118, 0, 1, 0.1411765, 1,
-0.3789138, 0.4436359, -1.30839, 0, 1, 0.1490196, 1,
-0.3784121, 1.402002, -2.738789, 0, 1, 0.1529412, 1,
-0.3761362, 1.069502, -2.211038, 0, 1, 0.1607843, 1,
-0.3663634, 0.9068977, 0.6819983, 0, 1, 0.1647059, 1,
-0.3637989, 0.8169107, 0.5786363, 0, 1, 0.172549, 1,
-0.3624622, 0.8029296, -2.109179, 0, 1, 0.1764706, 1,
-0.3543494, -0.2961131, -2.30527, 0, 1, 0.1843137, 1,
-0.3527939, -0.2708125, -1.840535, 0, 1, 0.1882353, 1,
-0.3513762, 0.8337793, -0.3009904, 0, 1, 0.1960784, 1,
-0.350046, -1.275553, -0.3155347, 0, 1, 0.2039216, 1,
-0.3494202, -1.002727, -3.848215, 0, 1, 0.2078431, 1,
-0.3477879, 0.4118317, -0.0160633, 0, 1, 0.2156863, 1,
-0.3468975, 0.6079687, -0.1702475, 0, 1, 0.2196078, 1,
-0.3442419, 0.6596158, -0.470101, 0, 1, 0.227451, 1,
-0.3396769, 1.01092, -1.084846, 0, 1, 0.2313726, 1,
-0.3383217, -0.2882253, -2.725868, 0, 1, 0.2392157, 1,
-0.3311171, -0.03499539, -2.099257, 0, 1, 0.2431373, 1,
-0.3277878, -1.816242, -2.319756, 0, 1, 0.2509804, 1,
-0.3185959, -0.1621422, -2.79276, 0, 1, 0.254902, 1,
-0.312491, -0.2147945, -1.539237, 0, 1, 0.2627451, 1,
-0.3124605, -0.8568048, -2.362164, 0, 1, 0.2666667, 1,
-0.3115135, 0.5304378, -1.470641, 0, 1, 0.2745098, 1,
-0.3093098, 1.32664, -0.4146955, 0, 1, 0.2784314, 1,
-0.3073262, -0.2223772, -0.2503748, 0, 1, 0.2862745, 1,
-0.3030667, 2.141805, -1.267617, 0, 1, 0.2901961, 1,
-0.3026966, -0.1584111, -2.041104, 0, 1, 0.2980392, 1,
-0.3025818, -1.079944, -2.851395, 0, 1, 0.3058824, 1,
-0.3019879, 0.9732391, 1.523202, 0, 1, 0.3098039, 1,
-0.2980989, -0.0007777964, -2.463259, 0, 1, 0.3176471, 1,
-0.2935873, -0.7652443, -1.247272, 0, 1, 0.3215686, 1,
-0.2919478, -1.065937, -4.193706, 0, 1, 0.3294118, 1,
-0.2861597, 0.6436, -1.554825, 0, 1, 0.3333333, 1,
-0.2855225, -0.7525361, -1.667169, 0, 1, 0.3411765, 1,
-0.2851798, 1.279533, 1.12981, 0, 1, 0.345098, 1,
-0.2837861, 0.9318736, 0.3853326, 0, 1, 0.3529412, 1,
-0.2827919, 0.6040711, -0.6815803, 0, 1, 0.3568628, 1,
-0.2817125, -0.8498838, -3.145868, 0, 1, 0.3647059, 1,
-0.2784888, -1.501409, -2.323642, 0, 1, 0.3686275, 1,
-0.2763311, -1.200243, -2.102384, 0, 1, 0.3764706, 1,
-0.2691355, -0.1447998, -2.42224, 0, 1, 0.3803922, 1,
-0.263314, -0.5056692, -2.572532, 0, 1, 0.3882353, 1,
-0.2629541, -1.621641, -3.334037, 0, 1, 0.3921569, 1,
-0.2621602, 0.2348604, -1.618852, 0, 1, 0.4, 1,
-0.2620339, -0.1309977, -1.814644, 0, 1, 0.4078431, 1,
-0.2590723, 1.536745, 0.5968409, 0, 1, 0.4117647, 1,
-0.2573043, -0.8923666, -3.773724, 0, 1, 0.4196078, 1,
-0.2538298, -0.378924, -3.400155, 0, 1, 0.4235294, 1,
-0.2484445, 1.204039, -0.5703302, 0, 1, 0.4313726, 1,
-0.2450662, 1.568085, 1.619101, 0, 1, 0.4352941, 1,
-0.2437447, 0.2502525, -0.3443197, 0, 1, 0.4431373, 1,
-0.2437218, 0.226084, -1.153326, 0, 1, 0.4470588, 1,
-0.2428452, -0.007720984, -2.14004, 0, 1, 0.454902, 1,
-0.2397659, 0.1933956, -1.184876, 0, 1, 0.4588235, 1,
-0.239494, -0.07396306, -1.748129, 0, 1, 0.4666667, 1,
-0.2387532, 0.1443195, -2.472718, 0, 1, 0.4705882, 1,
-0.2311848, -0.5637568, -2.741184, 0, 1, 0.4784314, 1,
-0.2304114, -2.09042, -0.7543752, 0, 1, 0.4823529, 1,
-0.2297234, -0.4285805, -1.459997, 0, 1, 0.4901961, 1,
-0.2284634, -0.9527116, -3.549834, 0, 1, 0.4941176, 1,
-0.2268218, -0.812762, -1.884594, 0, 1, 0.5019608, 1,
-0.2263103, -0.5125189, -1.536757, 0, 1, 0.509804, 1,
-0.2237231, 1.491641, -0.3521873, 0, 1, 0.5137255, 1,
-0.2226052, 1.003517, 1.282421, 0, 1, 0.5215687, 1,
-0.2223693, 1.286307, -0.4300886, 0, 1, 0.5254902, 1,
-0.2212282, -1.242048, -2.807505, 0, 1, 0.5333334, 1,
-0.2164062, -0.7694044, -1.729437, 0, 1, 0.5372549, 1,
-0.2152894, -0.1534515, -4.602134, 0, 1, 0.5450981, 1,
-0.2136681, -0.3864357, -2.269332, 0, 1, 0.5490196, 1,
-0.2126678, 1.566041, -0.006102479, 0, 1, 0.5568628, 1,
-0.2114361, -0.8731158, -3.371611, 0, 1, 0.5607843, 1,
-0.2110026, -1.467605, -2.414157, 0, 1, 0.5686275, 1,
-0.2093642, -0.4330404, -3.98858, 0, 1, 0.572549, 1,
-0.2087283, -0.7060629, -2.792606, 0, 1, 0.5803922, 1,
-0.2086377, -0.7611889, -3.065228, 0, 1, 0.5843138, 1,
-0.2086018, -1.130411, -2.286357, 0, 1, 0.5921569, 1,
-0.2077196, -0.6804507, -3.093098, 0, 1, 0.5960785, 1,
-0.2069165, 1.147506, -0.4038004, 0, 1, 0.6039216, 1,
-0.2060228, -1.115809, -4.194875, 0, 1, 0.6117647, 1,
-0.2057448, -0.3248036, -1.083038, 0, 1, 0.6156863, 1,
-0.205625, 0.2850211, -0.5908514, 0, 1, 0.6235294, 1,
-0.2054507, -1.503865, -3.68016, 0, 1, 0.627451, 1,
-0.2037734, 0.3013188, 0.200594, 0, 1, 0.6352941, 1,
-0.200712, -1.103405, -2.417171, 0, 1, 0.6392157, 1,
-0.1994037, -1.463906, -2.361638, 0, 1, 0.6470588, 1,
-0.1984024, -0.9261034, -2.599929, 0, 1, 0.6509804, 1,
-0.1956764, 0.362508, 0.1782381, 0, 1, 0.6588235, 1,
-0.1935304, 1.296555, 1.455857, 0, 1, 0.6627451, 1,
-0.1926841, -1.228163, -4.725531, 0, 1, 0.6705883, 1,
-0.1924643, 1.679664, -1.689947, 0, 1, 0.6745098, 1,
-0.1918378, 0.3389179, -0.8986137, 0, 1, 0.682353, 1,
-0.1916756, 1.788429, 1.302441, 0, 1, 0.6862745, 1,
-0.1892094, 0.8395616, 0.0845766, 0, 1, 0.6941177, 1,
-0.1890367, 0.996169, 0.638944, 0, 1, 0.7019608, 1,
-0.1867366, -0.3140679, -2.208229, 0, 1, 0.7058824, 1,
-0.1852456, 0.8378413, -1.504602, 0, 1, 0.7137255, 1,
-0.1822572, 1.60874, -0.6309026, 0, 1, 0.7176471, 1,
-0.1787099, 1.815786, -0.1121861, 0, 1, 0.7254902, 1,
-0.1758155, -0.7922243, -2.457439, 0, 1, 0.7294118, 1,
-0.1575695, -0.0831972, -2.932721, 0, 1, 0.7372549, 1,
-0.1566032, -1.372189, -3.839411, 0, 1, 0.7411765, 1,
-0.1525194, 0.1195649, 0.04896605, 0, 1, 0.7490196, 1,
-0.1498125, 0.7213592, -0.1042626, 0, 1, 0.7529412, 1,
-0.1461962, -0.9794359, -2.105448, 0, 1, 0.7607843, 1,
-0.1460014, -0.4819445, -3.680876, 0, 1, 0.7647059, 1,
-0.1453257, -1.700539, -3.569501, 0, 1, 0.772549, 1,
-0.1443647, 0.5348812, -2.080077, 0, 1, 0.7764706, 1,
-0.1408043, -1.512273, -3.554085, 0, 1, 0.7843137, 1,
-0.13594, 0.6746311, 0.4864369, 0, 1, 0.7882353, 1,
-0.13329, 0.2527443, -2.296456, 0, 1, 0.7960784, 1,
-0.1328902, 0.8142364, -0.6513341, 0, 1, 0.8039216, 1,
-0.1320476, -1.333125, -2.336479, 0, 1, 0.8078431, 1,
-0.1266924, -1.294241, -3.528504, 0, 1, 0.8156863, 1,
-0.1258776, 0.5417425, 0.01358168, 0, 1, 0.8196079, 1,
-0.1176916, 1.862985, 0.8052457, 0, 1, 0.827451, 1,
-0.1159997, -0.7567036, -2.631178, 0, 1, 0.8313726, 1,
-0.111374, -0.2327645, -2.565401, 0, 1, 0.8392157, 1,
-0.1080928, -0.03299104, -1.954062, 0, 1, 0.8431373, 1,
-0.1041766, -1.550894, -3.423774, 0, 1, 0.8509804, 1,
-0.1024358, -1.261748, -2.388215, 0, 1, 0.854902, 1,
-0.09991345, 0.6687624, 1.163821, 0, 1, 0.8627451, 1,
-0.09494979, 0.198872, -0.9460356, 0, 1, 0.8666667, 1,
-0.09469952, 0.6036463, -0.2087258, 0, 1, 0.8745098, 1,
-0.09407111, -0.9370386, -3.69234, 0, 1, 0.8784314, 1,
-0.08443223, -0.1534239, -2.705639, 0, 1, 0.8862745, 1,
-0.08436859, 0.4709085, -0.6837092, 0, 1, 0.8901961, 1,
-0.08411904, -0.2332035, -1.95727, 0, 1, 0.8980392, 1,
-0.08358003, 0.2496822, 0.3306339, 0, 1, 0.9058824, 1,
-0.08308607, 0.97504, -0.5314816, 0, 1, 0.9098039, 1,
-0.07920276, 0.2498122, -0.6675601, 0, 1, 0.9176471, 1,
-0.07736435, -0.8388287, -4.036765, 0, 1, 0.9215686, 1,
-0.07657773, 0.1176091, -0.6253842, 0, 1, 0.9294118, 1,
-0.07622086, -0.2869734, -0.7909111, 0, 1, 0.9333333, 1,
-0.07280385, -1.45462, -2.961519, 0, 1, 0.9411765, 1,
-0.06916764, -1.086348, -3.995474, 0, 1, 0.945098, 1,
-0.06868836, -0.8139325, -2.25845, 0, 1, 0.9529412, 1,
-0.06780287, 0.7691504, -0.8540208, 0, 1, 0.9568627, 1,
-0.06513775, -1.004963, -2.306646, 0, 1, 0.9647059, 1,
-0.06335071, 0.9851102, -1.267412, 0, 1, 0.9686275, 1,
-0.06084529, -1.595338, -2.33448, 0, 1, 0.9764706, 1,
-0.06067102, -0.8634068, -2.933874, 0, 1, 0.9803922, 1,
-0.0603057, -0.8462553, -2.998499, 0, 1, 0.9882353, 1,
-0.05738282, -2.34579, -3.668254, 0, 1, 0.9921569, 1,
-0.0566985, -0.2827965, -2.074301, 0, 1, 1, 1,
-0.05661687, -1.260218, -4.441066, 0, 0.9921569, 1, 1,
-0.05148385, -0.6202916, -2.194382, 0, 0.9882353, 1, 1,
-0.04159769, -0.03145283, -1.734167, 0, 0.9803922, 1, 1,
-0.04123838, 2.126438, -0.8107192, 0, 0.9764706, 1, 1,
-0.03967741, 0.4696034, 1.493669, 0, 0.9686275, 1, 1,
-0.03748368, 0.1024579, -0.83671, 0, 0.9647059, 1, 1,
-0.0360022, -0.03018029, -3.304326, 0, 0.9568627, 1, 1,
-0.02711712, 1.776167, -1.321934, 0, 0.9529412, 1, 1,
-0.02456069, 0.3230836, 0.4502708, 0, 0.945098, 1, 1,
-0.0225877, 1.003311, -0.2611243, 0, 0.9411765, 1, 1,
-0.0156928, 1.687553, 0.9818907, 0, 0.9333333, 1, 1,
-0.01283813, 0.810994, -0.6245467, 0, 0.9294118, 1, 1,
-0.008289764, -0.9600274, -4.017844, 0, 0.9215686, 1, 1,
-0.007968712, 2.603937, 0.366654, 0, 0.9176471, 1, 1,
-0.006990617, 0.4040248, -0.4435526, 0, 0.9098039, 1, 1,
-0.004579133, 0.2824727, 1.630037, 0, 0.9058824, 1, 1,
-0.00390129, -1.239951, -2.970365, 0, 0.8980392, 1, 1,
-0.003164697, -0.3465945, -2.671089, 0, 0.8901961, 1, 1,
0.0006298373, -0.4173862, 4.866216, 0, 0.8862745, 1, 1,
0.0007253033, -0.009882508, 4.663258, 0, 0.8784314, 1, 1,
0.001798971, -1.28526, 2.845004, 0, 0.8745098, 1, 1,
0.002297928, 1.044973, -0.9022859, 0, 0.8666667, 1, 1,
0.003049841, 0.08563894, -0.05916914, 0, 0.8627451, 1, 1,
0.004002311, -0.3967331, 2.212279, 0, 0.854902, 1, 1,
0.004331166, -0.06520065, 1.442965, 0, 0.8509804, 1, 1,
0.004920649, -0.2280041, 2.269177, 0, 0.8431373, 1, 1,
0.005041378, 0.5640468, 0.4172881, 0, 0.8392157, 1, 1,
0.007646223, 1.890158, -0.8830419, 0, 0.8313726, 1, 1,
0.0105975, 0.1273614, -0.3922122, 0, 0.827451, 1, 1,
0.01081427, 0.9388646, 0.3044043, 0, 0.8196079, 1, 1,
0.0143172, -0.2087817, 3.917576, 0, 0.8156863, 1, 1,
0.02000149, -0.7218577, 2.045295, 0, 0.8078431, 1, 1,
0.02305575, -0.1450799, 2.180466, 0, 0.8039216, 1, 1,
0.02825897, -2.251636, 2.723403, 0, 0.7960784, 1, 1,
0.03040798, -0.8328885, 4.285406, 0, 0.7882353, 1, 1,
0.03360116, -1.342437, 2.16229, 0, 0.7843137, 1, 1,
0.03445772, 1.051572, 1.239955, 0, 0.7764706, 1, 1,
0.03627649, -0.9988949, 3.006544, 0, 0.772549, 1, 1,
0.03686827, -1.548154, 3.835331, 0, 0.7647059, 1, 1,
0.03719916, -1.682479, 3.319753, 0, 0.7607843, 1, 1,
0.04363604, 1.467169, -2.223778, 0, 0.7529412, 1, 1,
0.04862414, -0.1913513, 2.51186, 0, 0.7490196, 1, 1,
0.05045634, -0.858394, 2.391014, 0, 0.7411765, 1, 1,
0.05218199, -0.001718898, 2.255325, 0, 0.7372549, 1, 1,
0.0522286, 0.2531747, 0.07941014, 0, 0.7294118, 1, 1,
0.05447169, -0.2381717, 2.222895, 0, 0.7254902, 1, 1,
0.05820863, -0.2143437, 2.33077, 0, 0.7176471, 1, 1,
0.05959442, 0.04993441, 0.06123295, 0, 0.7137255, 1, 1,
0.06090498, -0.03492603, 2.476383, 0, 0.7058824, 1, 1,
0.06284536, 0.7863837, 0.7713313, 0, 0.6980392, 1, 1,
0.06503123, 0.1629057, 1.121583, 0, 0.6941177, 1, 1,
0.06898832, -1.10503, 1.740519, 0, 0.6862745, 1, 1,
0.06962184, -1.63366, 2.72382, 0, 0.682353, 1, 1,
0.07055669, -0.7024818, 4.05771, 0, 0.6745098, 1, 1,
0.07075753, 0.7718994, 0.5831347, 0, 0.6705883, 1, 1,
0.07363062, 1.084717, -1.217297, 0, 0.6627451, 1, 1,
0.07483222, -0.7495791, 1.470499, 0, 0.6588235, 1, 1,
0.0769657, -0.4477144, 3.133668, 0, 0.6509804, 1, 1,
0.07894755, -0.2191539, 3.346303, 0, 0.6470588, 1, 1,
0.08045016, 0.5522679, 2.644765, 0, 0.6392157, 1, 1,
0.08148197, -0.4093487, 0.8096048, 0, 0.6352941, 1, 1,
0.08169273, 0.9163005, 0.291327, 0, 0.627451, 1, 1,
0.08468457, 1.611759, 0.2129068, 0, 0.6235294, 1, 1,
0.08548871, 0.9962466, 0.3632264, 0, 0.6156863, 1, 1,
0.08812288, 0.2979925, 0.3628409, 0, 0.6117647, 1, 1,
0.08874645, 0.5744237, 0.4197941, 0, 0.6039216, 1, 1,
0.08906143, -0.4071628, 4.43422, 0, 0.5960785, 1, 1,
0.09145204, 0.08784553, 0.4211634, 0, 0.5921569, 1, 1,
0.09879618, 0.2529257, 0.9925372, 0, 0.5843138, 1, 1,
0.1005645, -0.7645698, 0.8406748, 0, 0.5803922, 1, 1,
0.1048823, -2.013742, 3.843794, 0, 0.572549, 1, 1,
0.1054896, 0.1457678, 0.9066824, 0, 0.5686275, 1, 1,
0.1065547, 0.4297272, 0.5990939, 0, 0.5607843, 1, 1,
0.1074998, 2.155833, 0.8843719, 0, 0.5568628, 1, 1,
0.1083137, 0.3983117, -1.343022, 0, 0.5490196, 1, 1,
0.1104982, -0.2473266, 2.993717, 0, 0.5450981, 1, 1,
0.1108785, 0.002560133, 0.6157261, 0, 0.5372549, 1, 1,
0.1111064, 1.102577, 1.818558, 0, 0.5333334, 1, 1,
0.1120347, -1.149931, 2.479556, 0, 0.5254902, 1, 1,
0.1132828, -2.029758, 5.126037, 0, 0.5215687, 1, 1,
0.113479, -0.4410974, 1.593406, 0, 0.5137255, 1, 1,
0.1146873, -0.9852996, 1.44757, 0, 0.509804, 1, 1,
0.1226047, -0.8614907, 2.880167, 0, 0.5019608, 1, 1,
0.1229122, -0.2530375, 2.121561, 0, 0.4941176, 1, 1,
0.1232617, -0.4437644, 2.748665, 0, 0.4901961, 1, 1,
0.1285405, -0.6718895, 3.277269, 0, 0.4823529, 1, 1,
0.1358196, 0.3785561, -0.3149203, 0, 0.4784314, 1, 1,
0.1401807, -0.4189691, 2.561933, 0, 0.4705882, 1, 1,
0.1403743, 0.6175811, -0.5085424, 0, 0.4666667, 1, 1,
0.1427876, 1.946533, 1.369412, 0, 0.4588235, 1, 1,
0.1484205, -0.830628, 1.924453, 0, 0.454902, 1, 1,
0.1484942, -0.9160501, 3.473145, 0, 0.4470588, 1, 1,
0.1520059, 1.048055, -1.529791, 0, 0.4431373, 1, 1,
0.1527838, -1.457293, 3.755025, 0, 0.4352941, 1, 1,
0.1537547, 0.2643547, 3.419268, 0, 0.4313726, 1, 1,
0.1538411, -0.2291428, 1.982403, 0, 0.4235294, 1, 1,
0.1541802, 0.5024989, 0.8392298, 0, 0.4196078, 1, 1,
0.1563429, -0.2991434, 2.911436, 0, 0.4117647, 1, 1,
0.1598396, 0.5913621, 0.2652707, 0, 0.4078431, 1, 1,
0.1633564, 0.278003, 3.020602, 0, 0.4, 1, 1,
0.1637168, 0.2207247, 2.052203, 0, 0.3921569, 1, 1,
0.1700836, 1.817782, 1.240964, 0, 0.3882353, 1, 1,
0.1708574, -0.4308253, -0.06027431, 0, 0.3803922, 1, 1,
0.176336, 1.870167, 2.052493, 0, 0.3764706, 1, 1,
0.1790003, 0.5300464, 1.356278, 0, 0.3686275, 1, 1,
0.1791697, 0.1622197, 0.2841519, 0, 0.3647059, 1, 1,
0.1792807, -0.2248507, 3.55898, 0, 0.3568628, 1, 1,
0.1854377, 1.412858, -1.238147, 0, 0.3529412, 1, 1,
0.1859199, -0.3953597, 3.724866, 0, 0.345098, 1, 1,
0.1866143, -0.3606338, 3.4111, 0, 0.3411765, 1, 1,
0.1876797, 0.4320715, 0.2054596, 0, 0.3333333, 1, 1,
0.1892665, -1.666056, 1.961989, 0, 0.3294118, 1, 1,
0.1924381, 0.8914868, 0.4993505, 0, 0.3215686, 1, 1,
0.1948255, -1.828923, 3.607557, 0, 0.3176471, 1, 1,
0.1958334, -1.282169, 4.977389, 0, 0.3098039, 1, 1,
0.1983372, -0.902091, 3.151397, 0, 0.3058824, 1, 1,
0.200614, 0.2017789, 0.6332563, 0, 0.2980392, 1, 1,
0.2023816, -1.869578, 4.003531, 0, 0.2901961, 1, 1,
0.2047432, -0.1931731, 3.54301, 0, 0.2862745, 1, 1,
0.2049382, 0.3184041, 0.3138357, 0, 0.2784314, 1, 1,
0.2052959, -0.01197331, 2.383644, 0, 0.2745098, 1, 1,
0.2082836, 1.838101, -1.51621, 0, 0.2666667, 1, 1,
0.2099989, 0.746985, 1.393142, 0, 0.2627451, 1, 1,
0.2119797, -1.923442, 4.081866, 0, 0.254902, 1, 1,
0.2130701, -0.03584943, -0.3356939, 0, 0.2509804, 1, 1,
0.2135632, 1.341573, 0.7438785, 0, 0.2431373, 1, 1,
0.2160628, 1.448152, 0.7829689, 0, 0.2392157, 1, 1,
0.2168668, -1.285166, 4.191184, 0, 0.2313726, 1, 1,
0.2172786, 1.340663, -0.5772598, 0, 0.227451, 1, 1,
0.2181963, -0.4414525, 2.668867, 0, 0.2196078, 1, 1,
0.2255255, 0.5432931, -0.008268363, 0, 0.2156863, 1, 1,
0.2268603, 1.380838, 0.04567127, 0, 0.2078431, 1, 1,
0.2276886, 0.884706, 0.1639315, 0, 0.2039216, 1, 1,
0.2300533, -0.9286853, 3.629454, 0, 0.1960784, 1, 1,
0.2348743, -0.3850414, 3.526302, 0, 0.1882353, 1, 1,
0.2352905, -0.9246793, 3.512245, 0, 0.1843137, 1, 1,
0.2359382, 1.48745, -0.08367052, 0, 0.1764706, 1, 1,
0.2496359, -0.3974006, 0.7467255, 0, 0.172549, 1, 1,
0.2537028, -0.4939219, 1.702451, 0, 0.1647059, 1, 1,
0.2658172, -1.25985, 3.340733, 0, 0.1607843, 1, 1,
0.2681696, 0.9035799, -0.8475828, 0, 0.1529412, 1, 1,
0.2686663, -0.7637845, 2.092325, 0, 0.1490196, 1, 1,
0.2732172, 0.474189, 1.173689, 0, 0.1411765, 1, 1,
0.2753035, 0.3579717, 0.8605213, 0, 0.1372549, 1, 1,
0.2772894, -0.67585, 3.429544, 0, 0.1294118, 1, 1,
0.2841309, -0.8244889, 4.388658, 0, 0.1254902, 1, 1,
0.2849703, -1.805802, 4.20712, 0, 0.1176471, 1, 1,
0.2873683, 0.4755399, 0.06286578, 0, 0.1137255, 1, 1,
0.2876244, -0.1329934, 3.41064, 0, 0.1058824, 1, 1,
0.2888027, -0.2896686, 2.403175, 0, 0.09803922, 1, 1,
0.2929977, -0.4895543, 1.845244, 0, 0.09411765, 1, 1,
0.2937243, -0.1459553, 1.724125, 0, 0.08627451, 1, 1,
0.2984335, -0.07430429, 1.237, 0, 0.08235294, 1, 1,
0.3009736, -1.526543, 2.526475, 0, 0.07450981, 1, 1,
0.3039945, 0.3444228, 1.592111, 0, 0.07058824, 1, 1,
0.3058021, 0.03568878, 3.262723, 0, 0.0627451, 1, 1,
0.3083449, -0.9966218, 2.72669, 0, 0.05882353, 1, 1,
0.3178918, 0.6060337, -0.3143614, 0, 0.05098039, 1, 1,
0.3204242, 0.8518812, 0.7898926, 0, 0.04705882, 1, 1,
0.3251212, 0.01528924, 0.4736628, 0, 0.03921569, 1, 1,
0.3416109, -0.6634737, 1.784864, 0, 0.03529412, 1, 1,
0.3464361, -0.820349, 1.846222, 0, 0.02745098, 1, 1,
0.347851, 0.1299322, 1.406546, 0, 0.02352941, 1, 1,
0.3490438, 0.5191265, -0.01919826, 0, 0.01568628, 1, 1,
0.3497485, 0.2753269, 1.534452, 0, 0.01176471, 1, 1,
0.3526133, 0.3077578, 1.210832, 0, 0.003921569, 1, 1,
0.3526853, -0.4309108, 2.306978, 0.003921569, 0, 1, 1,
0.3542247, -0.8416061, 5.019562, 0.007843138, 0, 1, 1,
0.3559894, 0.4545772, -1.20668, 0.01568628, 0, 1, 1,
0.3585673, 0.6770083, 0.7121629, 0.01960784, 0, 1, 1,
0.3623056, -0.07530469, -0.1684193, 0.02745098, 0, 1, 1,
0.3658068, -0.8422222, 3.223251, 0.03137255, 0, 1, 1,
0.3660344, -1.648018, 3.319154, 0.03921569, 0, 1, 1,
0.3722923, -0.2824266, 2.344304, 0.04313726, 0, 1, 1,
0.3767658, -0.7895583, 3.457747, 0.05098039, 0, 1, 1,
0.3939718, 0.433031, 0.7219051, 0.05490196, 0, 1, 1,
0.3947468, -1.114911, 1.962579, 0.0627451, 0, 1, 1,
0.4017171, 0.2280282, 0.5956984, 0.06666667, 0, 1, 1,
0.4032856, -0.4078517, 0.2934522, 0.07450981, 0, 1, 1,
0.4049711, -0.2118143, 0.7387346, 0.07843138, 0, 1, 1,
0.4073392, -1.163654, 2.456269, 0.08627451, 0, 1, 1,
0.4073552, -0.3079441, 3.534552, 0.09019608, 0, 1, 1,
0.4117017, 1.106307, -0.3387621, 0.09803922, 0, 1, 1,
0.4194376, -0.3653931, 1.46159, 0.1058824, 0, 1, 1,
0.4195602, -1.391369, 3.820105, 0.1098039, 0, 1, 1,
0.4272024, -0.1509275, 0.9879593, 0.1176471, 0, 1, 1,
0.4272563, 1.406363, 0.2610408, 0.1215686, 0, 1, 1,
0.4279213, 0.5756657, 0.8565156, 0.1294118, 0, 1, 1,
0.4280778, 1.035008, 1.619849, 0.1333333, 0, 1, 1,
0.4282953, -0.06968568, 1.392366, 0.1411765, 0, 1, 1,
0.4294466, -0.2919874, 1.580601, 0.145098, 0, 1, 1,
0.4340777, 0.359072, 0.8262234, 0.1529412, 0, 1, 1,
0.4347562, -2.67741, 4.207751, 0.1568628, 0, 1, 1,
0.4348125, -0.009814794, 0.5589345, 0.1647059, 0, 1, 1,
0.4349254, 0.5601626, 1.325192, 0.1686275, 0, 1, 1,
0.435976, -0.4375852, 3.58286, 0.1764706, 0, 1, 1,
0.4380445, -0.9574568, 3.614176, 0.1803922, 0, 1, 1,
0.4428059, -1.431551, 3.499014, 0.1882353, 0, 1, 1,
0.4444046, 0.06639078, 2.297477, 0.1921569, 0, 1, 1,
0.4454698, 0.02097693, -0.563334, 0.2, 0, 1, 1,
0.4462652, 1.985376, 0.1634714, 0.2078431, 0, 1, 1,
0.4536592, -0.4410121, 3.419562, 0.2117647, 0, 1, 1,
0.4552405, -0.9954485, 3.055483, 0.2196078, 0, 1, 1,
0.4553614, 0.9486765, 0.8805173, 0.2235294, 0, 1, 1,
0.45902, -1.543209, 0.9767578, 0.2313726, 0, 1, 1,
0.4600393, 0.5725753, 1.091049, 0.2352941, 0, 1, 1,
0.4678722, 0.3429829, 3.393067, 0.2431373, 0, 1, 1,
0.4692613, 0.885138, -0.9614779, 0.2470588, 0, 1, 1,
0.4702122, 0.1288834, 2.396173, 0.254902, 0, 1, 1,
0.4703558, 0.8725621, 0.7811817, 0.2588235, 0, 1, 1,
0.4807348, -1.143495, 2.61377, 0.2666667, 0, 1, 1,
0.4825408, -2.247298, 4.32477, 0.2705882, 0, 1, 1,
0.4826347, 1.077343, -1.133508, 0.2784314, 0, 1, 1,
0.4889178, 0.1632614, -0.100398, 0.282353, 0, 1, 1,
0.4944184, 0.4154851, 0.1657738, 0.2901961, 0, 1, 1,
0.4950135, -0.8244603, 2.018808, 0.2941177, 0, 1, 1,
0.4964749, -1.261502, 1.716966, 0.3019608, 0, 1, 1,
0.5112661, 2.781811, -0.0870159, 0.3098039, 0, 1, 1,
0.5114874, 2.362962, 1.102742, 0.3137255, 0, 1, 1,
0.5128294, 0.3238022, 0.5081367, 0.3215686, 0, 1, 1,
0.527081, 0.7404712, -0.009496133, 0.3254902, 0, 1, 1,
0.5284383, -0.3834838, 0.1724374, 0.3333333, 0, 1, 1,
0.5289409, -1.513282, 1.244897, 0.3372549, 0, 1, 1,
0.5292637, -1.273787, 3.520617, 0.345098, 0, 1, 1,
0.5305811, -0.3330233, 1.526096, 0.3490196, 0, 1, 1,
0.5340288, 1.988632, 1.306029, 0.3568628, 0, 1, 1,
0.5377728, 1.106374, 0.1645536, 0.3607843, 0, 1, 1,
0.5381951, -0.5032173, 2.287194, 0.3686275, 0, 1, 1,
0.5383596, -0.255884, 1.595742, 0.372549, 0, 1, 1,
0.539953, 2.372464, -0.7711326, 0.3803922, 0, 1, 1,
0.5449873, 0.2783356, 1.624451, 0.3843137, 0, 1, 1,
0.5470338, -0.5415854, 2.118801, 0.3921569, 0, 1, 1,
0.5544769, 0.1131163, 2.427975, 0.3960784, 0, 1, 1,
0.555465, -1.737204, 2.357344, 0.4039216, 0, 1, 1,
0.5641708, -1.998197, 1.305838, 0.4117647, 0, 1, 1,
0.5644661, -0.0484717, 1.089754, 0.4156863, 0, 1, 1,
0.5698406, -0.1795911, 1.718858, 0.4235294, 0, 1, 1,
0.5701306, -2.199642, 3.752119, 0.427451, 0, 1, 1,
0.5716304, -0.06186128, 1.468969, 0.4352941, 0, 1, 1,
0.5753256, -0.5211291, 2.920941, 0.4392157, 0, 1, 1,
0.5761524, -0.06540989, 0.9496311, 0.4470588, 0, 1, 1,
0.5812222, 0.9310825, 1.020207, 0.4509804, 0, 1, 1,
0.5828337, -1.282488, 2.707426, 0.4588235, 0, 1, 1,
0.583072, -0.1925606, 2.016777, 0.4627451, 0, 1, 1,
0.5844594, 1.139848, 1.50518, 0.4705882, 0, 1, 1,
0.5854546, 0.8855739, 0.0129344, 0.4745098, 0, 1, 1,
0.5918903, -2.007133, 2.744128, 0.4823529, 0, 1, 1,
0.5938718, -1.669028, 3.381755, 0.4862745, 0, 1, 1,
0.5967546, -2.438727, 2.689356, 0.4941176, 0, 1, 1,
0.5980542, 1.607878, 0.756458, 0.5019608, 0, 1, 1,
0.5991249, -3.246374, 3.497638, 0.5058824, 0, 1, 1,
0.6043726, -0.605539, 0.104671, 0.5137255, 0, 1, 1,
0.6061884, 0.9609291, 0.3440311, 0.5176471, 0, 1, 1,
0.6063778, 1.538923, -0.7803358, 0.5254902, 0, 1, 1,
0.6118584, -0.9337329, 3.396782, 0.5294118, 0, 1, 1,
0.6167272, 0.05880323, 2.706032, 0.5372549, 0, 1, 1,
0.6174028, -0.2130333, 0.5278689, 0.5411765, 0, 1, 1,
0.6185076, -1.150137, 5.108702, 0.5490196, 0, 1, 1,
0.6188848, 0.6288583, 1.848399, 0.5529412, 0, 1, 1,
0.6200342, 1.220466, 0.6814256, 0.5607843, 0, 1, 1,
0.6221802, -0.55216, 2.109502, 0.5647059, 0, 1, 1,
0.6320931, -0.6218119, 4.126805, 0.572549, 0, 1, 1,
0.6383879, 0.5568489, 2.482415, 0.5764706, 0, 1, 1,
0.6418141, -0.2353835, 1.774137, 0.5843138, 0, 1, 1,
0.6440231, -1.223273, 2.279259, 0.5882353, 0, 1, 1,
0.6472661, -1.054498, 3.874343, 0.5960785, 0, 1, 1,
0.6478614, -0.1467489, 3.487955, 0.6039216, 0, 1, 1,
0.6486186, 0.7864653, 0.8553044, 0.6078432, 0, 1, 1,
0.6502829, -1.750505, 2.875688, 0.6156863, 0, 1, 1,
0.6537454, 0.5081624, 1.880788, 0.6196079, 0, 1, 1,
0.6562912, 0.89336, 1.200682, 0.627451, 0, 1, 1,
0.6573928, 1.546525, 0.0891, 0.6313726, 0, 1, 1,
0.6605029, -1.569765, 2.239606, 0.6392157, 0, 1, 1,
0.6609522, 0.4499462, 1.185817, 0.6431373, 0, 1, 1,
0.666563, -0.2639101, 0.1649979, 0.6509804, 0, 1, 1,
0.669221, 1.378694, 0.7478737, 0.654902, 0, 1, 1,
0.6704949, 1.325428, 0.6945243, 0.6627451, 0, 1, 1,
0.6758584, 0.1724945, 0.7705325, 0.6666667, 0, 1, 1,
0.678732, -0.751205, 2.188655, 0.6745098, 0, 1, 1,
0.6792884, 2.311213, -0.2192701, 0.6784314, 0, 1, 1,
0.6813793, 2.784586, -0.1059631, 0.6862745, 0, 1, 1,
0.6898271, 3.131051, 0.1727217, 0.6901961, 0, 1, 1,
0.6911588, 0.4154502, 1.064821, 0.6980392, 0, 1, 1,
0.6912633, 0.3440138, 1.189543, 0.7058824, 0, 1, 1,
0.7013009, -0.1282785, 3.544524, 0.7098039, 0, 1, 1,
0.7034637, 0.6216636, -0.2784338, 0.7176471, 0, 1, 1,
0.7054968, 0.708953, 1.488638, 0.7215686, 0, 1, 1,
0.710516, -2.792384, 3.956334, 0.7294118, 0, 1, 1,
0.7130316, 1.930907, 1.604974, 0.7333333, 0, 1, 1,
0.7309242, 0.1727538, 0.7056222, 0.7411765, 0, 1, 1,
0.7315928, 0.6215066, 2.893864, 0.7450981, 0, 1, 1,
0.7318009, 1.798133, 1.791997, 0.7529412, 0, 1, 1,
0.7365201, -0.363533, 2.462609, 0.7568628, 0, 1, 1,
0.7366901, -1.086318, 4.838574, 0.7647059, 0, 1, 1,
0.7387158, 1.854576, 1.726664, 0.7686275, 0, 1, 1,
0.7389362, 1.179389, 1.14788, 0.7764706, 0, 1, 1,
0.7423286, 0.2023471, 1.576476, 0.7803922, 0, 1, 1,
0.7447761, 1.07154, 0.9850648, 0.7882353, 0, 1, 1,
0.7458982, 0.2578114, 3.725702, 0.7921569, 0, 1, 1,
0.7467176, -0.628903, 1.555753, 0.8, 0, 1, 1,
0.7469984, 1.763784, 0.078415, 0.8078431, 0, 1, 1,
0.750374, 2.248807, 0.3442742, 0.8117647, 0, 1, 1,
0.7545799, 0.2219968, 1.396598, 0.8196079, 0, 1, 1,
0.7590994, 0.08240476, 1.728768, 0.8235294, 0, 1, 1,
0.7596518, -1.388179, 1.912353, 0.8313726, 0, 1, 1,
0.7604533, -1.271717, 2.343586, 0.8352941, 0, 1, 1,
0.7611824, 1.514998, 0.555261, 0.8431373, 0, 1, 1,
0.7614897, -0.7037753, 2.067511, 0.8470588, 0, 1, 1,
0.7616255, 0.8062685, 2.213905, 0.854902, 0, 1, 1,
0.7697533, -1.150194, 2.070366, 0.8588235, 0, 1, 1,
0.7730393, 0.04245245, 2.700748, 0.8666667, 0, 1, 1,
0.7732497, 0.6521434, -0.5483659, 0.8705882, 0, 1, 1,
0.7762592, -0.1832002, 0.9980578, 0.8784314, 0, 1, 1,
0.7793127, -1.584823, 0.2305734, 0.8823529, 0, 1, 1,
0.7833591, -1.103507, 2.15455, 0.8901961, 0, 1, 1,
0.7856233, -0.5530273, 2.931758, 0.8941177, 0, 1, 1,
0.7905496, 1.065405, -0.3773281, 0.9019608, 0, 1, 1,
0.7906287, 0.3500719, 0.7021677, 0.9098039, 0, 1, 1,
0.79503, 0.7524543, 0.9773868, 0.9137255, 0, 1, 1,
0.8058343, -0.4322012, 1.434749, 0.9215686, 0, 1, 1,
0.8151605, -0.6671758, -0.2622982, 0.9254902, 0, 1, 1,
0.825078, -1.321711, 2.87578, 0.9333333, 0, 1, 1,
0.8306091, -0.5073712, 1.445721, 0.9372549, 0, 1, 1,
0.8307818, 0.1248745, 2.028848, 0.945098, 0, 1, 1,
0.8331687, 0.8059403, -0.9776261, 0.9490196, 0, 1, 1,
0.8403693, -0.09017754, 1.647388, 0.9568627, 0, 1, 1,
0.841387, -0.6936659, 1.624207, 0.9607843, 0, 1, 1,
0.8444684, -0.210098, 3.954717, 0.9686275, 0, 1, 1,
0.8566433, 0.3452145, 0.3922226, 0.972549, 0, 1, 1,
0.8574815, -0.05601367, 2.398559, 0.9803922, 0, 1, 1,
0.8634644, -0.4601004, 1.694758, 0.9843137, 0, 1, 1,
0.8677049, -0.7562667, 0.9637889, 0.9921569, 0, 1, 1,
0.8699316, 0.810614, -0.1095088, 0.9960784, 0, 1, 1,
0.869932, 1.010844, 0.4884378, 1, 0, 0.9960784, 1,
0.8758802, 0.9619716, 1.935464, 1, 0, 0.9882353, 1,
0.8821363, 0.6723195, 0.8398654, 1, 0, 0.9843137, 1,
0.8866215, 0.6967998, -0.3017027, 1, 0, 0.9764706, 1,
0.8870691, 1.003549, -0.1072461, 1, 0, 0.972549, 1,
0.8873335, -0.9012856, 2.561173, 1, 0, 0.9647059, 1,
0.8912334, 0.778382, -0.133984, 1, 0, 0.9607843, 1,
0.9039222, -0.576418, 1.334614, 1, 0, 0.9529412, 1,
0.9049588, -0.1725625, 2.035253, 1, 0, 0.9490196, 1,
0.9134643, 0.8779563, 1.344356, 1, 0, 0.9411765, 1,
0.9175521, 0.3506972, 0.6508865, 1, 0, 0.9372549, 1,
0.9248549, 0.729577, 1.66064, 1, 0, 0.9294118, 1,
0.9258428, -0.001950547, 1.215902, 1, 0, 0.9254902, 1,
0.9298821, 1.030275, 1.065971, 1, 0, 0.9176471, 1,
0.9402869, 0.929104, 0.5070069, 1, 0, 0.9137255, 1,
0.9467099, 1.080444, -0.4490742, 1, 0, 0.9058824, 1,
0.9531946, 0.03390198, 1.387334, 1, 0, 0.9019608, 1,
0.957296, 1.718197, 0.5302078, 1, 0, 0.8941177, 1,
0.9634151, 0.4205379, 1.597905, 1, 0, 0.8862745, 1,
0.9650819, -0.5892111, 3.075924, 1, 0, 0.8823529, 1,
0.9747622, -0.4977054, 1.468097, 1, 0, 0.8745098, 1,
0.9947606, -1.675929, 1.464357, 1, 0, 0.8705882, 1,
0.9963093, -0.8381007, 2.897382, 1, 0, 0.8627451, 1,
1.009294, 1.195256, 1.122343, 1, 0, 0.8588235, 1,
1.010811, 0.9550061, 1.788751, 1, 0, 0.8509804, 1,
1.013576, -0.1665651, 1.673494, 1, 0, 0.8470588, 1,
1.018662, -1.850654, 2.731714, 1, 0, 0.8392157, 1,
1.02012, 1.686468, -0.1829481, 1, 0, 0.8352941, 1,
1.023507, -1.36065, 2.873868, 1, 0, 0.827451, 1,
1.024142, 0.06021579, 0.6181319, 1, 0, 0.8235294, 1,
1.033872, 0.653125, -1.728516, 1, 0, 0.8156863, 1,
1.045871, -1.804894, 2.124697, 1, 0, 0.8117647, 1,
1.047563, -0.1666548, 4.324039, 1, 0, 0.8039216, 1,
1.049965, 0.003134547, 1.071528, 1, 0, 0.7960784, 1,
1.058018, -2.033, 0.988055, 1, 0, 0.7921569, 1,
1.060037, 1.664159, 2.712542, 1, 0, 0.7843137, 1,
1.0607, 0.6849617, 1.346859, 1, 0, 0.7803922, 1,
1.061564, 0.5685362, 0.8871754, 1, 0, 0.772549, 1,
1.075251, -1.168728, 2.292341, 1, 0, 0.7686275, 1,
1.084908, -1.991341, 2.901158, 1, 0, 0.7607843, 1,
1.092005, -0.5533622, 1.739056, 1, 0, 0.7568628, 1,
1.103128, 0.8800723, 1.285924, 1, 0, 0.7490196, 1,
1.103165, -0.9853212, 1.239284, 1, 0, 0.7450981, 1,
1.116949, -0.7458494, 1.29921, 1, 0, 0.7372549, 1,
1.130116, 1.027642, -0.3846475, 1, 0, 0.7333333, 1,
1.134443, 1.476687, 2.300738, 1, 0, 0.7254902, 1,
1.151889, 0.4841398, 1.038743, 1, 0, 0.7215686, 1,
1.161757, 1.166524, 0.1727677, 1, 0, 0.7137255, 1,
1.163688, 0.2537234, 0.4353615, 1, 0, 0.7098039, 1,
1.17475, 0.8047315, 1.148342, 1, 0, 0.7019608, 1,
1.191022, 0.05336739, 1.321568, 1, 0, 0.6941177, 1,
1.191351, -0.44199, 0.3773437, 1, 0, 0.6901961, 1,
1.206974, 0.1289854, 0.1597373, 1, 0, 0.682353, 1,
1.210124, 2.053698, 1.059296, 1, 0, 0.6784314, 1,
1.213454, 0.7096871, 1.688801, 1, 0, 0.6705883, 1,
1.221304, -1.329728, 4.938941, 1, 0, 0.6666667, 1,
1.225377, -0.1234066, 2.163693, 1, 0, 0.6588235, 1,
1.233744, 1.130116, 1.201043, 1, 0, 0.654902, 1,
1.234432, 1.331917, -0.3543842, 1, 0, 0.6470588, 1,
1.247638, 0.8335582, -0.6852543, 1, 0, 0.6431373, 1,
1.24959, -0.5836079, 2.427127, 1, 0, 0.6352941, 1,
1.257208, 0.06492834, 0.9618421, 1, 0, 0.6313726, 1,
1.268562, -0.3336335, 1.813579, 1, 0, 0.6235294, 1,
1.275882, 1.685037, 2.286686, 1, 0, 0.6196079, 1,
1.277509, 1.153465, 0.8598713, 1, 0, 0.6117647, 1,
1.278302, 1.686097, -0.7425296, 1, 0, 0.6078432, 1,
1.288259, 0.1329675, 1.400155, 1, 0, 0.6, 1,
1.290559, -0.334646, 2.047866, 1, 0, 0.5921569, 1,
1.302068, -0.3720448, 1.866479, 1, 0, 0.5882353, 1,
1.372464, 0.6333074, 1.114148, 1, 0, 0.5803922, 1,
1.378695, -0.4545246, 1.196489, 1, 0, 0.5764706, 1,
1.379227, -1.00737, 2.15487, 1, 0, 0.5686275, 1,
1.384089, -1.702716, 2.192827, 1, 0, 0.5647059, 1,
1.395564, 1.573916, 1.6504, 1, 0, 0.5568628, 1,
1.397064, 1.750773, 0.8311895, 1, 0, 0.5529412, 1,
1.400636, 0.1948969, 0.9097806, 1, 0, 0.5450981, 1,
1.401413, -1.199758, 1.678882, 1, 0, 0.5411765, 1,
1.404211, -2.440242, 2.858918, 1, 0, 0.5333334, 1,
1.415956, -1.444937, 1.795565, 1, 0, 0.5294118, 1,
1.419629, 1.377643, 0.7968562, 1, 0, 0.5215687, 1,
1.425404, -0.1805996, 0.51077, 1, 0, 0.5176471, 1,
1.429966, 1.305076, -0.6044795, 1, 0, 0.509804, 1,
1.447981, 0.6273451, 2.003117, 1, 0, 0.5058824, 1,
1.453845, -0.1681545, 0.5797976, 1, 0, 0.4980392, 1,
1.462104, 0.2000731, 1.009108, 1, 0, 0.4901961, 1,
1.464021, 1.015567, 0.9360317, 1, 0, 0.4862745, 1,
1.464206, -0.1015729, 1.025014, 1, 0, 0.4784314, 1,
1.46764, 1.596733, 1.320654, 1, 0, 0.4745098, 1,
1.47216, 0.02571939, 0.6837351, 1, 0, 0.4666667, 1,
1.492454, 1.585985, 1.841019, 1, 0, 0.4627451, 1,
1.496647, -1.163447, 3.585997, 1, 0, 0.454902, 1,
1.507036, -0.9283792, 1.337661, 1, 0, 0.4509804, 1,
1.509332, 0.03335765, 0.96416, 1, 0, 0.4431373, 1,
1.518169, 1.141485, 1.297966, 1, 0, 0.4392157, 1,
1.523047, 1.125602, 0.565622, 1, 0, 0.4313726, 1,
1.541616, 0.07457805, 3.488376, 1, 0, 0.427451, 1,
1.542143, 0.86948, 1.733555, 1, 0, 0.4196078, 1,
1.542813, -0.2681601, 3.951969, 1, 0, 0.4156863, 1,
1.549694, -1.496389, 2.521015, 1, 0, 0.4078431, 1,
1.569984, -0.7666997, 2.594449, 1, 0, 0.4039216, 1,
1.572411, -0.8405649, 2.015659, 1, 0, 0.3960784, 1,
1.585389, 0.5694848, 2.118345, 1, 0, 0.3882353, 1,
1.58759, -0.9209047, 1.387893, 1, 0, 0.3843137, 1,
1.595698, -2.106059, 2.645601, 1, 0, 0.3764706, 1,
1.597131, -0.5772266, 0.2542574, 1, 0, 0.372549, 1,
1.599738, 0.6178269, 0.2089472, 1, 0, 0.3647059, 1,
1.599816, 0.0340398, 1.755163, 1, 0, 0.3607843, 1,
1.611585, -0.2202563, 2.168386, 1, 0, 0.3529412, 1,
1.61175, 0.9596515, 1.635438, 1, 0, 0.3490196, 1,
1.626498, -0.2799903, 3.078362, 1, 0, 0.3411765, 1,
1.631247, 0.9560689, 1.297575, 1, 0, 0.3372549, 1,
1.633635, 1.74793, 0.6145524, 1, 0, 0.3294118, 1,
1.646822, 1.353754, 0.83886, 1, 0, 0.3254902, 1,
1.655749, -0.5752047, 3.020784, 1, 0, 0.3176471, 1,
1.674891, 1.611121, -0.75054, 1, 0, 0.3137255, 1,
1.674938, 1.127539, 2.182357, 1, 0, 0.3058824, 1,
1.67571, 0.3911112, 1.781604, 1, 0, 0.2980392, 1,
1.678263, 0.9344591, 0.6252458, 1, 0, 0.2941177, 1,
1.681511, 0.4429638, 0.3924423, 1, 0, 0.2862745, 1,
1.697285, -0.9931042, 4.075657, 1, 0, 0.282353, 1,
1.700009, -0.5825167, 0.9518086, 1, 0, 0.2745098, 1,
1.730437, 0.567585, 0.7016802, 1, 0, 0.2705882, 1,
1.734262, 2.524359, -0.2140751, 1, 0, 0.2627451, 1,
1.74155, 0.2189668, 0.8213833, 1, 0, 0.2588235, 1,
1.749444, 0.2774407, 0.709396, 1, 0, 0.2509804, 1,
1.754208, 0.186985, 2.256117, 1, 0, 0.2470588, 1,
1.755937, 0.1305496, 0.748936, 1, 0, 0.2392157, 1,
1.766972, 1.415334, 1.572535, 1, 0, 0.2352941, 1,
1.778687, 1.069204, 0.8454156, 1, 0, 0.227451, 1,
1.784795, -0.5111191, 0.9486371, 1, 0, 0.2235294, 1,
1.789071, 0.2813949, 2.323396, 1, 0, 0.2156863, 1,
1.795609, 0.8262945, 2.709558, 1, 0, 0.2117647, 1,
1.797412, -0.5891793, -0.04098393, 1, 0, 0.2039216, 1,
1.817752, 1.680896, 2.574932, 1, 0, 0.1960784, 1,
1.867357, -2.258808, 0.5999354, 1, 0, 0.1921569, 1,
1.894941, -0.4307844, 1.017771, 1, 0, 0.1843137, 1,
1.899979, -0.273746, 2.277343, 1, 0, 0.1803922, 1,
1.908217, 0.2633716, 3.092889, 1, 0, 0.172549, 1,
1.913164, 0.6855519, 0.3368323, 1, 0, 0.1686275, 1,
1.932047, 0.6467884, 3.310262, 1, 0, 0.1607843, 1,
1.947837, 0.8690604, 0.2406878, 1, 0, 0.1568628, 1,
1.958541, -0.4846405, 1.783111, 1, 0, 0.1490196, 1,
1.966438, -0.5690138, 3.497555, 1, 0, 0.145098, 1,
2.003296, 1.488724, 1.665649, 1, 0, 0.1372549, 1,
2.010338, -1.599768, 2.62466, 1, 0, 0.1333333, 1,
2.046449, 1.503242, 1.212067, 1, 0, 0.1254902, 1,
2.049415, 0.2189543, -0.1970251, 1, 0, 0.1215686, 1,
2.061077, -0.01944371, 1.56786, 1, 0, 0.1137255, 1,
2.062357, 0.6191186, 1.622693, 1, 0, 0.1098039, 1,
2.099141, 1.084019, 0.3878477, 1, 0, 0.1019608, 1,
2.106282, 1.28043, 1.065579, 1, 0, 0.09411765, 1,
2.121588, 0.5406373, 1.496289, 1, 0, 0.09019608, 1,
2.138182, 0.9787065, 0.4299688, 1, 0, 0.08235294, 1,
2.140545, 0.6339567, 0.8278873, 1, 0, 0.07843138, 1,
2.204656, 0.1108331, 1.094299, 1, 0, 0.07058824, 1,
2.235827, -0.3403531, 0.4025878, 1, 0, 0.06666667, 1,
2.288062, -0.1581856, 0.7775716, 1, 0, 0.05882353, 1,
2.325814, 1.818133, 0.917949, 1, 0, 0.05490196, 1,
2.344753, 1.646593, 1.551724, 1, 0, 0.04705882, 1,
2.376295, 1.222544, 2.519275, 1, 0, 0.04313726, 1,
2.426903, -0.4433201, 0.7437407, 1, 0, 0.03529412, 1,
2.471015, -0.574169, 2.08933, 1, 0, 0.03137255, 1,
2.719463, 0.6174234, -1.470381, 1, 0, 0.02352941, 1,
2.760419, 0.3255772, 2.062848, 1, 0, 0.01960784, 1,
2.769737, 0.4515633, 2.943907, 1, 0, 0.01176471, 1,
2.896629, -1.906963, 0.9351378, 1, 0, 0.007843138, 1
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
-0.3204271, -4.363409, -6.604655, 0, -0.5, 0.5, 0.5,
-0.3204271, -4.363409, -6.604655, 1, -0.5, 0.5, 0.5,
-0.3204271, -4.363409, -6.604655, 1, 1.5, 0.5, 0.5,
-0.3204271, -4.363409, -6.604655, 0, 1.5, 0.5, 0.5
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
-4.628065, 0.04871356, -6.604655, 0, -0.5, 0.5, 0.5,
-4.628065, 0.04871356, -6.604655, 1, -0.5, 0.5, 0.5,
-4.628065, 0.04871356, -6.604655, 1, 1.5, 0.5, 0.5,
-4.628065, 0.04871356, -6.604655, 0, 1.5, 0.5, 0.5
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
-4.628065, -4.363409, 0.1107774, 0, -0.5, 0.5, 0.5,
-4.628065, -4.363409, 0.1107774, 1, -0.5, 0.5, 0.5,
-4.628065, -4.363409, 0.1107774, 1, 1.5, 0.5, 0.5,
-4.628065, -4.363409, 0.1107774, 0, 1.5, 0.5, 0.5
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
-3, -3.345227, -5.05494,
2, -3.345227, -5.05494,
-3, -3.345227, -5.05494,
-3, -3.514924, -5.313226,
-2, -3.345227, -5.05494,
-2, -3.514924, -5.313226,
-1, -3.345227, -5.05494,
-1, -3.514924, -5.313226,
0, -3.345227, -5.05494,
0, -3.514924, -5.313226,
1, -3.345227, -5.05494,
1, -3.514924, -5.313226,
2, -3.345227, -5.05494,
2, -3.514924, -5.313226
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
-3, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
-3, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
-3, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
-3, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5,
-2, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
-2, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
-2, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
-2, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5,
-1, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
-1, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
-1, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
-1, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5,
0, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
0, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
0, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
0, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5,
1, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
1, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
1, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
1, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5,
2, -3.854318, -5.829798, 0, -0.5, 0.5, 0.5,
2, -3.854318, -5.829798, 1, -0.5, 0.5, 0.5,
2, -3.854318, -5.829798, 1, 1.5, 0.5, 0.5,
2, -3.854318, -5.829798, 0, 1.5, 0.5, 0.5
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
-3.633995, -3, -5.05494,
-3.633995, 3, -5.05494,
-3.633995, -3, -5.05494,
-3.799673, -3, -5.313226,
-3.633995, -2, -5.05494,
-3.799673, -2, -5.313226,
-3.633995, -1, -5.05494,
-3.799673, -1, -5.313226,
-3.633995, 0, -5.05494,
-3.799673, 0, -5.313226,
-3.633995, 1, -5.05494,
-3.799673, 1, -5.313226,
-3.633995, 2, -5.05494,
-3.799673, 2, -5.313226,
-3.633995, 3, -5.05494,
-3.799673, 3, -5.313226
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
-4.13103, -3, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, -3, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, -3, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, -3, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, -2, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, -2, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, -2, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, -2, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, -1, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, -1, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, -1, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, -1, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, 0, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, 0, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, 0, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, 0, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, 1, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, 1, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, 1, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, 1, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, 2, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, 2, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, 2, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, 2, -5.829798, 0, 1.5, 0.5, 0.5,
-4.13103, 3, -5.829798, 0, -0.5, 0.5, 0.5,
-4.13103, 3, -5.829798, 1, -0.5, 0.5, 0.5,
-4.13103, 3, -5.829798, 1, 1.5, 0.5, 0.5,
-4.13103, 3, -5.829798, 0, 1.5, 0.5, 0.5
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
-3.633995, -3.345227, -4,
-3.633995, -3.345227, 4,
-3.633995, -3.345227, -4,
-3.799673, -3.514924, -4,
-3.633995, -3.345227, -2,
-3.799673, -3.514924, -2,
-3.633995, -3.345227, 0,
-3.799673, -3.514924, 0,
-3.633995, -3.345227, 2,
-3.799673, -3.514924, 2,
-3.633995, -3.345227, 4,
-3.799673, -3.514924, 4
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
-4.13103, -3.854318, -4, 0, -0.5, 0.5, 0.5,
-4.13103, -3.854318, -4, 1, -0.5, 0.5, 0.5,
-4.13103, -3.854318, -4, 1, 1.5, 0.5, 0.5,
-4.13103, -3.854318, -4, 0, 1.5, 0.5, 0.5,
-4.13103, -3.854318, -2, 0, -0.5, 0.5, 0.5,
-4.13103, -3.854318, -2, 1, -0.5, 0.5, 0.5,
-4.13103, -3.854318, -2, 1, 1.5, 0.5, 0.5,
-4.13103, -3.854318, -2, 0, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 0, 0, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 0, 1, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 0, 1, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 0, 0, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 2, 0, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 2, 1, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 2, 1, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 2, 0, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 4, 0, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 4, 1, -0.5, 0.5, 0.5,
-4.13103, -3.854318, 4, 1, 1.5, 0.5, 0.5,
-4.13103, -3.854318, 4, 0, 1.5, 0.5, 0.5
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
-3.633995, -3.345227, -5.05494,
-3.633995, 3.442654, -5.05494,
-3.633995, -3.345227, 5.276495,
-3.633995, 3.442654, 5.276495,
-3.633995, -3.345227, -5.05494,
-3.633995, -3.345227, 5.276495,
-3.633995, 3.442654, -5.05494,
-3.633995, 3.442654, 5.276495,
-3.633995, -3.345227, -5.05494,
2.99314, -3.345227, -5.05494,
-3.633995, -3.345227, 5.276495,
2.99314, -3.345227, 5.276495,
-3.633995, 3.442654, -5.05494,
2.99314, 3.442654, -5.05494,
-3.633995, 3.442654, 5.276495,
2.99314, 3.442654, 5.276495,
2.99314, -3.345227, -5.05494,
2.99314, 3.442654, -5.05494,
2.99314, -3.345227, 5.276495,
2.99314, 3.442654, 5.276495,
2.99314, -3.345227, -5.05494,
2.99314, -3.345227, 5.276495,
2.99314, 3.442654, -5.05494,
2.99314, 3.442654, 5.276495
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
var radius = 7.48969;
var distance = 33.32248;
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
mvMatrix.translate( 0.3204271, -0.04871356, -0.1107774 );
mvMatrix.scale( 1.221946, 1.193009, 0.7838214 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32248);
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

