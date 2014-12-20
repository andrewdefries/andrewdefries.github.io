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
-3.262356, 1.414293, -0.4877544, 1, 0, 0, 1,
-2.623961, -1.112702, -3.887808, 1, 0.007843138, 0, 1,
-2.597396, 0.167084, 0.9805699, 1, 0.01176471, 0, 1,
-2.502271, 0.8917966, -1.361573, 1, 0.01960784, 0, 1,
-2.494066, 0.6545482, -0.5011655, 1, 0.02352941, 0, 1,
-2.396256, -0.2302405, 0.1885252, 1, 0.03137255, 0, 1,
-2.308875, -0.4560758, -1.901979, 1, 0.03529412, 0, 1,
-2.289515, 0.001088477, -0.2034295, 1, 0.04313726, 0, 1,
-2.276582, -1.234138, -0.547318, 1, 0.04705882, 0, 1,
-2.259976, 0.4165767, -1.249742, 1, 0.05490196, 0, 1,
-2.243061, 0.7997164, -2.446476, 1, 0.05882353, 0, 1,
-2.206822, 0.123166, -1.385741, 1, 0.06666667, 0, 1,
-2.163998, -1.241315, -1.494145, 1, 0.07058824, 0, 1,
-2.141515, 2.044212, 0.2887902, 1, 0.07843138, 0, 1,
-2.094391, -0.732208, -4.311327, 1, 0.08235294, 0, 1,
-2.078705, -1.254979, -2.955894, 1, 0.09019608, 0, 1,
-2.039893, 1.546206, -0.6866958, 1, 0.09411765, 0, 1,
-2.031104, 1.892916, -1.88104, 1, 0.1019608, 0, 1,
-2.022701, 0.273929, -2.347916, 1, 0.1098039, 0, 1,
-1.999317, 1.225063, -2.658436, 1, 0.1137255, 0, 1,
-1.975703, -0.4769834, -3.260219, 1, 0.1215686, 0, 1,
-1.922451, -2.608367, -1.489389, 1, 0.1254902, 0, 1,
-1.922171, 1.16088, -0.7983569, 1, 0.1333333, 0, 1,
-1.912481, 1.888576, -1.074489, 1, 0.1372549, 0, 1,
-1.900369, 1.261175, 0.1304414, 1, 0.145098, 0, 1,
-1.898091, 2.478225, -1.330531, 1, 0.1490196, 0, 1,
-1.895601, 0.4888216, -2.521565, 1, 0.1568628, 0, 1,
-1.894922, -0.7055318, -3.492979, 1, 0.1607843, 0, 1,
-1.886395, -0.01926476, -1.283633, 1, 0.1686275, 0, 1,
-1.882071, 1.706801, -1.518745, 1, 0.172549, 0, 1,
-1.875293, -1.362708, -3.136719, 1, 0.1803922, 0, 1,
-1.870473, 0.4449339, -0.1688365, 1, 0.1843137, 0, 1,
-1.865839, -0.8541126, -2.28124, 1, 0.1921569, 0, 1,
-1.853752, -0.5808852, -0.6326971, 1, 0.1960784, 0, 1,
-1.843491, -0.6748686, -1.859779, 1, 0.2039216, 0, 1,
-1.841118, -1.617311, -1.564128, 1, 0.2117647, 0, 1,
-1.82858, 1.218262, -0.2939449, 1, 0.2156863, 0, 1,
-1.795057, 1.533751, -0.5271996, 1, 0.2235294, 0, 1,
-1.724994, -1.796909, -2.641768, 1, 0.227451, 0, 1,
-1.714014, 0.6647907, -1.678004, 1, 0.2352941, 0, 1,
-1.701525, -1.026532, -1.729832, 1, 0.2392157, 0, 1,
-1.699041, 0.6367849, -0.6064734, 1, 0.2470588, 0, 1,
-1.693485, -0.6135442, -1.282509, 1, 0.2509804, 0, 1,
-1.677145, -0.08164827, -2.074494, 1, 0.2588235, 0, 1,
-1.667947, 0.5401107, -1.051516, 1, 0.2627451, 0, 1,
-1.65614, 0.5291699, -1.025944, 1, 0.2705882, 0, 1,
-1.655201, -0.0515243, -1.163455, 1, 0.2745098, 0, 1,
-1.635045, -0.04077417, -0.5882737, 1, 0.282353, 0, 1,
-1.632189, 0.5935598, -0.7052091, 1, 0.2862745, 0, 1,
-1.605349, 0.704722, -1.362436, 1, 0.2941177, 0, 1,
-1.573474, 1.469078, -1.510269, 1, 0.3019608, 0, 1,
-1.572718, -0.4445, -1.103613, 1, 0.3058824, 0, 1,
-1.571893, -0.4186974, -2.890651, 1, 0.3137255, 0, 1,
-1.569219, -0.177821, -0.7860119, 1, 0.3176471, 0, 1,
-1.56453, -0.7652612, -2.164231, 1, 0.3254902, 0, 1,
-1.549129, -0.5181291, -1.859682, 1, 0.3294118, 0, 1,
-1.532954, 1.343451, -1.070115, 1, 0.3372549, 0, 1,
-1.508047, -0.2860779, -1.267194, 1, 0.3411765, 0, 1,
-1.506884, 0.9004257, -3.914105, 1, 0.3490196, 0, 1,
-1.503114, 1.354058, -0.4711998, 1, 0.3529412, 0, 1,
-1.501874, 0.8352277, -1.434057, 1, 0.3607843, 0, 1,
-1.485285, -0.6039854, -1.779667, 1, 0.3647059, 0, 1,
-1.48251, 0.8572558, -0.0776123, 1, 0.372549, 0, 1,
-1.451888, -0.1089575, -0.859939, 1, 0.3764706, 0, 1,
-1.431627, -1.057775, -2.807719, 1, 0.3843137, 0, 1,
-1.407331, -0.03733297, -0.507719, 1, 0.3882353, 0, 1,
-1.402109, 1.236009, -2.101324, 1, 0.3960784, 0, 1,
-1.393026, -1.003545, -3.062472, 1, 0.4039216, 0, 1,
-1.392657, 0.5346159, -1.586754, 1, 0.4078431, 0, 1,
-1.385964, -0.01782611, -2.433964, 1, 0.4156863, 0, 1,
-1.384528, -0.523152, -2.85758, 1, 0.4196078, 0, 1,
-1.377289, 0.9170258, -0.9478575, 1, 0.427451, 0, 1,
-1.372394, -0.4228939, -0.1145817, 1, 0.4313726, 0, 1,
-1.372217, 0.7378207, -0.5871113, 1, 0.4392157, 0, 1,
-1.366405, -1.212033, -2.621501, 1, 0.4431373, 0, 1,
-1.35983, 1.671214, -0.4250425, 1, 0.4509804, 0, 1,
-1.358449, -0.9599321, -2.021726, 1, 0.454902, 0, 1,
-1.338279, 0.359383, 0.4114978, 1, 0.4627451, 0, 1,
-1.335367, -1.291091, -3.213257, 1, 0.4666667, 0, 1,
-1.333602, -1.03895, -1.984131, 1, 0.4745098, 0, 1,
-1.324418, 1.494812, -0.3472984, 1, 0.4784314, 0, 1,
-1.322162, -2.957448, -1.968253, 1, 0.4862745, 0, 1,
-1.319189, 1.085305, 0.605067, 1, 0.4901961, 0, 1,
-1.315414, -1.299744, -3.91759, 1, 0.4980392, 0, 1,
-1.299738, 0.6588116, -2.054563, 1, 0.5058824, 0, 1,
-1.291282, 1.691537, -1.367599, 1, 0.509804, 0, 1,
-1.283986, -1.365376, -3.047336, 1, 0.5176471, 0, 1,
-1.278902, 1.205478, -1.494813, 1, 0.5215687, 0, 1,
-1.274271, 2.008133, 0.3845255, 1, 0.5294118, 0, 1,
-1.263491, 0.3870464, -1.112308, 1, 0.5333334, 0, 1,
-1.262212, 0.6712716, -0.1366365, 1, 0.5411765, 0, 1,
-1.261378, -0.7831216, -2.518665, 1, 0.5450981, 0, 1,
-1.257995, 0.5587313, -0.3562072, 1, 0.5529412, 0, 1,
-1.255678, -0.3879721, -2.762186, 1, 0.5568628, 0, 1,
-1.254862, -1.946621, -2.670758, 1, 0.5647059, 0, 1,
-1.247017, -0.06982007, -1.586392, 1, 0.5686275, 0, 1,
-1.238622, 0.03504942, -2.806578, 1, 0.5764706, 0, 1,
-1.230554, 0.3443177, -3.056902, 1, 0.5803922, 0, 1,
-1.226621, -0.5444386, -0.7190554, 1, 0.5882353, 0, 1,
-1.216302, 0.9901252, -1.40766, 1, 0.5921569, 0, 1,
-1.212876, -0.5449361, -1.033597, 1, 0.6, 0, 1,
-1.209133, -0.3403782, -2.058981, 1, 0.6078432, 0, 1,
-1.19719, -0.470433, -0.1282053, 1, 0.6117647, 0, 1,
-1.195233, 1.682508, -0.4045223, 1, 0.6196079, 0, 1,
-1.191935, 0.9600961, 0.339816, 1, 0.6235294, 0, 1,
-1.191178, -0.3944213, -1.666536, 1, 0.6313726, 0, 1,
-1.18142, 1.324961, 0.01694555, 1, 0.6352941, 0, 1,
-1.180378, 1.389003, -1.828137, 1, 0.6431373, 0, 1,
-1.179937, -0.3482236, -1.317534, 1, 0.6470588, 0, 1,
-1.177941, 0.2017132, -0.8115031, 1, 0.654902, 0, 1,
-1.17251, -0.8022285, -1.855855, 1, 0.6588235, 0, 1,
-1.171665, 0.7428405, -1.609055, 1, 0.6666667, 0, 1,
-1.168307, 0.5415698, -1.485942, 1, 0.6705883, 0, 1,
-1.156575, 0.1781225, -3.582037, 1, 0.6784314, 0, 1,
-1.155086, -0.249392, -1.107167, 1, 0.682353, 0, 1,
-1.147822, 0.8938373, -0.7796855, 1, 0.6901961, 0, 1,
-1.145558, 0.4751288, -2.204278, 1, 0.6941177, 0, 1,
-1.139476, -0.937502, -3.034452, 1, 0.7019608, 0, 1,
-1.139364, 2.379875, -0.7542148, 1, 0.7098039, 0, 1,
-1.138705, 0.2631466, -2.000056, 1, 0.7137255, 0, 1,
-1.138036, -0.7496455, -2.068967, 1, 0.7215686, 0, 1,
-1.137514, 1.006135, -1.922964, 1, 0.7254902, 0, 1,
-1.124056, 0.9782814, -1.998863, 1, 0.7333333, 0, 1,
-1.123243, 0.1987552, -1.036073, 1, 0.7372549, 0, 1,
-1.12303, -0.003373988, 0.2791539, 1, 0.7450981, 0, 1,
-1.097539, -1.699434, -1.513026, 1, 0.7490196, 0, 1,
-1.097401, -0.2571197, -0.5372424, 1, 0.7568628, 0, 1,
-1.093364, -1.201806, -1.259493, 1, 0.7607843, 0, 1,
-1.093008, 0.9765918, 0.3772357, 1, 0.7686275, 0, 1,
-1.090028, 1.052886, 1.001348, 1, 0.772549, 0, 1,
-1.084838, 0.3289839, -2.438998, 1, 0.7803922, 0, 1,
-1.083688, 0.7074863, -2.07609, 1, 0.7843137, 0, 1,
-1.079553, 0.4337515, -1.520511, 1, 0.7921569, 0, 1,
-1.074691, 1.067732, 0.8544405, 1, 0.7960784, 0, 1,
-1.067922, 2.344511, 0.5234612, 1, 0.8039216, 0, 1,
-1.063679, -1.761002, -2.580724, 1, 0.8117647, 0, 1,
-1.062735, 1.615101, -0.7793947, 1, 0.8156863, 0, 1,
-1.05952, 2.018501, -0.688885, 1, 0.8235294, 0, 1,
-1.041881, 0.5176418, -0.7215045, 1, 0.827451, 0, 1,
-1.040395, 0.7407266, 0.9350137, 1, 0.8352941, 0, 1,
-1.036148, -1.096543, -2.47053, 1, 0.8392157, 0, 1,
-1.033182, 0.1995551, -1.719599, 1, 0.8470588, 0, 1,
-1.031979, 0.6246355, -0.7375205, 1, 0.8509804, 0, 1,
-1.029082, 1.46042, 0.5989335, 1, 0.8588235, 0, 1,
-1.029005, 1.501676, 0.01107265, 1, 0.8627451, 0, 1,
-1.025655, 0.638329, -1.240259, 1, 0.8705882, 0, 1,
-1.021186, 0.1296945, -3.97705, 1, 0.8745098, 0, 1,
-1.01459, -0.6916261, -1.654103, 1, 0.8823529, 0, 1,
-1.010452, -0.2094519, -1.213576, 1, 0.8862745, 0, 1,
-1.003839, 1.012141, -0.9418963, 1, 0.8941177, 0, 1,
-0.9986518, -0.689925, -3.255595, 1, 0.8980392, 0, 1,
-0.9976313, -0.1013628, -1.558523, 1, 0.9058824, 0, 1,
-0.992682, 0.0875332, -1.717083, 1, 0.9137255, 0, 1,
-0.9897423, 1.022169, -1.453442, 1, 0.9176471, 0, 1,
-0.9865654, -1.627692, -1.793505, 1, 0.9254902, 0, 1,
-0.9851578, 1.165748, -0.7039925, 1, 0.9294118, 0, 1,
-0.9828749, -0.979063, -1.973724, 1, 0.9372549, 0, 1,
-0.9723061, 0.7984502, -2.504498, 1, 0.9411765, 0, 1,
-0.9721065, -0.8592373, -0.8745176, 1, 0.9490196, 0, 1,
-0.9626839, -0.05709171, -2.87829, 1, 0.9529412, 0, 1,
-0.9396038, -0.8396565, -2.06147, 1, 0.9607843, 0, 1,
-0.9390413, -0.4334239, -2.953299, 1, 0.9647059, 0, 1,
-0.9388028, 1.311134, -1.890573, 1, 0.972549, 0, 1,
-0.9334996, 1.085478, -1.157598, 1, 0.9764706, 0, 1,
-0.9238399, -1.011393, -2.139003, 1, 0.9843137, 0, 1,
-0.9235114, 0.4995905, -0.5594891, 1, 0.9882353, 0, 1,
-0.9220502, 1.725083, 0.7004789, 1, 0.9960784, 0, 1,
-0.9191509, 1.364618, -1.871067, 0.9960784, 1, 0, 1,
-0.9163437, 0.8999672, -0.3498228, 0.9921569, 1, 0, 1,
-0.8998257, 1.625032, -1.931649, 0.9843137, 1, 0, 1,
-0.8996845, 1.646052, -1.2287, 0.9803922, 1, 0, 1,
-0.8930917, -0.03530068, -0.912294, 0.972549, 1, 0, 1,
-0.8929369, -0.9216633, -1.12873, 0.9686275, 1, 0, 1,
-0.8919806, -0.4385899, 0.05289943, 0.9607843, 1, 0, 1,
-0.8867704, 0.8061514, -2.581512, 0.9568627, 1, 0, 1,
-0.881551, 0.9111328, -0.07026394, 0.9490196, 1, 0, 1,
-0.8813555, -0.3023739, -2.386823, 0.945098, 1, 0, 1,
-0.8742085, 0.2207652, -1.80462, 0.9372549, 1, 0, 1,
-0.872176, 0.6000675, 0.9402779, 0.9333333, 1, 0, 1,
-0.8711349, -0.7271695, -3.37539, 0.9254902, 1, 0, 1,
-0.8680623, 0.6414151, -1.012645, 0.9215686, 1, 0, 1,
-0.8673145, 0.790867, 1.369395, 0.9137255, 1, 0, 1,
-0.8639385, 0.4414258, -2.373801, 0.9098039, 1, 0, 1,
-0.8612497, -0.4792514, -0.6972149, 0.9019608, 1, 0, 1,
-0.8609105, -2.242801, -2.778661, 0.8941177, 1, 0, 1,
-0.8580914, 1.681154, -0.9638306, 0.8901961, 1, 0, 1,
-0.8536014, 1.645702, -0.4229049, 0.8823529, 1, 0, 1,
-0.8515847, -0.2540576, -3.054384, 0.8784314, 1, 0, 1,
-0.8482302, -0.07211762, -1.292386, 0.8705882, 1, 0, 1,
-0.8463474, -0.8657156, -2.219841, 0.8666667, 1, 0, 1,
-0.8387959, 1.557744, -0.8863152, 0.8588235, 1, 0, 1,
-0.8349118, 1.683457, 0.1312447, 0.854902, 1, 0, 1,
-0.8305872, 0.7154534, 0.7446213, 0.8470588, 1, 0, 1,
-0.8290284, 1.208806, 0.05849834, 0.8431373, 1, 0, 1,
-0.8266473, -1.108395, -2.261363, 0.8352941, 1, 0, 1,
-0.8212815, 0.5892645, -0.738834, 0.8313726, 1, 0, 1,
-0.8198013, 0.3727521, -0.756564, 0.8235294, 1, 0, 1,
-0.8174977, 0.2230726, 0.1796043, 0.8196079, 1, 0, 1,
-0.8158193, -1.442114, -3.136055, 0.8117647, 1, 0, 1,
-0.7918508, -0.7967774, -3.111165, 0.8078431, 1, 0, 1,
-0.7842845, 0.7327926, -0.32222, 0.8, 1, 0, 1,
-0.7819785, -0.8786061, -3.001661, 0.7921569, 1, 0, 1,
-0.7815256, 1.947021, 0.8833604, 0.7882353, 1, 0, 1,
-0.7803527, -0.8457684, -2.412075, 0.7803922, 1, 0, 1,
-0.7786393, -1.737213, -2.454762, 0.7764706, 1, 0, 1,
-0.7745637, 0.3572366, -1.309133, 0.7686275, 1, 0, 1,
-0.7739784, 2.047413, -0.6538642, 0.7647059, 1, 0, 1,
-0.7731563, 0.286923, -0.515147, 0.7568628, 1, 0, 1,
-0.7686645, 1.927563, -3.804849, 0.7529412, 1, 0, 1,
-0.7667375, 0.7271497, -1.65554, 0.7450981, 1, 0, 1,
-0.7640945, -0.9780508, -3.501023, 0.7411765, 1, 0, 1,
-0.7638471, -0.6491562, -2.416831, 0.7333333, 1, 0, 1,
-0.7614217, 1.228849, -0.4781506, 0.7294118, 1, 0, 1,
-0.7612721, -0.4889025, -2.628251, 0.7215686, 1, 0, 1,
-0.7485858, 1.349715, 0.1183318, 0.7176471, 1, 0, 1,
-0.7462768, 1.201848, -0.4260318, 0.7098039, 1, 0, 1,
-0.7449697, -0.5166923, -3.056618, 0.7058824, 1, 0, 1,
-0.7423408, 1.389132, -1.019363, 0.6980392, 1, 0, 1,
-0.7399861, -2.302689, -3.916892, 0.6901961, 1, 0, 1,
-0.7392907, -0.08956219, -1.453415, 0.6862745, 1, 0, 1,
-0.73685, -0.6885685, -3.612211, 0.6784314, 1, 0, 1,
-0.7339506, -1.027878, -2.691797, 0.6745098, 1, 0, 1,
-0.7314898, 1.309194, 0.07650442, 0.6666667, 1, 0, 1,
-0.7312984, 0.8328722, 0.6052178, 0.6627451, 1, 0, 1,
-0.7300214, 0.5284795, -1.625287, 0.654902, 1, 0, 1,
-0.7294248, 0.6820539, -2.468068, 0.6509804, 1, 0, 1,
-0.726578, -0.754411, -2.81906, 0.6431373, 1, 0, 1,
-0.7202154, 0.02594586, -2.412254, 0.6392157, 1, 0, 1,
-0.7201957, -1.137226, -3.533749, 0.6313726, 1, 0, 1,
-0.7190587, -0.3135794, -2.708638, 0.627451, 1, 0, 1,
-0.7189058, 0.2689589, -1.220647, 0.6196079, 1, 0, 1,
-0.7177258, 1.00616, -0.3661304, 0.6156863, 1, 0, 1,
-0.7115245, -0.01431147, -0.8985053, 0.6078432, 1, 0, 1,
-0.7089808, 2.113002, -1.873108, 0.6039216, 1, 0, 1,
-0.7088124, 0.4386221, 0.165527, 0.5960785, 1, 0, 1,
-0.7015525, 1.835609, 0.8090808, 0.5882353, 1, 0, 1,
-0.6948416, -0.07319725, -0.2212029, 0.5843138, 1, 0, 1,
-0.6933395, 0.3368978, -3.290409, 0.5764706, 1, 0, 1,
-0.6909106, 1.667678, 0.9370539, 0.572549, 1, 0, 1,
-0.687425, 1.497032, -1.123259, 0.5647059, 1, 0, 1,
-0.6787512, -0.6681871, -2.564876, 0.5607843, 1, 0, 1,
-0.6760927, 0.5105183, -0.2079482, 0.5529412, 1, 0, 1,
-0.6760161, 0.4608721, -0.9801441, 0.5490196, 1, 0, 1,
-0.6705642, -0.2465826, -1.393958, 0.5411765, 1, 0, 1,
-0.6704988, 1.363954, -0.369983, 0.5372549, 1, 0, 1,
-0.6681349, -0.4372372, -2.707592, 0.5294118, 1, 0, 1,
-0.6662989, 0.5420914, -0.6687441, 0.5254902, 1, 0, 1,
-0.6635229, -0.1983213, -0.1082052, 0.5176471, 1, 0, 1,
-0.6626785, 0.001609136, -1.209626, 0.5137255, 1, 0, 1,
-0.6566539, -0.3541086, -0.8007828, 0.5058824, 1, 0, 1,
-0.6536577, -0.5260828, -0.9999696, 0.5019608, 1, 0, 1,
-0.6499479, -0.62248, -2.286136, 0.4941176, 1, 0, 1,
-0.6493095, 0.3638631, -3.240588, 0.4862745, 1, 0, 1,
-0.6480291, 0.2218417, -0.9404119, 0.4823529, 1, 0, 1,
-0.6464727, 1.115561, -0.7132681, 0.4745098, 1, 0, 1,
-0.6416051, 1.416082, -1.451333, 0.4705882, 1, 0, 1,
-0.6386645, -2.293084, -3.647013, 0.4627451, 1, 0, 1,
-0.6368775, -1.862645, -1.879619, 0.4588235, 1, 0, 1,
-0.6347549, 0.9051259, 1.050127, 0.4509804, 1, 0, 1,
-0.6334448, -0.01181341, -1.359832, 0.4470588, 1, 0, 1,
-0.6297203, -0.2714063, -2.030771, 0.4392157, 1, 0, 1,
-0.6296183, -0.3916913, -3.703677, 0.4352941, 1, 0, 1,
-0.6204503, -0.418863, -1.147064, 0.427451, 1, 0, 1,
-0.6148801, -0.2365641, -2.342429, 0.4235294, 1, 0, 1,
-0.6101614, 0.5148925, -0.4080394, 0.4156863, 1, 0, 1,
-0.6095216, 0.8811333, -1.317319, 0.4117647, 1, 0, 1,
-0.6084331, 0.4573804, -0.8757535, 0.4039216, 1, 0, 1,
-0.6071361, 0.4014741, -2.284848, 0.3960784, 1, 0, 1,
-0.6059304, -1.452603, -0.9100164, 0.3921569, 1, 0, 1,
-0.6015136, 0.6269473, -1.068576, 0.3843137, 1, 0, 1,
-0.6009715, 0.8201414, -0.8348097, 0.3803922, 1, 0, 1,
-0.6005391, -1.776008, -2.773382, 0.372549, 1, 0, 1,
-0.600507, -1.227293, -3.01057, 0.3686275, 1, 0, 1,
-0.5936655, -1.137073, -2.117647, 0.3607843, 1, 0, 1,
-0.5911596, 1.75981, 0.04797657, 0.3568628, 1, 0, 1,
-0.5875257, -0.115088, -0.7530269, 0.3490196, 1, 0, 1,
-0.5855099, 0.2412103, -1.555644, 0.345098, 1, 0, 1,
-0.584299, -2.44736, -3.327144, 0.3372549, 1, 0, 1,
-0.5824354, -0.04266234, -2.848022, 0.3333333, 1, 0, 1,
-0.5817752, -1.882935, -3.521318, 0.3254902, 1, 0, 1,
-0.580381, 0.3175883, -2.471076, 0.3215686, 1, 0, 1,
-0.5706456, 0.09539191, -1.938235, 0.3137255, 1, 0, 1,
-0.5666531, -0.4092871, -2.611613, 0.3098039, 1, 0, 1,
-0.558184, -1.407327, -3.071033, 0.3019608, 1, 0, 1,
-0.5563915, -0.7571607, -3.138624, 0.2941177, 1, 0, 1,
-0.5561055, 0.2120584, -1.119561, 0.2901961, 1, 0, 1,
-0.5557551, -1.866375, -2.650622, 0.282353, 1, 0, 1,
-0.5539564, -0.9189226, -2.639172, 0.2784314, 1, 0, 1,
-0.5514385, 1.104156, -1.363418, 0.2705882, 1, 0, 1,
-0.5493099, 0.2429417, -0.7549943, 0.2666667, 1, 0, 1,
-0.549004, 0.3916404, -1.98536, 0.2588235, 1, 0, 1,
-0.5486326, -0.4978282, -3.620898, 0.254902, 1, 0, 1,
-0.5484416, -0.03391612, -1.936253, 0.2470588, 1, 0, 1,
-0.5416829, 0.7960452, -0.8609403, 0.2431373, 1, 0, 1,
-0.5413967, 0.4710323, -0.2521892, 0.2352941, 1, 0, 1,
-0.5389044, 0.5344767, -2.306098, 0.2313726, 1, 0, 1,
-0.5347202, 0.1149494, -1.045969, 0.2235294, 1, 0, 1,
-0.5313891, 0.1392914, -0.5634332, 0.2196078, 1, 0, 1,
-0.5264117, -1.236482, -3.321343, 0.2117647, 1, 0, 1,
-0.5251107, 0.02446067, -0.04631609, 0.2078431, 1, 0, 1,
-0.5247955, 0.3045799, -0.1527556, 0.2, 1, 0, 1,
-0.5185198, -0.7176558, -4.034978, 0.1921569, 1, 0, 1,
-0.5183223, -0.005390116, -1.404748, 0.1882353, 1, 0, 1,
-0.5151604, -1.557925, -3.367728, 0.1803922, 1, 0, 1,
-0.5144556, 0.1547542, -0.2319983, 0.1764706, 1, 0, 1,
-0.513561, 0.3490757, -1.649883, 0.1686275, 1, 0, 1,
-0.5120782, -2.236923, -2.306549, 0.1647059, 1, 0, 1,
-0.5120558, -0.5494889, -1.588006, 0.1568628, 1, 0, 1,
-0.5096623, 0.3348675, -0.6565647, 0.1529412, 1, 0, 1,
-0.5082952, 1.103482, -1.148331, 0.145098, 1, 0, 1,
-0.5049808, 0.1393186, -1.012904, 0.1411765, 1, 0, 1,
-0.5040962, -0.2377913, -3.664363, 0.1333333, 1, 0, 1,
-0.5040739, -1.786818, -3.339537, 0.1294118, 1, 0, 1,
-0.5023551, 1.112145, 0.3579954, 0.1215686, 1, 0, 1,
-0.4965833, 0.5442813, -1.012908, 0.1176471, 1, 0, 1,
-0.4942938, 0.3801504, 1.191285, 0.1098039, 1, 0, 1,
-0.4938807, -0.09219652, 0.1035009, 0.1058824, 1, 0, 1,
-0.4911475, -0.5132358, -2.38443, 0.09803922, 1, 0, 1,
-0.4887797, -0.8527565, -4.277556, 0.09019608, 1, 0, 1,
-0.4869463, -0.2435082, -1.848621, 0.08627451, 1, 0, 1,
-0.4802366, -0.2094078, -2.381968, 0.07843138, 1, 0, 1,
-0.479786, 0.3243697, 1.915184, 0.07450981, 1, 0, 1,
-0.4753312, 0.1015883, -0.5133452, 0.06666667, 1, 0, 1,
-0.474705, 0.1720018, 0.1455171, 0.0627451, 1, 0, 1,
-0.4736654, -0.4028664, -2.927424, 0.05490196, 1, 0, 1,
-0.4696772, -1.844856, -2.142216, 0.05098039, 1, 0, 1,
-0.4669066, 1.003022, 0.6614091, 0.04313726, 1, 0, 1,
-0.4640323, -1.591933, -3.347452, 0.03921569, 1, 0, 1,
-0.450299, 0.4718688, -0.7640365, 0.03137255, 1, 0, 1,
-0.4489113, 0.9856416, -1.012906, 0.02745098, 1, 0, 1,
-0.4410035, -1.238182, -4.13547, 0.01960784, 1, 0, 1,
-0.438123, -0.2014628, -4.293016, 0.01568628, 1, 0, 1,
-0.4331132, -0.1806957, -2.610736, 0.007843138, 1, 0, 1,
-0.432743, 1.966952, 0.1128569, 0.003921569, 1, 0, 1,
-0.4295991, -0.1961268, -4.572046, 0, 1, 0.003921569, 1,
-0.4294178, 0.3153798, -0.5065368, 0, 1, 0.01176471, 1,
-0.4278824, -0.7598579, -2.950347, 0, 1, 0.01568628, 1,
-0.4245524, -0.8758652, -2.11449, 0, 1, 0.02352941, 1,
-0.4242169, 1.261827, -1.580691, 0, 1, 0.02745098, 1,
-0.4239282, 1.600708, 0.125593, 0, 1, 0.03529412, 1,
-0.4238163, -0.6453227, -4.23332, 0, 1, 0.03921569, 1,
-0.4195451, -1.172489, -3.636351, 0, 1, 0.04705882, 1,
-0.4172964, -0.239682, -1.917375, 0, 1, 0.05098039, 1,
-0.4168758, 0.7050196, -2.115582, 0, 1, 0.05882353, 1,
-0.4149062, 0.1661685, 0.4107039, 0, 1, 0.0627451, 1,
-0.4121289, -0.2549222, -1.229885, 0, 1, 0.07058824, 1,
-0.4097642, 0.3336315, -2.220418, 0, 1, 0.07450981, 1,
-0.4073507, -0.915953, -2.337138, 0, 1, 0.08235294, 1,
-0.4011278, 0.4800189, -0.7726803, 0, 1, 0.08627451, 1,
-0.4009767, -0.3875512, -3.576592, 0, 1, 0.09411765, 1,
-0.3988393, -0.403699, -0.3424674, 0, 1, 0.1019608, 1,
-0.3982121, -0.1313725, -0.9986029, 0, 1, 0.1058824, 1,
-0.3976157, -2.132133, -4.634787, 0, 1, 0.1137255, 1,
-0.395345, -2.290424, -2.378102, 0, 1, 0.1176471, 1,
-0.3921999, -0.3585561, -3.639021, 0, 1, 0.1254902, 1,
-0.3910695, -1.02708, -1.926493, 0, 1, 0.1294118, 1,
-0.3904671, 0.08431834, -1.560761, 0, 1, 0.1372549, 1,
-0.3896433, -1.150833, -0.79169, 0, 1, 0.1411765, 1,
-0.3875453, -0.4814486, -1.789838, 0, 1, 0.1490196, 1,
-0.385661, 1.448248, 0.6616407, 0, 1, 0.1529412, 1,
-0.385592, -2.537665, -2.211518, 0, 1, 0.1607843, 1,
-0.3854882, -0.4672617, -2.991329, 0, 1, 0.1647059, 1,
-0.3815958, 0.8685927, -1.147559, 0, 1, 0.172549, 1,
-0.3689018, 1.043712, -0.2204134, 0, 1, 0.1764706, 1,
-0.3685907, -1.311768, -2.842998, 0, 1, 0.1843137, 1,
-0.3683859, -0.8706555, -3.595683, 0, 1, 0.1882353, 1,
-0.366858, -0.2443481, -1.968824, 0, 1, 0.1960784, 1,
-0.365417, -1.611768, -4.201869, 0, 1, 0.2039216, 1,
-0.3633266, 0.4596059, 0.2971485, 0, 1, 0.2078431, 1,
-0.3583856, 1.31575, 0.3012685, 0, 1, 0.2156863, 1,
-0.356749, -2.363333, -2.242063, 0, 1, 0.2196078, 1,
-0.3518659, 0.6580167, 0.8715478, 0, 1, 0.227451, 1,
-0.3517904, 1.014468, 0.5608366, 0, 1, 0.2313726, 1,
-0.3515485, -2.102393, -2.201488, 0, 1, 0.2392157, 1,
-0.3511176, 1.385461, -0.7450467, 0, 1, 0.2431373, 1,
-0.3411358, -0.08865863, -1.96858, 0, 1, 0.2509804, 1,
-0.3409663, -0.1289634, -2.738744, 0, 1, 0.254902, 1,
-0.3395101, 0.7242792, 0.9448844, 0, 1, 0.2627451, 1,
-0.3320076, 0.522409, 0.6286964, 0, 1, 0.2666667, 1,
-0.3313697, 0.2783618, -1.958847, 0, 1, 0.2745098, 1,
-0.3281777, -1.066948, -3.536931, 0, 1, 0.2784314, 1,
-0.327173, -0.4105529, -2.691634, 0, 1, 0.2862745, 1,
-0.3212558, -0.4147526, -1.125252, 0, 1, 0.2901961, 1,
-0.3189639, 1.465674, -0.269784, 0, 1, 0.2980392, 1,
-0.3162535, 1.391623, -0.02221917, 0, 1, 0.3058824, 1,
-0.3128989, 0.9850968, -0.518189, 0, 1, 0.3098039, 1,
-0.311973, -0.834464, -4.884762, 0, 1, 0.3176471, 1,
-0.3076207, 0.81445, -0.7562243, 0, 1, 0.3215686, 1,
-0.3056007, 0.6710144, -0.8236485, 0, 1, 0.3294118, 1,
-0.3043818, -0.7525662, -1.281904, 0, 1, 0.3333333, 1,
-0.2984418, -0.05605373, -1.275296, 0, 1, 0.3411765, 1,
-0.2971253, 0.5374529, -2.530451, 0, 1, 0.345098, 1,
-0.2956573, 2.458417, -2.403687, 0, 1, 0.3529412, 1,
-0.2898839, 1.173397, -0.558597, 0, 1, 0.3568628, 1,
-0.28825, 1.612368, -0.6452627, 0, 1, 0.3647059, 1,
-0.2848828, -0.4637852, -2.025653, 0, 1, 0.3686275, 1,
-0.2831152, 0.5404261, 0.3967662, 0, 1, 0.3764706, 1,
-0.2822046, 0.6500933, -1.420102, 0, 1, 0.3803922, 1,
-0.2723041, -1.554655, -3.088803, 0, 1, 0.3882353, 1,
-0.2694064, 0.5503277, -0.1160713, 0, 1, 0.3921569, 1,
-0.2650573, 0.3990028, -1.12893, 0, 1, 0.4, 1,
-0.2642632, -1.314067, -3.620232, 0, 1, 0.4078431, 1,
-0.2614295, 1.986373, -0.1690008, 0, 1, 0.4117647, 1,
-0.2607809, -2.268724, -1.357663, 0, 1, 0.4196078, 1,
-0.2591739, 0.1995348, -1.770347, 0, 1, 0.4235294, 1,
-0.2547193, -0.4919728, -3.299326, 0, 1, 0.4313726, 1,
-0.2546371, 0.3696356, -2.343355, 0, 1, 0.4352941, 1,
-0.2536014, 0.1357694, -3.167189, 0, 1, 0.4431373, 1,
-0.2498714, 0.7219348, -1.346516, 0, 1, 0.4470588, 1,
-0.2490484, -0.03838313, -1.634829, 0, 1, 0.454902, 1,
-0.2470608, 0.4114817, 0.4523539, 0, 1, 0.4588235, 1,
-0.2460357, -0.518701, -3.374179, 0, 1, 0.4666667, 1,
-0.2424896, 0.1434146, -3.158191, 0, 1, 0.4705882, 1,
-0.2420561, -0.538847, -2.801053, 0, 1, 0.4784314, 1,
-0.2394134, -0.3300076, -2.01938, 0, 1, 0.4823529, 1,
-0.2391319, 1.853152, 0.09030841, 0, 1, 0.4901961, 1,
-0.2328051, -1.351717, -3.527887, 0, 1, 0.4941176, 1,
-0.2320684, -0.2511687, -3.831178, 0, 1, 0.5019608, 1,
-0.2221277, -0.2256189, -1.14248, 0, 1, 0.509804, 1,
-0.2220363, -0.7611024, -2.813689, 0, 1, 0.5137255, 1,
-0.2145052, 0.3602262, -2.326708, 0, 1, 0.5215687, 1,
-0.2138744, -1.86141, -2.469623, 0, 1, 0.5254902, 1,
-0.2137415, 1.353313, -1.422135, 0, 1, 0.5333334, 1,
-0.213493, -0.4438831, -1.723038, 0, 1, 0.5372549, 1,
-0.2131367, -0.7329603, -2.313944, 0, 1, 0.5450981, 1,
-0.2090401, -0.3129586, -2.446659, 0, 1, 0.5490196, 1,
-0.2077554, 0.8071634, -0.6692653, 0, 1, 0.5568628, 1,
-0.1981098, 1.292265, -0.725334, 0, 1, 0.5607843, 1,
-0.1978462, 1.143946, 0.3784735, 0, 1, 0.5686275, 1,
-0.1977706, -1.239399, -2.049733, 0, 1, 0.572549, 1,
-0.1927388, 0.6967098, 0.9419362, 0, 1, 0.5803922, 1,
-0.1924325, 0.4009962, -0.04158881, 0, 1, 0.5843138, 1,
-0.1922754, 0.09567004, -3.537271, 0, 1, 0.5921569, 1,
-0.1906329, -1.370528, -4.845967, 0, 1, 0.5960785, 1,
-0.1849154, 1.098775, 2.081615, 0, 1, 0.6039216, 1,
-0.1813532, 0.3399722, 0.3892596, 0, 1, 0.6117647, 1,
-0.1809202, -0.6721845, -0.7703841, 0, 1, 0.6156863, 1,
-0.1778381, -0.2010866, -1.119565, 0, 1, 0.6235294, 1,
-0.1676272, -0.8149166, -2.932624, 0, 1, 0.627451, 1,
-0.1627863, 0.4966271, -0.4467749, 0, 1, 0.6352941, 1,
-0.1604428, -0.3290367, -4.760854, 0, 1, 0.6392157, 1,
-0.1595842, 1.397599, -0.9047523, 0, 1, 0.6470588, 1,
-0.1583556, -1.382958, -1.455925, 0, 1, 0.6509804, 1,
-0.1558324, 0.3361408, -0.06625625, 0, 1, 0.6588235, 1,
-0.1524658, -1.144656, -2.990557, 0, 1, 0.6627451, 1,
-0.1514459, 1.881124, 0.1321129, 0, 1, 0.6705883, 1,
-0.1503226, -1.169601, -1.394944, 0, 1, 0.6745098, 1,
-0.1474642, -1.887299, -2.859395, 0, 1, 0.682353, 1,
-0.1463301, -0.1983133, -2.560672, 0, 1, 0.6862745, 1,
-0.1434864, -0.5932616, -4.164008, 0, 1, 0.6941177, 1,
-0.1415092, 1.578606, 0.245684, 0, 1, 0.7019608, 1,
-0.1380043, -1.1084, -2.762131, 0, 1, 0.7058824, 1,
-0.1356743, 0.9020339, 0.1543855, 0, 1, 0.7137255, 1,
-0.134115, -0.1161514, -2.846071, 0, 1, 0.7176471, 1,
-0.1313571, -0.1884506, -1.492204, 0, 1, 0.7254902, 1,
-0.1268856, 0.9580968, -0.06484596, 0, 1, 0.7294118, 1,
-0.1265561, 2.018898, 0.4204666, 0, 1, 0.7372549, 1,
-0.1217075, 0.3778531, 0.02657854, 0, 1, 0.7411765, 1,
-0.1216626, -1.035304, -2.136087, 0, 1, 0.7490196, 1,
-0.1197712, -0.8963032, -3.837238, 0, 1, 0.7529412, 1,
-0.1190044, 0.3753953, -0.2429508, 0, 1, 0.7607843, 1,
-0.1148196, 0.2091816, -1.319721, 0, 1, 0.7647059, 1,
-0.114623, 0.1548374, -0.6607491, 0, 1, 0.772549, 1,
-0.110666, -1.251337, -3.195189, 0, 1, 0.7764706, 1,
-0.1101099, 1.736132, -0.5179836, 0, 1, 0.7843137, 1,
-0.1020531, 1.073405, -0.5630711, 0, 1, 0.7882353, 1,
-0.09455433, 1.417593, 0.1560525, 0, 1, 0.7960784, 1,
-0.09444872, -0.9473056, -2.740757, 0, 1, 0.8039216, 1,
-0.09368002, -0.5613376, -1.67294, 0, 1, 0.8078431, 1,
-0.09338557, 0.6512265, -1.318262, 0, 1, 0.8156863, 1,
-0.09000303, -0.2918238, -4.251028, 0, 1, 0.8196079, 1,
-0.08710604, -0.7553573, -2.170629, 0, 1, 0.827451, 1,
-0.08656039, -1.793646, -3.171891, 0, 1, 0.8313726, 1,
-0.08318409, -0.6553819, -2.253884, 0, 1, 0.8392157, 1,
-0.08306378, 2.066967, 0.8323335, 0, 1, 0.8431373, 1,
-0.08194977, 1.12622, 0.2891236, 0, 1, 0.8509804, 1,
-0.07654411, 1.323716, 0.06386869, 0, 1, 0.854902, 1,
-0.07528246, -0.05219859, -1.009985, 0, 1, 0.8627451, 1,
-0.07243531, 2.450368, -0.9386231, 0, 1, 0.8666667, 1,
-0.06803901, 1.246941, -1.660256, 0, 1, 0.8745098, 1,
-0.06673355, 0.3158364, -1.193241, 0, 1, 0.8784314, 1,
-0.06262118, -3.005928, -2.446547, 0, 1, 0.8862745, 1,
-0.05474612, -1.08116, -1.466032, 0, 1, 0.8901961, 1,
-0.05463796, 0.3104448, -1.035321, 0, 1, 0.8980392, 1,
-0.0528219, 2.131412, 2.194278, 0, 1, 0.9058824, 1,
-0.05263837, 0.9296023, 1.013267, 0, 1, 0.9098039, 1,
-0.05155385, -1.484759, -2.861548, 0, 1, 0.9176471, 1,
-0.05127408, 0.3267229, 0.5801623, 0, 1, 0.9215686, 1,
-0.04703493, 0.3525357, -0.3008019, 0, 1, 0.9294118, 1,
-0.04611536, -0.9686555, -4.164221, 0, 1, 0.9333333, 1,
-0.04407839, 0.3492647, 0.2374371, 0, 1, 0.9411765, 1,
-0.04376515, -0.07655994, -3.445313, 0, 1, 0.945098, 1,
-0.04151219, -0.1377457, -2.005777, 0, 1, 0.9529412, 1,
-0.02728647, 0.1404993, -1.453673, 0, 1, 0.9568627, 1,
-0.02446248, -0.6987004, -2.443254, 0, 1, 0.9647059, 1,
-0.02231716, -1.644005, -3.026484, 0, 1, 0.9686275, 1,
-0.01674974, 0.09873179, 0.3960642, 0, 1, 0.9764706, 1,
-0.01661144, -1.537458, -1.300335, 0, 1, 0.9803922, 1,
-0.01380412, 0.0344139, 2.970959, 0, 1, 0.9882353, 1,
-0.01369703, 0.8112392, -0.5519465, 0, 1, 0.9921569, 1,
-0.01259166, -0.4830977, -2.839391, 0, 1, 1, 1,
-0.01131915, 0.1890264, 0.2257253, 0, 0.9921569, 1, 1,
-0.0113023, 0.288276, -0.9442216, 0, 0.9882353, 1, 1,
-0.009803614, 0.4333333, 0.1155892, 0, 0.9803922, 1, 1,
-0.007944596, -1.395414, -2.877058, 0, 0.9764706, 1, 1,
-0.00361173, -0.7736765, -3.021385, 0, 0.9686275, 1, 1,
0.002448105, 0.3468024, 0.3311128, 0, 0.9647059, 1, 1,
0.003631901, 1.169628, -0.527967, 0, 0.9568627, 1, 1,
0.009689176, 0.8790659, -1.078392, 0, 0.9529412, 1, 1,
0.01094349, 0.2755755, -0.9989166, 0, 0.945098, 1, 1,
0.01142487, -0.1514242, 2.285767, 0, 0.9411765, 1, 1,
0.013017, 0.9308847, -0.2314655, 0, 0.9333333, 1, 1,
0.01302214, -1.616314, 3.42632, 0, 0.9294118, 1, 1,
0.01311479, -1.53859, 2.566723, 0, 0.9215686, 1, 1,
0.01801871, 1.204002, -0.1574754, 0, 0.9176471, 1, 1,
0.0185127, 1.370473, 1.243353, 0, 0.9098039, 1, 1,
0.02309834, -0.4806379, 3.53245, 0, 0.9058824, 1, 1,
0.02400523, -0.973502, 4.333172, 0, 0.8980392, 1, 1,
0.02552075, -1.481222, 1.778559, 0, 0.8901961, 1, 1,
0.02595831, -0.6818017, 3.237182, 0, 0.8862745, 1, 1,
0.02653737, 1.046496, -0.3722297, 0, 0.8784314, 1, 1,
0.02963511, -0.1493269, 2.099113, 0, 0.8745098, 1, 1,
0.03395454, 0.3053258, 1.147956, 0, 0.8666667, 1, 1,
0.03708974, 0.4428253, 0.5591052, 0, 0.8627451, 1, 1,
0.03973361, 1.48258, -1.382297, 0, 0.854902, 1, 1,
0.04347107, 0.4492072, 0.8090171, 0, 0.8509804, 1, 1,
0.04436485, -0.4520643, 1.453541, 0, 0.8431373, 1, 1,
0.04458515, 1.634926, -1.191118, 0, 0.8392157, 1, 1,
0.04611059, 0.7727867, -1.446748, 0, 0.8313726, 1, 1,
0.05106273, 2.213704, 0.1163052, 0, 0.827451, 1, 1,
0.05159482, 0.3198479, 0.06293274, 0, 0.8196079, 1, 1,
0.05264796, 0.6506029, 0.4076853, 0, 0.8156863, 1, 1,
0.05379162, 1.750818, -0.4380244, 0, 0.8078431, 1, 1,
0.05513045, -0.3924715, 2.498823, 0, 0.8039216, 1, 1,
0.05737644, 0.8019925, -0.9162054, 0, 0.7960784, 1, 1,
0.06227037, 0.1917335, -0.1562187, 0, 0.7882353, 1, 1,
0.0649862, 0.9885504, 0.8653615, 0, 0.7843137, 1, 1,
0.06499576, 1.374319, 0.2949284, 0, 0.7764706, 1, 1,
0.06783705, -0.9532665, 2.727443, 0, 0.772549, 1, 1,
0.07270255, -0.09283407, 2.250087, 0, 0.7647059, 1, 1,
0.0747904, -2.347344, 4.002547, 0, 0.7607843, 1, 1,
0.07841346, 0.1423716, -0.5970225, 0, 0.7529412, 1, 1,
0.07926474, -0.8355994, 4.962064, 0, 0.7490196, 1, 1,
0.08044548, 0.239193, 0.00920754, 0, 0.7411765, 1, 1,
0.08339948, 0.04415999, -0.2227601, 0, 0.7372549, 1, 1,
0.08393057, 0.1456657, 2.040901, 0, 0.7294118, 1, 1,
0.08579245, -0.09249403, 2.32, 0, 0.7254902, 1, 1,
0.08728199, -0.7529503, 2.063034, 0, 0.7176471, 1, 1,
0.09112724, -1.443853, 2.888353, 0, 0.7137255, 1, 1,
0.09126642, 0.5397529, -0.9799194, 0, 0.7058824, 1, 1,
0.09273545, 0.5720173, 0.01351088, 0, 0.6980392, 1, 1,
0.09753983, -0.2942146, 2.70783, 0, 0.6941177, 1, 1,
0.09816284, 0.8988625, 0.8445905, 0, 0.6862745, 1, 1,
0.0982713, 1.034704, -0.422541, 0, 0.682353, 1, 1,
0.09974607, -0.1684792, 2.137043, 0, 0.6745098, 1, 1,
0.1007671, 1.37343, -0.2334144, 0, 0.6705883, 1, 1,
0.1026007, -0.02273312, 3.097036, 0, 0.6627451, 1, 1,
0.1034897, -1.757823, 4.091349, 0, 0.6588235, 1, 1,
0.1054573, -0.2238242, 0.6089013, 0, 0.6509804, 1, 1,
0.1065837, -0.2336831, 3.067126, 0, 0.6470588, 1, 1,
0.1066302, -0.7352339, 2.895152, 0, 0.6392157, 1, 1,
0.11175, 0.1923638, -0.1677982, 0, 0.6352941, 1, 1,
0.1123419, -0.02914563, 1.388781, 0, 0.627451, 1, 1,
0.1143968, -0.2893524, 2.415314, 0, 0.6235294, 1, 1,
0.1160889, -0.3799975, 3.842146, 0, 0.6156863, 1, 1,
0.1268471, 0.4545548, 1.968198, 0, 0.6117647, 1, 1,
0.1270286, -0.04523274, 2.138798, 0, 0.6039216, 1, 1,
0.13184, 0.9284788, 0.1782269, 0, 0.5960785, 1, 1,
0.1341113, -0.6143913, 4.292157, 0, 0.5921569, 1, 1,
0.1362115, 1.54647, 0.4385465, 0, 0.5843138, 1, 1,
0.1376454, -2.869734, 2.833, 0, 0.5803922, 1, 1,
0.1384046, -1.133322, 4.863381, 0, 0.572549, 1, 1,
0.1415121, 0.2812687, 1.247044, 0, 0.5686275, 1, 1,
0.1431437, 0.5356534, 0.2548138, 0, 0.5607843, 1, 1,
0.1444056, 0.3471801, -0.6994202, 0, 0.5568628, 1, 1,
0.146018, 0.5529523, -0.5291428, 0, 0.5490196, 1, 1,
0.1480962, 0.3561001, 1.590354, 0, 0.5450981, 1, 1,
0.1597773, 0.6430873, 1.08096, 0, 0.5372549, 1, 1,
0.1627472, -1.298319, 4.942482, 0, 0.5333334, 1, 1,
0.1645043, -0.6556614, 4.71807, 0, 0.5254902, 1, 1,
0.169337, 0.6892892, 1.644761, 0, 0.5215687, 1, 1,
0.1729105, 0.8774921, -0.5505506, 0, 0.5137255, 1, 1,
0.175251, 0.3754096, -1.326418, 0, 0.509804, 1, 1,
0.1808854, -0.8951112, 4.519892, 0, 0.5019608, 1, 1,
0.1840511, -1.022698, 3.541426, 0, 0.4941176, 1, 1,
0.1861205, 0.452057, 1.721539, 0, 0.4901961, 1, 1,
0.1868134, 0.6585922, -0.2377728, 0, 0.4823529, 1, 1,
0.1942525, -0.9482858, 0.7463796, 0, 0.4784314, 1, 1,
0.1955643, -0.9287705, 3.514746, 0, 0.4705882, 1, 1,
0.1965325, -1.399277, 1.357396, 0, 0.4666667, 1, 1,
0.1978293, 0.1118466, 2.186441, 0, 0.4588235, 1, 1,
0.2061334, -0.884407, 2.807877, 0, 0.454902, 1, 1,
0.2071726, -0.8545989, 5.638071, 0, 0.4470588, 1, 1,
0.2089305, -1.563345, 3.231125, 0, 0.4431373, 1, 1,
0.2091325, -0.5697979, 0.7039844, 0, 0.4352941, 1, 1,
0.2117799, -1.066252, 3.500875, 0, 0.4313726, 1, 1,
0.2134282, -1.526784, 0.8107953, 0, 0.4235294, 1, 1,
0.22217, -0.1426764, 2.717414, 0, 0.4196078, 1, 1,
0.2243614, 0.8980081, -2.012, 0, 0.4117647, 1, 1,
0.2244139, -0.2302413, 1.340872, 0, 0.4078431, 1, 1,
0.2289753, 0.7545928, -1.062005, 0, 0.4, 1, 1,
0.2415244, -0.3436266, 2.033971, 0, 0.3921569, 1, 1,
0.2441553, -0.3687305, 1.454305, 0, 0.3882353, 1, 1,
0.2450995, 0.9126194, -0.5492947, 0, 0.3803922, 1, 1,
0.2454504, 0.7073356, 1.16604, 0, 0.3764706, 1, 1,
0.2481547, 0.3834194, 1.225457, 0, 0.3686275, 1, 1,
0.2514821, -1.866986, 3.691512, 0, 0.3647059, 1, 1,
0.2518237, 1.346186, 1.061717, 0, 0.3568628, 1, 1,
0.2543797, -0.3568138, 1.275331, 0, 0.3529412, 1, 1,
0.2559471, -0.4246898, 3.121188, 0, 0.345098, 1, 1,
0.2588155, 1.248651, 1.001496, 0, 0.3411765, 1, 1,
0.2588513, 0.662227, 0.7231796, 0, 0.3333333, 1, 1,
0.2593943, 0.1950258, 0.9542727, 0, 0.3294118, 1, 1,
0.2604512, 0.4821406, 0.1350628, 0, 0.3215686, 1, 1,
0.2618999, -0.9574074, 1.647589, 0, 0.3176471, 1, 1,
0.2631941, 0.9417453, 1.195288, 0, 0.3098039, 1, 1,
0.2637857, 0.5433534, 0.3725592, 0, 0.3058824, 1, 1,
0.2647321, -0.6468725, 3.334721, 0, 0.2980392, 1, 1,
0.2651434, -1.88246, 3.228186, 0, 0.2901961, 1, 1,
0.2706536, 0.7386879, 1.48437, 0, 0.2862745, 1, 1,
0.2713371, -0.7822484, 2.335437, 0, 0.2784314, 1, 1,
0.2739869, 0.5259863, -0.4194607, 0, 0.2745098, 1, 1,
0.2765906, -0.8450848, 3.060746, 0, 0.2666667, 1, 1,
0.2782171, -0.08326183, 2.876484, 0, 0.2627451, 1, 1,
0.2811846, 1.173805, -0.6219881, 0, 0.254902, 1, 1,
0.2836683, 0.3041215, 0.7632856, 0, 0.2509804, 1, 1,
0.2890079, -0.8055257, 4.327106, 0, 0.2431373, 1, 1,
0.2897951, -1.029731, 0.40438, 0, 0.2392157, 1, 1,
0.2924491, 1.420848, -1.686586, 0, 0.2313726, 1, 1,
0.2937447, 0.8524199, 1.051257, 0, 0.227451, 1, 1,
0.2941926, 0.4426868, 1.084002, 0, 0.2196078, 1, 1,
0.2964166, -0.5186979, 3.31574, 0, 0.2156863, 1, 1,
0.3001545, -0.02025692, 0.9422464, 0, 0.2078431, 1, 1,
0.3030824, -2.297248, 3.493543, 0, 0.2039216, 1, 1,
0.303152, 0.4377849, 0.8061082, 0, 0.1960784, 1, 1,
0.3062415, 0.5695287, 1.098924, 0, 0.1882353, 1, 1,
0.3073501, -0.02557139, 1.307685, 0, 0.1843137, 1, 1,
0.3083692, 0.6427547, -1.258174, 0, 0.1764706, 1, 1,
0.3114009, -1.086629, 1.451812, 0, 0.172549, 1, 1,
0.3121758, 2.307441, 0.3872814, 0, 0.1647059, 1, 1,
0.3189177, 0.9341736, -1.038684, 0, 0.1607843, 1, 1,
0.3203461, 1.089564, 0.3942653, 0, 0.1529412, 1, 1,
0.320796, -0.2836284, 1.409767, 0, 0.1490196, 1, 1,
0.3231067, 0.2816307, 2.239583, 0, 0.1411765, 1, 1,
0.3238423, 0.748503, -0.5615896, 0, 0.1372549, 1, 1,
0.3242211, 0.539588, 1.773178, 0, 0.1294118, 1, 1,
0.3264445, -0.4112303, 2.044838, 0, 0.1254902, 1, 1,
0.3295898, 1.401694, 0.2626897, 0, 0.1176471, 1, 1,
0.332164, 0.1423697, 1.61012, 0, 0.1137255, 1, 1,
0.3379804, -0.2755159, 4.00528, 0, 0.1058824, 1, 1,
0.3454276, 1.002062, -0.1466063, 0, 0.09803922, 1, 1,
0.3478259, -0.7195634, 1.041292, 0, 0.09411765, 1, 1,
0.355244, -2.018381, 3.623062, 0, 0.08627451, 1, 1,
0.3580391, -0.3197125, 2.04386, 0, 0.08235294, 1, 1,
0.3605556, 2.016463, 0.9207633, 0, 0.07450981, 1, 1,
0.3614283, 1.818235, 0.5133767, 0, 0.07058824, 1, 1,
0.3642235, -0.3405768, 2.288441, 0, 0.0627451, 1, 1,
0.369288, 1.178955, 3.262174, 0, 0.05882353, 1, 1,
0.370507, -1.046431, 2.490936, 0, 0.05098039, 1, 1,
0.372947, 1.262581, 0.5271544, 0, 0.04705882, 1, 1,
0.3744411, -0.5084736, 3.018767, 0, 0.03921569, 1, 1,
0.3769642, 0.250513, 1.221768, 0, 0.03529412, 1, 1,
0.377936, 0.9038439, -0.5095389, 0, 0.02745098, 1, 1,
0.3780803, -1.268574, 2.281162, 0, 0.02352941, 1, 1,
0.3807252, -0.1668369, 1.689199, 0, 0.01568628, 1, 1,
0.3835587, 0.8250512, 1.331773, 0, 0.01176471, 1, 1,
0.3843904, 3.250304, 0.05372518, 0, 0.003921569, 1, 1,
0.3848374, 0.1564896, 0.2582429, 0.003921569, 0, 1, 1,
0.3866749, 0.8954552, 0.1199407, 0.007843138, 0, 1, 1,
0.3867204, 0.3015841, 1.127778, 0.01568628, 0, 1, 1,
0.3903796, 0.5293102, 0.1807393, 0.01960784, 0, 1, 1,
0.3907304, 0.7065686, 0.9043068, 0.02745098, 0, 1, 1,
0.3923948, 0.2110559, -1.115891, 0.03137255, 0, 1, 1,
0.3930787, -0.2027604, 1.688914, 0.03921569, 0, 1, 1,
0.3966045, -0.9497268, 2.408, 0.04313726, 0, 1, 1,
0.3992144, -0.7130267, 4.156768, 0.05098039, 0, 1, 1,
0.3995235, 0.8345302, 0.8453043, 0.05490196, 0, 1, 1,
0.4100688, -0.2594723, 1.957468, 0.0627451, 0, 1, 1,
0.4106599, 1.290013, 1.452802, 0.06666667, 0, 1, 1,
0.4117053, -1.0356, 2.519752, 0.07450981, 0, 1, 1,
0.423401, -0.3704622, 3.683712, 0.07843138, 0, 1, 1,
0.4254824, -1.116998, 3.321305, 0.08627451, 0, 1, 1,
0.4285064, -0.4433429, 2.080684, 0.09019608, 0, 1, 1,
0.4384634, 1.72209, -0.6901413, 0.09803922, 0, 1, 1,
0.4430296, -0.9347965, 2.700582, 0.1058824, 0, 1, 1,
0.447924, 0.5660036, 1.274883, 0.1098039, 0, 1, 1,
0.4518538, -1.291988, 3.507708, 0.1176471, 0, 1, 1,
0.4537339, 1.050598, 2.257037, 0.1215686, 0, 1, 1,
0.4564128, -0.5167913, 1.696039, 0.1294118, 0, 1, 1,
0.4570516, -1.063677, 1.995235, 0.1333333, 0, 1, 1,
0.4596715, -1.87906, 2.182977, 0.1411765, 0, 1, 1,
0.4598895, -0.4966725, 2.892807, 0.145098, 0, 1, 1,
0.4613941, -0.8966431, 1.657794, 0.1529412, 0, 1, 1,
0.4772676, 0.1139323, 1.164831, 0.1568628, 0, 1, 1,
0.477601, 1.119929, -0.3591704, 0.1647059, 0, 1, 1,
0.4830007, 0.7644952, -0.8946105, 0.1686275, 0, 1, 1,
0.4971181, 1.63735, 1.169067, 0.1764706, 0, 1, 1,
0.4978765, -0.9214726, 2.321209, 0.1803922, 0, 1, 1,
0.4985445, -0.291799, 2.831266, 0.1882353, 0, 1, 1,
0.4994149, -0.4484483, 4.53856, 0.1921569, 0, 1, 1,
0.5025662, 0.5477737, 1.375288, 0.2, 0, 1, 1,
0.5078083, 0.2401353, 3.385441, 0.2078431, 0, 1, 1,
0.511692, -1.618656, 1.756627, 0.2117647, 0, 1, 1,
0.511753, 1.159356, -0.3058358, 0.2196078, 0, 1, 1,
0.5124533, -1.321845, 3.714501, 0.2235294, 0, 1, 1,
0.521605, -1.106964, 2.379588, 0.2313726, 0, 1, 1,
0.5277252, 1.741505, 0.7618933, 0.2352941, 0, 1, 1,
0.5284621, -3.00771, 1.458054, 0.2431373, 0, 1, 1,
0.5342228, 1.150202, 1.313786, 0.2470588, 0, 1, 1,
0.538997, -1.662619, 1.841597, 0.254902, 0, 1, 1,
0.5400087, -0.1289003, 2.329201, 0.2588235, 0, 1, 1,
0.5511036, 0.07931107, 1.854001, 0.2666667, 0, 1, 1,
0.5519769, -1.717666, 4.021152, 0.2705882, 0, 1, 1,
0.5659745, 0.3962817, 0.3775267, 0.2784314, 0, 1, 1,
0.5686105, -0.3412722, 2.489863, 0.282353, 0, 1, 1,
0.5687129, 0.2401093, 0.9920048, 0.2901961, 0, 1, 1,
0.5730422, 0.9473222, 0.9341401, 0.2941177, 0, 1, 1,
0.5732707, -0.5033535, 1.886276, 0.3019608, 0, 1, 1,
0.5737141, 0.7110848, 0.8677158, 0.3098039, 0, 1, 1,
0.580768, -1.016851, 1.993185, 0.3137255, 0, 1, 1,
0.5816753, -0.5676605, 3.902711, 0.3215686, 0, 1, 1,
0.5821885, -1.00155, 4.201537, 0.3254902, 0, 1, 1,
0.5825706, 0.5548272, -0.2698431, 0.3333333, 0, 1, 1,
0.5853581, -1.337278, 1.55057, 0.3372549, 0, 1, 1,
0.5879443, -0.7098699, 1.625406, 0.345098, 0, 1, 1,
0.5884729, 0.1849689, 0.9699833, 0.3490196, 0, 1, 1,
0.5911914, -0.5646615, 0.6762868, 0.3568628, 0, 1, 1,
0.5925712, 1.703379, -0.172943, 0.3607843, 0, 1, 1,
0.5934774, -0.1943737, 3.248848, 0.3686275, 0, 1, 1,
0.5989436, 0.8266087, 0.8705599, 0.372549, 0, 1, 1,
0.6014169, -1.455502, 3.092688, 0.3803922, 0, 1, 1,
0.6043501, -1.211369, 1.606644, 0.3843137, 0, 1, 1,
0.6052659, -0.1763089, 1.424217, 0.3921569, 0, 1, 1,
0.6071037, 1.004802, 1.428173, 0.3960784, 0, 1, 1,
0.6147496, -0.5978425, 4.07274, 0.4039216, 0, 1, 1,
0.6156391, 0.766303, 1.272479, 0.4117647, 0, 1, 1,
0.6160802, -0.8381881, 2.061681, 0.4156863, 0, 1, 1,
0.6170746, 0.1332795, 2.821906, 0.4235294, 0, 1, 1,
0.626478, 1.05249, 0.376689, 0.427451, 0, 1, 1,
0.6273687, 1.84885, 0.2327137, 0.4352941, 0, 1, 1,
0.6332651, -0.02655788, 1.23182, 0.4392157, 0, 1, 1,
0.6447326, 1.298901, 1.225189, 0.4470588, 0, 1, 1,
0.6455414, 0.9557602, 0.7746647, 0.4509804, 0, 1, 1,
0.6464942, -1.891128, 3.105526, 0.4588235, 0, 1, 1,
0.646857, -1.801711, 3.275924, 0.4627451, 0, 1, 1,
0.6481808, -0.09829613, 1.539893, 0.4705882, 0, 1, 1,
0.6555288, 0.656921, 1.871264, 0.4745098, 0, 1, 1,
0.6573449, 1.833643, 0.1146786, 0.4823529, 0, 1, 1,
0.6602381, 1.525022, 0.1718654, 0.4862745, 0, 1, 1,
0.6622136, 0.0170159, 0.9311218, 0.4941176, 0, 1, 1,
0.6652765, -1.675236, 1.813408, 0.5019608, 0, 1, 1,
0.6687208, -0.4836238, 2.670357, 0.5058824, 0, 1, 1,
0.6687428, -0.3097162, 2.101676, 0.5137255, 0, 1, 1,
0.6699126, -0.7719612, 1.406048, 0.5176471, 0, 1, 1,
0.6724102, 0.2046339, 1.034741, 0.5254902, 0, 1, 1,
0.6756287, 0.2965416, -0.1223792, 0.5294118, 0, 1, 1,
0.6781369, -0.4364852, 3.563802, 0.5372549, 0, 1, 1,
0.6849556, 0.9887918, 2.280223, 0.5411765, 0, 1, 1,
0.6849877, 0.766389, -0.3158793, 0.5490196, 0, 1, 1,
0.6851808, -1.411462, 2.350009, 0.5529412, 0, 1, 1,
0.6852173, -0.08647832, 3.669947, 0.5607843, 0, 1, 1,
0.6855353, 0.4859374, 1.558032, 0.5647059, 0, 1, 1,
0.6866413, -1.106898, 2.380825, 0.572549, 0, 1, 1,
0.6919872, -0.4536542, 2.559149, 0.5764706, 0, 1, 1,
0.6920233, -0.3630302, 1.187661, 0.5843138, 0, 1, 1,
0.6996934, 0.2652203, 2.585654, 0.5882353, 0, 1, 1,
0.7006188, -0.1504714, 1.780695, 0.5960785, 0, 1, 1,
0.7006435, -0.6925011, 1.4931, 0.6039216, 0, 1, 1,
0.7036115, -0.1781022, 0.6363486, 0.6078432, 0, 1, 1,
0.7037584, -0.7637553, 1.685628, 0.6156863, 0, 1, 1,
0.7089413, 0.6970431, 0.9483073, 0.6196079, 0, 1, 1,
0.7306519, -1.020255, 1.526563, 0.627451, 0, 1, 1,
0.7315696, -0.5184197, 3.478598, 0.6313726, 0, 1, 1,
0.736023, -0.1712305, 2.635679, 0.6392157, 0, 1, 1,
0.7380885, 0.5225379, 1.492426, 0.6431373, 0, 1, 1,
0.7387338, -0.9586684, 1.908889, 0.6509804, 0, 1, 1,
0.7389462, 2.071087, 1.022817, 0.654902, 0, 1, 1,
0.7394195, 0.937744, 0.9448583, 0.6627451, 0, 1, 1,
0.7419192, -0.3883687, 2.475325, 0.6666667, 0, 1, 1,
0.7444302, -0.1592375, 3.578085, 0.6745098, 0, 1, 1,
0.7471107, 0.5519221, 2.515404, 0.6784314, 0, 1, 1,
0.7521692, -1.269325, 3.318965, 0.6862745, 0, 1, 1,
0.7538052, -1.555523, 2.805261, 0.6901961, 0, 1, 1,
0.7604421, -0.7621405, 1.920246, 0.6980392, 0, 1, 1,
0.7635444, -0.6139566, 0.6027918, 0.7058824, 0, 1, 1,
0.7647848, 0.096984, 2.201863, 0.7098039, 0, 1, 1,
0.7684773, -0.1449225, 1.475299, 0.7176471, 0, 1, 1,
0.7712224, 1.228177, -1.701551, 0.7215686, 0, 1, 1,
0.7796566, 0.2400062, 1.275194, 0.7294118, 0, 1, 1,
0.7811069, -0.9534214, 3.435577, 0.7333333, 0, 1, 1,
0.7839823, 0.196254, 2.270716, 0.7411765, 0, 1, 1,
0.7883904, -0.1876491, 1.669856, 0.7450981, 0, 1, 1,
0.794108, -0.4443859, 1.693556, 0.7529412, 0, 1, 1,
0.7969549, -1.451885, 3.947979, 0.7568628, 0, 1, 1,
0.8063083, 0.2842634, 2.100713, 0.7647059, 0, 1, 1,
0.8107162, 0.4936093, 2.034659, 0.7686275, 0, 1, 1,
0.8127278, -0.6667824, 2.967012, 0.7764706, 0, 1, 1,
0.8128, -1.185114, 2.643333, 0.7803922, 0, 1, 1,
0.8169766, 0.07273479, 0.5816167, 0.7882353, 0, 1, 1,
0.8200659, -0.2294259, 0.3185812, 0.7921569, 0, 1, 1,
0.8323994, -0.7767736, 0.08859137, 0.8, 0, 1, 1,
0.832809, -0.855168, 3.624197, 0.8078431, 0, 1, 1,
0.8396189, -0.3709425, 2.262087, 0.8117647, 0, 1, 1,
0.8442497, -0.1887039, 2.379614, 0.8196079, 0, 1, 1,
0.8549888, -1.020722, 2.695736, 0.8235294, 0, 1, 1,
0.8565173, -0.2053008, 1.89149, 0.8313726, 0, 1, 1,
0.866304, 0.9060473, -1.513351, 0.8352941, 0, 1, 1,
0.8708198, -1.134389, 0.3904951, 0.8431373, 0, 1, 1,
0.8788352, -0.6862883, 1.413015, 0.8470588, 0, 1, 1,
0.8800035, 0.1574139, 0.9586058, 0.854902, 0, 1, 1,
0.8824358, -1.286569, 2.65957, 0.8588235, 0, 1, 1,
0.8826549, 2.685091, -0.7214115, 0.8666667, 0, 1, 1,
0.9027131, -0.09427364, 1.162598, 0.8705882, 0, 1, 1,
0.9037084, 0.3863039, 0.8298618, 0.8784314, 0, 1, 1,
0.9066845, 1.628725, 0.9286262, 0.8823529, 0, 1, 1,
0.9077601, -0.5356234, 0.7652, 0.8901961, 0, 1, 1,
0.9095736, -0.1247022, 1.073493, 0.8941177, 0, 1, 1,
0.9096162, -1.008576, 1.793393, 0.9019608, 0, 1, 1,
0.9120931, -0.2950151, 1.775544, 0.9098039, 0, 1, 1,
0.9124694, 0.7355962, 2.249443, 0.9137255, 0, 1, 1,
0.9133363, 1.194281, 1.593562, 0.9215686, 0, 1, 1,
0.9146616, 1.34907, -0.6929619, 0.9254902, 0, 1, 1,
0.9221731, -0.6547282, 3.342247, 0.9333333, 0, 1, 1,
0.923306, -1.099894, 2.329031, 0.9372549, 0, 1, 1,
0.9234035, 0.5438787, 0.2676046, 0.945098, 0, 1, 1,
0.9244764, -1.098898, 2.334548, 0.9490196, 0, 1, 1,
0.9260397, -1.582034, 2.525886, 0.9568627, 0, 1, 1,
0.9282197, -0.9751688, 3.178285, 0.9607843, 0, 1, 1,
0.9303185, 0.6922763, 0.7354853, 0.9686275, 0, 1, 1,
0.9375091, 3.774004, -1.147308, 0.972549, 0, 1, 1,
0.9531687, -0.4319211, 0.9872203, 0.9803922, 0, 1, 1,
0.953976, 0.3137692, -0.2022045, 0.9843137, 0, 1, 1,
0.9552256, -0.9660907, 1.987408, 0.9921569, 0, 1, 1,
0.9598259, -0.4021751, 0.7815008, 0.9960784, 0, 1, 1,
0.9644438, 0.1425448, 0.7056774, 1, 0, 0.9960784, 1,
0.9647433, 1.963673, 0.9789736, 1, 0, 0.9882353, 1,
0.965851, -0.8108547, 3.874047, 1, 0, 0.9843137, 1,
0.9697982, 1.357198, 1.306403, 1, 0, 0.9764706, 1,
0.9699468, -1.335768, 2.444178, 1, 0, 0.972549, 1,
0.9702602, -0.1347682, 1.681957, 1, 0, 0.9647059, 1,
0.9724212, -0.957166, 3.287832, 1, 0, 0.9607843, 1,
0.9779073, -1.324871, 1.764482, 1, 0, 0.9529412, 1,
0.9788812, 0.7115714, -0.03414156, 1, 0, 0.9490196, 1,
0.9796656, 0.3635063, 3.098329, 1, 0, 0.9411765, 1,
0.9803329, -0.03169375, 1.866904, 1, 0, 0.9372549, 1,
0.9831296, -0.3335409, 1.818747, 1, 0, 0.9294118, 1,
0.9851809, 0.4004745, 1.734809, 1, 0, 0.9254902, 1,
0.9908214, 0.5983498, 0.2055425, 1, 0, 0.9176471, 1,
0.9913569, -1.411901, 1.487894, 1, 0, 0.9137255, 1,
0.9943586, -1.47625, 3.0444, 1, 0, 0.9058824, 1,
0.9976415, 0.1863897, 2.016386, 1, 0, 0.9019608, 1,
1.007346, 1.09713, -0.01727556, 1, 0, 0.8941177, 1,
1.010401, -0.9480288, 0.8528737, 1, 0, 0.8862745, 1,
1.017212, -0.7226812, 0.4782206, 1, 0, 0.8823529, 1,
1.024067, 2.200264, 2.267129, 1, 0, 0.8745098, 1,
1.031301, -1.939491, 2.871804, 1, 0, 0.8705882, 1,
1.041402, 2.446349, 1.520463, 1, 0, 0.8627451, 1,
1.043788, 1.225137, 0.8411717, 1, 0, 0.8588235, 1,
1.044185, -1.12393, 4.629917, 1, 0, 0.8509804, 1,
1.046111, -0.6677808, 2.118046, 1, 0, 0.8470588, 1,
1.049254, -0.6012139, 2.82592, 1, 0, 0.8392157, 1,
1.052106, -0.1476939, 1.863848, 1, 0, 0.8352941, 1,
1.057201, -0.7175503, 1.147478, 1, 0, 0.827451, 1,
1.067501, -0.6370837, 0.8169553, 1, 0, 0.8235294, 1,
1.072465, 0.780948, 0.3104337, 1, 0, 0.8156863, 1,
1.084281, -1.103786, 2.143004, 1, 0, 0.8117647, 1,
1.087672, 0.1772792, 1.346285, 1, 0, 0.8039216, 1,
1.0903, 0.2893776, 1.001643, 1, 0, 0.7960784, 1,
1.095146, 1.669848, 2.158935, 1, 0, 0.7921569, 1,
1.095614, -0.1461718, 0.2273193, 1, 0, 0.7843137, 1,
1.102998, -1.248651, 4.224704, 1, 0, 0.7803922, 1,
1.104688, 0.04281985, 1.550643, 1, 0, 0.772549, 1,
1.105414, 0.1952211, 0.5307078, 1, 0, 0.7686275, 1,
1.109623, 2.244061, -0.464598, 1, 0, 0.7607843, 1,
1.112196, -0.5743924, 0.6422768, 1, 0, 0.7568628, 1,
1.122061, -1.082118, 2.6504, 1, 0, 0.7490196, 1,
1.126283, 0.03518569, 2.471708, 1, 0, 0.7450981, 1,
1.135275, 1.420836, 0.4834048, 1, 0, 0.7372549, 1,
1.138192, 0.5127393, 0.01432912, 1, 0, 0.7333333, 1,
1.138251, 1.292053, 1.008952, 1, 0, 0.7254902, 1,
1.140021, -0.7768428, 1.924577, 1, 0, 0.7215686, 1,
1.140433, -1.25365, 1.051211, 1, 0, 0.7137255, 1,
1.148284, -2.398854, 2.804241, 1, 0, 0.7098039, 1,
1.150868, 0.876, 1.390893, 1, 0, 0.7019608, 1,
1.153363, 0.6786512, 0.5107626, 1, 0, 0.6941177, 1,
1.157589, -0.5437232, 2.836359, 1, 0, 0.6901961, 1,
1.166718, 0.3100117, -0.4729168, 1, 0, 0.682353, 1,
1.175845, -0.6882759, 2.53322, 1, 0, 0.6784314, 1,
1.176094, 0.3749179, -0.4007936, 1, 0, 0.6705883, 1,
1.177946, -0.3912784, 3.653646, 1, 0, 0.6666667, 1,
1.180202, 0.4020603, 1.999265, 1, 0, 0.6588235, 1,
1.183293, 0.3832384, 0.1743447, 1, 0, 0.654902, 1,
1.186503, 1.411389, 0.8430256, 1, 0, 0.6470588, 1,
1.186717, -1.585023, 3.274682, 1, 0, 0.6431373, 1,
1.187887, 1.408941, -0.8556667, 1, 0, 0.6352941, 1,
1.200175, 0.6413402, 1.25504, 1, 0, 0.6313726, 1,
1.200453, -0.7038006, 1.634774, 1, 0, 0.6235294, 1,
1.205279, 0.1270001, 1.357231, 1, 0, 0.6196079, 1,
1.225847, 1.044324, -0.546741, 1, 0, 0.6117647, 1,
1.229835, -0.2519458, 3.642627, 1, 0, 0.6078432, 1,
1.237411, -0.02068056, 2.55838, 1, 0, 0.6, 1,
1.239059, 1.230648, 0.4279692, 1, 0, 0.5921569, 1,
1.239599, 1.342256, -0.05146313, 1, 0, 0.5882353, 1,
1.241288, 1.062631, 1.259768, 1, 0, 0.5803922, 1,
1.2431, -2.291299, 1.000763, 1, 0, 0.5764706, 1,
1.258492, 1.902808, 2.420443, 1, 0, 0.5686275, 1,
1.273917, -0.07432619, -0.3533148, 1, 0, 0.5647059, 1,
1.279215, -0.3851686, 0.4912261, 1, 0, 0.5568628, 1,
1.281901, -0.3213132, 1.221846, 1, 0, 0.5529412, 1,
1.282955, -0.8682839, 2.263465, 1, 0, 0.5450981, 1,
1.28637, 0.3694374, 0.9648477, 1, 0, 0.5411765, 1,
1.291287, -0.6704494, 1.513914, 1, 0, 0.5333334, 1,
1.301927, 0.1364755, 1.401251, 1, 0, 0.5294118, 1,
1.307678, 1.131414, 0.9475002, 1, 0, 0.5215687, 1,
1.315033, -0.7979014, 3.118425, 1, 0, 0.5176471, 1,
1.316322, -0.9791777, 2.057736, 1, 0, 0.509804, 1,
1.316671, -1.18436, 1.198258, 1, 0, 0.5058824, 1,
1.317516, 0.2434528, 1.748951, 1, 0, 0.4980392, 1,
1.326008, -0.02234124, 2.786732, 1, 0, 0.4901961, 1,
1.334428, 0.5293778, -0.04223292, 1, 0, 0.4862745, 1,
1.334536, -1.033993, 2.121974, 1, 0, 0.4784314, 1,
1.35308, 0.6808503, 0.8222583, 1, 0, 0.4745098, 1,
1.360752, 0.3164389, 1.765128, 1, 0, 0.4666667, 1,
1.362916, 0.9098312, 0.5264902, 1, 0, 0.4627451, 1,
1.370611, 1.02569, 0.9928745, 1, 0, 0.454902, 1,
1.375919, 1.152798, 0.9833556, 1, 0, 0.4509804, 1,
1.379341, 0.3911809, 1.833229, 1, 0, 0.4431373, 1,
1.395783, 0.2171774, 2.377289, 1, 0, 0.4392157, 1,
1.412555, -0.9585185, 2.444061, 1, 0, 0.4313726, 1,
1.415787, 0.6461841, -0.1824933, 1, 0, 0.427451, 1,
1.422034, 0.7372331, -0.4015273, 1, 0, 0.4196078, 1,
1.427259, 0.1074601, 1.936201, 1, 0, 0.4156863, 1,
1.43956, 0.5489805, 1.518955, 1, 0, 0.4078431, 1,
1.44077, -0.5405337, 2.98113, 1, 0, 0.4039216, 1,
1.444268, 2.153768, 0.152799, 1, 0, 0.3960784, 1,
1.451648, 1.008777, 0.1394194, 1, 0, 0.3882353, 1,
1.459389, -1.236343, 3.657589, 1, 0, 0.3843137, 1,
1.464037, 0.06758776, 1.70544, 1, 0, 0.3764706, 1,
1.490232, -0.7548027, 2.615727, 1, 0, 0.372549, 1,
1.499539, -0.6594136, 0.8026842, 1, 0, 0.3647059, 1,
1.543466, 0.9626996, -0.9387567, 1, 0, 0.3607843, 1,
1.54358, 0.8406543, 0.1994945, 1, 0, 0.3529412, 1,
1.549879, -0.7621052, 2.120151, 1, 0, 0.3490196, 1,
1.558084, -1.026851, 2.075664, 1, 0, 0.3411765, 1,
1.560769, 0.107903, 0.9308428, 1, 0, 0.3372549, 1,
1.581764, -1.354264, 1.616913, 1, 0, 0.3294118, 1,
1.591739, -0.1630337, 2.674873, 1, 0, 0.3254902, 1,
1.592767, -0.06619308, 2.030437, 1, 0, 0.3176471, 1,
1.596089, -0.1804661, 0.5367376, 1, 0, 0.3137255, 1,
1.60295, 0.7151196, 2.386933, 1, 0, 0.3058824, 1,
1.62316, 1.538789, 0.2748723, 1, 0, 0.2980392, 1,
1.645082, -0.4284655, 3.401802, 1, 0, 0.2941177, 1,
1.654973, -0.07275923, 2.354198, 1, 0, 0.2862745, 1,
1.655812, 0.7317042, 2.94827, 1, 0, 0.282353, 1,
1.662138, 0.2868622, 3.331078, 1, 0, 0.2745098, 1,
1.667718, -1.371991, 4.222836, 1, 0, 0.2705882, 1,
1.678324, 1.574282, 2.513623, 1, 0, 0.2627451, 1,
1.698547, 1.282487, -1.978887, 1, 0, 0.2588235, 1,
1.702826, -0.5824086, 0.2860091, 1, 0, 0.2509804, 1,
1.703787, 0.8903612, 1.701423, 1, 0, 0.2470588, 1,
1.703882, 0.4532821, 0.8515767, 1, 0, 0.2392157, 1,
1.705552, 1.080257, 1.020083, 1, 0, 0.2352941, 1,
1.720305, -0.6916431, 0.8784716, 1, 0, 0.227451, 1,
1.721617, 1.290821, 0.9449275, 1, 0, 0.2235294, 1,
1.723165, 0.6155981, -1.263834, 1, 0, 0.2156863, 1,
1.732301, -0.7378091, 0.8134562, 1, 0, 0.2117647, 1,
1.745144, -2.242658, 1.397381, 1, 0, 0.2039216, 1,
1.769622, -0.530376, 1.273159, 1, 0, 0.1960784, 1,
1.822963, -0.7071103, 1.290299, 1, 0, 0.1921569, 1,
1.852182, -1.505737, 2.872466, 1, 0, 0.1843137, 1,
1.876365, -1.076001, 1.454054, 1, 0, 0.1803922, 1,
1.918208, -1.838424, 3.671414, 1, 0, 0.172549, 1,
1.922204, -1.130204, 2.284851, 1, 0, 0.1686275, 1,
1.928066, -0.9464049, 1.555138, 1, 0, 0.1607843, 1,
1.932447, -0.5447385, 2.151431, 1, 0, 0.1568628, 1,
1.937591, -0.1263336, 0.1043153, 1, 0, 0.1490196, 1,
1.956146, -0.5882125, 1.487201, 1, 0, 0.145098, 1,
1.971726, -0.8714256, 2.042695, 1, 0, 0.1372549, 1,
1.992707, 0.5172113, 0.518836, 1, 0, 0.1333333, 1,
2.002298, -0.2192855, 2.765627, 1, 0, 0.1254902, 1,
2.105043, -0.8565649, 0.7849333, 1, 0, 0.1215686, 1,
2.119205, -0.2686723, 2.056863, 1, 0, 0.1137255, 1,
2.143262, 0.3035244, 1.616412, 1, 0, 0.1098039, 1,
2.145856, 0.573558, 2.156862, 1, 0, 0.1019608, 1,
2.147681, -0.8110149, 2.716772, 1, 0, 0.09411765, 1,
2.159497, 1.382348, 0.03363645, 1, 0, 0.09019608, 1,
2.177919, -2.195076, 3.06453, 1, 0, 0.08235294, 1,
2.22792, -0.1673126, 0.3661388, 1, 0, 0.07843138, 1,
2.284889, 1.455757, 1.162993, 1, 0, 0.07058824, 1,
2.346231, -0.6993909, 2.955757, 1, 0, 0.06666667, 1,
2.348154, 1.618038, 1.220178, 1, 0, 0.05882353, 1,
2.4131, 0.1131527, 0.9240374, 1, 0, 0.05490196, 1,
2.444901, -0.1186404, 2.108165, 1, 0, 0.04705882, 1,
2.487646, 1.098467, 0.3848703, 1, 0, 0.04313726, 1,
2.647116, -1.051532, -0.853065, 1, 0, 0.03529412, 1,
2.729888, 0.09979796, 1.177444, 1, 0, 0.03137255, 1,
2.763199, 1.682199, 1.503153, 1, 0, 0.02352941, 1,
2.852838, 0.4208165, 2.215144, 1, 0, 0.01960784, 1,
3.04838, 0.3104324, 1.288126, 1, 0, 0.01176471, 1,
3.79881, -0.2178246, 2.858597, 1, 0, 0.007843138, 1
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
0.2682267, -4.15721, -6.668383, 0, -0.5, 0.5, 0.5,
0.2682267, -4.15721, -6.668383, 1, -0.5, 0.5, 0.5,
0.2682267, -4.15721, -6.668383, 1, 1.5, 0.5, 0.5,
0.2682267, -4.15721, -6.668383, 0, 1.5, 0.5, 0.5
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
-4.459224, 0.3831474, -6.668383, 0, -0.5, 0.5, 0.5,
-4.459224, 0.3831474, -6.668383, 1, -0.5, 0.5, 0.5,
-4.459224, 0.3831474, -6.668383, 1, 1.5, 0.5, 0.5,
-4.459224, 0.3831474, -6.668383, 0, 1.5, 0.5, 0.5
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
-4.459224, -4.15721, 0.3766544, 0, -0.5, 0.5, 0.5,
-4.459224, -4.15721, 0.3766544, 1, -0.5, 0.5, 0.5,
-4.459224, -4.15721, 0.3766544, 1, 1.5, 0.5, 0.5,
-4.459224, -4.15721, 0.3766544, 0, 1.5, 0.5, 0.5
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
-2, -3.109435, -5.042605,
2, -3.109435, -5.042605,
-2, -3.109435, -5.042605,
-2, -3.284064, -5.313568,
0, -3.109435, -5.042605,
0, -3.284064, -5.313568,
2, -3.109435, -5.042605,
2, -3.284064, -5.313568
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
-2, -3.633322, -5.855494, 0, -0.5, 0.5, 0.5,
-2, -3.633322, -5.855494, 1, -0.5, 0.5, 0.5,
-2, -3.633322, -5.855494, 1, 1.5, 0.5, 0.5,
-2, -3.633322, -5.855494, 0, 1.5, 0.5, 0.5,
0, -3.633322, -5.855494, 0, -0.5, 0.5, 0.5,
0, -3.633322, -5.855494, 1, -0.5, 0.5, 0.5,
0, -3.633322, -5.855494, 1, 1.5, 0.5, 0.5,
0, -3.633322, -5.855494, 0, 1.5, 0.5, 0.5,
2, -3.633322, -5.855494, 0, -0.5, 0.5, 0.5,
2, -3.633322, -5.855494, 1, -0.5, 0.5, 0.5,
2, -3.633322, -5.855494, 1, 1.5, 0.5, 0.5,
2, -3.633322, -5.855494, 0, 1.5, 0.5, 0.5
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
-3.368274, -3, -5.042605,
-3.368274, 3, -5.042605,
-3.368274, -3, -5.042605,
-3.550099, -3, -5.313568,
-3.368274, -2, -5.042605,
-3.550099, -2, -5.313568,
-3.368274, -1, -5.042605,
-3.550099, -1, -5.313568,
-3.368274, 0, -5.042605,
-3.550099, 0, -5.313568,
-3.368274, 1, -5.042605,
-3.550099, 1, -5.313568,
-3.368274, 2, -5.042605,
-3.550099, 2, -5.313568,
-3.368274, 3, -5.042605,
-3.550099, 3, -5.313568
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
-3.913749, -3, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, -3, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, -3, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, -3, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, -2, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, -2, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, -2, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, -2, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, -1, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, -1, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, -1, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, -1, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, 0, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, 0, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, 0, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, 0, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, 1, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, 1, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, 1, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, 1, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, 2, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, 2, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, 2, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, 2, -5.855494, 0, 1.5, 0.5, 0.5,
-3.913749, 3, -5.855494, 0, -0.5, 0.5, 0.5,
-3.913749, 3, -5.855494, 1, -0.5, 0.5, 0.5,
-3.913749, 3, -5.855494, 1, 1.5, 0.5, 0.5,
-3.913749, 3, -5.855494, 0, 1.5, 0.5, 0.5
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
-3.368274, -3.109435, -4,
-3.368274, -3.109435, 4,
-3.368274, -3.109435, -4,
-3.550099, -3.284064, -4,
-3.368274, -3.109435, -2,
-3.550099, -3.284064, -2,
-3.368274, -3.109435, 0,
-3.550099, -3.284064, 0,
-3.368274, -3.109435, 2,
-3.550099, -3.284064, 2,
-3.368274, -3.109435, 4,
-3.550099, -3.284064, 4
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
-3.913749, -3.633322, -4, 0, -0.5, 0.5, 0.5,
-3.913749, -3.633322, -4, 1, -0.5, 0.5, 0.5,
-3.913749, -3.633322, -4, 1, 1.5, 0.5, 0.5,
-3.913749, -3.633322, -4, 0, 1.5, 0.5, 0.5,
-3.913749, -3.633322, -2, 0, -0.5, 0.5, 0.5,
-3.913749, -3.633322, -2, 1, -0.5, 0.5, 0.5,
-3.913749, -3.633322, -2, 1, 1.5, 0.5, 0.5,
-3.913749, -3.633322, -2, 0, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 0, 0, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 0, 1, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 0, 1, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 0, 0, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 2, 0, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 2, 1, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 2, 1, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 2, 0, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 4, 0, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 4, 1, -0.5, 0.5, 0.5,
-3.913749, -3.633322, 4, 1, 1.5, 0.5, 0.5,
-3.913749, -3.633322, 4, 0, 1.5, 0.5, 0.5
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
-3.368274, -3.109435, -5.042605,
-3.368274, 3.87573, -5.042605,
-3.368274, -3.109435, 5.795914,
-3.368274, 3.87573, 5.795914,
-3.368274, -3.109435, -5.042605,
-3.368274, -3.109435, 5.795914,
-3.368274, 3.87573, -5.042605,
-3.368274, 3.87573, 5.795914,
-3.368274, -3.109435, -5.042605,
3.904727, -3.109435, -5.042605,
-3.368274, -3.109435, 5.795914,
3.904727, -3.109435, 5.795914,
-3.368274, 3.87573, -5.042605,
3.904727, 3.87573, -5.042605,
-3.368274, 3.87573, 5.795914,
3.904727, 3.87573, 5.795914,
3.904727, -3.109435, -5.042605,
3.904727, 3.87573, -5.042605,
3.904727, -3.109435, 5.795914,
3.904727, 3.87573, 5.795914,
3.904727, -3.109435, -5.042605,
3.904727, -3.109435, 5.795914,
3.904727, 3.87573, -5.042605,
3.904727, 3.87573, 5.795914
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
var radius = 7.905123;
var distance = 35.17078;
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
mvMatrix.translate( -0.2682267, -0.3831474, -0.3766544 );
mvMatrix.scale( 1.175192, 1.223618, 0.7885925 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17078);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
daminozide<-read.table("daminozide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-daminozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
```

```r
y<-daminozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
```

```r
z<-daminozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
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
-3.262356, 1.414293, -0.4877544, 0, 0, 1, 1, 1,
-2.623961, -1.112702, -3.887808, 1, 0, 0, 1, 1,
-2.597396, 0.167084, 0.9805699, 1, 0, 0, 1, 1,
-2.502271, 0.8917966, -1.361573, 1, 0, 0, 1, 1,
-2.494066, 0.6545482, -0.5011655, 1, 0, 0, 1, 1,
-2.396256, -0.2302405, 0.1885252, 1, 0, 0, 1, 1,
-2.308875, -0.4560758, -1.901979, 0, 0, 0, 1, 1,
-2.289515, 0.001088477, -0.2034295, 0, 0, 0, 1, 1,
-2.276582, -1.234138, -0.547318, 0, 0, 0, 1, 1,
-2.259976, 0.4165767, -1.249742, 0, 0, 0, 1, 1,
-2.243061, 0.7997164, -2.446476, 0, 0, 0, 1, 1,
-2.206822, 0.123166, -1.385741, 0, 0, 0, 1, 1,
-2.163998, -1.241315, -1.494145, 0, 0, 0, 1, 1,
-2.141515, 2.044212, 0.2887902, 1, 1, 1, 1, 1,
-2.094391, -0.732208, -4.311327, 1, 1, 1, 1, 1,
-2.078705, -1.254979, -2.955894, 1, 1, 1, 1, 1,
-2.039893, 1.546206, -0.6866958, 1, 1, 1, 1, 1,
-2.031104, 1.892916, -1.88104, 1, 1, 1, 1, 1,
-2.022701, 0.273929, -2.347916, 1, 1, 1, 1, 1,
-1.999317, 1.225063, -2.658436, 1, 1, 1, 1, 1,
-1.975703, -0.4769834, -3.260219, 1, 1, 1, 1, 1,
-1.922451, -2.608367, -1.489389, 1, 1, 1, 1, 1,
-1.922171, 1.16088, -0.7983569, 1, 1, 1, 1, 1,
-1.912481, 1.888576, -1.074489, 1, 1, 1, 1, 1,
-1.900369, 1.261175, 0.1304414, 1, 1, 1, 1, 1,
-1.898091, 2.478225, -1.330531, 1, 1, 1, 1, 1,
-1.895601, 0.4888216, -2.521565, 1, 1, 1, 1, 1,
-1.894922, -0.7055318, -3.492979, 1, 1, 1, 1, 1,
-1.886395, -0.01926476, -1.283633, 0, 0, 1, 1, 1,
-1.882071, 1.706801, -1.518745, 1, 0, 0, 1, 1,
-1.875293, -1.362708, -3.136719, 1, 0, 0, 1, 1,
-1.870473, 0.4449339, -0.1688365, 1, 0, 0, 1, 1,
-1.865839, -0.8541126, -2.28124, 1, 0, 0, 1, 1,
-1.853752, -0.5808852, -0.6326971, 1, 0, 0, 1, 1,
-1.843491, -0.6748686, -1.859779, 0, 0, 0, 1, 1,
-1.841118, -1.617311, -1.564128, 0, 0, 0, 1, 1,
-1.82858, 1.218262, -0.2939449, 0, 0, 0, 1, 1,
-1.795057, 1.533751, -0.5271996, 0, 0, 0, 1, 1,
-1.724994, -1.796909, -2.641768, 0, 0, 0, 1, 1,
-1.714014, 0.6647907, -1.678004, 0, 0, 0, 1, 1,
-1.701525, -1.026532, -1.729832, 0, 0, 0, 1, 1,
-1.699041, 0.6367849, -0.6064734, 1, 1, 1, 1, 1,
-1.693485, -0.6135442, -1.282509, 1, 1, 1, 1, 1,
-1.677145, -0.08164827, -2.074494, 1, 1, 1, 1, 1,
-1.667947, 0.5401107, -1.051516, 1, 1, 1, 1, 1,
-1.65614, 0.5291699, -1.025944, 1, 1, 1, 1, 1,
-1.655201, -0.0515243, -1.163455, 1, 1, 1, 1, 1,
-1.635045, -0.04077417, -0.5882737, 1, 1, 1, 1, 1,
-1.632189, 0.5935598, -0.7052091, 1, 1, 1, 1, 1,
-1.605349, 0.704722, -1.362436, 1, 1, 1, 1, 1,
-1.573474, 1.469078, -1.510269, 1, 1, 1, 1, 1,
-1.572718, -0.4445, -1.103613, 1, 1, 1, 1, 1,
-1.571893, -0.4186974, -2.890651, 1, 1, 1, 1, 1,
-1.569219, -0.177821, -0.7860119, 1, 1, 1, 1, 1,
-1.56453, -0.7652612, -2.164231, 1, 1, 1, 1, 1,
-1.549129, -0.5181291, -1.859682, 1, 1, 1, 1, 1,
-1.532954, 1.343451, -1.070115, 0, 0, 1, 1, 1,
-1.508047, -0.2860779, -1.267194, 1, 0, 0, 1, 1,
-1.506884, 0.9004257, -3.914105, 1, 0, 0, 1, 1,
-1.503114, 1.354058, -0.4711998, 1, 0, 0, 1, 1,
-1.501874, 0.8352277, -1.434057, 1, 0, 0, 1, 1,
-1.485285, -0.6039854, -1.779667, 1, 0, 0, 1, 1,
-1.48251, 0.8572558, -0.0776123, 0, 0, 0, 1, 1,
-1.451888, -0.1089575, -0.859939, 0, 0, 0, 1, 1,
-1.431627, -1.057775, -2.807719, 0, 0, 0, 1, 1,
-1.407331, -0.03733297, -0.507719, 0, 0, 0, 1, 1,
-1.402109, 1.236009, -2.101324, 0, 0, 0, 1, 1,
-1.393026, -1.003545, -3.062472, 0, 0, 0, 1, 1,
-1.392657, 0.5346159, -1.586754, 0, 0, 0, 1, 1,
-1.385964, -0.01782611, -2.433964, 1, 1, 1, 1, 1,
-1.384528, -0.523152, -2.85758, 1, 1, 1, 1, 1,
-1.377289, 0.9170258, -0.9478575, 1, 1, 1, 1, 1,
-1.372394, -0.4228939, -0.1145817, 1, 1, 1, 1, 1,
-1.372217, 0.7378207, -0.5871113, 1, 1, 1, 1, 1,
-1.366405, -1.212033, -2.621501, 1, 1, 1, 1, 1,
-1.35983, 1.671214, -0.4250425, 1, 1, 1, 1, 1,
-1.358449, -0.9599321, -2.021726, 1, 1, 1, 1, 1,
-1.338279, 0.359383, 0.4114978, 1, 1, 1, 1, 1,
-1.335367, -1.291091, -3.213257, 1, 1, 1, 1, 1,
-1.333602, -1.03895, -1.984131, 1, 1, 1, 1, 1,
-1.324418, 1.494812, -0.3472984, 1, 1, 1, 1, 1,
-1.322162, -2.957448, -1.968253, 1, 1, 1, 1, 1,
-1.319189, 1.085305, 0.605067, 1, 1, 1, 1, 1,
-1.315414, -1.299744, -3.91759, 1, 1, 1, 1, 1,
-1.299738, 0.6588116, -2.054563, 0, 0, 1, 1, 1,
-1.291282, 1.691537, -1.367599, 1, 0, 0, 1, 1,
-1.283986, -1.365376, -3.047336, 1, 0, 0, 1, 1,
-1.278902, 1.205478, -1.494813, 1, 0, 0, 1, 1,
-1.274271, 2.008133, 0.3845255, 1, 0, 0, 1, 1,
-1.263491, 0.3870464, -1.112308, 1, 0, 0, 1, 1,
-1.262212, 0.6712716, -0.1366365, 0, 0, 0, 1, 1,
-1.261378, -0.7831216, -2.518665, 0, 0, 0, 1, 1,
-1.257995, 0.5587313, -0.3562072, 0, 0, 0, 1, 1,
-1.255678, -0.3879721, -2.762186, 0, 0, 0, 1, 1,
-1.254862, -1.946621, -2.670758, 0, 0, 0, 1, 1,
-1.247017, -0.06982007, -1.586392, 0, 0, 0, 1, 1,
-1.238622, 0.03504942, -2.806578, 0, 0, 0, 1, 1,
-1.230554, 0.3443177, -3.056902, 1, 1, 1, 1, 1,
-1.226621, -0.5444386, -0.7190554, 1, 1, 1, 1, 1,
-1.216302, 0.9901252, -1.40766, 1, 1, 1, 1, 1,
-1.212876, -0.5449361, -1.033597, 1, 1, 1, 1, 1,
-1.209133, -0.3403782, -2.058981, 1, 1, 1, 1, 1,
-1.19719, -0.470433, -0.1282053, 1, 1, 1, 1, 1,
-1.195233, 1.682508, -0.4045223, 1, 1, 1, 1, 1,
-1.191935, 0.9600961, 0.339816, 1, 1, 1, 1, 1,
-1.191178, -0.3944213, -1.666536, 1, 1, 1, 1, 1,
-1.18142, 1.324961, 0.01694555, 1, 1, 1, 1, 1,
-1.180378, 1.389003, -1.828137, 1, 1, 1, 1, 1,
-1.179937, -0.3482236, -1.317534, 1, 1, 1, 1, 1,
-1.177941, 0.2017132, -0.8115031, 1, 1, 1, 1, 1,
-1.17251, -0.8022285, -1.855855, 1, 1, 1, 1, 1,
-1.171665, 0.7428405, -1.609055, 1, 1, 1, 1, 1,
-1.168307, 0.5415698, -1.485942, 0, 0, 1, 1, 1,
-1.156575, 0.1781225, -3.582037, 1, 0, 0, 1, 1,
-1.155086, -0.249392, -1.107167, 1, 0, 0, 1, 1,
-1.147822, 0.8938373, -0.7796855, 1, 0, 0, 1, 1,
-1.145558, 0.4751288, -2.204278, 1, 0, 0, 1, 1,
-1.139476, -0.937502, -3.034452, 1, 0, 0, 1, 1,
-1.139364, 2.379875, -0.7542148, 0, 0, 0, 1, 1,
-1.138705, 0.2631466, -2.000056, 0, 0, 0, 1, 1,
-1.138036, -0.7496455, -2.068967, 0, 0, 0, 1, 1,
-1.137514, 1.006135, -1.922964, 0, 0, 0, 1, 1,
-1.124056, 0.9782814, -1.998863, 0, 0, 0, 1, 1,
-1.123243, 0.1987552, -1.036073, 0, 0, 0, 1, 1,
-1.12303, -0.003373988, 0.2791539, 0, 0, 0, 1, 1,
-1.097539, -1.699434, -1.513026, 1, 1, 1, 1, 1,
-1.097401, -0.2571197, -0.5372424, 1, 1, 1, 1, 1,
-1.093364, -1.201806, -1.259493, 1, 1, 1, 1, 1,
-1.093008, 0.9765918, 0.3772357, 1, 1, 1, 1, 1,
-1.090028, 1.052886, 1.001348, 1, 1, 1, 1, 1,
-1.084838, 0.3289839, -2.438998, 1, 1, 1, 1, 1,
-1.083688, 0.7074863, -2.07609, 1, 1, 1, 1, 1,
-1.079553, 0.4337515, -1.520511, 1, 1, 1, 1, 1,
-1.074691, 1.067732, 0.8544405, 1, 1, 1, 1, 1,
-1.067922, 2.344511, 0.5234612, 1, 1, 1, 1, 1,
-1.063679, -1.761002, -2.580724, 1, 1, 1, 1, 1,
-1.062735, 1.615101, -0.7793947, 1, 1, 1, 1, 1,
-1.05952, 2.018501, -0.688885, 1, 1, 1, 1, 1,
-1.041881, 0.5176418, -0.7215045, 1, 1, 1, 1, 1,
-1.040395, 0.7407266, 0.9350137, 1, 1, 1, 1, 1,
-1.036148, -1.096543, -2.47053, 0, 0, 1, 1, 1,
-1.033182, 0.1995551, -1.719599, 1, 0, 0, 1, 1,
-1.031979, 0.6246355, -0.7375205, 1, 0, 0, 1, 1,
-1.029082, 1.46042, 0.5989335, 1, 0, 0, 1, 1,
-1.029005, 1.501676, 0.01107265, 1, 0, 0, 1, 1,
-1.025655, 0.638329, -1.240259, 1, 0, 0, 1, 1,
-1.021186, 0.1296945, -3.97705, 0, 0, 0, 1, 1,
-1.01459, -0.6916261, -1.654103, 0, 0, 0, 1, 1,
-1.010452, -0.2094519, -1.213576, 0, 0, 0, 1, 1,
-1.003839, 1.012141, -0.9418963, 0, 0, 0, 1, 1,
-0.9986518, -0.689925, -3.255595, 0, 0, 0, 1, 1,
-0.9976313, -0.1013628, -1.558523, 0, 0, 0, 1, 1,
-0.992682, 0.0875332, -1.717083, 0, 0, 0, 1, 1,
-0.9897423, 1.022169, -1.453442, 1, 1, 1, 1, 1,
-0.9865654, -1.627692, -1.793505, 1, 1, 1, 1, 1,
-0.9851578, 1.165748, -0.7039925, 1, 1, 1, 1, 1,
-0.9828749, -0.979063, -1.973724, 1, 1, 1, 1, 1,
-0.9723061, 0.7984502, -2.504498, 1, 1, 1, 1, 1,
-0.9721065, -0.8592373, -0.8745176, 1, 1, 1, 1, 1,
-0.9626839, -0.05709171, -2.87829, 1, 1, 1, 1, 1,
-0.9396038, -0.8396565, -2.06147, 1, 1, 1, 1, 1,
-0.9390413, -0.4334239, -2.953299, 1, 1, 1, 1, 1,
-0.9388028, 1.311134, -1.890573, 1, 1, 1, 1, 1,
-0.9334996, 1.085478, -1.157598, 1, 1, 1, 1, 1,
-0.9238399, -1.011393, -2.139003, 1, 1, 1, 1, 1,
-0.9235114, 0.4995905, -0.5594891, 1, 1, 1, 1, 1,
-0.9220502, 1.725083, 0.7004789, 1, 1, 1, 1, 1,
-0.9191509, 1.364618, -1.871067, 1, 1, 1, 1, 1,
-0.9163437, 0.8999672, -0.3498228, 0, 0, 1, 1, 1,
-0.8998257, 1.625032, -1.931649, 1, 0, 0, 1, 1,
-0.8996845, 1.646052, -1.2287, 1, 0, 0, 1, 1,
-0.8930917, -0.03530068, -0.912294, 1, 0, 0, 1, 1,
-0.8929369, -0.9216633, -1.12873, 1, 0, 0, 1, 1,
-0.8919806, -0.4385899, 0.05289943, 1, 0, 0, 1, 1,
-0.8867704, 0.8061514, -2.581512, 0, 0, 0, 1, 1,
-0.881551, 0.9111328, -0.07026394, 0, 0, 0, 1, 1,
-0.8813555, -0.3023739, -2.386823, 0, 0, 0, 1, 1,
-0.8742085, 0.2207652, -1.80462, 0, 0, 0, 1, 1,
-0.872176, 0.6000675, 0.9402779, 0, 0, 0, 1, 1,
-0.8711349, -0.7271695, -3.37539, 0, 0, 0, 1, 1,
-0.8680623, 0.6414151, -1.012645, 0, 0, 0, 1, 1,
-0.8673145, 0.790867, 1.369395, 1, 1, 1, 1, 1,
-0.8639385, 0.4414258, -2.373801, 1, 1, 1, 1, 1,
-0.8612497, -0.4792514, -0.6972149, 1, 1, 1, 1, 1,
-0.8609105, -2.242801, -2.778661, 1, 1, 1, 1, 1,
-0.8580914, 1.681154, -0.9638306, 1, 1, 1, 1, 1,
-0.8536014, 1.645702, -0.4229049, 1, 1, 1, 1, 1,
-0.8515847, -0.2540576, -3.054384, 1, 1, 1, 1, 1,
-0.8482302, -0.07211762, -1.292386, 1, 1, 1, 1, 1,
-0.8463474, -0.8657156, -2.219841, 1, 1, 1, 1, 1,
-0.8387959, 1.557744, -0.8863152, 1, 1, 1, 1, 1,
-0.8349118, 1.683457, 0.1312447, 1, 1, 1, 1, 1,
-0.8305872, 0.7154534, 0.7446213, 1, 1, 1, 1, 1,
-0.8290284, 1.208806, 0.05849834, 1, 1, 1, 1, 1,
-0.8266473, -1.108395, -2.261363, 1, 1, 1, 1, 1,
-0.8212815, 0.5892645, -0.738834, 1, 1, 1, 1, 1,
-0.8198013, 0.3727521, -0.756564, 0, 0, 1, 1, 1,
-0.8174977, 0.2230726, 0.1796043, 1, 0, 0, 1, 1,
-0.8158193, -1.442114, -3.136055, 1, 0, 0, 1, 1,
-0.7918508, -0.7967774, -3.111165, 1, 0, 0, 1, 1,
-0.7842845, 0.7327926, -0.32222, 1, 0, 0, 1, 1,
-0.7819785, -0.8786061, -3.001661, 1, 0, 0, 1, 1,
-0.7815256, 1.947021, 0.8833604, 0, 0, 0, 1, 1,
-0.7803527, -0.8457684, -2.412075, 0, 0, 0, 1, 1,
-0.7786393, -1.737213, -2.454762, 0, 0, 0, 1, 1,
-0.7745637, 0.3572366, -1.309133, 0, 0, 0, 1, 1,
-0.7739784, 2.047413, -0.6538642, 0, 0, 0, 1, 1,
-0.7731563, 0.286923, -0.515147, 0, 0, 0, 1, 1,
-0.7686645, 1.927563, -3.804849, 0, 0, 0, 1, 1,
-0.7667375, 0.7271497, -1.65554, 1, 1, 1, 1, 1,
-0.7640945, -0.9780508, -3.501023, 1, 1, 1, 1, 1,
-0.7638471, -0.6491562, -2.416831, 1, 1, 1, 1, 1,
-0.7614217, 1.228849, -0.4781506, 1, 1, 1, 1, 1,
-0.7612721, -0.4889025, -2.628251, 1, 1, 1, 1, 1,
-0.7485858, 1.349715, 0.1183318, 1, 1, 1, 1, 1,
-0.7462768, 1.201848, -0.4260318, 1, 1, 1, 1, 1,
-0.7449697, -0.5166923, -3.056618, 1, 1, 1, 1, 1,
-0.7423408, 1.389132, -1.019363, 1, 1, 1, 1, 1,
-0.7399861, -2.302689, -3.916892, 1, 1, 1, 1, 1,
-0.7392907, -0.08956219, -1.453415, 1, 1, 1, 1, 1,
-0.73685, -0.6885685, -3.612211, 1, 1, 1, 1, 1,
-0.7339506, -1.027878, -2.691797, 1, 1, 1, 1, 1,
-0.7314898, 1.309194, 0.07650442, 1, 1, 1, 1, 1,
-0.7312984, 0.8328722, 0.6052178, 1, 1, 1, 1, 1,
-0.7300214, 0.5284795, -1.625287, 0, 0, 1, 1, 1,
-0.7294248, 0.6820539, -2.468068, 1, 0, 0, 1, 1,
-0.726578, -0.754411, -2.81906, 1, 0, 0, 1, 1,
-0.7202154, 0.02594586, -2.412254, 1, 0, 0, 1, 1,
-0.7201957, -1.137226, -3.533749, 1, 0, 0, 1, 1,
-0.7190587, -0.3135794, -2.708638, 1, 0, 0, 1, 1,
-0.7189058, 0.2689589, -1.220647, 0, 0, 0, 1, 1,
-0.7177258, 1.00616, -0.3661304, 0, 0, 0, 1, 1,
-0.7115245, -0.01431147, -0.8985053, 0, 0, 0, 1, 1,
-0.7089808, 2.113002, -1.873108, 0, 0, 0, 1, 1,
-0.7088124, 0.4386221, 0.165527, 0, 0, 0, 1, 1,
-0.7015525, 1.835609, 0.8090808, 0, 0, 0, 1, 1,
-0.6948416, -0.07319725, -0.2212029, 0, 0, 0, 1, 1,
-0.6933395, 0.3368978, -3.290409, 1, 1, 1, 1, 1,
-0.6909106, 1.667678, 0.9370539, 1, 1, 1, 1, 1,
-0.687425, 1.497032, -1.123259, 1, 1, 1, 1, 1,
-0.6787512, -0.6681871, -2.564876, 1, 1, 1, 1, 1,
-0.6760927, 0.5105183, -0.2079482, 1, 1, 1, 1, 1,
-0.6760161, 0.4608721, -0.9801441, 1, 1, 1, 1, 1,
-0.6705642, -0.2465826, -1.393958, 1, 1, 1, 1, 1,
-0.6704988, 1.363954, -0.369983, 1, 1, 1, 1, 1,
-0.6681349, -0.4372372, -2.707592, 1, 1, 1, 1, 1,
-0.6662989, 0.5420914, -0.6687441, 1, 1, 1, 1, 1,
-0.6635229, -0.1983213, -0.1082052, 1, 1, 1, 1, 1,
-0.6626785, 0.001609136, -1.209626, 1, 1, 1, 1, 1,
-0.6566539, -0.3541086, -0.8007828, 1, 1, 1, 1, 1,
-0.6536577, -0.5260828, -0.9999696, 1, 1, 1, 1, 1,
-0.6499479, -0.62248, -2.286136, 1, 1, 1, 1, 1,
-0.6493095, 0.3638631, -3.240588, 0, 0, 1, 1, 1,
-0.6480291, 0.2218417, -0.9404119, 1, 0, 0, 1, 1,
-0.6464727, 1.115561, -0.7132681, 1, 0, 0, 1, 1,
-0.6416051, 1.416082, -1.451333, 1, 0, 0, 1, 1,
-0.6386645, -2.293084, -3.647013, 1, 0, 0, 1, 1,
-0.6368775, -1.862645, -1.879619, 1, 0, 0, 1, 1,
-0.6347549, 0.9051259, 1.050127, 0, 0, 0, 1, 1,
-0.6334448, -0.01181341, -1.359832, 0, 0, 0, 1, 1,
-0.6297203, -0.2714063, -2.030771, 0, 0, 0, 1, 1,
-0.6296183, -0.3916913, -3.703677, 0, 0, 0, 1, 1,
-0.6204503, -0.418863, -1.147064, 0, 0, 0, 1, 1,
-0.6148801, -0.2365641, -2.342429, 0, 0, 0, 1, 1,
-0.6101614, 0.5148925, -0.4080394, 0, 0, 0, 1, 1,
-0.6095216, 0.8811333, -1.317319, 1, 1, 1, 1, 1,
-0.6084331, 0.4573804, -0.8757535, 1, 1, 1, 1, 1,
-0.6071361, 0.4014741, -2.284848, 1, 1, 1, 1, 1,
-0.6059304, -1.452603, -0.9100164, 1, 1, 1, 1, 1,
-0.6015136, 0.6269473, -1.068576, 1, 1, 1, 1, 1,
-0.6009715, 0.8201414, -0.8348097, 1, 1, 1, 1, 1,
-0.6005391, -1.776008, -2.773382, 1, 1, 1, 1, 1,
-0.600507, -1.227293, -3.01057, 1, 1, 1, 1, 1,
-0.5936655, -1.137073, -2.117647, 1, 1, 1, 1, 1,
-0.5911596, 1.75981, 0.04797657, 1, 1, 1, 1, 1,
-0.5875257, -0.115088, -0.7530269, 1, 1, 1, 1, 1,
-0.5855099, 0.2412103, -1.555644, 1, 1, 1, 1, 1,
-0.584299, -2.44736, -3.327144, 1, 1, 1, 1, 1,
-0.5824354, -0.04266234, -2.848022, 1, 1, 1, 1, 1,
-0.5817752, -1.882935, -3.521318, 1, 1, 1, 1, 1,
-0.580381, 0.3175883, -2.471076, 0, 0, 1, 1, 1,
-0.5706456, 0.09539191, -1.938235, 1, 0, 0, 1, 1,
-0.5666531, -0.4092871, -2.611613, 1, 0, 0, 1, 1,
-0.558184, -1.407327, -3.071033, 1, 0, 0, 1, 1,
-0.5563915, -0.7571607, -3.138624, 1, 0, 0, 1, 1,
-0.5561055, 0.2120584, -1.119561, 1, 0, 0, 1, 1,
-0.5557551, -1.866375, -2.650622, 0, 0, 0, 1, 1,
-0.5539564, -0.9189226, -2.639172, 0, 0, 0, 1, 1,
-0.5514385, 1.104156, -1.363418, 0, 0, 0, 1, 1,
-0.5493099, 0.2429417, -0.7549943, 0, 0, 0, 1, 1,
-0.549004, 0.3916404, -1.98536, 0, 0, 0, 1, 1,
-0.5486326, -0.4978282, -3.620898, 0, 0, 0, 1, 1,
-0.5484416, -0.03391612, -1.936253, 0, 0, 0, 1, 1,
-0.5416829, 0.7960452, -0.8609403, 1, 1, 1, 1, 1,
-0.5413967, 0.4710323, -0.2521892, 1, 1, 1, 1, 1,
-0.5389044, 0.5344767, -2.306098, 1, 1, 1, 1, 1,
-0.5347202, 0.1149494, -1.045969, 1, 1, 1, 1, 1,
-0.5313891, 0.1392914, -0.5634332, 1, 1, 1, 1, 1,
-0.5264117, -1.236482, -3.321343, 1, 1, 1, 1, 1,
-0.5251107, 0.02446067, -0.04631609, 1, 1, 1, 1, 1,
-0.5247955, 0.3045799, -0.1527556, 1, 1, 1, 1, 1,
-0.5185198, -0.7176558, -4.034978, 1, 1, 1, 1, 1,
-0.5183223, -0.005390116, -1.404748, 1, 1, 1, 1, 1,
-0.5151604, -1.557925, -3.367728, 1, 1, 1, 1, 1,
-0.5144556, 0.1547542, -0.2319983, 1, 1, 1, 1, 1,
-0.513561, 0.3490757, -1.649883, 1, 1, 1, 1, 1,
-0.5120782, -2.236923, -2.306549, 1, 1, 1, 1, 1,
-0.5120558, -0.5494889, -1.588006, 1, 1, 1, 1, 1,
-0.5096623, 0.3348675, -0.6565647, 0, 0, 1, 1, 1,
-0.5082952, 1.103482, -1.148331, 1, 0, 0, 1, 1,
-0.5049808, 0.1393186, -1.012904, 1, 0, 0, 1, 1,
-0.5040962, -0.2377913, -3.664363, 1, 0, 0, 1, 1,
-0.5040739, -1.786818, -3.339537, 1, 0, 0, 1, 1,
-0.5023551, 1.112145, 0.3579954, 1, 0, 0, 1, 1,
-0.4965833, 0.5442813, -1.012908, 0, 0, 0, 1, 1,
-0.4942938, 0.3801504, 1.191285, 0, 0, 0, 1, 1,
-0.4938807, -0.09219652, 0.1035009, 0, 0, 0, 1, 1,
-0.4911475, -0.5132358, -2.38443, 0, 0, 0, 1, 1,
-0.4887797, -0.8527565, -4.277556, 0, 0, 0, 1, 1,
-0.4869463, -0.2435082, -1.848621, 0, 0, 0, 1, 1,
-0.4802366, -0.2094078, -2.381968, 0, 0, 0, 1, 1,
-0.479786, 0.3243697, 1.915184, 1, 1, 1, 1, 1,
-0.4753312, 0.1015883, -0.5133452, 1, 1, 1, 1, 1,
-0.474705, 0.1720018, 0.1455171, 1, 1, 1, 1, 1,
-0.4736654, -0.4028664, -2.927424, 1, 1, 1, 1, 1,
-0.4696772, -1.844856, -2.142216, 1, 1, 1, 1, 1,
-0.4669066, 1.003022, 0.6614091, 1, 1, 1, 1, 1,
-0.4640323, -1.591933, -3.347452, 1, 1, 1, 1, 1,
-0.450299, 0.4718688, -0.7640365, 1, 1, 1, 1, 1,
-0.4489113, 0.9856416, -1.012906, 1, 1, 1, 1, 1,
-0.4410035, -1.238182, -4.13547, 1, 1, 1, 1, 1,
-0.438123, -0.2014628, -4.293016, 1, 1, 1, 1, 1,
-0.4331132, -0.1806957, -2.610736, 1, 1, 1, 1, 1,
-0.432743, 1.966952, 0.1128569, 1, 1, 1, 1, 1,
-0.4295991, -0.1961268, -4.572046, 1, 1, 1, 1, 1,
-0.4294178, 0.3153798, -0.5065368, 1, 1, 1, 1, 1,
-0.4278824, -0.7598579, -2.950347, 0, 0, 1, 1, 1,
-0.4245524, -0.8758652, -2.11449, 1, 0, 0, 1, 1,
-0.4242169, 1.261827, -1.580691, 1, 0, 0, 1, 1,
-0.4239282, 1.600708, 0.125593, 1, 0, 0, 1, 1,
-0.4238163, -0.6453227, -4.23332, 1, 0, 0, 1, 1,
-0.4195451, -1.172489, -3.636351, 1, 0, 0, 1, 1,
-0.4172964, -0.239682, -1.917375, 0, 0, 0, 1, 1,
-0.4168758, 0.7050196, -2.115582, 0, 0, 0, 1, 1,
-0.4149062, 0.1661685, 0.4107039, 0, 0, 0, 1, 1,
-0.4121289, -0.2549222, -1.229885, 0, 0, 0, 1, 1,
-0.4097642, 0.3336315, -2.220418, 0, 0, 0, 1, 1,
-0.4073507, -0.915953, -2.337138, 0, 0, 0, 1, 1,
-0.4011278, 0.4800189, -0.7726803, 0, 0, 0, 1, 1,
-0.4009767, -0.3875512, -3.576592, 1, 1, 1, 1, 1,
-0.3988393, -0.403699, -0.3424674, 1, 1, 1, 1, 1,
-0.3982121, -0.1313725, -0.9986029, 1, 1, 1, 1, 1,
-0.3976157, -2.132133, -4.634787, 1, 1, 1, 1, 1,
-0.395345, -2.290424, -2.378102, 1, 1, 1, 1, 1,
-0.3921999, -0.3585561, -3.639021, 1, 1, 1, 1, 1,
-0.3910695, -1.02708, -1.926493, 1, 1, 1, 1, 1,
-0.3904671, 0.08431834, -1.560761, 1, 1, 1, 1, 1,
-0.3896433, -1.150833, -0.79169, 1, 1, 1, 1, 1,
-0.3875453, -0.4814486, -1.789838, 1, 1, 1, 1, 1,
-0.385661, 1.448248, 0.6616407, 1, 1, 1, 1, 1,
-0.385592, -2.537665, -2.211518, 1, 1, 1, 1, 1,
-0.3854882, -0.4672617, -2.991329, 1, 1, 1, 1, 1,
-0.3815958, 0.8685927, -1.147559, 1, 1, 1, 1, 1,
-0.3689018, 1.043712, -0.2204134, 1, 1, 1, 1, 1,
-0.3685907, -1.311768, -2.842998, 0, 0, 1, 1, 1,
-0.3683859, -0.8706555, -3.595683, 1, 0, 0, 1, 1,
-0.366858, -0.2443481, -1.968824, 1, 0, 0, 1, 1,
-0.365417, -1.611768, -4.201869, 1, 0, 0, 1, 1,
-0.3633266, 0.4596059, 0.2971485, 1, 0, 0, 1, 1,
-0.3583856, 1.31575, 0.3012685, 1, 0, 0, 1, 1,
-0.356749, -2.363333, -2.242063, 0, 0, 0, 1, 1,
-0.3518659, 0.6580167, 0.8715478, 0, 0, 0, 1, 1,
-0.3517904, 1.014468, 0.5608366, 0, 0, 0, 1, 1,
-0.3515485, -2.102393, -2.201488, 0, 0, 0, 1, 1,
-0.3511176, 1.385461, -0.7450467, 0, 0, 0, 1, 1,
-0.3411358, -0.08865863, -1.96858, 0, 0, 0, 1, 1,
-0.3409663, -0.1289634, -2.738744, 0, 0, 0, 1, 1,
-0.3395101, 0.7242792, 0.9448844, 1, 1, 1, 1, 1,
-0.3320076, 0.522409, 0.6286964, 1, 1, 1, 1, 1,
-0.3313697, 0.2783618, -1.958847, 1, 1, 1, 1, 1,
-0.3281777, -1.066948, -3.536931, 1, 1, 1, 1, 1,
-0.327173, -0.4105529, -2.691634, 1, 1, 1, 1, 1,
-0.3212558, -0.4147526, -1.125252, 1, 1, 1, 1, 1,
-0.3189639, 1.465674, -0.269784, 1, 1, 1, 1, 1,
-0.3162535, 1.391623, -0.02221917, 1, 1, 1, 1, 1,
-0.3128989, 0.9850968, -0.518189, 1, 1, 1, 1, 1,
-0.311973, -0.834464, -4.884762, 1, 1, 1, 1, 1,
-0.3076207, 0.81445, -0.7562243, 1, 1, 1, 1, 1,
-0.3056007, 0.6710144, -0.8236485, 1, 1, 1, 1, 1,
-0.3043818, -0.7525662, -1.281904, 1, 1, 1, 1, 1,
-0.2984418, -0.05605373, -1.275296, 1, 1, 1, 1, 1,
-0.2971253, 0.5374529, -2.530451, 1, 1, 1, 1, 1,
-0.2956573, 2.458417, -2.403687, 0, 0, 1, 1, 1,
-0.2898839, 1.173397, -0.558597, 1, 0, 0, 1, 1,
-0.28825, 1.612368, -0.6452627, 1, 0, 0, 1, 1,
-0.2848828, -0.4637852, -2.025653, 1, 0, 0, 1, 1,
-0.2831152, 0.5404261, 0.3967662, 1, 0, 0, 1, 1,
-0.2822046, 0.6500933, -1.420102, 1, 0, 0, 1, 1,
-0.2723041, -1.554655, -3.088803, 0, 0, 0, 1, 1,
-0.2694064, 0.5503277, -0.1160713, 0, 0, 0, 1, 1,
-0.2650573, 0.3990028, -1.12893, 0, 0, 0, 1, 1,
-0.2642632, -1.314067, -3.620232, 0, 0, 0, 1, 1,
-0.2614295, 1.986373, -0.1690008, 0, 0, 0, 1, 1,
-0.2607809, -2.268724, -1.357663, 0, 0, 0, 1, 1,
-0.2591739, 0.1995348, -1.770347, 0, 0, 0, 1, 1,
-0.2547193, -0.4919728, -3.299326, 1, 1, 1, 1, 1,
-0.2546371, 0.3696356, -2.343355, 1, 1, 1, 1, 1,
-0.2536014, 0.1357694, -3.167189, 1, 1, 1, 1, 1,
-0.2498714, 0.7219348, -1.346516, 1, 1, 1, 1, 1,
-0.2490484, -0.03838313, -1.634829, 1, 1, 1, 1, 1,
-0.2470608, 0.4114817, 0.4523539, 1, 1, 1, 1, 1,
-0.2460357, -0.518701, -3.374179, 1, 1, 1, 1, 1,
-0.2424896, 0.1434146, -3.158191, 1, 1, 1, 1, 1,
-0.2420561, -0.538847, -2.801053, 1, 1, 1, 1, 1,
-0.2394134, -0.3300076, -2.01938, 1, 1, 1, 1, 1,
-0.2391319, 1.853152, 0.09030841, 1, 1, 1, 1, 1,
-0.2328051, -1.351717, -3.527887, 1, 1, 1, 1, 1,
-0.2320684, -0.2511687, -3.831178, 1, 1, 1, 1, 1,
-0.2221277, -0.2256189, -1.14248, 1, 1, 1, 1, 1,
-0.2220363, -0.7611024, -2.813689, 1, 1, 1, 1, 1,
-0.2145052, 0.3602262, -2.326708, 0, 0, 1, 1, 1,
-0.2138744, -1.86141, -2.469623, 1, 0, 0, 1, 1,
-0.2137415, 1.353313, -1.422135, 1, 0, 0, 1, 1,
-0.213493, -0.4438831, -1.723038, 1, 0, 0, 1, 1,
-0.2131367, -0.7329603, -2.313944, 1, 0, 0, 1, 1,
-0.2090401, -0.3129586, -2.446659, 1, 0, 0, 1, 1,
-0.2077554, 0.8071634, -0.6692653, 0, 0, 0, 1, 1,
-0.1981098, 1.292265, -0.725334, 0, 0, 0, 1, 1,
-0.1978462, 1.143946, 0.3784735, 0, 0, 0, 1, 1,
-0.1977706, -1.239399, -2.049733, 0, 0, 0, 1, 1,
-0.1927388, 0.6967098, 0.9419362, 0, 0, 0, 1, 1,
-0.1924325, 0.4009962, -0.04158881, 0, 0, 0, 1, 1,
-0.1922754, 0.09567004, -3.537271, 0, 0, 0, 1, 1,
-0.1906329, -1.370528, -4.845967, 1, 1, 1, 1, 1,
-0.1849154, 1.098775, 2.081615, 1, 1, 1, 1, 1,
-0.1813532, 0.3399722, 0.3892596, 1, 1, 1, 1, 1,
-0.1809202, -0.6721845, -0.7703841, 1, 1, 1, 1, 1,
-0.1778381, -0.2010866, -1.119565, 1, 1, 1, 1, 1,
-0.1676272, -0.8149166, -2.932624, 1, 1, 1, 1, 1,
-0.1627863, 0.4966271, -0.4467749, 1, 1, 1, 1, 1,
-0.1604428, -0.3290367, -4.760854, 1, 1, 1, 1, 1,
-0.1595842, 1.397599, -0.9047523, 1, 1, 1, 1, 1,
-0.1583556, -1.382958, -1.455925, 1, 1, 1, 1, 1,
-0.1558324, 0.3361408, -0.06625625, 1, 1, 1, 1, 1,
-0.1524658, -1.144656, -2.990557, 1, 1, 1, 1, 1,
-0.1514459, 1.881124, 0.1321129, 1, 1, 1, 1, 1,
-0.1503226, -1.169601, -1.394944, 1, 1, 1, 1, 1,
-0.1474642, -1.887299, -2.859395, 1, 1, 1, 1, 1,
-0.1463301, -0.1983133, -2.560672, 0, 0, 1, 1, 1,
-0.1434864, -0.5932616, -4.164008, 1, 0, 0, 1, 1,
-0.1415092, 1.578606, 0.245684, 1, 0, 0, 1, 1,
-0.1380043, -1.1084, -2.762131, 1, 0, 0, 1, 1,
-0.1356743, 0.9020339, 0.1543855, 1, 0, 0, 1, 1,
-0.134115, -0.1161514, -2.846071, 1, 0, 0, 1, 1,
-0.1313571, -0.1884506, -1.492204, 0, 0, 0, 1, 1,
-0.1268856, 0.9580968, -0.06484596, 0, 0, 0, 1, 1,
-0.1265561, 2.018898, 0.4204666, 0, 0, 0, 1, 1,
-0.1217075, 0.3778531, 0.02657854, 0, 0, 0, 1, 1,
-0.1216626, -1.035304, -2.136087, 0, 0, 0, 1, 1,
-0.1197712, -0.8963032, -3.837238, 0, 0, 0, 1, 1,
-0.1190044, 0.3753953, -0.2429508, 0, 0, 0, 1, 1,
-0.1148196, 0.2091816, -1.319721, 1, 1, 1, 1, 1,
-0.114623, 0.1548374, -0.6607491, 1, 1, 1, 1, 1,
-0.110666, -1.251337, -3.195189, 1, 1, 1, 1, 1,
-0.1101099, 1.736132, -0.5179836, 1, 1, 1, 1, 1,
-0.1020531, 1.073405, -0.5630711, 1, 1, 1, 1, 1,
-0.09455433, 1.417593, 0.1560525, 1, 1, 1, 1, 1,
-0.09444872, -0.9473056, -2.740757, 1, 1, 1, 1, 1,
-0.09368002, -0.5613376, -1.67294, 1, 1, 1, 1, 1,
-0.09338557, 0.6512265, -1.318262, 1, 1, 1, 1, 1,
-0.09000303, -0.2918238, -4.251028, 1, 1, 1, 1, 1,
-0.08710604, -0.7553573, -2.170629, 1, 1, 1, 1, 1,
-0.08656039, -1.793646, -3.171891, 1, 1, 1, 1, 1,
-0.08318409, -0.6553819, -2.253884, 1, 1, 1, 1, 1,
-0.08306378, 2.066967, 0.8323335, 1, 1, 1, 1, 1,
-0.08194977, 1.12622, 0.2891236, 1, 1, 1, 1, 1,
-0.07654411, 1.323716, 0.06386869, 0, 0, 1, 1, 1,
-0.07528246, -0.05219859, -1.009985, 1, 0, 0, 1, 1,
-0.07243531, 2.450368, -0.9386231, 1, 0, 0, 1, 1,
-0.06803901, 1.246941, -1.660256, 1, 0, 0, 1, 1,
-0.06673355, 0.3158364, -1.193241, 1, 0, 0, 1, 1,
-0.06262118, -3.005928, -2.446547, 1, 0, 0, 1, 1,
-0.05474612, -1.08116, -1.466032, 0, 0, 0, 1, 1,
-0.05463796, 0.3104448, -1.035321, 0, 0, 0, 1, 1,
-0.0528219, 2.131412, 2.194278, 0, 0, 0, 1, 1,
-0.05263837, 0.9296023, 1.013267, 0, 0, 0, 1, 1,
-0.05155385, -1.484759, -2.861548, 0, 0, 0, 1, 1,
-0.05127408, 0.3267229, 0.5801623, 0, 0, 0, 1, 1,
-0.04703493, 0.3525357, -0.3008019, 0, 0, 0, 1, 1,
-0.04611536, -0.9686555, -4.164221, 1, 1, 1, 1, 1,
-0.04407839, 0.3492647, 0.2374371, 1, 1, 1, 1, 1,
-0.04376515, -0.07655994, -3.445313, 1, 1, 1, 1, 1,
-0.04151219, -0.1377457, -2.005777, 1, 1, 1, 1, 1,
-0.02728647, 0.1404993, -1.453673, 1, 1, 1, 1, 1,
-0.02446248, -0.6987004, -2.443254, 1, 1, 1, 1, 1,
-0.02231716, -1.644005, -3.026484, 1, 1, 1, 1, 1,
-0.01674974, 0.09873179, 0.3960642, 1, 1, 1, 1, 1,
-0.01661144, -1.537458, -1.300335, 1, 1, 1, 1, 1,
-0.01380412, 0.0344139, 2.970959, 1, 1, 1, 1, 1,
-0.01369703, 0.8112392, -0.5519465, 1, 1, 1, 1, 1,
-0.01259166, -0.4830977, -2.839391, 1, 1, 1, 1, 1,
-0.01131915, 0.1890264, 0.2257253, 1, 1, 1, 1, 1,
-0.0113023, 0.288276, -0.9442216, 1, 1, 1, 1, 1,
-0.009803614, 0.4333333, 0.1155892, 1, 1, 1, 1, 1,
-0.007944596, -1.395414, -2.877058, 0, 0, 1, 1, 1,
-0.00361173, -0.7736765, -3.021385, 1, 0, 0, 1, 1,
0.002448105, 0.3468024, 0.3311128, 1, 0, 0, 1, 1,
0.003631901, 1.169628, -0.527967, 1, 0, 0, 1, 1,
0.009689176, 0.8790659, -1.078392, 1, 0, 0, 1, 1,
0.01094349, 0.2755755, -0.9989166, 1, 0, 0, 1, 1,
0.01142487, -0.1514242, 2.285767, 0, 0, 0, 1, 1,
0.013017, 0.9308847, -0.2314655, 0, 0, 0, 1, 1,
0.01302214, -1.616314, 3.42632, 0, 0, 0, 1, 1,
0.01311479, -1.53859, 2.566723, 0, 0, 0, 1, 1,
0.01801871, 1.204002, -0.1574754, 0, 0, 0, 1, 1,
0.0185127, 1.370473, 1.243353, 0, 0, 0, 1, 1,
0.02309834, -0.4806379, 3.53245, 0, 0, 0, 1, 1,
0.02400523, -0.973502, 4.333172, 1, 1, 1, 1, 1,
0.02552075, -1.481222, 1.778559, 1, 1, 1, 1, 1,
0.02595831, -0.6818017, 3.237182, 1, 1, 1, 1, 1,
0.02653737, 1.046496, -0.3722297, 1, 1, 1, 1, 1,
0.02963511, -0.1493269, 2.099113, 1, 1, 1, 1, 1,
0.03395454, 0.3053258, 1.147956, 1, 1, 1, 1, 1,
0.03708974, 0.4428253, 0.5591052, 1, 1, 1, 1, 1,
0.03973361, 1.48258, -1.382297, 1, 1, 1, 1, 1,
0.04347107, 0.4492072, 0.8090171, 1, 1, 1, 1, 1,
0.04436485, -0.4520643, 1.453541, 1, 1, 1, 1, 1,
0.04458515, 1.634926, -1.191118, 1, 1, 1, 1, 1,
0.04611059, 0.7727867, -1.446748, 1, 1, 1, 1, 1,
0.05106273, 2.213704, 0.1163052, 1, 1, 1, 1, 1,
0.05159482, 0.3198479, 0.06293274, 1, 1, 1, 1, 1,
0.05264796, 0.6506029, 0.4076853, 1, 1, 1, 1, 1,
0.05379162, 1.750818, -0.4380244, 0, 0, 1, 1, 1,
0.05513045, -0.3924715, 2.498823, 1, 0, 0, 1, 1,
0.05737644, 0.8019925, -0.9162054, 1, 0, 0, 1, 1,
0.06227037, 0.1917335, -0.1562187, 1, 0, 0, 1, 1,
0.0649862, 0.9885504, 0.8653615, 1, 0, 0, 1, 1,
0.06499576, 1.374319, 0.2949284, 1, 0, 0, 1, 1,
0.06783705, -0.9532665, 2.727443, 0, 0, 0, 1, 1,
0.07270255, -0.09283407, 2.250087, 0, 0, 0, 1, 1,
0.0747904, -2.347344, 4.002547, 0, 0, 0, 1, 1,
0.07841346, 0.1423716, -0.5970225, 0, 0, 0, 1, 1,
0.07926474, -0.8355994, 4.962064, 0, 0, 0, 1, 1,
0.08044548, 0.239193, 0.00920754, 0, 0, 0, 1, 1,
0.08339948, 0.04415999, -0.2227601, 0, 0, 0, 1, 1,
0.08393057, 0.1456657, 2.040901, 1, 1, 1, 1, 1,
0.08579245, -0.09249403, 2.32, 1, 1, 1, 1, 1,
0.08728199, -0.7529503, 2.063034, 1, 1, 1, 1, 1,
0.09112724, -1.443853, 2.888353, 1, 1, 1, 1, 1,
0.09126642, 0.5397529, -0.9799194, 1, 1, 1, 1, 1,
0.09273545, 0.5720173, 0.01351088, 1, 1, 1, 1, 1,
0.09753983, -0.2942146, 2.70783, 1, 1, 1, 1, 1,
0.09816284, 0.8988625, 0.8445905, 1, 1, 1, 1, 1,
0.0982713, 1.034704, -0.422541, 1, 1, 1, 1, 1,
0.09974607, -0.1684792, 2.137043, 1, 1, 1, 1, 1,
0.1007671, 1.37343, -0.2334144, 1, 1, 1, 1, 1,
0.1026007, -0.02273312, 3.097036, 1, 1, 1, 1, 1,
0.1034897, -1.757823, 4.091349, 1, 1, 1, 1, 1,
0.1054573, -0.2238242, 0.6089013, 1, 1, 1, 1, 1,
0.1065837, -0.2336831, 3.067126, 1, 1, 1, 1, 1,
0.1066302, -0.7352339, 2.895152, 0, 0, 1, 1, 1,
0.11175, 0.1923638, -0.1677982, 1, 0, 0, 1, 1,
0.1123419, -0.02914563, 1.388781, 1, 0, 0, 1, 1,
0.1143968, -0.2893524, 2.415314, 1, 0, 0, 1, 1,
0.1160889, -0.3799975, 3.842146, 1, 0, 0, 1, 1,
0.1268471, 0.4545548, 1.968198, 1, 0, 0, 1, 1,
0.1270286, -0.04523274, 2.138798, 0, 0, 0, 1, 1,
0.13184, 0.9284788, 0.1782269, 0, 0, 0, 1, 1,
0.1341113, -0.6143913, 4.292157, 0, 0, 0, 1, 1,
0.1362115, 1.54647, 0.4385465, 0, 0, 0, 1, 1,
0.1376454, -2.869734, 2.833, 0, 0, 0, 1, 1,
0.1384046, -1.133322, 4.863381, 0, 0, 0, 1, 1,
0.1415121, 0.2812687, 1.247044, 0, 0, 0, 1, 1,
0.1431437, 0.5356534, 0.2548138, 1, 1, 1, 1, 1,
0.1444056, 0.3471801, -0.6994202, 1, 1, 1, 1, 1,
0.146018, 0.5529523, -0.5291428, 1, 1, 1, 1, 1,
0.1480962, 0.3561001, 1.590354, 1, 1, 1, 1, 1,
0.1597773, 0.6430873, 1.08096, 1, 1, 1, 1, 1,
0.1627472, -1.298319, 4.942482, 1, 1, 1, 1, 1,
0.1645043, -0.6556614, 4.71807, 1, 1, 1, 1, 1,
0.169337, 0.6892892, 1.644761, 1, 1, 1, 1, 1,
0.1729105, 0.8774921, -0.5505506, 1, 1, 1, 1, 1,
0.175251, 0.3754096, -1.326418, 1, 1, 1, 1, 1,
0.1808854, -0.8951112, 4.519892, 1, 1, 1, 1, 1,
0.1840511, -1.022698, 3.541426, 1, 1, 1, 1, 1,
0.1861205, 0.452057, 1.721539, 1, 1, 1, 1, 1,
0.1868134, 0.6585922, -0.2377728, 1, 1, 1, 1, 1,
0.1942525, -0.9482858, 0.7463796, 1, 1, 1, 1, 1,
0.1955643, -0.9287705, 3.514746, 0, 0, 1, 1, 1,
0.1965325, -1.399277, 1.357396, 1, 0, 0, 1, 1,
0.1978293, 0.1118466, 2.186441, 1, 0, 0, 1, 1,
0.2061334, -0.884407, 2.807877, 1, 0, 0, 1, 1,
0.2071726, -0.8545989, 5.638071, 1, 0, 0, 1, 1,
0.2089305, -1.563345, 3.231125, 1, 0, 0, 1, 1,
0.2091325, -0.5697979, 0.7039844, 0, 0, 0, 1, 1,
0.2117799, -1.066252, 3.500875, 0, 0, 0, 1, 1,
0.2134282, -1.526784, 0.8107953, 0, 0, 0, 1, 1,
0.22217, -0.1426764, 2.717414, 0, 0, 0, 1, 1,
0.2243614, 0.8980081, -2.012, 0, 0, 0, 1, 1,
0.2244139, -0.2302413, 1.340872, 0, 0, 0, 1, 1,
0.2289753, 0.7545928, -1.062005, 0, 0, 0, 1, 1,
0.2415244, -0.3436266, 2.033971, 1, 1, 1, 1, 1,
0.2441553, -0.3687305, 1.454305, 1, 1, 1, 1, 1,
0.2450995, 0.9126194, -0.5492947, 1, 1, 1, 1, 1,
0.2454504, 0.7073356, 1.16604, 1, 1, 1, 1, 1,
0.2481547, 0.3834194, 1.225457, 1, 1, 1, 1, 1,
0.2514821, -1.866986, 3.691512, 1, 1, 1, 1, 1,
0.2518237, 1.346186, 1.061717, 1, 1, 1, 1, 1,
0.2543797, -0.3568138, 1.275331, 1, 1, 1, 1, 1,
0.2559471, -0.4246898, 3.121188, 1, 1, 1, 1, 1,
0.2588155, 1.248651, 1.001496, 1, 1, 1, 1, 1,
0.2588513, 0.662227, 0.7231796, 1, 1, 1, 1, 1,
0.2593943, 0.1950258, 0.9542727, 1, 1, 1, 1, 1,
0.2604512, 0.4821406, 0.1350628, 1, 1, 1, 1, 1,
0.2618999, -0.9574074, 1.647589, 1, 1, 1, 1, 1,
0.2631941, 0.9417453, 1.195288, 1, 1, 1, 1, 1,
0.2637857, 0.5433534, 0.3725592, 0, 0, 1, 1, 1,
0.2647321, -0.6468725, 3.334721, 1, 0, 0, 1, 1,
0.2651434, -1.88246, 3.228186, 1, 0, 0, 1, 1,
0.2706536, 0.7386879, 1.48437, 1, 0, 0, 1, 1,
0.2713371, -0.7822484, 2.335437, 1, 0, 0, 1, 1,
0.2739869, 0.5259863, -0.4194607, 1, 0, 0, 1, 1,
0.2765906, -0.8450848, 3.060746, 0, 0, 0, 1, 1,
0.2782171, -0.08326183, 2.876484, 0, 0, 0, 1, 1,
0.2811846, 1.173805, -0.6219881, 0, 0, 0, 1, 1,
0.2836683, 0.3041215, 0.7632856, 0, 0, 0, 1, 1,
0.2890079, -0.8055257, 4.327106, 0, 0, 0, 1, 1,
0.2897951, -1.029731, 0.40438, 0, 0, 0, 1, 1,
0.2924491, 1.420848, -1.686586, 0, 0, 0, 1, 1,
0.2937447, 0.8524199, 1.051257, 1, 1, 1, 1, 1,
0.2941926, 0.4426868, 1.084002, 1, 1, 1, 1, 1,
0.2964166, -0.5186979, 3.31574, 1, 1, 1, 1, 1,
0.3001545, -0.02025692, 0.9422464, 1, 1, 1, 1, 1,
0.3030824, -2.297248, 3.493543, 1, 1, 1, 1, 1,
0.303152, 0.4377849, 0.8061082, 1, 1, 1, 1, 1,
0.3062415, 0.5695287, 1.098924, 1, 1, 1, 1, 1,
0.3073501, -0.02557139, 1.307685, 1, 1, 1, 1, 1,
0.3083692, 0.6427547, -1.258174, 1, 1, 1, 1, 1,
0.3114009, -1.086629, 1.451812, 1, 1, 1, 1, 1,
0.3121758, 2.307441, 0.3872814, 1, 1, 1, 1, 1,
0.3189177, 0.9341736, -1.038684, 1, 1, 1, 1, 1,
0.3203461, 1.089564, 0.3942653, 1, 1, 1, 1, 1,
0.320796, -0.2836284, 1.409767, 1, 1, 1, 1, 1,
0.3231067, 0.2816307, 2.239583, 1, 1, 1, 1, 1,
0.3238423, 0.748503, -0.5615896, 0, 0, 1, 1, 1,
0.3242211, 0.539588, 1.773178, 1, 0, 0, 1, 1,
0.3264445, -0.4112303, 2.044838, 1, 0, 0, 1, 1,
0.3295898, 1.401694, 0.2626897, 1, 0, 0, 1, 1,
0.332164, 0.1423697, 1.61012, 1, 0, 0, 1, 1,
0.3379804, -0.2755159, 4.00528, 1, 0, 0, 1, 1,
0.3454276, 1.002062, -0.1466063, 0, 0, 0, 1, 1,
0.3478259, -0.7195634, 1.041292, 0, 0, 0, 1, 1,
0.355244, -2.018381, 3.623062, 0, 0, 0, 1, 1,
0.3580391, -0.3197125, 2.04386, 0, 0, 0, 1, 1,
0.3605556, 2.016463, 0.9207633, 0, 0, 0, 1, 1,
0.3614283, 1.818235, 0.5133767, 0, 0, 0, 1, 1,
0.3642235, -0.3405768, 2.288441, 0, 0, 0, 1, 1,
0.369288, 1.178955, 3.262174, 1, 1, 1, 1, 1,
0.370507, -1.046431, 2.490936, 1, 1, 1, 1, 1,
0.372947, 1.262581, 0.5271544, 1, 1, 1, 1, 1,
0.3744411, -0.5084736, 3.018767, 1, 1, 1, 1, 1,
0.3769642, 0.250513, 1.221768, 1, 1, 1, 1, 1,
0.377936, 0.9038439, -0.5095389, 1, 1, 1, 1, 1,
0.3780803, -1.268574, 2.281162, 1, 1, 1, 1, 1,
0.3807252, -0.1668369, 1.689199, 1, 1, 1, 1, 1,
0.3835587, 0.8250512, 1.331773, 1, 1, 1, 1, 1,
0.3843904, 3.250304, 0.05372518, 1, 1, 1, 1, 1,
0.3848374, 0.1564896, 0.2582429, 1, 1, 1, 1, 1,
0.3866749, 0.8954552, 0.1199407, 1, 1, 1, 1, 1,
0.3867204, 0.3015841, 1.127778, 1, 1, 1, 1, 1,
0.3903796, 0.5293102, 0.1807393, 1, 1, 1, 1, 1,
0.3907304, 0.7065686, 0.9043068, 1, 1, 1, 1, 1,
0.3923948, 0.2110559, -1.115891, 0, 0, 1, 1, 1,
0.3930787, -0.2027604, 1.688914, 1, 0, 0, 1, 1,
0.3966045, -0.9497268, 2.408, 1, 0, 0, 1, 1,
0.3992144, -0.7130267, 4.156768, 1, 0, 0, 1, 1,
0.3995235, 0.8345302, 0.8453043, 1, 0, 0, 1, 1,
0.4100688, -0.2594723, 1.957468, 1, 0, 0, 1, 1,
0.4106599, 1.290013, 1.452802, 0, 0, 0, 1, 1,
0.4117053, -1.0356, 2.519752, 0, 0, 0, 1, 1,
0.423401, -0.3704622, 3.683712, 0, 0, 0, 1, 1,
0.4254824, -1.116998, 3.321305, 0, 0, 0, 1, 1,
0.4285064, -0.4433429, 2.080684, 0, 0, 0, 1, 1,
0.4384634, 1.72209, -0.6901413, 0, 0, 0, 1, 1,
0.4430296, -0.9347965, 2.700582, 0, 0, 0, 1, 1,
0.447924, 0.5660036, 1.274883, 1, 1, 1, 1, 1,
0.4518538, -1.291988, 3.507708, 1, 1, 1, 1, 1,
0.4537339, 1.050598, 2.257037, 1, 1, 1, 1, 1,
0.4564128, -0.5167913, 1.696039, 1, 1, 1, 1, 1,
0.4570516, -1.063677, 1.995235, 1, 1, 1, 1, 1,
0.4596715, -1.87906, 2.182977, 1, 1, 1, 1, 1,
0.4598895, -0.4966725, 2.892807, 1, 1, 1, 1, 1,
0.4613941, -0.8966431, 1.657794, 1, 1, 1, 1, 1,
0.4772676, 0.1139323, 1.164831, 1, 1, 1, 1, 1,
0.477601, 1.119929, -0.3591704, 1, 1, 1, 1, 1,
0.4830007, 0.7644952, -0.8946105, 1, 1, 1, 1, 1,
0.4971181, 1.63735, 1.169067, 1, 1, 1, 1, 1,
0.4978765, -0.9214726, 2.321209, 1, 1, 1, 1, 1,
0.4985445, -0.291799, 2.831266, 1, 1, 1, 1, 1,
0.4994149, -0.4484483, 4.53856, 1, 1, 1, 1, 1,
0.5025662, 0.5477737, 1.375288, 0, 0, 1, 1, 1,
0.5078083, 0.2401353, 3.385441, 1, 0, 0, 1, 1,
0.511692, -1.618656, 1.756627, 1, 0, 0, 1, 1,
0.511753, 1.159356, -0.3058358, 1, 0, 0, 1, 1,
0.5124533, -1.321845, 3.714501, 1, 0, 0, 1, 1,
0.521605, -1.106964, 2.379588, 1, 0, 0, 1, 1,
0.5277252, 1.741505, 0.7618933, 0, 0, 0, 1, 1,
0.5284621, -3.00771, 1.458054, 0, 0, 0, 1, 1,
0.5342228, 1.150202, 1.313786, 0, 0, 0, 1, 1,
0.538997, -1.662619, 1.841597, 0, 0, 0, 1, 1,
0.5400087, -0.1289003, 2.329201, 0, 0, 0, 1, 1,
0.5511036, 0.07931107, 1.854001, 0, 0, 0, 1, 1,
0.5519769, -1.717666, 4.021152, 0, 0, 0, 1, 1,
0.5659745, 0.3962817, 0.3775267, 1, 1, 1, 1, 1,
0.5686105, -0.3412722, 2.489863, 1, 1, 1, 1, 1,
0.5687129, 0.2401093, 0.9920048, 1, 1, 1, 1, 1,
0.5730422, 0.9473222, 0.9341401, 1, 1, 1, 1, 1,
0.5732707, -0.5033535, 1.886276, 1, 1, 1, 1, 1,
0.5737141, 0.7110848, 0.8677158, 1, 1, 1, 1, 1,
0.580768, -1.016851, 1.993185, 1, 1, 1, 1, 1,
0.5816753, -0.5676605, 3.902711, 1, 1, 1, 1, 1,
0.5821885, -1.00155, 4.201537, 1, 1, 1, 1, 1,
0.5825706, 0.5548272, -0.2698431, 1, 1, 1, 1, 1,
0.5853581, -1.337278, 1.55057, 1, 1, 1, 1, 1,
0.5879443, -0.7098699, 1.625406, 1, 1, 1, 1, 1,
0.5884729, 0.1849689, 0.9699833, 1, 1, 1, 1, 1,
0.5911914, -0.5646615, 0.6762868, 1, 1, 1, 1, 1,
0.5925712, 1.703379, -0.172943, 1, 1, 1, 1, 1,
0.5934774, -0.1943737, 3.248848, 0, 0, 1, 1, 1,
0.5989436, 0.8266087, 0.8705599, 1, 0, 0, 1, 1,
0.6014169, -1.455502, 3.092688, 1, 0, 0, 1, 1,
0.6043501, -1.211369, 1.606644, 1, 0, 0, 1, 1,
0.6052659, -0.1763089, 1.424217, 1, 0, 0, 1, 1,
0.6071037, 1.004802, 1.428173, 1, 0, 0, 1, 1,
0.6147496, -0.5978425, 4.07274, 0, 0, 0, 1, 1,
0.6156391, 0.766303, 1.272479, 0, 0, 0, 1, 1,
0.6160802, -0.8381881, 2.061681, 0, 0, 0, 1, 1,
0.6170746, 0.1332795, 2.821906, 0, 0, 0, 1, 1,
0.626478, 1.05249, 0.376689, 0, 0, 0, 1, 1,
0.6273687, 1.84885, 0.2327137, 0, 0, 0, 1, 1,
0.6332651, -0.02655788, 1.23182, 0, 0, 0, 1, 1,
0.6447326, 1.298901, 1.225189, 1, 1, 1, 1, 1,
0.6455414, 0.9557602, 0.7746647, 1, 1, 1, 1, 1,
0.6464942, -1.891128, 3.105526, 1, 1, 1, 1, 1,
0.646857, -1.801711, 3.275924, 1, 1, 1, 1, 1,
0.6481808, -0.09829613, 1.539893, 1, 1, 1, 1, 1,
0.6555288, 0.656921, 1.871264, 1, 1, 1, 1, 1,
0.6573449, 1.833643, 0.1146786, 1, 1, 1, 1, 1,
0.6602381, 1.525022, 0.1718654, 1, 1, 1, 1, 1,
0.6622136, 0.0170159, 0.9311218, 1, 1, 1, 1, 1,
0.6652765, -1.675236, 1.813408, 1, 1, 1, 1, 1,
0.6687208, -0.4836238, 2.670357, 1, 1, 1, 1, 1,
0.6687428, -0.3097162, 2.101676, 1, 1, 1, 1, 1,
0.6699126, -0.7719612, 1.406048, 1, 1, 1, 1, 1,
0.6724102, 0.2046339, 1.034741, 1, 1, 1, 1, 1,
0.6756287, 0.2965416, -0.1223792, 1, 1, 1, 1, 1,
0.6781369, -0.4364852, 3.563802, 0, 0, 1, 1, 1,
0.6849556, 0.9887918, 2.280223, 1, 0, 0, 1, 1,
0.6849877, 0.766389, -0.3158793, 1, 0, 0, 1, 1,
0.6851808, -1.411462, 2.350009, 1, 0, 0, 1, 1,
0.6852173, -0.08647832, 3.669947, 1, 0, 0, 1, 1,
0.6855353, 0.4859374, 1.558032, 1, 0, 0, 1, 1,
0.6866413, -1.106898, 2.380825, 0, 0, 0, 1, 1,
0.6919872, -0.4536542, 2.559149, 0, 0, 0, 1, 1,
0.6920233, -0.3630302, 1.187661, 0, 0, 0, 1, 1,
0.6996934, 0.2652203, 2.585654, 0, 0, 0, 1, 1,
0.7006188, -0.1504714, 1.780695, 0, 0, 0, 1, 1,
0.7006435, -0.6925011, 1.4931, 0, 0, 0, 1, 1,
0.7036115, -0.1781022, 0.6363486, 0, 0, 0, 1, 1,
0.7037584, -0.7637553, 1.685628, 1, 1, 1, 1, 1,
0.7089413, 0.6970431, 0.9483073, 1, 1, 1, 1, 1,
0.7306519, -1.020255, 1.526563, 1, 1, 1, 1, 1,
0.7315696, -0.5184197, 3.478598, 1, 1, 1, 1, 1,
0.736023, -0.1712305, 2.635679, 1, 1, 1, 1, 1,
0.7380885, 0.5225379, 1.492426, 1, 1, 1, 1, 1,
0.7387338, -0.9586684, 1.908889, 1, 1, 1, 1, 1,
0.7389462, 2.071087, 1.022817, 1, 1, 1, 1, 1,
0.7394195, 0.937744, 0.9448583, 1, 1, 1, 1, 1,
0.7419192, -0.3883687, 2.475325, 1, 1, 1, 1, 1,
0.7444302, -0.1592375, 3.578085, 1, 1, 1, 1, 1,
0.7471107, 0.5519221, 2.515404, 1, 1, 1, 1, 1,
0.7521692, -1.269325, 3.318965, 1, 1, 1, 1, 1,
0.7538052, -1.555523, 2.805261, 1, 1, 1, 1, 1,
0.7604421, -0.7621405, 1.920246, 1, 1, 1, 1, 1,
0.7635444, -0.6139566, 0.6027918, 0, 0, 1, 1, 1,
0.7647848, 0.096984, 2.201863, 1, 0, 0, 1, 1,
0.7684773, -0.1449225, 1.475299, 1, 0, 0, 1, 1,
0.7712224, 1.228177, -1.701551, 1, 0, 0, 1, 1,
0.7796566, 0.2400062, 1.275194, 1, 0, 0, 1, 1,
0.7811069, -0.9534214, 3.435577, 1, 0, 0, 1, 1,
0.7839823, 0.196254, 2.270716, 0, 0, 0, 1, 1,
0.7883904, -0.1876491, 1.669856, 0, 0, 0, 1, 1,
0.794108, -0.4443859, 1.693556, 0, 0, 0, 1, 1,
0.7969549, -1.451885, 3.947979, 0, 0, 0, 1, 1,
0.8063083, 0.2842634, 2.100713, 0, 0, 0, 1, 1,
0.8107162, 0.4936093, 2.034659, 0, 0, 0, 1, 1,
0.8127278, -0.6667824, 2.967012, 0, 0, 0, 1, 1,
0.8128, -1.185114, 2.643333, 1, 1, 1, 1, 1,
0.8169766, 0.07273479, 0.5816167, 1, 1, 1, 1, 1,
0.8200659, -0.2294259, 0.3185812, 1, 1, 1, 1, 1,
0.8323994, -0.7767736, 0.08859137, 1, 1, 1, 1, 1,
0.832809, -0.855168, 3.624197, 1, 1, 1, 1, 1,
0.8396189, -0.3709425, 2.262087, 1, 1, 1, 1, 1,
0.8442497, -0.1887039, 2.379614, 1, 1, 1, 1, 1,
0.8549888, -1.020722, 2.695736, 1, 1, 1, 1, 1,
0.8565173, -0.2053008, 1.89149, 1, 1, 1, 1, 1,
0.866304, 0.9060473, -1.513351, 1, 1, 1, 1, 1,
0.8708198, -1.134389, 0.3904951, 1, 1, 1, 1, 1,
0.8788352, -0.6862883, 1.413015, 1, 1, 1, 1, 1,
0.8800035, 0.1574139, 0.9586058, 1, 1, 1, 1, 1,
0.8824358, -1.286569, 2.65957, 1, 1, 1, 1, 1,
0.8826549, 2.685091, -0.7214115, 1, 1, 1, 1, 1,
0.9027131, -0.09427364, 1.162598, 0, 0, 1, 1, 1,
0.9037084, 0.3863039, 0.8298618, 1, 0, 0, 1, 1,
0.9066845, 1.628725, 0.9286262, 1, 0, 0, 1, 1,
0.9077601, -0.5356234, 0.7652, 1, 0, 0, 1, 1,
0.9095736, -0.1247022, 1.073493, 1, 0, 0, 1, 1,
0.9096162, -1.008576, 1.793393, 1, 0, 0, 1, 1,
0.9120931, -0.2950151, 1.775544, 0, 0, 0, 1, 1,
0.9124694, 0.7355962, 2.249443, 0, 0, 0, 1, 1,
0.9133363, 1.194281, 1.593562, 0, 0, 0, 1, 1,
0.9146616, 1.34907, -0.6929619, 0, 0, 0, 1, 1,
0.9221731, -0.6547282, 3.342247, 0, 0, 0, 1, 1,
0.923306, -1.099894, 2.329031, 0, 0, 0, 1, 1,
0.9234035, 0.5438787, 0.2676046, 0, 0, 0, 1, 1,
0.9244764, -1.098898, 2.334548, 1, 1, 1, 1, 1,
0.9260397, -1.582034, 2.525886, 1, 1, 1, 1, 1,
0.9282197, -0.9751688, 3.178285, 1, 1, 1, 1, 1,
0.9303185, 0.6922763, 0.7354853, 1, 1, 1, 1, 1,
0.9375091, 3.774004, -1.147308, 1, 1, 1, 1, 1,
0.9531687, -0.4319211, 0.9872203, 1, 1, 1, 1, 1,
0.953976, 0.3137692, -0.2022045, 1, 1, 1, 1, 1,
0.9552256, -0.9660907, 1.987408, 1, 1, 1, 1, 1,
0.9598259, -0.4021751, 0.7815008, 1, 1, 1, 1, 1,
0.9644438, 0.1425448, 0.7056774, 1, 1, 1, 1, 1,
0.9647433, 1.963673, 0.9789736, 1, 1, 1, 1, 1,
0.965851, -0.8108547, 3.874047, 1, 1, 1, 1, 1,
0.9697982, 1.357198, 1.306403, 1, 1, 1, 1, 1,
0.9699468, -1.335768, 2.444178, 1, 1, 1, 1, 1,
0.9702602, -0.1347682, 1.681957, 1, 1, 1, 1, 1,
0.9724212, -0.957166, 3.287832, 0, 0, 1, 1, 1,
0.9779073, -1.324871, 1.764482, 1, 0, 0, 1, 1,
0.9788812, 0.7115714, -0.03414156, 1, 0, 0, 1, 1,
0.9796656, 0.3635063, 3.098329, 1, 0, 0, 1, 1,
0.9803329, -0.03169375, 1.866904, 1, 0, 0, 1, 1,
0.9831296, -0.3335409, 1.818747, 1, 0, 0, 1, 1,
0.9851809, 0.4004745, 1.734809, 0, 0, 0, 1, 1,
0.9908214, 0.5983498, 0.2055425, 0, 0, 0, 1, 1,
0.9913569, -1.411901, 1.487894, 0, 0, 0, 1, 1,
0.9943586, -1.47625, 3.0444, 0, 0, 0, 1, 1,
0.9976415, 0.1863897, 2.016386, 0, 0, 0, 1, 1,
1.007346, 1.09713, -0.01727556, 0, 0, 0, 1, 1,
1.010401, -0.9480288, 0.8528737, 0, 0, 0, 1, 1,
1.017212, -0.7226812, 0.4782206, 1, 1, 1, 1, 1,
1.024067, 2.200264, 2.267129, 1, 1, 1, 1, 1,
1.031301, -1.939491, 2.871804, 1, 1, 1, 1, 1,
1.041402, 2.446349, 1.520463, 1, 1, 1, 1, 1,
1.043788, 1.225137, 0.8411717, 1, 1, 1, 1, 1,
1.044185, -1.12393, 4.629917, 1, 1, 1, 1, 1,
1.046111, -0.6677808, 2.118046, 1, 1, 1, 1, 1,
1.049254, -0.6012139, 2.82592, 1, 1, 1, 1, 1,
1.052106, -0.1476939, 1.863848, 1, 1, 1, 1, 1,
1.057201, -0.7175503, 1.147478, 1, 1, 1, 1, 1,
1.067501, -0.6370837, 0.8169553, 1, 1, 1, 1, 1,
1.072465, 0.780948, 0.3104337, 1, 1, 1, 1, 1,
1.084281, -1.103786, 2.143004, 1, 1, 1, 1, 1,
1.087672, 0.1772792, 1.346285, 1, 1, 1, 1, 1,
1.0903, 0.2893776, 1.001643, 1, 1, 1, 1, 1,
1.095146, 1.669848, 2.158935, 0, 0, 1, 1, 1,
1.095614, -0.1461718, 0.2273193, 1, 0, 0, 1, 1,
1.102998, -1.248651, 4.224704, 1, 0, 0, 1, 1,
1.104688, 0.04281985, 1.550643, 1, 0, 0, 1, 1,
1.105414, 0.1952211, 0.5307078, 1, 0, 0, 1, 1,
1.109623, 2.244061, -0.464598, 1, 0, 0, 1, 1,
1.112196, -0.5743924, 0.6422768, 0, 0, 0, 1, 1,
1.122061, -1.082118, 2.6504, 0, 0, 0, 1, 1,
1.126283, 0.03518569, 2.471708, 0, 0, 0, 1, 1,
1.135275, 1.420836, 0.4834048, 0, 0, 0, 1, 1,
1.138192, 0.5127393, 0.01432912, 0, 0, 0, 1, 1,
1.138251, 1.292053, 1.008952, 0, 0, 0, 1, 1,
1.140021, -0.7768428, 1.924577, 0, 0, 0, 1, 1,
1.140433, -1.25365, 1.051211, 1, 1, 1, 1, 1,
1.148284, -2.398854, 2.804241, 1, 1, 1, 1, 1,
1.150868, 0.876, 1.390893, 1, 1, 1, 1, 1,
1.153363, 0.6786512, 0.5107626, 1, 1, 1, 1, 1,
1.157589, -0.5437232, 2.836359, 1, 1, 1, 1, 1,
1.166718, 0.3100117, -0.4729168, 1, 1, 1, 1, 1,
1.175845, -0.6882759, 2.53322, 1, 1, 1, 1, 1,
1.176094, 0.3749179, -0.4007936, 1, 1, 1, 1, 1,
1.177946, -0.3912784, 3.653646, 1, 1, 1, 1, 1,
1.180202, 0.4020603, 1.999265, 1, 1, 1, 1, 1,
1.183293, 0.3832384, 0.1743447, 1, 1, 1, 1, 1,
1.186503, 1.411389, 0.8430256, 1, 1, 1, 1, 1,
1.186717, -1.585023, 3.274682, 1, 1, 1, 1, 1,
1.187887, 1.408941, -0.8556667, 1, 1, 1, 1, 1,
1.200175, 0.6413402, 1.25504, 1, 1, 1, 1, 1,
1.200453, -0.7038006, 1.634774, 0, 0, 1, 1, 1,
1.205279, 0.1270001, 1.357231, 1, 0, 0, 1, 1,
1.225847, 1.044324, -0.546741, 1, 0, 0, 1, 1,
1.229835, -0.2519458, 3.642627, 1, 0, 0, 1, 1,
1.237411, -0.02068056, 2.55838, 1, 0, 0, 1, 1,
1.239059, 1.230648, 0.4279692, 1, 0, 0, 1, 1,
1.239599, 1.342256, -0.05146313, 0, 0, 0, 1, 1,
1.241288, 1.062631, 1.259768, 0, 0, 0, 1, 1,
1.2431, -2.291299, 1.000763, 0, 0, 0, 1, 1,
1.258492, 1.902808, 2.420443, 0, 0, 0, 1, 1,
1.273917, -0.07432619, -0.3533148, 0, 0, 0, 1, 1,
1.279215, -0.3851686, 0.4912261, 0, 0, 0, 1, 1,
1.281901, -0.3213132, 1.221846, 0, 0, 0, 1, 1,
1.282955, -0.8682839, 2.263465, 1, 1, 1, 1, 1,
1.28637, 0.3694374, 0.9648477, 1, 1, 1, 1, 1,
1.291287, -0.6704494, 1.513914, 1, 1, 1, 1, 1,
1.301927, 0.1364755, 1.401251, 1, 1, 1, 1, 1,
1.307678, 1.131414, 0.9475002, 1, 1, 1, 1, 1,
1.315033, -0.7979014, 3.118425, 1, 1, 1, 1, 1,
1.316322, -0.9791777, 2.057736, 1, 1, 1, 1, 1,
1.316671, -1.18436, 1.198258, 1, 1, 1, 1, 1,
1.317516, 0.2434528, 1.748951, 1, 1, 1, 1, 1,
1.326008, -0.02234124, 2.786732, 1, 1, 1, 1, 1,
1.334428, 0.5293778, -0.04223292, 1, 1, 1, 1, 1,
1.334536, -1.033993, 2.121974, 1, 1, 1, 1, 1,
1.35308, 0.6808503, 0.8222583, 1, 1, 1, 1, 1,
1.360752, 0.3164389, 1.765128, 1, 1, 1, 1, 1,
1.362916, 0.9098312, 0.5264902, 1, 1, 1, 1, 1,
1.370611, 1.02569, 0.9928745, 0, 0, 1, 1, 1,
1.375919, 1.152798, 0.9833556, 1, 0, 0, 1, 1,
1.379341, 0.3911809, 1.833229, 1, 0, 0, 1, 1,
1.395783, 0.2171774, 2.377289, 1, 0, 0, 1, 1,
1.412555, -0.9585185, 2.444061, 1, 0, 0, 1, 1,
1.415787, 0.6461841, -0.1824933, 1, 0, 0, 1, 1,
1.422034, 0.7372331, -0.4015273, 0, 0, 0, 1, 1,
1.427259, 0.1074601, 1.936201, 0, 0, 0, 1, 1,
1.43956, 0.5489805, 1.518955, 0, 0, 0, 1, 1,
1.44077, -0.5405337, 2.98113, 0, 0, 0, 1, 1,
1.444268, 2.153768, 0.152799, 0, 0, 0, 1, 1,
1.451648, 1.008777, 0.1394194, 0, 0, 0, 1, 1,
1.459389, -1.236343, 3.657589, 0, 0, 0, 1, 1,
1.464037, 0.06758776, 1.70544, 1, 1, 1, 1, 1,
1.490232, -0.7548027, 2.615727, 1, 1, 1, 1, 1,
1.499539, -0.6594136, 0.8026842, 1, 1, 1, 1, 1,
1.543466, 0.9626996, -0.9387567, 1, 1, 1, 1, 1,
1.54358, 0.8406543, 0.1994945, 1, 1, 1, 1, 1,
1.549879, -0.7621052, 2.120151, 1, 1, 1, 1, 1,
1.558084, -1.026851, 2.075664, 1, 1, 1, 1, 1,
1.560769, 0.107903, 0.9308428, 1, 1, 1, 1, 1,
1.581764, -1.354264, 1.616913, 1, 1, 1, 1, 1,
1.591739, -0.1630337, 2.674873, 1, 1, 1, 1, 1,
1.592767, -0.06619308, 2.030437, 1, 1, 1, 1, 1,
1.596089, -0.1804661, 0.5367376, 1, 1, 1, 1, 1,
1.60295, 0.7151196, 2.386933, 1, 1, 1, 1, 1,
1.62316, 1.538789, 0.2748723, 1, 1, 1, 1, 1,
1.645082, -0.4284655, 3.401802, 1, 1, 1, 1, 1,
1.654973, -0.07275923, 2.354198, 0, 0, 1, 1, 1,
1.655812, 0.7317042, 2.94827, 1, 0, 0, 1, 1,
1.662138, 0.2868622, 3.331078, 1, 0, 0, 1, 1,
1.667718, -1.371991, 4.222836, 1, 0, 0, 1, 1,
1.678324, 1.574282, 2.513623, 1, 0, 0, 1, 1,
1.698547, 1.282487, -1.978887, 1, 0, 0, 1, 1,
1.702826, -0.5824086, 0.2860091, 0, 0, 0, 1, 1,
1.703787, 0.8903612, 1.701423, 0, 0, 0, 1, 1,
1.703882, 0.4532821, 0.8515767, 0, 0, 0, 1, 1,
1.705552, 1.080257, 1.020083, 0, 0, 0, 1, 1,
1.720305, -0.6916431, 0.8784716, 0, 0, 0, 1, 1,
1.721617, 1.290821, 0.9449275, 0, 0, 0, 1, 1,
1.723165, 0.6155981, -1.263834, 0, 0, 0, 1, 1,
1.732301, -0.7378091, 0.8134562, 1, 1, 1, 1, 1,
1.745144, -2.242658, 1.397381, 1, 1, 1, 1, 1,
1.769622, -0.530376, 1.273159, 1, 1, 1, 1, 1,
1.822963, -0.7071103, 1.290299, 1, 1, 1, 1, 1,
1.852182, -1.505737, 2.872466, 1, 1, 1, 1, 1,
1.876365, -1.076001, 1.454054, 1, 1, 1, 1, 1,
1.918208, -1.838424, 3.671414, 1, 1, 1, 1, 1,
1.922204, -1.130204, 2.284851, 1, 1, 1, 1, 1,
1.928066, -0.9464049, 1.555138, 1, 1, 1, 1, 1,
1.932447, -0.5447385, 2.151431, 1, 1, 1, 1, 1,
1.937591, -0.1263336, 0.1043153, 1, 1, 1, 1, 1,
1.956146, -0.5882125, 1.487201, 1, 1, 1, 1, 1,
1.971726, -0.8714256, 2.042695, 1, 1, 1, 1, 1,
1.992707, 0.5172113, 0.518836, 1, 1, 1, 1, 1,
2.002298, -0.2192855, 2.765627, 1, 1, 1, 1, 1,
2.105043, -0.8565649, 0.7849333, 0, 0, 1, 1, 1,
2.119205, -0.2686723, 2.056863, 1, 0, 0, 1, 1,
2.143262, 0.3035244, 1.616412, 1, 0, 0, 1, 1,
2.145856, 0.573558, 2.156862, 1, 0, 0, 1, 1,
2.147681, -0.8110149, 2.716772, 1, 0, 0, 1, 1,
2.159497, 1.382348, 0.03363645, 1, 0, 0, 1, 1,
2.177919, -2.195076, 3.06453, 0, 0, 0, 1, 1,
2.22792, -0.1673126, 0.3661388, 0, 0, 0, 1, 1,
2.284889, 1.455757, 1.162993, 0, 0, 0, 1, 1,
2.346231, -0.6993909, 2.955757, 0, 0, 0, 1, 1,
2.348154, 1.618038, 1.220178, 0, 0, 0, 1, 1,
2.4131, 0.1131527, 0.9240374, 0, 0, 0, 1, 1,
2.444901, -0.1186404, 2.108165, 0, 0, 0, 1, 1,
2.487646, 1.098467, 0.3848703, 1, 1, 1, 1, 1,
2.647116, -1.051532, -0.853065, 1, 1, 1, 1, 1,
2.729888, 0.09979796, 1.177444, 1, 1, 1, 1, 1,
2.763199, 1.682199, 1.503153, 1, 1, 1, 1, 1,
2.852838, 0.4208165, 2.215144, 1, 1, 1, 1, 1,
3.04838, 0.3104324, 1.288126, 1, 1, 1, 1, 1,
3.79881, -0.2178246, 2.858597, 1, 1, 1, 1, 1
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
var radius = 9.777704;
var distance = 34.34377;
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
mvMatrix.translate( -0.2682269, -0.3831472, -0.3766544 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34377);
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
