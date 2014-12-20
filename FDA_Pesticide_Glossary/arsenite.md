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
-3.949295, 0.3857708, -1.11126, 1, 0, 0, 1,
-3.931175, 0.9857878, -1.569929, 1, 0.007843138, 0, 1,
-3.350342, -2.275204, -4.642124, 1, 0.01176471, 0, 1,
-3.112339, -1.426205, -3.290204, 1, 0.01960784, 0, 1,
-2.642241, 0.160723, -1.901873, 1, 0.02352941, 0, 1,
-2.493981, -1.150919, -1.140823, 1, 0.03137255, 0, 1,
-2.431357, 1.871394, 0.1231851, 1, 0.03529412, 0, 1,
-2.418718, -0.8920337, -0.5198396, 1, 0.04313726, 0, 1,
-2.394636, -0.1524289, -2.07817, 1, 0.04705882, 0, 1,
-2.369876, -0.1850949, -2.727959, 1, 0.05490196, 0, 1,
-2.355784, -2.390908, -3.641802, 1, 0.05882353, 0, 1,
-2.304379, 2.657501, 0.07236776, 1, 0.06666667, 0, 1,
-2.268322, -1.090732, -1.100408, 1, 0.07058824, 0, 1,
-2.248803, 0.3889603, -2.17179, 1, 0.07843138, 0, 1,
-2.210883, 0.7089777, -2.988092, 1, 0.08235294, 0, 1,
-2.193188, 0.8569658, -0.6670359, 1, 0.09019608, 0, 1,
-2.134669, 1.216823, -2.685903, 1, 0.09411765, 0, 1,
-2.1317, -0.3584658, -0.3073677, 1, 0.1019608, 0, 1,
-2.095099, 0.9865887, -1.110742, 1, 0.1098039, 0, 1,
-2.074404, 1.887613, -0.7117716, 1, 0.1137255, 0, 1,
-2.073457, 1.715014, -0.7648967, 1, 0.1215686, 0, 1,
-2.047481, -0.612168, -1.984416, 1, 0.1254902, 0, 1,
-2.002976, 1.065457, -1.788611, 1, 0.1333333, 0, 1,
-1.981285, -0.2782663, -1.554532, 1, 0.1372549, 0, 1,
-1.950697, 1.225096, -1.20954, 1, 0.145098, 0, 1,
-1.950403, 1.759505, -1.245389, 1, 0.1490196, 0, 1,
-1.931931, -0.5068678, -2.005141, 1, 0.1568628, 0, 1,
-1.925088, -2.255342, -3.622619, 1, 0.1607843, 0, 1,
-1.910857, -1.608805, -1.597349, 1, 0.1686275, 0, 1,
-1.910186, 0.9757493, -3.138608, 1, 0.172549, 0, 1,
-1.90041, -1.149708, -2.406907, 1, 0.1803922, 0, 1,
-1.899703, 0.03857286, -0.825799, 1, 0.1843137, 0, 1,
-1.890173, -0.5196444, -1.393717, 1, 0.1921569, 0, 1,
-1.855319, 0.8391033, -1.109792, 1, 0.1960784, 0, 1,
-1.832786, -0.3532992, -0.5809395, 1, 0.2039216, 0, 1,
-1.824568, -1.296002, -1.407017, 1, 0.2117647, 0, 1,
-1.822734, 0.4678326, -0.787168, 1, 0.2156863, 0, 1,
-1.817908, 0.9093733, 0.5839404, 1, 0.2235294, 0, 1,
-1.814931, 0.8469281, -2.033925, 1, 0.227451, 0, 1,
-1.814412, -0.5129992, -1.183976, 1, 0.2352941, 0, 1,
-1.781937, -1.299622, -2.745152, 1, 0.2392157, 0, 1,
-1.781548, -0.1854475, -3.369897, 1, 0.2470588, 0, 1,
-1.765565, -0.2435232, -1.103067, 1, 0.2509804, 0, 1,
-1.764271, 0.9643097, -0.5025777, 1, 0.2588235, 0, 1,
-1.760315, 0.08129517, -0.1821927, 1, 0.2627451, 0, 1,
-1.758113, 0.6650727, -2.002577, 1, 0.2705882, 0, 1,
-1.755024, 0.3925429, -1.336954, 1, 0.2745098, 0, 1,
-1.738132, 0.2441573, -3.228681, 1, 0.282353, 0, 1,
-1.72575, -0.5017261, -1.778082, 1, 0.2862745, 0, 1,
-1.722179, 0.2116627, -2.380435, 1, 0.2941177, 0, 1,
-1.721833, -0.3535947, -0.6369541, 1, 0.3019608, 0, 1,
-1.72167, -1.014491, -2.24203, 1, 0.3058824, 0, 1,
-1.704463, 1.077345, -2.343363, 1, 0.3137255, 0, 1,
-1.704072, 1.341481, -0.3905977, 1, 0.3176471, 0, 1,
-1.703195, 0.4859159, -1.596138, 1, 0.3254902, 0, 1,
-1.700382, 0.7580916, -2.082908, 1, 0.3294118, 0, 1,
-1.68923, 0.1865519, -1.683424, 1, 0.3372549, 0, 1,
-1.657949, -2.192423, -3.591672, 1, 0.3411765, 0, 1,
-1.653523, -0.4001982, -2.204049, 1, 0.3490196, 0, 1,
-1.652887, -0.7795044, -1.753813, 1, 0.3529412, 0, 1,
-1.641294, -1.39716, -4.258164, 1, 0.3607843, 0, 1,
-1.634509, -0.5346704, -0.02393284, 1, 0.3647059, 0, 1,
-1.632429, 0.04543975, -3.644313, 1, 0.372549, 0, 1,
-1.623535, 0.5119194, 0.02778416, 1, 0.3764706, 0, 1,
-1.603613, -0.1404872, -1.434974, 1, 0.3843137, 0, 1,
-1.585339, 0.7049705, 0.2370289, 1, 0.3882353, 0, 1,
-1.582253, 0.09886971, -2.007664, 1, 0.3960784, 0, 1,
-1.577363, 1.14866, -1.045934, 1, 0.4039216, 0, 1,
-1.569181, -0.1014059, -0.6674844, 1, 0.4078431, 0, 1,
-1.531707, 1.627667, -0.5930226, 1, 0.4156863, 0, 1,
-1.518582, -0.6671543, -2.162559, 1, 0.4196078, 0, 1,
-1.47325, 1.230724, -1.24555, 1, 0.427451, 0, 1,
-1.471943, 0.09223648, -2.315723, 1, 0.4313726, 0, 1,
-1.470072, -0.3996243, -3.215994, 1, 0.4392157, 0, 1,
-1.462628, 0.4064202, -1.13923, 1, 0.4431373, 0, 1,
-1.456075, -0.1991522, -2.830253, 1, 0.4509804, 0, 1,
-1.455591, 1.133223, -1.885582, 1, 0.454902, 0, 1,
-1.453841, 1.265929, -0.7168673, 1, 0.4627451, 0, 1,
-1.439203, -0.4132509, -1.544109, 1, 0.4666667, 0, 1,
-1.437773, 1.348389, -1.502628, 1, 0.4745098, 0, 1,
-1.436948, 0.1824108, -1.038365, 1, 0.4784314, 0, 1,
-1.416281, -0.3340103, -1.387808, 1, 0.4862745, 0, 1,
-1.406371, -0.1421483, -2.878612, 1, 0.4901961, 0, 1,
-1.40457, 0.9854052, -1.384551, 1, 0.4980392, 0, 1,
-1.397867, 0.1150951, -2.572641, 1, 0.5058824, 0, 1,
-1.379694, -1.730938, -3.553642, 1, 0.509804, 0, 1,
-1.365732, 1.632791, -1.862653, 1, 0.5176471, 0, 1,
-1.359925, 0.2400116, -1.384899, 1, 0.5215687, 0, 1,
-1.359373, -0.6842324, -2.41325, 1, 0.5294118, 0, 1,
-1.356201, 1.822445, 0.1070498, 1, 0.5333334, 0, 1,
-1.355277, -0.1992456, -1.494899, 1, 0.5411765, 0, 1,
-1.346539, 1.028656, -0.2905542, 1, 0.5450981, 0, 1,
-1.339507, 0.1022448, -0.3829958, 1, 0.5529412, 0, 1,
-1.318849, -1.212572, -1.054216, 1, 0.5568628, 0, 1,
-1.304316, -1.270355, -3.848799, 1, 0.5647059, 0, 1,
-1.300325, 1.727026, -0.7982416, 1, 0.5686275, 0, 1,
-1.298345, 0.9384403, -1.541282, 1, 0.5764706, 0, 1,
-1.297577, -0.1002264, -1.538853, 1, 0.5803922, 0, 1,
-1.297286, -0.2608139, -0.5564051, 1, 0.5882353, 0, 1,
-1.28715, 0.6275925, -1.256742, 1, 0.5921569, 0, 1,
-1.27836, 0.952881, -2.6187, 1, 0.6, 0, 1,
-1.264971, 0.0917356, -1.5536, 1, 0.6078432, 0, 1,
-1.258824, 1.509002, -0.625877, 1, 0.6117647, 0, 1,
-1.25717, -0.09277675, -0.9059301, 1, 0.6196079, 0, 1,
-1.256078, -0.09488792, -1.411516, 1, 0.6235294, 0, 1,
-1.256039, -0.7257012, -1.886692, 1, 0.6313726, 0, 1,
-1.253788, -1.591815, -2.401363, 1, 0.6352941, 0, 1,
-1.248788, 0.9111399, -2.849251, 1, 0.6431373, 0, 1,
-1.244934, 0.7364659, -0.5832235, 1, 0.6470588, 0, 1,
-1.241382, -0.05538829, -2.345637, 1, 0.654902, 0, 1,
-1.233442, 0.3427248, -2.802982, 1, 0.6588235, 0, 1,
-1.231116, 1.181492, -0.9279846, 1, 0.6666667, 0, 1,
-1.228235, 0.8928799, -0.2155269, 1, 0.6705883, 0, 1,
-1.227393, 0.3801383, -0.3259747, 1, 0.6784314, 0, 1,
-1.218806, 0.07892789, -3.257272, 1, 0.682353, 0, 1,
-1.218271, 0.4756417, -1.081671, 1, 0.6901961, 0, 1,
-1.216431, -0.9667813, -2.105769, 1, 0.6941177, 0, 1,
-1.214019, 0.8080138, -1.701213, 1, 0.7019608, 0, 1,
-1.203107, -0.623674, -2.375854, 1, 0.7098039, 0, 1,
-1.199942, 1.09453, -0.9060122, 1, 0.7137255, 0, 1,
-1.198973, -0.6164253, -2.339926, 1, 0.7215686, 0, 1,
-1.196565, -0.9994342, -4.287776, 1, 0.7254902, 0, 1,
-1.196563, -0.5300486, -2.166197, 1, 0.7333333, 0, 1,
-1.191948, 0.05300027, -2.020272, 1, 0.7372549, 0, 1,
-1.184631, 0.1012263, -0.1506468, 1, 0.7450981, 0, 1,
-1.177919, -1.026216, -1.032805, 1, 0.7490196, 0, 1,
-1.157746, 0.1353764, -0.8411192, 1, 0.7568628, 0, 1,
-1.155852, 0.6615676, -3.324035, 1, 0.7607843, 0, 1,
-1.154408, 0.7031448, -1.739683, 1, 0.7686275, 0, 1,
-1.151545, 0.6514595, -1.191618, 1, 0.772549, 0, 1,
-1.150665, 0.6241367, -1.573633, 1, 0.7803922, 0, 1,
-1.13507, -0.6265836, 0.631196, 1, 0.7843137, 0, 1,
-1.13025, 0.1289957, -2.128767, 1, 0.7921569, 0, 1,
-1.115196, -2.01193, -2.551307, 1, 0.7960784, 0, 1,
-1.107241, -0.551528, -2.240818, 1, 0.8039216, 0, 1,
-1.105031, 1.036493, -2.351128, 1, 0.8117647, 0, 1,
-1.096625, -0.1820749, -2.066445, 1, 0.8156863, 0, 1,
-1.084605, 0.1725627, -0.9367045, 1, 0.8235294, 0, 1,
-1.082892, -1.111706, -2.859228, 1, 0.827451, 0, 1,
-1.082282, -0.9844323, -0.2626483, 1, 0.8352941, 0, 1,
-1.077814, 0.2934406, -1.561171, 1, 0.8392157, 0, 1,
-1.074486, 0.2568696, -2.732234, 1, 0.8470588, 0, 1,
-1.069722, -0.6110204, -0.7286673, 1, 0.8509804, 0, 1,
-1.067502, 0.9413013, -0.9513986, 1, 0.8588235, 0, 1,
-1.062675, 0.3160128, -0.7281673, 1, 0.8627451, 0, 1,
-1.062343, 0.6775075, 1.27762, 1, 0.8705882, 0, 1,
-1.052741, -1.765585, -3.234722, 1, 0.8745098, 0, 1,
-1.047357, 0.1829326, -1.694929, 1, 0.8823529, 0, 1,
-1.03711, -0.6502545, -4.183818, 1, 0.8862745, 0, 1,
-1.036649, 0.6475313, -2.281794, 1, 0.8941177, 0, 1,
-1.035949, 2.175899, -1.36332, 1, 0.8980392, 0, 1,
-1.035552, 0.5262133, -0.9922951, 1, 0.9058824, 0, 1,
-1.025381, -0.7858326, -2.919255, 1, 0.9137255, 0, 1,
-1.017233, -2.131144, -2.817289, 1, 0.9176471, 0, 1,
-1.015234, -0.1852801, -0.7412692, 1, 0.9254902, 0, 1,
-0.9943547, -0.3373273, -3.041496, 1, 0.9294118, 0, 1,
-0.9832055, 0.2883539, -1.445711, 1, 0.9372549, 0, 1,
-0.980565, -0.294048, -2.060555, 1, 0.9411765, 0, 1,
-0.9783464, 1.067171, -1.862489, 1, 0.9490196, 0, 1,
-0.9656426, 1.285402, -2.505618, 1, 0.9529412, 0, 1,
-0.9645314, 0.6480414, -1.040105, 1, 0.9607843, 0, 1,
-0.9629655, 0.01543735, -2.115005, 1, 0.9647059, 0, 1,
-0.9533272, -1.549264, -2.761306, 1, 0.972549, 0, 1,
-0.9515143, 0.3787304, -1.614245, 1, 0.9764706, 0, 1,
-0.9492709, -0.5832559, -2.393795, 1, 0.9843137, 0, 1,
-0.9288537, -0.4155611, -2.581393, 1, 0.9882353, 0, 1,
-0.9237518, -0.1321025, -2.051968, 1, 0.9960784, 0, 1,
-0.9209436, -0.7847949, -1.64485, 0.9960784, 1, 0, 1,
-0.9119707, -0.1481883, -1.778035, 0.9921569, 1, 0, 1,
-0.9088818, -0.444101, -3.014091, 0.9843137, 1, 0, 1,
-0.9083679, -1.21666, -0.6792041, 0.9803922, 1, 0, 1,
-0.9071636, 0.1789105, 0.2228233, 0.972549, 1, 0, 1,
-0.9058297, -0.5265087, -1.499271, 0.9686275, 1, 0, 1,
-0.9038985, -0.3781232, -2.936149, 0.9607843, 1, 0, 1,
-0.8897228, -1.680188, -3.274014, 0.9568627, 1, 0, 1,
-0.888686, -2.288053, -2.295098, 0.9490196, 1, 0, 1,
-0.8861341, 0.4605564, -0.1303498, 0.945098, 1, 0, 1,
-0.8820936, 0.253281, -2.167656, 0.9372549, 1, 0, 1,
-0.8749629, -0.3250611, -2.758298, 0.9333333, 1, 0, 1,
-0.8700141, -1.273268, -2.916674, 0.9254902, 1, 0, 1,
-0.8695837, 0.4531462, -1.577841, 0.9215686, 1, 0, 1,
-0.859139, 0.3425347, -2.422096, 0.9137255, 1, 0, 1,
-0.8574117, 0.06562306, -1.475067, 0.9098039, 1, 0, 1,
-0.8494666, -0.3286773, -0.9557675, 0.9019608, 1, 0, 1,
-0.8494534, -0.332566, -3.633985, 0.8941177, 1, 0, 1,
-0.8467718, 1.755501, 0.6490408, 0.8901961, 1, 0, 1,
-0.8452982, 0.03226129, -0.7709388, 0.8823529, 1, 0, 1,
-0.8419203, 2.697482, 0.1307379, 0.8784314, 1, 0, 1,
-0.8418609, -0.3611092, -1.774607, 0.8705882, 1, 0, 1,
-0.8404298, -0.6494014, -1.51305, 0.8666667, 1, 0, 1,
-0.8341333, -0.9086012, -2.822802, 0.8588235, 1, 0, 1,
-0.832776, 0.9704053, -1.085259, 0.854902, 1, 0, 1,
-0.8297072, -0.05995731, -2.123387, 0.8470588, 1, 0, 1,
-0.8241608, -0.714002, -2.445768, 0.8431373, 1, 0, 1,
-0.821117, 0.01394875, -0.7918651, 0.8352941, 1, 0, 1,
-0.8208967, 0.3923762, -1.145824, 0.8313726, 1, 0, 1,
-0.820662, 1.428345, 0.6752039, 0.8235294, 1, 0, 1,
-0.8179018, 0.3527461, 0.237812, 0.8196079, 1, 0, 1,
-0.8156314, 2.486669, 0.383174, 0.8117647, 1, 0, 1,
-0.8131372, 1.354414, -0.1136087, 0.8078431, 1, 0, 1,
-0.8074214, -1.030903, -3.193631, 0.8, 1, 0, 1,
-0.8045244, -0.9629309, -0.6275297, 0.7921569, 1, 0, 1,
-0.7995145, -0.2733981, -1.123567, 0.7882353, 1, 0, 1,
-0.7958038, -1.945529, -4.688912, 0.7803922, 1, 0, 1,
-0.7953511, 0.1631179, -1.3555, 0.7764706, 1, 0, 1,
-0.7818781, 0.3287026, -0.7712959, 0.7686275, 1, 0, 1,
-0.777862, 0.4632868, -1.384386, 0.7647059, 1, 0, 1,
-0.7729764, -0.1190379, -3.542584, 0.7568628, 1, 0, 1,
-0.768732, -0.74713, -1.202479, 0.7529412, 1, 0, 1,
-0.7682297, 0.720693, 0.09992928, 0.7450981, 1, 0, 1,
-0.7663178, 0.1466999, -1.950401, 0.7411765, 1, 0, 1,
-0.7632366, -1.49539, -1.261219, 0.7333333, 1, 0, 1,
-0.7629452, 0.3801804, 0.01033167, 0.7294118, 1, 0, 1,
-0.7602302, 2.02675, -0.06648552, 0.7215686, 1, 0, 1,
-0.7575823, -0.4755527, -2.959844, 0.7176471, 1, 0, 1,
-0.7548643, -0.1552544, -0.6058794, 0.7098039, 1, 0, 1,
-0.7422799, -0.3646375, -0.6319454, 0.7058824, 1, 0, 1,
-0.7395248, -0.08659348, -0.7649496, 0.6980392, 1, 0, 1,
-0.732265, 0.287246, -0.5625635, 0.6901961, 1, 0, 1,
-0.7314761, 0.8629699, 0.6205915, 0.6862745, 1, 0, 1,
-0.7292157, -0.2994402, -2.533633, 0.6784314, 1, 0, 1,
-0.7285554, 0.6770013, -0.3167363, 0.6745098, 1, 0, 1,
-0.7259845, -0.8583569, -3.661543, 0.6666667, 1, 0, 1,
-0.7150891, 0.107291, -1.013855, 0.6627451, 1, 0, 1,
-0.7073194, -0.01629159, -3.241556, 0.654902, 1, 0, 1,
-0.7059439, 0.0125603, -0.8227645, 0.6509804, 1, 0, 1,
-0.7018115, -0.4910609, -1.324434, 0.6431373, 1, 0, 1,
-0.6988704, -1.04639, -3.166855, 0.6392157, 1, 0, 1,
-0.6974792, -0.02412381, -0.3539953, 0.6313726, 1, 0, 1,
-0.6875523, 1.029514, -0.4939697, 0.627451, 1, 0, 1,
-0.6849682, -0.2548499, -3.098756, 0.6196079, 1, 0, 1,
-0.683171, -0.02599398, -3.30733, 0.6156863, 1, 0, 1,
-0.6797265, 0.0136938, -1.867417, 0.6078432, 1, 0, 1,
-0.6754811, 0.1251461, -0.8292776, 0.6039216, 1, 0, 1,
-0.6730298, -0.1195664, -0.7140081, 0.5960785, 1, 0, 1,
-0.6727505, 1.132231, 0.6882953, 0.5882353, 1, 0, 1,
-0.6694849, 0.7082095, -0.6372519, 0.5843138, 1, 0, 1,
-0.6692036, -0.7116679, -2.376527, 0.5764706, 1, 0, 1,
-0.6651673, -0.07251018, 0.3235901, 0.572549, 1, 0, 1,
-0.6644418, -0.5848651, -1.311386, 0.5647059, 1, 0, 1,
-0.6623459, -2.279805, -4.286852, 0.5607843, 1, 0, 1,
-0.6615177, 1.00421, -0.421577, 0.5529412, 1, 0, 1,
-0.6537583, -1.050301, -3.392487, 0.5490196, 1, 0, 1,
-0.6531129, -1.567573, -1.900451, 0.5411765, 1, 0, 1,
-0.6518338, -0.986326, -2.448927, 0.5372549, 1, 0, 1,
-0.6514009, -0.1968148, -3.853729, 0.5294118, 1, 0, 1,
-0.6513914, 0.4897756, -1.489662, 0.5254902, 1, 0, 1,
-0.6431878, 0.01952427, -0.8474913, 0.5176471, 1, 0, 1,
-0.6401298, 0.1843948, -0.9984313, 0.5137255, 1, 0, 1,
-0.6397745, -0.02215157, -2.132226, 0.5058824, 1, 0, 1,
-0.6382342, 0.6044281, 0.3986453, 0.5019608, 1, 0, 1,
-0.6355847, 0.05035059, -1.578666, 0.4941176, 1, 0, 1,
-0.6303045, 1.273629, 0.9599382, 0.4862745, 1, 0, 1,
-0.629944, -0.01076727, -1.36476, 0.4823529, 1, 0, 1,
-0.6291775, -0.1851217, -2.496465, 0.4745098, 1, 0, 1,
-0.6281756, 1.166524, -1.226166, 0.4705882, 1, 0, 1,
-0.6263099, 0.748728, -1.721846, 0.4627451, 1, 0, 1,
-0.6262728, -1.310146, -3.453322, 0.4588235, 1, 0, 1,
-0.6253218, -0.8691274, -3.43917, 0.4509804, 1, 0, 1,
-0.6205002, 1.281929, -0.2485256, 0.4470588, 1, 0, 1,
-0.6160011, 0.1400593, 0.330374, 0.4392157, 1, 0, 1,
-0.6159394, -0.5463532, -2.565722, 0.4352941, 1, 0, 1,
-0.6088488, 0.02838762, -1.230538, 0.427451, 1, 0, 1,
-0.6081486, -0.617335, -3.062105, 0.4235294, 1, 0, 1,
-0.6048959, -0.6564395, -3.978493, 0.4156863, 1, 0, 1,
-0.6024262, -0.9670876, -3.274838, 0.4117647, 1, 0, 1,
-0.6021509, 1.060723, -0.2198993, 0.4039216, 1, 0, 1,
-0.5965998, -1.428844, -4.959643, 0.3960784, 1, 0, 1,
-0.5963052, -0.1240318, -1.492921, 0.3921569, 1, 0, 1,
-0.5952663, -0.675764, -1.57636, 0.3843137, 1, 0, 1,
-0.5919886, -0.1801742, -2.688195, 0.3803922, 1, 0, 1,
-0.5915509, -3.650438, -2.774274, 0.372549, 1, 0, 1,
-0.5902991, -1.759129, -2.380696, 0.3686275, 1, 0, 1,
-0.5861315, -1.895702, -3.379766, 0.3607843, 1, 0, 1,
-0.5783882, -0.5183018, -1.04184, 0.3568628, 1, 0, 1,
-0.5777678, -0.5194262, -1.968136, 0.3490196, 1, 0, 1,
-0.5775958, -1.11015, -1.909118, 0.345098, 1, 0, 1,
-0.5699007, 2.325203, -3.297795, 0.3372549, 1, 0, 1,
-0.5695965, -0.3946825, -1.862892, 0.3333333, 1, 0, 1,
-0.5671859, 0.03396749, -1.78583, 0.3254902, 1, 0, 1,
-0.5652657, 1.016046, -0.1255101, 0.3215686, 1, 0, 1,
-0.5644027, -0.1602727, -0.6162632, 0.3137255, 1, 0, 1,
-0.5629929, -0.5580735, -2.521187, 0.3098039, 1, 0, 1,
-0.5628443, 0.699765, 0.4385975, 0.3019608, 1, 0, 1,
-0.5593065, -0.5709289, -3.609472, 0.2941177, 1, 0, 1,
-0.5538667, 0.9482078, -3.939463, 0.2901961, 1, 0, 1,
-0.5535338, 1.420472, 0.4098231, 0.282353, 1, 0, 1,
-0.5529289, -0.8854432, -2.114292, 0.2784314, 1, 0, 1,
-0.5525047, -0.5553468, -1.688074, 0.2705882, 1, 0, 1,
-0.5520147, -1.503284, -3.218576, 0.2666667, 1, 0, 1,
-0.5501994, 1.024163, -0.2021126, 0.2588235, 1, 0, 1,
-0.5495872, -0.2041895, -2.237988, 0.254902, 1, 0, 1,
-0.5418165, -0.2863403, -2.579358, 0.2470588, 1, 0, 1,
-0.5382183, -0.8690679, -3.31843, 0.2431373, 1, 0, 1,
-0.537371, 1.611725, -1.790675, 0.2352941, 1, 0, 1,
-0.5369378, 0.5881149, -1.892164, 0.2313726, 1, 0, 1,
-0.5350121, 1.994215, -0.3307843, 0.2235294, 1, 0, 1,
-0.5279167, -0.9830227, -3.038428, 0.2196078, 1, 0, 1,
-0.5272253, -2.38088, -3.036048, 0.2117647, 1, 0, 1,
-0.524745, -0.8046314, -2.931064, 0.2078431, 1, 0, 1,
-0.5134958, 1.226822, -1.328297, 0.2, 1, 0, 1,
-0.5128812, -0.0336953, -1.471284, 0.1921569, 1, 0, 1,
-0.5128776, -0.2861195, -1.050015, 0.1882353, 1, 0, 1,
-0.5124889, -1.434453, -4.268497, 0.1803922, 1, 0, 1,
-0.5097167, 2.291087, -0.5636851, 0.1764706, 1, 0, 1,
-0.4984833, -0.6518547, -0.7049022, 0.1686275, 1, 0, 1,
-0.4931928, 2.74954, -0.5803519, 0.1647059, 1, 0, 1,
-0.4860443, -0.7639216, -2.739869, 0.1568628, 1, 0, 1,
-0.4846378, -0.6840675, -3.228896, 0.1529412, 1, 0, 1,
-0.481541, 1.558544, -1.772729, 0.145098, 1, 0, 1,
-0.4682973, -0.4868135, -2.317521, 0.1411765, 1, 0, 1,
-0.4679883, -0.7225023, -1.589887, 0.1333333, 1, 0, 1,
-0.4662491, -1.703726, -1.664326, 0.1294118, 1, 0, 1,
-0.4658369, -1.481177, -3.320363, 0.1215686, 1, 0, 1,
-0.4656948, 0.9330592, -1.147376, 0.1176471, 1, 0, 1,
-0.4624493, 0.04818587, -1.999035, 0.1098039, 1, 0, 1,
-0.4577168, 1.222942, 1.232559, 0.1058824, 1, 0, 1,
-0.4557449, -0.5418887, -3.004889, 0.09803922, 1, 0, 1,
-0.455605, -1.35855, -3.393398, 0.09019608, 1, 0, 1,
-0.4428324, 0.2798854, -0.9098305, 0.08627451, 1, 0, 1,
-0.4404114, -0.05691661, -3.218964, 0.07843138, 1, 0, 1,
-0.438244, 0.3500518, -1.021687, 0.07450981, 1, 0, 1,
-0.435935, -0.8065645, -1.147473, 0.06666667, 1, 0, 1,
-0.4256894, -0.2305169, -2.179617, 0.0627451, 1, 0, 1,
-0.4206206, -0.05655058, -1.337497, 0.05490196, 1, 0, 1,
-0.4170738, -0.8662165, -2.699826, 0.05098039, 1, 0, 1,
-0.4159788, 0.3417403, -0.7252152, 0.04313726, 1, 0, 1,
-0.4122179, 0.7949765, -2.804623, 0.03921569, 1, 0, 1,
-0.405894, -0.9755527, -2.512213, 0.03137255, 1, 0, 1,
-0.4056698, -0.7171587, -3.119012, 0.02745098, 1, 0, 1,
-0.4047888, 0.7324104, -1.50286, 0.01960784, 1, 0, 1,
-0.4012461, -0.8941428, -3.068961, 0.01568628, 1, 0, 1,
-0.3997211, 1.787531, -0.2582114, 0.007843138, 1, 0, 1,
-0.3980788, 1.815458, -1.206335, 0.003921569, 1, 0, 1,
-0.3948017, -1.204663, -2.732084, 0, 1, 0.003921569, 1,
-0.394801, -0.8276221, -0.4606174, 0, 1, 0.01176471, 1,
-0.3941782, -0.4678182, -1.783416, 0, 1, 0.01568628, 1,
-0.3940815, 0.2701332, -1.284489, 0, 1, 0.02352941, 1,
-0.3869273, -0.8780371, -4.491978, 0, 1, 0.02745098, 1,
-0.3832173, -0.707888, -4.029442, 0, 1, 0.03529412, 1,
-0.3821506, 0.07772251, -3.271594, 0, 1, 0.03921569, 1,
-0.3757797, 0.5493162, -1.009847, 0, 1, 0.04705882, 1,
-0.3667786, -0.3228827, -1.776657, 0, 1, 0.05098039, 1,
-0.3660568, 1.68069, -1.215536, 0, 1, 0.05882353, 1,
-0.3652903, -0.4971036, -4.23327, 0, 1, 0.0627451, 1,
-0.357219, 1.320907, -0.2197253, 0, 1, 0.07058824, 1,
-0.3571174, 1.691343, -0.5483961, 0, 1, 0.07450981, 1,
-0.3569737, -2.038339, -2.838882, 0, 1, 0.08235294, 1,
-0.3544953, 1.149405, 1.0937, 0, 1, 0.08627451, 1,
-0.351148, 1.306201, -0.9554463, 0, 1, 0.09411765, 1,
-0.3504397, 1.163878, -1.51641, 0, 1, 0.1019608, 1,
-0.3485665, -1.090521, -3.011837, 0, 1, 0.1058824, 1,
-0.3441381, 0.4407264, -0.4933628, 0, 1, 0.1137255, 1,
-0.3386013, 0.3095211, 0.710006, 0, 1, 0.1176471, 1,
-0.3384173, 0.3379933, -1.387992, 0, 1, 0.1254902, 1,
-0.3355453, 1.26843, -0.3815349, 0, 1, 0.1294118, 1,
-0.3311463, -1.303962, -2.567393, 0, 1, 0.1372549, 1,
-0.3253041, -0.3633845, -3.48549, 0, 1, 0.1411765, 1,
-0.3234954, 1.064227, 0.7425152, 0, 1, 0.1490196, 1,
-0.3228955, -0.08214549, -1.045852, 0, 1, 0.1529412, 1,
-0.3220998, -1.246099, -1.860836, 0, 1, 0.1607843, 1,
-0.3202773, 1.100309, 0.5179158, 0, 1, 0.1647059, 1,
-0.3161263, 0.5680876, -0.2078461, 0, 1, 0.172549, 1,
-0.3068078, 1.656408, -0.7889658, 0, 1, 0.1764706, 1,
-0.3042941, -0.08612726, -2.017226, 0, 1, 0.1843137, 1,
-0.3027145, -1.139982, -3.299086, 0, 1, 0.1882353, 1,
-0.2996694, -0.9028324, -2.919288, 0, 1, 0.1960784, 1,
-0.2983654, 1.503186, 0.7039413, 0, 1, 0.2039216, 1,
-0.2974946, 0.1340261, -1.506422, 0, 1, 0.2078431, 1,
-0.2927499, -0.0696395, -0.5345335, 0, 1, 0.2156863, 1,
-0.2901267, -0.6814005, -1.724413, 0, 1, 0.2196078, 1,
-0.2800411, 0.8897176, 0.7773998, 0, 1, 0.227451, 1,
-0.2799867, 0.3272864, -1.251993, 0, 1, 0.2313726, 1,
-0.2787375, -0.9229028, -1.600258, 0, 1, 0.2392157, 1,
-0.2787267, -1.286846, -3.636081, 0, 1, 0.2431373, 1,
-0.2776144, 0.2296381, -1.238441, 0, 1, 0.2509804, 1,
-0.2727754, 1.175811, 1.118343, 0, 1, 0.254902, 1,
-0.2712861, -0.728361, -3.280213, 0, 1, 0.2627451, 1,
-0.2695449, -0.5510852, -1.852795, 0, 1, 0.2666667, 1,
-0.2684285, 0.9432981, -0.9705651, 0, 1, 0.2745098, 1,
-0.2653319, -0.08972707, -1.752617, 0, 1, 0.2784314, 1,
-0.2636769, 2.105096, 0.8477916, 0, 1, 0.2862745, 1,
-0.2612455, -0.6429577, -3.290154, 0, 1, 0.2901961, 1,
-0.2601459, 0.4404607, -1.363265, 0, 1, 0.2980392, 1,
-0.256213, 0.2270039, -3.348317, 0, 1, 0.3058824, 1,
-0.2553806, -0.3592948, -2.132353, 0, 1, 0.3098039, 1,
-0.2543328, 0.7331541, -0.6554673, 0, 1, 0.3176471, 1,
-0.252778, 0.3622293, 0.3908408, 0, 1, 0.3215686, 1,
-0.2477477, -0.2251621, -1.918092, 0, 1, 0.3294118, 1,
-0.2465213, 1.339042, -0.2186737, 0, 1, 0.3333333, 1,
-0.24437, -0.4526595, -2.37923, 0, 1, 0.3411765, 1,
-0.243958, 1.749177, 1.166363, 0, 1, 0.345098, 1,
-0.243268, 1.075397, 0.7194647, 0, 1, 0.3529412, 1,
-0.2428216, 0.7538176, 0.01381688, 0, 1, 0.3568628, 1,
-0.2425222, -0.9422538, -3.142924, 0, 1, 0.3647059, 1,
-0.235742, -0.291449, -1.50313, 0, 1, 0.3686275, 1,
-0.2357181, 1.462125, 2.432324, 0, 1, 0.3764706, 1,
-0.2336601, -0.1353849, -0.2526204, 0, 1, 0.3803922, 1,
-0.2316616, -2.00145, -1.742449, 0, 1, 0.3882353, 1,
-0.2300599, -0.6581452, -2.571568, 0, 1, 0.3921569, 1,
-0.2286432, -0.237061, -4.155905, 0, 1, 0.4, 1,
-0.2264694, 1.033219, -0.6506945, 0, 1, 0.4078431, 1,
-0.2255003, -0.5878204, -5.106551, 0, 1, 0.4117647, 1,
-0.2234715, 0.5778313, 1.587829, 0, 1, 0.4196078, 1,
-0.2218904, 0.1542065, -0.5373183, 0, 1, 0.4235294, 1,
-0.2179257, -0.6247393, -2.864457, 0, 1, 0.4313726, 1,
-0.2175765, -0.6689993, -1.465277, 0, 1, 0.4352941, 1,
-0.2164433, 0.5719715, -0.1940577, 0, 1, 0.4431373, 1,
-0.2156756, 0.8543287, -1.381578, 0, 1, 0.4470588, 1,
-0.2151452, 0.08263415, -1.382357, 0, 1, 0.454902, 1,
-0.2137548, 1.006091, 0.2377284, 0, 1, 0.4588235, 1,
-0.2087441, -0.1272581, -1.273195, 0, 1, 0.4666667, 1,
-0.202361, -0.01843409, -3.045611, 0, 1, 0.4705882, 1,
-0.2022479, -1.232782, -3.310548, 0, 1, 0.4784314, 1,
-0.1979287, 1.477084, 0.2619485, 0, 1, 0.4823529, 1,
-0.1947221, 2.364457, -1.215058, 0, 1, 0.4901961, 1,
-0.191878, 0.1333627, 0.4417891, 0, 1, 0.4941176, 1,
-0.1915771, -0.3260317, -1.895396, 0, 1, 0.5019608, 1,
-0.1903606, 0.6285746, -0.8484707, 0, 1, 0.509804, 1,
-0.1787666, -1.308491, -3.034826, 0, 1, 0.5137255, 1,
-0.1749562, 0.2320725, 1.06835, 0, 1, 0.5215687, 1,
-0.1723078, -0.6885279, -2.653257, 0, 1, 0.5254902, 1,
-0.1710353, -0.364769, -3.185189, 0, 1, 0.5333334, 1,
-0.1683847, -0.9197857, -1.980192, 0, 1, 0.5372549, 1,
-0.1629148, -1.691302, -4.030694, 0, 1, 0.5450981, 1,
-0.1580808, 0.6408461, -0.4919524, 0, 1, 0.5490196, 1,
-0.1541332, -0.4275161, -3.364641, 0, 1, 0.5568628, 1,
-0.1536992, -0.5363685, -2.370023, 0, 1, 0.5607843, 1,
-0.14954, -1.120914, -1.762312, 0, 1, 0.5686275, 1,
-0.1491593, 0.115123, -1.127567, 0, 1, 0.572549, 1,
-0.1490041, -0.2864535, -3.479783, 0, 1, 0.5803922, 1,
-0.1383297, -0.5526328, -1.846803, 0, 1, 0.5843138, 1,
-0.1381416, 1.048148, 2.594282, 0, 1, 0.5921569, 1,
-0.130674, 0.7280772, -0.3077678, 0, 1, 0.5960785, 1,
-0.1285966, -0.4944282, -3.432385, 0, 1, 0.6039216, 1,
-0.1159941, 0.191184, 0.4507042, 0, 1, 0.6117647, 1,
-0.1157845, -0.8486747, -2.766687, 0, 1, 0.6156863, 1,
-0.1156015, -0.0444748, -2.887697, 0, 1, 0.6235294, 1,
-0.1133302, -1.252158, -4.44575, 0, 1, 0.627451, 1,
-0.1034549, 1.087398, -1.117899, 0, 1, 0.6352941, 1,
-0.1014735, -0.1480137, -3.184292, 0, 1, 0.6392157, 1,
-0.0987947, 0.1887603, 0.4430059, 0, 1, 0.6470588, 1,
-0.09860305, 0.7373085, 2.27974, 0, 1, 0.6509804, 1,
-0.0960064, 0.8393347, -0.2102201, 0, 1, 0.6588235, 1,
-0.09384315, 1.053099, -1.592517, 0, 1, 0.6627451, 1,
-0.09346256, -0.00618879, -1.259179, 0, 1, 0.6705883, 1,
-0.09334905, -0.8379208, -4.157593, 0, 1, 0.6745098, 1,
-0.08975063, -0.1215412, -1.633221, 0, 1, 0.682353, 1,
-0.08855405, 0.2232061, 1.118672, 0, 1, 0.6862745, 1,
-0.08298297, 0.7595745, -2.146617, 0, 1, 0.6941177, 1,
-0.08003357, 0.2128121, -0.3746074, 0, 1, 0.7019608, 1,
-0.07668982, 2.392138, -1.489882, 0, 1, 0.7058824, 1,
-0.0682481, 0.9303769, 0.7078128, 0, 1, 0.7137255, 1,
-0.06729793, -1.112732, -4.055191, 0, 1, 0.7176471, 1,
-0.06072516, -0.4729527, -2.260473, 0, 1, 0.7254902, 1,
-0.05386162, -0.1471976, -1.656667, 0, 1, 0.7294118, 1,
-0.0517108, 0.5497282, -0.4645644, 0, 1, 0.7372549, 1,
-0.05108835, -1.174869, -3.6046, 0, 1, 0.7411765, 1,
-0.05072372, 0.6202919, 0.3275372, 0, 1, 0.7490196, 1,
-0.05039748, -0.1212385, -1.415872, 0, 1, 0.7529412, 1,
-0.04921939, -0.5191951, -3.364908, 0, 1, 0.7607843, 1,
-0.04733279, -2.125635, -2.05623, 0, 1, 0.7647059, 1,
-0.04634929, 0.6630485, -0.6020571, 0, 1, 0.772549, 1,
-0.04394699, 0.3450448, -0.8376596, 0, 1, 0.7764706, 1,
-0.04301353, 0.02596662, 0.5014446, 0, 1, 0.7843137, 1,
-0.04265076, -2.02375, -3.020526, 0, 1, 0.7882353, 1,
-0.04106508, -1.62174, -2.864378, 0, 1, 0.7960784, 1,
-0.03481165, -0.01372351, -3.050828, 0, 1, 0.8039216, 1,
-0.0258287, 0.4256008, -0.3317714, 0, 1, 0.8078431, 1,
-0.0237642, 1.06768, 0.5782108, 0, 1, 0.8156863, 1,
-0.02002427, 1.681808, 0.3726765, 0, 1, 0.8196079, 1,
-0.01720783, -0.9000434, -2.820578, 0, 1, 0.827451, 1,
-0.01646461, -0.4033585, -2.239951, 0, 1, 0.8313726, 1,
-0.01646253, 0.09691355, 0.2138631, 0, 1, 0.8392157, 1,
-0.01476069, -0.838085, -4.507793, 0, 1, 0.8431373, 1,
-0.01195133, 0.3755003, -1.592384, 0, 1, 0.8509804, 1,
-0.008158406, -0.3026977, -1.809006, 0, 1, 0.854902, 1,
-0.007150926, 0.4890715, 0.9602457, 0, 1, 0.8627451, 1,
-0.004134457, -0.3384501, -2.80661, 0, 1, 0.8666667, 1,
0.0002541349, 2.207138, -1.831668, 0, 1, 0.8745098, 1,
0.0007357716, -0.1899338, 2.121722, 0, 1, 0.8784314, 1,
0.001162662, -0.01587817, 4.434384, 0, 1, 0.8862745, 1,
0.001859007, 0.006138637, 0.1968591, 0, 1, 0.8901961, 1,
0.002142065, -0.9524432, 4.468261, 0, 1, 0.8980392, 1,
0.00354779, 0.7337897, -0.0760155, 0, 1, 0.9058824, 1,
0.004400362, -0.3812741, 5.562296, 0, 1, 0.9098039, 1,
0.007196107, -1.133539, 3.882347, 0, 1, 0.9176471, 1,
0.007896347, -0.9564108, 3.709533, 0, 1, 0.9215686, 1,
0.007975375, 0.5324566, -1.310147, 0, 1, 0.9294118, 1,
0.008844089, 0.38641, -0.8404929, 0, 1, 0.9333333, 1,
0.009026974, -0.1496527, 3.209695, 0, 1, 0.9411765, 1,
0.01162932, 0.1466238, 2.481341, 0, 1, 0.945098, 1,
0.01436781, -0.423837, 3.207831, 0, 1, 0.9529412, 1,
0.02369105, 0.5660048, -0.5038843, 0, 1, 0.9568627, 1,
0.0251561, 0.7984009, -1.363606, 0, 1, 0.9647059, 1,
0.02599028, 0.1733924, -0.7701595, 0, 1, 0.9686275, 1,
0.0264248, 0.6430297, -0.3566198, 0, 1, 0.9764706, 1,
0.02747808, 1.028985, 1.054442, 0, 1, 0.9803922, 1,
0.02777204, 1.818974, -0.5895612, 0, 1, 0.9882353, 1,
0.03313616, -0.4671936, 2.931393, 0, 1, 0.9921569, 1,
0.0334437, 0.03527573, 0.2986099, 0, 1, 1, 1,
0.03753011, 1.381162, -1.252563, 0, 0.9921569, 1, 1,
0.03827219, -0.6544836, 1.97057, 0, 0.9882353, 1, 1,
0.03964357, -0.3922648, 2.207836, 0, 0.9803922, 1, 1,
0.04481629, -0.1447683, 1.665144, 0, 0.9764706, 1, 1,
0.04567547, 0.6171728, 0.7585791, 0, 0.9686275, 1, 1,
0.04736547, 0.8781736, -0.3061961, 0, 0.9647059, 1, 1,
0.05003242, 0.3924835, -1.243741, 0, 0.9568627, 1, 1,
0.05085106, 0.07777384, 0.9443192, 0, 0.9529412, 1, 1,
0.05125069, 1.513639, -1.259362, 0, 0.945098, 1, 1,
0.05228036, -2.303993, 3.197415, 0, 0.9411765, 1, 1,
0.05502648, 0.3192419, 0.5307223, 0, 0.9333333, 1, 1,
0.05574293, -0.2248703, 0.8578019, 0, 0.9294118, 1, 1,
0.05633102, -0.8943133, 3.822762, 0, 0.9215686, 1, 1,
0.05770585, 0.8305119, -0.1657857, 0, 0.9176471, 1, 1,
0.06241076, -0.2429394, 1.428609, 0, 0.9098039, 1, 1,
0.0651437, -0.5067222, 2.960189, 0, 0.9058824, 1, 1,
0.06527569, 0.2999417, -1.680261, 0, 0.8980392, 1, 1,
0.06542135, 0.2861863, 1.208598, 0, 0.8901961, 1, 1,
0.06594791, -1.364627, 4.23384, 0, 0.8862745, 1, 1,
0.07025195, -0.4700108, 3.391906, 0, 0.8784314, 1, 1,
0.07291679, -0.8045574, 2.483625, 0, 0.8745098, 1, 1,
0.07375274, -1.354315, 3.477548, 0, 0.8666667, 1, 1,
0.0748356, -0.03371632, 3.29224, 0, 0.8627451, 1, 1,
0.07933974, -0.1987987, 2.85885, 0, 0.854902, 1, 1,
0.08211973, 1.255514, -0.7894713, 0, 0.8509804, 1, 1,
0.08249141, 0.3091704, 1.144143, 0, 0.8431373, 1, 1,
0.08368317, -0.38316, 2.420562, 0, 0.8392157, 1, 1,
0.0858537, 1.172902, 1.210115, 0, 0.8313726, 1, 1,
0.08770582, 0.408894, -0.2332301, 0, 0.827451, 1, 1,
0.08789875, 0.7978499, -0.7377354, 0, 0.8196079, 1, 1,
0.09209454, -0.470113, 2.208705, 0, 0.8156863, 1, 1,
0.09856006, 0.3155436, -0.974316, 0, 0.8078431, 1, 1,
0.09946582, -0.07325711, 3.537781, 0, 0.8039216, 1, 1,
0.1014298, 1.300227, 0.5243802, 0, 0.7960784, 1, 1,
0.1016378, -0.439429, 1.557457, 0, 0.7882353, 1, 1,
0.1050105, 2.318883, -0.335773, 0, 0.7843137, 1, 1,
0.1058575, -0.6701261, 3.844733, 0, 0.7764706, 1, 1,
0.106667, -1.540345, 4.301269, 0, 0.772549, 1, 1,
0.1100556, -1.042289, 0.9521186, 0, 0.7647059, 1, 1,
0.1109796, 0.309908, 0.8020214, 0, 0.7607843, 1, 1,
0.1139739, -0.21993, 2.694797, 0, 0.7529412, 1, 1,
0.115316, -0.7243242, 1.091472, 0, 0.7490196, 1, 1,
0.1192718, -0.2307544, 2.094039, 0, 0.7411765, 1, 1,
0.1233939, 1.406872, -0.7184152, 0, 0.7372549, 1, 1,
0.1290798, -0.7421648, 3.946488, 0, 0.7294118, 1, 1,
0.1343047, 0.2145013, -1.061031, 0, 0.7254902, 1, 1,
0.1367504, -0.4933884, 3.196849, 0, 0.7176471, 1, 1,
0.138174, 0.767197, -0.9152, 0, 0.7137255, 1, 1,
0.1447079, 1.829008, -0.8364598, 0, 0.7058824, 1, 1,
0.1471495, -1.108611, 2.019674, 0, 0.6980392, 1, 1,
0.1485414, 0.4455457, -0.1852514, 0, 0.6941177, 1, 1,
0.1539007, -0.01819091, 2.075238, 0, 0.6862745, 1, 1,
0.1594037, -0.2994913, 1.730342, 0, 0.682353, 1, 1,
0.1598665, 0.7436484, 1.006664, 0, 0.6745098, 1, 1,
0.1636997, -0.6320831, 2.844697, 0, 0.6705883, 1, 1,
0.1637583, -0.1118165, 1.929362, 0, 0.6627451, 1, 1,
0.1669361, 0.4904205, 1.611869, 0, 0.6588235, 1, 1,
0.1672397, -0.1691598, 1.387331, 0, 0.6509804, 1, 1,
0.1677269, -0.07691339, 1.764618, 0, 0.6470588, 1, 1,
0.1685273, 1.295947, -0.6307988, 0, 0.6392157, 1, 1,
0.1729674, 1.256727, 1.690563, 0, 0.6352941, 1, 1,
0.1765653, 0.6954454, 2.034333, 0, 0.627451, 1, 1,
0.1774275, -0.9947746, 2.196365, 0, 0.6235294, 1, 1,
0.1782139, 2.29582, 1.706596, 0, 0.6156863, 1, 1,
0.1791109, -0.07720007, 0.2992465, 0, 0.6117647, 1, 1,
0.1830218, 0.5048121, -0.1711956, 0, 0.6039216, 1, 1,
0.1863411, 0.283197, 1.242869, 0, 0.5960785, 1, 1,
0.1877571, 0.961544, -0.9484094, 0, 0.5921569, 1, 1,
0.1894206, -0.8464043, 3.64314, 0, 0.5843138, 1, 1,
0.1933596, -0.4479138, 2.190515, 0, 0.5803922, 1, 1,
0.1962017, 0.480063, 0.4206798, 0, 0.572549, 1, 1,
0.1998416, -1.671628, 3.680791, 0, 0.5686275, 1, 1,
0.2009479, -0.7827522, 5.157419, 0, 0.5607843, 1, 1,
0.2026777, 0.9420372, 1.312586, 0, 0.5568628, 1, 1,
0.2053799, 1.347711, -1.646843, 0, 0.5490196, 1, 1,
0.2123787, 1.481209, 0.9167877, 0, 0.5450981, 1, 1,
0.2146599, -0.7982701, 1.769844, 0, 0.5372549, 1, 1,
0.2208936, 0.8537604, -0.9631952, 0, 0.5333334, 1, 1,
0.2210741, 0.5217036, 1.306121, 0, 0.5254902, 1, 1,
0.2244917, 1.953813, 1.033719, 0, 0.5215687, 1, 1,
0.2252515, -1.72375, 3.551152, 0, 0.5137255, 1, 1,
0.2261443, -1.061963, 1.633056, 0, 0.509804, 1, 1,
0.2263932, -0.8466136, 4.049209, 0, 0.5019608, 1, 1,
0.2294081, -0.2559061, 2.794776, 0, 0.4941176, 1, 1,
0.2320093, 0.05454072, 2.720347, 0, 0.4901961, 1, 1,
0.2373839, 1.678106, 1.267882, 0, 0.4823529, 1, 1,
0.2374561, -0.9983276, 2.109047, 0, 0.4784314, 1, 1,
0.2386632, 0.3715435, 1.936226, 0, 0.4705882, 1, 1,
0.2404693, -0.2511508, 3.801645, 0, 0.4666667, 1, 1,
0.2459513, -1.461427, 2.569953, 0, 0.4588235, 1, 1,
0.2493121, 0.7670218, 1.826024, 0, 0.454902, 1, 1,
0.2561517, 0.3945405, 1.518432, 0, 0.4470588, 1, 1,
0.2575255, -1.093843, 5.342029, 0, 0.4431373, 1, 1,
0.2618469, 0.7514324, 1.647813, 0, 0.4352941, 1, 1,
0.2626841, -0.08472101, 1.480124, 0, 0.4313726, 1, 1,
0.273885, 0.8074113, -0.267768, 0, 0.4235294, 1, 1,
0.2745381, -2.14601, 2.740978, 0, 0.4196078, 1, 1,
0.2818949, -0.3962386, 3.342001, 0, 0.4117647, 1, 1,
0.2863571, 0.7108449, -0.4338827, 0, 0.4078431, 1, 1,
0.2880474, 0.3611884, 1.508979, 0, 0.4, 1, 1,
0.2951621, 0.3605549, 0.5551282, 0, 0.3921569, 1, 1,
0.3041359, -0.7371988, 0.2084854, 0, 0.3882353, 1, 1,
0.3065827, 2.215715, -0.5514972, 0, 0.3803922, 1, 1,
0.3099817, 1.530926, 0.3801391, 0, 0.3764706, 1, 1,
0.3107599, -0.05534887, 0.8024377, 0, 0.3686275, 1, 1,
0.3130377, -1.486289, 3.405376, 0, 0.3647059, 1, 1,
0.3135304, -1.138676, 3.025084, 0, 0.3568628, 1, 1,
0.3182107, 0.6820271, 1.829629, 0, 0.3529412, 1, 1,
0.3186423, 2.785152, 3.295605, 0, 0.345098, 1, 1,
0.320897, 1.683864, 1.024742, 0, 0.3411765, 1, 1,
0.3211387, -0.6560856, 2.268883, 0, 0.3333333, 1, 1,
0.3240352, 0.8467059, -0.8397127, 0, 0.3294118, 1, 1,
0.3269585, -0.6483156, 4.640355, 0, 0.3215686, 1, 1,
0.3355113, 0.2963354, -0.6912606, 0, 0.3176471, 1, 1,
0.3423912, -1.092465, 0.9544284, 0, 0.3098039, 1, 1,
0.3475677, 1.650266, -0.4538101, 0, 0.3058824, 1, 1,
0.3476669, 1.593798, -1.544499, 0, 0.2980392, 1, 1,
0.3540698, 0.8710849, -0.0890984, 0, 0.2901961, 1, 1,
0.3554514, 0.1079661, 0.05522371, 0, 0.2862745, 1, 1,
0.3559888, 2.034784, 0.9853525, 0, 0.2784314, 1, 1,
0.3591161, -1.251719, 3.016169, 0, 0.2745098, 1, 1,
0.359708, 0.328916, 1.635586, 0, 0.2666667, 1, 1,
0.3607869, 0.3339688, 1.514454, 0, 0.2627451, 1, 1,
0.3615002, 0.6372485, 1.441796, 0, 0.254902, 1, 1,
0.3624181, -0.4709217, 2.250471, 0, 0.2509804, 1, 1,
0.3636447, -1.009109, 2.86329, 0, 0.2431373, 1, 1,
0.3669842, -0.07185081, 1.850835, 0, 0.2392157, 1, 1,
0.3744291, 1.673835, 0.06983844, 0, 0.2313726, 1, 1,
0.3768454, -0.4211371, 1.067901, 0, 0.227451, 1, 1,
0.3819109, 1.360833, 1.060965, 0, 0.2196078, 1, 1,
0.3863817, 0.126337, 2.106031, 0, 0.2156863, 1, 1,
0.391418, 0.2979973, -0.2089135, 0, 0.2078431, 1, 1,
0.3984363, -0.9461098, 3.763219, 0, 0.2039216, 1, 1,
0.3985634, 0.03004932, -0.608337, 0, 0.1960784, 1, 1,
0.4002151, -0.03543382, 0.4276425, 0, 0.1882353, 1, 1,
0.4025096, 1.734172, 0.6224192, 0, 0.1843137, 1, 1,
0.4031343, -0.2183911, 2.868943, 0, 0.1764706, 1, 1,
0.4050166, 1.259465, -0.2749811, 0, 0.172549, 1, 1,
0.4057966, -1.431409, 2.692742, 0, 0.1647059, 1, 1,
0.4088306, 0.1740622, 2.252888, 0, 0.1607843, 1, 1,
0.4099742, -1.019256, 2.704664, 0, 0.1529412, 1, 1,
0.4149809, 0.4615894, 0.303619, 0, 0.1490196, 1, 1,
0.4171455, -0.2880116, 2.557248, 0, 0.1411765, 1, 1,
0.4173421, 0.07591389, 0.6099163, 0, 0.1372549, 1, 1,
0.418834, -2.022451, 1.289666, 0, 0.1294118, 1, 1,
0.4212087, -0.7016196, 2.426482, 0, 0.1254902, 1, 1,
0.4335501, 0.4844652, -0.1865226, 0, 0.1176471, 1, 1,
0.4343772, 0.1728605, 0.2077049, 0, 0.1137255, 1, 1,
0.4409112, 0.1841027, 1.846635, 0, 0.1058824, 1, 1,
0.4439422, -1.595449, 2.743917, 0, 0.09803922, 1, 1,
0.4495021, -2.022506, 3.69297, 0, 0.09411765, 1, 1,
0.4501026, 0.1480618, 0.5510439, 0, 0.08627451, 1, 1,
0.4537616, 1.586119, 0.8888959, 0, 0.08235294, 1, 1,
0.4561997, -0.2671556, 3.338128, 0, 0.07450981, 1, 1,
0.4637357, 0.1854307, 0.322763, 0, 0.07058824, 1, 1,
0.4690734, -0.188867, 0.9578512, 0, 0.0627451, 1, 1,
0.4695824, -2.802908, 4.905402, 0, 0.05882353, 1, 1,
0.4696749, 0.1081031, 2.420318, 0, 0.05098039, 1, 1,
0.4713387, 1.112358, 0.4034881, 0, 0.04705882, 1, 1,
0.4739999, -0.8228704, 3.460973, 0, 0.03921569, 1, 1,
0.4751182, -1.355952, 3.483084, 0, 0.03529412, 1, 1,
0.4779339, -0.9169006, 1.641979, 0, 0.02745098, 1, 1,
0.4782244, 0.9791198, 2.107291, 0, 0.02352941, 1, 1,
0.4815503, 0.4121495, 1.706741, 0, 0.01568628, 1, 1,
0.4892993, 0.6000536, 0.07849003, 0, 0.01176471, 1, 1,
0.494681, 0.2281456, -0.9308006, 0, 0.003921569, 1, 1,
0.4960151, -0.8243828, 1.357731, 0.003921569, 0, 1, 1,
0.4982941, -1.415454, 2.247783, 0.007843138, 0, 1, 1,
0.498431, -0.1695909, 0.2782274, 0.01568628, 0, 1, 1,
0.5009325, -0.7181369, 1.494315, 0.01960784, 0, 1, 1,
0.5017825, 1.212085, 0.6643406, 0.02745098, 0, 1, 1,
0.5037907, -0.3949603, 1.944802, 0.03137255, 0, 1, 1,
0.5038001, 0.3640247, 0.1179215, 0.03921569, 0, 1, 1,
0.505978, 0.3749145, 1.039849, 0.04313726, 0, 1, 1,
0.5061477, 0.07663088, 0.1966433, 0.05098039, 0, 1, 1,
0.5075706, -0.9740686, 3.093907, 0.05490196, 0, 1, 1,
0.509574, 2.310501, -0.2531306, 0.0627451, 0, 1, 1,
0.5101218, -0.2349592, 3.998984, 0.06666667, 0, 1, 1,
0.5123137, 0.1420379, 1.297939, 0.07450981, 0, 1, 1,
0.5147073, 1.403067, 1.15848, 0.07843138, 0, 1, 1,
0.5182446, 0.9555857, -0.1654896, 0.08627451, 0, 1, 1,
0.5218333, -0.4439651, 1.893807, 0.09019608, 0, 1, 1,
0.5255848, -1.499462, 4.031906, 0.09803922, 0, 1, 1,
0.5295929, -0.6047516, 4.246718, 0.1058824, 0, 1, 1,
0.5314392, 0.2092148, 1.903862, 0.1098039, 0, 1, 1,
0.5383321, -0.6131441, 1.984994, 0.1176471, 0, 1, 1,
0.5450286, -1.029908, 1.77601, 0.1215686, 0, 1, 1,
0.545479, -1.094326, 2.779164, 0.1294118, 0, 1, 1,
0.5539234, 1.299011, 1.027058, 0.1333333, 0, 1, 1,
0.5584508, 0.2484904, 0.8642411, 0.1411765, 0, 1, 1,
0.5623329, 0.7514353, 0.5917298, 0.145098, 0, 1, 1,
0.5634984, -2.034513, 3.430784, 0.1529412, 0, 1, 1,
0.5644532, -0.6292845, 2.165289, 0.1568628, 0, 1, 1,
0.5667496, 1.481314, 1.179405, 0.1647059, 0, 1, 1,
0.5676965, -0.6993598, 2.240479, 0.1686275, 0, 1, 1,
0.5705277, -2.005916, 4.168797, 0.1764706, 0, 1, 1,
0.5710344, -0.2280417, 1.933625, 0.1803922, 0, 1, 1,
0.574113, -0.5401099, 1.435542, 0.1882353, 0, 1, 1,
0.5765353, 4.124827, 0.7453753, 0.1921569, 0, 1, 1,
0.5782132, 0.9959891, 0.4335772, 0.2, 0, 1, 1,
0.579275, 0.2960657, 0.09018921, 0.2078431, 0, 1, 1,
0.5813393, 1.196892, 1.041042, 0.2117647, 0, 1, 1,
0.5909506, -0.4031102, 1.889401, 0.2196078, 0, 1, 1,
0.5941451, -0.6452276, 3.989157, 0.2235294, 0, 1, 1,
0.59724, -0.6083793, 2.872551, 0.2313726, 0, 1, 1,
0.5973296, -0.8134101, 4.164996, 0.2352941, 0, 1, 1,
0.5979304, -1.055586, 2.277925, 0.2431373, 0, 1, 1,
0.5991622, 0.894407, 2.236621, 0.2470588, 0, 1, 1,
0.5993494, -0.2329953, 2.169528, 0.254902, 0, 1, 1,
0.6026362, -0.05750043, -0.6632298, 0.2588235, 0, 1, 1,
0.602792, 0.4612791, 0.5270332, 0.2666667, 0, 1, 1,
0.6047924, 0.1917635, 0.555034, 0.2705882, 0, 1, 1,
0.6050814, 0.7915148, 0.6073033, 0.2784314, 0, 1, 1,
0.6124802, -0.2340076, 1.679855, 0.282353, 0, 1, 1,
0.6210752, 0.7455528, 1.103606, 0.2901961, 0, 1, 1,
0.6223587, 1.045107, 0.7908604, 0.2941177, 0, 1, 1,
0.6229712, -1.204955, 2.732313, 0.3019608, 0, 1, 1,
0.6231848, 0.1040701, 0.3461459, 0.3098039, 0, 1, 1,
0.6247054, -2.714473, 1.658103, 0.3137255, 0, 1, 1,
0.6283106, -0.4152145, 1.036508, 0.3215686, 0, 1, 1,
0.629309, -0.4177933, 2.186728, 0.3254902, 0, 1, 1,
0.6314885, -2.004311, 2.005024, 0.3333333, 0, 1, 1,
0.6352344, -0.6384674, 3.028884, 0.3372549, 0, 1, 1,
0.6360099, 0.3287273, 0.09260198, 0.345098, 0, 1, 1,
0.636053, 0.5066098, -0.2394234, 0.3490196, 0, 1, 1,
0.6413851, 0.791011, 1.560552, 0.3568628, 0, 1, 1,
0.6427557, 0.2762389, 1.052999, 0.3607843, 0, 1, 1,
0.6442536, 1.196642, 0.5048925, 0.3686275, 0, 1, 1,
0.6488857, 1.56332, 0.9133052, 0.372549, 0, 1, 1,
0.648945, 0.3064311, -0.3661532, 0.3803922, 0, 1, 1,
0.655254, -0.9943656, 2.087069, 0.3843137, 0, 1, 1,
0.6554766, -0.4695902, 1.707938, 0.3921569, 0, 1, 1,
0.6558208, -0.7890925, 3.274156, 0.3960784, 0, 1, 1,
0.6574555, -0.3592, 2.539856, 0.4039216, 0, 1, 1,
0.670075, 0.8880089, 0.4014715, 0.4117647, 0, 1, 1,
0.6706945, 0.01173428, 0.09587787, 0.4156863, 0, 1, 1,
0.6718169, 0.7511535, 1.993317, 0.4235294, 0, 1, 1,
0.6811059, -0.00558083, 1.49775, 0.427451, 0, 1, 1,
0.6837646, 0.4041088, 1.851476, 0.4352941, 0, 1, 1,
0.6838973, 0.109291, 1.763033, 0.4392157, 0, 1, 1,
0.6866838, -0.2065269, 2.944232, 0.4470588, 0, 1, 1,
0.6881207, -1.588675, 3.00842, 0.4509804, 0, 1, 1,
0.6886767, 1.128098, -1.19371, 0.4588235, 0, 1, 1,
0.6887136, 0.7489643, 2.215035, 0.4627451, 0, 1, 1,
0.6965787, 2.094806, -0.2832688, 0.4705882, 0, 1, 1,
0.6970941, 0.2132034, 1.58052, 0.4745098, 0, 1, 1,
0.7020428, -0.4428137, 0.9970875, 0.4823529, 0, 1, 1,
0.7041799, -0.07781572, 1.0743, 0.4862745, 0, 1, 1,
0.7123889, -0.2378299, 1.037876, 0.4941176, 0, 1, 1,
0.7157429, 0.05905718, 1.925305, 0.5019608, 0, 1, 1,
0.71702, -0.8794563, 1.777872, 0.5058824, 0, 1, 1,
0.7172514, 1.248992, 0.9816532, 0.5137255, 0, 1, 1,
0.7219822, -0.2792393, 3.789734, 0.5176471, 0, 1, 1,
0.7226551, -0.0986692, -1.685553, 0.5254902, 0, 1, 1,
0.7328626, 0.491573, 0.1659653, 0.5294118, 0, 1, 1,
0.7374891, 1.718465, 0.02498694, 0.5372549, 0, 1, 1,
0.7457044, -0.2099148, 2.768339, 0.5411765, 0, 1, 1,
0.7473024, -0.2463554, 1.950507, 0.5490196, 0, 1, 1,
0.7482313, 0.7397485, -0.1117929, 0.5529412, 0, 1, 1,
0.7496664, 0.1401699, 1.121882, 0.5607843, 0, 1, 1,
0.7505127, -0.7956704, 2.742424, 0.5647059, 0, 1, 1,
0.7523513, 0.2170061, 0.8321456, 0.572549, 0, 1, 1,
0.7596493, 0.5062099, 0.07508133, 0.5764706, 0, 1, 1,
0.7634292, 2.085911, 0.691503, 0.5843138, 0, 1, 1,
0.7635222, -0.2170993, 2.775746, 0.5882353, 0, 1, 1,
0.7649765, -0.9148896, 5.335762, 0.5960785, 0, 1, 1,
0.7701313, 0.5317286, 1.850418, 0.6039216, 0, 1, 1,
0.7732437, -1.410856, 2.714275, 0.6078432, 0, 1, 1,
0.7795191, -0.7463924, 0.3949705, 0.6156863, 0, 1, 1,
0.7868084, -0.3101463, 1.486145, 0.6196079, 0, 1, 1,
0.7879713, 0.06177278, 1.91479, 0.627451, 0, 1, 1,
0.7936842, 0.568808, 1.325639, 0.6313726, 0, 1, 1,
0.7995248, 1.757169, 1.617494, 0.6392157, 0, 1, 1,
0.8010676, -1.149104, 4.002477, 0.6431373, 0, 1, 1,
0.8062651, 2.014627, 0.2781757, 0.6509804, 0, 1, 1,
0.815283, 0.96611, 0.03356239, 0.654902, 0, 1, 1,
0.8230222, -0.7221298, 3.277311, 0.6627451, 0, 1, 1,
0.8290734, -0.9139729, 2.240327, 0.6666667, 0, 1, 1,
0.8402196, -0.340594, 1.726528, 0.6745098, 0, 1, 1,
0.8556939, 0.4472814, 1.458491, 0.6784314, 0, 1, 1,
0.8613912, -1.149048, 2.487023, 0.6862745, 0, 1, 1,
0.8618695, 1.322894, 0.836413, 0.6901961, 0, 1, 1,
0.8649192, 1.757449, -0.3273825, 0.6980392, 0, 1, 1,
0.8670779, 0.450418, 0.5046261, 0.7058824, 0, 1, 1,
0.8735834, -1.099807, 1.238804, 0.7098039, 0, 1, 1,
0.8744228, 0.7504415, 1.241441, 0.7176471, 0, 1, 1,
0.8777308, 0.4884751, 2.910424, 0.7215686, 0, 1, 1,
0.8789929, -2.095049, 1.247717, 0.7294118, 0, 1, 1,
0.8822148, -0.01153633, 3.134385, 0.7333333, 0, 1, 1,
0.8829263, -0.497067, 2.807437, 0.7411765, 0, 1, 1,
0.8846726, -0.6178195, 2.463557, 0.7450981, 0, 1, 1,
0.8857254, -0.4272924, 2.845069, 0.7529412, 0, 1, 1,
0.8886788, 0.6473799, 0.3536063, 0.7568628, 0, 1, 1,
0.8907999, -0.4003379, 1.410106, 0.7647059, 0, 1, 1,
0.8915908, -0.3071798, 1.985555, 0.7686275, 0, 1, 1,
0.8928766, 2.056227, 1.518507, 0.7764706, 0, 1, 1,
0.8981035, -0.4331818, 3.018427, 0.7803922, 0, 1, 1,
0.9059463, 0.1860152, 1.13205, 0.7882353, 0, 1, 1,
0.9113278, 0.6567838, 2.413643, 0.7921569, 0, 1, 1,
0.9173069, -1.215027, 2.875018, 0.8, 0, 1, 1,
0.9275376, -2.269564, 1.645812, 0.8078431, 0, 1, 1,
0.9287439, 0.08899446, 2.305083, 0.8117647, 0, 1, 1,
0.9311166, 0.9227381, 3.550605, 0.8196079, 0, 1, 1,
0.9395466, 0.7124722, 2.158688, 0.8235294, 0, 1, 1,
0.952338, 0.09326728, 1.657238, 0.8313726, 0, 1, 1,
0.9541027, 0.02552615, 1.227415, 0.8352941, 0, 1, 1,
0.9605564, 0.2241436, 0.8858487, 0.8431373, 0, 1, 1,
0.9630017, 0.2795358, 0.7163277, 0.8470588, 0, 1, 1,
0.9656131, 0.3567385, 0.197181, 0.854902, 0, 1, 1,
0.967905, -1.44458, 2.529147, 0.8588235, 0, 1, 1,
0.9690135, 0.3133354, 2.58736, 0.8666667, 0, 1, 1,
0.9708607, -0.1817168, 2.070086, 0.8705882, 0, 1, 1,
0.9710414, 0.9181136, 1.938292, 0.8784314, 0, 1, 1,
0.9720044, 0.5101817, 1.062358, 0.8823529, 0, 1, 1,
0.9734631, -0.04784147, 2.69227, 0.8901961, 0, 1, 1,
0.9742227, -1.281298, 2.057882, 0.8941177, 0, 1, 1,
0.974249, 0.1885696, 2.495478, 0.9019608, 0, 1, 1,
0.9803935, 0.4003794, 2.596009, 0.9098039, 0, 1, 1,
0.9804053, 0.06818434, 1.299206, 0.9137255, 0, 1, 1,
0.9905571, -0.1859066, 0.8517833, 0.9215686, 0, 1, 1,
1.00198, -0.752537, 1.275528, 0.9254902, 0, 1, 1,
1.003917, 0.9527897, 0.9853147, 0.9333333, 0, 1, 1,
1.028778, 0.6118301, 0.1165882, 0.9372549, 0, 1, 1,
1.029423, 0.3711037, 0.1687581, 0.945098, 0, 1, 1,
1.039379, -1.614356, 1.765751, 0.9490196, 0, 1, 1,
1.043306, -1.52578, 2.76505, 0.9568627, 0, 1, 1,
1.043511, -0.8103242, 0.8726879, 0.9607843, 0, 1, 1,
1.053451, -0.429085, 1.886954, 0.9686275, 0, 1, 1,
1.062848, 1.851263, 0.06557559, 0.972549, 0, 1, 1,
1.068821, -0.1869482, 2.486225, 0.9803922, 0, 1, 1,
1.068972, -0.8826807, 2.518448, 0.9843137, 0, 1, 1,
1.070678, -0.8184672, 2.007799, 0.9921569, 0, 1, 1,
1.072161, 0.4436323, 0.7584909, 0.9960784, 0, 1, 1,
1.073693, 0.7864694, -0.34991, 1, 0, 0.9960784, 1,
1.074417, 2.031147, 1.423639, 1, 0, 0.9882353, 1,
1.076406, 0.8659153, 0.5616947, 1, 0, 0.9843137, 1,
1.076853, -2.775684, 3.118763, 1, 0, 0.9764706, 1,
1.078403, 0.6472039, 0.7439948, 1, 0, 0.972549, 1,
1.083902, 0.6190464, 1.037647, 1, 0, 0.9647059, 1,
1.090522, 0.2828155, 1.880905, 1, 0, 0.9607843, 1,
1.095577, 2.686732, 0.4650787, 1, 0, 0.9529412, 1,
1.097089, 0.2147328, 2.63813, 1, 0, 0.9490196, 1,
1.097535, -0.988669, 1.595972, 1, 0, 0.9411765, 1,
1.104357, -0.5477205, 3.403481, 1, 0, 0.9372549, 1,
1.107586, -0.2850605, 3.642677, 1, 0, 0.9294118, 1,
1.109686, 0.9331997, 1.992705, 1, 0, 0.9254902, 1,
1.11794, 1.142133, 2.041713, 1, 0, 0.9176471, 1,
1.120778, 0.1038154, 2.031026, 1, 0, 0.9137255, 1,
1.133556, -2.119823, 2.301355, 1, 0, 0.9058824, 1,
1.136105, -0.02856837, 2.340109, 1, 0, 0.9019608, 1,
1.145536, 2.456697, 1.658827, 1, 0, 0.8941177, 1,
1.146365, -2.455701, 1.376294, 1, 0, 0.8862745, 1,
1.146406, 1.217004, -0.2597377, 1, 0, 0.8823529, 1,
1.146693, 1.204427, 1.33421, 1, 0, 0.8745098, 1,
1.15144, -1.224634, 1.824475, 1, 0, 0.8705882, 1,
1.152585, -1.931179, 3.471369, 1, 0, 0.8627451, 1,
1.167474, -0.06883754, 1.67414, 1, 0, 0.8588235, 1,
1.17982, 0.850899, 1.363518, 1, 0, 0.8509804, 1,
1.180705, -0.6711457, 2.643866, 1, 0, 0.8470588, 1,
1.183075, -0.3080728, 2.040577, 1, 0, 0.8392157, 1,
1.191687, 1.243265, 1.76532, 1, 0, 0.8352941, 1,
1.205694, -0.7952185, 0.9804169, 1, 0, 0.827451, 1,
1.210784, -0.360609, 2.156907, 1, 0, 0.8235294, 1,
1.21473, 0.6033505, 2.110882, 1, 0, 0.8156863, 1,
1.220401, -0.4174786, 0.6283617, 1, 0, 0.8117647, 1,
1.224928, -1.659313, 1.558353, 1, 0, 0.8039216, 1,
1.22586, 0.07319815, 1.819781, 1, 0, 0.7960784, 1,
1.229316, -0.7970119, 4.278152, 1, 0, 0.7921569, 1,
1.237531, 0.0795548, 3.048942, 1, 0, 0.7843137, 1,
1.241414, -0.07834771, 0.3315387, 1, 0, 0.7803922, 1,
1.259965, -1.618391, 3.06309, 1, 0, 0.772549, 1,
1.261981, -0.2766221, 0.5866896, 1, 0, 0.7686275, 1,
1.262495, 0.780489, 1.130626, 1, 0, 0.7607843, 1,
1.264198, 0.3267961, 1.496442, 1, 0, 0.7568628, 1,
1.272652, -0.01597767, 1.870564, 1, 0, 0.7490196, 1,
1.272655, -0.008730669, 1.608329, 1, 0, 0.7450981, 1,
1.272891, 1.487967, 1.030282, 1, 0, 0.7372549, 1,
1.278122, -0.8464047, 1.852196, 1, 0, 0.7333333, 1,
1.283455, 0.5863733, 0.7648746, 1, 0, 0.7254902, 1,
1.295409, 0.2933693, 1.371895, 1, 0, 0.7215686, 1,
1.298226, -0.8824819, 2.091573, 1, 0, 0.7137255, 1,
1.300104, 0.05896656, 2.479081, 1, 0, 0.7098039, 1,
1.310095, 0.6393839, 2.213198, 1, 0, 0.7019608, 1,
1.310328, -1.243923, 2.841724, 1, 0, 0.6941177, 1,
1.314744, -1.613479, 2.126923, 1, 0, 0.6901961, 1,
1.317972, 0.3603386, 1.650411, 1, 0, 0.682353, 1,
1.321395, 0.9510013, 3.887116, 1, 0, 0.6784314, 1,
1.325992, -1.415479, 1.743541, 1, 0, 0.6705883, 1,
1.331749, -0.005104423, 2.164263, 1, 0, 0.6666667, 1,
1.335811, -0.1607309, -0.4451461, 1, 0, 0.6588235, 1,
1.348527, 0.7504753, 1.603834, 1, 0, 0.654902, 1,
1.348654, 0.02469801, 0.8870114, 1, 0, 0.6470588, 1,
1.364903, 1.316531, 1.158045, 1, 0, 0.6431373, 1,
1.36895, -0.3373703, 1.203855, 1, 0, 0.6352941, 1,
1.371703, 2.256422, 1.080637, 1, 0, 0.6313726, 1,
1.375816, -0.5953563, 2.965112, 1, 0, 0.6235294, 1,
1.376947, 0.8555468, 1.607723, 1, 0, 0.6196079, 1,
1.379901, 0.5607399, 0.1929865, 1, 0, 0.6117647, 1,
1.382077, -0.1989941, 1.308535, 1, 0, 0.6078432, 1,
1.384376, 1.096711, 1.075298, 1, 0, 0.6, 1,
1.387409, -1.145175, 2.559389, 1, 0, 0.5921569, 1,
1.394636, 0.1868512, 1.899913, 1, 0, 0.5882353, 1,
1.409438, -0.270798, 1.955028, 1, 0, 0.5803922, 1,
1.428672, 0.1945945, 1.072056, 1, 0, 0.5764706, 1,
1.43288, -0.7877423, 3.693798, 1, 0, 0.5686275, 1,
1.435587, 0.8061246, 1.43206, 1, 0, 0.5647059, 1,
1.440385, 0.3789018, 2.00602, 1, 0, 0.5568628, 1,
1.44314, -1.709389, 3.87934, 1, 0, 0.5529412, 1,
1.457431, 0.1497353, 3.512602, 1, 0, 0.5450981, 1,
1.459541, 0.663532, 1.752838, 1, 0, 0.5411765, 1,
1.467388, 0.3948468, 1.1134, 1, 0, 0.5333334, 1,
1.490289, 2.300496, 1.12799, 1, 0, 0.5294118, 1,
1.501438, -0.7316971, 1.225675, 1, 0, 0.5215687, 1,
1.505911, -1.297418, 1.848166, 1, 0, 0.5176471, 1,
1.509422, 0.1450568, 2.033166, 1, 0, 0.509804, 1,
1.509444, -1.226944, 0.7117676, 1, 0, 0.5058824, 1,
1.522194, -0.2769495, 1.675318, 1, 0, 0.4980392, 1,
1.531685, -0.841962, 2.244679, 1, 0, 0.4901961, 1,
1.533121, -0.7378337, 1.63575, 1, 0, 0.4862745, 1,
1.540186, -0.006424026, 1.731106, 1, 0, 0.4784314, 1,
1.547329, -0.6280788, 2.181172, 1, 0, 0.4745098, 1,
1.552853, 2.06605, 1.767445, 1, 0, 0.4666667, 1,
1.574539, -0.1864904, -0.761457, 1, 0, 0.4627451, 1,
1.584799, 0.3515273, 1.452069, 1, 0, 0.454902, 1,
1.585094, -0.1025115, -0.03351013, 1, 0, 0.4509804, 1,
1.588866, 0.8010011, 1.651882, 1, 0, 0.4431373, 1,
1.592243, -0.5958564, 1.165857, 1, 0, 0.4392157, 1,
1.608483, 0.2475212, 1.121206, 1, 0, 0.4313726, 1,
1.610057, -0.009408267, 0.9570807, 1, 0, 0.427451, 1,
1.615348, -1.03339, 1.784037, 1, 0, 0.4196078, 1,
1.620742, -0.3113327, 1.298062, 1, 0, 0.4156863, 1,
1.621874, -0.05886917, -0.5456931, 1, 0, 0.4078431, 1,
1.634261, 0.2536392, 2.135013, 1, 0, 0.4039216, 1,
1.635972, 0.667334, 0.2583541, 1, 0, 0.3960784, 1,
1.639974, -0.2630836, 2.47714, 1, 0, 0.3882353, 1,
1.663968, -1.154792, 1.877782, 1, 0, 0.3843137, 1,
1.687417, -0.5343807, 1.996764, 1, 0, 0.3764706, 1,
1.71354, -0.259425, 1.64369, 1, 0, 0.372549, 1,
1.714355, 1.404211, 1.672593, 1, 0, 0.3647059, 1,
1.719225, -1.056358, 1.07497, 1, 0, 0.3607843, 1,
1.720469, 0.1861842, 4.031721, 1, 0, 0.3529412, 1,
1.725143, -0.3790716, 0.8614951, 1, 0, 0.3490196, 1,
1.734885, 1.45291, 1.996263, 1, 0, 0.3411765, 1,
1.737097, 0.8839111, 2.071954, 1, 0, 0.3372549, 1,
1.748083, 1.233856, -0.5483242, 1, 0, 0.3294118, 1,
1.755027, 1.555426, 2.391689, 1, 0, 0.3254902, 1,
1.755646, -0.1437718, 2.311412, 1, 0, 0.3176471, 1,
1.757924, 0.8309903, 1.225339, 1, 0, 0.3137255, 1,
1.765266, -0.1983106, 3.213871, 1, 0, 0.3058824, 1,
1.766381, -0.3427401, 3.202083, 1, 0, 0.2980392, 1,
1.76774, -0.4367092, 3.668604, 1, 0, 0.2941177, 1,
1.793762, -0.03571853, 1.731775, 1, 0, 0.2862745, 1,
1.803939, -0.457103, 1.759078, 1, 0, 0.282353, 1,
1.811295, 1.1295, 1.422228, 1, 0, 0.2745098, 1,
1.820696, 0.08408157, 2.972201, 1, 0, 0.2705882, 1,
1.8464, -1.190623, 1.389218, 1, 0, 0.2627451, 1,
1.857067, -0.1972267, 0.8261861, 1, 0, 0.2588235, 1,
1.866024, -0.421083, 1.823984, 1, 0, 0.2509804, 1,
1.869181, -0.05086307, 2.222857, 1, 0, 0.2470588, 1,
1.888553, -0.2298588, 1.306801, 1, 0, 0.2392157, 1,
1.892117, -0.01061036, 2.554597, 1, 0, 0.2352941, 1,
1.895639, -0.9710373, 2.670539, 1, 0, 0.227451, 1,
1.90926, -1.258075, 1.352442, 1, 0, 0.2235294, 1,
1.916443, 1.004217, 0.9541422, 1, 0, 0.2156863, 1,
1.920439, -0.6025218, 1.328545, 1, 0, 0.2117647, 1,
1.923316, 0.4029698, -0.6450762, 1, 0, 0.2039216, 1,
1.928566, -0.6625198, 1.426318, 1, 0, 0.1960784, 1,
1.937656, -1.175517, 1.264682, 1, 0, 0.1921569, 1,
1.997139, -1.343123, 2.526626, 1, 0, 0.1843137, 1,
2.005755, 1.271443, 2.08445, 1, 0, 0.1803922, 1,
2.013862, -0.1185338, 0.3533511, 1, 0, 0.172549, 1,
2.028158, -0.692911, 3.844156, 1, 0, 0.1686275, 1,
2.028602, -0.2272412, 2.693624, 1, 0, 0.1607843, 1,
2.038431, 1.99219, 0.8414629, 1, 0, 0.1568628, 1,
2.078167, -0.5961547, 2.311281, 1, 0, 0.1490196, 1,
2.092536, 1.022715, 0.6980163, 1, 0, 0.145098, 1,
2.099769, 0.9653689, 2.605339, 1, 0, 0.1372549, 1,
2.101835, 0.7415839, 1.997697, 1, 0, 0.1333333, 1,
2.106245, -1.094879, 3.716335, 1, 0, 0.1254902, 1,
2.112639, -0.4173474, 2.617312, 1, 0, 0.1215686, 1,
2.193858, 0.01318969, 1.456641, 1, 0, 0.1137255, 1,
2.198124, -0.1282393, 1.820829, 1, 0, 0.1098039, 1,
2.203223, -0.109822, 2.29538, 1, 0, 0.1019608, 1,
2.212066, -0.1789768, 1.89382, 1, 0, 0.09411765, 1,
2.214832, -0.7390221, 3.05807, 1, 0, 0.09019608, 1,
2.226654, -1.108293, 2.24335, 1, 0, 0.08235294, 1,
2.295304, 0.3864354, 0.9740461, 1, 0, 0.07843138, 1,
2.295309, 0.8603225, 1.047994, 1, 0, 0.07058824, 1,
2.306175, 1.182612, 2.114406, 1, 0, 0.06666667, 1,
2.342881, 0.1024473, 0.4545966, 1, 0, 0.05882353, 1,
2.386214, -0.6103295, 2.059572, 1, 0, 0.05490196, 1,
2.409122, 0.01761907, 0.6285244, 1, 0, 0.04705882, 1,
2.478672, -0.4797355, 1.15347, 1, 0, 0.04313726, 1,
2.54348, -0.2317907, 0.6879721, 1, 0, 0.03529412, 1,
2.560003, 0.6583008, 1.926823, 1, 0, 0.03137255, 1,
2.5839, -1.535821, 1.129102, 1, 0, 0.02352941, 1,
2.601746, -0.8323771, 1.356292, 1, 0, 0.01960784, 1,
2.818084, -0.8595491, 1.512982, 1, 0, 0.01176471, 1,
2.878583, -0.712218, 1.203775, 1, 0, 0.007843138, 1
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
-0.5353558, -4.968345, -6.914921, 0, -0.5, 0.5, 0.5,
-0.5353558, -4.968345, -6.914921, 1, -0.5, 0.5, 0.5,
-0.5353558, -4.968345, -6.914921, 1, 1.5, 0.5, 0.5,
-0.5353558, -4.968345, -6.914921, 0, 1.5, 0.5, 0.5
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
-5.10662, 0.2371945, -6.914921, 0, -0.5, 0.5, 0.5,
-5.10662, 0.2371945, -6.914921, 1, -0.5, 0.5, 0.5,
-5.10662, 0.2371945, -6.914921, 1, 1.5, 0.5, 0.5,
-5.10662, 0.2371945, -6.914921, 0, 1.5, 0.5, 0.5
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
-5.10662, -4.968345, 0.2278726, 0, -0.5, 0.5, 0.5,
-5.10662, -4.968345, 0.2278726, 1, -0.5, 0.5, 0.5,
-5.10662, -4.968345, 0.2278726, 1, 1.5, 0.5, 0.5,
-5.10662, -4.968345, 0.2278726, 0, 1.5, 0.5, 0.5
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
-3, -3.767067, -5.266584,
2, -3.767067, -5.266584,
-3, -3.767067, -5.266584,
-3, -3.96728, -5.541306,
-2, -3.767067, -5.266584,
-2, -3.96728, -5.541306,
-1, -3.767067, -5.266584,
-1, -3.96728, -5.541306,
0, -3.767067, -5.266584,
0, -3.96728, -5.541306,
1, -3.767067, -5.266584,
1, -3.96728, -5.541306,
2, -3.767067, -5.266584,
2, -3.96728, -5.541306
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
-3, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
-3, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
-3, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
-3, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5,
-2, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
-2, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
-2, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
-2, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5,
-1, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
-1, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
-1, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
-1, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5,
0, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
0, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
0, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
0, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5,
1, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
1, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
1, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
1, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5,
2, -4.367706, -6.090752, 0, -0.5, 0.5, 0.5,
2, -4.367706, -6.090752, 1, -0.5, 0.5, 0.5,
2, -4.367706, -6.090752, 1, 1.5, 0.5, 0.5,
2, -4.367706, -6.090752, 0, 1.5, 0.5, 0.5
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
-4.051713, -2, -5.266584,
-4.051713, 4, -5.266584,
-4.051713, -2, -5.266584,
-4.227531, -2, -5.541306,
-4.051713, 0, -5.266584,
-4.227531, 0, -5.541306,
-4.051713, 2, -5.266584,
-4.227531, 2, -5.541306,
-4.051713, 4, -5.266584,
-4.227531, 4, -5.541306
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
"2",
"4"
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
-4.579166, -2, -6.090752, 0, -0.5, 0.5, 0.5,
-4.579166, -2, -6.090752, 1, -0.5, 0.5, 0.5,
-4.579166, -2, -6.090752, 1, 1.5, 0.5, 0.5,
-4.579166, -2, -6.090752, 0, 1.5, 0.5, 0.5,
-4.579166, 0, -6.090752, 0, -0.5, 0.5, 0.5,
-4.579166, 0, -6.090752, 1, -0.5, 0.5, 0.5,
-4.579166, 0, -6.090752, 1, 1.5, 0.5, 0.5,
-4.579166, 0, -6.090752, 0, 1.5, 0.5, 0.5,
-4.579166, 2, -6.090752, 0, -0.5, 0.5, 0.5,
-4.579166, 2, -6.090752, 1, -0.5, 0.5, 0.5,
-4.579166, 2, -6.090752, 1, 1.5, 0.5, 0.5,
-4.579166, 2, -6.090752, 0, 1.5, 0.5, 0.5,
-4.579166, 4, -6.090752, 0, -0.5, 0.5, 0.5,
-4.579166, 4, -6.090752, 1, -0.5, 0.5, 0.5,
-4.579166, 4, -6.090752, 1, 1.5, 0.5, 0.5,
-4.579166, 4, -6.090752, 0, 1.5, 0.5, 0.5
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
-4.051713, -3.767067, -4,
-4.051713, -3.767067, 4,
-4.051713, -3.767067, -4,
-4.227531, -3.96728, -4,
-4.051713, -3.767067, -2,
-4.227531, -3.96728, -2,
-4.051713, -3.767067, 0,
-4.227531, -3.96728, 0,
-4.051713, -3.767067, 2,
-4.227531, -3.96728, 2,
-4.051713, -3.767067, 4,
-4.227531, -3.96728, 4
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
-4.579166, -4.367706, -4, 0, -0.5, 0.5, 0.5,
-4.579166, -4.367706, -4, 1, -0.5, 0.5, 0.5,
-4.579166, -4.367706, -4, 1, 1.5, 0.5, 0.5,
-4.579166, -4.367706, -4, 0, 1.5, 0.5, 0.5,
-4.579166, -4.367706, -2, 0, -0.5, 0.5, 0.5,
-4.579166, -4.367706, -2, 1, -0.5, 0.5, 0.5,
-4.579166, -4.367706, -2, 1, 1.5, 0.5, 0.5,
-4.579166, -4.367706, -2, 0, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 0, 0, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 0, 1, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 0, 1, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 0, 0, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 2, 0, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 2, 1, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 2, 1, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 2, 0, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 4, 0, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 4, 1, -0.5, 0.5, 0.5,
-4.579166, -4.367706, 4, 1, 1.5, 0.5, 0.5,
-4.579166, -4.367706, 4, 0, 1.5, 0.5, 0.5
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
-4.051713, -3.767067, -5.266584,
-4.051713, 4.241456, -5.266584,
-4.051713, -3.767067, 5.722329,
-4.051713, 4.241456, 5.722329,
-4.051713, -3.767067, -5.266584,
-4.051713, -3.767067, 5.722329,
-4.051713, 4.241456, -5.266584,
-4.051713, 4.241456, 5.722329,
-4.051713, -3.767067, -5.266584,
2.981001, -3.767067, -5.266584,
-4.051713, -3.767067, 5.722329,
2.981001, -3.767067, 5.722329,
-4.051713, 4.241456, -5.266584,
2.981001, 4.241456, -5.266584,
-4.051713, 4.241456, 5.722329,
2.981001, 4.241456, 5.722329,
2.981001, -3.767067, -5.266584,
2.981001, 4.241456, -5.266584,
2.981001, -3.767067, 5.722329,
2.981001, 4.241456, 5.722329,
2.981001, -3.767067, -5.266584,
2.981001, -3.767067, 5.722329,
2.981001, 4.241456, -5.266584,
2.981001, 4.241456, 5.722329
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
var radius = 8.174469;
var distance = 36.36914;
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
mvMatrix.translate( 0.5353558, -0.2371945, -0.2278726 );
mvMatrix.scale( 1.256755, 1.103624, 0.8043012 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.36914);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
arsenite<-read.table("arsenite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsenite$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsenite' not found
```

```r
y<-arsenite$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsenite' not found
```

```r
z<-arsenite$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsenite' not found
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
-3.949295, 0.3857708, -1.11126, 0, 0, 1, 1, 1,
-3.931175, 0.9857878, -1.569929, 1, 0, 0, 1, 1,
-3.350342, -2.275204, -4.642124, 1, 0, 0, 1, 1,
-3.112339, -1.426205, -3.290204, 1, 0, 0, 1, 1,
-2.642241, 0.160723, -1.901873, 1, 0, 0, 1, 1,
-2.493981, -1.150919, -1.140823, 1, 0, 0, 1, 1,
-2.431357, 1.871394, 0.1231851, 0, 0, 0, 1, 1,
-2.418718, -0.8920337, -0.5198396, 0, 0, 0, 1, 1,
-2.394636, -0.1524289, -2.07817, 0, 0, 0, 1, 1,
-2.369876, -0.1850949, -2.727959, 0, 0, 0, 1, 1,
-2.355784, -2.390908, -3.641802, 0, 0, 0, 1, 1,
-2.304379, 2.657501, 0.07236776, 0, 0, 0, 1, 1,
-2.268322, -1.090732, -1.100408, 0, 0, 0, 1, 1,
-2.248803, 0.3889603, -2.17179, 1, 1, 1, 1, 1,
-2.210883, 0.7089777, -2.988092, 1, 1, 1, 1, 1,
-2.193188, 0.8569658, -0.6670359, 1, 1, 1, 1, 1,
-2.134669, 1.216823, -2.685903, 1, 1, 1, 1, 1,
-2.1317, -0.3584658, -0.3073677, 1, 1, 1, 1, 1,
-2.095099, 0.9865887, -1.110742, 1, 1, 1, 1, 1,
-2.074404, 1.887613, -0.7117716, 1, 1, 1, 1, 1,
-2.073457, 1.715014, -0.7648967, 1, 1, 1, 1, 1,
-2.047481, -0.612168, -1.984416, 1, 1, 1, 1, 1,
-2.002976, 1.065457, -1.788611, 1, 1, 1, 1, 1,
-1.981285, -0.2782663, -1.554532, 1, 1, 1, 1, 1,
-1.950697, 1.225096, -1.20954, 1, 1, 1, 1, 1,
-1.950403, 1.759505, -1.245389, 1, 1, 1, 1, 1,
-1.931931, -0.5068678, -2.005141, 1, 1, 1, 1, 1,
-1.925088, -2.255342, -3.622619, 1, 1, 1, 1, 1,
-1.910857, -1.608805, -1.597349, 0, 0, 1, 1, 1,
-1.910186, 0.9757493, -3.138608, 1, 0, 0, 1, 1,
-1.90041, -1.149708, -2.406907, 1, 0, 0, 1, 1,
-1.899703, 0.03857286, -0.825799, 1, 0, 0, 1, 1,
-1.890173, -0.5196444, -1.393717, 1, 0, 0, 1, 1,
-1.855319, 0.8391033, -1.109792, 1, 0, 0, 1, 1,
-1.832786, -0.3532992, -0.5809395, 0, 0, 0, 1, 1,
-1.824568, -1.296002, -1.407017, 0, 0, 0, 1, 1,
-1.822734, 0.4678326, -0.787168, 0, 0, 0, 1, 1,
-1.817908, 0.9093733, 0.5839404, 0, 0, 0, 1, 1,
-1.814931, 0.8469281, -2.033925, 0, 0, 0, 1, 1,
-1.814412, -0.5129992, -1.183976, 0, 0, 0, 1, 1,
-1.781937, -1.299622, -2.745152, 0, 0, 0, 1, 1,
-1.781548, -0.1854475, -3.369897, 1, 1, 1, 1, 1,
-1.765565, -0.2435232, -1.103067, 1, 1, 1, 1, 1,
-1.764271, 0.9643097, -0.5025777, 1, 1, 1, 1, 1,
-1.760315, 0.08129517, -0.1821927, 1, 1, 1, 1, 1,
-1.758113, 0.6650727, -2.002577, 1, 1, 1, 1, 1,
-1.755024, 0.3925429, -1.336954, 1, 1, 1, 1, 1,
-1.738132, 0.2441573, -3.228681, 1, 1, 1, 1, 1,
-1.72575, -0.5017261, -1.778082, 1, 1, 1, 1, 1,
-1.722179, 0.2116627, -2.380435, 1, 1, 1, 1, 1,
-1.721833, -0.3535947, -0.6369541, 1, 1, 1, 1, 1,
-1.72167, -1.014491, -2.24203, 1, 1, 1, 1, 1,
-1.704463, 1.077345, -2.343363, 1, 1, 1, 1, 1,
-1.704072, 1.341481, -0.3905977, 1, 1, 1, 1, 1,
-1.703195, 0.4859159, -1.596138, 1, 1, 1, 1, 1,
-1.700382, 0.7580916, -2.082908, 1, 1, 1, 1, 1,
-1.68923, 0.1865519, -1.683424, 0, 0, 1, 1, 1,
-1.657949, -2.192423, -3.591672, 1, 0, 0, 1, 1,
-1.653523, -0.4001982, -2.204049, 1, 0, 0, 1, 1,
-1.652887, -0.7795044, -1.753813, 1, 0, 0, 1, 1,
-1.641294, -1.39716, -4.258164, 1, 0, 0, 1, 1,
-1.634509, -0.5346704, -0.02393284, 1, 0, 0, 1, 1,
-1.632429, 0.04543975, -3.644313, 0, 0, 0, 1, 1,
-1.623535, 0.5119194, 0.02778416, 0, 0, 0, 1, 1,
-1.603613, -0.1404872, -1.434974, 0, 0, 0, 1, 1,
-1.585339, 0.7049705, 0.2370289, 0, 0, 0, 1, 1,
-1.582253, 0.09886971, -2.007664, 0, 0, 0, 1, 1,
-1.577363, 1.14866, -1.045934, 0, 0, 0, 1, 1,
-1.569181, -0.1014059, -0.6674844, 0, 0, 0, 1, 1,
-1.531707, 1.627667, -0.5930226, 1, 1, 1, 1, 1,
-1.518582, -0.6671543, -2.162559, 1, 1, 1, 1, 1,
-1.47325, 1.230724, -1.24555, 1, 1, 1, 1, 1,
-1.471943, 0.09223648, -2.315723, 1, 1, 1, 1, 1,
-1.470072, -0.3996243, -3.215994, 1, 1, 1, 1, 1,
-1.462628, 0.4064202, -1.13923, 1, 1, 1, 1, 1,
-1.456075, -0.1991522, -2.830253, 1, 1, 1, 1, 1,
-1.455591, 1.133223, -1.885582, 1, 1, 1, 1, 1,
-1.453841, 1.265929, -0.7168673, 1, 1, 1, 1, 1,
-1.439203, -0.4132509, -1.544109, 1, 1, 1, 1, 1,
-1.437773, 1.348389, -1.502628, 1, 1, 1, 1, 1,
-1.436948, 0.1824108, -1.038365, 1, 1, 1, 1, 1,
-1.416281, -0.3340103, -1.387808, 1, 1, 1, 1, 1,
-1.406371, -0.1421483, -2.878612, 1, 1, 1, 1, 1,
-1.40457, 0.9854052, -1.384551, 1, 1, 1, 1, 1,
-1.397867, 0.1150951, -2.572641, 0, 0, 1, 1, 1,
-1.379694, -1.730938, -3.553642, 1, 0, 0, 1, 1,
-1.365732, 1.632791, -1.862653, 1, 0, 0, 1, 1,
-1.359925, 0.2400116, -1.384899, 1, 0, 0, 1, 1,
-1.359373, -0.6842324, -2.41325, 1, 0, 0, 1, 1,
-1.356201, 1.822445, 0.1070498, 1, 0, 0, 1, 1,
-1.355277, -0.1992456, -1.494899, 0, 0, 0, 1, 1,
-1.346539, 1.028656, -0.2905542, 0, 0, 0, 1, 1,
-1.339507, 0.1022448, -0.3829958, 0, 0, 0, 1, 1,
-1.318849, -1.212572, -1.054216, 0, 0, 0, 1, 1,
-1.304316, -1.270355, -3.848799, 0, 0, 0, 1, 1,
-1.300325, 1.727026, -0.7982416, 0, 0, 0, 1, 1,
-1.298345, 0.9384403, -1.541282, 0, 0, 0, 1, 1,
-1.297577, -0.1002264, -1.538853, 1, 1, 1, 1, 1,
-1.297286, -0.2608139, -0.5564051, 1, 1, 1, 1, 1,
-1.28715, 0.6275925, -1.256742, 1, 1, 1, 1, 1,
-1.27836, 0.952881, -2.6187, 1, 1, 1, 1, 1,
-1.264971, 0.0917356, -1.5536, 1, 1, 1, 1, 1,
-1.258824, 1.509002, -0.625877, 1, 1, 1, 1, 1,
-1.25717, -0.09277675, -0.9059301, 1, 1, 1, 1, 1,
-1.256078, -0.09488792, -1.411516, 1, 1, 1, 1, 1,
-1.256039, -0.7257012, -1.886692, 1, 1, 1, 1, 1,
-1.253788, -1.591815, -2.401363, 1, 1, 1, 1, 1,
-1.248788, 0.9111399, -2.849251, 1, 1, 1, 1, 1,
-1.244934, 0.7364659, -0.5832235, 1, 1, 1, 1, 1,
-1.241382, -0.05538829, -2.345637, 1, 1, 1, 1, 1,
-1.233442, 0.3427248, -2.802982, 1, 1, 1, 1, 1,
-1.231116, 1.181492, -0.9279846, 1, 1, 1, 1, 1,
-1.228235, 0.8928799, -0.2155269, 0, 0, 1, 1, 1,
-1.227393, 0.3801383, -0.3259747, 1, 0, 0, 1, 1,
-1.218806, 0.07892789, -3.257272, 1, 0, 0, 1, 1,
-1.218271, 0.4756417, -1.081671, 1, 0, 0, 1, 1,
-1.216431, -0.9667813, -2.105769, 1, 0, 0, 1, 1,
-1.214019, 0.8080138, -1.701213, 1, 0, 0, 1, 1,
-1.203107, -0.623674, -2.375854, 0, 0, 0, 1, 1,
-1.199942, 1.09453, -0.9060122, 0, 0, 0, 1, 1,
-1.198973, -0.6164253, -2.339926, 0, 0, 0, 1, 1,
-1.196565, -0.9994342, -4.287776, 0, 0, 0, 1, 1,
-1.196563, -0.5300486, -2.166197, 0, 0, 0, 1, 1,
-1.191948, 0.05300027, -2.020272, 0, 0, 0, 1, 1,
-1.184631, 0.1012263, -0.1506468, 0, 0, 0, 1, 1,
-1.177919, -1.026216, -1.032805, 1, 1, 1, 1, 1,
-1.157746, 0.1353764, -0.8411192, 1, 1, 1, 1, 1,
-1.155852, 0.6615676, -3.324035, 1, 1, 1, 1, 1,
-1.154408, 0.7031448, -1.739683, 1, 1, 1, 1, 1,
-1.151545, 0.6514595, -1.191618, 1, 1, 1, 1, 1,
-1.150665, 0.6241367, -1.573633, 1, 1, 1, 1, 1,
-1.13507, -0.6265836, 0.631196, 1, 1, 1, 1, 1,
-1.13025, 0.1289957, -2.128767, 1, 1, 1, 1, 1,
-1.115196, -2.01193, -2.551307, 1, 1, 1, 1, 1,
-1.107241, -0.551528, -2.240818, 1, 1, 1, 1, 1,
-1.105031, 1.036493, -2.351128, 1, 1, 1, 1, 1,
-1.096625, -0.1820749, -2.066445, 1, 1, 1, 1, 1,
-1.084605, 0.1725627, -0.9367045, 1, 1, 1, 1, 1,
-1.082892, -1.111706, -2.859228, 1, 1, 1, 1, 1,
-1.082282, -0.9844323, -0.2626483, 1, 1, 1, 1, 1,
-1.077814, 0.2934406, -1.561171, 0, 0, 1, 1, 1,
-1.074486, 0.2568696, -2.732234, 1, 0, 0, 1, 1,
-1.069722, -0.6110204, -0.7286673, 1, 0, 0, 1, 1,
-1.067502, 0.9413013, -0.9513986, 1, 0, 0, 1, 1,
-1.062675, 0.3160128, -0.7281673, 1, 0, 0, 1, 1,
-1.062343, 0.6775075, 1.27762, 1, 0, 0, 1, 1,
-1.052741, -1.765585, -3.234722, 0, 0, 0, 1, 1,
-1.047357, 0.1829326, -1.694929, 0, 0, 0, 1, 1,
-1.03711, -0.6502545, -4.183818, 0, 0, 0, 1, 1,
-1.036649, 0.6475313, -2.281794, 0, 0, 0, 1, 1,
-1.035949, 2.175899, -1.36332, 0, 0, 0, 1, 1,
-1.035552, 0.5262133, -0.9922951, 0, 0, 0, 1, 1,
-1.025381, -0.7858326, -2.919255, 0, 0, 0, 1, 1,
-1.017233, -2.131144, -2.817289, 1, 1, 1, 1, 1,
-1.015234, -0.1852801, -0.7412692, 1, 1, 1, 1, 1,
-0.9943547, -0.3373273, -3.041496, 1, 1, 1, 1, 1,
-0.9832055, 0.2883539, -1.445711, 1, 1, 1, 1, 1,
-0.980565, -0.294048, -2.060555, 1, 1, 1, 1, 1,
-0.9783464, 1.067171, -1.862489, 1, 1, 1, 1, 1,
-0.9656426, 1.285402, -2.505618, 1, 1, 1, 1, 1,
-0.9645314, 0.6480414, -1.040105, 1, 1, 1, 1, 1,
-0.9629655, 0.01543735, -2.115005, 1, 1, 1, 1, 1,
-0.9533272, -1.549264, -2.761306, 1, 1, 1, 1, 1,
-0.9515143, 0.3787304, -1.614245, 1, 1, 1, 1, 1,
-0.9492709, -0.5832559, -2.393795, 1, 1, 1, 1, 1,
-0.9288537, -0.4155611, -2.581393, 1, 1, 1, 1, 1,
-0.9237518, -0.1321025, -2.051968, 1, 1, 1, 1, 1,
-0.9209436, -0.7847949, -1.64485, 1, 1, 1, 1, 1,
-0.9119707, -0.1481883, -1.778035, 0, 0, 1, 1, 1,
-0.9088818, -0.444101, -3.014091, 1, 0, 0, 1, 1,
-0.9083679, -1.21666, -0.6792041, 1, 0, 0, 1, 1,
-0.9071636, 0.1789105, 0.2228233, 1, 0, 0, 1, 1,
-0.9058297, -0.5265087, -1.499271, 1, 0, 0, 1, 1,
-0.9038985, -0.3781232, -2.936149, 1, 0, 0, 1, 1,
-0.8897228, -1.680188, -3.274014, 0, 0, 0, 1, 1,
-0.888686, -2.288053, -2.295098, 0, 0, 0, 1, 1,
-0.8861341, 0.4605564, -0.1303498, 0, 0, 0, 1, 1,
-0.8820936, 0.253281, -2.167656, 0, 0, 0, 1, 1,
-0.8749629, -0.3250611, -2.758298, 0, 0, 0, 1, 1,
-0.8700141, -1.273268, -2.916674, 0, 0, 0, 1, 1,
-0.8695837, 0.4531462, -1.577841, 0, 0, 0, 1, 1,
-0.859139, 0.3425347, -2.422096, 1, 1, 1, 1, 1,
-0.8574117, 0.06562306, -1.475067, 1, 1, 1, 1, 1,
-0.8494666, -0.3286773, -0.9557675, 1, 1, 1, 1, 1,
-0.8494534, -0.332566, -3.633985, 1, 1, 1, 1, 1,
-0.8467718, 1.755501, 0.6490408, 1, 1, 1, 1, 1,
-0.8452982, 0.03226129, -0.7709388, 1, 1, 1, 1, 1,
-0.8419203, 2.697482, 0.1307379, 1, 1, 1, 1, 1,
-0.8418609, -0.3611092, -1.774607, 1, 1, 1, 1, 1,
-0.8404298, -0.6494014, -1.51305, 1, 1, 1, 1, 1,
-0.8341333, -0.9086012, -2.822802, 1, 1, 1, 1, 1,
-0.832776, 0.9704053, -1.085259, 1, 1, 1, 1, 1,
-0.8297072, -0.05995731, -2.123387, 1, 1, 1, 1, 1,
-0.8241608, -0.714002, -2.445768, 1, 1, 1, 1, 1,
-0.821117, 0.01394875, -0.7918651, 1, 1, 1, 1, 1,
-0.8208967, 0.3923762, -1.145824, 1, 1, 1, 1, 1,
-0.820662, 1.428345, 0.6752039, 0, 0, 1, 1, 1,
-0.8179018, 0.3527461, 0.237812, 1, 0, 0, 1, 1,
-0.8156314, 2.486669, 0.383174, 1, 0, 0, 1, 1,
-0.8131372, 1.354414, -0.1136087, 1, 0, 0, 1, 1,
-0.8074214, -1.030903, -3.193631, 1, 0, 0, 1, 1,
-0.8045244, -0.9629309, -0.6275297, 1, 0, 0, 1, 1,
-0.7995145, -0.2733981, -1.123567, 0, 0, 0, 1, 1,
-0.7958038, -1.945529, -4.688912, 0, 0, 0, 1, 1,
-0.7953511, 0.1631179, -1.3555, 0, 0, 0, 1, 1,
-0.7818781, 0.3287026, -0.7712959, 0, 0, 0, 1, 1,
-0.777862, 0.4632868, -1.384386, 0, 0, 0, 1, 1,
-0.7729764, -0.1190379, -3.542584, 0, 0, 0, 1, 1,
-0.768732, -0.74713, -1.202479, 0, 0, 0, 1, 1,
-0.7682297, 0.720693, 0.09992928, 1, 1, 1, 1, 1,
-0.7663178, 0.1466999, -1.950401, 1, 1, 1, 1, 1,
-0.7632366, -1.49539, -1.261219, 1, 1, 1, 1, 1,
-0.7629452, 0.3801804, 0.01033167, 1, 1, 1, 1, 1,
-0.7602302, 2.02675, -0.06648552, 1, 1, 1, 1, 1,
-0.7575823, -0.4755527, -2.959844, 1, 1, 1, 1, 1,
-0.7548643, -0.1552544, -0.6058794, 1, 1, 1, 1, 1,
-0.7422799, -0.3646375, -0.6319454, 1, 1, 1, 1, 1,
-0.7395248, -0.08659348, -0.7649496, 1, 1, 1, 1, 1,
-0.732265, 0.287246, -0.5625635, 1, 1, 1, 1, 1,
-0.7314761, 0.8629699, 0.6205915, 1, 1, 1, 1, 1,
-0.7292157, -0.2994402, -2.533633, 1, 1, 1, 1, 1,
-0.7285554, 0.6770013, -0.3167363, 1, 1, 1, 1, 1,
-0.7259845, -0.8583569, -3.661543, 1, 1, 1, 1, 1,
-0.7150891, 0.107291, -1.013855, 1, 1, 1, 1, 1,
-0.7073194, -0.01629159, -3.241556, 0, 0, 1, 1, 1,
-0.7059439, 0.0125603, -0.8227645, 1, 0, 0, 1, 1,
-0.7018115, -0.4910609, -1.324434, 1, 0, 0, 1, 1,
-0.6988704, -1.04639, -3.166855, 1, 0, 0, 1, 1,
-0.6974792, -0.02412381, -0.3539953, 1, 0, 0, 1, 1,
-0.6875523, 1.029514, -0.4939697, 1, 0, 0, 1, 1,
-0.6849682, -0.2548499, -3.098756, 0, 0, 0, 1, 1,
-0.683171, -0.02599398, -3.30733, 0, 0, 0, 1, 1,
-0.6797265, 0.0136938, -1.867417, 0, 0, 0, 1, 1,
-0.6754811, 0.1251461, -0.8292776, 0, 0, 0, 1, 1,
-0.6730298, -0.1195664, -0.7140081, 0, 0, 0, 1, 1,
-0.6727505, 1.132231, 0.6882953, 0, 0, 0, 1, 1,
-0.6694849, 0.7082095, -0.6372519, 0, 0, 0, 1, 1,
-0.6692036, -0.7116679, -2.376527, 1, 1, 1, 1, 1,
-0.6651673, -0.07251018, 0.3235901, 1, 1, 1, 1, 1,
-0.6644418, -0.5848651, -1.311386, 1, 1, 1, 1, 1,
-0.6623459, -2.279805, -4.286852, 1, 1, 1, 1, 1,
-0.6615177, 1.00421, -0.421577, 1, 1, 1, 1, 1,
-0.6537583, -1.050301, -3.392487, 1, 1, 1, 1, 1,
-0.6531129, -1.567573, -1.900451, 1, 1, 1, 1, 1,
-0.6518338, -0.986326, -2.448927, 1, 1, 1, 1, 1,
-0.6514009, -0.1968148, -3.853729, 1, 1, 1, 1, 1,
-0.6513914, 0.4897756, -1.489662, 1, 1, 1, 1, 1,
-0.6431878, 0.01952427, -0.8474913, 1, 1, 1, 1, 1,
-0.6401298, 0.1843948, -0.9984313, 1, 1, 1, 1, 1,
-0.6397745, -0.02215157, -2.132226, 1, 1, 1, 1, 1,
-0.6382342, 0.6044281, 0.3986453, 1, 1, 1, 1, 1,
-0.6355847, 0.05035059, -1.578666, 1, 1, 1, 1, 1,
-0.6303045, 1.273629, 0.9599382, 0, 0, 1, 1, 1,
-0.629944, -0.01076727, -1.36476, 1, 0, 0, 1, 1,
-0.6291775, -0.1851217, -2.496465, 1, 0, 0, 1, 1,
-0.6281756, 1.166524, -1.226166, 1, 0, 0, 1, 1,
-0.6263099, 0.748728, -1.721846, 1, 0, 0, 1, 1,
-0.6262728, -1.310146, -3.453322, 1, 0, 0, 1, 1,
-0.6253218, -0.8691274, -3.43917, 0, 0, 0, 1, 1,
-0.6205002, 1.281929, -0.2485256, 0, 0, 0, 1, 1,
-0.6160011, 0.1400593, 0.330374, 0, 0, 0, 1, 1,
-0.6159394, -0.5463532, -2.565722, 0, 0, 0, 1, 1,
-0.6088488, 0.02838762, -1.230538, 0, 0, 0, 1, 1,
-0.6081486, -0.617335, -3.062105, 0, 0, 0, 1, 1,
-0.6048959, -0.6564395, -3.978493, 0, 0, 0, 1, 1,
-0.6024262, -0.9670876, -3.274838, 1, 1, 1, 1, 1,
-0.6021509, 1.060723, -0.2198993, 1, 1, 1, 1, 1,
-0.5965998, -1.428844, -4.959643, 1, 1, 1, 1, 1,
-0.5963052, -0.1240318, -1.492921, 1, 1, 1, 1, 1,
-0.5952663, -0.675764, -1.57636, 1, 1, 1, 1, 1,
-0.5919886, -0.1801742, -2.688195, 1, 1, 1, 1, 1,
-0.5915509, -3.650438, -2.774274, 1, 1, 1, 1, 1,
-0.5902991, -1.759129, -2.380696, 1, 1, 1, 1, 1,
-0.5861315, -1.895702, -3.379766, 1, 1, 1, 1, 1,
-0.5783882, -0.5183018, -1.04184, 1, 1, 1, 1, 1,
-0.5777678, -0.5194262, -1.968136, 1, 1, 1, 1, 1,
-0.5775958, -1.11015, -1.909118, 1, 1, 1, 1, 1,
-0.5699007, 2.325203, -3.297795, 1, 1, 1, 1, 1,
-0.5695965, -0.3946825, -1.862892, 1, 1, 1, 1, 1,
-0.5671859, 0.03396749, -1.78583, 1, 1, 1, 1, 1,
-0.5652657, 1.016046, -0.1255101, 0, 0, 1, 1, 1,
-0.5644027, -0.1602727, -0.6162632, 1, 0, 0, 1, 1,
-0.5629929, -0.5580735, -2.521187, 1, 0, 0, 1, 1,
-0.5628443, 0.699765, 0.4385975, 1, 0, 0, 1, 1,
-0.5593065, -0.5709289, -3.609472, 1, 0, 0, 1, 1,
-0.5538667, 0.9482078, -3.939463, 1, 0, 0, 1, 1,
-0.5535338, 1.420472, 0.4098231, 0, 0, 0, 1, 1,
-0.5529289, -0.8854432, -2.114292, 0, 0, 0, 1, 1,
-0.5525047, -0.5553468, -1.688074, 0, 0, 0, 1, 1,
-0.5520147, -1.503284, -3.218576, 0, 0, 0, 1, 1,
-0.5501994, 1.024163, -0.2021126, 0, 0, 0, 1, 1,
-0.5495872, -0.2041895, -2.237988, 0, 0, 0, 1, 1,
-0.5418165, -0.2863403, -2.579358, 0, 0, 0, 1, 1,
-0.5382183, -0.8690679, -3.31843, 1, 1, 1, 1, 1,
-0.537371, 1.611725, -1.790675, 1, 1, 1, 1, 1,
-0.5369378, 0.5881149, -1.892164, 1, 1, 1, 1, 1,
-0.5350121, 1.994215, -0.3307843, 1, 1, 1, 1, 1,
-0.5279167, -0.9830227, -3.038428, 1, 1, 1, 1, 1,
-0.5272253, -2.38088, -3.036048, 1, 1, 1, 1, 1,
-0.524745, -0.8046314, -2.931064, 1, 1, 1, 1, 1,
-0.5134958, 1.226822, -1.328297, 1, 1, 1, 1, 1,
-0.5128812, -0.0336953, -1.471284, 1, 1, 1, 1, 1,
-0.5128776, -0.2861195, -1.050015, 1, 1, 1, 1, 1,
-0.5124889, -1.434453, -4.268497, 1, 1, 1, 1, 1,
-0.5097167, 2.291087, -0.5636851, 1, 1, 1, 1, 1,
-0.4984833, -0.6518547, -0.7049022, 1, 1, 1, 1, 1,
-0.4931928, 2.74954, -0.5803519, 1, 1, 1, 1, 1,
-0.4860443, -0.7639216, -2.739869, 1, 1, 1, 1, 1,
-0.4846378, -0.6840675, -3.228896, 0, 0, 1, 1, 1,
-0.481541, 1.558544, -1.772729, 1, 0, 0, 1, 1,
-0.4682973, -0.4868135, -2.317521, 1, 0, 0, 1, 1,
-0.4679883, -0.7225023, -1.589887, 1, 0, 0, 1, 1,
-0.4662491, -1.703726, -1.664326, 1, 0, 0, 1, 1,
-0.4658369, -1.481177, -3.320363, 1, 0, 0, 1, 1,
-0.4656948, 0.9330592, -1.147376, 0, 0, 0, 1, 1,
-0.4624493, 0.04818587, -1.999035, 0, 0, 0, 1, 1,
-0.4577168, 1.222942, 1.232559, 0, 0, 0, 1, 1,
-0.4557449, -0.5418887, -3.004889, 0, 0, 0, 1, 1,
-0.455605, -1.35855, -3.393398, 0, 0, 0, 1, 1,
-0.4428324, 0.2798854, -0.9098305, 0, 0, 0, 1, 1,
-0.4404114, -0.05691661, -3.218964, 0, 0, 0, 1, 1,
-0.438244, 0.3500518, -1.021687, 1, 1, 1, 1, 1,
-0.435935, -0.8065645, -1.147473, 1, 1, 1, 1, 1,
-0.4256894, -0.2305169, -2.179617, 1, 1, 1, 1, 1,
-0.4206206, -0.05655058, -1.337497, 1, 1, 1, 1, 1,
-0.4170738, -0.8662165, -2.699826, 1, 1, 1, 1, 1,
-0.4159788, 0.3417403, -0.7252152, 1, 1, 1, 1, 1,
-0.4122179, 0.7949765, -2.804623, 1, 1, 1, 1, 1,
-0.405894, -0.9755527, -2.512213, 1, 1, 1, 1, 1,
-0.4056698, -0.7171587, -3.119012, 1, 1, 1, 1, 1,
-0.4047888, 0.7324104, -1.50286, 1, 1, 1, 1, 1,
-0.4012461, -0.8941428, -3.068961, 1, 1, 1, 1, 1,
-0.3997211, 1.787531, -0.2582114, 1, 1, 1, 1, 1,
-0.3980788, 1.815458, -1.206335, 1, 1, 1, 1, 1,
-0.3948017, -1.204663, -2.732084, 1, 1, 1, 1, 1,
-0.394801, -0.8276221, -0.4606174, 1, 1, 1, 1, 1,
-0.3941782, -0.4678182, -1.783416, 0, 0, 1, 1, 1,
-0.3940815, 0.2701332, -1.284489, 1, 0, 0, 1, 1,
-0.3869273, -0.8780371, -4.491978, 1, 0, 0, 1, 1,
-0.3832173, -0.707888, -4.029442, 1, 0, 0, 1, 1,
-0.3821506, 0.07772251, -3.271594, 1, 0, 0, 1, 1,
-0.3757797, 0.5493162, -1.009847, 1, 0, 0, 1, 1,
-0.3667786, -0.3228827, -1.776657, 0, 0, 0, 1, 1,
-0.3660568, 1.68069, -1.215536, 0, 0, 0, 1, 1,
-0.3652903, -0.4971036, -4.23327, 0, 0, 0, 1, 1,
-0.357219, 1.320907, -0.2197253, 0, 0, 0, 1, 1,
-0.3571174, 1.691343, -0.5483961, 0, 0, 0, 1, 1,
-0.3569737, -2.038339, -2.838882, 0, 0, 0, 1, 1,
-0.3544953, 1.149405, 1.0937, 0, 0, 0, 1, 1,
-0.351148, 1.306201, -0.9554463, 1, 1, 1, 1, 1,
-0.3504397, 1.163878, -1.51641, 1, 1, 1, 1, 1,
-0.3485665, -1.090521, -3.011837, 1, 1, 1, 1, 1,
-0.3441381, 0.4407264, -0.4933628, 1, 1, 1, 1, 1,
-0.3386013, 0.3095211, 0.710006, 1, 1, 1, 1, 1,
-0.3384173, 0.3379933, -1.387992, 1, 1, 1, 1, 1,
-0.3355453, 1.26843, -0.3815349, 1, 1, 1, 1, 1,
-0.3311463, -1.303962, -2.567393, 1, 1, 1, 1, 1,
-0.3253041, -0.3633845, -3.48549, 1, 1, 1, 1, 1,
-0.3234954, 1.064227, 0.7425152, 1, 1, 1, 1, 1,
-0.3228955, -0.08214549, -1.045852, 1, 1, 1, 1, 1,
-0.3220998, -1.246099, -1.860836, 1, 1, 1, 1, 1,
-0.3202773, 1.100309, 0.5179158, 1, 1, 1, 1, 1,
-0.3161263, 0.5680876, -0.2078461, 1, 1, 1, 1, 1,
-0.3068078, 1.656408, -0.7889658, 1, 1, 1, 1, 1,
-0.3042941, -0.08612726, -2.017226, 0, 0, 1, 1, 1,
-0.3027145, -1.139982, -3.299086, 1, 0, 0, 1, 1,
-0.2996694, -0.9028324, -2.919288, 1, 0, 0, 1, 1,
-0.2983654, 1.503186, 0.7039413, 1, 0, 0, 1, 1,
-0.2974946, 0.1340261, -1.506422, 1, 0, 0, 1, 1,
-0.2927499, -0.0696395, -0.5345335, 1, 0, 0, 1, 1,
-0.2901267, -0.6814005, -1.724413, 0, 0, 0, 1, 1,
-0.2800411, 0.8897176, 0.7773998, 0, 0, 0, 1, 1,
-0.2799867, 0.3272864, -1.251993, 0, 0, 0, 1, 1,
-0.2787375, -0.9229028, -1.600258, 0, 0, 0, 1, 1,
-0.2787267, -1.286846, -3.636081, 0, 0, 0, 1, 1,
-0.2776144, 0.2296381, -1.238441, 0, 0, 0, 1, 1,
-0.2727754, 1.175811, 1.118343, 0, 0, 0, 1, 1,
-0.2712861, -0.728361, -3.280213, 1, 1, 1, 1, 1,
-0.2695449, -0.5510852, -1.852795, 1, 1, 1, 1, 1,
-0.2684285, 0.9432981, -0.9705651, 1, 1, 1, 1, 1,
-0.2653319, -0.08972707, -1.752617, 1, 1, 1, 1, 1,
-0.2636769, 2.105096, 0.8477916, 1, 1, 1, 1, 1,
-0.2612455, -0.6429577, -3.290154, 1, 1, 1, 1, 1,
-0.2601459, 0.4404607, -1.363265, 1, 1, 1, 1, 1,
-0.256213, 0.2270039, -3.348317, 1, 1, 1, 1, 1,
-0.2553806, -0.3592948, -2.132353, 1, 1, 1, 1, 1,
-0.2543328, 0.7331541, -0.6554673, 1, 1, 1, 1, 1,
-0.252778, 0.3622293, 0.3908408, 1, 1, 1, 1, 1,
-0.2477477, -0.2251621, -1.918092, 1, 1, 1, 1, 1,
-0.2465213, 1.339042, -0.2186737, 1, 1, 1, 1, 1,
-0.24437, -0.4526595, -2.37923, 1, 1, 1, 1, 1,
-0.243958, 1.749177, 1.166363, 1, 1, 1, 1, 1,
-0.243268, 1.075397, 0.7194647, 0, 0, 1, 1, 1,
-0.2428216, 0.7538176, 0.01381688, 1, 0, 0, 1, 1,
-0.2425222, -0.9422538, -3.142924, 1, 0, 0, 1, 1,
-0.235742, -0.291449, -1.50313, 1, 0, 0, 1, 1,
-0.2357181, 1.462125, 2.432324, 1, 0, 0, 1, 1,
-0.2336601, -0.1353849, -0.2526204, 1, 0, 0, 1, 1,
-0.2316616, -2.00145, -1.742449, 0, 0, 0, 1, 1,
-0.2300599, -0.6581452, -2.571568, 0, 0, 0, 1, 1,
-0.2286432, -0.237061, -4.155905, 0, 0, 0, 1, 1,
-0.2264694, 1.033219, -0.6506945, 0, 0, 0, 1, 1,
-0.2255003, -0.5878204, -5.106551, 0, 0, 0, 1, 1,
-0.2234715, 0.5778313, 1.587829, 0, 0, 0, 1, 1,
-0.2218904, 0.1542065, -0.5373183, 0, 0, 0, 1, 1,
-0.2179257, -0.6247393, -2.864457, 1, 1, 1, 1, 1,
-0.2175765, -0.6689993, -1.465277, 1, 1, 1, 1, 1,
-0.2164433, 0.5719715, -0.1940577, 1, 1, 1, 1, 1,
-0.2156756, 0.8543287, -1.381578, 1, 1, 1, 1, 1,
-0.2151452, 0.08263415, -1.382357, 1, 1, 1, 1, 1,
-0.2137548, 1.006091, 0.2377284, 1, 1, 1, 1, 1,
-0.2087441, -0.1272581, -1.273195, 1, 1, 1, 1, 1,
-0.202361, -0.01843409, -3.045611, 1, 1, 1, 1, 1,
-0.2022479, -1.232782, -3.310548, 1, 1, 1, 1, 1,
-0.1979287, 1.477084, 0.2619485, 1, 1, 1, 1, 1,
-0.1947221, 2.364457, -1.215058, 1, 1, 1, 1, 1,
-0.191878, 0.1333627, 0.4417891, 1, 1, 1, 1, 1,
-0.1915771, -0.3260317, -1.895396, 1, 1, 1, 1, 1,
-0.1903606, 0.6285746, -0.8484707, 1, 1, 1, 1, 1,
-0.1787666, -1.308491, -3.034826, 1, 1, 1, 1, 1,
-0.1749562, 0.2320725, 1.06835, 0, 0, 1, 1, 1,
-0.1723078, -0.6885279, -2.653257, 1, 0, 0, 1, 1,
-0.1710353, -0.364769, -3.185189, 1, 0, 0, 1, 1,
-0.1683847, -0.9197857, -1.980192, 1, 0, 0, 1, 1,
-0.1629148, -1.691302, -4.030694, 1, 0, 0, 1, 1,
-0.1580808, 0.6408461, -0.4919524, 1, 0, 0, 1, 1,
-0.1541332, -0.4275161, -3.364641, 0, 0, 0, 1, 1,
-0.1536992, -0.5363685, -2.370023, 0, 0, 0, 1, 1,
-0.14954, -1.120914, -1.762312, 0, 0, 0, 1, 1,
-0.1491593, 0.115123, -1.127567, 0, 0, 0, 1, 1,
-0.1490041, -0.2864535, -3.479783, 0, 0, 0, 1, 1,
-0.1383297, -0.5526328, -1.846803, 0, 0, 0, 1, 1,
-0.1381416, 1.048148, 2.594282, 0, 0, 0, 1, 1,
-0.130674, 0.7280772, -0.3077678, 1, 1, 1, 1, 1,
-0.1285966, -0.4944282, -3.432385, 1, 1, 1, 1, 1,
-0.1159941, 0.191184, 0.4507042, 1, 1, 1, 1, 1,
-0.1157845, -0.8486747, -2.766687, 1, 1, 1, 1, 1,
-0.1156015, -0.0444748, -2.887697, 1, 1, 1, 1, 1,
-0.1133302, -1.252158, -4.44575, 1, 1, 1, 1, 1,
-0.1034549, 1.087398, -1.117899, 1, 1, 1, 1, 1,
-0.1014735, -0.1480137, -3.184292, 1, 1, 1, 1, 1,
-0.0987947, 0.1887603, 0.4430059, 1, 1, 1, 1, 1,
-0.09860305, 0.7373085, 2.27974, 1, 1, 1, 1, 1,
-0.0960064, 0.8393347, -0.2102201, 1, 1, 1, 1, 1,
-0.09384315, 1.053099, -1.592517, 1, 1, 1, 1, 1,
-0.09346256, -0.00618879, -1.259179, 1, 1, 1, 1, 1,
-0.09334905, -0.8379208, -4.157593, 1, 1, 1, 1, 1,
-0.08975063, -0.1215412, -1.633221, 1, 1, 1, 1, 1,
-0.08855405, 0.2232061, 1.118672, 0, 0, 1, 1, 1,
-0.08298297, 0.7595745, -2.146617, 1, 0, 0, 1, 1,
-0.08003357, 0.2128121, -0.3746074, 1, 0, 0, 1, 1,
-0.07668982, 2.392138, -1.489882, 1, 0, 0, 1, 1,
-0.0682481, 0.9303769, 0.7078128, 1, 0, 0, 1, 1,
-0.06729793, -1.112732, -4.055191, 1, 0, 0, 1, 1,
-0.06072516, -0.4729527, -2.260473, 0, 0, 0, 1, 1,
-0.05386162, -0.1471976, -1.656667, 0, 0, 0, 1, 1,
-0.0517108, 0.5497282, -0.4645644, 0, 0, 0, 1, 1,
-0.05108835, -1.174869, -3.6046, 0, 0, 0, 1, 1,
-0.05072372, 0.6202919, 0.3275372, 0, 0, 0, 1, 1,
-0.05039748, -0.1212385, -1.415872, 0, 0, 0, 1, 1,
-0.04921939, -0.5191951, -3.364908, 0, 0, 0, 1, 1,
-0.04733279, -2.125635, -2.05623, 1, 1, 1, 1, 1,
-0.04634929, 0.6630485, -0.6020571, 1, 1, 1, 1, 1,
-0.04394699, 0.3450448, -0.8376596, 1, 1, 1, 1, 1,
-0.04301353, 0.02596662, 0.5014446, 1, 1, 1, 1, 1,
-0.04265076, -2.02375, -3.020526, 1, 1, 1, 1, 1,
-0.04106508, -1.62174, -2.864378, 1, 1, 1, 1, 1,
-0.03481165, -0.01372351, -3.050828, 1, 1, 1, 1, 1,
-0.0258287, 0.4256008, -0.3317714, 1, 1, 1, 1, 1,
-0.0237642, 1.06768, 0.5782108, 1, 1, 1, 1, 1,
-0.02002427, 1.681808, 0.3726765, 1, 1, 1, 1, 1,
-0.01720783, -0.9000434, -2.820578, 1, 1, 1, 1, 1,
-0.01646461, -0.4033585, -2.239951, 1, 1, 1, 1, 1,
-0.01646253, 0.09691355, 0.2138631, 1, 1, 1, 1, 1,
-0.01476069, -0.838085, -4.507793, 1, 1, 1, 1, 1,
-0.01195133, 0.3755003, -1.592384, 1, 1, 1, 1, 1,
-0.008158406, -0.3026977, -1.809006, 0, 0, 1, 1, 1,
-0.007150926, 0.4890715, 0.9602457, 1, 0, 0, 1, 1,
-0.004134457, -0.3384501, -2.80661, 1, 0, 0, 1, 1,
0.0002541349, 2.207138, -1.831668, 1, 0, 0, 1, 1,
0.0007357716, -0.1899338, 2.121722, 1, 0, 0, 1, 1,
0.001162662, -0.01587817, 4.434384, 1, 0, 0, 1, 1,
0.001859007, 0.006138637, 0.1968591, 0, 0, 0, 1, 1,
0.002142065, -0.9524432, 4.468261, 0, 0, 0, 1, 1,
0.00354779, 0.7337897, -0.0760155, 0, 0, 0, 1, 1,
0.004400362, -0.3812741, 5.562296, 0, 0, 0, 1, 1,
0.007196107, -1.133539, 3.882347, 0, 0, 0, 1, 1,
0.007896347, -0.9564108, 3.709533, 0, 0, 0, 1, 1,
0.007975375, 0.5324566, -1.310147, 0, 0, 0, 1, 1,
0.008844089, 0.38641, -0.8404929, 1, 1, 1, 1, 1,
0.009026974, -0.1496527, 3.209695, 1, 1, 1, 1, 1,
0.01162932, 0.1466238, 2.481341, 1, 1, 1, 1, 1,
0.01436781, -0.423837, 3.207831, 1, 1, 1, 1, 1,
0.02369105, 0.5660048, -0.5038843, 1, 1, 1, 1, 1,
0.0251561, 0.7984009, -1.363606, 1, 1, 1, 1, 1,
0.02599028, 0.1733924, -0.7701595, 1, 1, 1, 1, 1,
0.0264248, 0.6430297, -0.3566198, 1, 1, 1, 1, 1,
0.02747808, 1.028985, 1.054442, 1, 1, 1, 1, 1,
0.02777204, 1.818974, -0.5895612, 1, 1, 1, 1, 1,
0.03313616, -0.4671936, 2.931393, 1, 1, 1, 1, 1,
0.0334437, 0.03527573, 0.2986099, 1, 1, 1, 1, 1,
0.03753011, 1.381162, -1.252563, 1, 1, 1, 1, 1,
0.03827219, -0.6544836, 1.97057, 1, 1, 1, 1, 1,
0.03964357, -0.3922648, 2.207836, 1, 1, 1, 1, 1,
0.04481629, -0.1447683, 1.665144, 0, 0, 1, 1, 1,
0.04567547, 0.6171728, 0.7585791, 1, 0, 0, 1, 1,
0.04736547, 0.8781736, -0.3061961, 1, 0, 0, 1, 1,
0.05003242, 0.3924835, -1.243741, 1, 0, 0, 1, 1,
0.05085106, 0.07777384, 0.9443192, 1, 0, 0, 1, 1,
0.05125069, 1.513639, -1.259362, 1, 0, 0, 1, 1,
0.05228036, -2.303993, 3.197415, 0, 0, 0, 1, 1,
0.05502648, 0.3192419, 0.5307223, 0, 0, 0, 1, 1,
0.05574293, -0.2248703, 0.8578019, 0, 0, 0, 1, 1,
0.05633102, -0.8943133, 3.822762, 0, 0, 0, 1, 1,
0.05770585, 0.8305119, -0.1657857, 0, 0, 0, 1, 1,
0.06241076, -0.2429394, 1.428609, 0, 0, 0, 1, 1,
0.0651437, -0.5067222, 2.960189, 0, 0, 0, 1, 1,
0.06527569, 0.2999417, -1.680261, 1, 1, 1, 1, 1,
0.06542135, 0.2861863, 1.208598, 1, 1, 1, 1, 1,
0.06594791, -1.364627, 4.23384, 1, 1, 1, 1, 1,
0.07025195, -0.4700108, 3.391906, 1, 1, 1, 1, 1,
0.07291679, -0.8045574, 2.483625, 1, 1, 1, 1, 1,
0.07375274, -1.354315, 3.477548, 1, 1, 1, 1, 1,
0.0748356, -0.03371632, 3.29224, 1, 1, 1, 1, 1,
0.07933974, -0.1987987, 2.85885, 1, 1, 1, 1, 1,
0.08211973, 1.255514, -0.7894713, 1, 1, 1, 1, 1,
0.08249141, 0.3091704, 1.144143, 1, 1, 1, 1, 1,
0.08368317, -0.38316, 2.420562, 1, 1, 1, 1, 1,
0.0858537, 1.172902, 1.210115, 1, 1, 1, 1, 1,
0.08770582, 0.408894, -0.2332301, 1, 1, 1, 1, 1,
0.08789875, 0.7978499, -0.7377354, 1, 1, 1, 1, 1,
0.09209454, -0.470113, 2.208705, 1, 1, 1, 1, 1,
0.09856006, 0.3155436, -0.974316, 0, 0, 1, 1, 1,
0.09946582, -0.07325711, 3.537781, 1, 0, 0, 1, 1,
0.1014298, 1.300227, 0.5243802, 1, 0, 0, 1, 1,
0.1016378, -0.439429, 1.557457, 1, 0, 0, 1, 1,
0.1050105, 2.318883, -0.335773, 1, 0, 0, 1, 1,
0.1058575, -0.6701261, 3.844733, 1, 0, 0, 1, 1,
0.106667, -1.540345, 4.301269, 0, 0, 0, 1, 1,
0.1100556, -1.042289, 0.9521186, 0, 0, 0, 1, 1,
0.1109796, 0.309908, 0.8020214, 0, 0, 0, 1, 1,
0.1139739, -0.21993, 2.694797, 0, 0, 0, 1, 1,
0.115316, -0.7243242, 1.091472, 0, 0, 0, 1, 1,
0.1192718, -0.2307544, 2.094039, 0, 0, 0, 1, 1,
0.1233939, 1.406872, -0.7184152, 0, 0, 0, 1, 1,
0.1290798, -0.7421648, 3.946488, 1, 1, 1, 1, 1,
0.1343047, 0.2145013, -1.061031, 1, 1, 1, 1, 1,
0.1367504, -0.4933884, 3.196849, 1, 1, 1, 1, 1,
0.138174, 0.767197, -0.9152, 1, 1, 1, 1, 1,
0.1447079, 1.829008, -0.8364598, 1, 1, 1, 1, 1,
0.1471495, -1.108611, 2.019674, 1, 1, 1, 1, 1,
0.1485414, 0.4455457, -0.1852514, 1, 1, 1, 1, 1,
0.1539007, -0.01819091, 2.075238, 1, 1, 1, 1, 1,
0.1594037, -0.2994913, 1.730342, 1, 1, 1, 1, 1,
0.1598665, 0.7436484, 1.006664, 1, 1, 1, 1, 1,
0.1636997, -0.6320831, 2.844697, 1, 1, 1, 1, 1,
0.1637583, -0.1118165, 1.929362, 1, 1, 1, 1, 1,
0.1669361, 0.4904205, 1.611869, 1, 1, 1, 1, 1,
0.1672397, -0.1691598, 1.387331, 1, 1, 1, 1, 1,
0.1677269, -0.07691339, 1.764618, 1, 1, 1, 1, 1,
0.1685273, 1.295947, -0.6307988, 0, 0, 1, 1, 1,
0.1729674, 1.256727, 1.690563, 1, 0, 0, 1, 1,
0.1765653, 0.6954454, 2.034333, 1, 0, 0, 1, 1,
0.1774275, -0.9947746, 2.196365, 1, 0, 0, 1, 1,
0.1782139, 2.29582, 1.706596, 1, 0, 0, 1, 1,
0.1791109, -0.07720007, 0.2992465, 1, 0, 0, 1, 1,
0.1830218, 0.5048121, -0.1711956, 0, 0, 0, 1, 1,
0.1863411, 0.283197, 1.242869, 0, 0, 0, 1, 1,
0.1877571, 0.961544, -0.9484094, 0, 0, 0, 1, 1,
0.1894206, -0.8464043, 3.64314, 0, 0, 0, 1, 1,
0.1933596, -0.4479138, 2.190515, 0, 0, 0, 1, 1,
0.1962017, 0.480063, 0.4206798, 0, 0, 0, 1, 1,
0.1998416, -1.671628, 3.680791, 0, 0, 0, 1, 1,
0.2009479, -0.7827522, 5.157419, 1, 1, 1, 1, 1,
0.2026777, 0.9420372, 1.312586, 1, 1, 1, 1, 1,
0.2053799, 1.347711, -1.646843, 1, 1, 1, 1, 1,
0.2123787, 1.481209, 0.9167877, 1, 1, 1, 1, 1,
0.2146599, -0.7982701, 1.769844, 1, 1, 1, 1, 1,
0.2208936, 0.8537604, -0.9631952, 1, 1, 1, 1, 1,
0.2210741, 0.5217036, 1.306121, 1, 1, 1, 1, 1,
0.2244917, 1.953813, 1.033719, 1, 1, 1, 1, 1,
0.2252515, -1.72375, 3.551152, 1, 1, 1, 1, 1,
0.2261443, -1.061963, 1.633056, 1, 1, 1, 1, 1,
0.2263932, -0.8466136, 4.049209, 1, 1, 1, 1, 1,
0.2294081, -0.2559061, 2.794776, 1, 1, 1, 1, 1,
0.2320093, 0.05454072, 2.720347, 1, 1, 1, 1, 1,
0.2373839, 1.678106, 1.267882, 1, 1, 1, 1, 1,
0.2374561, -0.9983276, 2.109047, 1, 1, 1, 1, 1,
0.2386632, 0.3715435, 1.936226, 0, 0, 1, 1, 1,
0.2404693, -0.2511508, 3.801645, 1, 0, 0, 1, 1,
0.2459513, -1.461427, 2.569953, 1, 0, 0, 1, 1,
0.2493121, 0.7670218, 1.826024, 1, 0, 0, 1, 1,
0.2561517, 0.3945405, 1.518432, 1, 0, 0, 1, 1,
0.2575255, -1.093843, 5.342029, 1, 0, 0, 1, 1,
0.2618469, 0.7514324, 1.647813, 0, 0, 0, 1, 1,
0.2626841, -0.08472101, 1.480124, 0, 0, 0, 1, 1,
0.273885, 0.8074113, -0.267768, 0, 0, 0, 1, 1,
0.2745381, -2.14601, 2.740978, 0, 0, 0, 1, 1,
0.2818949, -0.3962386, 3.342001, 0, 0, 0, 1, 1,
0.2863571, 0.7108449, -0.4338827, 0, 0, 0, 1, 1,
0.2880474, 0.3611884, 1.508979, 0, 0, 0, 1, 1,
0.2951621, 0.3605549, 0.5551282, 1, 1, 1, 1, 1,
0.3041359, -0.7371988, 0.2084854, 1, 1, 1, 1, 1,
0.3065827, 2.215715, -0.5514972, 1, 1, 1, 1, 1,
0.3099817, 1.530926, 0.3801391, 1, 1, 1, 1, 1,
0.3107599, -0.05534887, 0.8024377, 1, 1, 1, 1, 1,
0.3130377, -1.486289, 3.405376, 1, 1, 1, 1, 1,
0.3135304, -1.138676, 3.025084, 1, 1, 1, 1, 1,
0.3182107, 0.6820271, 1.829629, 1, 1, 1, 1, 1,
0.3186423, 2.785152, 3.295605, 1, 1, 1, 1, 1,
0.320897, 1.683864, 1.024742, 1, 1, 1, 1, 1,
0.3211387, -0.6560856, 2.268883, 1, 1, 1, 1, 1,
0.3240352, 0.8467059, -0.8397127, 1, 1, 1, 1, 1,
0.3269585, -0.6483156, 4.640355, 1, 1, 1, 1, 1,
0.3355113, 0.2963354, -0.6912606, 1, 1, 1, 1, 1,
0.3423912, -1.092465, 0.9544284, 1, 1, 1, 1, 1,
0.3475677, 1.650266, -0.4538101, 0, 0, 1, 1, 1,
0.3476669, 1.593798, -1.544499, 1, 0, 0, 1, 1,
0.3540698, 0.8710849, -0.0890984, 1, 0, 0, 1, 1,
0.3554514, 0.1079661, 0.05522371, 1, 0, 0, 1, 1,
0.3559888, 2.034784, 0.9853525, 1, 0, 0, 1, 1,
0.3591161, -1.251719, 3.016169, 1, 0, 0, 1, 1,
0.359708, 0.328916, 1.635586, 0, 0, 0, 1, 1,
0.3607869, 0.3339688, 1.514454, 0, 0, 0, 1, 1,
0.3615002, 0.6372485, 1.441796, 0, 0, 0, 1, 1,
0.3624181, -0.4709217, 2.250471, 0, 0, 0, 1, 1,
0.3636447, -1.009109, 2.86329, 0, 0, 0, 1, 1,
0.3669842, -0.07185081, 1.850835, 0, 0, 0, 1, 1,
0.3744291, 1.673835, 0.06983844, 0, 0, 0, 1, 1,
0.3768454, -0.4211371, 1.067901, 1, 1, 1, 1, 1,
0.3819109, 1.360833, 1.060965, 1, 1, 1, 1, 1,
0.3863817, 0.126337, 2.106031, 1, 1, 1, 1, 1,
0.391418, 0.2979973, -0.2089135, 1, 1, 1, 1, 1,
0.3984363, -0.9461098, 3.763219, 1, 1, 1, 1, 1,
0.3985634, 0.03004932, -0.608337, 1, 1, 1, 1, 1,
0.4002151, -0.03543382, 0.4276425, 1, 1, 1, 1, 1,
0.4025096, 1.734172, 0.6224192, 1, 1, 1, 1, 1,
0.4031343, -0.2183911, 2.868943, 1, 1, 1, 1, 1,
0.4050166, 1.259465, -0.2749811, 1, 1, 1, 1, 1,
0.4057966, -1.431409, 2.692742, 1, 1, 1, 1, 1,
0.4088306, 0.1740622, 2.252888, 1, 1, 1, 1, 1,
0.4099742, -1.019256, 2.704664, 1, 1, 1, 1, 1,
0.4149809, 0.4615894, 0.303619, 1, 1, 1, 1, 1,
0.4171455, -0.2880116, 2.557248, 1, 1, 1, 1, 1,
0.4173421, 0.07591389, 0.6099163, 0, 0, 1, 1, 1,
0.418834, -2.022451, 1.289666, 1, 0, 0, 1, 1,
0.4212087, -0.7016196, 2.426482, 1, 0, 0, 1, 1,
0.4335501, 0.4844652, -0.1865226, 1, 0, 0, 1, 1,
0.4343772, 0.1728605, 0.2077049, 1, 0, 0, 1, 1,
0.4409112, 0.1841027, 1.846635, 1, 0, 0, 1, 1,
0.4439422, -1.595449, 2.743917, 0, 0, 0, 1, 1,
0.4495021, -2.022506, 3.69297, 0, 0, 0, 1, 1,
0.4501026, 0.1480618, 0.5510439, 0, 0, 0, 1, 1,
0.4537616, 1.586119, 0.8888959, 0, 0, 0, 1, 1,
0.4561997, -0.2671556, 3.338128, 0, 0, 0, 1, 1,
0.4637357, 0.1854307, 0.322763, 0, 0, 0, 1, 1,
0.4690734, -0.188867, 0.9578512, 0, 0, 0, 1, 1,
0.4695824, -2.802908, 4.905402, 1, 1, 1, 1, 1,
0.4696749, 0.1081031, 2.420318, 1, 1, 1, 1, 1,
0.4713387, 1.112358, 0.4034881, 1, 1, 1, 1, 1,
0.4739999, -0.8228704, 3.460973, 1, 1, 1, 1, 1,
0.4751182, -1.355952, 3.483084, 1, 1, 1, 1, 1,
0.4779339, -0.9169006, 1.641979, 1, 1, 1, 1, 1,
0.4782244, 0.9791198, 2.107291, 1, 1, 1, 1, 1,
0.4815503, 0.4121495, 1.706741, 1, 1, 1, 1, 1,
0.4892993, 0.6000536, 0.07849003, 1, 1, 1, 1, 1,
0.494681, 0.2281456, -0.9308006, 1, 1, 1, 1, 1,
0.4960151, -0.8243828, 1.357731, 1, 1, 1, 1, 1,
0.4982941, -1.415454, 2.247783, 1, 1, 1, 1, 1,
0.498431, -0.1695909, 0.2782274, 1, 1, 1, 1, 1,
0.5009325, -0.7181369, 1.494315, 1, 1, 1, 1, 1,
0.5017825, 1.212085, 0.6643406, 1, 1, 1, 1, 1,
0.5037907, -0.3949603, 1.944802, 0, 0, 1, 1, 1,
0.5038001, 0.3640247, 0.1179215, 1, 0, 0, 1, 1,
0.505978, 0.3749145, 1.039849, 1, 0, 0, 1, 1,
0.5061477, 0.07663088, 0.1966433, 1, 0, 0, 1, 1,
0.5075706, -0.9740686, 3.093907, 1, 0, 0, 1, 1,
0.509574, 2.310501, -0.2531306, 1, 0, 0, 1, 1,
0.5101218, -0.2349592, 3.998984, 0, 0, 0, 1, 1,
0.5123137, 0.1420379, 1.297939, 0, 0, 0, 1, 1,
0.5147073, 1.403067, 1.15848, 0, 0, 0, 1, 1,
0.5182446, 0.9555857, -0.1654896, 0, 0, 0, 1, 1,
0.5218333, -0.4439651, 1.893807, 0, 0, 0, 1, 1,
0.5255848, -1.499462, 4.031906, 0, 0, 0, 1, 1,
0.5295929, -0.6047516, 4.246718, 0, 0, 0, 1, 1,
0.5314392, 0.2092148, 1.903862, 1, 1, 1, 1, 1,
0.5383321, -0.6131441, 1.984994, 1, 1, 1, 1, 1,
0.5450286, -1.029908, 1.77601, 1, 1, 1, 1, 1,
0.545479, -1.094326, 2.779164, 1, 1, 1, 1, 1,
0.5539234, 1.299011, 1.027058, 1, 1, 1, 1, 1,
0.5584508, 0.2484904, 0.8642411, 1, 1, 1, 1, 1,
0.5623329, 0.7514353, 0.5917298, 1, 1, 1, 1, 1,
0.5634984, -2.034513, 3.430784, 1, 1, 1, 1, 1,
0.5644532, -0.6292845, 2.165289, 1, 1, 1, 1, 1,
0.5667496, 1.481314, 1.179405, 1, 1, 1, 1, 1,
0.5676965, -0.6993598, 2.240479, 1, 1, 1, 1, 1,
0.5705277, -2.005916, 4.168797, 1, 1, 1, 1, 1,
0.5710344, -0.2280417, 1.933625, 1, 1, 1, 1, 1,
0.574113, -0.5401099, 1.435542, 1, 1, 1, 1, 1,
0.5765353, 4.124827, 0.7453753, 1, 1, 1, 1, 1,
0.5782132, 0.9959891, 0.4335772, 0, 0, 1, 1, 1,
0.579275, 0.2960657, 0.09018921, 1, 0, 0, 1, 1,
0.5813393, 1.196892, 1.041042, 1, 0, 0, 1, 1,
0.5909506, -0.4031102, 1.889401, 1, 0, 0, 1, 1,
0.5941451, -0.6452276, 3.989157, 1, 0, 0, 1, 1,
0.59724, -0.6083793, 2.872551, 1, 0, 0, 1, 1,
0.5973296, -0.8134101, 4.164996, 0, 0, 0, 1, 1,
0.5979304, -1.055586, 2.277925, 0, 0, 0, 1, 1,
0.5991622, 0.894407, 2.236621, 0, 0, 0, 1, 1,
0.5993494, -0.2329953, 2.169528, 0, 0, 0, 1, 1,
0.6026362, -0.05750043, -0.6632298, 0, 0, 0, 1, 1,
0.602792, 0.4612791, 0.5270332, 0, 0, 0, 1, 1,
0.6047924, 0.1917635, 0.555034, 0, 0, 0, 1, 1,
0.6050814, 0.7915148, 0.6073033, 1, 1, 1, 1, 1,
0.6124802, -0.2340076, 1.679855, 1, 1, 1, 1, 1,
0.6210752, 0.7455528, 1.103606, 1, 1, 1, 1, 1,
0.6223587, 1.045107, 0.7908604, 1, 1, 1, 1, 1,
0.6229712, -1.204955, 2.732313, 1, 1, 1, 1, 1,
0.6231848, 0.1040701, 0.3461459, 1, 1, 1, 1, 1,
0.6247054, -2.714473, 1.658103, 1, 1, 1, 1, 1,
0.6283106, -0.4152145, 1.036508, 1, 1, 1, 1, 1,
0.629309, -0.4177933, 2.186728, 1, 1, 1, 1, 1,
0.6314885, -2.004311, 2.005024, 1, 1, 1, 1, 1,
0.6352344, -0.6384674, 3.028884, 1, 1, 1, 1, 1,
0.6360099, 0.3287273, 0.09260198, 1, 1, 1, 1, 1,
0.636053, 0.5066098, -0.2394234, 1, 1, 1, 1, 1,
0.6413851, 0.791011, 1.560552, 1, 1, 1, 1, 1,
0.6427557, 0.2762389, 1.052999, 1, 1, 1, 1, 1,
0.6442536, 1.196642, 0.5048925, 0, 0, 1, 1, 1,
0.6488857, 1.56332, 0.9133052, 1, 0, 0, 1, 1,
0.648945, 0.3064311, -0.3661532, 1, 0, 0, 1, 1,
0.655254, -0.9943656, 2.087069, 1, 0, 0, 1, 1,
0.6554766, -0.4695902, 1.707938, 1, 0, 0, 1, 1,
0.6558208, -0.7890925, 3.274156, 1, 0, 0, 1, 1,
0.6574555, -0.3592, 2.539856, 0, 0, 0, 1, 1,
0.670075, 0.8880089, 0.4014715, 0, 0, 0, 1, 1,
0.6706945, 0.01173428, 0.09587787, 0, 0, 0, 1, 1,
0.6718169, 0.7511535, 1.993317, 0, 0, 0, 1, 1,
0.6811059, -0.00558083, 1.49775, 0, 0, 0, 1, 1,
0.6837646, 0.4041088, 1.851476, 0, 0, 0, 1, 1,
0.6838973, 0.109291, 1.763033, 0, 0, 0, 1, 1,
0.6866838, -0.2065269, 2.944232, 1, 1, 1, 1, 1,
0.6881207, -1.588675, 3.00842, 1, 1, 1, 1, 1,
0.6886767, 1.128098, -1.19371, 1, 1, 1, 1, 1,
0.6887136, 0.7489643, 2.215035, 1, 1, 1, 1, 1,
0.6965787, 2.094806, -0.2832688, 1, 1, 1, 1, 1,
0.6970941, 0.2132034, 1.58052, 1, 1, 1, 1, 1,
0.7020428, -0.4428137, 0.9970875, 1, 1, 1, 1, 1,
0.7041799, -0.07781572, 1.0743, 1, 1, 1, 1, 1,
0.7123889, -0.2378299, 1.037876, 1, 1, 1, 1, 1,
0.7157429, 0.05905718, 1.925305, 1, 1, 1, 1, 1,
0.71702, -0.8794563, 1.777872, 1, 1, 1, 1, 1,
0.7172514, 1.248992, 0.9816532, 1, 1, 1, 1, 1,
0.7219822, -0.2792393, 3.789734, 1, 1, 1, 1, 1,
0.7226551, -0.0986692, -1.685553, 1, 1, 1, 1, 1,
0.7328626, 0.491573, 0.1659653, 1, 1, 1, 1, 1,
0.7374891, 1.718465, 0.02498694, 0, 0, 1, 1, 1,
0.7457044, -0.2099148, 2.768339, 1, 0, 0, 1, 1,
0.7473024, -0.2463554, 1.950507, 1, 0, 0, 1, 1,
0.7482313, 0.7397485, -0.1117929, 1, 0, 0, 1, 1,
0.7496664, 0.1401699, 1.121882, 1, 0, 0, 1, 1,
0.7505127, -0.7956704, 2.742424, 1, 0, 0, 1, 1,
0.7523513, 0.2170061, 0.8321456, 0, 0, 0, 1, 1,
0.7596493, 0.5062099, 0.07508133, 0, 0, 0, 1, 1,
0.7634292, 2.085911, 0.691503, 0, 0, 0, 1, 1,
0.7635222, -0.2170993, 2.775746, 0, 0, 0, 1, 1,
0.7649765, -0.9148896, 5.335762, 0, 0, 0, 1, 1,
0.7701313, 0.5317286, 1.850418, 0, 0, 0, 1, 1,
0.7732437, -1.410856, 2.714275, 0, 0, 0, 1, 1,
0.7795191, -0.7463924, 0.3949705, 1, 1, 1, 1, 1,
0.7868084, -0.3101463, 1.486145, 1, 1, 1, 1, 1,
0.7879713, 0.06177278, 1.91479, 1, 1, 1, 1, 1,
0.7936842, 0.568808, 1.325639, 1, 1, 1, 1, 1,
0.7995248, 1.757169, 1.617494, 1, 1, 1, 1, 1,
0.8010676, -1.149104, 4.002477, 1, 1, 1, 1, 1,
0.8062651, 2.014627, 0.2781757, 1, 1, 1, 1, 1,
0.815283, 0.96611, 0.03356239, 1, 1, 1, 1, 1,
0.8230222, -0.7221298, 3.277311, 1, 1, 1, 1, 1,
0.8290734, -0.9139729, 2.240327, 1, 1, 1, 1, 1,
0.8402196, -0.340594, 1.726528, 1, 1, 1, 1, 1,
0.8556939, 0.4472814, 1.458491, 1, 1, 1, 1, 1,
0.8613912, -1.149048, 2.487023, 1, 1, 1, 1, 1,
0.8618695, 1.322894, 0.836413, 1, 1, 1, 1, 1,
0.8649192, 1.757449, -0.3273825, 1, 1, 1, 1, 1,
0.8670779, 0.450418, 0.5046261, 0, 0, 1, 1, 1,
0.8735834, -1.099807, 1.238804, 1, 0, 0, 1, 1,
0.8744228, 0.7504415, 1.241441, 1, 0, 0, 1, 1,
0.8777308, 0.4884751, 2.910424, 1, 0, 0, 1, 1,
0.8789929, -2.095049, 1.247717, 1, 0, 0, 1, 1,
0.8822148, -0.01153633, 3.134385, 1, 0, 0, 1, 1,
0.8829263, -0.497067, 2.807437, 0, 0, 0, 1, 1,
0.8846726, -0.6178195, 2.463557, 0, 0, 0, 1, 1,
0.8857254, -0.4272924, 2.845069, 0, 0, 0, 1, 1,
0.8886788, 0.6473799, 0.3536063, 0, 0, 0, 1, 1,
0.8907999, -0.4003379, 1.410106, 0, 0, 0, 1, 1,
0.8915908, -0.3071798, 1.985555, 0, 0, 0, 1, 1,
0.8928766, 2.056227, 1.518507, 0, 0, 0, 1, 1,
0.8981035, -0.4331818, 3.018427, 1, 1, 1, 1, 1,
0.9059463, 0.1860152, 1.13205, 1, 1, 1, 1, 1,
0.9113278, 0.6567838, 2.413643, 1, 1, 1, 1, 1,
0.9173069, -1.215027, 2.875018, 1, 1, 1, 1, 1,
0.9275376, -2.269564, 1.645812, 1, 1, 1, 1, 1,
0.9287439, 0.08899446, 2.305083, 1, 1, 1, 1, 1,
0.9311166, 0.9227381, 3.550605, 1, 1, 1, 1, 1,
0.9395466, 0.7124722, 2.158688, 1, 1, 1, 1, 1,
0.952338, 0.09326728, 1.657238, 1, 1, 1, 1, 1,
0.9541027, 0.02552615, 1.227415, 1, 1, 1, 1, 1,
0.9605564, 0.2241436, 0.8858487, 1, 1, 1, 1, 1,
0.9630017, 0.2795358, 0.7163277, 1, 1, 1, 1, 1,
0.9656131, 0.3567385, 0.197181, 1, 1, 1, 1, 1,
0.967905, -1.44458, 2.529147, 1, 1, 1, 1, 1,
0.9690135, 0.3133354, 2.58736, 1, 1, 1, 1, 1,
0.9708607, -0.1817168, 2.070086, 0, 0, 1, 1, 1,
0.9710414, 0.9181136, 1.938292, 1, 0, 0, 1, 1,
0.9720044, 0.5101817, 1.062358, 1, 0, 0, 1, 1,
0.9734631, -0.04784147, 2.69227, 1, 0, 0, 1, 1,
0.9742227, -1.281298, 2.057882, 1, 0, 0, 1, 1,
0.974249, 0.1885696, 2.495478, 1, 0, 0, 1, 1,
0.9803935, 0.4003794, 2.596009, 0, 0, 0, 1, 1,
0.9804053, 0.06818434, 1.299206, 0, 0, 0, 1, 1,
0.9905571, -0.1859066, 0.8517833, 0, 0, 0, 1, 1,
1.00198, -0.752537, 1.275528, 0, 0, 0, 1, 1,
1.003917, 0.9527897, 0.9853147, 0, 0, 0, 1, 1,
1.028778, 0.6118301, 0.1165882, 0, 0, 0, 1, 1,
1.029423, 0.3711037, 0.1687581, 0, 0, 0, 1, 1,
1.039379, -1.614356, 1.765751, 1, 1, 1, 1, 1,
1.043306, -1.52578, 2.76505, 1, 1, 1, 1, 1,
1.043511, -0.8103242, 0.8726879, 1, 1, 1, 1, 1,
1.053451, -0.429085, 1.886954, 1, 1, 1, 1, 1,
1.062848, 1.851263, 0.06557559, 1, 1, 1, 1, 1,
1.068821, -0.1869482, 2.486225, 1, 1, 1, 1, 1,
1.068972, -0.8826807, 2.518448, 1, 1, 1, 1, 1,
1.070678, -0.8184672, 2.007799, 1, 1, 1, 1, 1,
1.072161, 0.4436323, 0.7584909, 1, 1, 1, 1, 1,
1.073693, 0.7864694, -0.34991, 1, 1, 1, 1, 1,
1.074417, 2.031147, 1.423639, 1, 1, 1, 1, 1,
1.076406, 0.8659153, 0.5616947, 1, 1, 1, 1, 1,
1.076853, -2.775684, 3.118763, 1, 1, 1, 1, 1,
1.078403, 0.6472039, 0.7439948, 1, 1, 1, 1, 1,
1.083902, 0.6190464, 1.037647, 1, 1, 1, 1, 1,
1.090522, 0.2828155, 1.880905, 0, 0, 1, 1, 1,
1.095577, 2.686732, 0.4650787, 1, 0, 0, 1, 1,
1.097089, 0.2147328, 2.63813, 1, 0, 0, 1, 1,
1.097535, -0.988669, 1.595972, 1, 0, 0, 1, 1,
1.104357, -0.5477205, 3.403481, 1, 0, 0, 1, 1,
1.107586, -0.2850605, 3.642677, 1, 0, 0, 1, 1,
1.109686, 0.9331997, 1.992705, 0, 0, 0, 1, 1,
1.11794, 1.142133, 2.041713, 0, 0, 0, 1, 1,
1.120778, 0.1038154, 2.031026, 0, 0, 0, 1, 1,
1.133556, -2.119823, 2.301355, 0, 0, 0, 1, 1,
1.136105, -0.02856837, 2.340109, 0, 0, 0, 1, 1,
1.145536, 2.456697, 1.658827, 0, 0, 0, 1, 1,
1.146365, -2.455701, 1.376294, 0, 0, 0, 1, 1,
1.146406, 1.217004, -0.2597377, 1, 1, 1, 1, 1,
1.146693, 1.204427, 1.33421, 1, 1, 1, 1, 1,
1.15144, -1.224634, 1.824475, 1, 1, 1, 1, 1,
1.152585, -1.931179, 3.471369, 1, 1, 1, 1, 1,
1.167474, -0.06883754, 1.67414, 1, 1, 1, 1, 1,
1.17982, 0.850899, 1.363518, 1, 1, 1, 1, 1,
1.180705, -0.6711457, 2.643866, 1, 1, 1, 1, 1,
1.183075, -0.3080728, 2.040577, 1, 1, 1, 1, 1,
1.191687, 1.243265, 1.76532, 1, 1, 1, 1, 1,
1.205694, -0.7952185, 0.9804169, 1, 1, 1, 1, 1,
1.210784, -0.360609, 2.156907, 1, 1, 1, 1, 1,
1.21473, 0.6033505, 2.110882, 1, 1, 1, 1, 1,
1.220401, -0.4174786, 0.6283617, 1, 1, 1, 1, 1,
1.224928, -1.659313, 1.558353, 1, 1, 1, 1, 1,
1.22586, 0.07319815, 1.819781, 1, 1, 1, 1, 1,
1.229316, -0.7970119, 4.278152, 0, 0, 1, 1, 1,
1.237531, 0.0795548, 3.048942, 1, 0, 0, 1, 1,
1.241414, -0.07834771, 0.3315387, 1, 0, 0, 1, 1,
1.259965, -1.618391, 3.06309, 1, 0, 0, 1, 1,
1.261981, -0.2766221, 0.5866896, 1, 0, 0, 1, 1,
1.262495, 0.780489, 1.130626, 1, 0, 0, 1, 1,
1.264198, 0.3267961, 1.496442, 0, 0, 0, 1, 1,
1.272652, -0.01597767, 1.870564, 0, 0, 0, 1, 1,
1.272655, -0.008730669, 1.608329, 0, 0, 0, 1, 1,
1.272891, 1.487967, 1.030282, 0, 0, 0, 1, 1,
1.278122, -0.8464047, 1.852196, 0, 0, 0, 1, 1,
1.283455, 0.5863733, 0.7648746, 0, 0, 0, 1, 1,
1.295409, 0.2933693, 1.371895, 0, 0, 0, 1, 1,
1.298226, -0.8824819, 2.091573, 1, 1, 1, 1, 1,
1.300104, 0.05896656, 2.479081, 1, 1, 1, 1, 1,
1.310095, 0.6393839, 2.213198, 1, 1, 1, 1, 1,
1.310328, -1.243923, 2.841724, 1, 1, 1, 1, 1,
1.314744, -1.613479, 2.126923, 1, 1, 1, 1, 1,
1.317972, 0.3603386, 1.650411, 1, 1, 1, 1, 1,
1.321395, 0.9510013, 3.887116, 1, 1, 1, 1, 1,
1.325992, -1.415479, 1.743541, 1, 1, 1, 1, 1,
1.331749, -0.005104423, 2.164263, 1, 1, 1, 1, 1,
1.335811, -0.1607309, -0.4451461, 1, 1, 1, 1, 1,
1.348527, 0.7504753, 1.603834, 1, 1, 1, 1, 1,
1.348654, 0.02469801, 0.8870114, 1, 1, 1, 1, 1,
1.364903, 1.316531, 1.158045, 1, 1, 1, 1, 1,
1.36895, -0.3373703, 1.203855, 1, 1, 1, 1, 1,
1.371703, 2.256422, 1.080637, 1, 1, 1, 1, 1,
1.375816, -0.5953563, 2.965112, 0, 0, 1, 1, 1,
1.376947, 0.8555468, 1.607723, 1, 0, 0, 1, 1,
1.379901, 0.5607399, 0.1929865, 1, 0, 0, 1, 1,
1.382077, -0.1989941, 1.308535, 1, 0, 0, 1, 1,
1.384376, 1.096711, 1.075298, 1, 0, 0, 1, 1,
1.387409, -1.145175, 2.559389, 1, 0, 0, 1, 1,
1.394636, 0.1868512, 1.899913, 0, 0, 0, 1, 1,
1.409438, -0.270798, 1.955028, 0, 0, 0, 1, 1,
1.428672, 0.1945945, 1.072056, 0, 0, 0, 1, 1,
1.43288, -0.7877423, 3.693798, 0, 0, 0, 1, 1,
1.435587, 0.8061246, 1.43206, 0, 0, 0, 1, 1,
1.440385, 0.3789018, 2.00602, 0, 0, 0, 1, 1,
1.44314, -1.709389, 3.87934, 0, 0, 0, 1, 1,
1.457431, 0.1497353, 3.512602, 1, 1, 1, 1, 1,
1.459541, 0.663532, 1.752838, 1, 1, 1, 1, 1,
1.467388, 0.3948468, 1.1134, 1, 1, 1, 1, 1,
1.490289, 2.300496, 1.12799, 1, 1, 1, 1, 1,
1.501438, -0.7316971, 1.225675, 1, 1, 1, 1, 1,
1.505911, -1.297418, 1.848166, 1, 1, 1, 1, 1,
1.509422, 0.1450568, 2.033166, 1, 1, 1, 1, 1,
1.509444, -1.226944, 0.7117676, 1, 1, 1, 1, 1,
1.522194, -0.2769495, 1.675318, 1, 1, 1, 1, 1,
1.531685, -0.841962, 2.244679, 1, 1, 1, 1, 1,
1.533121, -0.7378337, 1.63575, 1, 1, 1, 1, 1,
1.540186, -0.006424026, 1.731106, 1, 1, 1, 1, 1,
1.547329, -0.6280788, 2.181172, 1, 1, 1, 1, 1,
1.552853, 2.06605, 1.767445, 1, 1, 1, 1, 1,
1.574539, -0.1864904, -0.761457, 1, 1, 1, 1, 1,
1.584799, 0.3515273, 1.452069, 0, 0, 1, 1, 1,
1.585094, -0.1025115, -0.03351013, 1, 0, 0, 1, 1,
1.588866, 0.8010011, 1.651882, 1, 0, 0, 1, 1,
1.592243, -0.5958564, 1.165857, 1, 0, 0, 1, 1,
1.608483, 0.2475212, 1.121206, 1, 0, 0, 1, 1,
1.610057, -0.009408267, 0.9570807, 1, 0, 0, 1, 1,
1.615348, -1.03339, 1.784037, 0, 0, 0, 1, 1,
1.620742, -0.3113327, 1.298062, 0, 0, 0, 1, 1,
1.621874, -0.05886917, -0.5456931, 0, 0, 0, 1, 1,
1.634261, 0.2536392, 2.135013, 0, 0, 0, 1, 1,
1.635972, 0.667334, 0.2583541, 0, 0, 0, 1, 1,
1.639974, -0.2630836, 2.47714, 0, 0, 0, 1, 1,
1.663968, -1.154792, 1.877782, 0, 0, 0, 1, 1,
1.687417, -0.5343807, 1.996764, 1, 1, 1, 1, 1,
1.71354, -0.259425, 1.64369, 1, 1, 1, 1, 1,
1.714355, 1.404211, 1.672593, 1, 1, 1, 1, 1,
1.719225, -1.056358, 1.07497, 1, 1, 1, 1, 1,
1.720469, 0.1861842, 4.031721, 1, 1, 1, 1, 1,
1.725143, -0.3790716, 0.8614951, 1, 1, 1, 1, 1,
1.734885, 1.45291, 1.996263, 1, 1, 1, 1, 1,
1.737097, 0.8839111, 2.071954, 1, 1, 1, 1, 1,
1.748083, 1.233856, -0.5483242, 1, 1, 1, 1, 1,
1.755027, 1.555426, 2.391689, 1, 1, 1, 1, 1,
1.755646, -0.1437718, 2.311412, 1, 1, 1, 1, 1,
1.757924, 0.8309903, 1.225339, 1, 1, 1, 1, 1,
1.765266, -0.1983106, 3.213871, 1, 1, 1, 1, 1,
1.766381, -0.3427401, 3.202083, 1, 1, 1, 1, 1,
1.76774, -0.4367092, 3.668604, 1, 1, 1, 1, 1,
1.793762, -0.03571853, 1.731775, 0, 0, 1, 1, 1,
1.803939, -0.457103, 1.759078, 1, 0, 0, 1, 1,
1.811295, 1.1295, 1.422228, 1, 0, 0, 1, 1,
1.820696, 0.08408157, 2.972201, 1, 0, 0, 1, 1,
1.8464, -1.190623, 1.389218, 1, 0, 0, 1, 1,
1.857067, -0.1972267, 0.8261861, 1, 0, 0, 1, 1,
1.866024, -0.421083, 1.823984, 0, 0, 0, 1, 1,
1.869181, -0.05086307, 2.222857, 0, 0, 0, 1, 1,
1.888553, -0.2298588, 1.306801, 0, 0, 0, 1, 1,
1.892117, -0.01061036, 2.554597, 0, 0, 0, 1, 1,
1.895639, -0.9710373, 2.670539, 0, 0, 0, 1, 1,
1.90926, -1.258075, 1.352442, 0, 0, 0, 1, 1,
1.916443, 1.004217, 0.9541422, 0, 0, 0, 1, 1,
1.920439, -0.6025218, 1.328545, 1, 1, 1, 1, 1,
1.923316, 0.4029698, -0.6450762, 1, 1, 1, 1, 1,
1.928566, -0.6625198, 1.426318, 1, 1, 1, 1, 1,
1.937656, -1.175517, 1.264682, 1, 1, 1, 1, 1,
1.997139, -1.343123, 2.526626, 1, 1, 1, 1, 1,
2.005755, 1.271443, 2.08445, 1, 1, 1, 1, 1,
2.013862, -0.1185338, 0.3533511, 1, 1, 1, 1, 1,
2.028158, -0.692911, 3.844156, 1, 1, 1, 1, 1,
2.028602, -0.2272412, 2.693624, 1, 1, 1, 1, 1,
2.038431, 1.99219, 0.8414629, 1, 1, 1, 1, 1,
2.078167, -0.5961547, 2.311281, 1, 1, 1, 1, 1,
2.092536, 1.022715, 0.6980163, 1, 1, 1, 1, 1,
2.099769, 0.9653689, 2.605339, 1, 1, 1, 1, 1,
2.101835, 0.7415839, 1.997697, 1, 1, 1, 1, 1,
2.106245, -1.094879, 3.716335, 1, 1, 1, 1, 1,
2.112639, -0.4173474, 2.617312, 0, 0, 1, 1, 1,
2.193858, 0.01318969, 1.456641, 1, 0, 0, 1, 1,
2.198124, -0.1282393, 1.820829, 1, 0, 0, 1, 1,
2.203223, -0.109822, 2.29538, 1, 0, 0, 1, 1,
2.212066, -0.1789768, 1.89382, 1, 0, 0, 1, 1,
2.214832, -0.7390221, 3.05807, 1, 0, 0, 1, 1,
2.226654, -1.108293, 2.24335, 0, 0, 0, 1, 1,
2.295304, 0.3864354, 0.9740461, 0, 0, 0, 1, 1,
2.295309, 0.8603225, 1.047994, 0, 0, 0, 1, 1,
2.306175, 1.182612, 2.114406, 0, 0, 0, 1, 1,
2.342881, 0.1024473, 0.4545966, 0, 0, 0, 1, 1,
2.386214, -0.6103295, 2.059572, 0, 0, 0, 1, 1,
2.409122, 0.01761907, 0.6285244, 0, 0, 0, 1, 1,
2.478672, -0.4797355, 1.15347, 1, 1, 1, 1, 1,
2.54348, -0.2317907, 0.6879721, 1, 1, 1, 1, 1,
2.560003, 0.6583008, 1.926823, 1, 1, 1, 1, 1,
2.5839, -1.535821, 1.129102, 1, 1, 1, 1, 1,
2.601746, -0.8323771, 1.356292, 1, 1, 1, 1, 1,
2.818084, -0.8595491, 1.512982, 1, 1, 1, 1, 1,
2.878583, -0.712218, 1.203775, 1, 1, 1, 1, 1
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
var radius = 10.05142;
var distance = 35.30519;
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
mvMatrix.translate( 0.5353559, -0.2371945, -0.2278726 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.30519);
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
