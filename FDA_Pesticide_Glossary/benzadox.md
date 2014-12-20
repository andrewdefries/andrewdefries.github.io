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
-3.096085, 1.117396, -2.923558, 1, 0, 0, 1,
-3.065409, 0.2113282, -1.983219, 1, 0.007843138, 0, 1,
-2.771478, -0.8291658, -1.273096, 1, 0.01176471, 0, 1,
-2.72922, -2.21238, -4.936504, 1, 0.01960784, 0, 1,
-2.718544, -0.3542262, -1.206446, 1, 0.02352941, 0, 1,
-2.631448, 0.08870298, -0.07501148, 1, 0.03137255, 0, 1,
-2.608537, 1.614996, -2.673213, 1, 0.03529412, 0, 1,
-2.492296, -0.02761534, -0.6620386, 1, 0.04313726, 0, 1,
-2.38354, -0.1334281, -2.847927, 1, 0.04705882, 0, 1,
-2.368959, 1.105516, -1.784485, 1, 0.05490196, 0, 1,
-2.351686, -0.7828814, -1.548611, 1, 0.05882353, 0, 1,
-2.262321, -0.1284385, -1.915786, 1, 0.06666667, 0, 1,
-2.251679, -1.089113, -1.255951, 1, 0.07058824, 0, 1,
-2.235591, -1.46171, -1.657566, 1, 0.07843138, 0, 1,
-2.182068, -0.4716819, -0.9923466, 1, 0.08235294, 0, 1,
-2.162526, 0.2070865, -2.202497, 1, 0.09019608, 0, 1,
-2.136135, 1.564623, -0.3801192, 1, 0.09411765, 0, 1,
-2.110348, -0.8740467, -2.004303, 1, 0.1019608, 0, 1,
-2.110221, 0.79856, -0.2899724, 1, 0.1098039, 0, 1,
-2.100244, -1.511198, -2.740525, 1, 0.1137255, 0, 1,
-2.0767, 0.8859896, -0.2999913, 1, 0.1215686, 0, 1,
-2.074443, -0.05139013, -1.416702, 1, 0.1254902, 0, 1,
-2.072494, -0.3692459, -1.75547, 1, 0.1333333, 0, 1,
-2.071436, -0.2521249, -2.59763, 1, 0.1372549, 0, 1,
-2.03685, 0.2681741, -1.863769, 1, 0.145098, 0, 1,
-1.976893, 1.658342, -1.583247, 1, 0.1490196, 0, 1,
-1.971969, -1.209632, -3.780221, 1, 0.1568628, 0, 1,
-1.968174, 0.4027551, -2.314063, 1, 0.1607843, 0, 1,
-1.967106, 1.012891, -1.019025, 1, 0.1686275, 0, 1,
-1.96319, 0.9071553, -1.910662, 1, 0.172549, 0, 1,
-1.954939, 0.301403, -0.7681808, 1, 0.1803922, 0, 1,
-1.923708, -2.915465, -3.253762, 1, 0.1843137, 0, 1,
-1.914674, 0.8467157, -1.151198, 1, 0.1921569, 0, 1,
-1.913521, -0.3116575, -2.097119, 1, 0.1960784, 0, 1,
-1.891129, 0.2246203, -1.15362, 1, 0.2039216, 0, 1,
-1.873301, 0.7897104, -2.508254, 1, 0.2117647, 0, 1,
-1.854356, 0.1050131, -2.192544, 1, 0.2156863, 0, 1,
-1.8541, -0.3520468, -1.753328, 1, 0.2235294, 0, 1,
-1.850859, -1.878313, -4.39797, 1, 0.227451, 0, 1,
-1.848014, 0.1371916, -0.5873181, 1, 0.2352941, 0, 1,
-1.846284, 1.973972, -0.5916286, 1, 0.2392157, 0, 1,
-1.831411, -0.5224816, -1.876161, 1, 0.2470588, 0, 1,
-1.828089, -3.149476, -1.639341, 1, 0.2509804, 0, 1,
-1.826927, 1.29962, -1.176576, 1, 0.2588235, 0, 1,
-1.823966, -0.5960274, -2.074491, 1, 0.2627451, 0, 1,
-1.791295, 0.3144641, -0.6907439, 1, 0.2705882, 0, 1,
-1.789606, 1.489251, -0.04043349, 1, 0.2745098, 0, 1,
-1.788279, -2.282851, -2.342104, 1, 0.282353, 0, 1,
-1.787553, -0.2916362, -2.871325, 1, 0.2862745, 0, 1,
-1.768187, 1.00957, -2.480767, 1, 0.2941177, 0, 1,
-1.761665, 0.8574109, -2.351504, 1, 0.3019608, 0, 1,
-1.761449, 1.337306, 0.9225842, 1, 0.3058824, 0, 1,
-1.747561, -1.097043, -2.629099, 1, 0.3137255, 0, 1,
-1.745154, -0.958023, -2.677109, 1, 0.3176471, 0, 1,
-1.74512, -0.4984769, -2.140842, 1, 0.3254902, 0, 1,
-1.738898, 2.321132, -1.077702, 1, 0.3294118, 0, 1,
-1.705283, 0.5797246, 0.3951641, 1, 0.3372549, 0, 1,
-1.701058, 1.772466, -1.510139, 1, 0.3411765, 0, 1,
-1.691018, -0.02841049, -2.953954, 1, 0.3490196, 0, 1,
-1.684298, -1.701952, -0.3702677, 1, 0.3529412, 0, 1,
-1.681048, -1.044424, -4.681593, 1, 0.3607843, 0, 1,
-1.665511, 0.479587, -0.02325464, 1, 0.3647059, 0, 1,
-1.665262, 0.8710294, -1.779007, 1, 0.372549, 0, 1,
-1.651809, 1.888391, -0.5691998, 1, 0.3764706, 0, 1,
-1.649064, 0.5530443, -0.9788076, 1, 0.3843137, 0, 1,
-1.619811, 0.1585481, -1.399849, 1, 0.3882353, 0, 1,
-1.605967, 0.6301168, 0.3375235, 1, 0.3960784, 0, 1,
-1.598116, -0.4623414, -0.7038968, 1, 0.4039216, 0, 1,
-1.594896, -0.827757, -2.370225, 1, 0.4078431, 0, 1,
-1.582085, 0.4228483, -0.6752774, 1, 0.4156863, 0, 1,
-1.573232, 0.7877126, -0.1499008, 1, 0.4196078, 0, 1,
-1.560727, -1.028827, -1.357919, 1, 0.427451, 0, 1,
-1.554765, -0.7633573, -1.913271, 1, 0.4313726, 0, 1,
-1.550893, -0.7376525, -4.022727, 1, 0.4392157, 0, 1,
-1.544907, -0.9921581, -3.390085, 1, 0.4431373, 0, 1,
-1.533788, 0.07287037, -2.095187, 1, 0.4509804, 0, 1,
-1.518805, 1.81719, -0.6533608, 1, 0.454902, 0, 1,
-1.516234, -0.2913948, -1.965513, 1, 0.4627451, 0, 1,
-1.496856, 0.1723054, -2.277092, 1, 0.4666667, 0, 1,
-1.467509, 0.3587823, -2.667608, 1, 0.4745098, 0, 1,
-1.462394, 0.8967308, -0.4977577, 1, 0.4784314, 0, 1,
-1.451518, 0.4597494, -2.620501, 1, 0.4862745, 0, 1,
-1.447782, 0.5870453, -1.292307, 1, 0.4901961, 0, 1,
-1.446154, -0.510578, -1.947844, 1, 0.4980392, 0, 1,
-1.427431, -0.3481785, -1.292345, 1, 0.5058824, 0, 1,
-1.424299, 0.9700555, -0.3458293, 1, 0.509804, 0, 1,
-1.406729, 0.3729257, -1.584402, 1, 0.5176471, 0, 1,
-1.398596, -0.0246534, -0.02768246, 1, 0.5215687, 0, 1,
-1.394996, 1.231398, -1.323486, 1, 0.5294118, 0, 1,
-1.385057, -1.010172, -3.285787, 1, 0.5333334, 0, 1,
-1.383867, -0.234837, -2.929974, 1, 0.5411765, 0, 1,
-1.372451, -0.9427966, -3.25049, 1, 0.5450981, 0, 1,
-1.360127, 0.1675419, -0.2170481, 1, 0.5529412, 0, 1,
-1.359071, 0.5593683, -0.07298881, 1, 0.5568628, 0, 1,
-1.348064, 1.069532, 0.2146289, 1, 0.5647059, 0, 1,
-1.347733, 0.3469497, -2.77348, 1, 0.5686275, 0, 1,
-1.345549, 1.499422, 0.8082733, 1, 0.5764706, 0, 1,
-1.343889, -0.5660493, -3.055861, 1, 0.5803922, 0, 1,
-1.343527, -0.9654199, -2.23296, 1, 0.5882353, 0, 1,
-1.339185, -0.314133, -2.911019, 1, 0.5921569, 0, 1,
-1.335769, -0.8645424, -2.300403, 1, 0.6, 0, 1,
-1.335585, 1.530822, -0.07606626, 1, 0.6078432, 0, 1,
-1.334821, 0.1970372, -1.974351, 1, 0.6117647, 0, 1,
-1.323754, -0.07241418, -1.937961, 1, 0.6196079, 0, 1,
-1.320451, 0.5467644, -1.742624, 1, 0.6235294, 0, 1,
-1.318884, 2.073982, -1.465809, 1, 0.6313726, 0, 1,
-1.318863, -0.8308854, -3.171658, 1, 0.6352941, 0, 1,
-1.31648, 0.200186, -1.172167, 1, 0.6431373, 0, 1,
-1.314173, -0.2432468, -1.30717, 1, 0.6470588, 0, 1,
-1.310335, -0.01658082, -1.741931, 1, 0.654902, 0, 1,
-1.309615, -2.141755, -3.381885, 1, 0.6588235, 0, 1,
-1.304378, 0.4460967, -1.258858, 1, 0.6666667, 0, 1,
-1.301289, 1.200723, -0.01407181, 1, 0.6705883, 0, 1,
-1.29513, -1.126891, -4.186569, 1, 0.6784314, 0, 1,
-1.294874, -0.6884507, -1.123369, 1, 0.682353, 0, 1,
-1.292115, -1.150434, 0.2698002, 1, 0.6901961, 0, 1,
-1.289558, 0.5009348, -1.525284, 1, 0.6941177, 0, 1,
-1.278605, 0.829668, -0.7325759, 1, 0.7019608, 0, 1,
-1.277904, 0.9422396, 1.702163, 1, 0.7098039, 0, 1,
-1.262188, -1.12081, -2.11081, 1, 0.7137255, 0, 1,
-1.260241, -0.1784671, -1.236664, 1, 0.7215686, 0, 1,
-1.258046, 0.6047327, -1.65688, 1, 0.7254902, 0, 1,
-1.257787, -1.218825, -2.611789, 1, 0.7333333, 0, 1,
-1.254771, -1.386401, -2.187091, 1, 0.7372549, 0, 1,
-1.247095, 1.17474, -0.5458875, 1, 0.7450981, 0, 1,
-1.24463, 0.4836283, -0.876934, 1, 0.7490196, 0, 1,
-1.23864, -2.297616, -2.188705, 1, 0.7568628, 0, 1,
-1.236205, 0.5744156, -2.046946, 1, 0.7607843, 0, 1,
-1.22391, -0.2810107, -1.32758, 1, 0.7686275, 0, 1,
-1.223343, 2.388132, -0.5373344, 1, 0.772549, 0, 1,
-1.21618, 0.1671131, -3.227139, 1, 0.7803922, 0, 1,
-1.206595, 1.089284, 0.0520553, 1, 0.7843137, 0, 1,
-1.203153, -0.5579255, -1.5736, 1, 0.7921569, 0, 1,
-1.199954, 1.026497, -1.350003, 1, 0.7960784, 0, 1,
-1.199799, -0.4492121, -1.802967, 1, 0.8039216, 0, 1,
-1.199224, 0.4475905, -0.6149603, 1, 0.8117647, 0, 1,
-1.194685, -0.05386996, -2.262698, 1, 0.8156863, 0, 1,
-1.184703, -0.573772, -2.971455, 1, 0.8235294, 0, 1,
-1.184356, 1.149139, 0.3893039, 1, 0.827451, 0, 1,
-1.182661, 0.3515958, -2.234833, 1, 0.8352941, 0, 1,
-1.180895, 0.8219516, -1.578942, 1, 0.8392157, 0, 1,
-1.17924, -0.183422, -0.1310727, 1, 0.8470588, 0, 1,
-1.164025, 2.772821, 0.9415323, 1, 0.8509804, 0, 1,
-1.161438, -0.5733552, -1.574107, 1, 0.8588235, 0, 1,
-1.14982, 0.3993245, -0.2404993, 1, 0.8627451, 0, 1,
-1.147174, -0.9273444, -1.914981, 1, 0.8705882, 0, 1,
-1.14599, 0.8835385, -0.7349824, 1, 0.8745098, 0, 1,
-1.144684, 1.340327, -1.408889, 1, 0.8823529, 0, 1,
-1.140706, 0.9833428, -1.773958, 1, 0.8862745, 0, 1,
-1.136343, -0.6086318, -4.168851, 1, 0.8941177, 0, 1,
-1.131555, 2.131979, 0.8262367, 1, 0.8980392, 0, 1,
-1.128254, 0.6674264, 0.8428705, 1, 0.9058824, 0, 1,
-1.117624, -1.517954, -3.187052, 1, 0.9137255, 0, 1,
-1.114213, 2.444729, 0.6025604, 1, 0.9176471, 0, 1,
-1.11254, 0.04789457, -3.207114, 1, 0.9254902, 0, 1,
-1.111527, 0.2057222, -0.1900731, 1, 0.9294118, 0, 1,
-1.10915, 0.2720398, -0.6727233, 1, 0.9372549, 0, 1,
-1.104186, 1.004443, -1.554801, 1, 0.9411765, 0, 1,
-1.096643, 3.23783, 0.7230377, 1, 0.9490196, 0, 1,
-1.091636, -1.741311, -5.259252, 1, 0.9529412, 0, 1,
-1.084437, -0.7085994, -2.353749, 1, 0.9607843, 0, 1,
-1.079238, -0.6876239, -1.623251, 1, 0.9647059, 0, 1,
-1.077152, 1.971056, -1.420646, 1, 0.972549, 0, 1,
-1.068424, 0.1206174, -0.228109, 1, 0.9764706, 0, 1,
-1.065928, -0.7004243, -1.518301, 1, 0.9843137, 0, 1,
-1.060267, -1.888844, -3.171255, 1, 0.9882353, 0, 1,
-1.053133, -0.1001149, -0.4350712, 1, 0.9960784, 0, 1,
-1.05081, -0.3972411, -3.856408, 0.9960784, 1, 0, 1,
-1.047891, -0.8481245, -2.305761, 0.9921569, 1, 0, 1,
-1.036732, -2.054357, -2.614191, 0.9843137, 1, 0, 1,
-1.035302, 2.486912, -1.008274, 0.9803922, 1, 0, 1,
-1.031325, -0.09445339, -2.534142, 0.972549, 1, 0, 1,
-1.018848, -0.9261909, -1.537726, 0.9686275, 1, 0, 1,
-1.011518, 1.912452, 0.7530254, 0.9607843, 1, 0, 1,
-1.005893, -0.03027205, -3.364327, 0.9568627, 1, 0, 1,
-1.005634, -0.5677156, -1.042268, 0.9490196, 1, 0, 1,
-1.002723, 1.190933, -1.124648, 0.945098, 1, 0, 1,
-0.9925202, -0.8020325, -1.991344, 0.9372549, 1, 0, 1,
-0.9890822, -0.3845032, -1.091482, 0.9333333, 1, 0, 1,
-0.9888887, -0.2386776, -1.308569, 0.9254902, 1, 0, 1,
-0.9792991, 0.1322763, -1.434185, 0.9215686, 1, 0, 1,
-0.9688883, 0.6208577, -2.618688, 0.9137255, 1, 0, 1,
-0.963457, -0.7470593, -1.539946, 0.9098039, 1, 0, 1,
-0.9559673, -0.1722235, -2.229151, 0.9019608, 1, 0, 1,
-0.9528791, -1.885772, -2.960939, 0.8941177, 1, 0, 1,
-0.9524112, 0.4715773, -1.745768, 0.8901961, 1, 0, 1,
-0.952343, 0.2232056, -1.313045, 0.8823529, 1, 0, 1,
-0.940631, -0.184877, -2.016718, 0.8784314, 1, 0, 1,
-0.9338201, -0.709219, -1.871148, 0.8705882, 1, 0, 1,
-0.9330046, 1.202317, 0.2012853, 0.8666667, 1, 0, 1,
-0.9275612, -1.373869, -3.376353, 0.8588235, 1, 0, 1,
-0.9259628, 0.749348, -0.9600201, 0.854902, 1, 0, 1,
-0.9223787, 0.0929937, 0.1096135, 0.8470588, 1, 0, 1,
-0.9216837, 1.714659, 2.167042, 0.8431373, 1, 0, 1,
-0.9216251, 1.155257, -1.006163, 0.8352941, 1, 0, 1,
-0.9141006, 1.061291, -0.8639644, 0.8313726, 1, 0, 1,
-0.9134947, -0.102425, -1.09704, 0.8235294, 1, 0, 1,
-0.9116278, 0.1245178, 0.3745049, 0.8196079, 1, 0, 1,
-0.8968915, -0.211706, -1.067949, 0.8117647, 1, 0, 1,
-0.882766, -2.367259, -1.991829, 0.8078431, 1, 0, 1,
-0.8792447, -0.5468785, -1.178718, 0.8, 1, 0, 1,
-0.8763823, -0.0604339, -1.092164, 0.7921569, 1, 0, 1,
-0.8722636, -0.2103098, -1.932092, 0.7882353, 1, 0, 1,
-0.8709821, 0.2258965, 0.1069319, 0.7803922, 1, 0, 1,
-0.8701388, -0.5446648, -1.550308, 0.7764706, 1, 0, 1,
-0.8631541, -0.4391061, -1.598578, 0.7686275, 1, 0, 1,
-0.8621817, -0.6457823, -3.563001, 0.7647059, 1, 0, 1,
-0.8611407, -0.3008073, -1.676954, 0.7568628, 1, 0, 1,
-0.8598778, 0.02983311, -2.130953, 0.7529412, 1, 0, 1,
-0.8588896, -1.299721, -2.406498, 0.7450981, 1, 0, 1,
-0.8362519, -0.5761839, -1.345249, 0.7411765, 1, 0, 1,
-0.8222765, 0.4083188, -1.890611, 0.7333333, 1, 0, 1,
-0.8211576, -0.7508619, -1.791218, 0.7294118, 1, 0, 1,
-0.8202874, -0.9281676, -1.227121, 0.7215686, 1, 0, 1,
-0.8188908, 0.543876, -2.677297, 0.7176471, 1, 0, 1,
-0.8118195, 1.903747, -2.102841, 0.7098039, 1, 0, 1,
-0.8033593, 0.9810753, 0.161292, 0.7058824, 1, 0, 1,
-0.8011793, -0.8013015, -1.522144, 0.6980392, 1, 0, 1,
-0.8008792, 0.5194224, -2.224101, 0.6901961, 1, 0, 1,
-0.7959567, -1.070289, -0.3194784, 0.6862745, 1, 0, 1,
-0.795172, -1.322108, -0.2606015, 0.6784314, 1, 0, 1,
-0.7937161, -0.2280121, -1.883603, 0.6745098, 1, 0, 1,
-0.7922474, 1.030694, -1.326024, 0.6666667, 1, 0, 1,
-0.7863352, 1.362399, -0.5076889, 0.6627451, 1, 0, 1,
-0.7799829, -0.05769721, -1.76998, 0.654902, 1, 0, 1,
-0.7774085, 0.6618727, 0.391445, 0.6509804, 1, 0, 1,
-0.7694637, -0.007780312, 0.5002295, 0.6431373, 1, 0, 1,
-0.7687667, -1.026199, -1.135713, 0.6392157, 1, 0, 1,
-0.7663651, 0.2205447, -1.164394, 0.6313726, 1, 0, 1,
-0.7662702, -1.195949, -3.67184, 0.627451, 1, 0, 1,
-0.7659387, 0.2154361, -1.573851, 0.6196079, 1, 0, 1,
-0.7626722, 0.4911207, -1.86879, 0.6156863, 1, 0, 1,
-0.7602112, -0.02885442, -1.605285, 0.6078432, 1, 0, 1,
-0.7595317, -0.09562183, -1.870847, 0.6039216, 1, 0, 1,
-0.7588707, -0.9443962, -2.945212, 0.5960785, 1, 0, 1,
-0.7588635, -0.3562186, -1.076509, 0.5882353, 1, 0, 1,
-0.7563657, 0.87293, -1.245029, 0.5843138, 1, 0, 1,
-0.7561997, -0.9011142, -1.887666, 0.5764706, 1, 0, 1,
-0.7558028, -0.08588164, -2.329535, 0.572549, 1, 0, 1,
-0.7549195, 0.1756886, 0.2520291, 0.5647059, 1, 0, 1,
-0.7533062, -0.3170986, -1.708661, 0.5607843, 1, 0, 1,
-0.7527696, -1.210939, -1.500407, 0.5529412, 1, 0, 1,
-0.745867, -1.570872, -2.732776, 0.5490196, 1, 0, 1,
-0.7389584, 0.3140323, -0.5596007, 0.5411765, 1, 0, 1,
-0.7358726, -0.08871827, -2.359848, 0.5372549, 1, 0, 1,
-0.7303836, 0.1300853, -1.868217, 0.5294118, 1, 0, 1,
-0.7265401, 0.9998305, 0.5450396, 0.5254902, 1, 0, 1,
-0.7246351, 1.693364, -0.3586193, 0.5176471, 1, 0, 1,
-0.7230348, 1.521922, -0.5271583, 0.5137255, 1, 0, 1,
-0.7195048, -0.3282579, -1.988805, 0.5058824, 1, 0, 1,
-0.7096415, -0.3000588, -2.050936, 0.5019608, 1, 0, 1,
-0.7084558, -2.031986, -3.503632, 0.4941176, 1, 0, 1,
-0.6976252, -1.158833, -2.383664, 0.4862745, 1, 0, 1,
-0.6970029, 0.1941737, -0.4906607, 0.4823529, 1, 0, 1,
-0.6969207, 0.8618107, -0.07773034, 0.4745098, 1, 0, 1,
-0.6930182, 0.2371062, -0.9826759, 0.4705882, 1, 0, 1,
-0.6923032, 0.4701886, -3.495892, 0.4627451, 1, 0, 1,
-0.6918331, 0.2591686, -1.161022, 0.4588235, 1, 0, 1,
-0.6900663, 0.04544865, -3.184575, 0.4509804, 1, 0, 1,
-0.685353, 0.2799517, -0.4464923, 0.4470588, 1, 0, 1,
-0.681586, 0.1070918, -2.321903, 0.4392157, 1, 0, 1,
-0.6789668, -1.493952, -2.378437, 0.4352941, 1, 0, 1,
-0.6766152, 0.4154212, -2.48026, 0.427451, 1, 0, 1,
-0.6750358, -0.01268393, -1.553012, 0.4235294, 1, 0, 1,
-0.6733428, 1.879404, -1.084127, 0.4156863, 1, 0, 1,
-0.6704253, -0.9049709, -2.295701, 0.4117647, 1, 0, 1,
-0.6699193, -0.9219601, -2.31624, 0.4039216, 1, 0, 1,
-0.6682158, -1.050496, -1.927946, 0.3960784, 1, 0, 1,
-0.6654028, -2.363356, -2.731307, 0.3921569, 1, 0, 1,
-0.6636249, -0.4539891, -5.407427, 0.3843137, 1, 0, 1,
-0.6612854, 2.476343, 0.8512025, 0.3803922, 1, 0, 1,
-0.6566519, -2.462878, -3.123477, 0.372549, 1, 0, 1,
-0.6561253, -1.495363, -1.930614, 0.3686275, 1, 0, 1,
-0.6538771, 0.1666332, -2.674707, 0.3607843, 1, 0, 1,
-0.6516821, 1.369655, 0.4295539, 0.3568628, 1, 0, 1,
-0.6506636, 0.2050736, -0.5301929, 0.3490196, 1, 0, 1,
-0.6431625, -1.185393, -2.608015, 0.345098, 1, 0, 1,
-0.6404461, -1.099618, -3.021794, 0.3372549, 1, 0, 1,
-0.6382001, 0.2575426, -1.151906, 0.3333333, 1, 0, 1,
-0.6371961, -0.6466123, -1.075747, 0.3254902, 1, 0, 1,
-0.6319119, -1.333275, -2.677735, 0.3215686, 1, 0, 1,
-0.6298385, 0.2569074, -2.025865, 0.3137255, 1, 0, 1,
-0.6280012, 0.5826402, -2.349179, 0.3098039, 1, 0, 1,
-0.6222758, -0.7739941, -2.13944, 0.3019608, 1, 0, 1,
-0.6197432, 1.025412, -0.7430702, 0.2941177, 1, 0, 1,
-0.6177562, 0.4378864, -2.509759, 0.2901961, 1, 0, 1,
-0.6156113, -0.8352826, -2.258718, 0.282353, 1, 0, 1,
-0.6147489, 0.2241015, 0.226155, 0.2784314, 1, 0, 1,
-0.6107947, -0.6739914, -3.290307, 0.2705882, 1, 0, 1,
-0.6047896, 0.4596014, -1.912675, 0.2666667, 1, 0, 1,
-0.6036764, 0.03368456, -1.924347, 0.2588235, 1, 0, 1,
-0.5995504, 1.519516, -0.6663978, 0.254902, 1, 0, 1,
-0.5988827, 0.8771943, -0.3422444, 0.2470588, 1, 0, 1,
-0.5980263, 0.145033, -2.107754, 0.2431373, 1, 0, 1,
-0.5959225, -1.186843, -3.51174, 0.2352941, 1, 0, 1,
-0.5952284, -0.5478485, -2.298552, 0.2313726, 1, 0, 1,
-0.5951739, -0.6027456, -3.328677, 0.2235294, 1, 0, 1,
-0.5947095, 0.3941284, -0.5108159, 0.2196078, 1, 0, 1,
-0.5945449, -1.245974, -1.973533, 0.2117647, 1, 0, 1,
-0.5886544, -0.4455664, -1.681108, 0.2078431, 1, 0, 1,
-0.5878585, -0.860593, -3.383734, 0.2, 1, 0, 1,
-0.5866798, 1.497918, -0.668671, 0.1921569, 1, 0, 1,
-0.5812998, -0.411672, -2.3547, 0.1882353, 1, 0, 1,
-0.5772665, -0.4089292, -2.192555, 0.1803922, 1, 0, 1,
-0.5723389, -0.2172416, -2.524737, 0.1764706, 1, 0, 1,
-0.5700027, -0.1517253, -1.425001, 0.1686275, 1, 0, 1,
-0.5675945, -0.8064919, -1.68678, 0.1647059, 1, 0, 1,
-0.5616897, -1.186633, -3.351576, 0.1568628, 1, 0, 1,
-0.555233, 0.5283877, 1.226254, 0.1529412, 1, 0, 1,
-0.5532826, -0.09839099, 0.1547763, 0.145098, 1, 0, 1,
-0.5491483, 1.361015, -1.012753, 0.1411765, 1, 0, 1,
-0.5477681, 1.276972, -1.482966, 0.1333333, 1, 0, 1,
-0.5426124, 1.407584, 0.1311455, 0.1294118, 1, 0, 1,
-0.5379872, 0.2651579, -0.9166225, 0.1215686, 1, 0, 1,
-0.5332435, -1.285638, -0.243737, 0.1176471, 1, 0, 1,
-0.5220816, -0.6220234, -0.9469413, 0.1098039, 1, 0, 1,
-0.522026, 0.3258636, 0.8910032, 0.1058824, 1, 0, 1,
-0.5191272, 0.1956144, -0.7907027, 0.09803922, 1, 0, 1,
-0.5170964, 0.872871, -0.6079285, 0.09019608, 1, 0, 1,
-0.5130407, 0.2906091, 0.1278025, 0.08627451, 1, 0, 1,
-0.511733, 2.043012, -1.615861, 0.07843138, 1, 0, 1,
-0.5111854, 0.3482459, -0.3296519, 0.07450981, 1, 0, 1,
-0.5109689, 0.5970572, -0.1610845, 0.06666667, 1, 0, 1,
-0.5089958, -1.422296, -4.092086, 0.0627451, 1, 0, 1,
-0.5060552, 0.080654, -1.591953, 0.05490196, 1, 0, 1,
-0.5056312, -0.9256187, -3.394442, 0.05098039, 1, 0, 1,
-0.5053486, -1.695822, -3.816256, 0.04313726, 1, 0, 1,
-0.4985149, 0.2363482, -1.233053, 0.03921569, 1, 0, 1,
-0.4978462, -1.448315, -2.579053, 0.03137255, 1, 0, 1,
-0.4944135, -0.9895526, -3.455066, 0.02745098, 1, 0, 1,
-0.4940917, -2.25924, -3.01139, 0.01960784, 1, 0, 1,
-0.4883292, 1.034612, -0.8072852, 0.01568628, 1, 0, 1,
-0.4782693, -0.695345, -3.735762, 0.007843138, 1, 0, 1,
-0.4781891, 1.346174, -0.5154465, 0.003921569, 1, 0, 1,
-0.4779228, 1.510157, 0.04638083, 0, 1, 0.003921569, 1,
-0.4762863, 0.2047517, -2.484621, 0, 1, 0.01176471, 1,
-0.4740793, -0.5445924, -3.853203, 0, 1, 0.01568628, 1,
-0.472989, 0.3187372, -1.116483, 0, 1, 0.02352941, 1,
-0.4718836, -0.3206669, -1.226358, 0, 1, 0.02745098, 1,
-0.4716932, 0.7209311, -2.031856, 0, 1, 0.03529412, 1,
-0.4715734, 0.9544977, -1.110365, 0, 1, 0.03921569, 1,
-0.4682902, 1.080735, -2.104254, 0, 1, 0.04705882, 1,
-0.4665526, 2.058238, -0.6788336, 0, 1, 0.05098039, 1,
-0.4652201, -0.09069692, -0.1623661, 0, 1, 0.05882353, 1,
-0.4629273, -0.8139837, -1.63868, 0, 1, 0.0627451, 1,
-0.4594399, 0.6885109, 0.7900811, 0, 1, 0.07058824, 1,
-0.4591053, -0.8824875, -2.025843, 0, 1, 0.07450981, 1,
-0.4581102, -1.739751, -3.558027, 0, 1, 0.08235294, 1,
-0.4567112, 0.5648367, -0.3935176, 0, 1, 0.08627451, 1,
-0.4552711, -0.2315388, -2.802085, 0, 1, 0.09411765, 1,
-0.4541921, -1.096289, -3.594588, 0, 1, 0.1019608, 1,
-0.4518414, -0.5608236, -1.683247, 0, 1, 0.1058824, 1,
-0.4499166, 0.4296808, -0.5138601, 0, 1, 0.1137255, 1,
-0.4432218, -1.395981, -4.854255, 0, 1, 0.1176471, 1,
-0.4381817, 2.523336, -1.297503, 0, 1, 0.1254902, 1,
-0.4379441, -0.03418146, -1.689422, 0, 1, 0.1294118, 1,
-0.4358483, 0.3344222, -1.925552, 0, 1, 0.1372549, 1,
-0.4356663, -0.01680075, -1.024158, 0, 1, 0.1411765, 1,
-0.4333708, -0.1215368, -2.26786, 0, 1, 0.1490196, 1,
-0.4309025, 0.3482488, 0.126243, 0, 1, 0.1529412, 1,
-0.4280866, 1.939729, -0.7492982, 0, 1, 0.1607843, 1,
-0.4250652, 0.03757975, 0.254885, 0, 1, 0.1647059, 1,
-0.4245205, 1.707642, -1.802108, 0, 1, 0.172549, 1,
-0.4206416, 0.822617, -1.473245, 0, 1, 0.1764706, 1,
-0.4183836, 0.1546573, -1.454092, 0, 1, 0.1843137, 1,
-0.4171354, 0.322362, -0.1058866, 0, 1, 0.1882353, 1,
-0.4161739, -0.04909622, -3.203214, 0, 1, 0.1960784, 1,
-0.4045848, 0.3725049, -0.2843445, 0, 1, 0.2039216, 1,
-0.4013323, -1.174051, -3.432718, 0, 1, 0.2078431, 1,
-0.4007801, 1.104989, -0.3695806, 0, 1, 0.2156863, 1,
-0.3996335, -0.4533862, -0.4795237, 0, 1, 0.2196078, 1,
-0.3926495, -0.007147749, -1.483155, 0, 1, 0.227451, 1,
-0.3906128, 1.39715, -1.452787, 0, 1, 0.2313726, 1,
-0.3876835, -0.2460055, -3.376732, 0, 1, 0.2392157, 1,
-0.3876664, 1.360722, -0.0297944, 0, 1, 0.2431373, 1,
-0.3858894, -0.1054466, -2.08076, 0, 1, 0.2509804, 1,
-0.384028, -0.2956968, -2.224305, 0, 1, 0.254902, 1,
-0.3800951, -2.227993, -4.317218, 0, 1, 0.2627451, 1,
-0.379595, -0.3110991, -4.490566, 0, 1, 0.2666667, 1,
-0.3787405, -0.8898268, -3.161985, 0, 1, 0.2745098, 1,
-0.3787108, 0.1267141, -0.7002718, 0, 1, 0.2784314, 1,
-0.3771238, 0.4830746, 0.1927993, 0, 1, 0.2862745, 1,
-0.3732647, -1.389641, -3.032278, 0, 1, 0.2901961, 1,
-0.3725872, -0.7738293, -1.691704, 0, 1, 0.2980392, 1,
-0.3724242, 1.55296, -0.7633706, 0, 1, 0.3058824, 1,
-0.3620656, 2.013715, -0.3658682, 0, 1, 0.3098039, 1,
-0.3615875, 0.4807979, -0.4212134, 0, 1, 0.3176471, 1,
-0.3590766, 0.1106377, -1.090864, 0, 1, 0.3215686, 1,
-0.3541267, 0.9944577, -0.4596165, 0, 1, 0.3294118, 1,
-0.3514149, -0.6445606, -1.206668, 0, 1, 0.3333333, 1,
-0.3458744, -0.6262982, -2.332908, 0, 1, 0.3411765, 1,
-0.3416362, 0.04364671, -1.150925, 0, 1, 0.345098, 1,
-0.3391719, 0.8729559, -0.6000332, 0, 1, 0.3529412, 1,
-0.3381718, 1.680729, -1.771466, 0, 1, 0.3568628, 1,
-0.3379359, -0.3514706, -0.9326411, 0, 1, 0.3647059, 1,
-0.3340394, -1.043477, -4.672802, 0, 1, 0.3686275, 1,
-0.3319295, 1.820152, 0.05614724, 0, 1, 0.3764706, 1,
-0.3310362, -1.554353, -2.904611, 0, 1, 0.3803922, 1,
-0.3242742, -0.2329918, -1.240724, 0, 1, 0.3882353, 1,
-0.3212889, 0.3425263, 0.2978466, 0, 1, 0.3921569, 1,
-0.3164386, 0.8571044, 1.31627, 0, 1, 0.4, 1,
-0.3149291, -1.133066, -1.776438, 0, 1, 0.4078431, 1,
-0.3138587, 0.09550294, -2.34973, 0, 1, 0.4117647, 1,
-0.3123868, 0.7387911, -2.024886, 0, 1, 0.4196078, 1,
-0.3113697, 0.9865885, 0.3429495, 0, 1, 0.4235294, 1,
-0.307505, -0.2524787, -2.224462, 0, 1, 0.4313726, 1,
-0.3070653, -1.446411, -2.461619, 0, 1, 0.4352941, 1,
-0.3038176, -1.6424, -5.352186, 0, 1, 0.4431373, 1,
-0.3035702, 1.103529, -0.1685164, 0, 1, 0.4470588, 1,
-0.3020444, 0.7738121, -0.4225703, 0, 1, 0.454902, 1,
-0.3016194, 0.7964715, 0.7028673, 0, 1, 0.4588235, 1,
-0.3006446, 0.1784748, -0.1746393, 0, 1, 0.4666667, 1,
-0.3005605, 0.5147495, -0.6855265, 0, 1, 0.4705882, 1,
-0.2956254, -1.310351, -3.573056, 0, 1, 0.4784314, 1,
-0.2923049, -0.9113137, -3.444452, 0, 1, 0.4823529, 1,
-0.2871363, -0.9667046, -3.217365, 0, 1, 0.4901961, 1,
-0.2849578, 0.3040792, -0.205168, 0, 1, 0.4941176, 1,
-0.2804972, -0.3171157, -1.795202, 0, 1, 0.5019608, 1,
-0.266968, 0.9214815, -1.83192, 0, 1, 0.509804, 1,
-0.2651125, 0.9655244, -1.676948, 0, 1, 0.5137255, 1,
-0.2643527, 0.01127521, -2.291662, 0, 1, 0.5215687, 1,
-0.2559783, 1.049239, -0.7120797, 0, 1, 0.5254902, 1,
-0.2529828, -1.416152, -2.933482, 0, 1, 0.5333334, 1,
-0.2509395, 0.3721546, -1.10638, 0, 1, 0.5372549, 1,
-0.2492176, 0.3920773, -0.8197375, 0, 1, 0.5450981, 1,
-0.2491945, 0.7667572, 0.02767775, 0, 1, 0.5490196, 1,
-0.2491471, 0.09235469, -2.091977, 0, 1, 0.5568628, 1,
-0.2478142, -1.135824, -3.171106, 0, 1, 0.5607843, 1,
-0.2470911, 0.8565236, -1.34199, 0, 1, 0.5686275, 1,
-0.2432098, -0.07330084, -0.4300458, 0, 1, 0.572549, 1,
-0.2411105, -0.6610972, -3.042734, 0, 1, 0.5803922, 1,
-0.2387429, 1.153584, -0.8541046, 0, 1, 0.5843138, 1,
-0.2314215, -0.2543374, -2.948566, 0, 1, 0.5921569, 1,
-0.2313562, -0.3193276, -3.690535, 0, 1, 0.5960785, 1,
-0.2285897, 0.2186995, -1.326425, 0, 1, 0.6039216, 1,
-0.2227099, -0.3658224, -2.591943, 0, 1, 0.6117647, 1,
-0.2213771, 0.9926834, 0.6241379, 0, 1, 0.6156863, 1,
-0.2184701, -0.626581, -1.901182, 0, 1, 0.6235294, 1,
-0.2183034, 0.262318, -0.5341925, 0, 1, 0.627451, 1,
-0.2181742, -0.8163917, -2.980965, 0, 1, 0.6352941, 1,
-0.2170728, -1.773568, -3.729011, 0, 1, 0.6392157, 1,
-0.2155959, 1.185465, -0.4096846, 0, 1, 0.6470588, 1,
-0.212733, -0.8730386, -2.220288, 0, 1, 0.6509804, 1,
-0.2078938, 0.8076511, -0.6775761, 0, 1, 0.6588235, 1,
-0.2032094, -1.169636, -1.650405, 0, 1, 0.6627451, 1,
-0.2016897, 0.4440817, 2.431624, 0, 1, 0.6705883, 1,
-0.1949638, 1.603709, -2.611398, 0, 1, 0.6745098, 1,
-0.1886481, -2.58764, -3.114836, 0, 1, 0.682353, 1,
-0.1877589, -0.08324257, -1.215615, 0, 1, 0.6862745, 1,
-0.1874046, -0.3747406, -2.15504, 0, 1, 0.6941177, 1,
-0.1868164, 0.5840151, -0.2159569, 0, 1, 0.7019608, 1,
-0.1804646, 1.087376, -0.3169441, 0, 1, 0.7058824, 1,
-0.1793399, -0.07487001, -2.813461, 0, 1, 0.7137255, 1,
-0.1635757, 1.253856, 1.629519, 0, 1, 0.7176471, 1,
-0.1596499, 0.8655623, -0.1810498, 0, 1, 0.7254902, 1,
-0.1546288, -0.8170514, -3.865443, 0, 1, 0.7294118, 1,
-0.1530133, 1.649675, 1.854698, 0, 1, 0.7372549, 1,
-0.1511626, 2.022356, -0.09587374, 0, 1, 0.7411765, 1,
-0.1511606, -1.250383, -3.354769, 0, 1, 0.7490196, 1,
-0.150209, 0.135208, -1.313267, 0, 1, 0.7529412, 1,
-0.1452297, 1.891142, 1.485396, 0, 1, 0.7607843, 1,
-0.1431026, -0.36155, -1.75906, 0, 1, 0.7647059, 1,
-0.1428084, 1.186012, -0.4857543, 0, 1, 0.772549, 1,
-0.1377296, 1.104248, -0.927493, 0, 1, 0.7764706, 1,
-0.1368843, -1.556255, -2.822602, 0, 1, 0.7843137, 1,
-0.1357803, 0.9642519, -0.8305129, 0, 1, 0.7882353, 1,
-0.1354966, -2.424936, -4.844565, 0, 1, 0.7960784, 1,
-0.1306087, -1.947206, -2.583759, 0, 1, 0.8039216, 1,
-0.1273276, 0.888855, -1.700483, 0, 1, 0.8078431, 1,
-0.1268929, -0.1268343, -2.457736, 0, 1, 0.8156863, 1,
-0.1265382, 2.865896, 0.1202442, 0, 1, 0.8196079, 1,
-0.1259594, 0.6914644, 0.07686545, 0, 1, 0.827451, 1,
-0.1222072, -1.2411, -2.41748, 0, 1, 0.8313726, 1,
-0.1180364, -1.169994, -3.665499, 0, 1, 0.8392157, 1,
-0.1173156, -1.398563, -2.074184, 0, 1, 0.8431373, 1,
-0.1165344, -1.065318, -2.565961, 0, 1, 0.8509804, 1,
-0.1157487, -0.2210046, -1.887904, 0, 1, 0.854902, 1,
-0.1150112, 0.9002541, -1.003665, 0, 1, 0.8627451, 1,
-0.1103587, 0.4039372, 1.108669, 0, 1, 0.8666667, 1,
-0.1096694, 1.009273, -1.194065, 0, 1, 0.8745098, 1,
-0.1075759, 0.4755678, 2.825062, 0, 1, 0.8784314, 1,
-0.0995487, 0.1438934, 0.567831, 0, 1, 0.8862745, 1,
-0.09913176, -0.203501, -4.110466, 0, 1, 0.8901961, 1,
-0.09092692, 1.533609, 0.07867578, 0, 1, 0.8980392, 1,
-0.08176381, 0.7241954, 0.5096382, 0, 1, 0.9058824, 1,
-0.079859, 2.542198, -0.6742892, 0, 1, 0.9098039, 1,
-0.07951445, -0.1976275, -3.026844, 0, 1, 0.9176471, 1,
-0.07627518, 0.8358094, 0.01251106, 0, 1, 0.9215686, 1,
-0.07552042, 1.439863, -0.9441444, 0, 1, 0.9294118, 1,
-0.07354686, 0.538828, -0.6097587, 0, 1, 0.9333333, 1,
-0.07148333, 0.2491168, -0.1109084, 0, 1, 0.9411765, 1,
-0.06631401, 0.1499542, -2.128746, 0, 1, 0.945098, 1,
-0.06628172, -0.2584587, -3.331911, 0, 1, 0.9529412, 1,
-0.06490272, -1.475052, -3.219465, 0, 1, 0.9568627, 1,
-0.06487618, -0.7579327, -1.967374, 0, 1, 0.9647059, 1,
-0.06088625, 0.8684459, 1.453541, 0, 1, 0.9686275, 1,
-0.06072759, -0.6452085, -4.119599, 0, 1, 0.9764706, 1,
-0.05921057, -0.4591517, -2.10922, 0, 1, 0.9803922, 1,
-0.05855798, -1.079639, -3.918042, 0, 1, 0.9882353, 1,
-0.05443815, -1.144161, -3.114135, 0, 1, 0.9921569, 1,
-0.0538478, -0.3824581, -3.458273, 0, 1, 1, 1,
-0.05073628, -1.236233, -3.438931, 0, 0.9921569, 1, 1,
-0.04858964, -1.789729, -0.8098673, 0, 0.9882353, 1, 1,
-0.04616623, 0.4168638, -0.05169765, 0, 0.9803922, 1, 1,
-0.04413313, -1.85807, -1.14746, 0, 0.9764706, 1, 1,
-0.04238625, 0.2798355, 1.339747, 0, 0.9686275, 1, 1,
-0.04029123, -0.03246523, -1.270545, 0, 0.9647059, 1, 1,
-0.03216476, 1.971489, -1.281636, 0, 0.9568627, 1, 1,
-0.0311745, 0.0308848, 0.9582557, 0, 0.9529412, 1, 1,
-0.02656522, 1.381417, -1.571564, 0, 0.945098, 1, 1,
-0.02568224, 0.3087407, -0.4311922, 0, 0.9411765, 1, 1,
-0.02368064, -0.2394282, -2.74105, 0, 0.9333333, 1, 1,
-0.02110218, -0.303148, -1.898673, 0, 0.9294118, 1, 1,
-0.02071349, -1.458985, -3.977009, 0, 0.9215686, 1, 1,
-0.01979687, -0.4442516, -2.130262, 0, 0.9176471, 1, 1,
-0.01963606, -0.0841004, -2.910249, 0, 0.9098039, 1, 1,
-0.01606832, -0.4610024, -4.333224, 0, 0.9058824, 1, 1,
-0.01306343, -0.9914798, -3.313616, 0, 0.8980392, 1, 1,
-0.009145299, 0.6852047, 0.1554935, 0, 0.8901961, 1, 1,
-0.007554301, -0.2014427, -3.810684, 0, 0.8862745, 1, 1,
-0.005816409, -0.01506803, -2.999404, 0, 0.8784314, 1, 1,
-0.004816612, -0.1478025, -2.731357, 0, 0.8745098, 1, 1,
-0.002670108, 1.311156, 1.462001, 0, 0.8666667, 1, 1,
-0.001070192, 0.5668377, 0.7193829, 0, 0.8627451, 1, 1,
0.002886037, 1.209957, -0.9007749, 0, 0.854902, 1, 1,
0.006368708, -0.05633595, 2.309756, 0, 0.8509804, 1, 1,
0.007599749, 0.06365718, 1.225204, 0, 0.8431373, 1, 1,
0.008599252, -0.6333322, 1.899717, 0, 0.8392157, 1, 1,
0.009431922, 0.4701409, 0.3368838, 0, 0.8313726, 1, 1,
0.01070221, 0.9059518, -1.467877, 0, 0.827451, 1, 1,
0.01297809, -0.8483433, 2.395529, 0, 0.8196079, 1, 1,
0.01913697, -0.02526799, 2.508717, 0, 0.8156863, 1, 1,
0.02106219, 0.08784302, 0.4083138, 0, 0.8078431, 1, 1,
0.02210309, 0.582597, 2.565614, 0, 0.8039216, 1, 1,
0.02369827, -0.007543663, 2.231113, 0, 0.7960784, 1, 1,
0.02645291, 0.4846009, 1.744681, 0, 0.7882353, 1, 1,
0.02693065, -0.6180786, 3.11463, 0, 0.7843137, 1, 1,
0.02828905, -0.1128465, 2.870313, 0, 0.7764706, 1, 1,
0.02968905, -0.04472208, 2.454839, 0, 0.772549, 1, 1,
0.03132356, 0.0658296, 0.8199403, 0, 0.7647059, 1, 1,
0.03214105, -0.1656199, 2.7513, 0, 0.7607843, 1, 1,
0.03336174, -0.565669, 3.603112, 0, 0.7529412, 1, 1,
0.03445886, -0.4895236, 4.133694, 0, 0.7490196, 1, 1,
0.0355044, -0.6176202, 4.054152, 0, 0.7411765, 1, 1,
0.04202445, -2.36851, 3.355921, 0, 0.7372549, 1, 1,
0.04351671, -0.3172872, 3.174332, 0, 0.7294118, 1, 1,
0.04449725, 0.5711204, -0.9748129, 0, 0.7254902, 1, 1,
0.04578646, 1.287883, -1.757949, 0, 0.7176471, 1, 1,
0.04603057, -1.584642, 2.103893, 0, 0.7137255, 1, 1,
0.04665383, -0.5061395, 1.739262, 0, 0.7058824, 1, 1,
0.05027078, -2.05207, 2.809523, 0, 0.6980392, 1, 1,
0.05455213, 0.5619237, -0.3752348, 0, 0.6941177, 1, 1,
0.05519996, -0.05008268, 1.620323, 0, 0.6862745, 1, 1,
0.05599419, -0.2573442, 3.736716, 0, 0.682353, 1, 1,
0.06153591, 0.9797064, -1.189611, 0, 0.6745098, 1, 1,
0.0722774, -0.9411193, 1.960822, 0, 0.6705883, 1, 1,
0.07501832, -0.9973448, 2.444577, 0, 0.6627451, 1, 1,
0.07567045, -0.2618847, 5.25699, 0, 0.6588235, 1, 1,
0.07819346, 0.7662181, 0.3450876, 0, 0.6509804, 1, 1,
0.08034833, 0.198136, 1.592301, 0, 0.6470588, 1, 1,
0.0812002, 0.3989683, -1.472976, 0, 0.6392157, 1, 1,
0.08205892, 0.02900809, 0.4115481, 0, 0.6352941, 1, 1,
0.08211905, -0.725531, 2.478923, 0, 0.627451, 1, 1,
0.08343524, -0.1041178, 1.899502, 0, 0.6235294, 1, 1,
0.08609404, -0.4828935, 4.152515, 0, 0.6156863, 1, 1,
0.08740018, 0.3589173, -1.062417, 0, 0.6117647, 1, 1,
0.08892582, -0.08295646, 2.232323, 0, 0.6039216, 1, 1,
0.08914018, -0.7347616, 1.436792, 0, 0.5960785, 1, 1,
0.09147867, -0.7269822, 4.542555, 0, 0.5921569, 1, 1,
0.09247363, 1.336792, 0.6696277, 0, 0.5843138, 1, 1,
0.0974795, -0.07587057, 3.93369, 0, 0.5803922, 1, 1,
0.09870473, 0.6952248, 0.9769286, 0, 0.572549, 1, 1,
0.0991211, -0.5595703, 3.473519, 0, 0.5686275, 1, 1,
0.09983271, -0.7903393, 2.597634, 0, 0.5607843, 1, 1,
0.1010825, 1.077936, 0.7994881, 0, 0.5568628, 1, 1,
0.1019522, 1.450618, 0.2177289, 0, 0.5490196, 1, 1,
0.1038802, 0.8874496, 0.6487378, 0, 0.5450981, 1, 1,
0.1045689, 0.2418496, -1.425852, 0, 0.5372549, 1, 1,
0.1073089, 0.820077, 2.212083, 0, 0.5333334, 1, 1,
0.1137109, 1.897554, 0.9645262, 0, 0.5254902, 1, 1,
0.1151562, 0.6635509, 0.03355641, 0, 0.5215687, 1, 1,
0.1181266, -1.005865, 2.791471, 0, 0.5137255, 1, 1,
0.1190504, -0.7913824, 2.556379, 0, 0.509804, 1, 1,
0.123686, -1.328975, 4.899033, 0, 0.5019608, 1, 1,
0.1244277, 1.061187, 2.491136, 0, 0.4941176, 1, 1,
0.125131, 0.327408, -2.217788, 0, 0.4901961, 1, 1,
0.1270123, 1.271664, -0.9390171, 0, 0.4823529, 1, 1,
0.1291812, 0.9863061, 0.2325288, 0, 0.4784314, 1, 1,
0.1324041, 0.5887607, 0.5051112, 0, 0.4705882, 1, 1,
0.1330664, 0.03578985, 0.9780043, 0, 0.4666667, 1, 1,
0.1338355, 0.3092929, -0.7034137, 0, 0.4588235, 1, 1,
0.1366724, -0.2636405, 2.31771, 0, 0.454902, 1, 1,
0.1453593, -0.5234514, 2.543571, 0, 0.4470588, 1, 1,
0.1480718, 0.01550558, -0.79184, 0, 0.4431373, 1, 1,
0.1495367, 0.9566382, 0.2554892, 0, 0.4352941, 1, 1,
0.1496963, -0.07451412, 1.655188, 0, 0.4313726, 1, 1,
0.149868, 0.39549, 1.984609, 0, 0.4235294, 1, 1,
0.1565518, -1.478456, 4.403355, 0, 0.4196078, 1, 1,
0.1567649, -0.2660613, 3.854445, 0, 0.4117647, 1, 1,
0.1608395, 0.5657865, -0.15798, 0, 0.4078431, 1, 1,
0.1697299, 1.487872, 0.8122395, 0, 0.4, 1, 1,
0.1795435, -1.568733, 4.873895, 0, 0.3921569, 1, 1,
0.180313, 0.6378508, 1.420647, 0, 0.3882353, 1, 1,
0.1803642, -0.2572394, 4.042377, 0, 0.3803922, 1, 1,
0.1820865, 0.4281202, 2.00087, 0, 0.3764706, 1, 1,
0.1877464, 0.08216348, -0.1743725, 0, 0.3686275, 1, 1,
0.1879396, 0.7816806, 0.135312, 0, 0.3647059, 1, 1,
0.1900726, -1.156134, 2.216674, 0, 0.3568628, 1, 1,
0.194681, -1.103728, 4.532777, 0, 0.3529412, 1, 1,
0.1958491, 1.269902, -0.5771245, 0, 0.345098, 1, 1,
0.2025291, 0.01001502, 1.901167, 0, 0.3411765, 1, 1,
0.2032852, 1.107332, -0.7224557, 0, 0.3333333, 1, 1,
0.206997, -0.433988, 2.987539, 0, 0.3294118, 1, 1,
0.2154149, 1.303774, -0.7515497, 0, 0.3215686, 1, 1,
0.2172056, -0.1070732, 3.649474, 0, 0.3176471, 1, 1,
0.2193238, 0.744453, -0.01023217, 0, 0.3098039, 1, 1,
0.2212747, -0.4367319, 3.255529, 0, 0.3058824, 1, 1,
0.2255003, -0.690677, 1.31923, 0, 0.2980392, 1, 1,
0.2280883, -0.03700534, 1.51975, 0, 0.2901961, 1, 1,
0.228709, 1.870282, 1.751198, 0, 0.2862745, 1, 1,
0.2299184, 1.392383, 0.5301994, 0, 0.2784314, 1, 1,
0.2322749, -0.07800073, 2.632111, 0, 0.2745098, 1, 1,
0.2335363, -0.8397967, 2.254334, 0, 0.2666667, 1, 1,
0.2360257, 0.2083075, 3.661701, 0, 0.2627451, 1, 1,
0.2369164, -0.7103171, 4.658044, 0, 0.254902, 1, 1,
0.242365, 2.350772, 0.03298995, 0, 0.2509804, 1, 1,
0.2438153, -1.030194, 3.21231, 0, 0.2431373, 1, 1,
0.2561374, 1.656124, 1.247599, 0, 0.2392157, 1, 1,
0.2581332, -0.6539888, 2.395055, 0, 0.2313726, 1, 1,
0.2619966, 0.1327348, 2.09434, 0, 0.227451, 1, 1,
0.2652451, -0.4931602, 0.8733412, 0, 0.2196078, 1, 1,
0.267767, 0.2945327, 0.8167863, 0, 0.2156863, 1, 1,
0.2721087, -0.4738275, 3.28757, 0, 0.2078431, 1, 1,
0.2834078, 0.1989352, 1.624341, 0, 0.2039216, 1, 1,
0.2843212, -0.8054879, 2.364779, 0, 0.1960784, 1, 1,
0.2858259, -2.905502, 2.259349, 0, 0.1882353, 1, 1,
0.2871146, -1.41288, 4.68975, 0, 0.1843137, 1, 1,
0.2875395, -0.5669428, 0.8165972, 0, 0.1764706, 1, 1,
0.2875969, 1.628425, 0.9873176, 0, 0.172549, 1, 1,
0.2886903, 0.06143601, 1.208459, 0, 0.1647059, 1, 1,
0.2945807, -1.067201, 3.031354, 0, 0.1607843, 1, 1,
0.2952916, -0.8999314, 0.5056615, 0, 0.1529412, 1, 1,
0.2990879, -1.943198, 3.810627, 0, 0.1490196, 1, 1,
0.3000268, -0.8147471, 3.127058, 0, 0.1411765, 1, 1,
0.3036221, -0.7513483, 2.123266, 0, 0.1372549, 1, 1,
0.3053879, -0.5136728, 2.300885, 0, 0.1294118, 1, 1,
0.3076162, 0.8759062, 0.9950683, 0, 0.1254902, 1, 1,
0.3087982, 0.5255914, -1.427131, 0, 0.1176471, 1, 1,
0.3189891, -0.4481033, 4.372197, 0, 0.1137255, 1, 1,
0.3201295, -1.589862, 0.4941688, 0, 0.1058824, 1, 1,
0.3234301, -1.058189, 4.171484, 0, 0.09803922, 1, 1,
0.3273153, -0.4168254, 4.417714, 0, 0.09411765, 1, 1,
0.3301989, 1.09646, -1.170185, 0, 0.08627451, 1, 1,
0.330643, -2.521993, 3.658318, 0, 0.08235294, 1, 1,
0.3359464, -1.112821, 2.255541, 0, 0.07450981, 1, 1,
0.344699, 0.484322, -0.7123787, 0, 0.07058824, 1, 1,
0.3469154, -1.180349, 2.413916, 0, 0.0627451, 1, 1,
0.3483738, -0.7494918, 2.922909, 0, 0.05882353, 1, 1,
0.3507763, 0.4638264, 0.8324563, 0, 0.05098039, 1, 1,
0.3526496, -1.639424, 1.862823, 0, 0.04705882, 1, 1,
0.354726, -0.02308853, 0.09394363, 0, 0.03921569, 1, 1,
0.3590757, 0.92683, 0.9236358, 0, 0.03529412, 1, 1,
0.3644911, -0.2977619, 2.064395, 0, 0.02745098, 1, 1,
0.3661519, 0.3111034, -0.3822114, 0, 0.02352941, 1, 1,
0.3743947, -0.8188855, 2.760799, 0, 0.01568628, 1, 1,
0.3766542, 2.606005, 0.2173325, 0, 0.01176471, 1, 1,
0.3791264, -1.073395, 4.230695, 0, 0.003921569, 1, 1,
0.3807351, -0.0395681, 2.715793, 0.003921569, 0, 1, 1,
0.3809256, 1.519488, -1.155072, 0.007843138, 0, 1, 1,
0.3811267, 0.3328618, 0.6530737, 0.01568628, 0, 1, 1,
0.3838934, 0.8476686, 1.920118, 0.01960784, 0, 1, 1,
0.3858573, -0.8767844, 2.973773, 0.02745098, 0, 1, 1,
0.3902362, 0.3535248, 1.679004, 0.03137255, 0, 1, 1,
0.3908048, -0.4913054, 2.654855, 0.03921569, 0, 1, 1,
0.3965001, -0.6289928, 2.333405, 0.04313726, 0, 1, 1,
0.3972042, 1.445247, 0.2703532, 0.05098039, 0, 1, 1,
0.3981531, -1.012337, 2.79784, 0.05490196, 0, 1, 1,
0.3983213, -2.35745, 3.530947, 0.0627451, 0, 1, 1,
0.3984135, 0.1639296, 2.015022, 0.06666667, 0, 1, 1,
0.3989977, -0.7854958, 3.45698, 0.07450981, 0, 1, 1,
0.3997123, -0.07348271, 1.988573, 0.07843138, 0, 1, 1,
0.4034211, 1.211616, -0.2893302, 0.08627451, 0, 1, 1,
0.4071794, 1.578443, -0.6682967, 0.09019608, 0, 1, 1,
0.4098427, -1.416705, 2.905169, 0.09803922, 0, 1, 1,
0.4137723, -2.321549, 1.613304, 0.1058824, 0, 1, 1,
0.418314, 0.4480462, 0.2577806, 0.1098039, 0, 1, 1,
0.4220466, 1.114848, -0.7091482, 0.1176471, 0, 1, 1,
0.4257171, -0.5841784, 2.112274, 0.1215686, 0, 1, 1,
0.4269031, -1.296082, 2.83169, 0.1294118, 0, 1, 1,
0.4319728, -2.54199, 2.734342, 0.1333333, 0, 1, 1,
0.4326132, 1.477667, -1.172044, 0.1411765, 0, 1, 1,
0.4326863, 0.2843502, 0.9646869, 0.145098, 0, 1, 1,
0.4388571, -0.9769834, 2.729867, 0.1529412, 0, 1, 1,
0.4402328, 1.333144, 0.9691774, 0.1568628, 0, 1, 1,
0.4406337, 0.1332523, 1.198481, 0.1647059, 0, 1, 1,
0.4409216, -1.576704, 1.241784, 0.1686275, 0, 1, 1,
0.4442986, 1.087858, 0.471523, 0.1764706, 0, 1, 1,
0.4455433, -0.5980848, 3.189115, 0.1803922, 0, 1, 1,
0.4502491, 1.176507, 0.6152777, 0.1882353, 0, 1, 1,
0.4565655, -0.3727572, 4.192025, 0.1921569, 0, 1, 1,
0.4598074, 0.588438, 1.752144, 0.2, 0, 1, 1,
0.4646742, -0.6102183, 3.096972, 0.2078431, 0, 1, 1,
0.4648017, 1.017432, 1.664844, 0.2117647, 0, 1, 1,
0.4677756, -0.48161, 0.6779433, 0.2196078, 0, 1, 1,
0.4713063, 1.596403, -0.5013249, 0.2235294, 0, 1, 1,
0.4723046, -0.981965, 4.157609, 0.2313726, 0, 1, 1,
0.4937221, -1.331231, 1.326711, 0.2352941, 0, 1, 1,
0.4947892, -1.311192, 3.723349, 0.2431373, 0, 1, 1,
0.5014796, 0.2701212, 1.700023, 0.2470588, 0, 1, 1,
0.5051401, -0.7610148, 0.9320154, 0.254902, 0, 1, 1,
0.5067813, -0.6800265, 1.340871, 0.2588235, 0, 1, 1,
0.5111455, -0.05784215, 2.111378, 0.2666667, 0, 1, 1,
0.5115288, 1.205518, 2.794852, 0.2705882, 0, 1, 1,
0.5143688, 0.638401, 1.502038, 0.2784314, 0, 1, 1,
0.5147766, 1.042765, -0.007584293, 0.282353, 0, 1, 1,
0.520206, 0.1954564, 1.827924, 0.2901961, 0, 1, 1,
0.5256118, -0.2325366, 1.729882, 0.2941177, 0, 1, 1,
0.5260266, 1.188991, 1.060443, 0.3019608, 0, 1, 1,
0.526484, -0.2915163, 1.563912, 0.3098039, 0, 1, 1,
0.529269, 0.02691285, 1.797293, 0.3137255, 0, 1, 1,
0.536998, -0.6523699, 3.21455, 0.3215686, 0, 1, 1,
0.5406783, 0.732595, 0.8234095, 0.3254902, 0, 1, 1,
0.5424887, 1.794543, -1.010877, 0.3333333, 0, 1, 1,
0.5428399, 0.142509, 1.365798, 0.3372549, 0, 1, 1,
0.5450994, -1.41658, 2.98723, 0.345098, 0, 1, 1,
0.5502229, -0.9204254, 2.098816, 0.3490196, 0, 1, 1,
0.5502776, 2.856104, 0.07735441, 0.3568628, 0, 1, 1,
0.5506833, -1.796881, 2.610027, 0.3607843, 0, 1, 1,
0.5508809, 0.145226, 1.895233, 0.3686275, 0, 1, 1,
0.5619149, 0.0407431, 0.7922044, 0.372549, 0, 1, 1,
0.56272, 0.9284844, 0.7913007, 0.3803922, 0, 1, 1,
0.5663067, -0.7902959, 2.088399, 0.3843137, 0, 1, 1,
0.5700198, 0.943978, 1.802283, 0.3921569, 0, 1, 1,
0.5761016, 0.6612242, 0.5438101, 0.3960784, 0, 1, 1,
0.5766314, 1.811286, 0.5237026, 0.4039216, 0, 1, 1,
0.5840125, -1.382446, 2.815249, 0.4117647, 0, 1, 1,
0.5893544, -0.3858495, 1.121649, 0.4156863, 0, 1, 1,
0.5904217, 0.03807213, 0.5580229, 0.4235294, 0, 1, 1,
0.5947115, -1.017787, 2.376461, 0.427451, 0, 1, 1,
0.5960047, 1.860044, 0.2784354, 0.4352941, 0, 1, 1,
0.5965406, -2.060522, 2.040328, 0.4392157, 0, 1, 1,
0.5980842, 1.685058, 0.1314846, 0.4470588, 0, 1, 1,
0.6001858, 0.4005903, 0.5719275, 0.4509804, 0, 1, 1,
0.6004745, -0.294555, 0.6943663, 0.4588235, 0, 1, 1,
0.6015317, -0.9416483, 0.8959278, 0.4627451, 0, 1, 1,
0.6062374, 0.5941029, 0.1617715, 0.4705882, 0, 1, 1,
0.6073067, 1.074582, 1.321047, 0.4745098, 0, 1, 1,
0.6078553, 0.06195292, 2.639094, 0.4823529, 0, 1, 1,
0.6125647, -0.7889072, 1.985887, 0.4862745, 0, 1, 1,
0.6130869, 0.002014102, 1.099624, 0.4941176, 0, 1, 1,
0.6147705, 0.9349631, 2.393512, 0.5019608, 0, 1, 1,
0.6161259, -0.5838341, 4.431502, 0.5058824, 0, 1, 1,
0.6219482, -0.02889053, 2.013123, 0.5137255, 0, 1, 1,
0.6220126, -0.3518095, 3.607329, 0.5176471, 0, 1, 1,
0.6239007, 1.83894, -0.4414098, 0.5254902, 0, 1, 1,
0.6264185, -0.7835518, 2.702844, 0.5294118, 0, 1, 1,
0.6290016, -1.483233, 0.8142209, 0.5372549, 0, 1, 1,
0.6416407, 0.09251767, 1.361786, 0.5411765, 0, 1, 1,
0.6462055, -1.222378, 1.763895, 0.5490196, 0, 1, 1,
0.648613, 0.008421957, 3.633554, 0.5529412, 0, 1, 1,
0.6490446, -0.7544751, 1.983623, 0.5607843, 0, 1, 1,
0.6589919, 1.465616, 1.134636, 0.5647059, 0, 1, 1,
0.6592404, 0.1527805, 3.508144, 0.572549, 0, 1, 1,
0.6626028, -0.7719104, 3.251448, 0.5764706, 0, 1, 1,
0.6658362, -0.8024292, 3.309083, 0.5843138, 0, 1, 1,
0.6662591, -1.128877, 4.291123, 0.5882353, 0, 1, 1,
0.6667304, -1.062483, 3.099742, 0.5960785, 0, 1, 1,
0.6725008, -1.542636, 3.390785, 0.6039216, 0, 1, 1,
0.6734384, -0.002811625, 1.429054, 0.6078432, 0, 1, 1,
0.6753488, -0.1630091, 1.750577, 0.6156863, 0, 1, 1,
0.6763245, 0.9801229, -0.216107, 0.6196079, 0, 1, 1,
0.6783417, -0.5916772, 2.536601, 0.627451, 0, 1, 1,
0.6808816, 0.16154, 0.3493162, 0.6313726, 0, 1, 1,
0.6821479, 0.2815746, 1.812719, 0.6392157, 0, 1, 1,
0.6856853, -2.132898, 3.282688, 0.6431373, 0, 1, 1,
0.6880862, 0.1411865, 1.145177, 0.6509804, 0, 1, 1,
0.6911948, -0.007858797, 1.936128, 0.654902, 0, 1, 1,
0.6953235, -1.374595, 1.287314, 0.6627451, 0, 1, 1,
0.6972624, -1.044534, 2.824359, 0.6666667, 0, 1, 1,
0.7016562, 0.8022878, 0.7904068, 0.6745098, 0, 1, 1,
0.7018112, 0.881094, 1.709985, 0.6784314, 0, 1, 1,
0.7023577, -1.836783, 3.582007, 0.6862745, 0, 1, 1,
0.7030226, 0.05287632, 2.046683, 0.6901961, 0, 1, 1,
0.7099658, 0.9356637, 1.063197, 0.6980392, 0, 1, 1,
0.7184335, 1.970723, 0.4852466, 0.7058824, 0, 1, 1,
0.7188029, -0.1480397, 2.101178, 0.7098039, 0, 1, 1,
0.7202712, -0.3457297, 2.006283, 0.7176471, 0, 1, 1,
0.7292928, 0.4705158, 0.2667077, 0.7215686, 0, 1, 1,
0.7294483, -1.493644, 1.75186, 0.7294118, 0, 1, 1,
0.7326256, 0.6810864, 0.8542362, 0.7333333, 0, 1, 1,
0.7349326, -0.04803573, 0.9562142, 0.7411765, 0, 1, 1,
0.7552865, 0.558845, 1.149102, 0.7450981, 0, 1, 1,
0.7560847, 1.652922, 0.3352365, 0.7529412, 0, 1, 1,
0.757987, 0.2855606, 1.509454, 0.7568628, 0, 1, 1,
0.7609944, -0.7564133, 3.508212, 0.7647059, 0, 1, 1,
0.7649701, 0.102592, -0.1462752, 0.7686275, 0, 1, 1,
0.7703815, -0.9300309, 1.201861, 0.7764706, 0, 1, 1,
0.7755979, -1.038745, 2.567907, 0.7803922, 0, 1, 1,
0.7858388, 0.21999, 1.625308, 0.7882353, 0, 1, 1,
0.7878726, -2.833086, 2.223564, 0.7921569, 0, 1, 1,
0.7884114, -1.326407, 2.230814, 0.8, 0, 1, 1,
0.7887248, 1.37942, -0.322626, 0.8078431, 0, 1, 1,
0.7910873, 0.06450006, 1.298534, 0.8117647, 0, 1, 1,
0.7947901, 0.2469026, 0.7454541, 0.8196079, 0, 1, 1,
0.7959597, -0.1683303, 2.203108, 0.8235294, 0, 1, 1,
0.7984192, 1.050534, 0.39378, 0.8313726, 0, 1, 1,
0.8036745, 1.138584, 1.369114, 0.8352941, 0, 1, 1,
0.8040245, -3.053698, 2.510987, 0.8431373, 0, 1, 1,
0.806585, -0.9668977, 2.212203, 0.8470588, 0, 1, 1,
0.8076156, -0.8142747, 1.372626, 0.854902, 0, 1, 1,
0.8081249, 0.6043891, 0.2551414, 0.8588235, 0, 1, 1,
0.8122496, -0.03430449, 3.019463, 0.8666667, 0, 1, 1,
0.8176376, -0.389623, 1.873358, 0.8705882, 0, 1, 1,
0.8176535, -0.04358928, 1.599682, 0.8784314, 0, 1, 1,
0.8227011, 0.8108173, 1.171418, 0.8823529, 0, 1, 1,
0.8237703, 0.7551486, 1.700084, 0.8901961, 0, 1, 1,
0.8294206, -0.8123412, 3.009134, 0.8941177, 0, 1, 1,
0.8326447, -1.069615, 3.875942, 0.9019608, 0, 1, 1,
0.8443556, -1.19259, 2.805402, 0.9098039, 0, 1, 1,
0.8447532, 0.3425326, 0.01810142, 0.9137255, 0, 1, 1,
0.8461848, -2.252912, 0.8797439, 0.9215686, 0, 1, 1,
0.8518079, 0.004664805, 2.648751, 0.9254902, 0, 1, 1,
0.8639659, -0.9949588, 3.902067, 0.9333333, 0, 1, 1,
0.8661045, 0.4784467, 1.510129, 0.9372549, 0, 1, 1,
0.8679776, -0.4790622, 2.93099, 0.945098, 0, 1, 1,
0.8686801, 0.6134746, 1.008821, 0.9490196, 0, 1, 1,
0.87007, 0.1341773, -1.042702, 0.9568627, 0, 1, 1,
0.8718074, 0.1889212, 1.107638, 0.9607843, 0, 1, 1,
0.8820629, -1.910918, 2.882583, 0.9686275, 0, 1, 1,
0.8864149, 0.9007956, 0.7921267, 0.972549, 0, 1, 1,
0.8886794, 1.216208, -0.387405, 0.9803922, 0, 1, 1,
0.9052134, -1.59983, 3.589755, 0.9843137, 0, 1, 1,
0.9118165, 1.685808, 0.348515, 0.9921569, 0, 1, 1,
0.9147558, -0.375459, 3.146634, 0.9960784, 0, 1, 1,
0.9153435, 0.7022821, 1.105395, 1, 0, 0.9960784, 1,
0.9169799, 2.197089, 1.697311, 1, 0, 0.9882353, 1,
0.9233709, 0.8544613, 1.174157, 1, 0, 0.9843137, 1,
0.9269891, -0.2905027, 2.859609, 1, 0, 0.9764706, 1,
0.927442, 0.1309031, 2.285503, 1, 0, 0.972549, 1,
0.9277939, -0.8075947, 2.451183, 1, 0, 0.9647059, 1,
0.9352955, -0.7243959, 2.741136, 1, 0, 0.9607843, 1,
0.9361926, -0.7060271, 1.078783, 1, 0, 0.9529412, 1,
0.9431236, -0.2688096, 1.082324, 1, 0, 0.9490196, 1,
0.9461439, 0.3554039, 0.2574202, 1, 0, 0.9411765, 1,
0.9463103, -0.1596034, 1.902338, 1, 0, 0.9372549, 1,
0.9519768, -0.6076033, 2.101326, 1, 0, 0.9294118, 1,
0.9642612, 0.331937, 2.205667, 1, 0, 0.9254902, 1,
0.9644395, 0.5222154, 1.530201, 1, 0, 0.9176471, 1,
0.967198, 1.287917, 0.029241, 1, 0, 0.9137255, 1,
0.9673063, 0.6515198, 0.7607288, 1, 0, 0.9058824, 1,
0.9706774, -0.7201276, 2.310052, 1, 0, 0.9019608, 1,
0.9749079, -0.9627675, 1.920296, 1, 0, 0.8941177, 1,
0.9751959, -0.3083127, 2.269217, 1, 0, 0.8862745, 1,
0.9754264, 0.3828633, 1.570711, 1, 0, 0.8823529, 1,
0.9755765, -0.3383577, 1.854978, 1, 0, 0.8745098, 1,
0.9816116, -0.3037815, 1.618934, 1, 0, 0.8705882, 1,
0.986644, -1.211874, 3.157474, 1, 0, 0.8627451, 1,
1.004013, 0.570106, 1.073971, 1, 0, 0.8588235, 1,
1.006768, 0.3048279, 0.6442348, 1, 0, 0.8509804, 1,
1.012211, 0.3284069, 1.397218, 1, 0, 0.8470588, 1,
1.012461, -0.5442906, 2.597897, 1, 0, 0.8392157, 1,
1.022475, -1.584967, 1.591501, 1, 0, 0.8352941, 1,
1.045479, 0.3111631, 0.2401604, 1, 0, 0.827451, 1,
1.04579, -1.351002, 3.238944, 1, 0, 0.8235294, 1,
1.053524, 0.0388181, -0.4847876, 1, 0, 0.8156863, 1,
1.054498, 0.1639899, 1.324564, 1, 0, 0.8117647, 1,
1.056162, -0.393397, 4.119435, 1, 0, 0.8039216, 1,
1.056485, 2.486516, 1.537697, 1, 0, 0.7960784, 1,
1.068658, 0.5447707, 0.06162482, 1, 0, 0.7921569, 1,
1.071481, -1.284495, 3.644669, 1, 0, 0.7843137, 1,
1.073873, 1.066828, -0.2535215, 1, 0, 0.7803922, 1,
1.078791, 0.2285362, 0.752321, 1, 0, 0.772549, 1,
1.079833, -0.1842668, 2.436496, 1, 0, 0.7686275, 1,
1.084815, 1.736967, 0.7435461, 1, 0, 0.7607843, 1,
1.090853, -1.534996, 3.023106, 1, 0, 0.7568628, 1,
1.092939, 0.1717689, 3.991628, 1, 0, 0.7490196, 1,
1.095579, -0.4842389, 1.89495, 1, 0, 0.7450981, 1,
1.099875, 1.234889, 1.009227, 1, 0, 0.7372549, 1,
1.109071, 1.092869, 1.751134, 1, 0, 0.7333333, 1,
1.112546, -0.429512, 3.334235, 1, 0, 0.7254902, 1,
1.114189, -1.854499, 4.689404, 1, 0, 0.7215686, 1,
1.135488, 0.1713496, 1.046549, 1, 0, 0.7137255, 1,
1.13622, -0.9453454, 1.071685, 1, 0, 0.7098039, 1,
1.141632, -1.746749, 2.517553, 1, 0, 0.7019608, 1,
1.147394, 0.1731832, 0.4499014, 1, 0, 0.6941177, 1,
1.150304, 1.263326, 0.3520409, 1, 0, 0.6901961, 1,
1.153788, 0.8206715, 1.18924, 1, 0, 0.682353, 1,
1.16686, -1.653082, 2.918682, 1, 0, 0.6784314, 1,
1.171057, 0.9423113, 2.020175, 1, 0, 0.6705883, 1,
1.171348, -0.7245126, 3.614706, 1, 0, 0.6666667, 1,
1.172766, 0.606196, 2.154311, 1, 0, 0.6588235, 1,
1.181349, 0.9202283, 0.2993889, 1, 0, 0.654902, 1,
1.184023, 1.934396, 1.777511, 1, 0, 0.6470588, 1,
1.188243, -0.642399, 2.696013, 1, 0, 0.6431373, 1,
1.194667, -0.1386083, 0.8984538, 1, 0, 0.6352941, 1,
1.19528, -0.2881722, 2.482026, 1, 0, 0.6313726, 1,
1.199773, 1.849567, 1.127992, 1, 0, 0.6235294, 1,
1.205512, 1.122655, -0.3809631, 1, 0, 0.6196079, 1,
1.206257, 1.089553, 0.2372585, 1, 0, 0.6117647, 1,
1.207877, 0.6583487, -0.8642898, 1, 0, 0.6078432, 1,
1.236413, 0.4193211, 1.880345, 1, 0, 0.6, 1,
1.252067, -0.08190838, 0.8737714, 1, 0, 0.5921569, 1,
1.254321, -1.168983, 3.245924, 1, 0, 0.5882353, 1,
1.255031, 1.354558, 1.681398, 1, 0, 0.5803922, 1,
1.26581, -0.9795148, 2.652028, 1, 0, 0.5764706, 1,
1.266788, 0.9913944, 1.013836, 1, 0, 0.5686275, 1,
1.271141, 1.081804, -0.09669711, 1, 0, 0.5647059, 1,
1.276322, -0.9856037, 1.663896, 1, 0, 0.5568628, 1,
1.282077, -0.4379879, 1.349555, 1, 0, 0.5529412, 1,
1.284669, -0.04447922, 2.943632, 1, 0, 0.5450981, 1,
1.295733, 0.6796895, 0.5369727, 1, 0, 0.5411765, 1,
1.315009, 0.8056385, 0.9149384, 1, 0, 0.5333334, 1,
1.316288, -1.347583, 0.8678471, 1, 0, 0.5294118, 1,
1.348037, -0.6257761, 3.447025, 1, 0, 0.5215687, 1,
1.349862, -0.4597188, 2.232447, 1, 0, 0.5176471, 1,
1.356944, 0.1423234, 0.6824876, 1, 0, 0.509804, 1,
1.357759, -0.9545721, 2.593629, 1, 0, 0.5058824, 1,
1.376327, -0.4264144, 1.294347, 1, 0, 0.4980392, 1,
1.386176, -0.3516996, 2.556943, 1, 0, 0.4901961, 1,
1.392187, -1.402066, 2.318807, 1, 0, 0.4862745, 1,
1.396645, 0.665283, 0.9226047, 1, 0, 0.4784314, 1,
1.43269, -1.219822, 1.874437, 1, 0, 0.4745098, 1,
1.436809, -0.6855797, 3.430051, 1, 0, 0.4666667, 1,
1.438723, 1.026453, 1.433974, 1, 0, 0.4627451, 1,
1.441689, -0.1297449, 0.6900895, 1, 0, 0.454902, 1,
1.441855, 0.5584833, 3.056502, 1, 0, 0.4509804, 1,
1.452027, -0.6208253, 2.814615, 1, 0, 0.4431373, 1,
1.452547, 0.1736102, 0.8625259, 1, 0, 0.4392157, 1,
1.4531, -0.1599005, 1.715592, 1, 0, 0.4313726, 1,
1.457612, 0.3322981, 1.530514, 1, 0, 0.427451, 1,
1.479703, 0.1015041, 2.97884, 1, 0, 0.4196078, 1,
1.484398, 2.053122, 1.22842, 1, 0, 0.4156863, 1,
1.496733, -0.4711762, 1.103927, 1, 0, 0.4078431, 1,
1.534952, 0.06401831, 0.5995315, 1, 0, 0.4039216, 1,
1.552741, 0.3116228, 1.989581, 1, 0, 0.3960784, 1,
1.552872, 2.513084, 1.35982, 1, 0, 0.3882353, 1,
1.564788, -1.412071, 4.023878, 1, 0, 0.3843137, 1,
1.570051, 0.3127853, 1.471249, 1, 0, 0.3764706, 1,
1.572981, 0.7107031, 0.003494297, 1, 0, 0.372549, 1,
1.573927, 0.5958975, 0.02334347, 1, 0, 0.3647059, 1,
1.579175, -2.058066, 3.634445, 1, 0, 0.3607843, 1,
1.583783, 0.93576, 2.392211, 1, 0, 0.3529412, 1,
1.60079, 1.148908, 0.2901633, 1, 0, 0.3490196, 1,
1.639234, 0.5186817, 1.083529, 1, 0, 0.3411765, 1,
1.642725, 0.793932, -1.20094, 1, 0, 0.3372549, 1,
1.65578, -0.04405412, 0.9106457, 1, 0, 0.3294118, 1,
1.664709, 0.2373728, 0.4068932, 1, 0, 0.3254902, 1,
1.671605, -1.109627, 2.464321, 1, 0, 0.3176471, 1,
1.672568, 0.8157718, 0.8528711, 1, 0, 0.3137255, 1,
1.686204, -1.162043, 2.201832, 1, 0, 0.3058824, 1,
1.727158, 1.286189, 1.191934, 1, 0, 0.2980392, 1,
1.732163, 0.9260439, 0.3284096, 1, 0, 0.2941177, 1,
1.760777, -1.144038, 1.344017, 1, 0, 0.2862745, 1,
1.761914, -0.03198566, -0.1288034, 1, 0, 0.282353, 1,
1.765733, -0.8997858, 1.351207, 1, 0, 0.2745098, 1,
1.767267, -1.112255, 0.330054, 1, 0, 0.2705882, 1,
1.776813, -1.20103, 2.875349, 1, 0, 0.2627451, 1,
1.786285, -0.5744373, 3.301424, 1, 0, 0.2588235, 1,
1.79655, -1.603383, 3.189191, 1, 0, 0.2509804, 1,
1.810833, -0.2277809, 3.935143, 1, 0, 0.2470588, 1,
1.830152, 0.4035713, 2.551214, 1, 0, 0.2392157, 1,
1.830662, -1.187222, 3.07388, 1, 0, 0.2352941, 1,
1.873253, 0.355675, -0.1860456, 1, 0, 0.227451, 1,
1.876971, 0.07978326, 3.564479, 1, 0, 0.2235294, 1,
1.882778, -0.1636828, 1.679461, 1, 0, 0.2156863, 1,
1.88598, -0.912138, 2.056017, 1, 0, 0.2117647, 1,
1.892693, -0.2351156, 1.211181, 1, 0, 0.2039216, 1,
1.91025, 1.614104, 1.295206, 1, 0, 0.1960784, 1,
1.947817, -1.42808, 3.809665, 1, 0, 0.1921569, 1,
1.949511, 0.2285028, 0.6701935, 1, 0, 0.1843137, 1,
1.971727, -1.180603, 0.1176918, 1, 0, 0.1803922, 1,
1.992755, -1.169247, 0.5215902, 1, 0, 0.172549, 1,
1.994542, 0.600929, 0.1177764, 1, 0, 0.1686275, 1,
2.008976, -0.4373817, 3.14515, 1, 0, 0.1607843, 1,
2.016627, 0.1415827, 1.579907, 1, 0, 0.1568628, 1,
2.05898, -0.3574837, 0.8876505, 1, 0, 0.1490196, 1,
2.106169, 0.6131458, -0.4357196, 1, 0, 0.145098, 1,
2.134208, -0.7826334, 2.035192, 1, 0, 0.1372549, 1,
2.159842, -1.806141, 0.5733873, 1, 0, 0.1333333, 1,
2.173833, -1.227578, 1.650454, 1, 0, 0.1254902, 1,
2.177939, 0.3199842, 0.9396925, 1, 0, 0.1215686, 1,
2.195338, -0.3754775, 1.197681, 1, 0, 0.1137255, 1,
2.217622, -1.580923, 1.905818, 1, 0, 0.1098039, 1,
2.23684, 0.2551404, -0.1821273, 1, 0, 0.1019608, 1,
2.243271, 0.8120443, 0.1533104, 1, 0, 0.09411765, 1,
2.256122, -0.4767138, -0.3491719, 1, 0, 0.09019608, 1,
2.305124, 1.379572, 1.130563, 1, 0, 0.08235294, 1,
2.319567, 1.052527, 1.474702, 1, 0, 0.07843138, 1,
2.320064, -1.922158, 1.135971, 1, 0, 0.07058824, 1,
2.359064, -0.5222586, 2.090607, 1, 0, 0.06666667, 1,
2.380238, -1.38849, 3.055646, 1, 0, 0.05882353, 1,
2.385872, -0.5843468, 1.901487, 1, 0, 0.05490196, 1,
2.389315, -0.4407669, 2.079201, 1, 0, 0.04705882, 1,
2.555279, -0.06434979, 1.248988, 1, 0, 0.04313726, 1,
2.559468, 0.06605967, 0.748605, 1, 0, 0.03529412, 1,
2.66165, -0.2664875, -0.1984593, 1, 0, 0.03137255, 1,
2.703136, 0.4801997, 1.238593, 1, 0, 0.02352941, 1,
2.9205, -0.2691737, 1.238132, 1, 0, 0.01960784, 1,
3.008635, -0.9102218, 1.977683, 1, 0, 0.01176471, 1,
3.357257, 0.1680535, 0.8857588, 1, 0, 0.007843138, 1
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
0.1305863, -4.232124, -7.215046, 0, -0.5, 0.5, 0.5,
0.1305863, -4.232124, -7.215046, 1, -0.5, 0.5, 0.5,
0.1305863, -4.232124, -7.215046, 1, 1.5, 0.5, 0.5,
0.1305863, -4.232124, -7.215046, 0, 1.5, 0.5, 0.5
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
-4.189926, 0.04417717, -7.215046, 0, -0.5, 0.5, 0.5,
-4.189926, 0.04417717, -7.215046, 1, -0.5, 0.5, 0.5,
-4.189926, 0.04417717, -7.215046, 1, 1.5, 0.5, 0.5,
-4.189926, 0.04417717, -7.215046, 0, 1.5, 0.5, 0.5
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
-4.189926, -4.232124, -0.07521844, 0, -0.5, 0.5, 0.5,
-4.189926, -4.232124, -0.07521844, 1, -0.5, 0.5, 0.5,
-4.189926, -4.232124, -0.07521844, 1, 1.5, 0.5, 0.5,
-4.189926, -4.232124, -0.07521844, 0, 1.5, 0.5, 0.5
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
-3, -3.245285, -5.567394,
3, -3.245285, -5.567394,
-3, -3.245285, -5.567394,
-3, -3.409758, -5.842002,
-2, -3.245285, -5.567394,
-2, -3.409758, -5.842002,
-1, -3.245285, -5.567394,
-1, -3.409758, -5.842002,
0, -3.245285, -5.567394,
0, -3.409758, -5.842002,
1, -3.245285, -5.567394,
1, -3.409758, -5.842002,
2, -3.245285, -5.567394,
2, -3.409758, -5.842002,
3, -3.245285, -5.567394,
3, -3.409758, -5.842002
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
-3, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
-3, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
-3, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
-3, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
-2, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
-2, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
-2, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
-2, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
-1, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
-1, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
-1, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
-1, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
0, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
0, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
0, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
0, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
1, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
1, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
1, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
1, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
2, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
2, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
2, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
2, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5,
3, -3.738704, -6.39122, 0, -0.5, 0.5, 0.5,
3, -3.738704, -6.39122, 1, -0.5, 0.5, 0.5,
3, -3.738704, -6.39122, 1, 1.5, 0.5, 0.5,
3, -3.738704, -6.39122, 0, 1.5, 0.5, 0.5
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
-3.192885, -3, -5.567394,
-3.192885, 3, -5.567394,
-3.192885, -3, -5.567394,
-3.359058, -3, -5.842002,
-3.192885, -2, -5.567394,
-3.359058, -2, -5.842002,
-3.192885, -1, -5.567394,
-3.359058, -1, -5.842002,
-3.192885, 0, -5.567394,
-3.359058, 0, -5.842002,
-3.192885, 1, -5.567394,
-3.359058, 1, -5.842002,
-3.192885, 2, -5.567394,
-3.359058, 2, -5.842002,
-3.192885, 3, -5.567394,
-3.359058, 3, -5.842002
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
-3.691405, -3, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, -3, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, -3, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, -3, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, -2, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, -2, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, -2, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, -2, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, -1, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, -1, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, -1, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, -1, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, 0, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, 0, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, 0, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, 0, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, 1, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, 1, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, 1, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, 1, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, 2, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, 2, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, 2, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, 2, -6.39122, 0, 1.5, 0.5, 0.5,
-3.691405, 3, -6.39122, 0, -0.5, 0.5, 0.5,
-3.691405, 3, -6.39122, 1, -0.5, 0.5, 0.5,
-3.691405, 3, -6.39122, 1, 1.5, 0.5, 0.5,
-3.691405, 3, -6.39122, 0, 1.5, 0.5, 0.5
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
-3.192885, -3.245285, -4,
-3.192885, -3.245285, 4,
-3.192885, -3.245285, -4,
-3.359058, -3.409758, -4,
-3.192885, -3.245285, -2,
-3.359058, -3.409758, -2,
-3.192885, -3.245285, 0,
-3.359058, -3.409758, 0,
-3.192885, -3.245285, 2,
-3.359058, -3.409758, 2,
-3.192885, -3.245285, 4,
-3.359058, -3.409758, 4
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
-3.691405, -3.738704, -4, 0, -0.5, 0.5, 0.5,
-3.691405, -3.738704, -4, 1, -0.5, 0.5, 0.5,
-3.691405, -3.738704, -4, 1, 1.5, 0.5, 0.5,
-3.691405, -3.738704, -4, 0, 1.5, 0.5, 0.5,
-3.691405, -3.738704, -2, 0, -0.5, 0.5, 0.5,
-3.691405, -3.738704, -2, 1, -0.5, 0.5, 0.5,
-3.691405, -3.738704, -2, 1, 1.5, 0.5, 0.5,
-3.691405, -3.738704, -2, 0, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 0, 0, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 0, 1, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 0, 1, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 0, 0, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 2, 0, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 2, 1, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 2, 1, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 2, 0, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 4, 0, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 4, 1, -0.5, 0.5, 0.5,
-3.691405, -3.738704, 4, 1, 1.5, 0.5, 0.5,
-3.691405, -3.738704, 4, 0, 1.5, 0.5, 0.5
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
-3.192885, -3.245285, -5.567394,
-3.192885, 3.33364, -5.567394,
-3.192885, -3.245285, 5.416957,
-3.192885, 3.33364, 5.416957,
-3.192885, -3.245285, -5.567394,
-3.192885, -3.245285, 5.416957,
-3.192885, 3.33364, -5.567394,
-3.192885, 3.33364, 5.416957,
-3.192885, -3.245285, -5.567394,
3.454057, -3.245285, -5.567394,
-3.192885, -3.245285, 5.416957,
3.454057, -3.245285, 5.416957,
-3.192885, 3.33364, -5.567394,
3.454057, 3.33364, -5.567394,
-3.192885, 3.33364, 5.416957,
3.454057, 3.33364, 5.416957,
3.454057, -3.245285, -5.567394,
3.454057, 3.33364, -5.567394,
3.454057, -3.245285, 5.416957,
3.454057, 3.33364, 5.416957,
3.454057, -3.245285, -5.567394,
3.454057, -3.245285, 5.416957,
3.454057, 3.33364, -5.567394,
3.454057, 3.33364, 5.416957
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
var radius = 7.703399;
var distance = 34.2733;
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
mvMatrix.translate( -0.1305863, -0.04417717, 0.07521844 );
mvMatrix.scale( 1.253067, 1.266022, 0.7582666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2733);
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
benzadox<-read.table("benzadox.xyz")
```

```
## Error in read.table("benzadox.xyz"): no lines available in input
```

```r
x<-benzadox$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
y<-benzadox$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
z<-benzadox$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
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
-3.096085, 1.117396, -2.923558, 0, 0, 1, 1, 1,
-3.065409, 0.2113282, -1.983219, 1, 0, 0, 1, 1,
-2.771478, -0.8291658, -1.273096, 1, 0, 0, 1, 1,
-2.72922, -2.21238, -4.936504, 1, 0, 0, 1, 1,
-2.718544, -0.3542262, -1.206446, 1, 0, 0, 1, 1,
-2.631448, 0.08870298, -0.07501148, 1, 0, 0, 1, 1,
-2.608537, 1.614996, -2.673213, 0, 0, 0, 1, 1,
-2.492296, -0.02761534, -0.6620386, 0, 0, 0, 1, 1,
-2.38354, -0.1334281, -2.847927, 0, 0, 0, 1, 1,
-2.368959, 1.105516, -1.784485, 0, 0, 0, 1, 1,
-2.351686, -0.7828814, -1.548611, 0, 0, 0, 1, 1,
-2.262321, -0.1284385, -1.915786, 0, 0, 0, 1, 1,
-2.251679, -1.089113, -1.255951, 0, 0, 0, 1, 1,
-2.235591, -1.46171, -1.657566, 1, 1, 1, 1, 1,
-2.182068, -0.4716819, -0.9923466, 1, 1, 1, 1, 1,
-2.162526, 0.2070865, -2.202497, 1, 1, 1, 1, 1,
-2.136135, 1.564623, -0.3801192, 1, 1, 1, 1, 1,
-2.110348, -0.8740467, -2.004303, 1, 1, 1, 1, 1,
-2.110221, 0.79856, -0.2899724, 1, 1, 1, 1, 1,
-2.100244, -1.511198, -2.740525, 1, 1, 1, 1, 1,
-2.0767, 0.8859896, -0.2999913, 1, 1, 1, 1, 1,
-2.074443, -0.05139013, -1.416702, 1, 1, 1, 1, 1,
-2.072494, -0.3692459, -1.75547, 1, 1, 1, 1, 1,
-2.071436, -0.2521249, -2.59763, 1, 1, 1, 1, 1,
-2.03685, 0.2681741, -1.863769, 1, 1, 1, 1, 1,
-1.976893, 1.658342, -1.583247, 1, 1, 1, 1, 1,
-1.971969, -1.209632, -3.780221, 1, 1, 1, 1, 1,
-1.968174, 0.4027551, -2.314063, 1, 1, 1, 1, 1,
-1.967106, 1.012891, -1.019025, 0, 0, 1, 1, 1,
-1.96319, 0.9071553, -1.910662, 1, 0, 0, 1, 1,
-1.954939, 0.301403, -0.7681808, 1, 0, 0, 1, 1,
-1.923708, -2.915465, -3.253762, 1, 0, 0, 1, 1,
-1.914674, 0.8467157, -1.151198, 1, 0, 0, 1, 1,
-1.913521, -0.3116575, -2.097119, 1, 0, 0, 1, 1,
-1.891129, 0.2246203, -1.15362, 0, 0, 0, 1, 1,
-1.873301, 0.7897104, -2.508254, 0, 0, 0, 1, 1,
-1.854356, 0.1050131, -2.192544, 0, 0, 0, 1, 1,
-1.8541, -0.3520468, -1.753328, 0, 0, 0, 1, 1,
-1.850859, -1.878313, -4.39797, 0, 0, 0, 1, 1,
-1.848014, 0.1371916, -0.5873181, 0, 0, 0, 1, 1,
-1.846284, 1.973972, -0.5916286, 0, 0, 0, 1, 1,
-1.831411, -0.5224816, -1.876161, 1, 1, 1, 1, 1,
-1.828089, -3.149476, -1.639341, 1, 1, 1, 1, 1,
-1.826927, 1.29962, -1.176576, 1, 1, 1, 1, 1,
-1.823966, -0.5960274, -2.074491, 1, 1, 1, 1, 1,
-1.791295, 0.3144641, -0.6907439, 1, 1, 1, 1, 1,
-1.789606, 1.489251, -0.04043349, 1, 1, 1, 1, 1,
-1.788279, -2.282851, -2.342104, 1, 1, 1, 1, 1,
-1.787553, -0.2916362, -2.871325, 1, 1, 1, 1, 1,
-1.768187, 1.00957, -2.480767, 1, 1, 1, 1, 1,
-1.761665, 0.8574109, -2.351504, 1, 1, 1, 1, 1,
-1.761449, 1.337306, 0.9225842, 1, 1, 1, 1, 1,
-1.747561, -1.097043, -2.629099, 1, 1, 1, 1, 1,
-1.745154, -0.958023, -2.677109, 1, 1, 1, 1, 1,
-1.74512, -0.4984769, -2.140842, 1, 1, 1, 1, 1,
-1.738898, 2.321132, -1.077702, 1, 1, 1, 1, 1,
-1.705283, 0.5797246, 0.3951641, 0, 0, 1, 1, 1,
-1.701058, 1.772466, -1.510139, 1, 0, 0, 1, 1,
-1.691018, -0.02841049, -2.953954, 1, 0, 0, 1, 1,
-1.684298, -1.701952, -0.3702677, 1, 0, 0, 1, 1,
-1.681048, -1.044424, -4.681593, 1, 0, 0, 1, 1,
-1.665511, 0.479587, -0.02325464, 1, 0, 0, 1, 1,
-1.665262, 0.8710294, -1.779007, 0, 0, 0, 1, 1,
-1.651809, 1.888391, -0.5691998, 0, 0, 0, 1, 1,
-1.649064, 0.5530443, -0.9788076, 0, 0, 0, 1, 1,
-1.619811, 0.1585481, -1.399849, 0, 0, 0, 1, 1,
-1.605967, 0.6301168, 0.3375235, 0, 0, 0, 1, 1,
-1.598116, -0.4623414, -0.7038968, 0, 0, 0, 1, 1,
-1.594896, -0.827757, -2.370225, 0, 0, 0, 1, 1,
-1.582085, 0.4228483, -0.6752774, 1, 1, 1, 1, 1,
-1.573232, 0.7877126, -0.1499008, 1, 1, 1, 1, 1,
-1.560727, -1.028827, -1.357919, 1, 1, 1, 1, 1,
-1.554765, -0.7633573, -1.913271, 1, 1, 1, 1, 1,
-1.550893, -0.7376525, -4.022727, 1, 1, 1, 1, 1,
-1.544907, -0.9921581, -3.390085, 1, 1, 1, 1, 1,
-1.533788, 0.07287037, -2.095187, 1, 1, 1, 1, 1,
-1.518805, 1.81719, -0.6533608, 1, 1, 1, 1, 1,
-1.516234, -0.2913948, -1.965513, 1, 1, 1, 1, 1,
-1.496856, 0.1723054, -2.277092, 1, 1, 1, 1, 1,
-1.467509, 0.3587823, -2.667608, 1, 1, 1, 1, 1,
-1.462394, 0.8967308, -0.4977577, 1, 1, 1, 1, 1,
-1.451518, 0.4597494, -2.620501, 1, 1, 1, 1, 1,
-1.447782, 0.5870453, -1.292307, 1, 1, 1, 1, 1,
-1.446154, -0.510578, -1.947844, 1, 1, 1, 1, 1,
-1.427431, -0.3481785, -1.292345, 0, 0, 1, 1, 1,
-1.424299, 0.9700555, -0.3458293, 1, 0, 0, 1, 1,
-1.406729, 0.3729257, -1.584402, 1, 0, 0, 1, 1,
-1.398596, -0.0246534, -0.02768246, 1, 0, 0, 1, 1,
-1.394996, 1.231398, -1.323486, 1, 0, 0, 1, 1,
-1.385057, -1.010172, -3.285787, 1, 0, 0, 1, 1,
-1.383867, -0.234837, -2.929974, 0, 0, 0, 1, 1,
-1.372451, -0.9427966, -3.25049, 0, 0, 0, 1, 1,
-1.360127, 0.1675419, -0.2170481, 0, 0, 0, 1, 1,
-1.359071, 0.5593683, -0.07298881, 0, 0, 0, 1, 1,
-1.348064, 1.069532, 0.2146289, 0, 0, 0, 1, 1,
-1.347733, 0.3469497, -2.77348, 0, 0, 0, 1, 1,
-1.345549, 1.499422, 0.8082733, 0, 0, 0, 1, 1,
-1.343889, -0.5660493, -3.055861, 1, 1, 1, 1, 1,
-1.343527, -0.9654199, -2.23296, 1, 1, 1, 1, 1,
-1.339185, -0.314133, -2.911019, 1, 1, 1, 1, 1,
-1.335769, -0.8645424, -2.300403, 1, 1, 1, 1, 1,
-1.335585, 1.530822, -0.07606626, 1, 1, 1, 1, 1,
-1.334821, 0.1970372, -1.974351, 1, 1, 1, 1, 1,
-1.323754, -0.07241418, -1.937961, 1, 1, 1, 1, 1,
-1.320451, 0.5467644, -1.742624, 1, 1, 1, 1, 1,
-1.318884, 2.073982, -1.465809, 1, 1, 1, 1, 1,
-1.318863, -0.8308854, -3.171658, 1, 1, 1, 1, 1,
-1.31648, 0.200186, -1.172167, 1, 1, 1, 1, 1,
-1.314173, -0.2432468, -1.30717, 1, 1, 1, 1, 1,
-1.310335, -0.01658082, -1.741931, 1, 1, 1, 1, 1,
-1.309615, -2.141755, -3.381885, 1, 1, 1, 1, 1,
-1.304378, 0.4460967, -1.258858, 1, 1, 1, 1, 1,
-1.301289, 1.200723, -0.01407181, 0, 0, 1, 1, 1,
-1.29513, -1.126891, -4.186569, 1, 0, 0, 1, 1,
-1.294874, -0.6884507, -1.123369, 1, 0, 0, 1, 1,
-1.292115, -1.150434, 0.2698002, 1, 0, 0, 1, 1,
-1.289558, 0.5009348, -1.525284, 1, 0, 0, 1, 1,
-1.278605, 0.829668, -0.7325759, 1, 0, 0, 1, 1,
-1.277904, 0.9422396, 1.702163, 0, 0, 0, 1, 1,
-1.262188, -1.12081, -2.11081, 0, 0, 0, 1, 1,
-1.260241, -0.1784671, -1.236664, 0, 0, 0, 1, 1,
-1.258046, 0.6047327, -1.65688, 0, 0, 0, 1, 1,
-1.257787, -1.218825, -2.611789, 0, 0, 0, 1, 1,
-1.254771, -1.386401, -2.187091, 0, 0, 0, 1, 1,
-1.247095, 1.17474, -0.5458875, 0, 0, 0, 1, 1,
-1.24463, 0.4836283, -0.876934, 1, 1, 1, 1, 1,
-1.23864, -2.297616, -2.188705, 1, 1, 1, 1, 1,
-1.236205, 0.5744156, -2.046946, 1, 1, 1, 1, 1,
-1.22391, -0.2810107, -1.32758, 1, 1, 1, 1, 1,
-1.223343, 2.388132, -0.5373344, 1, 1, 1, 1, 1,
-1.21618, 0.1671131, -3.227139, 1, 1, 1, 1, 1,
-1.206595, 1.089284, 0.0520553, 1, 1, 1, 1, 1,
-1.203153, -0.5579255, -1.5736, 1, 1, 1, 1, 1,
-1.199954, 1.026497, -1.350003, 1, 1, 1, 1, 1,
-1.199799, -0.4492121, -1.802967, 1, 1, 1, 1, 1,
-1.199224, 0.4475905, -0.6149603, 1, 1, 1, 1, 1,
-1.194685, -0.05386996, -2.262698, 1, 1, 1, 1, 1,
-1.184703, -0.573772, -2.971455, 1, 1, 1, 1, 1,
-1.184356, 1.149139, 0.3893039, 1, 1, 1, 1, 1,
-1.182661, 0.3515958, -2.234833, 1, 1, 1, 1, 1,
-1.180895, 0.8219516, -1.578942, 0, 0, 1, 1, 1,
-1.17924, -0.183422, -0.1310727, 1, 0, 0, 1, 1,
-1.164025, 2.772821, 0.9415323, 1, 0, 0, 1, 1,
-1.161438, -0.5733552, -1.574107, 1, 0, 0, 1, 1,
-1.14982, 0.3993245, -0.2404993, 1, 0, 0, 1, 1,
-1.147174, -0.9273444, -1.914981, 1, 0, 0, 1, 1,
-1.14599, 0.8835385, -0.7349824, 0, 0, 0, 1, 1,
-1.144684, 1.340327, -1.408889, 0, 0, 0, 1, 1,
-1.140706, 0.9833428, -1.773958, 0, 0, 0, 1, 1,
-1.136343, -0.6086318, -4.168851, 0, 0, 0, 1, 1,
-1.131555, 2.131979, 0.8262367, 0, 0, 0, 1, 1,
-1.128254, 0.6674264, 0.8428705, 0, 0, 0, 1, 1,
-1.117624, -1.517954, -3.187052, 0, 0, 0, 1, 1,
-1.114213, 2.444729, 0.6025604, 1, 1, 1, 1, 1,
-1.11254, 0.04789457, -3.207114, 1, 1, 1, 1, 1,
-1.111527, 0.2057222, -0.1900731, 1, 1, 1, 1, 1,
-1.10915, 0.2720398, -0.6727233, 1, 1, 1, 1, 1,
-1.104186, 1.004443, -1.554801, 1, 1, 1, 1, 1,
-1.096643, 3.23783, 0.7230377, 1, 1, 1, 1, 1,
-1.091636, -1.741311, -5.259252, 1, 1, 1, 1, 1,
-1.084437, -0.7085994, -2.353749, 1, 1, 1, 1, 1,
-1.079238, -0.6876239, -1.623251, 1, 1, 1, 1, 1,
-1.077152, 1.971056, -1.420646, 1, 1, 1, 1, 1,
-1.068424, 0.1206174, -0.228109, 1, 1, 1, 1, 1,
-1.065928, -0.7004243, -1.518301, 1, 1, 1, 1, 1,
-1.060267, -1.888844, -3.171255, 1, 1, 1, 1, 1,
-1.053133, -0.1001149, -0.4350712, 1, 1, 1, 1, 1,
-1.05081, -0.3972411, -3.856408, 1, 1, 1, 1, 1,
-1.047891, -0.8481245, -2.305761, 0, 0, 1, 1, 1,
-1.036732, -2.054357, -2.614191, 1, 0, 0, 1, 1,
-1.035302, 2.486912, -1.008274, 1, 0, 0, 1, 1,
-1.031325, -0.09445339, -2.534142, 1, 0, 0, 1, 1,
-1.018848, -0.9261909, -1.537726, 1, 0, 0, 1, 1,
-1.011518, 1.912452, 0.7530254, 1, 0, 0, 1, 1,
-1.005893, -0.03027205, -3.364327, 0, 0, 0, 1, 1,
-1.005634, -0.5677156, -1.042268, 0, 0, 0, 1, 1,
-1.002723, 1.190933, -1.124648, 0, 0, 0, 1, 1,
-0.9925202, -0.8020325, -1.991344, 0, 0, 0, 1, 1,
-0.9890822, -0.3845032, -1.091482, 0, 0, 0, 1, 1,
-0.9888887, -0.2386776, -1.308569, 0, 0, 0, 1, 1,
-0.9792991, 0.1322763, -1.434185, 0, 0, 0, 1, 1,
-0.9688883, 0.6208577, -2.618688, 1, 1, 1, 1, 1,
-0.963457, -0.7470593, -1.539946, 1, 1, 1, 1, 1,
-0.9559673, -0.1722235, -2.229151, 1, 1, 1, 1, 1,
-0.9528791, -1.885772, -2.960939, 1, 1, 1, 1, 1,
-0.9524112, 0.4715773, -1.745768, 1, 1, 1, 1, 1,
-0.952343, 0.2232056, -1.313045, 1, 1, 1, 1, 1,
-0.940631, -0.184877, -2.016718, 1, 1, 1, 1, 1,
-0.9338201, -0.709219, -1.871148, 1, 1, 1, 1, 1,
-0.9330046, 1.202317, 0.2012853, 1, 1, 1, 1, 1,
-0.9275612, -1.373869, -3.376353, 1, 1, 1, 1, 1,
-0.9259628, 0.749348, -0.9600201, 1, 1, 1, 1, 1,
-0.9223787, 0.0929937, 0.1096135, 1, 1, 1, 1, 1,
-0.9216837, 1.714659, 2.167042, 1, 1, 1, 1, 1,
-0.9216251, 1.155257, -1.006163, 1, 1, 1, 1, 1,
-0.9141006, 1.061291, -0.8639644, 1, 1, 1, 1, 1,
-0.9134947, -0.102425, -1.09704, 0, 0, 1, 1, 1,
-0.9116278, 0.1245178, 0.3745049, 1, 0, 0, 1, 1,
-0.8968915, -0.211706, -1.067949, 1, 0, 0, 1, 1,
-0.882766, -2.367259, -1.991829, 1, 0, 0, 1, 1,
-0.8792447, -0.5468785, -1.178718, 1, 0, 0, 1, 1,
-0.8763823, -0.0604339, -1.092164, 1, 0, 0, 1, 1,
-0.8722636, -0.2103098, -1.932092, 0, 0, 0, 1, 1,
-0.8709821, 0.2258965, 0.1069319, 0, 0, 0, 1, 1,
-0.8701388, -0.5446648, -1.550308, 0, 0, 0, 1, 1,
-0.8631541, -0.4391061, -1.598578, 0, 0, 0, 1, 1,
-0.8621817, -0.6457823, -3.563001, 0, 0, 0, 1, 1,
-0.8611407, -0.3008073, -1.676954, 0, 0, 0, 1, 1,
-0.8598778, 0.02983311, -2.130953, 0, 0, 0, 1, 1,
-0.8588896, -1.299721, -2.406498, 1, 1, 1, 1, 1,
-0.8362519, -0.5761839, -1.345249, 1, 1, 1, 1, 1,
-0.8222765, 0.4083188, -1.890611, 1, 1, 1, 1, 1,
-0.8211576, -0.7508619, -1.791218, 1, 1, 1, 1, 1,
-0.8202874, -0.9281676, -1.227121, 1, 1, 1, 1, 1,
-0.8188908, 0.543876, -2.677297, 1, 1, 1, 1, 1,
-0.8118195, 1.903747, -2.102841, 1, 1, 1, 1, 1,
-0.8033593, 0.9810753, 0.161292, 1, 1, 1, 1, 1,
-0.8011793, -0.8013015, -1.522144, 1, 1, 1, 1, 1,
-0.8008792, 0.5194224, -2.224101, 1, 1, 1, 1, 1,
-0.7959567, -1.070289, -0.3194784, 1, 1, 1, 1, 1,
-0.795172, -1.322108, -0.2606015, 1, 1, 1, 1, 1,
-0.7937161, -0.2280121, -1.883603, 1, 1, 1, 1, 1,
-0.7922474, 1.030694, -1.326024, 1, 1, 1, 1, 1,
-0.7863352, 1.362399, -0.5076889, 1, 1, 1, 1, 1,
-0.7799829, -0.05769721, -1.76998, 0, 0, 1, 1, 1,
-0.7774085, 0.6618727, 0.391445, 1, 0, 0, 1, 1,
-0.7694637, -0.007780312, 0.5002295, 1, 0, 0, 1, 1,
-0.7687667, -1.026199, -1.135713, 1, 0, 0, 1, 1,
-0.7663651, 0.2205447, -1.164394, 1, 0, 0, 1, 1,
-0.7662702, -1.195949, -3.67184, 1, 0, 0, 1, 1,
-0.7659387, 0.2154361, -1.573851, 0, 0, 0, 1, 1,
-0.7626722, 0.4911207, -1.86879, 0, 0, 0, 1, 1,
-0.7602112, -0.02885442, -1.605285, 0, 0, 0, 1, 1,
-0.7595317, -0.09562183, -1.870847, 0, 0, 0, 1, 1,
-0.7588707, -0.9443962, -2.945212, 0, 0, 0, 1, 1,
-0.7588635, -0.3562186, -1.076509, 0, 0, 0, 1, 1,
-0.7563657, 0.87293, -1.245029, 0, 0, 0, 1, 1,
-0.7561997, -0.9011142, -1.887666, 1, 1, 1, 1, 1,
-0.7558028, -0.08588164, -2.329535, 1, 1, 1, 1, 1,
-0.7549195, 0.1756886, 0.2520291, 1, 1, 1, 1, 1,
-0.7533062, -0.3170986, -1.708661, 1, 1, 1, 1, 1,
-0.7527696, -1.210939, -1.500407, 1, 1, 1, 1, 1,
-0.745867, -1.570872, -2.732776, 1, 1, 1, 1, 1,
-0.7389584, 0.3140323, -0.5596007, 1, 1, 1, 1, 1,
-0.7358726, -0.08871827, -2.359848, 1, 1, 1, 1, 1,
-0.7303836, 0.1300853, -1.868217, 1, 1, 1, 1, 1,
-0.7265401, 0.9998305, 0.5450396, 1, 1, 1, 1, 1,
-0.7246351, 1.693364, -0.3586193, 1, 1, 1, 1, 1,
-0.7230348, 1.521922, -0.5271583, 1, 1, 1, 1, 1,
-0.7195048, -0.3282579, -1.988805, 1, 1, 1, 1, 1,
-0.7096415, -0.3000588, -2.050936, 1, 1, 1, 1, 1,
-0.7084558, -2.031986, -3.503632, 1, 1, 1, 1, 1,
-0.6976252, -1.158833, -2.383664, 0, 0, 1, 1, 1,
-0.6970029, 0.1941737, -0.4906607, 1, 0, 0, 1, 1,
-0.6969207, 0.8618107, -0.07773034, 1, 0, 0, 1, 1,
-0.6930182, 0.2371062, -0.9826759, 1, 0, 0, 1, 1,
-0.6923032, 0.4701886, -3.495892, 1, 0, 0, 1, 1,
-0.6918331, 0.2591686, -1.161022, 1, 0, 0, 1, 1,
-0.6900663, 0.04544865, -3.184575, 0, 0, 0, 1, 1,
-0.685353, 0.2799517, -0.4464923, 0, 0, 0, 1, 1,
-0.681586, 0.1070918, -2.321903, 0, 0, 0, 1, 1,
-0.6789668, -1.493952, -2.378437, 0, 0, 0, 1, 1,
-0.6766152, 0.4154212, -2.48026, 0, 0, 0, 1, 1,
-0.6750358, -0.01268393, -1.553012, 0, 0, 0, 1, 1,
-0.6733428, 1.879404, -1.084127, 0, 0, 0, 1, 1,
-0.6704253, -0.9049709, -2.295701, 1, 1, 1, 1, 1,
-0.6699193, -0.9219601, -2.31624, 1, 1, 1, 1, 1,
-0.6682158, -1.050496, -1.927946, 1, 1, 1, 1, 1,
-0.6654028, -2.363356, -2.731307, 1, 1, 1, 1, 1,
-0.6636249, -0.4539891, -5.407427, 1, 1, 1, 1, 1,
-0.6612854, 2.476343, 0.8512025, 1, 1, 1, 1, 1,
-0.6566519, -2.462878, -3.123477, 1, 1, 1, 1, 1,
-0.6561253, -1.495363, -1.930614, 1, 1, 1, 1, 1,
-0.6538771, 0.1666332, -2.674707, 1, 1, 1, 1, 1,
-0.6516821, 1.369655, 0.4295539, 1, 1, 1, 1, 1,
-0.6506636, 0.2050736, -0.5301929, 1, 1, 1, 1, 1,
-0.6431625, -1.185393, -2.608015, 1, 1, 1, 1, 1,
-0.6404461, -1.099618, -3.021794, 1, 1, 1, 1, 1,
-0.6382001, 0.2575426, -1.151906, 1, 1, 1, 1, 1,
-0.6371961, -0.6466123, -1.075747, 1, 1, 1, 1, 1,
-0.6319119, -1.333275, -2.677735, 0, 0, 1, 1, 1,
-0.6298385, 0.2569074, -2.025865, 1, 0, 0, 1, 1,
-0.6280012, 0.5826402, -2.349179, 1, 0, 0, 1, 1,
-0.6222758, -0.7739941, -2.13944, 1, 0, 0, 1, 1,
-0.6197432, 1.025412, -0.7430702, 1, 0, 0, 1, 1,
-0.6177562, 0.4378864, -2.509759, 1, 0, 0, 1, 1,
-0.6156113, -0.8352826, -2.258718, 0, 0, 0, 1, 1,
-0.6147489, 0.2241015, 0.226155, 0, 0, 0, 1, 1,
-0.6107947, -0.6739914, -3.290307, 0, 0, 0, 1, 1,
-0.6047896, 0.4596014, -1.912675, 0, 0, 0, 1, 1,
-0.6036764, 0.03368456, -1.924347, 0, 0, 0, 1, 1,
-0.5995504, 1.519516, -0.6663978, 0, 0, 0, 1, 1,
-0.5988827, 0.8771943, -0.3422444, 0, 0, 0, 1, 1,
-0.5980263, 0.145033, -2.107754, 1, 1, 1, 1, 1,
-0.5959225, -1.186843, -3.51174, 1, 1, 1, 1, 1,
-0.5952284, -0.5478485, -2.298552, 1, 1, 1, 1, 1,
-0.5951739, -0.6027456, -3.328677, 1, 1, 1, 1, 1,
-0.5947095, 0.3941284, -0.5108159, 1, 1, 1, 1, 1,
-0.5945449, -1.245974, -1.973533, 1, 1, 1, 1, 1,
-0.5886544, -0.4455664, -1.681108, 1, 1, 1, 1, 1,
-0.5878585, -0.860593, -3.383734, 1, 1, 1, 1, 1,
-0.5866798, 1.497918, -0.668671, 1, 1, 1, 1, 1,
-0.5812998, -0.411672, -2.3547, 1, 1, 1, 1, 1,
-0.5772665, -0.4089292, -2.192555, 1, 1, 1, 1, 1,
-0.5723389, -0.2172416, -2.524737, 1, 1, 1, 1, 1,
-0.5700027, -0.1517253, -1.425001, 1, 1, 1, 1, 1,
-0.5675945, -0.8064919, -1.68678, 1, 1, 1, 1, 1,
-0.5616897, -1.186633, -3.351576, 1, 1, 1, 1, 1,
-0.555233, 0.5283877, 1.226254, 0, 0, 1, 1, 1,
-0.5532826, -0.09839099, 0.1547763, 1, 0, 0, 1, 1,
-0.5491483, 1.361015, -1.012753, 1, 0, 0, 1, 1,
-0.5477681, 1.276972, -1.482966, 1, 0, 0, 1, 1,
-0.5426124, 1.407584, 0.1311455, 1, 0, 0, 1, 1,
-0.5379872, 0.2651579, -0.9166225, 1, 0, 0, 1, 1,
-0.5332435, -1.285638, -0.243737, 0, 0, 0, 1, 1,
-0.5220816, -0.6220234, -0.9469413, 0, 0, 0, 1, 1,
-0.522026, 0.3258636, 0.8910032, 0, 0, 0, 1, 1,
-0.5191272, 0.1956144, -0.7907027, 0, 0, 0, 1, 1,
-0.5170964, 0.872871, -0.6079285, 0, 0, 0, 1, 1,
-0.5130407, 0.2906091, 0.1278025, 0, 0, 0, 1, 1,
-0.511733, 2.043012, -1.615861, 0, 0, 0, 1, 1,
-0.5111854, 0.3482459, -0.3296519, 1, 1, 1, 1, 1,
-0.5109689, 0.5970572, -0.1610845, 1, 1, 1, 1, 1,
-0.5089958, -1.422296, -4.092086, 1, 1, 1, 1, 1,
-0.5060552, 0.080654, -1.591953, 1, 1, 1, 1, 1,
-0.5056312, -0.9256187, -3.394442, 1, 1, 1, 1, 1,
-0.5053486, -1.695822, -3.816256, 1, 1, 1, 1, 1,
-0.4985149, 0.2363482, -1.233053, 1, 1, 1, 1, 1,
-0.4978462, -1.448315, -2.579053, 1, 1, 1, 1, 1,
-0.4944135, -0.9895526, -3.455066, 1, 1, 1, 1, 1,
-0.4940917, -2.25924, -3.01139, 1, 1, 1, 1, 1,
-0.4883292, 1.034612, -0.8072852, 1, 1, 1, 1, 1,
-0.4782693, -0.695345, -3.735762, 1, 1, 1, 1, 1,
-0.4781891, 1.346174, -0.5154465, 1, 1, 1, 1, 1,
-0.4779228, 1.510157, 0.04638083, 1, 1, 1, 1, 1,
-0.4762863, 0.2047517, -2.484621, 1, 1, 1, 1, 1,
-0.4740793, -0.5445924, -3.853203, 0, 0, 1, 1, 1,
-0.472989, 0.3187372, -1.116483, 1, 0, 0, 1, 1,
-0.4718836, -0.3206669, -1.226358, 1, 0, 0, 1, 1,
-0.4716932, 0.7209311, -2.031856, 1, 0, 0, 1, 1,
-0.4715734, 0.9544977, -1.110365, 1, 0, 0, 1, 1,
-0.4682902, 1.080735, -2.104254, 1, 0, 0, 1, 1,
-0.4665526, 2.058238, -0.6788336, 0, 0, 0, 1, 1,
-0.4652201, -0.09069692, -0.1623661, 0, 0, 0, 1, 1,
-0.4629273, -0.8139837, -1.63868, 0, 0, 0, 1, 1,
-0.4594399, 0.6885109, 0.7900811, 0, 0, 0, 1, 1,
-0.4591053, -0.8824875, -2.025843, 0, 0, 0, 1, 1,
-0.4581102, -1.739751, -3.558027, 0, 0, 0, 1, 1,
-0.4567112, 0.5648367, -0.3935176, 0, 0, 0, 1, 1,
-0.4552711, -0.2315388, -2.802085, 1, 1, 1, 1, 1,
-0.4541921, -1.096289, -3.594588, 1, 1, 1, 1, 1,
-0.4518414, -0.5608236, -1.683247, 1, 1, 1, 1, 1,
-0.4499166, 0.4296808, -0.5138601, 1, 1, 1, 1, 1,
-0.4432218, -1.395981, -4.854255, 1, 1, 1, 1, 1,
-0.4381817, 2.523336, -1.297503, 1, 1, 1, 1, 1,
-0.4379441, -0.03418146, -1.689422, 1, 1, 1, 1, 1,
-0.4358483, 0.3344222, -1.925552, 1, 1, 1, 1, 1,
-0.4356663, -0.01680075, -1.024158, 1, 1, 1, 1, 1,
-0.4333708, -0.1215368, -2.26786, 1, 1, 1, 1, 1,
-0.4309025, 0.3482488, 0.126243, 1, 1, 1, 1, 1,
-0.4280866, 1.939729, -0.7492982, 1, 1, 1, 1, 1,
-0.4250652, 0.03757975, 0.254885, 1, 1, 1, 1, 1,
-0.4245205, 1.707642, -1.802108, 1, 1, 1, 1, 1,
-0.4206416, 0.822617, -1.473245, 1, 1, 1, 1, 1,
-0.4183836, 0.1546573, -1.454092, 0, 0, 1, 1, 1,
-0.4171354, 0.322362, -0.1058866, 1, 0, 0, 1, 1,
-0.4161739, -0.04909622, -3.203214, 1, 0, 0, 1, 1,
-0.4045848, 0.3725049, -0.2843445, 1, 0, 0, 1, 1,
-0.4013323, -1.174051, -3.432718, 1, 0, 0, 1, 1,
-0.4007801, 1.104989, -0.3695806, 1, 0, 0, 1, 1,
-0.3996335, -0.4533862, -0.4795237, 0, 0, 0, 1, 1,
-0.3926495, -0.007147749, -1.483155, 0, 0, 0, 1, 1,
-0.3906128, 1.39715, -1.452787, 0, 0, 0, 1, 1,
-0.3876835, -0.2460055, -3.376732, 0, 0, 0, 1, 1,
-0.3876664, 1.360722, -0.0297944, 0, 0, 0, 1, 1,
-0.3858894, -0.1054466, -2.08076, 0, 0, 0, 1, 1,
-0.384028, -0.2956968, -2.224305, 0, 0, 0, 1, 1,
-0.3800951, -2.227993, -4.317218, 1, 1, 1, 1, 1,
-0.379595, -0.3110991, -4.490566, 1, 1, 1, 1, 1,
-0.3787405, -0.8898268, -3.161985, 1, 1, 1, 1, 1,
-0.3787108, 0.1267141, -0.7002718, 1, 1, 1, 1, 1,
-0.3771238, 0.4830746, 0.1927993, 1, 1, 1, 1, 1,
-0.3732647, -1.389641, -3.032278, 1, 1, 1, 1, 1,
-0.3725872, -0.7738293, -1.691704, 1, 1, 1, 1, 1,
-0.3724242, 1.55296, -0.7633706, 1, 1, 1, 1, 1,
-0.3620656, 2.013715, -0.3658682, 1, 1, 1, 1, 1,
-0.3615875, 0.4807979, -0.4212134, 1, 1, 1, 1, 1,
-0.3590766, 0.1106377, -1.090864, 1, 1, 1, 1, 1,
-0.3541267, 0.9944577, -0.4596165, 1, 1, 1, 1, 1,
-0.3514149, -0.6445606, -1.206668, 1, 1, 1, 1, 1,
-0.3458744, -0.6262982, -2.332908, 1, 1, 1, 1, 1,
-0.3416362, 0.04364671, -1.150925, 1, 1, 1, 1, 1,
-0.3391719, 0.8729559, -0.6000332, 0, 0, 1, 1, 1,
-0.3381718, 1.680729, -1.771466, 1, 0, 0, 1, 1,
-0.3379359, -0.3514706, -0.9326411, 1, 0, 0, 1, 1,
-0.3340394, -1.043477, -4.672802, 1, 0, 0, 1, 1,
-0.3319295, 1.820152, 0.05614724, 1, 0, 0, 1, 1,
-0.3310362, -1.554353, -2.904611, 1, 0, 0, 1, 1,
-0.3242742, -0.2329918, -1.240724, 0, 0, 0, 1, 1,
-0.3212889, 0.3425263, 0.2978466, 0, 0, 0, 1, 1,
-0.3164386, 0.8571044, 1.31627, 0, 0, 0, 1, 1,
-0.3149291, -1.133066, -1.776438, 0, 0, 0, 1, 1,
-0.3138587, 0.09550294, -2.34973, 0, 0, 0, 1, 1,
-0.3123868, 0.7387911, -2.024886, 0, 0, 0, 1, 1,
-0.3113697, 0.9865885, 0.3429495, 0, 0, 0, 1, 1,
-0.307505, -0.2524787, -2.224462, 1, 1, 1, 1, 1,
-0.3070653, -1.446411, -2.461619, 1, 1, 1, 1, 1,
-0.3038176, -1.6424, -5.352186, 1, 1, 1, 1, 1,
-0.3035702, 1.103529, -0.1685164, 1, 1, 1, 1, 1,
-0.3020444, 0.7738121, -0.4225703, 1, 1, 1, 1, 1,
-0.3016194, 0.7964715, 0.7028673, 1, 1, 1, 1, 1,
-0.3006446, 0.1784748, -0.1746393, 1, 1, 1, 1, 1,
-0.3005605, 0.5147495, -0.6855265, 1, 1, 1, 1, 1,
-0.2956254, -1.310351, -3.573056, 1, 1, 1, 1, 1,
-0.2923049, -0.9113137, -3.444452, 1, 1, 1, 1, 1,
-0.2871363, -0.9667046, -3.217365, 1, 1, 1, 1, 1,
-0.2849578, 0.3040792, -0.205168, 1, 1, 1, 1, 1,
-0.2804972, -0.3171157, -1.795202, 1, 1, 1, 1, 1,
-0.266968, 0.9214815, -1.83192, 1, 1, 1, 1, 1,
-0.2651125, 0.9655244, -1.676948, 1, 1, 1, 1, 1,
-0.2643527, 0.01127521, -2.291662, 0, 0, 1, 1, 1,
-0.2559783, 1.049239, -0.7120797, 1, 0, 0, 1, 1,
-0.2529828, -1.416152, -2.933482, 1, 0, 0, 1, 1,
-0.2509395, 0.3721546, -1.10638, 1, 0, 0, 1, 1,
-0.2492176, 0.3920773, -0.8197375, 1, 0, 0, 1, 1,
-0.2491945, 0.7667572, 0.02767775, 1, 0, 0, 1, 1,
-0.2491471, 0.09235469, -2.091977, 0, 0, 0, 1, 1,
-0.2478142, -1.135824, -3.171106, 0, 0, 0, 1, 1,
-0.2470911, 0.8565236, -1.34199, 0, 0, 0, 1, 1,
-0.2432098, -0.07330084, -0.4300458, 0, 0, 0, 1, 1,
-0.2411105, -0.6610972, -3.042734, 0, 0, 0, 1, 1,
-0.2387429, 1.153584, -0.8541046, 0, 0, 0, 1, 1,
-0.2314215, -0.2543374, -2.948566, 0, 0, 0, 1, 1,
-0.2313562, -0.3193276, -3.690535, 1, 1, 1, 1, 1,
-0.2285897, 0.2186995, -1.326425, 1, 1, 1, 1, 1,
-0.2227099, -0.3658224, -2.591943, 1, 1, 1, 1, 1,
-0.2213771, 0.9926834, 0.6241379, 1, 1, 1, 1, 1,
-0.2184701, -0.626581, -1.901182, 1, 1, 1, 1, 1,
-0.2183034, 0.262318, -0.5341925, 1, 1, 1, 1, 1,
-0.2181742, -0.8163917, -2.980965, 1, 1, 1, 1, 1,
-0.2170728, -1.773568, -3.729011, 1, 1, 1, 1, 1,
-0.2155959, 1.185465, -0.4096846, 1, 1, 1, 1, 1,
-0.212733, -0.8730386, -2.220288, 1, 1, 1, 1, 1,
-0.2078938, 0.8076511, -0.6775761, 1, 1, 1, 1, 1,
-0.2032094, -1.169636, -1.650405, 1, 1, 1, 1, 1,
-0.2016897, 0.4440817, 2.431624, 1, 1, 1, 1, 1,
-0.1949638, 1.603709, -2.611398, 1, 1, 1, 1, 1,
-0.1886481, -2.58764, -3.114836, 1, 1, 1, 1, 1,
-0.1877589, -0.08324257, -1.215615, 0, 0, 1, 1, 1,
-0.1874046, -0.3747406, -2.15504, 1, 0, 0, 1, 1,
-0.1868164, 0.5840151, -0.2159569, 1, 0, 0, 1, 1,
-0.1804646, 1.087376, -0.3169441, 1, 0, 0, 1, 1,
-0.1793399, -0.07487001, -2.813461, 1, 0, 0, 1, 1,
-0.1635757, 1.253856, 1.629519, 1, 0, 0, 1, 1,
-0.1596499, 0.8655623, -0.1810498, 0, 0, 0, 1, 1,
-0.1546288, -0.8170514, -3.865443, 0, 0, 0, 1, 1,
-0.1530133, 1.649675, 1.854698, 0, 0, 0, 1, 1,
-0.1511626, 2.022356, -0.09587374, 0, 0, 0, 1, 1,
-0.1511606, -1.250383, -3.354769, 0, 0, 0, 1, 1,
-0.150209, 0.135208, -1.313267, 0, 0, 0, 1, 1,
-0.1452297, 1.891142, 1.485396, 0, 0, 0, 1, 1,
-0.1431026, -0.36155, -1.75906, 1, 1, 1, 1, 1,
-0.1428084, 1.186012, -0.4857543, 1, 1, 1, 1, 1,
-0.1377296, 1.104248, -0.927493, 1, 1, 1, 1, 1,
-0.1368843, -1.556255, -2.822602, 1, 1, 1, 1, 1,
-0.1357803, 0.9642519, -0.8305129, 1, 1, 1, 1, 1,
-0.1354966, -2.424936, -4.844565, 1, 1, 1, 1, 1,
-0.1306087, -1.947206, -2.583759, 1, 1, 1, 1, 1,
-0.1273276, 0.888855, -1.700483, 1, 1, 1, 1, 1,
-0.1268929, -0.1268343, -2.457736, 1, 1, 1, 1, 1,
-0.1265382, 2.865896, 0.1202442, 1, 1, 1, 1, 1,
-0.1259594, 0.6914644, 0.07686545, 1, 1, 1, 1, 1,
-0.1222072, -1.2411, -2.41748, 1, 1, 1, 1, 1,
-0.1180364, -1.169994, -3.665499, 1, 1, 1, 1, 1,
-0.1173156, -1.398563, -2.074184, 1, 1, 1, 1, 1,
-0.1165344, -1.065318, -2.565961, 1, 1, 1, 1, 1,
-0.1157487, -0.2210046, -1.887904, 0, 0, 1, 1, 1,
-0.1150112, 0.9002541, -1.003665, 1, 0, 0, 1, 1,
-0.1103587, 0.4039372, 1.108669, 1, 0, 0, 1, 1,
-0.1096694, 1.009273, -1.194065, 1, 0, 0, 1, 1,
-0.1075759, 0.4755678, 2.825062, 1, 0, 0, 1, 1,
-0.0995487, 0.1438934, 0.567831, 1, 0, 0, 1, 1,
-0.09913176, -0.203501, -4.110466, 0, 0, 0, 1, 1,
-0.09092692, 1.533609, 0.07867578, 0, 0, 0, 1, 1,
-0.08176381, 0.7241954, 0.5096382, 0, 0, 0, 1, 1,
-0.079859, 2.542198, -0.6742892, 0, 0, 0, 1, 1,
-0.07951445, -0.1976275, -3.026844, 0, 0, 0, 1, 1,
-0.07627518, 0.8358094, 0.01251106, 0, 0, 0, 1, 1,
-0.07552042, 1.439863, -0.9441444, 0, 0, 0, 1, 1,
-0.07354686, 0.538828, -0.6097587, 1, 1, 1, 1, 1,
-0.07148333, 0.2491168, -0.1109084, 1, 1, 1, 1, 1,
-0.06631401, 0.1499542, -2.128746, 1, 1, 1, 1, 1,
-0.06628172, -0.2584587, -3.331911, 1, 1, 1, 1, 1,
-0.06490272, -1.475052, -3.219465, 1, 1, 1, 1, 1,
-0.06487618, -0.7579327, -1.967374, 1, 1, 1, 1, 1,
-0.06088625, 0.8684459, 1.453541, 1, 1, 1, 1, 1,
-0.06072759, -0.6452085, -4.119599, 1, 1, 1, 1, 1,
-0.05921057, -0.4591517, -2.10922, 1, 1, 1, 1, 1,
-0.05855798, -1.079639, -3.918042, 1, 1, 1, 1, 1,
-0.05443815, -1.144161, -3.114135, 1, 1, 1, 1, 1,
-0.0538478, -0.3824581, -3.458273, 1, 1, 1, 1, 1,
-0.05073628, -1.236233, -3.438931, 1, 1, 1, 1, 1,
-0.04858964, -1.789729, -0.8098673, 1, 1, 1, 1, 1,
-0.04616623, 0.4168638, -0.05169765, 1, 1, 1, 1, 1,
-0.04413313, -1.85807, -1.14746, 0, 0, 1, 1, 1,
-0.04238625, 0.2798355, 1.339747, 1, 0, 0, 1, 1,
-0.04029123, -0.03246523, -1.270545, 1, 0, 0, 1, 1,
-0.03216476, 1.971489, -1.281636, 1, 0, 0, 1, 1,
-0.0311745, 0.0308848, 0.9582557, 1, 0, 0, 1, 1,
-0.02656522, 1.381417, -1.571564, 1, 0, 0, 1, 1,
-0.02568224, 0.3087407, -0.4311922, 0, 0, 0, 1, 1,
-0.02368064, -0.2394282, -2.74105, 0, 0, 0, 1, 1,
-0.02110218, -0.303148, -1.898673, 0, 0, 0, 1, 1,
-0.02071349, -1.458985, -3.977009, 0, 0, 0, 1, 1,
-0.01979687, -0.4442516, -2.130262, 0, 0, 0, 1, 1,
-0.01963606, -0.0841004, -2.910249, 0, 0, 0, 1, 1,
-0.01606832, -0.4610024, -4.333224, 0, 0, 0, 1, 1,
-0.01306343, -0.9914798, -3.313616, 1, 1, 1, 1, 1,
-0.009145299, 0.6852047, 0.1554935, 1, 1, 1, 1, 1,
-0.007554301, -0.2014427, -3.810684, 1, 1, 1, 1, 1,
-0.005816409, -0.01506803, -2.999404, 1, 1, 1, 1, 1,
-0.004816612, -0.1478025, -2.731357, 1, 1, 1, 1, 1,
-0.002670108, 1.311156, 1.462001, 1, 1, 1, 1, 1,
-0.001070192, 0.5668377, 0.7193829, 1, 1, 1, 1, 1,
0.002886037, 1.209957, -0.9007749, 1, 1, 1, 1, 1,
0.006368708, -0.05633595, 2.309756, 1, 1, 1, 1, 1,
0.007599749, 0.06365718, 1.225204, 1, 1, 1, 1, 1,
0.008599252, -0.6333322, 1.899717, 1, 1, 1, 1, 1,
0.009431922, 0.4701409, 0.3368838, 1, 1, 1, 1, 1,
0.01070221, 0.9059518, -1.467877, 1, 1, 1, 1, 1,
0.01297809, -0.8483433, 2.395529, 1, 1, 1, 1, 1,
0.01913697, -0.02526799, 2.508717, 1, 1, 1, 1, 1,
0.02106219, 0.08784302, 0.4083138, 0, 0, 1, 1, 1,
0.02210309, 0.582597, 2.565614, 1, 0, 0, 1, 1,
0.02369827, -0.007543663, 2.231113, 1, 0, 0, 1, 1,
0.02645291, 0.4846009, 1.744681, 1, 0, 0, 1, 1,
0.02693065, -0.6180786, 3.11463, 1, 0, 0, 1, 1,
0.02828905, -0.1128465, 2.870313, 1, 0, 0, 1, 1,
0.02968905, -0.04472208, 2.454839, 0, 0, 0, 1, 1,
0.03132356, 0.0658296, 0.8199403, 0, 0, 0, 1, 1,
0.03214105, -0.1656199, 2.7513, 0, 0, 0, 1, 1,
0.03336174, -0.565669, 3.603112, 0, 0, 0, 1, 1,
0.03445886, -0.4895236, 4.133694, 0, 0, 0, 1, 1,
0.0355044, -0.6176202, 4.054152, 0, 0, 0, 1, 1,
0.04202445, -2.36851, 3.355921, 0, 0, 0, 1, 1,
0.04351671, -0.3172872, 3.174332, 1, 1, 1, 1, 1,
0.04449725, 0.5711204, -0.9748129, 1, 1, 1, 1, 1,
0.04578646, 1.287883, -1.757949, 1, 1, 1, 1, 1,
0.04603057, -1.584642, 2.103893, 1, 1, 1, 1, 1,
0.04665383, -0.5061395, 1.739262, 1, 1, 1, 1, 1,
0.05027078, -2.05207, 2.809523, 1, 1, 1, 1, 1,
0.05455213, 0.5619237, -0.3752348, 1, 1, 1, 1, 1,
0.05519996, -0.05008268, 1.620323, 1, 1, 1, 1, 1,
0.05599419, -0.2573442, 3.736716, 1, 1, 1, 1, 1,
0.06153591, 0.9797064, -1.189611, 1, 1, 1, 1, 1,
0.0722774, -0.9411193, 1.960822, 1, 1, 1, 1, 1,
0.07501832, -0.9973448, 2.444577, 1, 1, 1, 1, 1,
0.07567045, -0.2618847, 5.25699, 1, 1, 1, 1, 1,
0.07819346, 0.7662181, 0.3450876, 1, 1, 1, 1, 1,
0.08034833, 0.198136, 1.592301, 1, 1, 1, 1, 1,
0.0812002, 0.3989683, -1.472976, 0, 0, 1, 1, 1,
0.08205892, 0.02900809, 0.4115481, 1, 0, 0, 1, 1,
0.08211905, -0.725531, 2.478923, 1, 0, 0, 1, 1,
0.08343524, -0.1041178, 1.899502, 1, 0, 0, 1, 1,
0.08609404, -0.4828935, 4.152515, 1, 0, 0, 1, 1,
0.08740018, 0.3589173, -1.062417, 1, 0, 0, 1, 1,
0.08892582, -0.08295646, 2.232323, 0, 0, 0, 1, 1,
0.08914018, -0.7347616, 1.436792, 0, 0, 0, 1, 1,
0.09147867, -0.7269822, 4.542555, 0, 0, 0, 1, 1,
0.09247363, 1.336792, 0.6696277, 0, 0, 0, 1, 1,
0.0974795, -0.07587057, 3.93369, 0, 0, 0, 1, 1,
0.09870473, 0.6952248, 0.9769286, 0, 0, 0, 1, 1,
0.0991211, -0.5595703, 3.473519, 0, 0, 0, 1, 1,
0.09983271, -0.7903393, 2.597634, 1, 1, 1, 1, 1,
0.1010825, 1.077936, 0.7994881, 1, 1, 1, 1, 1,
0.1019522, 1.450618, 0.2177289, 1, 1, 1, 1, 1,
0.1038802, 0.8874496, 0.6487378, 1, 1, 1, 1, 1,
0.1045689, 0.2418496, -1.425852, 1, 1, 1, 1, 1,
0.1073089, 0.820077, 2.212083, 1, 1, 1, 1, 1,
0.1137109, 1.897554, 0.9645262, 1, 1, 1, 1, 1,
0.1151562, 0.6635509, 0.03355641, 1, 1, 1, 1, 1,
0.1181266, -1.005865, 2.791471, 1, 1, 1, 1, 1,
0.1190504, -0.7913824, 2.556379, 1, 1, 1, 1, 1,
0.123686, -1.328975, 4.899033, 1, 1, 1, 1, 1,
0.1244277, 1.061187, 2.491136, 1, 1, 1, 1, 1,
0.125131, 0.327408, -2.217788, 1, 1, 1, 1, 1,
0.1270123, 1.271664, -0.9390171, 1, 1, 1, 1, 1,
0.1291812, 0.9863061, 0.2325288, 1, 1, 1, 1, 1,
0.1324041, 0.5887607, 0.5051112, 0, 0, 1, 1, 1,
0.1330664, 0.03578985, 0.9780043, 1, 0, 0, 1, 1,
0.1338355, 0.3092929, -0.7034137, 1, 0, 0, 1, 1,
0.1366724, -0.2636405, 2.31771, 1, 0, 0, 1, 1,
0.1453593, -0.5234514, 2.543571, 1, 0, 0, 1, 1,
0.1480718, 0.01550558, -0.79184, 1, 0, 0, 1, 1,
0.1495367, 0.9566382, 0.2554892, 0, 0, 0, 1, 1,
0.1496963, -0.07451412, 1.655188, 0, 0, 0, 1, 1,
0.149868, 0.39549, 1.984609, 0, 0, 0, 1, 1,
0.1565518, -1.478456, 4.403355, 0, 0, 0, 1, 1,
0.1567649, -0.2660613, 3.854445, 0, 0, 0, 1, 1,
0.1608395, 0.5657865, -0.15798, 0, 0, 0, 1, 1,
0.1697299, 1.487872, 0.8122395, 0, 0, 0, 1, 1,
0.1795435, -1.568733, 4.873895, 1, 1, 1, 1, 1,
0.180313, 0.6378508, 1.420647, 1, 1, 1, 1, 1,
0.1803642, -0.2572394, 4.042377, 1, 1, 1, 1, 1,
0.1820865, 0.4281202, 2.00087, 1, 1, 1, 1, 1,
0.1877464, 0.08216348, -0.1743725, 1, 1, 1, 1, 1,
0.1879396, 0.7816806, 0.135312, 1, 1, 1, 1, 1,
0.1900726, -1.156134, 2.216674, 1, 1, 1, 1, 1,
0.194681, -1.103728, 4.532777, 1, 1, 1, 1, 1,
0.1958491, 1.269902, -0.5771245, 1, 1, 1, 1, 1,
0.2025291, 0.01001502, 1.901167, 1, 1, 1, 1, 1,
0.2032852, 1.107332, -0.7224557, 1, 1, 1, 1, 1,
0.206997, -0.433988, 2.987539, 1, 1, 1, 1, 1,
0.2154149, 1.303774, -0.7515497, 1, 1, 1, 1, 1,
0.2172056, -0.1070732, 3.649474, 1, 1, 1, 1, 1,
0.2193238, 0.744453, -0.01023217, 1, 1, 1, 1, 1,
0.2212747, -0.4367319, 3.255529, 0, 0, 1, 1, 1,
0.2255003, -0.690677, 1.31923, 1, 0, 0, 1, 1,
0.2280883, -0.03700534, 1.51975, 1, 0, 0, 1, 1,
0.228709, 1.870282, 1.751198, 1, 0, 0, 1, 1,
0.2299184, 1.392383, 0.5301994, 1, 0, 0, 1, 1,
0.2322749, -0.07800073, 2.632111, 1, 0, 0, 1, 1,
0.2335363, -0.8397967, 2.254334, 0, 0, 0, 1, 1,
0.2360257, 0.2083075, 3.661701, 0, 0, 0, 1, 1,
0.2369164, -0.7103171, 4.658044, 0, 0, 0, 1, 1,
0.242365, 2.350772, 0.03298995, 0, 0, 0, 1, 1,
0.2438153, -1.030194, 3.21231, 0, 0, 0, 1, 1,
0.2561374, 1.656124, 1.247599, 0, 0, 0, 1, 1,
0.2581332, -0.6539888, 2.395055, 0, 0, 0, 1, 1,
0.2619966, 0.1327348, 2.09434, 1, 1, 1, 1, 1,
0.2652451, -0.4931602, 0.8733412, 1, 1, 1, 1, 1,
0.267767, 0.2945327, 0.8167863, 1, 1, 1, 1, 1,
0.2721087, -0.4738275, 3.28757, 1, 1, 1, 1, 1,
0.2834078, 0.1989352, 1.624341, 1, 1, 1, 1, 1,
0.2843212, -0.8054879, 2.364779, 1, 1, 1, 1, 1,
0.2858259, -2.905502, 2.259349, 1, 1, 1, 1, 1,
0.2871146, -1.41288, 4.68975, 1, 1, 1, 1, 1,
0.2875395, -0.5669428, 0.8165972, 1, 1, 1, 1, 1,
0.2875969, 1.628425, 0.9873176, 1, 1, 1, 1, 1,
0.2886903, 0.06143601, 1.208459, 1, 1, 1, 1, 1,
0.2945807, -1.067201, 3.031354, 1, 1, 1, 1, 1,
0.2952916, -0.8999314, 0.5056615, 1, 1, 1, 1, 1,
0.2990879, -1.943198, 3.810627, 1, 1, 1, 1, 1,
0.3000268, -0.8147471, 3.127058, 1, 1, 1, 1, 1,
0.3036221, -0.7513483, 2.123266, 0, 0, 1, 1, 1,
0.3053879, -0.5136728, 2.300885, 1, 0, 0, 1, 1,
0.3076162, 0.8759062, 0.9950683, 1, 0, 0, 1, 1,
0.3087982, 0.5255914, -1.427131, 1, 0, 0, 1, 1,
0.3189891, -0.4481033, 4.372197, 1, 0, 0, 1, 1,
0.3201295, -1.589862, 0.4941688, 1, 0, 0, 1, 1,
0.3234301, -1.058189, 4.171484, 0, 0, 0, 1, 1,
0.3273153, -0.4168254, 4.417714, 0, 0, 0, 1, 1,
0.3301989, 1.09646, -1.170185, 0, 0, 0, 1, 1,
0.330643, -2.521993, 3.658318, 0, 0, 0, 1, 1,
0.3359464, -1.112821, 2.255541, 0, 0, 0, 1, 1,
0.344699, 0.484322, -0.7123787, 0, 0, 0, 1, 1,
0.3469154, -1.180349, 2.413916, 0, 0, 0, 1, 1,
0.3483738, -0.7494918, 2.922909, 1, 1, 1, 1, 1,
0.3507763, 0.4638264, 0.8324563, 1, 1, 1, 1, 1,
0.3526496, -1.639424, 1.862823, 1, 1, 1, 1, 1,
0.354726, -0.02308853, 0.09394363, 1, 1, 1, 1, 1,
0.3590757, 0.92683, 0.9236358, 1, 1, 1, 1, 1,
0.3644911, -0.2977619, 2.064395, 1, 1, 1, 1, 1,
0.3661519, 0.3111034, -0.3822114, 1, 1, 1, 1, 1,
0.3743947, -0.8188855, 2.760799, 1, 1, 1, 1, 1,
0.3766542, 2.606005, 0.2173325, 1, 1, 1, 1, 1,
0.3791264, -1.073395, 4.230695, 1, 1, 1, 1, 1,
0.3807351, -0.0395681, 2.715793, 1, 1, 1, 1, 1,
0.3809256, 1.519488, -1.155072, 1, 1, 1, 1, 1,
0.3811267, 0.3328618, 0.6530737, 1, 1, 1, 1, 1,
0.3838934, 0.8476686, 1.920118, 1, 1, 1, 1, 1,
0.3858573, -0.8767844, 2.973773, 1, 1, 1, 1, 1,
0.3902362, 0.3535248, 1.679004, 0, 0, 1, 1, 1,
0.3908048, -0.4913054, 2.654855, 1, 0, 0, 1, 1,
0.3965001, -0.6289928, 2.333405, 1, 0, 0, 1, 1,
0.3972042, 1.445247, 0.2703532, 1, 0, 0, 1, 1,
0.3981531, -1.012337, 2.79784, 1, 0, 0, 1, 1,
0.3983213, -2.35745, 3.530947, 1, 0, 0, 1, 1,
0.3984135, 0.1639296, 2.015022, 0, 0, 0, 1, 1,
0.3989977, -0.7854958, 3.45698, 0, 0, 0, 1, 1,
0.3997123, -0.07348271, 1.988573, 0, 0, 0, 1, 1,
0.4034211, 1.211616, -0.2893302, 0, 0, 0, 1, 1,
0.4071794, 1.578443, -0.6682967, 0, 0, 0, 1, 1,
0.4098427, -1.416705, 2.905169, 0, 0, 0, 1, 1,
0.4137723, -2.321549, 1.613304, 0, 0, 0, 1, 1,
0.418314, 0.4480462, 0.2577806, 1, 1, 1, 1, 1,
0.4220466, 1.114848, -0.7091482, 1, 1, 1, 1, 1,
0.4257171, -0.5841784, 2.112274, 1, 1, 1, 1, 1,
0.4269031, -1.296082, 2.83169, 1, 1, 1, 1, 1,
0.4319728, -2.54199, 2.734342, 1, 1, 1, 1, 1,
0.4326132, 1.477667, -1.172044, 1, 1, 1, 1, 1,
0.4326863, 0.2843502, 0.9646869, 1, 1, 1, 1, 1,
0.4388571, -0.9769834, 2.729867, 1, 1, 1, 1, 1,
0.4402328, 1.333144, 0.9691774, 1, 1, 1, 1, 1,
0.4406337, 0.1332523, 1.198481, 1, 1, 1, 1, 1,
0.4409216, -1.576704, 1.241784, 1, 1, 1, 1, 1,
0.4442986, 1.087858, 0.471523, 1, 1, 1, 1, 1,
0.4455433, -0.5980848, 3.189115, 1, 1, 1, 1, 1,
0.4502491, 1.176507, 0.6152777, 1, 1, 1, 1, 1,
0.4565655, -0.3727572, 4.192025, 1, 1, 1, 1, 1,
0.4598074, 0.588438, 1.752144, 0, 0, 1, 1, 1,
0.4646742, -0.6102183, 3.096972, 1, 0, 0, 1, 1,
0.4648017, 1.017432, 1.664844, 1, 0, 0, 1, 1,
0.4677756, -0.48161, 0.6779433, 1, 0, 0, 1, 1,
0.4713063, 1.596403, -0.5013249, 1, 0, 0, 1, 1,
0.4723046, -0.981965, 4.157609, 1, 0, 0, 1, 1,
0.4937221, -1.331231, 1.326711, 0, 0, 0, 1, 1,
0.4947892, -1.311192, 3.723349, 0, 0, 0, 1, 1,
0.5014796, 0.2701212, 1.700023, 0, 0, 0, 1, 1,
0.5051401, -0.7610148, 0.9320154, 0, 0, 0, 1, 1,
0.5067813, -0.6800265, 1.340871, 0, 0, 0, 1, 1,
0.5111455, -0.05784215, 2.111378, 0, 0, 0, 1, 1,
0.5115288, 1.205518, 2.794852, 0, 0, 0, 1, 1,
0.5143688, 0.638401, 1.502038, 1, 1, 1, 1, 1,
0.5147766, 1.042765, -0.007584293, 1, 1, 1, 1, 1,
0.520206, 0.1954564, 1.827924, 1, 1, 1, 1, 1,
0.5256118, -0.2325366, 1.729882, 1, 1, 1, 1, 1,
0.5260266, 1.188991, 1.060443, 1, 1, 1, 1, 1,
0.526484, -0.2915163, 1.563912, 1, 1, 1, 1, 1,
0.529269, 0.02691285, 1.797293, 1, 1, 1, 1, 1,
0.536998, -0.6523699, 3.21455, 1, 1, 1, 1, 1,
0.5406783, 0.732595, 0.8234095, 1, 1, 1, 1, 1,
0.5424887, 1.794543, -1.010877, 1, 1, 1, 1, 1,
0.5428399, 0.142509, 1.365798, 1, 1, 1, 1, 1,
0.5450994, -1.41658, 2.98723, 1, 1, 1, 1, 1,
0.5502229, -0.9204254, 2.098816, 1, 1, 1, 1, 1,
0.5502776, 2.856104, 0.07735441, 1, 1, 1, 1, 1,
0.5506833, -1.796881, 2.610027, 1, 1, 1, 1, 1,
0.5508809, 0.145226, 1.895233, 0, 0, 1, 1, 1,
0.5619149, 0.0407431, 0.7922044, 1, 0, 0, 1, 1,
0.56272, 0.9284844, 0.7913007, 1, 0, 0, 1, 1,
0.5663067, -0.7902959, 2.088399, 1, 0, 0, 1, 1,
0.5700198, 0.943978, 1.802283, 1, 0, 0, 1, 1,
0.5761016, 0.6612242, 0.5438101, 1, 0, 0, 1, 1,
0.5766314, 1.811286, 0.5237026, 0, 0, 0, 1, 1,
0.5840125, -1.382446, 2.815249, 0, 0, 0, 1, 1,
0.5893544, -0.3858495, 1.121649, 0, 0, 0, 1, 1,
0.5904217, 0.03807213, 0.5580229, 0, 0, 0, 1, 1,
0.5947115, -1.017787, 2.376461, 0, 0, 0, 1, 1,
0.5960047, 1.860044, 0.2784354, 0, 0, 0, 1, 1,
0.5965406, -2.060522, 2.040328, 0, 0, 0, 1, 1,
0.5980842, 1.685058, 0.1314846, 1, 1, 1, 1, 1,
0.6001858, 0.4005903, 0.5719275, 1, 1, 1, 1, 1,
0.6004745, -0.294555, 0.6943663, 1, 1, 1, 1, 1,
0.6015317, -0.9416483, 0.8959278, 1, 1, 1, 1, 1,
0.6062374, 0.5941029, 0.1617715, 1, 1, 1, 1, 1,
0.6073067, 1.074582, 1.321047, 1, 1, 1, 1, 1,
0.6078553, 0.06195292, 2.639094, 1, 1, 1, 1, 1,
0.6125647, -0.7889072, 1.985887, 1, 1, 1, 1, 1,
0.6130869, 0.002014102, 1.099624, 1, 1, 1, 1, 1,
0.6147705, 0.9349631, 2.393512, 1, 1, 1, 1, 1,
0.6161259, -0.5838341, 4.431502, 1, 1, 1, 1, 1,
0.6219482, -0.02889053, 2.013123, 1, 1, 1, 1, 1,
0.6220126, -0.3518095, 3.607329, 1, 1, 1, 1, 1,
0.6239007, 1.83894, -0.4414098, 1, 1, 1, 1, 1,
0.6264185, -0.7835518, 2.702844, 1, 1, 1, 1, 1,
0.6290016, -1.483233, 0.8142209, 0, 0, 1, 1, 1,
0.6416407, 0.09251767, 1.361786, 1, 0, 0, 1, 1,
0.6462055, -1.222378, 1.763895, 1, 0, 0, 1, 1,
0.648613, 0.008421957, 3.633554, 1, 0, 0, 1, 1,
0.6490446, -0.7544751, 1.983623, 1, 0, 0, 1, 1,
0.6589919, 1.465616, 1.134636, 1, 0, 0, 1, 1,
0.6592404, 0.1527805, 3.508144, 0, 0, 0, 1, 1,
0.6626028, -0.7719104, 3.251448, 0, 0, 0, 1, 1,
0.6658362, -0.8024292, 3.309083, 0, 0, 0, 1, 1,
0.6662591, -1.128877, 4.291123, 0, 0, 0, 1, 1,
0.6667304, -1.062483, 3.099742, 0, 0, 0, 1, 1,
0.6725008, -1.542636, 3.390785, 0, 0, 0, 1, 1,
0.6734384, -0.002811625, 1.429054, 0, 0, 0, 1, 1,
0.6753488, -0.1630091, 1.750577, 1, 1, 1, 1, 1,
0.6763245, 0.9801229, -0.216107, 1, 1, 1, 1, 1,
0.6783417, -0.5916772, 2.536601, 1, 1, 1, 1, 1,
0.6808816, 0.16154, 0.3493162, 1, 1, 1, 1, 1,
0.6821479, 0.2815746, 1.812719, 1, 1, 1, 1, 1,
0.6856853, -2.132898, 3.282688, 1, 1, 1, 1, 1,
0.6880862, 0.1411865, 1.145177, 1, 1, 1, 1, 1,
0.6911948, -0.007858797, 1.936128, 1, 1, 1, 1, 1,
0.6953235, -1.374595, 1.287314, 1, 1, 1, 1, 1,
0.6972624, -1.044534, 2.824359, 1, 1, 1, 1, 1,
0.7016562, 0.8022878, 0.7904068, 1, 1, 1, 1, 1,
0.7018112, 0.881094, 1.709985, 1, 1, 1, 1, 1,
0.7023577, -1.836783, 3.582007, 1, 1, 1, 1, 1,
0.7030226, 0.05287632, 2.046683, 1, 1, 1, 1, 1,
0.7099658, 0.9356637, 1.063197, 1, 1, 1, 1, 1,
0.7184335, 1.970723, 0.4852466, 0, 0, 1, 1, 1,
0.7188029, -0.1480397, 2.101178, 1, 0, 0, 1, 1,
0.7202712, -0.3457297, 2.006283, 1, 0, 0, 1, 1,
0.7292928, 0.4705158, 0.2667077, 1, 0, 0, 1, 1,
0.7294483, -1.493644, 1.75186, 1, 0, 0, 1, 1,
0.7326256, 0.6810864, 0.8542362, 1, 0, 0, 1, 1,
0.7349326, -0.04803573, 0.9562142, 0, 0, 0, 1, 1,
0.7552865, 0.558845, 1.149102, 0, 0, 0, 1, 1,
0.7560847, 1.652922, 0.3352365, 0, 0, 0, 1, 1,
0.757987, 0.2855606, 1.509454, 0, 0, 0, 1, 1,
0.7609944, -0.7564133, 3.508212, 0, 0, 0, 1, 1,
0.7649701, 0.102592, -0.1462752, 0, 0, 0, 1, 1,
0.7703815, -0.9300309, 1.201861, 0, 0, 0, 1, 1,
0.7755979, -1.038745, 2.567907, 1, 1, 1, 1, 1,
0.7858388, 0.21999, 1.625308, 1, 1, 1, 1, 1,
0.7878726, -2.833086, 2.223564, 1, 1, 1, 1, 1,
0.7884114, -1.326407, 2.230814, 1, 1, 1, 1, 1,
0.7887248, 1.37942, -0.322626, 1, 1, 1, 1, 1,
0.7910873, 0.06450006, 1.298534, 1, 1, 1, 1, 1,
0.7947901, 0.2469026, 0.7454541, 1, 1, 1, 1, 1,
0.7959597, -0.1683303, 2.203108, 1, 1, 1, 1, 1,
0.7984192, 1.050534, 0.39378, 1, 1, 1, 1, 1,
0.8036745, 1.138584, 1.369114, 1, 1, 1, 1, 1,
0.8040245, -3.053698, 2.510987, 1, 1, 1, 1, 1,
0.806585, -0.9668977, 2.212203, 1, 1, 1, 1, 1,
0.8076156, -0.8142747, 1.372626, 1, 1, 1, 1, 1,
0.8081249, 0.6043891, 0.2551414, 1, 1, 1, 1, 1,
0.8122496, -0.03430449, 3.019463, 1, 1, 1, 1, 1,
0.8176376, -0.389623, 1.873358, 0, 0, 1, 1, 1,
0.8176535, -0.04358928, 1.599682, 1, 0, 0, 1, 1,
0.8227011, 0.8108173, 1.171418, 1, 0, 0, 1, 1,
0.8237703, 0.7551486, 1.700084, 1, 0, 0, 1, 1,
0.8294206, -0.8123412, 3.009134, 1, 0, 0, 1, 1,
0.8326447, -1.069615, 3.875942, 1, 0, 0, 1, 1,
0.8443556, -1.19259, 2.805402, 0, 0, 0, 1, 1,
0.8447532, 0.3425326, 0.01810142, 0, 0, 0, 1, 1,
0.8461848, -2.252912, 0.8797439, 0, 0, 0, 1, 1,
0.8518079, 0.004664805, 2.648751, 0, 0, 0, 1, 1,
0.8639659, -0.9949588, 3.902067, 0, 0, 0, 1, 1,
0.8661045, 0.4784467, 1.510129, 0, 0, 0, 1, 1,
0.8679776, -0.4790622, 2.93099, 0, 0, 0, 1, 1,
0.8686801, 0.6134746, 1.008821, 1, 1, 1, 1, 1,
0.87007, 0.1341773, -1.042702, 1, 1, 1, 1, 1,
0.8718074, 0.1889212, 1.107638, 1, 1, 1, 1, 1,
0.8820629, -1.910918, 2.882583, 1, 1, 1, 1, 1,
0.8864149, 0.9007956, 0.7921267, 1, 1, 1, 1, 1,
0.8886794, 1.216208, -0.387405, 1, 1, 1, 1, 1,
0.9052134, -1.59983, 3.589755, 1, 1, 1, 1, 1,
0.9118165, 1.685808, 0.348515, 1, 1, 1, 1, 1,
0.9147558, -0.375459, 3.146634, 1, 1, 1, 1, 1,
0.9153435, 0.7022821, 1.105395, 1, 1, 1, 1, 1,
0.9169799, 2.197089, 1.697311, 1, 1, 1, 1, 1,
0.9233709, 0.8544613, 1.174157, 1, 1, 1, 1, 1,
0.9269891, -0.2905027, 2.859609, 1, 1, 1, 1, 1,
0.927442, 0.1309031, 2.285503, 1, 1, 1, 1, 1,
0.9277939, -0.8075947, 2.451183, 1, 1, 1, 1, 1,
0.9352955, -0.7243959, 2.741136, 0, 0, 1, 1, 1,
0.9361926, -0.7060271, 1.078783, 1, 0, 0, 1, 1,
0.9431236, -0.2688096, 1.082324, 1, 0, 0, 1, 1,
0.9461439, 0.3554039, 0.2574202, 1, 0, 0, 1, 1,
0.9463103, -0.1596034, 1.902338, 1, 0, 0, 1, 1,
0.9519768, -0.6076033, 2.101326, 1, 0, 0, 1, 1,
0.9642612, 0.331937, 2.205667, 0, 0, 0, 1, 1,
0.9644395, 0.5222154, 1.530201, 0, 0, 0, 1, 1,
0.967198, 1.287917, 0.029241, 0, 0, 0, 1, 1,
0.9673063, 0.6515198, 0.7607288, 0, 0, 0, 1, 1,
0.9706774, -0.7201276, 2.310052, 0, 0, 0, 1, 1,
0.9749079, -0.9627675, 1.920296, 0, 0, 0, 1, 1,
0.9751959, -0.3083127, 2.269217, 0, 0, 0, 1, 1,
0.9754264, 0.3828633, 1.570711, 1, 1, 1, 1, 1,
0.9755765, -0.3383577, 1.854978, 1, 1, 1, 1, 1,
0.9816116, -0.3037815, 1.618934, 1, 1, 1, 1, 1,
0.986644, -1.211874, 3.157474, 1, 1, 1, 1, 1,
1.004013, 0.570106, 1.073971, 1, 1, 1, 1, 1,
1.006768, 0.3048279, 0.6442348, 1, 1, 1, 1, 1,
1.012211, 0.3284069, 1.397218, 1, 1, 1, 1, 1,
1.012461, -0.5442906, 2.597897, 1, 1, 1, 1, 1,
1.022475, -1.584967, 1.591501, 1, 1, 1, 1, 1,
1.045479, 0.3111631, 0.2401604, 1, 1, 1, 1, 1,
1.04579, -1.351002, 3.238944, 1, 1, 1, 1, 1,
1.053524, 0.0388181, -0.4847876, 1, 1, 1, 1, 1,
1.054498, 0.1639899, 1.324564, 1, 1, 1, 1, 1,
1.056162, -0.393397, 4.119435, 1, 1, 1, 1, 1,
1.056485, 2.486516, 1.537697, 1, 1, 1, 1, 1,
1.068658, 0.5447707, 0.06162482, 0, 0, 1, 1, 1,
1.071481, -1.284495, 3.644669, 1, 0, 0, 1, 1,
1.073873, 1.066828, -0.2535215, 1, 0, 0, 1, 1,
1.078791, 0.2285362, 0.752321, 1, 0, 0, 1, 1,
1.079833, -0.1842668, 2.436496, 1, 0, 0, 1, 1,
1.084815, 1.736967, 0.7435461, 1, 0, 0, 1, 1,
1.090853, -1.534996, 3.023106, 0, 0, 0, 1, 1,
1.092939, 0.1717689, 3.991628, 0, 0, 0, 1, 1,
1.095579, -0.4842389, 1.89495, 0, 0, 0, 1, 1,
1.099875, 1.234889, 1.009227, 0, 0, 0, 1, 1,
1.109071, 1.092869, 1.751134, 0, 0, 0, 1, 1,
1.112546, -0.429512, 3.334235, 0, 0, 0, 1, 1,
1.114189, -1.854499, 4.689404, 0, 0, 0, 1, 1,
1.135488, 0.1713496, 1.046549, 1, 1, 1, 1, 1,
1.13622, -0.9453454, 1.071685, 1, 1, 1, 1, 1,
1.141632, -1.746749, 2.517553, 1, 1, 1, 1, 1,
1.147394, 0.1731832, 0.4499014, 1, 1, 1, 1, 1,
1.150304, 1.263326, 0.3520409, 1, 1, 1, 1, 1,
1.153788, 0.8206715, 1.18924, 1, 1, 1, 1, 1,
1.16686, -1.653082, 2.918682, 1, 1, 1, 1, 1,
1.171057, 0.9423113, 2.020175, 1, 1, 1, 1, 1,
1.171348, -0.7245126, 3.614706, 1, 1, 1, 1, 1,
1.172766, 0.606196, 2.154311, 1, 1, 1, 1, 1,
1.181349, 0.9202283, 0.2993889, 1, 1, 1, 1, 1,
1.184023, 1.934396, 1.777511, 1, 1, 1, 1, 1,
1.188243, -0.642399, 2.696013, 1, 1, 1, 1, 1,
1.194667, -0.1386083, 0.8984538, 1, 1, 1, 1, 1,
1.19528, -0.2881722, 2.482026, 1, 1, 1, 1, 1,
1.199773, 1.849567, 1.127992, 0, 0, 1, 1, 1,
1.205512, 1.122655, -0.3809631, 1, 0, 0, 1, 1,
1.206257, 1.089553, 0.2372585, 1, 0, 0, 1, 1,
1.207877, 0.6583487, -0.8642898, 1, 0, 0, 1, 1,
1.236413, 0.4193211, 1.880345, 1, 0, 0, 1, 1,
1.252067, -0.08190838, 0.8737714, 1, 0, 0, 1, 1,
1.254321, -1.168983, 3.245924, 0, 0, 0, 1, 1,
1.255031, 1.354558, 1.681398, 0, 0, 0, 1, 1,
1.26581, -0.9795148, 2.652028, 0, 0, 0, 1, 1,
1.266788, 0.9913944, 1.013836, 0, 0, 0, 1, 1,
1.271141, 1.081804, -0.09669711, 0, 0, 0, 1, 1,
1.276322, -0.9856037, 1.663896, 0, 0, 0, 1, 1,
1.282077, -0.4379879, 1.349555, 0, 0, 0, 1, 1,
1.284669, -0.04447922, 2.943632, 1, 1, 1, 1, 1,
1.295733, 0.6796895, 0.5369727, 1, 1, 1, 1, 1,
1.315009, 0.8056385, 0.9149384, 1, 1, 1, 1, 1,
1.316288, -1.347583, 0.8678471, 1, 1, 1, 1, 1,
1.348037, -0.6257761, 3.447025, 1, 1, 1, 1, 1,
1.349862, -0.4597188, 2.232447, 1, 1, 1, 1, 1,
1.356944, 0.1423234, 0.6824876, 1, 1, 1, 1, 1,
1.357759, -0.9545721, 2.593629, 1, 1, 1, 1, 1,
1.376327, -0.4264144, 1.294347, 1, 1, 1, 1, 1,
1.386176, -0.3516996, 2.556943, 1, 1, 1, 1, 1,
1.392187, -1.402066, 2.318807, 1, 1, 1, 1, 1,
1.396645, 0.665283, 0.9226047, 1, 1, 1, 1, 1,
1.43269, -1.219822, 1.874437, 1, 1, 1, 1, 1,
1.436809, -0.6855797, 3.430051, 1, 1, 1, 1, 1,
1.438723, 1.026453, 1.433974, 1, 1, 1, 1, 1,
1.441689, -0.1297449, 0.6900895, 0, 0, 1, 1, 1,
1.441855, 0.5584833, 3.056502, 1, 0, 0, 1, 1,
1.452027, -0.6208253, 2.814615, 1, 0, 0, 1, 1,
1.452547, 0.1736102, 0.8625259, 1, 0, 0, 1, 1,
1.4531, -0.1599005, 1.715592, 1, 0, 0, 1, 1,
1.457612, 0.3322981, 1.530514, 1, 0, 0, 1, 1,
1.479703, 0.1015041, 2.97884, 0, 0, 0, 1, 1,
1.484398, 2.053122, 1.22842, 0, 0, 0, 1, 1,
1.496733, -0.4711762, 1.103927, 0, 0, 0, 1, 1,
1.534952, 0.06401831, 0.5995315, 0, 0, 0, 1, 1,
1.552741, 0.3116228, 1.989581, 0, 0, 0, 1, 1,
1.552872, 2.513084, 1.35982, 0, 0, 0, 1, 1,
1.564788, -1.412071, 4.023878, 0, 0, 0, 1, 1,
1.570051, 0.3127853, 1.471249, 1, 1, 1, 1, 1,
1.572981, 0.7107031, 0.003494297, 1, 1, 1, 1, 1,
1.573927, 0.5958975, 0.02334347, 1, 1, 1, 1, 1,
1.579175, -2.058066, 3.634445, 1, 1, 1, 1, 1,
1.583783, 0.93576, 2.392211, 1, 1, 1, 1, 1,
1.60079, 1.148908, 0.2901633, 1, 1, 1, 1, 1,
1.639234, 0.5186817, 1.083529, 1, 1, 1, 1, 1,
1.642725, 0.793932, -1.20094, 1, 1, 1, 1, 1,
1.65578, -0.04405412, 0.9106457, 1, 1, 1, 1, 1,
1.664709, 0.2373728, 0.4068932, 1, 1, 1, 1, 1,
1.671605, -1.109627, 2.464321, 1, 1, 1, 1, 1,
1.672568, 0.8157718, 0.8528711, 1, 1, 1, 1, 1,
1.686204, -1.162043, 2.201832, 1, 1, 1, 1, 1,
1.727158, 1.286189, 1.191934, 1, 1, 1, 1, 1,
1.732163, 0.9260439, 0.3284096, 1, 1, 1, 1, 1,
1.760777, -1.144038, 1.344017, 0, 0, 1, 1, 1,
1.761914, -0.03198566, -0.1288034, 1, 0, 0, 1, 1,
1.765733, -0.8997858, 1.351207, 1, 0, 0, 1, 1,
1.767267, -1.112255, 0.330054, 1, 0, 0, 1, 1,
1.776813, -1.20103, 2.875349, 1, 0, 0, 1, 1,
1.786285, -0.5744373, 3.301424, 1, 0, 0, 1, 1,
1.79655, -1.603383, 3.189191, 0, 0, 0, 1, 1,
1.810833, -0.2277809, 3.935143, 0, 0, 0, 1, 1,
1.830152, 0.4035713, 2.551214, 0, 0, 0, 1, 1,
1.830662, -1.187222, 3.07388, 0, 0, 0, 1, 1,
1.873253, 0.355675, -0.1860456, 0, 0, 0, 1, 1,
1.876971, 0.07978326, 3.564479, 0, 0, 0, 1, 1,
1.882778, -0.1636828, 1.679461, 0, 0, 0, 1, 1,
1.88598, -0.912138, 2.056017, 1, 1, 1, 1, 1,
1.892693, -0.2351156, 1.211181, 1, 1, 1, 1, 1,
1.91025, 1.614104, 1.295206, 1, 1, 1, 1, 1,
1.947817, -1.42808, 3.809665, 1, 1, 1, 1, 1,
1.949511, 0.2285028, 0.6701935, 1, 1, 1, 1, 1,
1.971727, -1.180603, 0.1176918, 1, 1, 1, 1, 1,
1.992755, -1.169247, 0.5215902, 1, 1, 1, 1, 1,
1.994542, 0.600929, 0.1177764, 1, 1, 1, 1, 1,
2.008976, -0.4373817, 3.14515, 1, 1, 1, 1, 1,
2.016627, 0.1415827, 1.579907, 1, 1, 1, 1, 1,
2.05898, -0.3574837, 0.8876505, 1, 1, 1, 1, 1,
2.106169, 0.6131458, -0.4357196, 1, 1, 1, 1, 1,
2.134208, -0.7826334, 2.035192, 1, 1, 1, 1, 1,
2.159842, -1.806141, 0.5733873, 1, 1, 1, 1, 1,
2.173833, -1.227578, 1.650454, 1, 1, 1, 1, 1,
2.177939, 0.3199842, 0.9396925, 0, 0, 1, 1, 1,
2.195338, -0.3754775, 1.197681, 1, 0, 0, 1, 1,
2.217622, -1.580923, 1.905818, 1, 0, 0, 1, 1,
2.23684, 0.2551404, -0.1821273, 1, 0, 0, 1, 1,
2.243271, 0.8120443, 0.1533104, 1, 0, 0, 1, 1,
2.256122, -0.4767138, -0.3491719, 1, 0, 0, 1, 1,
2.305124, 1.379572, 1.130563, 0, 0, 0, 1, 1,
2.319567, 1.052527, 1.474702, 0, 0, 0, 1, 1,
2.320064, -1.922158, 1.135971, 0, 0, 0, 1, 1,
2.359064, -0.5222586, 2.090607, 0, 0, 0, 1, 1,
2.380238, -1.38849, 3.055646, 0, 0, 0, 1, 1,
2.385872, -0.5843468, 1.901487, 0, 0, 0, 1, 1,
2.389315, -0.4407669, 2.079201, 0, 0, 0, 1, 1,
2.555279, -0.06434979, 1.248988, 1, 1, 1, 1, 1,
2.559468, 0.06605967, 0.748605, 1, 1, 1, 1, 1,
2.66165, -0.2664875, -0.1984593, 1, 1, 1, 1, 1,
2.703136, 0.4801997, 1.238593, 1, 1, 1, 1, 1,
2.9205, -0.2691737, 1.238132, 1, 1, 1, 1, 1,
3.008635, -0.9102218, 1.977683, 1, 1, 1, 1, 1,
3.357257, 0.1680535, 0.8857588, 1, 1, 1, 1, 1
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
var radius = 9.56104;
var distance = 33.58275;
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
mvMatrix.translate( -0.1305861, -0.04417729, 0.07521844 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58275);
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
