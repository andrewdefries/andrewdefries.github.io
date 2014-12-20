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
-3.16269, -0.07318175, 0.3295965, 1, 0, 0, 1,
-3.156392, 0.9770692, -2.193711, 1, 0.007843138, 0, 1,
-2.85919, -3.127234, -1.635351, 1, 0.01176471, 0, 1,
-2.650682, -0.8017194, -3.467383, 1, 0.01960784, 0, 1,
-2.643679, 1.148325, -0.99686, 1, 0.02352941, 0, 1,
-2.635885, -0.6030986, -1.473004, 1, 0.03137255, 0, 1,
-2.608835, -0.3584689, -3.692796, 1, 0.03529412, 0, 1,
-2.569205, 0.6636194, -1.452906, 1, 0.04313726, 0, 1,
-2.564568, 0.901494, -1.957288, 1, 0.04705882, 0, 1,
-2.523208, 0.8332438, -2.386068, 1, 0.05490196, 0, 1,
-2.367753, 1.55385, -1.091495, 1, 0.05882353, 0, 1,
-2.352253, 0.6039014, -1.343031, 1, 0.06666667, 0, 1,
-2.281306, -0.3086409, -1.283548, 1, 0.07058824, 0, 1,
-2.239672, 0.6363231, -1.267746, 1, 0.07843138, 0, 1,
-2.142935, 0.2093807, -0.6087669, 1, 0.08235294, 0, 1,
-2.127878, 0.8927212, -0.5732474, 1, 0.09019608, 0, 1,
-2.106939, -0.7720384, -1.770093, 1, 0.09411765, 0, 1,
-2.09875, 1.00166, 0.005410676, 1, 0.1019608, 0, 1,
-2.081555, -1.079451, -3.924422, 1, 0.1098039, 0, 1,
-2.011344, 0.9496825, -0.4249888, 1, 0.1137255, 0, 1,
-2.006671, -2.010792, -1.657076, 1, 0.1215686, 0, 1,
-2.003788, 0.9194036, -1.325442, 1, 0.1254902, 0, 1,
-1.980735, 0.320094, -2.025708, 1, 0.1333333, 0, 1,
-1.972747, -1.362734, -2.000992, 1, 0.1372549, 0, 1,
-1.943484, -2.110498, -3.510599, 1, 0.145098, 0, 1,
-1.943042, 0.4941992, -1.840717, 1, 0.1490196, 0, 1,
-1.922172, -0.495681, -2.861226, 1, 0.1568628, 0, 1,
-1.907284, -1.081119, -3.386695, 1, 0.1607843, 0, 1,
-1.895525, 0.2079948, -1.609584, 1, 0.1686275, 0, 1,
-1.884469, -2.357477, -1.276884, 1, 0.172549, 0, 1,
-1.863654, -1.065187, -2.484604, 1, 0.1803922, 0, 1,
-1.846584, -1.439391, -2.846287, 1, 0.1843137, 0, 1,
-1.843245, 0.6405269, -1.285946, 1, 0.1921569, 0, 1,
-1.830119, 1.361823, -1.254646, 1, 0.1960784, 0, 1,
-1.822753, 0.8749865, -2.330755, 1, 0.2039216, 0, 1,
-1.795984, 1.169636, -1.896742, 1, 0.2117647, 0, 1,
-1.789978, -0.2891439, -1.545594, 1, 0.2156863, 0, 1,
-1.780317, 0.2275709, -2.095426, 1, 0.2235294, 0, 1,
-1.77381, -0.01405614, -0.7064819, 1, 0.227451, 0, 1,
-1.762159, 0.6770307, -0.3712893, 1, 0.2352941, 0, 1,
-1.760271, 1.810741, -2.335362, 1, 0.2392157, 0, 1,
-1.754063, -1.135674, -2.315852, 1, 0.2470588, 0, 1,
-1.747858, -1.516778, -2.961067, 1, 0.2509804, 0, 1,
-1.734153, 0.9193695, -0.1999436, 1, 0.2588235, 0, 1,
-1.724718, -0.9244096, -2.041873, 1, 0.2627451, 0, 1,
-1.710651, -1.500809, -2.706516, 1, 0.2705882, 0, 1,
-1.707566, 0.08043405, -3.192858, 1, 0.2745098, 0, 1,
-1.688043, 0.07898725, -1.610134, 1, 0.282353, 0, 1,
-1.67653, -1.070795, -1.285665, 1, 0.2862745, 0, 1,
-1.675308, -0.09919611, 0.3531324, 1, 0.2941177, 0, 1,
-1.673669, -1.636624, -1.252025, 1, 0.3019608, 0, 1,
-1.673527, 2.084725, 0.3979177, 1, 0.3058824, 0, 1,
-1.672939, 0.194522, -1.727381, 1, 0.3137255, 0, 1,
-1.665004, 1.819794, 0.3833775, 1, 0.3176471, 0, 1,
-1.655116, -0.356512, -3.777195, 1, 0.3254902, 0, 1,
-1.646035, 1.030374, -2.049471, 1, 0.3294118, 0, 1,
-1.637532, 1.434888, -1.058985, 1, 0.3372549, 0, 1,
-1.635603, -1.076391, -1.900574, 1, 0.3411765, 0, 1,
-1.630203, -0.2791401, -1.100891, 1, 0.3490196, 0, 1,
-1.617568, -0.1812548, -1.535451, 1, 0.3529412, 0, 1,
-1.614511, -1.015611, -2.022936, 1, 0.3607843, 0, 1,
-1.593797, -0.717876, -2.631481, 1, 0.3647059, 0, 1,
-1.578385, 0.1015826, 0.7174907, 1, 0.372549, 0, 1,
-1.573406, 0.4177086, 0.5972341, 1, 0.3764706, 0, 1,
-1.571344, -0.2700522, -1.839813, 1, 0.3843137, 0, 1,
-1.559922, -0.3030653, -0.5212287, 1, 0.3882353, 0, 1,
-1.556814, 0.01226625, -1.323944, 1, 0.3960784, 0, 1,
-1.550611, 0.3013541, -1.831984, 1, 0.4039216, 0, 1,
-1.54794, 0.1679405, -1.065536, 1, 0.4078431, 0, 1,
-1.544042, -3.267783, -2.257771, 1, 0.4156863, 0, 1,
-1.538249, 1.396012, -2.008496, 1, 0.4196078, 0, 1,
-1.535197, -1.015808, -2.220512, 1, 0.427451, 0, 1,
-1.532208, 0.06053039, 0.1180605, 1, 0.4313726, 0, 1,
-1.531466, -0.0397127, -2.735828, 1, 0.4392157, 0, 1,
-1.526745, 1.744025, -0.5741506, 1, 0.4431373, 0, 1,
-1.516992, 0.5934014, -2.427908, 1, 0.4509804, 0, 1,
-1.514967, -1.729381, -3.353884, 1, 0.454902, 0, 1,
-1.513045, 0.6778302, -1.629496, 1, 0.4627451, 0, 1,
-1.502119, -0.01708114, -1.875841, 1, 0.4666667, 0, 1,
-1.500943, 0.2659168, -2.445727, 1, 0.4745098, 0, 1,
-1.484105, -0.7065802, -2.47638, 1, 0.4784314, 0, 1,
-1.463965, 1.120081, 0.1285775, 1, 0.4862745, 0, 1,
-1.450031, 0.156604, -1.604446, 1, 0.4901961, 0, 1,
-1.448321, 0.4031008, -0.0125496, 1, 0.4980392, 0, 1,
-1.443089, 0.4249527, -3.267488, 1, 0.5058824, 0, 1,
-1.433852, 1.347314, -0.8847738, 1, 0.509804, 0, 1,
-1.431582, -0.09214641, -2.69137, 1, 0.5176471, 0, 1,
-1.42752, 0.2467599, -3.721011, 1, 0.5215687, 0, 1,
-1.41957, 0.4656934, -0.7508457, 1, 0.5294118, 0, 1,
-1.416632, -0.2981344, -0.7934066, 1, 0.5333334, 0, 1,
-1.395242, 1.28023, -0.2475977, 1, 0.5411765, 0, 1,
-1.39389, 1.797403, -1.49124, 1, 0.5450981, 0, 1,
-1.38318, -2.661727, -3.275566, 1, 0.5529412, 0, 1,
-1.351133, -0.7427827, -1.996951, 1, 0.5568628, 0, 1,
-1.347725, 0.8415743, -0.2967144, 1, 0.5647059, 0, 1,
-1.347438, 1.817118, -0.2963193, 1, 0.5686275, 0, 1,
-1.344338, 0.1063258, -3.178272, 1, 0.5764706, 0, 1,
-1.344262, 1.022663, -0.8387327, 1, 0.5803922, 0, 1,
-1.342436, -0.8399261, -0.4054039, 1, 0.5882353, 0, 1,
-1.331981, -0.7438444, -1.536712, 1, 0.5921569, 0, 1,
-1.329811, -0.3418635, 1.070559, 1, 0.6, 0, 1,
-1.324015, 2.269676, -0.9541012, 1, 0.6078432, 0, 1,
-1.312755, 0.01569425, -1.149499, 1, 0.6117647, 0, 1,
-1.308838, 0.6677855, -0.985048, 1, 0.6196079, 0, 1,
-1.307146, -1.937973, -1.02725, 1, 0.6235294, 0, 1,
-1.306866, -1.506111, -2.49081, 1, 0.6313726, 0, 1,
-1.302342, 0.4861734, -1.739195, 1, 0.6352941, 0, 1,
-1.301139, 0.7011775, -0.4835812, 1, 0.6431373, 0, 1,
-1.297683, -1.591409, -3.010176, 1, 0.6470588, 0, 1,
-1.292507, -0.7968202, -1.750786, 1, 0.654902, 0, 1,
-1.291067, 1.044301, 0.5084714, 1, 0.6588235, 0, 1,
-1.286558, 3.339072, -0.1313681, 1, 0.6666667, 0, 1,
-1.259011, 0.3783848, -1.79432, 1, 0.6705883, 0, 1,
-1.255463, 0.06609779, -2.934417, 1, 0.6784314, 0, 1,
-1.247178, -1.265391, -2.822613, 1, 0.682353, 0, 1,
-1.243447, 0.772473, -2.886379, 1, 0.6901961, 0, 1,
-1.232276, -0.05383556, -0.5451481, 1, 0.6941177, 0, 1,
-1.230181, -0.3523674, -1.897815, 1, 0.7019608, 0, 1,
-1.227239, -0.1871756, -3.266164, 1, 0.7098039, 0, 1,
-1.221454, -0.4936001, -1.466651, 1, 0.7137255, 0, 1,
-1.211331, 0.0559054, -2.639226, 1, 0.7215686, 0, 1,
-1.209287, -1.124272, -2.440768, 1, 0.7254902, 0, 1,
-1.208065, 0.1609364, -1.11612, 1, 0.7333333, 0, 1,
-1.204478, -0.8144626, 0.9688767, 1, 0.7372549, 0, 1,
-1.201038, 1.127459, -1.628562, 1, 0.7450981, 0, 1,
-1.195789, -0.1951513, -0.905273, 1, 0.7490196, 0, 1,
-1.190625, -0.2828001, -0.7850401, 1, 0.7568628, 0, 1,
-1.187787, 0.7790582, -1.252836, 1, 0.7607843, 0, 1,
-1.170809, 0.5212347, -0.4446322, 1, 0.7686275, 0, 1,
-1.16071, 0.5770237, 0.4753367, 1, 0.772549, 0, 1,
-1.158121, 1.083437, -0.9042701, 1, 0.7803922, 0, 1,
-1.156468, 0.6300407, -1.632524, 1, 0.7843137, 0, 1,
-1.154044, -0.7526875, -1.725524, 1, 0.7921569, 0, 1,
-1.151014, 0.6447878, -1.378352, 1, 0.7960784, 0, 1,
-1.15054, -0.4306342, -2.898084, 1, 0.8039216, 0, 1,
-1.143072, 1.48321, -0.2233453, 1, 0.8117647, 0, 1,
-1.129091, -0.2141035, -1.176196, 1, 0.8156863, 0, 1,
-1.128744, 0.454548, -2.697258, 1, 0.8235294, 0, 1,
-1.120224, -1.143273, -2.634802, 1, 0.827451, 0, 1,
-1.119681, -2.009199, -3.878908, 1, 0.8352941, 0, 1,
-1.108814, -0.9931704, -0.4378039, 1, 0.8392157, 0, 1,
-1.107425, 0.2258721, -1.252161, 1, 0.8470588, 0, 1,
-1.105371, 1.128373, -1.599438, 1, 0.8509804, 0, 1,
-1.103779, -1.730526, -3.443997, 1, 0.8588235, 0, 1,
-1.095502, -0.8692098, -1.379677, 1, 0.8627451, 0, 1,
-1.090414, -1.244649, -3.110932, 1, 0.8705882, 0, 1,
-1.086961, 0.5385582, 0.07758919, 1, 0.8745098, 0, 1,
-1.085088, 0.9190281, -1.571951, 1, 0.8823529, 0, 1,
-1.082778, -0.6737897, -2.275074, 1, 0.8862745, 0, 1,
-1.081172, -0.7171097, -1.1649, 1, 0.8941177, 0, 1,
-1.071707, -3.297659, -1.180765, 1, 0.8980392, 0, 1,
-1.070384, -0.3348626, -1.569062, 1, 0.9058824, 0, 1,
-1.063285, -2.392883, -2.761489, 1, 0.9137255, 0, 1,
-1.061797, -0.08768513, -2.711175, 1, 0.9176471, 0, 1,
-1.056381, -0.2704837, -0.6717311, 1, 0.9254902, 0, 1,
-1.054593, 0.7568631, -1.605063, 1, 0.9294118, 0, 1,
-1.053218, -0.02825549, -2.207889, 1, 0.9372549, 0, 1,
-1.041474, -0.06063017, -1.625711, 1, 0.9411765, 0, 1,
-1.03602, 1.583636, -0.7596203, 1, 0.9490196, 0, 1,
-1.030008, 0.9191659, -0.3570415, 1, 0.9529412, 0, 1,
-1.02858, 0.1247775, -1.675989, 1, 0.9607843, 0, 1,
-1.027203, 0.5502619, -1.123552, 1, 0.9647059, 0, 1,
-1.025355, -0.577181, -2.8226, 1, 0.972549, 0, 1,
-1.023598, 0.798793, 0.7081101, 1, 0.9764706, 0, 1,
-1.013771, -1.044723, -0.8790268, 1, 0.9843137, 0, 1,
-1.002416, 0.8701854, 0.122822, 1, 0.9882353, 0, 1,
-0.9951029, 0.106781, -0.2460608, 1, 0.9960784, 0, 1,
-0.9918063, 1.457987, -0.09842877, 0.9960784, 1, 0, 1,
-0.9864665, 0.3278788, -2.608439, 0.9921569, 1, 0, 1,
-0.985306, 0.8297114, -0.9977448, 0.9843137, 1, 0, 1,
-0.9844581, 0.05699661, -0.8091995, 0.9803922, 1, 0, 1,
-0.9836244, 0.5759748, -0.5549101, 0.972549, 1, 0, 1,
-0.9828746, 0.1246711, -0.235502, 0.9686275, 1, 0, 1,
-0.9814331, -0.5805634, -2.734943, 0.9607843, 1, 0, 1,
-0.9787, -1.23086, -3.589632, 0.9568627, 1, 0, 1,
-0.9695016, -0.1808087, -2.271251, 0.9490196, 1, 0, 1,
-0.9579213, 1.817801, -1.334295, 0.945098, 1, 0, 1,
-0.9541801, 0.3177072, -2.73675, 0.9372549, 1, 0, 1,
-0.9484275, -0.96782, -1.896254, 0.9333333, 1, 0, 1,
-0.9443376, 0.1631636, -2.232769, 0.9254902, 1, 0, 1,
-0.9427892, -2.237208, -2.471555, 0.9215686, 1, 0, 1,
-0.9418145, 0.40892, -1.293883, 0.9137255, 1, 0, 1,
-0.9309429, 0.9097565, -0.951545, 0.9098039, 1, 0, 1,
-0.9279915, 0.1630663, -1.324939, 0.9019608, 1, 0, 1,
-0.923113, 0.02626678, -3.102027, 0.8941177, 1, 0, 1,
-0.9177044, -0.4343816, -0.06399953, 0.8901961, 1, 0, 1,
-0.9167233, 0.6343123, -0.005567844, 0.8823529, 1, 0, 1,
-0.9042987, -0.01776301, 0.9379364, 0.8784314, 1, 0, 1,
-0.9041666, 0.5376149, -2.24435, 0.8705882, 1, 0, 1,
-0.8990657, 1.635279, -0.5596167, 0.8666667, 1, 0, 1,
-0.8985817, -0.03187786, -2.190758, 0.8588235, 1, 0, 1,
-0.8956555, 0.4793621, -2.56166, 0.854902, 1, 0, 1,
-0.8936201, -0.09841033, -2.062476, 0.8470588, 1, 0, 1,
-0.8927301, 1.690006, -0.3021298, 0.8431373, 1, 0, 1,
-0.8858839, 0.2764263, -2.487419, 0.8352941, 1, 0, 1,
-0.8707205, -0.1367777, -1.722656, 0.8313726, 1, 0, 1,
-0.8695601, 1.033934, -0.9908617, 0.8235294, 1, 0, 1,
-0.8695472, -0.01329476, -2.755905, 0.8196079, 1, 0, 1,
-0.867448, 0.8794079, 0.9848912, 0.8117647, 1, 0, 1,
-0.8654127, 0.4449106, -0.2690239, 0.8078431, 1, 0, 1,
-0.8641146, 0.1205505, -0.4851052, 0.8, 1, 0, 1,
-0.8534929, -0.5751791, -3.088191, 0.7921569, 1, 0, 1,
-0.8529614, -0.5337692, -3.245425, 0.7882353, 1, 0, 1,
-0.8477445, 0.005079576, -1.969799, 0.7803922, 1, 0, 1,
-0.8418319, -1.421811, -2.41914, 0.7764706, 1, 0, 1,
-0.8375073, -0.1716725, -2.047389, 0.7686275, 1, 0, 1,
-0.8348382, 2.026292, 0.04304821, 0.7647059, 1, 0, 1,
-0.8299698, -1.323642, -3.787856, 0.7568628, 1, 0, 1,
-0.8211013, -1.211121, -2.116797, 0.7529412, 1, 0, 1,
-0.8204367, 2.791812, -0.8787192, 0.7450981, 1, 0, 1,
-0.8184409, -0.5437952, -3.137051, 0.7411765, 1, 0, 1,
-0.8171791, 0.56472, -0.5859557, 0.7333333, 1, 0, 1,
-0.8169775, 0.3912848, -1.87497, 0.7294118, 1, 0, 1,
-0.8084245, 0.6113462, -1.709301, 0.7215686, 1, 0, 1,
-0.8070741, 2.530978, -0.3058788, 0.7176471, 1, 0, 1,
-0.8067026, -0.01550043, 0.4899048, 0.7098039, 1, 0, 1,
-0.799391, -0.2904587, -1.75706, 0.7058824, 1, 0, 1,
-0.7983264, -0.4882579, -2.313095, 0.6980392, 1, 0, 1,
-0.7954692, -1.308917, -2.405025, 0.6901961, 1, 0, 1,
-0.7937168, -0.5545383, -2.357872, 0.6862745, 1, 0, 1,
-0.792407, -1.197757, -2.326535, 0.6784314, 1, 0, 1,
-0.7886724, -0.8741012, -2.479532, 0.6745098, 1, 0, 1,
-0.7802252, 0.1884422, -1.099857, 0.6666667, 1, 0, 1,
-0.7770286, -0.2891051, -0.7217976, 0.6627451, 1, 0, 1,
-0.7763741, -1.60433, -3.086467, 0.654902, 1, 0, 1,
-0.7650495, -0.8723595, -2.641364, 0.6509804, 1, 0, 1,
-0.7293445, 0.573937, -1.064831, 0.6431373, 1, 0, 1,
-0.7283654, 0.8541179, -0.1154479, 0.6392157, 1, 0, 1,
-0.7247096, -0.2686607, -3.37256, 0.6313726, 1, 0, 1,
-0.7235178, 0.3502157, -0.3833807, 0.627451, 1, 0, 1,
-0.7186598, 0.2837186, -1.633309, 0.6196079, 1, 0, 1,
-0.7181939, 0.5731252, 0.3803016, 0.6156863, 1, 0, 1,
-0.7142388, -0.8216206, -1.224433, 0.6078432, 1, 0, 1,
-0.7119402, -0.8591025, -1.898138, 0.6039216, 1, 0, 1,
-0.7062526, 1.187163, 0.2121689, 0.5960785, 1, 0, 1,
-0.7007714, 0.8456831, -2.347011, 0.5882353, 1, 0, 1,
-0.7007356, -0.635336, -3.938023, 0.5843138, 1, 0, 1,
-0.6970938, -1.414205, -3.470157, 0.5764706, 1, 0, 1,
-0.6944965, -1.355276, -1.517406, 0.572549, 1, 0, 1,
-0.6940914, -1.013932, -3.971655, 0.5647059, 1, 0, 1,
-0.6929564, 1.056181, -1.213847, 0.5607843, 1, 0, 1,
-0.6900531, -1.851045, -3.354434, 0.5529412, 1, 0, 1,
-0.6855887, -0.3654914, -1.917673, 0.5490196, 1, 0, 1,
-0.6811814, -1.472935, -4.031021, 0.5411765, 1, 0, 1,
-0.6762505, 0.326355, -0.869704, 0.5372549, 1, 0, 1,
-0.6755329, -0.8783395, -2.189549, 0.5294118, 1, 0, 1,
-0.6753345, 1.882562, 0.3651589, 0.5254902, 1, 0, 1,
-0.6719673, 1.116592, -0.9703814, 0.5176471, 1, 0, 1,
-0.6685576, 0.2507676, -1.067328, 0.5137255, 1, 0, 1,
-0.6653327, -1.200772, -3.627671, 0.5058824, 1, 0, 1,
-0.6624282, -0.6840137, -1.48954, 0.5019608, 1, 0, 1,
-0.6619341, 1.395323, -3.214365, 0.4941176, 1, 0, 1,
-0.6613756, -0.2786167, -1.502057, 0.4862745, 1, 0, 1,
-0.6599784, 0.4615083, -1.091785, 0.4823529, 1, 0, 1,
-0.6534514, -0.06807368, -2.799642, 0.4745098, 1, 0, 1,
-0.6495544, 0.3428473, 0.02516027, 0.4705882, 1, 0, 1,
-0.6427116, 1.673699, 1.498846, 0.4627451, 1, 0, 1,
-0.6375821, 2.203614, 0.08759986, 0.4588235, 1, 0, 1,
-0.6342354, -0.2236652, -1.821648, 0.4509804, 1, 0, 1,
-0.6292143, 0.364098, -0.6712415, 0.4470588, 1, 0, 1,
-0.6283181, 0.1230358, -0.6263052, 0.4392157, 1, 0, 1,
-0.6232389, -0.3235683, -1.702497, 0.4352941, 1, 0, 1,
-0.6189884, -0.0254068, -1.088708, 0.427451, 1, 0, 1,
-0.6145968, -1.439458, -1.473904, 0.4235294, 1, 0, 1,
-0.6118567, 0.2899884, -1.688149, 0.4156863, 1, 0, 1,
-0.6037301, -0.1237131, -2.367327, 0.4117647, 1, 0, 1,
-0.6026064, 0.4726119, -2.211703, 0.4039216, 1, 0, 1,
-0.5953892, 1.348593, -0.1915431, 0.3960784, 1, 0, 1,
-0.5944266, -0.1277349, -2.415677, 0.3921569, 1, 0, 1,
-0.593764, -0.1577633, -1.314413, 0.3843137, 1, 0, 1,
-0.5929978, -1.726956, -1.938115, 0.3803922, 1, 0, 1,
-0.5890167, 1.075123, -2.001129, 0.372549, 1, 0, 1,
-0.5871124, -1.666653, -4.057714, 0.3686275, 1, 0, 1,
-0.5849714, -0.7880949, -2.213685, 0.3607843, 1, 0, 1,
-0.5844705, 0.4142295, -1.6615, 0.3568628, 1, 0, 1,
-0.58129, 0.5152548, -0.06529626, 0.3490196, 1, 0, 1,
-0.5776166, 0.4790135, -0.9901667, 0.345098, 1, 0, 1,
-0.5770195, -3.128384, -2.884069, 0.3372549, 1, 0, 1,
-0.5755861, 1.702479, -0.6237466, 0.3333333, 1, 0, 1,
-0.5751897, 1.172522, -1.386359, 0.3254902, 1, 0, 1,
-0.5740227, -1.964112, -3.516201, 0.3215686, 1, 0, 1,
-0.5708984, -0.1501534, -1.561283, 0.3137255, 1, 0, 1,
-0.5694849, -2.368448, -4.219633, 0.3098039, 1, 0, 1,
-0.5685892, -1.574588, -3.160655, 0.3019608, 1, 0, 1,
-0.5675331, -0.7120941, -1.790063, 0.2941177, 1, 0, 1,
-0.5635766, -2.281676, -2.614608, 0.2901961, 1, 0, 1,
-0.5539583, -0.2698958, -1.797106, 0.282353, 1, 0, 1,
-0.5520941, -1.748215, -1.8438, 0.2784314, 1, 0, 1,
-0.5496357, 0.3535309, -1.578902, 0.2705882, 1, 0, 1,
-0.5470209, -0.9711583, -1.996152, 0.2666667, 1, 0, 1,
-0.5445039, -1.270065, -1.552619, 0.2588235, 1, 0, 1,
-0.5439033, -0.6345693, -3.32161, 0.254902, 1, 0, 1,
-0.542698, 1.079508, 1.277063, 0.2470588, 1, 0, 1,
-0.5378545, -1.046755, -3.336407, 0.2431373, 1, 0, 1,
-0.5374162, -1.102554, -3.556342, 0.2352941, 1, 0, 1,
-0.5351967, 0.09434996, -2.684746, 0.2313726, 1, 0, 1,
-0.5343586, -1.182807, -2.029802, 0.2235294, 1, 0, 1,
-0.5322993, 1.841318, -0.5730475, 0.2196078, 1, 0, 1,
-0.5295533, 0.5578419, -0.4940329, 0.2117647, 1, 0, 1,
-0.5293593, 0.9950753, -0.647736, 0.2078431, 1, 0, 1,
-0.5283788, 0.05419536, -0.9112313, 0.2, 1, 0, 1,
-0.526842, 0.6584142, -0.4333389, 0.1921569, 1, 0, 1,
-0.5162295, -0.8298422, -1.102046, 0.1882353, 1, 0, 1,
-0.5154724, -1.201681, -1.272213, 0.1803922, 1, 0, 1,
-0.5152044, -1.23906, -2.287162, 0.1764706, 1, 0, 1,
-0.5061321, 0.5664874, -0.4535254, 0.1686275, 1, 0, 1,
-0.5025247, 1.131283, -0.4651765, 0.1647059, 1, 0, 1,
-0.5012433, 0.01036515, -2.460314, 0.1568628, 1, 0, 1,
-0.4984579, -0.5776205, -0.9557462, 0.1529412, 1, 0, 1,
-0.4898388, -2.108808, -2.91703, 0.145098, 1, 0, 1,
-0.4860858, -0.6018197, -1.323789, 0.1411765, 1, 0, 1,
-0.4831238, -0.5245947, -2.765204, 0.1333333, 1, 0, 1,
-0.4825366, 2.508699, -0.3477036, 0.1294118, 1, 0, 1,
-0.4790716, 0.8666359, 0.2597188, 0.1215686, 1, 0, 1,
-0.4782653, -0.6912178, -1.256792, 0.1176471, 1, 0, 1,
-0.4679381, 0.7633355, 0.441403, 0.1098039, 1, 0, 1,
-0.4659701, -1.518585, -3.292349, 0.1058824, 1, 0, 1,
-0.4648485, 0.6531677, -1.135004, 0.09803922, 1, 0, 1,
-0.4615775, -0.3309613, -3.391459, 0.09019608, 1, 0, 1,
-0.4571931, -0.04871136, -0.6849977, 0.08627451, 1, 0, 1,
-0.453573, -1.391832, -2.465382, 0.07843138, 1, 0, 1,
-0.4470852, 1.576085, 0.1781872, 0.07450981, 1, 0, 1,
-0.4436761, -0.5668764, -1.780749, 0.06666667, 1, 0, 1,
-0.4430471, 0.7215862, -0.7536032, 0.0627451, 1, 0, 1,
-0.4413708, 0.8841438, -0.2662449, 0.05490196, 1, 0, 1,
-0.4391315, 0.6835247, -1.038026, 0.05098039, 1, 0, 1,
-0.4344481, 0.1710981, -1.56383, 0.04313726, 1, 0, 1,
-0.431328, 1.252651, -0.51001, 0.03921569, 1, 0, 1,
-0.4305472, 0.5611869, -2.532562, 0.03137255, 1, 0, 1,
-0.4280617, -0.5945064, -2.624622, 0.02745098, 1, 0, 1,
-0.4196128, 0.9255776, -0.5968151, 0.01960784, 1, 0, 1,
-0.4179225, 1.064104, 0.4522807, 0.01568628, 1, 0, 1,
-0.4141029, -1.009712, -0.540059, 0.007843138, 1, 0, 1,
-0.4129352, -0.05771543, -1.777245, 0.003921569, 1, 0, 1,
-0.4128374, -0.1517201, -3.610481, 0, 1, 0.003921569, 1,
-0.4031287, 0.466754, 0.3052348, 0, 1, 0.01176471, 1,
-0.4025309, 0.9078983, -0.5052094, 0, 1, 0.01568628, 1,
-0.4022102, -0.8441219, -3.684384, 0, 1, 0.02352941, 1,
-0.4021025, 0.6522259, -0.3245122, 0, 1, 0.02745098, 1,
-0.3946698, -0.06122984, -0.9499622, 0, 1, 0.03529412, 1,
-0.3930993, 2.096953, -0.7856711, 0, 1, 0.03921569, 1,
-0.3922017, 0.5059327, 0.05893524, 0, 1, 0.04705882, 1,
-0.3911067, -2.277398, -3.361391, 0, 1, 0.05098039, 1,
-0.3905706, -0.6759352, -2.063822, 0, 1, 0.05882353, 1,
-0.3900352, 0.09256721, -1.009357, 0, 1, 0.0627451, 1,
-0.3879599, 0.2362225, -1.205135, 0, 1, 0.07058824, 1,
-0.3738416, 0.7228246, -0.5136479, 0, 1, 0.07450981, 1,
-0.3648923, -1.237991, -5.486426, 0, 1, 0.08235294, 1,
-0.3625336, -1.283839, -3.470459, 0, 1, 0.08627451, 1,
-0.361362, -0.8172155, -3.972369, 0, 1, 0.09411765, 1,
-0.3601872, -1.336217, -3.698358, 0, 1, 0.1019608, 1,
-0.3583121, -1.017039, -1.839249, 0, 1, 0.1058824, 1,
-0.35506, 1.562153, -0.04820909, 0, 1, 0.1137255, 1,
-0.3454455, -1.574708, -2.0207, 0, 1, 0.1176471, 1,
-0.3411278, -0.5176265, -3.953174, 0, 1, 0.1254902, 1,
-0.3390438, 0.5416017, -0.5680177, 0, 1, 0.1294118, 1,
-0.3364352, 1.40841, -1.299545, 0, 1, 0.1372549, 1,
-0.3341861, -0.0849838, -3.430605, 0, 1, 0.1411765, 1,
-0.3339198, 0.3901095, -1.203334, 0, 1, 0.1490196, 1,
-0.3287225, -1.016002, -1.37852, 0, 1, 0.1529412, 1,
-0.3265492, 0.8666749, -0.4420622, 0, 1, 0.1607843, 1,
-0.3262198, 1.163849, -0.8692331, 0, 1, 0.1647059, 1,
-0.3163128, 1.723148, 1.249594, 0, 1, 0.172549, 1,
-0.3137307, 0.3173445, -1.414105, 0, 1, 0.1764706, 1,
-0.3120025, 0.5143787, 0.3618134, 0, 1, 0.1843137, 1,
-0.3067425, -0.7509251, -1.157412, 0, 1, 0.1882353, 1,
-0.291731, 0.3261949, -2.030671, 0, 1, 0.1960784, 1,
-0.2913641, -0.3580097, -3.197858, 0, 1, 0.2039216, 1,
-0.291108, -2.130441, -3.32758, 0, 1, 0.2078431, 1,
-0.2898251, 0.09106436, -1.567967, 0, 1, 0.2156863, 1,
-0.2813802, 0.9871283, 1.550747, 0, 1, 0.2196078, 1,
-0.2737742, -0.3560098, -0.4741977, 0, 1, 0.227451, 1,
-0.2733586, -0.1575786, -2.972677, 0, 1, 0.2313726, 1,
-0.2659592, 0.9218882, 1.022844, 0, 1, 0.2392157, 1,
-0.2619057, -0.1544733, -1.769681, 0, 1, 0.2431373, 1,
-0.2577892, -0.4364195, -1.571431, 0, 1, 0.2509804, 1,
-0.2518874, 0.06857775, -2.29021, 0, 1, 0.254902, 1,
-0.2504063, -0.8137339, -1.474051, 0, 1, 0.2627451, 1,
-0.2460107, 0.1093001, -0.7650934, 0, 1, 0.2666667, 1,
-0.2453364, 0.7747738, -0.5341063, 0, 1, 0.2745098, 1,
-0.2442632, -2.268496, -3.672815, 0, 1, 0.2784314, 1,
-0.2433576, 0.1971735, -0.4494296, 0, 1, 0.2862745, 1,
-0.2380115, -0.5070742, -3.47378, 0, 1, 0.2901961, 1,
-0.2372928, -0.2940976, -2.712859, 0, 1, 0.2980392, 1,
-0.2319806, -0.8083786, -2.141193, 0, 1, 0.3058824, 1,
-0.2300912, 0.7980722, -1.056592, 0, 1, 0.3098039, 1,
-0.2270287, 0.483725, 0.5088304, 0, 1, 0.3176471, 1,
-0.2260842, -1.258512, -1.873984, 0, 1, 0.3215686, 1,
-0.2245084, -1.455214, -2.909191, 0, 1, 0.3294118, 1,
-0.222446, 0.8167574, 0.2806594, 0, 1, 0.3333333, 1,
-0.2194823, 0.7865314, -0.1435713, 0, 1, 0.3411765, 1,
-0.2161786, -1.786153, -3.757698, 0, 1, 0.345098, 1,
-0.2161769, 1.199369, -2.013551, 0, 1, 0.3529412, 1,
-0.2155981, -0.8905005, -3.567493, 0, 1, 0.3568628, 1,
-0.2110146, 0.3734067, -0.3682403, 0, 1, 0.3647059, 1,
-0.2107712, -1.368413, -3.329245, 0, 1, 0.3686275, 1,
-0.2096334, -0.7427717, -3.919711, 0, 1, 0.3764706, 1,
-0.2088176, -0.6444017, -4.354889, 0, 1, 0.3803922, 1,
-0.2074391, -0.5071402, -1.081645, 0, 1, 0.3882353, 1,
-0.1987703, -0.09332384, -3.344567, 0, 1, 0.3921569, 1,
-0.1946848, -3.216414, -2.423277, 0, 1, 0.4, 1,
-0.189721, 0.3637001, -0.6958942, 0, 1, 0.4078431, 1,
-0.185248, -1.167944, -5.248426, 0, 1, 0.4117647, 1,
-0.1851329, 0.005295114, -2.660566, 0, 1, 0.4196078, 1,
-0.1834606, -0.4054138, -2.318199, 0, 1, 0.4235294, 1,
-0.1791968, -1.395573, -3.276077, 0, 1, 0.4313726, 1,
-0.1790951, 0.6565611, 0.3819702, 0, 1, 0.4352941, 1,
-0.1770485, -1.20343, -2.360252, 0, 1, 0.4431373, 1,
-0.1711973, -0.06402262, -0.0397265, 0, 1, 0.4470588, 1,
-0.171151, 0.100255, -0.393739, 0, 1, 0.454902, 1,
-0.1668994, -0.0794674, -2.978663, 0, 1, 0.4588235, 1,
-0.1653124, 0.2876496, -0.9735816, 0, 1, 0.4666667, 1,
-0.159993, -0.5920693, -3.395668, 0, 1, 0.4705882, 1,
-0.1585446, 0.3831289, -0.2076093, 0, 1, 0.4784314, 1,
-0.1578249, -0.9352393, -3.300283, 0, 1, 0.4823529, 1,
-0.1530386, 0.8578582, 0.08202904, 0, 1, 0.4901961, 1,
-0.1512289, -1.249758, -6.716838, 0, 1, 0.4941176, 1,
-0.1482119, 2.58034, 1.980727, 0, 1, 0.5019608, 1,
-0.1405164, 0.4521241, -0.7001349, 0, 1, 0.509804, 1,
-0.1357477, -1.239558, -3.073096, 0, 1, 0.5137255, 1,
-0.1322895, -0.6009306, -1.980425, 0, 1, 0.5215687, 1,
-0.1301584, -1.172321, -3.100662, 0, 1, 0.5254902, 1,
-0.1253709, -1.118819, -3.794677, 0, 1, 0.5333334, 1,
-0.1208455, 0.9733697, -1.164179, 0, 1, 0.5372549, 1,
-0.1178394, 0.2004792, 0.4847477, 0, 1, 0.5450981, 1,
-0.1175016, 0.8586413, 0.1267941, 0, 1, 0.5490196, 1,
-0.1104613, 1.147332, -0.3627913, 0, 1, 0.5568628, 1,
-0.1068172, -0.6653423, -3.644894, 0, 1, 0.5607843, 1,
-0.1053174, 0.1920982, 0.5409951, 0, 1, 0.5686275, 1,
-0.1046055, 0.965113, -1.801522, 0, 1, 0.572549, 1,
-0.1033473, 0.6834568, -0.1641671, 0, 1, 0.5803922, 1,
-0.1018844, 0.2346325, -0.06351689, 0, 1, 0.5843138, 1,
-0.1014439, 0.7137822, -0.4170118, 0, 1, 0.5921569, 1,
-0.09270797, -1.297985, -4.403595, 0, 1, 0.5960785, 1,
-0.08862464, 1.550582, -0.1644213, 0, 1, 0.6039216, 1,
-0.07955957, 0.8949488, 1.119294, 0, 1, 0.6117647, 1,
-0.07628095, 1.136585, -1.392147, 0, 1, 0.6156863, 1,
-0.07409082, 1.582462, -0.3952835, 0, 1, 0.6235294, 1,
-0.07275819, -0.5199624, -1.142626, 0, 1, 0.627451, 1,
-0.0655745, 1.079774, 0.4805561, 0, 1, 0.6352941, 1,
-0.06294956, 0.4994889, 1.424456, 0, 1, 0.6392157, 1,
-0.05939697, 0.7042301, 0.203723, 0, 1, 0.6470588, 1,
-0.05482666, -0.7016091, -1.531098, 0, 1, 0.6509804, 1,
-0.05404856, -0.3307836, -3.303189, 0, 1, 0.6588235, 1,
-0.04927384, -0.01223727, -1.473863, 0, 1, 0.6627451, 1,
-0.04829984, 0.1486998, -1.497622, 0, 1, 0.6705883, 1,
-0.04560265, 0.7082713, -0.9617223, 0, 1, 0.6745098, 1,
-0.0429284, 0.9014813, 2.026635, 0, 1, 0.682353, 1,
-0.04185353, -0.09926601, -2.819945, 0, 1, 0.6862745, 1,
-0.03325357, -0.7271922, -3.359408, 0, 1, 0.6941177, 1,
-0.03115672, 0.2721635, -1.462063, 0, 1, 0.7019608, 1,
-0.03092689, -0.8816466, -3.079108, 0, 1, 0.7058824, 1,
-0.03050336, 1.08049, -0.3335469, 0, 1, 0.7137255, 1,
-0.02861833, 0.1539286, 0.135816, 0, 1, 0.7176471, 1,
-0.02800594, 0.6352706, 0.7699491, 0, 1, 0.7254902, 1,
-0.02697998, -0.3234278, -2.736315, 0, 1, 0.7294118, 1,
-0.02592132, -0.4008184, -3.307499, 0, 1, 0.7372549, 1,
-0.02577491, 0.09137444, -0.4890512, 0, 1, 0.7411765, 1,
-0.02518647, 1.128876, -0.565247, 0, 1, 0.7490196, 1,
-0.02509936, 0.4071995, 0.6615646, 0, 1, 0.7529412, 1,
-0.02451556, -0.7845445, -3.179688, 0, 1, 0.7607843, 1,
-0.02252408, -2.226299, -3.99299, 0, 1, 0.7647059, 1,
-0.02139274, -0.5250648, -3.871983, 0, 1, 0.772549, 1,
-0.01569727, 0.93924, -0.7150325, 0, 1, 0.7764706, 1,
-0.01361263, 1.294097, -0.03497554, 0, 1, 0.7843137, 1,
-0.01019252, -1.364335, -2.748784, 0, 1, 0.7882353, 1,
-0.007582373, 0.1691854, -0.2325579, 0, 1, 0.7960784, 1,
0.0009348085, 0.8586589, 1.223827, 0, 1, 0.8039216, 1,
0.001454457, 0.1974027, 0.8612849, 0, 1, 0.8078431, 1,
0.01061416, 1.695984, 0.1405468, 0, 1, 0.8156863, 1,
0.01124728, -0.9892752, 1.275068, 0, 1, 0.8196079, 1,
0.01701327, 0.5569896, 0.7092096, 0, 1, 0.827451, 1,
0.01907093, -1.154916, 3.40852, 0, 1, 0.8313726, 1,
0.01963217, 2.544465, -0.7991857, 0, 1, 0.8392157, 1,
0.02725673, -0.1207824, 2.489104, 0, 1, 0.8431373, 1,
0.03745383, 0.9949294, 0.1140982, 0, 1, 0.8509804, 1,
0.03825718, 0.7107046, 0.3124757, 0, 1, 0.854902, 1,
0.04103921, -0.2742243, 3.464358, 0, 1, 0.8627451, 1,
0.04264404, -0.2427965, 2.653474, 0, 1, 0.8666667, 1,
0.04432114, -0.1932149, 3.152771, 0, 1, 0.8745098, 1,
0.05370656, -0.3854571, 4.26021, 0, 1, 0.8784314, 1,
0.05717722, -0.1932189, 4.098124, 0, 1, 0.8862745, 1,
0.05821252, -1.906189, 3.338587, 0, 1, 0.8901961, 1,
0.06021623, -0.7022271, 2.522189, 0, 1, 0.8980392, 1,
0.06418808, -0.2915274, 2.875089, 0, 1, 0.9058824, 1,
0.06578309, -0.8400173, 1.801618, 0, 1, 0.9098039, 1,
0.06596516, 1.300754, -0.1183938, 0, 1, 0.9176471, 1,
0.06801576, 0.750616, -0.8744757, 0, 1, 0.9215686, 1,
0.06877942, -0.7087319, 3.535758, 0, 1, 0.9294118, 1,
0.06912341, -0.7489078, 2.794905, 0, 1, 0.9333333, 1,
0.07147513, -1.059558, 3.159729, 0, 1, 0.9411765, 1,
0.07784414, -0.8814149, 3.666283, 0, 1, 0.945098, 1,
0.08295455, 0.377352, 1.787286, 0, 1, 0.9529412, 1,
0.08412951, -2.581244, 3.57169, 0, 1, 0.9568627, 1,
0.09141488, 1.718846, -1.576061, 0, 1, 0.9647059, 1,
0.09401821, -0.1088127, 3.647306, 0, 1, 0.9686275, 1,
0.09518017, -0.2261605, 2.748247, 0, 1, 0.9764706, 1,
0.09931637, -0.3014815, 1.401171, 0, 1, 0.9803922, 1,
0.1093267, 0.1286272, -0.9021345, 0, 1, 0.9882353, 1,
0.1117862, -0.959105, 5.826773, 0, 1, 0.9921569, 1,
0.1162949, 0.7730126, -1.740246, 0, 1, 1, 1,
0.1175594, -0.8595905, 2.097299, 0, 0.9921569, 1, 1,
0.1240437, 0.2172456, 1.788807, 0, 0.9882353, 1, 1,
0.128411, 0.9196729, -1.627054, 0, 0.9803922, 1, 1,
0.133492, 0.740026, 0.6439598, 0, 0.9764706, 1, 1,
0.1339874, -1.035661, 2.631503, 0, 0.9686275, 1, 1,
0.1370236, -0.009965993, 2.12927, 0, 0.9647059, 1, 1,
0.139458, 0.7968869, -1.657981, 0, 0.9568627, 1, 1,
0.1396561, 2.857786, -1.454754, 0, 0.9529412, 1, 1,
0.143123, 0.8299187, 1.134501, 0, 0.945098, 1, 1,
0.1444467, 0.3097462, -0.2603652, 0, 0.9411765, 1, 1,
0.1480271, -0.5802765, 3.043003, 0, 0.9333333, 1, 1,
0.1489744, 1.508994, -1.501381, 0, 0.9294118, 1, 1,
0.1502068, -0.2580166, 2.273424, 0, 0.9215686, 1, 1,
0.1549455, -0.4343669, 0.83747, 0, 0.9176471, 1, 1,
0.1624366, -1.419423, 3.690883, 0, 0.9098039, 1, 1,
0.1670371, 0.6104959, 1.417118, 0, 0.9058824, 1, 1,
0.1689788, 0.1016939, 0.4908662, 0, 0.8980392, 1, 1,
0.1747561, -0.1663002, 2.752595, 0, 0.8901961, 1, 1,
0.1780462, 0.5337592, 2.027977, 0, 0.8862745, 1, 1,
0.1793972, 0.5701826, 1.300933, 0, 0.8784314, 1, 1,
0.1805406, 1.253945, -0.6191677, 0, 0.8745098, 1, 1,
0.1810594, 0.3626536, 0.4899728, 0, 0.8666667, 1, 1,
0.1844348, -0.5258246, 1.417314, 0, 0.8627451, 1, 1,
0.1845247, -0.4868468, 2.971307, 0, 0.854902, 1, 1,
0.1854369, -1.203602, 4.193974, 0, 0.8509804, 1, 1,
0.1878242, -0.6787638, 3.391535, 0, 0.8431373, 1, 1,
0.1908472, -0.1393752, 2.548024, 0, 0.8392157, 1, 1,
0.1987918, -0.6575508, 2.352709, 0, 0.8313726, 1, 1,
0.2011661, 1.242734, 0.438954, 0, 0.827451, 1, 1,
0.2032453, 0.5672267, 0.5780365, 0, 0.8196079, 1, 1,
0.2091235, -2.053452, 2.023428, 0, 0.8156863, 1, 1,
0.215504, -0.6499249, 3.140529, 0, 0.8078431, 1, 1,
0.2170551, -0.4377102, 1.63422, 0, 0.8039216, 1, 1,
0.2204984, 0.1291281, 2.47372, 0, 0.7960784, 1, 1,
0.2206044, 0.9203044, 0.1498519, 0, 0.7882353, 1, 1,
0.2233539, 0.03811777, 1.032391, 0, 0.7843137, 1, 1,
0.2278898, -2.199262, 3.680832, 0, 0.7764706, 1, 1,
0.2313056, 1.393183, -0.1542303, 0, 0.772549, 1, 1,
0.2322586, 1.616938, -0.6764398, 0, 0.7647059, 1, 1,
0.2349334, 1.127785, 0.8976302, 0, 0.7607843, 1, 1,
0.2413672, -0.009472352, 3.667635, 0, 0.7529412, 1, 1,
0.2434044, -0.301176, 1.95353, 0, 0.7490196, 1, 1,
0.2453926, 0.1116164, 2.483281, 0, 0.7411765, 1, 1,
0.2490339, -1.340701, 2.564156, 0, 0.7372549, 1, 1,
0.249382, 1.354102, -0.4498939, 0, 0.7294118, 1, 1,
0.2498615, 1.106128, 0.04120702, 0, 0.7254902, 1, 1,
0.2512457, -2.192955, 2.090039, 0, 0.7176471, 1, 1,
0.2519198, -0.4220696, 1.285615, 0, 0.7137255, 1, 1,
0.2644946, 1.133999, -1.010607, 0, 0.7058824, 1, 1,
0.2649367, 0.004910702, 2.963747, 0, 0.6980392, 1, 1,
0.2676432, -0.3682064, 3.369387, 0, 0.6941177, 1, 1,
0.2706758, 0.2365072, 1.214261, 0, 0.6862745, 1, 1,
0.2706972, -0.3054403, 2.174292, 0, 0.682353, 1, 1,
0.2736087, 0.6142429, 1.217162, 0, 0.6745098, 1, 1,
0.2755435, -0.8650644, 3.54951, 0, 0.6705883, 1, 1,
0.2823651, 1.786366, 1.091132, 0, 0.6627451, 1, 1,
0.2825366, 0.6642215, 0.3771924, 0, 0.6588235, 1, 1,
0.2846891, -1.215183, 2.658569, 0, 0.6509804, 1, 1,
0.2858331, -1.128764, 3.71986, 0, 0.6470588, 1, 1,
0.2867953, -0.1054021, 1.143854, 0, 0.6392157, 1, 1,
0.287044, -0.3967609, 3.563243, 0, 0.6352941, 1, 1,
0.3010344, 1.260765, -0.6084639, 0, 0.627451, 1, 1,
0.3011219, -0.3004826, 2.632496, 0, 0.6235294, 1, 1,
0.3034535, 0.9276415, 0.03565193, 0, 0.6156863, 1, 1,
0.3049792, 0.5966665, -0.3354179, 0, 0.6117647, 1, 1,
0.3053653, -1.527871, 3.209279, 0, 0.6039216, 1, 1,
0.3061729, -1.052512, 3.070897, 0, 0.5960785, 1, 1,
0.3076385, -0.9581662, 5.179611, 0, 0.5921569, 1, 1,
0.309123, 0.5091311, 1.282725, 0, 0.5843138, 1, 1,
0.3138072, -1.602475, 3.061876, 0, 0.5803922, 1, 1,
0.3143807, 0.8618494, 1.325836, 0, 0.572549, 1, 1,
0.3157564, 1.144341, 0.3017009, 0, 0.5686275, 1, 1,
0.3159871, 0.3197991, -0.07261885, 0, 0.5607843, 1, 1,
0.316967, 1.946578, -0.9614315, 0, 0.5568628, 1, 1,
0.3240409, -0.6769145, -0.118114, 0, 0.5490196, 1, 1,
0.3240949, -0.01225998, 2.485315, 0, 0.5450981, 1, 1,
0.329909, 2.197348, -1.305643, 0, 0.5372549, 1, 1,
0.3338716, -0.4628159, 2.162651, 0, 0.5333334, 1, 1,
0.3352756, 0.3017773, 1.67073, 0, 0.5254902, 1, 1,
0.3354751, 1.284112, 0.3735462, 0, 0.5215687, 1, 1,
0.3380766, -0.530201, 3.227861, 0, 0.5137255, 1, 1,
0.3407336, -0.3126974, 2.202583, 0, 0.509804, 1, 1,
0.3485429, -0.1730514, 1.231947, 0, 0.5019608, 1, 1,
0.3512865, 0.3637613, 1.394172, 0, 0.4941176, 1, 1,
0.3573601, 0.6695175, 0.8005086, 0, 0.4901961, 1, 1,
0.3607786, 0.4341053, 0.8418757, 0, 0.4823529, 1, 1,
0.3610305, 0.6223717, -0.3921015, 0, 0.4784314, 1, 1,
0.3622895, -0.5101022, 0.9745863, 0, 0.4705882, 1, 1,
0.3693139, 0.4346298, 0.08630392, 0, 0.4666667, 1, 1,
0.3714837, -3.915149e-05, 1.185156, 0, 0.4588235, 1, 1,
0.3718555, -2.110368, 2.745818, 0, 0.454902, 1, 1,
0.374613, -0.2778403, 2.483518, 0, 0.4470588, 1, 1,
0.3777805, 0.1348642, 1.493735, 0, 0.4431373, 1, 1,
0.3840923, 1.541881, 0.3552545, 0, 0.4352941, 1, 1,
0.3881378, 0.7710784, 0.9139657, 0, 0.4313726, 1, 1,
0.3900408, 1.082538, -0.6452731, 0, 0.4235294, 1, 1,
0.3911975, 0.06535695, 1.867063, 0, 0.4196078, 1, 1,
0.3927082, 0.3476662, -0.8357518, 0, 0.4117647, 1, 1,
0.3944909, 1.0276, 1.059201, 0, 0.4078431, 1, 1,
0.3955992, 0.3108557, -0.3591384, 0, 0.4, 1, 1,
0.3962215, 1.813917, 1.734235, 0, 0.3921569, 1, 1,
0.3966166, 0.258183, 2.193439, 0, 0.3882353, 1, 1,
0.3984533, 0.3399915, 1.369357, 0, 0.3803922, 1, 1,
0.4024967, -0.7810382, 3.071513, 0, 0.3764706, 1, 1,
0.4025859, 0.9976886, -1.313901, 0, 0.3686275, 1, 1,
0.4046722, -0.2036634, 1.401185, 0, 0.3647059, 1, 1,
0.4095503, -0.2831727, 2.957627, 0, 0.3568628, 1, 1,
0.4122433, 0.08923798, 2.71761, 0, 0.3529412, 1, 1,
0.4123427, 2.556065, 0.255916, 0, 0.345098, 1, 1,
0.412616, 1.166902, -0.04453528, 0, 0.3411765, 1, 1,
0.4128065, 0.3083313, 1.343008, 0, 0.3333333, 1, 1,
0.4134724, -0.06383736, 1.671344, 0, 0.3294118, 1, 1,
0.4143683, 0.07803345, 0.8194634, 0, 0.3215686, 1, 1,
0.416676, -0.2151431, 2.530119, 0, 0.3176471, 1, 1,
0.4184618, 0.6898624, 0.2139085, 0, 0.3098039, 1, 1,
0.4202467, 0.7364802, -0.167328, 0, 0.3058824, 1, 1,
0.420947, 0.9987435, 0.2198351, 0, 0.2980392, 1, 1,
0.4232967, 0.64953, 0.6665304, 0, 0.2901961, 1, 1,
0.4233179, 2.311203, -1.03529, 0, 0.2862745, 1, 1,
0.4314733, 0.8069878, -0.5975184, 0, 0.2784314, 1, 1,
0.4322949, 0.3456362, 0.5358567, 0, 0.2745098, 1, 1,
0.4396319, -0.3311105, 1.459373, 0, 0.2666667, 1, 1,
0.440508, 2.07612, 1.998597, 0, 0.2627451, 1, 1,
0.4441362, -0.8996834, 2.628812, 0, 0.254902, 1, 1,
0.4455162, 0.06030831, 2.114328, 0, 0.2509804, 1, 1,
0.4488375, -0.6710013, 1.912695, 0, 0.2431373, 1, 1,
0.4521738, -0.1344274, 1.299695, 0, 0.2392157, 1, 1,
0.4523317, 1.108749, 0.3340739, 0, 0.2313726, 1, 1,
0.4526417, 0.1335112, 2.026505, 0, 0.227451, 1, 1,
0.4535306, -2.363006, 2.711213, 0, 0.2196078, 1, 1,
0.4578983, -1.196428, 2.950722, 0, 0.2156863, 1, 1,
0.4584204, -0.6427906, 2.690101, 0, 0.2078431, 1, 1,
0.4591529, -0.1510642, 2.799593, 0, 0.2039216, 1, 1,
0.4610175, -0.9550605, 1.157974, 0, 0.1960784, 1, 1,
0.4616075, 0.6732549, 1.142893, 0, 0.1882353, 1, 1,
0.4635295, -0.06956441, 0.09313372, 0, 0.1843137, 1, 1,
0.4639469, -1.601392, 3.002332, 0, 0.1764706, 1, 1,
0.4646291, -0.4327331, 1.150896, 0, 0.172549, 1, 1,
0.4648574, 1.052349, 1.047558, 0, 0.1647059, 1, 1,
0.4731386, 0.2930487, 1.645315, 0, 0.1607843, 1, 1,
0.4800083, 1.041009, 0.3759959, 0, 0.1529412, 1, 1,
0.4812903, -1.222286, 3.22742, 0, 0.1490196, 1, 1,
0.4995547, 0.8675405, 0.3127891, 0, 0.1411765, 1, 1,
0.4996157, 0.6227275, 1.899289, 0, 0.1372549, 1, 1,
0.5029324, -0.7248086, 2.182299, 0, 0.1294118, 1, 1,
0.5042235, -0.5856097, 2.629679, 0, 0.1254902, 1, 1,
0.5060006, 0.1636309, 1.060576, 0, 0.1176471, 1, 1,
0.5082464, 1.354033, 0.9798655, 0, 0.1137255, 1, 1,
0.5094354, 0.4171379, 1.057226, 0, 0.1058824, 1, 1,
0.5108733, 0.7824944, 1.109277, 0, 0.09803922, 1, 1,
0.5109358, 0.3678313, 0.418929, 0, 0.09411765, 1, 1,
0.5172718, -1.421402, 2.093089, 0, 0.08627451, 1, 1,
0.5199476, 0.5836668, 1.051501, 0, 0.08235294, 1, 1,
0.5215623, -0.9574831, 4.121722, 0, 0.07450981, 1, 1,
0.5225825, 0.2569795, 1.564358, 0, 0.07058824, 1, 1,
0.5249931, 0.1695049, 2.494562, 0, 0.0627451, 1, 1,
0.5251266, 1.103017, 1.410004, 0, 0.05882353, 1, 1,
0.5281909, 1.303627, 1.020602, 0, 0.05098039, 1, 1,
0.5282091, 0.5361276, -1.397631, 0, 0.04705882, 1, 1,
0.5396707, 0.4450803, 1.482436, 0, 0.03921569, 1, 1,
0.5410765, -0.2668009, 2.560072, 0, 0.03529412, 1, 1,
0.5442615, -1.875024, 0.8058608, 0, 0.02745098, 1, 1,
0.5454962, 0.5662135, 0.3118405, 0, 0.02352941, 1, 1,
0.5464686, 0.3869964, 0.6235904, 0, 0.01568628, 1, 1,
0.5469649, -0.1543806, 2.286716, 0, 0.01176471, 1, 1,
0.5531069, -1.170879, 1.04908, 0, 0.003921569, 1, 1,
0.5581719, -0.6633846, 1.020006, 0.003921569, 0, 1, 1,
0.5602146, -0.8334617, 3.551931, 0.007843138, 0, 1, 1,
0.5611799, 0.3199554, 1.073638, 0.01568628, 0, 1, 1,
0.5614857, 0.4977125, 1.788793, 0.01960784, 0, 1, 1,
0.5618563, 0.8405572, -1.372851, 0.02745098, 0, 1, 1,
0.5623446, -0.8453173, 2.720715, 0.03137255, 0, 1, 1,
0.5657908, 1.503371, -0.02862884, 0.03921569, 0, 1, 1,
0.5663961, 1.078738, 0.3332944, 0.04313726, 0, 1, 1,
0.5678089, -0.1773708, 2.112278, 0.05098039, 0, 1, 1,
0.5678506, 1.546518, 1.944857, 0.05490196, 0, 1, 1,
0.5693663, -1.447733, 2.582422, 0.0627451, 0, 1, 1,
0.5719162, 1.182139, 2.1348, 0.06666667, 0, 1, 1,
0.5721127, 0.1173001, 2.402176, 0.07450981, 0, 1, 1,
0.5725001, 1.326121, 0.4945797, 0.07843138, 0, 1, 1,
0.5738962, 1.202899, 0.3462126, 0.08627451, 0, 1, 1,
0.5790837, 1.423887, 0.8413748, 0.09019608, 0, 1, 1,
0.5803031, 0.7104251, 1.394692, 0.09803922, 0, 1, 1,
0.5807047, -0.7063721, 0.5312008, 0.1058824, 0, 1, 1,
0.5845501, 0.1557501, 2.074415, 0.1098039, 0, 1, 1,
0.5853699, 0.4508916, 2.384901, 0.1176471, 0, 1, 1,
0.5879896, -0.388947, 2.684402, 0.1215686, 0, 1, 1,
0.5899179, -1.065818, 2.534257, 0.1294118, 0, 1, 1,
0.5906993, -0.230083, 2.150551, 0.1333333, 0, 1, 1,
0.5934053, 0.2573094, 1.045521, 0.1411765, 0, 1, 1,
0.599347, 1.244483, -1.881424, 0.145098, 0, 1, 1,
0.6001658, 0.5052707, 1.93859, 0.1529412, 0, 1, 1,
0.6011551, -0.5156283, 3.715547, 0.1568628, 0, 1, 1,
0.6015587, 0.09396496, 0.3780828, 0.1647059, 0, 1, 1,
0.6053144, -0.1899339, 2.787772, 0.1686275, 0, 1, 1,
0.6116182, -1.019493, 1.759295, 0.1764706, 0, 1, 1,
0.6124578, -0.07916414, 1.22782, 0.1803922, 0, 1, 1,
0.6145851, 0.2839815, 1.509214, 0.1882353, 0, 1, 1,
0.6159069, -1.07165, 0.9543186, 0.1921569, 0, 1, 1,
0.616199, 0.5652507, 1.728351, 0.2, 0, 1, 1,
0.6189677, 0.5312366, 0.8515602, 0.2078431, 0, 1, 1,
0.6223498, 2.047182, -0.9419497, 0.2117647, 0, 1, 1,
0.6276806, -2.131954, 3.166568, 0.2196078, 0, 1, 1,
0.6278177, 0.04968144, 0.9814301, 0.2235294, 0, 1, 1,
0.6307133, 0.5037956, 2.006532, 0.2313726, 0, 1, 1,
0.6343905, 0.000132031, 0.2547761, 0.2352941, 0, 1, 1,
0.641472, 0.01897585, 3.732105, 0.2431373, 0, 1, 1,
0.6421507, -0.356771, 2.561594, 0.2470588, 0, 1, 1,
0.6423521, -0.7591588, 2.618609, 0.254902, 0, 1, 1,
0.644852, -1.131816, 1.691716, 0.2588235, 0, 1, 1,
0.6449731, 1.208505, 2.259292, 0.2666667, 0, 1, 1,
0.648439, -0.6983854, 0.695322, 0.2705882, 0, 1, 1,
0.6529974, -0.3417033, 1.353785, 0.2784314, 0, 1, 1,
0.6531726, -1.366937, 3.600931, 0.282353, 0, 1, 1,
0.6542459, 1.416614, 2.297341, 0.2901961, 0, 1, 1,
0.6586916, 0.4373052, 0.7111306, 0.2941177, 0, 1, 1,
0.6597921, 0.143627, 1.048229, 0.3019608, 0, 1, 1,
0.6612654, -1.095457, 2.32642, 0.3098039, 0, 1, 1,
0.6628585, 0.7863643, 2.453144, 0.3137255, 0, 1, 1,
0.6692882, 0.3839246, 2.584216, 0.3215686, 0, 1, 1,
0.6803246, -1.007842, 3.092166, 0.3254902, 0, 1, 1,
0.6807538, 0.8604096, 0.9772777, 0.3333333, 0, 1, 1,
0.6824144, -0.2211422, 0.4795787, 0.3372549, 0, 1, 1,
0.6841866, -1.096022, 1.746986, 0.345098, 0, 1, 1,
0.6855829, -0.2161538, 0.9690157, 0.3490196, 0, 1, 1,
0.6888565, -0.4041911, 3.096004, 0.3568628, 0, 1, 1,
0.6892609, 1.170975, -1.786792, 0.3607843, 0, 1, 1,
0.6918282, -0.05770219, 3.378876, 0.3686275, 0, 1, 1,
0.6946453, -0.0781396, 2.16739, 0.372549, 0, 1, 1,
0.695946, 0.766499, 0.8971102, 0.3803922, 0, 1, 1,
0.697699, 1.512003, 0.837693, 0.3843137, 0, 1, 1,
0.7030504, 0.9187201, 1.738226, 0.3921569, 0, 1, 1,
0.7040813, -0.9858463, 3.191945, 0.3960784, 0, 1, 1,
0.7079171, 0.7282082, 1.799337, 0.4039216, 0, 1, 1,
0.7106189, -0.9872631, 2.118656, 0.4117647, 0, 1, 1,
0.711587, -0.794633, 3.235078, 0.4156863, 0, 1, 1,
0.711721, -0.537139, 1.283174, 0.4235294, 0, 1, 1,
0.720814, 0.4527844, 2.819411, 0.427451, 0, 1, 1,
0.722894, 0.3569531, 1.604815, 0.4352941, 0, 1, 1,
0.7246609, -2.208364, 1.804096, 0.4392157, 0, 1, 1,
0.7251788, 0.5439669, 3.051638, 0.4470588, 0, 1, 1,
0.7254151, -0.04850212, 2.200233, 0.4509804, 0, 1, 1,
0.7296258, 0.9123142, -1.031351, 0.4588235, 0, 1, 1,
0.7313735, -0.02804492, 1.906296, 0.4627451, 0, 1, 1,
0.7317713, -1.642653, 2.709884, 0.4705882, 0, 1, 1,
0.7334417, -0.1657765, 1.012144, 0.4745098, 0, 1, 1,
0.735584, -0.8924253, 2.528168, 0.4823529, 0, 1, 1,
0.7356979, -2.225086, 3.233533, 0.4862745, 0, 1, 1,
0.7400688, -0.007759745, 1.038566, 0.4941176, 0, 1, 1,
0.7405164, -0.2718021, 3.308674, 0.5019608, 0, 1, 1,
0.7435362, -0.3648148, 2.07657, 0.5058824, 0, 1, 1,
0.7448832, 0.3879861, 1.147707, 0.5137255, 0, 1, 1,
0.7466964, -2.156298, 3.625245, 0.5176471, 0, 1, 1,
0.7474924, 0.5673373, 0.7348453, 0.5254902, 0, 1, 1,
0.7497277, 0.2305287, 1.291336, 0.5294118, 0, 1, 1,
0.7509416, -0.3292028, 1.300285, 0.5372549, 0, 1, 1,
0.7531438, -0.0646677, 3.278922, 0.5411765, 0, 1, 1,
0.7542729, -1.844507, 2.680679, 0.5490196, 0, 1, 1,
0.7575231, -1.333147, 4.352701, 0.5529412, 0, 1, 1,
0.757724, -0.3857398, 2.235069, 0.5607843, 0, 1, 1,
0.7596508, 0.1125723, 3.818335, 0.5647059, 0, 1, 1,
0.7651547, -0.4693936, 1.216594, 0.572549, 0, 1, 1,
0.7666925, -0.9674056, 1.494034, 0.5764706, 0, 1, 1,
0.7696297, -1.688675, 1.747586, 0.5843138, 0, 1, 1,
0.7781149, -2.139471, 3.257521, 0.5882353, 0, 1, 1,
0.7801192, 1.131867, -0.1391936, 0.5960785, 0, 1, 1,
0.7878436, 0.9080382, -0.3577654, 0.6039216, 0, 1, 1,
0.7922099, 0.1753506, 1.226666, 0.6078432, 0, 1, 1,
0.7964975, -0.7893459, 2.426181, 0.6156863, 0, 1, 1,
0.7971267, -1.586401, 1.97461, 0.6196079, 0, 1, 1,
0.7986089, 0.3094599, 1.838425, 0.627451, 0, 1, 1,
0.8090928, 2.348058, 0.09818528, 0.6313726, 0, 1, 1,
0.8200145, -0.1740274, 0.7568752, 0.6392157, 0, 1, 1,
0.8202235, -2.120097, 3.719518, 0.6431373, 0, 1, 1,
0.8219323, -1.095099, 2.579529, 0.6509804, 0, 1, 1,
0.8233426, -0.3083348, 3.141847, 0.654902, 0, 1, 1,
0.830533, -0.1414595, 1.42813, 0.6627451, 0, 1, 1,
0.8347825, -0.3725029, 2.521165, 0.6666667, 0, 1, 1,
0.8363075, -0.1658212, 2.634964, 0.6745098, 0, 1, 1,
0.8373392, 1.6541, 0.7397448, 0.6784314, 0, 1, 1,
0.8381453, 0.2531302, 2.860091, 0.6862745, 0, 1, 1,
0.8393396, 0.5366996, 3.01323, 0.6901961, 0, 1, 1,
0.840367, -0.09537144, 1.511859, 0.6980392, 0, 1, 1,
0.8406786, 1.410571, 0.1752357, 0.7058824, 0, 1, 1,
0.8431786, 2.541745, 0.5389581, 0.7098039, 0, 1, 1,
0.8439683, -1.090127, 3.589401, 0.7176471, 0, 1, 1,
0.8480392, -0.3597216, 2.135381, 0.7215686, 0, 1, 1,
0.8487239, -0.9119886, 0.07372336, 0.7294118, 0, 1, 1,
0.8495672, 1.970849, 1.453725, 0.7333333, 0, 1, 1,
0.8544142, -0.1255227, 4.34393, 0.7411765, 0, 1, 1,
0.8593364, -0.5408065, -0.106971, 0.7450981, 0, 1, 1,
0.8604379, -1.386007, 2.54116, 0.7529412, 0, 1, 1,
0.8652923, 1.080778, 0.2664733, 0.7568628, 0, 1, 1,
0.8761034, -1.12882, 2.863879, 0.7647059, 0, 1, 1,
0.8764185, 0.4007088, 3.002574, 0.7686275, 0, 1, 1,
0.8897229, 0.4532812, 0.2072653, 0.7764706, 0, 1, 1,
0.892512, -1.115278, 1.829994, 0.7803922, 0, 1, 1,
0.8937356, -1.422677, 3.025398, 0.7882353, 0, 1, 1,
0.8987764, 2.437468, 1.054671, 0.7921569, 0, 1, 1,
0.9050092, -0.3691622, 1.417885, 0.8, 0, 1, 1,
0.9067372, 2.388214, -0.5318022, 0.8078431, 0, 1, 1,
0.9076313, -0.6758206, 1.560267, 0.8117647, 0, 1, 1,
0.9105695, 2.739506, 0.8344999, 0.8196079, 0, 1, 1,
0.9191268, 1.416522, 0.9262898, 0.8235294, 0, 1, 1,
0.9209331, -0.4970383, 1.599927, 0.8313726, 0, 1, 1,
0.9254376, 0.745977, 2.177596, 0.8352941, 0, 1, 1,
0.9367289, -3.63755, 3.219194, 0.8431373, 0, 1, 1,
0.9367346, 0.6486955, 2.265726, 0.8470588, 0, 1, 1,
0.9373478, 1.686387, -1.812673, 0.854902, 0, 1, 1,
0.9386709, 2.092981, 1.064528, 0.8588235, 0, 1, 1,
0.9407347, 0.5166154, 1.079447, 0.8666667, 0, 1, 1,
0.9411855, -0.1769155, 2.467076, 0.8705882, 0, 1, 1,
0.9489433, -1.422713, 2.122142, 0.8784314, 0, 1, 1,
0.9506375, -0.2556556, 1.798317, 0.8823529, 0, 1, 1,
0.9531174, -0.9287865, 1.644568, 0.8901961, 0, 1, 1,
0.9552184, 1.52952, 0.1569109, 0.8941177, 0, 1, 1,
0.962879, 0.5900817, 1.677166, 0.9019608, 0, 1, 1,
0.9772436, -0.4543654, 1.066487, 0.9098039, 0, 1, 1,
0.9869273, -0.4895667, 2.572769, 0.9137255, 0, 1, 1,
0.9882774, -0.4092713, 3.596817, 0.9215686, 0, 1, 1,
0.9910427, 1.688928, -0.1048431, 0.9254902, 0, 1, 1,
0.9929113, 0.2913463, 1.262897, 0.9333333, 0, 1, 1,
0.9951834, -0.9950725, 2.019432, 0.9372549, 0, 1, 1,
1.000959, -0.4269481, 2.135232, 0.945098, 0, 1, 1,
1.002291, -0.7667164, 1.154168, 0.9490196, 0, 1, 1,
1.003793, 0.0665678, 0.4130575, 0.9568627, 0, 1, 1,
1.008867, 1.404105, -0.05007306, 0.9607843, 0, 1, 1,
1.009668, -0.2455124, 0.0860718, 0.9686275, 0, 1, 1,
1.016425, -0.4697003, 2.636137, 0.972549, 0, 1, 1,
1.022687, 0.0192889, 1.671185, 0.9803922, 0, 1, 1,
1.028272, 1.476459, 2.596643, 0.9843137, 0, 1, 1,
1.031216, -1.244099, 1.473459, 0.9921569, 0, 1, 1,
1.039084, -1.589929, 1.557407, 0.9960784, 0, 1, 1,
1.041326, -1.774048, 3.884429, 1, 0, 0.9960784, 1,
1.045955, 0.8365261, 1.615185, 1, 0, 0.9882353, 1,
1.057512, -1.034323, 1.162774, 1, 0, 0.9843137, 1,
1.061087, -1.529637, 3.151258, 1, 0, 0.9764706, 1,
1.067426, 1.020335, -0.4186805, 1, 0, 0.972549, 1,
1.0678, 1.136485, -0.6317695, 1, 0, 0.9647059, 1,
1.073567, -0.1796303, 3.221039, 1, 0, 0.9607843, 1,
1.084722, 0.08033194, 1.567018, 1, 0, 0.9529412, 1,
1.085188, -0.4023748, 2.038589, 1, 0, 0.9490196, 1,
1.085549, 1.393274, -0.3026053, 1, 0, 0.9411765, 1,
1.086147, 0.7675702, 0.806042, 1, 0, 0.9372549, 1,
1.088401, -0.1738343, 1.782285, 1, 0, 0.9294118, 1,
1.091354, -0.3686881, 2.65893, 1, 0, 0.9254902, 1,
1.093767, 1.880316, 0.6058505, 1, 0, 0.9176471, 1,
1.101047, -1.15058, 1.367809, 1, 0, 0.9137255, 1,
1.102329, 0.1482439, 0.7884266, 1, 0, 0.9058824, 1,
1.103734, -0.4122071, 2.56434, 1, 0, 0.9019608, 1,
1.10613, -0.7688047, 2.100617, 1, 0, 0.8941177, 1,
1.106713, -2.195662, 0.9666069, 1, 0, 0.8862745, 1,
1.106756, -0.9688984, 3.627388, 1, 0, 0.8823529, 1,
1.107375, -0.1718763, 1.13019, 1, 0, 0.8745098, 1,
1.11386, 1.538545, 1.020033, 1, 0, 0.8705882, 1,
1.121983, 0.04986529, 2.357248, 1, 0, 0.8627451, 1,
1.122958, 0.02979028, 2.762477, 1, 0, 0.8588235, 1,
1.134925, 1.398667, 0.221068, 1, 0, 0.8509804, 1,
1.136133, -0.4783944, 2.329151, 1, 0, 0.8470588, 1,
1.136144, -0.9130262, 2.225226, 1, 0, 0.8392157, 1,
1.13763, -1.195196, 1.02614, 1, 0, 0.8352941, 1,
1.144723, 0.2823862, 1.483982, 1, 0, 0.827451, 1,
1.156843, -0.5472638, 0.7776495, 1, 0, 0.8235294, 1,
1.160641, -0.0247806, 2.021337, 1, 0, 0.8156863, 1,
1.166642, 1.985453, -0.1860205, 1, 0, 0.8117647, 1,
1.170947, 1.354447, 1.690804, 1, 0, 0.8039216, 1,
1.180124, 1.275688, 1.245409, 1, 0, 0.7960784, 1,
1.180717, 0.2108449, 2.699972, 1, 0, 0.7921569, 1,
1.181497, -1.42809, 1.602798, 1, 0, 0.7843137, 1,
1.182112, 2.318495, -1.215155, 1, 0, 0.7803922, 1,
1.194428, -0.7806786, 1.50714, 1, 0, 0.772549, 1,
1.195763, 0.4249149, 2.615284, 1, 0, 0.7686275, 1,
1.196343, 1.51658, -0.07487638, 1, 0, 0.7607843, 1,
1.197804, 0.3285404, 0.7751781, 1, 0, 0.7568628, 1,
1.198775, 0.5324013, 1.376392, 1, 0, 0.7490196, 1,
1.20338, -1.933292, 1.210967, 1, 0, 0.7450981, 1,
1.220531, 1.415566, 0.1156941, 1, 0, 0.7372549, 1,
1.227982, -0.05313804, 0.1766676, 1, 0, 0.7333333, 1,
1.231677, 1.437706, 2.265565, 1, 0, 0.7254902, 1,
1.231687, 0.9378111, 0.8305906, 1, 0, 0.7215686, 1,
1.239012, -0.226128, 1.838671, 1, 0, 0.7137255, 1,
1.245447, 0.1707539, 0.7860835, 1, 0, 0.7098039, 1,
1.24661, -1.731338, 3.06714, 1, 0, 0.7019608, 1,
1.252025, -0.4970627, -0.1574981, 1, 0, 0.6941177, 1,
1.256142, 0.7694924, 1.872149, 1, 0, 0.6901961, 1,
1.256574, -2.074895, 1.437618, 1, 0, 0.682353, 1,
1.258611, 0.8453695, -0.8051862, 1, 0, 0.6784314, 1,
1.262701, -0.4154755, 1.384061, 1, 0, 0.6705883, 1,
1.266565, -1.054514, 3.405171, 1, 0, 0.6666667, 1,
1.270636, 1.213319, 1.026563, 1, 0, 0.6588235, 1,
1.271034, -1.750159, 2.912748, 1, 0, 0.654902, 1,
1.271146, 0.4992462, 1.839504, 1, 0, 0.6470588, 1,
1.272845, 0.5558665, 0.8505171, 1, 0, 0.6431373, 1,
1.273901, -0.2084194, 2.589986, 1, 0, 0.6352941, 1,
1.278314, -0.3201502, 1.871476, 1, 0, 0.6313726, 1,
1.280274, 0.997048, 2.280573, 1, 0, 0.6235294, 1,
1.286759, -1.690016, 3.615863, 1, 0, 0.6196079, 1,
1.288713, 0.02170789, 0.7793377, 1, 0, 0.6117647, 1,
1.293129, -0.584203, 0.2738001, 1, 0, 0.6078432, 1,
1.294891, 0.8658415, 1.500305, 1, 0, 0.6, 1,
1.295325, -0.05996013, 0.9836248, 1, 0, 0.5921569, 1,
1.295543, 1.316613, -0.2735326, 1, 0, 0.5882353, 1,
1.301318, -0.484207, 0.9350925, 1, 0, 0.5803922, 1,
1.307945, -1.47373, 3.000939, 1, 0, 0.5764706, 1,
1.309732, -0.4155408, 1.285188, 1, 0, 0.5686275, 1,
1.312153, 0.04090754, 0.1415379, 1, 0, 0.5647059, 1,
1.314517, -0.1191306, 3.50796, 1, 0, 0.5568628, 1,
1.328084, -0.4718156, 2.361238, 1, 0, 0.5529412, 1,
1.340797, -0.1241127, 3.075441, 1, 0, 0.5450981, 1,
1.342152, -0.8478326, 2.319707, 1, 0, 0.5411765, 1,
1.351457, -0.6135893, 2.771545, 1, 0, 0.5333334, 1,
1.354188, 2.670558, 0.9530127, 1, 0, 0.5294118, 1,
1.362202, 0.6941229, 0.2811241, 1, 0, 0.5215687, 1,
1.36983, -0.4333599, -0.1398286, 1, 0, 0.5176471, 1,
1.385677, -0.962436, 1.805784, 1, 0, 0.509804, 1,
1.388413, -0.3089868, 2.963788, 1, 0, 0.5058824, 1,
1.390749, -0.2357553, 1.171277, 1, 0, 0.4980392, 1,
1.391039, 0.5745524, -0.2420031, 1, 0, 0.4901961, 1,
1.409233, -0.2652746, 2.913965, 1, 0, 0.4862745, 1,
1.411342, -0.1426256, 1.165624, 1, 0, 0.4784314, 1,
1.425573, -0.4399194, 0.62559, 1, 0, 0.4745098, 1,
1.433274, 1.735296, 2.847233, 1, 0, 0.4666667, 1,
1.442274, -2.021907, 3.813056, 1, 0, 0.4627451, 1,
1.447513, -0.1104309, 1.487328, 1, 0, 0.454902, 1,
1.456114, -0.4900594, 4.774844, 1, 0, 0.4509804, 1,
1.45758, 0.379564, 0.479358, 1, 0, 0.4431373, 1,
1.458041, 0.19506, 2.069816, 1, 0, 0.4392157, 1,
1.468139, 2.982913, 0.7420852, 1, 0, 0.4313726, 1,
1.473521, -1.014854, 1.531725, 1, 0, 0.427451, 1,
1.492669, 0.2056464, 2.705156, 1, 0, 0.4196078, 1,
1.500971, 1.208842, 0.1238637, 1, 0, 0.4156863, 1,
1.504355, -0.6476979, 1.583878, 1, 0, 0.4078431, 1,
1.509794, -1.09957, 2.25563, 1, 0, 0.4039216, 1,
1.543806, 0.7320985, 0.8967145, 1, 0, 0.3960784, 1,
1.558874, -0.07064963, 1.58137, 1, 0, 0.3882353, 1,
1.56212, -0.2109469, 1.544373, 1, 0, 0.3843137, 1,
1.563106, 0.07614429, 2.19797, 1, 0, 0.3764706, 1,
1.567206, -0.7988638, 1.161184, 1, 0, 0.372549, 1,
1.598166, -0.7246137, 1.192096, 1, 0, 0.3647059, 1,
1.613749, 0.305236, 0.3061702, 1, 0, 0.3607843, 1,
1.615039, -0.4211554, 3.215145, 1, 0, 0.3529412, 1,
1.62061, -0.7397197, 2.269471, 1, 0, 0.3490196, 1,
1.622641, 0.5193254, 1.684833, 1, 0, 0.3411765, 1,
1.636181, 0.9046324, 1.008528, 1, 0, 0.3372549, 1,
1.644316, 0.2717862, 1.054177, 1, 0, 0.3294118, 1,
1.65698, 0.8772742, 0.9180399, 1, 0, 0.3254902, 1,
1.65995, 0.735922, 1.047215, 1, 0, 0.3176471, 1,
1.663094, -0.07318934, 2.532409, 1, 0, 0.3137255, 1,
1.670718, -0.303693, 2.509077, 1, 0, 0.3058824, 1,
1.672835, 1.12753, 0.9112249, 1, 0, 0.2980392, 1,
1.678898, -0.4061525, 2.248329, 1, 0, 0.2941177, 1,
1.700517, -0.2151702, 2.162948, 1, 0, 0.2862745, 1,
1.710827, 0.003417266, 1.888686, 1, 0, 0.282353, 1,
1.718794, -1.495772, 2.337924, 1, 0, 0.2745098, 1,
1.721097, -0.7999079, 1.726403, 1, 0, 0.2705882, 1,
1.722072, -0.1383755, 3.052785, 1, 0, 0.2627451, 1,
1.722284, -1.170564, 1.760781, 1, 0, 0.2588235, 1,
1.729494, 0.04558384, 1.290251, 1, 0, 0.2509804, 1,
1.734264, -1.079217, 1.982762, 1, 0, 0.2470588, 1,
1.736973, -0.1879736, 2.83852, 1, 0, 0.2392157, 1,
1.753837, 0.3517161, 1.866167, 1, 0, 0.2352941, 1,
1.816821, 0.7942078, 1.525295, 1, 0, 0.227451, 1,
1.832483, 0.3532776, 1.121457, 1, 0, 0.2235294, 1,
1.837508, -0.02838872, 1.303666, 1, 0, 0.2156863, 1,
1.838934, 0.3445055, 1.106265, 1, 0, 0.2117647, 1,
1.867972, 1.121975, 1.438793, 1, 0, 0.2039216, 1,
1.870358, -0.2844412, 0.7216603, 1, 0, 0.1960784, 1,
1.878025, -0.07252424, -0.8145588, 1, 0, 0.1921569, 1,
1.87931, 1.742663, 2.045797, 1, 0, 0.1843137, 1,
1.884752, 0.7576743, 0.7567481, 1, 0, 0.1803922, 1,
1.888141, 0.9070302, 0.1975683, 1, 0, 0.172549, 1,
1.915511, 0.2601092, 2.339691, 1, 0, 0.1686275, 1,
1.924528, -0.006075586, 1.35987, 1, 0, 0.1607843, 1,
1.92709, -1.769597, 1.523252, 1, 0, 0.1568628, 1,
1.937279, -1.326427, 1.015177, 1, 0, 0.1490196, 1,
1.951452, -0.4887255, 1.927948, 1, 0, 0.145098, 1,
2.003159, 1.363155, -0.6497492, 1, 0, 0.1372549, 1,
2.003536, 0.03831253, 3.583772, 1, 0, 0.1333333, 1,
2.052174, 1.146702, 2.329631, 1, 0, 0.1254902, 1,
2.068101, -0.4540044, 1.834574, 1, 0, 0.1215686, 1,
2.073129, -1.9846, 3.231679, 1, 0, 0.1137255, 1,
2.106269, -0.6874295, 1.772152, 1, 0, 0.1098039, 1,
2.110814, 1.01511, 1.745418, 1, 0, 0.1019608, 1,
2.145188, -0.6464231, 3.308842, 1, 0, 0.09411765, 1,
2.163635, 0.9122592, 2.32074, 1, 0, 0.09019608, 1,
2.234565, -1.209157, 0.05051619, 1, 0, 0.08235294, 1,
2.235048, -0.4059855, 3.431654, 1, 0, 0.07843138, 1,
2.251318, -1.14398, 1.780427, 1, 0, 0.07058824, 1,
2.316839, -0.5305827, 1.192698, 1, 0, 0.06666667, 1,
2.336153, 0.1363424, 0.9773664, 1, 0, 0.05882353, 1,
2.415123, 0.9220034, 1.717648, 1, 0, 0.05490196, 1,
2.424503, 0.5030537, 1.895947, 1, 0, 0.04705882, 1,
2.444324, 0.954313, 1.813031, 1, 0, 0.04313726, 1,
2.961209, 0.3919247, 0.6731189, 1, 0, 0.03529412, 1,
3.311691, -1.029738, 1.344793, 1, 0, 0.03137255, 1,
3.328409, -1.176933, 2.763689, 1, 0, 0.02352941, 1,
3.341377, 1.714061, 2.53902, 1, 0, 0.01960784, 1,
3.364496, 1.135498, -0.1758203, 1, 0, 0.01176471, 1,
4.157288, 3.507375, -0.2840252, 1, 0, 0.007843138, 1
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
0.4972987, -4.848615, -8.84298, 0, -0.5, 0.5, 0.5,
0.4972987, -4.848615, -8.84298, 1, -0.5, 0.5, 0.5,
0.4972987, -4.848615, -8.84298, 1, 1.5, 0.5, 0.5,
0.4972987, -4.848615, -8.84298, 0, 1.5, 0.5, 0.5
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
-4.403426, -0.06508744, -8.84298, 0, -0.5, 0.5, 0.5,
-4.403426, -0.06508744, -8.84298, 1, -0.5, 0.5, 0.5,
-4.403426, -0.06508744, -8.84298, 1, 1.5, 0.5, 0.5,
-4.403426, -0.06508744, -8.84298, 0, 1.5, 0.5, 0.5
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
-4.403426, -4.848615, -0.4450324, 0, -0.5, 0.5, 0.5,
-4.403426, -4.848615, -0.4450324, 1, -0.5, 0.5, 0.5,
-4.403426, -4.848615, -0.4450324, 1, 1.5, 0.5, 0.5,
-4.403426, -4.848615, -0.4450324, 0, 1.5, 0.5, 0.5
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
-2, -3.744724, -6.904992,
4, -3.744724, -6.904992,
-2, -3.744724, -6.904992,
-2, -3.928706, -7.22799,
0, -3.744724, -6.904992,
0, -3.928706, -7.22799,
2, -3.744724, -6.904992,
2, -3.928706, -7.22799,
4, -3.744724, -6.904992,
4, -3.928706, -7.22799
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
-2, -4.29667, -7.873986, 0, -0.5, 0.5, 0.5,
-2, -4.29667, -7.873986, 1, -0.5, 0.5, 0.5,
-2, -4.29667, -7.873986, 1, 1.5, 0.5, 0.5,
-2, -4.29667, -7.873986, 0, 1.5, 0.5, 0.5,
0, -4.29667, -7.873986, 0, -0.5, 0.5, 0.5,
0, -4.29667, -7.873986, 1, -0.5, 0.5, 0.5,
0, -4.29667, -7.873986, 1, 1.5, 0.5, 0.5,
0, -4.29667, -7.873986, 0, 1.5, 0.5, 0.5,
2, -4.29667, -7.873986, 0, -0.5, 0.5, 0.5,
2, -4.29667, -7.873986, 1, -0.5, 0.5, 0.5,
2, -4.29667, -7.873986, 1, 1.5, 0.5, 0.5,
2, -4.29667, -7.873986, 0, 1.5, 0.5, 0.5,
4, -4.29667, -7.873986, 0, -0.5, 0.5, 0.5,
4, -4.29667, -7.873986, 1, -0.5, 0.5, 0.5,
4, -4.29667, -7.873986, 1, 1.5, 0.5, 0.5,
4, -4.29667, -7.873986, 0, 1.5, 0.5, 0.5
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
-3.27249, -2, -6.904992,
-3.27249, 2, -6.904992,
-3.27249, -2, -6.904992,
-3.460979, -2, -7.22799,
-3.27249, 0, -6.904992,
-3.460979, 0, -7.22799,
-3.27249, 2, -6.904992,
-3.460979, 2, -7.22799
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
"0",
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
-3.837958, -2, -7.873986, 0, -0.5, 0.5, 0.5,
-3.837958, -2, -7.873986, 1, -0.5, 0.5, 0.5,
-3.837958, -2, -7.873986, 1, 1.5, 0.5, 0.5,
-3.837958, -2, -7.873986, 0, 1.5, 0.5, 0.5,
-3.837958, 0, -7.873986, 0, -0.5, 0.5, 0.5,
-3.837958, 0, -7.873986, 1, -0.5, 0.5, 0.5,
-3.837958, 0, -7.873986, 1, 1.5, 0.5, 0.5,
-3.837958, 0, -7.873986, 0, 1.5, 0.5, 0.5,
-3.837958, 2, -7.873986, 0, -0.5, 0.5, 0.5,
-3.837958, 2, -7.873986, 1, -0.5, 0.5, 0.5,
-3.837958, 2, -7.873986, 1, 1.5, 0.5, 0.5,
-3.837958, 2, -7.873986, 0, 1.5, 0.5, 0.5
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
-3.27249, -3.744724, -6,
-3.27249, -3.744724, 4,
-3.27249, -3.744724, -6,
-3.460979, -3.928706, -6,
-3.27249, -3.744724, -4,
-3.460979, -3.928706, -4,
-3.27249, -3.744724, -2,
-3.460979, -3.928706, -2,
-3.27249, -3.744724, 0,
-3.460979, -3.928706, 0,
-3.27249, -3.744724, 2,
-3.460979, -3.928706, 2,
-3.27249, -3.744724, 4,
-3.460979, -3.928706, 4
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
"-6",
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
-3.837958, -4.29667, -6, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -6, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -6, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, -6, 0, 1.5, 0.5, 0.5,
-3.837958, -4.29667, -4, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -4, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -4, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, -4, 0, 1.5, 0.5, 0.5,
-3.837958, -4.29667, -2, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -2, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, -2, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, -2, 0, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 0, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 0, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 0, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 0, 0, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 2, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 2, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 2, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 2, 0, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 4, 0, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 4, 1, -0.5, 0.5, 0.5,
-3.837958, -4.29667, 4, 1, 1.5, 0.5, 0.5,
-3.837958, -4.29667, 4, 0, 1.5, 0.5, 0.5
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
-3.27249, -3.744724, -6.904992,
-3.27249, 3.614549, -6.904992,
-3.27249, -3.744724, 6.014927,
-3.27249, 3.614549, 6.014927,
-3.27249, -3.744724, -6.904992,
-3.27249, -3.744724, 6.014927,
-3.27249, 3.614549, -6.904992,
-3.27249, 3.614549, 6.014927,
-3.27249, -3.744724, -6.904992,
4.267087, -3.744724, -6.904992,
-3.27249, -3.744724, 6.014927,
4.267087, -3.744724, 6.014927,
-3.27249, 3.614549, -6.904992,
4.267087, 3.614549, -6.904992,
-3.27249, 3.614549, 6.014927,
4.267087, 3.614549, 6.014927,
4.267087, -3.744724, -6.904992,
4.267087, 3.614549, -6.904992,
4.267087, -3.744724, 6.014927,
4.267087, 3.614549, 6.014927,
4.267087, -3.744724, -6.904992,
4.267087, -3.744724, 6.014927,
4.267087, 3.614549, -6.904992,
4.267087, 3.614549, 6.014927
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
var radius = 8.90209;
var distance = 39.6064;
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
mvMatrix.translate( -0.4972987, 0.06508744, 0.4450324 );
mvMatrix.scale( 1.276612, 1.307889, 0.7449825 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.6064);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
acetic_acid<-read.table("acetic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acetic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
y<-acetic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
z<-acetic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
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
-3.16269, -0.07318175, 0.3295965, 0, 0, 1, 1, 1,
-3.156392, 0.9770692, -2.193711, 1, 0, 0, 1, 1,
-2.85919, -3.127234, -1.635351, 1, 0, 0, 1, 1,
-2.650682, -0.8017194, -3.467383, 1, 0, 0, 1, 1,
-2.643679, 1.148325, -0.99686, 1, 0, 0, 1, 1,
-2.635885, -0.6030986, -1.473004, 1, 0, 0, 1, 1,
-2.608835, -0.3584689, -3.692796, 0, 0, 0, 1, 1,
-2.569205, 0.6636194, -1.452906, 0, 0, 0, 1, 1,
-2.564568, 0.901494, -1.957288, 0, 0, 0, 1, 1,
-2.523208, 0.8332438, -2.386068, 0, 0, 0, 1, 1,
-2.367753, 1.55385, -1.091495, 0, 0, 0, 1, 1,
-2.352253, 0.6039014, -1.343031, 0, 0, 0, 1, 1,
-2.281306, -0.3086409, -1.283548, 0, 0, 0, 1, 1,
-2.239672, 0.6363231, -1.267746, 1, 1, 1, 1, 1,
-2.142935, 0.2093807, -0.6087669, 1, 1, 1, 1, 1,
-2.127878, 0.8927212, -0.5732474, 1, 1, 1, 1, 1,
-2.106939, -0.7720384, -1.770093, 1, 1, 1, 1, 1,
-2.09875, 1.00166, 0.005410676, 1, 1, 1, 1, 1,
-2.081555, -1.079451, -3.924422, 1, 1, 1, 1, 1,
-2.011344, 0.9496825, -0.4249888, 1, 1, 1, 1, 1,
-2.006671, -2.010792, -1.657076, 1, 1, 1, 1, 1,
-2.003788, 0.9194036, -1.325442, 1, 1, 1, 1, 1,
-1.980735, 0.320094, -2.025708, 1, 1, 1, 1, 1,
-1.972747, -1.362734, -2.000992, 1, 1, 1, 1, 1,
-1.943484, -2.110498, -3.510599, 1, 1, 1, 1, 1,
-1.943042, 0.4941992, -1.840717, 1, 1, 1, 1, 1,
-1.922172, -0.495681, -2.861226, 1, 1, 1, 1, 1,
-1.907284, -1.081119, -3.386695, 1, 1, 1, 1, 1,
-1.895525, 0.2079948, -1.609584, 0, 0, 1, 1, 1,
-1.884469, -2.357477, -1.276884, 1, 0, 0, 1, 1,
-1.863654, -1.065187, -2.484604, 1, 0, 0, 1, 1,
-1.846584, -1.439391, -2.846287, 1, 0, 0, 1, 1,
-1.843245, 0.6405269, -1.285946, 1, 0, 0, 1, 1,
-1.830119, 1.361823, -1.254646, 1, 0, 0, 1, 1,
-1.822753, 0.8749865, -2.330755, 0, 0, 0, 1, 1,
-1.795984, 1.169636, -1.896742, 0, 0, 0, 1, 1,
-1.789978, -0.2891439, -1.545594, 0, 0, 0, 1, 1,
-1.780317, 0.2275709, -2.095426, 0, 0, 0, 1, 1,
-1.77381, -0.01405614, -0.7064819, 0, 0, 0, 1, 1,
-1.762159, 0.6770307, -0.3712893, 0, 0, 0, 1, 1,
-1.760271, 1.810741, -2.335362, 0, 0, 0, 1, 1,
-1.754063, -1.135674, -2.315852, 1, 1, 1, 1, 1,
-1.747858, -1.516778, -2.961067, 1, 1, 1, 1, 1,
-1.734153, 0.9193695, -0.1999436, 1, 1, 1, 1, 1,
-1.724718, -0.9244096, -2.041873, 1, 1, 1, 1, 1,
-1.710651, -1.500809, -2.706516, 1, 1, 1, 1, 1,
-1.707566, 0.08043405, -3.192858, 1, 1, 1, 1, 1,
-1.688043, 0.07898725, -1.610134, 1, 1, 1, 1, 1,
-1.67653, -1.070795, -1.285665, 1, 1, 1, 1, 1,
-1.675308, -0.09919611, 0.3531324, 1, 1, 1, 1, 1,
-1.673669, -1.636624, -1.252025, 1, 1, 1, 1, 1,
-1.673527, 2.084725, 0.3979177, 1, 1, 1, 1, 1,
-1.672939, 0.194522, -1.727381, 1, 1, 1, 1, 1,
-1.665004, 1.819794, 0.3833775, 1, 1, 1, 1, 1,
-1.655116, -0.356512, -3.777195, 1, 1, 1, 1, 1,
-1.646035, 1.030374, -2.049471, 1, 1, 1, 1, 1,
-1.637532, 1.434888, -1.058985, 0, 0, 1, 1, 1,
-1.635603, -1.076391, -1.900574, 1, 0, 0, 1, 1,
-1.630203, -0.2791401, -1.100891, 1, 0, 0, 1, 1,
-1.617568, -0.1812548, -1.535451, 1, 0, 0, 1, 1,
-1.614511, -1.015611, -2.022936, 1, 0, 0, 1, 1,
-1.593797, -0.717876, -2.631481, 1, 0, 0, 1, 1,
-1.578385, 0.1015826, 0.7174907, 0, 0, 0, 1, 1,
-1.573406, 0.4177086, 0.5972341, 0, 0, 0, 1, 1,
-1.571344, -0.2700522, -1.839813, 0, 0, 0, 1, 1,
-1.559922, -0.3030653, -0.5212287, 0, 0, 0, 1, 1,
-1.556814, 0.01226625, -1.323944, 0, 0, 0, 1, 1,
-1.550611, 0.3013541, -1.831984, 0, 0, 0, 1, 1,
-1.54794, 0.1679405, -1.065536, 0, 0, 0, 1, 1,
-1.544042, -3.267783, -2.257771, 1, 1, 1, 1, 1,
-1.538249, 1.396012, -2.008496, 1, 1, 1, 1, 1,
-1.535197, -1.015808, -2.220512, 1, 1, 1, 1, 1,
-1.532208, 0.06053039, 0.1180605, 1, 1, 1, 1, 1,
-1.531466, -0.0397127, -2.735828, 1, 1, 1, 1, 1,
-1.526745, 1.744025, -0.5741506, 1, 1, 1, 1, 1,
-1.516992, 0.5934014, -2.427908, 1, 1, 1, 1, 1,
-1.514967, -1.729381, -3.353884, 1, 1, 1, 1, 1,
-1.513045, 0.6778302, -1.629496, 1, 1, 1, 1, 1,
-1.502119, -0.01708114, -1.875841, 1, 1, 1, 1, 1,
-1.500943, 0.2659168, -2.445727, 1, 1, 1, 1, 1,
-1.484105, -0.7065802, -2.47638, 1, 1, 1, 1, 1,
-1.463965, 1.120081, 0.1285775, 1, 1, 1, 1, 1,
-1.450031, 0.156604, -1.604446, 1, 1, 1, 1, 1,
-1.448321, 0.4031008, -0.0125496, 1, 1, 1, 1, 1,
-1.443089, 0.4249527, -3.267488, 0, 0, 1, 1, 1,
-1.433852, 1.347314, -0.8847738, 1, 0, 0, 1, 1,
-1.431582, -0.09214641, -2.69137, 1, 0, 0, 1, 1,
-1.42752, 0.2467599, -3.721011, 1, 0, 0, 1, 1,
-1.41957, 0.4656934, -0.7508457, 1, 0, 0, 1, 1,
-1.416632, -0.2981344, -0.7934066, 1, 0, 0, 1, 1,
-1.395242, 1.28023, -0.2475977, 0, 0, 0, 1, 1,
-1.39389, 1.797403, -1.49124, 0, 0, 0, 1, 1,
-1.38318, -2.661727, -3.275566, 0, 0, 0, 1, 1,
-1.351133, -0.7427827, -1.996951, 0, 0, 0, 1, 1,
-1.347725, 0.8415743, -0.2967144, 0, 0, 0, 1, 1,
-1.347438, 1.817118, -0.2963193, 0, 0, 0, 1, 1,
-1.344338, 0.1063258, -3.178272, 0, 0, 0, 1, 1,
-1.344262, 1.022663, -0.8387327, 1, 1, 1, 1, 1,
-1.342436, -0.8399261, -0.4054039, 1, 1, 1, 1, 1,
-1.331981, -0.7438444, -1.536712, 1, 1, 1, 1, 1,
-1.329811, -0.3418635, 1.070559, 1, 1, 1, 1, 1,
-1.324015, 2.269676, -0.9541012, 1, 1, 1, 1, 1,
-1.312755, 0.01569425, -1.149499, 1, 1, 1, 1, 1,
-1.308838, 0.6677855, -0.985048, 1, 1, 1, 1, 1,
-1.307146, -1.937973, -1.02725, 1, 1, 1, 1, 1,
-1.306866, -1.506111, -2.49081, 1, 1, 1, 1, 1,
-1.302342, 0.4861734, -1.739195, 1, 1, 1, 1, 1,
-1.301139, 0.7011775, -0.4835812, 1, 1, 1, 1, 1,
-1.297683, -1.591409, -3.010176, 1, 1, 1, 1, 1,
-1.292507, -0.7968202, -1.750786, 1, 1, 1, 1, 1,
-1.291067, 1.044301, 0.5084714, 1, 1, 1, 1, 1,
-1.286558, 3.339072, -0.1313681, 1, 1, 1, 1, 1,
-1.259011, 0.3783848, -1.79432, 0, 0, 1, 1, 1,
-1.255463, 0.06609779, -2.934417, 1, 0, 0, 1, 1,
-1.247178, -1.265391, -2.822613, 1, 0, 0, 1, 1,
-1.243447, 0.772473, -2.886379, 1, 0, 0, 1, 1,
-1.232276, -0.05383556, -0.5451481, 1, 0, 0, 1, 1,
-1.230181, -0.3523674, -1.897815, 1, 0, 0, 1, 1,
-1.227239, -0.1871756, -3.266164, 0, 0, 0, 1, 1,
-1.221454, -0.4936001, -1.466651, 0, 0, 0, 1, 1,
-1.211331, 0.0559054, -2.639226, 0, 0, 0, 1, 1,
-1.209287, -1.124272, -2.440768, 0, 0, 0, 1, 1,
-1.208065, 0.1609364, -1.11612, 0, 0, 0, 1, 1,
-1.204478, -0.8144626, 0.9688767, 0, 0, 0, 1, 1,
-1.201038, 1.127459, -1.628562, 0, 0, 0, 1, 1,
-1.195789, -0.1951513, -0.905273, 1, 1, 1, 1, 1,
-1.190625, -0.2828001, -0.7850401, 1, 1, 1, 1, 1,
-1.187787, 0.7790582, -1.252836, 1, 1, 1, 1, 1,
-1.170809, 0.5212347, -0.4446322, 1, 1, 1, 1, 1,
-1.16071, 0.5770237, 0.4753367, 1, 1, 1, 1, 1,
-1.158121, 1.083437, -0.9042701, 1, 1, 1, 1, 1,
-1.156468, 0.6300407, -1.632524, 1, 1, 1, 1, 1,
-1.154044, -0.7526875, -1.725524, 1, 1, 1, 1, 1,
-1.151014, 0.6447878, -1.378352, 1, 1, 1, 1, 1,
-1.15054, -0.4306342, -2.898084, 1, 1, 1, 1, 1,
-1.143072, 1.48321, -0.2233453, 1, 1, 1, 1, 1,
-1.129091, -0.2141035, -1.176196, 1, 1, 1, 1, 1,
-1.128744, 0.454548, -2.697258, 1, 1, 1, 1, 1,
-1.120224, -1.143273, -2.634802, 1, 1, 1, 1, 1,
-1.119681, -2.009199, -3.878908, 1, 1, 1, 1, 1,
-1.108814, -0.9931704, -0.4378039, 0, 0, 1, 1, 1,
-1.107425, 0.2258721, -1.252161, 1, 0, 0, 1, 1,
-1.105371, 1.128373, -1.599438, 1, 0, 0, 1, 1,
-1.103779, -1.730526, -3.443997, 1, 0, 0, 1, 1,
-1.095502, -0.8692098, -1.379677, 1, 0, 0, 1, 1,
-1.090414, -1.244649, -3.110932, 1, 0, 0, 1, 1,
-1.086961, 0.5385582, 0.07758919, 0, 0, 0, 1, 1,
-1.085088, 0.9190281, -1.571951, 0, 0, 0, 1, 1,
-1.082778, -0.6737897, -2.275074, 0, 0, 0, 1, 1,
-1.081172, -0.7171097, -1.1649, 0, 0, 0, 1, 1,
-1.071707, -3.297659, -1.180765, 0, 0, 0, 1, 1,
-1.070384, -0.3348626, -1.569062, 0, 0, 0, 1, 1,
-1.063285, -2.392883, -2.761489, 0, 0, 0, 1, 1,
-1.061797, -0.08768513, -2.711175, 1, 1, 1, 1, 1,
-1.056381, -0.2704837, -0.6717311, 1, 1, 1, 1, 1,
-1.054593, 0.7568631, -1.605063, 1, 1, 1, 1, 1,
-1.053218, -0.02825549, -2.207889, 1, 1, 1, 1, 1,
-1.041474, -0.06063017, -1.625711, 1, 1, 1, 1, 1,
-1.03602, 1.583636, -0.7596203, 1, 1, 1, 1, 1,
-1.030008, 0.9191659, -0.3570415, 1, 1, 1, 1, 1,
-1.02858, 0.1247775, -1.675989, 1, 1, 1, 1, 1,
-1.027203, 0.5502619, -1.123552, 1, 1, 1, 1, 1,
-1.025355, -0.577181, -2.8226, 1, 1, 1, 1, 1,
-1.023598, 0.798793, 0.7081101, 1, 1, 1, 1, 1,
-1.013771, -1.044723, -0.8790268, 1, 1, 1, 1, 1,
-1.002416, 0.8701854, 0.122822, 1, 1, 1, 1, 1,
-0.9951029, 0.106781, -0.2460608, 1, 1, 1, 1, 1,
-0.9918063, 1.457987, -0.09842877, 1, 1, 1, 1, 1,
-0.9864665, 0.3278788, -2.608439, 0, 0, 1, 1, 1,
-0.985306, 0.8297114, -0.9977448, 1, 0, 0, 1, 1,
-0.9844581, 0.05699661, -0.8091995, 1, 0, 0, 1, 1,
-0.9836244, 0.5759748, -0.5549101, 1, 0, 0, 1, 1,
-0.9828746, 0.1246711, -0.235502, 1, 0, 0, 1, 1,
-0.9814331, -0.5805634, -2.734943, 1, 0, 0, 1, 1,
-0.9787, -1.23086, -3.589632, 0, 0, 0, 1, 1,
-0.9695016, -0.1808087, -2.271251, 0, 0, 0, 1, 1,
-0.9579213, 1.817801, -1.334295, 0, 0, 0, 1, 1,
-0.9541801, 0.3177072, -2.73675, 0, 0, 0, 1, 1,
-0.9484275, -0.96782, -1.896254, 0, 0, 0, 1, 1,
-0.9443376, 0.1631636, -2.232769, 0, 0, 0, 1, 1,
-0.9427892, -2.237208, -2.471555, 0, 0, 0, 1, 1,
-0.9418145, 0.40892, -1.293883, 1, 1, 1, 1, 1,
-0.9309429, 0.9097565, -0.951545, 1, 1, 1, 1, 1,
-0.9279915, 0.1630663, -1.324939, 1, 1, 1, 1, 1,
-0.923113, 0.02626678, -3.102027, 1, 1, 1, 1, 1,
-0.9177044, -0.4343816, -0.06399953, 1, 1, 1, 1, 1,
-0.9167233, 0.6343123, -0.005567844, 1, 1, 1, 1, 1,
-0.9042987, -0.01776301, 0.9379364, 1, 1, 1, 1, 1,
-0.9041666, 0.5376149, -2.24435, 1, 1, 1, 1, 1,
-0.8990657, 1.635279, -0.5596167, 1, 1, 1, 1, 1,
-0.8985817, -0.03187786, -2.190758, 1, 1, 1, 1, 1,
-0.8956555, 0.4793621, -2.56166, 1, 1, 1, 1, 1,
-0.8936201, -0.09841033, -2.062476, 1, 1, 1, 1, 1,
-0.8927301, 1.690006, -0.3021298, 1, 1, 1, 1, 1,
-0.8858839, 0.2764263, -2.487419, 1, 1, 1, 1, 1,
-0.8707205, -0.1367777, -1.722656, 1, 1, 1, 1, 1,
-0.8695601, 1.033934, -0.9908617, 0, 0, 1, 1, 1,
-0.8695472, -0.01329476, -2.755905, 1, 0, 0, 1, 1,
-0.867448, 0.8794079, 0.9848912, 1, 0, 0, 1, 1,
-0.8654127, 0.4449106, -0.2690239, 1, 0, 0, 1, 1,
-0.8641146, 0.1205505, -0.4851052, 1, 0, 0, 1, 1,
-0.8534929, -0.5751791, -3.088191, 1, 0, 0, 1, 1,
-0.8529614, -0.5337692, -3.245425, 0, 0, 0, 1, 1,
-0.8477445, 0.005079576, -1.969799, 0, 0, 0, 1, 1,
-0.8418319, -1.421811, -2.41914, 0, 0, 0, 1, 1,
-0.8375073, -0.1716725, -2.047389, 0, 0, 0, 1, 1,
-0.8348382, 2.026292, 0.04304821, 0, 0, 0, 1, 1,
-0.8299698, -1.323642, -3.787856, 0, 0, 0, 1, 1,
-0.8211013, -1.211121, -2.116797, 0, 0, 0, 1, 1,
-0.8204367, 2.791812, -0.8787192, 1, 1, 1, 1, 1,
-0.8184409, -0.5437952, -3.137051, 1, 1, 1, 1, 1,
-0.8171791, 0.56472, -0.5859557, 1, 1, 1, 1, 1,
-0.8169775, 0.3912848, -1.87497, 1, 1, 1, 1, 1,
-0.8084245, 0.6113462, -1.709301, 1, 1, 1, 1, 1,
-0.8070741, 2.530978, -0.3058788, 1, 1, 1, 1, 1,
-0.8067026, -0.01550043, 0.4899048, 1, 1, 1, 1, 1,
-0.799391, -0.2904587, -1.75706, 1, 1, 1, 1, 1,
-0.7983264, -0.4882579, -2.313095, 1, 1, 1, 1, 1,
-0.7954692, -1.308917, -2.405025, 1, 1, 1, 1, 1,
-0.7937168, -0.5545383, -2.357872, 1, 1, 1, 1, 1,
-0.792407, -1.197757, -2.326535, 1, 1, 1, 1, 1,
-0.7886724, -0.8741012, -2.479532, 1, 1, 1, 1, 1,
-0.7802252, 0.1884422, -1.099857, 1, 1, 1, 1, 1,
-0.7770286, -0.2891051, -0.7217976, 1, 1, 1, 1, 1,
-0.7763741, -1.60433, -3.086467, 0, 0, 1, 1, 1,
-0.7650495, -0.8723595, -2.641364, 1, 0, 0, 1, 1,
-0.7293445, 0.573937, -1.064831, 1, 0, 0, 1, 1,
-0.7283654, 0.8541179, -0.1154479, 1, 0, 0, 1, 1,
-0.7247096, -0.2686607, -3.37256, 1, 0, 0, 1, 1,
-0.7235178, 0.3502157, -0.3833807, 1, 0, 0, 1, 1,
-0.7186598, 0.2837186, -1.633309, 0, 0, 0, 1, 1,
-0.7181939, 0.5731252, 0.3803016, 0, 0, 0, 1, 1,
-0.7142388, -0.8216206, -1.224433, 0, 0, 0, 1, 1,
-0.7119402, -0.8591025, -1.898138, 0, 0, 0, 1, 1,
-0.7062526, 1.187163, 0.2121689, 0, 0, 0, 1, 1,
-0.7007714, 0.8456831, -2.347011, 0, 0, 0, 1, 1,
-0.7007356, -0.635336, -3.938023, 0, 0, 0, 1, 1,
-0.6970938, -1.414205, -3.470157, 1, 1, 1, 1, 1,
-0.6944965, -1.355276, -1.517406, 1, 1, 1, 1, 1,
-0.6940914, -1.013932, -3.971655, 1, 1, 1, 1, 1,
-0.6929564, 1.056181, -1.213847, 1, 1, 1, 1, 1,
-0.6900531, -1.851045, -3.354434, 1, 1, 1, 1, 1,
-0.6855887, -0.3654914, -1.917673, 1, 1, 1, 1, 1,
-0.6811814, -1.472935, -4.031021, 1, 1, 1, 1, 1,
-0.6762505, 0.326355, -0.869704, 1, 1, 1, 1, 1,
-0.6755329, -0.8783395, -2.189549, 1, 1, 1, 1, 1,
-0.6753345, 1.882562, 0.3651589, 1, 1, 1, 1, 1,
-0.6719673, 1.116592, -0.9703814, 1, 1, 1, 1, 1,
-0.6685576, 0.2507676, -1.067328, 1, 1, 1, 1, 1,
-0.6653327, -1.200772, -3.627671, 1, 1, 1, 1, 1,
-0.6624282, -0.6840137, -1.48954, 1, 1, 1, 1, 1,
-0.6619341, 1.395323, -3.214365, 1, 1, 1, 1, 1,
-0.6613756, -0.2786167, -1.502057, 0, 0, 1, 1, 1,
-0.6599784, 0.4615083, -1.091785, 1, 0, 0, 1, 1,
-0.6534514, -0.06807368, -2.799642, 1, 0, 0, 1, 1,
-0.6495544, 0.3428473, 0.02516027, 1, 0, 0, 1, 1,
-0.6427116, 1.673699, 1.498846, 1, 0, 0, 1, 1,
-0.6375821, 2.203614, 0.08759986, 1, 0, 0, 1, 1,
-0.6342354, -0.2236652, -1.821648, 0, 0, 0, 1, 1,
-0.6292143, 0.364098, -0.6712415, 0, 0, 0, 1, 1,
-0.6283181, 0.1230358, -0.6263052, 0, 0, 0, 1, 1,
-0.6232389, -0.3235683, -1.702497, 0, 0, 0, 1, 1,
-0.6189884, -0.0254068, -1.088708, 0, 0, 0, 1, 1,
-0.6145968, -1.439458, -1.473904, 0, 0, 0, 1, 1,
-0.6118567, 0.2899884, -1.688149, 0, 0, 0, 1, 1,
-0.6037301, -0.1237131, -2.367327, 1, 1, 1, 1, 1,
-0.6026064, 0.4726119, -2.211703, 1, 1, 1, 1, 1,
-0.5953892, 1.348593, -0.1915431, 1, 1, 1, 1, 1,
-0.5944266, -0.1277349, -2.415677, 1, 1, 1, 1, 1,
-0.593764, -0.1577633, -1.314413, 1, 1, 1, 1, 1,
-0.5929978, -1.726956, -1.938115, 1, 1, 1, 1, 1,
-0.5890167, 1.075123, -2.001129, 1, 1, 1, 1, 1,
-0.5871124, -1.666653, -4.057714, 1, 1, 1, 1, 1,
-0.5849714, -0.7880949, -2.213685, 1, 1, 1, 1, 1,
-0.5844705, 0.4142295, -1.6615, 1, 1, 1, 1, 1,
-0.58129, 0.5152548, -0.06529626, 1, 1, 1, 1, 1,
-0.5776166, 0.4790135, -0.9901667, 1, 1, 1, 1, 1,
-0.5770195, -3.128384, -2.884069, 1, 1, 1, 1, 1,
-0.5755861, 1.702479, -0.6237466, 1, 1, 1, 1, 1,
-0.5751897, 1.172522, -1.386359, 1, 1, 1, 1, 1,
-0.5740227, -1.964112, -3.516201, 0, 0, 1, 1, 1,
-0.5708984, -0.1501534, -1.561283, 1, 0, 0, 1, 1,
-0.5694849, -2.368448, -4.219633, 1, 0, 0, 1, 1,
-0.5685892, -1.574588, -3.160655, 1, 0, 0, 1, 1,
-0.5675331, -0.7120941, -1.790063, 1, 0, 0, 1, 1,
-0.5635766, -2.281676, -2.614608, 1, 0, 0, 1, 1,
-0.5539583, -0.2698958, -1.797106, 0, 0, 0, 1, 1,
-0.5520941, -1.748215, -1.8438, 0, 0, 0, 1, 1,
-0.5496357, 0.3535309, -1.578902, 0, 0, 0, 1, 1,
-0.5470209, -0.9711583, -1.996152, 0, 0, 0, 1, 1,
-0.5445039, -1.270065, -1.552619, 0, 0, 0, 1, 1,
-0.5439033, -0.6345693, -3.32161, 0, 0, 0, 1, 1,
-0.542698, 1.079508, 1.277063, 0, 0, 0, 1, 1,
-0.5378545, -1.046755, -3.336407, 1, 1, 1, 1, 1,
-0.5374162, -1.102554, -3.556342, 1, 1, 1, 1, 1,
-0.5351967, 0.09434996, -2.684746, 1, 1, 1, 1, 1,
-0.5343586, -1.182807, -2.029802, 1, 1, 1, 1, 1,
-0.5322993, 1.841318, -0.5730475, 1, 1, 1, 1, 1,
-0.5295533, 0.5578419, -0.4940329, 1, 1, 1, 1, 1,
-0.5293593, 0.9950753, -0.647736, 1, 1, 1, 1, 1,
-0.5283788, 0.05419536, -0.9112313, 1, 1, 1, 1, 1,
-0.526842, 0.6584142, -0.4333389, 1, 1, 1, 1, 1,
-0.5162295, -0.8298422, -1.102046, 1, 1, 1, 1, 1,
-0.5154724, -1.201681, -1.272213, 1, 1, 1, 1, 1,
-0.5152044, -1.23906, -2.287162, 1, 1, 1, 1, 1,
-0.5061321, 0.5664874, -0.4535254, 1, 1, 1, 1, 1,
-0.5025247, 1.131283, -0.4651765, 1, 1, 1, 1, 1,
-0.5012433, 0.01036515, -2.460314, 1, 1, 1, 1, 1,
-0.4984579, -0.5776205, -0.9557462, 0, 0, 1, 1, 1,
-0.4898388, -2.108808, -2.91703, 1, 0, 0, 1, 1,
-0.4860858, -0.6018197, -1.323789, 1, 0, 0, 1, 1,
-0.4831238, -0.5245947, -2.765204, 1, 0, 0, 1, 1,
-0.4825366, 2.508699, -0.3477036, 1, 0, 0, 1, 1,
-0.4790716, 0.8666359, 0.2597188, 1, 0, 0, 1, 1,
-0.4782653, -0.6912178, -1.256792, 0, 0, 0, 1, 1,
-0.4679381, 0.7633355, 0.441403, 0, 0, 0, 1, 1,
-0.4659701, -1.518585, -3.292349, 0, 0, 0, 1, 1,
-0.4648485, 0.6531677, -1.135004, 0, 0, 0, 1, 1,
-0.4615775, -0.3309613, -3.391459, 0, 0, 0, 1, 1,
-0.4571931, -0.04871136, -0.6849977, 0, 0, 0, 1, 1,
-0.453573, -1.391832, -2.465382, 0, 0, 0, 1, 1,
-0.4470852, 1.576085, 0.1781872, 1, 1, 1, 1, 1,
-0.4436761, -0.5668764, -1.780749, 1, 1, 1, 1, 1,
-0.4430471, 0.7215862, -0.7536032, 1, 1, 1, 1, 1,
-0.4413708, 0.8841438, -0.2662449, 1, 1, 1, 1, 1,
-0.4391315, 0.6835247, -1.038026, 1, 1, 1, 1, 1,
-0.4344481, 0.1710981, -1.56383, 1, 1, 1, 1, 1,
-0.431328, 1.252651, -0.51001, 1, 1, 1, 1, 1,
-0.4305472, 0.5611869, -2.532562, 1, 1, 1, 1, 1,
-0.4280617, -0.5945064, -2.624622, 1, 1, 1, 1, 1,
-0.4196128, 0.9255776, -0.5968151, 1, 1, 1, 1, 1,
-0.4179225, 1.064104, 0.4522807, 1, 1, 1, 1, 1,
-0.4141029, -1.009712, -0.540059, 1, 1, 1, 1, 1,
-0.4129352, -0.05771543, -1.777245, 1, 1, 1, 1, 1,
-0.4128374, -0.1517201, -3.610481, 1, 1, 1, 1, 1,
-0.4031287, 0.466754, 0.3052348, 1, 1, 1, 1, 1,
-0.4025309, 0.9078983, -0.5052094, 0, 0, 1, 1, 1,
-0.4022102, -0.8441219, -3.684384, 1, 0, 0, 1, 1,
-0.4021025, 0.6522259, -0.3245122, 1, 0, 0, 1, 1,
-0.3946698, -0.06122984, -0.9499622, 1, 0, 0, 1, 1,
-0.3930993, 2.096953, -0.7856711, 1, 0, 0, 1, 1,
-0.3922017, 0.5059327, 0.05893524, 1, 0, 0, 1, 1,
-0.3911067, -2.277398, -3.361391, 0, 0, 0, 1, 1,
-0.3905706, -0.6759352, -2.063822, 0, 0, 0, 1, 1,
-0.3900352, 0.09256721, -1.009357, 0, 0, 0, 1, 1,
-0.3879599, 0.2362225, -1.205135, 0, 0, 0, 1, 1,
-0.3738416, 0.7228246, -0.5136479, 0, 0, 0, 1, 1,
-0.3648923, -1.237991, -5.486426, 0, 0, 0, 1, 1,
-0.3625336, -1.283839, -3.470459, 0, 0, 0, 1, 1,
-0.361362, -0.8172155, -3.972369, 1, 1, 1, 1, 1,
-0.3601872, -1.336217, -3.698358, 1, 1, 1, 1, 1,
-0.3583121, -1.017039, -1.839249, 1, 1, 1, 1, 1,
-0.35506, 1.562153, -0.04820909, 1, 1, 1, 1, 1,
-0.3454455, -1.574708, -2.0207, 1, 1, 1, 1, 1,
-0.3411278, -0.5176265, -3.953174, 1, 1, 1, 1, 1,
-0.3390438, 0.5416017, -0.5680177, 1, 1, 1, 1, 1,
-0.3364352, 1.40841, -1.299545, 1, 1, 1, 1, 1,
-0.3341861, -0.0849838, -3.430605, 1, 1, 1, 1, 1,
-0.3339198, 0.3901095, -1.203334, 1, 1, 1, 1, 1,
-0.3287225, -1.016002, -1.37852, 1, 1, 1, 1, 1,
-0.3265492, 0.8666749, -0.4420622, 1, 1, 1, 1, 1,
-0.3262198, 1.163849, -0.8692331, 1, 1, 1, 1, 1,
-0.3163128, 1.723148, 1.249594, 1, 1, 1, 1, 1,
-0.3137307, 0.3173445, -1.414105, 1, 1, 1, 1, 1,
-0.3120025, 0.5143787, 0.3618134, 0, 0, 1, 1, 1,
-0.3067425, -0.7509251, -1.157412, 1, 0, 0, 1, 1,
-0.291731, 0.3261949, -2.030671, 1, 0, 0, 1, 1,
-0.2913641, -0.3580097, -3.197858, 1, 0, 0, 1, 1,
-0.291108, -2.130441, -3.32758, 1, 0, 0, 1, 1,
-0.2898251, 0.09106436, -1.567967, 1, 0, 0, 1, 1,
-0.2813802, 0.9871283, 1.550747, 0, 0, 0, 1, 1,
-0.2737742, -0.3560098, -0.4741977, 0, 0, 0, 1, 1,
-0.2733586, -0.1575786, -2.972677, 0, 0, 0, 1, 1,
-0.2659592, 0.9218882, 1.022844, 0, 0, 0, 1, 1,
-0.2619057, -0.1544733, -1.769681, 0, 0, 0, 1, 1,
-0.2577892, -0.4364195, -1.571431, 0, 0, 0, 1, 1,
-0.2518874, 0.06857775, -2.29021, 0, 0, 0, 1, 1,
-0.2504063, -0.8137339, -1.474051, 1, 1, 1, 1, 1,
-0.2460107, 0.1093001, -0.7650934, 1, 1, 1, 1, 1,
-0.2453364, 0.7747738, -0.5341063, 1, 1, 1, 1, 1,
-0.2442632, -2.268496, -3.672815, 1, 1, 1, 1, 1,
-0.2433576, 0.1971735, -0.4494296, 1, 1, 1, 1, 1,
-0.2380115, -0.5070742, -3.47378, 1, 1, 1, 1, 1,
-0.2372928, -0.2940976, -2.712859, 1, 1, 1, 1, 1,
-0.2319806, -0.8083786, -2.141193, 1, 1, 1, 1, 1,
-0.2300912, 0.7980722, -1.056592, 1, 1, 1, 1, 1,
-0.2270287, 0.483725, 0.5088304, 1, 1, 1, 1, 1,
-0.2260842, -1.258512, -1.873984, 1, 1, 1, 1, 1,
-0.2245084, -1.455214, -2.909191, 1, 1, 1, 1, 1,
-0.222446, 0.8167574, 0.2806594, 1, 1, 1, 1, 1,
-0.2194823, 0.7865314, -0.1435713, 1, 1, 1, 1, 1,
-0.2161786, -1.786153, -3.757698, 1, 1, 1, 1, 1,
-0.2161769, 1.199369, -2.013551, 0, 0, 1, 1, 1,
-0.2155981, -0.8905005, -3.567493, 1, 0, 0, 1, 1,
-0.2110146, 0.3734067, -0.3682403, 1, 0, 0, 1, 1,
-0.2107712, -1.368413, -3.329245, 1, 0, 0, 1, 1,
-0.2096334, -0.7427717, -3.919711, 1, 0, 0, 1, 1,
-0.2088176, -0.6444017, -4.354889, 1, 0, 0, 1, 1,
-0.2074391, -0.5071402, -1.081645, 0, 0, 0, 1, 1,
-0.1987703, -0.09332384, -3.344567, 0, 0, 0, 1, 1,
-0.1946848, -3.216414, -2.423277, 0, 0, 0, 1, 1,
-0.189721, 0.3637001, -0.6958942, 0, 0, 0, 1, 1,
-0.185248, -1.167944, -5.248426, 0, 0, 0, 1, 1,
-0.1851329, 0.005295114, -2.660566, 0, 0, 0, 1, 1,
-0.1834606, -0.4054138, -2.318199, 0, 0, 0, 1, 1,
-0.1791968, -1.395573, -3.276077, 1, 1, 1, 1, 1,
-0.1790951, 0.6565611, 0.3819702, 1, 1, 1, 1, 1,
-0.1770485, -1.20343, -2.360252, 1, 1, 1, 1, 1,
-0.1711973, -0.06402262, -0.0397265, 1, 1, 1, 1, 1,
-0.171151, 0.100255, -0.393739, 1, 1, 1, 1, 1,
-0.1668994, -0.0794674, -2.978663, 1, 1, 1, 1, 1,
-0.1653124, 0.2876496, -0.9735816, 1, 1, 1, 1, 1,
-0.159993, -0.5920693, -3.395668, 1, 1, 1, 1, 1,
-0.1585446, 0.3831289, -0.2076093, 1, 1, 1, 1, 1,
-0.1578249, -0.9352393, -3.300283, 1, 1, 1, 1, 1,
-0.1530386, 0.8578582, 0.08202904, 1, 1, 1, 1, 1,
-0.1512289, -1.249758, -6.716838, 1, 1, 1, 1, 1,
-0.1482119, 2.58034, 1.980727, 1, 1, 1, 1, 1,
-0.1405164, 0.4521241, -0.7001349, 1, 1, 1, 1, 1,
-0.1357477, -1.239558, -3.073096, 1, 1, 1, 1, 1,
-0.1322895, -0.6009306, -1.980425, 0, 0, 1, 1, 1,
-0.1301584, -1.172321, -3.100662, 1, 0, 0, 1, 1,
-0.1253709, -1.118819, -3.794677, 1, 0, 0, 1, 1,
-0.1208455, 0.9733697, -1.164179, 1, 0, 0, 1, 1,
-0.1178394, 0.2004792, 0.4847477, 1, 0, 0, 1, 1,
-0.1175016, 0.8586413, 0.1267941, 1, 0, 0, 1, 1,
-0.1104613, 1.147332, -0.3627913, 0, 0, 0, 1, 1,
-0.1068172, -0.6653423, -3.644894, 0, 0, 0, 1, 1,
-0.1053174, 0.1920982, 0.5409951, 0, 0, 0, 1, 1,
-0.1046055, 0.965113, -1.801522, 0, 0, 0, 1, 1,
-0.1033473, 0.6834568, -0.1641671, 0, 0, 0, 1, 1,
-0.1018844, 0.2346325, -0.06351689, 0, 0, 0, 1, 1,
-0.1014439, 0.7137822, -0.4170118, 0, 0, 0, 1, 1,
-0.09270797, -1.297985, -4.403595, 1, 1, 1, 1, 1,
-0.08862464, 1.550582, -0.1644213, 1, 1, 1, 1, 1,
-0.07955957, 0.8949488, 1.119294, 1, 1, 1, 1, 1,
-0.07628095, 1.136585, -1.392147, 1, 1, 1, 1, 1,
-0.07409082, 1.582462, -0.3952835, 1, 1, 1, 1, 1,
-0.07275819, -0.5199624, -1.142626, 1, 1, 1, 1, 1,
-0.0655745, 1.079774, 0.4805561, 1, 1, 1, 1, 1,
-0.06294956, 0.4994889, 1.424456, 1, 1, 1, 1, 1,
-0.05939697, 0.7042301, 0.203723, 1, 1, 1, 1, 1,
-0.05482666, -0.7016091, -1.531098, 1, 1, 1, 1, 1,
-0.05404856, -0.3307836, -3.303189, 1, 1, 1, 1, 1,
-0.04927384, -0.01223727, -1.473863, 1, 1, 1, 1, 1,
-0.04829984, 0.1486998, -1.497622, 1, 1, 1, 1, 1,
-0.04560265, 0.7082713, -0.9617223, 1, 1, 1, 1, 1,
-0.0429284, 0.9014813, 2.026635, 1, 1, 1, 1, 1,
-0.04185353, -0.09926601, -2.819945, 0, 0, 1, 1, 1,
-0.03325357, -0.7271922, -3.359408, 1, 0, 0, 1, 1,
-0.03115672, 0.2721635, -1.462063, 1, 0, 0, 1, 1,
-0.03092689, -0.8816466, -3.079108, 1, 0, 0, 1, 1,
-0.03050336, 1.08049, -0.3335469, 1, 0, 0, 1, 1,
-0.02861833, 0.1539286, 0.135816, 1, 0, 0, 1, 1,
-0.02800594, 0.6352706, 0.7699491, 0, 0, 0, 1, 1,
-0.02697998, -0.3234278, -2.736315, 0, 0, 0, 1, 1,
-0.02592132, -0.4008184, -3.307499, 0, 0, 0, 1, 1,
-0.02577491, 0.09137444, -0.4890512, 0, 0, 0, 1, 1,
-0.02518647, 1.128876, -0.565247, 0, 0, 0, 1, 1,
-0.02509936, 0.4071995, 0.6615646, 0, 0, 0, 1, 1,
-0.02451556, -0.7845445, -3.179688, 0, 0, 0, 1, 1,
-0.02252408, -2.226299, -3.99299, 1, 1, 1, 1, 1,
-0.02139274, -0.5250648, -3.871983, 1, 1, 1, 1, 1,
-0.01569727, 0.93924, -0.7150325, 1, 1, 1, 1, 1,
-0.01361263, 1.294097, -0.03497554, 1, 1, 1, 1, 1,
-0.01019252, -1.364335, -2.748784, 1, 1, 1, 1, 1,
-0.007582373, 0.1691854, -0.2325579, 1, 1, 1, 1, 1,
0.0009348085, 0.8586589, 1.223827, 1, 1, 1, 1, 1,
0.001454457, 0.1974027, 0.8612849, 1, 1, 1, 1, 1,
0.01061416, 1.695984, 0.1405468, 1, 1, 1, 1, 1,
0.01124728, -0.9892752, 1.275068, 1, 1, 1, 1, 1,
0.01701327, 0.5569896, 0.7092096, 1, 1, 1, 1, 1,
0.01907093, -1.154916, 3.40852, 1, 1, 1, 1, 1,
0.01963217, 2.544465, -0.7991857, 1, 1, 1, 1, 1,
0.02725673, -0.1207824, 2.489104, 1, 1, 1, 1, 1,
0.03745383, 0.9949294, 0.1140982, 1, 1, 1, 1, 1,
0.03825718, 0.7107046, 0.3124757, 0, 0, 1, 1, 1,
0.04103921, -0.2742243, 3.464358, 1, 0, 0, 1, 1,
0.04264404, -0.2427965, 2.653474, 1, 0, 0, 1, 1,
0.04432114, -0.1932149, 3.152771, 1, 0, 0, 1, 1,
0.05370656, -0.3854571, 4.26021, 1, 0, 0, 1, 1,
0.05717722, -0.1932189, 4.098124, 1, 0, 0, 1, 1,
0.05821252, -1.906189, 3.338587, 0, 0, 0, 1, 1,
0.06021623, -0.7022271, 2.522189, 0, 0, 0, 1, 1,
0.06418808, -0.2915274, 2.875089, 0, 0, 0, 1, 1,
0.06578309, -0.8400173, 1.801618, 0, 0, 0, 1, 1,
0.06596516, 1.300754, -0.1183938, 0, 0, 0, 1, 1,
0.06801576, 0.750616, -0.8744757, 0, 0, 0, 1, 1,
0.06877942, -0.7087319, 3.535758, 0, 0, 0, 1, 1,
0.06912341, -0.7489078, 2.794905, 1, 1, 1, 1, 1,
0.07147513, -1.059558, 3.159729, 1, 1, 1, 1, 1,
0.07784414, -0.8814149, 3.666283, 1, 1, 1, 1, 1,
0.08295455, 0.377352, 1.787286, 1, 1, 1, 1, 1,
0.08412951, -2.581244, 3.57169, 1, 1, 1, 1, 1,
0.09141488, 1.718846, -1.576061, 1, 1, 1, 1, 1,
0.09401821, -0.1088127, 3.647306, 1, 1, 1, 1, 1,
0.09518017, -0.2261605, 2.748247, 1, 1, 1, 1, 1,
0.09931637, -0.3014815, 1.401171, 1, 1, 1, 1, 1,
0.1093267, 0.1286272, -0.9021345, 1, 1, 1, 1, 1,
0.1117862, -0.959105, 5.826773, 1, 1, 1, 1, 1,
0.1162949, 0.7730126, -1.740246, 1, 1, 1, 1, 1,
0.1175594, -0.8595905, 2.097299, 1, 1, 1, 1, 1,
0.1240437, 0.2172456, 1.788807, 1, 1, 1, 1, 1,
0.128411, 0.9196729, -1.627054, 1, 1, 1, 1, 1,
0.133492, 0.740026, 0.6439598, 0, 0, 1, 1, 1,
0.1339874, -1.035661, 2.631503, 1, 0, 0, 1, 1,
0.1370236, -0.009965993, 2.12927, 1, 0, 0, 1, 1,
0.139458, 0.7968869, -1.657981, 1, 0, 0, 1, 1,
0.1396561, 2.857786, -1.454754, 1, 0, 0, 1, 1,
0.143123, 0.8299187, 1.134501, 1, 0, 0, 1, 1,
0.1444467, 0.3097462, -0.2603652, 0, 0, 0, 1, 1,
0.1480271, -0.5802765, 3.043003, 0, 0, 0, 1, 1,
0.1489744, 1.508994, -1.501381, 0, 0, 0, 1, 1,
0.1502068, -0.2580166, 2.273424, 0, 0, 0, 1, 1,
0.1549455, -0.4343669, 0.83747, 0, 0, 0, 1, 1,
0.1624366, -1.419423, 3.690883, 0, 0, 0, 1, 1,
0.1670371, 0.6104959, 1.417118, 0, 0, 0, 1, 1,
0.1689788, 0.1016939, 0.4908662, 1, 1, 1, 1, 1,
0.1747561, -0.1663002, 2.752595, 1, 1, 1, 1, 1,
0.1780462, 0.5337592, 2.027977, 1, 1, 1, 1, 1,
0.1793972, 0.5701826, 1.300933, 1, 1, 1, 1, 1,
0.1805406, 1.253945, -0.6191677, 1, 1, 1, 1, 1,
0.1810594, 0.3626536, 0.4899728, 1, 1, 1, 1, 1,
0.1844348, -0.5258246, 1.417314, 1, 1, 1, 1, 1,
0.1845247, -0.4868468, 2.971307, 1, 1, 1, 1, 1,
0.1854369, -1.203602, 4.193974, 1, 1, 1, 1, 1,
0.1878242, -0.6787638, 3.391535, 1, 1, 1, 1, 1,
0.1908472, -0.1393752, 2.548024, 1, 1, 1, 1, 1,
0.1987918, -0.6575508, 2.352709, 1, 1, 1, 1, 1,
0.2011661, 1.242734, 0.438954, 1, 1, 1, 1, 1,
0.2032453, 0.5672267, 0.5780365, 1, 1, 1, 1, 1,
0.2091235, -2.053452, 2.023428, 1, 1, 1, 1, 1,
0.215504, -0.6499249, 3.140529, 0, 0, 1, 1, 1,
0.2170551, -0.4377102, 1.63422, 1, 0, 0, 1, 1,
0.2204984, 0.1291281, 2.47372, 1, 0, 0, 1, 1,
0.2206044, 0.9203044, 0.1498519, 1, 0, 0, 1, 1,
0.2233539, 0.03811777, 1.032391, 1, 0, 0, 1, 1,
0.2278898, -2.199262, 3.680832, 1, 0, 0, 1, 1,
0.2313056, 1.393183, -0.1542303, 0, 0, 0, 1, 1,
0.2322586, 1.616938, -0.6764398, 0, 0, 0, 1, 1,
0.2349334, 1.127785, 0.8976302, 0, 0, 0, 1, 1,
0.2413672, -0.009472352, 3.667635, 0, 0, 0, 1, 1,
0.2434044, -0.301176, 1.95353, 0, 0, 0, 1, 1,
0.2453926, 0.1116164, 2.483281, 0, 0, 0, 1, 1,
0.2490339, -1.340701, 2.564156, 0, 0, 0, 1, 1,
0.249382, 1.354102, -0.4498939, 1, 1, 1, 1, 1,
0.2498615, 1.106128, 0.04120702, 1, 1, 1, 1, 1,
0.2512457, -2.192955, 2.090039, 1, 1, 1, 1, 1,
0.2519198, -0.4220696, 1.285615, 1, 1, 1, 1, 1,
0.2644946, 1.133999, -1.010607, 1, 1, 1, 1, 1,
0.2649367, 0.004910702, 2.963747, 1, 1, 1, 1, 1,
0.2676432, -0.3682064, 3.369387, 1, 1, 1, 1, 1,
0.2706758, 0.2365072, 1.214261, 1, 1, 1, 1, 1,
0.2706972, -0.3054403, 2.174292, 1, 1, 1, 1, 1,
0.2736087, 0.6142429, 1.217162, 1, 1, 1, 1, 1,
0.2755435, -0.8650644, 3.54951, 1, 1, 1, 1, 1,
0.2823651, 1.786366, 1.091132, 1, 1, 1, 1, 1,
0.2825366, 0.6642215, 0.3771924, 1, 1, 1, 1, 1,
0.2846891, -1.215183, 2.658569, 1, 1, 1, 1, 1,
0.2858331, -1.128764, 3.71986, 1, 1, 1, 1, 1,
0.2867953, -0.1054021, 1.143854, 0, 0, 1, 1, 1,
0.287044, -0.3967609, 3.563243, 1, 0, 0, 1, 1,
0.3010344, 1.260765, -0.6084639, 1, 0, 0, 1, 1,
0.3011219, -0.3004826, 2.632496, 1, 0, 0, 1, 1,
0.3034535, 0.9276415, 0.03565193, 1, 0, 0, 1, 1,
0.3049792, 0.5966665, -0.3354179, 1, 0, 0, 1, 1,
0.3053653, -1.527871, 3.209279, 0, 0, 0, 1, 1,
0.3061729, -1.052512, 3.070897, 0, 0, 0, 1, 1,
0.3076385, -0.9581662, 5.179611, 0, 0, 0, 1, 1,
0.309123, 0.5091311, 1.282725, 0, 0, 0, 1, 1,
0.3138072, -1.602475, 3.061876, 0, 0, 0, 1, 1,
0.3143807, 0.8618494, 1.325836, 0, 0, 0, 1, 1,
0.3157564, 1.144341, 0.3017009, 0, 0, 0, 1, 1,
0.3159871, 0.3197991, -0.07261885, 1, 1, 1, 1, 1,
0.316967, 1.946578, -0.9614315, 1, 1, 1, 1, 1,
0.3240409, -0.6769145, -0.118114, 1, 1, 1, 1, 1,
0.3240949, -0.01225998, 2.485315, 1, 1, 1, 1, 1,
0.329909, 2.197348, -1.305643, 1, 1, 1, 1, 1,
0.3338716, -0.4628159, 2.162651, 1, 1, 1, 1, 1,
0.3352756, 0.3017773, 1.67073, 1, 1, 1, 1, 1,
0.3354751, 1.284112, 0.3735462, 1, 1, 1, 1, 1,
0.3380766, -0.530201, 3.227861, 1, 1, 1, 1, 1,
0.3407336, -0.3126974, 2.202583, 1, 1, 1, 1, 1,
0.3485429, -0.1730514, 1.231947, 1, 1, 1, 1, 1,
0.3512865, 0.3637613, 1.394172, 1, 1, 1, 1, 1,
0.3573601, 0.6695175, 0.8005086, 1, 1, 1, 1, 1,
0.3607786, 0.4341053, 0.8418757, 1, 1, 1, 1, 1,
0.3610305, 0.6223717, -0.3921015, 1, 1, 1, 1, 1,
0.3622895, -0.5101022, 0.9745863, 0, 0, 1, 1, 1,
0.3693139, 0.4346298, 0.08630392, 1, 0, 0, 1, 1,
0.3714837, -3.915149e-05, 1.185156, 1, 0, 0, 1, 1,
0.3718555, -2.110368, 2.745818, 1, 0, 0, 1, 1,
0.374613, -0.2778403, 2.483518, 1, 0, 0, 1, 1,
0.3777805, 0.1348642, 1.493735, 1, 0, 0, 1, 1,
0.3840923, 1.541881, 0.3552545, 0, 0, 0, 1, 1,
0.3881378, 0.7710784, 0.9139657, 0, 0, 0, 1, 1,
0.3900408, 1.082538, -0.6452731, 0, 0, 0, 1, 1,
0.3911975, 0.06535695, 1.867063, 0, 0, 0, 1, 1,
0.3927082, 0.3476662, -0.8357518, 0, 0, 0, 1, 1,
0.3944909, 1.0276, 1.059201, 0, 0, 0, 1, 1,
0.3955992, 0.3108557, -0.3591384, 0, 0, 0, 1, 1,
0.3962215, 1.813917, 1.734235, 1, 1, 1, 1, 1,
0.3966166, 0.258183, 2.193439, 1, 1, 1, 1, 1,
0.3984533, 0.3399915, 1.369357, 1, 1, 1, 1, 1,
0.4024967, -0.7810382, 3.071513, 1, 1, 1, 1, 1,
0.4025859, 0.9976886, -1.313901, 1, 1, 1, 1, 1,
0.4046722, -0.2036634, 1.401185, 1, 1, 1, 1, 1,
0.4095503, -0.2831727, 2.957627, 1, 1, 1, 1, 1,
0.4122433, 0.08923798, 2.71761, 1, 1, 1, 1, 1,
0.4123427, 2.556065, 0.255916, 1, 1, 1, 1, 1,
0.412616, 1.166902, -0.04453528, 1, 1, 1, 1, 1,
0.4128065, 0.3083313, 1.343008, 1, 1, 1, 1, 1,
0.4134724, -0.06383736, 1.671344, 1, 1, 1, 1, 1,
0.4143683, 0.07803345, 0.8194634, 1, 1, 1, 1, 1,
0.416676, -0.2151431, 2.530119, 1, 1, 1, 1, 1,
0.4184618, 0.6898624, 0.2139085, 1, 1, 1, 1, 1,
0.4202467, 0.7364802, -0.167328, 0, 0, 1, 1, 1,
0.420947, 0.9987435, 0.2198351, 1, 0, 0, 1, 1,
0.4232967, 0.64953, 0.6665304, 1, 0, 0, 1, 1,
0.4233179, 2.311203, -1.03529, 1, 0, 0, 1, 1,
0.4314733, 0.8069878, -0.5975184, 1, 0, 0, 1, 1,
0.4322949, 0.3456362, 0.5358567, 1, 0, 0, 1, 1,
0.4396319, -0.3311105, 1.459373, 0, 0, 0, 1, 1,
0.440508, 2.07612, 1.998597, 0, 0, 0, 1, 1,
0.4441362, -0.8996834, 2.628812, 0, 0, 0, 1, 1,
0.4455162, 0.06030831, 2.114328, 0, 0, 0, 1, 1,
0.4488375, -0.6710013, 1.912695, 0, 0, 0, 1, 1,
0.4521738, -0.1344274, 1.299695, 0, 0, 0, 1, 1,
0.4523317, 1.108749, 0.3340739, 0, 0, 0, 1, 1,
0.4526417, 0.1335112, 2.026505, 1, 1, 1, 1, 1,
0.4535306, -2.363006, 2.711213, 1, 1, 1, 1, 1,
0.4578983, -1.196428, 2.950722, 1, 1, 1, 1, 1,
0.4584204, -0.6427906, 2.690101, 1, 1, 1, 1, 1,
0.4591529, -0.1510642, 2.799593, 1, 1, 1, 1, 1,
0.4610175, -0.9550605, 1.157974, 1, 1, 1, 1, 1,
0.4616075, 0.6732549, 1.142893, 1, 1, 1, 1, 1,
0.4635295, -0.06956441, 0.09313372, 1, 1, 1, 1, 1,
0.4639469, -1.601392, 3.002332, 1, 1, 1, 1, 1,
0.4646291, -0.4327331, 1.150896, 1, 1, 1, 1, 1,
0.4648574, 1.052349, 1.047558, 1, 1, 1, 1, 1,
0.4731386, 0.2930487, 1.645315, 1, 1, 1, 1, 1,
0.4800083, 1.041009, 0.3759959, 1, 1, 1, 1, 1,
0.4812903, -1.222286, 3.22742, 1, 1, 1, 1, 1,
0.4995547, 0.8675405, 0.3127891, 1, 1, 1, 1, 1,
0.4996157, 0.6227275, 1.899289, 0, 0, 1, 1, 1,
0.5029324, -0.7248086, 2.182299, 1, 0, 0, 1, 1,
0.5042235, -0.5856097, 2.629679, 1, 0, 0, 1, 1,
0.5060006, 0.1636309, 1.060576, 1, 0, 0, 1, 1,
0.5082464, 1.354033, 0.9798655, 1, 0, 0, 1, 1,
0.5094354, 0.4171379, 1.057226, 1, 0, 0, 1, 1,
0.5108733, 0.7824944, 1.109277, 0, 0, 0, 1, 1,
0.5109358, 0.3678313, 0.418929, 0, 0, 0, 1, 1,
0.5172718, -1.421402, 2.093089, 0, 0, 0, 1, 1,
0.5199476, 0.5836668, 1.051501, 0, 0, 0, 1, 1,
0.5215623, -0.9574831, 4.121722, 0, 0, 0, 1, 1,
0.5225825, 0.2569795, 1.564358, 0, 0, 0, 1, 1,
0.5249931, 0.1695049, 2.494562, 0, 0, 0, 1, 1,
0.5251266, 1.103017, 1.410004, 1, 1, 1, 1, 1,
0.5281909, 1.303627, 1.020602, 1, 1, 1, 1, 1,
0.5282091, 0.5361276, -1.397631, 1, 1, 1, 1, 1,
0.5396707, 0.4450803, 1.482436, 1, 1, 1, 1, 1,
0.5410765, -0.2668009, 2.560072, 1, 1, 1, 1, 1,
0.5442615, -1.875024, 0.8058608, 1, 1, 1, 1, 1,
0.5454962, 0.5662135, 0.3118405, 1, 1, 1, 1, 1,
0.5464686, 0.3869964, 0.6235904, 1, 1, 1, 1, 1,
0.5469649, -0.1543806, 2.286716, 1, 1, 1, 1, 1,
0.5531069, -1.170879, 1.04908, 1, 1, 1, 1, 1,
0.5581719, -0.6633846, 1.020006, 1, 1, 1, 1, 1,
0.5602146, -0.8334617, 3.551931, 1, 1, 1, 1, 1,
0.5611799, 0.3199554, 1.073638, 1, 1, 1, 1, 1,
0.5614857, 0.4977125, 1.788793, 1, 1, 1, 1, 1,
0.5618563, 0.8405572, -1.372851, 1, 1, 1, 1, 1,
0.5623446, -0.8453173, 2.720715, 0, 0, 1, 1, 1,
0.5657908, 1.503371, -0.02862884, 1, 0, 0, 1, 1,
0.5663961, 1.078738, 0.3332944, 1, 0, 0, 1, 1,
0.5678089, -0.1773708, 2.112278, 1, 0, 0, 1, 1,
0.5678506, 1.546518, 1.944857, 1, 0, 0, 1, 1,
0.5693663, -1.447733, 2.582422, 1, 0, 0, 1, 1,
0.5719162, 1.182139, 2.1348, 0, 0, 0, 1, 1,
0.5721127, 0.1173001, 2.402176, 0, 0, 0, 1, 1,
0.5725001, 1.326121, 0.4945797, 0, 0, 0, 1, 1,
0.5738962, 1.202899, 0.3462126, 0, 0, 0, 1, 1,
0.5790837, 1.423887, 0.8413748, 0, 0, 0, 1, 1,
0.5803031, 0.7104251, 1.394692, 0, 0, 0, 1, 1,
0.5807047, -0.7063721, 0.5312008, 0, 0, 0, 1, 1,
0.5845501, 0.1557501, 2.074415, 1, 1, 1, 1, 1,
0.5853699, 0.4508916, 2.384901, 1, 1, 1, 1, 1,
0.5879896, -0.388947, 2.684402, 1, 1, 1, 1, 1,
0.5899179, -1.065818, 2.534257, 1, 1, 1, 1, 1,
0.5906993, -0.230083, 2.150551, 1, 1, 1, 1, 1,
0.5934053, 0.2573094, 1.045521, 1, 1, 1, 1, 1,
0.599347, 1.244483, -1.881424, 1, 1, 1, 1, 1,
0.6001658, 0.5052707, 1.93859, 1, 1, 1, 1, 1,
0.6011551, -0.5156283, 3.715547, 1, 1, 1, 1, 1,
0.6015587, 0.09396496, 0.3780828, 1, 1, 1, 1, 1,
0.6053144, -0.1899339, 2.787772, 1, 1, 1, 1, 1,
0.6116182, -1.019493, 1.759295, 1, 1, 1, 1, 1,
0.6124578, -0.07916414, 1.22782, 1, 1, 1, 1, 1,
0.6145851, 0.2839815, 1.509214, 1, 1, 1, 1, 1,
0.6159069, -1.07165, 0.9543186, 1, 1, 1, 1, 1,
0.616199, 0.5652507, 1.728351, 0, 0, 1, 1, 1,
0.6189677, 0.5312366, 0.8515602, 1, 0, 0, 1, 1,
0.6223498, 2.047182, -0.9419497, 1, 0, 0, 1, 1,
0.6276806, -2.131954, 3.166568, 1, 0, 0, 1, 1,
0.6278177, 0.04968144, 0.9814301, 1, 0, 0, 1, 1,
0.6307133, 0.5037956, 2.006532, 1, 0, 0, 1, 1,
0.6343905, 0.000132031, 0.2547761, 0, 0, 0, 1, 1,
0.641472, 0.01897585, 3.732105, 0, 0, 0, 1, 1,
0.6421507, -0.356771, 2.561594, 0, 0, 0, 1, 1,
0.6423521, -0.7591588, 2.618609, 0, 0, 0, 1, 1,
0.644852, -1.131816, 1.691716, 0, 0, 0, 1, 1,
0.6449731, 1.208505, 2.259292, 0, 0, 0, 1, 1,
0.648439, -0.6983854, 0.695322, 0, 0, 0, 1, 1,
0.6529974, -0.3417033, 1.353785, 1, 1, 1, 1, 1,
0.6531726, -1.366937, 3.600931, 1, 1, 1, 1, 1,
0.6542459, 1.416614, 2.297341, 1, 1, 1, 1, 1,
0.6586916, 0.4373052, 0.7111306, 1, 1, 1, 1, 1,
0.6597921, 0.143627, 1.048229, 1, 1, 1, 1, 1,
0.6612654, -1.095457, 2.32642, 1, 1, 1, 1, 1,
0.6628585, 0.7863643, 2.453144, 1, 1, 1, 1, 1,
0.6692882, 0.3839246, 2.584216, 1, 1, 1, 1, 1,
0.6803246, -1.007842, 3.092166, 1, 1, 1, 1, 1,
0.6807538, 0.8604096, 0.9772777, 1, 1, 1, 1, 1,
0.6824144, -0.2211422, 0.4795787, 1, 1, 1, 1, 1,
0.6841866, -1.096022, 1.746986, 1, 1, 1, 1, 1,
0.6855829, -0.2161538, 0.9690157, 1, 1, 1, 1, 1,
0.6888565, -0.4041911, 3.096004, 1, 1, 1, 1, 1,
0.6892609, 1.170975, -1.786792, 1, 1, 1, 1, 1,
0.6918282, -0.05770219, 3.378876, 0, 0, 1, 1, 1,
0.6946453, -0.0781396, 2.16739, 1, 0, 0, 1, 1,
0.695946, 0.766499, 0.8971102, 1, 0, 0, 1, 1,
0.697699, 1.512003, 0.837693, 1, 0, 0, 1, 1,
0.7030504, 0.9187201, 1.738226, 1, 0, 0, 1, 1,
0.7040813, -0.9858463, 3.191945, 1, 0, 0, 1, 1,
0.7079171, 0.7282082, 1.799337, 0, 0, 0, 1, 1,
0.7106189, -0.9872631, 2.118656, 0, 0, 0, 1, 1,
0.711587, -0.794633, 3.235078, 0, 0, 0, 1, 1,
0.711721, -0.537139, 1.283174, 0, 0, 0, 1, 1,
0.720814, 0.4527844, 2.819411, 0, 0, 0, 1, 1,
0.722894, 0.3569531, 1.604815, 0, 0, 0, 1, 1,
0.7246609, -2.208364, 1.804096, 0, 0, 0, 1, 1,
0.7251788, 0.5439669, 3.051638, 1, 1, 1, 1, 1,
0.7254151, -0.04850212, 2.200233, 1, 1, 1, 1, 1,
0.7296258, 0.9123142, -1.031351, 1, 1, 1, 1, 1,
0.7313735, -0.02804492, 1.906296, 1, 1, 1, 1, 1,
0.7317713, -1.642653, 2.709884, 1, 1, 1, 1, 1,
0.7334417, -0.1657765, 1.012144, 1, 1, 1, 1, 1,
0.735584, -0.8924253, 2.528168, 1, 1, 1, 1, 1,
0.7356979, -2.225086, 3.233533, 1, 1, 1, 1, 1,
0.7400688, -0.007759745, 1.038566, 1, 1, 1, 1, 1,
0.7405164, -0.2718021, 3.308674, 1, 1, 1, 1, 1,
0.7435362, -0.3648148, 2.07657, 1, 1, 1, 1, 1,
0.7448832, 0.3879861, 1.147707, 1, 1, 1, 1, 1,
0.7466964, -2.156298, 3.625245, 1, 1, 1, 1, 1,
0.7474924, 0.5673373, 0.7348453, 1, 1, 1, 1, 1,
0.7497277, 0.2305287, 1.291336, 1, 1, 1, 1, 1,
0.7509416, -0.3292028, 1.300285, 0, 0, 1, 1, 1,
0.7531438, -0.0646677, 3.278922, 1, 0, 0, 1, 1,
0.7542729, -1.844507, 2.680679, 1, 0, 0, 1, 1,
0.7575231, -1.333147, 4.352701, 1, 0, 0, 1, 1,
0.757724, -0.3857398, 2.235069, 1, 0, 0, 1, 1,
0.7596508, 0.1125723, 3.818335, 1, 0, 0, 1, 1,
0.7651547, -0.4693936, 1.216594, 0, 0, 0, 1, 1,
0.7666925, -0.9674056, 1.494034, 0, 0, 0, 1, 1,
0.7696297, -1.688675, 1.747586, 0, 0, 0, 1, 1,
0.7781149, -2.139471, 3.257521, 0, 0, 0, 1, 1,
0.7801192, 1.131867, -0.1391936, 0, 0, 0, 1, 1,
0.7878436, 0.9080382, -0.3577654, 0, 0, 0, 1, 1,
0.7922099, 0.1753506, 1.226666, 0, 0, 0, 1, 1,
0.7964975, -0.7893459, 2.426181, 1, 1, 1, 1, 1,
0.7971267, -1.586401, 1.97461, 1, 1, 1, 1, 1,
0.7986089, 0.3094599, 1.838425, 1, 1, 1, 1, 1,
0.8090928, 2.348058, 0.09818528, 1, 1, 1, 1, 1,
0.8200145, -0.1740274, 0.7568752, 1, 1, 1, 1, 1,
0.8202235, -2.120097, 3.719518, 1, 1, 1, 1, 1,
0.8219323, -1.095099, 2.579529, 1, 1, 1, 1, 1,
0.8233426, -0.3083348, 3.141847, 1, 1, 1, 1, 1,
0.830533, -0.1414595, 1.42813, 1, 1, 1, 1, 1,
0.8347825, -0.3725029, 2.521165, 1, 1, 1, 1, 1,
0.8363075, -0.1658212, 2.634964, 1, 1, 1, 1, 1,
0.8373392, 1.6541, 0.7397448, 1, 1, 1, 1, 1,
0.8381453, 0.2531302, 2.860091, 1, 1, 1, 1, 1,
0.8393396, 0.5366996, 3.01323, 1, 1, 1, 1, 1,
0.840367, -0.09537144, 1.511859, 1, 1, 1, 1, 1,
0.8406786, 1.410571, 0.1752357, 0, 0, 1, 1, 1,
0.8431786, 2.541745, 0.5389581, 1, 0, 0, 1, 1,
0.8439683, -1.090127, 3.589401, 1, 0, 0, 1, 1,
0.8480392, -0.3597216, 2.135381, 1, 0, 0, 1, 1,
0.8487239, -0.9119886, 0.07372336, 1, 0, 0, 1, 1,
0.8495672, 1.970849, 1.453725, 1, 0, 0, 1, 1,
0.8544142, -0.1255227, 4.34393, 0, 0, 0, 1, 1,
0.8593364, -0.5408065, -0.106971, 0, 0, 0, 1, 1,
0.8604379, -1.386007, 2.54116, 0, 0, 0, 1, 1,
0.8652923, 1.080778, 0.2664733, 0, 0, 0, 1, 1,
0.8761034, -1.12882, 2.863879, 0, 0, 0, 1, 1,
0.8764185, 0.4007088, 3.002574, 0, 0, 0, 1, 1,
0.8897229, 0.4532812, 0.2072653, 0, 0, 0, 1, 1,
0.892512, -1.115278, 1.829994, 1, 1, 1, 1, 1,
0.8937356, -1.422677, 3.025398, 1, 1, 1, 1, 1,
0.8987764, 2.437468, 1.054671, 1, 1, 1, 1, 1,
0.9050092, -0.3691622, 1.417885, 1, 1, 1, 1, 1,
0.9067372, 2.388214, -0.5318022, 1, 1, 1, 1, 1,
0.9076313, -0.6758206, 1.560267, 1, 1, 1, 1, 1,
0.9105695, 2.739506, 0.8344999, 1, 1, 1, 1, 1,
0.9191268, 1.416522, 0.9262898, 1, 1, 1, 1, 1,
0.9209331, -0.4970383, 1.599927, 1, 1, 1, 1, 1,
0.9254376, 0.745977, 2.177596, 1, 1, 1, 1, 1,
0.9367289, -3.63755, 3.219194, 1, 1, 1, 1, 1,
0.9367346, 0.6486955, 2.265726, 1, 1, 1, 1, 1,
0.9373478, 1.686387, -1.812673, 1, 1, 1, 1, 1,
0.9386709, 2.092981, 1.064528, 1, 1, 1, 1, 1,
0.9407347, 0.5166154, 1.079447, 1, 1, 1, 1, 1,
0.9411855, -0.1769155, 2.467076, 0, 0, 1, 1, 1,
0.9489433, -1.422713, 2.122142, 1, 0, 0, 1, 1,
0.9506375, -0.2556556, 1.798317, 1, 0, 0, 1, 1,
0.9531174, -0.9287865, 1.644568, 1, 0, 0, 1, 1,
0.9552184, 1.52952, 0.1569109, 1, 0, 0, 1, 1,
0.962879, 0.5900817, 1.677166, 1, 0, 0, 1, 1,
0.9772436, -0.4543654, 1.066487, 0, 0, 0, 1, 1,
0.9869273, -0.4895667, 2.572769, 0, 0, 0, 1, 1,
0.9882774, -0.4092713, 3.596817, 0, 0, 0, 1, 1,
0.9910427, 1.688928, -0.1048431, 0, 0, 0, 1, 1,
0.9929113, 0.2913463, 1.262897, 0, 0, 0, 1, 1,
0.9951834, -0.9950725, 2.019432, 0, 0, 0, 1, 1,
1.000959, -0.4269481, 2.135232, 0, 0, 0, 1, 1,
1.002291, -0.7667164, 1.154168, 1, 1, 1, 1, 1,
1.003793, 0.0665678, 0.4130575, 1, 1, 1, 1, 1,
1.008867, 1.404105, -0.05007306, 1, 1, 1, 1, 1,
1.009668, -0.2455124, 0.0860718, 1, 1, 1, 1, 1,
1.016425, -0.4697003, 2.636137, 1, 1, 1, 1, 1,
1.022687, 0.0192889, 1.671185, 1, 1, 1, 1, 1,
1.028272, 1.476459, 2.596643, 1, 1, 1, 1, 1,
1.031216, -1.244099, 1.473459, 1, 1, 1, 1, 1,
1.039084, -1.589929, 1.557407, 1, 1, 1, 1, 1,
1.041326, -1.774048, 3.884429, 1, 1, 1, 1, 1,
1.045955, 0.8365261, 1.615185, 1, 1, 1, 1, 1,
1.057512, -1.034323, 1.162774, 1, 1, 1, 1, 1,
1.061087, -1.529637, 3.151258, 1, 1, 1, 1, 1,
1.067426, 1.020335, -0.4186805, 1, 1, 1, 1, 1,
1.0678, 1.136485, -0.6317695, 1, 1, 1, 1, 1,
1.073567, -0.1796303, 3.221039, 0, 0, 1, 1, 1,
1.084722, 0.08033194, 1.567018, 1, 0, 0, 1, 1,
1.085188, -0.4023748, 2.038589, 1, 0, 0, 1, 1,
1.085549, 1.393274, -0.3026053, 1, 0, 0, 1, 1,
1.086147, 0.7675702, 0.806042, 1, 0, 0, 1, 1,
1.088401, -0.1738343, 1.782285, 1, 0, 0, 1, 1,
1.091354, -0.3686881, 2.65893, 0, 0, 0, 1, 1,
1.093767, 1.880316, 0.6058505, 0, 0, 0, 1, 1,
1.101047, -1.15058, 1.367809, 0, 0, 0, 1, 1,
1.102329, 0.1482439, 0.7884266, 0, 0, 0, 1, 1,
1.103734, -0.4122071, 2.56434, 0, 0, 0, 1, 1,
1.10613, -0.7688047, 2.100617, 0, 0, 0, 1, 1,
1.106713, -2.195662, 0.9666069, 0, 0, 0, 1, 1,
1.106756, -0.9688984, 3.627388, 1, 1, 1, 1, 1,
1.107375, -0.1718763, 1.13019, 1, 1, 1, 1, 1,
1.11386, 1.538545, 1.020033, 1, 1, 1, 1, 1,
1.121983, 0.04986529, 2.357248, 1, 1, 1, 1, 1,
1.122958, 0.02979028, 2.762477, 1, 1, 1, 1, 1,
1.134925, 1.398667, 0.221068, 1, 1, 1, 1, 1,
1.136133, -0.4783944, 2.329151, 1, 1, 1, 1, 1,
1.136144, -0.9130262, 2.225226, 1, 1, 1, 1, 1,
1.13763, -1.195196, 1.02614, 1, 1, 1, 1, 1,
1.144723, 0.2823862, 1.483982, 1, 1, 1, 1, 1,
1.156843, -0.5472638, 0.7776495, 1, 1, 1, 1, 1,
1.160641, -0.0247806, 2.021337, 1, 1, 1, 1, 1,
1.166642, 1.985453, -0.1860205, 1, 1, 1, 1, 1,
1.170947, 1.354447, 1.690804, 1, 1, 1, 1, 1,
1.180124, 1.275688, 1.245409, 1, 1, 1, 1, 1,
1.180717, 0.2108449, 2.699972, 0, 0, 1, 1, 1,
1.181497, -1.42809, 1.602798, 1, 0, 0, 1, 1,
1.182112, 2.318495, -1.215155, 1, 0, 0, 1, 1,
1.194428, -0.7806786, 1.50714, 1, 0, 0, 1, 1,
1.195763, 0.4249149, 2.615284, 1, 0, 0, 1, 1,
1.196343, 1.51658, -0.07487638, 1, 0, 0, 1, 1,
1.197804, 0.3285404, 0.7751781, 0, 0, 0, 1, 1,
1.198775, 0.5324013, 1.376392, 0, 0, 0, 1, 1,
1.20338, -1.933292, 1.210967, 0, 0, 0, 1, 1,
1.220531, 1.415566, 0.1156941, 0, 0, 0, 1, 1,
1.227982, -0.05313804, 0.1766676, 0, 0, 0, 1, 1,
1.231677, 1.437706, 2.265565, 0, 0, 0, 1, 1,
1.231687, 0.9378111, 0.8305906, 0, 0, 0, 1, 1,
1.239012, -0.226128, 1.838671, 1, 1, 1, 1, 1,
1.245447, 0.1707539, 0.7860835, 1, 1, 1, 1, 1,
1.24661, -1.731338, 3.06714, 1, 1, 1, 1, 1,
1.252025, -0.4970627, -0.1574981, 1, 1, 1, 1, 1,
1.256142, 0.7694924, 1.872149, 1, 1, 1, 1, 1,
1.256574, -2.074895, 1.437618, 1, 1, 1, 1, 1,
1.258611, 0.8453695, -0.8051862, 1, 1, 1, 1, 1,
1.262701, -0.4154755, 1.384061, 1, 1, 1, 1, 1,
1.266565, -1.054514, 3.405171, 1, 1, 1, 1, 1,
1.270636, 1.213319, 1.026563, 1, 1, 1, 1, 1,
1.271034, -1.750159, 2.912748, 1, 1, 1, 1, 1,
1.271146, 0.4992462, 1.839504, 1, 1, 1, 1, 1,
1.272845, 0.5558665, 0.8505171, 1, 1, 1, 1, 1,
1.273901, -0.2084194, 2.589986, 1, 1, 1, 1, 1,
1.278314, -0.3201502, 1.871476, 1, 1, 1, 1, 1,
1.280274, 0.997048, 2.280573, 0, 0, 1, 1, 1,
1.286759, -1.690016, 3.615863, 1, 0, 0, 1, 1,
1.288713, 0.02170789, 0.7793377, 1, 0, 0, 1, 1,
1.293129, -0.584203, 0.2738001, 1, 0, 0, 1, 1,
1.294891, 0.8658415, 1.500305, 1, 0, 0, 1, 1,
1.295325, -0.05996013, 0.9836248, 1, 0, 0, 1, 1,
1.295543, 1.316613, -0.2735326, 0, 0, 0, 1, 1,
1.301318, -0.484207, 0.9350925, 0, 0, 0, 1, 1,
1.307945, -1.47373, 3.000939, 0, 0, 0, 1, 1,
1.309732, -0.4155408, 1.285188, 0, 0, 0, 1, 1,
1.312153, 0.04090754, 0.1415379, 0, 0, 0, 1, 1,
1.314517, -0.1191306, 3.50796, 0, 0, 0, 1, 1,
1.328084, -0.4718156, 2.361238, 0, 0, 0, 1, 1,
1.340797, -0.1241127, 3.075441, 1, 1, 1, 1, 1,
1.342152, -0.8478326, 2.319707, 1, 1, 1, 1, 1,
1.351457, -0.6135893, 2.771545, 1, 1, 1, 1, 1,
1.354188, 2.670558, 0.9530127, 1, 1, 1, 1, 1,
1.362202, 0.6941229, 0.2811241, 1, 1, 1, 1, 1,
1.36983, -0.4333599, -0.1398286, 1, 1, 1, 1, 1,
1.385677, -0.962436, 1.805784, 1, 1, 1, 1, 1,
1.388413, -0.3089868, 2.963788, 1, 1, 1, 1, 1,
1.390749, -0.2357553, 1.171277, 1, 1, 1, 1, 1,
1.391039, 0.5745524, -0.2420031, 1, 1, 1, 1, 1,
1.409233, -0.2652746, 2.913965, 1, 1, 1, 1, 1,
1.411342, -0.1426256, 1.165624, 1, 1, 1, 1, 1,
1.425573, -0.4399194, 0.62559, 1, 1, 1, 1, 1,
1.433274, 1.735296, 2.847233, 1, 1, 1, 1, 1,
1.442274, -2.021907, 3.813056, 1, 1, 1, 1, 1,
1.447513, -0.1104309, 1.487328, 0, 0, 1, 1, 1,
1.456114, -0.4900594, 4.774844, 1, 0, 0, 1, 1,
1.45758, 0.379564, 0.479358, 1, 0, 0, 1, 1,
1.458041, 0.19506, 2.069816, 1, 0, 0, 1, 1,
1.468139, 2.982913, 0.7420852, 1, 0, 0, 1, 1,
1.473521, -1.014854, 1.531725, 1, 0, 0, 1, 1,
1.492669, 0.2056464, 2.705156, 0, 0, 0, 1, 1,
1.500971, 1.208842, 0.1238637, 0, 0, 0, 1, 1,
1.504355, -0.6476979, 1.583878, 0, 0, 0, 1, 1,
1.509794, -1.09957, 2.25563, 0, 0, 0, 1, 1,
1.543806, 0.7320985, 0.8967145, 0, 0, 0, 1, 1,
1.558874, -0.07064963, 1.58137, 0, 0, 0, 1, 1,
1.56212, -0.2109469, 1.544373, 0, 0, 0, 1, 1,
1.563106, 0.07614429, 2.19797, 1, 1, 1, 1, 1,
1.567206, -0.7988638, 1.161184, 1, 1, 1, 1, 1,
1.598166, -0.7246137, 1.192096, 1, 1, 1, 1, 1,
1.613749, 0.305236, 0.3061702, 1, 1, 1, 1, 1,
1.615039, -0.4211554, 3.215145, 1, 1, 1, 1, 1,
1.62061, -0.7397197, 2.269471, 1, 1, 1, 1, 1,
1.622641, 0.5193254, 1.684833, 1, 1, 1, 1, 1,
1.636181, 0.9046324, 1.008528, 1, 1, 1, 1, 1,
1.644316, 0.2717862, 1.054177, 1, 1, 1, 1, 1,
1.65698, 0.8772742, 0.9180399, 1, 1, 1, 1, 1,
1.65995, 0.735922, 1.047215, 1, 1, 1, 1, 1,
1.663094, -0.07318934, 2.532409, 1, 1, 1, 1, 1,
1.670718, -0.303693, 2.509077, 1, 1, 1, 1, 1,
1.672835, 1.12753, 0.9112249, 1, 1, 1, 1, 1,
1.678898, -0.4061525, 2.248329, 1, 1, 1, 1, 1,
1.700517, -0.2151702, 2.162948, 0, 0, 1, 1, 1,
1.710827, 0.003417266, 1.888686, 1, 0, 0, 1, 1,
1.718794, -1.495772, 2.337924, 1, 0, 0, 1, 1,
1.721097, -0.7999079, 1.726403, 1, 0, 0, 1, 1,
1.722072, -0.1383755, 3.052785, 1, 0, 0, 1, 1,
1.722284, -1.170564, 1.760781, 1, 0, 0, 1, 1,
1.729494, 0.04558384, 1.290251, 0, 0, 0, 1, 1,
1.734264, -1.079217, 1.982762, 0, 0, 0, 1, 1,
1.736973, -0.1879736, 2.83852, 0, 0, 0, 1, 1,
1.753837, 0.3517161, 1.866167, 0, 0, 0, 1, 1,
1.816821, 0.7942078, 1.525295, 0, 0, 0, 1, 1,
1.832483, 0.3532776, 1.121457, 0, 0, 0, 1, 1,
1.837508, -0.02838872, 1.303666, 0, 0, 0, 1, 1,
1.838934, 0.3445055, 1.106265, 1, 1, 1, 1, 1,
1.867972, 1.121975, 1.438793, 1, 1, 1, 1, 1,
1.870358, -0.2844412, 0.7216603, 1, 1, 1, 1, 1,
1.878025, -0.07252424, -0.8145588, 1, 1, 1, 1, 1,
1.87931, 1.742663, 2.045797, 1, 1, 1, 1, 1,
1.884752, 0.7576743, 0.7567481, 1, 1, 1, 1, 1,
1.888141, 0.9070302, 0.1975683, 1, 1, 1, 1, 1,
1.915511, 0.2601092, 2.339691, 1, 1, 1, 1, 1,
1.924528, -0.006075586, 1.35987, 1, 1, 1, 1, 1,
1.92709, -1.769597, 1.523252, 1, 1, 1, 1, 1,
1.937279, -1.326427, 1.015177, 1, 1, 1, 1, 1,
1.951452, -0.4887255, 1.927948, 1, 1, 1, 1, 1,
2.003159, 1.363155, -0.6497492, 1, 1, 1, 1, 1,
2.003536, 0.03831253, 3.583772, 1, 1, 1, 1, 1,
2.052174, 1.146702, 2.329631, 1, 1, 1, 1, 1,
2.068101, -0.4540044, 1.834574, 0, 0, 1, 1, 1,
2.073129, -1.9846, 3.231679, 1, 0, 0, 1, 1,
2.106269, -0.6874295, 1.772152, 1, 0, 0, 1, 1,
2.110814, 1.01511, 1.745418, 1, 0, 0, 1, 1,
2.145188, -0.6464231, 3.308842, 1, 0, 0, 1, 1,
2.163635, 0.9122592, 2.32074, 1, 0, 0, 1, 1,
2.234565, -1.209157, 0.05051619, 0, 0, 0, 1, 1,
2.235048, -0.4059855, 3.431654, 0, 0, 0, 1, 1,
2.251318, -1.14398, 1.780427, 0, 0, 0, 1, 1,
2.316839, -0.5305827, 1.192698, 0, 0, 0, 1, 1,
2.336153, 0.1363424, 0.9773664, 0, 0, 0, 1, 1,
2.415123, 0.9220034, 1.717648, 0, 0, 0, 1, 1,
2.424503, 0.5030537, 1.895947, 0, 0, 0, 1, 1,
2.444324, 0.954313, 1.813031, 1, 1, 1, 1, 1,
2.961209, 0.3919247, 0.6731189, 1, 1, 1, 1, 1,
3.311691, -1.029738, 1.344793, 1, 1, 1, 1, 1,
3.328409, -1.176933, 2.763689, 1, 1, 1, 1, 1,
3.341377, 1.714061, 2.53902, 1, 1, 1, 1, 1,
3.364496, 1.135498, -0.1758203, 1, 1, 1, 1, 1,
4.157288, 3.507375, -0.2840252, 1, 1, 1, 1, 1
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
var radius = 10.74977;
var distance = 37.7581;
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
mvMatrix.translate( -0.4972987, 0.06508732, 0.4450324 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.7581);
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
