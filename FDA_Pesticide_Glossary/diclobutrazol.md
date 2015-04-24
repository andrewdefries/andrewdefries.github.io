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
-3.467675, -0.3125867, -2.970298, 1, 0, 0, 1,
-2.927559, -0.5401741, -1.312621, 1, 0.007843138, 0, 1,
-2.718733, -0.7496338, -1.81524, 1, 0.01176471, 0, 1,
-2.585057, -0.04133045, -0.8710991, 1, 0.01960784, 0, 1,
-2.56131, -0.5571505, -1.002987, 1, 0.02352941, 0, 1,
-2.507744, -1.283481, -2.858114, 1, 0.03137255, 0, 1,
-2.498641, -0.3542762, 0.4424362, 1, 0.03529412, 0, 1,
-2.493119, 0.09201948, -1.369047, 1, 0.04313726, 0, 1,
-2.466367, -0.08851051, -1.735827, 1, 0.04705882, 0, 1,
-2.406538, 1.989744, -0.6314758, 1, 0.05490196, 0, 1,
-2.396693, -1.269863, -1.081473, 1, 0.05882353, 0, 1,
-2.32541, -0.9132849, 0.1676967, 1, 0.06666667, 0, 1,
-2.261415, 0.2897237, -1.26659, 1, 0.07058824, 0, 1,
-2.220496, -1.434933, -2.482357, 1, 0.07843138, 0, 1,
-2.13075, -2.397926, -2.393943, 1, 0.08235294, 0, 1,
-2.094652, 1.30078, -1.331517, 1, 0.09019608, 0, 1,
-2.053333, 0.1437716, -0.4958608, 1, 0.09411765, 0, 1,
-2.039072, -0.4844253, -2.270681, 1, 0.1019608, 0, 1,
-2.027954, 1.081105, -1.390147, 1, 0.1098039, 0, 1,
-1.990657, 1.361172, 0.1829845, 1, 0.1137255, 0, 1,
-1.988582, -0.1465329, -3.408495, 1, 0.1215686, 0, 1,
-1.957155, -0.5207695, -1.747475, 1, 0.1254902, 0, 1,
-1.89987, -1.335755, -1.895499, 1, 0.1333333, 0, 1,
-1.869994, 0.5501665, -0.2978408, 1, 0.1372549, 0, 1,
-1.861998, 0.5060728, -1.280276, 1, 0.145098, 0, 1,
-1.859269, 2.380522, 0.3521651, 1, 0.1490196, 0, 1,
-1.837581, 2.217252, -0.4922291, 1, 0.1568628, 0, 1,
-1.836448, 0.398656, 0.1129152, 1, 0.1607843, 0, 1,
-1.829206, -1.576486, -3.574114, 1, 0.1686275, 0, 1,
-1.824952, 1.246742, -0.3256972, 1, 0.172549, 0, 1,
-1.810321, 0.28221, -2.960303, 1, 0.1803922, 0, 1,
-1.809209, 1.838448, -1.444906, 1, 0.1843137, 0, 1,
-1.782921, 0.1908164, -2.403073, 1, 0.1921569, 0, 1,
-1.780988, -0.4975349, -2.427098, 1, 0.1960784, 0, 1,
-1.774166, -0.5283436, -1.523696, 1, 0.2039216, 0, 1,
-1.738204, 1.197683, -1.001403, 1, 0.2117647, 0, 1,
-1.735642, -0.9233188, -0.8692801, 1, 0.2156863, 0, 1,
-1.711589, 0.2133706, -0.4448149, 1, 0.2235294, 0, 1,
-1.705911, -0.09952102, -0.78714, 1, 0.227451, 0, 1,
-1.700945, 0.7985372, -1.376055, 1, 0.2352941, 0, 1,
-1.697101, -0.08104271, -1.113861, 1, 0.2392157, 0, 1,
-1.683597, -0.1507432, -3.09405, 1, 0.2470588, 0, 1,
-1.663274, -0.4153575, -0.6771215, 1, 0.2509804, 0, 1,
-1.657892, 1.324641, -1.109081, 1, 0.2588235, 0, 1,
-1.65086, 0.284509, -1.556083, 1, 0.2627451, 0, 1,
-1.64848, 0.9797251, -1.029567, 1, 0.2705882, 0, 1,
-1.64161, 1.804189, -0.8498068, 1, 0.2745098, 0, 1,
-1.639454, -0.1379509, -2.006047, 1, 0.282353, 0, 1,
-1.637073, -0.445429, -4.596824, 1, 0.2862745, 0, 1,
-1.635003, -0.2807221, -0.9764538, 1, 0.2941177, 0, 1,
-1.615162, 0.5250112, -1.224476, 1, 0.3019608, 0, 1,
-1.598593, 0.410011, -2.547611, 1, 0.3058824, 0, 1,
-1.594973, -0.548196, -2.381978, 1, 0.3137255, 0, 1,
-1.546137, 0.06161103, -0.8108519, 1, 0.3176471, 0, 1,
-1.527259, 1.620832, -1.382596, 1, 0.3254902, 0, 1,
-1.525352, 1.180958, -0.8020117, 1, 0.3294118, 0, 1,
-1.524044, -0.1242295, -0.132953, 1, 0.3372549, 0, 1,
-1.51385, -0.8268653, -2.427321, 1, 0.3411765, 0, 1,
-1.511659, -0.3623819, -1.352585, 1, 0.3490196, 0, 1,
-1.508503, 2.504986, -2.90453, 1, 0.3529412, 0, 1,
-1.501732, -0.7083279, -0.271655, 1, 0.3607843, 0, 1,
-1.490455, -0.5815881, -2.551842, 1, 0.3647059, 0, 1,
-1.475766, 0.7597597, -0.8567185, 1, 0.372549, 0, 1,
-1.458493, 0.01178297, -1.250833, 1, 0.3764706, 0, 1,
-1.457563, -0.5465789, -2.907064, 1, 0.3843137, 0, 1,
-1.451914, -1.325362, -0.7521895, 1, 0.3882353, 0, 1,
-1.445664, 1.542117, -0.19987, 1, 0.3960784, 0, 1,
-1.44398, -0.1064481, -2.116106, 1, 0.4039216, 0, 1,
-1.438543, 0.6895852, -1.338413, 1, 0.4078431, 0, 1,
-1.438499, 1.318905, -1.012455, 1, 0.4156863, 0, 1,
-1.429816, 0.1112054, -2.285417, 1, 0.4196078, 0, 1,
-1.424511, -0.01528366, 0.7678202, 1, 0.427451, 0, 1,
-1.41323, -0.1442354, -1.906306, 1, 0.4313726, 0, 1,
-1.391418, -0.1756325, -1.580481, 1, 0.4392157, 0, 1,
-1.384469, -0.1111447, -1.145961, 1, 0.4431373, 0, 1,
-1.377548, 0.5003052, -1.004014, 1, 0.4509804, 0, 1,
-1.375178, -1.786533, -0.5363882, 1, 0.454902, 0, 1,
-1.366699, 0.2507031, -1.398592, 1, 0.4627451, 0, 1,
-1.356701, 0.09976814, -2.245913, 1, 0.4666667, 0, 1,
-1.346156, -0.4407059, -1.571122, 1, 0.4745098, 0, 1,
-1.345857, -0.3929975, -1.847071, 1, 0.4784314, 0, 1,
-1.33294, 0.03079697, -3.5091, 1, 0.4862745, 0, 1,
-1.308961, 0.0454574, -0.7891948, 1, 0.4901961, 0, 1,
-1.284966, 0.7248967, -0.5915465, 1, 0.4980392, 0, 1,
-1.271142, 1.069122, -0.03682687, 1, 0.5058824, 0, 1,
-1.266333, -0.1154608, 0.01603752, 1, 0.509804, 0, 1,
-1.264886, -0.5510172, -1.766982, 1, 0.5176471, 0, 1,
-1.256922, 1.583198, 0.2869289, 1, 0.5215687, 0, 1,
-1.248267, 0.2745269, 0.2019806, 1, 0.5294118, 0, 1,
-1.247688, -1.2607, -2.073027, 1, 0.5333334, 0, 1,
-1.247313, -0.2933507, -0.6787723, 1, 0.5411765, 0, 1,
-1.243893, 1.502863, -0.8982899, 1, 0.5450981, 0, 1,
-1.242974, -0.2626099, -3.383325, 1, 0.5529412, 0, 1,
-1.235067, -0.6504884, -1.134093, 1, 0.5568628, 0, 1,
-1.230486, -0.1072007, -1.896835, 1, 0.5647059, 0, 1,
-1.227795, -0.1904422, -3.223311, 1, 0.5686275, 0, 1,
-1.223118, -0.703466, -2.379615, 1, 0.5764706, 0, 1,
-1.220887, 0.44659, -0.925982, 1, 0.5803922, 0, 1,
-1.208388, -1.562626, -2.865543, 1, 0.5882353, 0, 1,
-1.204486, -0.1231412, -2.17621, 1, 0.5921569, 0, 1,
-1.204243, -0.7357345, -1.067842, 1, 0.6, 0, 1,
-1.203728, 0.8191993, -1.735421, 1, 0.6078432, 0, 1,
-1.191546, -0.4496383, -2.490666, 1, 0.6117647, 0, 1,
-1.189513, -1.057432, -1.662277, 1, 0.6196079, 0, 1,
-1.1836, -1.025204, -3.60749, 1, 0.6235294, 0, 1,
-1.181701, 0.9181486, 1.838381, 1, 0.6313726, 0, 1,
-1.178315, 0.2250285, -1.769726, 1, 0.6352941, 0, 1,
-1.173588, 0.5644533, -2.512279, 1, 0.6431373, 0, 1,
-1.163519, -0.2673953, -3.727209, 1, 0.6470588, 0, 1,
-1.160213, -0.4254176, -2.184604, 1, 0.654902, 0, 1,
-1.148334, -0.05623881, -0.4794279, 1, 0.6588235, 0, 1,
-1.147412, -0.1690247, -2.50177, 1, 0.6666667, 0, 1,
-1.140555, -1.123526, -1.53958, 1, 0.6705883, 0, 1,
-1.129055, 1.022748, 0.3659368, 1, 0.6784314, 0, 1,
-1.121192, -0.05830253, -2.972576, 1, 0.682353, 0, 1,
-1.114709, -0.7775849, -1.809961, 1, 0.6901961, 0, 1,
-1.111698, -0.06337769, -1.507545, 1, 0.6941177, 0, 1,
-1.101618, 0.6345829, -1.416903, 1, 0.7019608, 0, 1,
-1.099821, 0.4441267, -0.1069209, 1, 0.7098039, 0, 1,
-1.098131, -0.8399289, 0.1173048, 1, 0.7137255, 0, 1,
-1.088871, 1.445738, -2.037228, 1, 0.7215686, 0, 1,
-1.086445, 0.3382229, -0.7726287, 1, 0.7254902, 0, 1,
-1.083388, 0.5516058, -1.629396, 1, 0.7333333, 0, 1,
-1.081985, -0.271198, -1.890046, 1, 0.7372549, 0, 1,
-1.078433, 1.726659, -1.292178, 1, 0.7450981, 0, 1,
-1.072858, 0.4446923, -0.6730777, 1, 0.7490196, 0, 1,
-1.072562, -1.307286, -2.012993, 1, 0.7568628, 0, 1,
-1.062672, 1.16307, 0.5115012, 1, 0.7607843, 0, 1,
-1.062461, 1.846079, -1.786901, 1, 0.7686275, 0, 1,
-1.056074, -0.6409395, -1.399418, 1, 0.772549, 0, 1,
-1.053423, 0.9277867, -0.00718616, 1, 0.7803922, 0, 1,
-1.044857, -0.5326979, -2.877031, 1, 0.7843137, 0, 1,
-1.041587, -1.874015, -1.860253, 1, 0.7921569, 0, 1,
-1.040908, 0.5424275, -2.924696, 1, 0.7960784, 0, 1,
-1.039926, -0.4742361, -1.240631, 1, 0.8039216, 0, 1,
-1.023031, 0.730967, -1.648852, 1, 0.8117647, 0, 1,
-1.022842, -0.361542, -2.018226, 1, 0.8156863, 0, 1,
-1.019601, 0.3677576, -1.683656, 1, 0.8235294, 0, 1,
-1.013893, 0.574225, -2.211253, 1, 0.827451, 0, 1,
-1.005228, -0.4696534, -1.054248, 1, 0.8352941, 0, 1,
-1.004696, -0.5170478, -2.540498, 1, 0.8392157, 0, 1,
-0.9998378, -1.444256, -2.069426, 1, 0.8470588, 0, 1,
-0.9954849, 0.02301716, -1.802152, 1, 0.8509804, 0, 1,
-0.9859862, -1.023111, -3.526343, 1, 0.8588235, 0, 1,
-0.9858108, 0.8219271, -1.417428, 1, 0.8627451, 0, 1,
-0.9850177, -0.4889572, -1.896685, 1, 0.8705882, 0, 1,
-0.9614227, 0.4482031, -0.8452623, 1, 0.8745098, 0, 1,
-0.9568808, -1.146152, -0.0165184, 1, 0.8823529, 0, 1,
-0.9517941, -0.1540173, -3.613034, 1, 0.8862745, 0, 1,
-0.9495122, -1.224242, -1.061291, 1, 0.8941177, 0, 1,
-0.9434615, 1.386928, -0.1149281, 1, 0.8980392, 0, 1,
-0.9379125, -1.289236, -1.751699, 1, 0.9058824, 0, 1,
-0.9338754, -0.2957104, -2.891638, 1, 0.9137255, 0, 1,
-0.9328324, 1.235411, -2.793726, 1, 0.9176471, 0, 1,
-0.9327729, 0.06184727, -1.593491, 1, 0.9254902, 0, 1,
-0.9327093, -0.4590612, -1.099856, 1, 0.9294118, 0, 1,
-0.9188823, -0.3354339, -2.667626, 1, 0.9372549, 0, 1,
-0.9108387, 1.385218, -1.124401, 1, 0.9411765, 0, 1,
-0.9103414, -0.7838417, -3.206809, 1, 0.9490196, 0, 1,
-0.9080508, -0.3708057, 0.1397865, 1, 0.9529412, 0, 1,
-0.8994432, 1.271651, 0.3034048, 1, 0.9607843, 0, 1,
-0.8980647, -0.255181, -0.4709093, 1, 0.9647059, 0, 1,
-0.8978462, -0.2034739, -2.63603, 1, 0.972549, 0, 1,
-0.8951336, -0.2166385, -1.328186, 1, 0.9764706, 0, 1,
-0.8933412, -1.207777, -2.641173, 1, 0.9843137, 0, 1,
-0.8929436, 0.6235065, -1.419515, 1, 0.9882353, 0, 1,
-0.8898358, 0.9777815, -0.4691475, 1, 0.9960784, 0, 1,
-0.888032, 1.002187, -0.5431662, 0.9960784, 1, 0, 1,
-0.8873615, -1.842061, -2.544125, 0.9921569, 1, 0, 1,
-0.8858061, -0.5359718, -2.382848, 0.9843137, 1, 0, 1,
-0.8854265, 0.6510001, -0.5512098, 0.9803922, 1, 0, 1,
-0.8839256, 0.2399977, 0.2846248, 0.972549, 1, 0, 1,
-0.8822218, -0.7144359, -2.012524, 0.9686275, 1, 0, 1,
-0.8805128, -0.272138, -0.8557822, 0.9607843, 1, 0, 1,
-0.8769807, -2.651938, -1.764419, 0.9568627, 1, 0, 1,
-0.8759056, 0.7291207, -0.2835658, 0.9490196, 1, 0, 1,
-0.873161, 1.414635, 0.3453755, 0.945098, 1, 0, 1,
-0.8702128, 0.01835882, -2.576116, 0.9372549, 1, 0, 1,
-0.8670698, 1.332168, -1.204693, 0.9333333, 1, 0, 1,
-0.8669149, -0.1229783, -2.047644, 0.9254902, 1, 0, 1,
-0.8626529, 2.077005, 0.2361292, 0.9215686, 1, 0, 1,
-0.8572664, -0.4647389, -3.276806, 0.9137255, 1, 0, 1,
-0.8517303, -0.4698095, -2.257373, 0.9098039, 1, 0, 1,
-0.8432082, 0.09722692, -1.876887, 0.9019608, 1, 0, 1,
-0.8419439, -0.04520258, -1.080312, 0.8941177, 1, 0, 1,
-0.839658, -1.157015, -3.723288, 0.8901961, 1, 0, 1,
-0.8259389, -1.169562, -1.968325, 0.8823529, 1, 0, 1,
-0.8204265, 0.3888636, -1.193457, 0.8784314, 1, 0, 1,
-0.8143018, 0.7681484, -2.31817, 0.8705882, 1, 0, 1,
-0.804517, -0.8547226, -2.204607, 0.8666667, 1, 0, 1,
-0.8022529, 0.0181657, -1.708511, 0.8588235, 1, 0, 1,
-0.7965832, -1.001994, -2.216682, 0.854902, 1, 0, 1,
-0.789001, 1.716611, -1.167457, 0.8470588, 1, 0, 1,
-0.786534, 0.6925721, -0.5161024, 0.8431373, 1, 0, 1,
-0.7766687, -1.330927, -1.663697, 0.8352941, 1, 0, 1,
-0.7760379, -0.4849617, -3.295871, 0.8313726, 1, 0, 1,
-0.7711384, 0.6294641, 0.2469697, 0.8235294, 1, 0, 1,
-0.7670888, -0.4801893, -3.147982, 0.8196079, 1, 0, 1,
-0.7622303, 0.2639152, -0.1804394, 0.8117647, 1, 0, 1,
-0.7572744, -0.9621247, -2.891309, 0.8078431, 1, 0, 1,
-0.7561013, 0.09439197, -0.5265675, 0.8, 1, 0, 1,
-0.7511068, -1.48356, -0.7921691, 0.7921569, 1, 0, 1,
-0.7470363, -1.772631, -1.206557, 0.7882353, 1, 0, 1,
-0.7434844, -1.680272, -1.985494, 0.7803922, 1, 0, 1,
-0.7430446, 0.7621875, -0.9009274, 0.7764706, 1, 0, 1,
-0.7426741, -0.2828344, -2.034304, 0.7686275, 1, 0, 1,
-0.736191, 0.3570812, -1.23614, 0.7647059, 1, 0, 1,
-0.7334511, -0.3072526, -1.913168, 0.7568628, 1, 0, 1,
-0.7312599, 0.455697, -0.953072, 0.7529412, 1, 0, 1,
-0.7302616, -0.5227438, -0.8851086, 0.7450981, 1, 0, 1,
-0.7275587, 0.1652173, 0.1651754, 0.7411765, 1, 0, 1,
-0.7263094, -0.6449121, -4.698243, 0.7333333, 1, 0, 1,
-0.7227655, 2.051215, -0.2092768, 0.7294118, 1, 0, 1,
-0.7204439, 0.7484961, -3.391554, 0.7215686, 1, 0, 1,
-0.7189064, 1.767365, 2.270132, 0.7176471, 1, 0, 1,
-0.7153737, 0.5560967, -1.199077, 0.7098039, 1, 0, 1,
-0.7145684, 1.704408, 0.6495833, 0.7058824, 1, 0, 1,
-0.7113625, 0.03920396, -1.783244, 0.6980392, 1, 0, 1,
-0.7023673, 1.527882, -0.7389863, 0.6901961, 1, 0, 1,
-0.7017481, 0.4787129, -2.595386, 0.6862745, 1, 0, 1,
-0.6991249, 0.9733537, -0.3151382, 0.6784314, 1, 0, 1,
-0.6972402, 0.2507098, -0.9531772, 0.6745098, 1, 0, 1,
-0.6938303, 0.7304407, 0.7769575, 0.6666667, 1, 0, 1,
-0.6900894, -2.424455, -2.549465, 0.6627451, 1, 0, 1,
-0.6877449, -1.010219, -2.239266, 0.654902, 1, 0, 1,
-0.6819075, -0.5668558, -3.18825, 0.6509804, 1, 0, 1,
-0.6769231, -0.2135026, -1.975404, 0.6431373, 1, 0, 1,
-0.6747499, -0.4295648, -2.307135, 0.6392157, 1, 0, 1,
-0.6744691, -0.6475363, -1.433966, 0.6313726, 1, 0, 1,
-0.671864, 0.7841104, -0.7420291, 0.627451, 1, 0, 1,
-0.66523, -0.0239448, -0.2529636, 0.6196079, 1, 0, 1,
-0.6618312, -0.6526257, -2.074231, 0.6156863, 1, 0, 1,
-0.6541233, 2.097739, -1.031477, 0.6078432, 1, 0, 1,
-0.6497324, 0.01676143, -1.740392, 0.6039216, 1, 0, 1,
-0.6437839, 1.101382, 0.798719, 0.5960785, 1, 0, 1,
-0.6435778, -0.5655658, -2.362895, 0.5882353, 1, 0, 1,
-0.6425927, 0.2357032, -1.568726, 0.5843138, 1, 0, 1,
-0.6358915, -0.6754006, -3.099869, 0.5764706, 1, 0, 1,
-0.6352018, -0.3536301, -1.884696, 0.572549, 1, 0, 1,
-0.6319878, -2.436721, -2.765959, 0.5647059, 1, 0, 1,
-0.6301917, -1.498522, -3.478267, 0.5607843, 1, 0, 1,
-0.6290992, 0.0006677377, -1.008596, 0.5529412, 1, 0, 1,
-0.6260269, -0.8168387, -2.457498, 0.5490196, 1, 0, 1,
-0.6225361, -1.689037, 0.4875607, 0.5411765, 1, 0, 1,
-0.6163307, 0.8632648, -0.7735298, 0.5372549, 1, 0, 1,
-0.6132664, -0.6279187, -2.557072, 0.5294118, 1, 0, 1,
-0.6128452, 1.942803, -0.178487, 0.5254902, 1, 0, 1,
-0.6119239, 0.3927167, -0.9100506, 0.5176471, 1, 0, 1,
-0.6092095, 0.1368422, -1.583311, 0.5137255, 1, 0, 1,
-0.6034538, -0.5212833, 0.7295444, 0.5058824, 1, 0, 1,
-0.6020841, 1.020558, -0.5743034, 0.5019608, 1, 0, 1,
-0.5925764, 1.002557, 0.2670143, 0.4941176, 1, 0, 1,
-0.5836602, -0.443379, -2.415333, 0.4862745, 1, 0, 1,
-0.5781766, 1.493695, -0.04494063, 0.4823529, 1, 0, 1,
-0.5688634, 0.09624157, -1.319979, 0.4745098, 1, 0, 1,
-0.5607539, 0.4104407, -0.08848102, 0.4705882, 1, 0, 1,
-0.556801, -0.7336382, -2.921559, 0.4627451, 1, 0, 1,
-0.5567428, -1.514081, -4.808321, 0.4588235, 1, 0, 1,
-0.5565123, -0.4775599, -1.214125, 0.4509804, 1, 0, 1,
-0.5537854, 1.236344, 0.7915837, 0.4470588, 1, 0, 1,
-0.5499943, -1.311291, -2.449962, 0.4392157, 1, 0, 1,
-0.5497825, 0.7966311, -1.556906, 0.4352941, 1, 0, 1,
-0.5493899, -0.07598985, -2.599195, 0.427451, 1, 0, 1,
-0.5488868, 0.3053137, -1.909539, 0.4235294, 1, 0, 1,
-0.5448439, 1.125579, -0.9605753, 0.4156863, 1, 0, 1,
-0.5437754, -0.180064, -3.545037, 0.4117647, 1, 0, 1,
-0.5436165, 0.6213993, -0.744865, 0.4039216, 1, 0, 1,
-0.5412676, 1.170499, -0.6224036, 0.3960784, 1, 0, 1,
-0.5401059, -1.027793, -2.451343, 0.3921569, 1, 0, 1,
-0.5341297, -1.322248, -2.55719, 0.3843137, 1, 0, 1,
-0.5303584, -1.838846, -2.829879, 0.3803922, 1, 0, 1,
-0.5269517, -1.916393, -3.821245, 0.372549, 1, 0, 1,
-0.5239826, 0.7177788, -2.418377, 0.3686275, 1, 0, 1,
-0.5236331, 0.6964185, -2.389565, 0.3607843, 1, 0, 1,
-0.519462, -2.012399, -4.244309, 0.3568628, 1, 0, 1,
-0.5162538, -0.4265841, -2.918368, 0.3490196, 1, 0, 1,
-0.5160016, 0.5097553, -0.4648786, 0.345098, 1, 0, 1,
-0.5099101, -0.9369593, -2.842613, 0.3372549, 1, 0, 1,
-0.5024661, 0.5517869, -1.906074, 0.3333333, 1, 0, 1,
-0.501512, -0.3143711, -0.9879029, 0.3254902, 1, 0, 1,
-0.491954, -0.409198, -2.994877, 0.3215686, 1, 0, 1,
-0.4917708, 0.1437854, -1.575843, 0.3137255, 1, 0, 1,
-0.4907472, -0.6262203, -3.381908, 0.3098039, 1, 0, 1,
-0.4881063, -0.474196, -2.386842, 0.3019608, 1, 0, 1,
-0.4846537, 0.06870557, -1.207362, 0.2941177, 1, 0, 1,
-0.4839444, -2.070592, -1.776806, 0.2901961, 1, 0, 1,
-0.4811505, -0.2667018, -3.187379, 0.282353, 1, 0, 1,
-0.4806035, 1.870142, -0.6821723, 0.2784314, 1, 0, 1,
-0.469887, 0.7558133, 0.6618156, 0.2705882, 1, 0, 1,
-0.4697049, -0.6148383, -2.128302, 0.2666667, 1, 0, 1,
-0.4693853, 0.7042463, 0.5280687, 0.2588235, 1, 0, 1,
-0.4693444, 0.01007881, -2.072366, 0.254902, 1, 0, 1,
-0.4690867, -0.3651478, -3.476845, 0.2470588, 1, 0, 1,
-0.4683675, -0.01908164, -0.1817586, 0.2431373, 1, 0, 1,
-0.4681964, -0.1495486, -1.594044, 0.2352941, 1, 0, 1,
-0.4672944, -1.002293, -1.934963, 0.2313726, 1, 0, 1,
-0.4662625, -1.978222, -1.718424, 0.2235294, 1, 0, 1,
-0.4640806, 0.7031847, -0.3307807, 0.2196078, 1, 0, 1,
-0.4622407, 1.881499, -1.619256, 0.2117647, 1, 0, 1,
-0.4568139, -0.6413765, -3.805634, 0.2078431, 1, 0, 1,
-0.4550551, -0.3053424, -3.94116, 0.2, 1, 0, 1,
-0.4531487, -0.4392593, -1.165955, 0.1921569, 1, 0, 1,
-0.442454, 1.204829, -0.7682526, 0.1882353, 1, 0, 1,
-0.4418427, -1.059064, -3.405183, 0.1803922, 1, 0, 1,
-0.4403688, -0.4819349, -1.466433, 0.1764706, 1, 0, 1,
-0.4399659, 2.170797, -0.400397, 0.1686275, 1, 0, 1,
-0.438928, 0.7778315, -0.3851937, 0.1647059, 1, 0, 1,
-0.4381723, 0.5032066, 0.3554464, 0.1568628, 1, 0, 1,
-0.4371001, 0.5477684, -0.5043133, 0.1529412, 1, 0, 1,
-0.4370647, -0.7495932, -0.8931402, 0.145098, 1, 0, 1,
-0.4342676, -0.792046, -1.998762, 0.1411765, 1, 0, 1,
-0.431866, 0.3218953, 0.7890711, 0.1333333, 1, 0, 1,
-0.4304884, 1.435477, -0.2599131, 0.1294118, 1, 0, 1,
-0.4302126, 0.0285537, -3.319822, 0.1215686, 1, 0, 1,
-0.4285752, -0.7649053, -2.424797, 0.1176471, 1, 0, 1,
-0.4279279, 0.7858238, -1.581622, 0.1098039, 1, 0, 1,
-0.4243048, 1.431868, -0.8009951, 0.1058824, 1, 0, 1,
-0.4237068, 0.1075428, -2.034497, 0.09803922, 1, 0, 1,
-0.4208695, -0.4309604, -2.841828, 0.09019608, 1, 0, 1,
-0.4186895, -0.02423707, -2.599376, 0.08627451, 1, 0, 1,
-0.4179279, -0.211571, -1.4291, 0.07843138, 1, 0, 1,
-0.4158995, 0.4577921, 0.1237054, 0.07450981, 1, 0, 1,
-0.4158551, -0.1231167, -1.140725, 0.06666667, 1, 0, 1,
-0.4127662, -0.437928, -1.815235, 0.0627451, 1, 0, 1,
-0.4124545, 1.083253, -0.0815809, 0.05490196, 1, 0, 1,
-0.40753, 0.7937538, -0.6005274, 0.05098039, 1, 0, 1,
-0.406409, -0.1647334, -0.6360462, 0.04313726, 1, 0, 1,
-0.4059907, -0.6247483, -1.791996, 0.03921569, 1, 0, 1,
-0.4034985, -0.8698482, -3.365311, 0.03137255, 1, 0, 1,
-0.4024149, 2.381611, -1.278661, 0.02745098, 1, 0, 1,
-0.401921, -0.3332233, -3.108148, 0.01960784, 1, 0, 1,
-0.4001522, -2.076191, -1.216997, 0.01568628, 1, 0, 1,
-0.4000532, -0.7345232, -1.680091, 0.007843138, 1, 0, 1,
-0.3996125, -1.095828, -2.229415, 0.003921569, 1, 0, 1,
-0.3981677, 0.6644484, -0.8918653, 0, 1, 0.003921569, 1,
-0.3976716, -2.643906, -3.004207, 0, 1, 0.01176471, 1,
-0.3963557, -0.006262107, -1.163459, 0, 1, 0.01568628, 1,
-0.3944525, -1.60206, -0.926577, 0, 1, 0.02352941, 1,
-0.3838916, -0.4500362, -1.881763, 0, 1, 0.02745098, 1,
-0.3825133, -1.122334, -3.63451, 0, 1, 0.03529412, 1,
-0.3813837, -0.1454106, -1.905621, 0, 1, 0.03921569, 1,
-0.3813463, -1.687905, -2.241143, 0, 1, 0.04705882, 1,
-0.3811504, 0.202604, -0.08951889, 0, 1, 0.05098039, 1,
-0.3798293, -0.9328207, -2.370114, 0, 1, 0.05882353, 1,
-0.3754896, 0.7701707, -0.4201792, 0, 1, 0.0627451, 1,
-0.3747705, 0.1088873, -1.154253, 0, 1, 0.07058824, 1,
-0.3727605, 0.5197824, 0.1955505, 0, 1, 0.07450981, 1,
-0.3694051, -1.452409, -1.199453, 0, 1, 0.08235294, 1,
-0.3678528, -0.4841985, -1.281273, 0, 1, 0.08627451, 1,
-0.3661681, 2.023714, -0.7210093, 0, 1, 0.09411765, 1,
-0.3646927, -1.149714, -3.266768, 0, 1, 0.1019608, 1,
-0.3633821, 0.822357, 0.3517993, 0, 1, 0.1058824, 1,
-0.3604956, 0.8156115, -0.5374384, 0, 1, 0.1137255, 1,
-0.3601122, 0.1542288, -1.976831, 0, 1, 0.1176471, 1,
-0.3563318, -1.07635, -2.782179, 0, 1, 0.1254902, 1,
-0.3551751, -0.9692374, -2.050699, 0, 1, 0.1294118, 1,
-0.3550268, 1.266828, -1.886801, 0, 1, 0.1372549, 1,
-0.3547909, -1.141658, -1.135745, 0, 1, 0.1411765, 1,
-0.3538657, -0.09793807, -2.328844, 0, 1, 0.1490196, 1,
-0.3503199, -1.142538, -2.113937, 0, 1, 0.1529412, 1,
-0.3470528, 0.4479043, -0.4582203, 0, 1, 0.1607843, 1,
-0.3435611, -0.1753052, -1.959937, 0, 1, 0.1647059, 1,
-0.3398589, 0.0837042, -2.480144, 0, 1, 0.172549, 1,
-0.3382881, 1.959309, 0.03622903, 0, 1, 0.1764706, 1,
-0.3347265, 0.2386022, -1.966761, 0, 1, 0.1843137, 1,
-0.3331186, 0.4333747, -0.05400842, 0, 1, 0.1882353, 1,
-0.3286582, -0.6916082, -2.623851, 0, 1, 0.1960784, 1,
-0.3236899, -1.162208, -1.829271, 0, 1, 0.2039216, 1,
-0.3234119, -0.1886612, -3.033553, 0, 1, 0.2078431, 1,
-0.3150868, 0.1296711, -2.971028, 0, 1, 0.2156863, 1,
-0.3101929, -0.9686323, -2.602736, 0, 1, 0.2196078, 1,
-0.3073107, 0.2722192, -0.1762941, 0, 1, 0.227451, 1,
-0.3061733, -0.9490677, -2.205909, 0, 1, 0.2313726, 1,
-0.3036481, 0.3258579, -0.05517359, 0, 1, 0.2392157, 1,
-0.303381, 0.7675632, -2.524089, 0, 1, 0.2431373, 1,
-0.3033578, 1.041068, 0.6439366, 0, 1, 0.2509804, 1,
-0.3016155, -0.6368822, -4.061166, 0, 1, 0.254902, 1,
-0.2929829, -1.094251, -4.377352, 0, 1, 0.2627451, 1,
-0.2923997, -0.03537821, -1.387974, 0, 1, 0.2666667, 1,
-0.2912544, -0.6077949, -3.339444, 0, 1, 0.2745098, 1,
-0.2909878, 0.8510345, -0.2150013, 0, 1, 0.2784314, 1,
-0.2839466, 1.323537, -0.2428902, 0, 1, 0.2862745, 1,
-0.2833473, 1.410358, -0.009249012, 0, 1, 0.2901961, 1,
-0.2832547, 1.492729, 0.6173103, 0, 1, 0.2980392, 1,
-0.2830839, 0.589053, -1.150764, 0, 1, 0.3058824, 1,
-0.2805828, 0.01086354, -3.192593, 0, 1, 0.3098039, 1,
-0.2747239, -1.601413, -3.050326, 0, 1, 0.3176471, 1,
-0.2746607, -0.8418697, -2.380204, 0, 1, 0.3215686, 1,
-0.2732584, 0.1146406, -3.574269, 0, 1, 0.3294118, 1,
-0.2707119, 1.283123, -0.6865783, 0, 1, 0.3333333, 1,
-0.2677506, -0.07692696, -1.365342, 0, 1, 0.3411765, 1,
-0.2673501, -1.159814, -3.085431, 0, 1, 0.345098, 1,
-0.2603247, 0.6823736, 0.8844155, 0, 1, 0.3529412, 1,
-0.2589792, 0.4541314, -1.152473, 0, 1, 0.3568628, 1,
-0.2569454, -0.2515164, -1.405748, 0, 1, 0.3647059, 1,
-0.2561988, -0.6097162, -2.586107, 0, 1, 0.3686275, 1,
-0.2522294, 2.12644, -1.003873, 0, 1, 0.3764706, 1,
-0.2502989, 0.6775221, 0.03567888, 0, 1, 0.3803922, 1,
-0.2478842, -0.7677642, -2.352762, 0, 1, 0.3882353, 1,
-0.2429415, -0.2452138, -3.566316, 0, 1, 0.3921569, 1,
-0.2413505, 1.625258, -0.8065755, 0, 1, 0.4, 1,
-0.2388507, -0.5898632, -2.813053, 0, 1, 0.4078431, 1,
-0.23857, 0.5487736, -0.3398368, 0, 1, 0.4117647, 1,
-0.2357897, 1.884014, -0.07083014, 0, 1, 0.4196078, 1,
-0.2352605, 1.073388, -0.2891351, 0, 1, 0.4235294, 1,
-0.2314997, -0.1151792, -2.090596, 0, 1, 0.4313726, 1,
-0.2292042, -0.2593044, -2.282619, 0, 1, 0.4352941, 1,
-0.2274743, -0.8058109, -3.240013, 0, 1, 0.4431373, 1,
-0.225494, 0.03477859, -2.802973, 0, 1, 0.4470588, 1,
-0.2201585, 0.5229121, -0.4956881, 0, 1, 0.454902, 1,
-0.2194213, 0.2825319, 0.2784716, 0, 1, 0.4588235, 1,
-0.2178502, 2.68444, -0.04896984, 0, 1, 0.4666667, 1,
-0.2177532, -0.9487726, -1.322705, 0, 1, 0.4705882, 1,
-0.2169212, -1.491174, -1.960531, 0, 1, 0.4784314, 1,
-0.2164295, -2.241235, -3.620256, 0, 1, 0.4823529, 1,
-0.2161212, -0.2897926, -2.115382, 0, 1, 0.4901961, 1,
-0.2132546, -1.355618, -2.360974, 0, 1, 0.4941176, 1,
-0.207566, -0.7495994, -2.616908, 0, 1, 0.5019608, 1,
-0.2047931, -1.271899, -2.803451, 0, 1, 0.509804, 1,
-0.2026561, -2.252948, -1.725525, 0, 1, 0.5137255, 1,
-0.2015816, 0.3996909, -0.04795474, 0, 1, 0.5215687, 1,
-0.1997915, -0.4285407, -3.962571, 0, 1, 0.5254902, 1,
-0.1996751, -0.04598429, -0.6499988, 0, 1, 0.5333334, 1,
-0.1983134, 0.3562544, -1.554953, 0, 1, 0.5372549, 1,
-0.1981337, -0.7931139, -3.756944, 0, 1, 0.5450981, 1,
-0.1955324, 1.039263, 0.141629, 0, 1, 0.5490196, 1,
-0.1941036, -1.268185, -3.754131, 0, 1, 0.5568628, 1,
-0.1939776, -0.3638359, -2.504111, 0, 1, 0.5607843, 1,
-0.1911089, -0.04152005, -0.2365201, 0, 1, 0.5686275, 1,
-0.1892314, -0.2377675, -3.193449, 0, 1, 0.572549, 1,
-0.1767738, 0.1912583, -1.077047, 0, 1, 0.5803922, 1,
-0.1759458, 0.9196849, -0.8578286, 0, 1, 0.5843138, 1,
-0.1748222, 0.2422249, -1.274788, 0, 1, 0.5921569, 1,
-0.1705398, -1.118434, -1.392231, 0, 1, 0.5960785, 1,
-0.1679023, 0.3869448, -0.6226389, 0, 1, 0.6039216, 1,
-0.1658081, 0.6278744, 1.558738, 0, 1, 0.6117647, 1,
-0.163125, 0.3387598, -1.444127, 0, 1, 0.6156863, 1,
-0.1623354, -1.191925, -5.040913, 0, 1, 0.6235294, 1,
-0.1563365, 0.231473, -0.4174156, 0, 1, 0.627451, 1,
-0.151885, 0.7510462, -0.353837, 0, 1, 0.6352941, 1,
-0.1461658, 0.1252511, -1.758338, 0, 1, 0.6392157, 1,
-0.1438929, -1.033469, -2.457685, 0, 1, 0.6470588, 1,
-0.1430254, -0.08519931, -1.698155, 0, 1, 0.6509804, 1,
-0.142134, 0.8567127, -0.7516612, 0, 1, 0.6588235, 1,
-0.1411413, 1.87908, 0.9487578, 0, 1, 0.6627451, 1,
-0.139763, 0.2379105, 0.431446, 0, 1, 0.6705883, 1,
-0.1385881, -0.7620111, -3.060991, 0, 1, 0.6745098, 1,
-0.1349234, -0.7046173, -4.618311, 0, 1, 0.682353, 1,
-0.1336226, -2.563398, -1.919072, 0, 1, 0.6862745, 1,
-0.1335253, 2.034809, -0.3572875, 0, 1, 0.6941177, 1,
-0.132958, 1.099388, 0.4387625, 0, 1, 0.7019608, 1,
-0.1238522, 1.028657, -0.7110426, 0, 1, 0.7058824, 1,
-0.1193745, 0.5542207, 1.120726, 0, 1, 0.7137255, 1,
-0.1141571, -1.004958, -2.749417, 0, 1, 0.7176471, 1,
-0.1082472, -0.6349056, -2.588647, 0, 1, 0.7254902, 1,
-0.105358, -1.442606, -2.832266, 0, 1, 0.7294118, 1,
-0.1025086, -0.6659296, -1.621199, 0, 1, 0.7372549, 1,
-0.1024687, 1.303407, -0.2374555, 0, 1, 0.7411765, 1,
-0.1008447, 0.1093991, -0.5174047, 0, 1, 0.7490196, 1,
-0.09944896, -0.1541143, -3.035356, 0, 1, 0.7529412, 1,
-0.09513926, 0.2123307, -0.8883773, 0, 1, 0.7607843, 1,
-0.09396149, 0.9254005, -0.4443985, 0, 1, 0.7647059, 1,
-0.09081079, -1.485235, -2.479423, 0, 1, 0.772549, 1,
-0.08775371, -0.1651187, -4.024411, 0, 1, 0.7764706, 1,
-0.08521915, 0.1019127, -1.252863, 0, 1, 0.7843137, 1,
-0.08215724, -0.764071, -2.861271, 0, 1, 0.7882353, 1,
-0.07417652, -0.3088205, -3.221695, 0, 1, 0.7960784, 1,
-0.07303688, -1.504428, -4.461781, 0, 1, 0.8039216, 1,
-0.06823236, -0.9209718, -2.625, 0, 1, 0.8078431, 1,
-0.0661009, -0.02377915, 0.4638108, 0, 1, 0.8156863, 1,
-0.06434681, -0.06868761, -1.843622, 0, 1, 0.8196079, 1,
-0.06039067, 0.9582094, 1.068338, 0, 1, 0.827451, 1,
-0.05038038, -0.2728746, -1.114658, 0, 1, 0.8313726, 1,
-0.04785173, 0.05361367, 0.4066711, 0, 1, 0.8392157, 1,
-0.04552762, -0.3288144, -2.450847, 0, 1, 0.8431373, 1,
-0.0409439, -0.4083553, -3.137586, 0, 1, 0.8509804, 1,
-0.04065646, -1.393399, -3.889437, 0, 1, 0.854902, 1,
-0.03790268, 0.2513039, 0.1989536, 0, 1, 0.8627451, 1,
-0.03267894, 1.452566, -1.340784, 0, 1, 0.8666667, 1,
-0.02968851, 0.437982, 0.2364869, 0, 1, 0.8745098, 1,
-0.02576515, 0.7589016, 0.6782863, 0, 1, 0.8784314, 1,
-0.02554744, 0.4079259, 0.4918134, 0, 1, 0.8862745, 1,
-0.02441821, -2.960894, -2.741676, 0, 1, 0.8901961, 1,
-0.01904474, 0.1280504, 0.03637069, 0, 1, 0.8980392, 1,
-0.01840352, 2.143445, -0.03485166, 0, 1, 0.9058824, 1,
-0.0104468, 0.5478474, 1.816099, 0, 1, 0.9098039, 1,
-0.01007622, 0.8806243, 1.158581, 0, 1, 0.9176471, 1,
-0.008682425, 0.4722383, 0.20577, 0, 1, 0.9215686, 1,
-0.005552152, 0.2702951, 0.281718, 0, 1, 0.9294118, 1,
-0.004577025, -2.337722, -3.601916, 0, 1, 0.9333333, 1,
-0.003857987, -0.4567593, -4.133243, 0, 1, 0.9411765, 1,
-0.003561052, -0.2788283, -4.053615, 0, 1, 0.945098, 1,
-0.0005851088, 0.7564855, 1.286391, 0, 1, 0.9529412, 1,
0.0006130069, 0.05645231, 1.419099, 0, 1, 0.9568627, 1,
0.001430203, 0.08441792, -2.516023, 0, 1, 0.9647059, 1,
0.004401054, 1.163018, -1.025371, 0, 1, 0.9686275, 1,
0.004790945, -1.062744, 2.011941, 0, 1, 0.9764706, 1,
0.005789223, -0.6993333, 2.838753, 0, 1, 0.9803922, 1,
0.005916606, -0.2199258, 1.193976, 0, 1, 0.9882353, 1,
0.007683657, 0.4191326, -0.741926, 0, 1, 0.9921569, 1,
0.007715136, 1.267254, -0.2790825, 0, 1, 1, 1,
0.009475806, 1.093166, -0.5783666, 0, 0.9921569, 1, 1,
0.01112546, 0.2771759, -1.313515, 0, 0.9882353, 1, 1,
0.01199285, -0.8997704, 1.578017, 0, 0.9803922, 1, 1,
0.01379875, 0.7140568, -0.3873245, 0, 0.9764706, 1, 1,
0.01851046, -0.5959098, 3.271337, 0, 0.9686275, 1, 1,
0.02066019, 0.8088872, -2.410711, 0, 0.9647059, 1, 1,
0.02353477, -0.3969794, 4.026589, 0, 0.9568627, 1, 1,
0.02975986, 0.910015, -1.835369, 0, 0.9529412, 1, 1,
0.03077559, 2.265081, 0.1085735, 0, 0.945098, 1, 1,
0.03298116, -0.2399841, 2.207352, 0, 0.9411765, 1, 1,
0.03343805, -0.2413206, 2.645011, 0, 0.9333333, 1, 1,
0.03550664, -0.5708182, 2.319554, 0, 0.9294118, 1, 1,
0.04404661, -0.1132873, 1.813631, 0, 0.9215686, 1, 1,
0.04642167, -0.357258, 3.737072, 0, 0.9176471, 1, 1,
0.05401772, 1.153857, 0.1911188, 0, 0.9098039, 1, 1,
0.05589499, -0.6114018, 2.439199, 0, 0.9058824, 1, 1,
0.06538336, -0.8085505, 4.696753, 0, 0.8980392, 1, 1,
0.06643561, 1.05958, -2.499051, 0, 0.8901961, 1, 1,
0.06919515, -0.2303638, 4.918902, 0, 0.8862745, 1, 1,
0.07000811, -0.3761665, 3.671963, 0, 0.8784314, 1, 1,
0.07750294, 0.4717346, -0.6127985, 0, 0.8745098, 1, 1,
0.0816006, 0.1692672, 1.451385, 0, 0.8666667, 1, 1,
0.08185311, 0.1982893, -0.9230992, 0, 0.8627451, 1, 1,
0.08384737, 1.307331, 0.632484, 0, 0.854902, 1, 1,
0.08478594, -0.9538611, 2.377191, 0, 0.8509804, 1, 1,
0.08478995, 1.446128, -0.8383375, 0, 0.8431373, 1, 1,
0.08626063, 1.507648, 0.6510675, 0, 0.8392157, 1, 1,
0.08668034, 0.7659094, -0.1485329, 0, 0.8313726, 1, 1,
0.08735459, 0.8072146, -0.1265678, 0, 0.827451, 1, 1,
0.08747997, 1.161338, 0.5264739, 0, 0.8196079, 1, 1,
0.0890644, -0.7395102, 3.569508, 0, 0.8156863, 1, 1,
0.09279991, -0.4919984, 4.648698, 0, 0.8078431, 1, 1,
0.09426227, -0.2948132, 3.45126, 0, 0.8039216, 1, 1,
0.09579031, -1.660758, 3.312767, 0, 0.7960784, 1, 1,
0.1082781, -1.011218, 2.353357, 0, 0.7882353, 1, 1,
0.1098705, 2.07974, 1.284423, 0, 0.7843137, 1, 1,
0.1101729, -0.09785376, 2.2471, 0, 0.7764706, 1, 1,
0.1111594, -0.3800344, 2.847618, 0, 0.772549, 1, 1,
0.1168116, -0.2245524, 1.730511, 0, 0.7647059, 1, 1,
0.1231905, 0.927249, 0.6351742, 0, 0.7607843, 1, 1,
0.1255216, -1.185318, 5.117434, 0, 0.7529412, 1, 1,
0.1263646, 1.532797, -1.641801, 0, 0.7490196, 1, 1,
0.1268844, -1.330401, 3.670894, 0, 0.7411765, 1, 1,
0.1278483, 0.3821556, 1.574833, 0, 0.7372549, 1, 1,
0.1300204, -1.147434, 2.279253, 0, 0.7294118, 1, 1,
0.1316916, 0.9190174, -0.2388266, 0, 0.7254902, 1, 1,
0.1337794, 0.8485599, -0.8755543, 0, 0.7176471, 1, 1,
0.1345896, -0.02410263, 2.51463, 0, 0.7137255, 1, 1,
0.1362461, -0.04471256, 2.589973, 0, 0.7058824, 1, 1,
0.1379174, -1.070256, 2.804173, 0, 0.6980392, 1, 1,
0.1382031, 1.591158, 1.414137, 0, 0.6941177, 1, 1,
0.1414639, 1.139888, -0.1216455, 0, 0.6862745, 1, 1,
0.1470178, -1.454476, 2.951244, 0, 0.682353, 1, 1,
0.1473786, 0.7976626, -0.712059, 0, 0.6745098, 1, 1,
0.1544655, -2.153508, 0.7523428, 0, 0.6705883, 1, 1,
0.1556998, 0.4718825, -0.5591184, 0, 0.6627451, 1, 1,
0.1570005, 0.8971791, 0.9691429, 0, 0.6588235, 1, 1,
0.1580891, 0.05084944, 0.6284656, 0, 0.6509804, 1, 1,
0.1662975, 0.7832037, 1.805208, 0, 0.6470588, 1, 1,
0.1670346, 1.925367, -0.8596976, 0, 0.6392157, 1, 1,
0.1683052, 0.2878205, -0.6968691, 0, 0.6352941, 1, 1,
0.1686974, -0.1250729, 2.180046, 0, 0.627451, 1, 1,
0.1726271, 0.1781463, -0.833732, 0, 0.6235294, 1, 1,
0.1738643, -0.4774593, 1.145617, 0, 0.6156863, 1, 1,
0.1775381, 0.2433774, -0.8139864, 0, 0.6117647, 1, 1,
0.1874662, 1.58617, -0.06519068, 0, 0.6039216, 1, 1,
0.1926875, -0.2096521, 1.470278, 0, 0.5960785, 1, 1,
0.1929242, 0.9716593, 0.2190277, 0, 0.5921569, 1, 1,
0.1934946, -1.020516, 2.303268, 0, 0.5843138, 1, 1,
0.1953658, -0.6881281, 3.306873, 0, 0.5803922, 1, 1,
0.1985294, 1.125623, -0.1055159, 0, 0.572549, 1, 1,
0.1988702, 0.6616436, 0.04927747, 0, 0.5686275, 1, 1,
0.1994053, 0.1642551, 1.313975, 0, 0.5607843, 1, 1,
0.2022545, 0.3060431, 0.6668662, 0, 0.5568628, 1, 1,
0.2031809, -2.100497, 2.850438, 0, 0.5490196, 1, 1,
0.2039665, -1.553439, 5.251908, 0, 0.5450981, 1, 1,
0.204538, 1.093488, -0.5528734, 0, 0.5372549, 1, 1,
0.2072899, 0.3628876, 0.2080961, 0, 0.5333334, 1, 1,
0.2086517, -1.764719, 1.597628, 0, 0.5254902, 1, 1,
0.2090121, 0.6536989, 0.1040996, 0, 0.5215687, 1, 1,
0.2096511, -0.5263993, 2.329758, 0, 0.5137255, 1, 1,
0.2137339, -0.7914407, 3.353392, 0, 0.509804, 1, 1,
0.2180675, 1.435507, -0.690743, 0, 0.5019608, 1, 1,
0.2182998, 0.1892617, 1.31099, 0, 0.4941176, 1, 1,
0.2194713, -1.277692, 1.901201, 0, 0.4901961, 1, 1,
0.2198833, -1.392728, 3.807941, 0, 0.4823529, 1, 1,
0.225637, 0.476683, -0.2443966, 0, 0.4784314, 1, 1,
0.2261753, 0.3561969, -2.492312, 0, 0.4705882, 1, 1,
0.2279475, 1.077536, 0.6690061, 0, 0.4666667, 1, 1,
0.2290687, 0.08561647, -0.3327118, 0, 0.4588235, 1, 1,
0.2315238, 0.2371277, 1.688714, 0, 0.454902, 1, 1,
0.2395525, -0.1650754, 2.170343, 0, 0.4470588, 1, 1,
0.239865, 0.4333768, -1.31763, 0, 0.4431373, 1, 1,
0.2401546, 0.9102079, 1.954324, 0, 0.4352941, 1, 1,
0.2413587, 1.735622, 0.1958489, 0, 0.4313726, 1, 1,
0.2414258, 0.3853284, 2.826498, 0, 0.4235294, 1, 1,
0.2420846, 1.515127, -0.7301559, 0, 0.4196078, 1, 1,
0.2442008, 2.06464, -1.348165, 0, 0.4117647, 1, 1,
0.2443685, -0.5083279, 3.044712, 0, 0.4078431, 1, 1,
0.2444143, -0.1473099, 2.882977, 0, 0.4, 1, 1,
0.2474882, -0.8241491, 2.58051, 0, 0.3921569, 1, 1,
0.2492039, -0.2614737, 2.366759, 0, 0.3882353, 1, 1,
0.2492508, -0.4747275, 0.8014185, 0, 0.3803922, 1, 1,
0.253442, -0.0536407, 2.136519, 0, 0.3764706, 1, 1,
0.2586831, 0.02000702, 2.113617, 0, 0.3686275, 1, 1,
0.2589777, -0.4704939, 4.574506, 0, 0.3647059, 1, 1,
0.2601263, 0.9480462, -0.1526446, 0, 0.3568628, 1, 1,
0.2606355, -0.1785428, 3.576023, 0, 0.3529412, 1, 1,
0.2610767, 1.187745, 2.211786, 0, 0.345098, 1, 1,
0.2621092, 1.071688, 1.385793, 0, 0.3411765, 1, 1,
0.2644684, -0.8419324, 2.596324, 0, 0.3333333, 1, 1,
0.2678226, -0.1406925, 1.602572, 0, 0.3294118, 1, 1,
0.2706724, -0.9574492, 2.193476, 0, 0.3215686, 1, 1,
0.2716382, -0.5346401, 2.209217, 0, 0.3176471, 1, 1,
0.2721032, 1.295376, 1.506215, 0, 0.3098039, 1, 1,
0.2765975, -1.679641, 3.322938, 0, 0.3058824, 1, 1,
0.2809159, 0.6388136, 0.7257529, 0, 0.2980392, 1, 1,
0.2819822, -0.8430299, 2.752701, 0, 0.2901961, 1, 1,
0.2833019, -0.6000809, 2.705428, 0, 0.2862745, 1, 1,
0.2851465, 0.5238559, 2.76556, 0, 0.2784314, 1, 1,
0.2855829, 1.137057, 1.836209, 0, 0.2745098, 1, 1,
0.2860345, 1.639673, -0.3775676, 0, 0.2666667, 1, 1,
0.2863127, 0.4835625, 3.037674, 0, 0.2627451, 1, 1,
0.2908024, -0.3784638, 2.267099, 0, 0.254902, 1, 1,
0.2921586, -1.138161, 3.700374, 0, 0.2509804, 1, 1,
0.3009691, -0.390481, 3.668771, 0, 0.2431373, 1, 1,
0.3021372, -1.897564, 5.161249, 0, 0.2392157, 1, 1,
0.3044222, -0.156356, 1.155954, 0, 0.2313726, 1, 1,
0.3051341, 0.09097842, 1.300223, 0, 0.227451, 1, 1,
0.312573, -1.973816, 2.507854, 0, 0.2196078, 1, 1,
0.3138874, -1.045057, 5.364476, 0, 0.2156863, 1, 1,
0.3162781, 0.8825578, 0.5763006, 0, 0.2078431, 1, 1,
0.3197558, 0.2873741, 1.634015, 0, 0.2039216, 1, 1,
0.3202513, -1.569596, 3.487796, 0, 0.1960784, 1, 1,
0.3217459, -0.295228, 3.035833, 0, 0.1882353, 1, 1,
0.3255256, 0.3819451, 0.8508185, 0, 0.1843137, 1, 1,
0.3306232, -1.172432, 3.655549, 0, 0.1764706, 1, 1,
0.3333219, -0.05618909, 1.366514, 0, 0.172549, 1, 1,
0.334406, -0.2611499, 2.35978, 0, 0.1647059, 1, 1,
0.3355578, 0.03476972, 0.05384798, 0, 0.1607843, 1, 1,
0.3356022, -2.145648, 4.651105, 0, 0.1529412, 1, 1,
0.3481185, 0.5058489, 1.600441, 0, 0.1490196, 1, 1,
0.3496678, 0.08012834, 1.527721, 0, 0.1411765, 1, 1,
0.3500921, 0.3665501, -0.4865318, 0, 0.1372549, 1, 1,
0.3542767, 0.1705435, 0.3811438, 0, 0.1294118, 1, 1,
0.3573399, 0.3711599, 1.191033, 0, 0.1254902, 1, 1,
0.3591998, -1.385564, 2.175403, 0, 0.1176471, 1, 1,
0.3620169, 1.249874, 0.1856864, 0, 0.1137255, 1, 1,
0.3624977, 1.036661, -0.01768517, 0, 0.1058824, 1, 1,
0.3628765, -1.302802, 2.157189, 0, 0.09803922, 1, 1,
0.3708229, 0.3451565, -0.3535804, 0, 0.09411765, 1, 1,
0.3740505, -0.2246562, 1.863339, 0, 0.08627451, 1, 1,
0.3764952, -0.8967661, 2.651927, 0, 0.08235294, 1, 1,
0.3831029, 0.5157736, -0.2310884, 0, 0.07450981, 1, 1,
0.3863236, -2.045546, 3.015203, 0, 0.07058824, 1, 1,
0.3870189, 0.2844547, 1.119789, 0, 0.0627451, 1, 1,
0.3915357, 0.3936269, 1.348023, 0, 0.05882353, 1, 1,
0.3965591, -0.1443593, 2.555775, 0, 0.05098039, 1, 1,
0.3983484, -0.07789533, 0.9942123, 0, 0.04705882, 1, 1,
0.3988769, -0.5982008, 1.525206, 0, 0.03921569, 1, 1,
0.3989337, 0.8481786, -0.5789996, 0, 0.03529412, 1, 1,
0.4008809, 2.077111, -0.03840164, 0, 0.02745098, 1, 1,
0.4040571, 1.174496, 1.844006, 0, 0.02352941, 1, 1,
0.4104844, 2.007025, -1.89732, 0, 0.01568628, 1, 1,
0.4122219, 0.6273177, 0.7456466, 0, 0.01176471, 1, 1,
0.4127671, -1.994152, 3.939042, 0, 0.003921569, 1, 1,
0.4143046, -0.3085246, 2.701425, 0.003921569, 0, 1, 1,
0.4163278, -2.273807, 4.763665, 0.007843138, 0, 1, 1,
0.4187675, 0.6118048, 0.4929622, 0.01568628, 0, 1, 1,
0.4201961, 0.4875704, 1.691521, 0.01960784, 0, 1, 1,
0.4233178, -0.08463152, 0.3673592, 0.02745098, 0, 1, 1,
0.430032, -0.5383658, 3.842054, 0.03137255, 0, 1, 1,
0.4335391, 1.068818, 0.8690945, 0.03921569, 0, 1, 1,
0.4365591, 2.357394, -1.985299, 0.04313726, 0, 1, 1,
0.4409271, -0.6493177, 3.413548, 0.05098039, 0, 1, 1,
0.4468923, 1.820866, -2.01462, 0.05490196, 0, 1, 1,
0.447228, -0.8768033, 1.454699, 0.0627451, 0, 1, 1,
0.4477929, 0.5877649, -0.7881916, 0.06666667, 0, 1, 1,
0.4480017, 0.2158581, 0.5541029, 0.07450981, 0, 1, 1,
0.4519127, -0.2560857, 4.918599, 0.07843138, 0, 1, 1,
0.4535722, 0.3118994, -0.4176427, 0.08627451, 0, 1, 1,
0.4554577, -0.5651422, 2.426256, 0.09019608, 0, 1, 1,
0.4635963, -1.497969, 3.692288, 0.09803922, 0, 1, 1,
0.4664502, 0.3666642, 1.198519, 0.1058824, 0, 1, 1,
0.4674228, 0.3465407, 1.589945, 0.1098039, 0, 1, 1,
0.4684169, 0.02045003, 0.7763408, 0.1176471, 0, 1, 1,
0.4715513, -1.245819, 0.9939657, 0.1215686, 0, 1, 1,
0.4745301, 1.395445, 0.4162806, 0.1294118, 0, 1, 1,
0.475654, 0.3498369, 0.1425601, 0.1333333, 0, 1, 1,
0.4765701, 0.4276, 1.34676, 0.1411765, 0, 1, 1,
0.4827785, -0.739881, 3.423773, 0.145098, 0, 1, 1,
0.4844688, 0.3246123, 0.5465928, 0.1529412, 0, 1, 1,
0.4878614, -1.113781, 3.214949, 0.1568628, 0, 1, 1,
0.4898467, -0.2980012, 2.770474, 0.1647059, 0, 1, 1,
0.4927138, -0.3480187, 0.9039516, 0.1686275, 0, 1, 1,
0.4944864, 0.391649, 0.2701063, 0.1764706, 0, 1, 1,
0.4981567, -1.59955, 2.960448, 0.1803922, 0, 1, 1,
0.5050235, 0.8230948, 1.174883, 0.1882353, 0, 1, 1,
0.5064781, 1.411584, -0.07509775, 0.1921569, 0, 1, 1,
0.5073252, 0.6598282, -1.451476, 0.2, 0, 1, 1,
0.5142859, 0.1501869, 1.596979, 0.2078431, 0, 1, 1,
0.5206116, -1.029697, 3.041004, 0.2117647, 0, 1, 1,
0.5233493, -0.2927927, 1.981154, 0.2196078, 0, 1, 1,
0.5243695, 0.2291071, 1.412365, 0.2235294, 0, 1, 1,
0.5281309, 0.5602085, 0.2577457, 0.2313726, 0, 1, 1,
0.5283191, 0.6573799, 2.11322, 0.2352941, 0, 1, 1,
0.537151, 0.9487706, 1.477501, 0.2431373, 0, 1, 1,
0.5592608, -0.5311853, 3.114905, 0.2470588, 0, 1, 1,
0.5608718, 0.2621039, 2.70911, 0.254902, 0, 1, 1,
0.5614749, 0.3987338, 1.878937, 0.2588235, 0, 1, 1,
0.5707431, -0.6237606, 2.691038, 0.2666667, 0, 1, 1,
0.5717558, 0.935958, 0.6823025, 0.2705882, 0, 1, 1,
0.5717595, -0.4366613, 2.724404, 0.2784314, 0, 1, 1,
0.5730436, -0.2414131, 1.783175, 0.282353, 0, 1, 1,
0.5748569, -0.4960328, 1.325224, 0.2901961, 0, 1, 1,
0.5794936, 0.5983558, 1.393953, 0.2941177, 0, 1, 1,
0.5809885, -0.2296011, 2.592938, 0.3019608, 0, 1, 1,
0.5822065, -2.028765, 2.945023, 0.3098039, 0, 1, 1,
0.5831088, -0.3592592, 2.578133, 0.3137255, 0, 1, 1,
0.5872114, 0.5640739, 0.8962281, 0.3215686, 0, 1, 1,
0.5879049, -0.1910257, 3.712943, 0.3254902, 0, 1, 1,
0.5919756, 1.163703, 1.170761, 0.3333333, 0, 1, 1,
0.5937362, 1.676049, -0.08333618, 0.3372549, 0, 1, 1,
0.5968068, -0.1288263, 0.2121339, 0.345098, 0, 1, 1,
0.5983043, -0.1877229, 1.122392, 0.3490196, 0, 1, 1,
0.6046963, 0.834064, -1.369429, 0.3568628, 0, 1, 1,
0.6087613, -1.229636, 2.26817, 0.3607843, 0, 1, 1,
0.6231418, 0.1282162, 1.656998, 0.3686275, 0, 1, 1,
0.6279331, -0.2878419, 2.202899, 0.372549, 0, 1, 1,
0.6316844, 0.1028283, -0.3607401, 0.3803922, 0, 1, 1,
0.6325212, 0.9564026, 0.2491789, 0.3843137, 0, 1, 1,
0.6336797, -0.5083234, 2.077026, 0.3921569, 0, 1, 1,
0.633905, 1.681601, 1.446375, 0.3960784, 0, 1, 1,
0.63476, 0.2218444, 2.849912, 0.4039216, 0, 1, 1,
0.6364275, -0.4254416, 1.44429, 0.4117647, 0, 1, 1,
0.6417858, 0.9306065, -0.1566884, 0.4156863, 0, 1, 1,
0.6514733, 0.3975188, 1.365029, 0.4235294, 0, 1, 1,
0.6611763, 0.2967267, 2.798414, 0.427451, 0, 1, 1,
0.6621931, -0.6608168, 2.691377, 0.4352941, 0, 1, 1,
0.6650367, -0.6047276, 3.902528, 0.4392157, 0, 1, 1,
0.6731449, -1.115246, 2.725625, 0.4470588, 0, 1, 1,
0.6766034, -0.9948927, 1.579066, 0.4509804, 0, 1, 1,
0.6847227, -0.4748249, 4.636256, 0.4588235, 0, 1, 1,
0.6867389, 0.02875084, 2.813007, 0.4627451, 0, 1, 1,
0.6902773, 1.2342, -0.8181224, 0.4705882, 0, 1, 1,
0.6945207, -0.2801573, 1.321765, 0.4745098, 0, 1, 1,
0.7003088, 0.3753532, 1.599772, 0.4823529, 0, 1, 1,
0.7012038, -0.956041, 2.8368, 0.4862745, 0, 1, 1,
0.7024102, 2.677089, 1.498609, 0.4941176, 0, 1, 1,
0.706121, 1.505243, -1.330942, 0.5019608, 0, 1, 1,
0.7123067, -0.01333839, 1.731067, 0.5058824, 0, 1, 1,
0.717984, 1.598872, -1.155282, 0.5137255, 0, 1, 1,
0.7193931, -1.651301, 3.019664, 0.5176471, 0, 1, 1,
0.7198564, -1.351431, 2.885953, 0.5254902, 0, 1, 1,
0.7205799, 0.302455, 0.2120699, 0.5294118, 0, 1, 1,
0.725974, -2.002075, 1.706411, 0.5372549, 0, 1, 1,
0.7263926, -2.452592, 4.041059, 0.5411765, 0, 1, 1,
0.7266055, 1.199381, 0.8900384, 0.5490196, 0, 1, 1,
0.7320707, -0.1473632, 1.491449, 0.5529412, 0, 1, 1,
0.7444102, -0.9919598, 0.8286963, 0.5607843, 0, 1, 1,
0.7453648, 1.260056, 0.6887874, 0.5647059, 0, 1, 1,
0.7501462, 0.04062648, 2.825878, 0.572549, 0, 1, 1,
0.752752, 0.2409592, 1.301253, 0.5764706, 0, 1, 1,
0.7531428, 0.6857777, 0.8679774, 0.5843138, 0, 1, 1,
0.7555445, -1.404213, 3.132215, 0.5882353, 0, 1, 1,
0.7585912, 0.9036897, 2.922169, 0.5960785, 0, 1, 1,
0.7610787, -0.8571646, 3.171009, 0.6039216, 0, 1, 1,
0.761694, 0.05269896, 0.9464262, 0.6078432, 0, 1, 1,
0.7685353, -1.171448, 2.289757, 0.6156863, 0, 1, 1,
0.7725549, 0.2733673, 1.867332, 0.6196079, 0, 1, 1,
0.7734426, -0.09749026, 1.591033, 0.627451, 0, 1, 1,
0.7743614, -1.486854, 1.907488, 0.6313726, 0, 1, 1,
0.7842381, -2.626637, 4.578177, 0.6392157, 0, 1, 1,
0.7856099, -0.5165316, 2.439934, 0.6431373, 0, 1, 1,
0.7877889, 0.7218054, 0.8779604, 0.6509804, 0, 1, 1,
0.7899614, -0.4391888, 3.722689, 0.654902, 0, 1, 1,
0.794175, 1.810272, 2.182415, 0.6627451, 0, 1, 1,
0.7953482, 1.67442, 1.57512, 0.6666667, 0, 1, 1,
0.7978286, -0.4973784, 0.3932336, 0.6745098, 0, 1, 1,
0.7999498, -0.09070791, 1.357624, 0.6784314, 0, 1, 1,
0.8023463, -0.8482623, 0.2258375, 0.6862745, 0, 1, 1,
0.8041959, -0.2046603, 2.194647, 0.6901961, 0, 1, 1,
0.8070903, -0.6831517, 2.626151, 0.6980392, 0, 1, 1,
0.8114324, -0.8701691, 1.58206, 0.7058824, 0, 1, 1,
0.8128231, 0.95348, 2.211012, 0.7098039, 0, 1, 1,
0.8141964, 0.5366636, -1.357037, 0.7176471, 0, 1, 1,
0.8221733, 2.453675, 0.3944038, 0.7215686, 0, 1, 1,
0.8242132, -0.1609769, 1.199656, 0.7294118, 0, 1, 1,
0.8264207, 0.05530068, 1.902706, 0.7333333, 0, 1, 1,
0.8319822, 1.646146, -0.7453402, 0.7411765, 0, 1, 1,
0.835381, -0.6186329, 0.2574132, 0.7450981, 0, 1, 1,
0.83626, 1.400249, 0.1134307, 0.7529412, 0, 1, 1,
0.8384781, 0.3629433, 2.354261, 0.7568628, 0, 1, 1,
0.8390407, -0.3411618, 2.210754, 0.7647059, 0, 1, 1,
0.839225, -1.394293, 5.166705, 0.7686275, 0, 1, 1,
0.8393631, -0.02869761, -0.1028376, 0.7764706, 0, 1, 1,
0.8467357, 1.398083, -0.02203953, 0.7803922, 0, 1, 1,
0.8476244, -0.5271687, 1.123351, 0.7882353, 0, 1, 1,
0.8484043, 0.383317, -0.527786, 0.7921569, 0, 1, 1,
0.8571615, 0.2029662, 1.544725, 0.8, 0, 1, 1,
0.871906, -1.951131, 1.829798, 0.8078431, 0, 1, 1,
0.8853037, -0.006448907, 1.78932, 0.8117647, 0, 1, 1,
0.8954329, -1.126648, 1.824876, 0.8196079, 0, 1, 1,
0.8968897, -1.795677, 4.246776, 0.8235294, 0, 1, 1,
0.8981514, 1.254603, -0.6212917, 0.8313726, 0, 1, 1,
0.9015446, 0.8838366, 1.498255, 0.8352941, 0, 1, 1,
0.9028016, 0.5721595, 0.2285413, 0.8431373, 0, 1, 1,
0.9039271, 0.8718393, 1.274005, 0.8470588, 0, 1, 1,
0.915373, -0.1007591, 1.948642, 0.854902, 0, 1, 1,
0.9158543, -0.2582966, 1.002066, 0.8588235, 0, 1, 1,
0.9166966, 0.4778448, 0.7952566, 0.8666667, 0, 1, 1,
0.921235, -1.543984, 3.153118, 0.8705882, 0, 1, 1,
0.921534, -0.8534731, 2.12723, 0.8784314, 0, 1, 1,
0.923454, 1.943635, -0.6169545, 0.8823529, 0, 1, 1,
0.9281374, -1.498662, 3.71473, 0.8901961, 0, 1, 1,
0.9298753, -1.247329, 3.245479, 0.8941177, 0, 1, 1,
0.9337148, -1.170549, 2.838846, 0.9019608, 0, 1, 1,
0.9344642, -0.9140405, 3.439617, 0.9098039, 0, 1, 1,
0.9414476, -1.748187, 3.365979, 0.9137255, 0, 1, 1,
0.9484165, 0.1072519, 0.5475417, 0.9215686, 0, 1, 1,
0.9513392, 0.9349852, -0.7769821, 0.9254902, 0, 1, 1,
0.9575284, -0.4936929, 2.67391, 0.9333333, 0, 1, 1,
0.9598274, 0.9343467, 0.241889, 0.9372549, 0, 1, 1,
0.9610322, 2.183914, -1.314519, 0.945098, 0, 1, 1,
0.970742, -1.553393, 2.850628, 0.9490196, 0, 1, 1,
0.9812757, -0.5298036, 1.884371, 0.9568627, 0, 1, 1,
0.9827819, 0.3616109, 0.9789637, 0.9607843, 0, 1, 1,
0.9855872, 0.8475667, 0.1066485, 0.9686275, 0, 1, 1,
0.9863717, 0.2962315, 1.04394, 0.972549, 0, 1, 1,
0.9892246, 1.27713, 1.015703, 0.9803922, 0, 1, 1,
0.9936187, 1.643357, -0.5457209, 0.9843137, 0, 1, 1,
0.9974623, -0.6273782, 1.289337, 0.9921569, 0, 1, 1,
0.9991856, 0.5623384, 0.1419442, 0.9960784, 0, 1, 1,
0.9993943, -0.3287989, 2.463728, 1, 0, 0.9960784, 1,
0.9998933, 0.02033456, -0.1006403, 1, 0, 0.9882353, 1,
1.00406, 1.296173, 0.6382276, 1, 0, 0.9843137, 1,
1.00623, -0.4283778, 1.693608, 1, 0, 0.9764706, 1,
1.010993, 1.224123, 1.200718, 1, 0, 0.972549, 1,
1.012887, 2.157128, -0.8139593, 1, 0, 0.9647059, 1,
1.025331, -0.09814535, 1.018585, 1, 0, 0.9607843, 1,
1.037091, 0.04098358, 0.6527761, 1, 0, 0.9529412, 1,
1.039361, 0.1818666, 2.141727, 1, 0, 0.9490196, 1,
1.040186, 1.203086, 1.844104, 1, 0, 0.9411765, 1,
1.041579, -0.4916563, 1.699121, 1, 0, 0.9372549, 1,
1.043013, 0.09967863, 0.8935627, 1, 0, 0.9294118, 1,
1.043821, 0.2155311, 1.443515, 1, 0, 0.9254902, 1,
1.045833, -0.3597035, 2.54051, 1, 0, 0.9176471, 1,
1.046892, -1.163723, 2.748531, 1, 0, 0.9137255, 1,
1.05026, 0.3269527, 0.5940328, 1, 0, 0.9058824, 1,
1.051184, -0.4078824, 2.80582, 1, 0, 0.9019608, 1,
1.057449, -0.01217232, 1.810258, 1, 0, 0.8941177, 1,
1.070578, -0.2916988, 2.848346, 1, 0, 0.8862745, 1,
1.072937, 0.7988107, 1.897069, 1, 0, 0.8823529, 1,
1.078393, 0.6032389, 0.2013163, 1, 0, 0.8745098, 1,
1.083454, 2.071771, 0.8758668, 1, 0, 0.8705882, 1,
1.085259, -1.760186, 4.377074, 1, 0, 0.8627451, 1,
1.091947, -0.4077248, -0.2904042, 1, 0, 0.8588235, 1,
1.102919, -1.077333, 1.025858, 1, 0, 0.8509804, 1,
1.103651, -0.7674981, 1.992025, 1, 0, 0.8470588, 1,
1.107441, 0.1678831, 2.504053, 1, 0, 0.8392157, 1,
1.113832, 0.5969892, 1.147069, 1, 0, 0.8352941, 1,
1.11682, -0.1611648, 1.196172, 1, 0, 0.827451, 1,
1.117649, -1.360979, 1.289173, 1, 0, 0.8235294, 1,
1.146085, -0.4527832, 1.682426, 1, 0, 0.8156863, 1,
1.146337, -0.9999745, 2.057786, 1, 0, 0.8117647, 1,
1.146922, -1.421031, 0.8489968, 1, 0, 0.8039216, 1,
1.150774, -1.108485, 0.1287213, 1, 0, 0.7960784, 1,
1.151072, -0.4132125, 0.592842, 1, 0, 0.7921569, 1,
1.15489, -0.7513221, 2.207518, 1, 0, 0.7843137, 1,
1.154901, -0.03090288, 1.717483, 1, 0, 0.7803922, 1,
1.155372, 0.2840995, 2.299127, 1, 0, 0.772549, 1,
1.165265, -0.1045399, 2.776179, 1, 0, 0.7686275, 1,
1.177619, -1.350653, 2.748103, 1, 0, 0.7607843, 1,
1.189861, -0.2041475, 0.2830223, 1, 0, 0.7568628, 1,
1.190053, 0.6075044, -0.5518229, 1, 0, 0.7490196, 1,
1.198131, -0.3559989, 1.762582, 1, 0, 0.7450981, 1,
1.204619, -1.512027, 3.822941, 1, 0, 0.7372549, 1,
1.223601, -0.6695567, 0.684514, 1, 0, 0.7333333, 1,
1.228696, 0.9371917, -0.1690689, 1, 0, 0.7254902, 1,
1.231269, 0.7493995, 0.8060805, 1, 0, 0.7215686, 1,
1.233166, 1.059815, 0.8095569, 1, 0, 0.7137255, 1,
1.234391, -0.2172147, 0.165658, 1, 0, 0.7098039, 1,
1.235981, 0.8604938, 1.311751, 1, 0, 0.7019608, 1,
1.242807, -0.3944155, 0.6066728, 1, 0, 0.6941177, 1,
1.24488, 1.323935, 2.169105, 1, 0, 0.6901961, 1,
1.245279, -0.4389203, 1.381816, 1, 0, 0.682353, 1,
1.246119, -0.215548, 1.869629, 1, 0, 0.6784314, 1,
1.249819, 0.1570007, 1.051646, 1, 0, 0.6705883, 1,
1.256917, 0.5283581, 4.110871, 1, 0, 0.6666667, 1,
1.278091, 0.7546495, 0.7887535, 1, 0, 0.6588235, 1,
1.280623, -1.085457, 1.414569, 1, 0, 0.654902, 1,
1.281168, 0.2911324, 1.154412, 1, 0, 0.6470588, 1,
1.282246, -0.2381019, 4.466713, 1, 0, 0.6431373, 1,
1.28567, -1.300176, 3.37266, 1, 0, 0.6352941, 1,
1.299945, 0.9013005, 1.181415, 1, 0, 0.6313726, 1,
1.300922, 1.736634, -0.1487377, 1, 0, 0.6235294, 1,
1.305056, -0.146405, 1.014848, 1, 0, 0.6196079, 1,
1.316846, -0.6501906, 1.873701, 1, 0, 0.6117647, 1,
1.329128, -0.5536222, 2.216848, 1, 0, 0.6078432, 1,
1.331134, 1.858698, 0.2116292, 1, 0, 0.6, 1,
1.332188, 0.9431273, 1.688593, 1, 0, 0.5921569, 1,
1.334893, -0.08176068, -1.228772, 1, 0, 0.5882353, 1,
1.338312, 0.4850437, -0.4244587, 1, 0, 0.5803922, 1,
1.339483, -0.0104888, 0.3388031, 1, 0, 0.5764706, 1,
1.34567, 1.337276, 0.8926075, 1, 0, 0.5686275, 1,
1.348186, -0.2582867, 1.430331, 1, 0, 0.5647059, 1,
1.351501, 0.7061283, 2.769104, 1, 0, 0.5568628, 1,
1.354013, -0.2687304, 1.827802, 1, 0, 0.5529412, 1,
1.354243, -0.03279835, 1.668509, 1, 0, 0.5450981, 1,
1.358534, 1.316851, 1.633149, 1, 0, 0.5411765, 1,
1.36566, 1.236518, -0.9366235, 1, 0, 0.5333334, 1,
1.367813, -0.4576655, 0.8261061, 1, 0, 0.5294118, 1,
1.386255, 0.9367995, -0.2203994, 1, 0, 0.5215687, 1,
1.402154, -1.473046, 3.141605, 1, 0, 0.5176471, 1,
1.402235, 1.196188, 1.105948, 1, 0, 0.509804, 1,
1.431853, -2.317083, 1.556506, 1, 0, 0.5058824, 1,
1.431937, 0.3696432, 1.642142, 1, 0, 0.4980392, 1,
1.434405, -1.71975, 2.78303, 1, 0, 0.4901961, 1,
1.442762, -1.123156, 2.111955, 1, 0, 0.4862745, 1,
1.447306, -0.5698572, 1.528564, 1, 0, 0.4784314, 1,
1.453355, 0.9769515, 0.2517067, 1, 0, 0.4745098, 1,
1.457642, 0.8888398, 2.624433, 1, 0, 0.4666667, 1,
1.46714, -0.5681788, 1.516287, 1, 0, 0.4627451, 1,
1.472633, 0.4615204, 1.647059, 1, 0, 0.454902, 1,
1.475091, 0.2604973, 1.65329, 1, 0, 0.4509804, 1,
1.482591, -1.528894, 2.336459, 1, 0, 0.4431373, 1,
1.492074, -0.7746304, 2.374439, 1, 0, 0.4392157, 1,
1.493515, -0.8739783, 1.90861, 1, 0, 0.4313726, 1,
1.494751, -0.1260846, 2.102996, 1, 0, 0.427451, 1,
1.502833, -0.1060498, 0.8088836, 1, 0, 0.4196078, 1,
1.505153, 0.1263559, 0.9701352, 1, 0, 0.4156863, 1,
1.509697, 0.1282862, 0.8161502, 1, 0, 0.4078431, 1,
1.513784, 1.694936, 0.5743045, 1, 0, 0.4039216, 1,
1.521871, 1.485997, 1.162583, 1, 0, 0.3960784, 1,
1.530714, 1.511292, 0.2341065, 1, 0, 0.3882353, 1,
1.537337, 0.457006, -0.1322507, 1, 0, 0.3843137, 1,
1.546296, -0.1095244, 3.008084, 1, 0, 0.3764706, 1,
1.572059, -1.574429, 2.098301, 1, 0, 0.372549, 1,
1.574182, -1.106398, 1.87724, 1, 0, 0.3647059, 1,
1.577364, 1.262614, 1.629365, 1, 0, 0.3607843, 1,
1.59012, -0.06568117, 1.785986, 1, 0, 0.3529412, 1,
1.602892, 0.9309058, 0.08607987, 1, 0, 0.3490196, 1,
1.605598, 0.633518, 1.163666, 1, 0, 0.3411765, 1,
1.621097, -1.551014, 1.959942, 1, 0, 0.3372549, 1,
1.641767, 0.5889479, 1.800426, 1, 0, 0.3294118, 1,
1.648552, 0.1484842, 2.827472, 1, 0, 0.3254902, 1,
1.666604, -0.1523699, 2.653437, 1, 0, 0.3176471, 1,
1.668795, -0.4301377, 3.121228, 1, 0, 0.3137255, 1,
1.685935, -0.03086511, 1.198721, 1, 0, 0.3058824, 1,
1.693926, 1.836436, -0.3311701, 1, 0, 0.2980392, 1,
1.699642, 0.1242133, 1.949644, 1, 0, 0.2941177, 1,
1.702564, -0.1267909, 4.278913, 1, 0, 0.2862745, 1,
1.702906, -0.1883113, 1.314096, 1, 0, 0.282353, 1,
1.708194, -2.304962, 0.002295763, 1, 0, 0.2745098, 1,
1.735078, 1.204319, -0.7825705, 1, 0, 0.2705882, 1,
1.744435, 0.6908771, 0.03145766, 1, 0, 0.2627451, 1,
1.748567, 0.1153314, 2.558159, 1, 0, 0.2588235, 1,
1.759197, 0.8122757, 3.546731, 1, 0, 0.2509804, 1,
1.767789, -0.1290658, 1.303636, 1, 0, 0.2470588, 1,
1.792159, 1.089882, 0.3254102, 1, 0, 0.2392157, 1,
1.794492, -0.9082176, 1.955707, 1, 0, 0.2352941, 1,
1.808133, -0.1250452, 2.194035, 1, 0, 0.227451, 1,
1.808219, -0.9831659, 2.017355, 1, 0, 0.2235294, 1,
1.8099, 1.775557, 1.351747, 1, 0, 0.2156863, 1,
1.818002, 1.69757, -0.5826178, 1, 0, 0.2117647, 1,
1.821989, 1.505126, 0.2108886, 1, 0, 0.2039216, 1,
1.83726, -0.07602736, 1.248006, 1, 0, 0.1960784, 1,
1.848454, -1.836985, 1.484438, 1, 0, 0.1921569, 1,
1.85112, -0.2543435, 1.887876, 1, 0, 0.1843137, 1,
1.852012, -0.7091511, 1.594935, 1, 0, 0.1803922, 1,
1.887728, 0.7955922, 0.223711, 1, 0, 0.172549, 1,
1.958036, 0.6344199, 1.616003, 1, 0, 0.1686275, 1,
1.969732, 0.08884273, 1.942679, 1, 0, 0.1607843, 1,
1.985328, -0.28694, 2.285007, 1, 0, 0.1568628, 1,
1.986058, -1.32755, 0.6156546, 1, 0, 0.1490196, 1,
1.997819, -0.03500384, 1.655731, 1, 0, 0.145098, 1,
2.019702, -0.185717, 1.993325, 1, 0, 0.1372549, 1,
2.070891, -1.178016, 2.012465, 1, 0, 0.1333333, 1,
2.083971, 0.7905964, -0.1084175, 1, 0, 0.1254902, 1,
2.085248, -1.68254, 3.014315, 1, 0, 0.1215686, 1,
2.119238, 0.0369864, 2.082697, 1, 0, 0.1137255, 1,
2.137271, -1.038502, 2.291228, 1, 0, 0.1098039, 1,
2.153045, 0.4602331, 1.160746, 1, 0, 0.1019608, 1,
2.17235, 1.72392, 1.203131, 1, 0, 0.09411765, 1,
2.181067, -0.6034508, 0.6614463, 1, 0, 0.09019608, 1,
2.18582, 0.3509716, -0.2237554, 1, 0, 0.08235294, 1,
2.187416, -0.7600194, 3.128002, 1, 0, 0.07843138, 1,
2.191308, 1.044175, 1.817562, 1, 0, 0.07058824, 1,
2.213007, 0.794927, 3.027524, 1, 0, 0.06666667, 1,
2.278545, -0.906357, 3.083386, 1, 0, 0.05882353, 1,
2.295548, 0.8393341, 1.177644, 1, 0, 0.05490196, 1,
2.331359, 0.6391325, -0.1996418, 1, 0, 0.04705882, 1,
2.333507, 0.8971983, -1.897892, 1, 0, 0.04313726, 1,
2.441603, -0.4533373, 2.051374, 1, 0, 0.03529412, 1,
2.468691, -1.907318, 2.679132, 1, 0, 0.03137255, 1,
2.580176, 0.7650796, 0.1610454, 1, 0, 0.02352941, 1,
2.826197, -0.4326897, 2.70986, 1, 0, 0.01960784, 1,
3.078074, 0.5798808, 2.087636, 1, 0, 0.01176471, 1,
3.125218, 0.4475394, 0.7317163, 1, 0, 0.007843138, 1
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
-0.1712288, -3.917778, -6.804626, 0, -0.5, 0.5, 0.5,
-0.1712288, -3.917778, -6.804626, 1, -0.5, 0.5, 0.5,
-0.1712288, -3.917778, -6.804626, 1, 1.5, 0.5, 0.5,
-0.1712288, -3.917778, -6.804626, 0, 1.5, 0.5, 0.5
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
-4.585171, -0.138227, -6.804626, 0, -0.5, 0.5, 0.5,
-4.585171, -0.138227, -6.804626, 1, -0.5, 0.5, 0.5,
-4.585171, -0.138227, -6.804626, 1, 1.5, 0.5, 0.5,
-4.585171, -0.138227, -6.804626, 0, 1.5, 0.5, 0.5
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
-4.585171, -3.917778, 0.1617818, 0, -0.5, 0.5, 0.5,
-4.585171, -3.917778, 0.1617818, 1, -0.5, 0.5, 0.5,
-4.585171, -3.917778, 0.1617818, 1, 1.5, 0.5, 0.5,
-4.585171, -3.917778, 0.1617818, 0, 1.5, 0.5, 0.5
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
-3, -3.045574, -5.196993,
3, -3.045574, -5.196993,
-3, -3.045574, -5.196993,
-3, -3.190942, -5.464932,
-2, -3.045574, -5.196993,
-2, -3.190942, -5.464932,
-1, -3.045574, -5.196993,
-1, -3.190942, -5.464932,
0, -3.045574, -5.196993,
0, -3.190942, -5.464932,
1, -3.045574, -5.196993,
1, -3.190942, -5.464932,
2, -3.045574, -5.196993,
2, -3.190942, -5.464932,
3, -3.045574, -5.196993,
3, -3.190942, -5.464932
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
-3, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
-3, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
-3, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
-3, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
-2, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
-2, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
-2, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
-2, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
-1, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
-1, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
-1, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
-1, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
0, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
0, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
0, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
0, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
1, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
1, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
1, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
1, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
2, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
2, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
2, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
2, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5,
3, -3.481676, -6.00081, 0, -0.5, 0.5, 0.5,
3, -3.481676, -6.00081, 1, -0.5, 0.5, 0.5,
3, -3.481676, -6.00081, 1, 1.5, 0.5, 0.5,
3, -3.481676, -6.00081, 0, 1.5, 0.5, 0.5
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
-3.566569, -2, -5.196993,
-3.566569, 2, -5.196993,
-3.566569, -2, -5.196993,
-3.736336, -2, -5.464932,
-3.566569, -1, -5.196993,
-3.736336, -1, -5.464932,
-3.566569, 0, -5.196993,
-3.736336, 0, -5.464932,
-3.566569, 1, -5.196993,
-3.736336, 1, -5.464932,
-3.566569, 2, -5.196993,
-3.736336, 2, -5.464932
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
-4.07587, -2, -6.00081, 0, -0.5, 0.5, 0.5,
-4.07587, -2, -6.00081, 1, -0.5, 0.5, 0.5,
-4.07587, -2, -6.00081, 1, 1.5, 0.5, 0.5,
-4.07587, -2, -6.00081, 0, 1.5, 0.5, 0.5,
-4.07587, -1, -6.00081, 0, -0.5, 0.5, 0.5,
-4.07587, -1, -6.00081, 1, -0.5, 0.5, 0.5,
-4.07587, -1, -6.00081, 1, 1.5, 0.5, 0.5,
-4.07587, -1, -6.00081, 0, 1.5, 0.5, 0.5,
-4.07587, 0, -6.00081, 0, -0.5, 0.5, 0.5,
-4.07587, 0, -6.00081, 1, -0.5, 0.5, 0.5,
-4.07587, 0, -6.00081, 1, 1.5, 0.5, 0.5,
-4.07587, 0, -6.00081, 0, 1.5, 0.5, 0.5,
-4.07587, 1, -6.00081, 0, -0.5, 0.5, 0.5,
-4.07587, 1, -6.00081, 1, -0.5, 0.5, 0.5,
-4.07587, 1, -6.00081, 1, 1.5, 0.5, 0.5,
-4.07587, 1, -6.00081, 0, 1.5, 0.5, 0.5,
-4.07587, 2, -6.00081, 0, -0.5, 0.5, 0.5,
-4.07587, 2, -6.00081, 1, -0.5, 0.5, 0.5,
-4.07587, 2, -6.00081, 1, 1.5, 0.5, 0.5,
-4.07587, 2, -6.00081, 0, 1.5, 0.5, 0.5
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
-3.566569, -3.045574, -4,
-3.566569, -3.045574, 4,
-3.566569, -3.045574, -4,
-3.736336, -3.190942, -4,
-3.566569, -3.045574, -2,
-3.736336, -3.190942, -2,
-3.566569, -3.045574, 0,
-3.736336, -3.190942, 0,
-3.566569, -3.045574, 2,
-3.736336, -3.190942, 2,
-3.566569, -3.045574, 4,
-3.736336, -3.190942, 4
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
-4.07587, -3.481676, -4, 0, -0.5, 0.5, 0.5,
-4.07587, -3.481676, -4, 1, -0.5, 0.5, 0.5,
-4.07587, -3.481676, -4, 1, 1.5, 0.5, 0.5,
-4.07587, -3.481676, -4, 0, 1.5, 0.5, 0.5,
-4.07587, -3.481676, -2, 0, -0.5, 0.5, 0.5,
-4.07587, -3.481676, -2, 1, -0.5, 0.5, 0.5,
-4.07587, -3.481676, -2, 1, 1.5, 0.5, 0.5,
-4.07587, -3.481676, -2, 0, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 0, 0, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 0, 1, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 0, 1, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 0, 0, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 2, 0, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 2, 1, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 2, 1, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 2, 0, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 4, 0, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 4, 1, -0.5, 0.5, 0.5,
-4.07587, -3.481676, 4, 1, 1.5, 0.5, 0.5,
-4.07587, -3.481676, 4, 0, 1.5, 0.5, 0.5
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
-3.566569, -3.045574, -5.196993,
-3.566569, 2.76912, -5.196993,
-3.566569, -3.045574, 5.520557,
-3.566569, 2.76912, 5.520557,
-3.566569, -3.045574, -5.196993,
-3.566569, -3.045574, 5.520557,
-3.566569, 2.76912, -5.196993,
-3.566569, 2.76912, 5.520557,
-3.566569, -3.045574, -5.196993,
3.224111, -3.045574, -5.196993,
-3.566569, -3.045574, 5.520557,
3.224111, -3.045574, 5.520557,
-3.566569, 2.76912, -5.196993,
3.224111, 2.76912, -5.196993,
-3.566569, 2.76912, 5.520557,
3.224111, 2.76912, 5.520557,
3.224111, -3.045574, -5.196993,
3.224111, 2.76912, -5.196993,
3.224111, -3.045574, 5.520557,
3.224111, 2.76912, 5.520557,
3.224111, -3.045574, -5.196993,
3.224111, -3.045574, 5.520557,
3.224111, 2.76912, -5.196993,
3.224111, 2.76912, 5.520557
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
var radius = 7.452615;
var distance = 33.15752;
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
mvMatrix.translate( 0.1712288, 0.138227, -0.1617818 );
mvMatrix.scale( 1.186614, 1.385785, 0.7518428 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15752);
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
diclobutrazol<-read.table("diclobutrazol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diclobutrazol$V2
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
```

```r
y<-diclobutrazol$V3
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
```

```r
z<-diclobutrazol$V4
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
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
-3.467675, -0.3125867, -2.970298, 0, 0, 1, 1, 1,
-2.927559, -0.5401741, -1.312621, 1, 0, 0, 1, 1,
-2.718733, -0.7496338, -1.81524, 1, 0, 0, 1, 1,
-2.585057, -0.04133045, -0.8710991, 1, 0, 0, 1, 1,
-2.56131, -0.5571505, -1.002987, 1, 0, 0, 1, 1,
-2.507744, -1.283481, -2.858114, 1, 0, 0, 1, 1,
-2.498641, -0.3542762, 0.4424362, 0, 0, 0, 1, 1,
-2.493119, 0.09201948, -1.369047, 0, 0, 0, 1, 1,
-2.466367, -0.08851051, -1.735827, 0, 0, 0, 1, 1,
-2.406538, 1.989744, -0.6314758, 0, 0, 0, 1, 1,
-2.396693, -1.269863, -1.081473, 0, 0, 0, 1, 1,
-2.32541, -0.9132849, 0.1676967, 0, 0, 0, 1, 1,
-2.261415, 0.2897237, -1.26659, 0, 0, 0, 1, 1,
-2.220496, -1.434933, -2.482357, 1, 1, 1, 1, 1,
-2.13075, -2.397926, -2.393943, 1, 1, 1, 1, 1,
-2.094652, 1.30078, -1.331517, 1, 1, 1, 1, 1,
-2.053333, 0.1437716, -0.4958608, 1, 1, 1, 1, 1,
-2.039072, -0.4844253, -2.270681, 1, 1, 1, 1, 1,
-2.027954, 1.081105, -1.390147, 1, 1, 1, 1, 1,
-1.990657, 1.361172, 0.1829845, 1, 1, 1, 1, 1,
-1.988582, -0.1465329, -3.408495, 1, 1, 1, 1, 1,
-1.957155, -0.5207695, -1.747475, 1, 1, 1, 1, 1,
-1.89987, -1.335755, -1.895499, 1, 1, 1, 1, 1,
-1.869994, 0.5501665, -0.2978408, 1, 1, 1, 1, 1,
-1.861998, 0.5060728, -1.280276, 1, 1, 1, 1, 1,
-1.859269, 2.380522, 0.3521651, 1, 1, 1, 1, 1,
-1.837581, 2.217252, -0.4922291, 1, 1, 1, 1, 1,
-1.836448, 0.398656, 0.1129152, 1, 1, 1, 1, 1,
-1.829206, -1.576486, -3.574114, 0, 0, 1, 1, 1,
-1.824952, 1.246742, -0.3256972, 1, 0, 0, 1, 1,
-1.810321, 0.28221, -2.960303, 1, 0, 0, 1, 1,
-1.809209, 1.838448, -1.444906, 1, 0, 0, 1, 1,
-1.782921, 0.1908164, -2.403073, 1, 0, 0, 1, 1,
-1.780988, -0.4975349, -2.427098, 1, 0, 0, 1, 1,
-1.774166, -0.5283436, -1.523696, 0, 0, 0, 1, 1,
-1.738204, 1.197683, -1.001403, 0, 0, 0, 1, 1,
-1.735642, -0.9233188, -0.8692801, 0, 0, 0, 1, 1,
-1.711589, 0.2133706, -0.4448149, 0, 0, 0, 1, 1,
-1.705911, -0.09952102, -0.78714, 0, 0, 0, 1, 1,
-1.700945, 0.7985372, -1.376055, 0, 0, 0, 1, 1,
-1.697101, -0.08104271, -1.113861, 0, 0, 0, 1, 1,
-1.683597, -0.1507432, -3.09405, 1, 1, 1, 1, 1,
-1.663274, -0.4153575, -0.6771215, 1, 1, 1, 1, 1,
-1.657892, 1.324641, -1.109081, 1, 1, 1, 1, 1,
-1.65086, 0.284509, -1.556083, 1, 1, 1, 1, 1,
-1.64848, 0.9797251, -1.029567, 1, 1, 1, 1, 1,
-1.64161, 1.804189, -0.8498068, 1, 1, 1, 1, 1,
-1.639454, -0.1379509, -2.006047, 1, 1, 1, 1, 1,
-1.637073, -0.445429, -4.596824, 1, 1, 1, 1, 1,
-1.635003, -0.2807221, -0.9764538, 1, 1, 1, 1, 1,
-1.615162, 0.5250112, -1.224476, 1, 1, 1, 1, 1,
-1.598593, 0.410011, -2.547611, 1, 1, 1, 1, 1,
-1.594973, -0.548196, -2.381978, 1, 1, 1, 1, 1,
-1.546137, 0.06161103, -0.8108519, 1, 1, 1, 1, 1,
-1.527259, 1.620832, -1.382596, 1, 1, 1, 1, 1,
-1.525352, 1.180958, -0.8020117, 1, 1, 1, 1, 1,
-1.524044, -0.1242295, -0.132953, 0, 0, 1, 1, 1,
-1.51385, -0.8268653, -2.427321, 1, 0, 0, 1, 1,
-1.511659, -0.3623819, -1.352585, 1, 0, 0, 1, 1,
-1.508503, 2.504986, -2.90453, 1, 0, 0, 1, 1,
-1.501732, -0.7083279, -0.271655, 1, 0, 0, 1, 1,
-1.490455, -0.5815881, -2.551842, 1, 0, 0, 1, 1,
-1.475766, 0.7597597, -0.8567185, 0, 0, 0, 1, 1,
-1.458493, 0.01178297, -1.250833, 0, 0, 0, 1, 1,
-1.457563, -0.5465789, -2.907064, 0, 0, 0, 1, 1,
-1.451914, -1.325362, -0.7521895, 0, 0, 0, 1, 1,
-1.445664, 1.542117, -0.19987, 0, 0, 0, 1, 1,
-1.44398, -0.1064481, -2.116106, 0, 0, 0, 1, 1,
-1.438543, 0.6895852, -1.338413, 0, 0, 0, 1, 1,
-1.438499, 1.318905, -1.012455, 1, 1, 1, 1, 1,
-1.429816, 0.1112054, -2.285417, 1, 1, 1, 1, 1,
-1.424511, -0.01528366, 0.7678202, 1, 1, 1, 1, 1,
-1.41323, -0.1442354, -1.906306, 1, 1, 1, 1, 1,
-1.391418, -0.1756325, -1.580481, 1, 1, 1, 1, 1,
-1.384469, -0.1111447, -1.145961, 1, 1, 1, 1, 1,
-1.377548, 0.5003052, -1.004014, 1, 1, 1, 1, 1,
-1.375178, -1.786533, -0.5363882, 1, 1, 1, 1, 1,
-1.366699, 0.2507031, -1.398592, 1, 1, 1, 1, 1,
-1.356701, 0.09976814, -2.245913, 1, 1, 1, 1, 1,
-1.346156, -0.4407059, -1.571122, 1, 1, 1, 1, 1,
-1.345857, -0.3929975, -1.847071, 1, 1, 1, 1, 1,
-1.33294, 0.03079697, -3.5091, 1, 1, 1, 1, 1,
-1.308961, 0.0454574, -0.7891948, 1, 1, 1, 1, 1,
-1.284966, 0.7248967, -0.5915465, 1, 1, 1, 1, 1,
-1.271142, 1.069122, -0.03682687, 0, 0, 1, 1, 1,
-1.266333, -0.1154608, 0.01603752, 1, 0, 0, 1, 1,
-1.264886, -0.5510172, -1.766982, 1, 0, 0, 1, 1,
-1.256922, 1.583198, 0.2869289, 1, 0, 0, 1, 1,
-1.248267, 0.2745269, 0.2019806, 1, 0, 0, 1, 1,
-1.247688, -1.2607, -2.073027, 1, 0, 0, 1, 1,
-1.247313, -0.2933507, -0.6787723, 0, 0, 0, 1, 1,
-1.243893, 1.502863, -0.8982899, 0, 0, 0, 1, 1,
-1.242974, -0.2626099, -3.383325, 0, 0, 0, 1, 1,
-1.235067, -0.6504884, -1.134093, 0, 0, 0, 1, 1,
-1.230486, -0.1072007, -1.896835, 0, 0, 0, 1, 1,
-1.227795, -0.1904422, -3.223311, 0, 0, 0, 1, 1,
-1.223118, -0.703466, -2.379615, 0, 0, 0, 1, 1,
-1.220887, 0.44659, -0.925982, 1, 1, 1, 1, 1,
-1.208388, -1.562626, -2.865543, 1, 1, 1, 1, 1,
-1.204486, -0.1231412, -2.17621, 1, 1, 1, 1, 1,
-1.204243, -0.7357345, -1.067842, 1, 1, 1, 1, 1,
-1.203728, 0.8191993, -1.735421, 1, 1, 1, 1, 1,
-1.191546, -0.4496383, -2.490666, 1, 1, 1, 1, 1,
-1.189513, -1.057432, -1.662277, 1, 1, 1, 1, 1,
-1.1836, -1.025204, -3.60749, 1, 1, 1, 1, 1,
-1.181701, 0.9181486, 1.838381, 1, 1, 1, 1, 1,
-1.178315, 0.2250285, -1.769726, 1, 1, 1, 1, 1,
-1.173588, 0.5644533, -2.512279, 1, 1, 1, 1, 1,
-1.163519, -0.2673953, -3.727209, 1, 1, 1, 1, 1,
-1.160213, -0.4254176, -2.184604, 1, 1, 1, 1, 1,
-1.148334, -0.05623881, -0.4794279, 1, 1, 1, 1, 1,
-1.147412, -0.1690247, -2.50177, 1, 1, 1, 1, 1,
-1.140555, -1.123526, -1.53958, 0, 0, 1, 1, 1,
-1.129055, 1.022748, 0.3659368, 1, 0, 0, 1, 1,
-1.121192, -0.05830253, -2.972576, 1, 0, 0, 1, 1,
-1.114709, -0.7775849, -1.809961, 1, 0, 0, 1, 1,
-1.111698, -0.06337769, -1.507545, 1, 0, 0, 1, 1,
-1.101618, 0.6345829, -1.416903, 1, 0, 0, 1, 1,
-1.099821, 0.4441267, -0.1069209, 0, 0, 0, 1, 1,
-1.098131, -0.8399289, 0.1173048, 0, 0, 0, 1, 1,
-1.088871, 1.445738, -2.037228, 0, 0, 0, 1, 1,
-1.086445, 0.3382229, -0.7726287, 0, 0, 0, 1, 1,
-1.083388, 0.5516058, -1.629396, 0, 0, 0, 1, 1,
-1.081985, -0.271198, -1.890046, 0, 0, 0, 1, 1,
-1.078433, 1.726659, -1.292178, 0, 0, 0, 1, 1,
-1.072858, 0.4446923, -0.6730777, 1, 1, 1, 1, 1,
-1.072562, -1.307286, -2.012993, 1, 1, 1, 1, 1,
-1.062672, 1.16307, 0.5115012, 1, 1, 1, 1, 1,
-1.062461, 1.846079, -1.786901, 1, 1, 1, 1, 1,
-1.056074, -0.6409395, -1.399418, 1, 1, 1, 1, 1,
-1.053423, 0.9277867, -0.00718616, 1, 1, 1, 1, 1,
-1.044857, -0.5326979, -2.877031, 1, 1, 1, 1, 1,
-1.041587, -1.874015, -1.860253, 1, 1, 1, 1, 1,
-1.040908, 0.5424275, -2.924696, 1, 1, 1, 1, 1,
-1.039926, -0.4742361, -1.240631, 1, 1, 1, 1, 1,
-1.023031, 0.730967, -1.648852, 1, 1, 1, 1, 1,
-1.022842, -0.361542, -2.018226, 1, 1, 1, 1, 1,
-1.019601, 0.3677576, -1.683656, 1, 1, 1, 1, 1,
-1.013893, 0.574225, -2.211253, 1, 1, 1, 1, 1,
-1.005228, -0.4696534, -1.054248, 1, 1, 1, 1, 1,
-1.004696, -0.5170478, -2.540498, 0, 0, 1, 1, 1,
-0.9998378, -1.444256, -2.069426, 1, 0, 0, 1, 1,
-0.9954849, 0.02301716, -1.802152, 1, 0, 0, 1, 1,
-0.9859862, -1.023111, -3.526343, 1, 0, 0, 1, 1,
-0.9858108, 0.8219271, -1.417428, 1, 0, 0, 1, 1,
-0.9850177, -0.4889572, -1.896685, 1, 0, 0, 1, 1,
-0.9614227, 0.4482031, -0.8452623, 0, 0, 0, 1, 1,
-0.9568808, -1.146152, -0.0165184, 0, 0, 0, 1, 1,
-0.9517941, -0.1540173, -3.613034, 0, 0, 0, 1, 1,
-0.9495122, -1.224242, -1.061291, 0, 0, 0, 1, 1,
-0.9434615, 1.386928, -0.1149281, 0, 0, 0, 1, 1,
-0.9379125, -1.289236, -1.751699, 0, 0, 0, 1, 1,
-0.9338754, -0.2957104, -2.891638, 0, 0, 0, 1, 1,
-0.9328324, 1.235411, -2.793726, 1, 1, 1, 1, 1,
-0.9327729, 0.06184727, -1.593491, 1, 1, 1, 1, 1,
-0.9327093, -0.4590612, -1.099856, 1, 1, 1, 1, 1,
-0.9188823, -0.3354339, -2.667626, 1, 1, 1, 1, 1,
-0.9108387, 1.385218, -1.124401, 1, 1, 1, 1, 1,
-0.9103414, -0.7838417, -3.206809, 1, 1, 1, 1, 1,
-0.9080508, -0.3708057, 0.1397865, 1, 1, 1, 1, 1,
-0.8994432, 1.271651, 0.3034048, 1, 1, 1, 1, 1,
-0.8980647, -0.255181, -0.4709093, 1, 1, 1, 1, 1,
-0.8978462, -0.2034739, -2.63603, 1, 1, 1, 1, 1,
-0.8951336, -0.2166385, -1.328186, 1, 1, 1, 1, 1,
-0.8933412, -1.207777, -2.641173, 1, 1, 1, 1, 1,
-0.8929436, 0.6235065, -1.419515, 1, 1, 1, 1, 1,
-0.8898358, 0.9777815, -0.4691475, 1, 1, 1, 1, 1,
-0.888032, 1.002187, -0.5431662, 1, 1, 1, 1, 1,
-0.8873615, -1.842061, -2.544125, 0, 0, 1, 1, 1,
-0.8858061, -0.5359718, -2.382848, 1, 0, 0, 1, 1,
-0.8854265, 0.6510001, -0.5512098, 1, 0, 0, 1, 1,
-0.8839256, 0.2399977, 0.2846248, 1, 0, 0, 1, 1,
-0.8822218, -0.7144359, -2.012524, 1, 0, 0, 1, 1,
-0.8805128, -0.272138, -0.8557822, 1, 0, 0, 1, 1,
-0.8769807, -2.651938, -1.764419, 0, 0, 0, 1, 1,
-0.8759056, 0.7291207, -0.2835658, 0, 0, 0, 1, 1,
-0.873161, 1.414635, 0.3453755, 0, 0, 0, 1, 1,
-0.8702128, 0.01835882, -2.576116, 0, 0, 0, 1, 1,
-0.8670698, 1.332168, -1.204693, 0, 0, 0, 1, 1,
-0.8669149, -0.1229783, -2.047644, 0, 0, 0, 1, 1,
-0.8626529, 2.077005, 0.2361292, 0, 0, 0, 1, 1,
-0.8572664, -0.4647389, -3.276806, 1, 1, 1, 1, 1,
-0.8517303, -0.4698095, -2.257373, 1, 1, 1, 1, 1,
-0.8432082, 0.09722692, -1.876887, 1, 1, 1, 1, 1,
-0.8419439, -0.04520258, -1.080312, 1, 1, 1, 1, 1,
-0.839658, -1.157015, -3.723288, 1, 1, 1, 1, 1,
-0.8259389, -1.169562, -1.968325, 1, 1, 1, 1, 1,
-0.8204265, 0.3888636, -1.193457, 1, 1, 1, 1, 1,
-0.8143018, 0.7681484, -2.31817, 1, 1, 1, 1, 1,
-0.804517, -0.8547226, -2.204607, 1, 1, 1, 1, 1,
-0.8022529, 0.0181657, -1.708511, 1, 1, 1, 1, 1,
-0.7965832, -1.001994, -2.216682, 1, 1, 1, 1, 1,
-0.789001, 1.716611, -1.167457, 1, 1, 1, 1, 1,
-0.786534, 0.6925721, -0.5161024, 1, 1, 1, 1, 1,
-0.7766687, -1.330927, -1.663697, 1, 1, 1, 1, 1,
-0.7760379, -0.4849617, -3.295871, 1, 1, 1, 1, 1,
-0.7711384, 0.6294641, 0.2469697, 0, 0, 1, 1, 1,
-0.7670888, -0.4801893, -3.147982, 1, 0, 0, 1, 1,
-0.7622303, 0.2639152, -0.1804394, 1, 0, 0, 1, 1,
-0.7572744, -0.9621247, -2.891309, 1, 0, 0, 1, 1,
-0.7561013, 0.09439197, -0.5265675, 1, 0, 0, 1, 1,
-0.7511068, -1.48356, -0.7921691, 1, 0, 0, 1, 1,
-0.7470363, -1.772631, -1.206557, 0, 0, 0, 1, 1,
-0.7434844, -1.680272, -1.985494, 0, 0, 0, 1, 1,
-0.7430446, 0.7621875, -0.9009274, 0, 0, 0, 1, 1,
-0.7426741, -0.2828344, -2.034304, 0, 0, 0, 1, 1,
-0.736191, 0.3570812, -1.23614, 0, 0, 0, 1, 1,
-0.7334511, -0.3072526, -1.913168, 0, 0, 0, 1, 1,
-0.7312599, 0.455697, -0.953072, 0, 0, 0, 1, 1,
-0.7302616, -0.5227438, -0.8851086, 1, 1, 1, 1, 1,
-0.7275587, 0.1652173, 0.1651754, 1, 1, 1, 1, 1,
-0.7263094, -0.6449121, -4.698243, 1, 1, 1, 1, 1,
-0.7227655, 2.051215, -0.2092768, 1, 1, 1, 1, 1,
-0.7204439, 0.7484961, -3.391554, 1, 1, 1, 1, 1,
-0.7189064, 1.767365, 2.270132, 1, 1, 1, 1, 1,
-0.7153737, 0.5560967, -1.199077, 1, 1, 1, 1, 1,
-0.7145684, 1.704408, 0.6495833, 1, 1, 1, 1, 1,
-0.7113625, 0.03920396, -1.783244, 1, 1, 1, 1, 1,
-0.7023673, 1.527882, -0.7389863, 1, 1, 1, 1, 1,
-0.7017481, 0.4787129, -2.595386, 1, 1, 1, 1, 1,
-0.6991249, 0.9733537, -0.3151382, 1, 1, 1, 1, 1,
-0.6972402, 0.2507098, -0.9531772, 1, 1, 1, 1, 1,
-0.6938303, 0.7304407, 0.7769575, 1, 1, 1, 1, 1,
-0.6900894, -2.424455, -2.549465, 1, 1, 1, 1, 1,
-0.6877449, -1.010219, -2.239266, 0, 0, 1, 1, 1,
-0.6819075, -0.5668558, -3.18825, 1, 0, 0, 1, 1,
-0.6769231, -0.2135026, -1.975404, 1, 0, 0, 1, 1,
-0.6747499, -0.4295648, -2.307135, 1, 0, 0, 1, 1,
-0.6744691, -0.6475363, -1.433966, 1, 0, 0, 1, 1,
-0.671864, 0.7841104, -0.7420291, 1, 0, 0, 1, 1,
-0.66523, -0.0239448, -0.2529636, 0, 0, 0, 1, 1,
-0.6618312, -0.6526257, -2.074231, 0, 0, 0, 1, 1,
-0.6541233, 2.097739, -1.031477, 0, 0, 0, 1, 1,
-0.6497324, 0.01676143, -1.740392, 0, 0, 0, 1, 1,
-0.6437839, 1.101382, 0.798719, 0, 0, 0, 1, 1,
-0.6435778, -0.5655658, -2.362895, 0, 0, 0, 1, 1,
-0.6425927, 0.2357032, -1.568726, 0, 0, 0, 1, 1,
-0.6358915, -0.6754006, -3.099869, 1, 1, 1, 1, 1,
-0.6352018, -0.3536301, -1.884696, 1, 1, 1, 1, 1,
-0.6319878, -2.436721, -2.765959, 1, 1, 1, 1, 1,
-0.6301917, -1.498522, -3.478267, 1, 1, 1, 1, 1,
-0.6290992, 0.0006677377, -1.008596, 1, 1, 1, 1, 1,
-0.6260269, -0.8168387, -2.457498, 1, 1, 1, 1, 1,
-0.6225361, -1.689037, 0.4875607, 1, 1, 1, 1, 1,
-0.6163307, 0.8632648, -0.7735298, 1, 1, 1, 1, 1,
-0.6132664, -0.6279187, -2.557072, 1, 1, 1, 1, 1,
-0.6128452, 1.942803, -0.178487, 1, 1, 1, 1, 1,
-0.6119239, 0.3927167, -0.9100506, 1, 1, 1, 1, 1,
-0.6092095, 0.1368422, -1.583311, 1, 1, 1, 1, 1,
-0.6034538, -0.5212833, 0.7295444, 1, 1, 1, 1, 1,
-0.6020841, 1.020558, -0.5743034, 1, 1, 1, 1, 1,
-0.5925764, 1.002557, 0.2670143, 1, 1, 1, 1, 1,
-0.5836602, -0.443379, -2.415333, 0, 0, 1, 1, 1,
-0.5781766, 1.493695, -0.04494063, 1, 0, 0, 1, 1,
-0.5688634, 0.09624157, -1.319979, 1, 0, 0, 1, 1,
-0.5607539, 0.4104407, -0.08848102, 1, 0, 0, 1, 1,
-0.556801, -0.7336382, -2.921559, 1, 0, 0, 1, 1,
-0.5567428, -1.514081, -4.808321, 1, 0, 0, 1, 1,
-0.5565123, -0.4775599, -1.214125, 0, 0, 0, 1, 1,
-0.5537854, 1.236344, 0.7915837, 0, 0, 0, 1, 1,
-0.5499943, -1.311291, -2.449962, 0, 0, 0, 1, 1,
-0.5497825, 0.7966311, -1.556906, 0, 0, 0, 1, 1,
-0.5493899, -0.07598985, -2.599195, 0, 0, 0, 1, 1,
-0.5488868, 0.3053137, -1.909539, 0, 0, 0, 1, 1,
-0.5448439, 1.125579, -0.9605753, 0, 0, 0, 1, 1,
-0.5437754, -0.180064, -3.545037, 1, 1, 1, 1, 1,
-0.5436165, 0.6213993, -0.744865, 1, 1, 1, 1, 1,
-0.5412676, 1.170499, -0.6224036, 1, 1, 1, 1, 1,
-0.5401059, -1.027793, -2.451343, 1, 1, 1, 1, 1,
-0.5341297, -1.322248, -2.55719, 1, 1, 1, 1, 1,
-0.5303584, -1.838846, -2.829879, 1, 1, 1, 1, 1,
-0.5269517, -1.916393, -3.821245, 1, 1, 1, 1, 1,
-0.5239826, 0.7177788, -2.418377, 1, 1, 1, 1, 1,
-0.5236331, 0.6964185, -2.389565, 1, 1, 1, 1, 1,
-0.519462, -2.012399, -4.244309, 1, 1, 1, 1, 1,
-0.5162538, -0.4265841, -2.918368, 1, 1, 1, 1, 1,
-0.5160016, 0.5097553, -0.4648786, 1, 1, 1, 1, 1,
-0.5099101, -0.9369593, -2.842613, 1, 1, 1, 1, 1,
-0.5024661, 0.5517869, -1.906074, 1, 1, 1, 1, 1,
-0.501512, -0.3143711, -0.9879029, 1, 1, 1, 1, 1,
-0.491954, -0.409198, -2.994877, 0, 0, 1, 1, 1,
-0.4917708, 0.1437854, -1.575843, 1, 0, 0, 1, 1,
-0.4907472, -0.6262203, -3.381908, 1, 0, 0, 1, 1,
-0.4881063, -0.474196, -2.386842, 1, 0, 0, 1, 1,
-0.4846537, 0.06870557, -1.207362, 1, 0, 0, 1, 1,
-0.4839444, -2.070592, -1.776806, 1, 0, 0, 1, 1,
-0.4811505, -0.2667018, -3.187379, 0, 0, 0, 1, 1,
-0.4806035, 1.870142, -0.6821723, 0, 0, 0, 1, 1,
-0.469887, 0.7558133, 0.6618156, 0, 0, 0, 1, 1,
-0.4697049, -0.6148383, -2.128302, 0, 0, 0, 1, 1,
-0.4693853, 0.7042463, 0.5280687, 0, 0, 0, 1, 1,
-0.4693444, 0.01007881, -2.072366, 0, 0, 0, 1, 1,
-0.4690867, -0.3651478, -3.476845, 0, 0, 0, 1, 1,
-0.4683675, -0.01908164, -0.1817586, 1, 1, 1, 1, 1,
-0.4681964, -0.1495486, -1.594044, 1, 1, 1, 1, 1,
-0.4672944, -1.002293, -1.934963, 1, 1, 1, 1, 1,
-0.4662625, -1.978222, -1.718424, 1, 1, 1, 1, 1,
-0.4640806, 0.7031847, -0.3307807, 1, 1, 1, 1, 1,
-0.4622407, 1.881499, -1.619256, 1, 1, 1, 1, 1,
-0.4568139, -0.6413765, -3.805634, 1, 1, 1, 1, 1,
-0.4550551, -0.3053424, -3.94116, 1, 1, 1, 1, 1,
-0.4531487, -0.4392593, -1.165955, 1, 1, 1, 1, 1,
-0.442454, 1.204829, -0.7682526, 1, 1, 1, 1, 1,
-0.4418427, -1.059064, -3.405183, 1, 1, 1, 1, 1,
-0.4403688, -0.4819349, -1.466433, 1, 1, 1, 1, 1,
-0.4399659, 2.170797, -0.400397, 1, 1, 1, 1, 1,
-0.438928, 0.7778315, -0.3851937, 1, 1, 1, 1, 1,
-0.4381723, 0.5032066, 0.3554464, 1, 1, 1, 1, 1,
-0.4371001, 0.5477684, -0.5043133, 0, 0, 1, 1, 1,
-0.4370647, -0.7495932, -0.8931402, 1, 0, 0, 1, 1,
-0.4342676, -0.792046, -1.998762, 1, 0, 0, 1, 1,
-0.431866, 0.3218953, 0.7890711, 1, 0, 0, 1, 1,
-0.4304884, 1.435477, -0.2599131, 1, 0, 0, 1, 1,
-0.4302126, 0.0285537, -3.319822, 1, 0, 0, 1, 1,
-0.4285752, -0.7649053, -2.424797, 0, 0, 0, 1, 1,
-0.4279279, 0.7858238, -1.581622, 0, 0, 0, 1, 1,
-0.4243048, 1.431868, -0.8009951, 0, 0, 0, 1, 1,
-0.4237068, 0.1075428, -2.034497, 0, 0, 0, 1, 1,
-0.4208695, -0.4309604, -2.841828, 0, 0, 0, 1, 1,
-0.4186895, -0.02423707, -2.599376, 0, 0, 0, 1, 1,
-0.4179279, -0.211571, -1.4291, 0, 0, 0, 1, 1,
-0.4158995, 0.4577921, 0.1237054, 1, 1, 1, 1, 1,
-0.4158551, -0.1231167, -1.140725, 1, 1, 1, 1, 1,
-0.4127662, -0.437928, -1.815235, 1, 1, 1, 1, 1,
-0.4124545, 1.083253, -0.0815809, 1, 1, 1, 1, 1,
-0.40753, 0.7937538, -0.6005274, 1, 1, 1, 1, 1,
-0.406409, -0.1647334, -0.6360462, 1, 1, 1, 1, 1,
-0.4059907, -0.6247483, -1.791996, 1, 1, 1, 1, 1,
-0.4034985, -0.8698482, -3.365311, 1, 1, 1, 1, 1,
-0.4024149, 2.381611, -1.278661, 1, 1, 1, 1, 1,
-0.401921, -0.3332233, -3.108148, 1, 1, 1, 1, 1,
-0.4001522, -2.076191, -1.216997, 1, 1, 1, 1, 1,
-0.4000532, -0.7345232, -1.680091, 1, 1, 1, 1, 1,
-0.3996125, -1.095828, -2.229415, 1, 1, 1, 1, 1,
-0.3981677, 0.6644484, -0.8918653, 1, 1, 1, 1, 1,
-0.3976716, -2.643906, -3.004207, 1, 1, 1, 1, 1,
-0.3963557, -0.006262107, -1.163459, 0, 0, 1, 1, 1,
-0.3944525, -1.60206, -0.926577, 1, 0, 0, 1, 1,
-0.3838916, -0.4500362, -1.881763, 1, 0, 0, 1, 1,
-0.3825133, -1.122334, -3.63451, 1, 0, 0, 1, 1,
-0.3813837, -0.1454106, -1.905621, 1, 0, 0, 1, 1,
-0.3813463, -1.687905, -2.241143, 1, 0, 0, 1, 1,
-0.3811504, 0.202604, -0.08951889, 0, 0, 0, 1, 1,
-0.3798293, -0.9328207, -2.370114, 0, 0, 0, 1, 1,
-0.3754896, 0.7701707, -0.4201792, 0, 0, 0, 1, 1,
-0.3747705, 0.1088873, -1.154253, 0, 0, 0, 1, 1,
-0.3727605, 0.5197824, 0.1955505, 0, 0, 0, 1, 1,
-0.3694051, -1.452409, -1.199453, 0, 0, 0, 1, 1,
-0.3678528, -0.4841985, -1.281273, 0, 0, 0, 1, 1,
-0.3661681, 2.023714, -0.7210093, 1, 1, 1, 1, 1,
-0.3646927, -1.149714, -3.266768, 1, 1, 1, 1, 1,
-0.3633821, 0.822357, 0.3517993, 1, 1, 1, 1, 1,
-0.3604956, 0.8156115, -0.5374384, 1, 1, 1, 1, 1,
-0.3601122, 0.1542288, -1.976831, 1, 1, 1, 1, 1,
-0.3563318, -1.07635, -2.782179, 1, 1, 1, 1, 1,
-0.3551751, -0.9692374, -2.050699, 1, 1, 1, 1, 1,
-0.3550268, 1.266828, -1.886801, 1, 1, 1, 1, 1,
-0.3547909, -1.141658, -1.135745, 1, 1, 1, 1, 1,
-0.3538657, -0.09793807, -2.328844, 1, 1, 1, 1, 1,
-0.3503199, -1.142538, -2.113937, 1, 1, 1, 1, 1,
-0.3470528, 0.4479043, -0.4582203, 1, 1, 1, 1, 1,
-0.3435611, -0.1753052, -1.959937, 1, 1, 1, 1, 1,
-0.3398589, 0.0837042, -2.480144, 1, 1, 1, 1, 1,
-0.3382881, 1.959309, 0.03622903, 1, 1, 1, 1, 1,
-0.3347265, 0.2386022, -1.966761, 0, 0, 1, 1, 1,
-0.3331186, 0.4333747, -0.05400842, 1, 0, 0, 1, 1,
-0.3286582, -0.6916082, -2.623851, 1, 0, 0, 1, 1,
-0.3236899, -1.162208, -1.829271, 1, 0, 0, 1, 1,
-0.3234119, -0.1886612, -3.033553, 1, 0, 0, 1, 1,
-0.3150868, 0.1296711, -2.971028, 1, 0, 0, 1, 1,
-0.3101929, -0.9686323, -2.602736, 0, 0, 0, 1, 1,
-0.3073107, 0.2722192, -0.1762941, 0, 0, 0, 1, 1,
-0.3061733, -0.9490677, -2.205909, 0, 0, 0, 1, 1,
-0.3036481, 0.3258579, -0.05517359, 0, 0, 0, 1, 1,
-0.303381, 0.7675632, -2.524089, 0, 0, 0, 1, 1,
-0.3033578, 1.041068, 0.6439366, 0, 0, 0, 1, 1,
-0.3016155, -0.6368822, -4.061166, 0, 0, 0, 1, 1,
-0.2929829, -1.094251, -4.377352, 1, 1, 1, 1, 1,
-0.2923997, -0.03537821, -1.387974, 1, 1, 1, 1, 1,
-0.2912544, -0.6077949, -3.339444, 1, 1, 1, 1, 1,
-0.2909878, 0.8510345, -0.2150013, 1, 1, 1, 1, 1,
-0.2839466, 1.323537, -0.2428902, 1, 1, 1, 1, 1,
-0.2833473, 1.410358, -0.009249012, 1, 1, 1, 1, 1,
-0.2832547, 1.492729, 0.6173103, 1, 1, 1, 1, 1,
-0.2830839, 0.589053, -1.150764, 1, 1, 1, 1, 1,
-0.2805828, 0.01086354, -3.192593, 1, 1, 1, 1, 1,
-0.2747239, -1.601413, -3.050326, 1, 1, 1, 1, 1,
-0.2746607, -0.8418697, -2.380204, 1, 1, 1, 1, 1,
-0.2732584, 0.1146406, -3.574269, 1, 1, 1, 1, 1,
-0.2707119, 1.283123, -0.6865783, 1, 1, 1, 1, 1,
-0.2677506, -0.07692696, -1.365342, 1, 1, 1, 1, 1,
-0.2673501, -1.159814, -3.085431, 1, 1, 1, 1, 1,
-0.2603247, 0.6823736, 0.8844155, 0, 0, 1, 1, 1,
-0.2589792, 0.4541314, -1.152473, 1, 0, 0, 1, 1,
-0.2569454, -0.2515164, -1.405748, 1, 0, 0, 1, 1,
-0.2561988, -0.6097162, -2.586107, 1, 0, 0, 1, 1,
-0.2522294, 2.12644, -1.003873, 1, 0, 0, 1, 1,
-0.2502989, 0.6775221, 0.03567888, 1, 0, 0, 1, 1,
-0.2478842, -0.7677642, -2.352762, 0, 0, 0, 1, 1,
-0.2429415, -0.2452138, -3.566316, 0, 0, 0, 1, 1,
-0.2413505, 1.625258, -0.8065755, 0, 0, 0, 1, 1,
-0.2388507, -0.5898632, -2.813053, 0, 0, 0, 1, 1,
-0.23857, 0.5487736, -0.3398368, 0, 0, 0, 1, 1,
-0.2357897, 1.884014, -0.07083014, 0, 0, 0, 1, 1,
-0.2352605, 1.073388, -0.2891351, 0, 0, 0, 1, 1,
-0.2314997, -0.1151792, -2.090596, 1, 1, 1, 1, 1,
-0.2292042, -0.2593044, -2.282619, 1, 1, 1, 1, 1,
-0.2274743, -0.8058109, -3.240013, 1, 1, 1, 1, 1,
-0.225494, 0.03477859, -2.802973, 1, 1, 1, 1, 1,
-0.2201585, 0.5229121, -0.4956881, 1, 1, 1, 1, 1,
-0.2194213, 0.2825319, 0.2784716, 1, 1, 1, 1, 1,
-0.2178502, 2.68444, -0.04896984, 1, 1, 1, 1, 1,
-0.2177532, -0.9487726, -1.322705, 1, 1, 1, 1, 1,
-0.2169212, -1.491174, -1.960531, 1, 1, 1, 1, 1,
-0.2164295, -2.241235, -3.620256, 1, 1, 1, 1, 1,
-0.2161212, -0.2897926, -2.115382, 1, 1, 1, 1, 1,
-0.2132546, -1.355618, -2.360974, 1, 1, 1, 1, 1,
-0.207566, -0.7495994, -2.616908, 1, 1, 1, 1, 1,
-0.2047931, -1.271899, -2.803451, 1, 1, 1, 1, 1,
-0.2026561, -2.252948, -1.725525, 1, 1, 1, 1, 1,
-0.2015816, 0.3996909, -0.04795474, 0, 0, 1, 1, 1,
-0.1997915, -0.4285407, -3.962571, 1, 0, 0, 1, 1,
-0.1996751, -0.04598429, -0.6499988, 1, 0, 0, 1, 1,
-0.1983134, 0.3562544, -1.554953, 1, 0, 0, 1, 1,
-0.1981337, -0.7931139, -3.756944, 1, 0, 0, 1, 1,
-0.1955324, 1.039263, 0.141629, 1, 0, 0, 1, 1,
-0.1941036, -1.268185, -3.754131, 0, 0, 0, 1, 1,
-0.1939776, -0.3638359, -2.504111, 0, 0, 0, 1, 1,
-0.1911089, -0.04152005, -0.2365201, 0, 0, 0, 1, 1,
-0.1892314, -0.2377675, -3.193449, 0, 0, 0, 1, 1,
-0.1767738, 0.1912583, -1.077047, 0, 0, 0, 1, 1,
-0.1759458, 0.9196849, -0.8578286, 0, 0, 0, 1, 1,
-0.1748222, 0.2422249, -1.274788, 0, 0, 0, 1, 1,
-0.1705398, -1.118434, -1.392231, 1, 1, 1, 1, 1,
-0.1679023, 0.3869448, -0.6226389, 1, 1, 1, 1, 1,
-0.1658081, 0.6278744, 1.558738, 1, 1, 1, 1, 1,
-0.163125, 0.3387598, -1.444127, 1, 1, 1, 1, 1,
-0.1623354, -1.191925, -5.040913, 1, 1, 1, 1, 1,
-0.1563365, 0.231473, -0.4174156, 1, 1, 1, 1, 1,
-0.151885, 0.7510462, -0.353837, 1, 1, 1, 1, 1,
-0.1461658, 0.1252511, -1.758338, 1, 1, 1, 1, 1,
-0.1438929, -1.033469, -2.457685, 1, 1, 1, 1, 1,
-0.1430254, -0.08519931, -1.698155, 1, 1, 1, 1, 1,
-0.142134, 0.8567127, -0.7516612, 1, 1, 1, 1, 1,
-0.1411413, 1.87908, 0.9487578, 1, 1, 1, 1, 1,
-0.139763, 0.2379105, 0.431446, 1, 1, 1, 1, 1,
-0.1385881, -0.7620111, -3.060991, 1, 1, 1, 1, 1,
-0.1349234, -0.7046173, -4.618311, 1, 1, 1, 1, 1,
-0.1336226, -2.563398, -1.919072, 0, 0, 1, 1, 1,
-0.1335253, 2.034809, -0.3572875, 1, 0, 0, 1, 1,
-0.132958, 1.099388, 0.4387625, 1, 0, 0, 1, 1,
-0.1238522, 1.028657, -0.7110426, 1, 0, 0, 1, 1,
-0.1193745, 0.5542207, 1.120726, 1, 0, 0, 1, 1,
-0.1141571, -1.004958, -2.749417, 1, 0, 0, 1, 1,
-0.1082472, -0.6349056, -2.588647, 0, 0, 0, 1, 1,
-0.105358, -1.442606, -2.832266, 0, 0, 0, 1, 1,
-0.1025086, -0.6659296, -1.621199, 0, 0, 0, 1, 1,
-0.1024687, 1.303407, -0.2374555, 0, 0, 0, 1, 1,
-0.1008447, 0.1093991, -0.5174047, 0, 0, 0, 1, 1,
-0.09944896, -0.1541143, -3.035356, 0, 0, 0, 1, 1,
-0.09513926, 0.2123307, -0.8883773, 0, 0, 0, 1, 1,
-0.09396149, 0.9254005, -0.4443985, 1, 1, 1, 1, 1,
-0.09081079, -1.485235, -2.479423, 1, 1, 1, 1, 1,
-0.08775371, -0.1651187, -4.024411, 1, 1, 1, 1, 1,
-0.08521915, 0.1019127, -1.252863, 1, 1, 1, 1, 1,
-0.08215724, -0.764071, -2.861271, 1, 1, 1, 1, 1,
-0.07417652, -0.3088205, -3.221695, 1, 1, 1, 1, 1,
-0.07303688, -1.504428, -4.461781, 1, 1, 1, 1, 1,
-0.06823236, -0.9209718, -2.625, 1, 1, 1, 1, 1,
-0.0661009, -0.02377915, 0.4638108, 1, 1, 1, 1, 1,
-0.06434681, -0.06868761, -1.843622, 1, 1, 1, 1, 1,
-0.06039067, 0.9582094, 1.068338, 1, 1, 1, 1, 1,
-0.05038038, -0.2728746, -1.114658, 1, 1, 1, 1, 1,
-0.04785173, 0.05361367, 0.4066711, 1, 1, 1, 1, 1,
-0.04552762, -0.3288144, -2.450847, 1, 1, 1, 1, 1,
-0.0409439, -0.4083553, -3.137586, 1, 1, 1, 1, 1,
-0.04065646, -1.393399, -3.889437, 0, 0, 1, 1, 1,
-0.03790268, 0.2513039, 0.1989536, 1, 0, 0, 1, 1,
-0.03267894, 1.452566, -1.340784, 1, 0, 0, 1, 1,
-0.02968851, 0.437982, 0.2364869, 1, 0, 0, 1, 1,
-0.02576515, 0.7589016, 0.6782863, 1, 0, 0, 1, 1,
-0.02554744, 0.4079259, 0.4918134, 1, 0, 0, 1, 1,
-0.02441821, -2.960894, -2.741676, 0, 0, 0, 1, 1,
-0.01904474, 0.1280504, 0.03637069, 0, 0, 0, 1, 1,
-0.01840352, 2.143445, -0.03485166, 0, 0, 0, 1, 1,
-0.0104468, 0.5478474, 1.816099, 0, 0, 0, 1, 1,
-0.01007622, 0.8806243, 1.158581, 0, 0, 0, 1, 1,
-0.008682425, 0.4722383, 0.20577, 0, 0, 0, 1, 1,
-0.005552152, 0.2702951, 0.281718, 0, 0, 0, 1, 1,
-0.004577025, -2.337722, -3.601916, 1, 1, 1, 1, 1,
-0.003857987, -0.4567593, -4.133243, 1, 1, 1, 1, 1,
-0.003561052, -0.2788283, -4.053615, 1, 1, 1, 1, 1,
-0.0005851088, 0.7564855, 1.286391, 1, 1, 1, 1, 1,
0.0006130069, 0.05645231, 1.419099, 1, 1, 1, 1, 1,
0.001430203, 0.08441792, -2.516023, 1, 1, 1, 1, 1,
0.004401054, 1.163018, -1.025371, 1, 1, 1, 1, 1,
0.004790945, -1.062744, 2.011941, 1, 1, 1, 1, 1,
0.005789223, -0.6993333, 2.838753, 1, 1, 1, 1, 1,
0.005916606, -0.2199258, 1.193976, 1, 1, 1, 1, 1,
0.007683657, 0.4191326, -0.741926, 1, 1, 1, 1, 1,
0.007715136, 1.267254, -0.2790825, 1, 1, 1, 1, 1,
0.009475806, 1.093166, -0.5783666, 1, 1, 1, 1, 1,
0.01112546, 0.2771759, -1.313515, 1, 1, 1, 1, 1,
0.01199285, -0.8997704, 1.578017, 1, 1, 1, 1, 1,
0.01379875, 0.7140568, -0.3873245, 0, 0, 1, 1, 1,
0.01851046, -0.5959098, 3.271337, 1, 0, 0, 1, 1,
0.02066019, 0.8088872, -2.410711, 1, 0, 0, 1, 1,
0.02353477, -0.3969794, 4.026589, 1, 0, 0, 1, 1,
0.02975986, 0.910015, -1.835369, 1, 0, 0, 1, 1,
0.03077559, 2.265081, 0.1085735, 1, 0, 0, 1, 1,
0.03298116, -0.2399841, 2.207352, 0, 0, 0, 1, 1,
0.03343805, -0.2413206, 2.645011, 0, 0, 0, 1, 1,
0.03550664, -0.5708182, 2.319554, 0, 0, 0, 1, 1,
0.04404661, -0.1132873, 1.813631, 0, 0, 0, 1, 1,
0.04642167, -0.357258, 3.737072, 0, 0, 0, 1, 1,
0.05401772, 1.153857, 0.1911188, 0, 0, 0, 1, 1,
0.05589499, -0.6114018, 2.439199, 0, 0, 0, 1, 1,
0.06538336, -0.8085505, 4.696753, 1, 1, 1, 1, 1,
0.06643561, 1.05958, -2.499051, 1, 1, 1, 1, 1,
0.06919515, -0.2303638, 4.918902, 1, 1, 1, 1, 1,
0.07000811, -0.3761665, 3.671963, 1, 1, 1, 1, 1,
0.07750294, 0.4717346, -0.6127985, 1, 1, 1, 1, 1,
0.0816006, 0.1692672, 1.451385, 1, 1, 1, 1, 1,
0.08185311, 0.1982893, -0.9230992, 1, 1, 1, 1, 1,
0.08384737, 1.307331, 0.632484, 1, 1, 1, 1, 1,
0.08478594, -0.9538611, 2.377191, 1, 1, 1, 1, 1,
0.08478995, 1.446128, -0.8383375, 1, 1, 1, 1, 1,
0.08626063, 1.507648, 0.6510675, 1, 1, 1, 1, 1,
0.08668034, 0.7659094, -0.1485329, 1, 1, 1, 1, 1,
0.08735459, 0.8072146, -0.1265678, 1, 1, 1, 1, 1,
0.08747997, 1.161338, 0.5264739, 1, 1, 1, 1, 1,
0.0890644, -0.7395102, 3.569508, 1, 1, 1, 1, 1,
0.09279991, -0.4919984, 4.648698, 0, 0, 1, 1, 1,
0.09426227, -0.2948132, 3.45126, 1, 0, 0, 1, 1,
0.09579031, -1.660758, 3.312767, 1, 0, 0, 1, 1,
0.1082781, -1.011218, 2.353357, 1, 0, 0, 1, 1,
0.1098705, 2.07974, 1.284423, 1, 0, 0, 1, 1,
0.1101729, -0.09785376, 2.2471, 1, 0, 0, 1, 1,
0.1111594, -0.3800344, 2.847618, 0, 0, 0, 1, 1,
0.1168116, -0.2245524, 1.730511, 0, 0, 0, 1, 1,
0.1231905, 0.927249, 0.6351742, 0, 0, 0, 1, 1,
0.1255216, -1.185318, 5.117434, 0, 0, 0, 1, 1,
0.1263646, 1.532797, -1.641801, 0, 0, 0, 1, 1,
0.1268844, -1.330401, 3.670894, 0, 0, 0, 1, 1,
0.1278483, 0.3821556, 1.574833, 0, 0, 0, 1, 1,
0.1300204, -1.147434, 2.279253, 1, 1, 1, 1, 1,
0.1316916, 0.9190174, -0.2388266, 1, 1, 1, 1, 1,
0.1337794, 0.8485599, -0.8755543, 1, 1, 1, 1, 1,
0.1345896, -0.02410263, 2.51463, 1, 1, 1, 1, 1,
0.1362461, -0.04471256, 2.589973, 1, 1, 1, 1, 1,
0.1379174, -1.070256, 2.804173, 1, 1, 1, 1, 1,
0.1382031, 1.591158, 1.414137, 1, 1, 1, 1, 1,
0.1414639, 1.139888, -0.1216455, 1, 1, 1, 1, 1,
0.1470178, -1.454476, 2.951244, 1, 1, 1, 1, 1,
0.1473786, 0.7976626, -0.712059, 1, 1, 1, 1, 1,
0.1544655, -2.153508, 0.7523428, 1, 1, 1, 1, 1,
0.1556998, 0.4718825, -0.5591184, 1, 1, 1, 1, 1,
0.1570005, 0.8971791, 0.9691429, 1, 1, 1, 1, 1,
0.1580891, 0.05084944, 0.6284656, 1, 1, 1, 1, 1,
0.1662975, 0.7832037, 1.805208, 1, 1, 1, 1, 1,
0.1670346, 1.925367, -0.8596976, 0, 0, 1, 1, 1,
0.1683052, 0.2878205, -0.6968691, 1, 0, 0, 1, 1,
0.1686974, -0.1250729, 2.180046, 1, 0, 0, 1, 1,
0.1726271, 0.1781463, -0.833732, 1, 0, 0, 1, 1,
0.1738643, -0.4774593, 1.145617, 1, 0, 0, 1, 1,
0.1775381, 0.2433774, -0.8139864, 1, 0, 0, 1, 1,
0.1874662, 1.58617, -0.06519068, 0, 0, 0, 1, 1,
0.1926875, -0.2096521, 1.470278, 0, 0, 0, 1, 1,
0.1929242, 0.9716593, 0.2190277, 0, 0, 0, 1, 1,
0.1934946, -1.020516, 2.303268, 0, 0, 0, 1, 1,
0.1953658, -0.6881281, 3.306873, 0, 0, 0, 1, 1,
0.1985294, 1.125623, -0.1055159, 0, 0, 0, 1, 1,
0.1988702, 0.6616436, 0.04927747, 0, 0, 0, 1, 1,
0.1994053, 0.1642551, 1.313975, 1, 1, 1, 1, 1,
0.2022545, 0.3060431, 0.6668662, 1, 1, 1, 1, 1,
0.2031809, -2.100497, 2.850438, 1, 1, 1, 1, 1,
0.2039665, -1.553439, 5.251908, 1, 1, 1, 1, 1,
0.204538, 1.093488, -0.5528734, 1, 1, 1, 1, 1,
0.2072899, 0.3628876, 0.2080961, 1, 1, 1, 1, 1,
0.2086517, -1.764719, 1.597628, 1, 1, 1, 1, 1,
0.2090121, 0.6536989, 0.1040996, 1, 1, 1, 1, 1,
0.2096511, -0.5263993, 2.329758, 1, 1, 1, 1, 1,
0.2137339, -0.7914407, 3.353392, 1, 1, 1, 1, 1,
0.2180675, 1.435507, -0.690743, 1, 1, 1, 1, 1,
0.2182998, 0.1892617, 1.31099, 1, 1, 1, 1, 1,
0.2194713, -1.277692, 1.901201, 1, 1, 1, 1, 1,
0.2198833, -1.392728, 3.807941, 1, 1, 1, 1, 1,
0.225637, 0.476683, -0.2443966, 1, 1, 1, 1, 1,
0.2261753, 0.3561969, -2.492312, 0, 0, 1, 1, 1,
0.2279475, 1.077536, 0.6690061, 1, 0, 0, 1, 1,
0.2290687, 0.08561647, -0.3327118, 1, 0, 0, 1, 1,
0.2315238, 0.2371277, 1.688714, 1, 0, 0, 1, 1,
0.2395525, -0.1650754, 2.170343, 1, 0, 0, 1, 1,
0.239865, 0.4333768, -1.31763, 1, 0, 0, 1, 1,
0.2401546, 0.9102079, 1.954324, 0, 0, 0, 1, 1,
0.2413587, 1.735622, 0.1958489, 0, 0, 0, 1, 1,
0.2414258, 0.3853284, 2.826498, 0, 0, 0, 1, 1,
0.2420846, 1.515127, -0.7301559, 0, 0, 0, 1, 1,
0.2442008, 2.06464, -1.348165, 0, 0, 0, 1, 1,
0.2443685, -0.5083279, 3.044712, 0, 0, 0, 1, 1,
0.2444143, -0.1473099, 2.882977, 0, 0, 0, 1, 1,
0.2474882, -0.8241491, 2.58051, 1, 1, 1, 1, 1,
0.2492039, -0.2614737, 2.366759, 1, 1, 1, 1, 1,
0.2492508, -0.4747275, 0.8014185, 1, 1, 1, 1, 1,
0.253442, -0.0536407, 2.136519, 1, 1, 1, 1, 1,
0.2586831, 0.02000702, 2.113617, 1, 1, 1, 1, 1,
0.2589777, -0.4704939, 4.574506, 1, 1, 1, 1, 1,
0.2601263, 0.9480462, -0.1526446, 1, 1, 1, 1, 1,
0.2606355, -0.1785428, 3.576023, 1, 1, 1, 1, 1,
0.2610767, 1.187745, 2.211786, 1, 1, 1, 1, 1,
0.2621092, 1.071688, 1.385793, 1, 1, 1, 1, 1,
0.2644684, -0.8419324, 2.596324, 1, 1, 1, 1, 1,
0.2678226, -0.1406925, 1.602572, 1, 1, 1, 1, 1,
0.2706724, -0.9574492, 2.193476, 1, 1, 1, 1, 1,
0.2716382, -0.5346401, 2.209217, 1, 1, 1, 1, 1,
0.2721032, 1.295376, 1.506215, 1, 1, 1, 1, 1,
0.2765975, -1.679641, 3.322938, 0, 0, 1, 1, 1,
0.2809159, 0.6388136, 0.7257529, 1, 0, 0, 1, 1,
0.2819822, -0.8430299, 2.752701, 1, 0, 0, 1, 1,
0.2833019, -0.6000809, 2.705428, 1, 0, 0, 1, 1,
0.2851465, 0.5238559, 2.76556, 1, 0, 0, 1, 1,
0.2855829, 1.137057, 1.836209, 1, 0, 0, 1, 1,
0.2860345, 1.639673, -0.3775676, 0, 0, 0, 1, 1,
0.2863127, 0.4835625, 3.037674, 0, 0, 0, 1, 1,
0.2908024, -0.3784638, 2.267099, 0, 0, 0, 1, 1,
0.2921586, -1.138161, 3.700374, 0, 0, 0, 1, 1,
0.3009691, -0.390481, 3.668771, 0, 0, 0, 1, 1,
0.3021372, -1.897564, 5.161249, 0, 0, 0, 1, 1,
0.3044222, -0.156356, 1.155954, 0, 0, 0, 1, 1,
0.3051341, 0.09097842, 1.300223, 1, 1, 1, 1, 1,
0.312573, -1.973816, 2.507854, 1, 1, 1, 1, 1,
0.3138874, -1.045057, 5.364476, 1, 1, 1, 1, 1,
0.3162781, 0.8825578, 0.5763006, 1, 1, 1, 1, 1,
0.3197558, 0.2873741, 1.634015, 1, 1, 1, 1, 1,
0.3202513, -1.569596, 3.487796, 1, 1, 1, 1, 1,
0.3217459, -0.295228, 3.035833, 1, 1, 1, 1, 1,
0.3255256, 0.3819451, 0.8508185, 1, 1, 1, 1, 1,
0.3306232, -1.172432, 3.655549, 1, 1, 1, 1, 1,
0.3333219, -0.05618909, 1.366514, 1, 1, 1, 1, 1,
0.334406, -0.2611499, 2.35978, 1, 1, 1, 1, 1,
0.3355578, 0.03476972, 0.05384798, 1, 1, 1, 1, 1,
0.3356022, -2.145648, 4.651105, 1, 1, 1, 1, 1,
0.3481185, 0.5058489, 1.600441, 1, 1, 1, 1, 1,
0.3496678, 0.08012834, 1.527721, 1, 1, 1, 1, 1,
0.3500921, 0.3665501, -0.4865318, 0, 0, 1, 1, 1,
0.3542767, 0.1705435, 0.3811438, 1, 0, 0, 1, 1,
0.3573399, 0.3711599, 1.191033, 1, 0, 0, 1, 1,
0.3591998, -1.385564, 2.175403, 1, 0, 0, 1, 1,
0.3620169, 1.249874, 0.1856864, 1, 0, 0, 1, 1,
0.3624977, 1.036661, -0.01768517, 1, 0, 0, 1, 1,
0.3628765, -1.302802, 2.157189, 0, 0, 0, 1, 1,
0.3708229, 0.3451565, -0.3535804, 0, 0, 0, 1, 1,
0.3740505, -0.2246562, 1.863339, 0, 0, 0, 1, 1,
0.3764952, -0.8967661, 2.651927, 0, 0, 0, 1, 1,
0.3831029, 0.5157736, -0.2310884, 0, 0, 0, 1, 1,
0.3863236, -2.045546, 3.015203, 0, 0, 0, 1, 1,
0.3870189, 0.2844547, 1.119789, 0, 0, 0, 1, 1,
0.3915357, 0.3936269, 1.348023, 1, 1, 1, 1, 1,
0.3965591, -0.1443593, 2.555775, 1, 1, 1, 1, 1,
0.3983484, -0.07789533, 0.9942123, 1, 1, 1, 1, 1,
0.3988769, -0.5982008, 1.525206, 1, 1, 1, 1, 1,
0.3989337, 0.8481786, -0.5789996, 1, 1, 1, 1, 1,
0.4008809, 2.077111, -0.03840164, 1, 1, 1, 1, 1,
0.4040571, 1.174496, 1.844006, 1, 1, 1, 1, 1,
0.4104844, 2.007025, -1.89732, 1, 1, 1, 1, 1,
0.4122219, 0.6273177, 0.7456466, 1, 1, 1, 1, 1,
0.4127671, -1.994152, 3.939042, 1, 1, 1, 1, 1,
0.4143046, -0.3085246, 2.701425, 1, 1, 1, 1, 1,
0.4163278, -2.273807, 4.763665, 1, 1, 1, 1, 1,
0.4187675, 0.6118048, 0.4929622, 1, 1, 1, 1, 1,
0.4201961, 0.4875704, 1.691521, 1, 1, 1, 1, 1,
0.4233178, -0.08463152, 0.3673592, 1, 1, 1, 1, 1,
0.430032, -0.5383658, 3.842054, 0, 0, 1, 1, 1,
0.4335391, 1.068818, 0.8690945, 1, 0, 0, 1, 1,
0.4365591, 2.357394, -1.985299, 1, 0, 0, 1, 1,
0.4409271, -0.6493177, 3.413548, 1, 0, 0, 1, 1,
0.4468923, 1.820866, -2.01462, 1, 0, 0, 1, 1,
0.447228, -0.8768033, 1.454699, 1, 0, 0, 1, 1,
0.4477929, 0.5877649, -0.7881916, 0, 0, 0, 1, 1,
0.4480017, 0.2158581, 0.5541029, 0, 0, 0, 1, 1,
0.4519127, -0.2560857, 4.918599, 0, 0, 0, 1, 1,
0.4535722, 0.3118994, -0.4176427, 0, 0, 0, 1, 1,
0.4554577, -0.5651422, 2.426256, 0, 0, 0, 1, 1,
0.4635963, -1.497969, 3.692288, 0, 0, 0, 1, 1,
0.4664502, 0.3666642, 1.198519, 0, 0, 0, 1, 1,
0.4674228, 0.3465407, 1.589945, 1, 1, 1, 1, 1,
0.4684169, 0.02045003, 0.7763408, 1, 1, 1, 1, 1,
0.4715513, -1.245819, 0.9939657, 1, 1, 1, 1, 1,
0.4745301, 1.395445, 0.4162806, 1, 1, 1, 1, 1,
0.475654, 0.3498369, 0.1425601, 1, 1, 1, 1, 1,
0.4765701, 0.4276, 1.34676, 1, 1, 1, 1, 1,
0.4827785, -0.739881, 3.423773, 1, 1, 1, 1, 1,
0.4844688, 0.3246123, 0.5465928, 1, 1, 1, 1, 1,
0.4878614, -1.113781, 3.214949, 1, 1, 1, 1, 1,
0.4898467, -0.2980012, 2.770474, 1, 1, 1, 1, 1,
0.4927138, -0.3480187, 0.9039516, 1, 1, 1, 1, 1,
0.4944864, 0.391649, 0.2701063, 1, 1, 1, 1, 1,
0.4981567, -1.59955, 2.960448, 1, 1, 1, 1, 1,
0.5050235, 0.8230948, 1.174883, 1, 1, 1, 1, 1,
0.5064781, 1.411584, -0.07509775, 1, 1, 1, 1, 1,
0.5073252, 0.6598282, -1.451476, 0, 0, 1, 1, 1,
0.5142859, 0.1501869, 1.596979, 1, 0, 0, 1, 1,
0.5206116, -1.029697, 3.041004, 1, 0, 0, 1, 1,
0.5233493, -0.2927927, 1.981154, 1, 0, 0, 1, 1,
0.5243695, 0.2291071, 1.412365, 1, 0, 0, 1, 1,
0.5281309, 0.5602085, 0.2577457, 1, 0, 0, 1, 1,
0.5283191, 0.6573799, 2.11322, 0, 0, 0, 1, 1,
0.537151, 0.9487706, 1.477501, 0, 0, 0, 1, 1,
0.5592608, -0.5311853, 3.114905, 0, 0, 0, 1, 1,
0.5608718, 0.2621039, 2.70911, 0, 0, 0, 1, 1,
0.5614749, 0.3987338, 1.878937, 0, 0, 0, 1, 1,
0.5707431, -0.6237606, 2.691038, 0, 0, 0, 1, 1,
0.5717558, 0.935958, 0.6823025, 0, 0, 0, 1, 1,
0.5717595, -0.4366613, 2.724404, 1, 1, 1, 1, 1,
0.5730436, -0.2414131, 1.783175, 1, 1, 1, 1, 1,
0.5748569, -0.4960328, 1.325224, 1, 1, 1, 1, 1,
0.5794936, 0.5983558, 1.393953, 1, 1, 1, 1, 1,
0.5809885, -0.2296011, 2.592938, 1, 1, 1, 1, 1,
0.5822065, -2.028765, 2.945023, 1, 1, 1, 1, 1,
0.5831088, -0.3592592, 2.578133, 1, 1, 1, 1, 1,
0.5872114, 0.5640739, 0.8962281, 1, 1, 1, 1, 1,
0.5879049, -0.1910257, 3.712943, 1, 1, 1, 1, 1,
0.5919756, 1.163703, 1.170761, 1, 1, 1, 1, 1,
0.5937362, 1.676049, -0.08333618, 1, 1, 1, 1, 1,
0.5968068, -0.1288263, 0.2121339, 1, 1, 1, 1, 1,
0.5983043, -0.1877229, 1.122392, 1, 1, 1, 1, 1,
0.6046963, 0.834064, -1.369429, 1, 1, 1, 1, 1,
0.6087613, -1.229636, 2.26817, 1, 1, 1, 1, 1,
0.6231418, 0.1282162, 1.656998, 0, 0, 1, 1, 1,
0.6279331, -0.2878419, 2.202899, 1, 0, 0, 1, 1,
0.6316844, 0.1028283, -0.3607401, 1, 0, 0, 1, 1,
0.6325212, 0.9564026, 0.2491789, 1, 0, 0, 1, 1,
0.6336797, -0.5083234, 2.077026, 1, 0, 0, 1, 1,
0.633905, 1.681601, 1.446375, 1, 0, 0, 1, 1,
0.63476, 0.2218444, 2.849912, 0, 0, 0, 1, 1,
0.6364275, -0.4254416, 1.44429, 0, 0, 0, 1, 1,
0.6417858, 0.9306065, -0.1566884, 0, 0, 0, 1, 1,
0.6514733, 0.3975188, 1.365029, 0, 0, 0, 1, 1,
0.6611763, 0.2967267, 2.798414, 0, 0, 0, 1, 1,
0.6621931, -0.6608168, 2.691377, 0, 0, 0, 1, 1,
0.6650367, -0.6047276, 3.902528, 0, 0, 0, 1, 1,
0.6731449, -1.115246, 2.725625, 1, 1, 1, 1, 1,
0.6766034, -0.9948927, 1.579066, 1, 1, 1, 1, 1,
0.6847227, -0.4748249, 4.636256, 1, 1, 1, 1, 1,
0.6867389, 0.02875084, 2.813007, 1, 1, 1, 1, 1,
0.6902773, 1.2342, -0.8181224, 1, 1, 1, 1, 1,
0.6945207, -0.2801573, 1.321765, 1, 1, 1, 1, 1,
0.7003088, 0.3753532, 1.599772, 1, 1, 1, 1, 1,
0.7012038, -0.956041, 2.8368, 1, 1, 1, 1, 1,
0.7024102, 2.677089, 1.498609, 1, 1, 1, 1, 1,
0.706121, 1.505243, -1.330942, 1, 1, 1, 1, 1,
0.7123067, -0.01333839, 1.731067, 1, 1, 1, 1, 1,
0.717984, 1.598872, -1.155282, 1, 1, 1, 1, 1,
0.7193931, -1.651301, 3.019664, 1, 1, 1, 1, 1,
0.7198564, -1.351431, 2.885953, 1, 1, 1, 1, 1,
0.7205799, 0.302455, 0.2120699, 1, 1, 1, 1, 1,
0.725974, -2.002075, 1.706411, 0, 0, 1, 1, 1,
0.7263926, -2.452592, 4.041059, 1, 0, 0, 1, 1,
0.7266055, 1.199381, 0.8900384, 1, 0, 0, 1, 1,
0.7320707, -0.1473632, 1.491449, 1, 0, 0, 1, 1,
0.7444102, -0.9919598, 0.8286963, 1, 0, 0, 1, 1,
0.7453648, 1.260056, 0.6887874, 1, 0, 0, 1, 1,
0.7501462, 0.04062648, 2.825878, 0, 0, 0, 1, 1,
0.752752, 0.2409592, 1.301253, 0, 0, 0, 1, 1,
0.7531428, 0.6857777, 0.8679774, 0, 0, 0, 1, 1,
0.7555445, -1.404213, 3.132215, 0, 0, 0, 1, 1,
0.7585912, 0.9036897, 2.922169, 0, 0, 0, 1, 1,
0.7610787, -0.8571646, 3.171009, 0, 0, 0, 1, 1,
0.761694, 0.05269896, 0.9464262, 0, 0, 0, 1, 1,
0.7685353, -1.171448, 2.289757, 1, 1, 1, 1, 1,
0.7725549, 0.2733673, 1.867332, 1, 1, 1, 1, 1,
0.7734426, -0.09749026, 1.591033, 1, 1, 1, 1, 1,
0.7743614, -1.486854, 1.907488, 1, 1, 1, 1, 1,
0.7842381, -2.626637, 4.578177, 1, 1, 1, 1, 1,
0.7856099, -0.5165316, 2.439934, 1, 1, 1, 1, 1,
0.7877889, 0.7218054, 0.8779604, 1, 1, 1, 1, 1,
0.7899614, -0.4391888, 3.722689, 1, 1, 1, 1, 1,
0.794175, 1.810272, 2.182415, 1, 1, 1, 1, 1,
0.7953482, 1.67442, 1.57512, 1, 1, 1, 1, 1,
0.7978286, -0.4973784, 0.3932336, 1, 1, 1, 1, 1,
0.7999498, -0.09070791, 1.357624, 1, 1, 1, 1, 1,
0.8023463, -0.8482623, 0.2258375, 1, 1, 1, 1, 1,
0.8041959, -0.2046603, 2.194647, 1, 1, 1, 1, 1,
0.8070903, -0.6831517, 2.626151, 1, 1, 1, 1, 1,
0.8114324, -0.8701691, 1.58206, 0, 0, 1, 1, 1,
0.8128231, 0.95348, 2.211012, 1, 0, 0, 1, 1,
0.8141964, 0.5366636, -1.357037, 1, 0, 0, 1, 1,
0.8221733, 2.453675, 0.3944038, 1, 0, 0, 1, 1,
0.8242132, -0.1609769, 1.199656, 1, 0, 0, 1, 1,
0.8264207, 0.05530068, 1.902706, 1, 0, 0, 1, 1,
0.8319822, 1.646146, -0.7453402, 0, 0, 0, 1, 1,
0.835381, -0.6186329, 0.2574132, 0, 0, 0, 1, 1,
0.83626, 1.400249, 0.1134307, 0, 0, 0, 1, 1,
0.8384781, 0.3629433, 2.354261, 0, 0, 0, 1, 1,
0.8390407, -0.3411618, 2.210754, 0, 0, 0, 1, 1,
0.839225, -1.394293, 5.166705, 0, 0, 0, 1, 1,
0.8393631, -0.02869761, -0.1028376, 0, 0, 0, 1, 1,
0.8467357, 1.398083, -0.02203953, 1, 1, 1, 1, 1,
0.8476244, -0.5271687, 1.123351, 1, 1, 1, 1, 1,
0.8484043, 0.383317, -0.527786, 1, 1, 1, 1, 1,
0.8571615, 0.2029662, 1.544725, 1, 1, 1, 1, 1,
0.871906, -1.951131, 1.829798, 1, 1, 1, 1, 1,
0.8853037, -0.006448907, 1.78932, 1, 1, 1, 1, 1,
0.8954329, -1.126648, 1.824876, 1, 1, 1, 1, 1,
0.8968897, -1.795677, 4.246776, 1, 1, 1, 1, 1,
0.8981514, 1.254603, -0.6212917, 1, 1, 1, 1, 1,
0.9015446, 0.8838366, 1.498255, 1, 1, 1, 1, 1,
0.9028016, 0.5721595, 0.2285413, 1, 1, 1, 1, 1,
0.9039271, 0.8718393, 1.274005, 1, 1, 1, 1, 1,
0.915373, -0.1007591, 1.948642, 1, 1, 1, 1, 1,
0.9158543, -0.2582966, 1.002066, 1, 1, 1, 1, 1,
0.9166966, 0.4778448, 0.7952566, 1, 1, 1, 1, 1,
0.921235, -1.543984, 3.153118, 0, 0, 1, 1, 1,
0.921534, -0.8534731, 2.12723, 1, 0, 0, 1, 1,
0.923454, 1.943635, -0.6169545, 1, 0, 0, 1, 1,
0.9281374, -1.498662, 3.71473, 1, 0, 0, 1, 1,
0.9298753, -1.247329, 3.245479, 1, 0, 0, 1, 1,
0.9337148, -1.170549, 2.838846, 1, 0, 0, 1, 1,
0.9344642, -0.9140405, 3.439617, 0, 0, 0, 1, 1,
0.9414476, -1.748187, 3.365979, 0, 0, 0, 1, 1,
0.9484165, 0.1072519, 0.5475417, 0, 0, 0, 1, 1,
0.9513392, 0.9349852, -0.7769821, 0, 0, 0, 1, 1,
0.9575284, -0.4936929, 2.67391, 0, 0, 0, 1, 1,
0.9598274, 0.9343467, 0.241889, 0, 0, 0, 1, 1,
0.9610322, 2.183914, -1.314519, 0, 0, 0, 1, 1,
0.970742, -1.553393, 2.850628, 1, 1, 1, 1, 1,
0.9812757, -0.5298036, 1.884371, 1, 1, 1, 1, 1,
0.9827819, 0.3616109, 0.9789637, 1, 1, 1, 1, 1,
0.9855872, 0.8475667, 0.1066485, 1, 1, 1, 1, 1,
0.9863717, 0.2962315, 1.04394, 1, 1, 1, 1, 1,
0.9892246, 1.27713, 1.015703, 1, 1, 1, 1, 1,
0.9936187, 1.643357, -0.5457209, 1, 1, 1, 1, 1,
0.9974623, -0.6273782, 1.289337, 1, 1, 1, 1, 1,
0.9991856, 0.5623384, 0.1419442, 1, 1, 1, 1, 1,
0.9993943, -0.3287989, 2.463728, 1, 1, 1, 1, 1,
0.9998933, 0.02033456, -0.1006403, 1, 1, 1, 1, 1,
1.00406, 1.296173, 0.6382276, 1, 1, 1, 1, 1,
1.00623, -0.4283778, 1.693608, 1, 1, 1, 1, 1,
1.010993, 1.224123, 1.200718, 1, 1, 1, 1, 1,
1.012887, 2.157128, -0.8139593, 1, 1, 1, 1, 1,
1.025331, -0.09814535, 1.018585, 0, 0, 1, 1, 1,
1.037091, 0.04098358, 0.6527761, 1, 0, 0, 1, 1,
1.039361, 0.1818666, 2.141727, 1, 0, 0, 1, 1,
1.040186, 1.203086, 1.844104, 1, 0, 0, 1, 1,
1.041579, -0.4916563, 1.699121, 1, 0, 0, 1, 1,
1.043013, 0.09967863, 0.8935627, 1, 0, 0, 1, 1,
1.043821, 0.2155311, 1.443515, 0, 0, 0, 1, 1,
1.045833, -0.3597035, 2.54051, 0, 0, 0, 1, 1,
1.046892, -1.163723, 2.748531, 0, 0, 0, 1, 1,
1.05026, 0.3269527, 0.5940328, 0, 0, 0, 1, 1,
1.051184, -0.4078824, 2.80582, 0, 0, 0, 1, 1,
1.057449, -0.01217232, 1.810258, 0, 0, 0, 1, 1,
1.070578, -0.2916988, 2.848346, 0, 0, 0, 1, 1,
1.072937, 0.7988107, 1.897069, 1, 1, 1, 1, 1,
1.078393, 0.6032389, 0.2013163, 1, 1, 1, 1, 1,
1.083454, 2.071771, 0.8758668, 1, 1, 1, 1, 1,
1.085259, -1.760186, 4.377074, 1, 1, 1, 1, 1,
1.091947, -0.4077248, -0.2904042, 1, 1, 1, 1, 1,
1.102919, -1.077333, 1.025858, 1, 1, 1, 1, 1,
1.103651, -0.7674981, 1.992025, 1, 1, 1, 1, 1,
1.107441, 0.1678831, 2.504053, 1, 1, 1, 1, 1,
1.113832, 0.5969892, 1.147069, 1, 1, 1, 1, 1,
1.11682, -0.1611648, 1.196172, 1, 1, 1, 1, 1,
1.117649, -1.360979, 1.289173, 1, 1, 1, 1, 1,
1.146085, -0.4527832, 1.682426, 1, 1, 1, 1, 1,
1.146337, -0.9999745, 2.057786, 1, 1, 1, 1, 1,
1.146922, -1.421031, 0.8489968, 1, 1, 1, 1, 1,
1.150774, -1.108485, 0.1287213, 1, 1, 1, 1, 1,
1.151072, -0.4132125, 0.592842, 0, 0, 1, 1, 1,
1.15489, -0.7513221, 2.207518, 1, 0, 0, 1, 1,
1.154901, -0.03090288, 1.717483, 1, 0, 0, 1, 1,
1.155372, 0.2840995, 2.299127, 1, 0, 0, 1, 1,
1.165265, -0.1045399, 2.776179, 1, 0, 0, 1, 1,
1.177619, -1.350653, 2.748103, 1, 0, 0, 1, 1,
1.189861, -0.2041475, 0.2830223, 0, 0, 0, 1, 1,
1.190053, 0.6075044, -0.5518229, 0, 0, 0, 1, 1,
1.198131, -0.3559989, 1.762582, 0, 0, 0, 1, 1,
1.204619, -1.512027, 3.822941, 0, 0, 0, 1, 1,
1.223601, -0.6695567, 0.684514, 0, 0, 0, 1, 1,
1.228696, 0.9371917, -0.1690689, 0, 0, 0, 1, 1,
1.231269, 0.7493995, 0.8060805, 0, 0, 0, 1, 1,
1.233166, 1.059815, 0.8095569, 1, 1, 1, 1, 1,
1.234391, -0.2172147, 0.165658, 1, 1, 1, 1, 1,
1.235981, 0.8604938, 1.311751, 1, 1, 1, 1, 1,
1.242807, -0.3944155, 0.6066728, 1, 1, 1, 1, 1,
1.24488, 1.323935, 2.169105, 1, 1, 1, 1, 1,
1.245279, -0.4389203, 1.381816, 1, 1, 1, 1, 1,
1.246119, -0.215548, 1.869629, 1, 1, 1, 1, 1,
1.249819, 0.1570007, 1.051646, 1, 1, 1, 1, 1,
1.256917, 0.5283581, 4.110871, 1, 1, 1, 1, 1,
1.278091, 0.7546495, 0.7887535, 1, 1, 1, 1, 1,
1.280623, -1.085457, 1.414569, 1, 1, 1, 1, 1,
1.281168, 0.2911324, 1.154412, 1, 1, 1, 1, 1,
1.282246, -0.2381019, 4.466713, 1, 1, 1, 1, 1,
1.28567, -1.300176, 3.37266, 1, 1, 1, 1, 1,
1.299945, 0.9013005, 1.181415, 1, 1, 1, 1, 1,
1.300922, 1.736634, -0.1487377, 0, 0, 1, 1, 1,
1.305056, -0.146405, 1.014848, 1, 0, 0, 1, 1,
1.316846, -0.6501906, 1.873701, 1, 0, 0, 1, 1,
1.329128, -0.5536222, 2.216848, 1, 0, 0, 1, 1,
1.331134, 1.858698, 0.2116292, 1, 0, 0, 1, 1,
1.332188, 0.9431273, 1.688593, 1, 0, 0, 1, 1,
1.334893, -0.08176068, -1.228772, 0, 0, 0, 1, 1,
1.338312, 0.4850437, -0.4244587, 0, 0, 0, 1, 1,
1.339483, -0.0104888, 0.3388031, 0, 0, 0, 1, 1,
1.34567, 1.337276, 0.8926075, 0, 0, 0, 1, 1,
1.348186, -0.2582867, 1.430331, 0, 0, 0, 1, 1,
1.351501, 0.7061283, 2.769104, 0, 0, 0, 1, 1,
1.354013, -0.2687304, 1.827802, 0, 0, 0, 1, 1,
1.354243, -0.03279835, 1.668509, 1, 1, 1, 1, 1,
1.358534, 1.316851, 1.633149, 1, 1, 1, 1, 1,
1.36566, 1.236518, -0.9366235, 1, 1, 1, 1, 1,
1.367813, -0.4576655, 0.8261061, 1, 1, 1, 1, 1,
1.386255, 0.9367995, -0.2203994, 1, 1, 1, 1, 1,
1.402154, -1.473046, 3.141605, 1, 1, 1, 1, 1,
1.402235, 1.196188, 1.105948, 1, 1, 1, 1, 1,
1.431853, -2.317083, 1.556506, 1, 1, 1, 1, 1,
1.431937, 0.3696432, 1.642142, 1, 1, 1, 1, 1,
1.434405, -1.71975, 2.78303, 1, 1, 1, 1, 1,
1.442762, -1.123156, 2.111955, 1, 1, 1, 1, 1,
1.447306, -0.5698572, 1.528564, 1, 1, 1, 1, 1,
1.453355, 0.9769515, 0.2517067, 1, 1, 1, 1, 1,
1.457642, 0.8888398, 2.624433, 1, 1, 1, 1, 1,
1.46714, -0.5681788, 1.516287, 1, 1, 1, 1, 1,
1.472633, 0.4615204, 1.647059, 0, 0, 1, 1, 1,
1.475091, 0.2604973, 1.65329, 1, 0, 0, 1, 1,
1.482591, -1.528894, 2.336459, 1, 0, 0, 1, 1,
1.492074, -0.7746304, 2.374439, 1, 0, 0, 1, 1,
1.493515, -0.8739783, 1.90861, 1, 0, 0, 1, 1,
1.494751, -0.1260846, 2.102996, 1, 0, 0, 1, 1,
1.502833, -0.1060498, 0.8088836, 0, 0, 0, 1, 1,
1.505153, 0.1263559, 0.9701352, 0, 0, 0, 1, 1,
1.509697, 0.1282862, 0.8161502, 0, 0, 0, 1, 1,
1.513784, 1.694936, 0.5743045, 0, 0, 0, 1, 1,
1.521871, 1.485997, 1.162583, 0, 0, 0, 1, 1,
1.530714, 1.511292, 0.2341065, 0, 0, 0, 1, 1,
1.537337, 0.457006, -0.1322507, 0, 0, 0, 1, 1,
1.546296, -0.1095244, 3.008084, 1, 1, 1, 1, 1,
1.572059, -1.574429, 2.098301, 1, 1, 1, 1, 1,
1.574182, -1.106398, 1.87724, 1, 1, 1, 1, 1,
1.577364, 1.262614, 1.629365, 1, 1, 1, 1, 1,
1.59012, -0.06568117, 1.785986, 1, 1, 1, 1, 1,
1.602892, 0.9309058, 0.08607987, 1, 1, 1, 1, 1,
1.605598, 0.633518, 1.163666, 1, 1, 1, 1, 1,
1.621097, -1.551014, 1.959942, 1, 1, 1, 1, 1,
1.641767, 0.5889479, 1.800426, 1, 1, 1, 1, 1,
1.648552, 0.1484842, 2.827472, 1, 1, 1, 1, 1,
1.666604, -0.1523699, 2.653437, 1, 1, 1, 1, 1,
1.668795, -0.4301377, 3.121228, 1, 1, 1, 1, 1,
1.685935, -0.03086511, 1.198721, 1, 1, 1, 1, 1,
1.693926, 1.836436, -0.3311701, 1, 1, 1, 1, 1,
1.699642, 0.1242133, 1.949644, 1, 1, 1, 1, 1,
1.702564, -0.1267909, 4.278913, 0, 0, 1, 1, 1,
1.702906, -0.1883113, 1.314096, 1, 0, 0, 1, 1,
1.708194, -2.304962, 0.002295763, 1, 0, 0, 1, 1,
1.735078, 1.204319, -0.7825705, 1, 0, 0, 1, 1,
1.744435, 0.6908771, 0.03145766, 1, 0, 0, 1, 1,
1.748567, 0.1153314, 2.558159, 1, 0, 0, 1, 1,
1.759197, 0.8122757, 3.546731, 0, 0, 0, 1, 1,
1.767789, -0.1290658, 1.303636, 0, 0, 0, 1, 1,
1.792159, 1.089882, 0.3254102, 0, 0, 0, 1, 1,
1.794492, -0.9082176, 1.955707, 0, 0, 0, 1, 1,
1.808133, -0.1250452, 2.194035, 0, 0, 0, 1, 1,
1.808219, -0.9831659, 2.017355, 0, 0, 0, 1, 1,
1.8099, 1.775557, 1.351747, 0, 0, 0, 1, 1,
1.818002, 1.69757, -0.5826178, 1, 1, 1, 1, 1,
1.821989, 1.505126, 0.2108886, 1, 1, 1, 1, 1,
1.83726, -0.07602736, 1.248006, 1, 1, 1, 1, 1,
1.848454, -1.836985, 1.484438, 1, 1, 1, 1, 1,
1.85112, -0.2543435, 1.887876, 1, 1, 1, 1, 1,
1.852012, -0.7091511, 1.594935, 1, 1, 1, 1, 1,
1.887728, 0.7955922, 0.223711, 1, 1, 1, 1, 1,
1.958036, 0.6344199, 1.616003, 1, 1, 1, 1, 1,
1.969732, 0.08884273, 1.942679, 1, 1, 1, 1, 1,
1.985328, -0.28694, 2.285007, 1, 1, 1, 1, 1,
1.986058, -1.32755, 0.6156546, 1, 1, 1, 1, 1,
1.997819, -0.03500384, 1.655731, 1, 1, 1, 1, 1,
2.019702, -0.185717, 1.993325, 1, 1, 1, 1, 1,
2.070891, -1.178016, 2.012465, 1, 1, 1, 1, 1,
2.083971, 0.7905964, -0.1084175, 1, 1, 1, 1, 1,
2.085248, -1.68254, 3.014315, 0, 0, 1, 1, 1,
2.119238, 0.0369864, 2.082697, 1, 0, 0, 1, 1,
2.137271, -1.038502, 2.291228, 1, 0, 0, 1, 1,
2.153045, 0.4602331, 1.160746, 1, 0, 0, 1, 1,
2.17235, 1.72392, 1.203131, 1, 0, 0, 1, 1,
2.181067, -0.6034508, 0.6614463, 1, 0, 0, 1, 1,
2.18582, 0.3509716, -0.2237554, 0, 0, 0, 1, 1,
2.187416, -0.7600194, 3.128002, 0, 0, 0, 1, 1,
2.191308, 1.044175, 1.817562, 0, 0, 0, 1, 1,
2.213007, 0.794927, 3.027524, 0, 0, 0, 1, 1,
2.278545, -0.906357, 3.083386, 0, 0, 0, 1, 1,
2.295548, 0.8393341, 1.177644, 0, 0, 0, 1, 1,
2.331359, 0.6391325, -0.1996418, 0, 0, 0, 1, 1,
2.333507, 0.8971983, -1.897892, 1, 1, 1, 1, 1,
2.441603, -0.4533373, 2.051374, 1, 1, 1, 1, 1,
2.468691, -1.907318, 2.679132, 1, 1, 1, 1, 1,
2.580176, 0.7650796, 0.1610454, 1, 1, 1, 1, 1,
2.826197, -0.4326897, 2.70986, 1, 1, 1, 1, 1,
3.078074, 0.5798808, 2.087636, 1, 1, 1, 1, 1,
3.125218, 0.4475394, 0.7317163, 1, 1, 1, 1, 1
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
var radius = 9.304313;
var distance = 32.681;
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
mvMatrix.translate( 0.1712289, 0.138227, -0.1617818 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.681);
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