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
-3.077914, 1.092111, -0.9096756, 1, 0, 0, 1,
-2.951434, 0.3688977, -0.1737267, 1, 0.007843138, 0, 1,
-2.679796, -1.564618, -2.201273, 1, 0.01176471, 0, 1,
-2.566138, -0.0660013, 0.2791488, 1, 0.01960784, 0, 1,
-2.550277, 1.499523, -2.058712, 1, 0.02352941, 0, 1,
-2.527186, -1.203952, -1.969774, 1, 0.03137255, 0, 1,
-2.510132, 1.949788, -1.487221, 1, 0.03529412, 0, 1,
-2.413376, 0.2522647, -0.03963515, 1, 0.04313726, 0, 1,
-2.358158, 0.7279909, -3.055504, 1, 0.04705882, 0, 1,
-2.322693, 2.362096, -0.8154873, 1, 0.05490196, 0, 1,
-2.223978, -1.564746, -0.5133874, 1, 0.05882353, 0, 1,
-2.222001, 0.7563143, -1.898642, 1, 0.06666667, 0, 1,
-2.214552, 0.07455291, -1.179153, 1, 0.07058824, 0, 1,
-2.183152, 0.4893686, -2.484924, 1, 0.07843138, 0, 1,
-2.160667, 1.229362, -1.021559, 1, 0.08235294, 0, 1,
-2.154742, 0.110324, -1.72759, 1, 0.09019608, 0, 1,
-2.085503, -0.6707187, -1.584007, 1, 0.09411765, 0, 1,
-2.070166, 0.1718734, -2.477862, 1, 0.1019608, 0, 1,
-2.054637, 0.8242629, -1.806178, 1, 0.1098039, 0, 1,
-2.031796, -0.7692107, -2.352116, 1, 0.1137255, 0, 1,
-2.018546, -1.50211, -3.555736, 1, 0.1215686, 0, 1,
-1.998109, 0.3018899, -0.7822797, 1, 0.1254902, 0, 1,
-1.991945, -1.826215, -3.683289, 1, 0.1333333, 0, 1,
-1.919365, 0.2661642, -1.427687, 1, 0.1372549, 0, 1,
-1.918178, -1.025351, -1.775558, 1, 0.145098, 0, 1,
-1.908952, 1.078247, -0.2797211, 1, 0.1490196, 0, 1,
-1.899378, -0.883358, 0.2835289, 1, 0.1568628, 0, 1,
-1.896398, -0.6807231, -1.279828, 1, 0.1607843, 0, 1,
-1.894493, 0.7665854, -2.176954, 1, 0.1686275, 0, 1,
-1.877216, 0.4107833, -1.291054, 1, 0.172549, 0, 1,
-1.868281, 0.6070613, -1.590066, 1, 0.1803922, 0, 1,
-1.854914, 1.427536, -0.4389034, 1, 0.1843137, 0, 1,
-1.830162, -1.335635, -1.65428, 1, 0.1921569, 0, 1,
-1.808948, -1.008662, -3.064077, 1, 0.1960784, 0, 1,
-1.807602, -1.096188, -2.609379, 1, 0.2039216, 0, 1,
-1.801366, -0.763905, -3.523088, 1, 0.2117647, 0, 1,
-1.780001, -1.710033, -2.103976, 1, 0.2156863, 0, 1,
-1.764732, -0.5733294, -2.661819, 1, 0.2235294, 0, 1,
-1.745104, 1.173595, -2.295291, 1, 0.227451, 0, 1,
-1.720415, -1.061875, -0.8646127, 1, 0.2352941, 0, 1,
-1.716592, 0.5694243, -0.8815478, 1, 0.2392157, 0, 1,
-1.716225, -0.6487297, 0.1792025, 1, 0.2470588, 0, 1,
-1.713063, -0.4213695, -0.1151766, 1, 0.2509804, 0, 1,
-1.700153, 0.6052567, -0.9277209, 1, 0.2588235, 0, 1,
-1.681039, -0.7821915, -0.7532344, 1, 0.2627451, 0, 1,
-1.677781, 1.530629, -2.31872, 1, 0.2705882, 0, 1,
-1.676588, 1.739313, 0.368819, 1, 0.2745098, 0, 1,
-1.670066, -0.5284455, -1.301447, 1, 0.282353, 0, 1,
-1.635086, 1.097708, 0.9545509, 1, 0.2862745, 0, 1,
-1.62121, -0.5088297, -3.857981, 1, 0.2941177, 0, 1,
-1.617333, -0.2452464, -0.7099597, 1, 0.3019608, 0, 1,
-1.61479, -0.03865869, -0.498146, 1, 0.3058824, 0, 1,
-1.590457, 0.3768337, -0.9800891, 1, 0.3137255, 0, 1,
-1.581724, -0.3000279, -0.09190971, 1, 0.3176471, 0, 1,
-1.567844, -1.258294, -1.758127, 1, 0.3254902, 0, 1,
-1.567818, 0.6088406, -1.972203, 1, 0.3294118, 0, 1,
-1.566752, 0.3626299, -1.255133, 1, 0.3372549, 0, 1,
-1.548594, -1.614219, -3.184906, 1, 0.3411765, 0, 1,
-1.546544, 1.056223, -0.1759378, 1, 0.3490196, 0, 1,
-1.531791, -1.696166, -2.649097, 1, 0.3529412, 0, 1,
-1.525972, -0.1970047, -1.411327, 1, 0.3607843, 0, 1,
-1.524973, -0.1567324, -0.7871767, 1, 0.3647059, 0, 1,
-1.518847, -0.1191168, -0.9967953, 1, 0.372549, 0, 1,
-1.508332, -0.24663, -0.7704494, 1, 0.3764706, 0, 1,
-1.498088, 0.1449466, -0.8021343, 1, 0.3843137, 0, 1,
-1.495505, 0.778979, -1.082041, 1, 0.3882353, 0, 1,
-1.490732, 0.5861952, -1.684446, 1, 0.3960784, 0, 1,
-1.484975, -0.7396674, -2.081182, 1, 0.4039216, 0, 1,
-1.479487, -0.1620096, -2.090202, 1, 0.4078431, 0, 1,
-1.474971, 0.964229, -2.672898, 1, 0.4156863, 0, 1,
-1.469278, 0.03189631, -2.314414, 1, 0.4196078, 0, 1,
-1.46826, -0.1310945, -2.665958, 1, 0.427451, 0, 1,
-1.458164, -2.002723, -4.376079, 1, 0.4313726, 0, 1,
-1.457132, 1.626601, -1.549336, 1, 0.4392157, 0, 1,
-1.45624, -0.08408272, -3.393115, 1, 0.4431373, 0, 1,
-1.454202, -0.3223806, -1.315656, 1, 0.4509804, 0, 1,
-1.433677, -0.8755692, -2.483723, 1, 0.454902, 0, 1,
-1.423422, -0.3172102, 0.1214674, 1, 0.4627451, 0, 1,
-1.416526, -0.3222727, -1.531603, 1, 0.4666667, 0, 1,
-1.41095, 0.8447424, -0.9266977, 1, 0.4745098, 0, 1,
-1.388232, -0.9990436, -1.924558, 1, 0.4784314, 0, 1,
-1.374368, -0.9937732, -1.671217, 1, 0.4862745, 0, 1,
-1.374032, 0.5098957, -1.762821, 1, 0.4901961, 0, 1,
-1.371604, -0.2653002, -2.681773, 1, 0.4980392, 0, 1,
-1.370196, -0.1622829, 0.004662961, 1, 0.5058824, 0, 1,
-1.365137, -0.3317854, 1.303935, 1, 0.509804, 0, 1,
-1.342355, -0.4860875, 0.1556207, 1, 0.5176471, 0, 1,
-1.339813, 0.8774263, -1.856002, 1, 0.5215687, 0, 1,
-1.331071, -0.5467941, -2.783117, 1, 0.5294118, 0, 1,
-1.331006, -0.690971, -1.872725, 1, 0.5333334, 0, 1,
-1.330174, 0.6766703, 0.4298997, 1, 0.5411765, 0, 1,
-1.327468, 0.640261, -1.776754, 1, 0.5450981, 0, 1,
-1.326091, 2.312613, 0.1715194, 1, 0.5529412, 0, 1,
-1.325443, 0.03809867, 0.06069104, 1, 0.5568628, 0, 1,
-1.322188, -0.8885047, -3.454427, 1, 0.5647059, 0, 1,
-1.311785, 0.1176658, -2.558572, 1, 0.5686275, 0, 1,
-1.302147, -0.06175011, -1.345127, 1, 0.5764706, 0, 1,
-1.291773, 1.534868, 0.258014, 1, 0.5803922, 0, 1,
-1.290946, -1.331834, -1.94753, 1, 0.5882353, 0, 1,
-1.284837, -0.1091012, -1.055935, 1, 0.5921569, 0, 1,
-1.282259, -2.107273, -3.173198, 1, 0.6, 0, 1,
-1.282067, -0.8093594, -1.045135, 1, 0.6078432, 0, 1,
-1.274637, -0.9632127, -3.099993, 1, 0.6117647, 0, 1,
-1.273747, 0.151867, -1.41218, 1, 0.6196079, 0, 1,
-1.265868, 0.6348639, -1.870238, 1, 0.6235294, 0, 1,
-1.265814, -0.6735204, -2.855952, 1, 0.6313726, 0, 1,
-1.254838, 2.746663, -0.5744005, 1, 0.6352941, 0, 1,
-1.219636, 0.05261038, -1.728896, 1, 0.6431373, 0, 1,
-1.216396, 0.5876772, -2.154393, 1, 0.6470588, 0, 1,
-1.216033, 0.3443738, -1.623826, 1, 0.654902, 0, 1,
-1.198475, -1.240576, -3.465865, 1, 0.6588235, 0, 1,
-1.196194, 0.7109277, 0.6807879, 1, 0.6666667, 0, 1,
-1.179798, 0.9001352, -0.4355374, 1, 0.6705883, 0, 1,
-1.169947, 0.06218893, -1.559461, 1, 0.6784314, 0, 1,
-1.165924, 0.3753864, -1.868948, 1, 0.682353, 0, 1,
-1.162931, 0.9715104, 0.2456997, 1, 0.6901961, 0, 1,
-1.162087, -1.940626, -2.856917, 1, 0.6941177, 0, 1,
-1.156003, -0.4157338, -2.004824, 1, 0.7019608, 0, 1,
-1.152291, -0.4254723, -1.736009, 1, 0.7098039, 0, 1,
-1.14064, 0.1998891, -3.682245, 1, 0.7137255, 0, 1,
-1.137599, -2.071818, -0.7880458, 1, 0.7215686, 0, 1,
-1.135718, -0.7645053, -2.15289, 1, 0.7254902, 0, 1,
-1.133415, 1.89361, -1.421893, 1, 0.7333333, 0, 1,
-1.132086, -0.303024, -2.474397, 1, 0.7372549, 0, 1,
-1.119184, -1.662013, -1.501459, 1, 0.7450981, 0, 1,
-1.116627, 0.890684, -0.4347671, 1, 0.7490196, 0, 1,
-1.111152, 1.285216, -0.2276976, 1, 0.7568628, 0, 1,
-1.099901, -0.5026306, -3.037313, 1, 0.7607843, 0, 1,
-1.090448, 1.010896, -2.320084, 1, 0.7686275, 0, 1,
-1.089838, -0.3911315, -3.253946, 1, 0.772549, 0, 1,
-1.078668, 0.8740801, -0.2034849, 1, 0.7803922, 0, 1,
-1.077834, 1.602926, -0.3742147, 1, 0.7843137, 0, 1,
-1.064835, -0.5618012, -3.336529, 1, 0.7921569, 0, 1,
-1.05511, 0.7456736, -1.770303, 1, 0.7960784, 0, 1,
-1.052087, -1.074811, -1.6317, 1, 0.8039216, 0, 1,
-1.048252, 1.783473, -1.39134, 1, 0.8117647, 0, 1,
-1.044856, 1.588237, 0.2590458, 1, 0.8156863, 0, 1,
-1.044243, -0.3019921, -0.9219108, 1, 0.8235294, 0, 1,
-1.017389, 1.329452, -0.4961092, 1, 0.827451, 0, 1,
-1.016282, 1.193853, -0.395533, 1, 0.8352941, 0, 1,
-1.012285, 0.6315531, -2.532651, 1, 0.8392157, 0, 1,
-1.011947, -0.6005511, -2.22644, 1, 0.8470588, 0, 1,
-1.006884, 2.24065, -2.001534, 1, 0.8509804, 0, 1,
-1.002314, 0.3624751, 0.320541, 1, 0.8588235, 0, 1,
-0.999272, 2.306063, 0.3987786, 1, 0.8627451, 0, 1,
-0.993497, 0.02821075, -2.281666, 1, 0.8705882, 0, 1,
-0.9806506, -1.736256, -1.172206, 1, 0.8745098, 0, 1,
-0.9768801, 0.6906946, 0.1579853, 1, 0.8823529, 0, 1,
-0.9750089, -0.8143874, -3.27828, 1, 0.8862745, 0, 1,
-0.9737793, 2.173417, -0.6184967, 1, 0.8941177, 0, 1,
-0.9731697, 1.628779, -2.137319, 1, 0.8980392, 0, 1,
-0.9644814, 0.3500341, -1.938661, 1, 0.9058824, 0, 1,
-0.961489, -0.2938899, -2.244842, 1, 0.9137255, 0, 1,
-0.9610842, 0.8505147, -1.875265, 1, 0.9176471, 0, 1,
-0.9587934, -2.833016, -2.196687, 1, 0.9254902, 0, 1,
-0.9583949, 0.3926948, 0.2809804, 1, 0.9294118, 0, 1,
-0.9475173, -0.8745759, -2.646089, 1, 0.9372549, 0, 1,
-0.9392213, 0.02306176, -1.293483, 1, 0.9411765, 0, 1,
-0.9338008, -1.709326, -2.92001, 1, 0.9490196, 0, 1,
-0.9313269, -0.3990125, -3.03379, 1, 0.9529412, 0, 1,
-0.9243439, -0.8358783, -3.177448, 1, 0.9607843, 0, 1,
-0.9160687, 1.601516, -1.55717, 1, 0.9647059, 0, 1,
-0.915715, -0.8253077, -2.48962, 1, 0.972549, 0, 1,
-0.9130875, 0.0292276, -1.798947, 1, 0.9764706, 0, 1,
-0.9027534, 0.1836186, -0.31437, 1, 0.9843137, 0, 1,
-0.9004512, -0.9823635, -4.485758, 1, 0.9882353, 0, 1,
-0.8836786, 1.069827, -1.776464, 1, 0.9960784, 0, 1,
-0.8769855, -0.1029867, -1.123244, 0.9960784, 1, 0, 1,
-0.8759348, -0.8953919, -2.318597, 0.9921569, 1, 0, 1,
-0.8747395, 1.287977, 0.6658043, 0.9843137, 1, 0, 1,
-0.8728062, 1.128256, -1.322813, 0.9803922, 1, 0, 1,
-0.8726726, -1.378911, -3.082145, 0.972549, 1, 0, 1,
-0.872523, -1.457974, -1.898393, 0.9686275, 1, 0, 1,
-0.8701146, 0.02069822, -1.56071, 0.9607843, 1, 0, 1,
-0.866591, 2.179582, 0.3319118, 0.9568627, 1, 0, 1,
-0.8616719, -0.1921417, -3.598171, 0.9490196, 1, 0, 1,
-0.8614833, 0.9620522, 0.5316179, 0.945098, 1, 0, 1,
-0.8583959, -0.2945941, -3.206836, 0.9372549, 1, 0, 1,
-0.8555109, 0.7490633, -1.778303, 0.9333333, 1, 0, 1,
-0.8536312, 0.8647279, -0.4142703, 0.9254902, 1, 0, 1,
-0.8531272, 1.522254, -3.131453, 0.9215686, 1, 0, 1,
-0.8526986, -0.1122293, -2.711941, 0.9137255, 1, 0, 1,
-0.8526406, -0.008954814, 1.731091, 0.9098039, 1, 0, 1,
-0.8520611, 0.4415903, -1.947598, 0.9019608, 1, 0, 1,
-0.8490655, -1.094366, -2.284671, 0.8941177, 1, 0, 1,
-0.8473129, 0.2824093, -0.7635549, 0.8901961, 1, 0, 1,
-0.8470238, -0.6946952, -1.768969, 0.8823529, 1, 0, 1,
-0.8463413, -1.244346, -2.539227, 0.8784314, 1, 0, 1,
-0.8373618, 1.730434, -1.23509, 0.8705882, 1, 0, 1,
-0.8351239, -0.2188836, -1.844079, 0.8666667, 1, 0, 1,
-0.8313341, -0.7959707, -2.019602, 0.8588235, 1, 0, 1,
-0.828778, -1.57044, -3.030147, 0.854902, 1, 0, 1,
-0.8234152, 0.151171, -2.598487, 0.8470588, 1, 0, 1,
-0.8226462, 0.1070925, -3.064183, 0.8431373, 1, 0, 1,
-0.820759, 0.5302841, -0.974444, 0.8352941, 1, 0, 1,
-0.8188001, -1.12517, -3.724986, 0.8313726, 1, 0, 1,
-0.8155394, 1.572379, -1.055984, 0.8235294, 1, 0, 1,
-0.807333, 0.2457937, -0.8721879, 0.8196079, 1, 0, 1,
-0.8062528, -1.950234, -3.091585, 0.8117647, 1, 0, 1,
-0.8053728, -1.117289, -2.677334, 0.8078431, 1, 0, 1,
-0.8021978, -2.659918, -2.839701, 0.8, 1, 0, 1,
-0.7987174, -0.149556, 0.2390235, 0.7921569, 1, 0, 1,
-0.7986088, 0.9644557, -2.563259, 0.7882353, 1, 0, 1,
-0.7973572, 1.468062, 0.8819879, 0.7803922, 1, 0, 1,
-0.7960267, -0.1457713, -1.177046, 0.7764706, 1, 0, 1,
-0.795711, -0.1813598, -1.776077, 0.7686275, 1, 0, 1,
-0.7931708, -0.7872158, -2.429118, 0.7647059, 1, 0, 1,
-0.7902794, -0.4732255, -2.454155, 0.7568628, 1, 0, 1,
-0.7870554, 0.5506471, -1.270144, 0.7529412, 1, 0, 1,
-0.7849174, 1.308453, -2.275244, 0.7450981, 1, 0, 1,
-0.781404, 0.6351199, -0.6523132, 0.7411765, 1, 0, 1,
-0.7743579, -0.07535265, -1.815569, 0.7333333, 1, 0, 1,
-0.7740665, 1.09775, -1.69639, 0.7294118, 1, 0, 1,
-0.7738588, 1.337086, -0.2423855, 0.7215686, 1, 0, 1,
-0.7732652, 0.528625, -0.2512747, 0.7176471, 1, 0, 1,
-0.7686123, 0.7196339, -1.073995, 0.7098039, 1, 0, 1,
-0.7674945, 0.5945567, -0.3578799, 0.7058824, 1, 0, 1,
-0.7634232, -0.2838043, -2.265073, 0.6980392, 1, 0, 1,
-0.7616832, -0.478377, -1.8236, 0.6901961, 1, 0, 1,
-0.7604212, 0.4963716, -0.5006112, 0.6862745, 1, 0, 1,
-0.7538528, 1.766115, -0.02016666, 0.6784314, 1, 0, 1,
-0.7532859, 3.004545, -1.972406, 0.6745098, 1, 0, 1,
-0.748733, 0.0414271, -2.393447, 0.6666667, 1, 0, 1,
-0.7420136, -1.679989, -1.006489, 0.6627451, 1, 0, 1,
-0.7393846, -0.8607419, -1.610608, 0.654902, 1, 0, 1,
-0.736973, -1.569015, -2.381346, 0.6509804, 1, 0, 1,
-0.7345307, 0.08371563, -0.5403885, 0.6431373, 1, 0, 1,
-0.7324153, -0.6230432, -1.628714, 0.6392157, 1, 0, 1,
-0.7243396, -0.2173471, -1.070497, 0.6313726, 1, 0, 1,
-0.7237034, 1.412072, -0.6693549, 0.627451, 1, 0, 1,
-0.7143676, 0.1986109, -1.506596, 0.6196079, 1, 0, 1,
-0.713351, 1.315786, -0.5596415, 0.6156863, 1, 0, 1,
-0.7104193, 0.6988559, -2.20752, 0.6078432, 1, 0, 1,
-0.7086981, 1.575485, 0.5727749, 0.6039216, 1, 0, 1,
-0.7051192, -1.204919, -2.035336, 0.5960785, 1, 0, 1,
-0.700611, -1.656273, -1.717673, 0.5882353, 1, 0, 1,
-0.6993371, -1.048178, -3.896739, 0.5843138, 1, 0, 1,
-0.6987919, -0.8210585, -2.122101, 0.5764706, 1, 0, 1,
-0.696458, 1.057145, -0.6421932, 0.572549, 1, 0, 1,
-0.6873814, 0.1740788, -0.1111907, 0.5647059, 1, 0, 1,
-0.6856057, -0.3986914, -2.33006, 0.5607843, 1, 0, 1,
-0.6797442, 0.7644669, -0.05388652, 0.5529412, 1, 0, 1,
-0.6748926, -0.6677287, -2.037328, 0.5490196, 1, 0, 1,
-0.6737967, 0.2136521, -1.838546, 0.5411765, 1, 0, 1,
-0.6730229, 0.7272989, -1.526495, 0.5372549, 1, 0, 1,
-0.6684562, -0.9836379, -2.17993, 0.5294118, 1, 0, 1,
-0.6676866, 0.1380798, -0.8397717, 0.5254902, 1, 0, 1,
-0.6668357, 0.2387382, -1.599076, 0.5176471, 1, 0, 1,
-0.6663942, 0.3883417, -2.237619, 0.5137255, 1, 0, 1,
-0.6627509, 0.08801152, -3.238017, 0.5058824, 1, 0, 1,
-0.6604929, -0.622823, 0.0600653, 0.5019608, 1, 0, 1,
-0.6584464, -1.414689, -2.063082, 0.4941176, 1, 0, 1,
-0.6573856, 1.606117, -1.01596, 0.4862745, 1, 0, 1,
-0.6573173, 0.3950635, -2.305346, 0.4823529, 1, 0, 1,
-0.6561298, -0.2783617, -0.9647472, 0.4745098, 1, 0, 1,
-0.6542029, -1.113237, -1.850204, 0.4705882, 1, 0, 1,
-0.6475034, 1.172972, -2.136579, 0.4627451, 1, 0, 1,
-0.6454865, 0.5363399, -1.103177, 0.4588235, 1, 0, 1,
-0.6421541, 1.494638, -1.720353, 0.4509804, 1, 0, 1,
-0.6413241, -0.5437238, -2.025373, 0.4470588, 1, 0, 1,
-0.6387419, 2.110058, -0.4679095, 0.4392157, 1, 0, 1,
-0.6375874, -0.3501705, -2.054978, 0.4352941, 1, 0, 1,
-0.6298893, 1.412212, -0.5702451, 0.427451, 1, 0, 1,
-0.6298649, -0.9829906, -2.386595, 0.4235294, 1, 0, 1,
-0.6293889, -1.041833, -2.987622, 0.4156863, 1, 0, 1,
-0.6257476, -1.288713, -2.930208, 0.4117647, 1, 0, 1,
-0.6243955, 0.2148225, -2.347748, 0.4039216, 1, 0, 1,
-0.6243297, -0.5388584, -1.758109, 0.3960784, 1, 0, 1,
-0.6182974, 1.109255, -1.029768, 0.3921569, 1, 0, 1,
-0.6144828, 1.630765, -0.08059386, 0.3843137, 1, 0, 1,
-0.609269, 1.131023, 0.2267358, 0.3803922, 1, 0, 1,
-0.6087762, 0.1014782, -0.009528392, 0.372549, 1, 0, 1,
-0.6040307, -1.343322, -2.163644, 0.3686275, 1, 0, 1,
-0.603092, -0.8418935, -3.420862, 0.3607843, 1, 0, 1,
-0.6005406, -0.1122058, -1.199388, 0.3568628, 1, 0, 1,
-0.6003672, -0.5556519, -1.200033, 0.3490196, 1, 0, 1,
-0.5977388, -0.03360584, -1.214642, 0.345098, 1, 0, 1,
-0.5955405, 0.8877842, 0.7386956, 0.3372549, 1, 0, 1,
-0.5946476, 0.6834441, 0.2526815, 0.3333333, 1, 0, 1,
-0.587835, -0.3644293, -3.286088, 0.3254902, 1, 0, 1,
-0.5862261, 0.9492529, -0.03390706, 0.3215686, 1, 0, 1,
-0.5799174, -0.904704, -3.676098, 0.3137255, 1, 0, 1,
-0.5792605, -2.514721, -2.55103, 0.3098039, 1, 0, 1,
-0.5786071, 0.02676455, -2.299988, 0.3019608, 1, 0, 1,
-0.5778948, -0.9251916, -2.421907, 0.2941177, 1, 0, 1,
-0.574335, 1.346233, -0.9646987, 0.2901961, 1, 0, 1,
-0.569181, 1.522335, 0.5601407, 0.282353, 1, 0, 1,
-0.5687177, 1.33643, -0.2979412, 0.2784314, 1, 0, 1,
-0.5606689, 0.4423516, -1.986672, 0.2705882, 1, 0, 1,
-0.5605343, -0.3400993, -2.814271, 0.2666667, 1, 0, 1,
-0.5529464, 0.2256814, -0.5589842, 0.2588235, 1, 0, 1,
-0.5525479, -1.672382, -3.359522, 0.254902, 1, 0, 1,
-0.5504662, 1.987547, -0.4803403, 0.2470588, 1, 0, 1,
-0.549097, 0.7080664, 0.2626657, 0.2431373, 1, 0, 1,
-0.5483578, 0.1982656, -0.775245, 0.2352941, 1, 0, 1,
-0.5465285, 0.4691482, -0.7421061, 0.2313726, 1, 0, 1,
-0.5452804, -1.330493, -3.413265, 0.2235294, 1, 0, 1,
-0.542081, 0.2843766, -0.9268858, 0.2196078, 1, 0, 1,
-0.5418655, 1.550888, 0.1465809, 0.2117647, 1, 0, 1,
-0.5374817, -0.6362479, -2.33198, 0.2078431, 1, 0, 1,
-0.5359185, -1.450251, -2.689647, 0.2, 1, 0, 1,
-0.5340977, -0.4828691, -4.410789, 0.1921569, 1, 0, 1,
-0.5323297, -0.7063941, -3.062866, 0.1882353, 1, 0, 1,
-0.5306575, 1.111244, -0.9659317, 0.1803922, 1, 0, 1,
-0.5281755, 0.6756014, -0.5002432, 0.1764706, 1, 0, 1,
-0.5278218, 0.5712581, -1.561874, 0.1686275, 1, 0, 1,
-0.5213002, 0.3571555, -1.549756, 0.1647059, 1, 0, 1,
-0.517918, 0.03120113, -0.9858731, 0.1568628, 1, 0, 1,
-0.5128821, -0.1373281, -2.220386, 0.1529412, 1, 0, 1,
-0.5123344, -0.6948994, -2.843954, 0.145098, 1, 0, 1,
-0.5082757, 0.4992078, -0.3343931, 0.1411765, 1, 0, 1,
-0.5037296, 0.07550465, -2.596465, 0.1333333, 1, 0, 1,
-0.4998411, -0.8175725, -2.20392, 0.1294118, 1, 0, 1,
-0.4967671, -0.3163483, -2.852124, 0.1215686, 1, 0, 1,
-0.4955807, 0.3663022, -1.07276, 0.1176471, 1, 0, 1,
-0.4953113, 0.3093432, -1.037827, 0.1098039, 1, 0, 1,
-0.4877853, 0.2191794, -1.137532, 0.1058824, 1, 0, 1,
-0.4846415, -2.324992, -3.319962, 0.09803922, 1, 0, 1,
-0.4825715, 0.1167955, -0.5057091, 0.09019608, 1, 0, 1,
-0.4784611, -0.7564579, -2.838024, 0.08627451, 1, 0, 1,
-0.4754643, 1.170384, 1.510172, 0.07843138, 1, 0, 1,
-0.4671463, -1.42324, -3.340791, 0.07450981, 1, 0, 1,
-0.4655406, 1.74381, -1.328947, 0.06666667, 1, 0, 1,
-0.4609233, -1.737318, -3.444984, 0.0627451, 1, 0, 1,
-0.4568576, 0.1114256, -0.6712394, 0.05490196, 1, 0, 1,
-0.4562874, 1.615324, -0.8505743, 0.05098039, 1, 0, 1,
-0.4561368, 0.9531472, -0.6299253, 0.04313726, 1, 0, 1,
-0.4546093, 0.8846304, -1.666598, 0.03921569, 1, 0, 1,
-0.4521628, -0.123023, -0.6014894, 0.03137255, 1, 0, 1,
-0.4446225, 1.629139, -1.368403, 0.02745098, 1, 0, 1,
-0.4427054, -0.1834067, -1.204051, 0.01960784, 1, 0, 1,
-0.4417582, 0.1068574, -0.4467925, 0.01568628, 1, 0, 1,
-0.4401639, 0.6114909, 0.5189055, 0.007843138, 1, 0, 1,
-0.4385779, -1.653898, -2.45446, 0.003921569, 1, 0, 1,
-0.4368738, 0.970324, 0.1186773, 0, 1, 0.003921569, 1,
-0.4361604, 3.840759, 0.6231051, 0, 1, 0.01176471, 1,
-0.4358466, -1.124186, -4.541661, 0, 1, 0.01568628, 1,
-0.4331817, 0.623334, -2.316856, 0, 1, 0.02352941, 1,
-0.4306637, 0.2799241, -0.7890038, 0, 1, 0.02745098, 1,
-0.4287554, -0.9129287, -4.370163, 0, 1, 0.03529412, 1,
-0.4252473, -0.2340555, -2.418108, 0, 1, 0.03921569, 1,
-0.4233078, -0.6977981, -4.082401, 0, 1, 0.04705882, 1,
-0.4189415, -0.9542054, -2.443479, 0, 1, 0.05098039, 1,
-0.4179833, 1.034607, 0.06484061, 0, 1, 0.05882353, 1,
-0.4158736, 0.9449825, 0.5236055, 0, 1, 0.0627451, 1,
-0.4146659, -0.1794864, -0.1181582, 0, 1, 0.07058824, 1,
-0.4112498, 0.4105983, 0.1094305, 0, 1, 0.07450981, 1,
-0.4109243, 0.1905648, -0.06698038, 0, 1, 0.08235294, 1,
-0.4098748, -1.289875, -3.390621, 0, 1, 0.08627451, 1,
-0.4082318, 0.1859263, -0.740769, 0, 1, 0.09411765, 1,
-0.4078496, -0.2527811, -3.429565, 0, 1, 0.1019608, 1,
-0.4056028, -0.2891232, -1.435059, 0, 1, 0.1058824, 1,
-0.4052467, -0.2322048, -2.008052, 0, 1, 0.1137255, 1,
-0.396554, -0.2231437, -3.079673, 0, 1, 0.1176471, 1,
-0.3953427, 2.598988, -0.3231073, 0, 1, 0.1254902, 1,
-0.392632, 2.219769, 0.859085, 0, 1, 0.1294118, 1,
-0.3864799, -0.3855851, -4.327556, 0, 1, 0.1372549, 1,
-0.3848415, -0.5475912, -3.226165, 0, 1, 0.1411765, 1,
-0.3846093, 0.7774637, 2.04017, 0, 1, 0.1490196, 1,
-0.3826763, -0.6766043, -0.9329821, 0, 1, 0.1529412, 1,
-0.3801454, -0.4156463, -3.66326, 0, 1, 0.1607843, 1,
-0.3777606, 1.285728, -0.5595446, 0, 1, 0.1647059, 1,
-0.3742937, -0.07938953, -1.932587, 0, 1, 0.172549, 1,
-0.3740503, -0.4245631, -3.968621, 0, 1, 0.1764706, 1,
-0.3739538, 0.3589257, -1.060974, 0, 1, 0.1843137, 1,
-0.3732834, 0.8269907, -0.5042474, 0, 1, 0.1882353, 1,
-0.3722911, -2.109396, -3.868572, 0, 1, 0.1960784, 1,
-0.3718346, -1.262424, -3.012077, 0, 1, 0.2039216, 1,
-0.3709656, 1.136394, -0.6934167, 0, 1, 0.2078431, 1,
-0.3701287, -0.7397332, -2.728963, 0, 1, 0.2156863, 1,
-0.3676125, 0.4782152, 0.8859213, 0, 1, 0.2196078, 1,
-0.3657835, 0.1209995, -1.294743, 0, 1, 0.227451, 1,
-0.3624809, 0.7761832, 1.17001, 0, 1, 0.2313726, 1,
-0.3589184, 0.09667202, -2.219924, 0, 1, 0.2392157, 1,
-0.3585069, 0.3881923, -2.614321, 0, 1, 0.2431373, 1,
-0.3579123, -0.2121481, -1.651673, 0, 1, 0.2509804, 1,
-0.3519044, -0.6703238, -3.06696, 0, 1, 0.254902, 1,
-0.3456526, 0.1704255, -1.363862, 0, 1, 0.2627451, 1,
-0.3415228, 1.513635, 0.114888, 0, 1, 0.2666667, 1,
-0.338872, -0.569779, -4.051967, 0, 1, 0.2745098, 1,
-0.335694, 1.673573, 0.8374369, 0, 1, 0.2784314, 1,
-0.3351506, 0.190352, -0.3561761, 0, 1, 0.2862745, 1,
-0.3338527, 1.176617, -0.9719179, 0, 1, 0.2901961, 1,
-0.326468, 1.879196, -1.829771, 0, 1, 0.2980392, 1,
-0.3157228, 0.1765188, -2.328284, 0, 1, 0.3058824, 1,
-0.3119891, -1.192828, -2.352212, 0, 1, 0.3098039, 1,
-0.3094077, 1.343003, -0.4341646, 0, 1, 0.3176471, 1,
-0.3035956, -0.7172099, -2.754242, 0, 1, 0.3215686, 1,
-0.2987541, -1.238379, -1.51856, 0, 1, 0.3294118, 1,
-0.2980409, 1.356228, -1.470889, 0, 1, 0.3333333, 1,
-0.2967994, 1.280302, 0.1656524, 0, 1, 0.3411765, 1,
-0.2943082, 0.08842136, -1.255969, 0, 1, 0.345098, 1,
-0.2924221, 0.1412053, -0.7978505, 0, 1, 0.3529412, 1,
-0.2859138, 1.198429, -0.1990083, 0, 1, 0.3568628, 1,
-0.2824252, 0.9948885, -0.4252763, 0, 1, 0.3647059, 1,
-0.2813255, 1.792289, 0.0727343, 0, 1, 0.3686275, 1,
-0.2804604, 0.07484692, 0.7884544, 0, 1, 0.3764706, 1,
-0.2708249, 0.303971, -0.9505846, 0, 1, 0.3803922, 1,
-0.2591315, 0.09202944, -2.097537, 0, 1, 0.3882353, 1,
-0.2578523, 1.480208, 2.262029, 0, 1, 0.3921569, 1,
-0.2570297, 0.2842242, -1.920076, 0, 1, 0.4, 1,
-0.2539863, 0.9060583, 1.553765, 0, 1, 0.4078431, 1,
-0.2538085, 0.3067681, -1.512475, 0, 1, 0.4117647, 1,
-0.2516044, 0.1760148, -0.1196766, 0, 1, 0.4196078, 1,
-0.2501394, 0.9231763, 2.431161, 0, 1, 0.4235294, 1,
-0.2432255, -0.03178172, -3.195786, 0, 1, 0.4313726, 1,
-0.2428655, -0.4207976, -2.185803, 0, 1, 0.4352941, 1,
-0.2415689, -2.655366, -2.718325, 0, 1, 0.4431373, 1,
-0.240395, 0.3466401, -1.597054, 0, 1, 0.4470588, 1,
-0.2340317, 0.5780266, 0.4041848, 0, 1, 0.454902, 1,
-0.232785, 0.3470008, -1.258101, 0, 1, 0.4588235, 1,
-0.2324977, -1.139835, -2.544546, 0, 1, 0.4666667, 1,
-0.232409, -0.5035625, -1.085087, 0, 1, 0.4705882, 1,
-0.2316647, -0.8788518, -2.675904, 0, 1, 0.4784314, 1,
-0.222782, -0.7169351, -3.705046, 0, 1, 0.4823529, 1,
-0.2216265, 0.5751829, 0.6682197, 0, 1, 0.4901961, 1,
-0.2192991, 0.003157478, -2.01666, 0, 1, 0.4941176, 1,
-0.2182721, -0.9250443, -3.104021, 0, 1, 0.5019608, 1,
-0.2165807, -1.936934, -1.544482, 0, 1, 0.509804, 1,
-0.2114799, 0.6920329, 0.5879536, 0, 1, 0.5137255, 1,
-0.2075412, 0.03738258, -1.653104, 0, 1, 0.5215687, 1,
-0.2051431, 1.359325, 0.9289581, 0, 1, 0.5254902, 1,
-0.205071, -0.03873869, -1.567536, 0, 1, 0.5333334, 1,
-0.2021835, 1.177654, -1.734464, 0, 1, 0.5372549, 1,
-0.2009014, 0.03826721, -1.473555, 0, 1, 0.5450981, 1,
-0.2008876, -0.3672829, -2.543235, 0, 1, 0.5490196, 1,
-0.2005731, -0.6543105, -2.304624, 0, 1, 0.5568628, 1,
-0.1875901, 0.1708132, -1.040314, 0, 1, 0.5607843, 1,
-0.1834804, 0.6268909, 0.1887068, 0, 1, 0.5686275, 1,
-0.1810396, 1.505942, 1.454485, 0, 1, 0.572549, 1,
-0.1797649, -0.02316062, -2.351855, 0, 1, 0.5803922, 1,
-0.1775314, 0.07098655, -2.19071, 0, 1, 0.5843138, 1,
-0.1763517, -0.3711407, -3.844743, 0, 1, 0.5921569, 1,
-0.1747155, 0.246618, 0.9992287, 0, 1, 0.5960785, 1,
-0.1740518, 0.1933657, -1.043442, 0, 1, 0.6039216, 1,
-0.1655125, 0.4905895, -0.04518149, 0, 1, 0.6117647, 1,
-0.1585885, 0.2199864, 0.7388235, 0, 1, 0.6156863, 1,
-0.1513923, 0.3931339, 0.5780026, 0, 1, 0.6235294, 1,
-0.1471279, -0.3402448, -3.943828, 0, 1, 0.627451, 1,
-0.1448799, 0.9247231, 0.7524097, 0, 1, 0.6352941, 1,
-0.1423385, 0.4859978, -0.1658892, 0, 1, 0.6392157, 1,
-0.1420826, -0.08839329, -1.865052, 0, 1, 0.6470588, 1,
-0.1372151, -0.8490596, -3.974692, 0, 1, 0.6509804, 1,
-0.1330578, 0.3387425, -0.2429952, 0, 1, 0.6588235, 1,
-0.1323997, -1.603148, -3.17628, 0, 1, 0.6627451, 1,
-0.1302091, -1.012418, -3.22577, 0, 1, 0.6705883, 1,
-0.1277331, 1.417851, 1.056415, 0, 1, 0.6745098, 1,
-0.1276063, 0.9803895, -0.9950957, 0, 1, 0.682353, 1,
-0.1269919, 0.5235287, -0.9079856, 0, 1, 0.6862745, 1,
-0.1261976, -0.3256178, -2.174063, 0, 1, 0.6941177, 1,
-0.1235247, 1.558834, -0.7575843, 0, 1, 0.7019608, 1,
-0.1223271, 0.3864075, 1.074332, 0, 1, 0.7058824, 1,
-0.1218373, 0.8851036, -0.4143444, 0, 1, 0.7137255, 1,
-0.1198208, 0.700352, 0.4636796, 0, 1, 0.7176471, 1,
-0.1178439, 0.2420148, -0.0914197, 0, 1, 0.7254902, 1,
-0.1156255, 0.5358398, 1.699489, 0, 1, 0.7294118, 1,
-0.1153512, -0.2450689, -3.212397, 0, 1, 0.7372549, 1,
-0.1129923, 1.26862, -1.021115, 0, 1, 0.7411765, 1,
-0.1119833, 0.6137031, -0.8328811, 0, 1, 0.7490196, 1,
-0.1103629, 1.536663, -0.1471153, 0, 1, 0.7529412, 1,
-0.1102857, -0.8534927, -1.923107, 0, 1, 0.7607843, 1,
-0.1085728, 1.019367, -0.0107072, 0, 1, 0.7647059, 1,
-0.1073046, -1.564379, -2.73989, 0, 1, 0.772549, 1,
-0.1053127, -0.8437973, -3.046591, 0, 1, 0.7764706, 1,
-0.104611, -0.1402597, -2.845344, 0, 1, 0.7843137, 1,
-0.1044587, 0.3950735, -1.109408, 0, 1, 0.7882353, 1,
-0.1038853, -0.4730719, -3.414803, 0, 1, 0.7960784, 1,
-0.1002062, -0.02431903, -0.992443, 0, 1, 0.8039216, 1,
-0.09949967, 1.359351, -0.7281047, 0, 1, 0.8078431, 1,
-0.09947497, 0.995628, -1.235607, 0, 1, 0.8156863, 1,
-0.09776478, -0.1296548, -0.9710655, 0, 1, 0.8196079, 1,
-0.09693888, 0.2555888, 0.4774881, 0, 1, 0.827451, 1,
-0.09611411, 0.5726123, -2.09439, 0, 1, 0.8313726, 1,
-0.08980828, 0.164559, -0.5637426, 0, 1, 0.8392157, 1,
-0.08971491, 1.066675, 0.9082206, 0, 1, 0.8431373, 1,
-0.08871015, 1.077261, -0.08600127, 0, 1, 0.8509804, 1,
-0.08795109, -0.2657652, -2.448436, 0, 1, 0.854902, 1,
-0.08504388, -1.478837, -2.407501, 0, 1, 0.8627451, 1,
-0.08359775, -0.1765337, -1.271727, 0, 1, 0.8666667, 1,
-0.08062632, -1.464841, -2.688926, 0, 1, 0.8745098, 1,
-0.07562996, -0.5360835, -3.480314, 0, 1, 0.8784314, 1,
-0.07300723, 0.5254577, 1.92573, 0, 1, 0.8862745, 1,
-0.06998583, 1.289153, -0.7041503, 0, 1, 0.8901961, 1,
-0.06823019, -0.6515828, -3.376506, 0, 1, 0.8980392, 1,
-0.06757493, 0.03724637, -0.8386097, 0, 1, 0.9058824, 1,
-0.06017098, -0.3558897, -1.205993, 0, 1, 0.9098039, 1,
-0.05995101, 0.8519756, 0.5084556, 0, 1, 0.9176471, 1,
-0.05810801, -2.588164, -1.321633, 0, 1, 0.9215686, 1,
-0.05713226, 0.5543345, -0.4995389, 0, 1, 0.9294118, 1,
-0.0550823, -1.263657, -2.306372, 0, 1, 0.9333333, 1,
-0.04969405, 1.911878, 0.3549556, 0, 1, 0.9411765, 1,
-0.04632178, 0.2588418, -0.2717229, 0, 1, 0.945098, 1,
-0.03849546, -1.594319, -4.811582, 0, 1, 0.9529412, 1,
-0.03801749, -1.433194, -2.958302, 0, 1, 0.9568627, 1,
-0.03507186, -0.5519726, -3.09535, 0, 1, 0.9647059, 1,
-0.03486641, -1.495905, -3.789349, 0, 1, 0.9686275, 1,
-0.03313683, -0.8744733, -3.943153, 0, 1, 0.9764706, 1,
-0.03249124, -0.9214133, -1.937524, 0, 1, 0.9803922, 1,
-0.03215168, 0.402253, -0.6360469, 0, 1, 0.9882353, 1,
-0.02720645, 0.5183164, -1.240807, 0, 1, 0.9921569, 1,
-0.02386733, -1.171703, -4.036176, 0, 1, 1, 1,
-0.02219424, 1.205261, -1.157629, 0, 0.9921569, 1, 1,
-0.02024806, -0.4678431, -3.797186, 0, 0.9882353, 1, 1,
-0.01729898, 0.6368983, 0.2728932, 0, 0.9803922, 1, 1,
-0.0143821, -0.8909212, -3.709766, 0, 0.9764706, 1, 1,
-0.009118811, -1.579111, -3.202318, 0, 0.9686275, 1, 1,
-0.005433372, -1.482753, -4.873335, 0, 0.9647059, 1, 1,
-0.00488809, -0.4776697, -2.440251, 0, 0.9568627, 1, 1,
0.001723668, -1.181018, 5.51192, 0, 0.9529412, 1, 1,
0.002659233, 0.9307269, 0.4647264, 0, 0.945098, 1, 1,
0.006077883, -0.8450322, 3.797553, 0, 0.9411765, 1, 1,
0.01323767, -0.6952205, 3.539659, 0, 0.9333333, 1, 1,
0.01414097, 1.205936, -1.102605, 0, 0.9294118, 1, 1,
0.01912444, 0.624517, 2.130073, 0, 0.9215686, 1, 1,
0.02101719, 2.425144, 0.5237373, 0, 0.9176471, 1, 1,
0.02134766, 0.5634429, -0.2852486, 0, 0.9098039, 1, 1,
0.0215941, -1.403015, 4.345101, 0, 0.9058824, 1, 1,
0.02162775, 1.362807, -0.483349, 0, 0.8980392, 1, 1,
0.0217602, 1.272489, -0.7794715, 0, 0.8901961, 1, 1,
0.0278383, 0.1321725, -0.2841512, 0, 0.8862745, 1, 1,
0.03078436, -0.5208333, 3.732053, 0, 0.8784314, 1, 1,
0.03234703, 1.441104, 0.4463702, 0, 0.8745098, 1, 1,
0.0330259, -0.6877304, 2.26498, 0, 0.8666667, 1, 1,
0.03625682, 0.386581, 0.5870656, 0, 0.8627451, 1, 1,
0.03768329, 1.327981, -0.6054685, 0, 0.854902, 1, 1,
0.04262961, -0.7385259, 3.326804, 0, 0.8509804, 1, 1,
0.04535699, -2.569431, 4.766286, 0, 0.8431373, 1, 1,
0.04680537, -0.493489, 3.178844, 0, 0.8392157, 1, 1,
0.05457934, 0.9317275, 1.070959, 0, 0.8313726, 1, 1,
0.0553702, -0.2800221, 2.849262, 0, 0.827451, 1, 1,
0.05719572, 0.1000506, 1.735573, 0, 0.8196079, 1, 1,
0.05772813, 1.064738, 0.7899516, 0, 0.8156863, 1, 1,
0.05942423, -0.9769613, 1.939977, 0, 0.8078431, 1, 1,
0.05959728, 0.1231314, -0.4770757, 0, 0.8039216, 1, 1,
0.06006012, -1.306212, 4.476084, 0, 0.7960784, 1, 1,
0.06206426, 1.446821, -0.361086, 0, 0.7882353, 1, 1,
0.06274432, 2.201216, 0.6350805, 0, 0.7843137, 1, 1,
0.06606499, 0.3378241, -0.05983962, 0, 0.7764706, 1, 1,
0.06989782, 2.672862, -0.5697433, 0, 0.772549, 1, 1,
0.07294929, -1.608787, 2.94727, 0, 0.7647059, 1, 1,
0.07389013, 1.209471, 0.4955948, 0, 0.7607843, 1, 1,
0.07646863, 0.6595758, -1.277435, 0, 0.7529412, 1, 1,
0.08402853, -0.3010864, 3.123454, 0, 0.7490196, 1, 1,
0.08463524, 0.04244686, 0.6192867, 0, 0.7411765, 1, 1,
0.08618076, -0.4401433, 3.928975, 0, 0.7372549, 1, 1,
0.0871469, 1.427316, 0.9349463, 0, 0.7294118, 1, 1,
0.09269597, 1.80265, -1.124797, 0, 0.7254902, 1, 1,
0.09789956, -0.8023595, 5.398546, 0, 0.7176471, 1, 1,
0.09989542, -2.013704, 4.944938, 0, 0.7137255, 1, 1,
0.1011637, -1.091275, 3.34902, 0, 0.7058824, 1, 1,
0.1057973, -0.1110488, 3.206273, 0, 0.6980392, 1, 1,
0.1067899, 0.4258348, -0.1073207, 0, 0.6941177, 1, 1,
0.1079627, 0.7347155, 1.490688, 0, 0.6862745, 1, 1,
0.1105279, 0.0700006, 0.5157292, 0, 0.682353, 1, 1,
0.1135249, -0.2254071, 0.950067, 0, 0.6745098, 1, 1,
0.1162246, 0.6549033, -0.1099115, 0, 0.6705883, 1, 1,
0.11914, 0.6689233, -2.225907, 0, 0.6627451, 1, 1,
0.1204894, 0.3140956, 0.1491921, 0, 0.6588235, 1, 1,
0.1270414, -1.015822, 3.574883, 0, 0.6509804, 1, 1,
0.131642, -2.280239, 3.397739, 0, 0.6470588, 1, 1,
0.1324131, -0.3369351, 5.555335, 0, 0.6392157, 1, 1,
0.1337966, -1.383613, 2.353479, 0, 0.6352941, 1, 1,
0.1412269, -1.203405, 3.224353, 0, 0.627451, 1, 1,
0.1453741, -0.2041119, 2.629693, 0, 0.6235294, 1, 1,
0.1462002, 1.225932, -0.35842, 0, 0.6156863, 1, 1,
0.1470969, 0.07340977, 0.9413844, 0, 0.6117647, 1, 1,
0.147201, -0.8364925, 4.535287, 0, 0.6039216, 1, 1,
0.1516461, 1.604523, -0.4546162, 0, 0.5960785, 1, 1,
0.1524834, 0.2607466, -0.190494, 0, 0.5921569, 1, 1,
0.1525379, -0.3334713, 2.326056, 0, 0.5843138, 1, 1,
0.154588, 0.2846511, -0.222127, 0, 0.5803922, 1, 1,
0.1588852, 1.513137, -1.435597, 0, 0.572549, 1, 1,
0.1600905, 0.1083478, 1.004052, 0, 0.5686275, 1, 1,
0.1630107, -0.508403, 3.524724, 0, 0.5607843, 1, 1,
0.1630712, 1.073565, 0.6308113, 0, 0.5568628, 1, 1,
0.1634841, -0.7067118, 2.315297, 0, 0.5490196, 1, 1,
0.1650779, 0.005538661, 1.388667, 0, 0.5450981, 1, 1,
0.1666439, -0.3537257, 1.850155, 0, 0.5372549, 1, 1,
0.171111, -1.080238, 3.224267, 0, 0.5333334, 1, 1,
0.1711617, 1.124458, 0.2928388, 0, 0.5254902, 1, 1,
0.1829424, 0.8564659, -1.656483, 0, 0.5215687, 1, 1,
0.1847548, 2.296475, -0.9831042, 0, 0.5137255, 1, 1,
0.1872601, 1.00062, -0.1022897, 0, 0.509804, 1, 1,
0.1894399, 0.9393377, 1.54668, 0, 0.5019608, 1, 1,
0.1908403, 0.9841044, 1.840221, 0, 0.4941176, 1, 1,
0.1930375, -1.964332, 2.717161, 0, 0.4901961, 1, 1,
0.1935971, 0.403671, -0.005160168, 0, 0.4823529, 1, 1,
0.1936552, -0.6537499, 1.915695, 0, 0.4784314, 1, 1,
0.200187, 1.919363, 1.80658, 0, 0.4705882, 1, 1,
0.2032107, -0.5571027, 3.393737, 0, 0.4666667, 1, 1,
0.2048604, -1.237508, 2.681697, 0, 0.4588235, 1, 1,
0.2071129, 0.4775556, -0.720994, 0, 0.454902, 1, 1,
0.2095723, 0.2977417, 0.231237, 0, 0.4470588, 1, 1,
0.2100936, -0.09700973, 2.506981, 0, 0.4431373, 1, 1,
0.2121011, 0.339936, 0.3953532, 0, 0.4352941, 1, 1,
0.2128134, 1.96221, 1.780618, 0, 0.4313726, 1, 1,
0.2132063, -1.003909, 3.183409, 0, 0.4235294, 1, 1,
0.2161954, 0.3041332, 1.997406, 0, 0.4196078, 1, 1,
0.2165158, 0.8518712, -1.56879, 0, 0.4117647, 1, 1,
0.2169688, -0.1432044, 3.286399, 0, 0.4078431, 1, 1,
0.2188612, 0.6562988, 2.579489, 0, 0.4, 1, 1,
0.2220818, 1.060716, -0.7737586, 0, 0.3921569, 1, 1,
0.2229608, 0.1194726, 1.654372, 0, 0.3882353, 1, 1,
0.2230975, -0.1986446, 1.783206, 0, 0.3803922, 1, 1,
0.2324862, -0.3251578, 1.289611, 0, 0.3764706, 1, 1,
0.2426723, 1.357782, -1.899658, 0, 0.3686275, 1, 1,
0.2440684, -1.343705, 2.597634, 0, 0.3647059, 1, 1,
0.244779, -0.9151546, 1.895439, 0, 0.3568628, 1, 1,
0.2453428, -1.511197, 0.7093053, 0, 0.3529412, 1, 1,
0.2460885, 0.7822584, 0.9512379, 0, 0.345098, 1, 1,
0.2534486, -0.8665775, 2.540899, 0, 0.3411765, 1, 1,
0.2556237, 0.8095003, 0.2105742, 0, 0.3333333, 1, 1,
0.2574147, 0.318938, 2.253516, 0, 0.3294118, 1, 1,
0.2583353, 0.3161921, 1.009678, 0, 0.3215686, 1, 1,
0.2602049, -0.1164204, 2.060396, 0, 0.3176471, 1, 1,
0.2603206, -0.2583307, 3.88923, 0, 0.3098039, 1, 1,
0.2622105, 1.258986, -0.1948935, 0, 0.3058824, 1, 1,
0.2636997, -0.9927762, 2.490254, 0, 0.2980392, 1, 1,
0.2685771, 1.009769, 0.8378934, 0, 0.2901961, 1, 1,
0.2686407, 0.0999675, 1.153961, 0, 0.2862745, 1, 1,
0.2722508, 0.9520414, 1.424212, 0, 0.2784314, 1, 1,
0.2765612, -0.8458731, 1.903927, 0, 0.2745098, 1, 1,
0.2788258, 1.184669, 0.2419254, 0, 0.2666667, 1, 1,
0.2842574, -0.187277, 1.525932, 0, 0.2627451, 1, 1,
0.286465, 1.162137, 0.5078494, 0, 0.254902, 1, 1,
0.2890037, 1.510993, 1.130786, 0, 0.2509804, 1, 1,
0.2892215, 0.3389519, -0.948005, 0, 0.2431373, 1, 1,
0.2958022, -2.281465, 3.269083, 0, 0.2392157, 1, 1,
0.2976255, -0.7749025, 1.010005, 0, 0.2313726, 1, 1,
0.3076546, 0.6598086, 1.584112, 0, 0.227451, 1, 1,
0.316907, 1.75764, 0.3863368, 0, 0.2196078, 1, 1,
0.3176668, 0.07563855, 1.601423, 0, 0.2156863, 1, 1,
0.320287, 0.3082234, 1.164555, 0, 0.2078431, 1, 1,
0.3225699, -0.3643521, 0.7105408, 0, 0.2039216, 1, 1,
0.3269573, -0.9879073, 3.789994, 0, 0.1960784, 1, 1,
0.3275482, -0.02660139, 1.754928, 0, 0.1882353, 1, 1,
0.3280202, -1.29659, 3.167908, 0, 0.1843137, 1, 1,
0.3308802, 0.3052273, 2.633963, 0, 0.1764706, 1, 1,
0.3313052, 0.4664401, 1.484974, 0, 0.172549, 1, 1,
0.3328489, 0.9524533, 0.1211059, 0, 0.1647059, 1, 1,
0.3331149, -1.504714, 1.923026, 0, 0.1607843, 1, 1,
0.3345845, -0.9094929, 3.665085, 0, 0.1529412, 1, 1,
0.3346713, 0.9161046, -1.192285, 0, 0.1490196, 1, 1,
0.3359126, 0.820979, 1.915841, 0, 0.1411765, 1, 1,
0.3386054, 0.6895977, 0.1904148, 0, 0.1372549, 1, 1,
0.3411189, -0.129746, 1.419737, 0, 0.1294118, 1, 1,
0.3416625, -1.202833, 2.687354, 0, 0.1254902, 1, 1,
0.3436338, -1.391293, 2.952856, 0, 0.1176471, 1, 1,
0.3452566, 0.1421999, 1.462671, 0, 0.1137255, 1, 1,
0.3494237, 0.3130267, 1.799719, 0, 0.1058824, 1, 1,
0.3496062, -0.274067, 2.594131, 0, 0.09803922, 1, 1,
0.3529197, 0.9026069, 0.8785959, 0, 0.09411765, 1, 1,
0.3539183, 0.1268853, 0.3298721, 0, 0.08627451, 1, 1,
0.3547247, -1.961963, 2.399252, 0, 0.08235294, 1, 1,
0.3586817, 0.8304552, 0.4885457, 0, 0.07450981, 1, 1,
0.3599052, 0.2384581, -0.8778537, 0, 0.07058824, 1, 1,
0.3755459, 1.13191, 0.05916654, 0, 0.0627451, 1, 1,
0.3756574, -0.8775935, 3.118359, 0, 0.05882353, 1, 1,
0.389813, 0.4962446, 0.3848106, 0, 0.05098039, 1, 1,
0.3963822, 0.1750369, 1.998495, 0, 0.04705882, 1, 1,
0.3990594, -1.186488, 3.328904, 0, 0.03921569, 1, 1,
0.4037419, -1.477861, 2.189038, 0, 0.03529412, 1, 1,
0.4063304, -0.299719, 4.40519, 0, 0.02745098, 1, 1,
0.4067079, 2.19876, 0.1021844, 0, 0.02352941, 1, 1,
0.4102551, 2.040072, 0.9083809, 0, 0.01568628, 1, 1,
0.4108153, -0.2400219, 3.946916, 0, 0.01176471, 1, 1,
0.4133497, 1.52251, 1.364286, 0, 0.003921569, 1, 1,
0.4136496, -0.3673633, 1.980149, 0.003921569, 0, 1, 1,
0.4159336, -0.744107, 3.010778, 0.007843138, 0, 1, 1,
0.4201183, 0.4547006, -0.4836905, 0.01568628, 0, 1, 1,
0.4204222, -0.6188464, 2.990599, 0.01960784, 0, 1, 1,
0.4233508, -1.430116, 2.795947, 0.02745098, 0, 1, 1,
0.4241549, 1.104961, 0.3569343, 0.03137255, 0, 1, 1,
0.4365007, 0.046953, 0.4862483, 0.03921569, 0, 1, 1,
0.4372694, -0.9467769, 2.810035, 0.04313726, 0, 1, 1,
0.438207, 0.6900867, 2.060383, 0.05098039, 0, 1, 1,
0.4395761, 0.8799595, 0.4294872, 0.05490196, 0, 1, 1,
0.4407146, 2.03056, -0.6773958, 0.0627451, 0, 1, 1,
0.4415374, -0.07174162, 1.290306, 0.06666667, 0, 1, 1,
0.4424753, -0.3173781, 3.804172, 0.07450981, 0, 1, 1,
0.443283, 0.3431671, -0.4672755, 0.07843138, 0, 1, 1,
0.4486792, 0.5223689, 0.9168005, 0.08627451, 0, 1, 1,
0.4492936, -0.08137788, 1.885475, 0.09019608, 0, 1, 1,
0.4512357, -1.494059, 1.814644, 0.09803922, 0, 1, 1,
0.4517993, 2.186955, -0.171354, 0.1058824, 0, 1, 1,
0.4569969, 0.1240024, 2.84629, 0.1098039, 0, 1, 1,
0.4596318, -0.6570198, 3.970053, 0.1176471, 0, 1, 1,
0.4628045, 0.5572094, 0.37778, 0.1215686, 0, 1, 1,
0.4667802, 0.2850063, 1.058663, 0.1294118, 0, 1, 1,
0.4685354, 0.123064, 1.031445, 0.1333333, 0, 1, 1,
0.4773136, -0.8412949, 1.597303, 0.1411765, 0, 1, 1,
0.4786372, -0.4502819, 0.5080669, 0.145098, 0, 1, 1,
0.4815586, 0.08950959, 0.5569438, 0.1529412, 0, 1, 1,
0.4843999, 0.6792641, 0.1860713, 0.1568628, 0, 1, 1,
0.4853874, 0.9905201, 2.576508, 0.1647059, 0, 1, 1,
0.5001569, -0.3970278, 0.7681995, 0.1686275, 0, 1, 1,
0.5016827, 0.439523, 1.195481, 0.1764706, 0, 1, 1,
0.5016959, 0.9933934, 1.287803, 0.1803922, 0, 1, 1,
0.5032734, 0.1810778, -0.9405686, 0.1882353, 0, 1, 1,
0.5047395, 1.0186, -0.09933998, 0.1921569, 0, 1, 1,
0.5138116, 0.7330011, 0.9688175, 0.2, 0, 1, 1,
0.5142947, -0.720692, 1.564822, 0.2078431, 0, 1, 1,
0.5144972, 0.8128732, -0.5850563, 0.2117647, 0, 1, 1,
0.5179176, -0.1239503, 1.446718, 0.2196078, 0, 1, 1,
0.5194028, -0.4775506, 3.013216, 0.2235294, 0, 1, 1,
0.520665, -2.120646, 3.00623, 0.2313726, 0, 1, 1,
0.5214267, -1.492509, 3.452482, 0.2352941, 0, 1, 1,
0.5226313, -1.473092, 1.191749, 0.2431373, 0, 1, 1,
0.5259858, -0.1159911, -0.01240912, 0.2470588, 0, 1, 1,
0.5283505, -2.493057, 2.678663, 0.254902, 0, 1, 1,
0.5286474, -0.7062808, 3.080765, 0.2588235, 0, 1, 1,
0.5302767, 1.292718, -1.25078, 0.2666667, 0, 1, 1,
0.5326308, 1.290603, -0.3525644, 0.2705882, 0, 1, 1,
0.5328037, -0.4669848, 1.590514, 0.2784314, 0, 1, 1,
0.5328268, 0.3706897, 1.842389, 0.282353, 0, 1, 1,
0.5420582, 1.070167, -0.2549177, 0.2901961, 0, 1, 1,
0.5448813, -0.6930007, 3.618278, 0.2941177, 0, 1, 1,
0.5464873, 1.24712, -1.988289, 0.3019608, 0, 1, 1,
0.5517995, -0.9103073, 1.573096, 0.3098039, 0, 1, 1,
0.5522345, -1.617345, 3.589496, 0.3137255, 0, 1, 1,
0.5524877, -0.2906801, 2.066292, 0.3215686, 0, 1, 1,
0.5560792, 0.392284, 0.3553058, 0.3254902, 0, 1, 1,
0.5589023, 0.3697725, -1.122859, 0.3333333, 0, 1, 1,
0.5601202, 0.8832464, 2.008045, 0.3372549, 0, 1, 1,
0.5683296, 0.4316222, 0.7907045, 0.345098, 0, 1, 1,
0.5730466, 0.9319302, 1.482473, 0.3490196, 0, 1, 1,
0.5749119, -3.77505, 3.887653, 0.3568628, 0, 1, 1,
0.5756464, -0.5888035, 2.81833, 0.3607843, 0, 1, 1,
0.5773842, -0.5766284, 2.006947, 0.3686275, 0, 1, 1,
0.5814951, 0.3127094, 2.607372, 0.372549, 0, 1, 1,
0.5875615, 1.674071, -0.5563028, 0.3803922, 0, 1, 1,
0.5890614, -3.136198, 2.147024, 0.3843137, 0, 1, 1,
0.5912309, 0.3446802, 2.149365, 0.3921569, 0, 1, 1,
0.6008354, 0.501725, 1.256873, 0.3960784, 0, 1, 1,
0.6026319, 0.08193681, 2.362424, 0.4039216, 0, 1, 1,
0.6053841, -1.35837, 3.008288, 0.4117647, 0, 1, 1,
0.6056517, 0.01175935, 2.545885, 0.4156863, 0, 1, 1,
0.6069697, 0.1709661, 0.7583618, 0.4235294, 0, 1, 1,
0.6070345, -1.112519, 4.738006, 0.427451, 0, 1, 1,
0.6075169, 0.4979951, 1.449281, 0.4352941, 0, 1, 1,
0.610217, -0.3316751, 0.5129731, 0.4392157, 0, 1, 1,
0.6153343, -0.1454716, 1.303516, 0.4470588, 0, 1, 1,
0.6155378, 2.190177, 0.7758418, 0.4509804, 0, 1, 1,
0.6208512, -1.222201, 4.411881, 0.4588235, 0, 1, 1,
0.6258388, 0.6502135, 0.9857806, 0.4627451, 0, 1, 1,
0.6263106, -0.9528967, 3.048465, 0.4705882, 0, 1, 1,
0.6353489, -0.379573, 2.73952, 0.4745098, 0, 1, 1,
0.636923, 0.1712869, 1.123428, 0.4823529, 0, 1, 1,
0.6395674, 0.9021131, 1.985904, 0.4862745, 0, 1, 1,
0.6489425, -0.3334237, 2.153583, 0.4941176, 0, 1, 1,
0.6527325, 2.153533, 0.6642971, 0.5019608, 0, 1, 1,
0.6539021, 1.659116, -0.8286965, 0.5058824, 0, 1, 1,
0.6565593, -0.5526546, 5.03191, 0.5137255, 0, 1, 1,
0.6616716, -1.714336, 3.626348, 0.5176471, 0, 1, 1,
0.6656066, -0.02666233, 1.813878, 0.5254902, 0, 1, 1,
0.6667396, 0.5366125, 1.698371, 0.5294118, 0, 1, 1,
0.6668718, -0.4650327, 2.325688, 0.5372549, 0, 1, 1,
0.6782839, -1.47436, 1.232923, 0.5411765, 0, 1, 1,
0.6867137, 0.9979151, 0.4738561, 0.5490196, 0, 1, 1,
0.6873754, -1.186997, 3.047917, 0.5529412, 0, 1, 1,
0.6967548, -0.1698803, 1.986466, 0.5607843, 0, 1, 1,
0.6970693, -1.074646, 2.933025, 0.5647059, 0, 1, 1,
0.6991515, 0.7781051, -0.5626844, 0.572549, 0, 1, 1,
0.7006136, 0.1656405, 1.884066, 0.5764706, 0, 1, 1,
0.7008598, 0.2427057, 0.1674144, 0.5843138, 0, 1, 1,
0.7013057, 0.1847748, 1.376182, 0.5882353, 0, 1, 1,
0.7051428, 2.365887, 1.861007, 0.5960785, 0, 1, 1,
0.7053171, -0.1326093, 1.374728, 0.6039216, 0, 1, 1,
0.7061968, -0.05507661, 2.277528, 0.6078432, 0, 1, 1,
0.7070214, -0.1915836, 3.167971, 0.6156863, 0, 1, 1,
0.7091776, 2.638798, -1.358796, 0.6196079, 0, 1, 1,
0.7094792, 0.9188721, 1.282717, 0.627451, 0, 1, 1,
0.7186363, 1.185641, 0.05726675, 0.6313726, 0, 1, 1,
0.7211501, 1.56848, -2.202355, 0.6392157, 0, 1, 1,
0.723361, -1.604338, 1.260513, 0.6431373, 0, 1, 1,
0.7267886, 0.7223359, 0.4613243, 0.6509804, 0, 1, 1,
0.7342651, 0.3794217, 0.5341958, 0.654902, 0, 1, 1,
0.7420824, 0.8298884, -0.2097228, 0.6627451, 0, 1, 1,
0.7449182, 1.405436, 1.260865, 0.6666667, 0, 1, 1,
0.7455735, 2.065724, 0.09145372, 0.6745098, 0, 1, 1,
0.7479445, 0.9261621, 0.1693757, 0.6784314, 0, 1, 1,
0.7503439, 0.5911668, 1.171621, 0.6862745, 0, 1, 1,
0.7523471, -2.563693, 2.137547, 0.6901961, 0, 1, 1,
0.7612681, 0.8195261, 0.4455702, 0.6980392, 0, 1, 1,
0.762969, -0.6079217, 2.113643, 0.7058824, 0, 1, 1,
0.767296, -0.9050148, 2.698597, 0.7098039, 0, 1, 1,
0.771436, -0.03206392, 1.941885, 0.7176471, 0, 1, 1,
0.7743502, -1.524655, 2.183285, 0.7215686, 0, 1, 1,
0.7757897, 0.3609914, 1.426847, 0.7294118, 0, 1, 1,
0.7769158, -1.523174, 3.344871, 0.7333333, 0, 1, 1,
0.7773573, -0.8523738, 1.96687, 0.7411765, 0, 1, 1,
0.7839194, -0.5984395, 2.179586, 0.7450981, 0, 1, 1,
0.7877914, 0.06493572, 1.539882, 0.7529412, 0, 1, 1,
0.7919602, 1.06941, 0.254927, 0.7568628, 0, 1, 1,
0.7936422, -2.771557, 2.854476, 0.7647059, 0, 1, 1,
0.7966561, -0.3921012, 1.09097, 0.7686275, 0, 1, 1,
0.7968028, -0.1049603, 1.842122, 0.7764706, 0, 1, 1,
0.7976753, 1.140507, 0.9884152, 0.7803922, 0, 1, 1,
0.7985023, -0.1166486, 0.6718338, 0.7882353, 0, 1, 1,
0.7992313, -0.4182571, 0.9553612, 0.7921569, 0, 1, 1,
0.8010467, 1.360105, 1.592284, 0.8, 0, 1, 1,
0.8194501, 2.043527, -0.3895427, 0.8078431, 0, 1, 1,
0.8205103, -0.5228941, 3.544021, 0.8117647, 0, 1, 1,
0.8242517, 0.02853835, 0.3414127, 0.8196079, 0, 1, 1,
0.8250018, 2.146541, 0.6527702, 0.8235294, 0, 1, 1,
0.8304513, 0.733279, 0.4284638, 0.8313726, 0, 1, 1,
0.8372438, 0.8715998, -0.2795884, 0.8352941, 0, 1, 1,
0.8451728, 1.334139, 1.43014, 0.8431373, 0, 1, 1,
0.8454025, 0.8583989, 2.100297, 0.8470588, 0, 1, 1,
0.8461187, 0.4910686, 2.040522, 0.854902, 0, 1, 1,
0.8468843, 1.440022, -0.2189522, 0.8588235, 0, 1, 1,
0.8502584, 0.2245242, 0.5982925, 0.8666667, 0, 1, 1,
0.8505091, 0.48875, -0.9585372, 0.8705882, 0, 1, 1,
0.8554127, 1.38372, 1.281379, 0.8784314, 0, 1, 1,
0.862904, -0.5187955, 1.728292, 0.8823529, 0, 1, 1,
0.8629555, -0.9564375, 1.126327, 0.8901961, 0, 1, 1,
0.8631499, 0.3338014, 0.3772023, 0.8941177, 0, 1, 1,
0.8690325, 1.170465, 1.517504, 0.9019608, 0, 1, 1,
0.8708553, -1.530327, 2.94642, 0.9098039, 0, 1, 1,
0.8731974, 0.340018, 2.854171, 0.9137255, 0, 1, 1,
0.8788025, -0.4589186, 3.797393, 0.9215686, 0, 1, 1,
0.8801683, 0.5973661, 1.369095, 0.9254902, 0, 1, 1,
0.881959, 0.3892123, 1.64791, 0.9333333, 0, 1, 1,
0.8820437, -0.7553129, 2.468338, 0.9372549, 0, 1, 1,
0.8900022, 0.06714614, 1.777983, 0.945098, 0, 1, 1,
0.8985578, 0.2204243, 3.155972, 0.9490196, 0, 1, 1,
0.8995643, -1.689739, 4.114478, 0.9568627, 0, 1, 1,
0.9029213, -0.1688716, 3.496052, 0.9607843, 0, 1, 1,
0.9066488, 0.1863808, 0.522085, 0.9686275, 0, 1, 1,
0.9130859, 0.4113357, 0.9024389, 0.972549, 0, 1, 1,
0.923114, 0.887632, 1.222252, 0.9803922, 0, 1, 1,
0.9231376, -1.305475, 2.918332, 0.9843137, 0, 1, 1,
0.9263829, 2.012773, -0.595682, 0.9921569, 0, 1, 1,
0.9310431, -0.6113524, 1.291949, 0.9960784, 0, 1, 1,
0.937907, -1.148391, 1.067567, 1, 0, 0.9960784, 1,
0.9393054, -0.6148805, -0.4896465, 1, 0, 0.9882353, 1,
0.9475825, 0.3611822, 1.576141, 1, 0, 0.9843137, 1,
0.9545128, 1.307875, 1.369125, 1, 0, 0.9764706, 1,
0.9556265, 1.029589, 1.988503, 1, 0, 0.972549, 1,
0.9575717, -0.628028, 0.3536146, 1, 0, 0.9647059, 1,
0.958518, 0.3420563, 0.001114076, 1, 0, 0.9607843, 1,
0.961155, 0.1369836, 2.353496, 1, 0, 0.9529412, 1,
0.9683394, -0.1980081, 0.8443195, 1, 0, 0.9490196, 1,
0.9696543, 0.6649952, 1.368866, 1, 0, 0.9411765, 1,
0.9708766, -1.684583, 4.152246, 1, 0, 0.9372549, 1,
0.9716557, 0.5389277, 3.142155, 1, 0, 0.9294118, 1,
0.9728246, -0.6978471, 2.915437, 1, 0, 0.9254902, 1,
0.9925911, -2.261318, 1.553675, 1, 0, 0.9176471, 1,
0.9932463, 0.8302791, -0.1876592, 1, 0, 0.9137255, 1,
0.9951147, -1.147055, 3.422771, 1, 0, 0.9058824, 1,
0.9953293, 0.3445449, -0.5955915, 1, 0, 0.9019608, 1,
1.00032, -1.443695, 3.659217, 1, 0, 0.8941177, 1,
1.007608, -0.6335122, 3.905101, 1, 0, 0.8862745, 1,
1.008304, -0.320861, 1.968337, 1, 0, 0.8823529, 1,
1.009775, -1.168569, 2.673395, 1, 0, 0.8745098, 1,
1.011206, 0.4680879, 1.37728, 1, 0, 0.8705882, 1,
1.012113, 0.6170439, -0.3141805, 1, 0, 0.8627451, 1,
1.012654, 0.0555537, 1.091615, 1, 0, 0.8588235, 1,
1.021469, 0.2766454, 2.533593, 1, 0, 0.8509804, 1,
1.02382, -1.206357, 2.628125, 1, 0, 0.8470588, 1,
1.030348, -0.3258832, 1.661673, 1, 0, 0.8392157, 1,
1.030722, 0.4888223, 1.232003, 1, 0, 0.8352941, 1,
1.03989, 1.73108, -0.1397979, 1, 0, 0.827451, 1,
1.04118, -1.99678, 2.593469, 1, 0, 0.8235294, 1,
1.043517, 0.21994, 1.581809, 1, 0, 0.8156863, 1,
1.047167, -0.5510744, 2.045712, 1, 0, 0.8117647, 1,
1.067352, 0.4632904, 1.485392, 1, 0, 0.8039216, 1,
1.067813, 1.892415, -0.4291111, 1, 0, 0.7960784, 1,
1.068005, -0.8786379, 2.398091, 1, 0, 0.7921569, 1,
1.097242, 1.700934, -0.883673, 1, 0, 0.7843137, 1,
1.100176, -0.5686755, 3.12617, 1, 0, 0.7803922, 1,
1.107143, -0.8619385, 0.5091496, 1, 0, 0.772549, 1,
1.110535, -1.667109, 3.008938, 1, 0, 0.7686275, 1,
1.114205, -0.7152517, 1.022964, 1, 0, 0.7607843, 1,
1.125214, 0.132011, -0.0885286, 1, 0, 0.7568628, 1,
1.140077, 0.4213591, 1.118712, 1, 0, 0.7490196, 1,
1.151081, 0.3980941, 0.2837656, 1, 0, 0.7450981, 1,
1.151516, 0.3510777, 0.815573, 1, 0, 0.7372549, 1,
1.152839, -0.5869904, 0.9772738, 1, 0, 0.7333333, 1,
1.160071, -0.1418405, 1.631203, 1, 0, 0.7254902, 1,
1.162469, -0.4541938, 1.920323, 1, 0, 0.7215686, 1,
1.164115, -1.198145, 0.7635662, 1, 0, 0.7137255, 1,
1.177732, -1.552215, 2.1966, 1, 0, 0.7098039, 1,
1.182867, -0.5751779, 2.765252, 1, 0, 0.7019608, 1,
1.183256, -1.31363, 0.1326781, 1, 0, 0.6941177, 1,
1.188716, -0.2227852, 1.02575, 1, 0, 0.6901961, 1,
1.190339, -0.7383833, 2.06776, 1, 0, 0.682353, 1,
1.197646, -0.6320049, 1.488909, 1, 0, 0.6784314, 1,
1.201216, 0.588263, 0.9246412, 1, 0, 0.6705883, 1,
1.21434, -1.690691, 1.920852, 1, 0, 0.6666667, 1,
1.22085, 0.7333613, 1.7875, 1, 0, 0.6588235, 1,
1.222739, -1.420338, 2.935525, 1, 0, 0.654902, 1,
1.227757, 1.090669, 1.045197, 1, 0, 0.6470588, 1,
1.231888, -0.1970158, 2.517366, 1, 0, 0.6431373, 1,
1.237229, 1.608248, -0.04330292, 1, 0, 0.6352941, 1,
1.241274, -0.5779124, 4.114446, 1, 0, 0.6313726, 1,
1.243425, 0.05426054, 1.406022, 1, 0, 0.6235294, 1,
1.245903, -1.419938, 1.79835, 1, 0, 0.6196079, 1,
1.255517, -0.9092317, 2.505488, 1, 0, 0.6117647, 1,
1.262673, 0.4126083, 1.194662, 1, 0, 0.6078432, 1,
1.272859, -1.975086, 3.276939, 1, 0, 0.6, 1,
1.275535, 0.843014, 1.307855, 1, 0, 0.5921569, 1,
1.277218, -0.1272292, 1.355387, 1, 0, 0.5882353, 1,
1.27989, 1.930162, 0.2877343, 1, 0, 0.5803922, 1,
1.282819, -0.756264, 0.5551773, 1, 0, 0.5764706, 1,
1.285442, -1.127347, 3.73781, 1, 0, 0.5686275, 1,
1.286852, 0.8340322, 1.185303, 1, 0, 0.5647059, 1,
1.288889, 0.2248013, 2.095832, 1, 0, 0.5568628, 1,
1.293118, -0.003484365, 1.992392, 1, 0, 0.5529412, 1,
1.303752, 0.701315, 1.684671, 1, 0, 0.5450981, 1,
1.348505, 0.5230847, 2.42531, 1, 0, 0.5411765, 1,
1.356643, 1.685279, 1.37659, 1, 0, 0.5333334, 1,
1.373795, 1.46751, 1.684606, 1, 0, 0.5294118, 1,
1.376535, 1.630059, 0.9152497, 1, 0, 0.5215687, 1,
1.376878, -0.2984475, 2.715333, 1, 0, 0.5176471, 1,
1.381112, -0.3429537, 1.240853, 1, 0, 0.509804, 1,
1.391752, 1.080232, 0.564844, 1, 0, 0.5058824, 1,
1.40354, -1.98201, 2.530983, 1, 0, 0.4980392, 1,
1.413636, 1.151607, -0.3224922, 1, 0, 0.4901961, 1,
1.420421, 0.7625884, -1.004346, 1, 0, 0.4862745, 1,
1.435976, -2.328335, 2.381907, 1, 0, 0.4784314, 1,
1.445679, 0.02063798, 2.578239, 1, 0, 0.4745098, 1,
1.458837, 0.5829725, 0.121546, 1, 0, 0.4666667, 1,
1.47165, 0.08901349, 0.9746066, 1, 0, 0.4627451, 1,
1.473021, 0.4819053, 2.087759, 1, 0, 0.454902, 1,
1.474173, -1.297568, 2.698747, 1, 0, 0.4509804, 1,
1.483061, 2.985345, -1.325499, 1, 0, 0.4431373, 1,
1.484759, -1.620554, 2.591982, 1, 0, 0.4392157, 1,
1.490544, 0.5962541, -0.1949395, 1, 0, 0.4313726, 1,
1.492192, 0.3599358, 0.2029375, 1, 0, 0.427451, 1,
1.496428, -0.4172274, 0.1768899, 1, 0, 0.4196078, 1,
1.499188, -1.211442, 1.047298, 1, 0, 0.4156863, 1,
1.519858, 1.066128, 1.417257, 1, 0, 0.4078431, 1,
1.527302, -1.712587, 1.397033, 1, 0, 0.4039216, 1,
1.536352, 0.09792613, 2.432419, 1, 0, 0.3960784, 1,
1.537138, 0.9369854, 1.667748, 1, 0, 0.3882353, 1,
1.547172, 0.5082662, 0.8773059, 1, 0, 0.3843137, 1,
1.570758, -1.041198, 2.605483, 1, 0, 0.3764706, 1,
1.574878, -0.2013648, 2.428906, 1, 0, 0.372549, 1,
1.583697, 0.3355064, 1.356589, 1, 0, 0.3647059, 1,
1.596029, -0.8748198, 4.030571, 1, 0, 0.3607843, 1,
1.602112, 0.4208758, 0.6219113, 1, 0, 0.3529412, 1,
1.610741, -1.048334, 2.261702, 1, 0, 0.3490196, 1,
1.612778, -0.5890578, 2.489305, 1, 0, 0.3411765, 1,
1.623581, -0.5287775, 2.478444, 1, 0, 0.3372549, 1,
1.635005, 0.130838, 1.057901, 1, 0, 0.3294118, 1,
1.641129, 0.4839398, 2.411414, 1, 0, 0.3254902, 1,
1.663037, 1.743355, -0.9596655, 1, 0, 0.3176471, 1,
1.671164, -0.1343104, 2.722801, 1, 0, 0.3137255, 1,
1.692167, 1.735513, -0.1673371, 1, 0, 0.3058824, 1,
1.694604, -0.03924011, 1.056449, 1, 0, 0.2980392, 1,
1.698386, 0.6577232, 0.9227566, 1, 0, 0.2941177, 1,
1.704717, -1.93878, 2.923015, 1, 0, 0.2862745, 1,
1.72976, 1.931124, 1.023978, 1, 0, 0.282353, 1,
1.735191, 1.107734, 0.9129335, 1, 0, 0.2745098, 1,
1.751378, -0.4240781, 2.58182, 1, 0, 0.2705882, 1,
1.754858, 0.3569861, 2.020856, 1, 0, 0.2627451, 1,
1.756534, 0.677295, 1.074236, 1, 0, 0.2588235, 1,
1.764963, 1.090096, 0.357577, 1, 0, 0.2509804, 1,
1.785932, -2.529027, 3.42857, 1, 0, 0.2470588, 1,
1.793655, 1.183214, -0.7725619, 1, 0, 0.2392157, 1,
1.800299, -1.038278, 0.1259503, 1, 0, 0.2352941, 1,
1.807046, 0.5508443, 1.644904, 1, 0, 0.227451, 1,
1.820091, -0.4431544, 1.209084, 1, 0, 0.2235294, 1,
1.821187, 0.9333431, 1.101092, 1, 0, 0.2156863, 1,
1.834039, -1.515613, 1.691597, 1, 0, 0.2117647, 1,
1.846325, 0.4049274, -0.4226528, 1, 0, 0.2039216, 1,
1.847587, -0.3422766, 1.819277, 1, 0, 0.1960784, 1,
1.852777, -1.23255, 2.521185, 1, 0, 0.1921569, 1,
1.857304, -0.5713832, 4.359808, 1, 0, 0.1843137, 1,
1.875512, -1.559007, 3.367929, 1, 0, 0.1803922, 1,
1.900074, 0.2270295, 1.260343, 1, 0, 0.172549, 1,
1.922437, -0.01648669, 1.947157, 1, 0, 0.1686275, 1,
1.945913, -1.189398, 2.218508, 1, 0, 0.1607843, 1,
1.957586, 0.7562702, 1.261192, 1, 0, 0.1568628, 1,
1.995365, 0.2244172, 0.5676034, 1, 0, 0.1490196, 1,
2.004497, 0.4809768, 1.563897, 1, 0, 0.145098, 1,
2.026124, -0.3716815, 0.5189393, 1, 0, 0.1372549, 1,
2.070845, 0.3108573, 1.568574, 1, 0, 0.1333333, 1,
2.074728, 0.2653561, 1.088866, 1, 0, 0.1254902, 1,
2.083064, 1.95026, 0.9203045, 1, 0, 0.1215686, 1,
2.083131, -1.234724, 1.645049, 1, 0, 0.1137255, 1,
2.098433, -0.9876118, 2.72777, 1, 0, 0.1098039, 1,
2.121743, -0.583086, 1.83382, 1, 0, 0.1019608, 1,
2.146208, -0.2954855, 2.44234, 1, 0, 0.09411765, 1,
2.176548, 2.620971, -0.2186348, 1, 0, 0.09019608, 1,
2.226821, -0.288604, 2.079657, 1, 0, 0.08235294, 1,
2.250368, 0.6641193, 2.222628, 1, 0, 0.07843138, 1,
2.306487, 0.2363991, 2.158445, 1, 0, 0.07058824, 1,
2.315237, -0.08222625, 0.2496169, 1, 0, 0.06666667, 1,
2.315467, 0.08456741, 3.644751, 1, 0, 0.05882353, 1,
2.4317, -1.026499, 2.753277, 1, 0, 0.05490196, 1,
2.604556, -1.25549, 1.78955, 1, 0, 0.04705882, 1,
2.623406, 1.08664, 1.59519, 1, 0, 0.04313726, 1,
2.662969, 0.8697134, 0.1013162, 1, 0, 0.03529412, 1,
2.678567, -0.6847304, 0.8277156, 1, 0, 0.03137255, 1,
2.84596, 0.8151148, 0.09386352, 1, 0, 0.02352941, 1,
2.921965, -0.4326529, -0.04724487, 1, 0, 0.01960784, 1,
2.9445, -0.6623486, 2.549254, 1, 0, 0.01176471, 1,
2.972432, 0.3232603, 1.996711, 1, 0, 0.007843138, 1
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
-0.05274081, -5.065929, -6.640995, 0, -0.5, 0.5, 0.5,
-0.05274081, -5.065929, -6.640995, 1, -0.5, 0.5, 0.5,
-0.05274081, -5.065929, -6.640995, 1, 1.5, 0.5, 0.5,
-0.05274081, -5.065929, -6.640995, 0, 1.5, 0.5, 0.5
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
-4.103447, 0.03285456, -6.640995, 0, -0.5, 0.5, 0.5,
-4.103447, 0.03285456, -6.640995, 1, -0.5, 0.5, 0.5,
-4.103447, 0.03285456, -6.640995, 1, 1.5, 0.5, 0.5,
-4.103447, 0.03285456, -6.640995, 0, 1.5, 0.5, 0.5
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
-4.103447, -5.065929, 0.3409998, 0, -0.5, 0.5, 0.5,
-4.103447, -5.065929, 0.3409998, 1, -0.5, 0.5, 0.5,
-4.103447, -5.065929, 0.3409998, 1, 1.5, 0.5, 0.5,
-4.103447, -5.065929, 0.3409998, 0, 1.5, 0.5, 0.5
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
-3, -3.889287, -5.029765,
2, -3.889287, -5.029765,
-3, -3.889287, -5.029765,
-3, -4.085394, -5.298303,
-2, -3.889287, -5.029765,
-2, -4.085394, -5.298303,
-1, -3.889287, -5.029765,
-1, -4.085394, -5.298303,
0, -3.889287, -5.029765,
0, -4.085394, -5.298303,
1, -3.889287, -5.029765,
1, -4.085394, -5.298303,
2, -3.889287, -5.029765,
2, -4.085394, -5.298303
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
-3, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
-3, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
-3, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
-3, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5,
-2, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
-2, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
-2, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
-2, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5,
-1, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
-1, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
-1, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
-1, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5,
0, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
0, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
0, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
0, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5,
1, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
1, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
1, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
1, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5,
2, -4.477608, -5.83538, 0, -0.5, 0.5, 0.5,
2, -4.477608, -5.83538, 1, -0.5, 0.5, 0.5,
2, -4.477608, -5.83538, 1, 1.5, 0.5, 0.5,
2, -4.477608, -5.83538, 0, 1.5, 0.5, 0.5
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
-3.168669, -2, -5.029765,
-3.168669, 2, -5.029765,
-3.168669, -2, -5.029765,
-3.324465, -2, -5.298303,
-3.168669, 0, -5.029765,
-3.324465, 0, -5.298303,
-3.168669, 2, -5.029765,
-3.324465, 2, -5.298303
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
-3.636058, -2, -5.83538, 0, -0.5, 0.5, 0.5,
-3.636058, -2, -5.83538, 1, -0.5, 0.5, 0.5,
-3.636058, -2, -5.83538, 1, 1.5, 0.5, 0.5,
-3.636058, -2, -5.83538, 0, 1.5, 0.5, 0.5,
-3.636058, 0, -5.83538, 0, -0.5, 0.5, 0.5,
-3.636058, 0, -5.83538, 1, -0.5, 0.5, 0.5,
-3.636058, 0, -5.83538, 1, 1.5, 0.5, 0.5,
-3.636058, 0, -5.83538, 0, 1.5, 0.5, 0.5,
-3.636058, 2, -5.83538, 0, -0.5, 0.5, 0.5,
-3.636058, 2, -5.83538, 1, -0.5, 0.5, 0.5,
-3.636058, 2, -5.83538, 1, 1.5, 0.5, 0.5,
-3.636058, 2, -5.83538, 0, 1.5, 0.5, 0.5
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
-3.168669, -3.889287, -4,
-3.168669, -3.889287, 4,
-3.168669, -3.889287, -4,
-3.324465, -4.085394, -4,
-3.168669, -3.889287, -2,
-3.324465, -4.085394, -2,
-3.168669, -3.889287, 0,
-3.324465, -4.085394, 0,
-3.168669, -3.889287, 2,
-3.324465, -4.085394, 2,
-3.168669, -3.889287, 4,
-3.324465, -4.085394, 4
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
-3.636058, -4.477608, -4, 0, -0.5, 0.5, 0.5,
-3.636058, -4.477608, -4, 1, -0.5, 0.5, 0.5,
-3.636058, -4.477608, -4, 1, 1.5, 0.5, 0.5,
-3.636058, -4.477608, -4, 0, 1.5, 0.5, 0.5,
-3.636058, -4.477608, -2, 0, -0.5, 0.5, 0.5,
-3.636058, -4.477608, -2, 1, -0.5, 0.5, 0.5,
-3.636058, -4.477608, -2, 1, 1.5, 0.5, 0.5,
-3.636058, -4.477608, -2, 0, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 0, 0, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 0, 1, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 0, 1, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 0, 0, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 2, 0, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 2, 1, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 2, 1, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 2, 0, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 4, 0, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 4, 1, -0.5, 0.5, 0.5,
-3.636058, -4.477608, 4, 1, 1.5, 0.5, 0.5,
-3.636058, -4.477608, 4, 0, 1.5, 0.5, 0.5
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
-3.168669, -3.889287, -5.029765,
-3.168669, 3.954996, -5.029765,
-3.168669, -3.889287, 5.711765,
-3.168669, 3.954996, 5.711765,
-3.168669, -3.889287, -5.029765,
-3.168669, -3.889287, 5.711765,
-3.168669, 3.954996, -5.029765,
-3.168669, 3.954996, 5.711765,
-3.168669, -3.889287, -5.029765,
3.063187, -3.889287, -5.029765,
-3.168669, -3.889287, 5.711765,
3.063187, -3.889287, 5.711765,
-3.168669, 3.954996, -5.029765,
3.063187, 3.954996, -5.029765,
-3.168669, 3.954996, 5.711765,
3.063187, 3.954996, 5.711765,
3.063187, -3.889287, -5.029765,
3.063187, 3.954996, -5.029765,
3.063187, -3.889287, 5.711765,
3.063187, 3.954996, 5.711765,
3.063187, -3.889287, -5.029765,
3.063187, -3.889287, 5.711765,
3.063187, 3.954996, -5.029765,
3.063187, 3.954996, 5.711765
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
var radius = 7.843323;
var distance = 34.89583;
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
mvMatrix.translate( 0.05274081, -0.03285456, -0.3409998 );
mvMatrix.scale( 1.360807, 1.081087, 0.7894923 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89583);
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
cloquintocet-mexyl<-read.table("cloquintocet-mexyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cloquintocet-mexyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'cloquintocet' not found
```

```r
y<-cloquintocet-mexyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'cloquintocet' not found
```

```r
z<-cloquintocet-mexyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'cloquintocet' not found
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
-3.077914, 1.092111, -0.9096756, 0, 0, 1, 1, 1,
-2.951434, 0.3688977, -0.1737267, 1, 0, 0, 1, 1,
-2.679796, -1.564618, -2.201273, 1, 0, 0, 1, 1,
-2.566138, -0.0660013, 0.2791488, 1, 0, 0, 1, 1,
-2.550277, 1.499523, -2.058712, 1, 0, 0, 1, 1,
-2.527186, -1.203952, -1.969774, 1, 0, 0, 1, 1,
-2.510132, 1.949788, -1.487221, 0, 0, 0, 1, 1,
-2.413376, 0.2522647, -0.03963515, 0, 0, 0, 1, 1,
-2.358158, 0.7279909, -3.055504, 0, 0, 0, 1, 1,
-2.322693, 2.362096, -0.8154873, 0, 0, 0, 1, 1,
-2.223978, -1.564746, -0.5133874, 0, 0, 0, 1, 1,
-2.222001, 0.7563143, -1.898642, 0, 0, 0, 1, 1,
-2.214552, 0.07455291, -1.179153, 0, 0, 0, 1, 1,
-2.183152, 0.4893686, -2.484924, 1, 1, 1, 1, 1,
-2.160667, 1.229362, -1.021559, 1, 1, 1, 1, 1,
-2.154742, 0.110324, -1.72759, 1, 1, 1, 1, 1,
-2.085503, -0.6707187, -1.584007, 1, 1, 1, 1, 1,
-2.070166, 0.1718734, -2.477862, 1, 1, 1, 1, 1,
-2.054637, 0.8242629, -1.806178, 1, 1, 1, 1, 1,
-2.031796, -0.7692107, -2.352116, 1, 1, 1, 1, 1,
-2.018546, -1.50211, -3.555736, 1, 1, 1, 1, 1,
-1.998109, 0.3018899, -0.7822797, 1, 1, 1, 1, 1,
-1.991945, -1.826215, -3.683289, 1, 1, 1, 1, 1,
-1.919365, 0.2661642, -1.427687, 1, 1, 1, 1, 1,
-1.918178, -1.025351, -1.775558, 1, 1, 1, 1, 1,
-1.908952, 1.078247, -0.2797211, 1, 1, 1, 1, 1,
-1.899378, -0.883358, 0.2835289, 1, 1, 1, 1, 1,
-1.896398, -0.6807231, -1.279828, 1, 1, 1, 1, 1,
-1.894493, 0.7665854, -2.176954, 0, 0, 1, 1, 1,
-1.877216, 0.4107833, -1.291054, 1, 0, 0, 1, 1,
-1.868281, 0.6070613, -1.590066, 1, 0, 0, 1, 1,
-1.854914, 1.427536, -0.4389034, 1, 0, 0, 1, 1,
-1.830162, -1.335635, -1.65428, 1, 0, 0, 1, 1,
-1.808948, -1.008662, -3.064077, 1, 0, 0, 1, 1,
-1.807602, -1.096188, -2.609379, 0, 0, 0, 1, 1,
-1.801366, -0.763905, -3.523088, 0, 0, 0, 1, 1,
-1.780001, -1.710033, -2.103976, 0, 0, 0, 1, 1,
-1.764732, -0.5733294, -2.661819, 0, 0, 0, 1, 1,
-1.745104, 1.173595, -2.295291, 0, 0, 0, 1, 1,
-1.720415, -1.061875, -0.8646127, 0, 0, 0, 1, 1,
-1.716592, 0.5694243, -0.8815478, 0, 0, 0, 1, 1,
-1.716225, -0.6487297, 0.1792025, 1, 1, 1, 1, 1,
-1.713063, -0.4213695, -0.1151766, 1, 1, 1, 1, 1,
-1.700153, 0.6052567, -0.9277209, 1, 1, 1, 1, 1,
-1.681039, -0.7821915, -0.7532344, 1, 1, 1, 1, 1,
-1.677781, 1.530629, -2.31872, 1, 1, 1, 1, 1,
-1.676588, 1.739313, 0.368819, 1, 1, 1, 1, 1,
-1.670066, -0.5284455, -1.301447, 1, 1, 1, 1, 1,
-1.635086, 1.097708, 0.9545509, 1, 1, 1, 1, 1,
-1.62121, -0.5088297, -3.857981, 1, 1, 1, 1, 1,
-1.617333, -0.2452464, -0.7099597, 1, 1, 1, 1, 1,
-1.61479, -0.03865869, -0.498146, 1, 1, 1, 1, 1,
-1.590457, 0.3768337, -0.9800891, 1, 1, 1, 1, 1,
-1.581724, -0.3000279, -0.09190971, 1, 1, 1, 1, 1,
-1.567844, -1.258294, -1.758127, 1, 1, 1, 1, 1,
-1.567818, 0.6088406, -1.972203, 1, 1, 1, 1, 1,
-1.566752, 0.3626299, -1.255133, 0, 0, 1, 1, 1,
-1.548594, -1.614219, -3.184906, 1, 0, 0, 1, 1,
-1.546544, 1.056223, -0.1759378, 1, 0, 0, 1, 1,
-1.531791, -1.696166, -2.649097, 1, 0, 0, 1, 1,
-1.525972, -0.1970047, -1.411327, 1, 0, 0, 1, 1,
-1.524973, -0.1567324, -0.7871767, 1, 0, 0, 1, 1,
-1.518847, -0.1191168, -0.9967953, 0, 0, 0, 1, 1,
-1.508332, -0.24663, -0.7704494, 0, 0, 0, 1, 1,
-1.498088, 0.1449466, -0.8021343, 0, 0, 0, 1, 1,
-1.495505, 0.778979, -1.082041, 0, 0, 0, 1, 1,
-1.490732, 0.5861952, -1.684446, 0, 0, 0, 1, 1,
-1.484975, -0.7396674, -2.081182, 0, 0, 0, 1, 1,
-1.479487, -0.1620096, -2.090202, 0, 0, 0, 1, 1,
-1.474971, 0.964229, -2.672898, 1, 1, 1, 1, 1,
-1.469278, 0.03189631, -2.314414, 1, 1, 1, 1, 1,
-1.46826, -0.1310945, -2.665958, 1, 1, 1, 1, 1,
-1.458164, -2.002723, -4.376079, 1, 1, 1, 1, 1,
-1.457132, 1.626601, -1.549336, 1, 1, 1, 1, 1,
-1.45624, -0.08408272, -3.393115, 1, 1, 1, 1, 1,
-1.454202, -0.3223806, -1.315656, 1, 1, 1, 1, 1,
-1.433677, -0.8755692, -2.483723, 1, 1, 1, 1, 1,
-1.423422, -0.3172102, 0.1214674, 1, 1, 1, 1, 1,
-1.416526, -0.3222727, -1.531603, 1, 1, 1, 1, 1,
-1.41095, 0.8447424, -0.9266977, 1, 1, 1, 1, 1,
-1.388232, -0.9990436, -1.924558, 1, 1, 1, 1, 1,
-1.374368, -0.9937732, -1.671217, 1, 1, 1, 1, 1,
-1.374032, 0.5098957, -1.762821, 1, 1, 1, 1, 1,
-1.371604, -0.2653002, -2.681773, 1, 1, 1, 1, 1,
-1.370196, -0.1622829, 0.004662961, 0, 0, 1, 1, 1,
-1.365137, -0.3317854, 1.303935, 1, 0, 0, 1, 1,
-1.342355, -0.4860875, 0.1556207, 1, 0, 0, 1, 1,
-1.339813, 0.8774263, -1.856002, 1, 0, 0, 1, 1,
-1.331071, -0.5467941, -2.783117, 1, 0, 0, 1, 1,
-1.331006, -0.690971, -1.872725, 1, 0, 0, 1, 1,
-1.330174, 0.6766703, 0.4298997, 0, 0, 0, 1, 1,
-1.327468, 0.640261, -1.776754, 0, 0, 0, 1, 1,
-1.326091, 2.312613, 0.1715194, 0, 0, 0, 1, 1,
-1.325443, 0.03809867, 0.06069104, 0, 0, 0, 1, 1,
-1.322188, -0.8885047, -3.454427, 0, 0, 0, 1, 1,
-1.311785, 0.1176658, -2.558572, 0, 0, 0, 1, 1,
-1.302147, -0.06175011, -1.345127, 0, 0, 0, 1, 1,
-1.291773, 1.534868, 0.258014, 1, 1, 1, 1, 1,
-1.290946, -1.331834, -1.94753, 1, 1, 1, 1, 1,
-1.284837, -0.1091012, -1.055935, 1, 1, 1, 1, 1,
-1.282259, -2.107273, -3.173198, 1, 1, 1, 1, 1,
-1.282067, -0.8093594, -1.045135, 1, 1, 1, 1, 1,
-1.274637, -0.9632127, -3.099993, 1, 1, 1, 1, 1,
-1.273747, 0.151867, -1.41218, 1, 1, 1, 1, 1,
-1.265868, 0.6348639, -1.870238, 1, 1, 1, 1, 1,
-1.265814, -0.6735204, -2.855952, 1, 1, 1, 1, 1,
-1.254838, 2.746663, -0.5744005, 1, 1, 1, 1, 1,
-1.219636, 0.05261038, -1.728896, 1, 1, 1, 1, 1,
-1.216396, 0.5876772, -2.154393, 1, 1, 1, 1, 1,
-1.216033, 0.3443738, -1.623826, 1, 1, 1, 1, 1,
-1.198475, -1.240576, -3.465865, 1, 1, 1, 1, 1,
-1.196194, 0.7109277, 0.6807879, 1, 1, 1, 1, 1,
-1.179798, 0.9001352, -0.4355374, 0, 0, 1, 1, 1,
-1.169947, 0.06218893, -1.559461, 1, 0, 0, 1, 1,
-1.165924, 0.3753864, -1.868948, 1, 0, 0, 1, 1,
-1.162931, 0.9715104, 0.2456997, 1, 0, 0, 1, 1,
-1.162087, -1.940626, -2.856917, 1, 0, 0, 1, 1,
-1.156003, -0.4157338, -2.004824, 1, 0, 0, 1, 1,
-1.152291, -0.4254723, -1.736009, 0, 0, 0, 1, 1,
-1.14064, 0.1998891, -3.682245, 0, 0, 0, 1, 1,
-1.137599, -2.071818, -0.7880458, 0, 0, 0, 1, 1,
-1.135718, -0.7645053, -2.15289, 0, 0, 0, 1, 1,
-1.133415, 1.89361, -1.421893, 0, 0, 0, 1, 1,
-1.132086, -0.303024, -2.474397, 0, 0, 0, 1, 1,
-1.119184, -1.662013, -1.501459, 0, 0, 0, 1, 1,
-1.116627, 0.890684, -0.4347671, 1, 1, 1, 1, 1,
-1.111152, 1.285216, -0.2276976, 1, 1, 1, 1, 1,
-1.099901, -0.5026306, -3.037313, 1, 1, 1, 1, 1,
-1.090448, 1.010896, -2.320084, 1, 1, 1, 1, 1,
-1.089838, -0.3911315, -3.253946, 1, 1, 1, 1, 1,
-1.078668, 0.8740801, -0.2034849, 1, 1, 1, 1, 1,
-1.077834, 1.602926, -0.3742147, 1, 1, 1, 1, 1,
-1.064835, -0.5618012, -3.336529, 1, 1, 1, 1, 1,
-1.05511, 0.7456736, -1.770303, 1, 1, 1, 1, 1,
-1.052087, -1.074811, -1.6317, 1, 1, 1, 1, 1,
-1.048252, 1.783473, -1.39134, 1, 1, 1, 1, 1,
-1.044856, 1.588237, 0.2590458, 1, 1, 1, 1, 1,
-1.044243, -0.3019921, -0.9219108, 1, 1, 1, 1, 1,
-1.017389, 1.329452, -0.4961092, 1, 1, 1, 1, 1,
-1.016282, 1.193853, -0.395533, 1, 1, 1, 1, 1,
-1.012285, 0.6315531, -2.532651, 0, 0, 1, 1, 1,
-1.011947, -0.6005511, -2.22644, 1, 0, 0, 1, 1,
-1.006884, 2.24065, -2.001534, 1, 0, 0, 1, 1,
-1.002314, 0.3624751, 0.320541, 1, 0, 0, 1, 1,
-0.999272, 2.306063, 0.3987786, 1, 0, 0, 1, 1,
-0.993497, 0.02821075, -2.281666, 1, 0, 0, 1, 1,
-0.9806506, -1.736256, -1.172206, 0, 0, 0, 1, 1,
-0.9768801, 0.6906946, 0.1579853, 0, 0, 0, 1, 1,
-0.9750089, -0.8143874, -3.27828, 0, 0, 0, 1, 1,
-0.9737793, 2.173417, -0.6184967, 0, 0, 0, 1, 1,
-0.9731697, 1.628779, -2.137319, 0, 0, 0, 1, 1,
-0.9644814, 0.3500341, -1.938661, 0, 0, 0, 1, 1,
-0.961489, -0.2938899, -2.244842, 0, 0, 0, 1, 1,
-0.9610842, 0.8505147, -1.875265, 1, 1, 1, 1, 1,
-0.9587934, -2.833016, -2.196687, 1, 1, 1, 1, 1,
-0.9583949, 0.3926948, 0.2809804, 1, 1, 1, 1, 1,
-0.9475173, -0.8745759, -2.646089, 1, 1, 1, 1, 1,
-0.9392213, 0.02306176, -1.293483, 1, 1, 1, 1, 1,
-0.9338008, -1.709326, -2.92001, 1, 1, 1, 1, 1,
-0.9313269, -0.3990125, -3.03379, 1, 1, 1, 1, 1,
-0.9243439, -0.8358783, -3.177448, 1, 1, 1, 1, 1,
-0.9160687, 1.601516, -1.55717, 1, 1, 1, 1, 1,
-0.915715, -0.8253077, -2.48962, 1, 1, 1, 1, 1,
-0.9130875, 0.0292276, -1.798947, 1, 1, 1, 1, 1,
-0.9027534, 0.1836186, -0.31437, 1, 1, 1, 1, 1,
-0.9004512, -0.9823635, -4.485758, 1, 1, 1, 1, 1,
-0.8836786, 1.069827, -1.776464, 1, 1, 1, 1, 1,
-0.8769855, -0.1029867, -1.123244, 1, 1, 1, 1, 1,
-0.8759348, -0.8953919, -2.318597, 0, 0, 1, 1, 1,
-0.8747395, 1.287977, 0.6658043, 1, 0, 0, 1, 1,
-0.8728062, 1.128256, -1.322813, 1, 0, 0, 1, 1,
-0.8726726, -1.378911, -3.082145, 1, 0, 0, 1, 1,
-0.872523, -1.457974, -1.898393, 1, 0, 0, 1, 1,
-0.8701146, 0.02069822, -1.56071, 1, 0, 0, 1, 1,
-0.866591, 2.179582, 0.3319118, 0, 0, 0, 1, 1,
-0.8616719, -0.1921417, -3.598171, 0, 0, 0, 1, 1,
-0.8614833, 0.9620522, 0.5316179, 0, 0, 0, 1, 1,
-0.8583959, -0.2945941, -3.206836, 0, 0, 0, 1, 1,
-0.8555109, 0.7490633, -1.778303, 0, 0, 0, 1, 1,
-0.8536312, 0.8647279, -0.4142703, 0, 0, 0, 1, 1,
-0.8531272, 1.522254, -3.131453, 0, 0, 0, 1, 1,
-0.8526986, -0.1122293, -2.711941, 1, 1, 1, 1, 1,
-0.8526406, -0.008954814, 1.731091, 1, 1, 1, 1, 1,
-0.8520611, 0.4415903, -1.947598, 1, 1, 1, 1, 1,
-0.8490655, -1.094366, -2.284671, 1, 1, 1, 1, 1,
-0.8473129, 0.2824093, -0.7635549, 1, 1, 1, 1, 1,
-0.8470238, -0.6946952, -1.768969, 1, 1, 1, 1, 1,
-0.8463413, -1.244346, -2.539227, 1, 1, 1, 1, 1,
-0.8373618, 1.730434, -1.23509, 1, 1, 1, 1, 1,
-0.8351239, -0.2188836, -1.844079, 1, 1, 1, 1, 1,
-0.8313341, -0.7959707, -2.019602, 1, 1, 1, 1, 1,
-0.828778, -1.57044, -3.030147, 1, 1, 1, 1, 1,
-0.8234152, 0.151171, -2.598487, 1, 1, 1, 1, 1,
-0.8226462, 0.1070925, -3.064183, 1, 1, 1, 1, 1,
-0.820759, 0.5302841, -0.974444, 1, 1, 1, 1, 1,
-0.8188001, -1.12517, -3.724986, 1, 1, 1, 1, 1,
-0.8155394, 1.572379, -1.055984, 0, 0, 1, 1, 1,
-0.807333, 0.2457937, -0.8721879, 1, 0, 0, 1, 1,
-0.8062528, -1.950234, -3.091585, 1, 0, 0, 1, 1,
-0.8053728, -1.117289, -2.677334, 1, 0, 0, 1, 1,
-0.8021978, -2.659918, -2.839701, 1, 0, 0, 1, 1,
-0.7987174, -0.149556, 0.2390235, 1, 0, 0, 1, 1,
-0.7986088, 0.9644557, -2.563259, 0, 0, 0, 1, 1,
-0.7973572, 1.468062, 0.8819879, 0, 0, 0, 1, 1,
-0.7960267, -0.1457713, -1.177046, 0, 0, 0, 1, 1,
-0.795711, -0.1813598, -1.776077, 0, 0, 0, 1, 1,
-0.7931708, -0.7872158, -2.429118, 0, 0, 0, 1, 1,
-0.7902794, -0.4732255, -2.454155, 0, 0, 0, 1, 1,
-0.7870554, 0.5506471, -1.270144, 0, 0, 0, 1, 1,
-0.7849174, 1.308453, -2.275244, 1, 1, 1, 1, 1,
-0.781404, 0.6351199, -0.6523132, 1, 1, 1, 1, 1,
-0.7743579, -0.07535265, -1.815569, 1, 1, 1, 1, 1,
-0.7740665, 1.09775, -1.69639, 1, 1, 1, 1, 1,
-0.7738588, 1.337086, -0.2423855, 1, 1, 1, 1, 1,
-0.7732652, 0.528625, -0.2512747, 1, 1, 1, 1, 1,
-0.7686123, 0.7196339, -1.073995, 1, 1, 1, 1, 1,
-0.7674945, 0.5945567, -0.3578799, 1, 1, 1, 1, 1,
-0.7634232, -0.2838043, -2.265073, 1, 1, 1, 1, 1,
-0.7616832, -0.478377, -1.8236, 1, 1, 1, 1, 1,
-0.7604212, 0.4963716, -0.5006112, 1, 1, 1, 1, 1,
-0.7538528, 1.766115, -0.02016666, 1, 1, 1, 1, 1,
-0.7532859, 3.004545, -1.972406, 1, 1, 1, 1, 1,
-0.748733, 0.0414271, -2.393447, 1, 1, 1, 1, 1,
-0.7420136, -1.679989, -1.006489, 1, 1, 1, 1, 1,
-0.7393846, -0.8607419, -1.610608, 0, 0, 1, 1, 1,
-0.736973, -1.569015, -2.381346, 1, 0, 0, 1, 1,
-0.7345307, 0.08371563, -0.5403885, 1, 0, 0, 1, 1,
-0.7324153, -0.6230432, -1.628714, 1, 0, 0, 1, 1,
-0.7243396, -0.2173471, -1.070497, 1, 0, 0, 1, 1,
-0.7237034, 1.412072, -0.6693549, 1, 0, 0, 1, 1,
-0.7143676, 0.1986109, -1.506596, 0, 0, 0, 1, 1,
-0.713351, 1.315786, -0.5596415, 0, 0, 0, 1, 1,
-0.7104193, 0.6988559, -2.20752, 0, 0, 0, 1, 1,
-0.7086981, 1.575485, 0.5727749, 0, 0, 0, 1, 1,
-0.7051192, -1.204919, -2.035336, 0, 0, 0, 1, 1,
-0.700611, -1.656273, -1.717673, 0, 0, 0, 1, 1,
-0.6993371, -1.048178, -3.896739, 0, 0, 0, 1, 1,
-0.6987919, -0.8210585, -2.122101, 1, 1, 1, 1, 1,
-0.696458, 1.057145, -0.6421932, 1, 1, 1, 1, 1,
-0.6873814, 0.1740788, -0.1111907, 1, 1, 1, 1, 1,
-0.6856057, -0.3986914, -2.33006, 1, 1, 1, 1, 1,
-0.6797442, 0.7644669, -0.05388652, 1, 1, 1, 1, 1,
-0.6748926, -0.6677287, -2.037328, 1, 1, 1, 1, 1,
-0.6737967, 0.2136521, -1.838546, 1, 1, 1, 1, 1,
-0.6730229, 0.7272989, -1.526495, 1, 1, 1, 1, 1,
-0.6684562, -0.9836379, -2.17993, 1, 1, 1, 1, 1,
-0.6676866, 0.1380798, -0.8397717, 1, 1, 1, 1, 1,
-0.6668357, 0.2387382, -1.599076, 1, 1, 1, 1, 1,
-0.6663942, 0.3883417, -2.237619, 1, 1, 1, 1, 1,
-0.6627509, 0.08801152, -3.238017, 1, 1, 1, 1, 1,
-0.6604929, -0.622823, 0.0600653, 1, 1, 1, 1, 1,
-0.6584464, -1.414689, -2.063082, 1, 1, 1, 1, 1,
-0.6573856, 1.606117, -1.01596, 0, 0, 1, 1, 1,
-0.6573173, 0.3950635, -2.305346, 1, 0, 0, 1, 1,
-0.6561298, -0.2783617, -0.9647472, 1, 0, 0, 1, 1,
-0.6542029, -1.113237, -1.850204, 1, 0, 0, 1, 1,
-0.6475034, 1.172972, -2.136579, 1, 0, 0, 1, 1,
-0.6454865, 0.5363399, -1.103177, 1, 0, 0, 1, 1,
-0.6421541, 1.494638, -1.720353, 0, 0, 0, 1, 1,
-0.6413241, -0.5437238, -2.025373, 0, 0, 0, 1, 1,
-0.6387419, 2.110058, -0.4679095, 0, 0, 0, 1, 1,
-0.6375874, -0.3501705, -2.054978, 0, 0, 0, 1, 1,
-0.6298893, 1.412212, -0.5702451, 0, 0, 0, 1, 1,
-0.6298649, -0.9829906, -2.386595, 0, 0, 0, 1, 1,
-0.6293889, -1.041833, -2.987622, 0, 0, 0, 1, 1,
-0.6257476, -1.288713, -2.930208, 1, 1, 1, 1, 1,
-0.6243955, 0.2148225, -2.347748, 1, 1, 1, 1, 1,
-0.6243297, -0.5388584, -1.758109, 1, 1, 1, 1, 1,
-0.6182974, 1.109255, -1.029768, 1, 1, 1, 1, 1,
-0.6144828, 1.630765, -0.08059386, 1, 1, 1, 1, 1,
-0.609269, 1.131023, 0.2267358, 1, 1, 1, 1, 1,
-0.6087762, 0.1014782, -0.009528392, 1, 1, 1, 1, 1,
-0.6040307, -1.343322, -2.163644, 1, 1, 1, 1, 1,
-0.603092, -0.8418935, -3.420862, 1, 1, 1, 1, 1,
-0.6005406, -0.1122058, -1.199388, 1, 1, 1, 1, 1,
-0.6003672, -0.5556519, -1.200033, 1, 1, 1, 1, 1,
-0.5977388, -0.03360584, -1.214642, 1, 1, 1, 1, 1,
-0.5955405, 0.8877842, 0.7386956, 1, 1, 1, 1, 1,
-0.5946476, 0.6834441, 0.2526815, 1, 1, 1, 1, 1,
-0.587835, -0.3644293, -3.286088, 1, 1, 1, 1, 1,
-0.5862261, 0.9492529, -0.03390706, 0, 0, 1, 1, 1,
-0.5799174, -0.904704, -3.676098, 1, 0, 0, 1, 1,
-0.5792605, -2.514721, -2.55103, 1, 0, 0, 1, 1,
-0.5786071, 0.02676455, -2.299988, 1, 0, 0, 1, 1,
-0.5778948, -0.9251916, -2.421907, 1, 0, 0, 1, 1,
-0.574335, 1.346233, -0.9646987, 1, 0, 0, 1, 1,
-0.569181, 1.522335, 0.5601407, 0, 0, 0, 1, 1,
-0.5687177, 1.33643, -0.2979412, 0, 0, 0, 1, 1,
-0.5606689, 0.4423516, -1.986672, 0, 0, 0, 1, 1,
-0.5605343, -0.3400993, -2.814271, 0, 0, 0, 1, 1,
-0.5529464, 0.2256814, -0.5589842, 0, 0, 0, 1, 1,
-0.5525479, -1.672382, -3.359522, 0, 0, 0, 1, 1,
-0.5504662, 1.987547, -0.4803403, 0, 0, 0, 1, 1,
-0.549097, 0.7080664, 0.2626657, 1, 1, 1, 1, 1,
-0.5483578, 0.1982656, -0.775245, 1, 1, 1, 1, 1,
-0.5465285, 0.4691482, -0.7421061, 1, 1, 1, 1, 1,
-0.5452804, -1.330493, -3.413265, 1, 1, 1, 1, 1,
-0.542081, 0.2843766, -0.9268858, 1, 1, 1, 1, 1,
-0.5418655, 1.550888, 0.1465809, 1, 1, 1, 1, 1,
-0.5374817, -0.6362479, -2.33198, 1, 1, 1, 1, 1,
-0.5359185, -1.450251, -2.689647, 1, 1, 1, 1, 1,
-0.5340977, -0.4828691, -4.410789, 1, 1, 1, 1, 1,
-0.5323297, -0.7063941, -3.062866, 1, 1, 1, 1, 1,
-0.5306575, 1.111244, -0.9659317, 1, 1, 1, 1, 1,
-0.5281755, 0.6756014, -0.5002432, 1, 1, 1, 1, 1,
-0.5278218, 0.5712581, -1.561874, 1, 1, 1, 1, 1,
-0.5213002, 0.3571555, -1.549756, 1, 1, 1, 1, 1,
-0.517918, 0.03120113, -0.9858731, 1, 1, 1, 1, 1,
-0.5128821, -0.1373281, -2.220386, 0, 0, 1, 1, 1,
-0.5123344, -0.6948994, -2.843954, 1, 0, 0, 1, 1,
-0.5082757, 0.4992078, -0.3343931, 1, 0, 0, 1, 1,
-0.5037296, 0.07550465, -2.596465, 1, 0, 0, 1, 1,
-0.4998411, -0.8175725, -2.20392, 1, 0, 0, 1, 1,
-0.4967671, -0.3163483, -2.852124, 1, 0, 0, 1, 1,
-0.4955807, 0.3663022, -1.07276, 0, 0, 0, 1, 1,
-0.4953113, 0.3093432, -1.037827, 0, 0, 0, 1, 1,
-0.4877853, 0.2191794, -1.137532, 0, 0, 0, 1, 1,
-0.4846415, -2.324992, -3.319962, 0, 0, 0, 1, 1,
-0.4825715, 0.1167955, -0.5057091, 0, 0, 0, 1, 1,
-0.4784611, -0.7564579, -2.838024, 0, 0, 0, 1, 1,
-0.4754643, 1.170384, 1.510172, 0, 0, 0, 1, 1,
-0.4671463, -1.42324, -3.340791, 1, 1, 1, 1, 1,
-0.4655406, 1.74381, -1.328947, 1, 1, 1, 1, 1,
-0.4609233, -1.737318, -3.444984, 1, 1, 1, 1, 1,
-0.4568576, 0.1114256, -0.6712394, 1, 1, 1, 1, 1,
-0.4562874, 1.615324, -0.8505743, 1, 1, 1, 1, 1,
-0.4561368, 0.9531472, -0.6299253, 1, 1, 1, 1, 1,
-0.4546093, 0.8846304, -1.666598, 1, 1, 1, 1, 1,
-0.4521628, -0.123023, -0.6014894, 1, 1, 1, 1, 1,
-0.4446225, 1.629139, -1.368403, 1, 1, 1, 1, 1,
-0.4427054, -0.1834067, -1.204051, 1, 1, 1, 1, 1,
-0.4417582, 0.1068574, -0.4467925, 1, 1, 1, 1, 1,
-0.4401639, 0.6114909, 0.5189055, 1, 1, 1, 1, 1,
-0.4385779, -1.653898, -2.45446, 1, 1, 1, 1, 1,
-0.4368738, 0.970324, 0.1186773, 1, 1, 1, 1, 1,
-0.4361604, 3.840759, 0.6231051, 1, 1, 1, 1, 1,
-0.4358466, -1.124186, -4.541661, 0, 0, 1, 1, 1,
-0.4331817, 0.623334, -2.316856, 1, 0, 0, 1, 1,
-0.4306637, 0.2799241, -0.7890038, 1, 0, 0, 1, 1,
-0.4287554, -0.9129287, -4.370163, 1, 0, 0, 1, 1,
-0.4252473, -0.2340555, -2.418108, 1, 0, 0, 1, 1,
-0.4233078, -0.6977981, -4.082401, 1, 0, 0, 1, 1,
-0.4189415, -0.9542054, -2.443479, 0, 0, 0, 1, 1,
-0.4179833, 1.034607, 0.06484061, 0, 0, 0, 1, 1,
-0.4158736, 0.9449825, 0.5236055, 0, 0, 0, 1, 1,
-0.4146659, -0.1794864, -0.1181582, 0, 0, 0, 1, 1,
-0.4112498, 0.4105983, 0.1094305, 0, 0, 0, 1, 1,
-0.4109243, 0.1905648, -0.06698038, 0, 0, 0, 1, 1,
-0.4098748, -1.289875, -3.390621, 0, 0, 0, 1, 1,
-0.4082318, 0.1859263, -0.740769, 1, 1, 1, 1, 1,
-0.4078496, -0.2527811, -3.429565, 1, 1, 1, 1, 1,
-0.4056028, -0.2891232, -1.435059, 1, 1, 1, 1, 1,
-0.4052467, -0.2322048, -2.008052, 1, 1, 1, 1, 1,
-0.396554, -0.2231437, -3.079673, 1, 1, 1, 1, 1,
-0.3953427, 2.598988, -0.3231073, 1, 1, 1, 1, 1,
-0.392632, 2.219769, 0.859085, 1, 1, 1, 1, 1,
-0.3864799, -0.3855851, -4.327556, 1, 1, 1, 1, 1,
-0.3848415, -0.5475912, -3.226165, 1, 1, 1, 1, 1,
-0.3846093, 0.7774637, 2.04017, 1, 1, 1, 1, 1,
-0.3826763, -0.6766043, -0.9329821, 1, 1, 1, 1, 1,
-0.3801454, -0.4156463, -3.66326, 1, 1, 1, 1, 1,
-0.3777606, 1.285728, -0.5595446, 1, 1, 1, 1, 1,
-0.3742937, -0.07938953, -1.932587, 1, 1, 1, 1, 1,
-0.3740503, -0.4245631, -3.968621, 1, 1, 1, 1, 1,
-0.3739538, 0.3589257, -1.060974, 0, 0, 1, 1, 1,
-0.3732834, 0.8269907, -0.5042474, 1, 0, 0, 1, 1,
-0.3722911, -2.109396, -3.868572, 1, 0, 0, 1, 1,
-0.3718346, -1.262424, -3.012077, 1, 0, 0, 1, 1,
-0.3709656, 1.136394, -0.6934167, 1, 0, 0, 1, 1,
-0.3701287, -0.7397332, -2.728963, 1, 0, 0, 1, 1,
-0.3676125, 0.4782152, 0.8859213, 0, 0, 0, 1, 1,
-0.3657835, 0.1209995, -1.294743, 0, 0, 0, 1, 1,
-0.3624809, 0.7761832, 1.17001, 0, 0, 0, 1, 1,
-0.3589184, 0.09667202, -2.219924, 0, 0, 0, 1, 1,
-0.3585069, 0.3881923, -2.614321, 0, 0, 0, 1, 1,
-0.3579123, -0.2121481, -1.651673, 0, 0, 0, 1, 1,
-0.3519044, -0.6703238, -3.06696, 0, 0, 0, 1, 1,
-0.3456526, 0.1704255, -1.363862, 1, 1, 1, 1, 1,
-0.3415228, 1.513635, 0.114888, 1, 1, 1, 1, 1,
-0.338872, -0.569779, -4.051967, 1, 1, 1, 1, 1,
-0.335694, 1.673573, 0.8374369, 1, 1, 1, 1, 1,
-0.3351506, 0.190352, -0.3561761, 1, 1, 1, 1, 1,
-0.3338527, 1.176617, -0.9719179, 1, 1, 1, 1, 1,
-0.326468, 1.879196, -1.829771, 1, 1, 1, 1, 1,
-0.3157228, 0.1765188, -2.328284, 1, 1, 1, 1, 1,
-0.3119891, -1.192828, -2.352212, 1, 1, 1, 1, 1,
-0.3094077, 1.343003, -0.4341646, 1, 1, 1, 1, 1,
-0.3035956, -0.7172099, -2.754242, 1, 1, 1, 1, 1,
-0.2987541, -1.238379, -1.51856, 1, 1, 1, 1, 1,
-0.2980409, 1.356228, -1.470889, 1, 1, 1, 1, 1,
-0.2967994, 1.280302, 0.1656524, 1, 1, 1, 1, 1,
-0.2943082, 0.08842136, -1.255969, 1, 1, 1, 1, 1,
-0.2924221, 0.1412053, -0.7978505, 0, 0, 1, 1, 1,
-0.2859138, 1.198429, -0.1990083, 1, 0, 0, 1, 1,
-0.2824252, 0.9948885, -0.4252763, 1, 0, 0, 1, 1,
-0.2813255, 1.792289, 0.0727343, 1, 0, 0, 1, 1,
-0.2804604, 0.07484692, 0.7884544, 1, 0, 0, 1, 1,
-0.2708249, 0.303971, -0.9505846, 1, 0, 0, 1, 1,
-0.2591315, 0.09202944, -2.097537, 0, 0, 0, 1, 1,
-0.2578523, 1.480208, 2.262029, 0, 0, 0, 1, 1,
-0.2570297, 0.2842242, -1.920076, 0, 0, 0, 1, 1,
-0.2539863, 0.9060583, 1.553765, 0, 0, 0, 1, 1,
-0.2538085, 0.3067681, -1.512475, 0, 0, 0, 1, 1,
-0.2516044, 0.1760148, -0.1196766, 0, 0, 0, 1, 1,
-0.2501394, 0.9231763, 2.431161, 0, 0, 0, 1, 1,
-0.2432255, -0.03178172, -3.195786, 1, 1, 1, 1, 1,
-0.2428655, -0.4207976, -2.185803, 1, 1, 1, 1, 1,
-0.2415689, -2.655366, -2.718325, 1, 1, 1, 1, 1,
-0.240395, 0.3466401, -1.597054, 1, 1, 1, 1, 1,
-0.2340317, 0.5780266, 0.4041848, 1, 1, 1, 1, 1,
-0.232785, 0.3470008, -1.258101, 1, 1, 1, 1, 1,
-0.2324977, -1.139835, -2.544546, 1, 1, 1, 1, 1,
-0.232409, -0.5035625, -1.085087, 1, 1, 1, 1, 1,
-0.2316647, -0.8788518, -2.675904, 1, 1, 1, 1, 1,
-0.222782, -0.7169351, -3.705046, 1, 1, 1, 1, 1,
-0.2216265, 0.5751829, 0.6682197, 1, 1, 1, 1, 1,
-0.2192991, 0.003157478, -2.01666, 1, 1, 1, 1, 1,
-0.2182721, -0.9250443, -3.104021, 1, 1, 1, 1, 1,
-0.2165807, -1.936934, -1.544482, 1, 1, 1, 1, 1,
-0.2114799, 0.6920329, 0.5879536, 1, 1, 1, 1, 1,
-0.2075412, 0.03738258, -1.653104, 0, 0, 1, 1, 1,
-0.2051431, 1.359325, 0.9289581, 1, 0, 0, 1, 1,
-0.205071, -0.03873869, -1.567536, 1, 0, 0, 1, 1,
-0.2021835, 1.177654, -1.734464, 1, 0, 0, 1, 1,
-0.2009014, 0.03826721, -1.473555, 1, 0, 0, 1, 1,
-0.2008876, -0.3672829, -2.543235, 1, 0, 0, 1, 1,
-0.2005731, -0.6543105, -2.304624, 0, 0, 0, 1, 1,
-0.1875901, 0.1708132, -1.040314, 0, 0, 0, 1, 1,
-0.1834804, 0.6268909, 0.1887068, 0, 0, 0, 1, 1,
-0.1810396, 1.505942, 1.454485, 0, 0, 0, 1, 1,
-0.1797649, -0.02316062, -2.351855, 0, 0, 0, 1, 1,
-0.1775314, 0.07098655, -2.19071, 0, 0, 0, 1, 1,
-0.1763517, -0.3711407, -3.844743, 0, 0, 0, 1, 1,
-0.1747155, 0.246618, 0.9992287, 1, 1, 1, 1, 1,
-0.1740518, 0.1933657, -1.043442, 1, 1, 1, 1, 1,
-0.1655125, 0.4905895, -0.04518149, 1, 1, 1, 1, 1,
-0.1585885, 0.2199864, 0.7388235, 1, 1, 1, 1, 1,
-0.1513923, 0.3931339, 0.5780026, 1, 1, 1, 1, 1,
-0.1471279, -0.3402448, -3.943828, 1, 1, 1, 1, 1,
-0.1448799, 0.9247231, 0.7524097, 1, 1, 1, 1, 1,
-0.1423385, 0.4859978, -0.1658892, 1, 1, 1, 1, 1,
-0.1420826, -0.08839329, -1.865052, 1, 1, 1, 1, 1,
-0.1372151, -0.8490596, -3.974692, 1, 1, 1, 1, 1,
-0.1330578, 0.3387425, -0.2429952, 1, 1, 1, 1, 1,
-0.1323997, -1.603148, -3.17628, 1, 1, 1, 1, 1,
-0.1302091, -1.012418, -3.22577, 1, 1, 1, 1, 1,
-0.1277331, 1.417851, 1.056415, 1, 1, 1, 1, 1,
-0.1276063, 0.9803895, -0.9950957, 1, 1, 1, 1, 1,
-0.1269919, 0.5235287, -0.9079856, 0, 0, 1, 1, 1,
-0.1261976, -0.3256178, -2.174063, 1, 0, 0, 1, 1,
-0.1235247, 1.558834, -0.7575843, 1, 0, 0, 1, 1,
-0.1223271, 0.3864075, 1.074332, 1, 0, 0, 1, 1,
-0.1218373, 0.8851036, -0.4143444, 1, 0, 0, 1, 1,
-0.1198208, 0.700352, 0.4636796, 1, 0, 0, 1, 1,
-0.1178439, 0.2420148, -0.0914197, 0, 0, 0, 1, 1,
-0.1156255, 0.5358398, 1.699489, 0, 0, 0, 1, 1,
-0.1153512, -0.2450689, -3.212397, 0, 0, 0, 1, 1,
-0.1129923, 1.26862, -1.021115, 0, 0, 0, 1, 1,
-0.1119833, 0.6137031, -0.8328811, 0, 0, 0, 1, 1,
-0.1103629, 1.536663, -0.1471153, 0, 0, 0, 1, 1,
-0.1102857, -0.8534927, -1.923107, 0, 0, 0, 1, 1,
-0.1085728, 1.019367, -0.0107072, 1, 1, 1, 1, 1,
-0.1073046, -1.564379, -2.73989, 1, 1, 1, 1, 1,
-0.1053127, -0.8437973, -3.046591, 1, 1, 1, 1, 1,
-0.104611, -0.1402597, -2.845344, 1, 1, 1, 1, 1,
-0.1044587, 0.3950735, -1.109408, 1, 1, 1, 1, 1,
-0.1038853, -0.4730719, -3.414803, 1, 1, 1, 1, 1,
-0.1002062, -0.02431903, -0.992443, 1, 1, 1, 1, 1,
-0.09949967, 1.359351, -0.7281047, 1, 1, 1, 1, 1,
-0.09947497, 0.995628, -1.235607, 1, 1, 1, 1, 1,
-0.09776478, -0.1296548, -0.9710655, 1, 1, 1, 1, 1,
-0.09693888, 0.2555888, 0.4774881, 1, 1, 1, 1, 1,
-0.09611411, 0.5726123, -2.09439, 1, 1, 1, 1, 1,
-0.08980828, 0.164559, -0.5637426, 1, 1, 1, 1, 1,
-0.08971491, 1.066675, 0.9082206, 1, 1, 1, 1, 1,
-0.08871015, 1.077261, -0.08600127, 1, 1, 1, 1, 1,
-0.08795109, -0.2657652, -2.448436, 0, 0, 1, 1, 1,
-0.08504388, -1.478837, -2.407501, 1, 0, 0, 1, 1,
-0.08359775, -0.1765337, -1.271727, 1, 0, 0, 1, 1,
-0.08062632, -1.464841, -2.688926, 1, 0, 0, 1, 1,
-0.07562996, -0.5360835, -3.480314, 1, 0, 0, 1, 1,
-0.07300723, 0.5254577, 1.92573, 1, 0, 0, 1, 1,
-0.06998583, 1.289153, -0.7041503, 0, 0, 0, 1, 1,
-0.06823019, -0.6515828, -3.376506, 0, 0, 0, 1, 1,
-0.06757493, 0.03724637, -0.8386097, 0, 0, 0, 1, 1,
-0.06017098, -0.3558897, -1.205993, 0, 0, 0, 1, 1,
-0.05995101, 0.8519756, 0.5084556, 0, 0, 0, 1, 1,
-0.05810801, -2.588164, -1.321633, 0, 0, 0, 1, 1,
-0.05713226, 0.5543345, -0.4995389, 0, 0, 0, 1, 1,
-0.0550823, -1.263657, -2.306372, 1, 1, 1, 1, 1,
-0.04969405, 1.911878, 0.3549556, 1, 1, 1, 1, 1,
-0.04632178, 0.2588418, -0.2717229, 1, 1, 1, 1, 1,
-0.03849546, -1.594319, -4.811582, 1, 1, 1, 1, 1,
-0.03801749, -1.433194, -2.958302, 1, 1, 1, 1, 1,
-0.03507186, -0.5519726, -3.09535, 1, 1, 1, 1, 1,
-0.03486641, -1.495905, -3.789349, 1, 1, 1, 1, 1,
-0.03313683, -0.8744733, -3.943153, 1, 1, 1, 1, 1,
-0.03249124, -0.9214133, -1.937524, 1, 1, 1, 1, 1,
-0.03215168, 0.402253, -0.6360469, 1, 1, 1, 1, 1,
-0.02720645, 0.5183164, -1.240807, 1, 1, 1, 1, 1,
-0.02386733, -1.171703, -4.036176, 1, 1, 1, 1, 1,
-0.02219424, 1.205261, -1.157629, 1, 1, 1, 1, 1,
-0.02024806, -0.4678431, -3.797186, 1, 1, 1, 1, 1,
-0.01729898, 0.6368983, 0.2728932, 1, 1, 1, 1, 1,
-0.0143821, -0.8909212, -3.709766, 0, 0, 1, 1, 1,
-0.009118811, -1.579111, -3.202318, 1, 0, 0, 1, 1,
-0.005433372, -1.482753, -4.873335, 1, 0, 0, 1, 1,
-0.00488809, -0.4776697, -2.440251, 1, 0, 0, 1, 1,
0.001723668, -1.181018, 5.51192, 1, 0, 0, 1, 1,
0.002659233, 0.9307269, 0.4647264, 1, 0, 0, 1, 1,
0.006077883, -0.8450322, 3.797553, 0, 0, 0, 1, 1,
0.01323767, -0.6952205, 3.539659, 0, 0, 0, 1, 1,
0.01414097, 1.205936, -1.102605, 0, 0, 0, 1, 1,
0.01912444, 0.624517, 2.130073, 0, 0, 0, 1, 1,
0.02101719, 2.425144, 0.5237373, 0, 0, 0, 1, 1,
0.02134766, 0.5634429, -0.2852486, 0, 0, 0, 1, 1,
0.0215941, -1.403015, 4.345101, 0, 0, 0, 1, 1,
0.02162775, 1.362807, -0.483349, 1, 1, 1, 1, 1,
0.0217602, 1.272489, -0.7794715, 1, 1, 1, 1, 1,
0.0278383, 0.1321725, -0.2841512, 1, 1, 1, 1, 1,
0.03078436, -0.5208333, 3.732053, 1, 1, 1, 1, 1,
0.03234703, 1.441104, 0.4463702, 1, 1, 1, 1, 1,
0.0330259, -0.6877304, 2.26498, 1, 1, 1, 1, 1,
0.03625682, 0.386581, 0.5870656, 1, 1, 1, 1, 1,
0.03768329, 1.327981, -0.6054685, 1, 1, 1, 1, 1,
0.04262961, -0.7385259, 3.326804, 1, 1, 1, 1, 1,
0.04535699, -2.569431, 4.766286, 1, 1, 1, 1, 1,
0.04680537, -0.493489, 3.178844, 1, 1, 1, 1, 1,
0.05457934, 0.9317275, 1.070959, 1, 1, 1, 1, 1,
0.0553702, -0.2800221, 2.849262, 1, 1, 1, 1, 1,
0.05719572, 0.1000506, 1.735573, 1, 1, 1, 1, 1,
0.05772813, 1.064738, 0.7899516, 1, 1, 1, 1, 1,
0.05942423, -0.9769613, 1.939977, 0, 0, 1, 1, 1,
0.05959728, 0.1231314, -0.4770757, 1, 0, 0, 1, 1,
0.06006012, -1.306212, 4.476084, 1, 0, 0, 1, 1,
0.06206426, 1.446821, -0.361086, 1, 0, 0, 1, 1,
0.06274432, 2.201216, 0.6350805, 1, 0, 0, 1, 1,
0.06606499, 0.3378241, -0.05983962, 1, 0, 0, 1, 1,
0.06989782, 2.672862, -0.5697433, 0, 0, 0, 1, 1,
0.07294929, -1.608787, 2.94727, 0, 0, 0, 1, 1,
0.07389013, 1.209471, 0.4955948, 0, 0, 0, 1, 1,
0.07646863, 0.6595758, -1.277435, 0, 0, 0, 1, 1,
0.08402853, -0.3010864, 3.123454, 0, 0, 0, 1, 1,
0.08463524, 0.04244686, 0.6192867, 0, 0, 0, 1, 1,
0.08618076, -0.4401433, 3.928975, 0, 0, 0, 1, 1,
0.0871469, 1.427316, 0.9349463, 1, 1, 1, 1, 1,
0.09269597, 1.80265, -1.124797, 1, 1, 1, 1, 1,
0.09789956, -0.8023595, 5.398546, 1, 1, 1, 1, 1,
0.09989542, -2.013704, 4.944938, 1, 1, 1, 1, 1,
0.1011637, -1.091275, 3.34902, 1, 1, 1, 1, 1,
0.1057973, -0.1110488, 3.206273, 1, 1, 1, 1, 1,
0.1067899, 0.4258348, -0.1073207, 1, 1, 1, 1, 1,
0.1079627, 0.7347155, 1.490688, 1, 1, 1, 1, 1,
0.1105279, 0.0700006, 0.5157292, 1, 1, 1, 1, 1,
0.1135249, -0.2254071, 0.950067, 1, 1, 1, 1, 1,
0.1162246, 0.6549033, -0.1099115, 1, 1, 1, 1, 1,
0.11914, 0.6689233, -2.225907, 1, 1, 1, 1, 1,
0.1204894, 0.3140956, 0.1491921, 1, 1, 1, 1, 1,
0.1270414, -1.015822, 3.574883, 1, 1, 1, 1, 1,
0.131642, -2.280239, 3.397739, 1, 1, 1, 1, 1,
0.1324131, -0.3369351, 5.555335, 0, 0, 1, 1, 1,
0.1337966, -1.383613, 2.353479, 1, 0, 0, 1, 1,
0.1412269, -1.203405, 3.224353, 1, 0, 0, 1, 1,
0.1453741, -0.2041119, 2.629693, 1, 0, 0, 1, 1,
0.1462002, 1.225932, -0.35842, 1, 0, 0, 1, 1,
0.1470969, 0.07340977, 0.9413844, 1, 0, 0, 1, 1,
0.147201, -0.8364925, 4.535287, 0, 0, 0, 1, 1,
0.1516461, 1.604523, -0.4546162, 0, 0, 0, 1, 1,
0.1524834, 0.2607466, -0.190494, 0, 0, 0, 1, 1,
0.1525379, -0.3334713, 2.326056, 0, 0, 0, 1, 1,
0.154588, 0.2846511, -0.222127, 0, 0, 0, 1, 1,
0.1588852, 1.513137, -1.435597, 0, 0, 0, 1, 1,
0.1600905, 0.1083478, 1.004052, 0, 0, 0, 1, 1,
0.1630107, -0.508403, 3.524724, 1, 1, 1, 1, 1,
0.1630712, 1.073565, 0.6308113, 1, 1, 1, 1, 1,
0.1634841, -0.7067118, 2.315297, 1, 1, 1, 1, 1,
0.1650779, 0.005538661, 1.388667, 1, 1, 1, 1, 1,
0.1666439, -0.3537257, 1.850155, 1, 1, 1, 1, 1,
0.171111, -1.080238, 3.224267, 1, 1, 1, 1, 1,
0.1711617, 1.124458, 0.2928388, 1, 1, 1, 1, 1,
0.1829424, 0.8564659, -1.656483, 1, 1, 1, 1, 1,
0.1847548, 2.296475, -0.9831042, 1, 1, 1, 1, 1,
0.1872601, 1.00062, -0.1022897, 1, 1, 1, 1, 1,
0.1894399, 0.9393377, 1.54668, 1, 1, 1, 1, 1,
0.1908403, 0.9841044, 1.840221, 1, 1, 1, 1, 1,
0.1930375, -1.964332, 2.717161, 1, 1, 1, 1, 1,
0.1935971, 0.403671, -0.005160168, 1, 1, 1, 1, 1,
0.1936552, -0.6537499, 1.915695, 1, 1, 1, 1, 1,
0.200187, 1.919363, 1.80658, 0, 0, 1, 1, 1,
0.2032107, -0.5571027, 3.393737, 1, 0, 0, 1, 1,
0.2048604, -1.237508, 2.681697, 1, 0, 0, 1, 1,
0.2071129, 0.4775556, -0.720994, 1, 0, 0, 1, 1,
0.2095723, 0.2977417, 0.231237, 1, 0, 0, 1, 1,
0.2100936, -0.09700973, 2.506981, 1, 0, 0, 1, 1,
0.2121011, 0.339936, 0.3953532, 0, 0, 0, 1, 1,
0.2128134, 1.96221, 1.780618, 0, 0, 0, 1, 1,
0.2132063, -1.003909, 3.183409, 0, 0, 0, 1, 1,
0.2161954, 0.3041332, 1.997406, 0, 0, 0, 1, 1,
0.2165158, 0.8518712, -1.56879, 0, 0, 0, 1, 1,
0.2169688, -0.1432044, 3.286399, 0, 0, 0, 1, 1,
0.2188612, 0.6562988, 2.579489, 0, 0, 0, 1, 1,
0.2220818, 1.060716, -0.7737586, 1, 1, 1, 1, 1,
0.2229608, 0.1194726, 1.654372, 1, 1, 1, 1, 1,
0.2230975, -0.1986446, 1.783206, 1, 1, 1, 1, 1,
0.2324862, -0.3251578, 1.289611, 1, 1, 1, 1, 1,
0.2426723, 1.357782, -1.899658, 1, 1, 1, 1, 1,
0.2440684, -1.343705, 2.597634, 1, 1, 1, 1, 1,
0.244779, -0.9151546, 1.895439, 1, 1, 1, 1, 1,
0.2453428, -1.511197, 0.7093053, 1, 1, 1, 1, 1,
0.2460885, 0.7822584, 0.9512379, 1, 1, 1, 1, 1,
0.2534486, -0.8665775, 2.540899, 1, 1, 1, 1, 1,
0.2556237, 0.8095003, 0.2105742, 1, 1, 1, 1, 1,
0.2574147, 0.318938, 2.253516, 1, 1, 1, 1, 1,
0.2583353, 0.3161921, 1.009678, 1, 1, 1, 1, 1,
0.2602049, -0.1164204, 2.060396, 1, 1, 1, 1, 1,
0.2603206, -0.2583307, 3.88923, 1, 1, 1, 1, 1,
0.2622105, 1.258986, -0.1948935, 0, 0, 1, 1, 1,
0.2636997, -0.9927762, 2.490254, 1, 0, 0, 1, 1,
0.2685771, 1.009769, 0.8378934, 1, 0, 0, 1, 1,
0.2686407, 0.0999675, 1.153961, 1, 0, 0, 1, 1,
0.2722508, 0.9520414, 1.424212, 1, 0, 0, 1, 1,
0.2765612, -0.8458731, 1.903927, 1, 0, 0, 1, 1,
0.2788258, 1.184669, 0.2419254, 0, 0, 0, 1, 1,
0.2842574, -0.187277, 1.525932, 0, 0, 0, 1, 1,
0.286465, 1.162137, 0.5078494, 0, 0, 0, 1, 1,
0.2890037, 1.510993, 1.130786, 0, 0, 0, 1, 1,
0.2892215, 0.3389519, -0.948005, 0, 0, 0, 1, 1,
0.2958022, -2.281465, 3.269083, 0, 0, 0, 1, 1,
0.2976255, -0.7749025, 1.010005, 0, 0, 0, 1, 1,
0.3076546, 0.6598086, 1.584112, 1, 1, 1, 1, 1,
0.316907, 1.75764, 0.3863368, 1, 1, 1, 1, 1,
0.3176668, 0.07563855, 1.601423, 1, 1, 1, 1, 1,
0.320287, 0.3082234, 1.164555, 1, 1, 1, 1, 1,
0.3225699, -0.3643521, 0.7105408, 1, 1, 1, 1, 1,
0.3269573, -0.9879073, 3.789994, 1, 1, 1, 1, 1,
0.3275482, -0.02660139, 1.754928, 1, 1, 1, 1, 1,
0.3280202, -1.29659, 3.167908, 1, 1, 1, 1, 1,
0.3308802, 0.3052273, 2.633963, 1, 1, 1, 1, 1,
0.3313052, 0.4664401, 1.484974, 1, 1, 1, 1, 1,
0.3328489, 0.9524533, 0.1211059, 1, 1, 1, 1, 1,
0.3331149, -1.504714, 1.923026, 1, 1, 1, 1, 1,
0.3345845, -0.9094929, 3.665085, 1, 1, 1, 1, 1,
0.3346713, 0.9161046, -1.192285, 1, 1, 1, 1, 1,
0.3359126, 0.820979, 1.915841, 1, 1, 1, 1, 1,
0.3386054, 0.6895977, 0.1904148, 0, 0, 1, 1, 1,
0.3411189, -0.129746, 1.419737, 1, 0, 0, 1, 1,
0.3416625, -1.202833, 2.687354, 1, 0, 0, 1, 1,
0.3436338, -1.391293, 2.952856, 1, 0, 0, 1, 1,
0.3452566, 0.1421999, 1.462671, 1, 0, 0, 1, 1,
0.3494237, 0.3130267, 1.799719, 1, 0, 0, 1, 1,
0.3496062, -0.274067, 2.594131, 0, 0, 0, 1, 1,
0.3529197, 0.9026069, 0.8785959, 0, 0, 0, 1, 1,
0.3539183, 0.1268853, 0.3298721, 0, 0, 0, 1, 1,
0.3547247, -1.961963, 2.399252, 0, 0, 0, 1, 1,
0.3586817, 0.8304552, 0.4885457, 0, 0, 0, 1, 1,
0.3599052, 0.2384581, -0.8778537, 0, 0, 0, 1, 1,
0.3755459, 1.13191, 0.05916654, 0, 0, 0, 1, 1,
0.3756574, -0.8775935, 3.118359, 1, 1, 1, 1, 1,
0.389813, 0.4962446, 0.3848106, 1, 1, 1, 1, 1,
0.3963822, 0.1750369, 1.998495, 1, 1, 1, 1, 1,
0.3990594, -1.186488, 3.328904, 1, 1, 1, 1, 1,
0.4037419, -1.477861, 2.189038, 1, 1, 1, 1, 1,
0.4063304, -0.299719, 4.40519, 1, 1, 1, 1, 1,
0.4067079, 2.19876, 0.1021844, 1, 1, 1, 1, 1,
0.4102551, 2.040072, 0.9083809, 1, 1, 1, 1, 1,
0.4108153, -0.2400219, 3.946916, 1, 1, 1, 1, 1,
0.4133497, 1.52251, 1.364286, 1, 1, 1, 1, 1,
0.4136496, -0.3673633, 1.980149, 1, 1, 1, 1, 1,
0.4159336, -0.744107, 3.010778, 1, 1, 1, 1, 1,
0.4201183, 0.4547006, -0.4836905, 1, 1, 1, 1, 1,
0.4204222, -0.6188464, 2.990599, 1, 1, 1, 1, 1,
0.4233508, -1.430116, 2.795947, 1, 1, 1, 1, 1,
0.4241549, 1.104961, 0.3569343, 0, 0, 1, 1, 1,
0.4365007, 0.046953, 0.4862483, 1, 0, 0, 1, 1,
0.4372694, -0.9467769, 2.810035, 1, 0, 0, 1, 1,
0.438207, 0.6900867, 2.060383, 1, 0, 0, 1, 1,
0.4395761, 0.8799595, 0.4294872, 1, 0, 0, 1, 1,
0.4407146, 2.03056, -0.6773958, 1, 0, 0, 1, 1,
0.4415374, -0.07174162, 1.290306, 0, 0, 0, 1, 1,
0.4424753, -0.3173781, 3.804172, 0, 0, 0, 1, 1,
0.443283, 0.3431671, -0.4672755, 0, 0, 0, 1, 1,
0.4486792, 0.5223689, 0.9168005, 0, 0, 0, 1, 1,
0.4492936, -0.08137788, 1.885475, 0, 0, 0, 1, 1,
0.4512357, -1.494059, 1.814644, 0, 0, 0, 1, 1,
0.4517993, 2.186955, -0.171354, 0, 0, 0, 1, 1,
0.4569969, 0.1240024, 2.84629, 1, 1, 1, 1, 1,
0.4596318, -0.6570198, 3.970053, 1, 1, 1, 1, 1,
0.4628045, 0.5572094, 0.37778, 1, 1, 1, 1, 1,
0.4667802, 0.2850063, 1.058663, 1, 1, 1, 1, 1,
0.4685354, 0.123064, 1.031445, 1, 1, 1, 1, 1,
0.4773136, -0.8412949, 1.597303, 1, 1, 1, 1, 1,
0.4786372, -0.4502819, 0.5080669, 1, 1, 1, 1, 1,
0.4815586, 0.08950959, 0.5569438, 1, 1, 1, 1, 1,
0.4843999, 0.6792641, 0.1860713, 1, 1, 1, 1, 1,
0.4853874, 0.9905201, 2.576508, 1, 1, 1, 1, 1,
0.5001569, -0.3970278, 0.7681995, 1, 1, 1, 1, 1,
0.5016827, 0.439523, 1.195481, 1, 1, 1, 1, 1,
0.5016959, 0.9933934, 1.287803, 1, 1, 1, 1, 1,
0.5032734, 0.1810778, -0.9405686, 1, 1, 1, 1, 1,
0.5047395, 1.0186, -0.09933998, 1, 1, 1, 1, 1,
0.5138116, 0.7330011, 0.9688175, 0, 0, 1, 1, 1,
0.5142947, -0.720692, 1.564822, 1, 0, 0, 1, 1,
0.5144972, 0.8128732, -0.5850563, 1, 0, 0, 1, 1,
0.5179176, -0.1239503, 1.446718, 1, 0, 0, 1, 1,
0.5194028, -0.4775506, 3.013216, 1, 0, 0, 1, 1,
0.520665, -2.120646, 3.00623, 1, 0, 0, 1, 1,
0.5214267, -1.492509, 3.452482, 0, 0, 0, 1, 1,
0.5226313, -1.473092, 1.191749, 0, 0, 0, 1, 1,
0.5259858, -0.1159911, -0.01240912, 0, 0, 0, 1, 1,
0.5283505, -2.493057, 2.678663, 0, 0, 0, 1, 1,
0.5286474, -0.7062808, 3.080765, 0, 0, 0, 1, 1,
0.5302767, 1.292718, -1.25078, 0, 0, 0, 1, 1,
0.5326308, 1.290603, -0.3525644, 0, 0, 0, 1, 1,
0.5328037, -0.4669848, 1.590514, 1, 1, 1, 1, 1,
0.5328268, 0.3706897, 1.842389, 1, 1, 1, 1, 1,
0.5420582, 1.070167, -0.2549177, 1, 1, 1, 1, 1,
0.5448813, -0.6930007, 3.618278, 1, 1, 1, 1, 1,
0.5464873, 1.24712, -1.988289, 1, 1, 1, 1, 1,
0.5517995, -0.9103073, 1.573096, 1, 1, 1, 1, 1,
0.5522345, -1.617345, 3.589496, 1, 1, 1, 1, 1,
0.5524877, -0.2906801, 2.066292, 1, 1, 1, 1, 1,
0.5560792, 0.392284, 0.3553058, 1, 1, 1, 1, 1,
0.5589023, 0.3697725, -1.122859, 1, 1, 1, 1, 1,
0.5601202, 0.8832464, 2.008045, 1, 1, 1, 1, 1,
0.5683296, 0.4316222, 0.7907045, 1, 1, 1, 1, 1,
0.5730466, 0.9319302, 1.482473, 1, 1, 1, 1, 1,
0.5749119, -3.77505, 3.887653, 1, 1, 1, 1, 1,
0.5756464, -0.5888035, 2.81833, 1, 1, 1, 1, 1,
0.5773842, -0.5766284, 2.006947, 0, 0, 1, 1, 1,
0.5814951, 0.3127094, 2.607372, 1, 0, 0, 1, 1,
0.5875615, 1.674071, -0.5563028, 1, 0, 0, 1, 1,
0.5890614, -3.136198, 2.147024, 1, 0, 0, 1, 1,
0.5912309, 0.3446802, 2.149365, 1, 0, 0, 1, 1,
0.6008354, 0.501725, 1.256873, 1, 0, 0, 1, 1,
0.6026319, 0.08193681, 2.362424, 0, 0, 0, 1, 1,
0.6053841, -1.35837, 3.008288, 0, 0, 0, 1, 1,
0.6056517, 0.01175935, 2.545885, 0, 0, 0, 1, 1,
0.6069697, 0.1709661, 0.7583618, 0, 0, 0, 1, 1,
0.6070345, -1.112519, 4.738006, 0, 0, 0, 1, 1,
0.6075169, 0.4979951, 1.449281, 0, 0, 0, 1, 1,
0.610217, -0.3316751, 0.5129731, 0, 0, 0, 1, 1,
0.6153343, -0.1454716, 1.303516, 1, 1, 1, 1, 1,
0.6155378, 2.190177, 0.7758418, 1, 1, 1, 1, 1,
0.6208512, -1.222201, 4.411881, 1, 1, 1, 1, 1,
0.6258388, 0.6502135, 0.9857806, 1, 1, 1, 1, 1,
0.6263106, -0.9528967, 3.048465, 1, 1, 1, 1, 1,
0.6353489, -0.379573, 2.73952, 1, 1, 1, 1, 1,
0.636923, 0.1712869, 1.123428, 1, 1, 1, 1, 1,
0.6395674, 0.9021131, 1.985904, 1, 1, 1, 1, 1,
0.6489425, -0.3334237, 2.153583, 1, 1, 1, 1, 1,
0.6527325, 2.153533, 0.6642971, 1, 1, 1, 1, 1,
0.6539021, 1.659116, -0.8286965, 1, 1, 1, 1, 1,
0.6565593, -0.5526546, 5.03191, 1, 1, 1, 1, 1,
0.6616716, -1.714336, 3.626348, 1, 1, 1, 1, 1,
0.6656066, -0.02666233, 1.813878, 1, 1, 1, 1, 1,
0.6667396, 0.5366125, 1.698371, 1, 1, 1, 1, 1,
0.6668718, -0.4650327, 2.325688, 0, 0, 1, 1, 1,
0.6782839, -1.47436, 1.232923, 1, 0, 0, 1, 1,
0.6867137, 0.9979151, 0.4738561, 1, 0, 0, 1, 1,
0.6873754, -1.186997, 3.047917, 1, 0, 0, 1, 1,
0.6967548, -0.1698803, 1.986466, 1, 0, 0, 1, 1,
0.6970693, -1.074646, 2.933025, 1, 0, 0, 1, 1,
0.6991515, 0.7781051, -0.5626844, 0, 0, 0, 1, 1,
0.7006136, 0.1656405, 1.884066, 0, 0, 0, 1, 1,
0.7008598, 0.2427057, 0.1674144, 0, 0, 0, 1, 1,
0.7013057, 0.1847748, 1.376182, 0, 0, 0, 1, 1,
0.7051428, 2.365887, 1.861007, 0, 0, 0, 1, 1,
0.7053171, -0.1326093, 1.374728, 0, 0, 0, 1, 1,
0.7061968, -0.05507661, 2.277528, 0, 0, 0, 1, 1,
0.7070214, -0.1915836, 3.167971, 1, 1, 1, 1, 1,
0.7091776, 2.638798, -1.358796, 1, 1, 1, 1, 1,
0.7094792, 0.9188721, 1.282717, 1, 1, 1, 1, 1,
0.7186363, 1.185641, 0.05726675, 1, 1, 1, 1, 1,
0.7211501, 1.56848, -2.202355, 1, 1, 1, 1, 1,
0.723361, -1.604338, 1.260513, 1, 1, 1, 1, 1,
0.7267886, 0.7223359, 0.4613243, 1, 1, 1, 1, 1,
0.7342651, 0.3794217, 0.5341958, 1, 1, 1, 1, 1,
0.7420824, 0.8298884, -0.2097228, 1, 1, 1, 1, 1,
0.7449182, 1.405436, 1.260865, 1, 1, 1, 1, 1,
0.7455735, 2.065724, 0.09145372, 1, 1, 1, 1, 1,
0.7479445, 0.9261621, 0.1693757, 1, 1, 1, 1, 1,
0.7503439, 0.5911668, 1.171621, 1, 1, 1, 1, 1,
0.7523471, -2.563693, 2.137547, 1, 1, 1, 1, 1,
0.7612681, 0.8195261, 0.4455702, 1, 1, 1, 1, 1,
0.762969, -0.6079217, 2.113643, 0, 0, 1, 1, 1,
0.767296, -0.9050148, 2.698597, 1, 0, 0, 1, 1,
0.771436, -0.03206392, 1.941885, 1, 0, 0, 1, 1,
0.7743502, -1.524655, 2.183285, 1, 0, 0, 1, 1,
0.7757897, 0.3609914, 1.426847, 1, 0, 0, 1, 1,
0.7769158, -1.523174, 3.344871, 1, 0, 0, 1, 1,
0.7773573, -0.8523738, 1.96687, 0, 0, 0, 1, 1,
0.7839194, -0.5984395, 2.179586, 0, 0, 0, 1, 1,
0.7877914, 0.06493572, 1.539882, 0, 0, 0, 1, 1,
0.7919602, 1.06941, 0.254927, 0, 0, 0, 1, 1,
0.7936422, -2.771557, 2.854476, 0, 0, 0, 1, 1,
0.7966561, -0.3921012, 1.09097, 0, 0, 0, 1, 1,
0.7968028, -0.1049603, 1.842122, 0, 0, 0, 1, 1,
0.7976753, 1.140507, 0.9884152, 1, 1, 1, 1, 1,
0.7985023, -0.1166486, 0.6718338, 1, 1, 1, 1, 1,
0.7992313, -0.4182571, 0.9553612, 1, 1, 1, 1, 1,
0.8010467, 1.360105, 1.592284, 1, 1, 1, 1, 1,
0.8194501, 2.043527, -0.3895427, 1, 1, 1, 1, 1,
0.8205103, -0.5228941, 3.544021, 1, 1, 1, 1, 1,
0.8242517, 0.02853835, 0.3414127, 1, 1, 1, 1, 1,
0.8250018, 2.146541, 0.6527702, 1, 1, 1, 1, 1,
0.8304513, 0.733279, 0.4284638, 1, 1, 1, 1, 1,
0.8372438, 0.8715998, -0.2795884, 1, 1, 1, 1, 1,
0.8451728, 1.334139, 1.43014, 1, 1, 1, 1, 1,
0.8454025, 0.8583989, 2.100297, 1, 1, 1, 1, 1,
0.8461187, 0.4910686, 2.040522, 1, 1, 1, 1, 1,
0.8468843, 1.440022, -0.2189522, 1, 1, 1, 1, 1,
0.8502584, 0.2245242, 0.5982925, 1, 1, 1, 1, 1,
0.8505091, 0.48875, -0.9585372, 0, 0, 1, 1, 1,
0.8554127, 1.38372, 1.281379, 1, 0, 0, 1, 1,
0.862904, -0.5187955, 1.728292, 1, 0, 0, 1, 1,
0.8629555, -0.9564375, 1.126327, 1, 0, 0, 1, 1,
0.8631499, 0.3338014, 0.3772023, 1, 0, 0, 1, 1,
0.8690325, 1.170465, 1.517504, 1, 0, 0, 1, 1,
0.8708553, -1.530327, 2.94642, 0, 0, 0, 1, 1,
0.8731974, 0.340018, 2.854171, 0, 0, 0, 1, 1,
0.8788025, -0.4589186, 3.797393, 0, 0, 0, 1, 1,
0.8801683, 0.5973661, 1.369095, 0, 0, 0, 1, 1,
0.881959, 0.3892123, 1.64791, 0, 0, 0, 1, 1,
0.8820437, -0.7553129, 2.468338, 0, 0, 0, 1, 1,
0.8900022, 0.06714614, 1.777983, 0, 0, 0, 1, 1,
0.8985578, 0.2204243, 3.155972, 1, 1, 1, 1, 1,
0.8995643, -1.689739, 4.114478, 1, 1, 1, 1, 1,
0.9029213, -0.1688716, 3.496052, 1, 1, 1, 1, 1,
0.9066488, 0.1863808, 0.522085, 1, 1, 1, 1, 1,
0.9130859, 0.4113357, 0.9024389, 1, 1, 1, 1, 1,
0.923114, 0.887632, 1.222252, 1, 1, 1, 1, 1,
0.9231376, -1.305475, 2.918332, 1, 1, 1, 1, 1,
0.9263829, 2.012773, -0.595682, 1, 1, 1, 1, 1,
0.9310431, -0.6113524, 1.291949, 1, 1, 1, 1, 1,
0.937907, -1.148391, 1.067567, 1, 1, 1, 1, 1,
0.9393054, -0.6148805, -0.4896465, 1, 1, 1, 1, 1,
0.9475825, 0.3611822, 1.576141, 1, 1, 1, 1, 1,
0.9545128, 1.307875, 1.369125, 1, 1, 1, 1, 1,
0.9556265, 1.029589, 1.988503, 1, 1, 1, 1, 1,
0.9575717, -0.628028, 0.3536146, 1, 1, 1, 1, 1,
0.958518, 0.3420563, 0.001114076, 0, 0, 1, 1, 1,
0.961155, 0.1369836, 2.353496, 1, 0, 0, 1, 1,
0.9683394, -0.1980081, 0.8443195, 1, 0, 0, 1, 1,
0.9696543, 0.6649952, 1.368866, 1, 0, 0, 1, 1,
0.9708766, -1.684583, 4.152246, 1, 0, 0, 1, 1,
0.9716557, 0.5389277, 3.142155, 1, 0, 0, 1, 1,
0.9728246, -0.6978471, 2.915437, 0, 0, 0, 1, 1,
0.9925911, -2.261318, 1.553675, 0, 0, 0, 1, 1,
0.9932463, 0.8302791, -0.1876592, 0, 0, 0, 1, 1,
0.9951147, -1.147055, 3.422771, 0, 0, 0, 1, 1,
0.9953293, 0.3445449, -0.5955915, 0, 0, 0, 1, 1,
1.00032, -1.443695, 3.659217, 0, 0, 0, 1, 1,
1.007608, -0.6335122, 3.905101, 0, 0, 0, 1, 1,
1.008304, -0.320861, 1.968337, 1, 1, 1, 1, 1,
1.009775, -1.168569, 2.673395, 1, 1, 1, 1, 1,
1.011206, 0.4680879, 1.37728, 1, 1, 1, 1, 1,
1.012113, 0.6170439, -0.3141805, 1, 1, 1, 1, 1,
1.012654, 0.0555537, 1.091615, 1, 1, 1, 1, 1,
1.021469, 0.2766454, 2.533593, 1, 1, 1, 1, 1,
1.02382, -1.206357, 2.628125, 1, 1, 1, 1, 1,
1.030348, -0.3258832, 1.661673, 1, 1, 1, 1, 1,
1.030722, 0.4888223, 1.232003, 1, 1, 1, 1, 1,
1.03989, 1.73108, -0.1397979, 1, 1, 1, 1, 1,
1.04118, -1.99678, 2.593469, 1, 1, 1, 1, 1,
1.043517, 0.21994, 1.581809, 1, 1, 1, 1, 1,
1.047167, -0.5510744, 2.045712, 1, 1, 1, 1, 1,
1.067352, 0.4632904, 1.485392, 1, 1, 1, 1, 1,
1.067813, 1.892415, -0.4291111, 1, 1, 1, 1, 1,
1.068005, -0.8786379, 2.398091, 0, 0, 1, 1, 1,
1.097242, 1.700934, -0.883673, 1, 0, 0, 1, 1,
1.100176, -0.5686755, 3.12617, 1, 0, 0, 1, 1,
1.107143, -0.8619385, 0.5091496, 1, 0, 0, 1, 1,
1.110535, -1.667109, 3.008938, 1, 0, 0, 1, 1,
1.114205, -0.7152517, 1.022964, 1, 0, 0, 1, 1,
1.125214, 0.132011, -0.0885286, 0, 0, 0, 1, 1,
1.140077, 0.4213591, 1.118712, 0, 0, 0, 1, 1,
1.151081, 0.3980941, 0.2837656, 0, 0, 0, 1, 1,
1.151516, 0.3510777, 0.815573, 0, 0, 0, 1, 1,
1.152839, -0.5869904, 0.9772738, 0, 0, 0, 1, 1,
1.160071, -0.1418405, 1.631203, 0, 0, 0, 1, 1,
1.162469, -0.4541938, 1.920323, 0, 0, 0, 1, 1,
1.164115, -1.198145, 0.7635662, 1, 1, 1, 1, 1,
1.177732, -1.552215, 2.1966, 1, 1, 1, 1, 1,
1.182867, -0.5751779, 2.765252, 1, 1, 1, 1, 1,
1.183256, -1.31363, 0.1326781, 1, 1, 1, 1, 1,
1.188716, -0.2227852, 1.02575, 1, 1, 1, 1, 1,
1.190339, -0.7383833, 2.06776, 1, 1, 1, 1, 1,
1.197646, -0.6320049, 1.488909, 1, 1, 1, 1, 1,
1.201216, 0.588263, 0.9246412, 1, 1, 1, 1, 1,
1.21434, -1.690691, 1.920852, 1, 1, 1, 1, 1,
1.22085, 0.7333613, 1.7875, 1, 1, 1, 1, 1,
1.222739, -1.420338, 2.935525, 1, 1, 1, 1, 1,
1.227757, 1.090669, 1.045197, 1, 1, 1, 1, 1,
1.231888, -0.1970158, 2.517366, 1, 1, 1, 1, 1,
1.237229, 1.608248, -0.04330292, 1, 1, 1, 1, 1,
1.241274, -0.5779124, 4.114446, 1, 1, 1, 1, 1,
1.243425, 0.05426054, 1.406022, 0, 0, 1, 1, 1,
1.245903, -1.419938, 1.79835, 1, 0, 0, 1, 1,
1.255517, -0.9092317, 2.505488, 1, 0, 0, 1, 1,
1.262673, 0.4126083, 1.194662, 1, 0, 0, 1, 1,
1.272859, -1.975086, 3.276939, 1, 0, 0, 1, 1,
1.275535, 0.843014, 1.307855, 1, 0, 0, 1, 1,
1.277218, -0.1272292, 1.355387, 0, 0, 0, 1, 1,
1.27989, 1.930162, 0.2877343, 0, 0, 0, 1, 1,
1.282819, -0.756264, 0.5551773, 0, 0, 0, 1, 1,
1.285442, -1.127347, 3.73781, 0, 0, 0, 1, 1,
1.286852, 0.8340322, 1.185303, 0, 0, 0, 1, 1,
1.288889, 0.2248013, 2.095832, 0, 0, 0, 1, 1,
1.293118, -0.003484365, 1.992392, 0, 0, 0, 1, 1,
1.303752, 0.701315, 1.684671, 1, 1, 1, 1, 1,
1.348505, 0.5230847, 2.42531, 1, 1, 1, 1, 1,
1.356643, 1.685279, 1.37659, 1, 1, 1, 1, 1,
1.373795, 1.46751, 1.684606, 1, 1, 1, 1, 1,
1.376535, 1.630059, 0.9152497, 1, 1, 1, 1, 1,
1.376878, -0.2984475, 2.715333, 1, 1, 1, 1, 1,
1.381112, -0.3429537, 1.240853, 1, 1, 1, 1, 1,
1.391752, 1.080232, 0.564844, 1, 1, 1, 1, 1,
1.40354, -1.98201, 2.530983, 1, 1, 1, 1, 1,
1.413636, 1.151607, -0.3224922, 1, 1, 1, 1, 1,
1.420421, 0.7625884, -1.004346, 1, 1, 1, 1, 1,
1.435976, -2.328335, 2.381907, 1, 1, 1, 1, 1,
1.445679, 0.02063798, 2.578239, 1, 1, 1, 1, 1,
1.458837, 0.5829725, 0.121546, 1, 1, 1, 1, 1,
1.47165, 0.08901349, 0.9746066, 1, 1, 1, 1, 1,
1.473021, 0.4819053, 2.087759, 0, 0, 1, 1, 1,
1.474173, -1.297568, 2.698747, 1, 0, 0, 1, 1,
1.483061, 2.985345, -1.325499, 1, 0, 0, 1, 1,
1.484759, -1.620554, 2.591982, 1, 0, 0, 1, 1,
1.490544, 0.5962541, -0.1949395, 1, 0, 0, 1, 1,
1.492192, 0.3599358, 0.2029375, 1, 0, 0, 1, 1,
1.496428, -0.4172274, 0.1768899, 0, 0, 0, 1, 1,
1.499188, -1.211442, 1.047298, 0, 0, 0, 1, 1,
1.519858, 1.066128, 1.417257, 0, 0, 0, 1, 1,
1.527302, -1.712587, 1.397033, 0, 0, 0, 1, 1,
1.536352, 0.09792613, 2.432419, 0, 0, 0, 1, 1,
1.537138, 0.9369854, 1.667748, 0, 0, 0, 1, 1,
1.547172, 0.5082662, 0.8773059, 0, 0, 0, 1, 1,
1.570758, -1.041198, 2.605483, 1, 1, 1, 1, 1,
1.574878, -0.2013648, 2.428906, 1, 1, 1, 1, 1,
1.583697, 0.3355064, 1.356589, 1, 1, 1, 1, 1,
1.596029, -0.8748198, 4.030571, 1, 1, 1, 1, 1,
1.602112, 0.4208758, 0.6219113, 1, 1, 1, 1, 1,
1.610741, -1.048334, 2.261702, 1, 1, 1, 1, 1,
1.612778, -0.5890578, 2.489305, 1, 1, 1, 1, 1,
1.623581, -0.5287775, 2.478444, 1, 1, 1, 1, 1,
1.635005, 0.130838, 1.057901, 1, 1, 1, 1, 1,
1.641129, 0.4839398, 2.411414, 1, 1, 1, 1, 1,
1.663037, 1.743355, -0.9596655, 1, 1, 1, 1, 1,
1.671164, -0.1343104, 2.722801, 1, 1, 1, 1, 1,
1.692167, 1.735513, -0.1673371, 1, 1, 1, 1, 1,
1.694604, -0.03924011, 1.056449, 1, 1, 1, 1, 1,
1.698386, 0.6577232, 0.9227566, 1, 1, 1, 1, 1,
1.704717, -1.93878, 2.923015, 0, 0, 1, 1, 1,
1.72976, 1.931124, 1.023978, 1, 0, 0, 1, 1,
1.735191, 1.107734, 0.9129335, 1, 0, 0, 1, 1,
1.751378, -0.4240781, 2.58182, 1, 0, 0, 1, 1,
1.754858, 0.3569861, 2.020856, 1, 0, 0, 1, 1,
1.756534, 0.677295, 1.074236, 1, 0, 0, 1, 1,
1.764963, 1.090096, 0.357577, 0, 0, 0, 1, 1,
1.785932, -2.529027, 3.42857, 0, 0, 0, 1, 1,
1.793655, 1.183214, -0.7725619, 0, 0, 0, 1, 1,
1.800299, -1.038278, 0.1259503, 0, 0, 0, 1, 1,
1.807046, 0.5508443, 1.644904, 0, 0, 0, 1, 1,
1.820091, -0.4431544, 1.209084, 0, 0, 0, 1, 1,
1.821187, 0.9333431, 1.101092, 0, 0, 0, 1, 1,
1.834039, -1.515613, 1.691597, 1, 1, 1, 1, 1,
1.846325, 0.4049274, -0.4226528, 1, 1, 1, 1, 1,
1.847587, -0.3422766, 1.819277, 1, 1, 1, 1, 1,
1.852777, -1.23255, 2.521185, 1, 1, 1, 1, 1,
1.857304, -0.5713832, 4.359808, 1, 1, 1, 1, 1,
1.875512, -1.559007, 3.367929, 1, 1, 1, 1, 1,
1.900074, 0.2270295, 1.260343, 1, 1, 1, 1, 1,
1.922437, -0.01648669, 1.947157, 1, 1, 1, 1, 1,
1.945913, -1.189398, 2.218508, 1, 1, 1, 1, 1,
1.957586, 0.7562702, 1.261192, 1, 1, 1, 1, 1,
1.995365, 0.2244172, 0.5676034, 1, 1, 1, 1, 1,
2.004497, 0.4809768, 1.563897, 1, 1, 1, 1, 1,
2.026124, -0.3716815, 0.5189393, 1, 1, 1, 1, 1,
2.070845, 0.3108573, 1.568574, 1, 1, 1, 1, 1,
2.074728, 0.2653561, 1.088866, 1, 1, 1, 1, 1,
2.083064, 1.95026, 0.9203045, 0, 0, 1, 1, 1,
2.083131, -1.234724, 1.645049, 1, 0, 0, 1, 1,
2.098433, -0.9876118, 2.72777, 1, 0, 0, 1, 1,
2.121743, -0.583086, 1.83382, 1, 0, 0, 1, 1,
2.146208, -0.2954855, 2.44234, 1, 0, 0, 1, 1,
2.176548, 2.620971, -0.2186348, 1, 0, 0, 1, 1,
2.226821, -0.288604, 2.079657, 0, 0, 0, 1, 1,
2.250368, 0.6641193, 2.222628, 0, 0, 0, 1, 1,
2.306487, 0.2363991, 2.158445, 0, 0, 0, 1, 1,
2.315237, -0.08222625, 0.2496169, 0, 0, 0, 1, 1,
2.315467, 0.08456741, 3.644751, 0, 0, 0, 1, 1,
2.4317, -1.026499, 2.753277, 0, 0, 0, 1, 1,
2.604556, -1.25549, 1.78955, 0, 0, 0, 1, 1,
2.623406, 1.08664, 1.59519, 1, 1, 1, 1, 1,
2.662969, 0.8697134, 0.1013162, 1, 1, 1, 1, 1,
2.678567, -0.6847304, 0.8277156, 1, 1, 1, 1, 1,
2.84596, 0.8151148, 0.09386352, 1, 1, 1, 1, 1,
2.921965, -0.4326529, -0.04724487, 1, 1, 1, 1, 1,
2.9445, -0.6623486, 2.549254, 1, 1, 1, 1, 1,
2.972432, 0.3232603, 1.996711, 1, 1, 1, 1, 1
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
var radius = 9.710946;
var distance = 34.10929;
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
mvMatrix.translate( 0.05274081, -0.03285456, -0.3409998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10929);
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
