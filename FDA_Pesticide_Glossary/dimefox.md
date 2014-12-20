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
-2.870332, 0.3995937, -2.290022, 1, 0, 0, 1,
-2.784963, 0.1643047, -0.9378508, 1, 0.007843138, 0, 1,
-2.642087, 0.1188053, -2.271996, 1, 0.01176471, 0, 1,
-2.488399, 0.4291753, -0.7842818, 1, 0.01960784, 0, 1,
-2.384147, -0.5843923, -3.795183, 1, 0.02352941, 0, 1,
-2.382177, -0.05216068, -2.667127, 1, 0.03137255, 0, 1,
-2.371789, -0.9051135, -3.010242, 1, 0.03529412, 0, 1,
-2.371118, -0.3078027, -0.7378068, 1, 0.04313726, 0, 1,
-2.329841, 0.2269498, -2.937298, 1, 0.04705882, 0, 1,
-2.243354, -0.04873373, -1.376064, 1, 0.05490196, 0, 1,
-2.189635, 1.733736, -0.3428948, 1, 0.05882353, 0, 1,
-2.155582, -0.7383701, 0.6233931, 1, 0.06666667, 0, 1,
-2.154348, -0.07111775, -3.185925, 1, 0.07058824, 0, 1,
-2.139329, 1.658732, -3.124192, 1, 0.07843138, 0, 1,
-2.136812, -1.251946, -2.357767, 1, 0.08235294, 0, 1,
-2.133034, 0.06196543, -1.226724, 1, 0.09019608, 0, 1,
-2.125821, 1.776155, -1.512166, 1, 0.09411765, 0, 1,
-2.095138, -0.2285111, -1.920897, 1, 0.1019608, 0, 1,
-2.086949, -1.122864, -3.352978, 1, 0.1098039, 0, 1,
-2.052859, 0.1841198, -1.429764, 1, 0.1137255, 0, 1,
-2.036979, 0.3959655, -0.188049, 1, 0.1215686, 0, 1,
-2.011109, -0.8561394, -2.557498, 1, 0.1254902, 0, 1,
-1.997702, -2.699184, -1.121986, 1, 0.1333333, 0, 1,
-1.983868, 0.6825547, -0.6180872, 1, 0.1372549, 0, 1,
-1.966365, -1.83198, -1.290192, 1, 0.145098, 0, 1,
-1.962421, 0.3646736, -0.746026, 1, 0.1490196, 0, 1,
-1.958883, -0.3663787, -1.675784, 1, 0.1568628, 0, 1,
-1.946072, -0.1283102, -2.402783, 1, 0.1607843, 0, 1,
-1.944872, 2.064992, 0.5965753, 1, 0.1686275, 0, 1,
-1.928357, 0.2852785, -1.164455, 1, 0.172549, 0, 1,
-1.913167, -0.427717, -1.015901, 1, 0.1803922, 0, 1,
-1.891268, 0.126944, -1.988301, 1, 0.1843137, 0, 1,
-1.887542, -0.3902298, -2.856546, 1, 0.1921569, 0, 1,
-1.849546, -0.2670086, -0.3598195, 1, 0.1960784, 0, 1,
-1.846663, 0.9541243, 1.112007, 1, 0.2039216, 0, 1,
-1.83053, 1.234789, -0.8424032, 1, 0.2117647, 0, 1,
-1.82205, 0.3947382, -1.263009, 1, 0.2156863, 0, 1,
-1.816926, -1.651138, -1.431045, 1, 0.2235294, 0, 1,
-1.794658, -0.6629425, -2.745724, 1, 0.227451, 0, 1,
-1.789778, 0.8064827, -0.6536574, 1, 0.2352941, 0, 1,
-1.771936, -0.3831772, -1.685843, 1, 0.2392157, 0, 1,
-1.759769, -0.3506225, -1.493808, 1, 0.2470588, 0, 1,
-1.741375, 1.773139, -2.472119, 1, 0.2509804, 0, 1,
-1.737479, 1.180211, -1.24242, 1, 0.2588235, 0, 1,
-1.721146, 0.9364548, -1.506609, 1, 0.2627451, 0, 1,
-1.68449, 0.967518, 0.06534424, 1, 0.2705882, 0, 1,
-1.677752, -0.7173471, -3.73567, 1, 0.2745098, 0, 1,
-1.671823, 1.059019, -1.086125, 1, 0.282353, 0, 1,
-1.669409, -0.2680439, -2.137868, 1, 0.2862745, 0, 1,
-1.666539, -0.4120741, -0.3070258, 1, 0.2941177, 0, 1,
-1.662473, -0.2955469, -0.8124738, 1, 0.3019608, 0, 1,
-1.641203, 0.2478685, -3.081126, 1, 0.3058824, 0, 1,
-1.639844, 0.6209285, -1.058655, 1, 0.3137255, 0, 1,
-1.610585, -0.3626781, -2.881174, 1, 0.3176471, 0, 1,
-1.605865, 0.145312, -1.073416, 1, 0.3254902, 0, 1,
-1.60345, 1.006112, -2.468897, 1, 0.3294118, 0, 1,
-1.598884, -1.095626, -0.6988071, 1, 0.3372549, 0, 1,
-1.598791, 0.04654415, -0.7678923, 1, 0.3411765, 0, 1,
-1.586392, -0.1095981, -1.018541, 1, 0.3490196, 0, 1,
-1.57074, 0.8146934, -2.881534, 1, 0.3529412, 0, 1,
-1.570009, 1.09838, -0.4994806, 1, 0.3607843, 0, 1,
-1.562161, 0.6816425, -1.903543, 1, 0.3647059, 0, 1,
-1.557721, 0.3733817, 0.3444587, 1, 0.372549, 0, 1,
-1.548164, 0.2231755, -0.5066861, 1, 0.3764706, 0, 1,
-1.547284, 0.5010308, -0.06623328, 1, 0.3843137, 0, 1,
-1.526941, -0.8615071, -3.925786, 1, 0.3882353, 0, 1,
-1.524289, 0.2183122, -1.367253, 1, 0.3960784, 0, 1,
-1.516971, -0.1335311, -3.604027, 1, 0.4039216, 0, 1,
-1.492276, -0.7093191, -1.877666, 1, 0.4078431, 0, 1,
-1.491451, 0.1505124, -0.2448213, 1, 0.4156863, 0, 1,
-1.490308, 1.428193, -0.699481, 1, 0.4196078, 0, 1,
-1.488395, -0.8083511, -2.256754, 1, 0.427451, 0, 1,
-1.487525, 1.310266, 0.4309415, 1, 0.4313726, 0, 1,
-1.486333, 0.4561471, -0.6551343, 1, 0.4392157, 0, 1,
-1.47379, 0.9645686, -0.6199226, 1, 0.4431373, 0, 1,
-1.473522, 0.3338662, -1.599694, 1, 0.4509804, 0, 1,
-1.473048, 1.356308, -0.2784422, 1, 0.454902, 0, 1,
-1.467004, -0.06425998, -3.211215, 1, 0.4627451, 0, 1,
-1.458974, -0.2796083, -3.328386, 1, 0.4666667, 0, 1,
-1.445181, 0.9427458, -0.637162, 1, 0.4745098, 0, 1,
-1.439399, 2.056686, -0.08142153, 1, 0.4784314, 0, 1,
-1.428355, -0.8633218, -1.991024, 1, 0.4862745, 0, 1,
-1.422979, -0.3824372, -1.200227, 1, 0.4901961, 0, 1,
-1.404587, -1.884488, -3.289514, 1, 0.4980392, 0, 1,
-1.399039, -0.9762841, -3.183164, 1, 0.5058824, 0, 1,
-1.394474, -1.138446, -1.751507, 1, 0.509804, 0, 1,
-1.38809, 1.193604, -0.5168388, 1, 0.5176471, 0, 1,
-1.377392, -1.705398, -1.245644, 1, 0.5215687, 0, 1,
-1.374467, -0.5596104, 1.317833, 1, 0.5294118, 0, 1,
-1.363778, -0.7959464, -2.395983, 1, 0.5333334, 0, 1,
-1.359349, -0.09847458, -2.28582, 1, 0.5411765, 0, 1,
-1.349435, 0.3563541, -2.229665, 1, 0.5450981, 0, 1,
-1.343164, 0.9712151, 0.03863106, 1, 0.5529412, 0, 1,
-1.339759, -0.8248796, -0.5556266, 1, 0.5568628, 0, 1,
-1.339502, -0.4546511, -2.094731, 1, 0.5647059, 0, 1,
-1.335066, -1.326488, -2.041466, 1, 0.5686275, 0, 1,
-1.331732, 0.7527591, -3.693995, 1, 0.5764706, 0, 1,
-1.327673, 0.4755743, -0.1598936, 1, 0.5803922, 0, 1,
-1.325085, -0.602483, -2.717623, 1, 0.5882353, 0, 1,
-1.324481, -0.7122219, -2.023542, 1, 0.5921569, 0, 1,
-1.320844, -0.7670505, -1.633484, 1, 0.6, 0, 1,
-1.310776, 0.2413989, -1.490577, 1, 0.6078432, 0, 1,
-1.310256, 0.003830834, -1.899881, 1, 0.6117647, 0, 1,
-1.286621, 0.9227498, -0.6535271, 1, 0.6196079, 0, 1,
-1.285864, -0.7556208, -2.298923, 1, 0.6235294, 0, 1,
-1.284625, 0.6672588, -1.647766, 1, 0.6313726, 0, 1,
-1.271755, -1.473886, -3.544945, 1, 0.6352941, 0, 1,
-1.267969, -0.6983317, -1.237686, 1, 0.6431373, 0, 1,
-1.266513, -1.098511, -2.02258, 1, 0.6470588, 0, 1,
-1.262429, 0.8769311, -2.689507, 1, 0.654902, 0, 1,
-1.25701, 1.268676, -1.119079, 1, 0.6588235, 0, 1,
-1.256894, 0.2122415, -3.345126, 1, 0.6666667, 0, 1,
-1.237407, 0.2930926, -1.757461, 1, 0.6705883, 0, 1,
-1.231879, 0.023039, -2.865658, 1, 0.6784314, 0, 1,
-1.226655, 2.034203, -0.3472189, 1, 0.682353, 0, 1,
-1.223836, -1.361323, -1.413823, 1, 0.6901961, 0, 1,
-1.215136, -0.4914377, -3.369601, 1, 0.6941177, 0, 1,
-1.204, -1.590531, -3.57217, 1, 0.7019608, 0, 1,
-1.20288, -1.32717, -1.553169, 1, 0.7098039, 0, 1,
-1.202825, 0.02043699, -3.491645, 1, 0.7137255, 0, 1,
-1.199438, -0.1176373, 0.3240605, 1, 0.7215686, 0, 1,
-1.196305, 0.2738362, -2.114771, 1, 0.7254902, 0, 1,
-1.192064, -0.9483978, -0.8678232, 1, 0.7333333, 0, 1,
-1.189299, -0.2417994, -2.833162, 1, 0.7372549, 0, 1,
-1.188321, -0.6379774, -3.032961, 1, 0.7450981, 0, 1,
-1.182055, 1.401236, -0.7419488, 1, 0.7490196, 0, 1,
-1.176395, -0.120525, -1.023588, 1, 0.7568628, 0, 1,
-1.166556, 0.1772418, 0.32276, 1, 0.7607843, 0, 1,
-1.156024, -0.4079552, -3.403699, 1, 0.7686275, 0, 1,
-1.134879, 0.7569554, -0.2936153, 1, 0.772549, 0, 1,
-1.129567, -0.5863912, -2.487908, 1, 0.7803922, 0, 1,
-1.127992, 0.5927941, 0.7803745, 1, 0.7843137, 0, 1,
-1.124809, -0.0004410935, -0.9145561, 1, 0.7921569, 0, 1,
-1.112429, 0.4474033, -0.4843602, 1, 0.7960784, 0, 1,
-1.110884, 2.888533, -1.119804, 1, 0.8039216, 0, 1,
-1.102418, 0.7652895, -1.622969, 1, 0.8117647, 0, 1,
-1.09972, 0.5564219, -1.072968, 1, 0.8156863, 0, 1,
-1.094275, -0.1475963, -2.747673, 1, 0.8235294, 0, 1,
-1.07819, -0.443853, -2.333947, 1, 0.827451, 0, 1,
-1.075437, 1.843594, 1.380359, 1, 0.8352941, 0, 1,
-1.072535, -0.5630579, -0.6907767, 1, 0.8392157, 0, 1,
-1.066699, 0.1354523, -1.201161, 1, 0.8470588, 0, 1,
-1.062825, -0.1358201, -1.217995, 1, 0.8509804, 0, 1,
-1.06045, -0.3259345, -3.484325, 1, 0.8588235, 0, 1,
-1.057657, 2.036534, -1.73888, 1, 0.8627451, 0, 1,
-1.055644, -1.182901, -2.608483, 1, 0.8705882, 0, 1,
-1.052501, -1.457022, -1.992427, 1, 0.8745098, 0, 1,
-1.041364, -0.5941946, -2.320993, 1, 0.8823529, 0, 1,
-1.039794, -0.2237174, -0.1651263, 1, 0.8862745, 0, 1,
-1.034501, 3.224836, -0.2587444, 1, 0.8941177, 0, 1,
-1.031869, -0.7605303, -2.891658, 1, 0.8980392, 0, 1,
-1.022868, 1.776447, -1.247909, 1, 0.9058824, 0, 1,
-1.021216, 1.111543, 1.390228, 1, 0.9137255, 0, 1,
-1.021101, 0.1208091, -1.6233, 1, 0.9176471, 0, 1,
-1.009897, 0.2029746, -1.533464, 1, 0.9254902, 0, 1,
-1.006691, -0.6480309, -2.796621, 1, 0.9294118, 0, 1,
-0.9967981, 0.5786623, -2.986501, 1, 0.9372549, 0, 1,
-0.9931121, -1.049288, -1.324858, 1, 0.9411765, 0, 1,
-0.9920908, -2.084603, -2.262796, 1, 0.9490196, 0, 1,
-0.9869281, -1.041644, -2.252033, 1, 0.9529412, 0, 1,
-0.9761918, -1.407778, -3.964055, 1, 0.9607843, 0, 1,
-0.9710832, -0.6785989, -0.9597127, 1, 0.9647059, 0, 1,
-0.9669198, 0.828817, 0.5032908, 1, 0.972549, 0, 1,
-0.9609842, 0.5478016, -1.268768, 1, 0.9764706, 0, 1,
-0.9604801, -0.04446689, -0.8708748, 1, 0.9843137, 0, 1,
-0.9558665, -0.2165056, -0.9371731, 1, 0.9882353, 0, 1,
-0.9543272, -0.1183414, -1.47603, 1, 0.9960784, 0, 1,
-0.9467131, 0.9222005, -0.7683079, 0.9960784, 1, 0, 1,
-0.9447982, -2.064495, -4.025513, 0.9921569, 1, 0, 1,
-0.9206016, 0.4844884, -2.421411, 0.9843137, 1, 0, 1,
-0.9197705, -0.5915917, -2.311677, 0.9803922, 1, 0, 1,
-0.9189952, -0.02128047, -1.108404, 0.972549, 1, 0, 1,
-0.9188258, -0.08049408, -2.002352, 0.9686275, 1, 0, 1,
-0.9181888, -0.8819427, -3.657274, 0.9607843, 1, 0, 1,
-0.9134167, -0.9955192, -2.543111, 0.9568627, 1, 0, 1,
-0.9097358, 0.2490853, -3.399569, 0.9490196, 1, 0, 1,
-0.9084014, -1.977061, -0.9522012, 0.945098, 1, 0, 1,
-0.9076298, 1.363533, -0.5699573, 0.9372549, 1, 0, 1,
-0.9000195, 0.1217264, -1.034061, 0.9333333, 1, 0, 1,
-0.8994413, -0.2837866, -2.668165, 0.9254902, 1, 0, 1,
-0.8985391, -0.9953564, -1.197117, 0.9215686, 1, 0, 1,
-0.895887, 1.517311, -0.9787063, 0.9137255, 1, 0, 1,
-0.8934515, -0.725614, -1.52997, 0.9098039, 1, 0, 1,
-0.8889525, 0.3511512, -2.280719, 0.9019608, 1, 0, 1,
-0.8841478, 1.266794, -2.902252, 0.8941177, 1, 0, 1,
-0.8725379, 0.593275, -0.1760405, 0.8901961, 1, 0, 1,
-0.8709627, -1.182714, -2.137787, 0.8823529, 1, 0, 1,
-0.8642085, 0.1863251, -2.50082, 0.8784314, 1, 0, 1,
-0.8596437, 1.362935, -0.07368152, 0.8705882, 1, 0, 1,
-0.8589233, 1.45662, -1.704076, 0.8666667, 1, 0, 1,
-0.8588134, -1.320093, -4.378473, 0.8588235, 1, 0, 1,
-0.853486, 1.066734, -0.3278013, 0.854902, 1, 0, 1,
-0.8526952, 1.388776, -0.1872968, 0.8470588, 1, 0, 1,
-0.8521493, -0.9522621, -4.044477, 0.8431373, 1, 0, 1,
-0.837526, -2.219731, -3.068171, 0.8352941, 1, 0, 1,
-0.8366405, -0.1439218, -2.529771, 0.8313726, 1, 0, 1,
-0.8359175, -0.06951538, -3.308403, 0.8235294, 1, 0, 1,
-0.8350174, -1.186853, -1.486519, 0.8196079, 1, 0, 1,
-0.8322733, -1.702863, -0.5920885, 0.8117647, 1, 0, 1,
-0.832026, -1.24299, -3.317971, 0.8078431, 1, 0, 1,
-0.8313606, 0.7195729, -0.7359553, 0.8, 1, 0, 1,
-0.8307477, -0.3664218, -1.49462, 0.7921569, 1, 0, 1,
-0.8230857, 0.6890631, -0.7781245, 0.7882353, 1, 0, 1,
-0.8225709, -0.6434278, -3.166218, 0.7803922, 1, 0, 1,
-0.8212329, 1.083223, -0.9384709, 0.7764706, 1, 0, 1,
-0.8182516, 0.0253423, -2.446339, 0.7686275, 1, 0, 1,
-0.8035035, 1.315642, -0.3256914, 0.7647059, 1, 0, 1,
-0.7978233, 2.13536, 0.05682142, 0.7568628, 1, 0, 1,
-0.7975734, 0.5180691, -1.451108, 0.7529412, 1, 0, 1,
-0.7847618, -0.08873578, -3.018009, 0.7450981, 1, 0, 1,
-0.7819281, 0.7686848, -1.240061, 0.7411765, 1, 0, 1,
-0.7793713, 0.1976116, -2.759115, 0.7333333, 1, 0, 1,
-0.778439, 0.02835751, -2.479603, 0.7294118, 1, 0, 1,
-0.7756444, -0.1631346, -0.7375887, 0.7215686, 1, 0, 1,
-0.7743363, -0.08866977, -2.685449, 0.7176471, 1, 0, 1,
-0.7742267, -0.07838377, -2.804892, 0.7098039, 1, 0, 1,
-0.7620999, 0.5238748, -2.855676, 0.7058824, 1, 0, 1,
-0.7611116, -0.5865877, 0.3780101, 0.6980392, 1, 0, 1,
-0.744082, -0.01826178, -2.318775, 0.6901961, 1, 0, 1,
-0.7415453, 0.5857781, -0.03772221, 0.6862745, 1, 0, 1,
-0.7396415, 0.4965016, -1.365353, 0.6784314, 1, 0, 1,
-0.7393448, 1.114126, -1.181672, 0.6745098, 1, 0, 1,
-0.7355612, -0.1230612, -1.811488, 0.6666667, 1, 0, 1,
-0.7342632, -1.707068, -1.874544, 0.6627451, 1, 0, 1,
-0.731899, 2.212996, -0.6649024, 0.654902, 1, 0, 1,
-0.7272827, 1.894427, -0.4096991, 0.6509804, 1, 0, 1,
-0.7219765, -0.04793367, -1.422954, 0.6431373, 1, 0, 1,
-0.7216436, -1.184761, -3.024309, 0.6392157, 1, 0, 1,
-0.7214249, -0.0200457, -3.365633, 0.6313726, 1, 0, 1,
-0.7192573, 0.8968547, 0.1095382, 0.627451, 1, 0, 1,
-0.7172773, -1.30495, -2.50243, 0.6196079, 1, 0, 1,
-0.7080395, -0.5881325, -3.424253, 0.6156863, 1, 0, 1,
-0.7065051, 0.1459667, -1.469751, 0.6078432, 1, 0, 1,
-0.6952811, 1.312539, 0.03761218, 0.6039216, 1, 0, 1,
-0.6926852, 3.120296, -0.2126492, 0.5960785, 1, 0, 1,
-0.6878307, -0.2367025, -2.585099, 0.5882353, 1, 0, 1,
-0.6874168, -0.1282853, -1.225323, 0.5843138, 1, 0, 1,
-0.6840789, 0.3063469, -2.384049, 0.5764706, 1, 0, 1,
-0.6767269, 1.491957, 0.6356608, 0.572549, 1, 0, 1,
-0.6766706, -1.382889, -2.941971, 0.5647059, 1, 0, 1,
-0.6704612, 1.286422, 0.1399722, 0.5607843, 1, 0, 1,
-0.6654289, 0.1441626, 1.183312, 0.5529412, 1, 0, 1,
-0.6653311, -0.8350038, -4.175066, 0.5490196, 1, 0, 1,
-0.6628945, 0.7950472, -0.9718555, 0.5411765, 1, 0, 1,
-0.6623617, 0.01928161, -2.423186, 0.5372549, 1, 0, 1,
-0.6617648, -0.8997846, -2.391799, 0.5294118, 1, 0, 1,
-0.656167, -1.042529, -1.204837, 0.5254902, 1, 0, 1,
-0.6550046, -0.4538763, -2.860265, 0.5176471, 1, 0, 1,
-0.6545631, 0.4078908, -0.3717759, 0.5137255, 1, 0, 1,
-0.6530297, -0.1660361, -0.5588966, 0.5058824, 1, 0, 1,
-0.6525742, -1.224679, -0.9547083, 0.5019608, 1, 0, 1,
-0.6522282, 0.03690385, -3.069828, 0.4941176, 1, 0, 1,
-0.6502628, 0.6464189, -0.6020835, 0.4862745, 1, 0, 1,
-0.6494524, -0.551497, -1.365079, 0.4823529, 1, 0, 1,
-0.64915, 0.7690942, -1.988424, 0.4745098, 1, 0, 1,
-0.6490351, 0.424013, -2.97706, 0.4705882, 1, 0, 1,
-0.6451621, 0.5654906, -0.3221056, 0.4627451, 1, 0, 1,
-0.6383727, -1.18351, -1.20508, 0.4588235, 1, 0, 1,
-0.6360134, -1.107136, -1.967168, 0.4509804, 1, 0, 1,
-0.6340597, 0.7382873, -2.34882, 0.4470588, 1, 0, 1,
-0.6289715, 0.2683486, -0.3093887, 0.4392157, 1, 0, 1,
-0.628247, 0.574183, 0.2507198, 0.4352941, 1, 0, 1,
-0.6277509, 0.4249862, 0.1850912, 0.427451, 1, 0, 1,
-0.6272723, 1.56862, 0.8885707, 0.4235294, 1, 0, 1,
-0.6228451, 1.169025, -2.182271, 0.4156863, 1, 0, 1,
-0.6210209, 0.1998155, 0.3873304, 0.4117647, 1, 0, 1,
-0.620272, 2.068658, 0.5894982, 0.4039216, 1, 0, 1,
-0.6195595, 1.414671, 0.3684686, 0.3960784, 1, 0, 1,
-0.6161423, 1.582476, -0.6955888, 0.3921569, 1, 0, 1,
-0.6147252, 0.1772055, -2.098523, 0.3843137, 1, 0, 1,
-0.6097802, 2.070403, -0.7528235, 0.3803922, 1, 0, 1,
-0.608717, 0.7491726, 1.392345, 0.372549, 1, 0, 1,
-0.6049924, -0.04379303, -1.927793, 0.3686275, 1, 0, 1,
-0.6042553, 0.03827488, -4.081247, 0.3607843, 1, 0, 1,
-0.6015714, 0.01505731, -1.448478, 0.3568628, 1, 0, 1,
-0.6004992, 2.067577, -0.805814, 0.3490196, 1, 0, 1,
-0.5989594, 2.015558, 0.2680483, 0.345098, 1, 0, 1,
-0.5975166, -0.1471745, -3.550568, 0.3372549, 1, 0, 1,
-0.5949063, 0.3500353, -2.572518, 0.3333333, 1, 0, 1,
-0.592938, -0.3900944, -1.68287, 0.3254902, 1, 0, 1,
-0.5897467, -1.705755, -3.238913, 0.3215686, 1, 0, 1,
-0.5877614, 0.7872154, -1.717498, 0.3137255, 1, 0, 1,
-0.5836861, 0.3247868, -2.216157, 0.3098039, 1, 0, 1,
-0.5828993, 0.2332745, -0.8426999, 0.3019608, 1, 0, 1,
-0.5814798, 2.060883, -0.2361487, 0.2941177, 1, 0, 1,
-0.5747115, -0.07299213, -1.383716, 0.2901961, 1, 0, 1,
-0.5691387, -0.669445, -1.30497, 0.282353, 1, 0, 1,
-0.5689097, 0.5061415, -2.012107, 0.2784314, 1, 0, 1,
-0.5682653, 0.3388095, -0.8976479, 0.2705882, 1, 0, 1,
-0.5669219, 0.239008, -0.8289994, 0.2666667, 1, 0, 1,
-0.5603377, 0.3236372, -0.8875451, 0.2588235, 1, 0, 1,
-0.5571964, -0.3416796, -1.592864, 0.254902, 1, 0, 1,
-0.5515503, 0.9283913, -0.7532596, 0.2470588, 1, 0, 1,
-0.5512401, 0.6332185, -0.8590494, 0.2431373, 1, 0, 1,
-0.5456659, -1.415179, -3.017068, 0.2352941, 1, 0, 1,
-0.5444296, 1.475885, 1.482347, 0.2313726, 1, 0, 1,
-0.5433001, -0.05115464, 0.1098307, 0.2235294, 1, 0, 1,
-0.5412688, 0.2285801, -0.7543154, 0.2196078, 1, 0, 1,
-0.5396819, -0.6817389, -1.713676, 0.2117647, 1, 0, 1,
-0.5346603, 1.572235, -2.622342, 0.2078431, 1, 0, 1,
-0.5324508, 0.6918584, -2.152434, 0.2, 1, 0, 1,
-0.5308554, -1.203363, -2.788852, 0.1921569, 1, 0, 1,
-0.5305973, -1.539587, -3.346822, 0.1882353, 1, 0, 1,
-0.5297901, 0.5190952, -1.518497, 0.1803922, 1, 0, 1,
-0.5191061, -1.002846, -1.661415, 0.1764706, 1, 0, 1,
-0.5168437, -0.08298189, -1.060466, 0.1686275, 1, 0, 1,
-0.5108845, -0.3534324, -2.735211, 0.1647059, 1, 0, 1,
-0.5048959, 1.276906, 0.07526217, 0.1568628, 1, 0, 1,
-0.5043216, -0.649673, -2.950568, 0.1529412, 1, 0, 1,
-0.5030335, -0.6696545, -2.306055, 0.145098, 1, 0, 1,
-0.498433, -1.402593, -1.890714, 0.1411765, 1, 0, 1,
-0.4980677, -0.08582652, -1.245328, 0.1333333, 1, 0, 1,
-0.4977145, -0.126902, -1.879633, 0.1294118, 1, 0, 1,
-0.4970405, 2.201842, -0.8820592, 0.1215686, 1, 0, 1,
-0.4959061, -0.8550175, -1.936944, 0.1176471, 1, 0, 1,
-0.4952303, -0.8639658, -0.759445, 0.1098039, 1, 0, 1,
-0.4897863, 1.317215, 0.7918184, 0.1058824, 1, 0, 1,
-0.4895618, -1.604202, -2.343526, 0.09803922, 1, 0, 1,
-0.4891098, -0.4507717, -2.867788, 0.09019608, 1, 0, 1,
-0.4863271, 0.5956842, 0.01627269, 0.08627451, 1, 0, 1,
-0.4850887, -0.2352034, -2.254412, 0.07843138, 1, 0, 1,
-0.4752537, 0.8502102, 1.114461, 0.07450981, 1, 0, 1,
-0.4691741, -1.530082, -3.433639, 0.06666667, 1, 0, 1,
-0.4679608, -0.9060118, -1.9458, 0.0627451, 1, 0, 1,
-0.4662742, 0.127993, -0.614316, 0.05490196, 1, 0, 1,
-0.4648826, 0.06532833, -0.7786731, 0.05098039, 1, 0, 1,
-0.4642995, -0.2789204, -2.719666, 0.04313726, 1, 0, 1,
-0.4617053, -1.813837, -2.474511, 0.03921569, 1, 0, 1,
-0.4616844, 1.381751, -0.4597563, 0.03137255, 1, 0, 1,
-0.4613055, 0.3643028, -1.319581, 0.02745098, 1, 0, 1,
-0.4531524, 0.2614425, -2.459826, 0.01960784, 1, 0, 1,
-0.453062, -0.9123279, -0.8795496, 0.01568628, 1, 0, 1,
-0.4464701, -0.3472311, -1.098224, 0.007843138, 1, 0, 1,
-0.4432585, 0.4796188, -2.373337, 0.003921569, 1, 0, 1,
-0.4417906, -0.4882638, -1.533003, 0, 1, 0.003921569, 1,
-0.4317588, -2.021899, -2.657383, 0, 1, 0.01176471, 1,
-0.4278614, 0.6180905, 0.5508673, 0, 1, 0.01568628, 1,
-0.4264038, -2.440367, -2.087255, 0, 1, 0.02352941, 1,
-0.4256926, -0.360679, -2.35602, 0, 1, 0.02745098, 1,
-0.4235489, -0.3828518, -2.165341, 0, 1, 0.03529412, 1,
-0.4196478, -0.1804535, -0.4360609, 0, 1, 0.03921569, 1,
-0.4126187, 0.5167332, 0.6814672, 0, 1, 0.04705882, 1,
-0.409469, -0.7347409, -2.785923, 0, 1, 0.05098039, 1,
-0.4029495, -0.8221911, -2.263628, 0, 1, 0.05882353, 1,
-0.3988762, -0.9348909, -1.367801, 0, 1, 0.0627451, 1,
-0.3943554, 1.567152, 0.693314, 0, 1, 0.07058824, 1,
-0.387058, 0.1944861, -1.95207, 0, 1, 0.07450981, 1,
-0.3778267, 2.548139, -1.885846, 0, 1, 0.08235294, 1,
-0.3752582, -0.6851336, -2.606113, 0, 1, 0.08627451, 1,
-0.3750989, -0.3745705, -2.539765, 0, 1, 0.09411765, 1,
-0.3736788, -1.081023, -3.535729, 0, 1, 0.1019608, 1,
-0.3714304, 1.246855, -1.431748, 0, 1, 0.1058824, 1,
-0.3663033, 1.422412, -0.1613128, 0, 1, 0.1137255, 1,
-0.363968, 2.052136, 0.2405094, 0, 1, 0.1176471, 1,
-0.3597642, -0.8639168, -3.729191, 0, 1, 0.1254902, 1,
-0.3586818, -0.2156599, -2.557372, 0, 1, 0.1294118, 1,
-0.3560031, -2.461106, -3.80664, 0, 1, 0.1372549, 1,
-0.3511053, 0.507588, 0.6030439, 0, 1, 0.1411765, 1,
-0.3491333, -0.1316474, -2.306982, 0, 1, 0.1490196, 1,
-0.3402391, 0.5968619, 1.434221, 0, 1, 0.1529412, 1,
-0.3392738, 0.5053292, -1.928125, 0, 1, 0.1607843, 1,
-0.3376258, 2.298148, 1.663061, 0, 1, 0.1647059, 1,
-0.3360206, 1.89045, 0.2885588, 0, 1, 0.172549, 1,
-0.3318101, -0.9813243, -2.779885, 0, 1, 0.1764706, 1,
-0.3307156, 2.175576, -1.838225, 0, 1, 0.1843137, 1,
-0.3266714, 0.6845233, -0.08634281, 0, 1, 0.1882353, 1,
-0.3250481, 0.8240007, -0.9052896, 0, 1, 0.1960784, 1,
-0.3245541, 0.4969479, -0.724143, 0, 1, 0.2039216, 1,
-0.315882, -1.674933, -2.668269, 0, 1, 0.2078431, 1,
-0.3120979, 1.766502, -0.8028986, 0, 1, 0.2156863, 1,
-0.297501, -0.3015017, -1.701895, 0, 1, 0.2196078, 1,
-0.2945864, 1.644089, -1.302616, 0, 1, 0.227451, 1,
-0.2937706, 0.1455386, -1.267279, 0, 1, 0.2313726, 1,
-0.2916352, -0.5160387, -3.881236, 0, 1, 0.2392157, 1,
-0.2913178, -0.4309113, -2.824659, 0, 1, 0.2431373, 1,
-0.2892733, -0.2421051, -2.235168, 0, 1, 0.2509804, 1,
-0.2892315, -0.2938473, -2.384348, 0, 1, 0.254902, 1,
-0.2830958, -0.01898239, -1.922006, 0, 1, 0.2627451, 1,
-0.2812946, -1.770408, -2.966475, 0, 1, 0.2666667, 1,
-0.2775729, -0.05603193, -1.837933, 0, 1, 0.2745098, 1,
-0.2762565, -0.4758084, -2.85472, 0, 1, 0.2784314, 1,
-0.2739105, -0.1292669, -1.488904, 0, 1, 0.2862745, 1,
-0.2711999, -0.1902462, -0.1920241, 0, 1, 0.2901961, 1,
-0.2703822, 0.5571573, -1.019326, 0, 1, 0.2980392, 1,
-0.2642899, 1.382073, 0.7792723, 0, 1, 0.3058824, 1,
-0.2619295, 2.766469, -1.722155, 0, 1, 0.3098039, 1,
-0.2617016, -0.2764812, -2.605919, 0, 1, 0.3176471, 1,
-0.2604853, 2.335449, 0.6538786, 0, 1, 0.3215686, 1,
-0.2590196, -0.7474248, -3.218026, 0, 1, 0.3294118, 1,
-0.2487991, 1.606763, -0.3030928, 0, 1, 0.3333333, 1,
-0.245604, -0.416796, -1.118615, 0, 1, 0.3411765, 1,
-0.2454123, 0.5122294, 0.2271502, 0, 1, 0.345098, 1,
-0.2444068, -0.5773246, -2.153315, 0, 1, 0.3529412, 1,
-0.2388524, 0.5302896, -0.5751124, 0, 1, 0.3568628, 1,
-0.2375859, -0.2518454, -2.668128, 0, 1, 0.3647059, 1,
-0.2324029, 0.0348971, -1.45585, 0, 1, 0.3686275, 1,
-0.2322908, 1.081111, 0.6975762, 0, 1, 0.3764706, 1,
-0.2312866, 0.04218585, -2.031717, 0, 1, 0.3803922, 1,
-0.2242091, -0.5685695, -3.70164, 0, 1, 0.3882353, 1,
-0.2190051, -0.5440924, -2.524766, 0, 1, 0.3921569, 1,
-0.2150697, -1.47711, -1.504591, 0, 1, 0.4, 1,
-0.2110742, 0.5402877, -0.6982591, 0, 1, 0.4078431, 1,
-0.20537, 0.006753026, -2.045726, 0, 1, 0.4117647, 1,
-0.2043102, -0.533109, -2.50971, 0, 1, 0.4196078, 1,
-0.2030739, -1.950123, -1.783153, 0, 1, 0.4235294, 1,
-0.2021868, -1.078016, -3.23002, 0, 1, 0.4313726, 1,
-0.201389, -0.8309413, -3.35987, 0, 1, 0.4352941, 1,
-0.1977127, -0.8278243, -2.567145, 0, 1, 0.4431373, 1,
-0.197581, 0.5227008, 1.388184, 0, 1, 0.4470588, 1,
-0.1962273, 0.6731911, 0.4235941, 0, 1, 0.454902, 1,
-0.1954881, 0.8893859, -0.5007582, 0, 1, 0.4588235, 1,
-0.1923401, -0.09598043, -3.023792, 0, 1, 0.4666667, 1,
-0.1886806, -0.5097815, -4.547972, 0, 1, 0.4705882, 1,
-0.187812, 0.3826764, -0.6619527, 0, 1, 0.4784314, 1,
-0.1837174, -0.6346076, -3.255584, 0, 1, 0.4823529, 1,
-0.1831508, 0.3301052, -0.9688751, 0, 1, 0.4901961, 1,
-0.1829738, -0.177615, -2.204609, 0, 1, 0.4941176, 1,
-0.1824515, 1.617964, 0.9969875, 0, 1, 0.5019608, 1,
-0.1807489, 0.06374194, -2.399933, 0, 1, 0.509804, 1,
-0.1806091, -0.3779072, -0.5644858, 0, 1, 0.5137255, 1,
-0.1800863, -0.5552481, -3.451148, 0, 1, 0.5215687, 1,
-0.1765291, 0.1454141, -1.576542, 0, 1, 0.5254902, 1,
-0.1764137, 1.410157, -2.157624, 0, 1, 0.5333334, 1,
-0.172325, 1.122481, -0.9816657, 0, 1, 0.5372549, 1,
-0.1698625, 0.3153496, 0.3852715, 0, 1, 0.5450981, 1,
-0.1678649, 0.6203675, -1.09257, 0, 1, 0.5490196, 1,
-0.163983, 0.156977, -0.3915118, 0, 1, 0.5568628, 1,
-0.1639645, -1.261841, -3.443158, 0, 1, 0.5607843, 1,
-0.1596505, 0.3210235, -0.07361437, 0, 1, 0.5686275, 1,
-0.1547543, 0.0006008585, -1.769462, 0, 1, 0.572549, 1,
-0.1503008, -0.2999768, -3.509031, 0, 1, 0.5803922, 1,
-0.1490359, -0.270461, -2.121921, 0, 1, 0.5843138, 1,
-0.1485397, 0.2848217, -0.7776619, 0, 1, 0.5921569, 1,
-0.1459681, 0.8187946, -1.38181, 0, 1, 0.5960785, 1,
-0.1458715, -0.57989, -3.464874, 0, 1, 0.6039216, 1,
-0.1426418, -0.5682423, -3.012636, 0, 1, 0.6117647, 1,
-0.1370756, 0.8240212, -0.4297091, 0, 1, 0.6156863, 1,
-0.1362551, -0.9313735, -3.189351, 0, 1, 0.6235294, 1,
-0.1338442, 0.3133375, -1.305217, 0, 1, 0.627451, 1,
-0.1283185, -0.5374653, -0.8598911, 0, 1, 0.6352941, 1,
-0.122766, 0.4293382, -1.322487, 0, 1, 0.6392157, 1,
-0.1224087, -0.9044847, -3.367824, 0, 1, 0.6470588, 1,
-0.121578, -1.106286, -4.061546, 0, 1, 0.6509804, 1,
-0.1165642, 0.8920948, 1.302052, 0, 1, 0.6588235, 1,
-0.1151158, 1.850391, 1.014986, 0, 1, 0.6627451, 1,
-0.1127987, -0.3372459, -1.689774, 0, 1, 0.6705883, 1,
-0.1071842, -0.6645989, -3.854017, 0, 1, 0.6745098, 1,
-0.1070043, -0.4602154, -2.420702, 0, 1, 0.682353, 1,
-0.09979668, -0.1900612, -1.703307, 0, 1, 0.6862745, 1,
-0.09653586, 1.627697, 0.6798799, 0, 1, 0.6941177, 1,
-0.09634564, 0.04255046, -1.28417, 0, 1, 0.7019608, 1,
-0.09501278, -0.9636536, -1.998611, 0, 1, 0.7058824, 1,
-0.09221021, 0.1993613, 0.4573324, 0, 1, 0.7137255, 1,
-0.09189292, 1.301291, 0.2788249, 0, 1, 0.7176471, 1,
-0.08862182, -0.1170012, -3.210865, 0, 1, 0.7254902, 1,
-0.08421215, 2.608432, 0.07092619, 0, 1, 0.7294118, 1,
-0.08383986, -0.553793, -4.372068, 0, 1, 0.7372549, 1,
-0.07866537, -0.3429806, -3.511803, 0, 1, 0.7411765, 1,
-0.07767034, 1.535078, 1.327378, 0, 1, 0.7490196, 1,
-0.07628394, -1.645857, -4.852029, 0, 1, 0.7529412, 1,
-0.07131725, -0.6417069, -0.5048538, 0, 1, 0.7607843, 1,
-0.06361251, -2.249691, -3.08896, 0, 1, 0.7647059, 1,
-0.06073344, 1.133341, 1.217872, 0, 1, 0.772549, 1,
-0.05954152, -0.9659605, -2.191152, 0, 1, 0.7764706, 1,
-0.05949655, 0.4488776, 1.706373, 0, 1, 0.7843137, 1,
-0.05831329, -0.3084415, -0.7372856, 0, 1, 0.7882353, 1,
-0.05659857, -1.51699, -4.80647, 0, 1, 0.7960784, 1,
-0.05468761, 0.008075004, -1.343925, 0, 1, 0.8039216, 1,
-0.0533304, 0.7640629, -1.604126, 0, 1, 0.8078431, 1,
-0.04954443, -0.7036527, -3.556643, 0, 1, 0.8156863, 1,
-0.04420263, -0.7322095, -3.108463, 0, 1, 0.8196079, 1,
-0.04417727, 0.09112912, -1.241283, 0, 1, 0.827451, 1,
-0.04409977, -0.935886, -4.104437, 0, 1, 0.8313726, 1,
-0.04402726, -1.047505, -2.771333, 0, 1, 0.8392157, 1,
-0.03968013, -1.303134, -4.726094, 0, 1, 0.8431373, 1,
-0.03819791, 0.4375871, -1.813816, 0, 1, 0.8509804, 1,
-0.02984663, -0.2326143, -2.327521, 0, 1, 0.854902, 1,
-0.02965993, -0.9342981, -3.641461, 0, 1, 0.8627451, 1,
-0.02927519, -0.3079695, -3.841147, 0, 1, 0.8666667, 1,
-0.02700383, -0.2863718, -2.06657, 0, 1, 0.8745098, 1,
-0.02441507, 0.1112959, -0.4784983, 0, 1, 0.8784314, 1,
-0.02276199, -0.9909501, -3.30246, 0, 1, 0.8862745, 1,
-0.02077651, 0.7635974, 1.716061, 0, 1, 0.8901961, 1,
-0.01960165, 0.8866363, -1.936409, 0, 1, 0.8980392, 1,
-0.01874551, 0.4890082, -0.08937544, 0, 1, 0.9058824, 1,
-0.01308936, 0.0982931, -0.2742443, 0, 1, 0.9098039, 1,
-0.008023268, -0.4069957, -4.923042, 0, 1, 0.9176471, 1,
-0.004026234, 0.3722541, 0.02661582, 0, 1, 0.9215686, 1,
-0.002035499, 0.2991824, -0.42546, 0, 1, 0.9294118, 1,
-0.001461598, 1.250962, -0.2316703, 0, 1, 0.9333333, 1,
-0.0009721471, 0.2698675, -0.5522221, 0, 1, 0.9411765, 1,
-0.0005220138, 1.154168, -0.1220044, 0, 1, 0.945098, 1,
0.000153426, 0.4534954, -2.245763, 0, 1, 0.9529412, 1,
0.0004530234, -2.111361, 3.24057, 0, 1, 0.9568627, 1,
0.006720772, 0.4240412, 1.532505, 0, 1, 0.9647059, 1,
0.009716239, 0.6562384, -0.8338983, 0, 1, 0.9686275, 1,
0.01817768, 0.08540016, 1.582978, 0, 1, 0.9764706, 1,
0.01912374, -0.2935416, 2.069327, 0, 1, 0.9803922, 1,
0.0213637, 0.8130775, -0.8225624, 0, 1, 0.9882353, 1,
0.02358053, -0.890892, 0.7794178, 0, 1, 0.9921569, 1,
0.02674187, 1.637023, 1.343996, 0, 1, 1, 1,
0.03445211, -1.251399, 3.757597, 0, 0.9921569, 1, 1,
0.03464751, 0.3999462, -1.991231, 0, 0.9882353, 1, 1,
0.03476768, 0.1046491, -0.4513184, 0, 0.9803922, 1, 1,
0.03532265, 0.3270765, -0.1528596, 0, 0.9764706, 1, 1,
0.03934802, 1.438231, 1.043708, 0, 0.9686275, 1, 1,
0.03969553, 0.4432043, -0.5354832, 0, 0.9647059, 1, 1,
0.04129141, 0.5413, 0.1266094, 0, 0.9568627, 1, 1,
0.04389844, -0.9123437, 0.9091737, 0, 0.9529412, 1, 1,
0.04624239, -0.1285304, 2.666, 0, 0.945098, 1, 1,
0.0499777, -2.750013, 2.767722, 0, 0.9411765, 1, 1,
0.05120387, 0.8301509, -0.5927555, 0, 0.9333333, 1, 1,
0.05199713, -0.9623411, 5.368826, 0, 0.9294118, 1, 1,
0.05234963, 0.2165058, 0.7568409, 0, 0.9215686, 1, 1,
0.05488632, -0.1467115, 2.077797, 0, 0.9176471, 1, 1,
0.0559958, -0.08775963, 1.949625, 0, 0.9098039, 1, 1,
0.05933184, -2.236434, 3.125892, 0, 0.9058824, 1, 1,
0.06380015, -1.031051, 3.101973, 0, 0.8980392, 1, 1,
0.06614204, 0.8260605, 0.6807683, 0, 0.8901961, 1, 1,
0.06786282, -0.8786747, 2.25091, 0, 0.8862745, 1, 1,
0.07020465, -1.023236, 2.274825, 0, 0.8784314, 1, 1,
0.07497178, 0.08936398, -0.9019278, 0, 0.8745098, 1, 1,
0.07889221, 0.4523571, -0.7959901, 0, 0.8666667, 1, 1,
0.08593978, -1.428608, 2.727143, 0, 0.8627451, 1, 1,
0.08749289, -1.357551, 4.574053, 0, 0.854902, 1, 1,
0.09406575, -1.242057, 3.429016, 0, 0.8509804, 1, 1,
0.09478831, 0.8792516, 1.541363, 0, 0.8431373, 1, 1,
0.09595592, 0.9837167, 0.8654875, 0, 0.8392157, 1, 1,
0.0973509, 0.2398724, -0.7607267, 0, 0.8313726, 1, 1,
0.09760211, -0.722151, 3.72435, 0, 0.827451, 1, 1,
0.1015834, -1.21886, 1.132155, 0, 0.8196079, 1, 1,
0.1047324, 0.08641447, 1.18387, 0, 0.8156863, 1, 1,
0.1079644, 0.09627119, 1.312525, 0, 0.8078431, 1, 1,
0.1100878, -0.1569009, 2.69037, 0, 0.8039216, 1, 1,
0.111, -0.7130473, 1.560221, 0, 0.7960784, 1, 1,
0.1117736, 0.1935539, 1.018831, 0, 0.7882353, 1, 1,
0.112873, 0.01334146, 2.141921, 0, 0.7843137, 1, 1,
0.1153284, -0.8005143, 2.424708, 0, 0.7764706, 1, 1,
0.1202399, 0.4654594, 0.8193702, 0, 0.772549, 1, 1,
0.1209872, 1.582119, -1.650872, 0, 0.7647059, 1, 1,
0.1274544, 0.9824464, -0.1513784, 0, 0.7607843, 1, 1,
0.1284288, -1.421807, 2.303599, 0, 0.7529412, 1, 1,
0.1331153, 1.710089, 0.110984, 0, 0.7490196, 1, 1,
0.1342281, -0.3325815, 2.394477, 0, 0.7411765, 1, 1,
0.1402841, -0.3235386, 2.921643, 0, 0.7372549, 1, 1,
0.1413365, 1.221115, 0.1870645, 0, 0.7294118, 1, 1,
0.1483534, 1.156352, 0.03526261, 0, 0.7254902, 1, 1,
0.1495593, 0.3032828, -0.01128708, 0, 0.7176471, 1, 1,
0.150153, -1.694776, 2.983015, 0, 0.7137255, 1, 1,
0.152051, 0.6861094, 0.768582, 0, 0.7058824, 1, 1,
0.1563127, -1.014385, 0.8295443, 0, 0.6980392, 1, 1,
0.1579943, -0.8032773, 2.792912, 0, 0.6941177, 1, 1,
0.1633923, 0.936075, 0.09782153, 0, 0.6862745, 1, 1,
0.1641498, 1.948629, 0.8574059, 0, 0.682353, 1, 1,
0.1642917, -0.8507812, 3.30166, 0, 0.6745098, 1, 1,
0.1645976, 0.6448932, 0.1121835, 0, 0.6705883, 1, 1,
0.1694903, 0.09588811, 1.726539, 0, 0.6627451, 1, 1,
0.172268, 0.08257572, 0.6496376, 0, 0.6588235, 1, 1,
0.1738568, -0.3839927, 2.344217, 0, 0.6509804, 1, 1,
0.1744909, 1.851823, -0.08752566, 0, 0.6470588, 1, 1,
0.1752345, 0.4059214, 1.991781, 0, 0.6392157, 1, 1,
0.1787287, 0.0519352, 3.224135, 0, 0.6352941, 1, 1,
0.1923883, -0.6408805, 2.527112, 0, 0.627451, 1, 1,
0.1948595, -0.3092849, 3.328308, 0, 0.6235294, 1, 1,
0.198024, -0.1269148, 0.8605478, 0, 0.6156863, 1, 1,
0.1989865, 1.356973, 1.145432, 0, 0.6117647, 1, 1,
0.199157, 0.9911802, 0.6043483, 0, 0.6039216, 1, 1,
0.2026452, 1.03923, 0.5924578, 0, 0.5960785, 1, 1,
0.2039441, -0.7792495, 3.998857, 0, 0.5921569, 1, 1,
0.2078632, -0.8056455, 2.780623, 0, 0.5843138, 1, 1,
0.2092664, 1.316855, 1.123304, 0, 0.5803922, 1, 1,
0.2100501, 0.08394174, 0.3279535, 0, 0.572549, 1, 1,
0.2140727, 0.4025254, -0.5790349, 0, 0.5686275, 1, 1,
0.2151828, 2.618814, 1.708136, 0, 0.5607843, 1, 1,
0.2194715, -0.3321299, 3.156937, 0, 0.5568628, 1, 1,
0.22235, -1.697967, 2.900772, 0, 0.5490196, 1, 1,
0.226946, -0.1357776, 1.524211, 0, 0.5450981, 1, 1,
0.2286168, 0.3563778, 1.083177, 0, 0.5372549, 1, 1,
0.2301202, -0.4128553, 1.234794, 0, 0.5333334, 1, 1,
0.2321171, 0.3484349, 0.2440884, 0, 0.5254902, 1, 1,
0.2341211, 0.6330574, -0.2849418, 0, 0.5215687, 1, 1,
0.2343623, 1.385229, -0.2936811, 0, 0.5137255, 1, 1,
0.2370841, -0.1912013, 2.488855, 0, 0.509804, 1, 1,
0.2400052, 0.3962845, 0.6825197, 0, 0.5019608, 1, 1,
0.2406577, 0.2310946, 0.3081462, 0, 0.4941176, 1, 1,
0.2425627, 0.6898282, 1.179736, 0, 0.4901961, 1, 1,
0.2459201, -0.9812875, 3.478323, 0, 0.4823529, 1, 1,
0.2463782, 1.368946, 0.3574928, 0, 0.4784314, 1, 1,
0.246566, -0.0539373, 1.763564, 0, 0.4705882, 1, 1,
0.2470301, -0.2567298, 2.266421, 0, 0.4666667, 1, 1,
0.2594349, -2.200923, 2.69267, 0, 0.4588235, 1, 1,
0.2600934, 1.006514, -0.189161, 0, 0.454902, 1, 1,
0.2617078, -0.209949, 1.578448, 0, 0.4470588, 1, 1,
0.2650095, 0.1218095, -0.02593243, 0, 0.4431373, 1, 1,
0.265393, -1.240408, 1.738495, 0, 0.4352941, 1, 1,
0.2754197, -0.1435206, 2.102329, 0, 0.4313726, 1, 1,
0.2755839, -1.128815, 2.531222, 0, 0.4235294, 1, 1,
0.2761483, -0.6813151, 3.382738, 0, 0.4196078, 1, 1,
0.278382, 0.5865726, -0.09193929, 0, 0.4117647, 1, 1,
0.2789626, 0.4343062, -0.6432722, 0, 0.4078431, 1, 1,
0.2818872, -0.5895102, 3.398267, 0, 0.4, 1, 1,
0.2819366, 1.042967, 0.6711947, 0, 0.3921569, 1, 1,
0.2900554, -0.2857598, 2.337354, 0, 0.3882353, 1, 1,
0.2928704, -1.996875, 1.223014, 0, 0.3803922, 1, 1,
0.293175, -0.8515099, 3.256311, 0, 0.3764706, 1, 1,
0.2986999, -0.006144688, 1.3337, 0, 0.3686275, 1, 1,
0.2987225, -0.9231003, 2.571637, 0, 0.3647059, 1, 1,
0.30055, -0.5834265, 3.389953, 0, 0.3568628, 1, 1,
0.3028679, 1.043187, -1.201392, 0, 0.3529412, 1, 1,
0.3031556, 0.713479, -0.148396, 0, 0.345098, 1, 1,
0.3043618, 0.5719031, -0.02843141, 0, 0.3411765, 1, 1,
0.308744, -0.4413826, 3.27754, 0, 0.3333333, 1, 1,
0.3092017, -0.01779522, 0.14317, 0, 0.3294118, 1, 1,
0.3161323, -0.8963148, 2.705854, 0, 0.3215686, 1, 1,
0.3167298, -0.7188365, 2.590223, 0, 0.3176471, 1, 1,
0.3185455, -1.146545, 2.451165, 0, 0.3098039, 1, 1,
0.3208244, 0.237919, 0.4994509, 0, 0.3058824, 1, 1,
0.3248422, 0.02798281, 0.8510551, 0, 0.2980392, 1, 1,
0.325081, -0.4627813, 1.663587, 0, 0.2901961, 1, 1,
0.3338363, 0.04771217, 2.354564, 0, 0.2862745, 1, 1,
0.3400078, -0.1908087, 0.6577377, 0, 0.2784314, 1, 1,
0.3419929, 0.3361716, 0.882183, 0, 0.2745098, 1, 1,
0.3432365, -2.000934, 2.339022, 0, 0.2666667, 1, 1,
0.346442, -1.24296, 0.8901668, 0, 0.2627451, 1, 1,
0.3561182, 0.8081206, 0.3581877, 0, 0.254902, 1, 1,
0.3589421, 0.4756606, -0.1471336, 0, 0.2509804, 1, 1,
0.3601374, 0.1435274, 1.565201, 0, 0.2431373, 1, 1,
0.3628215, 0.707029, -0.7350335, 0, 0.2392157, 1, 1,
0.3709399, -0.09278173, 0.9614244, 0, 0.2313726, 1, 1,
0.3729448, -0.4273324, 3.018638, 0, 0.227451, 1, 1,
0.3758423, -0.907402, 1.435673, 0, 0.2196078, 1, 1,
0.3762862, -0.2050345, 2.975926, 0, 0.2156863, 1, 1,
0.3799786, 2.791081, 0.5244904, 0, 0.2078431, 1, 1,
0.381228, 0.4475315, 0.70173, 0, 0.2039216, 1, 1,
0.3820505, -0.9259154, 4.034523, 0, 0.1960784, 1, 1,
0.3825555, -0.3925523, 1.848588, 0, 0.1882353, 1, 1,
0.3829938, -0.3436311, 2.911242, 0, 0.1843137, 1, 1,
0.3856663, -0.1497262, 0.5971797, 0, 0.1764706, 1, 1,
0.3886364, 0.313556, 0.8305215, 0, 0.172549, 1, 1,
0.3905484, 0.7917059, 0.3451138, 0, 0.1647059, 1, 1,
0.3906743, -0.5896574, 2.521671, 0, 0.1607843, 1, 1,
0.3938416, -1.695529, 2.186554, 0, 0.1529412, 1, 1,
0.3941972, -0.5319157, 2.040007, 0, 0.1490196, 1, 1,
0.3947937, 0.7192745, -1.123561, 0, 0.1411765, 1, 1,
0.3950388, -1.268091, 3.530616, 0, 0.1372549, 1, 1,
0.3959269, 0.7073684, 0.6453593, 0, 0.1294118, 1, 1,
0.3961346, -0.425032, 1.208824, 0, 0.1254902, 1, 1,
0.3967, -0.5099275, 2.287096, 0, 0.1176471, 1, 1,
0.3983834, 0.4504349, 1.202069, 0, 0.1137255, 1, 1,
0.4016425, 0.7063043, -0.8571552, 0, 0.1058824, 1, 1,
0.4023592, -1.096408, 0.5727479, 0, 0.09803922, 1, 1,
0.4043985, -0.3370679, 0.5806274, 0, 0.09411765, 1, 1,
0.4063503, 1.13953, -1.229719, 0, 0.08627451, 1, 1,
0.4080775, 1.297921, -0.989464, 0, 0.08235294, 1, 1,
0.4106174, -0.8355215, 0.9586372, 0, 0.07450981, 1, 1,
0.4160317, -0.1608092, 1.579916, 0, 0.07058824, 1, 1,
0.4193738, -0.4767392, 2.978437, 0, 0.0627451, 1, 1,
0.4195602, -1.12286, 0.6618577, 0, 0.05882353, 1, 1,
0.4223569, -0.7827262, 2.960617, 0, 0.05098039, 1, 1,
0.4246112, -1.616969, 4.855932, 0, 0.04705882, 1, 1,
0.4256091, -1.311456, 2.792201, 0, 0.03921569, 1, 1,
0.428389, 1.672624, 0.832876, 0, 0.03529412, 1, 1,
0.432393, -0.4014446, 2.098996, 0, 0.02745098, 1, 1,
0.438923, 0.9641591, 0.8839597, 0, 0.02352941, 1, 1,
0.4397495, -0.2142602, 3.263247, 0, 0.01568628, 1, 1,
0.4474077, -0.173131, 1.415687, 0, 0.01176471, 1, 1,
0.4515091, -1.25975, 2.611088, 0, 0.003921569, 1, 1,
0.4534987, -0.1378372, 3.089239, 0.003921569, 0, 1, 1,
0.4574834, -0.7777294, 2.621308, 0.007843138, 0, 1, 1,
0.4604354, 1.722404, -1.356421, 0.01568628, 0, 1, 1,
0.4658798, -1.107238, 3.1746, 0.01960784, 0, 1, 1,
0.4711335, -0.2180384, 3.717897, 0.02745098, 0, 1, 1,
0.4731558, 0.4203928, -0.4307238, 0.03137255, 0, 1, 1,
0.4740668, 0.1538323, 0.8123275, 0.03921569, 0, 1, 1,
0.4770298, 0.04346886, 3.905504, 0.04313726, 0, 1, 1,
0.4773075, -0.3138979, 1.250721, 0.05098039, 0, 1, 1,
0.4796388, 1.641095, 1.016092, 0.05490196, 0, 1, 1,
0.479886, 0.1376233, 2.18683, 0.0627451, 0, 1, 1,
0.4814837, 0.6174647, 1.15264, 0.06666667, 0, 1, 1,
0.4830987, -0.0004058635, 0.635452, 0.07450981, 0, 1, 1,
0.4833692, 0.4329597, 0.6061664, 0.07843138, 0, 1, 1,
0.4861267, 0.1751716, 0.1277932, 0.08627451, 0, 1, 1,
0.4866325, 0.1298203, 1.392619, 0.09019608, 0, 1, 1,
0.4910775, -0.1749485, 2.273865, 0.09803922, 0, 1, 1,
0.4911226, -0.4129902, 2.519662, 0.1058824, 0, 1, 1,
0.4916192, 1.041485, 1.184003, 0.1098039, 0, 1, 1,
0.4968651, 0.718129, 3.011886, 0.1176471, 0, 1, 1,
0.4982714, -0.09396516, 2.421819, 0.1215686, 0, 1, 1,
0.5131594, -1.022796, 3.18574, 0.1294118, 0, 1, 1,
0.5158991, -0.9166977, 3.335505, 0.1333333, 0, 1, 1,
0.52078, -0.6153358, 2.972394, 0.1411765, 0, 1, 1,
0.5211199, -1.82006, 2.334417, 0.145098, 0, 1, 1,
0.5211964, -0.1020003, 1.754822, 0.1529412, 0, 1, 1,
0.5213675, -0.003297974, 1.326375, 0.1568628, 0, 1, 1,
0.5218929, 0.6225253, 2.368311, 0.1647059, 0, 1, 1,
0.52418, -0.3495174, 3.733432, 0.1686275, 0, 1, 1,
0.5242901, 0.3591002, 0.2885107, 0.1764706, 0, 1, 1,
0.5251971, -0.08748788, 2.946965, 0.1803922, 0, 1, 1,
0.5255178, 0.3841323, -0.6440477, 0.1882353, 0, 1, 1,
0.5286993, -0.5285754, 2.577538, 0.1921569, 0, 1, 1,
0.5315166, 0.6997845, 1.416753, 0.2, 0, 1, 1,
0.53433, -0.7309874, 1.55775, 0.2078431, 0, 1, 1,
0.5347306, -0.3522115, 0.6106705, 0.2117647, 0, 1, 1,
0.5373703, -1.808557, 2.811765, 0.2196078, 0, 1, 1,
0.5396578, -1.372576, 1.675769, 0.2235294, 0, 1, 1,
0.5448996, 0.4705848, 1.032699, 0.2313726, 0, 1, 1,
0.5469159, 1.8583, -0.4517391, 0.2352941, 0, 1, 1,
0.5480567, -0.9536774, 0.9615998, 0.2431373, 0, 1, 1,
0.5484326, 0.6994328, 0.4345846, 0.2470588, 0, 1, 1,
0.5485729, 0.5202262, 2.076836, 0.254902, 0, 1, 1,
0.5536615, -0.106544, 2.022968, 0.2588235, 0, 1, 1,
0.5539805, 1.131356, 0.9663399, 0.2666667, 0, 1, 1,
0.5549883, -0.02359117, 1.590035, 0.2705882, 0, 1, 1,
0.5578406, 1.056797, 0.8234982, 0.2784314, 0, 1, 1,
0.5595919, 0.267732, 2.199638, 0.282353, 0, 1, 1,
0.5637448, -0.8725049, 1.216652, 0.2901961, 0, 1, 1,
0.565645, -0.1061797, 2.180771, 0.2941177, 0, 1, 1,
0.5665264, -0.05194128, 1.236255, 0.3019608, 0, 1, 1,
0.5732564, -0.4344188, 2.375815, 0.3098039, 0, 1, 1,
0.5752151, -1.604411, 2.669961, 0.3137255, 0, 1, 1,
0.5807874, -0.3601975, 0.2510277, 0.3215686, 0, 1, 1,
0.5847255, -1.266111, 2.618096, 0.3254902, 0, 1, 1,
0.5896078, 0.3463503, -0.5254639, 0.3333333, 0, 1, 1,
0.5906362, -0.4335506, 2.435224, 0.3372549, 0, 1, 1,
0.5907448, -0.828862, 1.977112, 0.345098, 0, 1, 1,
0.592596, -0.7233522, 1.176886, 0.3490196, 0, 1, 1,
0.5954549, 0.4842725, 2.84287, 0.3568628, 0, 1, 1,
0.5966586, -0.02370713, 1.189985, 0.3607843, 0, 1, 1,
0.5972143, -0.8358724, 2.242876, 0.3686275, 0, 1, 1,
0.602827, -0.3525485, 1.140872, 0.372549, 0, 1, 1,
0.6091384, 1.099639, 1.655033, 0.3803922, 0, 1, 1,
0.6098095, 1.189543, 0.84792, 0.3843137, 0, 1, 1,
0.6146753, 0.1894449, 1.12151, 0.3921569, 0, 1, 1,
0.6149533, 1.95705, -0.2853366, 0.3960784, 0, 1, 1,
0.6152946, 0.406316, 2.689617, 0.4039216, 0, 1, 1,
0.6167352, -1.014691, 2.436162, 0.4117647, 0, 1, 1,
0.61929, -0.1834061, 2.362461, 0.4156863, 0, 1, 1,
0.620415, 1.221906, 1.593077, 0.4235294, 0, 1, 1,
0.6241754, -0.3304958, 1.856641, 0.427451, 0, 1, 1,
0.6258142, 1.845427, 0.4397255, 0.4352941, 0, 1, 1,
0.6301323, -1.253508, 3.378128, 0.4392157, 0, 1, 1,
0.6350056, 0.9957797, 1.206683, 0.4470588, 0, 1, 1,
0.6362045, -1.108274, 3.366325, 0.4509804, 0, 1, 1,
0.6392824, -0.9187828, 2.313649, 0.4588235, 0, 1, 1,
0.6396289, -0.6914381, 3.677696, 0.4627451, 0, 1, 1,
0.6417638, 1.673249, 0.3288033, 0.4705882, 0, 1, 1,
0.6432517, -0.1649415, 1.118676, 0.4745098, 0, 1, 1,
0.6435561, -1.056879, 3.614787, 0.4823529, 0, 1, 1,
0.6453456, 0.494058, -0.08519028, 0.4862745, 0, 1, 1,
0.653979, -1.780976, 2.927615, 0.4941176, 0, 1, 1,
0.6576543, -0.5457202, 3.596129, 0.5019608, 0, 1, 1,
0.6596346, 1.561055, 0.4583225, 0.5058824, 0, 1, 1,
0.6608679, -0.3314205, 2.230747, 0.5137255, 0, 1, 1,
0.6615699, 1.985917, 1.243754, 0.5176471, 0, 1, 1,
0.6646035, 1.79379, -0.4471092, 0.5254902, 0, 1, 1,
0.6647816, -0.2469522, 3.958942, 0.5294118, 0, 1, 1,
0.664921, -0.974312, 2.416912, 0.5372549, 0, 1, 1,
0.6754296, 0.8111352, 1.202409, 0.5411765, 0, 1, 1,
0.6764622, -0.169062, 2.532887, 0.5490196, 0, 1, 1,
0.6782143, 1.058354, 1.230858, 0.5529412, 0, 1, 1,
0.6785924, 1.432302, -0.3278578, 0.5607843, 0, 1, 1,
0.6813464, -0.3000103, 1.953363, 0.5647059, 0, 1, 1,
0.6840988, -0.5641838, 2.55171, 0.572549, 0, 1, 1,
0.6871219, 0.285524, 1.806314, 0.5764706, 0, 1, 1,
0.6925508, -0.1893041, 1.96598, 0.5843138, 0, 1, 1,
0.6930792, -0.8462532, 2.987097, 0.5882353, 0, 1, 1,
0.6932495, 0.009548875, 1.096874, 0.5960785, 0, 1, 1,
0.6957612, 0.7947867, 1.985324, 0.6039216, 0, 1, 1,
0.6962907, -0.01902996, 0.6906344, 0.6078432, 0, 1, 1,
0.6980582, -0.6611944, 1.914648, 0.6156863, 0, 1, 1,
0.6988659, -0.7116917, 1.774836, 0.6196079, 0, 1, 1,
0.7006077, -2.963782, 3.144694, 0.627451, 0, 1, 1,
0.7134938, -0.2535208, 1.620219, 0.6313726, 0, 1, 1,
0.7154252, 0.7220164, 2.261193, 0.6392157, 0, 1, 1,
0.7165333, -1.306816, 2.994792, 0.6431373, 0, 1, 1,
0.7174229, -0.5939587, 1.320304, 0.6509804, 0, 1, 1,
0.7223291, -1.356989, 2.475704, 0.654902, 0, 1, 1,
0.7241397, 0.7005413, 1.941893, 0.6627451, 0, 1, 1,
0.7246702, 0.02317115, 1.767709, 0.6666667, 0, 1, 1,
0.7248287, -0.5302108, 2.98857, 0.6745098, 0, 1, 1,
0.7271916, 0.1902385, 2.821317, 0.6784314, 0, 1, 1,
0.7272444, 0.06271486, 1.528964, 0.6862745, 0, 1, 1,
0.727729, 1.500037, 1.030273, 0.6901961, 0, 1, 1,
0.7322384, -0.5630035, 0.7231544, 0.6980392, 0, 1, 1,
0.7339125, -0.2364288, 3.606998, 0.7058824, 0, 1, 1,
0.7357748, -1.52568, 2.311274, 0.7098039, 0, 1, 1,
0.7409797, -0.3547134, 1.053736, 0.7176471, 0, 1, 1,
0.7446375, -0.184609, 1.091729, 0.7215686, 0, 1, 1,
0.7466632, 0.2389883, 1.17437, 0.7294118, 0, 1, 1,
0.7482576, -1.024421, 1.873121, 0.7333333, 0, 1, 1,
0.7546792, 1.000755, 1.31754, 0.7411765, 0, 1, 1,
0.7631225, 0.04378595, 1.115332, 0.7450981, 0, 1, 1,
0.7650338, -0.3216956, 0.9731832, 0.7529412, 0, 1, 1,
0.7652031, 0.1609237, 0.6038448, 0.7568628, 0, 1, 1,
0.7708372, -2.092597, 1.663496, 0.7647059, 0, 1, 1,
0.7721205, -0.9658335, 3.065453, 0.7686275, 0, 1, 1,
0.7754957, -0.03485331, 2.001432, 0.7764706, 0, 1, 1,
0.7809318, -0.1359182, 2.365987, 0.7803922, 0, 1, 1,
0.7839178, -1.359039, 3.7325, 0.7882353, 0, 1, 1,
0.7840239, 0.3506138, 1.555413, 0.7921569, 0, 1, 1,
0.7854655, 1.04744, -2.037966, 0.8, 0, 1, 1,
0.7898263, -0.1172563, 2.559519, 0.8078431, 0, 1, 1,
0.7973419, -1.21314, 3.983099, 0.8117647, 0, 1, 1,
0.8068756, 1.058143, 0.2835799, 0.8196079, 0, 1, 1,
0.8099923, -0.8055953, 2.587185, 0.8235294, 0, 1, 1,
0.81188, 0.9930089, 0.06627547, 0.8313726, 0, 1, 1,
0.8146865, 1.50405, 0.3321376, 0.8352941, 0, 1, 1,
0.8167565, -2.56663, 4.28176, 0.8431373, 0, 1, 1,
0.8225955, -0.4125497, 2.576501, 0.8470588, 0, 1, 1,
0.8249919, -0.4071569, 2.174682, 0.854902, 0, 1, 1,
0.8305015, -0.4246068, 4.160258, 0.8588235, 0, 1, 1,
0.8315319, 0.4249969, 0.5889839, 0.8666667, 0, 1, 1,
0.8330153, 0.7233127, 0.4694335, 0.8705882, 0, 1, 1,
0.8337602, 1.067523, 2.54195, 0.8784314, 0, 1, 1,
0.8396436, 1.218184, 1.399463, 0.8823529, 0, 1, 1,
0.8405538, 0.3287761, 1.791748, 0.8901961, 0, 1, 1,
0.8540602, -0.06029103, 0.2412534, 0.8941177, 0, 1, 1,
0.8546486, -0.3115918, 1.893483, 0.9019608, 0, 1, 1,
0.8553311, -2.048258, 3.922792, 0.9098039, 0, 1, 1,
0.8578691, 1.302912, 0.897451, 0.9137255, 0, 1, 1,
0.8692429, 0.2413236, 1.957405, 0.9215686, 0, 1, 1,
0.8695642, 0.9302625, 0.8599722, 0.9254902, 0, 1, 1,
0.8862551, 0.112604, 2.033608, 0.9333333, 0, 1, 1,
0.8911871, -0.6978767, 3.343586, 0.9372549, 0, 1, 1,
0.8918778, -1.169748, 3.97433, 0.945098, 0, 1, 1,
0.8959635, -0.7546914, 3.20675, 0.9490196, 0, 1, 1,
0.8960854, -0.4885216, 2.787263, 0.9568627, 0, 1, 1,
0.8962132, 0.9619398, 0.8866383, 0.9607843, 0, 1, 1,
0.8971859, -1.042444, 2.942884, 0.9686275, 0, 1, 1,
0.8973277, 1.811459, 0.09797754, 0.972549, 0, 1, 1,
0.8991773, 1.003969, 0.4647509, 0.9803922, 0, 1, 1,
0.9039284, -1.052935, 3.147551, 0.9843137, 0, 1, 1,
0.9071442, -0.4942455, 1.283258, 0.9921569, 0, 1, 1,
0.9091633, 0.355631, 2.004309, 0.9960784, 0, 1, 1,
0.9112756, 0.8246959, 2.881433, 1, 0, 0.9960784, 1,
0.9119654, 0.007218001, 2.97486, 1, 0, 0.9882353, 1,
0.9136671, -0.5426855, -0.1619214, 1, 0, 0.9843137, 1,
0.9176782, -0.6743807, 2.374467, 1, 0, 0.9764706, 1,
0.9200668, -1.719366, 3.02086, 1, 0, 0.972549, 1,
0.920502, 2.550115, -1.395866, 1, 0, 0.9647059, 1,
0.9226842, -1.701472, 3.968831, 1, 0, 0.9607843, 1,
0.9266083, 1.717181, 1.57383, 1, 0, 0.9529412, 1,
0.9400941, 0.8195786, 0.6477485, 1, 0, 0.9490196, 1,
0.9434196, 1.190665, -0.1708842, 1, 0, 0.9411765, 1,
0.9520746, 1.537234, 0.8362633, 1, 0, 0.9372549, 1,
0.95783, -1.576278, 1.367489, 1, 0, 0.9294118, 1,
0.9595544, -0.3007187, 0.3781757, 1, 0, 0.9254902, 1,
0.9672031, 1.975484, 1.111221, 1, 0, 0.9176471, 1,
0.970675, 1.643689, 1.579337, 1, 0, 0.9137255, 1,
0.9782407, 0.1031222, 2.533074, 1, 0, 0.9058824, 1,
0.9839328, -0.571825, 2.025468, 1, 0, 0.9019608, 1,
0.9848927, -0.1094702, 2.798744, 1, 0, 0.8941177, 1,
0.9887841, -0.6232297, 2.235501, 1, 0, 0.8862745, 1,
0.9891008, 0.1614903, 1.471829, 1, 0, 0.8823529, 1,
0.9970641, -0.1854265, 1.234391, 1, 0, 0.8745098, 1,
0.9978406, -0.5652422, 1.691164, 1, 0, 0.8705882, 1,
1.000217, 1.335722, 1.365367, 1, 0, 0.8627451, 1,
1.002727, -0.008307131, 1.323373, 1, 0, 0.8588235, 1,
1.010996, -0.4671206, 0.005671993, 1, 0, 0.8509804, 1,
1.02241, -1.096163, 1.457649, 1, 0, 0.8470588, 1,
1.026749, -0.6021308, 4.705364, 1, 0, 0.8392157, 1,
1.02749, -0.4711946, 1.669896, 1, 0, 0.8352941, 1,
1.030065, -1.435054, 2.436084, 1, 0, 0.827451, 1,
1.031094, 0.4807123, 1.086105, 1, 0, 0.8235294, 1,
1.033674, -0.7909837, 3.902935, 1, 0, 0.8156863, 1,
1.033751, -0.07484456, 0.5597997, 1, 0, 0.8117647, 1,
1.042115, 1.422292, 1.344776, 1, 0, 0.8039216, 1,
1.042236, -0.5468737, 2.747912, 1, 0, 0.7960784, 1,
1.046274, -0.07735302, 2.010123, 1, 0, 0.7921569, 1,
1.046527, 0.08576993, 1.91818, 1, 0, 0.7843137, 1,
1.047148, 1.605166, 1.47547, 1, 0, 0.7803922, 1,
1.047446, -0.5064064, 2.981862, 1, 0, 0.772549, 1,
1.051723, 0.5188656, 1.307354, 1, 0, 0.7686275, 1,
1.055527, -0.6264341, 0.1347904, 1, 0, 0.7607843, 1,
1.060398, -0.02465607, 2.255504, 1, 0, 0.7568628, 1,
1.061587, -0.3050332, 1.048701, 1, 0, 0.7490196, 1,
1.06919, 0.5454116, -0.1768413, 1, 0, 0.7450981, 1,
1.072092, 0.3370738, 1.050956, 1, 0, 0.7372549, 1,
1.075585, -0.8346817, 0.8919159, 1, 0, 0.7333333, 1,
1.077682, 0.8834781, 2.616123, 1, 0, 0.7254902, 1,
1.080171, 1.387215, 1.423486, 1, 0, 0.7215686, 1,
1.081993, 0.06818175, 1.502966, 1, 0, 0.7137255, 1,
1.092429, -0.9325191, 0.6916245, 1, 0, 0.7098039, 1,
1.094122, 0.719505, 0.8990746, 1, 0, 0.7019608, 1,
1.099879, -0.5368984, 0.7883551, 1, 0, 0.6941177, 1,
1.100274, -1.195693, 1.474942, 1, 0, 0.6901961, 1,
1.114099, -0.0381767, 0.8348651, 1, 0, 0.682353, 1,
1.123558, 1.356265, -0.2367465, 1, 0, 0.6784314, 1,
1.129433, 1.529856, 0.7021508, 1, 0, 0.6705883, 1,
1.130981, -0.3271177, 2.143619, 1, 0, 0.6666667, 1,
1.139912, -0.9038869, 2.975612, 1, 0, 0.6588235, 1,
1.149107, 0.6680628, 1.125469, 1, 0, 0.654902, 1,
1.14984, 0.3915276, 0.129581, 1, 0, 0.6470588, 1,
1.152687, 0.07291653, 1.727845, 1, 0, 0.6431373, 1,
1.152774, -0.1368525, 0.4182675, 1, 0, 0.6352941, 1,
1.164357, -0.5982034, 1.825923, 1, 0, 0.6313726, 1,
1.169024, -0.1219811, 0.7089052, 1, 0, 0.6235294, 1,
1.17338, 0.2067053, 1.478285, 1, 0, 0.6196079, 1,
1.181005, -0.2109139, 2.43809, 1, 0, 0.6117647, 1,
1.181853, -1.679971, 3.1457, 1, 0, 0.6078432, 1,
1.183502, 0.477346, 1.313474, 1, 0, 0.6, 1,
1.188979, -1.575388, 3.865702, 1, 0, 0.5921569, 1,
1.193155, -0.9030722, 3.573647, 1, 0, 0.5882353, 1,
1.195164, 0.7727932, 0.7123501, 1, 0, 0.5803922, 1,
1.211411, -0.7466953, 3.601716, 1, 0, 0.5764706, 1,
1.212123, -0.2519814, 1.003519, 1, 0, 0.5686275, 1,
1.21543, -0.6762956, 2.017447, 1, 0, 0.5647059, 1,
1.218745, 0.5574401, 0.8195413, 1, 0, 0.5568628, 1,
1.220928, -1.808143, 4.958025, 1, 0, 0.5529412, 1,
1.221861, -0.04910059, 0.6981558, 1, 0, 0.5450981, 1,
1.226903, 0.6535953, -0.00286675, 1, 0, 0.5411765, 1,
1.229895, 0.02382503, 2.761492, 1, 0, 0.5333334, 1,
1.23075, -1.14355, 3.218398, 1, 0, 0.5294118, 1,
1.233384, 0.03207712, 2.417266, 1, 0, 0.5215687, 1,
1.240479, -1.792267, 2.829234, 1, 0, 0.5176471, 1,
1.246202, -0.5093426, 3.293387, 1, 0, 0.509804, 1,
1.246415, 2.301984, -2.256591, 1, 0, 0.5058824, 1,
1.249242, -0.8439451, 3.340345, 1, 0, 0.4980392, 1,
1.24952, 0.2531326, 2.184675, 1, 0, 0.4901961, 1,
1.256046, 0.3629733, 0.2510576, 1, 0, 0.4862745, 1,
1.262081, 1.396115, 0.9406435, 1, 0, 0.4784314, 1,
1.262262, 0.6069766, -0.6030124, 1, 0, 0.4745098, 1,
1.268194, 0.3878999, 1.842726, 1, 0, 0.4666667, 1,
1.277637, -0.1573493, 2.985021, 1, 0, 0.4627451, 1,
1.284245, 1.531335, 0.7507444, 1, 0, 0.454902, 1,
1.287722, 1.06385, 0.3920476, 1, 0, 0.4509804, 1,
1.288309, 1.185332, 0.2753303, 1, 0, 0.4431373, 1,
1.290835, 0.9325895, 1.035603, 1, 0, 0.4392157, 1,
1.297753, -1.693919, 1.817727, 1, 0, 0.4313726, 1,
1.310075, -0.3714027, 2.460589, 1, 0, 0.427451, 1,
1.310924, -0.4556801, 1.450615, 1, 0, 0.4196078, 1,
1.320848, -0.1093676, 1.47047, 1, 0, 0.4156863, 1,
1.32125, 0.495832, 1.432237, 1, 0, 0.4078431, 1,
1.326316, -1.181843, 1.50896, 1, 0, 0.4039216, 1,
1.341892, -1.459001, 2.787893, 1, 0, 0.3960784, 1,
1.343614, 0.5701703, 0.7060406, 1, 0, 0.3882353, 1,
1.34415, -3.083521, 1.465573, 1, 0, 0.3843137, 1,
1.34544, -0.2818063, 1.873799, 1, 0, 0.3764706, 1,
1.346339, -0.7387298, 1.894283, 1, 0, 0.372549, 1,
1.350121, -1.382352, 0.9598857, 1, 0, 0.3647059, 1,
1.362204, 2.337183, -0.8044078, 1, 0, 0.3607843, 1,
1.369955, 1.412256, -0.6474196, 1, 0, 0.3529412, 1,
1.388747, 1.042063, 0.2919074, 1, 0, 0.3490196, 1,
1.389477, 0.460128, 2.082174, 1, 0, 0.3411765, 1,
1.398864, 0.4691233, 0.08068175, 1, 0, 0.3372549, 1,
1.412624, 0.03247748, 2.056856, 1, 0, 0.3294118, 1,
1.42576, 0.06138192, 0.2897632, 1, 0, 0.3254902, 1,
1.443901, 0.2209917, 0.4643567, 1, 0, 0.3176471, 1,
1.481467, 0.8224862, 1.401174, 1, 0, 0.3137255, 1,
1.487568, -0.3562073, 1.43407, 1, 0, 0.3058824, 1,
1.491886, -0.5319192, 2.867144, 1, 0, 0.2980392, 1,
1.496682, -1.108055, 1.286621, 1, 0, 0.2941177, 1,
1.502968, -0.9288426, 1.085885, 1, 0, 0.2862745, 1,
1.527449, -0.06306246, 0.482542, 1, 0, 0.282353, 1,
1.543981, 1.680317, 0.6631071, 1, 0, 0.2745098, 1,
1.550739, -1.03767, 2.868316, 1, 0, 0.2705882, 1,
1.568569, 0.6307068, 2.759852, 1, 0, 0.2627451, 1,
1.570838, -0.8262487, 1.946208, 1, 0, 0.2588235, 1,
1.574146, -0.487233, 2.11579, 1, 0, 0.2509804, 1,
1.583455, 0.3748308, 2.103432, 1, 0, 0.2470588, 1,
1.586892, -1.221076, 2.563257, 1, 0, 0.2392157, 1,
1.587681, 1.261538, 0.336527, 1, 0, 0.2352941, 1,
1.608031, -0.345564, 0.2894538, 1, 0, 0.227451, 1,
1.639378, -1.026991, 0.881465, 1, 0, 0.2235294, 1,
1.648526, -0.4435329, 2.739747, 1, 0, 0.2156863, 1,
1.655308, -0.1208264, -0.1386219, 1, 0, 0.2117647, 1,
1.699648, 0.3673557, 0.3885579, 1, 0, 0.2039216, 1,
1.707321, -3.656641, 3.569704, 1, 0, 0.1960784, 1,
1.743573, 0.2408189, 1.364805, 1, 0, 0.1921569, 1,
1.756048, -1.126765, 2.747177, 1, 0, 0.1843137, 1,
1.771265, 0.0007050671, 1.873197, 1, 0, 0.1803922, 1,
1.782241, -1.313214, 3.523189, 1, 0, 0.172549, 1,
1.789421, -2.166276, 0.9371465, 1, 0, 0.1686275, 1,
1.79174, -0.03163848, 2.880053, 1, 0, 0.1607843, 1,
1.911936, -2.536829, 2.484945, 1, 0, 0.1568628, 1,
1.9309, 1.521055, 1.420159, 1, 0, 0.1490196, 1,
1.947872, 0.7745609, 1.836022, 1, 0, 0.145098, 1,
1.959543, -0.6039057, 3.915835, 1, 0, 0.1372549, 1,
1.982839, -1.205065, 1.482661, 1, 0, 0.1333333, 1,
1.985509, -0.223124, 2.794359, 1, 0, 0.1254902, 1,
2.022836, -1.258141, 2.320151, 1, 0, 0.1215686, 1,
2.08968, 2.289698, 1.791676, 1, 0, 0.1137255, 1,
2.096917, 0.429083, -0.3635198, 1, 0, 0.1098039, 1,
2.185417, 1.064995, 1.247112, 1, 0, 0.1019608, 1,
2.215722, 0.5883838, 0.636621, 1, 0, 0.09411765, 1,
2.227176, 1.021175, 2.455274, 1, 0, 0.09019608, 1,
2.230047, 0.8442181, 1.556939, 1, 0, 0.08235294, 1,
2.25697, -0.6166112, 2.398441, 1, 0, 0.07843138, 1,
2.258608, -0.01909481, 1.472011, 1, 0, 0.07058824, 1,
2.269391, 0.1303687, 0.5365067, 1, 0, 0.06666667, 1,
2.290782, 0.8563866, 0.5989444, 1, 0, 0.05882353, 1,
2.295369, -0.9517137, 2.307299, 1, 0, 0.05490196, 1,
2.306872, 1.13546, 3.245814, 1, 0, 0.04705882, 1,
2.31417, 1.479093, 0.402598, 1, 0, 0.04313726, 1,
2.374129, 1.279314, -0.1481269, 1, 0, 0.03529412, 1,
2.469681, -0.2193482, 1.843502, 1, 0, 0.03137255, 1,
2.613598, -0.06564578, 0.3289275, 1, 0, 0.02352941, 1,
2.753676, -0.5160935, 2.657338, 1, 0, 0.01960784, 1,
2.915643, -0.8206761, 1.97713, 1, 0, 0.01176471, 1,
2.939668, -0.349173, 1.431763, 1, 0, 0.007843138, 1
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
0.03466809, -4.823051, -6.667513, 0, -0.5, 0.5, 0.5,
0.03466809, -4.823051, -6.667513, 1, -0.5, 0.5, 0.5,
0.03466809, -4.823051, -6.667513, 1, 1.5, 0.5, 0.5,
0.03466809, -4.823051, -6.667513, 0, 1.5, 0.5, 0.5
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
-3.855127, -0.2159026, -6.667513, 0, -0.5, 0.5, 0.5,
-3.855127, -0.2159026, -6.667513, 1, -0.5, 0.5, 0.5,
-3.855127, -0.2159026, -6.667513, 1, 1.5, 0.5, 0.5,
-3.855127, -0.2159026, -6.667513, 0, 1.5, 0.5, 0.5
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
-3.855127, -4.823051, 0.2228923, 0, -0.5, 0.5, 0.5,
-3.855127, -4.823051, 0.2228923, 1, -0.5, 0.5, 0.5,
-3.855127, -4.823051, 0.2228923, 1, 1.5, 0.5, 0.5,
-3.855127, -4.823051, 0.2228923, 0, 1.5, 0.5, 0.5
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
-2, -3.759863, -5.07742,
2, -3.759863, -5.07742,
-2, -3.759863, -5.07742,
-2, -3.937061, -5.342435,
-1, -3.759863, -5.07742,
-1, -3.937061, -5.342435,
0, -3.759863, -5.07742,
0, -3.937061, -5.342435,
1, -3.759863, -5.07742,
1, -3.937061, -5.342435,
2, -3.759863, -5.07742,
2, -3.937061, -5.342435
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
-2, -4.291457, -5.872467, 0, -0.5, 0.5, 0.5,
-2, -4.291457, -5.872467, 1, -0.5, 0.5, 0.5,
-2, -4.291457, -5.872467, 1, 1.5, 0.5, 0.5,
-2, -4.291457, -5.872467, 0, 1.5, 0.5, 0.5,
-1, -4.291457, -5.872467, 0, -0.5, 0.5, 0.5,
-1, -4.291457, -5.872467, 1, -0.5, 0.5, 0.5,
-1, -4.291457, -5.872467, 1, 1.5, 0.5, 0.5,
-1, -4.291457, -5.872467, 0, 1.5, 0.5, 0.5,
0, -4.291457, -5.872467, 0, -0.5, 0.5, 0.5,
0, -4.291457, -5.872467, 1, -0.5, 0.5, 0.5,
0, -4.291457, -5.872467, 1, 1.5, 0.5, 0.5,
0, -4.291457, -5.872467, 0, 1.5, 0.5, 0.5,
1, -4.291457, -5.872467, 0, -0.5, 0.5, 0.5,
1, -4.291457, -5.872467, 1, -0.5, 0.5, 0.5,
1, -4.291457, -5.872467, 1, 1.5, 0.5, 0.5,
1, -4.291457, -5.872467, 0, 1.5, 0.5, 0.5,
2, -4.291457, -5.872467, 0, -0.5, 0.5, 0.5,
2, -4.291457, -5.872467, 1, -0.5, 0.5, 0.5,
2, -4.291457, -5.872467, 1, 1.5, 0.5, 0.5,
2, -4.291457, -5.872467, 0, 1.5, 0.5, 0.5
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
-2.957482, -3, -5.07742,
-2.957482, 3, -5.07742,
-2.957482, -3, -5.07742,
-3.10709, -3, -5.342435,
-2.957482, -2, -5.07742,
-3.10709, -2, -5.342435,
-2.957482, -1, -5.07742,
-3.10709, -1, -5.342435,
-2.957482, 0, -5.07742,
-3.10709, 0, -5.342435,
-2.957482, 1, -5.07742,
-3.10709, 1, -5.342435,
-2.957482, 2, -5.07742,
-3.10709, 2, -5.342435,
-2.957482, 3, -5.07742,
-3.10709, 3, -5.342435
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
-3.406305, -3, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, -3, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, -3, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, -3, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, -2, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, -2, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, -2, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, -2, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, -1, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, -1, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, -1, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, -1, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, 0, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, 0, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, 0, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, 0, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, 1, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, 1, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, 1, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, 1, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, 2, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, 2, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, 2, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, 2, -5.872467, 0, 1.5, 0.5, 0.5,
-3.406305, 3, -5.872467, 0, -0.5, 0.5, 0.5,
-3.406305, 3, -5.872467, 1, -0.5, 0.5, 0.5,
-3.406305, 3, -5.872467, 1, 1.5, 0.5, 0.5,
-3.406305, 3, -5.872467, 0, 1.5, 0.5, 0.5
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
-2.957482, -3.759863, -4,
-2.957482, -3.759863, 4,
-2.957482, -3.759863, -4,
-3.10709, -3.937061, -4,
-2.957482, -3.759863, -2,
-3.10709, -3.937061, -2,
-2.957482, -3.759863, 0,
-3.10709, -3.937061, 0,
-2.957482, -3.759863, 2,
-3.10709, -3.937061, 2,
-2.957482, -3.759863, 4,
-3.10709, -3.937061, 4
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
-3.406305, -4.291457, -4, 0, -0.5, 0.5, 0.5,
-3.406305, -4.291457, -4, 1, -0.5, 0.5, 0.5,
-3.406305, -4.291457, -4, 1, 1.5, 0.5, 0.5,
-3.406305, -4.291457, -4, 0, 1.5, 0.5, 0.5,
-3.406305, -4.291457, -2, 0, -0.5, 0.5, 0.5,
-3.406305, -4.291457, -2, 1, -0.5, 0.5, 0.5,
-3.406305, -4.291457, -2, 1, 1.5, 0.5, 0.5,
-3.406305, -4.291457, -2, 0, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 0, 0, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 0, 1, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 0, 1, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 0, 0, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 2, 0, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 2, 1, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 2, 1, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 2, 0, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 4, 0, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 4, 1, -0.5, 0.5, 0.5,
-3.406305, -4.291457, 4, 1, 1.5, 0.5, 0.5,
-3.406305, -4.291457, 4, 0, 1.5, 0.5, 0.5
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
-2.957482, -3.759863, -5.07742,
-2.957482, 3.328058, -5.07742,
-2.957482, -3.759863, 5.523204,
-2.957482, 3.328058, 5.523204,
-2.957482, -3.759863, -5.07742,
-2.957482, -3.759863, 5.523204,
-2.957482, 3.328058, -5.07742,
-2.957482, 3.328058, 5.523204,
-2.957482, -3.759863, -5.07742,
3.026818, -3.759863, -5.07742,
-2.957482, -3.759863, 5.523204,
3.026818, -3.759863, 5.523204,
-2.957482, 3.328058, -5.07742,
3.026818, 3.328058, -5.07742,
-2.957482, 3.328058, 5.523204,
3.026818, 3.328058, 5.523204,
3.026818, -3.759863, -5.07742,
3.026818, 3.328058, -5.07742,
3.026818, -3.759863, 5.523204,
3.026818, 3.328058, 5.523204,
3.026818, -3.759863, -5.07742,
3.026818, -3.759863, 5.523204,
3.026818, 3.328058, -5.07742,
3.026818, 3.328058, 5.523204
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
var radius = 7.521808;
var distance = 33.46537;
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
mvMatrix.translate( -0.03466809, 0.2159026, -0.2228923 );
mvMatrix.scale( 1.35901, 1.147406, 0.7671931 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46537);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
dimefox<-read.table("dimefox.xyz")
```

```
## Error in read.table("dimefox.xyz"): no lines available in input
```

```r
x<-dimefox$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
```

```r
y<-dimefox$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
```

```r
z<-dimefox$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
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
-2.870332, 0.3995937, -2.290022, 0, 0, 1, 1, 1,
-2.784963, 0.1643047, -0.9378508, 1, 0, 0, 1, 1,
-2.642087, 0.1188053, -2.271996, 1, 0, 0, 1, 1,
-2.488399, 0.4291753, -0.7842818, 1, 0, 0, 1, 1,
-2.384147, -0.5843923, -3.795183, 1, 0, 0, 1, 1,
-2.382177, -0.05216068, -2.667127, 1, 0, 0, 1, 1,
-2.371789, -0.9051135, -3.010242, 0, 0, 0, 1, 1,
-2.371118, -0.3078027, -0.7378068, 0, 0, 0, 1, 1,
-2.329841, 0.2269498, -2.937298, 0, 0, 0, 1, 1,
-2.243354, -0.04873373, -1.376064, 0, 0, 0, 1, 1,
-2.189635, 1.733736, -0.3428948, 0, 0, 0, 1, 1,
-2.155582, -0.7383701, 0.6233931, 0, 0, 0, 1, 1,
-2.154348, -0.07111775, -3.185925, 0, 0, 0, 1, 1,
-2.139329, 1.658732, -3.124192, 1, 1, 1, 1, 1,
-2.136812, -1.251946, -2.357767, 1, 1, 1, 1, 1,
-2.133034, 0.06196543, -1.226724, 1, 1, 1, 1, 1,
-2.125821, 1.776155, -1.512166, 1, 1, 1, 1, 1,
-2.095138, -0.2285111, -1.920897, 1, 1, 1, 1, 1,
-2.086949, -1.122864, -3.352978, 1, 1, 1, 1, 1,
-2.052859, 0.1841198, -1.429764, 1, 1, 1, 1, 1,
-2.036979, 0.3959655, -0.188049, 1, 1, 1, 1, 1,
-2.011109, -0.8561394, -2.557498, 1, 1, 1, 1, 1,
-1.997702, -2.699184, -1.121986, 1, 1, 1, 1, 1,
-1.983868, 0.6825547, -0.6180872, 1, 1, 1, 1, 1,
-1.966365, -1.83198, -1.290192, 1, 1, 1, 1, 1,
-1.962421, 0.3646736, -0.746026, 1, 1, 1, 1, 1,
-1.958883, -0.3663787, -1.675784, 1, 1, 1, 1, 1,
-1.946072, -0.1283102, -2.402783, 1, 1, 1, 1, 1,
-1.944872, 2.064992, 0.5965753, 0, 0, 1, 1, 1,
-1.928357, 0.2852785, -1.164455, 1, 0, 0, 1, 1,
-1.913167, -0.427717, -1.015901, 1, 0, 0, 1, 1,
-1.891268, 0.126944, -1.988301, 1, 0, 0, 1, 1,
-1.887542, -0.3902298, -2.856546, 1, 0, 0, 1, 1,
-1.849546, -0.2670086, -0.3598195, 1, 0, 0, 1, 1,
-1.846663, 0.9541243, 1.112007, 0, 0, 0, 1, 1,
-1.83053, 1.234789, -0.8424032, 0, 0, 0, 1, 1,
-1.82205, 0.3947382, -1.263009, 0, 0, 0, 1, 1,
-1.816926, -1.651138, -1.431045, 0, 0, 0, 1, 1,
-1.794658, -0.6629425, -2.745724, 0, 0, 0, 1, 1,
-1.789778, 0.8064827, -0.6536574, 0, 0, 0, 1, 1,
-1.771936, -0.3831772, -1.685843, 0, 0, 0, 1, 1,
-1.759769, -0.3506225, -1.493808, 1, 1, 1, 1, 1,
-1.741375, 1.773139, -2.472119, 1, 1, 1, 1, 1,
-1.737479, 1.180211, -1.24242, 1, 1, 1, 1, 1,
-1.721146, 0.9364548, -1.506609, 1, 1, 1, 1, 1,
-1.68449, 0.967518, 0.06534424, 1, 1, 1, 1, 1,
-1.677752, -0.7173471, -3.73567, 1, 1, 1, 1, 1,
-1.671823, 1.059019, -1.086125, 1, 1, 1, 1, 1,
-1.669409, -0.2680439, -2.137868, 1, 1, 1, 1, 1,
-1.666539, -0.4120741, -0.3070258, 1, 1, 1, 1, 1,
-1.662473, -0.2955469, -0.8124738, 1, 1, 1, 1, 1,
-1.641203, 0.2478685, -3.081126, 1, 1, 1, 1, 1,
-1.639844, 0.6209285, -1.058655, 1, 1, 1, 1, 1,
-1.610585, -0.3626781, -2.881174, 1, 1, 1, 1, 1,
-1.605865, 0.145312, -1.073416, 1, 1, 1, 1, 1,
-1.60345, 1.006112, -2.468897, 1, 1, 1, 1, 1,
-1.598884, -1.095626, -0.6988071, 0, 0, 1, 1, 1,
-1.598791, 0.04654415, -0.7678923, 1, 0, 0, 1, 1,
-1.586392, -0.1095981, -1.018541, 1, 0, 0, 1, 1,
-1.57074, 0.8146934, -2.881534, 1, 0, 0, 1, 1,
-1.570009, 1.09838, -0.4994806, 1, 0, 0, 1, 1,
-1.562161, 0.6816425, -1.903543, 1, 0, 0, 1, 1,
-1.557721, 0.3733817, 0.3444587, 0, 0, 0, 1, 1,
-1.548164, 0.2231755, -0.5066861, 0, 0, 0, 1, 1,
-1.547284, 0.5010308, -0.06623328, 0, 0, 0, 1, 1,
-1.526941, -0.8615071, -3.925786, 0, 0, 0, 1, 1,
-1.524289, 0.2183122, -1.367253, 0, 0, 0, 1, 1,
-1.516971, -0.1335311, -3.604027, 0, 0, 0, 1, 1,
-1.492276, -0.7093191, -1.877666, 0, 0, 0, 1, 1,
-1.491451, 0.1505124, -0.2448213, 1, 1, 1, 1, 1,
-1.490308, 1.428193, -0.699481, 1, 1, 1, 1, 1,
-1.488395, -0.8083511, -2.256754, 1, 1, 1, 1, 1,
-1.487525, 1.310266, 0.4309415, 1, 1, 1, 1, 1,
-1.486333, 0.4561471, -0.6551343, 1, 1, 1, 1, 1,
-1.47379, 0.9645686, -0.6199226, 1, 1, 1, 1, 1,
-1.473522, 0.3338662, -1.599694, 1, 1, 1, 1, 1,
-1.473048, 1.356308, -0.2784422, 1, 1, 1, 1, 1,
-1.467004, -0.06425998, -3.211215, 1, 1, 1, 1, 1,
-1.458974, -0.2796083, -3.328386, 1, 1, 1, 1, 1,
-1.445181, 0.9427458, -0.637162, 1, 1, 1, 1, 1,
-1.439399, 2.056686, -0.08142153, 1, 1, 1, 1, 1,
-1.428355, -0.8633218, -1.991024, 1, 1, 1, 1, 1,
-1.422979, -0.3824372, -1.200227, 1, 1, 1, 1, 1,
-1.404587, -1.884488, -3.289514, 1, 1, 1, 1, 1,
-1.399039, -0.9762841, -3.183164, 0, 0, 1, 1, 1,
-1.394474, -1.138446, -1.751507, 1, 0, 0, 1, 1,
-1.38809, 1.193604, -0.5168388, 1, 0, 0, 1, 1,
-1.377392, -1.705398, -1.245644, 1, 0, 0, 1, 1,
-1.374467, -0.5596104, 1.317833, 1, 0, 0, 1, 1,
-1.363778, -0.7959464, -2.395983, 1, 0, 0, 1, 1,
-1.359349, -0.09847458, -2.28582, 0, 0, 0, 1, 1,
-1.349435, 0.3563541, -2.229665, 0, 0, 0, 1, 1,
-1.343164, 0.9712151, 0.03863106, 0, 0, 0, 1, 1,
-1.339759, -0.8248796, -0.5556266, 0, 0, 0, 1, 1,
-1.339502, -0.4546511, -2.094731, 0, 0, 0, 1, 1,
-1.335066, -1.326488, -2.041466, 0, 0, 0, 1, 1,
-1.331732, 0.7527591, -3.693995, 0, 0, 0, 1, 1,
-1.327673, 0.4755743, -0.1598936, 1, 1, 1, 1, 1,
-1.325085, -0.602483, -2.717623, 1, 1, 1, 1, 1,
-1.324481, -0.7122219, -2.023542, 1, 1, 1, 1, 1,
-1.320844, -0.7670505, -1.633484, 1, 1, 1, 1, 1,
-1.310776, 0.2413989, -1.490577, 1, 1, 1, 1, 1,
-1.310256, 0.003830834, -1.899881, 1, 1, 1, 1, 1,
-1.286621, 0.9227498, -0.6535271, 1, 1, 1, 1, 1,
-1.285864, -0.7556208, -2.298923, 1, 1, 1, 1, 1,
-1.284625, 0.6672588, -1.647766, 1, 1, 1, 1, 1,
-1.271755, -1.473886, -3.544945, 1, 1, 1, 1, 1,
-1.267969, -0.6983317, -1.237686, 1, 1, 1, 1, 1,
-1.266513, -1.098511, -2.02258, 1, 1, 1, 1, 1,
-1.262429, 0.8769311, -2.689507, 1, 1, 1, 1, 1,
-1.25701, 1.268676, -1.119079, 1, 1, 1, 1, 1,
-1.256894, 0.2122415, -3.345126, 1, 1, 1, 1, 1,
-1.237407, 0.2930926, -1.757461, 0, 0, 1, 1, 1,
-1.231879, 0.023039, -2.865658, 1, 0, 0, 1, 1,
-1.226655, 2.034203, -0.3472189, 1, 0, 0, 1, 1,
-1.223836, -1.361323, -1.413823, 1, 0, 0, 1, 1,
-1.215136, -0.4914377, -3.369601, 1, 0, 0, 1, 1,
-1.204, -1.590531, -3.57217, 1, 0, 0, 1, 1,
-1.20288, -1.32717, -1.553169, 0, 0, 0, 1, 1,
-1.202825, 0.02043699, -3.491645, 0, 0, 0, 1, 1,
-1.199438, -0.1176373, 0.3240605, 0, 0, 0, 1, 1,
-1.196305, 0.2738362, -2.114771, 0, 0, 0, 1, 1,
-1.192064, -0.9483978, -0.8678232, 0, 0, 0, 1, 1,
-1.189299, -0.2417994, -2.833162, 0, 0, 0, 1, 1,
-1.188321, -0.6379774, -3.032961, 0, 0, 0, 1, 1,
-1.182055, 1.401236, -0.7419488, 1, 1, 1, 1, 1,
-1.176395, -0.120525, -1.023588, 1, 1, 1, 1, 1,
-1.166556, 0.1772418, 0.32276, 1, 1, 1, 1, 1,
-1.156024, -0.4079552, -3.403699, 1, 1, 1, 1, 1,
-1.134879, 0.7569554, -0.2936153, 1, 1, 1, 1, 1,
-1.129567, -0.5863912, -2.487908, 1, 1, 1, 1, 1,
-1.127992, 0.5927941, 0.7803745, 1, 1, 1, 1, 1,
-1.124809, -0.0004410935, -0.9145561, 1, 1, 1, 1, 1,
-1.112429, 0.4474033, -0.4843602, 1, 1, 1, 1, 1,
-1.110884, 2.888533, -1.119804, 1, 1, 1, 1, 1,
-1.102418, 0.7652895, -1.622969, 1, 1, 1, 1, 1,
-1.09972, 0.5564219, -1.072968, 1, 1, 1, 1, 1,
-1.094275, -0.1475963, -2.747673, 1, 1, 1, 1, 1,
-1.07819, -0.443853, -2.333947, 1, 1, 1, 1, 1,
-1.075437, 1.843594, 1.380359, 1, 1, 1, 1, 1,
-1.072535, -0.5630579, -0.6907767, 0, 0, 1, 1, 1,
-1.066699, 0.1354523, -1.201161, 1, 0, 0, 1, 1,
-1.062825, -0.1358201, -1.217995, 1, 0, 0, 1, 1,
-1.06045, -0.3259345, -3.484325, 1, 0, 0, 1, 1,
-1.057657, 2.036534, -1.73888, 1, 0, 0, 1, 1,
-1.055644, -1.182901, -2.608483, 1, 0, 0, 1, 1,
-1.052501, -1.457022, -1.992427, 0, 0, 0, 1, 1,
-1.041364, -0.5941946, -2.320993, 0, 0, 0, 1, 1,
-1.039794, -0.2237174, -0.1651263, 0, 0, 0, 1, 1,
-1.034501, 3.224836, -0.2587444, 0, 0, 0, 1, 1,
-1.031869, -0.7605303, -2.891658, 0, 0, 0, 1, 1,
-1.022868, 1.776447, -1.247909, 0, 0, 0, 1, 1,
-1.021216, 1.111543, 1.390228, 0, 0, 0, 1, 1,
-1.021101, 0.1208091, -1.6233, 1, 1, 1, 1, 1,
-1.009897, 0.2029746, -1.533464, 1, 1, 1, 1, 1,
-1.006691, -0.6480309, -2.796621, 1, 1, 1, 1, 1,
-0.9967981, 0.5786623, -2.986501, 1, 1, 1, 1, 1,
-0.9931121, -1.049288, -1.324858, 1, 1, 1, 1, 1,
-0.9920908, -2.084603, -2.262796, 1, 1, 1, 1, 1,
-0.9869281, -1.041644, -2.252033, 1, 1, 1, 1, 1,
-0.9761918, -1.407778, -3.964055, 1, 1, 1, 1, 1,
-0.9710832, -0.6785989, -0.9597127, 1, 1, 1, 1, 1,
-0.9669198, 0.828817, 0.5032908, 1, 1, 1, 1, 1,
-0.9609842, 0.5478016, -1.268768, 1, 1, 1, 1, 1,
-0.9604801, -0.04446689, -0.8708748, 1, 1, 1, 1, 1,
-0.9558665, -0.2165056, -0.9371731, 1, 1, 1, 1, 1,
-0.9543272, -0.1183414, -1.47603, 1, 1, 1, 1, 1,
-0.9467131, 0.9222005, -0.7683079, 1, 1, 1, 1, 1,
-0.9447982, -2.064495, -4.025513, 0, 0, 1, 1, 1,
-0.9206016, 0.4844884, -2.421411, 1, 0, 0, 1, 1,
-0.9197705, -0.5915917, -2.311677, 1, 0, 0, 1, 1,
-0.9189952, -0.02128047, -1.108404, 1, 0, 0, 1, 1,
-0.9188258, -0.08049408, -2.002352, 1, 0, 0, 1, 1,
-0.9181888, -0.8819427, -3.657274, 1, 0, 0, 1, 1,
-0.9134167, -0.9955192, -2.543111, 0, 0, 0, 1, 1,
-0.9097358, 0.2490853, -3.399569, 0, 0, 0, 1, 1,
-0.9084014, -1.977061, -0.9522012, 0, 0, 0, 1, 1,
-0.9076298, 1.363533, -0.5699573, 0, 0, 0, 1, 1,
-0.9000195, 0.1217264, -1.034061, 0, 0, 0, 1, 1,
-0.8994413, -0.2837866, -2.668165, 0, 0, 0, 1, 1,
-0.8985391, -0.9953564, -1.197117, 0, 0, 0, 1, 1,
-0.895887, 1.517311, -0.9787063, 1, 1, 1, 1, 1,
-0.8934515, -0.725614, -1.52997, 1, 1, 1, 1, 1,
-0.8889525, 0.3511512, -2.280719, 1, 1, 1, 1, 1,
-0.8841478, 1.266794, -2.902252, 1, 1, 1, 1, 1,
-0.8725379, 0.593275, -0.1760405, 1, 1, 1, 1, 1,
-0.8709627, -1.182714, -2.137787, 1, 1, 1, 1, 1,
-0.8642085, 0.1863251, -2.50082, 1, 1, 1, 1, 1,
-0.8596437, 1.362935, -0.07368152, 1, 1, 1, 1, 1,
-0.8589233, 1.45662, -1.704076, 1, 1, 1, 1, 1,
-0.8588134, -1.320093, -4.378473, 1, 1, 1, 1, 1,
-0.853486, 1.066734, -0.3278013, 1, 1, 1, 1, 1,
-0.8526952, 1.388776, -0.1872968, 1, 1, 1, 1, 1,
-0.8521493, -0.9522621, -4.044477, 1, 1, 1, 1, 1,
-0.837526, -2.219731, -3.068171, 1, 1, 1, 1, 1,
-0.8366405, -0.1439218, -2.529771, 1, 1, 1, 1, 1,
-0.8359175, -0.06951538, -3.308403, 0, 0, 1, 1, 1,
-0.8350174, -1.186853, -1.486519, 1, 0, 0, 1, 1,
-0.8322733, -1.702863, -0.5920885, 1, 0, 0, 1, 1,
-0.832026, -1.24299, -3.317971, 1, 0, 0, 1, 1,
-0.8313606, 0.7195729, -0.7359553, 1, 0, 0, 1, 1,
-0.8307477, -0.3664218, -1.49462, 1, 0, 0, 1, 1,
-0.8230857, 0.6890631, -0.7781245, 0, 0, 0, 1, 1,
-0.8225709, -0.6434278, -3.166218, 0, 0, 0, 1, 1,
-0.8212329, 1.083223, -0.9384709, 0, 0, 0, 1, 1,
-0.8182516, 0.0253423, -2.446339, 0, 0, 0, 1, 1,
-0.8035035, 1.315642, -0.3256914, 0, 0, 0, 1, 1,
-0.7978233, 2.13536, 0.05682142, 0, 0, 0, 1, 1,
-0.7975734, 0.5180691, -1.451108, 0, 0, 0, 1, 1,
-0.7847618, -0.08873578, -3.018009, 1, 1, 1, 1, 1,
-0.7819281, 0.7686848, -1.240061, 1, 1, 1, 1, 1,
-0.7793713, 0.1976116, -2.759115, 1, 1, 1, 1, 1,
-0.778439, 0.02835751, -2.479603, 1, 1, 1, 1, 1,
-0.7756444, -0.1631346, -0.7375887, 1, 1, 1, 1, 1,
-0.7743363, -0.08866977, -2.685449, 1, 1, 1, 1, 1,
-0.7742267, -0.07838377, -2.804892, 1, 1, 1, 1, 1,
-0.7620999, 0.5238748, -2.855676, 1, 1, 1, 1, 1,
-0.7611116, -0.5865877, 0.3780101, 1, 1, 1, 1, 1,
-0.744082, -0.01826178, -2.318775, 1, 1, 1, 1, 1,
-0.7415453, 0.5857781, -0.03772221, 1, 1, 1, 1, 1,
-0.7396415, 0.4965016, -1.365353, 1, 1, 1, 1, 1,
-0.7393448, 1.114126, -1.181672, 1, 1, 1, 1, 1,
-0.7355612, -0.1230612, -1.811488, 1, 1, 1, 1, 1,
-0.7342632, -1.707068, -1.874544, 1, 1, 1, 1, 1,
-0.731899, 2.212996, -0.6649024, 0, 0, 1, 1, 1,
-0.7272827, 1.894427, -0.4096991, 1, 0, 0, 1, 1,
-0.7219765, -0.04793367, -1.422954, 1, 0, 0, 1, 1,
-0.7216436, -1.184761, -3.024309, 1, 0, 0, 1, 1,
-0.7214249, -0.0200457, -3.365633, 1, 0, 0, 1, 1,
-0.7192573, 0.8968547, 0.1095382, 1, 0, 0, 1, 1,
-0.7172773, -1.30495, -2.50243, 0, 0, 0, 1, 1,
-0.7080395, -0.5881325, -3.424253, 0, 0, 0, 1, 1,
-0.7065051, 0.1459667, -1.469751, 0, 0, 0, 1, 1,
-0.6952811, 1.312539, 0.03761218, 0, 0, 0, 1, 1,
-0.6926852, 3.120296, -0.2126492, 0, 0, 0, 1, 1,
-0.6878307, -0.2367025, -2.585099, 0, 0, 0, 1, 1,
-0.6874168, -0.1282853, -1.225323, 0, 0, 0, 1, 1,
-0.6840789, 0.3063469, -2.384049, 1, 1, 1, 1, 1,
-0.6767269, 1.491957, 0.6356608, 1, 1, 1, 1, 1,
-0.6766706, -1.382889, -2.941971, 1, 1, 1, 1, 1,
-0.6704612, 1.286422, 0.1399722, 1, 1, 1, 1, 1,
-0.6654289, 0.1441626, 1.183312, 1, 1, 1, 1, 1,
-0.6653311, -0.8350038, -4.175066, 1, 1, 1, 1, 1,
-0.6628945, 0.7950472, -0.9718555, 1, 1, 1, 1, 1,
-0.6623617, 0.01928161, -2.423186, 1, 1, 1, 1, 1,
-0.6617648, -0.8997846, -2.391799, 1, 1, 1, 1, 1,
-0.656167, -1.042529, -1.204837, 1, 1, 1, 1, 1,
-0.6550046, -0.4538763, -2.860265, 1, 1, 1, 1, 1,
-0.6545631, 0.4078908, -0.3717759, 1, 1, 1, 1, 1,
-0.6530297, -0.1660361, -0.5588966, 1, 1, 1, 1, 1,
-0.6525742, -1.224679, -0.9547083, 1, 1, 1, 1, 1,
-0.6522282, 0.03690385, -3.069828, 1, 1, 1, 1, 1,
-0.6502628, 0.6464189, -0.6020835, 0, 0, 1, 1, 1,
-0.6494524, -0.551497, -1.365079, 1, 0, 0, 1, 1,
-0.64915, 0.7690942, -1.988424, 1, 0, 0, 1, 1,
-0.6490351, 0.424013, -2.97706, 1, 0, 0, 1, 1,
-0.6451621, 0.5654906, -0.3221056, 1, 0, 0, 1, 1,
-0.6383727, -1.18351, -1.20508, 1, 0, 0, 1, 1,
-0.6360134, -1.107136, -1.967168, 0, 0, 0, 1, 1,
-0.6340597, 0.7382873, -2.34882, 0, 0, 0, 1, 1,
-0.6289715, 0.2683486, -0.3093887, 0, 0, 0, 1, 1,
-0.628247, 0.574183, 0.2507198, 0, 0, 0, 1, 1,
-0.6277509, 0.4249862, 0.1850912, 0, 0, 0, 1, 1,
-0.6272723, 1.56862, 0.8885707, 0, 0, 0, 1, 1,
-0.6228451, 1.169025, -2.182271, 0, 0, 0, 1, 1,
-0.6210209, 0.1998155, 0.3873304, 1, 1, 1, 1, 1,
-0.620272, 2.068658, 0.5894982, 1, 1, 1, 1, 1,
-0.6195595, 1.414671, 0.3684686, 1, 1, 1, 1, 1,
-0.6161423, 1.582476, -0.6955888, 1, 1, 1, 1, 1,
-0.6147252, 0.1772055, -2.098523, 1, 1, 1, 1, 1,
-0.6097802, 2.070403, -0.7528235, 1, 1, 1, 1, 1,
-0.608717, 0.7491726, 1.392345, 1, 1, 1, 1, 1,
-0.6049924, -0.04379303, -1.927793, 1, 1, 1, 1, 1,
-0.6042553, 0.03827488, -4.081247, 1, 1, 1, 1, 1,
-0.6015714, 0.01505731, -1.448478, 1, 1, 1, 1, 1,
-0.6004992, 2.067577, -0.805814, 1, 1, 1, 1, 1,
-0.5989594, 2.015558, 0.2680483, 1, 1, 1, 1, 1,
-0.5975166, -0.1471745, -3.550568, 1, 1, 1, 1, 1,
-0.5949063, 0.3500353, -2.572518, 1, 1, 1, 1, 1,
-0.592938, -0.3900944, -1.68287, 1, 1, 1, 1, 1,
-0.5897467, -1.705755, -3.238913, 0, 0, 1, 1, 1,
-0.5877614, 0.7872154, -1.717498, 1, 0, 0, 1, 1,
-0.5836861, 0.3247868, -2.216157, 1, 0, 0, 1, 1,
-0.5828993, 0.2332745, -0.8426999, 1, 0, 0, 1, 1,
-0.5814798, 2.060883, -0.2361487, 1, 0, 0, 1, 1,
-0.5747115, -0.07299213, -1.383716, 1, 0, 0, 1, 1,
-0.5691387, -0.669445, -1.30497, 0, 0, 0, 1, 1,
-0.5689097, 0.5061415, -2.012107, 0, 0, 0, 1, 1,
-0.5682653, 0.3388095, -0.8976479, 0, 0, 0, 1, 1,
-0.5669219, 0.239008, -0.8289994, 0, 0, 0, 1, 1,
-0.5603377, 0.3236372, -0.8875451, 0, 0, 0, 1, 1,
-0.5571964, -0.3416796, -1.592864, 0, 0, 0, 1, 1,
-0.5515503, 0.9283913, -0.7532596, 0, 0, 0, 1, 1,
-0.5512401, 0.6332185, -0.8590494, 1, 1, 1, 1, 1,
-0.5456659, -1.415179, -3.017068, 1, 1, 1, 1, 1,
-0.5444296, 1.475885, 1.482347, 1, 1, 1, 1, 1,
-0.5433001, -0.05115464, 0.1098307, 1, 1, 1, 1, 1,
-0.5412688, 0.2285801, -0.7543154, 1, 1, 1, 1, 1,
-0.5396819, -0.6817389, -1.713676, 1, 1, 1, 1, 1,
-0.5346603, 1.572235, -2.622342, 1, 1, 1, 1, 1,
-0.5324508, 0.6918584, -2.152434, 1, 1, 1, 1, 1,
-0.5308554, -1.203363, -2.788852, 1, 1, 1, 1, 1,
-0.5305973, -1.539587, -3.346822, 1, 1, 1, 1, 1,
-0.5297901, 0.5190952, -1.518497, 1, 1, 1, 1, 1,
-0.5191061, -1.002846, -1.661415, 1, 1, 1, 1, 1,
-0.5168437, -0.08298189, -1.060466, 1, 1, 1, 1, 1,
-0.5108845, -0.3534324, -2.735211, 1, 1, 1, 1, 1,
-0.5048959, 1.276906, 0.07526217, 1, 1, 1, 1, 1,
-0.5043216, -0.649673, -2.950568, 0, 0, 1, 1, 1,
-0.5030335, -0.6696545, -2.306055, 1, 0, 0, 1, 1,
-0.498433, -1.402593, -1.890714, 1, 0, 0, 1, 1,
-0.4980677, -0.08582652, -1.245328, 1, 0, 0, 1, 1,
-0.4977145, -0.126902, -1.879633, 1, 0, 0, 1, 1,
-0.4970405, 2.201842, -0.8820592, 1, 0, 0, 1, 1,
-0.4959061, -0.8550175, -1.936944, 0, 0, 0, 1, 1,
-0.4952303, -0.8639658, -0.759445, 0, 0, 0, 1, 1,
-0.4897863, 1.317215, 0.7918184, 0, 0, 0, 1, 1,
-0.4895618, -1.604202, -2.343526, 0, 0, 0, 1, 1,
-0.4891098, -0.4507717, -2.867788, 0, 0, 0, 1, 1,
-0.4863271, 0.5956842, 0.01627269, 0, 0, 0, 1, 1,
-0.4850887, -0.2352034, -2.254412, 0, 0, 0, 1, 1,
-0.4752537, 0.8502102, 1.114461, 1, 1, 1, 1, 1,
-0.4691741, -1.530082, -3.433639, 1, 1, 1, 1, 1,
-0.4679608, -0.9060118, -1.9458, 1, 1, 1, 1, 1,
-0.4662742, 0.127993, -0.614316, 1, 1, 1, 1, 1,
-0.4648826, 0.06532833, -0.7786731, 1, 1, 1, 1, 1,
-0.4642995, -0.2789204, -2.719666, 1, 1, 1, 1, 1,
-0.4617053, -1.813837, -2.474511, 1, 1, 1, 1, 1,
-0.4616844, 1.381751, -0.4597563, 1, 1, 1, 1, 1,
-0.4613055, 0.3643028, -1.319581, 1, 1, 1, 1, 1,
-0.4531524, 0.2614425, -2.459826, 1, 1, 1, 1, 1,
-0.453062, -0.9123279, -0.8795496, 1, 1, 1, 1, 1,
-0.4464701, -0.3472311, -1.098224, 1, 1, 1, 1, 1,
-0.4432585, 0.4796188, -2.373337, 1, 1, 1, 1, 1,
-0.4417906, -0.4882638, -1.533003, 1, 1, 1, 1, 1,
-0.4317588, -2.021899, -2.657383, 1, 1, 1, 1, 1,
-0.4278614, 0.6180905, 0.5508673, 0, 0, 1, 1, 1,
-0.4264038, -2.440367, -2.087255, 1, 0, 0, 1, 1,
-0.4256926, -0.360679, -2.35602, 1, 0, 0, 1, 1,
-0.4235489, -0.3828518, -2.165341, 1, 0, 0, 1, 1,
-0.4196478, -0.1804535, -0.4360609, 1, 0, 0, 1, 1,
-0.4126187, 0.5167332, 0.6814672, 1, 0, 0, 1, 1,
-0.409469, -0.7347409, -2.785923, 0, 0, 0, 1, 1,
-0.4029495, -0.8221911, -2.263628, 0, 0, 0, 1, 1,
-0.3988762, -0.9348909, -1.367801, 0, 0, 0, 1, 1,
-0.3943554, 1.567152, 0.693314, 0, 0, 0, 1, 1,
-0.387058, 0.1944861, -1.95207, 0, 0, 0, 1, 1,
-0.3778267, 2.548139, -1.885846, 0, 0, 0, 1, 1,
-0.3752582, -0.6851336, -2.606113, 0, 0, 0, 1, 1,
-0.3750989, -0.3745705, -2.539765, 1, 1, 1, 1, 1,
-0.3736788, -1.081023, -3.535729, 1, 1, 1, 1, 1,
-0.3714304, 1.246855, -1.431748, 1, 1, 1, 1, 1,
-0.3663033, 1.422412, -0.1613128, 1, 1, 1, 1, 1,
-0.363968, 2.052136, 0.2405094, 1, 1, 1, 1, 1,
-0.3597642, -0.8639168, -3.729191, 1, 1, 1, 1, 1,
-0.3586818, -0.2156599, -2.557372, 1, 1, 1, 1, 1,
-0.3560031, -2.461106, -3.80664, 1, 1, 1, 1, 1,
-0.3511053, 0.507588, 0.6030439, 1, 1, 1, 1, 1,
-0.3491333, -0.1316474, -2.306982, 1, 1, 1, 1, 1,
-0.3402391, 0.5968619, 1.434221, 1, 1, 1, 1, 1,
-0.3392738, 0.5053292, -1.928125, 1, 1, 1, 1, 1,
-0.3376258, 2.298148, 1.663061, 1, 1, 1, 1, 1,
-0.3360206, 1.89045, 0.2885588, 1, 1, 1, 1, 1,
-0.3318101, -0.9813243, -2.779885, 1, 1, 1, 1, 1,
-0.3307156, 2.175576, -1.838225, 0, 0, 1, 1, 1,
-0.3266714, 0.6845233, -0.08634281, 1, 0, 0, 1, 1,
-0.3250481, 0.8240007, -0.9052896, 1, 0, 0, 1, 1,
-0.3245541, 0.4969479, -0.724143, 1, 0, 0, 1, 1,
-0.315882, -1.674933, -2.668269, 1, 0, 0, 1, 1,
-0.3120979, 1.766502, -0.8028986, 1, 0, 0, 1, 1,
-0.297501, -0.3015017, -1.701895, 0, 0, 0, 1, 1,
-0.2945864, 1.644089, -1.302616, 0, 0, 0, 1, 1,
-0.2937706, 0.1455386, -1.267279, 0, 0, 0, 1, 1,
-0.2916352, -0.5160387, -3.881236, 0, 0, 0, 1, 1,
-0.2913178, -0.4309113, -2.824659, 0, 0, 0, 1, 1,
-0.2892733, -0.2421051, -2.235168, 0, 0, 0, 1, 1,
-0.2892315, -0.2938473, -2.384348, 0, 0, 0, 1, 1,
-0.2830958, -0.01898239, -1.922006, 1, 1, 1, 1, 1,
-0.2812946, -1.770408, -2.966475, 1, 1, 1, 1, 1,
-0.2775729, -0.05603193, -1.837933, 1, 1, 1, 1, 1,
-0.2762565, -0.4758084, -2.85472, 1, 1, 1, 1, 1,
-0.2739105, -0.1292669, -1.488904, 1, 1, 1, 1, 1,
-0.2711999, -0.1902462, -0.1920241, 1, 1, 1, 1, 1,
-0.2703822, 0.5571573, -1.019326, 1, 1, 1, 1, 1,
-0.2642899, 1.382073, 0.7792723, 1, 1, 1, 1, 1,
-0.2619295, 2.766469, -1.722155, 1, 1, 1, 1, 1,
-0.2617016, -0.2764812, -2.605919, 1, 1, 1, 1, 1,
-0.2604853, 2.335449, 0.6538786, 1, 1, 1, 1, 1,
-0.2590196, -0.7474248, -3.218026, 1, 1, 1, 1, 1,
-0.2487991, 1.606763, -0.3030928, 1, 1, 1, 1, 1,
-0.245604, -0.416796, -1.118615, 1, 1, 1, 1, 1,
-0.2454123, 0.5122294, 0.2271502, 1, 1, 1, 1, 1,
-0.2444068, -0.5773246, -2.153315, 0, 0, 1, 1, 1,
-0.2388524, 0.5302896, -0.5751124, 1, 0, 0, 1, 1,
-0.2375859, -0.2518454, -2.668128, 1, 0, 0, 1, 1,
-0.2324029, 0.0348971, -1.45585, 1, 0, 0, 1, 1,
-0.2322908, 1.081111, 0.6975762, 1, 0, 0, 1, 1,
-0.2312866, 0.04218585, -2.031717, 1, 0, 0, 1, 1,
-0.2242091, -0.5685695, -3.70164, 0, 0, 0, 1, 1,
-0.2190051, -0.5440924, -2.524766, 0, 0, 0, 1, 1,
-0.2150697, -1.47711, -1.504591, 0, 0, 0, 1, 1,
-0.2110742, 0.5402877, -0.6982591, 0, 0, 0, 1, 1,
-0.20537, 0.006753026, -2.045726, 0, 0, 0, 1, 1,
-0.2043102, -0.533109, -2.50971, 0, 0, 0, 1, 1,
-0.2030739, -1.950123, -1.783153, 0, 0, 0, 1, 1,
-0.2021868, -1.078016, -3.23002, 1, 1, 1, 1, 1,
-0.201389, -0.8309413, -3.35987, 1, 1, 1, 1, 1,
-0.1977127, -0.8278243, -2.567145, 1, 1, 1, 1, 1,
-0.197581, 0.5227008, 1.388184, 1, 1, 1, 1, 1,
-0.1962273, 0.6731911, 0.4235941, 1, 1, 1, 1, 1,
-0.1954881, 0.8893859, -0.5007582, 1, 1, 1, 1, 1,
-0.1923401, -0.09598043, -3.023792, 1, 1, 1, 1, 1,
-0.1886806, -0.5097815, -4.547972, 1, 1, 1, 1, 1,
-0.187812, 0.3826764, -0.6619527, 1, 1, 1, 1, 1,
-0.1837174, -0.6346076, -3.255584, 1, 1, 1, 1, 1,
-0.1831508, 0.3301052, -0.9688751, 1, 1, 1, 1, 1,
-0.1829738, -0.177615, -2.204609, 1, 1, 1, 1, 1,
-0.1824515, 1.617964, 0.9969875, 1, 1, 1, 1, 1,
-0.1807489, 0.06374194, -2.399933, 1, 1, 1, 1, 1,
-0.1806091, -0.3779072, -0.5644858, 1, 1, 1, 1, 1,
-0.1800863, -0.5552481, -3.451148, 0, 0, 1, 1, 1,
-0.1765291, 0.1454141, -1.576542, 1, 0, 0, 1, 1,
-0.1764137, 1.410157, -2.157624, 1, 0, 0, 1, 1,
-0.172325, 1.122481, -0.9816657, 1, 0, 0, 1, 1,
-0.1698625, 0.3153496, 0.3852715, 1, 0, 0, 1, 1,
-0.1678649, 0.6203675, -1.09257, 1, 0, 0, 1, 1,
-0.163983, 0.156977, -0.3915118, 0, 0, 0, 1, 1,
-0.1639645, -1.261841, -3.443158, 0, 0, 0, 1, 1,
-0.1596505, 0.3210235, -0.07361437, 0, 0, 0, 1, 1,
-0.1547543, 0.0006008585, -1.769462, 0, 0, 0, 1, 1,
-0.1503008, -0.2999768, -3.509031, 0, 0, 0, 1, 1,
-0.1490359, -0.270461, -2.121921, 0, 0, 0, 1, 1,
-0.1485397, 0.2848217, -0.7776619, 0, 0, 0, 1, 1,
-0.1459681, 0.8187946, -1.38181, 1, 1, 1, 1, 1,
-0.1458715, -0.57989, -3.464874, 1, 1, 1, 1, 1,
-0.1426418, -0.5682423, -3.012636, 1, 1, 1, 1, 1,
-0.1370756, 0.8240212, -0.4297091, 1, 1, 1, 1, 1,
-0.1362551, -0.9313735, -3.189351, 1, 1, 1, 1, 1,
-0.1338442, 0.3133375, -1.305217, 1, 1, 1, 1, 1,
-0.1283185, -0.5374653, -0.8598911, 1, 1, 1, 1, 1,
-0.122766, 0.4293382, -1.322487, 1, 1, 1, 1, 1,
-0.1224087, -0.9044847, -3.367824, 1, 1, 1, 1, 1,
-0.121578, -1.106286, -4.061546, 1, 1, 1, 1, 1,
-0.1165642, 0.8920948, 1.302052, 1, 1, 1, 1, 1,
-0.1151158, 1.850391, 1.014986, 1, 1, 1, 1, 1,
-0.1127987, -0.3372459, -1.689774, 1, 1, 1, 1, 1,
-0.1071842, -0.6645989, -3.854017, 1, 1, 1, 1, 1,
-0.1070043, -0.4602154, -2.420702, 1, 1, 1, 1, 1,
-0.09979668, -0.1900612, -1.703307, 0, 0, 1, 1, 1,
-0.09653586, 1.627697, 0.6798799, 1, 0, 0, 1, 1,
-0.09634564, 0.04255046, -1.28417, 1, 0, 0, 1, 1,
-0.09501278, -0.9636536, -1.998611, 1, 0, 0, 1, 1,
-0.09221021, 0.1993613, 0.4573324, 1, 0, 0, 1, 1,
-0.09189292, 1.301291, 0.2788249, 1, 0, 0, 1, 1,
-0.08862182, -0.1170012, -3.210865, 0, 0, 0, 1, 1,
-0.08421215, 2.608432, 0.07092619, 0, 0, 0, 1, 1,
-0.08383986, -0.553793, -4.372068, 0, 0, 0, 1, 1,
-0.07866537, -0.3429806, -3.511803, 0, 0, 0, 1, 1,
-0.07767034, 1.535078, 1.327378, 0, 0, 0, 1, 1,
-0.07628394, -1.645857, -4.852029, 0, 0, 0, 1, 1,
-0.07131725, -0.6417069, -0.5048538, 0, 0, 0, 1, 1,
-0.06361251, -2.249691, -3.08896, 1, 1, 1, 1, 1,
-0.06073344, 1.133341, 1.217872, 1, 1, 1, 1, 1,
-0.05954152, -0.9659605, -2.191152, 1, 1, 1, 1, 1,
-0.05949655, 0.4488776, 1.706373, 1, 1, 1, 1, 1,
-0.05831329, -0.3084415, -0.7372856, 1, 1, 1, 1, 1,
-0.05659857, -1.51699, -4.80647, 1, 1, 1, 1, 1,
-0.05468761, 0.008075004, -1.343925, 1, 1, 1, 1, 1,
-0.0533304, 0.7640629, -1.604126, 1, 1, 1, 1, 1,
-0.04954443, -0.7036527, -3.556643, 1, 1, 1, 1, 1,
-0.04420263, -0.7322095, -3.108463, 1, 1, 1, 1, 1,
-0.04417727, 0.09112912, -1.241283, 1, 1, 1, 1, 1,
-0.04409977, -0.935886, -4.104437, 1, 1, 1, 1, 1,
-0.04402726, -1.047505, -2.771333, 1, 1, 1, 1, 1,
-0.03968013, -1.303134, -4.726094, 1, 1, 1, 1, 1,
-0.03819791, 0.4375871, -1.813816, 1, 1, 1, 1, 1,
-0.02984663, -0.2326143, -2.327521, 0, 0, 1, 1, 1,
-0.02965993, -0.9342981, -3.641461, 1, 0, 0, 1, 1,
-0.02927519, -0.3079695, -3.841147, 1, 0, 0, 1, 1,
-0.02700383, -0.2863718, -2.06657, 1, 0, 0, 1, 1,
-0.02441507, 0.1112959, -0.4784983, 1, 0, 0, 1, 1,
-0.02276199, -0.9909501, -3.30246, 1, 0, 0, 1, 1,
-0.02077651, 0.7635974, 1.716061, 0, 0, 0, 1, 1,
-0.01960165, 0.8866363, -1.936409, 0, 0, 0, 1, 1,
-0.01874551, 0.4890082, -0.08937544, 0, 0, 0, 1, 1,
-0.01308936, 0.0982931, -0.2742443, 0, 0, 0, 1, 1,
-0.008023268, -0.4069957, -4.923042, 0, 0, 0, 1, 1,
-0.004026234, 0.3722541, 0.02661582, 0, 0, 0, 1, 1,
-0.002035499, 0.2991824, -0.42546, 0, 0, 0, 1, 1,
-0.001461598, 1.250962, -0.2316703, 1, 1, 1, 1, 1,
-0.0009721471, 0.2698675, -0.5522221, 1, 1, 1, 1, 1,
-0.0005220138, 1.154168, -0.1220044, 1, 1, 1, 1, 1,
0.000153426, 0.4534954, -2.245763, 1, 1, 1, 1, 1,
0.0004530234, -2.111361, 3.24057, 1, 1, 1, 1, 1,
0.006720772, 0.4240412, 1.532505, 1, 1, 1, 1, 1,
0.009716239, 0.6562384, -0.8338983, 1, 1, 1, 1, 1,
0.01817768, 0.08540016, 1.582978, 1, 1, 1, 1, 1,
0.01912374, -0.2935416, 2.069327, 1, 1, 1, 1, 1,
0.0213637, 0.8130775, -0.8225624, 1, 1, 1, 1, 1,
0.02358053, -0.890892, 0.7794178, 1, 1, 1, 1, 1,
0.02674187, 1.637023, 1.343996, 1, 1, 1, 1, 1,
0.03445211, -1.251399, 3.757597, 1, 1, 1, 1, 1,
0.03464751, 0.3999462, -1.991231, 1, 1, 1, 1, 1,
0.03476768, 0.1046491, -0.4513184, 1, 1, 1, 1, 1,
0.03532265, 0.3270765, -0.1528596, 0, 0, 1, 1, 1,
0.03934802, 1.438231, 1.043708, 1, 0, 0, 1, 1,
0.03969553, 0.4432043, -0.5354832, 1, 0, 0, 1, 1,
0.04129141, 0.5413, 0.1266094, 1, 0, 0, 1, 1,
0.04389844, -0.9123437, 0.9091737, 1, 0, 0, 1, 1,
0.04624239, -0.1285304, 2.666, 1, 0, 0, 1, 1,
0.0499777, -2.750013, 2.767722, 0, 0, 0, 1, 1,
0.05120387, 0.8301509, -0.5927555, 0, 0, 0, 1, 1,
0.05199713, -0.9623411, 5.368826, 0, 0, 0, 1, 1,
0.05234963, 0.2165058, 0.7568409, 0, 0, 0, 1, 1,
0.05488632, -0.1467115, 2.077797, 0, 0, 0, 1, 1,
0.0559958, -0.08775963, 1.949625, 0, 0, 0, 1, 1,
0.05933184, -2.236434, 3.125892, 0, 0, 0, 1, 1,
0.06380015, -1.031051, 3.101973, 1, 1, 1, 1, 1,
0.06614204, 0.8260605, 0.6807683, 1, 1, 1, 1, 1,
0.06786282, -0.8786747, 2.25091, 1, 1, 1, 1, 1,
0.07020465, -1.023236, 2.274825, 1, 1, 1, 1, 1,
0.07497178, 0.08936398, -0.9019278, 1, 1, 1, 1, 1,
0.07889221, 0.4523571, -0.7959901, 1, 1, 1, 1, 1,
0.08593978, -1.428608, 2.727143, 1, 1, 1, 1, 1,
0.08749289, -1.357551, 4.574053, 1, 1, 1, 1, 1,
0.09406575, -1.242057, 3.429016, 1, 1, 1, 1, 1,
0.09478831, 0.8792516, 1.541363, 1, 1, 1, 1, 1,
0.09595592, 0.9837167, 0.8654875, 1, 1, 1, 1, 1,
0.0973509, 0.2398724, -0.7607267, 1, 1, 1, 1, 1,
0.09760211, -0.722151, 3.72435, 1, 1, 1, 1, 1,
0.1015834, -1.21886, 1.132155, 1, 1, 1, 1, 1,
0.1047324, 0.08641447, 1.18387, 1, 1, 1, 1, 1,
0.1079644, 0.09627119, 1.312525, 0, 0, 1, 1, 1,
0.1100878, -0.1569009, 2.69037, 1, 0, 0, 1, 1,
0.111, -0.7130473, 1.560221, 1, 0, 0, 1, 1,
0.1117736, 0.1935539, 1.018831, 1, 0, 0, 1, 1,
0.112873, 0.01334146, 2.141921, 1, 0, 0, 1, 1,
0.1153284, -0.8005143, 2.424708, 1, 0, 0, 1, 1,
0.1202399, 0.4654594, 0.8193702, 0, 0, 0, 1, 1,
0.1209872, 1.582119, -1.650872, 0, 0, 0, 1, 1,
0.1274544, 0.9824464, -0.1513784, 0, 0, 0, 1, 1,
0.1284288, -1.421807, 2.303599, 0, 0, 0, 1, 1,
0.1331153, 1.710089, 0.110984, 0, 0, 0, 1, 1,
0.1342281, -0.3325815, 2.394477, 0, 0, 0, 1, 1,
0.1402841, -0.3235386, 2.921643, 0, 0, 0, 1, 1,
0.1413365, 1.221115, 0.1870645, 1, 1, 1, 1, 1,
0.1483534, 1.156352, 0.03526261, 1, 1, 1, 1, 1,
0.1495593, 0.3032828, -0.01128708, 1, 1, 1, 1, 1,
0.150153, -1.694776, 2.983015, 1, 1, 1, 1, 1,
0.152051, 0.6861094, 0.768582, 1, 1, 1, 1, 1,
0.1563127, -1.014385, 0.8295443, 1, 1, 1, 1, 1,
0.1579943, -0.8032773, 2.792912, 1, 1, 1, 1, 1,
0.1633923, 0.936075, 0.09782153, 1, 1, 1, 1, 1,
0.1641498, 1.948629, 0.8574059, 1, 1, 1, 1, 1,
0.1642917, -0.8507812, 3.30166, 1, 1, 1, 1, 1,
0.1645976, 0.6448932, 0.1121835, 1, 1, 1, 1, 1,
0.1694903, 0.09588811, 1.726539, 1, 1, 1, 1, 1,
0.172268, 0.08257572, 0.6496376, 1, 1, 1, 1, 1,
0.1738568, -0.3839927, 2.344217, 1, 1, 1, 1, 1,
0.1744909, 1.851823, -0.08752566, 1, 1, 1, 1, 1,
0.1752345, 0.4059214, 1.991781, 0, 0, 1, 1, 1,
0.1787287, 0.0519352, 3.224135, 1, 0, 0, 1, 1,
0.1923883, -0.6408805, 2.527112, 1, 0, 0, 1, 1,
0.1948595, -0.3092849, 3.328308, 1, 0, 0, 1, 1,
0.198024, -0.1269148, 0.8605478, 1, 0, 0, 1, 1,
0.1989865, 1.356973, 1.145432, 1, 0, 0, 1, 1,
0.199157, 0.9911802, 0.6043483, 0, 0, 0, 1, 1,
0.2026452, 1.03923, 0.5924578, 0, 0, 0, 1, 1,
0.2039441, -0.7792495, 3.998857, 0, 0, 0, 1, 1,
0.2078632, -0.8056455, 2.780623, 0, 0, 0, 1, 1,
0.2092664, 1.316855, 1.123304, 0, 0, 0, 1, 1,
0.2100501, 0.08394174, 0.3279535, 0, 0, 0, 1, 1,
0.2140727, 0.4025254, -0.5790349, 0, 0, 0, 1, 1,
0.2151828, 2.618814, 1.708136, 1, 1, 1, 1, 1,
0.2194715, -0.3321299, 3.156937, 1, 1, 1, 1, 1,
0.22235, -1.697967, 2.900772, 1, 1, 1, 1, 1,
0.226946, -0.1357776, 1.524211, 1, 1, 1, 1, 1,
0.2286168, 0.3563778, 1.083177, 1, 1, 1, 1, 1,
0.2301202, -0.4128553, 1.234794, 1, 1, 1, 1, 1,
0.2321171, 0.3484349, 0.2440884, 1, 1, 1, 1, 1,
0.2341211, 0.6330574, -0.2849418, 1, 1, 1, 1, 1,
0.2343623, 1.385229, -0.2936811, 1, 1, 1, 1, 1,
0.2370841, -0.1912013, 2.488855, 1, 1, 1, 1, 1,
0.2400052, 0.3962845, 0.6825197, 1, 1, 1, 1, 1,
0.2406577, 0.2310946, 0.3081462, 1, 1, 1, 1, 1,
0.2425627, 0.6898282, 1.179736, 1, 1, 1, 1, 1,
0.2459201, -0.9812875, 3.478323, 1, 1, 1, 1, 1,
0.2463782, 1.368946, 0.3574928, 1, 1, 1, 1, 1,
0.246566, -0.0539373, 1.763564, 0, 0, 1, 1, 1,
0.2470301, -0.2567298, 2.266421, 1, 0, 0, 1, 1,
0.2594349, -2.200923, 2.69267, 1, 0, 0, 1, 1,
0.2600934, 1.006514, -0.189161, 1, 0, 0, 1, 1,
0.2617078, -0.209949, 1.578448, 1, 0, 0, 1, 1,
0.2650095, 0.1218095, -0.02593243, 1, 0, 0, 1, 1,
0.265393, -1.240408, 1.738495, 0, 0, 0, 1, 1,
0.2754197, -0.1435206, 2.102329, 0, 0, 0, 1, 1,
0.2755839, -1.128815, 2.531222, 0, 0, 0, 1, 1,
0.2761483, -0.6813151, 3.382738, 0, 0, 0, 1, 1,
0.278382, 0.5865726, -0.09193929, 0, 0, 0, 1, 1,
0.2789626, 0.4343062, -0.6432722, 0, 0, 0, 1, 1,
0.2818872, -0.5895102, 3.398267, 0, 0, 0, 1, 1,
0.2819366, 1.042967, 0.6711947, 1, 1, 1, 1, 1,
0.2900554, -0.2857598, 2.337354, 1, 1, 1, 1, 1,
0.2928704, -1.996875, 1.223014, 1, 1, 1, 1, 1,
0.293175, -0.8515099, 3.256311, 1, 1, 1, 1, 1,
0.2986999, -0.006144688, 1.3337, 1, 1, 1, 1, 1,
0.2987225, -0.9231003, 2.571637, 1, 1, 1, 1, 1,
0.30055, -0.5834265, 3.389953, 1, 1, 1, 1, 1,
0.3028679, 1.043187, -1.201392, 1, 1, 1, 1, 1,
0.3031556, 0.713479, -0.148396, 1, 1, 1, 1, 1,
0.3043618, 0.5719031, -0.02843141, 1, 1, 1, 1, 1,
0.308744, -0.4413826, 3.27754, 1, 1, 1, 1, 1,
0.3092017, -0.01779522, 0.14317, 1, 1, 1, 1, 1,
0.3161323, -0.8963148, 2.705854, 1, 1, 1, 1, 1,
0.3167298, -0.7188365, 2.590223, 1, 1, 1, 1, 1,
0.3185455, -1.146545, 2.451165, 1, 1, 1, 1, 1,
0.3208244, 0.237919, 0.4994509, 0, 0, 1, 1, 1,
0.3248422, 0.02798281, 0.8510551, 1, 0, 0, 1, 1,
0.325081, -0.4627813, 1.663587, 1, 0, 0, 1, 1,
0.3338363, 0.04771217, 2.354564, 1, 0, 0, 1, 1,
0.3400078, -0.1908087, 0.6577377, 1, 0, 0, 1, 1,
0.3419929, 0.3361716, 0.882183, 1, 0, 0, 1, 1,
0.3432365, -2.000934, 2.339022, 0, 0, 0, 1, 1,
0.346442, -1.24296, 0.8901668, 0, 0, 0, 1, 1,
0.3561182, 0.8081206, 0.3581877, 0, 0, 0, 1, 1,
0.3589421, 0.4756606, -0.1471336, 0, 0, 0, 1, 1,
0.3601374, 0.1435274, 1.565201, 0, 0, 0, 1, 1,
0.3628215, 0.707029, -0.7350335, 0, 0, 0, 1, 1,
0.3709399, -0.09278173, 0.9614244, 0, 0, 0, 1, 1,
0.3729448, -0.4273324, 3.018638, 1, 1, 1, 1, 1,
0.3758423, -0.907402, 1.435673, 1, 1, 1, 1, 1,
0.3762862, -0.2050345, 2.975926, 1, 1, 1, 1, 1,
0.3799786, 2.791081, 0.5244904, 1, 1, 1, 1, 1,
0.381228, 0.4475315, 0.70173, 1, 1, 1, 1, 1,
0.3820505, -0.9259154, 4.034523, 1, 1, 1, 1, 1,
0.3825555, -0.3925523, 1.848588, 1, 1, 1, 1, 1,
0.3829938, -0.3436311, 2.911242, 1, 1, 1, 1, 1,
0.3856663, -0.1497262, 0.5971797, 1, 1, 1, 1, 1,
0.3886364, 0.313556, 0.8305215, 1, 1, 1, 1, 1,
0.3905484, 0.7917059, 0.3451138, 1, 1, 1, 1, 1,
0.3906743, -0.5896574, 2.521671, 1, 1, 1, 1, 1,
0.3938416, -1.695529, 2.186554, 1, 1, 1, 1, 1,
0.3941972, -0.5319157, 2.040007, 1, 1, 1, 1, 1,
0.3947937, 0.7192745, -1.123561, 1, 1, 1, 1, 1,
0.3950388, -1.268091, 3.530616, 0, 0, 1, 1, 1,
0.3959269, 0.7073684, 0.6453593, 1, 0, 0, 1, 1,
0.3961346, -0.425032, 1.208824, 1, 0, 0, 1, 1,
0.3967, -0.5099275, 2.287096, 1, 0, 0, 1, 1,
0.3983834, 0.4504349, 1.202069, 1, 0, 0, 1, 1,
0.4016425, 0.7063043, -0.8571552, 1, 0, 0, 1, 1,
0.4023592, -1.096408, 0.5727479, 0, 0, 0, 1, 1,
0.4043985, -0.3370679, 0.5806274, 0, 0, 0, 1, 1,
0.4063503, 1.13953, -1.229719, 0, 0, 0, 1, 1,
0.4080775, 1.297921, -0.989464, 0, 0, 0, 1, 1,
0.4106174, -0.8355215, 0.9586372, 0, 0, 0, 1, 1,
0.4160317, -0.1608092, 1.579916, 0, 0, 0, 1, 1,
0.4193738, -0.4767392, 2.978437, 0, 0, 0, 1, 1,
0.4195602, -1.12286, 0.6618577, 1, 1, 1, 1, 1,
0.4223569, -0.7827262, 2.960617, 1, 1, 1, 1, 1,
0.4246112, -1.616969, 4.855932, 1, 1, 1, 1, 1,
0.4256091, -1.311456, 2.792201, 1, 1, 1, 1, 1,
0.428389, 1.672624, 0.832876, 1, 1, 1, 1, 1,
0.432393, -0.4014446, 2.098996, 1, 1, 1, 1, 1,
0.438923, 0.9641591, 0.8839597, 1, 1, 1, 1, 1,
0.4397495, -0.2142602, 3.263247, 1, 1, 1, 1, 1,
0.4474077, -0.173131, 1.415687, 1, 1, 1, 1, 1,
0.4515091, -1.25975, 2.611088, 1, 1, 1, 1, 1,
0.4534987, -0.1378372, 3.089239, 1, 1, 1, 1, 1,
0.4574834, -0.7777294, 2.621308, 1, 1, 1, 1, 1,
0.4604354, 1.722404, -1.356421, 1, 1, 1, 1, 1,
0.4658798, -1.107238, 3.1746, 1, 1, 1, 1, 1,
0.4711335, -0.2180384, 3.717897, 1, 1, 1, 1, 1,
0.4731558, 0.4203928, -0.4307238, 0, 0, 1, 1, 1,
0.4740668, 0.1538323, 0.8123275, 1, 0, 0, 1, 1,
0.4770298, 0.04346886, 3.905504, 1, 0, 0, 1, 1,
0.4773075, -0.3138979, 1.250721, 1, 0, 0, 1, 1,
0.4796388, 1.641095, 1.016092, 1, 0, 0, 1, 1,
0.479886, 0.1376233, 2.18683, 1, 0, 0, 1, 1,
0.4814837, 0.6174647, 1.15264, 0, 0, 0, 1, 1,
0.4830987, -0.0004058635, 0.635452, 0, 0, 0, 1, 1,
0.4833692, 0.4329597, 0.6061664, 0, 0, 0, 1, 1,
0.4861267, 0.1751716, 0.1277932, 0, 0, 0, 1, 1,
0.4866325, 0.1298203, 1.392619, 0, 0, 0, 1, 1,
0.4910775, -0.1749485, 2.273865, 0, 0, 0, 1, 1,
0.4911226, -0.4129902, 2.519662, 0, 0, 0, 1, 1,
0.4916192, 1.041485, 1.184003, 1, 1, 1, 1, 1,
0.4968651, 0.718129, 3.011886, 1, 1, 1, 1, 1,
0.4982714, -0.09396516, 2.421819, 1, 1, 1, 1, 1,
0.5131594, -1.022796, 3.18574, 1, 1, 1, 1, 1,
0.5158991, -0.9166977, 3.335505, 1, 1, 1, 1, 1,
0.52078, -0.6153358, 2.972394, 1, 1, 1, 1, 1,
0.5211199, -1.82006, 2.334417, 1, 1, 1, 1, 1,
0.5211964, -0.1020003, 1.754822, 1, 1, 1, 1, 1,
0.5213675, -0.003297974, 1.326375, 1, 1, 1, 1, 1,
0.5218929, 0.6225253, 2.368311, 1, 1, 1, 1, 1,
0.52418, -0.3495174, 3.733432, 1, 1, 1, 1, 1,
0.5242901, 0.3591002, 0.2885107, 1, 1, 1, 1, 1,
0.5251971, -0.08748788, 2.946965, 1, 1, 1, 1, 1,
0.5255178, 0.3841323, -0.6440477, 1, 1, 1, 1, 1,
0.5286993, -0.5285754, 2.577538, 1, 1, 1, 1, 1,
0.5315166, 0.6997845, 1.416753, 0, 0, 1, 1, 1,
0.53433, -0.7309874, 1.55775, 1, 0, 0, 1, 1,
0.5347306, -0.3522115, 0.6106705, 1, 0, 0, 1, 1,
0.5373703, -1.808557, 2.811765, 1, 0, 0, 1, 1,
0.5396578, -1.372576, 1.675769, 1, 0, 0, 1, 1,
0.5448996, 0.4705848, 1.032699, 1, 0, 0, 1, 1,
0.5469159, 1.8583, -0.4517391, 0, 0, 0, 1, 1,
0.5480567, -0.9536774, 0.9615998, 0, 0, 0, 1, 1,
0.5484326, 0.6994328, 0.4345846, 0, 0, 0, 1, 1,
0.5485729, 0.5202262, 2.076836, 0, 0, 0, 1, 1,
0.5536615, -0.106544, 2.022968, 0, 0, 0, 1, 1,
0.5539805, 1.131356, 0.9663399, 0, 0, 0, 1, 1,
0.5549883, -0.02359117, 1.590035, 0, 0, 0, 1, 1,
0.5578406, 1.056797, 0.8234982, 1, 1, 1, 1, 1,
0.5595919, 0.267732, 2.199638, 1, 1, 1, 1, 1,
0.5637448, -0.8725049, 1.216652, 1, 1, 1, 1, 1,
0.565645, -0.1061797, 2.180771, 1, 1, 1, 1, 1,
0.5665264, -0.05194128, 1.236255, 1, 1, 1, 1, 1,
0.5732564, -0.4344188, 2.375815, 1, 1, 1, 1, 1,
0.5752151, -1.604411, 2.669961, 1, 1, 1, 1, 1,
0.5807874, -0.3601975, 0.2510277, 1, 1, 1, 1, 1,
0.5847255, -1.266111, 2.618096, 1, 1, 1, 1, 1,
0.5896078, 0.3463503, -0.5254639, 1, 1, 1, 1, 1,
0.5906362, -0.4335506, 2.435224, 1, 1, 1, 1, 1,
0.5907448, -0.828862, 1.977112, 1, 1, 1, 1, 1,
0.592596, -0.7233522, 1.176886, 1, 1, 1, 1, 1,
0.5954549, 0.4842725, 2.84287, 1, 1, 1, 1, 1,
0.5966586, -0.02370713, 1.189985, 1, 1, 1, 1, 1,
0.5972143, -0.8358724, 2.242876, 0, 0, 1, 1, 1,
0.602827, -0.3525485, 1.140872, 1, 0, 0, 1, 1,
0.6091384, 1.099639, 1.655033, 1, 0, 0, 1, 1,
0.6098095, 1.189543, 0.84792, 1, 0, 0, 1, 1,
0.6146753, 0.1894449, 1.12151, 1, 0, 0, 1, 1,
0.6149533, 1.95705, -0.2853366, 1, 0, 0, 1, 1,
0.6152946, 0.406316, 2.689617, 0, 0, 0, 1, 1,
0.6167352, -1.014691, 2.436162, 0, 0, 0, 1, 1,
0.61929, -0.1834061, 2.362461, 0, 0, 0, 1, 1,
0.620415, 1.221906, 1.593077, 0, 0, 0, 1, 1,
0.6241754, -0.3304958, 1.856641, 0, 0, 0, 1, 1,
0.6258142, 1.845427, 0.4397255, 0, 0, 0, 1, 1,
0.6301323, -1.253508, 3.378128, 0, 0, 0, 1, 1,
0.6350056, 0.9957797, 1.206683, 1, 1, 1, 1, 1,
0.6362045, -1.108274, 3.366325, 1, 1, 1, 1, 1,
0.6392824, -0.9187828, 2.313649, 1, 1, 1, 1, 1,
0.6396289, -0.6914381, 3.677696, 1, 1, 1, 1, 1,
0.6417638, 1.673249, 0.3288033, 1, 1, 1, 1, 1,
0.6432517, -0.1649415, 1.118676, 1, 1, 1, 1, 1,
0.6435561, -1.056879, 3.614787, 1, 1, 1, 1, 1,
0.6453456, 0.494058, -0.08519028, 1, 1, 1, 1, 1,
0.653979, -1.780976, 2.927615, 1, 1, 1, 1, 1,
0.6576543, -0.5457202, 3.596129, 1, 1, 1, 1, 1,
0.6596346, 1.561055, 0.4583225, 1, 1, 1, 1, 1,
0.6608679, -0.3314205, 2.230747, 1, 1, 1, 1, 1,
0.6615699, 1.985917, 1.243754, 1, 1, 1, 1, 1,
0.6646035, 1.79379, -0.4471092, 1, 1, 1, 1, 1,
0.6647816, -0.2469522, 3.958942, 1, 1, 1, 1, 1,
0.664921, -0.974312, 2.416912, 0, 0, 1, 1, 1,
0.6754296, 0.8111352, 1.202409, 1, 0, 0, 1, 1,
0.6764622, -0.169062, 2.532887, 1, 0, 0, 1, 1,
0.6782143, 1.058354, 1.230858, 1, 0, 0, 1, 1,
0.6785924, 1.432302, -0.3278578, 1, 0, 0, 1, 1,
0.6813464, -0.3000103, 1.953363, 1, 0, 0, 1, 1,
0.6840988, -0.5641838, 2.55171, 0, 0, 0, 1, 1,
0.6871219, 0.285524, 1.806314, 0, 0, 0, 1, 1,
0.6925508, -0.1893041, 1.96598, 0, 0, 0, 1, 1,
0.6930792, -0.8462532, 2.987097, 0, 0, 0, 1, 1,
0.6932495, 0.009548875, 1.096874, 0, 0, 0, 1, 1,
0.6957612, 0.7947867, 1.985324, 0, 0, 0, 1, 1,
0.6962907, -0.01902996, 0.6906344, 0, 0, 0, 1, 1,
0.6980582, -0.6611944, 1.914648, 1, 1, 1, 1, 1,
0.6988659, -0.7116917, 1.774836, 1, 1, 1, 1, 1,
0.7006077, -2.963782, 3.144694, 1, 1, 1, 1, 1,
0.7134938, -0.2535208, 1.620219, 1, 1, 1, 1, 1,
0.7154252, 0.7220164, 2.261193, 1, 1, 1, 1, 1,
0.7165333, -1.306816, 2.994792, 1, 1, 1, 1, 1,
0.7174229, -0.5939587, 1.320304, 1, 1, 1, 1, 1,
0.7223291, -1.356989, 2.475704, 1, 1, 1, 1, 1,
0.7241397, 0.7005413, 1.941893, 1, 1, 1, 1, 1,
0.7246702, 0.02317115, 1.767709, 1, 1, 1, 1, 1,
0.7248287, -0.5302108, 2.98857, 1, 1, 1, 1, 1,
0.7271916, 0.1902385, 2.821317, 1, 1, 1, 1, 1,
0.7272444, 0.06271486, 1.528964, 1, 1, 1, 1, 1,
0.727729, 1.500037, 1.030273, 1, 1, 1, 1, 1,
0.7322384, -0.5630035, 0.7231544, 1, 1, 1, 1, 1,
0.7339125, -0.2364288, 3.606998, 0, 0, 1, 1, 1,
0.7357748, -1.52568, 2.311274, 1, 0, 0, 1, 1,
0.7409797, -0.3547134, 1.053736, 1, 0, 0, 1, 1,
0.7446375, -0.184609, 1.091729, 1, 0, 0, 1, 1,
0.7466632, 0.2389883, 1.17437, 1, 0, 0, 1, 1,
0.7482576, -1.024421, 1.873121, 1, 0, 0, 1, 1,
0.7546792, 1.000755, 1.31754, 0, 0, 0, 1, 1,
0.7631225, 0.04378595, 1.115332, 0, 0, 0, 1, 1,
0.7650338, -0.3216956, 0.9731832, 0, 0, 0, 1, 1,
0.7652031, 0.1609237, 0.6038448, 0, 0, 0, 1, 1,
0.7708372, -2.092597, 1.663496, 0, 0, 0, 1, 1,
0.7721205, -0.9658335, 3.065453, 0, 0, 0, 1, 1,
0.7754957, -0.03485331, 2.001432, 0, 0, 0, 1, 1,
0.7809318, -0.1359182, 2.365987, 1, 1, 1, 1, 1,
0.7839178, -1.359039, 3.7325, 1, 1, 1, 1, 1,
0.7840239, 0.3506138, 1.555413, 1, 1, 1, 1, 1,
0.7854655, 1.04744, -2.037966, 1, 1, 1, 1, 1,
0.7898263, -0.1172563, 2.559519, 1, 1, 1, 1, 1,
0.7973419, -1.21314, 3.983099, 1, 1, 1, 1, 1,
0.8068756, 1.058143, 0.2835799, 1, 1, 1, 1, 1,
0.8099923, -0.8055953, 2.587185, 1, 1, 1, 1, 1,
0.81188, 0.9930089, 0.06627547, 1, 1, 1, 1, 1,
0.8146865, 1.50405, 0.3321376, 1, 1, 1, 1, 1,
0.8167565, -2.56663, 4.28176, 1, 1, 1, 1, 1,
0.8225955, -0.4125497, 2.576501, 1, 1, 1, 1, 1,
0.8249919, -0.4071569, 2.174682, 1, 1, 1, 1, 1,
0.8305015, -0.4246068, 4.160258, 1, 1, 1, 1, 1,
0.8315319, 0.4249969, 0.5889839, 1, 1, 1, 1, 1,
0.8330153, 0.7233127, 0.4694335, 0, 0, 1, 1, 1,
0.8337602, 1.067523, 2.54195, 1, 0, 0, 1, 1,
0.8396436, 1.218184, 1.399463, 1, 0, 0, 1, 1,
0.8405538, 0.3287761, 1.791748, 1, 0, 0, 1, 1,
0.8540602, -0.06029103, 0.2412534, 1, 0, 0, 1, 1,
0.8546486, -0.3115918, 1.893483, 1, 0, 0, 1, 1,
0.8553311, -2.048258, 3.922792, 0, 0, 0, 1, 1,
0.8578691, 1.302912, 0.897451, 0, 0, 0, 1, 1,
0.8692429, 0.2413236, 1.957405, 0, 0, 0, 1, 1,
0.8695642, 0.9302625, 0.8599722, 0, 0, 0, 1, 1,
0.8862551, 0.112604, 2.033608, 0, 0, 0, 1, 1,
0.8911871, -0.6978767, 3.343586, 0, 0, 0, 1, 1,
0.8918778, -1.169748, 3.97433, 0, 0, 0, 1, 1,
0.8959635, -0.7546914, 3.20675, 1, 1, 1, 1, 1,
0.8960854, -0.4885216, 2.787263, 1, 1, 1, 1, 1,
0.8962132, 0.9619398, 0.8866383, 1, 1, 1, 1, 1,
0.8971859, -1.042444, 2.942884, 1, 1, 1, 1, 1,
0.8973277, 1.811459, 0.09797754, 1, 1, 1, 1, 1,
0.8991773, 1.003969, 0.4647509, 1, 1, 1, 1, 1,
0.9039284, -1.052935, 3.147551, 1, 1, 1, 1, 1,
0.9071442, -0.4942455, 1.283258, 1, 1, 1, 1, 1,
0.9091633, 0.355631, 2.004309, 1, 1, 1, 1, 1,
0.9112756, 0.8246959, 2.881433, 1, 1, 1, 1, 1,
0.9119654, 0.007218001, 2.97486, 1, 1, 1, 1, 1,
0.9136671, -0.5426855, -0.1619214, 1, 1, 1, 1, 1,
0.9176782, -0.6743807, 2.374467, 1, 1, 1, 1, 1,
0.9200668, -1.719366, 3.02086, 1, 1, 1, 1, 1,
0.920502, 2.550115, -1.395866, 1, 1, 1, 1, 1,
0.9226842, -1.701472, 3.968831, 0, 0, 1, 1, 1,
0.9266083, 1.717181, 1.57383, 1, 0, 0, 1, 1,
0.9400941, 0.8195786, 0.6477485, 1, 0, 0, 1, 1,
0.9434196, 1.190665, -0.1708842, 1, 0, 0, 1, 1,
0.9520746, 1.537234, 0.8362633, 1, 0, 0, 1, 1,
0.95783, -1.576278, 1.367489, 1, 0, 0, 1, 1,
0.9595544, -0.3007187, 0.3781757, 0, 0, 0, 1, 1,
0.9672031, 1.975484, 1.111221, 0, 0, 0, 1, 1,
0.970675, 1.643689, 1.579337, 0, 0, 0, 1, 1,
0.9782407, 0.1031222, 2.533074, 0, 0, 0, 1, 1,
0.9839328, -0.571825, 2.025468, 0, 0, 0, 1, 1,
0.9848927, -0.1094702, 2.798744, 0, 0, 0, 1, 1,
0.9887841, -0.6232297, 2.235501, 0, 0, 0, 1, 1,
0.9891008, 0.1614903, 1.471829, 1, 1, 1, 1, 1,
0.9970641, -0.1854265, 1.234391, 1, 1, 1, 1, 1,
0.9978406, -0.5652422, 1.691164, 1, 1, 1, 1, 1,
1.000217, 1.335722, 1.365367, 1, 1, 1, 1, 1,
1.002727, -0.008307131, 1.323373, 1, 1, 1, 1, 1,
1.010996, -0.4671206, 0.005671993, 1, 1, 1, 1, 1,
1.02241, -1.096163, 1.457649, 1, 1, 1, 1, 1,
1.026749, -0.6021308, 4.705364, 1, 1, 1, 1, 1,
1.02749, -0.4711946, 1.669896, 1, 1, 1, 1, 1,
1.030065, -1.435054, 2.436084, 1, 1, 1, 1, 1,
1.031094, 0.4807123, 1.086105, 1, 1, 1, 1, 1,
1.033674, -0.7909837, 3.902935, 1, 1, 1, 1, 1,
1.033751, -0.07484456, 0.5597997, 1, 1, 1, 1, 1,
1.042115, 1.422292, 1.344776, 1, 1, 1, 1, 1,
1.042236, -0.5468737, 2.747912, 1, 1, 1, 1, 1,
1.046274, -0.07735302, 2.010123, 0, 0, 1, 1, 1,
1.046527, 0.08576993, 1.91818, 1, 0, 0, 1, 1,
1.047148, 1.605166, 1.47547, 1, 0, 0, 1, 1,
1.047446, -0.5064064, 2.981862, 1, 0, 0, 1, 1,
1.051723, 0.5188656, 1.307354, 1, 0, 0, 1, 1,
1.055527, -0.6264341, 0.1347904, 1, 0, 0, 1, 1,
1.060398, -0.02465607, 2.255504, 0, 0, 0, 1, 1,
1.061587, -0.3050332, 1.048701, 0, 0, 0, 1, 1,
1.06919, 0.5454116, -0.1768413, 0, 0, 0, 1, 1,
1.072092, 0.3370738, 1.050956, 0, 0, 0, 1, 1,
1.075585, -0.8346817, 0.8919159, 0, 0, 0, 1, 1,
1.077682, 0.8834781, 2.616123, 0, 0, 0, 1, 1,
1.080171, 1.387215, 1.423486, 0, 0, 0, 1, 1,
1.081993, 0.06818175, 1.502966, 1, 1, 1, 1, 1,
1.092429, -0.9325191, 0.6916245, 1, 1, 1, 1, 1,
1.094122, 0.719505, 0.8990746, 1, 1, 1, 1, 1,
1.099879, -0.5368984, 0.7883551, 1, 1, 1, 1, 1,
1.100274, -1.195693, 1.474942, 1, 1, 1, 1, 1,
1.114099, -0.0381767, 0.8348651, 1, 1, 1, 1, 1,
1.123558, 1.356265, -0.2367465, 1, 1, 1, 1, 1,
1.129433, 1.529856, 0.7021508, 1, 1, 1, 1, 1,
1.130981, -0.3271177, 2.143619, 1, 1, 1, 1, 1,
1.139912, -0.9038869, 2.975612, 1, 1, 1, 1, 1,
1.149107, 0.6680628, 1.125469, 1, 1, 1, 1, 1,
1.14984, 0.3915276, 0.129581, 1, 1, 1, 1, 1,
1.152687, 0.07291653, 1.727845, 1, 1, 1, 1, 1,
1.152774, -0.1368525, 0.4182675, 1, 1, 1, 1, 1,
1.164357, -0.5982034, 1.825923, 1, 1, 1, 1, 1,
1.169024, -0.1219811, 0.7089052, 0, 0, 1, 1, 1,
1.17338, 0.2067053, 1.478285, 1, 0, 0, 1, 1,
1.181005, -0.2109139, 2.43809, 1, 0, 0, 1, 1,
1.181853, -1.679971, 3.1457, 1, 0, 0, 1, 1,
1.183502, 0.477346, 1.313474, 1, 0, 0, 1, 1,
1.188979, -1.575388, 3.865702, 1, 0, 0, 1, 1,
1.193155, -0.9030722, 3.573647, 0, 0, 0, 1, 1,
1.195164, 0.7727932, 0.7123501, 0, 0, 0, 1, 1,
1.211411, -0.7466953, 3.601716, 0, 0, 0, 1, 1,
1.212123, -0.2519814, 1.003519, 0, 0, 0, 1, 1,
1.21543, -0.6762956, 2.017447, 0, 0, 0, 1, 1,
1.218745, 0.5574401, 0.8195413, 0, 0, 0, 1, 1,
1.220928, -1.808143, 4.958025, 0, 0, 0, 1, 1,
1.221861, -0.04910059, 0.6981558, 1, 1, 1, 1, 1,
1.226903, 0.6535953, -0.00286675, 1, 1, 1, 1, 1,
1.229895, 0.02382503, 2.761492, 1, 1, 1, 1, 1,
1.23075, -1.14355, 3.218398, 1, 1, 1, 1, 1,
1.233384, 0.03207712, 2.417266, 1, 1, 1, 1, 1,
1.240479, -1.792267, 2.829234, 1, 1, 1, 1, 1,
1.246202, -0.5093426, 3.293387, 1, 1, 1, 1, 1,
1.246415, 2.301984, -2.256591, 1, 1, 1, 1, 1,
1.249242, -0.8439451, 3.340345, 1, 1, 1, 1, 1,
1.24952, 0.2531326, 2.184675, 1, 1, 1, 1, 1,
1.256046, 0.3629733, 0.2510576, 1, 1, 1, 1, 1,
1.262081, 1.396115, 0.9406435, 1, 1, 1, 1, 1,
1.262262, 0.6069766, -0.6030124, 1, 1, 1, 1, 1,
1.268194, 0.3878999, 1.842726, 1, 1, 1, 1, 1,
1.277637, -0.1573493, 2.985021, 1, 1, 1, 1, 1,
1.284245, 1.531335, 0.7507444, 0, 0, 1, 1, 1,
1.287722, 1.06385, 0.3920476, 1, 0, 0, 1, 1,
1.288309, 1.185332, 0.2753303, 1, 0, 0, 1, 1,
1.290835, 0.9325895, 1.035603, 1, 0, 0, 1, 1,
1.297753, -1.693919, 1.817727, 1, 0, 0, 1, 1,
1.310075, -0.3714027, 2.460589, 1, 0, 0, 1, 1,
1.310924, -0.4556801, 1.450615, 0, 0, 0, 1, 1,
1.320848, -0.1093676, 1.47047, 0, 0, 0, 1, 1,
1.32125, 0.495832, 1.432237, 0, 0, 0, 1, 1,
1.326316, -1.181843, 1.50896, 0, 0, 0, 1, 1,
1.341892, -1.459001, 2.787893, 0, 0, 0, 1, 1,
1.343614, 0.5701703, 0.7060406, 0, 0, 0, 1, 1,
1.34415, -3.083521, 1.465573, 0, 0, 0, 1, 1,
1.34544, -0.2818063, 1.873799, 1, 1, 1, 1, 1,
1.346339, -0.7387298, 1.894283, 1, 1, 1, 1, 1,
1.350121, -1.382352, 0.9598857, 1, 1, 1, 1, 1,
1.362204, 2.337183, -0.8044078, 1, 1, 1, 1, 1,
1.369955, 1.412256, -0.6474196, 1, 1, 1, 1, 1,
1.388747, 1.042063, 0.2919074, 1, 1, 1, 1, 1,
1.389477, 0.460128, 2.082174, 1, 1, 1, 1, 1,
1.398864, 0.4691233, 0.08068175, 1, 1, 1, 1, 1,
1.412624, 0.03247748, 2.056856, 1, 1, 1, 1, 1,
1.42576, 0.06138192, 0.2897632, 1, 1, 1, 1, 1,
1.443901, 0.2209917, 0.4643567, 1, 1, 1, 1, 1,
1.481467, 0.8224862, 1.401174, 1, 1, 1, 1, 1,
1.487568, -0.3562073, 1.43407, 1, 1, 1, 1, 1,
1.491886, -0.5319192, 2.867144, 1, 1, 1, 1, 1,
1.496682, -1.108055, 1.286621, 1, 1, 1, 1, 1,
1.502968, -0.9288426, 1.085885, 0, 0, 1, 1, 1,
1.527449, -0.06306246, 0.482542, 1, 0, 0, 1, 1,
1.543981, 1.680317, 0.6631071, 1, 0, 0, 1, 1,
1.550739, -1.03767, 2.868316, 1, 0, 0, 1, 1,
1.568569, 0.6307068, 2.759852, 1, 0, 0, 1, 1,
1.570838, -0.8262487, 1.946208, 1, 0, 0, 1, 1,
1.574146, -0.487233, 2.11579, 0, 0, 0, 1, 1,
1.583455, 0.3748308, 2.103432, 0, 0, 0, 1, 1,
1.586892, -1.221076, 2.563257, 0, 0, 0, 1, 1,
1.587681, 1.261538, 0.336527, 0, 0, 0, 1, 1,
1.608031, -0.345564, 0.2894538, 0, 0, 0, 1, 1,
1.639378, -1.026991, 0.881465, 0, 0, 0, 1, 1,
1.648526, -0.4435329, 2.739747, 0, 0, 0, 1, 1,
1.655308, -0.1208264, -0.1386219, 1, 1, 1, 1, 1,
1.699648, 0.3673557, 0.3885579, 1, 1, 1, 1, 1,
1.707321, -3.656641, 3.569704, 1, 1, 1, 1, 1,
1.743573, 0.2408189, 1.364805, 1, 1, 1, 1, 1,
1.756048, -1.126765, 2.747177, 1, 1, 1, 1, 1,
1.771265, 0.0007050671, 1.873197, 1, 1, 1, 1, 1,
1.782241, -1.313214, 3.523189, 1, 1, 1, 1, 1,
1.789421, -2.166276, 0.9371465, 1, 1, 1, 1, 1,
1.79174, -0.03163848, 2.880053, 1, 1, 1, 1, 1,
1.911936, -2.536829, 2.484945, 1, 1, 1, 1, 1,
1.9309, 1.521055, 1.420159, 1, 1, 1, 1, 1,
1.947872, 0.7745609, 1.836022, 1, 1, 1, 1, 1,
1.959543, -0.6039057, 3.915835, 1, 1, 1, 1, 1,
1.982839, -1.205065, 1.482661, 1, 1, 1, 1, 1,
1.985509, -0.223124, 2.794359, 1, 1, 1, 1, 1,
2.022836, -1.258141, 2.320151, 0, 0, 1, 1, 1,
2.08968, 2.289698, 1.791676, 1, 0, 0, 1, 1,
2.096917, 0.429083, -0.3635198, 1, 0, 0, 1, 1,
2.185417, 1.064995, 1.247112, 1, 0, 0, 1, 1,
2.215722, 0.5883838, 0.636621, 1, 0, 0, 1, 1,
2.227176, 1.021175, 2.455274, 1, 0, 0, 1, 1,
2.230047, 0.8442181, 1.556939, 0, 0, 0, 1, 1,
2.25697, -0.6166112, 2.398441, 0, 0, 0, 1, 1,
2.258608, -0.01909481, 1.472011, 0, 0, 0, 1, 1,
2.269391, 0.1303687, 0.5365067, 0, 0, 0, 1, 1,
2.290782, 0.8563866, 0.5989444, 0, 0, 0, 1, 1,
2.295369, -0.9517137, 2.307299, 0, 0, 0, 1, 1,
2.306872, 1.13546, 3.245814, 0, 0, 0, 1, 1,
2.31417, 1.479093, 0.402598, 1, 1, 1, 1, 1,
2.374129, 1.279314, -0.1481269, 1, 1, 1, 1, 1,
2.469681, -0.2193482, 1.843502, 1, 1, 1, 1, 1,
2.613598, -0.06564578, 0.3289275, 1, 1, 1, 1, 1,
2.753676, -0.5160935, 2.657338, 1, 1, 1, 1, 1,
2.915643, -0.8206761, 1.97713, 1, 1, 1, 1, 1,
2.939668, -0.349173, 1.431763, 1, 1, 1, 1, 1
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
var radius = 9.381761;
var distance = 32.95304;
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
mvMatrix.translate( -0.03466809, 0.2159026, -0.2228923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95304);
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
