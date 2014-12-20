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
-3.03494, 0.6920584, 2.568323, 1, 0, 0, 1,
-2.991886, 0.5717345, -1.658693, 1, 0.007843138, 0, 1,
-2.85069, -1.092551, -2.950504, 1, 0.01176471, 0, 1,
-2.727307, -0.6297615, -1.455053, 1, 0.01960784, 0, 1,
-2.717338, 0.6663618, -2.265077, 1, 0.02352941, 0, 1,
-2.556207, 0.587957, -2.679744, 1, 0.03137255, 0, 1,
-2.514137, 0.3292745, -1.384098, 1, 0.03529412, 0, 1,
-2.491916, -0.8078649, -1.043245, 1, 0.04313726, 0, 1,
-2.481756, -1.06093, -3.455177, 1, 0.04705882, 0, 1,
-2.459043, -0.8849478, -2.647007, 1, 0.05490196, 0, 1,
-2.45009, -0.7805133, -2.997216, 1, 0.05882353, 0, 1,
-2.432881, 2.488199, -2.64957, 1, 0.06666667, 0, 1,
-2.284481, -0.102796, -1.093979, 1, 0.07058824, 0, 1,
-2.260152, 1.18735, -0.007898701, 1, 0.07843138, 0, 1,
-2.211457, 0.2686503, -0.9507926, 1, 0.08235294, 0, 1,
-2.172833, -0.8383467, -2.440463, 1, 0.09019608, 0, 1,
-2.163059, 0.1650843, -2.960475, 1, 0.09411765, 0, 1,
-2.14094, -1.757701, -2.659149, 1, 0.1019608, 0, 1,
-2.139453, -0.7068413, -0.9783785, 1, 0.1098039, 0, 1,
-2.110878, 0.9461682, -2.129172, 1, 0.1137255, 0, 1,
-2.074317, 0.1213213, -0.4472425, 1, 0.1215686, 0, 1,
-2.067405, -0.3307943, -3.282221, 1, 0.1254902, 0, 1,
-2.055976, -0.09936302, 0.2219363, 1, 0.1333333, 0, 1,
-2.007774, 0.7605043, -1.691711, 1, 0.1372549, 0, 1,
-2.005606, -1.068984, -1.732163, 1, 0.145098, 0, 1,
-2.004934, -0.5613238, -1.532396, 1, 0.1490196, 0, 1,
-2.002448, 2.320893, -0.9304556, 1, 0.1568628, 0, 1,
-1.98973, 0.2280399, -2.031003, 1, 0.1607843, 0, 1,
-1.983697, -0.01858312, -3.102891, 1, 0.1686275, 0, 1,
-1.965976, -1.939322, -2.12161, 1, 0.172549, 0, 1,
-1.961457, -0.1809881, -2.140557, 1, 0.1803922, 0, 1,
-1.961109, 0.6776656, -0.7343978, 1, 0.1843137, 0, 1,
-1.951801, -1.425575, -2.234294, 1, 0.1921569, 0, 1,
-1.945761, 0.06332386, -2.564257, 1, 0.1960784, 0, 1,
-1.939553, 0.2241691, -1.444842, 1, 0.2039216, 0, 1,
-1.919934, -1.270238, -3.054332, 1, 0.2117647, 0, 1,
-1.906936, -1.028141, -2.150463, 1, 0.2156863, 0, 1,
-1.904446, 1.905933, 0.8312091, 1, 0.2235294, 0, 1,
-1.897286, -0.7228163, -2.057611, 1, 0.227451, 0, 1,
-1.882865, 0.7781155, -2.32644, 1, 0.2352941, 0, 1,
-1.862483, 0.510769, -1.094302, 1, 0.2392157, 0, 1,
-1.855687, -0.3225361, -1.001826, 1, 0.2470588, 0, 1,
-1.847231, -0.6781676, -1.593, 1, 0.2509804, 0, 1,
-1.838842, 1.685137, -1.752824, 1, 0.2588235, 0, 1,
-1.838678, 0.890041, -0.9573434, 1, 0.2627451, 0, 1,
-1.83384, 0.6053206, 0.1741063, 1, 0.2705882, 0, 1,
-1.829316, -1.240628, -0.8797503, 1, 0.2745098, 0, 1,
-1.815816, 0.7105451, 0.538073, 1, 0.282353, 0, 1,
-1.812093, -0.5826069, -3.344154, 1, 0.2862745, 0, 1,
-1.798961, 0.9322731, -0.3235011, 1, 0.2941177, 0, 1,
-1.797937, -0.1440077, -1.242021, 1, 0.3019608, 0, 1,
-1.785118, -1.619988, -1.723881, 1, 0.3058824, 0, 1,
-1.783816, -0.2922303, -0.2038816, 1, 0.3137255, 0, 1,
-1.782667, 0.2022835, 0.1789027, 1, 0.3176471, 0, 1,
-1.780559, 1.885353, 0.514273, 1, 0.3254902, 0, 1,
-1.76954, -0.3137365, -0.7585228, 1, 0.3294118, 0, 1,
-1.762062, -0.7816437, -1.588251, 1, 0.3372549, 0, 1,
-1.761733, 0.4723794, -0.3070174, 1, 0.3411765, 0, 1,
-1.750931, 1.559978, -1.288371, 1, 0.3490196, 0, 1,
-1.748807, 1.461874, -0.9504233, 1, 0.3529412, 0, 1,
-1.746258, -0.9220977, -1.874205, 1, 0.3607843, 0, 1,
-1.735965, 0.2067859, -0.9947631, 1, 0.3647059, 0, 1,
-1.693537, 0.1152194, -1.267304, 1, 0.372549, 0, 1,
-1.693356, -0.4622279, -1.488297, 1, 0.3764706, 0, 1,
-1.657514, 0.2071164, -1.398084, 1, 0.3843137, 0, 1,
-1.654545, -1.159681, -1.374676, 1, 0.3882353, 0, 1,
-1.646871, -2.710067, -2.697605, 1, 0.3960784, 0, 1,
-1.635323, 1.501964, -0.2451702, 1, 0.4039216, 0, 1,
-1.632018, 0.1499773, -1.684599, 1, 0.4078431, 0, 1,
-1.622203, 1.608012, -1.972829, 1, 0.4156863, 0, 1,
-1.621244, -0.7253442, -2.662839, 1, 0.4196078, 0, 1,
-1.614408, 0.4363366, -2.696573, 1, 0.427451, 0, 1,
-1.605096, -0.3528435, -0.5905915, 1, 0.4313726, 0, 1,
-1.595448, 0.399788, -2.19488, 1, 0.4392157, 0, 1,
-1.558346, -1.234936, -2.123396, 1, 0.4431373, 0, 1,
-1.55682, 0.06499597, -1.436587, 1, 0.4509804, 0, 1,
-1.555835, -0.4055038, -0.3352323, 1, 0.454902, 0, 1,
-1.552548, -0.2431763, 0.5568565, 1, 0.4627451, 0, 1,
-1.538508, -0.8245205, -2.46213, 1, 0.4666667, 0, 1,
-1.526648, -1.137382, -1.153497, 1, 0.4745098, 0, 1,
-1.520164, -0.3946351, -2.361165, 1, 0.4784314, 0, 1,
-1.510869, 0.2989189, -3.549713, 1, 0.4862745, 0, 1,
-1.508189, 0.0101111, -0.8156649, 1, 0.4901961, 0, 1,
-1.504761, -1.294457, -3.343783, 1, 0.4980392, 0, 1,
-1.48781, 0.11019, -1.476427, 1, 0.5058824, 0, 1,
-1.481483, -0.6968685, -2.190259, 1, 0.509804, 0, 1,
-1.480587, 0.6582429, -1.643852, 1, 0.5176471, 0, 1,
-1.462435, 0.09455101, -0.5858342, 1, 0.5215687, 0, 1,
-1.459746, 0.4311962, -1.312482, 1, 0.5294118, 0, 1,
-1.447794, 0.04701069, -0.5682445, 1, 0.5333334, 0, 1,
-1.42822, -0.7489225, -2.738925, 1, 0.5411765, 0, 1,
-1.427133, 0.5424324, 0.0330241, 1, 0.5450981, 0, 1,
-1.421934, 0.5506279, 0.2133193, 1, 0.5529412, 0, 1,
-1.41886, -0.3606575, -2.5484, 1, 0.5568628, 0, 1,
-1.417164, -1.630849, -1.632805, 1, 0.5647059, 0, 1,
-1.416643, 0.1457187, -2.571092, 1, 0.5686275, 0, 1,
-1.413806, 1.78962, -1.784064, 1, 0.5764706, 0, 1,
-1.411281, -0.225157, -1.836754, 1, 0.5803922, 0, 1,
-1.397506, 0.6575509, -0.2705947, 1, 0.5882353, 0, 1,
-1.393553, 0.8510573, -1.950037, 1, 0.5921569, 0, 1,
-1.392173, -2.664047, -1.987883, 1, 0.6, 0, 1,
-1.38898, 2.551024, 0.05612608, 1, 0.6078432, 0, 1,
-1.373496, -0.08521783, -0.745715, 1, 0.6117647, 0, 1,
-1.369033, 1.138886, -1.17688, 1, 0.6196079, 0, 1,
-1.347457, -0.7406507, -3.40033, 1, 0.6235294, 0, 1,
-1.341362, 0.1630164, -2.227856, 1, 0.6313726, 0, 1,
-1.334974, -0.1625405, -1.601822, 1, 0.6352941, 0, 1,
-1.334158, -1.133395, -2.762796, 1, 0.6431373, 0, 1,
-1.330617, 1.453761, -0.9342648, 1, 0.6470588, 0, 1,
-1.314736, 0.5553755, -0.1958895, 1, 0.654902, 0, 1,
-1.307147, 0.2288959, -1.700781, 1, 0.6588235, 0, 1,
-1.298939, 0.01762808, -1.234853, 1, 0.6666667, 0, 1,
-1.292504, 1.555665, -0.3675964, 1, 0.6705883, 0, 1,
-1.28982, -0.05046326, -1.82821, 1, 0.6784314, 0, 1,
-1.281556, -0.191177, -1.577209, 1, 0.682353, 0, 1,
-1.277994, -1.116838, -3.767925, 1, 0.6901961, 0, 1,
-1.259644, 0.2986058, -0.3348747, 1, 0.6941177, 0, 1,
-1.257683, 0.4123083, -1.589613, 1, 0.7019608, 0, 1,
-1.256439, -0.9440368, -2.753902, 1, 0.7098039, 0, 1,
-1.255399, -0.3206363, -2.797796, 1, 0.7137255, 0, 1,
-1.253972, -1.335653, -4.078251, 1, 0.7215686, 0, 1,
-1.245146, 0.5635609, -0.1320038, 1, 0.7254902, 0, 1,
-1.243723, 1.889278, 0.5147902, 1, 0.7333333, 0, 1,
-1.234773, -0.2254986, -2.226287, 1, 0.7372549, 0, 1,
-1.225327, -0.9300511, -2.292444, 1, 0.7450981, 0, 1,
-1.223375, 0.1605233, -0.9545789, 1, 0.7490196, 0, 1,
-1.222237, -0.8724766, -3.170379, 1, 0.7568628, 0, 1,
-1.222085, -0.5685036, -2.09866, 1, 0.7607843, 0, 1,
-1.221397, 1.537667, -0.6981682, 1, 0.7686275, 0, 1,
-1.220532, 1.030913, -1.193019, 1, 0.772549, 0, 1,
-1.220031, 1.105479, -0.9828081, 1, 0.7803922, 0, 1,
-1.207855, 1.232255, -0.1911328, 1, 0.7843137, 0, 1,
-1.191981, 0.8075501, -0.3821649, 1, 0.7921569, 0, 1,
-1.190946, -1.119497, -3.024983, 1, 0.7960784, 0, 1,
-1.187357, 0.3448727, -3.366889, 1, 0.8039216, 0, 1,
-1.178123, -1.134648, -1.903103, 1, 0.8117647, 0, 1,
-1.163722, -0.2464813, -3.528436, 1, 0.8156863, 0, 1,
-1.159528, 0.6828249, -1.963786, 1, 0.8235294, 0, 1,
-1.158247, -0.494161, -0.5707816, 1, 0.827451, 0, 1,
-1.15743, 0.7873499, -1.718042, 1, 0.8352941, 0, 1,
-1.15308, 0.4236146, -0.5007257, 1, 0.8392157, 0, 1,
-1.14322, 0.6636466, -1.414095, 1, 0.8470588, 0, 1,
-1.141894, 0.1486632, -3.578952, 1, 0.8509804, 0, 1,
-1.132529, 0.2417869, -0.3120953, 1, 0.8588235, 0, 1,
-1.124151, -0.6139765, -2.666221, 1, 0.8627451, 0, 1,
-1.12023, -0.2986947, -3.106572, 1, 0.8705882, 0, 1,
-1.115151, 0.1296115, -1.412473, 1, 0.8745098, 0, 1,
-1.099649, 0.3555565, -1.110031, 1, 0.8823529, 0, 1,
-1.093227, 0.6238346, -1.215957, 1, 0.8862745, 0, 1,
-1.091478, 0.749638, -1.563239, 1, 0.8941177, 0, 1,
-1.07912, -1.361349, 0.716364, 1, 0.8980392, 0, 1,
-1.077581, 1.393536, -0.09603898, 1, 0.9058824, 0, 1,
-1.076885, 0.08443458, -2.618073, 1, 0.9137255, 0, 1,
-1.076128, 2.395152, -0.3831835, 1, 0.9176471, 0, 1,
-1.064833, -1.63271, -2.216094, 1, 0.9254902, 0, 1,
-1.056965, -1.840175, -2.198098, 1, 0.9294118, 0, 1,
-1.048214, 1.030814, -1.51385, 1, 0.9372549, 0, 1,
-1.042389, -0.7869567, -1.590218, 1, 0.9411765, 0, 1,
-1.037955, 0.9498292, -0.8234741, 1, 0.9490196, 0, 1,
-1.033288, 0.2656697, -1.583903, 1, 0.9529412, 0, 1,
-1.029424, -0.6130279, -3.157269, 1, 0.9607843, 0, 1,
-1.025684, 1.343729, -2.162967, 1, 0.9647059, 0, 1,
-1.02471, 0.8911713, 0.7878711, 1, 0.972549, 0, 1,
-1.024323, 0.5000909, -0.6431094, 1, 0.9764706, 0, 1,
-1.020262, -2.368729, -3.867832, 1, 0.9843137, 0, 1,
-1.014777, 0.2373883, -0.3577799, 1, 0.9882353, 0, 1,
-1.009296, -0.1879868, -2.660726, 1, 0.9960784, 0, 1,
-1.008882, -0.1541226, -1.391006, 0.9960784, 1, 0, 1,
-1.005847, 0.235124, -2.276266, 0.9921569, 1, 0, 1,
-1.003511, 1.364687, -0.5320941, 0.9843137, 1, 0, 1,
-1.000418, -0.2499013, -1.777646, 0.9803922, 1, 0, 1,
-1.00026, 2.354796, -1.38812, 0.972549, 1, 0, 1,
-0.9998553, 0.433251, -1.059156, 0.9686275, 1, 0, 1,
-0.9987177, 0.2957349, -1.296569, 0.9607843, 1, 0, 1,
-0.9956831, -0.6339545, -1.730806, 0.9568627, 1, 0, 1,
-0.98885, -1.400942, -2.476623, 0.9490196, 1, 0, 1,
-0.9846598, -0.5797251, -1.481548, 0.945098, 1, 0, 1,
-0.9752974, 0.3362364, -0.8266659, 0.9372549, 1, 0, 1,
-0.9746411, -0.9838107, -2.452543, 0.9333333, 1, 0, 1,
-0.9676437, 1.70359, -1.282326, 0.9254902, 1, 0, 1,
-0.9642828, -0.4281485, -2.762259, 0.9215686, 1, 0, 1,
-0.9616119, -2.377335, -4.949267, 0.9137255, 1, 0, 1,
-0.9584991, -0.05610856, -0.9884251, 0.9098039, 1, 0, 1,
-0.9579025, -3.142978, -2.323679, 0.9019608, 1, 0, 1,
-0.9529763, -1.323994, -2.399326, 0.8941177, 1, 0, 1,
-0.9526088, -0.3386892, 0.7520874, 0.8901961, 1, 0, 1,
-0.9515893, -0.1498632, -4.143262, 0.8823529, 1, 0, 1,
-0.9464668, -1.311646, -2.676275, 0.8784314, 1, 0, 1,
-0.9376108, -1.168227, -0.2129239, 0.8705882, 1, 0, 1,
-0.9277381, -0.8618887, -2.9758, 0.8666667, 1, 0, 1,
-0.9214712, -0.8668597, -1.438748, 0.8588235, 1, 0, 1,
-0.9203457, 0.5641565, -0.8379976, 0.854902, 1, 0, 1,
-0.9197292, 1.108947, -1.054207, 0.8470588, 1, 0, 1,
-0.9175448, 1.928041, -1.480855, 0.8431373, 1, 0, 1,
-0.914834, 0.4926222, -0.8879244, 0.8352941, 1, 0, 1,
-0.907094, 0.7708879, -1.386639, 0.8313726, 1, 0, 1,
-0.9004166, -0.5334759, -2.004275, 0.8235294, 1, 0, 1,
-0.8935053, 0.1461127, -0.4721608, 0.8196079, 1, 0, 1,
-0.8933201, -0.02069599, -3.960814, 0.8117647, 1, 0, 1,
-0.8928909, -1.235403, -1.857838, 0.8078431, 1, 0, 1,
-0.8927919, 0.1577474, -0.516884, 0.8, 1, 0, 1,
-0.8925751, -0.07393631, -0.5116907, 0.7921569, 1, 0, 1,
-0.8911345, -0.6956173, -2.199739, 0.7882353, 1, 0, 1,
-0.8819873, -0.9201071, -1.464965, 0.7803922, 1, 0, 1,
-0.8813404, 0.6914188, -1.817248, 0.7764706, 1, 0, 1,
-0.8790236, 0.8776699, 0.2885796, 0.7686275, 1, 0, 1,
-0.8775253, 1.544748, -0.09659994, 0.7647059, 1, 0, 1,
-0.8738171, -1.592711, -3.740543, 0.7568628, 1, 0, 1,
-0.8737155, -0.02552496, -0.6370834, 0.7529412, 1, 0, 1,
-0.870985, 1.424217, -0.3696251, 0.7450981, 1, 0, 1,
-0.8686152, 0.8403405, 0.200652, 0.7411765, 1, 0, 1,
-0.8665609, -1.182143, -2.093085, 0.7333333, 1, 0, 1,
-0.8662153, -0.1848389, -2.768657, 0.7294118, 1, 0, 1,
-0.8661677, -0.1851047, -1.661583, 0.7215686, 1, 0, 1,
-0.8568168, -0.371025, -0.8152372, 0.7176471, 1, 0, 1,
-0.8509186, -1.420926, -1.100422, 0.7098039, 1, 0, 1,
-0.8490697, -1.138643, -1.026129, 0.7058824, 1, 0, 1,
-0.8460408, -0.5049189, -2.378989, 0.6980392, 1, 0, 1,
-0.8403323, 0.04225183, -1.459739, 0.6901961, 1, 0, 1,
-0.831935, 0.406966, -2.213982, 0.6862745, 1, 0, 1,
-0.8273511, -0.4985904, -2.004481, 0.6784314, 1, 0, 1,
-0.8263994, -0.7357784, -5.24507, 0.6745098, 1, 0, 1,
-0.8225726, -1.129698, -2.948114, 0.6666667, 1, 0, 1,
-0.8208119, 0.498056, -0.5371367, 0.6627451, 1, 0, 1,
-0.8091579, -2.23778, -2.466036, 0.654902, 1, 0, 1,
-0.8055407, 0.03030821, -3.126074, 0.6509804, 1, 0, 1,
-0.8013752, 0.7477724, -0.2933586, 0.6431373, 1, 0, 1,
-0.799704, -1.11966, -2.966085, 0.6392157, 1, 0, 1,
-0.7991151, -1.170825, -1.701305, 0.6313726, 1, 0, 1,
-0.7965916, 0.4647741, -0.02866497, 0.627451, 1, 0, 1,
-0.7965159, -0.5360996, -2.574829, 0.6196079, 1, 0, 1,
-0.787347, -1.938433, -2.35747, 0.6156863, 1, 0, 1,
-0.7730966, 0.6336535, -1.283818, 0.6078432, 1, 0, 1,
-0.7712954, -0.7780167, -3.246031, 0.6039216, 1, 0, 1,
-0.7688957, 0.6662865, -0.7740314, 0.5960785, 1, 0, 1,
-0.7653794, 0.358672, -1.875024, 0.5882353, 1, 0, 1,
-0.7618001, -1.026303, -2.804014, 0.5843138, 1, 0, 1,
-0.760088, 0.9833484, 1.874803, 0.5764706, 1, 0, 1,
-0.7447563, 0.8337853, 0.8296483, 0.572549, 1, 0, 1,
-0.7407826, 1.892646, -0.01082054, 0.5647059, 1, 0, 1,
-0.728804, -0.5431513, -1.739535, 0.5607843, 1, 0, 1,
-0.7285288, 1.49007, -1.056278, 0.5529412, 1, 0, 1,
-0.7267066, 0.1878125, 0.2530563, 0.5490196, 1, 0, 1,
-0.7248892, -0.4107711, -0.2785038, 0.5411765, 1, 0, 1,
-0.7239957, -0.08960794, -0.9556037, 0.5372549, 1, 0, 1,
-0.7146941, 1.595716, -1.125357, 0.5294118, 1, 0, 1,
-0.7099355, 0.5312649, -0.477105, 0.5254902, 1, 0, 1,
-0.7092323, -2.360715, -2.755148, 0.5176471, 1, 0, 1,
-0.7085978, -1.275627, -2.433775, 0.5137255, 1, 0, 1,
-0.7025945, 0.1196239, -2.304009, 0.5058824, 1, 0, 1,
-0.7019951, 0.1183377, -1.315406, 0.5019608, 1, 0, 1,
-0.6993766, 0.6097286, -3.387104, 0.4941176, 1, 0, 1,
-0.6974138, 0.9195388, -1.930624, 0.4862745, 1, 0, 1,
-0.6931794, 0.1761511, -0.8188944, 0.4823529, 1, 0, 1,
-0.6865871, -0.3814339, -3.10822, 0.4745098, 1, 0, 1,
-0.6865829, -0.1190494, -2.028978, 0.4705882, 1, 0, 1,
-0.6840659, -0.1175018, -1.191028, 0.4627451, 1, 0, 1,
-0.6817415, 0.8384025, -0.09076817, 0.4588235, 1, 0, 1,
-0.6774865, -1.505329, -1.602307, 0.4509804, 1, 0, 1,
-0.6732844, 0.4441252, -1.332015, 0.4470588, 1, 0, 1,
-0.6701937, -0.4417868, -2.536134, 0.4392157, 1, 0, 1,
-0.6688655, -0.2997616, -3.504431, 0.4352941, 1, 0, 1,
-0.6630064, 1.974204, 0.2301064, 0.427451, 1, 0, 1,
-0.6610021, -0.2740209, -0.8084983, 0.4235294, 1, 0, 1,
-0.6487702, 1.898869, -0.02827068, 0.4156863, 1, 0, 1,
-0.6448898, 0.9529685, 2.489462, 0.4117647, 1, 0, 1,
-0.6423033, -1.467261, -3.080176, 0.4039216, 1, 0, 1,
-0.641049, -1.90567, -1.46505, 0.3960784, 1, 0, 1,
-0.6394023, -0.4459601, -2.979248, 0.3921569, 1, 0, 1,
-0.6379512, -0.7599027, -3.988107, 0.3843137, 1, 0, 1,
-0.6197898, 0.3265353, -1.466274, 0.3803922, 1, 0, 1,
-0.6176623, 0.06574483, -1.475818, 0.372549, 1, 0, 1,
-0.6123869, 1.781303, -0.5996134, 0.3686275, 1, 0, 1,
-0.6117098, 1.683745, -1.060307, 0.3607843, 1, 0, 1,
-0.6050842, 0.1993871, -1.447444, 0.3568628, 1, 0, 1,
-0.6035091, 0.08884935, -2.205994, 0.3490196, 1, 0, 1,
-0.6028106, 0.5964503, -2.179422, 0.345098, 1, 0, 1,
-0.5981191, 0.938378, 0.9254956, 0.3372549, 1, 0, 1,
-0.5964421, 0.3995864, -1.800402, 0.3333333, 1, 0, 1,
-0.5962358, -0.4194487, -2.945483, 0.3254902, 1, 0, 1,
-0.5919377, -1.430748, -2.5101, 0.3215686, 1, 0, 1,
-0.5800069, 1.136096, 1.478457, 0.3137255, 1, 0, 1,
-0.5788241, -1.303102, -2.897429, 0.3098039, 1, 0, 1,
-0.5780343, -0.1168288, -1.383783, 0.3019608, 1, 0, 1,
-0.5779192, -0.8456234, -2.747588, 0.2941177, 1, 0, 1,
-0.5765519, -0.4058648, -2.951916, 0.2901961, 1, 0, 1,
-0.576092, -1.307676, -2.394401, 0.282353, 1, 0, 1,
-0.5723072, 2.134735, 0.4271549, 0.2784314, 1, 0, 1,
-0.5702885, -3.667636, -3.273713, 0.2705882, 1, 0, 1,
-0.5687408, 2.63446, 0.1756548, 0.2666667, 1, 0, 1,
-0.5492873, 1.268649, -1.417469, 0.2588235, 1, 0, 1,
-0.547586, -0.1888983, -1.839688, 0.254902, 1, 0, 1,
-0.5431075, 0.1780728, -1.387129, 0.2470588, 1, 0, 1,
-0.5416282, -0.8484641, -1.994005, 0.2431373, 1, 0, 1,
-0.5406101, -0.9593492, -4.189473, 0.2352941, 1, 0, 1,
-0.5402299, 0.7233534, -1.03658, 0.2313726, 1, 0, 1,
-0.536658, 2.336221, -2.656298, 0.2235294, 1, 0, 1,
-0.5353742, -0.04125185, -0.5099997, 0.2196078, 1, 0, 1,
-0.5347149, 0.6968711, -0.6665007, 0.2117647, 1, 0, 1,
-0.5315555, -1.89631, -4.14187, 0.2078431, 1, 0, 1,
-0.5276527, 0.4316294, 0.1914715, 0.2, 1, 0, 1,
-0.5223958, 0.2949904, -0.7627438, 0.1921569, 1, 0, 1,
-0.5220619, -0.009785414, -2.401086, 0.1882353, 1, 0, 1,
-0.5128129, -0.003650177, -3.524393, 0.1803922, 1, 0, 1,
-0.5124674, 0.5359179, -0.0782754, 0.1764706, 1, 0, 1,
-0.5121258, -1.620096, -2.811102, 0.1686275, 1, 0, 1,
-0.5092065, 1.617116, -0.1266848, 0.1647059, 1, 0, 1,
-0.504492, -0.05502643, -1.350168, 0.1568628, 1, 0, 1,
-0.5031729, -1.298334, -2.621241, 0.1529412, 1, 0, 1,
-0.4999864, 0.34264, -0.5561684, 0.145098, 1, 0, 1,
-0.4995922, -1.163778, -2.188774, 0.1411765, 1, 0, 1,
-0.4984421, -0.8077725, -3.033838, 0.1333333, 1, 0, 1,
-0.4978955, -0.007645451, -2.455996, 0.1294118, 1, 0, 1,
-0.4938581, -0.01705922, -2.171409, 0.1215686, 1, 0, 1,
-0.4915703, -1.08769, -3.243319, 0.1176471, 1, 0, 1,
-0.4879799, 0.3026474, -2.366258, 0.1098039, 1, 0, 1,
-0.4850221, 0.639478, -0.4932425, 0.1058824, 1, 0, 1,
-0.4842303, 0.04432367, -1.433115, 0.09803922, 1, 0, 1,
-0.4815802, 0.9779341, -0.2366374, 0.09019608, 1, 0, 1,
-0.4803506, 1.194075, -1.561203, 0.08627451, 1, 0, 1,
-0.4672552, 0.4727502, -0.4395996, 0.07843138, 1, 0, 1,
-0.4644011, -1.306803, -3.790024, 0.07450981, 1, 0, 1,
-0.4528246, -0.4370673, -3.556177, 0.06666667, 1, 0, 1,
-0.4452183, 1.093387, -0.2634281, 0.0627451, 1, 0, 1,
-0.4435925, 1.489328, -0.4006464, 0.05490196, 1, 0, 1,
-0.4410127, 1.666204, -1.049451, 0.05098039, 1, 0, 1,
-0.4391387, -0.8458165, -2.110588, 0.04313726, 1, 0, 1,
-0.4380735, -0.6086155, -2.691991, 0.03921569, 1, 0, 1,
-0.4368748, -0.06048943, -1.829193, 0.03137255, 1, 0, 1,
-0.4367082, -0.4380639, -2.496071, 0.02745098, 1, 0, 1,
-0.436492, 0.4559749, -2.401773, 0.01960784, 1, 0, 1,
-0.4348841, 0.9405302, 0.0008897416, 0.01568628, 1, 0, 1,
-0.4321179, 1.449867, -0.8005892, 0.007843138, 1, 0, 1,
-0.4274783, -0.3332407, -1.564183, 0.003921569, 1, 0, 1,
-0.4269491, 0.965816, -0.5791063, 0, 1, 0.003921569, 1,
-0.4252775, 0.03596045, -2.192202, 0, 1, 0.01176471, 1,
-0.4252454, -0.4819414, -2.189194, 0, 1, 0.01568628, 1,
-0.417726, -0.2008195, -0.1868962, 0, 1, 0.02352941, 1,
-0.415728, -1.29948, -3.658121, 0, 1, 0.02745098, 1,
-0.4157269, -0.06168508, -0.6923981, 0, 1, 0.03529412, 1,
-0.4139008, 0.03260052, -1.905523, 0, 1, 0.03921569, 1,
-0.4130787, 0.5913693, 0.5403583, 0, 1, 0.04705882, 1,
-0.4117652, -0.5396226, -4.141394, 0, 1, 0.05098039, 1,
-0.3947552, -0.9769738, -3.010382, 0, 1, 0.05882353, 1,
-0.391428, 0.9466625, 0.06799943, 0, 1, 0.0627451, 1,
-0.3912688, 0.8909288, -0.1663634, 0, 1, 0.07058824, 1,
-0.3900537, 0.8073948, 2.502655, 0, 1, 0.07450981, 1,
-0.3889983, -0.8599514, -3.346362, 0, 1, 0.08235294, 1,
-0.382981, -0.1244799, 0.7229686, 0, 1, 0.08627451, 1,
-0.3827985, -0.2838693, -0.9138059, 0, 1, 0.09411765, 1,
-0.3797599, -0.08894741, -2.51869, 0, 1, 0.1019608, 1,
-0.3774258, 1.172848, -0.2458774, 0, 1, 0.1058824, 1,
-0.3706936, 0.1124125, -2.2185, 0, 1, 0.1137255, 1,
-0.3677572, -1.75492, -3.15619, 0, 1, 0.1176471, 1,
-0.3632671, 0.4621675, -0.1737421, 0, 1, 0.1254902, 1,
-0.3622995, 1.049348, 0.8746031, 0, 1, 0.1294118, 1,
-0.3622587, -0.5722111, -1.362977, 0, 1, 0.1372549, 1,
-0.3594808, 2.042328, 0.04041969, 0, 1, 0.1411765, 1,
-0.3555613, -0.2267955, -3.213609, 0, 1, 0.1490196, 1,
-0.3542365, 1.0227, 0.1363623, 0, 1, 0.1529412, 1,
-0.3539925, -0.7726542, -2.261714, 0, 1, 0.1607843, 1,
-0.352926, 1.235639, -1.599705, 0, 1, 0.1647059, 1,
-0.3528756, 0.7947251, 1.240255, 0, 1, 0.172549, 1,
-0.3400415, 0.8472904, 0.5938413, 0, 1, 0.1764706, 1,
-0.3369777, 1.089772, 0.6811787, 0, 1, 0.1843137, 1,
-0.3346788, 1.938491, -0.2500902, 0, 1, 0.1882353, 1,
-0.3289579, 1.039297, -0.1268555, 0, 1, 0.1960784, 1,
-0.3288139, -1.645394, -1.952397, 0, 1, 0.2039216, 1,
-0.3266364, 0.4393295, -1.599413, 0, 1, 0.2078431, 1,
-0.3212598, -1.748714, -3.427373, 0, 1, 0.2156863, 1,
-0.3182169, 1.441693, -1.01148, 0, 1, 0.2196078, 1,
-0.317613, 0.8282291, -1.661785, 0, 1, 0.227451, 1,
-0.3168741, -0.8166561, -1.606865, 0, 1, 0.2313726, 1,
-0.3137562, 1.166154, -1.404762, 0, 1, 0.2392157, 1,
-0.3130259, 0.6790779, -0.7847311, 0, 1, 0.2431373, 1,
-0.3125722, 0.1720154, -1.233708, 0, 1, 0.2509804, 1,
-0.31134, 1.411341, 0.2319951, 0, 1, 0.254902, 1,
-0.3078183, 0.1676905, -0.3150021, 0, 1, 0.2627451, 1,
-0.3077541, 0.222367, 0.03581437, 0, 1, 0.2666667, 1,
-0.3060308, -0.4016618, -3.652502, 0, 1, 0.2745098, 1,
-0.3054675, -0.5756261, -1.738055, 0, 1, 0.2784314, 1,
-0.3037914, -0.2027408, -2.061326, 0, 1, 0.2862745, 1,
-0.3032776, 1.093144, 0.7525344, 0, 1, 0.2901961, 1,
-0.299578, 1.325417, -0.14306, 0, 1, 0.2980392, 1,
-0.2944717, 1.554562, 1.64265, 0, 1, 0.3058824, 1,
-0.2934206, -0.5038472, -2.282601, 0, 1, 0.3098039, 1,
-0.2889107, 0.7041354, -1.57034, 0, 1, 0.3176471, 1,
-0.2853789, -0.8476633, -2.152345, 0, 1, 0.3215686, 1,
-0.2822726, 0.4005232, -1.800501, 0, 1, 0.3294118, 1,
-0.2799127, -1.136679, -1.897172, 0, 1, 0.3333333, 1,
-0.2797981, 0.289971, 0.8954135, 0, 1, 0.3411765, 1,
-0.279214, 0.8049491, -1.895715, 0, 1, 0.345098, 1,
-0.2776471, -0.7196408, -1.573382, 0, 1, 0.3529412, 1,
-0.2708588, -0.4038793, -2.15057, 0, 1, 0.3568628, 1,
-0.2698106, 0.2133035, -2.523179, 0, 1, 0.3647059, 1,
-0.2681565, -0.3914783, -3.014854, 0, 1, 0.3686275, 1,
-0.2677706, -0.963822, -2.310076, 0, 1, 0.3764706, 1,
-0.2657349, -0.5996504, -4.265219, 0, 1, 0.3803922, 1,
-0.259974, -0.06057158, -3.193879, 0, 1, 0.3882353, 1,
-0.2426799, -1.234979, -4.395061, 0, 1, 0.3921569, 1,
-0.2419486, 1.303123, -0.3517826, 0, 1, 0.4, 1,
-0.2394762, -1.230039, -0.9441784, 0, 1, 0.4078431, 1,
-0.236162, -0.7637944, -4.756491, 0, 1, 0.4117647, 1,
-0.2357785, 1.354881, -0.2263492, 0, 1, 0.4196078, 1,
-0.235165, -0.3812852, -1.932284, 0, 1, 0.4235294, 1,
-0.2323867, -0.176498, -3.076099, 0, 1, 0.4313726, 1,
-0.2302548, -0.6915436, -4.378139, 0, 1, 0.4352941, 1,
-0.2270275, 1.327462, 0.2364096, 0, 1, 0.4431373, 1,
-0.2220093, 0.209825, -0.2099976, 0, 1, 0.4470588, 1,
-0.2213926, 1.086101, 0.2610877, 0, 1, 0.454902, 1,
-0.2197894, 0.5720679, 1.539373, 0, 1, 0.4588235, 1,
-0.216755, 0.0688006, -0.9337708, 0, 1, 0.4666667, 1,
-0.2144083, 1.562958, 0.06176064, 0, 1, 0.4705882, 1,
-0.210814, 0.7803823, -1.65186, 0, 1, 0.4784314, 1,
-0.2064136, -0.1648265, -2.678914, 0, 1, 0.4823529, 1,
-0.2053827, 0.7608969, -0.1616426, 0, 1, 0.4901961, 1,
-0.2014753, -0.3900889, -2.331305, 0, 1, 0.4941176, 1,
-0.1970095, 0.8330694, 0.2836073, 0, 1, 0.5019608, 1,
-0.19408, 0.529648, -0.3396606, 0, 1, 0.509804, 1,
-0.1888928, -0.4373465, -3.031051, 0, 1, 0.5137255, 1,
-0.1868159, -1.062505, -3.37527, 0, 1, 0.5215687, 1,
-0.1837059, -0.5160589, -4.859031, 0, 1, 0.5254902, 1,
-0.1789169, 0.2863565, 0.6894044, 0, 1, 0.5333334, 1,
-0.1610491, 0.1360809, -2.076574, 0, 1, 0.5372549, 1,
-0.1600036, -0.09917738, -2.074927, 0, 1, 0.5450981, 1,
-0.1586884, 0.05081709, -1.636328, 0, 1, 0.5490196, 1,
-0.148945, 0.5631756, -1.906914, 0, 1, 0.5568628, 1,
-0.1482107, 1.253244, 0.1281726, 0, 1, 0.5607843, 1,
-0.145123, -0.1038833, -1.919667, 0, 1, 0.5686275, 1,
-0.1433701, -0.8491374, -2.676098, 0, 1, 0.572549, 1,
-0.1373738, 1.623698, -0.1023702, 0, 1, 0.5803922, 1,
-0.1347318, -0.1416752, -3.413365, 0, 1, 0.5843138, 1,
-0.1318622, 1.608639, 0.5247806, 0, 1, 0.5921569, 1,
-0.1279065, -0.8170123, -1.328964, 0, 1, 0.5960785, 1,
-0.1278047, 0.2961252, -1.765136, 0, 1, 0.6039216, 1,
-0.1262232, -0.2218185, -2.326197, 0, 1, 0.6117647, 1,
-0.124166, -0.02111025, -2.290593, 0, 1, 0.6156863, 1,
-0.1222797, -1.390577, -4.088889, 0, 1, 0.6235294, 1,
-0.1147306, -0.8411276, -2.264945, 0, 1, 0.627451, 1,
-0.1113826, 0.04607386, -1.085076, 0, 1, 0.6352941, 1,
-0.1106059, -0.282971, -1.586041, 0, 1, 0.6392157, 1,
-0.1090016, -1.749903, -3.23456, 0, 1, 0.6470588, 1,
-0.1083281, -1.595875, -1.741011, 0, 1, 0.6509804, 1,
-0.1079973, -0.4196059, -2.895408, 0, 1, 0.6588235, 1,
-0.1040046, 1.211852, -0.8818593, 0, 1, 0.6627451, 1,
-0.1029972, -1.565427, -2.3903, 0, 1, 0.6705883, 1,
-0.1022597, 2.420174, 0.9044576, 0, 1, 0.6745098, 1,
-0.1001202, 0.982644, -0.07934133, 0, 1, 0.682353, 1,
-0.1000154, -1.389612, -2.863028, 0, 1, 0.6862745, 1,
-0.09437881, -0.2069211, -3.067429, 0, 1, 0.6941177, 1,
-0.09435873, 0.3125586, -1.029389, 0, 1, 0.7019608, 1,
-0.08622722, 0.3557875, -1.342658, 0, 1, 0.7058824, 1,
-0.08533101, 0.8003777, -1.095885, 0, 1, 0.7137255, 1,
-0.08477958, 1.103694, 0.8169003, 0, 1, 0.7176471, 1,
-0.08380515, 1.318904, 0.3283738, 0, 1, 0.7254902, 1,
-0.08229812, -0.8812829, -2.316344, 0, 1, 0.7294118, 1,
-0.07664567, 0.171536, -0.3874714, 0, 1, 0.7372549, 1,
-0.0765558, 1.440022, 0.9121408, 0, 1, 0.7411765, 1,
-0.07285914, -1.434714, -2.667547, 0, 1, 0.7490196, 1,
-0.07247483, -0.09006978, -2.811641, 0, 1, 0.7529412, 1,
-0.07127105, 0.4564546, 0.4711072, 0, 1, 0.7607843, 1,
-0.07014912, 0.2662466, 0.9817371, 0, 1, 0.7647059, 1,
-0.06862689, -0.4699177, -1.944725, 0, 1, 0.772549, 1,
-0.06837417, -0.8068941, -0.9062395, 0, 1, 0.7764706, 1,
-0.06826701, 1.929931, -0.4621324, 0, 1, 0.7843137, 1,
-0.06767947, 0.4026776, -1.063561, 0, 1, 0.7882353, 1,
-0.06701329, -0.586666, -4.460548, 0, 1, 0.7960784, 1,
-0.06534326, 0.06907815, -1.039862, 0, 1, 0.8039216, 1,
-0.06426521, -0.1500168, -3.413508, 0, 1, 0.8078431, 1,
-0.05929374, 0.1644757, -0.8239157, 0, 1, 0.8156863, 1,
-0.05545497, 1.494558, -0.8119411, 0, 1, 0.8196079, 1,
-0.05197172, 0.3653935, 0.2480938, 0, 1, 0.827451, 1,
-0.05194849, 0.3616928, 0.5152146, 0, 1, 0.8313726, 1,
-0.04895507, -0.4029341, -2.415466, 0, 1, 0.8392157, 1,
-0.04869343, -0.8779315, -4.651317, 0, 1, 0.8431373, 1,
-0.04841286, -2.001477, -2.315941, 0, 1, 0.8509804, 1,
-0.04460401, 0.8835523, -1.543346, 0, 1, 0.854902, 1,
-0.04216669, -0.4341711, -2.712734, 0, 1, 0.8627451, 1,
-0.04013366, 2.574805, -0.2697133, 0, 1, 0.8666667, 1,
-0.03173754, -0.7846294, -2.560413, 0, 1, 0.8745098, 1,
-0.03163354, 0.2010629, -0.05498072, 0, 1, 0.8784314, 1,
-0.02858769, -0.07949481, -2.209535, 0, 1, 0.8862745, 1,
-0.02779129, 0.9713237, -0.9580755, 0, 1, 0.8901961, 1,
-0.02390011, 0.8360088, -1.438969, 0, 1, 0.8980392, 1,
-0.02370252, -0.1188617, -2.342151, 0, 1, 0.9058824, 1,
-0.0216558, -0.6630771, -3.14754, 0, 1, 0.9098039, 1,
-0.02127147, -0.3760538, -3.929329, 0, 1, 0.9176471, 1,
-0.02028943, 0.4631479, -1.225852, 0, 1, 0.9215686, 1,
-0.01113272, 0.1642777, 0.0503674, 0, 1, 0.9294118, 1,
-0.01084886, -0.6646205, -1.113181, 0, 1, 0.9333333, 1,
-0.001519992, -1.392025, -3.058398, 0, 1, 0.9411765, 1,
-0.0004259209, 1.120513, -0.9909547, 0, 1, 0.945098, 1,
0.0006776315, 1.221104, 0.05205527, 0, 1, 0.9529412, 1,
0.001026653, 0.7725165, 0.1021657, 0, 1, 0.9568627, 1,
0.008491296, -0.2147478, 4.06846, 0, 1, 0.9647059, 1,
0.01548814, 0.4562055, 1.257122, 0, 1, 0.9686275, 1,
0.02056352, -1.298252, 4.73598, 0, 1, 0.9764706, 1,
0.02326451, -0.538295, 4.015422, 0, 1, 0.9803922, 1,
0.03109241, -0.09981687, 3.332201, 0, 1, 0.9882353, 1,
0.0313229, 1.924438, -1.129413, 0, 1, 0.9921569, 1,
0.03572493, 0.1003687, -0.5120841, 0, 1, 1, 1,
0.0368317, -0.2058997, 3.538352, 0, 0.9921569, 1, 1,
0.04149491, 0.9607055, -0.05413099, 0, 0.9882353, 1, 1,
0.04156469, -0.2901185, 2.960644, 0, 0.9803922, 1, 1,
0.04384806, -0.09454753, 2.65993, 0, 0.9764706, 1, 1,
0.04611612, 0.09736268, 1.400882, 0, 0.9686275, 1, 1,
0.04620345, 1.607881, -1.661452, 0, 0.9647059, 1, 1,
0.0470763, 1.290167, 1.556249, 0, 0.9568627, 1, 1,
0.05289087, 0.1303206, 1.389025, 0, 0.9529412, 1, 1,
0.05408575, 0.9494908, 1.159521, 0, 0.945098, 1, 1,
0.05454892, -1.106719, 2.501431, 0, 0.9411765, 1, 1,
0.05914864, -0.03578895, 2.261804, 0, 0.9333333, 1, 1,
0.06309096, -0.3995956, 3.260436, 0, 0.9294118, 1, 1,
0.06490374, -1.538649, 4.035674, 0, 0.9215686, 1, 1,
0.0657272, -0.6826198, 1.226326, 0, 0.9176471, 1, 1,
0.07002375, 0.6964443, -1.324192, 0, 0.9098039, 1, 1,
0.0713475, 0.2170085, -0.4796386, 0, 0.9058824, 1, 1,
0.07208043, 0.488183, -0.7267262, 0, 0.8980392, 1, 1,
0.07232294, 0.4302961, -0.5152819, 0, 0.8901961, 1, 1,
0.07638112, -1.930156, 4.085273, 0, 0.8862745, 1, 1,
0.07733915, 0.6442011, 0.7275987, 0, 0.8784314, 1, 1,
0.07840899, 1.067373, -1.097264, 0, 0.8745098, 1, 1,
0.08144693, -0.3929544, 3.863163, 0, 0.8666667, 1, 1,
0.08874071, 1.078406, 0.289392, 0, 0.8627451, 1, 1,
0.08946364, -0.9576226, 2.96207, 0, 0.854902, 1, 1,
0.09561054, -0.9970549, 2.27222, 0, 0.8509804, 1, 1,
0.0978241, 0.9559296, 0.2675246, 0, 0.8431373, 1, 1,
0.09860449, 0.5068017, -0.3241341, 0, 0.8392157, 1, 1,
0.1021372, -0.5311264, 2.932511, 0, 0.8313726, 1, 1,
0.1083145, -1.289696, 1.615934, 0, 0.827451, 1, 1,
0.1100658, 0.02767503, 0.9131577, 0, 0.8196079, 1, 1,
0.1128281, 0.097144, 2.035155, 0, 0.8156863, 1, 1,
0.112845, 0.4199602, 1.183476, 0, 0.8078431, 1, 1,
0.1159096, 0.1620319, 0.6048176, 0, 0.8039216, 1, 1,
0.1174383, -1.567841, 2.910316, 0, 0.7960784, 1, 1,
0.1198301, 1.022517, 0.3318048, 0, 0.7882353, 1, 1,
0.124364, 0.4390779, -0.2050932, 0, 0.7843137, 1, 1,
0.133682, 0.8121079, 0.8094236, 0, 0.7764706, 1, 1,
0.1392705, 0.02411466, 1.506114, 0, 0.772549, 1, 1,
0.1472866, 0.2631439, 2.394359, 0, 0.7647059, 1, 1,
0.1505311, 1.246565, 0.8047957, 0, 0.7607843, 1, 1,
0.1564822, -0.3454028, 0.7397175, 0, 0.7529412, 1, 1,
0.1577949, 0.1406278, 1.318732, 0, 0.7490196, 1, 1,
0.1587629, 0.4253841, 0.3220159, 0, 0.7411765, 1, 1,
0.1707577, 0.9395497, -0.7501325, 0, 0.7372549, 1, 1,
0.1735573, -1.103811, 3.727222, 0, 0.7294118, 1, 1,
0.1740372, -0.4048204, 3.111992, 0, 0.7254902, 1, 1,
0.176317, -0.5058516, 2.992618, 0, 0.7176471, 1, 1,
0.176688, 1.390658, -0.6555831, 0, 0.7137255, 1, 1,
0.1770417, -0.1061165, 2.740756, 0, 0.7058824, 1, 1,
0.1806883, 0.1263319, 0.5625404, 0, 0.6980392, 1, 1,
0.18384, -0.2493618, 2.738286, 0, 0.6941177, 1, 1,
0.1845928, 0.2705455, 1.877765, 0, 0.6862745, 1, 1,
0.1848213, -1.26073, 2.820783, 0, 0.682353, 1, 1,
0.1897653, 0.6209071, -0.0669105, 0, 0.6745098, 1, 1,
0.1903049, -1.73749, 3.092175, 0, 0.6705883, 1, 1,
0.191468, 1.526209, 0.1141235, 0, 0.6627451, 1, 1,
0.1915439, 0.8161151, 1.283269, 0, 0.6588235, 1, 1,
0.1918309, 0.3603852, 0.06694748, 0, 0.6509804, 1, 1,
0.1962693, -0.2103896, 3.632691, 0, 0.6470588, 1, 1,
0.1977905, 0.7011324, -1.453601, 0, 0.6392157, 1, 1,
0.1986421, -0.1119437, 1.81584, 0, 0.6352941, 1, 1,
0.1990437, -1.108821, 4.245139, 0, 0.627451, 1, 1,
0.2002133, 0.8766671, 0.7093142, 0, 0.6235294, 1, 1,
0.2033876, -0.005483893, 1.29961, 0, 0.6156863, 1, 1,
0.2046371, -0.9366975, 3.537134, 0, 0.6117647, 1, 1,
0.205299, 0.1398012, 1.218547, 0, 0.6039216, 1, 1,
0.2118551, -0.1107472, 1.027525, 0, 0.5960785, 1, 1,
0.2138121, -1.544091, 2.538781, 0, 0.5921569, 1, 1,
0.2143733, -0.1233033, 2.02742, 0, 0.5843138, 1, 1,
0.2153362, -0.493875, 2.512339, 0, 0.5803922, 1, 1,
0.2158949, -0.06021722, 0.5313298, 0, 0.572549, 1, 1,
0.2256977, -0.6609727, 1.635643, 0, 0.5686275, 1, 1,
0.2266978, 1.006859, -0.69527, 0, 0.5607843, 1, 1,
0.2354398, -0.8004435, 3.290008, 0, 0.5568628, 1, 1,
0.2382166, -1.602295, 4.425255, 0, 0.5490196, 1, 1,
0.2382786, -0.3547799, 2.808976, 0, 0.5450981, 1, 1,
0.2398217, 1.376304, 1.037711, 0, 0.5372549, 1, 1,
0.2421604, 0.87069, 2.153749, 0, 0.5333334, 1, 1,
0.2426355, 0.2167895, -0.1440325, 0, 0.5254902, 1, 1,
0.2453249, 0.4020452, 0.2726156, 0, 0.5215687, 1, 1,
0.2476688, -1.209349, 2.15942, 0, 0.5137255, 1, 1,
0.2479314, 0.3097041, 0.8424619, 0, 0.509804, 1, 1,
0.2488318, -2.183297, 4.304561, 0, 0.5019608, 1, 1,
0.2539745, -0.7001119, 4.59822, 0, 0.4941176, 1, 1,
0.259104, 0.7285198, -0.2499164, 0, 0.4901961, 1, 1,
0.2603434, -0.2144852, 3.253738, 0, 0.4823529, 1, 1,
0.2618954, -1.547158, 2.796649, 0, 0.4784314, 1, 1,
0.2623275, 0.7339928, 0.2223419, 0, 0.4705882, 1, 1,
0.262567, -1.137392, 2.649565, 0, 0.4666667, 1, 1,
0.2642704, 0.8016677, 2.222532, 0, 0.4588235, 1, 1,
0.2649647, 0.1525041, 0.8106924, 0, 0.454902, 1, 1,
0.2674799, 0.563352, -0.2630275, 0, 0.4470588, 1, 1,
0.2687604, 0.1535992, -1.397231, 0, 0.4431373, 1, 1,
0.2689182, 0.8522272, 0.2364523, 0, 0.4352941, 1, 1,
0.2698839, 0.1313272, -0.01125126, 0, 0.4313726, 1, 1,
0.270697, -1.208361, 4.702693, 0, 0.4235294, 1, 1,
0.2725929, 0.3335555, 0.2403378, 0, 0.4196078, 1, 1,
0.2738292, 0.7120788, 0.2279648, 0, 0.4117647, 1, 1,
0.2758889, -0.5460823, 3.171019, 0, 0.4078431, 1, 1,
0.2774211, 0.3634466, -0.6494051, 0, 0.4, 1, 1,
0.2781357, -0.2648928, 1.919556, 0, 0.3921569, 1, 1,
0.2787222, -0.2063917, 4.773894, 0, 0.3882353, 1, 1,
0.278943, -0.09078556, 2.045594, 0, 0.3803922, 1, 1,
0.2828266, 0.9757561, -0.2652233, 0, 0.3764706, 1, 1,
0.2855037, -3.389483, 3.759431, 0, 0.3686275, 1, 1,
0.2911122, -0.5420901, 0.9885576, 0, 0.3647059, 1, 1,
0.2945943, 1.047168, -0.5188021, 0, 0.3568628, 1, 1,
0.2950872, -0.09677362, 1.717031, 0, 0.3529412, 1, 1,
0.3021987, 0.9782341, 2.201607, 0, 0.345098, 1, 1,
0.3057698, -0.02638282, 1.753352, 0, 0.3411765, 1, 1,
0.3076518, 2.09222, 0.4402739, 0, 0.3333333, 1, 1,
0.3112208, -1.424472, 2.560127, 0, 0.3294118, 1, 1,
0.3161601, -0.3826526, 1.327005, 0, 0.3215686, 1, 1,
0.3166305, 0.7815857, 2.578415, 0, 0.3176471, 1, 1,
0.3190989, -0.6238438, 0.7746943, 0, 0.3098039, 1, 1,
0.319466, -0.3798414, 2.184556, 0, 0.3058824, 1, 1,
0.3221382, 1.038056, 1.550705, 0, 0.2980392, 1, 1,
0.3266618, -0.1622086, 1.051124, 0, 0.2901961, 1, 1,
0.3298477, -0.6696672, 4.457083, 0, 0.2862745, 1, 1,
0.3317794, 0.3339394, 1.945985, 0, 0.2784314, 1, 1,
0.3333498, 2.317221, -1.836918, 0, 0.2745098, 1, 1,
0.3337803, 0.0602354, 1.036165, 0, 0.2666667, 1, 1,
0.3365032, -0.2566612, 2.561448, 0, 0.2627451, 1, 1,
0.3405016, 0.2726048, 0.64978, 0, 0.254902, 1, 1,
0.3407534, -1.765703, 4.332993, 0, 0.2509804, 1, 1,
0.345107, 0.6237923, 1.887929, 0, 0.2431373, 1, 1,
0.3460012, -0.00384591, 1.480496, 0, 0.2392157, 1, 1,
0.3466153, 0.1527266, 0.2294385, 0, 0.2313726, 1, 1,
0.3477926, -0.1035018, 2.557404, 0, 0.227451, 1, 1,
0.3486269, 0.1334024, 1.299585, 0, 0.2196078, 1, 1,
0.3487677, -0.2145814, 0.14039, 0, 0.2156863, 1, 1,
0.352378, -1.049989, 3.718555, 0, 0.2078431, 1, 1,
0.3573109, 0.4358631, 0.2765441, 0, 0.2039216, 1, 1,
0.3604246, 0.9457946, 0.7164442, 0, 0.1960784, 1, 1,
0.3630006, -0.5827039, 1.95218, 0, 0.1882353, 1, 1,
0.3725776, -0.6218801, 3.130139, 0, 0.1843137, 1, 1,
0.3755971, 0.1762227, -0.02811299, 0, 0.1764706, 1, 1,
0.3799481, -0.3847957, 2.889678, 0, 0.172549, 1, 1,
0.3821783, -0.6135939, 1.879453, 0, 0.1647059, 1, 1,
0.3823272, 0.1301969, 0.636429, 0, 0.1607843, 1, 1,
0.3901798, 0.4160173, 1.330296, 0, 0.1529412, 1, 1,
0.3907607, -0.2029928, 3.545355, 0, 0.1490196, 1, 1,
0.3924387, 0.1970132, 2.430818, 0, 0.1411765, 1, 1,
0.3926527, 0.4941586, 2.39662, 0, 0.1372549, 1, 1,
0.3941901, 0.003397363, 1.827717, 0, 0.1294118, 1, 1,
0.3957736, 0.7936069, 0.9489537, 0, 0.1254902, 1, 1,
0.4055049, 1.535148, 1.018669, 0, 0.1176471, 1, 1,
0.4063544, 0.02565899, 0.7551922, 0, 0.1137255, 1, 1,
0.4112802, -0.7871425, 1.60483, 0, 0.1058824, 1, 1,
0.4159324, 0.4113708, 1.855355, 0, 0.09803922, 1, 1,
0.4184968, -0.5714265, 3.42645, 0, 0.09411765, 1, 1,
0.4185056, 0.776397, 1.335603, 0, 0.08627451, 1, 1,
0.4189858, -0.6469618, 3.076648, 0, 0.08235294, 1, 1,
0.4246853, 0.5314682, 0.09951215, 0, 0.07450981, 1, 1,
0.4261622, 0.6483362, -1.079102, 0, 0.07058824, 1, 1,
0.4306693, -0.4814808, 4.564979, 0, 0.0627451, 1, 1,
0.4320502, -0.1436132, 1.642567, 0, 0.05882353, 1, 1,
0.4364922, -0.3571718, 3.377096, 0, 0.05098039, 1, 1,
0.4365547, -0.9170803, 3.361789, 0, 0.04705882, 1, 1,
0.4445846, 0.1017175, 1.42819, 0, 0.03921569, 1, 1,
0.4459266, 0.9230697, -0.5203993, 0, 0.03529412, 1, 1,
0.4582685, 0.06441211, 0.00557547, 0, 0.02745098, 1, 1,
0.4583595, 0.1291636, 1.314221, 0, 0.02352941, 1, 1,
0.4613424, -1.301654, 3.972943, 0, 0.01568628, 1, 1,
0.463464, 1.484336, 0.3478267, 0, 0.01176471, 1, 1,
0.4636003, 2.124934, -0.2005591, 0, 0.003921569, 1, 1,
0.4728311, -1.980245, 2.495686, 0.003921569, 0, 1, 1,
0.4822003, 0.7410898, -1.204676, 0.007843138, 0, 1, 1,
0.4839659, -0.0608213, 3.149776, 0.01568628, 0, 1, 1,
0.4875835, 0.02424008, 1.813806, 0.01960784, 0, 1, 1,
0.4894147, 0.9277979, 1.510919, 0.02745098, 0, 1, 1,
0.4965054, -0.6267065, 3.370271, 0.03137255, 0, 1, 1,
0.5019054, -0.7268808, 1.8153, 0.03921569, 0, 1, 1,
0.5080613, -1.153662, 4.242845, 0.04313726, 0, 1, 1,
0.513548, 0.001786657, 1.158968, 0.05098039, 0, 1, 1,
0.5167887, 0.462804, 0.3258068, 0.05490196, 0, 1, 1,
0.5171119, 0.5310515, 2.545072, 0.0627451, 0, 1, 1,
0.5172374, -0.3840746, 1.172647, 0.06666667, 0, 1, 1,
0.5191735, -0.9134056, 2.710022, 0.07450981, 0, 1, 1,
0.5199152, -0.1191702, 2.201311, 0.07843138, 0, 1, 1,
0.5201305, -1.918339, 1.044781, 0.08627451, 0, 1, 1,
0.5215473, -1.363479, 4.689582, 0.09019608, 0, 1, 1,
0.5234396, 1.478092, 1.590374, 0.09803922, 0, 1, 1,
0.5254717, -0.3829208, 2.614167, 0.1058824, 0, 1, 1,
0.528753, -1.157838, 2.398502, 0.1098039, 0, 1, 1,
0.5360987, -0.3123089, 2.398016, 0.1176471, 0, 1, 1,
0.5370293, 0.2808383, 1.836428, 0.1215686, 0, 1, 1,
0.5373485, -0.3550571, 3.301446, 0.1294118, 0, 1, 1,
0.5406067, 1.813223, 0.2722076, 0.1333333, 0, 1, 1,
0.5437297, -2.029318, 2.676696, 0.1411765, 0, 1, 1,
0.5594967, -0.2638445, 3.532593, 0.145098, 0, 1, 1,
0.5606835, 0.440556, -0.02305969, 0.1529412, 0, 1, 1,
0.5610061, -0.6665593, 1.440204, 0.1568628, 0, 1, 1,
0.5685628, 0.8731347, 2.502773, 0.1647059, 0, 1, 1,
0.5685917, 0.8591275, 1.603054, 0.1686275, 0, 1, 1,
0.5714082, 0.8389667, 0.2096375, 0.1764706, 0, 1, 1,
0.5755644, -0.7806652, 3.453463, 0.1803922, 0, 1, 1,
0.5766243, -0.2394883, 2.60247, 0.1882353, 0, 1, 1,
0.5798265, -0.9568875, 1.47264, 0.1921569, 0, 1, 1,
0.5848204, 0.5092558, 1.094251, 0.2, 0, 1, 1,
0.5878472, -1.317082, 0.9251318, 0.2078431, 0, 1, 1,
0.5884346, -1.122901, 2.277755, 0.2117647, 0, 1, 1,
0.5895814, -0.7258499, 3.409292, 0.2196078, 0, 1, 1,
0.5928876, -0.6105936, 4.323684, 0.2235294, 0, 1, 1,
0.6008232, -0.06507938, 0.3486982, 0.2313726, 0, 1, 1,
0.6026579, 0.2797162, 1.737238, 0.2352941, 0, 1, 1,
0.60378, 0.6093458, -0.03489142, 0.2431373, 0, 1, 1,
0.6075037, -0.7799363, 3.196604, 0.2470588, 0, 1, 1,
0.6132698, -0.1433321, 0.6728106, 0.254902, 0, 1, 1,
0.6134557, 1.203619, -0.3516226, 0.2588235, 0, 1, 1,
0.6170397, -0.7338164, 3.52111, 0.2666667, 0, 1, 1,
0.6176636, -0.7776034, 2.370953, 0.2705882, 0, 1, 1,
0.6190333, -1.422662, 0.6665107, 0.2784314, 0, 1, 1,
0.6199316, 1.407037, 0.02249709, 0.282353, 0, 1, 1,
0.6210915, -1.300881, 1.07074, 0.2901961, 0, 1, 1,
0.6241851, 0.2262527, 2.44398, 0.2941177, 0, 1, 1,
0.6248184, 0.1806253, 3.669654, 0.3019608, 0, 1, 1,
0.6350881, -1.005784, 1.784715, 0.3098039, 0, 1, 1,
0.6356192, -0.7089618, 2.481213, 0.3137255, 0, 1, 1,
0.6388953, 1.131152, -1.00746, 0.3215686, 0, 1, 1,
0.642089, -0.7691125, 3.814189, 0.3254902, 0, 1, 1,
0.6485653, 1.016475, -0.6375831, 0.3333333, 0, 1, 1,
0.6614856, 0.4902762, 0.5523522, 0.3372549, 0, 1, 1,
0.6621211, 0.2828673, 1.996473, 0.345098, 0, 1, 1,
0.6629704, 0.6906642, 1.803947, 0.3490196, 0, 1, 1,
0.6677713, -0.5996839, 2.578794, 0.3568628, 0, 1, 1,
0.6683133, 0.4588165, 1.646715, 0.3607843, 0, 1, 1,
0.6697987, 0.06411858, 1.763533, 0.3686275, 0, 1, 1,
0.6757276, -0.08758599, 1.411752, 0.372549, 0, 1, 1,
0.6770552, 2.076034, -0.3762109, 0.3803922, 0, 1, 1,
0.679331, 0.7586565, 0.3013831, 0.3843137, 0, 1, 1,
0.6810344, 1.503044, 0.9622101, 0.3921569, 0, 1, 1,
0.681857, 0.2027447, 0.6794059, 0.3960784, 0, 1, 1,
0.6818631, 0.01861248, 2.63164, 0.4039216, 0, 1, 1,
0.6826249, -1.153741, 2.924317, 0.4117647, 0, 1, 1,
0.6932303, -0.313912, 1.50392, 0.4156863, 0, 1, 1,
0.6944665, 0.7263799, -0.2784974, 0.4235294, 0, 1, 1,
0.7048374, -0.3888241, 3.412769, 0.427451, 0, 1, 1,
0.7064651, 1.058372, 1.046045, 0.4352941, 0, 1, 1,
0.7082233, -1.700642, 3.846572, 0.4392157, 0, 1, 1,
0.7096855, -0.3416512, 0.4261163, 0.4470588, 0, 1, 1,
0.7107776, 0.175299, 1.3884, 0.4509804, 0, 1, 1,
0.7142796, 0.4980039, 0.9660124, 0.4588235, 0, 1, 1,
0.7176808, -0.03632373, 0.2445704, 0.4627451, 0, 1, 1,
0.7234145, -1.88894, 3.957277, 0.4705882, 0, 1, 1,
0.7285404, 0.4137529, -1.28647, 0.4745098, 0, 1, 1,
0.7366765, 1.212655, -1.314004, 0.4823529, 0, 1, 1,
0.7394544, 1.807024, 0.649833, 0.4862745, 0, 1, 1,
0.7423386, -1.377892, 3.36701, 0.4941176, 0, 1, 1,
0.7502585, 1.118448, 1.418003, 0.5019608, 0, 1, 1,
0.759401, 0.283677, 1.908346, 0.5058824, 0, 1, 1,
0.7647024, 0.7099619, 2.438614, 0.5137255, 0, 1, 1,
0.7647149, -0.2499261, 1.765462, 0.5176471, 0, 1, 1,
0.7696545, -2.72747, 1.865872, 0.5254902, 0, 1, 1,
0.7725176, 1.23855, -0.495848, 0.5294118, 0, 1, 1,
0.7725971, 0.7175147, 2.903364, 0.5372549, 0, 1, 1,
0.7760696, 0.03184228, 1.799494, 0.5411765, 0, 1, 1,
0.7786337, 0.8407424, 1.974205, 0.5490196, 0, 1, 1,
0.7823156, 1.196769, -0.9687186, 0.5529412, 0, 1, 1,
0.7833734, 0.2816514, 1.883513, 0.5607843, 0, 1, 1,
0.7963147, 0.8985178, 1.02271, 0.5647059, 0, 1, 1,
0.7967083, -2.596544, 3.914886, 0.572549, 0, 1, 1,
0.7991213, 1.173406, 1.569643, 0.5764706, 0, 1, 1,
0.8004704, -0.245887, 1.377926, 0.5843138, 0, 1, 1,
0.8047175, 1.060752, 1.248647, 0.5882353, 0, 1, 1,
0.8068284, -0.02484768, 0.9390515, 0.5960785, 0, 1, 1,
0.8122467, 0.8927227, 0.8282018, 0.6039216, 0, 1, 1,
0.8137507, 0.323096, 1.19328, 0.6078432, 0, 1, 1,
0.8152215, 1.589292, 1.09245, 0.6156863, 0, 1, 1,
0.8177058, -0.9111291, 1.668643, 0.6196079, 0, 1, 1,
0.8194486, -0.5573354, 2.827337, 0.627451, 0, 1, 1,
0.8212602, 0.3129905, -0.6017971, 0.6313726, 0, 1, 1,
0.8221181, 1.403205, 0.895227, 0.6392157, 0, 1, 1,
0.8229905, -2.019116, 2.794821, 0.6431373, 0, 1, 1,
0.8285266, -0.5561343, 0.7959645, 0.6509804, 0, 1, 1,
0.8352261, 0.8241872, -0.3687889, 0.654902, 0, 1, 1,
0.8367836, 1.819179, 0.2596719, 0.6627451, 0, 1, 1,
0.84062, -0.5780242, 2.345555, 0.6666667, 0, 1, 1,
0.8466134, -0.8732459, 2.790047, 0.6745098, 0, 1, 1,
0.8480384, -0.6259778, 2.783799, 0.6784314, 0, 1, 1,
0.8492084, 0.8027954, 1.729213, 0.6862745, 0, 1, 1,
0.8498216, 1.599453, 0.3147188, 0.6901961, 0, 1, 1,
0.8537068, -0.5548881, 1.559693, 0.6980392, 0, 1, 1,
0.8551552, -0.4454257, 3.737198, 0.7058824, 0, 1, 1,
0.8560783, 0.2274818, 1.405494, 0.7098039, 0, 1, 1,
0.86013, -1.335552, 1.089191, 0.7176471, 0, 1, 1,
0.8701618, -0.6529529, 3.104493, 0.7215686, 0, 1, 1,
0.8703576, -0.2680281, 0.677976, 0.7294118, 0, 1, 1,
0.8723392, -0.5407534, 2.533558, 0.7333333, 0, 1, 1,
0.8775864, 0.7824389, 0.8918811, 0.7411765, 0, 1, 1,
0.8853334, -0.9474229, 2.467378, 0.7450981, 0, 1, 1,
0.8877913, 1.04896, 0.7739945, 0.7529412, 0, 1, 1,
0.8880328, 1.030953, 0.9643436, 0.7568628, 0, 1, 1,
0.891558, 0.9360719, 1.276767, 0.7647059, 0, 1, 1,
0.8956452, 0.4399448, 1.318026, 0.7686275, 0, 1, 1,
0.8957171, 0.3937891, 2.594932, 0.7764706, 0, 1, 1,
0.8974831, 0.3678645, 0.8725142, 0.7803922, 0, 1, 1,
0.9010938, 0.07121835, 0.4967641, 0.7882353, 0, 1, 1,
0.9016875, -1.747471, 2.164193, 0.7921569, 0, 1, 1,
0.9060053, 0.8504561, 0.1465862, 0.8, 0, 1, 1,
0.9146188, -0.249248, 2.452257, 0.8078431, 0, 1, 1,
0.9164608, 1.872823, 0.2655648, 0.8117647, 0, 1, 1,
0.9216018, 0.475421, 1.417676, 0.8196079, 0, 1, 1,
0.9276494, 0.2292299, 2.623728, 0.8235294, 0, 1, 1,
0.9296623, -1.054791, 3.017833, 0.8313726, 0, 1, 1,
0.9346395, 0.1141241, 1.943789, 0.8352941, 0, 1, 1,
0.9465155, -1.363232, 1.07843, 0.8431373, 0, 1, 1,
0.9493399, 1.03828, 0.2011005, 0.8470588, 0, 1, 1,
0.9593301, 0.1349061, 2.367218, 0.854902, 0, 1, 1,
0.9685726, 1.438165, 1.675551, 0.8588235, 0, 1, 1,
0.9704512, -0.4320385, 0.7781058, 0.8666667, 0, 1, 1,
0.9712891, -1.525251, 3.42871, 0.8705882, 0, 1, 1,
0.9730515, 0.05643097, -0.2283685, 0.8784314, 0, 1, 1,
0.9740795, 1.704791, 0.472024, 0.8823529, 0, 1, 1,
0.9762969, -0.8588699, 4.416523, 0.8901961, 0, 1, 1,
0.9858328, 0.1772537, 0.5095032, 0.8941177, 0, 1, 1,
0.991272, -0.5992827, 2.392071, 0.9019608, 0, 1, 1,
0.9924225, 0.9386361, -0.2405149, 0.9098039, 0, 1, 1,
0.9936542, -0.9544768, 2.23234, 0.9137255, 0, 1, 1,
0.9985453, 0.6851071, 1.123158, 0.9215686, 0, 1, 1,
1.00762, 1.874344, 0.703367, 0.9254902, 0, 1, 1,
1.015526, -0.8216424, 1.569081, 0.9333333, 0, 1, 1,
1.017795, 0.2042871, 2.860373, 0.9372549, 0, 1, 1,
1.02632, 0.2670717, -0.03008083, 0.945098, 0, 1, 1,
1.029695, 1.646174, 0.7245892, 0.9490196, 0, 1, 1,
1.03087, 0.5211747, 0.4680835, 0.9568627, 0, 1, 1,
1.035547, -0.4848473, 2.060859, 0.9607843, 0, 1, 1,
1.03831, -1.925591, 2.558969, 0.9686275, 0, 1, 1,
1.039075, 0.6673991, 1.218642, 0.972549, 0, 1, 1,
1.042355, 1.685911, 0.1953827, 0.9803922, 0, 1, 1,
1.048997, -1.876672, 3.123029, 0.9843137, 0, 1, 1,
1.050632, 0.2734007, 1.947221, 0.9921569, 0, 1, 1,
1.051849, 0.6229675, 0.1644298, 0.9960784, 0, 1, 1,
1.054087, 0.1976187, 0.7198826, 1, 0, 0.9960784, 1,
1.059375, 0.8467994, 0.7288116, 1, 0, 0.9882353, 1,
1.061884, 0.2536815, 1.614373, 1, 0, 0.9843137, 1,
1.062126, 1.376571, 0.04851401, 1, 0, 0.9764706, 1,
1.073979, 1.384416, 0.5215327, 1, 0, 0.972549, 1,
1.082262, 1.635268, 2.401923, 1, 0, 0.9647059, 1,
1.086171, 1.457655, -0.8153516, 1, 0, 0.9607843, 1,
1.086786, -0.3860515, 3.170171, 1, 0, 0.9529412, 1,
1.087312, 0.05525351, 2.28402, 1, 0, 0.9490196, 1,
1.088807, -0.6406448, -0.106768, 1, 0, 0.9411765, 1,
1.092396, 0.1781603, 1.391327, 1, 0, 0.9372549, 1,
1.092787, -0.1846952, 1.349119, 1, 0, 0.9294118, 1,
1.093151, 1.669253, 0.9326419, 1, 0, 0.9254902, 1,
1.100411, 0.634249, 2.092694, 1, 0, 0.9176471, 1,
1.100456, -0.1795907, 0.2580369, 1, 0, 0.9137255, 1,
1.101819, 0.4977205, 1.45201, 1, 0, 0.9058824, 1,
1.102684, 1.019893, 0.07741878, 1, 0, 0.9019608, 1,
1.103467, -0.393276, 3.21409, 1, 0, 0.8941177, 1,
1.112354, 1.592795, 0.8852738, 1, 0, 0.8862745, 1,
1.122159, 1.520206, 0.8938549, 1, 0, 0.8823529, 1,
1.126733, 0.5562143, -0.3799202, 1, 0, 0.8745098, 1,
1.131598, 0.04194688, 1.680957, 1, 0, 0.8705882, 1,
1.137203, -1.359464, 1.705404, 1, 0, 0.8627451, 1,
1.141037, 1.173468, 0.9938796, 1, 0, 0.8588235, 1,
1.149401, -0.1396753, 2.086525, 1, 0, 0.8509804, 1,
1.156712, 2.431911, 0.9784113, 1, 0, 0.8470588, 1,
1.164283, 0.3910759, 0.5796552, 1, 0, 0.8392157, 1,
1.16523, 0.3866824, 0.691746, 1, 0, 0.8352941, 1,
1.16728, 0.1200989, 1.069518, 1, 0, 0.827451, 1,
1.173818, 1.343141, 0.5658061, 1, 0, 0.8235294, 1,
1.175317, -1.429511, 0.7615467, 1, 0, 0.8156863, 1,
1.177341, -1.277619, 2.652857, 1, 0, 0.8117647, 1,
1.185603, 1.773807, 0.09310758, 1, 0, 0.8039216, 1,
1.188778, -0.07606972, 2.085075, 1, 0, 0.7960784, 1,
1.191977, 1.533232, 0.9882684, 1, 0, 0.7921569, 1,
1.192491, -0.586136, 2.548352, 1, 0, 0.7843137, 1,
1.197321, 1.166131, 0.1689241, 1, 0, 0.7803922, 1,
1.207195, -0.9777509, 1.918546, 1, 0, 0.772549, 1,
1.217916, -0.5081598, 2.416424, 1, 0, 0.7686275, 1,
1.219038, -0.1378333, 1.429568, 1, 0, 0.7607843, 1,
1.229735, -1.557941, 0.879804, 1, 0, 0.7568628, 1,
1.232966, -1.016482, 2.771771, 1, 0, 0.7490196, 1,
1.24003, -0.8107887, 1.17406, 1, 0, 0.7450981, 1,
1.24848, 0.7755866, 0.5302063, 1, 0, 0.7372549, 1,
1.251655, 0.9528149, -0.6500491, 1, 0, 0.7333333, 1,
1.257691, 2.25888, -0.2202128, 1, 0, 0.7254902, 1,
1.268982, 0.2732514, 2.585912, 1, 0, 0.7215686, 1,
1.274662, -0.5869066, 0.2703877, 1, 0, 0.7137255, 1,
1.280316, -0.3366348, 2.699034, 1, 0, 0.7098039, 1,
1.292068, -0.02000064, 2.503594, 1, 0, 0.7019608, 1,
1.299655, -0.7659452, 0.9738712, 1, 0, 0.6941177, 1,
1.302866, -0.2146553, 0.01649189, 1, 0, 0.6901961, 1,
1.307948, -0.8428974, 1.620748, 1, 0, 0.682353, 1,
1.318348, 0.3312199, 1.122805, 1, 0, 0.6784314, 1,
1.318587, 0.3460855, 2.517735, 1, 0, 0.6705883, 1,
1.319391, 0.846532, 1.157011, 1, 0, 0.6666667, 1,
1.329541, 0.5049105, 0.5192126, 1, 0, 0.6588235, 1,
1.343189, 0.8811179, 1.990679, 1, 0, 0.654902, 1,
1.344719, 0.09601779, 0.6718602, 1, 0, 0.6470588, 1,
1.347907, 0.7921674, -2.547821, 1, 0, 0.6431373, 1,
1.351017, 1.516156, 1.136817, 1, 0, 0.6352941, 1,
1.359099, -2.118904, 3.687684, 1, 0, 0.6313726, 1,
1.360996, -1.483319, 2.997438, 1, 0, 0.6235294, 1,
1.362413, -1.111635, 1.302649, 1, 0, 0.6196079, 1,
1.366505, -1.015829, 2.494362, 1, 0, 0.6117647, 1,
1.369017, -0.8354431, 2.71648, 1, 0, 0.6078432, 1,
1.370255, -1.708813, 3.534672, 1, 0, 0.6, 1,
1.389768, 1.34497, 2.177079, 1, 0, 0.5921569, 1,
1.392512, -0.6767126, 2.018771, 1, 0, 0.5882353, 1,
1.393431, -0.7308132, 2.461885, 1, 0, 0.5803922, 1,
1.394913, 0.5097662, 2.427294, 1, 0, 0.5764706, 1,
1.39708, 0.5620691, 0.9983249, 1, 0, 0.5686275, 1,
1.399138, 0.4796854, 0.568902, 1, 0, 0.5647059, 1,
1.405134, 1.464658, 2.117455, 1, 0, 0.5568628, 1,
1.410323, -1.110244, 1.093903, 1, 0, 0.5529412, 1,
1.413795, -0.158491, 0.930833, 1, 0, 0.5450981, 1,
1.414884, 0.3863991, 2.089719, 1, 0, 0.5411765, 1,
1.416852, 1.244249, 1.643541, 1, 0, 0.5333334, 1,
1.425766, 0.903218, 1.589932, 1, 0, 0.5294118, 1,
1.427249, -0.3027423, 0.9162336, 1, 0, 0.5215687, 1,
1.438949, 1.008567, 0.9236703, 1, 0, 0.5176471, 1,
1.441373, -1.279398, 1.141129, 1, 0, 0.509804, 1,
1.446157, -1.375156, 1.962188, 1, 0, 0.5058824, 1,
1.451605, -1.385428, 1.920836, 1, 0, 0.4980392, 1,
1.465864, 0.3969462, -0.0343448, 1, 0, 0.4901961, 1,
1.467763, -1.24778, 1.469163, 1, 0, 0.4862745, 1,
1.468314, -1.033489, 2.791615, 1, 0, 0.4784314, 1,
1.476768, 1.814822, 0.8588808, 1, 0, 0.4745098, 1,
1.478199, 0.4040169, 1.447787, 1, 0, 0.4666667, 1,
1.486813, -0.04998623, 2.272122, 1, 0, 0.4627451, 1,
1.487966, 0.7471272, 1.857391, 1, 0, 0.454902, 1,
1.490829, -0.06083529, 1.362996, 1, 0, 0.4509804, 1,
1.50889, 0.2764597, 2.932455, 1, 0, 0.4431373, 1,
1.509943, 0.06032827, 1.051281, 1, 0, 0.4392157, 1,
1.510724, -0.2920256, 2.323384, 1, 0, 0.4313726, 1,
1.540893, 0.8406532, 1.820138, 1, 0, 0.427451, 1,
1.543185, -0.3268821, 0.339203, 1, 0, 0.4196078, 1,
1.58889, -0.3734715, 2.955415, 1, 0, 0.4156863, 1,
1.589774, 0.7695418, 0.1400896, 1, 0, 0.4078431, 1,
1.613913, -0.279887, 1.671444, 1, 0, 0.4039216, 1,
1.630552, -1.953545, 1.673074, 1, 0, 0.3960784, 1,
1.65034, 0.2188669, 0.4775814, 1, 0, 0.3882353, 1,
1.663808, 1.10215, -0.001966341, 1, 0, 0.3843137, 1,
1.677062, 0.4801391, 2.457458, 1, 0, 0.3764706, 1,
1.696519, -0.3011566, 2.385535, 1, 0, 0.372549, 1,
1.707807, -0.6731021, 1.593174, 1, 0, 0.3647059, 1,
1.713944, -2.361867, 2.135754, 1, 0, 0.3607843, 1,
1.71517, 1.384428, -0.1603835, 1, 0, 0.3529412, 1,
1.715333, -0.02657381, 0.7643859, 1, 0, 0.3490196, 1,
1.721492, -0.6505709, 1.054122, 1, 0, 0.3411765, 1,
1.725607, 0.8277508, 0.9434205, 1, 0, 0.3372549, 1,
1.73481, -1.704111, 2.33526, 1, 0, 0.3294118, 1,
1.738141, 0.164023, 1.818363, 1, 0, 0.3254902, 1,
1.74871, 1.082875, 0.4149836, 1, 0, 0.3176471, 1,
1.758636, 0.08517991, 2.638478, 1, 0, 0.3137255, 1,
1.778234, -0.1578977, -0.1647801, 1, 0, 0.3058824, 1,
1.795238, -1.197067, 0.4176073, 1, 0, 0.2980392, 1,
1.804484, -0.3580669, 1.814526, 1, 0, 0.2941177, 1,
1.810688, 1.1034, 1.027532, 1, 0, 0.2862745, 1,
1.812855, -0.7705696, 1.868641, 1, 0, 0.282353, 1,
1.819427, -0.8678775, 1.999543, 1, 0, 0.2745098, 1,
1.826096, 0.211552, 1.181358, 1, 0, 0.2705882, 1,
1.852761, 0.1729143, 1.93888, 1, 0, 0.2627451, 1,
1.854216, 1.226251, 0.3066351, 1, 0, 0.2588235, 1,
1.873603, 1.0387, 1.369407, 1, 0, 0.2509804, 1,
1.886813, -0.6004978, 1.521057, 1, 0, 0.2470588, 1,
1.905779, -0.8669474, 2.814487, 1, 0, 0.2392157, 1,
1.910042, -0.5140257, 1.675288, 1, 0, 0.2352941, 1,
1.911944, -0.6231461, 2.099611, 1, 0, 0.227451, 1,
1.912987, 0.5315758, 0.8318961, 1, 0, 0.2235294, 1,
1.924525, 0.1057653, 1.219865, 1, 0, 0.2156863, 1,
1.935733, -0.01053439, 2.552388, 1, 0, 0.2117647, 1,
1.93877, 0.456825, 1.26219, 1, 0, 0.2039216, 1,
1.944316, 1.617032, 3.695751, 1, 0, 0.1960784, 1,
1.944478, -0.02691486, 3.81454, 1, 0, 0.1921569, 1,
1.957268, -0.5577632, 0.09187091, 1, 0, 0.1843137, 1,
1.964981, -1.094681, 2.089306, 1, 0, 0.1803922, 1,
2.016011, -1.276233, 1.833812, 1, 0, 0.172549, 1,
2.03053, -0.1094682, 2.132874, 1, 0, 0.1686275, 1,
2.035007, -0.1879647, 2.023654, 1, 0, 0.1607843, 1,
2.060341, -0.4080256, 0.4235534, 1, 0, 0.1568628, 1,
2.063625, 0.5743582, 1.618593, 1, 0, 0.1490196, 1,
2.101372, 0.4437071, 1.652686, 1, 0, 0.145098, 1,
2.106046, 0.3190826, 0.3122144, 1, 0, 0.1372549, 1,
2.113672, -0.398605, 1.158455, 1, 0, 0.1333333, 1,
2.124102, -0.2464013, 1.165584, 1, 0, 0.1254902, 1,
2.129962, -3.804343, 0.285618, 1, 0, 0.1215686, 1,
2.15489, -0.008861046, 1.963486, 1, 0, 0.1137255, 1,
2.178044, 0.7278876, -0.02858249, 1, 0, 0.1098039, 1,
2.182451, 0.0890946, 0.2684008, 1, 0, 0.1019608, 1,
2.194686, 0.607044, 2.672696, 1, 0, 0.09411765, 1,
2.222424, -0.2810068, 2.712433, 1, 0, 0.09019608, 1,
2.239722, 0.2823429, 0.578292, 1, 0, 0.08235294, 1,
2.252533, -0.3637762, 0.009979359, 1, 0, 0.07843138, 1,
2.262958, 1.161876, 1.568769, 1, 0, 0.07058824, 1,
2.277853, 0.5159828, 2.191098, 1, 0, 0.06666667, 1,
2.324251, -0.03885859, 0.6828347, 1, 0, 0.05882353, 1,
2.353939, -1.342523, 3.342845, 1, 0, 0.05490196, 1,
2.381878, 0.01462721, 2.323869, 1, 0, 0.04705882, 1,
2.437987, -0.3377879, 2.051779, 1, 0, 0.04313726, 1,
2.447677, 1.249483, 0.3823328, 1, 0, 0.03529412, 1,
2.625898, 1.193555, 1.82463, 1, 0, 0.03137255, 1,
2.67231, -0.8767329, 0.3797376, 1, 0, 0.02352941, 1,
2.738687, -3.274454, 3.747222, 1, 0, 0.01960784, 1,
3.009865, -1.277641, 3.668874, 1, 0, 0.01176471, 1,
3.012344, -2.147235, 2.189972, 1, 0, 0.007843138, 1
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
-0.01129806, -4.89572, -6.943284, 0, -0.5, 0.5, 0.5,
-0.01129806, -4.89572, -6.943284, 1, -0.5, 0.5, 0.5,
-0.01129806, -4.89572, -6.943284, 1, 1.5, 0.5, 0.5,
-0.01129806, -4.89572, -6.943284, 0, 1.5, 0.5, 0.5
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
-4.059955, -0.5849411, -6.943284, 0, -0.5, 0.5, 0.5,
-4.059955, -0.5849411, -6.943284, 1, -0.5, 0.5, 0.5,
-4.059955, -0.5849411, -6.943284, 1, 1.5, 0.5, 0.5,
-4.059955, -0.5849411, -6.943284, 0, 1.5, 0.5, 0.5
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
-4.059955, -4.89572, -0.2355876, 0, -0.5, 0.5, 0.5,
-4.059955, -4.89572, -0.2355876, 1, -0.5, 0.5, 0.5,
-4.059955, -4.89572, -0.2355876, 1, 1.5, 0.5, 0.5,
-4.059955, -4.89572, -0.2355876, 0, 1.5, 0.5, 0.5
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
-3, -3.900925, -5.395354,
3, -3.900925, -5.395354,
-3, -3.900925, -5.395354,
-3, -4.066724, -5.653342,
-2, -3.900925, -5.395354,
-2, -4.066724, -5.653342,
-1, -3.900925, -5.395354,
-1, -4.066724, -5.653342,
0, -3.900925, -5.395354,
0, -4.066724, -5.653342,
1, -3.900925, -5.395354,
1, -4.066724, -5.653342,
2, -3.900925, -5.395354,
2, -4.066724, -5.653342,
3, -3.900925, -5.395354,
3, -4.066724, -5.653342
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
-3, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
-3, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
-3, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
-3, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
-2, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
-2, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
-2, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
-2, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
-1, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
-1, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
-1, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
-1, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
0, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
0, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
0, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
0, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
1, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
1, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
1, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
1, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
2, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
2, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
2, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
2, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5,
3, -4.398322, -6.169319, 0, -0.5, 0.5, 0.5,
3, -4.398322, -6.169319, 1, -0.5, 0.5, 0.5,
3, -4.398322, -6.169319, 1, 1.5, 0.5, 0.5,
3, -4.398322, -6.169319, 0, 1.5, 0.5, 0.5
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
-3.125649, -3, -5.395354,
-3.125649, 2, -5.395354,
-3.125649, -3, -5.395354,
-3.281367, -3, -5.653342,
-3.125649, -2, -5.395354,
-3.281367, -2, -5.653342,
-3.125649, -1, -5.395354,
-3.281367, -1, -5.653342,
-3.125649, 0, -5.395354,
-3.281367, 0, -5.653342,
-3.125649, 1, -5.395354,
-3.281367, 1, -5.653342,
-3.125649, 2, -5.395354,
-3.281367, 2, -5.653342
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
-3.592802, -3, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, -3, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, -3, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, -3, -6.169319, 0, 1.5, 0.5, 0.5,
-3.592802, -2, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, -2, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, -2, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, -2, -6.169319, 0, 1.5, 0.5, 0.5,
-3.592802, -1, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, -1, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, -1, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, -1, -6.169319, 0, 1.5, 0.5, 0.5,
-3.592802, 0, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, 0, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, 0, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, 0, -6.169319, 0, 1.5, 0.5, 0.5,
-3.592802, 1, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, 1, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, 1, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, 1, -6.169319, 0, 1.5, 0.5, 0.5,
-3.592802, 2, -6.169319, 0, -0.5, 0.5, 0.5,
-3.592802, 2, -6.169319, 1, -0.5, 0.5, 0.5,
-3.592802, 2, -6.169319, 1, 1.5, 0.5, 0.5,
-3.592802, 2, -6.169319, 0, 1.5, 0.5, 0.5
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
-3.125649, -3.900925, -4,
-3.125649, -3.900925, 4,
-3.125649, -3.900925, -4,
-3.281367, -4.066724, -4,
-3.125649, -3.900925, -2,
-3.281367, -4.066724, -2,
-3.125649, -3.900925, 0,
-3.281367, -4.066724, 0,
-3.125649, -3.900925, 2,
-3.281367, -4.066724, 2,
-3.125649, -3.900925, 4,
-3.281367, -4.066724, 4
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
-3.592802, -4.398322, -4, 0, -0.5, 0.5, 0.5,
-3.592802, -4.398322, -4, 1, -0.5, 0.5, 0.5,
-3.592802, -4.398322, -4, 1, 1.5, 0.5, 0.5,
-3.592802, -4.398322, -4, 0, 1.5, 0.5, 0.5,
-3.592802, -4.398322, -2, 0, -0.5, 0.5, 0.5,
-3.592802, -4.398322, -2, 1, -0.5, 0.5, 0.5,
-3.592802, -4.398322, -2, 1, 1.5, 0.5, 0.5,
-3.592802, -4.398322, -2, 0, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 0, 0, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 0, 1, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 0, 1, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 0, 0, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 2, 0, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 2, 1, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 2, 1, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 2, 0, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 4, 0, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 4, 1, -0.5, 0.5, 0.5,
-3.592802, -4.398322, 4, 1, 1.5, 0.5, 0.5,
-3.592802, -4.398322, 4, 0, 1.5, 0.5, 0.5
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
-3.125649, -3.900925, -5.395354,
-3.125649, 2.731042, -5.395354,
-3.125649, -3.900925, 4.924179,
-3.125649, 2.731042, 4.924179,
-3.125649, -3.900925, -5.395354,
-3.125649, -3.900925, 4.924179,
-3.125649, 2.731042, -5.395354,
-3.125649, 2.731042, 4.924179,
-3.125649, -3.900925, -5.395354,
3.103053, -3.900925, -5.395354,
-3.125649, -3.900925, 4.924179,
3.103053, -3.900925, 4.924179,
-3.125649, 2.731042, -5.395354,
3.103053, 2.731042, -5.395354,
-3.125649, 2.731042, 4.924179,
3.103053, 2.731042, 4.924179,
3.103053, -3.900925, -5.395354,
3.103053, 2.731042, -5.395354,
3.103053, -3.900925, 4.924179,
3.103053, 2.731042, 4.924179,
3.103053, -3.900925, -5.395354,
3.103053, -3.900925, 4.924179,
3.103053, 2.731042, -5.395354,
3.103053, 2.731042, 4.924179
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
var radius = 7.346309;
var distance = 32.68456;
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
mvMatrix.translate( 0.01129806, 0.5849411, 0.2355876 );
mvMatrix.scale( 1.275221, 1.19768, 0.7697028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.68456);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ethyl_acetate<-read.table("ethyl_acetate.xyz")
```

```
## Error in read.table("ethyl_acetate.xyz"): no lines available in input
```

```r
x<-ethyl_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
```

```r
y<-ethyl_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
```

```r
z<-ethyl_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
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
-3.03494, 0.6920584, 2.568323, 0, 0, 1, 1, 1,
-2.991886, 0.5717345, -1.658693, 1, 0, 0, 1, 1,
-2.85069, -1.092551, -2.950504, 1, 0, 0, 1, 1,
-2.727307, -0.6297615, -1.455053, 1, 0, 0, 1, 1,
-2.717338, 0.6663618, -2.265077, 1, 0, 0, 1, 1,
-2.556207, 0.587957, -2.679744, 1, 0, 0, 1, 1,
-2.514137, 0.3292745, -1.384098, 0, 0, 0, 1, 1,
-2.491916, -0.8078649, -1.043245, 0, 0, 0, 1, 1,
-2.481756, -1.06093, -3.455177, 0, 0, 0, 1, 1,
-2.459043, -0.8849478, -2.647007, 0, 0, 0, 1, 1,
-2.45009, -0.7805133, -2.997216, 0, 0, 0, 1, 1,
-2.432881, 2.488199, -2.64957, 0, 0, 0, 1, 1,
-2.284481, -0.102796, -1.093979, 0, 0, 0, 1, 1,
-2.260152, 1.18735, -0.007898701, 1, 1, 1, 1, 1,
-2.211457, 0.2686503, -0.9507926, 1, 1, 1, 1, 1,
-2.172833, -0.8383467, -2.440463, 1, 1, 1, 1, 1,
-2.163059, 0.1650843, -2.960475, 1, 1, 1, 1, 1,
-2.14094, -1.757701, -2.659149, 1, 1, 1, 1, 1,
-2.139453, -0.7068413, -0.9783785, 1, 1, 1, 1, 1,
-2.110878, 0.9461682, -2.129172, 1, 1, 1, 1, 1,
-2.074317, 0.1213213, -0.4472425, 1, 1, 1, 1, 1,
-2.067405, -0.3307943, -3.282221, 1, 1, 1, 1, 1,
-2.055976, -0.09936302, 0.2219363, 1, 1, 1, 1, 1,
-2.007774, 0.7605043, -1.691711, 1, 1, 1, 1, 1,
-2.005606, -1.068984, -1.732163, 1, 1, 1, 1, 1,
-2.004934, -0.5613238, -1.532396, 1, 1, 1, 1, 1,
-2.002448, 2.320893, -0.9304556, 1, 1, 1, 1, 1,
-1.98973, 0.2280399, -2.031003, 1, 1, 1, 1, 1,
-1.983697, -0.01858312, -3.102891, 0, 0, 1, 1, 1,
-1.965976, -1.939322, -2.12161, 1, 0, 0, 1, 1,
-1.961457, -0.1809881, -2.140557, 1, 0, 0, 1, 1,
-1.961109, 0.6776656, -0.7343978, 1, 0, 0, 1, 1,
-1.951801, -1.425575, -2.234294, 1, 0, 0, 1, 1,
-1.945761, 0.06332386, -2.564257, 1, 0, 0, 1, 1,
-1.939553, 0.2241691, -1.444842, 0, 0, 0, 1, 1,
-1.919934, -1.270238, -3.054332, 0, 0, 0, 1, 1,
-1.906936, -1.028141, -2.150463, 0, 0, 0, 1, 1,
-1.904446, 1.905933, 0.8312091, 0, 0, 0, 1, 1,
-1.897286, -0.7228163, -2.057611, 0, 0, 0, 1, 1,
-1.882865, 0.7781155, -2.32644, 0, 0, 0, 1, 1,
-1.862483, 0.510769, -1.094302, 0, 0, 0, 1, 1,
-1.855687, -0.3225361, -1.001826, 1, 1, 1, 1, 1,
-1.847231, -0.6781676, -1.593, 1, 1, 1, 1, 1,
-1.838842, 1.685137, -1.752824, 1, 1, 1, 1, 1,
-1.838678, 0.890041, -0.9573434, 1, 1, 1, 1, 1,
-1.83384, 0.6053206, 0.1741063, 1, 1, 1, 1, 1,
-1.829316, -1.240628, -0.8797503, 1, 1, 1, 1, 1,
-1.815816, 0.7105451, 0.538073, 1, 1, 1, 1, 1,
-1.812093, -0.5826069, -3.344154, 1, 1, 1, 1, 1,
-1.798961, 0.9322731, -0.3235011, 1, 1, 1, 1, 1,
-1.797937, -0.1440077, -1.242021, 1, 1, 1, 1, 1,
-1.785118, -1.619988, -1.723881, 1, 1, 1, 1, 1,
-1.783816, -0.2922303, -0.2038816, 1, 1, 1, 1, 1,
-1.782667, 0.2022835, 0.1789027, 1, 1, 1, 1, 1,
-1.780559, 1.885353, 0.514273, 1, 1, 1, 1, 1,
-1.76954, -0.3137365, -0.7585228, 1, 1, 1, 1, 1,
-1.762062, -0.7816437, -1.588251, 0, 0, 1, 1, 1,
-1.761733, 0.4723794, -0.3070174, 1, 0, 0, 1, 1,
-1.750931, 1.559978, -1.288371, 1, 0, 0, 1, 1,
-1.748807, 1.461874, -0.9504233, 1, 0, 0, 1, 1,
-1.746258, -0.9220977, -1.874205, 1, 0, 0, 1, 1,
-1.735965, 0.2067859, -0.9947631, 1, 0, 0, 1, 1,
-1.693537, 0.1152194, -1.267304, 0, 0, 0, 1, 1,
-1.693356, -0.4622279, -1.488297, 0, 0, 0, 1, 1,
-1.657514, 0.2071164, -1.398084, 0, 0, 0, 1, 1,
-1.654545, -1.159681, -1.374676, 0, 0, 0, 1, 1,
-1.646871, -2.710067, -2.697605, 0, 0, 0, 1, 1,
-1.635323, 1.501964, -0.2451702, 0, 0, 0, 1, 1,
-1.632018, 0.1499773, -1.684599, 0, 0, 0, 1, 1,
-1.622203, 1.608012, -1.972829, 1, 1, 1, 1, 1,
-1.621244, -0.7253442, -2.662839, 1, 1, 1, 1, 1,
-1.614408, 0.4363366, -2.696573, 1, 1, 1, 1, 1,
-1.605096, -0.3528435, -0.5905915, 1, 1, 1, 1, 1,
-1.595448, 0.399788, -2.19488, 1, 1, 1, 1, 1,
-1.558346, -1.234936, -2.123396, 1, 1, 1, 1, 1,
-1.55682, 0.06499597, -1.436587, 1, 1, 1, 1, 1,
-1.555835, -0.4055038, -0.3352323, 1, 1, 1, 1, 1,
-1.552548, -0.2431763, 0.5568565, 1, 1, 1, 1, 1,
-1.538508, -0.8245205, -2.46213, 1, 1, 1, 1, 1,
-1.526648, -1.137382, -1.153497, 1, 1, 1, 1, 1,
-1.520164, -0.3946351, -2.361165, 1, 1, 1, 1, 1,
-1.510869, 0.2989189, -3.549713, 1, 1, 1, 1, 1,
-1.508189, 0.0101111, -0.8156649, 1, 1, 1, 1, 1,
-1.504761, -1.294457, -3.343783, 1, 1, 1, 1, 1,
-1.48781, 0.11019, -1.476427, 0, 0, 1, 1, 1,
-1.481483, -0.6968685, -2.190259, 1, 0, 0, 1, 1,
-1.480587, 0.6582429, -1.643852, 1, 0, 0, 1, 1,
-1.462435, 0.09455101, -0.5858342, 1, 0, 0, 1, 1,
-1.459746, 0.4311962, -1.312482, 1, 0, 0, 1, 1,
-1.447794, 0.04701069, -0.5682445, 1, 0, 0, 1, 1,
-1.42822, -0.7489225, -2.738925, 0, 0, 0, 1, 1,
-1.427133, 0.5424324, 0.0330241, 0, 0, 0, 1, 1,
-1.421934, 0.5506279, 0.2133193, 0, 0, 0, 1, 1,
-1.41886, -0.3606575, -2.5484, 0, 0, 0, 1, 1,
-1.417164, -1.630849, -1.632805, 0, 0, 0, 1, 1,
-1.416643, 0.1457187, -2.571092, 0, 0, 0, 1, 1,
-1.413806, 1.78962, -1.784064, 0, 0, 0, 1, 1,
-1.411281, -0.225157, -1.836754, 1, 1, 1, 1, 1,
-1.397506, 0.6575509, -0.2705947, 1, 1, 1, 1, 1,
-1.393553, 0.8510573, -1.950037, 1, 1, 1, 1, 1,
-1.392173, -2.664047, -1.987883, 1, 1, 1, 1, 1,
-1.38898, 2.551024, 0.05612608, 1, 1, 1, 1, 1,
-1.373496, -0.08521783, -0.745715, 1, 1, 1, 1, 1,
-1.369033, 1.138886, -1.17688, 1, 1, 1, 1, 1,
-1.347457, -0.7406507, -3.40033, 1, 1, 1, 1, 1,
-1.341362, 0.1630164, -2.227856, 1, 1, 1, 1, 1,
-1.334974, -0.1625405, -1.601822, 1, 1, 1, 1, 1,
-1.334158, -1.133395, -2.762796, 1, 1, 1, 1, 1,
-1.330617, 1.453761, -0.9342648, 1, 1, 1, 1, 1,
-1.314736, 0.5553755, -0.1958895, 1, 1, 1, 1, 1,
-1.307147, 0.2288959, -1.700781, 1, 1, 1, 1, 1,
-1.298939, 0.01762808, -1.234853, 1, 1, 1, 1, 1,
-1.292504, 1.555665, -0.3675964, 0, 0, 1, 1, 1,
-1.28982, -0.05046326, -1.82821, 1, 0, 0, 1, 1,
-1.281556, -0.191177, -1.577209, 1, 0, 0, 1, 1,
-1.277994, -1.116838, -3.767925, 1, 0, 0, 1, 1,
-1.259644, 0.2986058, -0.3348747, 1, 0, 0, 1, 1,
-1.257683, 0.4123083, -1.589613, 1, 0, 0, 1, 1,
-1.256439, -0.9440368, -2.753902, 0, 0, 0, 1, 1,
-1.255399, -0.3206363, -2.797796, 0, 0, 0, 1, 1,
-1.253972, -1.335653, -4.078251, 0, 0, 0, 1, 1,
-1.245146, 0.5635609, -0.1320038, 0, 0, 0, 1, 1,
-1.243723, 1.889278, 0.5147902, 0, 0, 0, 1, 1,
-1.234773, -0.2254986, -2.226287, 0, 0, 0, 1, 1,
-1.225327, -0.9300511, -2.292444, 0, 0, 0, 1, 1,
-1.223375, 0.1605233, -0.9545789, 1, 1, 1, 1, 1,
-1.222237, -0.8724766, -3.170379, 1, 1, 1, 1, 1,
-1.222085, -0.5685036, -2.09866, 1, 1, 1, 1, 1,
-1.221397, 1.537667, -0.6981682, 1, 1, 1, 1, 1,
-1.220532, 1.030913, -1.193019, 1, 1, 1, 1, 1,
-1.220031, 1.105479, -0.9828081, 1, 1, 1, 1, 1,
-1.207855, 1.232255, -0.1911328, 1, 1, 1, 1, 1,
-1.191981, 0.8075501, -0.3821649, 1, 1, 1, 1, 1,
-1.190946, -1.119497, -3.024983, 1, 1, 1, 1, 1,
-1.187357, 0.3448727, -3.366889, 1, 1, 1, 1, 1,
-1.178123, -1.134648, -1.903103, 1, 1, 1, 1, 1,
-1.163722, -0.2464813, -3.528436, 1, 1, 1, 1, 1,
-1.159528, 0.6828249, -1.963786, 1, 1, 1, 1, 1,
-1.158247, -0.494161, -0.5707816, 1, 1, 1, 1, 1,
-1.15743, 0.7873499, -1.718042, 1, 1, 1, 1, 1,
-1.15308, 0.4236146, -0.5007257, 0, 0, 1, 1, 1,
-1.14322, 0.6636466, -1.414095, 1, 0, 0, 1, 1,
-1.141894, 0.1486632, -3.578952, 1, 0, 0, 1, 1,
-1.132529, 0.2417869, -0.3120953, 1, 0, 0, 1, 1,
-1.124151, -0.6139765, -2.666221, 1, 0, 0, 1, 1,
-1.12023, -0.2986947, -3.106572, 1, 0, 0, 1, 1,
-1.115151, 0.1296115, -1.412473, 0, 0, 0, 1, 1,
-1.099649, 0.3555565, -1.110031, 0, 0, 0, 1, 1,
-1.093227, 0.6238346, -1.215957, 0, 0, 0, 1, 1,
-1.091478, 0.749638, -1.563239, 0, 0, 0, 1, 1,
-1.07912, -1.361349, 0.716364, 0, 0, 0, 1, 1,
-1.077581, 1.393536, -0.09603898, 0, 0, 0, 1, 1,
-1.076885, 0.08443458, -2.618073, 0, 0, 0, 1, 1,
-1.076128, 2.395152, -0.3831835, 1, 1, 1, 1, 1,
-1.064833, -1.63271, -2.216094, 1, 1, 1, 1, 1,
-1.056965, -1.840175, -2.198098, 1, 1, 1, 1, 1,
-1.048214, 1.030814, -1.51385, 1, 1, 1, 1, 1,
-1.042389, -0.7869567, -1.590218, 1, 1, 1, 1, 1,
-1.037955, 0.9498292, -0.8234741, 1, 1, 1, 1, 1,
-1.033288, 0.2656697, -1.583903, 1, 1, 1, 1, 1,
-1.029424, -0.6130279, -3.157269, 1, 1, 1, 1, 1,
-1.025684, 1.343729, -2.162967, 1, 1, 1, 1, 1,
-1.02471, 0.8911713, 0.7878711, 1, 1, 1, 1, 1,
-1.024323, 0.5000909, -0.6431094, 1, 1, 1, 1, 1,
-1.020262, -2.368729, -3.867832, 1, 1, 1, 1, 1,
-1.014777, 0.2373883, -0.3577799, 1, 1, 1, 1, 1,
-1.009296, -0.1879868, -2.660726, 1, 1, 1, 1, 1,
-1.008882, -0.1541226, -1.391006, 1, 1, 1, 1, 1,
-1.005847, 0.235124, -2.276266, 0, 0, 1, 1, 1,
-1.003511, 1.364687, -0.5320941, 1, 0, 0, 1, 1,
-1.000418, -0.2499013, -1.777646, 1, 0, 0, 1, 1,
-1.00026, 2.354796, -1.38812, 1, 0, 0, 1, 1,
-0.9998553, 0.433251, -1.059156, 1, 0, 0, 1, 1,
-0.9987177, 0.2957349, -1.296569, 1, 0, 0, 1, 1,
-0.9956831, -0.6339545, -1.730806, 0, 0, 0, 1, 1,
-0.98885, -1.400942, -2.476623, 0, 0, 0, 1, 1,
-0.9846598, -0.5797251, -1.481548, 0, 0, 0, 1, 1,
-0.9752974, 0.3362364, -0.8266659, 0, 0, 0, 1, 1,
-0.9746411, -0.9838107, -2.452543, 0, 0, 0, 1, 1,
-0.9676437, 1.70359, -1.282326, 0, 0, 0, 1, 1,
-0.9642828, -0.4281485, -2.762259, 0, 0, 0, 1, 1,
-0.9616119, -2.377335, -4.949267, 1, 1, 1, 1, 1,
-0.9584991, -0.05610856, -0.9884251, 1, 1, 1, 1, 1,
-0.9579025, -3.142978, -2.323679, 1, 1, 1, 1, 1,
-0.9529763, -1.323994, -2.399326, 1, 1, 1, 1, 1,
-0.9526088, -0.3386892, 0.7520874, 1, 1, 1, 1, 1,
-0.9515893, -0.1498632, -4.143262, 1, 1, 1, 1, 1,
-0.9464668, -1.311646, -2.676275, 1, 1, 1, 1, 1,
-0.9376108, -1.168227, -0.2129239, 1, 1, 1, 1, 1,
-0.9277381, -0.8618887, -2.9758, 1, 1, 1, 1, 1,
-0.9214712, -0.8668597, -1.438748, 1, 1, 1, 1, 1,
-0.9203457, 0.5641565, -0.8379976, 1, 1, 1, 1, 1,
-0.9197292, 1.108947, -1.054207, 1, 1, 1, 1, 1,
-0.9175448, 1.928041, -1.480855, 1, 1, 1, 1, 1,
-0.914834, 0.4926222, -0.8879244, 1, 1, 1, 1, 1,
-0.907094, 0.7708879, -1.386639, 1, 1, 1, 1, 1,
-0.9004166, -0.5334759, -2.004275, 0, 0, 1, 1, 1,
-0.8935053, 0.1461127, -0.4721608, 1, 0, 0, 1, 1,
-0.8933201, -0.02069599, -3.960814, 1, 0, 0, 1, 1,
-0.8928909, -1.235403, -1.857838, 1, 0, 0, 1, 1,
-0.8927919, 0.1577474, -0.516884, 1, 0, 0, 1, 1,
-0.8925751, -0.07393631, -0.5116907, 1, 0, 0, 1, 1,
-0.8911345, -0.6956173, -2.199739, 0, 0, 0, 1, 1,
-0.8819873, -0.9201071, -1.464965, 0, 0, 0, 1, 1,
-0.8813404, 0.6914188, -1.817248, 0, 0, 0, 1, 1,
-0.8790236, 0.8776699, 0.2885796, 0, 0, 0, 1, 1,
-0.8775253, 1.544748, -0.09659994, 0, 0, 0, 1, 1,
-0.8738171, -1.592711, -3.740543, 0, 0, 0, 1, 1,
-0.8737155, -0.02552496, -0.6370834, 0, 0, 0, 1, 1,
-0.870985, 1.424217, -0.3696251, 1, 1, 1, 1, 1,
-0.8686152, 0.8403405, 0.200652, 1, 1, 1, 1, 1,
-0.8665609, -1.182143, -2.093085, 1, 1, 1, 1, 1,
-0.8662153, -0.1848389, -2.768657, 1, 1, 1, 1, 1,
-0.8661677, -0.1851047, -1.661583, 1, 1, 1, 1, 1,
-0.8568168, -0.371025, -0.8152372, 1, 1, 1, 1, 1,
-0.8509186, -1.420926, -1.100422, 1, 1, 1, 1, 1,
-0.8490697, -1.138643, -1.026129, 1, 1, 1, 1, 1,
-0.8460408, -0.5049189, -2.378989, 1, 1, 1, 1, 1,
-0.8403323, 0.04225183, -1.459739, 1, 1, 1, 1, 1,
-0.831935, 0.406966, -2.213982, 1, 1, 1, 1, 1,
-0.8273511, -0.4985904, -2.004481, 1, 1, 1, 1, 1,
-0.8263994, -0.7357784, -5.24507, 1, 1, 1, 1, 1,
-0.8225726, -1.129698, -2.948114, 1, 1, 1, 1, 1,
-0.8208119, 0.498056, -0.5371367, 1, 1, 1, 1, 1,
-0.8091579, -2.23778, -2.466036, 0, 0, 1, 1, 1,
-0.8055407, 0.03030821, -3.126074, 1, 0, 0, 1, 1,
-0.8013752, 0.7477724, -0.2933586, 1, 0, 0, 1, 1,
-0.799704, -1.11966, -2.966085, 1, 0, 0, 1, 1,
-0.7991151, -1.170825, -1.701305, 1, 0, 0, 1, 1,
-0.7965916, 0.4647741, -0.02866497, 1, 0, 0, 1, 1,
-0.7965159, -0.5360996, -2.574829, 0, 0, 0, 1, 1,
-0.787347, -1.938433, -2.35747, 0, 0, 0, 1, 1,
-0.7730966, 0.6336535, -1.283818, 0, 0, 0, 1, 1,
-0.7712954, -0.7780167, -3.246031, 0, 0, 0, 1, 1,
-0.7688957, 0.6662865, -0.7740314, 0, 0, 0, 1, 1,
-0.7653794, 0.358672, -1.875024, 0, 0, 0, 1, 1,
-0.7618001, -1.026303, -2.804014, 0, 0, 0, 1, 1,
-0.760088, 0.9833484, 1.874803, 1, 1, 1, 1, 1,
-0.7447563, 0.8337853, 0.8296483, 1, 1, 1, 1, 1,
-0.7407826, 1.892646, -0.01082054, 1, 1, 1, 1, 1,
-0.728804, -0.5431513, -1.739535, 1, 1, 1, 1, 1,
-0.7285288, 1.49007, -1.056278, 1, 1, 1, 1, 1,
-0.7267066, 0.1878125, 0.2530563, 1, 1, 1, 1, 1,
-0.7248892, -0.4107711, -0.2785038, 1, 1, 1, 1, 1,
-0.7239957, -0.08960794, -0.9556037, 1, 1, 1, 1, 1,
-0.7146941, 1.595716, -1.125357, 1, 1, 1, 1, 1,
-0.7099355, 0.5312649, -0.477105, 1, 1, 1, 1, 1,
-0.7092323, -2.360715, -2.755148, 1, 1, 1, 1, 1,
-0.7085978, -1.275627, -2.433775, 1, 1, 1, 1, 1,
-0.7025945, 0.1196239, -2.304009, 1, 1, 1, 1, 1,
-0.7019951, 0.1183377, -1.315406, 1, 1, 1, 1, 1,
-0.6993766, 0.6097286, -3.387104, 1, 1, 1, 1, 1,
-0.6974138, 0.9195388, -1.930624, 0, 0, 1, 1, 1,
-0.6931794, 0.1761511, -0.8188944, 1, 0, 0, 1, 1,
-0.6865871, -0.3814339, -3.10822, 1, 0, 0, 1, 1,
-0.6865829, -0.1190494, -2.028978, 1, 0, 0, 1, 1,
-0.6840659, -0.1175018, -1.191028, 1, 0, 0, 1, 1,
-0.6817415, 0.8384025, -0.09076817, 1, 0, 0, 1, 1,
-0.6774865, -1.505329, -1.602307, 0, 0, 0, 1, 1,
-0.6732844, 0.4441252, -1.332015, 0, 0, 0, 1, 1,
-0.6701937, -0.4417868, -2.536134, 0, 0, 0, 1, 1,
-0.6688655, -0.2997616, -3.504431, 0, 0, 0, 1, 1,
-0.6630064, 1.974204, 0.2301064, 0, 0, 0, 1, 1,
-0.6610021, -0.2740209, -0.8084983, 0, 0, 0, 1, 1,
-0.6487702, 1.898869, -0.02827068, 0, 0, 0, 1, 1,
-0.6448898, 0.9529685, 2.489462, 1, 1, 1, 1, 1,
-0.6423033, -1.467261, -3.080176, 1, 1, 1, 1, 1,
-0.641049, -1.90567, -1.46505, 1, 1, 1, 1, 1,
-0.6394023, -0.4459601, -2.979248, 1, 1, 1, 1, 1,
-0.6379512, -0.7599027, -3.988107, 1, 1, 1, 1, 1,
-0.6197898, 0.3265353, -1.466274, 1, 1, 1, 1, 1,
-0.6176623, 0.06574483, -1.475818, 1, 1, 1, 1, 1,
-0.6123869, 1.781303, -0.5996134, 1, 1, 1, 1, 1,
-0.6117098, 1.683745, -1.060307, 1, 1, 1, 1, 1,
-0.6050842, 0.1993871, -1.447444, 1, 1, 1, 1, 1,
-0.6035091, 0.08884935, -2.205994, 1, 1, 1, 1, 1,
-0.6028106, 0.5964503, -2.179422, 1, 1, 1, 1, 1,
-0.5981191, 0.938378, 0.9254956, 1, 1, 1, 1, 1,
-0.5964421, 0.3995864, -1.800402, 1, 1, 1, 1, 1,
-0.5962358, -0.4194487, -2.945483, 1, 1, 1, 1, 1,
-0.5919377, -1.430748, -2.5101, 0, 0, 1, 1, 1,
-0.5800069, 1.136096, 1.478457, 1, 0, 0, 1, 1,
-0.5788241, -1.303102, -2.897429, 1, 0, 0, 1, 1,
-0.5780343, -0.1168288, -1.383783, 1, 0, 0, 1, 1,
-0.5779192, -0.8456234, -2.747588, 1, 0, 0, 1, 1,
-0.5765519, -0.4058648, -2.951916, 1, 0, 0, 1, 1,
-0.576092, -1.307676, -2.394401, 0, 0, 0, 1, 1,
-0.5723072, 2.134735, 0.4271549, 0, 0, 0, 1, 1,
-0.5702885, -3.667636, -3.273713, 0, 0, 0, 1, 1,
-0.5687408, 2.63446, 0.1756548, 0, 0, 0, 1, 1,
-0.5492873, 1.268649, -1.417469, 0, 0, 0, 1, 1,
-0.547586, -0.1888983, -1.839688, 0, 0, 0, 1, 1,
-0.5431075, 0.1780728, -1.387129, 0, 0, 0, 1, 1,
-0.5416282, -0.8484641, -1.994005, 1, 1, 1, 1, 1,
-0.5406101, -0.9593492, -4.189473, 1, 1, 1, 1, 1,
-0.5402299, 0.7233534, -1.03658, 1, 1, 1, 1, 1,
-0.536658, 2.336221, -2.656298, 1, 1, 1, 1, 1,
-0.5353742, -0.04125185, -0.5099997, 1, 1, 1, 1, 1,
-0.5347149, 0.6968711, -0.6665007, 1, 1, 1, 1, 1,
-0.5315555, -1.89631, -4.14187, 1, 1, 1, 1, 1,
-0.5276527, 0.4316294, 0.1914715, 1, 1, 1, 1, 1,
-0.5223958, 0.2949904, -0.7627438, 1, 1, 1, 1, 1,
-0.5220619, -0.009785414, -2.401086, 1, 1, 1, 1, 1,
-0.5128129, -0.003650177, -3.524393, 1, 1, 1, 1, 1,
-0.5124674, 0.5359179, -0.0782754, 1, 1, 1, 1, 1,
-0.5121258, -1.620096, -2.811102, 1, 1, 1, 1, 1,
-0.5092065, 1.617116, -0.1266848, 1, 1, 1, 1, 1,
-0.504492, -0.05502643, -1.350168, 1, 1, 1, 1, 1,
-0.5031729, -1.298334, -2.621241, 0, 0, 1, 1, 1,
-0.4999864, 0.34264, -0.5561684, 1, 0, 0, 1, 1,
-0.4995922, -1.163778, -2.188774, 1, 0, 0, 1, 1,
-0.4984421, -0.8077725, -3.033838, 1, 0, 0, 1, 1,
-0.4978955, -0.007645451, -2.455996, 1, 0, 0, 1, 1,
-0.4938581, -0.01705922, -2.171409, 1, 0, 0, 1, 1,
-0.4915703, -1.08769, -3.243319, 0, 0, 0, 1, 1,
-0.4879799, 0.3026474, -2.366258, 0, 0, 0, 1, 1,
-0.4850221, 0.639478, -0.4932425, 0, 0, 0, 1, 1,
-0.4842303, 0.04432367, -1.433115, 0, 0, 0, 1, 1,
-0.4815802, 0.9779341, -0.2366374, 0, 0, 0, 1, 1,
-0.4803506, 1.194075, -1.561203, 0, 0, 0, 1, 1,
-0.4672552, 0.4727502, -0.4395996, 0, 0, 0, 1, 1,
-0.4644011, -1.306803, -3.790024, 1, 1, 1, 1, 1,
-0.4528246, -0.4370673, -3.556177, 1, 1, 1, 1, 1,
-0.4452183, 1.093387, -0.2634281, 1, 1, 1, 1, 1,
-0.4435925, 1.489328, -0.4006464, 1, 1, 1, 1, 1,
-0.4410127, 1.666204, -1.049451, 1, 1, 1, 1, 1,
-0.4391387, -0.8458165, -2.110588, 1, 1, 1, 1, 1,
-0.4380735, -0.6086155, -2.691991, 1, 1, 1, 1, 1,
-0.4368748, -0.06048943, -1.829193, 1, 1, 1, 1, 1,
-0.4367082, -0.4380639, -2.496071, 1, 1, 1, 1, 1,
-0.436492, 0.4559749, -2.401773, 1, 1, 1, 1, 1,
-0.4348841, 0.9405302, 0.0008897416, 1, 1, 1, 1, 1,
-0.4321179, 1.449867, -0.8005892, 1, 1, 1, 1, 1,
-0.4274783, -0.3332407, -1.564183, 1, 1, 1, 1, 1,
-0.4269491, 0.965816, -0.5791063, 1, 1, 1, 1, 1,
-0.4252775, 0.03596045, -2.192202, 1, 1, 1, 1, 1,
-0.4252454, -0.4819414, -2.189194, 0, 0, 1, 1, 1,
-0.417726, -0.2008195, -0.1868962, 1, 0, 0, 1, 1,
-0.415728, -1.29948, -3.658121, 1, 0, 0, 1, 1,
-0.4157269, -0.06168508, -0.6923981, 1, 0, 0, 1, 1,
-0.4139008, 0.03260052, -1.905523, 1, 0, 0, 1, 1,
-0.4130787, 0.5913693, 0.5403583, 1, 0, 0, 1, 1,
-0.4117652, -0.5396226, -4.141394, 0, 0, 0, 1, 1,
-0.3947552, -0.9769738, -3.010382, 0, 0, 0, 1, 1,
-0.391428, 0.9466625, 0.06799943, 0, 0, 0, 1, 1,
-0.3912688, 0.8909288, -0.1663634, 0, 0, 0, 1, 1,
-0.3900537, 0.8073948, 2.502655, 0, 0, 0, 1, 1,
-0.3889983, -0.8599514, -3.346362, 0, 0, 0, 1, 1,
-0.382981, -0.1244799, 0.7229686, 0, 0, 0, 1, 1,
-0.3827985, -0.2838693, -0.9138059, 1, 1, 1, 1, 1,
-0.3797599, -0.08894741, -2.51869, 1, 1, 1, 1, 1,
-0.3774258, 1.172848, -0.2458774, 1, 1, 1, 1, 1,
-0.3706936, 0.1124125, -2.2185, 1, 1, 1, 1, 1,
-0.3677572, -1.75492, -3.15619, 1, 1, 1, 1, 1,
-0.3632671, 0.4621675, -0.1737421, 1, 1, 1, 1, 1,
-0.3622995, 1.049348, 0.8746031, 1, 1, 1, 1, 1,
-0.3622587, -0.5722111, -1.362977, 1, 1, 1, 1, 1,
-0.3594808, 2.042328, 0.04041969, 1, 1, 1, 1, 1,
-0.3555613, -0.2267955, -3.213609, 1, 1, 1, 1, 1,
-0.3542365, 1.0227, 0.1363623, 1, 1, 1, 1, 1,
-0.3539925, -0.7726542, -2.261714, 1, 1, 1, 1, 1,
-0.352926, 1.235639, -1.599705, 1, 1, 1, 1, 1,
-0.3528756, 0.7947251, 1.240255, 1, 1, 1, 1, 1,
-0.3400415, 0.8472904, 0.5938413, 1, 1, 1, 1, 1,
-0.3369777, 1.089772, 0.6811787, 0, 0, 1, 1, 1,
-0.3346788, 1.938491, -0.2500902, 1, 0, 0, 1, 1,
-0.3289579, 1.039297, -0.1268555, 1, 0, 0, 1, 1,
-0.3288139, -1.645394, -1.952397, 1, 0, 0, 1, 1,
-0.3266364, 0.4393295, -1.599413, 1, 0, 0, 1, 1,
-0.3212598, -1.748714, -3.427373, 1, 0, 0, 1, 1,
-0.3182169, 1.441693, -1.01148, 0, 0, 0, 1, 1,
-0.317613, 0.8282291, -1.661785, 0, 0, 0, 1, 1,
-0.3168741, -0.8166561, -1.606865, 0, 0, 0, 1, 1,
-0.3137562, 1.166154, -1.404762, 0, 0, 0, 1, 1,
-0.3130259, 0.6790779, -0.7847311, 0, 0, 0, 1, 1,
-0.3125722, 0.1720154, -1.233708, 0, 0, 0, 1, 1,
-0.31134, 1.411341, 0.2319951, 0, 0, 0, 1, 1,
-0.3078183, 0.1676905, -0.3150021, 1, 1, 1, 1, 1,
-0.3077541, 0.222367, 0.03581437, 1, 1, 1, 1, 1,
-0.3060308, -0.4016618, -3.652502, 1, 1, 1, 1, 1,
-0.3054675, -0.5756261, -1.738055, 1, 1, 1, 1, 1,
-0.3037914, -0.2027408, -2.061326, 1, 1, 1, 1, 1,
-0.3032776, 1.093144, 0.7525344, 1, 1, 1, 1, 1,
-0.299578, 1.325417, -0.14306, 1, 1, 1, 1, 1,
-0.2944717, 1.554562, 1.64265, 1, 1, 1, 1, 1,
-0.2934206, -0.5038472, -2.282601, 1, 1, 1, 1, 1,
-0.2889107, 0.7041354, -1.57034, 1, 1, 1, 1, 1,
-0.2853789, -0.8476633, -2.152345, 1, 1, 1, 1, 1,
-0.2822726, 0.4005232, -1.800501, 1, 1, 1, 1, 1,
-0.2799127, -1.136679, -1.897172, 1, 1, 1, 1, 1,
-0.2797981, 0.289971, 0.8954135, 1, 1, 1, 1, 1,
-0.279214, 0.8049491, -1.895715, 1, 1, 1, 1, 1,
-0.2776471, -0.7196408, -1.573382, 0, 0, 1, 1, 1,
-0.2708588, -0.4038793, -2.15057, 1, 0, 0, 1, 1,
-0.2698106, 0.2133035, -2.523179, 1, 0, 0, 1, 1,
-0.2681565, -0.3914783, -3.014854, 1, 0, 0, 1, 1,
-0.2677706, -0.963822, -2.310076, 1, 0, 0, 1, 1,
-0.2657349, -0.5996504, -4.265219, 1, 0, 0, 1, 1,
-0.259974, -0.06057158, -3.193879, 0, 0, 0, 1, 1,
-0.2426799, -1.234979, -4.395061, 0, 0, 0, 1, 1,
-0.2419486, 1.303123, -0.3517826, 0, 0, 0, 1, 1,
-0.2394762, -1.230039, -0.9441784, 0, 0, 0, 1, 1,
-0.236162, -0.7637944, -4.756491, 0, 0, 0, 1, 1,
-0.2357785, 1.354881, -0.2263492, 0, 0, 0, 1, 1,
-0.235165, -0.3812852, -1.932284, 0, 0, 0, 1, 1,
-0.2323867, -0.176498, -3.076099, 1, 1, 1, 1, 1,
-0.2302548, -0.6915436, -4.378139, 1, 1, 1, 1, 1,
-0.2270275, 1.327462, 0.2364096, 1, 1, 1, 1, 1,
-0.2220093, 0.209825, -0.2099976, 1, 1, 1, 1, 1,
-0.2213926, 1.086101, 0.2610877, 1, 1, 1, 1, 1,
-0.2197894, 0.5720679, 1.539373, 1, 1, 1, 1, 1,
-0.216755, 0.0688006, -0.9337708, 1, 1, 1, 1, 1,
-0.2144083, 1.562958, 0.06176064, 1, 1, 1, 1, 1,
-0.210814, 0.7803823, -1.65186, 1, 1, 1, 1, 1,
-0.2064136, -0.1648265, -2.678914, 1, 1, 1, 1, 1,
-0.2053827, 0.7608969, -0.1616426, 1, 1, 1, 1, 1,
-0.2014753, -0.3900889, -2.331305, 1, 1, 1, 1, 1,
-0.1970095, 0.8330694, 0.2836073, 1, 1, 1, 1, 1,
-0.19408, 0.529648, -0.3396606, 1, 1, 1, 1, 1,
-0.1888928, -0.4373465, -3.031051, 1, 1, 1, 1, 1,
-0.1868159, -1.062505, -3.37527, 0, 0, 1, 1, 1,
-0.1837059, -0.5160589, -4.859031, 1, 0, 0, 1, 1,
-0.1789169, 0.2863565, 0.6894044, 1, 0, 0, 1, 1,
-0.1610491, 0.1360809, -2.076574, 1, 0, 0, 1, 1,
-0.1600036, -0.09917738, -2.074927, 1, 0, 0, 1, 1,
-0.1586884, 0.05081709, -1.636328, 1, 0, 0, 1, 1,
-0.148945, 0.5631756, -1.906914, 0, 0, 0, 1, 1,
-0.1482107, 1.253244, 0.1281726, 0, 0, 0, 1, 1,
-0.145123, -0.1038833, -1.919667, 0, 0, 0, 1, 1,
-0.1433701, -0.8491374, -2.676098, 0, 0, 0, 1, 1,
-0.1373738, 1.623698, -0.1023702, 0, 0, 0, 1, 1,
-0.1347318, -0.1416752, -3.413365, 0, 0, 0, 1, 1,
-0.1318622, 1.608639, 0.5247806, 0, 0, 0, 1, 1,
-0.1279065, -0.8170123, -1.328964, 1, 1, 1, 1, 1,
-0.1278047, 0.2961252, -1.765136, 1, 1, 1, 1, 1,
-0.1262232, -0.2218185, -2.326197, 1, 1, 1, 1, 1,
-0.124166, -0.02111025, -2.290593, 1, 1, 1, 1, 1,
-0.1222797, -1.390577, -4.088889, 1, 1, 1, 1, 1,
-0.1147306, -0.8411276, -2.264945, 1, 1, 1, 1, 1,
-0.1113826, 0.04607386, -1.085076, 1, 1, 1, 1, 1,
-0.1106059, -0.282971, -1.586041, 1, 1, 1, 1, 1,
-0.1090016, -1.749903, -3.23456, 1, 1, 1, 1, 1,
-0.1083281, -1.595875, -1.741011, 1, 1, 1, 1, 1,
-0.1079973, -0.4196059, -2.895408, 1, 1, 1, 1, 1,
-0.1040046, 1.211852, -0.8818593, 1, 1, 1, 1, 1,
-0.1029972, -1.565427, -2.3903, 1, 1, 1, 1, 1,
-0.1022597, 2.420174, 0.9044576, 1, 1, 1, 1, 1,
-0.1001202, 0.982644, -0.07934133, 1, 1, 1, 1, 1,
-0.1000154, -1.389612, -2.863028, 0, 0, 1, 1, 1,
-0.09437881, -0.2069211, -3.067429, 1, 0, 0, 1, 1,
-0.09435873, 0.3125586, -1.029389, 1, 0, 0, 1, 1,
-0.08622722, 0.3557875, -1.342658, 1, 0, 0, 1, 1,
-0.08533101, 0.8003777, -1.095885, 1, 0, 0, 1, 1,
-0.08477958, 1.103694, 0.8169003, 1, 0, 0, 1, 1,
-0.08380515, 1.318904, 0.3283738, 0, 0, 0, 1, 1,
-0.08229812, -0.8812829, -2.316344, 0, 0, 0, 1, 1,
-0.07664567, 0.171536, -0.3874714, 0, 0, 0, 1, 1,
-0.0765558, 1.440022, 0.9121408, 0, 0, 0, 1, 1,
-0.07285914, -1.434714, -2.667547, 0, 0, 0, 1, 1,
-0.07247483, -0.09006978, -2.811641, 0, 0, 0, 1, 1,
-0.07127105, 0.4564546, 0.4711072, 0, 0, 0, 1, 1,
-0.07014912, 0.2662466, 0.9817371, 1, 1, 1, 1, 1,
-0.06862689, -0.4699177, -1.944725, 1, 1, 1, 1, 1,
-0.06837417, -0.8068941, -0.9062395, 1, 1, 1, 1, 1,
-0.06826701, 1.929931, -0.4621324, 1, 1, 1, 1, 1,
-0.06767947, 0.4026776, -1.063561, 1, 1, 1, 1, 1,
-0.06701329, -0.586666, -4.460548, 1, 1, 1, 1, 1,
-0.06534326, 0.06907815, -1.039862, 1, 1, 1, 1, 1,
-0.06426521, -0.1500168, -3.413508, 1, 1, 1, 1, 1,
-0.05929374, 0.1644757, -0.8239157, 1, 1, 1, 1, 1,
-0.05545497, 1.494558, -0.8119411, 1, 1, 1, 1, 1,
-0.05197172, 0.3653935, 0.2480938, 1, 1, 1, 1, 1,
-0.05194849, 0.3616928, 0.5152146, 1, 1, 1, 1, 1,
-0.04895507, -0.4029341, -2.415466, 1, 1, 1, 1, 1,
-0.04869343, -0.8779315, -4.651317, 1, 1, 1, 1, 1,
-0.04841286, -2.001477, -2.315941, 1, 1, 1, 1, 1,
-0.04460401, 0.8835523, -1.543346, 0, 0, 1, 1, 1,
-0.04216669, -0.4341711, -2.712734, 1, 0, 0, 1, 1,
-0.04013366, 2.574805, -0.2697133, 1, 0, 0, 1, 1,
-0.03173754, -0.7846294, -2.560413, 1, 0, 0, 1, 1,
-0.03163354, 0.2010629, -0.05498072, 1, 0, 0, 1, 1,
-0.02858769, -0.07949481, -2.209535, 1, 0, 0, 1, 1,
-0.02779129, 0.9713237, -0.9580755, 0, 0, 0, 1, 1,
-0.02390011, 0.8360088, -1.438969, 0, 0, 0, 1, 1,
-0.02370252, -0.1188617, -2.342151, 0, 0, 0, 1, 1,
-0.0216558, -0.6630771, -3.14754, 0, 0, 0, 1, 1,
-0.02127147, -0.3760538, -3.929329, 0, 0, 0, 1, 1,
-0.02028943, 0.4631479, -1.225852, 0, 0, 0, 1, 1,
-0.01113272, 0.1642777, 0.0503674, 0, 0, 0, 1, 1,
-0.01084886, -0.6646205, -1.113181, 1, 1, 1, 1, 1,
-0.001519992, -1.392025, -3.058398, 1, 1, 1, 1, 1,
-0.0004259209, 1.120513, -0.9909547, 1, 1, 1, 1, 1,
0.0006776315, 1.221104, 0.05205527, 1, 1, 1, 1, 1,
0.001026653, 0.7725165, 0.1021657, 1, 1, 1, 1, 1,
0.008491296, -0.2147478, 4.06846, 1, 1, 1, 1, 1,
0.01548814, 0.4562055, 1.257122, 1, 1, 1, 1, 1,
0.02056352, -1.298252, 4.73598, 1, 1, 1, 1, 1,
0.02326451, -0.538295, 4.015422, 1, 1, 1, 1, 1,
0.03109241, -0.09981687, 3.332201, 1, 1, 1, 1, 1,
0.0313229, 1.924438, -1.129413, 1, 1, 1, 1, 1,
0.03572493, 0.1003687, -0.5120841, 1, 1, 1, 1, 1,
0.0368317, -0.2058997, 3.538352, 1, 1, 1, 1, 1,
0.04149491, 0.9607055, -0.05413099, 1, 1, 1, 1, 1,
0.04156469, -0.2901185, 2.960644, 1, 1, 1, 1, 1,
0.04384806, -0.09454753, 2.65993, 0, 0, 1, 1, 1,
0.04611612, 0.09736268, 1.400882, 1, 0, 0, 1, 1,
0.04620345, 1.607881, -1.661452, 1, 0, 0, 1, 1,
0.0470763, 1.290167, 1.556249, 1, 0, 0, 1, 1,
0.05289087, 0.1303206, 1.389025, 1, 0, 0, 1, 1,
0.05408575, 0.9494908, 1.159521, 1, 0, 0, 1, 1,
0.05454892, -1.106719, 2.501431, 0, 0, 0, 1, 1,
0.05914864, -0.03578895, 2.261804, 0, 0, 0, 1, 1,
0.06309096, -0.3995956, 3.260436, 0, 0, 0, 1, 1,
0.06490374, -1.538649, 4.035674, 0, 0, 0, 1, 1,
0.0657272, -0.6826198, 1.226326, 0, 0, 0, 1, 1,
0.07002375, 0.6964443, -1.324192, 0, 0, 0, 1, 1,
0.0713475, 0.2170085, -0.4796386, 0, 0, 0, 1, 1,
0.07208043, 0.488183, -0.7267262, 1, 1, 1, 1, 1,
0.07232294, 0.4302961, -0.5152819, 1, 1, 1, 1, 1,
0.07638112, -1.930156, 4.085273, 1, 1, 1, 1, 1,
0.07733915, 0.6442011, 0.7275987, 1, 1, 1, 1, 1,
0.07840899, 1.067373, -1.097264, 1, 1, 1, 1, 1,
0.08144693, -0.3929544, 3.863163, 1, 1, 1, 1, 1,
0.08874071, 1.078406, 0.289392, 1, 1, 1, 1, 1,
0.08946364, -0.9576226, 2.96207, 1, 1, 1, 1, 1,
0.09561054, -0.9970549, 2.27222, 1, 1, 1, 1, 1,
0.0978241, 0.9559296, 0.2675246, 1, 1, 1, 1, 1,
0.09860449, 0.5068017, -0.3241341, 1, 1, 1, 1, 1,
0.1021372, -0.5311264, 2.932511, 1, 1, 1, 1, 1,
0.1083145, -1.289696, 1.615934, 1, 1, 1, 1, 1,
0.1100658, 0.02767503, 0.9131577, 1, 1, 1, 1, 1,
0.1128281, 0.097144, 2.035155, 1, 1, 1, 1, 1,
0.112845, 0.4199602, 1.183476, 0, 0, 1, 1, 1,
0.1159096, 0.1620319, 0.6048176, 1, 0, 0, 1, 1,
0.1174383, -1.567841, 2.910316, 1, 0, 0, 1, 1,
0.1198301, 1.022517, 0.3318048, 1, 0, 0, 1, 1,
0.124364, 0.4390779, -0.2050932, 1, 0, 0, 1, 1,
0.133682, 0.8121079, 0.8094236, 1, 0, 0, 1, 1,
0.1392705, 0.02411466, 1.506114, 0, 0, 0, 1, 1,
0.1472866, 0.2631439, 2.394359, 0, 0, 0, 1, 1,
0.1505311, 1.246565, 0.8047957, 0, 0, 0, 1, 1,
0.1564822, -0.3454028, 0.7397175, 0, 0, 0, 1, 1,
0.1577949, 0.1406278, 1.318732, 0, 0, 0, 1, 1,
0.1587629, 0.4253841, 0.3220159, 0, 0, 0, 1, 1,
0.1707577, 0.9395497, -0.7501325, 0, 0, 0, 1, 1,
0.1735573, -1.103811, 3.727222, 1, 1, 1, 1, 1,
0.1740372, -0.4048204, 3.111992, 1, 1, 1, 1, 1,
0.176317, -0.5058516, 2.992618, 1, 1, 1, 1, 1,
0.176688, 1.390658, -0.6555831, 1, 1, 1, 1, 1,
0.1770417, -0.1061165, 2.740756, 1, 1, 1, 1, 1,
0.1806883, 0.1263319, 0.5625404, 1, 1, 1, 1, 1,
0.18384, -0.2493618, 2.738286, 1, 1, 1, 1, 1,
0.1845928, 0.2705455, 1.877765, 1, 1, 1, 1, 1,
0.1848213, -1.26073, 2.820783, 1, 1, 1, 1, 1,
0.1897653, 0.6209071, -0.0669105, 1, 1, 1, 1, 1,
0.1903049, -1.73749, 3.092175, 1, 1, 1, 1, 1,
0.191468, 1.526209, 0.1141235, 1, 1, 1, 1, 1,
0.1915439, 0.8161151, 1.283269, 1, 1, 1, 1, 1,
0.1918309, 0.3603852, 0.06694748, 1, 1, 1, 1, 1,
0.1962693, -0.2103896, 3.632691, 1, 1, 1, 1, 1,
0.1977905, 0.7011324, -1.453601, 0, 0, 1, 1, 1,
0.1986421, -0.1119437, 1.81584, 1, 0, 0, 1, 1,
0.1990437, -1.108821, 4.245139, 1, 0, 0, 1, 1,
0.2002133, 0.8766671, 0.7093142, 1, 0, 0, 1, 1,
0.2033876, -0.005483893, 1.29961, 1, 0, 0, 1, 1,
0.2046371, -0.9366975, 3.537134, 1, 0, 0, 1, 1,
0.205299, 0.1398012, 1.218547, 0, 0, 0, 1, 1,
0.2118551, -0.1107472, 1.027525, 0, 0, 0, 1, 1,
0.2138121, -1.544091, 2.538781, 0, 0, 0, 1, 1,
0.2143733, -0.1233033, 2.02742, 0, 0, 0, 1, 1,
0.2153362, -0.493875, 2.512339, 0, 0, 0, 1, 1,
0.2158949, -0.06021722, 0.5313298, 0, 0, 0, 1, 1,
0.2256977, -0.6609727, 1.635643, 0, 0, 0, 1, 1,
0.2266978, 1.006859, -0.69527, 1, 1, 1, 1, 1,
0.2354398, -0.8004435, 3.290008, 1, 1, 1, 1, 1,
0.2382166, -1.602295, 4.425255, 1, 1, 1, 1, 1,
0.2382786, -0.3547799, 2.808976, 1, 1, 1, 1, 1,
0.2398217, 1.376304, 1.037711, 1, 1, 1, 1, 1,
0.2421604, 0.87069, 2.153749, 1, 1, 1, 1, 1,
0.2426355, 0.2167895, -0.1440325, 1, 1, 1, 1, 1,
0.2453249, 0.4020452, 0.2726156, 1, 1, 1, 1, 1,
0.2476688, -1.209349, 2.15942, 1, 1, 1, 1, 1,
0.2479314, 0.3097041, 0.8424619, 1, 1, 1, 1, 1,
0.2488318, -2.183297, 4.304561, 1, 1, 1, 1, 1,
0.2539745, -0.7001119, 4.59822, 1, 1, 1, 1, 1,
0.259104, 0.7285198, -0.2499164, 1, 1, 1, 1, 1,
0.2603434, -0.2144852, 3.253738, 1, 1, 1, 1, 1,
0.2618954, -1.547158, 2.796649, 1, 1, 1, 1, 1,
0.2623275, 0.7339928, 0.2223419, 0, 0, 1, 1, 1,
0.262567, -1.137392, 2.649565, 1, 0, 0, 1, 1,
0.2642704, 0.8016677, 2.222532, 1, 0, 0, 1, 1,
0.2649647, 0.1525041, 0.8106924, 1, 0, 0, 1, 1,
0.2674799, 0.563352, -0.2630275, 1, 0, 0, 1, 1,
0.2687604, 0.1535992, -1.397231, 1, 0, 0, 1, 1,
0.2689182, 0.8522272, 0.2364523, 0, 0, 0, 1, 1,
0.2698839, 0.1313272, -0.01125126, 0, 0, 0, 1, 1,
0.270697, -1.208361, 4.702693, 0, 0, 0, 1, 1,
0.2725929, 0.3335555, 0.2403378, 0, 0, 0, 1, 1,
0.2738292, 0.7120788, 0.2279648, 0, 0, 0, 1, 1,
0.2758889, -0.5460823, 3.171019, 0, 0, 0, 1, 1,
0.2774211, 0.3634466, -0.6494051, 0, 0, 0, 1, 1,
0.2781357, -0.2648928, 1.919556, 1, 1, 1, 1, 1,
0.2787222, -0.2063917, 4.773894, 1, 1, 1, 1, 1,
0.278943, -0.09078556, 2.045594, 1, 1, 1, 1, 1,
0.2828266, 0.9757561, -0.2652233, 1, 1, 1, 1, 1,
0.2855037, -3.389483, 3.759431, 1, 1, 1, 1, 1,
0.2911122, -0.5420901, 0.9885576, 1, 1, 1, 1, 1,
0.2945943, 1.047168, -0.5188021, 1, 1, 1, 1, 1,
0.2950872, -0.09677362, 1.717031, 1, 1, 1, 1, 1,
0.3021987, 0.9782341, 2.201607, 1, 1, 1, 1, 1,
0.3057698, -0.02638282, 1.753352, 1, 1, 1, 1, 1,
0.3076518, 2.09222, 0.4402739, 1, 1, 1, 1, 1,
0.3112208, -1.424472, 2.560127, 1, 1, 1, 1, 1,
0.3161601, -0.3826526, 1.327005, 1, 1, 1, 1, 1,
0.3166305, 0.7815857, 2.578415, 1, 1, 1, 1, 1,
0.3190989, -0.6238438, 0.7746943, 1, 1, 1, 1, 1,
0.319466, -0.3798414, 2.184556, 0, 0, 1, 1, 1,
0.3221382, 1.038056, 1.550705, 1, 0, 0, 1, 1,
0.3266618, -0.1622086, 1.051124, 1, 0, 0, 1, 1,
0.3298477, -0.6696672, 4.457083, 1, 0, 0, 1, 1,
0.3317794, 0.3339394, 1.945985, 1, 0, 0, 1, 1,
0.3333498, 2.317221, -1.836918, 1, 0, 0, 1, 1,
0.3337803, 0.0602354, 1.036165, 0, 0, 0, 1, 1,
0.3365032, -0.2566612, 2.561448, 0, 0, 0, 1, 1,
0.3405016, 0.2726048, 0.64978, 0, 0, 0, 1, 1,
0.3407534, -1.765703, 4.332993, 0, 0, 0, 1, 1,
0.345107, 0.6237923, 1.887929, 0, 0, 0, 1, 1,
0.3460012, -0.00384591, 1.480496, 0, 0, 0, 1, 1,
0.3466153, 0.1527266, 0.2294385, 0, 0, 0, 1, 1,
0.3477926, -0.1035018, 2.557404, 1, 1, 1, 1, 1,
0.3486269, 0.1334024, 1.299585, 1, 1, 1, 1, 1,
0.3487677, -0.2145814, 0.14039, 1, 1, 1, 1, 1,
0.352378, -1.049989, 3.718555, 1, 1, 1, 1, 1,
0.3573109, 0.4358631, 0.2765441, 1, 1, 1, 1, 1,
0.3604246, 0.9457946, 0.7164442, 1, 1, 1, 1, 1,
0.3630006, -0.5827039, 1.95218, 1, 1, 1, 1, 1,
0.3725776, -0.6218801, 3.130139, 1, 1, 1, 1, 1,
0.3755971, 0.1762227, -0.02811299, 1, 1, 1, 1, 1,
0.3799481, -0.3847957, 2.889678, 1, 1, 1, 1, 1,
0.3821783, -0.6135939, 1.879453, 1, 1, 1, 1, 1,
0.3823272, 0.1301969, 0.636429, 1, 1, 1, 1, 1,
0.3901798, 0.4160173, 1.330296, 1, 1, 1, 1, 1,
0.3907607, -0.2029928, 3.545355, 1, 1, 1, 1, 1,
0.3924387, 0.1970132, 2.430818, 1, 1, 1, 1, 1,
0.3926527, 0.4941586, 2.39662, 0, 0, 1, 1, 1,
0.3941901, 0.003397363, 1.827717, 1, 0, 0, 1, 1,
0.3957736, 0.7936069, 0.9489537, 1, 0, 0, 1, 1,
0.4055049, 1.535148, 1.018669, 1, 0, 0, 1, 1,
0.4063544, 0.02565899, 0.7551922, 1, 0, 0, 1, 1,
0.4112802, -0.7871425, 1.60483, 1, 0, 0, 1, 1,
0.4159324, 0.4113708, 1.855355, 0, 0, 0, 1, 1,
0.4184968, -0.5714265, 3.42645, 0, 0, 0, 1, 1,
0.4185056, 0.776397, 1.335603, 0, 0, 0, 1, 1,
0.4189858, -0.6469618, 3.076648, 0, 0, 0, 1, 1,
0.4246853, 0.5314682, 0.09951215, 0, 0, 0, 1, 1,
0.4261622, 0.6483362, -1.079102, 0, 0, 0, 1, 1,
0.4306693, -0.4814808, 4.564979, 0, 0, 0, 1, 1,
0.4320502, -0.1436132, 1.642567, 1, 1, 1, 1, 1,
0.4364922, -0.3571718, 3.377096, 1, 1, 1, 1, 1,
0.4365547, -0.9170803, 3.361789, 1, 1, 1, 1, 1,
0.4445846, 0.1017175, 1.42819, 1, 1, 1, 1, 1,
0.4459266, 0.9230697, -0.5203993, 1, 1, 1, 1, 1,
0.4582685, 0.06441211, 0.00557547, 1, 1, 1, 1, 1,
0.4583595, 0.1291636, 1.314221, 1, 1, 1, 1, 1,
0.4613424, -1.301654, 3.972943, 1, 1, 1, 1, 1,
0.463464, 1.484336, 0.3478267, 1, 1, 1, 1, 1,
0.4636003, 2.124934, -0.2005591, 1, 1, 1, 1, 1,
0.4728311, -1.980245, 2.495686, 1, 1, 1, 1, 1,
0.4822003, 0.7410898, -1.204676, 1, 1, 1, 1, 1,
0.4839659, -0.0608213, 3.149776, 1, 1, 1, 1, 1,
0.4875835, 0.02424008, 1.813806, 1, 1, 1, 1, 1,
0.4894147, 0.9277979, 1.510919, 1, 1, 1, 1, 1,
0.4965054, -0.6267065, 3.370271, 0, 0, 1, 1, 1,
0.5019054, -0.7268808, 1.8153, 1, 0, 0, 1, 1,
0.5080613, -1.153662, 4.242845, 1, 0, 0, 1, 1,
0.513548, 0.001786657, 1.158968, 1, 0, 0, 1, 1,
0.5167887, 0.462804, 0.3258068, 1, 0, 0, 1, 1,
0.5171119, 0.5310515, 2.545072, 1, 0, 0, 1, 1,
0.5172374, -0.3840746, 1.172647, 0, 0, 0, 1, 1,
0.5191735, -0.9134056, 2.710022, 0, 0, 0, 1, 1,
0.5199152, -0.1191702, 2.201311, 0, 0, 0, 1, 1,
0.5201305, -1.918339, 1.044781, 0, 0, 0, 1, 1,
0.5215473, -1.363479, 4.689582, 0, 0, 0, 1, 1,
0.5234396, 1.478092, 1.590374, 0, 0, 0, 1, 1,
0.5254717, -0.3829208, 2.614167, 0, 0, 0, 1, 1,
0.528753, -1.157838, 2.398502, 1, 1, 1, 1, 1,
0.5360987, -0.3123089, 2.398016, 1, 1, 1, 1, 1,
0.5370293, 0.2808383, 1.836428, 1, 1, 1, 1, 1,
0.5373485, -0.3550571, 3.301446, 1, 1, 1, 1, 1,
0.5406067, 1.813223, 0.2722076, 1, 1, 1, 1, 1,
0.5437297, -2.029318, 2.676696, 1, 1, 1, 1, 1,
0.5594967, -0.2638445, 3.532593, 1, 1, 1, 1, 1,
0.5606835, 0.440556, -0.02305969, 1, 1, 1, 1, 1,
0.5610061, -0.6665593, 1.440204, 1, 1, 1, 1, 1,
0.5685628, 0.8731347, 2.502773, 1, 1, 1, 1, 1,
0.5685917, 0.8591275, 1.603054, 1, 1, 1, 1, 1,
0.5714082, 0.8389667, 0.2096375, 1, 1, 1, 1, 1,
0.5755644, -0.7806652, 3.453463, 1, 1, 1, 1, 1,
0.5766243, -0.2394883, 2.60247, 1, 1, 1, 1, 1,
0.5798265, -0.9568875, 1.47264, 1, 1, 1, 1, 1,
0.5848204, 0.5092558, 1.094251, 0, 0, 1, 1, 1,
0.5878472, -1.317082, 0.9251318, 1, 0, 0, 1, 1,
0.5884346, -1.122901, 2.277755, 1, 0, 0, 1, 1,
0.5895814, -0.7258499, 3.409292, 1, 0, 0, 1, 1,
0.5928876, -0.6105936, 4.323684, 1, 0, 0, 1, 1,
0.6008232, -0.06507938, 0.3486982, 1, 0, 0, 1, 1,
0.6026579, 0.2797162, 1.737238, 0, 0, 0, 1, 1,
0.60378, 0.6093458, -0.03489142, 0, 0, 0, 1, 1,
0.6075037, -0.7799363, 3.196604, 0, 0, 0, 1, 1,
0.6132698, -0.1433321, 0.6728106, 0, 0, 0, 1, 1,
0.6134557, 1.203619, -0.3516226, 0, 0, 0, 1, 1,
0.6170397, -0.7338164, 3.52111, 0, 0, 0, 1, 1,
0.6176636, -0.7776034, 2.370953, 0, 0, 0, 1, 1,
0.6190333, -1.422662, 0.6665107, 1, 1, 1, 1, 1,
0.6199316, 1.407037, 0.02249709, 1, 1, 1, 1, 1,
0.6210915, -1.300881, 1.07074, 1, 1, 1, 1, 1,
0.6241851, 0.2262527, 2.44398, 1, 1, 1, 1, 1,
0.6248184, 0.1806253, 3.669654, 1, 1, 1, 1, 1,
0.6350881, -1.005784, 1.784715, 1, 1, 1, 1, 1,
0.6356192, -0.7089618, 2.481213, 1, 1, 1, 1, 1,
0.6388953, 1.131152, -1.00746, 1, 1, 1, 1, 1,
0.642089, -0.7691125, 3.814189, 1, 1, 1, 1, 1,
0.6485653, 1.016475, -0.6375831, 1, 1, 1, 1, 1,
0.6614856, 0.4902762, 0.5523522, 1, 1, 1, 1, 1,
0.6621211, 0.2828673, 1.996473, 1, 1, 1, 1, 1,
0.6629704, 0.6906642, 1.803947, 1, 1, 1, 1, 1,
0.6677713, -0.5996839, 2.578794, 1, 1, 1, 1, 1,
0.6683133, 0.4588165, 1.646715, 1, 1, 1, 1, 1,
0.6697987, 0.06411858, 1.763533, 0, 0, 1, 1, 1,
0.6757276, -0.08758599, 1.411752, 1, 0, 0, 1, 1,
0.6770552, 2.076034, -0.3762109, 1, 0, 0, 1, 1,
0.679331, 0.7586565, 0.3013831, 1, 0, 0, 1, 1,
0.6810344, 1.503044, 0.9622101, 1, 0, 0, 1, 1,
0.681857, 0.2027447, 0.6794059, 1, 0, 0, 1, 1,
0.6818631, 0.01861248, 2.63164, 0, 0, 0, 1, 1,
0.6826249, -1.153741, 2.924317, 0, 0, 0, 1, 1,
0.6932303, -0.313912, 1.50392, 0, 0, 0, 1, 1,
0.6944665, 0.7263799, -0.2784974, 0, 0, 0, 1, 1,
0.7048374, -0.3888241, 3.412769, 0, 0, 0, 1, 1,
0.7064651, 1.058372, 1.046045, 0, 0, 0, 1, 1,
0.7082233, -1.700642, 3.846572, 0, 0, 0, 1, 1,
0.7096855, -0.3416512, 0.4261163, 1, 1, 1, 1, 1,
0.7107776, 0.175299, 1.3884, 1, 1, 1, 1, 1,
0.7142796, 0.4980039, 0.9660124, 1, 1, 1, 1, 1,
0.7176808, -0.03632373, 0.2445704, 1, 1, 1, 1, 1,
0.7234145, -1.88894, 3.957277, 1, 1, 1, 1, 1,
0.7285404, 0.4137529, -1.28647, 1, 1, 1, 1, 1,
0.7366765, 1.212655, -1.314004, 1, 1, 1, 1, 1,
0.7394544, 1.807024, 0.649833, 1, 1, 1, 1, 1,
0.7423386, -1.377892, 3.36701, 1, 1, 1, 1, 1,
0.7502585, 1.118448, 1.418003, 1, 1, 1, 1, 1,
0.759401, 0.283677, 1.908346, 1, 1, 1, 1, 1,
0.7647024, 0.7099619, 2.438614, 1, 1, 1, 1, 1,
0.7647149, -0.2499261, 1.765462, 1, 1, 1, 1, 1,
0.7696545, -2.72747, 1.865872, 1, 1, 1, 1, 1,
0.7725176, 1.23855, -0.495848, 1, 1, 1, 1, 1,
0.7725971, 0.7175147, 2.903364, 0, 0, 1, 1, 1,
0.7760696, 0.03184228, 1.799494, 1, 0, 0, 1, 1,
0.7786337, 0.8407424, 1.974205, 1, 0, 0, 1, 1,
0.7823156, 1.196769, -0.9687186, 1, 0, 0, 1, 1,
0.7833734, 0.2816514, 1.883513, 1, 0, 0, 1, 1,
0.7963147, 0.8985178, 1.02271, 1, 0, 0, 1, 1,
0.7967083, -2.596544, 3.914886, 0, 0, 0, 1, 1,
0.7991213, 1.173406, 1.569643, 0, 0, 0, 1, 1,
0.8004704, -0.245887, 1.377926, 0, 0, 0, 1, 1,
0.8047175, 1.060752, 1.248647, 0, 0, 0, 1, 1,
0.8068284, -0.02484768, 0.9390515, 0, 0, 0, 1, 1,
0.8122467, 0.8927227, 0.8282018, 0, 0, 0, 1, 1,
0.8137507, 0.323096, 1.19328, 0, 0, 0, 1, 1,
0.8152215, 1.589292, 1.09245, 1, 1, 1, 1, 1,
0.8177058, -0.9111291, 1.668643, 1, 1, 1, 1, 1,
0.8194486, -0.5573354, 2.827337, 1, 1, 1, 1, 1,
0.8212602, 0.3129905, -0.6017971, 1, 1, 1, 1, 1,
0.8221181, 1.403205, 0.895227, 1, 1, 1, 1, 1,
0.8229905, -2.019116, 2.794821, 1, 1, 1, 1, 1,
0.8285266, -0.5561343, 0.7959645, 1, 1, 1, 1, 1,
0.8352261, 0.8241872, -0.3687889, 1, 1, 1, 1, 1,
0.8367836, 1.819179, 0.2596719, 1, 1, 1, 1, 1,
0.84062, -0.5780242, 2.345555, 1, 1, 1, 1, 1,
0.8466134, -0.8732459, 2.790047, 1, 1, 1, 1, 1,
0.8480384, -0.6259778, 2.783799, 1, 1, 1, 1, 1,
0.8492084, 0.8027954, 1.729213, 1, 1, 1, 1, 1,
0.8498216, 1.599453, 0.3147188, 1, 1, 1, 1, 1,
0.8537068, -0.5548881, 1.559693, 1, 1, 1, 1, 1,
0.8551552, -0.4454257, 3.737198, 0, 0, 1, 1, 1,
0.8560783, 0.2274818, 1.405494, 1, 0, 0, 1, 1,
0.86013, -1.335552, 1.089191, 1, 0, 0, 1, 1,
0.8701618, -0.6529529, 3.104493, 1, 0, 0, 1, 1,
0.8703576, -0.2680281, 0.677976, 1, 0, 0, 1, 1,
0.8723392, -0.5407534, 2.533558, 1, 0, 0, 1, 1,
0.8775864, 0.7824389, 0.8918811, 0, 0, 0, 1, 1,
0.8853334, -0.9474229, 2.467378, 0, 0, 0, 1, 1,
0.8877913, 1.04896, 0.7739945, 0, 0, 0, 1, 1,
0.8880328, 1.030953, 0.9643436, 0, 0, 0, 1, 1,
0.891558, 0.9360719, 1.276767, 0, 0, 0, 1, 1,
0.8956452, 0.4399448, 1.318026, 0, 0, 0, 1, 1,
0.8957171, 0.3937891, 2.594932, 0, 0, 0, 1, 1,
0.8974831, 0.3678645, 0.8725142, 1, 1, 1, 1, 1,
0.9010938, 0.07121835, 0.4967641, 1, 1, 1, 1, 1,
0.9016875, -1.747471, 2.164193, 1, 1, 1, 1, 1,
0.9060053, 0.8504561, 0.1465862, 1, 1, 1, 1, 1,
0.9146188, -0.249248, 2.452257, 1, 1, 1, 1, 1,
0.9164608, 1.872823, 0.2655648, 1, 1, 1, 1, 1,
0.9216018, 0.475421, 1.417676, 1, 1, 1, 1, 1,
0.9276494, 0.2292299, 2.623728, 1, 1, 1, 1, 1,
0.9296623, -1.054791, 3.017833, 1, 1, 1, 1, 1,
0.9346395, 0.1141241, 1.943789, 1, 1, 1, 1, 1,
0.9465155, -1.363232, 1.07843, 1, 1, 1, 1, 1,
0.9493399, 1.03828, 0.2011005, 1, 1, 1, 1, 1,
0.9593301, 0.1349061, 2.367218, 1, 1, 1, 1, 1,
0.9685726, 1.438165, 1.675551, 1, 1, 1, 1, 1,
0.9704512, -0.4320385, 0.7781058, 1, 1, 1, 1, 1,
0.9712891, -1.525251, 3.42871, 0, 0, 1, 1, 1,
0.9730515, 0.05643097, -0.2283685, 1, 0, 0, 1, 1,
0.9740795, 1.704791, 0.472024, 1, 0, 0, 1, 1,
0.9762969, -0.8588699, 4.416523, 1, 0, 0, 1, 1,
0.9858328, 0.1772537, 0.5095032, 1, 0, 0, 1, 1,
0.991272, -0.5992827, 2.392071, 1, 0, 0, 1, 1,
0.9924225, 0.9386361, -0.2405149, 0, 0, 0, 1, 1,
0.9936542, -0.9544768, 2.23234, 0, 0, 0, 1, 1,
0.9985453, 0.6851071, 1.123158, 0, 0, 0, 1, 1,
1.00762, 1.874344, 0.703367, 0, 0, 0, 1, 1,
1.015526, -0.8216424, 1.569081, 0, 0, 0, 1, 1,
1.017795, 0.2042871, 2.860373, 0, 0, 0, 1, 1,
1.02632, 0.2670717, -0.03008083, 0, 0, 0, 1, 1,
1.029695, 1.646174, 0.7245892, 1, 1, 1, 1, 1,
1.03087, 0.5211747, 0.4680835, 1, 1, 1, 1, 1,
1.035547, -0.4848473, 2.060859, 1, 1, 1, 1, 1,
1.03831, -1.925591, 2.558969, 1, 1, 1, 1, 1,
1.039075, 0.6673991, 1.218642, 1, 1, 1, 1, 1,
1.042355, 1.685911, 0.1953827, 1, 1, 1, 1, 1,
1.048997, -1.876672, 3.123029, 1, 1, 1, 1, 1,
1.050632, 0.2734007, 1.947221, 1, 1, 1, 1, 1,
1.051849, 0.6229675, 0.1644298, 1, 1, 1, 1, 1,
1.054087, 0.1976187, 0.7198826, 1, 1, 1, 1, 1,
1.059375, 0.8467994, 0.7288116, 1, 1, 1, 1, 1,
1.061884, 0.2536815, 1.614373, 1, 1, 1, 1, 1,
1.062126, 1.376571, 0.04851401, 1, 1, 1, 1, 1,
1.073979, 1.384416, 0.5215327, 1, 1, 1, 1, 1,
1.082262, 1.635268, 2.401923, 1, 1, 1, 1, 1,
1.086171, 1.457655, -0.8153516, 0, 0, 1, 1, 1,
1.086786, -0.3860515, 3.170171, 1, 0, 0, 1, 1,
1.087312, 0.05525351, 2.28402, 1, 0, 0, 1, 1,
1.088807, -0.6406448, -0.106768, 1, 0, 0, 1, 1,
1.092396, 0.1781603, 1.391327, 1, 0, 0, 1, 1,
1.092787, -0.1846952, 1.349119, 1, 0, 0, 1, 1,
1.093151, 1.669253, 0.9326419, 0, 0, 0, 1, 1,
1.100411, 0.634249, 2.092694, 0, 0, 0, 1, 1,
1.100456, -0.1795907, 0.2580369, 0, 0, 0, 1, 1,
1.101819, 0.4977205, 1.45201, 0, 0, 0, 1, 1,
1.102684, 1.019893, 0.07741878, 0, 0, 0, 1, 1,
1.103467, -0.393276, 3.21409, 0, 0, 0, 1, 1,
1.112354, 1.592795, 0.8852738, 0, 0, 0, 1, 1,
1.122159, 1.520206, 0.8938549, 1, 1, 1, 1, 1,
1.126733, 0.5562143, -0.3799202, 1, 1, 1, 1, 1,
1.131598, 0.04194688, 1.680957, 1, 1, 1, 1, 1,
1.137203, -1.359464, 1.705404, 1, 1, 1, 1, 1,
1.141037, 1.173468, 0.9938796, 1, 1, 1, 1, 1,
1.149401, -0.1396753, 2.086525, 1, 1, 1, 1, 1,
1.156712, 2.431911, 0.9784113, 1, 1, 1, 1, 1,
1.164283, 0.3910759, 0.5796552, 1, 1, 1, 1, 1,
1.16523, 0.3866824, 0.691746, 1, 1, 1, 1, 1,
1.16728, 0.1200989, 1.069518, 1, 1, 1, 1, 1,
1.173818, 1.343141, 0.5658061, 1, 1, 1, 1, 1,
1.175317, -1.429511, 0.7615467, 1, 1, 1, 1, 1,
1.177341, -1.277619, 2.652857, 1, 1, 1, 1, 1,
1.185603, 1.773807, 0.09310758, 1, 1, 1, 1, 1,
1.188778, -0.07606972, 2.085075, 1, 1, 1, 1, 1,
1.191977, 1.533232, 0.9882684, 0, 0, 1, 1, 1,
1.192491, -0.586136, 2.548352, 1, 0, 0, 1, 1,
1.197321, 1.166131, 0.1689241, 1, 0, 0, 1, 1,
1.207195, -0.9777509, 1.918546, 1, 0, 0, 1, 1,
1.217916, -0.5081598, 2.416424, 1, 0, 0, 1, 1,
1.219038, -0.1378333, 1.429568, 1, 0, 0, 1, 1,
1.229735, -1.557941, 0.879804, 0, 0, 0, 1, 1,
1.232966, -1.016482, 2.771771, 0, 0, 0, 1, 1,
1.24003, -0.8107887, 1.17406, 0, 0, 0, 1, 1,
1.24848, 0.7755866, 0.5302063, 0, 0, 0, 1, 1,
1.251655, 0.9528149, -0.6500491, 0, 0, 0, 1, 1,
1.257691, 2.25888, -0.2202128, 0, 0, 0, 1, 1,
1.268982, 0.2732514, 2.585912, 0, 0, 0, 1, 1,
1.274662, -0.5869066, 0.2703877, 1, 1, 1, 1, 1,
1.280316, -0.3366348, 2.699034, 1, 1, 1, 1, 1,
1.292068, -0.02000064, 2.503594, 1, 1, 1, 1, 1,
1.299655, -0.7659452, 0.9738712, 1, 1, 1, 1, 1,
1.302866, -0.2146553, 0.01649189, 1, 1, 1, 1, 1,
1.307948, -0.8428974, 1.620748, 1, 1, 1, 1, 1,
1.318348, 0.3312199, 1.122805, 1, 1, 1, 1, 1,
1.318587, 0.3460855, 2.517735, 1, 1, 1, 1, 1,
1.319391, 0.846532, 1.157011, 1, 1, 1, 1, 1,
1.329541, 0.5049105, 0.5192126, 1, 1, 1, 1, 1,
1.343189, 0.8811179, 1.990679, 1, 1, 1, 1, 1,
1.344719, 0.09601779, 0.6718602, 1, 1, 1, 1, 1,
1.347907, 0.7921674, -2.547821, 1, 1, 1, 1, 1,
1.351017, 1.516156, 1.136817, 1, 1, 1, 1, 1,
1.359099, -2.118904, 3.687684, 1, 1, 1, 1, 1,
1.360996, -1.483319, 2.997438, 0, 0, 1, 1, 1,
1.362413, -1.111635, 1.302649, 1, 0, 0, 1, 1,
1.366505, -1.015829, 2.494362, 1, 0, 0, 1, 1,
1.369017, -0.8354431, 2.71648, 1, 0, 0, 1, 1,
1.370255, -1.708813, 3.534672, 1, 0, 0, 1, 1,
1.389768, 1.34497, 2.177079, 1, 0, 0, 1, 1,
1.392512, -0.6767126, 2.018771, 0, 0, 0, 1, 1,
1.393431, -0.7308132, 2.461885, 0, 0, 0, 1, 1,
1.394913, 0.5097662, 2.427294, 0, 0, 0, 1, 1,
1.39708, 0.5620691, 0.9983249, 0, 0, 0, 1, 1,
1.399138, 0.4796854, 0.568902, 0, 0, 0, 1, 1,
1.405134, 1.464658, 2.117455, 0, 0, 0, 1, 1,
1.410323, -1.110244, 1.093903, 0, 0, 0, 1, 1,
1.413795, -0.158491, 0.930833, 1, 1, 1, 1, 1,
1.414884, 0.3863991, 2.089719, 1, 1, 1, 1, 1,
1.416852, 1.244249, 1.643541, 1, 1, 1, 1, 1,
1.425766, 0.903218, 1.589932, 1, 1, 1, 1, 1,
1.427249, -0.3027423, 0.9162336, 1, 1, 1, 1, 1,
1.438949, 1.008567, 0.9236703, 1, 1, 1, 1, 1,
1.441373, -1.279398, 1.141129, 1, 1, 1, 1, 1,
1.446157, -1.375156, 1.962188, 1, 1, 1, 1, 1,
1.451605, -1.385428, 1.920836, 1, 1, 1, 1, 1,
1.465864, 0.3969462, -0.0343448, 1, 1, 1, 1, 1,
1.467763, -1.24778, 1.469163, 1, 1, 1, 1, 1,
1.468314, -1.033489, 2.791615, 1, 1, 1, 1, 1,
1.476768, 1.814822, 0.8588808, 1, 1, 1, 1, 1,
1.478199, 0.4040169, 1.447787, 1, 1, 1, 1, 1,
1.486813, -0.04998623, 2.272122, 1, 1, 1, 1, 1,
1.487966, 0.7471272, 1.857391, 0, 0, 1, 1, 1,
1.490829, -0.06083529, 1.362996, 1, 0, 0, 1, 1,
1.50889, 0.2764597, 2.932455, 1, 0, 0, 1, 1,
1.509943, 0.06032827, 1.051281, 1, 0, 0, 1, 1,
1.510724, -0.2920256, 2.323384, 1, 0, 0, 1, 1,
1.540893, 0.8406532, 1.820138, 1, 0, 0, 1, 1,
1.543185, -0.3268821, 0.339203, 0, 0, 0, 1, 1,
1.58889, -0.3734715, 2.955415, 0, 0, 0, 1, 1,
1.589774, 0.7695418, 0.1400896, 0, 0, 0, 1, 1,
1.613913, -0.279887, 1.671444, 0, 0, 0, 1, 1,
1.630552, -1.953545, 1.673074, 0, 0, 0, 1, 1,
1.65034, 0.2188669, 0.4775814, 0, 0, 0, 1, 1,
1.663808, 1.10215, -0.001966341, 0, 0, 0, 1, 1,
1.677062, 0.4801391, 2.457458, 1, 1, 1, 1, 1,
1.696519, -0.3011566, 2.385535, 1, 1, 1, 1, 1,
1.707807, -0.6731021, 1.593174, 1, 1, 1, 1, 1,
1.713944, -2.361867, 2.135754, 1, 1, 1, 1, 1,
1.71517, 1.384428, -0.1603835, 1, 1, 1, 1, 1,
1.715333, -0.02657381, 0.7643859, 1, 1, 1, 1, 1,
1.721492, -0.6505709, 1.054122, 1, 1, 1, 1, 1,
1.725607, 0.8277508, 0.9434205, 1, 1, 1, 1, 1,
1.73481, -1.704111, 2.33526, 1, 1, 1, 1, 1,
1.738141, 0.164023, 1.818363, 1, 1, 1, 1, 1,
1.74871, 1.082875, 0.4149836, 1, 1, 1, 1, 1,
1.758636, 0.08517991, 2.638478, 1, 1, 1, 1, 1,
1.778234, -0.1578977, -0.1647801, 1, 1, 1, 1, 1,
1.795238, -1.197067, 0.4176073, 1, 1, 1, 1, 1,
1.804484, -0.3580669, 1.814526, 1, 1, 1, 1, 1,
1.810688, 1.1034, 1.027532, 0, 0, 1, 1, 1,
1.812855, -0.7705696, 1.868641, 1, 0, 0, 1, 1,
1.819427, -0.8678775, 1.999543, 1, 0, 0, 1, 1,
1.826096, 0.211552, 1.181358, 1, 0, 0, 1, 1,
1.852761, 0.1729143, 1.93888, 1, 0, 0, 1, 1,
1.854216, 1.226251, 0.3066351, 1, 0, 0, 1, 1,
1.873603, 1.0387, 1.369407, 0, 0, 0, 1, 1,
1.886813, -0.6004978, 1.521057, 0, 0, 0, 1, 1,
1.905779, -0.8669474, 2.814487, 0, 0, 0, 1, 1,
1.910042, -0.5140257, 1.675288, 0, 0, 0, 1, 1,
1.911944, -0.6231461, 2.099611, 0, 0, 0, 1, 1,
1.912987, 0.5315758, 0.8318961, 0, 0, 0, 1, 1,
1.924525, 0.1057653, 1.219865, 0, 0, 0, 1, 1,
1.935733, -0.01053439, 2.552388, 1, 1, 1, 1, 1,
1.93877, 0.456825, 1.26219, 1, 1, 1, 1, 1,
1.944316, 1.617032, 3.695751, 1, 1, 1, 1, 1,
1.944478, -0.02691486, 3.81454, 1, 1, 1, 1, 1,
1.957268, -0.5577632, 0.09187091, 1, 1, 1, 1, 1,
1.964981, -1.094681, 2.089306, 1, 1, 1, 1, 1,
2.016011, -1.276233, 1.833812, 1, 1, 1, 1, 1,
2.03053, -0.1094682, 2.132874, 1, 1, 1, 1, 1,
2.035007, -0.1879647, 2.023654, 1, 1, 1, 1, 1,
2.060341, -0.4080256, 0.4235534, 1, 1, 1, 1, 1,
2.063625, 0.5743582, 1.618593, 1, 1, 1, 1, 1,
2.101372, 0.4437071, 1.652686, 1, 1, 1, 1, 1,
2.106046, 0.3190826, 0.3122144, 1, 1, 1, 1, 1,
2.113672, -0.398605, 1.158455, 1, 1, 1, 1, 1,
2.124102, -0.2464013, 1.165584, 1, 1, 1, 1, 1,
2.129962, -3.804343, 0.285618, 0, 0, 1, 1, 1,
2.15489, -0.008861046, 1.963486, 1, 0, 0, 1, 1,
2.178044, 0.7278876, -0.02858249, 1, 0, 0, 1, 1,
2.182451, 0.0890946, 0.2684008, 1, 0, 0, 1, 1,
2.194686, 0.607044, 2.672696, 1, 0, 0, 1, 1,
2.222424, -0.2810068, 2.712433, 1, 0, 0, 1, 1,
2.239722, 0.2823429, 0.578292, 0, 0, 0, 1, 1,
2.252533, -0.3637762, 0.009979359, 0, 0, 0, 1, 1,
2.262958, 1.161876, 1.568769, 0, 0, 0, 1, 1,
2.277853, 0.5159828, 2.191098, 0, 0, 0, 1, 1,
2.324251, -0.03885859, 0.6828347, 0, 0, 0, 1, 1,
2.353939, -1.342523, 3.342845, 0, 0, 0, 1, 1,
2.381878, 0.01462721, 2.323869, 0, 0, 0, 1, 1,
2.437987, -0.3377879, 2.051779, 1, 1, 1, 1, 1,
2.447677, 1.249483, 0.3823328, 1, 1, 1, 1, 1,
2.625898, 1.193555, 1.82463, 1, 1, 1, 1, 1,
2.67231, -0.8767329, 0.3797376, 1, 1, 1, 1, 1,
2.738687, -3.274454, 3.747222, 1, 1, 1, 1, 1,
3.009865, -1.277641, 3.668874, 1, 1, 1, 1, 1,
3.012344, -2.147235, 2.189972, 1, 1, 1, 1, 1
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
var radius = 9.210286;
var distance = 32.35074;
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
mvMatrix.translate( 0.01129794, 0.5849411, 0.2355876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.35074);
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
