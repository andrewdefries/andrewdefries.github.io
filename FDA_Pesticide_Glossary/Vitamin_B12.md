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
-3.244304, 1.125499, -0.3902364, 1, 0, 0, 1,
-2.8785, -1.264786, -1.557735, 1, 0.007843138, 0, 1,
-2.672118, 0.5915565, -3.048284, 1, 0.01176471, 0, 1,
-2.615532, -1.652786, -1.091574, 1, 0.01960784, 0, 1,
-2.572286, -1.293579, -2.606931, 1, 0.02352941, 0, 1,
-2.539627, 1.521411, -0.7065035, 1, 0.03137255, 0, 1,
-2.482612, -0.7076489, -1.921225, 1, 0.03529412, 0, 1,
-2.444777, -0.8371338, -1.373593, 1, 0.04313726, 0, 1,
-2.422993, 0.5443909, -2.73936, 1, 0.04705882, 0, 1,
-2.414315, 0.2376539, -1.989904, 1, 0.05490196, 0, 1,
-2.386225, 0.9323038, -0.01787578, 1, 0.05882353, 0, 1,
-2.348286, 0.4364933, -1.672202, 1, 0.06666667, 0, 1,
-2.339721, -1.067376, -1.444807, 1, 0.07058824, 0, 1,
-2.307306, -0.7968224, -3.692261, 1, 0.07843138, 0, 1,
-2.294388, -1.453133, -0.6193305, 1, 0.08235294, 0, 1,
-2.281222, 2.770454, -1.425477, 1, 0.09019608, 0, 1,
-2.260862, 0.7558053, -3.197281, 1, 0.09411765, 0, 1,
-2.254278, 0.1258874, -2.919003, 1, 0.1019608, 0, 1,
-2.251967, 0.5926755, -1.073563, 1, 0.1098039, 0, 1,
-2.237467, -2.597591, -2.271282, 1, 0.1137255, 0, 1,
-2.215382, -0.6222453, -2.651585, 1, 0.1215686, 0, 1,
-2.204636, -0.7823626, -3.237244, 1, 0.1254902, 0, 1,
-2.115888, -0.04831231, -2.649478, 1, 0.1333333, 0, 1,
-2.109385, 0.5487609, -1.579824, 1, 0.1372549, 0, 1,
-2.078974, -0.99362, -0.4002591, 1, 0.145098, 0, 1,
-2.072114, 0.4992729, -2.336965, 1, 0.1490196, 0, 1,
-2.051447, 1.640833, -0.4043722, 1, 0.1568628, 0, 1,
-2.001194, -1.013716, -1.473984, 1, 0.1607843, 0, 1,
-1.974243, -0.6873724, -1.698834, 1, 0.1686275, 0, 1,
-1.967937, -1.026043, -3.164936, 1, 0.172549, 0, 1,
-1.964404, 1.041358, -0.2021031, 1, 0.1803922, 0, 1,
-1.956384, -0.2767355, -2.070875, 1, 0.1843137, 0, 1,
-1.940815, -0.67199, -3.010424, 1, 0.1921569, 0, 1,
-1.940165, -0.7133078, -2.692408, 1, 0.1960784, 0, 1,
-1.931392, -0.3585794, 0.03436884, 1, 0.2039216, 0, 1,
-1.928474, -0.4467698, -0.7758967, 1, 0.2117647, 0, 1,
-1.925807, -0.8077536, -1.805182, 1, 0.2156863, 0, 1,
-1.912588, 0.6513597, -1.296483, 1, 0.2235294, 0, 1,
-1.90288, -0.4221438, -3.042573, 1, 0.227451, 0, 1,
-1.879357, -0.1173972, -1.446918, 1, 0.2352941, 0, 1,
-1.871315, 0.4259958, 0.3170148, 1, 0.2392157, 0, 1,
-1.834637, -0.118748, -0.8635158, 1, 0.2470588, 0, 1,
-1.802846, 1.285547, -1.652734, 1, 0.2509804, 0, 1,
-1.802747, 1.538651, -1.222065, 1, 0.2588235, 0, 1,
-1.787218, 0.9429821, -0.7531109, 1, 0.2627451, 0, 1,
-1.786727, 0.4260913, -2.024559, 1, 0.2705882, 0, 1,
-1.768651, -1.847883, -2.916686, 1, 0.2745098, 0, 1,
-1.740026, 1.229302, -1.072626, 1, 0.282353, 0, 1,
-1.739021, -0.279714, -2.888592, 1, 0.2862745, 0, 1,
-1.725862, -1.302563, -2.133043, 1, 0.2941177, 0, 1,
-1.719741, -0.7155957, -3.125912, 1, 0.3019608, 0, 1,
-1.71663, -0.4831445, -2.30286, 1, 0.3058824, 0, 1,
-1.709942, 3.127469, -1.430837, 1, 0.3137255, 0, 1,
-1.708268, -0.3707165, -1.866313, 1, 0.3176471, 0, 1,
-1.69388, 0.3966061, 0.4432257, 1, 0.3254902, 0, 1,
-1.65651, 1.260222, -1.738784, 1, 0.3294118, 0, 1,
-1.645564, 0.3475963, -0.4621061, 1, 0.3372549, 0, 1,
-1.64221, -0.623173, -3.378891, 1, 0.3411765, 0, 1,
-1.639623, 1.54475, -3.145766, 1, 0.3490196, 0, 1,
-1.635782, 1.169885, -2.176328, 1, 0.3529412, 0, 1,
-1.618531, -2.101609, -2.542544, 1, 0.3607843, 0, 1,
-1.610787, -1.113032, -4.091517, 1, 0.3647059, 0, 1,
-1.600813, 1.377656, -0.9402139, 1, 0.372549, 0, 1,
-1.597503, 0.2363571, -1.987357, 1, 0.3764706, 0, 1,
-1.589227, 0.7914467, -0.5673545, 1, 0.3843137, 0, 1,
-1.587164, -1.385759, -2.145117, 1, 0.3882353, 0, 1,
-1.586819, -1.26079, -2.76144, 1, 0.3960784, 0, 1,
-1.583166, 1.801626, 2.069352, 1, 0.4039216, 0, 1,
-1.577235, -0.2372359, -1.220262, 1, 0.4078431, 0, 1,
-1.565784, 1.509344, 1.123075, 1, 0.4156863, 0, 1,
-1.546387, 0.1838533, -3.073171, 1, 0.4196078, 0, 1,
-1.546296, -1.052951, -0.512741, 1, 0.427451, 0, 1,
-1.546276, 0.1834467, -2.789173, 1, 0.4313726, 0, 1,
-1.534674, 1.834078, -0.8147444, 1, 0.4392157, 0, 1,
-1.519926, -0.7399925, -0.1400208, 1, 0.4431373, 0, 1,
-1.51816, -0.4497769, -1.083838, 1, 0.4509804, 0, 1,
-1.514423, -0.4254604, -0.9428984, 1, 0.454902, 0, 1,
-1.506359, 0.3163412, -2.92996, 1, 0.4627451, 0, 1,
-1.497867, 0.03432175, -0.4698076, 1, 0.4666667, 0, 1,
-1.491198, 0.08250227, -1.569921, 1, 0.4745098, 0, 1,
-1.480877, 0.3763378, -2.548559, 1, 0.4784314, 0, 1,
-1.454247, 0.3776819, -3.616273, 1, 0.4862745, 0, 1,
-1.452946, -0.04886042, -0.9642243, 1, 0.4901961, 0, 1,
-1.450478, 1.822143, -0.03955729, 1, 0.4980392, 0, 1,
-1.440701, 0.1468665, -0.90795, 1, 0.5058824, 0, 1,
-1.436821, 0.7867117, -0.6844717, 1, 0.509804, 0, 1,
-1.424331, -2.560804, -1.888827, 1, 0.5176471, 0, 1,
-1.416713, 0.3376917, -0.4860593, 1, 0.5215687, 0, 1,
-1.407711, -0.7675257, -2.518845, 1, 0.5294118, 0, 1,
-1.405962, 0.4728311, -2.427279, 1, 0.5333334, 0, 1,
-1.394717, 0.5301375, -0.7678405, 1, 0.5411765, 0, 1,
-1.392869, 0.1967936, -2.39897, 1, 0.5450981, 0, 1,
-1.389898, 0.9849467, -0.5581759, 1, 0.5529412, 0, 1,
-1.387606, 0.8423758, -0.7652675, 1, 0.5568628, 0, 1,
-1.385745, 0.7248179, -0.8509203, 1, 0.5647059, 0, 1,
-1.38398, -0.2193104, -0.03267473, 1, 0.5686275, 0, 1,
-1.358964, 1.035124, -1.158738, 1, 0.5764706, 0, 1,
-1.355707, -0.4805183, -1.828468, 1, 0.5803922, 0, 1,
-1.340116, 1.271896, -0.03147342, 1, 0.5882353, 0, 1,
-1.337532, 1.656929, -0.9522821, 1, 0.5921569, 0, 1,
-1.330187, 0.36062, -1.350591, 1, 0.6, 0, 1,
-1.329889, -1.177375, 0.8344195, 1, 0.6078432, 0, 1,
-1.32684, -2.378571, -4.015936, 1, 0.6117647, 0, 1,
-1.316356, -0.7144895, -3.199657, 1, 0.6196079, 0, 1,
-1.293276, -0.06413157, -1.93708, 1, 0.6235294, 0, 1,
-1.265268, -0.6578488, -2.668151, 1, 0.6313726, 0, 1,
-1.258518, -1.142475, -3.178765, 1, 0.6352941, 0, 1,
-1.252985, -0.8997662, -1.713217, 1, 0.6431373, 0, 1,
-1.234519, 0.2867654, -0.4286206, 1, 0.6470588, 0, 1,
-1.226711, 0.1717243, -1.543852, 1, 0.654902, 0, 1,
-1.218696, -2.851605, -3.31059, 1, 0.6588235, 0, 1,
-1.218392, -0.9942721, -2.051404, 1, 0.6666667, 0, 1,
-1.215781, -1.215381, -0.884609, 1, 0.6705883, 0, 1,
-1.201342, -0.4948362, -1.456209, 1, 0.6784314, 0, 1,
-1.197916, -0.3411227, -1.316008, 1, 0.682353, 0, 1,
-1.18303, -0.6887708, -1.6331, 1, 0.6901961, 0, 1,
-1.163054, 0.7464071, -1.904804, 1, 0.6941177, 0, 1,
-1.158988, -0.02623137, -1.635552, 1, 0.7019608, 0, 1,
-1.151799, -0.1103077, -1.715571, 1, 0.7098039, 0, 1,
-1.149865, -1.672597, -4.540048, 1, 0.7137255, 0, 1,
-1.146981, -0.642012, -2.892173, 1, 0.7215686, 0, 1,
-1.14106, -0.5706904, -1.240727, 1, 0.7254902, 0, 1,
-1.139212, 0.1337089, -3.561979, 1, 0.7333333, 0, 1,
-1.134136, 0.586988, 0.4593077, 1, 0.7372549, 0, 1,
-1.134083, 1.001908, -1.267561, 1, 0.7450981, 0, 1,
-1.124249, -0.9818249, -2.97452, 1, 0.7490196, 0, 1,
-1.114191, 0.3300102, -0.3634217, 1, 0.7568628, 0, 1,
-1.113842, -0.8160261, -1.405771, 1, 0.7607843, 0, 1,
-1.108909, 0.6176035, -1.739685, 1, 0.7686275, 0, 1,
-1.106705, -0.3096149, 0.3937702, 1, 0.772549, 0, 1,
-1.101285, 0.4094591, -1.201722, 1, 0.7803922, 0, 1,
-1.10063, -1.094184, -1.415179, 1, 0.7843137, 0, 1,
-1.098283, -1.138788, -0.9317248, 1, 0.7921569, 0, 1,
-1.096669, -1.037178, -2.612598, 1, 0.7960784, 0, 1,
-1.083025, -0.2622804, -2.450847, 1, 0.8039216, 0, 1,
-1.068496, -0.6199389, -1.874115, 1, 0.8117647, 0, 1,
-1.058921, 1.484126, 1.541074, 1, 0.8156863, 0, 1,
-1.058756, -1.184119, -2.417951, 1, 0.8235294, 0, 1,
-1.055298, 0.5218424, 0.7247028, 1, 0.827451, 0, 1,
-1.052871, 1.100719, -1.522437, 1, 0.8352941, 0, 1,
-1.043248, -0.298067, -1.301562, 1, 0.8392157, 0, 1,
-1.03673, 1.566781, -1.295593, 1, 0.8470588, 0, 1,
-1.025981, 1.248867, 1.618587, 1, 0.8509804, 0, 1,
-1.017018, 1.135787, -2.937902, 1, 0.8588235, 0, 1,
-1.008251, 0.8377738, 0.91827, 1, 0.8627451, 0, 1,
-1.006311, 0.421853, -1.046194, 1, 0.8705882, 0, 1,
-1.004414, -1.145899, -2.016999, 1, 0.8745098, 0, 1,
-1.000927, 0.6477709, -2.349231, 1, 0.8823529, 0, 1,
-0.9986704, -0.397498, -0.8035903, 1, 0.8862745, 0, 1,
-0.9924953, -0.418095, -2.90954, 1, 0.8941177, 0, 1,
-0.9879396, -0.007405986, -2.929419, 1, 0.8980392, 0, 1,
-0.9878252, 0.4628032, -1.697757, 1, 0.9058824, 0, 1,
-0.9876618, -0.8062618, -2.932754, 1, 0.9137255, 0, 1,
-0.986621, -0.06933326, -0.8014397, 1, 0.9176471, 0, 1,
-0.985449, -0.1406603, -2.198951, 1, 0.9254902, 0, 1,
-0.9853566, 0.8941624, -0.7137524, 1, 0.9294118, 0, 1,
-0.9847178, 0.0516528, -1.453035, 1, 0.9372549, 0, 1,
-0.9834622, -1.861778, -2.508775, 1, 0.9411765, 0, 1,
-0.97961, -0.1838837, -2.781204, 1, 0.9490196, 0, 1,
-0.9755817, 0.2225381, -1.770883, 1, 0.9529412, 0, 1,
-0.9744867, 0.04487048, -1.425695, 1, 0.9607843, 0, 1,
-0.972946, 1.780248, -0.01144143, 1, 0.9647059, 0, 1,
-0.9729438, -1.632773, -4.038097, 1, 0.972549, 0, 1,
-0.9641855, -0.4941248, -1.620736, 1, 0.9764706, 0, 1,
-0.9568989, 1.099586, -0.4704704, 1, 0.9843137, 0, 1,
-0.9484242, 0.06107632, -1.950857, 1, 0.9882353, 0, 1,
-0.9481781, 0.4568363, -0.5664831, 1, 0.9960784, 0, 1,
-0.9444727, -0.2205259, -0.5144891, 0.9960784, 1, 0, 1,
-0.943256, -0.3916523, -0.7802866, 0.9921569, 1, 0, 1,
-0.942407, 1.898772, -0.4859082, 0.9843137, 1, 0, 1,
-0.9401651, -0.4519863, -2.164656, 0.9803922, 1, 0, 1,
-0.9327942, 0.1140668, -0.4042128, 0.972549, 1, 0, 1,
-0.9291267, 0.04060054, -2.024285, 0.9686275, 1, 0, 1,
-0.923458, 0.4723296, -0.5105811, 0.9607843, 1, 0, 1,
-0.9211745, 0.8365016, -0.7308868, 0.9568627, 1, 0, 1,
-0.9205632, 1.260643, -0.6803878, 0.9490196, 1, 0, 1,
-0.9202202, 0.9516023, -1.82417, 0.945098, 1, 0, 1,
-0.9171246, -1.344089, -1.197924, 0.9372549, 1, 0, 1,
-0.9166967, 0.07207981, -0.9678111, 0.9333333, 1, 0, 1,
-0.9092246, -1.174209, -1.841514, 0.9254902, 1, 0, 1,
-0.9082898, -1.56263, -4.389774, 0.9215686, 1, 0, 1,
-0.9056024, -0.503152, -2.642509, 0.9137255, 1, 0, 1,
-0.8975147, 1.201177, -0.7938594, 0.9098039, 1, 0, 1,
-0.8915979, 0.8309352, -0.7185212, 0.9019608, 1, 0, 1,
-0.8883688, 0.9980445, 0.8241684, 0.8941177, 1, 0, 1,
-0.8880122, 1.144297, -1.048139, 0.8901961, 1, 0, 1,
-0.8873079, -1.30146, -3.266711, 0.8823529, 1, 0, 1,
-0.8856277, 1.232694, -0.9868566, 0.8784314, 1, 0, 1,
-0.8713536, -0.0720048, -2.096701, 0.8705882, 1, 0, 1,
-0.8697016, 0.9465756, -0.1734853, 0.8666667, 1, 0, 1,
-0.8690128, 1.060464, -0.5635149, 0.8588235, 1, 0, 1,
-0.8677089, 1.047265, 0.2599365, 0.854902, 1, 0, 1,
-0.8674811, -0.526054, -1.733695, 0.8470588, 1, 0, 1,
-0.8632576, 0.2495565, -1.229824, 0.8431373, 1, 0, 1,
-0.8566508, 0.4220735, -1.296428, 0.8352941, 1, 0, 1,
-0.8563679, -0.6597773, -3.282529, 0.8313726, 1, 0, 1,
-0.8524626, 0.1392528, -2.30757, 0.8235294, 1, 0, 1,
-0.8501281, 1.469436, -1.451959, 0.8196079, 1, 0, 1,
-0.8416758, 2.256679, 0.639604, 0.8117647, 1, 0, 1,
-0.8390005, -0.6455479, -0.7562717, 0.8078431, 1, 0, 1,
-0.8321393, 0.2395047, -2.521849, 0.8, 1, 0, 1,
-0.8294322, -1.325357, -1.884935, 0.7921569, 1, 0, 1,
-0.8286594, -1.47888, -4.21761, 0.7882353, 1, 0, 1,
-0.8277065, -0.3442833, -2.245476, 0.7803922, 1, 0, 1,
-0.8244817, -0.4966212, -4.11444, 0.7764706, 1, 0, 1,
-0.8236861, -0.4452142, -1.15399, 0.7686275, 1, 0, 1,
-0.8213193, -0.1152579, -0.4169746, 0.7647059, 1, 0, 1,
-0.8182359, 1.079144, -1.122475, 0.7568628, 1, 0, 1,
-0.8113266, 0.1988653, -1.94689, 0.7529412, 1, 0, 1,
-0.8058162, -1.785873, -3.521945, 0.7450981, 1, 0, 1,
-0.8014004, -0.4670208, -1.48542, 0.7411765, 1, 0, 1,
-0.7996954, -0.126134, -3.098091, 0.7333333, 1, 0, 1,
-0.7935668, 0.8592114, 1.625056, 0.7294118, 1, 0, 1,
-0.7885376, -1.956365, -3.928563, 0.7215686, 1, 0, 1,
-0.7873099, -0.2080762, -3.125164, 0.7176471, 1, 0, 1,
-0.7841082, 1.708957, 0.2251482, 0.7098039, 1, 0, 1,
-0.7806109, -1.400881, -3.099041, 0.7058824, 1, 0, 1,
-0.7755927, -2.368541, -3.360229, 0.6980392, 1, 0, 1,
-0.7705194, -0.6278162, -2.822746, 0.6901961, 1, 0, 1,
-0.7694871, 0.5416248, -2.187389, 0.6862745, 1, 0, 1,
-0.765721, -0.00373104, -1.366637, 0.6784314, 1, 0, 1,
-0.7516522, -0.05850164, -2.550199, 0.6745098, 1, 0, 1,
-0.7444983, -0.2367023, -1.689758, 0.6666667, 1, 0, 1,
-0.7283, 1.298217, -0.1333014, 0.6627451, 1, 0, 1,
-0.7243627, 0.5835627, -1.822177, 0.654902, 1, 0, 1,
-0.7236196, 0.02957978, -0.3505231, 0.6509804, 1, 0, 1,
-0.7227226, 0.9780181, -0.1167871, 0.6431373, 1, 0, 1,
-0.7201709, -1.760549, -2.296624, 0.6392157, 1, 0, 1,
-0.7053881, -0.2557857, -2.979815, 0.6313726, 1, 0, 1,
-0.6979612, -1.871388, -0.343304, 0.627451, 1, 0, 1,
-0.6904959, -0.5549269, -3.78459, 0.6196079, 1, 0, 1,
-0.6895036, 1.562005, 1.825944, 0.6156863, 1, 0, 1,
-0.6893613, 2.77091, -0.9412259, 0.6078432, 1, 0, 1,
-0.6886489, 2.647165, 0.8966335, 0.6039216, 1, 0, 1,
-0.6872929, -1.37004, -2.410437, 0.5960785, 1, 0, 1,
-0.6758099, -0.6384587, -3.252557, 0.5882353, 1, 0, 1,
-0.6649399, -0.2832069, -2.892264, 0.5843138, 1, 0, 1,
-0.664511, 0.8244272, 0.7114918, 0.5764706, 1, 0, 1,
-0.6637892, 1.271308, 0.2671053, 0.572549, 1, 0, 1,
-0.6617931, -1.547677, -2.570088, 0.5647059, 1, 0, 1,
-0.6577974, -0.2496191, -3.744143, 0.5607843, 1, 0, 1,
-0.6572503, 1.187986, -0.01149972, 0.5529412, 1, 0, 1,
-0.6556253, -1.382976, -2.802684, 0.5490196, 1, 0, 1,
-0.6448995, 2.011987, -0.2094445, 0.5411765, 1, 0, 1,
-0.641528, -0.7423126, -3.313456, 0.5372549, 1, 0, 1,
-0.6377851, -0.5019509, -3.262712, 0.5294118, 1, 0, 1,
-0.6373785, 1.064877, -1.242973, 0.5254902, 1, 0, 1,
-0.6363443, -1.029876, -3.241115, 0.5176471, 1, 0, 1,
-0.633132, 0.06945695, -3.13283, 0.5137255, 1, 0, 1,
-0.629824, -0.9209114, -3.327278, 0.5058824, 1, 0, 1,
-0.6292189, -0.5188259, -1.297731, 0.5019608, 1, 0, 1,
-0.6281145, 0.6039454, -2.129075, 0.4941176, 1, 0, 1,
-0.6155522, 0.8788119, 0.7498641, 0.4862745, 1, 0, 1,
-0.6132114, -0.7001488, -4.433605, 0.4823529, 1, 0, 1,
-0.6105635, 0.4530034, 0.7292907, 0.4745098, 1, 0, 1,
-0.607971, 1.608649, 0.747785, 0.4705882, 1, 0, 1,
-0.60707, 0.4906947, -1.730679, 0.4627451, 1, 0, 1,
-0.6063547, 0.4213697, -1.129778, 0.4588235, 1, 0, 1,
-0.6055815, -0.2606296, -3.319418, 0.4509804, 1, 0, 1,
-0.6028971, 0.4250527, 0.2065333, 0.4470588, 1, 0, 1,
-0.6013384, 0.4014326, -2.217149, 0.4392157, 1, 0, 1,
-0.5935301, 0.9128792, 0.3947152, 0.4352941, 1, 0, 1,
-0.5930257, -0.8274882, -3.298438, 0.427451, 1, 0, 1,
-0.5923693, 1.503691, 0.06763584, 0.4235294, 1, 0, 1,
-0.591347, -0.6428716, -3.545796, 0.4156863, 1, 0, 1,
-0.5891668, -0.3535998, -1.901257, 0.4117647, 1, 0, 1,
-0.5825787, 0.4741565, -0.1544522, 0.4039216, 1, 0, 1,
-0.5770547, -1.408892, -1.983481, 0.3960784, 1, 0, 1,
-0.5765541, -1.518892, -2.663167, 0.3921569, 1, 0, 1,
-0.5739006, -0.5642943, -2.187756, 0.3843137, 1, 0, 1,
-0.5705805, -0.4294452, -1.019531, 0.3803922, 1, 0, 1,
-0.5667679, -1.878323, -2.352213, 0.372549, 1, 0, 1,
-0.5652437, -0.7009021, -2.714431, 0.3686275, 1, 0, 1,
-0.5601113, -0.2639224, -1.623517, 0.3607843, 1, 0, 1,
-0.5590937, -3.122397, -3.279202, 0.3568628, 1, 0, 1,
-0.5588514, -0.6238021, -2.236778, 0.3490196, 1, 0, 1,
-0.5582271, -0.1572882, -1.93403, 0.345098, 1, 0, 1,
-0.5571745, 1.321081, -1.252632, 0.3372549, 1, 0, 1,
-0.5564418, -1.522052, -1.769669, 0.3333333, 1, 0, 1,
-0.5488166, -0.5388132, -2.246534, 0.3254902, 1, 0, 1,
-0.5434584, 1.066925, 0.6301749, 0.3215686, 1, 0, 1,
-0.5416955, -1.099211, -1.874022, 0.3137255, 1, 0, 1,
-0.5412471, -1.697474, -2.584068, 0.3098039, 1, 0, 1,
-0.5405708, 1.967028, -0.2636217, 0.3019608, 1, 0, 1,
-0.5390302, -0.5182274, -3.056686, 0.2941177, 1, 0, 1,
-0.5358561, -0.6217757, -3.573266, 0.2901961, 1, 0, 1,
-0.5354451, -0.1055944, -1.373677, 0.282353, 1, 0, 1,
-0.5307859, 0.4994762, -2.233705, 0.2784314, 1, 0, 1,
-0.5305632, -0.7582934, -1.590709, 0.2705882, 1, 0, 1,
-0.5255606, -0.2259518, -1.895866, 0.2666667, 1, 0, 1,
-0.5215839, 0.237616, -0.2797173, 0.2588235, 1, 0, 1,
-0.5211657, -1.523125, -0.6883084, 0.254902, 1, 0, 1,
-0.5193636, -0.2226383, -3.341787, 0.2470588, 1, 0, 1,
-0.5154778, 0.6993515, 0.009236176, 0.2431373, 1, 0, 1,
-0.5061774, -0.5241739, -1.782515, 0.2352941, 1, 0, 1,
-0.5053485, 2.179364, -2.097264, 0.2313726, 1, 0, 1,
-0.5044825, 0.3323939, 0.1530257, 0.2235294, 1, 0, 1,
-0.5035806, -0.1533268, -2.384778, 0.2196078, 1, 0, 1,
-0.4949823, -0.8131162, -1.852424, 0.2117647, 1, 0, 1,
-0.4916681, -1.277191, -3.313631, 0.2078431, 1, 0, 1,
-0.484241, -0.9595197, -1.041795, 0.2, 1, 0, 1,
-0.478036, -1.336245, -0.3573648, 0.1921569, 1, 0, 1,
-0.4769461, -0.9989443, -2.896044, 0.1882353, 1, 0, 1,
-0.4744344, 1.380213, 1.586041, 0.1803922, 1, 0, 1,
-0.4726198, -0.1642688, -2.992725, 0.1764706, 1, 0, 1,
-0.4696204, 0.3736667, -0.9046443, 0.1686275, 1, 0, 1,
-0.4696114, 0.2726346, -0.4374929, 0.1647059, 1, 0, 1,
-0.4680111, -2.024412, -2.818238, 0.1568628, 1, 0, 1,
-0.4675687, 0.9795393, -0.1232588, 0.1529412, 1, 0, 1,
-0.4624486, -1.18078, -3.086213, 0.145098, 1, 0, 1,
-0.4619687, 1.999272, 0.04253762, 0.1411765, 1, 0, 1,
-0.4607776, -1.290949, -2.25372, 0.1333333, 1, 0, 1,
-0.4606959, -1.39007, -2.982354, 0.1294118, 1, 0, 1,
-0.4572832, -0.6457802, -1.555517, 0.1215686, 1, 0, 1,
-0.4519958, 0.1711827, -1.837332, 0.1176471, 1, 0, 1,
-0.4485775, -1.119341, -0.7267275, 0.1098039, 1, 0, 1,
-0.4470902, 1.302969, -0.3378871, 0.1058824, 1, 0, 1,
-0.4389342, 0.01316761, -1.219166, 0.09803922, 1, 0, 1,
-0.4267179, 1.409998, -0.9726313, 0.09019608, 1, 0, 1,
-0.4262256, 0.5201685, -0.856237, 0.08627451, 1, 0, 1,
-0.4250485, -0.381299, -2.693645, 0.07843138, 1, 0, 1,
-0.423172, 0.5975485, -0.2737085, 0.07450981, 1, 0, 1,
-0.4229112, -0.6470706, -2.433487, 0.06666667, 1, 0, 1,
-0.4223901, 0.9230949, 0.385095, 0.0627451, 1, 0, 1,
-0.4206746, 0.7386004, 0.1062804, 0.05490196, 1, 0, 1,
-0.4196117, 0.07362448, -1.345491, 0.05098039, 1, 0, 1,
-0.4188868, 0.4731891, -0.4435417, 0.04313726, 1, 0, 1,
-0.4133018, 1.266963, -1.793408, 0.03921569, 1, 0, 1,
-0.4070218, -0.07144918, 0.1238773, 0.03137255, 1, 0, 1,
-0.4060169, 1.321799, -1.45419, 0.02745098, 1, 0, 1,
-0.4043292, 1.271486, 0.71719, 0.01960784, 1, 0, 1,
-0.4032371, 0.8462865, 0.5786935, 0.01568628, 1, 0, 1,
-0.4000266, 0.2226225, -1.453533, 0.007843138, 1, 0, 1,
-0.3998166, 0.6844075, 0.9557941, 0.003921569, 1, 0, 1,
-0.3983292, -1.466237, -4.430397, 0, 1, 0.003921569, 1,
-0.3979296, 0.6508304, 1.203348, 0, 1, 0.01176471, 1,
-0.3929594, -2.044634, -2.724001, 0, 1, 0.01568628, 1,
-0.3929287, 1.070258, -0.5023329, 0, 1, 0.02352941, 1,
-0.3927742, 0.8940439, 0.9951593, 0, 1, 0.02745098, 1,
-0.3917059, -0.1585329, -1.236432, 0, 1, 0.03529412, 1,
-0.391623, 0.06211142, -0.7812908, 0, 1, 0.03921569, 1,
-0.3897123, -0.7756874, -2.983448, 0, 1, 0.04705882, 1,
-0.3854467, -2.940255, -2.927123, 0, 1, 0.05098039, 1,
-0.3849744, 2.172059, -3.148624, 0, 1, 0.05882353, 1,
-0.3829185, -0.4022345, -3.336669, 0, 1, 0.0627451, 1,
-0.382371, 0.4733203, 1.210242, 0, 1, 0.07058824, 1,
-0.3791814, 0.5140312, -0.9704991, 0, 1, 0.07450981, 1,
-0.378192, -0.3865063, -2.178778, 0, 1, 0.08235294, 1,
-0.36835, 1.115356, -1.008884, 0, 1, 0.08627451, 1,
-0.3681564, -0.5680686, -1.706302, 0, 1, 0.09411765, 1,
-0.3672291, 0.1860906, -2.005385, 0, 1, 0.1019608, 1,
-0.3651301, 0.7448174, -2.47953, 0, 1, 0.1058824, 1,
-0.361712, -1.009732, -3.506666, 0, 1, 0.1137255, 1,
-0.3616227, -1.024422, -2.005288, 0, 1, 0.1176471, 1,
-0.3577515, -2.038325, -1.908649, 0, 1, 0.1254902, 1,
-0.3533365, 0.1131995, -0.6917614, 0, 1, 0.1294118, 1,
-0.3525445, -1.429411, -3.150787, 0, 1, 0.1372549, 1,
-0.3485591, 0.007287194, -1.350668, 0, 1, 0.1411765, 1,
-0.3484879, -1.555897, -1.760656, 0, 1, 0.1490196, 1,
-0.3454217, 1.626841, -1.673533, 0, 1, 0.1529412, 1,
-0.3391636, 0.5317842, -1.474076, 0, 1, 0.1607843, 1,
-0.334965, -1.40809, -5.029078, 0, 1, 0.1647059, 1,
-0.3345681, -0.3009306, -3.052104, 0, 1, 0.172549, 1,
-0.3292906, 0.2677707, -0.7254987, 0, 1, 0.1764706, 1,
-0.3277743, -0.4181105, -2.097476, 0, 1, 0.1843137, 1,
-0.3271097, 2.306521, -1.100835, 0, 1, 0.1882353, 1,
-0.3255522, 0.3767267, 0.0646975, 0, 1, 0.1960784, 1,
-0.3240177, 0.2900482, -0.4993175, 0, 1, 0.2039216, 1,
-0.3216303, -0.05808436, 0.2046038, 0, 1, 0.2078431, 1,
-0.3212818, 0.970162, -0.4198335, 0, 1, 0.2156863, 1,
-0.3193884, 0.3916308, 0.1627099, 0, 1, 0.2196078, 1,
-0.3185623, 0.8279553, -1.64667, 0, 1, 0.227451, 1,
-0.3125665, -0.7353627, -2.758338, 0, 1, 0.2313726, 1,
-0.3115968, -2.54996, -3.783677, 0, 1, 0.2392157, 1,
-0.3094842, -0.1952098, -1.876769, 0, 1, 0.2431373, 1,
-0.3073611, 1.689767, 2.088815, 0, 1, 0.2509804, 1,
-0.3063304, 0.8503111, -1.042189, 0, 1, 0.254902, 1,
-0.2972751, -0.1771215, -1.574618, 0, 1, 0.2627451, 1,
-0.2917177, 0.6209161, -0.917882, 0, 1, 0.2666667, 1,
-0.2824296, 1.465311, 0.4043235, 0, 1, 0.2745098, 1,
-0.2802641, 0.3155022, -0.1554509, 0, 1, 0.2784314, 1,
-0.2782884, 0.1703433, -2.242399, 0, 1, 0.2862745, 1,
-0.2748569, 0.4295758, -0.4015032, 0, 1, 0.2901961, 1,
-0.2716218, -1.045054, -0.5506516, 0, 1, 0.2980392, 1,
-0.2690951, -0.2804675, -1.596694, 0, 1, 0.3058824, 1,
-0.2656495, 0.5341522, 0.3303991, 0, 1, 0.3098039, 1,
-0.2627697, 1.694923, -0.9502206, 0, 1, 0.3176471, 1,
-0.2612848, -1.641518, -2.626084, 0, 1, 0.3215686, 1,
-0.2608667, -0.0722632, -1.307668, 0, 1, 0.3294118, 1,
-0.2606154, 0.07765903, -1.165752, 0, 1, 0.3333333, 1,
-0.2567316, 0.07899823, -1.658423, 0, 1, 0.3411765, 1,
-0.2508697, -0.7408543, -3.237587, 0, 1, 0.345098, 1,
-0.2506169, -0.3120554, -3.582228, 0, 1, 0.3529412, 1,
-0.246692, -0.24974, -1.31438, 0, 1, 0.3568628, 1,
-0.2465482, 0.2409364, -0.8816289, 0, 1, 0.3647059, 1,
-0.2458633, 0.3217023, -2.030821, 0, 1, 0.3686275, 1,
-0.2454038, -0.8578708, -3.116826, 0, 1, 0.3764706, 1,
-0.2445414, -1.402032, -4.308175, 0, 1, 0.3803922, 1,
-0.2415832, -0.05933031, -2.939145, 0, 1, 0.3882353, 1,
-0.2402957, 0.7432874, -0.5657273, 0, 1, 0.3921569, 1,
-0.2379389, 0.4130935, 0.6624618, 0, 1, 0.4, 1,
-0.2340996, -0.351288, -2.672945, 0, 1, 0.4078431, 1,
-0.2337293, 0.0944726, -1.666106, 0, 1, 0.4117647, 1,
-0.2271691, 0.07645996, -2.052108, 0, 1, 0.4196078, 1,
-0.2176082, 1.155107, -1.613228, 0, 1, 0.4235294, 1,
-0.2163333, 0.84627, 0.9433193, 0, 1, 0.4313726, 1,
-0.2066372, -0.04263261, -1.374892, 0, 1, 0.4352941, 1,
-0.2048582, 0.9939368, -0.3872446, 0, 1, 0.4431373, 1,
-0.1999596, 1.769864, 0.2712997, 0, 1, 0.4470588, 1,
-0.1947327, -0.05433009, -3.121943, 0, 1, 0.454902, 1,
-0.1899704, -0.2865193, -2.602301, 0, 1, 0.4588235, 1,
-0.1867525, 0.1155575, -1.279621, 0, 1, 0.4666667, 1,
-0.1852103, 0.9713976, -0.7260962, 0, 1, 0.4705882, 1,
-0.1830336, 0.3142702, -1.778171, 0, 1, 0.4784314, 1,
-0.181977, -1.585013, -3.891035, 0, 1, 0.4823529, 1,
-0.1814528, -1.395057, -2.897912, 0, 1, 0.4901961, 1,
-0.181362, 1.13983, -0.3080562, 0, 1, 0.4941176, 1,
-0.1788227, -1.24657, -4.22549, 0, 1, 0.5019608, 1,
-0.1766342, -0.2668224, -4.465173, 0, 1, 0.509804, 1,
-0.1763265, -0.7257202, -1.778308, 0, 1, 0.5137255, 1,
-0.1751412, 0.8128258, 0.6071842, 0, 1, 0.5215687, 1,
-0.1708557, 0.08033381, -0.4365399, 0, 1, 0.5254902, 1,
-0.1684816, 0.6198717, -1.42294, 0, 1, 0.5333334, 1,
-0.1675326, -0.9098344, -2.905521, 0, 1, 0.5372549, 1,
-0.1659935, 1.023875, 1.409296, 0, 1, 0.5450981, 1,
-0.1657017, -0.6856233, -3.666955, 0, 1, 0.5490196, 1,
-0.1580262, -0.3552313, -2.781117, 0, 1, 0.5568628, 1,
-0.1563721, 0.1337864, -1.362877, 0, 1, 0.5607843, 1,
-0.1515544, 0.404467, -0.2096578, 0, 1, 0.5686275, 1,
-0.1511894, 0.3217261, 0.3684316, 0, 1, 0.572549, 1,
-0.1474321, 0.07977404, -1.292858, 0, 1, 0.5803922, 1,
-0.1469286, 0.1999753, -0.6579949, 0, 1, 0.5843138, 1,
-0.1464393, -2.323194, -2.940799, 0, 1, 0.5921569, 1,
-0.1445399, 0.7788529, -0.2762748, 0, 1, 0.5960785, 1,
-0.1429818, 0.03194025, -1.402601, 0, 1, 0.6039216, 1,
-0.1414899, 0.3062585, 0.1590529, 0, 1, 0.6117647, 1,
-0.1378565, 0.5053738, 0.6429592, 0, 1, 0.6156863, 1,
-0.1364351, -1.458976, -3.498135, 0, 1, 0.6235294, 1,
-0.1347689, -0.6051027, -3.634748, 0, 1, 0.627451, 1,
-0.1323624, -0.4057388, -2.631367, 0, 1, 0.6352941, 1,
-0.1316965, 0.1471447, 0.0678777, 0, 1, 0.6392157, 1,
-0.1310648, -0.8431602, -2.702832, 0, 1, 0.6470588, 1,
-0.1288028, 0.8752449, -1.365278, 0, 1, 0.6509804, 1,
-0.1286154, 1.009776, -0.5500932, 0, 1, 0.6588235, 1,
-0.1219167, -1.087618, -2.078579, 0, 1, 0.6627451, 1,
-0.1217402, 0.002248685, -0.4136111, 0, 1, 0.6705883, 1,
-0.1180182, -0.7352412, -2.552583, 0, 1, 0.6745098, 1,
-0.1175434, 1.114827, 0.9733219, 0, 1, 0.682353, 1,
-0.1174375, -0.7730148, -4.338555, 0, 1, 0.6862745, 1,
-0.1143238, 1.752691, -0.7537361, 0, 1, 0.6941177, 1,
-0.1102602, 0.4203387, -0.2254361, 0, 1, 0.7019608, 1,
-0.1049828, -0.4829901, -3.389317, 0, 1, 0.7058824, 1,
-0.1041473, 0.3453319, -0.926357, 0, 1, 0.7137255, 1,
-0.1023594, -0.664595, -2.724356, 0, 1, 0.7176471, 1,
-0.09438807, -0.2999482, -1.244615, 0, 1, 0.7254902, 1,
-0.09248358, 1.182318, -0.1255272, 0, 1, 0.7294118, 1,
-0.09239496, 0.4809482, -0.2452808, 0, 1, 0.7372549, 1,
-0.09163731, 0.931254, 0.7373275, 0, 1, 0.7411765, 1,
-0.08977577, -0.6807128, -4.122897, 0, 1, 0.7490196, 1,
-0.08597077, 1.561455, 0.06199538, 0, 1, 0.7529412, 1,
-0.07883228, 0.9658896, -1.221337, 0, 1, 0.7607843, 1,
-0.07046631, 0.293523, -0.06390825, 0, 1, 0.7647059, 1,
-0.06766794, 1.733072, 0.4861037, 0, 1, 0.772549, 1,
-0.05658562, -0.262747, -4.72291, 0, 1, 0.7764706, 1,
-0.05044233, -0.7476315, -1.406965, 0, 1, 0.7843137, 1,
-0.04484433, 0.7605637, 0.4637996, 0, 1, 0.7882353, 1,
-0.04365617, 0.1389974, -0.3531892, 0, 1, 0.7960784, 1,
-0.04349957, 0.5006105, -0.2356337, 0, 1, 0.8039216, 1,
-0.0426234, -0.2426191, -3.389669, 0, 1, 0.8078431, 1,
-0.04055544, -1.505154, -4.550358, 0, 1, 0.8156863, 1,
-0.03909051, 1.468047, 0.6115409, 0, 1, 0.8196079, 1,
-0.03884037, -0.8820373, -4.414465, 0, 1, 0.827451, 1,
-0.03209303, 0.1252974, -0.8620613, 0, 1, 0.8313726, 1,
-0.03133517, 0.8608596, -0.005089407, 0, 1, 0.8392157, 1,
-0.03065107, -0.757913, -3.322537, 0, 1, 0.8431373, 1,
-0.02962818, 1.019956, -0.3732615, 0, 1, 0.8509804, 1,
-0.02791172, 0.917361, 0.2326538, 0, 1, 0.854902, 1,
-0.02549061, -1.454903, -3.350756, 0, 1, 0.8627451, 1,
-0.02341194, -0.9048985, -2.128655, 0, 1, 0.8666667, 1,
-0.02162894, -0.3835531, -4.947467, 0, 1, 0.8745098, 1,
-0.02121843, 2.296245, 1.372688, 0, 1, 0.8784314, 1,
-0.01844892, -0.4712611, -3.262729, 0, 1, 0.8862745, 1,
-0.01522825, -0.8818493, -2.087089, 0, 1, 0.8901961, 1,
-0.01459804, -0.6040847, -3.211811, 0, 1, 0.8980392, 1,
-0.01376686, -1.038628, -2.534993, 0, 1, 0.9058824, 1,
-0.0119344, 0.551357, -0.4030746, 0, 1, 0.9098039, 1,
-0.004229913, 1.09502, 0.2824991, 0, 1, 0.9176471, 1,
-0.0008391116, -1.083266, -2.83501, 0, 1, 0.9215686, 1,
8.06574e-05, 1.818812, 1.987691, 0, 1, 0.9294118, 1,
0.001151945, 0.9098421, -1.143309, 0, 1, 0.9333333, 1,
0.008407607, -1.717289, 4.037155, 0, 1, 0.9411765, 1,
0.009389489, -0.6487113, 2.384401, 0, 1, 0.945098, 1,
0.01059505, -0.4911655, 3.024836, 0, 1, 0.9529412, 1,
0.01192718, -1.773279, 3.56686, 0, 1, 0.9568627, 1,
0.01415191, -0.6146912, 2.395112, 0, 1, 0.9647059, 1,
0.0166846, 0.6509671, -1.055652, 0, 1, 0.9686275, 1,
0.01698098, 1.115931, 0.8681824, 0, 1, 0.9764706, 1,
0.01724136, -0.1453627, 2.785215, 0, 1, 0.9803922, 1,
0.0172966, -0.8583449, 4.285361, 0, 1, 0.9882353, 1,
0.0195402, 1.070051, 0.08623124, 0, 1, 0.9921569, 1,
0.02074051, 0.537069, 0.8532636, 0, 1, 1, 1,
0.02212137, 0.2686979, 0.476438, 0, 0.9921569, 1, 1,
0.02782992, -0.6785001, 2.465091, 0, 0.9882353, 1, 1,
0.03453088, 0.3480616, 1.268852, 0, 0.9803922, 1, 1,
0.03475586, 1.212974, -0.1026775, 0, 0.9764706, 1, 1,
0.04877462, -0.7060274, 4.369033, 0, 0.9686275, 1, 1,
0.04926463, 2.209317, 0.6874291, 0, 0.9647059, 1, 1,
0.05507009, -0.9240283, 3.117097, 0, 0.9568627, 1, 1,
0.05561367, 1.077568, -0.0896536, 0, 0.9529412, 1, 1,
0.05731866, 0.06140133, 0.7501371, 0, 0.945098, 1, 1,
0.06060749, -0.3823594, 1.406621, 0, 0.9411765, 1, 1,
0.06105406, -2.068687, 3.673625, 0, 0.9333333, 1, 1,
0.07160994, -1.749963, 2.453563, 0, 0.9294118, 1, 1,
0.07465986, -1.872627, 3.381983, 0, 0.9215686, 1, 1,
0.07770077, -0.7998564, 3.547529, 0, 0.9176471, 1, 1,
0.07886579, 1.306527, 0.7064328, 0, 0.9098039, 1, 1,
0.07918891, 0.3610005, 0.3566993, 0, 0.9058824, 1, 1,
0.07933578, 0.313972, 1.119393, 0, 0.8980392, 1, 1,
0.08108365, -0.01079239, 0.8824382, 0, 0.8901961, 1, 1,
0.08645671, -1.051511, 3.995463, 0, 0.8862745, 1, 1,
0.08771142, 0.2166014, 0.8089762, 0, 0.8784314, 1, 1,
0.0896413, -1.016476, 4.629696, 0, 0.8745098, 1, 1,
0.09454264, 1.740609, -0.06465662, 0, 0.8666667, 1, 1,
0.09687608, -1.157449, 4.415207, 0, 0.8627451, 1, 1,
0.09859926, -1.261021, 3.13671, 0, 0.854902, 1, 1,
0.09919563, -2.106889, 1.860659, 0, 0.8509804, 1, 1,
0.1010677, -0.2781646, 3.406721, 0, 0.8431373, 1, 1,
0.1057117, 1.279059, 0.9498819, 0, 0.8392157, 1, 1,
0.1061091, -1.983738, 2.827559, 0, 0.8313726, 1, 1,
0.1062579, -0.1801469, 3.899713, 0, 0.827451, 1, 1,
0.107712, -0.979065, 3.652241, 0, 0.8196079, 1, 1,
0.1135573, 0.5865671, 0.6405368, 0, 0.8156863, 1, 1,
0.1158752, 0.7103491, -0.05649222, 0, 0.8078431, 1, 1,
0.1177085, 0.7491612, 1.365343, 0, 0.8039216, 1, 1,
0.1181713, -0.8466881, 5.1978, 0, 0.7960784, 1, 1,
0.1190861, 1.019451, 0.5944632, 0, 0.7882353, 1, 1,
0.1201135, -0.5751623, 4.095011, 0, 0.7843137, 1, 1,
0.1215027, 0.4773844, -0.781795, 0, 0.7764706, 1, 1,
0.1228136, 0.2600836, 0.3219278, 0, 0.772549, 1, 1,
0.1255779, 1.484571, -0.9728634, 0, 0.7647059, 1, 1,
0.1279991, 0.1794187, 1.624367, 0, 0.7607843, 1, 1,
0.1307063, 0.8040466, -1.689138, 0, 0.7529412, 1, 1,
0.1310473, -0.9260132, 2.115891, 0, 0.7490196, 1, 1,
0.1320129, 0.3810053, 1.597604, 0, 0.7411765, 1, 1,
0.1353439, -1.500223, 1.811906, 0, 0.7372549, 1, 1,
0.1367202, 0.284863, 1.541432, 0, 0.7294118, 1, 1,
0.1367709, 0.298144, 0.1385107, 0, 0.7254902, 1, 1,
0.13721, 0.8193353, 0.934818, 0, 0.7176471, 1, 1,
0.1379461, -0.1721145, 2.313252, 0, 0.7137255, 1, 1,
0.1393712, 0.02909569, 0.3199614, 0, 0.7058824, 1, 1,
0.1419088, 0.5871306, 1.659447, 0, 0.6980392, 1, 1,
0.1433689, -0.190167, 1.839533, 0, 0.6941177, 1, 1,
0.1453871, 0.5489564, 1.394372, 0, 0.6862745, 1, 1,
0.1486432, -0.4988601, 3.498219, 0, 0.682353, 1, 1,
0.1488563, 0.1306555, 0.02682421, 0, 0.6745098, 1, 1,
0.1493612, -0.7496535, 4.567816, 0, 0.6705883, 1, 1,
0.1501302, 0.9788709, 2.501423, 0, 0.6627451, 1, 1,
0.1594632, -0.3616309, 3.761275, 0, 0.6588235, 1, 1,
0.1599893, 1.220793, 0.7216833, 0, 0.6509804, 1, 1,
0.1664355, -1.699849, 4.099817, 0, 0.6470588, 1, 1,
0.1706969, 0.4972146, 1.261956, 0, 0.6392157, 1, 1,
0.173679, -0.477621, 3.409518, 0, 0.6352941, 1, 1,
0.1786117, 1.901432, -0.1269259, 0, 0.627451, 1, 1,
0.1818251, -0.4633532, 1.81294, 0, 0.6235294, 1, 1,
0.1890279, 0.8832694, 0.1002585, 0, 0.6156863, 1, 1,
0.1927239, -1.283385, 1.244629, 0, 0.6117647, 1, 1,
0.1966875, 0.07871668, 1.261551, 0, 0.6039216, 1, 1,
0.2002978, -0.1011015, 1.158979, 0, 0.5960785, 1, 1,
0.2017384, 0.4177569, 1.134897, 0, 0.5921569, 1, 1,
0.2040122, 1.273581, 1.379821, 0, 0.5843138, 1, 1,
0.205222, -0.2458904, 2.477318, 0, 0.5803922, 1, 1,
0.2052566, 0.2371152, -0.7969861, 0, 0.572549, 1, 1,
0.2083641, -1.015623, 3.567344, 0, 0.5686275, 1, 1,
0.2106332, 0.3695324, -1.235856, 0, 0.5607843, 1, 1,
0.2134776, -1.211335, 2.921036, 0, 0.5568628, 1, 1,
0.2169735, -0.2636185, 0.8941215, 0, 0.5490196, 1, 1,
0.2179179, 0.801053, -1.268871, 0, 0.5450981, 1, 1,
0.2185461, -0.5013939, 3.045813, 0, 0.5372549, 1, 1,
0.2234902, 0.7045587, 0.2248439, 0, 0.5333334, 1, 1,
0.2247933, -1.309773, 2.947429, 0, 0.5254902, 1, 1,
0.2278667, 1.864259, 1.93257, 0, 0.5215687, 1, 1,
0.2296806, -0.437588, 1.847011, 0, 0.5137255, 1, 1,
0.2302634, 0.4312281, 0.4016597, 0, 0.509804, 1, 1,
0.2329594, 0.2318007, 0.09112742, 0, 0.5019608, 1, 1,
0.2341751, -1.092697, 2.559423, 0, 0.4941176, 1, 1,
0.235583, -0.3004005, 1.45075, 0, 0.4901961, 1, 1,
0.2414116, -1.156616, 3.263489, 0, 0.4823529, 1, 1,
0.2414924, 0.4003973, 0.8856563, 0, 0.4784314, 1, 1,
0.2430828, -0.6845699, 4.797377, 0, 0.4705882, 1, 1,
0.2440287, 0.3030861, -0.0701941, 0, 0.4666667, 1, 1,
0.2454318, 0.3208854, 0.1667773, 0, 0.4588235, 1, 1,
0.2470084, -1.237913, 3.278071, 0, 0.454902, 1, 1,
0.2486342, 0.9362112, 0.7466232, 0, 0.4470588, 1, 1,
0.2577612, 0.261868, 1.582335, 0, 0.4431373, 1, 1,
0.2597634, -0.01872604, 2.283407, 0, 0.4352941, 1, 1,
0.2608185, 1.105386, 1.638739, 0, 0.4313726, 1, 1,
0.2612201, 1.13815, 0.5952197, 0, 0.4235294, 1, 1,
0.267996, 0.5537245, 0.7663941, 0, 0.4196078, 1, 1,
0.2688397, 0.02565427, 1.194712, 0, 0.4117647, 1, 1,
0.2694006, 0.2287398, 2.148801, 0, 0.4078431, 1, 1,
0.2699609, -0.5910926, 3.429309, 0, 0.4, 1, 1,
0.2729057, -0.462604, 1.361031, 0, 0.3921569, 1, 1,
0.2776821, -1.99894, 3.03474, 0, 0.3882353, 1, 1,
0.2784529, -1.366429, 2.492147, 0, 0.3803922, 1, 1,
0.2818362, 1.517306, 0.2636619, 0, 0.3764706, 1, 1,
0.2820358, -0.1557231, 0.9069812, 0, 0.3686275, 1, 1,
0.2825909, 0.9692124, 0.6814664, 0, 0.3647059, 1, 1,
0.2889187, 1.653539, -0.04667418, 0, 0.3568628, 1, 1,
0.2922216, -1.438783, 2.898255, 0, 0.3529412, 1, 1,
0.2946495, 0.7154018, 2.03414, 0, 0.345098, 1, 1,
0.3029938, -1.89485, 1.975198, 0, 0.3411765, 1, 1,
0.3043829, -1.134975, 3.823537, 0, 0.3333333, 1, 1,
0.3067288, -0.2599532, 2.900265, 0, 0.3294118, 1, 1,
0.3125796, -0.6626099, 3.164388, 0, 0.3215686, 1, 1,
0.3137783, 1.19298, -1.097775, 0, 0.3176471, 1, 1,
0.3154045, 0.4461035, 0.212529, 0, 0.3098039, 1, 1,
0.3164872, 0.4023536, 1.553446, 0, 0.3058824, 1, 1,
0.3200559, 1.334176, -0.1608438, 0, 0.2980392, 1, 1,
0.3218898, -2.144818, 2.982258, 0, 0.2901961, 1, 1,
0.3243205, -0.1006419, 2.137811, 0, 0.2862745, 1, 1,
0.3297622, 0.04730183, 1.364442, 0, 0.2784314, 1, 1,
0.3310866, 0.9911516, 0.5325159, 0, 0.2745098, 1, 1,
0.3312407, -1.588716, 2.211391, 0, 0.2666667, 1, 1,
0.3313587, -1.597311, 3.405237, 0, 0.2627451, 1, 1,
0.3327726, -1.00925, 3.85348, 0, 0.254902, 1, 1,
0.3334632, -0.5698227, 2.842637, 0, 0.2509804, 1, 1,
0.3349891, -0.3009236, 1.660177, 0, 0.2431373, 1, 1,
0.3350316, 0.03617838, 2.096262, 0, 0.2392157, 1, 1,
0.3436491, -1.050198, 2.493763, 0, 0.2313726, 1, 1,
0.3490243, -0.9449443, 3.858688, 0, 0.227451, 1, 1,
0.3503078, 0.2881068, -0.6219054, 0, 0.2196078, 1, 1,
0.3524524, 1.208885, 1.117377, 0, 0.2156863, 1, 1,
0.3576218, 0.0961375, 1.422449, 0, 0.2078431, 1, 1,
0.3603151, 0.7820894, -0.194143, 0, 0.2039216, 1, 1,
0.363168, -1.229705, 2.974032, 0, 0.1960784, 1, 1,
0.3645663, -0.4144987, 3.824988, 0, 0.1882353, 1, 1,
0.3716581, 0.009271698, 1.510143, 0, 0.1843137, 1, 1,
0.3775257, -1.65683, 2.242916, 0, 0.1764706, 1, 1,
0.3775622, -1.487791, 3.705819, 0, 0.172549, 1, 1,
0.3778043, 0.9270028, -1.388994, 0, 0.1647059, 1, 1,
0.3852181, -0.2859934, 4.430581, 0, 0.1607843, 1, 1,
0.3888445, -0.6176178, 3.683412, 0, 0.1529412, 1, 1,
0.3914823, 1.683919, 1.901985, 0, 0.1490196, 1, 1,
0.3956183, -2.799121, 2.613072, 0, 0.1411765, 1, 1,
0.4022334, 0.04268416, 2.069352, 0, 0.1372549, 1, 1,
0.4025828, 0.40114, 1.28053, 0, 0.1294118, 1, 1,
0.4028557, -0.572062, 2.638248, 0, 0.1254902, 1, 1,
0.4043196, -0.7387158, 2.380374, 0, 0.1176471, 1, 1,
0.4044623, -1.36374, 2.614557, 0, 0.1137255, 1, 1,
0.4078016, -1.767386, 0.9182708, 0, 0.1058824, 1, 1,
0.410331, -1.266235, 3.658965, 0, 0.09803922, 1, 1,
0.4105842, -1.258263, 2.824136, 0, 0.09411765, 1, 1,
0.4106679, 1.300235, -1.525532, 0, 0.08627451, 1, 1,
0.4153962, 2.486238, -1.013883, 0, 0.08235294, 1, 1,
0.4173449, 0.4982142, 1.715822, 0, 0.07450981, 1, 1,
0.4217041, -0.3044649, 1.252262, 0, 0.07058824, 1, 1,
0.4264975, -1.181168, 3.54612, 0, 0.0627451, 1, 1,
0.4265979, -1.914527, 2.588026, 0, 0.05882353, 1, 1,
0.4269037, 1.799204, 0.3495075, 0, 0.05098039, 1, 1,
0.4292132, 0.6348947, 0.946631, 0, 0.04705882, 1, 1,
0.4347233, 1.830865, 0.6190551, 0, 0.03921569, 1, 1,
0.4412229, 1.315452, 0.6024984, 0, 0.03529412, 1, 1,
0.4426414, 0.7877068, 1.244492, 0, 0.02745098, 1, 1,
0.4463952, -0.2724843, 0.7161549, 0, 0.02352941, 1, 1,
0.4472001, 1.058511, -0.1764307, 0, 0.01568628, 1, 1,
0.4508936, -1.78986, 1.583651, 0, 0.01176471, 1, 1,
0.4512012, -0.4589965, 3.452614, 0, 0.003921569, 1, 1,
0.4517545, -1.248972, 2.392335, 0.003921569, 0, 1, 1,
0.4522716, -0.4904927, 2.504468, 0.007843138, 0, 1, 1,
0.4602551, -0.6432089, 3.847763, 0.01568628, 0, 1, 1,
0.4611465, -0.5692543, 2.728477, 0.01960784, 0, 1, 1,
0.465584, -0.9035076, 2.324641, 0.02745098, 0, 1, 1,
0.467186, 2.673143, 2.316577, 0.03137255, 0, 1, 1,
0.4706889, 0.3999696, 0.5227792, 0.03921569, 0, 1, 1,
0.4768413, -2.138854, 3.79024, 0.04313726, 0, 1, 1,
0.4779485, 0.574924, -0.6244785, 0.05098039, 0, 1, 1,
0.478021, 0.3905422, 0.1850523, 0.05490196, 0, 1, 1,
0.4807255, 0.2528855, 0.8223792, 0.0627451, 0, 1, 1,
0.4829755, 0.2728623, 1.956512, 0.06666667, 0, 1, 1,
0.4923703, 1.135661, -0.05076173, 0.07450981, 0, 1, 1,
0.4945009, -0.757219, 2.316162, 0.07843138, 0, 1, 1,
0.5000859, 0.5830851, 0.03172622, 0.08627451, 0, 1, 1,
0.5033445, 1.139563, 0.5205379, 0.09019608, 0, 1, 1,
0.5075573, 1.569704, 0.1383527, 0.09803922, 0, 1, 1,
0.5088441, 0.2634521, -0.0523017, 0.1058824, 0, 1, 1,
0.5102799, -0.5794685, 1.169825, 0.1098039, 0, 1, 1,
0.5132924, -2.446877, 4.002167, 0.1176471, 0, 1, 1,
0.514356, 1.499486, -0.5460274, 0.1215686, 0, 1, 1,
0.5148953, -0.7591702, 0.7189019, 0.1294118, 0, 1, 1,
0.51672, -0.04103067, 1.707943, 0.1333333, 0, 1, 1,
0.5326666, -1.606388, 3.148797, 0.1411765, 0, 1, 1,
0.5329133, 0.7164303, 1.793484, 0.145098, 0, 1, 1,
0.5337544, -1.108777, 0.3697923, 0.1529412, 0, 1, 1,
0.5339933, 0.486259, 0.1413523, 0.1568628, 0, 1, 1,
0.5419207, 2.688503, -2.149827, 0.1647059, 0, 1, 1,
0.5442156, -1.001481, 2.262609, 0.1686275, 0, 1, 1,
0.5510528, 0.1504723, 1.855049, 0.1764706, 0, 1, 1,
0.5530425, 0.8652349, -0.7046106, 0.1803922, 0, 1, 1,
0.5537437, -1.700298, 3.44591, 0.1882353, 0, 1, 1,
0.5558088, 0.7849632, 0.7845121, 0.1921569, 0, 1, 1,
0.5591641, 0.3884613, -0.3728906, 0.2, 0, 1, 1,
0.5615104, -0.547329, 3.125812, 0.2078431, 0, 1, 1,
0.5638826, -0.693703, 2.140415, 0.2117647, 0, 1, 1,
0.5650077, -0.7921971, 3.595818, 0.2196078, 0, 1, 1,
0.5663443, 1.302437, -0.3367968, 0.2235294, 0, 1, 1,
0.5665067, 2.348587, -0.1497895, 0.2313726, 0, 1, 1,
0.5676218, 0.5098162, 0.7227631, 0.2352941, 0, 1, 1,
0.5688788, -0.5665447, 2.300619, 0.2431373, 0, 1, 1,
0.572772, -0.4008579, 1.111856, 0.2470588, 0, 1, 1,
0.5740673, -0.3123925, 3.328058, 0.254902, 0, 1, 1,
0.5782844, 1.312537, 0.1209642, 0.2588235, 0, 1, 1,
0.5962661, -0.8904911, 2.256269, 0.2666667, 0, 1, 1,
0.5966331, 0.6373716, 0.7314943, 0.2705882, 0, 1, 1,
0.5995408, -0.7323722, 1.374931, 0.2784314, 0, 1, 1,
0.5996213, -0.5084817, 0.7446423, 0.282353, 0, 1, 1,
0.6003754, -0.01850654, 1.780587, 0.2901961, 0, 1, 1,
0.6012179, 1.245884, -1.726016, 0.2941177, 0, 1, 1,
0.602864, -0.5395545, 4.195882, 0.3019608, 0, 1, 1,
0.6066332, -0.06795819, 1.996158, 0.3098039, 0, 1, 1,
0.6095058, 0.2425369, 0.388621, 0.3137255, 0, 1, 1,
0.6104859, -0.733423, 3.615766, 0.3215686, 0, 1, 1,
0.6109017, -0.9267114, 2.160333, 0.3254902, 0, 1, 1,
0.6112164, -0.3767819, 2.562981, 0.3333333, 0, 1, 1,
0.6122313, -1.295442, 3.199705, 0.3372549, 0, 1, 1,
0.6126131, -0.8641511, 2.239543, 0.345098, 0, 1, 1,
0.6137391, -1.21002, 4.46277, 0.3490196, 0, 1, 1,
0.614372, 1.088593, -1.938009, 0.3568628, 0, 1, 1,
0.6145672, 0.3775254, -0.1811483, 0.3607843, 0, 1, 1,
0.6168394, 0.8984608, -0.2523318, 0.3686275, 0, 1, 1,
0.6170323, 0.2200202, 1.841964, 0.372549, 0, 1, 1,
0.6214169, 0.01347434, 2.181809, 0.3803922, 0, 1, 1,
0.6215141, 1.072883, 0.9573776, 0.3843137, 0, 1, 1,
0.6250515, -0.4814697, 0.1610584, 0.3921569, 0, 1, 1,
0.6255069, 0.6099295, 0.4634961, 0.3960784, 0, 1, 1,
0.6327549, 0.282456, 1.93609, 0.4039216, 0, 1, 1,
0.648203, -0.4709275, 2.860108, 0.4117647, 0, 1, 1,
0.6494353, 0.04559699, 2.549671, 0.4156863, 0, 1, 1,
0.6509588, -0.07066432, 2.382103, 0.4235294, 0, 1, 1,
0.6509853, 0.5408765, 0.0733462, 0.427451, 0, 1, 1,
0.6526052, 0.2918306, 0.2292267, 0.4352941, 0, 1, 1,
0.6538041, 0.7325653, 1.313205, 0.4392157, 0, 1, 1,
0.6542674, 0.2000621, 1.460548, 0.4470588, 0, 1, 1,
0.6625137, 2.352465, 0.1943568, 0.4509804, 0, 1, 1,
0.6631727, 1.157398, 1.572378, 0.4588235, 0, 1, 1,
0.663658, -0.4588421, 1.908403, 0.4627451, 0, 1, 1,
0.6638717, -0.1917956, 1.976095, 0.4705882, 0, 1, 1,
0.665909, -0.867386, 2.718816, 0.4745098, 0, 1, 1,
0.668295, 0.01949374, -1.127697, 0.4823529, 0, 1, 1,
0.6734636, -0.2698459, 2.851741, 0.4862745, 0, 1, 1,
0.6736332, 1.613841, -0.001795855, 0.4941176, 0, 1, 1,
0.6746168, 0.9338287, -0.15327, 0.5019608, 0, 1, 1,
0.6760638, -0.1495834, 1.61092, 0.5058824, 0, 1, 1,
0.6895007, 0.8672134, 0.4158794, 0.5137255, 0, 1, 1,
0.6934224, 0.7857015, 1.30801, 0.5176471, 0, 1, 1,
0.6986505, -0.8363824, 3.76352, 0.5254902, 0, 1, 1,
0.6992567, -0.4094158, 1.767831, 0.5294118, 0, 1, 1,
0.7005867, 0.5785817, -1.010022, 0.5372549, 0, 1, 1,
0.7041753, -0.7246998, 2.772299, 0.5411765, 0, 1, 1,
0.7054172, 0.9250831, -0.2649059, 0.5490196, 0, 1, 1,
0.7129903, -1.526276, 1.224752, 0.5529412, 0, 1, 1,
0.7142764, 1.529819, 0.1957052, 0.5607843, 0, 1, 1,
0.7147009, -0.192641, 1.21554, 0.5647059, 0, 1, 1,
0.7214738, 0.1774563, 0.8593275, 0.572549, 0, 1, 1,
0.7225267, -2.443454, 3.332902, 0.5764706, 0, 1, 1,
0.7257823, 0.06841661, 0.4259953, 0.5843138, 0, 1, 1,
0.7276178, -0.03365064, 1.894205, 0.5882353, 0, 1, 1,
0.7282015, 2.622289, -1.931662, 0.5960785, 0, 1, 1,
0.7306644, 0.730845, 0.8972574, 0.6039216, 0, 1, 1,
0.733349, 1.221601, 0.3280219, 0.6078432, 0, 1, 1,
0.7342249, 1.512458, 1.076995, 0.6156863, 0, 1, 1,
0.7358609, 0.360138, 1.505558, 0.6196079, 0, 1, 1,
0.745617, -0.3582429, 1.54161, 0.627451, 0, 1, 1,
0.7523173, -0.8024493, 2.312417, 0.6313726, 0, 1, 1,
0.7547135, 0.8962552, 0.9124163, 0.6392157, 0, 1, 1,
0.7568644, 0.3232355, 3.077393, 0.6431373, 0, 1, 1,
0.7658124, -0.01251551, 0.01479161, 0.6509804, 0, 1, 1,
0.7662998, 0.1610655, 1.503073, 0.654902, 0, 1, 1,
0.7670621, 1.113694, 0.9931054, 0.6627451, 0, 1, 1,
0.7694657, -1.04495, 1.559568, 0.6666667, 0, 1, 1,
0.772242, -2.121627, 2.728823, 0.6745098, 0, 1, 1,
0.7726956, -1.919621, 3.789588, 0.6784314, 0, 1, 1,
0.7730768, -0.2535914, 1.393711, 0.6862745, 0, 1, 1,
0.7752274, -1.154759, 2.121215, 0.6901961, 0, 1, 1,
0.7776559, 0.7701381, 1.438298, 0.6980392, 0, 1, 1,
0.7786591, -2.723405, 1.690844, 0.7058824, 0, 1, 1,
0.7798593, 0.3557167, 1.001229, 0.7098039, 0, 1, 1,
0.7815509, 0.7728311, 0.4673006, 0.7176471, 0, 1, 1,
0.7857181, 0.943196, 1.054365, 0.7215686, 0, 1, 1,
0.7879732, 0.6032637, 0.4196701, 0.7294118, 0, 1, 1,
0.790949, -1.769291, 3.145657, 0.7333333, 0, 1, 1,
0.7949284, 0.4867179, 1.312405, 0.7411765, 0, 1, 1,
0.7973209, 1.227389, -1.026306, 0.7450981, 0, 1, 1,
0.8022896, 1.518106, 0.8232358, 0.7529412, 0, 1, 1,
0.8026217, 0.5247923, 1.865249, 0.7568628, 0, 1, 1,
0.8069859, -1.574849, 2.769662, 0.7647059, 0, 1, 1,
0.8075066, -1.740885, 2.951227, 0.7686275, 0, 1, 1,
0.8143423, 0.1498892, 2.050807, 0.7764706, 0, 1, 1,
0.814387, 1.306682, 2.040091, 0.7803922, 0, 1, 1,
0.8148554, 0.8708079, 1.664335, 0.7882353, 0, 1, 1,
0.8167479, 1.119659, 0.4881795, 0.7921569, 0, 1, 1,
0.8243095, -1.649053, 1.735006, 0.8, 0, 1, 1,
0.8248738, 0.7915775, -0.2706369, 0.8078431, 0, 1, 1,
0.8282882, -1.008108, 2.964675, 0.8117647, 0, 1, 1,
0.8332362, 0.5593671, 1.196963, 0.8196079, 0, 1, 1,
0.8351744, -0.6142166, 1.598046, 0.8235294, 0, 1, 1,
0.8386971, -0.3506438, 2.287119, 0.8313726, 0, 1, 1,
0.8460417, -1.053746, 1.709142, 0.8352941, 0, 1, 1,
0.846077, 0.2473951, 0.1521616, 0.8431373, 0, 1, 1,
0.8572515, -0.2118412, -0.3381144, 0.8470588, 0, 1, 1,
0.8587101, -1.592548, 3.335602, 0.854902, 0, 1, 1,
0.863131, -0.6526927, 0.8892678, 0.8588235, 0, 1, 1,
0.868313, -0.215368, 1.641479, 0.8666667, 0, 1, 1,
0.8684555, 0.2711085, 1.252866, 0.8705882, 0, 1, 1,
0.8812172, -0.4144678, 3.050267, 0.8784314, 0, 1, 1,
0.8851873, -1.916535, 2.894469, 0.8823529, 0, 1, 1,
0.8897069, -1.035685, 2.25344, 0.8901961, 0, 1, 1,
0.8983751, 0.9515002, 0.3695257, 0.8941177, 0, 1, 1,
0.8992071, -0.3436002, 0.1718804, 0.9019608, 0, 1, 1,
0.9105115, 2.147762, 1.002187, 0.9098039, 0, 1, 1,
0.9124221, -0.642237, 3.741921, 0.9137255, 0, 1, 1,
0.9196365, 1.586007, 0.4561251, 0.9215686, 0, 1, 1,
0.9250404, -0.4606262, 4.0073, 0.9254902, 0, 1, 1,
0.9268789, -0.1024973, 2.143958, 0.9333333, 0, 1, 1,
0.9304908, -1.509817, 2.019823, 0.9372549, 0, 1, 1,
0.9363835, -1.426669, 2.606646, 0.945098, 0, 1, 1,
0.9426225, 0.5573719, 0.3003338, 0.9490196, 0, 1, 1,
0.9441711, 0.3117818, 0.09773024, 0.9568627, 0, 1, 1,
0.9584975, -0.864615, 0.8486175, 0.9607843, 0, 1, 1,
0.9585047, 0.2847798, 1.18514, 0.9686275, 0, 1, 1,
0.9587815, -1.427375, 2.414921, 0.972549, 0, 1, 1,
0.9694161, 0.7244855, 0.6200171, 0.9803922, 0, 1, 1,
0.9728432, -0.6838295, 3.007802, 0.9843137, 0, 1, 1,
0.9731601, -1.638322, 1.857233, 0.9921569, 0, 1, 1,
0.9743452, 1.286112, -0.1727758, 0.9960784, 0, 1, 1,
0.9849361, -0.07988016, 0.6198457, 1, 0, 0.9960784, 1,
0.9883271, 0.469909, 0.4869565, 1, 0, 0.9882353, 1,
0.9910834, 0.1764797, 1.791922, 1, 0, 0.9843137, 1,
0.9927619, 0.1788494, -0.3329793, 1, 0, 0.9764706, 1,
0.9958799, -0.118857, 2.748692, 1, 0, 0.972549, 1,
0.9980887, 1.071761, 2.133048, 1, 0, 0.9647059, 1,
1.002014, -0.502404, 4.118024, 1, 0, 0.9607843, 1,
1.002952, -0.9516774, 0.5525811, 1, 0, 0.9529412, 1,
1.003755, -1.052125, 1.321206, 1, 0, 0.9490196, 1,
1.010476, -0.05294591, 3.461278, 1, 0, 0.9411765, 1,
1.012898, 0.3562321, 2.122776, 1, 0, 0.9372549, 1,
1.025117, -0.289061, 0.9786525, 1, 0, 0.9294118, 1,
1.02898, -0.1615245, 1.608511, 1, 0, 0.9254902, 1,
1.032935, -1.516803, 2.666553, 1, 0, 0.9176471, 1,
1.036311, 0.4121915, 2.814979, 1, 0, 0.9137255, 1,
1.046208, 0.9400144, 2.46642, 1, 0, 0.9058824, 1,
1.046306, -0.3488517, 2.709348, 1, 0, 0.9019608, 1,
1.050936, 0.8560243, 1.427127, 1, 0, 0.8941177, 1,
1.051402, 0.4399292, -0.3351705, 1, 0, 0.8862745, 1,
1.053614, -1.595436, 3.236245, 1, 0, 0.8823529, 1,
1.058716, 0.5087571, 0.9644055, 1, 0, 0.8745098, 1,
1.05925, -0.3817124, 2.012418, 1, 0, 0.8705882, 1,
1.060147, 0.2230671, 1.377618, 1, 0, 0.8627451, 1,
1.063999, 0.7386898, 0.7381008, 1, 0, 0.8588235, 1,
1.067744, -0.4710969, 4.050741, 1, 0, 0.8509804, 1,
1.070591, -0.4743519, 2.763115, 1, 0, 0.8470588, 1,
1.078583, -0.04026341, -0.2620648, 1, 0, 0.8392157, 1,
1.086437, 0.6996199, 1.319653, 1, 0, 0.8352941, 1,
1.092916, 2.676867, 2.178672, 1, 0, 0.827451, 1,
1.094031, -1.273803, 1.145296, 1, 0, 0.8235294, 1,
1.099815, 0.07700764, 0.9333146, 1, 0, 0.8156863, 1,
1.100123, 0.7822387, 0.5576071, 1, 0, 0.8117647, 1,
1.100769, -0.7928115, 3.385051, 1, 0, 0.8039216, 1,
1.101678, -0.6977195, 2.08135, 1, 0, 0.7960784, 1,
1.105099, 0.0619817, 0.6733471, 1, 0, 0.7921569, 1,
1.106725, -1.940247, 3.113662, 1, 0, 0.7843137, 1,
1.106892, -1.048195, 2.791569, 1, 0, 0.7803922, 1,
1.113313, 1.932646, 2.254905, 1, 0, 0.772549, 1,
1.136441, -0.9064547, 2.46571, 1, 0, 0.7686275, 1,
1.140703, -0.5031627, 0.9390457, 1, 0, 0.7607843, 1,
1.142128, -0.7636325, 3.299473, 1, 0, 0.7568628, 1,
1.143305, 0.4642421, 1.427292, 1, 0, 0.7490196, 1,
1.145843, -0.696247, 0.4905862, 1, 0, 0.7450981, 1,
1.154001, 2.188979, -0.7146858, 1, 0, 0.7372549, 1,
1.154238, 0.7519705, 1.169078, 1, 0, 0.7333333, 1,
1.157692, 0.8950046, 1.417745, 1, 0, 0.7254902, 1,
1.163921, -0.06613941, 2.92731, 1, 0, 0.7215686, 1,
1.167377, -0.7521552, 1.844918, 1, 0, 0.7137255, 1,
1.172992, 0.1619935, 2.488124, 1, 0, 0.7098039, 1,
1.17319, 0.765296, -0.7853823, 1, 0, 0.7019608, 1,
1.173706, -0.2319269, 1.477342, 1, 0, 0.6941177, 1,
1.174421, 0.8748631, 0.1179126, 1, 0, 0.6901961, 1,
1.178317, -0.5837832, 2.233044, 1, 0, 0.682353, 1,
1.184561, -0.4840132, 2.715973, 1, 0, 0.6784314, 1,
1.186147, -0.2976817, 1.961414, 1, 0, 0.6705883, 1,
1.187469, -0.8323336, 1.011697, 1, 0, 0.6666667, 1,
1.199482, -0.1685899, 0.9770588, 1, 0, 0.6588235, 1,
1.201404, -0.719728, 2.222392, 1, 0, 0.654902, 1,
1.207308, 0.148858, 2.677794, 1, 0, 0.6470588, 1,
1.208454, -0.2653853, 1.512519, 1, 0, 0.6431373, 1,
1.214014, -1.214369, 3.657879, 1, 0, 0.6352941, 1,
1.223457, 0.02313945, 2.768172, 1, 0, 0.6313726, 1,
1.224712, 0.1586546, 1.131626, 1, 0, 0.6235294, 1,
1.229624, -1.189789, 2.42168, 1, 0, 0.6196079, 1,
1.238133, 1.345734, 1.576914, 1, 0, 0.6117647, 1,
1.240945, 0.6762385, 0.934688, 1, 0, 0.6078432, 1,
1.246632, -0.3686316, 2.103615, 1, 0, 0.6, 1,
1.261018, -0.2548449, 0.4644697, 1, 0, 0.5921569, 1,
1.26288, -0.2683803, 1.481654, 1, 0, 0.5882353, 1,
1.268058, 1.002663, -1.163383, 1, 0, 0.5803922, 1,
1.278112, -0.4675471, 1.462508, 1, 0, 0.5764706, 1,
1.280344, 1.134771, 2.306835, 1, 0, 0.5686275, 1,
1.288969, 0.5541481, 1.889776, 1, 0, 0.5647059, 1,
1.291482, 0.1235285, 0.8386214, 1, 0, 0.5568628, 1,
1.295939, 1.642576, 1.721431, 1, 0, 0.5529412, 1,
1.301408, 1.147375, 0.5463216, 1, 0, 0.5450981, 1,
1.31104, -0.6796332, 0.7932664, 1, 0, 0.5411765, 1,
1.321407, 1.024898, 1.576013, 1, 0, 0.5333334, 1,
1.333491, -1.384845, 3.315672, 1, 0, 0.5294118, 1,
1.337392, 1.04604, 1.407632, 1, 0, 0.5215687, 1,
1.351285, 0.4024, 2.01715, 1, 0, 0.5176471, 1,
1.361218, -0.7422649, 3.119716, 1, 0, 0.509804, 1,
1.375915, 0.3809568, 2.073301, 1, 0, 0.5058824, 1,
1.384171, -0.8320375, 2.096025, 1, 0, 0.4980392, 1,
1.393062, -1.61481, 2.582152, 1, 0, 0.4901961, 1,
1.406398, -0.7200782, 3.078781, 1, 0, 0.4862745, 1,
1.410769, 0.5979103, 3.20702, 1, 0, 0.4784314, 1,
1.411267, 2.820392, -0.5637415, 1, 0, 0.4745098, 1,
1.423378, -0.4254761, 2.299371, 1, 0, 0.4666667, 1,
1.424609, -1.225688, 2.434127, 1, 0, 0.4627451, 1,
1.426742, -0.8441781, 2.960402, 1, 0, 0.454902, 1,
1.446383, -0.2671977, 2.42165, 1, 0, 0.4509804, 1,
1.447446, 1.32067, -0.1389739, 1, 0, 0.4431373, 1,
1.457122, 0.6525537, 2.21755, 1, 0, 0.4392157, 1,
1.482311, 0.9262956, -0.8094847, 1, 0, 0.4313726, 1,
1.483047, 0.08536626, 0.8550448, 1, 0, 0.427451, 1,
1.497611, -0.2703973, 3.499481, 1, 0, 0.4196078, 1,
1.501827, 0.4928343, 2.396838, 1, 0, 0.4156863, 1,
1.501828, 1.312526, 1.948598, 1, 0, 0.4078431, 1,
1.510363, 0.8086535, -0.4848648, 1, 0, 0.4039216, 1,
1.512897, -1.182748, 1.277091, 1, 0, 0.3960784, 1,
1.517551, 1.21315, 1.145845, 1, 0, 0.3882353, 1,
1.538613, -0.3819152, 1.835954, 1, 0, 0.3843137, 1,
1.561237, 0.08548556, 2.703053, 1, 0, 0.3764706, 1,
1.58437, -0.7942068, 2.33486, 1, 0, 0.372549, 1,
1.588641, 0.5009525, 1.512965, 1, 0, 0.3647059, 1,
1.61251, 0.1165783, 1.085807, 1, 0, 0.3607843, 1,
1.613866, -1.654931, 3.843443, 1, 0, 0.3529412, 1,
1.622368, 0.7020072, 1.00174, 1, 0, 0.3490196, 1,
1.628906, 1.083291, 2.365312, 1, 0, 0.3411765, 1,
1.632918, 0.4895304, -0.1037657, 1, 0, 0.3372549, 1,
1.643108, -0.5165917, 2.180344, 1, 0, 0.3294118, 1,
1.673207, -1.116444, 1.063198, 1, 0, 0.3254902, 1,
1.679206, -0.6535892, 0.5827591, 1, 0, 0.3176471, 1,
1.714186, -0.3065822, 2.511069, 1, 0, 0.3137255, 1,
1.722282, -0.7752286, 2.936353, 1, 0, 0.3058824, 1,
1.734561, -1.549941, 4.02723, 1, 0, 0.2980392, 1,
1.742585, 0.07528094, 2.742052, 1, 0, 0.2941177, 1,
1.75061, -1.007049, 2.412526, 1, 0, 0.2862745, 1,
1.75982, -0.006309961, 1.401117, 1, 0, 0.282353, 1,
1.767819, 1.889001, 0.7195131, 1, 0, 0.2745098, 1,
1.800475, 0.6053755, -1.020549, 1, 0, 0.2705882, 1,
1.800976, 1.550378, 1.4392, 1, 0, 0.2627451, 1,
1.805208, 0.6645983, 2.660276, 1, 0, 0.2588235, 1,
1.829289, -2.44493, 1.727928, 1, 0, 0.2509804, 1,
1.83681, 0.2236261, 2.037831, 1, 0, 0.2470588, 1,
1.840032, -0.6565785, 1.010608, 1, 0, 0.2392157, 1,
1.852231, -0.08280811, 3.243554, 1, 0, 0.2352941, 1,
1.875877, 1.119384, 2.307912, 1, 0, 0.227451, 1,
1.89155, 0.9867294, 0.2429933, 1, 0, 0.2235294, 1,
1.920872, 1.983853, 0.7624955, 1, 0, 0.2156863, 1,
1.927644, 1.126237, 0.7623527, 1, 0, 0.2117647, 1,
1.932155, -1.072624, 1.658258, 1, 0, 0.2039216, 1,
1.946298, -0.09302831, 2.193254, 1, 0, 0.1960784, 1,
1.990003, 0.4627962, 0.7827344, 1, 0, 0.1921569, 1,
2.040569, 1.598829, 0.2258738, 1, 0, 0.1843137, 1,
2.051065, -0.558519, 1.747151, 1, 0, 0.1803922, 1,
2.069887, 0.5658586, 0.4310091, 1, 0, 0.172549, 1,
2.078654, -0.1042785, 0.9614292, 1, 0, 0.1686275, 1,
2.100741, -0.5417126, 1.62434, 1, 0, 0.1607843, 1,
2.117526, -0.1582391, 3.235609, 1, 0, 0.1568628, 1,
2.123737, 0.1341503, 2.818416, 1, 0, 0.1490196, 1,
2.148217, 0.8852302, 1.051206, 1, 0, 0.145098, 1,
2.22983, 1.368349, 1.749635, 1, 0, 0.1372549, 1,
2.237878, -2.12635, 2.605938, 1, 0, 0.1333333, 1,
2.282484, -0.7015138, 1.207699, 1, 0, 0.1254902, 1,
2.291967, -0.1189518, 0.03361808, 1, 0, 0.1215686, 1,
2.296885, -0.8789832, 1.17129, 1, 0, 0.1137255, 1,
2.327942, -1.458559, 1.252349, 1, 0, 0.1098039, 1,
2.341541, 0.3538457, 1.267924, 1, 0, 0.1019608, 1,
2.442272, 0.8684831, -0.1821024, 1, 0, 0.09411765, 1,
2.443634, 0.4406129, 0.1111871, 1, 0, 0.09019608, 1,
2.444834, -1.215654, 2.07432, 1, 0, 0.08235294, 1,
2.449011, 0.05670759, 0.4325228, 1, 0, 0.07843138, 1,
2.532763, -0.6207868, 0.8140855, 1, 0, 0.07058824, 1,
2.535077, 0.1994997, 2.021945, 1, 0, 0.06666667, 1,
2.649953, 0.01188931, 2.932762, 1, 0, 0.05882353, 1,
2.664846, 1.491465, 0.483144, 1, 0, 0.05490196, 1,
2.79579, -0.3421157, -0.4515488, 1, 0, 0.04705882, 1,
2.820919, 1.708746, 0.8648739, 1, 0, 0.04313726, 1,
2.876393, -1.003146, 1.814231, 1, 0, 0.03529412, 1,
2.939555, 0.501423, -0.135247, 1, 0, 0.03137255, 1,
2.953065, 0.9639866, 2.022464, 1, 0, 0.02352941, 1,
3.064878, 1.418333, 2.548792, 1, 0, 0.01960784, 1,
3.167806, 1.829432, 3.096713, 1, 0, 0.01176471, 1,
3.693975, -1.584245, 3.305794, 1, 0, 0.007843138, 1
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
0.2248355, -4.181749, -6.762534, 0, -0.5, 0.5, 0.5,
0.2248355, -4.181749, -6.762534, 1, -0.5, 0.5, 0.5,
0.2248355, -4.181749, -6.762534, 1, 1.5, 0.5, 0.5,
0.2248355, -4.181749, -6.762534, 0, 1.5, 0.5, 0.5
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
-4.420342, 0.002536297, -6.762534, 0, -0.5, 0.5, 0.5,
-4.420342, 0.002536297, -6.762534, 1, -0.5, 0.5, 0.5,
-4.420342, 0.002536297, -6.762534, 1, 1.5, 0.5, 0.5,
-4.420342, 0.002536297, -6.762534, 0, 1.5, 0.5, 0.5
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
-4.420342, -4.181749, 0.0843606, 0, -0.5, 0.5, 0.5,
-4.420342, -4.181749, 0.0843606, 1, -0.5, 0.5, 0.5,
-4.420342, -4.181749, 0.0843606, 1, 1.5, 0.5, 0.5,
-4.420342, -4.181749, 0.0843606, 0, 1.5, 0.5, 0.5
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
-3, -3.216145, -5.182482,
3, -3.216145, -5.182482,
-3, -3.216145, -5.182482,
-3, -3.377079, -5.445824,
-2, -3.216145, -5.182482,
-2, -3.377079, -5.445824,
-1, -3.216145, -5.182482,
-1, -3.377079, -5.445824,
0, -3.216145, -5.182482,
0, -3.377079, -5.445824,
1, -3.216145, -5.182482,
1, -3.377079, -5.445824,
2, -3.216145, -5.182482,
2, -3.377079, -5.445824,
3, -3.216145, -5.182482,
3, -3.377079, -5.445824
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
-3, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
-3, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
-3, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
-3, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
-2, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
-2, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
-2, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
-2, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
-1, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
-1, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
-1, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
-1, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
0, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
0, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
0, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
0, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
1, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
1, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
1, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
1, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
2, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
2, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
2, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
2, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5,
3, -3.698947, -5.972508, 0, -0.5, 0.5, 0.5,
3, -3.698947, -5.972508, 1, -0.5, 0.5, 0.5,
3, -3.698947, -5.972508, 1, 1.5, 0.5, 0.5,
3, -3.698947, -5.972508, 0, 1.5, 0.5, 0.5
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
-3.348378, -3, -5.182482,
-3.348378, 3, -5.182482,
-3.348378, -3, -5.182482,
-3.527039, -3, -5.445824,
-3.348378, -2, -5.182482,
-3.527039, -2, -5.445824,
-3.348378, -1, -5.182482,
-3.527039, -1, -5.445824,
-3.348378, 0, -5.182482,
-3.527039, 0, -5.445824,
-3.348378, 1, -5.182482,
-3.527039, 1, -5.445824,
-3.348378, 2, -5.182482,
-3.527039, 2, -5.445824,
-3.348378, 3, -5.182482,
-3.527039, 3, -5.445824
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
-3.884361, -3, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, -3, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, -3, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, -3, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, -2, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, -2, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, -2, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, -2, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, -1, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, -1, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, -1, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, -1, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, 0, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, 0, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, 0, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, 0, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, 1, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, 1, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, 1, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, 1, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, 2, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, 2, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, 2, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, 2, -5.972508, 0, 1.5, 0.5, 0.5,
-3.884361, 3, -5.972508, 0, -0.5, 0.5, 0.5,
-3.884361, 3, -5.972508, 1, -0.5, 0.5, 0.5,
-3.884361, 3, -5.972508, 1, 1.5, 0.5, 0.5,
-3.884361, 3, -5.972508, 0, 1.5, 0.5, 0.5
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
-3.348378, -3.216145, -4,
-3.348378, -3.216145, 4,
-3.348378, -3.216145, -4,
-3.527039, -3.377079, -4,
-3.348378, -3.216145, -2,
-3.527039, -3.377079, -2,
-3.348378, -3.216145, 0,
-3.527039, -3.377079, 0,
-3.348378, -3.216145, 2,
-3.527039, -3.377079, 2,
-3.348378, -3.216145, 4,
-3.527039, -3.377079, 4
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
-3.884361, -3.698947, -4, 0, -0.5, 0.5, 0.5,
-3.884361, -3.698947, -4, 1, -0.5, 0.5, 0.5,
-3.884361, -3.698947, -4, 1, 1.5, 0.5, 0.5,
-3.884361, -3.698947, -4, 0, 1.5, 0.5, 0.5,
-3.884361, -3.698947, -2, 0, -0.5, 0.5, 0.5,
-3.884361, -3.698947, -2, 1, -0.5, 0.5, 0.5,
-3.884361, -3.698947, -2, 1, 1.5, 0.5, 0.5,
-3.884361, -3.698947, -2, 0, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 0, 0, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 0, 1, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 0, 1, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 0, 0, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 2, 0, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 2, 1, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 2, 1, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 2, 0, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 4, 0, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 4, 1, -0.5, 0.5, 0.5,
-3.884361, -3.698947, 4, 1, 1.5, 0.5, 0.5,
-3.884361, -3.698947, 4, 0, 1.5, 0.5, 0.5
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
-3.348378, -3.216145, -5.182482,
-3.348378, 3.221217, -5.182482,
-3.348378, -3.216145, 5.351203,
-3.348378, 3.221217, 5.351203,
-3.348378, -3.216145, -5.182482,
-3.348378, -3.216145, 5.351203,
-3.348378, 3.221217, -5.182482,
-3.348378, 3.221217, 5.351203,
-3.348378, -3.216145, -5.182482,
3.798049, -3.216145, -5.182482,
-3.348378, -3.216145, 5.351203,
3.798049, -3.216145, 5.351203,
-3.348378, 3.221217, -5.182482,
3.798049, 3.221217, -5.182482,
-3.348378, 3.221217, 5.351203,
3.798049, 3.221217, 5.351203,
3.798049, -3.216145, -5.182482,
3.798049, 3.221217, -5.182482,
3.798049, -3.216145, 5.351203,
3.798049, 3.221217, 5.351203,
3.798049, -3.216145, -5.182482,
3.798049, -3.216145, 5.351203,
3.798049, 3.221217, -5.182482,
3.798049, 3.221217, 5.351203
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
var radius = 7.616846;
var distance = 33.88821;
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
mvMatrix.translate( -0.2248355, -0.002536297, -0.0843606 );
mvMatrix.scale( 1.152392, 1.279326, 0.7818236 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.88821);
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
Vitamin_B12<-read.table("Vitamin_B12.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Vitamin_B12$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
y<-Vitamin_B12$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
z<-Vitamin_B12$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
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
-3.244304, 1.125499, -0.3902364, 0, 0, 1, 1, 1,
-2.8785, -1.264786, -1.557735, 1, 0, 0, 1, 1,
-2.672118, 0.5915565, -3.048284, 1, 0, 0, 1, 1,
-2.615532, -1.652786, -1.091574, 1, 0, 0, 1, 1,
-2.572286, -1.293579, -2.606931, 1, 0, 0, 1, 1,
-2.539627, 1.521411, -0.7065035, 1, 0, 0, 1, 1,
-2.482612, -0.7076489, -1.921225, 0, 0, 0, 1, 1,
-2.444777, -0.8371338, -1.373593, 0, 0, 0, 1, 1,
-2.422993, 0.5443909, -2.73936, 0, 0, 0, 1, 1,
-2.414315, 0.2376539, -1.989904, 0, 0, 0, 1, 1,
-2.386225, 0.9323038, -0.01787578, 0, 0, 0, 1, 1,
-2.348286, 0.4364933, -1.672202, 0, 0, 0, 1, 1,
-2.339721, -1.067376, -1.444807, 0, 0, 0, 1, 1,
-2.307306, -0.7968224, -3.692261, 1, 1, 1, 1, 1,
-2.294388, -1.453133, -0.6193305, 1, 1, 1, 1, 1,
-2.281222, 2.770454, -1.425477, 1, 1, 1, 1, 1,
-2.260862, 0.7558053, -3.197281, 1, 1, 1, 1, 1,
-2.254278, 0.1258874, -2.919003, 1, 1, 1, 1, 1,
-2.251967, 0.5926755, -1.073563, 1, 1, 1, 1, 1,
-2.237467, -2.597591, -2.271282, 1, 1, 1, 1, 1,
-2.215382, -0.6222453, -2.651585, 1, 1, 1, 1, 1,
-2.204636, -0.7823626, -3.237244, 1, 1, 1, 1, 1,
-2.115888, -0.04831231, -2.649478, 1, 1, 1, 1, 1,
-2.109385, 0.5487609, -1.579824, 1, 1, 1, 1, 1,
-2.078974, -0.99362, -0.4002591, 1, 1, 1, 1, 1,
-2.072114, 0.4992729, -2.336965, 1, 1, 1, 1, 1,
-2.051447, 1.640833, -0.4043722, 1, 1, 1, 1, 1,
-2.001194, -1.013716, -1.473984, 1, 1, 1, 1, 1,
-1.974243, -0.6873724, -1.698834, 0, 0, 1, 1, 1,
-1.967937, -1.026043, -3.164936, 1, 0, 0, 1, 1,
-1.964404, 1.041358, -0.2021031, 1, 0, 0, 1, 1,
-1.956384, -0.2767355, -2.070875, 1, 0, 0, 1, 1,
-1.940815, -0.67199, -3.010424, 1, 0, 0, 1, 1,
-1.940165, -0.7133078, -2.692408, 1, 0, 0, 1, 1,
-1.931392, -0.3585794, 0.03436884, 0, 0, 0, 1, 1,
-1.928474, -0.4467698, -0.7758967, 0, 0, 0, 1, 1,
-1.925807, -0.8077536, -1.805182, 0, 0, 0, 1, 1,
-1.912588, 0.6513597, -1.296483, 0, 0, 0, 1, 1,
-1.90288, -0.4221438, -3.042573, 0, 0, 0, 1, 1,
-1.879357, -0.1173972, -1.446918, 0, 0, 0, 1, 1,
-1.871315, 0.4259958, 0.3170148, 0, 0, 0, 1, 1,
-1.834637, -0.118748, -0.8635158, 1, 1, 1, 1, 1,
-1.802846, 1.285547, -1.652734, 1, 1, 1, 1, 1,
-1.802747, 1.538651, -1.222065, 1, 1, 1, 1, 1,
-1.787218, 0.9429821, -0.7531109, 1, 1, 1, 1, 1,
-1.786727, 0.4260913, -2.024559, 1, 1, 1, 1, 1,
-1.768651, -1.847883, -2.916686, 1, 1, 1, 1, 1,
-1.740026, 1.229302, -1.072626, 1, 1, 1, 1, 1,
-1.739021, -0.279714, -2.888592, 1, 1, 1, 1, 1,
-1.725862, -1.302563, -2.133043, 1, 1, 1, 1, 1,
-1.719741, -0.7155957, -3.125912, 1, 1, 1, 1, 1,
-1.71663, -0.4831445, -2.30286, 1, 1, 1, 1, 1,
-1.709942, 3.127469, -1.430837, 1, 1, 1, 1, 1,
-1.708268, -0.3707165, -1.866313, 1, 1, 1, 1, 1,
-1.69388, 0.3966061, 0.4432257, 1, 1, 1, 1, 1,
-1.65651, 1.260222, -1.738784, 1, 1, 1, 1, 1,
-1.645564, 0.3475963, -0.4621061, 0, 0, 1, 1, 1,
-1.64221, -0.623173, -3.378891, 1, 0, 0, 1, 1,
-1.639623, 1.54475, -3.145766, 1, 0, 0, 1, 1,
-1.635782, 1.169885, -2.176328, 1, 0, 0, 1, 1,
-1.618531, -2.101609, -2.542544, 1, 0, 0, 1, 1,
-1.610787, -1.113032, -4.091517, 1, 0, 0, 1, 1,
-1.600813, 1.377656, -0.9402139, 0, 0, 0, 1, 1,
-1.597503, 0.2363571, -1.987357, 0, 0, 0, 1, 1,
-1.589227, 0.7914467, -0.5673545, 0, 0, 0, 1, 1,
-1.587164, -1.385759, -2.145117, 0, 0, 0, 1, 1,
-1.586819, -1.26079, -2.76144, 0, 0, 0, 1, 1,
-1.583166, 1.801626, 2.069352, 0, 0, 0, 1, 1,
-1.577235, -0.2372359, -1.220262, 0, 0, 0, 1, 1,
-1.565784, 1.509344, 1.123075, 1, 1, 1, 1, 1,
-1.546387, 0.1838533, -3.073171, 1, 1, 1, 1, 1,
-1.546296, -1.052951, -0.512741, 1, 1, 1, 1, 1,
-1.546276, 0.1834467, -2.789173, 1, 1, 1, 1, 1,
-1.534674, 1.834078, -0.8147444, 1, 1, 1, 1, 1,
-1.519926, -0.7399925, -0.1400208, 1, 1, 1, 1, 1,
-1.51816, -0.4497769, -1.083838, 1, 1, 1, 1, 1,
-1.514423, -0.4254604, -0.9428984, 1, 1, 1, 1, 1,
-1.506359, 0.3163412, -2.92996, 1, 1, 1, 1, 1,
-1.497867, 0.03432175, -0.4698076, 1, 1, 1, 1, 1,
-1.491198, 0.08250227, -1.569921, 1, 1, 1, 1, 1,
-1.480877, 0.3763378, -2.548559, 1, 1, 1, 1, 1,
-1.454247, 0.3776819, -3.616273, 1, 1, 1, 1, 1,
-1.452946, -0.04886042, -0.9642243, 1, 1, 1, 1, 1,
-1.450478, 1.822143, -0.03955729, 1, 1, 1, 1, 1,
-1.440701, 0.1468665, -0.90795, 0, 0, 1, 1, 1,
-1.436821, 0.7867117, -0.6844717, 1, 0, 0, 1, 1,
-1.424331, -2.560804, -1.888827, 1, 0, 0, 1, 1,
-1.416713, 0.3376917, -0.4860593, 1, 0, 0, 1, 1,
-1.407711, -0.7675257, -2.518845, 1, 0, 0, 1, 1,
-1.405962, 0.4728311, -2.427279, 1, 0, 0, 1, 1,
-1.394717, 0.5301375, -0.7678405, 0, 0, 0, 1, 1,
-1.392869, 0.1967936, -2.39897, 0, 0, 0, 1, 1,
-1.389898, 0.9849467, -0.5581759, 0, 0, 0, 1, 1,
-1.387606, 0.8423758, -0.7652675, 0, 0, 0, 1, 1,
-1.385745, 0.7248179, -0.8509203, 0, 0, 0, 1, 1,
-1.38398, -0.2193104, -0.03267473, 0, 0, 0, 1, 1,
-1.358964, 1.035124, -1.158738, 0, 0, 0, 1, 1,
-1.355707, -0.4805183, -1.828468, 1, 1, 1, 1, 1,
-1.340116, 1.271896, -0.03147342, 1, 1, 1, 1, 1,
-1.337532, 1.656929, -0.9522821, 1, 1, 1, 1, 1,
-1.330187, 0.36062, -1.350591, 1, 1, 1, 1, 1,
-1.329889, -1.177375, 0.8344195, 1, 1, 1, 1, 1,
-1.32684, -2.378571, -4.015936, 1, 1, 1, 1, 1,
-1.316356, -0.7144895, -3.199657, 1, 1, 1, 1, 1,
-1.293276, -0.06413157, -1.93708, 1, 1, 1, 1, 1,
-1.265268, -0.6578488, -2.668151, 1, 1, 1, 1, 1,
-1.258518, -1.142475, -3.178765, 1, 1, 1, 1, 1,
-1.252985, -0.8997662, -1.713217, 1, 1, 1, 1, 1,
-1.234519, 0.2867654, -0.4286206, 1, 1, 1, 1, 1,
-1.226711, 0.1717243, -1.543852, 1, 1, 1, 1, 1,
-1.218696, -2.851605, -3.31059, 1, 1, 1, 1, 1,
-1.218392, -0.9942721, -2.051404, 1, 1, 1, 1, 1,
-1.215781, -1.215381, -0.884609, 0, 0, 1, 1, 1,
-1.201342, -0.4948362, -1.456209, 1, 0, 0, 1, 1,
-1.197916, -0.3411227, -1.316008, 1, 0, 0, 1, 1,
-1.18303, -0.6887708, -1.6331, 1, 0, 0, 1, 1,
-1.163054, 0.7464071, -1.904804, 1, 0, 0, 1, 1,
-1.158988, -0.02623137, -1.635552, 1, 0, 0, 1, 1,
-1.151799, -0.1103077, -1.715571, 0, 0, 0, 1, 1,
-1.149865, -1.672597, -4.540048, 0, 0, 0, 1, 1,
-1.146981, -0.642012, -2.892173, 0, 0, 0, 1, 1,
-1.14106, -0.5706904, -1.240727, 0, 0, 0, 1, 1,
-1.139212, 0.1337089, -3.561979, 0, 0, 0, 1, 1,
-1.134136, 0.586988, 0.4593077, 0, 0, 0, 1, 1,
-1.134083, 1.001908, -1.267561, 0, 0, 0, 1, 1,
-1.124249, -0.9818249, -2.97452, 1, 1, 1, 1, 1,
-1.114191, 0.3300102, -0.3634217, 1, 1, 1, 1, 1,
-1.113842, -0.8160261, -1.405771, 1, 1, 1, 1, 1,
-1.108909, 0.6176035, -1.739685, 1, 1, 1, 1, 1,
-1.106705, -0.3096149, 0.3937702, 1, 1, 1, 1, 1,
-1.101285, 0.4094591, -1.201722, 1, 1, 1, 1, 1,
-1.10063, -1.094184, -1.415179, 1, 1, 1, 1, 1,
-1.098283, -1.138788, -0.9317248, 1, 1, 1, 1, 1,
-1.096669, -1.037178, -2.612598, 1, 1, 1, 1, 1,
-1.083025, -0.2622804, -2.450847, 1, 1, 1, 1, 1,
-1.068496, -0.6199389, -1.874115, 1, 1, 1, 1, 1,
-1.058921, 1.484126, 1.541074, 1, 1, 1, 1, 1,
-1.058756, -1.184119, -2.417951, 1, 1, 1, 1, 1,
-1.055298, 0.5218424, 0.7247028, 1, 1, 1, 1, 1,
-1.052871, 1.100719, -1.522437, 1, 1, 1, 1, 1,
-1.043248, -0.298067, -1.301562, 0, 0, 1, 1, 1,
-1.03673, 1.566781, -1.295593, 1, 0, 0, 1, 1,
-1.025981, 1.248867, 1.618587, 1, 0, 0, 1, 1,
-1.017018, 1.135787, -2.937902, 1, 0, 0, 1, 1,
-1.008251, 0.8377738, 0.91827, 1, 0, 0, 1, 1,
-1.006311, 0.421853, -1.046194, 1, 0, 0, 1, 1,
-1.004414, -1.145899, -2.016999, 0, 0, 0, 1, 1,
-1.000927, 0.6477709, -2.349231, 0, 0, 0, 1, 1,
-0.9986704, -0.397498, -0.8035903, 0, 0, 0, 1, 1,
-0.9924953, -0.418095, -2.90954, 0, 0, 0, 1, 1,
-0.9879396, -0.007405986, -2.929419, 0, 0, 0, 1, 1,
-0.9878252, 0.4628032, -1.697757, 0, 0, 0, 1, 1,
-0.9876618, -0.8062618, -2.932754, 0, 0, 0, 1, 1,
-0.986621, -0.06933326, -0.8014397, 1, 1, 1, 1, 1,
-0.985449, -0.1406603, -2.198951, 1, 1, 1, 1, 1,
-0.9853566, 0.8941624, -0.7137524, 1, 1, 1, 1, 1,
-0.9847178, 0.0516528, -1.453035, 1, 1, 1, 1, 1,
-0.9834622, -1.861778, -2.508775, 1, 1, 1, 1, 1,
-0.97961, -0.1838837, -2.781204, 1, 1, 1, 1, 1,
-0.9755817, 0.2225381, -1.770883, 1, 1, 1, 1, 1,
-0.9744867, 0.04487048, -1.425695, 1, 1, 1, 1, 1,
-0.972946, 1.780248, -0.01144143, 1, 1, 1, 1, 1,
-0.9729438, -1.632773, -4.038097, 1, 1, 1, 1, 1,
-0.9641855, -0.4941248, -1.620736, 1, 1, 1, 1, 1,
-0.9568989, 1.099586, -0.4704704, 1, 1, 1, 1, 1,
-0.9484242, 0.06107632, -1.950857, 1, 1, 1, 1, 1,
-0.9481781, 0.4568363, -0.5664831, 1, 1, 1, 1, 1,
-0.9444727, -0.2205259, -0.5144891, 1, 1, 1, 1, 1,
-0.943256, -0.3916523, -0.7802866, 0, 0, 1, 1, 1,
-0.942407, 1.898772, -0.4859082, 1, 0, 0, 1, 1,
-0.9401651, -0.4519863, -2.164656, 1, 0, 0, 1, 1,
-0.9327942, 0.1140668, -0.4042128, 1, 0, 0, 1, 1,
-0.9291267, 0.04060054, -2.024285, 1, 0, 0, 1, 1,
-0.923458, 0.4723296, -0.5105811, 1, 0, 0, 1, 1,
-0.9211745, 0.8365016, -0.7308868, 0, 0, 0, 1, 1,
-0.9205632, 1.260643, -0.6803878, 0, 0, 0, 1, 1,
-0.9202202, 0.9516023, -1.82417, 0, 0, 0, 1, 1,
-0.9171246, -1.344089, -1.197924, 0, 0, 0, 1, 1,
-0.9166967, 0.07207981, -0.9678111, 0, 0, 0, 1, 1,
-0.9092246, -1.174209, -1.841514, 0, 0, 0, 1, 1,
-0.9082898, -1.56263, -4.389774, 0, 0, 0, 1, 1,
-0.9056024, -0.503152, -2.642509, 1, 1, 1, 1, 1,
-0.8975147, 1.201177, -0.7938594, 1, 1, 1, 1, 1,
-0.8915979, 0.8309352, -0.7185212, 1, 1, 1, 1, 1,
-0.8883688, 0.9980445, 0.8241684, 1, 1, 1, 1, 1,
-0.8880122, 1.144297, -1.048139, 1, 1, 1, 1, 1,
-0.8873079, -1.30146, -3.266711, 1, 1, 1, 1, 1,
-0.8856277, 1.232694, -0.9868566, 1, 1, 1, 1, 1,
-0.8713536, -0.0720048, -2.096701, 1, 1, 1, 1, 1,
-0.8697016, 0.9465756, -0.1734853, 1, 1, 1, 1, 1,
-0.8690128, 1.060464, -0.5635149, 1, 1, 1, 1, 1,
-0.8677089, 1.047265, 0.2599365, 1, 1, 1, 1, 1,
-0.8674811, -0.526054, -1.733695, 1, 1, 1, 1, 1,
-0.8632576, 0.2495565, -1.229824, 1, 1, 1, 1, 1,
-0.8566508, 0.4220735, -1.296428, 1, 1, 1, 1, 1,
-0.8563679, -0.6597773, -3.282529, 1, 1, 1, 1, 1,
-0.8524626, 0.1392528, -2.30757, 0, 0, 1, 1, 1,
-0.8501281, 1.469436, -1.451959, 1, 0, 0, 1, 1,
-0.8416758, 2.256679, 0.639604, 1, 0, 0, 1, 1,
-0.8390005, -0.6455479, -0.7562717, 1, 0, 0, 1, 1,
-0.8321393, 0.2395047, -2.521849, 1, 0, 0, 1, 1,
-0.8294322, -1.325357, -1.884935, 1, 0, 0, 1, 1,
-0.8286594, -1.47888, -4.21761, 0, 0, 0, 1, 1,
-0.8277065, -0.3442833, -2.245476, 0, 0, 0, 1, 1,
-0.8244817, -0.4966212, -4.11444, 0, 0, 0, 1, 1,
-0.8236861, -0.4452142, -1.15399, 0, 0, 0, 1, 1,
-0.8213193, -0.1152579, -0.4169746, 0, 0, 0, 1, 1,
-0.8182359, 1.079144, -1.122475, 0, 0, 0, 1, 1,
-0.8113266, 0.1988653, -1.94689, 0, 0, 0, 1, 1,
-0.8058162, -1.785873, -3.521945, 1, 1, 1, 1, 1,
-0.8014004, -0.4670208, -1.48542, 1, 1, 1, 1, 1,
-0.7996954, -0.126134, -3.098091, 1, 1, 1, 1, 1,
-0.7935668, 0.8592114, 1.625056, 1, 1, 1, 1, 1,
-0.7885376, -1.956365, -3.928563, 1, 1, 1, 1, 1,
-0.7873099, -0.2080762, -3.125164, 1, 1, 1, 1, 1,
-0.7841082, 1.708957, 0.2251482, 1, 1, 1, 1, 1,
-0.7806109, -1.400881, -3.099041, 1, 1, 1, 1, 1,
-0.7755927, -2.368541, -3.360229, 1, 1, 1, 1, 1,
-0.7705194, -0.6278162, -2.822746, 1, 1, 1, 1, 1,
-0.7694871, 0.5416248, -2.187389, 1, 1, 1, 1, 1,
-0.765721, -0.00373104, -1.366637, 1, 1, 1, 1, 1,
-0.7516522, -0.05850164, -2.550199, 1, 1, 1, 1, 1,
-0.7444983, -0.2367023, -1.689758, 1, 1, 1, 1, 1,
-0.7283, 1.298217, -0.1333014, 1, 1, 1, 1, 1,
-0.7243627, 0.5835627, -1.822177, 0, 0, 1, 1, 1,
-0.7236196, 0.02957978, -0.3505231, 1, 0, 0, 1, 1,
-0.7227226, 0.9780181, -0.1167871, 1, 0, 0, 1, 1,
-0.7201709, -1.760549, -2.296624, 1, 0, 0, 1, 1,
-0.7053881, -0.2557857, -2.979815, 1, 0, 0, 1, 1,
-0.6979612, -1.871388, -0.343304, 1, 0, 0, 1, 1,
-0.6904959, -0.5549269, -3.78459, 0, 0, 0, 1, 1,
-0.6895036, 1.562005, 1.825944, 0, 0, 0, 1, 1,
-0.6893613, 2.77091, -0.9412259, 0, 0, 0, 1, 1,
-0.6886489, 2.647165, 0.8966335, 0, 0, 0, 1, 1,
-0.6872929, -1.37004, -2.410437, 0, 0, 0, 1, 1,
-0.6758099, -0.6384587, -3.252557, 0, 0, 0, 1, 1,
-0.6649399, -0.2832069, -2.892264, 0, 0, 0, 1, 1,
-0.664511, 0.8244272, 0.7114918, 1, 1, 1, 1, 1,
-0.6637892, 1.271308, 0.2671053, 1, 1, 1, 1, 1,
-0.6617931, -1.547677, -2.570088, 1, 1, 1, 1, 1,
-0.6577974, -0.2496191, -3.744143, 1, 1, 1, 1, 1,
-0.6572503, 1.187986, -0.01149972, 1, 1, 1, 1, 1,
-0.6556253, -1.382976, -2.802684, 1, 1, 1, 1, 1,
-0.6448995, 2.011987, -0.2094445, 1, 1, 1, 1, 1,
-0.641528, -0.7423126, -3.313456, 1, 1, 1, 1, 1,
-0.6377851, -0.5019509, -3.262712, 1, 1, 1, 1, 1,
-0.6373785, 1.064877, -1.242973, 1, 1, 1, 1, 1,
-0.6363443, -1.029876, -3.241115, 1, 1, 1, 1, 1,
-0.633132, 0.06945695, -3.13283, 1, 1, 1, 1, 1,
-0.629824, -0.9209114, -3.327278, 1, 1, 1, 1, 1,
-0.6292189, -0.5188259, -1.297731, 1, 1, 1, 1, 1,
-0.6281145, 0.6039454, -2.129075, 1, 1, 1, 1, 1,
-0.6155522, 0.8788119, 0.7498641, 0, 0, 1, 1, 1,
-0.6132114, -0.7001488, -4.433605, 1, 0, 0, 1, 1,
-0.6105635, 0.4530034, 0.7292907, 1, 0, 0, 1, 1,
-0.607971, 1.608649, 0.747785, 1, 0, 0, 1, 1,
-0.60707, 0.4906947, -1.730679, 1, 0, 0, 1, 1,
-0.6063547, 0.4213697, -1.129778, 1, 0, 0, 1, 1,
-0.6055815, -0.2606296, -3.319418, 0, 0, 0, 1, 1,
-0.6028971, 0.4250527, 0.2065333, 0, 0, 0, 1, 1,
-0.6013384, 0.4014326, -2.217149, 0, 0, 0, 1, 1,
-0.5935301, 0.9128792, 0.3947152, 0, 0, 0, 1, 1,
-0.5930257, -0.8274882, -3.298438, 0, 0, 0, 1, 1,
-0.5923693, 1.503691, 0.06763584, 0, 0, 0, 1, 1,
-0.591347, -0.6428716, -3.545796, 0, 0, 0, 1, 1,
-0.5891668, -0.3535998, -1.901257, 1, 1, 1, 1, 1,
-0.5825787, 0.4741565, -0.1544522, 1, 1, 1, 1, 1,
-0.5770547, -1.408892, -1.983481, 1, 1, 1, 1, 1,
-0.5765541, -1.518892, -2.663167, 1, 1, 1, 1, 1,
-0.5739006, -0.5642943, -2.187756, 1, 1, 1, 1, 1,
-0.5705805, -0.4294452, -1.019531, 1, 1, 1, 1, 1,
-0.5667679, -1.878323, -2.352213, 1, 1, 1, 1, 1,
-0.5652437, -0.7009021, -2.714431, 1, 1, 1, 1, 1,
-0.5601113, -0.2639224, -1.623517, 1, 1, 1, 1, 1,
-0.5590937, -3.122397, -3.279202, 1, 1, 1, 1, 1,
-0.5588514, -0.6238021, -2.236778, 1, 1, 1, 1, 1,
-0.5582271, -0.1572882, -1.93403, 1, 1, 1, 1, 1,
-0.5571745, 1.321081, -1.252632, 1, 1, 1, 1, 1,
-0.5564418, -1.522052, -1.769669, 1, 1, 1, 1, 1,
-0.5488166, -0.5388132, -2.246534, 1, 1, 1, 1, 1,
-0.5434584, 1.066925, 0.6301749, 0, 0, 1, 1, 1,
-0.5416955, -1.099211, -1.874022, 1, 0, 0, 1, 1,
-0.5412471, -1.697474, -2.584068, 1, 0, 0, 1, 1,
-0.5405708, 1.967028, -0.2636217, 1, 0, 0, 1, 1,
-0.5390302, -0.5182274, -3.056686, 1, 0, 0, 1, 1,
-0.5358561, -0.6217757, -3.573266, 1, 0, 0, 1, 1,
-0.5354451, -0.1055944, -1.373677, 0, 0, 0, 1, 1,
-0.5307859, 0.4994762, -2.233705, 0, 0, 0, 1, 1,
-0.5305632, -0.7582934, -1.590709, 0, 0, 0, 1, 1,
-0.5255606, -0.2259518, -1.895866, 0, 0, 0, 1, 1,
-0.5215839, 0.237616, -0.2797173, 0, 0, 0, 1, 1,
-0.5211657, -1.523125, -0.6883084, 0, 0, 0, 1, 1,
-0.5193636, -0.2226383, -3.341787, 0, 0, 0, 1, 1,
-0.5154778, 0.6993515, 0.009236176, 1, 1, 1, 1, 1,
-0.5061774, -0.5241739, -1.782515, 1, 1, 1, 1, 1,
-0.5053485, 2.179364, -2.097264, 1, 1, 1, 1, 1,
-0.5044825, 0.3323939, 0.1530257, 1, 1, 1, 1, 1,
-0.5035806, -0.1533268, -2.384778, 1, 1, 1, 1, 1,
-0.4949823, -0.8131162, -1.852424, 1, 1, 1, 1, 1,
-0.4916681, -1.277191, -3.313631, 1, 1, 1, 1, 1,
-0.484241, -0.9595197, -1.041795, 1, 1, 1, 1, 1,
-0.478036, -1.336245, -0.3573648, 1, 1, 1, 1, 1,
-0.4769461, -0.9989443, -2.896044, 1, 1, 1, 1, 1,
-0.4744344, 1.380213, 1.586041, 1, 1, 1, 1, 1,
-0.4726198, -0.1642688, -2.992725, 1, 1, 1, 1, 1,
-0.4696204, 0.3736667, -0.9046443, 1, 1, 1, 1, 1,
-0.4696114, 0.2726346, -0.4374929, 1, 1, 1, 1, 1,
-0.4680111, -2.024412, -2.818238, 1, 1, 1, 1, 1,
-0.4675687, 0.9795393, -0.1232588, 0, 0, 1, 1, 1,
-0.4624486, -1.18078, -3.086213, 1, 0, 0, 1, 1,
-0.4619687, 1.999272, 0.04253762, 1, 0, 0, 1, 1,
-0.4607776, -1.290949, -2.25372, 1, 0, 0, 1, 1,
-0.4606959, -1.39007, -2.982354, 1, 0, 0, 1, 1,
-0.4572832, -0.6457802, -1.555517, 1, 0, 0, 1, 1,
-0.4519958, 0.1711827, -1.837332, 0, 0, 0, 1, 1,
-0.4485775, -1.119341, -0.7267275, 0, 0, 0, 1, 1,
-0.4470902, 1.302969, -0.3378871, 0, 0, 0, 1, 1,
-0.4389342, 0.01316761, -1.219166, 0, 0, 0, 1, 1,
-0.4267179, 1.409998, -0.9726313, 0, 0, 0, 1, 1,
-0.4262256, 0.5201685, -0.856237, 0, 0, 0, 1, 1,
-0.4250485, -0.381299, -2.693645, 0, 0, 0, 1, 1,
-0.423172, 0.5975485, -0.2737085, 1, 1, 1, 1, 1,
-0.4229112, -0.6470706, -2.433487, 1, 1, 1, 1, 1,
-0.4223901, 0.9230949, 0.385095, 1, 1, 1, 1, 1,
-0.4206746, 0.7386004, 0.1062804, 1, 1, 1, 1, 1,
-0.4196117, 0.07362448, -1.345491, 1, 1, 1, 1, 1,
-0.4188868, 0.4731891, -0.4435417, 1, 1, 1, 1, 1,
-0.4133018, 1.266963, -1.793408, 1, 1, 1, 1, 1,
-0.4070218, -0.07144918, 0.1238773, 1, 1, 1, 1, 1,
-0.4060169, 1.321799, -1.45419, 1, 1, 1, 1, 1,
-0.4043292, 1.271486, 0.71719, 1, 1, 1, 1, 1,
-0.4032371, 0.8462865, 0.5786935, 1, 1, 1, 1, 1,
-0.4000266, 0.2226225, -1.453533, 1, 1, 1, 1, 1,
-0.3998166, 0.6844075, 0.9557941, 1, 1, 1, 1, 1,
-0.3983292, -1.466237, -4.430397, 1, 1, 1, 1, 1,
-0.3979296, 0.6508304, 1.203348, 1, 1, 1, 1, 1,
-0.3929594, -2.044634, -2.724001, 0, 0, 1, 1, 1,
-0.3929287, 1.070258, -0.5023329, 1, 0, 0, 1, 1,
-0.3927742, 0.8940439, 0.9951593, 1, 0, 0, 1, 1,
-0.3917059, -0.1585329, -1.236432, 1, 0, 0, 1, 1,
-0.391623, 0.06211142, -0.7812908, 1, 0, 0, 1, 1,
-0.3897123, -0.7756874, -2.983448, 1, 0, 0, 1, 1,
-0.3854467, -2.940255, -2.927123, 0, 0, 0, 1, 1,
-0.3849744, 2.172059, -3.148624, 0, 0, 0, 1, 1,
-0.3829185, -0.4022345, -3.336669, 0, 0, 0, 1, 1,
-0.382371, 0.4733203, 1.210242, 0, 0, 0, 1, 1,
-0.3791814, 0.5140312, -0.9704991, 0, 0, 0, 1, 1,
-0.378192, -0.3865063, -2.178778, 0, 0, 0, 1, 1,
-0.36835, 1.115356, -1.008884, 0, 0, 0, 1, 1,
-0.3681564, -0.5680686, -1.706302, 1, 1, 1, 1, 1,
-0.3672291, 0.1860906, -2.005385, 1, 1, 1, 1, 1,
-0.3651301, 0.7448174, -2.47953, 1, 1, 1, 1, 1,
-0.361712, -1.009732, -3.506666, 1, 1, 1, 1, 1,
-0.3616227, -1.024422, -2.005288, 1, 1, 1, 1, 1,
-0.3577515, -2.038325, -1.908649, 1, 1, 1, 1, 1,
-0.3533365, 0.1131995, -0.6917614, 1, 1, 1, 1, 1,
-0.3525445, -1.429411, -3.150787, 1, 1, 1, 1, 1,
-0.3485591, 0.007287194, -1.350668, 1, 1, 1, 1, 1,
-0.3484879, -1.555897, -1.760656, 1, 1, 1, 1, 1,
-0.3454217, 1.626841, -1.673533, 1, 1, 1, 1, 1,
-0.3391636, 0.5317842, -1.474076, 1, 1, 1, 1, 1,
-0.334965, -1.40809, -5.029078, 1, 1, 1, 1, 1,
-0.3345681, -0.3009306, -3.052104, 1, 1, 1, 1, 1,
-0.3292906, 0.2677707, -0.7254987, 1, 1, 1, 1, 1,
-0.3277743, -0.4181105, -2.097476, 0, 0, 1, 1, 1,
-0.3271097, 2.306521, -1.100835, 1, 0, 0, 1, 1,
-0.3255522, 0.3767267, 0.0646975, 1, 0, 0, 1, 1,
-0.3240177, 0.2900482, -0.4993175, 1, 0, 0, 1, 1,
-0.3216303, -0.05808436, 0.2046038, 1, 0, 0, 1, 1,
-0.3212818, 0.970162, -0.4198335, 1, 0, 0, 1, 1,
-0.3193884, 0.3916308, 0.1627099, 0, 0, 0, 1, 1,
-0.3185623, 0.8279553, -1.64667, 0, 0, 0, 1, 1,
-0.3125665, -0.7353627, -2.758338, 0, 0, 0, 1, 1,
-0.3115968, -2.54996, -3.783677, 0, 0, 0, 1, 1,
-0.3094842, -0.1952098, -1.876769, 0, 0, 0, 1, 1,
-0.3073611, 1.689767, 2.088815, 0, 0, 0, 1, 1,
-0.3063304, 0.8503111, -1.042189, 0, 0, 0, 1, 1,
-0.2972751, -0.1771215, -1.574618, 1, 1, 1, 1, 1,
-0.2917177, 0.6209161, -0.917882, 1, 1, 1, 1, 1,
-0.2824296, 1.465311, 0.4043235, 1, 1, 1, 1, 1,
-0.2802641, 0.3155022, -0.1554509, 1, 1, 1, 1, 1,
-0.2782884, 0.1703433, -2.242399, 1, 1, 1, 1, 1,
-0.2748569, 0.4295758, -0.4015032, 1, 1, 1, 1, 1,
-0.2716218, -1.045054, -0.5506516, 1, 1, 1, 1, 1,
-0.2690951, -0.2804675, -1.596694, 1, 1, 1, 1, 1,
-0.2656495, 0.5341522, 0.3303991, 1, 1, 1, 1, 1,
-0.2627697, 1.694923, -0.9502206, 1, 1, 1, 1, 1,
-0.2612848, -1.641518, -2.626084, 1, 1, 1, 1, 1,
-0.2608667, -0.0722632, -1.307668, 1, 1, 1, 1, 1,
-0.2606154, 0.07765903, -1.165752, 1, 1, 1, 1, 1,
-0.2567316, 0.07899823, -1.658423, 1, 1, 1, 1, 1,
-0.2508697, -0.7408543, -3.237587, 1, 1, 1, 1, 1,
-0.2506169, -0.3120554, -3.582228, 0, 0, 1, 1, 1,
-0.246692, -0.24974, -1.31438, 1, 0, 0, 1, 1,
-0.2465482, 0.2409364, -0.8816289, 1, 0, 0, 1, 1,
-0.2458633, 0.3217023, -2.030821, 1, 0, 0, 1, 1,
-0.2454038, -0.8578708, -3.116826, 1, 0, 0, 1, 1,
-0.2445414, -1.402032, -4.308175, 1, 0, 0, 1, 1,
-0.2415832, -0.05933031, -2.939145, 0, 0, 0, 1, 1,
-0.2402957, 0.7432874, -0.5657273, 0, 0, 0, 1, 1,
-0.2379389, 0.4130935, 0.6624618, 0, 0, 0, 1, 1,
-0.2340996, -0.351288, -2.672945, 0, 0, 0, 1, 1,
-0.2337293, 0.0944726, -1.666106, 0, 0, 0, 1, 1,
-0.2271691, 0.07645996, -2.052108, 0, 0, 0, 1, 1,
-0.2176082, 1.155107, -1.613228, 0, 0, 0, 1, 1,
-0.2163333, 0.84627, 0.9433193, 1, 1, 1, 1, 1,
-0.2066372, -0.04263261, -1.374892, 1, 1, 1, 1, 1,
-0.2048582, 0.9939368, -0.3872446, 1, 1, 1, 1, 1,
-0.1999596, 1.769864, 0.2712997, 1, 1, 1, 1, 1,
-0.1947327, -0.05433009, -3.121943, 1, 1, 1, 1, 1,
-0.1899704, -0.2865193, -2.602301, 1, 1, 1, 1, 1,
-0.1867525, 0.1155575, -1.279621, 1, 1, 1, 1, 1,
-0.1852103, 0.9713976, -0.7260962, 1, 1, 1, 1, 1,
-0.1830336, 0.3142702, -1.778171, 1, 1, 1, 1, 1,
-0.181977, -1.585013, -3.891035, 1, 1, 1, 1, 1,
-0.1814528, -1.395057, -2.897912, 1, 1, 1, 1, 1,
-0.181362, 1.13983, -0.3080562, 1, 1, 1, 1, 1,
-0.1788227, -1.24657, -4.22549, 1, 1, 1, 1, 1,
-0.1766342, -0.2668224, -4.465173, 1, 1, 1, 1, 1,
-0.1763265, -0.7257202, -1.778308, 1, 1, 1, 1, 1,
-0.1751412, 0.8128258, 0.6071842, 0, 0, 1, 1, 1,
-0.1708557, 0.08033381, -0.4365399, 1, 0, 0, 1, 1,
-0.1684816, 0.6198717, -1.42294, 1, 0, 0, 1, 1,
-0.1675326, -0.9098344, -2.905521, 1, 0, 0, 1, 1,
-0.1659935, 1.023875, 1.409296, 1, 0, 0, 1, 1,
-0.1657017, -0.6856233, -3.666955, 1, 0, 0, 1, 1,
-0.1580262, -0.3552313, -2.781117, 0, 0, 0, 1, 1,
-0.1563721, 0.1337864, -1.362877, 0, 0, 0, 1, 1,
-0.1515544, 0.404467, -0.2096578, 0, 0, 0, 1, 1,
-0.1511894, 0.3217261, 0.3684316, 0, 0, 0, 1, 1,
-0.1474321, 0.07977404, -1.292858, 0, 0, 0, 1, 1,
-0.1469286, 0.1999753, -0.6579949, 0, 0, 0, 1, 1,
-0.1464393, -2.323194, -2.940799, 0, 0, 0, 1, 1,
-0.1445399, 0.7788529, -0.2762748, 1, 1, 1, 1, 1,
-0.1429818, 0.03194025, -1.402601, 1, 1, 1, 1, 1,
-0.1414899, 0.3062585, 0.1590529, 1, 1, 1, 1, 1,
-0.1378565, 0.5053738, 0.6429592, 1, 1, 1, 1, 1,
-0.1364351, -1.458976, -3.498135, 1, 1, 1, 1, 1,
-0.1347689, -0.6051027, -3.634748, 1, 1, 1, 1, 1,
-0.1323624, -0.4057388, -2.631367, 1, 1, 1, 1, 1,
-0.1316965, 0.1471447, 0.0678777, 1, 1, 1, 1, 1,
-0.1310648, -0.8431602, -2.702832, 1, 1, 1, 1, 1,
-0.1288028, 0.8752449, -1.365278, 1, 1, 1, 1, 1,
-0.1286154, 1.009776, -0.5500932, 1, 1, 1, 1, 1,
-0.1219167, -1.087618, -2.078579, 1, 1, 1, 1, 1,
-0.1217402, 0.002248685, -0.4136111, 1, 1, 1, 1, 1,
-0.1180182, -0.7352412, -2.552583, 1, 1, 1, 1, 1,
-0.1175434, 1.114827, 0.9733219, 1, 1, 1, 1, 1,
-0.1174375, -0.7730148, -4.338555, 0, 0, 1, 1, 1,
-0.1143238, 1.752691, -0.7537361, 1, 0, 0, 1, 1,
-0.1102602, 0.4203387, -0.2254361, 1, 0, 0, 1, 1,
-0.1049828, -0.4829901, -3.389317, 1, 0, 0, 1, 1,
-0.1041473, 0.3453319, -0.926357, 1, 0, 0, 1, 1,
-0.1023594, -0.664595, -2.724356, 1, 0, 0, 1, 1,
-0.09438807, -0.2999482, -1.244615, 0, 0, 0, 1, 1,
-0.09248358, 1.182318, -0.1255272, 0, 0, 0, 1, 1,
-0.09239496, 0.4809482, -0.2452808, 0, 0, 0, 1, 1,
-0.09163731, 0.931254, 0.7373275, 0, 0, 0, 1, 1,
-0.08977577, -0.6807128, -4.122897, 0, 0, 0, 1, 1,
-0.08597077, 1.561455, 0.06199538, 0, 0, 0, 1, 1,
-0.07883228, 0.9658896, -1.221337, 0, 0, 0, 1, 1,
-0.07046631, 0.293523, -0.06390825, 1, 1, 1, 1, 1,
-0.06766794, 1.733072, 0.4861037, 1, 1, 1, 1, 1,
-0.05658562, -0.262747, -4.72291, 1, 1, 1, 1, 1,
-0.05044233, -0.7476315, -1.406965, 1, 1, 1, 1, 1,
-0.04484433, 0.7605637, 0.4637996, 1, 1, 1, 1, 1,
-0.04365617, 0.1389974, -0.3531892, 1, 1, 1, 1, 1,
-0.04349957, 0.5006105, -0.2356337, 1, 1, 1, 1, 1,
-0.0426234, -0.2426191, -3.389669, 1, 1, 1, 1, 1,
-0.04055544, -1.505154, -4.550358, 1, 1, 1, 1, 1,
-0.03909051, 1.468047, 0.6115409, 1, 1, 1, 1, 1,
-0.03884037, -0.8820373, -4.414465, 1, 1, 1, 1, 1,
-0.03209303, 0.1252974, -0.8620613, 1, 1, 1, 1, 1,
-0.03133517, 0.8608596, -0.005089407, 1, 1, 1, 1, 1,
-0.03065107, -0.757913, -3.322537, 1, 1, 1, 1, 1,
-0.02962818, 1.019956, -0.3732615, 1, 1, 1, 1, 1,
-0.02791172, 0.917361, 0.2326538, 0, 0, 1, 1, 1,
-0.02549061, -1.454903, -3.350756, 1, 0, 0, 1, 1,
-0.02341194, -0.9048985, -2.128655, 1, 0, 0, 1, 1,
-0.02162894, -0.3835531, -4.947467, 1, 0, 0, 1, 1,
-0.02121843, 2.296245, 1.372688, 1, 0, 0, 1, 1,
-0.01844892, -0.4712611, -3.262729, 1, 0, 0, 1, 1,
-0.01522825, -0.8818493, -2.087089, 0, 0, 0, 1, 1,
-0.01459804, -0.6040847, -3.211811, 0, 0, 0, 1, 1,
-0.01376686, -1.038628, -2.534993, 0, 0, 0, 1, 1,
-0.0119344, 0.551357, -0.4030746, 0, 0, 0, 1, 1,
-0.004229913, 1.09502, 0.2824991, 0, 0, 0, 1, 1,
-0.0008391116, -1.083266, -2.83501, 0, 0, 0, 1, 1,
8.06574e-05, 1.818812, 1.987691, 0, 0, 0, 1, 1,
0.001151945, 0.9098421, -1.143309, 1, 1, 1, 1, 1,
0.008407607, -1.717289, 4.037155, 1, 1, 1, 1, 1,
0.009389489, -0.6487113, 2.384401, 1, 1, 1, 1, 1,
0.01059505, -0.4911655, 3.024836, 1, 1, 1, 1, 1,
0.01192718, -1.773279, 3.56686, 1, 1, 1, 1, 1,
0.01415191, -0.6146912, 2.395112, 1, 1, 1, 1, 1,
0.0166846, 0.6509671, -1.055652, 1, 1, 1, 1, 1,
0.01698098, 1.115931, 0.8681824, 1, 1, 1, 1, 1,
0.01724136, -0.1453627, 2.785215, 1, 1, 1, 1, 1,
0.0172966, -0.8583449, 4.285361, 1, 1, 1, 1, 1,
0.0195402, 1.070051, 0.08623124, 1, 1, 1, 1, 1,
0.02074051, 0.537069, 0.8532636, 1, 1, 1, 1, 1,
0.02212137, 0.2686979, 0.476438, 1, 1, 1, 1, 1,
0.02782992, -0.6785001, 2.465091, 1, 1, 1, 1, 1,
0.03453088, 0.3480616, 1.268852, 1, 1, 1, 1, 1,
0.03475586, 1.212974, -0.1026775, 0, 0, 1, 1, 1,
0.04877462, -0.7060274, 4.369033, 1, 0, 0, 1, 1,
0.04926463, 2.209317, 0.6874291, 1, 0, 0, 1, 1,
0.05507009, -0.9240283, 3.117097, 1, 0, 0, 1, 1,
0.05561367, 1.077568, -0.0896536, 1, 0, 0, 1, 1,
0.05731866, 0.06140133, 0.7501371, 1, 0, 0, 1, 1,
0.06060749, -0.3823594, 1.406621, 0, 0, 0, 1, 1,
0.06105406, -2.068687, 3.673625, 0, 0, 0, 1, 1,
0.07160994, -1.749963, 2.453563, 0, 0, 0, 1, 1,
0.07465986, -1.872627, 3.381983, 0, 0, 0, 1, 1,
0.07770077, -0.7998564, 3.547529, 0, 0, 0, 1, 1,
0.07886579, 1.306527, 0.7064328, 0, 0, 0, 1, 1,
0.07918891, 0.3610005, 0.3566993, 0, 0, 0, 1, 1,
0.07933578, 0.313972, 1.119393, 1, 1, 1, 1, 1,
0.08108365, -0.01079239, 0.8824382, 1, 1, 1, 1, 1,
0.08645671, -1.051511, 3.995463, 1, 1, 1, 1, 1,
0.08771142, 0.2166014, 0.8089762, 1, 1, 1, 1, 1,
0.0896413, -1.016476, 4.629696, 1, 1, 1, 1, 1,
0.09454264, 1.740609, -0.06465662, 1, 1, 1, 1, 1,
0.09687608, -1.157449, 4.415207, 1, 1, 1, 1, 1,
0.09859926, -1.261021, 3.13671, 1, 1, 1, 1, 1,
0.09919563, -2.106889, 1.860659, 1, 1, 1, 1, 1,
0.1010677, -0.2781646, 3.406721, 1, 1, 1, 1, 1,
0.1057117, 1.279059, 0.9498819, 1, 1, 1, 1, 1,
0.1061091, -1.983738, 2.827559, 1, 1, 1, 1, 1,
0.1062579, -0.1801469, 3.899713, 1, 1, 1, 1, 1,
0.107712, -0.979065, 3.652241, 1, 1, 1, 1, 1,
0.1135573, 0.5865671, 0.6405368, 1, 1, 1, 1, 1,
0.1158752, 0.7103491, -0.05649222, 0, 0, 1, 1, 1,
0.1177085, 0.7491612, 1.365343, 1, 0, 0, 1, 1,
0.1181713, -0.8466881, 5.1978, 1, 0, 0, 1, 1,
0.1190861, 1.019451, 0.5944632, 1, 0, 0, 1, 1,
0.1201135, -0.5751623, 4.095011, 1, 0, 0, 1, 1,
0.1215027, 0.4773844, -0.781795, 1, 0, 0, 1, 1,
0.1228136, 0.2600836, 0.3219278, 0, 0, 0, 1, 1,
0.1255779, 1.484571, -0.9728634, 0, 0, 0, 1, 1,
0.1279991, 0.1794187, 1.624367, 0, 0, 0, 1, 1,
0.1307063, 0.8040466, -1.689138, 0, 0, 0, 1, 1,
0.1310473, -0.9260132, 2.115891, 0, 0, 0, 1, 1,
0.1320129, 0.3810053, 1.597604, 0, 0, 0, 1, 1,
0.1353439, -1.500223, 1.811906, 0, 0, 0, 1, 1,
0.1367202, 0.284863, 1.541432, 1, 1, 1, 1, 1,
0.1367709, 0.298144, 0.1385107, 1, 1, 1, 1, 1,
0.13721, 0.8193353, 0.934818, 1, 1, 1, 1, 1,
0.1379461, -0.1721145, 2.313252, 1, 1, 1, 1, 1,
0.1393712, 0.02909569, 0.3199614, 1, 1, 1, 1, 1,
0.1419088, 0.5871306, 1.659447, 1, 1, 1, 1, 1,
0.1433689, -0.190167, 1.839533, 1, 1, 1, 1, 1,
0.1453871, 0.5489564, 1.394372, 1, 1, 1, 1, 1,
0.1486432, -0.4988601, 3.498219, 1, 1, 1, 1, 1,
0.1488563, 0.1306555, 0.02682421, 1, 1, 1, 1, 1,
0.1493612, -0.7496535, 4.567816, 1, 1, 1, 1, 1,
0.1501302, 0.9788709, 2.501423, 1, 1, 1, 1, 1,
0.1594632, -0.3616309, 3.761275, 1, 1, 1, 1, 1,
0.1599893, 1.220793, 0.7216833, 1, 1, 1, 1, 1,
0.1664355, -1.699849, 4.099817, 1, 1, 1, 1, 1,
0.1706969, 0.4972146, 1.261956, 0, 0, 1, 1, 1,
0.173679, -0.477621, 3.409518, 1, 0, 0, 1, 1,
0.1786117, 1.901432, -0.1269259, 1, 0, 0, 1, 1,
0.1818251, -0.4633532, 1.81294, 1, 0, 0, 1, 1,
0.1890279, 0.8832694, 0.1002585, 1, 0, 0, 1, 1,
0.1927239, -1.283385, 1.244629, 1, 0, 0, 1, 1,
0.1966875, 0.07871668, 1.261551, 0, 0, 0, 1, 1,
0.2002978, -0.1011015, 1.158979, 0, 0, 0, 1, 1,
0.2017384, 0.4177569, 1.134897, 0, 0, 0, 1, 1,
0.2040122, 1.273581, 1.379821, 0, 0, 0, 1, 1,
0.205222, -0.2458904, 2.477318, 0, 0, 0, 1, 1,
0.2052566, 0.2371152, -0.7969861, 0, 0, 0, 1, 1,
0.2083641, -1.015623, 3.567344, 0, 0, 0, 1, 1,
0.2106332, 0.3695324, -1.235856, 1, 1, 1, 1, 1,
0.2134776, -1.211335, 2.921036, 1, 1, 1, 1, 1,
0.2169735, -0.2636185, 0.8941215, 1, 1, 1, 1, 1,
0.2179179, 0.801053, -1.268871, 1, 1, 1, 1, 1,
0.2185461, -0.5013939, 3.045813, 1, 1, 1, 1, 1,
0.2234902, 0.7045587, 0.2248439, 1, 1, 1, 1, 1,
0.2247933, -1.309773, 2.947429, 1, 1, 1, 1, 1,
0.2278667, 1.864259, 1.93257, 1, 1, 1, 1, 1,
0.2296806, -0.437588, 1.847011, 1, 1, 1, 1, 1,
0.2302634, 0.4312281, 0.4016597, 1, 1, 1, 1, 1,
0.2329594, 0.2318007, 0.09112742, 1, 1, 1, 1, 1,
0.2341751, -1.092697, 2.559423, 1, 1, 1, 1, 1,
0.235583, -0.3004005, 1.45075, 1, 1, 1, 1, 1,
0.2414116, -1.156616, 3.263489, 1, 1, 1, 1, 1,
0.2414924, 0.4003973, 0.8856563, 1, 1, 1, 1, 1,
0.2430828, -0.6845699, 4.797377, 0, 0, 1, 1, 1,
0.2440287, 0.3030861, -0.0701941, 1, 0, 0, 1, 1,
0.2454318, 0.3208854, 0.1667773, 1, 0, 0, 1, 1,
0.2470084, -1.237913, 3.278071, 1, 0, 0, 1, 1,
0.2486342, 0.9362112, 0.7466232, 1, 0, 0, 1, 1,
0.2577612, 0.261868, 1.582335, 1, 0, 0, 1, 1,
0.2597634, -0.01872604, 2.283407, 0, 0, 0, 1, 1,
0.2608185, 1.105386, 1.638739, 0, 0, 0, 1, 1,
0.2612201, 1.13815, 0.5952197, 0, 0, 0, 1, 1,
0.267996, 0.5537245, 0.7663941, 0, 0, 0, 1, 1,
0.2688397, 0.02565427, 1.194712, 0, 0, 0, 1, 1,
0.2694006, 0.2287398, 2.148801, 0, 0, 0, 1, 1,
0.2699609, -0.5910926, 3.429309, 0, 0, 0, 1, 1,
0.2729057, -0.462604, 1.361031, 1, 1, 1, 1, 1,
0.2776821, -1.99894, 3.03474, 1, 1, 1, 1, 1,
0.2784529, -1.366429, 2.492147, 1, 1, 1, 1, 1,
0.2818362, 1.517306, 0.2636619, 1, 1, 1, 1, 1,
0.2820358, -0.1557231, 0.9069812, 1, 1, 1, 1, 1,
0.2825909, 0.9692124, 0.6814664, 1, 1, 1, 1, 1,
0.2889187, 1.653539, -0.04667418, 1, 1, 1, 1, 1,
0.2922216, -1.438783, 2.898255, 1, 1, 1, 1, 1,
0.2946495, 0.7154018, 2.03414, 1, 1, 1, 1, 1,
0.3029938, -1.89485, 1.975198, 1, 1, 1, 1, 1,
0.3043829, -1.134975, 3.823537, 1, 1, 1, 1, 1,
0.3067288, -0.2599532, 2.900265, 1, 1, 1, 1, 1,
0.3125796, -0.6626099, 3.164388, 1, 1, 1, 1, 1,
0.3137783, 1.19298, -1.097775, 1, 1, 1, 1, 1,
0.3154045, 0.4461035, 0.212529, 1, 1, 1, 1, 1,
0.3164872, 0.4023536, 1.553446, 0, 0, 1, 1, 1,
0.3200559, 1.334176, -0.1608438, 1, 0, 0, 1, 1,
0.3218898, -2.144818, 2.982258, 1, 0, 0, 1, 1,
0.3243205, -0.1006419, 2.137811, 1, 0, 0, 1, 1,
0.3297622, 0.04730183, 1.364442, 1, 0, 0, 1, 1,
0.3310866, 0.9911516, 0.5325159, 1, 0, 0, 1, 1,
0.3312407, -1.588716, 2.211391, 0, 0, 0, 1, 1,
0.3313587, -1.597311, 3.405237, 0, 0, 0, 1, 1,
0.3327726, -1.00925, 3.85348, 0, 0, 0, 1, 1,
0.3334632, -0.5698227, 2.842637, 0, 0, 0, 1, 1,
0.3349891, -0.3009236, 1.660177, 0, 0, 0, 1, 1,
0.3350316, 0.03617838, 2.096262, 0, 0, 0, 1, 1,
0.3436491, -1.050198, 2.493763, 0, 0, 0, 1, 1,
0.3490243, -0.9449443, 3.858688, 1, 1, 1, 1, 1,
0.3503078, 0.2881068, -0.6219054, 1, 1, 1, 1, 1,
0.3524524, 1.208885, 1.117377, 1, 1, 1, 1, 1,
0.3576218, 0.0961375, 1.422449, 1, 1, 1, 1, 1,
0.3603151, 0.7820894, -0.194143, 1, 1, 1, 1, 1,
0.363168, -1.229705, 2.974032, 1, 1, 1, 1, 1,
0.3645663, -0.4144987, 3.824988, 1, 1, 1, 1, 1,
0.3716581, 0.009271698, 1.510143, 1, 1, 1, 1, 1,
0.3775257, -1.65683, 2.242916, 1, 1, 1, 1, 1,
0.3775622, -1.487791, 3.705819, 1, 1, 1, 1, 1,
0.3778043, 0.9270028, -1.388994, 1, 1, 1, 1, 1,
0.3852181, -0.2859934, 4.430581, 1, 1, 1, 1, 1,
0.3888445, -0.6176178, 3.683412, 1, 1, 1, 1, 1,
0.3914823, 1.683919, 1.901985, 1, 1, 1, 1, 1,
0.3956183, -2.799121, 2.613072, 1, 1, 1, 1, 1,
0.4022334, 0.04268416, 2.069352, 0, 0, 1, 1, 1,
0.4025828, 0.40114, 1.28053, 1, 0, 0, 1, 1,
0.4028557, -0.572062, 2.638248, 1, 0, 0, 1, 1,
0.4043196, -0.7387158, 2.380374, 1, 0, 0, 1, 1,
0.4044623, -1.36374, 2.614557, 1, 0, 0, 1, 1,
0.4078016, -1.767386, 0.9182708, 1, 0, 0, 1, 1,
0.410331, -1.266235, 3.658965, 0, 0, 0, 1, 1,
0.4105842, -1.258263, 2.824136, 0, 0, 0, 1, 1,
0.4106679, 1.300235, -1.525532, 0, 0, 0, 1, 1,
0.4153962, 2.486238, -1.013883, 0, 0, 0, 1, 1,
0.4173449, 0.4982142, 1.715822, 0, 0, 0, 1, 1,
0.4217041, -0.3044649, 1.252262, 0, 0, 0, 1, 1,
0.4264975, -1.181168, 3.54612, 0, 0, 0, 1, 1,
0.4265979, -1.914527, 2.588026, 1, 1, 1, 1, 1,
0.4269037, 1.799204, 0.3495075, 1, 1, 1, 1, 1,
0.4292132, 0.6348947, 0.946631, 1, 1, 1, 1, 1,
0.4347233, 1.830865, 0.6190551, 1, 1, 1, 1, 1,
0.4412229, 1.315452, 0.6024984, 1, 1, 1, 1, 1,
0.4426414, 0.7877068, 1.244492, 1, 1, 1, 1, 1,
0.4463952, -0.2724843, 0.7161549, 1, 1, 1, 1, 1,
0.4472001, 1.058511, -0.1764307, 1, 1, 1, 1, 1,
0.4508936, -1.78986, 1.583651, 1, 1, 1, 1, 1,
0.4512012, -0.4589965, 3.452614, 1, 1, 1, 1, 1,
0.4517545, -1.248972, 2.392335, 1, 1, 1, 1, 1,
0.4522716, -0.4904927, 2.504468, 1, 1, 1, 1, 1,
0.4602551, -0.6432089, 3.847763, 1, 1, 1, 1, 1,
0.4611465, -0.5692543, 2.728477, 1, 1, 1, 1, 1,
0.465584, -0.9035076, 2.324641, 1, 1, 1, 1, 1,
0.467186, 2.673143, 2.316577, 0, 0, 1, 1, 1,
0.4706889, 0.3999696, 0.5227792, 1, 0, 0, 1, 1,
0.4768413, -2.138854, 3.79024, 1, 0, 0, 1, 1,
0.4779485, 0.574924, -0.6244785, 1, 0, 0, 1, 1,
0.478021, 0.3905422, 0.1850523, 1, 0, 0, 1, 1,
0.4807255, 0.2528855, 0.8223792, 1, 0, 0, 1, 1,
0.4829755, 0.2728623, 1.956512, 0, 0, 0, 1, 1,
0.4923703, 1.135661, -0.05076173, 0, 0, 0, 1, 1,
0.4945009, -0.757219, 2.316162, 0, 0, 0, 1, 1,
0.5000859, 0.5830851, 0.03172622, 0, 0, 0, 1, 1,
0.5033445, 1.139563, 0.5205379, 0, 0, 0, 1, 1,
0.5075573, 1.569704, 0.1383527, 0, 0, 0, 1, 1,
0.5088441, 0.2634521, -0.0523017, 0, 0, 0, 1, 1,
0.5102799, -0.5794685, 1.169825, 1, 1, 1, 1, 1,
0.5132924, -2.446877, 4.002167, 1, 1, 1, 1, 1,
0.514356, 1.499486, -0.5460274, 1, 1, 1, 1, 1,
0.5148953, -0.7591702, 0.7189019, 1, 1, 1, 1, 1,
0.51672, -0.04103067, 1.707943, 1, 1, 1, 1, 1,
0.5326666, -1.606388, 3.148797, 1, 1, 1, 1, 1,
0.5329133, 0.7164303, 1.793484, 1, 1, 1, 1, 1,
0.5337544, -1.108777, 0.3697923, 1, 1, 1, 1, 1,
0.5339933, 0.486259, 0.1413523, 1, 1, 1, 1, 1,
0.5419207, 2.688503, -2.149827, 1, 1, 1, 1, 1,
0.5442156, -1.001481, 2.262609, 1, 1, 1, 1, 1,
0.5510528, 0.1504723, 1.855049, 1, 1, 1, 1, 1,
0.5530425, 0.8652349, -0.7046106, 1, 1, 1, 1, 1,
0.5537437, -1.700298, 3.44591, 1, 1, 1, 1, 1,
0.5558088, 0.7849632, 0.7845121, 1, 1, 1, 1, 1,
0.5591641, 0.3884613, -0.3728906, 0, 0, 1, 1, 1,
0.5615104, -0.547329, 3.125812, 1, 0, 0, 1, 1,
0.5638826, -0.693703, 2.140415, 1, 0, 0, 1, 1,
0.5650077, -0.7921971, 3.595818, 1, 0, 0, 1, 1,
0.5663443, 1.302437, -0.3367968, 1, 0, 0, 1, 1,
0.5665067, 2.348587, -0.1497895, 1, 0, 0, 1, 1,
0.5676218, 0.5098162, 0.7227631, 0, 0, 0, 1, 1,
0.5688788, -0.5665447, 2.300619, 0, 0, 0, 1, 1,
0.572772, -0.4008579, 1.111856, 0, 0, 0, 1, 1,
0.5740673, -0.3123925, 3.328058, 0, 0, 0, 1, 1,
0.5782844, 1.312537, 0.1209642, 0, 0, 0, 1, 1,
0.5962661, -0.8904911, 2.256269, 0, 0, 0, 1, 1,
0.5966331, 0.6373716, 0.7314943, 0, 0, 0, 1, 1,
0.5995408, -0.7323722, 1.374931, 1, 1, 1, 1, 1,
0.5996213, -0.5084817, 0.7446423, 1, 1, 1, 1, 1,
0.6003754, -0.01850654, 1.780587, 1, 1, 1, 1, 1,
0.6012179, 1.245884, -1.726016, 1, 1, 1, 1, 1,
0.602864, -0.5395545, 4.195882, 1, 1, 1, 1, 1,
0.6066332, -0.06795819, 1.996158, 1, 1, 1, 1, 1,
0.6095058, 0.2425369, 0.388621, 1, 1, 1, 1, 1,
0.6104859, -0.733423, 3.615766, 1, 1, 1, 1, 1,
0.6109017, -0.9267114, 2.160333, 1, 1, 1, 1, 1,
0.6112164, -0.3767819, 2.562981, 1, 1, 1, 1, 1,
0.6122313, -1.295442, 3.199705, 1, 1, 1, 1, 1,
0.6126131, -0.8641511, 2.239543, 1, 1, 1, 1, 1,
0.6137391, -1.21002, 4.46277, 1, 1, 1, 1, 1,
0.614372, 1.088593, -1.938009, 1, 1, 1, 1, 1,
0.6145672, 0.3775254, -0.1811483, 1, 1, 1, 1, 1,
0.6168394, 0.8984608, -0.2523318, 0, 0, 1, 1, 1,
0.6170323, 0.2200202, 1.841964, 1, 0, 0, 1, 1,
0.6214169, 0.01347434, 2.181809, 1, 0, 0, 1, 1,
0.6215141, 1.072883, 0.9573776, 1, 0, 0, 1, 1,
0.6250515, -0.4814697, 0.1610584, 1, 0, 0, 1, 1,
0.6255069, 0.6099295, 0.4634961, 1, 0, 0, 1, 1,
0.6327549, 0.282456, 1.93609, 0, 0, 0, 1, 1,
0.648203, -0.4709275, 2.860108, 0, 0, 0, 1, 1,
0.6494353, 0.04559699, 2.549671, 0, 0, 0, 1, 1,
0.6509588, -0.07066432, 2.382103, 0, 0, 0, 1, 1,
0.6509853, 0.5408765, 0.0733462, 0, 0, 0, 1, 1,
0.6526052, 0.2918306, 0.2292267, 0, 0, 0, 1, 1,
0.6538041, 0.7325653, 1.313205, 0, 0, 0, 1, 1,
0.6542674, 0.2000621, 1.460548, 1, 1, 1, 1, 1,
0.6625137, 2.352465, 0.1943568, 1, 1, 1, 1, 1,
0.6631727, 1.157398, 1.572378, 1, 1, 1, 1, 1,
0.663658, -0.4588421, 1.908403, 1, 1, 1, 1, 1,
0.6638717, -0.1917956, 1.976095, 1, 1, 1, 1, 1,
0.665909, -0.867386, 2.718816, 1, 1, 1, 1, 1,
0.668295, 0.01949374, -1.127697, 1, 1, 1, 1, 1,
0.6734636, -0.2698459, 2.851741, 1, 1, 1, 1, 1,
0.6736332, 1.613841, -0.001795855, 1, 1, 1, 1, 1,
0.6746168, 0.9338287, -0.15327, 1, 1, 1, 1, 1,
0.6760638, -0.1495834, 1.61092, 1, 1, 1, 1, 1,
0.6895007, 0.8672134, 0.4158794, 1, 1, 1, 1, 1,
0.6934224, 0.7857015, 1.30801, 1, 1, 1, 1, 1,
0.6986505, -0.8363824, 3.76352, 1, 1, 1, 1, 1,
0.6992567, -0.4094158, 1.767831, 1, 1, 1, 1, 1,
0.7005867, 0.5785817, -1.010022, 0, 0, 1, 1, 1,
0.7041753, -0.7246998, 2.772299, 1, 0, 0, 1, 1,
0.7054172, 0.9250831, -0.2649059, 1, 0, 0, 1, 1,
0.7129903, -1.526276, 1.224752, 1, 0, 0, 1, 1,
0.7142764, 1.529819, 0.1957052, 1, 0, 0, 1, 1,
0.7147009, -0.192641, 1.21554, 1, 0, 0, 1, 1,
0.7214738, 0.1774563, 0.8593275, 0, 0, 0, 1, 1,
0.7225267, -2.443454, 3.332902, 0, 0, 0, 1, 1,
0.7257823, 0.06841661, 0.4259953, 0, 0, 0, 1, 1,
0.7276178, -0.03365064, 1.894205, 0, 0, 0, 1, 1,
0.7282015, 2.622289, -1.931662, 0, 0, 0, 1, 1,
0.7306644, 0.730845, 0.8972574, 0, 0, 0, 1, 1,
0.733349, 1.221601, 0.3280219, 0, 0, 0, 1, 1,
0.7342249, 1.512458, 1.076995, 1, 1, 1, 1, 1,
0.7358609, 0.360138, 1.505558, 1, 1, 1, 1, 1,
0.745617, -0.3582429, 1.54161, 1, 1, 1, 1, 1,
0.7523173, -0.8024493, 2.312417, 1, 1, 1, 1, 1,
0.7547135, 0.8962552, 0.9124163, 1, 1, 1, 1, 1,
0.7568644, 0.3232355, 3.077393, 1, 1, 1, 1, 1,
0.7658124, -0.01251551, 0.01479161, 1, 1, 1, 1, 1,
0.7662998, 0.1610655, 1.503073, 1, 1, 1, 1, 1,
0.7670621, 1.113694, 0.9931054, 1, 1, 1, 1, 1,
0.7694657, -1.04495, 1.559568, 1, 1, 1, 1, 1,
0.772242, -2.121627, 2.728823, 1, 1, 1, 1, 1,
0.7726956, -1.919621, 3.789588, 1, 1, 1, 1, 1,
0.7730768, -0.2535914, 1.393711, 1, 1, 1, 1, 1,
0.7752274, -1.154759, 2.121215, 1, 1, 1, 1, 1,
0.7776559, 0.7701381, 1.438298, 1, 1, 1, 1, 1,
0.7786591, -2.723405, 1.690844, 0, 0, 1, 1, 1,
0.7798593, 0.3557167, 1.001229, 1, 0, 0, 1, 1,
0.7815509, 0.7728311, 0.4673006, 1, 0, 0, 1, 1,
0.7857181, 0.943196, 1.054365, 1, 0, 0, 1, 1,
0.7879732, 0.6032637, 0.4196701, 1, 0, 0, 1, 1,
0.790949, -1.769291, 3.145657, 1, 0, 0, 1, 1,
0.7949284, 0.4867179, 1.312405, 0, 0, 0, 1, 1,
0.7973209, 1.227389, -1.026306, 0, 0, 0, 1, 1,
0.8022896, 1.518106, 0.8232358, 0, 0, 0, 1, 1,
0.8026217, 0.5247923, 1.865249, 0, 0, 0, 1, 1,
0.8069859, -1.574849, 2.769662, 0, 0, 0, 1, 1,
0.8075066, -1.740885, 2.951227, 0, 0, 0, 1, 1,
0.8143423, 0.1498892, 2.050807, 0, 0, 0, 1, 1,
0.814387, 1.306682, 2.040091, 1, 1, 1, 1, 1,
0.8148554, 0.8708079, 1.664335, 1, 1, 1, 1, 1,
0.8167479, 1.119659, 0.4881795, 1, 1, 1, 1, 1,
0.8243095, -1.649053, 1.735006, 1, 1, 1, 1, 1,
0.8248738, 0.7915775, -0.2706369, 1, 1, 1, 1, 1,
0.8282882, -1.008108, 2.964675, 1, 1, 1, 1, 1,
0.8332362, 0.5593671, 1.196963, 1, 1, 1, 1, 1,
0.8351744, -0.6142166, 1.598046, 1, 1, 1, 1, 1,
0.8386971, -0.3506438, 2.287119, 1, 1, 1, 1, 1,
0.8460417, -1.053746, 1.709142, 1, 1, 1, 1, 1,
0.846077, 0.2473951, 0.1521616, 1, 1, 1, 1, 1,
0.8572515, -0.2118412, -0.3381144, 1, 1, 1, 1, 1,
0.8587101, -1.592548, 3.335602, 1, 1, 1, 1, 1,
0.863131, -0.6526927, 0.8892678, 1, 1, 1, 1, 1,
0.868313, -0.215368, 1.641479, 1, 1, 1, 1, 1,
0.8684555, 0.2711085, 1.252866, 0, 0, 1, 1, 1,
0.8812172, -0.4144678, 3.050267, 1, 0, 0, 1, 1,
0.8851873, -1.916535, 2.894469, 1, 0, 0, 1, 1,
0.8897069, -1.035685, 2.25344, 1, 0, 0, 1, 1,
0.8983751, 0.9515002, 0.3695257, 1, 0, 0, 1, 1,
0.8992071, -0.3436002, 0.1718804, 1, 0, 0, 1, 1,
0.9105115, 2.147762, 1.002187, 0, 0, 0, 1, 1,
0.9124221, -0.642237, 3.741921, 0, 0, 0, 1, 1,
0.9196365, 1.586007, 0.4561251, 0, 0, 0, 1, 1,
0.9250404, -0.4606262, 4.0073, 0, 0, 0, 1, 1,
0.9268789, -0.1024973, 2.143958, 0, 0, 0, 1, 1,
0.9304908, -1.509817, 2.019823, 0, 0, 0, 1, 1,
0.9363835, -1.426669, 2.606646, 0, 0, 0, 1, 1,
0.9426225, 0.5573719, 0.3003338, 1, 1, 1, 1, 1,
0.9441711, 0.3117818, 0.09773024, 1, 1, 1, 1, 1,
0.9584975, -0.864615, 0.8486175, 1, 1, 1, 1, 1,
0.9585047, 0.2847798, 1.18514, 1, 1, 1, 1, 1,
0.9587815, -1.427375, 2.414921, 1, 1, 1, 1, 1,
0.9694161, 0.7244855, 0.6200171, 1, 1, 1, 1, 1,
0.9728432, -0.6838295, 3.007802, 1, 1, 1, 1, 1,
0.9731601, -1.638322, 1.857233, 1, 1, 1, 1, 1,
0.9743452, 1.286112, -0.1727758, 1, 1, 1, 1, 1,
0.9849361, -0.07988016, 0.6198457, 1, 1, 1, 1, 1,
0.9883271, 0.469909, 0.4869565, 1, 1, 1, 1, 1,
0.9910834, 0.1764797, 1.791922, 1, 1, 1, 1, 1,
0.9927619, 0.1788494, -0.3329793, 1, 1, 1, 1, 1,
0.9958799, -0.118857, 2.748692, 1, 1, 1, 1, 1,
0.9980887, 1.071761, 2.133048, 1, 1, 1, 1, 1,
1.002014, -0.502404, 4.118024, 0, 0, 1, 1, 1,
1.002952, -0.9516774, 0.5525811, 1, 0, 0, 1, 1,
1.003755, -1.052125, 1.321206, 1, 0, 0, 1, 1,
1.010476, -0.05294591, 3.461278, 1, 0, 0, 1, 1,
1.012898, 0.3562321, 2.122776, 1, 0, 0, 1, 1,
1.025117, -0.289061, 0.9786525, 1, 0, 0, 1, 1,
1.02898, -0.1615245, 1.608511, 0, 0, 0, 1, 1,
1.032935, -1.516803, 2.666553, 0, 0, 0, 1, 1,
1.036311, 0.4121915, 2.814979, 0, 0, 0, 1, 1,
1.046208, 0.9400144, 2.46642, 0, 0, 0, 1, 1,
1.046306, -0.3488517, 2.709348, 0, 0, 0, 1, 1,
1.050936, 0.8560243, 1.427127, 0, 0, 0, 1, 1,
1.051402, 0.4399292, -0.3351705, 0, 0, 0, 1, 1,
1.053614, -1.595436, 3.236245, 1, 1, 1, 1, 1,
1.058716, 0.5087571, 0.9644055, 1, 1, 1, 1, 1,
1.05925, -0.3817124, 2.012418, 1, 1, 1, 1, 1,
1.060147, 0.2230671, 1.377618, 1, 1, 1, 1, 1,
1.063999, 0.7386898, 0.7381008, 1, 1, 1, 1, 1,
1.067744, -0.4710969, 4.050741, 1, 1, 1, 1, 1,
1.070591, -0.4743519, 2.763115, 1, 1, 1, 1, 1,
1.078583, -0.04026341, -0.2620648, 1, 1, 1, 1, 1,
1.086437, 0.6996199, 1.319653, 1, 1, 1, 1, 1,
1.092916, 2.676867, 2.178672, 1, 1, 1, 1, 1,
1.094031, -1.273803, 1.145296, 1, 1, 1, 1, 1,
1.099815, 0.07700764, 0.9333146, 1, 1, 1, 1, 1,
1.100123, 0.7822387, 0.5576071, 1, 1, 1, 1, 1,
1.100769, -0.7928115, 3.385051, 1, 1, 1, 1, 1,
1.101678, -0.6977195, 2.08135, 1, 1, 1, 1, 1,
1.105099, 0.0619817, 0.6733471, 0, 0, 1, 1, 1,
1.106725, -1.940247, 3.113662, 1, 0, 0, 1, 1,
1.106892, -1.048195, 2.791569, 1, 0, 0, 1, 1,
1.113313, 1.932646, 2.254905, 1, 0, 0, 1, 1,
1.136441, -0.9064547, 2.46571, 1, 0, 0, 1, 1,
1.140703, -0.5031627, 0.9390457, 1, 0, 0, 1, 1,
1.142128, -0.7636325, 3.299473, 0, 0, 0, 1, 1,
1.143305, 0.4642421, 1.427292, 0, 0, 0, 1, 1,
1.145843, -0.696247, 0.4905862, 0, 0, 0, 1, 1,
1.154001, 2.188979, -0.7146858, 0, 0, 0, 1, 1,
1.154238, 0.7519705, 1.169078, 0, 0, 0, 1, 1,
1.157692, 0.8950046, 1.417745, 0, 0, 0, 1, 1,
1.163921, -0.06613941, 2.92731, 0, 0, 0, 1, 1,
1.167377, -0.7521552, 1.844918, 1, 1, 1, 1, 1,
1.172992, 0.1619935, 2.488124, 1, 1, 1, 1, 1,
1.17319, 0.765296, -0.7853823, 1, 1, 1, 1, 1,
1.173706, -0.2319269, 1.477342, 1, 1, 1, 1, 1,
1.174421, 0.8748631, 0.1179126, 1, 1, 1, 1, 1,
1.178317, -0.5837832, 2.233044, 1, 1, 1, 1, 1,
1.184561, -0.4840132, 2.715973, 1, 1, 1, 1, 1,
1.186147, -0.2976817, 1.961414, 1, 1, 1, 1, 1,
1.187469, -0.8323336, 1.011697, 1, 1, 1, 1, 1,
1.199482, -0.1685899, 0.9770588, 1, 1, 1, 1, 1,
1.201404, -0.719728, 2.222392, 1, 1, 1, 1, 1,
1.207308, 0.148858, 2.677794, 1, 1, 1, 1, 1,
1.208454, -0.2653853, 1.512519, 1, 1, 1, 1, 1,
1.214014, -1.214369, 3.657879, 1, 1, 1, 1, 1,
1.223457, 0.02313945, 2.768172, 1, 1, 1, 1, 1,
1.224712, 0.1586546, 1.131626, 0, 0, 1, 1, 1,
1.229624, -1.189789, 2.42168, 1, 0, 0, 1, 1,
1.238133, 1.345734, 1.576914, 1, 0, 0, 1, 1,
1.240945, 0.6762385, 0.934688, 1, 0, 0, 1, 1,
1.246632, -0.3686316, 2.103615, 1, 0, 0, 1, 1,
1.261018, -0.2548449, 0.4644697, 1, 0, 0, 1, 1,
1.26288, -0.2683803, 1.481654, 0, 0, 0, 1, 1,
1.268058, 1.002663, -1.163383, 0, 0, 0, 1, 1,
1.278112, -0.4675471, 1.462508, 0, 0, 0, 1, 1,
1.280344, 1.134771, 2.306835, 0, 0, 0, 1, 1,
1.288969, 0.5541481, 1.889776, 0, 0, 0, 1, 1,
1.291482, 0.1235285, 0.8386214, 0, 0, 0, 1, 1,
1.295939, 1.642576, 1.721431, 0, 0, 0, 1, 1,
1.301408, 1.147375, 0.5463216, 1, 1, 1, 1, 1,
1.31104, -0.6796332, 0.7932664, 1, 1, 1, 1, 1,
1.321407, 1.024898, 1.576013, 1, 1, 1, 1, 1,
1.333491, -1.384845, 3.315672, 1, 1, 1, 1, 1,
1.337392, 1.04604, 1.407632, 1, 1, 1, 1, 1,
1.351285, 0.4024, 2.01715, 1, 1, 1, 1, 1,
1.361218, -0.7422649, 3.119716, 1, 1, 1, 1, 1,
1.375915, 0.3809568, 2.073301, 1, 1, 1, 1, 1,
1.384171, -0.8320375, 2.096025, 1, 1, 1, 1, 1,
1.393062, -1.61481, 2.582152, 1, 1, 1, 1, 1,
1.406398, -0.7200782, 3.078781, 1, 1, 1, 1, 1,
1.410769, 0.5979103, 3.20702, 1, 1, 1, 1, 1,
1.411267, 2.820392, -0.5637415, 1, 1, 1, 1, 1,
1.423378, -0.4254761, 2.299371, 1, 1, 1, 1, 1,
1.424609, -1.225688, 2.434127, 1, 1, 1, 1, 1,
1.426742, -0.8441781, 2.960402, 0, 0, 1, 1, 1,
1.446383, -0.2671977, 2.42165, 1, 0, 0, 1, 1,
1.447446, 1.32067, -0.1389739, 1, 0, 0, 1, 1,
1.457122, 0.6525537, 2.21755, 1, 0, 0, 1, 1,
1.482311, 0.9262956, -0.8094847, 1, 0, 0, 1, 1,
1.483047, 0.08536626, 0.8550448, 1, 0, 0, 1, 1,
1.497611, -0.2703973, 3.499481, 0, 0, 0, 1, 1,
1.501827, 0.4928343, 2.396838, 0, 0, 0, 1, 1,
1.501828, 1.312526, 1.948598, 0, 0, 0, 1, 1,
1.510363, 0.8086535, -0.4848648, 0, 0, 0, 1, 1,
1.512897, -1.182748, 1.277091, 0, 0, 0, 1, 1,
1.517551, 1.21315, 1.145845, 0, 0, 0, 1, 1,
1.538613, -0.3819152, 1.835954, 0, 0, 0, 1, 1,
1.561237, 0.08548556, 2.703053, 1, 1, 1, 1, 1,
1.58437, -0.7942068, 2.33486, 1, 1, 1, 1, 1,
1.588641, 0.5009525, 1.512965, 1, 1, 1, 1, 1,
1.61251, 0.1165783, 1.085807, 1, 1, 1, 1, 1,
1.613866, -1.654931, 3.843443, 1, 1, 1, 1, 1,
1.622368, 0.7020072, 1.00174, 1, 1, 1, 1, 1,
1.628906, 1.083291, 2.365312, 1, 1, 1, 1, 1,
1.632918, 0.4895304, -0.1037657, 1, 1, 1, 1, 1,
1.643108, -0.5165917, 2.180344, 1, 1, 1, 1, 1,
1.673207, -1.116444, 1.063198, 1, 1, 1, 1, 1,
1.679206, -0.6535892, 0.5827591, 1, 1, 1, 1, 1,
1.714186, -0.3065822, 2.511069, 1, 1, 1, 1, 1,
1.722282, -0.7752286, 2.936353, 1, 1, 1, 1, 1,
1.734561, -1.549941, 4.02723, 1, 1, 1, 1, 1,
1.742585, 0.07528094, 2.742052, 1, 1, 1, 1, 1,
1.75061, -1.007049, 2.412526, 0, 0, 1, 1, 1,
1.75982, -0.006309961, 1.401117, 1, 0, 0, 1, 1,
1.767819, 1.889001, 0.7195131, 1, 0, 0, 1, 1,
1.800475, 0.6053755, -1.020549, 1, 0, 0, 1, 1,
1.800976, 1.550378, 1.4392, 1, 0, 0, 1, 1,
1.805208, 0.6645983, 2.660276, 1, 0, 0, 1, 1,
1.829289, -2.44493, 1.727928, 0, 0, 0, 1, 1,
1.83681, 0.2236261, 2.037831, 0, 0, 0, 1, 1,
1.840032, -0.6565785, 1.010608, 0, 0, 0, 1, 1,
1.852231, -0.08280811, 3.243554, 0, 0, 0, 1, 1,
1.875877, 1.119384, 2.307912, 0, 0, 0, 1, 1,
1.89155, 0.9867294, 0.2429933, 0, 0, 0, 1, 1,
1.920872, 1.983853, 0.7624955, 0, 0, 0, 1, 1,
1.927644, 1.126237, 0.7623527, 1, 1, 1, 1, 1,
1.932155, -1.072624, 1.658258, 1, 1, 1, 1, 1,
1.946298, -0.09302831, 2.193254, 1, 1, 1, 1, 1,
1.990003, 0.4627962, 0.7827344, 1, 1, 1, 1, 1,
2.040569, 1.598829, 0.2258738, 1, 1, 1, 1, 1,
2.051065, -0.558519, 1.747151, 1, 1, 1, 1, 1,
2.069887, 0.5658586, 0.4310091, 1, 1, 1, 1, 1,
2.078654, -0.1042785, 0.9614292, 1, 1, 1, 1, 1,
2.100741, -0.5417126, 1.62434, 1, 1, 1, 1, 1,
2.117526, -0.1582391, 3.235609, 1, 1, 1, 1, 1,
2.123737, 0.1341503, 2.818416, 1, 1, 1, 1, 1,
2.148217, 0.8852302, 1.051206, 1, 1, 1, 1, 1,
2.22983, 1.368349, 1.749635, 1, 1, 1, 1, 1,
2.237878, -2.12635, 2.605938, 1, 1, 1, 1, 1,
2.282484, -0.7015138, 1.207699, 1, 1, 1, 1, 1,
2.291967, -0.1189518, 0.03361808, 0, 0, 1, 1, 1,
2.296885, -0.8789832, 1.17129, 1, 0, 0, 1, 1,
2.327942, -1.458559, 1.252349, 1, 0, 0, 1, 1,
2.341541, 0.3538457, 1.267924, 1, 0, 0, 1, 1,
2.442272, 0.8684831, -0.1821024, 1, 0, 0, 1, 1,
2.443634, 0.4406129, 0.1111871, 1, 0, 0, 1, 1,
2.444834, -1.215654, 2.07432, 0, 0, 0, 1, 1,
2.449011, 0.05670759, 0.4325228, 0, 0, 0, 1, 1,
2.532763, -0.6207868, 0.8140855, 0, 0, 0, 1, 1,
2.535077, 0.1994997, 2.021945, 0, 0, 0, 1, 1,
2.649953, 0.01188931, 2.932762, 0, 0, 0, 1, 1,
2.664846, 1.491465, 0.483144, 0, 0, 0, 1, 1,
2.79579, -0.3421157, -0.4515488, 0, 0, 0, 1, 1,
2.820919, 1.708746, 0.8648739, 1, 1, 1, 1, 1,
2.876393, -1.003146, 1.814231, 1, 1, 1, 1, 1,
2.939555, 0.501423, -0.135247, 1, 1, 1, 1, 1,
2.953065, 0.9639866, 2.022464, 1, 1, 1, 1, 1,
3.064878, 1.418333, 2.548792, 1, 1, 1, 1, 1,
3.167806, 1.829432, 3.096713, 1, 1, 1, 1, 1,
3.693975, -1.584245, 3.305794, 1, 1, 1, 1, 1
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
var radius = 9.485701;
var distance = 33.31812;
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
mvMatrix.translate( -0.2248356, -0.002536297, -0.0843606 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31812);
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
