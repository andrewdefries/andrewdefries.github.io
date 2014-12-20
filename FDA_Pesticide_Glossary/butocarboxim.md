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
-4.222493, -0.8923629, -1.385535, 1, 0, 0, 1,
-3.611282, -2.47884, -2.26006, 1, 0.007843138, 0, 1,
-2.83188, 0.9378606, -0.9581836, 1, 0.01176471, 0, 1,
-2.772546, 0.7588177, -0.6521427, 1, 0.01960784, 0, 1,
-2.662465, -1.29302, -2.354074, 1, 0.02352941, 0, 1,
-2.601219, -1.396431, -1.257333, 1, 0.03137255, 0, 1,
-2.541211, 0.761487, -1.798233, 1, 0.03529412, 0, 1,
-2.377363, -0.3683416, -2.99847, 1, 0.04313726, 0, 1,
-2.328751, -0.4015702, -1.534726, 1, 0.04705882, 0, 1,
-2.287332, 0.8171781, 0.8449152, 1, 0.05490196, 0, 1,
-2.277241, -0.512433, -0.4090761, 1, 0.05882353, 0, 1,
-2.198341, 0.6586133, -1.900531, 1, 0.06666667, 0, 1,
-2.168129, 1.879763, -0.03636195, 1, 0.07058824, 0, 1,
-2.149513, 2.181046, -1.793841, 1, 0.07843138, 0, 1,
-2.148451, -0.3615687, -2.910978, 1, 0.08235294, 0, 1,
-2.139388, 0.3935634, -0.8817794, 1, 0.09019608, 0, 1,
-2.130501, -1.102132, -3.14666, 1, 0.09411765, 0, 1,
-2.059098, 1.146764, 0.06061252, 1, 0.1019608, 0, 1,
-2.041037, 0.2691736, 0.7127832, 1, 0.1098039, 0, 1,
-2.025001, -0.1938912, -0.8155706, 1, 0.1137255, 0, 1,
-2.023276, 0.49118, -1.683513, 1, 0.1215686, 0, 1,
-2.010333, 0.8441706, -0.4723464, 1, 0.1254902, 0, 1,
-2.009768, 1.199975, -0.8416979, 1, 0.1333333, 0, 1,
-1.981138, -0.5709701, 0.7917407, 1, 0.1372549, 0, 1,
-1.979044, 1.173388, -0.9972842, 1, 0.145098, 0, 1,
-1.956714, 0.1841799, -0.5596908, 1, 0.1490196, 0, 1,
-1.936699, -0.3364969, -1.198368, 1, 0.1568628, 0, 1,
-1.925803, 0.3833096, -1.00815, 1, 0.1607843, 0, 1,
-1.917378, 0.2359709, -1.177591, 1, 0.1686275, 0, 1,
-1.914998, 0.4778562, -1.91929, 1, 0.172549, 0, 1,
-1.91324, 0.1549442, -2.047444, 1, 0.1803922, 0, 1,
-1.887979, 0.005856299, -1.191375, 1, 0.1843137, 0, 1,
-1.880585, -1.303925, -1.086278, 1, 0.1921569, 0, 1,
-1.858683, -1.101364, -0.2692588, 1, 0.1960784, 0, 1,
-1.854997, -1.201128, -3.007914, 1, 0.2039216, 0, 1,
-1.85047, -0.8794315, -1.826954, 1, 0.2117647, 0, 1,
-1.849753, -1.59975, -1.186413, 1, 0.2156863, 0, 1,
-1.842931, 0.009410981, -2.482324, 1, 0.2235294, 0, 1,
-1.841178, 0.734373, -2.439327, 1, 0.227451, 0, 1,
-1.798472, 0.5735953, -1.184753, 1, 0.2352941, 0, 1,
-1.766626, -0.7050871, -2.572618, 1, 0.2392157, 0, 1,
-1.759011, -1.018676, -1.02926, 1, 0.2470588, 0, 1,
-1.747211, -0.732576, -2.427897, 1, 0.2509804, 0, 1,
-1.74336, -0.5320379, -2.047194, 1, 0.2588235, 0, 1,
-1.739623, 2.554568, -0.7338418, 1, 0.2627451, 0, 1,
-1.73771, -1.809838, -2.278318, 1, 0.2705882, 0, 1,
-1.730519, 0.9488903, -2.01351, 1, 0.2745098, 0, 1,
-1.706182, -0.107251, -2.06753, 1, 0.282353, 0, 1,
-1.705448, -1.057314, -0.6649609, 1, 0.2862745, 0, 1,
-1.699399, -0.837813, -1.318419, 1, 0.2941177, 0, 1,
-1.695884, -2.377715, -3.510644, 1, 0.3019608, 0, 1,
-1.685588, -0.7847065, -1.887309, 1, 0.3058824, 0, 1,
-1.683628, 0.01815224, -1.587931, 1, 0.3137255, 0, 1,
-1.638031, 0.4912254, -0.4251101, 1, 0.3176471, 0, 1,
-1.630498, -0.7352052, -4.381356, 1, 0.3254902, 0, 1,
-1.628629, 1.197136, -0.2168512, 1, 0.3294118, 0, 1,
-1.628367, -0.3760128, -3.021302, 1, 0.3372549, 0, 1,
-1.62653, 1.405415, -0.8568031, 1, 0.3411765, 0, 1,
-1.611615, -1.521047, -3.563354, 1, 0.3490196, 0, 1,
-1.590219, -0.4912606, -2.924494, 1, 0.3529412, 0, 1,
-1.585473, 1.464655, -0.5207974, 1, 0.3607843, 0, 1,
-1.581895, -0.5627499, -2.750725, 1, 0.3647059, 0, 1,
-1.572635, -0.9133841, -2.049775, 1, 0.372549, 0, 1,
-1.565329, 0.7682564, -1.473323, 1, 0.3764706, 0, 1,
-1.543614, -0.8783924, -3.036058, 1, 0.3843137, 0, 1,
-1.523182, -0.3931897, -2.332163, 1, 0.3882353, 0, 1,
-1.509411, 0.2527406, -0.5674637, 1, 0.3960784, 0, 1,
-1.503908, -0.1786714, -0.4301121, 1, 0.4039216, 0, 1,
-1.494309, 0.79429, -1.155953, 1, 0.4078431, 0, 1,
-1.493032, 0.5891072, 0.7737774, 1, 0.4156863, 0, 1,
-1.486465, 0.5340872, -1.508819, 1, 0.4196078, 0, 1,
-1.485612, -0.3988416, -2.565532, 1, 0.427451, 0, 1,
-1.479654, -0.972988, 0.3431189, 1, 0.4313726, 0, 1,
-1.477832, 0.4754481, -0.9455367, 1, 0.4392157, 0, 1,
-1.474056, -0.1636474, -1.828277, 1, 0.4431373, 0, 1,
-1.451645, 0.4475673, -0.730058, 1, 0.4509804, 0, 1,
-1.447904, 0.215993, 0.6969851, 1, 0.454902, 0, 1,
-1.438165, 0.07849041, -2.33648, 1, 0.4627451, 0, 1,
-1.437406, -0.7041051, -1.710856, 1, 0.4666667, 0, 1,
-1.419597, -1.095578, -1.603582, 1, 0.4745098, 0, 1,
-1.413833, -1.433589, -2.104352, 1, 0.4784314, 0, 1,
-1.409937, 0.6080253, -1.627655, 1, 0.4862745, 0, 1,
-1.409467, -0.8053275, -2.7874, 1, 0.4901961, 0, 1,
-1.406986, 0.5243385, -0.9359319, 1, 0.4980392, 0, 1,
-1.403845, -0.3877273, 0.385189, 1, 0.5058824, 0, 1,
-1.392008, -2.253235, -1.236784, 1, 0.509804, 0, 1,
-1.385384, -0.2658574, -2.991319, 1, 0.5176471, 0, 1,
-1.381248, 0.2303778, -1.513075, 1, 0.5215687, 0, 1,
-1.373349, -0.3597423, -3.067681, 1, 0.5294118, 0, 1,
-1.368937, 0.4682667, -1.699103, 1, 0.5333334, 0, 1,
-1.363979, 0.04856458, -1.64392, 1, 0.5411765, 0, 1,
-1.357118, -1.380158, -1.649378, 1, 0.5450981, 0, 1,
-1.354306, 1.075228, -0.9322554, 1, 0.5529412, 0, 1,
-1.348411, 0.4488411, -0.6214591, 1, 0.5568628, 0, 1,
-1.346703, 1.060605, -0.1068728, 1, 0.5647059, 0, 1,
-1.344732, -1.947272, -1.423321, 1, 0.5686275, 0, 1,
-1.344427, -0.3693003, -2.356386, 1, 0.5764706, 0, 1,
-1.34331, 0.6356077, -0.3878653, 1, 0.5803922, 0, 1,
-1.329369, 0.6603932, -0.6151395, 1, 0.5882353, 0, 1,
-1.320702, 1.375719, -1.795142, 1, 0.5921569, 0, 1,
-1.319663, -0.3932697, -2.21477, 1, 0.6, 0, 1,
-1.3127, -0.485982, -3.801039, 1, 0.6078432, 0, 1,
-1.310281, -0.5774197, -3.057409, 1, 0.6117647, 0, 1,
-1.308127, -0.05879004, -1.879598, 1, 0.6196079, 0, 1,
-1.292663, -1.152823, -1.694133, 1, 0.6235294, 0, 1,
-1.292414, 0.5532529, -1.353185, 1, 0.6313726, 0, 1,
-1.292329, 0.812619, -1.837192, 1, 0.6352941, 0, 1,
-1.287406, -0.462227, -0.8236289, 1, 0.6431373, 0, 1,
-1.285065, -0.7347985, -2.491602, 1, 0.6470588, 0, 1,
-1.283188, -0.2368489, -3.012098, 1, 0.654902, 0, 1,
-1.281185, -2.517055, -2.903005, 1, 0.6588235, 0, 1,
-1.279853, 0.6078643, 0.6717235, 1, 0.6666667, 0, 1,
-1.275667, 1.121669, -0.1305561, 1, 0.6705883, 0, 1,
-1.261234, -0.6656154, -2.677774, 1, 0.6784314, 0, 1,
-1.24445, -0.2177389, -2.239039, 1, 0.682353, 0, 1,
-1.241956, 0.3089193, -3.253127, 1, 0.6901961, 0, 1,
-1.227229, 0.6316711, -3.131359, 1, 0.6941177, 0, 1,
-1.223312, -0.2205831, -1.326065, 1, 0.7019608, 0, 1,
-1.211814, 1.116977, -2.004342, 1, 0.7098039, 0, 1,
-1.208551, -0.5188981, -2.406645, 1, 0.7137255, 0, 1,
-1.206532, 0.702888, 0.6298394, 1, 0.7215686, 0, 1,
-1.201045, -0.7573082, -1.605942, 1, 0.7254902, 0, 1,
-1.189822, -0.05431649, -1.053229, 1, 0.7333333, 0, 1,
-1.188182, 0.1042785, -1.737216, 1, 0.7372549, 0, 1,
-1.178818, -1.407388, -3.223525, 1, 0.7450981, 0, 1,
-1.178452, -0.2086946, -2.587933, 1, 0.7490196, 0, 1,
-1.151132, -0.6573649, -1.781116, 1, 0.7568628, 0, 1,
-1.145285, 0.6624304, -1.486001, 1, 0.7607843, 0, 1,
-1.144088, 1.254581, -1.029047, 1, 0.7686275, 0, 1,
-1.139243, 0.2777928, -2.024716, 1, 0.772549, 0, 1,
-1.137213, 1.682069, 0.05520099, 1, 0.7803922, 0, 1,
-1.13653, -0.9293118, -1.133765, 1, 0.7843137, 0, 1,
-1.136273, 1.059613, 0.3357479, 1, 0.7921569, 0, 1,
-1.127248, 0.4712268, -2.59691, 1, 0.7960784, 0, 1,
-1.117351, 1.411728, 0.3256171, 1, 0.8039216, 0, 1,
-1.106234, -1.469131, -2.935486, 1, 0.8117647, 0, 1,
-1.105792, 0.07059012, -1.085758, 1, 0.8156863, 0, 1,
-1.105246, -0.9962076, -0.4041077, 1, 0.8235294, 0, 1,
-1.099319, -0.433374, -2.408493, 1, 0.827451, 0, 1,
-1.098773, -0.07907638, -0.8501872, 1, 0.8352941, 0, 1,
-1.091834, 0.5600337, -1.615979, 1, 0.8392157, 0, 1,
-1.088321, 0.4834791, 0.5728835, 1, 0.8470588, 0, 1,
-1.08504, -1.134468, -1.544657, 1, 0.8509804, 0, 1,
-1.084406, -0.4030699, -1.818239, 1, 0.8588235, 0, 1,
-1.083838, 1.988266, 0.4709553, 1, 0.8627451, 0, 1,
-1.077371, -0.02636076, 0.06177489, 1, 0.8705882, 0, 1,
-1.071366, 0.2304244, -2.197376, 1, 0.8745098, 0, 1,
-1.062192, 0.6065832, -0.1296032, 1, 0.8823529, 0, 1,
-1.05919, 1.112279, -0.1180908, 1, 0.8862745, 0, 1,
-1.058012, 0.5061743, -0.7702124, 1, 0.8941177, 0, 1,
-1.057104, -0.3979183, -0.3126958, 1, 0.8980392, 0, 1,
-1.055383, -1.796352, -3.251357, 1, 0.9058824, 0, 1,
-1.051041, 0.3912162, -1.658863, 1, 0.9137255, 0, 1,
-1.05104, -0.6733118, -0.3200693, 1, 0.9176471, 0, 1,
-1.048801, -0.1985099, -1.854407, 1, 0.9254902, 0, 1,
-1.043654, 1.283156, 0.2816577, 1, 0.9294118, 0, 1,
-1.041508, 0.3172418, -1.385643, 1, 0.9372549, 0, 1,
-1.038719, -0.7392873, -2.881053, 1, 0.9411765, 0, 1,
-1.037517, 1.149689, -1.681889, 1, 0.9490196, 0, 1,
-1.036295, 2.699355, -0.4254853, 1, 0.9529412, 0, 1,
-1.033857, 1.151725, -0.22297, 1, 0.9607843, 0, 1,
-1.027439, 0.8353034, -1.122407, 1, 0.9647059, 0, 1,
-1.027266, -0.1439128, -3.171527, 1, 0.972549, 0, 1,
-1.02248, 0.0812726, -0.6016935, 1, 0.9764706, 0, 1,
-1.021609, 0.8429906, -0.4946092, 1, 0.9843137, 0, 1,
-1.021462, -0.9460338, -3.278598, 1, 0.9882353, 0, 1,
-1.02037, 1.519614, -2.003986, 1, 0.9960784, 0, 1,
-1.019015, 0.09954612, -1.464622, 0.9960784, 1, 0, 1,
-1.005426, 1.488804, -0.5386162, 0.9921569, 1, 0, 1,
-0.9921702, -0.3021249, -3.319953, 0.9843137, 1, 0, 1,
-0.9908825, -0.2574189, -1.751835, 0.9803922, 1, 0, 1,
-0.9903089, -1.992701, -4.236674, 0.972549, 1, 0, 1,
-0.9873332, 0.4274702, -1.295188, 0.9686275, 1, 0, 1,
-0.9805644, 0.1060455, -3.238544, 0.9607843, 1, 0, 1,
-0.9794607, -0.6895723, -2.912277, 0.9568627, 1, 0, 1,
-0.9717798, -0.4731932, -3.123444, 0.9490196, 1, 0, 1,
-0.9689023, 0.4070199, -0.1803479, 0.945098, 1, 0, 1,
-0.9632147, -1.189866, -1.869241, 0.9372549, 1, 0, 1,
-0.9624059, 0.8458067, -0.1858399, 0.9333333, 1, 0, 1,
-0.954117, 0.1797851, -1.690471, 0.9254902, 1, 0, 1,
-0.9534504, 0.2404539, -1.933573, 0.9215686, 1, 0, 1,
-0.9496415, 0.2152042, -1.171525, 0.9137255, 1, 0, 1,
-0.9463491, -0.9076113, -2.713882, 0.9098039, 1, 0, 1,
-0.9432454, 0.2893263, -0.8364826, 0.9019608, 1, 0, 1,
-0.9416199, 0.1022955, -1.442768, 0.8941177, 1, 0, 1,
-0.9395742, 0.1747875, -3.341227, 0.8901961, 1, 0, 1,
-0.9394979, 0.4414173, -2.190339, 0.8823529, 1, 0, 1,
-0.9389434, -0.8025078, -1.312851, 0.8784314, 1, 0, 1,
-0.9388624, 2.027577, -0.6639033, 0.8705882, 1, 0, 1,
-0.934935, -0.3062667, -0.7646422, 0.8666667, 1, 0, 1,
-0.9317902, -1.144402, -2.793659, 0.8588235, 1, 0, 1,
-0.9315066, -0.2155844, -2.573281, 0.854902, 1, 0, 1,
-0.93049, 1.111224, -0.90909, 0.8470588, 1, 0, 1,
-0.9257067, 0.9796616, 0.5312224, 0.8431373, 1, 0, 1,
-0.9237646, 0.4374813, -0.7391672, 0.8352941, 1, 0, 1,
-0.9213339, -0.3474311, -3.183244, 0.8313726, 1, 0, 1,
-0.9028637, 1.847138, 0.7461, 0.8235294, 1, 0, 1,
-0.9012605, -1.18496, -2.26621, 0.8196079, 1, 0, 1,
-0.8993476, 0.1877817, -2.425553, 0.8117647, 1, 0, 1,
-0.8964694, 1.200222, -0.08502574, 0.8078431, 1, 0, 1,
-0.8931391, 1.684433, 0.7517834, 0.8, 1, 0, 1,
-0.8924703, -0.2367408, -1.092729, 0.7921569, 1, 0, 1,
-0.892179, 1.591517, -1.185217, 0.7882353, 1, 0, 1,
-0.8865206, 1.022463, -1.110682, 0.7803922, 1, 0, 1,
-0.8844368, -0.4397615, -2.114659, 0.7764706, 1, 0, 1,
-0.8828495, -0.3617017, -1.674673, 0.7686275, 1, 0, 1,
-0.8801606, -0.3844566, -1.855673, 0.7647059, 1, 0, 1,
-0.8790551, -1.069764, -1.657627, 0.7568628, 1, 0, 1,
-0.8765069, -0.6562446, -1.278758, 0.7529412, 1, 0, 1,
-0.8721014, 1.152882, 1.309262, 0.7450981, 1, 0, 1,
-0.8717413, -1.208995, -3.721409, 0.7411765, 1, 0, 1,
-0.8691592, 0.03420136, -0.922123, 0.7333333, 1, 0, 1,
-0.8652926, 0.2533638, -2.30823, 0.7294118, 1, 0, 1,
-0.865036, -0.8023027, -3.143645, 0.7215686, 1, 0, 1,
-0.8643912, 0.3026965, -1.216043, 0.7176471, 1, 0, 1,
-0.8642502, 0.2665276, 0.2726454, 0.7098039, 1, 0, 1,
-0.8593892, -1.075818, -1.370346, 0.7058824, 1, 0, 1,
-0.8566293, 0.6635982, -1.927219, 0.6980392, 1, 0, 1,
-0.8565165, -0.8382417, -1.747084, 0.6901961, 1, 0, 1,
-0.8529416, 0.9944437, 0.03682652, 0.6862745, 1, 0, 1,
-0.8493294, 0.94021, -3.067087, 0.6784314, 1, 0, 1,
-0.8438295, 0.6522982, -2.19338, 0.6745098, 1, 0, 1,
-0.8423764, -1.430064, -1.109377, 0.6666667, 1, 0, 1,
-0.8375378, -0.2323322, -1.136302, 0.6627451, 1, 0, 1,
-0.8366589, -0.6967468, -2.467598, 0.654902, 1, 0, 1,
-0.8306087, 1.125304, -0.9447655, 0.6509804, 1, 0, 1,
-0.8265053, 1.192314, 0.2845281, 0.6431373, 1, 0, 1,
-0.8262305, -2.03407, -1.81468, 0.6392157, 1, 0, 1,
-0.8257393, 0.111037, -2.289728, 0.6313726, 1, 0, 1,
-0.8237427, 0.2340116, 0.8693389, 0.627451, 1, 0, 1,
-0.8200762, 0.4897349, -1.885137, 0.6196079, 1, 0, 1,
-0.8162009, 0.7524427, -0.02797716, 0.6156863, 1, 0, 1,
-0.8136213, 0.2128992, 0.1014303, 0.6078432, 1, 0, 1,
-0.8130269, 1.822865, -0.2122796, 0.6039216, 1, 0, 1,
-0.807384, -1.283594, -4.223795, 0.5960785, 1, 0, 1,
-0.8066542, 0.7618027, -1.825282, 0.5882353, 1, 0, 1,
-0.7940326, 0.1654019, -1.32729, 0.5843138, 1, 0, 1,
-0.7880939, -0.7551799, -1.621657, 0.5764706, 1, 0, 1,
-0.7828228, -0.8773733, -2.68031, 0.572549, 1, 0, 1,
-0.7651357, -0.3580292, -1.2199, 0.5647059, 1, 0, 1,
-0.7622932, 0.8207858, -0.5988137, 0.5607843, 1, 0, 1,
-0.76011, 0.2706124, -1.362733, 0.5529412, 1, 0, 1,
-0.7590415, 0.03633125, -1.239794, 0.5490196, 1, 0, 1,
-0.7554286, -0.2950353, -0.5290287, 0.5411765, 1, 0, 1,
-0.7542872, 0.8645401, -0.1521111, 0.5372549, 1, 0, 1,
-0.7470739, -1.019436, -2.818679, 0.5294118, 1, 0, 1,
-0.7442825, 1.049383, -1.819902, 0.5254902, 1, 0, 1,
-0.7306096, -0.209378, -2.617, 0.5176471, 1, 0, 1,
-0.7251565, -0.448607, -1.43601, 0.5137255, 1, 0, 1,
-0.7226261, 0.4987935, -2.740305, 0.5058824, 1, 0, 1,
-0.718235, -0.5289118, -1.579686, 0.5019608, 1, 0, 1,
-0.7160456, -0.05690405, -0.8202378, 0.4941176, 1, 0, 1,
-0.7098635, 2.022588, 0.3333075, 0.4862745, 1, 0, 1,
-0.7090442, -0.5523272, -0.6538507, 0.4823529, 1, 0, 1,
-0.7011032, 0.6889418, -1.635008, 0.4745098, 1, 0, 1,
-0.6967815, 1.03287, -0.4685887, 0.4705882, 1, 0, 1,
-0.6948224, 0.994557, -2.467917, 0.4627451, 1, 0, 1,
-0.6938233, -0.1672778, -2.343886, 0.4588235, 1, 0, 1,
-0.6903326, 0.9878317, -1.576237, 0.4509804, 1, 0, 1,
-0.6892521, 0.2213952, -0.3985286, 0.4470588, 1, 0, 1,
-0.6883094, -0.7758031, -1.973503, 0.4392157, 1, 0, 1,
-0.6854478, 0.8425484, -1.262887, 0.4352941, 1, 0, 1,
-0.6851728, 0.1602845, -0.07883369, 0.427451, 1, 0, 1,
-0.6725081, 1.47512, 1.162756, 0.4235294, 1, 0, 1,
-0.6685392, -0.0375026, -0.9197945, 0.4156863, 1, 0, 1,
-0.6672347, 1.395048, -0.4591825, 0.4117647, 1, 0, 1,
-0.6607968, -0.883797, -2.804232, 0.4039216, 1, 0, 1,
-0.6601697, -0.7635897, -1.565447, 0.3960784, 1, 0, 1,
-0.6473467, -0.4373135, -3.191109, 0.3921569, 1, 0, 1,
-0.6466072, 0.9825659, -0.8768697, 0.3843137, 1, 0, 1,
-0.638105, -0.4563927, -1.957021, 0.3803922, 1, 0, 1,
-0.636575, 1.461188, -1.532865, 0.372549, 1, 0, 1,
-0.63131, 0.4949309, -1.351426, 0.3686275, 1, 0, 1,
-0.6294476, 1.330337, -2.168548, 0.3607843, 1, 0, 1,
-0.6276749, 0.3605491, -0.8882859, 0.3568628, 1, 0, 1,
-0.6250531, 0.5521622, 0.4511026, 0.3490196, 1, 0, 1,
-0.6140269, 0.1864187, 0.8979616, 0.345098, 1, 0, 1,
-0.6105223, 0.2047357, -1.502274, 0.3372549, 1, 0, 1,
-0.6091152, 1.211567, 0.3105203, 0.3333333, 1, 0, 1,
-0.6072883, -0.7495916, -2.093295, 0.3254902, 1, 0, 1,
-0.6068298, 0.6943651, -0.892742, 0.3215686, 1, 0, 1,
-0.6050591, -0.2275722, -2.06229, 0.3137255, 1, 0, 1,
-0.6045322, 0.5353515, -2.426468, 0.3098039, 1, 0, 1,
-0.6019844, 0.1051902, -2.977598, 0.3019608, 1, 0, 1,
-0.5982316, 0.01574453, -2.117691, 0.2941177, 1, 0, 1,
-0.5963254, -0.5705745, -2.622874, 0.2901961, 1, 0, 1,
-0.5932911, -1.203762, -2.93186, 0.282353, 1, 0, 1,
-0.5924392, -0.2467191, -0.2497683, 0.2784314, 1, 0, 1,
-0.5880131, 1.103207, -0.7570898, 0.2705882, 1, 0, 1,
-0.5869668, 0.8539105, 0.396237, 0.2666667, 1, 0, 1,
-0.5858122, -1.755003, -3.715251, 0.2588235, 1, 0, 1,
-0.5849123, 1.436502, 2.188734, 0.254902, 1, 0, 1,
-0.5808874, -0.2108619, -3.427283, 0.2470588, 1, 0, 1,
-0.5785808, 1.05383, 0.4012565, 0.2431373, 1, 0, 1,
-0.5737645, -1.713044, -4.028374, 0.2352941, 1, 0, 1,
-0.5733103, -0.4295918, -1.092356, 0.2313726, 1, 0, 1,
-0.570582, 0.3139991, -0.1128234, 0.2235294, 1, 0, 1,
-0.5628111, -0.6424521, -2.64947, 0.2196078, 1, 0, 1,
-0.5566177, 0.8934561, -1.392597, 0.2117647, 1, 0, 1,
-0.5559236, -0.7685674, -2.949554, 0.2078431, 1, 0, 1,
-0.5559085, -0.1995569, -2.103112, 0.2, 1, 0, 1,
-0.5454261, -0.08637334, -2.015905, 0.1921569, 1, 0, 1,
-0.5453072, 0.6521149, -0.08756088, 0.1882353, 1, 0, 1,
-0.5381773, -0.7789743, -1.174987, 0.1803922, 1, 0, 1,
-0.5310105, -0.5421267, -2.859679, 0.1764706, 1, 0, 1,
-0.5235668, 1.230287, -1.094328, 0.1686275, 1, 0, 1,
-0.5226242, 1.102581, -0.9133018, 0.1647059, 1, 0, 1,
-0.5181247, -0.3960779, -2.669014, 0.1568628, 1, 0, 1,
-0.5173614, -2.308521, -4.483909, 0.1529412, 1, 0, 1,
-0.512134, -0.7363716, -3.746183, 0.145098, 1, 0, 1,
-0.5117258, -2.71256, -3.44068, 0.1411765, 1, 0, 1,
-0.5091985, 0.8473799, -0.0219818, 0.1333333, 1, 0, 1,
-0.5050742, 0.4213344, -1.317016, 0.1294118, 1, 0, 1,
-0.5028467, -1.278277, -2.482385, 0.1215686, 1, 0, 1,
-0.489909, -0.09824275, -1.092503, 0.1176471, 1, 0, 1,
-0.482387, -1.763116, -2.6643, 0.1098039, 1, 0, 1,
-0.4810289, 0.3151082, -0.9067525, 0.1058824, 1, 0, 1,
-0.4807041, 0.978685, 0.1392455, 0.09803922, 1, 0, 1,
-0.4746169, 1.134381, -1.818353, 0.09019608, 1, 0, 1,
-0.4728083, -0.8761329, -2.911571, 0.08627451, 1, 0, 1,
-0.4723204, -0.1841673, -2.097481, 0.07843138, 1, 0, 1,
-0.4708471, -0.5164067, -4.463665, 0.07450981, 1, 0, 1,
-0.4661147, -1.017521, -1.50336, 0.06666667, 1, 0, 1,
-0.4650046, -0.6357, -3.642385, 0.0627451, 1, 0, 1,
-0.4648648, -0.1736085, -2.76069, 0.05490196, 1, 0, 1,
-0.4601313, -1.245293, -2.465013, 0.05098039, 1, 0, 1,
-0.4574656, 0.5597132, -0.45652, 0.04313726, 1, 0, 1,
-0.4529754, 1.057327, -1.566174, 0.03921569, 1, 0, 1,
-0.4506764, 0.2749539, -2.950342, 0.03137255, 1, 0, 1,
-0.4484823, 0.5322345, 0.5147588, 0.02745098, 1, 0, 1,
-0.443598, 0.6963394, -0.2379109, 0.01960784, 1, 0, 1,
-0.4421416, 0.4836073, -1.754784, 0.01568628, 1, 0, 1,
-0.4370711, -1.129975, -3.807937, 0.007843138, 1, 0, 1,
-0.4345247, -0.593674, -2.812485, 0.003921569, 1, 0, 1,
-0.4262805, 0.2135935, -0.9665264, 0, 1, 0.003921569, 1,
-0.4242029, 0.7237056, -0.9582787, 0, 1, 0.01176471, 1,
-0.4233357, -1.519134, -3.538472, 0, 1, 0.01568628, 1,
-0.4216473, 1.423774, -0.01631438, 0, 1, 0.02352941, 1,
-0.4191289, -0.6379023, -4.088881, 0, 1, 0.02745098, 1,
-0.4150971, -1.987508, -3.681311, 0, 1, 0.03529412, 1,
-0.4143502, 1.962091, 0.6974247, 0, 1, 0.03921569, 1,
-0.4083208, 1.03469, 0.4448493, 0, 1, 0.04705882, 1,
-0.4034531, 0.2135208, -2.005801, 0, 1, 0.05098039, 1,
-0.3984702, -0.9616886, -1.184387, 0, 1, 0.05882353, 1,
-0.3968683, -0.6654664, -3.618941, 0, 1, 0.0627451, 1,
-0.3965282, -1.352942, -3.63809, 0, 1, 0.07058824, 1,
-0.3962356, 0.7746473, 0.1323534, 0, 1, 0.07450981, 1,
-0.3904636, -2.426148, -3.001193, 0, 1, 0.08235294, 1,
-0.3842109, 1.018065, 0.9292104, 0, 1, 0.08627451, 1,
-0.3835366, 0.4265689, -1.674765, 0, 1, 0.09411765, 1,
-0.3828344, 0.4903746, 0.4155804, 0, 1, 0.1019608, 1,
-0.3814494, -0.1829171, 0.08144066, 0, 1, 0.1058824, 1,
-0.3799847, -0.8229717, -2.368329, 0, 1, 0.1137255, 1,
-0.3771877, 0.9307758, -1.68517, 0, 1, 0.1176471, 1,
-0.3770202, 0.5680131, -0.2551971, 0, 1, 0.1254902, 1,
-0.3753868, -1.225181, -3.873879, 0, 1, 0.1294118, 1,
-0.3741165, -0.1274058, 0.3697006, 0, 1, 0.1372549, 1,
-0.3733045, 0.9888518, -1.321861, 0, 1, 0.1411765, 1,
-0.3732975, -0.2139522, -2.754695, 0, 1, 0.1490196, 1,
-0.3676687, 0.3174421, -0.6463052, 0, 1, 0.1529412, 1,
-0.3602207, -0.6671249, -1.890263, 0, 1, 0.1607843, 1,
-0.3551247, -0.1412784, -0.5970048, 0, 1, 0.1647059, 1,
-0.3489574, -1.257778, -2.72798, 0, 1, 0.172549, 1,
-0.3475363, 0.5174862, -1.764327, 0, 1, 0.1764706, 1,
-0.345488, -0.7903728, -3.488961, 0, 1, 0.1843137, 1,
-0.3451538, 0.001943564, -3.027447, 0, 1, 0.1882353, 1,
-0.3448464, 0.446674, -0.6950568, 0, 1, 0.1960784, 1,
-0.3443451, -1.248768, -2.135803, 0, 1, 0.2039216, 1,
-0.3429557, 0.809391, -0.4934391, 0, 1, 0.2078431, 1,
-0.3394332, 0.5349415, -1.478439, 0, 1, 0.2156863, 1,
-0.3385641, 0.6058875, -1.890682, 0, 1, 0.2196078, 1,
-0.33483, 0.8484422, -0.1451899, 0, 1, 0.227451, 1,
-0.3302459, -0.1046, -1.904989, 0, 1, 0.2313726, 1,
-0.3298074, -0.04791488, -2.185494, 0, 1, 0.2392157, 1,
-0.3289468, -1.313644, -3.271853, 0, 1, 0.2431373, 1,
-0.3284305, 0.6630113, -1.625071, 0, 1, 0.2509804, 1,
-0.3266964, 0.02288081, -1.515688, 0, 1, 0.254902, 1,
-0.326226, -0.02938688, -1.699317, 0, 1, 0.2627451, 1,
-0.3262122, 0.4135086, 0.2321974, 0, 1, 0.2666667, 1,
-0.3259573, 0.7034972, -0.4515134, 0, 1, 0.2745098, 1,
-0.3252652, -0.7082789, -4.687941, 0, 1, 0.2784314, 1,
-0.3250522, 1.605543, -1.06257, 0, 1, 0.2862745, 1,
-0.3237806, -1.062549, -1.950929, 0, 1, 0.2901961, 1,
-0.3194375, -1.129202, -2.553144, 0, 1, 0.2980392, 1,
-0.3168009, 1.592234, -0.6303917, 0, 1, 0.3058824, 1,
-0.3163867, 0.08588932, -2.604079, 0, 1, 0.3098039, 1,
-0.3163505, -1.924886, -2.035056, 0, 1, 0.3176471, 1,
-0.3114347, 0.82799, 0.1811276, 0, 1, 0.3215686, 1,
-0.3112539, -0.9466418, -2.622105, 0, 1, 0.3294118, 1,
-0.3108078, 0.094859, -1.571619, 0, 1, 0.3333333, 1,
-0.3104517, -1.612303, -2.236441, 0, 1, 0.3411765, 1,
-0.308128, 0.1521628, 1.352264, 0, 1, 0.345098, 1,
-0.3072414, -0.5073056, -5.206823, 0, 1, 0.3529412, 1,
-0.3016235, 0.4042972, -1.307286, 0, 1, 0.3568628, 1,
-0.2978124, -0.2356988, -2.848537, 0, 1, 0.3647059, 1,
-0.2959238, 0.2302272, -1.494843, 0, 1, 0.3686275, 1,
-0.2942954, 1.389053, 0.6739957, 0, 1, 0.3764706, 1,
-0.2861755, -0.8849887, -2.274069, 0, 1, 0.3803922, 1,
-0.2828301, -1.720131, -3.65276, 0, 1, 0.3882353, 1,
-0.2780034, -0.8913643, -1.942072, 0, 1, 0.3921569, 1,
-0.275627, -0.618457, -1.137506, 0, 1, 0.4, 1,
-0.2690862, -0.2325534, -3.21778, 0, 1, 0.4078431, 1,
-0.2618954, -1.994579, -3.09932, 0, 1, 0.4117647, 1,
-0.2600633, -1.143528, -4.407615, 0, 1, 0.4196078, 1,
-0.2545778, 0.2838669, 1.13491, 0, 1, 0.4235294, 1,
-0.2533829, -1.18822, -0.3190176, 0, 1, 0.4313726, 1,
-0.253246, -0.5532286, -3.319192, 0, 1, 0.4352941, 1,
-0.2522882, 1.135387, -0.2010308, 0, 1, 0.4431373, 1,
-0.2497461, 0.8452079, 0.9912848, 0, 1, 0.4470588, 1,
-0.248437, 1.17802, 1.348793, 0, 1, 0.454902, 1,
-0.2458507, -0.5567926, -2.44058, 0, 1, 0.4588235, 1,
-0.2443285, -0.1804658, -3.506203, 0, 1, 0.4666667, 1,
-0.2423904, 0.08734334, -1.160033, 0, 1, 0.4705882, 1,
-0.239964, -1.858973, -3.282124, 0, 1, 0.4784314, 1,
-0.2382768, -0.5160112, -1.811616, 0, 1, 0.4823529, 1,
-0.2374934, -2.914809, -3.762357, 0, 1, 0.4901961, 1,
-0.2363106, -0.6450945, -2.655462, 0, 1, 0.4941176, 1,
-0.2326069, -0.5149526, -2.053406, 0, 1, 0.5019608, 1,
-0.2277692, 0.1450391, -0.4565299, 0, 1, 0.509804, 1,
-0.2210807, -0.4655949, -2.73737, 0, 1, 0.5137255, 1,
-0.2208245, -1.894123, -3.349209, 0, 1, 0.5215687, 1,
-0.2186527, 0.2420793, -1.534903, 0, 1, 0.5254902, 1,
-0.2180977, -0.1757952, -2.267951, 0, 1, 0.5333334, 1,
-0.2180613, -1.55388, -3.149343, 0, 1, 0.5372549, 1,
-0.2176565, 0.7436357, -1.066943, 0, 1, 0.5450981, 1,
-0.216037, 0.9877918, 1.464785, 0, 1, 0.5490196, 1,
-0.2084443, -1.304515, -2.767619, 0, 1, 0.5568628, 1,
-0.2032946, 1.117365, -1.081507, 0, 1, 0.5607843, 1,
-0.2028533, -0.7708255, -2.24345, 0, 1, 0.5686275, 1,
-0.2000949, 0.1956763, -2.940628, 0, 1, 0.572549, 1,
-0.1999952, -0.9507965, -2.957998, 0, 1, 0.5803922, 1,
-0.198712, -0.2868663, -1.802829, 0, 1, 0.5843138, 1,
-0.1955022, -0.7699881, -2.691323, 0, 1, 0.5921569, 1,
-0.1900529, -0.03078188, -3.021494, 0, 1, 0.5960785, 1,
-0.1891974, 1.08416, -0.7562198, 0, 1, 0.6039216, 1,
-0.1869093, -0.2214004, -1.510707, 0, 1, 0.6117647, 1,
-0.1847422, -1.013957, -2.782064, 0, 1, 0.6156863, 1,
-0.1845822, -0.7119009, -1.936712, 0, 1, 0.6235294, 1,
-0.1778042, -0.1668337, -0.127924, 0, 1, 0.627451, 1,
-0.1747838, 0.2828574, -2.068361, 0, 1, 0.6352941, 1,
-0.170095, -1.916653, -2.635024, 0, 1, 0.6392157, 1,
-0.1688656, 1.46853, 1.476354, 0, 1, 0.6470588, 1,
-0.1684266, 0.2670324, -0.2662681, 0, 1, 0.6509804, 1,
-0.1652228, -0.8880388, -3.459187, 0, 1, 0.6588235, 1,
-0.1642749, -0.5367075, -2.3677, 0, 1, 0.6627451, 1,
-0.1622728, -0.3256043, -2.435395, 0, 1, 0.6705883, 1,
-0.1605759, -0.9897811, -2.599671, 0, 1, 0.6745098, 1,
-0.1604873, -0.03011061, -2.065291, 0, 1, 0.682353, 1,
-0.1583463, -1.398654, -3.321901, 0, 1, 0.6862745, 1,
-0.1515477, 0.1877883, -1.601405, 0, 1, 0.6941177, 1,
-0.1470494, 0.7494513, -0.108663, 0, 1, 0.7019608, 1,
-0.141516, 0.4782069, 0.4318255, 0, 1, 0.7058824, 1,
-0.141345, 0.2481879, -2.199961, 0, 1, 0.7137255, 1,
-0.1361579, -0.1947313, -1.925689, 0, 1, 0.7176471, 1,
-0.1337681, 1.568697, 0.8055611, 0, 1, 0.7254902, 1,
-0.1296568, 1.093696, -0.2806546, 0, 1, 0.7294118, 1,
-0.120003, 1.293617, 0.4324004, 0, 1, 0.7372549, 1,
-0.1196504, 0.6881561, -0.2228722, 0, 1, 0.7411765, 1,
-0.1183733, -3.539655, -2.670779, 0, 1, 0.7490196, 1,
-0.1167096, 0.3527001, -1.46461, 0, 1, 0.7529412, 1,
-0.1158224, -1.50405, -2.216476, 0, 1, 0.7607843, 1,
-0.1122738, 0.1906563, -0.7468989, 0, 1, 0.7647059, 1,
-0.1070701, -0.1263352, -2.08777, 0, 1, 0.772549, 1,
-0.1062023, -0.0783993, -2.569475, 0, 1, 0.7764706, 1,
-0.1055966, -1.812549, -3.79563, 0, 1, 0.7843137, 1,
-0.1043077, 0.1767826, 0.6684511, 0, 1, 0.7882353, 1,
-0.1007073, 0.6394622, 0.392942, 0, 1, 0.7960784, 1,
-0.09671832, 1.407514, 1.571328, 0, 1, 0.8039216, 1,
-0.09669075, -2.342753, -3.267303, 0, 1, 0.8078431, 1,
-0.09480719, -1.08232, -2.978655, 0, 1, 0.8156863, 1,
-0.09328488, 0.9146413, 0.7518204, 0, 1, 0.8196079, 1,
-0.08645456, -0.2189199, -4.088055, 0, 1, 0.827451, 1,
-0.08524033, -0.03038691, -2.415453, 0, 1, 0.8313726, 1,
-0.08472551, -0.2883818, -3.775866, 0, 1, 0.8392157, 1,
-0.07745185, -1.762049, -3.772296, 0, 1, 0.8431373, 1,
-0.07712083, 0.3933397, -1.075784, 0, 1, 0.8509804, 1,
-0.07688361, 1.224504, 1.595548, 0, 1, 0.854902, 1,
-0.06499024, -0.6075927, -3.959156, 0, 1, 0.8627451, 1,
-0.06291064, 2.129704, 0.06934699, 0, 1, 0.8666667, 1,
-0.06065675, 1.067758, 1.862993, 0, 1, 0.8745098, 1,
-0.06007952, -1.451726, -2.624417, 0, 1, 0.8784314, 1,
-0.058039, 0.2802415, 1.261325, 0, 1, 0.8862745, 1,
-0.05718158, 1.013695, -0.5241962, 0, 1, 0.8901961, 1,
-0.05098413, 1.308872, 0.4809437, 0, 1, 0.8980392, 1,
-0.049049, -0.2672319, -4.053347, 0, 1, 0.9058824, 1,
-0.04760114, -2.56709, -1.981439, 0, 1, 0.9098039, 1,
-0.04752418, 0.1109294, -1.528543, 0, 1, 0.9176471, 1,
-0.04504103, 0.3863677, 0.1642205, 0, 1, 0.9215686, 1,
-0.04304155, -1.406373, -4.493426, 0, 1, 0.9294118, 1,
-0.03758445, 1.356827, 0.7663422, 0, 1, 0.9333333, 1,
-0.03644522, -0.01126704, -2.320872, 0, 1, 0.9411765, 1,
-0.03599296, 0.2965547, -0.4520942, 0, 1, 0.945098, 1,
-0.03240607, 0.007390568, -0.8719616, 0, 1, 0.9529412, 1,
-0.02983485, -0.1235121, -4.839068, 0, 1, 0.9568627, 1,
-0.02952789, -0.612955, -2.299187, 0, 1, 0.9647059, 1,
-0.02656424, -1.168079, -4.059345, 0, 1, 0.9686275, 1,
-0.02646291, -0.1137309, -1.505563, 0, 1, 0.9764706, 1,
-0.0228149, 1.933184, 0.8874138, 0, 1, 0.9803922, 1,
-0.01807461, 0.209974, 0.5332267, 0, 1, 0.9882353, 1,
-0.009547163, -1.160772, -3.304472, 0, 1, 0.9921569, 1,
-0.009021639, -0.5256285, -2.952255, 0, 1, 1, 1,
-0.007058515, 0.1006316, -0.4879716, 0, 0.9921569, 1, 1,
0.0004627921, -1.360324, 2.437964, 0, 0.9882353, 1, 1,
0.0009546501, -1.228467, 1.466074, 0, 0.9803922, 1, 1,
0.004147718, -0.2241827, 2.776347, 0, 0.9764706, 1, 1,
0.00544834, 1.13707, -2.033743, 0, 0.9686275, 1, 1,
0.008049117, 0.8648166, -1.215879, 0, 0.9647059, 1, 1,
0.009683098, -1.50383, 1.858351, 0, 0.9568627, 1, 1,
0.0134561, 0.7060781, 1.305537, 0, 0.9529412, 1, 1,
0.0135266, -0.2595688, 3.094863, 0, 0.945098, 1, 1,
0.01359717, 0.569415, -2.169051, 0, 0.9411765, 1, 1,
0.01529882, 0.3165296, -1.382106, 0, 0.9333333, 1, 1,
0.01585149, 0.308593, 0.2819068, 0, 0.9294118, 1, 1,
0.01783158, -0.3645861, 2.181686, 0, 0.9215686, 1, 1,
0.02454341, -0.5448269, 4.149509, 0, 0.9176471, 1, 1,
0.0312001, 0.6619252, -1.114496, 0, 0.9098039, 1, 1,
0.03287085, -0.2215727, 2.942782, 0, 0.9058824, 1, 1,
0.03990493, 0.5986384, 1.872836, 0, 0.8980392, 1, 1,
0.04087776, -0.3754388, 3.221927, 0, 0.8901961, 1, 1,
0.04140546, 0.02112148, 2.743758, 0, 0.8862745, 1, 1,
0.04308352, 0.3980437, 1.53651, 0, 0.8784314, 1, 1,
0.04340602, -0.6021128, 1.807082, 0, 0.8745098, 1, 1,
0.04454212, -0.3727944, 3.176529, 0, 0.8666667, 1, 1,
0.04663807, 0.844584, -0.8754073, 0, 0.8627451, 1, 1,
0.04713301, -0.2073897, 1.71172, 0, 0.854902, 1, 1,
0.05678929, -0.1199608, 4.413877, 0, 0.8509804, 1, 1,
0.06087941, -0.5408126, 3.517022, 0, 0.8431373, 1, 1,
0.06892318, 0.7323358, 0.94317, 0, 0.8392157, 1, 1,
0.07018206, -0.7650863, 3.862348, 0, 0.8313726, 1, 1,
0.07131961, -1.050094, 3.428735, 0, 0.827451, 1, 1,
0.07213756, 0.4869882, 0.02428257, 0, 0.8196079, 1, 1,
0.07315636, -0.08254429, 3.818769, 0, 0.8156863, 1, 1,
0.07407798, -1.165534, 3.37584, 0, 0.8078431, 1, 1,
0.07926906, 1.110277, 0.2686248, 0, 0.8039216, 1, 1,
0.08461281, 2.838679, -1.655304, 0, 0.7960784, 1, 1,
0.08719125, 0.2873218, 0.3881555, 0, 0.7882353, 1, 1,
0.0879541, 0.57865, 0.9754578, 0, 0.7843137, 1, 1,
0.08842257, -0.01445868, 2.455662, 0, 0.7764706, 1, 1,
0.08842401, -0.08471853, 1.88796, 0, 0.772549, 1, 1,
0.08852883, 1.135499, 1.184859, 0, 0.7647059, 1, 1,
0.08983357, -1.042532, 3.87556, 0, 0.7607843, 1, 1,
0.09129399, 1.457296, 0.3048897, 0, 0.7529412, 1, 1,
0.09152077, -1.31589, 3.249102, 0, 0.7490196, 1, 1,
0.09338042, 0.350622, 1.365523, 0, 0.7411765, 1, 1,
0.09373531, 0.3589996, -0.293397, 0, 0.7372549, 1, 1,
0.09562417, -0.2030679, 3.525824, 0, 0.7294118, 1, 1,
0.0960291, 0.7372411, 0.6810737, 0, 0.7254902, 1, 1,
0.09782796, -0.2756167, 4.962914, 0, 0.7176471, 1, 1,
0.1025501, -0.4094076, 4.168721, 0, 0.7137255, 1, 1,
0.1039822, -1.357315, 3.19886, 0, 0.7058824, 1, 1,
0.1043675, -1.710367, 1.833529, 0, 0.6980392, 1, 1,
0.1053679, -2.689787, 2.785179, 0, 0.6941177, 1, 1,
0.10545, -1.361115, 4.425207, 0, 0.6862745, 1, 1,
0.1060286, -1.842461, 2.656493, 0, 0.682353, 1, 1,
0.1070894, 0.8376449, 0.4799495, 0, 0.6745098, 1, 1,
0.1101009, -0.2908514, 3.897088, 0, 0.6705883, 1, 1,
0.1102719, -0.5562891, 2.591114, 0, 0.6627451, 1, 1,
0.1118888, 0.7811956, -1.887589, 0, 0.6588235, 1, 1,
0.1158801, 1.348085, 1.393389, 0, 0.6509804, 1, 1,
0.1160391, 0.4916145, -0.6108568, 0, 0.6470588, 1, 1,
0.1221816, -0.721013, 4.520763, 0, 0.6392157, 1, 1,
0.1222794, -2.016552, 2.466131, 0, 0.6352941, 1, 1,
0.1224082, 0.6472437, -0.4684764, 0, 0.627451, 1, 1,
0.1231578, 0.3347125, -1.52706, 0, 0.6235294, 1, 1,
0.1248558, 1.012625, -0.9356166, 0, 0.6156863, 1, 1,
0.1292978, -2.38884, 3.578642, 0, 0.6117647, 1, 1,
0.1298969, -0.8749003, 3.162067, 0, 0.6039216, 1, 1,
0.1338393, 1.142228, 1.452901, 0, 0.5960785, 1, 1,
0.1364307, 0.6518688, 1.3291, 0, 0.5921569, 1, 1,
0.1381909, -1.850656, 3.295321, 0, 0.5843138, 1, 1,
0.1462591, -0.4176976, 3.251019, 0, 0.5803922, 1, 1,
0.1464232, 1.390657, 0.4343455, 0, 0.572549, 1, 1,
0.1484844, -0.4752089, 2.344078, 0, 0.5686275, 1, 1,
0.1504727, -0.2922716, 1.405146, 0, 0.5607843, 1, 1,
0.1506493, -0.112249, 2.599411, 0, 0.5568628, 1, 1,
0.1590429, -0.8581758, 2.358582, 0, 0.5490196, 1, 1,
0.1626994, -1.078261, 5.267887, 0, 0.5450981, 1, 1,
0.1661521, -0.4904433, 3.44183, 0, 0.5372549, 1, 1,
0.1667334, -1.408231, 1.656123, 0, 0.5333334, 1, 1,
0.1726453, -1.769082, 2.638391, 0, 0.5254902, 1, 1,
0.1758189, 0.8268343, 0.8171991, 0, 0.5215687, 1, 1,
0.1758967, 0.263377, 0.7989662, 0, 0.5137255, 1, 1,
0.17613, 0.4127598, 0.3119496, 0, 0.509804, 1, 1,
0.177921, -0.4198427, 3.286803, 0, 0.5019608, 1, 1,
0.1793521, 0.5046289, -0.8551808, 0, 0.4941176, 1, 1,
0.1845926, 0.8539846, 0.5463521, 0, 0.4901961, 1, 1,
0.189532, 1.195216, -0.01890309, 0, 0.4823529, 1, 1,
0.1933124, -2.111886, 3.295851, 0, 0.4784314, 1, 1,
0.1959538, 0.7292774, 1.909632, 0, 0.4705882, 1, 1,
0.2040876, 1.3411, -0.6089227, 0, 0.4666667, 1, 1,
0.2079931, -0.9622062, 1.849355, 0, 0.4588235, 1, 1,
0.2102973, -0.1726673, 0.4975692, 0, 0.454902, 1, 1,
0.2135501, 0.8834293, 0.5638045, 0, 0.4470588, 1, 1,
0.2143437, 0.7623008, 0.1421579, 0, 0.4431373, 1, 1,
0.2178338, 0.02443282, 1.568196, 0, 0.4352941, 1, 1,
0.2231833, -0.1230108, 3.148626, 0, 0.4313726, 1, 1,
0.2255173, 1.814154, -0.5925067, 0, 0.4235294, 1, 1,
0.2280845, 0.5719051, 0.5705879, 0, 0.4196078, 1, 1,
0.2326659, 0.08544, 2.588514, 0, 0.4117647, 1, 1,
0.2365376, 0.1192693, 0.6696812, 0, 0.4078431, 1, 1,
0.239352, -1.626858, 3.227196, 0, 0.4, 1, 1,
0.2409179, 0.8803176, 0.5939255, 0, 0.3921569, 1, 1,
0.2431993, 0.7667332, -0.9983675, 0, 0.3882353, 1, 1,
0.2443423, 0.5216807, -0.6630092, 0, 0.3803922, 1, 1,
0.2464554, -0.5617501, 3.361248, 0, 0.3764706, 1, 1,
0.2487069, -0.6173081, 3.808839, 0, 0.3686275, 1, 1,
0.2496389, -1.45358, 1.852563, 0, 0.3647059, 1, 1,
0.2536931, -2.316579, 4.485132, 0, 0.3568628, 1, 1,
0.2540404, -0.883609, 4.748497, 0, 0.3529412, 1, 1,
0.2602068, 0.7872477, 0.05244159, 0, 0.345098, 1, 1,
0.2657259, 0.005503848, 1.829972, 0, 0.3411765, 1, 1,
0.2699916, -1.763659, 2.441219, 0, 0.3333333, 1, 1,
0.2713478, -0.8179052, 2.994945, 0, 0.3294118, 1, 1,
0.2722895, 0.207237, 2.147264, 0, 0.3215686, 1, 1,
0.2745118, 0.8394077, -0.3052595, 0, 0.3176471, 1, 1,
0.2788257, -1.097944, 3.507416, 0, 0.3098039, 1, 1,
0.2789592, 1.182395, 0.1601168, 0, 0.3058824, 1, 1,
0.2794553, -1.454241, 2.352167, 0, 0.2980392, 1, 1,
0.2805938, -0.4819137, 3.421332, 0, 0.2901961, 1, 1,
0.2821264, -0.2507717, 2.009273, 0, 0.2862745, 1, 1,
0.2905378, -0.1494891, 3.512227, 0, 0.2784314, 1, 1,
0.2933203, 0.6371664, 0.4045195, 0, 0.2745098, 1, 1,
0.2959518, -1.460632, 2.511457, 0, 0.2666667, 1, 1,
0.2989615, 0.3685827, 1.987349, 0, 0.2627451, 1, 1,
0.2994144, 0.4300714, 1.254023, 0, 0.254902, 1, 1,
0.2999806, 0.8835831, -0.9435618, 0, 0.2509804, 1, 1,
0.3009388, -0.9149488, 1.841568, 0, 0.2431373, 1, 1,
0.3021913, -0.5296417, 2.027031, 0, 0.2392157, 1, 1,
0.3096014, 0.9824718, -0.07624433, 0, 0.2313726, 1, 1,
0.3099234, -1.34725, 1.246892, 0, 0.227451, 1, 1,
0.3129473, 0.2233711, 0.5658649, 0, 0.2196078, 1, 1,
0.3136027, 1.736032, -0.5267161, 0, 0.2156863, 1, 1,
0.3141806, -1.736895, 2.883765, 0, 0.2078431, 1, 1,
0.3160446, -0.5968578, 3.623141, 0, 0.2039216, 1, 1,
0.3161027, 1.205677, 0.2182148, 0, 0.1960784, 1, 1,
0.3184011, 0.7042743, 0.8854599, 0, 0.1882353, 1, 1,
0.3187068, -0.1242276, 1.758973, 0, 0.1843137, 1, 1,
0.3243636, 0.1577103, 1.854283, 0, 0.1764706, 1, 1,
0.3282664, -0.7502534, 2.019615, 0, 0.172549, 1, 1,
0.3306868, -0.4193174, 3.630083, 0, 0.1647059, 1, 1,
0.3374571, -1.298435, 3.810908, 0, 0.1607843, 1, 1,
0.3391205, -1.148481, 3.826801, 0, 0.1529412, 1, 1,
0.3392331, 0.2775763, 0.612263, 0, 0.1490196, 1, 1,
0.3440627, 0.3224731, -0.5693361, 0, 0.1411765, 1, 1,
0.3471121, 1.260839, 0.8816, 0, 0.1372549, 1, 1,
0.3475961, 0.8406927, -0.04674006, 0, 0.1294118, 1, 1,
0.3505499, 0.9141604, -0.4396634, 0, 0.1254902, 1, 1,
0.3579452, 0.3315814, -1.777426, 0, 0.1176471, 1, 1,
0.3590751, 1.044623, -0.2161392, 0, 0.1137255, 1, 1,
0.3611288, 1.109556, 0.1438165, 0, 0.1058824, 1, 1,
0.3613074, -0.3839956, 3.263529, 0, 0.09803922, 1, 1,
0.3649288, -1.218705, 2.653879, 0, 0.09411765, 1, 1,
0.3699275, -0.7247602, 3.184133, 0, 0.08627451, 1, 1,
0.3743467, 0.1971526, 1.906907, 0, 0.08235294, 1, 1,
0.3748193, 2.125249, 0.09542543, 0, 0.07450981, 1, 1,
0.3762386, 0.2130345, 2.376446, 0, 0.07058824, 1, 1,
0.3767197, -0.5606067, 2.818601, 0, 0.0627451, 1, 1,
0.3782183, 1.723032, 0.7549744, 0, 0.05882353, 1, 1,
0.3785271, -0.9514616, 4.10112, 0, 0.05098039, 1, 1,
0.3796188, 0.2058537, 0.7882029, 0, 0.04705882, 1, 1,
0.3829182, 1.29919, 1.493106, 0, 0.03921569, 1, 1,
0.3841727, 0.3755558, 1.943987, 0, 0.03529412, 1, 1,
0.3891336, -1.351243, 0.8754237, 0, 0.02745098, 1, 1,
0.3905413, 0.4997316, -0.6401178, 0, 0.02352941, 1, 1,
0.3908483, -0.1070592, 1.615437, 0, 0.01568628, 1, 1,
0.3921351, 0.5128363, 1.750901, 0, 0.01176471, 1, 1,
0.39325, 0.5574829, 1.818892, 0, 0.003921569, 1, 1,
0.393678, 0.008871607, 1.453314, 0.003921569, 0, 1, 1,
0.3941469, 0.5816537, 1.310037, 0.007843138, 0, 1, 1,
0.3996227, 0.3347161, 2.195009, 0.01568628, 0, 1, 1,
0.4002739, 1.156578, -0.05868099, 0.01960784, 0, 1, 1,
0.4012268, 0.5908469, 1.474183, 0.02745098, 0, 1, 1,
0.4060835, 1.080266, 0.5714729, 0.03137255, 0, 1, 1,
0.4090315, -0.447951, 3.472352, 0.03921569, 0, 1, 1,
0.4172944, 0.434256, 0.9879073, 0.04313726, 0, 1, 1,
0.4194489, -0.09473798, -0.1838107, 0.05098039, 0, 1, 1,
0.4204514, 1.254131, 1.416206, 0.05490196, 0, 1, 1,
0.4207442, -0.2581951, 1.685183, 0.0627451, 0, 1, 1,
0.4230449, 0.6094117, 1.07929, 0.06666667, 0, 1, 1,
0.4255184, 0.1727716, 0.03952997, 0.07450981, 0, 1, 1,
0.4335348, -0.1414636, 2.997952, 0.07843138, 0, 1, 1,
0.4368117, 0.3604681, 0.6841897, 0.08627451, 0, 1, 1,
0.441213, 0.8053907, 0.5546659, 0.09019608, 0, 1, 1,
0.4428417, 0.9375977, -1.405305, 0.09803922, 0, 1, 1,
0.444423, -1.169403, 2.251223, 0.1058824, 0, 1, 1,
0.4518628, -1.213442, 3.247981, 0.1098039, 0, 1, 1,
0.4623085, -0.08576448, 4.019068, 0.1176471, 0, 1, 1,
0.4690039, 0.6542751, 0.579019, 0.1215686, 0, 1, 1,
0.4699819, -1.406065, 3.361301, 0.1294118, 0, 1, 1,
0.4717723, -1.272729, 2.876644, 0.1333333, 0, 1, 1,
0.4746934, -0.1075016, 3.640862, 0.1411765, 0, 1, 1,
0.4748736, 1.081671, 0.7581419, 0.145098, 0, 1, 1,
0.4759928, 0.5805312, 2.467311, 0.1529412, 0, 1, 1,
0.4762246, 2.816163, 1.650073, 0.1568628, 0, 1, 1,
0.4789307, 1.257418, -0.5734984, 0.1647059, 0, 1, 1,
0.4797565, -0.2824135, 2.946518, 0.1686275, 0, 1, 1,
0.4908213, -0.263396, 2.718503, 0.1764706, 0, 1, 1,
0.4937173, 0.07132887, 2.368459, 0.1803922, 0, 1, 1,
0.4955549, 1.766122, -0.3192016, 0.1882353, 0, 1, 1,
0.5008215, -1.861957, 2.105619, 0.1921569, 0, 1, 1,
0.5040774, -0.3794861, 0.5960405, 0.2, 0, 1, 1,
0.5068901, 0.4007415, -0.9546961, 0.2078431, 0, 1, 1,
0.5074457, -1.386554, 2.561011, 0.2117647, 0, 1, 1,
0.5085568, 0.9259045, -0.2700022, 0.2196078, 0, 1, 1,
0.5126427, 0.8725288, 0.1076923, 0.2235294, 0, 1, 1,
0.5194862, 0.0224972, 0.4113614, 0.2313726, 0, 1, 1,
0.5200217, -0.7644311, 1.838566, 0.2352941, 0, 1, 1,
0.5206103, 0.4832543, 2.414551, 0.2431373, 0, 1, 1,
0.5232393, -0.7982415, 2.414813, 0.2470588, 0, 1, 1,
0.5234069, 0.8861143, 0.0318919, 0.254902, 0, 1, 1,
0.5288678, 1.339691, 0.01985132, 0.2588235, 0, 1, 1,
0.5304906, 0.9780418, 0.2964544, 0.2666667, 0, 1, 1,
0.5344651, 0.3243718, 1.135792, 0.2705882, 0, 1, 1,
0.5346738, 0.2410704, 3.233885, 0.2784314, 0, 1, 1,
0.5346753, -1.056712, 3.051021, 0.282353, 0, 1, 1,
0.5409451, -1.63899, 2.38914, 0.2901961, 0, 1, 1,
0.5415203, 1.613516, 0.9065092, 0.2941177, 0, 1, 1,
0.542264, -0.5461768, 3.320393, 0.3019608, 0, 1, 1,
0.5436239, 0.05765865, 1.188594, 0.3098039, 0, 1, 1,
0.5451043, -0.6766777, 1.393178, 0.3137255, 0, 1, 1,
0.5467653, 1.832893, -1.231045, 0.3215686, 0, 1, 1,
0.5517246, -0.1124707, 0.168231, 0.3254902, 0, 1, 1,
0.5524997, -0.6411245, 2.684805, 0.3333333, 0, 1, 1,
0.5544929, -0.2447101, 1.086459, 0.3372549, 0, 1, 1,
0.5687544, -0.7043183, 2.348132, 0.345098, 0, 1, 1,
0.5711898, -1.123599, 3.743772, 0.3490196, 0, 1, 1,
0.571335, 0.7642849, 1.532078, 0.3568628, 0, 1, 1,
0.5737587, 0.04557173, 2.130899, 0.3607843, 0, 1, 1,
0.5742674, -0.02376891, 0.7654726, 0.3686275, 0, 1, 1,
0.5769881, -0.4411331, 2.427374, 0.372549, 0, 1, 1,
0.5797489, 0.03340035, 1.422185, 0.3803922, 0, 1, 1,
0.5922138, 0.2567984, 1.84481, 0.3843137, 0, 1, 1,
0.5957443, 1.510363, 0.966279, 0.3921569, 0, 1, 1,
0.5980019, -0.6887852, 2.705827, 0.3960784, 0, 1, 1,
0.5999069, 0.8299741, 1.953462, 0.4039216, 0, 1, 1,
0.6045027, -1.000396, 2.529688, 0.4117647, 0, 1, 1,
0.6049807, -0.3641635, 1.926704, 0.4156863, 0, 1, 1,
0.6066788, -1.38019, 3.381114, 0.4235294, 0, 1, 1,
0.607137, 0.5416106, 1.56105, 0.427451, 0, 1, 1,
0.6086611, 0.4326013, 2.690226, 0.4352941, 0, 1, 1,
0.6105554, 0.4303953, -0.8761103, 0.4392157, 0, 1, 1,
0.6157075, 0.2912888, 2.063077, 0.4470588, 0, 1, 1,
0.6164175, -1.525522, 3.144941, 0.4509804, 0, 1, 1,
0.6208676, -0.709963, 2.505245, 0.4588235, 0, 1, 1,
0.6222089, -0.6361349, 3.044098, 0.4627451, 0, 1, 1,
0.6239222, -0.2722057, 2.317356, 0.4705882, 0, 1, 1,
0.6304072, 0.01102164, 1.572951, 0.4745098, 0, 1, 1,
0.6353628, -0.8121107, 1.698444, 0.4823529, 0, 1, 1,
0.6384673, -0.04603755, 2.461607, 0.4862745, 0, 1, 1,
0.6518798, 0.1368749, 1.240726, 0.4941176, 0, 1, 1,
0.6609363, -0.5060333, 0.3732323, 0.5019608, 0, 1, 1,
0.6612107, 0.3966024, 0.4569123, 0.5058824, 0, 1, 1,
0.6620573, 0.3199622, 0.1290854, 0.5137255, 0, 1, 1,
0.6666991, 0.6519375, -1.225942, 0.5176471, 0, 1, 1,
0.6711945, -0.5141974, 1.448962, 0.5254902, 0, 1, 1,
0.6737437, 0.08775553, 1.610147, 0.5294118, 0, 1, 1,
0.6786408, 1.792655, 1.440836, 0.5372549, 0, 1, 1,
0.6787131, 1.247035, -2.168868, 0.5411765, 0, 1, 1,
0.6875387, 0.3465015, -0.1066281, 0.5490196, 0, 1, 1,
0.7012537, 0.2900759, -0.06915737, 0.5529412, 0, 1, 1,
0.7016098, -1.305764, 2.075886, 0.5607843, 0, 1, 1,
0.7063546, -0.5305271, 3.569413, 0.5647059, 0, 1, 1,
0.7067521, -0.418566, 2.751547, 0.572549, 0, 1, 1,
0.7155923, -1.307221, 3.130894, 0.5764706, 0, 1, 1,
0.715636, 0.762087, 0.1069448, 0.5843138, 0, 1, 1,
0.7158577, -1.780549, 2.577647, 0.5882353, 0, 1, 1,
0.7234445, -0.1261687, 2.174223, 0.5960785, 0, 1, 1,
0.7261834, -0.07896515, 0.9158518, 0.6039216, 0, 1, 1,
0.7278302, -1.149212, 3.27977, 0.6078432, 0, 1, 1,
0.7287574, -1.68323, 3.245922, 0.6156863, 0, 1, 1,
0.7299308, -0.7774013, 1.437628, 0.6196079, 0, 1, 1,
0.7345936, 0.1889185, 1.283313, 0.627451, 0, 1, 1,
0.7391348, -0.7204459, 1.786598, 0.6313726, 0, 1, 1,
0.742579, -0.05622707, 2.802156, 0.6392157, 0, 1, 1,
0.747614, -0.1181123, 2.589307, 0.6431373, 0, 1, 1,
0.7513854, 0.09997812, 0.8501137, 0.6509804, 0, 1, 1,
0.7522352, -0.5897221, 2.329092, 0.654902, 0, 1, 1,
0.7595129, -1.844049, 3.444214, 0.6627451, 0, 1, 1,
0.7646942, -1.537798, 3.292644, 0.6666667, 0, 1, 1,
0.7658843, 0.3468252, 1.297661, 0.6745098, 0, 1, 1,
0.7679515, -0.05109366, 2.254155, 0.6784314, 0, 1, 1,
0.7684518, 1.527142, 1.307704, 0.6862745, 0, 1, 1,
0.7700596, 1.390296, -0.2672923, 0.6901961, 0, 1, 1,
0.7706048, -0.6416825, 2.319342, 0.6980392, 0, 1, 1,
0.7726486, 2.64147, -0.8824241, 0.7058824, 0, 1, 1,
0.7729914, -0.6179384, 2.021227, 0.7098039, 0, 1, 1,
0.7730452, -0.7541846, 1.407834, 0.7176471, 0, 1, 1,
0.7733244, 0.7035165, 0.4450142, 0.7215686, 0, 1, 1,
0.7745834, -1.535255, 3.931793, 0.7294118, 0, 1, 1,
0.7838207, -1.430512, 3.076223, 0.7333333, 0, 1, 1,
0.7848104, -0.6728303, 1.767427, 0.7411765, 0, 1, 1,
0.7926125, -1.913642, 3.96025, 0.7450981, 0, 1, 1,
0.7955507, -0.9194786, 2.426334, 0.7529412, 0, 1, 1,
0.7972637, 0.4101747, 3.076678, 0.7568628, 0, 1, 1,
0.7973911, 1.057554, 1.503213, 0.7647059, 0, 1, 1,
0.8003551, 0.6125059, -0.1125331, 0.7686275, 0, 1, 1,
0.8008144, 0.8926304, 0.6630628, 0.7764706, 0, 1, 1,
0.802085, -0.5586964, 2.739567, 0.7803922, 0, 1, 1,
0.8059126, 0.5408651, 1.845921, 0.7882353, 0, 1, 1,
0.812283, 0.7063008, -0.3805542, 0.7921569, 0, 1, 1,
0.8151138, -0.6820113, 2.546328, 0.8, 0, 1, 1,
0.8185322, -0.0466648, 1.160899, 0.8078431, 0, 1, 1,
0.8187123, 0.211067, 0.8436155, 0.8117647, 0, 1, 1,
0.819689, -0.2091582, 0.5167347, 0.8196079, 0, 1, 1,
0.8265021, 0.9748439, -0.09269397, 0.8235294, 0, 1, 1,
0.828673, -0.3419485, 3.97005, 0.8313726, 0, 1, 1,
0.8307067, -0.01101734, 0.2177062, 0.8352941, 0, 1, 1,
0.8322931, 2.060617, -0.669202, 0.8431373, 0, 1, 1,
0.835743, 0.4882721, 1.631158, 0.8470588, 0, 1, 1,
0.8448466, -1.097607, 0.9860063, 0.854902, 0, 1, 1,
0.8502519, -0.8796237, 3.948266, 0.8588235, 0, 1, 1,
0.8574274, -0.381979, 1.593521, 0.8666667, 0, 1, 1,
0.861651, 1.169646, -0.08008887, 0.8705882, 0, 1, 1,
0.871724, -0.569854, 2.971125, 0.8784314, 0, 1, 1,
0.8739407, 0.1016052, 1.715392, 0.8823529, 0, 1, 1,
0.874164, -1.137147, 1.875833, 0.8901961, 0, 1, 1,
0.875676, 0.6380336, 1.260149, 0.8941177, 0, 1, 1,
0.8776746, -0.5577288, 2.348773, 0.9019608, 0, 1, 1,
0.8788553, -0.6743292, 2.266308, 0.9098039, 0, 1, 1,
0.882412, -0.8536878, 2.855522, 0.9137255, 0, 1, 1,
0.8903472, 0.07777561, -0.1962174, 0.9215686, 0, 1, 1,
0.8939449, -0.681474, 1.418937, 0.9254902, 0, 1, 1,
0.8996603, -0.3254138, 3.386068, 0.9333333, 0, 1, 1,
0.9025705, -0.8756269, 2.603419, 0.9372549, 0, 1, 1,
0.9059695, 0.01869955, 1.780402, 0.945098, 0, 1, 1,
0.9078104, 0.1957027, 1.278626, 0.9490196, 0, 1, 1,
0.9079931, -0.2586724, 1.270461, 0.9568627, 0, 1, 1,
0.9106591, -0.5217983, 2.004396, 0.9607843, 0, 1, 1,
0.9143059, -0.3012513, 0.8674101, 0.9686275, 0, 1, 1,
0.9230272, -0.2927833, 1.029175, 0.972549, 0, 1, 1,
0.9236706, -0.3987086, 1.536088, 0.9803922, 0, 1, 1,
0.9248044, 0.5445012, 0.4524775, 0.9843137, 0, 1, 1,
0.9286171, 0.8198023, 2.652783, 0.9921569, 0, 1, 1,
0.93151, -1.084686, 2.68752, 0.9960784, 0, 1, 1,
0.9326968, 1.079235, -0.4947523, 1, 0, 0.9960784, 1,
0.9354381, 1.864657, -0.5865897, 1, 0, 0.9882353, 1,
0.9493817, 0.1215492, -0.3382649, 1, 0, 0.9843137, 1,
0.9509337, 0.3357007, 0.7412371, 1, 0, 0.9764706, 1,
0.9544637, -0.6682894, 2.817832, 1, 0, 0.972549, 1,
0.9591496, -0.7292951, 2.056904, 1, 0, 0.9647059, 1,
0.9635077, -1.279685, 2.497474, 1, 0, 0.9607843, 1,
0.964593, 0.465445, 0.9117623, 1, 0, 0.9529412, 1,
0.9708259, 1.422077, 1.971973, 1, 0, 0.9490196, 1,
0.9804081, -1.015484, 2.893786, 1, 0, 0.9411765, 1,
0.9808389, -0.0719148, 1.699711, 1, 0, 0.9372549, 1,
0.9866886, -0.3443974, 2.228372, 1, 0, 0.9294118, 1,
0.9949258, -1.826445, 0.5227298, 1, 0, 0.9254902, 1,
0.999307, -0.2027697, 3.302386, 1, 0, 0.9176471, 1,
1.00977, 0.2040068, 0.945237, 1, 0, 0.9137255, 1,
1.017702, -0.1975162, 2.314583, 1, 0, 0.9058824, 1,
1.019367, 1.081438, 3.258513, 1, 0, 0.9019608, 1,
1.026313, -1.607105, 1.515959, 1, 0, 0.8941177, 1,
1.032705, 0.5733382, 2.784323, 1, 0, 0.8862745, 1,
1.033391, -0.4335172, 3.977506, 1, 0, 0.8823529, 1,
1.046491, -1.233112, 3.576322, 1, 0, 0.8745098, 1,
1.04709, 0.05814549, 1.367455, 1, 0, 0.8705882, 1,
1.047389, 0.002209634, 2.423988, 1, 0, 0.8627451, 1,
1.05303, 1.87691, 0.9948679, 1, 0, 0.8588235, 1,
1.053633, -1.434565, 4.1865, 1, 0, 0.8509804, 1,
1.053912, 0.2154569, 1.352275, 1, 0, 0.8470588, 1,
1.05639, -0.4528844, 1.807124, 1, 0, 0.8392157, 1,
1.059712, 0.5284047, 1.128592, 1, 0, 0.8352941, 1,
1.072646, 0.4869824, 0.8877343, 1, 0, 0.827451, 1,
1.076593, -1.389302, 3.482398, 1, 0, 0.8235294, 1,
1.078958, 0.4123864, 1.292858, 1, 0, 0.8156863, 1,
1.078962, -1.045249, 2.580436, 1, 0, 0.8117647, 1,
1.082907, -1.379816, 1.666168, 1, 0, 0.8039216, 1,
1.102629, -0.7047266, 2.372004, 1, 0, 0.7960784, 1,
1.104454, -1.472622, 2.603749, 1, 0, 0.7921569, 1,
1.107748, 1.366199, 1.563631, 1, 0, 0.7843137, 1,
1.11472, -1.023929, 4.00271, 1, 0, 0.7803922, 1,
1.115215, 0.8817594, 1.949857, 1, 0, 0.772549, 1,
1.120096, 1.61283, -0.2149576, 1, 0, 0.7686275, 1,
1.122012, -1.073905, 2.40739, 1, 0, 0.7607843, 1,
1.122904, -0.3582006, 3.682262, 1, 0, 0.7568628, 1,
1.132546, 0.5661053, -0.08307844, 1, 0, 0.7490196, 1,
1.144435, 1.720279, 0.7695953, 1, 0, 0.7450981, 1,
1.144724, -0.4903621, 1.444336, 1, 0, 0.7372549, 1,
1.154866, 0.2579268, -0.8173947, 1, 0, 0.7333333, 1,
1.155441, -0.7074524, 2.197033, 1, 0, 0.7254902, 1,
1.155634, 0.3387294, -0.5540965, 1, 0, 0.7215686, 1,
1.15644, 0.8386667, 0.3314078, 1, 0, 0.7137255, 1,
1.156468, 1.915863, 1.593673, 1, 0, 0.7098039, 1,
1.16116, -0.9558322, -0.8800893, 1, 0, 0.7019608, 1,
1.161568, 3.517545, 2.637973, 1, 0, 0.6941177, 1,
1.16691, -1.15288, 4.051119, 1, 0, 0.6901961, 1,
1.167996, -0.6103169, 1.257805, 1, 0, 0.682353, 1,
1.176904, 1.579082, 0.5150605, 1, 0, 0.6784314, 1,
1.180708, 2.348915, -0.6689189, 1, 0, 0.6705883, 1,
1.196438, 0.3333453, 1.463742, 1, 0, 0.6666667, 1,
1.203597, -1.184959, 2.397179, 1, 0, 0.6588235, 1,
1.207189, -0.7223467, 0.8939641, 1, 0, 0.654902, 1,
1.214776, -1.004345, 2.151717, 1, 0, 0.6470588, 1,
1.21578, 1.029055, -0.3694583, 1, 0, 0.6431373, 1,
1.218511, -0.08475707, 3.368288, 1, 0, 0.6352941, 1,
1.223385, -0.564483, 2.148469, 1, 0, 0.6313726, 1,
1.232978, -2.098341, 0.437451, 1, 0, 0.6235294, 1,
1.235287, -0.5296749, 2.254328, 1, 0, 0.6196079, 1,
1.235355, 0.1054164, 1.482404, 1, 0, 0.6117647, 1,
1.239322, -0.2668392, 1.599325, 1, 0, 0.6078432, 1,
1.243682, 0.6991434, 1.862563, 1, 0, 0.6, 1,
1.244175, -1.028838, 2.187918, 1, 0, 0.5921569, 1,
1.257865, -1.60159, 1.609444, 1, 0, 0.5882353, 1,
1.259667, -1.133552, 4.019327, 1, 0, 0.5803922, 1,
1.263097, 0.9251981, 0.4327041, 1, 0, 0.5764706, 1,
1.270113, 0.9295533, 1.117043, 1, 0, 0.5686275, 1,
1.291269, -0.305779, 1.236781, 1, 0, 0.5647059, 1,
1.293873, 0.5039799, -2.22887, 1, 0, 0.5568628, 1,
1.293939, 1.378411, 1.032705, 1, 0, 0.5529412, 1,
1.303347, -0.3324816, 2.572605, 1, 0, 0.5450981, 1,
1.309082, -0.6492717, 1.765473, 1, 0, 0.5411765, 1,
1.312459, 1.001099, 2.483661, 1, 0, 0.5333334, 1,
1.317438, 0.4878023, 0.400987, 1, 0, 0.5294118, 1,
1.325153, 0.9645838, 2.158321, 1, 0, 0.5215687, 1,
1.325241, 0.3573882, -0.3007918, 1, 0, 0.5176471, 1,
1.332169, 0.1221788, 1.98663, 1, 0, 0.509804, 1,
1.351678, 0.8350589, 1.031528, 1, 0, 0.5058824, 1,
1.358047, -0.8422553, 3.717316, 1, 0, 0.4980392, 1,
1.359491, -0.9568399, 2.739906, 1, 0, 0.4901961, 1,
1.362427, -0.5711588, 0.8050098, 1, 0, 0.4862745, 1,
1.367443, -0.680101, 1.276866, 1, 0, 0.4784314, 1,
1.369932, 1.068297, 0.03198509, 1, 0, 0.4745098, 1,
1.37307, -3.004018, 2.293501, 1, 0, 0.4666667, 1,
1.375942, 0.3991835, 0.7304645, 1, 0, 0.4627451, 1,
1.397376, -0.0514147, 2.174747, 1, 0, 0.454902, 1,
1.404546, 1.329253, 0.7646781, 1, 0, 0.4509804, 1,
1.405818, -1.002633, 0.8418412, 1, 0, 0.4431373, 1,
1.417576, -0.3339863, 2.498543, 1, 0, 0.4392157, 1,
1.423462, -0.3067951, 1.826773, 1, 0, 0.4313726, 1,
1.428412, -0.8765513, 3.288684, 1, 0, 0.427451, 1,
1.430431, 1.545369, -0.8116839, 1, 0, 0.4196078, 1,
1.432325, 1.763776, 0.379103, 1, 0, 0.4156863, 1,
1.433982, -2.523792, 2.180596, 1, 0, 0.4078431, 1,
1.439472, -1.10444, 2.595024, 1, 0, 0.4039216, 1,
1.445163, 0.6825415, 0.8836519, 1, 0, 0.3960784, 1,
1.445939, 0.484189, 1.285249, 1, 0, 0.3882353, 1,
1.472742, 0.422638, 1.069188, 1, 0, 0.3843137, 1,
1.485209, -1.440177, 3.7427, 1, 0, 0.3764706, 1,
1.495623, 0.3591112, 0.9333624, 1, 0, 0.372549, 1,
1.499727, 0.9076732, 1.492358, 1, 0, 0.3647059, 1,
1.529818, -1.215675, 2.67618, 1, 0, 0.3607843, 1,
1.530211, 0.2426548, 2.682636, 1, 0, 0.3529412, 1,
1.557015, -0.09708636, 2.527224, 1, 0, 0.3490196, 1,
1.580394, 0.618295, 0.03449981, 1, 0, 0.3411765, 1,
1.590323, -0.7718471, 1.173349, 1, 0, 0.3372549, 1,
1.608305, 1.141441, 0.5538861, 1, 0, 0.3294118, 1,
1.613318, -0.3797924, 1.425349, 1, 0, 0.3254902, 1,
1.613758, -1.368544, 3.182732, 1, 0, 0.3176471, 1,
1.615115, 0.4301998, 1.984802, 1, 0, 0.3137255, 1,
1.640509, 1.2485, -0.1547174, 1, 0, 0.3058824, 1,
1.640921, 0.4541515, 0.1792228, 1, 0, 0.2980392, 1,
1.667104, -0.01030699, 2.432163, 1, 0, 0.2941177, 1,
1.678346, 0.409064, 2.858875, 1, 0, 0.2862745, 1,
1.67955, -1.114122, 0.8467968, 1, 0, 0.282353, 1,
1.708885, -1.120824, 0.9480038, 1, 0, 0.2745098, 1,
1.708896, 0.04525129, 3.160108, 1, 0, 0.2705882, 1,
1.716073, -1.65489, 1.952134, 1, 0, 0.2627451, 1,
1.716154, 0.4984556, 1.382914, 1, 0, 0.2588235, 1,
1.743293, 0.03440153, 2.495397, 1, 0, 0.2509804, 1,
1.751964, -0.5395743, 1.63339, 1, 0, 0.2470588, 1,
1.758595, -1.342227, 3.927521, 1, 0, 0.2392157, 1,
1.759323, -1.155445, 2.173828, 1, 0, 0.2352941, 1,
1.764731, -0.6410388, 2.42201, 1, 0, 0.227451, 1,
1.783356, -0.4197904, 0.8771482, 1, 0, 0.2235294, 1,
1.791558, 0.4863864, 1.471323, 1, 0, 0.2156863, 1,
1.874455, 1.043937, 0.2106039, 1, 0, 0.2117647, 1,
1.895328, -1.496591, 1.344568, 1, 0, 0.2039216, 1,
1.916313, -0.3913364, 2.674837, 1, 0, 0.1960784, 1,
1.926222, 0.06495305, 0.907734, 1, 0, 0.1921569, 1,
1.960227, -1.528264, 2.460525, 1, 0, 0.1843137, 1,
1.974693, -0.5461006, 3.291971, 1, 0, 0.1803922, 1,
1.975577, 0.3268121, 3.364768, 1, 0, 0.172549, 1,
1.981131, -0.7543518, 0.5104417, 1, 0, 0.1686275, 1,
1.98946, 0.67349, 1.133357, 1, 0, 0.1607843, 1,
1.993605, -2.488334, 1.531612, 1, 0, 0.1568628, 1,
2.01642, 0.06895383, 1.794781, 1, 0, 0.1490196, 1,
2.03043, 0.1106202, 2.704468, 1, 0, 0.145098, 1,
2.039972, 1.268767, 0.4013703, 1, 0, 0.1372549, 1,
2.040834, 0.353591, -0.516777, 1, 0, 0.1333333, 1,
2.05328, -0.09479555, 1.470022, 1, 0, 0.1254902, 1,
2.057367, 0.7482526, 1.441154, 1, 0, 0.1215686, 1,
2.194142, 0.5188761, 0.9805664, 1, 0, 0.1137255, 1,
2.225725, -0.2311668, 2.276664, 1, 0, 0.1098039, 1,
2.233597, 1.065594, 0.0662296, 1, 0, 0.1019608, 1,
2.235954, 2.38651, -0.5376285, 1, 0, 0.09411765, 1,
2.23988, 0.1032892, -0.354341, 1, 0, 0.09019608, 1,
2.244455, 0.5937188, 1.816953, 1, 0, 0.08235294, 1,
2.246822, -0.2849911, 1.392511, 1, 0, 0.07843138, 1,
2.312137, -0.1277018, 1.514312, 1, 0, 0.07058824, 1,
2.318146, -1.200098, 2.031071, 1, 0, 0.06666667, 1,
2.371918, 1.734519, 1.136722, 1, 0, 0.05882353, 1,
2.403554, -0.6665862, 1.870558, 1, 0, 0.05490196, 1,
2.415108, -1.474163, 0.5639988, 1, 0, 0.04705882, 1,
2.423194, 2.449163, -0.2763689, 1, 0, 0.04313726, 1,
2.459461, -1.159634, 1.787493, 1, 0, 0.03529412, 1,
2.778301, -1.106589, 2.188652, 1, 0, 0.03137255, 1,
2.885784, 0.4532266, 1.045078, 1, 0, 0.02352941, 1,
2.940712, -1.17695, 1.773107, 1, 0, 0.01960784, 1,
2.980861, -0.9385821, 2.70565, 1, 0, 0.01176471, 1,
3.398867, 0.5425714, 2.059677, 1, 0, 0.007843138, 1
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
-0.4118128, -4.73585, -6.982286, 0, -0.5, 0.5, 0.5,
-0.4118128, -4.73585, -6.982286, 1, -0.5, 0.5, 0.5,
-0.4118128, -4.73585, -6.982286, 1, 1.5, 0.5, 0.5,
-0.4118128, -4.73585, -6.982286, 0, 1.5, 0.5, 0.5
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
-5.514313, -0.01105523, -6.982286, 0, -0.5, 0.5, 0.5,
-5.514313, -0.01105523, -6.982286, 1, -0.5, 0.5, 0.5,
-5.514313, -0.01105523, -6.982286, 1, 1.5, 0.5, 0.5,
-5.514313, -0.01105523, -6.982286, 0, 1.5, 0.5, 0.5
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
-5.514313, -4.73585, 0.03053212, 0, -0.5, 0.5, 0.5,
-5.514313, -4.73585, 0.03053212, 1, -0.5, 0.5, 0.5,
-5.514313, -4.73585, 0.03053212, 1, 1.5, 0.5, 0.5,
-5.514313, -4.73585, 0.03053212, 0, 1.5, 0.5, 0.5
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
-4, -3.645513, -5.363944,
2, -3.645513, -5.363944,
-4, -3.645513, -5.363944,
-4, -3.827236, -5.633667,
-2, -3.645513, -5.363944,
-2, -3.827236, -5.633667,
0, -3.645513, -5.363944,
0, -3.827236, -5.633667,
2, -3.645513, -5.363944,
2, -3.827236, -5.633667
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
"-4",
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
-4, -4.190681, -6.173115, 0, -0.5, 0.5, 0.5,
-4, -4.190681, -6.173115, 1, -0.5, 0.5, 0.5,
-4, -4.190681, -6.173115, 1, 1.5, 0.5, 0.5,
-4, -4.190681, -6.173115, 0, 1.5, 0.5, 0.5,
-2, -4.190681, -6.173115, 0, -0.5, 0.5, 0.5,
-2, -4.190681, -6.173115, 1, -0.5, 0.5, 0.5,
-2, -4.190681, -6.173115, 1, 1.5, 0.5, 0.5,
-2, -4.190681, -6.173115, 0, 1.5, 0.5, 0.5,
0, -4.190681, -6.173115, 0, -0.5, 0.5, 0.5,
0, -4.190681, -6.173115, 1, -0.5, 0.5, 0.5,
0, -4.190681, -6.173115, 1, 1.5, 0.5, 0.5,
0, -4.190681, -6.173115, 0, 1.5, 0.5, 0.5,
2, -4.190681, -6.173115, 0, -0.5, 0.5, 0.5,
2, -4.190681, -6.173115, 1, -0.5, 0.5, 0.5,
2, -4.190681, -6.173115, 1, 1.5, 0.5, 0.5,
2, -4.190681, -6.173115, 0, 1.5, 0.5, 0.5
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
-4.336813, -2, -5.363944,
-4.336813, 2, -5.363944,
-4.336813, -2, -5.363944,
-4.533063, -2, -5.633667,
-4.336813, 0, -5.363944,
-4.533063, 0, -5.633667,
-4.336813, 2, -5.363944,
-4.533063, 2, -5.633667
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
-4.925563, -2, -6.173115, 0, -0.5, 0.5, 0.5,
-4.925563, -2, -6.173115, 1, -0.5, 0.5, 0.5,
-4.925563, -2, -6.173115, 1, 1.5, 0.5, 0.5,
-4.925563, -2, -6.173115, 0, 1.5, 0.5, 0.5,
-4.925563, 0, -6.173115, 0, -0.5, 0.5, 0.5,
-4.925563, 0, -6.173115, 1, -0.5, 0.5, 0.5,
-4.925563, 0, -6.173115, 1, 1.5, 0.5, 0.5,
-4.925563, 0, -6.173115, 0, 1.5, 0.5, 0.5,
-4.925563, 2, -6.173115, 0, -0.5, 0.5, 0.5,
-4.925563, 2, -6.173115, 1, -0.5, 0.5, 0.5,
-4.925563, 2, -6.173115, 1, 1.5, 0.5, 0.5,
-4.925563, 2, -6.173115, 0, 1.5, 0.5, 0.5
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
-4.336813, -3.645513, -4,
-4.336813, -3.645513, 4,
-4.336813, -3.645513, -4,
-4.533063, -3.827236, -4,
-4.336813, -3.645513, -2,
-4.533063, -3.827236, -2,
-4.336813, -3.645513, 0,
-4.533063, -3.827236, 0,
-4.336813, -3.645513, 2,
-4.533063, -3.827236, 2,
-4.336813, -3.645513, 4,
-4.533063, -3.827236, 4
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
-4.925563, -4.190681, -4, 0, -0.5, 0.5, 0.5,
-4.925563, -4.190681, -4, 1, -0.5, 0.5, 0.5,
-4.925563, -4.190681, -4, 1, 1.5, 0.5, 0.5,
-4.925563, -4.190681, -4, 0, 1.5, 0.5, 0.5,
-4.925563, -4.190681, -2, 0, -0.5, 0.5, 0.5,
-4.925563, -4.190681, -2, 1, -0.5, 0.5, 0.5,
-4.925563, -4.190681, -2, 1, 1.5, 0.5, 0.5,
-4.925563, -4.190681, -2, 0, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 0, 0, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 0, 1, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 0, 1, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 0, 0, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 2, 0, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 2, 1, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 2, 1, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 2, 0, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 4, 0, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 4, 1, -0.5, 0.5, 0.5,
-4.925563, -4.190681, 4, 1, 1.5, 0.5, 0.5,
-4.925563, -4.190681, 4, 0, 1.5, 0.5, 0.5
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
-4.336813, -3.645513, -5.363944,
-4.336813, 3.623403, -5.363944,
-4.336813, -3.645513, 5.425008,
-4.336813, 3.623403, 5.425008,
-4.336813, -3.645513, -5.363944,
-4.336813, -3.645513, 5.425008,
-4.336813, 3.623403, -5.363944,
-4.336813, 3.623403, 5.425008,
-4.336813, -3.645513, -5.363944,
3.513187, -3.645513, -5.363944,
-4.336813, -3.645513, 5.425008,
3.513187, -3.645513, 5.425008,
-4.336813, 3.623403, -5.363944,
3.513187, 3.623403, -5.363944,
-4.336813, 3.623403, 5.425008,
3.513187, 3.623403, 5.425008,
3.513187, -3.645513, -5.363944,
3.513187, 3.623403, -5.363944,
3.513187, -3.645513, 5.425008,
3.513187, 3.623403, 5.425008,
3.513187, -3.645513, -5.363944,
3.513187, -3.645513, 5.425008,
3.513187, 3.623403, -5.363944,
3.513187, 3.623403, 5.425008
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
var radius = 8.113362;
var distance = 36.09727;
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
mvMatrix.translate( 0.4118128, 0.01105523, -0.03053212 );
mvMatrix.scale( 1.117494, 1.206827, 0.8130842 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.09727);
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
butocarboxim<-read.table("butocarboxim.xyz")
```

```
## Error in read.table("butocarboxim.xyz"): no lines available in input
```

```r
x<-butocarboxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
```

```r
y<-butocarboxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
```

```r
z<-butocarboxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
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
-4.222493, -0.8923629, -1.385535, 0, 0, 1, 1, 1,
-3.611282, -2.47884, -2.26006, 1, 0, 0, 1, 1,
-2.83188, 0.9378606, -0.9581836, 1, 0, 0, 1, 1,
-2.772546, 0.7588177, -0.6521427, 1, 0, 0, 1, 1,
-2.662465, -1.29302, -2.354074, 1, 0, 0, 1, 1,
-2.601219, -1.396431, -1.257333, 1, 0, 0, 1, 1,
-2.541211, 0.761487, -1.798233, 0, 0, 0, 1, 1,
-2.377363, -0.3683416, -2.99847, 0, 0, 0, 1, 1,
-2.328751, -0.4015702, -1.534726, 0, 0, 0, 1, 1,
-2.287332, 0.8171781, 0.8449152, 0, 0, 0, 1, 1,
-2.277241, -0.512433, -0.4090761, 0, 0, 0, 1, 1,
-2.198341, 0.6586133, -1.900531, 0, 0, 0, 1, 1,
-2.168129, 1.879763, -0.03636195, 0, 0, 0, 1, 1,
-2.149513, 2.181046, -1.793841, 1, 1, 1, 1, 1,
-2.148451, -0.3615687, -2.910978, 1, 1, 1, 1, 1,
-2.139388, 0.3935634, -0.8817794, 1, 1, 1, 1, 1,
-2.130501, -1.102132, -3.14666, 1, 1, 1, 1, 1,
-2.059098, 1.146764, 0.06061252, 1, 1, 1, 1, 1,
-2.041037, 0.2691736, 0.7127832, 1, 1, 1, 1, 1,
-2.025001, -0.1938912, -0.8155706, 1, 1, 1, 1, 1,
-2.023276, 0.49118, -1.683513, 1, 1, 1, 1, 1,
-2.010333, 0.8441706, -0.4723464, 1, 1, 1, 1, 1,
-2.009768, 1.199975, -0.8416979, 1, 1, 1, 1, 1,
-1.981138, -0.5709701, 0.7917407, 1, 1, 1, 1, 1,
-1.979044, 1.173388, -0.9972842, 1, 1, 1, 1, 1,
-1.956714, 0.1841799, -0.5596908, 1, 1, 1, 1, 1,
-1.936699, -0.3364969, -1.198368, 1, 1, 1, 1, 1,
-1.925803, 0.3833096, -1.00815, 1, 1, 1, 1, 1,
-1.917378, 0.2359709, -1.177591, 0, 0, 1, 1, 1,
-1.914998, 0.4778562, -1.91929, 1, 0, 0, 1, 1,
-1.91324, 0.1549442, -2.047444, 1, 0, 0, 1, 1,
-1.887979, 0.005856299, -1.191375, 1, 0, 0, 1, 1,
-1.880585, -1.303925, -1.086278, 1, 0, 0, 1, 1,
-1.858683, -1.101364, -0.2692588, 1, 0, 0, 1, 1,
-1.854997, -1.201128, -3.007914, 0, 0, 0, 1, 1,
-1.85047, -0.8794315, -1.826954, 0, 0, 0, 1, 1,
-1.849753, -1.59975, -1.186413, 0, 0, 0, 1, 1,
-1.842931, 0.009410981, -2.482324, 0, 0, 0, 1, 1,
-1.841178, 0.734373, -2.439327, 0, 0, 0, 1, 1,
-1.798472, 0.5735953, -1.184753, 0, 0, 0, 1, 1,
-1.766626, -0.7050871, -2.572618, 0, 0, 0, 1, 1,
-1.759011, -1.018676, -1.02926, 1, 1, 1, 1, 1,
-1.747211, -0.732576, -2.427897, 1, 1, 1, 1, 1,
-1.74336, -0.5320379, -2.047194, 1, 1, 1, 1, 1,
-1.739623, 2.554568, -0.7338418, 1, 1, 1, 1, 1,
-1.73771, -1.809838, -2.278318, 1, 1, 1, 1, 1,
-1.730519, 0.9488903, -2.01351, 1, 1, 1, 1, 1,
-1.706182, -0.107251, -2.06753, 1, 1, 1, 1, 1,
-1.705448, -1.057314, -0.6649609, 1, 1, 1, 1, 1,
-1.699399, -0.837813, -1.318419, 1, 1, 1, 1, 1,
-1.695884, -2.377715, -3.510644, 1, 1, 1, 1, 1,
-1.685588, -0.7847065, -1.887309, 1, 1, 1, 1, 1,
-1.683628, 0.01815224, -1.587931, 1, 1, 1, 1, 1,
-1.638031, 0.4912254, -0.4251101, 1, 1, 1, 1, 1,
-1.630498, -0.7352052, -4.381356, 1, 1, 1, 1, 1,
-1.628629, 1.197136, -0.2168512, 1, 1, 1, 1, 1,
-1.628367, -0.3760128, -3.021302, 0, 0, 1, 1, 1,
-1.62653, 1.405415, -0.8568031, 1, 0, 0, 1, 1,
-1.611615, -1.521047, -3.563354, 1, 0, 0, 1, 1,
-1.590219, -0.4912606, -2.924494, 1, 0, 0, 1, 1,
-1.585473, 1.464655, -0.5207974, 1, 0, 0, 1, 1,
-1.581895, -0.5627499, -2.750725, 1, 0, 0, 1, 1,
-1.572635, -0.9133841, -2.049775, 0, 0, 0, 1, 1,
-1.565329, 0.7682564, -1.473323, 0, 0, 0, 1, 1,
-1.543614, -0.8783924, -3.036058, 0, 0, 0, 1, 1,
-1.523182, -0.3931897, -2.332163, 0, 0, 0, 1, 1,
-1.509411, 0.2527406, -0.5674637, 0, 0, 0, 1, 1,
-1.503908, -0.1786714, -0.4301121, 0, 0, 0, 1, 1,
-1.494309, 0.79429, -1.155953, 0, 0, 0, 1, 1,
-1.493032, 0.5891072, 0.7737774, 1, 1, 1, 1, 1,
-1.486465, 0.5340872, -1.508819, 1, 1, 1, 1, 1,
-1.485612, -0.3988416, -2.565532, 1, 1, 1, 1, 1,
-1.479654, -0.972988, 0.3431189, 1, 1, 1, 1, 1,
-1.477832, 0.4754481, -0.9455367, 1, 1, 1, 1, 1,
-1.474056, -0.1636474, -1.828277, 1, 1, 1, 1, 1,
-1.451645, 0.4475673, -0.730058, 1, 1, 1, 1, 1,
-1.447904, 0.215993, 0.6969851, 1, 1, 1, 1, 1,
-1.438165, 0.07849041, -2.33648, 1, 1, 1, 1, 1,
-1.437406, -0.7041051, -1.710856, 1, 1, 1, 1, 1,
-1.419597, -1.095578, -1.603582, 1, 1, 1, 1, 1,
-1.413833, -1.433589, -2.104352, 1, 1, 1, 1, 1,
-1.409937, 0.6080253, -1.627655, 1, 1, 1, 1, 1,
-1.409467, -0.8053275, -2.7874, 1, 1, 1, 1, 1,
-1.406986, 0.5243385, -0.9359319, 1, 1, 1, 1, 1,
-1.403845, -0.3877273, 0.385189, 0, 0, 1, 1, 1,
-1.392008, -2.253235, -1.236784, 1, 0, 0, 1, 1,
-1.385384, -0.2658574, -2.991319, 1, 0, 0, 1, 1,
-1.381248, 0.2303778, -1.513075, 1, 0, 0, 1, 1,
-1.373349, -0.3597423, -3.067681, 1, 0, 0, 1, 1,
-1.368937, 0.4682667, -1.699103, 1, 0, 0, 1, 1,
-1.363979, 0.04856458, -1.64392, 0, 0, 0, 1, 1,
-1.357118, -1.380158, -1.649378, 0, 0, 0, 1, 1,
-1.354306, 1.075228, -0.9322554, 0, 0, 0, 1, 1,
-1.348411, 0.4488411, -0.6214591, 0, 0, 0, 1, 1,
-1.346703, 1.060605, -0.1068728, 0, 0, 0, 1, 1,
-1.344732, -1.947272, -1.423321, 0, 0, 0, 1, 1,
-1.344427, -0.3693003, -2.356386, 0, 0, 0, 1, 1,
-1.34331, 0.6356077, -0.3878653, 1, 1, 1, 1, 1,
-1.329369, 0.6603932, -0.6151395, 1, 1, 1, 1, 1,
-1.320702, 1.375719, -1.795142, 1, 1, 1, 1, 1,
-1.319663, -0.3932697, -2.21477, 1, 1, 1, 1, 1,
-1.3127, -0.485982, -3.801039, 1, 1, 1, 1, 1,
-1.310281, -0.5774197, -3.057409, 1, 1, 1, 1, 1,
-1.308127, -0.05879004, -1.879598, 1, 1, 1, 1, 1,
-1.292663, -1.152823, -1.694133, 1, 1, 1, 1, 1,
-1.292414, 0.5532529, -1.353185, 1, 1, 1, 1, 1,
-1.292329, 0.812619, -1.837192, 1, 1, 1, 1, 1,
-1.287406, -0.462227, -0.8236289, 1, 1, 1, 1, 1,
-1.285065, -0.7347985, -2.491602, 1, 1, 1, 1, 1,
-1.283188, -0.2368489, -3.012098, 1, 1, 1, 1, 1,
-1.281185, -2.517055, -2.903005, 1, 1, 1, 1, 1,
-1.279853, 0.6078643, 0.6717235, 1, 1, 1, 1, 1,
-1.275667, 1.121669, -0.1305561, 0, 0, 1, 1, 1,
-1.261234, -0.6656154, -2.677774, 1, 0, 0, 1, 1,
-1.24445, -0.2177389, -2.239039, 1, 0, 0, 1, 1,
-1.241956, 0.3089193, -3.253127, 1, 0, 0, 1, 1,
-1.227229, 0.6316711, -3.131359, 1, 0, 0, 1, 1,
-1.223312, -0.2205831, -1.326065, 1, 0, 0, 1, 1,
-1.211814, 1.116977, -2.004342, 0, 0, 0, 1, 1,
-1.208551, -0.5188981, -2.406645, 0, 0, 0, 1, 1,
-1.206532, 0.702888, 0.6298394, 0, 0, 0, 1, 1,
-1.201045, -0.7573082, -1.605942, 0, 0, 0, 1, 1,
-1.189822, -0.05431649, -1.053229, 0, 0, 0, 1, 1,
-1.188182, 0.1042785, -1.737216, 0, 0, 0, 1, 1,
-1.178818, -1.407388, -3.223525, 0, 0, 0, 1, 1,
-1.178452, -0.2086946, -2.587933, 1, 1, 1, 1, 1,
-1.151132, -0.6573649, -1.781116, 1, 1, 1, 1, 1,
-1.145285, 0.6624304, -1.486001, 1, 1, 1, 1, 1,
-1.144088, 1.254581, -1.029047, 1, 1, 1, 1, 1,
-1.139243, 0.2777928, -2.024716, 1, 1, 1, 1, 1,
-1.137213, 1.682069, 0.05520099, 1, 1, 1, 1, 1,
-1.13653, -0.9293118, -1.133765, 1, 1, 1, 1, 1,
-1.136273, 1.059613, 0.3357479, 1, 1, 1, 1, 1,
-1.127248, 0.4712268, -2.59691, 1, 1, 1, 1, 1,
-1.117351, 1.411728, 0.3256171, 1, 1, 1, 1, 1,
-1.106234, -1.469131, -2.935486, 1, 1, 1, 1, 1,
-1.105792, 0.07059012, -1.085758, 1, 1, 1, 1, 1,
-1.105246, -0.9962076, -0.4041077, 1, 1, 1, 1, 1,
-1.099319, -0.433374, -2.408493, 1, 1, 1, 1, 1,
-1.098773, -0.07907638, -0.8501872, 1, 1, 1, 1, 1,
-1.091834, 0.5600337, -1.615979, 0, 0, 1, 1, 1,
-1.088321, 0.4834791, 0.5728835, 1, 0, 0, 1, 1,
-1.08504, -1.134468, -1.544657, 1, 0, 0, 1, 1,
-1.084406, -0.4030699, -1.818239, 1, 0, 0, 1, 1,
-1.083838, 1.988266, 0.4709553, 1, 0, 0, 1, 1,
-1.077371, -0.02636076, 0.06177489, 1, 0, 0, 1, 1,
-1.071366, 0.2304244, -2.197376, 0, 0, 0, 1, 1,
-1.062192, 0.6065832, -0.1296032, 0, 0, 0, 1, 1,
-1.05919, 1.112279, -0.1180908, 0, 0, 0, 1, 1,
-1.058012, 0.5061743, -0.7702124, 0, 0, 0, 1, 1,
-1.057104, -0.3979183, -0.3126958, 0, 0, 0, 1, 1,
-1.055383, -1.796352, -3.251357, 0, 0, 0, 1, 1,
-1.051041, 0.3912162, -1.658863, 0, 0, 0, 1, 1,
-1.05104, -0.6733118, -0.3200693, 1, 1, 1, 1, 1,
-1.048801, -0.1985099, -1.854407, 1, 1, 1, 1, 1,
-1.043654, 1.283156, 0.2816577, 1, 1, 1, 1, 1,
-1.041508, 0.3172418, -1.385643, 1, 1, 1, 1, 1,
-1.038719, -0.7392873, -2.881053, 1, 1, 1, 1, 1,
-1.037517, 1.149689, -1.681889, 1, 1, 1, 1, 1,
-1.036295, 2.699355, -0.4254853, 1, 1, 1, 1, 1,
-1.033857, 1.151725, -0.22297, 1, 1, 1, 1, 1,
-1.027439, 0.8353034, -1.122407, 1, 1, 1, 1, 1,
-1.027266, -0.1439128, -3.171527, 1, 1, 1, 1, 1,
-1.02248, 0.0812726, -0.6016935, 1, 1, 1, 1, 1,
-1.021609, 0.8429906, -0.4946092, 1, 1, 1, 1, 1,
-1.021462, -0.9460338, -3.278598, 1, 1, 1, 1, 1,
-1.02037, 1.519614, -2.003986, 1, 1, 1, 1, 1,
-1.019015, 0.09954612, -1.464622, 1, 1, 1, 1, 1,
-1.005426, 1.488804, -0.5386162, 0, 0, 1, 1, 1,
-0.9921702, -0.3021249, -3.319953, 1, 0, 0, 1, 1,
-0.9908825, -0.2574189, -1.751835, 1, 0, 0, 1, 1,
-0.9903089, -1.992701, -4.236674, 1, 0, 0, 1, 1,
-0.9873332, 0.4274702, -1.295188, 1, 0, 0, 1, 1,
-0.9805644, 0.1060455, -3.238544, 1, 0, 0, 1, 1,
-0.9794607, -0.6895723, -2.912277, 0, 0, 0, 1, 1,
-0.9717798, -0.4731932, -3.123444, 0, 0, 0, 1, 1,
-0.9689023, 0.4070199, -0.1803479, 0, 0, 0, 1, 1,
-0.9632147, -1.189866, -1.869241, 0, 0, 0, 1, 1,
-0.9624059, 0.8458067, -0.1858399, 0, 0, 0, 1, 1,
-0.954117, 0.1797851, -1.690471, 0, 0, 0, 1, 1,
-0.9534504, 0.2404539, -1.933573, 0, 0, 0, 1, 1,
-0.9496415, 0.2152042, -1.171525, 1, 1, 1, 1, 1,
-0.9463491, -0.9076113, -2.713882, 1, 1, 1, 1, 1,
-0.9432454, 0.2893263, -0.8364826, 1, 1, 1, 1, 1,
-0.9416199, 0.1022955, -1.442768, 1, 1, 1, 1, 1,
-0.9395742, 0.1747875, -3.341227, 1, 1, 1, 1, 1,
-0.9394979, 0.4414173, -2.190339, 1, 1, 1, 1, 1,
-0.9389434, -0.8025078, -1.312851, 1, 1, 1, 1, 1,
-0.9388624, 2.027577, -0.6639033, 1, 1, 1, 1, 1,
-0.934935, -0.3062667, -0.7646422, 1, 1, 1, 1, 1,
-0.9317902, -1.144402, -2.793659, 1, 1, 1, 1, 1,
-0.9315066, -0.2155844, -2.573281, 1, 1, 1, 1, 1,
-0.93049, 1.111224, -0.90909, 1, 1, 1, 1, 1,
-0.9257067, 0.9796616, 0.5312224, 1, 1, 1, 1, 1,
-0.9237646, 0.4374813, -0.7391672, 1, 1, 1, 1, 1,
-0.9213339, -0.3474311, -3.183244, 1, 1, 1, 1, 1,
-0.9028637, 1.847138, 0.7461, 0, 0, 1, 1, 1,
-0.9012605, -1.18496, -2.26621, 1, 0, 0, 1, 1,
-0.8993476, 0.1877817, -2.425553, 1, 0, 0, 1, 1,
-0.8964694, 1.200222, -0.08502574, 1, 0, 0, 1, 1,
-0.8931391, 1.684433, 0.7517834, 1, 0, 0, 1, 1,
-0.8924703, -0.2367408, -1.092729, 1, 0, 0, 1, 1,
-0.892179, 1.591517, -1.185217, 0, 0, 0, 1, 1,
-0.8865206, 1.022463, -1.110682, 0, 0, 0, 1, 1,
-0.8844368, -0.4397615, -2.114659, 0, 0, 0, 1, 1,
-0.8828495, -0.3617017, -1.674673, 0, 0, 0, 1, 1,
-0.8801606, -0.3844566, -1.855673, 0, 0, 0, 1, 1,
-0.8790551, -1.069764, -1.657627, 0, 0, 0, 1, 1,
-0.8765069, -0.6562446, -1.278758, 0, 0, 0, 1, 1,
-0.8721014, 1.152882, 1.309262, 1, 1, 1, 1, 1,
-0.8717413, -1.208995, -3.721409, 1, 1, 1, 1, 1,
-0.8691592, 0.03420136, -0.922123, 1, 1, 1, 1, 1,
-0.8652926, 0.2533638, -2.30823, 1, 1, 1, 1, 1,
-0.865036, -0.8023027, -3.143645, 1, 1, 1, 1, 1,
-0.8643912, 0.3026965, -1.216043, 1, 1, 1, 1, 1,
-0.8642502, 0.2665276, 0.2726454, 1, 1, 1, 1, 1,
-0.8593892, -1.075818, -1.370346, 1, 1, 1, 1, 1,
-0.8566293, 0.6635982, -1.927219, 1, 1, 1, 1, 1,
-0.8565165, -0.8382417, -1.747084, 1, 1, 1, 1, 1,
-0.8529416, 0.9944437, 0.03682652, 1, 1, 1, 1, 1,
-0.8493294, 0.94021, -3.067087, 1, 1, 1, 1, 1,
-0.8438295, 0.6522982, -2.19338, 1, 1, 1, 1, 1,
-0.8423764, -1.430064, -1.109377, 1, 1, 1, 1, 1,
-0.8375378, -0.2323322, -1.136302, 1, 1, 1, 1, 1,
-0.8366589, -0.6967468, -2.467598, 0, 0, 1, 1, 1,
-0.8306087, 1.125304, -0.9447655, 1, 0, 0, 1, 1,
-0.8265053, 1.192314, 0.2845281, 1, 0, 0, 1, 1,
-0.8262305, -2.03407, -1.81468, 1, 0, 0, 1, 1,
-0.8257393, 0.111037, -2.289728, 1, 0, 0, 1, 1,
-0.8237427, 0.2340116, 0.8693389, 1, 0, 0, 1, 1,
-0.8200762, 0.4897349, -1.885137, 0, 0, 0, 1, 1,
-0.8162009, 0.7524427, -0.02797716, 0, 0, 0, 1, 1,
-0.8136213, 0.2128992, 0.1014303, 0, 0, 0, 1, 1,
-0.8130269, 1.822865, -0.2122796, 0, 0, 0, 1, 1,
-0.807384, -1.283594, -4.223795, 0, 0, 0, 1, 1,
-0.8066542, 0.7618027, -1.825282, 0, 0, 0, 1, 1,
-0.7940326, 0.1654019, -1.32729, 0, 0, 0, 1, 1,
-0.7880939, -0.7551799, -1.621657, 1, 1, 1, 1, 1,
-0.7828228, -0.8773733, -2.68031, 1, 1, 1, 1, 1,
-0.7651357, -0.3580292, -1.2199, 1, 1, 1, 1, 1,
-0.7622932, 0.8207858, -0.5988137, 1, 1, 1, 1, 1,
-0.76011, 0.2706124, -1.362733, 1, 1, 1, 1, 1,
-0.7590415, 0.03633125, -1.239794, 1, 1, 1, 1, 1,
-0.7554286, -0.2950353, -0.5290287, 1, 1, 1, 1, 1,
-0.7542872, 0.8645401, -0.1521111, 1, 1, 1, 1, 1,
-0.7470739, -1.019436, -2.818679, 1, 1, 1, 1, 1,
-0.7442825, 1.049383, -1.819902, 1, 1, 1, 1, 1,
-0.7306096, -0.209378, -2.617, 1, 1, 1, 1, 1,
-0.7251565, -0.448607, -1.43601, 1, 1, 1, 1, 1,
-0.7226261, 0.4987935, -2.740305, 1, 1, 1, 1, 1,
-0.718235, -0.5289118, -1.579686, 1, 1, 1, 1, 1,
-0.7160456, -0.05690405, -0.8202378, 1, 1, 1, 1, 1,
-0.7098635, 2.022588, 0.3333075, 0, 0, 1, 1, 1,
-0.7090442, -0.5523272, -0.6538507, 1, 0, 0, 1, 1,
-0.7011032, 0.6889418, -1.635008, 1, 0, 0, 1, 1,
-0.6967815, 1.03287, -0.4685887, 1, 0, 0, 1, 1,
-0.6948224, 0.994557, -2.467917, 1, 0, 0, 1, 1,
-0.6938233, -0.1672778, -2.343886, 1, 0, 0, 1, 1,
-0.6903326, 0.9878317, -1.576237, 0, 0, 0, 1, 1,
-0.6892521, 0.2213952, -0.3985286, 0, 0, 0, 1, 1,
-0.6883094, -0.7758031, -1.973503, 0, 0, 0, 1, 1,
-0.6854478, 0.8425484, -1.262887, 0, 0, 0, 1, 1,
-0.6851728, 0.1602845, -0.07883369, 0, 0, 0, 1, 1,
-0.6725081, 1.47512, 1.162756, 0, 0, 0, 1, 1,
-0.6685392, -0.0375026, -0.9197945, 0, 0, 0, 1, 1,
-0.6672347, 1.395048, -0.4591825, 1, 1, 1, 1, 1,
-0.6607968, -0.883797, -2.804232, 1, 1, 1, 1, 1,
-0.6601697, -0.7635897, -1.565447, 1, 1, 1, 1, 1,
-0.6473467, -0.4373135, -3.191109, 1, 1, 1, 1, 1,
-0.6466072, 0.9825659, -0.8768697, 1, 1, 1, 1, 1,
-0.638105, -0.4563927, -1.957021, 1, 1, 1, 1, 1,
-0.636575, 1.461188, -1.532865, 1, 1, 1, 1, 1,
-0.63131, 0.4949309, -1.351426, 1, 1, 1, 1, 1,
-0.6294476, 1.330337, -2.168548, 1, 1, 1, 1, 1,
-0.6276749, 0.3605491, -0.8882859, 1, 1, 1, 1, 1,
-0.6250531, 0.5521622, 0.4511026, 1, 1, 1, 1, 1,
-0.6140269, 0.1864187, 0.8979616, 1, 1, 1, 1, 1,
-0.6105223, 0.2047357, -1.502274, 1, 1, 1, 1, 1,
-0.6091152, 1.211567, 0.3105203, 1, 1, 1, 1, 1,
-0.6072883, -0.7495916, -2.093295, 1, 1, 1, 1, 1,
-0.6068298, 0.6943651, -0.892742, 0, 0, 1, 1, 1,
-0.6050591, -0.2275722, -2.06229, 1, 0, 0, 1, 1,
-0.6045322, 0.5353515, -2.426468, 1, 0, 0, 1, 1,
-0.6019844, 0.1051902, -2.977598, 1, 0, 0, 1, 1,
-0.5982316, 0.01574453, -2.117691, 1, 0, 0, 1, 1,
-0.5963254, -0.5705745, -2.622874, 1, 0, 0, 1, 1,
-0.5932911, -1.203762, -2.93186, 0, 0, 0, 1, 1,
-0.5924392, -0.2467191, -0.2497683, 0, 0, 0, 1, 1,
-0.5880131, 1.103207, -0.7570898, 0, 0, 0, 1, 1,
-0.5869668, 0.8539105, 0.396237, 0, 0, 0, 1, 1,
-0.5858122, -1.755003, -3.715251, 0, 0, 0, 1, 1,
-0.5849123, 1.436502, 2.188734, 0, 0, 0, 1, 1,
-0.5808874, -0.2108619, -3.427283, 0, 0, 0, 1, 1,
-0.5785808, 1.05383, 0.4012565, 1, 1, 1, 1, 1,
-0.5737645, -1.713044, -4.028374, 1, 1, 1, 1, 1,
-0.5733103, -0.4295918, -1.092356, 1, 1, 1, 1, 1,
-0.570582, 0.3139991, -0.1128234, 1, 1, 1, 1, 1,
-0.5628111, -0.6424521, -2.64947, 1, 1, 1, 1, 1,
-0.5566177, 0.8934561, -1.392597, 1, 1, 1, 1, 1,
-0.5559236, -0.7685674, -2.949554, 1, 1, 1, 1, 1,
-0.5559085, -0.1995569, -2.103112, 1, 1, 1, 1, 1,
-0.5454261, -0.08637334, -2.015905, 1, 1, 1, 1, 1,
-0.5453072, 0.6521149, -0.08756088, 1, 1, 1, 1, 1,
-0.5381773, -0.7789743, -1.174987, 1, 1, 1, 1, 1,
-0.5310105, -0.5421267, -2.859679, 1, 1, 1, 1, 1,
-0.5235668, 1.230287, -1.094328, 1, 1, 1, 1, 1,
-0.5226242, 1.102581, -0.9133018, 1, 1, 1, 1, 1,
-0.5181247, -0.3960779, -2.669014, 1, 1, 1, 1, 1,
-0.5173614, -2.308521, -4.483909, 0, 0, 1, 1, 1,
-0.512134, -0.7363716, -3.746183, 1, 0, 0, 1, 1,
-0.5117258, -2.71256, -3.44068, 1, 0, 0, 1, 1,
-0.5091985, 0.8473799, -0.0219818, 1, 0, 0, 1, 1,
-0.5050742, 0.4213344, -1.317016, 1, 0, 0, 1, 1,
-0.5028467, -1.278277, -2.482385, 1, 0, 0, 1, 1,
-0.489909, -0.09824275, -1.092503, 0, 0, 0, 1, 1,
-0.482387, -1.763116, -2.6643, 0, 0, 0, 1, 1,
-0.4810289, 0.3151082, -0.9067525, 0, 0, 0, 1, 1,
-0.4807041, 0.978685, 0.1392455, 0, 0, 0, 1, 1,
-0.4746169, 1.134381, -1.818353, 0, 0, 0, 1, 1,
-0.4728083, -0.8761329, -2.911571, 0, 0, 0, 1, 1,
-0.4723204, -0.1841673, -2.097481, 0, 0, 0, 1, 1,
-0.4708471, -0.5164067, -4.463665, 1, 1, 1, 1, 1,
-0.4661147, -1.017521, -1.50336, 1, 1, 1, 1, 1,
-0.4650046, -0.6357, -3.642385, 1, 1, 1, 1, 1,
-0.4648648, -0.1736085, -2.76069, 1, 1, 1, 1, 1,
-0.4601313, -1.245293, -2.465013, 1, 1, 1, 1, 1,
-0.4574656, 0.5597132, -0.45652, 1, 1, 1, 1, 1,
-0.4529754, 1.057327, -1.566174, 1, 1, 1, 1, 1,
-0.4506764, 0.2749539, -2.950342, 1, 1, 1, 1, 1,
-0.4484823, 0.5322345, 0.5147588, 1, 1, 1, 1, 1,
-0.443598, 0.6963394, -0.2379109, 1, 1, 1, 1, 1,
-0.4421416, 0.4836073, -1.754784, 1, 1, 1, 1, 1,
-0.4370711, -1.129975, -3.807937, 1, 1, 1, 1, 1,
-0.4345247, -0.593674, -2.812485, 1, 1, 1, 1, 1,
-0.4262805, 0.2135935, -0.9665264, 1, 1, 1, 1, 1,
-0.4242029, 0.7237056, -0.9582787, 1, 1, 1, 1, 1,
-0.4233357, -1.519134, -3.538472, 0, 0, 1, 1, 1,
-0.4216473, 1.423774, -0.01631438, 1, 0, 0, 1, 1,
-0.4191289, -0.6379023, -4.088881, 1, 0, 0, 1, 1,
-0.4150971, -1.987508, -3.681311, 1, 0, 0, 1, 1,
-0.4143502, 1.962091, 0.6974247, 1, 0, 0, 1, 1,
-0.4083208, 1.03469, 0.4448493, 1, 0, 0, 1, 1,
-0.4034531, 0.2135208, -2.005801, 0, 0, 0, 1, 1,
-0.3984702, -0.9616886, -1.184387, 0, 0, 0, 1, 1,
-0.3968683, -0.6654664, -3.618941, 0, 0, 0, 1, 1,
-0.3965282, -1.352942, -3.63809, 0, 0, 0, 1, 1,
-0.3962356, 0.7746473, 0.1323534, 0, 0, 0, 1, 1,
-0.3904636, -2.426148, -3.001193, 0, 0, 0, 1, 1,
-0.3842109, 1.018065, 0.9292104, 0, 0, 0, 1, 1,
-0.3835366, 0.4265689, -1.674765, 1, 1, 1, 1, 1,
-0.3828344, 0.4903746, 0.4155804, 1, 1, 1, 1, 1,
-0.3814494, -0.1829171, 0.08144066, 1, 1, 1, 1, 1,
-0.3799847, -0.8229717, -2.368329, 1, 1, 1, 1, 1,
-0.3771877, 0.9307758, -1.68517, 1, 1, 1, 1, 1,
-0.3770202, 0.5680131, -0.2551971, 1, 1, 1, 1, 1,
-0.3753868, -1.225181, -3.873879, 1, 1, 1, 1, 1,
-0.3741165, -0.1274058, 0.3697006, 1, 1, 1, 1, 1,
-0.3733045, 0.9888518, -1.321861, 1, 1, 1, 1, 1,
-0.3732975, -0.2139522, -2.754695, 1, 1, 1, 1, 1,
-0.3676687, 0.3174421, -0.6463052, 1, 1, 1, 1, 1,
-0.3602207, -0.6671249, -1.890263, 1, 1, 1, 1, 1,
-0.3551247, -0.1412784, -0.5970048, 1, 1, 1, 1, 1,
-0.3489574, -1.257778, -2.72798, 1, 1, 1, 1, 1,
-0.3475363, 0.5174862, -1.764327, 1, 1, 1, 1, 1,
-0.345488, -0.7903728, -3.488961, 0, 0, 1, 1, 1,
-0.3451538, 0.001943564, -3.027447, 1, 0, 0, 1, 1,
-0.3448464, 0.446674, -0.6950568, 1, 0, 0, 1, 1,
-0.3443451, -1.248768, -2.135803, 1, 0, 0, 1, 1,
-0.3429557, 0.809391, -0.4934391, 1, 0, 0, 1, 1,
-0.3394332, 0.5349415, -1.478439, 1, 0, 0, 1, 1,
-0.3385641, 0.6058875, -1.890682, 0, 0, 0, 1, 1,
-0.33483, 0.8484422, -0.1451899, 0, 0, 0, 1, 1,
-0.3302459, -0.1046, -1.904989, 0, 0, 0, 1, 1,
-0.3298074, -0.04791488, -2.185494, 0, 0, 0, 1, 1,
-0.3289468, -1.313644, -3.271853, 0, 0, 0, 1, 1,
-0.3284305, 0.6630113, -1.625071, 0, 0, 0, 1, 1,
-0.3266964, 0.02288081, -1.515688, 0, 0, 0, 1, 1,
-0.326226, -0.02938688, -1.699317, 1, 1, 1, 1, 1,
-0.3262122, 0.4135086, 0.2321974, 1, 1, 1, 1, 1,
-0.3259573, 0.7034972, -0.4515134, 1, 1, 1, 1, 1,
-0.3252652, -0.7082789, -4.687941, 1, 1, 1, 1, 1,
-0.3250522, 1.605543, -1.06257, 1, 1, 1, 1, 1,
-0.3237806, -1.062549, -1.950929, 1, 1, 1, 1, 1,
-0.3194375, -1.129202, -2.553144, 1, 1, 1, 1, 1,
-0.3168009, 1.592234, -0.6303917, 1, 1, 1, 1, 1,
-0.3163867, 0.08588932, -2.604079, 1, 1, 1, 1, 1,
-0.3163505, -1.924886, -2.035056, 1, 1, 1, 1, 1,
-0.3114347, 0.82799, 0.1811276, 1, 1, 1, 1, 1,
-0.3112539, -0.9466418, -2.622105, 1, 1, 1, 1, 1,
-0.3108078, 0.094859, -1.571619, 1, 1, 1, 1, 1,
-0.3104517, -1.612303, -2.236441, 1, 1, 1, 1, 1,
-0.308128, 0.1521628, 1.352264, 1, 1, 1, 1, 1,
-0.3072414, -0.5073056, -5.206823, 0, 0, 1, 1, 1,
-0.3016235, 0.4042972, -1.307286, 1, 0, 0, 1, 1,
-0.2978124, -0.2356988, -2.848537, 1, 0, 0, 1, 1,
-0.2959238, 0.2302272, -1.494843, 1, 0, 0, 1, 1,
-0.2942954, 1.389053, 0.6739957, 1, 0, 0, 1, 1,
-0.2861755, -0.8849887, -2.274069, 1, 0, 0, 1, 1,
-0.2828301, -1.720131, -3.65276, 0, 0, 0, 1, 1,
-0.2780034, -0.8913643, -1.942072, 0, 0, 0, 1, 1,
-0.275627, -0.618457, -1.137506, 0, 0, 0, 1, 1,
-0.2690862, -0.2325534, -3.21778, 0, 0, 0, 1, 1,
-0.2618954, -1.994579, -3.09932, 0, 0, 0, 1, 1,
-0.2600633, -1.143528, -4.407615, 0, 0, 0, 1, 1,
-0.2545778, 0.2838669, 1.13491, 0, 0, 0, 1, 1,
-0.2533829, -1.18822, -0.3190176, 1, 1, 1, 1, 1,
-0.253246, -0.5532286, -3.319192, 1, 1, 1, 1, 1,
-0.2522882, 1.135387, -0.2010308, 1, 1, 1, 1, 1,
-0.2497461, 0.8452079, 0.9912848, 1, 1, 1, 1, 1,
-0.248437, 1.17802, 1.348793, 1, 1, 1, 1, 1,
-0.2458507, -0.5567926, -2.44058, 1, 1, 1, 1, 1,
-0.2443285, -0.1804658, -3.506203, 1, 1, 1, 1, 1,
-0.2423904, 0.08734334, -1.160033, 1, 1, 1, 1, 1,
-0.239964, -1.858973, -3.282124, 1, 1, 1, 1, 1,
-0.2382768, -0.5160112, -1.811616, 1, 1, 1, 1, 1,
-0.2374934, -2.914809, -3.762357, 1, 1, 1, 1, 1,
-0.2363106, -0.6450945, -2.655462, 1, 1, 1, 1, 1,
-0.2326069, -0.5149526, -2.053406, 1, 1, 1, 1, 1,
-0.2277692, 0.1450391, -0.4565299, 1, 1, 1, 1, 1,
-0.2210807, -0.4655949, -2.73737, 1, 1, 1, 1, 1,
-0.2208245, -1.894123, -3.349209, 0, 0, 1, 1, 1,
-0.2186527, 0.2420793, -1.534903, 1, 0, 0, 1, 1,
-0.2180977, -0.1757952, -2.267951, 1, 0, 0, 1, 1,
-0.2180613, -1.55388, -3.149343, 1, 0, 0, 1, 1,
-0.2176565, 0.7436357, -1.066943, 1, 0, 0, 1, 1,
-0.216037, 0.9877918, 1.464785, 1, 0, 0, 1, 1,
-0.2084443, -1.304515, -2.767619, 0, 0, 0, 1, 1,
-0.2032946, 1.117365, -1.081507, 0, 0, 0, 1, 1,
-0.2028533, -0.7708255, -2.24345, 0, 0, 0, 1, 1,
-0.2000949, 0.1956763, -2.940628, 0, 0, 0, 1, 1,
-0.1999952, -0.9507965, -2.957998, 0, 0, 0, 1, 1,
-0.198712, -0.2868663, -1.802829, 0, 0, 0, 1, 1,
-0.1955022, -0.7699881, -2.691323, 0, 0, 0, 1, 1,
-0.1900529, -0.03078188, -3.021494, 1, 1, 1, 1, 1,
-0.1891974, 1.08416, -0.7562198, 1, 1, 1, 1, 1,
-0.1869093, -0.2214004, -1.510707, 1, 1, 1, 1, 1,
-0.1847422, -1.013957, -2.782064, 1, 1, 1, 1, 1,
-0.1845822, -0.7119009, -1.936712, 1, 1, 1, 1, 1,
-0.1778042, -0.1668337, -0.127924, 1, 1, 1, 1, 1,
-0.1747838, 0.2828574, -2.068361, 1, 1, 1, 1, 1,
-0.170095, -1.916653, -2.635024, 1, 1, 1, 1, 1,
-0.1688656, 1.46853, 1.476354, 1, 1, 1, 1, 1,
-0.1684266, 0.2670324, -0.2662681, 1, 1, 1, 1, 1,
-0.1652228, -0.8880388, -3.459187, 1, 1, 1, 1, 1,
-0.1642749, -0.5367075, -2.3677, 1, 1, 1, 1, 1,
-0.1622728, -0.3256043, -2.435395, 1, 1, 1, 1, 1,
-0.1605759, -0.9897811, -2.599671, 1, 1, 1, 1, 1,
-0.1604873, -0.03011061, -2.065291, 1, 1, 1, 1, 1,
-0.1583463, -1.398654, -3.321901, 0, 0, 1, 1, 1,
-0.1515477, 0.1877883, -1.601405, 1, 0, 0, 1, 1,
-0.1470494, 0.7494513, -0.108663, 1, 0, 0, 1, 1,
-0.141516, 0.4782069, 0.4318255, 1, 0, 0, 1, 1,
-0.141345, 0.2481879, -2.199961, 1, 0, 0, 1, 1,
-0.1361579, -0.1947313, -1.925689, 1, 0, 0, 1, 1,
-0.1337681, 1.568697, 0.8055611, 0, 0, 0, 1, 1,
-0.1296568, 1.093696, -0.2806546, 0, 0, 0, 1, 1,
-0.120003, 1.293617, 0.4324004, 0, 0, 0, 1, 1,
-0.1196504, 0.6881561, -0.2228722, 0, 0, 0, 1, 1,
-0.1183733, -3.539655, -2.670779, 0, 0, 0, 1, 1,
-0.1167096, 0.3527001, -1.46461, 0, 0, 0, 1, 1,
-0.1158224, -1.50405, -2.216476, 0, 0, 0, 1, 1,
-0.1122738, 0.1906563, -0.7468989, 1, 1, 1, 1, 1,
-0.1070701, -0.1263352, -2.08777, 1, 1, 1, 1, 1,
-0.1062023, -0.0783993, -2.569475, 1, 1, 1, 1, 1,
-0.1055966, -1.812549, -3.79563, 1, 1, 1, 1, 1,
-0.1043077, 0.1767826, 0.6684511, 1, 1, 1, 1, 1,
-0.1007073, 0.6394622, 0.392942, 1, 1, 1, 1, 1,
-0.09671832, 1.407514, 1.571328, 1, 1, 1, 1, 1,
-0.09669075, -2.342753, -3.267303, 1, 1, 1, 1, 1,
-0.09480719, -1.08232, -2.978655, 1, 1, 1, 1, 1,
-0.09328488, 0.9146413, 0.7518204, 1, 1, 1, 1, 1,
-0.08645456, -0.2189199, -4.088055, 1, 1, 1, 1, 1,
-0.08524033, -0.03038691, -2.415453, 1, 1, 1, 1, 1,
-0.08472551, -0.2883818, -3.775866, 1, 1, 1, 1, 1,
-0.07745185, -1.762049, -3.772296, 1, 1, 1, 1, 1,
-0.07712083, 0.3933397, -1.075784, 1, 1, 1, 1, 1,
-0.07688361, 1.224504, 1.595548, 0, 0, 1, 1, 1,
-0.06499024, -0.6075927, -3.959156, 1, 0, 0, 1, 1,
-0.06291064, 2.129704, 0.06934699, 1, 0, 0, 1, 1,
-0.06065675, 1.067758, 1.862993, 1, 0, 0, 1, 1,
-0.06007952, -1.451726, -2.624417, 1, 0, 0, 1, 1,
-0.058039, 0.2802415, 1.261325, 1, 0, 0, 1, 1,
-0.05718158, 1.013695, -0.5241962, 0, 0, 0, 1, 1,
-0.05098413, 1.308872, 0.4809437, 0, 0, 0, 1, 1,
-0.049049, -0.2672319, -4.053347, 0, 0, 0, 1, 1,
-0.04760114, -2.56709, -1.981439, 0, 0, 0, 1, 1,
-0.04752418, 0.1109294, -1.528543, 0, 0, 0, 1, 1,
-0.04504103, 0.3863677, 0.1642205, 0, 0, 0, 1, 1,
-0.04304155, -1.406373, -4.493426, 0, 0, 0, 1, 1,
-0.03758445, 1.356827, 0.7663422, 1, 1, 1, 1, 1,
-0.03644522, -0.01126704, -2.320872, 1, 1, 1, 1, 1,
-0.03599296, 0.2965547, -0.4520942, 1, 1, 1, 1, 1,
-0.03240607, 0.007390568, -0.8719616, 1, 1, 1, 1, 1,
-0.02983485, -0.1235121, -4.839068, 1, 1, 1, 1, 1,
-0.02952789, -0.612955, -2.299187, 1, 1, 1, 1, 1,
-0.02656424, -1.168079, -4.059345, 1, 1, 1, 1, 1,
-0.02646291, -0.1137309, -1.505563, 1, 1, 1, 1, 1,
-0.0228149, 1.933184, 0.8874138, 1, 1, 1, 1, 1,
-0.01807461, 0.209974, 0.5332267, 1, 1, 1, 1, 1,
-0.009547163, -1.160772, -3.304472, 1, 1, 1, 1, 1,
-0.009021639, -0.5256285, -2.952255, 1, 1, 1, 1, 1,
-0.007058515, 0.1006316, -0.4879716, 1, 1, 1, 1, 1,
0.0004627921, -1.360324, 2.437964, 1, 1, 1, 1, 1,
0.0009546501, -1.228467, 1.466074, 1, 1, 1, 1, 1,
0.004147718, -0.2241827, 2.776347, 0, 0, 1, 1, 1,
0.00544834, 1.13707, -2.033743, 1, 0, 0, 1, 1,
0.008049117, 0.8648166, -1.215879, 1, 0, 0, 1, 1,
0.009683098, -1.50383, 1.858351, 1, 0, 0, 1, 1,
0.0134561, 0.7060781, 1.305537, 1, 0, 0, 1, 1,
0.0135266, -0.2595688, 3.094863, 1, 0, 0, 1, 1,
0.01359717, 0.569415, -2.169051, 0, 0, 0, 1, 1,
0.01529882, 0.3165296, -1.382106, 0, 0, 0, 1, 1,
0.01585149, 0.308593, 0.2819068, 0, 0, 0, 1, 1,
0.01783158, -0.3645861, 2.181686, 0, 0, 0, 1, 1,
0.02454341, -0.5448269, 4.149509, 0, 0, 0, 1, 1,
0.0312001, 0.6619252, -1.114496, 0, 0, 0, 1, 1,
0.03287085, -0.2215727, 2.942782, 0, 0, 0, 1, 1,
0.03990493, 0.5986384, 1.872836, 1, 1, 1, 1, 1,
0.04087776, -0.3754388, 3.221927, 1, 1, 1, 1, 1,
0.04140546, 0.02112148, 2.743758, 1, 1, 1, 1, 1,
0.04308352, 0.3980437, 1.53651, 1, 1, 1, 1, 1,
0.04340602, -0.6021128, 1.807082, 1, 1, 1, 1, 1,
0.04454212, -0.3727944, 3.176529, 1, 1, 1, 1, 1,
0.04663807, 0.844584, -0.8754073, 1, 1, 1, 1, 1,
0.04713301, -0.2073897, 1.71172, 1, 1, 1, 1, 1,
0.05678929, -0.1199608, 4.413877, 1, 1, 1, 1, 1,
0.06087941, -0.5408126, 3.517022, 1, 1, 1, 1, 1,
0.06892318, 0.7323358, 0.94317, 1, 1, 1, 1, 1,
0.07018206, -0.7650863, 3.862348, 1, 1, 1, 1, 1,
0.07131961, -1.050094, 3.428735, 1, 1, 1, 1, 1,
0.07213756, 0.4869882, 0.02428257, 1, 1, 1, 1, 1,
0.07315636, -0.08254429, 3.818769, 1, 1, 1, 1, 1,
0.07407798, -1.165534, 3.37584, 0, 0, 1, 1, 1,
0.07926906, 1.110277, 0.2686248, 1, 0, 0, 1, 1,
0.08461281, 2.838679, -1.655304, 1, 0, 0, 1, 1,
0.08719125, 0.2873218, 0.3881555, 1, 0, 0, 1, 1,
0.0879541, 0.57865, 0.9754578, 1, 0, 0, 1, 1,
0.08842257, -0.01445868, 2.455662, 1, 0, 0, 1, 1,
0.08842401, -0.08471853, 1.88796, 0, 0, 0, 1, 1,
0.08852883, 1.135499, 1.184859, 0, 0, 0, 1, 1,
0.08983357, -1.042532, 3.87556, 0, 0, 0, 1, 1,
0.09129399, 1.457296, 0.3048897, 0, 0, 0, 1, 1,
0.09152077, -1.31589, 3.249102, 0, 0, 0, 1, 1,
0.09338042, 0.350622, 1.365523, 0, 0, 0, 1, 1,
0.09373531, 0.3589996, -0.293397, 0, 0, 0, 1, 1,
0.09562417, -0.2030679, 3.525824, 1, 1, 1, 1, 1,
0.0960291, 0.7372411, 0.6810737, 1, 1, 1, 1, 1,
0.09782796, -0.2756167, 4.962914, 1, 1, 1, 1, 1,
0.1025501, -0.4094076, 4.168721, 1, 1, 1, 1, 1,
0.1039822, -1.357315, 3.19886, 1, 1, 1, 1, 1,
0.1043675, -1.710367, 1.833529, 1, 1, 1, 1, 1,
0.1053679, -2.689787, 2.785179, 1, 1, 1, 1, 1,
0.10545, -1.361115, 4.425207, 1, 1, 1, 1, 1,
0.1060286, -1.842461, 2.656493, 1, 1, 1, 1, 1,
0.1070894, 0.8376449, 0.4799495, 1, 1, 1, 1, 1,
0.1101009, -0.2908514, 3.897088, 1, 1, 1, 1, 1,
0.1102719, -0.5562891, 2.591114, 1, 1, 1, 1, 1,
0.1118888, 0.7811956, -1.887589, 1, 1, 1, 1, 1,
0.1158801, 1.348085, 1.393389, 1, 1, 1, 1, 1,
0.1160391, 0.4916145, -0.6108568, 1, 1, 1, 1, 1,
0.1221816, -0.721013, 4.520763, 0, 0, 1, 1, 1,
0.1222794, -2.016552, 2.466131, 1, 0, 0, 1, 1,
0.1224082, 0.6472437, -0.4684764, 1, 0, 0, 1, 1,
0.1231578, 0.3347125, -1.52706, 1, 0, 0, 1, 1,
0.1248558, 1.012625, -0.9356166, 1, 0, 0, 1, 1,
0.1292978, -2.38884, 3.578642, 1, 0, 0, 1, 1,
0.1298969, -0.8749003, 3.162067, 0, 0, 0, 1, 1,
0.1338393, 1.142228, 1.452901, 0, 0, 0, 1, 1,
0.1364307, 0.6518688, 1.3291, 0, 0, 0, 1, 1,
0.1381909, -1.850656, 3.295321, 0, 0, 0, 1, 1,
0.1462591, -0.4176976, 3.251019, 0, 0, 0, 1, 1,
0.1464232, 1.390657, 0.4343455, 0, 0, 0, 1, 1,
0.1484844, -0.4752089, 2.344078, 0, 0, 0, 1, 1,
0.1504727, -0.2922716, 1.405146, 1, 1, 1, 1, 1,
0.1506493, -0.112249, 2.599411, 1, 1, 1, 1, 1,
0.1590429, -0.8581758, 2.358582, 1, 1, 1, 1, 1,
0.1626994, -1.078261, 5.267887, 1, 1, 1, 1, 1,
0.1661521, -0.4904433, 3.44183, 1, 1, 1, 1, 1,
0.1667334, -1.408231, 1.656123, 1, 1, 1, 1, 1,
0.1726453, -1.769082, 2.638391, 1, 1, 1, 1, 1,
0.1758189, 0.8268343, 0.8171991, 1, 1, 1, 1, 1,
0.1758967, 0.263377, 0.7989662, 1, 1, 1, 1, 1,
0.17613, 0.4127598, 0.3119496, 1, 1, 1, 1, 1,
0.177921, -0.4198427, 3.286803, 1, 1, 1, 1, 1,
0.1793521, 0.5046289, -0.8551808, 1, 1, 1, 1, 1,
0.1845926, 0.8539846, 0.5463521, 1, 1, 1, 1, 1,
0.189532, 1.195216, -0.01890309, 1, 1, 1, 1, 1,
0.1933124, -2.111886, 3.295851, 1, 1, 1, 1, 1,
0.1959538, 0.7292774, 1.909632, 0, 0, 1, 1, 1,
0.2040876, 1.3411, -0.6089227, 1, 0, 0, 1, 1,
0.2079931, -0.9622062, 1.849355, 1, 0, 0, 1, 1,
0.2102973, -0.1726673, 0.4975692, 1, 0, 0, 1, 1,
0.2135501, 0.8834293, 0.5638045, 1, 0, 0, 1, 1,
0.2143437, 0.7623008, 0.1421579, 1, 0, 0, 1, 1,
0.2178338, 0.02443282, 1.568196, 0, 0, 0, 1, 1,
0.2231833, -0.1230108, 3.148626, 0, 0, 0, 1, 1,
0.2255173, 1.814154, -0.5925067, 0, 0, 0, 1, 1,
0.2280845, 0.5719051, 0.5705879, 0, 0, 0, 1, 1,
0.2326659, 0.08544, 2.588514, 0, 0, 0, 1, 1,
0.2365376, 0.1192693, 0.6696812, 0, 0, 0, 1, 1,
0.239352, -1.626858, 3.227196, 0, 0, 0, 1, 1,
0.2409179, 0.8803176, 0.5939255, 1, 1, 1, 1, 1,
0.2431993, 0.7667332, -0.9983675, 1, 1, 1, 1, 1,
0.2443423, 0.5216807, -0.6630092, 1, 1, 1, 1, 1,
0.2464554, -0.5617501, 3.361248, 1, 1, 1, 1, 1,
0.2487069, -0.6173081, 3.808839, 1, 1, 1, 1, 1,
0.2496389, -1.45358, 1.852563, 1, 1, 1, 1, 1,
0.2536931, -2.316579, 4.485132, 1, 1, 1, 1, 1,
0.2540404, -0.883609, 4.748497, 1, 1, 1, 1, 1,
0.2602068, 0.7872477, 0.05244159, 1, 1, 1, 1, 1,
0.2657259, 0.005503848, 1.829972, 1, 1, 1, 1, 1,
0.2699916, -1.763659, 2.441219, 1, 1, 1, 1, 1,
0.2713478, -0.8179052, 2.994945, 1, 1, 1, 1, 1,
0.2722895, 0.207237, 2.147264, 1, 1, 1, 1, 1,
0.2745118, 0.8394077, -0.3052595, 1, 1, 1, 1, 1,
0.2788257, -1.097944, 3.507416, 1, 1, 1, 1, 1,
0.2789592, 1.182395, 0.1601168, 0, 0, 1, 1, 1,
0.2794553, -1.454241, 2.352167, 1, 0, 0, 1, 1,
0.2805938, -0.4819137, 3.421332, 1, 0, 0, 1, 1,
0.2821264, -0.2507717, 2.009273, 1, 0, 0, 1, 1,
0.2905378, -0.1494891, 3.512227, 1, 0, 0, 1, 1,
0.2933203, 0.6371664, 0.4045195, 1, 0, 0, 1, 1,
0.2959518, -1.460632, 2.511457, 0, 0, 0, 1, 1,
0.2989615, 0.3685827, 1.987349, 0, 0, 0, 1, 1,
0.2994144, 0.4300714, 1.254023, 0, 0, 0, 1, 1,
0.2999806, 0.8835831, -0.9435618, 0, 0, 0, 1, 1,
0.3009388, -0.9149488, 1.841568, 0, 0, 0, 1, 1,
0.3021913, -0.5296417, 2.027031, 0, 0, 0, 1, 1,
0.3096014, 0.9824718, -0.07624433, 0, 0, 0, 1, 1,
0.3099234, -1.34725, 1.246892, 1, 1, 1, 1, 1,
0.3129473, 0.2233711, 0.5658649, 1, 1, 1, 1, 1,
0.3136027, 1.736032, -0.5267161, 1, 1, 1, 1, 1,
0.3141806, -1.736895, 2.883765, 1, 1, 1, 1, 1,
0.3160446, -0.5968578, 3.623141, 1, 1, 1, 1, 1,
0.3161027, 1.205677, 0.2182148, 1, 1, 1, 1, 1,
0.3184011, 0.7042743, 0.8854599, 1, 1, 1, 1, 1,
0.3187068, -0.1242276, 1.758973, 1, 1, 1, 1, 1,
0.3243636, 0.1577103, 1.854283, 1, 1, 1, 1, 1,
0.3282664, -0.7502534, 2.019615, 1, 1, 1, 1, 1,
0.3306868, -0.4193174, 3.630083, 1, 1, 1, 1, 1,
0.3374571, -1.298435, 3.810908, 1, 1, 1, 1, 1,
0.3391205, -1.148481, 3.826801, 1, 1, 1, 1, 1,
0.3392331, 0.2775763, 0.612263, 1, 1, 1, 1, 1,
0.3440627, 0.3224731, -0.5693361, 1, 1, 1, 1, 1,
0.3471121, 1.260839, 0.8816, 0, 0, 1, 1, 1,
0.3475961, 0.8406927, -0.04674006, 1, 0, 0, 1, 1,
0.3505499, 0.9141604, -0.4396634, 1, 0, 0, 1, 1,
0.3579452, 0.3315814, -1.777426, 1, 0, 0, 1, 1,
0.3590751, 1.044623, -0.2161392, 1, 0, 0, 1, 1,
0.3611288, 1.109556, 0.1438165, 1, 0, 0, 1, 1,
0.3613074, -0.3839956, 3.263529, 0, 0, 0, 1, 1,
0.3649288, -1.218705, 2.653879, 0, 0, 0, 1, 1,
0.3699275, -0.7247602, 3.184133, 0, 0, 0, 1, 1,
0.3743467, 0.1971526, 1.906907, 0, 0, 0, 1, 1,
0.3748193, 2.125249, 0.09542543, 0, 0, 0, 1, 1,
0.3762386, 0.2130345, 2.376446, 0, 0, 0, 1, 1,
0.3767197, -0.5606067, 2.818601, 0, 0, 0, 1, 1,
0.3782183, 1.723032, 0.7549744, 1, 1, 1, 1, 1,
0.3785271, -0.9514616, 4.10112, 1, 1, 1, 1, 1,
0.3796188, 0.2058537, 0.7882029, 1, 1, 1, 1, 1,
0.3829182, 1.29919, 1.493106, 1, 1, 1, 1, 1,
0.3841727, 0.3755558, 1.943987, 1, 1, 1, 1, 1,
0.3891336, -1.351243, 0.8754237, 1, 1, 1, 1, 1,
0.3905413, 0.4997316, -0.6401178, 1, 1, 1, 1, 1,
0.3908483, -0.1070592, 1.615437, 1, 1, 1, 1, 1,
0.3921351, 0.5128363, 1.750901, 1, 1, 1, 1, 1,
0.39325, 0.5574829, 1.818892, 1, 1, 1, 1, 1,
0.393678, 0.008871607, 1.453314, 1, 1, 1, 1, 1,
0.3941469, 0.5816537, 1.310037, 1, 1, 1, 1, 1,
0.3996227, 0.3347161, 2.195009, 1, 1, 1, 1, 1,
0.4002739, 1.156578, -0.05868099, 1, 1, 1, 1, 1,
0.4012268, 0.5908469, 1.474183, 1, 1, 1, 1, 1,
0.4060835, 1.080266, 0.5714729, 0, 0, 1, 1, 1,
0.4090315, -0.447951, 3.472352, 1, 0, 0, 1, 1,
0.4172944, 0.434256, 0.9879073, 1, 0, 0, 1, 1,
0.4194489, -0.09473798, -0.1838107, 1, 0, 0, 1, 1,
0.4204514, 1.254131, 1.416206, 1, 0, 0, 1, 1,
0.4207442, -0.2581951, 1.685183, 1, 0, 0, 1, 1,
0.4230449, 0.6094117, 1.07929, 0, 0, 0, 1, 1,
0.4255184, 0.1727716, 0.03952997, 0, 0, 0, 1, 1,
0.4335348, -0.1414636, 2.997952, 0, 0, 0, 1, 1,
0.4368117, 0.3604681, 0.6841897, 0, 0, 0, 1, 1,
0.441213, 0.8053907, 0.5546659, 0, 0, 0, 1, 1,
0.4428417, 0.9375977, -1.405305, 0, 0, 0, 1, 1,
0.444423, -1.169403, 2.251223, 0, 0, 0, 1, 1,
0.4518628, -1.213442, 3.247981, 1, 1, 1, 1, 1,
0.4623085, -0.08576448, 4.019068, 1, 1, 1, 1, 1,
0.4690039, 0.6542751, 0.579019, 1, 1, 1, 1, 1,
0.4699819, -1.406065, 3.361301, 1, 1, 1, 1, 1,
0.4717723, -1.272729, 2.876644, 1, 1, 1, 1, 1,
0.4746934, -0.1075016, 3.640862, 1, 1, 1, 1, 1,
0.4748736, 1.081671, 0.7581419, 1, 1, 1, 1, 1,
0.4759928, 0.5805312, 2.467311, 1, 1, 1, 1, 1,
0.4762246, 2.816163, 1.650073, 1, 1, 1, 1, 1,
0.4789307, 1.257418, -0.5734984, 1, 1, 1, 1, 1,
0.4797565, -0.2824135, 2.946518, 1, 1, 1, 1, 1,
0.4908213, -0.263396, 2.718503, 1, 1, 1, 1, 1,
0.4937173, 0.07132887, 2.368459, 1, 1, 1, 1, 1,
0.4955549, 1.766122, -0.3192016, 1, 1, 1, 1, 1,
0.5008215, -1.861957, 2.105619, 1, 1, 1, 1, 1,
0.5040774, -0.3794861, 0.5960405, 0, 0, 1, 1, 1,
0.5068901, 0.4007415, -0.9546961, 1, 0, 0, 1, 1,
0.5074457, -1.386554, 2.561011, 1, 0, 0, 1, 1,
0.5085568, 0.9259045, -0.2700022, 1, 0, 0, 1, 1,
0.5126427, 0.8725288, 0.1076923, 1, 0, 0, 1, 1,
0.5194862, 0.0224972, 0.4113614, 1, 0, 0, 1, 1,
0.5200217, -0.7644311, 1.838566, 0, 0, 0, 1, 1,
0.5206103, 0.4832543, 2.414551, 0, 0, 0, 1, 1,
0.5232393, -0.7982415, 2.414813, 0, 0, 0, 1, 1,
0.5234069, 0.8861143, 0.0318919, 0, 0, 0, 1, 1,
0.5288678, 1.339691, 0.01985132, 0, 0, 0, 1, 1,
0.5304906, 0.9780418, 0.2964544, 0, 0, 0, 1, 1,
0.5344651, 0.3243718, 1.135792, 0, 0, 0, 1, 1,
0.5346738, 0.2410704, 3.233885, 1, 1, 1, 1, 1,
0.5346753, -1.056712, 3.051021, 1, 1, 1, 1, 1,
0.5409451, -1.63899, 2.38914, 1, 1, 1, 1, 1,
0.5415203, 1.613516, 0.9065092, 1, 1, 1, 1, 1,
0.542264, -0.5461768, 3.320393, 1, 1, 1, 1, 1,
0.5436239, 0.05765865, 1.188594, 1, 1, 1, 1, 1,
0.5451043, -0.6766777, 1.393178, 1, 1, 1, 1, 1,
0.5467653, 1.832893, -1.231045, 1, 1, 1, 1, 1,
0.5517246, -0.1124707, 0.168231, 1, 1, 1, 1, 1,
0.5524997, -0.6411245, 2.684805, 1, 1, 1, 1, 1,
0.5544929, -0.2447101, 1.086459, 1, 1, 1, 1, 1,
0.5687544, -0.7043183, 2.348132, 1, 1, 1, 1, 1,
0.5711898, -1.123599, 3.743772, 1, 1, 1, 1, 1,
0.571335, 0.7642849, 1.532078, 1, 1, 1, 1, 1,
0.5737587, 0.04557173, 2.130899, 1, 1, 1, 1, 1,
0.5742674, -0.02376891, 0.7654726, 0, 0, 1, 1, 1,
0.5769881, -0.4411331, 2.427374, 1, 0, 0, 1, 1,
0.5797489, 0.03340035, 1.422185, 1, 0, 0, 1, 1,
0.5922138, 0.2567984, 1.84481, 1, 0, 0, 1, 1,
0.5957443, 1.510363, 0.966279, 1, 0, 0, 1, 1,
0.5980019, -0.6887852, 2.705827, 1, 0, 0, 1, 1,
0.5999069, 0.8299741, 1.953462, 0, 0, 0, 1, 1,
0.6045027, -1.000396, 2.529688, 0, 0, 0, 1, 1,
0.6049807, -0.3641635, 1.926704, 0, 0, 0, 1, 1,
0.6066788, -1.38019, 3.381114, 0, 0, 0, 1, 1,
0.607137, 0.5416106, 1.56105, 0, 0, 0, 1, 1,
0.6086611, 0.4326013, 2.690226, 0, 0, 0, 1, 1,
0.6105554, 0.4303953, -0.8761103, 0, 0, 0, 1, 1,
0.6157075, 0.2912888, 2.063077, 1, 1, 1, 1, 1,
0.6164175, -1.525522, 3.144941, 1, 1, 1, 1, 1,
0.6208676, -0.709963, 2.505245, 1, 1, 1, 1, 1,
0.6222089, -0.6361349, 3.044098, 1, 1, 1, 1, 1,
0.6239222, -0.2722057, 2.317356, 1, 1, 1, 1, 1,
0.6304072, 0.01102164, 1.572951, 1, 1, 1, 1, 1,
0.6353628, -0.8121107, 1.698444, 1, 1, 1, 1, 1,
0.6384673, -0.04603755, 2.461607, 1, 1, 1, 1, 1,
0.6518798, 0.1368749, 1.240726, 1, 1, 1, 1, 1,
0.6609363, -0.5060333, 0.3732323, 1, 1, 1, 1, 1,
0.6612107, 0.3966024, 0.4569123, 1, 1, 1, 1, 1,
0.6620573, 0.3199622, 0.1290854, 1, 1, 1, 1, 1,
0.6666991, 0.6519375, -1.225942, 1, 1, 1, 1, 1,
0.6711945, -0.5141974, 1.448962, 1, 1, 1, 1, 1,
0.6737437, 0.08775553, 1.610147, 1, 1, 1, 1, 1,
0.6786408, 1.792655, 1.440836, 0, 0, 1, 1, 1,
0.6787131, 1.247035, -2.168868, 1, 0, 0, 1, 1,
0.6875387, 0.3465015, -0.1066281, 1, 0, 0, 1, 1,
0.7012537, 0.2900759, -0.06915737, 1, 0, 0, 1, 1,
0.7016098, -1.305764, 2.075886, 1, 0, 0, 1, 1,
0.7063546, -0.5305271, 3.569413, 1, 0, 0, 1, 1,
0.7067521, -0.418566, 2.751547, 0, 0, 0, 1, 1,
0.7155923, -1.307221, 3.130894, 0, 0, 0, 1, 1,
0.715636, 0.762087, 0.1069448, 0, 0, 0, 1, 1,
0.7158577, -1.780549, 2.577647, 0, 0, 0, 1, 1,
0.7234445, -0.1261687, 2.174223, 0, 0, 0, 1, 1,
0.7261834, -0.07896515, 0.9158518, 0, 0, 0, 1, 1,
0.7278302, -1.149212, 3.27977, 0, 0, 0, 1, 1,
0.7287574, -1.68323, 3.245922, 1, 1, 1, 1, 1,
0.7299308, -0.7774013, 1.437628, 1, 1, 1, 1, 1,
0.7345936, 0.1889185, 1.283313, 1, 1, 1, 1, 1,
0.7391348, -0.7204459, 1.786598, 1, 1, 1, 1, 1,
0.742579, -0.05622707, 2.802156, 1, 1, 1, 1, 1,
0.747614, -0.1181123, 2.589307, 1, 1, 1, 1, 1,
0.7513854, 0.09997812, 0.8501137, 1, 1, 1, 1, 1,
0.7522352, -0.5897221, 2.329092, 1, 1, 1, 1, 1,
0.7595129, -1.844049, 3.444214, 1, 1, 1, 1, 1,
0.7646942, -1.537798, 3.292644, 1, 1, 1, 1, 1,
0.7658843, 0.3468252, 1.297661, 1, 1, 1, 1, 1,
0.7679515, -0.05109366, 2.254155, 1, 1, 1, 1, 1,
0.7684518, 1.527142, 1.307704, 1, 1, 1, 1, 1,
0.7700596, 1.390296, -0.2672923, 1, 1, 1, 1, 1,
0.7706048, -0.6416825, 2.319342, 1, 1, 1, 1, 1,
0.7726486, 2.64147, -0.8824241, 0, 0, 1, 1, 1,
0.7729914, -0.6179384, 2.021227, 1, 0, 0, 1, 1,
0.7730452, -0.7541846, 1.407834, 1, 0, 0, 1, 1,
0.7733244, 0.7035165, 0.4450142, 1, 0, 0, 1, 1,
0.7745834, -1.535255, 3.931793, 1, 0, 0, 1, 1,
0.7838207, -1.430512, 3.076223, 1, 0, 0, 1, 1,
0.7848104, -0.6728303, 1.767427, 0, 0, 0, 1, 1,
0.7926125, -1.913642, 3.96025, 0, 0, 0, 1, 1,
0.7955507, -0.9194786, 2.426334, 0, 0, 0, 1, 1,
0.7972637, 0.4101747, 3.076678, 0, 0, 0, 1, 1,
0.7973911, 1.057554, 1.503213, 0, 0, 0, 1, 1,
0.8003551, 0.6125059, -0.1125331, 0, 0, 0, 1, 1,
0.8008144, 0.8926304, 0.6630628, 0, 0, 0, 1, 1,
0.802085, -0.5586964, 2.739567, 1, 1, 1, 1, 1,
0.8059126, 0.5408651, 1.845921, 1, 1, 1, 1, 1,
0.812283, 0.7063008, -0.3805542, 1, 1, 1, 1, 1,
0.8151138, -0.6820113, 2.546328, 1, 1, 1, 1, 1,
0.8185322, -0.0466648, 1.160899, 1, 1, 1, 1, 1,
0.8187123, 0.211067, 0.8436155, 1, 1, 1, 1, 1,
0.819689, -0.2091582, 0.5167347, 1, 1, 1, 1, 1,
0.8265021, 0.9748439, -0.09269397, 1, 1, 1, 1, 1,
0.828673, -0.3419485, 3.97005, 1, 1, 1, 1, 1,
0.8307067, -0.01101734, 0.2177062, 1, 1, 1, 1, 1,
0.8322931, 2.060617, -0.669202, 1, 1, 1, 1, 1,
0.835743, 0.4882721, 1.631158, 1, 1, 1, 1, 1,
0.8448466, -1.097607, 0.9860063, 1, 1, 1, 1, 1,
0.8502519, -0.8796237, 3.948266, 1, 1, 1, 1, 1,
0.8574274, -0.381979, 1.593521, 1, 1, 1, 1, 1,
0.861651, 1.169646, -0.08008887, 0, 0, 1, 1, 1,
0.871724, -0.569854, 2.971125, 1, 0, 0, 1, 1,
0.8739407, 0.1016052, 1.715392, 1, 0, 0, 1, 1,
0.874164, -1.137147, 1.875833, 1, 0, 0, 1, 1,
0.875676, 0.6380336, 1.260149, 1, 0, 0, 1, 1,
0.8776746, -0.5577288, 2.348773, 1, 0, 0, 1, 1,
0.8788553, -0.6743292, 2.266308, 0, 0, 0, 1, 1,
0.882412, -0.8536878, 2.855522, 0, 0, 0, 1, 1,
0.8903472, 0.07777561, -0.1962174, 0, 0, 0, 1, 1,
0.8939449, -0.681474, 1.418937, 0, 0, 0, 1, 1,
0.8996603, -0.3254138, 3.386068, 0, 0, 0, 1, 1,
0.9025705, -0.8756269, 2.603419, 0, 0, 0, 1, 1,
0.9059695, 0.01869955, 1.780402, 0, 0, 0, 1, 1,
0.9078104, 0.1957027, 1.278626, 1, 1, 1, 1, 1,
0.9079931, -0.2586724, 1.270461, 1, 1, 1, 1, 1,
0.9106591, -0.5217983, 2.004396, 1, 1, 1, 1, 1,
0.9143059, -0.3012513, 0.8674101, 1, 1, 1, 1, 1,
0.9230272, -0.2927833, 1.029175, 1, 1, 1, 1, 1,
0.9236706, -0.3987086, 1.536088, 1, 1, 1, 1, 1,
0.9248044, 0.5445012, 0.4524775, 1, 1, 1, 1, 1,
0.9286171, 0.8198023, 2.652783, 1, 1, 1, 1, 1,
0.93151, -1.084686, 2.68752, 1, 1, 1, 1, 1,
0.9326968, 1.079235, -0.4947523, 1, 1, 1, 1, 1,
0.9354381, 1.864657, -0.5865897, 1, 1, 1, 1, 1,
0.9493817, 0.1215492, -0.3382649, 1, 1, 1, 1, 1,
0.9509337, 0.3357007, 0.7412371, 1, 1, 1, 1, 1,
0.9544637, -0.6682894, 2.817832, 1, 1, 1, 1, 1,
0.9591496, -0.7292951, 2.056904, 1, 1, 1, 1, 1,
0.9635077, -1.279685, 2.497474, 0, 0, 1, 1, 1,
0.964593, 0.465445, 0.9117623, 1, 0, 0, 1, 1,
0.9708259, 1.422077, 1.971973, 1, 0, 0, 1, 1,
0.9804081, -1.015484, 2.893786, 1, 0, 0, 1, 1,
0.9808389, -0.0719148, 1.699711, 1, 0, 0, 1, 1,
0.9866886, -0.3443974, 2.228372, 1, 0, 0, 1, 1,
0.9949258, -1.826445, 0.5227298, 0, 0, 0, 1, 1,
0.999307, -0.2027697, 3.302386, 0, 0, 0, 1, 1,
1.00977, 0.2040068, 0.945237, 0, 0, 0, 1, 1,
1.017702, -0.1975162, 2.314583, 0, 0, 0, 1, 1,
1.019367, 1.081438, 3.258513, 0, 0, 0, 1, 1,
1.026313, -1.607105, 1.515959, 0, 0, 0, 1, 1,
1.032705, 0.5733382, 2.784323, 0, 0, 0, 1, 1,
1.033391, -0.4335172, 3.977506, 1, 1, 1, 1, 1,
1.046491, -1.233112, 3.576322, 1, 1, 1, 1, 1,
1.04709, 0.05814549, 1.367455, 1, 1, 1, 1, 1,
1.047389, 0.002209634, 2.423988, 1, 1, 1, 1, 1,
1.05303, 1.87691, 0.9948679, 1, 1, 1, 1, 1,
1.053633, -1.434565, 4.1865, 1, 1, 1, 1, 1,
1.053912, 0.2154569, 1.352275, 1, 1, 1, 1, 1,
1.05639, -0.4528844, 1.807124, 1, 1, 1, 1, 1,
1.059712, 0.5284047, 1.128592, 1, 1, 1, 1, 1,
1.072646, 0.4869824, 0.8877343, 1, 1, 1, 1, 1,
1.076593, -1.389302, 3.482398, 1, 1, 1, 1, 1,
1.078958, 0.4123864, 1.292858, 1, 1, 1, 1, 1,
1.078962, -1.045249, 2.580436, 1, 1, 1, 1, 1,
1.082907, -1.379816, 1.666168, 1, 1, 1, 1, 1,
1.102629, -0.7047266, 2.372004, 1, 1, 1, 1, 1,
1.104454, -1.472622, 2.603749, 0, 0, 1, 1, 1,
1.107748, 1.366199, 1.563631, 1, 0, 0, 1, 1,
1.11472, -1.023929, 4.00271, 1, 0, 0, 1, 1,
1.115215, 0.8817594, 1.949857, 1, 0, 0, 1, 1,
1.120096, 1.61283, -0.2149576, 1, 0, 0, 1, 1,
1.122012, -1.073905, 2.40739, 1, 0, 0, 1, 1,
1.122904, -0.3582006, 3.682262, 0, 0, 0, 1, 1,
1.132546, 0.5661053, -0.08307844, 0, 0, 0, 1, 1,
1.144435, 1.720279, 0.7695953, 0, 0, 0, 1, 1,
1.144724, -0.4903621, 1.444336, 0, 0, 0, 1, 1,
1.154866, 0.2579268, -0.8173947, 0, 0, 0, 1, 1,
1.155441, -0.7074524, 2.197033, 0, 0, 0, 1, 1,
1.155634, 0.3387294, -0.5540965, 0, 0, 0, 1, 1,
1.15644, 0.8386667, 0.3314078, 1, 1, 1, 1, 1,
1.156468, 1.915863, 1.593673, 1, 1, 1, 1, 1,
1.16116, -0.9558322, -0.8800893, 1, 1, 1, 1, 1,
1.161568, 3.517545, 2.637973, 1, 1, 1, 1, 1,
1.16691, -1.15288, 4.051119, 1, 1, 1, 1, 1,
1.167996, -0.6103169, 1.257805, 1, 1, 1, 1, 1,
1.176904, 1.579082, 0.5150605, 1, 1, 1, 1, 1,
1.180708, 2.348915, -0.6689189, 1, 1, 1, 1, 1,
1.196438, 0.3333453, 1.463742, 1, 1, 1, 1, 1,
1.203597, -1.184959, 2.397179, 1, 1, 1, 1, 1,
1.207189, -0.7223467, 0.8939641, 1, 1, 1, 1, 1,
1.214776, -1.004345, 2.151717, 1, 1, 1, 1, 1,
1.21578, 1.029055, -0.3694583, 1, 1, 1, 1, 1,
1.218511, -0.08475707, 3.368288, 1, 1, 1, 1, 1,
1.223385, -0.564483, 2.148469, 1, 1, 1, 1, 1,
1.232978, -2.098341, 0.437451, 0, 0, 1, 1, 1,
1.235287, -0.5296749, 2.254328, 1, 0, 0, 1, 1,
1.235355, 0.1054164, 1.482404, 1, 0, 0, 1, 1,
1.239322, -0.2668392, 1.599325, 1, 0, 0, 1, 1,
1.243682, 0.6991434, 1.862563, 1, 0, 0, 1, 1,
1.244175, -1.028838, 2.187918, 1, 0, 0, 1, 1,
1.257865, -1.60159, 1.609444, 0, 0, 0, 1, 1,
1.259667, -1.133552, 4.019327, 0, 0, 0, 1, 1,
1.263097, 0.9251981, 0.4327041, 0, 0, 0, 1, 1,
1.270113, 0.9295533, 1.117043, 0, 0, 0, 1, 1,
1.291269, -0.305779, 1.236781, 0, 0, 0, 1, 1,
1.293873, 0.5039799, -2.22887, 0, 0, 0, 1, 1,
1.293939, 1.378411, 1.032705, 0, 0, 0, 1, 1,
1.303347, -0.3324816, 2.572605, 1, 1, 1, 1, 1,
1.309082, -0.6492717, 1.765473, 1, 1, 1, 1, 1,
1.312459, 1.001099, 2.483661, 1, 1, 1, 1, 1,
1.317438, 0.4878023, 0.400987, 1, 1, 1, 1, 1,
1.325153, 0.9645838, 2.158321, 1, 1, 1, 1, 1,
1.325241, 0.3573882, -0.3007918, 1, 1, 1, 1, 1,
1.332169, 0.1221788, 1.98663, 1, 1, 1, 1, 1,
1.351678, 0.8350589, 1.031528, 1, 1, 1, 1, 1,
1.358047, -0.8422553, 3.717316, 1, 1, 1, 1, 1,
1.359491, -0.9568399, 2.739906, 1, 1, 1, 1, 1,
1.362427, -0.5711588, 0.8050098, 1, 1, 1, 1, 1,
1.367443, -0.680101, 1.276866, 1, 1, 1, 1, 1,
1.369932, 1.068297, 0.03198509, 1, 1, 1, 1, 1,
1.37307, -3.004018, 2.293501, 1, 1, 1, 1, 1,
1.375942, 0.3991835, 0.7304645, 1, 1, 1, 1, 1,
1.397376, -0.0514147, 2.174747, 0, 0, 1, 1, 1,
1.404546, 1.329253, 0.7646781, 1, 0, 0, 1, 1,
1.405818, -1.002633, 0.8418412, 1, 0, 0, 1, 1,
1.417576, -0.3339863, 2.498543, 1, 0, 0, 1, 1,
1.423462, -0.3067951, 1.826773, 1, 0, 0, 1, 1,
1.428412, -0.8765513, 3.288684, 1, 0, 0, 1, 1,
1.430431, 1.545369, -0.8116839, 0, 0, 0, 1, 1,
1.432325, 1.763776, 0.379103, 0, 0, 0, 1, 1,
1.433982, -2.523792, 2.180596, 0, 0, 0, 1, 1,
1.439472, -1.10444, 2.595024, 0, 0, 0, 1, 1,
1.445163, 0.6825415, 0.8836519, 0, 0, 0, 1, 1,
1.445939, 0.484189, 1.285249, 0, 0, 0, 1, 1,
1.472742, 0.422638, 1.069188, 0, 0, 0, 1, 1,
1.485209, -1.440177, 3.7427, 1, 1, 1, 1, 1,
1.495623, 0.3591112, 0.9333624, 1, 1, 1, 1, 1,
1.499727, 0.9076732, 1.492358, 1, 1, 1, 1, 1,
1.529818, -1.215675, 2.67618, 1, 1, 1, 1, 1,
1.530211, 0.2426548, 2.682636, 1, 1, 1, 1, 1,
1.557015, -0.09708636, 2.527224, 1, 1, 1, 1, 1,
1.580394, 0.618295, 0.03449981, 1, 1, 1, 1, 1,
1.590323, -0.7718471, 1.173349, 1, 1, 1, 1, 1,
1.608305, 1.141441, 0.5538861, 1, 1, 1, 1, 1,
1.613318, -0.3797924, 1.425349, 1, 1, 1, 1, 1,
1.613758, -1.368544, 3.182732, 1, 1, 1, 1, 1,
1.615115, 0.4301998, 1.984802, 1, 1, 1, 1, 1,
1.640509, 1.2485, -0.1547174, 1, 1, 1, 1, 1,
1.640921, 0.4541515, 0.1792228, 1, 1, 1, 1, 1,
1.667104, -0.01030699, 2.432163, 1, 1, 1, 1, 1,
1.678346, 0.409064, 2.858875, 0, 0, 1, 1, 1,
1.67955, -1.114122, 0.8467968, 1, 0, 0, 1, 1,
1.708885, -1.120824, 0.9480038, 1, 0, 0, 1, 1,
1.708896, 0.04525129, 3.160108, 1, 0, 0, 1, 1,
1.716073, -1.65489, 1.952134, 1, 0, 0, 1, 1,
1.716154, 0.4984556, 1.382914, 1, 0, 0, 1, 1,
1.743293, 0.03440153, 2.495397, 0, 0, 0, 1, 1,
1.751964, -0.5395743, 1.63339, 0, 0, 0, 1, 1,
1.758595, -1.342227, 3.927521, 0, 0, 0, 1, 1,
1.759323, -1.155445, 2.173828, 0, 0, 0, 1, 1,
1.764731, -0.6410388, 2.42201, 0, 0, 0, 1, 1,
1.783356, -0.4197904, 0.8771482, 0, 0, 0, 1, 1,
1.791558, 0.4863864, 1.471323, 0, 0, 0, 1, 1,
1.874455, 1.043937, 0.2106039, 1, 1, 1, 1, 1,
1.895328, -1.496591, 1.344568, 1, 1, 1, 1, 1,
1.916313, -0.3913364, 2.674837, 1, 1, 1, 1, 1,
1.926222, 0.06495305, 0.907734, 1, 1, 1, 1, 1,
1.960227, -1.528264, 2.460525, 1, 1, 1, 1, 1,
1.974693, -0.5461006, 3.291971, 1, 1, 1, 1, 1,
1.975577, 0.3268121, 3.364768, 1, 1, 1, 1, 1,
1.981131, -0.7543518, 0.5104417, 1, 1, 1, 1, 1,
1.98946, 0.67349, 1.133357, 1, 1, 1, 1, 1,
1.993605, -2.488334, 1.531612, 1, 1, 1, 1, 1,
2.01642, 0.06895383, 1.794781, 1, 1, 1, 1, 1,
2.03043, 0.1106202, 2.704468, 1, 1, 1, 1, 1,
2.039972, 1.268767, 0.4013703, 1, 1, 1, 1, 1,
2.040834, 0.353591, -0.516777, 1, 1, 1, 1, 1,
2.05328, -0.09479555, 1.470022, 1, 1, 1, 1, 1,
2.057367, 0.7482526, 1.441154, 0, 0, 1, 1, 1,
2.194142, 0.5188761, 0.9805664, 1, 0, 0, 1, 1,
2.225725, -0.2311668, 2.276664, 1, 0, 0, 1, 1,
2.233597, 1.065594, 0.0662296, 1, 0, 0, 1, 1,
2.235954, 2.38651, -0.5376285, 1, 0, 0, 1, 1,
2.23988, 0.1032892, -0.354341, 1, 0, 0, 1, 1,
2.244455, 0.5937188, 1.816953, 0, 0, 0, 1, 1,
2.246822, -0.2849911, 1.392511, 0, 0, 0, 1, 1,
2.312137, -0.1277018, 1.514312, 0, 0, 0, 1, 1,
2.318146, -1.200098, 2.031071, 0, 0, 0, 1, 1,
2.371918, 1.734519, 1.136722, 0, 0, 0, 1, 1,
2.403554, -0.6665862, 1.870558, 0, 0, 0, 1, 1,
2.415108, -1.474163, 0.5639988, 0, 0, 0, 1, 1,
2.423194, 2.449163, -0.2763689, 1, 1, 1, 1, 1,
2.459461, -1.159634, 1.787493, 1, 1, 1, 1, 1,
2.778301, -1.106589, 2.188652, 1, 1, 1, 1, 1,
2.885784, 0.4532266, 1.045078, 1, 1, 1, 1, 1,
2.940712, -1.17695, 1.773107, 1, 1, 1, 1, 1,
2.980861, -0.9385821, 2.70565, 1, 1, 1, 1, 1,
3.398867, 0.5425714, 2.059677, 1, 1, 1, 1, 1
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
var radius = 9.994604;
var distance = 35.10562;
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
mvMatrix.translate( 0.4118128, 0.01105499, -0.03053212 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.10562);
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
