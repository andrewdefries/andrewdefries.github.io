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
-3.306489, 0.3001539, -0.454083, 1, 0, 0, 1,
-3.212033, -0.42216, -0.6712143, 1, 0.007843138, 0, 1,
-2.889779, -0.1534794, -3.187527, 1, 0.01176471, 0, 1,
-2.515817, -1.010944, -3.28461, 1, 0.01960784, 0, 1,
-2.440217, -0.2171118, -1.972889, 1, 0.02352941, 0, 1,
-2.313788, -0.02977074, -1.137423, 1, 0.03137255, 0, 1,
-2.2776, 0.1945792, -1.427943, 1, 0.03529412, 0, 1,
-2.26846, 0.378588, -2.658255, 1, 0.04313726, 0, 1,
-2.252851, -0.236644, -1.729999, 1, 0.04705882, 0, 1,
-2.206285, -0.4302392, -2.919255, 1, 0.05490196, 0, 1,
-2.202636, 1.351635, -2.224104, 1, 0.05882353, 0, 1,
-2.196005, -0.9292315, -0.5212738, 1, 0.06666667, 0, 1,
-2.181917, 0.9814069, -1.222518, 1, 0.07058824, 0, 1,
-2.179507, 0.2223741, -2.657818, 1, 0.07843138, 0, 1,
-2.153021, -1.233249, -1.956641, 1, 0.08235294, 0, 1,
-2.124826, 0.4238194, -0.2621675, 1, 0.09019608, 0, 1,
-2.012455, -1.302689, -0.2513833, 1, 0.09411765, 0, 1,
-1.947729, -0.4523537, -1.761812, 1, 0.1019608, 0, 1,
-1.934929, -0.3792633, -0.4901658, 1, 0.1098039, 0, 1,
-1.92167, -0.602176, -2.457398, 1, 0.1137255, 0, 1,
-1.887964, 0.01023758, -1.709038, 1, 0.1215686, 0, 1,
-1.864097, -1.018531, -2.728065, 1, 0.1254902, 0, 1,
-1.837561, -0.6313701, -0.7603139, 1, 0.1333333, 0, 1,
-1.828942, 1.280642, -1.290802, 1, 0.1372549, 0, 1,
-1.818652, 0.1988213, 0.04116959, 1, 0.145098, 0, 1,
-1.815075, -0.1062375, -1.018001, 1, 0.1490196, 0, 1,
-1.772733, 0.4223159, -2.738374, 1, 0.1568628, 0, 1,
-1.763573, -1.55913, -2.193636, 1, 0.1607843, 0, 1,
-1.752968, 0.1864438, -2.893044, 1, 0.1686275, 0, 1,
-1.73936, -0.03107945, -2.433877, 1, 0.172549, 0, 1,
-1.732764, -0.02310338, -1.358286, 1, 0.1803922, 0, 1,
-1.72399, 1.083192, -0.5070725, 1, 0.1843137, 0, 1,
-1.717011, 0.447877, -1.015598, 1, 0.1921569, 0, 1,
-1.70594, 0.5140334, -0.6032238, 1, 0.1960784, 0, 1,
-1.697802, 1.128028, -2.26722, 1, 0.2039216, 0, 1,
-1.691262, 0.2326336, -0.3714351, 1, 0.2117647, 0, 1,
-1.687462, 0.220237, -0.6392223, 1, 0.2156863, 0, 1,
-1.683094, 0.2392382, -1.007103, 1, 0.2235294, 0, 1,
-1.681902, 0.1704514, -2.016165, 1, 0.227451, 0, 1,
-1.677191, -1.294639, -1.636444, 1, 0.2352941, 0, 1,
-1.668224, -0.03200276, -1.169308, 1, 0.2392157, 0, 1,
-1.64768, 0.8308132, -0.9655127, 1, 0.2470588, 0, 1,
-1.627541, -0.923613, -0.6163481, 1, 0.2509804, 0, 1,
-1.622283, 0.0275553, -2.731547, 1, 0.2588235, 0, 1,
-1.619658, -0.4829102, -2.368413, 1, 0.2627451, 0, 1,
-1.610444, 1.863481, -0.6325817, 1, 0.2705882, 0, 1,
-1.586885, 0.8571768, -1.268039, 1, 0.2745098, 0, 1,
-1.583488, -0.8498584, -1.393542, 1, 0.282353, 0, 1,
-1.56608, -0.9096417, -2.233351, 1, 0.2862745, 0, 1,
-1.562674, 1.272811, -2.528752, 1, 0.2941177, 0, 1,
-1.55871, 1.334342, -0.3514531, 1, 0.3019608, 0, 1,
-1.548749, -0.04919133, 0.540093, 1, 0.3058824, 0, 1,
-1.545863, -0.4074445, -0.3940414, 1, 0.3137255, 0, 1,
-1.520315, 0.8778073, -0.5764548, 1, 0.3176471, 0, 1,
-1.517487, 0.225741, -1.574936, 1, 0.3254902, 0, 1,
-1.495892, 2.236848, -0.2467627, 1, 0.3294118, 0, 1,
-1.465878, 1.278193, 1.642725, 1, 0.3372549, 0, 1,
-1.465832, 1.313114, -1.233562, 1, 0.3411765, 0, 1,
-1.456554, -0.8490799, -2.755314, 1, 0.3490196, 0, 1,
-1.454013, -0.8603455, -4.257836, 1, 0.3529412, 0, 1,
-1.447339, -0.2782598, -1.975382, 1, 0.3607843, 0, 1,
-1.443577, -0.2432199, -2.037134, 1, 0.3647059, 0, 1,
-1.437647, 0.1427422, -0.7851884, 1, 0.372549, 0, 1,
-1.433474, -0.5640782, -0.828024, 1, 0.3764706, 0, 1,
-1.423262, 0.04523138, -1.152588, 1, 0.3843137, 0, 1,
-1.422784, -0.4265411, -1.159077, 1, 0.3882353, 0, 1,
-1.420847, 0.7975107, -2.161443, 1, 0.3960784, 0, 1,
-1.404713, -1.170713, -4.38037, 1, 0.4039216, 0, 1,
-1.399168, 1.645638, -0.4442888, 1, 0.4078431, 0, 1,
-1.381585, 0.04436342, -1.193671, 1, 0.4156863, 0, 1,
-1.36827, 0.666154, -0.254681, 1, 0.4196078, 0, 1,
-1.367325, 0.6360524, -1.064374, 1, 0.427451, 0, 1,
-1.365207, 2.343885, -2.176763, 1, 0.4313726, 0, 1,
-1.357949, 2.257815, -0.4842921, 1, 0.4392157, 0, 1,
-1.354453, 0.466318, -0.9941969, 1, 0.4431373, 0, 1,
-1.351655, 0.2702059, -0.8772244, 1, 0.4509804, 0, 1,
-1.351495, 1.41297, -0.2680978, 1, 0.454902, 0, 1,
-1.351477, -0.3632849, -2.678398, 1, 0.4627451, 0, 1,
-1.342525, -1.227797, -2.155573, 1, 0.4666667, 0, 1,
-1.336878, 2.782335, -0.2886808, 1, 0.4745098, 0, 1,
-1.332134, -1.772287, -3.601064, 1, 0.4784314, 0, 1,
-1.330961, 0.7249572, -2.317638, 1, 0.4862745, 0, 1,
-1.329036, -0.698754, -3.751557, 1, 0.4901961, 0, 1,
-1.325824, 1.330388, -2.26386, 1, 0.4980392, 0, 1,
-1.299657, 0.904556, 0.02506477, 1, 0.5058824, 0, 1,
-1.29864, 0.1229391, -1.263335, 1, 0.509804, 0, 1,
-1.297539, -1.095051, -1.264889, 1, 0.5176471, 0, 1,
-1.29651, 0.8712545, 1.040632, 1, 0.5215687, 0, 1,
-1.272407, -0.475003, -3.367075, 1, 0.5294118, 0, 1,
-1.269938, -0.4189041, -3.20795, 1, 0.5333334, 0, 1,
-1.254051, -0.07655821, -1.437721, 1, 0.5411765, 0, 1,
-1.251311, 1.583328, -0.2570322, 1, 0.5450981, 0, 1,
-1.244488, 0.7907137, -1.314996, 1, 0.5529412, 0, 1,
-1.2434, 0.091609, 0.3887479, 1, 0.5568628, 0, 1,
-1.228463, -0.5019216, -3.163505, 1, 0.5647059, 0, 1,
-1.216617, -0.3021998, 0.2227395, 1, 0.5686275, 0, 1,
-1.211702, 2.342012, 1.25718, 1, 0.5764706, 0, 1,
-1.207744, -0.7451123, 0.1754565, 1, 0.5803922, 0, 1,
-1.200549, 2.651952, -0.04397966, 1, 0.5882353, 0, 1,
-1.200364, 1.533801, 0.9037839, 1, 0.5921569, 0, 1,
-1.19751, -1.194075, -2.055654, 1, 0.6, 0, 1,
-1.193359, -1.539636, -1.632099, 1, 0.6078432, 0, 1,
-1.192363, -0.5003708, -3.133237, 1, 0.6117647, 0, 1,
-1.191121, 1.225904, 0.9493674, 1, 0.6196079, 0, 1,
-1.182594, -1.02223, -2.413497, 1, 0.6235294, 0, 1,
-1.176043, 0.462824, -0.3911726, 1, 0.6313726, 0, 1,
-1.165382, 0.2174985, -1.905361, 1, 0.6352941, 0, 1,
-1.159059, -0.9366674, -1.05809, 1, 0.6431373, 0, 1,
-1.145225, 0.3547003, -2.403923, 1, 0.6470588, 0, 1,
-1.140799, -2.183398, -1.764061, 1, 0.654902, 0, 1,
-1.135046, -1.562159, -2.746749, 1, 0.6588235, 0, 1,
-1.132827, -0.2509109, -0.7798557, 1, 0.6666667, 0, 1,
-1.130406, 0.5645431, -0.8317554, 1, 0.6705883, 0, 1,
-1.129883, -1.477169, -2.716295, 1, 0.6784314, 0, 1,
-1.128085, -0.3033347, -1.647267, 1, 0.682353, 0, 1,
-1.127018, -0.6102176, -3.939101, 1, 0.6901961, 0, 1,
-1.119879, 0.2325612, -1.039914, 1, 0.6941177, 0, 1,
-1.11892, -0.0945698, -1.666264, 1, 0.7019608, 0, 1,
-1.109256, -0.1787617, -2.537372, 1, 0.7098039, 0, 1,
-1.079889, 0.1077926, -0.5746444, 1, 0.7137255, 0, 1,
-1.068946, -0.600347, -2.859102, 1, 0.7215686, 0, 1,
-1.068873, 1.321749, 0.2185229, 1, 0.7254902, 0, 1,
-1.068469, 1.90446, -1.390461, 1, 0.7333333, 0, 1,
-1.068189, 0.4642915, -1.668568, 1, 0.7372549, 0, 1,
-1.064399, 1.137709, -1.138174, 1, 0.7450981, 0, 1,
-1.062011, -1.221413, -1.956461, 1, 0.7490196, 0, 1,
-1.057008, 0.4231694, -2.058789, 1, 0.7568628, 0, 1,
-1.054994, -1.016489, -2.472125, 1, 0.7607843, 0, 1,
-1.054032, 0.593778, -1.0199, 1, 0.7686275, 0, 1,
-1.053091, -0.9718319, -2.672374, 1, 0.772549, 0, 1,
-1.048217, 2.40142, -0.336833, 1, 0.7803922, 0, 1,
-1.041094, -1.419741, -1.482069, 1, 0.7843137, 0, 1,
-1.037085, 1.166931, 1.069961, 1, 0.7921569, 0, 1,
-1.036933, 0.3883368, -1.868075, 1, 0.7960784, 0, 1,
-1.033505, -0.1563469, -2.473509, 1, 0.8039216, 0, 1,
-1.033333, 0.1861978, -0.9554246, 1, 0.8117647, 0, 1,
-1.032992, -0.2489128, -3.576277, 1, 0.8156863, 0, 1,
-1.028463, -0.9903682, -1.976706, 1, 0.8235294, 0, 1,
-1.027548, -0.2399273, -1.585859, 1, 0.827451, 0, 1,
-1.024028, -1.151941, -4.392241, 1, 0.8352941, 0, 1,
-1.015864, 0.9126812, 0.3351459, 1, 0.8392157, 0, 1,
-1.006438, 0.08140999, -2.995964, 1, 0.8470588, 0, 1,
-1.005407, 2.149738, -2.19159, 1, 0.8509804, 0, 1,
-1.005261, 0.3132087, -3.492362, 1, 0.8588235, 0, 1,
-1.004157, 0.1302909, -3.283338, 1, 0.8627451, 0, 1,
-1.002669, -0.2048095, -2.928503, 1, 0.8705882, 0, 1,
-0.9990615, -0.3888804, -2.800277, 1, 0.8745098, 0, 1,
-0.9960282, -0.4374687, -3.353966, 1, 0.8823529, 0, 1,
-0.9942688, 0.2681039, -1.305019, 1, 0.8862745, 0, 1,
-0.9939972, -1.289249, -1.894044, 1, 0.8941177, 0, 1,
-0.9931098, 1.153317, 1.432665, 1, 0.8980392, 0, 1,
-0.9802455, -1.613713, -3.821983, 1, 0.9058824, 0, 1,
-0.9792874, -0.2261776, -2.819949, 1, 0.9137255, 0, 1,
-0.9720961, 0.7254624, -1.316649, 1, 0.9176471, 0, 1,
-0.9694792, 0.8205606, 0.4027151, 1, 0.9254902, 0, 1,
-0.9653773, -0.7337797, -2.339182, 1, 0.9294118, 0, 1,
-0.9522058, -0.5972075, -0.1537497, 1, 0.9372549, 0, 1,
-0.9521249, -0.1919221, -1.506869, 1, 0.9411765, 0, 1,
-0.951193, -0.3478552, -1.142209, 1, 0.9490196, 0, 1,
-0.9473612, 0.258209, -2.077769, 1, 0.9529412, 0, 1,
-0.9421231, 0.3731997, -1.071522, 1, 0.9607843, 0, 1,
-0.9398414, 0.2280695, 0.1473501, 1, 0.9647059, 0, 1,
-0.9385759, -0.2725329, -0.7034178, 1, 0.972549, 0, 1,
-0.9318396, 0.3283997, -3.361762, 1, 0.9764706, 0, 1,
-0.9197659, -0.04495453, -0.998919, 1, 0.9843137, 0, 1,
-0.9167431, 1.779036, 0.6855785, 1, 0.9882353, 0, 1,
-0.9148916, -0.8040887, -2.127186, 1, 0.9960784, 0, 1,
-0.9104958, -0.2539275, -2.005141, 0.9960784, 1, 0, 1,
-0.9071463, 0.03770364, -2.00924, 0.9921569, 1, 0, 1,
-0.8991327, -0.127724, -2.531802, 0.9843137, 1, 0, 1,
-0.8956048, 1.173552, -0.141266, 0.9803922, 1, 0, 1,
-0.8955551, -0.2363935, -3.447855, 0.972549, 1, 0, 1,
-0.8895829, -0.1615133, -1.009356, 0.9686275, 1, 0, 1,
-0.8880324, 0.7106541, -0.375631, 0.9607843, 1, 0, 1,
-0.8849761, -0.2045594, -1.542076, 0.9568627, 1, 0, 1,
-0.8805177, 0.106453, -0.4664061, 0.9490196, 1, 0, 1,
-0.8795508, 0.5007396, -0.06986599, 0.945098, 1, 0, 1,
-0.8762744, 0.09869609, 0.1009079, 0.9372549, 1, 0, 1,
-0.8673205, 0.6501336, -0.2551776, 0.9333333, 1, 0, 1,
-0.8647042, 1.222638, -1.039065, 0.9254902, 1, 0, 1,
-0.8608992, -0.1009803, -1.62752, 0.9215686, 1, 0, 1,
-0.860643, 0.4065317, -0.8044875, 0.9137255, 1, 0, 1,
-0.8509511, 0.9438791, -0.06522591, 0.9098039, 1, 0, 1,
-0.8482187, 0.9764546, -2.827567, 0.9019608, 1, 0, 1,
-0.8471806, -1.025274, -1.707605, 0.8941177, 1, 0, 1,
-0.8419673, 1.171409, -1.364072, 0.8901961, 1, 0, 1,
-0.84125, 0.2720418, -0.08609556, 0.8823529, 1, 0, 1,
-0.8287653, -1.191873, -1.874649, 0.8784314, 1, 0, 1,
-0.8252333, -0.4133519, -1.424569, 0.8705882, 1, 0, 1,
-0.8219304, -0.2088302, -2.623842, 0.8666667, 1, 0, 1,
-0.8207037, -0.6761043, -0.6728328, 0.8588235, 1, 0, 1,
-0.8172492, 0.9415513, -0.7656679, 0.854902, 1, 0, 1,
-0.8130003, -1.730852, -2.843491, 0.8470588, 1, 0, 1,
-0.8081705, -0.4741807, -1.747954, 0.8431373, 1, 0, 1,
-0.8065442, 1.451163, 0.6007372, 0.8352941, 1, 0, 1,
-0.8064955, 0.7551051, -0.1680116, 0.8313726, 1, 0, 1,
-0.8025874, 0.1832157, -2.190401, 0.8235294, 1, 0, 1,
-0.7783886, -0.9560159, -2.952841, 0.8196079, 1, 0, 1,
-0.7679721, 1.204789, 2.019491, 0.8117647, 1, 0, 1,
-0.7646338, 0.07879061, -3.171266, 0.8078431, 1, 0, 1,
-0.760336, -0.3705576, -2.98378, 0.8, 1, 0, 1,
-0.7572829, -0.2016074, -2.071183, 0.7921569, 1, 0, 1,
-0.7560583, 0.2108709, -1.79748, 0.7882353, 1, 0, 1,
-0.7508827, 1.899911, -0.1583458, 0.7803922, 1, 0, 1,
-0.7485748, 1.302259, -0.3934705, 0.7764706, 1, 0, 1,
-0.7468947, -0.0645037, -2.577899, 0.7686275, 1, 0, 1,
-0.7444015, -0.8960322, -1.04229, 0.7647059, 1, 0, 1,
-0.7413922, -1.642123, -2.852673, 0.7568628, 1, 0, 1,
-0.7397641, 0.1358695, -1.223529, 0.7529412, 1, 0, 1,
-0.7327258, -0.7184724, -1.876298, 0.7450981, 1, 0, 1,
-0.7309511, 1.132549, 0.94598, 0.7411765, 1, 0, 1,
-0.7260654, -0.1112492, -4.145625, 0.7333333, 1, 0, 1,
-0.7249082, 1.106728, 0.006674663, 0.7294118, 1, 0, 1,
-0.7208055, -0.8738397, -2.031629, 0.7215686, 1, 0, 1,
-0.7176466, 2.748022, -3.903601, 0.7176471, 1, 0, 1,
-0.7125985, -0.6928021, -2.455394, 0.7098039, 1, 0, 1,
-0.7076612, 1.299414, -1.721861, 0.7058824, 1, 0, 1,
-0.699273, 1.166714, 1.181178, 0.6980392, 1, 0, 1,
-0.6978903, 0.2199205, -1.298643, 0.6901961, 1, 0, 1,
-0.6945098, 0.8619292, -1.120741, 0.6862745, 1, 0, 1,
-0.693746, -0.2707856, -4.284844, 0.6784314, 1, 0, 1,
-0.6908051, 0.7709667, 0.3677328, 0.6745098, 1, 0, 1,
-0.6864005, -0.2086234, -1.937633, 0.6666667, 1, 0, 1,
-0.6833114, -1.501075, -1.687918, 0.6627451, 1, 0, 1,
-0.6735083, 0.3612368, -0.348787, 0.654902, 1, 0, 1,
-0.6725163, -0.7060419, -3.16199, 0.6509804, 1, 0, 1,
-0.6697403, -0.1509829, -1.956274, 0.6431373, 1, 0, 1,
-0.6680955, -0.3831142, -1.604221, 0.6392157, 1, 0, 1,
-0.6671995, 0.3543045, -0.4348789, 0.6313726, 1, 0, 1,
-0.6632963, 1.094219, -1.185619, 0.627451, 1, 0, 1,
-0.6595474, 1.081045, 0.06514427, 0.6196079, 1, 0, 1,
-0.6526058, -0.8468535, -3.747272, 0.6156863, 1, 0, 1,
-0.6442599, 0.9723369, -0.7182822, 0.6078432, 1, 0, 1,
-0.6434778, -0.4833176, -2.932011, 0.6039216, 1, 0, 1,
-0.6378661, 1.038908, 0.09108751, 0.5960785, 1, 0, 1,
-0.6360511, 0.2133685, -1.135119, 0.5882353, 1, 0, 1,
-0.6359565, 1.876233, 0.05858587, 0.5843138, 1, 0, 1,
-0.6336619, 0.1234766, -2.048619, 0.5764706, 1, 0, 1,
-0.6283565, 0.4982183, -0.8399322, 0.572549, 1, 0, 1,
-0.6278679, -0.5787041, -4.88459, 0.5647059, 1, 0, 1,
-0.6233401, -0.2622673, -0.7431712, 0.5607843, 1, 0, 1,
-0.6203502, 2.261964, 0.7030389, 0.5529412, 1, 0, 1,
-0.6146579, -1.276331, -2.569863, 0.5490196, 1, 0, 1,
-0.6107125, -0.977503, -2.333457, 0.5411765, 1, 0, 1,
-0.6107005, 0.00456695, -2.342947, 0.5372549, 1, 0, 1,
-0.6092823, 0.05132957, -0.349588, 0.5294118, 1, 0, 1,
-0.608014, -0.2375146, -3.430662, 0.5254902, 1, 0, 1,
-0.5997947, -1.80059, -3.078006, 0.5176471, 1, 0, 1,
-0.5986022, 0.02621813, -2.992027, 0.5137255, 1, 0, 1,
-0.5977632, -0.1508488, -0.4557898, 0.5058824, 1, 0, 1,
-0.5927989, 0.6614636, -0.5896905, 0.5019608, 1, 0, 1,
-0.5843779, 1.165509, -1.057006, 0.4941176, 1, 0, 1,
-0.5758607, -0.6134833, -1.733719, 0.4862745, 1, 0, 1,
-0.5750191, -0.120636, -1.383644, 0.4823529, 1, 0, 1,
-0.5744908, 1.167549, 0.6376109, 0.4745098, 1, 0, 1,
-0.5712376, 0.4469445, -2.370904, 0.4705882, 1, 0, 1,
-0.5655733, -1.146496, -2.755643, 0.4627451, 1, 0, 1,
-0.5644503, 0.08270524, -0.3732856, 0.4588235, 1, 0, 1,
-0.5614116, -1.161973, -3.740106, 0.4509804, 1, 0, 1,
-0.5586897, -0.4116433, -1.067757, 0.4470588, 1, 0, 1,
-0.5557526, -2.77382, -2.598246, 0.4392157, 1, 0, 1,
-0.5522628, -0.269535, -0.110239, 0.4352941, 1, 0, 1,
-0.5509616, -0.8167353, -3.394117, 0.427451, 1, 0, 1,
-0.547913, -1.124355, -2.223043, 0.4235294, 1, 0, 1,
-0.5456666, -0.1957531, -1.463108, 0.4156863, 1, 0, 1,
-0.5431539, -0.835775, -2.617207, 0.4117647, 1, 0, 1,
-0.5404698, 1.250967, -1.122445, 0.4039216, 1, 0, 1,
-0.5314159, 1.041912, -0.2624442, 0.3960784, 1, 0, 1,
-0.5313575, 0.6038243, 1.536476, 0.3921569, 1, 0, 1,
-0.5307763, -0.6326541, -3.269335, 0.3843137, 1, 0, 1,
-0.517484, 0.5494398, -0.281723, 0.3803922, 1, 0, 1,
-0.5165667, -0.4256583, -3.195188, 0.372549, 1, 0, 1,
-0.515305, -0.5205313, -3.179699, 0.3686275, 1, 0, 1,
-0.5131271, 0.9451696, -1.077424, 0.3607843, 1, 0, 1,
-0.5095644, -1.473231, -2.998166, 0.3568628, 1, 0, 1,
-0.5073956, -1.675538, -2.89816, 0.3490196, 1, 0, 1,
-0.503554, 1.099618, -1.576834, 0.345098, 1, 0, 1,
-0.5033936, -1.208294, -2.872427, 0.3372549, 1, 0, 1,
-0.502656, 1.546973, 0.8187215, 0.3333333, 1, 0, 1,
-0.4944957, -0.9342457, -1.93397, 0.3254902, 1, 0, 1,
-0.4934314, 0.3189757, -2.066266, 0.3215686, 1, 0, 1,
-0.4927612, 2.04329, 0.5552394, 0.3137255, 1, 0, 1,
-0.4927496, -0.4326498, -1.64799, 0.3098039, 1, 0, 1,
-0.4897643, 1.460605, -1.51583, 0.3019608, 1, 0, 1,
-0.4864031, -1.105045, -2.705724, 0.2941177, 1, 0, 1,
-0.4796571, -0.5560207, -1.245127, 0.2901961, 1, 0, 1,
-0.4789419, -0.3333678, -2.038306, 0.282353, 1, 0, 1,
-0.4784261, -0.6159293, -1.085037, 0.2784314, 1, 0, 1,
-0.4752989, 0.2410516, -1.841579, 0.2705882, 1, 0, 1,
-0.4745556, 1.433463, 0.995779, 0.2666667, 1, 0, 1,
-0.4736195, 1.114651, -0.7085233, 0.2588235, 1, 0, 1,
-0.4678493, -0.3704532, -1.687112, 0.254902, 1, 0, 1,
-0.4640802, -0.798878, -2.42108, 0.2470588, 1, 0, 1,
-0.4580847, 0.01954102, -0.3304962, 0.2431373, 1, 0, 1,
-0.458068, -0.8249445, -5.178737, 0.2352941, 1, 0, 1,
-0.4567335, -0.44404, -2.392353, 0.2313726, 1, 0, 1,
-0.4561228, -0.1103164, -0.4609057, 0.2235294, 1, 0, 1,
-0.4537032, 0.9246912, -0.9296414, 0.2196078, 1, 0, 1,
-0.4526804, -1.245821, -2.810805, 0.2117647, 1, 0, 1,
-0.4509054, -0.07301511, -1.818276, 0.2078431, 1, 0, 1,
-0.4470124, -0.2051723, -2.812826, 0.2, 1, 0, 1,
-0.4459758, -1.297471, -2.366614, 0.1921569, 1, 0, 1,
-0.4452318, -1.656183, -3.610507, 0.1882353, 1, 0, 1,
-0.4419453, -0.5654968, -1.901637, 0.1803922, 1, 0, 1,
-0.4371744, 1.235331, -0.003234328, 0.1764706, 1, 0, 1,
-0.435578, -0.2983083, 0.01795219, 0.1686275, 1, 0, 1,
-0.4257256, 0.2707129, -0.651027, 0.1647059, 1, 0, 1,
-0.4253635, -0.2029089, -3.253783, 0.1568628, 1, 0, 1,
-0.4225736, 1.564389, 0.06171601, 0.1529412, 1, 0, 1,
-0.4171797, -0.3307743, -2.133392, 0.145098, 1, 0, 1,
-0.4142, -0.6201113, -2.440289, 0.1411765, 1, 0, 1,
-0.4131145, -0.1882828, -1.361896, 0.1333333, 1, 0, 1,
-0.4104121, 1.638854, 0.3272087, 0.1294118, 1, 0, 1,
-0.4046867, -0.5462903, -4.027759, 0.1215686, 1, 0, 1,
-0.3989219, -0.6103862, -1.91854, 0.1176471, 1, 0, 1,
-0.3946166, -0.7622624, -1.999906, 0.1098039, 1, 0, 1,
-0.3944833, -0.5154483, -2.080397, 0.1058824, 1, 0, 1,
-0.3911659, -0.5079572, -2.560601, 0.09803922, 1, 0, 1,
-0.3880754, -1.335798, -4.395611, 0.09019608, 1, 0, 1,
-0.3876842, 1.000867, -0.2265022, 0.08627451, 1, 0, 1,
-0.3856731, -0.7539914, -1.374425, 0.07843138, 1, 0, 1,
-0.3819849, 0.5394575, 0.5594251, 0.07450981, 1, 0, 1,
-0.3806827, -0.322304, -2.295552, 0.06666667, 1, 0, 1,
-0.3800827, -0.1175459, -0.6045949, 0.0627451, 1, 0, 1,
-0.3762791, -1.144082, -3.483447, 0.05490196, 1, 0, 1,
-0.3733457, -1.625855, -3.579189, 0.05098039, 1, 0, 1,
-0.3703105, 0.9166104, 0.5509939, 0.04313726, 1, 0, 1,
-0.3690337, 2.504397, -0.3033115, 0.03921569, 1, 0, 1,
-0.3688903, -0.6664798, -1.333767, 0.03137255, 1, 0, 1,
-0.3660282, -0.4473011, -3.212968, 0.02745098, 1, 0, 1,
-0.3606083, -1.176134, -2.693067, 0.01960784, 1, 0, 1,
-0.3590179, 0.5534502, -0.8592306, 0.01568628, 1, 0, 1,
-0.3578303, 1.038329, 0.7741585, 0.007843138, 1, 0, 1,
-0.3561234, -1.994881, -3.939965, 0.003921569, 1, 0, 1,
-0.3487321, 0.8509017, -0.8247737, 0, 1, 0.003921569, 1,
-0.3487118, -0.05790051, -2.350841, 0, 1, 0.01176471, 1,
-0.3404582, -1.186467, -2.680699, 0, 1, 0.01568628, 1,
-0.3401302, -1.564674, -2.859267, 0, 1, 0.02352941, 1,
-0.3386654, 1.050929, -0.7357404, 0, 1, 0.02745098, 1,
-0.336037, 1.801514, -0.2393999, 0, 1, 0.03529412, 1,
-0.3358195, 0.3277904, -0.04723166, 0, 1, 0.03921569, 1,
-0.3331092, -1.966905, -2.032473, 0, 1, 0.04705882, 1,
-0.3330732, 1.251562, 0.534815, 0, 1, 0.05098039, 1,
-0.3257965, -0.06090304, -2.259132, 0, 1, 0.05882353, 1,
-0.3254242, -1.239174, -3.616271, 0, 1, 0.0627451, 1,
-0.3247925, -0.2985544, -3.630023, 0, 1, 0.07058824, 1,
-0.3196312, 0.110472, -2.765763, 0, 1, 0.07450981, 1,
-0.307418, -0.8693001, -2.94893, 0, 1, 0.08235294, 1,
-0.2991015, 0.107818, -0.8101866, 0, 1, 0.08627451, 1,
-0.2955071, 0.4961982, 0.8966273, 0, 1, 0.09411765, 1,
-0.2945357, 0.3238808, -2.041035, 0, 1, 0.1019608, 1,
-0.2945042, -0.3914204, -2.645742, 0, 1, 0.1058824, 1,
-0.286745, 0.2919053, -1.806642, 0, 1, 0.1137255, 1,
-0.2831347, -0.8186808, -1.905502, 0, 1, 0.1176471, 1,
-0.2820607, 0.4485624, -0.7463852, 0, 1, 0.1254902, 1,
-0.2815692, -0.3673927, -3.668859, 0, 1, 0.1294118, 1,
-0.2805655, 0.3890854, 0.7232047, 0, 1, 0.1372549, 1,
-0.2786464, -0.4435382, -3.899492, 0, 1, 0.1411765, 1,
-0.2780646, 0.4583966, 1.501172, 0, 1, 0.1490196, 1,
-0.2721302, 1.266138, 0.4859286, 0, 1, 0.1529412, 1,
-0.272081, 1.3854, 0.519803, 0, 1, 0.1607843, 1,
-0.2716897, 0.759719, -0.3182118, 0, 1, 0.1647059, 1,
-0.2716226, 0.213548, -2.927354, 0, 1, 0.172549, 1,
-0.2702049, 0.1106951, -1.457432, 0, 1, 0.1764706, 1,
-0.269538, 1.12458, 0.3108858, 0, 1, 0.1843137, 1,
-0.2671427, 1.294505, 0.05099544, 0, 1, 0.1882353, 1,
-0.2660877, 0.4459983, 0.7919899, 0, 1, 0.1960784, 1,
-0.2639699, 2.698588, -1.717039, 0, 1, 0.2039216, 1,
-0.263178, 1.314966, -1.455735, 0, 1, 0.2078431, 1,
-0.2604149, -0.4292288, -3.174845, 0, 1, 0.2156863, 1,
-0.2585373, -0.03580273, -0.6039227, 0, 1, 0.2196078, 1,
-0.2532493, 1.273089, -0.4433491, 0, 1, 0.227451, 1,
-0.2512614, 0.5458311, -0.8712544, 0, 1, 0.2313726, 1,
-0.2476508, -0.002691486, -1.450443, 0, 1, 0.2392157, 1,
-0.2444294, 2.350462, -0.7269377, 0, 1, 0.2431373, 1,
-0.2395736, 1.066498, 2.12481, 0, 1, 0.2509804, 1,
-0.2353913, 2.16031, -0.9856453, 0, 1, 0.254902, 1,
-0.2347486, 1.148334, -0.4144315, 0, 1, 0.2627451, 1,
-0.2338997, -0.3792408, -1.488567, 0, 1, 0.2666667, 1,
-0.2327673, 0.04827723, -1.972985, 0, 1, 0.2745098, 1,
-0.2325947, 0.6149777, -1.486459, 0, 1, 0.2784314, 1,
-0.2280358, 0.4354013, 1.587191, 0, 1, 0.2862745, 1,
-0.2270429, 0.3935432, 1.558636, 0, 1, 0.2901961, 1,
-0.2219422, -1.256408, -2.291831, 0, 1, 0.2980392, 1,
-0.2149941, 1.928644, -0.6130759, 0, 1, 0.3058824, 1,
-0.2097101, 0.1742942, -1.332849, 0, 1, 0.3098039, 1,
-0.2071201, 0.4044514, 0.9266003, 0, 1, 0.3176471, 1,
-0.1997121, 1.057606, -0.05609862, 0, 1, 0.3215686, 1,
-0.1936419, 1.415295, -0.5888489, 0, 1, 0.3294118, 1,
-0.1898111, 0.8182876, -1.589359, 0, 1, 0.3333333, 1,
-0.189754, -0.654052, -2.237519, 0, 1, 0.3411765, 1,
-0.1884831, 0.4267661, 1.051382, 0, 1, 0.345098, 1,
-0.1832596, 0.9623699, 0.6784285, 0, 1, 0.3529412, 1,
-0.178605, -0.4823871, -2.949203, 0, 1, 0.3568628, 1,
-0.1775454, -1.144108, -2.18849, 0, 1, 0.3647059, 1,
-0.1762645, 0.3319394, -1.296547, 0, 1, 0.3686275, 1,
-0.171015, -0.1526881, -2.929673, 0, 1, 0.3764706, 1,
-0.170927, -0.7905607, -2.636065, 0, 1, 0.3803922, 1,
-0.1708713, -0.2304131, -1.911839, 0, 1, 0.3882353, 1,
-0.1707308, -0.2584397, -1.799751, 0, 1, 0.3921569, 1,
-0.1685714, -1.855245, -2.539869, 0, 1, 0.4, 1,
-0.1596953, -0.8172384, -3.01338, 0, 1, 0.4078431, 1,
-0.1493695, 1.556786, -0.7286041, 0, 1, 0.4117647, 1,
-0.1480628, 0.2985218, -0.8329403, 0, 1, 0.4196078, 1,
-0.1446949, -2.035767, -0.8874363, 0, 1, 0.4235294, 1,
-0.1434538, 1.099184, 0.2544087, 0, 1, 0.4313726, 1,
-0.1409979, -0.2312047, -2.329518, 0, 1, 0.4352941, 1,
-0.1399383, 0.8732711, -1.442341, 0, 1, 0.4431373, 1,
-0.1393209, -0.3659934, -4.754891, 0, 1, 0.4470588, 1,
-0.134575, -0.2968747, -2.34416, 0, 1, 0.454902, 1,
-0.1309139, -0.109541, -2.489566, 0, 1, 0.4588235, 1,
-0.1196844, 0.371866, 0.3172571, 0, 1, 0.4666667, 1,
-0.1195582, -0.9384089, -4.056514, 0, 1, 0.4705882, 1,
-0.1156604, 0.5817567, -1.883461, 0, 1, 0.4784314, 1,
-0.115018, 0.1598993, -0.9210351, 0, 1, 0.4823529, 1,
-0.1130904, -0.1571429, -1.890885, 0, 1, 0.4901961, 1,
-0.1111823, 1.403385, 0.1342595, 0, 1, 0.4941176, 1,
-0.1105948, -0.3200614, -2.314504, 0, 1, 0.5019608, 1,
-0.1055221, 0.4038481, -0.2040929, 0, 1, 0.509804, 1,
-0.1028997, 1.351237, 0.2894622, 0, 1, 0.5137255, 1,
-0.1020856, -1.155384, -3.739581, 0, 1, 0.5215687, 1,
-0.1015673, 0.5542719, -0.3422219, 0, 1, 0.5254902, 1,
-0.1002594, 1.117454, -0.2369472, 0, 1, 0.5333334, 1,
-0.09999367, 0.6939188, 0.8446831, 0, 1, 0.5372549, 1,
-0.09560975, 0.9495371, -0.7657626, 0, 1, 0.5450981, 1,
-0.09349669, 0.6406878, -0.371486, 0, 1, 0.5490196, 1,
-0.09082489, 1.44278, 0.4586318, 0, 1, 0.5568628, 1,
-0.08971737, -0.5519638, -2.125564, 0, 1, 0.5607843, 1,
-0.08810241, 0.8242212, -1.664698, 0, 1, 0.5686275, 1,
-0.08643319, 0.9863514, -0.2785174, 0, 1, 0.572549, 1,
-0.08541023, -0.4543089, -2.935562, 0, 1, 0.5803922, 1,
-0.07815059, 1.173732, 0.7507803, 0, 1, 0.5843138, 1,
-0.07673241, 0.1952367, 0.5999829, 0, 1, 0.5921569, 1,
-0.07043155, -1.128971, -2.776071, 0, 1, 0.5960785, 1,
-0.06976341, -0.6290494, -2.657132, 0, 1, 0.6039216, 1,
-0.06375294, -0.05967499, -2.483728, 0, 1, 0.6117647, 1,
-0.05371875, 0.05022773, -1.712815, 0, 1, 0.6156863, 1,
-0.04387748, -0.04691637, -2.965375, 0, 1, 0.6235294, 1,
-0.04365919, -0.7343738, -1.662924, 0, 1, 0.627451, 1,
-0.04009655, -0.8500282, -1.657082, 0, 1, 0.6352941, 1,
-0.03985323, 1.315747, -1.539601, 0, 1, 0.6392157, 1,
-0.03431154, -0.9731891, -5.029641, 0, 1, 0.6470588, 1,
-0.02938448, 0.1494323, 1.78773, 0, 1, 0.6509804, 1,
-0.02623015, -0.191623, -3.363423, 0, 1, 0.6588235, 1,
-0.02444841, 0.138246, -0.3768882, 0, 1, 0.6627451, 1,
-0.02326645, -0.9922518, -2.154198, 0, 1, 0.6705883, 1,
-0.02169882, -1.582518, -2.169696, 0, 1, 0.6745098, 1,
-0.01687291, -0.5890014, -2.549983, 0, 1, 0.682353, 1,
-0.01641924, 0.09526078, 0.5468442, 0, 1, 0.6862745, 1,
-0.01420454, 0.6912925, 1.295506, 0, 1, 0.6941177, 1,
-0.01382548, -2.152083, -2.176818, 0, 1, 0.7019608, 1,
-0.01380255, -1.883394, -3.28235, 0, 1, 0.7058824, 1,
-0.01305823, 0.5454523, 0.3349213, 0, 1, 0.7137255, 1,
-0.01242611, -0.2762788, -3.979161, 0, 1, 0.7176471, 1,
-0.01221888, -2.987983, -4.905608, 0, 1, 0.7254902, 1,
-0.01213386, -0.3254279, -3.922852, 0, 1, 0.7294118, 1,
-0.01165914, -0.1569829, -4.389887, 0, 1, 0.7372549, 1,
-0.01015672, -0.227652, -1.218769, 0, 1, 0.7411765, 1,
-0.009383103, 0.02107851, -0.7205899, 0, 1, 0.7490196, 1,
-0.005156728, -0.5699182, -1.500073, 0, 1, 0.7529412, 1,
0.0008283759, -0.2142851, 2.318126, 0, 1, 0.7607843, 1,
0.003756178, -2.045342, 3.738449, 0, 1, 0.7647059, 1,
0.00395495, 0.3285701, -0.8434284, 0, 1, 0.772549, 1,
0.008827686, -0.0210125, 0.9913976, 0, 1, 0.7764706, 1,
0.01591047, -0.1194475, 2.009947, 0, 1, 0.7843137, 1,
0.01643458, -0.3948553, 3.877244, 0, 1, 0.7882353, 1,
0.01787632, 0.4692705, 1.307505, 0, 1, 0.7960784, 1,
0.01795906, 1.506174, 1.086793, 0, 1, 0.8039216, 1,
0.01828383, 0.3489268, -1.083457, 0, 1, 0.8078431, 1,
0.01923581, -0.07892856, 4.835057, 0, 1, 0.8156863, 1,
0.02082792, 1.474549, 0.3232467, 0, 1, 0.8196079, 1,
0.0213791, -1.228562, 2.320066, 0, 1, 0.827451, 1,
0.02397522, -1.11815, 4.458901, 0, 1, 0.8313726, 1,
0.02735581, -0.9619682, 4.239308, 0, 1, 0.8392157, 1,
0.02754001, -0.324674, 4.463081, 0, 1, 0.8431373, 1,
0.02837144, -0.3064131, 3.354509, 0, 1, 0.8509804, 1,
0.02935647, -0.3217523, 3.952187, 0, 1, 0.854902, 1,
0.03162635, -0.8290932, 3.244947, 0, 1, 0.8627451, 1,
0.03215842, -1.830701, 3.149395, 0, 1, 0.8666667, 1,
0.03753299, 0.7210645, 1.361233, 0, 1, 0.8745098, 1,
0.04014134, -0.3087835, 3.55198, 0, 1, 0.8784314, 1,
0.04202578, -1.241801, 2.932746, 0, 1, 0.8862745, 1,
0.04489407, -0.8546654, 4.115623, 0, 1, 0.8901961, 1,
0.05080782, 0.477741, 0.8048389, 0, 1, 0.8980392, 1,
0.05153618, 0.8020853, -0.8795425, 0, 1, 0.9058824, 1,
0.0524699, 1.061098, 0.2233503, 0, 1, 0.9098039, 1,
0.05367722, 1.178036, 2.245103, 0, 1, 0.9176471, 1,
0.05496551, 1.492967, -0.8021746, 0, 1, 0.9215686, 1,
0.06022534, -0.3033754, 2.832664, 0, 1, 0.9294118, 1,
0.06173866, -0.3278189, 3.558697, 0, 1, 0.9333333, 1,
0.0622486, 0.8434398, 0.99226, 0, 1, 0.9411765, 1,
0.06857045, 0.427173, 1.461471, 0, 1, 0.945098, 1,
0.0698794, 0.8307461, -0.2712514, 0, 1, 0.9529412, 1,
0.07142374, 0.3923797, 0.1735549, 0, 1, 0.9568627, 1,
0.07155563, 0.3242022, 1.24212, 0, 1, 0.9647059, 1,
0.07380432, -0.6023101, 3.39838, 0, 1, 0.9686275, 1,
0.07388689, -0.6996308, 3.581475, 0, 1, 0.9764706, 1,
0.07860401, -1.000375, 1.818341, 0, 1, 0.9803922, 1,
0.08009963, 0.8832296, 2.073725, 0, 1, 0.9882353, 1,
0.08161686, 0.2703574, -0.9014933, 0, 1, 0.9921569, 1,
0.08671387, -0.2785704, 3.118392, 0, 1, 1, 1,
0.09196807, -0.7372831, 3.882722, 0, 0.9921569, 1, 1,
0.0943484, -0.05187542, 0.877609, 0, 0.9882353, 1, 1,
0.0952941, -0.8802894, 3.41726, 0, 0.9803922, 1, 1,
0.102815, -0.5450315, 3.035427, 0, 0.9764706, 1, 1,
0.1047991, -0.2347747, 3.949475, 0, 0.9686275, 1, 1,
0.1049082, -1.073947, 2.620578, 0, 0.9647059, 1, 1,
0.1054603, -2.345377, 2.81474, 0, 0.9568627, 1, 1,
0.1059938, -0.6218624, 3.196025, 0, 0.9529412, 1, 1,
0.1064719, 0.6869771, 0.3877151, 0, 0.945098, 1, 1,
0.1074883, -0.04122164, 2.1891, 0, 0.9411765, 1, 1,
0.1075103, -1.32838, 3.92484, 0, 0.9333333, 1, 1,
0.1120458, 0.5170295, 1.109659, 0, 0.9294118, 1, 1,
0.1136685, 0.3742527, -0.04234984, 0, 0.9215686, 1, 1,
0.1151022, -0.8534098, 3.439757, 0, 0.9176471, 1, 1,
0.1154728, -0.5505437, 2.964006, 0, 0.9098039, 1, 1,
0.1164144, 1.367229, 0.9117523, 0, 0.9058824, 1, 1,
0.1171387, -1.604461, 1.809004, 0, 0.8980392, 1, 1,
0.1203927, -0.8613808, 2.612314, 0, 0.8901961, 1, 1,
0.1216722, -0.1894024, 1.280672, 0, 0.8862745, 1, 1,
0.1252092, -0.4592498, 2.325358, 0, 0.8784314, 1, 1,
0.1252752, 0.697269, -2.153394, 0, 0.8745098, 1, 1,
0.1308424, 0.8351771, -1.042304, 0, 0.8666667, 1, 1,
0.1312047, 1.683606, 1.222545, 0, 0.8627451, 1, 1,
0.1375161, -0.1038759, 2.311419, 0, 0.854902, 1, 1,
0.1376657, 0.9634734, 0.6063651, 0, 0.8509804, 1, 1,
0.1439512, -1.264644, 4.113337, 0, 0.8431373, 1, 1,
0.1493939, 0.159509, 1.212196, 0, 0.8392157, 1, 1,
0.1516826, 1.29707, 1.516595, 0, 0.8313726, 1, 1,
0.1524064, -1.011246, 2.208618, 0, 0.827451, 1, 1,
0.1526333, -0.3845864, 1.779327, 0, 0.8196079, 1, 1,
0.1529209, 0.01300805, 2.950726, 0, 0.8156863, 1, 1,
0.1537635, -1.709991, 3.1406, 0, 0.8078431, 1, 1,
0.1621871, -0.4748454, 2.988976, 0, 0.8039216, 1, 1,
0.1633153, -1.728756, 2.449108, 0, 0.7960784, 1, 1,
0.164762, 1.051103, 1.607887, 0, 0.7882353, 1, 1,
0.167587, 0.1197476, 1.637716, 0, 0.7843137, 1, 1,
0.1712717, 0.8453738, 1.086914, 0, 0.7764706, 1, 1,
0.174221, 0.7527642, 0.3918775, 0, 0.772549, 1, 1,
0.1772188, 0.9226473, -0.9340639, 0, 0.7647059, 1, 1,
0.1885621, 0.9819679, 0.1710255, 0, 0.7607843, 1, 1,
0.1900028, -0.06461961, 0.06523602, 0, 0.7529412, 1, 1,
0.1946194, 0.3705348, 1.561653, 0, 0.7490196, 1, 1,
0.1960343, 0.9959195, 2.503612, 0, 0.7411765, 1, 1,
0.2016701, 0.3366607, 1.242791, 0, 0.7372549, 1, 1,
0.2051056, -0.6570087, 0.703593, 0, 0.7294118, 1, 1,
0.2063963, 1.321656, -0.3420744, 0, 0.7254902, 1, 1,
0.2068074, -0.6082479, 3.000444, 0, 0.7176471, 1, 1,
0.2099288, -0.5741775, 3.911168, 0, 0.7137255, 1, 1,
0.2109519, 1.22202, -0.6892264, 0, 0.7058824, 1, 1,
0.2129074, 0.761405, -0.844176, 0, 0.6980392, 1, 1,
0.2168324, -0.208859, 3.11486, 0, 0.6941177, 1, 1,
0.2191855, 1.301477, 0.03502587, 0, 0.6862745, 1, 1,
0.2234663, -1.504698, 2.506216, 0, 0.682353, 1, 1,
0.2236373, -0.7658117, 1.858426, 0, 0.6745098, 1, 1,
0.2286668, 0.7189986, 1.130272, 0, 0.6705883, 1, 1,
0.2320351, 0.3094937, 1.424991, 0, 0.6627451, 1, 1,
0.2348524, 0.222412, 1.20014, 0, 0.6588235, 1, 1,
0.2401857, -0.9570892, 1.536524, 0, 0.6509804, 1, 1,
0.2444962, 1.495209, -1.472179, 0, 0.6470588, 1, 1,
0.2465203, 0.2934326, 1.906946, 0, 0.6392157, 1, 1,
0.2469719, 1.251273, -0.2733789, 0, 0.6352941, 1, 1,
0.247331, -0.4745392, 0.5622544, 0, 0.627451, 1, 1,
0.2548524, 0.4872683, 1.832632, 0, 0.6235294, 1, 1,
0.257631, -0.3763606, 1.954932, 0, 0.6156863, 1, 1,
0.2576525, 0.494854, -1.747547, 0, 0.6117647, 1, 1,
0.2666073, 0.5269279, 1.646311, 0, 0.6039216, 1, 1,
0.2728624, -1.177539, 3.189476, 0, 0.5960785, 1, 1,
0.2731265, 0.4603292, 0.8900409, 0, 0.5921569, 1, 1,
0.2748, -0.8233889, 2.270845, 0, 0.5843138, 1, 1,
0.2773638, 0.1736806, 2.002606, 0, 0.5803922, 1, 1,
0.2782033, 1.115829, 0.6939005, 0, 0.572549, 1, 1,
0.2787518, -1.58917, 3.62265, 0, 0.5686275, 1, 1,
0.2789644, 0.6975773, 0.8516599, 0, 0.5607843, 1, 1,
0.2795603, -0.4595678, 1.019006, 0, 0.5568628, 1, 1,
0.2824137, 0.4952516, 2.14601, 0, 0.5490196, 1, 1,
0.2898892, 0.06407888, 1.237037, 0, 0.5450981, 1, 1,
0.2920614, 0.290474, 1.863615, 0, 0.5372549, 1, 1,
0.2920739, 0.7033793, 1.04802, 0, 0.5333334, 1, 1,
0.2923385, -0.1551613, 2.977887, 0, 0.5254902, 1, 1,
0.2938408, -0.2726704, 2.791476, 0, 0.5215687, 1, 1,
0.2943231, -1.886956, 1.721376, 0, 0.5137255, 1, 1,
0.2943833, 1.341449, -0.1871407, 0, 0.509804, 1, 1,
0.2962332, -0.3288487, 3.24993, 0, 0.5019608, 1, 1,
0.2980185, -1.637215, 4.059592, 0, 0.4941176, 1, 1,
0.3020065, -0.2379259, 1.152865, 0, 0.4901961, 1, 1,
0.3076531, 1.097487, 2.180527, 0, 0.4823529, 1, 1,
0.3083918, -0.7148787, 2.095446, 0, 0.4784314, 1, 1,
0.3116031, 0.631339, -0.1017305, 0, 0.4705882, 1, 1,
0.3131877, 0.9999302, -2.022921, 0, 0.4666667, 1, 1,
0.3146741, 0.8623968, 1.548272, 0, 0.4588235, 1, 1,
0.3301455, 2.026864, -0.1425405, 0, 0.454902, 1, 1,
0.3336436, -0.9979771, 2.670424, 0, 0.4470588, 1, 1,
0.3344792, 0.6044652, 0.3733382, 0, 0.4431373, 1, 1,
0.3345051, -1.726418, 3.304117, 0, 0.4352941, 1, 1,
0.3357429, 1.241352, -1.008659, 0, 0.4313726, 1, 1,
0.3441806, 0.550566, 2.040437, 0, 0.4235294, 1, 1,
0.344661, 0.7603155, 1.796864, 0, 0.4196078, 1, 1,
0.346068, -0.5871359, 2.289258, 0, 0.4117647, 1, 1,
0.3466024, 1.046246, -0.03286923, 0, 0.4078431, 1, 1,
0.3544707, 0.5253913, 2.18506, 0, 0.4, 1, 1,
0.3573008, 2.753235, 0.2038625, 0, 0.3921569, 1, 1,
0.3581513, 0.246407, 0.857735, 0, 0.3882353, 1, 1,
0.3600043, -0.7912691, 2.704841, 0, 0.3803922, 1, 1,
0.3600496, -2.617048, 4.45771, 0, 0.3764706, 1, 1,
0.3695868, -0.9143473, 2.724429, 0, 0.3686275, 1, 1,
0.370631, 0.02802149, 0.1582749, 0, 0.3647059, 1, 1,
0.3718206, 0.6356971, -0.4261535, 0, 0.3568628, 1, 1,
0.3828335, -2.412899, 4.139635, 0, 0.3529412, 1, 1,
0.3859981, -1.06373, 2.894994, 0, 0.345098, 1, 1,
0.3962123, -1.413728, 3.584632, 0, 0.3411765, 1, 1,
0.3971828, 0.1059083, 0.1725141, 0, 0.3333333, 1, 1,
0.4001869, -0.498406, 2.157989, 0, 0.3294118, 1, 1,
0.4089974, 0.0157093, 1.409195, 0, 0.3215686, 1, 1,
0.4127171, 0.1751945, 0.9266232, 0, 0.3176471, 1, 1,
0.4128947, -0.7715682, 3.084798, 0, 0.3098039, 1, 1,
0.415348, -0.2691487, 3.034239, 0, 0.3058824, 1, 1,
0.4159026, 2.400533, 0.4967392, 0, 0.2980392, 1, 1,
0.4168396, 1.400044, 2.102397, 0, 0.2901961, 1, 1,
0.4181409, 0.8956712, -0.3455491, 0, 0.2862745, 1, 1,
0.4223353, 2.068898, -0.01175265, 0, 0.2784314, 1, 1,
0.4246508, 0.9321733, -1.400453, 0, 0.2745098, 1, 1,
0.4254089, 0.1729304, -0.6466708, 0, 0.2666667, 1, 1,
0.4257163, -1.622966, 3.355399, 0, 0.2627451, 1, 1,
0.4260601, -0.007069957, 2.107144, 0, 0.254902, 1, 1,
0.4288701, 0.1544932, 2.099437, 0, 0.2509804, 1, 1,
0.43234, -0.2883468, 1.305725, 0, 0.2431373, 1, 1,
0.4325575, -0.6406294, 3.838975, 0, 0.2392157, 1, 1,
0.4333098, 1.661657, 0.8558229, 0, 0.2313726, 1, 1,
0.4349715, -1.558167, 3.540607, 0, 0.227451, 1, 1,
0.4370045, -0.6606579, 2.596821, 0, 0.2196078, 1, 1,
0.4390891, -0.04658937, 1.889041, 0, 0.2156863, 1, 1,
0.4453905, 0.8880376, 1.491296, 0, 0.2078431, 1, 1,
0.445962, 2.562061, 0.5382211, 0, 0.2039216, 1, 1,
0.4471033, -0.3462625, 2.69486, 0, 0.1960784, 1, 1,
0.4474865, 0.8386185, -1.509647, 0, 0.1882353, 1, 1,
0.4535401, 0.07826969, 3.234651, 0, 0.1843137, 1, 1,
0.4545697, -0.2843926, 0.9581313, 0, 0.1764706, 1, 1,
0.4555365, 0.744267, 1.118293, 0, 0.172549, 1, 1,
0.467161, -0.2501218, 3.541682, 0, 0.1647059, 1, 1,
0.4694498, 0.3435541, 0.06490173, 0, 0.1607843, 1, 1,
0.4732664, -1.29239, 2.719611, 0, 0.1529412, 1, 1,
0.4743388, -0.6710058, 1.748422, 0, 0.1490196, 1, 1,
0.4765325, 2.519668, -0.595819, 0, 0.1411765, 1, 1,
0.4778263, -1.143966, 2.924773, 0, 0.1372549, 1, 1,
0.4784801, 1.16936, -1.468391, 0, 0.1294118, 1, 1,
0.4785618, 0.1134634, 0.7049037, 0, 0.1254902, 1, 1,
0.4792098, 0.6165505, 0.262433, 0, 0.1176471, 1, 1,
0.4797215, -1.845514, 0.9617717, 0, 0.1137255, 1, 1,
0.4810034, -0.2129068, 2.729076, 0, 0.1058824, 1, 1,
0.4838009, 0.1465595, 2.399371, 0, 0.09803922, 1, 1,
0.4860058, -0.8383891, 0.9313113, 0, 0.09411765, 1, 1,
0.4894924, 0.6368203, 1.303642, 0, 0.08627451, 1, 1,
0.4898957, -0.9001523, 1.950158, 0, 0.08235294, 1, 1,
0.4904788, 0.6677858, 0.6178559, 0, 0.07450981, 1, 1,
0.4938038, 0.566305, 2.065974, 0, 0.07058824, 1, 1,
0.4951523, -0.2241582, 0.6151658, 0, 0.0627451, 1, 1,
0.4984527, 0.4403949, 1.905594, 0, 0.05882353, 1, 1,
0.4988688, -0.03263342, 2.045089, 0, 0.05098039, 1, 1,
0.5021223, 2.287297, -0.2216741, 0, 0.04705882, 1, 1,
0.5110762, 1.315248, 0.4215818, 0, 0.03921569, 1, 1,
0.5125836, 0.9702574, 0.4324956, 0, 0.03529412, 1, 1,
0.5152526, -0.9539936, 3.611305, 0, 0.02745098, 1, 1,
0.5172516, -0.3010725, 1.38583, 0, 0.02352941, 1, 1,
0.5214215, 1.912727, 1.030993, 0, 0.01568628, 1, 1,
0.525288, 0.9086158, 0.4004391, 0, 0.01176471, 1, 1,
0.5266784, 0.3234123, 0.7615014, 0, 0.003921569, 1, 1,
0.5297949, -0.358036, 1.691838, 0.003921569, 0, 1, 1,
0.5299775, -0.4115054, 3.084409, 0.007843138, 0, 1, 1,
0.5299905, -0.08025927, 2.080166, 0.01568628, 0, 1, 1,
0.530569, -1.068004, 2.384539, 0.01960784, 0, 1, 1,
0.5322798, 0.3007611, 1.600124, 0.02745098, 0, 1, 1,
0.5352975, 0.4668803, 1.946938, 0.03137255, 0, 1, 1,
0.5375018, 0.1762026, 2.456045, 0.03921569, 0, 1, 1,
0.5399786, 0.9087317, -0.3734076, 0.04313726, 0, 1, 1,
0.5404869, 0.5619348, -0.9643503, 0.05098039, 0, 1, 1,
0.5453551, -0.1914981, 2.54206, 0.05490196, 0, 1, 1,
0.552638, 1.137704, 2.631771, 0.0627451, 0, 1, 1,
0.5624706, -0.5303249, 0.5832734, 0.06666667, 0, 1, 1,
0.5632515, 0.7795582, 0.9517063, 0.07450981, 0, 1, 1,
0.5653155, 0.6716682, 1.662912, 0.07843138, 0, 1, 1,
0.5687727, 2.462085, 0.495226, 0.08627451, 0, 1, 1,
0.5703918, 0.118078, 1.596288, 0.09019608, 0, 1, 1,
0.5735061, 1.118141, 1.727403, 0.09803922, 0, 1, 1,
0.5750594, 1.098055, 0.07411206, 0.1058824, 0, 1, 1,
0.5769196, -0.06255868, 1.504057, 0.1098039, 0, 1, 1,
0.585126, 0.2081353, 2.082596, 0.1176471, 0, 1, 1,
0.5878762, -0.3270976, 3.064258, 0.1215686, 0, 1, 1,
0.5881445, 1.058807, 0.3415289, 0.1294118, 0, 1, 1,
0.5920761, -0.9951387, 3.181479, 0.1333333, 0, 1, 1,
0.5925964, 1.406269, 0.9481754, 0.1411765, 0, 1, 1,
0.5929518, 1.941755, -1.722284, 0.145098, 0, 1, 1,
0.5931537, -0.6455435, 2.691947, 0.1529412, 0, 1, 1,
0.5947204, 0.06073547, 1.289896, 0.1568628, 0, 1, 1,
0.6062428, -0.6787315, 2.611408, 0.1647059, 0, 1, 1,
0.6088856, -0.39142, 0.2299963, 0.1686275, 0, 1, 1,
0.6093843, -0.5468079, 4.970608, 0.1764706, 0, 1, 1,
0.6136746, 1.074774, -0.7515132, 0.1803922, 0, 1, 1,
0.6192652, 0.1516163, 1.635224, 0.1882353, 0, 1, 1,
0.6237183, 0.3320863, 0.939204, 0.1921569, 0, 1, 1,
0.6244317, -0.306425, 3.123147, 0.2, 0, 1, 1,
0.6287882, -0.2944083, 2.441662, 0.2078431, 0, 1, 1,
0.6299652, 0.2724088, 0.6158924, 0.2117647, 0, 1, 1,
0.630313, 1.390981, -0.7919827, 0.2196078, 0, 1, 1,
0.6303385, -1.561659, 2.327059, 0.2235294, 0, 1, 1,
0.6310077, 0.2930245, 0.5604427, 0.2313726, 0, 1, 1,
0.6324804, 0.04058278, 2.051301, 0.2352941, 0, 1, 1,
0.6325467, -0.1157005, 0.7509698, 0.2431373, 0, 1, 1,
0.6332219, -1.376873, 3.227669, 0.2470588, 0, 1, 1,
0.6349389, 0.1778091, -0.3620075, 0.254902, 0, 1, 1,
0.6443569, -2.033498, 2.265552, 0.2588235, 0, 1, 1,
0.6454108, -0.1845188, 3.496805, 0.2666667, 0, 1, 1,
0.6489089, -0.4228381, 3.711108, 0.2705882, 0, 1, 1,
0.6507017, 1.622004, -2.092935, 0.2784314, 0, 1, 1,
0.6512125, -0.09403189, 2.070209, 0.282353, 0, 1, 1,
0.6521021, -0.0682766, 1.423065, 0.2901961, 0, 1, 1,
0.656285, 1.461814, 1.149124, 0.2941177, 0, 1, 1,
0.6619829, 0.8522714, -1.420356, 0.3019608, 0, 1, 1,
0.6622323, 0.9792773, -0.4189398, 0.3098039, 0, 1, 1,
0.669625, 0.2775501, 0.4963779, 0.3137255, 0, 1, 1,
0.673594, -0.4034289, 1.173861, 0.3215686, 0, 1, 1,
0.6758321, -0.5513514, 3.567639, 0.3254902, 0, 1, 1,
0.6764308, 0.650564, 1.385683, 0.3333333, 0, 1, 1,
0.6825956, 1.393752, 0.1370276, 0.3372549, 0, 1, 1,
0.6828659, 0.4608157, 0.2178013, 0.345098, 0, 1, 1,
0.6897963, -0.009158929, 2.026178, 0.3490196, 0, 1, 1,
0.6918671, 0.1544084, 1.336984, 0.3568628, 0, 1, 1,
0.6922233, 0.1331678, 2.826819, 0.3607843, 0, 1, 1,
0.6947159, 0.8612709, 1.255035, 0.3686275, 0, 1, 1,
0.7014154, -0.6466277, 1.024765, 0.372549, 0, 1, 1,
0.701737, -0.8194962, 2.246107, 0.3803922, 0, 1, 1,
0.7069065, -1.457158, -0.07282691, 0.3843137, 0, 1, 1,
0.7122453, -0.3693621, 1.273823, 0.3921569, 0, 1, 1,
0.7139326, 0.3401841, 2.599136, 0.3960784, 0, 1, 1,
0.7147348, -0.1319122, 0.7434846, 0.4039216, 0, 1, 1,
0.7195389, -0.6150182, 0.9779717, 0.4117647, 0, 1, 1,
0.722518, -0.5269892, 0.1575381, 0.4156863, 0, 1, 1,
0.7225516, 0.09870347, 3.204767, 0.4235294, 0, 1, 1,
0.7247502, -0.09778987, 2.155799, 0.427451, 0, 1, 1,
0.7268896, 0.6359625, 0.9471023, 0.4352941, 0, 1, 1,
0.7401356, -0.6932877, 2.553136, 0.4392157, 0, 1, 1,
0.743816, 0.5424187, 0.04980586, 0.4470588, 0, 1, 1,
0.7470318, 1.693148, -0.0004159539, 0.4509804, 0, 1, 1,
0.7494692, -0.8605458, 4.220042, 0.4588235, 0, 1, 1,
0.7496663, 0.5934992, 1.406566, 0.4627451, 0, 1, 1,
0.7559751, 0.4250726, 0.3662958, 0.4705882, 0, 1, 1,
0.7581242, 1.038446, 2.102619, 0.4745098, 0, 1, 1,
0.7620016, -0.3415762, 1.538428, 0.4823529, 0, 1, 1,
0.7641214, 0.3519878, 1.096503, 0.4862745, 0, 1, 1,
0.7677571, 0.5316215, 0.1430454, 0.4941176, 0, 1, 1,
0.7716749, -1.666686, 3.472397, 0.5019608, 0, 1, 1,
0.7757869, 0.6700987, 1.629815, 0.5058824, 0, 1, 1,
0.7759045, -1.038223, 2.087799, 0.5137255, 0, 1, 1,
0.7765067, 0.4966855, 0.4448968, 0.5176471, 0, 1, 1,
0.7800751, 0.09221725, 3.041464, 0.5254902, 0, 1, 1,
0.7829136, -0.4088401, 2.199612, 0.5294118, 0, 1, 1,
0.7870696, 0.8257611, 1.796829, 0.5372549, 0, 1, 1,
0.7871994, 0.4396843, -0.5247893, 0.5411765, 0, 1, 1,
0.7938693, 0.7245052, 0.6958187, 0.5490196, 0, 1, 1,
0.794728, -1.341581, 2.518455, 0.5529412, 0, 1, 1,
0.8014482, 0.2182692, 1.884109, 0.5607843, 0, 1, 1,
0.8040145, 0.2867244, 2.360482, 0.5647059, 0, 1, 1,
0.8109185, -0.6408072, 2.088002, 0.572549, 0, 1, 1,
0.8226249, 3.082568, -0.02752597, 0.5764706, 0, 1, 1,
0.8229384, -0.9880856, 3.278664, 0.5843138, 0, 1, 1,
0.823966, -0.4772123, 1.792458, 0.5882353, 0, 1, 1,
0.8264952, 0.3411848, -0.1274747, 0.5960785, 0, 1, 1,
0.8265482, -0.3563243, 2.651706, 0.6039216, 0, 1, 1,
0.8290055, -0.6635627, 1.445439, 0.6078432, 0, 1, 1,
0.8400984, -0.1368076, 0.5091452, 0.6156863, 0, 1, 1,
0.8465398, 1.074968, 1.486656, 0.6196079, 0, 1, 1,
0.8478529, 0.1767087, 0.4985497, 0.627451, 0, 1, 1,
0.8544868, -0.1976506, 1.13936, 0.6313726, 0, 1, 1,
0.8550383, -1.194872, 2.331538, 0.6392157, 0, 1, 1,
0.8603173, 1.984971, 0.3724596, 0.6431373, 0, 1, 1,
0.8605315, 0.675254, 0.9436392, 0.6509804, 0, 1, 1,
0.8613523, -0.2332061, 2.940959, 0.654902, 0, 1, 1,
0.8656751, -0.8960388, 2.274874, 0.6627451, 0, 1, 1,
0.8746778, 1.226338, 1.185492, 0.6666667, 0, 1, 1,
0.8765163, 0.6964377, 0.3909295, 0.6745098, 0, 1, 1,
0.8845509, 1.638401, -0.1660164, 0.6784314, 0, 1, 1,
0.8846389, 0.6553064, 1.007828, 0.6862745, 0, 1, 1,
0.8860659, -3.465215, 2.06127, 0.6901961, 0, 1, 1,
0.8869128, -0.6701254, 3.175383, 0.6980392, 0, 1, 1,
0.890837, 2.347576, 1.452711, 0.7058824, 0, 1, 1,
0.8959373, 2.250733, 0.8847057, 0.7098039, 0, 1, 1,
0.8989042, 0.2476683, 1.435195, 0.7176471, 0, 1, 1,
0.9026014, 1.87577, 0.3907836, 0.7215686, 0, 1, 1,
0.904799, -0.7324044, 2.333077, 0.7294118, 0, 1, 1,
0.9052087, -0.01212469, 2.811273, 0.7333333, 0, 1, 1,
0.9202715, -0.867535, 2.290544, 0.7411765, 0, 1, 1,
0.922851, -0.03236052, 0.7066242, 0.7450981, 0, 1, 1,
0.9312558, 0.220651, 1.66497, 0.7529412, 0, 1, 1,
0.933991, -0.2856757, 2.721431, 0.7568628, 0, 1, 1,
0.9372429, 1.807423, 0.8603173, 0.7647059, 0, 1, 1,
0.9376498, -0.1361268, 2.49697, 0.7686275, 0, 1, 1,
0.9381573, 0.8250564, 1.325171, 0.7764706, 0, 1, 1,
0.9397438, 0.05599731, 1.130437, 0.7803922, 0, 1, 1,
0.9458013, 1.598869, 2.233228, 0.7882353, 0, 1, 1,
0.9595152, 1.024392, 0.5409746, 0.7921569, 0, 1, 1,
0.9676499, 0.4345788, 1.367472, 0.8, 0, 1, 1,
0.9683394, 0.4065931, -0.1477738, 0.8078431, 0, 1, 1,
0.9695595, -0.5129753, 0.6844497, 0.8117647, 0, 1, 1,
0.9709842, -0.00712079, 3.065257, 0.8196079, 0, 1, 1,
0.9714449, -1.092557, 4.93394, 0.8235294, 0, 1, 1,
0.9780078, -1.322398, 3.259461, 0.8313726, 0, 1, 1,
0.9780803, -1.224101, 3.111445, 0.8352941, 0, 1, 1,
0.9814048, 0.1912335, 1.912658, 0.8431373, 0, 1, 1,
0.9880732, -1.346417, 1.199268, 0.8470588, 0, 1, 1,
0.9907059, -1.224804, 2.568183, 0.854902, 0, 1, 1,
0.9938338, -0.3164712, 2.820242, 0.8588235, 0, 1, 1,
0.9992623, -2.343404, 2.44303, 0.8666667, 0, 1, 1,
1.003484, 0.1018343, 1.522421, 0.8705882, 0, 1, 1,
1.005436, -0.385317, 2.096933, 0.8784314, 0, 1, 1,
1.006327, 0.1829465, 1.681419, 0.8823529, 0, 1, 1,
1.0099, -0.379798, 1.571159, 0.8901961, 0, 1, 1,
1.017128, -0.1690925, 2.039164, 0.8941177, 0, 1, 1,
1.022999, 0.7060641, 2.355795, 0.9019608, 0, 1, 1,
1.023674, -0.8482467, 2.659254, 0.9098039, 0, 1, 1,
1.028778, -0.6343402, 2.329971, 0.9137255, 0, 1, 1,
1.033082, -1.289899, 1.987735, 0.9215686, 0, 1, 1,
1.0345, -0.5844078, 0.9137914, 0.9254902, 0, 1, 1,
1.035522, 0.4732061, 1.029338, 0.9333333, 0, 1, 1,
1.036774, -0.3601557, 1.083906, 0.9372549, 0, 1, 1,
1.042465, 0.0909298, 2.319966, 0.945098, 0, 1, 1,
1.045352, 0.8655813, -1.186061, 0.9490196, 0, 1, 1,
1.052892, -1.149551, 2.183873, 0.9568627, 0, 1, 1,
1.055331, -1.082898, 3.608373, 0.9607843, 0, 1, 1,
1.057836, 0.1707838, 0.716629, 0.9686275, 0, 1, 1,
1.061025, 0.5886514, 0.1261483, 0.972549, 0, 1, 1,
1.0635, 0.4189832, 0.4012869, 0.9803922, 0, 1, 1,
1.063882, 0.8132376, 0.8231543, 0.9843137, 0, 1, 1,
1.070157, 0.7093526, 0.1432179, 0.9921569, 0, 1, 1,
1.076238, 0.2654084, -1.319297, 0.9960784, 0, 1, 1,
1.083158, -0.6543964, -0.4366545, 1, 0, 0.9960784, 1,
1.085694, -0.485977, 0.9481997, 1, 0, 0.9882353, 1,
1.08872, -0.4019306, 1.480242, 1, 0, 0.9843137, 1,
1.090662, 0.9639603, 1.3254, 1, 0, 0.9764706, 1,
1.10097, -1.592726, 2.168836, 1, 0, 0.972549, 1,
1.106222, -0.6359823, 2.007931, 1, 0, 0.9647059, 1,
1.110327, 0.07243104, 1.604475, 1, 0, 0.9607843, 1,
1.112462, 0.7120565, 2.208398, 1, 0, 0.9529412, 1,
1.121722, -0.4311164, 2.842252, 1, 0, 0.9490196, 1,
1.127379, -0.8688552, 1.917491, 1, 0, 0.9411765, 1,
1.127894, -0.4964456, 0.5850719, 1, 0, 0.9372549, 1,
1.128979, -0.3430862, 2.20725, 1, 0, 0.9294118, 1,
1.132159, 0.8804916, 0.2794676, 1, 0, 0.9254902, 1,
1.133343, 0.06340435, 2.095758, 1, 0, 0.9176471, 1,
1.135698, 1.039846, 2.48272, 1, 0, 0.9137255, 1,
1.135955, 0.06655596, 1.654989, 1, 0, 0.9058824, 1,
1.143349, 0.2191975, 1.64515, 1, 0, 0.9019608, 1,
1.147487, 0.7912965, 0.3874744, 1, 0, 0.8941177, 1,
1.152368, -0.3420881, 0.8674957, 1, 0, 0.8862745, 1,
1.159079, 0.4016418, 1.314994, 1, 0, 0.8823529, 1,
1.171601, -0.2982536, 0.4118718, 1, 0, 0.8745098, 1,
1.172323, 1.069933, -0.4545646, 1, 0, 0.8705882, 1,
1.172709, 1.201017, -0.1170279, 1, 0, 0.8627451, 1,
1.178871, -0.775084, 0.8070873, 1, 0, 0.8588235, 1,
1.1796, -1.564107, 2.076291, 1, 0, 0.8509804, 1,
1.189131, -2.819636, 3.485678, 1, 0, 0.8470588, 1,
1.189312, 1.382862, 0.1895084, 1, 0, 0.8392157, 1,
1.196954, 1.826464, 1.353882, 1, 0, 0.8352941, 1,
1.199495, 0.1797525, 0.5281968, 1, 0, 0.827451, 1,
1.204545, -0.1275468, 1.761968, 1, 0, 0.8235294, 1,
1.206596, -0.07730795, 1.867822, 1, 0, 0.8156863, 1,
1.212568, -0.4381582, 3.085204, 1, 0, 0.8117647, 1,
1.220873, 1.013849, 0.6940666, 1, 0, 0.8039216, 1,
1.221559, 1.086301, 1.048214, 1, 0, 0.7960784, 1,
1.222635, 1.147904, 0.1584715, 1, 0, 0.7921569, 1,
1.230135, 0.8568565, 1.205786, 1, 0, 0.7843137, 1,
1.233992, 0.6334775, 2.210241, 1, 0, 0.7803922, 1,
1.239908, 1.071183, 1.017078, 1, 0, 0.772549, 1,
1.259146, 0.3239191, 1.103266, 1, 0, 0.7686275, 1,
1.260288, -1.00729, 3.598105, 1, 0, 0.7607843, 1,
1.268692, -0.3925138, 1.552752, 1, 0, 0.7568628, 1,
1.274158, 1.903983, -0.5990022, 1, 0, 0.7490196, 1,
1.277755, 0.2976556, 1.187661, 1, 0, 0.7450981, 1,
1.278605, -2.030894, 2.912156, 1, 0, 0.7372549, 1,
1.284129, -0.2639264, 1.31998, 1, 0, 0.7333333, 1,
1.286935, -0.1974577, 1.946306, 1, 0, 0.7254902, 1,
1.290614, 2.434396, 1.538008, 1, 0, 0.7215686, 1,
1.300231, 1.236386, -0.521089, 1, 0, 0.7137255, 1,
1.302122, -1.59259, 1.626806, 1, 0, 0.7098039, 1,
1.316415, 0.2426779, -0.07460344, 1, 0, 0.7019608, 1,
1.317551, -0.5911973, 0.01598661, 1, 0, 0.6941177, 1,
1.317652, -0.6410098, 1.104418, 1, 0, 0.6901961, 1,
1.329642, -0.5639074, 1.402097, 1, 0, 0.682353, 1,
1.339303, -0.508114, 0.9249088, 1, 0, 0.6784314, 1,
1.342451, 0.410518, 0.6337206, 1, 0, 0.6705883, 1,
1.364539, -0.2786532, 1.723728, 1, 0, 0.6666667, 1,
1.372592, -0.2139825, 1.838942, 1, 0, 0.6588235, 1,
1.373668, -0.3466833, 2.995516, 1, 0, 0.654902, 1,
1.376763, -0.4576856, 2.064696, 1, 0, 0.6470588, 1,
1.389369, -1.476643, 2.277022, 1, 0, 0.6431373, 1,
1.399295, -0.5138545, 2.662924, 1, 0, 0.6352941, 1,
1.404108, -0.4311553, 1.746303, 1, 0, 0.6313726, 1,
1.41615, -0.1764003, 1.326263, 1, 0, 0.6235294, 1,
1.416399, -0.8584269, 2.856616, 1, 0, 0.6196079, 1,
1.42284, -0.5459, 2.414117, 1, 0, 0.6117647, 1,
1.440585, -0.3976176, 1.345146, 1, 0, 0.6078432, 1,
1.442995, -1.150372, 2.999808, 1, 0, 0.6, 1,
1.44941, -0.2885676, 2.195644, 1, 0, 0.5921569, 1,
1.452694, 1.526639, 0.8346053, 1, 0, 0.5882353, 1,
1.455764, 1.750821, 0.4852904, 1, 0, 0.5803922, 1,
1.459717, -0.9915538, 1.398467, 1, 0, 0.5764706, 1,
1.477941, -0.2120295, 2.846562, 1, 0, 0.5686275, 1,
1.47987, -1.107108, 3.313389, 1, 0, 0.5647059, 1,
1.482779, 0.2571736, 1.330783, 1, 0, 0.5568628, 1,
1.485819, -1.189247, 1.994248, 1, 0, 0.5529412, 1,
1.489616, 0.5118669, 2.324854, 1, 0, 0.5450981, 1,
1.494279, -0.297412, 0.7514679, 1, 0, 0.5411765, 1,
1.496212, 0.4255038, 1.140119, 1, 0, 0.5333334, 1,
1.498769, 0.3194593, 0.0607726, 1, 0, 0.5294118, 1,
1.502026, 0.0251112, 1.574946, 1, 0, 0.5215687, 1,
1.508078, 0.8274105, -0.5154495, 1, 0, 0.5176471, 1,
1.514676, 0.4907651, 1.804634, 1, 0, 0.509804, 1,
1.525124, 0.1607164, 1.531492, 1, 0, 0.5058824, 1,
1.540021, -0.7354983, 1.184116, 1, 0, 0.4980392, 1,
1.543874, 0.736156, 0.3395926, 1, 0, 0.4901961, 1,
1.555713, 0.2668046, 2.166268, 1, 0, 0.4862745, 1,
1.560876, -0.9521477, 2.242856, 1, 0, 0.4784314, 1,
1.564368, -0.5540707, 2.557118, 1, 0, 0.4745098, 1,
1.567973, 0.09657304, 3.52548, 1, 0, 0.4666667, 1,
1.569755, 0.09002705, 1.1854, 1, 0, 0.4627451, 1,
1.588158, 1.044909, 1.415637, 1, 0, 0.454902, 1,
1.602983, -0.006838844, 0.1643767, 1, 0, 0.4509804, 1,
1.606876, 0.7012443, -0.5619643, 1, 0, 0.4431373, 1,
1.64872, -0.2146842, 2.384576, 1, 0, 0.4392157, 1,
1.663123, 1.381928, 0.4831043, 1, 0, 0.4313726, 1,
1.671369, -0.8060049, 2.615562, 1, 0, 0.427451, 1,
1.676244, 0.8638314, 0.2441314, 1, 0, 0.4196078, 1,
1.680362, 0.4459116, 1.631718, 1, 0, 0.4156863, 1,
1.694007, -1.456327, 2.243247, 1, 0, 0.4078431, 1,
1.694264, -0.1024259, 0.5550699, 1, 0, 0.4039216, 1,
1.696154, 0.5223678, 1.617769, 1, 0, 0.3960784, 1,
1.699923, -2.150463, 1.645084, 1, 0, 0.3882353, 1,
1.701963, 0.7782239, 1.237693, 1, 0, 0.3843137, 1,
1.706091, 0.9093034, 1.306812, 1, 0, 0.3764706, 1,
1.718004, 0.1963783, 0.6874819, 1, 0, 0.372549, 1,
1.730649, 0.6340573, 1.618746, 1, 0, 0.3647059, 1,
1.744573, 0.7559462, 0.4177153, 1, 0, 0.3607843, 1,
1.744699, 0.1409228, 3.267058, 1, 0, 0.3529412, 1,
1.74618, -0.6235838, 1.660292, 1, 0, 0.3490196, 1,
1.752492, 0.4130878, 1.411904, 1, 0, 0.3411765, 1,
1.763332, 0.4990451, 0.7079976, 1, 0, 0.3372549, 1,
1.766414, -0.04863165, 1.225259, 1, 0, 0.3294118, 1,
1.773616, 0.1942363, 0.2697622, 1, 0, 0.3254902, 1,
1.779685, -1.234558, 0.7719268, 1, 0, 0.3176471, 1,
1.782553, -0.9271, 2.62234, 1, 0, 0.3137255, 1,
1.785175, -0.186758, 2.85421, 1, 0, 0.3058824, 1,
1.794206, 0.1441352, 1.593923, 1, 0, 0.2980392, 1,
1.797419, 0.8095864, 2.388911, 1, 0, 0.2941177, 1,
1.801608, 0.06663073, -0.6111742, 1, 0, 0.2862745, 1,
1.80494, 0.2396566, 0.3162405, 1, 0, 0.282353, 1,
1.815786, 1.040094, 0.8717848, 1, 0, 0.2745098, 1,
1.81939, -0.1674913, 0.4943221, 1, 0, 0.2705882, 1,
1.831157, -2.387444, 4.098221, 1, 0, 0.2627451, 1,
1.838663, 0.03798087, 2.232934, 1, 0, 0.2588235, 1,
1.839848, -2.275679, 2.966885, 1, 0, 0.2509804, 1,
1.895164, -0.2171639, 3.89094, 1, 0, 0.2470588, 1,
1.896457, 0.8377743, 1.353546, 1, 0, 0.2392157, 1,
1.89767, 0.2676546, 1.630143, 1, 0, 0.2352941, 1,
1.911471, -1.764905, 3.097515, 1, 0, 0.227451, 1,
1.918385, -0.6220534, 0.4694515, 1, 0, 0.2235294, 1,
1.919992, 0.6997725, 2.389432, 1, 0, 0.2156863, 1,
1.930241, -0.6235813, 2.403358, 1, 0, 0.2117647, 1,
1.939525, -1.26323, 3.19034, 1, 0, 0.2039216, 1,
1.964645, 0.1422712, 1.683248, 1, 0, 0.1960784, 1,
1.982734, 1.886842, 1.696929, 1, 0, 0.1921569, 1,
1.984612, -1.368955, 2.069162, 1, 0, 0.1843137, 1,
1.99531, -0.8384172, 3.310268, 1, 0, 0.1803922, 1,
2.009208, -0.6464021, 0.4642168, 1, 0, 0.172549, 1,
2.01097, -0.2637025, -0.3679709, 1, 0, 0.1686275, 1,
2.017674, -0.4647471, -0.1528341, 1, 0, 0.1607843, 1,
2.023265, 0.6353108, 0.6778434, 1, 0, 0.1568628, 1,
2.191811, -0.2116494, 3.076957, 1, 0, 0.1490196, 1,
2.207365, -0.745736, 2.46413, 1, 0, 0.145098, 1,
2.262508, -0.01804985, 2.739461, 1, 0, 0.1372549, 1,
2.278414, 1.305165, 2.053989, 1, 0, 0.1333333, 1,
2.291214, 2.208025, 0.5338324, 1, 0, 0.1254902, 1,
2.322567, -1.314355, 0.353771, 1, 0, 0.1215686, 1,
2.333182, -2.248978, 2.474686, 1, 0, 0.1137255, 1,
2.342726, 1.01289, 1.063189, 1, 0, 0.1098039, 1,
2.377184, -0.9899627, 2.451443, 1, 0, 0.1019608, 1,
2.396641, -0.9514086, 3.437016, 1, 0, 0.09411765, 1,
2.398311, -1.32728, 2.388638, 1, 0, 0.09019608, 1,
2.404027, 0.05779994, 0.6783, 1, 0, 0.08235294, 1,
2.419334, 0.6105394, 2.449761, 1, 0, 0.07843138, 1,
2.420844, 2.229373, 0.684091, 1, 0, 0.07058824, 1,
2.444393, 0.4725, 1.16214, 1, 0, 0.06666667, 1,
2.453851, 1.500857, 2.36679, 1, 0, 0.05882353, 1,
2.477517, -1.256107, 1.921308, 1, 0, 0.05490196, 1,
2.508915, 0.5450982, -1.477992, 1, 0, 0.04705882, 1,
2.562542, 0.7055343, 0.6490466, 1, 0, 0.04313726, 1,
2.658853, 0.3365078, 2.429907, 1, 0, 0.03529412, 1,
2.683777, 2.035854, -0.1943173, 1, 0, 0.03137255, 1,
2.857116, -0.5043679, 1.754565, 1, 0, 0.02352941, 1,
3.077859, 0.7437229, -0.4526584, 1, 0, 0.01960784, 1,
3.265347, -0.1379872, 2.278896, 1, 0, 0.01176471, 1,
4.092828, -0.7463307, 1.322203, 1, 0, 0.007843138, 1
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
0.3931699, -4.575064, -6.899051, 0, -0.5, 0.5, 0.5,
0.3931699, -4.575064, -6.899051, 1, -0.5, 0.5, 0.5,
0.3931699, -4.575064, -6.899051, 1, 1.5, 0.5, 0.5,
0.3931699, -4.575064, -6.899051, 0, 1.5, 0.5, 0.5
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
-4.560673, -0.1913236, -6.899051, 0, -0.5, 0.5, 0.5,
-4.560673, -0.1913236, -6.899051, 1, -0.5, 0.5, 0.5,
-4.560673, -0.1913236, -6.899051, 1, 1.5, 0.5, 0.5,
-4.560673, -0.1913236, -6.899051, 0, 1.5, 0.5, 0.5
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
-4.560673, -4.575064, -0.1040645, 0, -0.5, 0.5, 0.5,
-4.560673, -4.575064, -0.1040645, 1, -0.5, 0.5, 0.5,
-4.560673, -4.575064, -0.1040645, 1, 1.5, 0.5, 0.5,
-4.560673, -4.575064, -0.1040645, 0, 1.5, 0.5, 0.5
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
-2, -3.563432, -5.330977,
4, -3.563432, -5.330977,
-2, -3.563432, -5.330977,
-2, -3.732037, -5.592322,
0, -3.563432, -5.330977,
0, -3.732037, -5.592322,
2, -3.563432, -5.330977,
2, -3.732037, -5.592322,
4, -3.563432, -5.330977,
4, -3.732037, -5.592322
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
-2, -4.069248, -6.115014, 0, -0.5, 0.5, 0.5,
-2, -4.069248, -6.115014, 1, -0.5, 0.5, 0.5,
-2, -4.069248, -6.115014, 1, 1.5, 0.5, 0.5,
-2, -4.069248, -6.115014, 0, 1.5, 0.5, 0.5,
0, -4.069248, -6.115014, 0, -0.5, 0.5, 0.5,
0, -4.069248, -6.115014, 1, -0.5, 0.5, 0.5,
0, -4.069248, -6.115014, 1, 1.5, 0.5, 0.5,
0, -4.069248, -6.115014, 0, 1.5, 0.5, 0.5,
2, -4.069248, -6.115014, 0, -0.5, 0.5, 0.5,
2, -4.069248, -6.115014, 1, -0.5, 0.5, 0.5,
2, -4.069248, -6.115014, 1, 1.5, 0.5, 0.5,
2, -4.069248, -6.115014, 0, 1.5, 0.5, 0.5,
4, -4.069248, -6.115014, 0, -0.5, 0.5, 0.5,
4, -4.069248, -6.115014, 1, -0.5, 0.5, 0.5,
4, -4.069248, -6.115014, 1, 1.5, 0.5, 0.5,
4, -4.069248, -6.115014, 0, 1.5, 0.5, 0.5
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
-3.417478, -3, -5.330977,
-3.417478, 3, -5.330977,
-3.417478, -3, -5.330977,
-3.608011, -3, -5.592322,
-3.417478, -2, -5.330977,
-3.608011, -2, -5.592322,
-3.417478, -1, -5.330977,
-3.608011, -1, -5.592322,
-3.417478, 0, -5.330977,
-3.608011, 0, -5.592322,
-3.417478, 1, -5.330977,
-3.608011, 1, -5.592322,
-3.417478, 2, -5.330977,
-3.608011, 2, -5.592322,
-3.417478, 3, -5.330977,
-3.608011, 3, -5.592322
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
-3.989075, -3, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, -3, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, -3, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, -3, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, -2, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, -2, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, -2, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, -2, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, -1, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, -1, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, -1, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, -1, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, 0, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, 0, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, 0, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, 0, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, 1, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, 1, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, 1, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, 1, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, 2, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, 2, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, 2, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, 2, -6.115014, 0, 1.5, 0.5, 0.5,
-3.989075, 3, -6.115014, 0, -0.5, 0.5, 0.5,
-3.989075, 3, -6.115014, 1, -0.5, 0.5, 0.5,
-3.989075, 3, -6.115014, 1, 1.5, 0.5, 0.5,
-3.989075, 3, -6.115014, 0, 1.5, 0.5, 0.5
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
-3.417478, -3.563432, -4,
-3.417478, -3.563432, 4,
-3.417478, -3.563432, -4,
-3.608011, -3.732037, -4,
-3.417478, -3.563432, -2,
-3.608011, -3.732037, -2,
-3.417478, -3.563432, 0,
-3.608011, -3.732037, 0,
-3.417478, -3.563432, 2,
-3.608011, -3.732037, 2,
-3.417478, -3.563432, 4,
-3.608011, -3.732037, 4
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
-3.989075, -4.069248, -4, 0, -0.5, 0.5, 0.5,
-3.989075, -4.069248, -4, 1, -0.5, 0.5, 0.5,
-3.989075, -4.069248, -4, 1, 1.5, 0.5, 0.5,
-3.989075, -4.069248, -4, 0, 1.5, 0.5, 0.5,
-3.989075, -4.069248, -2, 0, -0.5, 0.5, 0.5,
-3.989075, -4.069248, -2, 1, -0.5, 0.5, 0.5,
-3.989075, -4.069248, -2, 1, 1.5, 0.5, 0.5,
-3.989075, -4.069248, -2, 0, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 0, 0, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 0, 1, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 0, 1, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 0, 0, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 2, 0, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 2, 1, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 2, 1, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 2, 0, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 4, 0, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 4, 1, -0.5, 0.5, 0.5,
-3.989075, -4.069248, 4, 1, 1.5, 0.5, 0.5,
-3.989075, -4.069248, 4, 0, 1.5, 0.5, 0.5
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
-3.417478, -3.563432, -5.330977,
-3.417478, 3.180784, -5.330977,
-3.417478, -3.563432, 5.122848,
-3.417478, 3.180784, 5.122848,
-3.417478, -3.563432, -5.330977,
-3.417478, -3.563432, 5.122848,
-3.417478, 3.180784, -5.330977,
-3.417478, 3.180784, 5.122848,
-3.417478, -3.563432, -5.330977,
4.203818, -3.563432, -5.330977,
-3.417478, -3.563432, 5.122848,
4.203818, -3.563432, 5.122848,
-3.417478, 3.180784, -5.330977,
4.203818, 3.180784, -5.330977,
-3.417478, 3.180784, 5.122848,
4.203818, 3.180784, 5.122848,
4.203818, -3.563432, -5.330977,
4.203818, 3.180784, -5.330977,
4.203818, -3.563432, 5.122848,
4.203818, 3.180784, 5.122848,
4.203818, -3.563432, -5.330977,
4.203818, -3.563432, 5.122848,
4.203818, 3.180784, -5.330977,
4.203818, 3.180784, 5.122848
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
var radius = 7.790465;
var distance = 34.66066;
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
mvMatrix.translate( -0.3931699, 0.1913236, 0.1040645 );
mvMatrix.scale( 1.105219, 1.248952, 0.8057532 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66066);
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


