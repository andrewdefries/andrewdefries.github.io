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
-2.998016, 1.394741, -1.341963, 1, 0, 0, 1,
-2.79903, -0.327131, -2.898629, 1, 0.007843138, 0, 1,
-2.770711, 0.4642438, -0.2950708, 1, 0.01176471, 0, 1,
-2.649202, -1.039695, -1.197106, 1, 0.01960784, 0, 1,
-2.645, 1.813277, -1.931256, 1, 0.02352941, 0, 1,
-2.559412, 0.1525114, -1.336631, 1, 0.03137255, 0, 1,
-2.55053, 0.6995414, -1.195411, 1, 0.03529412, 0, 1,
-2.406048, 1.3969, -0.5792993, 1, 0.04313726, 0, 1,
-2.356703, -0.09438889, -3.576691, 1, 0.04705882, 0, 1,
-2.341283, 1.364905, -0.3953508, 1, 0.05490196, 0, 1,
-2.300956, -1.163777, -2.52477, 1, 0.05882353, 0, 1,
-2.235252, -0.3684453, -0.5777403, 1, 0.06666667, 0, 1,
-2.22022, 0.09068112, 0.6042277, 1, 0.07058824, 0, 1,
-2.191913, -0.274222, 0.1112542, 1, 0.07843138, 0, 1,
-2.158645, -1.085152, -2.463319, 1, 0.08235294, 0, 1,
-2.158257, 0.2406123, -1.902909, 1, 0.09019608, 0, 1,
-2.151565, -1.35391, 0.2654558, 1, 0.09411765, 0, 1,
-2.136824, -0.2844342, -1.717325, 1, 0.1019608, 0, 1,
-2.12125, -1.409812, -3.282861, 1, 0.1098039, 0, 1,
-2.119019, 0.12888, -0.8578754, 1, 0.1137255, 0, 1,
-2.110907, 0.4974787, -2.646105, 1, 0.1215686, 0, 1,
-2.107083, -0.7161595, -2.436109, 1, 0.1254902, 0, 1,
-2.082904, 0.8058326, -0.86432, 1, 0.1333333, 0, 1,
-2.017122, -0.3340917, -1.280895, 1, 0.1372549, 0, 1,
-1.968163, 0.7237651, -1.022, 1, 0.145098, 0, 1,
-1.960795, 0.4952499, 0.2240471, 1, 0.1490196, 0, 1,
-1.951225, 1.108456, -0.5575519, 1, 0.1568628, 0, 1,
-1.942105, -2.20657, -2.389021, 1, 0.1607843, 0, 1,
-1.906278, -1.356818, -1.977361, 1, 0.1686275, 0, 1,
-1.881857, 0.6846873, -1.172895, 1, 0.172549, 0, 1,
-1.879415, -0.7165818, 0.1721604, 1, 0.1803922, 0, 1,
-1.873884, 1.571108, -0.7895608, 1, 0.1843137, 0, 1,
-1.869717, 0.4215333, -2.615506, 1, 0.1921569, 0, 1,
-1.852178, 0.7018279, -1.673904, 1, 0.1960784, 0, 1,
-1.852168, -0.00555364, -1.659023, 1, 0.2039216, 0, 1,
-1.85048, 0.9340263, -0.25067, 1, 0.2117647, 0, 1,
-1.841067, -0.6136212, -2.217703, 1, 0.2156863, 0, 1,
-1.840316, 0.9004133, -0.00958009, 1, 0.2235294, 0, 1,
-1.835572, 0.2131676, -2.323263, 1, 0.227451, 0, 1,
-1.83535, -0.5811547, -0.4859519, 1, 0.2352941, 0, 1,
-1.767323, -0.107468, -0.7415056, 1, 0.2392157, 0, 1,
-1.759698, -0.8023531, -2.019198, 1, 0.2470588, 0, 1,
-1.703525, 0.734116, -2.324226, 1, 0.2509804, 0, 1,
-1.687755, 0.9241713, -1.539858, 1, 0.2588235, 0, 1,
-1.682322, 1.992258, -1.693782, 1, 0.2627451, 0, 1,
-1.661367, 0.05109747, -2.101625, 1, 0.2705882, 0, 1,
-1.652348, 0.4855487, -0.2265744, 1, 0.2745098, 0, 1,
-1.651742, 0.08182305, -1.39515, 1, 0.282353, 0, 1,
-1.644293, -0.7244542, -3.564764, 1, 0.2862745, 0, 1,
-1.610201, -1.057116, -1.724221, 1, 0.2941177, 0, 1,
-1.596614, 1.851038, -2.250619, 1, 0.3019608, 0, 1,
-1.572902, -0.4196551, -2.470745, 1, 0.3058824, 0, 1,
-1.558357, -0.1900441, -2.45767, 1, 0.3137255, 0, 1,
-1.537155, -1.049322, -3.240258, 1, 0.3176471, 0, 1,
-1.535318, -0.8891103, -2.550342, 1, 0.3254902, 0, 1,
-1.527131, 0.2459835, -0.605175, 1, 0.3294118, 0, 1,
-1.523189, -0.9208301, -2.76352, 1, 0.3372549, 0, 1,
-1.522129, -0.7191476, -1.141284, 1, 0.3411765, 0, 1,
-1.517301, -0.3100496, -0.5939228, 1, 0.3490196, 0, 1,
-1.511654, -0.8560445, -5.857108, 1, 0.3529412, 0, 1,
-1.494265, -0.4665889, -4.144688, 1, 0.3607843, 0, 1,
-1.491878, -0.2234104, -1.884907, 1, 0.3647059, 0, 1,
-1.477652, 0.2292284, -1.278374, 1, 0.372549, 0, 1,
-1.45847, 0.4262265, -1.744518, 1, 0.3764706, 0, 1,
-1.457214, 0.2826543, -1.899692, 1, 0.3843137, 0, 1,
-1.457049, -0.9799339, -0.04302888, 1, 0.3882353, 0, 1,
-1.43946, 1.254622, 0.8688791, 1, 0.3960784, 0, 1,
-1.43617, -1.481058, -2.759049, 1, 0.4039216, 0, 1,
-1.42777, 1.609967, -0.7830052, 1, 0.4078431, 0, 1,
-1.423843, -0.1178581, -1.297613, 1, 0.4156863, 0, 1,
-1.40587, 0.4076796, -0.5673637, 1, 0.4196078, 0, 1,
-1.392723, 0.5269584, 1.144171, 1, 0.427451, 0, 1,
-1.389982, -0.9837397, -1.499849, 1, 0.4313726, 0, 1,
-1.389099, -0.8695183, -0.9640765, 1, 0.4392157, 0, 1,
-1.378702, -1.528753, -1.792849, 1, 0.4431373, 0, 1,
-1.365868, 0.4437805, -0.960057, 1, 0.4509804, 0, 1,
-1.361304, -0.9860064, -3.515683, 1, 0.454902, 0, 1,
-1.351918, 0.313219, -0.6668584, 1, 0.4627451, 0, 1,
-1.337351, -0.1573754, -0.1877917, 1, 0.4666667, 0, 1,
-1.335763, 1.673186, -2.583619, 1, 0.4745098, 0, 1,
-1.322393, -1.159168, -2.609773, 1, 0.4784314, 0, 1,
-1.314093, 0.3880865, -1.005778, 1, 0.4862745, 0, 1,
-1.313091, -1.147204, -2.981829, 1, 0.4901961, 0, 1,
-1.31079, -0.6196673, -0.9883192, 1, 0.4980392, 0, 1,
-1.304454, 1.37, 0.7426995, 1, 0.5058824, 0, 1,
-1.301811, 0.3854034, -0.8021424, 1, 0.509804, 0, 1,
-1.29935, 1.513845, -1.797396, 1, 0.5176471, 0, 1,
-1.296241, 1.205613, -1.295945, 1, 0.5215687, 0, 1,
-1.291427, -1.143252, -1.549746, 1, 0.5294118, 0, 1,
-1.288088, -0.7778771, -2.56357, 1, 0.5333334, 0, 1,
-1.280379, -0.05880597, 0.06120229, 1, 0.5411765, 0, 1,
-1.279693, -0.6998005, -0.6286452, 1, 0.5450981, 0, 1,
-1.277593, -0.3803697, -1.553915, 1, 0.5529412, 0, 1,
-1.276679, -0.9412762, -3.179745, 1, 0.5568628, 0, 1,
-1.268619, 0.6405255, -2.18775, 1, 0.5647059, 0, 1,
-1.260855, 0.255569, -1.004844, 1, 0.5686275, 0, 1,
-1.250117, -0.5296948, -2.418956, 1, 0.5764706, 0, 1,
-1.247752, 2.125382, -0.1229972, 1, 0.5803922, 0, 1,
-1.246692, 1.801375, -0.519595, 1, 0.5882353, 0, 1,
-1.237908, -0.1350267, -2.004603, 1, 0.5921569, 0, 1,
-1.235727, -0.3769943, -3.619948, 1, 0.6, 0, 1,
-1.227249, -0.6215515, -1.157149, 1, 0.6078432, 0, 1,
-1.225403, 0.3548964, -1.954446, 1, 0.6117647, 0, 1,
-1.221194, 1.624732, -1.695349, 1, 0.6196079, 0, 1,
-1.217647, 0.09043693, 0.5064997, 1, 0.6235294, 0, 1,
-1.211258, -0.0631292, -1.366653, 1, 0.6313726, 0, 1,
-1.20448, -0.703948, -0.9754151, 1, 0.6352941, 0, 1,
-1.203563, 0.4989971, -2.27445, 1, 0.6431373, 0, 1,
-1.203517, 1.780333, -2.032329, 1, 0.6470588, 0, 1,
-1.197448, 0.6917727, -1.647355, 1, 0.654902, 0, 1,
-1.186718, -1.686038, -3.903293, 1, 0.6588235, 0, 1,
-1.183864, 1.027414, 0.3063498, 1, 0.6666667, 0, 1,
-1.181502, -0.8936012, -0.8045737, 1, 0.6705883, 0, 1,
-1.180522, -1.041919, -2.961581, 1, 0.6784314, 0, 1,
-1.171479, -0.689344, -3.316155, 1, 0.682353, 0, 1,
-1.169747, -0.9210883, -2.342178, 1, 0.6901961, 0, 1,
-1.167104, -1.247852, -5.441455, 1, 0.6941177, 0, 1,
-1.16518, 1.232462, -1.647047, 1, 0.7019608, 0, 1,
-1.16286, -0.2852419, -2.038187, 1, 0.7098039, 0, 1,
-1.157748, -1.271484, -3.192556, 1, 0.7137255, 0, 1,
-1.155618, -0.0753335, -0.7187196, 1, 0.7215686, 0, 1,
-1.152462, 1.182589, -1.565646, 1, 0.7254902, 0, 1,
-1.140286, -0.6245359, -3.200973, 1, 0.7333333, 0, 1,
-1.130368, -0.6907005, -3.355273, 1, 0.7372549, 0, 1,
-1.124985, 1.197943, -1.165885, 1, 0.7450981, 0, 1,
-1.123514, 0.03372068, -0.8902809, 1, 0.7490196, 0, 1,
-1.122299, 0.4395521, -0.3197905, 1, 0.7568628, 0, 1,
-1.119474, -0.9584237, -3.259887, 1, 0.7607843, 0, 1,
-1.111137, 1.947128, 0.6948197, 1, 0.7686275, 0, 1,
-1.110633, 0.4465905, -0.7366453, 1, 0.772549, 0, 1,
-1.094445, -1.627716, -3.282523, 1, 0.7803922, 0, 1,
-1.092728, 1.423234, -1.704532, 1, 0.7843137, 0, 1,
-1.091112, 2.352153, 0.2250212, 1, 0.7921569, 0, 1,
-1.083758, 1.506546, -1.276569, 1, 0.7960784, 0, 1,
-1.08259, 0.4097262, -1.129311, 1, 0.8039216, 0, 1,
-1.080334, 1.74457, -0.5072219, 1, 0.8117647, 0, 1,
-1.07669, 0.9819545, -0.5125676, 1, 0.8156863, 0, 1,
-1.075826, 0.4374892, -0.002336129, 1, 0.8235294, 0, 1,
-1.07116, -1.351141, -3.352971, 1, 0.827451, 0, 1,
-1.070724, 1.421579, -1.016879, 1, 0.8352941, 0, 1,
-1.068137, 0.6181356, -0.9450792, 1, 0.8392157, 0, 1,
-1.065218, -0.3954979, -3.123875, 1, 0.8470588, 0, 1,
-1.064126, -1.28399, -1.86634, 1, 0.8509804, 0, 1,
-1.054767, 0.1616621, -2.147835, 1, 0.8588235, 0, 1,
-1.054416, -1.038691, -1.764077, 1, 0.8627451, 0, 1,
-1.044266, 0.159622, -3.058775, 1, 0.8705882, 0, 1,
-1.044078, 0.9014859, -1.189117, 1, 0.8745098, 0, 1,
-1.037093, 0.864091, 0.02726298, 1, 0.8823529, 0, 1,
-1.035667, 0.7545235, -1.298481, 1, 0.8862745, 0, 1,
-1.019412, 1.781911, -0.3492032, 1, 0.8941177, 0, 1,
-1.010514, 1.725872, 0.1495159, 1, 0.8980392, 0, 1,
-1.008888, 0.2846047, -1.305198, 1, 0.9058824, 0, 1,
-1.005414, 0.2170856, -1.043671, 1, 0.9137255, 0, 1,
-0.9985556, 0.1931774, 0.2072383, 1, 0.9176471, 0, 1,
-0.9960867, 0.7018473, -0.7595285, 1, 0.9254902, 0, 1,
-0.9950954, 2.720315, 1.289725, 1, 0.9294118, 0, 1,
-0.9938167, -0.1376906, -2.011912, 1, 0.9372549, 0, 1,
-0.9897915, -1.05979, -4.062783, 1, 0.9411765, 0, 1,
-0.9873247, -1.050489, -1.683266, 1, 0.9490196, 0, 1,
-0.9869708, -1.647094, -3.494545, 1, 0.9529412, 0, 1,
-0.9861082, 0.05356288, -2.455732, 1, 0.9607843, 0, 1,
-0.9822718, 0.1541302, -1.023726, 1, 0.9647059, 0, 1,
-0.9791778, 1.156861, -0.5141284, 1, 0.972549, 0, 1,
-0.9767038, 0.3492166, -2.130387, 1, 0.9764706, 0, 1,
-0.9745363, -0.8280303, -1.778292, 1, 0.9843137, 0, 1,
-0.9719182, -0.7331986, -2.070091, 1, 0.9882353, 0, 1,
-0.9625614, -0.1471888, -0.4178251, 1, 0.9960784, 0, 1,
-0.9576684, 0.8970968, -2.309378, 0.9960784, 1, 0, 1,
-0.9576154, -1.579951, -3.89187, 0.9921569, 1, 0, 1,
-0.956999, -1.104413, -1.66315, 0.9843137, 1, 0, 1,
-0.9531196, -1.2492, -0.9605077, 0.9803922, 1, 0, 1,
-0.9527277, -0.4718589, -3.143629, 0.972549, 1, 0, 1,
-0.9502007, 0.1948581, -1.878884, 0.9686275, 1, 0, 1,
-0.9458699, 0.1363962, -1.929493, 0.9607843, 1, 0, 1,
-0.9431743, -0.5137991, -2.358684, 0.9568627, 1, 0, 1,
-0.9419521, 1.129575, 0.01491599, 0.9490196, 1, 0, 1,
-0.9309751, 1.472967, 0.2969749, 0.945098, 1, 0, 1,
-0.9219227, -1.944729, -3.074897, 0.9372549, 1, 0, 1,
-0.9218937, -0.1177335, -1.683749, 0.9333333, 1, 0, 1,
-0.9200698, 0.9636335, 0.4167913, 0.9254902, 1, 0, 1,
-0.9106876, 1.529675, -1.609974, 0.9215686, 1, 0, 1,
-0.9081134, 0.7978736, -0.7998313, 0.9137255, 1, 0, 1,
-0.9027023, 0.8444668, -1.278509, 0.9098039, 1, 0, 1,
-0.897641, -0.5597125, -3.723164, 0.9019608, 1, 0, 1,
-0.8881823, -1.071756, -2.537525, 0.8941177, 1, 0, 1,
-0.8879643, -0.971706, -1.441238, 0.8901961, 1, 0, 1,
-0.8856494, -1.253488, -0.842461, 0.8823529, 1, 0, 1,
-0.865901, 0.555792, -1.931033, 0.8784314, 1, 0, 1,
-0.8616624, 0.7994247, -0.5235877, 0.8705882, 1, 0, 1,
-0.8610377, -1.382929, -1.704177, 0.8666667, 1, 0, 1,
-0.8582712, 1.869764, 0.4882086, 0.8588235, 1, 0, 1,
-0.8528395, 1.046905, -1.933428, 0.854902, 1, 0, 1,
-0.8461401, 1.867294, -0.1615074, 0.8470588, 1, 0, 1,
-0.8421144, 1.101257, 0.1496235, 0.8431373, 1, 0, 1,
-0.8401228, -0.1935463, -0.5224194, 0.8352941, 1, 0, 1,
-0.8385856, 0.03886417, -0.2197625, 0.8313726, 1, 0, 1,
-0.8353034, -1.044994, -2.068118, 0.8235294, 1, 0, 1,
-0.8312634, 0.5265252, -0.8757052, 0.8196079, 1, 0, 1,
-0.8285868, 0.5012155, -2.854188, 0.8117647, 1, 0, 1,
-0.8197904, 1.51945, -2.592439, 0.8078431, 1, 0, 1,
-0.8149, 0.6477088, 1.614169, 0.8, 1, 0, 1,
-0.8145198, 1.597458, -1.958599, 0.7921569, 1, 0, 1,
-0.8131756, -2.033613, -1.965216, 0.7882353, 1, 0, 1,
-0.7968189, 0.01643899, -1.395911, 0.7803922, 1, 0, 1,
-0.7953141, -2.260721, -1.828339, 0.7764706, 1, 0, 1,
-0.7921879, 0.6832126, 0.417542, 0.7686275, 1, 0, 1,
-0.7917894, 0.2901387, -0.5475668, 0.7647059, 1, 0, 1,
-0.7908054, -0.6672097, -2.965204, 0.7568628, 1, 0, 1,
-0.7900965, -0.503741, -2.103742, 0.7529412, 1, 0, 1,
-0.7864169, 1.238088, -1.037473, 0.7450981, 1, 0, 1,
-0.783232, 0.3720871, -0.7487738, 0.7411765, 1, 0, 1,
-0.7826904, -0.5772862, -1.291798, 0.7333333, 1, 0, 1,
-0.778865, 1.768491, 0.255669, 0.7294118, 1, 0, 1,
-0.7702589, 1.336554, -1.351108, 0.7215686, 1, 0, 1,
-0.7569359, 1.241762, 0.8159951, 0.7176471, 1, 0, 1,
-0.7204497, -0.1014831, -0.5964335, 0.7098039, 1, 0, 1,
-0.7200545, 1.244501, -1.80291, 0.7058824, 1, 0, 1,
-0.7154843, -2.164413, -3.937904, 0.6980392, 1, 0, 1,
-0.7148025, 0.7294267, -0.5472177, 0.6901961, 1, 0, 1,
-0.709148, 1.22165, -1.657301, 0.6862745, 1, 0, 1,
-0.7063283, 0.6653194, -2.336163, 0.6784314, 1, 0, 1,
-0.7051244, 0.4824871, 0.3934748, 0.6745098, 1, 0, 1,
-0.6972886, -0.3364471, -1.227501, 0.6666667, 1, 0, 1,
-0.6961076, 0.4292046, -0.7546219, 0.6627451, 1, 0, 1,
-0.6888844, 1.311585, -1.914077, 0.654902, 1, 0, 1,
-0.6854373, -0.5410312, -2.326267, 0.6509804, 1, 0, 1,
-0.6843652, 0.3141861, -1.018383, 0.6431373, 1, 0, 1,
-0.6806566, -0.02064429, -1.914035, 0.6392157, 1, 0, 1,
-0.6752104, -0.06320221, -0.219398, 0.6313726, 1, 0, 1,
-0.6752096, 0.1383336, -1.382535, 0.627451, 1, 0, 1,
-0.6677297, 1.212059, -0.3603436, 0.6196079, 1, 0, 1,
-0.667358, 1.865559, -1.120361, 0.6156863, 1, 0, 1,
-0.6645081, -2.483572, -2.787787, 0.6078432, 1, 0, 1,
-0.6598973, 1.002901, -0.307655, 0.6039216, 1, 0, 1,
-0.6596991, 1.575798, -0.5665883, 0.5960785, 1, 0, 1,
-0.6563714, -1.251521, -2.681448, 0.5882353, 1, 0, 1,
-0.6545143, -0.5334921, -2.792069, 0.5843138, 1, 0, 1,
-0.6531659, -0.1648185, -1.947454, 0.5764706, 1, 0, 1,
-0.6514463, -1.173209, -1.809692, 0.572549, 1, 0, 1,
-0.6503997, -1.098511, -3.363487, 0.5647059, 1, 0, 1,
-0.6465682, -2.652332, -2.225181, 0.5607843, 1, 0, 1,
-0.6432678, -0.5479358, -0.801483, 0.5529412, 1, 0, 1,
-0.6424699, 1.534198, -3.188347, 0.5490196, 1, 0, 1,
-0.6361985, 1.473776, -0.332961, 0.5411765, 1, 0, 1,
-0.6330338, 0.3046881, -0.9921653, 0.5372549, 1, 0, 1,
-0.6298953, -0.8764526, -5.56314, 0.5294118, 1, 0, 1,
-0.6271463, -0.4251198, -1.222563, 0.5254902, 1, 0, 1,
-0.6230803, -0.5668515, -1.593725, 0.5176471, 1, 0, 1,
-0.6189482, -0.1381792, -1.289741, 0.5137255, 1, 0, 1,
-0.6185945, -0.2665941, -3.602662, 0.5058824, 1, 0, 1,
-0.6145061, -1.924382, -2.67156, 0.5019608, 1, 0, 1,
-0.6001619, -1.109348, -1.416962, 0.4941176, 1, 0, 1,
-0.5988301, -1.253832, -2.445595, 0.4862745, 1, 0, 1,
-0.5953202, 0.4627659, 1.478156, 0.4823529, 1, 0, 1,
-0.5947336, -1.155748, -2.090037, 0.4745098, 1, 0, 1,
-0.5929183, 0.9262061, -1.904546, 0.4705882, 1, 0, 1,
-0.5886923, -0.5408156, 0.1400577, 0.4627451, 1, 0, 1,
-0.5881288, 1.841586, -1.355699, 0.4588235, 1, 0, 1,
-0.5873325, 0.3398975, -0.2609108, 0.4509804, 1, 0, 1,
-0.5828869, -0.783255, -2.805004, 0.4470588, 1, 0, 1,
-0.5814644, 0.08055987, -0.5977049, 0.4392157, 1, 0, 1,
-0.5806237, -0.564781, -1.991974, 0.4352941, 1, 0, 1,
-0.5772153, -1.422962, -1.763043, 0.427451, 1, 0, 1,
-0.5759271, 0.4223973, -0.3580684, 0.4235294, 1, 0, 1,
-0.5701563, 1.101656, -3.817867, 0.4156863, 1, 0, 1,
-0.5674032, 0.7661101, -0.4330804, 0.4117647, 1, 0, 1,
-0.5633156, 1.485217, -0.9190423, 0.4039216, 1, 0, 1,
-0.5569999, 0.8566361, -0.8237116, 0.3960784, 1, 0, 1,
-0.556662, 0.3080754, -4.075151, 0.3921569, 1, 0, 1,
-0.5547478, 0.9517815, -1.469019, 0.3843137, 1, 0, 1,
-0.5535186, 0.7446167, 1.098155, 0.3803922, 1, 0, 1,
-0.5469952, -0.1025473, -1.848387, 0.372549, 1, 0, 1,
-0.5456914, -0.8342503, -1.574809, 0.3686275, 1, 0, 1,
-0.5432903, -0.002195438, -0.106996, 0.3607843, 1, 0, 1,
-0.5378276, 0.3441663, -1.46831, 0.3568628, 1, 0, 1,
-0.5362325, 1.558372, -1.615372, 0.3490196, 1, 0, 1,
-0.5362013, 1.444575, -0.2474551, 0.345098, 1, 0, 1,
-0.5322101, -0.5449623, -3.173424, 0.3372549, 1, 0, 1,
-0.5310603, 0.8304046, -0.4362909, 0.3333333, 1, 0, 1,
-0.5275449, 1.170345, -1.041116, 0.3254902, 1, 0, 1,
-0.5129734, -1.912663, -3.988765, 0.3215686, 1, 0, 1,
-0.5089694, -0.9243247, -0.5501919, 0.3137255, 1, 0, 1,
-0.4957761, -0.5082237, -2.631848, 0.3098039, 1, 0, 1,
-0.4919478, -0.2321275, -0.9181825, 0.3019608, 1, 0, 1,
-0.4894835, 2.732024, -0.9680806, 0.2941177, 1, 0, 1,
-0.4878801, 0.256728, -0.9730807, 0.2901961, 1, 0, 1,
-0.4866075, 1.371214, -0.3679569, 0.282353, 1, 0, 1,
-0.4853017, -0.52719, -3.043862, 0.2784314, 1, 0, 1,
-0.483873, -1.533013, -3.547948, 0.2705882, 1, 0, 1,
-0.48079, -0.5062139, -0.893503, 0.2666667, 1, 0, 1,
-0.4800411, -0.2197694, -2.45389, 0.2588235, 1, 0, 1,
-0.4775368, 0.7138997, -3.328511, 0.254902, 1, 0, 1,
-0.4707, 0.04974108, -0.9970748, 0.2470588, 1, 0, 1,
-0.4692849, 0.2196253, -2.750621, 0.2431373, 1, 0, 1,
-0.4691235, -1.37609, -1.160346, 0.2352941, 1, 0, 1,
-0.4685901, -1.091051, -0.9532288, 0.2313726, 1, 0, 1,
-0.4664394, 0.4549876, -2.150201, 0.2235294, 1, 0, 1,
-0.465912, 1.044947, -2.259123, 0.2196078, 1, 0, 1,
-0.4584273, 0.7631544, 1.234195, 0.2117647, 1, 0, 1,
-0.4576986, -0.7410971, -2.323655, 0.2078431, 1, 0, 1,
-0.4565825, -0.1769532, -1.820034, 0.2, 1, 0, 1,
-0.4560045, -0.01999381, -0.6768898, 0.1921569, 1, 0, 1,
-0.4506578, 1.263006, 0.8087903, 0.1882353, 1, 0, 1,
-0.4503364, 0.5679464, -1.519464, 0.1803922, 1, 0, 1,
-0.4493843, 0.03678196, -0.8136421, 0.1764706, 1, 0, 1,
-0.4492691, -0.1390521, -1.92335, 0.1686275, 1, 0, 1,
-0.4483518, 0.6304295, -0.130375, 0.1647059, 1, 0, 1,
-0.4481977, 0.7831383, -1.236559, 0.1568628, 1, 0, 1,
-0.4455122, -0.2409781, -1.882278, 0.1529412, 1, 0, 1,
-0.4448328, -0.115736, -2.443445, 0.145098, 1, 0, 1,
-0.4432935, -0.1903272, -1.728154, 0.1411765, 1, 0, 1,
-0.4420278, -1.177151, -3.857011, 0.1333333, 1, 0, 1,
-0.4411846, -0.3128448, -0.410788, 0.1294118, 1, 0, 1,
-0.4407862, 0.483433, -0.5424682, 0.1215686, 1, 0, 1,
-0.4349347, 0.7053172, 0.534707, 0.1176471, 1, 0, 1,
-0.4344103, -0.7059912, -1.555127, 0.1098039, 1, 0, 1,
-0.4279602, 0.7191737, 0.3398737, 0.1058824, 1, 0, 1,
-0.4251144, -0.04899336, -0.6213716, 0.09803922, 1, 0, 1,
-0.4250709, 0.8943388, -1.368445, 0.09019608, 1, 0, 1,
-0.4218647, -0.7013817, -1.160894, 0.08627451, 1, 0, 1,
-0.4201366, -0.5140505, -1.037485, 0.07843138, 1, 0, 1,
-0.4192143, -1.182277, -2.227308, 0.07450981, 1, 0, 1,
-0.4186449, 0.5630016, -1.114333, 0.06666667, 1, 0, 1,
-0.4156368, -0.5033447, -2.459193, 0.0627451, 1, 0, 1,
-0.4155528, 0.02821835, -1.696458, 0.05490196, 1, 0, 1,
-0.4139292, 1.647224, -0.3410693, 0.05098039, 1, 0, 1,
-0.4135213, -1.382877, -2.625333, 0.04313726, 1, 0, 1,
-0.4115352, -0.6923712, -2.272557, 0.03921569, 1, 0, 1,
-0.4112883, 1.45156, 0.1456759, 0.03137255, 1, 0, 1,
-0.4106489, -0.2779282, -5.092069, 0.02745098, 1, 0, 1,
-0.4099813, 0.6996695, 0.2906072, 0.01960784, 1, 0, 1,
-0.4086816, -0.7430672, -1.916464, 0.01568628, 1, 0, 1,
-0.4038502, -0.6018618, -2.4598, 0.007843138, 1, 0, 1,
-0.3991102, 1.188404, -0.3364741, 0.003921569, 1, 0, 1,
-0.3989713, 0.6129179, -0.4733262, 0, 1, 0.003921569, 1,
-0.3987284, -0.8170207, -1.23794, 0, 1, 0.01176471, 1,
-0.3896455, 0.1514732, -1.080555, 0, 1, 0.01568628, 1,
-0.3889355, 0.4560038, -2.989534, 0, 1, 0.02352941, 1,
-0.3871367, 0.9407473, -1.01882, 0, 1, 0.02745098, 1,
-0.3853676, 0.8880695, -1.864295, 0, 1, 0.03529412, 1,
-0.3853054, -1.178391, -2.922951, 0, 1, 0.03921569, 1,
-0.3822685, -0.05381527, -1.46745, 0, 1, 0.04705882, 1,
-0.3816767, 0.5010493, 1.406682, 0, 1, 0.05098039, 1,
-0.3809521, 2.056842, -2.961745, 0, 1, 0.05882353, 1,
-0.3757687, 0.9766021, -0.5592285, 0, 1, 0.0627451, 1,
-0.3746392, 0.07546059, -1.220097, 0, 1, 0.07058824, 1,
-0.3670703, 0.1173991, -0.4738437, 0, 1, 0.07450981, 1,
-0.3620061, -1.794823, -1.494037, 0, 1, 0.08235294, 1,
-0.3611716, 2.142365, 0.8861638, 0, 1, 0.08627451, 1,
-0.3576491, -1.314156, -2.328264, 0, 1, 0.09411765, 1,
-0.3574308, 0.719951, -1.17233, 0, 1, 0.1019608, 1,
-0.347522, 2.000693, 1.166564, 0, 1, 0.1058824, 1,
-0.3440622, 1.986741, -1.426956, 0, 1, 0.1137255, 1,
-0.3400861, 0.07702664, -1.626292, 0, 1, 0.1176471, 1,
-0.3312336, 0.3897595, 0.4797949, 0, 1, 0.1254902, 1,
-0.3232246, 0.9929393, -0.03703407, 0, 1, 0.1294118, 1,
-0.3224121, -0.5672422, -1.914176, 0, 1, 0.1372549, 1,
-0.319315, 0.9241388, -1.25065, 0, 1, 0.1411765, 1,
-0.3115545, 0.4171883, -1.293692, 0, 1, 0.1490196, 1,
-0.3097792, -1.554276, -2.550753, 0, 1, 0.1529412, 1,
-0.3066046, 0.7916474, -0.1455794, 0, 1, 0.1607843, 1,
-0.3062688, -2.411861, -4.037425, 0, 1, 0.1647059, 1,
-0.3055916, -0.01421236, -1.794716, 0, 1, 0.172549, 1,
-0.3039207, 1.048807, -0.5604444, 0, 1, 0.1764706, 1,
-0.2956079, -0.8916211, -1.066406, 0, 1, 0.1843137, 1,
-0.293184, -0.1924236, -1.961691, 0, 1, 0.1882353, 1,
-0.2912056, 0.9083591, 0.01937268, 0, 1, 0.1960784, 1,
-0.2841606, -1.056517, -3.891965, 0, 1, 0.2039216, 1,
-0.2831361, 1.403016, -0.9512786, 0, 1, 0.2078431, 1,
-0.2753944, -0.3042043, -1.692015, 0, 1, 0.2156863, 1,
-0.2737176, 0.7278745, -0.136748, 0, 1, 0.2196078, 1,
-0.2656634, 0.7474614, -1.520578, 0, 1, 0.227451, 1,
-0.2646729, 0.2779728, -0.9577906, 0, 1, 0.2313726, 1,
-0.2587556, 0.7950854, 2.717242, 0, 1, 0.2392157, 1,
-0.2560928, 0.7197188, 0.05202341, 0, 1, 0.2431373, 1,
-0.2548119, -0.8327774, -2.489981, 0, 1, 0.2509804, 1,
-0.2525828, -0.02765145, -0.6329548, 0, 1, 0.254902, 1,
-0.248961, -2.492931, -3.814612, 0, 1, 0.2627451, 1,
-0.2386719, 0.07292549, -1.100849, 0, 1, 0.2666667, 1,
-0.237596, 0.2143095, -2.186146, 0, 1, 0.2745098, 1,
-0.2260711, 1.775293, 0.955585, 0, 1, 0.2784314, 1,
-0.2207197, 0.8250005, -0.4602348, 0, 1, 0.2862745, 1,
-0.2162174, -0.1934078, -1.073704, 0, 1, 0.2901961, 1,
-0.2069856, -1.443642, -3.229134, 0, 1, 0.2980392, 1,
-0.1996052, 0.1367373, -0.9668218, 0, 1, 0.3058824, 1,
-0.1969171, 0.6086594, -0.73235, 0, 1, 0.3098039, 1,
-0.1963908, -1.848946, -1.701594, 0, 1, 0.3176471, 1,
-0.1916364, 0.6032165, -0.0781761, 0, 1, 0.3215686, 1,
-0.1824933, 0.6836622, -1.862214, 0, 1, 0.3294118, 1,
-0.1794496, 1.339616, 0.5366485, 0, 1, 0.3333333, 1,
-0.1791524, 1.238843, 0.4207771, 0, 1, 0.3411765, 1,
-0.1784133, 0.6765758, 0.3617583, 0, 1, 0.345098, 1,
-0.175385, -0.9375428, -3.783298, 0, 1, 0.3529412, 1,
-0.1751535, -2.27239, -2.81813, 0, 1, 0.3568628, 1,
-0.1746313, 0.06575481, 1.186602, 0, 1, 0.3647059, 1,
-0.1698006, 0.6090583, 0.9315854, 0, 1, 0.3686275, 1,
-0.1686875, 0.2035331, -0.5266665, 0, 1, 0.3764706, 1,
-0.1671198, -1.029487, -1.254887, 0, 1, 0.3803922, 1,
-0.1659594, 0.6837237, 0.3940678, 0, 1, 0.3882353, 1,
-0.1637082, -0.05493316, -2.07763, 0, 1, 0.3921569, 1,
-0.1630159, -0.01821239, -2.028746, 0, 1, 0.4, 1,
-0.1629233, 0.8915332, -0.8729042, 0, 1, 0.4078431, 1,
-0.1624759, -1.343083, -3.103621, 0, 1, 0.4117647, 1,
-0.1582944, -1.140244, -4.173202, 0, 1, 0.4196078, 1,
-0.1570941, 0.5771288, 0.1740399, 0, 1, 0.4235294, 1,
-0.1540412, -0.2248832, -2.317979, 0, 1, 0.4313726, 1,
-0.1520952, 2.611829, -1.527902, 0, 1, 0.4352941, 1,
-0.1469571, 1.287605, 0.4823939, 0, 1, 0.4431373, 1,
-0.1369798, 0.3296706, -1.187077, 0, 1, 0.4470588, 1,
-0.1350002, 2.227878, 0.07211813, 0, 1, 0.454902, 1,
-0.1348444, 0.6825107, -1.914383, 0, 1, 0.4588235, 1,
-0.1345665, -1.298759, -1.239439, 0, 1, 0.4666667, 1,
-0.1321275, 0.766178, 0.07913381, 0, 1, 0.4705882, 1,
-0.1319683, -1.498316, -4.184728, 0, 1, 0.4784314, 1,
-0.1301843, 0.9837871, 0.8333338, 0, 1, 0.4823529, 1,
-0.1300759, 2.672541, 0.2805983, 0, 1, 0.4901961, 1,
-0.1256203, 0.04027208, -0.3243587, 0, 1, 0.4941176, 1,
-0.122752, -1.115874, -3.807605, 0, 1, 0.5019608, 1,
-0.1188779, -0.7847905, -3.858171, 0, 1, 0.509804, 1,
-0.1114951, 0.1535764, -2.311162, 0, 1, 0.5137255, 1,
-0.1111012, 0.8786222, 0.6505971, 0, 1, 0.5215687, 1,
-0.1109922, -0.4301482, -3.640891, 0, 1, 0.5254902, 1,
-0.1095244, -1.021421, -0.7546442, 0, 1, 0.5333334, 1,
-0.1030868, 0.9783649, -2.075202, 0, 1, 0.5372549, 1,
-0.09621836, -2.296054, -2.85784, 0, 1, 0.5450981, 1,
-0.08991547, -0.2128307, -3.185098, 0, 1, 0.5490196, 1,
-0.08970957, -1.061509, -2.669061, 0, 1, 0.5568628, 1,
-0.08898374, 0.5156873, -0.494105, 0, 1, 0.5607843, 1,
-0.08704619, 0.6801995, 2.078783, 0, 1, 0.5686275, 1,
-0.08001509, -0.6636197, -2.780232, 0, 1, 0.572549, 1,
-0.07905907, 0.6390398, -0.3368882, 0, 1, 0.5803922, 1,
-0.07479072, -0.354902, -2.406455, 0, 1, 0.5843138, 1,
-0.07395156, -0.5311691, -2.017041, 0, 1, 0.5921569, 1,
-0.07286528, 0.3826657, -0.1313593, 0, 1, 0.5960785, 1,
-0.07210377, 0.1225938, 0.1360757, 0, 1, 0.6039216, 1,
-0.07069708, 0.117569, -1.348825, 0, 1, 0.6117647, 1,
-0.06751513, 1.039404, 0.4178039, 0, 1, 0.6156863, 1,
-0.0644954, -0.2866414, -2.714863, 0, 1, 0.6235294, 1,
-0.0595892, -1.238505, -4.421506, 0, 1, 0.627451, 1,
-0.05836719, 1.152365, -0.8226516, 0, 1, 0.6352941, 1,
-0.05745761, 0.6819224, -1.223295, 0, 1, 0.6392157, 1,
-0.05083565, 0.6561406, -1.910078, 0, 1, 0.6470588, 1,
-0.04906354, -1.947397, -3.526963, 0, 1, 0.6509804, 1,
-0.04700866, 0.5945681, -1.848732, 0, 1, 0.6588235, 1,
-0.046641, 0.4074033, -0.3808461, 0, 1, 0.6627451, 1,
-0.04615222, 0.4303456, -0.2828693, 0, 1, 0.6705883, 1,
-0.04336473, -0.9323608, -4.689999, 0, 1, 0.6745098, 1,
-0.04327821, 2.444105, 0.2554254, 0, 1, 0.682353, 1,
-0.04099505, 0.8859513, -0.1495795, 0, 1, 0.6862745, 1,
-0.04015191, 1.986036, -0.3803181, 0, 1, 0.6941177, 1,
-0.0399521, -0.5081757, -3.92039, 0, 1, 0.7019608, 1,
-0.03945548, -0.6459374, -3.800369, 0, 1, 0.7058824, 1,
-0.03327829, -0.08483522, -2.99653, 0, 1, 0.7137255, 1,
-0.02876799, -0.5202712, -2.674903, 0, 1, 0.7176471, 1,
-0.02664213, -0.3321062, -3.447013, 0, 1, 0.7254902, 1,
-0.02412224, -0.9044983, -3.972786, 0, 1, 0.7294118, 1,
-0.02045302, -1.569283, -3.363731, 0, 1, 0.7372549, 1,
-0.01820902, -0.1237748, -1.11042, 0, 1, 0.7411765, 1,
-0.01618152, 0.09160648, 0.07672565, 0, 1, 0.7490196, 1,
-0.01473609, 0.6542425, -0.2999652, 0, 1, 0.7529412, 1,
-0.01068824, -0.2621614, -5.090763, 0, 1, 0.7607843, 1,
-0.009029039, 0.6105004, -0.4462516, 0, 1, 0.7647059, 1,
-0.006249675, 2.162008, -3.027321, 0, 1, 0.772549, 1,
-0.004823969, -1.073856, -3.66396, 0, 1, 0.7764706, 1,
-0.001039861, -0.5911717, -3.749441, 0, 1, 0.7843137, 1,
-6.81953e-05, -0.4599056, -1.455461, 0, 1, 0.7882353, 1,
0.0004806279, -0.8268531, 2.218742, 0, 1, 0.7960784, 1,
0.001370404, 0.8421999, -0.7753912, 0, 1, 0.8039216, 1,
0.001894947, -0.3729861, 1.234535, 0, 1, 0.8078431, 1,
0.004701807, 0.1996388, -0.7148705, 0, 1, 0.8156863, 1,
0.005609055, 1.705762, 1.003724, 0, 1, 0.8196079, 1,
0.008843427, -0.48248, 2.512223, 0, 1, 0.827451, 1,
0.011897, -1.680206, 2.376375, 0, 1, 0.8313726, 1,
0.01601053, 0.5720785, -0.0505088, 0, 1, 0.8392157, 1,
0.01631283, 1.527252, 0.4142936, 0, 1, 0.8431373, 1,
0.01683998, -0.469816, 2.867798, 0, 1, 0.8509804, 1,
0.01703025, -0.4183157, 2.476833, 0, 1, 0.854902, 1,
0.02043092, -1.434143, 2.573584, 0, 1, 0.8627451, 1,
0.02084367, 0.4685748, -0.1825359, 0, 1, 0.8666667, 1,
0.02116234, -0.4529715, 2.113575, 0, 1, 0.8745098, 1,
0.02285351, 3.326389, 0.2941959, 0, 1, 0.8784314, 1,
0.02548856, -1.331379, 2.997815, 0, 1, 0.8862745, 1,
0.02714329, 1.425012, -0.2201939, 0, 1, 0.8901961, 1,
0.02808611, 0.6420433, -1.554289, 0, 1, 0.8980392, 1,
0.03601894, -0.5408598, 3.484465, 0, 1, 0.9058824, 1,
0.03791685, -0.4934751, 4.146574, 0, 1, 0.9098039, 1,
0.03966915, 0.4686976, -0.9607059, 0, 1, 0.9176471, 1,
0.04142748, -1.942847, 4.517789, 0, 1, 0.9215686, 1,
0.04532352, -0.2700469, 2.799432, 0, 1, 0.9294118, 1,
0.04692279, 0.395387, -0.2817513, 0, 1, 0.9333333, 1,
0.04994008, 1.174087, 0.7504997, 0, 1, 0.9411765, 1,
0.05947148, -0.8933663, 2.80073, 0, 1, 0.945098, 1,
0.05976734, 1.442351, 1.063295, 0, 1, 0.9529412, 1,
0.06360525, 1.530821, -0.1889606, 0, 1, 0.9568627, 1,
0.06735431, 0.7748697, -0.2981837, 0, 1, 0.9647059, 1,
0.06896414, -0.8286316, 1.910927, 0, 1, 0.9686275, 1,
0.0695236, -2.391738, 2.705986, 0, 1, 0.9764706, 1,
0.07169341, 0.6348972, -0.2824737, 0, 1, 0.9803922, 1,
0.07557948, -1.248683, 2.132985, 0, 1, 0.9882353, 1,
0.07566453, 1.777198, -0.506465, 0, 1, 0.9921569, 1,
0.07579409, -0.2405567, 2.285646, 0, 1, 1, 1,
0.07851851, -2.226388, 1.33045, 0, 0.9921569, 1, 1,
0.08083237, 0.4841859, 0.8388166, 0, 0.9882353, 1, 1,
0.08115189, -0.1842744, 2.215961, 0, 0.9803922, 1, 1,
0.08543759, 0.277974, 0.5352601, 0, 0.9764706, 1, 1,
0.0857345, -2.000865, 1.362324, 0, 0.9686275, 1, 1,
0.08791424, -0.7254155, 4.262839, 0, 0.9647059, 1, 1,
0.0889716, -0.2311281, 4.697057, 0, 0.9568627, 1, 1,
0.08905544, 0.1443937, 1.153207, 0, 0.9529412, 1, 1,
0.09099721, 0.6858242, -2.555153, 0, 0.945098, 1, 1,
0.09599019, 1.373858, -0.7511311, 0, 0.9411765, 1, 1,
0.1052392, -1.598082, 3.038985, 0, 0.9333333, 1, 1,
0.106225, 0.2563849, 2.23246, 0, 0.9294118, 1, 1,
0.1087861, -1.565244, 2.327726, 0, 0.9215686, 1, 1,
0.1152687, 1.976829, -0.2263395, 0, 0.9176471, 1, 1,
0.115327, -0.9625133, 4.51563, 0, 0.9098039, 1, 1,
0.1154737, 0.3682136, -1.502522, 0, 0.9058824, 1, 1,
0.1161444, -1.088682, 2.762971, 0, 0.8980392, 1, 1,
0.1186042, -0.4111277, 1.945899, 0, 0.8901961, 1, 1,
0.1226813, 0.1165233, 1.621936, 0, 0.8862745, 1, 1,
0.1240587, -1.302228, 1.987809, 0, 0.8784314, 1, 1,
0.1260868, -1.071021, 1.143605, 0, 0.8745098, 1, 1,
0.1267765, 0.5878338, 0.9110085, 0, 0.8666667, 1, 1,
0.1297079, -1.25159, 4.021175, 0, 0.8627451, 1, 1,
0.1350132, 0.1846385, 0.6104166, 0, 0.854902, 1, 1,
0.1367966, 0.7245405, 0.5612528, 0, 0.8509804, 1, 1,
0.1369781, 0.09050285, 1.009674, 0, 0.8431373, 1, 1,
0.1372759, -0.595619, 4.151416, 0, 0.8392157, 1, 1,
0.1418651, 1.87028, 1.3905, 0, 0.8313726, 1, 1,
0.1429034, 1.229147, 1.180467, 0, 0.827451, 1, 1,
0.1435865, -1.893723, 3.204363, 0, 0.8196079, 1, 1,
0.1479539, -1.367955, 3.852281, 0, 0.8156863, 1, 1,
0.148978, 0.1848814, -0.9462493, 0, 0.8078431, 1, 1,
0.1497181, 1.133357, -0.7406387, 0, 0.8039216, 1, 1,
0.1506517, -0.9938422, 2.742488, 0, 0.7960784, 1, 1,
0.1541207, -0.7831867, 1.760675, 0, 0.7882353, 1, 1,
0.1560298, 0.4173776, 0.456917, 0, 0.7843137, 1, 1,
0.1566165, -0.2183841, 1.799399, 0, 0.7764706, 1, 1,
0.1597024, 0.5588577, 0.4174524, 0, 0.772549, 1, 1,
0.1626873, 1.299567, -1.317205, 0, 0.7647059, 1, 1,
0.1648588, -2.016705, 2.355841, 0, 0.7607843, 1, 1,
0.1694034, 0.0690794, 2.835327, 0, 0.7529412, 1, 1,
0.169646, 0.8878886, -0.3252895, 0, 0.7490196, 1, 1,
0.1715258, 0.4491623, 1.764805, 0, 0.7411765, 1, 1,
0.172962, -1.099526, 3.322727, 0, 0.7372549, 1, 1,
0.1736238, -0.1492935, 3.422793, 0, 0.7294118, 1, 1,
0.1748204, 0.2482157, 1.986752, 0, 0.7254902, 1, 1,
0.1762349, -0.3808754, 2.920116, 0, 0.7176471, 1, 1,
0.1769888, 0.1031685, 0.06457608, 0, 0.7137255, 1, 1,
0.1810198, 1.020508, -0.2914243, 0, 0.7058824, 1, 1,
0.1825621, -0.0120667, -1.283244, 0, 0.6980392, 1, 1,
0.1856674, 0.6924441, -0.2799362, 0, 0.6941177, 1, 1,
0.1886743, -0.7174759, 2.155511, 0, 0.6862745, 1, 1,
0.1930041, -0.5396246, 3.399266, 0, 0.682353, 1, 1,
0.1951436, 0.6269417, 0.2404126, 0, 0.6745098, 1, 1,
0.1952167, 1.39961, 0.08337234, 0, 0.6705883, 1, 1,
0.1988225, -0.1169719, 0.8986937, 0, 0.6627451, 1, 1,
0.2040279, 1.005505, -0.8135342, 0, 0.6588235, 1, 1,
0.2044436, 0.1970626, -0.001053295, 0, 0.6509804, 1, 1,
0.212099, 0.7506689, 1.232241, 0, 0.6470588, 1, 1,
0.2128782, -0.2074626, 3.338274, 0, 0.6392157, 1, 1,
0.2148471, 0.3630395, -0.00855347, 0, 0.6352941, 1, 1,
0.2172455, 0.8028424, 0.6039921, 0, 0.627451, 1, 1,
0.2173844, -1.058654, 1.797897, 0, 0.6235294, 1, 1,
0.221883, 1.265182, 0.6307843, 0, 0.6156863, 1, 1,
0.2249725, -0.4763751, 2.155539, 0, 0.6117647, 1, 1,
0.2265983, 0.9050627, -0.4512977, 0, 0.6039216, 1, 1,
0.2266667, -0.8528203, 2.985809, 0, 0.5960785, 1, 1,
0.2299096, -1.499729, 4.027807, 0, 0.5921569, 1, 1,
0.2305046, 0.5941224, 1.553299, 0, 0.5843138, 1, 1,
0.2306356, 0.2138382, -1.612468, 0, 0.5803922, 1, 1,
0.2336099, 1.560255, 1.026315, 0, 0.572549, 1, 1,
0.234571, -0.2766811, 1.345823, 0, 0.5686275, 1, 1,
0.2380513, 0.443894, 1.617981, 0, 0.5607843, 1, 1,
0.2448463, 0.2945681, 0.1763079, 0, 0.5568628, 1, 1,
0.2498723, -0.672298, 2.077316, 0, 0.5490196, 1, 1,
0.2515558, 0.5558161, 0.4869972, 0, 0.5450981, 1, 1,
0.2565736, 0.559633, 1.16339, 0, 0.5372549, 1, 1,
0.2605281, -1.087865, 3.839099, 0, 0.5333334, 1, 1,
0.2637864, 0.2151472, 2.017717, 0, 0.5254902, 1, 1,
0.2651856, 0.6306781, 1.20828, 0, 0.5215687, 1, 1,
0.2674091, -1.003199, 2.771811, 0, 0.5137255, 1, 1,
0.2726435, 1.199756, -0.6940689, 0, 0.509804, 1, 1,
0.274511, 0.7814195, 0.1094808, 0, 0.5019608, 1, 1,
0.2747327, 0.818418, -0.7769527, 0, 0.4941176, 1, 1,
0.2768301, -1.124362, 2.823545, 0, 0.4901961, 1, 1,
0.2777044, 2.255246, -0.4931977, 0, 0.4823529, 1, 1,
0.2792458, -0.599198, 2.756437, 0, 0.4784314, 1, 1,
0.2825779, 0.4426048, 2.064646, 0, 0.4705882, 1, 1,
0.2826826, 0.3871134, 0.1534448, 0, 0.4666667, 1, 1,
0.2845157, -2.476847, 1.192129, 0, 0.4588235, 1, 1,
0.2890365, -1.137799, 2.122447, 0, 0.454902, 1, 1,
0.292991, -0.5354176, 3.946564, 0, 0.4470588, 1, 1,
0.2999432, -1.834756, 2.496318, 0, 0.4431373, 1, 1,
0.3023038, -1.354338, 2.913062, 0, 0.4352941, 1, 1,
0.3042268, -0.3513414, 1.358008, 0, 0.4313726, 1, 1,
0.3079577, 0.8757169, -1.300307, 0, 0.4235294, 1, 1,
0.3080422, -1.129309, 4.488545, 0, 0.4196078, 1, 1,
0.3121558, 2.093782, -0.9339097, 0, 0.4117647, 1, 1,
0.3127688, 0.1579961, 0.2817021, 0, 0.4078431, 1, 1,
0.3170016, 0.194091, 0.8893403, 0, 0.4, 1, 1,
0.3182569, 0.6419655, 1.209953, 0, 0.3921569, 1, 1,
0.3192064, -1.534155, 4.74428, 0, 0.3882353, 1, 1,
0.3203453, -0.885114, 2.286423, 0, 0.3803922, 1, 1,
0.3221359, -0.7432437, 1.91732, 0, 0.3764706, 1, 1,
0.3253824, -0.2498224, 3.438914, 0, 0.3686275, 1, 1,
0.3264003, 1.311401, 1.116473, 0, 0.3647059, 1, 1,
0.3268941, 0.1817987, -0.06168221, 0, 0.3568628, 1, 1,
0.3278727, -1.340915, 0.7617996, 0, 0.3529412, 1, 1,
0.3284729, -1.4973, 4.571845, 0, 0.345098, 1, 1,
0.3294489, -0.9977441, 4.128232, 0, 0.3411765, 1, 1,
0.3306222, 0.57669, -0.9465877, 0, 0.3333333, 1, 1,
0.3310124, -1.066574, 3.850136, 0, 0.3294118, 1, 1,
0.3313566, 0.07961508, 0.2443077, 0, 0.3215686, 1, 1,
0.3313877, -0.3029381, 1.334217, 0, 0.3176471, 1, 1,
0.3323514, 0.629801, 0.2418978, 0, 0.3098039, 1, 1,
0.3337935, 1.080069, 0.6532956, 0, 0.3058824, 1, 1,
0.3342228, 3.155046, -0.708096, 0, 0.2980392, 1, 1,
0.3368466, -2.554058, 1.970657, 0, 0.2901961, 1, 1,
0.3438997, -0.4904696, 2.578883, 0, 0.2862745, 1, 1,
0.3441878, -0.3632727, 3.349607, 0, 0.2784314, 1, 1,
0.3451191, -0.8972637, 3.263564, 0, 0.2745098, 1, 1,
0.3465837, 0.3388067, 0.5255536, 0, 0.2666667, 1, 1,
0.349391, 0.7034532, 0.8950352, 0, 0.2627451, 1, 1,
0.3525901, 0.06245666, 0.7234446, 0, 0.254902, 1, 1,
0.3576733, 0.5605055, 0.6505914, 0, 0.2509804, 1, 1,
0.3593981, -0.5665352, 1.224629, 0, 0.2431373, 1, 1,
0.3622946, 1.505914, -0.3515695, 0, 0.2392157, 1, 1,
0.3641063, 1.787993, -0.04627296, 0, 0.2313726, 1, 1,
0.3645137, -0.07308776, 0.6245126, 0, 0.227451, 1, 1,
0.3675548, 0.3505353, 1.930133, 0, 0.2196078, 1, 1,
0.3713143, -2.46422, 3.26371, 0, 0.2156863, 1, 1,
0.3735342, 1.44619, 0.3515375, 0, 0.2078431, 1, 1,
0.3745623, -0.8109062, 1.680996, 0, 0.2039216, 1, 1,
0.3839381, -0.2838366, 1.575229, 0, 0.1960784, 1, 1,
0.3864712, -0.5940942, 1.8574, 0, 0.1882353, 1, 1,
0.389794, -0.8045188, 1.609111, 0, 0.1843137, 1, 1,
0.3912937, 0.9699199, 1.848538, 0, 0.1764706, 1, 1,
0.3919536, -0.9323354, 2.723517, 0, 0.172549, 1, 1,
0.3927458, -0.7781608, 4.275884, 0, 0.1647059, 1, 1,
0.3939513, 0.910206, 2.39714, 0, 0.1607843, 1, 1,
0.3988937, 0.4820367, 0.1280252, 0, 0.1529412, 1, 1,
0.3995166, 0.8210346, 0.1291111, 0, 0.1490196, 1, 1,
0.4064634, 0.6844866, 0.6387973, 0, 0.1411765, 1, 1,
0.4083475, -0.02821644, 3.607726, 0, 0.1372549, 1, 1,
0.409972, 0.2180866, -0.1239187, 0, 0.1294118, 1, 1,
0.4130148, -0.6727815, 1.807324, 0, 0.1254902, 1, 1,
0.4142594, -0.6251978, 2.795102, 0, 0.1176471, 1, 1,
0.4145652, 2.085618, -0.2581753, 0, 0.1137255, 1, 1,
0.4177602, 0.8759038, -0.9539961, 0, 0.1058824, 1, 1,
0.4184629, 0.6748144, 2.071368, 0, 0.09803922, 1, 1,
0.4190258, 0.6809024, 0.5148265, 0, 0.09411765, 1, 1,
0.4266908, 0.6673944, 0.4404696, 0, 0.08627451, 1, 1,
0.4284814, 1.56531, 3.101319, 0, 0.08235294, 1, 1,
0.4294764, -0.2616397, 1.290389, 0, 0.07450981, 1, 1,
0.4350431, -0.3027021, 3.549601, 0, 0.07058824, 1, 1,
0.4367779, 0.427219, -0.5085974, 0, 0.0627451, 1, 1,
0.441406, 0.4791469, 0.7673444, 0, 0.05882353, 1, 1,
0.442214, 0.09479406, 0.943423, 0, 0.05098039, 1, 1,
0.4457168, -1.851352, 1.595096, 0, 0.04705882, 1, 1,
0.4482549, 0.2635176, 1.05795, 0, 0.03921569, 1, 1,
0.4491973, 0.07385415, 2.020839, 0, 0.03529412, 1, 1,
0.4495873, -2.033146, 4.612768, 0, 0.02745098, 1, 1,
0.4519136, 0.1544178, -1.691178, 0, 0.02352941, 1, 1,
0.4606012, -0.6453426, 2.263075, 0, 0.01568628, 1, 1,
0.4643385, 0.5609776, -0.1038063, 0, 0.01176471, 1, 1,
0.4665054, 0.6129587, 1.359992, 0, 0.003921569, 1, 1,
0.4744078, -0.2407229, 3.727894, 0.003921569, 0, 1, 1,
0.4760212, 0.4771222, 1.013421, 0.007843138, 0, 1, 1,
0.4788487, 0.7410638, -0.8418795, 0.01568628, 0, 1, 1,
0.4800656, -0.7811409, 4.145792, 0.01960784, 0, 1, 1,
0.4810822, 1.860239, -0.02246157, 0.02745098, 0, 1, 1,
0.4872604, 0.2911217, 1.097815, 0.03137255, 0, 1, 1,
0.487682, -0.1718915, 0.8927292, 0.03921569, 0, 1, 1,
0.4888896, 0.9181789, -1.258345, 0.04313726, 0, 1, 1,
0.4968818, -0.6299071, 0.7544826, 0.05098039, 0, 1, 1,
0.498633, -0.6426934, 1.89829, 0.05490196, 0, 1, 1,
0.4992624, -1.275944, 1.818823, 0.0627451, 0, 1, 1,
0.4997615, -0.2870476, 2.968194, 0.06666667, 0, 1, 1,
0.501954, 0.1651626, 1.651448, 0.07450981, 0, 1, 1,
0.5029985, 0.6050456, -0.3558432, 0.07843138, 0, 1, 1,
0.5039613, 2.015589, 0.9423013, 0.08627451, 0, 1, 1,
0.5091964, 0.6849449, 0.158809, 0.09019608, 0, 1, 1,
0.5182413, 0.5879279, 0.563565, 0.09803922, 0, 1, 1,
0.5262763, -1.626287, 3.686841, 0.1058824, 0, 1, 1,
0.5281407, 1.114665, -0.03032491, 0.1098039, 0, 1, 1,
0.5282713, -0.2258866, 2.68872, 0.1176471, 0, 1, 1,
0.5295317, -1.16317, 2.615808, 0.1215686, 0, 1, 1,
0.5295944, 0.391852, 1.924608, 0.1294118, 0, 1, 1,
0.536191, 0.9556464, 2.121303, 0.1333333, 0, 1, 1,
0.5378695, -0.829114, 3.162674, 0.1411765, 0, 1, 1,
0.5428865, -1.882329, 2.655213, 0.145098, 0, 1, 1,
0.5440336, 0.6366245, 1.970068, 0.1529412, 0, 1, 1,
0.5527449, -1.51938, 1.777232, 0.1568628, 0, 1, 1,
0.5553764, -2.009315, 3.629424, 0.1647059, 0, 1, 1,
0.5580287, -0.07255905, 1.868487, 0.1686275, 0, 1, 1,
0.5643277, -0.365219, 3.133373, 0.1764706, 0, 1, 1,
0.564349, 0.2815555, 0.8159112, 0.1803922, 0, 1, 1,
0.5723549, -0.2686816, 1.75146, 0.1882353, 0, 1, 1,
0.5753589, -2.112964, 2.786188, 0.1921569, 0, 1, 1,
0.5773253, -1.831558, 3.702528, 0.2, 0, 1, 1,
0.577523, -0.08319237, 0.4676117, 0.2078431, 0, 1, 1,
0.5813891, 0.01105484, 3.111019, 0.2117647, 0, 1, 1,
0.5869224, 1.581758, -2.932647, 0.2196078, 0, 1, 1,
0.5876172, 0.6291596, 1.542174, 0.2235294, 0, 1, 1,
0.5919892, -0.2383119, 1.066382, 0.2313726, 0, 1, 1,
0.5930865, -1.210337, 1.446518, 0.2352941, 0, 1, 1,
0.5954803, 1.486336, -1.634145, 0.2431373, 0, 1, 1,
0.5963896, 0.4089172, -0.09909208, 0.2470588, 0, 1, 1,
0.6008587, 0.903865, -0.7716852, 0.254902, 0, 1, 1,
0.6023225, 0.1844125, -0.1075959, 0.2588235, 0, 1, 1,
0.602883, -1.234668, 4.039059, 0.2666667, 0, 1, 1,
0.6076752, 0.4036303, 1.652313, 0.2705882, 0, 1, 1,
0.609463, -0.8876647, 2.802455, 0.2784314, 0, 1, 1,
0.61006, 0.6668813, 0.192446, 0.282353, 0, 1, 1,
0.6122299, 0.2188463, 0.7970811, 0.2901961, 0, 1, 1,
0.6192064, -0.5607992, 2.676933, 0.2941177, 0, 1, 1,
0.6194825, -0.814887, 3.062259, 0.3019608, 0, 1, 1,
0.620118, 1.616334, 0.8790624, 0.3098039, 0, 1, 1,
0.6211918, -1.256248, 3.358448, 0.3137255, 0, 1, 1,
0.6244764, 1.571509, 1.895506, 0.3215686, 0, 1, 1,
0.6276075, -0.7549819, 3.759129, 0.3254902, 0, 1, 1,
0.6283257, 1.689047, -0.701201, 0.3333333, 0, 1, 1,
0.630454, -0.672932, 1.892123, 0.3372549, 0, 1, 1,
0.6308005, -0.6378545, 1.922528, 0.345098, 0, 1, 1,
0.6314981, -0.290531, 0.3367636, 0.3490196, 0, 1, 1,
0.6380639, 0.02618156, 1.247921, 0.3568628, 0, 1, 1,
0.6384486, 0.5379627, 2.06425, 0.3607843, 0, 1, 1,
0.6406879, -0.739568, 2.813308, 0.3686275, 0, 1, 1,
0.6447569, -0.5526645, 1.142986, 0.372549, 0, 1, 1,
0.6459657, -0.1419289, 3.394726, 0.3803922, 0, 1, 1,
0.6475996, -1.259911, 3.304968, 0.3843137, 0, 1, 1,
0.6477302, 2.093949, 1.739846, 0.3921569, 0, 1, 1,
0.6576901, 0.09083693, 0.6091322, 0.3960784, 0, 1, 1,
0.6598545, 0.589176, -0.01773068, 0.4039216, 0, 1, 1,
0.6619236, 0.1920252, 1.317398, 0.4117647, 0, 1, 1,
0.6654985, -0.5258348, 3.230291, 0.4156863, 0, 1, 1,
0.6655141, -0.3606749, 1.888385, 0.4235294, 0, 1, 1,
0.666838, 0.4549004, 1.193661, 0.427451, 0, 1, 1,
0.6692113, 1.640306, -0.4484965, 0.4352941, 0, 1, 1,
0.6704871, -0.4012772, 3.228266, 0.4392157, 0, 1, 1,
0.6707128, 0.3468943, -0.236246, 0.4470588, 0, 1, 1,
0.6776512, -1.262541, 3.625319, 0.4509804, 0, 1, 1,
0.683771, 1.0125, 1.702607, 0.4588235, 0, 1, 1,
0.6847304, -0.05887039, -0.1918645, 0.4627451, 0, 1, 1,
0.685158, -0.3936188, 1.870698, 0.4705882, 0, 1, 1,
0.6999963, -1.931671, 3.441318, 0.4745098, 0, 1, 1,
0.7094447, -0.6033317, 2.835581, 0.4823529, 0, 1, 1,
0.7153866, 0.6402475, 2.120403, 0.4862745, 0, 1, 1,
0.7162649, 1.773075, 1.864882, 0.4941176, 0, 1, 1,
0.7171736, -1.814638, 4.198362, 0.5019608, 0, 1, 1,
0.7204975, 0.8135781, -0.8458083, 0.5058824, 0, 1, 1,
0.7271806, 0.198279, 1.45008, 0.5137255, 0, 1, 1,
0.7324805, -0.8670124, 4.154318, 0.5176471, 0, 1, 1,
0.733232, 1.172413, 0.3347091, 0.5254902, 0, 1, 1,
0.7332726, -1.881773, 2.265752, 0.5294118, 0, 1, 1,
0.7336965, -0.7737523, 4.277007, 0.5372549, 0, 1, 1,
0.7366199, 0.7281842, 1.025167, 0.5411765, 0, 1, 1,
0.7389552, -0.50058, 2.496753, 0.5490196, 0, 1, 1,
0.7394295, 0.7423195, -0.8812462, 0.5529412, 0, 1, 1,
0.7400071, -0.2230042, 2.045511, 0.5607843, 0, 1, 1,
0.7448967, 1.371987, 0.5768545, 0.5647059, 0, 1, 1,
0.7478561, -0.9431389, 2.402711, 0.572549, 0, 1, 1,
0.7544048, -0.9078588, 2.380328, 0.5764706, 0, 1, 1,
0.7563062, 0.3215227, 1.1023, 0.5843138, 0, 1, 1,
0.7585591, 0.6506525, 0.3938496, 0.5882353, 0, 1, 1,
0.7634135, 0.6044635, 3.685489, 0.5960785, 0, 1, 1,
0.7657861, -0.3489851, 1.656784, 0.6039216, 0, 1, 1,
0.7661508, -1.138352, 3.119682, 0.6078432, 0, 1, 1,
0.7691123, -0.6053756, 3.257781, 0.6156863, 0, 1, 1,
0.7712393, 0.5065466, 3.63365, 0.6196079, 0, 1, 1,
0.7739749, 0.3786642, 2.459553, 0.627451, 0, 1, 1,
0.7747639, 0.6520578, 1.140198, 0.6313726, 0, 1, 1,
0.7756726, -1.195649, 2.735298, 0.6392157, 0, 1, 1,
0.7764667, -1.067596, 3.170154, 0.6431373, 0, 1, 1,
0.7839537, -0.6757628, 2.867063, 0.6509804, 0, 1, 1,
0.7841668, 1.018507, -0.4363074, 0.654902, 0, 1, 1,
0.7866133, 1.42935, -1.329866, 0.6627451, 0, 1, 1,
0.7926329, 0.29886, 1.852869, 0.6666667, 0, 1, 1,
0.7941515, -1.396845, 2.448244, 0.6745098, 0, 1, 1,
0.7955509, 1.778076, 0.9340526, 0.6784314, 0, 1, 1,
0.7992609, 1.317474, 1.757848, 0.6862745, 0, 1, 1,
0.7998654, 0.5627605, 2.040144, 0.6901961, 0, 1, 1,
0.8010724, -0.8326965, 1.901968, 0.6980392, 0, 1, 1,
0.8013509, -2.378613, 2.943466, 0.7058824, 0, 1, 1,
0.806421, -1.163001, 4.265187, 0.7098039, 0, 1, 1,
0.8182841, 1.585853, 0.009316596, 0.7176471, 0, 1, 1,
0.818611, -0.7416664, 3.106309, 0.7215686, 0, 1, 1,
0.8196853, 1.010531, 1.036055, 0.7294118, 0, 1, 1,
0.8208003, 0.2641612, 1.958165, 0.7333333, 0, 1, 1,
0.8235214, -0.8175597, 1.961245, 0.7411765, 0, 1, 1,
0.8242269, -0.8008628, 3.746098, 0.7450981, 0, 1, 1,
0.8255076, -0.4779515, 1.361319, 0.7529412, 0, 1, 1,
0.8431634, -0.9911152, 3.614932, 0.7568628, 0, 1, 1,
0.8437631, -0.429609, 3.295383, 0.7647059, 0, 1, 1,
0.843789, -0.9063789, 1.0516, 0.7686275, 0, 1, 1,
0.8446885, -0.131538, 1.510745, 0.7764706, 0, 1, 1,
0.8521481, -0.1064063, 2.871052, 0.7803922, 0, 1, 1,
0.8531774, -1.217403, 2.507946, 0.7882353, 0, 1, 1,
0.853281, -1.686097, 2.727359, 0.7921569, 0, 1, 1,
0.8554457, -0.5531122, 0.6946435, 0.8, 0, 1, 1,
0.8591302, 0.5904038, 2.292194, 0.8078431, 0, 1, 1,
0.864991, -0.6964455, 2.598864, 0.8117647, 0, 1, 1,
0.8660194, 1.680998, 0.751761, 0.8196079, 0, 1, 1,
0.876619, -0.009962758, 1.179967, 0.8235294, 0, 1, 1,
0.8864831, 0.2046985, 1.052105, 0.8313726, 0, 1, 1,
0.8904573, -0.8046528, 3.470437, 0.8352941, 0, 1, 1,
0.8978604, -0.4582642, 3.017431, 0.8431373, 0, 1, 1,
0.9027128, -0.6698703, 3.428553, 0.8470588, 0, 1, 1,
0.9051382, -0.5225794, 2.524502, 0.854902, 0, 1, 1,
0.9068169, 1.554356, 2.049024, 0.8588235, 0, 1, 1,
0.909827, 1.087741, 0.2663468, 0.8666667, 0, 1, 1,
0.9131906, -1.567678, 3.459383, 0.8705882, 0, 1, 1,
0.9132146, -0.984096, 1.449043, 0.8784314, 0, 1, 1,
0.9262573, 1.72513, 0.572691, 0.8823529, 0, 1, 1,
0.9368634, -0.3868202, 2.303744, 0.8901961, 0, 1, 1,
0.9377345, -0.0538336, 2.772974, 0.8941177, 0, 1, 1,
0.9381867, -0.2649585, 0.7986916, 0.9019608, 0, 1, 1,
0.9391583, 0.05668668, 2.132413, 0.9098039, 0, 1, 1,
0.943396, 0.8749706, -0.9112836, 0.9137255, 0, 1, 1,
0.9459903, -1.542356, 1.852193, 0.9215686, 0, 1, 1,
0.9504752, -1.780601, 3.325238, 0.9254902, 0, 1, 1,
0.9517334, 0.5005791, -1.6623, 0.9333333, 0, 1, 1,
0.9600075, 1.570297, 2.079082, 0.9372549, 0, 1, 1,
0.9624479, -0.9170777, 3.457111, 0.945098, 0, 1, 1,
0.9662309, -1.202085, 2.432757, 0.9490196, 0, 1, 1,
0.967326, -0.841103, -0.319326, 0.9568627, 0, 1, 1,
0.9691814, 1.260865, -0.7580187, 0.9607843, 0, 1, 1,
0.9693356, -0.4014535, 1.999241, 0.9686275, 0, 1, 1,
0.9752783, -0.8161616, 0.591261, 0.972549, 0, 1, 1,
0.9764046, -0.7389936, 4.036262, 0.9803922, 0, 1, 1,
0.9770136, -1.358374, 2.746327, 0.9843137, 0, 1, 1,
0.9801926, 0.9129986, 0.06793522, 0.9921569, 0, 1, 1,
0.9855966, 0.8740634, 1.807195, 0.9960784, 0, 1, 1,
0.9863433, 1.470093, 2.083592, 1, 0, 0.9960784, 1,
0.9970597, 0.1230502, 2.373538, 1, 0, 0.9882353, 1,
0.9984605, -0.7411234, 3.070876, 1, 0, 0.9843137, 1,
0.9989459, -1.782169, 2.74309, 1, 0, 0.9764706, 1,
1.001359, -0.5582911, 2.443071, 1, 0, 0.972549, 1,
1.003711, -0.3993789, 1.658975, 1, 0, 0.9647059, 1,
1.009922, 2.092613, 1.539033, 1, 0, 0.9607843, 1,
1.012072, 1.175006, -1.213414, 1, 0, 0.9529412, 1,
1.01283, 1.293211, 0.4656082, 1, 0, 0.9490196, 1,
1.016323, -0.7076746, 0.8478391, 1, 0, 0.9411765, 1,
1.016559, -1.204313, 2.655657, 1, 0, 0.9372549, 1,
1.021741, -2.095945, 2.350439, 1, 0, 0.9294118, 1,
1.025441, -0.1022068, 0.3622215, 1, 0, 0.9254902, 1,
1.035583, -0.1905664, 2.169276, 1, 0, 0.9176471, 1,
1.036386, 0.2452377, 1.246441, 1, 0, 0.9137255, 1,
1.038649, -1.127962, 2.915645, 1, 0, 0.9058824, 1,
1.039818, 0.2966438, 1.777557, 1, 0, 0.9019608, 1,
1.041114, -0.7591635, 2.69675, 1, 0, 0.8941177, 1,
1.047815, 0.6603429, -1.032345, 1, 0, 0.8862745, 1,
1.052635, -2.405749, 2.741144, 1, 0, 0.8823529, 1,
1.055868, -0.778356, 1.969249, 1, 0, 0.8745098, 1,
1.057568, 0.7166905, -0.371261, 1, 0, 0.8705882, 1,
1.060101, 0.8328871, 1.323293, 1, 0, 0.8627451, 1,
1.061901, 0.3005698, 2.942865, 1, 0, 0.8588235, 1,
1.076025, -0.3839429, 0.667318, 1, 0, 0.8509804, 1,
1.077201, 0.291006, 0.4174525, 1, 0, 0.8470588, 1,
1.080222, 0.7180888, 0.5900878, 1, 0, 0.8392157, 1,
1.080809, -1.085708, 1.425033, 1, 0, 0.8352941, 1,
1.083232, -0.02250559, 2.279745, 1, 0, 0.827451, 1,
1.097734, -1.831572, 1.743594, 1, 0, 0.8235294, 1,
1.099666, -0.4184895, 2.071259, 1, 0, 0.8156863, 1,
1.099687, 0.07899557, -0.9615323, 1, 0, 0.8117647, 1,
1.113999, 0.621322, 2.524663, 1, 0, 0.8039216, 1,
1.114914, 0.4565461, 1.677224, 1, 0, 0.7960784, 1,
1.11499, -0.5872216, 1.673125, 1, 0, 0.7921569, 1,
1.115227, -1.12805, 1.094817, 1, 0, 0.7843137, 1,
1.128165, 0.4945703, 2.116417, 1, 0, 0.7803922, 1,
1.128499, -0.2233642, 1.520116, 1, 0, 0.772549, 1,
1.138712, 1.306829, 1.198733, 1, 0, 0.7686275, 1,
1.142903, 1.312836, -0.39782, 1, 0, 0.7607843, 1,
1.155053, -1.065926, 2.025926, 1, 0, 0.7568628, 1,
1.155546, 0.2654469, 2.713183, 1, 0, 0.7490196, 1,
1.160449, 0.3836095, 0.1086894, 1, 0, 0.7450981, 1,
1.163778, -0.8648381, 2.798741, 1, 0, 0.7372549, 1,
1.171277, 0.2289815, 2.028602, 1, 0, 0.7333333, 1,
1.173313, 1.351081, -0.057692, 1, 0, 0.7254902, 1,
1.175817, -1.68335, 4.030219, 1, 0, 0.7215686, 1,
1.176617, -1.532544, 2.619677, 1, 0, 0.7137255, 1,
1.17768, 1.025131, 0.6046432, 1, 0, 0.7098039, 1,
1.17884, 0.02736026, 1.483124, 1, 0, 0.7019608, 1,
1.187032, 0.1634098, 2.111777, 1, 0, 0.6941177, 1,
1.190018, -0.1379382, 1.586424, 1, 0, 0.6901961, 1,
1.191565, -0.3334973, 1.956608, 1, 0, 0.682353, 1,
1.202583, -0.3192523, 0.07373301, 1, 0, 0.6784314, 1,
1.203666, 0.1662641, 2.806967, 1, 0, 0.6705883, 1,
1.208343, -1.289047, 2.768252, 1, 0, 0.6666667, 1,
1.220657, 0.8264127, 0.9111652, 1, 0, 0.6588235, 1,
1.228513, 0.7393544, 0.8164178, 1, 0, 0.654902, 1,
1.240147, -0.9184973, 1.764839, 1, 0, 0.6470588, 1,
1.243758, -0.252403, -0.5133752, 1, 0, 0.6431373, 1,
1.245969, 2.726577, 2.129507, 1, 0, 0.6352941, 1,
1.257137, -0.4334484, 2.728378, 1, 0, 0.6313726, 1,
1.257469, -1.340166, 2.08026, 1, 0, 0.6235294, 1,
1.259534, -0.4533434, 2.688241, 1, 0, 0.6196079, 1,
1.260971, -0.5919516, 2.678073, 1, 0, 0.6117647, 1,
1.263435, 0.09464969, 1.718787, 1, 0, 0.6078432, 1,
1.269282, 2.728843, 0.5219744, 1, 0, 0.6, 1,
1.269394, 0.4577539, 1.252762, 1, 0, 0.5921569, 1,
1.2734, -1.963887, 2.008073, 1, 0, 0.5882353, 1,
1.274535, -0.8608795, 1.173363, 1, 0, 0.5803922, 1,
1.284752, -0.03737534, 1.056539, 1, 0, 0.5764706, 1,
1.285311, 2.015911, 1.310973, 1, 0, 0.5686275, 1,
1.286711, 0.4225462, -0.4816216, 1, 0, 0.5647059, 1,
1.295305, 0.07683576, 0.3407932, 1, 0, 0.5568628, 1,
1.300652, -1.130329, 2.000569, 1, 0, 0.5529412, 1,
1.319137, -0.1323091, -0.2941686, 1, 0, 0.5450981, 1,
1.321032, -1.095894, 2.776026, 1, 0, 0.5411765, 1,
1.321242, -0.9422966, 3.352048, 1, 0, 0.5333334, 1,
1.327602, -1.414093, 1.172761, 1, 0, 0.5294118, 1,
1.336466, 0.06658991, 0.9874915, 1, 0, 0.5215687, 1,
1.338388, -0.3516049, 3.335301, 1, 0, 0.5176471, 1,
1.353057, 0.4595353, 1.823952, 1, 0, 0.509804, 1,
1.356078, -0.4633158, 2.146917, 1, 0, 0.5058824, 1,
1.357068, -0.9573947, 3.692784, 1, 0, 0.4980392, 1,
1.360664, 1.358322, 0.7188061, 1, 0, 0.4901961, 1,
1.361359, -0.1749268, 1.050254, 1, 0, 0.4862745, 1,
1.371557, -0.9066195, 2.134726, 1, 0, 0.4784314, 1,
1.395988, -3.403695, 3.084707, 1, 0, 0.4745098, 1,
1.396893, -0.748524, 1.708326, 1, 0, 0.4666667, 1,
1.400394, -2.215813, 2.638103, 1, 0, 0.4627451, 1,
1.407571, 0.1689576, 3.240409, 1, 0, 0.454902, 1,
1.417457, -0.5009021, 1.620734, 1, 0, 0.4509804, 1,
1.420948, 0.5299484, 0.02846948, 1, 0, 0.4431373, 1,
1.422663, 0.52145, -0.9149939, 1, 0, 0.4392157, 1,
1.42283, 1.130164, 1.650667, 1, 0, 0.4313726, 1,
1.428224, 0.9616551, 1.008409, 1, 0, 0.427451, 1,
1.437119, 0.05005896, 1.199793, 1, 0, 0.4196078, 1,
1.438043, -0.3133413, 2.185562, 1, 0, 0.4156863, 1,
1.439361, 0.806558, 0.03044553, 1, 0, 0.4078431, 1,
1.441649, 0.1791018, 2.039865, 1, 0, 0.4039216, 1,
1.442673, 1.278819, 1.894547, 1, 0, 0.3960784, 1,
1.449481, -0.05280937, 3.452006, 1, 0, 0.3882353, 1,
1.457933, 0.4471141, 0.9032428, 1, 0, 0.3843137, 1,
1.467131, -0.1511383, 1.794706, 1, 0, 0.3764706, 1,
1.467298, 2.217491, 3.210517, 1, 0, 0.372549, 1,
1.481656, 0.4838076, 1.267737, 1, 0, 0.3647059, 1,
1.501624, -1.4152, 1.434089, 1, 0, 0.3607843, 1,
1.503519, -0.7815322, 2.364379, 1, 0, 0.3529412, 1,
1.520032, -0.3465802, 2.258552, 1, 0, 0.3490196, 1,
1.52464, -1.289649, 4.354293, 1, 0, 0.3411765, 1,
1.536198, 1.61954, 1.348389, 1, 0, 0.3372549, 1,
1.541905, -0.4589125, 1.001754, 1, 0, 0.3294118, 1,
1.549976, -0.6321332, 3.567018, 1, 0, 0.3254902, 1,
1.555761, -0.1505934, 1.123038, 1, 0, 0.3176471, 1,
1.564088, -0.8563121, 2.797837, 1, 0, 0.3137255, 1,
1.569444, -0.5123114, 1.28264, 1, 0, 0.3058824, 1,
1.5702, -1.009828, 2.391693, 1, 0, 0.2980392, 1,
1.605711, 0.1844755, 2.066275, 1, 0, 0.2941177, 1,
1.606192, 0.6110787, 0.5161017, 1, 0, 0.2862745, 1,
1.63529, -0.9529409, 3.425813, 1, 0, 0.282353, 1,
1.652425, -0.4174442, 1.653512, 1, 0, 0.2745098, 1,
1.669117, -0.2061813, 2.130109, 1, 0, 0.2705882, 1,
1.673683, 0.3618293, 3.041199, 1, 0, 0.2627451, 1,
1.674964, -2.211358, 2.070441, 1, 0, 0.2588235, 1,
1.679251, -2.183948, 2.920388, 1, 0, 0.2509804, 1,
1.699563, 1.713263, -0.1684234, 1, 0, 0.2470588, 1,
1.712155, -0.3051882, 2.629294, 1, 0, 0.2392157, 1,
1.723774, 1.209747, 2.842012, 1, 0, 0.2352941, 1,
1.729007, -1.168787, 3.618938, 1, 0, 0.227451, 1,
1.739803, 0.7291669, 1.401005, 1, 0, 0.2235294, 1,
1.753962, 2.134511, 1.111749, 1, 0, 0.2156863, 1,
1.773089, 1.287518, 0.9412092, 1, 0, 0.2117647, 1,
1.79609, 0.2848261, 0.297619, 1, 0, 0.2039216, 1,
1.809312, -0.04659945, 0.2368535, 1, 0, 0.1960784, 1,
1.821281, -0.02909901, 0.7874037, 1, 0, 0.1921569, 1,
1.857362, 1.781756, 0.2495891, 1, 0, 0.1843137, 1,
1.864866, -0.6989623, 2.723231, 1, 0, 0.1803922, 1,
1.893488, 0.1166926, 0.8619985, 1, 0, 0.172549, 1,
1.894759, 0.9649655, 0.7026339, 1, 0, 0.1686275, 1,
1.961596, 0.9562477, 3.364541, 1, 0, 0.1607843, 1,
1.97208, 1.116285, 0.8571988, 1, 0, 0.1568628, 1,
1.985468, 0.868913, 2.315106, 1, 0, 0.1490196, 1,
1.991915, -0.7937678, 3.11294, 1, 0, 0.145098, 1,
1.992012, -0.6698186, 2.418672, 1, 0, 0.1372549, 1,
1.994659, -0.3665643, 5.164466, 1, 0, 0.1333333, 1,
1.995088, 1.039668, 0.9807732, 1, 0, 0.1254902, 1,
2.014097, 1.172163, 0.1533728, 1, 0, 0.1215686, 1,
2.052116, 0.776986, 0.3512551, 1, 0, 0.1137255, 1,
2.053897, -0.4069851, 1.524024, 1, 0, 0.1098039, 1,
2.063311, 0.4690203, 2.356282, 1, 0, 0.1019608, 1,
2.081068, -0.4088791, 2.06943, 1, 0, 0.09411765, 1,
2.10378, 1.137931, 0.9472932, 1, 0, 0.09019608, 1,
2.113125, -0.652997, 2.304311, 1, 0, 0.08235294, 1,
2.210616, 0.576688, 1.388219, 1, 0, 0.07843138, 1,
2.212169, -0.5525726, 2.852149, 1, 0, 0.07058824, 1,
2.21428, -0.9960116, 2.142813, 1, 0, 0.06666667, 1,
2.296406, 2.635613, 1.289562, 1, 0, 0.05882353, 1,
2.461334, -2.910127, 3.716499, 1, 0, 0.05490196, 1,
2.762384, 0.6364352, 1.618214, 1, 0, 0.04705882, 1,
2.789008, -0.7286062, 0.7250874, 1, 0, 0.04313726, 1,
2.790847, -0.4338036, 1.326048, 1, 0, 0.03529412, 1,
2.79413, -0.1815075, 1.062516, 1, 0, 0.03137255, 1,
2.80414, -0.9565328, 0.2354444, 1, 0, 0.02352941, 1,
2.807248, -0.8394383, 3.317316, 1, 0, 0.01960784, 1,
2.920463, 0.4479105, 1.500026, 1, 0, 0.01176471, 1,
3.014864, -0.7554509, 2.65928, 1, 0, 0.007843138, 1
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
0.008423924, -4.544444, -7.725265, 0, -0.5, 0.5, 0.5,
0.008423924, -4.544444, -7.725265, 1, -0.5, 0.5, 0.5,
0.008423924, -4.544444, -7.725265, 1, 1.5, 0.5, 0.5,
0.008423924, -4.544444, -7.725265, 0, 1.5, 0.5, 0.5
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
-4.0172, -0.03865325, -7.725265, 0, -0.5, 0.5, 0.5,
-4.0172, -0.03865325, -7.725265, 1, -0.5, 0.5, 0.5,
-4.0172, -0.03865325, -7.725265, 1, 1.5, 0.5, 0.5,
-4.0172, -0.03865325, -7.725265, 0, 1.5, 0.5, 0.5
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
-4.0172, -4.544444, -0.3463209, 0, -0.5, 0.5, 0.5,
-4.0172, -4.544444, -0.3463209, 1, -0.5, 0.5, 0.5,
-4.0172, -4.544444, -0.3463209, 1, 1.5, 0.5, 0.5,
-4.0172, -4.544444, -0.3463209, 0, 1.5, 0.5, 0.5
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
-2, -3.504646, -6.022432,
3, -3.504646, -6.022432,
-2, -3.504646, -6.022432,
-2, -3.677946, -6.306237,
-1, -3.504646, -6.022432,
-1, -3.677946, -6.306237,
0, -3.504646, -6.022432,
0, -3.677946, -6.306237,
1, -3.504646, -6.022432,
1, -3.677946, -6.306237,
2, -3.504646, -6.022432,
2, -3.677946, -6.306237,
3, -3.504646, -6.022432,
3, -3.677946, -6.306237
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
-2, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
-2, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
-2, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
-2, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5,
-1, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
-1, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
-1, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
-1, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5,
0, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
0, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
0, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
0, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5,
1, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
1, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
1, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
1, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5,
2, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
2, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
2, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
2, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5,
3, -4.024545, -6.873848, 0, -0.5, 0.5, 0.5,
3, -4.024545, -6.873848, 1, -0.5, 0.5, 0.5,
3, -4.024545, -6.873848, 1, 1.5, 0.5, 0.5,
3, -4.024545, -6.873848, 0, 1.5, 0.5, 0.5
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
-3.08821, -3, -6.022432,
-3.08821, 3, -6.022432,
-3.08821, -3, -6.022432,
-3.243041, -3, -6.306237,
-3.08821, -2, -6.022432,
-3.243041, -2, -6.306237,
-3.08821, -1, -6.022432,
-3.243041, -1, -6.306237,
-3.08821, 0, -6.022432,
-3.243041, 0, -6.306237,
-3.08821, 1, -6.022432,
-3.243041, 1, -6.306237,
-3.08821, 2, -6.022432,
-3.243041, 2, -6.306237,
-3.08821, 3, -6.022432,
-3.243041, 3, -6.306237
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
-3.552705, -3, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, -3, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, -3, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, -3, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, -2, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, -2, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, -2, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, -2, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, -1, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, -1, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, -1, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, -1, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, 0, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, 0, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, 0, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, 0, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, 1, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, 1, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, 1, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, 1, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, 2, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, 2, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, 2, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, 2, -6.873848, 0, 1.5, 0.5, 0.5,
-3.552705, 3, -6.873848, 0, -0.5, 0.5, 0.5,
-3.552705, 3, -6.873848, 1, -0.5, 0.5, 0.5,
-3.552705, 3, -6.873848, 1, 1.5, 0.5, 0.5,
-3.552705, 3, -6.873848, 0, 1.5, 0.5, 0.5
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
-3.08821, -3.504646, -4,
-3.08821, -3.504646, 4,
-3.08821, -3.504646, -4,
-3.243041, -3.677946, -4,
-3.08821, -3.504646, -2,
-3.243041, -3.677946, -2,
-3.08821, -3.504646, 0,
-3.243041, -3.677946, 0,
-3.08821, -3.504646, 2,
-3.243041, -3.677946, 2,
-3.08821, -3.504646, 4,
-3.243041, -3.677946, 4
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
-3.552705, -4.024545, -4, 0, -0.5, 0.5, 0.5,
-3.552705, -4.024545, -4, 1, -0.5, 0.5, 0.5,
-3.552705, -4.024545, -4, 1, 1.5, 0.5, 0.5,
-3.552705, -4.024545, -4, 0, 1.5, 0.5, 0.5,
-3.552705, -4.024545, -2, 0, -0.5, 0.5, 0.5,
-3.552705, -4.024545, -2, 1, -0.5, 0.5, 0.5,
-3.552705, -4.024545, -2, 1, 1.5, 0.5, 0.5,
-3.552705, -4.024545, -2, 0, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 0, 0, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 0, 1, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 0, 1, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 0, 0, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 2, 0, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 2, 1, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 2, 1, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 2, 0, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 4, 0, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 4, 1, -0.5, 0.5, 0.5,
-3.552705, -4.024545, 4, 1, 1.5, 0.5, 0.5,
-3.552705, -4.024545, 4, 0, 1.5, 0.5, 0.5
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
-3.08821, -3.504646, -6.022432,
-3.08821, 3.42734, -6.022432,
-3.08821, -3.504646, 5.32979,
-3.08821, 3.42734, 5.32979,
-3.08821, -3.504646, -6.022432,
-3.08821, -3.504646, 5.32979,
-3.08821, 3.42734, -6.022432,
-3.08821, 3.42734, 5.32979,
-3.08821, -3.504646, -6.022432,
3.105057, -3.504646, -6.022432,
-3.08821, -3.504646, 5.32979,
3.105057, -3.504646, 5.32979,
-3.08821, 3.42734, -6.022432,
3.105057, 3.42734, -6.022432,
-3.08821, 3.42734, 5.32979,
3.105057, 3.42734, 5.32979,
3.105057, -3.504646, -6.022432,
3.105057, 3.42734, -6.022432,
3.105057, -3.504646, 5.32979,
3.105057, 3.42734, 5.32979,
3.105057, -3.504646, -6.022432,
3.105057, -3.504646, 5.32979,
3.105057, 3.42734, -6.022432,
3.105057, 3.42734, 5.32979
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
var radius = 7.834824;
var distance = 34.85802;
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
mvMatrix.translate( -0.008423924, 0.03865325, 0.3463209 );
mvMatrix.scale( 1.367802, 1.22204, 0.7462121 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.85802);
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
emamectin<-read.table("emamectin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-emamectin$V2
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
```

```r
y<-emamectin$V3
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
```

```r
z<-emamectin$V4
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
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
-2.998016, 1.394741, -1.341963, 0, 0, 1, 1, 1,
-2.79903, -0.327131, -2.898629, 1, 0, 0, 1, 1,
-2.770711, 0.4642438, -0.2950708, 1, 0, 0, 1, 1,
-2.649202, -1.039695, -1.197106, 1, 0, 0, 1, 1,
-2.645, 1.813277, -1.931256, 1, 0, 0, 1, 1,
-2.559412, 0.1525114, -1.336631, 1, 0, 0, 1, 1,
-2.55053, 0.6995414, -1.195411, 0, 0, 0, 1, 1,
-2.406048, 1.3969, -0.5792993, 0, 0, 0, 1, 1,
-2.356703, -0.09438889, -3.576691, 0, 0, 0, 1, 1,
-2.341283, 1.364905, -0.3953508, 0, 0, 0, 1, 1,
-2.300956, -1.163777, -2.52477, 0, 0, 0, 1, 1,
-2.235252, -0.3684453, -0.5777403, 0, 0, 0, 1, 1,
-2.22022, 0.09068112, 0.6042277, 0, 0, 0, 1, 1,
-2.191913, -0.274222, 0.1112542, 1, 1, 1, 1, 1,
-2.158645, -1.085152, -2.463319, 1, 1, 1, 1, 1,
-2.158257, 0.2406123, -1.902909, 1, 1, 1, 1, 1,
-2.151565, -1.35391, 0.2654558, 1, 1, 1, 1, 1,
-2.136824, -0.2844342, -1.717325, 1, 1, 1, 1, 1,
-2.12125, -1.409812, -3.282861, 1, 1, 1, 1, 1,
-2.119019, 0.12888, -0.8578754, 1, 1, 1, 1, 1,
-2.110907, 0.4974787, -2.646105, 1, 1, 1, 1, 1,
-2.107083, -0.7161595, -2.436109, 1, 1, 1, 1, 1,
-2.082904, 0.8058326, -0.86432, 1, 1, 1, 1, 1,
-2.017122, -0.3340917, -1.280895, 1, 1, 1, 1, 1,
-1.968163, 0.7237651, -1.022, 1, 1, 1, 1, 1,
-1.960795, 0.4952499, 0.2240471, 1, 1, 1, 1, 1,
-1.951225, 1.108456, -0.5575519, 1, 1, 1, 1, 1,
-1.942105, -2.20657, -2.389021, 1, 1, 1, 1, 1,
-1.906278, -1.356818, -1.977361, 0, 0, 1, 1, 1,
-1.881857, 0.6846873, -1.172895, 1, 0, 0, 1, 1,
-1.879415, -0.7165818, 0.1721604, 1, 0, 0, 1, 1,
-1.873884, 1.571108, -0.7895608, 1, 0, 0, 1, 1,
-1.869717, 0.4215333, -2.615506, 1, 0, 0, 1, 1,
-1.852178, 0.7018279, -1.673904, 1, 0, 0, 1, 1,
-1.852168, -0.00555364, -1.659023, 0, 0, 0, 1, 1,
-1.85048, 0.9340263, -0.25067, 0, 0, 0, 1, 1,
-1.841067, -0.6136212, -2.217703, 0, 0, 0, 1, 1,
-1.840316, 0.9004133, -0.00958009, 0, 0, 0, 1, 1,
-1.835572, 0.2131676, -2.323263, 0, 0, 0, 1, 1,
-1.83535, -0.5811547, -0.4859519, 0, 0, 0, 1, 1,
-1.767323, -0.107468, -0.7415056, 0, 0, 0, 1, 1,
-1.759698, -0.8023531, -2.019198, 1, 1, 1, 1, 1,
-1.703525, 0.734116, -2.324226, 1, 1, 1, 1, 1,
-1.687755, 0.9241713, -1.539858, 1, 1, 1, 1, 1,
-1.682322, 1.992258, -1.693782, 1, 1, 1, 1, 1,
-1.661367, 0.05109747, -2.101625, 1, 1, 1, 1, 1,
-1.652348, 0.4855487, -0.2265744, 1, 1, 1, 1, 1,
-1.651742, 0.08182305, -1.39515, 1, 1, 1, 1, 1,
-1.644293, -0.7244542, -3.564764, 1, 1, 1, 1, 1,
-1.610201, -1.057116, -1.724221, 1, 1, 1, 1, 1,
-1.596614, 1.851038, -2.250619, 1, 1, 1, 1, 1,
-1.572902, -0.4196551, -2.470745, 1, 1, 1, 1, 1,
-1.558357, -0.1900441, -2.45767, 1, 1, 1, 1, 1,
-1.537155, -1.049322, -3.240258, 1, 1, 1, 1, 1,
-1.535318, -0.8891103, -2.550342, 1, 1, 1, 1, 1,
-1.527131, 0.2459835, -0.605175, 1, 1, 1, 1, 1,
-1.523189, -0.9208301, -2.76352, 0, 0, 1, 1, 1,
-1.522129, -0.7191476, -1.141284, 1, 0, 0, 1, 1,
-1.517301, -0.3100496, -0.5939228, 1, 0, 0, 1, 1,
-1.511654, -0.8560445, -5.857108, 1, 0, 0, 1, 1,
-1.494265, -0.4665889, -4.144688, 1, 0, 0, 1, 1,
-1.491878, -0.2234104, -1.884907, 1, 0, 0, 1, 1,
-1.477652, 0.2292284, -1.278374, 0, 0, 0, 1, 1,
-1.45847, 0.4262265, -1.744518, 0, 0, 0, 1, 1,
-1.457214, 0.2826543, -1.899692, 0, 0, 0, 1, 1,
-1.457049, -0.9799339, -0.04302888, 0, 0, 0, 1, 1,
-1.43946, 1.254622, 0.8688791, 0, 0, 0, 1, 1,
-1.43617, -1.481058, -2.759049, 0, 0, 0, 1, 1,
-1.42777, 1.609967, -0.7830052, 0, 0, 0, 1, 1,
-1.423843, -0.1178581, -1.297613, 1, 1, 1, 1, 1,
-1.40587, 0.4076796, -0.5673637, 1, 1, 1, 1, 1,
-1.392723, 0.5269584, 1.144171, 1, 1, 1, 1, 1,
-1.389982, -0.9837397, -1.499849, 1, 1, 1, 1, 1,
-1.389099, -0.8695183, -0.9640765, 1, 1, 1, 1, 1,
-1.378702, -1.528753, -1.792849, 1, 1, 1, 1, 1,
-1.365868, 0.4437805, -0.960057, 1, 1, 1, 1, 1,
-1.361304, -0.9860064, -3.515683, 1, 1, 1, 1, 1,
-1.351918, 0.313219, -0.6668584, 1, 1, 1, 1, 1,
-1.337351, -0.1573754, -0.1877917, 1, 1, 1, 1, 1,
-1.335763, 1.673186, -2.583619, 1, 1, 1, 1, 1,
-1.322393, -1.159168, -2.609773, 1, 1, 1, 1, 1,
-1.314093, 0.3880865, -1.005778, 1, 1, 1, 1, 1,
-1.313091, -1.147204, -2.981829, 1, 1, 1, 1, 1,
-1.31079, -0.6196673, -0.9883192, 1, 1, 1, 1, 1,
-1.304454, 1.37, 0.7426995, 0, 0, 1, 1, 1,
-1.301811, 0.3854034, -0.8021424, 1, 0, 0, 1, 1,
-1.29935, 1.513845, -1.797396, 1, 0, 0, 1, 1,
-1.296241, 1.205613, -1.295945, 1, 0, 0, 1, 1,
-1.291427, -1.143252, -1.549746, 1, 0, 0, 1, 1,
-1.288088, -0.7778771, -2.56357, 1, 0, 0, 1, 1,
-1.280379, -0.05880597, 0.06120229, 0, 0, 0, 1, 1,
-1.279693, -0.6998005, -0.6286452, 0, 0, 0, 1, 1,
-1.277593, -0.3803697, -1.553915, 0, 0, 0, 1, 1,
-1.276679, -0.9412762, -3.179745, 0, 0, 0, 1, 1,
-1.268619, 0.6405255, -2.18775, 0, 0, 0, 1, 1,
-1.260855, 0.255569, -1.004844, 0, 0, 0, 1, 1,
-1.250117, -0.5296948, -2.418956, 0, 0, 0, 1, 1,
-1.247752, 2.125382, -0.1229972, 1, 1, 1, 1, 1,
-1.246692, 1.801375, -0.519595, 1, 1, 1, 1, 1,
-1.237908, -0.1350267, -2.004603, 1, 1, 1, 1, 1,
-1.235727, -0.3769943, -3.619948, 1, 1, 1, 1, 1,
-1.227249, -0.6215515, -1.157149, 1, 1, 1, 1, 1,
-1.225403, 0.3548964, -1.954446, 1, 1, 1, 1, 1,
-1.221194, 1.624732, -1.695349, 1, 1, 1, 1, 1,
-1.217647, 0.09043693, 0.5064997, 1, 1, 1, 1, 1,
-1.211258, -0.0631292, -1.366653, 1, 1, 1, 1, 1,
-1.20448, -0.703948, -0.9754151, 1, 1, 1, 1, 1,
-1.203563, 0.4989971, -2.27445, 1, 1, 1, 1, 1,
-1.203517, 1.780333, -2.032329, 1, 1, 1, 1, 1,
-1.197448, 0.6917727, -1.647355, 1, 1, 1, 1, 1,
-1.186718, -1.686038, -3.903293, 1, 1, 1, 1, 1,
-1.183864, 1.027414, 0.3063498, 1, 1, 1, 1, 1,
-1.181502, -0.8936012, -0.8045737, 0, 0, 1, 1, 1,
-1.180522, -1.041919, -2.961581, 1, 0, 0, 1, 1,
-1.171479, -0.689344, -3.316155, 1, 0, 0, 1, 1,
-1.169747, -0.9210883, -2.342178, 1, 0, 0, 1, 1,
-1.167104, -1.247852, -5.441455, 1, 0, 0, 1, 1,
-1.16518, 1.232462, -1.647047, 1, 0, 0, 1, 1,
-1.16286, -0.2852419, -2.038187, 0, 0, 0, 1, 1,
-1.157748, -1.271484, -3.192556, 0, 0, 0, 1, 1,
-1.155618, -0.0753335, -0.7187196, 0, 0, 0, 1, 1,
-1.152462, 1.182589, -1.565646, 0, 0, 0, 1, 1,
-1.140286, -0.6245359, -3.200973, 0, 0, 0, 1, 1,
-1.130368, -0.6907005, -3.355273, 0, 0, 0, 1, 1,
-1.124985, 1.197943, -1.165885, 0, 0, 0, 1, 1,
-1.123514, 0.03372068, -0.8902809, 1, 1, 1, 1, 1,
-1.122299, 0.4395521, -0.3197905, 1, 1, 1, 1, 1,
-1.119474, -0.9584237, -3.259887, 1, 1, 1, 1, 1,
-1.111137, 1.947128, 0.6948197, 1, 1, 1, 1, 1,
-1.110633, 0.4465905, -0.7366453, 1, 1, 1, 1, 1,
-1.094445, -1.627716, -3.282523, 1, 1, 1, 1, 1,
-1.092728, 1.423234, -1.704532, 1, 1, 1, 1, 1,
-1.091112, 2.352153, 0.2250212, 1, 1, 1, 1, 1,
-1.083758, 1.506546, -1.276569, 1, 1, 1, 1, 1,
-1.08259, 0.4097262, -1.129311, 1, 1, 1, 1, 1,
-1.080334, 1.74457, -0.5072219, 1, 1, 1, 1, 1,
-1.07669, 0.9819545, -0.5125676, 1, 1, 1, 1, 1,
-1.075826, 0.4374892, -0.002336129, 1, 1, 1, 1, 1,
-1.07116, -1.351141, -3.352971, 1, 1, 1, 1, 1,
-1.070724, 1.421579, -1.016879, 1, 1, 1, 1, 1,
-1.068137, 0.6181356, -0.9450792, 0, 0, 1, 1, 1,
-1.065218, -0.3954979, -3.123875, 1, 0, 0, 1, 1,
-1.064126, -1.28399, -1.86634, 1, 0, 0, 1, 1,
-1.054767, 0.1616621, -2.147835, 1, 0, 0, 1, 1,
-1.054416, -1.038691, -1.764077, 1, 0, 0, 1, 1,
-1.044266, 0.159622, -3.058775, 1, 0, 0, 1, 1,
-1.044078, 0.9014859, -1.189117, 0, 0, 0, 1, 1,
-1.037093, 0.864091, 0.02726298, 0, 0, 0, 1, 1,
-1.035667, 0.7545235, -1.298481, 0, 0, 0, 1, 1,
-1.019412, 1.781911, -0.3492032, 0, 0, 0, 1, 1,
-1.010514, 1.725872, 0.1495159, 0, 0, 0, 1, 1,
-1.008888, 0.2846047, -1.305198, 0, 0, 0, 1, 1,
-1.005414, 0.2170856, -1.043671, 0, 0, 0, 1, 1,
-0.9985556, 0.1931774, 0.2072383, 1, 1, 1, 1, 1,
-0.9960867, 0.7018473, -0.7595285, 1, 1, 1, 1, 1,
-0.9950954, 2.720315, 1.289725, 1, 1, 1, 1, 1,
-0.9938167, -0.1376906, -2.011912, 1, 1, 1, 1, 1,
-0.9897915, -1.05979, -4.062783, 1, 1, 1, 1, 1,
-0.9873247, -1.050489, -1.683266, 1, 1, 1, 1, 1,
-0.9869708, -1.647094, -3.494545, 1, 1, 1, 1, 1,
-0.9861082, 0.05356288, -2.455732, 1, 1, 1, 1, 1,
-0.9822718, 0.1541302, -1.023726, 1, 1, 1, 1, 1,
-0.9791778, 1.156861, -0.5141284, 1, 1, 1, 1, 1,
-0.9767038, 0.3492166, -2.130387, 1, 1, 1, 1, 1,
-0.9745363, -0.8280303, -1.778292, 1, 1, 1, 1, 1,
-0.9719182, -0.7331986, -2.070091, 1, 1, 1, 1, 1,
-0.9625614, -0.1471888, -0.4178251, 1, 1, 1, 1, 1,
-0.9576684, 0.8970968, -2.309378, 1, 1, 1, 1, 1,
-0.9576154, -1.579951, -3.89187, 0, 0, 1, 1, 1,
-0.956999, -1.104413, -1.66315, 1, 0, 0, 1, 1,
-0.9531196, -1.2492, -0.9605077, 1, 0, 0, 1, 1,
-0.9527277, -0.4718589, -3.143629, 1, 0, 0, 1, 1,
-0.9502007, 0.1948581, -1.878884, 1, 0, 0, 1, 1,
-0.9458699, 0.1363962, -1.929493, 1, 0, 0, 1, 1,
-0.9431743, -0.5137991, -2.358684, 0, 0, 0, 1, 1,
-0.9419521, 1.129575, 0.01491599, 0, 0, 0, 1, 1,
-0.9309751, 1.472967, 0.2969749, 0, 0, 0, 1, 1,
-0.9219227, -1.944729, -3.074897, 0, 0, 0, 1, 1,
-0.9218937, -0.1177335, -1.683749, 0, 0, 0, 1, 1,
-0.9200698, 0.9636335, 0.4167913, 0, 0, 0, 1, 1,
-0.9106876, 1.529675, -1.609974, 0, 0, 0, 1, 1,
-0.9081134, 0.7978736, -0.7998313, 1, 1, 1, 1, 1,
-0.9027023, 0.8444668, -1.278509, 1, 1, 1, 1, 1,
-0.897641, -0.5597125, -3.723164, 1, 1, 1, 1, 1,
-0.8881823, -1.071756, -2.537525, 1, 1, 1, 1, 1,
-0.8879643, -0.971706, -1.441238, 1, 1, 1, 1, 1,
-0.8856494, -1.253488, -0.842461, 1, 1, 1, 1, 1,
-0.865901, 0.555792, -1.931033, 1, 1, 1, 1, 1,
-0.8616624, 0.7994247, -0.5235877, 1, 1, 1, 1, 1,
-0.8610377, -1.382929, -1.704177, 1, 1, 1, 1, 1,
-0.8582712, 1.869764, 0.4882086, 1, 1, 1, 1, 1,
-0.8528395, 1.046905, -1.933428, 1, 1, 1, 1, 1,
-0.8461401, 1.867294, -0.1615074, 1, 1, 1, 1, 1,
-0.8421144, 1.101257, 0.1496235, 1, 1, 1, 1, 1,
-0.8401228, -0.1935463, -0.5224194, 1, 1, 1, 1, 1,
-0.8385856, 0.03886417, -0.2197625, 1, 1, 1, 1, 1,
-0.8353034, -1.044994, -2.068118, 0, 0, 1, 1, 1,
-0.8312634, 0.5265252, -0.8757052, 1, 0, 0, 1, 1,
-0.8285868, 0.5012155, -2.854188, 1, 0, 0, 1, 1,
-0.8197904, 1.51945, -2.592439, 1, 0, 0, 1, 1,
-0.8149, 0.6477088, 1.614169, 1, 0, 0, 1, 1,
-0.8145198, 1.597458, -1.958599, 1, 0, 0, 1, 1,
-0.8131756, -2.033613, -1.965216, 0, 0, 0, 1, 1,
-0.7968189, 0.01643899, -1.395911, 0, 0, 0, 1, 1,
-0.7953141, -2.260721, -1.828339, 0, 0, 0, 1, 1,
-0.7921879, 0.6832126, 0.417542, 0, 0, 0, 1, 1,
-0.7917894, 0.2901387, -0.5475668, 0, 0, 0, 1, 1,
-0.7908054, -0.6672097, -2.965204, 0, 0, 0, 1, 1,
-0.7900965, -0.503741, -2.103742, 0, 0, 0, 1, 1,
-0.7864169, 1.238088, -1.037473, 1, 1, 1, 1, 1,
-0.783232, 0.3720871, -0.7487738, 1, 1, 1, 1, 1,
-0.7826904, -0.5772862, -1.291798, 1, 1, 1, 1, 1,
-0.778865, 1.768491, 0.255669, 1, 1, 1, 1, 1,
-0.7702589, 1.336554, -1.351108, 1, 1, 1, 1, 1,
-0.7569359, 1.241762, 0.8159951, 1, 1, 1, 1, 1,
-0.7204497, -0.1014831, -0.5964335, 1, 1, 1, 1, 1,
-0.7200545, 1.244501, -1.80291, 1, 1, 1, 1, 1,
-0.7154843, -2.164413, -3.937904, 1, 1, 1, 1, 1,
-0.7148025, 0.7294267, -0.5472177, 1, 1, 1, 1, 1,
-0.709148, 1.22165, -1.657301, 1, 1, 1, 1, 1,
-0.7063283, 0.6653194, -2.336163, 1, 1, 1, 1, 1,
-0.7051244, 0.4824871, 0.3934748, 1, 1, 1, 1, 1,
-0.6972886, -0.3364471, -1.227501, 1, 1, 1, 1, 1,
-0.6961076, 0.4292046, -0.7546219, 1, 1, 1, 1, 1,
-0.6888844, 1.311585, -1.914077, 0, 0, 1, 1, 1,
-0.6854373, -0.5410312, -2.326267, 1, 0, 0, 1, 1,
-0.6843652, 0.3141861, -1.018383, 1, 0, 0, 1, 1,
-0.6806566, -0.02064429, -1.914035, 1, 0, 0, 1, 1,
-0.6752104, -0.06320221, -0.219398, 1, 0, 0, 1, 1,
-0.6752096, 0.1383336, -1.382535, 1, 0, 0, 1, 1,
-0.6677297, 1.212059, -0.3603436, 0, 0, 0, 1, 1,
-0.667358, 1.865559, -1.120361, 0, 0, 0, 1, 1,
-0.6645081, -2.483572, -2.787787, 0, 0, 0, 1, 1,
-0.6598973, 1.002901, -0.307655, 0, 0, 0, 1, 1,
-0.6596991, 1.575798, -0.5665883, 0, 0, 0, 1, 1,
-0.6563714, -1.251521, -2.681448, 0, 0, 0, 1, 1,
-0.6545143, -0.5334921, -2.792069, 0, 0, 0, 1, 1,
-0.6531659, -0.1648185, -1.947454, 1, 1, 1, 1, 1,
-0.6514463, -1.173209, -1.809692, 1, 1, 1, 1, 1,
-0.6503997, -1.098511, -3.363487, 1, 1, 1, 1, 1,
-0.6465682, -2.652332, -2.225181, 1, 1, 1, 1, 1,
-0.6432678, -0.5479358, -0.801483, 1, 1, 1, 1, 1,
-0.6424699, 1.534198, -3.188347, 1, 1, 1, 1, 1,
-0.6361985, 1.473776, -0.332961, 1, 1, 1, 1, 1,
-0.6330338, 0.3046881, -0.9921653, 1, 1, 1, 1, 1,
-0.6298953, -0.8764526, -5.56314, 1, 1, 1, 1, 1,
-0.6271463, -0.4251198, -1.222563, 1, 1, 1, 1, 1,
-0.6230803, -0.5668515, -1.593725, 1, 1, 1, 1, 1,
-0.6189482, -0.1381792, -1.289741, 1, 1, 1, 1, 1,
-0.6185945, -0.2665941, -3.602662, 1, 1, 1, 1, 1,
-0.6145061, -1.924382, -2.67156, 1, 1, 1, 1, 1,
-0.6001619, -1.109348, -1.416962, 1, 1, 1, 1, 1,
-0.5988301, -1.253832, -2.445595, 0, 0, 1, 1, 1,
-0.5953202, 0.4627659, 1.478156, 1, 0, 0, 1, 1,
-0.5947336, -1.155748, -2.090037, 1, 0, 0, 1, 1,
-0.5929183, 0.9262061, -1.904546, 1, 0, 0, 1, 1,
-0.5886923, -0.5408156, 0.1400577, 1, 0, 0, 1, 1,
-0.5881288, 1.841586, -1.355699, 1, 0, 0, 1, 1,
-0.5873325, 0.3398975, -0.2609108, 0, 0, 0, 1, 1,
-0.5828869, -0.783255, -2.805004, 0, 0, 0, 1, 1,
-0.5814644, 0.08055987, -0.5977049, 0, 0, 0, 1, 1,
-0.5806237, -0.564781, -1.991974, 0, 0, 0, 1, 1,
-0.5772153, -1.422962, -1.763043, 0, 0, 0, 1, 1,
-0.5759271, 0.4223973, -0.3580684, 0, 0, 0, 1, 1,
-0.5701563, 1.101656, -3.817867, 0, 0, 0, 1, 1,
-0.5674032, 0.7661101, -0.4330804, 1, 1, 1, 1, 1,
-0.5633156, 1.485217, -0.9190423, 1, 1, 1, 1, 1,
-0.5569999, 0.8566361, -0.8237116, 1, 1, 1, 1, 1,
-0.556662, 0.3080754, -4.075151, 1, 1, 1, 1, 1,
-0.5547478, 0.9517815, -1.469019, 1, 1, 1, 1, 1,
-0.5535186, 0.7446167, 1.098155, 1, 1, 1, 1, 1,
-0.5469952, -0.1025473, -1.848387, 1, 1, 1, 1, 1,
-0.5456914, -0.8342503, -1.574809, 1, 1, 1, 1, 1,
-0.5432903, -0.002195438, -0.106996, 1, 1, 1, 1, 1,
-0.5378276, 0.3441663, -1.46831, 1, 1, 1, 1, 1,
-0.5362325, 1.558372, -1.615372, 1, 1, 1, 1, 1,
-0.5362013, 1.444575, -0.2474551, 1, 1, 1, 1, 1,
-0.5322101, -0.5449623, -3.173424, 1, 1, 1, 1, 1,
-0.5310603, 0.8304046, -0.4362909, 1, 1, 1, 1, 1,
-0.5275449, 1.170345, -1.041116, 1, 1, 1, 1, 1,
-0.5129734, -1.912663, -3.988765, 0, 0, 1, 1, 1,
-0.5089694, -0.9243247, -0.5501919, 1, 0, 0, 1, 1,
-0.4957761, -0.5082237, -2.631848, 1, 0, 0, 1, 1,
-0.4919478, -0.2321275, -0.9181825, 1, 0, 0, 1, 1,
-0.4894835, 2.732024, -0.9680806, 1, 0, 0, 1, 1,
-0.4878801, 0.256728, -0.9730807, 1, 0, 0, 1, 1,
-0.4866075, 1.371214, -0.3679569, 0, 0, 0, 1, 1,
-0.4853017, -0.52719, -3.043862, 0, 0, 0, 1, 1,
-0.483873, -1.533013, -3.547948, 0, 0, 0, 1, 1,
-0.48079, -0.5062139, -0.893503, 0, 0, 0, 1, 1,
-0.4800411, -0.2197694, -2.45389, 0, 0, 0, 1, 1,
-0.4775368, 0.7138997, -3.328511, 0, 0, 0, 1, 1,
-0.4707, 0.04974108, -0.9970748, 0, 0, 0, 1, 1,
-0.4692849, 0.2196253, -2.750621, 1, 1, 1, 1, 1,
-0.4691235, -1.37609, -1.160346, 1, 1, 1, 1, 1,
-0.4685901, -1.091051, -0.9532288, 1, 1, 1, 1, 1,
-0.4664394, 0.4549876, -2.150201, 1, 1, 1, 1, 1,
-0.465912, 1.044947, -2.259123, 1, 1, 1, 1, 1,
-0.4584273, 0.7631544, 1.234195, 1, 1, 1, 1, 1,
-0.4576986, -0.7410971, -2.323655, 1, 1, 1, 1, 1,
-0.4565825, -0.1769532, -1.820034, 1, 1, 1, 1, 1,
-0.4560045, -0.01999381, -0.6768898, 1, 1, 1, 1, 1,
-0.4506578, 1.263006, 0.8087903, 1, 1, 1, 1, 1,
-0.4503364, 0.5679464, -1.519464, 1, 1, 1, 1, 1,
-0.4493843, 0.03678196, -0.8136421, 1, 1, 1, 1, 1,
-0.4492691, -0.1390521, -1.92335, 1, 1, 1, 1, 1,
-0.4483518, 0.6304295, -0.130375, 1, 1, 1, 1, 1,
-0.4481977, 0.7831383, -1.236559, 1, 1, 1, 1, 1,
-0.4455122, -0.2409781, -1.882278, 0, 0, 1, 1, 1,
-0.4448328, -0.115736, -2.443445, 1, 0, 0, 1, 1,
-0.4432935, -0.1903272, -1.728154, 1, 0, 0, 1, 1,
-0.4420278, -1.177151, -3.857011, 1, 0, 0, 1, 1,
-0.4411846, -0.3128448, -0.410788, 1, 0, 0, 1, 1,
-0.4407862, 0.483433, -0.5424682, 1, 0, 0, 1, 1,
-0.4349347, 0.7053172, 0.534707, 0, 0, 0, 1, 1,
-0.4344103, -0.7059912, -1.555127, 0, 0, 0, 1, 1,
-0.4279602, 0.7191737, 0.3398737, 0, 0, 0, 1, 1,
-0.4251144, -0.04899336, -0.6213716, 0, 0, 0, 1, 1,
-0.4250709, 0.8943388, -1.368445, 0, 0, 0, 1, 1,
-0.4218647, -0.7013817, -1.160894, 0, 0, 0, 1, 1,
-0.4201366, -0.5140505, -1.037485, 0, 0, 0, 1, 1,
-0.4192143, -1.182277, -2.227308, 1, 1, 1, 1, 1,
-0.4186449, 0.5630016, -1.114333, 1, 1, 1, 1, 1,
-0.4156368, -0.5033447, -2.459193, 1, 1, 1, 1, 1,
-0.4155528, 0.02821835, -1.696458, 1, 1, 1, 1, 1,
-0.4139292, 1.647224, -0.3410693, 1, 1, 1, 1, 1,
-0.4135213, -1.382877, -2.625333, 1, 1, 1, 1, 1,
-0.4115352, -0.6923712, -2.272557, 1, 1, 1, 1, 1,
-0.4112883, 1.45156, 0.1456759, 1, 1, 1, 1, 1,
-0.4106489, -0.2779282, -5.092069, 1, 1, 1, 1, 1,
-0.4099813, 0.6996695, 0.2906072, 1, 1, 1, 1, 1,
-0.4086816, -0.7430672, -1.916464, 1, 1, 1, 1, 1,
-0.4038502, -0.6018618, -2.4598, 1, 1, 1, 1, 1,
-0.3991102, 1.188404, -0.3364741, 1, 1, 1, 1, 1,
-0.3989713, 0.6129179, -0.4733262, 1, 1, 1, 1, 1,
-0.3987284, -0.8170207, -1.23794, 1, 1, 1, 1, 1,
-0.3896455, 0.1514732, -1.080555, 0, 0, 1, 1, 1,
-0.3889355, 0.4560038, -2.989534, 1, 0, 0, 1, 1,
-0.3871367, 0.9407473, -1.01882, 1, 0, 0, 1, 1,
-0.3853676, 0.8880695, -1.864295, 1, 0, 0, 1, 1,
-0.3853054, -1.178391, -2.922951, 1, 0, 0, 1, 1,
-0.3822685, -0.05381527, -1.46745, 1, 0, 0, 1, 1,
-0.3816767, 0.5010493, 1.406682, 0, 0, 0, 1, 1,
-0.3809521, 2.056842, -2.961745, 0, 0, 0, 1, 1,
-0.3757687, 0.9766021, -0.5592285, 0, 0, 0, 1, 1,
-0.3746392, 0.07546059, -1.220097, 0, 0, 0, 1, 1,
-0.3670703, 0.1173991, -0.4738437, 0, 0, 0, 1, 1,
-0.3620061, -1.794823, -1.494037, 0, 0, 0, 1, 1,
-0.3611716, 2.142365, 0.8861638, 0, 0, 0, 1, 1,
-0.3576491, -1.314156, -2.328264, 1, 1, 1, 1, 1,
-0.3574308, 0.719951, -1.17233, 1, 1, 1, 1, 1,
-0.347522, 2.000693, 1.166564, 1, 1, 1, 1, 1,
-0.3440622, 1.986741, -1.426956, 1, 1, 1, 1, 1,
-0.3400861, 0.07702664, -1.626292, 1, 1, 1, 1, 1,
-0.3312336, 0.3897595, 0.4797949, 1, 1, 1, 1, 1,
-0.3232246, 0.9929393, -0.03703407, 1, 1, 1, 1, 1,
-0.3224121, -0.5672422, -1.914176, 1, 1, 1, 1, 1,
-0.319315, 0.9241388, -1.25065, 1, 1, 1, 1, 1,
-0.3115545, 0.4171883, -1.293692, 1, 1, 1, 1, 1,
-0.3097792, -1.554276, -2.550753, 1, 1, 1, 1, 1,
-0.3066046, 0.7916474, -0.1455794, 1, 1, 1, 1, 1,
-0.3062688, -2.411861, -4.037425, 1, 1, 1, 1, 1,
-0.3055916, -0.01421236, -1.794716, 1, 1, 1, 1, 1,
-0.3039207, 1.048807, -0.5604444, 1, 1, 1, 1, 1,
-0.2956079, -0.8916211, -1.066406, 0, 0, 1, 1, 1,
-0.293184, -0.1924236, -1.961691, 1, 0, 0, 1, 1,
-0.2912056, 0.9083591, 0.01937268, 1, 0, 0, 1, 1,
-0.2841606, -1.056517, -3.891965, 1, 0, 0, 1, 1,
-0.2831361, 1.403016, -0.9512786, 1, 0, 0, 1, 1,
-0.2753944, -0.3042043, -1.692015, 1, 0, 0, 1, 1,
-0.2737176, 0.7278745, -0.136748, 0, 0, 0, 1, 1,
-0.2656634, 0.7474614, -1.520578, 0, 0, 0, 1, 1,
-0.2646729, 0.2779728, -0.9577906, 0, 0, 0, 1, 1,
-0.2587556, 0.7950854, 2.717242, 0, 0, 0, 1, 1,
-0.2560928, 0.7197188, 0.05202341, 0, 0, 0, 1, 1,
-0.2548119, -0.8327774, -2.489981, 0, 0, 0, 1, 1,
-0.2525828, -0.02765145, -0.6329548, 0, 0, 0, 1, 1,
-0.248961, -2.492931, -3.814612, 1, 1, 1, 1, 1,
-0.2386719, 0.07292549, -1.100849, 1, 1, 1, 1, 1,
-0.237596, 0.2143095, -2.186146, 1, 1, 1, 1, 1,
-0.2260711, 1.775293, 0.955585, 1, 1, 1, 1, 1,
-0.2207197, 0.8250005, -0.4602348, 1, 1, 1, 1, 1,
-0.2162174, -0.1934078, -1.073704, 1, 1, 1, 1, 1,
-0.2069856, -1.443642, -3.229134, 1, 1, 1, 1, 1,
-0.1996052, 0.1367373, -0.9668218, 1, 1, 1, 1, 1,
-0.1969171, 0.6086594, -0.73235, 1, 1, 1, 1, 1,
-0.1963908, -1.848946, -1.701594, 1, 1, 1, 1, 1,
-0.1916364, 0.6032165, -0.0781761, 1, 1, 1, 1, 1,
-0.1824933, 0.6836622, -1.862214, 1, 1, 1, 1, 1,
-0.1794496, 1.339616, 0.5366485, 1, 1, 1, 1, 1,
-0.1791524, 1.238843, 0.4207771, 1, 1, 1, 1, 1,
-0.1784133, 0.6765758, 0.3617583, 1, 1, 1, 1, 1,
-0.175385, -0.9375428, -3.783298, 0, 0, 1, 1, 1,
-0.1751535, -2.27239, -2.81813, 1, 0, 0, 1, 1,
-0.1746313, 0.06575481, 1.186602, 1, 0, 0, 1, 1,
-0.1698006, 0.6090583, 0.9315854, 1, 0, 0, 1, 1,
-0.1686875, 0.2035331, -0.5266665, 1, 0, 0, 1, 1,
-0.1671198, -1.029487, -1.254887, 1, 0, 0, 1, 1,
-0.1659594, 0.6837237, 0.3940678, 0, 0, 0, 1, 1,
-0.1637082, -0.05493316, -2.07763, 0, 0, 0, 1, 1,
-0.1630159, -0.01821239, -2.028746, 0, 0, 0, 1, 1,
-0.1629233, 0.8915332, -0.8729042, 0, 0, 0, 1, 1,
-0.1624759, -1.343083, -3.103621, 0, 0, 0, 1, 1,
-0.1582944, -1.140244, -4.173202, 0, 0, 0, 1, 1,
-0.1570941, 0.5771288, 0.1740399, 0, 0, 0, 1, 1,
-0.1540412, -0.2248832, -2.317979, 1, 1, 1, 1, 1,
-0.1520952, 2.611829, -1.527902, 1, 1, 1, 1, 1,
-0.1469571, 1.287605, 0.4823939, 1, 1, 1, 1, 1,
-0.1369798, 0.3296706, -1.187077, 1, 1, 1, 1, 1,
-0.1350002, 2.227878, 0.07211813, 1, 1, 1, 1, 1,
-0.1348444, 0.6825107, -1.914383, 1, 1, 1, 1, 1,
-0.1345665, -1.298759, -1.239439, 1, 1, 1, 1, 1,
-0.1321275, 0.766178, 0.07913381, 1, 1, 1, 1, 1,
-0.1319683, -1.498316, -4.184728, 1, 1, 1, 1, 1,
-0.1301843, 0.9837871, 0.8333338, 1, 1, 1, 1, 1,
-0.1300759, 2.672541, 0.2805983, 1, 1, 1, 1, 1,
-0.1256203, 0.04027208, -0.3243587, 1, 1, 1, 1, 1,
-0.122752, -1.115874, -3.807605, 1, 1, 1, 1, 1,
-0.1188779, -0.7847905, -3.858171, 1, 1, 1, 1, 1,
-0.1114951, 0.1535764, -2.311162, 1, 1, 1, 1, 1,
-0.1111012, 0.8786222, 0.6505971, 0, 0, 1, 1, 1,
-0.1109922, -0.4301482, -3.640891, 1, 0, 0, 1, 1,
-0.1095244, -1.021421, -0.7546442, 1, 0, 0, 1, 1,
-0.1030868, 0.9783649, -2.075202, 1, 0, 0, 1, 1,
-0.09621836, -2.296054, -2.85784, 1, 0, 0, 1, 1,
-0.08991547, -0.2128307, -3.185098, 1, 0, 0, 1, 1,
-0.08970957, -1.061509, -2.669061, 0, 0, 0, 1, 1,
-0.08898374, 0.5156873, -0.494105, 0, 0, 0, 1, 1,
-0.08704619, 0.6801995, 2.078783, 0, 0, 0, 1, 1,
-0.08001509, -0.6636197, -2.780232, 0, 0, 0, 1, 1,
-0.07905907, 0.6390398, -0.3368882, 0, 0, 0, 1, 1,
-0.07479072, -0.354902, -2.406455, 0, 0, 0, 1, 1,
-0.07395156, -0.5311691, -2.017041, 0, 0, 0, 1, 1,
-0.07286528, 0.3826657, -0.1313593, 1, 1, 1, 1, 1,
-0.07210377, 0.1225938, 0.1360757, 1, 1, 1, 1, 1,
-0.07069708, 0.117569, -1.348825, 1, 1, 1, 1, 1,
-0.06751513, 1.039404, 0.4178039, 1, 1, 1, 1, 1,
-0.0644954, -0.2866414, -2.714863, 1, 1, 1, 1, 1,
-0.0595892, -1.238505, -4.421506, 1, 1, 1, 1, 1,
-0.05836719, 1.152365, -0.8226516, 1, 1, 1, 1, 1,
-0.05745761, 0.6819224, -1.223295, 1, 1, 1, 1, 1,
-0.05083565, 0.6561406, -1.910078, 1, 1, 1, 1, 1,
-0.04906354, -1.947397, -3.526963, 1, 1, 1, 1, 1,
-0.04700866, 0.5945681, -1.848732, 1, 1, 1, 1, 1,
-0.046641, 0.4074033, -0.3808461, 1, 1, 1, 1, 1,
-0.04615222, 0.4303456, -0.2828693, 1, 1, 1, 1, 1,
-0.04336473, -0.9323608, -4.689999, 1, 1, 1, 1, 1,
-0.04327821, 2.444105, 0.2554254, 1, 1, 1, 1, 1,
-0.04099505, 0.8859513, -0.1495795, 0, 0, 1, 1, 1,
-0.04015191, 1.986036, -0.3803181, 1, 0, 0, 1, 1,
-0.0399521, -0.5081757, -3.92039, 1, 0, 0, 1, 1,
-0.03945548, -0.6459374, -3.800369, 1, 0, 0, 1, 1,
-0.03327829, -0.08483522, -2.99653, 1, 0, 0, 1, 1,
-0.02876799, -0.5202712, -2.674903, 1, 0, 0, 1, 1,
-0.02664213, -0.3321062, -3.447013, 0, 0, 0, 1, 1,
-0.02412224, -0.9044983, -3.972786, 0, 0, 0, 1, 1,
-0.02045302, -1.569283, -3.363731, 0, 0, 0, 1, 1,
-0.01820902, -0.1237748, -1.11042, 0, 0, 0, 1, 1,
-0.01618152, 0.09160648, 0.07672565, 0, 0, 0, 1, 1,
-0.01473609, 0.6542425, -0.2999652, 0, 0, 0, 1, 1,
-0.01068824, -0.2621614, -5.090763, 0, 0, 0, 1, 1,
-0.009029039, 0.6105004, -0.4462516, 1, 1, 1, 1, 1,
-0.006249675, 2.162008, -3.027321, 1, 1, 1, 1, 1,
-0.004823969, -1.073856, -3.66396, 1, 1, 1, 1, 1,
-0.001039861, -0.5911717, -3.749441, 1, 1, 1, 1, 1,
-6.81953e-05, -0.4599056, -1.455461, 1, 1, 1, 1, 1,
0.0004806279, -0.8268531, 2.218742, 1, 1, 1, 1, 1,
0.001370404, 0.8421999, -0.7753912, 1, 1, 1, 1, 1,
0.001894947, -0.3729861, 1.234535, 1, 1, 1, 1, 1,
0.004701807, 0.1996388, -0.7148705, 1, 1, 1, 1, 1,
0.005609055, 1.705762, 1.003724, 1, 1, 1, 1, 1,
0.008843427, -0.48248, 2.512223, 1, 1, 1, 1, 1,
0.011897, -1.680206, 2.376375, 1, 1, 1, 1, 1,
0.01601053, 0.5720785, -0.0505088, 1, 1, 1, 1, 1,
0.01631283, 1.527252, 0.4142936, 1, 1, 1, 1, 1,
0.01683998, -0.469816, 2.867798, 1, 1, 1, 1, 1,
0.01703025, -0.4183157, 2.476833, 0, 0, 1, 1, 1,
0.02043092, -1.434143, 2.573584, 1, 0, 0, 1, 1,
0.02084367, 0.4685748, -0.1825359, 1, 0, 0, 1, 1,
0.02116234, -0.4529715, 2.113575, 1, 0, 0, 1, 1,
0.02285351, 3.326389, 0.2941959, 1, 0, 0, 1, 1,
0.02548856, -1.331379, 2.997815, 1, 0, 0, 1, 1,
0.02714329, 1.425012, -0.2201939, 0, 0, 0, 1, 1,
0.02808611, 0.6420433, -1.554289, 0, 0, 0, 1, 1,
0.03601894, -0.5408598, 3.484465, 0, 0, 0, 1, 1,
0.03791685, -0.4934751, 4.146574, 0, 0, 0, 1, 1,
0.03966915, 0.4686976, -0.9607059, 0, 0, 0, 1, 1,
0.04142748, -1.942847, 4.517789, 0, 0, 0, 1, 1,
0.04532352, -0.2700469, 2.799432, 0, 0, 0, 1, 1,
0.04692279, 0.395387, -0.2817513, 1, 1, 1, 1, 1,
0.04994008, 1.174087, 0.7504997, 1, 1, 1, 1, 1,
0.05947148, -0.8933663, 2.80073, 1, 1, 1, 1, 1,
0.05976734, 1.442351, 1.063295, 1, 1, 1, 1, 1,
0.06360525, 1.530821, -0.1889606, 1, 1, 1, 1, 1,
0.06735431, 0.7748697, -0.2981837, 1, 1, 1, 1, 1,
0.06896414, -0.8286316, 1.910927, 1, 1, 1, 1, 1,
0.0695236, -2.391738, 2.705986, 1, 1, 1, 1, 1,
0.07169341, 0.6348972, -0.2824737, 1, 1, 1, 1, 1,
0.07557948, -1.248683, 2.132985, 1, 1, 1, 1, 1,
0.07566453, 1.777198, -0.506465, 1, 1, 1, 1, 1,
0.07579409, -0.2405567, 2.285646, 1, 1, 1, 1, 1,
0.07851851, -2.226388, 1.33045, 1, 1, 1, 1, 1,
0.08083237, 0.4841859, 0.8388166, 1, 1, 1, 1, 1,
0.08115189, -0.1842744, 2.215961, 1, 1, 1, 1, 1,
0.08543759, 0.277974, 0.5352601, 0, 0, 1, 1, 1,
0.0857345, -2.000865, 1.362324, 1, 0, 0, 1, 1,
0.08791424, -0.7254155, 4.262839, 1, 0, 0, 1, 1,
0.0889716, -0.2311281, 4.697057, 1, 0, 0, 1, 1,
0.08905544, 0.1443937, 1.153207, 1, 0, 0, 1, 1,
0.09099721, 0.6858242, -2.555153, 1, 0, 0, 1, 1,
0.09599019, 1.373858, -0.7511311, 0, 0, 0, 1, 1,
0.1052392, -1.598082, 3.038985, 0, 0, 0, 1, 1,
0.106225, 0.2563849, 2.23246, 0, 0, 0, 1, 1,
0.1087861, -1.565244, 2.327726, 0, 0, 0, 1, 1,
0.1152687, 1.976829, -0.2263395, 0, 0, 0, 1, 1,
0.115327, -0.9625133, 4.51563, 0, 0, 0, 1, 1,
0.1154737, 0.3682136, -1.502522, 0, 0, 0, 1, 1,
0.1161444, -1.088682, 2.762971, 1, 1, 1, 1, 1,
0.1186042, -0.4111277, 1.945899, 1, 1, 1, 1, 1,
0.1226813, 0.1165233, 1.621936, 1, 1, 1, 1, 1,
0.1240587, -1.302228, 1.987809, 1, 1, 1, 1, 1,
0.1260868, -1.071021, 1.143605, 1, 1, 1, 1, 1,
0.1267765, 0.5878338, 0.9110085, 1, 1, 1, 1, 1,
0.1297079, -1.25159, 4.021175, 1, 1, 1, 1, 1,
0.1350132, 0.1846385, 0.6104166, 1, 1, 1, 1, 1,
0.1367966, 0.7245405, 0.5612528, 1, 1, 1, 1, 1,
0.1369781, 0.09050285, 1.009674, 1, 1, 1, 1, 1,
0.1372759, -0.595619, 4.151416, 1, 1, 1, 1, 1,
0.1418651, 1.87028, 1.3905, 1, 1, 1, 1, 1,
0.1429034, 1.229147, 1.180467, 1, 1, 1, 1, 1,
0.1435865, -1.893723, 3.204363, 1, 1, 1, 1, 1,
0.1479539, -1.367955, 3.852281, 1, 1, 1, 1, 1,
0.148978, 0.1848814, -0.9462493, 0, 0, 1, 1, 1,
0.1497181, 1.133357, -0.7406387, 1, 0, 0, 1, 1,
0.1506517, -0.9938422, 2.742488, 1, 0, 0, 1, 1,
0.1541207, -0.7831867, 1.760675, 1, 0, 0, 1, 1,
0.1560298, 0.4173776, 0.456917, 1, 0, 0, 1, 1,
0.1566165, -0.2183841, 1.799399, 1, 0, 0, 1, 1,
0.1597024, 0.5588577, 0.4174524, 0, 0, 0, 1, 1,
0.1626873, 1.299567, -1.317205, 0, 0, 0, 1, 1,
0.1648588, -2.016705, 2.355841, 0, 0, 0, 1, 1,
0.1694034, 0.0690794, 2.835327, 0, 0, 0, 1, 1,
0.169646, 0.8878886, -0.3252895, 0, 0, 0, 1, 1,
0.1715258, 0.4491623, 1.764805, 0, 0, 0, 1, 1,
0.172962, -1.099526, 3.322727, 0, 0, 0, 1, 1,
0.1736238, -0.1492935, 3.422793, 1, 1, 1, 1, 1,
0.1748204, 0.2482157, 1.986752, 1, 1, 1, 1, 1,
0.1762349, -0.3808754, 2.920116, 1, 1, 1, 1, 1,
0.1769888, 0.1031685, 0.06457608, 1, 1, 1, 1, 1,
0.1810198, 1.020508, -0.2914243, 1, 1, 1, 1, 1,
0.1825621, -0.0120667, -1.283244, 1, 1, 1, 1, 1,
0.1856674, 0.6924441, -0.2799362, 1, 1, 1, 1, 1,
0.1886743, -0.7174759, 2.155511, 1, 1, 1, 1, 1,
0.1930041, -0.5396246, 3.399266, 1, 1, 1, 1, 1,
0.1951436, 0.6269417, 0.2404126, 1, 1, 1, 1, 1,
0.1952167, 1.39961, 0.08337234, 1, 1, 1, 1, 1,
0.1988225, -0.1169719, 0.8986937, 1, 1, 1, 1, 1,
0.2040279, 1.005505, -0.8135342, 1, 1, 1, 1, 1,
0.2044436, 0.1970626, -0.001053295, 1, 1, 1, 1, 1,
0.212099, 0.7506689, 1.232241, 1, 1, 1, 1, 1,
0.2128782, -0.2074626, 3.338274, 0, 0, 1, 1, 1,
0.2148471, 0.3630395, -0.00855347, 1, 0, 0, 1, 1,
0.2172455, 0.8028424, 0.6039921, 1, 0, 0, 1, 1,
0.2173844, -1.058654, 1.797897, 1, 0, 0, 1, 1,
0.221883, 1.265182, 0.6307843, 1, 0, 0, 1, 1,
0.2249725, -0.4763751, 2.155539, 1, 0, 0, 1, 1,
0.2265983, 0.9050627, -0.4512977, 0, 0, 0, 1, 1,
0.2266667, -0.8528203, 2.985809, 0, 0, 0, 1, 1,
0.2299096, -1.499729, 4.027807, 0, 0, 0, 1, 1,
0.2305046, 0.5941224, 1.553299, 0, 0, 0, 1, 1,
0.2306356, 0.2138382, -1.612468, 0, 0, 0, 1, 1,
0.2336099, 1.560255, 1.026315, 0, 0, 0, 1, 1,
0.234571, -0.2766811, 1.345823, 0, 0, 0, 1, 1,
0.2380513, 0.443894, 1.617981, 1, 1, 1, 1, 1,
0.2448463, 0.2945681, 0.1763079, 1, 1, 1, 1, 1,
0.2498723, -0.672298, 2.077316, 1, 1, 1, 1, 1,
0.2515558, 0.5558161, 0.4869972, 1, 1, 1, 1, 1,
0.2565736, 0.559633, 1.16339, 1, 1, 1, 1, 1,
0.2605281, -1.087865, 3.839099, 1, 1, 1, 1, 1,
0.2637864, 0.2151472, 2.017717, 1, 1, 1, 1, 1,
0.2651856, 0.6306781, 1.20828, 1, 1, 1, 1, 1,
0.2674091, -1.003199, 2.771811, 1, 1, 1, 1, 1,
0.2726435, 1.199756, -0.6940689, 1, 1, 1, 1, 1,
0.274511, 0.7814195, 0.1094808, 1, 1, 1, 1, 1,
0.2747327, 0.818418, -0.7769527, 1, 1, 1, 1, 1,
0.2768301, -1.124362, 2.823545, 1, 1, 1, 1, 1,
0.2777044, 2.255246, -0.4931977, 1, 1, 1, 1, 1,
0.2792458, -0.599198, 2.756437, 1, 1, 1, 1, 1,
0.2825779, 0.4426048, 2.064646, 0, 0, 1, 1, 1,
0.2826826, 0.3871134, 0.1534448, 1, 0, 0, 1, 1,
0.2845157, -2.476847, 1.192129, 1, 0, 0, 1, 1,
0.2890365, -1.137799, 2.122447, 1, 0, 0, 1, 1,
0.292991, -0.5354176, 3.946564, 1, 0, 0, 1, 1,
0.2999432, -1.834756, 2.496318, 1, 0, 0, 1, 1,
0.3023038, -1.354338, 2.913062, 0, 0, 0, 1, 1,
0.3042268, -0.3513414, 1.358008, 0, 0, 0, 1, 1,
0.3079577, 0.8757169, -1.300307, 0, 0, 0, 1, 1,
0.3080422, -1.129309, 4.488545, 0, 0, 0, 1, 1,
0.3121558, 2.093782, -0.9339097, 0, 0, 0, 1, 1,
0.3127688, 0.1579961, 0.2817021, 0, 0, 0, 1, 1,
0.3170016, 0.194091, 0.8893403, 0, 0, 0, 1, 1,
0.3182569, 0.6419655, 1.209953, 1, 1, 1, 1, 1,
0.3192064, -1.534155, 4.74428, 1, 1, 1, 1, 1,
0.3203453, -0.885114, 2.286423, 1, 1, 1, 1, 1,
0.3221359, -0.7432437, 1.91732, 1, 1, 1, 1, 1,
0.3253824, -0.2498224, 3.438914, 1, 1, 1, 1, 1,
0.3264003, 1.311401, 1.116473, 1, 1, 1, 1, 1,
0.3268941, 0.1817987, -0.06168221, 1, 1, 1, 1, 1,
0.3278727, -1.340915, 0.7617996, 1, 1, 1, 1, 1,
0.3284729, -1.4973, 4.571845, 1, 1, 1, 1, 1,
0.3294489, -0.9977441, 4.128232, 1, 1, 1, 1, 1,
0.3306222, 0.57669, -0.9465877, 1, 1, 1, 1, 1,
0.3310124, -1.066574, 3.850136, 1, 1, 1, 1, 1,
0.3313566, 0.07961508, 0.2443077, 1, 1, 1, 1, 1,
0.3313877, -0.3029381, 1.334217, 1, 1, 1, 1, 1,
0.3323514, 0.629801, 0.2418978, 1, 1, 1, 1, 1,
0.3337935, 1.080069, 0.6532956, 0, 0, 1, 1, 1,
0.3342228, 3.155046, -0.708096, 1, 0, 0, 1, 1,
0.3368466, -2.554058, 1.970657, 1, 0, 0, 1, 1,
0.3438997, -0.4904696, 2.578883, 1, 0, 0, 1, 1,
0.3441878, -0.3632727, 3.349607, 1, 0, 0, 1, 1,
0.3451191, -0.8972637, 3.263564, 1, 0, 0, 1, 1,
0.3465837, 0.3388067, 0.5255536, 0, 0, 0, 1, 1,
0.349391, 0.7034532, 0.8950352, 0, 0, 0, 1, 1,
0.3525901, 0.06245666, 0.7234446, 0, 0, 0, 1, 1,
0.3576733, 0.5605055, 0.6505914, 0, 0, 0, 1, 1,
0.3593981, -0.5665352, 1.224629, 0, 0, 0, 1, 1,
0.3622946, 1.505914, -0.3515695, 0, 0, 0, 1, 1,
0.3641063, 1.787993, -0.04627296, 0, 0, 0, 1, 1,
0.3645137, -0.07308776, 0.6245126, 1, 1, 1, 1, 1,
0.3675548, 0.3505353, 1.930133, 1, 1, 1, 1, 1,
0.3713143, -2.46422, 3.26371, 1, 1, 1, 1, 1,
0.3735342, 1.44619, 0.3515375, 1, 1, 1, 1, 1,
0.3745623, -0.8109062, 1.680996, 1, 1, 1, 1, 1,
0.3839381, -0.2838366, 1.575229, 1, 1, 1, 1, 1,
0.3864712, -0.5940942, 1.8574, 1, 1, 1, 1, 1,
0.389794, -0.8045188, 1.609111, 1, 1, 1, 1, 1,
0.3912937, 0.9699199, 1.848538, 1, 1, 1, 1, 1,
0.3919536, -0.9323354, 2.723517, 1, 1, 1, 1, 1,
0.3927458, -0.7781608, 4.275884, 1, 1, 1, 1, 1,
0.3939513, 0.910206, 2.39714, 1, 1, 1, 1, 1,
0.3988937, 0.4820367, 0.1280252, 1, 1, 1, 1, 1,
0.3995166, 0.8210346, 0.1291111, 1, 1, 1, 1, 1,
0.4064634, 0.6844866, 0.6387973, 1, 1, 1, 1, 1,
0.4083475, -0.02821644, 3.607726, 0, 0, 1, 1, 1,
0.409972, 0.2180866, -0.1239187, 1, 0, 0, 1, 1,
0.4130148, -0.6727815, 1.807324, 1, 0, 0, 1, 1,
0.4142594, -0.6251978, 2.795102, 1, 0, 0, 1, 1,
0.4145652, 2.085618, -0.2581753, 1, 0, 0, 1, 1,
0.4177602, 0.8759038, -0.9539961, 1, 0, 0, 1, 1,
0.4184629, 0.6748144, 2.071368, 0, 0, 0, 1, 1,
0.4190258, 0.6809024, 0.5148265, 0, 0, 0, 1, 1,
0.4266908, 0.6673944, 0.4404696, 0, 0, 0, 1, 1,
0.4284814, 1.56531, 3.101319, 0, 0, 0, 1, 1,
0.4294764, -0.2616397, 1.290389, 0, 0, 0, 1, 1,
0.4350431, -0.3027021, 3.549601, 0, 0, 0, 1, 1,
0.4367779, 0.427219, -0.5085974, 0, 0, 0, 1, 1,
0.441406, 0.4791469, 0.7673444, 1, 1, 1, 1, 1,
0.442214, 0.09479406, 0.943423, 1, 1, 1, 1, 1,
0.4457168, -1.851352, 1.595096, 1, 1, 1, 1, 1,
0.4482549, 0.2635176, 1.05795, 1, 1, 1, 1, 1,
0.4491973, 0.07385415, 2.020839, 1, 1, 1, 1, 1,
0.4495873, -2.033146, 4.612768, 1, 1, 1, 1, 1,
0.4519136, 0.1544178, -1.691178, 1, 1, 1, 1, 1,
0.4606012, -0.6453426, 2.263075, 1, 1, 1, 1, 1,
0.4643385, 0.5609776, -0.1038063, 1, 1, 1, 1, 1,
0.4665054, 0.6129587, 1.359992, 1, 1, 1, 1, 1,
0.4744078, -0.2407229, 3.727894, 1, 1, 1, 1, 1,
0.4760212, 0.4771222, 1.013421, 1, 1, 1, 1, 1,
0.4788487, 0.7410638, -0.8418795, 1, 1, 1, 1, 1,
0.4800656, -0.7811409, 4.145792, 1, 1, 1, 1, 1,
0.4810822, 1.860239, -0.02246157, 1, 1, 1, 1, 1,
0.4872604, 0.2911217, 1.097815, 0, 0, 1, 1, 1,
0.487682, -0.1718915, 0.8927292, 1, 0, 0, 1, 1,
0.4888896, 0.9181789, -1.258345, 1, 0, 0, 1, 1,
0.4968818, -0.6299071, 0.7544826, 1, 0, 0, 1, 1,
0.498633, -0.6426934, 1.89829, 1, 0, 0, 1, 1,
0.4992624, -1.275944, 1.818823, 1, 0, 0, 1, 1,
0.4997615, -0.2870476, 2.968194, 0, 0, 0, 1, 1,
0.501954, 0.1651626, 1.651448, 0, 0, 0, 1, 1,
0.5029985, 0.6050456, -0.3558432, 0, 0, 0, 1, 1,
0.5039613, 2.015589, 0.9423013, 0, 0, 0, 1, 1,
0.5091964, 0.6849449, 0.158809, 0, 0, 0, 1, 1,
0.5182413, 0.5879279, 0.563565, 0, 0, 0, 1, 1,
0.5262763, -1.626287, 3.686841, 0, 0, 0, 1, 1,
0.5281407, 1.114665, -0.03032491, 1, 1, 1, 1, 1,
0.5282713, -0.2258866, 2.68872, 1, 1, 1, 1, 1,
0.5295317, -1.16317, 2.615808, 1, 1, 1, 1, 1,
0.5295944, 0.391852, 1.924608, 1, 1, 1, 1, 1,
0.536191, 0.9556464, 2.121303, 1, 1, 1, 1, 1,
0.5378695, -0.829114, 3.162674, 1, 1, 1, 1, 1,
0.5428865, -1.882329, 2.655213, 1, 1, 1, 1, 1,
0.5440336, 0.6366245, 1.970068, 1, 1, 1, 1, 1,
0.5527449, -1.51938, 1.777232, 1, 1, 1, 1, 1,
0.5553764, -2.009315, 3.629424, 1, 1, 1, 1, 1,
0.5580287, -0.07255905, 1.868487, 1, 1, 1, 1, 1,
0.5643277, -0.365219, 3.133373, 1, 1, 1, 1, 1,
0.564349, 0.2815555, 0.8159112, 1, 1, 1, 1, 1,
0.5723549, -0.2686816, 1.75146, 1, 1, 1, 1, 1,
0.5753589, -2.112964, 2.786188, 1, 1, 1, 1, 1,
0.5773253, -1.831558, 3.702528, 0, 0, 1, 1, 1,
0.577523, -0.08319237, 0.4676117, 1, 0, 0, 1, 1,
0.5813891, 0.01105484, 3.111019, 1, 0, 0, 1, 1,
0.5869224, 1.581758, -2.932647, 1, 0, 0, 1, 1,
0.5876172, 0.6291596, 1.542174, 1, 0, 0, 1, 1,
0.5919892, -0.2383119, 1.066382, 1, 0, 0, 1, 1,
0.5930865, -1.210337, 1.446518, 0, 0, 0, 1, 1,
0.5954803, 1.486336, -1.634145, 0, 0, 0, 1, 1,
0.5963896, 0.4089172, -0.09909208, 0, 0, 0, 1, 1,
0.6008587, 0.903865, -0.7716852, 0, 0, 0, 1, 1,
0.6023225, 0.1844125, -0.1075959, 0, 0, 0, 1, 1,
0.602883, -1.234668, 4.039059, 0, 0, 0, 1, 1,
0.6076752, 0.4036303, 1.652313, 0, 0, 0, 1, 1,
0.609463, -0.8876647, 2.802455, 1, 1, 1, 1, 1,
0.61006, 0.6668813, 0.192446, 1, 1, 1, 1, 1,
0.6122299, 0.2188463, 0.7970811, 1, 1, 1, 1, 1,
0.6192064, -0.5607992, 2.676933, 1, 1, 1, 1, 1,
0.6194825, -0.814887, 3.062259, 1, 1, 1, 1, 1,
0.620118, 1.616334, 0.8790624, 1, 1, 1, 1, 1,
0.6211918, -1.256248, 3.358448, 1, 1, 1, 1, 1,
0.6244764, 1.571509, 1.895506, 1, 1, 1, 1, 1,
0.6276075, -0.7549819, 3.759129, 1, 1, 1, 1, 1,
0.6283257, 1.689047, -0.701201, 1, 1, 1, 1, 1,
0.630454, -0.672932, 1.892123, 1, 1, 1, 1, 1,
0.6308005, -0.6378545, 1.922528, 1, 1, 1, 1, 1,
0.6314981, -0.290531, 0.3367636, 1, 1, 1, 1, 1,
0.6380639, 0.02618156, 1.247921, 1, 1, 1, 1, 1,
0.6384486, 0.5379627, 2.06425, 1, 1, 1, 1, 1,
0.6406879, -0.739568, 2.813308, 0, 0, 1, 1, 1,
0.6447569, -0.5526645, 1.142986, 1, 0, 0, 1, 1,
0.6459657, -0.1419289, 3.394726, 1, 0, 0, 1, 1,
0.6475996, -1.259911, 3.304968, 1, 0, 0, 1, 1,
0.6477302, 2.093949, 1.739846, 1, 0, 0, 1, 1,
0.6576901, 0.09083693, 0.6091322, 1, 0, 0, 1, 1,
0.6598545, 0.589176, -0.01773068, 0, 0, 0, 1, 1,
0.6619236, 0.1920252, 1.317398, 0, 0, 0, 1, 1,
0.6654985, -0.5258348, 3.230291, 0, 0, 0, 1, 1,
0.6655141, -0.3606749, 1.888385, 0, 0, 0, 1, 1,
0.666838, 0.4549004, 1.193661, 0, 0, 0, 1, 1,
0.6692113, 1.640306, -0.4484965, 0, 0, 0, 1, 1,
0.6704871, -0.4012772, 3.228266, 0, 0, 0, 1, 1,
0.6707128, 0.3468943, -0.236246, 1, 1, 1, 1, 1,
0.6776512, -1.262541, 3.625319, 1, 1, 1, 1, 1,
0.683771, 1.0125, 1.702607, 1, 1, 1, 1, 1,
0.6847304, -0.05887039, -0.1918645, 1, 1, 1, 1, 1,
0.685158, -0.3936188, 1.870698, 1, 1, 1, 1, 1,
0.6999963, -1.931671, 3.441318, 1, 1, 1, 1, 1,
0.7094447, -0.6033317, 2.835581, 1, 1, 1, 1, 1,
0.7153866, 0.6402475, 2.120403, 1, 1, 1, 1, 1,
0.7162649, 1.773075, 1.864882, 1, 1, 1, 1, 1,
0.7171736, -1.814638, 4.198362, 1, 1, 1, 1, 1,
0.7204975, 0.8135781, -0.8458083, 1, 1, 1, 1, 1,
0.7271806, 0.198279, 1.45008, 1, 1, 1, 1, 1,
0.7324805, -0.8670124, 4.154318, 1, 1, 1, 1, 1,
0.733232, 1.172413, 0.3347091, 1, 1, 1, 1, 1,
0.7332726, -1.881773, 2.265752, 1, 1, 1, 1, 1,
0.7336965, -0.7737523, 4.277007, 0, 0, 1, 1, 1,
0.7366199, 0.7281842, 1.025167, 1, 0, 0, 1, 1,
0.7389552, -0.50058, 2.496753, 1, 0, 0, 1, 1,
0.7394295, 0.7423195, -0.8812462, 1, 0, 0, 1, 1,
0.7400071, -0.2230042, 2.045511, 1, 0, 0, 1, 1,
0.7448967, 1.371987, 0.5768545, 1, 0, 0, 1, 1,
0.7478561, -0.9431389, 2.402711, 0, 0, 0, 1, 1,
0.7544048, -0.9078588, 2.380328, 0, 0, 0, 1, 1,
0.7563062, 0.3215227, 1.1023, 0, 0, 0, 1, 1,
0.7585591, 0.6506525, 0.3938496, 0, 0, 0, 1, 1,
0.7634135, 0.6044635, 3.685489, 0, 0, 0, 1, 1,
0.7657861, -0.3489851, 1.656784, 0, 0, 0, 1, 1,
0.7661508, -1.138352, 3.119682, 0, 0, 0, 1, 1,
0.7691123, -0.6053756, 3.257781, 1, 1, 1, 1, 1,
0.7712393, 0.5065466, 3.63365, 1, 1, 1, 1, 1,
0.7739749, 0.3786642, 2.459553, 1, 1, 1, 1, 1,
0.7747639, 0.6520578, 1.140198, 1, 1, 1, 1, 1,
0.7756726, -1.195649, 2.735298, 1, 1, 1, 1, 1,
0.7764667, -1.067596, 3.170154, 1, 1, 1, 1, 1,
0.7839537, -0.6757628, 2.867063, 1, 1, 1, 1, 1,
0.7841668, 1.018507, -0.4363074, 1, 1, 1, 1, 1,
0.7866133, 1.42935, -1.329866, 1, 1, 1, 1, 1,
0.7926329, 0.29886, 1.852869, 1, 1, 1, 1, 1,
0.7941515, -1.396845, 2.448244, 1, 1, 1, 1, 1,
0.7955509, 1.778076, 0.9340526, 1, 1, 1, 1, 1,
0.7992609, 1.317474, 1.757848, 1, 1, 1, 1, 1,
0.7998654, 0.5627605, 2.040144, 1, 1, 1, 1, 1,
0.8010724, -0.8326965, 1.901968, 1, 1, 1, 1, 1,
0.8013509, -2.378613, 2.943466, 0, 0, 1, 1, 1,
0.806421, -1.163001, 4.265187, 1, 0, 0, 1, 1,
0.8182841, 1.585853, 0.009316596, 1, 0, 0, 1, 1,
0.818611, -0.7416664, 3.106309, 1, 0, 0, 1, 1,
0.8196853, 1.010531, 1.036055, 1, 0, 0, 1, 1,
0.8208003, 0.2641612, 1.958165, 1, 0, 0, 1, 1,
0.8235214, -0.8175597, 1.961245, 0, 0, 0, 1, 1,
0.8242269, -0.8008628, 3.746098, 0, 0, 0, 1, 1,
0.8255076, -0.4779515, 1.361319, 0, 0, 0, 1, 1,
0.8431634, -0.9911152, 3.614932, 0, 0, 0, 1, 1,
0.8437631, -0.429609, 3.295383, 0, 0, 0, 1, 1,
0.843789, -0.9063789, 1.0516, 0, 0, 0, 1, 1,
0.8446885, -0.131538, 1.510745, 0, 0, 0, 1, 1,
0.8521481, -0.1064063, 2.871052, 1, 1, 1, 1, 1,
0.8531774, -1.217403, 2.507946, 1, 1, 1, 1, 1,
0.853281, -1.686097, 2.727359, 1, 1, 1, 1, 1,
0.8554457, -0.5531122, 0.6946435, 1, 1, 1, 1, 1,
0.8591302, 0.5904038, 2.292194, 1, 1, 1, 1, 1,
0.864991, -0.6964455, 2.598864, 1, 1, 1, 1, 1,
0.8660194, 1.680998, 0.751761, 1, 1, 1, 1, 1,
0.876619, -0.009962758, 1.179967, 1, 1, 1, 1, 1,
0.8864831, 0.2046985, 1.052105, 1, 1, 1, 1, 1,
0.8904573, -0.8046528, 3.470437, 1, 1, 1, 1, 1,
0.8978604, -0.4582642, 3.017431, 1, 1, 1, 1, 1,
0.9027128, -0.6698703, 3.428553, 1, 1, 1, 1, 1,
0.9051382, -0.5225794, 2.524502, 1, 1, 1, 1, 1,
0.9068169, 1.554356, 2.049024, 1, 1, 1, 1, 1,
0.909827, 1.087741, 0.2663468, 1, 1, 1, 1, 1,
0.9131906, -1.567678, 3.459383, 0, 0, 1, 1, 1,
0.9132146, -0.984096, 1.449043, 1, 0, 0, 1, 1,
0.9262573, 1.72513, 0.572691, 1, 0, 0, 1, 1,
0.9368634, -0.3868202, 2.303744, 1, 0, 0, 1, 1,
0.9377345, -0.0538336, 2.772974, 1, 0, 0, 1, 1,
0.9381867, -0.2649585, 0.7986916, 1, 0, 0, 1, 1,
0.9391583, 0.05668668, 2.132413, 0, 0, 0, 1, 1,
0.943396, 0.8749706, -0.9112836, 0, 0, 0, 1, 1,
0.9459903, -1.542356, 1.852193, 0, 0, 0, 1, 1,
0.9504752, -1.780601, 3.325238, 0, 0, 0, 1, 1,
0.9517334, 0.5005791, -1.6623, 0, 0, 0, 1, 1,
0.9600075, 1.570297, 2.079082, 0, 0, 0, 1, 1,
0.9624479, -0.9170777, 3.457111, 0, 0, 0, 1, 1,
0.9662309, -1.202085, 2.432757, 1, 1, 1, 1, 1,
0.967326, -0.841103, -0.319326, 1, 1, 1, 1, 1,
0.9691814, 1.260865, -0.7580187, 1, 1, 1, 1, 1,
0.9693356, -0.4014535, 1.999241, 1, 1, 1, 1, 1,
0.9752783, -0.8161616, 0.591261, 1, 1, 1, 1, 1,
0.9764046, -0.7389936, 4.036262, 1, 1, 1, 1, 1,
0.9770136, -1.358374, 2.746327, 1, 1, 1, 1, 1,
0.9801926, 0.9129986, 0.06793522, 1, 1, 1, 1, 1,
0.9855966, 0.8740634, 1.807195, 1, 1, 1, 1, 1,
0.9863433, 1.470093, 2.083592, 1, 1, 1, 1, 1,
0.9970597, 0.1230502, 2.373538, 1, 1, 1, 1, 1,
0.9984605, -0.7411234, 3.070876, 1, 1, 1, 1, 1,
0.9989459, -1.782169, 2.74309, 1, 1, 1, 1, 1,
1.001359, -0.5582911, 2.443071, 1, 1, 1, 1, 1,
1.003711, -0.3993789, 1.658975, 1, 1, 1, 1, 1,
1.009922, 2.092613, 1.539033, 0, 0, 1, 1, 1,
1.012072, 1.175006, -1.213414, 1, 0, 0, 1, 1,
1.01283, 1.293211, 0.4656082, 1, 0, 0, 1, 1,
1.016323, -0.7076746, 0.8478391, 1, 0, 0, 1, 1,
1.016559, -1.204313, 2.655657, 1, 0, 0, 1, 1,
1.021741, -2.095945, 2.350439, 1, 0, 0, 1, 1,
1.025441, -0.1022068, 0.3622215, 0, 0, 0, 1, 1,
1.035583, -0.1905664, 2.169276, 0, 0, 0, 1, 1,
1.036386, 0.2452377, 1.246441, 0, 0, 0, 1, 1,
1.038649, -1.127962, 2.915645, 0, 0, 0, 1, 1,
1.039818, 0.2966438, 1.777557, 0, 0, 0, 1, 1,
1.041114, -0.7591635, 2.69675, 0, 0, 0, 1, 1,
1.047815, 0.6603429, -1.032345, 0, 0, 0, 1, 1,
1.052635, -2.405749, 2.741144, 1, 1, 1, 1, 1,
1.055868, -0.778356, 1.969249, 1, 1, 1, 1, 1,
1.057568, 0.7166905, -0.371261, 1, 1, 1, 1, 1,
1.060101, 0.8328871, 1.323293, 1, 1, 1, 1, 1,
1.061901, 0.3005698, 2.942865, 1, 1, 1, 1, 1,
1.076025, -0.3839429, 0.667318, 1, 1, 1, 1, 1,
1.077201, 0.291006, 0.4174525, 1, 1, 1, 1, 1,
1.080222, 0.7180888, 0.5900878, 1, 1, 1, 1, 1,
1.080809, -1.085708, 1.425033, 1, 1, 1, 1, 1,
1.083232, -0.02250559, 2.279745, 1, 1, 1, 1, 1,
1.097734, -1.831572, 1.743594, 1, 1, 1, 1, 1,
1.099666, -0.4184895, 2.071259, 1, 1, 1, 1, 1,
1.099687, 0.07899557, -0.9615323, 1, 1, 1, 1, 1,
1.113999, 0.621322, 2.524663, 1, 1, 1, 1, 1,
1.114914, 0.4565461, 1.677224, 1, 1, 1, 1, 1,
1.11499, -0.5872216, 1.673125, 0, 0, 1, 1, 1,
1.115227, -1.12805, 1.094817, 1, 0, 0, 1, 1,
1.128165, 0.4945703, 2.116417, 1, 0, 0, 1, 1,
1.128499, -0.2233642, 1.520116, 1, 0, 0, 1, 1,
1.138712, 1.306829, 1.198733, 1, 0, 0, 1, 1,
1.142903, 1.312836, -0.39782, 1, 0, 0, 1, 1,
1.155053, -1.065926, 2.025926, 0, 0, 0, 1, 1,
1.155546, 0.2654469, 2.713183, 0, 0, 0, 1, 1,
1.160449, 0.3836095, 0.1086894, 0, 0, 0, 1, 1,
1.163778, -0.8648381, 2.798741, 0, 0, 0, 1, 1,
1.171277, 0.2289815, 2.028602, 0, 0, 0, 1, 1,
1.173313, 1.351081, -0.057692, 0, 0, 0, 1, 1,
1.175817, -1.68335, 4.030219, 0, 0, 0, 1, 1,
1.176617, -1.532544, 2.619677, 1, 1, 1, 1, 1,
1.17768, 1.025131, 0.6046432, 1, 1, 1, 1, 1,
1.17884, 0.02736026, 1.483124, 1, 1, 1, 1, 1,
1.187032, 0.1634098, 2.111777, 1, 1, 1, 1, 1,
1.190018, -0.1379382, 1.586424, 1, 1, 1, 1, 1,
1.191565, -0.3334973, 1.956608, 1, 1, 1, 1, 1,
1.202583, -0.3192523, 0.07373301, 1, 1, 1, 1, 1,
1.203666, 0.1662641, 2.806967, 1, 1, 1, 1, 1,
1.208343, -1.289047, 2.768252, 1, 1, 1, 1, 1,
1.220657, 0.8264127, 0.9111652, 1, 1, 1, 1, 1,
1.228513, 0.7393544, 0.8164178, 1, 1, 1, 1, 1,
1.240147, -0.9184973, 1.764839, 1, 1, 1, 1, 1,
1.243758, -0.252403, -0.5133752, 1, 1, 1, 1, 1,
1.245969, 2.726577, 2.129507, 1, 1, 1, 1, 1,
1.257137, -0.4334484, 2.728378, 1, 1, 1, 1, 1,
1.257469, -1.340166, 2.08026, 0, 0, 1, 1, 1,
1.259534, -0.4533434, 2.688241, 1, 0, 0, 1, 1,
1.260971, -0.5919516, 2.678073, 1, 0, 0, 1, 1,
1.263435, 0.09464969, 1.718787, 1, 0, 0, 1, 1,
1.269282, 2.728843, 0.5219744, 1, 0, 0, 1, 1,
1.269394, 0.4577539, 1.252762, 1, 0, 0, 1, 1,
1.2734, -1.963887, 2.008073, 0, 0, 0, 1, 1,
1.274535, -0.8608795, 1.173363, 0, 0, 0, 1, 1,
1.284752, -0.03737534, 1.056539, 0, 0, 0, 1, 1,
1.285311, 2.015911, 1.310973, 0, 0, 0, 1, 1,
1.286711, 0.4225462, -0.4816216, 0, 0, 0, 1, 1,
1.295305, 0.07683576, 0.3407932, 0, 0, 0, 1, 1,
1.300652, -1.130329, 2.000569, 0, 0, 0, 1, 1,
1.319137, -0.1323091, -0.2941686, 1, 1, 1, 1, 1,
1.321032, -1.095894, 2.776026, 1, 1, 1, 1, 1,
1.321242, -0.9422966, 3.352048, 1, 1, 1, 1, 1,
1.327602, -1.414093, 1.172761, 1, 1, 1, 1, 1,
1.336466, 0.06658991, 0.9874915, 1, 1, 1, 1, 1,
1.338388, -0.3516049, 3.335301, 1, 1, 1, 1, 1,
1.353057, 0.4595353, 1.823952, 1, 1, 1, 1, 1,
1.356078, -0.4633158, 2.146917, 1, 1, 1, 1, 1,
1.357068, -0.9573947, 3.692784, 1, 1, 1, 1, 1,
1.360664, 1.358322, 0.7188061, 1, 1, 1, 1, 1,
1.361359, -0.1749268, 1.050254, 1, 1, 1, 1, 1,
1.371557, -0.9066195, 2.134726, 1, 1, 1, 1, 1,
1.395988, -3.403695, 3.084707, 1, 1, 1, 1, 1,
1.396893, -0.748524, 1.708326, 1, 1, 1, 1, 1,
1.400394, -2.215813, 2.638103, 1, 1, 1, 1, 1,
1.407571, 0.1689576, 3.240409, 0, 0, 1, 1, 1,
1.417457, -0.5009021, 1.620734, 1, 0, 0, 1, 1,
1.420948, 0.5299484, 0.02846948, 1, 0, 0, 1, 1,
1.422663, 0.52145, -0.9149939, 1, 0, 0, 1, 1,
1.42283, 1.130164, 1.650667, 1, 0, 0, 1, 1,
1.428224, 0.9616551, 1.008409, 1, 0, 0, 1, 1,
1.437119, 0.05005896, 1.199793, 0, 0, 0, 1, 1,
1.438043, -0.3133413, 2.185562, 0, 0, 0, 1, 1,
1.439361, 0.806558, 0.03044553, 0, 0, 0, 1, 1,
1.441649, 0.1791018, 2.039865, 0, 0, 0, 1, 1,
1.442673, 1.278819, 1.894547, 0, 0, 0, 1, 1,
1.449481, -0.05280937, 3.452006, 0, 0, 0, 1, 1,
1.457933, 0.4471141, 0.9032428, 0, 0, 0, 1, 1,
1.467131, -0.1511383, 1.794706, 1, 1, 1, 1, 1,
1.467298, 2.217491, 3.210517, 1, 1, 1, 1, 1,
1.481656, 0.4838076, 1.267737, 1, 1, 1, 1, 1,
1.501624, -1.4152, 1.434089, 1, 1, 1, 1, 1,
1.503519, -0.7815322, 2.364379, 1, 1, 1, 1, 1,
1.520032, -0.3465802, 2.258552, 1, 1, 1, 1, 1,
1.52464, -1.289649, 4.354293, 1, 1, 1, 1, 1,
1.536198, 1.61954, 1.348389, 1, 1, 1, 1, 1,
1.541905, -0.4589125, 1.001754, 1, 1, 1, 1, 1,
1.549976, -0.6321332, 3.567018, 1, 1, 1, 1, 1,
1.555761, -0.1505934, 1.123038, 1, 1, 1, 1, 1,
1.564088, -0.8563121, 2.797837, 1, 1, 1, 1, 1,
1.569444, -0.5123114, 1.28264, 1, 1, 1, 1, 1,
1.5702, -1.009828, 2.391693, 1, 1, 1, 1, 1,
1.605711, 0.1844755, 2.066275, 1, 1, 1, 1, 1,
1.606192, 0.6110787, 0.5161017, 0, 0, 1, 1, 1,
1.63529, -0.9529409, 3.425813, 1, 0, 0, 1, 1,
1.652425, -0.4174442, 1.653512, 1, 0, 0, 1, 1,
1.669117, -0.2061813, 2.130109, 1, 0, 0, 1, 1,
1.673683, 0.3618293, 3.041199, 1, 0, 0, 1, 1,
1.674964, -2.211358, 2.070441, 1, 0, 0, 1, 1,
1.679251, -2.183948, 2.920388, 0, 0, 0, 1, 1,
1.699563, 1.713263, -0.1684234, 0, 0, 0, 1, 1,
1.712155, -0.3051882, 2.629294, 0, 0, 0, 1, 1,
1.723774, 1.209747, 2.842012, 0, 0, 0, 1, 1,
1.729007, -1.168787, 3.618938, 0, 0, 0, 1, 1,
1.739803, 0.7291669, 1.401005, 0, 0, 0, 1, 1,
1.753962, 2.134511, 1.111749, 0, 0, 0, 1, 1,
1.773089, 1.287518, 0.9412092, 1, 1, 1, 1, 1,
1.79609, 0.2848261, 0.297619, 1, 1, 1, 1, 1,
1.809312, -0.04659945, 0.2368535, 1, 1, 1, 1, 1,
1.821281, -0.02909901, 0.7874037, 1, 1, 1, 1, 1,
1.857362, 1.781756, 0.2495891, 1, 1, 1, 1, 1,
1.864866, -0.6989623, 2.723231, 1, 1, 1, 1, 1,
1.893488, 0.1166926, 0.8619985, 1, 1, 1, 1, 1,
1.894759, 0.9649655, 0.7026339, 1, 1, 1, 1, 1,
1.961596, 0.9562477, 3.364541, 1, 1, 1, 1, 1,
1.97208, 1.116285, 0.8571988, 1, 1, 1, 1, 1,
1.985468, 0.868913, 2.315106, 1, 1, 1, 1, 1,
1.991915, -0.7937678, 3.11294, 1, 1, 1, 1, 1,
1.992012, -0.6698186, 2.418672, 1, 1, 1, 1, 1,
1.994659, -0.3665643, 5.164466, 1, 1, 1, 1, 1,
1.995088, 1.039668, 0.9807732, 1, 1, 1, 1, 1,
2.014097, 1.172163, 0.1533728, 0, 0, 1, 1, 1,
2.052116, 0.776986, 0.3512551, 1, 0, 0, 1, 1,
2.053897, -0.4069851, 1.524024, 1, 0, 0, 1, 1,
2.063311, 0.4690203, 2.356282, 1, 0, 0, 1, 1,
2.081068, -0.4088791, 2.06943, 1, 0, 0, 1, 1,
2.10378, 1.137931, 0.9472932, 1, 0, 0, 1, 1,
2.113125, -0.652997, 2.304311, 0, 0, 0, 1, 1,
2.210616, 0.576688, 1.388219, 0, 0, 0, 1, 1,
2.212169, -0.5525726, 2.852149, 0, 0, 0, 1, 1,
2.21428, -0.9960116, 2.142813, 0, 0, 0, 1, 1,
2.296406, 2.635613, 1.289562, 0, 0, 0, 1, 1,
2.461334, -2.910127, 3.716499, 0, 0, 0, 1, 1,
2.762384, 0.6364352, 1.618214, 0, 0, 0, 1, 1,
2.789008, -0.7286062, 0.7250874, 1, 1, 1, 1, 1,
2.790847, -0.4338036, 1.326048, 1, 1, 1, 1, 1,
2.79413, -0.1815075, 1.062516, 1, 1, 1, 1, 1,
2.80414, -0.9565328, 0.2354444, 1, 1, 1, 1, 1,
2.807248, -0.8394383, 3.317316, 1, 1, 1, 1, 1,
2.920463, 0.4479105, 1.500026, 1, 1, 1, 1, 1,
3.014864, -0.7554509, 2.65928, 1, 1, 1, 1, 1
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
var radius = 9.683468;
var distance = 34.01277;
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
mvMatrix.translate( -0.008423805, 0.03865337, 0.3463209 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01277);
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
