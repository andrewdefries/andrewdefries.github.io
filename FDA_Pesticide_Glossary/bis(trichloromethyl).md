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
-3.263451, -0.7759179, -1.682811, 1, 0, 0, 1,
-2.518087, -0.2517449, -0.6094075, 1, 0.007843138, 0, 1,
-2.448969, 0.6201631, -1.166072, 1, 0.01176471, 0, 1,
-2.401138, -0.9618393, -2.931441, 1, 0.01960784, 0, 1,
-2.395523, 1.037439, -0.73223, 1, 0.02352941, 0, 1,
-2.342436, -2.673107, -2.641624, 1, 0.03137255, 0, 1,
-2.329463, 2.294763, -0.8084723, 1, 0.03529412, 0, 1,
-2.321081, -0.7486942, -2.341449, 1, 0.04313726, 0, 1,
-2.302624, -0.4668142, -2.612671, 1, 0.04705882, 0, 1,
-2.27981, 0.8152926, -1.811157, 1, 0.05490196, 0, 1,
-2.27793, -0.1291694, -1.328536, 1, 0.05882353, 0, 1,
-2.227473, -1.477695, -0.4348572, 1, 0.06666667, 0, 1,
-2.22082, 0.08328626, -1.617722, 1, 0.07058824, 0, 1,
-2.215926, -0.1870692, 1.143684, 1, 0.07843138, 0, 1,
-2.199116, -0.5956755, -1.807903, 1, 0.08235294, 0, 1,
-2.182371, 0.02032837, -1.125815, 1, 0.09019608, 0, 1,
-2.08581, -1.255553, -3.580029, 1, 0.09411765, 0, 1,
-2.070061, -1.247685, -2.38357, 1, 0.1019608, 0, 1,
-2.019276, -0.6592398, 0.7713016, 1, 0.1098039, 0, 1,
-2.018127, 0.08240449, -0.8930451, 1, 0.1137255, 0, 1,
-2.005767, -0.9560357, -3.356884, 1, 0.1215686, 0, 1,
-2.004421, -0.7605574, -3.018188, 1, 0.1254902, 0, 1,
-2.003132, -0.9676127, -2.59665, 1, 0.1333333, 0, 1,
-1.98366, 1.571952, -1.866161, 1, 0.1372549, 0, 1,
-1.97719, -0.4538675, -2.078461, 1, 0.145098, 0, 1,
-1.926888, 2.641835, -0.7313768, 1, 0.1490196, 0, 1,
-1.921558, 0.8348578, -2.051155, 1, 0.1568628, 0, 1,
-1.894138, 0.9628661, -1.716715, 1, 0.1607843, 0, 1,
-1.847126, -1.281659, -2.834935, 1, 0.1686275, 0, 1,
-1.837756, 1.619632, -2.078395, 1, 0.172549, 0, 1,
-1.823319, 0.5317705, -0.8807997, 1, 0.1803922, 0, 1,
-1.802273, -1.02277, -3.249645, 1, 0.1843137, 0, 1,
-1.797369, 0.178975, -1.850735, 1, 0.1921569, 0, 1,
-1.792356, 0.2642906, -1.930248, 1, 0.1960784, 0, 1,
-1.785766, 0.2434022, -0.9049276, 1, 0.2039216, 0, 1,
-1.783882, 0.94169, 0.3562588, 1, 0.2117647, 0, 1,
-1.750432, -0.9955916, -0.8432034, 1, 0.2156863, 0, 1,
-1.740904, -0.06876901, -2.103287, 1, 0.2235294, 0, 1,
-1.729926, 0.972486, -1.796245, 1, 0.227451, 0, 1,
-1.72736, -0.028658, -2.605139, 1, 0.2352941, 0, 1,
-1.716401, -1.656584, -2.21737, 1, 0.2392157, 0, 1,
-1.715581, 0.3247593, -0.7171855, 1, 0.2470588, 0, 1,
-1.714148, -0.2473615, -1.120224, 1, 0.2509804, 0, 1,
-1.698462, -0.9431262, -1.958015, 1, 0.2588235, 0, 1,
-1.697447, 0.7951896, -3.468859, 1, 0.2627451, 0, 1,
-1.692151, 0.1951581, 1.415425, 1, 0.2705882, 0, 1,
-1.665546, -0.7108451, -1.806099, 1, 0.2745098, 0, 1,
-1.656472, -2.179533, -3.863128, 1, 0.282353, 0, 1,
-1.655624, -2.023948, -3.028711, 1, 0.2862745, 0, 1,
-1.638263, 1.536536, 0.3183955, 1, 0.2941177, 0, 1,
-1.63738, 0.09696213, -1.590176, 1, 0.3019608, 0, 1,
-1.636708, 1.515584, 0.2210079, 1, 0.3058824, 0, 1,
-1.612951, -0.9410886, -1.460014, 1, 0.3137255, 0, 1,
-1.610722, 0.9163358, -1.528589, 1, 0.3176471, 0, 1,
-1.610088, 0.1455651, -3.348789, 1, 0.3254902, 0, 1,
-1.607253, 0.6344265, 0.1591229, 1, 0.3294118, 0, 1,
-1.593224, -0.1056104, -1.882762, 1, 0.3372549, 0, 1,
-1.590099, 1.244231, -1.158999, 1, 0.3411765, 0, 1,
-1.566278, 0.499205, -2.074959, 1, 0.3490196, 0, 1,
-1.557619, 0.6658675, -1.380731, 1, 0.3529412, 0, 1,
-1.536294, -0.8361088, -2.368716, 1, 0.3607843, 0, 1,
-1.521651, -1.191504, -3.01826, 1, 0.3647059, 0, 1,
-1.509775, -0.950635, -3.566671, 1, 0.372549, 0, 1,
-1.500995, -2.261281, -1.799223, 1, 0.3764706, 0, 1,
-1.497857, -1.07713, -3.013866, 1, 0.3843137, 0, 1,
-1.497218, -0.2580593, -2.406711, 1, 0.3882353, 0, 1,
-1.493369, -0.927786, -2.452777, 1, 0.3960784, 0, 1,
-1.484085, 0.3966155, 0.2291782, 1, 0.4039216, 0, 1,
-1.4834, 0.9455566, -2.126514, 1, 0.4078431, 0, 1,
-1.477298, -0.7787514, -3.373951, 1, 0.4156863, 0, 1,
-1.475073, 1.132359, 0.4305229, 1, 0.4196078, 0, 1,
-1.470247, 2.00498, -3.050604, 1, 0.427451, 0, 1,
-1.453283, -0.3588069, -1.672071, 1, 0.4313726, 0, 1,
-1.441462, -2.040685, -2.715269, 1, 0.4392157, 0, 1,
-1.434771, 0.7722684, -1.177807, 1, 0.4431373, 0, 1,
-1.427859, -0.2783495, -1.579054, 1, 0.4509804, 0, 1,
-1.424042, 0.9706755, -3.045207, 1, 0.454902, 0, 1,
-1.409963, 0.5807707, -1.288013, 1, 0.4627451, 0, 1,
-1.404308, 0.7552527, -2.451532, 1, 0.4666667, 0, 1,
-1.395261, 0.4051387, -1.45218, 1, 0.4745098, 0, 1,
-1.387518, 0.3730929, -0.7025942, 1, 0.4784314, 0, 1,
-1.381668, 0.3425915, -0.6645793, 1, 0.4862745, 0, 1,
-1.381528, -0.2072979, -1.334638, 1, 0.4901961, 0, 1,
-1.379974, -0.4632068, -1.857151, 1, 0.4980392, 0, 1,
-1.377224, -0.2269228, -1.673272, 1, 0.5058824, 0, 1,
-1.369553, 0.03480051, -0.5593377, 1, 0.509804, 0, 1,
-1.369039, -1.192838, -2.032647, 1, 0.5176471, 0, 1,
-1.361771, -0.01786476, -1.867515, 1, 0.5215687, 0, 1,
-1.357782, 0.8095011, 0.05024488, 1, 0.5294118, 0, 1,
-1.326223, -0.06019552, -0.9118729, 1, 0.5333334, 0, 1,
-1.324435, 0.4336227, -1.471677, 1, 0.5411765, 0, 1,
-1.316568, 1.329592, -0.3365399, 1, 0.5450981, 0, 1,
-1.312789, -0.8288143, -1.112788, 1, 0.5529412, 0, 1,
-1.311, 0.4680875, -2.283191, 1, 0.5568628, 0, 1,
-1.310626, -0.9675262, -2.379704, 1, 0.5647059, 0, 1,
-1.307679, 0.4657393, -1.657784, 1, 0.5686275, 0, 1,
-1.303636, 0.2805693, -2.249795, 1, 0.5764706, 0, 1,
-1.294138, 0.1421623, -1.874498, 1, 0.5803922, 0, 1,
-1.291716, 0.05764806, -0.8984703, 1, 0.5882353, 0, 1,
-1.285717, -0.7623512, -3.972888, 1, 0.5921569, 0, 1,
-1.271343, 0.2155774, -3.259942, 1, 0.6, 0, 1,
-1.268058, 0.2773816, -1.987171, 1, 0.6078432, 0, 1,
-1.266135, 0.3416137, -1.721682, 1, 0.6117647, 0, 1,
-1.252946, 0.1297308, 0.6938774, 1, 0.6196079, 0, 1,
-1.238111, 1.947865, -2.5699, 1, 0.6235294, 0, 1,
-1.21439, 0.915044, 0.1117809, 1, 0.6313726, 0, 1,
-1.211906, -0.7378749, -2.102724, 1, 0.6352941, 0, 1,
-1.208174, 1.152313, 0.973644, 1, 0.6431373, 0, 1,
-1.19869, 0.3781523, -1.602229, 1, 0.6470588, 0, 1,
-1.196597, -0.1527258, -1.713968, 1, 0.654902, 0, 1,
-1.193371, -0.09279778, -2.096066, 1, 0.6588235, 0, 1,
-1.190488, 0.05011572, -0.6146582, 1, 0.6666667, 0, 1,
-1.187831, -0.802163, -0.6849317, 1, 0.6705883, 0, 1,
-1.184981, 0.3065118, -1.673886, 1, 0.6784314, 0, 1,
-1.184495, -1.081292, -1.951339, 1, 0.682353, 0, 1,
-1.177131, 1.077596, 0.3422754, 1, 0.6901961, 0, 1,
-1.175279, 1.079058, -1.770063, 1, 0.6941177, 0, 1,
-1.173017, 0.4886295, -2.529656, 1, 0.7019608, 0, 1,
-1.168736, -2.015648, -2.283604, 1, 0.7098039, 0, 1,
-1.16796, 0.07656085, -1.53124, 1, 0.7137255, 0, 1,
-1.136445, -0.2165368, -0.04800352, 1, 0.7215686, 0, 1,
-1.130479, 0.6432286, -2.420746, 1, 0.7254902, 0, 1,
-1.126287, -0.436251, -1.999889, 1, 0.7333333, 0, 1,
-1.122832, 1.178728, 0.09143763, 1, 0.7372549, 0, 1,
-1.116914, 1.028428, -1.328607, 1, 0.7450981, 0, 1,
-1.107054, -1.788182, -4.313476, 1, 0.7490196, 0, 1,
-1.106986, 0.4877212, -2.04328, 1, 0.7568628, 0, 1,
-1.105436, 0.4159886, -2.378599, 1, 0.7607843, 0, 1,
-1.10523, 0.7722748, -3.423908, 1, 0.7686275, 0, 1,
-1.096408, 1.116044, -1.501894, 1, 0.772549, 0, 1,
-1.091164, 1.414137, 0.5080317, 1, 0.7803922, 0, 1,
-1.089805, -1.084498, -2.772573, 1, 0.7843137, 0, 1,
-1.084101, -1.255197, -2.063044, 1, 0.7921569, 0, 1,
-1.082672, 0.6579245, -0.1413216, 1, 0.7960784, 0, 1,
-1.081758, 0.1832358, -4.038184, 1, 0.8039216, 0, 1,
-1.077577, -1.437614, -3.931759, 1, 0.8117647, 0, 1,
-1.073367, -0.4234133, -3.212357, 1, 0.8156863, 0, 1,
-1.073021, -0.8480751, -3.152109, 1, 0.8235294, 0, 1,
-1.07293, 2.425591, -1.27214, 1, 0.827451, 0, 1,
-1.072698, 0.3434322, 0.111891, 1, 0.8352941, 0, 1,
-1.068312, 0.6192827, 0.598409, 1, 0.8392157, 0, 1,
-1.063912, -0.07256453, -2.768919, 1, 0.8470588, 0, 1,
-1.060108, 0.5981143, -0.4150937, 1, 0.8509804, 0, 1,
-1.059608, -0.1520574, -1.333883, 1, 0.8588235, 0, 1,
-1.058862, 0.8439324, -1.663111, 1, 0.8627451, 0, 1,
-1.055836, -0.3968368, -0.9413586, 1, 0.8705882, 0, 1,
-1.05179, -0.1880463, -1.82741, 1, 0.8745098, 0, 1,
-1.050713, -0.7545089, -0.9063342, 1, 0.8823529, 0, 1,
-1.04888, 1.694407, -1.1044, 1, 0.8862745, 0, 1,
-1.04109, -1.747976, -2.774474, 1, 0.8941177, 0, 1,
-1.039005, 0.5576531, 0.5279474, 1, 0.8980392, 0, 1,
-1.033759, 0.155403, 0.5414557, 1, 0.9058824, 0, 1,
-1.030532, 0.5050142, -1.697193, 1, 0.9137255, 0, 1,
-1.028865, -0.9997622, -0.168969, 1, 0.9176471, 0, 1,
-1.023575, -0.8015545, -2.390423, 1, 0.9254902, 0, 1,
-1.021841, 0.1606315, -1.662917, 1, 0.9294118, 0, 1,
-1.011696, 0.8635461, -0.4461343, 1, 0.9372549, 0, 1,
-1.010627, 0.1948433, -1.426404, 1, 0.9411765, 0, 1,
-1.009871, 0.5997443, -2.064213, 1, 0.9490196, 0, 1,
-0.9951437, 2.015703, -0.4331851, 1, 0.9529412, 0, 1,
-0.9933826, 0.851455, -2.189353, 1, 0.9607843, 0, 1,
-0.9914762, 0.06098109, -2.02356, 1, 0.9647059, 0, 1,
-0.9909285, 0.1188816, -0.05276702, 1, 0.972549, 0, 1,
-0.9903778, 0.7205266, -1.232701, 1, 0.9764706, 0, 1,
-0.9879979, -0.6097872, -3.060246, 1, 0.9843137, 0, 1,
-0.9831339, -0.2471696, -2.275798, 1, 0.9882353, 0, 1,
-0.9697973, -1.679899, -1.019583, 1, 0.9960784, 0, 1,
-0.9650392, 0.9342597, -0.9777667, 0.9960784, 1, 0, 1,
-0.9556661, 0.3167796, -2.893967, 0.9921569, 1, 0, 1,
-0.9473298, -0.01039917, -2.385603, 0.9843137, 1, 0, 1,
-0.9361346, -1.488579, -1.296904, 0.9803922, 1, 0, 1,
-0.9309651, 0.1336864, -0.7926304, 0.972549, 1, 0, 1,
-0.9277844, 0.8526316, -1.79231, 0.9686275, 1, 0, 1,
-0.926791, 0.9149591, -2.729428, 0.9607843, 1, 0, 1,
-0.9200711, 0.3292836, -1.698104, 0.9568627, 1, 0, 1,
-0.8923594, 0.8642601, -1.881907, 0.9490196, 1, 0, 1,
-0.8922644, 0.001399888, -2.821684, 0.945098, 1, 0, 1,
-0.8858916, 0.3519685, -1.620875, 0.9372549, 1, 0, 1,
-0.8805002, -0.7851179, -1.592737, 0.9333333, 1, 0, 1,
-0.8752223, 0.2943354, -0.5090849, 0.9254902, 1, 0, 1,
-0.8746849, 0.1525694, -1.564058, 0.9215686, 1, 0, 1,
-0.8743917, -1.765282, -4.345035, 0.9137255, 1, 0, 1,
-0.8680922, -0.7372099, -2.296664, 0.9098039, 1, 0, 1,
-0.8623812, 0.9553744, 0.6850785, 0.9019608, 1, 0, 1,
-0.8616127, 0.2279293, -0.880326, 0.8941177, 1, 0, 1,
-0.8611637, 1.136237, -1.348509, 0.8901961, 1, 0, 1,
-0.8595014, -0.6580886, -3.43943, 0.8823529, 1, 0, 1,
-0.8579404, 0.935919, -2.219626, 0.8784314, 1, 0, 1,
-0.8543949, 0.3597915, -1.686059, 0.8705882, 1, 0, 1,
-0.8531396, 1.098043, -0.4273022, 0.8666667, 1, 0, 1,
-0.8474225, 0.9074978, -1.847165, 0.8588235, 1, 0, 1,
-0.8373092, -0.6849021, -2.240455, 0.854902, 1, 0, 1,
-0.8295106, 0.8182246, -0.3428302, 0.8470588, 1, 0, 1,
-0.816878, 1.327808, -1.835525, 0.8431373, 1, 0, 1,
-0.8136939, 0.09871153, -1.893415, 0.8352941, 1, 0, 1,
-0.8122858, -0.09668804, -1.000796, 0.8313726, 1, 0, 1,
-0.8109278, -1.334844, -2.276345, 0.8235294, 1, 0, 1,
-0.8022727, 0.135595, -4.503569, 0.8196079, 1, 0, 1,
-0.7994214, 0.1789483, -1.223724, 0.8117647, 1, 0, 1,
-0.7989291, -0.646504, -1.587478, 0.8078431, 1, 0, 1,
-0.7882125, 0.1702243, -1.077734, 0.8, 1, 0, 1,
-0.7858463, 1.263541, -2.77382, 0.7921569, 1, 0, 1,
-0.7789165, -0.9589762, -3.411931, 0.7882353, 1, 0, 1,
-0.7734238, 2.233509, 0.2431271, 0.7803922, 1, 0, 1,
-0.7692388, 0.2677941, -2.520715, 0.7764706, 1, 0, 1,
-0.7685537, 0.1902612, -0.06288158, 0.7686275, 1, 0, 1,
-0.7643683, -0.8242428, -1.644406, 0.7647059, 1, 0, 1,
-0.7619756, 0.8022089, 0.08035412, 0.7568628, 1, 0, 1,
-0.7613151, 0.3535449, -0.3819381, 0.7529412, 1, 0, 1,
-0.7598432, -2.007477, -2.70315, 0.7450981, 1, 0, 1,
-0.758007, -1.181636, -3.997349, 0.7411765, 1, 0, 1,
-0.7529227, -0.8486944, -3.93783, 0.7333333, 1, 0, 1,
-0.7509008, -0.9018133, -2.24586, 0.7294118, 1, 0, 1,
-0.746301, -2.160007, -4.022256, 0.7215686, 1, 0, 1,
-0.7436977, -0.682532, -2.444648, 0.7176471, 1, 0, 1,
-0.7420831, -1.875126, -1.233396, 0.7098039, 1, 0, 1,
-0.7400002, -1.409693, -4.94632, 0.7058824, 1, 0, 1,
-0.738681, -0.6943301, -1.703007, 0.6980392, 1, 0, 1,
-0.7250807, -1.695778, -4.496741, 0.6901961, 1, 0, 1,
-0.7239246, 1.435759, -1.04616, 0.6862745, 1, 0, 1,
-0.7230948, -0.02150456, -1.822291, 0.6784314, 1, 0, 1,
-0.719152, 0.6840742, -1.146092, 0.6745098, 1, 0, 1,
-0.7135158, 1.026034, -1.228046, 0.6666667, 1, 0, 1,
-0.7114846, 0.4986317, -0.7016762, 0.6627451, 1, 0, 1,
-0.711099, 0.3045855, -1.513917, 0.654902, 1, 0, 1,
-0.7101744, -0.266174, -2.686074, 0.6509804, 1, 0, 1,
-0.7020208, -1.41136, -1.75474, 0.6431373, 1, 0, 1,
-0.701792, 0.2225167, -2.237046, 0.6392157, 1, 0, 1,
-0.7010722, -0.7997901, -0.8740988, 0.6313726, 1, 0, 1,
-0.6977681, -0.7840887, -2.716151, 0.627451, 1, 0, 1,
-0.6968785, -2.03005, -3.097395, 0.6196079, 1, 0, 1,
-0.6924708, 1.179883, -0.05258671, 0.6156863, 1, 0, 1,
-0.686096, -0.4336795, -1.666333, 0.6078432, 1, 0, 1,
-0.6849463, 1.394221, 0.1961971, 0.6039216, 1, 0, 1,
-0.6840886, 0.8108546, -0.7429411, 0.5960785, 1, 0, 1,
-0.6778408, -1.21137, -1.499822, 0.5882353, 1, 0, 1,
-0.6680496, -0.1117705, -1.231485, 0.5843138, 1, 0, 1,
-0.6636662, 0.4015617, -0.6724285, 0.5764706, 1, 0, 1,
-0.6632516, 0.2407007, -1.216101, 0.572549, 1, 0, 1,
-0.6626727, 0.3012224, -1.371755, 0.5647059, 1, 0, 1,
-0.6625437, -0.06425592, -3.310515, 0.5607843, 1, 0, 1,
-0.6622426, -1.49005, -3.837254, 0.5529412, 1, 0, 1,
-0.6578023, -0.1573457, -1.237099, 0.5490196, 1, 0, 1,
-0.657011, -0.2506439, -0.6002796, 0.5411765, 1, 0, 1,
-0.6564526, -1.603979, -4.428535, 0.5372549, 1, 0, 1,
-0.649502, 0.05976431, -1.948458, 0.5294118, 1, 0, 1,
-0.6475869, -0.09621121, 0.2421971, 0.5254902, 1, 0, 1,
-0.647045, -2.035286, -2.63137, 0.5176471, 1, 0, 1,
-0.6451511, -0.6504139, -1.970398, 0.5137255, 1, 0, 1,
-0.6447603, -0.6009957, -1.533614, 0.5058824, 1, 0, 1,
-0.6438439, -1.909183, -3.083055, 0.5019608, 1, 0, 1,
-0.6429844, 0.3564184, 0.3314473, 0.4941176, 1, 0, 1,
-0.6405922, -2.185902, -3.653091, 0.4862745, 1, 0, 1,
-0.6382332, -0.3715574, -3.63361, 0.4823529, 1, 0, 1,
-0.6378806, -1.155075, -3.274281, 0.4745098, 1, 0, 1,
-0.6374846, -0.443278, -2.17108, 0.4705882, 1, 0, 1,
-0.6369131, -1.162156, -3.223871, 0.4627451, 1, 0, 1,
-0.6346999, 0.2489895, -0.633173, 0.4588235, 1, 0, 1,
-0.6316202, 0.8002213, -0.5419348, 0.4509804, 1, 0, 1,
-0.6312084, -1.198111, -3.735803, 0.4470588, 1, 0, 1,
-0.6245012, 0.8317032, -1.30643, 0.4392157, 1, 0, 1,
-0.6238211, 0.8892408, -0.1415571, 0.4352941, 1, 0, 1,
-0.6185242, 0.7852207, -2.030296, 0.427451, 1, 0, 1,
-0.6124372, -0.466408, -1.548506, 0.4235294, 1, 0, 1,
-0.6103975, -1.002027, -4.465915, 0.4156863, 1, 0, 1,
-0.610237, 0.9908435, -1.263186, 0.4117647, 1, 0, 1,
-0.5962469, -0.7394961, -2.406672, 0.4039216, 1, 0, 1,
-0.5945909, 0.334928, 0.3100113, 0.3960784, 1, 0, 1,
-0.5943458, -1.085599, -0.4518062, 0.3921569, 1, 0, 1,
-0.5941009, 0.4132796, -0.5153255, 0.3843137, 1, 0, 1,
-0.5864049, -0.5433496, -0.6830925, 0.3803922, 1, 0, 1,
-0.5835475, 0.5123057, -0.1114641, 0.372549, 1, 0, 1,
-0.5792604, 0.5994347, -0.3258625, 0.3686275, 1, 0, 1,
-0.5733713, 0.7106371, -1.592301, 0.3607843, 1, 0, 1,
-0.5695011, 0.1497899, 0.8996245, 0.3568628, 1, 0, 1,
-0.5694108, -0.6482028, -3.734675, 0.3490196, 1, 0, 1,
-0.5688281, 0.8024502, -0.6866076, 0.345098, 1, 0, 1,
-0.566237, -0.04277894, -1.443813, 0.3372549, 1, 0, 1,
-0.5650738, -0.9709038, -2.029784, 0.3333333, 1, 0, 1,
-0.564629, 0.5562749, -0.1427184, 0.3254902, 1, 0, 1,
-0.5622219, 0.6785474, -1.630311, 0.3215686, 1, 0, 1,
-0.5603507, -0.03290251, -1.721288, 0.3137255, 1, 0, 1,
-0.5583717, 1.081018, 1.079111, 0.3098039, 1, 0, 1,
-0.5517071, -0.5902461, -2.831017, 0.3019608, 1, 0, 1,
-0.5444828, 2.037898, -0.7760981, 0.2941177, 1, 0, 1,
-0.5437025, -0.4667901, -2.033534, 0.2901961, 1, 0, 1,
-0.5434936, -0.7392147, -0.9781563, 0.282353, 1, 0, 1,
-0.5428798, -1.110948, -1.181311, 0.2784314, 1, 0, 1,
-0.5420497, 1.807645, -0.8319936, 0.2705882, 1, 0, 1,
-0.5398623, 2.071744, -1.72366, 0.2666667, 1, 0, 1,
-0.5387854, -0.3789525, -3.056701, 0.2588235, 1, 0, 1,
-0.5305198, 1.346497, -0.1391247, 0.254902, 1, 0, 1,
-0.5268056, -0.1712862, -1.841777, 0.2470588, 1, 0, 1,
-0.5262347, -0.3993013, -2.082991, 0.2431373, 1, 0, 1,
-0.5260554, 0.659681, 1.158891, 0.2352941, 1, 0, 1,
-0.5258346, 0.7237578, -0.2880316, 0.2313726, 1, 0, 1,
-0.5258026, -0.006502665, 0.8721562, 0.2235294, 1, 0, 1,
-0.523132, -0.01115108, -0.03560659, 0.2196078, 1, 0, 1,
-0.5152305, -0.5875335, -3.746238, 0.2117647, 1, 0, 1,
-0.5124961, 0.98886, -0.04204307, 0.2078431, 1, 0, 1,
-0.5119196, -1.044235, -2.043427, 0.2, 1, 0, 1,
-0.5107535, 0.7621765, -0.5768203, 0.1921569, 1, 0, 1,
-0.5088969, -0.3975755, -2.617036, 0.1882353, 1, 0, 1,
-0.5086371, 0.2685483, -1.520768, 0.1803922, 1, 0, 1,
-0.5041313, -0.9400322, -2.945946, 0.1764706, 1, 0, 1,
-0.5026743, -1.654408, -3.219925, 0.1686275, 1, 0, 1,
-0.4986042, -0.6426057, -1.415312, 0.1647059, 1, 0, 1,
-0.4984851, 1.012733, -0.7352472, 0.1568628, 1, 0, 1,
-0.4973941, -0.7981746, -2.483629, 0.1529412, 1, 0, 1,
-0.497064, 0.1457694, -0.9589854, 0.145098, 1, 0, 1,
-0.4903402, -0.1005667, -0.7767104, 0.1411765, 1, 0, 1,
-0.4892238, -1.233057, -1.36263, 0.1333333, 1, 0, 1,
-0.488226, 1.164807, -0.2457075, 0.1294118, 1, 0, 1,
-0.487588, 1.848997, -0.115123, 0.1215686, 1, 0, 1,
-0.4776367, -0.01768143, -1.252799, 0.1176471, 1, 0, 1,
-0.4736955, -0.2496195, -1.316851, 0.1098039, 1, 0, 1,
-0.4736335, 1.233776, -0.6322092, 0.1058824, 1, 0, 1,
-0.4734023, -0.3155773, -2.617094, 0.09803922, 1, 0, 1,
-0.473328, -0.2882596, -1.56665, 0.09019608, 1, 0, 1,
-0.471507, -0.2153761, -1.160624, 0.08627451, 1, 0, 1,
-0.4690848, -0.3986038, -4.559429, 0.07843138, 1, 0, 1,
-0.4686238, -0.8492236, -1.661667, 0.07450981, 1, 0, 1,
-0.4667909, 0.3105418, -0.2814342, 0.06666667, 1, 0, 1,
-0.465709, -1.290347, 0.3770509, 0.0627451, 1, 0, 1,
-0.4633456, -1.455062, -4.160411, 0.05490196, 1, 0, 1,
-0.4519022, 0.4103004, -0.9559272, 0.05098039, 1, 0, 1,
-0.4501667, 0.2466969, -1.607046, 0.04313726, 1, 0, 1,
-0.43937, 0.8564149, 0.5743931, 0.03921569, 1, 0, 1,
-0.4333174, -1.093395, -5.311071, 0.03137255, 1, 0, 1,
-0.4260701, -0.6022799, -3.618666, 0.02745098, 1, 0, 1,
-0.4255358, -1.050089, -3.673495, 0.01960784, 1, 0, 1,
-0.42534, 0.09702954, -2.171405, 0.01568628, 1, 0, 1,
-0.4240592, -0.6812339, -1.272797, 0.007843138, 1, 0, 1,
-0.4224225, -1.289135, -2.458417, 0.003921569, 1, 0, 1,
-0.4215745, 0.06253892, -1.175377, 0, 1, 0.003921569, 1,
-0.4206192, 0.02949345, -0.9530876, 0, 1, 0.01176471, 1,
-0.4204505, 1.855601, 2.404635, 0, 1, 0.01568628, 1,
-0.4187267, 2.229472, -1.749865, 0, 1, 0.02352941, 1,
-0.4139878, 0.7219315, -0.8190449, 0, 1, 0.02745098, 1,
-0.4138223, 0.05594151, -0.1179739, 0, 1, 0.03529412, 1,
-0.4055406, 1.181221, -0.8093948, 0, 1, 0.03921569, 1,
-0.4048472, 0.9663264, -0.4803719, 0, 1, 0.04705882, 1,
-0.4026588, -1.285838, -3.487157, 0, 1, 0.05098039, 1,
-0.4009782, 3.192995, -0.6587553, 0, 1, 0.05882353, 1,
-0.3875264, -0.9681274, -3.056842, 0, 1, 0.0627451, 1,
-0.3841221, 0.8927973, -0.4637304, 0, 1, 0.07058824, 1,
-0.3815777, -0.8211098, -3.988058, 0, 1, 0.07450981, 1,
-0.3780123, -0.120604, -0.547861, 0, 1, 0.08235294, 1,
-0.3764662, 1.576017, 0.2345497, 0, 1, 0.08627451, 1,
-0.3694472, -1.012041, -2.511054, 0, 1, 0.09411765, 1,
-0.3684059, 0.911415, -1.982563, 0, 1, 0.1019608, 1,
-0.3625862, 0.2501451, -1.250384, 0, 1, 0.1058824, 1,
-0.360077, -0.05266553, -0.7540618, 0, 1, 0.1137255, 1,
-0.3586585, 0.2776111, -0.4673299, 0, 1, 0.1176471, 1,
-0.357985, -0.1685698, -1.662297, 0, 1, 0.1254902, 1,
-0.3566957, -1.33456, -3.669319, 0, 1, 0.1294118, 1,
-0.3534105, 2.187084, 0.4047599, 0, 1, 0.1372549, 1,
-0.3515729, -0.6405717, -3.259775, 0, 1, 0.1411765, 1,
-0.3513012, 1.318477, -1.584353, 0, 1, 0.1490196, 1,
-0.3473331, 2.057228, -0.996492, 0, 1, 0.1529412, 1,
-0.346586, 0.4926151, -1.938808, 0, 1, 0.1607843, 1,
-0.3387309, -1.228424, -3.259388, 0, 1, 0.1647059, 1,
-0.3374974, -0.5905229, -3.83283, 0, 1, 0.172549, 1,
-0.3336825, -0.1819423, -3.419204, 0, 1, 0.1764706, 1,
-0.3308807, 1.376191, 0.3227931, 0, 1, 0.1843137, 1,
-0.3295437, -1.544468, -1.579618, 0, 1, 0.1882353, 1,
-0.3217982, 0.2461981, -0.7772163, 0, 1, 0.1960784, 1,
-0.3190053, 0.8059844, 0.7988034, 0, 1, 0.2039216, 1,
-0.3168235, 0.2971105, 0.1582735, 0, 1, 0.2078431, 1,
-0.3167429, 0.2115612, -1.12119, 0, 1, 0.2156863, 1,
-0.3158678, -0.2559744, -3.445943, 0, 1, 0.2196078, 1,
-0.3085561, -0.6457837, -2.275018, 0, 1, 0.227451, 1,
-0.3075959, 0.9892744, -0.4202842, 0, 1, 0.2313726, 1,
-0.305897, 0.3095046, -0.9075489, 0, 1, 0.2392157, 1,
-0.3048241, -0.5749769, -1.035088, 0, 1, 0.2431373, 1,
-0.2997339, 0.7541278, 0.9399182, 0, 1, 0.2509804, 1,
-0.2989713, 0.335122, 0.1788818, 0, 1, 0.254902, 1,
-0.2969543, 0.141877, -1.96969, 0, 1, 0.2627451, 1,
-0.2968778, 0.8411145, 0.6324691, 0, 1, 0.2666667, 1,
-0.2964471, -2.864276, -3.280588, 0, 1, 0.2745098, 1,
-0.2959244, -0.9738291, -2.782257, 0, 1, 0.2784314, 1,
-0.293062, 1.18061, 0.2111893, 0, 1, 0.2862745, 1,
-0.2869718, 1.801804, 0.8199088, 0, 1, 0.2901961, 1,
-0.286439, -0.6524089, -1.440556, 0, 1, 0.2980392, 1,
-0.2850901, -1.291415, -4.501612, 0, 1, 0.3058824, 1,
-0.2826487, -0.6838344, -2.460618, 0, 1, 0.3098039, 1,
-0.2816251, 1.962487, 0.3175389, 0, 1, 0.3176471, 1,
-0.2804959, -0.19698, -4.204826, 0, 1, 0.3215686, 1,
-0.274707, 0.2346704, -1.724193, 0, 1, 0.3294118, 1,
-0.2735472, 1.821643, 1.222955, 0, 1, 0.3333333, 1,
-0.2722766, 0.1445688, 0.1376264, 0, 1, 0.3411765, 1,
-0.2717274, 1.645058, 0.1132247, 0, 1, 0.345098, 1,
-0.2696999, 1.311181, -1.06586, 0, 1, 0.3529412, 1,
-0.2674594, -1.649488, -3.309628, 0, 1, 0.3568628, 1,
-0.2664109, -1.125183, -0.143987, 0, 1, 0.3647059, 1,
-0.2586925, -0.002381484, -2.326415, 0, 1, 0.3686275, 1,
-0.2575085, -0.6052896, -3.016038, 0, 1, 0.3764706, 1,
-0.2535394, 0.7815536, 0.3452177, 0, 1, 0.3803922, 1,
-0.2526594, 0.01123456, -0.2134602, 0, 1, 0.3882353, 1,
-0.2515752, 0.7704948, -0.4934797, 0, 1, 0.3921569, 1,
-0.2500798, 1.223832, -0.3894866, 0, 1, 0.4, 1,
-0.2452605, -1.365776, -2.882053, 0, 1, 0.4078431, 1,
-0.2387442, -1.678833, -1.730628, 0, 1, 0.4117647, 1,
-0.2322427, -0.2819055, -3.962416, 0, 1, 0.4196078, 1,
-0.2317168, -1.395669, -0.8344421, 0, 1, 0.4235294, 1,
-0.2278599, -0.7106177, -4.165741, 0, 1, 0.4313726, 1,
-0.2274643, 0.5956787, -0.9577324, 0, 1, 0.4352941, 1,
-0.2263802, -0.1761535, -4.588548, 0, 1, 0.4431373, 1,
-0.2148117, -0.2216135, -2.556023, 0, 1, 0.4470588, 1,
-0.2116669, -0.5314395, -2.885386, 0, 1, 0.454902, 1,
-0.2074599, 0.1672549, -1.955624, 0, 1, 0.4588235, 1,
-0.2059874, 0.5678832, 0.4675941, 0, 1, 0.4666667, 1,
-0.2053252, -1.109768, -1.324863, 0, 1, 0.4705882, 1,
-0.202891, 1.635121, 1.698715, 0, 1, 0.4784314, 1,
-0.2027192, 0.046862, -0.5942453, 0, 1, 0.4823529, 1,
-0.1982195, -0.0401818, -2.253278, 0, 1, 0.4901961, 1,
-0.1949715, 0.8272867, 1.811438, 0, 1, 0.4941176, 1,
-0.19427, -0.9742104, -1.950025, 0, 1, 0.5019608, 1,
-0.1926892, -0.1503763, -2.621382, 0, 1, 0.509804, 1,
-0.1922743, 0.1845407, -1.673455, 0, 1, 0.5137255, 1,
-0.1918272, -0.8544196, -4.672348, 0, 1, 0.5215687, 1,
-0.1907062, 2.603329, -0.8342814, 0, 1, 0.5254902, 1,
-0.1883926, 1.427622, -1.078754, 0, 1, 0.5333334, 1,
-0.1860581, -0.2022486, -2.050517, 0, 1, 0.5372549, 1,
-0.1854493, -0.6574512, -1.606808, 0, 1, 0.5450981, 1,
-0.1849706, -0.8930863, -3.359095, 0, 1, 0.5490196, 1,
-0.1845933, 0.2095807, 0.7607989, 0, 1, 0.5568628, 1,
-0.1809303, 0.242321, -2.436342, 0, 1, 0.5607843, 1,
-0.1797333, 0.3091809, 1.567861, 0, 1, 0.5686275, 1,
-0.1795271, -0.3368186, -3.77657, 0, 1, 0.572549, 1,
-0.1781519, 0.4252936, 0.3901526, 0, 1, 0.5803922, 1,
-0.1771176, 0.9801432, -0.9521601, 0, 1, 0.5843138, 1,
-0.1704675, 0.4701645, -1.405149, 0, 1, 0.5921569, 1,
-0.1609907, -0.5402325, -2.301127, 0, 1, 0.5960785, 1,
-0.1603703, 0.02804927, -1.44482, 0, 1, 0.6039216, 1,
-0.1596782, 0.3298265, -2.711572, 0, 1, 0.6117647, 1,
-0.159654, 2.009514, -0.5286889, 0, 1, 0.6156863, 1,
-0.1567386, -1.312168, -4.433589, 0, 1, 0.6235294, 1,
-0.1513438, 0.7137698, -2.62684, 0, 1, 0.627451, 1,
-0.1441156, -1.321621, -2.565057, 0, 1, 0.6352941, 1,
-0.1373092, -1.897561, -4.420502, 0, 1, 0.6392157, 1,
-0.1348645, 1.182106, -1.209009, 0, 1, 0.6470588, 1,
-0.1348442, -0.02102149, -1.775101, 0, 1, 0.6509804, 1,
-0.1293315, -0.7365474, -2.800893, 0, 1, 0.6588235, 1,
-0.1285948, 1.100348, 0.6994973, 0, 1, 0.6627451, 1,
-0.1277505, -0.8012431, -2.591558, 0, 1, 0.6705883, 1,
-0.1204519, 1.370528, 1.031418, 0, 1, 0.6745098, 1,
-0.1191, -0.8327152, -4.02364, 0, 1, 0.682353, 1,
-0.1190543, -0.3569938, -1.555365, 0, 1, 0.6862745, 1,
-0.1151784, -0.2093859, -3.429224, 0, 1, 0.6941177, 1,
-0.1145002, 0.668285, -0.1157938, 0, 1, 0.7019608, 1,
-0.111668, -1.365069, -3.797979, 0, 1, 0.7058824, 1,
-0.109463, -0.3840736, -4.416353, 0, 1, 0.7137255, 1,
-0.1079283, 0.2854654, -0.4416274, 0, 1, 0.7176471, 1,
-0.09946835, -1.53603, -3.195826, 0, 1, 0.7254902, 1,
-0.09843351, 0.3783231, -0.6022904, 0, 1, 0.7294118, 1,
-0.09294266, 0.2580013, -0.7788699, 0, 1, 0.7372549, 1,
-0.08788437, -0.5727594, -3.879054, 0, 1, 0.7411765, 1,
-0.08478165, -0.6664113, -0.2464836, 0, 1, 0.7490196, 1,
-0.08136676, -1.244854, -3.761269, 0, 1, 0.7529412, 1,
-0.08136497, -1.38751, -2.874421, 0, 1, 0.7607843, 1,
-0.08025154, -0.687561, -2.503919, 0, 1, 0.7647059, 1,
-0.07653196, 2.206473, -1.066939, 0, 1, 0.772549, 1,
-0.07368867, -0.5598633, -3.882293, 0, 1, 0.7764706, 1,
-0.07217326, -0.1028256, -3.370618, 0, 1, 0.7843137, 1,
-0.07009071, -0.6634471, -2.232199, 0, 1, 0.7882353, 1,
-0.06729724, -0.1872333, -2.257418, 0, 1, 0.7960784, 1,
-0.06548682, 0.5735488, 1.127251, 0, 1, 0.8039216, 1,
-0.06505401, 0.6013173, -0.4942415, 0, 1, 0.8078431, 1,
-0.06380073, -1.32583, -3.461154, 0, 1, 0.8156863, 1,
-0.06106139, -0.3252573, -3.14659, 0, 1, 0.8196079, 1,
-0.05930398, -0.6265265, -3.269133, 0, 1, 0.827451, 1,
-0.05824362, -0.1482286, -2.086071, 0, 1, 0.8313726, 1,
-0.05749243, -0.4381232, -2.825515, 0, 1, 0.8392157, 1,
-0.05726659, -0.2131829, -3.886009, 0, 1, 0.8431373, 1,
-0.05423187, -0.3663079, -4.681083, 0, 1, 0.8509804, 1,
-0.05411198, -1.390329, -2.573379, 0, 1, 0.854902, 1,
-0.05315845, -1.151078, -1.992064, 0, 1, 0.8627451, 1,
-0.05031624, -0.995129, -1.623202, 0, 1, 0.8666667, 1,
-0.049387, -0.4138608, -3.037808, 0, 1, 0.8745098, 1,
-0.04639123, 0.8735906, 0.2698785, 0, 1, 0.8784314, 1,
-0.04610863, -1.569527, -2.177239, 0, 1, 0.8862745, 1,
-0.04054045, 0.8549815, -0.0936287, 0, 1, 0.8901961, 1,
-0.04050223, 0.3590736, -1.350006, 0, 1, 0.8980392, 1,
-0.04010275, -1.067693, -1.79203, 0, 1, 0.9058824, 1,
-0.03612867, -1.683745, -2.412176, 0, 1, 0.9098039, 1,
-0.03393642, -0.5155667, -3.876873, 0, 1, 0.9176471, 1,
-0.03237709, -0.6604144, -2.374386, 0, 1, 0.9215686, 1,
-0.02689312, 0.1199036, -0.5023817, 0, 1, 0.9294118, 1,
-0.02582938, -0.3842097, -4.196171, 0, 1, 0.9333333, 1,
-0.02188162, 0.6079935, 0.8966837, 0, 1, 0.9411765, 1,
-0.01982326, 0.4675551, 0.6998562, 0, 1, 0.945098, 1,
-0.01950455, 0.2816373, 0.3694836, 0, 1, 0.9529412, 1,
-0.01760149, 0.9087758, -0.3588723, 0, 1, 0.9568627, 1,
-0.01196439, -2.432443, -1.732835, 0, 1, 0.9647059, 1,
-0.001120148, -2.420635, -4.497795, 0, 1, 0.9686275, 1,
0.001535345, -2.185499, 2.644317, 0, 1, 0.9764706, 1,
0.002329581, 2.171262, 1.187116, 0, 1, 0.9803922, 1,
0.003192637, -0.6357222, 4.170524, 0, 1, 0.9882353, 1,
0.004144436, -0.4798306, 2.963643, 0, 1, 0.9921569, 1,
0.004747665, 0.4114013, 1.689795, 0, 1, 1, 1,
0.005669065, 0.7328715, -1.032395, 0, 0.9921569, 1, 1,
0.005733414, -1.197953, 4.276217, 0, 0.9882353, 1, 1,
0.007090906, -0.2097404, 2.246612, 0, 0.9803922, 1, 1,
0.009231091, 1.150092, 0.1002987, 0, 0.9764706, 1, 1,
0.01155402, -1.000873, 3.554619, 0, 0.9686275, 1, 1,
0.01735367, 0.1320635, 1.970753, 0, 0.9647059, 1, 1,
0.01932513, -0.9298275, 2.355001, 0, 0.9568627, 1, 1,
0.02249737, 0.1592174, 1.358422, 0, 0.9529412, 1, 1,
0.02303759, 0.6948819, 0.6799114, 0, 0.945098, 1, 1,
0.02327996, -0.06962629, 3.580444, 0, 0.9411765, 1, 1,
0.02343652, 0.2192465, -1.050929, 0, 0.9333333, 1, 1,
0.02403022, -0.8306317, 3.528645, 0, 0.9294118, 1, 1,
0.03060882, 0.3485593, -0.2614019, 0, 0.9215686, 1, 1,
0.03418969, -0.6389745, 2.182752, 0, 0.9176471, 1, 1,
0.03559451, 0.3834091, 0.6756374, 0, 0.9098039, 1, 1,
0.03881656, -0.02687401, 2.300884, 0, 0.9058824, 1, 1,
0.03900452, 2.327292, 1.36055, 0, 0.8980392, 1, 1,
0.0392115, 1.319001, -0.1009567, 0, 0.8901961, 1, 1,
0.0407127, -0.4195972, 2.157166, 0, 0.8862745, 1, 1,
0.04242895, -1.363273, 4.572556, 0, 0.8784314, 1, 1,
0.0425543, -0.1348556, 0.6251113, 0, 0.8745098, 1, 1,
0.04524951, 0.3265502, 0.2201683, 0, 0.8666667, 1, 1,
0.04540635, 0.5957811, 1.42575, 0, 0.8627451, 1, 1,
0.04969245, 1.265965, -1.845894, 0, 0.854902, 1, 1,
0.05111007, -0.639415, 2.649868, 0, 0.8509804, 1, 1,
0.05276612, -0.8032363, 3.803915, 0, 0.8431373, 1, 1,
0.05292033, 0.5206045, 1.872075, 0, 0.8392157, 1, 1,
0.05800352, 0.5689912, 0.828337, 0, 0.8313726, 1, 1,
0.06375059, -0.6956719, 2.972235, 0, 0.827451, 1, 1,
0.06379479, 0.6451665, 1.83254, 0, 0.8196079, 1, 1,
0.06432633, -0.2512297, 3.225314, 0, 0.8156863, 1, 1,
0.06459129, -0.07376392, 2.237861, 0, 0.8078431, 1, 1,
0.06557142, -2.225216, 3.239759, 0, 0.8039216, 1, 1,
0.06725662, 0.2776394, -0.294852, 0, 0.7960784, 1, 1,
0.07502022, 1.290003, 0.10684, 0, 0.7882353, 1, 1,
0.07951897, 1.711926, -1.773904, 0, 0.7843137, 1, 1,
0.08063499, -0.5542915, 2.466816, 0, 0.7764706, 1, 1,
0.08431231, -0.4790902, 4.058859, 0, 0.772549, 1, 1,
0.08686914, -1.090507, 3.015907, 0, 0.7647059, 1, 1,
0.08903207, 0.3264314, 1.019368, 0, 0.7607843, 1, 1,
0.0913301, -0.1866334, 2.590355, 0, 0.7529412, 1, 1,
0.0918562, -0.1412902, 1.847899, 0, 0.7490196, 1, 1,
0.09239084, -0.927471, 2.732013, 0, 0.7411765, 1, 1,
0.09468178, 0.1776487, 1.190385, 0, 0.7372549, 1, 1,
0.0951052, 0.2117213, 0.4227103, 0, 0.7294118, 1, 1,
0.09929384, -0.07983154, 2.881384, 0, 0.7254902, 1, 1,
0.09997915, -0.4897844, 3.35899, 0, 0.7176471, 1, 1,
0.1028999, -0.9363534, 0.8407761, 0, 0.7137255, 1, 1,
0.1093516, -0.747806, 3.214398, 0, 0.7058824, 1, 1,
0.1096382, 0.7200369, 1.61963, 0, 0.6980392, 1, 1,
0.1096824, 0.2238883, 0.1924938, 0, 0.6941177, 1, 1,
0.1105637, -0.435962, 2.037577, 0, 0.6862745, 1, 1,
0.114395, 0.6002866, -0.8076184, 0, 0.682353, 1, 1,
0.1148226, -0.5086446, 2.655068, 0, 0.6745098, 1, 1,
0.1161858, 0.6757644, 0.9651089, 0, 0.6705883, 1, 1,
0.1190506, -0.8500599, 2.650122, 0, 0.6627451, 1, 1,
0.1217767, 1.732963, -0.5156844, 0, 0.6588235, 1, 1,
0.1246361, 1.689075, -0.7224683, 0, 0.6509804, 1, 1,
0.1269817, -1.430168, 1.837118, 0, 0.6470588, 1, 1,
0.1271161, 0.4467559, 2.3218, 0, 0.6392157, 1, 1,
0.1319212, 0.2448674, 0.6116203, 0, 0.6352941, 1, 1,
0.1319491, -0.3101407, 3.002294, 0, 0.627451, 1, 1,
0.1329772, 2.278915, 0.6582987, 0, 0.6235294, 1, 1,
0.1348725, -0.8515463, 1.833633, 0, 0.6156863, 1, 1,
0.1350592, 0.168598, 1.279754, 0, 0.6117647, 1, 1,
0.1416172, -0.2898666, 2.71971, 0, 0.6039216, 1, 1,
0.1434669, 0.8341745, -0.2353174, 0, 0.5960785, 1, 1,
0.1437414, -0.5616894, 0.4688426, 0, 0.5921569, 1, 1,
0.1448963, 0.06619938, 0.09383449, 0, 0.5843138, 1, 1,
0.1460923, 0.2787798, -0.9183584, 0, 0.5803922, 1, 1,
0.1469443, -1.483426, 5.262721, 0, 0.572549, 1, 1,
0.152521, 0.1102636, 2.030279, 0, 0.5686275, 1, 1,
0.1543592, 2.389144, 0.5379006, 0, 0.5607843, 1, 1,
0.162375, 0.1050867, -0.1306928, 0, 0.5568628, 1, 1,
0.1624599, 0.5231087, -0.8454022, 0, 0.5490196, 1, 1,
0.1675134, -1.736629, 2.779442, 0, 0.5450981, 1, 1,
0.1723991, 0.6232532, 0.4629883, 0, 0.5372549, 1, 1,
0.1732216, 1.162653, 0.9418102, 0, 0.5333334, 1, 1,
0.1745913, -0.4202615, 2.680654, 0, 0.5254902, 1, 1,
0.1764439, -0.9963872, 2.565986, 0, 0.5215687, 1, 1,
0.1818594, 1.612381, 1.190927, 0, 0.5137255, 1, 1,
0.1832325, -0.8672187, 2.614703, 0, 0.509804, 1, 1,
0.1865316, -0.5054002, 2.768845, 0, 0.5019608, 1, 1,
0.1872961, -0.7151226, 2.170579, 0, 0.4941176, 1, 1,
0.1973421, -1.114576, 4.343197, 0, 0.4901961, 1, 1,
0.1982049, 0.6668361, 2.079707, 0, 0.4823529, 1, 1,
0.2007504, 0.06525329, 0.8686968, 0, 0.4784314, 1, 1,
0.2024572, 0.1105019, 1.202137, 0, 0.4705882, 1, 1,
0.2027909, 1.378644, 0.2542831, 0, 0.4666667, 1, 1,
0.2061498, -0.4069062, 2.173169, 0, 0.4588235, 1, 1,
0.2097784, -0.2745625, 3.413906, 0, 0.454902, 1, 1,
0.2114575, -0.5157998, 3.531217, 0, 0.4470588, 1, 1,
0.2136986, -1.677413, 2.425674, 0, 0.4431373, 1, 1,
0.2159163, 0.08418906, 0.430275, 0, 0.4352941, 1, 1,
0.2196498, -0.02227465, 1.783832, 0, 0.4313726, 1, 1,
0.2225208, 1.060538, 1.30711, 0, 0.4235294, 1, 1,
0.2229357, -0.0647631, 0.6130365, 0, 0.4196078, 1, 1,
0.225022, 0.07543191, 0.7293023, 0, 0.4117647, 1, 1,
0.2256046, -0.3606141, 3.212187, 0, 0.4078431, 1, 1,
0.22565, -0.682427, 3.899445, 0, 0.4, 1, 1,
0.226192, -1.072583, 3.159032, 0, 0.3921569, 1, 1,
0.2272404, -1.186403, 3.279702, 0, 0.3882353, 1, 1,
0.2287464, -0.002872798, 0.89013, 0, 0.3803922, 1, 1,
0.2297687, -0.3078785, 2.673596, 0, 0.3764706, 1, 1,
0.2301117, 1.853078, 0.1042444, 0, 0.3686275, 1, 1,
0.2311363, 0.1540096, 1.398493, 0, 0.3647059, 1, 1,
0.237234, 1.455095, 1.832231, 0, 0.3568628, 1, 1,
0.2379154, -0.3128317, 2.614932, 0, 0.3529412, 1, 1,
0.2393459, 0.6471793, 1.102805, 0, 0.345098, 1, 1,
0.2404249, -0.8989184, 3.859787, 0, 0.3411765, 1, 1,
0.2454136, 0.1006712, 2.909069, 0, 0.3333333, 1, 1,
0.2488594, -0.1188151, 2.351537, 0, 0.3294118, 1, 1,
0.2491719, 0.1942843, 0.4485532, 0, 0.3215686, 1, 1,
0.2498305, -0.5799361, 4.273268, 0, 0.3176471, 1, 1,
0.254611, -0.3061543, 1.328762, 0, 0.3098039, 1, 1,
0.2574338, 0.2594949, 0.7698035, 0, 0.3058824, 1, 1,
0.2591663, 0.05616556, 1.468597, 0, 0.2980392, 1, 1,
0.263044, 0.6653655, 0.02298915, 0, 0.2901961, 1, 1,
0.2642717, -0.3471051, 2.578403, 0, 0.2862745, 1, 1,
0.266796, -0.8207335, 3.295324, 0, 0.2784314, 1, 1,
0.2700352, 1.064266, -0.8546164, 0, 0.2745098, 1, 1,
0.2737041, -0.5369146, 5.559774, 0, 0.2666667, 1, 1,
0.2749763, -0.8678256, 3.878343, 0, 0.2627451, 1, 1,
0.2776539, 1.030192, 0.2150735, 0, 0.254902, 1, 1,
0.2786086, -1.236547, 3.229122, 0, 0.2509804, 1, 1,
0.281291, -0.07811575, 0.8592017, 0, 0.2431373, 1, 1,
0.2815498, 0.09583131, 2.415102, 0, 0.2392157, 1, 1,
0.2862646, -0.4650474, 3.870465, 0, 0.2313726, 1, 1,
0.2889837, -0.8454003, 3.003436, 0, 0.227451, 1, 1,
0.2906847, -0.7012375, 2.15257, 0, 0.2196078, 1, 1,
0.2920285, -0.3915923, 2.166262, 0, 0.2156863, 1, 1,
0.2938596, 0.3488566, 1.393211, 0, 0.2078431, 1, 1,
0.2976781, -1.135724, 4.167209, 0, 0.2039216, 1, 1,
0.2983605, -1.369091, 2.063933, 0, 0.1960784, 1, 1,
0.3005578, 0.8463207, 2.129104, 0, 0.1882353, 1, 1,
0.3013458, -1.044246, 3.473357, 0, 0.1843137, 1, 1,
0.301736, 1.326123, 0.6489712, 0, 0.1764706, 1, 1,
0.3062789, 0.2277697, 1.415603, 0, 0.172549, 1, 1,
0.3076979, 0.299975, 1.346018, 0, 0.1647059, 1, 1,
0.3092585, 0.1832063, 2.323811, 0, 0.1607843, 1, 1,
0.3125625, 1.543431, -0.9000475, 0, 0.1529412, 1, 1,
0.3143184, 0.3770786, 0.2889822, 0, 0.1490196, 1, 1,
0.3176922, -0.4637544, 3.932356, 0, 0.1411765, 1, 1,
0.3200514, -2.363802, 2.335127, 0, 0.1372549, 1, 1,
0.3203188, -0.5379447, 2.963671, 0, 0.1294118, 1, 1,
0.3205513, -0.09805607, 2.439995, 0, 0.1254902, 1, 1,
0.3209265, 1.616481, -0.8452553, 0, 0.1176471, 1, 1,
0.3209288, -0.6671066, 0.671982, 0, 0.1137255, 1, 1,
0.3211635, -0.9249454, 1.80799, 0, 0.1058824, 1, 1,
0.3249596, -0.0677263, 1.37489, 0, 0.09803922, 1, 1,
0.3255632, -1.029643, 3.144464, 0, 0.09411765, 1, 1,
0.3265877, -1.305432, 4.313207, 0, 0.08627451, 1, 1,
0.3488219, -1.315195, 5.039192, 0, 0.08235294, 1, 1,
0.3523592, 0.3189668, 0.9727781, 0, 0.07450981, 1, 1,
0.3578606, 0.9802767, 2.161395, 0, 0.07058824, 1, 1,
0.3586884, -0.9748102, 2.92216, 0, 0.0627451, 1, 1,
0.369343, 0.5328301, 0.0669104, 0, 0.05882353, 1, 1,
0.3720471, 0.2287902, 1.566932, 0, 0.05098039, 1, 1,
0.3727015, 0.3917837, 2.639841, 0, 0.04705882, 1, 1,
0.3755881, 1.768277, -0.1262569, 0, 0.03921569, 1, 1,
0.3767475, 0.5119686, -0.5577536, 0, 0.03529412, 1, 1,
0.3856582, -2.205013, 2.671481, 0, 0.02745098, 1, 1,
0.3868031, -0.338841, 0.9815428, 0, 0.02352941, 1, 1,
0.3905273, -0.90005, 3.192636, 0, 0.01568628, 1, 1,
0.393872, 1.60357, 0.9453273, 0, 0.01176471, 1, 1,
0.4069312, -1.724383, 3.912597, 0, 0.003921569, 1, 1,
0.4119672, 0.7456139, -0.6690611, 0.003921569, 0, 1, 1,
0.4131347, 0.8193642, 1.499411, 0.007843138, 0, 1, 1,
0.4133254, -1.302902, 2.278533, 0.01568628, 0, 1, 1,
0.4178233, 1.569411, 0.7907109, 0.01960784, 0, 1, 1,
0.4182432, -1.749022, 2.290975, 0.02745098, 0, 1, 1,
0.4222749, -1.871579, 4.070373, 0.03137255, 0, 1, 1,
0.4259806, 0.5202644, 1.18665, 0.03921569, 0, 1, 1,
0.426956, -0.9899081, 3.187273, 0.04313726, 0, 1, 1,
0.4366192, -1.610523, 4.14502, 0.05098039, 0, 1, 1,
0.4423527, 1.436053, 0.9462075, 0.05490196, 0, 1, 1,
0.4433536, 0.02590743, -0.01741097, 0.0627451, 0, 1, 1,
0.4460277, 1.272327, 2.518329, 0.06666667, 0, 1, 1,
0.4532571, -0.9772748, 3.252694, 0.07450981, 0, 1, 1,
0.454517, -0.1687082, 4.791133, 0.07843138, 0, 1, 1,
0.4577144, -0.2777122, 2.235159, 0.08627451, 0, 1, 1,
0.4582919, 0.9417432, 1.180108, 0.09019608, 0, 1, 1,
0.4606152, 0.7940798, -0.4392858, 0.09803922, 0, 1, 1,
0.4621202, -1.526685, 1.929367, 0.1058824, 0, 1, 1,
0.4634252, 2.099649, 1.933935, 0.1098039, 0, 1, 1,
0.4636475, -1.788743, 3.389001, 0.1176471, 0, 1, 1,
0.4651482, 0.429087, 0.5938905, 0.1215686, 0, 1, 1,
0.4672904, 0.6731023, -0.462271, 0.1294118, 0, 1, 1,
0.4746889, -1.085153, 2.528206, 0.1333333, 0, 1, 1,
0.4748427, 0.8297575, 0.7120899, 0.1411765, 0, 1, 1,
0.482373, -0.4905999, 3.571589, 0.145098, 0, 1, 1,
0.4876803, 0.7001041, -1.006829, 0.1529412, 0, 1, 1,
0.4891356, 0.2300081, 2.185158, 0.1568628, 0, 1, 1,
0.4926225, -0.3207505, 1.37785, 0.1647059, 0, 1, 1,
0.4933092, 0.8244017, 0.5429326, 0.1686275, 0, 1, 1,
0.4941403, 0.5843071, 2.644487, 0.1764706, 0, 1, 1,
0.4946824, 1.691885, -1.075496, 0.1803922, 0, 1, 1,
0.4948852, 0.09999364, 1.342226, 0.1882353, 0, 1, 1,
0.4966689, 0.8420382, 0.9061952, 0.1921569, 0, 1, 1,
0.5009849, 1.540668, -0.8679623, 0.2, 0, 1, 1,
0.5025383, 0.9312262, -0.02481443, 0.2078431, 0, 1, 1,
0.5030736, -0.2823583, 1.712153, 0.2117647, 0, 1, 1,
0.5054259, -1.111438, 4.272479, 0.2196078, 0, 1, 1,
0.5056152, 1.418502, 0.4704312, 0.2235294, 0, 1, 1,
0.5152805, -0.3317681, 0.637421, 0.2313726, 0, 1, 1,
0.5164724, -0.1087776, 2.474817, 0.2352941, 0, 1, 1,
0.5172166, -0.4407013, 2.338012, 0.2431373, 0, 1, 1,
0.519643, 1.127657, 0.39027, 0.2470588, 0, 1, 1,
0.5205204, 0.608385, 0.5714392, 0.254902, 0, 1, 1,
0.5250439, 0.6114474, -0.0188324, 0.2588235, 0, 1, 1,
0.5305564, 2.207947, 0.3600851, 0.2666667, 0, 1, 1,
0.5328029, 0.8981463, -2.14453, 0.2705882, 0, 1, 1,
0.5413126, -0.03003377, 1.877917, 0.2784314, 0, 1, 1,
0.5460349, 0.9501949, 0.9644142, 0.282353, 0, 1, 1,
0.5463599, 1.102535, -0.06871373, 0.2901961, 0, 1, 1,
0.5494954, -0.9048781, 1.87654, 0.2941177, 0, 1, 1,
0.5550594, 0.3399948, 1.871825, 0.3019608, 0, 1, 1,
0.5609104, 0.5746824, -0.9846548, 0.3098039, 0, 1, 1,
0.564985, 0.7628515, 1.129518, 0.3137255, 0, 1, 1,
0.5659382, -0.8016062, 0.3226784, 0.3215686, 0, 1, 1,
0.5660349, 0.3788669, 0.3826465, 0.3254902, 0, 1, 1,
0.5709121, 0.8078147, 1.12217, 0.3333333, 0, 1, 1,
0.5736321, -0.5219883, 2.584532, 0.3372549, 0, 1, 1,
0.5744542, 0.6103802, 1.297709, 0.345098, 0, 1, 1,
0.5748357, -0.6994222, 1.329115, 0.3490196, 0, 1, 1,
0.5762782, 0.07972315, 0.4941105, 0.3568628, 0, 1, 1,
0.5827406, -1.886382, 2.397131, 0.3607843, 0, 1, 1,
0.5853675, -0.09751375, 2.373538, 0.3686275, 0, 1, 1,
0.5875493, 0.7486225, -0.02567999, 0.372549, 0, 1, 1,
0.5879056, 0.6944792, 1.644892, 0.3803922, 0, 1, 1,
0.5905541, 0.2004171, 1.162457, 0.3843137, 0, 1, 1,
0.5930088, 1.002734, 0.8438892, 0.3921569, 0, 1, 1,
0.6091915, 0.6640826, -0.4891382, 0.3960784, 0, 1, 1,
0.6131865, 0.04291634, 2.139058, 0.4039216, 0, 1, 1,
0.615234, -0.6005691, 1.122104, 0.4117647, 0, 1, 1,
0.6156336, -1.818744, 2.833798, 0.4156863, 0, 1, 1,
0.6165134, -1.593348, 2.547758, 0.4235294, 0, 1, 1,
0.6177204, -0.2664324, 1.590044, 0.427451, 0, 1, 1,
0.6179174, 1.061141, 1.545101, 0.4352941, 0, 1, 1,
0.6193414, -0.8991328, 3.253721, 0.4392157, 0, 1, 1,
0.6205492, 0.0990183, 0.4326564, 0.4470588, 0, 1, 1,
0.6229162, -1.626299, 2.839103, 0.4509804, 0, 1, 1,
0.6252469, 0.9038914, 0.4604569, 0.4588235, 0, 1, 1,
0.6270848, -0.1744634, 1.564914, 0.4627451, 0, 1, 1,
0.6287646, 0.2624854, 1.630854, 0.4705882, 0, 1, 1,
0.6349805, 0.645398, -0.3123859, 0.4745098, 0, 1, 1,
0.6370894, -1.852634, 2.30999, 0.4823529, 0, 1, 1,
0.6384922, 0.04086281, 2.607312, 0.4862745, 0, 1, 1,
0.6391779, 1.482437, -0.3989843, 0.4941176, 0, 1, 1,
0.6443854, 0.9100486, -1.442765, 0.5019608, 0, 1, 1,
0.6467721, -1.504964, 2.338908, 0.5058824, 0, 1, 1,
0.6476561, 0.006727232, 3.17505, 0.5137255, 0, 1, 1,
0.6488751, 0.8513383, 1.62063, 0.5176471, 0, 1, 1,
0.649357, 2.263294, -1.031368, 0.5254902, 0, 1, 1,
0.6545929, 0.2970531, 2.023264, 0.5294118, 0, 1, 1,
0.661921, -0.08282481, 2.961859, 0.5372549, 0, 1, 1,
0.667504, 0.2891416, 0.8912476, 0.5411765, 0, 1, 1,
0.6678351, -0.09715892, 1.732829, 0.5490196, 0, 1, 1,
0.6701065, 1.232549, 0.56489, 0.5529412, 0, 1, 1,
0.6701372, -0.4128695, 1.192043, 0.5607843, 0, 1, 1,
0.6868948, 0.9010022, 0.3837736, 0.5647059, 0, 1, 1,
0.6918995, -0.08960926, 1.024924, 0.572549, 0, 1, 1,
0.6924172, 0.7759999, -0.3949557, 0.5764706, 0, 1, 1,
0.6944004, 1.44108, -0.3829573, 0.5843138, 0, 1, 1,
0.6991559, 1.8011, 0.976438, 0.5882353, 0, 1, 1,
0.7036678, -0.1882651, 3.256701, 0.5960785, 0, 1, 1,
0.7049768, 0.3616289, 1.698724, 0.6039216, 0, 1, 1,
0.7058749, -0.3444988, 2.300023, 0.6078432, 0, 1, 1,
0.7151552, 0.6464987, 2.495473, 0.6156863, 0, 1, 1,
0.7193884, -0.7943223, 3.042816, 0.6196079, 0, 1, 1,
0.7194261, 1.5579, 2.450243, 0.627451, 0, 1, 1,
0.7197954, -0.6837141, 3.830866, 0.6313726, 0, 1, 1,
0.7199395, -1.657744, 4.235744, 0.6392157, 0, 1, 1,
0.7277506, 1.54894, 0.3911101, 0.6431373, 0, 1, 1,
0.7301149, -0.7378927, 1.221, 0.6509804, 0, 1, 1,
0.738922, -0.8095359, 1.819961, 0.654902, 0, 1, 1,
0.7451756, -1.372498, 0.5958632, 0.6627451, 0, 1, 1,
0.749323, 0.4245253, 1.925425, 0.6666667, 0, 1, 1,
0.7497524, -0.3546604, 1.846455, 0.6745098, 0, 1, 1,
0.7598157, -0.691775, 1.967704, 0.6784314, 0, 1, 1,
0.763335, 0.2267027, 0.4341061, 0.6862745, 0, 1, 1,
0.7636451, -0.3591093, 1.236095, 0.6901961, 0, 1, 1,
0.7656463, -0.2202618, 2.404622, 0.6980392, 0, 1, 1,
0.7778952, 0.1632754, 2.389339, 0.7058824, 0, 1, 1,
0.7810694, -0.2932312, 2.213282, 0.7098039, 0, 1, 1,
0.7831959, -2.434729, 3.704591, 0.7176471, 0, 1, 1,
0.7846732, 0.9296527, 1.488971, 0.7215686, 0, 1, 1,
0.788316, -1.23054, 2.296716, 0.7294118, 0, 1, 1,
0.7884376, 1.003783, 0.02685191, 0.7333333, 0, 1, 1,
0.7904705, 1.447871, 2.172289, 0.7411765, 0, 1, 1,
0.792199, -0.8959978, 2.049345, 0.7450981, 0, 1, 1,
0.7999136, 1.344751, 1.769195, 0.7529412, 0, 1, 1,
0.8030556, -0.7123878, 3.463628, 0.7568628, 0, 1, 1,
0.8081532, -0.005976995, 1.636733, 0.7647059, 0, 1, 1,
0.8106079, 0.1833459, 0.8057534, 0.7686275, 0, 1, 1,
0.812438, -0.6318977, 2.776556, 0.7764706, 0, 1, 1,
0.8132209, 1.084522, -0.3821495, 0.7803922, 0, 1, 1,
0.8137901, 0.5379368, 0.3812039, 0.7882353, 0, 1, 1,
0.8175282, 0.2555843, 2.054141, 0.7921569, 0, 1, 1,
0.8177431, 0.418581, 0.04281918, 0.8, 0, 1, 1,
0.8231474, 1.617333, 0.4072396, 0.8078431, 0, 1, 1,
0.8304325, 1.386234, 1.274809, 0.8117647, 0, 1, 1,
0.8323436, -2.237766, 3.864074, 0.8196079, 0, 1, 1,
0.8378322, 0.005913977, 0.8249569, 0.8235294, 0, 1, 1,
0.8414089, 0.1352828, 2.163971, 0.8313726, 0, 1, 1,
0.8450254, 0.2151024, 0.6659256, 0.8352941, 0, 1, 1,
0.8501518, -0.1748385, 1.864238, 0.8431373, 0, 1, 1,
0.8511171, 0.04623942, 1.61139, 0.8470588, 0, 1, 1,
0.8538694, 0.2802111, 1.646871, 0.854902, 0, 1, 1,
0.8565633, -0.7524571, 2.204363, 0.8588235, 0, 1, 1,
0.8596871, -1.190706, 3.753745, 0.8666667, 0, 1, 1,
0.86164, -0.3330476, 2.70779, 0.8705882, 0, 1, 1,
0.8620054, 0.1742491, 0.6385135, 0.8784314, 0, 1, 1,
0.864103, -0.1706229, 1.665606, 0.8823529, 0, 1, 1,
0.8672566, -1.005539, 2.301931, 0.8901961, 0, 1, 1,
0.8686743, -1.185776, 1.056459, 0.8941177, 0, 1, 1,
0.8729463, 0.2547174, -0.9264731, 0.9019608, 0, 1, 1,
0.8750483, 2.008564, -0.02972654, 0.9098039, 0, 1, 1,
0.8826238, -1.337648, 2.621383, 0.9137255, 0, 1, 1,
0.883505, 0.1247426, 1.300919, 0.9215686, 0, 1, 1,
0.8848051, 0.7027888, 1.409786, 0.9254902, 0, 1, 1,
0.8947254, -0.3145577, 2.467114, 0.9333333, 0, 1, 1,
0.8951452, 1.261162, 0.746224, 0.9372549, 0, 1, 1,
0.8951494, 1.233654, 0.8265681, 0.945098, 0, 1, 1,
0.9023681, -0.8512363, 0.6821679, 0.9490196, 0, 1, 1,
0.90574, -1.229611, 3.614522, 0.9568627, 0, 1, 1,
0.9140936, -0.9247602, 1.911712, 0.9607843, 0, 1, 1,
0.921437, -0.9725645, 2.384606, 0.9686275, 0, 1, 1,
0.9252606, -0.3497677, 2.033342, 0.972549, 0, 1, 1,
0.9267285, -0.3205706, 0.7848348, 0.9803922, 0, 1, 1,
0.9280518, -0.8979352, 4.512077, 0.9843137, 0, 1, 1,
0.9320796, -0.3910655, 2.220506, 0.9921569, 0, 1, 1,
0.9320918, -0.03182752, 1.041023, 0.9960784, 0, 1, 1,
0.9338352, 0.744647, 0.6707533, 1, 0, 0.9960784, 1,
0.9344833, -0.3828118, 2.083328, 1, 0, 0.9882353, 1,
0.9345468, 0.3727624, 1.432683, 1, 0, 0.9843137, 1,
0.9348825, 1.039079, -0.1642629, 1, 0, 0.9764706, 1,
0.9367454, 1.869779, -0.3586195, 1, 0, 0.972549, 1,
0.9452614, 0.6347718, -0.3686633, 1, 0, 0.9647059, 1,
0.9463167, 0.7139831, 1.143656, 1, 0, 0.9607843, 1,
0.9471189, -0.2036434, 3.158023, 1, 0, 0.9529412, 1,
0.9477516, -1.506803, 1.657178, 1, 0, 0.9490196, 1,
0.9541424, -1.953583, 5.155151, 1, 0, 0.9411765, 1,
0.9551885, -0.4877461, 1.426008, 1, 0, 0.9372549, 1,
0.9567987, -0.288432, 2.770613, 1, 0, 0.9294118, 1,
0.9683753, 0.9382406, 1.361475, 1, 0, 0.9254902, 1,
0.9711016, -0.1069734, 2.961663, 1, 0, 0.9176471, 1,
0.9822618, 0.03917064, 1.451126, 1, 0, 0.9137255, 1,
0.9825903, -0.5554011, 2.274262, 1, 0, 0.9058824, 1,
0.9846269, -0.3012068, 2.096115, 1, 0, 0.9019608, 1,
0.9912751, -2.008092, 2.368256, 1, 0, 0.8941177, 1,
0.9965172, 0.4060132, 0.1229437, 1, 0, 0.8862745, 1,
1.000982, -0.4455892, 0.6867291, 1, 0, 0.8823529, 1,
1.001899, 1.593074, 0.05661566, 1, 0, 0.8745098, 1,
1.002298, 0.1847465, 2.697973, 1, 0, 0.8705882, 1,
1.007002, -1.014551, 2.719625, 1, 0, 0.8627451, 1,
1.010892, -1.228027, 2.619692, 1, 0, 0.8588235, 1,
1.021669, 1.023056, 1.505201, 1, 0, 0.8509804, 1,
1.039977, -1.873045, 2.211894, 1, 0, 0.8470588, 1,
1.041504, -1.467773, 0.6094772, 1, 0, 0.8392157, 1,
1.046563, 0.3825576, 2.337277, 1, 0, 0.8352941, 1,
1.046608, 1.268834, 1.750135, 1, 0, 0.827451, 1,
1.057705, -1.788903, 1.377617, 1, 0, 0.8235294, 1,
1.059029, -0.2710299, 0.5372853, 1, 0, 0.8156863, 1,
1.074952, 0.155023, -0.08729875, 1, 0, 0.8117647, 1,
1.075994, -1.217058, 1.980594, 1, 0, 0.8039216, 1,
1.076142, -0.4682691, 3.940789, 1, 0, 0.7960784, 1,
1.082174, -0.8009421, 2.388708, 1, 0, 0.7921569, 1,
1.082454, 0.2038799, 0.1578931, 1, 0, 0.7843137, 1,
1.094879, -2.186592, 3.161869, 1, 0, 0.7803922, 1,
1.095392, 0.9756361, 1.142265, 1, 0, 0.772549, 1,
1.099836, 1.042339, 1.499681, 1, 0, 0.7686275, 1,
1.103982, 0.4691934, 1.219082, 1, 0, 0.7607843, 1,
1.109735, -1.632642, 2.301298, 1, 0, 0.7568628, 1,
1.112, -0.112958, 2.274803, 1, 0, 0.7490196, 1,
1.114285, -1.28467, -0.5743673, 1, 0, 0.7450981, 1,
1.114689, 0.8093436, 1.295532, 1, 0, 0.7372549, 1,
1.115083, -1.123698, 1.420251, 1, 0, 0.7333333, 1,
1.118695, 0.9658781, 0.5797371, 1, 0, 0.7254902, 1,
1.127665, 0.8613688, 1.621485, 1, 0, 0.7215686, 1,
1.130498, 0.4035456, 2.407077, 1, 0, 0.7137255, 1,
1.139377, 0.3168006, 2.864536, 1, 0, 0.7098039, 1,
1.155509, -1.769978, 2.274748, 1, 0, 0.7019608, 1,
1.161092, 0.938667, 0.6531652, 1, 0, 0.6941177, 1,
1.16186, -2.246493, 3.113955, 1, 0, 0.6901961, 1,
1.169745, 0.1871301, 2.345659, 1, 0, 0.682353, 1,
1.175322, -1.261166, 2.776752, 1, 0, 0.6784314, 1,
1.179692, 0.03033372, 0.7886049, 1, 0, 0.6705883, 1,
1.183499, -1.005888, 3.106278, 1, 0, 0.6666667, 1,
1.184116, 0.02861372, 1.236286, 1, 0, 0.6588235, 1,
1.188524, -0.2017253, 1.393839, 1, 0, 0.654902, 1,
1.190078, 0.2123739, 1.234546, 1, 0, 0.6470588, 1,
1.191392, 1.15299, 1.08639, 1, 0, 0.6431373, 1,
1.201282, 1.438709, 1.186602, 1, 0, 0.6352941, 1,
1.203758, -1.104785, 4.671017, 1, 0, 0.6313726, 1,
1.20955, -0.320971, 1.207551, 1, 0, 0.6235294, 1,
1.216817, 1.106565, 0.8070226, 1, 0, 0.6196079, 1,
1.222547, 1.732677, 0.7313467, 1, 0, 0.6117647, 1,
1.225577, -0.6263173, 1.540694, 1, 0, 0.6078432, 1,
1.228828, -0.3422759, 0.58461, 1, 0, 0.6, 1,
1.23535, -1.274204, 1.171244, 1, 0, 0.5921569, 1,
1.253471, -1.234172, 0.05991615, 1, 0, 0.5882353, 1,
1.260161, 0.5810667, -0.1268506, 1, 0, 0.5803922, 1,
1.27024, -1.060732, 1.074922, 1, 0, 0.5764706, 1,
1.276335, 0.3059182, 1.649702, 1, 0, 0.5686275, 1,
1.278029, -0.1082041, 1.651145, 1, 0, 0.5647059, 1,
1.278099, 1.363664, 0.3952759, 1, 0, 0.5568628, 1,
1.280209, -0.4129694, 1.935185, 1, 0, 0.5529412, 1,
1.28132, -1.113909, 0.9733727, 1, 0, 0.5450981, 1,
1.292571, 0.05508051, 0.5567774, 1, 0, 0.5411765, 1,
1.314299, 0.58783, 1.032436, 1, 0, 0.5333334, 1,
1.325891, 0.9902936, -0.1065126, 1, 0, 0.5294118, 1,
1.326592, 1.748376, -0.2545403, 1, 0, 0.5215687, 1,
1.333755, 0.4162749, 0.1608717, 1, 0, 0.5176471, 1,
1.342055, 0.4138533, 2.419777, 1, 0, 0.509804, 1,
1.342421, -1.269227, 1.903829, 1, 0, 0.5058824, 1,
1.348631, 0.2475447, 3.155444, 1, 0, 0.4980392, 1,
1.348727, 1.163399, 0.04727983, 1, 0, 0.4901961, 1,
1.34996, -1.554714, 1.219905, 1, 0, 0.4862745, 1,
1.356717, -0.5755582, 0.6070685, 1, 0, 0.4784314, 1,
1.359262, 0.5516249, 0.7244053, 1, 0, 0.4745098, 1,
1.359373, -0.918052, 2.142853, 1, 0, 0.4666667, 1,
1.364435, -0.6203424, 1.242861, 1, 0, 0.4627451, 1,
1.365475, 0.06379758, 2.807958, 1, 0, 0.454902, 1,
1.366708, -0.1687671, 2.464643, 1, 0, 0.4509804, 1,
1.368675, -0.5419002, 0.1117025, 1, 0, 0.4431373, 1,
1.373168, 0.4859389, 0.8483953, 1, 0, 0.4392157, 1,
1.374042, 0.06067941, 0.8635194, 1, 0, 0.4313726, 1,
1.390329, -0.787456, 1.785149, 1, 0, 0.427451, 1,
1.411656, -0.147902, -0.6392325, 1, 0, 0.4196078, 1,
1.419656, 0.3228913, -1.367401, 1, 0, 0.4156863, 1,
1.421406, 1.251633, -0.9860366, 1, 0, 0.4078431, 1,
1.421473, 1.001709, -0.1578916, 1, 0, 0.4039216, 1,
1.425389, 0.8194215, 0.0946883, 1, 0, 0.3960784, 1,
1.4427, 0.2558643, 0.9013039, 1, 0, 0.3882353, 1,
1.454374, -0.4703702, 0.3455868, 1, 0, 0.3843137, 1,
1.457465, 0.9419053, 0.6554497, 1, 0, 0.3764706, 1,
1.477134, 0.04184908, 1.662014, 1, 0, 0.372549, 1,
1.486875, -0.7542956, 2.555827, 1, 0, 0.3647059, 1,
1.501786, -1.355643, 1.481403, 1, 0, 0.3607843, 1,
1.507077, -0.5322902, 2.189115, 1, 0, 0.3529412, 1,
1.515677, -0.3670647, 3.598371, 1, 0, 0.3490196, 1,
1.532268, -1.860398, 0.9222868, 1, 0, 0.3411765, 1,
1.551286, -1.551294, 2.034423, 1, 0, 0.3372549, 1,
1.555249, 0.7467287, 0.2095369, 1, 0, 0.3294118, 1,
1.566859, -2.894954, 3.471249, 1, 0, 0.3254902, 1,
1.577386, -0.435749, 2.051238, 1, 0, 0.3176471, 1,
1.610191, -1.049649, 0.7667255, 1, 0, 0.3137255, 1,
1.619165, 0.3187092, 3.174483, 1, 0, 0.3058824, 1,
1.621524, -1.83419, 3.035352, 1, 0, 0.2980392, 1,
1.623347, 0.5647727, 1.447604, 1, 0, 0.2941177, 1,
1.627156, -0.2649503, 1.209165, 1, 0, 0.2862745, 1,
1.633414, 1.155326, 1.562388, 1, 0, 0.282353, 1,
1.639315, -0.3175545, 3.59702, 1, 0, 0.2745098, 1,
1.648042, 0.3806136, 1.238308, 1, 0, 0.2705882, 1,
1.653045, 0.681092, 0.861765, 1, 0, 0.2627451, 1,
1.662409, 0.6735481, 2.374582, 1, 0, 0.2588235, 1,
1.663255, 0.2829567, 2.16748, 1, 0, 0.2509804, 1,
1.66554, -1.87054, 3.552, 1, 0, 0.2470588, 1,
1.667497, 0.4354363, 0.1851639, 1, 0, 0.2392157, 1,
1.714994, -1.14977, 4.082315, 1, 0, 0.2352941, 1,
1.724495, 0.7249497, 0.9247954, 1, 0, 0.227451, 1,
1.725933, -2.005524, 2.277428, 1, 0, 0.2235294, 1,
1.760853, -0.3905106, 2.271475, 1, 0, 0.2156863, 1,
1.814893, 0.07048643, 2.125179, 1, 0, 0.2117647, 1,
1.828855, -0.1245889, 2.488214, 1, 0, 0.2039216, 1,
1.838214, 1.0008, 1.651994, 1, 0, 0.1960784, 1,
1.838881, -0.2873358, 2.177964, 1, 0, 0.1921569, 1,
1.841748, 0.03725785, 2.277581, 1, 0, 0.1843137, 1,
1.858252, 2.984379, 1.454689, 1, 0, 0.1803922, 1,
1.87763, -1.004052, 2.400838, 1, 0, 0.172549, 1,
1.889838, -2.160374, 2.189133, 1, 0, 0.1686275, 1,
1.891117, -0.6047882, 3.431245, 1, 0, 0.1607843, 1,
1.952764, -0.9540217, 3.32562, 1, 0, 0.1568628, 1,
1.957066, -0.3300077, 2.04119, 1, 0, 0.1490196, 1,
1.965143, -0.1430447, 2.143114, 1, 0, 0.145098, 1,
1.971607, 2.118032, 1.310985, 1, 0, 0.1372549, 1,
1.984341, 2.443707, 1.97555, 1, 0, 0.1333333, 1,
2.032941, 0.8134406, 1.792822, 1, 0, 0.1254902, 1,
2.038105, -0.4871962, 1.854275, 1, 0, 0.1215686, 1,
2.109017, -0.3425762, 0.7341642, 1, 0, 0.1137255, 1,
2.126522, -0.6274533, 2.029024, 1, 0, 0.1098039, 1,
2.135361, 0.1802924, 1.937171, 1, 0, 0.1019608, 1,
2.157707, -0.5634478, 0.08456506, 1, 0, 0.09411765, 1,
2.186981, 0.6876934, 1.098309, 1, 0, 0.09019608, 1,
2.188273, 0.680527, 1.098427, 1, 0, 0.08235294, 1,
2.201736, 2.273376, -0.02981892, 1, 0, 0.07843138, 1,
2.207432, -1.186077, 1.089716, 1, 0, 0.07058824, 1,
2.234088, 0.5136473, 0.4187962, 1, 0, 0.06666667, 1,
2.276188, -0.04766076, 1.950042, 1, 0, 0.05882353, 1,
2.333026, -0.5481831, 3.023839, 1, 0, 0.05490196, 1,
2.487788, 0.6534598, 0.6167969, 1, 0, 0.04705882, 1,
2.490586, -0.5467607, 1.847306, 1, 0, 0.04313726, 1,
2.602301, -0.4648793, 2.117649, 1, 0, 0.03529412, 1,
2.609856, -0.5582983, 2.396984, 1, 0, 0.03137255, 1,
2.642095, 0.4786155, -0.7138298, 1, 0, 0.02352941, 1,
3.143166, 0.6097643, 0.8128501, 1, 0, 0.01960784, 1,
3.169383, 1.561055, 1.502622, 1, 0, 0.01176471, 1,
3.564649, -1.529748, 2.425728, 1, 0, 0.007843138, 1
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
0.1505988, -3.926862, -7.153679, 0, -0.5, 0.5, 0.5,
0.1505988, -3.926862, -7.153679, 1, -0.5, 0.5, 0.5,
0.1505988, -3.926862, -7.153679, 1, 1.5, 0.5, 0.5,
0.1505988, -3.926862, -7.153679, 0, 1.5, 0.5, 0.5
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
-4.420814, 0.1490201, -7.153679, 0, -0.5, 0.5, 0.5,
-4.420814, 0.1490201, -7.153679, 1, -0.5, 0.5, 0.5,
-4.420814, 0.1490201, -7.153679, 1, 1.5, 0.5, 0.5,
-4.420814, 0.1490201, -7.153679, 0, 1.5, 0.5, 0.5
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
-4.420814, -3.926862, 0.1243515, 0, -0.5, 0.5, 0.5,
-4.420814, -3.926862, 0.1243515, 1, -0.5, 0.5, 0.5,
-4.420814, -3.926862, 0.1243515, 1, 1.5, 0.5, 0.5,
-4.420814, -3.926862, 0.1243515, 0, 1.5, 0.5, 0.5
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
-3, -2.986274, -5.474133,
3, -2.986274, -5.474133,
-3, -2.986274, -5.474133,
-3, -3.143038, -5.754058,
-2, -2.986274, -5.474133,
-2, -3.143038, -5.754058,
-1, -2.986274, -5.474133,
-1, -3.143038, -5.754058,
0, -2.986274, -5.474133,
0, -3.143038, -5.754058,
1, -2.986274, -5.474133,
1, -3.143038, -5.754058,
2, -2.986274, -5.474133,
2, -3.143038, -5.754058,
3, -2.986274, -5.474133,
3, -3.143038, -5.754058
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
-3, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
-3, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
-3, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
-3, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
-2, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
-2, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
-2, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
-2, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
-1, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
-1, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
-1, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
-1, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
0, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
0, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
0, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
0, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
1, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
1, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
1, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
1, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
2, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
2, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
2, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
2, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5,
3, -3.456568, -6.313906, 0, -0.5, 0.5, 0.5,
3, -3.456568, -6.313906, 1, -0.5, 0.5, 0.5,
3, -3.456568, -6.313906, 1, 1.5, 0.5, 0.5,
3, -3.456568, -6.313906, 0, 1.5, 0.5, 0.5
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
-3.365873, -2, -5.474133,
-3.365873, 3, -5.474133,
-3.365873, -2, -5.474133,
-3.541696, -2, -5.754058,
-3.365873, -1, -5.474133,
-3.541696, -1, -5.754058,
-3.365873, 0, -5.474133,
-3.541696, 0, -5.754058,
-3.365873, 1, -5.474133,
-3.541696, 1, -5.754058,
-3.365873, 2, -5.474133,
-3.541696, 2, -5.754058,
-3.365873, 3, -5.474133,
-3.541696, 3, -5.754058
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
-3.893343, -2, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, -2, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, -2, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, -2, -6.313906, 0, 1.5, 0.5, 0.5,
-3.893343, -1, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, -1, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, -1, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, -1, -6.313906, 0, 1.5, 0.5, 0.5,
-3.893343, 0, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, 0, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, 0, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, 0, -6.313906, 0, 1.5, 0.5, 0.5,
-3.893343, 1, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, 1, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, 1, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, 1, -6.313906, 0, 1.5, 0.5, 0.5,
-3.893343, 2, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, 2, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, 2, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, 2, -6.313906, 0, 1.5, 0.5, 0.5,
-3.893343, 3, -6.313906, 0, -0.5, 0.5, 0.5,
-3.893343, 3, -6.313906, 1, -0.5, 0.5, 0.5,
-3.893343, 3, -6.313906, 1, 1.5, 0.5, 0.5,
-3.893343, 3, -6.313906, 0, 1.5, 0.5, 0.5
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
-3.365873, -2.986274, -4,
-3.365873, -2.986274, 4,
-3.365873, -2.986274, -4,
-3.541696, -3.143038, -4,
-3.365873, -2.986274, -2,
-3.541696, -3.143038, -2,
-3.365873, -2.986274, 0,
-3.541696, -3.143038, 0,
-3.365873, -2.986274, 2,
-3.541696, -3.143038, 2,
-3.365873, -2.986274, 4,
-3.541696, -3.143038, 4
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
-3.893343, -3.456568, -4, 0, -0.5, 0.5, 0.5,
-3.893343, -3.456568, -4, 1, -0.5, 0.5, 0.5,
-3.893343, -3.456568, -4, 1, 1.5, 0.5, 0.5,
-3.893343, -3.456568, -4, 0, 1.5, 0.5, 0.5,
-3.893343, -3.456568, -2, 0, -0.5, 0.5, 0.5,
-3.893343, -3.456568, -2, 1, -0.5, 0.5, 0.5,
-3.893343, -3.456568, -2, 1, 1.5, 0.5, 0.5,
-3.893343, -3.456568, -2, 0, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 0, 0, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 0, 1, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 0, 1, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 0, 0, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 2, 0, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 2, 1, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 2, 1, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 2, 0, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 4, 0, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 4, 1, -0.5, 0.5, 0.5,
-3.893343, -3.456568, 4, 1, 1.5, 0.5, 0.5,
-3.893343, -3.456568, 4, 0, 1.5, 0.5, 0.5
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
-3.365873, -2.986274, -5.474133,
-3.365873, 3.284314, -5.474133,
-3.365873, -2.986274, 5.722836,
-3.365873, 3.284314, 5.722836,
-3.365873, -2.986274, -5.474133,
-3.365873, -2.986274, 5.722836,
-3.365873, 3.284314, -5.474133,
-3.365873, 3.284314, 5.722836,
-3.365873, -2.986274, -5.474133,
3.66707, -2.986274, -5.474133,
-3.365873, -2.986274, 5.722836,
3.66707, -2.986274, 5.722836,
-3.365873, 3.284314, -5.474133,
3.66707, 3.284314, -5.474133,
-3.365873, 3.284314, 5.722836,
3.66707, 3.284314, 5.722836,
3.66707, -2.986274, -5.474133,
3.66707, 3.284314, -5.474133,
3.66707, -2.986274, 5.722836,
3.66707, 3.284314, 5.722836,
3.66707, -2.986274, -5.474133,
3.66707, -2.986274, 5.722836,
3.66707, 3.284314, -5.474133,
3.66707, 3.284314, 5.722836
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
var radius = 7.814285;
var distance = 34.76664;
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
mvMatrix.translate( -0.1505988, -0.1490201, -0.1243515 );
mvMatrix.scale( 1.20134, 1.347395, 0.7545754 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76664);
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
bis(trichloromethyl)<-read.table("bis(trichloromethyl).xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bis(trichloromethyl)$V2
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
```

```r
y<-bis(trichloromethyl)$V3
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
```

```r
z<-bis(trichloromethyl)$V4
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
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
-3.263451, -0.7759179, -1.682811, 0, 0, 1, 1, 1,
-2.518087, -0.2517449, -0.6094075, 1, 0, 0, 1, 1,
-2.448969, 0.6201631, -1.166072, 1, 0, 0, 1, 1,
-2.401138, -0.9618393, -2.931441, 1, 0, 0, 1, 1,
-2.395523, 1.037439, -0.73223, 1, 0, 0, 1, 1,
-2.342436, -2.673107, -2.641624, 1, 0, 0, 1, 1,
-2.329463, 2.294763, -0.8084723, 0, 0, 0, 1, 1,
-2.321081, -0.7486942, -2.341449, 0, 0, 0, 1, 1,
-2.302624, -0.4668142, -2.612671, 0, 0, 0, 1, 1,
-2.27981, 0.8152926, -1.811157, 0, 0, 0, 1, 1,
-2.27793, -0.1291694, -1.328536, 0, 0, 0, 1, 1,
-2.227473, -1.477695, -0.4348572, 0, 0, 0, 1, 1,
-2.22082, 0.08328626, -1.617722, 0, 0, 0, 1, 1,
-2.215926, -0.1870692, 1.143684, 1, 1, 1, 1, 1,
-2.199116, -0.5956755, -1.807903, 1, 1, 1, 1, 1,
-2.182371, 0.02032837, -1.125815, 1, 1, 1, 1, 1,
-2.08581, -1.255553, -3.580029, 1, 1, 1, 1, 1,
-2.070061, -1.247685, -2.38357, 1, 1, 1, 1, 1,
-2.019276, -0.6592398, 0.7713016, 1, 1, 1, 1, 1,
-2.018127, 0.08240449, -0.8930451, 1, 1, 1, 1, 1,
-2.005767, -0.9560357, -3.356884, 1, 1, 1, 1, 1,
-2.004421, -0.7605574, -3.018188, 1, 1, 1, 1, 1,
-2.003132, -0.9676127, -2.59665, 1, 1, 1, 1, 1,
-1.98366, 1.571952, -1.866161, 1, 1, 1, 1, 1,
-1.97719, -0.4538675, -2.078461, 1, 1, 1, 1, 1,
-1.926888, 2.641835, -0.7313768, 1, 1, 1, 1, 1,
-1.921558, 0.8348578, -2.051155, 1, 1, 1, 1, 1,
-1.894138, 0.9628661, -1.716715, 1, 1, 1, 1, 1,
-1.847126, -1.281659, -2.834935, 0, 0, 1, 1, 1,
-1.837756, 1.619632, -2.078395, 1, 0, 0, 1, 1,
-1.823319, 0.5317705, -0.8807997, 1, 0, 0, 1, 1,
-1.802273, -1.02277, -3.249645, 1, 0, 0, 1, 1,
-1.797369, 0.178975, -1.850735, 1, 0, 0, 1, 1,
-1.792356, 0.2642906, -1.930248, 1, 0, 0, 1, 1,
-1.785766, 0.2434022, -0.9049276, 0, 0, 0, 1, 1,
-1.783882, 0.94169, 0.3562588, 0, 0, 0, 1, 1,
-1.750432, -0.9955916, -0.8432034, 0, 0, 0, 1, 1,
-1.740904, -0.06876901, -2.103287, 0, 0, 0, 1, 1,
-1.729926, 0.972486, -1.796245, 0, 0, 0, 1, 1,
-1.72736, -0.028658, -2.605139, 0, 0, 0, 1, 1,
-1.716401, -1.656584, -2.21737, 0, 0, 0, 1, 1,
-1.715581, 0.3247593, -0.7171855, 1, 1, 1, 1, 1,
-1.714148, -0.2473615, -1.120224, 1, 1, 1, 1, 1,
-1.698462, -0.9431262, -1.958015, 1, 1, 1, 1, 1,
-1.697447, 0.7951896, -3.468859, 1, 1, 1, 1, 1,
-1.692151, 0.1951581, 1.415425, 1, 1, 1, 1, 1,
-1.665546, -0.7108451, -1.806099, 1, 1, 1, 1, 1,
-1.656472, -2.179533, -3.863128, 1, 1, 1, 1, 1,
-1.655624, -2.023948, -3.028711, 1, 1, 1, 1, 1,
-1.638263, 1.536536, 0.3183955, 1, 1, 1, 1, 1,
-1.63738, 0.09696213, -1.590176, 1, 1, 1, 1, 1,
-1.636708, 1.515584, 0.2210079, 1, 1, 1, 1, 1,
-1.612951, -0.9410886, -1.460014, 1, 1, 1, 1, 1,
-1.610722, 0.9163358, -1.528589, 1, 1, 1, 1, 1,
-1.610088, 0.1455651, -3.348789, 1, 1, 1, 1, 1,
-1.607253, 0.6344265, 0.1591229, 1, 1, 1, 1, 1,
-1.593224, -0.1056104, -1.882762, 0, 0, 1, 1, 1,
-1.590099, 1.244231, -1.158999, 1, 0, 0, 1, 1,
-1.566278, 0.499205, -2.074959, 1, 0, 0, 1, 1,
-1.557619, 0.6658675, -1.380731, 1, 0, 0, 1, 1,
-1.536294, -0.8361088, -2.368716, 1, 0, 0, 1, 1,
-1.521651, -1.191504, -3.01826, 1, 0, 0, 1, 1,
-1.509775, -0.950635, -3.566671, 0, 0, 0, 1, 1,
-1.500995, -2.261281, -1.799223, 0, 0, 0, 1, 1,
-1.497857, -1.07713, -3.013866, 0, 0, 0, 1, 1,
-1.497218, -0.2580593, -2.406711, 0, 0, 0, 1, 1,
-1.493369, -0.927786, -2.452777, 0, 0, 0, 1, 1,
-1.484085, 0.3966155, 0.2291782, 0, 0, 0, 1, 1,
-1.4834, 0.9455566, -2.126514, 0, 0, 0, 1, 1,
-1.477298, -0.7787514, -3.373951, 1, 1, 1, 1, 1,
-1.475073, 1.132359, 0.4305229, 1, 1, 1, 1, 1,
-1.470247, 2.00498, -3.050604, 1, 1, 1, 1, 1,
-1.453283, -0.3588069, -1.672071, 1, 1, 1, 1, 1,
-1.441462, -2.040685, -2.715269, 1, 1, 1, 1, 1,
-1.434771, 0.7722684, -1.177807, 1, 1, 1, 1, 1,
-1.427859, -0.2783495, -1.579054, 1, 1, 1, 1, 1,
-1.424042, 0.9706755, -3.045207, 1, 1, 1, 1, 1,
-1.409963, 0.5807707, -1.288013, 1, 1, 1, 1, 1,
-1.404308, 0.7552527, -2.451532, 1, 1, 1, 1, 1,
-1.395261, 0.4051387, -1.45218, 1, 1, 1, 1, 1,
-1.387518, 0.3730929, -0.7025942, 1, 1, 1, 1, 1,
-1.381668, 0.3425915, -0.6645793, 1, 1, 1, 1, 1,
-1.381528, -0.2072979, -1.334638, 1, 1, 1, 1, 1,
-1.379974, -0.4632068, -1.857151, 1, 1, 1, 1, 1,
-1.377224, -0.2269228, -1.673272, 0, 0, 1, 1, 1,
-1.369553, 0.03480051, -0.5593377, 1, 0, 0, 1, 1,
-1.369039, -1.192838, -2.032647, 1, 0, 0, 1, 1,
-1.361771, -0.01786476, -1.867515, 1, 0, 0, 1, 1,
-1.357782, 0.8095011, 0.05024488, 1, 0, 0, 1, 1,
-1.326223, -0.06019552, -0.9118729, 1, 0, 0, 1, 1,
-1.324435, 0.4336227, -1.471677, 0, 0, 0, 1, 1,
-1.316568, 1.329592, -0.3365399, 0, 0, 0, 1, 1,
-1.312789, -0.8288143, -1.112788, 0, 0, 0, 1, 1,
-1.311, 0.4680875, -2.283191, 0, 0, 0, 1, 1,
-1.310626, -0.9675262, -2.379704, 0, 0, 0, 1, 1,
-1.307679, 0.4657393, -1.657784, 0, 0, 0, 1, 1,
-1.303636, 0.2805693, -2.249795, 0, 0, 0, 1, 1,
-1.294138, 0.1421623, -1.874498, 1, 1, 1, 1, 1,
-1.291716, 0.05764806, -0.8984703, 1, 1, 1, 1, 1,
-1.285717, -0.7623512, -3.972888, 1, 1, 1, 1, 1,
-1.271343, 0.2155774, -3.259942, 1, 1, 1, 1, 1,
-1.268058, 0.2773816, -1.987171, 1, 1, 1, 1, 1,
-1.266135, 0.3416137, -1.721682, 1, 1, 1, 1, 1,
-1.252946, 0.1297308, 0.6938774, 1, 1, 1, 1, 1,
-1.238111, 1.947865, -2.5699, 1, 1, 1, 1, 1,
-1.21439, 0.915044, 0.1117809, 1, 1, 1, 1, 1,
-1.211906, -0.7378749, -2.102724, 1, 1, 1, 1, 1,
-1.208174, 1.152313, 0.973644, 1, 1, 1, 1, 1,
-1.19869, 0.3781523, -1.602229, 1, 1, 1, 1, 1,
-1.196597, -0.1527258, -1.713968, 1, 1, 1, 1, 1,
-1.193371, -0.09279778, -2.096066, 1, 1, 1, 1, 1,
-1.190488, 0.05011572, -0.6146582, 1, 1, 1, 1, 1,
-1.187831, -0.802163, -0.6849317, 0, 0, 1, 1, 1,
-1.184981, 0.3065118, -1.673886, 1, 0, 0, 1, 1,
-1.184495, -1.081292, -1.951339, 1, 0, 0, 1, 1,
-1.177131, 1.077596, 0.3422754, 1, 0, 0, 1, 1,
-1.175279, 1.079058, -1.770063, 1, 0, 0, 1, 1,
-1.173017, 0.4886295, -2.529656, 1, 0, 0, 1, 1,
-1.168736, -2.015648, -2.283604, 0, 0, 0, 1, 1,
-1.16796, 0.07656085, -1.53124, 0, 0, 0, 1, 1,
-1.136445, -0.2165368, -0.04800352, 0, 0, 0, 1, 1,
-1.130479, 0.6432286, -2.420746, 0, 0, 0, 1, 1,
-1.126287, -0.436251, -1.999889, 0, 0, 0, 1, 1,
-1.122832, 1.178728, 0.09143763, 0, 0, 0, 1, 1,
-1.116914, 1.028428, -1.328607, 0, 0, 0, 1, 1,
-1.107054, -1.788182, -4.313476, 1, 1, 1, 1, 1,
-1.106986, 0.4877212, -2.04328, 1, 1, 1, 1, 1,
-1.105436, 0.4159886, -2.378599, 1, 1, 1, 1, 1,
-1.10523, 0.7722748, -3.423908, 1, 1, 1, 1, 1,
-1.096408, 1.116044, -1.501894, 1, 1, 1, 1, 1,
-1.091164, 1.414137, 0.5080317, 1, 1, 1, 1, 1,
-1.089805, -1.084498, -2.772573, 1, 1, 1, 1, 1,
-1.084101, -1.255197, -2.063044, 1, 1, 1, 1, 1,
-1.082672, 0.6579245, -0.1413216, 1, 1, 1, 1, 1,
-1.081758, 0.1832358, -4.038184, 1, 1, 1, 1, 1,
-1.077577, -1.437614, -3.931759, 1, 1, 1, 1, 1,
-1.073367, -0.4234133, -3.212357, 1, 1, 1, 1, 1,
-1.073021, -0.8480751, -3.152109, 1, 1, 1, 1, 1,
-1.07293, 2.425591, -1.27214, 1, 1, 1, 1, 1,
-1.072698, 0.3434322, 0.111891, 1, 1, 1, 1, 1,
-1.068312, 0.6192827, 0.598409, 0, 0, 1, 1, 1,
-1.063912, -0.07256453, -2.768919, 1, 0, 0, 1, 1,
-1.060108, 0.5981143, -0.4150937, 1, 0, 0, 1, 1,
-1.059608, -0.1520574, -1.333883, 1, 0, 0, 1, 1,
-1.058862, 0.8439324, -1.663111, 1, 0, 0, 1, 1,
-1.055836, -0.3968368, -0.9413586, 1, 0, 0, 1, 1,
-1.05179, -0.1880463, -1.82741, 0, 0, 0, 1, 1,
-1.050713, -0.7545089, -0.9063342, 0, 0, 0, 1, 1,
-1.04888, 1.694407, -1.1044, 0, 0, 0, 1, 1,
-1.04109, -1.747976, -2.774474, 0, 0, 0, 1, 1,
-1.039005, 0.5576531, 0.5279474, 0, 0, 0, 1, 1,
-1.033759, 0.155403, 0.5414557, 0, 0, 0, 1, 1,
-1.030532, 0.5050142, -1.697193, 0, 0, 0, 1, 1,
-1.028865, -0.9997622, -0.168969, 1, 1, 1, 1, 1,
-1.023575, -0.8015545, -2.390423, 1, 1, 1, 1, 1,
-1.021841, 0.1606315, -1.662917, 1, 1, 1, 1, 1,
-1.011696, 0.8635461, -0.4461343, 1, 1, 1, 1, 1,
-1.010627, 0.1948433, -1.426404, 1, 1, 1, 1, 1,
-1.009871, 0.5997443, -2.064213, 1, 1, 1, 1, 1,
-0.9951437, 2.015703, -0.4331851, 1, 1, 1, 1, 1,
-0.9933826, 0.851455, -2.189353, 1, 1, 1, 1, 1,
-0.9914762, 0.06098109, -2.02356, 1, 1, 1, 1, 1,
-0.9909285, 0.1188816, -0.05276702, 1, 1, 1, 1, 1,
-0.9903778, 0.7205266, -1.232701, 1, 1, 1, 1, 1,
-0.9879979, -0.6097872, -3.060246, 1, 1, 1, 1, 1,
-0.9831339, -0.2471696, -2.275798, 1, 1, 1, 1, 1,
-0.9697973, -1.679899, -1.019583, 1, 1, 1, 1, 1,
-0.9650392, 0.9342597, -0.9777667, 1, 1, 1, 1, 1,
-0.9556661, 0.3167796, -2.893967, 0, 0, 1, 1, 1,
-0.9473298, -0.01039917, -2.385603, 1, 0, 0, 1, 1,
-0.9361346, -1.488579, -1.296904, 1, 0, 0, 1, 1,
-0.9309651, 0.1336864, -0.7926304, 1, 0, 0, 1, 1,
-0.9277844, 0.8526316, -1.79231, 1, 0, 0, 1, 1,
-0.926791, 0.9149591, -2.729428, 1, 0, 0, 1, 1,
-0.9200711, 0.3292836, -1.698104, 0, 0, 0, 1, 1,
-0.8923594, 0.8642601, -1.881907, 0, 0, 0, 1, 1,
-0.8922644, 0.001399888, -2.821684, 0, 0, 0, 1, 1,
-0.8858916, 0.3519685, -1.620875, 0, 0, 0, 1, 1,
-0.8805002, -0.7851179, -1.592737, 0, 0, 0, 1, 1,
-0.8752223, 0.2943354, -0.5090849, 0, 0, 0, 1, 1,
-0.8746849, 0.1525694, -1.564058, 0, 0, 0, 1, 1,
-0.8743917, -1.765282, -4.345035, 1, 1, 1, 1, 1,
-0.8680922, -0.7372099, -2.296664, 1, 1, 1, 1, 1,
-0.8623812, 0.9553744, 0.6850785, 1, 1, 1, 1, 1,
-0.8616127, 0.2279293, -0.880326, 1, 1, 1, 1, 1,
-0.8611637, 1.136237, -1.348509, 1, 1, 1, 1, 1,
-0.8595014, -0.6580886, -3.43943, 1, 1, 1, 1, 1,
-0.8579404, 0.935919, -2.219626, 1, 1, 1, 1, 1,
-0.8543949, 0.3597915, -1.686059, 1, 1, 1, 1, 1,
-0.8531396, 1.098043, -0.4273022, 1, 1, 1, 1, 1,
-0.8474225, 0.9074978, -1.847165, 1, 1, 1, 1, 1,
-0.8373092, -0.6849021, -2.240455, 1, 1, 1, 1, 1,
-0.8295106, 0.8182246, -0.3428302, 1, 1, 1, 1, 1,
-0.816878, 1.327808, -1.835525, 1, 1, 1, 1, 1,
-0.8136939, 0.09871153, -1.893415, 1, 1, 1, 1, 1,
-0.8122858, -0.09668804, -1.000796, 1, 1, 1, 1, 1,
-0.8109278, -1.334844, -2.276345, 0, 0, 1, 1, 1,
-0.8022727, 0.135595, -4.503569, 1, 0, 0, 1, 1,
-0.7994214, 0.1789483, -1.223724, 1, 0, 0, 1, 1,
-0.7989291, -0.646504, -1.587478, 1, 0, 0, 1, 1,
-0.7882125, 0.1702243, -1.077734, 1, 0, 0, 1, 1,
-0.7858463, 1.263541, -2.77382, 1, 0, 0, 1, 1,
-0.7789165, -0.9589762, -3.411931, 0, 0, 0, 1, 1,
-0.7734238, 2.233509, 0.2431271, 0, 0, 0, 1, 1,
-0.7692388, 0.2677941, -2.520715, 0, 0, 0, 1, 1,
-0.7685537, 0.1902612, -0.06288158, 0, 0, 0, 1, 1,
-0.7643683, -0.8242428, -1.644406, 0, 0, 0, 1, 1,
-0.7619756, 0.8022089, 0.08035412, 0, 0, 0, 1, 1,
-0.7613151, 0.3535449, -0.3819381, 0, 0, 0, 1, 1,
-0.7598432, -2.007477, -2.70315, 1, 1, 1, 1, 1,
-0.758007, -1.181636, -3.997349, 1, 1, 1, 1, 1,
-0.7529227, -0.8486944, -3.93783, 1, 1, 1, 1, 1,
-0.7509008, -0.9018133, -2.24586, 1, 1, 1, 1, 1,
-0.746301, -2.160007, -4.022256, 1, 1, 1, 1, 1,
-0.7436977, -0.682532, -2.444648, 1, 1, 1, 1, 1,
-0.7420831, -1.875126, -1.233396, 1, 1, 1, 1, 1,
-0.7400002, -1.409693, -4.94632, 1, 1, 1, 1, 1,
-0.738681, -0.6943301, -1.703007, 1, 1, 1, 1, 1,
-0.7250807, -1.695778, -4.496741, 1, 1, 1, 1, 1,
-0.7239246, 1.435759, -1.04616, 1, 1, 1, 1, 1,
-0.7230948, -0.02150456, -1.822291, 1, 1, 1, 1, 1,
-0.719152, 0.6840742, -1.146092, 1, 1, 1, 1, 1,
-0.7135158, 1.026034, -1.228046, 1, 1, 1, 1, 1,
-0.7114846, 0.4986317, -0.7016762, 1, 1, 1, 1, 1,
-0.711099, 0.3045855, -1.513917, 0, 0, 1, 1, 1,
-0.7101744, -0.266174, -2.686074, 1, 0, 0, 1, 1,
-0.7020208, -1.41136, -1.75474, 1, 0, 0, 1, 1,
-0.701792, 0.2225167, -2.237046, 1, 0, 0, 1, 1,
-0.7010722, -0.7997901, -0.8740988, 1, 0, 0, 1, 1,
-0.6977681, -0.7840887, -2.716151, 1, 0, 0, 1, 1,
-0.6968785, -2.03005, -3.097395, 0, 0, 0, 1, 1,
-0.6924708, 1.179883, -0.05258671, 0, 0, 0, 1, 1,
-0.686096, -0.4336795, -1.666333, 0, 0, 0, 1, 1,
-0.6849463, 1.394221, 0.1961971, 0, 0, 0, 1, 1,
-0.6840886, 0.8108546, -0.7429411, 0, 0, 0, 1, 1,
-0.6778408, -1.21137, -1.499822, 0, 0, 0, 1, 1,
-0.6680496, -0.1117705, -1.231485, 0, 0, 0, 1, 1,
-0.6636662, 0.4015617, -0.6724285, 1, 1, 1, 1, 1,
-0.6632516, 0.2407007, -1.216101, 1, 1, 1, 1, 1,
-0.6626727, 0.3012224, -1.371755, 1, 1, 1, 1, 1,
-0.6625437, -0.06425592, -3.310515, 1, 1, 1, 1, 1,
-0.6622426, -1.49005, -3.837254, 1, 1, 1, 1, 1,
-0.6578023, -0.1573457, -1.237099, 1, 1, 1, 1, 1,
-0.657011, -0.2506439, -0.6002796, 1, 1, 1, 1, 1,
-0.6564526, -1.603979, -4.428535, 1, 1, 1, 1, 1,
-0.649502, 0.05976431, -1.948458, 1, 1, 1, 1, 1,
-0.6475869, -0.09621121, 0.2421971, 1, 1, 1, 1, 1,
-0.647045, -2.035286, -2.63137, 1, 1, 1, 1, 1,
-0.6451511, -0.6504139, -1.970398, 1, 1, 1, 1, 1,
-0.6447603, -0.6009957, -1.533614, 1, 1, 1, 1, 1,
-0.6438439, -1.909183, -3.083055, 1, 1, 1, 1, 1,
-0.6429844, 0.3564184, 0.3314473, 1, 1, 1, 1, 1,
-0.6405922, -2.185902, -3.653091, 0, 0, 1, 1, 1,
-0.6382332, -0.3715574, -3.63361, 1, 0, 0, 1, 1,
-0.6378806, -1.155075, -3.274281, 1, 0, 0, 1, 1,
-0.6374846, -0.443278, -2.17108, 1, 0, 0, 1, 1,
-0.6369131, -1.162156, -3.223871, 1, 0, 0, 1, 1,
-0.6346999, 0.2489895, -0.633173, 1, 0, 0, 1, 1,
-0.6316202, 0.8002213, -0.5419348, 0, 0, 0, 1, 1,
-0.6312084, -1.198111, -3.735803, 0, 0, 0, 1, 1,
-0.6245012, 0.8317032, -1.30643, 0, 0, 0, 1, 1,
-0.6238211, 0.8892408, -0.1415571, 0, 0, 0, 1, 1,
-0.6185242, 0.7852207, -2.030296, 0, 0, 0, 1, 1,
-0.6124372, -0.466408, -1.548506, 0, 0, 0, 1, 1,
-0.6103975, -1.002027, -4.465915, 0, 0, 0, 1, 1,
-0.610237, 0.9908435, -1.263186, 1, 1, 1, 1, 1,
-0.5962469, -0.7394961, -2.406672, 1, 1, 1, 1, 1,
-0.5945909, 0.334928, 0.3100113, 1, 1, 1, 1, 1,
-0.5943458, -1.085599, -0.4518062, 1, 1, 1, 1, 1,
-0.5941009, 0.4132796, -0.5153255, 1, 1, 1, 1, 1,
-0.5864049, -0.5433496, -0.6830925, 1, 1, 1, 1, 1,
-0.5835475, 0.5123057, -0.1114641, 1, 1, 1, 1, 1,
-0.5792604, 0.5994347, -0.3258625, 1, 1, 1, 1, 1,
-0.5733713, 0.7106371, -1.592301, 1, 1, 1, 1, 1,
-0.5695011, 0.1497899, 0.8996245, 1, 1, 1, 1, 1,
-0.5694108, -0.6482028, -3.734675, 1, 1, 1, 1, 1,
-0.5688281, 0.8024502, -0.6866076, 1, 1, 1, 1, 1,
-0.566237, -0.04277894, -1.443813, 1, 1, 1, 1, 1,
-0.5650738, -0.9709038, -2.029784, 1, 1, 1, 1, 1,
-0.564629, 0.5562749, -0.1427184, 1, 1, 1, 1, 1,
-0.5622219, 0.6785474, -1.630311, 0, 0, 1, 1, 1,
-0.5603507, -0.03290251, -1.721288, 1, 0, 0, 1, 1,
-0.5583717, 1.081018, 1.079111, 1, 0, 0, 1, 1,
-0.5517071, -0.5902461, -2.831017, 1, 0, 0, 1, 1,
-0.5444828, 2.037898, -0.7760981, 1, 0, 0, 1, 1,
-0.5437025, -0.4667901, -2.033534, 1, 0, 0, 1, 1,
-0.5434936, -0.7392147, -0.9781563, 0, 0, 0, 1, 1,
-0.5428798, -1.110948, -1.181311, 0, 0, 0, 1, 1,
-0.5420497, 1.807645, -0.8319936, 0, 0, 0, 1, 1,
-0.5398623, 2.071744, -1.72366, 0, 0, 0, 1, 1,
-0.5387854, -0.3789525, -3.056701, 0, 0, 0, 1, 1,
-0.5305198, 1.346497, -0.1391247, 0, 0, 0, 1, 1,
-0.5268056, -0.1712862, -1.841777, 0, 0, 0, 1, 1,
-0.5262347, -0.3993013, -2.082991, 1, 1, 1, 1, 1,
-0.5260554, 0.659681, 1.158891, 1, 1, 1, 1, 1,
-0.5258346, 0.7237578, -0.2880316, 1, 1, 1, 1, 1,
-0.5258026, -0.006502665, 0.8721562, 1, 1, 1, 1, 1,
-0.523132, -0.01115108, -0.03560659, 1, 1, 1, 1, 1,
-0.5152305, -0.5875335, -3.746238, 1, 1, 1, 1, 1,
-0.5124961, 0.98886, -0.04204307, 1, 1, 1, 1, 1,
-0.5119196, -1.044235, -2.043427, 1, 1, 1, 1, 1,
-0.5107535, 0.7621765, -0.5768203, 1, 1, 1, 1, 1,
-0.5088969, -0.3975755, -2.617036, 1, 1, 1, 1, 1,
-0.5086371, 0.2685483, -1.520768, 1, 1, 1, 1, 1,
-0.5041313, -0.9400322, -2.945946, 1, 1, 1, 1, 1,
-0.5026743, -1.654408, -3.219925, 1, 1, 1, 1, 1,
-0.4986042, -0.6426057, -1.415312, 1, 1, 1, 1, 1,
-0.4984851, 1.012733, -0.7352472, 1, 1, 1, 1, 1,
-0.4973941, -0.7981746, -2.483629, 0, 0, 1, 1, 1,
-0.497064, 0.1457694, -0.9589854, 1, 0, 0, 1, 1,
-0.4903402, -0.1005667, -0.7767104, 1, 0, 0, 1, 1,
-0.4892238, -1.233057, -1.36263, 1, 0, 0, 1, 1,
-0.488226, 1.164807, -0.2457075, 1, 0, 0, 1, 1,
-0.487588, 1.848997, -0.115123, 1, 0, 0, 1, 1,
-0.4776367, -0.01768143, -1.252799, 0, 0, 0, 1, 1,
-0.4736955, -0.2496195, -1.316851, 0, 0, 0, 1, 1,
-0.4736335, 1.233776, -0.6322092, 0, 0, 0, 1, 1,
-0.4734023, -0.3155773, -2.617094, 0, 0, 0, 1, 1,
-0.473328, -0.2882596, -1.56665, 0, 0, 0, 1, 1,
-0.471507, -0.2153761, -1.160624, 0, 0, 0, 1, 1,
-0.4690848, -0.3986038, -4.559429, 0, 0, 0, 1, 1,
-0.4686238, -0.8492236, -1.661667, 1, 1, 1, 1, 1,
-0.4667909, 0.3105418, -0.2814342, 1, 1, 1, 1, 1,
-0.465709, -1.290347, 0.3770509, 1, 1, 1, 1, 1,
-0.4633456, -1.455062, -4.160411, 1, 1, 1, 1, 1,
-0.4519022, 0.4103004, -0.9559272, 1, 1, 1, 1, 1,
-0.4501667, 0.2466969, -1.607046, 1, 1, 1, 1, 1,
-0.43937, 0.8564149, 0.5743931, 1, 1, 1, 1, 1,
-0.4333174, -1.093395, -5.311071, 1, 1, 1, 1, 1,
-0.4260701, -0.6022799, -3.618666, 1, 1, 1, 1, 1,
-0.4255358, -1.050089, -3.673495, 1, 1, 1, 1, 1,
-0.42534, 0.09702954, -2.171405, 1, 1, 1, 1, 1,
-0.4240592, -0.6812339, -1.272797, 1, 1, 1, 1, 1,
-0.4224225, -1.289135, -2.458417, 1, 1, 1, 1, 1,
-0.4215745, 0.06253892, -1.175377, 1, 1, 1, 1, 1,
-0.4206192, 0.02949345, -0.9530876, 1, 1, 1, 1, 1,
-0.4204505, 1.855601, 2.404635, 0, 0, 1, 1, 1,
-0.4187267, 2.229472, -1.749865, 1, 0, 0, 1, 1,
-0.4139878, 0.7219315, -0.8190449, 1, 0, 0, 1, 1,
-0.4138223, 0.05594151, -0.1179739, 1, 0, 0, 1, 1,
-0.4055406, 1.181221, -0.8093948, 1, 0, 0, 1, 1,
-0.4048472, 0.9663264, -0.4803719, 1, 0, 0, 1, 1,
-0.4026588, -1.285838, -3.487157, 0, 0, 0, 1, 1,
-0.4009782, 3.192995, -0.6587553, 0, 0, 0, 1, 1,
-0.3875264, -0.9681274, -3.056842, 0, 0, 0, 1, 1,
-0.3841221, 0.8927973, -0.4637304, 0, 0, 0, 1, 1,
-0.3815777, -0.8211098, -3.988058, 0, 0, 0, 1, 1,
-0.3780123, -0.120604, -0.547861, 0, 0, 0, 1, 1,
-0.3764662, 1.576017, 0.2345497, 0, 0, 0, 1, 1,
-0.3694472, -1.012041, -2.511054, 1, 1, 1, 1, 1,
-0.3684059, 0.911415, -1.982563, 1, 1, 1, 1, 1,
-0.3625862, 0.2501451, -1.250384, 1, 1, 1, 1, 1,
-0.360077, -0.05266553, -0.7540618, 1, 1, 1, 1, 1,
-0.3586585, 0.2776111, -0.4673299, 1, 1, 1, 1, 1,
-0.357985, -0.1685698, -1.662297, 1, 1, 1, 1, 1,
-0.3566957, -1.33456, -3.669319, 1, 1, 1, 1, 1,
-0.3534105, 2.187084, 0.4047599, 1, 1, 1, 1, 1,
-0.3515729, -0.6405717, -3.259775, 1, 1, 1, 1, 1,
-0.3513012, 1.318477, -1.584353, 1, 1, 1, 1, 1,
-0.3473331, 2.057228, -0.996492, 1, 1, 1, 1, 1,
-0.346586, 0.4926151, -1.938808, 1, 1, 1, 1, 1,
-0.3387309, -1.228424, -3.259388, 1, 1, 1, 1, 1,
-0.3374974, -0.5905229, -3.83283, 1, 1, 1, 1, 1,
-0.3336825, -0.1819423, -3.419204, 1, 1, 1, 1, 1,
-0.3308807, 1.376191, 0.3227931, 0, 0, 1, 1, 1,
-0.3295437, -1.544468, -1.579618, 1, 0, 0, 1, 1,
-0.3217982, 0.2461981, -0.7772163, 1, 0, 0, 1, 1,
-0.3190053, 0.8059844, 0.7988034, 1, 0, 0, 1, 1,
-0.3168235, 0.2971105, 0.1582735, 1, 0, 0, 1, 1,
-0.3167429, 0.2115612, -1.12119, 1, 0, 0, 1, 1,
-0.3158678, -0.2559744, -3.445943, 0, 0, 0, 1, 1,
-0.3085561, -0.6457837, -2.275018, 0, 0, 0, 1, 1,
-0.3075959, 0.9892744, -0.4202842, 0, 0, 0, 1, 1,
-0.305897, 0.3095046, -0.9075489, 0, 0, 0, 1, 1,
-0.3048241, -0.5749769, -1.035088, 0, 0, 0, 1, 1,
-0.2997339, 0.7541278, 0.9399182, 0, 0, 0, 1, 1,
-0.2989713, 0.335122, 0.1788818, 0, 0, 0, 1, 1,
-0.2969543, 0.141877, -1.96969, 1, 1, 1, 1, 1,
-0.2968778, 0.8411145, 0.6324691, 1, 1, 1, 1, 1,
-0.2964471, -2.864276, -3.280588, 1, 1, 1, 1, 1,
-0.2959244, -0.9738291, -2.782257, 1, 1, 1, 1, 1,
-0.293062, 1.18061, 0.2111893, 1, 1, 1, 1, 1,
-0.2869718, 1.801804, 0.8199088, 1, 1, 1, 1, 1,
-0.286439, -0.6524089, -1.440556, 1, 1, 1, 1, 1,
-0.2850901, -1.291415, -4.501612, 1, 1, 1, 1, 1,
-0.2826487, -0.6838344, -2.460618, 1, 1, 1, 1, 1,
-0.2816251, 1.962487, 0.3175389, 1, 1, 1, 1, 1,
-0.2804959, -0.19698, -4.204826, 1, 1, 1, 1, 1,
-0.274707, 0.2346704, -1.724193, 1, 1, 1, 1, 1,
-0.2735472, 1.821643, 1.222955, 1, 1, 1, 1, 1,
-0.2722766, 0.1445688, 0.1376264, 1, 1, 1, 1, 1,
-0.2717274, 1.645058, 0.1132247, 1, 1, 1, 1, 1,
-0.2696999, 1.311181, -1.06586, 0, 0, 1, 1, 1,
-0.2674594, -1.649488, -3.309628, 1, 0, 0, 1, 1,
-0.2664109, -1.125183, -0.143987, 1, 0, 0, 1, 1,
-0.2586925, -0.002381484, -2.326415, 1, 0, 0, 1, 1,
-0.2575085, -0.6052896, -3.016038, 1, 0, 0, 1, 1,
-0.2535394, 0.7815536, 0.3452177, 1, 0, 0, 1, 1,
-0.2526594, 0.01123456, -0.2134602, 0, 0, 0, 1, 1,
-0.2515752, 0.7704948, -0.4934797, 0, 0, 0, 1, 1,
-0.2500798, 1.223832, -0.3894866, 0, 0, 0, 1, 1,
-0.2452605, -1.365776, -2.882053, 0, 0, 0, 1, 1,
-0.2387442, -1.678833, -1.730628, 0, 0, 0, 1, 1,
-0.2322427, -0.2819055, -3.962416, 0, 0, 0, 1, 1,
-0.2317168, -1.395669, -0.8344421, 0, 0, 0, 1, 1,
-0.2278599, -0.7106177, -4.165741, 1, 1, 1, 1, 1,
-0.2274643, 0.5956787, -0.9577324, 1, 1, 1, 1, 1,
-0.2263802, -0.1761535, -4.588548, 1, 1, 1, 1, 1,
-0.2148117, -0.2216135, -2.556023, 1, 1, 1, 1, 1,
-0.2116669, -0.5314395, -2.885386, 1, 1, 1, 1, 1,
-0.2074599, 0.1672549, -1.955624, 1, 1, 1, 1, 1,
-0.2059874, 0.5678832, 0.4675941, 1, 1, 1, 1, 1,
-0.2053252, -1.109768, -1.324863, 1, 1, 1, 1, 1,
-0.202891, 1.635121, 1.698715, 1, 1, 1, 1, 1,
-0.2027192, 0.046862, -0.5942453, 1, 1, 1, 1, 1,
-0.1982195, -0.0401818, -2.253278, 1, 1, 1, 1, 1,
-0.1949715, 0.8272867, 1.811438, 1, 1, 1, 1, 1,
-0.19427, -0.9742104, -1.950025, 1, 1, 1, 1, 1,
-0.1926892, -0.1503763, -2.621382, 1, 1, 1, 1, 1,
-0.1922743, 0.1845407, -1.673455, 1, 1, 1, 1, 1,
-0.1918272, -0.8544196, -4.672348, 0, 0, 1, 1, 1,
-0.1907062, 2.603329, -0.8342814, 1, 0, 0, 1, 1,
-0.1883926, 1.427622, -1.078754, 1, 0, 0, 1, 1,
-0.1860581, -0.2022486, -2.050517, 1, 0, 0, 1, 1,
-0.1854493, -0.6574512, -1.606808, 1, 0, 0, 1, 1,
-0.1849706, -0.8930863, -3.359095, 1, 0, 0, 1, 1,
-0.1845933, 0.2095807, 0.7607989, 0, 0, 0, 1, 1,
-0.1809303, 0.242321, -2.436342, 0, 0, 0, 1, 1,
-0.1797333, 0.3091809, 1.567861, 0, 0, 0, 1, 1,
-0.1795271, -0.3368186, -3.77657, 0, 0, 0, 1, 1,
-0.1781519, 0.4252936, 0.3901526, 0, 0, 0, 1, 1,
-0.1771176, 0.9801432, -0.9521601, 0, 0, 0, 1, 1,
-0.1704675, 0.4701645, -1.405149, 0, 0, 0, 1, 1,
-0.1609907, -0.5402325, -2.301127, 1, 1, 1, 1, 1,
-0.1603703, 0.02804927, -1.44482, 1, 1, 1, 1, 1,
-0.1596782, 0.3298265, -2.711572, 1, 1, 1, 1, 1,
-0.159654, 2.009514, -0.5286889, 1, 1, 1, 1, 1,
-0.1567386, -1.312168, -4.433589, 1, 1, 1, 1, 1,
-0.1513438, 0.7137698, -2.62684, 1, 1, 1, 1, 1,
-0.1441156, -1.321621, -2.565057, 1, 1, 1, 1, 1,
-0.1373092, -1.897561, -4.420502, 1, 1, 1, 1, 1,
-0.1348645, 1.182106, -1.209009, 1, 1, 1, 1, 1,
-0.1348442, -0.02102149, -1.775101, 1, 1, 1, 1, 1,
-0.1293315, -0.7365474, -2.800893, 1, 1, 1, 1, 1,
-0.1285948, 1.100348, 0.6994973, 1, 1, 1, 1, 1,
-0.1277505, -0.8012431, -2.591558, 1, 1, 1, 1, 1,
-0.1204519, 1.370528, 1.031418, 1, 1, 1, 1, 1,
-0.1191, -0.8327152, -4.02364, 1, 1, 1, 1, 1,
-0.1190543, -0.3569938, -1.555365, 0, 0, 1, 1, 1,
-0.1151784, -0.2093859, -3.429224, 1, 0, 0, 1, 1,
-0.1145002, 0.668285, -0.1157938, 1, 0, 0, 1, 1,
-0.111668, -1.365069, -3.797979, 1, 0, 0, 1, 1,
-0.109463, -0.3840736, -4.416353, 1, 0, 0, 1, 1,
-0.1079283, 0.2854654, -0.4416274, 1, 0, 0, 1, 1,
-0.09946835, -1.53603, -3.195826, 0, 0, 0, 1, 1,
-0.09843351, 0.3783231, -0.6022904, 0, 0, 0, 1, 1,
-0.09294266, 0.2580013, -0.7788699, 0, 0, 0, 1, 1,
-0.08788437, -0.5727594, -3.879054, 0, 0, 0, 1, 1,
-0.08478165, -0.6664113, -0.2464836, 0, 0, 0, 1, 1,
-0.08136676, -1.244854, -3.761269, 0, 0, 0, 1, 1,
-0.08136497, -1.38751, -2.874421, 0, 0, 0, 1, 1,
-0.08025154, -0.687561, -2.503919, 1, 1, 1, 1, 1,
-0.07653196, 2.206473, -1.066939, 1, 1, 1, 1, 1,
-0.07368867, -0.5598633, -3.882293, 1, 1, 1, 1, 1,
-0.07217326, -0.1028256, -3.370618, 1, 1, 1, 1, 1,
-0.07009071, -0.6634471, -2.232199, 1, 1, 1, 1, 1,
-0.06729724, -0.1872333, -2.257418, 1, 1, 1, 1, 1,
-0.06548682, 0.5735488, 1.127251, 1, 1, 1, 1, 1,
-0.06505401, 0.6013173, -0.4942415, 1, 1, 1, 1, 1,
-0.06380073, -1.32583, -3.461154, 1, 1, 1, 1, 1,
-0.06106139, -0.3252573, -3.14659, 1, 1, 1, 1, 1,
-0.05930398, -0.6265265, -3.269133, 1, 1, 1, 1, 1,
-0.05824362, -0.1482286, -2.086071, 1, 1, 1, 1, 1,
-0.05749243, -0.4381232, -2.825515, 1, 1, 1, 1, 1,
-0.05726659, -0.2131829, -3.886009, 1, 1, 1, 1, 1,
-0.05423187, -0.3663079, -4.681083, 1, 1, 1, 1, 1,
-0.05411198, -1.390329, -2.573379, 0, 0, 1, 1, 1,
-0.05315845, -1.151078, -1.992064, 1, 0, 0, 1, 1,
-0.05031624, -0.995129, -1.623202, 1, 0, 0, 1, 1,
-0.049387, -0.4138608, -3.037808, 1, 0, 0, 1, 1,
-0.04639123, 0.8735906, 0.2698785, 1, 0, 0, 1, 1,
-0.04610863, -1.569527, -2.177239, 1, 0, 0, 1, 1,
-0.04054045, 0.8549815, -0.0936287, 0, 0, 0, 1, 1,
-0.04050223, 0.3590736, -1.350006, 0, 0, 0, 1, 1,
-0.04010275, -1.067693, -1.79203, 0, 0, 0, 1, 1,
-0.03612867, -1.683745, -2.412176, 0, 0, 0, 1, 1,
-0.03393642, -0.5155667, -3.876873, 0, 0, 0, 1, 1,
-0.03237709, -0.6604144, -2.374386, 0, 0, 0, 1, 1,
-0.02689312, 0.1199036, -0.5023817, 0, 0, 0, 1, 1,
-0.02582938, -0.3842097, -4.196171, 1, 1, 1, 1, 1,
-0.02188162, 0.6079935, 0.8966837, 1, 1, 1, 1, 1,
-0.01982326, 0.4675551, 0.6998562, 1, 1, 1, 1, 1,
-0.01950455, 0.2816373, 0.3694836, 1, 1, 1, 1, 1,
-0.01760149, 0.9087758, -0.3588723, 1, 1, 1, 1, 1,
-0.01196439, -2.432443, -1.732835, 1, 1, 1, 1, 1,
-0.001120148, -2.420635, -4.497795, 1, 1, 1, 1, 1,
0.001535345, -2.185499, 2.644317, 1, 1, 1, 1, 1,
0.002329581, 2.171262, 1.187116, 1, 1, 1, 1, 1,
0.003192637, -0.6357222, 4.170524, 1, 1, 1, 1, 1,
0.004144436, -0.4798306, 2.963643, 1, 1, 1, 1, 1,
0.004747665, 0.4114013, 1.689795, 1, 1, 1, 1, 1,
0.005669065, 0.7328715, -1.032395, 1, 1, 1, 1, 1,
0.005733414, -1.197953, 4.276217, 1, 1, 1, 1, 1,
0.007090906, -0.2097404, 2.246612, 1, 1, 1, 1, 1,
0.009231091, 1.150092, 0.1002987, 0, 0, 1, 1, 1,
0.01155402, -1.000873, 3.554619, 1, 0, 0, 1, 1,
0.01735367, 0.1320635, 1.970753, 1, 0, 0, 1, 1,
0.01932513, -0.9298275, 2.355001, 1, 0, 0, 1, 1,
0.02249737, 0.1592174, 1.358422, 1, 0, 0, 1, 1,
0.02303759, 0.6948819, 0.6799114, 1, 0, 0, 1, 1,
0.02327996, -0.06962629, 3.580444, 0, 0, 0, 1, 1,
0.02343652, 0.2192465, -1.050929, 0, 0, 0, 1, 1,
0.02403022, -0.8306317, 3.528645, 0, 0, 0, 1, 1,
0.03060882, 0.3485593, -0.2614019, 0, 0, 0, 1, 1,
0.03418969, -0.6389745, 2.182752, 0, 0, 0, 1, 1,
0.03559451, 0.3834091, 0.6756374, 0, 0, 0, 1, 1,
0.03881656, -0.02687401, 2.300884, 0, 0, 0, 1, 1,
0.03900452, 2.327292, 1.36055, 1, 1, 1, 1, 1,
0.0392115, 1.319001, -0.1009567, 1, 1, 1, 1, 1,
0.0407127, -0.4195972, 2.157166, 1, 1, 1, 1, 1,
0.04242895, -1.363273, 4.572556, 1, 1, 1, 1, 1,
0.0425543, -0.1348556, 0.6251113, 1, 1, 1, 1, 1,
0.04524951, 0.3265502, 0.2201683, 1, 1, 1, 1, 1,
0.04540635, 0.5957811, 1.42575, 1, 1, 1, 1, 1,
0.04969245, 1.265965, -1.845894, 1, 1, 1, 1, 1,
0.05111007, -0.639415, 2.649868, 1, 1, 1, 1, 1,
0.05276612, -0.8032363, 3.803915, 1, 1, 1, 1, 1,
0.05292033, 0.5206045, 1.872075, 1, 1, 1, 1, 1,
0.05800352, 0.5689912, 0.828337, 1, 1, 1, 1, 1,
0.06375059, -0.6956719, 2.972235, 1, 1, 1, 1, 1,
0.06379479, 0.6451665, 1.83254, 1, 1, 1, 1, 1,
0.06432633, -0.2512297, 3.225314, 1, 1, 1, 1, 1,
0.06459129, -0.07376392, 2.237861, 0, 0, 1, 1, 1,
0.06557142, -2.225216, 3.239759, 1, 0, 0, 1, 1,
0.06725662, 0.2776394, -0.294852, 1, 0, 0, 1, 1,
0.07502022, 1.290003, 0.10684, 1, 0, 0, 1, 1,
0.07951897, 1.711926, -1.773904, 1, 0, 0, 1, 1,
0.08063499, -0.5542915, 2.466816, 1, 0, 0, 1, 1,
0.08431231, -0.4790902, 4.058859, 0, 0, 0, 1, 1,
0.08686914, -1.090507, 3.015907, 0, 0, 0, 1, 1,
0.08903207, 0.3264314, 1.019368, 0, 0, 0, 1, 1,
0.0913301, -0.1866334, 2.590355, 0, 0, 0, 1, 1,
0.0918562, -0.1412902, 1.847899, 0, 0, 0, 1, 1,
0.09239084, -0.927471, 2.732013, 0, 0, 0, 1, 1,
0.09468178, 0.1776487, 1.190385, 0, 0, 0, 1, 1,
0.0951052, 0.2117213, 0.4227103, 1, 1, 1, 1, 1,
0.09929384, -0.07983154, 2.881384, 1, 1, 1, 1, 1,
0.09997915, -0.4897844, 3.35899, 1, 1, 1, 1, 1,
0.1028999, -0.9363534, 0.8407761, 1, 1, 1, 1, 1,
0.1093516, -0.747806, 3.214398, 1, 1, 1, 1, 1,
0.1096382, 0.7200369, 1.61963, 1, 1, 1, 1, 1,
0.1096824, 0.2238883, 0.1924938, 1, 1, 1, 1, 1,
0.1105637, -0.435962, 2.037577, 1, 1, 1, 1, 1,
0.114395, 0.6002866, -0.8076184, 1, 1, 1, 1, 1,
0.1148226, -0.5086446, 2.655068, 1, 1, 1, 1, 1,
0.1161858, 0.6757644, 0.9651089, 1, 1, 1, 1, 1,
0.1190506, -0.8500599, 2.650122, 1, 1, 1, 1, 1,
0.1217767, 1.732963, -0.5156844, 1, 1, 1, 1, 1,
0.1246361, 1.689075, -0.7224683, 1, 1, 1, 1, 1,
0.1269817, -1.430168, 1.837118, 1, 1, 1, 1, 1,
0.1271161, 0.4467559, 2.3218, 0, 0, 1, 1, 1,
0.1319212, 0.2448674, 0.6116203, 1, 0, 0, 1, 1,
0.1319491, -0.3101407, 3.002294, 1, 0, 0, 1, 1,
0.1329772, 2.278915, 0.6582987, 1, 0, 0, 1, 1,
0.1348725, -0.8515463, 1.833633, 1, 0, 0, 1, 1,
0.1350592, 0.168598, 1.279754, 1, 0, 0, 1, 1,
0.1416172, -0.2898666, 2.71971, 0, 0, 0, 1, 1,
0.1434669, 0.8341745, -0.2353174, 0, 0, 0, 1, 1,
0.1437414, -0.5616894, 0.4688426, 0, 0, 0, 1, 1,
0.1448963, 0.06619938, 0.09383449, 0, 0, 0, 1, 1,
0.1460923, 0.2787798, -0.9183584, 0, 0, 0, 1, 1,
0.1469443, -1.483426, 5.262721, 0, 0, 0, 1, 1,
0.152521, 0.1102636, 2.030279, 0, 0, 0, 1, 1,
0.1543592, 2.389144, 0.5379006, 1, 1, 1, 1, 1,
0.162375, 0.1050867, -0.1306928, 1, 1, 1, 1, 1,
0.1624599, 0.5231087, -0.8454022, 1, 1, 1, 1, 1,
0.1675134, -1.736629, 2.779442, 1, 1, 1, 1, 1,
0.1723991, 0.6232532, 0.4629883, 1, 1, 1, 1, 1,
0.1732216, 1.162653, 0.9418102, 1, 1, 1, 1, 1,
0.1745913, -0.4202615, 2.680654, 1, 1, 1, 1, 1,
0.1764439, -0.9963872, 2.565986, 1, 1, 1, 1, 1,
0.1818594, 1.612381, 1.190927, 1, 1, 1, 1, 1,
0.1832325, -0.8672187, 2.614703, 1, 1, 1, 1, 1,
0.1865316, -0.5054002, 2.768845, 1, 1, 1, 1, 1,
0.1872961, -0.7151226, 2.170579, 1, 1, 1, 1, 1,
0.1973421, -1.114576, 4.343197, 1, 1, 1, 1, 1,
0.1982049, 0.6668361, 2.079707, 1, 1, 1, 1, 1,
0.2007504, 0.06525329, 0.8686968, 1, 1, 1, 1, 1,
0.2024572, 0.1105019, 1.202137, 0, 0, 1, 1, 1,
0.2027909, 1.378644, 0.2542831, 1, 0, 0, 1, 1,
0.2061498, -0.4069062, 2.173169, 1, 0, 0, 1, 1,
0.2097784, -0.2745625, 3.413906, 1, 0, 0, 1, 1,
0.2114575, -0.5157998, 3.531217, 1, 0, 0, 1, 1,
0.2136986, -1.677413, 2.425674, 1, 0, 0, 1, 1,
0.2159163, 0.08418906, 0.430275, 0, 0, 0, 1, 1,
0.2196498, -0.02227465, 1.783832, 0, 0, 0, 1, 1,
0.2225208, 1.060538, 1.30711, 0, 0, 0, 1, 1,
0.2229357, -0.0647631, 0.6130365, 0, 0, 0, 1, 1,
0.225022, 0.07543191, 0.7293023, 0, 0, 0, 1, 1,
0.2256046, -0.3606141, 3.212187, 0, 0, 0, 1, 1,
0.22565, -0.682427, 3.899445, 0, 0, 0, 1, 1,
0.226192, -1.072583, 3.159032, 1, 1, 1, 1, 1,
0.2272404, -1.186403, 3.279702, 1, 1, 1, 1, 1,
0.2287464, -0.002872798, 0.89013, 1, 1, 1, 1, 1,
0.2297687, -0.3078785, 2.673596, 1, 1, 1, 1, 1,
0.2301117, 1.853078, 0.1042444, 1, 1, 1, 1, 1,
0.2311363, 0.1540096, 1.398493, 1, 1, 1, 1, 1,
0.237234, 1.455095, 1.832231, 1, 1, 1, 1, 1,
0.2379154, -0.3128317, 2.614932, 1, 1, 1, 1, 1,
0.2393459, 0.6471793, 1.102805, 1, 1, 1, 1, 1,
0.2404249, -0.8989184, 3.859787, 1, 1, 1, 1, 1,
0.2454136, 0.1006712, 2.909069, 1, 1, 1, 1, 1,
0.2488594, -0.1188151, 2.351537, 1, 1, 1, 1, 1,
0.2491719, 0.1942843, 0.4485532, 1, 1, 1, 1, 1,
0.2498305, -0.5799361, 4.273268, 1, 1, 1, 1, 1,
0.254611, -0.3061543, 1.328762, 1, 1, 1, 1, 1,
0.2574338, 0.2594949, 0.7698035, 0, 0, 1, 1, 1,
0.2591663, 0.05616556, 1.468597, 1, 0, 0, 1, 1,
0.263044, 0.6653655, 0.02298915, 1, 0, 0, 1, 1,
0.2642717, -0.3471051, 2.578403, 1, 0, 0, 1, 1,
0.266796, -0.8207335, 3.295324, 1, 0, 0, 1, 1,
0.2700352, 1.064266, -0.8546164, 1, 0, 0, 1, 1,
0.2737041, -0.5369146, 5.559774, 0, 0, 0, 1, 1,
0.2749763, -0.8678256, 3.878343, 0, 0, 0, 1, 1,
0.2776539, 1.030192, 0.2150735, 0, 0, 0, 1, 1,
0.2786086, -1.236547, 3.229122, 0, 0, 0, 1, 1,
0.281291, -0.07811575, 0.8592017, 0, 0, 0, 1, 1,
0.2815498, 0.09583131, 2.415102, 0, 0, 0, 1, 1,
0.2862646, -0.4650474, 3.870465, 0, 0, 0, 1, 1,
0.2889837, -0.8454003, 3.003436, 1, 1, 1, 1, 1,
0.2906847, -0.7012375, 2.15257, 1, 1, 1, 1, 1,
0.2920285, -0.3915923, 2.166262, 1, 1, 1, 1, 1,
0.2938596, 0.3488566, 1.393211, 1, 1, 1, 1, 1,
0.2976781, -1.135724, 4.167209, 1, 1, 1, 1, 1,
0.2983605, -1.369091, 2.063933, 1, 1, 1, 1, 1,
0.3005578, 0.8463207, 2.129104, 1, 1, 1, 1, 1,
0.3013458, -1.044246, 3.473357, 1, 1, 1, 1, 1,
0.301736, 1.326123, 0.6489712, 1, 1, 1, 1, 1,
0.3062789, 0.2277697, 1.415603, 1, 1, 1, 1, 1,
0.3076979, 0.299975, 1.346018, 1, 1, 1, 1, 1,
0.3092585, 0.1832063, 2.323811, 1, 1, 1, 1, 1,
0.3125625, 1.543431, -0.9000475, 1, 1, 1, 1, 1,
0.3143184, 0.3770786, 0.2889822, 1, 1, 1, 1, 1,
0.3176922, -0.4637544, 3.932356, 1, 1, 1, 1, 1,
0.3200514, -2.363802, 2.335127, 0, 0, 1, 1, 1,
0.3203188, -0.5379447, 2.963671, 1, 0, 0, 1, 1,
0.3205513, -0.09805607, 2.439995, 1, 0, 0, 1, 1,
0.3209265, 1.616481, -0.8452553, 1, 0, 0, 1, 1,
0.3209288, -0.6671066, 0.671982, 1, 0, 0, 1, 1,
0.3211635, -0.9249454, 1.80799, 1, 0, 0, 1, 1,
0.3249596, -0.0677263, 1.37489, 0, 0, 0, 1, 1,
0.3255632, -1.029643, 3.144464, 0, 0, 0, 1, 1,
0.3265877, -1.305432, 4.313207, 0, 0, 0, 1, 1,
0.3488219, -1.315195, 5.039192, 0, 0, 0, 1, 1,
0.3523592, 0.3189668, 0.9727781, 0, 0, 0, 1, 1,
0.3578606, 0.9802767, 2.161395, 0, 0, 0, 1, 1,
0.3586884, -0.9748102, 2.92216, 0, 0, 0, 1, 1,
0.369343, 0.5328301, 0.0669104, 1, 1, 1, 1, 1,
0.3720471, 0.2287902, 1.566932, 1, 1, 1, 1, 1,
0.3727015, 0.3917837, 2.639841, 1, 1, 1, 1, 1,
0.3755881, 1.768277, -0.1262569, 1, 1, 1, 1, 1,
0.3767475, 0.5119686, -0.5577536, 1, 1, 1, 1, 1,
0.3856582, -2.205013, 2.671481, 1, 1, 1, 1, 1,
0.3868031, -0.338841, 0.9815428, 1, 1, 1, 1, 1,
0.3905273, -0.90005, 3.192636, 1, 1, 1, 1, 1,
0.393872, 1.60357, 0.9453273, 1, 1, 1, 1, 1,
0.4069312, -1.724383, 3.912597, 1, 1, 1, 1, 1,
0.4119672, 0.7456139, -0.6690611, 1, 1, 1, 1, 1,
0.4131347, 0.8193642, 1.499411, 1, 1, 1, 1, 1,
0.4133254, -1.302902, 2.278533, 1, 1, 1, 1, 1,
0.4178233, 1.569411, 0.7907109, 1, 1, 1, 1, 1,
0.4182432, -1.749022, 2.290975, 1, 1, 1, 1, 1,
0.4222749, -1.871579, 4.070373, 0, 0, 1, 1, 1,
0.4259806, 0.5202644, 1.18665, 1, 0, 0, 1, 1,
0.426956, -0.9899081, 3.187273, 1, 0, 0, 1, 1,
0.4366192, -1.610523, 4.14502, 1, 0, 0, 1, 1,
0.4423527, 1.436053, 0.9462075, 1, 0, 0, 1, 1,
0.4433536, 0.02590743, -0.01741097, 1, 0, 0, 1, 1,
0.4460277, 1.272327, 2.518329, 0, 0, 0, 1, 1,
0.4532571, -0.9772748, 3.252694, 0, 0, 0, 1, 1,
0.454517, -0.1687082, 4.791133, 0, 0, 0, 1, 1,
0.4577144, -0.2777122, 2.235159, 0, 0, 0, 1, 1,
0.4582919, 0.9417432, 1.180108, 0, 0, 0, 1, 1,
0.4606152, 0.7940798, -0.4392858, 0, 0, 0, 1, 1,
0.4621202, -1.526685, 1.929367, 0, 0, 0, 1, 1,
0.4634252, 2.099649, 1.933935, 1, 1, 1, 1, 1,
0.4636475, -1.788743, 3.389001, 1, 1, 1, 1, 1,
0.4651482, 0.429087, 0.5938905, 1, 1, 1, 1, 1,
0.4672904, 0.6731023, -0.462271, 1, 1, 1, 1, 1,
0.4746889, -1.085153, 2.528206, 1, 1, 1, 1, 1,
0.4748427, 0.8297575, 0.7120899, 1, 1, 1, 1, 1,
0.482373, -0.4905999, 3.571589, 1, 1, 1, 1, 1,
0.4876803, 0.7001041, -1.006829, 1, 1, 1, 1, 1,
0.4891356, 0.2300081, 2.185158, 1, 1, 1, 1, 1,
0.4926225, -0.3207505, 1.37785, 1, 1, 1, 1, 1,
0.4933092, 0.8244017, 0.5429326, 1, 1, 1, 1, 1,
0.4941403, 0.5843071, 2.644487, 1, 1, 1, 1, 1,
0.4946824, 1.691885, -1.075496, 1, 1, 1, 1, 1,
0.4948852, 0.09999364, 1.342226, 1, 1, 1, 1, 1,
0.4966689, 0.8420382, 0.9061952, 1, 1, 1, 1, 1,
0.5009849, 1.540668, -0.8679623, 0, 0, 1, 1, 1,
0.5025383, 0.9312262, -0.02481443, 1, 0, 0, 1, 1,
0.5030736, -0.2823583, 1.712153, 1, 0, 0, 1, 1,
0.5054259, -1.111438, 4.272479, 1, 0, 0, 1, 1,
0.5056152, 1.418502, 0.4704312, 1, 0, 0, 1, 1,
0.5152805, -0.3317681, 0.637421, 1, 0, 0, 1, 1,
0.5164724, -0.1087776, 2.474817, 0, 0, 0, 1, 1,
0.5172166, -0.4407013, 2.338012, 0, 0, 0, 1, 1,
0.519643, 1.127657, 0.39027, 0, 0, 0, 1, 1,
0.5205204, 0.608385, 0.5714392, 0, 0, 0, 1, 1,
0.5250439, 0.6114474, -0.0188324, 0, 0, 0, 1, 1,
0.5305564, 2.207947, 0.3600851, 0, 0, 0, 1, 1,
0.5328029, 0.8981463, -2.14453, 0, 0, 0, 1, 1,
0.5413126, -0.03003377, 1.877917, 1, 1, 1, 1, 1,
0.5460349, 0.9501949, 0.9644142, 1, 1, 1, 1, 1,
0.5463599, 1.102535, -0.06871373, 1, 1, 1, 1, 1,
0.5494954, -0.9048781, 1.87654, 1, 1, 1, 1, 1,
0.5550594, 0.3399948, 1.871825, 1, 1, 1, 1, 1,
0.5609104, 0.5746824, -0.9846548, 1, 1, 1, 1, 1,
0.564985, 0.7628515, 1.129518, 1, 1, 1, 1, 1,
0.5659382, -0.8016062, 0.3226784, 1, 1, 1, 1, 1,
0.5660349, 0.3788669, 0.3826465, 1, 1, 1, 1, 1,
0.5709121, 0.8078147, 1.12217, 1, 1, 1, 1, 1,
0.5736321, -0.5219883, 2.584532, 1, 1, 1, 1, 1,
0.5744542, 0.6103802, 1.297709, 1, 1, 1, 1, 1,
0.5748357, -0.6994222, 1.329115, 1, 1, 1, 1, 1,
0.5762782, 0.07972315, 0.4941105, 1, 1, 1, 1, 1,
0.5827406, -1.886382, 2.397131, 1, 1, 1, 1, 1,
0.5853675, -0.09751375, 2.373538, 0, 0, 1, 1, 1,
0.5875493, 0.7486225, -0.02567999, 1, 0, 0, 1, 1,
0.5879056, 0.6944792, 1.644892, 1, 0, 0, 1, 1,
0.5905541, 0.2004171, 1.162457, 1, 0, 0, 1, 1,
0.5930088, 1.002734, 0.8438892, 1, 0, 0, 1, 1,
0.6091915, 0.6640826, -0.4891382, 1, 0, 0, 1, 1,
0.6131865, 0.04291634, 2.139058, 0, 0, 0, 1, 1,
0.615234, -0.6005691, 1.122104, 0, 0, 0, 1, 1,
0.6156336, -1.818744, 2.833798, 0, 0, 0, 1, 1,
0.6165134, -1.593348, 2.547758, 0, 0, 0, 1, 1,
0.6177204, -0.2664324, 1.590044, 0, 0, 0, 1, 1,
0.6179174, 1.061141, 1.545101, 0, 0, 0, 1, 1,
0.6193414, -0.8991328, 3.253721, 0, 0, 0, 1, 1,
0.6205492, 0.0990183, 0.4326564, 1, 1, 1, 1, 1,
0.6229162, -1.626299, 2.839103, 1, 1, 1, 1, 1,
0.6252469, 0.9038914, 0.4604569, 1, 1, 1, 1, 1,
0.6270848, -0.1744634, 1.564914, 1, 1, 1, 1, 1,
0.6287646, 0.2624854, 1.630854, 1, 1, 1, 1, 1,
0.6349805, 0.645398, -0.3123859, 1, 1, 1, 1, 1,
0.6370894, -1.852634, 2.30999, 1, 1, 1, 1, 1,
0.6384922, 0.04086281, 2.607312, 1, 1, 1, 1, 1,
0.6391779, 1.482437, -0.3989843, 1, 1, 1, 1, 1,
0.6443854, 0.9100486, -1.442765, 1, 1, 1, 1, 1,
0.6467721, -1.504964, 2.338908, 1, 1, 1, 1, 1,
0.6476561, 0.006727232, 3.17505, 1, 1, 1, 1, 1,
0.6488751, 0.8513383, 1.62063, 1, 1, 1, 1, 1,
0.649357, 2.263294, -1.031368, 1, 1, 1, 1, 1,
0.6545929, 0.2970531, 2.023264, 1, 1, 1, 1, 1,
0.661921, -0.08282481, 2.961859, 0, 0, 1, 1, 1,
0.667504, 0.2891416, 0.8912476, 1, 0, 0, 1, 1,
0.6678351, -0.09715892, 1.732829, 1, 0, 0, 1, 1,
0.6701065, 1.232549, 0.56489, 1, 0, 0, 1, 1,
0.6701372, -0.4128695, 1.192043, 1, 0, 0, 1, 1,
0.6868948, 0.9010022, 0.3837736, 1, 0, 0, 1, 1,
0.6918995, -0.08960926, 1.024924, 0, 0, 0, 1, 1,
0.6924172, 0.7759999, -0.3949557, 0, 0, 0, 1, 1,
0.6944004, 1.44108, -0.3829573, 0, 0, 0, 1, 1,
0.6991559, 1.8011, 0.976438, 0, 0, 0, 1, 1,
0.7036678, -0.1882651, 3.256701, 0, 0, 0, 1, 1,
0.7049768, 0.3616289, 1.698724, 0, 0, 0, 1, 1,
0.7058749, -0.3444988, 2.300023, 0, 0, 0, 1, 1,
0.7151552, 0.6464987, 2.495473, 1, 1, 1, 1, 1,
0.7193884, -0.7943223, 3.042816, 1, 1, 1, 1, 1,
0.7194261, 1.5579, 2.450243, 1, 1, 1, 1, 1,
0.7197954, -0.6837141, 3.830866, 1, 1, 1, 1, 1,
0.7199395, -1.657744, 4.235744, 1, 1, 1, 1, 1,
0.7277506, 1.54894, 0.3911101, 1, 1, 1, 1, 1,
0.7301149, -0.7378927, 1.221, 1, 1, 1, 1, 1,
0.738922, -0.8095359, 1.819961, 1, 1, 1, 1, 1,
0.7451756, -1.372498, 0.5958632, 1, 1, 1, 1, 1,
0.749323, 0.4245253, 1.925425, 1, 1, 1, 1, 1,
0.7497524, -0.3546604, 1.846455, 1, 1, 1, 1, 1,
0.7598157, -0.691775, 1.967704, 1, 1, 1, 1, 1,
0.763335, 0.2267027, 0.4341061, 1, 1, 1, 1, 1,
0.7636451, -0.3591093, 1.236095, 1, 1, 1, 1, 1,
0.7656463, -0.2202618, 2.404622, 1, 1, 1, 1, 1,
0.7778952, 0.1632754, 2.389339, 0, 0, 1, 1, 1,
0.7810694, -0.2932312, 2.213282, 1, 0, 0, 1, 1,
0.7831959, -2.434729, 3.704591, 1, 0, 0, 1, 1,
0.7846732, 0.9296527, 1.488971, 1, 0, 0, 1, 1,
0.788316, -1.23054, 2.296716, 1, 0, 0, 1, 1,
0.7884376, 1.003783, 0.02685191, 1, 0, 0, 1, 1,
0.7904705, 1.447871, 2.172289, 0, 0, 0, 1, 1,
0.792199, -0.8959978, 2.049345, 0, 0, 0, 1, 1,
0.7999136, 1.344751, 1.769195, 0, 0, 0, 1, 1,
0.8030556, -0.7123878, 3.463628, 0, 0, 0, 1, 1,
0.8081532, -0.005976995, 1.636733, 0, 0, 0, 1, 1,
0.8106079, 0.1833459, 0.8057534, 0, 0, 0, 1, 1,
0.812438, -0.6318977, 2.776556, 0, 0, 0, 1, 1,
0.8132209, 1.084522, -0.3821495, 1, 1, 1, 1, 1,
0.8137901, 0.5379368, 0.3812039, 1, 1, 1, 1, 1,
0.8175282, 0.2555843, 2.054141, 1, 1, 1, 1, 1,
0.8177431, 0.418581, 0.04281918, 1, 1, 1, 1, 1,
0.8231474, 1.617333, 0.4072396, 1, 1, 1, 1, 1,
0.8304325, 1.386234, 1.274809, 1, 1, 1, 1, 1,
0.8323436, -2.237766, 3.864074, 1, 1, 1, 1, 1,
0.8378322, 0.005913977, 0.8249569, 1, 1, 1, 1, 1,
0.8414089, 0.1352828, 2.163971, 1, 1, 1, 1, 1,
0.8450254, 0.2151024, 0.6659256, 1, 1, 1, 1, 1,
0.8501518, -0.1748385, 1.864238, 1, 1, 1, 1, 1,
0.8511171, 0.04623942, 1.61139, 1, 1, 1, 1, 1,
0.8538694, 0.2802111, 1.646871, 1, 1, 1, 1, 1,
0.8565633, -0.7524571, 2.204363, 1, 1, 1, 1, 1,
0.8596871, -1.190706, 3.753745, 1, 1, 1, 1, 1,
0.86164, -0.3330476, 2.70779, 0, 0, 1, 1, 1,
0.8620054, 0.1742491, 0.6385135, 1, 0, 0, 1, 1,
0.864103, -0.1706229, 1.665606, 1, 0, 0, 1, 1,
0.8672566, -1.005539, 2.301931, 1, 0, 0, 1, 1,
0.8686743, -1.185776, 1.056459, 1, 0, 0, 1, 1,
0.8729463, 0.2547174, -0.9264731, 1, 0, 0, 1, 1,
0.8750483, 2.008564, -0.02972654, 0, 0, 0, 1, 1,
0.8826238, -1.337648, 2.621383, 0, 0, 0, 1, 1,
0.883505, 0.1247426, 1.300919, 0, 0, 0, 1, 1,
0.8848051, 0.7027888, 1.409786, 0, 0, 0, 1, 1,
0.8947254, -0.3145577, 2.467114, 0, 0, 0, 1, 1,
0.8951452, 1.261162, 0.746224, 0, 0, 0, 1, 1,
0.8951494, 1.233654, 0.8265681, 0, 0, 0, 1, 1,
0.9023681, -0.8512363, 0.6821679, 1, 1, 1, 1, 1,
0.90574, -1.229611, 3.614522, 1, 1, 1, 1, 1,
0.9140936, -0.9247602, 1.911712, 1, 1, 1, 1, 1,
0.921437, -0.9725645, 2.384606, 1, 1, 1, 1, 1,
0.9252606, -0.3497677, 2.033342, 1, 1, 1, 1, 1,
0.9267285, -0.3205706, 0.7848348, 1, 1, 1, 1, 1,
0.9280518, -0.8979352, 4.512077, 1, 1, 1, 1, 1,
0.9320796, -0.3910655, 2.220506, 1, 1, 1, 1, 1,
0.9320918, -0.03182752, 1.041023, 1, 1, 1, 1, 1,
0.9338352, 0.744647, 0.6707533, 1, 1, 1, 1, 1,
0.9344833, -0.3828118, 2.083328, 1, 1, 1, 1, 1,
0.9345468, 0.3727624, 1.432683, 1, 1, 1, 1, 1,
0.9348825, 1.039079, -0.1642629, 1, 1, 1, 1, 1,
0.9367454, 1.869779, -0.3586195, 1, 1, 1, 1, 1,
0.9452614, 0.6347718, -0.3686633, 1, 1, 1, 1, 1,
0.9463167, 0.7139831, 1.143656, 0, 0, 1, 1, 1,
0.9471189, -0.2036434, 3.158023, 1, 0, 0, 1, 1,
0.9477516, -1.506803, 1.657178, 1, 0, 0, 1, 1,
0.9541424, -1.953583, 5.155151, 1, 0, 0, 1, 1,
0.9551885, -0.4877461, 1.426008, 1, 0, 0, 1, 1,
0.9567987, -0.288432, 2.770613, 1, 0, 0, 1, 1,
0.9683753, 0.9382406, 1.361475, 0, 0, 0, 1, 1,
0.9711016, -0.1069734, 2.961663, 0, 0, 0, 1, 1,
0.9822618, 0.03917064, 1.451126, 0, 0, 0, 1, 1,
0.9825903, -0.5554011, 2.274262, 0, 0, 0, 1, 1,
0.9846269, -0.3012068, 2.096115, 0, 0, 0, 1, 1,
0.9912751, -2.008092, 2.368256, 0, 0, 0, 1, 1,
0.9965172, 0.4060132, 0.1229437, 0, 0, 0, 1, 1,
1.000982, -0.4455892, 0.6867291, 1, 1, 1, 1, 1,
1.001899, 1.593074, 0.05661566, 1, 1, 1, 1, 1,
1.002298, 0.1847465, 2.697973, 1, 1, 1, 1, 1,
1.007002, -1.014551, 2.719625, 1, 1, 1, 1, 1,
1.010892, -1.228027, 2.619692, 1, 1, 1, 1, 1,
1.021669, 1.023056, 1.505201, 1, 1, 1, 1, 1,
1.039977, -1.873045, 2.211894, 1, 1, 1, 1, 1,
1.041504, -1.467773, 0.6094772, 1, 1, 1, 1, 1,
1.046563, 0.3825576, 2.337277, 1, 1, 1, 1, 1,
1.046608, 1.268834, 1.750135, 1, 1, 1, 1, 1,
1.057705, -1.788903, 1.377617, 1, 1, 1, 1, 1,
1.059029, -0.2710299, 0.5372853, 1, 1, 1, 1, 1,
1.074952, 0.155023, -0.08729875, 1, 1, 1, 1, 1,
1.075994, -1.217058, 1.980594, 1, 1, 1, 1, 1,
1.076142, -0.4682691, 3.940789, 1, 1, 1, 1, 1,
1.082174, -0.8009421, 2.388708, 0, 0, 1, 1, 1,
1.082454, 0.2038799, 0.1578931, 1, 0, 0, 1, 1,
1.094879, -2.186592, 3.161869, 1, 0, 0, 1, 1,
1.095392, 0.9756361, 1.142265, 1, 0, 0, 1, 1,
1.099836, 1.042339, 1.499681, 1, 0, 0, 1, 1,
1.103982, 0.4691934, 1.219082, 1, 0, 0, 1, 1,
1.109735, -1.632642, 2.301298, 0, 0, 0, 1, 1,
1.112, -0.112958, 2.274803, 0, 0, 0, 1, 1,
1.114285, -1.28467, -0.5743673, 0, 0, 0, 1, 1,
1.114689, 0.8093436, 1.295532, 0, 0, 0, 1, 1,
1.115083, -1.123698, 1.420251, 0, 0, 0, 1, 1,
1.118695, 0.9658781, 0.5797371, 0, 0, 0, 1, 1,
1.127665, 0.8613688, 1.621485, 0, 0, 0, 1, 1,
1.130498, 0.4035456, 2.407077, 1, 1, 1, 1, 1,
1.139377, 0.3168006, 2.864536, 1, 1, 1, 1, 1,
1.155509, -1.769978, 2.274748, 1, 1, 1, 1, 1,
1.161092, 0.938667, 0.6531652, 1, 1, 1, 1, 1,
1.16186, -2.246493, 3.113955, 1, 1, 1, 1, 1,
1.169745, 0.1871301, 2.345659, 1, 1, 1, 1, 1,
1.175322, -1.261166, 2.776752, 1, 1, 1, 1, 1,
1.179692, 0.03033372, 0.7886049, 1, 1, 1, 1, 1,
1.183499, -1.005888, 3.106278, 1, 1, 1, 1, 1,
1.184116, 0.02861372, 1.236286, 1, 1, 1, 1, 1,
1.188524, -0.2017253, 1.393839, 1, 1, 1, 1, 1,
1.190078, 0.2123739, 1.234546, 1, 1, 1, 1, 1,
1.191392, 1.15299, 1.08639, 1, 1, 1, 1, 1,
1.201282, 1.438709, 1.186602, 1, 1, 1, 1, 1,
1.203758, -1.104785, 4.671017, 1, 1, 1, 1, 1,
1.20955, -0.320971, 1.207551, 0, 0, 1, 1, 1,
1.216817, 1.106565, 0.8070226, 1, 0, 0, 1, 1,
1.222547, 1.732677, 0.7313467, 1, 0, 0, 1, 1,
1.225577, -0.6263173, 1.540694, 1, 0, 0, 1, 1,
1.228828, -0.3422759, 0.58461, 1, 0, 0, 1, 1,
1.23535, -1.274204, 1.171244, 1, 0, 0, 1, 1,
1.253471, -1.234172, 0.05991615, 0, 0, 0, 1, 1,
1.260161, 0.5810667, -0.1268506, 0, 0, 0, 1, 1,
1.27024, -1.060732, 1.074922, 0, 0, 0, 1, 1,
1.276335, 0.3059182, 1.649702, 0, 0, 0, 1, 1,
1.278029, -0.1082041, 1.651145, 0, 0, 0, 1, 1,
1.278099, 1.363664, 0.3952759, 0, 0, 0, 1, 1,
1.280209, -0.4129694, 1.935185, 0, 0, 0, 1, 1,
1.28132, -1.113909, 0.9733727, 1, 1, 1, 1, 1,
1.292571, 0.05508051, 0.5567774, 1, 1, 1, 1, 1,
1.314299, 0.58783, 1.032436, 1, 1, 1, 1, 1,
1.325891, 0.9902936, -0.1065126, 1, 1, 1, 1, 1,
1.326592, 1.748376, -0.2545403, 1, 1, 1, 1, 1,
1.333755, 0.4162749, 0.1608717, 1, 1, 1, 1, 1,
1.342055, 0.4138533, 2.419777, 1, 1, 1, 1, 1,
1.342421, -1.269227, 1.903829, 1, 1, 1, 1, 1,
1.348631, 0.2475447, 3.155444, 1, 1, 1, 1, 1,
1.348727, 1.163399, 0.04727983, 1, 1, 1, 1, 1,
1.34996, -1.554714, 1.219905, 1, 1, 1, 1, 1,
1.356717, -0.5755582, 0.6070685, 1, 1, 1, 1, 1,
1.359262, 0.5516249, 0.7244053, 1, 1, 1, 1, 1,
1.359373, -0.918052, 2.142853, 1, 1, 1, 1, 1,
1.364435, -0.6203424, 1.242861, 1, 1, 1, 1, 1,
1.365475, 0.06379758, 2.807958, 0, 0, 1, 1, 1,
1.366708, -0.1687671, 2.464643, 1, 0, 0, 1, 1,
1.368675, -0.5419002, 0.1117025, 1, 0, 0, 1, 1,
1.373168, 0.4859389, 0.8483953, 1, 0, 0, 1, 1,
1.374042, 0.06067941, 0.8635194, 1, 0, 0, 1, 1,
1.390329, -0.787456, 1.785149, 1, 0, 0, 1, 1,
1.411656, -0.147902, -0.6392325, 0, 0, 0, 1, 1,
1.419656, 0.3228913, -1.367401, 0, 0, 0, 1, 1,
1.421406, 1.251633, -0.9860366, 0, 0, 0, 1, 1,
1.421473, 1.001709, -0.1578916, 0, 0, 0, 1, 1,
1.425389, 0.8194215, 0.0946883, 0, 0, 0, 1, 1,
1.4427, 0.2558643, 0.9013039, 0, 0, 0, 1, 1,
1.454374, -0.4703702, 0.3455868, 0, 0, 0, 1, 1,
1.457465, 0.9419053, 0.6554497, 1, 1, 1, 1, 1,
1.477134, 0.04184908, 1.662014, 1, 1, 1, 1, 1,
1.486875, -0.7542956, 2.555827, 1, 1, 1, 1, 1,
1.501786, -1.355643, 1.481403, 1, 1, 1, 1, 1,
1.507077, -0.5322902, 2.189115, 1, 1, 1, 1, 1,
1.515677, -0.3670647, 3.598371, 1, 1, 1, 1, 1,
1.532268, -1.860398, 0.9222868, 1, 1, 1, 1, 1,
1.551286, -1.551294, 2.034423, 1, 1, 1, 1, 1,
1.555249, 0.7467287, 0.2095369, 1, 1, 1, 1, 1,
1.566859, -2.894954, 3.471249, 1, 1, 1, 1, 1,
1.577386, -0.435749, 2.051238, 1, 1, 1, 1, 1,
1.610191, -1.049649, 0.7667255, 1, 1, 1, 1, 1,
1.619165, 0.3187092, 3.174483, 1, 1, 1, 1, 1,
1.621524, -1.83419, 3.035352, 1, 1, 1, 1, 1,
1.623347, 0.5647727, 1.447604, 1, 1, 1, 1, 1,
1.627156, -0.2649503, 1.209165, 0, 0, 1, 1, 1,
1.633414, 1.155326, 1.562388, 1, 0, 0, 1, 1,
1.639315, -0.3175545, 3.59702, 1, 0, 0, 1, 1,
1.648042, 0.3806136, 1.238308, 1, 0, 0, 1, 1,
1.653045, 0.681092, 0.861765, 1, 0, 0, 1, 1,
1.662409, 0.6735481, 2.374582, 1, 0, 0, 1, 1,
1.663255, 0.2829567, 2.16748, 0, 0, 0, 1, 1,
1.66554, -1.87054, 3.552, 0, 0, 0, 1, 1,
1.667497, 0.4354363, 0.1851639, 0, 0, 0, 1, 1,
1.714994, -1.14977, 4.082315, 0, 0, 0, 1, 1,
1.724495, 0.7249497, 0.9247954, 0, 0, 0, 1, 1,
1.725933, -2.005524, 2.277428, 0, 0, 0, 1, 1,
1.760853, -0.3905106, 2.271475, 0, 0, 0, 1, 1,
1.814893, 0.07048643, 2.125179, 1, 1, 1, 1, 1,
1.828855, -0.1245889, 2.488214, 1, 1, 1, 1, 1,
1.838214, 1.0008, 1.651994, 1, 1, 1, 1, 1,
1.838881, -0.2873358, 2.177964, 1, 1, 1, 1, 1,
1.841748, 0.03725785, 2.277581, 1, 1, 1, 1, 1,
1.858252, 2.984379, 1.454689, 1, 1, 1, 1, 1,
1.87763, -1.004052, 2.400838, 1, 1, 1, 1, 1,
1.889838, -2.160374, 2.189133, 1, 1, 1, 1, 1,
1.891117, -0.6047882, 3.431245, 1, 1, 1, 1, 1,
1.952764, -0.9540217, 3.32562, 1, 1, 1, 1, 1,
1.957066, -0.3300077, 2.04119, 1, 1, 1, 1, 1,
1.965143, -0.1430447, 2.143114, 1, 1, 1, 1, 1,
1.971607, 2.118032, 1.310985, 1, 1, 1, 1, 1,
1.984341, 2.443707, 1.97555, 1, 1, 1, 1, 1,
2.032941, 0.8134406, 1.792822, 1, 1, 1, 1, 1,
2.038105, -0.4871962, 1.854275, 0, 0, 1, 1, 1,
2.109017, -0.3425762, 0.7341642, 1, 0, 0, 1, 1,
2.126522, -0.6274533, 2.029024, 1, 0, 0, 1, 1,
2.135361, 0.1802924, 1.937171, 1, 0, 0, 1, 1,
2.157707, -0.5634478, 0.08456506, 1, 0, 0, 1, 1,
2.186981, 0.6876934, 1.098309, 1, 0, 0, 1, 1,
2.188273, 0.680527, 1.098427, 0, 0, 0, 1, 1,
2.201736, 2.273376, -0.02981892, 0, 0, 0, 1, 1,
2.207432, -1.186077, 1.089716, 0, 0, 0, 1, 1,
2.234088, 0.5136473, 0.4187962, 0, 0, 0, 1, 1,
2.276188, -0.04766076, 1.950042, 0, 0, 0, 1, 1,
2.333026, -0.5481831, 3.023839, 0, 0, 0, 1, 1,
2.487788, 0.6534598, 0.6167969, 0, 0, 0, 1, 1,
2.490586, -0.5467607, 1.847306, 1, 1, 1, 1, 1,
2.602301, -0.4648793, 2.117649, 1, 1, 1, 1, 1,
2.609856, -0.5582983, 2.396984, 1, 1, 1, 1, 1,
2.642095, 0.4786155, -0.7138298, 1, 1, 1, 1, 1,
3.143166, 0.6097643, 0.8128501, 1, 1, 1, 1, 1,
3.169383, 1.561055, 1.502622, 1, 1, 1, 1, 1,
3.564649, -1.529748, 2.425728, 1, 1, 1, 1, 1
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
var radius = 9.668257;
var distance = 33.95934;
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
mvMatrix.translate( -0.1505988, -0.1490201, -0.1243515 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95934);
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
