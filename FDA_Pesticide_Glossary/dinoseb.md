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
-3.121119, 0.0429468, -2.063334, 1, 0, 0, 1,
-2.845224, -1.486379, -3.635767, 1, 0.007843138, 0, 1,
-2.844773, 0.7093273, -0.9030396, 1, 0.01176471, 0, 1,
-2.436359, -1.726328, -4.02254, 1, 0.01960784, 0, 1,
-2.381051, -0.1925485, 0.06569713, 1, 0.02352941, 0, 1,
-2.302067, 0.07306363, -1.949048, 1, 0.03137255, 0, 1,
-2.301937, 2.073445, -0.1548766, 1, 0.03529412, 0, 1,
-2.300705, -0.7058722, -0.7042981, 1, 0.04313726, 0, 1,
-2.260752, -0.8564088, -3.138677, 1, 0.04705882, 0, 1,
-2.243351, 0.6066158, -2.46205, 1, 0.05490196, 0, 1,
-2.187777, 0.9671132, -1.679672, 1, 0.05882353, 0, 1,
-2.177522, 0.7795066, -1.048635, 1, 0.06666667, 0, 1,
-2.130621, 0.1883484, -1.719574, 1, 0.07058824, 0, 1,
-2.115608, 0.9442164, -1.761427, 1, 0.07843138, 0, 1,
-2.115525, 0.3707644, -1.371532, 1, 0.08235294, 0, 1,
-2.087321, 0.8368784, -1.526807, 1, 0.09019608, 0, 1,
-2.081759, 0.4201679, -1.415061, 1, 0.09411765, 0, 1,
-2.072292, -0.212697, -0.971973, 1, 0.1019608, 0, 1,
-2.04156, -0.5819002, -1.642596, 1, 0.1098039, 0, 1,
-2.020207, -0.287258, -3.061558, 1, 0.1137255, 0, 1,
-2.000286, -0.5038353, -2.945485, 1, 0.1215686, 0, 1,
-1.940807, -1.044544, -1.683966, 1, 0.1254902, 0, 1,
-1.913147, -0.5707839, -2.548481, 1, 0.1333333, 0, 1,
-1.896918, -1.242557, -1.288805, 1, 0.1372549, 0, 1,
-1.892484, -0.06105757, -2.195403, 1, 0.145098, 0, 1,
-1.871293, -0.6832964, -0.787658, 1, 0.1490196, 0, 1,
-1.859213, -0.3490549, -2.130416, 1, 0.1568628, 0, 1,
-1.855309, -0.6960185, -1.849187, 1, 0.1607843, 0, 1,
-1.851541, 1.71939, -1.225034, 1, 0.1686275, 0, 1,
-1.837185, 0.919818, -0.1253698, 1, 0.172549, 0, 1,
-1.836251, -0.8386503, -1.272772, 1, 0.1803922, 0, 1,
-1.83536, 0.1340355, 0.1548985, 1, 0.1843137, 0, 1,
-1.82965, -1.268233, -1.555717, 1, 0.1921569, 0, 1,
-1.820907, 0.1647301, -0.2745925, 1, 0.1960784, 0, 1,
-1.811705, 0.7520176, -1.311626, 1, 0.2039216, 0, 1,
-1.805403, -0.2197064, -1.524503, 1, 0.2117647, 0, 1,
-1.80172, 0.2755005, -0.9257019, 1, 0.2156863, 0, 1,
-1.775735, -0.1566355, -2.297715, 1, 0.2235294, 0, 1,
-1.755344, -1.125177, -2.151532, 1, 0.227451, 0, 1,
-1.747272, -0.6905491, -0.1128514, 1, 0.2352941, 0, 1,
-1.746704, 0.471519, 0.09426045, 1, 0.2392157, 0, 1,
-1.732333, -0.2845689, -3.916298, 1, 0.2470588, 0, 1,
-1.724738, 0.915796, -0.3170187, 1, 0.2509804, 0, 1,
-1.677574, -1.401107, -1.994883, 1, 0.2588235, 0, 1,
-1.676981, -0.4499532, -2.454545, 1, 0.2627451, 0, 1,
-1.669126, -1.138428, -2.04799, 1, 0.2705882, 0, 1,
-1.657598, 0.08297932, -2.535294, 1, 0.2745098, 0, 1,
-1.657402, -0.3682494, -4.207132, 1, 0.282353, 0, 1,
-1.651249, 1.348472, 0.2278834, 1, 0.2862745, 0, 1,
-1.638926, 0.5972045, -1.000129, 1, 0.2941177, 0, 1,
-1.638639, -2.405711, -2.560799, 1, 0.3019608, 0, 1,
-1.62977, -1.700552, -2.329477, 1, 0.3058824, 0, 1,
-1.626284, 1.334789, -0.5041341, 1, 0.3137255, 0, 1,
-1.625099, 0.5322981, 0.364199, 1, 0.3176471, 0, 1,
-1.62386, 0.540751, -1.531848, 1, 0.3254902, 0, 1,
-1.620135, -0.5783696, -1.760688, 1, 0.3294118, 0, 1,
-1.618859, 1.887771, -1.283792, 1, 0.3372549, 0, 1,
-1.617389, 0.3843968, -1.23427, 1, 0.3411765, 0, 1,
-1.609114, -0.5832772, -2.095012, 1, 0.3490196, 0, 1,
-1.607351, -0.764564, -2.659512, 1, 0.3529412, 0, 1,
-1.597585, 0.02309669, -1.385626, 1, 0.3607843, 0, 1,
-1.593473, 0.1922734, -1.906888, 1, 0.3647059, 0, 1,
-1.582194, -0.8979641, -1.280961, 1, 0.372549, 0, 1,
-1.576057, 0.3819983, -0.3753629, 1, 0.3764706, 0, 1,
-1.551344, -0.4493697, -1.225156, 1, 0.3843137, 0, 1,
-1.547118, -1.031017, -1.802823, 1, 0.3882353, 0, 1,
-1.544305, -0.9087946, -3.489298, 1, 0.3960784, 0, 1,
-1.530907, -0.5935146, -0.5780911, 1, 0.4039216, 0, 1,
-1.526404, -0.5160822, -0.6407714, 1, 0.4078431, 0, 1,
-1.524811, 0.183238, -1.976568, 1, 0.4156863, 0, 1,
-1.515633, 0.154787, 0.7176308, 1, 0.4196078, 0, 1,
-1.500483, 0.06443869, -0.5056504, 1, 0.427451, 0, 1,
-1.496386, 1.996564, -0.5606513, 1, 0.4313726, 0, 1,
-1.476668, -1.726171, -1.927503, 1, 0.4392157, 0, 1,
-1.47215, 0.4241427, -2.807089, 1, 0.4431373, 0, 1,
-1.468507, -0.6275927, -1.107694, 1, 0.4509804, 0, 1,
-1.465855, -2.146168, -1.246859, 1, 0.454902, 0, 1,
-1.465642, 1.226552, -1.361971, 1, 0.4627451, 0, 1,
-1.460651, -1.182773, -1.851849, 1, 0.4666667, 0, 1,
-1.451887, 0.1274658, -0.9139195, 1, 0.4745098, 0, 1,
-1.432941, -0.3039643, -0.7622921, 1, 0.4784314, 0, 1,
-1.417723, 1.095731, -1.679777, 1, 0.4862745, 0, 1,
-1.414547, -0.6675144, -2.022219, 1, 0.4901961, 0, 1,
-1.41337, -0.8383514, -2.164138, 1, 0.4980392, 0, 1,
-1.410335, 1.264078, -1.222394, 1, 0.5058824, 0, 1,
-1.404003, -0.117817, -1.030351, 1, 0.509804, 0, 1,
-1.402512, -1.491619, -2.252877, 1, 0.5176471, 0, 1,
-1.390685, -1.83872, -2.22446, 1, 0.5215687, 0, 1,
-1.383048, -0.0009398739, -1.991593, 1, 0.5294118, 0, 1,
-1.381741, 0.001336469, -1.774589, 1, 0.5333334, 0, 1,
-1.381562, 1.680858, 1.490145, 1, 0.5411765, 0, 1,
-1.374419, 0.3424713, -0.5337116, 1, 0.5450981, 0, 1,
-1.371686, 0.3561633, -0.9936896, 1, 0.5529412, 0, 1,
-1.369646, 0.9268513, -0.4185828, 1, 0.5568628, 0, 1,
-1.365891, -0.1069786, -1.714152, 1, 0.5647059, 0, 1,
-1.365382, 0.1048821, -0.5949183, 1, 0.5686275, 0, 1,
-1.346815, 0.8986546, 0.509804, 1, 0.5764706, 0, 1,
-1.345353, -0.9955245, -1.619428, 1, 0.5803922, 0, 1,
-1.342794, -1.00791, -0.8672591, 1, 0.5882353, 0, 1,
-1.333879, 0.7927883, -0.6340362, 1, 0.5921569, 0, 1,
-1.333088, 2.287297, 0.01272652, 1, 0.6, 0, 1,
-1.330904, 1.703933, -0.7508799, 1, 0.6078432, 0, 1,
-1.318101, 0.3621974, -1.267772, 1, 0.6117647, 0, 1,
-1.317549, 0.6133515, -1.293859, 1, 0.6196079, 0, 1,
-1.304379, 0.7369463, -1.02128, 1, 0.6235294, 0, 1,
-1.303859, 0.1452834, -2.627598, 1, 0.6313726, 0, 1,
-1.303432, -2.30906, -3.393605, 1, 0.6352941, 0, 1,
-1.288338, -0.8228702, -1.332259, 1, 0.6431373, 0, 1,
-1.288123, -0.4177835, -2.535314, 1, 0.6470588, 0, 1,
-1.282698, 1.456139, -0.6290796, 1, 0.654902, 0, 1,
-1.276342, 0.2279986, -0.5688456, 1, 0.6588235, 0, 1,
-1.275015, 1.955923, -1.477905, 1, 0.6666667, 0, 1,
-1.273226, -1.286445, -1.615183, 1, 0.6705883, 0, 1,
-1.265506, -0.5136717, -0.2977633, 1, 0.6784314, 0, 1,
-1.261248, 1.18097, -0.510138, 1, 0.682353, 0, 1,
-1.252084, 2.179544, 1.026094, 1, 0.6901961, 0, 1,
-1.24459, -0.3446103, -4.063293, 1, 0.6941177, 0, 1,
-1.241136, 0.3793244, -1.846121, 1, 0.7019608, 0, 1,
-1.234701, 1.792442, 0.8113396, 1, 0.7098039, 0, 1,
-1.225315, 0.6034661, -1.453938, 1, 0.7137255, 0, 1,
-1.22369, 1.330543, -0.4483176, 1, 0.7215686, 0, 1,
-1.203742, 1.814904, -1.126502, 1, 0.7254902, 0, 1,
-1.198812, -0.6874915, 0.02700898, 1, 0.7333333, 0, 1,
-1.198244, 0.9650334, -1.491389, 1, 0.7372549, 0, 1,
-1.197475, 1.103414, 2.310175, 1, 0.7450981, 0, 1,
-1.193733, -1.693563, -3.492232, 1, 0.7490196, 0, 1,
-1.193719, -0.005028309, -2.622759, 1, 0.7568628, 0, 1,
-1.192337, 1.493042, -0.584546, 1, 0.7607843, 0, 1,
-1.191422, -1.341259, -3.183892, 1, 0.7686275, 0, 1,
-1.191093, -0.4825679, -1.406082, 1, 0.772549, 0, 1,
-1.185092, 1.281911, -1.137692, 1, 0.7803922, 0, 1,
-1.181568, -0.1926431, -2.109829, 1, 0.7843137, 0, 1,
-1.174677, -0.8525219, -1.16153, 1, 0.7921569, 0, 1,
-1.171582, 0.4759078, -1.612889, 1, 0.7960784, 0, 1,
-1.169736, -0.4137772, -3.041056, 1, 0.8039216, 0, 1,
-1.168911, -0.4365782, -2.151153, 1, 0.8117647, 0, 1,
-1.165159, -0.172933, -0.4825347, 1, 0.8156863, 0, 1,
-1.159102, 0.7067873, -2.420976, 1, 0.8235294, 0, 1,
-1.15804, 1.125372, -1.029799, 1, 0.827451, 0, 1,
-1.157005, 0.5896865, -0.5917308, 1, 0.8352941, 0, 1,
-1.153755, 1.764971, 0.8649726, 1, 0.8392157, 0, 1,
-1.146215, -1.386097, -4.313869, 1, 0.8470588, 0, 1,
-1.140252, 0.5715773, -0.3395484, 1, 0.8509804, 0, 1,
-1.127299, -0.5434636, -3.481323, 1, 0.8588235, 0, 1,
-1.122556, -1.024055, -2.305298, 1, 0.8627451, 0, 1,
-1.118057, 1.40316, 0.008002795, 1, 0.8705882, 0, 1,
-1.104292, -1.502294, -3.817202, 1, 0.8745098, 0, 1,
-1.091969, 0.1747835, -1.207597, 1, 0.8823529, 0, 1,
-1.091363, 0.277859, -1.115562, 1, 0.8862745, 0, 1,
-1.087866, 2.026728, -0.04664278, 1, 0.8941177, 0, 1,
-1.08696, -0.9227796, -1.92714, 1, 0.8980392, 0, 1,
-1.082367, -0.04462678, -0.7753572, 1, 0.9058824, 0, 1,
-1.08226, 0.5978772, -0.7575403, 1, 0.9137255, 0, 1,
-1.070044, -0.2067265, -1.733865, 1, 0.9176471, 0, 1,
-1.069, -0.9724065, -2.12516, 1, 0.9254902, 0, 1,
-1.062622, -0.4750271, -1.526215, 1, 0.9294118, 0, 1,
-1.061897, 1.477349, 0.7605788, 1, 0.9372549, 0, 1,
-1.058162, 0.4867017, -1.167702, 1, 0.9411765, 0, 1,
-1.057305, 0.3519725, -1.842272, 1, 0.9490196, 0, 1,
-1.054661, -0.5873286, -2.262057, 1, 0.9529412, 0, 1,
-1.053523, -0.4273015, -2.436027, 1, 0.9607843, 0, 1,
-1.053339, -1.400105, -4.174192, 1, 0.9647059, 0, 1,
-1.05206, 0.4433398, -0.8445219, 1, 0.972549, 0, 1,
-1.048422, -0.7001384, -2.078295, 1, 0.9764706, 0, 1,
-1.047605, -1.761317, -1.393345, 1, 0.9843137, 0, 1,
-1.045249, -0.3974729, -5.120937, 1, 0.9882353, 0, 1,
-1.043731, 2.374519, -0.4695306, 1, 0.9960784, 0, 1,
-1.040647, 0.05008442, -1.407448, 0.9960784, 1, 0, 1,
-1.035721, 0.8037108, -1.64862, 0.9921569, 1, 0, 1,
-1.029747, -0.9208372, -2.324511, 0.9843137, 1, 0, 1,
-1.028133, -2.175578, -2.376742, 0.9803922, 1, 0, 1,
-1.017696, -0.07432218, -2.705022, 0.972549, 1, 0, 1,
-1.009228, -0.4902598, -1.424303, 0.9686275, 1, 0, 1,
-1.00907, 0.8083701, -1.315092, 0.9607843, 1, 0, 1,
-0.9974923, -0.1156227, -1.864888, 0.9568627, 1, 0, 1,
-0.9964562, 1.021808, -0.08068729, 0.9490196, 1, 0, 1,
-0.9954031, 0.6314055, -0.1933504, 0.945098, 1, 0, 1,
-0.9933019, 1.260098, 1.377073, 0.9372549, 1, 0, 1,
-0.9894401, 0.367083, -1.883712, 0.9333333, 1, 0, 1,
-0.9860398, -0.1234782, -1.980473, 0.9254902, 1, 0, 1,
-0.979471, -0.1497622, -1.268101, 0.9215686, 1, 0, 1,
-0.9781232, 2.467273, -0.8466751, 0.9137255, 1, 0, 1,
-0.9763312, 0.7774966, -1.929772, 0.9098039, 1, 0, 1,
-0.9741154, -0.3580693, -2.691233, 0.9019608, 1, 0, 1,
-0.9664083, 1.971291, 0.6404105, 0.8941177, 1, 0, 1,
-0.9651873, 0.555921, 0.3210995, 0.8901961, 1, 0, 1,
-0.9648201, -1.085486, -2.076071, 0.8823529, 1, 0, 1,
-0.9646069, 0.5705478, 0.1014408, 0.8784314, 1, 0, 1,
-0.9628428, 0.1969141, 0.1362332, 0.8705882, 1, 0, 1,
-0.9601612, 0.3785787, -1.702775, 0.8666667, 1, 0, 1,
-0.9555084, 2.676904, 0.5012906, 0.8588235, 1, 0, 1,
-0.9534163, 1.581726, -0.179303, 0.854902, 1, 0, 1,
-0.9458576, -1.064399, 0.3811403, 0.8470588, 1, 0, 1,
-0.9453855, 0.01278935, -1.250851, 0.8431373, 1, 0, 1,
-0.9430621, -1.122501, -1.92624, 0.8352941, 1, 0, 1,
-0.9386088, 0.3413885, -1.32126, 0.8313726, 1, 0, 1,
-0.9367958, -0.04089878, -0.5444511, 0.8235294, 1, 0, 1,
-0.9339266, -0.5878313, -1.320905, 0.8196079, 1, 0, 1,
-0.9228614, 0.1329762, -0.2843068, 0.8117647, 1, 0, 1,
-0.9226487, 0.9910907, 0.8707095, 0.8078431, 1, 0, 1,
-0.9213476, -1.100077, -2.866565, 0.8, 1, 0, 1,
-0.9205784, -0.01345605, -2.839752, 0.7921569, 1, 0, 1,
-0.8995307, 0.5261779, -0.4420588, 0.7882353, 1, 0, 1,
-0.8962594, -1.136446, -1.620346, 0.7803922, 1, 0, 1,
-0.8910366, 0.2026061, -2.998455, 0.7764706, 1, 0, 1,
-0.8768637, 0.8115277, 0.1873315, 0.7686275, 1, 0, 1,
-0.873342, 0.5262769, -1.578609, 0.7647059, 1, 0, 1,
-0.8724552, -0.1952634, -1.729767, 0.7568628, 1, 0, 1,
-0.8701859, -0.7746671, -3.048113, 0.7529412, 1, 0, 1,
-0.869718, 0.3680935, -0.8515599, 0.7450981, 1, 0, 1,
-0.8687045, -0.9821855, -2.160586, 0.7411765, 1, 0, 1,
-0.8674942, 2.076953, -0.733777, 0.7333333, 1, 0, 1,
-0.8633029, 1.734467, -0.7518536, 0.7294118, 1, 0, 1,
-0.8604193, 0.4057695, 0.03533588, 0.7215686, 1, 0, 1,
-0.8555158, -0.7951704, -0.6958449, 0.7176471, 1, 0, 1,
-0.8527212, 0.5336359, 0.5953165, 0.7098039, 1, 0, 1,
-0.8519747, -1.185133, -3.250318, 0.7058824, 1, 0, 1,
-0.8510727, -1.503266, -1.42428, 0.6980392, 1, 0, 1,
-0.8492897, 0.0311725, -2.240367, 0.6901961, 1, 0, 1,
-0.8489647, 0.2891003, -0.3180902, 0.6862745, 1, 0, 1,
-0.8386679, 0.0318043, -1.441504, 0.6784314, 1, 0, 1,
-0.8214346, -0.6649051, -2.828331, 0.6745098, 1, 0, 1,
-0.8184682, -1.968109, -1.674889, 0.6666667, 1, 0, 1,
-0.8165956, -0.493075, -2.407897, 0.6627451, 1, 0, 1,
-0.8157091, 0.6333091, -0.3106444, 0.654902, 1, 0, 1,
-0.8145227, 0.8251585, -0.7209803, 0.6509804, 1, 0, 1,
-0.8127779, 1.490147, -1.129128, 0.6431373, 1, 0, 1,
-0.8125947, 0.4910241, -1.411565, 0.6392157, 1, 0, 1,
-0.8019828, -1.981426, -3.384056, 0.6313726, 1, 0, 1,
-0.7985896, 1.012368, -1.371941, 0.627451, 1, 0, 1,
-0.794128, -1.093808, -2.466947, 0.6196079, 1, 0, 1,
-0.7931544, 0.25228, -2.038965, 0.6156863, 1, 0, 1,
-0.7931219, -1.36805, -2.086835, 0.6078432, 1, 0, 1,
-0.7884401, 0.8705902, -2.275626, 0.6039216, 1, 0, 1,
-0.7759063, 0.8261333, -0.007091485, 0.5960785, 1, 0, 1,
-0.7671342, 0.414108, -2.917078, 0.5882353, 1, 0, 1,
-0.7646281, 1.122971, 0.5372397, 0.5843138, 1, 0, 1,
-0.7579884, -1.137621, -0.245291, 0.5764706, 1, 0, 1,
-0.7469656, 1.95724, -1.045008, 0.572549, 1, 0, 1,
-0.7387019, -0.7922803, -2.2494, 0.5647059, 1, 0, 1,
-0.7376125, 0.7820681, -1.610781, 0.5607843, 1, 0, 1,
-0.7314106, 1.228976, -1.354212, 0.5529412, 1, 0, 1,
-0.7293177, 0.1543867, -0.4959743, 0.5490196, 1, 0, 1,
-0.7221301, -1.007687, -2.899849, 0.5411765, 1, 0, 1,
-0.7149739, -0.2186772, -3.793704, 0.5372549, 1, 0, 1,
-0.7137951, -1.138176, -2.281175, 0.5294118, 1, 0, 1,
-0.7132177, 0.6869145, 0.5419319, 0.5254902, 1, 0, 1,
-0.7128145, -1.801417, -3.140237, 0.5176471, 1, 0, 1,
-0.7091008, -0.2556088, -0.8923362, 0.5137255, 1, 0, 1,
-0.707213, -0.3028254, -1.346422, 0.5058824, 1, 0, 1,
-0.7060175, -0.3473676, -2.338189, 0.5019608, 1, 0, 1,
-0.7026781, -0.01212041, -1.572687, 0.4941176, 1, 0, 1,
-0.6972832, -1.770572, -2.129603, 0.4862745, 1, 0, 1,
-0.6939484, 0.7318951, -2.370031, 0.4823529, 1, 0, 1,
-0.6913942, -0.4224881, -0.08227497, 0.4745098, 1, 0, 1,
-0.6817895, 0.5262381, -1.375075, 0.4705882, 1, 0, 1,
-0.6778694, 1.294516, 0.03336882, 0.4627451, 1, 0, 1,
-0.6751881, 1.149091, 0.8960771, 0.4588235, 1, 0, 1,
-0.6749359, 0.6171381, -2.247175, 0.4509804, 1, 0, 1,
-0.6715525, -2.096494, -3.730766, 0.4470588, 1, 0, 1,
-0.6698249, -0.8843392, -3.561519, 0.4392157, 1, 0, 1,
-0.6689339, 0.3521786, 0.3727897, 0.4352941, 1, 0, 1,
-0.6686108, 1.629796, -0.7788864, 0.427451, 1, 0, 1,
-0.6675351, -2.052246, -2.370145, 0.4235294, 1, 0, 1,
-0.6673664, 1.149187, -1.025321, 0.4156863, 1, 0, 1,
-0.6566103, 1.816705, -0.243481, 0.4117647, 1, 0, 1,
-0.6539723, 0.1387184, -0.03741044, 0.4039216, 1, 0, 1,
-0.65384, 0.2504836, -0.8247674, 0.3960784, 1, 0, 1,
-0.6492998, -0.3345137, -1.495785, 0.3921569, 1, 0, 1,
-0.6489181, -1.10247, -1.766015, 0.3843137, 1, 0, 1,
-0.6482605, -0.9382799, -2.072495, 0.3803922, 1, 0, 1,
-0.6482322, 0.003151316, -1.319493, 0.372549, 1, 0, 1,
-0.6414401, -0.3811282, -1.734103, 0.3686275, 1, 0, 1,
-0.640157, -1.06185, -2.109355, 0.3607843, 1, 0, 1,
-0.6356954, 0.8704741, -0.9339051, 0.3568628, 1, 0, 1,
-0.635604, 1.440352, -1.106018, 0.3490196, 1, 0, 1,
-0.6352673, -0.2128622, -2.975705, 0.345098, 1, 0, 1,
-0.635208, 1.72586, 0.1491363, 0.3372549, 1, 0, 1,
-0.6331295, -1.109221, -2.367144, 0.3333333, 1, 0, 1,
-0.6320174, 0.3761316, -1.407115, 0.3254902, 1, 0, 1,
-0.6315926, 0.1381866, -1.021768, 0.3215686, 1, 0, 1,
-0.6306427, -0.3687972, -1.763521, 0.3137255, 1, 0, 1,
-0.6236112, 0.09728255, -2.162522, 0.3098039, 1, 0, 1,
-0.6214803, -1.194107, -1.493367, 0.3019608, 1, 0, 1,
-0.6211829, -0.1558647, -2.108978, 0.2941177, 1, 0, 1,
-0.6195086, -1.158308, -3.663625, 0.2901961, 1, 0, 1,
-0.6194829, 0.1503207, -1.467611, 0.282353, 1, 0, 1,
-0.6161804, -0.8284975, -1.776486, 0.2784314, 1, 0, 1,
-0.6144732, -0.206546, -2.067764, 0.2705882, 1, 0, 1,
-0.6102455, -0.6211796, -0.9395471, 0.2666667, 1, 0, 1,
-0.605055, -1.508027, -3.571267, 0.2588235, 1, 0, 1,
-0.6023675, 0.5232214, -1.183204, 0.254902, 1, 0, 1,
-0.6017585, 1.694509, -1.343839, 0.2470588, 1, 0, 1,
-0.5992915, -2.11546, -3.737662, 0.2431373, 1, 0, 1,
-0.5982739, -0.393856, -2.943049, 0.2352941, 1, 0, 1,
-0.5968977, -0.7784905, -2.057993, 0.2313726, 1, 0, 1,
-0.5959297, 1.096462, 0.2540016, 0.2235294, 1, 0, 1,
-0.595035, 0.5866016, 0.5409513, 0.2196078, 1, 0, 1,
-0.5932664, -1.230369, -5.065207, 0.2117647, 1, 0, 1,
-0.5923034, 0.3332071, -1.37889, 0.2078431, 1, 0, 1,
-0.5812377, 1.119538, -2.071043, 0.2, 1, 0, 1,
-0.5799357, -0.7128364, -2.135728, 0.1921569, 1, 0, 1,
-0.5780739, -0.6531727, -3.180718, 0.1882353, 1, 0, 1,
-0.5696887, -0.3918059, -3.214931, 0.1803922, 1, 0, 1,
-0.5657262, -0.1378818, -1.641475, 0.1764706, 1, 0, 1,
-0.5609004, -0.8806634, -2.935181, 0.1686275, 1, 0, 1,
-0.5587659, 0.8262389, 0.09423769, 0.1647059, 1, 0, 1,
-0.5581331, -1.527822, -1.238093, 0.1568628, 1, 0, 1,
-0.5535411, 2.721697, 1.199467, 0.1529412, 1, 0, 1,
-0.5529118, 0.1044251, -1.921, 0.145098, 1, 0, 1,
-0.5525031, 0.07881001, -0.4893179, 0.1411765, 1, 0, 1,
-0.5441471, 1.148261, -0.03229123, 0.1333333, 1, 0, 1,
-0.5350531, -0.999754, -3.106829, 0.1294118, 1, 0, 1,
-0.533375, 1.364294, 0.09697649, 0.1215686, 1, 0, 1,
-0.5314016, 1.504463, -0.1993394, 0.1176471, 1, 0, 1,
-0.5297473, 0.7875482, 0.9332954, 0.1098039, 1, 0, 1,
-0.5254561, -0.004629807, -0.6767693, 0.1058824, 1, 0, 1,
-0.5189847, 0.9586993, 0.6452138, 0.09803922, 1, 0, 1,
-0.5140056, -0.4298664, -2.080967, 0.09019608, 1, 0, 1,
-0.5105084, -0.1549466, -1.885888, 0.08627451, 1, 0, 1,
-0.503271, 0.3642553, -1.009904, 0.07843138, 1, 0, 1,
-0.5015945, -0.0501441, -2.605309, 0.07450981, 1, 0, 1,
-0.4977276, 1.76317, -0.4275256, 0.06666667, 1, 0, 1,
-0.4914969, 0.506787, -2.272495, 0.0627451, 1, 0, 1,
-0.4914053, -0.06878416, -1.103614, 0.05490196, 1, 0, 1,
-0.4853399, -0.4768573, -3.604589, 0.05098039, 1, 0, 1,
-0.4812213, 1.134574, 0.5838911, 0.04313726, 1, 0, 1,
-0.4786218, -0.2536319, -1.766764, 0.03921569, 1, 0, 1,
-0.4783067, 0.1901371, -0.5902579, 0.03137255, 1, 0, 1,
-0.478031, 0.4708664, -0.8834952, 0.02745098, 1, 0, 1,
-0.4714858, -0.1371552, -1.160387, 0.01960784, 1, 0, 1,
-0.470834, -1.096585, -2.192881, 0.01568628, 1, 0, 1,
-0.464154, -0.8849773, -3.693753, 0.007843138, 1, 0, 1,
-0.4631145, -0.1230618, -1.933351, 0.003921569, 1, 0, 1,
-0.4573925, 0.3870675, -3.500436, 0, 1, 0.003921569, 1,
-0.4544908, -1.117691, -2.850061, 0, 1, 0.01176471, 1,
-0.4517714, 0.5501772, -1.162538, 0, 1, 0.01568628, 1,
-0.4503555, -0.4225139, -4.059911, 0, 1, 0.02352941, 1,
-0.4490656, -0.3332623, -1.897245, 0, 1, 0.02745098, 1,
-0.4448215, 0.1794379, -0.1023678, 0, 1, 0.03529412, 1,
-0.443635, -0.322468, -2.094833, 0, 1, 0.03921569, 1,
-0.436249, 0.3359651, 0.8728454, 0, 1, 0.04705882, 1,
-0.4348254, -1.945916, -3.637114, 0, 1, 0.05098039, 1,
-0.4343298, 0.7588454, 1.535878, 0, 1, 0.05882353, 1,
-0.4317275, 0.9646937, -0.3924885, 0, 1, 0.0627451, 1,
-0.4313942, 0.3967304, -0.1065913, 0, 1, 0.07058824, 1,
-0.4309405, -0.3581859, -0.7626649, 0, 1, 0.07450981, 1,
-0.4293389, -1.505829, -3.424728, 0, 1, 0.08235294, 1,
-0.4283785, 0.5102941, -0.03534418, 0, 1, 0.08627451, 1,
-0.4088284, 0.663675, -0.8893702, 0, 1, 0.09411765, 1,
-0.4006662, -1.546255, -3.821072, 0, 1, 0.1019608, 1,
-0.3968734, -0.5923137, -0.7377486, 0, 1, 0.1058824, 1,
-0.3941481, -1.042865, -3.004084, 0, 1, 0.1137255, 1,
-0.3862091, -0.7229826, -3.514134, 0, 1, 0.1176471, 1,
-0.384972, -0.1255942, -3.791021, 0, 1, 0.1254902, 1,
-0.3837388, 0.07293145, -0.4014678, 0, 1, 0.1294118, 1,
-0.3815786, 0.09301498, -1.493367, 0, 1, 0.1372549, 1,
-0.381451, 1.008051, -0.4786067, 0, 1, 0.1411765, 1,
-0.379971, 0.374624, -1.494796, 0, 1, 0.1490196, 1,
-0.3778918, 1.013695, -0.8746763, 0, 1, 0.1529412, 1,
-0.3758333, -0.1730256, -1.398429, 0, 1, 0.1607843, 1,
-0.3739969, -0.1616319, -1.994071, 0, 1, 0.1647059, 1,
-0.3718087, -0.2469746, -3.319475, 0, 1, 0.172549, 1,
-0.3685915, -0.9216785, -3.441049, 0, 1, 0.1764706, 1,
-0.3646353, 1.374919, 0.9045667, 0, 1, 0.1843137, 1,
-0.3625476, -0.01131232, 0.1407367, 0, 1, 0.1882353, 1,
-0.3618362, -0.8832543, -1.162109, 0, 1, 0.1960784, 1,
-0.3535132, -1.82997, -3.20546, 0, 1, 0.2039216, 1,
-0.3527148, 0.1640667, -0.8515767, 0, 1, 0.2078431, 1,
-0.3481359, -0.008075708, -3.329801, 0, 1, 0.2156863, 1,
-0.338743, 0.572952, 0.07160717, 0, 1, 0.2196078, 1,
-0.3328966, -0.4401747, -3.717947, 0, 1, 0.227451, 1,
-0.3298826, -0.2836369, -3.445722, 0, 1, 0.2313726, 1,
-0.3296971, 0.5321351, 1.455632, 0, 1, 0.2392157, 1,
-0.3275867, 0.975876, 2.228261, 0, 1, 0.2431373, 1,
-0.3137347, -1.155918, -3.381184, 0, 1, 0.2509804, 1,
-0.3127423, -0.6980983, -2.681484, 0, 1, 0.254902, 1,
-0.3084326, 1.525326, -2.135783, 0, 1, 0.2627451, 1,
-0.3066849, 2.006355, -0.5413582, 0, 1, 0.2666667, 1,
-0.3061044, -2.532881, -4.49877, 0, 1, 0.2745098, 1,
-0.3035794, 1.400372, -0.5535133, 0, 1, 0.2784314, 1,
-0.301309, -0.3807341, -4.011758, 0, 1, 0.2862745, 1,
-0.3001462, -0.4295792, -3.749276, 0, 1, 0.2901961, 1,
-0.2974081, -1.116595, -3.203593, 0, 1, 0.2980392, 1,
-0.2961294, 0.4708413, 0.4915902, 0, 1, 0.3058824, 1,
-0.2955792, -0.1990967, -2.586903, 0, 1, 0.3098039, 1,
-0.2933187, -1.020412, -2.961512, 0, 1, 0.3176471, 1,
-0.2926909, -1.147684, -4.236888, 0, 1, 0.3215686, 1,
-0.2924836, -0.6247131, -3.171964, 0, 1, 0.3294118, 1,
-0.2911807, -2.065364, -2.850008, 0, 1, 0.3333333, 1,
-0.288267, 1.202922, 0.1564873, 0, 1, 0.3411765, 1,
-0.286139, -1.414566, -3.596714, 0, 1, 0.345098, 1,
-0.2804186, -1.303082, -0.7199569, 0, 1, 0.3529412, 1,
-0.2784368, -0.4995053, -2.811211, 0, 1, 0.3568628, 1,
-0.2769782, 0.06498618, -2.769047, 0, 1, 0.3647059, 1,
-0.2761771, 1.298423, -0.587949, 0, 1, 0.3686275, 1,
-0.2741381, -0.6646129, -2.869813, 0, 1, 0.3764706, 1,
-0.272965, 1.358131, -1.002067, 0, 1, 0.3803922, 1,
-0.2720964, 0.8112575, -1.033136, 0, 1, 0.3882353, 1,
-0.2654747, 0.7033962, 0.8554227, 0, 1, 0.3921569, 1,
-0.2603248, 1.127513, 1.724295, 0, 1, 0.4, 1,
-0.2593533, -0.3987536, -3.17221, 0, 1, 0.4078431, 1,
-0.2586049, 0.8954974, -1.040316, 0, 1, 0.4117647, 1,
-0.2570834, 0.1590853, -2.598143, 0, 1, 0.4196078, 1,
-0.2504765, 1.222651, -0.71895, 0, 1, 0.4235294, 1,
-0.2486464, 0.4195483, -1.665417, 0, 1, 0.4313726, 1,
-0.2476134, 1.1846, -1.291558, 0, 1, 0.4352941, 1,
-0.2465425, -0.5935231, -2.388314, 0, 1, 0.4431373, 1,
-0.2433085, 0.61039, 0.2400147, 0, 1, 0.4470588, 1,
-0.2432393, -0.8115254, -1.810206, 0, 1, 0.454902, 1,
-0.2351111, 0.8359813, -0.8671383, 0, 1, 0.4588235, 1,
-0.2288448, 0.2128978, -2.502293, 0, 1, 0.4666667, 1,
-0.2273824, 1.224231, 0.1821604, 0, 1, 0.4705882, 1,
-0.2235937, -0.5477665, -1.56811, 0, 1, 0.4784314, 1,
-0.2230183, -1.025665, -2.642576, 0, 1, 0.4823529, 1,
-0.2219899, 0.610127, -0.1160012, 0, 1, 0.4901961, 1,
-0.2219049, -0.8239866, -2.208207, 0, 1, 0.4941176, 1,
-0.2214433, -0.3160462, -3.29435, 0, 1, 0.5019608, 1,
-0.2181589, -0.06407833, -1.942565, 0, 1, 0.509804, 1,
-0.216397, -0.6073936, -0.9243421, 0, 1, 0.5137255, 1,
-0.2152164, -0.706772, -1.29646, 0, 1, 0.5215687, 1,
-0.2056168, -0.7352404, -4.629266, 0, 1, 0.5254902, 1,
-0.2023537, -0.01435352, -3.228068, 0, 1, 0.5333334, 1,
-0.200802, -0.4958492, -1.603438, 0, 1, 0.5372549, 1,
-0.200166, 0.5043375, 1.338323, 0, 1, 0.5450981, 1,
-0.1966569, -1.635293, -3.299602, 0, 1, 0.5490196, 1,
-0.1952766, -0.3267099, -3.558358, 0, 1, 0.5568628, 1,
-0.1951281, 0.8704945, -0.3758308, 0, 1, 0.5607843, 1,
-0.1949575, 0.8080658, 2.132587, 0, 1, 0.5686275, 1,
-0.1937907, 1.341818, 0.3362432, 0, 1, 0.572549, 1,
-0.1909968, 0.09248717, -0.1005825, 0, 1, 0.5803922, 1,
-0.1907374, 1.293329, 0.13091, 0, 1, 0.5843138, 1,
-0.188918, -2.093219, -3.34851, 0, 1, 0.5921569, 1,
-0.1820679, -1.508128, -2.868299, 0, 1, 0.5960785, 1,
-0.1790378, 0.3009263, 0.5767705, 0, 1, 0.6039216, 1,
-0.1779201, -0.3673051, -3.628108, 0, 1, 0.6117647, 1,
-0.174495, -2.195973, -5.451279, 0, 1, 0.6156863, 1,
-0.1705089, -1.497615, -2.856075, 0, 1, 0.6235294, 1,
-0.1666456, -1.287856, -3.806077, 0, 1, 0.627451, 1,
-0.155073, 0.1610815, 0.455267, 0, 1, 0.6352941, 1,
-0.1527698, 0.2189584, -0.5126538, 0, 1, 0.6392157, 1,
-0.1524387, -1.115852, -3.034938, 0, 1, 0.6470588, 1,
-0.1505499, 0.6264364, 0.3206065, 0, 1, 0.6509804, 1,
-0.1495871, 0.4005788, -0.9443818, 0, 1, 0.6588235, 1,
-0.1491948, 0.8202506, -0.3060328, 0, 1, 0.6627451, 1,
-0.1476896, -1.298153, -4.056982, 0, 1, 0.6705883, 1,
-0.1466094, -0.7029034, -3.795304, 0, 1, 0.6745098, 1,
-0.1461763, -0.1821, -2.172573, 0, 1, 0.682353, 1,
-0.144593, -0.9053025, -1.24947, 0, 1, 0.6862745, 1,
-0.1437201, 0.4019994, 1.798189, 0, 1, 0.6941177, 1,
-0.1409775, 0.4760835, 1.89786, 0, 1, 0.7019608, 1,
-0.1373883, 1.803793, 0.178285, 0, 1, 0.7058824, 1,
-0.1348521, 0.6928849, -0.3693079, 0, 1, 0.7137255, 1,
-0.1343273, 0.8697903, -0.3131023, 0, 1, 0.7176471, 1,
-0.1322016, -0.5398523, -4.642221, 0, 1, 0.7254902, 1,
-0.1247906, -0.2502632, -2.603797, 0, 1, 0.7294118, 1,
-0.1230924, 0.08664157, -1.445285, 0, 1, 0.7372549, 1,
-0.1121081, -2.925536, -4.136226, 0, 1, 0.7411765, 1,
-0.1112513, 1.135637, 1.363861, 0, 1, 0.7490196, 1,
-0.1105438, 1.463175, 1.275479, 0, 1, 0.7529412, 1,
-0.1095755, 0.7423595, -2.900388, 0, 1, 0.7607843, 1,
-0.1077003, -1.308605, -1.671985, 0, 1, 0.7647059, 1,
-0.1073035, 0.6908999, -0.874366, 0, 1, 0.772549, 1,
-0.1066698, -1.581203, -5.10884, 0, 1, 0.7764706, 1,
-0.1027178, 0.3949836, -0.4158071, 0, 1, 0.7843137, 1,
-0.1008358, 0.02776531, -0.8167704, 0, 1, 0.7882353, 1,
-0.09871984, 0.2972941, -0.0680647, 0, 1, 0.7960784, 1,
-0.09512868, -2.020578, -1.951014, 0, 1, 0.8039216, 1,
-0.09349163, -0.08734861, -2.344872, 0, 1, 0.8078431, 1,
-0.08365566, 1.318233, 1.531328, 0, 1, 0.8156863, 1,
-0.08324689, 0.754273, -0.1233718, 0, 1, 0.8196079, 1,
-0.08228058, -0.4458028, -4.732575, 0, 1, 0.827451, 1,
-0.08165333, -1.176028, -4.833619, 0, 1, 0.8313726, 1,
-0.08110531, 0.4722216, -0.8322704, 0, 1, 0.8392157, 1,
-0.0768595, 0.7149431, 1.367088, 0, 1, 0.8431373, 1,
-0.0767159, -1.331039, -3.325791, 0, 1, 0.8509804, 1,
-0.07583503, -1.516737, -3.341323, 0, 1, 0.854902, 1,
-0.07538189, 1.017214, 0.3621267, 0, 1, 0.8627451, 1,
-0.07416922, 1.233124, -0.2741857, 0, 1, 0.8666667, 1,
-0.07202253, 0.09603854, -0.6655425, 0, 1, 0.8745098, 1,
-0.07200211, 0.4457861, -2.069082, 0, 1, 0.8784314, 1,
-0.07175992, -2.484895, -4.201996, 0, 1, 0.8862745, 1,
-0.07034474, -1.174431, -2.192507, 0, 1, 0.8901961, 1,
-0.0697151, -0.2560686, -1.302244, 0, 1, 0.8980392, 1,
-0.06897283, 0.239041, 1.669868, 0, 1, 0.9058824, 1,
-0.06867666, 1.411487, 0.09394722, 0, 1, 0.9098039, 1,
-0.06378534, -1.577894, -4.042267, 0, 1, 0.9176471, 1,
-0.06025223, -1.342765, -3.104833, 0, 1, 0.9215686, 1,
-0.05998812, -1.397964, -4.701815, 0, 1, 0.9294118, 1,
-0.05136079, 0.3488263, -1.321973, 0, 1, 0.9333333, 1,
-0.0373541, -1.231324, -3.947879, 0, 1, 0.9411765, 1,
-0.03582873, -1.468655, -4.470929, 0, 1, 0.945098, 1,
-0.0308954, -0.01246595, -2.578977, 0, 1, 0.9529412, 1,
-0.03044252, -1.367537, -1.791908, 0, 1, 0.9568627, 1,
-0.01996471, 0.174534, 0.8314275, 0, 1, 0.9647059, 1,
-0.01554969, 0.2822243, -0.3599153, 0, 1, 0.9686275, 1,
-0.01378665, -0.2702439, -4.31562, 0, 1, 0.9764706, 1,
-0.01220607, 0.4948044, 0.2228701, 0, 1, 0.9803922, 1,
-0.01095636, -0.327883, -2.77535, 0, 1, 0.9882353, 1,
-0.01024676, -0.2488005, -2.399916, 0, 1, 0.9921569, 1,
-0.002842509, -0.7151158, -2.837634, 0, 1, 1, 1,
-0.0006262024, 0.1530029, -0.8679238, 0, 0.9921569, 1, 1,
-0.0003517696, 1.298311, 0.3519311, 0, 0.9882353, 1, 1,
0.001368002, -0.9003596, 2.029672, 0, 0.9803922, 1, 1,
0.009179679, 0.4786072, -0.8851178, 0, 0.9764706, 1, 1,
0.01069142, -1.831494, 2.910476, 0, 0.9686275, 1, 1,
0.01164293, 0.6465128, 0.07591587, 0, 0.9647059, 1, 1,
0.01176182, -1.054048, 3.598111, 0, 0.9568627, 1, 1,
0.01197953, 0.3851059, 0.1203211, 0, 0.9529412, 1, 1,
0.01583593, -0.05342594, 4.489801, 0, 0.945098, 1, 1,
0.01646721, 0.4750558, -1.033427, 0, 0.9411765, 1, 1,
0.02528881, 0.8898199, 1.58299, 0, 0.9333333, 1, 1,
0.02954897, 0.9101816, 0.9553999, 0, 0.9294118, 1, 1,
0.03114562, -0.5265532, 1.570859, 0, 0.9215686, 1, 1,
0.03171458, 1.659124, 1.232695, 0, 0.9176471, 1, 1,
0.03185917, 1.028907, 0.991843, 0, 0.9098039, 1, 1,
0.03342573, -1.262965, 2.626153, 0, 0.9058824, 1, 1,
0.03414439, -1.576476, 2.203598, 0, 0.8980392, 1, 1,
0.03673007, -0.6485952, 2.020047, 0, 0.8901961, 1, 1,
0.04164055, -0.202199, 3.384616, 0, 0.8862745, 1, 1,
0.0452343, 0.2712456, -0.8341497, 0, 0.8784314, 1, 1,
0.04799867, 0.7656714, -1.709791, 0, 0.8745098, 1, 1,
0.0506156, -0.4074448, 1.637851, 0, 0.8666667, 1, 1,
0.05412595, -0.08460361, 2.149249, 0, 0.8627451, 1, 1,
0.05867263, 1.429871, -0.6745432, 0, 0.854902, 1, 1,
0.06244392, -1.262232, 4.57255, 0, 0.8509804, 1, 1,
0.06302879, 0.3268053, 0.2116687, 0, 0.8431373, 1, 1,
0.06890884, -0.1451597, 1.637477, 0, 0.8392157, 1, 1,
0.07037351, -1.55289, 3.874247, 0, 0.8313726, 1, 1,
0.07053447, -0.7369006, 3.065706, 0, 0.827451, 1, 1,
0.07249723, 0.2698159, 0.3325151, 0, 0.8196079, 1, 1,
0.07503925, 1.080287, 0.5606973, 0, 0.8156863, 1, 1,
0.07557689, 0.1259904, -0.3845717, 0, 0.8078431, 1, 1,
0.07738262, -0.1029567, 2.687319, 0, 0.8039216, 1, 1,
0.07931028, 0.2305553, -0.8295116, 0, 0.7960784, 1, 1,
0.07948668, 0.2949454, 0.9167443, 0, 0.7882353, 1, 1,
0.08154145, 0.3531083, -1.054512, 0, 0.7843137, 1, 1,
0.08445876, 0.7024962, -0.4300513, 0, 0.7764706, 1, 1,
0.08632777, -0.003373633, 1.387243, 0, 0.772549, 1, 1,
0.0863414, -0.7786877, 1.755627, 0, 0.7647059, 1, 1,
0.09039094, -0.3202179, 2.96888, 0, 0.7607843, 1, 1,
0.09101985, -1.374072, 4.081347, 0, 0.7529412, 1, 1,
0.09482865, -0.4601437, 6.029751, 0, 0.7490196, 1, 1,
0.09647895, -0.6465458, 2.599149, 0, 0.7411765, 1, 1,
0.09806001, -0.3282652, 2.951704, 0, 0.7372549, 1, 1,
0.1032557, -0.4522165, 1.460414, 0, 0.7294118, 1, 1,
0.1057616, 1.582662, 0.4960214, 0, 0.7254902, 1, 1,
0.1061506, -1.213303, 3.043414, 0, 0.7176471, 1, 1,
0.10922, 1.98889, 0.7736784, 0, 0.7137255, 1, 1,
0.1093087, 0.2306552, 0.352453, 0, 0.7058824, 1, 1,
0.1095527, -1.682273, 2.627968, 0, 0.6980392, 1, 1,
0.1112868, 1.480264, 0.01862313, 0, 0.6941177, 1, 1,
0.1132653, -0.542424, 2.469313, 0, 0.6862745, 1, 1,
0.1175674, -0.2714371, 3.693813, 0, 0.682353, 1, 1,
0.1193071, -1.424883, 2.83497, 0, 0.6745098, 1, 1,
0.1227103, 1.484858, 1.549237, 0, 0.6705883, 1, 1,
0.1251134, 0.192876, 0.08057381, 0, 0.6627451, 1, 1,
0.1272965, -0.06962947, 1.846047, 0, 0.6588235, 1, 1,
0.128904, -0.2458296, 3.860353, 0, 0.6509804, 1, 1,
0.1291983, 0.296128, -0.3180432, 0, 0.6470588, 1, 1,
0.1324897, 1.5017, 1.412084, 0, 0.6392157, 1, 1,
0.134815, 0.5255398, 0.4352554, 0, 0.6352941, 1, 1,
0.1363302, 0.1068971, 2.967126, 0, 0.627451, 1, 1,
0.1420211, -0.02596266, 2.092663, 0, 0.6235294, 1, 1,
0.1446128, -2.119064, 2.568206, 0, 0.6156863, 1, 1,
0.15058, 0.233321, 0.9795788, 0, 0.6117647, 1, 1,
0.1522626, 0.3760823, -0.5353248, 0, 0.6039216, 1, 1,
0.1536816, -0.03442577, 1.911242, 0, 0.5960785, 1, 1,
0.1545337, 1.669506, 0.3667448, 0, 0.5921569, 1, 1,
0.1594073, 0.3788656, 0.8428192, 0, 0.5843138, 1, 1,
0.1648593, 0.08307557, 0.4406085, 0, 0.5803922, 1, 1,
0.1697182, -0.2209084, 0.9418622, 0, 0.572549, 1, 1,
0.1701311, -1.175067, 2.362504, 0, 0.5686275, 1, 1,
0.1723321, -0.4431227, 2.956531, 0, 0.5607843, 1, 1,
0.1772125, 0.7051522, 2.37274, 0, 0.5568628, 1, 1,
0.1793509, 1.649853, 1.840964, 0, 0.5490196, 1, 1,
0.1799089, -0.676915, 2.463, 0, 0.5450981, 1, 1,
0.1816187, -0.3827034, 3.717252, 0, 0.5372549, 1, 1,
0.1867678, 0.1181666, 0.5705836, 0, 0.5333334, 1, 1,
0.1871012, 0.6090444, -1.234743, 0, 0.5254902, 1, 1,
0.1883045, -1.089861, 2.919909, 0, 0.5215687, 1, 1,
0.191839, 0.2759108, 3.291413, 0, 0.5137255, 1, 1,
0.1950897, -1.174303, 1.728985, 0, 0.509804, 1, 1,
0.1968328, -0.8026111, 2.065889, 0, 0.5019608, 1, 1,
0.1985615, 0.1840029, 1.462459, 0, 0.4941176, 1, 1,
0.2033785, 0.3048078, 0.6195661, 0, 0.4901961, 1, 1,
0.2047255, -1.495777, 2.270673, 0, 0.4823529, 1, 1,
0.2070697, -0.8854205, 0.4357655, 0, 0.4784314, 1, 1,
0.2130271, -0.7516072, 2.352407, 0, 0.4705882, 1, 1,
0.2166104, -1.701637, 3.02471, 0, 0.4666667, 1, 1,
0.2178009, 0.131244, 2.227574, 0, 0.4588235, 1, 1,
0.2194999, 0.5493392, 1.392902, 0, 0.454902, 1, 1,
0.2225307, 0.949351, 2.228076, 0, 0.4470588, 1, 1,
0.2249858, -0.2964765, 4.214831, 0, 0.4431373, 1, 1,
0.2308052, -0.3807003, 4.047752, 0, 0.4352941, 1, 1,
0.2321022, -0.6328443, 2.158034, 0, 0.4313726, 1, 1,
0.2385392, -0.05956561, 1.382118, 0, 0.4235294, 1, 1,
0.2398341, 0.0782855, 0.8647594, 0, 0.4196078, 1, 1,
0.2481696, 0.691258, -0.7790251, 0, 0.4117647, 1, 1,
0.2517352, 0.05426525, 1.588454, 0, 0.4078431, 1, 1,
0.2581232, -1.816055, 2.063786, 0, 0.4, 1, 1,
0.2630105, 1.647998, -0.1327423, 0, 0.3921569, 1, 1,
0.2640313, -1.516334, 2.702737, 0, 0.3882353, 1, 1,
0.2643194, -2.079471, 2.611086, 0, 0.3803922, 1, 1,
0.2674479, 0.4104009, 1.096971, 0, 0.3764706, 1, 1,
0.2680085, -0.8964251, 1.762102, 0, 0.3686275, 1, 1,
0.2705715, -2.4534, 2.927783, 0, 0.3647059, 1, 1,
0.2715614, 1.637971, 1.018294, 0, 0.3568628, 1, 1,
0.2742772, -1.674503, 3.535069, 0, 0.3529412, 1, 1,
0.2779034, 0.8420041, 0.7769791, 0, 0.345098, 1, 1,
0.2809309, 0.02481928, 1.086366, 0, 0.3411765, 1, 1,
0.2823763, -0.5063962, 2.340621, 0, 0.3333333, 1, 1,
0.2831889, -1.986636, 2.55313, 0, 0.3294118, 1, 1,
0.2841791, -0.07359832, 1.663454, 0, 0.3215686, 1, 1,
0.2852574, -0.4646062, 2.101527, 0, 0.3176471, 1, 1,
0.2899034, 0.1743196, 1.872299, 0, 0.3098039, 1, 1,
0.2914766, -0.3494691, 0.3765169, 0, 0.3058824, 1, 1,
0.2928253, -1.031185, 2.910153, 0, 0.2980392, 1, 1,
0.2930694, -0.09536476, 1.04924, 0, 0.2901961, 1, 1,
0.2931793, 0.5378592, 0.7024391, 0, 0.2862745, 1, 1,
0.3010177, -1.606269, 3.186062, 0, 0.2784314, 1, 1,
0.3021094, -1.85027, 3.10875, 0, 0.2745098, 1, 1,
0.3026855, -1.453287, 2.659521, 0, 0.2666667, 1, 1,
0.3055371, 0.619593, 0.2005306, 0, 0.2627451, 1, 1,
0.3129566, -1.600047, 4.873111, 0, 0.254902, 1, 1,
0.3153842, 0.9667898, -0.1309998, 0, 0.2509804, 1, 1,
0.319585, -0.3022432, 1.208045, 0, 0.2431373, 1, 1,
0.3232435, -0.06548659, 2.163513, 0, 0.2392157, 1, 1,
0.3257035, 0.2745918, 1.668875, 0, 0.2313726, 1, 1,
0.3289994, 0.3853137, 0.6630933, 0, 0.227451, 1, 1,
0.3305089, -0.08983214, 2.169558, 0, 0.2196078, 1, 1,
0.3320965, -0.7543327, 2.225633, 0, 0.2156863, 1, 1,
0.3328717, 0.289789, 1.234595, 0, 0.2078431, 1, 1,
0.3365523, -0.9058873, 2.233383, 0, 0.2039216, 1, 1,
0.3374421, -1.172644, 2.81898, 0, 0.1960784, 1, 1,
0.3377478, 0.09344108, 1.182345, 0, 0.1882353, 1, 1,
0.339259, -0.6968768, 1.773435, 0, 0.1843137, 1, 1,
0.3417468, -0.7571398, 3.597012, 0, 0.1764706, 1, 1,
0.3502536, 1.289279, 0.7366135, 0, 0.172549, 1, 1,
0.3513732, -1.514412, 2.69306, 0, 0.1647059, 1, 1,
0.3587915, -1.575088, 2.821784, 0, 0.1607843, 1, 1,
0.3595099, -0.06865355, 2.701349, 0, 0.1529412, 1, 1,
0.3631297, -1.301924, 3.015765, 0, 0.1490196, 1, 1,
0.3633067, -1.460561, 1.568534, 0, 0.1411765, 1, 1,
0.364335, 1.419286, 1.383257, 0, 0.1372549, 1, 1,
0.366785, 0.4610311, 0.1866934, 0, 0.1294118, 1, 1,
0.3674658, 0.7404265, 0.3931419, 0, 0.1254902, 1, 1,
0.3704405, -0.5978824, 3.478883, 0, 0.1176471, 1, 1,
0.3710782, -0.7234365, 3.920775, 0, 0.1137255, 1, 1,
0.3727316, 1.405436, 1.886369, 0, 0.1058824, 1, 1,
0.375591, 0.7131923, 1.695188, 0, 0.09803922, 1, 1,
0.37727, 0.3339808, 3.059505, 0, 0.09411765, 1, 1,
0.3783875, -0.279505, 2.289635, 0, 0.08627451, 1, 1,
0.3804672, -0.5631343, 2.546619, 0, 0.08235294, 1, 1,
0.3827304, -0.3605787, 3.098495, 0, 0.07450981, 1, 1,
0.3840569, -1.882478, 4.240423, 0, 0.07058824, 1, 1,
0.3852772, 0.77106, 0.743385, 0, 0.0627451, 1, 1,
0.3879642, 0.08368074, 2.009109, 0, 0.05882353, 1, 1,
0.3892226, 0.3596485, 0.3503351, 0, 0.05098039, 1, 1,
0.3912894, 1.590006, 0.9374745, 0, 0.04705882, 1, 1,
0.391881, -0.8458368, 5.137379, 0, 0.03921569, 1, 1,
0.396355, 0.2848911, 0.8935342, 0, 0.03529412, 1, 1,
0.4005969, 0.9177088, 1.001471, 0, 0.02745098, 1, 1,
0.4034171, -0.2224597, 1.51443, 0, 0.02352941, 1, 1,
0.4099609, -0.5204673, 1.860024, 0, 0.01568628, 1, 1,
0.411128, 0.6136611, -0.6705086, 0, 0.01176471, 1, 1,
0.4172003, -0.7794365, 1.571824, 0, 0.003921569, 1, 1,
0.4196945, 0.5337784, 0.8748561, 0.003921569, 0, 1, 1,
0.4265591, 1.770386, -1.329941, 0.007843138, 0, 1, 1,
0.4366922, 1.340193, 1.859689, 0.01568628, 0, 1, 1,
0.4391087, 0.6595063, 1.566446, 0.01960784, 0, 1, 1,
0.439426, 0.4110118, 2.246312, 0.02745098, 0, 1, 1,
0.4418407, 0.1529314, 0.6550962, 0.03137255, 0, 1, 1,
0.4427799, -0.5452155, 3.079262, 0.03921569, 0, 1, 1,
0.4429194, -0.6880736, 0.950591, 0.04313726, 0, 1, 1,
0.4473186, -0.3842299, 1.241145, 0.05098039, 0, 1, 1,
0.4511582, -0.07138553, 3.265253, 0.05490196, 0, 1, 1,
0.457105, 0.8238875, 2.192976, 0.0627451, 0, 1, 1,
0.4583696, 0.07363582, 1.983933, 0.06666667, 0, 1, 1,
0.4626248, -0.6006216, 2.73396, 0.07450981, 0, 1, 1,
0.4701828, -0.08546437, 2.810506, 0.07843138, 0, 1, 1,
0.4704312, 0.7881625, 2.672461, 0.08627451, 0, 1, 1,
0.4757629, -1.371276, 2.084179, 0.09019608, 0, 1, 1,
0.4814595, 1.081439, 0.578577, 0.09803922, 0, 1, 1,
0.4820677, 1.425181, 0.07089016, 0.1058824, 0, 1, 1,
0.4846252, -1.906791, 3.381117, 0.1098039, 0, 1, 1,
0.4886839, 0.4945419, 2.854458, 0.1176471, 0, 1, 1,
0.4931915, 0.9627362, 1.011916, 0.1215686, 0, 1, 1,
0.4937717, 0.7639305, 1.146828, 0.1294118, 0, 1, 1,
0.4955519, -0.3594117, 2.806192, 0.1333333, 0, 1, 1,
0.4958877, 0.1600769, 3.802904, 0.1411765, 0, 1, 1,
0.4993871, -0.02561846, 4.006793, 0.145098, 0, 1, 1,
0.5123438, 1.641403, 0.5174747, 0.1529412, 0, 1, 1,
0.5145589, -0.9403289, 3.300877, 0.1568628, 0, 1, 1,
0.5148227, -0.1345231, 2.324384, 0.1647059, 0, 1, 1,
0.5187396, 0.06756414, 0.3106264, 0.1686275, 0, 1, 1,
0.5196482, -0.03865432, 0.6765668, 0.1764706, 0, 1, 1,
0.5197571, 0.7515252, 0.5440742, 0.1803922, 0, 1, 1,
0.5233437, -0.7752135, 1.759772, 0.1882353, 0, 1, 1,
0.5274177, 0.6790295, 1.895571, 0.1921569, 0, 1, 1,
0.5281945, 0.43989, 1.149933, 0.2, 0, 1, 1,
0.5300538, -0.1732366, 1.977275, 0.2078431, 0, 1, 1,
0.5396773, 0.9349803, -2.792071, 0.2117647, 0, 1, 1,
0.5428812, 0.2179267, 1.50722, 0.2196078, 0, 1, 1,
0.5437002, -0.07525426, 2.124861, 0.2235294, 0, 1, 1,
0.54372, -0.6388327, 2.820241, 0.2313726, 0, 1, 1,
0.5450784, 0.7794929, 0.6478754, 0.2352941, 0, 1, 1,
0.5499267, 0.1846191, 1.914026, 0.2431373, 0, 1, 1,
0.5530886, -1.442219, 1.899264, 0.2470588, 0, 1, 1,
0.5533732, 2.327907, -1.318426, 0.254902, 0, 1, 1,
0.5564149, 1.399763, 0.4049484, 0.2588235, 0, 1, 1,
0.5568814, -1.836068, 1.637036, 0.2666667, 0, 1, 1,
0.5571682, 0.5433003, 2.42323, 0.2705882, 0, 1, 1,
0.5615516, -0.9249003, 2.475658, 0.2784314, 0, 1, 1,
0.5617113, -1.868939, 1.710544, 0.282353, 0, 1, 1,
0.5631424, 0.9258208, 0.1709418, 0.2901961, 0, 1, 1,
0.5639368, 0.7685203, 1.607711, 0.2941177, 0, 1, 1,
0.5690973, 0.6334768, 0.2772513, 0.3019608, 0, 1, 1,
0.5692968, -1.602814, 3.49212, 0.3098039, 0, 1, 1,
0.5696256, -1.165668, 2.591953, 0.3137255, 0, 1, 1,
0.5763607, -0.3606111, 1.541194, 0.3215686, 0, 1, 1,
0.5776314, 0.9591336, -0.8934866, 0.3254902, 0, 1, 1,
0.5783201, -0.4746665, 1.704344, 0.3333333, 0, 1, 1,
0.5818938, 0.3104908, 2.185422, 0.3372549, 0, 1, 1,
0.5825716, -0.4839354, 2.518835, 0.345098, 0, 1, 1,
0.5835907, -1.091493, 3.419556, 0.3490196, 0, 1, 1,
0.5836751, -0.2339001, 2.291689, 0.3568628, 0, 1, 1,
0.58634, 0.8296732, -0.5188923, 0.3607843, 0, 1, 1,
0.5918205, 0.2670391, 0.7743412, 0.3686275, 0, 1, 1,
0.5931779, 0.7075661, 1.57203, 0.372549, 0, 1, 1,
0.5934637, 1.485651, -0.3435095, 0.3803922, 0, 1, 1,
0.5977786, -1.625566, 2.994185, 0.3843137, 0, 1, 1,
0.5980404, 0.3196151, 0.9606891, 0.3921569, 0, 1, 1,
0.6018894, 0.419097, 3.42728, 0.3960784, 0, 1, 1,
0.6056249, 0.1909135, 1.945449, 0.4039216, 0, 1, 1,
0.6125118, -0.1675702, 1.924677, 0.4117647, 0, 1, 1,
0.6216751, 0.1655859, 1.391238, 0.4156863, 0, 1, 1,
0.6225962, 2.092936, 0.8596529, 0.4235294, 0, 1, 1,
0.6267941, 0.02153706, 0.4276414, 0.427451, 0, 1, 1,
0.6543853, -0.6803929, 4.263459, 0.4352941, 0, 1, 1,
0.6563759, -0.7388669, 2.597133, 0.4392157, 0, 1, 1,
0.6682879, -0.8582167, 3.567498, 0.4470588, 0, 1, 1,
0.6692535, -0.2224135, 2.995003, 0.4509804, 0, 1, 1,
0.6750976, -1.23742, 2.267136, 0.4588235, 0, 1, 1,
0.6817297, -1.36768, 3.8384, 0.4627451, 0, 1, 1,
0.6846721, 0.6713998, 2.288909, 0.4705882, 0, 1, 1,
0.6881184, 0.0360443, 1.269192, 0.4745098, 0, 1, 1,
0.6884688, -0.2059741, -0.2623229, 0.4823529, 0, 1, 1,
0.6935823, -1.114422, 2.401226, 0.4862745, 0, 1, 1,
0.6943817, -1.213232, 1.228096, 0.4941176, 0, 1, 1,
0.6957038, -1.487377, 1.781269, 0.5019608, 0, 1, 1,
0.6985195, -2.041432, 3.21878, 0.5058824, 0, 1, 1,
0.7039026, 1.142354, 0.559422, 0.5137255, 0, 1, 1,
0.7108389, 0.6292011, 1.342201, 0.5176471, 0, 1, 1,
0.7149447, -1.632955, 3.297514, 0.5254902, 0, 1, 1,
0.7155576, 0.5892493, 0.5093558, 0.5294118, 0, 1, 1,
0.7195283, -1.729203, 3.12524, 0.5372549, 0, 1, 1,
0.7327969, -0.5411785, 1.947975, 0.5411765, 0, 1, 1,
0.7350373, 0.190401, 1.03887, 0.5490196, 0, 1, 1,
0.7542971, 0.06350821, 2.370637, 0.5529412, 0, 1, 1,
0.754904, -0.2523085, 3.771472, 0.5607843, 0, 1, 1,
0.7560444, 1.864997, -1.375351, 0.5647059, 0, 1, 1,
0.7612867, -1.014395, 3.264397, 0.572549, 0, 1, 1,
0.762163, 0.01960913, 0.8797182, 0.5764706, 0, 1, 1,
0.7678655, 1.935583, 0.3481437, 0.5843138, 0, 1, 1,
0.770179, -0.2349451, 1.366437, 0.5882353, 0, 1, 1,
0.7707665, 0.2983619, 1.71396, 0.5960785, 0, 1, 1,
0.7708139, -0.2233501, 1.677615, 0.6039216, 0, 1, 1,
0.7709299, 0.2370614, 0.397156, 0.6078432, 0, 1, 1,
0.7747822, -0.8675811, 2.519136, 0.6156863, 0, 1, 1,
0.7754422, -0.7962172, 1.940858, 0.6196079, 0, 1, 1,
0.7801023, -1.023975, 2.185382, 0.627451, 0, 1, 1,
0.7811707, -0.06252278, 1.573133, 0.6313726, 0, 1, 1,
0.7865938, 0.2100296, 3.660658, 0.6392157, 0, 1, 1,
0.7870219, 0.08410206, 1.315097, 0.6431373, 0, 1, 1,
0.7882494, 1.384899, 3.061564, 0.6509804, 0, 1, 1,
0.7932193, -1.647192, 1.980346, 0.654902, 0, 1, 1,
0.7970349, 1.636299, -2.481171, 0.6627451, 0, 1, 1,
0.8079616, -0.2991321, 3.097093, 0.6666667, 0, 1, 1,
0.8118019, 0.4630097, 0.3705543, 0.6745098, 0, 1, 1,
0.8132352, 0.08518124, 0.3292286, 0.6784314, 0, 1, 1,
0.8277097, 1.671788, 2.338922, 0.6862745, 0, 1, 1,
0.8385525, -0.5446547, 2.030567, 0.6901961, 0, 1, 1,
0.8404449, -1.573964, 1.676333, 0.6980392, 0, 1, 1,
0.8590971, -0.7897986, 2.656917, 0.7058824, 0, 1, 1,
0.861181, -0.2320645, 0.4278554, 0.7098039, 0, 1, 1,
0.861832, -0.1048886, 3.712793, 0.7176471, 0, 1, 1,
0.8717201, 0.9938391, -0.07262559, 0.7215686, 0, 1, 1,
0.8738507, 1.049401, 1.077922, 0.7294118, 0, 1, 1,
0.8758726, -0.1138719, 3.370602, 0.7333333, 0, 1, 1,
0.8820566, -0.6003808, 1.609397, 0.7411765, 0, 1, 1,
0.8850859, -0.4209244, 1.727233, 0.7450981, 0, 1, 1,
0.886742, 2.567873, 0.44739, 0.7529412, 0, 1, 1,
0.88679, -0.3658055, 2.584423, 0.7568628, 0, 1, 1,
0.8893229, -0.5675265, 2.855073, 0.7647059, 0, 1, 1,
0.8929617, -0.09450326, 1.33689, 0.7686275, 0, 1, 1,
0.8961145, -0.3719196, 0.9954655, 0.7764706, 0, 1, 1,
0.8991425, 0.1462029, 1.146916, 0.7803922, 0, 1, 1,
0.9004274, 0.5166112, 2.093557, 0.7882353, 0, 1, 1,
0.9010464, -0.5062336, 2.149947, 0.7921569, 0, 1, 1,
0.9070819, 0.9106575, 0.8057244, 0.8, 0, 1, 1,
0.9178128, -1.281794, 3.326258, 0.8078431, 0, 1, 1,
0.9184511, -0.3265159, 1.885146, 0.8117647, 0, 1, 1,
0.9189883, -0.8386063, 2.801335, 0.8196079, 0, 1, 1,
0.9205663, 0.5827069, 1.139515, 0.8235294, 0, 1, 1,
0.9225793, 0.1093646, 1.055305, 0.8313726, 0, 1, 1,
0.9280899, -1.08658, 3.068679, 0.8352941, 0, 1, 1,
0.9504949, -1.069864, 1.981012, 0.8431373, 0, 1, 1,
0.9521771, 0.5518103, -0.2211671, 0.8470588, 0, 1, 1,
0.953047, 0.4829497, 1.688924, 0.854902, 0, 1, 1,
0.9660453, -1.041752, 1.551315, 0.8588235, 0, 1, 1,
0.9720345, 1.112809, 0.8251739, 0.8666667, 0, 1, 1,
0.9728962, -0.01125173, 2.635678, 0.8705882, 0, 1, 1,
0.9731274, -0.3679861, 2.421208, 0.8784314, 0, 1, 1,
0.9784731, 2.35324, -1.542259, 0.8823529, 0, 1, 1,
0.9842405, -0.8011394, 4.705524, 0.8901961, 0, 1, 1,
0.9898931, 1.539384, 0.5978953, 0.8941177, 0, 1, 1,
0.9948584, -1.527204, 2.967225, 0.9019608, 0, 1, 1,
0.9969282, -1.052406, 1.694318, 0.9098039, 0, 1, 1,
0.9995784, 0.2755604, 1.722733, 0.9137255, 0, 1, 1,
0.9996509, -1.465933, 3.932239, 0.9215686, 0, 1, 1,
1.005136, -0.6386057, 2.9706, 0.9254902, 0, 1, 1,
1.006464, -0.3184158, 2.81757, 0.9333333, 0, 1, 1,
1.012729, -0.07163716, 3.502956, 0.9372549, 0, 1, 1,
1.013458, -0.6126124, 3.390604, 0.945098, 0, 1, 1,
1.013846, -0.09257102, 1.778567, 0.9490196, 0, 1, 1,
1.013952, 0.08236848, 2.580356, 0.9568627, 0, 1, 1,
1.016379, -1.052526, 4.063593, 0.9607843, 0, 1, 1,
1.023341, 0.6498138, 1.231607, 0.9686275, 0, 1, 1,
1.03763, -0.2606686, 0.9651181, 0.972549, 0, 1, 1,
1.03864, -0.8100048, 2.37988, 0.9803922, 0, 1, 1,
1.04067, -0.4350803, 1.580459, 0.9843137, 0, 1, 1,
1.060075, 0.1244105, 0.8651674, 0.9921569, 0, 1, 1,
1.067066, 1.202941, 0.5031099, 0.9960784, 0, 1, 1,
1.068563, -0.9481695, 1.273823, 1, 0, 0.9960784, 1,
1.077159, -0.9704218, 2.698574, 1, 0, 0.9882353, 1,
1.078593, -1.071127, 1.075279, 1, 0, 0.9843137, 1,
1.088871, -2.143219, 3.106746, 1, 0, 0.9764706, 1,
1.092382, 2.232556, 0.7440009, 1, 0, 0.972549, 1,
1.097263, -0.1848159, 0.8116733, 1, 0, 0.9647059, 1,
1.108475, -0.4596629, 2.87167, 1, 0, 0.9607843, 1,
1.112984, 0.1730144, 0.9156303, 1, 0, 0.9529412, 1,
1.114506, 0.4062653, 0.2067144, 1, 0, 0.9490196, 1,
1.117472, -2.420292, 3.173855, 1, 0, 0.9411765, 1,
1.133227, -0.1080457, 2.374196, 1, 0, 0.9372549, 1,
1.136729, 1.609935, 0.9082376, 1, 0, 0.9294118, 1,
1.13765, -0.3503328, 0.8684611, 1, 0, 0.9254902, 1,
1.138326, -0.7144265, 1.326219, 1, 0, 0.9176471, 1,
1.139905, -0.3189407, 2.323186, 1, 0, 0.9137255, 1,
1.142649, -1.119305, 2.837215, 1, 0, 0.9058824, 1,
1.151424, 0.3610449, 1.011973, 1, 0, 0.9019608, 1,
1.162613, -0.6323103, 1.980645, 1, 0, 0.8941177, 1,
1.16697, 0.5677814, 1.723505, 1, 0, 0.8862745, 1,
1.167273, -1.352601, 3.922623, 1, 0, 0.8823529, 1,
1.169163, -0.3355004, 1.193025, 1, 0, 0.8745098, 1,
1.170109, -0.5338312, 2.26578, 1, 0, 0.8705882, 1,
1.177739, 1.468937, 0.9600253, 1, 0, 0.8627451, 1,
1.178982, -0.005800892, 1.797924, 1, 0, 0.8588235, 1,
1.179426, -0.637836, 1.477568, 1, 0, 0.8509804, 1,
1.186112, -0.2630703, 1.872096, 1, 0, 0.8470588, 1,
1.18637, 1.27772, 0.1894535, 1, 0, 0.8392157, 1,
1.19401, -2.026143, 1.324259, 1, 0, 0.8352941, 1,
1.20277, -0.8652986, 2.9769, 1, 0, 0.827451, 1,
1.203051, 0.5523799, 1.757607, 1, 0, 0.8235294, 1,
1.215992, -0.1019365, -0.1715291, 1, 0, 0.8156863, 1,
1.228918, -0.3700885, 2.134929, 1, 0, 0.8117647, 1,
1.242037, -0.7260185, 3.191034, 1, 0, 0.8039216, 1,
1.242154, 0.1923958, 0.2140494, 1, 0, 0.7960784, 1,
1.24474, 1.277358, -0.1172654, 1, 0, 0.7921569, 1,
1.245735, 0.1648012, 1.858683, 1, 0, 0.7843137, 1,
1.255184, 0.8641472, 0.8652562, 1, 0, 0.7803922, 1,
1.259732, -0.6152242, 2.208458, 1, 0, 0.772549, 1,
1.260662, -0.8360752, 2.917917, 1, 0, 0.7686275, 1,
1.262376, 0.08617303, 0.2362073, 1, 0, 0.7607843, 1,
1.267738, -0.6278018, -0.2571663, 1, 0, 0.7568628, 1,
1.270192, 1.520536, 0.7662942, 1, 0, 0.7490196, 1,
1.272445, -1.759141, 3.308895, 1, 0, 0.7450981, 1,
1.274541, 0.05755409, 0.7254365, 1, 0, 0.7372549, 1,
1.278791, -0.007718547, 0.8905508, 1, 0, 0.7333333, 1,
1.284614, -0.2262167, 0.9527825, 1, 0, 0.7254902, 1,
1.308176, 0.2780839, 0.6443391, 1, 0, 0.7215686, 1,
1.313757, -0.4389919, 1.470266, 1, 0, 0.7137255, 1,
1.320492, 0.4652485, -0.1684136, 1, 0, 0.7098039, 1,
1.320767, 0.4125541, 0.104273, 1, 0, 0.7019608, 1,
1.325028, -1.108283, 1.197337, 1, 0, 0.6941177, 1,
1.325842, 0.5496079, 0.6610085, 1, 0, 0.6901961, 1,
1.330539, 0.7910714, 0.2406752, 1, 0, 0.682353, 1,
1.335552, -1.06168, 1.98508, 1, 0, 0.6784314, 1,
1.338647, -1.098035, 0.4390979, 1, 0, 0.6705883, 1,
1.353381, -1.680918, 2.491251, 1, 0, 0.6666667, 1,
1.356635, 0.4230116, 0.8342934, 1, 0, 0.6588235, 1,
1.358281, -1.846464, 0.9269873, 1, 0, 0.654902, 1,
1.364326, -0.3352573, 0.07405856, 1, 0, 0.6470588, 1,
1.366211, -0.9522629, 1.216344, 1, 0, 0.6431373, 1,
1.368825, -1.077449, 1.158339, 1, 0, 0.6352941, 1,
1.372696, 0.3000292, 0.988888, 1, 0, 0.6313726, 1,
1.382445, 0.09303147, -1.079068, 1, 0, 0.6235294, 1,
1.390191, 0.585174, 2.711028, 1, 0, 0.6196079, 1,
1.393929, -0.636902, 2.483098, 1, 0, 0.6117647, 1,
1.400762, -1.468226, 1.767179, 1, 0, 0.6078432, 1,
1.408715, -2.360965, 2.10393, 1, 0, 0.6, 1,
1.4094, 1.465868, 2.16308, 1, 0, 0.5921569, 1,
1.413979, 0.2488445, 1.142456, 1, 0, 0.5882353, 1,
1.417111, 0.8443898, 0.8838865, 1, 0, 0.5803922, 1,
1.418068, 0.2369162, 4.160806, 1, 0, 0.5764706, 1,
1.421221, 1.042591, 1.861553, 1, 0, 0.5686275, 1,
1.421762, -0.2050715, 1.712753, 1, 0, 0.5647059, 1,
1.434316, -0.855577, 2.468496, 1, 0, 0.5568628, 1,
1.435424, -0.5582844, 0.9696902, 1, 0, 0.5529412, 1,
1.443553, 0.08674978, 1.568317, 1, 0, 0.5450981, 1,
1.449383, 0.5643063, -0.7023796, 1, 0, 0.5411765, 1,
1.473565, 0.456728, 1.648006, 1, 0, 0.5333334, 1,
1.48328, 2.284813, 0.045782, 1, 0, 0.5294118, 1,
1.489858, 0.7188538, 0.9286624, 1, 0, 0.5215687, 1,
1.509335, -2.288077, 3.115709, 1, 0, 0.5176471, 1,
1.512203, 1.679137, 0.2024008, 1, 0, 0.509804, 1,
1.515054, 0.2949279, -0.5765796, 1, 0, 0.5058824, 1,
1.516133, 2.125026, 1.1939, 1, 0, 0.4980392, 1,
1.516786, -0.3253732, 3.46522, 1, 0, 0.4901961, 1,
1.528188, -0.4839468, 1.662815, 1, 0, 0.4862745, 1,
1.555677, 1.634276, 0.836621, 1, 0, 0.4784314, 1,
1.567817, 0.4114105, 2.441195, 1, 0, 0.4745098, 1,
1.572303, 0.4214598, -0.3828278, 1, 0, 0.4666667, 1,
1.587562, 0.2030267, 1.607588, 1, 0, 0.4627451, 1,
1.590977, 0.03855048, 1.96443, 1, 0, 0.454902, 1,
1.611816, 2.083732, 0.4679584, 1, 0, 0.4509804, 1,
1.614447, -0.151201, 1.438415, 1, 0, 0.4431373, 1,
1.615478, 0.7074446, 1.153834, 1, 0, 0.4392157, 1,
1.615971, 0.03238739, 1.451892, 1, 0, 0.4313726, 1,
1.616804, -1.269342, 2.758293, 1, 0, 0.427451, 1,
1.621736, -1.145702, 4.50741, 1, 0, 0.4196078, 1,
1.622035, -0.02315143, 2.939736, 1, 0, 0.4156863, 1,
1.624821, 2.541259, -0.6467016, 1, 0, 0.4078431, 1,
1.629106, 1.02404, 0.4363693, 1, 0, 0.4039216, 1,
1.639899, -0.2152831, 2.538609, 1, 0, 0.3960784, 1,
1.642043, -0.7604853, 0.7206748, 1, 0, 0.3882353, 1,
1.655458, -0.1515558, 0.1313073, 1, 0, 0.3843137, 1,
1.658468, -0.2490485, 0.8207772, 1, 0, 0.3764706, 1,
1.660455, 0.167298, 0.561255, 1, 0, 0.372549, 1,
1.666548, 0.4060527, 1.411235, 1, 0, 0.3647059, 1,
1.667291, -0.8228233, 1.146826, 1, 0, 0.3607843, 1,
1.691805, 1.251749, -0.5823666, 1, 0, 0.3529412, 1,
1.697865, 1.67695, -0.1807383, 1, 0, 0.3490196, 1,
1.706353, -1.221266, 3.783131, 1, 0, 0.3411765, 1,
1.707509, -0.08239362, 1.654866, 1, 0, 0.3372549, 1,
1.708666, -0.9911622, 2.999725, 1, 0, 0.3294118, 1,
1.709132, -0.4578382, 1.732501, 1, 0, 0.3254902, 1,
1.71018, 1.603737, 0.2337245, 1, 0, 0.3176471, 1,
1.71162, -0.796419, 1.125985, 1, 0, 0.3137255, 1,
1.715742, -1.406345, 1.762939, 1, 0, 0.3058824, 1,
1.718227, 1.57784, -0.2727246, 1, 0, 0.2980392, 1,
1.730859, 0.2230167, -1.321178, 1, 0, 0.2941177, 1,
1.747681, -2.639992, 2.833502, 1, 0, 0.2862745, 1,
1.748674, 1.497241, -2.626259, 1, 0, 0.282353, 1,
1.751435, 0.9464863, 1.848633, 1, 0, 0.2745098, 1,
1.765186, -2.038058, 1.79937, 1, 0, 0.2705882, 1,
1.770728, -1.319233, 2.690737, 1, 0, 0.2627451, 1,
1.77239, 0.00544023, 0.79625, 1, 0, 0.2588235, 1,
1.792555, -0.3889806, 0.726102, 1, 0, 0.2509804, 1,
1.829179, 0.07023798, 2.18606, 1, 0, 0.2470588, 1,
1.842106, 0.4963332, 1.163295, 1, 0, 0.2392157, 1,
1.844634, 1.163352, 2.528496, 1, 0, 0.2352941, 1,
1.848212, 1.822781, 1.493356, 1, 0, 0.227451, 1,
1.884791, -0.265071, 3.450092, 1, 0, 0.2235294, 1,
1.894981, 1.937513, 1.269377, 1, 0, 0.2156863, 1,
1.900628, 0.6001869, 2.427692, 1, 0, 0.2117647, 1,
1.912299, 0.3610494, 1.719242, 1, 0, 0.2039216, 1,
1.914268, 0.7931259, 1.690258, 1, 0, 0.1960784, 1,
1.916524, -0.4630569, 1.537929, 1, 0, 0.1921569, 1,
1.965206, -1.384576, 0.08644272, 1, 0, 0.1843137, 1,
1.997934, -0.524627, 2.340242, 1, 0, 0.1803922, 1,
2.02211, 0.2949471, 3.262348, 1, 0, 0.172549, 1,
2.026188, -1.431777, 2.185461, 1, 0, 0.1686275, 1,
2.040014, -0.9374196, 1.605229, 1, 0, 0.1607843, 1,
2.104126, 1.984533, 1.849933, 1, 0, 0.1568628, 1,
2.12302, 0.641564, 1.668632, 1, 0, 0.1490196, 1,
2.129958, 0.8178961, 2.062879, 1, 0, 0.145098, 1,
2.15204, 0.6282625, 1.269568, 1, 0, 0.1372549, 1,
2.186768, -0.5566002, 2.452169, 1, 0, 0.1333333, 1,
2.20477, -0.8148524, 2.406476, 1, 0, 0.1254902, 1,
2.241573, -1.159587, 3.618008, 1, 0, 0.1215686, 1,
2.277112, -0.3770117, 0.7783958, 1, 0, 0.1137255, 1,
2.296825, -0.6108531, 1.641814, 1, 0, 0.1098039, 1,
2.308574, 1.467139, 1.489177, 1, 0, 0.1019608, 1,
2.335634, -0.4264272, 3.149156, 1, 0, 0.09411765, 1,
2.356234, 0.6274844, -0.1512543, 1, 0, 0.09019608, 1,
2.361191, 0.239381, 1.359845, 1, 0, 0.08235294, 1,
2.400863, -1.245055, 1.069285, 1, 0, 0.07843138, 1,
2.438615, 1.661612, 0.9754322, 1, 0, 0.07058824, 1,
2.45207, -0.747357, 2.136926, 1, 0, 0.06666667, 1,
2.475284, -0.4274206, 2.526193, 1, 0, 0.05882353, 1,
2.498911, -0.2384277, 2.173082, 1, 0, 0.05490196, 1,
2.506251, 0.09221879, 0.6207106, 1, 0, 0.04705882, 1,
2.51112, 1.391133, 1.086912, 1, 0, 0.04313726, 1,
2.512531, -0.2331893, 1.798086, 1, 0, 0.03529412, 1,
2.577547, 1.006144, 0.3345457, 1, 0, 0.03137255, 1,
2.692355, -0.8896805, 2.004135, 1, 0, 0.02352941, 1,
2.734112, 1.315637, 1.6384, 1, 0, 0.01960784, 1,
2.961656, -0.5491128, 2.013694, 1, 0, 0.01176471, 1,
2.962453, -1.408049, 0.4585762, 1, 0, 0.007843138, 1
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
-0.07933331, -3.882742, -7.397313, 0, -0.5, 0.5, 0.5,
-0.07933331, -3.882742, -7.397313, 1, -0.5, 0.5, 0.5,
-0.07933331, -3.882742, -7.397313, 1, 1.5, 0.5, 0.5,
-0.07933331, -3.882742, -7.397313, 0, 1.5, 0.5, 0.5
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
-4.152285, -0.1019194, -7.397313, 0, -0.5, 0.5, 0.5,
-4.152285, -0.1019194, -7.397313, 1, -0.5, 0.5, 0.5,
-4.152285, -0.1019194, -7.397313, 1, 1.5, 0.5, 0.5,
-4.152285, -0.1019194, -7.397313, 0, 1.5, 0.5, 0.5
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
-4.152285, -3.882742, 0.2892363, 0, -0.5, 0.5, 0.5,
-4.152285, -3.882742, 0.2892363, 1, -0.5, 0.5, 0.5,
-4.152285, -3.882742, 0.2892363, 1, 1.5, 0.5, 0.5,
-4.152285, -3.882742, 0.2892363, 0, 1.5, 0.5, 0.5
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
-3, -3.010244, -5.623494,
2, -3.010244, -5.623494,
-3, -3.010244, -5.623494,
-3, -3.155661, -5.919131,
-2, -3.010244, -5.623494,
-2, -3.155661, -5.919131,
-1, -3.010244, -5.623494,
-1, -3.155661, -5.919131,
0, -3.010244, -5.623494,
0, -3.155661, -5.919131,
1, -3.010244, -5.623494,
1, -3.155661, -5.919131,
2, -3.010244, -5.623494,
2, -3.155661, -5.919131
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
-3, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
-3, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
-3, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
-3, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5,
-2, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
-2, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
-2, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
-2, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5,
-1, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
-1, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
-1, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
-1, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5,
0, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
0, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
0, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
0, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5,
1, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
1, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
1, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
1, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5,
2, -3.446493, -6.510404, 0, -0.5, 0.5, 0.5,
2, -3.446493, -6.510404, 1, -0.5, 0.5, 0.5,
2, -3.446493, -6.510404, 1, 1.5, 0.5, 0.5,
2, -3.446493, -6.510404, 0, 1.5, 0.5, 0.5
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
-3.212373, -2, -5.623494,
-3.212373, 2, -5.623494,
-3.212373, -2, -5.623494,
-3.369025, -2, -5.919131,
-3.212373, -1, -5.623494,
-3.369025, -1, -5.919131,
-3.212373, 0, -5.623494,
-3.369025, 0, -5.919131,
-3.212373, 1, -5.623494,
-3.369025, 1, -5.919131,
-3.212373, 2, -5.623494,
-3.369025, 2, -5.919131
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
-3.682329, -2, -6.510404, 0, -0.5, 0.5, 0.5,
-3.682329, -2, -6.510404, 1, -0.5, 0.5, 0.5,
-3.682329, -2, -6.510404, 1, 1.5, 0.5, 0.5,
-3.682329, -2, -6.510404, 0, 1.5, 0.5, 0.5,
-3.682329, -1, -6.510404, 0, -0.5, 0.5, 0.5,
-3.682329, -1, -6.510404, 1, -0.5, 0.5, 0.5,
-3.682329, -1, -6.510404, 1, 1.5, 0.5, 0.5,
-3.682329, -1, -6.510404, 0, 1.5, 0.5, 0.5,
-3.682329, 0, -6.510404, 0, -0.5, 0.5, 0.5,
-3.682329, 0, -6.510404, 1, -0.5, 0.5, 0.5,
-3.682329, 0, -6.510404, 1, 1.5, 0.5, 0.5,
-3.682329, 0, -6.510404, 0, 1.5, 0.5, 0.5,
-3.682329, 1, -6.510404, 0, -0.5, 0.5, 0.5,
-3.682329, 1, -6.510404, 1, -0.5, 0.5, 0.5,
-3.682329, 1, -6.510404, 1, 1.5, 0.5, 0.5,
-3.682329, 1, -6.510404, 0, 1.5, 0.5, 0.5,
-3.682329, 2, -6.510404, 0, -0.5, 0.5, 0.5,
-3.682329, 2, -6.510404, 1, -0.5, 0.5, 0.5,
-3.682329, 2, -6.510404, 1, 1.5, 0.5, 0.5,
-3.682329, 2, -6.510404, 0, 1.5, 0.5, 0.5
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
-3.212373, -3.010244, -4,
-3.212373, -3.010244, 6,
-3.212373, -3.010244, -4,
-3.369025, -3.155661, -4,
-3.212373, -3.010244, -2,
-3.369025, -3.155661, -2,
-3.212373, -3.010244, 0,
-3.369025, -3.155661, 0,
-3.212373, -3.010244, 2,
-3.369025, -3.155661, 2,
-3.212373, -3.010244, 4,
-3.369025, -3.155661, 4,
-3.212373, -3.010244, 6,
-3.369025, -3.155661, 6
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
"4",
"6"
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
-3.682329, -3.446493, -4, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, -4, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, -4, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, -4, 0, 1.5, 0.5, 0.5,
-3.682329, -3.446493, -2, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, -2, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, -2, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, -2, 0, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 0, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 0, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 0, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 0, 0, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 2, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 2, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 2, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 2, 0, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 4, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 4, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 4, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 4, 0, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 6, 0, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 6, 1, -0.5, 0.5, 0.5,
-3.682329, -3.446493, 6, 1, 1.5, 0.5, 0.5,
-3.682329, -3.446493, 6, 0, 1.5, 0.5, 0.5
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
-3.212373, -3.010244, -5.623494,
-3.212373, 2.806406, -5.623494,
-3.212373, -3.010244, 6.201967,
-3.212373, 2.806406, 6.201967,
-3.212373, -3.010244, -5.623494,
-3.212373, -3.010244, 6.201967,
-3.212373, 2.806406, -5.623494,
-3.212373, 2.806406, 6.201967,
-3.212373, -3.010244, -5.623494,
3.053706, -3.010244, -5.623494,
-3.212373, -3.010244, 6.201967,
3.053706, -3.010244, 6.201967,
-3.212373, 2.806406, -5.623494,
3.053706, 2.806406, -5.623494,
-3.212373, 2.806406, 6.201967,
3.053706, 2.806406, 6.201967,
3.053706, -3.010244, -5.623494,
3.053706, 2.806406, -5.623494,
3.053706, -3.010244, 6.201967,
3.053706, 2.806406, 6.201967,
3.053706, -3.010244, -5.623494,
3.053706, -3.010244, 6.201967,
3.053706, 2.806406, -5.623494,
3.053706, 2.806406, 6.201967
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
var radius = 7.792069;
var distance = 34.66779;
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
mvMatrix.translate( 0.07933331, 0.1019194, -0.2892363 );
mvMatrix.scale( 1.344531, 1.448417, 0.7124405 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66779);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
dinoseb<-read.table("dinoseb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinoseb$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
```

```r
y<-dinoseb$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
```

```r
z<-dinoseb$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
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
-3.121119, 0.0429468, -2.063334, 0, 0, 1, 1, 1,
-2.845224, -1.486379, -3.635767, 1, 0, 0, 1, 1,
-2.844773, 0.7093273, -0.9030396, 1, 0, 0, 1, 1,
-2.436359, -1.726328, -4.02254, 1, 0, 0, 1, 1,
-2.381051, -0.1925485, 0.06569713, 1, 0, 0, 1, 1,
-2.302067, 0.07306363, -1.949048, 1, 0, 0, 1, 1,
-2.301937, 2.073445, -0.1548766, 0, 0, 0, 1, 1,
-2.300705, -0.7058722, -0.7042981, 0, 0, 0, 1, 1,
-2.260752, -0.8564088, -3.138677, 0, 0, 0, 1, 1,
-2.243351, 0.6066158, -2.46205, 0, 0, 0, 1, 1,
-2.187777, 0.9671132, -1.679672, 0, 0, 0, 1, 1,
-2.177522, 0.7795066, -1.048635, 0, 0, 0, 1, 1,
-2.130621, 0.1883484, -1.719574, 0, 0, 0, 1, 1,
-2.115608, 0.9442164, -1.761427, 1, 1, 1, 1, 1,
-2.115525, 0.3707644, -1.371532, 1, 1, 1, 1, 1,
-2.087321, 0.8368784, -1.526807, 1, 1, 1, 1, 1,
-2.081759, 0.4201679, -1.415061, 1, 1, 1, 1, 1,
-2.072292, -0.212697, -0.971973, 1, 1, 1, 1, 1,
-2.04156, -0.5819002, -1.642596, 1, 1, 1, 1, 1,
-2.020207, -0.287258, -3.061558, 1, 1, 1, 1, 1,
-2.000286, -0.5038353, -2.945485, 1, 1, 1, 1, 1,
-1.940807, -1.044544, -1.683966, 1, 1, 1, 1, 1,
-1.913147, -0.5707839, -2.548481, 1, 1, 1, 1, 1,
-1.896918, -1.242557, -1.288805, 1, 1, 1, 1, 1,
-1.892484, -0.06105757, -2.195403, 1, 1, 1, 1, 1,
-1.871293, -0.6832964, -0.787658, 1, 1, 1, 1, 1,
-1.859213, -0.3490549, -2.130416, 1, 1, 1, 1, 1,
-1.855309, -0.6960185, -1.849187, 1, 1, 1, 1, 1,
-1.851541, 1.71939, -1.225034, 0, 0, 1, 1, 1,
-1.837185, 0.919818, -0.1253698, 1, 0, 0, 1, 1,
-1.836251, -0.8386503, -1.272772, 1, 0, 0, 1, 1,
-1.83536, 0.1340355, 0.1548985, 1, 0, 0, 1, 1,
-1.82965, -1.268233, -1.555717, 1, 0, 0, 1, 1,
-1.820907, 0.1647301, -0.2745925, 1, 0, 0, 1, 1,
-1.811705, 0.7520176, -1.311626, 0, 0, 0, 1, 1,
-1.805403, -0.2197064, -1.524503, 0, 0, 0, 1, 1,
-1.80172, 0.2755005, -0.9257019, 0, 0, 0, 1, 1,
-1.775735, -0.1566355, -2.297715, 0, 0, 0, 1, 1,
-1.755344, -1.125177, -2.151532, 0, 0, 0, 1, 1,
-1.747272, -0.6905491, -0.1128514, 0, 0, 0, 1, 1,
-1.746704, 0.471519, 0.09426045, 0, 0, 0, 1, 1,
-1.732333, -0.2845689, -3.916298, 1, 1, 1, 1, 1,
-1.724738, 0.915796, -0.3170187, 1, 1, 1, 1, 1,
-1.677574, -1.401107, -1.994883, 1, 1, 1, 1, 1,
-1.676981, -0.4499532, -2.454545, 1, 1, 1, 1, 1,
-1.669126, -1.138428, -2.04799, 1, 1, 1, 1, 1,
-1.657598, 0.08297932, -2.535294, 1, 1, 1, 1, 1,
-1.657402, -0.3682494, -4.207132, 1, 1, 1, 1, 1,
-1.651249, 1.348472, 0.2278834, 1, 1, 1, 1, 1,
-1.638926, 0.5972045, -1.000129, 1, 1, 1, 1, 1,
-1.638639, -2.405711, -2.560799, 1, 1, 1, 1, 1,
-1.62977, -1.700552, -2.329477, 1, 1, 1, 1, 1,
-1.626284, 1.334789, -0.5041341, 1, 1, 1, 1, 1,
-1.625099, 0.5322981, 0.364199, 1, 1, 1, 1, 1,
-1.62386, 0.540751, -1.531848, 1, 1, 1, 1, 1,
-1.620135, -0.5783696, -1.760688, 1, 1, 1, 1, 1,
-1.618859, 1.887771, -1.283792, 0, 0, 1, 1, 1,
-1.617389, 0.3843968, -1.23427, 1, 0, 0, 1, 1,
-1.609114, -0.5832772, -2.095012, 1, 0, 0, 1, 1,
-1.607351, -0.764564, -2.659512, 1, 0, 0, 1, 1,
-1.597585, 0.02309669, -1.385626, 1, 0, 0, 1, 1,
-1.593473, 0.1922734, -1.906888, 1, 0, 0, 1, 1,
-1.582194, -0.8979641, -1.280961, 0, 0, 0, 1, 1,
-1.576057, 0.3819983, -0.3753629, 0, 0, 0, 1, 1,
-1.551344, -0.4493697, -1.225156, 0, 0, 0, 1, 1,
-1.547118, -1.031017, -1.802823, 0, 0, 0, 1, 1,
-1.544305, -0.9087946, -3.489298, 0, 0, 0, 1, 1,
-1.530907, -0.5935146, -0.5780911, 0, 0, 0, 1, 1,
-1.526404, -0.5160822, -0.6407714, 0, 0, 0, 1, 1,
-1.524811, 0.183238, -1.976568, 1, 1, 1, 1, 1,
-1.515633, 0.154787, 0.7176308, 1, 1, 1, 1, 1,
-1.500483, 0.06443869, -0.5056504, 1, 1, 1, 1, 1,
-1.496386, 1.996564, -0.5606513, 1, 1, 1, 1, 1,
-1.476668, -1.726171, -1.927503, 1, 1, 1, 1, 1,
-1.47215, 0.4241427, -2.807089, 1, 1, 1, 1, 1,
-1.468507, -0.6275927, -1.107694, 1, 1, 1, 1, 1,
-1.465855, -2.146168, -1.246859, 1, 1, 1, 1, 1,
-1.465642, 1.226552, -1.361971, 1, 1, 1, 1, 1,
-1.460651, -1.182773, -1.851849, 1, 1, 1, 1, 1,
-1.451887, 0.1274658, -0.9139195, 1, 1, 1, 1, 1,
-1.432941, -0.3039643, -0.7622921, 1, 1, 1, 1, 1,
-1.417723, 1.095731, -1.679777, 1, 1, 1, 1, 1,
-1.414547, -0.6675144, -2.022219, 1, 1, 1, 1, 1,
-1.41337, -0.8383514, -2.164138, 1, 1, 1, 1, 1,
-1.410335, 1.264078, -1.222394, 0, 0, 1, 1, 1,
-1.404003, -0.117817, -1.030351, 1, 0, 0, 1, 1,
-1.402512, -1.491619, -2.252877, 1, 0, 0, 1, 1,
-1.390685, -1.83872, -2.22446, 1, 0, 0, 1, 1,
-1.383048, -0.0009398739, -1.991593, 1, 0, 0, 1, 1,
-1.381741, 0.001336469, -1.774589, 1, 0, 0, 1, 1,
-1.381562, 1.680858, 1.490145, 0, 0, 0, 1, 1,
-1.374419, 0.3424713, -0.5337116, 0, 0, 0, 1, 1,
-1.371686, 0.3561633, -0.9936896, 0, 0, 0, 1, 1,
-1.369646, 0.9268513, -0.4185828, 0, 0, 0, 1, 1,
-1.365891, -0.1069786, -1.714152, 0, 0, 0, 1, 1,
-1.365382, 0.1048821, -0.5949183, 0, 0, 0, 1, 1,
-1.346815, 0.8986546, 0.509804, 0, 0, 0, 1, 1,
-1.345353, -0.9955245, -1.619428, 1, 1, 1, 1, 1,
-1.342794, -1.00791, -0.8672591, 1, 1, 1, 1, 1,
-1.333879, 0.7927883, -0.6340362, 1, 1, 1, 1, 1,
-1.333088, 2.287297, 0.01272652, 1, 1, 1, 1, 1,
-1.330904, 1.703933, -0.7508799, 1, 1, 1, 1, 1,
-1.318101, 0.3621974, -1.267772, 1, 1, 1, 1, 1,
-1.317549, 0.6133515, -1.293859, 1, 1, 1, 1, 1,
-1.304379, 0.7369463, -1.02128, 1, 1, 1, 1, 1,
-1.303859, 0.1452834, -2.627598, 1, 1, 1, 1, 1,
-1.303432, -2.30906, -3.393605, 1, 1, 1, 1, 1,
-1.288338, -0.8228702, -1.332259, 1, 1, 1, 1, 1,
-1.288123, -0.4177835, -2.535314, 1, 1, 1, 1, 1,
-1.282698, 1.456139, -0.6290796, 1, 1, 1, 1, 1,
-1.276342, 0.2279986, -0.5688456, 1, 1, 1, 1, 1,
-1.275015, 1.955923, -1.477905, 1, 1, 1, 1, 1,
-1.273226, -1.286445, -1.615183, 0, 0, 1, 1, 1,
-1.265506, -0.5136717, -0.2977633, 1, 0, 0, 1, 1,
-1.261248, 1.18097, -0.510138, 1, 0, 0, 1, 1,
-1.252084, 2.179544, 1.026094, 1, 0, 0, 1, 1,
-1.24459, -0.3446103, -4.063293, 1, 0, 0, 1, 1,
-1.241136, 0.3793244, -1.846121, 1, 0, 0, 1, 1,
-1.234701, 1.792442, 0.8113396, 0, 0, 0, 1, 1,
-1.225315, 0.6034661, -1.453938, 0, 0, 0, 1, 1,
-1.22369, 1.330543, -0.4483176, 0, 0, 0, 1, 1,
-1.203742, 1.814904, -1.126502, 0, 0, 0, 1, 1,
-1.198812, -0.6874915, 0.02700898, 0, 0, 0, 1, 1,
-1.198244, 0.9650334, -1.491389, 0, 0, 0, 1, 1,
-1.197475, 1.103414, 2.310175, 0, 0, 0, 1, 1,
-1.193733, -1.693563, -3.492232, 1, 1, 1, 1, 1,
-1.193719, -0.005028309, -2.622759, 1, 1, 1, 1, 1,
-1.192337, 1.493042, -0.584546, 1, 1, 1, 1, 1,
-1.191422, -1.341259, -3.183892, 1, 1, 1, 1, 1,
-1.191093, -0.4825679, -1.406082, 1, 1, 1, 1, 1,
-1.185092, 1.281911, -1.137692, 1, 1, 1, 1, 1,
-1.181568, -0.1926431, -2.109829, 1, 1, 1, 1, 1,
-1.174677, -0.8525219, -1.16153, 1, 1, 1, 1, 1,
-1.171582, 0.4759078, -1.612889, 1, 1, 1, 1, 1,
-1.169736, -0.4137772, -3.041056, 1, 1, 1, 1, 1,
-1.168911, -0.4365782, -2.151153, 1, 1, 1, 1, 1,
-1.165159, -0.172933, -0.4825347, 1, 1, 1, 1, 1,
-1.159102, 0.7067873, -2.420976, 1, 1, 1, 1, 1,
-1.15804, 1.125372, -1.029799, 1, 1, 1, 1, 1,
-1.157005, 0.5896865, -0.5917308, 1, 1, 1, 1, 1,
-1.153755, 1.764971, 0.8649726, 0, 0, 1, 1, 1,
-1.146215, -1.386097, -4.313869, 1, 0, 0, 1, 1,
-1.140252, 0.5715773, -0.3395484, 1, 0, 0, 1, 1,
-1.127299, -0.5434636, -3.481323, 1, 0, 0, 1, 1,
-1.122556, -1.024055, -2.305298, 1, 0, 0, 1, 1,
-1.118057, 1.40316, 0.008002795, 1, 0, 0, 1, 1,
-1.104292, -1.502294, -3.817202, 0, 0, 0, 1, 1,
-1.091969, 0.1747835, -1.207597, 0, 0, 0, 1, 1,
-1.091363, 0.277859, -1.115562, 0, 0, 0, 1, 1,
-1.087866, 2.026728, -0.04664278, 0, 0, 0, 1, 1,
-1.08696, -0.9227796, -1.92714, 0, 0, 0, 1, 1,
-1.082367, -0.04462678, -0.7753572, 0, 0, 0, 1, 1,
-1.08226, 0.5978772, -0.7575403, 0, 0, 0, 1, 1,
-1.070044, -0.2067265, -1.733865, 1, 1, 1, 1, 1,
-1.069, -0.9724065, -2.12516, 1, 1, 1, 1, 1,
-1.062622, -0.4750271, -1.526215, 1, 1, 1, 1, 1,
-1.061897, 1.477349, 0.7605788, 1, 1, 1, 1, 1,
-1.058162, 0.4867017, -1.167702, 1, 1, 1, 1, 1,
-1.057305, 0.3519725, -1.842272, 1, 1, 1, 1, 1,
-1.054661, -0.5873286, -2.262057, 1, 1, 1, 1, 1,
-1.053523, -0.4273015, -2.436027, 1, 1, 1, 1, 1,
-1.053339, -1.400105, -4.174192, 1, 1, 1, 1, 1,
-1.05206, 0.4433398, -0.8445219, 1, 1, 1, 1, 1,
-1.048422, -0.7001384, -2.078295, 1, 1, 1, 1, 1,
-1.047605, -1.761317, -1.393345, 1, 1, 1, 1, 1,
-1.045249, -0.3974729, -5.120937, 1, 1, 1, 1, 1,
-1.043731, 2.374519, -0.4695306, 1, 1, 1, 1, 1,
-1.040647, 0.05008442, -1.407448, 1, 1, 1, 1, 1,
-1.035721, 0.8037108, -1.64862, 0, 0, 1, 1, 1,
-1.029747, -0.9208372, -2.324511, 1, 0, 0, 1, 1,
-1.028133, -2.175578, -2.376742, 1, 0, 0, 1, 1,
-1.017696, -0.07432218, -2.705022, 1, 0, 0, 1, 1,
-1.009228, -0.4902598, -1.424303, 1, 0, 0, 1, 1,
-1.00907, 0.8083701, -1.315092, 1, 0, 0, 1, 1,
-0.9974923, -0.1156227, -1.864888, 0, 0, 0, 1, 1,
-0.9964562, 1.021808, -0.08068729, 0, 0, 0, 1, 1,
-0.9954031, 0.6314055, -0.1933504, 0, 0, 0, 1, 1,
-0.9933019, 1.260098, 1.377073, 0, 0, 0, 1, 1,
-0.9894401, 0.367083, -1.883712, 0, 0, 0, 1, 1,
-0.9860398, -0.1234782, -1.980473, 0, 0, 0, 1, 1,
-0.979471, -0.1497622, -1.268101, 0, 0, 0, 1, 1,
-0.9781232, 2.467273, -0.8466751, 1, 1, 1, 1, 1,
-0.9763312, 0.7774966, -1.929772, 1, 1, 1, 1, 1,
-0.9741154, -0.3580693, -2.691233, 1, 1, 1, 1, 1,
-0.9664083, 1.971291, 0.6404105, 1, 1, 1, 1, 1,
-0.9651873, 0.555921, 0.3210995, 1, 1, 1, 1, 1,
-0.9648201, -1.085486, -2.076071, 1, 1, 1, 1, 1,
-0.9646069, 0.5705478, 0.1014408, 1, 1, 1, 1, 1,
-0.9628428, 0.1969141, 0.1362332, 1, 1, 1, 1, 1,
-0.9601612, 0.3785787, -1.702775, 1, 1, 1, 1, 1,
-0.9555084, 2.676904, 0.5012906, 1, 1, 1, 1, 1,
-0.9534163, 1.581726, -0.179303, 1, 1, 1, 1, 1,
-0.9458576, -1.064399, 0.3811403, 1, 1, 1, 1, 1,
-0.9453855, 0.01278935, -1.250851, 1, 1, 1, 1, 1,
-0.9430621, -1.122501, -1.92624, 1, 1, 1, 1, 1,
-0.9386088, 0.3413885, -1.32126, 1, 1, 1, 1, 1,
-0.9367958, -0.04089878, -0.5444511, 0, 0, 1, 1, 1,
-0.9339266, -0.5878313, -1.320905, 1, 0, 0, 1, 1,
-0.9228614, 0.1329762, -0.2843068, 1, 0, 0, 1, 1,
-0.9226487, 0.9910907, 0.8707095, 1, 0, 0, 1, 1,
-0.9213476, -1.100077, -2.866565, 1, 0, 0, 1, 1,
-0.9205784, -0.01345605, -2.839752, 1, 0, 0, 1, 1,
-0.8995307, 0.5261779, -0.4420588, 0, 0, 0, 1, 1,
-0.8962594, -1.136446, -1.620346, 0, 0, 0, 1, 1,
-0.8910366, 0.2026061, -2.998455, 0, 0, 0, 1, 1,
-0.8768637, 0.8115277, 0.1873315, 0, 0, 0, 1, 1,
-0.873342, 0.5262769, -1.578609, 0, 0, 0, 1, 1,
-0.8724552, -0.1952634, -1.729767, 0, 0, 0, 1, 1,
-0.8701859, -0.7746671, -3.048113, 0, 0, 0, 1, 1,
-0.869718, 0.3680935, -0.8515599, 1, 1, 1, 1, 1,
-0.8687045, -0.9821855, -2.160586, 1, 1, 1, 1, 1,
-0.8674942, 2.076953, -0.733777, 1, 1, 1, 1, 1,
-0.8633029, 1.734467, -0.7518536, 1, 1, 1, 1, 1,
-0.8604193, 0.4057695, 0.03533588, 1, 1, 1, 1, 1,
-0.8555158, -0.7951704, -0.6958449, 1, 1, 1, 1, 1,
-0.8527212, 0.5336359, 0.5953165, 1, 1, 1, 1, 1,
-0.8519747, -1.185133, -3.250318, 1, 1, 1, 1, 1,
-0.8510727, -1.503266, -1.42428, 1, 1, 1, 1, 1,
-0.8492897, 0.0311725, -2.240367, 1, 1, 1, 1, 1,
-0.8489647, 0.2891003, -0.3180902, 1, 1, 1, 1, 1,
-0.8386679, 0.0318043, -1.441504, 1, 1, 1, 1, 1,
-0.8214346, -0.6649051, -2.828331, 1, 1, 1, 1, 1,
-0.8184682, -1.968109, -1.674889, 1, 1, 1, 1, 1,
-0.8165956, -0.493075, -2.407897, 1, 1, 1, 1, 1,
-0.8157091, 0.6333091, -0.3106444, 0, 0, 1, 1, 1,
-0.8145227, 0.8251585, -0.7209803, 1, 0, 0, 1, 1,
-0.8127779, 1.490147, -1.129128, 1, 0, 0, 1, 1,
-0.8125947, 0.4910241, -1.411565, 1, 0, 0, 1, 1,
-0.8019828, -1.981426, -3.384056, 1, 0, 0, 1, 1,
-0.7985896, 1.012368, -1.371941, 1, 0, 0, 1, 1,
-0.794128, -1.093808, -2.466947, 0, 0, 0, 1, 1,
-0.7931544, 0.25228, -2.038965, 0, 0, 0, 1, 1,
-0.7931219, -1.36805, -2.086835, 0, 0, 0, 1, 1,
-0.7884401, 0.8705902, -2.275626, 0, 0, 0, 1, 1,
-0.7759063, 0.8261333, -0.007091485, 0, 0, 0, 1, 1,
-0.7671342, 0.414108, -2.917078, 0, 0, 0, 1, 1,
-0.7646281, 1.122971, 0.5372397, 0, 0, 0, 1, 1,
-0.7579884, -1.137621, -0.245291, 1, 1, 1, 1, 1,
-0.7469656, 1.95724, -1.045008, 1, 1, 1, 1, 1,
-0.7387019, -0.7922803, -2.2494, 1, 1, 1, 1, 1,
-0.7376125, 0.7820681, -1.610781, 1, 1, 1, 1, 1,
-0.7314106, 1.228976, -1.354212, 1, 1, 1, 1, 1,
-0.7293177, 0.1543867, -0.4959743, 1, 1, 1, 1, 1,
-0.7221301, -1.007687, -2.899849, 1, 1, 1, 1, 1,
-0.7149739, -0.2186772, -3.793704, 1, 1, 1, 1, 1,
-0.7137951, -1.138176, -2.281175, 1, 1, 1, 1, 1,
-0.7132177, 0.6869145, 0.5419319, 1, 1, 1, 1, 1,
-0.7128145, -1.801417, -3.140237, 1, 1, 1, 1, 1,
-0.7091008, -0.2556088, -0.8923362, 1, 1, 1, 1, 1,
-0.707213, -0.3028254, -1.346422, 1, 1, 1, 1, 1,
-0.7060175, -0.3473676, -2.338189, 1, 1, 1, 1, 1,
-0.7026781, -0.01212041, -1.572687, 1, 1, 1, 1, 1,
-0.6972832, -1.770572, -2.129603, 0, 0, 1, 1, 1,
-0.6939484, 0.7318951, -2.370031, 1, 0, 0, 1, 1,
-0.6913942, -0.4224881, -0.08227497, 1, 0, 0, 1, 1,
-0.6817895, 0.5262381, -1.375075, 1, 0, 0, 1, 1,
-0.6778694, 1.294516, 0.03336882, 1, 0, 0, 1, 1,
-0.6751881, 1.149091, 0.8960771, 1, 0, 0, 1, 1,
-0.6749359, 0.6171381, -2.247175, 0, 0, 0, 1, 1,
-0.6715525, -2.096494, -3.730766, 0, 0, 0, 1, 1,
-0.6698249, -0.8843392, -3.561519, 0, 0, 0, 1, 1,
-0.6689339, 0.3521786, 0.3727897, 0, 0, 0, 1, 1,
-0.6686108, 1.629796, -0.7788864, 0, 0, 0, 1, 1,
-0.6675351, -2.052246, -2.370145, 0, 0, 0, 1, 1,
-0.6673664, 1.149187, -1.025321, 0, 0, 0, 1, 1,
-0.6566103, 1.816705, -0.243481, 1, 1, 1, 1, 1,
-0.6539723, 0.1387184, -0.03741044, 1, 1, 1, 1, 1,
-0.65384, 0.2504836, -0.8247674, 1, 1, 1, 1, 1,
-0.6492998, -0.3345137, -1.495785, 1, 1, 1, 1, 1,
-0.6489181, -1.10247, -1.766015, 1, 1, 1, 1, 1,
-0.6482605, -0.9382799, -2.072495, 1, 1, 1, 1, 1,
-0.6482322, 0.003151316, -1.319493, 1, 1, 1, 1, 1,
-0.6414401, -0.3811282, -1.734103, 1, 1, 1, 1, 1,
-0.640157, -1.06185, -2.109355, 1, 1, 1, 1, 1,
-0.6356954, 0.8704741, -0.9339051, 1, 1, 1, 1, 1,
-0.635604, 1.440352, -1.106018, 1, 1, 1, 1, 1,
-0.6352673, -0.2128622, -2.975705, 1, 1, 1, 1, 1,
-0.635208, 1.72586, 0.1491363, 1, 1, 1, 1, 1,
-0.6331295, -1.109221, -2.367144, 1, 1, 1, 1, 1,
-0.6320174, 0.3761316, -1.407115, 1, 1, 1, 1, 1,
-0.6315926, 0.1381866, -1.021768, 0, 0, 1, 1, 1,
-0.6306427, -0.3687972, -1.763521, 1, 0, 0, 1, 1,
-0.6236112, 0.09728255, -2.162522, 1, 0, 0, 1, 1,
-0.6214803, -1.194107, -1.493367, 1, 0, 0, 1, 1,
-0.6211829, -0.1558647, -2.108978, 1, 0, 0, 1, 1,
-0.6195086, -1.158308, -3.663625, 1, 0, 0, 1, 1,
-0.6194829, 0.1503207, -1.467611, 0, 0, 0, 1, 1,
-0.6161804, -0.8284975, -1.776486, 0, 0, 0, 1, 1,
-0.6144732, -0.206546, -2.067764, 0, 0, 0, 1, 1,
-0.6102455, -0.6211796, -0.9395471, 0, 0, 0, 1, 1,
-0.605055, -1.508027, -3.571267, 0, 0, 0, 1, 1,
-0.6023675, 0.5232214, -1.183204, 0, 0, 0, 1, 1,
-0.6017585, 1.694509, -1.343839, 0, 0, 0, 1, 1,
-0.5992915, -2.11546, -3.737662, 1, 1, 1, 1, 1,
-0.5982739, -0.393856, -2.943049, 1, 1, 1, 1, 1,
-0.5968977, -0.7784905, -2.057993, 1, 1, 1, 1, 1,
-0.5959297, 1.096462, 0.2540016, 1, 1, 1, 1, 1,
-0.595035, 0.5866016, 0.5409513, 1, 1, 1, 1, 1,
-0.5932664, -1.230369, -5.065207, 1, 1, 1, 1, 1,
-0.5923034, 0.3332071, -1.37889, 1, 1, 1, 1, 1,
-0.5812377, 1.119538, -2.071043, 1, 1, 1, 1, 1,
-0.5799357, -0.7128364, -2.135728, 1, 1, 1, 1, 1,
-0.5780739, -0.6531727, -3.180718, 1, 1, 1, 1, 1,
-0.5696887, -0.3918059, -3.214931, 1, 1, 1, 1, 1,
-0.5657262, -0.1378818, -1.641475, 1, 1, 1, 1, 1,
-0.5609004, -0.8806634, -2.935181, 1, 1, 1, 1, 1,
-0.5587659, 0.8262389, 0.09423769, 1, 1, 1, 1, 1,
-0.5581331, -1.527822, -1.238093, 1, 1, 1, 1, 1,
-0.5535411, 2.721697, 1.199467, 0, 0, 1, 1, 1,
-0.5529118, 0.1044251, -1.921, 1, 0, 0, 1, 1,
-0.5525031, 0.07881001, -0.4893179, 1, 0, 0, 1, 1,
-0.5441471, 1.148261, -0.03229123, 1, 0, 0, 1, 1,
-0.5350531, -0.999754, -3.106829, 1, 0, 0, 1, 1,
-0.533375, 1.364294, 0.09697649, 1, 0, 0, 1, 1,
-0.5314016, 1.504463, -0.1993394, 0, 0, 0, 1, 1,
-0.5297473, 0.7875482, 0.9332954, 0, 0, 0, 1, 1,
-0.5254561, -0.004629807, -0.6767693, 0, 0, 0, 1, 1,
-0.5189847, 0.9586993, 0.6452138, 0, 0, 0, 1, 1,
-0.5140056, -0.4298664, -2.080967, 0, 0, 0, 1, 1,
-0.5105084, -0.1549466, -1.885888, 0, 0, 0, 1, 1,
-0.503271, 0.3642553, -1.009904, 0, 0, 0, 1, 1,
-0.5015945, -0.0501441, -2.605309, 1, 1, 1, 1, 1,
-0.4977276, 1.76317, -0.4275256, 1, 1, 1, 1, 1,
-0.4914969, 0.506787, -2.272495, 1, 1, 1, 1, 1,
-0.4914053, -0.06878416, -1.103614, 1, 1, 1, 1, 1,
-0.4853399, -0.4768573, -3.604589, 1, 1, 1, 1, 1,
-0.4812213, 1.134574, 0.5838911, 1, 1, 1, 1, 1,
-0.4786218, -0.2536319, -1.766764, 1, 1, 1, 1, 1,
-0.4783067, 0.1901371, -0.5902579, 1, 1, 1, 1, 1,
-0.478031, 0.4708664, -0.8834952, 1, 1, 1, 1, 1,
-0.4714858, -0.1371552, -1.160387, 1, 1, 1, 1, 1,
-0.470834, -1.096585, -2.192881, 1, 1, 1, 1, 1,
-0.464154, -0.8849773, -3.693753, 1, 1, 1, 1, 1,
-0.4631145, -0.1230618, -1.933351, 1, 1, 1, 1, 1,
-0.4573925, 0.3870675, -3.500436, 1, 1, 1, 1, 1,
-0.4544908, -1.117691, -2.850061, 1, 1, 1, 1, 1,
-0.4517714, 0.5501772, -1.162538, 0, 0, 1, 1, 1,
-0.4503555, -0.4225139, -4.059911, 1, 0, 0, 1, 1,
-0.4490656, -0.3332623, -1.897245, 1, 0, 0, 1, 1,
-0.4448215, 0.1794379, -0.1023678, 1, 0, 0, 1, 1,
-0.443635, -0.322468, -2.094833, 1, 0, 0, 1, 1,
-0.436249, 0.3359651, 0.8728454, 1, 0, 0, 1, 1,
-0.4348254, -1.945916, -3.637114, 0, 0, 0, 1, 1,
-0.4343298, 0.7588454, 1.535878, 0, 0, 0, 1, 1,
-0.4317275, 0.9646937, -0.3924885, 0, 0, 0, 1, 1,
-0.4313942, 0.3967304, -0.1065913, 0, 0, 0, 1, 1,
-0.4309405, -0.3581859, -0.7626649, 0, 0, 0, 1, 1,
-0.4293389, -1.505829, -3.424728, 0, 0, 0, 1, 1,
-0.4283785, 0.5102941, -0.03534418, 0, 0, 0, 1, 1,
-0.4088284, 0.663675, -0.8893702, 1, 1, 1, 1, 1,
-0.4006662, -1.546255, -3.821072, 1, 1, 1, 1, 1,
-0.3968734, -0.5923137, -0.7377486, 1, 1, 1, 1, 1,
-0.3941481, -1.042865, -3.004084, 1, 1, 1, 1, 1,
-0.3862091, -0.7229826, -3.514134, 1, 1, 1, 1, 1,
-0.384972, -0.1255942, -3.791021, 1, 1, 1, 1, 1,
-0.3837388, 0.07293145, -0.4014678, 1, 1, 1, 1, 1,
-0.3815786, 0.09301498, -1.493367, 1, 1, 1, 1, 1,
-0.381451, 1.008051, -0.4786067, 1, 1, 1, 1, 1,
-0.379971, 0.374624, -1.494796, 1, 1, 1, 1, 1,
-0.3778918, 1.013695, -0.8746763, 1, 1, 1, 1, 1,
-0.3758333, -0.1730256, -1.398429, 1, 1, 1, 1, 1,
-0.3739969, -0.1616319, -1.994071, 1, 1, 1, 1, 1,
-0.3718087, -0.2469746, -3.319475, 1, 1, 1, 1, 1,
-0.3685915, -0.9216785, -3.441049, 1, 1, 1, 1, 1,
-0.3646353, 1.374919, 0.9045667, 0, 0, 1, 1, 1,
-0.3625476, -0.01131232, 0.1407367, 1, 0, 0, 1, 1,
-0.3618362, -0.8832543, -1.162109, 1, 0, 0, 1, 1,
-0.3535132, -1.82997, -3.20546, 1, 0, 0, 1, 1,
-0.3527148, 0.1640667, -0.8515767, 1, 0, 0, 1, 1,
-0.3481359, -0.008075708, -3.329801, 1, 0, 0, 1, 1,
-0.338743, 0.572952, 0.07160717, 0, 0, 0, 1, 1,
-0.3328966, -0.4401747, -3.717947, 0, 0, 0, 1, 1,
-0.3298826, -0.2836369, -3.445722, 0, 0, 0, 1, 1,
-0.3296971, 0.5321351, 1.455632, 0, 0, 0, 1, 1,
-0.3275867, 0.975876, 2.228261, 0, 0, 0, 1, 1,
-0.3137347, -1.155918, -3.381184, 0, 0, 0, 1, 1,
-0.3127423, -0.6980983, -2.681484, 0, 0, 0, 1, 1,
-0.3084326, 1.525326, -2.135783, 1, 1, 1, 1, 1,
-0.3066849, 2.006355, -0.5413582, 1, 1, 1, 1, 1,
-0.3061044, -2.532881, -4.49877, 1, 1, 1, 1, 1,
-0.3035794, 1.400372, -0.5535133, 1, 1, 1, 1, 1,
-0.301309, -0.3807341, -4.011758, 1, 1, 1, 1, 1,
-0.3001462, -0.4295792, -3.749276, 1, 1, 1, 1, 1,
-0.2974081, -1.116595, -3.203593, 1, 1, 1, 1, 1,
-0.2961294, 0.4708413, 0.4915902, 1, 1, 1, 1, 1,
-0.2955792, -0.1990967, -2.586903, 1, 1, 1, 1, 1,
-0.2933187, -1.020412, -2.961512, 1, 1, 1, 1, 1,
-0.2926909, -1.147684, -4.236888, 1, 1, 1, 1, 1,
-0.2924836, -0.6247131, -3.171964, 1, 1, 1, 1, 1,
-0.2911807, -2.065364, -2.850008, 1, 1, 1, 1, 1,
-0.288267, 1.202922, 0.1564873, 1, 1, 1, 1, 1,
-0.286139, -1.414566, -3.596714, 1, 1, 1, 1, 1,
-0.2804186, -1.303082, -0.7199569, 0, 0, 1, 1, 1,
-0.2784368, -0.4995053, -2.811211, 1, 0, 0, 1, 1,
-0.2769782, 0.06498618, -2.769047, 1, 0, 0, 1, 1,
-0.2761771, 1.298423, -0.587949, 1, 0, 0, 1, 1,
-0.2741381, -0.6646129, -2.869813, 1, 0, 0, 1, 1,
-0.272965, 1.358131, -1.002067, 1, 0, 0, 1, 1,
-0.2720964, 0.8112575, -1.033136, 0, 0, 0, 1, 1,
-0.2654747, 0.7033962, 0.8554227, 0, 0, 0, 1, 1,
-0.2603248, 1.127513, 1.724295, 0, 0, 0, 1, 1,
-0.2593533, -0.3987536, -3.17221, 0, 0, 0, 1, 1,
-0.2586049, 0.8954974, -1.040316, 0, 0, 0, 1, 1,
-0.2570834, 0.1590853, -2.598143, 0, 0, 0, 1, 1,
-0.2504765, 1.222651, -0.71895, 0, 0, 0, 1, 1,
-0.2486464, 0.4195483, -1.665417, 1, 1, 1, 1, 1,
-0.2476134, 1.1846, -1.291558, 1, 1, 1, 1, 1,
-0.2465425, -0.5935231, -2.388314, 1, 1, 1, 1, 1,
-0.2433085, 0.61039, 0.2400147, 1, 1, 1, 1, 1,
-0.2432393, -0.8115254, -1.810206, 1, 1, 1, 1, 1,
-0.2351111, 0.8359813, -0.8671383, 1, 1, 1, 1, 1,
-0.2288448, 0.2128978, -2.502293, 1, 1, 1, 1, 1,
-0.2273824, 1.224231, 0.1821604, 1, 1, 1, 1, 1,
-0.2235937, -0.5477665, -1.56811, 1, 1, 1, 1, 1,
-0.2230183, -1.025665, -2.642576, 1, 1, 1, 1, 1,
-0.2219899, 0.610127, -0.1160012, 1, 1, 1, 1, 1,
-0.2219049, -0.8239866, -2.208207, 1, 1, 1, 1, 1,
-0.2214433, -0.3160462, -3.29435, 1, 1, 1, 1, 1,
-0.2181589, -0.06407833, -1.942565, 1, 1, 1, 1, 1,
-0.216397, -0.6073936, -0.9243421, 1, 1, 1, 1, 1,
-0.2152164, -0.706772, -1.29646, 0, 0, 1, 1, 1,
-0.2056168, -0.7352404, -4.629266, 1, 0, 0, 1, 1,
-0.2023537, -0.01435352, -3.228068, 1, 0, 0, 1, 1,
-0.200802, -0.4958492, -1.603438, 1, 0, 0, 1, 1,
-0.200166, 0.5043375, 1.338323, 1, 0, 0, 1, 1,
-0.1966569, -1.635293, -3.299602, 1, 0, 0, 1, 1,
-0.1952766, -0.3267099, -3.558358, 0, 0, 0, 1, 1,
-0.1951281, 0.8704945, -0.3758308, 0, 0, 0, 1, 1,
-0.1949575, 0.8080658, 2.132587, 0, 0, 0, 1, 1,
-0.1937907, 1.341818, 0.3362432, 0, 0, 0, 1, 1,
-0.1909968, 0.09248717, -0.1005825, 0, 0, 0, 1, 1,
-0.1907374, 1.293329, 0.13091, 0, 0, 0, 1, 1,
-0.188918, -2.093219, -3.34851, 0, 0, 0, 1, 1,
-0.1820679, -1.508128, -2.868299, 1, 1, 1, 1, 1,
-0.1790378, 0.3009263, 0.5767705, 1, 1, 1, 1, 1,
-0.1779201, -0.3673051, -3.628108, 1, 1, 1, 1, 1,
-0.174495, -2.195973, -5.451279, 1, 1, 1, 1, 1,
-0.1705089, -1.497615, -2.856075, 1, 1, 1, 1, 1,
-0.1666456, -1.287856, -3.806077, 1, 1, 1, 1, 1,
-0.155073, 0.1610815, 0.455267, 1, 1, 1, 1, 1,
-0.1527698, 0.2189584, -0.5126538, 1, 1, 1, 1, 1,
-0.1524387, -1.115852, -3.034938, 1, 1, 1, 1, 1,
-0.1505499, 0.6264364, 0.3206065, 1, 1, 1, 1, 1,
-0.1495871, 0.4005788, -0.9443818, 1, 1, 1, 1, 1,
-0.1491948, 0.8202506, -0.3060328, 1, 1, 1, 1, 1,
-0.1476896, -1.298153, -4.056982, 1, 1, 1, 1, 1,
-0.1466094, -0.7029034, -3.795304, 1, 1, 1, 1, 1,
-0.1461763, -0.1821, -2.172573, 1, 1, 1, 1, 1,
-0.144593, -0.9053025, -1.24947, 0, 0, 1, 1, 1,
-0.1437201, 0.4019994, 1.798189, 1, 0, 0, 1, 1,
-0.1409775, 0.4760835, 1.89786, 1, 0, 0, 1, 1,
-0.1373883, 1.803793, 0.178285, 1, 0, 0, 1, 1,
-0.1348521, 0.6928849, -0.3693079, 1, 0, 0, 1, 1,
-0.1343273, 0.8697903, -0.3131023, 1, 0, 0, 1, 1,
-0.1322016, -0.5398523, -4.642221, 0, 0, 0, 1, 1,
-0.1247906, -0.2502632, -2.603797, 0, 0, 0, 1, 1,
-0.1230924, 0.08664157, -1.445285, 0, 0, 0, 1, 1,
-0.1121081, -2.925536, -4.136226, 0, 0, 0, 1, 1,
-0.1112513, 1.135637, 1.363861, 0, 0, 0, 1, 1,
-0.1105438, 1.463175, 1.275479, 0, 0, 0, 1, 1,
-0.1095755, 0.7423595, -2.900388, 0, 0, 0, 1, 1,
-0.1077003, -1.308605, -1.671985, 1, 1, 1, 1, 1,
-0.1073035, 0.6908999, -0.874366, 1, 1, 1, 1, 1,
-0.1066698, -1.581203, -5.10884, 1, 1, 1, 1, 1,
-0.1027178, 0.3949836, -0.4158071, 1, 1, 1, 1, 1,
-0.1008358, 0.02776531, -0.8167704, 1, 1, 1, 1, 1,
-0.09871984, 0.2972941, -0.0680647, 1, 1, 1, 1, 1,
-0.09512868, -2.020578, -1.951014, 1, 1, 1, 1, 1,
-0.09349163, -0.08734861, -2.344872, 1, 1, 1, 1, 1,
-0.08365566, 1.318233, 1.531328, 1, 1, 1, 1, 1,
-0.08324689, 0.754273, -0.1233718, 1, 1, 1, 1, 1,
-0.08228058, -0.4458028, -4.732575, 1, 1, 1, 1, 1,
-0.08165333, -1.176028, -4.833619, 1, 1, 1, 1, 1,
-0.08110531, 0.4722216, -0.8322704, 1, 1, 1, 1, 1,
-0.0768595, 0.7149431, 1.367088, 1, 1, 1, 1, 1,
-0.0767159, -1.331039, -3.325791, 1, 1, 1, 1, 1,
-0.07583503, -1.516737, -3.341323, 0, 0, 1, 1, 1,
-0.07538189, 1.017214, 0.3621267, 1, 0, 0, 1, 1,
-0.07416922, 1.233124, -0.2741857, 1, 0, 0, 1, 1,
-0.07202253, 0.09603854, -0.6655425, 1, 0, 0, 1, 1,
-0.07200211, 0.4457861, -2.069082, 1, 0, 0, 1, 1,
-0.07175992, -2.484895, -4.201996, 1, 0, 0, 1, 1,
-0.07034474, -1.174431, -2.192507, 0, 0, 0, 1, 1,
-0.0697151, -0.2560686, -1.302244, 0, 0, 0, 1, 1,
-0.06897283, 0.239041, 1.669868, 0, 0, 0, 1, 1,
-0.06867666, 1.411487, 0.09394722, 0, 0, 0, 1, 1,
-0.06378534, -1.577894, -4.042267, 0, 0, 0, 1, 1,
-0.06025223, -1.342765, -3.104833, 0, 0, 0, 1, 1,
-0.05998812, -1.397964, -4.701815, 0, 0, 0, 1, 1,
-0.05136079, 0.3488263, -1.321973, 1, 1, 1, 1, 1,
-0.0373541, -1.231324, -3.947879, 1, 1, 1, 1, 1,
-0.03582873, -1.468655, -4.470929, 1, 1, 1, 1, 1,
-0.0308954, -0.01246595, -2.578977, 1, 1, 1, 1, 1,
-0.03044252, -1.367537, -1.791908, 1, 1, 1, 1, 1,
-0.01996471, 0.174534, 0.8314275, 1, 1, 1, 1, 1,
-0.01554969, 0.2822243, -0.3599153, 1, 1, 1, 1, 1,
-0.01378665, -0.2702439, -4.31562, 1, 1, 1, 1, 1,
-0.01220607, 0.4948044, 0.2228701, 1, 1, 1, 1, 1,
-0.01095636, -0.327883, -2.77535, 1, 1, 1, 1, 1,
-0.01024676, -0.2488005, -2.399916, 1, 1, 1, 1, 1,
-0.002842509, -0.7151158, -2.837634, 1, 1, 1, 1, 1,
-0.0006262024, 0.1530029, -0.8679238, 1, 1, 1, 1, 1,
-0.0003517696, 1.298311, 0.3519311, 1, 1, 1, 1, 1,
0.001368002, -0.9003596, 2.029672, 1, 1, 1, 1, 1,
0.009179679, 0.4786072, -0.8851178, 0, 0, 1, 1, 1,
0.01069142, -1.831494, 2.910476, 1, 0, 0, 1, 1,
0.01164293, 0.6465128, 0.07591587, 1, 0, 0, 1, 1,
0.01176182, -1.054048, 3.598111, 1, 0, 0, 1, 1,
0.01197953, 0.3851059, 0.1203211, 1, 0, 0, 1, 1,
0.01583593, -0.05342594, 4.489801, 1, 0, 0, 1, 1,
0.01646721, 0.4750558, -1.033427, 0, 0, 0, 1, 1,
0.02528881, 0.8898199, 1.58299, 0, 0, 0, 1, 1,
0.02954897, 0.9101816, 0.9553999, 0, 0, 0, 1, 1,
0.03114562, -0.5265532, 1.570859, 0, 0, 0, 1, 1,
0.03171458, 1.659124, 1.232695, 0, 0, 0, 1, 1,
0.03185917, 1.028907, 0.991843, 0, 0, 0, 1, 1,
0.03342573, -1.262965, 2.626153, 0, 0, 0, 1, 1,
0.03414439, -1.576476, 2.203598, 1, 1, 1, 1, 1,
0.03673007, -0.6485952, 2.020047, 1, 1, 1, 1, 1,
0.04164055, -0.202199, 3.384616, 1, 1, 1, 1, 1,
0.0452343, 0.2712456, -0.8341497, 1, 1, 1, 1, 1,
0.04799867, 0.7656714, -1.709791, 1, 1, 1, 1, 1,
0.0506156, -0.4074448, 1.637851, 1, 1, 1, 1, 1,
0.05412595, -0.08460361, 2.149249, 1, 1, 1, 1, 1,
0.05867263, 1.429871, -0.6745432, 1, 1, 1, 1, 1,
0.06244392, -1.262232, 4.57255, 1, 1, 1, 1, 1,
0.06302879, 0.3268053, 0.2116687, 1, 1, 1, 1, 1,
0.06890884, -0.1451597, 1.637477, 1, 1, 1, 1, 1,
0.07037351, -1.55289, 3.874247, 1, 1, 1, 1, 1,
0.07053447, -0.7369006, 3.065706, 1, 1, 1, 1, 1,
0.07249723, 0.2698159, 0.3325151, 1, 1, 1, 1, 1,
0.07503925, 1.080287, 0.5606973, 1, 1, 1, 1, 1,
0.07557689, 0.1259904, -0.3845717, 0, 0, 1, 1, 1,
0.07738262, -0.1029567, 2.687319, 1, 0, 0, 1, 1,
0.07931028, 0.2305553, -0.8295116, 1, 0, 0, 1, 1,
0.07948668, 0.2949454, 0.9167443, 1, 0, 0, 1, 1,
0.08154145, 0.3531083, -1.054512, 1, 0, 0, 1, 1,
0.08445876, 0.7024962, -0.4300513, 1, 0, 0, 1, 1,
0.08632777, -0.003373633, 1.387243, 0, 0, 0, 1, 1,
0.0863414, -0.7786877, 1.755627, 0, 0, 0, 1, 1,
0.09039094, -0.3202179, 2.96888, 0, 0, 0, 1, 1,
0.09101985, -1.374072, 4.081347, 0, 0, 0, 1, 1,
0.09482865, -0.4601437, 6.029751, 0, 0, 0, 1, 1,
0.09647895, -0.6465458, 2.599149, 0, 0, 0, 1, 1,
0.09806001, -0.3282652, 2.951704, 0, 0, 0, 1, 1,
0.1032557, -0.4522165, 1.460414, 1, 1, 1, 1, 1,
0.1057616, 1.582662, 0.4960214, 1, 1, 1, 1, 1,
0.1061506, -1.213303, 3.043414, 1, 1, 1, 1, 1,
0.10922, 1.98889, 0.7736784, 1, 1, 1, 1, 1,
0.1093087, 0.2306552, 0.352453, 1, 1, 1, 1, 1,
0.1095527, -1.682273, 2.627968, 1, 1, 1, 1, 1,
0.1112868, 1.480264, 0.01862313, 1, 1, 1, 1, 1,
0.1132653, -0.542424, 2.469313, 1, 1, 1, 1, 1,
0.1175674, -0.2714371, 3.693813, 1, 1, 1, 1, 1,
0.1193071, -1.424883, 2.83497, 1, 1, 1, 1, 1,
0.1227103, 1.484858, 1.549237, 1, 1, 1, 1, 1,
0.1251134, 0.192876, 0.08057381, 1, 1, 1, 1, 1,
0.1272965, -0.06962947, 1.846047, 1, 1, 1, 1, 1,
0.128904, -0.2458296, 3.860353, 1, 1, 1, 1, 1,
0.1291983, 0.296128, -0.3180432, 1, 1, 1, 1, 1,
0.1324897, 1.5017, 1.412084, 0, 0, 1, 1, 1,
0.134815, 0.5255398, 0.4352554, 1, 0, 0, 1, 1,
0.1363302, 0.1068971, 2.967126, 1, 0, 0, 1, 1,
0.1420211, -0.02596266, 2.092663, 1, 0, 0, 1, 1,
0.1446128, -2.119064, 2.568206, 1, 0, 0, 1, 1,
0.15058, 0.233321, 0.9795788, 1, 0, 0, 1, 1,
0.1522626, 0.3760823, -0.5353248, 0, 0, 0, 1, 1,
0.1536816, -0.03442577, 1.911242, 0, 0, 0, 1, 1,
0.1545337, 1.669506, 0.3667448, 0, 0, 0, 1, 1,
0.1594073, 0.3788656, 0.8428192, 0, 0, 0, 1, 1,
0.1648593, 0.08307557, 0.4406085, 0, 0, 0, 1, 1,
0.1697182, -0.2209084, 0.9418622, 0, 0, 0, 1, 1,
0.1701311, -1.175067, 2.362504, 0, 0, 0, 1, 1,
0.1723321, -0.4431227, 2.956531, 1, 1, 1, 1, 1,
0.1772125, 0.7051522, 2.37274, 1, 1, 1, 1, 1,
0.1793509, 1.649853, 1.840964, 1, 1, 1, 1, 1,
0.1799089, -0.676915, 2.463, 1, 1, 1, 1, 1,
0.1816187, -0.3827034, 3.717252, 1, 1, 1, 1, 1,
0.1867678, 0.1181666, 0.5705836, 1, 1, 1, 1, 1,
0.1871012, 0.6090444, -1.234743, 1, 1, 1, 1, 1,
0.1883045, -1.089861, 2.919909, 1, 1, 1, 1, 1,
0.191839, 0.2759108, 3.291413, 1, 1, 1, 1, 1,
0.1950897, -1.174303, 1.728985, 1, 1, 1, 1, 1,
0.1968328, -0.8026111, 2.065889, 1, 1, 1, 1, 1,
0.1985615, 0.1840029, 1.462459, 1, 1, 1, 1, 1,
0.2033785, 0.3048078, 0.6195661, 1, 1, 1, 1, 1,
0.2047255, -1.495777, 2.270673, 1, 1, 1, 1, 1,
0.2070697, -0.8854205, 0.4357655, 1, 1, 1, 1, 1,
0.2130271, -0.7516072, 2.352407, 0, 0, 1, 1, 1,
0.2166104, -1.701637, 3.02471, 1, 0, 0, 1, 1,
0.2178009, 0.131244, 2.227574, 1, 0, 0, 1, 1,
0.2194999, 0.5493392, 1.392902, 1, 0, 0, 1, 1,
0.2225307, 0.949351, 2.228076, 1, 0, 0, 1, 1,
0.2249858, -0.2964765, 4.214831, 1, 0, 0, 1, 1,
0.2308052, -0.3807003, 4.047752, 0, 0, 0, 1, 1,
0.2321022, -0.6328443, 2.158034, 0, 0, 0, 1, 1,
0.2385392, -0.05956561, 1.382118, 0, 0, 0, 1, 1,
0.2398341, 0.0782855, 0.8647594, 0, 0, 0, 1, 1,
0.2481696, 0.691258, -0.7790251, 0, 0, 0, 1, 1,
0.2517352, 0.05426525, 1.588454, 0, 0, 0, 1, 1,
0.2581232, -1.816055, 2.063786, 0, 0, 0, 1, 1,
0.2630105, 1.647998, -0.1327423, 1, 1, 1, 1, 1,
0.2640313, -1.516334, 2.702737, 1, 1, 1, 1, 1,
0.2643194, -2.079471, 2.611086, 1, 1, 1, 1, 1,
0.2674479, 0.4104009, 1.096971, 1, 1, 1, 1, 1,
0.2680085, -0.8964251, 1.762102, 1, 1, 1, 1, 1,
0.2705715, -2.4534, 2.927783, 1, 1, 1, 1, 1,
0.2715614, 1.637971, 1.018294, 1, 1, 1, 1, 1,
0.2742772, -1.674503, 3.535069, 1, 1, 1, 1, 1,
0.2779034, 0.8420041, 0.7769791, 1, 1, 1, 1, 1,
0.2809309, 0.02481928, 1.086366, 1, 1, 1, 1, 1,
0.2823763, -0.5063962, 2.340621, 1, 1, 1, 1, 1,
0.2831889, -1.986636, 2.55313, 1, 1, 1, 1, 1,
0.2841791, -0.07359832, 1.663454, 1, 1, 1, 1, 1,
0.2852574, -0.4646062, 2.101527, 1, 1, 1, 1, 1,
0.2899034, 0.1743196, 1.872299, 1, 1, 1, 1, 1,
0.2914766, -0.3494691, 0.3765169, 0, 0, 1, 1, 1,
0.2928253, -1.031185, 2.910153, 1, 0, 0, 1, 1,
0.2930694, -0.09536476, 1.04924, 1, 0, 0, 1, 1,
0.2931793, 0.5378592, 0.7024391, 1, 0, 0, 1, 1,
0.3010177, -1.606269, 3.186062, 1, 0, 0, 1, 1,
0.3021094, -1.85027, 3.10875, 1, 0, 0, 1, 1,
0.3026855, -1.453287, 2.659521, 0, 0, 0, 1, 1,
0.3055371, 0.619593, 0.2005306, 0, 0, 0, 1, 1,
0.3129566, -1.600047, 4.873111, 0, 0, 0, 1, 1,
0.3153842, 0.9667898, -0.1309998, 0, 0, 0, 1, 1,
0.319585, -0.3022432, 1.208045, 0, 0, 0, 1, 1,
0.3232435, -0.06548659, 2.163513, 0, 0, 0, 1, 1,
0.3257035, 0.2745918, 1.668875, 0, 0, 0, 1, 1,
0.3289994, 0.3853137, 0.6630933, 1, 1, 1, 1, 1,
0.3305089, -0.08983214, 2.169558, 1, 1, 1, 1, 1,
0.3320965, -0.7543327, 2.225633, 1, 1, 1, 1, 1,
0.3328717, 0.289789, 1.234595, 1, 1, 1, 1, 1,
0.3365523, -0.9058873, 2.233383, 1, 1, 1, 1, 1,
0.3374421, -1.172644, 2.81898, 1, 1, 1, 1, 1,
0.3377478, 0.09344108, 1.182345, 1, 1, 1, 1, 1,
0.339259, -0.6968768, 1.773435, 1, 1, 1, 1, 1,
0.3417468, -0.7571398, 3.597012, 1, 1, 1, 1, 1,
0.3502536, 1.289279, 0.7366135, 1, 1, 1, 1, 1,
0.3513732, -1.514412, 2.69306, 1, 1, 1, 1, 1,
0.3587915, -1.575088, 2.821784, 1, 1, 1, 1, 1,
0.3595099, -0.06865355, 2.701349, 1, 1, 1, 1, 1,
0.3631297, -1.301924, 3.015765, 1, 1, 1, 1, 1,
0.3633067, -1.460561, 1.568534, 1, 1, 1, 1, 1,
0.364335, 1.419286, 1.383257, 0, 0, 1, 1, 1,
0.366785, 0.4610311, 0.1866934, 1, 0, 0, 1, 1,
0.3674658, 0.7404265, 0.3931419, 1, 0, 0, 1, 1,
0.3704405, -0.5978824, 3.478883, 1, 0, 0, 1, 1,
0.3710782, -0.7234365, 3.920775, 1, 0, 0, 1, 1,
0.3727316, 1.405436, 1.886369, 1, 0, 0, 1, 1,
0.375591, 0.7131923, 1.695188, 0, 0, 0, 1, 1,
0.37727, 0.3339808, 3.059505, 0, 0, 0, 1, 1,
0.3783875, -0.279505, 2.289635, 0, 0, 0, 1, 1,
0.3804672, -0.5631343, 2.546619, 0, 0, 0, 1, 1,
0.3827304, -0.3605787, 3.098495, 0, 0, 0, 1, 1,
0.3840569, -1.882478, 4.240423, 0, 0, 0, 1, 1,
0.3852772, 0.77106, 0.743385, 0, 0, 0, 1, 1,
0.3879642, 0.08368074, 2.009109, 1, 1, 1, 1, 1,
0.3892226, 0.3596485, 0.3503351, 1, 1, 1, 1, 1,
0.3912894, 1.590006, 0.9374745, 1, 1, 1, 1, 1,
0.391881, -0.8458368, 5.137379, 1, 1, 1, 1, 1,
0.396355, 0.2848911, 0.8935342, 1, 1, 1, 1, 1,
0.4005969, 0.9177088, 1.001471, 1, 1, 1, 1, 1,
0.4034171, -0.2224597, 1.51443, 1, 1, 1, 1, 1,
0.4099609, -0.5204673, 1.860024, 1, 1, 1, 1, 1,
0.411128, 0.6136611, -0.6705086, 1, 1, 1, 1, 1,
0.4172003, -0.7794365, 1.571824, 1, 1, 1, 1, 1,
0.4196945, 0.5337784, 0.8748561, 1, 1, 1, 1, 1,
0.4265591, 1.770386, -1.329941, 1, 1, 1, 1, 1,
0.4366922, 1.340193, 1.859689, 1, 1, 1, 1, 1,
0.4391087, 0.6595063, 1.566446, 1, 1, 1, 1, 1,
0.439426, 0.4110118, 2.246312, 1, 1, 1, 1, 1,
0.4418407, 0.1529314, 0.6550962, 0, 0, 1, 1, 1,
0.4427799, -0.5452155, 3.079262, 1, 0, 0, 1, 1,
0.4429194, -0.6880736, 0.950591, 1, 0, 0, 1, 1,
0.4473186, -0.3842299, 1.241145, 1, 0, 0, 1, 1,
0.4511582, -0.07138553, 3.265253, 1, 0, 0, 1, 1,
0.457105, 0.8238875, 2.192976, 1, 0, 0, 1, 1,
0.4583696, 0.07363582, 1.983933, 0, 0, 0, 1, 1,
0.4626248, -0.6006216, 2.73396, 0, 0, 0, 1, 1,
0.4701828, -0.08546437, 2.810506, 0, 0, 0, 1, 1,
0.4704312, 0.7881625, 2.672461, 0, 0, 0, 1, 1,
0.4757629, -1.371276, 2.084179, 0, 0, 0, 1, 1,
0.4814595, 1.081439, 0.578577, 0, 0, 0, 1, 1,
0.4820677, 1.425181, 0.07089016, 0, 0, 0, 1, 1,
0.4846252, -1.906791, 3.381117, 1, 1, 1, 1, 1,
0.4886839, 0.4945419, 2.854458, 1, 1, 1, 1, 1,
0.4931915, 0.9627362, 1.011916, 1, 1, 1, 1, 1,
0.4937717, 0.7639305, 1.146828, 1, 1, 1, 1, 1,
0.4955519, -0.3594117, 2.806192, 1, 1, 1, 1, 1,
0.4958877, 0.1600769, 3.802904, 1, 1, 1, 1, 1,
0.4993871, -0.02561846, 4.006793, 1, 1, 1, 1, 1,
0.5123438, 1.641403, 0.5174747, 1, 1, 1, 1, 1,
0.5145589, -0.9403289, 3.300877, 1, 1, 1, 1, 1,
0.5148227, -0.1345231, 2.324384, 1, 1, 1, 1, 1,
0.5187396, 0.06756414, 0.3106264, 1, 1, 1, 1, 1,
0.5196482, -0.03865432, 0.6765668, 1, 1, 1, 1, 1,
0.5197571, 0.7515252, 0.5440742, 1, 1, 1, 1, 1,
0.5233437, -0.7752135, 1.759772, 1, 1, 1, 1, 1,
0.5274177, 0.6790295, 1.895571, 1, 1, 1, 1, 1,
0.5281945, 0.43989, 1.149933, 0, 0, 1, 1, 1,
0.5300538, -0.1732366, 1.977275, 1, 0, 0, 1, 1,
0.5396773, 0.9349803, -2.792071, 1, 0, 0, 1, 1,
0.5428812, 0.2179267, 1.50722, 1, 0, 0, 1, 1,
0.5437002, -0.07525426, 2.124861, 1, 0, 0, 1, 1,
0.54372, -0.6388327, 2.820241, 1, 0, 0, 1, 1,
0.5450784, 0.7794929, 0.6478754, 0, 0, 0, 1, 1,
0.5499267, 0.1846191, 1.914026, 0, 0, 0, 1, 1,
0.5530886, -1.442219, 1.899264, 0, 0, 0, 1, 1,
0.5533732, 2.327907, -1.318426, 0, 0, 0, 1, 1,
0.5564149, 1.399763, 0.4049484, 0, 0, 0, 1, 1,
0.5568814, -1.836068, 1.637036, 0, 0, 0, 1, 1,
0.5571682, 0.5433003, 2.42323, 0, 0, 0, 1, 1,
0.5615516, -0.9249003, 2.475658, 1, 1, 1, 1, 1,
0.5617113, -1.868939, 1.710544, 1, 1, 1, 1, 1,
0.5631424, 0.9258208, 0.1709418, 1, 1, 1, 1, 1,
0.5639368, 0.7685203, 1.607711, 1, 1, 1, 1, 1,
0.5690973, 0.6334768, 0.2772513, 1, 1, 1, 1, 1,
0.5692968, -1.602814, 3.49212, 1, 1, 1, 1, 1,
0.5696256, -1.165668, 2.591953, 1, 1, 1, 1, 1,
0.5763607, -0.3606111, 1.541194, 1, 1, 1, 1, 1,
0.5776314, 0.9591336, -0.8934866, 1, 1, 1, 1, 1,
0.5783201, -0.4746665, 1.704344, 1, 1, 1, 1, 1,
0.5818938, 0.3104908, 2.185422, 1, 1, 1, 1, 1,
0.5825716, -0.4839354, 2.518835, 1, 1, 1, 1, 1,
0.5835907, -1.091493, 3.419556, 1, 1, 1, 1, 1,
0.5836751, -0.2339001, 2.291689, 1, 1, 1, 1, 1,
0.58634, 0.8296732, -0.5188923, 1, 1, 1, 1, 1,
0.5918205, 0.2670391, 0.7743412, 0, 0, 1, 1, 1,
0.5931779, 0.7075661, 1.57203, 1, 0, 0, 1, 1,
0.5934637, 1.485651, -0.3435095, 1, 0, 0, 1, 1,
0.5977786, -1.625566, 2.994185, 1, 0, 0, 1, 1,
0.5980404, 0.3196151, 0.9606891, 1, 0, 0, 1, 1,
0.6018894, 0.419097, 3.42728, 1, 0, 0, 1, 1,
0.6056249, 0.1909135, 1.945449, 0, 0, 0, 1, 1,
0.6125118, -0.1675702, 1.924677, 0, 0, 0, 1, 1,
0.6216751, 0.1655859, 1.391238, 0, 0, 0, 1, 1,
0.6225962, 2.092936, 0.8596529, 0, 0, 0, 1, 1,
0.6267941, 0.02153706, 0.4276414, 0, 0, 0, 1, 1,
0.6543853, -0.6803929, 4.263459, 0, 0, 0, 1, 1,
0.6563759, -0.7388669, 2.597133, 0, 0, 0, 1, 1,
0.6682879, -0.8582167, 3.567498, 1, 1, 1, 1, 1,
0.6692535, -0.2224135, 2.995003, 1, 1, 1, 1, 1,
0.6750976, -1.23742, 2.267136, 1, 1, 1, 1, 1,
0.6817297, -1.36768, 3.8384, 1, 1, 1, 1, 1,
0.6846721, 0.6713998, 2.288909, 1, 1, 1, 1, 1,
0.6881184, 0.0360443, 1.269192, 1, 1, 1, 1, 1,
0.6884688, -0.2059741, -0.2623229, 1, 1, 1, 1, 1,
0.6935823, -1.114422, 2.401226, 1, 1, 1, 1, 1,
0.6943817, -1.213232, 1.228096, 1, 1, 1, 1, 1,
0.6957038, -1.487377, 1.781269, 1, 1, 1, 1, 1,
0.6985195, -2.041432, 3.21878, 1, 1, 1, 1, 1,
0.7039026, 1.142354, 0.559422, 1, 1, 1, 1, 1,
0.7108389, 0.6292011, 1.342201, 1, 1, 1, 1, 1,
0.7149447, -1.632955, 3.297514, 1, 1, 1, 1, 1,
0.7155576, 0.5892493, 0.5093558, 1, 1, 1, 1, 1,
0.7195283, -1.729203, 3.12524, 0, 0, 1, 1, 1,
0.7327969, -0.5411785, 1.947975, 1, 0, 0, 1, 1,
0.7350373, 0.190401, 1.03887, 1, 0, 0, 1, 1,
0.7542971, 0.06350821, 2.370637, 1, 0, 0, 1, 1,
0.754904, -0.2523085, 3.771472, 1, 0, 0, 1, 1,
0.7560444, 1.864997, -1.375351, 1, 0, 0, 1, 1,
0.7612867, -1.014395, 3.264397, 0, 0, 0, 1, 1,
0.762163, 0.01960913, 0.8797182, 0, 0, 0, 1, 1,
0.7678655, 1.935583, 0.3481437, 0, 0, 0, 1, 1,
0.770179, -0.2349451, 1.366437, 0, 0, 0, 1, 1,
0.7707665, 0.2983619, 1.71396, 0, 0, 0, 1, 1,
0.7708139, -0.2233501, 1.677615, 0, 0, 0, 1, 1,
0.7709299, 0.2370614, 0.397156, 0, 0, 0, 1, 1,
0.7747822, -0.8675811, 2.519136, 1, 1, 1, 1, 1,
0.7754422, -0.7962172, 1.940858, 1, 1, 1, 1, 1,
0.7801023, -1.023975, 2.185382, 1, 1, 1, 1, 1,
0.7811707, -0.06252278, 1.573133, 1, 1, 1, 1, 1,
0.7865938, 0.2100296, 3.660658, 1, 1, 1, 1, 1,
0.7870219, 0.08410206, 1.315097, 1, 1, 1, 1, 1,
0.7882494, 1.384899, 3.061564, 1, 1, 1, 1, 1,
0.7932193, -1.647192, 1.980346, 1, 1, 1, 1, 1,
0.7970349, 1.636299, -2.481171, 1, 1, 1, 1, 1,
0.8079616, -0.2991321, 3.097093, 1, 1, 1, 1, 1,
0.8118019, 0.4630097, 0.3705543, 1, 1, 1, 1, 1,
0.8132352, 0.08518124, 0.3292286, 1, 1, 1, 1, 1,
0.8277097, 1.671788, 2.338922, 1, 1, 1, 1, 1,
0.8385525, -0.5446547, 2.030567, 1, 1, 1, 1, 1,
0.8404449, -1.573964, 1.676333, 1, 1, 1, 1, 1,
0.8590971, -0.7897986, 2.656917, 0, 0, 1, 1, 1,
0.861181, -0.2320645, 0.4278554, 1, 0, 0, 1, 1,
0.861832, -0.1048886, 3.712793, 1, 0, 0, 1, 1,
0.8717201, 0.9938391, -0.07262559, 1, 0, 0, 1, 1,
0.8738507, 1.049401, 1.077922, 1, 0, 0, 1, 1,
0.8758726, -0.1138719, 3.370602, 1, 0, 0, 1, 1,
0.8820566, -0.6003808, 1.609397, 0, 0, 0, 1, 1,
0.8850859, -0.4209244, 1.727233, 0, 0, 0, 1, 1,
0.886742, 2.567873, 0.44739, 0, 0, 0, 1, 1,
0.88679, -0.3658055, 2.584423, 0, 0, 0, 1, 1,
0.8893229, -0.5675265, 2.855073, 0, 0, 0, 1, 1,
0.8929617, -0.09450326, 1.33689, 0, 0, 0, 1, 1,
0.8961145, -0.3719196, 0.9954655, 0, 0, 0, 1, 1,
0.8991425, 0.1462029, 1.146916, 1, 1, 1, 1, 1,
0.9004274, 0.5166112, 2.093557, 1, 1, 1, 1, 1,
0.9010464, -0.5062336, 2.149947, 1, 1, 1, 1, 1,
0.9070819, 0.9106575, 0.8057244, 1, 1, 1, 1, 1,
0.9178128, -1.281794, 3.326258, 1, 1, 1, 1, 1,
0.9184511, -0.3265159, 1.885146, 1, 1, 1, 1, 1,
0.9189883, -0.8386063, 2.801335, 1, 1, 1, 1, 1,
0.9205663, 0.5827069, 1.139515, 1, 1, 1, 1, 1,
0.9225793, 0.1093646, 1.055305, 1, 1, 1, 1, 1,
0.9280899, -1.08658, 3.068679, 1, 1, 1, 1, 1,
0.9504949, -1.069864, 1.981012, 1, 1, 1, 1, 1,
0.9521771, 0.5518103, -0.2211671, 1, 1, 1, 1, 1,
0.953047, 0.4829497, 1.688924, 1, 1, 1, 1, 1,
0.9660453, -1.041752, 1.551315, 1, 1, 1, 1, 1,
0.9720345, 1.112809, 0.8251739, 1, 1, 1, 1, 1,
0.9728962, -0.01125173, 2.635678, 0, 0, 1, 1, 1,
0.9731274, -0.3679861, 2.421208, 1, 0, 0, 1, 1,
0.9784731, 2.35324, -1.542259, 1, 0, 0, 1, 1,
0.9842405, -0.8011394, 4.705524, 1, 0, 0, 1, 1,
0.9898931, 1.539384, 0.5978953, 1, 0, 0, 1, 1,
0.9948584, -1.527204, 2.967225, 1, 0, 0, 1, 1,
0.9969282, -1.052406, 1.694318, 0, 0, 0, 1, 1,
0.9995784, 0.2755604, 1.722733, 0, 0, 0, 1, 1,
0.9996509, -1.465933, 3.932239, 0, 0, 0, 1, 1,
1.005136, -0.6386057, 2.9706, 0, 0, 0, 1, 1,
1.006464, -0.3184158, 2.81757, 0, 0, 0, 1, 1,
1.012729, -0.07163716, 3.502956, 0, 0, 0, 1, 1,
1.013458, -0.6126124, 3.390604, 0, 0, 0, 1, 1,
1.013846, -0.09257102, 1.778567, 1, 1, 1, 1, 1,
1.013952, 0.08236848, 2.580356, 1, 1, 1, 1, 1,
1.016379, -1.052526, 4.063593, 1, 1, 1, 1, 1,
1.023341, 0.6498138, 1.231607, 1, 1, 1, 1, 1,
1.03763, -0.2606686, 0.9651181, 1, 1, 1, 1, 1,
1.03864, -0.8100048, 2.37988, 1, 1, 1, 1, 1,
1.04067, -0.4350803, 1.580459, 1, 1, 1, 1, 1,
1.060075, 0.1244105, 0.8651674, 1, 1, 1, 1, 1,
1.067066, 1.202941, 0.5031099, 1, 1, 1, 1, 1,
1.068563, -0.9481695, 1.273823, 1, 1, 1, 1, 1,
1.077159, -0.9704218, 2.698574, 1, 1, 1, 1, 1,
1.078593, -1.071127, 1.075279, 1, 1, 1, 1, 1,
1.088871, -2.143219, 3.106746, 1, 1, 1, 1, 1,
1.092382, 2.232556, 0.7440009, 1, 1, 1, 1, 1,
1.097263, -0.1848159, 0.8116733, 1, 1, 1, 1, 1,
1.108475, -0.4596629, 2.87167, 0, 0, 1, 1, 1,
1.112984, 0.1730144, 0.9156303, 1, 0, 0, 1, 1,
1.114506, 0.4062653, 0.2067144, 1, 0, 0, 1, 1,
1.117472, -2.420292, 3.173855, 1, 0, 0, 1, 1,
1.133227, -0.1080457, 2.374196, 1, 0, 0, 1, 1,
1.136729, 1.609935, 0.9082376, 1, 0, 0, 1, 1,
1.13765, -0.3503328, 0.8684611, 0, 0, 0, 1, 1,
1.138326, -0.7144265, 1.326219, 0, 0, 0, 1, 1,
1.139905, -0.3189407, 2.323186, 0, 0, 0, 1, 1,
1.142649, -1.119305, 2.837215, 0, 0, 0, 1, 1,
1.151424, 0.3610449, 1.011973, 0, 0, 0, 1, 1,
1.162613, -0.6323103, 1.980645, 0, 0, 0, 1, 1,
1.16697, 0.5677814, 1.723505, 0, 0, 0, 1, 1,
1.167273, -1.352601, 3.922623, 1, 1, 1, 1, 1,
1.169163, -0.3355004, 1.193025, 1, 1, 1, 1, 1,
1.170109, -0.5338312, 2.26578, 1, 1, 1, 1, 1,
1.177739, 1.468937, 0.9600253, 1, 1, 1, 1, 1,
1.178982, -0.005800892, 1.797924, 1, 1, 1, 1, 1,
1.179426, -0.637836, 1.477568, 1, 1, 1, 1, 1,
1.186112, -0.2630703, 1.872096, 1, 1, 1, 1, 1,
1.18637, 1.27772, 0.1894535, 1, 1, 1, 1, 1,
1.19401, -2.026143, 1.324259, 1, 1, 1, 1, 1,
1.20277, -0.8652986, 2.9769, 1, 1, 1, 1, 1,
1.203051, 0.5523799, 1.757607, 1, 1, 1, 1, 1,
1.215992, -0.1019365, -0.1715291, 1, 1, 1, 1, 1,
1.228918, -0.3700885, 2.134929, 1, 1, 1, 1, 1,
1.242037, -0.7260185, 3.191034, 1, 1, 1, 1, 1,
1.242154, 0.1923958, 0.2140494, 1, 1, 1, 1, 1,
1.24474, 1.277358, -0.1172654, 0, 0, 1, 1, 1,
1.245735, 0.1648012, 1.858683, 1, 0, 0, 1, 1,
1.255184, 0.8641472, 0.8652562, 1, 0, 0, 1, 1,
1.259732, -0.6152242, 2.208458, 1, 0, 0, 1, 1,
1.260662, -0.8360752, 2.917917, 1, 0, 0, 1, 1,
1.262376, 0.08617303, 0.2362073, 1, 0, 0, 1, 1,
1.267738, -0.6278018, -0.2571663, 0, 0, 0, 1, 1,
1.270192, 1.520536, 0.7662942, 0, 0, 0, 1, 1,
1.272445, -1.759141, 3.308895, 0, 0, 0, 1, 1,
1.274541, 0.05755409, 0.7254365, 0, 0, 0, 1, 1,
1.278791, -0.007718547, 0.8905508, 0, 0, 0, 1, 1,
1.284614, -0.2262167, 0.9527825, 0, 0, 0, 1, 1,
1.308176, 0.2780839, 0.6443391, 0, 0, 0, 1, 1,
1.313757, -0.4389919, 1.470266, 1, 1, 1, 1, 1,
1.320492, 0.4652485, -0.1684136, 1, 1, 1, 1, 1,
1.320767, 0.4125541, 0.104273, 1, 1, 1, 1, 1,
1.325028, -1.108283, 1.197337, 1, 1, 1, 1, 1,
1.325842, 0.5496079, 0.6610085, 1, 1, 1, 1, 1,
1.330539, 0.7910714, 0.2406752, 1, 1, 1, 1, 1,
1.335552, -1.06168, 1.98508, 1, 1, 1, 1, 1,
1.338647, -1.098035, 0.4390979, 1, 1, 1, 1, 1,
1.353381, -1.680918, 2.491251, 1, 1, 1, 1, 1,
1.356635, 0.4230116, 0.8342934, 1, 1, 1, 1, 1,
1.358281, -1.846464, 0.9269873, 1, 1, 1, 1, 1,
1.364326, -0.3352573, 0.07405856, 1, 1, 1, 1, 1,
1.366211, -0.9522629, 1.216344, 1, 1, 1, 1, 1,
1.368825, -1.077449, 1.158339, 1, 1, 1, 1, 1,
1.372696, 0.3000292, 0.988888, 1, 1, 1, 1, 1,
1.382445, 0.09303147, -1.079068, 0, 0, 1, 1, 1,
1.390191, 0.585174, 2.711028, 1, 0, 0, 1, 1,
1.393929, -0.636902, 2.483098, 1, 0, 0, 1, 1,
1.400762, -1.468226, 1.767179, 1, 0, 0, 1, 1,
1.408715, -2.360965, 2.10393, 1, 0, 0, 1, 1,
1.4094, 1.465868, 2.16308, 1, 0, 0, 1, 1,
1.413979, 0.2488445, 1.142456, 0, 0, 0, 1, 1,
1.417111, 0.8443898, 0.8838865, 0, 0, 0, 1, 1,
1.418068, 0.2369162, 4.160806, 0, 0, 0, 1, 1,
1.421221, 1.042591, 1.861553, 0, 0, 0, 1, 1,
1.421762, -0.2050715, 1.712753, 0, 0, 0, 1, 1,
1.434316, -0.855577, 2.468496, 0, 0, 0, 1, 1,
1.435424, -0.5582844, 0.9696902, 0, 0, 0, 1, 1,
1.443553, 0.08674978, 1.568317, 1, 1, 1, 1, 1,
1.449383, 0.5643063, -0.7023796, 1, 1, 1, 1, 1,
1.473565, 0.456728, 1.648006, 1, 1, 1, 1, 1,
1.48328, 2.284813, 0.045782, 1, 1, 1, 1, 1,
1.489858, 0.7188538, 0.9286624, 1, 1, 1, 1, 1,
1.509335, -2.288077, 3.115709, 1, 1, 1, 1, 1,
1.512203, 1.679137, 0.2024008, 1, 1, 1, 1, 1,
1.515054, 0.2949279, -0.5765796, 1, 1, 1, 1, 1,
1.516133, 2.125026, 1.1939, 1, 1, 1, 1, 1,
1.516786, -0.3253732, 3.46522, 1, 1, 1, 1, 1,
1.528188, -0.4839468, 1.662815, 1, 1, 1, 1, 1,
1.555677, 1.634276, 0.836621, 1, 1, 1, 1, 1,
1.567817, 0.4114105, 2.441195, 1, 1, 1, 1, 1,
1.572303, 0.4214598, -0.3828278, 1, 1, 1, 1, 1,
1.587562, 0.2030267, 1.607588, 1, 1, 1, 1, 1,
1.590977, 0.03855048, 1.96443, 0, 0, 1, 1, 1,
1.611816, 2.083732, 0.4679584, 1, 0, 0, 1, 1,
1.614447, -0.151201, 1.438415, 1, 0, 0, 1, 1,
1.615478, 0.7074446, 1.153834, 1, 0, 0, 1, 1,
1.615971, 0.03238739, 1.451892, 1, 0, 0, 1, 1,
1.616804, -1.269342, 2.758293, 1, 0, 0, 1, 1,
1.621736, -1.145702, 4.50741, 0, 0, 0, 1, 1,
1.622035, -0.02315143, 2.939736, 0, 0, 0, 1, 1,
1.624821, 2.541259, -0.6467016, 0, 0, 0, 1, 1,
1.629106, 1.02404, 0.4363693, 0, 0, 0, 1, 1,
1.639899, -0.2152831, 2.538609, 0, 0, 0, 1, 1,
1.642043, -0.7604853, 0.7206748, 0, 0, 0, 1, 1,
1.655458, -0.1515558, 0.1313073, 0, 0, 0, 1, 1,
1.658468, -0.2490485, 0.8207772, 1, 1, 1, 1, 1,
1.660455, 0.167298, 0.561255, 1, 1, 1, 1, 1,
1.666548, 0.4060527, 1.411235, 1, 1, 1, 1, 1,
1.667291, -0.8228233, 1.146826, 1, 1, 1, 1, 1,
1.691805, 1.251749, -0.5823666, 1, 1, 1, 1, 1,
1.697865, 1.67695, -0.1807383, 1, 1, 1, 1, 1,
1.706353, -1.221266, 3.783131, 1, 1, 1, 1, 1,
1.707509, -0.08239362, 1.654866, 1, 1, 1, 1, 1,
1.708666, -0.9911622, 2.999725, 1, 1, 1, 1, 1,
1.709132, -0.4578382, 1.732501, 1, 1, 1, 1, 1,
1.71018, 1.603737, 0.2337245, 1, 1, 1, 1, 1,
1.71162, -0.796419, 1.125985, 1, 1, 1, 1, 1,
1.715742, -1.406345, 1.762939, 1, 1, 1, 1, 1,
1.718227, 1.57784, -0.2727246, 1, 1, 1, 1, 1,
1.730859, 0.2230167, -1.321178, 1, 1, 1, 1, 1,
1.747681, -2.639992, 2.833502, 0, 0, 1, 1, 1,
1.748674, 1.497241, -2.626259, 1, 0, 0, 1, 1,
1.751435, 0.9464863, 1.848633, 1, 0, 0, 1, 1,
1.765186, -2.038058, 1.79937, 1, 0, 0, 1, 1,
1.770728, -1.319233, 2.690737, 1, 0, 0, 1, 1,
1.77239, 0.00544023, 0.79625, 1, 0, 0, 1, 1,
1.792555, -0.3889806, 0.726102, 0, 0, 0, 1, 1,
1.829179, 0.07023798, 2.18606, 0, 0, 0, 1, 1,
1.842106, 0.4963332, 1.163295, 0, 0, 0, 1, 1,
1.844634, 1.163352, 2.528496, 0, 0, 0, 1, 1,
1.848212, 1.822781, 1.493356, 0, 0, 0, 1, 1,
1.884791, -0.265071, 3.450092, 0, 0, 0, 1, 1,
1.894981, 1.937513, 1.269377, 0, 0, 0, 1, 1,
1.900628, 0.6001869, 2.427692, 1, 1, 1, 1, 1,
1.912299, 0.3610494, 1.719242, 1, 1, 1, 1, 1,
1.914268, 0.7931259, 1.690258, 1, 1, 1, 1, 1,
1.916524, -0.4630569, 1.537929, 1, 1, 1, 1, 1,
1.965206, -1.384576, 0.08644272, 1, 1, 1, 1, 1,
1.997934, -0.524627, 2.340242, 1, 1, 1, 1, 1,
2.02211, 0.2949471, 3.262348, 1, 1, 1, 1, 1,
2.026188, -1.431777, 2.185461, 1, 1, 1, 1, 1,
2.040014, -0.9374196, 1.605229, 1, 1, 1, 1, 1,
2.104126, 1.984533, 1.849933, 1, 1, 1, 1, 1,
2.12302, 0.641564, 1.668632, 1, 1, 1, 1, 1,
2.129958, 0.8178961, 2.062879, 1, 1, 1, 1, 1,
2.15204, 0.6282625, 1.269568, 1, 1, 1, 1, 1,
2.186768, -0.5566002, 2.452169, 1, 1, 1, 1, 1,
2.20477, -0.8148524, 2.406476, 1, 1, 1, 1, 1,
2.241573, -1.159587, 3.618008, 0, 0, 1, 1, 1,
2.277112, -0.3770117, 0.7783958, 1, 0, 0, 1, 1,
2.296825, -0.6108531, 1.641814, 1, 0, 0, 1, 1,
2.308574, 1.467139, 1.489177, 1, 0, 0, 1, 1,
2.335634, -0.4264272, 3.149156, 1, 0, 0, 1, 1,
2.356234, 0.6274844, -0.1512543, 1, 0, 0, 1, 1,
2.361191, 0.239381, 1.359845, 0, 0, 0, 1, 1,
2.400863, -1.245055, 1.069285, 0, 0, 0, 1, 1,
2.438615, 1.661612, 0.9754322, 0, 0, 0, 1, 1,
2.45207, -0.747357, 2.136926, 0, 0, 0, 1, 1,
2.475284, -0.4274206, 2.526193, 0, 0, 0, 1, 1,
2.498911, -0.2384277, 2.173082, 0, 0, 0, 1, 1,
2.506251, 0.09221879, 0.6207106, 0, 0, 0, 1, 1,
2.51112, 1.391133, 1.086912, 1, 1, 1, 1, 1,
2.512531, -0.2331893, 1.798086, 1, 1, 1, 1, 1,
2.577547, 1.006144, 0.3345457, 1, 1, 1, 1, 1,
2.692355, -0.8896805, 2.004135, 1, 1, 1, 1, 1,
2.734112, 1.315637, 1.6384, 1, 1, 1, 1, 1,
2.961656, -0.5491128, 2.013694, 1, 1, 1, 1, 1,
2.962453, -1.408049, 0.4585762, 1, 1, 1, 1, 1
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
var radius = 9.61419;
var distance = 33.76943;
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
mvMatrix.translate( 0.07933331, 0.1019194, -0.2892363 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76943);
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
