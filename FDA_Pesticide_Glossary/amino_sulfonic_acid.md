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
-3.948632, 0.1287525, -1.854983, 1, 0, 0, 1,
-3.1048, 0.882925, -1.311766, 1, 0.007843138, 0, 1,
-2.951463, 0.137466, -1.593311, 1, 0.01176471, 0, 1,
-2.93212, 1.001604, -0.8263217, 1, 0.01960784, 0, 1,
-2.811872, 0.7620308, -0.2410392, 1, 0.02352941, 0, 1,
-2.670161, 0.2400156, -1.534454, 1, 0.03137255, 0, 1,
-2.653219, -0.5205696, -2.199773, 1, 0.03529412, 0, 1,
-2.619167, -0.9141947, -2.965049, 1, 0.04313726, 0, 1,
-2.604424, 0.7729999, -2.041072, 1, 0.04705882, 0, 1,
-2.566699, -0.1551035, 0.2280384, 1, 0.05490196, 0, 1,
-2.53647, 0.7586431, -5.042518, 1, 0.05882353, 0, 1,
-2.394813, 0.4917568, -3.39816, 1, 0.06666667, 0, 1,
-2.370762, -0.5569811, -3.340119, 1, 0.07058824, 0, 1,
-2.326518, 0.443849, -1.707008, 1, 0.07843138, 0, 1,
-2.316002, 1.90597, -0.02775302, 1, 0.08235294, 0, 1,
-2.311416, 0.6148632, -2.26363, 1, 0.09019608, 0, 1,
-2.299371, -3.191256, -1.857127, 1, 0.09411765, 0, 1,
-2.277298, 0.004210984, -1.249563, 1, 0.1019608, 0, 1,
-2.267902, 0.5867059, -2.043336, 1, 0.1098039, 0, 1,
-2.260415, -2.065811, 0.9971408, 1, 0.1137255, 0, 1,
-2.253303, 0.07291096, -2.156198, 1, 0.1215686, 0, 1,
-2.205351, -0.02502045, -0.735377, 1, 0.1254902, 0, 1,
-2.188649, -0.2311898, -2.443662, 1, 0.1333333, 0, 1,
-2.183749, 1.412561, -2.014842, 1, 0.1372549, 0, 1,
-2.171735, 0.0018085, -2.44165, 1, 0.145098, 0, 1,
-2.122372, -2.256758, -1.981863, 1, 0.1490196, 0, 1,
-2.103252, 0.6858421, 0.1520767, 1, 0.1568628, 0, 1,
-2.094682, 0.2019669, -0.5482494, 1, 0.1607843, 0, 1,
-2.088102, -1.099198, -0.8024502, 1, 0.1686275, 0, 1,
-2.087121, -0.4271631, -2.14485, 1, 0.172549, 0, 1,
-2.062342, 0.965794, -0.1445056, 1, 0.1803922, 0, 1,
-2.012395, 1.424302, 0.3077316, 1, 0.1843137, 0, 1,
-2.006008, 0.2968574, -1.765611, 1, 0.1921569, 0, 1,
-2.004731, 1.774345, -0.3763534, 1, 0.1960784, 0, 1,
-1.917371, -0.8211592, -3.068275, 1, 0.2039216, 0, 1,
-1.910201, -1.058846, -1.99887, 1, 0.2117647, 0, 1,
-1.899678, 2.984761, -1.550424, 1, 0.2156863, 0, 1,
-1.889166, -0.06517347, 0.5917619, 1, 0.2235294, 0, 1,
-1.862961, -0.09325916, -1.514164, 1, 0.227451, 0, 1,
-1.825801, 0.8408203, -0.9596592, 1, 0.2352941, 0, 1,
-1.81987, 0.1271318, -2.970011, 1, 0.2392157, 0, 1,
-1.812371, -0.9082912, -0.9479415, 1, 0.2470588, 0, 1,
-1.811705, 0.721524, 0.5354086, 1, 0.2509804, 0, 1,
-1.802643, -0.6614712, -1.71052, 1, 0.2588235, 0, 1,
-1.798599, -0.7039564, -5.211091, 1, 0.2627451, 0, 1,
-1.79226, -0.7889743, -0.9133472, 1, 0.2705882, 0, 1,
-1.777956, 0.7542511, -0.6207925, 1, 0.2745098, 0, 1,
-1.776425, -0.2737379, -1.618463, 1, 0.282353, 0, 1,
-1.772298, 1.542588, -0.614607, 1, 0.2862745, 0, 1,
-1.771889, 0.2745952, -0.2516383, 1, 0.2941177, 0, 1,
-1.771677, 0.1232865, -1.505045, 1, 0.3019608, 0, 1,
-1.725177, -0.4769384, -1.118088, 1, 0.3058824, 0, 1,
-1.723642, 2.336237, -2.057945, 1, 0.3137255, 0, 1,
-1.723486, -1.102425, -2.106188, 1, 0.3176471, 0, 1,
-1.716022, -0.7379882, -2.931646, 1, 0.3254902, 0, 1,
-1.703737, -0.2663373, -1.675961, 1, 0.3294118, 0, 1,
-1.700685, 0.9237209, -0.6315073, 1, 0.3372549, 0, 1,
-1.699625, 0.2720426, -2.529695, 1, 0.3411765, 0, 1,
-1.689007, 2.380936, -0.2653051, 1, 0.3490196, 0, 1,
-1.686339, 0.7351241, -1.152368, 1, 0.3529412, 0, 1,
-1.685996, 0.7390507, -0.9254665, 1, 0.3607843, 0, 1,
-1.684322, 0.9801106, 1.387865, 1, 0.3647059, 0, 1,
-1.682584, 0.4289826, 0.7459373, 1, 0.372549, 0, 1,
-1.642276, 0.2787732, -3.734364, 1, 0.3764706, 0, 1,
-1.63845, -0.9000902, -0.5704136, 1, 0.3843137, 0, 1,
-1.617464, -0.6406679, 0.5515258, 1, 0.3882353, 0, 1,
-1.597606, 0.6146381, -1.935599, 1, 0.3960784, 0, 1,
-1.591525, 0.04617312, -2.482673, 1, 0.4039216, 0, 1,
-1.582483, -1.096078, -3.623953, 1, 0.4078431, 0, 1,
-1.575936, 0.5761415, -1.116604, 1, 0.4156863, 0, 1,
-1.557031, -0.3748124, -1.403322, 1, 0.4196078, 0, 1,
-1.552446, 1.338364, 0.1793049, 1, 0.427451, 0, 1,
-1.550831, 1.024902, -0.139797, 1, 0.4313726, 0, 1,
-1.547601, 0.6623455, -2.574089, 1, 0.4392157, 0, 1,
-1.541593, 2.854065, 0.1740694, 1, 0.4431373, 0, 1,
-1.540063, 0.1865941, -0.8672485, 1, 0.4509804, 0, 1,
-1.537744, 0.133589, -2.328079, 1, 0.454902, 0, 1,
-1.535727, 0.4397948, -1.679296, 1, 0.4627451, 0, 1,
-1.53535, -0.3005579, -2.869825, 1, 0.4666667, 0, 1,
-1.533471, 0.1086765, -2.961607, 1, 0.4745098, 0, 1,
-1.519941, -1.216131, -3.842253, 1, 0.4784314, 0, 1,
-1.519663, -0.05387798, -2.848914, 1, 0.4862745, 0, 1,
-1.517739, -1.148917, -2.244575, 1, 0.4901961, 0, 1,
-1.514074, -0.7543989, -1.755456, 1, 0.4980392, 0, 1,
-1.501238, 0.4301376, -1.218345, 1, 0.5058824, 0, 1,
-1.459394, -0.559886, -2.812511, 1, 0.509804, 0, 1,
-1.449183, -1.316211, -2.80379, 1, 0.5176471, 0, 1,
-1.426735, 0.1304847, -1.427795, 1, 0.5215687, 0, 1,
-1.42427, -0.9972867, -2.421255, 1, 0.5294118, 0, 1,
-1.410258, -0.03005684, -3.005805, 1, 0.5333334, 0, 1,
-1.398111, 0.706783, 0.9785973, 1, 0.5411765, 0, 1,
-1.396067, 1.521198, 1.843387, 1, 0.5450981, 0, 1,
-1.380905, -0.1987036, -2.073978, 1, 0.5529412, 0, 1,
-1.379983, 1.213423, -1.448846, 1, 0.5568628, 0, 1,
-1.362008, -0.6128143, -3.197136, 1, 0.5647059, 0, 1,
-1.35825, 1.516102, -1.831124, 1, 0.5686275, 0, 1,
-1.336014, 0.3420482, -1.427055, 1, 0.5764706, 0, 1,
-1.334344, 1.460833, -0.1438815, 1, 0.5803922, 0, 1,
-1.326624, 1.831546, -1.529438, 1, 0.5882353, 0, 1,
-1.317088, 0.06050622, -1.256513, 1, 0.5921569, 0, 1,
-1.311647, 1.90246, -2.346957, 1, 0.6, 0, 1,
-1.310575, -0.9339318, -3.014141, 1, 0.6078432, 0, 1,
-1.309408, 0.100431, -1.044095, 1, 0.6117647, 0, 1,
-1.309241, 1.631598, -1.086305, 1, 0.6196079, 0, 1,
-1.30139, 0.5815183, -1.813871, 1, 0.6235294, 0, 1,
-1.301169, 0.5416012, 0.05708575, 1, 0.6313726, 0, 1,
-1.301128, 0.251938, -1.041978, 1, 0.6352941, 0, 1,
-1.300609, -0.7432001, -2.2451, 1, 0.6431373, 0, 1,
-1.298469, -0.07966457, -3.767148, 1, 0.6470588, 0, 1,
-1.292603, 1.092105, 0.01065658, 1, 0.654902, 0, 1,
-1.281802, 1.63326, -2.269489, 1, 0.6588235, 0, 1,
-1.253775, -0.475185, -1.444833, 1, 0.6666667, 0, 1,
-1.253671, -0.1677465, -1.101257, 1, 0.6705883, 0, 1,
-1.250743, 0.4135821, -1.114498, 1, 0.6784314, 0, 1,
-1.248797, 0.463715, -2.54415, 1, 0.682353, 0, 1,
-1.237683, -1.682344, -2.273456, 1, 0.6901961, 0, 1,
-1.229819, 0.4685674, -1.803247, 1, 0.6941177, 0, 1,
-1.229203, -0.5139913, -2.801059, 1, 0.7019608, 0, 1,
-1.227712, -0.1328631, -1.417372, 1, 0.7098039, 0, 1,
-1.22011, 0.4397196, -1.784366, 1, 0.7137255, 0, 1,
-1.219951, -0.3449211, -3.362809, 1, 0.7215686, 0, 1,
-1.215976, -1.362794, -0.4806966, 1, 0.7254902, 0, 1,
-1.206176, 0.5125284, -1.402428, 1, 0.7333333, 0, 1,
-1.205575, -0.1552201, -3.082231, 1, 0.7372549, 0, 1,
-1.195603, 0.1920025, -2.130552, 1, 0.7450981, 0, 1,
-1.188875, -0.1907194, 0.9789248, 1, 0.7490196, 0, 1,
-1.182247, -0.8621348, -1.460143, 1, 0.7568628, 0, 1,
-1.173535, -0.4555737, -2.628349, 1, 0.7607843, 0, 1,
-1.168118, 1.101885, -0.675448, 1, 0.7686275, 0, 1,
-1.167918, 1.596462, 0.1325375, 1, 0.772549, 0, 1,
-1.162111, -0.7364073, -2.792702, 1, 0.7803922, 0, 1,
-1.154179, -0.3686574, -0.5444342, 1, 0.7843137, 0, 1,
-1.152565, 0.267854, -0.4982375, 1, 0.7921569, 0, 1,
-1.148259, 0.4521217, -2.088696, 1, 0.7960784, 0, 1,
-1.139257, 2.33242, 0.708777, 1, 0.8039216, 0, 1,
-1.139143, -0.5287957, -3.635699, 1, 0.8117647, 0, 1,
-1.138654, 1.175629, -0.3552009, 1, 0.8156863, 0, 1,
-1.135639, -0.4957799, 0.05222872, 1, 0.8235294, 0, 1,
-1.128986, 0.1698054, -0.9464121, 1, 0.827451, 0, 1,
-1.119262, 0.4408974, -0.5102224, 1, 0.8352941, 0, 1,
-1.113606, -0.4740684, -1.896001, 1, 0.8392157, 0, 1,
-1.107935, -1.109661, -1.708233, 1, 0.8470588, 0, 1,
-1.086329, -0.6372362, -0.8635794, 1, 0.8509804, 0, 1,
-1.084637, 0.412759, -1.430269, 1, 0.8588235, 0, 1,
-1.084529, -0.3379162, 0.6474003, 1, 0.8627451, 0, 1,
-1.082025, 1.03353, 1.005647, 1, 0.8705882, 0, 1,
-1.079082, -0.9223376, -2.987638, 1, 0.8745098, 0, 1,
-1.077412, 0.4651497, -0.2041307, 1, 0.8823529, 0, 1,
-1.07681, 0.7349129, -1.205337, 1, 0.8862745, 0, 1,
-1.062969, 1.884162, -2.452163, 1, 0.8941177, 0, 1,
-1.054958, -1.809583, -3.19293, 1, 0.8980392, 0, 1,
-1.054934, -2.839858, -2.496923, 1, 0.9058824, 0, 1,
-1.054825, -0.7893249, -2.802403, 1, 0.9137255, 0, 1,
-1.0493, 0.8665606, -0.9839616, 1, 0.9176471, 0, 1,
-1.044513, -0.6930863, -3.572181, 1, 0.9254902, 0, 1,
-1.028355, 0.4672579, -0.9758984, 1, 0.9294118, 0, 1,
-1.025073, 0.6561925, -1.724611, 1, 0.9372549, 0, 1,
-1.024069, -0.6621816, -2.687325, 1, 0.9411765, 0, 1,
-1.020664, -0.8089764, -1.717361, 1, 0.9490196, 0, 1,
-1.020405, 1.727363, -0.1997945, 1, 0.9529412, 0, 1,
-1.017531, 0.5704255, -0.3682576, 1, 0.9607843, 0, 1,
-1.009494, -1.885584, -1.750654, 1, 0.9647059, 0, 1,
-1.008324, -0.2174414, -1.367974, 1, 0.972549, 0, 1,
-1.005149, 0.3172031, -1.89656, 1, 0.9764706, 0, 1,
-1.000823, -0.5352029, -2.888204, 1, 0.9843137, 0, 1,
-1.000484, -0.9217086, -2.743278, 1, 0.9882353, 0, 1,
-0.9928857, 1.555439, -0.2928228, 1, 0.9960784, 0, 1,
-0.9905977, -0.9189858, -3.626569, 0.9960784, 1, 0, 1,
-0.9879389, 0.3054683, -2.41813, 0.9921569, 1, 0, 1,
-0.9860963, -0.2953395, -1.326855, 0.9843137, 1, 0, 1,
-0.9844831, -0.3655979, -2.955413, 0.9803922, 1, 0, 1,
-0.984235, -0.7492817, -1.091689, 0.972549, 1, 0, 1,
-0.9779673, 1.253907, -1.769646, 0.9686275, 1, 0, 1,
-0.9752266, -0.3830531, 0.04324512, 0.9607843, 1, 0, 1,
-0.9734136, 0.08141002, -1.19795, 0.9568627, 1, 0, 1,
-0.9680282, -0.4307613, -1.5079, 0.9490196, 1, 0, 1,
-0.964571, 1.363363, -0.8567782, 0.945098, 1, 0, 1,
-0.9547035, -1.059976, -1.811635, 0.9372549, 1, 0, 1,
-0.9544064, -0.3380567, -3.174169, 0.9333333, 1, 0, 1,
-0.9480492, 0.06015105, -1.577813, 0.9254902, 1, 0, 1,
-0.9457943, -2.182552, -3.244364, 0.9215686, 1, 0, 1,
-0.9328524, 0.8852098, 0.3712417, 0.9137255, 1, 0, 1,
-0.9328413, 0.2008489, -2.121451, 0.9098039, 1, 0, 1,
-0.931872, 0.8179364, 0.9983957, 0.9019608, 1, 0, 1,
-0.9245223, -0.8794702, -0.3385559, 0.8941177, 1, 0, 1,
-0.9213231, 1.102337, 0.9402298, 0.8901961, 1, 0, 1,
-0.9179696, 0.1485018, -1.957232, 0.8823529, 1, 0, 1,
-0.9163673, -0.1351018, -3.480483, 0.8784314, 1, 0, 1,
-0.9135635, 1.281821, -0.0805978, 0.8705882, 1, 0, 1,
-0.9085761, 1.164578, -2.262092, 0.8666667, 1, 0, 1,
-0.9060087, -0.245796, -1.721105, 0.8588235, 1, 0, 1,
-0.8949994, 1.419979, -0.729866, 0.854902, 1, 0, 1,
-0.8859894, -1.106824, -1.752925, 0.8470588, 1, 0, 1,
-0.8841011, -0.5785068, -0.4965224, 0.8431373, 1, 0, 1,
-0.8807505, 0.01355592, -0.6445359, 0.8352941, 1, 0, 1,
-0.8757036, -0.5465209, -2.032727, 0.8313726, 1, 0, 1,
-0.8744096, -0.01853642, -2.799993, 0.8235294, 1, 0, 1,
-0.8632535, 0.01341501, -1.584021, 0.8196079, 1, 0, 1,
-0.8550864, 1.234895, -0.9622914, 0.8117647, 1, 0, 1,
-0.8503506, -0.2721387, -2.223033, 0.8078431, 1, 0, 1,
-0.8438869, -0.1900031, -1.46714, 0.8, 1, 0, 1,
-0.8416516, 1.218972, 0.5572571, 0.7921569, 1, 0, 1,
-0.8406764, -0.4832737, -0.7918175, 0.7882353, 1, 0, 1,
-0.8338456, -1.227351, -3.808658, 0.7803922, 1, 0, 1,
-0.8338348, -0.2814906, -2.004727, 0.7764706, 1, 0, 1,
-0.8327271, -0.4085241, -2.916074, 0.7686275, 1, 0, 1,
-0.8312743, 0.3856173, -1.512943, 0.7647059, 1, 0, 1,
-0.8299952, 0.1607145, -1.208244, 0.7568628, 1, 0, 1,
-0.8290734, -0.238469, -0.7292415, 0.7529412, 1, 0, 1,
-0.8258398, -0.5124429, -2.07642, 0.7450981, 1, 0, 1,
-0.8238673, 0.8036597, -1.074573, 0.7411765, 1, 0, 1,
-0.8198858, 0.944189, -0.06492303, 0.7333333, 1, 0, 1,
-0.8174065, 1.529692, 0.3868433, 0.7294118, 1, 0, 1,
-0.8155478, 2.199545, 0.0150063, 0.7215686, 1, 0, 1,
-0.8065709, -0.2841913, -2.801391, 0.7176471, 1, 0, 1,
-0.805605, 1.924141, -2.824547, 0.7098039, 1, 0, 1,
-0.8053357, -0.1160129, -1.716654, 0.7058824, 1, 0, 1,
-0.8053133, -1.228536, -1.538253, 0.6980392, 1, 0, 1,
-0.8040704, -0.797551, -3.73283, 0.6901961, 1, 0, 1,
-0.7933856, 0.6772474, -1.463103, 0.6862745, 1, 0, 1,
-0.793013, -1.071262, -2.637078, 0.6784314, 1, 0, 1,
-0.788316, -0.5346081, -0.8978766, 0.6745098, 1, 0, 1,
-0.7877778, -1.096779, -1.203197, 0.6666667, 1, 0, 1,
-0.782057, -2.232947, -2.905602, 0.6627451, 1, 0, 1,
-0.7815905, -1.718962, -2.670443, 0.654902, 1, 0, 1,
-0.7806106, -0.6157967, -2.191165, 0.6509804, 1, 0, 1,
-0.7795165, -0.009725459, -1.238498, 0.6431373, 1, 0, 1,
-0.7744948, 0.3755994, -0.2246628, 0.6392157, 1, 0, 1,
-0.7732238, -0.6545803, -4.399902, 0.6313726, 1, 0, 1,
-0.7672639, -0.09951165, -2.304316, 0.627451, 1, 0, 1,
-0.7638716, 0.09271816, -0.3821965, 0.6196079, 1, 0, 1,
-0.7619973, 0.3574867, 0.3549998, 0.6156863, 1, 0, 1,
-0.7592482, 0.9411904, 0.3373533, 0.6078432, 1, 0, 1,
-0.7550413, 1.026843, -0.5481994, 0.6039216, 1, 0, 1,
-0.753751, -0.6767537, -1.547855, 0.5960785, 1, 0, 1,
-0.7494718, -0.8162072, -1.73018, 0.5882353, 1, 0, 1,
-0.748347, 0.2555838, -2.967063, 0.5843138, 1, 0, 1,
-0.7436259, -0.3377529, -2.868579, 0.5764706, 1, 0, 1,
-0.7405016, -1.504099, -2.083506, 0.572549, 1, 0, 1,
-0.7304996, -1.790147, -1.906869, 0.5647059, 1, 0, 1,
-0.7282048, 0.05892903, -1.146097, 0.5607843, 1, 0, 1,
-0.725076, 0.3570931, -0.4528154, 0.5529412, 1, 0, 1,
-0.7218962, -0.6569182, -2.491928, 0.5490196, 1, 0, 1,
-0.7190464, 0.5598794, -0.7302947, 0.5411765, 1, 0, 1,
-0.7023032, -0.2919422, -2.952557, 0.5372549, 1, 0, 1,
-0.701602, -0.1051719, -1.949077, 0.5294118, 1, 0, 1,
-0.6924834, -0.6719338, -3.676709, 0.5254902, 1, 0, 1,
-0.6923913, -0.3780178, -2.653953, 0.5176471, 1, 0, 1,
-0.6894522, -0.2381582, -3.467026, 0.5137255, 1, 0, 1,
-0.6875216, 0.05264881, -1.816058, 0.5058824, 1, 0, 1,
-0.6857787, -1.237197, -1.922488, 0.5019608, 1, 0, 1,
-0.6843565, -1.563108, -2.924155, 0.4941176, 1, 0, 1,
-0.6842527, -1.240546, -1.720363, 0.4862745, 1, 0, 1,
-0.6827165, 0.7881461, -0.03857324, 0.4823529, 1, 0, 1,
-0.67641, -0.5432271, -2.449732, 0.4745098, 1, 0, 1,
-0.6755268, 1.016503, -0.5696974, 0.4705882, 1, 0, 1,
-0.6750305, -0.4338587, -0.710943, 0.4627451, 1, 0, 1,
-0.6737355, -0.2063931, -2.547613, 0.4588235, 1, 0, 1,
-0.6715381, 0.5253969, -0.3316364, 0.4509804, 1, 0, 1,
-0.6674635, 0.7118582, -1.903776, 0.4470588, 1, 0, 1,
-0.6562622, 0.09133324, -2.072057, 0.4392157, 1, 0, 1,
-0.6522164, -0.2126778, -3.136079, 0.4352941, 1, 0, 1,
-0.6504569, -0.5913854, -2.237003, 0.427451, 1, 0, 1,
-0.6415974, -0.6671054, -0.9374408, 0.4235294, 1, 0, 1,
-0.6339389, -0.792006, -2.558686, 0.4156863, 1, 0, 1,
-0.6305764, 0.07611834, -0.5546499, 0.4117647, 1, 0, 1,
-0.6304014, 0.8861139, 0.1716214, 0.4039216, 1, 0, 1,
-0.6279526, -0.3863964, -2.50848, 0.3960784, 1, 0, 1,
-0.6270069, -1.814407, -3.719714, 0.3921569, 1, 0, 1,
-0.6199721, -1.446917, -2.78082, 0.3843137, 1, 0, 1,
-0.6175277, -0.1161052, -2.862988, 0.3803922, 1, 0, 1,
-0.6157334, 0.4006531, -1.378623, 0.372549, 1, 0, 1,
-0.6156606, 1.190787, 0.7339364, 0.3686275, 1, 0, 1,
-0.6103094, -1.734494, -3.305424, 0.3607843, 1, 0, 1,
-0.6073287, 0.8190189, -2.07306, 0.3568628, 1, 0, 1,
-0.6007087, -0.2350263, -1.992966, 0.3490196, 1, 0, 1,
-0.5914651, 1.144226, 0.5431323, 0.345098, 1, 0, 1,
-0.5897924, 1.084019, -0.0863779, 0.3372549, 1, 0, 1,
-0.5868432, -0.507221, -2.388617, 0.3333333, 1, 0, 1,
-0.5849044, -0.7931787, -1.941808, 0.3254902, 1, 0, 1,
-0.5833308, -0.7445074, -4.450261, 0.3215686, 1, 0, 1,
-0.5826063, 0.1143365, -2.62517, 0.3137255, 1, 0, 1,
-0.5799439, 0.9353919, -1.484176, 0.3098039, 1, 0, 1,
-0.5736535, -1.32748, 0.3309503, 0.3019608, 1, 0, 1,
-0.5727187, 1.014087, -2.915724, 0.2941177, 1, 0, 1,
-0.5645679, 1.00925, -1.45409, 0.2901961, 1, 0, 1,
-0.5629429, 1.296618, 2.073245, 0.282353, 1, 0, 1,
-0.5619248, -2.670094, -2.402177, 0.2784314, 1, 0, 1,
-0.556761, 0.1524312, -2.288463, 0.2705882, 1, 0, 1,
-0.541941, 0.3395564, -0.05740628, 0.2666667, 1, 0, 1,
-0.5314621, -0.3929706, -3.957553, 0.2588235, 1, 0, 1,
-0.5298023, -0.1681096, -0.3310968, 0.254902, 1, 0, 1,
-0.5276709, -0.7576603, -2.96834, 0.2470588, 1, 0, 1,
-0.524911, -0.2012892, -1.573943, 0.2431373, 1, 0, 1,
-0.5235528, -0.9251186, -3.1422, 0.2352941, 1, 0, 1,
-0.5233104, -0.3561136, -3.363191, 0.2313726, 1, 0, 1,
-0.5182587, 1.783789, 0.5087848, 0.2235294, 1, 0, 1,
-0.516636, 0.6603602, -0.9223582, 0.2196078, 1, 0, 1,
-0.515623, 0.05269665, -1.42449, 0.2117647, 1, 0, 1,
-0.5152847, 0.1787996, -1.261348, 0.2078431, 1, 0, 1,
-0.5151145, 0.6663595, 1.27696, 0.2, 1, 0, 1,
-0.5147334, 0.3282431, -0.2006157, 0.1921569, 1, 0, 1,
-0.5136121, -0.2574626, -3.626694, 0.1882353, 1, 0, 1,
-0.5102224, 0.4616131, -1.712232, 0.1803922, 1, 0, 1,
-0.5080977, -2.114432, -3.101049, 0.1764706, 1, 0, 1,
-0.5080154, -0.6377282, -2.462828, 0.1686275, 1, 0, 1,
-0.4870761, -0.3296812, -3.544292, 0.1647059, 1, 0, 1,
-0.4864673, -0.1748829, -3.761227, 0.1568628, 1, 0, 1,
-0.4833735, -0.40736, -1.142531, 0.1529412, 1, 0, 1,
-0.4832477, -0.5562057, -0.9036509, 0.145098, 1, 0, 1,
-0.4798365, -0.1758076, -2.311077, 0.1411765, 1, 0, 1,
-0.4746522, 0.5282385, -1.846798, 0.1333333, 1, 0, 1,
-0.4721239, -0.6514719, -2.296274, 0.1294118, 1, 0, 1,
-0.472081, 0.7521942, -0.5846605, 0.1215686, 1, 0, 1,
-0.4711335, 1.431837, -1.550105, 0.1176471, 1, 0, 1,
-0.4673983, -0.3065438, -3.257432, 0.1098039, 1, 0, 1,
-0.4658486, -0.1305489, -0.8706905, 0.1058824, 1, 0, 1,
-0.4657728, 1.319697, -0.3205545, 0.09803922, 1, 0, 1,
-0.4653004, 0.1523876, -0.4889464, 0.09019608, 1, 0, 1,
-0.4580667, -0.6434606, -1.526493, 0.08627451, 1, 0, 1,
-0.456026, 1.141633, -1.345641, 0.07843138, 1, 0, 1,
-0.4547299, -0.41193, -0.440125, 0.07450981, 1, 0, 1,
-0.4534387, 0.3354791, -3.032365, 0.06666667, 1, 0, 1,
-0.4511981, 1.836015, 0.9787112, 0.0627451, 1, 0, 1,
-0.4460346, 0.5903103, -0.1878585, 0.05490196, 1, 0, 1,
-0.4457247, 0.4193701, -0.6402388, 0.05098039, 1, 0, 1,
-0.4416124, 0.01221117, -0.02129967, 0.04313726, 1, 0, 1,
-0.4398399, -1.463456, -1.919115, 0.03921569, 1, 0, 1,
-0.4343706, -2.335755, -2.281158, 0.03137255, 1, 0, 1,
-0.4334362, -0.3602516, -0.3608595, 0.02745098, 1, 0, 1,
-0.4247978, 0.02675754, -1.851736, 0.01960784, 1, 0, 1,
-0.4237642, -0.2380239, -1.948549, 0.01568628, 1, 0, 1,
-0.4231419, -0.4727733, -2.037406, 0.007843138, 1, 0, 1,
-0.4188197, 0.4603751, 0.7520586, 0.003921569, 1, 0, 1,
-0.4179972, 0.2850817, -0.5863305, 0, 1, 0.003921569, 1,
-0.4172744, 0.09884013, -0.7114539, 0, 1, 0.01176471, 1,
-0.4158448, 1.367301, 0.4352252, 0, 1, 0.01568628, 1,
-0.4116974, 0.4523248, 0.8532224, 0, 1, 0.02352941, 1,
-0.4078909, -1.775875, -1.572931, 0, 1, 0.02745098, 1,
-0.4071239, -0.3361184, -2.543121, 0, 1, 0.03529412, 1,
-0.4025723, 0.2284944, 0.4854186, 0, 1, 0.03921569, 1,
-0.3887971, 1.643298, -0.3312013, 0, 1, 0.04705882, 1,
-0.3854797, 1.436632, 1.519152, 0, 1, 0.05098039, 1,
-0.3843222, -0.3877121, -2.14697, 0, 1, 0.05882353, 1,
-0.3831251, -0.7320235, -1.274588, 0, 1, 0.0627451, 1,
-0.3779559, 0.04108207, -1.448037, 0, 1, 0.07058824, 1,
-0.3703188, 1.508933, 0.440868, 0, 1, 0.07450981, 1,
-0.3655124, 1.163263, -1.741714, 0, 1, 0.08235294, 1,
-0.3585304, 2.272396, 1.490054, 0, 1, 0.08627451, 1,
-0.3568664, 0.8606545, -0.2742501, 0, 1, 0.09411765, 1,
-0.3547813, -0.4043229, -2.6519, 0, 1, 0.1019608, 1,
-0.3470036, -0.414831, -2.623053, 0, 1, 0.1058824, 1,
-0.341542, 0.4436949, -0.5173327, 0, 1, 0.1137255, 1,
-0.3349002, 1.261656, -0.1408646, 0, 1, 0.1176471, 1,
-0.3337996, -0.3096856, -0.7912017, 0, 1, 0.1254902, 1,
-0.3324444, 0.8790719, -0.5895869, 0, 1, 0.1294118, 1,
-0.3321414, 0.8202941, -1.503011, 0, 1, 0.1372549, 1,
-0.3312925, 0.2403053, -1.145926, 0, 1, 0.1411765, 1,
-0.3290396, 2.213428, 0.01676332, 0, 1, 0.1490196, 1,
-0.3286418, 1.455506, -0.8537464, 0, 1, 0.1529412, 1,
-0.323817, 0.1608446, -1.158676, 0, 1, 0.1607843, 1,
-0.3183732, -2.1216, -3.51141, 0, 1, 0.1647059, 1,
-0.3134807, -0.5795623, -3.440834, 0, 1, 0.172549, 1,
-0.312808, -0.9631259, -3.225451, 0, 1, 0.1764706, 1,
-0.3121002, 1.388259, 0.5266691, 0, 1, 0.1843137, 1,
-0.3120432, -0.674691, -3.637522, 0, 1, 0.1882353, 1,
-0.3091905, 0.6115462, -0.04252932, 0, 1, 0.1960784, 1,
-0.3082569, -0.1316116, -2.967371, 0, 1, 0.2039216, 1,
-0.307722, 0.6199968, 0.003413945, 0, 1, 0.2078431, 1,
-0.3008668, 1.236898, 1.003645, 0, 1, 0.2156863, 1,
-0.3007141, 0.4894656, -1.673357, 0, 1, 0.2196078, 1,
-0.2930519, -0.3816356, -3.206947, 0, 1, 0.227451, 1,
-0.2921638, 1.284392, 0.003869843, 0, 1, 0.2313726, 1,
-0.2913019, -0.5500783, -2.043164, 0, 1, 0.2392157, 1,
-0.2910621, 0.229935, -0.4550219, 0, 1, 0.2431373, 1,
-0.285006, 0.05187873, -1.983658, 0, 1, 0.2509804, 1,
-0.2840517, -0.4253067, -4.503619, 0, 1, 0.254902, 1,
-0.279541, -0.6052132, -3.014029, 0, 1, 0.2627451, 1,
-0.2792594, -0.6392536, -1.725876, 0, 1, 0.2666667, 1,
-0.2790512, -1.785448, -1.619787, 0, 1, 0.2745098, 1,
-0.2768272, -3.295455, -4.019376, 0, 1, 0.2784314, 1,
-0.2708456, 0.4889363, -0.4158655, 0, 1, 0.2862745, 1,
-0.2699905, -0.6233356, -3.1755, 0, 1, 0.2901961, 1,
-0.2668047, 0.2692183, -1.556549, 0, 1, 0.2980392, 1,
-0.2661291, -0.005144574, -1.938217, 0, 1, 0.3058824, 1,
-0.2634571, 0.1800071, -1.954605, 0, 1, 0.3098039, 1,
-0.2633097, 0.1114331, -1.106643, 0, 1, 0.3176471, 1,
-0.2561801, -1.287894, -4.542959, 0, 1, 0.3215686, 1,
-0.2530918, -1.244262, -4.913902, 0, 1, 0.3294118, 1,
-0.2473795, 0.8523616, -1.281921, 0, 1, 0.3333333, 1,
-0.2463388, -0.1198848, -1.52279, 0, 1, 0.3411765, 1,
-0.2413899, 0.05893886, -0.7576361, 0, 1, 0.345098, 1,
-0.236663, 0.7803595, -1.371152, 0, 1, 0.3529412, 1,
-0.2273212, -0.6390387, -0.9253431, 0, 1, 0.3568628, 1,
-0.2237185, 0.4181879, 0.1533471, 0, 1, 0.3647059, 1,
-0.2169935, -0.5205923, -3.101048, 0, 1, 0.3686275, 1,
-0.2140558, 0.6557482, -0.7687571, 0, 1, 0.3764706, 1,
-0.2117302, 0.9538844, -0.9774543, 0, 1, 0.3803922, 1,
-0.2106831, 0.2213522, -1.412768, 0, 1, 0.3882353, 1,
-0.2106635, -0.7536808, -2.712605, 0, 1, 0.3921569, 1,
-0.2099613, 0.5285637, 0.09607361, 0, 1, 0.4, 1,
-0.2083307, -0.254732, -3.469133, 0, 1, 0.4078431, 1,
-0.2059137, -0.5147311, -1.744471, 0, 1, 0.4117647, 1,
-0.2020963, -0.5791481, -2.206099, 0, 1, 0.4196078, 1,
-0.2005754, 0.6208186, -0.9249642, 0, 1, 0.4235294, 1,
-0.1970121, -1.013255, -4.852314, 0, 1, 0.4313726, 1,
-0.1951409, -0.1638842, -2.969024, 0, 1, 0.4352941, 1,
-0.1946275, -1.560216, -2.285299, 0, 1, 0.4431373, 1,
-0.1932719, -1.544582, -2.071126, 0, 1, 0.4470588, 1,
-0.1883076, 0.6918305, -0.6437054, 0, 1, 0.454902, 1,
-0.1877981, 0.6741998, -1.238929, 0, 1, 0.4588235, 1,
-0.1860112, 0.6146571, 0.2854575, 0, 1, 0.4666667, 1,
-0.1843284, 0.7395694, 0.01810926, 0, 1, 0.4705882, 1,
-0.1813401, 0.4039259, 0.6593367, 0, 1, 0.4784314, 1,
-0.1803913, 1.32619, -1.86672, 0, 1, 0.4823529, 1,
-0.1802283, -0.2481985, -1.904307, 0, 1, 0.4901961, 1,
-0.1797158, 0.3305057, -0.548327, 0, 1, 0.4941176, 1,
-0.1794733, 0.5198975, -0.9064827, 0, 1, 0.5019608, 1,
-0.1744263, -0.01028046, -1.417289, 0, 1, 0.509804, 1,
-0.1692345, -0.3029449, -3.276229, 0, 1, 0.5137255, 1,
-0.1674456, -1.34316, -2.496856, 0, 1, 0.5215687, 1,
-0.1617362, 0.03763288, 0.3228627, 0, 1, 0.5254902, 1,
-0.1595732, -0.07847401, -2.466555, 0, 1, 0.5333334, 1,
-0.1580135, 0.01511696, -0.6502589, 0, 1, 0.5372549, 1,
-0.1571233, 0.3051965, 0.8884614, 0, 1, 0.5450981, 1,
-0.1544164, -0.9505351, -2.589952, 0, 1, 0.5490196, 1,
-0.1537089, -1.953822, -2.713661, 0, 1, 0.5568628, 1,
-0.1527821, -1.239392, -3.301001, 0, 1, 0.5607843, 1,
-0.1512647, 1.395753, -0.8386662, 0, 1, 0.5686275, 1,
-0.1486378, 1.120393, -0.983328, 0, 1, 0.572549, 1,
-0.1467054, -0.5571024, -3.837358, 0, 1, 0.5803922, 1,
-0.1465678, -0.3493082, -2.98048, 0, 1, 0.5843138, 1,
-0.1411639, 0.1834263, -1.260687, 0, 1, 0.5921569, 1,
-0.1397126, 0.1334403, -0.9420732, 0, 1, 0.5960785, 1,
-0.128531, 0.657933, 0.1749806, 0, 1, 0.6039216, 1,
-0.1264579, 0.7789823, 0.873136, 0, 1, 0.6117647, 1,
-0.1262695, -0.74264, -2.1863, 0, 1, 0.6156863, 1,
-0.1253684, -0.9104886, -4.597245, 0, 1, 0.6235294, 1,
-0.1187947, 0.194161, -0.1714847, 0, 1, 0.627451, 1,
-0.116834, 0.5354331, -1.934085, 0, 1, 0.6352941, 1,
-0.1122437, 0.6232873, -0.7033658, 0, 1, 0.6392157, 1,
-0.1105007, 0.445198, 0.1726972, 0, 1, 0.6470588, 1,
-0.1088852, 1.88721, -0.6761903, 0, 1, 0.6509804, 1,
-0.09819212, -0.5283236, -3.184687, 0, 1, 0.6588235, 1,
-0.09657603, -0.216971, -2.905457, 0, 1, 0.6627451, 1,
-0.0964678, -1.068498, -1.798631, 0, 1, 0.6705883, 1,
-0.09408356, 0.424767, -0.02082203, 0, 1, 0.6745098, 1,
-0.09402264, -1.834635, -5.393154, 0, 1, 0.682353, 1,
-0.09275797, 1.249035, -2.241749, 0, 1, 0.6862745, 1,
-0.08723677, 0.3334026, -0.6674608, 0, 1, 0.6941177, 1,
-0.0858236, 0.8197784, 0.1405573, 0, 1, 0.7019608, 1,
-0.08080178, 0.04698992, 0.1624682, 0, 1, 0.7058824, 1,
-0.08044077, 0.07531269, -1.268768, 0, 1, 0.7137255, 1,
-0.07872888, -0.7688317, -1.324095, 0, 1, 0.7176471, 1,
-0.07739551, -1.697284, -2.317851, 0, 1, 0.7254902, 1,
-0.07583285, 0.4442792, 1.651515, 0, 1, 0.7294118, 1,
-0.07557699, 2.412503, 0.1848305, 0, 1, 0.7372549, 1,
-0.07484136, 0.8149424, 0.5115016, 0, 1, 0.7411765, 1,
-0.07304221, -0.1076872, -1.28258, 0, 1, 0.7490196, 1,
-0.06820458, -1.539459, -2.810506, 0, 1, 0.7529412, 1,
-0.06067838, -0.7922811, -2.710561, 0, 1, 0.7607843, 1,
-0.05915429, -1.361171, -1.782914, 0, 1, 0.7647059, 1,
-0.05702587, 0.5571854, 1.282941, 0, 1, 0.772549, 1,
-0.0563713, -0.5251486, -2.87395, 0, 1, 0.7764706, 1,
-0.05248939, 1.11608, -0.1802207, 0, 1, 0.7843137, 1,
-0.05105647, -0.0005384675, -2.027109, 0, 1, 0.7882353, 1,
-0.05050937, -0.9786633, -3.124057, 0, 1, 0.7960784, 1,
-0.04768705, -0.01474117, -2.810108, 0, 1, 0.8039216, 1,
-0.04720031, 0.5804431, 0.6342742, 0, 1, 0.8078431, 1,
-0.04415867, 1.055824, -0.4875614, 0, 1, 0.8156863, 1,
-0.04220924, -0.809738, -3.476001, 0, 1, 0.8196079, 1,
-0.04080193, -0.1205486, -2.594192, 0, 1, 0.827451, 1,
-0.03745155, 0.4237505, -0.1733381, 0, 1, 0.8313726, 1,
-0.03732267, -0.08745058, -2.536881, 0, 1, 0.8392157, 1,
-0.03632867, -0.52595, -4.152065, 0, 1, 0.8431373, 1,
-0.02986493, -0.3941503, -2.946419, 0, 1, 0.8509804, 1,
-0.02834275, 2.034451, 0.9511593, 0, 1, 0.854902, 1,
-0.02693696, -0.3240008, -4.185512, 0, 1, 0.8627451, 1,
-0.02561522, 1.056452, 1.80104, 0, 1, 0.8666667, 1,
-0.02198877, 2.143953, 1.69879, 0, 1, 0.8745098, 1,
-0.0202174, -0.2107098, -3.291433, 0, 1, 0.8784314, 1,
-0.01384371, -0.5329026, -2.374646, 0, 1, 0.8862745, 1,
-0.01008467, -0.2205891, -4.724361, 0, 1, 0.8901961, 1,
-0.007887307, -0.3622618, -3.231302, 0, 1, 0.8980392, 1,
-0.007600859, -1.063464, -2.592408, 0, 1, 0.9058824, 1,
-0.003813828, 0.2871924, -0.04391274, 0, 1, 0.9098039, 1,
0.0004435957, 0.01205188, -1.50482, 0, 1, 0.9176471, 1,
0.002336328, -0.1149706, 2.181428, 0, 1, 0.9215686, 1,
0.00259702, 1.861575, -0.4035085, 0, 1, 0.9294118, 1,
0.00588846, 2.069917, 0.3999802, 0, 1, 0.9333333, 1,
0.005970057, 1.303432, -0.01100825, 0, 1, 0.9411765, 1,
0.008884635, 1.129382, -0.4704047, 0, 1, 0.945098, 1,
0.009918016, -1.921407, 1.249773, 0, 1, 0.9529412, 1,
0.01122359, -0.4985758, 2.858673, 0, 1, 0.9568627, 1,
0.01143541, 0.6169862, 0.6748717, 0, 1, 0.9647059, 1,
0.01202757, 1.994188, -0.1866235, 0, 1, 0.9686275, 1,
0.01429853, 0.3562788, 0.4095958, 0, 1, 0.9764706, 1,
0.01831489, 0.9336541, 0.3721078, 0, 1, 0.9803922, 1,
0.02508256, -0.3810464, 3.087699, 0, 1, 0.9882353, 1,
0.02610452, 1.965316, -1.288548, 0, 1, 0.9921569, 1,
0.03489253, -0.5644185, 3.386191, 0, 1, 1, 1,
0.03583563, 0.1930589, 0.9029813, 0, 0.9921569, 1, 1,
0.04599968, -0.4794297, 3.9436, 0, 0.9882353, 1, 1,
0.04822005, -0.6674953, 2.050439, 0, 0.9803922, 1, 1,
0.04825239, -1.256474, 2.694901, 0, 0.9764706, 1, 1,
0.05259047, -0.4333963, 4.435435, 0, 0.9686275, 1, 1,
0.05616146, 2.287518, 0.5967099, 0, 0.9647059, 1, 1,
0.05625549, 1.089983, 0.05153302, 0, 0.9568627, 1, 1,
0.05629775, -1.002048, 1.678138, 0, 0.9529412, 1, 1,
0.06070121, 0.4684804, 0.118255, 0, 0.945098, 1, 1,
0.06239427, -1.571939, 3.784003, 0, 0.9411765, 1, 1,
0.0646226, 0.1223264, -0.1209336, 0, 0.9333333, 1, 1,
0.06573819, 0.3982287, -0.3834118, 0, 0.9294118, 1, 1,
0.06577706, 0.2325599, 0.1822957, 0, 0.9215686, 1, 1,
0.06786592, 0.3482081, 0.1064606, 0, 0.9176471, 1, 1,
0.06896882, -0.02772679, 1.904245, 0, 0.9098039, 1, 1,
0.07096717, -0.5416098, 2.56251, 0, 0.9058824, 1, 1,
0.07200174, 0.1817243, 1.63406, 0, 0.8980392, 1, 1,
0.07282515, 0.4670188, 0.07840538, 0, 0.8901961, 1, 1,
0.07420726, -0.5620868, 3.135914, 0, 0.8862745, 1, 1,
0.07909842, -0.5868229, 2.530733, 0, 0.8784314, 1, 1,
0.07948344, -0.104949, 2.576814, 0, 0.8745098, 1, 1,
0.08265348, 1.357311, 0.9450322, 0, 0.8666667, 1, 1,
0.08611494, 1.812143, 0.4891106, 0, 0.8627451, 1, 1,
0.08667744, -0.3076565, 4.133352, 0, 0.854902, 1, 1,
0.08750795, 0.704996, 0.06125587, 0, 0.8509804, 1, 1,
0.08919766, 1.579597, 0.2478825, 0, 0.8431373, 1, 1,
0.09034456, -1.05822, 3.16297, 0, 0.8392157, 1, 1,
0.09480794, 0.1667674, 1.644657, 0, 0.8313726, 1, 1,
0.09696586, -1.318962, 4.382024, 0, 0.827451, 1, 1,
0.09940126, -0.730305, 2.156711, 0, 0.8196079, 1, 1,
0.1001294, -0.1270686, 3.381396, 0, 0.8156863, 1, 1,
0.1005784, -0.2767698, 3.475597, 0, 0.8078431, 1, 1,
0.1020698, 1.417698, -1.50688, 0, 0.8039216, 1, 1,
0.1029031, -0.481893, 2.459988, 0, 0.7960784, 1, 1,
0.111145, 0.5379109, -0.9820347, 0, 0.7882353, 1, 1,
0.1153741, 0.5357104, -1.094557, 0, 0.7843137, 1, 1,
0.1165799, -1.042713, 3.196748, 0, 0.7764706, 1, 1,
0.1189379, -2.02778, 2.630409, 0, 0.772549, 1, 1,
0.119615, -0.08787867, 1.099154, 0, 0.7647059, 1, 1,
0.1229621, -0.2515824, 2.496237, 0, 0.7607843, 1, 1,
0.1230232, -0.5608467, 3.646823, 0, 0.7529412, 1, 1,
0.1270373, 1.154289, -0.265555, 0, 0.7490196, 1, 1,
0.1306349, -1.91338, 2.952854, 0, 0.7411765, 1, 1,
0.1319811, -0.5282282, 2.669158, 0, 0.7372549, 1, 1,
0.1330907, -0.8438596, 2.363153, 0, 0.7294118, 1, 1,
0.1403905, 0.128784, 0.1781305, 0, 0.7254902, 1, 1,
0.1405468, -0.3545933, 3.952819, 0, 0.7176471, 1, 1,
0.1413143, -0.5047206, 1.421434, 0, 0.7137255, 1, 1,
0.1499564, 0.8476328, 0.1652745, 0, 0.7058824, 1, 1,
0.1556731, 0.12449, 0.742595, 0, 0.6980392, 1, 1,
0.156989, -0.8348752, 2.7136, 0, 0.6941177, 1, 1,
0.1574482, -0.4834161, 3.29602, 0, 0.6862745, 1, 1,
0.1602162, -0.01875829, 3.136683, 0, 0.682353, 1, 1,
0.1609882, -1.418227, 3.931874, 0, 0.6745098, 1, 1,
0.161508, 0.528909, 1.316751, 0, 0.6705883, 1, 1,
0.16266, 2.008276, -0.6276649, 0, 0.6627451, 1, 1,
0.1643046, -0.2314616, 1.078908, 0, 0.6588235, 1, 1,
0.1644266, 0.431707, 0.7203124, 0, 0.6509804, 1, 1,
0.1652131, -0.2573344, 3.31598, 0, 0.6470588, 1, 1,
0.1664547, -0.74702, 3.363897, 0, 0.6392157, 1, 1,
0.1668585, 0.2777846, 0.2843947, 0, 0.6352941, 1, 1,
0.1731322, 1.050208, -0.1035306, 0, 0.627451, 1, 1,
0.1746343, -0.4755979, 1.820077, 0, 0.6235294, 1, 1,
0.1799328, 1.526491, 0.3785976, 0, 0.6156863, 1, 1,
0.1900746, -0.8226414, 2.520503, 0, 0.6117647, 1, 1,
0.190518, -1.540986, 3.440074, 0, 0.6039216, 1, 1,
0.1955182, -0.1494403, 1.584319, 0, 0.5960785, 1, 1,
0.1958635, 0.1754355, 1.012485, 0, 0.5921569, 1, 1,
0.2086524, 0.332137, -0.5342292, 0, 0.5843138, 1, 1,
0.211098, 0.3091832, 1.672231, 0, 0.5803922, 1, 1,
0.2127683, 0.8696527, -1.481371, 0, 0.572549, 1, 1,
0.216545, -0.04500611, 2.124395, 0, 0.5686275, 1, 1,
0.2192927, -1.575968, 2.690092, 0, 0.5607843, 1, 1,
0.2200498, -1.157645, 3.074017, 0, 0.5568628, 1, 1,
0.2213929, 1.043583, 0.5518561, 0, 0.5490196, 1, 1,
0.2220291, -0.4126859, 3.426872, 0, 0.5450981, 1, 1,
0.2223799, -0.9782708, 1.899614, 0, 0.5372549, 1, 1,
0.2311116, 0.1243371, 0.4965071, 0, 0.5333334, 1, 1,
0.2316879, -1.2868, 4.032051, 0, 0.5254902, 1, 1,
0.2360928, -1.682029, 0.8161042, 0, 0.5215687, 1, 1,
0.2372014, -2.142785, 3.084555, 0, 0.5137255, 1, 1,
0.2387416, -0.8062589, 3.527896, 0, 0.509804, 1, 1,
0.2411283, -0.4641709, 1.014454, 0, 0.5019608, 1, 1,
0.2422848, 1.476248, -0.7516962, 0, 0.4941176, 1, 1,
0.2447069, 0.08463738, 2.353922, 0, 0.4901961, 1, 1,
0.2448405, -0.02744208, 2.701163, 0, 0.4823529, 1, 1,
0.2469473, 1.642555, 1.870401, 0, 0.4784314, 1, 1,
0.2507164, 0.545639, 0.1954656, 0, 0.4705882, 1, 1,
0.2534766, 0.2370931, -0.3586727, 0, 0.4666667, 1, 1,
0.2565814, -1.37158, 2.680682, 0, 0.4588235, 1, 1,
0.2581179, 0.2227581, 1.163017, 0, 0.454902, 1, 1,
0.2595221, 1.994364, 0.1817019, 0, 0.4470588, 1, 1,
0.2632518, 0.02958562, 2.34631, 0, 0.4431373, 1, 1,
0.2641499, -0.2499178, 1.334667, 0, 0.4352941, 1, 1,
0.2667982, 0.242645, 2.009324, 0, 0.4313726, 1, 1,
0.2675307, 0.8646625, -0.2677934, 0, 0.4235294, 1, 1,
0.2702052, -0.2706885, 0.9576097, 0, 0.4196078, 1, 1,
0.2751471, -0.325852, 3.127274, 0, 0.4117647, 1, 1,
0.2803475, -0.2143997, 2.023099, 0, 0.4078431, 1, 1,
0.2805299, -0.2884846, 3.684357, 0, 0.4, 1, 1,
0.2834655, -0.0019976, 1.798294, 0, 0.3921569, 1, 1,
0.2893237, 2.912807, -0.9819427, 0, 0.3882353, 1, 1,
0.2896563, -0.8031839, 2.437505, 0, 0.3803922, 1, 1,
0.2947876, 0.8780725, -0.9745115, 0, 0.3764706, 1, 1,
0.3038574, 3.234946, -0.9980449, 0, 0.3686275, 1, 1,
0.3043723, 0.3622133, -0.03706888, 0, 0.3647059, 1, 1,
0.3050778, -0.4327303, 1.495224, 0, 0.3568628, 1, 1,
0.3088498, -0.9256417, 2.650811, 0, 0.3529412, 1, 1,
0.3138798, 0.1482512, 1.647735, 0, 0.345098, 1, 1,
0.3162922, 0.3447408, -0.4334279, 0, 0.3411765, 1, 1,
0.317002, -2.887943, 3.469787, 0, 0.3333333, 1, 1,
0.3181621, 1.498048, -1.761926, 0, 0.3294118, 1, 1,
0.3186383, -0.9361889, 2.556251, 0, 0.3215686, 1, 1,
0.321242, -0.7458664, 2.734158, 0, 0.3176471, 1, 1,
0.3220688, 1.047808, 2.280216, 0, 0.3098039, 1, 1,
0.3232435, -0.6405765, 3.290043, 0, 0.3058824, 1, 1,
0.3285197, -0.464536, 3.059763, 0, 0.2980392, 1, 1,
0.3298832, 0.1553862, 1.085303, 0, 0.2901961, 1, 1,
0.3310668, 0.5085718, 0.233873, 0, 0.2862745, 1, 1,
0.331769, 0.8877287, 1.101111, 0, 0.2784314, 1, 1,
0.3344628, 0.7824739, 1.006467, 0, 0.2745098, 1, 1,
0.3368633, 0.1534744, 1.775054, 0, 0.2666667, 1, 1,
0.3378349, -0.0630092, 1.270583, 0, 0.2627451, 1, 1,
0.340114, -0.003383446, 0.6096575, 0, 0.254902, 1, 1,
0.3449306, 0.5667351, 1.787356, 0, 0.2509804, 1, 1,
0.3517348, -1.132956, 1.607676, 0, 0.2431373, 1, 1,
0.353636, 1.04362, 0.4046555, 0, 0.2392157, 1, 1,
0.3568619, -0.6254563, 1.877995, 0, 0.2313726, 1, 1,
0.358132, -0.8973556, 2.201672, 0, 0.227451, 1, 1,
0.3681531, -0.6838435, 1.5638, 0, 0.2196078, 1, 1,
0.3690844, 0.8956796, 0.8134994, 0, 0.2156863, 1, 1,
0.3744764, -0.6142398, 2.520814, 0, 0.2078431, 1, 1,
0.3777568, -0.4472449, 0.6343971, 0, 0.2039216, 1, 1,
0.3794469, -1.252388, 3.847016, 0, 0.1960784, 1, 1,
0.3821296, 0.2675288, 2.412503, 0, 0.1882353, 1, 1,
0.3829038, 1.191575, 0.3609197, 0, 0.1843137, 1, 1,
0.3830878, 0.496671, 0.09379198, 0, 0.1764706, 1, 1,
0.3831804, 0.3996291, 2.87951, 0, 0.172549, 1, 1,
0.3851639, 1.35581, 0.7817705, 0, 0.1647059, 1, 1,
0.3855032, 0.7970312, -1.396392, 0, 0.1607843, 1, 1,
0.3881807, -2.1994, 3.95706, 0, 0.1529412, 1, 1,
0.3925099, 0.4812079, 0.4150752, 0, 0.1490196, 1, 1,
0.3926699, -0.5213972, 4.115256, 0, 0.1411765, 1, 1,
0.393699, 0.6470984, 0.7319145, 0, 0.1372549, 1, 1,
0.3944842, 1.583607, 0.3414902, 0, 0.1294118, 1, 1,
0.3966731, 0.1552096, 1.563668, 0, 0.1254902, 1, 1,
0.3967288, 1.154053, -0.7502193, 0, 0.1176471, 1, 1,
0.4001369, -0.2385966, 1.507586, 0, 0.1137255, 1, 1,
0.4023134, -0.08229636, 3.614963, 0, 0.1058824, 1, 1,
0.4067286, 0.2975553, -0.1510995, 0, 0.09803922, 1, 1,
0.413333, 2.043575, -0.07798171, 0, 0.09411765, 1, 1,
0.4133399, 2.074035, -1.123808, 0, 0.08627451, 1, 1,
0.4139017, -0.4452459, 2.752344, 0, 0.08235294, 1, 1,
0.415204, 1.350323, 1.685337, 0, 0.07450981, 1, 1,
0.4158318, 0.5770196, 1.682642, 0, 0.07058824, 1, 1,
0.4188152, 0.2747165, 0.3766887, 0, 0.0627451, 1, 1,
0.4236341, 0.2507624, 2.00173, 0, 0.05882353, 1, 1,
0.4245926, 0.636246, 1.82918, 0, 0.05098039, 1, 1,
0.4319794, -1.477696, 2.836638, 0, 0.04705882, 1, 1,
0.4324537, -1.660403, 4.577296, 0, 0.03921569, 1, 1,
0.4338127, -0.2567646, 1.390309, 0, 0.03529412, 1, 1,
0.4362684, 1.123677, 0.07242998, 0, 0.02745098, 1, 1,
0.4418553, 1.55916, 0.3077654, 0, 0.02352941, 1, 1,
0.4487327, -0.2224389, 1.799885, 0, 0.01568628, 1, 1,
0.4494356, 0.4875084, -1.354441, 0, 0.01176471, 1, 1,
0.4527446, -0.5351775, 2.604481, 0, 0.003921569, 1, 1,
0.4536972, -1.027603, 3.319387, 0.003921569, 0, 1, 1,
0.4540658, -1.346956, 2.64553, 0.007843138, 0, 1, 1,
0.4545541, 2.403195, -0.008817385, 0.01568628, 0, 1, 1,
0.4571631, -0.9331878, 3.127603, 0.01960784, 0, 1, 1,
0.4589894, -0.09914515, -0.510832, 0.02745098, 0, 1, 1,
0.4590374, -1.928175, 1.99667, 0.03137255, 0, 1, 1,
0.459578, 2.049088, 0.8632945, 0.03921569, 0, 1, 1,
0.4628132, -0.1843711, 1.94522, 0.04313726, 0, 1, 1,
0.464273, -1.231405, 5.457084, 0.05098039, 0, 1, 1,
0.4667896, -0.003175963, 3.197974, 0.05490196, 0, 1, 1,
0.4720094, -0.3837233, 4.051151, 0.0627451, 0, 1, 1,
0.473268, -1.727017, 3.022109, 0.06666667, 0, 1, 1,
0.4791506, 1.57596, 1.20581, 0.07450981, 0, 1, 1,
0.4836729, -0.2491978, 2.881975, 0.07843138, 0, 1, 1,
0.4845869, 0.985225, 2.054465, 0.08627451, 0, 1, 1,
0.4902185, -0.9402356, 2.823118, 0.09019608, 0, 1, 1,
0.491354, 0.2710935, 1.972459, 0.09803922, 0, 1, 1,
0.4954044, 0.04776872, 2.435184, 0.1058824, 0, 1, 1,
0.4979982, 0.3391749, 1.600797, 0.1098039, 0, 1, 1,
0.4980976, -0.2530775, 1.742471, 0.1176471, 0, 1, 1,
0.49852, 0.7867738, 0.07904603, 0.1215686, 0, 1, 1,
0.4989582, 2.322885, 2.494818, 0.1294118, 0, 1, 1,
0.5011103, -0.4627254, 4.325731, 0.1333333, 0, 1, 1,
0.5035425, -0.5496756, 3.160235, 0.1411765, 0, 1, 1,
0.5121503, 1.273825, 0.3749212, 0.145098, 0, 1, 1,
0.5189862, 0.3123537, 1.106094, 0.1529412, 0, 1, 1,
0.5202136, 1.169628, 0.8703498, 0.1568628, 0, 1, 1,
0.5243609, 0.1268434, 0.1681687, 0.1647059, 0, 1, 1,
0.525417, 0.4892167, 0.05926439, 0.1686275, 0, 1, 1,
0.5270424, -0.6402468, 2.588253, 0.1764706, 0, 1, 1,
0.5287844, -0.1020602, 0.4780486, 0.1803922, 0, 1, 1,
0.5318521, -0.8821525, 2.656471, 0.1882353, 0, 1, 1,
0.536585, 0.9873001, -0.2027588, 0.1921569, 0, 1, 1,
0.5379818, -0.8193958, 4.855055, 0.2, 0, 1, 1,
0.5424463, -0.7810883, 2.755284, 0.2078431, 0, 1, 1,
0.5429909, 2.156191, -0.6642656, 0.2117647, 0, 1, 1,
0.543488, -0.4496164, 1.108337, 0.2196078, 0, 1, 1,
0.5463012, -0.6771719, 1.987903, 0.2235294, 0, 1, 1,
0.5508662, -0.7789106, 2.523691, 0.2313726, 0, 1, 1,
0.5529584, 0.9724873, -0.4912802, 0.2352941, 0, 1, 1,
0.5581719, 0.2865757, 0.5200445, 0.2431373, 0, 1, 1,
0.5583271, -0.2970579, 1.641245, 0.2470588, 0, 1, 1,
0.5633959, -0.09712507, 0.6062809, 0.254902, 0, 1, 1,
0.563879, -0.1690967, 3.209337, 0.2588235, 0, 1, 1,
0.5664219, -0.5660926, 2.531672, 0.2666667, 0, 1, 1,
0.5677832, -1.836643, 2.06395, 0.2705882, 0, 1, 1,
0.5747028, -0.6627634, 3.497236, 0.2784314, 0, 1, 1,
0.5755948, -0.6044064, 1.328634, 0.282353, 0, 1, 1,
0.5788355, 1.986557, 0.5008726, 0.2901961, 0, 1, 1,
0.5797771, -1.054709, 2.541477, 0.2941177, 0, 1, 1,
0.586751, 0.6959022, 1.622505, 0.3019608, 0, 1, 1,
0.588611, -1.251915, 3.897041, 0.3098039, 0, 1, 1,
0.5917299, -2.16027, 2.630921, 0.3137255, 0, 1, 1,
0.6036816, 0.9334142, 0.3904074, 0.3215686, 0, 1, 1,
0.6049241, -0.8256444, 4.80562, 0.3254902, 0, 1, 1,
0.6066673, -1.475723, 2.985136, 0.3333333, 0, 1, 1,
0.6097655, -0.06121603, -0.2194175, 0.3372549, 0, 1, 1,
0.6115412, -0.8410246, 1.074716, 0.345098, 0, 1, 1,
0.6117606, -0.6563474, 2.056784, 0.3490196, 0, 1, 1,
0.6128661, -1.723543, 2.240371, 0.3568628, 0, 1, 1,
0.6160885, 0.223599, 1.526236, 0.3607843, 0, 1, 1,
0.6162156, -2.388754, 1.618541, 0.3686275, 0, 1, 1,
0.6197286, 0.5718365, 1.766703, 0.372549, 0, 1, 1,
0.620033, -2.246533, 2.584525, 0.3803922, 0, 1, 1,
0.6225145, 0.4765013, 0.7669296, 0.3843137, 0, 1, 1,
0.6228698, 0.830612, 0.4092567, 0.3921569, 0, 1, 1,
0.6230412, 0.726451, -0.2957166, 0.3960784, 0, 1, 1,
0.6255665, 0.007839117, 1.19443, 0.4039216, 0, 1, 1,
0.6276261, 0.6098588, 2.085216, 0.4117647, 0, 1, 1,
0.6284487, 0.7604916, 1.676332, 0.4156863, 0, 1, 1,
0.6410367, -0.8768055, 2.669983, 0.4235294, 0, 1, 1,
0.644307, 0.4432509, 2.232567, 0.427451, 0, 1, 1,
0.6473864, 1.525014, -0.5124611, 0.4352941, 0, 1, 1,
0.6580406, 0.4921531, 0.721083, 0.4392157, 0, 1, 1,
0.6746585, 1.092678, -0.9876342, 0.4470588, 0, 1, 1,
0.6757619, 0.6900326, 0.9868554, 0.4509804, 0, 1, 1,
0.6768621, 2.38166, -0.6461743, 0.4588235, 0, 1, 1,
0.6787309, 1.962992, 1.792317, 0.4627451, 0, 1, 1,
0.679123, 0.2085956, 0.3091289, 0.4705882, 0, 1, 1,
0.685575, -0.2032702, 0.6902545, 0.4745098, 0, 1, 1,
0.6868924, 0.162267, 1.566149, 0.4823529, 0, 1, 1,
0.6896532, -0.4442379, 1.85912, 0.4862745, 0, 1, 1,
0.6921468, 1.969115, -0.7317207, 0.4941176, 0, 1, 1,
0.6936868, -2.093934, 3.227533, 0.5019608, 0, 1, 1,
0.7029777, -1.432492, 2.582321, 0.5058824, 0, 1, 1,
0.7043531, 0.291086, 1.171784, 0.5137255, 0, 1, 1,
0.7089248, -0.8556057, 2.187345, 0.5176471, 0, 1, 1,
0.7107978, -1.618747, 0.8498854, 0.5254902, 0, 1, 1,
0.7111871, 0.644815, 0.4677532, 0.5294118, 0, 1, 1,
0.7129565, 0.463646, 0.6761267, 0.5372549, 0, 1, 1,
0.7155511, -0.6270376, 3.489266, 0.5411765, 0, 1, 1,
0.7224041, -0.4351903, -0.1541434, 0.5490196, 0, 1, 1,
0.7305897, -1.71429, 1.854585, 0.5529412, 0, 1, 1,
0.7312919, -0.7655015, 3.212275, 0.5607843, 0, 1, 1,
0.7321253, 0.4028313, -0.5208035, 0.5647059, 0, 1, 1,
0.7322785, 1.38237, 0.7191298, 0.572549, 0, 1, 1,
0.7334738, -0.7566, 2.869251, 0.5764706, 0, 1, 1,
0.7352903, -0.6674154, 3.43112, 0.5843138, 0, 1, 1,
0.73627, 1.01505, -0.0636033, 0.5882353, 0, 1, 1,
0.7373157, -0.7227883, 2.926697, 0.5960785, 0, 1, 1,
0.7446163, 0.5387918, 0.6429721, 0.6039216, 0, 1, 1,
0.746592, 0.124783, 1.882811, 0.6078432, 0, 1, 1,
0.7495345, 0.6576101, 1.016164, 0.6156863, 0, 1, 1,
0.7508127, 0.5561112, 1.714894, 0.6196079, 0, 1, 1,
0.7559802, -0.7923039, 1.520781, 0.627451, 0, 1, 1,
0.7575579, -0.02062342, 0.1243743, 0.6313726, 0, 1, 1,
0.7587543, 2.694729, -1.175354, 0.6392157, 0, 1, 1,
0.7601214, -0.1944898, 2.230297, 0.6431373, 0, 1, 1,
0.7611939, 0.1397924, 1.162668, 0.6509804, 0, 1, 1,
0.7635228, -2.062312, 3.672651, 0.654902, 0, 1, 1,
0.7648161, -3.051911, 1.082449, 0.6627451, 0, 1, 1,
0.7747742, -0.1488029, 0.4162078, 0.6666667, 0, 1, 1,
0.7816905, 0.512755, -0.05338664, 0.6745098, 0, 1, 1,
0.7822388, 0.2581625, 4.02086, 0.6784314, 0, 1, 1,
0.7852444, -0.2594733, 2.21896, 0.6862745, 0, 1, 1,
0.7912693, -2.071394, 1.521977, 0.6901961, 0, 1, 1,
0.7928404, -0.4610055, 2.873187, 0.6980392, 0, 1, 1,
0.7930044, 0.02585027, 1.470028, 0.7058824, 0, 1, 1,
0.7933245, 0.5679972, 2.128662, 0.7098039, 0, 1, 1,
0.8002354, -1.547915, 3.073754, 0.7176471, 0, 1, 1,
0.8043731, 0.09651832, 1.781845, 0.7215686, 0, 1, 1,
0.8057556, -0.01143487, 1.800625, 0.7294118, 0, 1, 1,
0.8075026, 1.494639, 1.466257, 0.7333333, 0, 1, 1,
0.8105397, -1.347059, 1.896296, 0.7411765, 0, 1, 1,
0.8142943, -0.7178145, 3.520641, 0.7450981, 0, 1, 1,
0.8144114, -0.1846954, 1.18573, 0.7529412, 0, 1, 1,
0.815097, -0.2478716, 0.4150605, 0.7568628, 0, 1, 1,
0.816652, -0.4050568, 1.182283, 0.7647059, 0, 1, 1,
0.8198131, -1.229914, 4.334144, 0.7686275, 0, 1, 1,
0.8292479, 1.15608, 0.1029931, 0.7764706, 0, 1, 1,
0.8361989, -1.046633, 3.588423, 0.7803922, 0, 1, 1,
0.8420633, -0.5302482, 1.764533, 0.7882353, 0, 1, 1,
0.8437694, -0.4814252, 2.467307, 0.7921569, 0, 1, 1,
0.8473929, 2.223168, 1.2394, 0.8, 0, 1, 1,
0.8540519, -0.1212841, 3.303985, 0.8078431, 0, 1, 1,
0.8567511, -2.130384, 3.661618, 0.8117647, 0, 1, 1,
0.8607136, -0.8228658, 2.10293, 0.8196079, 0, 1, 1,
0.8612126, -0.7390813, 2.732908, 0.8235294, 0, 1, 1,
0.8641953, 0.1479041, 1.686197, 0.8313726, 0, 1, 1,
0.8652979, -0.7841814, 3.827078, 0.8352941, 0, 1, 1,
0.8733478, 1.947646, 1.483753, 0.8431373, 0, 1, 1,
0.875733, 2.132954, 0.3952479, 0.8470588, 0, 1, 1,
0.8768301, -1.320328, 1.510232, 0.854902, 0, 1, 1,
0.8779983, 0.02247246, 2.403109, 0.8588235, 0, 1, 1,
0.8812407, 3.478064, -0.669164, 0.8666667, 0, 1, 1,
0.883023, 0.1555542, -0.3411086, 0.8705882, 0, 1, 1,
0.8858979, -0.3453252, 2.216449, 0.8784314, 0, 1, 1,
0.8894906, 0.4537074, 0.7999097, 0.8823529, 0, 1, 1,
0.8967652, -1.092661, 0.9483718, 0.8901961, 0, 1, 1,
0.898563, -1.553561, 0.583615, 0.8941177, 0, 1, 1,
0.9024609, 0.4990194, 0.5882709, 0.9019608, 0, 1, 1,
0.9040066, -1.342212, 2.463438, 0.9098039, 0, 1, 1,
0.90618, -0.0159078, 3.360754, 0.9137255, 0, 1, 1,
0.909568, 2.794315, -0.3970849, 0.9215686, 0, 1, 1,
0.9109867, 2.797224, 1.640308, 0.9254902, 0, 1, 1,
0.9133019, -0.06016913, 1.828467, 0.9333333, 0, 1, 1,
0.9140484, -0.319028, 2.475547, 0.9372549, 0, 1, 1,
0.9156122, 0.08699735, 1.074564, 0.945098, 0, 1, 1,
0.9161229, -2.843258, 1.365911, 0.9490196, 0, 1, 1,
0.9165751, -0.5117685, 2.095502, 0.9568627, 0, 1, 1,
0.9173251, 0.7232451, 0.4246882, 0.9607843, 0, 1, 1,
0.9200724, -0.1227346, 3.080883, 0.9686275, 0, 1, 1,
0.9218277, 0.6256351, -0.8505477, 0.972549, 0, 1, 1,
0.9235836, -0.9733428, 3.063329, 0.9803922, 0, 1, 1,
0.9253656, -0.8715364, 2.971642, 0.9843137, 0, 1, 1,
0.9321387, -0.1382062, 0.3570583, 0.9921569, 0, 1, 1,
0.9335818, 0.5530407, -0.4425799, 0.9960784, 0, 1, 1,
0.9336382, 1.793285, -0.5963603, 1, 0, 0.9960784, 1,
0.9368188, -2.453675, 1.932677, 1, 0, 0.9882353, 1,
0.9439075, 0.2654906, 0.963025, 1, 0, 0.9843137, 1,
0.9505406, 0.3048073, 3.475302, 1, 0, 0.9764706, 1,
0.9567987, 1.368262, 1.765213, 1, 0, 0.972549, 1,
0.9629321, -0.2042223, 1.38776, 1, 0, 0.9647059, 1,
0.9656137, 0.9685252, 0.3853496, 1, 0, 0.9607843, 1,
0.9680245, 1.333202, 0.2096263, 1, 0, 0.9529412, 1,
0.9738066, 1.252384, -0.9993289, 1, 0, 0.9490196, 1,
0.9743049, -1.120282, 3.794345, 1, 0, 0.9411765, 1,
0.9749573, 0.4398954, 1.403406, 1, 0, 0.9372549, 1,
0.977142, 0.2875871, 1.521047, 1, 0, 0.9294118, 1,
0.9777528, 0.04183962, -0.5408124, 1, 0, 0.9254902, 1,
0.984069, 0.1272493, 1.288543, 1, 0, 0.9176471, 1,
0.985417, -0.8647003, 4.119506, 1, 0, 0.9137255, 1,
0.985635, -0.2280963, 1.53702, 1, 0, 0.9058824, 1,
0.9903985, -0.4066899, -0.5316657, 1, 0, 0.9019608, 1,
0.9974273, -2.636151, 3.006979, 1, 0, 0.8941177, 1,
1.01733, -0.110892, 1.713866, 1, 0, 0.8862745, 1,
1.019211, 0.01106636, 0.8301187, 1, 0, 0.8823529, 1,
1.020115, -0.1443204, 1.212646, 1, 0, 0.8745098, 1,
1.022571, -1.023354, 2.11279, 1, 0, 0.8705882, 1,
1.024032, 0.7484938, -0.3182079, 1, 0, 0.8627451, 1,
1.024283, -0.2329772, 3.046726, 1, 0, 0.8588235, 1,
1.038469, -0.3973681, 0.5259649, 1, 0, 0.8509804, 1,
1.042155, 0.4561445, 0.4243496, 1, 0, 0.8470588, 1,
1.044103, -0.4113407, 2.352714, 1, 0, 0.8392157, 1,
1.045191, 0.8393236, 0.6832609, 1, 0, 0.8352941, 1,
1.055104, 0.08957446, 1.670509, 1, 0, 0.827451, 1,
1.057016, 1.372943, -1.322408, 1, 0, 0.8235294, 1,
1.058279, 0.2315283, 0.8203335, 1, 0, 0.8156863, 1,
1.062839, -0.1221811, 2.30162, 1, 0, 0.8117647, 1,
1.072957, -0.3530564, 2.414426, 1, 0, 0.8039216, 1,
1.080354, -0.6708286, 1.634692, 1, 0, 0.7960784, 1,
1.084175, 0.2348815, 4.832337, 1, 0, 0.7921569, 1,
1.102754, -1.302051, 1.859045, 1, 0, 0.7843137, 1,
1.103747, -0.4009294, 2.343973, 1, 0, 0.7803922, 1,
1.105731, -2.333131, 4.056679, 1, 0, 0.772549, 1,
1.127449, -0.2131461, 1.140138, 1, 0, 0.7686275, 1,
1.128342, -0.9254197, 3.561945, 1, 0, 0.7607843, 1,
1.129753, -1.442384, 3.655989, 1, 0, 0.7568628, 1,
1.131833, 0.1219905, 1.901196, 1, 0, 0.7490196, 1,
1.135531, 0.3913888, 1.132241, 1, 0, 0.7450981, 1,
1.154319, 0.1310381, 0.5809841, 1, 0, 0.7372549, 1,
1.163962, 0.03772184, 1.932006, 1, 0, 0.7333333, 1,
1.175233, 0.5360782, -0.5564181, 1, 0, 0.7254902, 1,
1.177276, 0.6358296, 2.441742, 1, 0, 0.7215686, 1,
1.182556, -0.09598894, 1.264475, 1, 0, 0.7137255, 1,
1.197447, -0.7306756, 1.867305, 1, 0, 0.7098039, 1,
1.201116, -0.1234268, 1.147544, 1, 0, 0.7019608, 1,
1.203011, -0.2769135, 1.221245, 1, 0, 0.6941177, 1,
1.20873, 1.375326, 1.27317, 1, 0, 0.6901961, 1,
1.217302, -1.645674, -0.2797945, 1, 0, 0.682353, 1,
1.217686, -0.9603105, 3.250423, 1, 0, 0.6784314, 1,
1.217754, 0.926044, 0.9323044, 1, 0, 0.6705883, 1,
1.218852, -0.4342521, 1.773334, 1, 0, 0.6666667, 1,
1.225625, -0.04813443, 0.313456, 1, 0, 0.6588235, 1,
1.22755, -0.3837948, 0.02664284, 1, 0, 0.654902, 1,
1.23681, -1.600392, 1.70824, 1, 0, 0.6470588, 1,
1.240132, 0.6595598, 0.2984067, 1, 0, 0.6431373, 1,
1.244456, -0.3025452, 2.801638, 1, 0, 0.6352941, 1,
1.252123, 0.1256132, 2.078509, 1, 0, 0.6313726, 1,
1.258295, -0.9829193, 2.219497, 1, 0, 0.6235294, 1,
1.260546, -0.04390553, 1.059829, 1, 0, 0.6196079, 1,
1.27398, -0.3128199, 2.511971, 1, 0, 0.6117647, 1,
1.287915, 0.6708426, 1.294448, 1, 0, 0.6078432, 1,
1.290859, 0.235129, 1.615699, 1, 0, 0.6, 1,
1.297534, -0.2253282, 1.918831, 1, 0, 0.5921569, 1,
1.299618, -0.1189015, 1.140924, 1, 0, 0.5882353, 1,
1.302598, -1.673447, 4.215682, 1, 0, 0.5803922, 1,
1.30348, 0.7820792, -0.5707057, 1, 0, 0.5764706, 1,
1.303585, -0.29944, 2.465997, 1, 0, 0.5686275, 1,
1.314544, -1.219914, 2.076802, 1, 0, 0.5647059, 1,
1.317312, 1.593699, 0.9742664, 1, 0, 0.5568628, 1,
1.320377, -0.6565476, 3.460639, 1, 0, 0.5529412, 1,
1.330145, 0.6437762, 0.8862352, 1, 0, 0.5450981, 1,
1.332043, -0.9978769, 3.655443, 1, 0, 0.5411765, 1,
1.343478, 0.3763325, 1.077408, 1, 0, 0.5333334, 1,
1.355628, -0.9844474, 2.987339, 1, 0, 0.5294118, 1,
1.358201, -0.9455461, 2.454311, 1, 0, 0.5215687, 1,
1.360762, 0.191034, 0.3171232, 1, 0, 0.5176471, 1,
1.361098, 0.695255, -0.8154169, 1, 0, 0.509804, 1,
1.369891, 0.04605618, 1.691829, 1, 0, 0.5058824, 1,
1.373411, -0.5262791, -0.4734055, 1, 0, 0.4980392, 1,
1.374659, 0.9005975, -0.126847, 1, 0, 0.4901961, 1,
1.376271, -0.4083844, 2.321996, 1, 0, 0.4862745, 1,
1.37953, 0.1170826, 1.760044, 1, 0, 0.4784314, 1,
1.382644, -0.5841705, 2.927729, 1, 0, 0.4745098, 1,
1.387162, -0.006148499, 0.8813891, 1, 0, 0.4666667, 1,
1.400471, 1.164787, 2.462093, 1, 0, 0.4627451, 1,
1.417834, -1.45085, 2.328909, 1, 0, 0.454902, 1,
1.422178, -1.498079, 1.38332, 1, 0, 0.4509804, 1,
1.438406, -0.9780253, 2.908886, 1, 0, 0.4431373, 1,
1.44477, -0.003675892, 1.105143, 1, 0, 0.4392157, 1,
1.448011, -0.7030681, 3.673756, 1, 0, 0.4313726, 1,
1.462741, 1.76149, 1.529204, 1, 0, 0.427451, 1,
1.469596, -0.9204667, 1.388021, 1, 0, 0.4196078, 1,
1.480905, 0.3326037, 2.807482, 1, 0, 0.4156863, 1,
1.487838, 0.5665139, -0.6621598, 1, 0, 0.4078431, 1,
1.489413, -0.004737004, -0.6575346, 1, 0, 0.4039216, 1,
1.49737, 1.826342, 0.427595, 1, 0, 0.3960784, 1,
1.508977, 0.4700723, 0.9872773, 1, 0, 0.3882353, 1,
1.512044, -1.255737, 0.2544945, 1, 0, 0.3843137, 1,
1.521161, 0.4207867, 0.5047057, 1, 0, 0.3764706, 1,
1.524362, 0.143354, 2.169042, 1, 0, 0.372549, 1,
1.533184, 1.470726, -0.7821574, 1, 0, 0.3647059, 1,
1.543212, 0.8096738, 0.9924006, 1, 0, 0.3607843, 1,
1.55012, -1.296603, 2.834509, 1, 0, 0.3529412, 1,
1.553221, -1.217463, 3.289004, 1, 0, 0.3490196, 1,
1.556188, -0.9212534, 1.922015, 1, 0, 0.3411765, 1,
1.57826, 0.3050462, 2.623889, 1, 0, 0.3372549, 1,
1.582605, 0.3941155, 0.4281338, 1, 0, 0.3294118, 1,
1.584476, -1.26676, 3.28286, 1, 0, 0.3254902, 1,
1.590771, 0.5949054, 0.7619963, 1, 0, 0.3176471, 1,
1.608036, 1.202692, 1.883729, 1, 0, 0.3137255, 1,
1.625997, 2.333, -0.06727113, 1, 0, 0.3058824, 1,
1.626201, -0.002195161, 0.8740533, 1, 0, 0.2980392, 1,
1.649703, 1.670375, -0.2005411, 1, 0, 0.2941177, 1,
1.664769, 0.08985421, 0.87961, 1, 0, 0.2862745, 1,
1.679282, -0.7215505, 0.7870638, 1, 0, 0.282353, 1,
1.687479, 0.07814262, 0.7162619, 1, 0, 0.2745098, 1,
1.717412, -0.4256461, 1.3547, 1, 0, 0.2705882, 1,
1.763081, -1.800527, 3.477659, 1, 0, 0.2627451, 1,
1.77199, 0.4625204, 2.95605, 1, 0, 0.2588235, 1,
1.775626, -0.7189752, 1.355765, 1, 0, 0.2509804, 1,
1.776144, -0.01616232, 1.620094, 1, 0, 0.2470588, 1,
1.792818, -0.9424837, 3.496638, 1, 0, 0.2392157, 1,
1.816464, -0.07518902, 1.764132, 1, 0, 0.2352941, 1,
1.818344, -1.507025, 1.773646, 1, 0, 0.227451, 1,
1.825671, 0.4473946, 1.290805, 1, 0, 0.2235294, 1,
1.844168, -1.256522, 1.402186, 1, 0, 0.2156863, 1,
1.8497, -0.6831533, 0.3578429, 1, 0, 0.2117647, 1,
1.850004, -0.9113287, 2.165405, 1, 0, 0.2039216, 1,
1.850394, 0.6351066, 1.136662, 1, 0, 0.1960784, 1,
1.859331, -0.08157589, 1.158532, 1, 0, 0.1921569, 1,
1.862077, 0.01065743, 0.5091203, 1, 0, 0.1843137, 1,
1.86705, -0.8337169, -0.6517384, 1, 0, 0.1803922, 1,
1.867993, -1.121309, 1.272395, 1, 0, 0.172549, 1,
1.871203, 0.2720783, 2.170034, 1, 0, 0.1686275, 1,
1.89897, 0.5907733, 1.998543, 1, 0, 0.1607843, 1,
1.914469, 0.0293382, 3.029577, 1, 0, 0.1568628, 1,
1.929796, 0.2310232, 0.7039133, 1, 0, 0.1490196, 1,
1.931014, 0.4250823, 2.229443, 1, 0, 0.145098, 1,
1.954754, -2.424617, 4.508316, 1, 0, 0.1372549, 1,
1.961318, -0.2216896, 2.683455, 1, 0, 0.1333333, 1,
1.984661, 0.5098951, 0.9773707, 1, 0, 0.1254902, 1,
1.990238, -0.4228737, 0.7514486, 1, 0, 0.1215686, 1,
1.996175, -0.7810227, 1.61609, 1, 0, 0.1137255, 1,
2.009143, 0.9243174, 0.3257305, 1, 0, 0.1098039, 1,
2.015601, -0.6948178, 2.716815, 1, 0, 0.1019608, 1,
2.025043, 0.594652, 0.4918998, 1, 0, 0.09411765, 1,
2.027494, 0.3707466, 0.3435744, 1, 0, 0.09019608, 1,
2.033263, 1.779102, 1.324652, 1, 0, 0.08235294, 1,
2.03652, -1.863488, 3.199303, 1, 0, 0.07843138, 1,
2.053743, 0.6983281, 4.649888, 1, 0, 0.07058824, 1,
2.076576, -0.547842, 1.2505, 1, 0, 0.06666667, 1,
2.078762, -0.4529352, 3.10702, 1, 0, 0.05882353, 1,
2.110579, -0.9094723, 0.8246127, 1, 0, 0.05490196, 1,
2.176913, -1.509458, 1.848088, 1, 0, 0.04705882, 1,
2.204216, 0.08056042, 3.262133, 1, 0, 0.04313726, 1,
2.364325, 2.158923, 0.7252176, 1, 0, 0.03529412, 1,
2.405512, 0.4766274, 1.921559, 1, 0, 0.03137255, 1,
2.412966, 1.165567, 1.446054, 1, 0, 0.02352941, 1,
2.52201, 1.641319, 2.522372, 1, 0, 0.01960784, 1,
2.596857, -0.5889382, 1.19853, 1, 0, 0.01176471, 1,
2.922648, 2.016976, 1.908818, 1, 0, 0.007843138, 1
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
-0.5129924, -4.443566, -7.232269, 0, -0.5, 0.5, 0.5,
-0.5129924, -4.443566, -7.232269, 1, -0.5, 0.5, 0.5,
-0.5129924, -4.443566, -7.232269, 1, 1.5, 0.5, 0.5,
-0.5129924, -4.443566, -7.232269, 0, 1.5, 0.5, 0.5
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
-5.113315, 0.0913043, -7.232269, 0, -0.5, 0.5, 0.5,
-5.113315, 0.0913043, -7.232269, 1, -0.5, 0.5, 0.5,
-5.113315, 0.0913043, -7.232269, 1, 1.5, 0.5, 0.5,
-5.113315, 0.0913043, -7.232269, 0, 1.5, 0.5, 0.5
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
-5.113315, -4.443566, 0.03196526, 0, -0.5, 0.5, 0.5,
-5.113315, -4.443566, 0.03196526, 1, -0.5, 0.5, 0.5,
-5.113315, -4.443566, 0.03196526, 1, 1.5, 0.5, 0.5,
-5.113315, -4.443566, 0.03196526, 0, 1.5, 0.5, 0.5
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
-3, -3.397058, -5.555907,
2, -3.397058, -5.555907,
-3, -3.397058, -5.555907,
-3, -3.571476, -5.835301,
-2, -3.397058, -5.555907,
-2, -3.571476, -5.835301,
-1, -3.397058, -5.555907,
-1, -3.571476, -5.835301,
0, -3.397058, -5.555907,
0, -3.571476, -5.835301,
1, -3.397058, -5.555907,
1, -3.571476, -5.835301,
2, -3.397058, -5.555907,
2, -3.571476, -5.835301
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
-3, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
-3, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
-3, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
-3, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5,
-2, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
-2, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
-2, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
-2, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5,
-1, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
-1, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
-1, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
-1, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5,
0, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
0, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
0, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
0, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5,
1, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
1, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
1, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
1, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5,
2, -3.920312, -6.394088, 0, -0.5, 0.5, 0.5,
2, -3.920312, -6.394088, 1, -0.5, 0.5, 0.5,
2, -3.920312, -6.394088, 1, 1.5, 0.5, 0.5,
2, -3.920312, -6.394088, 0, 1.5, 0.5, 0.5
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
-4.051702, -3, -5.555907,
-4.051702, 3, -5.555907,
-4.051702, -3, -5.555907,
-4.228637, -3, -5.835301,
-4.051702, -2, -5.555907,
-4.228637, -2, -5.835301,
-4.051702, -1, -5.555907,
-4.228637, -1, -5.835301,
-4.051702, 0, -5.555907,
-4.228637, 0, -5.835301,
-4.051702, 1, -5.555907,
-4.228637, 1, -5.835301,
-4.051702, 2, -5.555907,
-4.228637, 2, -5.835301,
-4.051702, 3, -5.555907,
-4.228637, 3, -5.835301
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
-4.582508, -3, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, -3, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, -3, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, -3, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, -2, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, -2, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, -2, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, -2, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, -1, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, -1, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, -1, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, -1, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, 0, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, 0, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, 0, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, 0, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, 1, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, 1, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, 1, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, 1, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, 2, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, 2, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, 2, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, 2, -6.394088, 0, 1.5, 0.5, 0.5,
-4.582508, 3, -6.394088, 0, -0.5, 0.5, 0.5,
-4.582508, 3, -6.394088, 1, -0.5, 0.5, 0.5,
-4.582508, 3, -6.394088, 1, 1.5, 0.5, 0.5,
-4.582508, 3, -6.394088, 0, 1.5, 0.5, 0.5
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
-4.051702, -3.397058, -4,
-4.051702, -3.397058, 4,
-4.051702, -3.397058, -4,
-4.228637, -3.571476, -4,
-4.051702, -3.397058, -2,
-4.228637, -3.571476, -2,
-4.051702, -3.397058, 0,
-4.228637, -3.571476, 0,
-4.051702, -3.397058, 2,
-4.228637, -3.571476, 2,
-4.051702, -3.397058, 4,
-4.228637, -3.571476, 4
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
-4.582508, -3.920312, -4, 0, -0.5, 0.5, 0.5,
-4.582508, -3.920312, -4, 1, -0.5, 0.5, 0.5,
-4.582508, -3.920312, -4, 1, 1.5, 0.5, 0.5,
-4.582508, -3.920312, -4, 0, 1.5, 0.5, 0.5,
-4.582508, -3.920312, -2, 0, -0.5, 0.5, 0.5,
-4.582508, -3.920312, -2, 1, -0.5, 0.5, 0.5,
-4.582508, -3.920312, -2, 1, 1.5, 0.5, 0.5,
-4.582508, -3.920312, -2, 0, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 0, 0, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 0, 1, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 0, 1, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 0, 0, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 2, 0, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 2, 1, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 2, 1, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 2, 0, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 4, 0, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 4, 1, -0.5, 0.5, 0.5,
-4.582508, -3.920312, 4, 1, 1.5, 0.5, 0.5,
-4.582508, -3.920312, 4, 0, 1.5, 0.5, 0.5
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
-4.051702, -3.397058, -5.555907,
-4.051702, 3.579666, -5.555907,
-4.051702, -3.397058, 5.619838,
-4.051702, 3.579666, 5.619838,
-4.051702, -3.397058, -5.555907,
-4.051702, -3.397058, 5.619838,
-4.051702, 3.579666, -5.555907,
-4.051702, 3.579666, 5.619838,
-4.051702, -3.397058, -5.555907,
3.025717, -3.397058, -5.555907,
-4.051702, -3.397058, 5.619838,
3.025717, -3.397058, 5.619838,
-4.051702, 3.579666, -5.555907,
3.025717, 3.579666, -5.555907,
-4.051702, 3.579666, 5.619838,
3.025717, 3.579666, 5.619838,
3.025717, -3.397058, -5.555907,
3.025717, 3.579666, -5.555907,
3.025717, -3.397058, 5.619838,
3.025717, 3.579666, 5.619838,
3.025717, -3.397058, -5.555907,
3.025717, -3.397058, 5.619838,
3.025717, 3.579666, -5.555907,
3.025717, 3.579666, 5.619838
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
var radius = 7.985854;
var distance = 35.52997;
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
mvMatrix.translate( 0.5129924, -0.0913043, -0.03196526 );
mvMatrix.scale( 1.220002, 1.23761, 0.7726073 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.52997);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
amino_sulfonic_acid<-read.table("amino_sulfonic_acid.xyz")
```

```
## Error in read.table("amino_sulfonic_acid.xyz"): no lines available in input
```

```r
x<-amino_sulfonic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
y<-amino_sulfonic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
z<-amino_sulfonic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
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
-3.948632, 0.1287525, -1.854983, 0, 0, 1, 1, 1,
-3.1048, 0.882925, -1.311766, 1, 0, 0, 1, 1,
-2.951463, 0.137466, -1.593311, 1, 0, 0, 1, 1,
-2.93212, 1.001604, -0.8263217, 1, 0, 0, 1, 1,
-2.811872, 0.7620308, -0.2410392, 1, 0, 0, 1, 1,
-2.670161, 0.2400156, -1.534454, 1, 0, 0, 1, 1,
-2.653219, -0.5205696, -2.199773, 0, 0, 0, 1, 1,
-2.619167, -0.9141947, -2.965049, 0, 0, 0, 1, 1,
-2.604424, 0.7729999, -2.041072, 0, 0, 0, 1, 1,
-2.566699, -0.1551035, 0.2280384, 0, 0, 0, 1, 1,
-2.53647, 0.7586431, -5.042518, 0, 0, 0, 1, 1,
-2.394813, 0.4917568, -3.39816, 0, 0, 0, 1, 1,
-2.370762, -0.5569811, -3.340119, 0, 0, 0, 1, 1,
-2.326518, 0.443849, -1.707008, 1, 1, 1, 1, 1,
-2.316002, 1.90597, -0.02775302, 1, 1, 1, 1, 1,
-2.311416, 0.6148632, -2.26363, 1, 1, 1, 1, 1,
-2.299371, -3.191256, -1.857127, 1, 1, 1, 1, 1,
-2.277298, 0.004210984, -1.249563, 1, 1, 1, 1, 1,
-2.267902, 0.5867059, -2.043336, 1, 1, 1, 1, 1,
-2.260415, -2.065811, 0.9971408, 1, 1, 1, 1, 1,
-2.253303, 0.07291096, -2.156198, 1, 1, 1, 1, 1,
-2.205351, -0.02502045, -0.735377, 1, 1, 1, 1, 1,
-2.188649, -0.2311898, -2.443662, 1, 1, 1, 1, 1,
-2.183749, 1.412561, -2.014842, 1, 1, 1, 1, 1,
-2.171735, 0.0018085, -2.44165, 1, 1, 1, 1, 1,
-2.122372, -2.256758, -1.981863, 1, 1, 1, 1, 1,
-2.103252, 0.6858421, 0.1520767, 1, 1, 1, 1, 1,
-2.094682, 0.2019669, -0.5482494, 1, 1, 1, 1, 1,
-2.088102, -1.099198, -0.8024502, 0, 0, 1, 1, 1,
-2.087121, -0.4271631, -2.14485, 1, 0, 0, 1, 1,
-2.062342, 0.965794, -0.1445056, 1, 0, 0, 1, 1,
-2.012395, 1.424302, 0.3077316, 1, 0, 0, 1, 1,
-2.006008, 0.2968574, -1.765611, 1, 0, 0, 1, 1,
-2.004731, 1.774345, -0.3763534, 1, 0, 0, 1, 1,
-1.917371, -0.8211592, -3.068275, 0, 0, 0, 1, 1,
-1.910201, -1.058846, -1.99887, 0, 0, 0, 1, 1,
-1.899678, 2.984761, -1.550424, 0, 0, 0, 1, 1,
-1.889166, -0.06517347, 0.5917619, 0, 0, 0, 1, 1,
-1.862961, -0.09325916, -1.514164, 0, 0, 0, 1, 1,
-1.825801, 0.8408203, -0.9596592, 0, 0, 0, 1, 1,
-1.81987, 0.1271318, -2.970011, 0, 0, 0, 1, 1,
-1.812371, -0.9082912, -0.9479415, 1, 1, 1, 1, 1,
-1.811705, 0.721524, 0.5354086, 1, 1, 1, 1, 1,
-1.802643, -0.6614712, -1.71052, 1, 1, 1, 1, 1,
-1.798599, -0.7039564, -5.211091, 1, 1, 1, 1, 1,
-1.79226, -0.7889743, -0.9133472, 1, 1, 1, 1, 1,
-1.777956, 0.7542511, -0.6207925, 1, 1, 1, 1, 1,
-1.776425, -0.2737379, -1.618463, 1, 1, 1, 1, 1,
-1.772298, 1.542588, -0.614607, 1, 1, 1, 1, 1,
-1.771889, 0.2745952, -0.2516383, 1, 1, 1, 1, 1,
-1.771677, 0.1232865, -1.505045, 1, 1, 1, 1, 1,
-1.725177, -0.4769384, -1.118088, 1, 1, 1, 1, 1,
-1.723642, 2.336237, -2.057945, 1, 1, 1, 1, 1,
-1.723486, -1.102425, -2.106188, 1, 1, 1, 1, 1,
-1.716022, -0.7379882, -2.931646, 1, 1, 1, 1, 1,
-1.703737, -0.2663373, -1.675961, 1, 1, 1, 1, 1,
-1.700685, 0.9237209, -0.6315073, 0, 0, 1, 1, 1,
-1.699625, 0.2720426, -2.529695, 1, 0, 0, 1, 1,
-1.689007, 2.380936, -0.2653051, 1, 0, 0, 1, 1,
-1.686339, 0.7351241, -1.152368, 1, 0, 0, 1, 1,
-1.685996, 0.7390507, -0.9254665, 1, 0, 0, 1, 1,
-1.684322, 0.9801106, 1.387865, 1, 0, 0, 1, 1,
-1.682584, 0.4289826, 0.7459373, 0, 0, 0, 1, 1,
-1.642276, 0.2787732, -3.734364, 0, 0, 0, 1, 1,
-1.63845, -0.9000902, -0.5704136, 0, 0, 0, 1, 1,
-1.617464, -0.6406679, 0.5515258, 0, 0, 0, 1, 1,
-1.597606, 0.6146381, -1.935599, 0, 0, 0, 1, 1,
-1.591525, 0.04617312, -2.482673, 0, 0, 0, 1, 1,
-1.582483, -1.096078, -3.623953, 0, 0, 0, 1, 1,
-1.575936, 0.5761415, -1.116604, 1, 1, 1, 1, 1,
-1.557031, -0.3748124, -1.403322, 1, 1, 1, 1, 1,
-1.552446, 1.338364, 0.1793049, 1, 1, 1, 1, 1,
-1.550831, 1.024902, -0.139797, 1, 1, 1, 1, 1,
-1.547601, 0.6623455, -2.574089, 1, 1, 1, 1, 1,
-1.541593, 2.854065, 0.1740694, 1, 1, 1, 1, 1,
-1.540063, 0.1865941, -0.8672485, 1, 1, 1, 1, 1,
-1.537744, 0.133589, -2.328079, 1, 1, 1, 1, 1,
-1.535727, 0.4397948, -1.679296, 1, 1, 1, 1, 1,
-1.53535, -0.3005579, -2.869825, 1, 1, 1, 1, 1,
-1.533471, 0.1086765, -2.961607, 1, 1, 1, 1, 1,
-1.519941, -1.216131, -3.842253, 1, 1, 1, 1, 1,
-1.519663, -0.05387798, -2.848914, 1, 1, 1, 1, 1,
-1.517739, -1.148917, -2.244575, 1, 1, 1, 1, 1,
-1.514074, -0.7543989, -1.755456, 1, 1, 1, 1, 1,
-1.501238, 0.4301376, -1.218345, 0, 0, 1, 1, 1,
-1.459394, -0.559886, -2.812511, 1, 0, 0, 1, 1,
-1.449183, -1.316211, -2.80379, 1, 0, 0, 1, 1,
-1.426735, 0.1304847, -1.427795, 1, 0, 0, 1, 1,
-1.42427, -0.9972867, -2.421255, 1, 0, 0, 1, 1,
-1.410258, -0.03005684, -3.005805, 1, 0, 0, 1, 1,
-1.398111, 0.706783, 0.9785973, 0, 0, 0, 1, 1,
-1.396067, 1.521198, 1.843387, 0, 0, 0, 1, 1,
-1.380905, -0.1987036, -2.073978, 0, 0, 0, 1, 1,
-1.379983, 1.213423, -1.448846, 0, 0, 0, 1, 1,
-1.362008, -0.6128143, -3.197136, 0, 0, 0, 1, 1,
-1.35825, 1.516102, -1.831124, 0, 0, 0, 1, 1,
-1.336014, 0.3420482, -1.427055, 0, 0, 0, 1, 1,
-1.334344, 1.460833, -0.1438815, 1, 1, 1, 1, 1,
-1.326624, 1.831546, -1.529438, 1, 1, 1, 1, 1,
-1.317088, 0.06050622, -1.256513, 1, 1, 1, 1, 1,
-1.311647, 1.90246, -2.346957, 1, 1, 1, 1, 1,
-1.310575, -0.9339318, -3.014141, 1, 1, 1, 1, 1,
-1.309408, 0.100431, -1.044095, 1, 1, 1, 1, 1,
-1.309241, 1.631598, -1.086305, 1, 1, 1, 1, 1,
-1.30139, 0.5815183, -1.813871, 1, 1, 1, 1, 1,
-1.301169, 0.5416012, 0.05708575, 1, 1, 1, 1, 1,
-1.301128, 0.251938, -1.041978, 1, 1, 1, 1, 1,
-1.300609, -0.7432001, -2.2451, 1, 1, 1, 1, 1,
-1.298469, -0.07966457, -3.767148, 1, 1, 1, 1, 1,
-1.292603, 1.092105, 0.01065658, 1, 1, 1, 1, 1,
-1.281802, 1.63326, -2.269489, 1, 1, 1, 1, 1,
-1.253775, -0.475185, -1.444833, 1, 1, 1, 1, 1,
-1.253671, -0.1677465, -1.101257, 0, 0, 1, 1, 1,
-1.250743, 0.4135821, -1.114498, 1, 0, 0, 1, 1,
-1.248797, 0.463715, -2.54415, 1, 0, 0, 1, 1,
-1.237683, -1.682344, -2.273456, 1, 0, 0, 1, 1,
-1.229819, 0.4685674, -1.803247, 1, 0, 0, 1, 1,
-1.229203, -0.5139913, -2.801059, 1, 0, 0, 1, 1,
-1.227712, -0.1328631, -1.417372, 0, 0, 0, 1, 1,
-1.22011, 0.4397196, -1.784366, 0, 0, 0, 1, 1,
-1.219951, -0.3449211, -3.362809, 0, 0, 0, 1, 1,
-1.215976, -1.362794, -0.4806966, 0, 0, 0, 1, 1,
-1.206176, 0.5125284, -1.402428, 0, 0, 0, 1, 1,
-1.205575, -0.1552201, -3.082231, 0, 0, 0, 1, 1,
-1.195603, 0.1920025, -2.130552, 0, 0, 0, 1, 1,
-1.188875, -0.1907194, 0.9789248, 1, 1, 1, 1, 1,
-1.182247, -0.8621348, -1.460143, 1, 1, 1, 1, 1,
-1.173535, -0.4555737, -2.628349, 1, 1, 1, 1, 1,
-1.168118, 1.101885, -0.675448, 1, 1, 1, 1, 1,
-1.167918, 1.596462, 0.1325375, 1, 1, 1, 1, 1,
-1.162111, -0.7364073, -2.792702, 1, 1, 1, 1, 1,
-1.154179, -0.3686574, -0.5444342, 1, 1, 1, 1, 1,
-1.152565, 0.267854, -0.4982375, 1, 1, 1, 1, 1,
-1.148259, 0.4521217, -2.088696, 1, 1, 1, 1, 1,
-1.139257, 2.33242, 0.708777, 1, 1, 1, 1, 1,
-1.139143, -0.5287957, -3.635699, 1, 1, 1, 1, 1,
-1.138654, 1.175629, -0.3552009, 1, 1, 1, 1, 1,
-1.135639, -0.4957799, 0.05222872, 1, 1, 1, 1, 1,
-1.128986, 0.1698054, -0.9464121, 1, 1, 1, 1, 1,
-1.119262, 0.4408974, -0.5102224, 1, 1, 1, 1, 1,
-1.113606, -0.4740684, -1.896001, 0, 0, 1, 1, 1,
-1.107935, -1.109661, -1.708233, 1, 0, 0, 1, 1,
-1.086329, -0.6372362, -0.8635794, 1, 0, 0, 1, 1,
-1.084637, 0.412759, -1.430269, 1, 0, 0, 1, 1,
-1.084529, -0.3379162, 0.6474003, 1, 0, 0, 1, 1,
-1.082025, 1.03353, 1.005647, 1, 0, 0, 1, 1,
-1.079082, -0.9223376, -2.987638, 0, 0, 0, 1, 1,
-1.077412, 0.4651497, -0.2041307, 0, 0, 0, 1, 1,
-1.07681, 0.7349129, -1.205337, 0, 0, 0, 1, 1,
-1.062969, 1.884162, -2.452163, 0, 0, 0, 1, 1,
-1.054958, -1.809583, -3.19293, 0, 0, 0, 1, 1,
-1.054934, -2.839858, -2.496923, 0, 0, 0, 1, 1,
-1.054825, -0.7893249, -2.802403, 0, 0, 0, 1, 1,
-1.0493, 0.8665606, -0.9839616, 1, 1, 1, 1, 1,
-1.044513, -0.6930863, -3.572181, 1, 1, 1, 1, 1,
-1.028355, 0.4672579, -0.9758984, 1, 1, 1, 1, 1,
-1.025073, 0.6561925, -1.724611, 1, 1, 1, 1, 1,
-1.024069, -0.6621816, -2.687325, 1, 1, 1, 1, 1,
-1.020664, -0.8089764, -1.717361, 1, 1, 1, 1, 1,
-1.020405, 1.727363, -0.1997945, 1, 1, 1, 1, 1,
-1.017531, 0.5704255, -0.3682576, 1, 1, 1, 1, 1,
-1.009494, -1.885584, -1.750654, 1, 1, 1, 1, 1,
-1.008324, -0.2174414, -1.367974, 1, 1, 1, 1, 1,
-1.005149, 0.3172031, -1.89656, 1, 1, 1, 1, 1,
-1.000823, -0.5352029, -2.888204, 1, 1, 1, 1, 1,
-1.000484, -0.9217086, -2.743278, 1, 1, 1, 1, 1,
-0.9928857, 1.555439, -0.2928228, 1, 1, 1, 1, 1,
-0.9905977, -0.9189858, -3.626569, 1, 1, 1, 1, 1,
-0.9879389, 0.3054683, -2.41813, 0, 0, 1, 1, 1,
-0.9860963, -0.2953395, -1.326855, 1, 0, 0, 1, 1,
-0.9844831, -0.3655979, -2.955413, 1, 0, 0, 1, 1,
-0.984235, -0.7492817, -1.091689, 1, 0, 0, 1, 1,
-0.9779673, 1.253907, -1.769646, 1, 0, 0, 1, 1,
-0.9752266, -0.3830531, 0.04324512, 1, 0, 0, 1, 1,
-0.9734136, 0.08141002, -1.19795, 0, 0, 0, 1, 1,
-0.9680282, -0.4307613, -1.5079, 0, 0, 0, 1, 1,
-0.964571, 1.363363, -0.8567782, 0, 0, 0, 1, 1,
-0.9547035, -1.059976, -1.811635, 0, 0, 0, 1, 1,
-0.9544064, -0.3380567, -3.174169, 0, 0, 0, 1, 1,
-0.9480492, 0.06015105, -1.577813, 0, 0, 0, 1, 1,
-0.9457943, -2.182552, -3.244364, 0, 0, 0, 1, 1,
-0.9328524, 0.8852098, 0.3712417, 1, 1, 1, 1, 1,
-0.9328413, 0.2008489, -2.121451, 1, 1, 1, 1, 1,
-0.931872, 0.8179364, 0.9983957, 1, 1, 1, 1, 1,
-0.9245223, -0.8794702, -0.3385559, 1, 1, 1, 1, 1,
-0.9213231, 1.102337, 0.9402298, 1, 1, 1, 1, 1,
-0.9179696, 0.1485018, -1.957232, 1, 1, 1, 1, 1,
-0.9163673, -0.1351018, -3.480483, 1, 1, 1, 1, 1,
-0.9135635, 1.281821, -0.0805978, 1, 1, 1, 1, 1,
-0.9085761, 1.164578, -2.262092, 1, 1, 1, 1, 1,
-0.9060087, -0.245796, -1.721105, 1, 1, 1, 1, 1,
-0.8949994, 1.419979, -0.729866, 1, 1, 1, 1, 1,
-0.8859894, -1.106824, -1.752925, 1, 1, 1, 1, 1,
-0.8841011, -0.5785068, -0.4965224, 1, 1, 1, 1, 1,
-0.8807505, 0.01355592, -0.6445359, 1, 1, 1, 1, 1,
-0.8757036, -0.5465209, -2.032727, 1, 1, 1, 1, 1,
-0.8744096, -0.01853642, -2.799993, 0, 0, 1, 1, 1,
-0.8632535, 0.01341501, -1.584021, 1, 0, 0, 1, 1,
-0.8550864, 1.234895, -0.9622914, 1, 0, 0, 1, 1,
-0.8503506, -0.2721387, -2.223033, 1, 0, 0, 1, 1,
-0.8438869, -0.1900031, -1.46714, 1, 0, 0, 1, 1,
-0.8416516, 1.218972, 0.5572571, 1, 0, 0, 1, 1,
-0.8406764, -0.4832737, -0.7918175, 0, 0, 0, 1, 1,
-0.8338456, -1.227351, -3.808658, 0, 0, 0, 1, 1,
-0.8338348, -0.2814906, -2.004727, 0, 0, 0, 1, 1,
-0.8327271, -0.4085241, -2.916074, 0, 0, 0, 1, 1,
-0.8312743, 0.3856173, -1.512943, 0, 0, 0, 1, 1,
-0.8299952, 0.1607145, -1.208244, 0, 0, 0, 1, 1,
-0.8290734, -0.238469, -0.7292415, 0, 0, 0, 1, 1,
-0.8258398, -0.5124429, -2.07642, 1, 1, 1, 1, 1,
-0.8238673, 0.8036597, -1.074573, 1, 1, 1, 1, 1,
-0.8198858, 0.944189, -0.06492303, 1, 1, 1, 1, 1,
-0.8174065, 1.529692, 0.3868433, 1, 1, 1, 1, 1,
-0.8155478, 2.199545, 0.0150063, 1, 1, 1, 1, 1,
-0.8065709, -0.2841913, -2.801391, 1, 1, 1, 1, 1,
-0.805605, 1.924141, -2.824547, 1, 1, 1, 1, 1,
-0.8053357, -0.1160129, -1.716654, 1, 1, 1, 1, 1,
-0.8053133, -1.228536, -1.538253, 1, 1, 1, 1, 1,
-0.8040704, -0.797551, -3.73283, 1, 1, 1, 1, 1,
-0.7933856, 0.6772474, -1.463103, 1, 1, 1, 1, 1,
-0.793013, -1.071262, -2.637078, 1, 1, 1, 1, 1,
-0.788316, -0.5346081, -0.8978766, 1, 1, 1, 1, 1,
-0.7877778, -1.096779, -1.203197, 1, 1, 1, 1, 1,
-0.782057, -2.232947, -2.905602, 1, 1, 1, 1, 1,
-0.7815905, -1.718962, -2.670443, 0, 0, 1, 1, 1,
-0.7806106, -0.6157967, -2.191165, 1, 0, 0, 1, 1,
-0.7795165, -0.009725459, -1.238498, 1, 0, 0, 1, 1,
-0.7744948, 0.3755994, -0.2246628, 1, 0, 0, 1, 1,
-0.7732238, -0.6545803, -4.399902, 1, 0, 0, 1, 1,
-0.7672639, -0.09951165, -2.304316, 1, 0, 0, 1, 1,
-0.7638716, 0.09271816, -0.3821965, 0, 0, 0, 1, 1,
-0.7619973, 0.3574867, 0.3549998, 0, 0, 0, 1, 1,
-0.7592482, 0.9411904, 0.3373533, 0, 0, 0, 1, 1,
-0.7550413, 1.026843, -0.5481994, 0, 0, 0, 1, 1,
-0.753751, -0.6767537, -1.547855, 0, 0, 0, 1, 1,
-0.7494718, -0.8162072, -1.73018, 0, 0, 0, 1, 1,
-0.748347, 0.2555838, -2.967063, 0, 0, 0, 1, 1,
-0.7436259, -0.3377529, -2.868579, 1, 1, 1, 1, 1,
-0.7405016, -1.504099, -2.083506, 1, 1, 1, 1, 1,
-0.7304996, -1.790147, -1.906869, 1, 1, 1, 1, 1,
-0.7282048, 0.05892903, -1.146097, 1, 1, 1, 1, 1,
-0.725076, 0.3570931, -0.4528154, 1, 1, 1, 1, 1,
-0.7218962, -0.6569182, -2.491928, 1, 1, 1, 1, 1,
-0.7190464, 0.5598794, -0.7302947, 1, 1, 1, 1, 1,
-0.7023032, -0.2919422, -2.952557, 1, 1, 1, 1, 1,
-0.701602, -0.1051719, -1.949077, 1, 1, 1, 1, 1,
-0.6924834, -0.6719338, -3.676709, 1, 1, 1, 1, 1,
-0.6923913, -0.3780178, -2.653953, 1, 1, 1, 1, 1,
-0.6894522, -0.2381582, -3.467026, 1, 1, 1, 1, 1,
-0.6875216, 0.05264881, -1.816058, 1, 1, 1, 1, 1,
-0.6857787, -1.237197, -1.922488, 1, 1, 1, 1, 1,
-0.6843565, -1.563108, -2.924155, 1, 1, 1, 1, 1,
-0.6842527, -1.240546, -1.720363, 0, 0, 1, 1, 1,
-0.6827165, 0.7881461, -0.03857324, 1, 0, 0, 1, 1,
-0.67641, -0.5432271, -2.449732, 1, 0, 0, 1, 1,
-0.6755268, 1.016503, -0.5696974, 1, 0, 0, 1, 1,
-0.6750305, -0.4338587, -0.710943, 1, 0, 0, 1, 1,
-0.6737355, -0.2063931, -2.547613, 1, 0, 0, 1, 1,
-0.6715381, 0.5253969, -0.3316364, 0, 0, 0, 1, 1,
-0.6674635, 0.7118582, -1.903776, 0, 0, 0, 1, 1,
-0.6562622, 0.09133324, -2.072057, 0, 0, 0, 1, 1,
-0.6522164, -0.2126778, -3.136079, 0, 0, 0, 1, 1,
-0.6504569, -0.5913854, -2.237003, 0, 0, 0, 1, 1,
-0.6415974, -0.6671054, -0.9374408, 0, 0, 0, 1, 1,
-0.6339389, -0.792006, -2.558686, 0, 0, 0, 1, 1,
-0.6305764, 0.07611834, -0.5546499, 1, 1, 1, 1, 1,
-0.6304014, 0.8861139, 0.1716214, 1, 1, 1, 1, 1,
-0.6279526, -0.3863964, -2.50848, 1, 1, 1, 1, 1,
-0.6270069, -1.814407, -3.719714, 1, 1, 1, 1, 1,
-0.6199721, -1.446917, -2.78082, 1, 1, 1, 1, 1,
-0.6175277, -0.1161052, -2.862988, 1, 1, 1, 1, 1,
-0.6157334, 0.4006531, -1.378623, 1, 1, 1, 1, 1,
-0.6156606, 1.190787, 0.7339364, 1, 1, 1, 1, 1,
-0.6103094, -1.734494, -3.305424, 1, 1, 1, 1, 1,
-0.6073287, 0.8190189, -2.07306, 1, 1, 1, 1, 1,
-0.6007087, -0.2350263, -1.992966, 1, 1, 1, 1, 1,
-0.5914651, 1.144226, 0.5431323, 1, 1, 1, 1, 1,
-0.5897924, 1.084019, -0.0863779, 1, 1, 1, 1, 1,
-0.5868432, -0.507221, -2.388617, 1, 1, 1, 1, 1,
-0.5849044, -0.7931787, -1.941808, 1, 1, 1, 1, 1,
-0.5833308, -0.7445074, -4.450261, 0, 0, 1, 1, 1,
-0.5826063, 0.1143365, -2.62517, 1, 0, 0, 1, 1,
-0.5799439, 0.9353919, -1.484176, 1, 0, 0, 1, 1,
-0.5736535, -1.32748, 0.3309503, 1, 0, 0, 1, 1,
-0.5727187, 1.014087, -2.915724, 1, 0, 0, 1, 1,
-0.5645679, 1.00925, -1.45409, 1, 0, 0, 1, 1,
-0.5629429, 1.296618, 2.073245, 0, 0, 0, 1, 1,
-0.5619248, -2.670094, -2.402177, 0, 0, 0, 1, 1,
-0.556761, 0.1524312, -2.288463, 0, 0, 0, 1, 1,
-0.541941, 0.3395564, -0.05740628, 0, 0, 0, 1, 1,
-0.5314621, -0.3929706, -3.957553, 0, 0, 0, 1, 1,
-0.5298023, -0.1681096, -0.3310968, 0, 0, 0, 1, 1,
-0.5276709, -0.7576603, -2.96834, 0, 0, 0, 1, 1,
-0.524911, -0.2012892, -1.573943, 1, 1, 1, 1, 1,
-0.5235528, -0.9251186, -3.1422, 1, 1, 1, 1, 1,
-0.5233104, -0.3561136, -3.363191, 1, 1, 1, 1, 1,
-0.5182587, 1.783789, 0.5087848, 1, 1, 1, 1, 1,
-0.516636, 0.6603602, -0.9223582, 1, 1, 1, 1, 1,
-0.515623, 0.05269665, -1.42449, 1, 1, 1, 1, 1,
-0.5152847, 0.1787996, -1.261348, 1, 1, 1, 1, 1,
-0.5151145, 0.6663595, 1.27696, 1, 1, 1, 1, 1,
-0.5147334, 0.3282431, -0.2006157, 1, 1, 1, 1, 1,
-0.5136121, -0.2574626, -3.626694, 1, 1, 1, 1, 1,
-0.5102224, 0.4616131, -1.712232, 1, 1, 1, 1, 1,
-0.5080977, -2.114432, -3.101049, 1, 1, 1, 1, 1,
-0.5080154, -0.6377282, -2.462828, 1, 1, 1, 1, 1,
-0.4870761, -0.3296812, -3.544292, 1, 1, 1, 1, 1,
-0.4864673, -0.1748829, -3.761227, 1, 1, 1, 1, 1,
-0.4833735, -0.40736, -1.142531, 0, 0, 1, 1, 1,
-0.4832477, -0.5562057, -0.9036509, 1, 0, 0, 1, 1,
-0.4798365, -0.1758076, -2.311077, 1, 0, 0, 1, 1,
-0.4746522, 0.5282385, -1.846798, 1, 0, 0, 1, 1,
-0.4721239, -0.6514719, -2.296274, 1, 0, 0, 1, 1,
-0.472081, 0.7521942, -0.5846605, 1, 0, 0, 1, 1,
-0.4711335, 1.431837, -1.550105, 0, 0, 0, 1, 1,
-0.4673983, -0.3065438, -3.257432, 0, 0, 0, 1, 1,
-0.4658486, -0.1305489, -0.8706905, 0, 0, 0, 1, 1,
-0.4657728, 1.319697, -0.3205545, 0, 0, 0, 1, 1,
-0.4653004, 0.1523876, -0.4889464, 0, 0, 0, 1, 1,
-0.4580667, -0.6434606, -1.526493, 0, 0, 0, 1, 1,
-0.456026, 1.141633, -1.345641, 0, 0, 0, 1, 1,
-0.4547299, -0.41193, -0.440125, 1, 1, 1, 1, 1,
-0.4534387, 0.3354791, -3.032365, 1, 1, 1, 1, 1,
-0.4511981, 1.836015, 0.9787112, 1, 1, 1, 1, 1,
-0.4460346, 0.5903103, -0.1878585, 1, 1, 1, 1, 1,
-0.4457247, 0.4193701, -0.6402388, 1, 1, 1, 1, 1,
-0.4416124, 0.01221117, -0.02129967, 1, 1, 1, 1, 1,
-0.4398399, -1.463456, -1.919115, 1, 1, 1, 1, 1,
-0.4343706, -2.335755, -2.281158, 1, 1, 1, 1, 1,
-0.4334362, -0.3602516, -0.3608595, 1, 1, 1, 1, 1,
-0.4247978, 0.02675754, -1.851736, 1, 1, 1, 1, 1,
-0.4237642, -0.2380239, -1.948549, 1, 1, 1, 1, 1,
-0.4231419, -0.4727733, -2.037406, 1, 1, 1, 1, 1,
-0.4188197, 0.4603751, 0.7520586, 1, 1, 1, 1, 1,
-0.4179972, 0.2850817, -0.5863305, 1, 1, 1, 1, 1,
-0.4172744, 0.09884013, -0.7114539, 1, 1, 1, 1, 1,
-0.4158448, 1.367301, 0.4352252, 0, 0, 1, 1, 1,
-0.4116974, 0.4523248, 0.8532224, 1, 0, 0, 1, 1,
-0.4078909, -1.775875, -1.572931, 1, 0, 0, 1, 1,
-0.4071239, -0.3361184, -2.543121, 1, 0, 0, 1, 1,
-0.4025723, 0.2284944, 0.4854186, 1, 0, 0, 1, 1,
-0.3887971, 1.643298, -0.3312013, 1, 0, 0, 1, 1,
-0.3854797, 1.436632, 1.519152, 0, 0, 0, 1, 1,
-0.3843222, -0.3877121, -2.14697, 0, 0, 0, 1, 1,
-0.3831251, -0.7320235, -1.274588, 0, 0, 0, 1, 1,
-0.3779559, 0.04108207, -1.448037, 0, 0, 0, 1, 1,
-0.3703188, 1.508933, 0.440868, 0, 0, 0, 1, 1,
-0.3655124, 1.163263, -1.741714, 0, 0, 0, 1, 1,
-0.3585304, 2.272396, 1.490054, 0, 0, 0, 1, 1,
-0.3568664, 0.8606545, -0.2742501, 1, 1, 1, 1, 1,
-0.3547813, -0.4043229, -2.6519, 1, 1, 1, 1, 1,
-0.3470036, -0.414831, -2.623053, 1, 1, 1, 1, 1,
-0.341542, 0.4436949, -0.5173327, 1, 1, 1, 1, 1,
-0.3349002, 1.261656, -0.1408646, 1, 1, 1, 1, 1,
-0.3337996, -0.3096856, -0.7912017, 1, 1, 1, 1, 1,
-0.3324444, 0.8790719, -0.5895869, 1, 1, 1, 1, 1,
-0.3321414, 0.8202941, -1.503011, 1, 1, 1, 1, 1,
-0.3312925, 0.2403053, -1.145926, 1, 1, 1, 1, 1,
-0.3290396, 2.213428, 0.01676332, 1, 1, 1, 1, 1,
-0.3286418, 1.455506, -0.8537464, 1, 1, 1, 1, 1,
-0.323817, 0.1608446, -1.158676, 1, 1, 1, 1, 1,
-0.3183732, -2.1216, -3.51141, 1, 1, 1, 1, 1,
-0.3134807, -0.5795623, -3.440834, 1, 1, 1, 1, 1,
-0.312808, -0.9631259, -3.225451, 1, 1, 1, 1, 1,
-0.3121002, 1.388259, 0.5266691, 0, 0, 1, 1, 1,
-0.3120432, -0.674691, -3.637522, 1, 0, 0, 1, 1,
-0.3091905, 0.6115462, -0.04252932, 1, 0, 0, 1, 1,
-0.3082569, -0.1316116, -2.967371, 1, 0, 0, 1, 1,
-0.307722, 0.6199968, 0.003413945, 1, 0, 0, 1, 1,
-0.3008668, 1.236898, 1.003645, 1, 0, 0, 1, 1,
-0.3007141, 0.4894656, -1.673357, 0, 0, 0, 1, 1,
-0.2930519, -0.3816356, -3.206947, 0, 0, 0, 1, 1,
-0.2921638, 1.284392, 0.003869843, 0, 0, 0, 1, 1,
-0.2913019, -0.5500783, -2.043164, 0, 0, 0, 1, 1,
-0.2910621, 0.229935, -0.4550219, 0, 0, 0, 1, 1,
-0.285006, 0.05187873, -1.983658, 0, 0, 0, 1, 1,
-0.2840517, -0.4253067, -4.503619, 0, 0, 0, 1, 1,
-0.279541, -0.6052132, -3.014029, 1, 1, 1, 1, 1,
-0.2792594, -0.6392536, -1.725876, 1, 1, 1, 1, 1,
-0.2790512, -1.785448, -1.619787, 1, 1, 1, 1, 1,
-0.2768272, -3.295455, -4.019376, 1, 1, 1, 1, 1,
-0.2708456, 0.4889363, -0.4158655, 1, 1, 1, 1, 1,
-0.2699905, -0.6233356, -3.1755, 1, 1, 1, 1, 1,
-0.2668047, 0.2692183, -1.556549, 1, 1, 1, 1, 1,
-0.2661291, -0.005144574, -1.938217, 1, 1, 1, 1, 1,
-0.2634571, 0.1800071, -1.954605, 1, 1, 1, 1, 1,
-0.2633097, 0.1114331, -1.106643, 1, 1, 1, 1, 1,
-0.2561801, -1.287894, -4.542959, 1, 1, 1, 1, 1,
-0.2530918, -1.244262, -4.913902, 1, 1, 1, 1, 1,
-0.2473795, 0.8523616, -1.281921, 1, 1, 1, 1, 1,
-0.2463388, -0.1198848, -1.52279, 1, 1, 1, 1, 1,
-0.2413899, 0.05893886, -0.7576361, 1, 1, 1, 1, 1,
-0.236663, 0.7803595, -1.371152, 0, 0, 1, 1, 1,
-0.2273212, -0.6390387, -0.9253431, 1, 0, 0, 1, 1,
-0.2237185, 0.4181879, 0.1533471, 1, 0, 0, 1, 1,
-0.2169935, -0.5205923, -3.101048, 1, 0, 0, 1, 1,
-0.2140558, 0.6557482, -0.7687571, 1, 0, 0, 1, 1,
-0.2117302, 0.9538844, -0.9774543, 1, 0, 0, 1, 1,
-0.2106831, 0.2213522, -1.412768, 0, 0, 0, 1, 1,
-0.2106635, -0.7536808, -2.712605, 0, 0, 0, 1, 1,
-0.2099613, 0.5285637, 0.09607361, 0, 0, 0, 1, 1,
-0.2083307, -0.254732, -3.469133, 0, 0, 0, 1, 1,
-0.2059137, -0.5147311, -1.744471, 0, 0, 0, 1, 1,
-0.2020963, -0.5791481, -2.206099, 0, 0, 0, 1, 1,
-0.2005754, 0.6208186, -0.9249642, 0, 0, 0, 1, 1,
-0.1970121, -1.013255, -4.852314, 1, 1, 1, 1, 1,
-0.1951409, -0.1638842, -2.969024, 1, 1, 1, 1, 1,
-0.1946275, -1.560216, -2.285299, 1, 1, 1, 1, 1,
-0.1932719, -1.544582, -2.071126, 1, 1, 1, 1, 1,
-0.1883076, 0.6918305, -0.6437054, 1, 1, 1, 1, 1,
-0.1877981, 0.6741998, -1.238929, 1, 1, 1, 1, 1,
-0.1860112, 0.6146571, 0.2854575, 1, 1, 1, 1, 1,
-0.1843284, 0.7395694, 0.01810926, 1, 1, 1, 1, 1,
-0.1813401, 0.4039259, 0.6593367, 1, 1, 1, 1, 1,
-0.1803913, 1.32619, -1.86672, 1, 1, 1, 1, 1,
-0.1802283, -0.2481985, -1.904307, 1, 1, 1, 1, 1,
-0.1797158, 0.3305057, -0.548327, 1, 1, 1, 1, 1,
-0.1794733, 0.5198975, -0.9064827, 1, 1, 1, 1, 1,
-0.1744263, -0.01028046, -1.417289, 1, 1, 1, 1, 1,
-0.1692345, -0.3029449, -3.276229, 1, 1, 1, 1, 1,
-0.1674456, -1.34316, -2.496856, 0, 0, 1, 1, 1,
-0.1617362, 0.03763288, 0.3228627, 1, 0, 0, 1, 1,
-0.1595732, -0.07847401, -2.466555, 1, 0, 0, 1, 1,
-0.1580135, 0.01511696, -0.6502589, 1, 0, 0, 1, 1,
-0.1571233, 0.3051965, 0.8884614, 1, 0, 0, 1, 1,
-0.1544164, -0.9505351, -2.589952, 1, 0, 0, 1, 1,
-0.1537089, -1.953822, -2.713661, 0, 0, 0, 1, 1,
-0.1527821, -1.239392, -3.301001, 0, 0, 0, 1, 1,
-0.1512647, 1.395753, -0.8386662, 0, 0, 0, 1, 1,
-0.1486378, 1.120393, -0.983328, 0, 0, 0, 1, 1,
-0.1467054, -0.5571024, -3.837358, 0, 0, 0, 1, 1,
-0.1465678, -0.3493082, -2.98048, 0, 0, 0, 1, 1,
-0.1411639, 0.1834263, -1.260687, 0, 0, 0, 1, 1,
-0.1397126, 0.1334403, -0.9420732, 1, 1, 1, 1, 1,
-0.128531, 0.657933, 0.1749806, 1, 1, 1, 1, 1,
-0.1264579, 0.7789823, 0.873136, 1, 1, 1, 1, 1,
-0.1262695, -0.74264, -2.1863, 1, 1, 1, 1, 1,
-0.1253684, -0.9104886, -4.597245, 1, 1, 1, 1, 1,
-0.1187947, 0.194161, -0.1714847, 1, 1, 1, 1, 1,
-0.116834, 0.5354331, -1.934085, 1, 1, 1, 1, 1,
-0.1122437, 0.6232873, -0.7033658, 1, 1, 1, 1, 1,
-0.1105007, 0.445198, 0.1726972, 1, 1, 1, 1, 1,
-0.1088852, 1.88721, -0.6761903, 1, 1, 1, 1, 1,
-0.09819212, -0.5283236, -3.184687, 1, 1, 1, 1, 1,
-0.09657603, -0.216971, -2.905457, 1, 1, 1, 1, 1,
-0.0964678, -1.068498, -1.798631, 1, 1, 1, 1, 1,
-0.09408356, 0.424767, -0.02082203, 1, 1, 1, 1, 1,
-0.09402264, -1.834635, -5.393154, 1, 1, 1, 1, 1,
-0.09275797, 1.249035, -2.241749, 0, 0, 1, 1, 1,
-0.08723677, 0.3334026, -0.6674608, 1, 0, 0, 1, 1,
-0.0858236, 0.8197784, 0.1405573, 1, 0, 0, 1, 1,
-0.08080178, 0.04698992, 0.1624682, 1, 0, 0, 1, 1,
-0.08044077, 0.07531269, -1.268768, 1, 0, 0, 1, 1,
-0.07872888, -0.7688317, -1.324095, 1, 0, 0, 1, 1,
-0.07739551, -1.697284, -2.317851, 0, 0, 0, 1, 1,
-0.07583285, 0.4442792, 1.651515, 0, 0, 0, 1, 1,
-0.07557699, 2.412503, 0.1848305, 0, 0, 0, 1, 1,
-0.07484136, 0.8149424, 0.5115016, 0, 0, 0, 1, 1,
-0.07304221, -0.1076872, -1.28258, 0, 0, 0, 1, 1,
-0.06820458, -1.539459, -2.810506, 0, 0, 0, 1, 1,
-0.06067838, -0.7922811, -2.710561, 0, 0, 0, 1, 1,
-0.05915429, -1.361171, -1.782914, 1, 1, 1, 1, 1,
-0.05702587, 0.5571854, 1.282941, 1, 1, 1, 1, 1,
-0.0563713, -0.5251486, -2.87395, 1, 1, 1, 1, 1,
-0.05248939, 1.11608, -0.1802207, 1, 1, 1, 1, 1,
-0.05105647, -0.0005384675, -2.027109, 1, 1, 1, 1, 1,
-0.05050937, -0.9786633, -3.124057, 1, 1, 1, 1, 1,
-0.04768705, -0.01474117, -2.810108, 1, 1, 1, 1, 1,
-0.04720031, 0.5804431, 0.6342742, 1, 1, 1, 1, 1,
-0.04415867, 1.055824, -0.4875614, 1, 1, 1, 1, 1,
-0.04220924, -0.809738, -3.476001, 1, 1, 1, 1, 1,
-0.04080193, -0.1205486, -2.594192, 1, 1, 1, 1, 1,
-0.03745155, 0.4237505, -0.1733381, 1, 1, 1, 1, 1,
-0.03732267, -0.08745058, -2.536881, 1, 1, 1, 1, 1,
-0.03632867, -0.52595, -4.152065, 1, 1, 1, 1, 1,
-0.02986493, -0.3941503, -2.946419, 1, 1, 1, 1, 1,
-0.02834275, 2.034451, 0.9511593, 0, 0, 1, 1, 1,
-0.02693696, -0.3240008, -4.185512, 1, 0, 0, 1, 1,
-0.02561522, 1.056452, 1.80104, 1, 0, 0, 1, 1,
-0.02198877, 2.143953, 1.69879, 1, 0, 0, 1, 1,
-0.0202174, -0.2107098, -3.291433, 1, 0, 0, 1, 1,
-0.01384371, -0.5329026, -2.374646, 1, 0, 0, 1, 1,
-0.01008467, -0.2205891, -4.724361, 0, 0, 0, 1, 1,
-0.007887307, -0.3622618, -3.231302, 0, 0, 0, 1, 1,
-0.007600859, -1.063464, -2.592408, 0, 0, 0, 1, 1,
-0.003813828, 0.2871924, -0.04391274, 0, 0, 0, 1, 1,
0.0004435957, 0.01205188, -1.50482, 0, 0, 0, 1, 1,
0.002336328, -0.1149706, 2.181428, 0, 0, 0, 1, 1,
0.00259702, 1.861575, -0.4035085, 0, 0, 0, 1, 1,
0.00588846, 2.069917, 0.3999802, 1, 1, 1, 1, 1,
0.005970057, 1.303432, -0.01100825, 1, 1, 1, 1, 1,
0.008884635, 1.129382, -0.4704047, 1, 1, 1, 1, 1,
0.009918016, -1.921407, 1.249773, 1, 1, 1, 1, 1,
0.01122359, -0.4985758, 2.858673, 1, 1, 1, 1, 1,
0.01143541, 0.6169862, 0.6748717, 1, 1, 1, 1, 1,
0.01202757, 1.994188, -0.1866235, 1, 1, 1, 1, 1,
0.01429853, 0.3562788, 0.4095958, 1, 1, 1, 1, 1,
0.01831489, 0.9336541, 0.3721078, 1, 1, 1, 1, 1,
0.02508256, -0.3810464, 3.087699, 1, 1, 1, 1, 1,
0.02610452, 1.965316, -1.288548, 1, 1, 1, 1, 1,
0.03489253, -0.5644185, 3.386191, 1, 1, 1, 1, 1,
0.03583563, 0.1930589, 0.9029813, 1, 1, 1, 1, 1,
0.04599968, -0.4794297, 3.9436, 1, 1, 1, 1, 1,
0.04822005, -0.6674953, 2.050439, 1, 1, 1, 1, 1,
0.04825239, -1.256474, 2.694901, 0, 0, 1, 1, 1,
0.05259047, -0.4333963, 4.435435, 1, 0, 0, 1, 1,
0.05616146, 2.287518, 0.5967099, 1, 0, 0, 1, 1,
0.05625549, 1.089983, 0.05153302, 1, 0, 0, 1, 1,
0.05629775, -1.002048, 1.678138, 1, 0, 0, 1, 1,
0.06070121, 0.4684804, 0.118255, 1, 0, 0, 1, 1,
0.06239427, -1.571939, 3.784003, 0, 0, 0, 1, 1,
0.0646226, 0.1223264, -0.1209336, 0, 0, 0, 1, 1,
0.06573819, 0.3982287, -0.3834118, 0, 0, 0, 1, 1,
0.06577706, 0.2325599, 0.1822957, 0, 0, 0, 1, 1,
0.06786592, 0.3482081, 0.1064606, 0, 0, 0, 1, 1,
0.06896882, -0.02772679, 1.904245, 0, 0, 0, 1, 1,
0.07096717, -0.5416098, 2.56251, 0, 0, 0, 1, 1,
0.07200174, 0.1817243, 1.63406, 1, 1, 1, 1, 1,
0.07282515, 0.4670188, 0.07840538, 1, 1, 1, 1, 1,
0.07420726, -0.5620868, 3.135914, 1, 1, 1, 1, 1,
0.07909842, -0.5868229, 2.530733, 1, 1, 1, 1, 1,
0.07948344, -0.104949, 2.576814, 1, 1, 1, 1, 1,
0.08265348, 1.357311, 0.9450322, 1, 1, 1, 1, 1,
0.08611494, 1.812143, 0.4891106, 1, 1, 1, 1, 1,
0.08667744, -0.3076565, 4.133352, 1, 1, 1, 1, 1,
0.08750795, 0.704996, 0.06125587, 1, 1, 1, 1, 1,
0.08919766, 1.579597, 0.2478825, 1, 1, 1, 1, 1,
0.09034456, -1.05822, 3.16297, 1, 1, 1, 1, 1,
0.09480794, 0.1667674, 1.644657, 1, 1, 1, 1, 1,
0.09696586, -1.318962, 4.382024, 1, 1, 1, 1, 1,
0.09940126, -0.730305, 2.156711, 1, 1, 1, 1, 1,
0.1001294, -0.1270686, 3.381396, 1, 1, 1, 1, 1,
0.1005784, -0.2767698, 3.475597, 0, 0, 1, 1, 1,
0.1020698, 1.417698, -1.50688, 1, 0, 0, 1, 1,
0.1029031, -0.481893, 2.459988, 1, 0, 0, 1, 1,
0.111145, 0.5379109, -0.9820347, 1, 0, 0, 1, 1,
0.1153741, 0.5357104, -1.094557, 1, 0, 0, 1, 1,
0.1165799, -1.042713, 3.196748, 1, 0, 0, 1, 1,
0.1189379, -2.02778, 2.630409, 0, 0, 0, 1, 1,
0.119615, -0.08787867, 1.099154, 0, 0, 0, 1, 1,
0.1229621, -0.2515824, 2.496237, 0, 0, 0, 1, 1,
0.1230232, -0.5608467, 3.646823, 0, 0, 0, 1, 1,
0.1270373, 1.154289, -0.265555, 0, 0, 0, 1, 1,
0.1306349, -1.91338, 2.952854, 0, 0, 0, 1, 1,
0.1319811, -0.5282282, 2.669158, 0, 0, 0, 1, 1,
0.1330907, -0.8438596, 2.363153, 1, 1, 1, 1, 1,
0.1403905, 0.128784, 0.1781305, 1, 1, 1, 1, 1,
0.1405468, -0.3545933, 3.952819, 1, 1, 1, 1, 1,
0.1413143, -0.5047206, 1.421434, 1, 1, 1, 1, 1,
0.1499564, 0.8476328, 0.1652745, 1, 1, 1, 1, 1,
0.1556731, 0.12449, 0.742595, 1, 1, 1, 1, 1,
0.156989, -0.8348752, 2.7136, 1, 1, 1, 1, 1,
0.1574482, -0.4834161, 3.29602, 1, 1, 1, 1, 1,
0.1602162, -0.01875829, 3.136683, 1, 1, 1, 1, 1,
0.1609882, -1.418227, 3.931874, 1, 1, 1, 1, 1,
0.161508, 0.528909, 1.316751, 1, 1, 1, 1, 1,
0.16266, 2.008276, -0.6276649, 1, 1, 1, 1, 1,
0.1643046, -0.2314616, 1.078908, 1, 1, 1, 1, 1,
0.1644266, 0.431707, 0.7203124, 1, 1, 1, 1, 1,
0.1652131, -0.2573344, 3.31598, 1, 1, 1, 1, 1,
0.1664547, -0.74702, 3.363897, 0, 0, 1, 1, 1,
0.1668585, 0.2777846, 0.2843947, 1, 0, 0, 1, 1,
0.1731322, 1.050208, -0.1035306, 1, 0, 0, 1, 1,
0.1746343, -0.4755979, 1.820077, 1, 0, 0, 1, 1,
0.1799328, 1.526491, 0.3785976, 1, 0, 0, 1, 1,
0.1900746, -0.8226414, 2.520503, 1, 0, 0, 1, 1,
0.190518, -1.540986, 3.440074, 0, 0, 0, 1, 1,
0.1955182, -0.1494403, 1.584319, 0, 0, 0, 1, 1,
0.1958635, 0.1754355, 1.012485, 0, 0, 0, 1, 1,
0.2086524, 0.332137, -0.5342292, 0, 0, 0, 1, 1,
0.211098, 0.3091832, 1.672231, 0, 0, 0, 1, 1,
0.2127683, 0.8696527, -1.481371, 0, 0, 0, 1, 1,
0.216545, -0.04500611, 2.124395, 0, 0, 0, 1, 1,
0.2192927, -1.575968, 2.690092, 1, 1, 1, 1, 1,
0.2200498, -1.157645, 3.074017, 1, 1, 1, 1, 1,
0.2213929, 1.043583, 0.5518561, 1, 1, 1, 1, 1,
0.2220291, -0.4126859, 3.426872, 1, 1, 1, 1, 1,
0.2223799, -0.9782708, 1.899614, 1, 1, 1, 1, 1,
0.2311116, 0.1243371, 0.4965071, 1, 1, 1, 1, 1,
0.2316879, -1.2868, 4.032051, 1, 1, 1, 1, 1,
0.2360928, -1.682029, 0.8161042, 1, 1, 1, 1, 1,
0.2372014, -2.142785, 3.084555, 1, 1, 1, 1, 1,
0.2387416, -0.8062589, 3.527896, 1, 1, 1, 1, 1,
0.2411283, -0.4641709, 1.014454, 1, 1, 1, 1, 1,
0.2422848, 1.476248, -0.7516962, 1, 1, 1, 1, 1,
0.2447069, 0.08463738, 2.353922, 1, 1, 1, 1, 1,
0.2448405, -0.02744208, 2.701163, 1, 1, 1, 1, 1,
0.2469473, 1.642555, 1.870401, 1, 1, 1, 1, 1,
0.2507164, 0.545639, 0.1954656, 0, 0, 1, 1, 1,
0.2534766, 0.2370931, -0.3586727, 1, 0, 0, 1, 1,
0.2565814, -1.37158, 2.680682, 1, 0, 0, 1, 1,
0.2581179, 0.2227581, 1.163017, 1, 0, 0, 1, 1,
0.2595221, 1.994364, 0.1817019, 1, 0, 0, 1, 1,
0.2632518, 0.02958562, 2.34631, 1, 0, 0, 1, 1,
0.2641499, -0.2499178, 1.334667, 0, 0, 0, 1, 1,
0.2667982, 0.242645, 2.009324, 0, 0, 0, 1, 1,
0.2675307, 0.8646625, -0.2677934, 0, 0, 0, 1, 1,
0.2702052, -0.2706885, 0.9576097, 0, 0, 0, 1, 1,
0.2751471, -0.325852, 3.127274, 0, 0, 0, 1, 1,
0.2803475, -0.2143997, 2.023099, 0, 0, 0, 1, 1,
0.2805299, -0.2884846, 3.684357, 0, 0, 0, 1, 1,
0.2834655, -0.0019976, 1.798294, 1, 1, 1, 1, 1,
0.2893237, 2.912807, -0.9819427, 1, 1, 1, 1, 1,
0.2896563, -0.8031839, 2.437505, 1, 1, 1, 1, 1,
0.2947876, 0.8780725, -0.9745115, 1, 1, 1, 1, 1,
0.3038574, 3.234946, -0.9980449, 1, 1, 1, 1, 1,
0.3043723, 0.3622133, -0.03706888, 1, 1, 1, 1, 1,
0.3050778, -0.4327303, 1.495224, 1, 1, 1, 1, 1,
0.3088498, -0.9256417, 2.650811, 1, 1, 1, 1, 1,
0.3138798, 0.1482512, 1.647735, 1, 1, 1, 1, 1,
0.3162922, 0.3447408, -0.4334279, 1, 1, 1, 1, 1,
0.317002, -2.887943, 3.469787, 1, 1, 1, 1, 1,
0.3181621, 1.498048, -1.761926, 1, 1, 1, 1, 1,
0.3186383, -0.9361889, 2.556251, 1, 1, 1, 1, 1,
0.321242, -0.7458664, 2.734158, 1, 1, 1, 1, 1,
0.3220688, 1.047808, 2.280216, 1, 1, 1, 1, 1,
0.3232435, -0.6405765, 3.290043, 0, 0, 1, 1, 1,
0.3285197, -0.464536, 3.059763, 1, 0, 0, 1, 1,
0.3298832, 0.1553862, 1.085303, 1, 0, 0, 1, 1,
0.3310668, 0.5085718, 0.233873, 1, 0, 0, 1, 1,
0.331769, 0.8877287, 1.101111, 1, 0, 0, 1, 1,
0.3344628, 0.7824739, 1.006467, 1, 0, 0, 1, 1,
0.3368633, 0.1534744, 1.775054, 0, 0, 0, 1, 1,
0.3378349, -0.0630092, 1.270583, 0, 0, 0, 1, 1,
0.340114, -0.003383446, 0.6096575, 0, 0, 0, 1, 1,
0.3449306, 0.5667351, 1.787356, 0, 0, 0, 1, 1,
0.3517348, -1.132956, 1.607676, 0, 0, 0, 1, 1,
0.353636, 1.04362, 0.4046555, 0, 0, 0, 1, 1,
0.3568619, -0.6254563, 1.877995, 0, 0, 0, 1, 1,
0.358132, -0.8973556, 2.201672, 1, 1, 1, 1, 1,
0.3681531, -0.6838435, 1.5638, 1, 1, 1, 1, 1,
0.3690844, 0.8956796, 0.8134994, 1, 1, 1, 1, 1,
0.3744764, -0.6142398, 2.520814, 1, 1, 1, 1, 1,
0.3777568, -0.4472449, 0.6343971, 1, 1, 1, 1, 1,
0.3794469, -1.252388, 3.847016, 1, 1, 1, 1, 1,
0.3821296, 0.2675288, 2.412503, 1, 1, 1, 1, 1,
0.3829038, 1.191575, 0.3609197, 1, 1, 1, 1, 1,
0.3830878, 0.496671, 0.09379198, 1, 1, 1, 1, 1,
0.3831804, 0.3996291, 2.87951, 1, 1, 1, 1, 1,
0.3851639, 1.35581, 0.7817705, 1, 1, 1, 1, 1,
0.3855032, 0.7970312, -1.396392, 1, 1, 1, 1, 1,
0.3881807, -2.1994, 3.95706, 1, 1, 1, 1, 1,
0.3925099, 0.4812079, 0.4150752, 1, 1, 1, 1, 1,
0.3926699, -0.5213972, 4.115256, 1, 1, 1, 1, 1,
0.393699, 0.6470984, 0.7319145, 0, 0, 1, 1, 1,
0.3944842, 1.583607, 0.3414902, 1, 0, 0, 1, 1,
0.3966731, 0.1552096, 1.563668, 1, 0, 0, 1, 1,
0.3967288, 1.154053, -0.7502193, 1, 0, 0, 1, 1,
0.4001369, -0.2385966, 1.507586, 1, 0, 0, 1, 1,
0.4023134, -0.08229636, 3.614963, 1, 0, 0, 1, 1,
0.4067286, 0.2975553, -0.1510995, 0, 0, 0, 1, 1,
0.413333, 2.043575, -0.07798171, 0, 0, 0, 1, 1,
0.4133399, 2.074035, -1.123808, 0, 0, 0, 1, 1,
0.4139017, -0.4452459, 2.752344, 0, 0, 0, 1, 1,
0.415204, 1.350323, 1.685337, 0, 0, 0, 1, 1,
0.4158318, 0.5770196, 1.682642, 0, 0, 0, 1, 1,
0.4188152, 0.2747165, 0.3766887, 0, 0, 0, 1, 1,
0.4236341, 0.2507624, 2.00173, 1, 1, 1, 1, 1,
0.4245926, 0.636246, 1.82918, 1, 1, 1, 1, 1,
0.4319794, -1.477696, 2.836638, 1, 1, 1, 1, 1,
0.4324537, -1.660403, 4.577296, 1, 1, 1, 1, 1,
0.4338127, -0.2567646, 1.390309, 1, 1, 1, 1, 1,
0.4362684, 1.123677, 0.07242998, 1, 1, 1, 1, 1,
0.4418553, 1.55916, 0.3077654, 1, 1, 1, 1, 1,
0.4487327, -0.2224389, 1.799885, 1, 1, 1, 1, 1,
0.4494356, 0.4875084, -1.354441, 1, 1, 1, 1, 1,
0.4527446, -0.5351775, 2.604481, 1, 1, 1, 1, 1,
0.4536972, -1.027603, 3.319387, 1, 1, 1, 1, 1,
0.4540658, -1.346956, 2.64553, 1, 1, 1, 1, 1,
0.4545541, 2.403195, -0.008817385, 1, 1, 1, 1, 1,
0.4571631, -0.9331878, 3.127603, 1, 1, 1, 1, 1,
0.4589894, -0.09914515, -0.510832, 1, 1, 1, 1, 1,
0.4590374, -1.928175, 1.99667, 0, 0, 1, 1, 1,
0.459578, 2.049088, 0.8632945, 1, 0, 0, 1, 1,
0.4628132, -0.1843711, 1.94522, 1, 0, 0, 1, 1,
0.464273, -1.231405, 5.457084, 1, 0, 0, 1, 1,
0.4667896, -0.003175963, 3.197974, 1, 0, 0, 1, 1,
0.4720094, -0.3837233, 4.051151, 1, 0, 0, 1, 1,
0.473268, -1.727017, 3.022109, 0, 0, 0, 1, 1,
0.4791506, 1.57596, 1.20581, 0, 0, 0, 1, 1,
0.4836729, -0.2491978, 2.881975, 0, 0, 0, 1, 1,
0.4845869, 0.985225, 2.054465, 0, 0, 0, 1, 1,
0.4902185, -0.9402356, 2.823118, 0, 0, 0, 1, 1,
0.491354, 0.2710935, 1.972459, 0, 0, 0, 1, 1,
0.4954044, 0.04776872, 2.435184, 0, 0, 0, 1, 1,
0.4979982, 0.3391749, 1.600797, 1, 1, 1, 1, 1,
0.4980976, -0.2530775, 1.742471, 1, 1, 1, 1, 1,
0.49852, 0.7867738, 0.07904603, 1, 1, 1, 1, 1,
0.4989582, 2.322885, 2.494818, 1, 1, 1, 1, 1,
0.5011103, -0.4627254, 4.325731, 1, 1, 1, 1, 1,
0.5035425, -0.5496756, 3.160235, 1, 1, 1, 1, 1,
0.5121503, 1.273825, 0.3749212, 1, 1, 1, 1, 1,
0.5189862, 0.3123537, 1.106094, 1, 1, 1, 1, 1,
0.5202136, 1.169628, 0.8703498, 1, 1, 1, 1, 1,
0.5243609, 0.1268434, 0.1681687, 1, 1, 1, 1, 1,
0.525417, 0.4892167, 0.05926439, 1, 1, 1, 1, 1,
0.5270424, -0.6402468, 2.588253, 1, 1, 1, 1, 1,
0.5287844, -0.1020602, 0.4780486, 1, 1, 1, 1, 1,
0.5318521, -0.8821525, 2.656471, 1, 1, 1, 1, 1,
0.536585, 0.9873001, -0.2027588, 1, 1, 1, 1, 1,
0.5379818, -0.8193958, 4.855055, 0, 0, 1, 1, 1,
0.5424463, -0.7810883, 2.755284, 1, 0, 0, 1, 1,
0.5429909, 2.156191, -0.6642656, 1, 0, 0, 1, 1,
0.543488, -0.4496164, 1.108337, 1, 0, 0, 1, 1,
0.5463012, -0.6771719, 1.987903, 1, 0, 0, 1, 1,
0.5508662, -0.7789106, 2.523691, 1, 0, 0, 1, 1,
0.5529584, 0.9724873, -0.4912802, 0, 0, 0, 1, 1,
0.5581719, 0.2865757, 0.5200445, 0, 0, 0, 1, 1,
0.5583271, -0.2970579, 1.641245, 0, 0, 0, 1, 1,
0.5633959, -0.09712507, 0.6062809, 0, 0, 0, 1, 1,
0.563879, -0.1690967, 3.209337, 0, 0, 0, 1, 1,
0.5664219, -0.5660926, 2.531672, 0, 0, 0, 1, 1,
0.5677832, -1.836643, 2.06395, 0, 0, 0, 1, 1,
0.5747028, -0.6627634, 3.497236, 1, 1, 1, 1, 1,
0.5755948, -0.6044064, 1.328634, 1, 1, 1, 1, 1,
0.5788355, 1.986557, 0.5008726, 1, 1, 1, 1, 1,
0.5797771, -1.054709, 2.541477, 1, 1, 1, 1, 1,
0.586751, 0.6959022, 1.622505, 1, 1, 1, 1, 1,
0.588611, -1.251915, 3.897041, 1, 1, 1, 1, 1,
0.5917299, -2.16027, 2.630921, 1, 1, 1, 1, 1,
0.6036816, 0.9334142, 0.3904074, 1, 1, 1, 1, 1,
0.6049241, -0.8256444, 4.80562, 1, 1, 1, 1, 1,
0.6066673, -1.475723, 2.985136, 1, 1, 1, 1, 1,
0.6097655, -0.06121603, -0.2194175, 1, 1, 1, 1, 1,
0.6115412, -0.8410246, 1.074716, 1, 1, 1, 1, 1,
0.6117606, -0.6563474, 2.056784, 1, 1, 1, 1, 1,
0.6128661, -1.723543, 2.240371, 1, 1, 1, 1, 1,
0.6160885, 0.223599, 1.526236, 1, 1, 1, 1, 1,
0.6162156, -2.388754, 1.618541, 0, 0, 1, 1, 1,
0.6197286, 0.5718365, 1.766703, 1, 0, 0, 1, 1,
0.620033, -2.246533, 2.584525, 1, 0, 0, 1, 1,
0.6225145, 0.4765013, 0.7669296, 1, 0, 0, 1, 1,
0.6228698, 0.830612, 0.4092567, 1, 0, 0, 1, 1,
0.6230412, 0.726451, -0.2957166, 1, 0, 0, 1, 1,
0.6255665, 0.007839117, 1.19443, 0, 0, 0, 1, 1,
0.6276261, 0.6098588, 2.085216, 0, 0, 0, 1, 1,
0.6284487, 0.7604916, 1.676332, 0, 0, 0, 1, 1,
0.6410367, -0.8768055, 2.669983, 0, 0, 0, 1, 1,
0.644307, 0.4432509, 2.232567, 0, 0, 0, 1, 1,
0.6473864, 1.525014, -0.5124611, 0, 0, 0, 1, 1,
0.6580406, 0.4921531, 0.721083, 0, 0, 0, 1, 1,
0.6746585, 1.092678, -0.9876342, 1, 1, 1, 1, 1,
0.6757619, 0.6900326, 0.9868554, 1, 1, 1, 1, 1,
0.6768621, 2.38166, -0.6461743, 1, 1, 1, 1, 1,
0.6787309, 1.962992, 1.792317, 1, 1, 1, 1, 1,
0.679123, 0.2085956, 0.3091289, 1, 1, 1, 1, 1,
0.685575, -0.2032702, 0.6902545, 1, 1, 1, 1, 1,
0.6868924, 0.162267, 1.566149, 1, 1, 1, 1, 1,
0.6896532, -0.4442379, 1.85912, 1, 1, 1, 1, 1,
0.6921468, 1.969115, -0.7317207, 1, 1, 1, 1, 1,
0.6936868, -2.093934, 3.227533, 1, 1, 1, 1, 1,
0.7029777, -1.432492, 2.582321, 1, 1, 1, 1, 1,
0.7043531, 0.291086, 1.171784, 1, 1, 1, 1, 1,
0.7089248, -0.8556057, 2.187345, 1, 1, 1, 1, 1,
0.7107978, -1.618747, 0.8498854, 1, 1, 1, 1, 1,
0.7111871, 0.644815, 0.4677532, 1, 1, 1, 1, 1,
0.7129565, 0.463646, 0.6761267, 0, 0, 1, 1, 1,
0.7155511, -0.6270376, 3.489266, 1, 0, 0, 1, 1,
0.7224041, -0.4351903, -0.1541434, 1, 0, 0, 1, 1,
0.7305897, -1.71429, 1.854585, 1, 0, 0, 1, 1,
0.7312919, -0.7655015, 3.212275, 1, 0, 0, 1, 1,
0.7321253, 0.4028313, -0.5208035, 1, 0, 0, 1, 1,
0.7322785, 1.38237, 0.7191298, 0, 0, 0, 1, 1,
0.7334738, -0.7566, 2.869251, 0, 0, 0, 1, 1,
0.7352903, -0.6674154, 3.43112, 0, 0, 0, 1, 1,
0.73627, 1.01505, -0.0636033, 0, 0, 0, 1, 1,
0.7373157, -0.7227883, 2.926697, 0, 0, 0, 1, 1,
0.7446163, 0.5387918, 0.6429721, 0, 0, 0, 1, 1,
0.746592, 0.124783, 1.882811, 0, 0, 0, 1, 1,
0.7495345, 0.6576101, 1.016164, 1, 1, 1, 1, 1,
0.7508127, 0.5561112, 1.714894, 1, 1, 1, 1, 1,
0.7559802, -0.7923039, 1.520781, 1, 1, 1, 1, 1,
0.7575579, -0.02062342, 0.1243743, 1, 1, 1, 1, 1,
0.7587543, 2.694729, -1.175354, 1, 1, 1, 1, 1,
0.7601214, -0.1944898, 2.230297, 1, 1, 1, 1, 1,
0.7611939, 0.1397924, 1.162668, 1, 1, 1, 1, 1,
0.7635228, -2.062312, 3.672651, 1, 1, 1, 1, 1,
0.7648161, -3.051911, 1.082449, 1, 1, 1, 1, 1,
0.7747742, -0.1488029, 0.4162078, 1, 1, 1, 1, 1,
0.7816905, 0.512755, -0.05338664, 1, 1, 1, 1, 1,
0.7822388, 0.2581625, 4.02086, 1, 1, 1, 1, 1,
0.7852444, -0.2594733, 2.21896, 1, 1, 1, 1, 1,
0.7912693, -2.071394, 1.521977, 1, 1, 1, 1, 1,
0.7928404, -0.4610055, 2.873187, 1, 1, 1, 1, 1,
0.7930044, 0.02585027, 1.470028, 0, 0, 1, 1, 1,
0.7933245, 0.5679972, 2.128662, 1, 0, 0, 1, 1,
0.8002354, -1.547915, 3.073754, 1, 0, 0, 1, 1,
0.8043731, 0.09651832, 1.781845, 1, 0, 0, 1, 1,
0.8057556, -0.01143487, 1.800625, 1, 0, 0, 1, 1,
0.8075026, 1.494639, 1.466257, 1, 0, 0, 1, 1,
0.8105397, -1.347059, 1.896296, 0, 0, 0, 1, 1,
0.8142943, -0.7178145, 3.520641, 0, 0, 0, 1, 1,
0.8144114, -0.1846954, 1.18573, 0, 0, 0, 1, 1,
0.815097, -0.2478716, 0.4150605, 0, 0, 0, 1, 1,
0.816652, -0.4050568, 1.182283, 0, 0, 0, 1, 1,
0.8198131, -1.229914, 4.334144, 0, 0, 0, 1, 1,
0.8292479, 1.15608, 0.1029931, 0, 0, 0, 1, 1,
0.8361989, -1.046633, 3.588423, 1, 1, 1, 1, 1,
0.8420633, -0.5302482, 1.764533, 1, 1, 1, 1, 1,
0.8437694, -0.4814252, 2.467307, 1, 1, 1, 1, 1,
0.8473929, 2.223168, 1.2394, 1, 1, 1, 1, 1,
0.8540519, -0.1212841, 3.303985, 1, 1, 1, 1, 1,
0.8567511, -2.130384, 3.661618, 1, 1, 1, 1, 1,
0.8607136, -0.8228658, 2.10293, 1, 1, 1, 1, 1,
0.8612126, -0.7390813, 2.732908, 1, 1, 1, 1, 1,
0.8641953, 0.1479041, 1.686197, 1, 1, 1, 1, 1,
0.8652979, -0.7841814, 3.827078, 1, 1, 1, 1, 1,
0.8733478, 1.947646, 1.483753, 1, 1, 1, 1, 1,
0.875733, 2.132954, 0.3952479, 1, 1, 1, 1, 1,
0.8768301, -1.320328, 1.510232, 1, 1, 1, 1, 1,
0.8779983, 0.02247246, 2.403109, 1, 1, 1, 1, 1,
0.8812407, 3.478064, -0.669164, 1, 1, 1, 1, 1,
0.883023, 0.1555542, -0.3411086, 0, 0, 1, 1, 1,
0.8858979, -0.3453252, 2.216449, 1, 0, 0, 1, 1,
0.8894906, 0.4537074, 0.7999097, 1, 0, 0, 1, 1,
0.8967652, -1.092661, 0.9483718, 1, 0, 0, 1, 1,
0.898563, -1.553561, 0.583615, 1, 0, 0, 1, 1,
0.9024609, 0.4990194, 0.5882709, 1, 0, 0, 1, 1,
0.9040066, -1.342212, 2.463438, 0, 0, 0, 1, 1,
0.90618, -0.0159078, 3.360754, 0, 0, 0, 1, 1,
0.909568, 2.794315, -0.3970849, 0, 0, 0, 1, 1,
0.9109867, 2.797224, 1.640308, 0, 0, 0, 1, 1,
0.9133019, -0.06016913, 1.828467, 0, 0, 0, 1, 1,
0.9140484, -0.319028, 2.475547, 0, 0, 0, 1, 1,
0.9156122, 0.08699735, 1.074564, 0, 0, 0, 1, 1,
0.9161229, -2.843258, 1.365911, 1, 1, 1, 1, 1,
0.9165751, -0.5117685, 2.095502, 1, 1, 1, 1, 1,
0.9173251, 0.7232451, 0.4246882, 1, 1, 1, 1, 1,
0.9200724, -0.1227346, 3.080883, 1, 1, 1, 1, 1,
0.9218277, 0.6256351, -0.8505477, 1, 1, 1, 1, 1,
0.9235836, -0.9733428, 3.063329, 1, 1, 1, 1, 1,
0.9253656, -0.8715364, 2.971642, 1, 1, 1, 1, 1,
0.9321387, -0.1382062, 0.3570583, 1, 1, 1, 1, 1,
0.9335818, 0.5530407, -0.4425799, 1, 1, 1, 1, 1,
0.9336382, 1.793285, -0.5963603, 1, 1, 1, 1, 1,
0.9368188, -2.453675, 1.932677, 1, 1, 1, 1, 1,
0.9439075, 0.2654906, 0.963025, 1, 1, 1, 1, 1,
0.9505406, 0.3048073, 3.475302, 1, 1, 1, 1, 1,
0.9567987, 1.368262, 1.765213, 1, 1, 1, 1, 1,
0.9629321, -0.2042223, 1.38776, 1, 1, 1, 1, 1,
0.9656137, 0.9685252, 0.3853496, 0, 0, 1, 1, 1,
0.9680245, 1.333202, 0.2096263, 1, 0, 0, 1, 1,
0.9738066, 1.252384, -0.9993289, 1, 0, 0, 1, 1,
0.9743049, -1.120282, 3.794345, 1, 0, 0, 1, 1,
0.9749573, 0.4398954, 1.403406, 1, 0, 0, 1, 1,
0.977142, 0.2875871, 1.521047, 1, 0, 0, 1, 1,
0.9777528, 0.04183962, -0.5408124, 0, 0, 0, 1, 1,
0.984069, 0.1272493, 1.288543, 0, 0, 0, 1, 1,
0.985417, -0.8647003, 4.119506, 0, 0, 0, 1, 1,
0.985635, -0.2280963, 1.53702, 0, 0, 0, 1, 1,
0.9903985, -0.4066899, -0.5316657, 0, 0, 0, 1, 1,
0.9974273, -2.636151, 3.006979, 0, 0, 0, 1, 1,
1.01733, -0.110892, 1.713866, 0, 0, 0, 1, 1,
1.019211, 0.01106636, 0.8301187, 1, 1, 1, 1, 1,
1.020115, -0.1443204, 1.212646, 1, 1, 1, 1, 1,
1.022571, -1.023354, 2.11279, 1, 1, 1, 1, 1,
1.024032, 0.7484938, -0.3182079, 1, 1, 1, 1, 1,
1.024283, -0.2329772, 3.046726, 1, 1, 1, 1, 1,
1.038469, -0.3973681, 0.5259649, 1, 1, 1, 1, 1,
1.042155, 0.4561445, 0.4243496, 1, 1, 1, 1, 1,
1.044103, -0.4113407, 2.352714, 1, 1, 1, 1, 1,
1.045191, 0.8393236, 0.6832609, 1, 1, 1, 1, 1,
1.055104, 0.08957446, 1.670509, 1, 1, 1, 1, 1,
1.057016, 1.372943, -1.322408, 1, 1, 1, 1, 1,
1.058279, 0.2315283, 0.8203335, 1, 1, 1, 1, 1,
1.062839, -0.1221811, 2.30162, 1, 1, 1, 1, 1,
1.072957, -0.3530564, 2.414426, 1, 1, 1, 1, 1,
1.080354, -0.6708286, 1.634692, 1, 1, 1, 1, 1,
1.084175, 0.2348815, 4.832337, 0, 0, 1, 1, 1,
1.102754, -1.302051, 1.859045, 1, 0, 0, 1, 1,
1.103747, -0.4009294, 2.343973, 1, 0, 0, 1, 1,
1.105731, -2.333131, 4.056679, 1, 0, 0, 1, 1,
1.127449, -0.2131461, 1.140138, 1, 0, 0, 1, 1,
1.128342, -0.9254197, 3.561945, 1, 0, 0, 1, 1,
1.129753, -1.442384, 3.655989, 0, 0, 0, 1, 1,
1.131833, 0.1219905, 1.901196, 0, 0, 0, 1, 1,
1.135531, 0.3913888, 1.132241, 0, 0, 0, 1, 1,
1.154319, 0.1310381, 0.5809841, 0, 0, 0, 1, 1,
1.163962, 0.03772184, 1.932006, 0, 0, 0, 1, 1,
1.175233, 0.5360782, -0.5564181, 0, 0, 0, 1, 1,
1.177276, 0.6358296, 2.441742, 0, 0, 0, 1, 1,
1.182556, -0.09598894, 1.264475, 1, 1, 1, 1, 1,
1.197447, -0.7306756, 1.867305, 1, 1, 1, 1, 1,
1.201116, -0.1234268, 1.147544, 1, 1, 1, 1, 1,
1.203011, -0.2769135, 1.221245, 1, 1, 1, 1, 1,
1.20873, 1.375326, 1.27317, 1, 1, 1, 1, 1,
1.217302, -1.645674, -0.2797945, 1, 1, 1, 1, 1,
1.217686, -0.9603105, 3.250423, 1, 1, 1, 1, 1,
1.217754, 0.926044, 0.9323044, 1, 1, 1, 1, 1,
1.218852, -0.4342521, 1.773334, 1, 1, 1, 1, 1,
1.225625, -0.04813443, 0.313456, 1, 1, 1, 1, 1,
1.22755, -0.3837948, 0.02664284, 1, 1, 1, 1, 1,
1.23681, -1.600392, 1.70824, 1, 1, 1, 1, 1,
1.240132, 0.6595598, 0.2984067, 1, 1, 1, 1, 1,
1.244456, -0.3025452, 2.801638, 1, 1, 1, 1, 1,
1.252123, 0.1256132, 2.078509, 1, 1, 1, 1, 1,
1.258295, -0.9829193, 2.219497, 0, 0, 1, 1, 1,
1.260546, -0.04390553, 1.059829, 1, 0, 0, 1, 1,
1.27398, -0.3128199, 2.511971, 1, 0, 0, 1, 1,
1.287915, 0.6708426, 1.294448, 1, 0, 0, 1, 1,
1.290859, 0.235129, 1.615699, 1, 0, 0, 1, 1,
1.297534, -0.2253282, 1.918831, 1, 0, 0, 1, 1,
1.299618, -0.1189015, 1.140924, 0, 0, 0, 1, 1,
1.302598, -1.673447, 4.215682, 0, 0, 0, 1, 1,
1.30348, 0.7820792, -0.5707057, 0, 0, 0, 1, 1,
1.303585, -0.29944, 2.465997, 0, 0, 0, 1, 1,
1.314544, -1.219914, 2.076802, 0, 0, 0, 1, 1,
1.317312, 1.593699, 0.9742664, 0, 0, 0, 1, 1,
1.320377, -0.6565476, 3.460639, 0, 0, 0, 1, 1,
1.330145, 0.6437762, 0.8862352, 1, 1, 1, 1, 1,
1.332043, -0.9978769, 3.655443, 1, 1, 1, 1, 1,
1.343478, 0.3763325, 1.077408, 1, 1, 1, 1, 1,
1.355628, -0.9844474, 2.987339, 1, 1, 1, 1, 1,
1.358201, -0.9455461, 2.454311, 1, 1, 1, 1, 1,
1.360762, 0.191034, 0.3171232, 1, 1, 1, 1, 1,
1.361098, 0.695255, -0.8154169, 1, 1, 1, 1, 1,
1.369891, 0.04605618, 1.691829, 1, 1, 1, 1, 1,
1.373411, -0.5262791, -0.4734055, 1, 1, 1, 1, 1,
1.374659, 0.9005975, -0.126847, 1, 1, 1, 1, 1,
1.376271, -0.4083844, 2.321996, 1, 1, 1, 1, 1,
1.37953, 0.1170826, 1.760044, 1, 1, 1, 1, 1,
1.382644, -0.5841705, 2.927729, 1, 1, 1, 1, 1,
1.387162, -0.006148499, 0.8813891, 1, 1, 1, 1, 1,
1.400471, 1.164787, 2.462093, 1, 1, 1, 1, 1,
1.417834, -1.45085, 2.328909, 0, 0, 1, 1, 1,
1.422178, -1.498079, 1.38332, 1, 0, 0, 1, 1,
1.438406, -0.9780253, 2.908886, 1, 0, 0, 1, 1,
1.44477, -0.003675892, 1.105143, 1, 0, 0, 1, 1,
1.448011, -0.7030681, 3.673756, 1, 0, 0, 1, 1,
1.462741, 1.76149, 1.529204, 1, 0, 0, 1, 1,
1.469596, -0.9204667, 1.388021, 0, 0, 0, 1, 1,
1.480905, 0.3326037, 2.807482, 0, 0, 0, 1, 1,
1.487838, 0.5665139, -0.6621598, 0, 0, 0, 1, 1,
1.489413, -0.004737004, -0.6575346, 0, 0, 0, 1, 1,
1.49737, 1.826342, 0.427595, 0, 0, 0, 1, 1,
1.508977, 0.4700723, 0.9872773, 0, 0, 0, 1, 1,
1.512044, -1.255737, 0.2544945, 0, 0, 0, 1, 1,
1.521161, 0.4207867, 0.5047057, 1, 1, 1, 1, 1,
1.524362, 0.143354, 2.169042, 1, 1, 1, 1, 1,
1.533184, 1.470726, -0.7821574, 1, 1, 1, 1, 1,
1.543212, 0.8096738, 0.9924006, 1, 1, 1, 1, 1,
1.55012, -1.296603, 2.834509, 1, 1, 1, 1, 1,
1.553221, -1.217463, 3.289004, 1, 1, 1, 1, 1,
1.556188, -0.9212534, 1.922015, 1, 1, 1, 1, 1,
1.57826, 0.3050462, 2.623889, 1, 1, 1, 1, 1,
1.582605, 0.3941155, 0.4281338, 1, 1, 1, 1, 1,
1.584476, -1.26676, 3.28286, 1, 1, 1, 1, 1,
1.590771, 0.5949054, 0.7619963, 1, 1, 1, 1, 1,
1.608036, 1.202692, 1.883729, 1, 1, 1, 1, 1,
1.625997, 2.333, -0.06727113, 1, 1, 1, 1, 1,
1.626201, -0.002195161, 0.8740533, 1, 1, 1, 1, 1,
1.649703, 1.670375, -0.2005411, 1, 1, 1, 1, 1,
1.664769, 0.08985421, 0.87961, 0, 0, 1, 1, 1,
1.679282, -0.7215505, 0.7870638, 1, 0, 0, 1, 1,
1.687479, 0.07814262, 0.7162619, 1, 0, 0, 1, 1,
1.717412, -0.4256461, 1.3547, 1, 0, 0, 1, 1,
1.763081, -1.800527, 3.477659, 1, 0, 0, 1, 1,
1.77199, 0.4625204, 2.95605, 1, 0, 0, 1, 1,
1.775626, -0.7189752, 1.355765, 0, 0, 0, 1, 1,
1.776144, -0.01616232, 1.620094, 0, 0, 0, 1, 1,
1.792818, -0.9424837, 3.496638, 0, 0, 0, 1, 1,
1.816464, -0.07518902, 1.764132, 0, 0, 0, 1, 1,
1.818344, -1.507025, 1.773646, 0, 0, 0, 1, 1,
1.825671, 0.4473946, 1.290805, 0, 0, 0, 1, 1,
1.844168, -1.256522, 1.402186, 0, 0, 0, 1, 1,
1.8497, -0.6831533, 0.3578429, 1, 1, 1, 1, 1,
1.850004, -0.9113287, 2.165405, 1, 1, 1, 1, 1,
1.850394, 0.6351066, 1.136662, 1, 1, 1, 1, 1,
1.859331, -0.08157589, 1.158532, 1, 1, 1, 1, 1,
1.862077, 0.01065743, 0.5091203, 1, 1, 1, 1, 1,
1.86705, -0.8337169, -0.6517384, 1, 1, 1, 1, 1,
1.867993, -1.121309, 1.272395, 1, 1, 1, 1, 1,
1.871203, 0.2720783, 2.170034, 1, 1, 1, 1, 1,
1.89897, 0.5907733, 1.998543, 1, 1, 1, 1, 1,
1.914469, 0.0293382, 3.029577, 1, 1, 1, 1, 1,
1.929796, 0.2310232, 0.7039133, 1, 1, 1, 1, 1,
1.931014, 0.4250823, 2.229443, 1, 1, 1, 1, 1,
1.954754, -2.424617, 4.508316, 1, 1, 1, 1, 1,
1.961318, -0.2216896, 2.683455, 1, 1, 1, 1, 1,
1.984661, 0.5098951, 0.9773707, 1, 1, 1, 1, 1,
1.990238, -0.4228737, 0.7514486, 0, 0, 1, 1, 1,
1.996175, -0.7810227, 1.61609, 1, 0, 0, 1, 1,
2.009143, 0.9243174, 0.3257305, 1, 0, 0, 1, 1,
2.015601, -0.6948178, 2.716815, 1, 0, 0, 1, 1,
2.025043, 0.594652, 0.4918998, 1, 0, 0, 1, 1,
2.027494, 0.3707466, 0.3435744, 1, 0, 0, 1, 1,
2.033263, 1.779102, 1.324652, 0, 0, 0, 1, 1,
2.03652, -1.863488, 3.199303, 0, 0, 0, 1, 1,
2.053743, 0.6983281, 4.649888, 0, 0, 0, 1, 1,
2.076576, -0.547842, 1.2505, 0, 0, 0, 1, 1,
2.078762, -0.4529352, 3.10702, 0, 0, 0, 1, 1,
2.110579, -0.9094723, 0.8246127, 0, 0, 0, 1, 1,
2.176913, -1.509458, 1.848088, 0, 0, 0, 1, 1,
2.204216, 0.08056042, 3.262133, 1, 1, 1, 1, 1,
2.364325, 2.158923, 0.7252176, 1, 1, 1, 1, 1,
2.405512, 0.4766274, 1.921559, 1, 1, 1, 1, 1,
2.412966, 1.165567, 1.446054, 1, 1, 1, 1, 1,
2.52201, 1.641319, 2.522372, 1, 1, 1, 1, 1,
2.596857, -0.5889382, 1.19853, 1, 1, 1, 1, 1,
2.922648, 2.016976, 1.908818, 1, 1, 1, 1, 1
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
var radius = 9.851034;
var distance = 34.60134;
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
mvMatrix.translate( 0.5129923, -0.0913043, -0.03196526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.60134);
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
