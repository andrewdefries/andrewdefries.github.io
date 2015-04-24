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
-3.14497, -0.2762212, 0.02162883, 1, 0, 0, 1,
-2.978597, 0.5645567, -2.172085, 1, 0.007843138, 0, 1,
-2.748303, 0.8918262, -2.480809, 1, 0.01176471, 0, 1,
-2.54788, 0.8951322, -1.317589, 1, 0.01960784, 0, 1,
-2.435622, -0.5829583, 0.5654269, 1, 0.02352941, 0, 1,
-2.378799, -1.699692, -1.706441, 1, 0.03137255, 0, 1,
-2.341739, 0.9333941, 0.1669739, 1, 0.03529412, 0, 1,
-2.264583, -0.09565195, -2.862315, 1, 0.04313726, 0, 1,
-2.207743, -0.945651, -0.2933306, 1, 0.04705882, 0, 1,
-2.198569, -0.5429376, -4.145616, 1, 0.05490196, 0, 1,
-2.196546, -0.2024156, -1.82338, 1, 0.05882353, 0, 1,
-2.173284, 1.128715, -1.392084, 1, 0.06666667, 0, 1,
-2.168096, 0.4884189, -1.451781, 1, 0.07058824, 0, 1,
-2.166149, 0.6289201, -1.570146, 1, 0.07843138, 0, 1,
-2.165091, 0.2032556, -3.647615, 1, 0.08235294, 0, 1,
-2.160814, 1.341619, 0.4534076, 1, 0.09019608, 0, 1,
-2.136977, -0.207153, -1.565566, 1, 0.09411765, 0, 1,
-2.023655, -1.134275, -2.748835, 1, 0.1019608, 0, 1,
-2.003206, -0.5978577, -1.301637, 1, 0.1098039, 0, 1,
-1.999743, -1.699945, -3.531085, 1, 0.1137255, 0, 1,
-1.950166, 0.8189361, -3.128188, 1, 0.1215686, 0, 1,
-1.924029, 0.725038, -2.531712, 1, 0.1254902, 0, 1,
-1.92171, -1.277408, -1.99781, 1, 0.1333333, 0, 1,
-1.901573, -0.07887587, -1.845852, 1, 0.1372549, 0, 1,
-1.88547, -1.563708, -3.435569, 1, 0.145098, 0, 1,
-1.868176, 0.4532526, -4.07058, 1, 0.1490196, 0, 1,
-1.85888, 1.541687, -1.066203, 1, 0.1568628, 0, 1,
-1.851278, -0.3154515, -3.654721, 1, 0.1607843, 0, 1,
-1.847222, 0.6213097, -2.687418, 1, 0.1686275, 0, 1,
-1.843799, -0.4746593, -1.852149, 1, 0.172549, 0, 1,
-1.819792, 0.4941112, -1.603658, 1, 0.1803922, 0, 1,
-1.812392, 0.009364199, -2.251514, 1, 0.1843137, 0, 1,
-1.795848, -0.3152502, 0.08451454, 1, 0.1921569, 0, 1,
-1.788806, 0.2745882, -1.43599, 1, 0.1960784, 0, 1,
-1.778587, -0.09096502, -1.492018, 1, 0.2039216, 0, 1,
-1.776293, -1.574916, -2.785908, 1, 0.2117647, 0, 1,
-1.774478, -0.3748058, -1.966266, 1, 0.2156863, 0, 1,
-1.764965, 1.47051, -1.521374, 1, 0.2235294, 0, 1,
-1.763776, -0.9566624, -3.131023, 1, 0.227451, 0, 1,
-1.75978, 0.1165963, -2.41942, 1, 0.2352941, 0, 1,
-1.751965, -0.8586893, -2.842862, 1, 0.2392157, 0, 1,
-1.749191, 0.3049153, -2.88569, 1, 0.2470588, 0, 1,
-1.747349, -1.025018, -3.495986, 1, 0.2509804, 0, 1,
-1.740949, -0.1613608, -1.157381, 1, 0.2588235, 0, 1,
-1.73105, -1.406048, -2.577701, 1, 0.2627451, 0, 1,
-1.730575, -1.74063, -2.128613, 1, 0.2705882, 0, 1,
-1.704119, -1.165906, -1.291882, 1, 0.2745098, 0, 1,
-1.700958, -0.0001100975, -1.868581, 1, 0.282353, 0, 1,
-1.69384, -0.3020534, -1.36942, 1, 0.2862745, 0, 1,
-1.680503, -0.5071357, -2.494741, 1, 0.2941177, 0, 1,
-1.671503, -1.837219, -2.867461, 1, 0.3019608, 0, 1,
-1.66662, 0.797763, -1.180403, 1, 0.3058824, 0, 1,
-1.664731, -0.873893, -1.47417, 1, 0.3137255, 0, 1,
-1.632524, 0.5405914, -1.056047, 1, 0.3176471, 0, 1,
-1.610299, 0.7545825, -1.314365, 1, 0.3254902, 0, 1,
-1.597692, -1.155358, -2.501213, 1, 0.3294118, 0, 1,
-1.592723, -0.886955, -1.65854, 1, 0.3372549, 0, 1,
-1.592421, -2.473469, -2.216237, 1, 0.3411765, 0, 1,
-1.566777, -0.8556111, -1.766612, 1, 0.3490196, 0, 1,
-1.557031, -0.4201908, -2.99847, 1, 0.3529412, 0, 1,
-1.553191, -0.1999311, -1.419596, 1, 0.3607843, 0, 1,
-1.550004, -0.3035702, -1.635248, 1, 0.3647059, 0, 1,
-1.548941, 0.2933702, -1.181332, 1, 0.372549, 0, 1,
-1.527115, -0.6961816, -1.557799, 1, 0.3764706, 0, 1,
-1.521716, -0.07626293, -2.274818, 1, 0.3843137, 0, 1,
-1.51998, -1.127246, -4.207824, 1, 0.3882353, 0, 1,
-1.5065, 1.701804, 0.8705326, 1, 0.3960784, 0, 1,
-1.500794, -0.2043927, -1.373572, 1, 0.4039216, 0, 1,
-1.487394, -0.1113421, -1.400331, 1, 0.4078431, 0, 1,
-1.4747, -0.9386579, -0.1580162, 1, 0.4156863, 0, 1,
-1.467026, -1.756012, -2.857975, 1, 0.4196078, 0, 1,
-1.462824, 0.04201799, -1.754747, 1, 0.427451, 0, 1,
-1.443812, 0.5310154, -0.958647, 1, 0.4313726, 0, 1,
-1.432793, -1.507813, -2.843356, 1, 0.4392157, 0, 1,
-1.413375, 0.966587, -2.796343, 1, 0.4431373, 0, 1,
-1.413083, -1.289989, -1.483537, 1, 0.4509804, 0, 1,
-1.4081, -0.2566676, -1.093189, 1, 0.454902, 0, 1,
-1.39784, 0.5517566, -0.6513091, 1, 0.4627451, 0, 1,
-1.397828, 1.1156, -0.6587772, 1, 0.4666667, 0, 1,
-1.396011, 0.6233127, -0.4602976, 1, 0.4745098, 0, 1,
-1.383431, 2.376535, -1.639703, 1, 0.4784314, 0, 1,
-1.379819, 1.166077, 1.454477, 1, 0.4862745, 0, 1,
-1.365091, -2.085292, -2.81495, 1, 0.4901961, 0, 1,
-1.359725, -0.5949982, -2.426304, 1, 0.4980392, 0, 1,
-1.357737, 1.007148, -0.6418427, 1, 0.5058824, 0, 1,
-1.34826, 1.263399, -1.405879, 1, 0.509804, 0, 1,
-1.347432, -1.314603, -2.945949, 1, 0.5176471, 0, 1,
-1.337435, -2.064422, -2.799379, 1, 0.5215687, 0, 1,
-1.330788, 2.382726, -0.3730962, 1, 0.5294118, 0, 1,
-1.327417, -0.04917933, -1.511804, 1, 0.5333334, 0, 1,
-1.325399, 1.682177, 0.06074411, 1, 0.5411765, 0, 1,
-1.315934, -0.321045, -2.750092, 1, 0.5450981, 0, 1,
-1.315141, -0.2348602, -2.062627, 1, 0.5529412, 0, 1,
-1.306182, -0.7454416, -2.565562, 1, 0.5568628, 0, 1,
-1.3041, -0.3696015, -3.300634, 1, 0.5647059, 0, 1,
-1.29855, 0.01249357, -1.354938, 1, 0.5686275, 0, 1,
-1.297627, -0.8175635, -2.640132, 1, 0.5764706, 0, 1,
-1.285529, -1.783929, -1.926421, 1, 0.5803922, 0, 1,
-1.283668, -2.415156, -2.049026, 1, 0.5882353, 0, 1,
-1.28241, 0.5391443, -0.495778, 1, 0.5921569, 0, 1,
-1.275434, 1.385561, -0.5262976, 1, 0.6, 0, 1,
-1.26724, -0.3074272, -0.8907729, 1, 0.6078432, 0, 1,
-1.267126, -0.1732241, -0.7978436, 1, 0.6117647, 0, 1,
-1.262782, -0.6952347, -2.864042, 1, 0.6196079, 0, 1,
-1.253439, 0.8255621, -0.289096, 1, 0.6235294, 0, 1,
-1.248505, -0.3614779, -1.492867, 1, 0.6313726, 0, 1,
-1.247661, 0.4407498, -0.1953583, 1, 0.6352941, 0, 1,
-1.241261, 0.622604, 0.2580978, 1, 0.6431373, 0, 1,
-1.239376, -1.245698, -1.279086, 1, 0.6470588, 0, 1,
-1.238515, -1.321889, -3.596986, 1, 0.654902, 0, 1,
-1.233226, 0.2785038, -0.7496837, 1, 0.6588235, 0, 1,
-1.227814, -1.531708, -3.254786, 1, 0.6666667, 0, 1,
-1.216877, -0.9163907, -1.891937, 1, 0.6705883, 0, 1,
-1.199962, 1.50589, -1.46203, 1, 0.6784314, 0, 1,
-1.199425, 0.6294655, -2.492197, 1, 0.682353, 0, 1,
-1.19319, 1.293987, -0.08363109, 1, 0.6901961, 0, 1,
-1.190776, -0.1204954, -2.898792, 1, 0.6941177, 0, 1,
-1.178126, -0.3516614, -1.969299, 1, 0.7019608, 0, 1,
-1.164915, 2.521932, -0.3098475, 1, 0.7098039, 0, 1,
-1.158317, 0.8454494, -1.454867, 1, 0.7137255, 0, 1,
-1.158199, -1.055735, -4.182652, 1, 0.7215686, 0, 1,
-1.141477, -0.8689116, -1.931016, 1, 0.7254902, 0, 1,
-1.1395, 1.216782, 0.2781664, 1, 0.7333333, 0, 1,
-1.136646, 0.5831183, -2.830786, 1, 0.7372549, 0, 1,
-1.135998, 2.347894, -0.2258286, 1, 0.7450981, 0, 1,
-1.125177, 0.5928616, 0.2291558, 1, 0.7490196, 0, 1,
-1.121871, -1.271034, -1.072255, 1, 0.7568628, 0, 1,
-1.1205, 0.4759112, -1.335876, 1, 0.7607843, 0, 1,
-1.112966, 2.585625, -1.611539, 1, 0.7686275, 0, 1,
-1.110528, -0.7446824, -1.756185, 1, 0.772549, 0, 1,
-1.095086, 2.356872, -1.810125, 1, 0.7803922, 0, 1,
-1.086076, 0.6648192, -2.422473, 1, 0.7843137, 0, 1,
-1.083971, 0.4066043, -2.159628, 1, 0.7921569, 0, 1,
-1.066502, 0.3441696, -1.204771, 1, 0.7960784, 0, 1,
-1.064438, -0.1375746, -3.21443, 1, 0.8039216, 0, 1,
-1.060255, -0.4998213, -1.107986, 1, 0.8117647, 0, 1,
-1.05998, 0.964255, -0.01051392, 1, 0.8156863, 0, 1,
-1.05692, -1.41446, -1.186156, 1, 0.8235294, 0, 1,
-1.047097, 1.5321, -0.5482281, 1, 0.827451, 0, 1,
-1.041566, -0.5679492, -1.782117, 1, 0.8352941, 0, 1,
-1.040734, -0.1925957, -2.801708, 1, 0.8392157, 0, 1,
-1.03907, 1.160607, -1.74736, 1, 0.8470588, 0, 1,
-1.02985, -0.1262439, -1.134052, 1, 0.8509804, 0, 1,
-1.021721, -1.123571, -1.987993, 1, 0.8588235, 0, 1,
-1.017145, 0.5747279, -2.253765, 1, 0.8627451, 0, 1,
-1.015564, 1.496392, 0.8178136, 1, 0.8705882, 0, 1,
-1.015491, -0.7192104, -2.497019, 1, 0.8745098, 0, 1,
-1.014703, -1.489067, -2.371415, 1, 0.8823529, 0, 1,
-1.006922, -0.4295166, -2.563435, 1, 0.8862745, 0, 1,
-1.002679, -0.08983908, -1.423185, 1, 0.8941177, 0, 1,
-0.99213, 0.06324349, -2.118161, 1, 0.8980392, 0, 1,
-0.9910204, -0.4674996, -2.051465, 1, 0.9058824, 0, 1,
-0.9908142, -1.354969, -2.002753, 1, 0.9137255, 0, 1,
-0.9847949, -0.7054756, -1.783587, 1, 0.9176471, 0, 1,
-0.9751911, 0.9270234, -0.8537952, 1, 0.9254902, 0, 1,
-0.9687526, -0.4578207, -1.226111, 1, 0.9294118, 0, 1,
-0.9626584, 2.225781, -1.216102, 1, 0.9372549, 0, 1,
-0.961619, -0.2214711, -1.922783, 1, 0.9411765, 0, 1,
-0.9527445, -0.9414242, -1.998057, 1, 0.9490196, 0, 1,
-0.9471622, 0.8032798, -1.454369, 1, 0.9529412, 0, 1,
-0.9419894, 0.9015253, -1.031183, 1, 0.9607843, 0, 1,
-0.9333029, -0.8606564, -2.540837, 1, 0.9647059, 0, 1,
-0.9304906, -1.231068, -1.504305, 1, 0.972549, 0, 1,
-0.9230835, -0.2880999, -3.722517, 1, 0.9764706, 0, 1,
-0.9150082, -0.2836086, -1.743233, 1, 0.9843137, 0, 1,
-0.9080141, 0.6646086, -0.3320735, 1, 0.9882353, 0, 1,
-0.907231, 0.5897146, -1.072533, 1, 0.9960784, 0, 1,
-0.898428, 0.04613141, -3.245384, 0.9960784, 1, 0, 1,
-0.8963565, 0.4206534, -1.282686, 0.9921569, 1, 0, 1,
-0.8933619, 0.1713935, -0.9017374, 0.9843137, 1, 0, 1,
-0.8923014, -0.2966132, -1.459697, 0.9803922, 1, 0, 1,
-0.8879163, -0.06832031, -1.799185, 0.972549, 1, 0, 1,
-0.8857244, 1.00549, 0.0709962, 0.9686275, 1, 0, 1,
-0.881267, 0.8934621, -1.193301, 0.9607843, 1, 0, 1,
-0.8811821, -0.5185108, -2.529055, 0.9568627, 1, 0, 1,
-0.8764589, 0.285804, -0.8219379, 0.9490196, 1, 0, 1,
-0.8690543, 1.37931, -2.227857, 0.945098, 1, 0, 1,
-0.8651791, 1.482964, 0.1987078, 0.9372549, 1, 0, 1,
-0.8651466, -0.6032953, -1.95568, 0.9333333, 1, 0, 1,
-0.8593696, 2.029561, 0.3443252, 0.9254902, 1, 0, 1,
-0.8590634, 0.3880864, -2.076584, 0.9215686, 1, 0, 1,
-0.8500674, -0.1292379, 0.2258023, 0.9137255, 1, 0, 1,
-0.8479486, -0.5821584, -3.626935, 0.9098039, 1, 0, 1,
-0.8479327, -2.268815, -3.102557, 0.9019608, 1, 0, 1,
-0.8477694, -0.01268904, -1.656633, 0.8941177, 1, 0, 1,
-0.8458771, 1.86325, 0.6750703, 0.8901961, 1, 0, 1,
-0.8447685, -0.6632621, -3.093682, 0.8823529, 1, 0, 1,
-0.8445852, 0.2134919, 0.1749723, 0.8784314, 1, 0, 1,
-0.8410642, 1.060641, -1.166807, 0.8705882, 1, 0, 1,
-0.8360363, -0.740082, -1.868756, 0.8666667, 1, 0, 1,
-0.830807, -0.3809294, -1.985188, 0.8588235, 1, 0, 1,
-0.8287938, 0.4492676, -2.047664, 0.854902, 1, 0, 1,
-0.8256074, 0.2553042, -1.009471, 0.8470588, 1, 0, 1,
-0.8249065, -0.7374257, -3.174486, 0.8431373, 1, 0, 1,
-0.821309, 1.261853, -0.6932941, 0.8352941, 1, 0, 1,
-0.8203492, -0.4348522, -2.797062, 0.8313726, 1, 0, 1,
-0.8202161, -1.33102, -1.816741, 0.8235294, 1, 0, 1,
-0.8153441, 0.4839723, -0.5165899, 0.8196079, 1, 0, 1,
-0.8106339, -0.946173, -0.7492523, 0.8117647, 1, 0, 1,
-0.8051299, 0.8089511, -1.159541, 0.8078431, 1, 0, 1,
-0.802401, -0.3361219, -2.850401, 0.8, 1, 0, 1,
-0.7974916, 1.809712, 1.76473, 0.7921569, 1, 0, 1,
-0.795634, -0.4422401, -1.782088, 0.7882353, 1, 0, 1,
-0.7952502, 1.31917, -1.732776, 0.7803922, 1, 0, 1,
-0.7880608, 0.4120393, -0.6178662, 0.7764706, 1, 0, 1,
-0.7877662, 0.2570451, -2.906418, 0.7686275, 1, 0, 1,
-0.7870035, 2.895, -1.501566, 0.7647059, 1, 0, 1,
-0.7863141, -1.500622, -2.106211, 0.7568628, 1, 0, 1,
-0.7699543, 0.858068, -0.1428696, 0.7529412, 1, 0, 1,
-0.7651904, -0.4348768, -2.292583, 0.7450981, 1, 0, 1,
-0.7631009, 0.0981756, -1.146821, 0.7411765, 1, 0, 1,
-0.7610493, 1.395474, -1.094999, 0.7333333, 1, 0, 1,
-0.7517294, 0.744632, -0.143656, 0.7294118, 1, 0, 1,
-0.7493246, 0.6979868, -0.9736311, 0.7215686, 1, 0, 1,
-0.7453839, 0.2152758, -2.258784, 0.7176471, 1, 0, 1,
-0.7432196, -1.069313, -0.9468846, 0.7098039, 1, 0, 1,
-0.7407319, 1.930151, -2.054862, 0.7058824, 1, 0, 1,
-0.7387387, -0.08586531, -1.250103, 0.6980392, 1, 0, 1,
-0.7348346, -1.504136, -2.270575, 0.6901961, 1, 0, 1,
-0.7293395, 0.2423367, -1.666312, 0.6862745, 1, 0, 1,
-0.72909, 1.124808, -0.528231, 0.6784314, 1, 0, 1,
-0.7265109, -0.289007, 0.4531794, 0.6745098, 1, 0, 1,
-0.7249295, 0.55387, -1.278394, 0.6666667, 1, 0, 1,
-0.7179226, -0.04423589, -2.887886, 0.6627451, 1, 0, 1,
-0.7177639, 1.18229, -0.127783, 0.654902, 1, 0, 1,
-0.7044652, -0.2386842, -1.429465, 0.6509804, 1, 0, 1,
-0.7041991, 1.048824, -1.344266, 0.6431373, 1, 0, 1,
-0.7041242, -2.331779, -2.067918, 0.6392157, 1, 0, 1,
-0.7038559, -0.04526812, 0.5800928, 0.6313726, 1, 0, 1,
-0.7033077, -0.3607245, -1.405831, 0.627451, 1, 0, 1,
-0.68769, 0.600873, -1.763806, 0.6196079, 1, 0, 1,
-0.6874247, 1.340839, -0.008942716, 0.6156863, 1, 0, 1,
-0.6848076, -2.837495, -4.219645, 0.6078432, 1, 0, 1,
-0.6808385, 0.1635633, -0.6498884, 0.6039216, 1, 0, 1,
-0.6798708, 0.01869555, -0.6920218, 0.5960785, 1, 0, 1,
-0.6679992, 2.315398, -1.427924, 0.5882353, 1, 0, 1,
-0.6679522, 1.020167, -1.990178, 0.5843138, 1, 0, 1,
-0.6619328, 1.200798, -0.05019075, 0.5764706, 1, 0, 1,
-0.6593257, 0.3724715, 0.08376493, 0.572549, 1, 0, 1,
-0.6567639, 0.2270798, -0.7289734, 0.5647059, 1, 0, 1,
-0.655117, 0.4631206, -0.5000202, 0.5607843, 1, 0, 1,
-0.6521426, 0.2811583, -0.923906, 0.5529412, 1, 0, 1,
-0.6475053, 0.2862777, -0.3412603, 0.5490196, 1, 0, 1,
-0.6472341, 0.2179497, 0.2523603, 0.5411765, 1, 0, 1,
-0.6462844, -1.322794, -2.706906, 0.5372549, 1, 0, 1,
-0.6442978, 1.14628, -2.032917, 0.5294118, 1, 0, 1,
-0.6431475, -1.496266, -4.626653, 0.5254902, 1, 0, 1,
-0.638265, -1.817273, -2.499276, 0.5176471, 1, 0, 1,
-0.635177, 0.4720472, -0.7127033, 0.5137255, 1, 0, 1,
-0.6345528, -0.9872788, -2.815794, 0.5058824, 1, 0, 1,
-0.6340277, 1.992821, -2.447423, 0.5019608, 1, 0, 1,
-0.6320074, 0.2495377, -1.868922, 0.4941176, 1, 0, 1,
-0.6319131, -1.100541, -2.687447, 0.4862745, 1, 0, 1,
-0.6284333, 0.8936852, -0.666692, 0.4823529, 1, 0, 1,
-0.6265578, -0.5337929, -2.945971, 0.4745098, 1, 0, 1,
-0.6241596, 0.07463396, -2.302142, 0.4705882, 1, 0, 1,
-0.620999, -0.667359, -1.414121, 0.4627451, 1, 0, 1,
-0.6094959, 0.6029952, 1.414427, 0.4588235, 1, 0, 1,
-0.6085392, -1.693114, -3.08516, 0.4509804, 1, 0, 1,
-0.6081631, -0.4275197, -2.534833, 0.4470588, 1, 0, 1,
-0.6043428, -1.689296, -1.716278, 0.4392157, 1, 0, 1,
-0.6020787, -0.5881813, -2.33851, 0.4352941, 1, 0, 1,
-0.6006594, -0.1093933, -2.400763, 0.427451, 1, 0, 1,
-0.6002381, -0.3162678, -2.115907, 0.4235294, 1, 0, 1,
-0.5913534, -0.9724065, -4.345056, 0.4156863, 1, 0, 1,
-0.5872025, -0.1663454, -2.552337, 0.4117647, 1, 0, 1,
-0.5858885, -0.6394237, -3.258023, 0.4039216, 1, 0, 1,
-0.5845168, 0.6172954, -1.855451, 0.3960784, 1, 0, 1,
-0.5718774, 0.4541262, 0.3785686, 0.3921569, 1, 0, 1,
-0.5712698, 0.7039146, -0.001143409, 0.3843137, 1, 0, 1,
-0.5699661, -1.187704, -3.637073, 0.3803922, 1, 0, 1,
-0.5669453, 0.4359188, -0.666077, 0.372549, 1, 0, 1,
-0.5646755, -0.7665367, -1.835601, 0.3686275, 1, 0, 1,
-0.5618916, -1.94095, -2.511061, 0.3607843, 1, 0, 1,
-0.5588696, -0.3604503, -3.249731, 0.3568628, 1, 0, 1,
-0.5582344, -0.03761722, -1.589853, 0.3490196, 1, 0, 1,
-0.5538642, -1.234561, -2.329503, 0.345098, 1, 0, 1,
-0.5510547, 0.268553, -1.981358, 0.3372549, 1, 0, 1,
-0.5477614, -0.8894585, -3.164375, 0.3333333, 1, 0, 1,
-0.5473018, 0.7479993, 0.1510006, 0.3254902, 1, 0, 1,
-0.5466751, -0.6929104, -2.28818, 0.3215686, 1, 0, 1,
-0.5396501, -0.3533976, -2.504075, 0.3137255, 1, 0, 1,
-0.534458, -0.8177547, -1.405471, 0.3098039, 1, 0, 1,
-0.5318757, -0.6265734, -1.361317, 0.3019608, 1, 0, 1,
-0.5309876, -0.2079819, -1.835373, 0.2941177, 1, 0, 1,
-0.5304821, 2.668758, 1.055618, 0.2901961, 1, 0, 1,
-0.5301833, 0.1805368, -2.403531, 0.282353, 1, 0, 1,
-0.5296305, 1.203805, -1.91638, 0.2784314, 1, 0, 1,
-0.5289443, -0.8743152, -3.162894, 0.2705882, 1, 0, 1,
-0.5181505, 0.4060995, -0.5219291, 0.2666667, 1, 0, 1,
-0.5140638, -0.4931352, -1.869301, 0.2588235, 1, 0, 1,
-0.5130267, 1.618209, -0.9159485, 0.254902, 1, 0, 1,
-0.5108225, 0.4751561, -0.5815912, 0.2470588, 1, 0, 1,
-0.5108204, -0.6482991, -2.372087, 0.2431373, 1, 0, 1,
-0.510161, -0.2864357, -1.084188, 0.2352941, 1, 0, 1,
-0.505218, 1.279117, -2.57034, 0.2313726, 1, 0, 1,
-0.4992252, -0.4667713, -2.134672, 0.2235294, 1, 0, 1,
-0.4990313, -0.1850657, -2.373212, 0.2196078, 1, 0, 1,
-0.4965388, -1.547313, -3.716518, 0.2117647, 1, 0, 1,
-0.4927111, 0.01190065, -2.713362, 0.2078431, 1, 0, 1,
-0.4913888, 0.7263218, -1.045467, 0.2, 1, 0, 1,
-0.4891015, -0.7605142, -0.3244126, 0.1921569, 1, 0, 1,
-0.4883877, -0.04831545, -1.209679, 0.1882353, 1, 0, 1,
-0.4869452, -0.2587226, -0.3581326, 0.1803922, 1, 0, 1,
-0.4837751, -0.4542265, -3.553897, 0.1764706, 1, 0, 1,
-0.4835911, 0.08251238, -2.939748, 0.1686275, 1, 0, 1,
-0.479227, 0.8451144, 0.9871442, 0.1647059, 1, 0, 1,
-0.4788029, 0.8778358, -1.886495, 0.1568628, 1, 0, 1,
-0.4766331, -0.9821413, -3.815271, 0.1529412, 1, 0, 1,
-0.4764007, 0.970917, -0.3599633, 0.145098, 1, 0, 1,
-0.4762305, -1.067816, -2.580291, 0.1411765, 1, 0, 1,
-0.4745773, 0.6093965, -0.6791044, 0.1333333, 1, 0, 1,
-0.4707068, 0.4204305, 1.10206, 0.1294118, 1, 0, 1,
-0.4697656, 0.618327, -0.5788484, 0.1215686, 1, 0, 1,
-0.4697453, -1.677899, -2.29508, 0.1176471, 1, 0, 1,
-0.4664575, 0.2273061, 0.7955199, 0.1098039, 1, 0, 1,
-0.4585385, -0.7746026, -2.042269, 0.1058824, 1, 0, 1,
-0.4536218, 0.2330195, 0.492976, 0.09803922, 1, 0, 1,
-0.4507001, 1.700693, -1.651733, 0.09019608, 1, 0, 1,
-0.4504387, 0.569435, 2.456579, 0.08627451, 1, 0, 1,
-0.4495459, -0.2786274, -1.400164, 0.07843138, 1, 0, 1,
-0.4486201, 0.1816694, -0.382896, 0.07450981, 1, 0, 1,
-0.447357, -0.2745873, -1.640555, 0.06666667, 1, 0, 1,
-0.4473255, -1.174817, -3.826619, 0.0627451, 1, 0, 1,
-0.4460174, -0.8398861, -3.887911, 0.05490196, 1, 0, 1,
-0.4444627, 1.995911, -1.475204, 0.05098039, 1, 0, 1,
-0.4437036, 0.03298865, -0.864113, 0.04313726, 1, 0, 1,
-0.440812, 0.4561687, -0.3552923, 0.03921569, 1, 0, 1,
-0.436808, 0.7021293, 0.1751939, 0.03137255, 1, 0, 1,
-0.4354175, -0.6826017, -2.658899, 0.02745098, 1, 0, 1,
-0.4333939, 1.122594, 0.6720896, 0.01960784, 1, 0, 1,
-0.4312721, -0.1368543, -1.71499, 0.01568628, 1, 0, 1,
-0.42768, 0.4460093, 0.01932151, 0.007843138, 1, 0, 1,
-0.4271747, -1.308423, -2.658891, 0.003921569, 1, 0, 1,
-0.4243438, 1.845296, 0.3050991, 0, 1, 0.003921569, 1,
-0.4240436, 1.104445, -0.3032527, 0, 1, 0.01176471, 1,
-0.4239085, -0.2524882, -3.555726, 0, 1, 0.01568628, 1,
-0.4226752, -2.113887, -3.472482, 0, 1, 0.02352941, 1,
-0.4186621, -0.3443728, -3.553166, 0, 1, 0.02745098, 1,
-0.4149896, -2.047982, -4.266408, 0, 1, 0.03529412, 1,
-0.410521, -0.2545032, -1.619083, 0, 1, 0.03921569, 1,
-0.4090319, 0.01320095, -1.694324, 0, 1, 0.04705882, 1,
-0.408695, 0.2842975, 0.4414166, 0, 1, 0.05098039, 1,
-0.4019671, 0.9068108, 1.352394, 0, 1, 0.05882353, 1,
-0.3964997, -0.1974536, -0.9410726, 0, 1, 0.0627451, 1,
-0.3945144, -1.036167, -3.029634, 0, 1, 0.07058824, 1,
-0.3943347, -0.580553, -3.195836, 0, 1, 0.07450981, 1,
-0.394088, -0.8013652, -3.364704, 0, 1, 0.08235294, 1,
-0.39387, 1.316025, -0.4454044, 0, 1, 0.08627451, 1,
-0.3933977, 0.1833853, -1.858687, 0, 1, 0.09411765, 1,
-0.3932771, -0.03463387, -4.142175, 0, 1, 0.1019608, 1,
-0.3775258, 0.6685373, -0.9704847, 0, 1, 0.1058824, 1,
-0.376682, -1.61865, -2.866264, 0, 1, 0.1137255, 1,
-0.3740543, 0.6380072, -1.269032, 0, 1, 0.1176471, 1,
-0.3705041, 1.120844, -0.3266592, 0, 1, 0.1254902, 1,
-0.3673163, -0.7040644, -3.7907, 0, 1, 0.1294118, 1,
-0.3663703, -0.9575114, -3.664013, 0, 1, 0.1372549, 1,
-0.364576, 1.03294, -1.079383, 0, 1, 0.1411765, 1,
-0.3637838, -2.291228, -2.492652, 0, 1, 0.1490196, 1,
-0.3625102, 0.2954426, 0.6919611, 0, 1, 0.1529412, 1,
-0.3596275, 1.78937, 0.1954514, 0, 1, 0.1607843, 1,
-0.3530096, 0.5807229, -0.1677188, 0, 1, 0.1647059, 1,
-0.3513017, 0.5404261, -1.246015, 0, 1, 0.172549, 1,
-0.3459226, -0.02784338, -1.221191, 0, 1, 0.1764706, 1,
-0.3453951, -1.187022, -2.524452, 0, 1, 0.1843137, 1,
-0.3417832, 0.5853782, -1.310476, 0, 1, 0.1882353, 1,
-0.3417157, 0.9455374, -0.9351588, 0, 1, 0.1960784, 1,
-0.3412984, 0.5380542, -0.400579, 0, 1, 0.2039216, 1,
-0.339454, 1.092018, -0.7766806, 0, 1, 0.2078431, 1,
-0.3389021, -2.487154, -2.117195, 0, 1, 0.2156863, 1,
-0.3286138, 1.75743, 1.186489, 0, 1, 0.2196078, 1,
-0.3251372, 0.0451653, -1.569273, 0, 1, 0.227451, 1,
-0.3248998, 1.040711, -0.05139534, 0, 1, 0.2313726, 1,
-0.3240258, -1.317495, -1.723439, 0, 1, 0.2392157, 1,
-0.3227314, 1.929614, 0.9815263, 0, 1, 0.2431373, 1,
-0.3202655, -2.511136, -3.920477, 0, 1, 0.2509804, 1,
-0.3183492, 0.6603437, 0.3869905, 0, 1, 0.254902, 1,
-0.317916, 0.6204676, -0.19179, 0, 1, 0.2627451, 1,
-0.3178096, 1.217555, 1.227792, 0, 1, 0.2666667, 1,
-0.3177093, -0.385634, -1.933803, 0, 1, 0.2745098, 1,
-0.3172117, 2.203613, -0.5737016, 0, 1, 0.2784314, 1,
-0.3124168, -0.5662485, -3.353199, 0, 1, 0.2862745, 1,
-0.3124069, -0.4372611, -3.578026, 0, 1, 0.2901961, 1,
-0.3123556, 0.1047567, -1.810921, 0, 1, 0.2980392, 1,
-0.3111489, -0.3567573, -2.864814, 0, 1, 0.3058824, 1,
-0.3106959, -0.4297375, -4.538414, 0, 1, 0.3098039, 1,
-0.3098623, -1.469238, -3.40866, 0, 1, 0.3176471, 1,
-0.309165, 0.09092391, -0.2072401, 0, 1, 0.3215686, 1,
-0.3077127, 1.760717, -0.4505557, 0, 1, 0.3294118, 1,
-0.3076542, -1.966511, -3.167513, 0, 1, 0.3333333, 1,
-0.3046575, 1.322943, -0.8278943, 0, 1, 0.3411765, 1,
-0.3025849, -0.03924278, -1.615232, 0, 1, 0.345098, 1,
-0.2984725, 0.6646917, -0.82411, 0, 1, 0.3529412, 1,
-0.296093, 1.766027, -0.2705312, 0, 1, 0.3568628, 1,
-0.2956209, -0.05860616, -2.795121, 0, 1, 0.3647059, 1,
-0.2954127, -1.306034, -2.535034, 0, 1, 0.3686275, 1,
-0.2938643, -1.697388, -2.866148, 0, 1, 0.3764706, 1,
-0.2871633, -0.160683, -1.900625, 0, 1, 0.3803922, 1,
-0.2822698, 1.430202, -0.4094605, 0, 1, 0.3882353, 1,
-0.2805446, -0.7013199, -2.977317, 0, 1, 0.3921569, 1,
-0.2805096, -0.02882376, -1.760246, 0, 1, 0.4, 1,
-0.2767806, 0.6527359, -0.5818819, 0, 1, 0.4078431, 1,
-0.2760958, 0.980943, -0.3481397, 0, 1, 0.4117647, 1,
-0.2708439, 0.8171747, -0.08883911, 0, 1, 0.4196078, 1,
-0.2692084, -0.6159858, -3.176999, 0, 1, 0.4235294, 1,
-0.2630136, -1.777587, -3.925255, 0, 1, 0.4313726, 1,
-0.2613887, -1.257021, -1.947067, 0, 1, 0.4352941, 1,
-0.2602077, -0.274321, -3.526183, 0, 1, 0.4431373, 1,
-0.2568958, -0.4293402, -2.893878, 0, 1, 0.4470588, 1,
-0.2564026, 0.2202965, -0.6524949, 0, 1, 0.454902, 1,
-0.250149, -0.1272987, -2.615734, 0, 1, 0.4588235, 1,
-0.2492719, -1.038584, -3.535247, 0, 1, 0.4666667, 1,
-0.2486302, -0.4045882, -2.3863, 0, 1, 0.4705882, 1,
-0.246682, -1.813531, -2.150265, 0, 1, 0.4784314, 1,
-0.2436286, 0.4087142, -1.036762, 0, 1, 0.4823529, 1,
-0.2432024, 0.01988591, -2.348009, 0, 1, 0.4901961, 1,
-0.2409483, -1.025413, -2.815904, 0, 1, 0.4941176, 1,
-0.2373164, -0.6143827, -4.832559, 0, 1, 0.5019608, 1,
-0.2298735, -0.8517449, -2.900655, 0, 1, 0.509804, 1,
-0.2296475, 0.4352982, -1.268523, 0, 1, 0.5137255, 1,
-0.2295358, 1.241649, 1.740808, 0, 1, 0.5215687, 1,
-0.2274132, -0.08525216, -1.508816, 0, 1, 0.5254902, 1,
-0.2232573, -0.6180719, -2.920613, 0, 1, 0.5333334, 1,
-0.2182893, -1.714618, -2.911937, 0, 1, 0.5372549, 1,
-0.2139079, 0.93376, -1.38213, 0, 1, 0.5450981, 1,
-0.2127221, -1.999832, -4.250789, 0, 1, 0.5490196, 1,
-0.2119832, -1.198012, -2.63976, 0, 1, 0.5568628, 1,
-0.210707, -0.3808999, -2.238676, 0, 1, 0.5607843, 1,
-0.2037191, 0.6530595, -0.5255206, 0, 1, 0.5686275, 1,
-0.1995229, -0.1323477, -2.45233, 0, 1, 0.572549, 1,
-0.1958622, 0.3579634, 0.8707042, 0, 1, 0.5803922, 1,
-0.1955844, -0.9241177, -3.016468, 0, 1, 0.5843138, 1,
-0.1939725, 0.4971477, -0.192526, 0, 1, 0.5921569, 1,
-0.1916726, 1.518859, -1.192379, 0, 1, 0.5960785, 1,
-0.1893672, 2.153803, -1.775566, 0, 1, 0.6039216, 1,
-0.1871378, 0.2651534, -1.480249, 0, 1, 0.6117647, 1,
-0.1865375, 0.8733036, -2.453541, 0, 1, 0.6156863, 1,
-0.1855218, 0.3641582, -0.6825905, 0, 1, 0.6235294, 1,
-0.1839258, 0.9039332, -0.190999, 0, 1, 0.627451, 1,
-0.1820517, -1.292254, -1.96299, 0, 1, 0.6352941, 1,
-0.1808923, -0.2133013, -3.145325, 0, 1, 0.6392157, 1,
-0.173367, -0.4849321, -2.825919, 0, 1, 0.6470588, 1,
-0.170307, -0.08513528, -3.662137, 0, 1, 0.6509804, 1,
-0.1684135, 0.9807987, 0.08550564, 0, 1, 0.6588235, 1,
-0.1666377, 1.723805, -0.1779697, 0, 1, 0.6627451, 1,
-0.1665451, -0.09337571, -2.558033, 0, 1, 0.6705883, 1,
-0.1657377, 1.691177, -1.423167, 0, 1, 0.6745098, 1,
-0.1647634, -0.6904657, -3.282626, 0, 1, 0.682353, 1,
-0.1613771, 0.9163005, 0.002375703, 0, 1, 0.6862745, 1,
-0.1580477, 0.2044808, 0.4685404, 0, 1, 0.6941177, 1,
-0.1573046, 0.06211188, -1.819487, 0, 1, 0.7019608, 1,
-0.1521277, -0.9285309, -1.417317, 0, 1, 0.7058824, 1,
-0.150842, -2.54236, -3.966009, 0, 1, 0.7137255, 1,
-0.1503112, 0.8173125, -0.4831419, 0, 1, 0.7176471, 1,
-0.1493372, 2.041129, 0.2614121, 0, 1, 0.7254902, 1,
-0.14866, 1.26792, -1.432434, 0, 1, 0.7294118, 1,
-0.148517, -1.208367, -4.163094, 0, 1, 0.7372549, 1,
-0.1472674, 0.6546909, -1.397346, 0, 1, 0.7411765, 1,
-0.1465118, -0.07724375, -3.678244, 0, 1, 0.7490196, 1,
-0.1459865, 0.8930465, -1.448077, 0, 1, 0.7529412, 1,
-0.1452708, -0.3348964, -3.651984, 0, 1, 0.7607843, 1,
-0.1446773, 1.496773, 0.7938512, 0, 1, 0.7647059, 1,
-0.1445241, 0.8922716, -0.4556718, 0, 1, 0.772549, 1,
-0.1427238, -0.2219926, -3.073523, 0, 1, 0.7764706, 1,
-0.141397, 0.2738655, 0.2231267, 0, 1, 0.7843137, 1,
-0.1369457, -0.6386446, -2.651259, 0, 1, 0.7882353, 1,
-0.1359443, 1.68348, 0.6682694, 0, 1, 0.7960784, 1,
-0.1342002, -1.065074, -2.069197, 0, 1, 0.8039216, 1,
-0.1322601, 0.2254573, 0.6229357, 0, 1, 0.8078431, 1,
-0.1298287, 1.043213, -0.3356661, 0, 1, 0.8156863, 1,
-0.1259793, 2.064354, -1.138065, 0, 1, 0.8196079, 1,
-0.1222188, 0.5538827, 0.756329, 0, 1, 0.827451, 1,
-0.1220902, 0.9826661, -0.6516904, 0, 1, 0.8313726, 1,
-0.1202955, 0.0212314, -2.18782, 0, 1, 0.8392157, 1,
-0.1116348, -2.795823, 0.105307, 0, 1, 0.8431373, 1,
-0.1061226, 1.964752, -0.7487953, 0, 1, 0.8509804, 1,
-0.09751381, -0.837892, -2.976051, 0, 1, 0.854902, 1,
-0.09546475, -0.9797431, -2.877391, 0, 1, 0.8627451, 1,
-0.0913353, -0.7135337, -2.796788, 0, 1, 0.8666667, 1,
-0.08330441, 0.5068792, -0.3667953, 0, 1, 0.8745098, 1,
-0.08280747, 0.9353514, 1.617757, 0, 1, 0.8784314, 1,
-0.07850261, -0.8402439, -3.448715, 0, 1, 0.8862745, 1,
-0.07677913, -0.6140726, -1.284129, 0, 1, 0.8901961, 1,
-0.07297906, 0.5041324, -0.04712174, 0, 1, 0.8980392, 1,
-0.06998743, -1.257463, -0.856109, 0, 1, 0.9058824, 1,
-0.06888492, 1.422936, -0.9407837, 0, 1, 0.9098039, 1,
-0.06771798, 0.9285905, -0.3748646, 0, 1, 0.9176471, 1,
-0.06625413, -0.5707333, -1.350197, 0, 1, 0.9215686, 1,
-0.06614282, 0.3534176, 0.2092826, 0, 1, 0.9294118, 1,
-0.06335022, -0.225493, -2.181178, 0, 1, 0.9333333, 1,
-0.0626133, -0.09701943, -2.285534, 0, 1, 0.9411765, 1,
-0.05901577, -0.3549813, -3.562438, 0, 1, 0.945098, 1,
-0.0590073, -0.8655078, -3.437018, 0, 1, 0.9529412, 1,
-0.05096288, -1.900057, -3.486598, 0, 1, 0.9568627, 1,
-0.04731988, -0.3353346, -2.018843, 0, 1, 0.9647059, 1,
-0.04416436, -1.202547, -3.002236, 0, 1, 0.9686275, 1,
-0.0441511, -0.4249237, -3.127605, 0, 1, 0.9764706, 1,
-0.04349885, 0.8713452, 0.4955414, 0, 1, 0.9803922, 1,
-0.03904848, 1.051095, 1.317094, 0, 1, 0.9882353, 1,
-0.03567591, -0.726631, -2.813766, 0, 1, 0.9921569, 1,
-0.03340145, -0.1377874, -2.260603, 0, 1, 1, 1,
-0.03251022, -1.061967, -2.961475, 0, 0.9921569, 1, 1,
-0.02781079, 1.17069, 1.304955, 0, 0.9882353, 1, 1,
-0.01863836, -0.321175, -4.020701, 0, 0.9803922, 1, 1,
-0.01828089, 2.324551, -0.8458573, 0, 0.9764706, 1, 1,
-0.01775635, -0.2887323, -3.126746, 0, 0.9686275, 1, 1,
-0.01764455, 1.594652, -0.2804431, 0, 0.9647059, 1, 1,
-0.009919183, 0.4457633, 0.1972563, 0, 0.9568627, 1, 1,
-0.009330081, -0.2833423, -3.728024, 0, 0.9529412, 1, 1,
0.005273551, -0.08355761, 1.923585, 0, 0.945098, 1, 1,
0.006380839, -0.4103171, 2.448742, 0, 0.9411765, 1, 1,
0.008236761, -0.02842091, 5.242087, 0, 0.9333333, 1, 1,
0.01108189, 0.6597196, 0.09132439, 0, 0.9294118, 1, 1,
0.01433542, 0.4281918, -2.317193, 0, 0.9215686, 1, 1,
0.01637585, 0.9893857, -0.1686055, 0, 0.9176471, 1, 1,
0.02305204, 0.7524671, 0.9873255, 0, 0.9098039, 1, 1,
0.02772902, 1.065527, -0.6607453, 0, 0.9058824, 1, 1,
0.03002317, 0.7845073, 0.3885176, 0, 0.8980392, 1, 1,
0.03473338, -0.9656956, 4.613312, 0, 0.8901961, 1, 1,
0.03704223, 0.8081082, 0.7045876, 0, 0.8862745, 1, 1,
0.03794058, 0.4463992, 0.5314101, 0, 0.8784314, 1, 1,
0.03956295, -0.8814086, 4.31729, 0, 0.8745098, 1, 1,
0.0409095, 0.02326839, 1.849231, 0, 0.8666667, 1, 1,
0.04195653, -1.034645, 3.640748, 0, 0.8627451, 1, 1,
0.04605492, -0.2274987, 4.131536, 0, 0.854902, 1, 1,
0.04620082, 0.08239818, 1.158906, 0, 0.8509804, 1, 1,
0.04663201, 1.356007, -1.879071, 0, 0.8431373, 1, 1,
0.04735641, 0.401412, 0.6585973, 0, 0.8392157, 1, 1,
0.04751171, 0.3646367, 1.030153, 0, 0.8313726, 1, 1,
0.04784399, -1.004351, 1.848069, 0, 0.827451, 1, 1,
0.05827496, -0.4012952, 1.943475, 0, 0.8196079, 1, 1,
0.05845658, -0.2689245, 4.116824, 0, 0.8156863, 1, 1,
0.06039768, -1.730481, 3.826615, 0, 0.8078431, 1, 1,
0.06110008, -0.4997808, 2.966777, 0, 0.8039216, 1, 1,
0.06254045, -0.9776422, 2.368024, 0, 0.7960784, 1, 1,
0.06787952, -0.6680461, 3.188524, 0, 0.7882353, 1, 1,
0.06890937, 0.4706459, -1.425858, 0, 0.7843137, 1, 1,
0.07048235, -0.2064447, 2.877399, 0, 0.7764706, 1, 1,
0.0711963, -0.6969838, 4.027407, 0, 0.772549, 1, 1,
0.07365397, -0.6229637, 1.972195, 0, 0.7647059, 1, 1,
0.07984471, -0.1058098, 3.125597, 0, 0.7607843, 1, 1,
0.08132477, -0.7281917, 5.310164, 0, 0.7529412, 1, 1,
0.08222587, 1.07915, 0.3417233, 0, 0.7490196, 1, 1,
0.08384056, -0.2807396, 2.25841, 0, 0.7411765, 1, 1,
0.08555536, -1.339583, 3.319454, 0, 0.7372549, 1, 1,
0.09603783, 0.5021453, -0.5944989, 0, 0.7294118, 1, 1,
0.09641191, 1.030184, -0.2605387, 0, 0.7254902, 1, 1,
0.09713744, 1.017257, 0.392391, 0, 0.7176471, 1, 1,
0.0975523, 0.7149851, 1.155315, 0, 0.7137255, 1, 1,
0.09966933, -2.266295, 4.014269, 0, 0.7058824, 1, 1,
0.1032091, -1.403156, 3.750176, 0, 0.6980392, 1, 1,
0.1080257, -0.9485127, 4.267821, 0, 0.6941177, 1, 1,
0.1099141, -1.439477, 4.302635, 0, 0.6862745, 1, 1,
0.117232, 0.7413521, -0.2541807, 0, 0.682353, 1, 1,
0.1191177, -0.1618995, 3.121717, 0, 0.6745098, 1, 1,
0.11933, -0.03061218, 0.9248216, 0, 0.6705883, 1, 1,
0.1225354, -0.908996, 2.954216, 0, 0.6627451, 1, 1,
0.1241126, -0.2135359, 4.522907, 0, 0.6588235, 1, 1,
0.1271129, 0.5858678, 0.6940101, 0, 0.6509804, 1, 1,
0.1362465, 0.4375, -0.03947544, 0, 0.6470588, 1, 1,
0.1373707, 1.314921, -0.2918398, 0, 0.6392157, 1, 1,
0.1395459, 0.2796041, 0.3369615, 0, 0.6352941, 1, 1,
0.1423151, 2.098183, -2.527495, 0, 0.627451, 1, 1,
0.1437006, -0.5255361, 4.238556, 0, 0.6235294, 1, 1,
0.1520784, 0.5543069, -0.1146938, 0, 0.6156863, 1, 1,
0.1527091, 2.320036, -0.6256426, 0, 0.6117647, 1, 1,
0.1569782, 1.226578, 0.3229281, 0, 0.6039216, 1, 1,
0.1574504, 0.02766978, 1.70836, 0, 0.5960785, 1, 1,
0.1577345, -1.139773, 5.823379, 0, 0.5921569, 1, 1,
0.1653939, 0.89389, 1.760478, 0, 0.5843138, 1, 1,
0.1654548, -0.5796025, 1.643523, 0, 0.5803922, 1, 1,
0.1656837, 0.1078091, 0.9276, 0, 0.572549, 1, 1,
0.1666235, -0.4870255, 0.2874199, 0, 0.5686275, 1, 1,
0.1673956, 1.987288, -0.3685942, 0, 0.5607843, 1, 1,
0.1694277, 1.205359, 0.9580597, 0, 0.5568628, 1, 1,
0.1709609, -1.131952, 3.399373, 0, 0.5490196, 1, 1,
0.1717508, 0.4653113, 0.02620416, 0, 0.5450981, 1, 1,
0.1763882, 0.8751429, -1.310213, 0, 0.5372549, 1, 1,
0.1763913, -0.9194291, 2.450811, 0, 0.5333334, 1, 1,
0.1801316, 0.9540172, -0.927266, 0, 0.5254902, 1, 1,
0.1853844, -0.8798471, 2.983973, 0, 0.5215687, 1, 1,
0.1883138, -1.740418, 2.331227, 0, 0.5137255, 1, 1,
0.1885624, -0.315831, 2.598122, 0, 0.509804, 1, 1,
0.1918085, 0.4134403, 1.550279, 0, 0.5019608, 1, 1,
0.2013179, -1.463498, 3.386947, 0, 0.4941176, 1, 1,
0.2072792, 0.1468936, -0.1728874, 0, 0.4901961, 1, 1,
0.2076069, 0.5466758, -1.229998, 0, 0.4823529, 1, 1,
0.2093083, -0.02329564, 1.248237, 0, 0.4784314, 1, 1,
0.2126487, -0.0487702, -0.6137124, 0, 0.4705882, 1, 1,
0.2154429, 1.03049, 0.2385594, 0, 0.4666667, 1, 1,
0.2154808, -0.6336775, 3.59039, 0, 0.4588235, 1, 1,
0.2216381, -0.4754923, 1.859597, 0, 0.454902, 1, 1,
0.2268359, -1.600276, 2.310505, 0, 0.4470588, 1, 1,
0.2270751, -1.31755, 2.939612, 0, 0.4431373, 1, 1,
0.2275745, -0.3446343, 2.146198, 0, 0.4352941, 1, 1,
0.2291903, 1.203744, 0.1612012, 0, 0.4313726, 1, 1,
0.2357252, 0.06864069, 3.454347, 0, 0.4235294, 1, 1,
0.2360306, 0.1154439, 0.3839057, 0, 0.4196078, 1, 1,
0.2370327, -0.3009448, 1.878503, 0, 0.4117647, 1, 1,
0.2390575, 0.9547047, -2.079777, 0, 0.4078431, 1, 1,
0.2414824, 0.1366877, 0.07271873, 0, 0.4, 1, 1,
0.2423163, -0.4384288, 1.475718, 0, 0.3921569, 1, 1,
0.2497809, 0.6695367, -0.4180943, 0, 0.3882353, 1, 1,
0.258995, 0.809275, 1.592519, 0, 0.3803922, 1, 1,
0.262012, 1.002116, -0.3813893, 0, 0.3764706, 1, 1,
0.2625836, 0.516506, -0.45623, 0, 0.3686275, 1, 1,
0.2658452, 0.3333386, 1.22287, 0, 0.3647059, 1, 1,
0.2713077, -0.1444112, 3.184268, 0, 0.3568628, 1, 1,
0.2718355, 0.7617813, -0.7500994, 0, 0.3529412, 1, 1,
0.2724775, -1.834808, 2.221318, 0, 0.345098, 1, 1,
0.2727264, -0.1175288, 0.7291659, 0, 0.3411765, 1, 1,
0.2734177, 0.1352802, 0.4787601, 0, 0.3333333, 1, 1,
0.2765034, -0.4635469, 0.9623636, 0, 0.3294118, 1, 1,
0.2784653, -1.70435, 2.290954, 0, 0.3215686, 1, 1,
0.2796275, 1.132862, 0.1649375, 0, 0.3176471, 1, 1,
0.2815832, -0.5000948, 1.591487, 0, 0.3098039, 1, 1,
0.2859675, -0.801747, 3.80311, 0, 0.3058824, 1, 1,
0.2915653, 2.81517, -0.4837828, 0, 0.2980392, 1, 1,
0.2975691, 0.8884581, 2.054824, 0, 0.2901961, 1, 1,
0.2986634, -0.4477986, 2.548558, 0, 0.2862745, 1, 1,
0.2990845, 0.6555509, -0.8406415, 0, 0.2784314, 1, 1,
0.2998765, -0.2851152, 3.127933, 0, 0.2745098, 1, 1,
0.3022339, 0.2934689, 0.6785018, 0, 0.2666667, 1, 1,
0.302327, -0.9834207, 2.575509, 0, 0.2627451, 1, 1,
0.3023595, 0.8631725, 1.322795, 0, 0.254902, 1, 1,
0.3027321, -0.8817146, 3.92443, 0, 0.2509804, 1, 1,
0.3067683, -0.9419256, 1.650566, 0, 0.2431373, 1, 1,
0.3083594, -0.592293, 0.5880637, 0, 0.2392157, 1, 1,
0.3121296, -0.3653925, 1.084648, 0, 0.2313726, 1, 1,
0.3132389, 0.4078818, 1.324856, 0, 0.227451, 1, 1,
0.3137118, 0.8248065, 0.9368528, 0, 0.2196078, 1, 1,
0.3143163, 1.952363, -0.9070947, 0, 0.2156863, 1, 1,
0.3158145, -0.1069012, 3.164799, 0, 0.2078431, 1, 1,
0.3196376, -1.183673, 2.682999, 0, 0.2039216, 1, 1,
0.3210907, -0.3274032, 1.842201, 0, 0.1960784, 1, 1,
0.3244889, -2.038511, 3.844692, 0, 0.1882353, 1, 1,
0.3259614, -0.1162602, 2.227321, 0, 0.1843137, 1, 1,
0.3269337, 0.1234967, 1.372923, 0, 0.1764706, 1, 1,
0.3298205, 1.650294, 0.8783597, 0, 0.172549, 1, 1,
0.3362962, 1.175707, -0.1060358, 0, 0.1647059, 1, 1,
0.3382924, -0.3841614, 3.152163, 0, 0.1607843, 1, 1,
0.3419296, 1.462008, 0.1440761, 0, 0.1529412, 1, 1,
0.3480206, 0.2480385, 0.03350607, 0, 0.1490196, 1, 1,
0.3481574, -1.158621, 3.072444, 0, 0.1411765, 1, 1,
0.3491194, 0.002348582, -0.1031674, 0, 0.1372549, 1, 1,
0.3516935, 0.8134224, 1.013593, 0, 0.1294118, 1, 1,
0.3517964, 0.6277099, 0.4662384, 0, 0.1254902, 1, 1,
0.3623026, 2.011733, 2.143255, 0, 0.1176471, 1, 1,
0.3624748, -0.2133421, 2.55988, 0, 0.1137255, 1, 1,
0.3694285, -0.08830509, 1.741301, 0, 0.1058824, 1, 1,
0.3806756, 1.413633, 0.9090651, 0, 0.09803922, 1, 1,
0.3811484, -0.659656, 4.373447, 0, 0.09411765, 1, 1,
0.3815725, -0.7815774, 3.343889, 0, 0.08627451, 1, 1,
0.3827784, 1.925504, 0.5623608, 0, 0.08235294, 1, 1,
0.3831534, -0.02885001, 1.789547, 0, 0.07450981, 1, 1,
0.3852385, 0.2768738, 0.2699226, 0, 0.07058824, 1, 1,
0.3886615, 0.1110136, 0.935035, 0, 0.0627451, 1, 1,
0.3903103, -0.921493, 2.342232, 0, 0.05882353, 1, 1,
0.3990191, 1.09636, -0.5540562, 0, 0.05098039, 1, 1,
0.4065353, -1.047137, 2.146836, 0, 0.04705882, 1, 1,
0.4075227, 0.6858529, 0.5554279, 0, 0.03921569, 1, 1,
0.4201797, -0.697596, 2.747289, 0, 0.03529412, 1, 1,
0.42255, -1.561643, 2.893374, 0, 0.02745098, 1, 1,
0.4238415, -0.05404658, 0.7220813, 0, 0.02352941, 1, 1,
0.4252903, 0.5214086, 0.2354074, 0, 0.01568628, 1, 1,
0.4293528, -0.1856593, 2.149554, 0, 0.01176471, 1, 1,
0.4310411, 0.1832021, 0.5703043, 0, 0.003921569, 1, 1,
0.4325896, -0.07699642, 1.211131, 0.003921569, 0, 1, 1,
0.433153, 0.4940445, 0.7150099, 0.007843138, 0, 1, 1,
0.4353527, 0.2793404, 0.6944603, 0.01568628, 0, 1, 1,
0.43565, 0.2625064, -0.2990935, 0.01960784, 0, 1, 1,
0.4369467, -1.037107, 2.302514, 0.02745098, 0, 1, 1,
0.4404579, -2.632125, 2.59813, 0.03137255, 0, 1, 1,
0.4435218, -0.4719876, 1.295067, 0.03921569, 0, 1, 1,
0.4502525, -0.570502, 3.455986, 0.04313726, 0, 1, 1,
0.4519689, -0.8953318, 3.028119, 0.05098039, 0, 1, 1,
0.4521538, 0.5737821, 1.15179, 0.05490196, 0, 1, 1,
0.4552379, 1.109505, 1.154513, 0.0627451, 0, 1, 1,
0.4604917, -0.3333192, 3.029043, 0.06666667, 0, 1, 1,
0.4606213, -0.7576429, 1.388498, 0.07450981, 0, 1, 1,
0.4608308, -0.3965081, 2.15247, 0.07843138, 0, 1, 1,
0.4631233, -0.7194875, 1.28242, 0.08627451, 0, 1, 1,
0.4691033, -0.02981187, -0.04739211, 0.09019608, 0, 1, 1,
0.4691861, 0.8891305, -0.07901795, 0.09803922, 0, 1, 1,
0.4693599, -1.185209, 1.4363, 0.1058824, 0, 1, 1,
0.4739484, -0.4458129, 1.535307, 0.1098039, 0, 1, 1,
0.479826, 1.922436, -0.3317288, 0.1176471, 0, 1, 1,
0.4801224, -1.246778, 3.217825, 0.1215686, 0, 1, 1,
0.4817835, -0.003920202, 1.544835, 0.1294118, 0, 1, 1,
0.4853348, 1.64252, 1.034004, 0.1333333, 0, 1, 1,
0.4868153, 2.438662, 0.4972535, 0.1411765, 0, 1, 1,
0.4875865, -2.824444, 4.076763, 0.145098, 0, 1, 1,
0.489668, -0.4189085, 4.668987, 0.1529412, 0, 1, 1,
0.4923166, 0.5187343, 0.2114958, 0.1568628, 0, 1, 1,
0.4941939, -0.6103573, 2.588825, 0.1647059, 0, 1, 1,
0.4979413, -0.9999252, 2.655021, 0.1686275, 0, 1, 1,
0.4998563, 0.837584, 1.783556, 0.1764706, 0, 1, 1,
0.504685, 0.3717008, 1.567654, 0.1803922, 0, 1, 1,
0.5066904, -1.000743, 3.006849, 0.1882353, 0, 1, 1,
0.5067242, -0.7712381, 2.577278, 0.1921569, 0, 1, 1,
0.5109262, 0.6959944, 0.7957685, 0.2, 0, 1, 1,
0.5126148, 1.273614, 0.2178957, 0.2078431, 0, 1, 1,
0.518728, 0.105303, 1.693389, 0.2117647, 0, 1, 1,
0.5200869, 0.07237531, 0.8005875, 0.2196078, 0, 1, 1,
0.528414, 0.07114068, 0.05942953, 0.2235294, 0, 1, 1,
0.5313758, -2.030799, 3.88118, 0.2313726, 0, 1, 1,
0.5316702, -0.5525073, 3.167756, 0.2352941, 0, 1, 1,
0.5365943, 0.5156356, 1.162711, 0.2431373, 0, 1, 1,
0.5417286, -1.213887, 2.202972, 0.2470588, 0, 1, 1,
0.5424936, 0.03072792, 2.011002, 0.254902, 0, 1, 1,
0.5443453, 0.4102219, 1.557442, 0.2588235, 0, 1, 1,
0.5488312, -0.04997022, 4.345003, 0.2666667, 0, 1, 1,
0.5506057, -0.9672433, 2.146022, 0.2705882, 0, 1, 1,
0.5527439, -0.08105967, 1.980461, 0.2784314, 0, 1, 1,
0.5527542, 0.0661926, 0.8782548, 0.282353, 0, 1, 1,
0.5541652, -0.1138492, 2.488612, 0.2901961, 0, 1, 1,
0.5593746, 0.3958884, -0.6624802, 0.2941177, 0, 1, 1,
0.5606227, -0.7835048, 2.453753, 0.3019608, 0, 1, 1,
0.5620067, 0.4718252, 0.477431, 0.3098039, 0, 1, 1,
0.5631543, -0.9463738, 3.336522, 0.3137255, 0, 1, 1,
0.564845, 1.573195, 0.09239475, 0.3215686, 0, 1, 1,
0.5674039, 0.8291223, -0.2293595, 0.3254902, 0, 1, 1,
0.5682641, -0.7004576, 2.75673, 0.3333333, 0, 1, 1,
0.5683822, -0.0260776, 0.6433306, 0.3372549, 0, 1, 1,
0.5705276, -1.440962, -0.03942948, 0.345098, 0, 1, 1,
0.5715281, 0.1203413, 0.5863172, 0.3490196, 0, 1, 1,
0.5719954, 0.2485504, -0.6002157, 0.3568628, 0, 1, 1,
0.5720145, 1.127887, -1.568252, 0.3607843, 0, 1, 1,
0.5724421, 1.371243, 0.46243, 0.3686275, 0, 1, 1,
0.5750234, -0.2093713, 2.627731, 0.372549, 0, 1, 1,
0.5790371, 0.2808865, 1.782403, 0.3803922, 0, 1, 1,
0.5819418, -0.06573837, 0.2411717, 0.3843137, 0, 1, 1,
0.5860121, 1.509184, 0.5927159, 0.3921569, 0, 1, 1,
0.5862596, -0.2068673, 3.285356, 0.3960784, 0, 1, 1,
0.5877225, -0.0946762, 0.3581244, 0.4039216, 0, 1, 1,
0.5889964, -0.01262934, 1.788566, 0.4117647, 0, 1, 1,
0.590607, -0.2891414, 1.499081, 0.4156863, 0, 1, 1,
0.5914405, -1.256758, 4.183646, 0.4235294, 0, 1, 1,
0.5974222, 0.1526815, 1.244277, 0.427451, 0, 1, 1,
0.6005393, 1.36777, -2.183686, 0.4352941, 0, 1, 1,
0.601788, -0.8480026, 2.312407, 0.4392157, 0, 1, 1,
0.6036118, -1.209824, 4.479216, 0.4470588, 0, 1, 1,
0.606034, 1.052868, 1.984363, 0.4509804, 0, 1, 1,
0.6160849, 0.8028765, 2.409429, 0.4588235, 0, 1, 1,
0.6467704, 0.7210323, 1.592301, 0.4627451, 0, 1, 1,
0.6488007, 1.298063, 1.719848, 0.4705882, 0, 1, 1,
0.6569936, 0.6356907, 0.2026569, 0.4745098, 0, 1, 1,
0.6610969, -0.1288916, 2.005835, 0.4823529, 0, 1, 1,
0.6612744, -0.88858, 2.864272, 0.4862745, 0, 1, 1,
0.6628866, -0.6854966, 0.7566436, 0.4941176, 0, 1, 1,
0.6807598, 0.3792391, -0.944714, 0.5019608, 0, 1, 1,
0.6813378, -0.01216705, 1.886555, 0.5058824, 0, 1, 1,
0.6816405, 1.162858, 2.053156, 0.5137255, 0, 1, 1,
0.6823042, -0.3980709, 2.881839, 0.5176471, 0, 1, 1,
0.6865387, -0.8853855, 1.294807, 0.5254902, 0, 1, 1,
0.6900063, 0.6534733, 0.5946988, 0.5294118, 0, 1, 1,
0.6903483, 0.6045754, 0.4320792, 0.5372549, 0, 1, 1,
0.6959251, -0.9915581, 2.53399, 0.5411765, 0, 1, 1,
0.6981996, -0.5555563, 0.9885292, 0.5490196, 0, 1, 1,
0.700857, 0.6741997, 0.8010504, 0.5529412, 0, 1, 1,
0.702165, -1.704371, 2.521377, 0.5607843, 0, 1, 1,
0.7068833, 1.430392, 0.3040673, 0.5647059, 0, 1, 1,
0.708204, 1.936168, 1.258408, 0.572549, 0, 1, 1,
0.7086887, -0.895995, 2.983309, 0.5764706, 0, 1, 1,
0.7116963, -0.8254644, 1.813483, 0.5843138, 0, 1, 1,
0.7133827, -1.309593, 3.3155, 0.5882353, 0, 1, 1,
0.7149886, -0.58836, 1.228973, 0.5960785, 0, 1, 1,
0.7182856, -0.9704127, 3.937885, 0.6039216, 0, 1, 1,
0.7207059, -0.126761, 2.437679, 0.6078432, 0, 1, 1,
0.723372, -0.5855021, 0.5083113, 0.6156863, 0, 1, 1,
0.7260643, -1.263134, 3.830321, 0.6196079, 0, 1, 1,
0.7266712, 0.8088926, 0.7393218, 0.627451, 0, 1, 1,
0.7276372, -0.4960475, 2.067121, 0.6313726, 0, 1, 1,
0.7282, 0.4514419, -0.4451628, 0.6392157, 0, 1, 1,
0.7284186, 0.2761191, 1.596455, 0.6431373, 0, 1, 1,
0.7300904, 1.012139, 0.1631164, 0.6509804, 0, 1, 1,
0.7308385, 1.36612, 1.60714, 0.654902, 0, 1, 1,
0.7315016, -0.3657599, 3.032395, 0.6627451, 0, 1, 1,
0.7329698, 0.1564406, -0.1441927, 0.6666667, 0, 1, 1,
0.7338973, -1.849692, 3.828135, 0.6745098, 0, 1, 1,
0.7363012, -0.2557296, 2.390375, 0.6784314, 0, 1, 1,
0.7396537, 0.1800947, 1.126964, 0.6862745, 0, 1, 1,
0.7410596, -0.008985708, 1.261368, 0.6901961, 0, 1, 1,
0.7426518, -0.6143457, 3.484297, 0.6980392, 0, 1, 1,
0.7506688, -0.2893521, 1.363487, 0.7058824, 0, 1, 1,
0.7598835, -0.2965848, 1.584005, 0.7098039, 0, 1, 1,
0.7646693, 0.240503, 2.699074, 0.7176471, 0, 1, 1,
0.7656201, -0.8318236, 4.831169, 0.7215686, 0, 1, 1,
0.7670299, 0.7510933, -0.2690028, 0.7294118, 0, 1, 1,
0.7692146, 1.857218, 0.4098715, 0.7333333, 0, 1, 1,
0.7717103, 0.4649016, -0.09023467, 0.7411765, 0, 1, 1,
0.7778175, -0.245687, 1.407014, 0.7450981, 0, 1, 1,
0.7805411, -0.07095422, 1.468992, 0.7529412, 0, 1, 1,
0.7818303, -1.172986, 1.014118, 0.7568628, 0, 1, 1,
0.7852598, -0.06541323, 1.315311, 0.7647059, 0, 1, 1,
0.7948735, 0.03114804, 3.675529, 0.7686275, 0, 1, 1,
0.8024972, -1.191426, 1.93426, 0.7764706, 0, 1, 1,
0.8066064, 1.482375, 0.6060652, 0.7803922, 0, 1, 1,
0.8066114, 0.7927517, -0.3766924, 0.7882353, 0, 1, 1,
0.8088594, 0.02654699, 1.164071, 0.7921569, 0, 1, 1,
0.81048, 0.1716641, 1.149578, 0.8, 0, 1, 1,
0.8139144, 1.454698, 2.879092, 0.8078431, 0, 1, 1,
0.8140059, 1.928684, 0.5433857, 0.8117647, 0, 1, 1,
0.8171571, -0.007268656, 1.692246, 0.8196079, 0, 1, 1,
0.820019, -0.2325413, 1.232883, 0.8235294, 0, 1, 1,
0.8204727, 0.02657695, 0.07942736, 0.8313726, 0, 1, 1,
0.8231254, -2.28341, 2.236023, 0.8352941, 0, 1, 1,
0.824461, -0.4480998, 3.042657, 0.8431373, 0, 1, 1,
0.8260725, 1.00361, 1.619164, 0.8470588, 0, 1, 1,
0.8295979, -0.476081, 0.993638, 0.854902, 0, 1, 1,
0.8311342, -0.02922719, 0.4064699, 0.8588235, 0, 1, 1,
0.8313739, -0.2448795, 1.198986, 0.8666667, 0, 1, 1,
0.8339052, 1.141567, 0.2458329, 0.8705882, 0, 1, 1,
0.8342497, -1.661485, 2.570901, 0.8784314, 0, 1, 1,
0.836868, 1.548637, 1.280013, 0.8823529, 0, 1, 1,
0.8472772, 1.100147, -0.8012577, 0.8901961, 0, 1, 1,
0.8494975, -2.623498, 2.229048, 0.8941177, 0, 1, 1,
0.8512293, -0.3346376, 1.101817, 0.9019608, 0, 1, 1,
0.8741478, 0.6878793, -0.6083576, 0.9098039, 0, 1, 1,
0.8759245, -0.5786357, 2.518882, 0.9137255, 0, 1, 1,
0.8805692, -1.310539, 2.18149, 0.9215686, 0, 1, 1,
0.8851227, -2.034071, 2.676939, 0.9254902, 0, 1, 1,
0.8883486, 0.8259749, 3.437572, 0.9333333, 0, 1, 1,
0.8885954, -0.5681903, 2.434985, 0.9372549, 0, 1, 1,
0.8932696, 0.6697214, 1.154994, 0.945098, 0, 1, 1,
0.8944546, -0.6415634, 3.436063, 0.9490196, 0, 1, 1,
0.9022799, -1.146651, 1.947449, 0.9568627, 0, 1, 1,
0.9023917, -1.295641, 3.761132, 0.9607843, 0, 1, 1,
0.9056434, -0.1105002, 0.6703101, 0.9686275, 0, 1, 1,
0.9078487, -0.04478734, 1.104534, 0.972549, 0, 1, 1,
0.9381468, 0.2214308, 1.625543, 0.9803922, 0, 1, 1,
0.9471908, 0.3229978, 1.58467, 0.9843137, 0, 1, 1,
0.9476941, 0.130175, 3.017672, 0.9921569, 0, 1, 1,
0.9496807, 0.4801668, -0.4599377, 0.9960784, 0, 1, 1,
0.9548279, 0.3545835, 2.883354, 1, 0, 0.9960784, 1,
0.9586021, -0.08922865, 2.506816, 1, 0, 0.9882353, 1,
0.9589865, -1.274644, 3.994747, 1, 0, 0.9843137, 1,
0.9592469, -1.849603, 3.363976, 1, 0, 0.9764706, 1,
0.960789, -0.8266348, 2.580283, 1, 0, 0.972549, 1,
0.9638942, -1.266457, 5.022452, 1, 0, 0.9647059, 1,
0.9686345, -0.8596982, 0.341421, 1, 0, 0.9607843, 1,
0.9716018, 1.624224, -0.1483959, 1, 0, 0.9529412, 1,
0.9738891, 0.4948538, 1.442369, 1, 0, 0.9490196, 1,
0.9745589, -1.143419, 1.169925, 1, 0, 0.9411765, 1,
0.9824847, 1.00879, 1.71597, 1, 0, 0.9372549, 1,
0.985889, -0.1554565, 2.220865, 1, 0, 0.9294118, 1,
0.9865016, 1.414933, 2.239342, 1, 0, 0.9254902, 1,
0.991933, 0.795019, 1.855645, 1, 0, 0.9176471, 1,
0.9920193, 1.4395, 0.844097, 1, 0, 0.9137255, 1,
1.003376, 0.3125751, 2.326233, 1, 0, 0.9058824, 1,
1.008871, 1.626518, -0.5844672, 1, 0, 0.9019608, 1,
1.010449, -1.104723, 2.005505, 1, 0, 0.8941177, 1,
1.011755, -1.394201, 3.61748, 1, 0, 0.8862745, 1,
1.025522, 1.965074, 1.216923, 1, 0, 0.8823529, 1,
1.028964, -0.04677335, 1.677401, 1, 0, 0.8745098, 1,
1.034923, 0.25567, -0.2564758, 1, 0, 0.8705882, 1,
1.036109, -1.088897, 1.449668, 1, 0, 0.8627451, 1,
1.036983, -1.404509, 3.170171, 1, 0, 0.8588235, 1,
1.042291, 1.570618, 0.4574363, 1, 0, 0.8509804, 1,
1.046517, -1.158918, 3.113043, 1, 0, 0.8470588, 1,
1.049433, 1.135654, 0.4463974, 1, 0, 0.8392157, 1,
1.061397, 0.804085, 0.6564894, 1, 0, 0.8352941, 1,
1.064012, 1.806161, 0.6436833, 1, 0, 0.827451, 1,
1.076295, -1.018938, 1.946185, 1, 0, 0.8235294, 1,
1.079808, -0.143693, 2.427423, 1, 0, 0.8156863, 1,
1.082842, 0.8021941, 0.605399, 1, 0, 0.8117647, 1,
1.094375, 0.6353718, 2.543766, 1, 0, 0.8039216, 1,
1.100219, -0.1111441, 2.506055, 1, 0, 0.7960784, 1,
1.100974, 0.8217306, 1.546604, 1, 0, 0.7921569, 1,
1.106172, -0.397072, 1.655506, 1, 0, 0.7843137, 1,
1.106775, 1.155754, 1.341411, 1, 0, 0.7803922, 1,
1.107961, 0.04427308, 1.887583, 1, 0, 0.772549, 1,
1.126842, 0.1275184, 2.655574, 1, 0, 0.7686275, 1,
1.130599, 0.08531491, 3.338093, 1, 0, 0.7607843, 1,
1.132258, -0.005365493, 3.276488, 1, 0, 0.7568628, 1,
1.136479, 1.717814, 1.644677, 1, 0, 0.7490196, 1,
1.137474, 1.148639, 0.01933778, 1, 0, 0.7450981, 1,
1.138243, -0.9358227, 3.625282, 1, 0, 0.7372549, 1,
1.152956, -1.166618, 2.404128, 1, 0, 0.7333333, 1,
1.154249, 0.2757106, 1.044586, 1, 0, 0.7254902, 1,
1.154319, 1.518973, 1.133796, 1, 0, 0.7215686, 1,
1.166011, -0.5427544, 3.485151, 1, 0, 0.7137255, 1,
1.16723, -0.703393, 2.892501, 1, 0, 0.7098039, 1,
1.184561, -0.1222296, 2.267188, 1, 0, 0.7019608, 1,
1.195318, 0.7129154, -0.7858713, 1, 0, 0.6941177, 1,
1.19564, -0.4590048, 0.2047644, 1, 0, 0.6901961, 1,
1.201215, -2.356929, 3.009275, 1, 0, 0.682353, 1,
1.202301, 1.191491, -0.649663, 1, 0, 0.6784314, 1,
1.209676, -0.1961347, 0.5513328, 1, 0, 0.6705883, 1,
1.213729, -0.1269513, 0.326937, 1, 0, 0.6666667, 1,
1.223504, 1.060652, 1.16961, 1, 0, 0.6588235, 1,
1.229153, 0.6770835, 0.7943928, 1, 0, 0.654902, 1,
1.248341, -0.3928293, 1.450747, 1, 0, 0.6470588, 1,
1.250096, -0.9950463, 2.186195, 1, 0, 0.6431373, 1,
1.250996, -0.3043366, 0.7250958, 1, 0, 0.6352941, 1,
1.25108, 0.0749773, 1.168832, 1, 0, 0.6313726, 1,
1.25196, -0.1790956, 3.608487, 1, 0, 0.6235294, 1,
1.253175, 0.2513096, 1.801368, 1, 0, 0.6196079, 1,
1.25778, -1.223012, 1.528632, 1, 0, 0.6117647, 1,
1.280952, 0.9772765, -0.6686271, 1, 0, 0.6078432, 1,
1.287578, 1.241147, 0.8231375, 1, 0, 0.6, 1,
1.288003, -1.609294, 2.392597, 1, 0, 0.5921569, 1,
1.301882, 0.4802961, 3.049238, 1, 0, 0.5882353, 1,
1.31984, -0.2082807, 1.424096, 1, 0, 0.5803922, 1,
1.325705, -0.8020082, 3.004644, 1, 0, 0.5764706, 1,
1.336359, 0.05335043, 0.5037879, 1, 0, 0.5686275, 1,
1.338646, 1.025252, 0.5113249, 1, 0, 0.5647059, 1,
1.33995, -1.189333, 0.7791864, 1, 0, 0.5568628, 1,
1.342297, -0.9224153, 1.635791, 1, 0, 0.5529412, 1,
1.346828, -0.9589866, 2.917852, 1, 0, 0.5450981, 1,
1.355573, 0.2476591, 1.460831, 1, 0, 0.5411765, 1,
1.35929, -0.2641055, 2.701002, 1, 0, 0.5333334, 1,
1.375365, -1.024688, 1.755438, 1, 0, 0.5294118, 1,
1.383232, 1.280545, 1.528804, 1, 0, 0.5215687, 1,
1.388502, 0.1564966, 0.984561, 1, 0, 0.5176471, 1,
1.393565, 1.266665, -0.4778027, 1, 0, 0.509804, 1,
1.395625, 1.243469, -1.631214, 1, 0, 0.5058824, 1,
1.408868, 0.5164629, 1.339348, 1, 0, 0.4980392, 1,
1.410232, -0.6420478, 1.997854, 1, 0, 0.4901961, 1,
1.412748, 0.7519407, 0.3568762, 1, 0, 0.4862745, 1,
1.413022, 1.135869, 0.6588452, 1, 0, 0.4784314, 1,
1.414626, 0.7767671, 2.509567, 1, 0, 0.4745098, 1,
1.426046, 0.7605919, 1.865271, 1, 0, 0.4666667, 1,
1.428056, 0.6248797, -0.9742179, 1, 0, 0.4627451, 1,
1.430483, -0.6559173, 3.669614, 1, 0, 0.454902, 1,
1.435251, -2.627, 3.02277, 1, 0, 0.4509804, 1,
1.439423, -0.8315945, 1.671326, 1, 0, 0.4431373, 1,
1.44096, 1.306284, 1.820925, 1, 0, 0.4392157, 1,
1.441813, 0.1543705, 1.283163, 1, 0, 0.4313726, 1,
1.448169, 1.032116, 1.49434, 1, 0, 0.427451, 1,
1.460212, -0.1963488, 1.64172, 1, 0, 0.4196078, 1,
1.471671, -0.3403907, 0.1029269, 1, 0, 0.4156863, 1,
1.472882, -1.035869, 3.309212, 1, 0, 0.4078431, 1,
1.477781, 0.7371984, 3.543407, 1, 0, 0.4039216, 1,
1.479137, 1.617667, 1.037124, 1, 0, 0.3960784, 1,
1.484281, -0.1492981, 1.963735, 1, 0, 0.3882353, 1,
1.486902, -2.289105, 2.79882, 1, 0, 0.3843137, 1,
1.508695, -0.2904225, 1.272604, 1, 0, 0.3764706, 1,
1.524725, 0.9951416, 2.566653, 1, 0, 0.372549, 1,
1.531268, -0.6403757, 3.293543, 1, 0, 0.3647059, 1,
1.533387, 0.6672502, 1.04302, 1, 0, 0.3607843, 1,
1.534623, 0.6955121, 1.296139, 1, 0, 0.3529412, 1,
1.54186, -1.34258, 2.095336, 1, 0, 0.3490196, 1,
1.547493, 1.038962, 1.244777, 1, 0, 0.3411765, 1,
1.550325, 0.1047282, 2.269342, 1, 0, 0.3372549, 1,
1.564013, 1.29684, -0.1985502, 1, 0, 0.3294118, 1,
1.594472, -0.2667862, 2.128368, 1, 0, 0.3254902, 1,
1.597545, 0.9265741, 1.056477, 1, 0, 0.3176471, 1,
1.597797, -0.7551348, 0.2699887, 1, 0, 0.3137255, 1,
1.598249, -0.06434087, 2.206201, 1, 0, 0.3058824, 1,
1.61043, 0.8497292, 1.890125, 1, 0, 0.2980392, 1,
1.621925, -0.1814563, 0.09855001, 1, 0, 0.2941177, 1,
1.635472, -0.08695875, 1.053158, 1, 0, 0.2862745, 1,
1.643725, -1.623017, 2.36038, 1, 0, 0.282353, 1,
1.654813, 0.1220892, 0.6972708, 1, 0, 0.2745098, 1,
1.665174, -0.2564856, 2.310676, 1, 0, 0.2705882, 1,
1.686534, -1.079887, 2.808511, 1, 0, 0.2627451, 1,
1.712535, 0.3032477, 0.910491, 1, 0, 0.2588235, 1,
1.7194, -1.297544, 1.679783, 1, 0, 0.2509804, 1,
1.752098, 0.3778642, 3.006361, 1, 0, 0.2470588, 1,
1.770398, 1.732979, 0.8990337, 1, 0, 0.2392157, 1,
1.77558, 0.8210085, 0.3246489, 1, 0, 0.2352941, 1,
1.776408, 1.067752, 3.053091, 1, 0, 0.227451, 1,
1.816979, 1.318477, 1.117575, 1, 0, 0.2235294, 1,
1.836485, 0.05540859, 1.875213, 1, 0, 0.2156863, 1,
1.838489, 1.537997, 0.3748247, 1, 0, 0.2117647, 1,
1.850918, 0.420513, 0.7782381, 1, 0, 0.2039216, 1,
1.851516, 0.3750103, 1.646508, 1, 0, 0.1960784, 1,
1.860816, 2.495875, 1.033413, 1, 0, 0.1921569, 1,
1.86137, 2.282452, 1.718027, 1, 0, 0.1843137, 1,
1.880522, 1.010624, 2.356043, 1, 0, 0.1803922, 1,
1.88562, -0.6709384, 2.307851, 1, 0, 0.172549, 1,
1.88589, 1.602487, -1.293904, 1, 0, 0.1686275, 1,
1.891708, -0.01844263, 1.440939, 1, 0, 0.1607843, 1,
1.892584, 0.6448287, 1.393643, 1, 0, 0.1568628, 1,
1.930344, -0.2267701, 0.7243458, 1, 0, 0.1490196, 1,
1.99795, 0.1081746, 0.4956297, 1, 0, 0.145098, 1,
2.018525, -0.773056, 0.265093, 1, 0, 0.1372549, 1,
2.033526, 0.1947328, 1.654675, 1, 0, 0.1333333, 1,
2.0526, 0.8192868, 0.9388365, 1, 0, 0.1254902, 1,
2.120375, -1.376261, 1.177145, 1, 0, 0.1215686, 1,
2.155164, -1.27254, 3.66561, 1, 0, 0.1137255, 1,
2.173153, 0.1795074, 3.491824, 1, 0, 0.1098039, 1,
2.17839, -0.2683307, 1.516443, 1, 0, 0.1019608, 1,
2.179517, 0.4221746, -0.7338026, 1, 0, 0.09411765, 1,
2.252524, 0.9742701, 0.8330455, 1, 0, 0.09019608, 1,
2.255171, -1.599733, 0.5653502, 1, 0, 0.08235294, 1,
2.283667, -1.252676, 2.627424, 1, 0, 0.07843138, 1,
2.314159, 1.442849, 1.476778, 1, 0, 0.07058824, 1,
2.318998, -0.8684158, 0.615706, 1, 0, 0.06666667, 1,
2.323669, -0.4499151, 1.519714, 1, 0, 0.05882353, 1,
2.341678, 0.7225953, 1.301477, 1, 0, 0.05490196, 1,
2.481468, 0.3383408, 0.3841088, 1, 0, 0.04705882, 1,
2.489026, 0.2311742, 1.510944, 1, 0, 0.04313726, 1,
2.592681, 0.6936874, 1.039092, 1, 0, 0.03529412, 1,
2.605988, -0.2030762, 2.171897, 1, 0, 0.03137255, 1,
2.682081, 0.1657661, 1.731376, 1, 0, 0.02352941, 1,
2.73001, -0.5210658, 1.70551, 1, 0, 0.01960784, 1,
2.790597, 0.9775947, 0.2756414, 1, 0, 0.01176471, 1,
2.943202, 1.208377, 0.7572748, 1, 0, 0.007843138, 1
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
-0.100884, -3.809153, -6.63874, 0, -0.5, 0.5, 0.5,
-0.100884, -3.809153, -6.63874, 1, -0.5, 0.5, 0.5,
-0.100884, -3.809153, -6.63874, 1, 1.5, 0.5, 0.5,
-0.100884, -3.809153, -6.63874, 0, 1.5, 0.5, 0.5
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
-4.176915, 0.02875221, -6.63874, 0, -0.5, 0.5, 0.5,
-4.176915, 0.02875221, -6.63874, 1, -0.5, 0.5, 0.5,
-4.176915, 0.02875221, -6.63874, 1, 1.5, 0.5, 0.5,
-4.176915, 0.02875221, -6.63874, 0, 1.5, 0.5, 0.5
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
-4.176915, -3.809153, 0.49541, 0, -0.5, 0.5, 0.5,
-4.176915, -3.809153, 0.49541, 1, -0.5, 0.5, 0.5,
-4.176915, -3.809153, 0.49541, 1, 1.5, 0.5, 0.5,
-4.176915, -3.809153, 0.49541, 0, 1.5, 0.5, 0.5
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
-3, -2.923483, -4.992398,
2, -2.923483, -4.992398,
-3, -2.923483, -4.992398,
-3, -3.071095, -5.266788,
-2, -2.923483, -4.992398,
-2, -3.071095, -5.266788,
-1, -2.923483, -4.992398,
-1, -3.071095, -5.266788,
0, -2.923483, -4.992398,
0, -3.071095, -5.266788,
1, -2.923483, -4.992398,
1, -3.071095, -5.266788,
2, -2.923483, -4.992398,
2, -3.071095, -5.266788
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
-3, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
-3, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
-3, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
-3, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5,
-2, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
-2, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
-2, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
-2, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5,
-1, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
-1, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
-1, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
-1, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5,
0, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
0, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
0, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
0, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5,
1, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
1, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
1, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
1, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5,
2, -3.366318, -5.815569, 0, -0.5, 0.5, 0.5,
2, -3.366318, -5.815569, 1, -0.5, 0.5, 0.5,
2, -3.366318, -5.815569, 1, 1.5, 0.5, 0.5,
2, -3.366318, -5.815569, 0, 1.5, 0.5, 0.5
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
-3.236293, -2, -4.992398,
-3.236293, 2, -4.992398,
-3.236293, -2, -4.992398,
-3.393063, -2, -5.266788,
-3.236293, -1, -4.992398,
-3.393063, -1, -5.266788,
-3.236293, 0, -4.992398,
-3.393063, 0, -5.266788,
-3.236293, 1, -4.992398,
-3.393063, 1, -5.266788,
-3.236293, 2, -4.992398,
-3.393063, 2, -5.266788
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
-3.706604, -2, -5.815569, 0, -0.5, 0.5, 0.5,
-3.706604, -2, -5.815569, 1, -0.5, 0.5, 0.5,
-3.706604, -2, -5.815569, 1, 1.5, 0.5, 0.5,
-3.706604, -2, -5.815569, 0, 1.5, 0.5, 0.5,
-3.706604, -1, -5.815569, 0, -0.5, 0.5, 0.5,
-3.706604, -1, -5.815569, 1, -0.5, 0.5, 0.5,
-3.706604, -1, -5.815569, 1, 1.5, 0.5, 0.5,
-3.706604, -1, -5.815569, 0, 1.5, 0.5, 0.5,
-3.706604, 0, -5.815569, 0, -0.5, 0.5, 0.5,
-3.706604, 0, -5.815569, 1, -0.5, 0.5, 0.5,
-3.706604, 0, -5.815569, 1, 1.5, 0.5, 0.5,
-3.706604, 0, -5.815569, 0, 1.5, 0.5, 0.5,
-3.706604, 1, -5.815569, 0, -0.5, 0.5, 0.5,
-3.706604, 1, -5.815569, 1, -0.5, 0.5, 0.5,
-3.706604, 1, -5.815569, 1, 1.5, 0.5, 0.5,
-3.706604, 1, -5.815569, 0, 1.5, 0.5, 0.5,
-3.706604, 2, -5.815569, 0, -0.5, 0.5, 0.5,
-3.706604, 2, -5.815569, 1, -0.5, 0.5, 0.5,
-3.706604, 2, -5.815569, 1, 1.5, 0.5, 0.5,
-3.706604, 2, -5.815569, 0, 1.5, 0.5, 0.5
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
-3.236293, -2.923483, -4,
-3.236293, -2.923483, 4,
-3.236293, -2.923483, -4,
-3.393063, -3.071095, -4,
-3.236293, -2.923483, -2,
-3.393063, -3.071095, -2,
-3.236293, -2.923483, 0,
-3.393063, -3.071095, 0,
-3.236293, -2.923483, 2,
-3.393063, -3.071095, 2,
-3.236293, -2.923483, 4,
-3.393063, -3.071095, 4
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
-3.706604, -3.366318, -4, 0, -0.5, 0.5, 0.5,
-3.706604, -3.366318, -4, 1, -0.5, 0.5, 0.5,
-3.706604, -3.366318, -4, 1, 1.5, 0.5, 0.5,
-3.706604, -3.366318, -4, 0, 1.5, 0.5, 0.5,
-3.706604, -3.366318, -2, 0, -0.5, 0.5, 0.5,
-3.706604, -3.366318, -2, 1, -0.5, 0.5, 0.5,
-3.706604, -3.366318, -2, 1, 1.5, 0.5, 0.5,
-3.706604, -3.366318, -2, 0, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 0, 0, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 0, 1, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 0, 1, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 0, 0, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 2, 0, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 2, 1, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 2, 1, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 2, 0, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 4, 0, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 4, 1, -0.5, 0.5, 0.5,
-3.706604, -3.366318, 4, 1, 1.5, 0.5, 0.5,
-3.706604, -3.366318, 4, 0, 1.5, 0.5, 0.5
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
-3.236293, -2.923483, -4.992398,
-3.236293, 2.980987, -4.992398,
-3.236293, -2.923483, 5.983218,
-3.236293, 2.980987, 5.983218,
-3.236293, -2.923483, -4.992398,
-3.236293, -2.923483, 5.983218,
-3.236293, 2.980987, -4.992398,
-3.236293, 2.980987, 5.983218,
-3.236293, -2.923483, -4.992398,
3.034525, -2.923483, -4.992398,
-3.236293, -2.923483, 5.983218,
3.034525, -2.923483, 5.983218,
-3.236293, 2.980987, -4.992398,
3.034525, 2.980987, -4.992398,
-3.236293, 2.980987, 5.983218,
3.034525, 2.980987, 5.983218,
3.034525, -2.923483, -4.992398,
3.034525, 2.980987, -4.992398,
3.034525, -2.923483, 5.983218,
3.034525, 2.980987, 5.983218,
3.034525, -2.923483, -4.992398,
3.034525, -2.923483, 5.983218,
3.034525, 2.980987, -4.992398,
3.034525, 2.980987, 5.983218
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
var radius = 7.449939;
var distance = 33.14562;
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
mvMatrix.translate( 0.100884, -0.02875221, -0.49541 );
mvMatrix.scale( 1.284525, 1.364224, 0.7339014 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14562);
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
cyclopentyloxy<-read.table("cyclopentyloxy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclopentyloxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
```

```r
y<-cyclopentyloxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
```

```r
z<-cyclopentyloxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
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
-3.14497, -0.2762212, 0.02162883, 0, 0, 1, 1, 1,
-2.978597, 0.5645567, -2.172085, 1, 0, 0, 1, 1,
-2.748303, 0.8918262, -2.480809, 1, 0, 0, 1, 1,
-2.54788, 0.8951322, -1.317589, 1, 0, 0, 1, 1,
-2.435622, -0.5829583, 0.5654269, 1, 0, 0, 1, 1,
-2.378799, -1.699692, -1.706441, 1, 0, 0, 1, 1,
-2.341739, 0.9333941, 0.1669739, 0, 0, 0, 1, 1,
-2.264583, -0.09565195, -2.862315, 0, 0, 0, 1, 1,
-2.207743, -0.945651, -0.2933306, 0, 0, 0, 1, 1,
-2.198569, -0.5429376, -4.145616, 0, 0, 0, 1, 1,
-2.196546, -0.2024156, -1.82338, 0, 0, 0, 1, 1,
-2.173284, 1.128715, -1.392084, 0, 0, 0, 1, 1,
-2.168096, 0.4884189, -1.451781, 0, 0, 0, 1, 1,
-2.166149, 0.6289201, -1.570146, 1, 1, 1, 1, 1,
-2.165091, 0.2032556, -3.647615, 1, 1, 1, 1, 1,
-2.160814, 1.341619, 0.4534076, 1, 1, 1, 1, 1,
-2.136977, -0.207153, -1.565566, 1, 1, 1, 1, 1,
-2.023655, -1.134275, -2.748835, 1, 1, 1, 1, 1,
-2.003206, -0.5978577, -1.301637, 1, 1, 1, 1, 1,
-1.999743, -1.699945, -3.531085, 1, 1, 1, 1, 1,
-1.950166, 0.8189361, -3.128188, 1, 1, 1, 1, 1,
-1.924029, 0.725038, -2.531712, 1, 1, 1, 1, 1,
-1.92171, -1.277408, -1.99781, 1, 1, 1, 1, 1,
-1.901573, -0.07887587, -1.845852, 1, 1, 1, 1, 1,
-1.88547, -1.563708, -3.435569, 1, 1, 1, 1, 1,
-1.868176, 0.4532526, -4.07058, 1, 1, 1, 1, 1,
-1.85888, 1.541687, -1.066203, 1, 1, 1, 1, 1,
-1.851278, -0.3154515, -3.654721, 1, 1, 1, 1, 1,
-1.847222, 0.6213097, -2.687418, 0, 0, 1, 1, 1,
-1.843799, -0.4746593, -1.852149, 1, 0, 0, 1, 1,
-1.819792, 0.4941112, -1.603658, 1, 0, 0, 1, 1,
-1.812392, 0.009364199, -2.251514, 1, 0, 0, 1, 1,
-1.795848, -0.3152502, 0.08451454, 1, 0, 0, 1, 1,
-1.788806, 0.2745882, -1.43599, 1, 0, 0, 1, 1,
-1.778587, -0.09096502, -1.492018, 0, 0, 0, 1, 1,
-1.776293, -1.574916, -2.785908, 0, 0, 0, 1, 1,
-1.774478, -0.3748058, -1.966266, 0, 0, 0, 1, 1,
-1.764965, 1.47051, -1.521374, 0, 0, 0, 1, 1,
-1.763776, -0.9566624, -3.131023, 0, 0, 0, 1, 1,
-1.75978, 0.1165963, -2.41942, 0, 0, 0, 1, 1,
-1.751965, -0.8586893, -2.842862, 0, 0, 0, 1, 1,
-1.749191, 0.3049153, -2.88569, 1, 1, 1, 1, 1,
-1.747349, -1.025018, -3.495986, 1, 1, 1, 1, 1,
-1.740949, -0.1613608, -1.157381, 1, 1, 1, 1, 1,
-1.73105, -1.406048, -2.577701, 1, 1, 1, 1, 1,
-1.730575, -1.74063, -2.128613, 1, 1, 1, 1, 1,
-1.704119, -1.165906, -1.291882, 1, 1, 1, 1, 1,
-1.700958, -0.0001100975, -1.868581, 1, 1, 1, 1, 1,
-1.69384, -0.3020534, -1.36942, 1, 1, 1, 1, 1,
-1.680503, -0.5071357, -2.494741, 1, 1, 1, 1, 1,
-1.671503, -1.837219, -2.867461, 1, 1, 1, 1, 1,
-1.66662, 0.797763, -1.180403, 1, 1, 1, 1, 1,
-1.664731, -0.873893, -1.47417, 1, 1, 1, 1, 1,
-1.632524, 0.5405914, -1.056047, 1, 1, 1, 1, 1,
-1.610299, 0.7545825, -1.314365, 1, 1, 1, 1, 1,
-1.597692, -1.155358, -2.501213, 1, 1, 1, 1, 1,
-1.592723, -0.886955, -1.65854, 0, 0, 1, 1, 1,
-1.592421, -2.473469, -2.216237, 1, 0, 0, 1, 1,
-1.566777, -0.8556111, -1.766612, 1, 0, 0, 1, 1,
-1.557031, -0.4201908, -2.99847, 1, 0, 0, 1, 1,
-1.553191, -0.1999311, -1.419596, 1, 0, 0, 1, 1,
-1.550004, -0.3035702, -1.635248, 1, 0, 0, 1, 1,
-1.548941, 0.2933702, -1.181332, 0, 0, 0, 1, 1,
-1.527115, -0.6961816, -1.557799, 0, 0, 0, 1, 1,
-1.521716, -0.07626293, -2.274818, 0, 0, 0, 1, 1,
-1.51998, -1.127246, -4.207824, 0, 0, 0, 1, 1,
-1.5065, 1.701804, 0.8705326, 0, 0, 0, 1, 1,
-1.500794, -0.2043927, -1.373572, 0, 0, 0, 1, 1,
-1.487394, -0.1113421, -1.400331, 0, 0, 0, 1, 1,
-1.4747, -0.9386579, -0.1580162, 1, 1, 1, 1, 1,
-1.467026, -1.756012, -2.857975, 1, 1, 1, 1, 1,
-1.462824, 0.04201799, -1.754747, 1, 1, 1, 1, 1,
-1.443812, 0.5310154, -0.958647, 1, 1, 1, 1, 1,
-1.432793, -1.507813, -2.843356, 1, 1, 1, 1, 1,
-1.413375, 0.966587, -2.796343, 1, 1, 1, 1, 1,
-1.413083, -1.289989, -1.483537, 1, 1, 1, 1, 1,
-1.4081, -0.2566676, -1.093189, 1, 1, 1, 1, 1,
-1.39784, 0.5517566, -0.6513091, 1, 1, 1, 1, 1,
-1.397828, 1.1156, -0.6587772, 1, 1, 1, 1, 1,
-1.396011, 0.6233127, -0.4602976, 1, 1, 1, 1, 1,
-1.383431, 2.376535, -1.639703, 1, 1, 1, 1, 1,
-1.379819, 1.166077, 1.454477, 1, 1, 1, 1, 1,
-1.365091, -2.085292, -2.81495, 1, 1, 1, 1, 1,
-1.359725, -0.5949982, -2.426304, 1, 1, 1, 1, 1,
-1.357737, 1.007148, -0.6418427, 0, 0, 1, 1, 1,
-1.34826, 1.263399, -1.405879, 1, 0, 0, 1, 1,
-1.347432, -1.314603, -2.945949, 1, 0, 0, 1, 1,
-1.337435, -2.064422, -2.799379, 1, 0, 0, 1, 1,
-1.330788, 2.382726, -0.3730962, 1, 0, 0, 1, 1,
-1.327417, -0.04917933, -1.511804, 1, 0, 0, 1, 1,
-1.325399, 1.682177, 0.06074411, 0, 0, 0, 1, 1,
-1.315934, -0.321045, -2.750092, 0, 0, 0, 1, 1,
-1.315141, -0.2348602, -2.062627, 0, 0, 0, 1, 1,
-1.306182, -0.7454416, -2.565562, 0, 0, 0, 1, 1,
-1.3041, -0.3696015, -3.300634, 0, 0, 0, 1, 1,
-1.29855, 0.01249357, -1.354938, 0, 0, 0, 1, 1,
-1.297627, -0.8175635, -2.640132, 0, 0, 0, 1, 1,
-1.285529, -1.783929, -1.926421, 1, 1, 1, 1, 1,
-1.283668, -2.415156, -2.049026, 1, 1, 1, 1, 1,
-1.28241, 0.5391443, -0.495778, 1, 1, 1, 1, 1,
-1.275434, 1.385561, -0.5262976, 1, 1, 1, 1, 1,
-1.26724, -0.3074272, -0.8907729, 1, 1, 1, 1, 1,
-1.267126, -0.1732241, -0.7978436, 1, 1, 1, 1, 1,
-1.262782, -0.6952347, -2.864042, 1, 1, 1, 1, 1,
-1.253439, 0.8255621, -0.289096, 1, 1, 1, 1, 1,
-1.248505, -0.3614779, -1.492867, 1, 1, 1, 1, 1,
-1.247661, 0.4407498, -0.1953583, 1, 1, 1, 1, 1,
-1.241261, 0.622604, 0.2580978, 1, 1, 1, 1, 1,
-1.239376, -1.245698, -1.279086, 1, 1, 1, 1, 1,
-1.238515, -1.321889, -3.596986, 1, 1, 1, 1, 1,
-1.233226, 0.2785038, -0.7496837, 1, 1, 1, 1, 1,
-1.227814, -1.531708, -3.254786, 1, 1, 1, 1, 1,
-1.216877, -0.9163907, -1.891937, 0, 0, 1, 1, 1,
-1.199962, 1.50589, -1.46203, 1, 0, 0, 1, 1,
-1.199425, 0.6294655, -2.492197, 1, 0, 0, 1, 1,
-1.19319, 1.293987, -0.08363109, 1, 0, 0, 1, 1,
-1.190776, -0.1204954, -2.898792, 1, 0, 0, 1, 1,
-1.178126, -0.3516614, -1.969299, 1, 0, 0, 1, 1,
-1.164915, 2.521932, -0.3098475, 0, 0, 0, 1, 1,
-1.158317, 0.8454494, -1.454867, 0, 0, 0, 1, 1,
-1.158199, -1.055735, -4.182652, 0, 0, 0, 1, 1,
-1.141477, -0.8689116, -1.931016, 0, 0, 0, 1, 1,
-1.1395, 1.216782, 0.2781664, 0, 0, 0, 1, 1,
-1.136646, 0.5831183, -2.830786, 0, 0, 0, 1, 1,
-1.135998, 2.347894, -0.2258286, 0, 0, 0, 1, 1,
-1.125177, 0.5928616, 0.2291558, 1, 1, 1, 1, 1,
-1.121871, -1.271034, -1.072255, 1, 1, 1, 1, 1,
-1.1205, 0.4759112, -1.335876, 1, 1, 1, 1, 1,
-1.112966, 2.585625, -1.611539, 1, 1, 1, 1, 1,
-1.110528, -0.7446824, -1.756185, 1, 1, 1, 1, 1,
-1.095086, 2.356872, -1.810125, 1, 1, 1, 1, 1,
-1.086076, 0.6648192, -2.422473, 1, 1, 1, 1, 1,
-1.083971, 0.4066043, -2.159628, 1, 1, 1, 1, 1,
-1.066502, 0.3441696, -1.204771, 1, 1, 1, 1, 1,
-1.064438, -0.1375746, -3.21443, 1, 1, 1, 1, 1,
-1.060255, -0.4998213, -1.107986, 1, 1, 1, 1, 1,
-1.05998, 0.964255, -0.01051392, 1, 1, 1, 1, 1,
-1.05692, -1.41446, -1.186156, 1, 1, 1, 1, 1,
-1.047097, 1.5321, -0.5482281, 1, 1, 1, 1, 1,
-1.041566, -0.5679492, -1.782117, 1, 1, 1, 1, 1,
-1.040734, -0.1925957, -2.801708, 0, 0, 1, 1, 1,
-1.03907, 1.160607, -1.74736, 1, 0, 0, 1, 1,
-1.02985, -0.1262439, -1.134052, 1, 0, 0, 1, 1,
-1.021721, -1.123571, -1.987993, 1, 0, 0, 1, 1,
-1.017145, 0.5747279, -2.253765, 1, 0, 0, 1, 1,
-1.015564, 1.496392, 0.8178136, 1, 0, 0, 1, 1,
-1.015491, -0.7192104, -2.497019, 0, 0, 0, 1, 1,
-1.014703, -1.489067, -2.371415, 0, 0, 0, 1, 1,
-1.006922, -0.4295166, -2.563435, 0, 0, 0, 1, 1,
-1.002679, -0.08983908, -1.423185, 0, 0, 0, 1, 1,
-0.99213, 0.06324349, -2.118161, 0, 0, 0, 1, 1,
-0.9910204, -0.4674996, -2.051465, 0, 0, 0, 1, 1,
-0.9908142, -1.354969, -2.002753, 0, 0, 0, 1, 1,
-0.9847949, -0.7054756, -1.783587, 1, 1, 1, 1, 1,
-0.9751911, 0.9270234, -0.8537952, 1, 1, 1, 1, 1,
-0.9687526, -0.4578207, -1.226111, 1, 1, 1, 1, 1,
-0.9626584, 2.225781, -1.216102, 1, 1, 1, 1, 1,
-0.961619, -0.2214711, -1.922783, 1, 1, 1, 1, 1,
-0.9527445, -0.9414242, -1.998057, 1, 1, 1, 1, 1,
-0.9471622, 0.8032798, -1.454369, 1, 1, 1, 1, 1,
-0.9419894, 0.9015253, -1.031183, 1, 1, 1, 1, 1,
-0.9333029, -0.8606564, -2.540837, 1, 1, 1, 1, 1,
-0.9304906, -1.231068, -1.504305, 1, 1, 1, 1, 1,
-0.9230835, -0.2880999, -3.722517, 1, 1, 1, 1, 1,
-0.9150082, -0.2836086, -1.743233, 1, 1, 1, 1, 1,
-0.9080141, 0.6646086, -0.3320735, 1, 1, 1, 1, 1,
-0.907231, 0.5897146, -1.072533, 1, 1, 1, 1, 1,
-0.898428, 0.04613141, -3.245384, 1, 1, 1, 1, 1,
-0.8963565, 0.4206534, -1.282686, 0, 0, 1, 1, 1,
-0.8933619, 0.1713935, -0.9017374, 1, 0, 0, 1, 1,
-0.8923014, -0.2966132, -1.459697, 1, 0, 0, 1, 1,
-0.8879163, -0.06832031, -1.799185, 1, 0, 0, 1, 1,
-0.8857244, 1.00549, 0.0709962, 1, 0, 0, 1, 1,
-0.881267, 0.8934621, -1.193301, 1, 0, 0, 1, 1,
-0.8811821, -0.5185108, -2.529055, 0, 0, 0, 1, 1,
-0.8764589, 0.285804, -0.8219379, 0, 0, 0, 1, 1,
-0.8690543, 1.37931, -2.227857, 0, 0, 0, 1, 1,
-0.8651791, 1.482964, 0.1987078, 0, 0, 0, 1, 1,
-0.8651466, -0.6032953, -1.95568, 0, 0, 0, 1, 1,
-0.8593696, 2.029561, 0.3443252, 0, 0, 0, 1, 1,
-0.8590634, 0.3880864, -2.076584, 0, 0, 0, 1, 1,
-0.8500674, -0.1292379, 0.2258023, 1, 1, 1, 1, 1,
-0.8479486, -0.5821584, -3.626935, 1, 1, 1, 1, 1,
-0.8479327, -2.268815, -3.102557, 1, 1, 1, 1, 1,
-0.8477694, -0.01268904, -1.656633, 1, 1, 1, 1, 1,
-0.8458771, 1.86325, 0.6750703, 1, 1, 1, 1, 1,
-0.8447685, -0.6632621, -3.093682, 1, 1, 1, 1, 1,
-0.8445852, 0.2134919, 0.1749723, 1, 1, 1, 1, 1,
-0.8410642, 1.060641, -1.166807, 1, 1, 1, 1, 1,
-0.8360363, -0.740082, -1.868756, 1, 1, 1, 1, 1,
-0.830807, -0.3809294, -1.985188, 1, 1, 1, 1, 1,
-0.8287938, 0.4492676, -2.047664, 1, 1, 1, 1, 1,
-0.8256074, 0.2553042, -1.009471, 1, 1, 1, 1, 1,
-0.8249065, -0.7374257, -3.174486, 1, 1, 1, 1, 1,
-0.821309, 1.261853, -0.6932941, 1, 1, 1, 1, 1,
-0.8203492, -0.4348522, -2.797062, 1, 1, 1, 1, 1,
-0.8202161, -1.33102, -1.816741, 0, 0, 1, 1, 1,
-0.8153441, 0.4839723, -0.5165899, 1, 0, 0, 1, 1,
-0.8106339, -0.946173, -0.7492523, 1, 0, 0, 1, 1,
-0.8051299, 0.8089511, -1.159541, 1, 0, 0, 1, 1,
-0.802401, -0.3361219, -2.850401, 1, 0, 0, 1, 1,
-0.7974916, 1.809712, 1.76473, 1, 0, 0, 1, 1,
-0.795634, -0.4422401, -1.782088, 0, 0, 0, 1, 1,
-0.7952502, 1.31917, -1.732776, 0, 0, 0, 1, 1,
-0.7880608, 0.4120393, -0.6178662, 0, 0, 0, 1, 1,
-0.7877662, 0.2570451, -2.906418, 0, 0, 0, 1, 1,
-0.7870035, 2.895, -1.501566, 0, 0, 0, 1, 1,
-0.7863141, -1.500622, -2.106211, 0, 0, 0, 1, 1,
-0.7699543, 0.858068, -0.1428696, 0, 0, 0, 1, 1,
-0.7651904, -0.4348768, -2.292583, 1, 1, 1, 1, 1,
-0.7631009, 0.0981756, -1.146821, 1, 1, 1, 1, 1,
-0.7610493, 1.395474, -1.094999, 1, 1, 1, 1, 1,
-0.7517294, 0.744632, -0.143656, 1, 1, 1, 1, 1,
-0.7493246, 0.6979868, -0.9736311, 1, 1, 1, 1, 1,
-0.7453839, 0.2152758, -2.258784, 1, 1, 1, 1, 1,
-0.7432196, -1.069313, -0.9468846, 1, 1, 1, 1, 1,
-0.7407319, 1.930151, -2.054862, 1, 1, 1, 1, 1,
-0.7387387, -0.08586531, -1.250103, 1, 1, 1, 1, 1,
-0.7348346, -1.504136, -2.270575, 1, 1, 1, 1, 1,
-0.7293395, 0.2423367, -1.666312, 1, 1, 1, 1, 1,
-0.72909, 1.124808, -0.528231, 1, 1, 1, 1, 1,
-0.7265109, -0.289007, 0.4531794, 1, 1, 1, 1, 1,
-0.7249295, 0.55387, -1.278394, 1, 1, 1, 1, 1,
-0.7179226, -0.04423589, -2.887886, 1, 1, 1, 1, 1,
-0.7177639, 1.18229, -0.127783, 0, 0, 1, 1, 1,
-0.7044652, -0.2386842, -1.429465, 1, 0, 0, 1, 1,
-0.7041991, 1.048824, -1.344266, 1, 0, 0, 1, 1,
-0.7041242, -2.331779, -2.067918, 1, 0, 0, 1, 1,
-0.7038559, -0.04526812, 0.5800928, 1, 0, 0, 1, 1,
-0.7033077, -0.3607245, -1.405831, 1, 0, 0, 1, 1,
-0.68769, 0.600873, -1.763806, 0, 0, 0, 1, 1,
-0.6874247, 1.340839, -0.008942716, 0, 0, 0, 1, 1,
-0.6848076, -2.837495, -4.219645, 0, 0, 0, 1, 1,
-0.6808385, 0.1635633, -0.6498884, 0, 0, 0, 1, 1,
-0.6798708, 0.01869555, -0.6920218, 0, 0, 0, 1, 1,
-0.6679992, 2.315398, -1.427924, 0, 0, 0, 1, 1,
-0.6679522, 1.020167, -1.990178, 0, 0, 0, 1, 1,
-0.6619328, 1.200798, -0.05019075, 1, 1, 1, 1, 1,
-0.6593257, 0.3724715, 0.08376493, 1, 1, 1, 1, 1,
-0.6567639, 0.2270798, -0.7289734, 1, 1, 1, 1, 1,
-0.655117, 0.4631206, -0.5000202, 1, 1, 1, 1, 1,
-0.6521426, 0.2811583, -0.923906, 1, 1, 1, 1, 1,
-0.6475053, 0.2862777, -0.3412603, 1, 1, 1, 1, 1,
-0.6472341, 0.2179497, 0.2523603, 1, 1, 1, 1, 1,
-0.6462844, -1.322794, -2.706906, 1, 1, 1, 1, 1,
-0.6442978, 1.14628, -2.032917, 1, 1, 1, 1, 1,
-0.6431475, -1.496266, -4.626653, 1, 1, 1, 1, 1,
-0.638265, -1.817273, -2.499276, 1, 1, 1, 1, 1,
-0.635177, 0.4720472, -0.7127033, 1, 1, 1, 1, 1,
-0.6345528, -0.9872788, -2.815794, 1, 1, 1, 1, 1,
-0.6340277, 1.992821, -2.447423, 1, 1, 1, 1, 1,
-0.6320074, 0.2495377, -1.868922, 1, 1, 1, 1, 1,
-0.6319131, -1.100541, -2.687447, 0, 0, 1, 1, 1,
-0.6284333, 0.8936852, -0.666692, 1, 0, 0, 1, 1,
-0.6265578, -0.5337929, -2.945971, 1, 0, 0, 1, 1,
-0.6241596, 0.07463396, -2.302142, 1, 0, 0, 1, 1,
-0.620999, -0.667359, -1.414121, 1, 0, 0, 1, 1,
-0.6094959, 0.6029952, 1.414427, 1, 0, 0, 1, 1,
-0.6085392, -1.693114, -3.08516, 0, 0, 0, 1, 1,
-0.6081631, -0.4275197, -2.534833, 0, 0, 0, 1, 1,
-0.6043428, -1.689296, -1.716278, 0, 0, 0, 1, 1,
-0.6020787, -0.5881813, -2.33851, 0, 0, 0, 1, 1,
-0.6006594, -0.1093933, -2.400763, 0, 0, 0, 1, 1,
-0.6002381, -0.3162678, -2.115907, 0, 0, 0, 1, 1,
-0.5913534, -0.9724065, -4.345056, 0, 0, 0, 1, 1,
-0.5872025, -0.1663454, -2.552337, 1, 1, 1, 1, 1,
-0.5858885, -0.6394237, -3.258023, 1, 1, 1, 1, 1,
-0.5845168, 0.6172954, -1.855451, 1, 1, 1, 1, 1,
-0.5718774, 0.4541262, 0.3785686, 1, 1, 1, 1, 1,
-0.5712698, 0.7039146, -0.001143409, 1, 1, 1, 1, 1,
-0.5699661, -1.187704, -3.637073, 1, 1, 1, 1, 1,
-0.5669453, 0.4359188, -0.666077, 1, 1, 1, 1, 1,
-0.5646755, -0.7665367, -1.835601, 1, 1, 1, 1, 1,
-0.5618916, -1.94095, -2.511061, 1, 1, 1, 1, 1,
-0.5588696, -0.3604503, -3.249731, 1, 1, 1, 1, 1,
-0.5582344, -0.03761722, -1.589853, 1, 1, 1, 1, 1,
-0.5538642, -1.234561, -2.329503, 1, 1, 1, 1, 1,
-0.5510547, 0.268553, -1.981358, 1, 1, 1, 1, 1,
-0.5477614, -0.8894585, -3.164375, 1, 1, 1, 1, 1,
-0.5473018, 0.7479993, 0.1510006, 1, 1, 1, 1, 1,
-0.5466751, -0.6929104, -2.28818, 0, 0, 1, 1, 1,
-0.5396501, -0.3533976, -2.504075, 1, 0, 0, 1, 1,
-0.534458, -0.8177547, -1.405471, 1, 0, 0, 1, 1,
-0.5318757, -0.6265734, -1.361317, 1, 0, 0, 1, 1,
-0.5309876, -0.2079819, -1.835373, 1, 0, 0, 1, 1,
-0.5304821, 2.668758, 1.055618, 1, 0, 0, 1, 1,
-0.5301833, 0.1805368, -2.403531, 0, 0, 0, 1, 1,
-0.5296305, 1.203805, -1.91638, 0, 0, 0, 1, 1,
-0.5289443, -0.8743152, -3.162894, 0, 0, 0, 1, 1,
-0.5181505, 0.4060995, -0.5219291, 0, 0, 0, 1, 1,
-0.5140638, -0.4931352, -1.869301, 0, 0, 0, 1, 1,
-0.5130267, 1.618209, -0.9159485, 0, 0, 0, 1, 1,
-0.5108225, 0.4751561, -0.5815912, 0, 0, 0, 1, 1,
-0.5108204, -0.6482991, -2.372087, 1, 1, 1, 1, 1,
-0.510161, -0.2864357, -1.084188, 1, 1, 1, 1, 1,
-0.505218, 1.279117, -2.57034, 1, 1, 1, 1, 1,
-0.4992252, -0.4667713, -2.134672, 1, 1, 1, 1, 1,
-0.4990313, -0.1850657, -2.373212, 1, 1, 1, 1, 1,
-0.4965388, -1.547313, -3.716518, 1, 1, 1, 1, 1,
-0.4927111, 0.01190065, -2.713362, 1, 1, 1, 1, 1,
-0.4913888, 0.7263218, -1.045467, 1, 1, 1, 1, 1,
-0.4891015, -0.7605142, -0.3244126, 1, 1, 1, 1, 1,
-0.4883877, -0.04831545, -1.209679, 1, 1, 1, 1, 1,
-0.4869452, -0.2587226, -0.3581326, 1, 1, 1, 1, 1,
-0.4837751, -0.4542265, -3.553897, 1, 1, 1, 1, 1,
-0.4835911, 0.08251238, -2.939748, 1, 1, 1, 1, 1,
-0.479227, 0.8451144, 0.9871442, 1, 1, 1, 1, 1,
-0.4788029, 0.8778358, -1.886495, 1, 1, 1, 1, 1,
-0.4766331, -0.9821413, -3.815271, 0, 0, 1, 1, 1,
-0.4764007, 0.970917, -0.3599633, 1, 0, 0, 1, 1,
-0.4762305, -1.067816, -2.580291, 1, 0, 0, 1, 1,
-0.4745773, 0.6093965, -0.6791044, 1, 0, 0, 1, 1,
-0.4707068, 0.4204305, 1.10206, 1, 0, 0, 1, 1,
-0.4697656, 0.618327, -0.5788484, 1, 0, 0, 1, 1,
-0.4697453, -1.677899, -2.29508, 0, 0, 0, 1, 1,
-0.4664575, 0.2273061, 0.7955199, 0, 0, 0, 1, 1,
-0.4585385, -0.7746026, -2.042269, 0, 0, 0, 1, 1,
-0.4536218, 0.2330195, 0.492976, 0, 0, 0, 1, 1,
-0.4507001, 1.700693, -1.651733, 0, 0, 0, 1, 1,
-0.4504387, 0.569435, 2.456579, 0, 0, 0, 1, 1,
-0.4495459, -0.2786274, -1.400164, 0, 0, 0, 1, 1,
-0.4486201, 0.1816694, -0.382896, 1, 1, 1, 1, 1,
-0.447357, -0.2745873, -1.640555, 1, 1, 1, 1, 1,
-0.4473255, -1.174817, -3.826619, 1, 1, 1, 1, 1,
-0.4460174, -0.8398861, -3.887911, 1, 1, 1, 1, 1,
-0.4444627, 1.995911, -1.475204, 1, 1, 1, 1, 1,
-0.4437036, 0.03298865, -0.864113, 1, 1, 1, 1, 1,
-0.440812, 0.4561687, -0.3552923, 1, 1, 1, 1, 1,
-0.436808, 0.7021293, 0.1751939, 1, 1, 1, 1, 1,
-0.4354175, -0.6826017, -2.658899, 1, 1, 1, 1, 1,
-0.4333939, 1.122594, 0.6720896, 1, 1, 1, 1, 1,
-0.4312721, -0.1368543, -1.71499, 1, 1, 1, 1, 1,
-0.42768, 0.4460093, 0.01932151, 1, 1, 1, 1, 1,
-0.4271747, -1.308423, -2.658891, 1, 1, 1, 1, 1,
-0.4243438, 1.845296, 0.3050991, 1, 1, 1, 1, 1,
-0.4240436, 1.104445, -0.3032527, 1, 1, 1, 1, 1,
-0.4239085, -0.2524882, -3.555726, 0, 0, 1, 1, 1,
-0.4226752, -2.113887, -3.472482, 1, 0, 0, 1, 1,
-0.4186621, -0.3443728, -3.553166, 1, 0, 0, 1, 1,
-0.4149896, -2.047982, -4.266408, 1, 0, 0, 1, 1,
-0.410521, -0.2545032, -1.619083, 1, 0, 0, 1, 1,
-0.4090319, 0.01320095, -1.694324, 1, 0, 0, 1, 1,
-0.408695, 0.2842975, 0.4414166, 0, 0, 0, 1, 1,
-0.4019671, 0.9068108, 1.352394, 0, 0, 0, 1, 1,
-0.3964997, -0.1974536, -0.9410726, 0, 0, 0, 1, 1,
-0.3945144, -1.036167, -3.029634, 0, 0, 0, 1, 1,
-0.3943347, -0.580553, -3.195836, 0, 0, 0, 1, 1,
-0.394088, -0.8013652, -3.364704, 0, 0, 0, 1, 1,
-0.39387, 1.316025, -0.4454044, 0, 0, 0, 1, 1,
-0.3933977, 0.1833853, -1.858687, 1, 1, 1, 1, 1,
-0.3932771, -0.03463387, -4.142175, 1, 1, 1, 1, 1,
-0.3775258, 0.6685373, -0.9704847, 1, 1, 1, 1, 1,
-0.376682, -1.61865, -2.866264, 1, 1, 1, 1, 1,
-0.3740543, 0.6380072, -1.269032, 1, 1, 1, 1, 1,
-0.3705041, 1.120844, -0.3266592, 1, 1, 1, 1, 1,
-0.3673163, -0.7040644, -3.7907, 1, 1, 1, 1, 1,
-0.3663703, -0.9575114, -3.664013, 1, 1, 1, 1, 1,
-0.364576, 1.03294, -1.079383, 1, 1, 1, 1, 1,
-0.3637838, -2.291228, -2.492652, 1, 1, 1, 1, 1,
-0.3625102, 0.2954426, 0.6919611, 1, 1, 1, 1, 1,
-0.3596275, 1.78937, 0.1954514, 1, 1, 1, 1, 1,
-0.3530096, 0.5807229, -0.1677188, 1, 1, 1, 1, 1,
-0.3513017, 0.5404261, -1.246015, 1, 1, 1, 1, 1,
-0.3459226, -0.02784338, -1.221191, 1, 1, 1, 1, 1,
-0.3453951, -1.187022, -2.524452, 0, 0, 1, 1, 1,
-0.3417832, 0.5853782, -1.310476, 1, 0, 0, 1, 1,
-0.3417157, 0.9455374, -0.9351588, 1, 0, 0, 1, 1,
-0.3412984, 0.5380542, -0.400579, 1, 0, 0, 1, 1,
-0.339454, 1.092018, -0.7766806, 1, 0, 0, 1, 1,
-0.3389021, -2.487154, -2.117195, 1, 0, 0, 1, 1,
-0.3286138, 1.75743, 1.186489, 0, 0, 0, 1, 1,
-0.3251372, 0.0451653, -1.569273, 0, 0, 0, 1, 1,
-0.3248998, 1.040711, -0.05139534, 0, 0, 0, 1, 1,
-0.3240258, -1.317495, -1.723439, 0, 0, 0, 1, 1,
-0.3227314, 1.929614, 0.9815263, 0, 0, 0, 1, 1,
-0.3202655, -2.511136, -3.920477, 0, 0, 0, 1, 1,
-0.3183492, 0.6603437, 0.3869905, 0, 0, 0, 1, 1,
-0.317916, 0.6204676, -0.19179, 1, 1, 1, 1, 1,
-0.3178096, 1.217555, 1.227792, 1, 1, 1, 1, 1,
-0.3177093, -0.385634, -1.933803, 1, 1, 1, 1, 1,
-0.3172117, 2.203613, -0.5737016, 1, 1, 1, 1, 1,
-0.3124168, -0.5662485, -3.353199, 1, 1, 1, 1, 1,
-0.3124069, -0.4372611, -3.578026, 1, 1, 1, 1, 1,
-0.3123556, 0.1047567, -1.810921, 1, 1, 1, 1, 1,
-0.3111489, -0.3567573, -2.864814, 1, 1, 1, 1, 1,
-0.3106959, -0.4297375, -4.538414, 1, 1, 1, 1, 1,
-0.3098623, -1.469238, -3.40866, 1, 1, 1, 1, 1,
-0.309165, 0.09092391, -0.2072401, 1, 1, 1, 1, 1,
-0.3077127, 1.760717, -0.4505557, 1, 1, 1, 1, 1,
-0.3076542, -1.966511, -3.167513, 1, 1, 1, 1, 1,
-0.3046575, 1.322943, -0.8278943, 1, 1, 1, 1, 1,
-0.3025849, -0.03924278, -1.615232, 1, 1, 1, 1, 1,
-0.2984725, 0.6646917, -0.82411, 0, 0, 1, 1, 1,
-0.296093, 1.766027, -0.2705312, 1, 0, 0, 1, 1,
-0.2956209, -0.05860616, -2.795121, 1, 0, 0, 1, 1,
-0.2954127, -1.306034, -2.535034, 1, 0, 0, 1, 1,
-0.2938643, -1.697388, -2.866148, 1, 0, 0, 1, 1,
-0.2871633, -0.160683, -1.900625, 1, 0, 0, 1, 1,
-0.2822698, 1.430202, -0.4094605, 0, 0, 0, 1, 1,
-0.2805446, -0.7013199, -2.977317, 0, 0, 0, 1, 1,
-0.2805096, -0.02882376, -1.760246, 0, 0, 0, 1, 1,
-0.2767806, 0.6527359, -0.5818819, 0, 0, 0, 1, 1,
-0.2760958, 0.980943, -0.3481397, 0, 0, 0, 1, 1,
-0.2708439, 0.8171747, -0.08883911, 0, 0, 0, 1, 1,
-0.2692084, -0.6159858, -3.176999, 0, 0, 0, 1, 1,
-0.2630136, -1.777587, -3.925255, 1, 1, 1, 1, 1,
-0.2613887, -1.257021, -1.947067, 1, 1, 1, 1, 1,
-0.2602077, -0.274321, -3.526183, 1, 1, 1, 1, 1,
-0.2568958, -0.4293402, -2.893878, 1, 1, 1, 1, 1,
-0.2564026, 0.2202965, -0.6524949, 1, 1, 1, 1, 1,
-0.250149, -0.1272987, -2.615734, 1, 1, 1, 1, 1,
-0.2492719, -1.038584, -3.535247, 1, 1, 1, 1, 1,
-0.2486302, -0.4045882, -2.3863, 1, 1, 1, 1, 1,
-0.246682, -1.813531, -2.150265, 1, 1, 1, 1, 1,
-0.2436286, 0.4087142, -1.036762, 1, 1, 1, 1, 1,
-0.2432024, 0.01988591, -2.348009, 1, 1, 1, 1, 1,
-0.2409483, -1.025413, -2.815904, 1, 1, 1, 1, 1,
-0.2373164, -0.6143827, -4.832559, 1, 1, 1, 1, 1,
-0.2298735, -0.8517449, -2.900655, 1, 1, 1, 1, 1,
-0.2296475, 0.4352982, -1.268523, 1, 1, 1, 1, 1,
-0.2295358, 1.241649, 1.740808, 0, 0, 1, 1, 1,
-0.2274132, -0.08525216, -1.508816, 1, 0, 0, 1, 1,
-0.2232573, -0.6180719, -2.920613, 1, 0, 0, 1, 1,
-0.2182893, -1.714618, -2.911937, 1, 0, 0, 1, 1,
-0.2139079, 0.93376, -1.38213, 1, 0, 0, 1, 1,
-0.2127221, -1.999832, -4.250789, 1, 0, 0, 1, 1,
-0.2119832, -1.198012, -2.63976, 0, 0, 0, 1, 1,
-0.210707, -0.3808999, -2.238676, 0, 0, 0, 1, 1,
-0.2037191, 0.6530595, -0.5255206, 0, 0, 0, 1, 1,
-0.1995229, -0.1323477, -2.45233, 0, 0, 0, 1, 1,
-0.1958622, 0.3579634, 0.8707042, 0, 0, 0, 1, 1,
-0.1955844, -0.9241177, -3.016468, 0, 0, 0, 1, 1,
-0.1939725, 0.4971477, -0.192526, 0, 0, 0, 1, 1,
-0.1916726, 1.518859, -1.192379, 1, 1, 1, 1, 1,
-0.1893672, 2.153803, -1.775566, 1, 1, 1, 1, 1,
-0.1871378, 0.2651534, -1.480249, 1, 1, 1, 1, 1,
-0.1865375, 0.8733036, -2.453541, 1, 1, 1, 1, 1,
-0.1855218, 0.3641582, -0.6825905, 1, 1, 1, 1, 1,
-0.1839258, 0.9039332, -0.190999, 1, 1, 1, 1, 1,
-0.1820517, -1.292254, -1.96299, 1, 1, 1, 1, 1,
-0.1808923, -0.2133013, -3.145325, 1, 1, 1, 1, 1,
-0.173367, -0.4849321, -2.825919, 1, 1, 1, 1, 1,
-0.170307, -0.08513528, -3.662137, 1, 1, 1, 1, 1,
-0.1684135, 0.9807987, 0.08550564, 1, 1, 1, 1, 1,
-0.1666377, 1.723805, -0.1779697, 1, 1, 1, 1, 1,
-0.1665451, -0.09337571, -2.558033, 1, 1, 1, 1, 1,
-0.1657377, 1.691177, -1.423167, 1, 1, 1, 1, 1,
-0.1647634, -0.6904657, -3.282626, 1, 1, 1, 1, 1,
-0.1613771, 0.9163005, 0.002375703, 0, 0, 1, 1, 1,
-0.1580477, 0.2044808, 0.4685404, 1, 0, 0, 1, 1,
-0.1573046, 0.06211188, -1.819487, 1, 0, 0, 1, 1,
-0.1521277, -0.9285309, -1.417317, 1, 0, 0, 1, 1,
-0.150842, -2.54236, -3.966009, 1, 0, 0, 1, 1,
-0.1503112, 0.8173125, -0.4831419, 1, 0, 0, 1, 1,
-0.1493372, 2.041129, 0.2614121, 0, 0, 0, 1, 1,
-0.14866, 1.26792, -1.432434, 0, 0, 0, 1, 1,
-0.148517, -1.208367, -4.163094, 0, 0, 0, 1, 1,
-0.1472674, 0.6546909, -1.397346, 0, 0, 0, 1, 1,
-0.1465118, -0.07724375, -3.678244, 0, 0, 0, 1, 1,
-0.1459865, 0.8930465, -1.448077, 0, 0, 0, 1, 1,
-0.1452708, -0.3348964, -3.651984, 0, 0, 0, 1, 1,
-0.1446773, 1.496773, 0.7938512, 1, 1, 1, 1, 1,
-0.1445241, 0.8922716, -0.4556718, 1, 1, 1, 1, 1,
-0.1427238, -0.2219926, -3.073523, 1, 1, 1, 1, 1,
-0.141397, 0.2738655, 0.2231267, 1, 1, 1, 1, 1,
-0.1369457, -0.6386446, -2.651259, 1, 1, 1, 1, 1,
-0.1359443, 1.68348, 0.6682694, 1, 1, 1, 1, 1,
-0.1342002, -1.065074, -2.069197, 1, 1, 1, 1, 1,
-0.1322601, 0.2254573, 0.6229357, 1, 1, 1, 1, 1,
-0.1298287, 1.043213, -0.3356661, 1, 1, 1, 1, 1,
-0.1259793, 2.064354, -1.138065, 1, 1, 1, 1, 1,
-0.1222188, 0.5538827, 0.756329, 1, 1, 1, 1, 1,
-0.1220902, 0.9826661, -0.6516904, 1, 1, 1, 1, 1,
-0.1202955, 0.0212314, -2.18782, 1, 1, 1, 1, 1,
-0.1116348, -2.795823, 0.105307, 1, 1, 1, 1, 1,
-0.1061226, 1.964752, -0.7487953, 1, 1, 1, 1, 1,
-0.09751381, -0.837892, -2.976051, 0, 0, 1, 1, 1,
-0.09546475, -0.9797431, -2.877391, 1, 0, 0, 1, 1,
-0.0913353, -0.7135337, -2.796788, 1, 0, 0, 1, 1,
-0.08330441, 0.5068792, -0.3667953, 1, 0, 0, 1, 1,
-0.08280747, 0.9353514, 1.617757, 1, 0, 0, 1, 1,
-0.07850261, -0.8402439, -3.448715, 1, 0, 0, 1, 1,
-0.07677913, -0.6140726, -1.284129, 0, 0, 0, 1, 1,
-0.07297906, 0.5041324, -0.04712174, 0, 0, 0, 1, 1,
-0.06998743, -1.257463, -0.856109, 0, 0, 0, 1, 1,
-0.06888492, 1.422936, -0.9407837, 0, 0, 0, 1, 1,
-0.06771798, 0.9285905, -0.3748646, 0, 0, 0, 1, 1,
-0.06625413, -0.5707333, -1.350197, 0, 0, 0, 1, 1,
-0.06614282, 0.3534176, 0.2092826, 0, 0, 0, 1, 1,
-0.06335022, -0.225493, -2.181178, 1, 1, 1, 1, 1,
-0.0626133, -0.09701943, -2.285534, 1, 1, 1, 1, 1,
-0.05901577, -0.3549813, -3.562438, 1, 1, 1, 1, 1,
-0.0590073, -0.8655078, -3.437018, 1, 1, 1, 1, 1,
-0.05096288, -1.900057, -3.486598, 1, 1, 1, 1, 1,
-0.04731988, -0.3353346, -2.018843, 1, 1, 1, 1, 1,
-0.04416436, -1.202547, -3.002236, 1, 1, 1, 1, 1,
-0.0441511, -0.4249237, -3.127605, 1, 1, 1, 1, 1,
-0.04349885, 0.8713452, 0.4955414, 1, 1, 1, 1, 1,
-0.03904848, 1.051095, 1.317094, 1, 1, 1, 1, 1,
-0.03567591, -0.726631, -2.813766, 1, 1, 1, 1, 1,
-0.03340145, -0.1377874, -2.260603, 1, 1, 1, 1, 1,
-0.03251022, -1.061967, -2.961475, 1, 1, 1, 1, 1,
-0.02781079, 1.17069, 1.304955, 1, 1, 1, 1, 1,
-0.01863836, -0.321175, -4.020701, 1, 1, 1, 1, 1,
-0.01828089, 2.324551, -0.8458573, 0, 0, 1, 1, 1,
-0.01775635, -0.2887323, -3.126746, 1, 0, 0, 1, 1,
-0.01764455, 1.594652, -0.2804431, 1, 0, 0, 1, 1,
-0.009919183, 0.4457633, 0.1972563, 1, 0, 0, 1, 1,
-0.009330081, -0.2833423, -3.728024, 1, 0, 0, 1, 1,
0.005273551, -0.08355761, 1.923585, 1, 0, 0, 1, 1,
0.006380839, -0.4103171, 2.448742, 0, 0, 0, 1, 1,
0.008236761, -0.02842091, 5.242087, 0, 0, 0, 1, 1,
0.01108189, 0.6597196, 0.09132439, 0, 0, 0, 1, 1,
0.01433542, 0.4281918, -2.317193, 0, 0, 0, 1, 1,
0.01637585, 0.9893857, -0.1686055, 0, 0, 0, 1, 1,
0.02305204, 0.7524671, 0.9873255, 0, 0, 0, 1, 1,
0.02772902, 1.065527, -0.6607453, 0, 0, 0, 1, 1,
0.03002317, 0.7845073, 0.3885176, 1, 1, 1, 1, 1,
0.03473338, -0.9656956, 4.613312, 1, 1, 1, 1, 1,
0.03704223, 0.8081082, 0.7045876, 1, 1, 1, 1, 1,
0.03794058, 0.4463992, 0.5314101, 1, 1, 1, 1, 1,
0.03956295, -0.8814086, 4.31729, 1, 1, 1, 1, 1,
0.0409095, 0.02326839, 1.849231, 1, 1, 1, 1, 1,
0.04195653, -1.034645, 3.640748, 1, 1, 1, 1, 1,
0.04605492, -0.2274987, 4.131536, 1, 1, 1, 1, 1,
0.04620082, 0.08239818, 1.158906, 1, 1, 1, 1, 1,
0.04663201, 1.356007, -1.879071, 1, 1, 1, 1, 1,
0.04735641, 0.401412, 0.6585973, 1, 1, 1, 1, 1,
0.04751171, 0.3646367, 1.030153, 1, 1, 1, 1, 1,
0.04784399, -1.004351, 1.848069, 1, 1, 1, 1, 1,
0.05827496, -0.4012952, 1.943475, 1, 1, 1, 1, 1,
0.05845658, -0.2689245, 4.116824, 1, 1, 1, 1, 1,
0.06039768, -1.730481, 3.826615, 0, 0, 1, 1, 1,
0.06110008, -0.4997808, 2.966777, 1, 0, 0, 1, 1,
0.06254045, -0.9776422, 2.368024, 1, 0, 0, 1, 1,
0.06787952, -0.6680461, 3.188524, 1, 0, 0, 1, 1,
0.06890937, 0.4706459, -1.425858, 1, 0, 0, 1, 1,
0.07048235, -0.2064447, 2.877399, 1, 0, 0, 1, 1,
0.0711963, -0.6969838, 4.027407, 0, 0, 0, 1, 1,
0.07365397, -0.6229637, 1.972195, 0, 0, 0, 1, 1,
0.07984471, -0.1058098, 3.125597, 0, 0, 0, 1, 1,
0.08132477, -0.7281917, 5.310164, 0, 0, 0, 1, 1,
0.08222587, 1.07915, 0.3417233, 0, 0, 0, 1, 1,
0.08384056, -0.2807396, 2.25841, 0, 0, 0, 1, 1,
0.08555536, -1.339583, 3.319454, 0, 0, 0, 1, 1,
0.09603783, 0.5021453, -0.5944989, 1, 1, 1, 1, 1,
0.09641191, 1.030184, -0.2605387, 1, 1, 1, 1, 1,
0.09713744, 1.017257, 0.392391, 1, 1, 1, 1, 1,
0.0975523, 0.7149851, 1.155315, 1, 1, 1, 1, 1,
0.09966933, -2.266295, 4.014269, 1, 1, 1, 1, 1,
0.1032091, -1.403156, 3.750176, 1, 1, 1, 1, 1,
0.1080257, -0.9485127, 4.267821, 1, 1, 1, 1, 1,
0.1099141, -1.439477, 4.302635, 1, 1, 1, 1, 1,
0.117232, 0.7413521, -0.2541807, 1, 1, 1, 1, 1,
0.1191177, -0.1618995, 3.121717, 1, 1, 1, 1, 1,
0.11933, -0.03061218, 0.9248216, 1, 1, 1, 1, 1,
0.1225354, -0.908996, 2.954216, 1, 1, 1, 1, 1,
0.1241126, -0.2135359, 4.522907, 1, 1, 1, 1, 1,
0.1271129, 0.5858678, 0.6940101, 1, 1, 1, 1, 1,
0.1362465, 0.4375, -0.03947544, 1, 1, 1, 1, 1,
0.1373707, 1.314921, -0.2918398, 0, 0, 1, 1, 1,
0.1395459, 0.2796041, 0.3369615, 1, 0, 0, 1, 1,
0.1423151, 2.098183, -2.527495, 1, 0, 0, 1, 1,
0.1437006, -0.5255361, 4.238556, 1, 0, 0, 1, 1,
0.1520784, 0.5543069, -0.1146938, 1, 0, 0, 1, 1,
0.1527091, 2.320036, -0.6256426, 1, 0, 0, 1, 1,
0.1569782, 1.226578, 0.3229281, 0, 0, 0, 1, 1,
0.1574504, 0.02766978, 1.70836, 0, 0, 0, 1, 1,
0.1577345, -1.139773, 5.823379, 0, 0, 0, 1, 1,
0.1653939, 0.89389, 1.760478, 0, 0, 0, 1, 1,
0.1654548, -0.5796025, 1.643523, 0, 0, 0, 1, 1,
0.1656837, 0.1078091, 0.9276, 0, 0, 0, 1, 1,
0.1666235, -0.4870255, 0.2874199, 0, 0, 0, 1, 1,
0.1673956, 1.987288, -0.3685942, 1, 1, 1, 1, 1,
0.1694277, 1.205359, 0.9580597, 1, 1, 1, 1, 1,
0.1709609, -1.131952, 3.399373, 1, 1, 1, 1, 1,
0.1717508, 0.4653113, 0.02620416, 1, 1, 1, 1, 1,
0.1763882, 0.8751429, -1.310213, 1, 1, 1, 1, 1,
0.1763913, -0.9194291, 2.450811, 1, 1, 1, 1, 1,
0.1801316, 0.9540172, -0.927266, 1, 1, 1, 1, 1,
0.1853844, -0.8798471, 2.983973, 1, 1, 1, 1, 1,
0.1883138, -1.740418, 2.331227, 1, 1, 1, 1, 1,
0.1885624, -0.315831, 2.598122, 1, 1, 1, 1, 1,
0.1918085, 0.4134403, 1.550279, 1, 1, 1, 1, 1,
0.2013179, -1.463498, 3.386947, 1, 1, 1, 1, 1,
0.2072792, 0.1468936, -0.1728874, 1, 1, 1, 1, 1,
0.2076069, 0.5466758, -1.229998, 1, 1, 1, 1, 1,
0.2093083, -0.02329564, 1.248237, 1, 1, 1, 1, 1,
0.2126487, -0.0487702, -0.6137124, 0, 0, 1, 1, 1,
0.2154429, 1.03049, 0.2385594, 1, 0, 0, 1, 1,
0.2154808, -0.6336775, 3.59039, 1, 0, 0, 1, 1,
0.2216381, -0.4754923, 1.859597, 1, 0, 0, 1, 1,
0.2268359, -1.600276, 2.310505, 1, 0, 0, 1, 1,
0.2270751, -1.31755, 2.939612, 1, 0, 0, 1, 1,
0.2275745, -0.3446343, 2.146198, 0, 0, 0, 1, 1,
0.2291903, 1.203744, 0.1612012, 0, 0, 0, 1, 1,
0.2357252, 0.06864069, 3.454347, 0, 0, 0, 1, 1,
0.2360306, 0.1154439, 0.3839057, 0, 0, 0, 1, 1,
0.2370327, -0.3009448, 1.878503, 0, 0, 0, 1, 1,
0.2390575, 0.9547047, -2.079777, 0, 0, 0, 1, 1,
0.2414824, 0.1366877, 0.07271873, 0, 0, 0, 1, 1,
0.2423163, -0.4384288, 1.475718, 1, 1, 1, 1, 1,
0.2497809, 0.6695367, -0.4180943, 1, 1, 1, 1, 1,
0.258995, 0.809275, 1.592519, 1, 1, 1, 1, 1,
0.262012, 1.002116, -0.3813893, 1, 1, 1, 1, 1,
0.2625836, 0.516506, -0.45623, 1, 1, 1, 1, 1,
0.2658452, 0.3333386, 1.22287, 1, 1, 1, 1, 1,
0.2713077, -0.1444112, 3.184268, 1, 1, 1, 1, 1,
0.2718355, 0.7617813, -0.7500994, 1, 1, 1, 1, 1,
0.2724775, -1.834808, 2.221318, 1, 1, 1, 1, 1,
0.2727264, -0.1175288, 0.7291659, 1, 1, 1, 1, 1,
0.2734177, 0.1352802, 0.4787601, 1, 1, 1, 1, 1,
0.2765034, -0.4635469, 0.9623636, 1, 1, 1, 1, 1,
0.2784653, -1.70435, 2.290954, 1, 1, 1, 1, 1,
0.2796275, 1.132862, 0.1649375, 1, 1, 1, 1, 1,
0.2815832, -0.5000948, 1.591487, 1, 1, 1, 1, 1,
0.2859675, -0.801747, 3.80311, 0, 0, 1, 1, 1,
0.2915653, 2.81517, -0.4837828, 1, 0, 0, 1, 1,
0.2975691, 0.8884581, 2.054824, 1, 0, 0, 1, 1,
0.2986634, -0.4477986, 2.548558, 1, 0, 0, 1, 1,
0.2990845, 0.6555509, -0.8406415, 1, 0, 0, 1, 1,
0.2998765, -0.2851152, 3.127933, 1, 0, 0, 1, 1,
0.3022339, 0.2934689, 0.6785018, 0, 0, 0, 1, 1,
0.302327, -0.9834207, 2.575509, 0, 0, 0, 1, 1,
0.3023595, 0.8631725, 1.322795, 0, 0, 0, 1, 1,
0.3027321, -0.8817146, 3.92443, 0, 0, 0, 1, 1,
0.3067683, -0.9419256, 1.650566, 0, 0, 0, 1, 1,
0.3083594, -0.592293, 0.5880637, 0, 0, 0, 1, 1,
0.3121296, -0.3653925, 1.084648, 0, 0, 0, 1, 1,
0.3132389, 0.4078818, 1.324856, 1, 1, 1, 1, 1,
0.3137118, 0.8248065, 0.9368528, 1, 1, 1, 1, 1,
0.3143163, 1.952363, -0.9070947, 1, 1, 1, 1, 1,
0.3158145, -0.1069012, 3.164799, 1, 1, 1, 1, 1,
0.3196376, -1.183673, 2.682999, 1, 1, 1, 1, 1,
0.3210907, -0.3274032, 1.842201, 1, 1, 1, 1, 1,
0.3244889, -2.038511, 3.844692, 1, 1, 1, 1, 1,
0.3259614, -0.1162602, 2.227321, 1, 1, 1, 1, 1,
0.3269337, 0.1234967, 1.372923, 1, 1, 1, 1, 1,
0.3298205, 1.650294, 0.8783597, 1, 1, 1, 1, 1,
0.3362962, 1.175707, -0.1060358, 1, 1, 1, 1, 1,
0.3382924, -0.3841614, 3.152163, 1, 1, 1, 1, 1,
0.3419296, 1.462008, 0.1440761, 1, 1, 1, 1, 1,
0.3480206, 0.2480385, 0.03350607, 1, 1, 1, 1, 1,
0.3481574, -1.158621, 3.072444, 1, 1, 1, 1, 1,
0.3491194, 0.002348582, -0.1031674, 0, 0, 1, 1, 1,
0.3516935, 0.8134224, 1.013593, 1, 0, 0, 1, 1,
0.3517964, 0.6277099, 0.4662384, 1, 0, 0, 1, 1,
0.3623026, 2.011733, 2.143255, 1, 0, 0, 1, 1,
0.3624748, -0.2133421, 2.55988, 1, 0, 0, 1, 1,
0.3694285, -0.08830509, 1.741301, 1, 0, 0, 1, 1,
0.3806756, 1.413633, 0.9090651, 0, 0, 0, 1, 1,
0.3811484, -0.659656, 4.373447, 0, 0, 0, 1, 1,
0.3815725, -0.7815774, 3.343889, 0, 0, 0, 1, 1,
0.3827784, 1.925504, 0.5623608, 0, 0, 0, 1, 1,
0.3831534, -0.02885001, 1.789547, 0, 0, 0, 1, 1,
0.3852385, 0.2768738, 0.2699226, 0, 0, 0, 1, 1,
0.3886615, 0.1110136, 0.935035, 0, 0, 0, 1, 1,
0.3903103, -0.921493, 2.342232, 1, 1, 1, 1, 1,
0.3990191, 1.09636, -0.5540562, 1, 1, 1, 1, 1,
0.4065353, -1.047137, 2.146836, 1, 1, 1, 1, 1,
0.4075227, 0.6858529, 0.5554279, 1, 1, 1, 1, 1,
0.4201797, -0.697596, 2.747289, 1, 1, 1, 1, 1,
0.42255, -1.561643, 2.893374, 1, 1, 1, 1, 1,
0.4238415, -0.05404658, 0.7220813, 1, 1, 1, 1, 1,
0.4252903, 0.5214086, 0.2354074, 1, 1, 1, 1, 1,
0.4293528, -0.1856593, 2.149554, 1, 1, 1, 1, 1,
0.4310411, 0.1832021, 0.5703043, 1, 1, 1, 1, 1,
0.4325896, -0.07699642, 1.211131, 1, 1, 1, 1, 1,
0.433153, 0.4940445, 0.7150099, 1, 1, 1, 1, 1,
0.4353527, 0.2793404, 0.6944603, 1, 1, 1, 1, 1,
0.43565, 0.2625064, -0.2990935, 1, 1, 1, 1, 1,
0.4369467, -1.037107, 2.302514, 1, 1, 1, 1, 1,
0.4404579, -2.632125, 2.59813, 0, 0, 1, 1, 1,
0.4435218, -0.4719876, 1.295067, 1, 0, 0, 1, 1,
0.4502525, -0.570502, 3.455986, 1, 0, 0, 1, 1,
0.4519689, -0.8953318, 3.028119, 1, 0, 0, 1, 1,
0.4521538, 0.5737821, 1.15179, 1, 0, 0, 1, 1,
0.4552379, 1.109505, 1.154513, 1, 0, 0, 1, 1,
0.4604917, -0.3333192, 3.029043, 0, 0, 0, 1, 1,
0.4606213, -0.7576429, 1.388498, 0, 0, 0, 1, 1,
0.4608308, -0.3965081, 2.15247, 0, 0, 0, 1, 1,
0.4631233, -0.7194875, 1.28242, 0, 0, 0, 1, 1,
0.4691033, -0.02981187, -0.04739211, 0, 0, 0, 1, 1,
0.4691861, 0.8891305, -0.07901795, 0, 0, 0, 1, 1,
0.4693599, -1.185209, 1.4363, 0, 0, 0, 1, 1,
0.4739484, -0.4458129, 1.535307, 1, 1, 1, 1, 1,
0.479826, 1.922436, -0.3317288, 1, 1, 1, 1, 1,
0.4801224, -1.246778, 3.217825, 1, 1, 1, 1, 1,
0.4817835, -0.003920202, 1.544835, 1, 1, 1, 1, 1,
0.4853348, 1.64252, 1.034004, 1, 1, 1, 1, 1,
0.4868153, 2.438662, 0.4972535, 1, 1, 1, 1, 1,
0.4875865, -2.824444, 4.076763, 1, 1, 1, 1, 1,
0.489668, -0.4189085, 4.668987, 1, 1, 1, 1, 1,
0.4923166, 0.5187343, 0.2114958, 1, 1, 1, 1, 1,
0.4941939, -0.6103573, 2.588825, 1, 1, 1, 1, 1,
0.4979413, -0.9999252, 2.655021, 1, 1, 1, 1, 1,
0.4998563, 0.837584, 1.783556, 1, 1, 1, 1, 1,
0.504685, 0.3717008, 1.567654, 1, 1, 1, 1, 1,
0.5066904, -1.000743, 3.006849, 1, 1, 1, 1, 1,
0.5067242, -0.7712381, 2.577278, 1, 1, 1, 1, 1,
0.5109262, 0.6959944, 0.7957685, 0, 0, 1, 1, 1,
0.5126148, 1.273614, 0.2178957, 1, 0, 0, 1, 1,
0.518728, 0.105303, 1.693389, 1, 0, 0, 1, 1,
0.5200869, 0.07237531, 0.8005875, 1, 0, 0, 1, 1,
0.528414, 0.07114068, 0.05942953, 1, 0, 0, 1, 1,
0.5313758, -2.030799, 3.88118, 1, 0, 0, 1, 1,
0.5316702, -0.5525073, 3.167756, 0, 0, 0, 1, 1,
0.5365943, 0.5156356, 1.162711, 0, 0, 0, 1, 1,
0.5417286, -1.213887, 2.202972, 0, 0, 0, 1, 1,
0.5424936, 0.03072792, 2.011002, 0, 0, 0, 1, 1,
0.5443453, 0.4102219, 1.557442, 0, 0, 0, 1, 1,
0.5488312, -0.04997022, 4.345003, 0, 0, 0, 1, 1,
0.5506057, -0.9672433, 2.146022, 0, 0, 0, 1, 1,
0.5527439, -0.08105967, 1.980461, 1, 1, 1, 1, 1,
0.5527542, 0.0661926, 0.8782548, 1, 1, 1, 1, 1,
0.5541652, -0.1138492, 2.488612, 1, 1, 1, 1, 1,
0.5593746, 0.3958884, -0.6624802, 1, 1, 1, 1, 1,
0.5606227, -0.7835048, 2.453753, 1, 1, 1, 1, 1,
0.5620067, 0.4718252, 0.477431, 1, 1, 1, 1, 1,
0.5631543, -0.9463738, 3.336522, 1, 1, 1, 1, 1,
0.564845, 1.573195, 0.09239475, 1, 1, 1, 1, 1,
0.5674039, 0.8291223, -0.2293595, 1, 1, 1, 1, 1,
0.5682641, -0.7004576, 2.75673, 1, 1, 1, 1, 1,
0.5683822, -0.0260776, 0.6433306, 1, 1, 1, 1, 1,
0.5705276, -1.440962, -0.03942948, 1, 1, 1, 1, 1,
0.5715281, 0.1203413, 0.5863172, 1, 1, 1, 1, 1,
0.5719954, 0.2485504, -0.6002157, 1, 1, 1, 1, 1,
0.5720145, 1.127887, -1.568252, 1, 1, 1, 1, 1,
0.5724421, 1.371243, 0.46243, 0, 0, 1, 1, 1,
0.5750234, -0.2093713, 2.627731, 1, 0, 0, 1, 1,
0.5790371, 0.2808865, 1.782403, 1, 0, 0, 1, 1,
0.5819418, -0.06573837, 0.2411717, 1, 0, 0, 1, 1,
0.5860121, 1.509184, 0.5927159, 1, 0, 0, 1, 1,
0.5862596, -0.2068673, 3.285356, 1, 0, 0, 1, 1,
0.5877225, -0.0946762, 0.3581244, 0, 0, 0, 1, 1,
0.5889964, -0.01262934, 1.788566, 0, 0, 0, 1, 1,
0.590607, -0.2891414, 1.499081, 0, 0, 0, 1, 1,
0.5914405, -1.256758, 4.183646, 0, 0, 0, 1, 1,
0.5974222, 0.1526815, 1.244277, 0, 0, 0, 1, 1,
0.6005393, 1.36777, -2.183686, 0, 0, 0, 1, 1,
0.601788, -0.8480026, 2.312407, 0, 0, 0, 1, 1,
0.6036118, -1.209824, 4.479216, 1, 1, 1, 1, 1,
0.606034, 1.052868, 1.984363, 1, 1, 1, 1, 1,
0.6160849, 0.8028765, 2.409429, 1, 1, 1, 1, 1,
0.6467704, 0.7210323, 1.592301, 1, 1, 1, 1, 1,
0.6488007, 1.298063, 1.719848, 1, 1, 1, 1, 1,
0.6569936, 0.6356907, 0.2026569, 1, 1, 1, 1, 1,
0.6610969, -0.1288916, 2.005835, 1, 1, 1, 1, 1,
0.6612744, -0.88858, 2.864272, 1, 1, 1, 1, 1,
0.6628866, -0.6854966, 0.7566436, 1, 1, 1, 1, 1,
0.6807598, 0.3792391, -0.944714, 1, 1, 1, 1, 1,
0.6813378, -0.01216705, 1.886555, 1, 1, 1, 1, 1,
0.6816405, 1.162858, 2.053156, 1, 1, 1, 1, 1,
0.6823042, -0.3980709, 2.881839, 1, 1, 1, 1, 1,
0.6865387, -0.8853855, 1.294807, 1, 1, 1, 1, 1,
0.6900063, 0.6534733, 0.5946988, 1, 1, 1, 1, 1,
0.6903483, 0.6045754, 0.4320792, 0, 0, 1, 1, 1,
0.6959251, -0.9915581, 2.53399, 1, 0, 0, 1, 1,
0.6981996, -0.5555563, 0.9885292, 1, 0, 0, 1, 1,
0.700857, 0.6741997, 0.8010504, 1, 0, 0, 1, 1,
0.702165, -1.704371, 2.521377, 1, 0, 0, 1, 1,
0.7068833, 1.430392, 0.3040673, 1, 0, 0, 1, 1,
0.708204, 1.936168, 1.258408, 0, 0, 0, 1, 1,
0.7086887, -0.895995, 2.983309, 0, 0, 0, 1, 1,
0.7116963, -0.8254644, 1.813483, 0, 0, 0, 1, 1,
0.7133827, -1.309593, 3.3155, 0, 0, 0, 1, 1,
0.7149886, -0.58836, 1.228973, 0, 0, 0, 1, 1,
0.7182856, -0.9704127, 3.937885, 0, 0, 0, 1, 1,
0.7207059, -0.126761, 2.437679, 0, 0, 0, 1, 1,
0.723372, -0.5855021, 0.5083113, 1, 1, 1, 1, 1,
0.7260643, -1.263134, 3.830321, 1, 1, 1, 1, 1,
0.7266712, 0.8088926, 0.7393218, 1, 1, 1, 1, 1,
0.7276372, -0.4960475, 2.067121, 1, 1, 1, 1, 1,
0.7282, 0.4514419, -0.4451628, 1, 1, 1, 1, 1,
0.7284186, 0.2761191, 1.596455, 1, 1, 1, 1, 1,
0.7300904, 1.012139, 0.1631164, 1, 1, 1, 1, 1,
0.7308385, 1.36612, 1.60714, 1, 1, 1, 1, 1,
0.7315016, -0.3657599, 3.032395, 1, 1, 1, 1, 1,
0.7329698, 0.1564406, -0.1441927, 1, 1, 1, 1, 1,
0.7338973, -1.849692, 3.828135, 1, 1, 1, 1, 1,
0.7363012, -0.2557296, 2.390375, 1, 1, 1, 1, 1,
0.7396537, 0.1800947, 1.126964, 1, 1, 1, 1, 1,
0.7410596, -0.008985708, 1.261368, 1, 1, 1, 1, 1,
0.7426518, -0.6143457, 3.484297, 1, 1, 1, 1, 1,
0.7506688, -0.2893521, 1.363487, 0, 0, 1, 1, 1,
0.7598835, -0.2965848, 1.584005, 1, 0, 0, 1, 1,
0.7646693, 0.240503, 2.699074, 1, 0, 0, 1, 1,
0.7656201, -0.8318236, 4.831169, 1, 0, 0, 1, 1,
0.7670299, 0.7510933, -0.2690028, 1, 0, 0, 1, 1,
0.7692146, 1.857218, 0.4098715, 1, 0, 0, 1, 1,
0.7717103, 0.4649016, -0.09023467, 0, 0, 0, 1, 1,
0.7778175, -0.245687, 1.407014, 0, 0, 0, 1, 1,
0.7805411, -0.07095422, 1.468992, 0, 0, 0, 1, 1,
0.7818303, -1.172986, 1.014118, 0, 0, 0, 1, 1,
0.7852598, -0.06541323, 1.315311, 0, 0, 0, 1, 1,
0.7948735, 0.03114804, 3.675529, 0, 0, 0, 1, 1,
0.8024972, -1.191426, 1.93426, 0, 0, 0, 1, 1,
0.8066064, 1.482375, 0.6060652, 1, 1, 1, 1, 1,
0.8066114, 0.7927517, -0.3766924, 1, 1, 1, 1, 1,
0.8088594, 0.02654699, 1.164071, 1, 1, 1, 1, 1,
0.81048, 0.1716641, 1.149578, 1, 1, 1, 1, 1,
0.8139144, 1.454698, 2.879092, 1, 1, 1, 1, 1,
0.8140059, 1.928684, 0.5433857, 1, 1, 1, 1, 1,
0.8171571, -0.007268656, 1.692246, 1, 1, 1, 1, 1,
0.820019, -0.2325413, 1.232883, 1, 1, 1, 1, 1,
0.8204727, 0.02657695, 0.07942736, 1, 1, 1, 1, 1,
0.8231254, -2.28341, 2.236023, 1, 1, 1, 1, 1,
0.824461, -0.4480998, 3.042657, 1, 1, 1, 1, 1,
0.8260725, 1.00361, 1.619164, 1, 1, 1, 1, 1,
0.8295979, -0.476081, 0.993638, 1, 1, 1, 1, 1,
0.8311342, -0.02922719, 0.4064699, 1, 1, 1, 1, 1,
0.8313739, -0.2448795, 1.198986, 1, 1, 1, 1, 1,
0.8339052, 1.141567, 0.2458329, 0, 0, 1, 1, 1,
0.8342497, -1.661485, 2.570901, 1, 0, 0, 1, 1,
0.836868, 1.548637, 1.280013, 1, 0, 0, 1, 1,
0.8472772, 1.100147, -0.8012577, 1, 0, 0, 1, 1,
0.8494975, -2.623498, 2.229048, 1, 0, 0, 1, 1,
0.8512293, -0.3346376, 1.101817, 1, 0, 0, 1, 1,
0.8741478, 0.6878793, -0.6083576, 0, 0, 0, 1, 1,
0.8759245, -0.5786357, 2.518882, 0, 0, 0, 1, 1,
0.8805692, -1.310539, 2.18149, 0, 0, 0, 1, 1,
0.8851227, -2.034071, 2.676939, 0, 0, 0, 1, 1,
0.8883486, 0.8259749, 3.437572, 0, 0, 0, 1, 1,
0.8885954, -0.5681903, 2.434985, 0, 0, 0, 1, 1,
0.8932696, 0.6697214, 1.154994, 0, 0, 0, 1, 1,
0.8944546, -0.6415634, 3.436063, 1, 1, 1, 1, 1,
0.9022799, -1.146651, 1.947449, 1, 1, 1, 1, 1,
0.9023917, -1.295641, 3.761132, 1, 1, 1, 1, 1,
0.9056434, -0.1105002, 0.6703101, 1, 1, 1, 1, 1,
0.9078487, -0.04478734, 1.104534, 1, 1, 1, 1, 1,
0.9381468, 0.2214308, 1.625543, 1, 1, 1, 1, 1,
0.9471908, 0.3229978, 1.58467, 1, 1, 1, 1, 1,
0.9476941, 0.130175, 3.017672, 1, 1, 1, 1, 1,
0.9496807, 0.4801668, -0.4599377, 1, 1, 1, 1, 1,
0.9548279, 0.3545835, 2.883354, 1, 1, 1, 1, 1,
0.9586021, -0.08922865, 2.506816, 1, 1, 1, 1, 1,
0.9589865, -1.274644, 3.994747, 1, 1, 1, 1, 1,
0.9592469, -1.849603, 3.363976, 1, 1, 1, 1, 1,
0.960789, -0.8266348, 2.580283, 1, 1, 1, 1, 1,
0.9638942, -1.266457, 5.022452, 1, 1, 1, 1, 1,
0.9686345, -0.8596982, 0.341421, 0, 0, 1, 1, 1,
0.9716018, 1.624224, -0.1483959, 1, 0, 0, 1, 1,
0.9738891, 0.4948538, 1.442369, 1, 0, 0, 1, 1,
0.9745589, -1.143419, 1.169925, 1, 0, 0, 1, 1,
0.9824847, 1.00879, 1.71597, 1, 0, 0, 1, 1,
0.985889, -0.1554565, 2.220865, 1, 0, 0, 1, 1,
0.9865016, 1.414933, 2.239342, 0, 0, 0, 1, 1,
0.991933, 0.795019, 1.855645, 0, 0, 0, 1, 1,
0.9920193, 1.4395, 0.844097, 0, 0, 0, 1, 1,
1.003376, 0.3125751, 2.326233, 0, 0, 0, 1, 1,
1.008871, 1.626518, -0.5844672, 0, 0, 0, 1, 1,
1.010449, -1.104723, 2.005505, 0, 0, 0, 1, 1,
1.011755, -1.394201, 3.61748, 0, 0, 0, 1, 1,
1.025522, 1.965074, 1.216923, 1, 1, 1, 1, 1,
1.028964, -0.04677335, 1.677401, 1, 1, 1, 1, 1,
1.034923, 0.25567, -0.2564758, 1, 1, 1, 1, 1,
1.036109, -1.088897, 1.449668, 1, 1, 1, 1, 1,
1.036983, -1.404509, 3.170171, 1, 1, 1, 1, 1,
1.042291, 1.570618, 0.4574363, 1, 1, 1, 1, 1,
1.046517, -1.158918, 3.113043, 1, 1, 1, 1, 1,
1.049433, 1.135654, 0.4463974, 1, 1, 1, 1, 1,
1.061397, 0.804085, 0.6564894, 1, 1, 1, 1, 1,
1.064012, 1.806161, 0.6436833, 1, 1, 1, 1, 1,
1.076295, -1.018938, 1.946185, 1, 1, 1, 1, 1,
1.079808, -0.143693, 2.427423, 1, 1, 1, 1, 1,
1.082842, 0.8021941, 0.605399, 1, 1, 1, 1, 1,
1.094375, 0.6353718, 2.543766, 1, 1, 1, 1, 1,
1.100219, -0.1111441, 2.506055, 1, 1, 1, 1, 1,
1.100974, 0.8217306, 1.546604, 0, 0, 1, 1, 1,
1.106172, -0.397072, 1.655506, 1, 0, 0, 1, 1,
1.106775, 1.155754, 1.341411, 1, 0, 0, 1, 1,
1.107961, 0.04427308, 1.887583, 1, 0, 0, 1, 1,
1.126842, 0.1275184, 2.655574, 1, 0, 0, 1, 1,
1.130599, 0.08531491, 3.338093, 1, 0, 0, 1, 1,
1.132258, -0.005365493, 3.276488, 0, 0, 0, 1, 1,
1.136479, 1.717814, 1.644677, 0, 0, 0, 1, 1,
1.137474, 1.148639, 0.01933778, 0, 0, 0, 1, 1,
1.138243, -0.9358227, 3.625282, 0, 0, 0, 1, 1,
1.152956, -1.166618, 2.404128, 0, 0, 0, 1, 1,
1.154249, 0.2757106, 1.044586, 0, 0, 0, 1, 1,
1.154319, 1.518973, 1.133796, 0, 0, 0, 1, 1,
1.166011, -0.5427544, 3.485151, 1, 1, 1, 1, 1,
1.16723, -0.703393, 2.892501, 1, 1, 1, 1, 1,
1.184561, -0.1222296, 2.267188, 1, 1, 1, 1, 1,
1.195318, 0.7129154, -0.7858713, 1, 1, 1, 1, 1,
1.19564, -0.4590048, 0.2047644, 1, 1, 1, 1, 1,
1.201215, -2.356929, 3.009275, 1, 1, 1, 1, 1,
1.202301, 1.191491, -0.649663, 1, 1, 1, 1, 1,
1.209676, -0.1961347, 0.5513328, 1, 1, 1, 1, 1,
1.213729, -0.1269513, 0.326937, 1, 1, 1, 1, 1,
1.223504, 1.060652, 1.16961, 1, 1, 1, 1, 1,
1.229153, 0.6770835, 0.7943928, 1, 1, 1, 1, 1,
1.248341, -0.3928293, 1.450747, 1, 1, 1, 1, 1,
1.250096, -0.9950463, 2.186195, 1, 1, 1, 1, 1,
1.250996, -0.3043366, 0.7250958, 1, 1, 1, 1, 1,
1.25108, 0.0749773, 1.168832, 1, 1, 1, 1, 1,
1.25196, -0.1790956, 3.608487, 0, 0, 1, 1, 1,
1.253175, 0.2513096, 1.801368, 1, 0, 0, 1, 1,
1.25778, -1.223012, 1.528632, 1, 0, 0, 1, 1,
1.280952, 0.9772765, -0.6686271, 1, 0, 0, 1, 1,
1.287578, 1.241147, 0.8231375, 1, 0, 0, 1, 1,
1.288003, -1.609294, 2.392597, 1, 0, 0, 1, 1,
1.301882, 0.4802961, 3.049238, 0, 0, 0, 1, 1,
1.31984, -0.2082807, 1.424096, 0, 0, 0, 1, 1,
1.325705, -0.8020082, 3.004644, 0, 0, 0, 1, 1,
1.336359, 0.05335043, 0.5037879, 0, 0, 0, 1, 1,
1.338646, 1.025252, 0.5113249, 0, 0, 0, 1, 1,
1.33995, -1.189333, 0.7791864, 0, 0, 0, 1, 1,
1.342297, -0.9224153, 1.635791, 0, 0, 0, 1, 1,
1.346828, -0.9589866, 2.917852, 1, 1, 1, 1, 1,
1.355573, 0.2476591, 1.460831, 1, 1, 1, 1, 1,
1.35929, -0.2641055, 2.701002, 1, 1, 1, 1, 1,
1.375365, -1.024688, 1.755438, 1, 1, 1, 1, 1,
1.383232, 1.280545, 1.528804, 1, 1, 1, 1, 1,
1.388502, 0.1564966, 0.984561, 1, 1, 1, 1, 1,
1.393565, 1.266665, -0.4778027, 1, 1, 1, 1, 1,
1.395625, 1.243469, -1.631214, 1, 1, 1, 1, 1,
1.408868, 0.5164629, 1.339348, 1, 1, 1, 1, 1,
1.410232, -0.6420478, 1.997854, 1, 1, 1, 1, 1,
1.412748, 0.7519407, 0.3568762, 1, 1, 1, 1, 1,
1.413022, 1.135869, 0.6588452, 1, 1, 1, 1, 1,
1.414626, 0.7767671, 2.509567, 1, 1, 1, 1, 1,
1.426046, 0.7605919, 1.865271, 1, 1, 1, 1, 1,
1.428056, 0.6248797, -0.9742179, 1, 1, 1, 1, 1,
1.430483, -0.6559173, 3.669614, 0, 0, 1, 1, 1,
1.435251, -2.627, 3.02277, 1, 0, 0, 1, 1,
1.439423, -0.8315945, 1.671326, 1, 0, 0, 1, 1,
1.44096, 1.306284, 1.820925, 1, 0, 0, 1, 1,
1.441813, 0.1543705, 1.283163, 1, 0, 0, 1, 1,
1.448169, 1.032116, 1.49434, 1, 0, 0, 1, 1,
1.460212, -0.1963488, 1.64172, 0, 0, 0, 1, 1,
1.471671, -0.3403907, 0.1029269, 0, 0, 0, 1, 1,
1.472882, -1.035869, 3.309212, 0, 0, 0, 1, 1,
1.477781, 0.7371984, 3.543407, 0, 0, 0, 1, 1,
1.479137, 1.617667, 1.037124, 0, 0, 0, 1, 1,
1.484281, -0.1492981, 1.963735, 0, 0, 0, 1, 1,
1.486902, -2.289105, 2.79882, 0, 0, 0, 1, 1,
1.508695, -0.2904225, 1.272604, 1, 1, 1, 1, 1,
1.524725, 0.9951416, 2.566653, 1, 1, 1, 1, 1,
1.531268, -0.6403757, 3.293543, 1, 1, 1, 1, 1,
1.533387, 0.6672502, 1.04302, 1, 1, 1, 1, 1,
1.534623, 0.6955121, 1.296139, 1, 1, 1, 1, 1,
1.54186, -1.34258, 2.095336, 1, 1, 1, 1, 1,
1.547493, 1.038962, 1.244777, 1, 1, 1, 1, 1,
1.550325, 0.1047282, 2.269342, 1, 1, 1, 1, 1,
1.564013, 1.29684, -0.1985502, 1, 1, 1, 1, 1,
1.594472, -0.2667862, 2.128368, 1, 1, 1, 1, 1,
1.597545, 0.9265741, 1.056477, 1, 1, 1, 1, 1,
1.597797, -0.7551348, 0.2699887, 1, 1, 1, 1, 1,
1.598249, -0.06434087, 2.206201, 1, 1, 1, 1, 1,
1.61043, 0.8497292, 1.890125, 1, 1, 1, 1, 1,
1.621925, -0.1814563, 0.09855001, 1, 1, 1, 1, 1,
1.635472, -0.08695875, 1.053158, 0, 0, 1, 1, 1,
1.643725, -1.623017, 2.36038, 1, 0, 0, 1, 1,
1.654813, 0.1220892, 0.6972708, 1, 0, 0, 1, 1,
1.665174, -0.2564856, 2.310676, 1, 0, 0, 1, 1,
1.686534, -1.079887, 2.808511, 1, 0, 0, 1, 1,
1.712535, 0.3032477, 0.910491, 1, 0, 0, 1, 1,
1.7194, -1.297544, 1.679783, 0, 0, 0, 1, 1,
1.752098, 0.3778642, 3.006361, 0, 0, 0, 1, 1,
1.770398, 1.732979, 0.8990337, 0, 0, 0, 1, 1,
1.77558, 0.8210085, 0.3246489, 0, 0, 0, 1, 1,
1.776408, 1.067752, 3.053091, 0, 0, 0, 1, 1,
1.816979, 1.318477, 1.117575, 0, 0, 0, 1, 1,
1.836485, 0.05540859, 1.875213, 0, 0, 0, 1, 1,
1.838489, 1.537997, 0.3748247, 1, 1, 1, 1, 1,
1.850918, 0.420513, 0.7782381, 1, 1, 1, 1, 1,
1.851516, 0.3750103, 1.646508, 1, 1, 1, 1, 1,
1.860816, 2.495875, 1.033413, 1, 1, 1, 1, 1,
1.86137, 2.282452, 1.718027, 1, 1, 1, 1, 1,
1.880522, 1.010624, 2.356043, 1, 1, 1, 1, 1,
1.88562, -0.6709384, 2.307851, 1, 1, 1, 1, 1,
1.88589, 1.602487, -1.293904, 1, 1, 1, 1, 1,
1.891708, -0.01844263, 1.440939, 1, 1, 1, 1, 1,
1.892584, 0.6448287, 1.393643, 1, 1, 1, 1, 1,
1.930344, -0.2267701, 0.7243458, 1, 1, 1, 1, 1,
1.99795, 0.1081746, 0.4956297, 1, 1, 1, 1, 1,
2.018525, -0.773056, 0.265093, 1, 1, 1, 1, 1,
2.033526, 0.1947328, 1.654675, 1, 1, 1, 1, 1,
2.0526, 0.8192868, 0.9388365, 1, 1, 1, 1, 1,
2.120375, -1.376261, 1.177145, 0, 0, 1, 1, 1,
2.155164, -1.27254, 3.66561, 1, 0, 0, 1, 1,
2.173153, 0.1795074, 3.491824, 1, 0, 0, 1, 1,
2.17839, -0.2683307, 1.516443, 1, 0, 0, 1, 1,
2.179517, 0.4221746, -0.7338026, 1, 0, 0, 1, 1,
2.252524, 0.9742701, 0.8330455, 1, 0, 0, 1, 1,
2.255171, -1.599733, 0.5653502, 0, 0, 0, 1, 1,
2.283667, -1.252676, 2.627424, 0, 0, 0, 1, 1,
2.314159, 1.442849, 1.476778, 0, 0, 0, 1, 1,
2.318998, -0.8684158, 0.615706, 0, 0, 0, 1, 1,
2.323669, -0.4499151, 1.519714, 0, 0, 0, 1, 1,
2.341678, 0.7225953, 1.301477, 0, 0, 0, 1, 1,
2.481468, 0.3383408, 0.3841088, 0, 0, 0, 1, 1,
2.489026, 0.2311742, 1.510944, 1, 1, 1, 1, 1,
2.592681, 0.6936874, 1.039092, 1, 1, 1, 1, 1,
2.605988, -0.2030762, 2.171897, 1, 1, 1, 1, 1,
2.682081, 0.1657661, 1.731376, 1, 1, 1, 1, 1,
2.73001, -0.5210658, 1.70551, 1, 1, 1, 1, 1,
2.790597, 0.9775947, 0.2756414, 1, 1, 1, 1, 1,
2.943202, 1.208377, 0.7572748, 1, 1, 1, 1, 1
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
var radius = 9.291301;
var distance = 32.6353;
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
mvMatrix.translate( 0.100884, -0.02875221, -0.49541 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6353);
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