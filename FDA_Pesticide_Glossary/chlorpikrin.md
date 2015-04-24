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
-2.908252, -0.6301932, -0.8137735, 1, 0, 0, 1,
-2.754226, -0.9909654, -1.791717, 1, 0.007843138, 0, 1,
-2.75294, 1.708974, 0.5173969, 1, 0.01176471, 0, 1,
-2.659075, 0.1357676, 0.3189811, 1, 0.01960784, 0, 1,
-2.645138, 1.578527, -1.532653, 1, 0.02352941, 0, 1,
-2.531537, -0.02600181, -2.066253, 1, 0.03137255, 0, 1,
-2.520532, 1.108872, -2.030199, 1, 0.03529412, 0, 1,
-2.406909, 1.588345, -2.408517, 1, 0.04313726, 0, 1,
-2.362297, -0.09958568, -1.507527, 1, 0.04705882, 0, 1,
-2.357565, -0.7474657, -1.630801, 1, 0.05490196, 0, 1,
-2.198933, -1.099732, -0.06729182, 1, 0.05882353, 0, 1,
-2.180401, 0.5895804, -0.7843814, 1, 0.06666667, 0, 1,
-2.173405, -0.1474037, -0.9150104, 1, 0.07058824, 0, 1,
-2.150481, -1.493883, -2.863076, 1, 0.07843138, 0, 1,
-2.092422, -0.7497678, -1.054846, 1, 0.08235294, 0, 1,
-2.075961, -0.07548524, -0.6418555, 1, 0.09019608, 0, 1,
-2.018025, 1.056786, -0.8089523, 1, 0.09411765, 0, 1,
-2.005148, -0.3228263, -1.239174, 1, 0.1019608, 0, 1,
-1.999009, 0.03349691, 0.361924, 1, 0.1098039, 0, 1,
-1.986494, -2.063776, -2.996973, 1, 0.1137255, 0, 1,
-1.976301, 1.09547, 1.007857, 1, 0.1215686, 0, 1,
-1.966498, 1.3083, -0.5469578, 1, 0.1254902, 0, 1,
-1.941055, 0.6003823, -0.4779369, 1, 0.1333333, 0, 1,
-1.88681, -0.3581992, -1.915169, 1, 0.1372549, 0, 1,
-1.870346, 0.3103145, -1.510026, 1, 0.145098, 0, 1,
-1.842216, 0.6391103, 0.1743874, 1, 0.1490196, 0, 1,
-1.833615, 1.548354, -0.6308362, 1, 0.1568628, 0, 1,
-1.828303, 0.5842853, -0.1375801, 1, 0.1607843, 0, 1,
-1.815299, 1.626087, -0.7468632, 1, 0.1686275, 0, 1,
-1.80766, -1.196817, -1.145534, 1, 0.172549, 0, 1,
-1.806367, -0.4694646, -3.600475, 1, 0.1803922, 0, 1,
-1.780442, -0.6311596, -1.860774, 1, 0.1843137, 0, 1,
-1.77593, 0.08413879, -0.3698641, 1, 0.1921569, 0, 1,
-1.772007, -0.6052913, -1.063596, 1, 0.1960784, 0, 1,
-1.768339, 1.169489, -1.118328, 1, 0.2039216, 0, 1,
-1.767956, -0.3611083, -1.357078, 1, 0.2117647, 0, 1,
-1.737049, 1.059564, 0.5592103, 1, 0.2156863, 0, 1,
-1.726316, 0.1364027, -0.3236621, 1, 0.2235294, 0, 1,
-1.711236, 1.051104, 0.05072593, 1, 0.227451, 0, 1,
-1.701946, -0.107984, -1.484032, 1, 0.2352941, 0, 1,
-1.700685, 0.1734882, -1.102961, 1, 0.2392157, 0, 1,
-1.691148, -1.420901, -2.035769, 1, 0.2470588, 0, 1,
-1.681449, 0.6603171, -1.783692, 1, 0.2509804, 0, 1,
-1.674871, -0.003899504, -1.117825, 1, 0.2588235, 0, 1,
-1.662124, -1.011515, -2.628736, 1, 0.2627451, 0, 1,
-1.654805, 0.3326386, -0.433359, 1, 0.2705882, 0, 1,
-1.653864, -0.5965835, -1.990862, 1, 0.2745098, 0, 1,
-1.644612, 2.334026, -3.731456, 1, 0.282353, 0, 1,
-1.635645, -0.3372354, -0.6120082, 1, 0.2862745, 0, 1,
-1.610788, -0.3391169, -2.813743, 1, 0.2941177, 0, 1,
-1.608868, -0.9495092, -1.790534, 1, 0.3019608, 0, 1,
-1.607956, -2.413638, -3.01282, 1, 0.3058824, 0, 1,
-1.60745, 0.1792507, 0.09022777, 1, 0.3137255, 0, 1,
-1.598367, 1.708789, 1.557976, 1, 0.3176471, 0, 1,
-1.594097, 0.9411052, -1.330826, 1, 0.3254902, 0, 1,
-1.590041, 0.3079825, -3.991269, 1, 0.3294118, 0, 1,
-1.58621, -1.284193, -2.12416, 1, 0.3372549, 0, 1,
-1.575388, -0.01131132, -2.286638, 1, 0.3411765, 0, 1,
-1.573188, -1.438531, -1.787473, 1, 0.3490196, 0, 1,
-1.570552, 0.1705118, -1.807345, 1, 0.3529412, 0, 1,
-1.568951, 2.32163, -0.01342423, 1, 0.3607843, 0, 1,
-1.565343, 1.259104, -1.036448, 1, 0.3647059, 0, 1,
-1.549477, -0.7430198, -2.863061, 1, 0.372549, 0, 1,
-1.536801, 0.6248152, -2.489277, 1, 0.3764706, 0, 1,
-1.525192, 0.5426826, -1.861425, 1, 0.3843137, 0, 1,
-1.518034, -0.04202525, -2.895104, 1, 0.3882353, 0, 1,
-1.507609, 0.8513532, -0.6994185, 1, 0.3960784, 0, 1,
-1.502106, 0.6891826, -2.579431, 1, 0.4039216, 0, 1,
-1.501709, -0.1536901, -3.935768, 1, 0.4078431, 0, 1,
-1.500701, 0.9619954, -1.804049, 1, 0.4156863, 0, 1,
-1.498222, 0.5313502, -2.048953, 1, 0.4196078, 0, 1,
-1.485974, -0.04565573, -0.9322045, 1, 0.427451, 0, 1,
-1.477432, 0.7988704, -1.043389, 1, 0.4313726, 0, 1,
-1.451353, -0.9239162, -2.870531, 1, 0.4392157, 0, 1,
-1.437021, 2.092656, -1.820535, 1, 0.4431373, 0, 1,
-1.43425, 1.516807, -3.241042, 1, 0.4509804, 0, 1,
-1.418655, -0.2385157, -2.636369, 1, 0.454902, 0, 1,
-1.414682, -1.317436, -0.4982467, 1, 0.4627451, 0, 1,
-1.414457, -0.4389989, -2.80875, 1, 0.4666667, 0, 1,
-1.392918, 1.391738, -1.967196, 1, 0.4745098, 0, 1,
-1.392621, 1.071924, -1.475197, 1, 0.4784314, 0, 1,
-1.388777, -0.637957, -1.016583, 1, 0.4862745, 0, 1,
-1.388456, 0.6562414, 0.8651366, 1, 0.4901961, 0, 1,
-1.379697, 1.019832, -1.217666, 1, 0.4980392, 0, 1,
-1.351554, -0.6731803, -2.166896, 1, 0.5058824, 0, 1,
-1.349325, 2.767926, -0.3178479, 1, 0.509804, 0, 1,
-1.337467, -0.299389, -0.3383289, 1, 0.5176471, 0, 1,
-1.330793, 0.4329154, -2.023844, 1, 0.5215687, 0, 1,
-1.329401, 0.120086, -1.736079, 1, 0.5294118, 0, 1,
-1.314995, 0.2139429, -2.606854, 1, 0.5333334, 0, 1,
-1.312047, 0.04205306, -1.76784, 1, 0.5411765, 0, 1,
-1.307348, -0.7932705, -1.285676, 1, 0.5450981, 0, 1,
-1.297876, 0.7021858, -0.7391351, 1, 0.5529412, 0, 1,
-1.295076, -1.027103, -1.839129, 1, 0.5568628, 0, 1,
-1.290679, -0.2571169, -0.9552869, 1, 0.5647059, 0, 1,
-1.289801, -0.5995188, -0.6988289, 1, 0.5686275, 0, 1,
-1.284888, -0.26416, -1.501318, 1, 0.5764706, 0, 1,
-1.284428, -0.8495484, -3.965185, 1, 0.5803922, 0, 1,
-1.275912, -0.4834158, -1.213798, 1, 0.5882353, 0, 1,
-1.274462, -0.2169536, -0.3460592, 1, 0.5921569, 0, 1,
-1.270657, 1.106133, 0.658816, 1, 0.6, 0, 1,
-1.26842, 0.130799, 0.01082623, 1, 0.6078432, 0, 1,
-1.266477, -0.950938, -0.7885284, 1, 0.6117647, 0, 1,
-1.263479, 0.1379166, -2.267763, 1, 0.6196079, 0, 1,
-1.26036, 1.219853, -1.748415, 1, 0.6235294, 0, 1,
-1.256964, 0.02377775, -0.7014518, 1, 0.6313726, 0, 1,
-1.25387, 0.3820055, -1.499778, 1, 0.6352941, 0, 1,
-1.251894, -0.9784089, -2.51056, 1, 0.6431373, 0, 1,
-1.247092, 0.9949743, 0.2089472, 1, 0.6470588, 0, 1,
-1.238142, 0.4226602, -1.794316, 1, 0.654902, 0, 1,
-1.228831, 1.539464, -1.909037, 1, 0.6588235, 0, 1,
-1.22082, -1.089307, -4.017512, 1, 0.6666667, 0, 1,
-1.198734, -0.9236041, -3.395834, 1, 0.6705883, 0, 1,
-1.196048, -1.309833, -2.375681, 1, 0.6784314, 0, 1,
-1.195255, 0.4639536, -0.2836326, 1, 0.682353, 0, 1,
-1.193196, 1.470856, -1.537907, 1, 0.6901961, 0, 1,
-1.187046, 1.838722, 0.2197719, 1, 0.6941177, 0, 1,
-1.178334, -1.494681, -3.179688, 1, 0.7019608, 0, 1,
-1.172387, -0.4140959, -2.76608, 1, 0.7098039, 0, 1,
-1.171802, -1.943953, -1.859568, 1, 0.7137255, 0, 1,
-1.169562, -0.4958559, -2.258108, 1, 0.7215686, 0, 1,
-1.162843, -0.442626, -0.6838219, 1, 0.7254902, 0, 1,
-1.161838, -0.48667, -2.22583, 1, 0.7333333, 0, 1,
-1.151417, 0.1664989, -0.8425978, 1, 0.7372549, 0, 1,
-1.150908, 0.8832195, 0.05264414, 1, 0.7450981, 0, 1,
-1.149801, 0.5451032, -0.138264, 1, 0.7490196, 0, 1,
-1.144746, 1.454483, -0.1130304, 1, 0.7568628, 0, 1,
-1.142572, -0.8257194, -3.214454, 1, 0.7607843, 0, 1,
-1.135082, 0.5482688, -2.538229, 1, 0.7686275, 0, 1,
-1.134347, -0.3180167, -0.2531041, 1, 0.772549, 0, 1,
-1.13312, 1.189548, -0.3550731, 1, 0.7803922, 0, 1,
-1.124612, -0.7846779, -3.246554, 1, 0.7843137, 0, 1,
-1.124176, 0.6479099, -0.1400221, 1, 0.7921569, 0, 1,
-1.123754, -0.8181766, -2.633604, 1, 0.7960784, 0, 1,
-1.120777, -1.747236, -0.7239281, 1, 0.8039216, 0, 1,
-1.118623, -0.3476478, -2.521449, 1, 0.8117647, 0, 1,
-1.11786, 0.4104492, -1.306046, 1, 0.8156863, 0, 1,
-1.109813, 0.7826363, -2.383152, 1, 0.8235294, 0, 1,
-1.096889, 0.3580812, -1.715873, 1, 0.827451, 0, 1,
-1.096702, 0.6317701, -1.899252, 1, 0.8352941, 0, 1,
-1.091325, -1.57238, -3.039228, 1, 0.8392157, 0, 1,
-1.082195, -1.147237, -1.933595, 1, 0.8470588, 0, 1,
-1.068666, 0.6587291, -0.1565448, 1, 0.8509804, 0, 1,
-1.068258, -0.1351534, -0.5476227, 1, 0.8588235, 0, 1,
-1.064295, 0.2832654, -1.520733, 1, 0.8627451, 0, 1,
-1.055652, -0.967849, -2.424664, 1, 0.8705882, 0, 1,
-1.054325, 1.791875, -0.8278504, 1, 0.8745098, 0, 1,
-1.052945, 1.490881, -0.05861917, 1, 0.8823529, 0, 1,
-1.052436, 0.2650009, -1.088263, 1, 0.8862745, 0, 1,
-1.050827, 1.304946, 0.6462827, 1, 0.8941177, 0, 1,
-1.050701, -0.0543685, -2.470243, 1, 0.8980392, 0, 1,
-1.047754, -1.360888, -3.24115, 1, 0.9058824, 0, 1,
-1.046825, -1.523958, -1.890032, 1, 0.9137255, 0, 1,
-1.039785, -1.176861, -2.967134, 1, 0.9176471, 0, 1,
-1.033808, 1.196471, -1.069019, 1, 0.9254902, 0, 1,
-1.032368, 0.07898249, -2.75141, 1, 0.9294118, 0, 1,
-1.027444, -0.2290825, -2.374302, 1, 0.9372549, 0, 1,
-1.024584, 1.264214, 0.3006955, 1, 0.9411765, 0, 1,
-1.023185, 0.2522485, -1.525844, 1, 0.9490196, 0, 1,
-1.019843, 0.2471156, -0.5539691, 1, 0.9529412, 0, 1,
-1.01791, -0.6388588, -1.554425, 1, 0.9607843, 0, 1,
-1.016507, 0.5721232, -0.3599967, 1, 0.9647059, 0, 1,
-1.014038, -0.3107246, -1.194674, 1, 0.972549, 0, 1,
-1.011897, -0.1338452, -1.365163, 1, 0.9764706, 0, 1,
-1.011494, -0.2088951, -2.493528, 1, 0.9843137, 0, 1,
-1.008558, -1.129492, -2.047272, 1, 0.9882353, 0, 1,
-1.00318, -0.2261458, -3.859541, 1, 0.9960784, 0, 1,
-1.00042, 1.228233, -0.3010875, 0.9960784, 1, 0, 1,
-0.9961997, 0.8950451, -0.7121792, 0.9921569, 1, 0, 1,
-0.9950508, -0.4736361, -2.490948, 0.9843137, 1, 0, 1,
-0.9886286, 0.2099341, -2.300957, 0.9803922, 1, 0, 1,
-0.9723062, 1.030711, -1.421282, 0.972549, 1, 0, 1,
-0.9703563, 0.3742703, 0.2097299, 0.9686275, 1, 0, 1,
-0.965753, -0.3069736, -4.002131, 0.9607843, 1, 0, 1,
-0.9620575, 0.2915154, -3.267948, 0.9568627, 1, 0, 1,
-0.9610848, -0.37401, -2.689533, 0.9490196, 1, 0, 1,
-0.9564376, 0.9106521, 0.8716577, 0.945098, 1, 0, 1,
-0.9466925, 0.4115808, -0.722048, 0.9372549, 1, 0, 1,
-0.9439288, -0.7227944, -1.780624, 0.9333333, 1, 0, 1,
-0.9380125, -2.366248, -2.005756, 0.9254902, 1, 0, 1,
-0.935106, 0.3740298, -0.7251256, 0.9215686, 1, 0, 1,
-0.9350752, -0.2752702, -2.325749, 0.9137255, 1, 0, 1,
-0.9304315, -0.3606134, -2.402266, 0.9098039, 1, 0, 1,
-0.9286339, 0.1762096, -1.163386, 0.9019608, 1, 0, 1,
-0.9248943, 1.157783, -2.982935, 0.8941177, 1, 0, 1,
-0.9243568, -0.942387, -3.00034, 0.8901961, 1, 0, 1,
-0.9208531, 1.918699, 0.2130133, 0.8823529, 1, 0, 1,
-0.9138586, -0.4098099, -3.286739, 0.8784314, 1, 0, 1,
-0.9126749, -0.2420192, -3.699366, 0.8705882, 1, 0, 1,
-0.9090382, 0.6819423, -1.531744, 0.8666667, 1, 0, 1,
-0.9069334, -0.1053531, -2.710698, 0.8588235, 1, 0, 1,
-0.9068493, 0.9500597, -2.184922, 0.854902, 1, 0, 1,
-0.9066908, 0.02081479, -1.64405, 0.8470588, 1, 0, 1,
-0.9062349, 1.280112, -1.894368, 0.8431373, 1, 0, 1,
-0.9026269, 0.6734617, -2.807876, 0.8352941, 1, 0, 1,
-0.8969309, -0.3637523, 0.7467641, 0.8313726, 1, 0, 1,
-0.896191, -0.9954678, -1.724491, 0.8235294, 1, 0, 1,
-0.8924863, 0.05663934, -1.361453, 0.8196079, 1, 0, 1,
-0.8890173, -1.570098, -2.318675, 0.8117647, 1, 0, 1,
-0.8883188, -0.8285156, -3.458379, 0.8078431, 1, 0, 1,
-0.8875918, -1.002787, -1.812952, 0.8, 1, 0, 1,
-0.88627, 1.03126, 0.2450823, 0.7921569, 1, 0, 1,
-0.8858042, 1.360823, -0.3408743, 0.7882353, 1, 0, 1,
-0.8839041, -0.5373768, -3.100158, 0.7803922, 1, 0, 1,
-0.8753456, -0.1789204, -2.884939, 0.7764706, 1, 0, 1,
-0.8718197, -2.917528, -3.51919, 0.7686275, 1, 0, 1,
-0.8717315, -1.756767, -3.702404, 0.7647059, 1, 0, 1,
-0.8589528, 0.09282421, -0.01037239, 0.7568628, 1, 0, 1,
-0.8571292, -0.736586, -4.347033, 0.7529412, 1, 0, 1,
-0.8535792, 2.248509, 0.7280181, 0.7450981, 1, 0, 1,
-0.8501832, 0.07646568, -1.217664, 0.7411765, 1, 0, 1,
-0.8498554, 1.482291, -1.40523, 0.7333333, 1, 0, 1,
-0.8489591, -0.05316959, -0.9019972, 0.7294118, 1, 0, 1,
-0.8482531, -0.5734306, -1.187922, 0.7215686, 1, 0, 1,
-0.8415092, -0.1497944, -2.024888, 0.7176471, 1, 0, 1,
-0.8393475, 0.3981684, 0.5176645, 0.7098039, 1, 0, 1,
-0.839315, 1.233933, 0.1043665, 0.7058824, 1, 0, 1,
-0.8350853, -0.5635658, -3.418236, 0.6980392, 1, 0, 1,
-0.812017, 2.815096, 1.216059, 0.6901961, 1, 0, 1,
-0.8116947, -0.5530652, -3.778098, 0.6862745, 1, 0, 1,
-0.8034756, 0.7901318, 0.2009531, 0.6784314, 1, 0, 1,
-0.7998082, 0.1092239, 0.4192852, 0.6745098, 1, 0, 1,
-0.7973441, 0.3630122, -1.059566, 0.6666667, 1, 0, 1,
-0.7936142, 0.6637989, -0.2025943, 0.6627451, 1, 0, 1,
-0.7934921, -0.4448237, -2.626537, 0.654902, 1, 0, 1,
-0.7915704, 0.134865, -2.641802, 0.6509804, 1, 0, 1,
-0.7852499, -1.136608, -1.395848, 0.6431373, 1, 0, 1,
-0.7828892, -2.860891, -2.076071, 0.6392157, 1, 0, 1,
-0.7823886, 0.7989367, 0.2785622, 0.6313726, 1, 0, 1,
-0.7783544, 0.8360318, -1.750051, 0.627451, 1, 0, 1,
-0.7722143, -0.4930564, -2.189511, 0.6196079, 1, 0, 1,
-0.7656901, -0.6625692, -1.350232, 0.6156863, 1, 0, 1,
-0.7644803, 0.348192, -1.404247, 0.6078432, 1, 0, 1,
-0.7548986, -1.307859, -1.726465, 0.6039216, 1, 0, 1,
-0.7548906, 2.000185, -1.730469, 0.5960785, 1, 0, 1,
-0.7499697, -0.1695008, -0.7731993, 0.5882353, 1, 0, 1,
-0.7412814, -0.8782599, -1.768981, 0.5843138, 1, 0, 1,
-0.7408982, 1.889764, -1.703001, 0.5764706, 1, 0, 1,
-0.7406184, 0.637125, -0.9937443, 0.572549, 1, 0, 1,
-0.7390257, -1.021248, -2.943372, 0.5647059, 1, 0, 1,
-0.7374572, 0.3278574, -0.4932581, 0.5607843, 1, 0, 1,
-0.7365512, -0.291673, -3.466971, 0.5529412, 1, 0, 1,
-0.7323837, -0.3519807, -1.50658, 0.5490196, 1, 0, 1,
-0.7253698, -1.163531, -2.792965, 0.5411765, 1, 0, 1,
-0.7253245, -0.7317132, -2.616974, 0.5372549, 1, 0, 1,
-0.725313, 0.7533453, -2.246189, 0.5294118, 1, 0, 1,
-0.7214289, 0.3765381, 0.359548, 0.5254902, 1, 0, 1,
-0.7177685, -0.7821828, -1.799758, 0.5176471, 1, 0, 1,
-0.7175422, -1.378599, -4.154778, 0.5137255, 1, 0, 1,
-0.7171535, 0.3274406, -0.8762734, 0.5058824, 1, 0, 1,
-0.709933, -0.3534763, -2.576327, 0.5019608, 1, 0, 1,
-0.7032276, -0.8773408, -2.563806, 0.4941176, 1, 0, 1,
-0.7012227, -0.9401546, -1.680345, 0.4862745, 1, 0, 1,
-0.6931463, 1.615697, 1.556997, 0.4823529, 1, 0, 1,
-0.684625, 1.222413, 0.8230451, 0.4745098, 1, 0, 1,
-0.6644585, 1.512775, -0.3669628, 0.4705882, 1, 0, 1,
-0.6632557, -0.4072854, -2.595231, 0.4627451, 1, 0, 1,
-0.6631339, 1.248234, -0.847812, 0.4588235, 1, 0, 1,
-0.659909, 0.6200817, -0.1602326, 0.4509804, 1, 0, 1,
-0.6594217, -0.6180944, -1.409256, 0.4470588, 1, 0, 1,
-0.6544688, -0.3565388, -2.839769, 0.4392157, 1, 0, 1,
-0.6495456, 0.6270548, 0.07669406, 0.4352941, 1, 0, 1,
-0.647904, 0.2042557, 0.6531665, 0.427451, 1, 0, 1,
-0.6387208, -0.2013631, -3.186825, 0.4235294, 1, 0, 1,
-0.625805, 0.005818016, -1.44889, 0.4156863, 1, 0, 1,
-0.6255941, 1.090199, -0.8660679, 0.4117647, 1, 0, 1,
-0.6235383, -0.02757515, -2.167588, 0.4039216, 1, 0, 1,
-0.6193216, -0.9361716, -1.430712, 0.3960784, 1, 0, 1,
-0.6050835, 0.2928953, -1.5373, 0.3921569, 1, 0, 1,
-0.5972318, 0.425116, -1.485227, 0.3843137, 1, 0, 1,
-0.5960683, 0.4623354, -0.1921731, 0.3803922, 1, 0, 1,
-0.5910305, -1.15269, -3.676888, 0.372549, 1, 0, 1,
-0.5908951, 1.281709, -0.4248042, 0.3686275, 1, 0, 1,
-0.5875638, 0.8401035, 0.1943168, 0.3607843, 1, 0, 1,
-0.5868554, 0.5786903, -0.8840286, 0.3568628, 1, 0, 1,
-0.5803468, 0.1015526, -1.917028, 0.3490196, 1, 0, 1,
-0.5759255, 2.394473, -0.3245784, 0.345098, 1, 0, 1,
-0.5756465, -1.319642, -3.350015, 0.3372549, 1, 0, 1,
-0.5720432, 1.337525, -1.848539, 0.3333333, 1, 0, 1,
-0.5687969, -0.4176902, -1.840322, 0.3254902, 1, 0, 1,
-0.558567, -0.182457, -1.167909, 0.3215686, 1, 0, 1,
-0.5579297, -1.897463, -3.919426, 0.3137255, 1, 0, 1,
-0.5541626, -0.9110942, -3.637337, 0.3098039, 1, 0, 1,
-0.547901, 0.3787467, -3.737154, 0.3019608, 1, 0, 1,
-0.5476403, -1.294283, -2.506008, 0.2941177, 1, 0, 1,
-0.5441846, -0.4642408, -0.4333465, 0.2901961, 1, 0, 1,
-0.5394155, 1.063981, -0.4604335, 0.282353, 1, 0, 1,
-0.537164, 1.745445, -0.4461956, 0.2784314, 1, 0, 1,
-0.5361013, 0.283463, -1.985371, 0.2705882, 1, 0, 1,
-0.5308198, 0.971965, -1.190136, 0.2666667, 1, 0, 1,
-0.5300204, 0.7111022, -0.8948191, 0.2588235, 1, 0, 1,
-0.5245398, -0.4491226, -2.827636, 0.254902, 1, 0, 1,
-0.5164635, 0.7175213, -0.9298337, 0.2470588, 1, 0, 1,
-0.5126513, 2.191012, 0.5922611, 0.2431373, 1, 0, 1,
-0.5125591, 0.3650182, -0.7620778, 0.2352941, 1, 0, 1,
-0.5102364, -1.240295, -3.521801, 0.2313726, 1, 0, 1,
-0.5101608, 2.418737, -0.6579669, 0.2235294, 1, 0, 1,
-0.5097431, -1.11337, -1.109966, 0.2196078, 1, 0, 1,
-0.5015182, -0.8493469, -3.183698, 0.2117647, 1, 0, 1,
-0.5011299, -0.4903097, -1.428857, 0.2078431, 1, 0, 1,
-0.5011272, 0.9887427, -1.998659, 0.2, 1, 0, 1,
-0.5000307, -0.09396967, -0.4356703, 0.1921569, 1, 0, 1,
-0.4999398, -1.694528, -4.440865, 0.1882353, 1, 0, 1,
-0.4974307, -0.1360087, -3.292048, 0.1803922, 1, 0, 1,
-0.4960389, -0.3096058, -2.660815, 0.1764706, 1, 0, 1,
-0.4933999, 1.009028, -0.8320771, 0.1686275, 1, 0, 1,
-0.4930214, 0.6577584, -2.141298, 0.1647059, 1, 0, 1,
-0.4912912, -0.8383296, -2.44804, 0.1568628, 1, 0, 1,
-0.4888544, 0.3305383, 0.127352, 0.1529412, 1, 0, 1,
-0.4846466, 0.2591338, -1.257833, 0.145098, 1, 0, 1,
-0.4812881, -0.9453071, -3.359354, 0.1411765, 1, 0, 1,
-0.4803267, -0.4741163, -2.749665, 0.1333333, 1, 0, 1,
-0.4744542, 0.4722447, -0.581633, 0.1294118, 1, 0, 1,
-0.4724332, -0.6588677, -4.014446, 0.1215686, 1, 0, 1,
-0.4722531, -0.1543951, -2.292553, 0.1176471, 1, 0, 1,
-0.4715773, 0.2477756, -1.656573, 0.1098039, 1, 0, 1,
-0.4700843, 0.3187832, -0.3737988, 0.1058824, 1, 0, 1,
-0.4694256, 1.511028, -1.580346, 0.09803922, 1, 0, 1,
-0.4620352, 1.553485, -1.539488, 0.09019608, 1, 0, 1,
-0.4578212, 1.747171, 0.5887845, 0.08627451, 1, 0, 1,
-0.4570278, 0.5993308, -2.308595, 0.07843138, 1, 0, 1,
-0.4518145, -0.906835, -3.181944, 0.07450981, 1, 0, 1,
-0.4515161, -0.190953, -2.407471, 0.06666667, 1, 0, 1,
-0.4489961, 1.493692, -1.238444, 0.0627451, 1, 0, 1,
-0.4444247, 1.86576, -0.9378536, 0.05490196, 1, 0, 1,
-0.4425989, 0.4450734, -0.6131806, 0.05098039, 1, 0, 1,
-0.4418921, 1.903999, 2.40873, 0.04313726, 1, 0, 1,
-0.4404589, 1.947676, -1.909061, 0.03921569, 1, 0, 1,
-0.4354751, 0.4303985, -1.718598, 0.03137255, 1, 0, 1,
-0.4316444, 0.6016838, -2.265053, 0.02745098, 1, 0, 1,
-0.4278583, -0.980111, -3.086646, 0.01960784, 1, 0, 1,
-0.4263338, -0.5551074, -3.26353, 0.01568628, 1, 0, 1,
-0.4244472, 1.576377, 0.4307686, 0.007843138, 1, 0, 1,
-0.4232912, -0.3617215, -4.253613, 0.003921569, 1, 0, 1,
-0.4231954, -0.5273304, -4.60215, 0, 1, 0.003921569, 1,
-0.4183577, -0.5106714, -2.294909, 0, 1, 0.01176471, 1,
-0.4100436, 0.7958038, -0.2589763, 0, 1, 0.01568628, 1,
-0.4091723, -0.11584, -1.487945, 0, 1, 0.02352941, 1,
-0.4091547, -1.019356, -2.093484, 0, 1, 0.02745098, 1,
-0.4079815, -0.01278274, -2.168456, 0, 1, 0.03529412, 1,
-0.4034035, 0.9283705, -0.8531874, 0, 1, 0.03921569, 1,
-0.39844, -0.5264445, -1.525916, 0, 1, 0.04705882, 1,
-0.3945806, -0.4466384, -1.423991, 0, 1, 0.05098039, 1,
-0.3839469, 0.3523059, 0.3396088, 0, 1, 0.05882353, 1,
-0.3799486, -1.157963, -3.413054, 0, 1, 0.0627451, 1,
-0.3791805, -0.005689302, -1.70878, 0, 1, 0.07058824, 1,
-0.3787047, 0.4524649, -1.964123, 0, 1, 0.07450981, 1,
-0.3761581, 0.5362108, -0.6826555, 0, 1, 0.08235294, 1,
-0.3734279, 0.768669, -0.8363408, 0, 1, 0.08627451, 1,
-0.3720688, 1.868392, -1.636249, 0, 1, 0.09411765, 1,
-0.3675715, 1.551486, 0.8250232, 0, 1, 0.1019608, 1,
-0.3666744, -0.5050558, -2.851827, 0, 1, 0.1058824, 1,
-0.3652449, 0.558789, 0.06336219, 0, 1, 0.1137255, 1,
-0.3637218, -0.0547125, -0.09801775, 0, 1, 0.1176471, 1,
-0.3555236, 1.165193, 0.08053222, 0, 1, 0.1254902, 1,
-0.3544635, -1.330947, -2.476343, 0, 1, 0.1294118, 1,
-0.35203, 0.5921301, -1.156814, 0, 1, 0.1372549, 1,
-0.3466543, 1.861809, 1.189178, 0, 1, 0.1411765, 1,
-0.3461307, 0.7876691, 0.3932284, 0, 1, 0.1490196, 1,
-0.3399875, 0.7473233, 2.099703, 0, 1, 0.1529412, 1,
-0.3359469, -1.52022, -3.398105, 0, 1, 0.1607843, 1,
-0.329296, 0.02145484, -2.110063, 0, 1, 0.1647059, 1,
-0.3292001, 0.6150367, 0.05080629, 0, 1, 0.172549, 1,
-0.3239866, 0.8626799, -0.6532196, 0, 1, 0.1764706, 1,
-0.322721, 0.4840946, 0.09518227, 0, 1, 0.1843137, 1,
-0.3167933, -0.6498201, -2.206491, 0, 1, 0.1882353, 1,
-0.309704, 1.876495, -0.8346398, 0, 1, 0.1960784, 1,
-0.3090422, 1.197726, 1.691511, 0, 1, 0.2039216, 1,
-0.3061228, 0.7603418, -1.227878, 0, 1, 0.2078431, 1,
-0.3037334, 0.1904435, -0.741318, 0, 1, 0.2156863, 1,
-0.3021953, -0.9802527, -3.145649, 0, 1, 0.2196078, 1,
-0.299774, 0.5335106, -1.599944, 0, 1, 0.227451, 1,
-0.2990991, 0.8153604, -0.9291866, 0, 1, 0.2313726, 1,
-0.294763, -1.970712, -4.881162, 0, 1, 0.2392157, 1,
-0.2926215, 0.9169673, -0.2284892, 0, 1, 0.2431373, 1,
-0.2918593, 0.1860785, -1.431066, 0, 1, 0.2509804, 1,
-0.2918397, -0.1260288, -2.690542, 0, 1, 0.254902, 1,
-0.286162, -1.210433, -3.417728, 0, 1, 0.2627451, 1,
-0.2811139, 1.254238, -1.718751, 0, 1, 0.2666667, 1,
-0.2808048, -0.4185277, -1.622278, 0, 1, 0.2745098, 1,
-0.2790134, -1.197926, -2.120855, 0, 1, 0.2784314, 1,
-0.270214, 1.469544, -0.09408521, 0, 1, 0.2862745, 1,
-0.266216, 0.0373477, -2.055371, 0, 1, 0.2901961, 1,
-0.2635079, 0.6831045, -1.116289, 0, 1, 0.2980392, 1,
-0.2613441, -0.1879357, -1.602698, 0, 1, 0.3058824, 1,
-0.2608273, 0.6554432, -2.619107, 0, 1, 0.3098039, 1,
-0.2542846, 0.232057, 0.9688253, 0, 1, 0.3176471, 1,
-0.2512306, 0.1961574, -1.958575, 0, 1, 0.3215686, 1,
-0.2420359, -0.9041652, -3.225326, 0, 1, 0.3294118, 1,
-0.2398527, 2.415958, 2.165298, 0, 1, 0.3333333, 1,
-0.239117, -0.804151, -2.361636, 0, 1, 0.3411765, 1,
-0.2377279, 1.205315, 0.4711421, 0, 1, 0.345098, 1,
-0.2320962, 0.9032518, -0.593395, 0, 1, 0.3529412, 1,
-0.2296173, -0.7875243, -1.943124, 0, 1, 0.3568628, 1,
-0.2267402, -1.035383, -2.91758, 0, 1, 0.3647059, 1,
-0.2227125, -2.803919, -3.106931, 0, 1, 0.3686275, 1,
-0.2184763, -0.1699943, -2.90946, 0, 1, 0.3764706, 1,
-0.2181976, -1.515953, -3.041032, 0, 1, 0.3803922, 1,
-0.2083616, 0.3204668, -2.380595, 0, 1, 0.3882353, 1,
-0.2069642, 0.9186801, 0.4776318, 0, 1, 0.3921569, 1,
-0.2028626, -0.1278706, -3.91276, 0, 1, 0.4, 1,
-0.1992247, -1.381387, -4.425048, 0, 1, 0.4078431, 1,
-0.1968761, -1.98004, -2.846646, 0, 1, 0.4117647, 1,
-0.1957592, 0.1914825, -1.282752, 0, 1, 0.4196078, 1,
-0.1955853, 0.4057006, -0.4205245, 0, 1, 0.4235294, 1,
-0.1930212, 1.157343, -0.7556365, 0, 1, 0.4313726, 1,
-0.192762, -0.1941818, -2.177994, 0, 1, 0.4352941, 1,
-0.1917926, 0.1209849, 1.521885, 0, 1, 0.4431373, 1,
-0.1915682, -0.3900416, -3.363505, 0, 1, 0.4470588, 1,
-0.1901107, 0.7358214, 1.068391, 0, 1, 0.454902, 1,
-0.1890591, 0.6338033, -1.194218, 0, 1, 0.4588235, 1,
-0.1855294, 2.289774, 0.6511507, 0, 1, 0.4666667, 1,
-0.1842621, 1.452001, 0.4160547, 0, 1, 0.4705882, 1,
-0.1836358, -1.636406, -2.730503, 0, 1, 0.4784314, 1,
-0.1782047, 0.02742039, -1.542314, 0, 1, 0.4823529, 1,
-0.1769698, 0.2435254, 0.135453, 0, 1, 0.4901961, 1,
-0.1755774, -0.7435562, -2.471392, 0, 1, 0.4941176, 1,
-0.1744441, -0.8625377, -2.609689, 0, 1, 0.5019608, 1,
-0.1729805, 0.5180793, 0.8144839, 0, 1, 0.509804, 1,
-0.1715242, -2.463007, -1.701757, 0, 1, 0.5137255, 1,
-0.1706966, 0.3069954, -1.243518, 0, 1, 0.5215687, 1,
-0.1635069, -0.1711515, -4.037849, 0, 1, 0.5254902, 1,
-0.1592187, -0.3679187, -3.113852, 0, 1, 0.5333334, 1,
-0.1591032, 0.413346, -0.6993202, 0, 1, 0.5372549, 1,
-0.1588141, -1.283831, -3.332092, 0, 1, 0.5450981, 1,
-0.1575222, 1.485695, -0.3285166, 0, 1, 0.5490196, 1,
-0.1559081, -0.4680447, -4.503433, 0, 1, 0.5568628, 1,
-0.1552771, -0.9232423, -1.709135, 0, 1, 0.5607843, 1,
-0.1528412, -0.2113765, -2.47835, 0, 1, 0.5686275, 1,
-0.1480273, 0.668046, 0.4620148, 0, 1, 0.572549, 1,
-0.1465536, -0.8385565, -3.8905, 0, 1, 0.5803922, 1,
-0.1430805, -0.6813918, -2.195279, 0, 1, 0.5843138, 1,
-0.1425929, -0.7687913, -3.324152, 0, 1, 0.5921569, 1,
-0.1421303, 0.1339023, 0.5454254, 0, 1, 0.5960785, 1,
-0.1399194, 2.159206, 0.7384217, 0, 1, 0.6039216, 1,
-0.139363, 0.2261795, -0.4706686, 0, 1, 0.6117647, 1,
-0.1392024, 0.2122021, 2.400094, 0, 1, 0.6156863, 1,
-0.1346041, 1.331409, 1.381238, 0, 1, 0.6235294, 1,
-0.1269344, -0.3218348, -2.355212, 0, 1, 0.627451, 1,
-0.1254198, 1.581896, 0.4466506, 0, 1, 0.6352941, 1,
-0.1248185, 1.78727, 0.5867351, 0, 1, 0.6392157, 1,
-0.1220197, 0.1270843, -0.9495723, 0, 1, 0.6470588, 1,
-0.1136876, -0.8491547, -1.33313, 0, 1, 0.6509804, 1,
-0.1133672, -0.362248, -1.637645, 0, 1, 0.6588235, 1,
-0.1124466, -0.9000397, -1.992502, 0, 1, 0.6627451, 1,
-0.112276, 0.2833208, 0.3071223, 0, 1, 0.6705883, 1,
-0.1122556, -0.787082, -3.357747, 0, 1, 0.6745098, 1,
-0.1120598, 0.6103452, -1.585449, 0, 1, 0.682353, 1,
-0.1102834, -1.975601, -3.229742, 0, 1, 0.6862745, 1,
-0.10971, -0.9723709, -3.59458, 0, 1, 0.6941177, 1,
-0.1093865, -0.37151, -2.575156, 0, 1, 0.7019608, 1,
-0.1092118, 1.310311, -0.4447908, 0, 1, 0.7058824, 1,
-0.1082828, 0.4293004, -1.659027, 0, 1, 0.7137255, 1,
-0.1076478, 0.63604, -0.5364119, 0, 1, 0.7176471, 1,
-0.1049579, -0.750316, -4.605559, 0, 1, 0.7254902, 1,
-0.1034914, 1.353525, -1.872092, 0, 1, 0.7294118, 1,
-0.09883118, 0.2421522, 0.3697969, 0, 1, 0.7372549, 1,
-0.09722143, -0.926731, -3.094899, 0, 1, 0.7411765, 1,
-0.0952604, -0.500648, -1.464412, 0, 1, 0.7490196, 1,
-0.09449331, -0.5888398, -1.791159, 0, 1, 0.7529412, 1,
-0.09163683, 0.9723181, -0.41065, 0, 1, 0.7607843, 1,
-0.08750679, -0.07830181, -1.406882, 0, 1, 0.7647059, 1,
-0.08420607, -0.4198314, -3.617753, 0, 1, 0.772549, 1,
-0.08404159, 0.3119707, 0.05825559, 0, 1, 0.7764706, 1,
-0.07997013, 0.9220706, -0.6707736, 0, 1, 0.7843137, 1,
-0.07985376, 1.249057, 0.2206487, 0, 1, 0.7882353, 1,
-0.07848758, 1.451665, 0.2010279, 0, 1, 0.7960784, 1,
-0.07239761, 0.8534019, -0.008097755, 0, 1, 0.8039216, 1,
-0.05874221, -0.2496033, -2.454187, 0, 1, 0.8078431, 1,
-0.05866537, -1.35347, -2.416247, 0, 1, 0.8156863, 1,
-0.05725641, 1.376576, -1.040271, 0, 1, 0.8196079, 1,
-0.05186997, 1.805408, 0.5327476, 0, 1, 0.827451, 1,
-0.04501213, 0.03368954, -1.130265, 0, 1, 0.8313726, 1,
-0.03956605, 0.8640771, 0.08587242, 0, 1, 0.8392157, 1,
-0.03919392, -0.3544514, -2.807525, 0, 1, 0.8431373, 1,
-0.03759813, 1.989918, 0.4324109, 0, 1, 0.8509804, 1,
-0.03438219, 0.1893769, -0.8111243, 0, 1, 0.854902, 1,
-0.03156206, 0.1280102, 0.3827227, 0, 1, 0.8627451, 1,
-0.02867232, 0.8125828, -0.6802047, 0, 1, 0.8666667, 1,
-0.02410665, -1.240923, -2.207485, 0, 1, 0.8745098, 1,
-0.02408622, -1.740812, -3.855456, 0, 1, 0.8784314, 1,
-0.02198041, -0.376586, -3.19849, 0, 1, 0.8862745, 1,
-0.01424216, -0.6778313, -3.840103, 0, 1, 0.8901961, 1,
-0.01410076, -0.734625, -3.951462, 0, 1, 0.8980392, 1,
-0.01398243, -0.02035357, -2.077268, 0, 1, 0.9058824, 1,
-0.0135995, -1.275872, -3.177757, 0, 1, 0.9098039, 1,
-0.0115427, -0.4419216, -3.541026, 0, 1, 0.9176471, 1,
-0.00987762, -0.4763134, -4.740857, 0, 1, 0.9215686, 1,
-0.009786354, 0.9863803, -1.689571, 0, 1, 0.9294118, 1,
-0.009268847, 1.272512, 0.4536423, 0, 1, 0.9333333, 1,
-0.008343596, -0.1784534, -2.035818, 0, 1, 0.9411765, 1,
-0.005115706, 1.450649, 0.271093, 0, 1, 0.945098, 1,
-0.003298479, 2.285945, 1.212956, 0, 1, 0.9529412, 1,
-0.00288276, -0.3487343, -1.500687, 0, 1, 0.9568627, 1,
-0.001469665, -0.2968879, -3.78108, 0, 1, 0.9647059, 1,
-8.16577e-05, 1.194854, -0.7961825, 0, 1, 0.9686275, 1,
0.0008317324, 0.1527622, -0.5060645, 0, 1, 0.9764706, 1,
0.003534538, -1.021022, 3.447093, 0, 1, 0.9803922, 1,
0.003717766, -0.3347423, 2.868302, 0, 1, 0.9882353, 1,
0.006095779, -0.6676157, 3.642586, 0, 1, 0.9921569, 1,
0.009444528, 1.005127, 1.17332, 0, 1, 1, 1,
0.01355008, 0.5801497, 1.615558, 0, 0.9921569, 1, 1,
0.01677757, -1.626546, 1.880414, 0, 0.9882353, 1, 1,
0.01739954, -0.5919597, 3.458907, 0, 0.9803922, 1, 1,
0.01740843, 0.171936, 1.097789, 0, 0.9764706, 1, 1,
0.01924706, -1.641823, 3.240083, 0, 0.9686275, 1, 1,
0.02545987, 0.3405601, -0.713084, 0, 0.9647059, 1, 1,
0.03283306, 1.036628, 0.3365779, 0, 0.9568627, 1, 1,
0.03457944, 1.321469, 1.032076, 0, 0.9529412, 1, 1,
0.04022793, 0.35206, 0.4711735, 0, 0.945098, 1, 1,
0.04027071, 1.298437, -0.7399292, 0, 0.9411765, 1, 1,
0.04179595, -1.791305, 3.353775, 0, 0.9333333, 1, 1,
0.04313603, -0.8189289, 3.848594, 0, 0.9294118, 1, 1,
0.04585913, -0.09284089, 2.110514, 0, 0.9215686, 1, 1,
0.04942782, 0.183185, -0.1340813, 0, 0.9176471, 1, 1,
0.0497949, 0.7468129, 1.872438, 0, 0.9098039, 1, 1,
0.0503807, -1.968984, 3.019952, 0, 0.9058824, 1, 1,
0.05078921, -0.03951682, 1.304654, 0, 0.8980392, 1, 1,
0.05341652, -1.090628, 3.052893, 0, 0.8901961, 1, 1,
0.0547407, -0.5681233, 3.855242, 0, 0.8862745, 1, 1,
0.0565558, 1.467212, 1.216607, 0, 0.8784314, 1, 1,
0.05801169, 0.531875, 0.5350312, 0, 0.8745098, 1, 1,
0.05984835, -1.00119, 3.518453, 0, 0.8666667, 1, 1,
0.06829055, -1.236369, 4.530329, 0, 0.8627451, 1, 1,
0.06907878, -0.6465439, 2.774694, 0, 0.854902, 1, 1,
0.06947544, -1.475863, 2.364337, 0, 0.8509804, 1, 1,
0.07024553, -0.8539619, 3.533196, 0, 0.8431373, 1, 1,
0.07311826, -1.100584, 3.523349, 0, 0.8392157, 1, 1,
0.07429213, -0.9579442, 3.020449, 0, 0.8313726, 1, 1,
0.07789595, -0.178629, 3.136211, 0, 0.827451, 1, 1,
0.08238025, 1.265592, 0.2031121, 0, 0.8196079, 1, 1,
0.08544761, 0.1064835, 1.269854, 0, 0.8156863, 1, 1,
0.087009, -0.8947545, 3.949716, 0, 0.8078431, 1, 1,
0.09024353, -2.090532, 2.92146, 0, 0.8039216, 1, 1,
0.09050962, -0.9328938, 2.500872, 0, 0.7960784, 1, 1,
0.09053796, 0.3586094, -0.4187721, 0, 0.7882353, 1, 1,
0.0931073, -0.1826699, 2.257939, 0, 0.7843137, 1, 1,
0.09632885, -0.1680763, 1.898398, 0, 0.7764706, 1, 1,
0.09936344, -0.6340362, 3.05866, 0, 0.772549, 1, 1,
0.1057912, -0.3260723, 4.359809, 0, 0.7647059, 1, 1,
0.1124058, 0.5631529, 1.723891, 0, 0.7607843, 1, 1,
0.1133598, 0.3221272, -1.089945, 0, 0.7529412, 1, 1,
0.1135918, -0.1063093, 2.992324, 0, 0.7490196, 1, 1,
0.120296, 0.9837633, -0.5778585, 0, 0.7411765, 1, 1,
0.1263007, 1.365309, 1.807834, 0, 0.7372549, 1, 1,
0.1322391, 0.434108, 0.129255, 0, 0.7294118, 1, 1,
0.1326934, -0.1365622, 2.529187, 0, 0.7254902, 1, 1,
0.139924, 1.606588, 0.6417325, 0, 0.7176471, 1, 1,
0.1416767, -0.4959546, 1.682894, 0, 0.7137255, 1, 1,
0.1557886, -0.4124498, 4.100893, 0, 0.7058824, 1, 1,
0.1593776, 0.7957563, 1.891078, 0, 0.6980392, 1, 1,
0.1609468, 1.972449, -0.02943298, 0, 0.6941177, 1, 1,
0.1636779, 0.1330425, 1.393969, 0, 0.6862745, 1, 1,
0.1648386, 0.1838298, 1.934551, 0, 0.682353, 1, 1,
0.1655031, -0.7534556, 2.989249, 0, 0.6745098, 1, 1,
0.1672634, -1.381105, 2.87577, 0, 0.6705883, 1, 1,
0.1679773, -0.3333419, 2.457237, 0, 0.6627451, 1, 1,
0.1702801, 1.403437, -0.7568288, 0, 0.6588235, 1, 1,
0.1704635, 1.219796, -1.348585, 0, 0.6509804, 1, 1,
0.1721348, 0.01944968, 0.09503897, 0, 0.6470588, 1, 1,
0.1763195, 0.2334923, 0.365657, 0, 0.6392157, 1, 1,
0.1787567, -0.2221273, 3.492735, 0, 0.6352941, 1, 1,
0.1809275, 0.4658108, 0.06887857, 0, 0.627451, 1, 1,
0.1864348, 0.6814437, 0.587437, 0, 0.6235294, 1, 1,
0.1870661, 0.9597685, 0.7299706, 0, 0.6156863, 1, 1,
0.1877028, 0.6953094, 2.470488, 0, 0.6117647, 1, 1,
0.1896281, 0.09259983, 1.019454, 0, 0.6039216, 1, 1,
0.1918644, 1.463368, -1.712206, 0, 0.5960785, 1, 1,
0.2066293, -0.5743023, 2.275895, 0, 0.5921569, 1, 1,
0.2067428, 0.6194661, -0.04306142, 0, 0.5843138, 1, 1,
0.2091144, 0.3801326, -0.9762017, 0, 0.5803922, 1, 1,
0.2196034, 0.5726519, 0.3205557, 0, 0.572549, 1, 1,
0.2235091, -1.560537, 2.498691, 0, 0.5686275, 1, 1,
0.2243707, -1.204909, 3.509048, 0, 0.5607843, 1, 1,
0.2267953, 0.4738834, 1.037203, 0, 0.5568628, 1, 1,
0.2270327, -0.2050602, 3.420022, 0, 0.5490196, 1, 1,
0.227418, -0.4911619, 1.072519, 0, 0.5450981, 1, 1,
0.2314819, -1.808636, 2.232821, 0, 0.5372549, 1, 1,
0.2317689, -0.9172237, 3.154079, 0, 0.5333334, 1, 1,
0.2333708, -0.07278578, 1.581788, 0, 0.5254902, 1, 1,
0.2370361, -1.43873, 4.512605, 0, 0.5215687, 1, 1,
0.2384757, 1.140134, 0.5039088, 0, 0.5137255, 1, 1,
0.2403988, -0.8601903, 3.039609, 0, 0.509804, 1, 1,
0.244384, 1.114381, 0.9261926, 0, 0.5019608, 1, 1,
0.247093, -0.3224011, 3.641171, 0, 0.4941176, 1, 1,
0.2480041, 0.5568241, 0.8256539, 0, 0.4901961, 1, 1,
0.2507798, -0.8674068, 2.275485, 0, 0.4823529, 1, 1,
0.255217, -1.116169, 3.777037, 0, 0.4784314, 1, 1,
0.2591023, 0.8855461, 1.034719, 0, 0.4705882, 1, 1,
0.2607393, -0.8730715, 2.476717, 0, 0.4666667, 1, 1,
0.2608732, 0.1665609, -0.6833622, 0, 0.4588235, 1, 1,
0.2608761, 0.0920487, -0.2255533, 0, 0.454902, 1, 1,
0.2623404, 0.4904222, 1.443766, 0, 0.4470588, 1, 1,
0.2651291, 1.043178, 1.335338, 0, 0.4431373, 1, 1,
0.2667819, -1.011976, 3.067264, 0, 0.4352941, 1, 1,
0.2687946, 1.554914, 0.400704, 0, 0.4313726, 1, 1,
0.2707413, 1.391073, -1.080426, 0, 0.4235294, 1, 1,
0.2718682, 1.334601, 0.9387947, 0, 0.4196078, 1, 1,
0.274363, -0.6752879, 1.010464, 0, 0.4117647, 1, 1,
0.2772096, -1.6741, 3.505624, 0, 0.4078431, 1, 1,
0.2776545, 1.048401, 2.451958, 0, 0.4, 1, 1,
0.2799968, 0.1192686, 1.970581, 0, 0.3921569, 1, 1,
0.2818235, 0.3486903, 0.294421, 0, 0.3882353, 1, 1,
0.2823245, -0.2071912, 3.003728, 0, 0.3803922, 1, 1,
0.2864085, 1.899402, -1.357849, 0, 0.3764706, 1, 1,
0.2864616, -0.06816235, 1.082537, 0, 0.3686275, 1, 1,
0.2870122, 0.7895725, -0.8018703, 0, 0.3647059, 1, 1,
0.2889858, -0.5003998, 1.840203, 0, 0.3568628, 1, 1,
0.2907171, -0.4684431, 2.155557, 0, 0.3529412, 1, 1,
0.2945898, 1.46733, -0.9922495, 0, 0.345098, 1, 1,
0.2948741, -0.4126088, 0.9486116, 0, 0.3411765, 1, 1,
0.2956101, -0.7741817, 1.683424, 0, 0.3333333, 1, 1,
0.296656, 0.9780618, -1.412323, 0, 0.3294118, 1, 1,
0.2996241, 0.6573693, -0.9302552, 0, 0.3215686, 1, 1,
0.3005109, 0.2637371, 2.11615, 0, 0.3176471, 1, 1,
0.3072747, 0.1110165, 0.08641247, 0, 0.3098039, 1, 1,
0.3079596, 1.564214, -0.3576365, 0, 0.3058824, 1, 1,
0.3081146, -0.8160023, 1.354701, 0, 0.2980392, 1, 1,
0.3088042, 1.778466, 0.09972887, 0, 0.2901961, 1, 1,
0.3103854, 0.07796464, 0.8572997, 0, 0.2862745, 1, 1,
0.3123975, -0.04190416, 1.198294, 0, 0.2784314, 1, 1,
0.3123999, -0.5968956, 3.226958, 0, 0.2745098, 1, 1,
0.3188785, 2.985883, -0.691006, 0, 0.2666667, 1, 1,
0.3206002, 0.09266905, 1.199623, 0, 0.2627451, 1, 1,
0.3206235, -1.450844, 1.895382, 0, 0.254902, 1, 1,
0.3211007, -0.01689584, 1.276855, 0, 0.2509804, 1, 1,
0.3220499, 0.1336163, 1.672058, 0, 0.2431373, 1, 1,
0.3221462, 0.2349565, -0.4803285, 0, 0.2392157, 1, 1,
0.3274489, -1.455654, 3.106685, 0, 0.2313726, 1, 1,
0.3276968, -1.382697, 2.943564, 0, 0.227451, 1, 1,
0.3277649, 0.05132084, 0.9133227, 0, 0.2196078, 1, 1,
0.3305827, 0.6238137, 1.840096, 0, 0.2156863, 1, 1,
0.3363853, 2.126549, 1.787213, 0, 0.2078431, 1, 1,
0.3450104, -0.3629801, 1.268509, 0, 0.2039216, 1, 1,
0.3515087, -0.5332191, 1.898529, 0, 0.1960784, 1, 1,
0.3536762, -1.099259, 4.877353, 0, 0.1882353, 1, 1,
0.3551246, 1.919656, -0.8324376, 0, 0.1843137, 1, 1,
0.3563145, 0.3294643, -1.087028, 0, 0.1764706, 1, 1,
0.3582659, 1.498319, -0.3816201, 0, 0.172549, 1, 1,
0.3681409, -1.246899, 3.846851, 0, 0.1647059, 1, 1,
0.3686892, 1.183056, 2.663034, 0, 0.1607843, 1, 1,
0.369338, 0.8944405, 1.33285, 0, 0.1529412, 1, 1,
0.3702586, 0.2599667, 0.2067924, 0, 0.1490196, 1, 1,
0.3728007, -1.807252, 4.23299, 0, 0.1411765, 1, 1,
0.3745522, 0.3462099, 0.02186688, 0, 0.1372549, 1, 1,
0.3751589, -0.7564279, 2.476868, 0, 0.1294118, 1, 1,
0.3786936, -0.5679226, 2.389441, 0, 0.1254902, 1, 1,
0.3800981, -1.187837, 3.761367, 0, 0.1176471, 1, 1,
0.3866933, -0.06605485, 1.323208, 0, 0.1137255, 1, 1,
0.3867112, 1.055365, 0.4843498, 0, 0.1058824, 1, 1,
0.3879265, -1.192099, 2.447924, 0, 0.09803922, 1, 1,
0.3903873, -0.07573978, 3.75365, 0, 0.09411765, 1, 1,
0.3914214, -0.2728886, 1.828742, 0, 0.08627451, 1, 1,
0.3920847, -0.578127, 2.526971, 0, 0.08235294, 1, 1,
0.3997627, -2.724375, 1.312437, 0, 0.07450981, 1, 1,
0.4004982, 1.499187, 0.800869, 0, 0.07058824, 1, 1,
0.4008911, 0.8490012, -0.4406354, 0, 0.0627451, 1, 1,
0.4025777, -0.6461266, 2.770792, 0, 0.05882353, 1, 1,
0.4029592, -0.3090652, 2.228648, 0, 0.05098039, 1, 1,
0.4036517, 0.6780284, -0.5681216, 0, 0.04705882, 1, 1,
0.4072754, -0.08599073, 0.7429287, 0, 0.03921569, 1, 1,
0.4077583, 1.244802, 1.304464, 0, 0.03529412, 1, 1,
0.4127284, -0.3441454, 3.643517, 0, 0.02745098, 1, 1,
0.4141478, -0.3399255, 2.605815, 0, 0.02352941, 1, 1,
0.4153862, -0.6726633, 3.106161, 0, 0.01568628, 1, 1,
0.415844, -1.376964, 3.060367, 0, 0.01176471, 1, 1,
0.4166983, 0.3192201, 0.8774294, 0, 0.003921569, 1, 1,
0.4177362, 0.09561912, 2.946752, 0.003921569, 0, 1, 1,
0.4227496, -0.5570245, 3.268128, 0.007843138, 0, 1, 1,
0.4252203, 0.1297767, 2.405381, 0.01568628, 0, 1, 1,
0.4272275, 0.2063533, 0.4309985, 0.01960784, 0, 1, 1,
0.4282307, -0.1350321, 2.454431, 0.02745098, 0, 1, 1,
0.4299583, -1.314438, 2.533649, 0.03137255, 0, 1, 1,
0.4306684, 0.6616614, 0.6373803, 0.03921569, 0, 1, 1,
0.4351588, 0.5191277, -0.4755273, 0.04313726, 0, 1, 1,
0.4392434, -0.3552956, 1.5651, 0.05098039, 0, 1, 1,
0.4450015, -2.0772, 2.342184, 0.05490196, 0, 1, 1,
0.4484465, 0.08975162, 1.097524, 0.0627451, 0, 1, 1,
0.4488378, -0.001510503, 2.291217, 0.06666667, 0, 1, 1,
0.4505187, -0.1240979, 0.8542119, 0.07450981, 0, 1, 1,
0.4540735, 0.5361204, 0.4009013, 0.07843138, 0, 1, 1,
0.4550009, 0.4101394, 1.296164, 0.08627451, 0, 1, 1,
0.4568157, -0.7087449, 1.653291, 0.09019608, 0, 1, 1,
0.460857, -0.9256926, 1.631839, 0.09803922, 0, 1, 1,
0.4634116, -0.4587549, 0.1583003, 0.1058824, 0, 1, 1,
0.4644192, -0.5946137, 2.874547, 0.1098039, 0, 1, 1,
0.465755, -1.053967, 2.4913, 0.1176471, 0, 1, 1,
0.4716748, 0.4039046, 0.9163339, 0.1215686, 0, 1, 1,
0.4717571, -0.9566865, 2.949948, 0.1294118, 0, 1, 1,
0.4757855, -1.528138, 3.301603, 0.1333333, 0, 1, 1,
0.4762338, -0.1555123, 0.7601788, 0.1411765, 0, 1, 1,
0.479048, 0.4231303, 0.6112766, 0.145098, 0, 1, 1,
0.4837151, 1.994181, 0.7819166, 0.1529412, 0, 1, 1,
0.4879155, -1.067504, 1.586589, 0.1568628, 0, 1, 1,
0.4968112, -0.2965603, 3.963241, 0.1647059, 0, 1, 1,
0.503698, 1.702718, 1.155565, 0.1686275, 0, 1, 1,
0.5078972, -0.08220098, 0.3035113, 0.1764706, 0, 1, 1,
0.5109218, -0.04939003, 2.655571, 0.1803922, 0, 1, 1,
0.5109232, -1.492406, 3.58443, 0.1882353, 0, 1, 1,
0.5162221, -0.6179323, 2.262161, 0.1921569, 0, 1, 1,
0.5179799, 1.650656, -0.07877102, 0.2, 0, 1, 1,
0.5202855, -0.4359449, 2.203491, 0.2078431, 0, 1, 1,
0.5235387, 1.017823, -0.889611, 0.2117647, 0, 1, 1,
0.5239969, -1.00711, 2.527273, 0.2196078, 0, 1, 1,
0.5326006, 0.9560696, 0.718377, 0.2235294, 0, 1, 1,
0.5333815, 0.07998423, 0.792466, 0.2313726, 0, 1, 1,
0.5370635, -1.458928, 2.638144, 0.2352941, 0, 1, 1,
0.5399816, -1.096488, 0.4774186, 0.2431373, 0, 1, 1,
0.5430188, 0.9148912, -0.6917188, 0.2470588, 0, 1, 1,
0.5493211, -0.1229502, 2.752039, 0.254902, 0, 1, 1,
0.5514998, 0.00934062, 2.861726, 0.2588235, 0, 1, 1,
0.5534129, -1.159091, 0.7630586, 0.2666667, 0, 1, 1,
0.5591441, -0.4299868, 2.359752, 0.2705882, 0, 1, 1,
0.5627411, -0.8524906, 3.294498, 0.2784314, 0, 1, 1,
0.5669501, -0.2655661, 2.584173, 0.282353, 0, 1, 1,
0.5684104, 1.086128, -0.3461592, 0.2901961, 0, 1, 1,
0.5706434, -0.08150997, 1.310306, 0.2941177, 0, 1, 1,
0.5714218, 1.075496, -1.019204, 0.3019608, 0, 1, 1,
0.5731977, -0.2300262, 2.227878, 0.3098039, 0, 1, 1,
0.5757108, -1.576249, 3.553047, 0.3137255, 0, 1, 1,
0.5761319, 0.1631876, -0.1313881, 0.3215686, 0, 1, 1,
0.578116, -0.702325, 2.259616, 0.3254902, 0, 1, 1,
0.5782263, 1.139081, 0.5379811, 0.3333333, 0, 1, 1,
0.5789463, -1.180914, 3.486205, 0.3372549, 0, 1, 1,
0.5811991, 1.18614, 0.4825439, 0.345098, 0, 1, 1,
0.5812331, -0.7936671, 3.159691, 0.3490196, 0, 1, 1,
0.5812488, 0.4689177, 0.4969677, 0.3568628, 0, 1, 1,
0.5821553, -0.6543498, 2.154734, 0.3607843, 0, 1, 1,
0.5830131, -2.751067, 3.378345, 0.3686275, 0, 1, 1,
0.5830815, 0.03454397, -0.7043842, 0.372549, 0, 1, 1,
0.5848067, 1.510831, 1.087486, 0.3803922, 0, 1, 1,
0.5881419, -0.1401189, 2.011161, 0.3843137, 0, 1, 1,
0.5883324, -0.2327866, -0.7849338, 0.3921569, 0, 1, 1,
0.5927025, 0.3157015, 1.29106, 0.3960784, 0, 1, 1,
0.5930192, 1.770447, 0.6778328, 0.4039216, 0, 1, 1,
0.5942898, 1.374375, -0.5736194, 0.4117647, 0, 1, 1,
0.6069162, -1.101995, 5.229355, 0.4156863, 0, 1, 1,
0.610823, -0.5021036, 2.072192, 0.4235294, 0, 1, 1,
0.6185025, 0.9073406, 1.905989, 0.427451, 0, 1, 1,
0.6196672, 1.337689, -1.349116, 0.4352941, 0, 1, 1,
0.6306638, 1.950166, 0.07510199, 0.4392157, 0, 1, 1,
0.6331198, -0.2207782, 3.371463, 0.4470588, 0, 1, 1,
0.639202, 2.257534, 0.8722494, 0.4509804, 0, 1, 1,
0.6400308, -1.22501, 4.090344, 0.4588235, 0, 1, 1,
0.6444543, 0.984325, 1.027418, 0.4627451, 0, 1, 1,
0.6497412, -0.2394002, 1.767332, 0.4705882, 0, 1, 1,
0.6572199, -2.601739, 2.326807, 0.4745098, 0, 1, 1,
0.66275, 1.738532, 0.05827161, 0.4823529, 0, 1, 1,
0.6633231, -0.3420022, 1.214071, 0.4862745, 0, 1, 1,
0.6725414, -0.5349858, 2.558156, 0.4941176, 0, 1, 1,
0.6736839, 0.3468964, 1.820911, 0.5019608, 0, 1, 1,
0.6736902, -0.6058221, 3.053045, 0.5058824, 0, 1, 1,
0.6785558, 0.1095629, 0.599381, 0.5137255, 0, 1, 1,
0.6804603, 0.3473438, 0.253286, 0.5176471, 0, 1, 1,
0.6836389, 0.2058514, 1.435056, 0.5254902, 0, 1, 1,
0.6871238, -1.407041, 3.783019, 0.5294118, 0, 1, 1,
0.6898234, 0.8311586, -0.4726331, 0.5372549, 0, 1, 1,
0.692162, 1.35681, 0.1410696, 0.5411765, 0, 1, 1,
0.6953395, 0.14338, 2.755505, 0.5490196, 0, 1, 1,
0.7020178, -1.44179, 3.389431, 0.5529412, 0, 1, 1,
0.7132653, -0.5592343, 3.204987, 0.5607843, 0, 1, 1,
0.7136214, 0.3696111, 1.532354, 0.5647059, 0, 1, 1,
0.7154264, 1.017232, 2.171071, 0.572549, 0, 1, 1,
0.7159182, -1.505003, 2.441793, 0.5764706, 0, 1, 1,
0.72117, 0.1761434, -0.9653272, 0.5843138, 0, 1, 1,
0.7267412, 0.5367293, 0.2654424, 0.5882353, 0, 1, 1,
0.7271836, 0.627505, 0.8937626, 0.5960785, 0, 1, 1,
0.7277175, -0.02439825, 2.814112, 0.6039216, 0, 1, 1,
0.7311586, -1.469471, 1.398299, 0.6078432, 0, 1, 1,
0.7346531, -0.8447611, 1.360938, 0.6156863, 0, 1, 1,
0.7368204, 1.233199, 1.612555, 0.6196079, 0, 1, 1,
0.7442584, 0.391946, 0.9411431, 0.627451, 0, 1, 1,
0.7446974, 0.5717188, 2.764022, 0.6313726, 0, 1, 1,
0.7492775, -1.144906, 3.045901, 0.6392157, 0, 1, 1,
0.750707, -0.1287806, 2.636702, 0.6431373, 0, 1, 1,
0.7576537, -0.6587765, 2.280888, 0.6509804, 0, 1, 1,
0.7630978, -0.3293156, 2.039697, 0.654902, 0, 1, 1,
0.7647871, 1.405862, 0.6708195, 0.6627451, 0, 1, 1,
0.767947, 1.319278, 0.4967517, 0.6666667, 0, 1, 1,
0.7709615, 0.4515055, 0.02717015, 0.6745098, 0, 1, 1,
0.7790568, -0.1540558, 0.6334746, 0.6784314, 0, 1, 1,
0.7864228, 0.3848272, 1.70653, 0.6862745, 0, 1, 1,
0.7871894, -0.4297602, -0.1664028, 0.6901961, 0, 1, 1,
0.7873594, 0.3295896, 1.419364, 0.6980392, 0, 1, 1,
0.7880496, -0.1981541, 1.718433, 0.7058824, 0, 1, 1,
0.7896764, -0.6382222, 1.268736, 0.7098039, 0, 1, 1,
0.7915091, 0.09040565, 1.317615, 0.7176471, 0, 1, 1,
0.7941788, -0.5417861, 0.9355215, 0.7215686, 0, 1, 1,
0.7962227, 0.5148595, 1.108373, 0.7294118, 0, 1, 1,
0.796779, -1.663057, 1.762919, 0.7333333, 0, 1, 1,
0.7969539, -1.89047, 1.813198, 0.7411765, 0, 1, 1,
0.7999595, 0.2281208, 0.3193203, 0.7450981, 0, 1, 1,
0.8060772, 0.04531863, 1.849874, 0.7529412, 0, 1, 1,
0.8109126, 1.323498, 1.882013, 0.7568628, 0, 1, 1,
0.8112618, -0.2410598, 0.8104595, 0.7647059, 0, 1, 1,
0.8130584, -1.153071, 4.914357, 0.7686275, 0, 1, 1,
0.8138792, 1.0192, 0.35895, 0.7764706, 0, 1, 1,
0.8216411, -0.5666759, 4.195601, 0.7803922, 0, 1, 1,
0.8268899, -0.5455885, 3.094248, 0.7882353, 0, 1, 1,
0.8276359, -0.848286, 1.510172, 0.7921569, 0, 1, 1,
0.8312503, 0.8589218, 2.447453, 0.8, 0, 1, 1,
0.834522, -0.2661618, 1.819441, 0.8078431, 0, 1, 1,
0.8363766, -2.430925, 0.9263192, 0.8117647, 0, 1, 1,
0.8454163, -0.1971447, 3.599661, 0.8196079, 0, 1, 1,
0.8478757, -0.2100102, 1.128773, 0.8235294, 0, 1, 1,
0.8485816, 0.03721935, 0.07443051, 0.8313726, 0, 1, 1,
0.8507063, 0.4610225, 1.24406, 0.8352941, 0, 1, 1,
0.8522655, 0.9921372, 0.8604148, 0.8431373, 0, 1, 1,
0.8527026, 0.1019833, 0.3684143, 0.8470588, 0, 1, 1,
0.8539333, 1.009963, 0.7134923, 0.854902, 0, 1, 1,
0.8640806, 0.5842221, -0.002466154, 0.8588235, 0, 1, 1,
0.8697647, -0.1871952, 2.248135, 0.8666667, 0, 1, 1,
0.8777108, 1.818439, -0.1047122, 0.8705882, 0, 1, 1,
0.8808488, -1.764416, 2.021742, 0.8784314, 0, 1, 1,
0.8825207, -0.01799526, -0.2270764, 0.8823529, 0, 1, 1,
0.8855992, 0.6262239, 1.43274, 0.8901961, 0, 1, 1,
0.88827, -1.140108, 2.638765, 0.8941177, 0, 1, 1,
0.8942866, 1.047605, 0.9478064, 0.9019608, 0, 1, 1,
0.8990952, -2.556859, 1.879087, 0.9098039, 0, 1, 1,
0.8991027, -0.4764036, 2.462494, 0.9137255, 0, 1, 1,
0.9076965, -0.3792969, 1.713776, 0.9215686, 0, 1, 1,
0.9221807, 0.618269, 0.8230289, 0.9254902, 0, 1, 1,
0.928316, -0.915832, 3.204194, 0.9333333, 0, 1, 1,
0.9344772, 0.6463002, 0.5261298, 0.9372549, 0, 1, 1,
0.9392996, -0.3316525, 0.2613124, 0.945098, 0, 1, 1,
0.9418328, -0.4499312, 2.663363, 0.9490196, 0, 1, 1,
0.9439716, -0.4660126, 2.861874, 0.9568627, 0, 1, 1,
0.9458725, -0.203866, 0.9338862, 0.9607843, 0, 1, 1,
0.946322, -1.618585, 2.628564, 0.9686275, 0, 1, 1,
0.9471202, -1.420716, 3.535317, 0.972549, 0, 1, 1,
0.9483551, 0.2887788, 2.160508, 0.9803922, 0, 1, 1,
0.9618986, -0.9279076, 1.819172, 0.9843137, 0, 1, 1,
0.9622317, 0.3577338, -1.432626, 0.9921569, 0, 1, 1,
0.9627967, 0.2441812, 0.2458313, 0.9960784, 0, 1, 1,
0.963249, 0.01443725, 2.098697, 1, 0, 0.9960784, 1,
0.9633036, -0.7328616, 2.377801, 1, 0, 0.9882353, 1,
0.9644108, -0.2971456, 2.585406, 1, 0, 0.9843137, 1,
0.9661341, 0.5008419, 1.72316, 1, 0, 0.9764706, 1,
0.9790637, 0.2954825, 0.4054607, 1, 0, 0.972549, 1,
0.980195, 0.05238738, 1.61667, 1, 0, 0.9647059, 1,
0.9817349, -0.06796513, 1.60612, 1, 0, 0.9607843, 1,
0.9852064, 0.2494859, 1.276377, 1, 0, 0.9529412, 1,
0.986024, -0.9568244, 5.991339, 1, 0, 0.9490196, 1,
0.9896221, 0.1570254, 1.302112, 1, 0, 0.9411765, 1,
0.9896246, -0.5679655, 4.025092, 1, 0, 0.9372549, 1,
0.9902749, 1.023353, 1.967296, 1, 0, 0.9294118, 1,
0.9917385, 0.7684958, -0.4816653, 1, 0, 0.9254902, 1,
0.9922358, 0.2673305, 1.737738, 1, 0, 0.9176471, 1,
0.9975855, -1.162007, 3.469069, 1, 0, 0.9137255, 1,
1.007667, 1.47585, 2.149621, 1, 0, 0.9058824, 1,
1.008433, 1.135957, 0.8007154, 1, 0, 0.9019608, 1,
1.0088, -1.238302, 2.940365, 1, 0, 0.8941177, 1,
1.011977, 1.821653, 0.9287221, 1, 0, 0.8862745, 1,
1.015204, -0.4681782, 3.216308, 1, 0, 0.8823529, 1,
1.017659, -0.6168424, 2.027583, 1, 0, 0.8745098, 1,
1.019144, 0.6885311, 0.8771081, 1, 0, 0.8705882, 1,
1.027485, -0.4305621, 1.452146, 1, 0, 0.8627451, 1,
1.029062, -0.3527259, 2.578464, 1, 0, 0.8588235, 1,
1.032608, 1.367825, -0.6052327, 1, 0, 0.8509804, 1,
1.032761, -0.06441528, 1.770919, 1, 0, 0.8470588, 1,
1.045203, -0.5445433, 1.371803, 1, 0, 0.8392157, 1,
1.045833, -1.92038, 2.811193, 1, 0, 0.8352941, 1,
1.054043, 2.272588, 0.4598362, 1, 0, 0.827451, 1,
1.060869, 0.07858022, 1.251969, 1, 0, 0.8235294, 1,
1.070589, -0.4349392, 1.431455, 1, 0, 0.8156863, 1,
1.070861, 1.875585, 2.032141, 1, 0, 0.8117647, 1,
1.087548, -1.538521, 3.419914, 1, 0, 0.8039216, 1,
1.091736, -0.1224519, 1.645357, 1, 0, 0.7960784, 1,
1.096888, 0.9764224, 0.5075374, 1, 0, 0.7921569, 1,
1.100291, -1.616313, 4.260462, 1, 0, 0.7843137, 1,
1.113779, 0.1885936, 0.7475324, 1, 0, 0.7803922, 1,
1.124141, 1.322688, 0.02344037, 1, 0, 0.772549, 1,
1.124541, 2.277526, 0.9792693, 1, 0, 0.7686275, 1,
1.127475, 1.433604, 1.939437, 1, 0, 0.7607843, 1,
1.136802, -1.048316, 1.874816, 1, 0, 0.7568628, 1,
1.143502, -0.2406801, 2.892694, 1, 0, 0.7490196, 1,
1.144579, 1.190415, 1.648783, 1, 0, 0.7450981, 1,
1.162272, 0.6337048, -0.4825345, 1, 0, 0.7372549, 1,
1.162742, 0.6164512, 1.356103, 1, 0, 0.7333333, 1,
1.164517, -0.6756646, 1.701359, 1, 0, 0.7254902, 1,
1.174015, 0.2453301, 0.9401261, 1, 0, 0.7215686, 1,
1.177919, 0.5465255, 1.615575, 1, 0, 0.7137255, 1,
1.180208, 0.7376344, 1.834872, 1, 0, 0.7098039, 1,
1.180468, 0.4771334, 0.4331718, 1, 0, 0.7019608, 1,
1.185559, 0.6108414, 1.153942, 1, 0, 0.6941177, 1,
1.187696, -0.9945925, 1.196979, 1, 0, 0.6901961, 1,
1.194419, -0.01346095, 3.55318, 1, 0, 0.682353, 1,
1.199822, 0.9196541, -0.01289955, 1, 0, 0.6784314, 1,
1.201367, 1.156536, 2.091451, 1, 0, 0.6705883, 1,
1.206838, 0.5944636, 3.278367, 1, 0, 0.6666667, 1,
1.208638, 0.06065049, 1.131338, 1, 0, 0.6588235, 1,
1.210963, 1.08369, 2.446, 1, 0, 0.654902, 1,
1.211505, -0.2773119, 0.2916318, 1, 0, 0.6470588, 1,
1.21213, 2.667171, 1.840261, 1, 0, 0.6431373, 1,
1.218304, -0.149092, 2.926247, 1, 0, 0.6352941, 1,
1.218464, -0.2036412, 1.56793, 1, 0, 0.6313726, 1,
1.218558, -1.079031, 0.8189648, 1, 0, 0.6235294, 1,
1.220935, 0.8535092, 2.38834, 1, 0, 0.6196079, 1,
1.225447, -0.2200353, 1.508091, 1, 0, 0.6117647, 1,
1.23295, -0.3681322, 1.762111, 1, 0, 0.6078432, 1,
1.235086, -1.167679, 3.463473, 1, 0, 0.6, 1,
1.235508, -0.8910927, 1.659192, 1, 0, 0.5921569, 1,
1.239911, 0.5647208, 0.777229, 1, 0, 0.5882353, 1,
1.240582, 0.9374845, 3.949047, 1, 0, 0.5803922, 1,
1.24211, -0.7695815, 3.138775, 1, 0, 0.5764706, 1,
1.25145, -0.0006935886, 2.371174, 1, 0, 0.5686275, 1,
1.265039, -0.002603323, 2.570022, 1, 0, 0.5647059, 1,
1.287277, 0.3924297, 0.8357484, 1, 0, 0.5568628, 1,
1.288179, 0.8011569, 1.413006, 1, 0, 0.5529412, 1,
1.306057, -0.2456095, 1.351733, 1, 0, 0.5450981, 1,
1.320035, 0.6004395, 2.114029, 1, 0, 0.5411765, 1,
1.325891, 0.3548861, 1.067062, 1, 0, 0.5333334, 1,
1.339622, 1.055631, 0.3444355, 1, 0, 0.5294118, 1,
1.34769, 1.618713, 1.177358, 1, 0, 0.5215687, 1,
1.352812, 0.4295141, 0.3338279, 1, 0, 0.5176471, 1,
1.353849, -0.6050287, 2.665886, 1, 0, 0.509804, 1,
1.361509, -0.6900427, 2.383916, 1, 0, 0.5058824, 1,
1.382681, -0.06822937, 0.1283865, 1, 0, 0.4980392, 1,
1.393102, -0.1699045, 1.198512, 1, 0, 0.4901961, 1,
1.401539, 0.156119, 2.230128, 1, 0, 0.4862745, 1,
1.401994, -0.7616948, 1.041369, 1, 0, 0.4784314, 1,
1.411057, 0.3283762, 1.163754, 1, 0, 0.4745098, 1,
1.41243, -0.04956132, 0.7197418, 1, 0, 0.4666667, 1,
1.420642, 0.4805852, 0.9826297, 1, 0, 0.4627451, 1,
1.424369, -0.3457697, 1.010599, 1, 0, 0.454902, 1,
1.427343, 2.992255, 1.880836, 1, 0, 0.4509804, 1,
1.428826, -1.279801, 3.293678, 1, 0, 0.4431373, 1,
1.436171, 0.4001057, 2.026877, 1, 0, 0.4392157, 1,
1.455496, 1.557706, 1.099451, 1, 0, 0.4313726, 1,
1.462933, -0.3032374, 1.633101, 1, 0, 0.427451, 1,
1.47134, 1.121587, 1.691671, 1, 0, 0.4196078, 1,
1.485758, -0.6555688, 2.49908, 1, 0, 0.4156863, 1,
1.487457, 0.07693156, 1.631694, 1, 0, 0.4078431, 1,
1.492068, -0.4345228, -0.3723535, 1, 0, 0.4039216, 1,
1.50053, -0.6150184, 4.619253, 1, 0, 0.3960784, 1,
1.519875, -1.136319, 2.999007, 1, 0, 0.3882353, 1,
1.521836, -0.2154694, 2.774938, 1, 0, 0.3843137, 1,
1.52555, -1.192563, 1.94033, 1, 0, 0.3764706, 1,
1.530486, 1.626116, 2.620499, 1, 0, 0.372549, 1,
1.535829, -0.599905, 2.417168, 1, 0, 0.3647059, 1,
1.537422, 1.280277, 1.044229, 1, 0, 0.3607843, 1,
1.56265, 0.8165149, 1.340245, 1, 0, 0.3529412, 1,
1.563027, -0.0583252, 1.564989, 1, 0, 0.3490196, 1,
1.615523, 0.3635115, 1.721349, 1, 0, 0.3411765, 1,
1.619626, 0.1383376, 2.574127, 1, 0, 0.3372549, 1,
1.633774, 0.1029948, 0.3221773, 1, 0, 0.3294118, 1,
1.652993, -0.02651975, 1.424795, 1, 0, 0.3254902, 1,
1.656326, -0.6479363, 3.502784, 1, 0, 0.3176471, 1,
1.662734, -0.7102898, 1.449971, 1, 0, 0.3137255, 1,
1.688653, -0.5390726, 1.917907, 1, 0, 0.3058824, 1,
1.717407, -1.022068, 2.963455, 1, 0, 0.2980392, 1,
1.719535, -1.310437, 1.182823, 1, 0, 0.2941177, 1,
1.72458, 0.1875361, 1.312017, 1, 0, 0.2862745, 1,
1.727803, 0.06604663, 1.862443, 1, 0, 0.282353, 1,
1.728999, -0.7876526, 0.5493909, 1, 0, 0.2745098, 1,
1.753751, -1.02273, 1.567428, 1, 0, 0.2705882, 1,
1.758845, -1.468688, 2.489221, 1, 0, 0.2627451, 1,
1.772568, -0.1691963, 2.292002, 1, 0, 0.2588235, 1,
1.79458, 0.3611522, 2.21856, 1, 0, 0.2509804, 1,
1.862223, -0.5320743, 2.733531, 1, 0, 0.2470588, 1,
1.863844, 2.055468, 1.882605, 1, 0, 0.2392157, 1,
1.865484, 1.420663, 0.1630657, 1, 0, 0.2352941, 1,
1.883209, -1.795457, 2.16808, 1, 0, 0.227451, 1,
1.884949, 0.4183631, 2.028163, 1, 0, 0.2235294, 1,
1.901709, 0.5982214, -0.6192815, 1, 0, 0.2156863, 1,
1.9121, 0.8686551, 1.376944, 1, 0, 0.2117647, 1,
1.930486, -0.6191723, 2.021926, 1, 0, 0.2039216, 1,
1.941755, 0.5028469, 0.9136649, 1, 0, 0.1960784, 1,
1.958565, -0.4882866, 1.263853, 1, 0, 0.1921569, 1,
1.983261, -1.298876, 2.255658, 1, 0, 0.1843137, 1,
1.991305, -0.03406834, -0.6976942, 1, 0, 0.1803922, 1,
2.001026, 1.140265, 0.9316998, 1, 0, 0.172549, 1,
2.046839, -1.32228, 1.157273, 1, 0, 0.1686275, 1,
2.068563, -0.05495328, 1.660947, 1, 0, 0.1607843, 1,
2.096962, 0.02759427, 1.230167, 1, 0, 0.1568628, 1,
2.113181, -0.4795458, 1.821335, 1, 0, 0.1490196, 1,
2.198957, 0.479537, 1.806253, 1, 0, 0.145098, 1,
2.200011, 2.616973, 2.040481, 1, 0, 0.1372549, 1,
2.216258, -1.249709, 0.4913506, 1, 0, 0.1333333, 1,
2.217099, 0.3604781, 1.38988, 1, 0, 0.1254902, 1,
2.240853, 1.39286, 1.733963, 1, 0, 0.1215686, 1,
2.281571, 0.4530722, 0.5448269, 1, 0, 0.1137255, 1,
2.301973, -1.344659, 2.77624, 1, 0, 0.1098039, 1,
2.311037, -0.4107744, 1.627739, 1, 0, 0.1019608, 1,
2.31619, -0.7237062, 1.904485, 1, 0, 0.09411765, 1,
2.332141, -0.311052, 2.397853, 1, 0, 0.09019608, 1,
2.421005, 1.047803, 2.063828, 1, 0, 0.08235294, 1,
2.454076, -0.9306234, 3.092068, 1, 0, 0.07843138, 1,
2.467843, -0.1016422, 3.251937, 1, 0, 0.07058824, 1,
2.482157, -0.2741835, -0.1336171, 1, 0, 0.06666667, 1,
2.567641, -0.9274054, 1.416681, 1, 0, 0.05882353, 1,
2.652546, -0.3619162, 0.9760773, 1, 0, 0.05490196, 1,
2.671469, -0.8196909, 2.896237, 1, 0, 0.04705882, 1,
2.687899, 0.9969735, 3.648724, 1, 0, 0.04313726, 1,
2.69885, -1.301044, 1.137902, 1, 0, 0.03529412, 1,
2.72959, 0.9470333, 1.895534, 1, 0, 0.03137255, 1,
2.756075, 0.3025595, 1.775478, 1, 0, 0.02352941, 1,
2.851432, -0.3706435, 1.350403, 1, 0, 0.01960784, 1,
3.149789, -0.6423185, 0.9667995, 1, 0, 0.01176471, 1,
3.648679, -2.011301, 1.004614, 1, 0, 0.007843138, 1
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
0.3702134, -3.919236, -6.724051, 0, -0.5, 0.5, 0.5,
0.3702134, -3.919236, -6.724051, 1, -0.5, 0.5, 0.5,
0.3702134, -3.919236, -6.724051, 1, 1.5, 0.5, 0.5,
0.3702134, -3.919236, -6.724051, 0, 1.5, 0.5, 0.5
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
-4.019652, 0.03736341, -6.724051, 0, -0.5, 0.5, 0.5,
-4.019652, 0.03736341, -6.724051, 1, -0.5, 0.5, 0.5,
-4.019652, 0.03736341, -6.724051, 1, 1.5, 0.5, 0.5,
-4.019652, 0.03736341, -6.724051, 0, 1.5, 0.5, 0.5
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
-4.019652, -3.919236, 0.5550883, 0, -0.5, 0.5, 0.5,
-4.019652, -3.919236, 0.5550883, 1, -0.5, 0.5, 0.5,
-4.019652, -3.919236, 0.5550883, 1, 1.5, 0.5, 0.5,
-4.019652, -3.919236, 0.5550883, 0, 1.5, 0.5, 0.5
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
-2, -3.006175, -5.04425,
3, -3.006175, -5.04425,
-2, -3.006175, -5.04425,
-2, -3.158352, -5.324216,
-1, -3.006175, -5.04425,
-1, -3.158352, -5.324216,
0, -3.006175, -5.04425,
0, -3.158352, -5.324216,
1, -3.006175, -5.04425,
1, -3.158352, -5.324216,
2, -3.006175, -5.04425,
2, -3.158352, -5.324216,
3, -3.006175, -5.04425,
3, -3.158352, -5.324216
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
-2, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
-2, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
-2, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
-2, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5,
-1, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
-1, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
-1, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
-1, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5,
0, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
0, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
0, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
0, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5,
1, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
1, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
1, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
1, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5,
2, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
2, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
2, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
2, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5,
3, -3.462706, -5.884151, 0, -0.5, 0.5, 0.5,
3, -3.462706, -5.884151, 1, -0.5, 0.5, 0.5,
3, -3.462706, -5.884151, 1, 1.5, 0.5, 0.5,
3, -3.462706, -5.884151, 0, 1.5, 0.5, 0.5
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
-3.006606, -2, -5.04425,
-3.006606, 2, -5.04425,
-3.006606, -2, -5.04425,
-3.175447, -2, -5.324216,
-3.006606, -1, -5.04425,
-3.175447, -1, -5.324216,
-3.006606, 0, -5.04425,
-3.175447, 0, -5.324216,
-3.006606, 1, -5.04425,
-3.175447, 1, -5.324216,
-3.006606, 2, -5.04425,
-3.175447, 2, -5.324216
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
-3.513129, -2, -5.884151, 0, -0.5, 0.5, 0.5,
-3.513129, -2, -5.884151, 1, -0.5, 0.5, 0.5,
-3.513129, -2, -5.884151, 1, 1.5, 0.5, 0.5,
-3.513129, -2, -5.884151, 0, 1.5, 0.5, 0.5,
-3.513129, -1, -5.884151, 0, -0.5, 0.5, 0.5,
-3.513129, -1, -5.884151, 1, -0.5, 0.5, 0.5,
-3.513129, -1, -5.884151, 1, 1.5, 0.5, 0.5,
-3.513129, -1, -5.884151, 0, 1.5, 0.5, 0.5,
-3.513129, 0, -5.884151, 0, -0.5, 0.5, 0.5,
-3.513129, 0, -5.884151, 1, -0.5, 0.5, 0.5,
-3.513129, 0, -5.884151, 1, 1.5, 0.5, 0.5,
-3.513129, 0, -5.884151, 0, 1.5, 0.5, 0.5,
-3.513129, 1, -5.884151, 0, -0.5, 0.5, 0.5,
-3.513129, 1, -5.884151, 1, -0.5, 0.5, 0.5,
-3.513129, 1, -5.884151, 1, 1.5, 0.5, 0.5,
-3.513129, 1, -5.884151, 0, 1.5, 0.5, 0.5,
-3.513129, 2, -5.884151, 0, -0.5, 0.5, 0.5,
-3.513129, 2, -5.884151, 1, -0.5, 0.5, 0.5,
-3.513129, 2, -5.884151, 1, 1.5, 0.5, 0.5,
-3.513129, 2, -5.884151, 0, 1.5, 0.5, 0.5
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
-3.006606, -3.006175, -4,
-3.006606, -3.006175, 4,
-3.006606, -3.006175, -4,
-3.175447, -3.158352, -4,
-3.006606, -3.006175, -2,
-3.175447, -3.158352, -2,
-3.006606, -3.006175, 0,
-3.175447, -3.158352, 0,
-3.006606, -3.006175, 2,
-3.175447, -3.158352, 2,
-3.006606, -3.006175, 4,
-3.175447, -3.158352, 4
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
-3.513129, -3.462706, -4, 0, -0.5, 0.5, 0.5,
-3.513129, -3.462706, -4, 1, -0.5, 0.5, 0.5,
-3.513129, -3.462706, -4, 1, 1.5, 0.5, 0.5,
-3.513129, -3.462706, -4, 0, 1.5, 0.5, 0.5,
-3.513129, -3.462706, -2, 0, -0.5, 0.5, 0.5,
-3.513129, -3.462706, -2, 1, -0.5, 0.5, 0.5,
-3.513129, -3.462706, -2, 1, 1.5, 0.5, 0.5,
-3.513129, -3.462706, -2, 0, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 0, 0, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 0, 1, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 0, 1, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 0, 0, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 2, 0, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 2, 1, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 2, 1, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 2, 0, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 4, 0, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 4, 1, -0.5, 0.5, 0.5,
-3.513129, -3.462706, 4, 1, 1.5, 0.5, 0.5,
-3.513129, -3.462706, 4, 0, 1.5, 0.5, 0.5
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
-3.006606, -3.006175, -5.04425,
-3.006606, 3.080902, -5.04425,
-3.006606, -3.006175, 6.154426,
-3.006606, 3.080902, 6.154426,
-3.006606, -3.006175, -5.04425,
-3.006606, -3.006175, 6.154426,
-3.006606, 3.080902, -5.04425,
-3.006606, 3.080902, 6.154426,
-3.006606, -3.006175, -5.04425,
3.747033, -3.006175, -5.04425,
-3.006606, -3.006175, 6.154426,
3.747033, -3.006175, 6.154426,
-3.006606, 3.080902, -5.04425,
3.747033, 3.080902, -5.04425,
-3.006606, 3.080902, 6.154426,
3.747033, 3.080902, 6.154426,
3.747033, -3.006175, -5.04425,
3.747033, 3.080902, -5.04425,
3.747033, -3.006175, 6.154426,
3.747033, 3.080902, 6.154426,
3.747033, -3.006175, -5.04425,
3.747033, -3.006175, 6.154426,
3.747033, 3.080902, -5.04425,
3.747033, 3.080902, 6.154426
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
var radius = 7.702556;
var distance = 34.26954;
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
mvMatrix.translate( -0.3702134, -0.03736341, -0.5550883 );
mvMatrix.scale( 1.233136, 1.36817, 0.7436731 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.26954);
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
chlorpikrin<-read.table("chlorpikrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorpikrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
```

```r
y<-chlorpikrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
```

```r
z<-chlorpikrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
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
-2.908252, -0.6301932, -0.8137735, 0, 0, 1, 1, 1,
-2.754226, -0.9909654, -1.791717, 1, 0, 0, 1, 1,
-2.75294, 1.708974, 0.5173969, 1, 0, 0, 1, 1,
-2.659075, 0.1357676, 0.3189811, 1, 0, 0, 1, 1,
-2.645138, 1.578527, -1.532653, 1, 0, 0, 1, 1,
-2.531537, -0.02600181, -2.066253, 1, 0, 0, 1, 1,
-2.520532, 1.108872, -2.030199, 0, 0, 0, 1, 1,
-2.406909, 1.588345, -2.408517, 0, 0, 0, 1, 1,
-2.362297, -0.09958568, -1.507527, 0, 0, 0, 1, 1,
-2.357565, -0.7474657, -1.630801, 0, 0, 0, 1, 1,
-2.198933, -1.099732, -0.06729182, 0, 0, 0, 1, 1,
-2.180401, 0.5895804, -0.7843814, 0, 0, 0, 1, 1,
-2.173405, -0.1474037, -0.9150104, 0, 0, 0, 1, 1,
-2.150481, -1.493883, -2.863076, 1, 1, 1, 1, 1,
-2.092422, -0.7497678, -1.054846, 1, 1, 1, 1, 1,
-2.075961, -0.07548524, -0.6418555, 1, 1, 1, 1, 1,
-2.018025, 1.056786, -0.8089523, 1, 1, 1, 1, 1,
-2.005148, -0.3228263, -1.239174, 1, 1, 1, 1, 1,
-1.999009, 0.03349691, 0.361924, 1, 1, 1, 1, 1,
-1.986494, -2.063776, -2.996973, 1, 1, 1, 1, 1,
-1.976301, 1.09547, 1.007857, 1, 1, 1, 1, 1,
-1.966498, 1.3083, -0.5469578, 1, 1, 1, 1, 1,
-1.941055, 0.6003823, -0.4779369, 1, 1, 1, 1, 1,
-1.88681, -0.3581992, -1.915169, 1, 1, 1, 1, 1,
-1.870346, 0.3103145, -1.510026, 1, 1, 1, 1, 1,
-1.842216, 0.6391103, 0.1743874, 1, 1, 1, 1, 1,
-1.833615, 1.548354, -0.6308362, 1, 1, 1, 1, 1,
-1.828303, 0.5842853, -0.1375801, 1, 1, 1, 1, 1,
-1.815299, 1.626087, -0.7468632, 0, 0, 1, 1, 1,
-1.80766, -1.196817, -1.145534, 1, 0, 0, 1, 1,
-1.806367, -0.4694646, -3.600475, 1, 0, 0, 1, 1,
-1.780442, -0.6311596, -1.860774, 1, 0, 0, 1, 1,
-1.77593, 0.08413879, -0.3698641, 1, 0, 0, 1, 1,
-1.772007, -0.6052913, -1.063596, 1, 0, 0, 1, 1,
-1.768339, 1.169489, -1.118328, 0, 0, 0, 1, 1,
-1.767956, -0.3611083, -1.357078, 0, 0, 0, 1, 1,
-1.737049, 1.059564, 0.5592103, 0, 0, 0, 1, 1,
-1.726316, 0.1364027, -0.3236621, 0, 0, 0, 1, 1,
-1.711236, 1.051104, 0.05072593, 0, 0, 0, 1, 1,
-1.701946, -0.107984, -1.484032, 0, 0, 0, 1, 1,
-1.700685, 0.1734882, -1.102961, 0, 0, 0, 1, 1,
-1.691148, -1.420901, -2.035769, 1, 1, 1, 1, 1,
-1.681449, 0.6603171, -1.783692, 1, 1, 1, 1, 1,
-1.674871, -0.003899504, -1.117825, 1, 1, 1, 1, 1,
-1.662124, -1.011515, -2.628736, 1, 1, 1, 1, 1,
-1.654805, 0.3326386, -0.433359, 1, 1, 1, 1, 1,
-1.653864, -0.5965835, -1.990862, 1, 1, 1, 1, 1,
-1.644612, 2.334026, -3.731456, 1, 1, 1, 1, 1,
-1.635645, -0.3372354, -0.6120082, 1, 1, 1, 1, 1,
-1.610788, -0.3391169, -2.813743, 1, 1, 1, 1, 1,
-1.608868, -0.9495092, -1.790534, 1, 1, 1, 1, 1,
-1.607956, -2.413638, -3.01282, 1, 1, 1, 1, 1,
-1.60745, 0.1792507, 0.09022777, 1, 1, 1, 1, 1,
-1.598367, 1.708789, 1.557976, 1, 1, 1, 1, 1,
-1.594097, 0.9411052, -1.330826, 1, 1, 1, 1, 1,
-1.590041, 0.3079825, -3.991269, 1, 1, 1, 1, 1,
-1.58621, -1.284193, -2.12416, 0, 0, 1, 1, 1,
-1.575388, -0.01131132, -2.286638, 1, 0, 0, 1, 1,
-1.573188, -1.438531, -1.787473, 1, 0, 0, 1, 1,
-1.570552, 0.1705118, -1.807345, 1, 0, 0, 1, 1,
-1.568951, 2.32163, -0.01342423, 1, 0, 0, 1, 1,
-1.565343, 1.259104, -1.036448, 1, 0, 0, 1, 1,
-1.549477, -0.7430198, -2.863061, 0, 0, 0, 1, 1,
-1.536801, 0.6248152, -2.489277, 0, 0, 0, 1, 1,
-1.525192, 0.5426826, -1.861425, 0, 0, 0, 1, 1,
-1.518034, -0.04202525, -2.895104, 0, 0, 0, 1, 1,
-1.507609, 0.8513532, -0.6994185, 0, 0, 0, 1, 1,
-1.502106, 0.6891826, -2.579431, 0, 0, 0, 1, 1,
-1.501709, -0.1536901, -3.935768, 0, 0, 0, 1, 1,
-1.500701, 0.9619954, -1.804049, 1, 1, 1, 1, 1,
-1.498222, 0.5313502, -2.048953, 1, 1, 1, 1, 1,
-1.485974, -0.04565573, -0.9322045, 1, 1, 1, 1, 1,
-1.477432, 0.7988704, -1.043389, 1, 1, 1, 1, 1,
-1.451353, -0.9239162, -2.870531, 1, 1, 1, 1, 1,
-1.437021, 2.092656, -1.820535, 1, 1, 1, 1, 1,
-1.43425, 1.516807, -3.241042, 1, 1, 1, 1, 1,
-1.418655, -0.2385157, -2.636369, 1, 1, 1, 1, 1,
-1.414682, -1.317436, -0.4982467, 1, 1, 1, 1, 1,
-1.414457, -0.4389989, -2.80875, 1, 1, 1, 1, 1,
-1.392918, 1.391738, -1.967196, 1, 1, 1, 1, 1,
-1.392621, 1.071924, -1.475197, 1, 1, 1, 1, 1,
-1.388777, -0.637957, -1.016583, 1, 1, 1, 1, 1,
-1.388456, 0.6562414, 0.8651366, 1, 1, 1, 1, 1,
-1.379697, 1.019832, -1.217666, 1, 1, 1, 1, 1,
-1.351554, -0.6731803, -2.166896, 0, 0, 1, 1, 1,
-1.349325, 2.767926, -0.3178479, 1, 0, 0, 1, 1,
-1.337467, -0.299389, -0.3383289, 1, 0, 0, 1, 1,
-1.330793, 0.4329154, -2.023844, 1, 0, 0, 1, 1,
-1.329401, 0.120086, -1.736079, 1, 0, 0, 1, 1,
-1.314995, 0.2139429, -2.606854, 1, 0, 0, 1, 1,
-1.312047, 0.04205306, -1.76784, 0, 0, 0, 1, 1,
-1.307348, -0.7932705, -1.285676, 0, 0, 0, 1, 1,
-1.297876, 0.7021858, -0.7391351, 0, 0, 0, 1, 1,
-1.295076, -1.027103, -1.839129, 0, 0, 0, 1, 1,
-1.290679, -0.2571169, -0.9552869, 0, 0, 0, 1, 1,
-1.289801, -0.5995188, -0.6988289, 0, 0, 0, 1, 1,
-1.284888, -0.26416, -1.501318, 0, 0, 0, 1, 1,
-1.284428, -0.8495484, -3.965185, 1, 1, 1, 1, 1,
-1.275912, -0.4834158, -1.213798, 1, 1, 1, 1, 1,
-1.274462, -0.2169536, -0.3460592, 1, 1, 1, 1, 1,
-1.270657, 1.106133, 0.658816, 1, 1, 1, 1, 1,
-1.26842, 0.130799, 0.01082623, 1, 1, 1, 1, 1,
-1.266477, -0.950938, -0.7885284, 1, 1, 1, 1, 1,
-1.263479, 0.1379166, -2.267763, 1, 1, 1, 1, 1,
-1.26036, 1.219853, -1.748415, 1, 1, 1, 1, 1,
-1.256964, 0.02377775, -0.7014518, 1, 1, 1, 1, 1,
-1.25387, 0.3820055, -1.499778, 1, 1, 1, 1, 1,
-1.251894, -0.9784089, -2.51056, 1, 1, 1, 1, 1,
-1.247092, 0.9949743, 0.2089472, 1, 1, 1, 1, 1,
-1.238142, 0.4226602, -1.794316, 1, 1, 1, 1, 1,
-1.228831, 1.539464, -1.909037, 1, 1, 1, 1, 1,
-1.22082, -1.089307, -4.017512, 1, 1, 1, 1, 1,
-1.198734, -0.9236041, -3.395834, 0, 0, 1, 1, 1,
-1.196048, -1.309833, -2.375681, 1, 0, 0, 1, 1,
-1.195255, 0.4639536, -0.2836326, 1, 0, 0, 1, 1,
-1.193196, 1.470856, -1.537907, 1, 0, 0, 1, 1,
-1.187046, 1.838722, 0.2197719, 1, 0, 0, 1, 1,
-1.178334, -1.494681, -3.179688, 1, 0, 0, 1, 1,
-1.172387, -0.4140959, -2.76608, 0, 0, 0, 1, 1,
-1.171802, -1.943953, -1.859568, 0, 0, 0, 1, 1,
-1.169562, -0.4958559, -2.258108, 0, 0, 0, 1, 1,
-1.162843, -0.442626, -0.6838219, 0, 0, 0, 1, 1,
-1.161838, -0.48667, -2.22583, 0, 0, 0, 1, 1,
-1.151417, 0.1664989, -0.8425978, 0, 0, 0, 1, 1,
-1.150908, 0.8832195, 0.05264414, 0, 0, 0, 1, 1,
-1.149801, 0.5451032, -0.138264, 1, 1, 1, 1, 1,
-1.144746, 1.454483, -0.1130304, 1, 1, 1, 1, 1,
-1.142572, -0.8257194, -3.214454, 1, 1, 1, 1, 1,
-1.135082, 0.5482688, -2.538229, 1, 1, 1, 1, 1,
-1.134347, -0.3180167, -0.2531041, 1, 1, 1, 1, 1,
-1.13312, 1.189548, -0.3550731, 1, 1, 1, 1, 1,
-1.124612, -0.7846779, -3.246554, 1, 1, 1, 1, 1,
-1.124176, 0.6479099, -0.1400221, 1, 1, 1, 1, 1,
-1.123754, -0.8181766, -2.633604, 1, 1, 1, 1, 1,
-1.120777, -1.747236, -0.7239281, 1, 1, 1, 1, 1,
-1.118623, -0.3476478, -2.521449, 1, 1, 1, 1, 1,
-1.11786, 0.4104492, -1.306046, 1, 1, 1, 1, 1,
-1.109813, 0.7826363, -2.383152, 1, 1, 1, 1, 1,
-1.096889, 0.3580812, -1.715873, 1, 1, 1, 1, 1,
-1.096702, 0.6317701, -1.899252, 1, 1, 1, 1, 1,
-1.091325, -1.57238, -3.039228, 0, 0, 1, 1, 1,
-1.082195, -1.147237, -1.933595, 1, 0, 0, 1, 1,
-1.068666, 0.6587291, -0.1565448, 1, 0, 0, 1, 1,
-1.068258, -0.1351534, -0.5476227, 1, 0, 0, 1, 1,
-1.064295, 0.2832654, -1.520733, 1, 0, 0, 1, 1,
-1.055652, -0.967849, -2.424664, 1, 0, 0, 1, 1,
-1.054325, 1.791875, -0.8278504, 0, 0, 0, 1, 1,
-1.052945, 1.490881, -0.05861917, 0, 0, 0, 1, 1,
-1.052436, 0.2650009, -1.088263, 0, 0, 0, 1, 1,
-1.050827, 1.304946, 0.6462827, 0, 0, 0, 1, 1,
-1.050701, -0.0543685, -2.470243, 0, 0, 0, 1, 1,
-1.047754, -1.360888, -3.24115, 0, 0, 0, 1, 1,
-1.046825, -1.523958, -1.890032, 0, 0, 0, 1, 1,
-1.039785, -1.176861, -2.967134, 1, 1, 1, 1, 1,
-1.033808, 1.196471, -1.069019, 1, 1, 1, 1, 1,
-1.032368, 0.07898249, -2.75141, 1, 1, 1, 1, 1,
-1.027444, -0.2290825, -2.374302, 1, 1, 1, 1, 1,
-1.024584, 1.264214, 0.3006955, 1, 1, 1, 1, 1,
-1.023185, 0.2522485, -1.525844, 1, 1, 1, 1, 1,
-1.019843, 0.2471156, -0.5539691, 1, 1, 1, 1, 1,
-1.01791, -0.6388588, -1.554425, 1, 1, 1, 1, 1,
-1.016507, 0.5721232, -0.3599967, 1, 1, 1, 1, 1,
-1.014038, -0.3107246, -1.194674, 1, 1, 1, 1, 1,
-1.011897, -0.1338452, -1.365163, 1, 1, 1, 1, 1,
-1.011494, -0.2088951, -2.493528, 1, 1, 1, 1, 1,
-1.008558, -1.129492, -2.047272, 1, 1, 1, 1, 1,
-1.00318, -0.2261458, -3.859541, 1, 1, 1, 1, 1,
-1.00042, 1.228233, -0.3010875, 1, 1, 1, 1, 1,
-0.9961997, 0.8950451, -0.7121792, 0, 0, 1, 1, 1,
-0.9950508, -0.4736361, -2.490948, 1, 0, 0, 1, 1,
-0.9886286, 0.2099341, -2.300957, 1, 0, 0, 1, 1,
-0.9723062, 1.030711, -1.421282, 1, 0, 0, 1, 1,
-0.9703563, 0.3742703, 0.2097299, 1, 0, 0, 1, 1,
-0.965753, -0.3069736, -4.002131, 1, 0, 0, 1, 1,
-0.9620575, 0.2915154, -3.267948, 0, 0, 0, 1, 1,
-0.9610848, -0.37401, -2.689533, 0, 0, 0, 1, 1,
-0.9564376, 0.9106521, 0.8716577, 0, 0, 0, 1, 1,
-0.9466925, 0.4115808, -0.722048, 0, 0, 0, 1, 1,
-0.9439288, -0.7227944, -1.780624, 0, 0, 0, 1, 1,
-0.9380125, -2.366248, -2.005756, 0, 0, 0, 1, 1,
-0.935106, 0.3740298, -0.7251256, 0, 0, 0, 1, 1,
-0.9350752, -0.2752702, -2.325749, 1, 1, 1, 1, 1,
-0.9304315, -0.3606134, -2.402266, 1, 1, 1, 1, 1,
-0.9286339, 0.1762096, -1.163386, 1, 1, 1, 1, 1,
-0.9248943, 1.157783, -2.982935, 1, 1, 1, 1, 1,
-0.9243568, -0.942387, -3.00034, 1, 1, 1, 1, 1,
-0.9208531, 1.918699, 0.2130133, 1, 1, 1, 1, 1,
-0.9138586, -0.4098099, -3.286739, 1, 1, 1, 1, 1,
-0.9126749, -0.2420192, -3.699366, 1, 1, 1, 1, 1,
-0.9090382, 0.6819423, -1.531744, 1, 1, 1, 1, 1,
-0.9069334, -0.1053531, -2.710698, 1, 1, 1, 1, 1,
-0.9068493, 0.9500597, -2.184922, 1, 1, 1, 1, 1,
-0.9066908, 0.02081479, -1.64405, 1, 1, 1, 1, 1,
-0.9062349, 1.280112, -1.894368, 1, 1, 1, 1, 1,
-0.9026269, 0.6734617, -2.807876, 1, 1, 1, 1, 1,
-0.8969309, -0.3637523, 0.7467641, 1, 1, 1, 1, 1,
-0.896191, -0.9954678, -1.724491, 0, 0, 1, 1, 1,
-0.8924863, 0.05663934, -1.361453, 1, 0, 0, 1, 1,
-0.8890173, -1.570098, -2.318675, 1, 0, 0, 1, 1,
-0.8883188, -0.8285156, -3.458379, 1, 0, 0, 1, 1,
-0.8875918, -1.002787, -1.812952, 1, 0, 0, 1, 1,
-0.88627, 1.03126, 0.2450823, 1, 0, 0, 1, 1,
-0.8858042, 1.360823, -0.3408743, 0, 0, 0, 1, 1,
-0.8839041, -0.5373768, -3.100158, 0, 0, 0, 1, 1,
-0.8753456, -0.1789204, -2.884939, 0, 0, 0, 1, 1,
-0.8718197, -2.917528, -3.51919, 0, 0, 0, 1, 1,
-0.8717315, -1.756767, -3.702404, 0, 0, 0, 1, 1,
-0.8589528, 0.09282421, -0.01037239, 0, 0, 0, 1, 1,
-0.8571292, -0.736586, -4.347033, 0, 0, 0, 1, 1,
-0.8535792, 2.248509, 0.7280181, 1, 1, 1, 1, 1,
-0.8501832, 0.07646568, -1.217664, 1, 1, 1, 1, 1,
-0.8498554, 1.482291, -1.40523, 1, 1, 1, 1, 1,
-0.8489591, -0.05316959, -0.9019972, 1, 1, 1, 1, 1,
-0.8482531, -0.5734306, -1.187922, 1, 1, 1, 1, 1,
-0.8415092, -0.1497944, -2.024888, 1, 1, 1, 1, 1,
-0.8393475, 0.3981684, 0.5176645, 1, 1, 1, 1, 1,
-0.839315, 1.233933, 0.1043665, 1, 1, 1, 1, 1,
-0.8350853, -0.5635658, -3.418236, 1, 1, 1, 1, 1,
-0.812017, 2.815096, 1.216059, 1, 1, 1, 1, 1,
-0.8116947, -0.5530652, -3.778098, 1, 1, 1, 1, 1,
-0.8034756, 0.7901318, 0.2009531, 1, 1, 1, 1, 1,
-0.7998082, 0.1092239, 0.4192852, 1, 1, 1, 1, 1,
-0.7973441, 0.3630122, -1.059566, 1, 1, 1, 1, 1,
-0.7936142, 0.6637989, -0.2025943, 1, 1, 1, 1, 1,
-0.7934921, -0.4448237, -2.626537, 0, 0, 1, 1, 1,
-0.7915704, 0.134865, -2.641802, 1, 0, 0, 1, 1,
-0.7852499, -1.136608, -1.395848, 1, 0, 0, 1, 1,
-0.7828892, -2.860891, -2.076071, 1, 0, 0, 1, 1,
-0.7823886, 0.7989367, 0.2785622, 1, 0, 0, 1, 1,
-0.7783544, 0.8360318, -1.750051, 1, 0, 0, 1, 1,
-0.7722143, -0.4930564, -2.189511, 0, 0, 0, 1, 1,
-0.7656901, -0.6625692, -1.350232, 0, 0, 0, 1, 1,
-0.7644803, 0.348192, -1.404247, 0, 0, 0, 1, 1,
-0.7548986, -1.307859, -1.726465, 0, 0, 0, 1, 1,
-0.7548906, 2.000185, -1.730469, 0, 0, 0, 1, 1,
-0.7499697, -0.1695008, -0.7731993, 0, 0, 0, 1, 1,
-0.7412814, -0.8782599, -1.768981, 0, 0, 0, 1, 1,
-0.7408982, 1.889764, -1.703001, 1, 1, 1, 1, 1,
-0.7406184, 0.637125, -0.9937443, 1, 1, 1, 1, 1,
-0.7390257, -1.021248, -2.943372, 1, 1, 1, 1, 1,
-0.7374572, 0.3278574, -0.4932581, 1, 1, 1, 1, 1,
-0.7365512, -0.291673, -3.466971, 1, 1, 1, 1, 1,
-0.7323837, -0.3519807, -1.50658, 1, 1, 1, 1, 1,
-0.7253698, -1.163531, -2.792965, 1, 1, 1, 1, 1,
-0.7253245, -0.7317132, -2.616974, 1, 1, 1, 1, 1,
-0.725313, 0.7533453, -2.246189, 1, 1, 1, 1, 1,
-0.7214289, 0.3765381, 0.359548, 1, 1, 1, 1, 1,
-0.7177685, -0.7821828, -1.799758, 1, 1, 1, 1, 1,
-0.7175422, -1.378599, -4.154778, 1, 1, 1, 1, 1,
-0.7171535, 0.3274406, -0.8762734, 1, 1, 1, 1, 1,
-0.709933, -0.3534763, -2.576327, 1, 1, 1, 1, 1,
-0.7032276, -0.8773408, -2.563806, 1, 1, 1, 1, 1,
-0.7012227, -0.9401546, -1.680345, 0, 0, 1, 1, 1,
-0.6931463, 1.615697, 1.556997, 1, 0, 0, 1, 1,
-0.684625, 1.222413, 0.8230451, 1, 0, 0, 1, 1,
-0.6644585, 1.512775, -0.3669628, 1, 0, 0, 1, 1,
-0.6632557, -0.4072854, -2.595231, 1, 0, 0, 1, 1,
-0.6631339, 1.248234, -0.847812, 1, 0, 0, 1, 1,
-0.659909, 0.6200817, -0.1602326, 0, 0, 0, 1, 1,
-0.6594217, -0.6180944, -1.409256, 0, 0, 0, 1, 1,
-0.6544688, -0.3565388, -2.839769, 0, 0, 0, 1, 1,
-0.6495456, 0.6270548, 0.07669406, 0, 0, 0, 1, 1,
-0.647904, 0.2042557, 0.6531665, 0, 0, 0, 1, 1,
-0.6387208, -0.2013631, -3.186825, 0, 0, 0, 1, 1,
-0.625805, 0.005818016, -1.44889, 0, 0, 0, 1, 1,
-0.6255941, 1.090199, -0.8660679, 1, 1, 1, 1, 1,
-0.6235383, -0.02757515, -2.167588, 1, 1, 1, 1, 1,
-0.6193216, -0.9361716, -1.430712, 1, 1, 1, 1, 1,
-0.6050835, 0.2928953, -1.5373, 1, 1, 1, 1, 1,
-0.5972318, 0.425116, -1.485227, 1, 1, 1, 1, 1,
-0.5960683, 0.4623354, -0.1921731, 1, 1, 1, 1, 1,
-0.5910305, -1.15269, -3.676888, 1, 1, 1, 1, 1,
-0.5908951, 1.281709, -0.4248042, 1, 1, 1, 1, 1,
-0.5875638, 0.8401035, 0.1943168, 1, 1, 1, 1, 1,
-0.5868554, 0.5786903, -0.8840286, 1, 1, 1, 1, 1,
-0.5803468, 0.1015526, -1.917028, 1, 1, 1, 1, 1,
-0.5759255, 2.394473, -0.3245784, 1, 1, 1, 1, 1,
-0.5756465, -1.319642, -3.350015, 1, 1, 1, 1, 1,
-0.5720432, 1.337525, -1.848539, 1, 1, 1, 1, 1,
-0.5687969, -0.4176902, -1.840322, 1, 1, 1, 1, 1,
-0.558567, -0.182457, -1.167909, 0, 0, 1, 1, 1,
-0.5579297, -1.897463, -3.919426, 1, 0, 0, 1, 1,
-0.5541626, -0.9110942, -3.637337, 1, 0, 0, 1, 1,
-0.547901, 0.3787467, -3.737154, 1, 0, 0, 1, 1,
-0.5476403, -1.294283, -2.506008, 1, 0, 0, 1, 1,
-0.5441846, -0.4642408, -0.4333465, 1, 0, 0, 1, 1,
-0.5394155, 1.063981, -0.4604335, 0, 0, 0, 1, 1,
-0.537164, 1.745445, -0.4461956, 0, 0, 0, 1, 1,
-0.5361013, 0.283463, -1.985371, 0, 0, 0, 1, 1,
-0.5308198, 0.971965, -1.190136, 0, 0, 0, 1, 1,
-0.5300204, 0.7111022, -0.8948191, 0, 0, 0, 1, 1,
-0.5245398, -0.4491226, -2.827636, 0, 0, 0, 1, 1,
-0.5164635, 0.7175213, -0.9298337, 0, 0, 0, 1, 1,
-0.5126513, 2.191012, 0.5922611, 1, 1, 1, 1, 1,
-0.5125591, 0.3650182, -0.7620778, 1, 1, 1, 1, 1,
-0.5102364, -1.240295, -3.521801, 1, 1, 1, 1, 1,
-0.5101608, 2.418737, -0.6579669, 1, 1, 1, 1, 1,
-0.5097431, -1.11337, -1.109966, 1, 1, 1, 1, 1,
-0.5015182, -0.8493469, -3.183698, 1, 1, 1, 1, 1,
-0.5011299, -0.4903097, -1.428857, 1, 1, 1, 1, 1,
-0.5011272, 0.9887427, -1.998659, 1, 1, 1, 1, 1,
-0.5000307, -0.09396967, -0.4356703, 1, 1, 1, 1, 1,
-0.4999398, -1.694528, -4.440865, 1, 1, 1, 1, 1,
-0.4974307, -0.1360087, -3.292048, 1, 1, 1, 1, 1,
-0.4960389, -0.3096058, -2.660815, 1, 1, 1, 1, 1,
-0.4933999, 1.009028, -0.8320771, 1, 1, 1, 1, 1,
-0.4930214, 0.6577584, -2.141298, 1, 1, 1, 1, 1,
-0.4912912, -0.8383296, -2.44804, 1, 1, 1, 1, 1,
-0.4888544, 0.3305383, 0.127352, 0, 0, 1, 1, 1,
-0.4846466, 0.2591338, -1.257833, 1, 0, 0, 1, 1,
-0.4812881, -0.9453071, -3.359354, 1, 0, 0, 1, 1,
-0.4803267, -0.4741163, -2.749665, 1, 0, 0, 1, 1,
-0.4744542, 0.4722447, -0.581633, 1, 0, 0, 1, 1,
-0.4724332, -0.6588677, -4.014446, 1, 0, 0, 1, 1,
-0.4722531, -0.1543951, -2.292553, 0, 0, 0, 1, 1,
-0.4715773, 0.2477756, -1.656573, 0, 0, 0, 1, 1,
-0.4700843, 0.3187832, -0.3737988, 0, 0, 0, 1, 1,
-0.4694256, 1.511028, -1.580346, 0, 0, 0, 1, 1,
-0.4620352, 1.553485, -1.539488, 0, 0, 0, 1, 1,
-0.4578212, 1.747171, 0.5887845, 0, 0, 0, 1, 1,
-0.4570278, 0.5993308, -2.308595, 0, 0, 0, 1, 1,
-0.4518145, -0.906835, -3.181944, 1, 1, 1, 1, 1,
-0.4515161, -0.190953, -2.407471, 1, 1, 1, 1, 1,
-0.4489961, 1.493692, -1.238444, 1, 1, 1, 1, 1,
-0.4444247, 1.86576, -0.9378536, 1, 1, 1, 1, 1,
-0.4425989, 0.4450734, -0.6131806, 1, 1, 1, 1, 1,
-0.4418921, 1.903999, 2.40873, 1, 1, 1, 1, 1,
-0.4404589, 1.947676, -1.909061, 1, 1, 1, 1, 1,
-0.4354751, 0.4303985, -1.718598, 1, 1, 1, 1, 1,
-0.4316444, 0.6016838, -2.265053, 1, 1, 1, 1, 1,
-0.4278583, -0.980111, -3.086646, 1, 1, 1, 1, 1,
-0.4263338, -0.5551074, -3.26353, 1, 1, 1, 1, 1,
-0.4244472, 1.576377, 0.4307686, 1, 1, 1, 1, 1,
-0.4232912, -0.3617215, -4.253613, 1, 1, 1, 1, 1,
-0.4231954, -0.5273304, -4.60215, 1, 1, 1, 1, 1,
-0.4183577, -0.5106714, -2.294909, 1, 1, 1, 1, 1,
-0.4100436, 0.7958038, -0.2589763, 0, 0, 1, 1, 1,
-0.4091723, -0.11584, -1.487945, 1, 0, 0, 1, 1,
-0.4091547, -1.019356, -2.093484, 1, 0, 0, 1, 1,
-0.4079815, -0.01278274, -2.168456, 1, 0, 0, 1, 1,
-0.4034035, 0.9283705, -0.8531874, 1, 0, 0, 1, 1,
-0.39844, -0.5264445, -1.525916, 1, 0, 0, 1, 1,
-0.3945806, -0.4466384, -1.423991, 0, 0, 0, 1, 1,
-0.3839469, 0.3523059, 0.3396088, 0, 0, 0, 1, 1,
-0.3799486, -1.157963, -3.413054, 0, 0, 0, 1, 1,
-0.3791805, -0.005689302, -1.70878, 0, 0, 0, 1, 1,
-0.3787047, 0.4524649, -1.964123, 0, 0, 0, 1, 1,
-0.3761581, 0.5362108, -0.6826555, 0, 0, 0, 1, 1,
-0.3734279, 0.768669, -0.8363408, 0, 0, 0, 1, 1,
-0.3720688, 1.868392, -1.636249, 1, 1, 1, 1, 1,
-0.3675715, 1.551486, 0.8250232, 1, 1, 1, 1, 1,
-0.3666744, -0.5050558, -2.851827, 1, 1, 1, 1, 1,
-0.3652449, 0.558789, 0.06336219, 1, 1, 1, 1, 1,
-0.3637218, -0.0547125, -0.09801775, 1, 1, 1, 1, 1,
-0.3555236, 1.165193, 0.08053222, 1, 1, 1, 1, 1,
-0.3544635, -1.330947, -2.476343, 1, 1, 1, 1, 1,
-0.35203, 0.5921301, -1.156814, 1, 1, 1, 1, 1,
-0.3466543, 1.861809, 1.189178, 1, 1, 1, 1, 1,
-0.3461307, 0.7876691, 0.3932284, 1, 1, 1, 1, 1,
-0.3399875, 0.7473233, 2.099703, 1, 1, 1, 1, 1,
-0.3359469, -1.52022, -3.398105, 1, 1, 1, 1, 1,
-0.329296, 0.02145484, -2.110063, 1, 1, 1, 1, 1,
-0.3292001, 0.6150367, 0.05080629, 1, 1, 1, 1, 1,
-0.3239866, 0.8626799, -0.6532196, 1, 1, 1, 1, 1,
-0.322721, 0.4840946, 0.09518227, 0, 0, 1, 1, 1,
-0.3167933, -0.6498201, -2.206491, 1, 0, 0, 1, 1,
-0.309704, 1.876495, -0.8346398, 1, 0, 0, 1, 1,
-0.3090422, 1.197726, 1.691511, 1, 0, 0, 1, 1,
-0.3061228, 0.7603418, -1.227878, 1, 0, 0, 1, 1,
-0.3037334, 0.1904435, -0.741318, 1, 0, 0, 1, 1,
-0.3021953, -0.9802527, -3.145649, 0, 0, 0, 1, 1,
-0.299774, 0.5335106, -1.599944, 0, 0, 0, 1, 1,
-0.2990991, 0.8153604, -0.9291866, 0, 0, 0, 1, 1,
-0.294763, -1.970712, -4.881162, 0, 0, 0, 1, 1,
-0.2926215, 0.9169673, -0.2284892, 0, 0, 0, 1, 1,
-0.2918593, 0.1860785, -1.431066, 0, 0, 0, 1, 1,
-0.2918397, -0.1260288, -2.690542, 0, 0, 0, 1, 1,
-0.286162, -1.210433, -3.417728, 1, 1, 1, 1, 1,
-0.2811139, 1.254238, -1.718751, 1, 1, 1, 1, 1,
-0.2808048, -0.4185277, -1.622278, 1, 1, 1, 1, 1,
-0.2790134, -1.197926, -2.120855, 1, 1, 1, 1, 1,
-0.270214, 1.469544, -0.09408521, 1, 1, 1, 1, 1,
-0.266216, 0.0373477, -2.055371, 1, 1, 1, 1, 1,
-0.2635079, 0.6831045, -1.116289, 1, 1, 1, 1, 1,
-0.2613441, -0.1879357, -1.602698, 1, 1, 1, 1, 1,
-0.2608273, 0.6554432, -2.619107, 1, 1, 1, 1, 1,
-0.2542846, 0.232057, 0.9688253, 1, 1, 1, 1, 1,
-0.2512306, 0.1961574, -1.958575, 1, 1, 1, 1, 1,
-0.2420359, -0.9041652, -3.225326, 1, 1, 1, 1, 1,
-0.2398527, 2.415958, 2.165298, 1, 1, 1, 1, 1,
-0.239117, -0.804151, -2.361636, 1, 1, 1, 1, 1,
-0.2377279, 1.205315, 0.4711421, 1, 1, 1, 1, 1,
-0.2320962, 0.9032518, -0.593395, 0, 0, 1, 1, 1,
-0.2296173, -0.7875243, -1.943124, 1, 0, 0, 1, 1,
-0.2267402, -1.035383, -2.91758, 1, 0, 0, 1, 1,
-0.2227125, -2.803919, -3.106931, 1, 0, 0, 1, 1,
-0.2184763, -0.1699943, -2.90946, 1, 0, 0, 1, 1,
-0.2181976, -1.515953, -3.041032, 1, 0, 0, 1, 1,
-0.2083616, 0.3204668, -2.380595, 0, 0, 0, 1, 1,
-0.2069642, 0.9186801, 0.4776318, 0, 0, 0, 1, 1,
-0.2028626, -0.1278706, -3.91276, 0, 0, 0, 1, 1,
-0.1992247, -1.381387, -4.425048, 0, 0, 0, 1, 1,
-0.1968761, -1.98004, -2.846646, 0, 0, 0, 1, 1,
-0.1957592, 0.1914825, -1.282752, 0, 0, 0, 1, 1,
-0.1955853, 0.4057006, -0.4205245, 0, 0, 0, 1, 1,
-0.1930212, 1.157343, -0.7556365, 1, 1, 1, 1, 1,
-0.192762, -0.1941818, -2.177994, 1, 1, 1, 1, 1,
-0.1917926, 0.1209849, 1.521885, 1, 1, 1, 1, 1,
-0.1915682, -0.3900416, -3.363505, 1, 1, 1, 1, 1,
-0.1901107, 0.7358214, 1.068391, 1, 1, 1, 1, 1,
-0.1890591, 0.6338033, -1.194218, 1, 1, 1, 1, 1,
-0.1855294, 2.289774, 0.6511507, 1, 1, 1, 1, 1,
-0.1842621, 1.452001, 0.4160547, 1, 1, 1, 1, 1,
-0.1836358, -1.636406, -2.730503, 1, 1, 1, 1, 1,
-0.1782047, 0.02742039, -1.542314, 1, 1, 1, 1, 1,
-0.1769698, 0.2435254, 0.135453, 1, 1, 1, 1, 1,
-0.1755774, -0.7435562, -2.471392, 1, 1, 1, 1, 1,
-0.1744441, -0.8625377, -2.609689, 1, 1, 1, 1, 1,
-0.1729805, 0.5180793, 0.8144839, 1, 1, 1, 1, 1,
-0.1715242, -2.463007, -1.701757, 1, 1, 1, 1, 1,
-0.1706966, 0.3069954, -1.243518, 0, 0, 1, 1, 1,
-0.1635069, -0.1711515, -4.037849, 1, 0, 0, 1, 1,
-0.1592187, -0.3679187, -3.113852, 1, 0, 0, 1, 1,
-0.1591032, 0.413346, -0.6993202, 1, 0, 0, 1, 1,
-0.1588141, -1.283831, -3.332092, 1, 0, 0, 1, 1,
-0.1575222, 1.485695, -0.3285166, 1, 0, 0, 1, 1,
-0.1559081, -0.4680447, -4.503433, 0, 0, 0, 1, 1,
-0.1552771, -0.9232423, -1.709135, 0, 0, 0, 1, 1,
-0.1528412, -0.2113765, -2.47835, 0, 0, 0, 1, 1,
-0.1480273, 0.668046, 0.4620148, 0, 0, 0, 1, 1,
-0.1465536, -0.8385565, -3.8905, 0, 0, 0, 1, 1,
-0.1430805, -0.6813918, -2.195279, 0, 0, 0, 1, 1,
-0.1425929, -0.7687913, -3.324152, 0, 0, 0, 1, 1,
-0.1421303, 0.1339023, 0.5454254, 1, 1, 1, 1, 1,
-0.1399194, 2.159206, 0.7384217, 1, 1, 1, 1, 1,
-0.139363, 0.2261795, -0.4706686, 1, 1, 1, 1, 1,
-0.1392024, 0.2122021, 2.400094, 1, 1, 1, 1, 1,
-0.1346041, 1.331409, 1.381238, 1, 1, 1, 1, 1,
-0.1269344, -0.3218348, -2.355212, 1, 1, 1, 1, 1,
-0.1254198, 1.581896, 0.4466506, 1, 1, 1, 1, 1,
-0.1248185, 1.78727, 0.5867351, 1, 1, 1, 1, 1,
-0.1220197, 0.1270843, -0.9495723, 1, 1, 1, 1, 1,
-0.1136876, -0.8491547, -1.33313, 1, 1, 1, 1, 1,
-0.1133672, -0.362248, -1.637645, 1, 1, 1, 1, 1,
-0.1124466, -0.9000397, -1.992502, 1, 1, 1, 1, 1,
-0.112276, 0.2833208, 0.3071223, 1, 1, 1, 1, 1,
-0.1122556, -0.787082, -3.357747, 1, 1, 1, 1, 1,
-0.1120598, 0.6103452, -1.585449, 1, 1, 1, 1, 1,
-0.1102834, -1.975601, -3.229742, 0, 0, 1, 1, 1,
-0.10971, -0.9723709, -3.59458, 1, 0, 0, 1, 1,
-0.1093865, -0.37151, -2.575156, 1, 0, 0, 1, 1,
-0.1092118, 1.310311, -0.4447908, 1, 0, 0, 1, 1,
-0.1082828, 0.4293004, -1.659027, 1, 0, 0, 1, 1,
-0.1076478, 0.63604, -0.5364119, 1, 0, 0, 1, 1,
-0.1049579, -0.750316, -4.605559, 0, 0, 0, 1, 1,
-0.1034914, 1.353525, -1.872092, 0, 0, 0, 1, 1,
-0.09883118, 0.2421522, 0.3697969, 0, 0, 0, 1, 1,
-0.09722143, -0.926731, -3.094899, 0, 0, 0, 1, 1,
-0.0952604, -0.500648, -1.464412, 0, 0, 0, 1, 1,
-0.09449331, -0.5888398, -1.791159, 0, 0, 0, 1, 1,
-0.09163683, 0.9723181, -0.41065, 0, 0, 0, 1, 1,
-0.08750679, -0.07830181, -1.406882, 1, 1, 1, 1, 1,
-0.08420607, -0.4198314, -3.617753, 1, 1, 1, 1, 1,
-0.08404159, 0.3119707, 0.05825559, 1, 1, 1, 1, 1,
-0.07997013, 0.9220706, -0.6707736, 1, 1, 1, 1, 1,
-0.07985376, 1.249057, 0.2206487, 1, 1, 1, 1, 1,
-0.07848758, 1.451665, 0.2010279, 1, 1, 1, 1, 1,
-0.07239761, 0.8534019, -0.008097755, 1, 1, 1, 1, 1,
-0.05874221, -0.2496033, -2.454187, 1, 1, 1, 1, 1,
-0.05866537, -1.35347, -2.416247, 1, 1, 1, 1, 1,
-0.05725641, 1.376576, -1.040271, 1, 1, 1, 1, 1,
-0.05186997, 1.805408, 0.5327476, 1, 1, 1, 1, 1,
-0.04501213, 0.03368954, -1.130265, 1, 1, 1, 1, 1,
-0.03956605, 0.8640771, 0.08587242, 1, 1, 1, 1, 1,
-0.03919392, -0.3544514, -2.807525, 1, 1, 1, 1, 1,
-0.03759813, 1.989918, 0.4324109, 1, 1, 1, 1, 1,
-0.03438219, 0.1893769, -0.8111243, 0, 0, 1, 1, 1,
-0.03156206, 0.1280102, 0.3827227, 1, 0, 0, 1, 1,
-0.02867232, 0.8125828, -0.6802047, 1, 0, 0, 1, 1,
-0.02410665, -1.240923, -2.207485, 1, 0, 0, 1, 1,
-0.02408622, -1.740812, -3.855456, 1, 0, 0, 1, 1,
-0.02198041, -0.376586, -3.19849, 1, 0, 0, 1, 1,
-0.01424216, -0.6778313, -3.840103, 0, 0, 0, 1, 1,
-0.01410076, -0.734625, -3.951462, 0, 0, 0, 1, 1,
-0.01398243, -0.02035357, -2.077268, 0, 0, 0, 1, 1,
-0.0135995, -1.275872, -3.177757, 0, 0, 0, 1, 1,
-0.0115427, -0.4419216, -3.541026, 0, 0, 0, 1, 1,
-0.00987762, -0.4763134, -4.740857, 0, 0, 0, 1, 1,
-0.009786354, 0.9863803, -1.689571, 0, 0, 0, 1, 1,
-0.009268847, 1.272512, 0.4536423, 1, 1, 1, 1, 1,
-0.008343596, -0.1784534, -2.035818, 1, 1, 1, 1, 1,
-0.005115706, 1.450649, 0.271093, 1, 1, 1, 1, 1,
-0.003298479, 2.285945, 1.212956, 1, 1, 1, 1, 1,
-0.00288276, -0.3487343, -1.500687, 1, 1, 1, 1, 1,
-0.001469665, -0.2968879, -3.78108, 1, 1, 1, 1, 1,
-8.16577e-05, 1.194854, -0.7961825, 1, 1, 1, 1, 1,
0.0008317324, 0.1527622, -0.5060645, 1, 1, 1, 1, 1,
0.003534538, -1.021022, 3.447093, 1, 1, 1, 1, 1,
0.003717766, -0.3347423, 2.868302, 1, 1, 1, 1, 1,
0.006095779, -0.6676157, 3.642586, 1, 1, 1, 1, 1,
0.009444528, 1.005127, 1.17332, 1, 1, 1, 1, 1,
0.01355008, 0.5801497, 1.615558, 1, 1, 1, 1, 1,
0.01677757, -1.626546, 1.880414, 1, 1, 1, 1, 1,
0.01739954, -0.5919597, 3.458907, 1, 1, 1, 1, 1,
0.01740843, 0.171936, 1.097789, 0, 0, 1, 1, 1,
0.01924706, -1.641823, 3.240083, 1, 0, 0, 1, 1,
0.02545987, 0.3405601, -0.713084, 1, 0, 0, 1, 1,
0.03283306, 1.036628, 0.3365779, 1, 0, 0, 1, 1,
0.03457944, 1.321469, 1.032076, 1, 0, 0, 1, 1,
0.04022793, 0.35206, 0.4711735, 1, 0, 0, 1, 1,
0.04027071, 1.298437, -0.7399292, 0, 0, 0, 1, 1,
0.04179595, -1.791305, 3.353775, 0, 0, 0, 1, 1,
0.04313603, -0.8189289, 3.848594, 0, 0, 0, 1, 1,
0.04585913, -0.09284089, 2.110514, 0, 0, 0, 1, 1,
0.04942782, 0.183185, -0.1340813, 0, 0, 0, 1, 1,
0.0497949, 0.7468129, 1.872438, 0, 0, 0, 1, 1,
0.0503807, -1.968984, 3.019952, 0, 0, 0, 1, 1,
0.05078921, -0.03951682, 1.304654, 1, 1, 1, 1, 1,
0.05341652, -1.090628, 3.052893, 1, 1, 1, 1, 1,
0.0547407, -0.5681233, 3.855242, 1, 1, 1, 1, 1,
0.0565558, 1.467212, 1.216607, 1, 1, 1, 1, 1,
0.05801169, 0.531875, 0.5350312, 1, 1, 1, 1, 1,
0.05984835, -1.00119, 3.518453, 1, 1, 1, 1, 1,
0.06829055, -1.236369, 4.530329, 1, 1, 1, 1, 1,
0.06907878, -0.6465439, 2.774694, 1, 1, 1, 1, 1,
0.06947544, -1.475863, 2.364337, 1, 1, 1, 1, 1,
0.07024553, -0.8539619, 3.533196, 1, 1, 1, 1, 1,
0.07311826, -1.100584, 3.523349, 1, 1, 1, 1, 1,
0.07429213, -0.9579442, 3.020449, 1, 1, 1, 1, 1,
0.07789595, -0.178629, 3.136211, 1, 1, 1, 1, 1,
0.08238025, 1.265592, 0.2031121, 1, 1, 1, 1, 1,
0.08544761, 0.1064835, 1.269854, 1, 1, 1, 1, 1,
0.087009, -0.8947545, 3.949716, 0, 0, 1, 1, 1,
0.09024353, -2.090532, 2.92146, 1, 0, 0, 1, 1,
0.09050962, -0.9328938, 2.500872, 1, 0, 0, 1, 1,
0.09053796, 0.3586094, -0.4187721, 1, 0, 0, 1, 1,
0.0931073, -0.1826699, 2.257939, 1, 0, 0, 1, 1,
0.09632885, -0.1680763, 1.898398, 1, 0, 0, 1, 1,
0.09936344, -0.6340362, 3.05866, 0, 0, 0, 1, 1,
0.1057912, -0.3260723, 4.359809, 0, 0, 0, 1, 1,
0.1124058, 0.5631529, 1.723891, 0, 0, 0, 1, 1,
0.1133598, 0.3221272, -1.089945, 0, 0, 0, 1, 1,
0.1135918, -0.1063093, 2.992324, 0, 0, 0, 1, 1,
0.120296, 0.9837633, -0.5778585, 0, 0, 0, 1, 1,
0.1263007, 1.365309, 1.807834, 0, 0, 0, 1, 1,
0.1322391, 0.434108, 0.129255, 1, 1, 1, 1, 1,
0.1326934, -0.1365622, 2.529187, 1, 1, 1, 1, 1,
0.139924, 1.606588, 0.6417325, 1, 1, 1, 1, 1,
0.1416767, -0.4959546, 1.682894, 1, 1, 1, 1, 1,
0.1557886, -0.4124498, 4.100893, 1, 1, 1, 1, 1,
0.1593776, 0.7957563, 1.891078, 1, 1, 1, 1, 1,
0.1609468, 1.972449, -0.02943298, 1, 1, 1, 1, 1,
0.1636779, 0.1330425, 1.393969, 1, 1, 1, 1, 1,
0.1648386, 0.1838298, 1.934551, 1, 1, 1, 1, 1,
0.1655031, -0.7534556, 2.989249, 1, 1, 1, 1, 1,
0.1672634, -1.381105, 2.87577, 1, 1, 1, 1, 1,
0.1679773, -0.3333419, 2.457237, 1, 1, 1, 1, 1,
0.1702801, 1.403437, -0.7568288, 1, 1, 1, 1, 1,
0.1704635, 1.219796, -1.348585, 1, 1, 1, 1, 1,
0.1721348, 0.01944968, 0.09503897, 1, 1, 1, 1, 1,
0.1763195, 0.2334923, 0.365657, 0, 0, 1, 1, 1,
0.1787567, -0.2221273, 3.492735, 1, 0, 0, 1, 1,
0.1809275, 0.4658108, 0.06887857, 1, 0, 0, 1, 1,
0.1864348, 0.6814437, 0.587437, 1, 0, 0, 1, 1,
0.1870661, 0.9597685, 0.7299706, 1, 0, 0, 1, 1,
0.1877028, 0.6953094, 2.470488, 1, 0, 0, 1, 1,
0.1896281, 0.09259983, 1.019454, 0, 0, 0, 1, 1,
0.1918644, 1.463368, -1.712206, 0, 0, 0, 1, 1,
0.2066293, -0.5743023, 2.275895, 0, 0, 0, 1, 1,
0.2067428, 0.6194661, -0.04306142, 0, 0, 0, 1, 1,
0.2091144, 0.3801326, -0.9762017, 0, 0, 0, 1, 1,
0.2196034, 0.5726519, 0.3205557, 0, 0, 0, 1, 1,
0.2235091, -1.560537, 2.498691, 0, 0, 0, 1, 1,
0.2243707, -1.204909, 3.509048, 1, 1, 1, 1, 1,
0.2267953, 0.4738834, 1.037203, 1, 1, 1, 1, 1,
0.2270327, -0.2050602, 3.420022, 1, 1, 1, 1, 1,
0.227418, -0.4911619, 1.072519, 1, 1, 1, 1, 1,
0.2314819, -1.808636, 2.232821, 1, 1, 1, 1, 1,
0.2317689, -0.9172237, 3.154079, 1, 1, 1, 1, 1,
0.2333708, -0.07278578, 1.581788, 1, 1, 1, 1, 1,
0.2370361, -1.43873, 4.512605, 1, 1, 1, 1, 1,
0.2384757, 1.140134, 0.5039088, 1, 1, 1, 1, 1,
0.2403988, -0.8601903, 3.039609, 1, 1, 1, 1, 1,
0.244384, 1.114381, 0.9261926, 1, 1, 1, 1, 1,
0.247093, -0.3224011, 3.641171, 1, 1, 1, 1, 1,
0.2480041, 0.5568241, 0.8256539, 1, 1, 1, 1, 1,
0.2507798, -0.8674068, 2.275485, 1, 1, 1, 1, 1,
0.255217, -1.116169, 3.777037, 1, 1, 1, 1, 1,
0.2591023, 0.8855461, 1.034719, 0, 0, 1, 1, 1,
0.2607393, -0.8730715, 2.476717, 1, 0, 0, 1, 1,
0.2608732, 0.1665609, -0.6833622, 1, 0, 0, 1, 1,
0.2608761, 0.0920487, -0.2255533, 1, 0, 0, 1, 1,
0.2623404, 0.4904222, 1.443766, 1, 0, 0, 1, 1,
0.2651291, 1.043178, 1.335338, 1, 0, 0, 1, 1,
0.2667819, -1.011976, 3.067264, 0, 0, 0, 1, 1,
0.2687946, 1.554914, 0.400704, 0, 0, 0, 1, 1,
0.2707413, 1.391073, -1.080426, 0, 0, 0, 1, 1,
0.2718682, 1.334601, 0.9387947, 0, 0, 0, 1, 1,
0.274363, -0.6752879, 1.010464, 0, 0, 0, 1, 1,
0.2772096, -1.6741, 3.505624, 0, 0, 0, 1, 1,
0.2776545, 1.048401, 2.451958, 0, 0, 0, 1, 1,
0.2799968, 0.1192686, 1.970581, 1, 1, 1, 1, 1,
0.2818235, 0.3486903, 0.294421, 1, 1, 1, 1, 1,
0.2823245, -0.2071912, 3.003728, 1, 1, 1, 1, 1,
0.2864085, 1.899402, -1.357849, 1, 1, 1, 1, 1,
0.2864616, -0.06816235, 1.082537, 1, 1, 1, 1, 1,
0.2870122, 0.7895725, -0.8018703, 1, 1, 1, 1, 1,
0.2889858, -0.5003998, 1.840203, 1, 1, 1, 1, 1,
0.2907171, -0.4684431, 2.155557, 1, 1, 1, 1, 1,
0.2945898, 1.46733, -0.9922495, 1, 1, 1, 1, 1,
0.2948741, -0.4126088, 0.9486116, 1, 1, 1, 1, 1,
0.2956101, -0.7741817, 1.683424, 1, 1, 1, 1, 1,
0.296656, 0.9780618, -1.412323, 1, 1, 1, 1, 1,
0.2996241, 0.6573693, -0.9302552, 1, 1, 1, 1, 1,
0.3005109, 0.2637371, 2.11615, 1, 1, 1, 1, 1,
0.3072747, 0.1110165, 0.08641247, 1, 1, 1, 1, 1,
0.3079596, 1.564214, -0.3576365, 0, 0, 1, 1, 1,
0.3081146, -0.8160023, 1.354701, 1, 0, 0, 1, 1,
0.3088042, 1.778466, 0.09972887, 1, 0, 0, 1, 1,
0.3103854, 0.07796464, 0.8572997, 1, 0, 0, 1, 1,
0.3123975, -0.04190416, 1.198294, 1, 0, 0, 1, 1,
0.3123999, -0.5968956, 3.226958, 1, 0, 0, 1, 1,
0.3188785, 2.985883, -0.691006, 0, 0, 0, 1, 1,
0.3206002, 0.09266905, 1.199623, 0, 0, 0, 1, 1,
0.3206235, -1.450844, 1.895382, 0, 0, 0, 1, 1,
0.3211007, -0.01689584, 1.276855, 0, 0, 0, 1, 1,
0.3220499, 0.1336163, 1.672058, 0, 0, 0, 1, 1,
0.3221462, 0.2349565, -0.4803285, 0, 0, 0, 1, 1,
0.3274489, -1.455654, 3.106685, 0, 0, 0, 1, 1,
0.3276968, -1.382697, 2.943564, 1, 1, 1, 1, 1,
0.3277649, 0.05132084, 0.9133227, 1, 1, 1, 1, 1,
0.3305827, 0.6238137, 1.840096, 1, 1, 1, 1, 1,
0.3363853, 2.126549, 1.787213, 1, 1, 1, 1, 1,
0.3450104, -0.3629801, 1.268509, 1, 1, 1, 1, 1,
0.3515087, -0.5332191, 1.898529, 1, 1, 1, 1, 1,
0.3536762, -1.099259, 4.877353, 1, 1, 1, 1, 1,
0.3551246, 1.919656, -0.8324376, 1, 1, 1, 1, 1,
0.3563145, 0.3294643, -1.087028, 1, 1, 1, 1, 1,
0.3582659, 1.498319, -0.3816201, 1, 1, 1, 1, 1,
0.3681409, -1.246899, 3.846851, 1, 1, 1, 1, 1,
0.3686892, 1.183056, 2.663034, 1, 1, 1, 1, 1,
0.369338, 0.8944405, 1.33285, 1, 1, 1, 1, 1,
0.3702586, 0.2599667, 0.2067924, 1, 1, 1, 1, 1,
0.3728007, -1.807252, 4.23299, 1, 1, 1, 1, 1,
0.3745522, 0.3462099, 0.02186688, 0, 0, 1, 1, 1,
0.3751589, -0.7564279, 2.476868, 1, 0, 0, 1, 1,
0.3786936, -0.5679226, 2.389441, 1, 0, 0, 1, 1,
0.3800981, -1.187837, 3.761367, 1, 0, 0, 1, 1,
0.3866933, -0.06605485, 1.323208, 1, 0, 0, 1, 1,
0.3867112, 1.055365, 0.4843498, 1, 0, 0, 1, 1,
0.3879265, -1.192099, 2.447924, 0, 0, 0, 1, 1,
0.3903873, -0.07573978, 3.75365, 0, 0, 0, 1, 1,
0.3914214, -0.2728886, 1.828742, 0, 0, 0, 1, 1,
0.3920847, -0.578127, 2.526971, 0, 0, 0, 1, 1,
0.3997627, -2.724375, 1.312437, 0, 0, 0, 1, 1,
0.4004982, 1.499187, 0.800869, 0, 0, 0, 1, 1,
0.4008911, 0.8490012, -0.4406354, 0, 0, 0, 1, 1,
0.4025777, -0.6461266, 2.770792, 1, 1, 1, 1, 1,
0.4029592, -0.3090652, 2.228648, 1, 1, 1, 1, 1,
0.4036517, 0.6780284, -0.5681216, 1, 1, 1, 1, 1,
0.4072754, -0.08599073, 0.7429287, 1, 1, 1, 1, 1,
0.4077583, 1.244802, 1.304464, 1, 1, 1, 1, 1,
0.4127284, -0.3441454, 3.643517, 1, 1, 1, 1, 1,
0.4141478, -0.3399255, 2.605815, 1, 1, 1, 1, 1,
0.4153862, -0.6726633, 3.106161, 1, 1, 1, 1, 1,
0.415844, -1.376964, 3.060367, 1, 1, 1, 1, 1,
0.4166983, 0.3192201, 0.8774294, 1, 1, 1, 1, 1,
0.4177362, 0.09561912, 2.946752, 1, 1, 1, 1, 1,
0.4227496, -0.5570245, 3.268128, 1, 1, 1, 1, 1,
0.4252203, 0.1297767, 2.405381, 1, 1, 1, 1, 1,
0.4272275, 0.2063533, 0.4309985, 1, 1, 1, 1, 1,
0.4282307, -0.1350321, 2.454431, 1, 1, 1, 1, 1,
0.4299583, -1.314438, 2.533649, 0, 0, 1, 1, 1,
0.4306684, 0.6616614, 0.6373803, 1, 0, 0, 1, 1,
0.4351588, 0.5191277, -0.4755273, 1, 0, 0, 1, 1,
0.4392434, -0.3552956, 1.5651, 1, 0, 0, 1, 1,
0.4450015, -2.0772, 2.342184, 1, 0, 0, 1, 1,
0.4484465, 0.08975162, 1.097524, 1, 0, 0, 1, 1,
0.4488378, -0.001510503, 2.291217, 0, 0, 0, 1, 1,
0.4505187, -0.1240979, 0.8542119, 0, 0, 0, 1, 1,
0.4540735, 0.5361204, 0.4009013, 0, 0, 0, 1, 1,
0.4550009, 0.4101394, 1.296164, 0, 0, 0, 1, 1,
0.4568157, -0.7087449, 1.653291, 0, 0, 0, 1, 1,
0.460857, -0.9256926, 1.631839, 0, 0, 0, 1, 1,
0.4634116, -0.4587549, 0.1583003, 0, 0, 0, 1, 1,
0.4644192, -0.5946137, 2.874547, 1, 1, 1, 1, 1,
0.465755, -1.053967, 2.4913, 1, 1, 1, 1, 1,
0.4716748, 0.4039046, 0.9163339, 1, 1, 1, 1, 1,
0.4717571, -0.9566865, 2.949948, 1, 1, 1, 1, 1,
0.4757855, -1.528138, 3.301603, 1, 1, 1, 1, 1,
0.4762338, -0.1555123, 0.7601788, 1, 1, 1, 1, 1,
0.479048, 0.4231303, 0.6112766, 1, 1, 1, 1, 1,
0.4837151, 1.994181, 0.7819166, 1, 1, 1, 1, 1,
0.4879155, -1.067504, 1.586589, 1, 1, 1, 1, 1,
0.4968112, -0.2965603, 3.963241, 1, 1, 1, 1, 1,
0.503698, 1.702718, 1.155565, 1, 1, 1, 1, 1,
0.5078972, -0.08220098, 0.3035113, 1, 1, 1, 1, 1,
0.5109218, -0.04939003, 2.655571, 1, 1, 1, 1, 1,
0.5109232, -1.492406, 3.58443, 1, 1, 1, 1, 1,
0.5162221, -0.6179323, 2.262161, 1, 1, 1, 1, 1,
0.5179799, 1.650656, -0.07877102, 0, 0, 1, 1, 1,
0.5202855, -0.4359449, 2.203491, 1, 0, 0, 1, 1,
0.5235387, 1.017823, -0.889611, 1, 0, 0, 1, 1,
0.5239969, -1.00711, 2.527273, 1, 0, 0, 1, 1,
0.5326006, 0.9560696, 0.718377, 1, 0, 0, 1, 1,
0.5333815, 0.07998423, 0.792466, 1, 0, 0, 1, 1,
0.5370635, -1.458928, 2.638144, 0, 0, 0, 1, 1,
0.5399816, -1.096488, 0.4774186, 0, 0, 0, 1, 1,
0.5430188, 0.9148912, -0.6917188, 0, 0, 0, 1, 1,
0.5493211, -0.1229502, 2.752039, 0, 0, 0, 1, 1,
0.5514998, 0.00934062, 2.861726, 0, 0, 0, 1, 1,
0.5534129, -1.159091, 0.7630586, 0, 0, 0, 1, 1,
0.5591441, -0.4299868, 2.359752, 0, 0, 0, 1, 1,
0.5627411, -0.8524906, 3.294498, 1, 1, 1, 1, 1,
0.5669501, -0.2655661, 2.584173, 1, 1, 1, 1, 1,
0.5684104, 1.086128, -0.3461592, 1, 1, 1, 1, 1,
0.5706434, -0.08150997, 1.310306, 1, 1, 1, 1, 1,
0.5714218, 1.075496, -1.019204, 1, 1, 1, 1, 1,
0.5731977, -0.2300262, 2.227878, 1, 1, 1, 1, 1,
0.5757108, -1.576249, 3.553047, 1, 1, 1, 1, 1,
0.5761319, 0.1631876, -0.1313881, 1, 1, 1, 1, 1,
0.578116, -0.702325, 2.259616, 1, 1, 1, 1, 1,
0.5782263, 1.139081, 0.5379811, 1, 1, 1, 1, 1,
0.5789463, -1.180914, 3.486205, 1, 1, 1, 1, 1,
0.5811991, 1.18614, 0.4825439, 1, 1, 1, 1, 1,
0.5812331, -0.7936671, 3.159691, 1, 1, 1, 1, 1,
0.5812488, 0.4689177, 0.4969677, 1, 1, 1, 1, 1,
0.5821553, -0.6543498, 2.154734, 1, 1, 1, 1, 1,
0.5830131, -2.751067, 3.378345, 0, 0, 1, 1, 1,
0.5830815, 0.03454397, -0.7043842, 1, 0, 0, 1, 1,
0.5848067, 1.510831, 1.087486, 1, 0, 0, 1, 1,
0.5881419, -0.1401189, 2.011161, 1, 0, 0, 1, 1,
0.5883324, -0.2327866, -0.7849338, 1, 0, 0, 1, 1,
0.5927025, 0.3157015, 1.29106, 1, 0, 0, 1, 1,
0.5930192, 1.770447, 0.6778328, 0, 0, 0, 1, 1,
0.5942898, 1.374375, -0.5736194, 0, 0, 0, 1, 1,
0.6069162, -1.101995, 5.229355, 0, 0, 0, 1, 1,
0.610823, -0.5021036, 2.072192, 0, 0, 0, 1, 1,
0.6185025, 0.9073406, 1.905989, 0, 0, 0, 1, 1,
0.6196672, 1.337689, -1.349116, 0, 0, 0, 1, 1,
0.6306638, 1.950166, 0.07510199, 0, 0, 0, 1, 1,
0.6331198, -0.2207782, 3.371463, 1, 1, 1, 1, 1,
0.639202, 2.257534, 0.8722494, 1, 1, 1, 1, 1,
0.6400308, -1.22501, 4.090344, 1, 1, 1, 1, 1,
0.6444543, 0.984325, 1.027418, 1, 1, 1, 1, 1,
0.6497412, -0.2394002, 1.767332, 1, 1, 1, 1, 1,
0.6572199, -2.601739, 2.326807, 1, 1, 1, 1, 1,
0.66275, 1.738532, 0.05827161, 1, 1, 1, 1, 1,
0.6633231, -0.3420022, 1.214071, 1, 1, 1, 1, 1,
0.6725414, -0.5349858, 2.558156, 1, 1, 1, 1, 1,
0.6736839, 0.3468964, 1.820911, 1, 1, 1, 1, 1,
0.6736902, -0.6058221, 3.053045, 1, 1, 1, 1, 1,
0.6785558, 0.1095629, 0.599381, 1, 1, 1, 1, 1,
0.6804603, 0.3473438, 0.253286, 1, 1, 1, 1, 1,
0.6836389, 0.2058514, 1.435056, 1, 1, 1, 1, 1,
0.6871238, -1.407041, 3.783019, 1, 1, 1, 1, 1,
0.6898234, 0.8311586, -0.4726331, 0, 0, 1, 1, 1,
0.692162, 1.35681, 0.1410696, 1, 0, 0, 1, 1,
0.6953395, 0.14338, 2.755505, 1, 0, 0, 1, 1,
0.7020178, -1.44179, 3.389431, 1, 0, 0, 1, 1,
0.7132653, -0.5592343, 3.204987, 1, 0, 0, 1, 1,
0.7136214, 0.3696111, 1.532354, 1, 0, 0, 1, 1,
0.7154264, 1.017232, 2.171071, 0, 0, 0, 1, 1,
0.7159182, -1.505003, 2.441793, 0, 0, 0, 1, 1,
0.72117, 0.1761434, -0.9653272, 0, 0, 0, 1, 1,
0.7267412, 0.5367293, 0.2654424, 0, 0, 0, 1, 1,
0.7271836, 0.627505, 0.8937626, 0, 0, 0, 1, 1,
0.7277175, -0.02439825, 2.814112, 0, 0, 0, 1, 1,
0.7311586, -1.469471, 1.398299, 0, 0, 0, 1, 1,
0.7346531, -0.8447611, 1.360938, 1, 1, 1, 1, 1,
0.7368204, 1.233199, 1.612555, 1, 1, 1, 1, 1,
0.7442584, 0.391946, 0.9411431, 1, 1, 1, 1, 1,
0.7446974, 0.5717188, 2.764022, 1, 1, 1, 1, 1,
0.7492775, -1.144906, 3.045901, 1, 1, 1, 1, 1,
0.750707, -0.1287806, 2.636702, 1, 1, 1, 1, 1,
0.7576537, -0.6587765, 2.280888, 1, 1, 1, 1, 1,
0.7630978, -0.3293156, 2.039697, 1, 1, 1, 1, 1,
0.7647871, 1.405862, 0.6708195, 1, 1, 1, 1, 1,
0.767947, 1.319278, 0.4967517, 1, 1, 1, 1, 1,
0.7709615, 0.4515055, 0.02717015, 1, 1, 1, 1, 1,
0.7790568, -0.1540558, 0.6334746, 1, 1, 1, 1, 1,
0.7864228, 0.3848272, 1.70653, 1, 1, 1, 1, 1,
0.7871894, -0.4297602, -0.1664028, 1, 1, 1, 1, 1,
0.7873594, 0.3295896, 1.419364, 1, 1, 1, 1, 1,
0.7880496, -0.1981541, 1.718433, 0, 0, 1, 1, 1,
0.7896764, -0.6382222, 1.268736, 1, 0, 0, 1, 1,
0.7915091, 0.09040565, 1.317615, 1, 0, 0, 1, 1,
0.7941788, -0.5417861, 0.9355215, 1, 0, 0, 1, 1,
0.7962227, 0.5148595, 1.108373, 1, 0, 0, 1, 1,
0.796779, -1.663057, 1.762919, 1, 0, 0, 1, 1,
0.7969539, -1.89047, 1.813198, 0, 0, 0, 1, 1,
0.7999595, 0.2281208, 0.3193203, 0, 0, 0, 1, 1,
0.8060772, 0.04531863, 1.849874, 0, 0, 0, 1, 1,
0.8109126, 1.323498, 1.882013, 0, 0, 0, 1, 1,
0.8112618, -0.2410598, 0.8104595, 0, 0, 0, 1, 1,
0.8130584, -1.153071, 4.914357, 0, 0, 0, 1, 1,
0.8138792, 1.0192, 0.35895, 0, 0, 0, 1, 1,
0.8216411, -0.5666759, 4.195601, 1, 1, 1, 1, 1,
0.8268899, -0.5455885, 3.094248, 1, 1, 1, 1, 1,
0.8276359, -0.848286, 1.510172, 1, 1, 1, 1, 1,
0.8312503, 0.8589218, 2.447453, 1, 1, 1, 1, 1,
0.834522, -0.2661618, 1.819441, 1, 1, 1, 1, 1,
0.8363766, -2.430925, 0.9263192, 1, 1, 1, 1, 1,
0.8454163, -0.1971447, 3.599661, 1, 1, 1, 1, 1,
0.8478757, -0.2100102, 1.128773, 1, 1, 1, 1, 1,
0.8485816, 0.03721935, 0.07443051, 1, 1, 1, 1, 1,
0.8507063, 0.4610225, 1.24406, 1, 1, 1, 1, 1,
0.8522655, 0.9921372, 0.8604148, 1, 1, 1, 1, 1,
0.8527026, 0.1019833, 0.3684143, 1, 1, 1, 1, 1,
0.8539333, 1.009963, 0.7134923, 1, 1, 1, 1, 1,
0.8640806, 0.5842221, -0.002466154, 1, 1, 1, 1, 1,
0.8697647, -0.1871952, 2.248135, 1, 1, 1, 1, 1,
0.8777108, 1.818439, -0.1047122, 0, 0, 1, 1, 1,
0.8808488, -1.764416, 2.021742, 1, 0, 0, 1, 1,
0.8825207, -0.01799526, -0.2270764, 1, 0, 0, 1, 1,
0.8855992, 0.6262239, 1.43274, 1, 0, 0, 1, 1,
0.88827, -1.140108, 2.638765, 1, 0, 0, 1, 1,
0.8942866, 1.047605, 0.9478064, 1, 0, 0, 1, 1,
0.8990952, -2.556859, 1.879087, 0, 0, 0, 1, 1,
0.8991027, -0.4764036, 2.462494, 0, 0, 0, 1, 1,
0.9076965, -0.3792969, 1.713776, 0, 0, 0, 1, 1,
0.9221807, 0.618269, 0.8230289, 0, 0, 0, 1, 1,
0.928316, -0.915832, 3.204194, 0, 0, 0, 1, 1,
0.9344772, 0.6463002, 0.5261298, 0, 0, 0, 1, 1,
0.9392996, -0.3316525, 0.2613124, 0, 0, 0, 1, 1,
0.9418328, -0.4499312, 2.663363, 1, 1, 1, 1, 1,
0.9439716, -0.4660126, 2.861874, 1, 1, 1, 1, 1,
0.9458725, -0.203866, 0.9338862, 1, 1, 1, 1, 1,
0.946322, -1.618585, 2.628564, 1, 1, 1, 1, 1,
0.9471202, -1.420716, 3.535317, 1, 1, 1, 1, 1,
0.9483551, 0.2887788, 2.160508, 1, 1, 1, 1, 1,
0.9618986, -0.9279076, 1.819172, 1, 1, 1, 1, 1,
0.9622317, 0.3577338, -1.432626, 1, 1, 1, 1, 1,
0.9627967, 0.2441812, 0.2458313, 1, 1, 1, 1, 1,
0.963249, 0.01443725, 2.098697, 1, 1, 1, 1, 1,
0.9633036, -0.7328616, 2.377801, 1, 1, 1, 1, 1,
0.9644108, -0.2971456, 2.585406, 1, 1, 1, 1, 1,
0.9661341, 0.5008419, 1.72316, 1, 1, 1, 1, 1,
0.9790637, 0.2954825, 0.4054607, 1, 1, 1, 1, 1,
0.980195, 0.05238738, 1.61667, 1, 1, 1, 1, 1,
0.9817349, -0.06796513, 1.60612, 0, 0, 1, 1, 1,
0.9852064, 0.2494859, 1.276377, 1, 0, 0, 1, 1,
0.986024, -0.9568244, 5.991339, 1, 0, 0, 1, 1,
0.9896221, 0.1570254, 1.302112, 1, 0, 0, 1, 1,
0.9896246, -0.5679655, 4.025092, 1, 0, 0, 1, 1,
0.9902749, 1.023353, 1.967296, 1, 0, 0, 1, 1,
0.9917385, 0.7684958, -0.4816653, 0, 0, 0, 1, 1,
0.9922358, 0.2673305, 1.737738, 0, 0, 0, 1, 1,
0.9975855, -1.162007, 3.469069, 0, 0, 0, 1, 1,
1.007667, 1.47585, 2.149621, 0, 0, 0, 1, 1,
1.008433, 1.135957, 0.8007154, 0, 0, 0, 1, 1,
1.0088, -1.238302, 2.940365, 0, 0, 0, 1, 1,
1.011977, 1.821653, 0.9287221, 0, 0, 0, 1, 1,
1.015204, -0.4681782, 3.216308, 1, 1, 1, 1, 1,
1.017659, -0.6168424, 2.027583, 1, 1, 1, 1, 1,
1.019144, 0.6885311, 0.8771081, 1, 1, 1, 1, 1,
1.027485, -0.4305621, 1.452146, 1, 1, 1, 1, 1,
1.029062, -0.3527259, 2.578464, 1, 1, 1, 1, 1,
1.032608, 1.367825, -0.6052327, 1, 1, 1, 1, 1,
1.032761, -0.06441528, 1.770919, 1, 1, 1, 1, 1,
1.045203, -0.5445433, 1.371803, 1, 1, 1, 1, 1,
1.045833, -1.92038, 2.811193, 1, 1, 1, 1, 1,
1.054043, 2.272588, 0.4598362, 1, 1, 1, 1, 1,
1.060869, 0.07858022, 1.251969, 1, 1, 1, 1, 1,
1.070589, -0.4349392, 1.431455, 1, 1, 1, 1, 1,
1.070861, 1.875585, 2.032141, 1, 1, 1, 1, 1,
1.087548, -1.538521, 3.419914, 1, 1, 1, 1, 1,
1.091736, -0.1224519, 1.645357, 1, 1, 1, 1, 1,
1.096888, 0.9764224, 0.5075374, 0, 0, 1, 1, 1,
1.100291, -1.616313, 4.260462, 1, 0, 0, 1, 1,
1.113779, 0.1885936, 0.7475324, 1, 0, 0, 1, 1,
1.124141, 1.322688, 0.02344037, 1, 0, 0, 1, 1,
1.124541, 2.277526, 0.9792693, 1, 0, 0, 1, 1,
1.127475, 1.433604, 1.939437, 1, 0, 0, 1, 1,
1.136802, -1.048316, 1.874816, 0, 0, 0, 1, 1,
1.143502, -0.2406801, 2.892694, 0, 0, 0, 1, 1,
1.144579, 1.190415, 1.648783, 0, 0, 0, 1, 1,
1.162272, 0.6337048, -0.4825345, 0, 0, 0, 1, 1,
1.162742, 0.6164512, 1.356103, 0, 0, 0, 1, 1,
1.164517, -0.6756646, 1.701359, 0, 0, 0, 1, 1,
1.174015, 0.2453301, 0.9401261, 0, 0, 0, 1, 1,
1.177919, 0.5465255, 1.615575, 1, 1, 1, 1, 1,
1.180208, 0.7376344, 1.834872, 1, 1, 1, 1, 1,
1.180468, 0.4771334, 0.4331718, 1, 1, 1, 1, 1,
1.185559, 0.6108414, 1.153942, 1, 1, 1, 1, 1,
1.187696, -0.9945925, 1.196979, 1, 1, 1, 1, 1,
1.194419, -0.01346095, 3.55318, 1, 1, 1, 1, 1,
1.199822, 0.9196541, -0.01289955, 1, 1, 1, 1, 1,
1.201367, 1.156536, 2.091451, 1, 1, 1, 1, 1,
1.206838, 0.5944636, 3.278367, 1, 1, 1, 1, 1,
1.208638, 0.06065049, 1.131338, 1, 1, 1, 1, 1,
1.210963, 1.08369, 2.446, 1, 1, 1, 1, 1,
1.211505, -0.2773119, 0.2916318, 1, 1, 1, 1, 1,
1.21213, 2.667171, 1.840261, 1, 1, 1, 1, 1,
1.218304, -0.149092, 2.926247, 1, 1, 1, 1, 1,
1.218464, -0.2036412, 1.56793, 1, 1, 1, 1, 1,
1.218558, -1.079031, 0.8189648, 0, 0, 1, 1, 1,
1.220935, 0.8535092, 2.38834, 1, 0, 0, 1, 1,
1.225447, -0.2200353, 1.508091, 1, 0, 0, 1, 1,
1.23295, -0.3681322, 1.762111, 1, 0, 0, 1, 1,
1.235086, -1.167679, 3.463473, 1, 0, 0, 1, 1,
1.235508, -0.8910927, 1.659192, 1, 0, 0, 1, 1,
1.239911, 0.5647208, 0.777229, 0, 0, 0, 1, 1,
1.240582, 0.9374845, 3.949047, 0, 0, 0, 1, 1,
1.24211, -0.7695815, 3.138775, 0, 0, 0, 1, 1,
1.25145, -0.0006935886, 2.371174, 0, 0, 0, 1, 1,
1.265039, -0.002603323, 2.570022, 0, 0, 0, 1, 1,
1.287277, 0.3924297, 0.8357484, 0, 0, 0, 1, 1,
1.288179, 0.8011569, 1.413006, 0, 0, 0, 1, 1,
1.306057, -0.2456095, 1.351733, 1, 1, 1, 1, 1,
1.320035, 0.6004395, 2.114029, 1, 1, 1, 1, 1,
1.325891, 0.3548861, 1.067062, 1, 1, 1, 1, 1,
1.339622, 1.055631, 0.3444355, 1, 1, 1, 1, 1,
1.34769, 1.618713, 1.177358, 1, 1, 1, 1, 1,
1.352812, 0.4295141, 0.3338279, 1, 1, 1, 1, 1,
1.353849, -0.6050287, 2.665886, 1, 1, 1, 1, 1,
1.361509, -0.6900427, 2.383916, 1, 1, 1, 1, 1,
1.382681, -0.06822937, 0.1283865, 1, 1, 1, 1, 1,
1.393102, -0.1699045, 1.198512, 1, 1, 1, 1, 1,
1.401539, 0.156119, 2.230128, 1, 1, 1, 1, 1,
1.401994, -0.7616948, 1.041369, 1, 1, 1, 1, 1,
1.411057, 0.3283762, 1.163754, 1, 1, 1, 1, 1,
1.41243, -0.04956132, 0.7197418, 1, 1, 1, 1, 1,
1.420642, 0.4805852, 0.9826297, 1, 1, 1, 1, 1,
1.424369, -0.3457697, 1.010599, 0, 0, 1, 1, 1,
1.427343, 2.992255, 1.880836, 1, 0, 0, 1, 1,
1.428826, -1.279801, 3.293678, 1, 0, 0, 1, 1,
1.436171, 0.4001057, 2.026877, 1, 0, 0, 1, 1,
1.455496, 1.557706, 1.099451, 1, 0, 0, 1, 1,
1.462933, -0.3032374, 1.633101, 1, 0, 0, 1, 1,
1.47134, 1.121587, 1.691671, 0, 0, 0, 1, 1,
1.485758, -0.6555688, 2.49908, 0, 0, 0, 1, 1,
1.487457, 0.07693156, 1.631694, 0, 0, 0, 1, 1,
1.492068, -0.4345228, -0.3723535, 0, 0, 0, 1, 1,
1.50053, -0.6150184, 4.619253, 0, 0, 0, 1, 1,
1.519875, -1.136319, 2.999007, 0, 0, 0, 1, 1,
1.521836, -0.2154694, 2.774938, 0, 0, 0, 1, 1,
1.52555, -1.192563, 1.94033, 1, 1, 1, 1, 1,
1.530486, 1.626116, 2.620499, 1, 1, 1, 1, 1,
1.535829, -0.599905, 2.417168, 1, 1, 1, 1, 1,
1.537422, 1.280277, 1.044229, 1, 1, 1, 1, 1,
1.56265, 0.8165149, 1.340245, 1, 1, 1, 1, 1,
1.563027, -0.0583252, 1.564989, 1, 1, 1, 1, 1,
1.615523, 0.3635115, 1.721349, 1, 1, 1, 1, 1,
1.619626, 0.1383376, 2.574127, 1, 1, 1, 1, 1,
1.633774, 0.1029948, 0.3221773, 1, 1, 1, 1, 1,
1.652993, -0.02651975, 1.424795, 1, 1, 1, 1, 1,
1.656326, -0.6479363, 3.502784, 1, 1, 1, 1, 1,
1.662734, -0.7102898, 1.449971, 1, 1, 1, 1, 1,
1.688653, -0.5390726, 1.917907, 1, 1, 1, 1, 1,
1.717407, -1.022068, 2.963455, 1, 1, 1, 1, 1,
1.719535, -1.310437, 1.182823, 1, 1, 1, 1, 1,
1.72458, 0.1875361, 1.312017, 0, 0, 1, 1, 1,
1.727803, 0.06604663, 1.862443, 1, 0, 0, 1, 1,
1.728999, -0.7876526, 0.5493909, 1, 0, 0, 1, 1,
1.753751, -1.02273, 1.567428, 1, 0, 0, 1, 1,
1.758845, -1.468688, 2.489221, 1, 0, 0, 1, 1,
1.772568, -0.1691963, 2.292002, 1, 0, 0, 1, 1,
1.79458, 0.3611522, 2.21856, 0, 0, 0, 1, 1,
1.862223, -0.5320743, 2.733531, 0, 0, 0, 1, 1,
1.863844, 2.055468, 1.882605, 0, 0, 0, 1, 1,
1.865484, 1.420663, 0.1630657, 0, 0, 0, 1, 1,
1.883209, -1.795457, 2.16808, 0, 0, 0, 1, 1,
1.884949, 0.4183631, 2.028163, 0, 0, 0, 1, 1,
1.901709, 0.5982214, -0.6192815, 0, 0, 0, 1, 1,
1.9121, 0.8686551, 1.376944, 1, 1, 1, 1, 1,
1.930486, -0.6191723, 2.021926, 1, 1, 1, 1, 1,
1.941755, 0.5028469, 0.9136649, 1, 1, 1, 1, 1,
1.958565, -0.4882866, 1.263853, 1, 1, 1, 1, 1,
1.983261, -1.298876, 2.255658, 1, 1, 1, 1, 1,
1.991305, -0.03406834, -0.6976942, 1, 1, 1, 1, 1,
2.001026, 1.140265, 0.9316998, 1, 1, 1, 1, 1,
2.046839, -1.32228, 1.157273, 1, 1, 1, 1, 1,
2.068563, -0.05495328, 1.660947, 1, 1, 1, 1, 1,
2.096962, 0.02759427, 1.230167, 1, 1, 1, 1, 1,
2.113181, -0.4795458, 1.821335, 1, 1, 1, 1, 1,
2.198957, 0.479537, 1.806253, 1, 1, 1, 1, 1,
2.200011, 2.616973, 2.040481, 1, 1, 1, 1, 1,
2.216258, -1.249709, 0.4913506, 1, 1, 1, 1, 1,
2.217099, 0.3604781, 1.38988, 1, 1, 1, 1, 1,
2.240853, 1.39286, 1.733963, 0, 0, 1, 1, 1,
2.281571, 0.4530722, 0.5448269, 1, 0, 0, 1, 1,
2.301973, -1.344659, 2.77624, 1, 0, 0, 1, 1,
2.311037, -0.4107744, 1.627739, 1, 0, 0, 1, 1,
2.31619, -0.7237062, 1.904485, 1, 0, 0, 1, 1,
2.332141, -0.311052, 2.397853, 1, 0, 0, 1, 1,
2.421005, 1.047803, 2.063828, 0, 0, 0, 1, 1,
2.454076, -0.9306234, 3.092068, 0, 0, 0, 1, 1,
2.467843, -0.1016422, 3.251937, 0, 0, 0, 1, 1,
2.482157, -0.2741835, -0.1336171, 0, 0, 0, 1, 1,
2.567641, -0.9274054, 1.416681, 0, 0, 0, 1, 1,
2.652546, -0.3619162, 0.9760773, 0, 0, 0, 1, 1,
2.671469, -0.8196909, 2.896237, 0, 0, 0, 1, 1,
2.687899, 0.9969735, 3.648724, 1, 1, 1, 1, 1,
2.69885, -1.301044, 1.137902, 1, 1, 1, 1, 1,
2.72959, 0.9470333, 1.895534, 1, 1, 1, 1, 1,
2.756075, 0.3025595, 1.775478, 1, 1, 1, 1, 1,
2.851432, -0.3706435, 1.350403, 1, 1, 1, 1, 1,
3.149789, -0.6423185, 0.9667995, 1, 1, 1, 1, 1,
3.648679, -2.011301, 1.004614, 1, 1, 1, 1, 1
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
var radius = 9.54986;
var distance = 33.54348;
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
mvMatrix.translate( -0.3702134, -0.03736341, -0.5550883 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54348);
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