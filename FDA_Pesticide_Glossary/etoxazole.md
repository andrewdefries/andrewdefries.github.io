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
-3.210973, 1.901841, -1.428654, 1, 0, 0, 1,
-2.757776, -0.5162491, -1.711635, 1, 0.007843138, 0, 1,
-2.683086, -0.05689193, -2.148753, 1, 0.01176471, 0, 1,
-2.655742, 0.6580992, -3.276434, 1, 0.01960784, 0, 1,
-2.631152, -0.2348179, -1.206976, 1, 0.02352941, 0, 1,
-2.575875, -0.7965564, -1.903185, 1, 0.03137255, 0, 1,
-2.506296, 0.9448553, -1.694254, 1, 0.03529412, 0, 1,
-2.491049, -1.481767, -1.820172, 1, 0.04313726, 0, 1,
-2.397296, 0.5106753, -2.147175, 1, 0.04705882, 0, 1,
-2.365971, -1.143114, -1.948879, 1, 0.05490196, 0, 1,
-2.347216, -0.2390907, -1.723271, 1, 0.05882353, 0, 1,
-2.314407, -1.200399, -1.403874, 1, 0.06666667, 0, 1,
-2.249869, -0.2082866, -1.188637, 1, 0.07058824, 0, 1,
-2.088132, -1.991771, -2.783147, 1, 0.07843138, 0, 1,
-2.06391, 0.07453992, -1.694073, 1, 0.08235294, 0, 1,
-2.04825, 0.1136175, -1.829231, 1, 0.09019608, 0, 1,
-2.01043, 0.7316791, -1.39615, 1, 0.09411765, 0, 1,
-2.004557, -0.1052281, -2.157537, 1, 0.1019608, 0, 1,
-1.975811, 1.860282, -2.13511, 1, 0.1098039, 0, 1,
-1.946457, -1.069368, -2.476263, 1, 0.1137255, 0, 1,
-1.922245, 1.473407, -0.05720171, 1, 0.1215686, 0, 1,
-1.919313, 1.638226, -0.1312827, 1, 0.1254902, 0, 1,
-1.90682, 1.625288, -0.4716762, 1, 0.1333333, 0, 1,
-1.900873, 0.7470499, -1.536488, 1, 0.1372549, 0, 1,
-1.870153, -1.330463, -2.380766, 1, 0.145098, 0, 1,
-1.862645, 0.452208, -1.644915, 1, 0.1490196, 0, 1,
-1.851359, -0.4163317, -2.339389, 1, 0.1568628, 0, 1,
-1.848302, -0.2422763, -1.99436, 1, 0.1607843, 0, 1,
-1.83442, -1.422584, -2.287094, 1, 0.1686275, 0, 1,
-1.833793, -0.8117373, -0.7015781, 1, 0.172549, 0, 1,
-1.815228, 0.1765518, 0.4860878, 1, 0.1803922, 0, 1,
-1.774927, 0.2847669, -2.313802, 1, 0.1843137, 0, 1,
-1.773403, -0.4544273, -0.951224, 1, 0.1921569, 0, 1,
-1.753086, 1.573396, -1.043321, 1, 0.1960784, 0, 1,
-1.751052, -1.58825, -1.611578, 1, 0.2039216, 0, 1,
-1.750451, -1.160934, -1.901947, 1, 0.2117647, 0, 1,
-1.748284, 0.8208263, -0.9370142, 1, 0.2156863, 0, 1,
-1.723803, 0.619248, -1.361044, 1, 0.2235294, 0, 1,
-1.69958, 1.519313, 1.250617, 1, 0.227451, 0, 1,
-1.679864, 0.6786493, -0.4503111, 1, 0.2352941, 0, 1,
-1.669589, 0.5792524, -2.049996, 1, 0.2392157, 0, 1,
-1.647406, 1.024251, -2.091415, 1, 0.2470588, 0, 1,
-1.637546, -1.06766, -2.984056, 1, 0.2509804, 0, 1,
-1.624997, -0.5844678, -1.944245, 1, 0.2588235, 0, 1,
-1.608736, 0.02836793, -2.284327, 1, 0.2627451, 0, 1,
-1.599051, -0.6072596, -1.3074, 1, 0.2705882, 0, 1,
-1.598524, -0.9483645, -2.272188, 1, 0.2745098, 0, 1,
-1.575843, -0.4944089, -2.072692, 1, 0.282353, 0, 1,
-1.564825, 0.7909259, -3.656423, 1, 0.2862745, 0, 1,
-1.564328, -0.3286626, -1.426344, 1, 0.2941177, 0, 1,
-1.564029, 0.5348465, 0.2510038, 1, 0.3019608, 0, 1,
-1.557567, 0.2021118, 0.01076911, 1, 0.3058824, 0, 1,
-1.556474, 0.8150793, -1.208818, 1, 0.3137255, 0, 1,
-1.55087, 0.4757176, 0.5004327, 1, 0.3176471, 0, 1,
-1.509377, 0.2378416, -0.8716842, 1, 0.3254902, 0, 1,
-1.501981, -0.5313486, -1.400124, 1, 0.3294118, 0, 1,
-1.501749, -2.16128, -3.25352, 1, 0.3372549, 0, 1,
-1.501108, 0.01961306, -1.087197, 1, 0.3411765, 0, 1,
-1.492214, -0.0835688, -3.334697, 1, 0.3490196, 0, 1,
-1.491136, 0.07799181, -1.204826, 1, 0.3529412, 0, 1,
-1.490374, -0.5886346, -1.391844, 1, 0.3607843, 0, 1,
-1.46849, 0.4960388, -1.395355, 1, 0.3647059, 0, 1,
-1.455476, -0.7648408, -3.308942, 1, 0.372549, 0, 1,
-1.448527, -1.941676, -2.082113, 1, 0.3764706, 0, 1,
-1.445485, 0.4579249, -0.9693868, 1, 0.3843137, 0, 1,
-1.444359, -0.07063792, -2.302019, 1, 0.3882353, 0, 1,
-1.434142, -0.9432851, -2.756716, 1, 0.3960784, 0, 1,
-1.432503, 0.9084015, -2.061515, 1, 0.4039216, 0, 1,
-1.429465, -0.03689879, -0.4047048, 1, 0.4078431, 0, 1,
-1.427541, 0.6877951, -0.9511147, 1, 0.4156863, 0, 1,
-1.426524, -1.230157, -1.991724, 1, 0.4196078, 0, 1,
-1.411658, -0.15377, -3.009613, 1, 0.427451, 0, 1,
-1.411066, 0.8309295, 0.3124012, 1, 0.4313726, 0, 1,
-1.406401, -1.13223, -1.295518, 1, 0.4392157, 0, 1,
-1.401768, 0.3366403, -0.8407443, 1, 0.4431373, 0, 1,
-1.398185, -1.352274, -3.761261, 1, 0.4509804, 0, 1,
-1.396703, 0.5752914, 0.2127676, 1, 0.454902, 0, 1,
-1.386359, -0.2024469, -0.6423487, 1, 0.4627451, 0, 1,
-1.385591, 1.207144, -0.7151176, 1, 0.4666667, 0, 1,
-1.380261, -0.5115315, -1.987033, 1, 0.4745098, 0, 1,
-1.379866, -1.457651, -1.443779, 1, 0.4784314, 0, 1,
-1.370075, -0.5026085, -1.708075, 1, 0.4862745, 0, 1,
-1.365999, 0.03901228, -2.095078, 1, 0.4901961, 0, 1,
-1.357714, -0.5808323, -2.770613, 1, 0.4980392, 0, 1,
-1.356937, 1.450263, 0.1817113, 1, 0.5058824, 0, 1,
-1.355426, 1.672459, 0.1861508, 1, 0.509804, 0, 1,
-1.347508, -1.161014, -3.368634, 1, 0.5176471, 0, 1,
-1.343855, -2.555007, -2.815534, 1, 0.5215687, 0, 1,
-1.34059, -0.1473836, -0.9791541, 1, 0.5294118, 0, 1,
-1.340003, 1.460027, 0.1122183, 1, 0.5333334, 0, 1,
-1.335942, 1.132697, -1.416914, 1, 0.5411765, 0, 1,
-1.334699, 1.559369, -0.257037, 1, 0.5450981, 0, 1,
-1.330892, -0.9956532, -1.305094, 1, 0.5529412, 0, 1,
-1.328739, 0.5917376, -0.4313757, 1, 0.5568628, 0, 1,
-1.321691, 0.8400978, 0.2277585, 1, 0.5647059, 0, 1,
-1.315388, -0.9221214, -2.615454, 1, 0.5686275, 0, 1,
-1.314032, 0.007015939, -1.833049, 1, 0.5764706, 0, 1,
-1.307844, 1.103044, -1.168709, 1, 0.5803922, 0, 1,
-1.303109, 1.668512, 1.801781, 1, 0.5882353, 0, 1,
-1.300578, 0.5247524, 0.3545267, 1, 0.5921569, 0, 1,
-1.29794, 0.7629496, -1.843364, 1, 0.6, 0, 1,
-1.282444, 0.85614, -2.397661, 1, 0.6078432, 0, 1,
-1.275819, -0.8742507, -2.494134, 1, 0.6117647, 0, 1,
-1.267181, -0.6504467, -0.186804, 1, 0.6196079, 0, 1,
-1.257469, -0.656424, -2.757449, 1, 0.6235294, 0, 1,
-1.247053, 1.21486, -2.251162, 1, 0.6313726, 0, 1,
-1.245801, -0.3587115, 0.4855946, 1, 0.6352941, 0, 1,
-1.244418, -1.638712, -2.024583, 1, 0.6431373, 0, 1,
-1.243196, -0.3291599, -1.57945, 1, 0.6470588, 0, 1,
-1.239352, -0.2071825, -2.350648, 1, 0.654902, 0, 1,
-1.227368, -0.01135998, -2.30607, 1, 0.6588235, 0, 1,
-1.223487, -0.4022675, -1.857792, 1, 0.6666667, 0, 1,
-1.222444, 0.689943, -1.556999, 1, 0.6705883, 0, 1,
-1.210339, 0.5317764, -0.1100698, 1, 0.6784314, 0, 1,
-1.209981, -1.134027, -2.23571, 1, 0.682353, 0, 1,
-1.206985, -0.184453, -0.7057046, 1, 0.6901961, 0, 1,
-1.19785, 1.302681, -0.6989796, 1, 0.6941177, 0, 1,
-1.190572, 1.115286, 1.765388, 1, 0.7019608, 0, 1,
-1.190109, 0.9613215, -1.44897, 1, 0.7098039, 0, 1,
-1.171438, -0.3597589, -2.089011, 1, 0.7137255, 0, 1,
-1.16498, -0.4871687, -2.55283, 1, 0.7215686, 0, 1,
-1.164606, 0.5004962, -1.886748, 1, 0.7254902, 0, 1,
-1.161502, 1.201437, -0.3768232, 1, 0.7333333, 0, 1,
-1.158995, 0.4851469, -1.765032, 1, 0.7372549, 0, 1,
-1.153287, 0.6956683, -1.498014, 1, 0.7450981, 0, 1,
-1.152344, 0.09011822, -2.269377, 1, 0.7490196, 0, 1,
-1.151741, 0.5106733, -1.788093, 1, 0.7568628, 0, 1,
-1.140576, -2.20294, -2.552801, 1, 0.7607843, 0, 1,
-1.139367, 0.3828918, -2.487687, 1, 0.7686275, 0, 1,
-1.135356, 0.8189901, -0.8673612, 1, 0.772549, 0, 1,
-1.128818, -1.615744, -2.173254, 1, 0.7803922, 0, 1,
-1.124392, -1.072239, -2.717711, 1, 0.7843137, 0, 1,
-1.124208, 2.710177, -0.2495467, 1, 0.7921569, 0, 1,
-1.12218, 0.1010369, -3.744587, 1, 0.7960784, 0, 1,
-1.121597, 0.001441084, -0.7774363, 1, 0.8039216, 0, 1,
-1.121447, 1.416619, -0.622175, 1, 0.8117647, 0, 1,
-1.118338, 1.817071, -0.310025, 1, 0.8156863, 0, 1,
-1.114672, -0.1476525, -0.8331537, 1, 0.8235294, 0, 1,
-1.111508, -1.034911, -1.698524, 1, 0.827451, 0, 1,
-1.10534, 0.3833716, -2.911285, 1, 0.8352941, 0, 1,
-1.105286, -0.7481393, -2.237989, 1, 0.8392157, 0, 1,
-1.100764, -0.9973096, -3.100089, 1, 0.8470588, 0, 1,
-1.093601, -1.877795, -1.328618, 1, 0.8509804, 0, 1,
-1.091625, 1.309262, -1.120244, 1, 0.8588235, 0, 1,
-1.088885, 1.427737, -0.4105319, 1, 0.8627451, 0, 1,
-1.074536, -0.7217895, -3.355783, 1, 0.8705882, 0, 1,
-1.064808, 0.6110895, 0.8376272, 1, 0.8745098, 0, 1,
-1.061478, 1.915647, -1.538191, 1, 0.8823529, 0, 1,
-1.060203, -0.2386823, -1.099558, 1, 0.8862745, 0, 1,
-1.058558, 0.05306125, -2.193272, 1, 0.8941177, 0, 1,
-1.048786, -0.4636637, -1.958714, 1, 0.8980392, 0, 1,
-1.040045, -0.4282468, -2.305036, 1, 0.9058824, 0, 1,
-1.034644, -0.8142031, -3.587337, 1, 0.9137255, 0, 1,
-1.024051, -0.9206039, -2.525415, 1, 0.9176471, 0, 1,
-1.023319, 0.9309379, -0.116425, 1, 0.9254902, 0, 1,
-1.017439, 0.8587914, -0.09021282, 1, 0.9294118, 0, 1,
-1.014648, -0.5879682, -1.120344, 1, 0.9372549, 0, 1,
-1.01204, -0.7340441, -1.769887, 1, 0.9411765, 0, 1,
-1.010535, 0.5944139, -0.8981763, 1, 0.9490196, 0, 1,
-1.009836, -0.3687896, -1.817654, 1, 0.9529412, 0, 1,
-1.00475, -0.05845272, -2.537555, 1, 0.9607843, 0, 1,
-0.9978989, -1.846198, -2.592389, 1, 0.9647059, 0, 1,
-0.9919598, -0.9648499, -0.3297518, 1, 0.972549, 0, 1,
-0.9885834, 0.2487537, -2.317374, 1, 0.9764706, 0, 1,
-0.9858622, -1.078441, -2.141274, 1, 0.9843137, 0, 1,
-0.9846697, -1.302933, -1.718988, 1, 0.9882353, 0, 1,
-0.9757566, 0.04338866, -1.415439, 1, 0.9960784, 0, 1,
-0.9755447, 0.004909769, -1.124034, 0.9960784, 1, 0, 1,
-0.9724512, -0.4778952, -1.29172, 0.9921569, 1, 0, 1,
-0.9715158, -0.199752, 0.7599933, 0.9843137, 1, 0, 1,
-0.9711958, -0.7672637, -2.719012, 0.9803922, 1, 0, 1,
-0.9622487, 0.1254064, -1.218148, 0.972549, 1, 0, 1,
-0.9612792, 0.05505978, -1.808972, 0.9686275, 1, 0, 1,
-0.9582152, 0.4315879, -2.04005, 0.9607843, 1, 0, 1,
-0.9545981, -0.8677209, -0.3127722, 0.9568627, 1, 0, 1,
-0.9510381, 0.08680104, -2.694167, 0.9490196, 1, 0, 1,
-0.948354, 0.7148138, -2.157566, 0.945098, 1, 0, 1,
-0.9461305, -0.3086828, -1.634777, 0.9372549, 1, 0, 1,
-0.9426966, -0.5712669, -3.371645, 0.9333333, 1, 0, 1,
-0.939508, -0.91378, -2.691425, 0.9254902, 1, 0, 1,
-0.9369438, -0.5184119, -1.777284, 0.9215686, 1, 0, 1,
-0.9357657, 1.226935, -1.216375, 0.9137255, 1, 0, 1,
-0.9352809, -1.256241, -0.6115629, 0.9098039, 1, 0, 1,
-0.9276109, 1.016102, 0.2624322, 0.9019608, 1, 0, 1,
-0.9264277, -0.8307025, -4.002787, 0.8941177, 1, 0, 1,
-0.92122, 0.3297755, -1.300977, 0.8901961, 1, 0, 1,
-0.9164923, -0.6281112, -0.85178, 0.8823529, 1, 0, 1,
-0.9163327, 0.7460046, -1.204067, 0.8784314, 1, 0, 1,
-0.9126928, -1.227301, -4.284566, 0.8705882, 1, 0, 1,
-0.9099468, 0.4198954, -1.206273, 0.8666667, 1, 0, 1,
-0.9082674, 1.017577, -1.685162, 0.8588235, 1, 0, 1,
-0.9037113, -0.4394302, -1.680787, 0.854902, 1, 0, 1,
-0.9032125, -0.1152028, -0.2172654, 0.8470588, 1, 0, 1,
-0.9014219, -1.223446, -4.531577, 0.8431373, 1, 0, 1,
-0.8989644, 0.8470055, -1.066658, 0.8352941, 1, 0, 1,
-0.8980062, -0.02874849, -1.743362, 0.8313726, 1, 0, 1,
-0.8947583, -0.4878769, -1.638568, 0.8235294, 1, 0, 1,
-0.8827699, -0.6662225, -1.617488, 0.8196079, 1, 0, 1,
-0.8774688, -0.2692006, 1.086171, 0.8117647, 1, 0, 1,
-0.8693946, -0.3581019, 0.1202137, 0.8078431, 1, 0, 1,
-0.8673718, 1.060459, -1.960224, 0.8, 1, 0, 1,
-0.8655389, 2.052803, 0.3758276, 0.7921569, 1, 0, 1,
-0.8592613, 2.452209, -1.866446, 0.7882353, 1, 0, 1,
-0.8574597, 0.01046128, -0.1614555, 0.7803922, 1, 0, 1,
-0.8539783, 0.1727603, -1.011968, 0.7764706, 1, 0, 1,
-0.84152, 0.1269636, -1.152099, 0.7686275, 1, 0, 1,
-0.8375108, 0.4187402, -0.08891298, 0.7647059, 1, 0, 1,
-0.8341116, 2.083483, 0.3501428, 0.7568628, 1, 0, 1,
-0.8334096, 2.087392, -1.971377, 0.7529412, 1, 0, 1,
-0.8323634, 0.4817444, -1.156217, 0.7450981, 1, 0, 1,
-0.8300463, 0.03953907, 0.8336447, 0.7411765, 1, 0, 1,
-0.8257396, 0.6040704, 0.3140509, 0.7333333, 1, 0, 1,
-0.8223565, -1.510437, -2.831186, 0.7294118, 1, 0, 1,
-0.8203045, 0.2020607, -0.1043095, 0.7215686, 1, 0, 1,
-0.8195529, -1.753291, -3.679423, 0.7176471, 1, 0, 1,
-0.8076969, 0.335334, -0.8741752, 0.7098039, 1, 0, 1,
-0.7979309, -1.031875, -1.348842, 0.7058824, 1, 0, 1,
-0.7896969, -0.4486787, -2.137007, 0.6980392, 1, 0, 1,
-0.7884552, -0.7244359, -3.712329, 0.6901961, 1, 0, 1,
-0.786456, 0.3658609, -0.5753676, 0.6862745, 1, 0, 1,
-0.7820667, 0.4457892, 0.0869837, 0.6784314, 1, 0, 1,
-0.7812997, -0.2312447, -2.26785, 0.6745098, 1, 0, 1,
-0.7812639, 0.318532, -1.093156, 0.6666667, 1, 0, 1,
-0.7779637, 0.1859548, -1.827262, 0.6627451, 1, 0, 1,
-0.7770938, 1.363633, -0.1545134, 0.654902, 1, 0, 1,
-0.7703177, 0.2623575, -1.290184, 0.6509804, 1, 0, 1,
-0.7696987, -0.6759248, -1.575462, 0.6431373, 1, 0, 1,
-0.7666327, -1.208183, -0.640817, 0.6392157, 1, 0, 1,
-0.7613425, -0.4886941, -1.48848, 0.6313726, 1, 0, 1,
-0.7611254, 0.2563389, 0.2811509, 0.627451, 1, 0, 1,
-0.7565989, 0.7637492, -1.105325, 0.6196079, 1, 0, 1,
-0.7503285, 0.7358746, -0.2060906, 0.6156863, 1, 0, 1,
-0.7464949, 0.4955625, -1.100621, 0.6078432, 1, 0, 1,
-0.7446118, -0.9828324, -3.240902, 0.6039216, 1, 0, 1,
-0.7429926, -1.063252, -3.223898, 0.5960785, 1, 0, 1,
-0.7425151, 0.3278835, -1.11609, 0.5882353, 1, 0, 1,
-0.7386185, 0.2237074, -0.6597899, 0.5843138, 1, 0, 1,
-0.7286315, -0.07731827, -0.4207518, 0.5764706, 1, 0, 1,
-0.7235677, 1.026183, -1.669327, 0.572549, 1, 0, 1,
-0.7186747, 0.01246758, -0.360356, 0.5647059, 1, 0, 1,
-0.715538, 1.189813, 0.08681691, 0.5607843, 1, 0, 1,
-0.7119831, 0.2810262, -1.229922, 0.5529412, 1, 0, 1,
-0.7111064, 0.5663957, -1.26023, 0.5490196, 1, 0, 1,
-0.7102584, 0.07174876, -0.3175045, 0.5411765, 1, 0, 1,
-0.6923203, 1.648337, -0.9170698, 0.5372549, 1, 0, 1,
-0.692269, 1.063035, -0.5597975, 0.5294118, 1, 0, 1,
-0.690146, 0.08646964, -1.884494, 0.5254902, 1, 0, 1,
-0.6884072, 0.1386614, -2.12697, 0.5176471, 1, 0, 1,
-0.6873748, -0.6864565, -2.660902, 0.5137255, 1, 0, 1,
-0.6767946, -0.9980128, -2.619813, 0.5058824, 1, 0, 1,
-0.6698044, -0.5924193, -2.608127, 0.5019608, 1, 0, 1,
-0.6692569, -1.927255, -1.876304, 0.4941176, 1, 0, 1,
-0.6627648, -0.8769696, -3.70082, 0.4862745, 1, 0, 1,
-0.6544594, -0.5275712, -2.450314, 0.4823529, 1, 0, 1,
-0.6542042, -0.4412049, -2.004956, 0.4745098, 1, 0, 1,
-0.6536355, -0.1649082, -1.514476, 0.4705882, 1, 0, 1,
-0.6424845, -0.4176222, -3.369178, 0.4627451, 1, 0, 1,
-0.6367038, 0.0882423, -3.416595, 0.4588235, 1, 0, 1,
-0.6366361, 2.896643, 2.028424, 0.4509804, 1, 0, 1,
-0.6305544, 1.000613, -0.1212399, 0.4470588, 1, 0, 1,
-0.6304579, 0.9831758, -1.468175, 0.4392157, 1, 0, 1,
-0.6263711, -0.2298428, -3.064658, 0.4352941, 1, 0, 1,
-0.625106, 0.5300316, -1.529276, 0.427451, 1, 0, 1,
-0.6219149, 0.8052426, -1.177655, 0.4235294, 1, 0, 1,
-0.6209329, -0.5941528, -3.126276, 0.4156863, 1, 0, 1,
-0.6189036, 1.260954, -2.208426, 0.4117647, 1, 0, 1,
-0.6141576, 0.6013839, 0.8905677, 0.4039216, 1, 0, 1,
-0.6092964, 0.5209948, -1.106055, 0.3960784, 1, 0, 1,
-0.6089017, 0.3300102, -0.3266065, 0.3921569, 1, 0, 1,
-0.6084384, -0.004259819, -1.771646, 0.3843137, 1, 0, 1,
-0.6071452, 1.246751, 0.2607169, 0.3803922, 1, 0, 1,
-0.6028356, 0.8291335, -1.598052, 0.372549, 1, 0, 1,
-0.5981275, -0.1366483, -0.9080217, 0.3686275, 1, 0, 1,
-0.5957208, -0.304527, -2.907461, 0.3607843, 1, 0, 1,
-0.5907217, -0.5919093, -2.284641, 0.3568628, 1, 0, 1,
-0.5802967, -0.7598737, -2.797806, 0.3490196, 1, 0, 1,
-0.5792096, 0.6182074, -0.1413663, 0.345098, 1, 0, 1,
-0.5782226, 0.3174187, -0.8925509, 0.3372549, 1, 0, 1,
-0.5691606, 2.083971, 0.8597955, 0.3333333, 1, 0, 1,
-0.5605898, 0.2954871, -2.352146, 0.3254902, 1, 0, 1,
-0.5571702, -0.07884037, -3.451106, 0.3215686, 1, 0, 1,
-0.5565506, -0.4919012, -3.066359, 0.3137255, 1, 0, 1,
-0.5533616, -0.08788662, -1.862043, 0.3098039, 1, 0, 1,
-0.5488293, 0.2264087, -0.5016525, 0.3019608, 1, 0, 1,
-0.5486237, 0.3272477, -0.9797125, 0.2941177, 1, 0, 1,
-0.5456092, 0.6940894, -1.085978, 0.2901961, 1, 0, 1,
-0.5450345, 0.1139897, -1.682597, 0.282353, 1, 0, 1,
-0.5427452, -1.078179, -2.288034, 0.2784314, 1, 0, 1,
-0.5331103, 0.05687206, -0.4871667, 0.2705882, 1, 0, 1,
-0.5248255, 0.3089029, 0.2601759, 0.2666667, 1, 0, 1,
-0.5149954, -1.696974, -3.066361, 0.2588235, 1, 0, 1,
-0.5125977, -0.5215862, -2.522707, 0.254902, 1, 0, 1,
-0.5110823, 1.237745, -2.032822, 0.2470588, 1, 0, 1,
-0.5068539, 1.736009, -1.799112, 0.2431373, 1, 0, 1,
-0.5055863, -0.5020528, -0.6732258, 0.2352941, 1, 0, 1,
-0.5008816, 0.3886839, -1.45757, 0.2313726, 1, 0, 1,
-0.4961469, -1.910487, -2.138639, 0.2235294, 1, 0, 1,
-0.4937426, 0.2478681, -0.7045572, 0.2196078, 1, 0, 1,
-0.4915045, 0.2738712, -2.132742, 0.2117647, 1, 0, 1,
-0.4824343, 0.4789098, -0.7489991, 0.2078431, 1, 0, 1,
-0.4812706, 0.1773768, -0.6838073, 0.2, 1, 0, 1,
-0.4757534, -0.6704227, -2.081469, 0.1921569, 1, 0, 1,
-0.4724614, -0.4768353, -1.879588, 0.1882353, 1, 0, 1,
-0.4716964, -1.313101, -2.054963, 0.1803922, 1, 0, 1,
-0.4699939, 2.723328, 0.7030426, 0.1764706, 1, 0, 1,
-0.4679847, -2.057285, -1.900233, 0.1686275, 1, 0, 1,
-0.4674032, -1.22718, -2.672267, 0.1647059, 1, 0, 1,
-0.4667542, -1.304632, -1.976935, 0.1568628, 1, 0, 1,
-0.4623865, 0.2789036, -1.333878, 0.1529412, 1, 0, 1,
-0.4606139, 0.3082751, -1.517438, 0.145098, 1, 0, 1,
-0.4583234, -2.097658, -3.418952, 0.1411765, 1, 0, 1,
-0.4579673, 1.067658, -0.8676162, 0.1333333, 1, 0, 1,
-0.4569493, 1.264892, -0.6675019, 0.1294118, 1, 0, 1,
-0.4568533, -1.131815, -2.319616, 0.1215686, 1, 0, 1,
-0.4553506, -0.4419248, -1.323597, 0.1176471, 1, 0, 1,
-0.4553414, 0.9349023, -0.6307524, 0.1098039, 1, 0, 1,
-0.4531153, 0.4154368, -1.063403, 0.1058824, 1, 0, 1,
-0.4496049, 2.159991, -0.6002809, 0.09803922, 1, 0, 1,
-0.4472724, -1.485555, -3.625132, 0.09019608, 1, 0, 1,
-0.4407326, -0.6829648, -3.985912, 0.08627451, 1, 0, 1,
-0.4344441, -0.6307778, -0.860114, 0.07843138, 1, 0, 1,
-0.4332927, 1.102191, 0.2168092, 0.07450981, 1, 0, 1,
-0.4332185, -0.5684542, -1.657344, 0.06666667, 1, 0, 1,
-0.4331698, 0.03121796, -2.958581, 0.0627451, 1, 0, 1,
-0.4293718, 0.2501988, -1.746095, 0.05490196, 1, 0, 1,
-0.4273017, 1.132423, -1.141449, 0.05098039, 1, 0, 1,
-0.426889, -1.11472, -5.288009, 0.04313726, 1, 0, 1,
-0.4230774, 1.169624, -1.192825, 0.03921569, 1, 0, 1,
-0.4217802, -0.3693743, -3.610591, 0.03137255, 1, 0, 1,
-0.4209892, 0.7633111, -1.080108, 0.02745098, 1, 0, 1,
-0.414635, 1.397778, -1.031965, 0.01960784, 1, 0, 1,
-0.4129554, 1.28828, -1.269017, 0.01568628, 1, 0, 1,
-0.4127474, -0.5094606, -2.780433, 0.007843138, 1, 0, 1,
-0.4102082, 0.885312, -1.315125, 0.003921569, 1, 0, 1,
-0.4091782, 0.9242837, -1.728414, 0, 1, 0.003921569, 1,
-0.4040204, -0.3147715, -2.210452, 0, 1, 0.01176471, 1,
-0.4026802, 0.9895752, -1.201606, 0, 1, 0.01568628, 1,
-0.3965759, 0.6132375, -1.166703, 0, 1, 0.02352941, 1,
-0.3962887, 0.02464968, -2.99133, 0, 1, 0.02745098, 1,
-0.3938086, 0.755322, -2.080786, 0, 1, 0.03529412, 1,
-0.3909001, 1.054427, 0.7129174, 0, 1, 0.03921569, 1,
-0.3904474, -0.5207189, -2.304205, 0, 1, 0.04705882, 1,
-0.3831959, 0.9801347, -1.567314, 0, 1, 0.05098039, 1,
-0.3829232, -0.614613, -0.8018192, 0, 1, 0.05882353, 1,
-0.3820647, 1.061848, 0.922978, 0, 1, 0.0627451, 1,
-0.3819904, -0.4445495, -0.9377182, 0, 1, 0.07058824, 1,
-0.3819623, 0.7477518, -0.1204516, 0, 1, 0.07450981, 1,
-0.3808424, 1.00879, -0.4645447, 0, 1, 0.08235294, 1,
-0.3762771, -0.7371729, -2.258244, 0, 1, 0.08627451, 1,
-0.3753772, -1.219496, -3.709746, 0, 1, 0.09411765, 1,
-0.3732724, -0.14195, -2.379071, 0, 1, 0.1019608, 1,
-0.3699266, -0.2503253, -2.818874, 0, 1, 0.1058824, 1,
-0.3675941, 0.6816211, -0.1990364, 0, 1, 0.1137255, 1,
-0.3642147, -0.4695872, -2.641826, 0, 1, 0.1176471, 1,
-0.3581733, -0.3331171, -2.790783, 0, 1, 0.1254902, 1,
-0.358007, 1.288165, 0.2152199, 0, 1, 0.1294118, 1,
-0.3564037, -0.2228876, -2.675532, 0, 1, 0.1372549, 1,
-0.3558822, 1.562181, -0.6493814, 0, 1, 0.1411765, 1,
-0.3523341, 0.6962006, -0.2809833, 0, 1, 0.1490196, 1,
-0.3513638, 0.2839383, -0.2918534, 0, 1, 0.1529412, 1,
-0.3511064, -2.590733, -3.592426, 0, 1, 0.1607843, 1,
-0.3496609, -0.438264, -2.609137, 0, 1, 0.1647059, 1,
-0.344327, -0.7664156, -1.871688, 0, 1, 0.172549, 1,
-0.3431412, -2.147869, -2.675237, 0, 1, 0.1764706, 1,
-0.3420613, 1.19156, -0.4606946, 0, 1, 0.1843137, 1,
-0.3396042, -1.42616, -3.389133, 0, 1, 0.1882353, 1,
-0.3363694, 0.125482, -0.5375656, 0, 1, 0.1960784, 1,
-0.3363363, 0.3336756, -1.684243, 0, 1, 0.2039216, 1,
-0.3351113, 0.5309168, -0.38076, 0, 1, 0.2078431, 1,
-0.3328499, -0.6223559, -0.6225072, 0, 1, 0.2156863, 1,
-0.3141991, 0.1716726, 0.407225, 0, 1, 0.2196078, 1,
-0.3136491, -1.748979, -3.480145, 0, 1, 0.227451, 1,
-0.3120439, 0.4554307, -0.7857973, 0, 1, 0.2313726, 1,
-0.3086407, 0.7156448, -0.07314751, 0, 1, 0.2392157, 1,
-0.3055661, 0.5948811, -1.408799, 0, 1, 0.2431373, 1,
-0.3045045, -0.503383, -2.580277, 0, 1, 0.2509804, 1,
-0.3032241, 1.354304, -1.211147, 0, 1, 0.254902, 1,
-0.2984492, 0.6274526, -0.9794628, 0, 1, 0.2627451, 1,
-0.2965347, 0.0719864, -0.5246932, 0, 1, 0.2666667, 1,
-0.2951905, -0.8366389, -1.131111, 0, 1, 0.2745098, 1,
-0.2901826, -0.5895933, -1.879591, 0, 1, 0.2784314, 1,
-0.2850111, -0.749573, -2.08486, 0, 1, 0.2862745, 1,
-0.2842263, -0.3586513, -2.41384, 0, 1, 0.2901961, 1,
-0.2813585, 1.037571, -0.5339041, 0, 1, 0.2980392, 1,
-0.2772162, 0.6869254, 0.3350756, 0, 1, 0.3058824, 1,
-0.2765619, -0.6900455, -2.453842, 0, 1, 0.3098039, 1,
-0.2725991, 1.3934, 0.7456882, 0, 1, 0.3176471, 1,
-0.2679225, 1.223325, -1.401822, 0, 1, 0.3215686, 1,
-0.262272, -1.48033, -3.570746, 0, 1, 0.3294118, 1,
-0.2587076, -0.6567858, -3.012345, 0, 1, 0.3333333, 1,
-0.2525295, 0.9363087, 0.3603981, 0, 1, 0.3411765, 1,
-0.2476084, 0.5126156, -0.6608483, 0, 1, 0.345098, 1,
-0.2450279, -0.7290645, -3.16011, 0, 1, 0.3529412, 1,
-0.2447316, 0.2768565, -0.09553045, 0, 1, 0.3568628, 1,
-0.2417791, 1.994208, 0.7123822, 0, 1, 0.3647059, 1,
-0.2413003, 0.4096251, -0.6252038, 0, 1, 0.3686275, 1,
-0.2404829, 1.061911, -0.7268797, 0, 1, 0.3764706, 1,
-0.2386425, -1.791615, -2.40687, 0, 1, 0.3803922, 1,
-0.2313288, -1.531456, -4.166343, 0, 1, 0.3882353, 1,
-0.2300247, 0.3677556, -1.82936, 0, 1, 0.3921569, 1,
-0.2289709, -0.3066886, -3.070791, 0, 1, 0.4, 1,
-0.2283758, 0.4362242, -0.1865195, 0, 1, 0.4078431, 1,
-0.2278195, -0.472729, -3.060578, 0, 1, 0.4117647, 1,
-0.2236151, -0.3292178, -4.493303, 0, 1, 0.4196078, 1,
-0.2230933, 1.306092, 0.8655712, 0, 1, 0.4235294, 1,
-0.2203697, -0.9938617, -4.271785, 0, 1, 0.4313726, 1,
-0.2192546, 0.6947977, 0.5204347, 0, 1, 0.4352941, 1,
-0.2170992, 0.7336963, -0.9948147, 0, 1, 0.4431373, 1,
-0.2169869, 2.235693, -0.4187108, 0, 1, 0.4470588, 1,
-0.2123426, -0.503217, -1.930842, 0, 1, 0.454902, 1,
-0.2059339, -0.6128919, -3.515064, 0, 1, 0.4588235, 1,
-0.1949089, -0.6685046, -3.964794, 0, 1, 0.4666667, 1,
-0.1881568, 0.3199799, -0.2113, 0, 1, 0.4705882, 1,
-0.1856913, 0.2765912, -0.9737535, 0, 1, 0.4784314, 1,
-0.1851776, -0.5069114, -3.300642, 0, 1, 0.4823529, 1,
-0.1838948, -0.4904453, -1.658791, 0, 1, 0.4901961, 1,
-0.1831552, -1.28696, -3.745424, 0, 1, 0.4941176, 1,
-0.1796621, -0.1250728, -2.021379, 0, 1, 0.5019608, 1,
-0.179609, -0.1330165, -2.157161, 0, 1, 0.509804, 1,
-0.1795283, -0.0100252, -3.264272, 0, 1, 0.5137255, 1,
-0.1665547, -2.426229, -2.20564, 0, 1, 0.5215687, 1,
-0.1634832, -0.0472773, -2.466347, 0, 1, 0.5254902, 1,
-0.1608358, 2.114278, 0.264731, 0, 1, 0.5333334, 1,
-0.1563754, 0.5304754, -1.084275, 0, 1, 0.5372549, 1,
-0.1541714, -0.5879285, -2.081887, 0, 1, 0.5450981, 1,
-0.1536167, -0.5269784, -1.061211, 0, 1, 0.5490196, 1,
-0.1535862, -0.18731, -3.17664, 0, 1, 0.5568628, 1,
-0.1511734, 1.803811, 1.181609, 0, 1, 0.5607843, 1,
-0.1487038, -0.425805, -1.407367, 0, 1, 0.5686275, 1,
-0.1464193, -0.6269696, -3.455021, 0, 1, 0.572549, 1,
-0.1442111, -0.4186345, -1.925767, 0, 1, 0.5803922, 1,
-0.1426077, -0.1427903, -1.656059, 0, 1, 0.5843138, 1,
-0.1420171, -0.7275562, -3.496552, 0, 1, 0.5921569, 1,
-0.1402874, -0.3037262, -1.403495, 0, 1, 0.5960785, 1,
-0.1401235, 1.566711, 2.690394, 0, 1, 0.6039216, 1,
-0.1383279, -0.8873301, -1.162288, 0, 1, 0.6117647, 1,
-0.137158, 0.5988005, 0.4317262, 0, 1, 0.6156863, 1,
-0.1354011, -0.5898529, -3.577433, 0, 1, 0.6235294, 1,
-0.1317434, 0.2819955, 1.28415, 0, 1, 0.627451, 1,
-0.130574, 0.9575668, 0.6634499, 0, 1, 0.6352941, 1,
-0.1281426, 0.05421344, -0.4791588, 0, 1, 0.6392157, 1,
-0.1276193, 1.681746, 2.788217, 0, 1, 0.6470588, 1,
-0.125702, -1.759837, -4.389695, 0, 1, 0.6509804, 1,
-0.123698, 1.12487, -0.3980715, 0, 1, 0.6588235, 1,
-0.1156527, -1.829428, -3.267575, 0, 1, 0.6627451, 1,
-0.1131914, 0.3193914, -0.9353415, 0, 1, 0.6705883, 1,
-0.1131559, 1.501667, 0.8254539, 0, 1, 0.6745098, 1,
-0.1128196, -1.607241, -2.751635, 0, 1, 0.682353, 1,
-0.1105595, -0.1285129, -3.756096, 0, 1, 0.6862745, 1,
-0.1066818, 2.543464, 0.1507178, 0, 1, 0.6941177, 1,
-0.1042348, -0.07570047, 0.2537914, 0, 1, 0.7019608, 1,
-0.1034809, -1.141064, -5.705744, 0, 1, 0.7058824, 1,
-0.1003144, 0.8099634, 0.5182145, 0, 1, 0.7137255, 1,
-0.09977431, -0.7211121, -5.284434, 0, 1, 0.7176471, 1,
-0.09898215, -0.3587467, -4.108125, 0, 1, 0.7254902, 1,
-0.09549256, 1.463853, -1.410626, 0, 1, 0.7294118, 1,
-0.0903184, -0.4636366, -6.023782, 0, 1, 0.7372549, 1,
-0.08651058, -0.357864, -2.333431, 0, 1, 0.7411765, 1,
-0.08588622, -2.429007, -1.641608, 0, 1, 0.7490196, 1,
-0.08436573, -1.94419, -3.296936, 0, 1, 0.7529412, 1,
-0.07683588, -0.8247514, -2.824029, 0, 1, 0.7607843, 1,
-0.06904738, -0.1305639, -2.631428, 0, 1, 0.7647059, 1,
-0.06653029, 1.561401, 0.4069998, 0, 1, 0.772549, 1,
-0.0624245, -1.760153, -3.086815, 0, 1, 0.7764706, 1,
-0.06093288, -0.7613061, -2.502943, 0, 1, 0.7843137, 1,
-0.05320498, -0.8590895, -3.065909, 0, 1, 0.7882353, 1,
-0.05112014, -1.93023, -2.362273, 0, 1, 0.7960784, 1,
-0.04925807, 0.3430331, -0.4991263, 0, 1, 0.8039216, 1,
-0.04322748, 0.6938046, 1.55268, 0, 1, 0.8078431, 1,
-0.04276119, -1.565232, -2.447943, 0, 1, 0.8156863, 1,
-0.04231498, -1.372014, -3.916025, 0, 1, 0.8196079, 1,
-0.04038527, 1.145552, 1.030578, 0, 1, 0.827451, 1,
-0.03975288, -0.3912857, -3.19262, 0, 1, 0.8313726, 1,
-0.03896407, -0.4627085, -3.278271, 0, 1, 0.8392157, 1,
-0.03722699, -2.01682, -4.640805, 0, 1, 0.8431373, 1,
-0.0370513, 0.884474, 0.6514545, 0, 1, 0.8509804, 1,
-0.03681273, -1.809939, 0.2029022, 0, 1, 0.854902, 1,
-0.03030916, -1.122239, -3.653871, 0, 1, 0.8627451, 1,
-0.02566117, -1.183869, -3.335182, 0, 1, 0.8666667, 1,
-0.02529573, 0.3630648, 0.6250832, 0, 1, 0.8745098, 1,
-0.02518438, 0.2815299, 0.9614213, 0, 1, 0.8784314, 1,
-0.02325321, -0.2614516, -2.573164, 0, 1, 0.8862745, 1,
-0.01695185, -0.09224454, -2.811704, 0, 1, 0.8901961, 1,
-0.006684093, 0.2568263, 0.5726973, 0, 1, 0.8980392, 1,
-0.003122567, -1.988456, -1.038894, 0, 1, 0.9058824, 1,
-0.002544999, 1.145872, -0.5787157, 0, 1, 0.9098039, 1,
-0.001772103, -1.831505, -2.987428, 0, 1, 0.9176471, 1,
0.007022466, -1.99885, 3.385087, 0, 1, 0.9215686, 1,
0.01014695, 0.8245375, 1.203415, 0, 1, 0.9294118, 1,
0.01059048, -2.060677, 4.064466, 0, 1, 0.9333333, 1,
0.01837651, -0.0198071, 2.269664, 0, 1, 0.9411765, 1,
0.01856153, 0.1605928, 1.256745, 0, 1, 0.945098, 1,
0.02382127, -0.1285785, 2.964653, 0, 1, 0.9529412, 1,
0.02457012, -0.07680833, 3.001906, 0, 1, 0.9568627, 1,
0.02697705, -0.3198177, 3.115186, 0, 1, 0.9647059, 1,
0.02889621, -1.183987, 3.889771, 0, 1, 0.9686275, 1,
0.02994663, 0.2201809, -0.1132003, 0, 1, 0.9764706, 1,
0.031566, 0.815888, -0.6219398, 0, 1, 0.9803922, 1,
0.03400252, -1.152445, 3.49039, 0, 1, 0.9882353, 1,
0.03913979, 1.191859, -0.713966, 0, 1, 0.9921569, 1,
0.04412283, 1.400599, 0.8408815, 0, 1, 1, 1,
0.04549154, -0.3654004, 3.928294, 0, 0.9921569, 1, 1,
0.04766221, 0.6846591, -2.208686, 0, 0.9882353, 1, 1,
0.04956526, -1.538706, 3.988551, 0, 0.9803922, 1, 1,
0.05231196, -0.197058, 4.227619, 0, 0.9764706, 1, 1,
0.05261938, -0.9187196, 5.061326, 0, 0.9686275, 1, 1,
0.05466979, 0.652302, -1.653854, 0, 0.9647059, 1, 1,
0.05788292, 0.4959897, 0.7912826, 0, 0.9568627, 1, 1,
0.06150137, 0.5783582, 0.07716299, 0, 0.9529412, 1, 1,
0.06219838, -1.767592, 3.311394, 0, 0.945098, 1, 1,
0.06776695, -0.08420436, 1.648931, 0, 0.9411765, 1, 1,
0.07073364, -0.002170498, 0.3471766, 0, 0.9333333, 1, 1,
0.07167657, 0.459502, 1.684145, 0, 0.9294118, 1, 1,
0.07428065, -0.07379948, -0.09508373, 0, 0.9215686, 1, 1,
0.07498573, -2.558556, 0.7763347, 0, 0.9176471, 1, 1,
0.07584426, 0.9712306, -0.06621558, 0, 0.9098039, 1, 1,
0.07710438, 0.3891056, 1.108746, 0, 0.9058824, 1, 1,
0.07776082, -1.07167, 3.203722, 0, 0.8980392, 1, 1,
0.07858849, 0.7547308, -0.1902732, 0, 0.8901961, 1, 1,
0.07980759, -0.5385441, 5.129852, 0, 0.8862745, 1, 1,
0.08387704, 0.1840698, 0.6567546, 0, 0.8784314, 1, 1,
0.08670758, -0.3255553, 2.630893, 0, 0.8745098, 1, 1,
0.08796354, 0.7145474, 0.7902899, 0, 0.8666667, 1, 1,
0.0903898, -1.840162, 2.461321, 0, 0.8627451, 1, 1,
0.09076197, 1.172041, 0.5053911, 0, 0.854902, 1, 1,
0.09336266, 0.4086218, 1.222837, 0, 0.8509804, 1, 1,
0.09739487, 0.5553226, 0.2979405, 0, 0.8431373, 1, 1,
0.1006471, 0.2189953, 0.9028859, 0, 0.8392157, 1, 1,
0.1018739, -0.7751224, 3.12742, 0, 0.8313726, 1, 1,
0.1026714, 0.05024542, 3.278353, 0, 0.827451, 1, 1,
0.1046094, 0.9758933, 2.110716, 0, 0.8196079, 1, 1,
0.1050062, -0.1711178, 2.382324, 0, 0.8156863, 1, 1,
0.1074544, 0.2025051, 0.08204776, 0, 0.8078431, 1, 1,
0.1095929, -0.6799046, 4.32668, 0, 0.8039216, 1, 1,
0.1151549, 0.9016427, 1.294719, 0, 0.7960784, 1, 1,
0.1156677, 0.07300311, 1.35734, 0, 0.7882353, 1, 1,
0.1157269, -0.4023065, 4.578621, 0, 0.7843137, 1, 1,
0.1192606, -0.2841544, 3.075402, 0, 0.7764706, 1, 1,
0.1211321, -0.1857299, 3.440213, 0, 0.772549, 1, 1,
0.1215814, -0.8980727, 3.290635, 0, 0.7647059, 1, 1,
0.1240308, 0.4754935, 0.1069938, 0, 0.7607843, 1, 1,
0.1247432, 0.7769011, 1.733117, 0, 0.7529412, 1, 1,
0.1263974, 0.1704943, 0.9337478, 0, 0.7490196, 1, 1,
0.1315344, 0.1543266, 1.43538, 0, 0.7411765, 1, 1,
0.136069, 0.6416692, -1.413003, 0, 0.7372549, 1, 1,
0.1386037, -1.681625, 2.13058, 0, 0.7294118, 1, 1,
0.1388466, 1.374712, 0.4761044, 0, 0.7254902, 1, 1,
0.1393074, -0.6738871, 1.805523, 0, 0.7176471, 1, 1,
0.1407809, 0.3751277, 1.484645, 0, 0.7137255, 1, 1,
0.1553827, -2.116724, 3.219198, 0, 0.7058824, 1, 1,
0.1564269, 1.462876, 3.240821, 0, 0.6980392, 1, 1,
0.1571775, 2.242512, 1.198673, 0, 0.6941177, 1, 1,
0.1574122, 0.7574249, -0.1877659, 0, 0.6862745, 1, 1,
0.1581592, 0.6469853, 0.5970247, 0, 0.682353, 1, 1,
0.163763, 0.8795141, -0.4738925, 0, 0.6745098, 1, 1,
0.1713533, -0.3722729, 1.951188, 0, 0.6705883, 1, 1,
0.17709, -0.1755145, 2.18567, 0, 0.6627451, 1, 1,
0.1775271, 1.271152, -2.240897, 0, 0.6588235, 1, 1,
0.1782846, -0.08966213, 0.8971363, 0, 0.6509804, 1, 1,
0.1790799, -0.2756641, 1.46258, 0, 0.6470588, 1, 1,
0.1813817, 1.271599, 0.504086, 0, 0.6392157, 1, 1,
0.1837286, 2.550882, -0.4055598, 0, 0.6352941, 1, 1,
0.1841002, -2.28288, 3.32778, 0, 0.627451, 1, 1,
0.1847569, -0.02204627, 0.2099097, 0, 0.6235294, 1, 1,
0.1847913, -1.675132, 3.363019, 0, 0.6156863, 1, 1,
0.185789, -0.2617559, 2.155277, 0, 0.6117647, 1, 1,
0.185901, -0.4709475, 3.002362, 0, 0.6039216, 1, 1,
0.1902013, 0.3486484, 1.192989, 0, 0.5960785, 1, 1,
0.190476, -0.5686497, 3.12363, 0, 0.5921569, 1, 1,
0.1930252, -0.6054226, 2.997406, 0, 0.5843138, 1, 1,
0.1999085, -1.790342, 1.924881, 0, 0.5803922, 1, 1,
0.2044057, -1.05473, 3.775903, 0, 0.572549, 1, 1,
0.2048924, 0.3128217, -0.6842138, 0, 0.5686275, 1, 1,
0.2051226, -0.6851782, 5.355953, 0, 0.5607843, 1, 1,
0.2056905, 1.314352, 1.362867, 0, 0.5568628, 1, 1,
0.2089634, -0.2557432, 2.410375, 0, 0.5490196, 1, 1,
0.2212617, -1.346318, 3.6001, 0, 0.5450981, 1, 1,
0.2241905, 0.8613304, 1.004112, 0, 0.5372549, 1, 1,
0.2338341, 0.19222, 2.813112, 0, 0.5333334, 1, 1,
0.2348295, -2.127182, 2.551763, 0, 0.5254902, 1, 1,
0.2369888, 0.2520008, 0.7891362, 0, 0.5215687, 1, 1,
0.2420818, 1.298687, 2.133441, 0, 0.5137255, 1, 1,
0.2468679, -0.8333223, 1.7399, 0, 0.509804, 1, 1,
0.2475558, 0.9634808, -0.2482061, 0, 0.5019608, 1, 1,
0.2511028, -0.1469358, 3.384643, 0, 0.4941176, 1, 1,
0.2527962, -0.7486718, 3.334809, 0, 0.4901961, 1, 1,
0.2552028, 0.6720699, -1.272557, 0, 0.4823529, 1, 1,
0.2564608, 1.318279, 1.337031, 0, 0.4784314, 1, 1,
0.2602695, 0.2914396, 1.390608, 0, 0.4705882, 1, 1,
0.261142, 0.6194944, 0.5134166, 0, 0.4666667, 1, 1,
0.2667434, 2.055495, 2.020981, 0, 0.4588235, 1, 1,
0.2674733, 0.2183584, 1.492968, 0, 0.454902, 1, 1,
0.2682047, -0.5129116, 2.076089, 0, 0.4470588, 1, 1,
0.2704403, 1.175714, 0.01374308, 0, 0.4431373, 1, 1,
0.2758221, 0.6647518, 0.941922, 0, 0.4352941, 1, 1,
0.2759809, 1.076392, -0.08032195, 0, 0.4313726, 1, 1,
0.2795754, -0.5667317, 2.637901, 0, 0.4235294, 1, 1,
0.2841119, -0.8010652, 3.494014, 0, 0.4196078, 1, 1,
0.2877191, -0.9749264, 3.203702, 0, 0.4117647, 1, 1,
0.2891902, -1.117667, 2.026718, 0, 0.4078431, 1, 1,
0.2976099, 2.003716, 0.5170553, 0, 0.4, 1, 1,
0.2977522, -0.3078046, 2.296423, 0, 0.3921569, 1, 1,
0.3005823, -1.14586, 3.178033, 0, 0.3882353, 1, 1,
0.3026304, -1.951482, 3.440862, 0, 0.3803922, 1, 1,
0.3056389, -1.059252, 3.531436, 0, 0.3764706, 1, 1,
0.3059373, 0.9636959, -0.1252345, 0, 0.3686275, 1, 1,
0.3059855, -0.2560712, 2.273956, 0, 0.3647059, 1, 1,
0.3079151, -0.5083062, 2.212402, 0, 0.3568628, 1, 1,
0.3195777, -0.3381307, 1.649313, 0, 0.3529412, 1, 1,
0.3244622, -1.859909, 1.075477, 0, 0.345098, 1, 1,
0.3271414, 0.8868101, -0.5762202, 0, 0.3411765, 1, 1,
0.3322076, 0.4439654, 1.575261, 0, 0.3333333, 1, 1,
0.3348578, 1.502193, 0.5390204, 0, 0.3294118, 1, 1,
0.3356985, -0.9020691, 1.750874, 0, 0.3215686, 1, 1,
0.3373623, -1.440062, 2.063847, 0, 0.3176471, 1, 1,
0.3374801, -0.6291593, 3.093595, 0, 0.3098039, 1, 1,
0.3419651, -1.022143, 2.49028, 0, 0.3058824, 1, 1,
0.3424223, -0.6189864, 1.148226, 0, 0.2980392, 1, 1,
0.3424665, 1.121767, -0.7459419, 0, 0.2901961, 1, 1,
0.3435993, 0.5428169, 1.094248, 0, 0.2862745, 1, 1,
0.3452529, 1.062295, 1.962431, 0, 0.2784314, 1, 1,
0.3470974, 1.887188, 0.1947522, 0, 0.2745098, 1, 1,
0.3474515, -0.6657787, 3.818688, 0, 0.2666667, 1, 1,
0.359686, -0.3939265, 1.721999, 0, 0.2627451, 1, 1,
0.3614331, -0.9377463, 3.20225, 0, 0.254902, 1, 1,
0.3665573, 1.101483, 0.9045398, 0, 0.2509804, 1, 1,
0.3727513, 0.5563035, 1.916996, 0, 0.2431373, 1, 1,
0.3755907, -0.07823276, 0.5063629, 0, 0.2392157, 1, 1,
0.3759482, 0.8778496, 0.3228451, 0, 0.2313726, 1, 1,
0.3780885, 0.2792061, 2.351919, 0, 0.227451, 1, 1,
0.3837137, -0.7490855, 3.281566, 0, 0.2196078, 1, 1,
0.3845924, 0.005373882, 2.380659, 0, 0.2156863, 1, 1,
0.3875747, -0.09836838, 2.219645, 0, 0.2078431, 1, 1,
0.3934381, 0.09347548, -0.0276045, 0, 0.2039216, 1, 1,
0.3964631, -1.257954, 3.779195, 0, 0.1960784, 1, 1,
0.3967721, 0.7109943, 0.2504087, 0, 0.1882353, 1, 1,
0.3987504, -0.1259222, 2.018588, 0, 0.1843137, 1, 1,
0.4000551, 0.3455032, -0.06413697, 0, 0.1764706, 1, 1,
0.4026039, -0.8730542, 3.209799, 0, 0.172549, 1, 1,
0.40659, -1.619061, 1.535483, 0, 0.1647059, 1, 1,
0.4077948, -1.214553, 3.130758, 0, 0.1607843, 1, 1,
0.4113031, -0.5118108, 2.717225, 0, 0.1529412, 1, 1,
0.4113365, -2.196015, 2.041256, 0, 0.1490196, 1, 1,
0.4127162, -1.06043, 1.485161, 0, 0.1411765, 1, 1,
0.4143277, -0.2554794, 3.863648, 0, 0.1372549, 1, 1,
0.4154131, -0.3539074, 0.6608846, 0, 0.1294118, 1, 1,
0.4205054, -0.550848, 2.285652, 0, 0.1254902, 1, 1,
0.4222772, -2.158044, 1.989414, 0, 0.1176471, 1, 1,
0.4226049, -0.2483025, 1.529065, 0, 0.1137255, 1, 1,
0.4233847, -0.1510355, 1.248377, 0, 0.1058824, 1, 1,
0.4237027, -1.158684, 3.98003, 0, 0.09803922, 1, 1,
0.4257751, 1.340165, 0.2924688, 0, 0.09411765, 1, 1,
0.4276557, -0.3335813, 2.398411, 0, 0.08627451, 1, 1,
0.4298617, 0.482794, 0.5481912, 0, 0.08235294, 1, 1,
0.4345203, -0.7889302, 1.873649, 0, 0.07450981, 1, 1,
0.4360223, 1.849369, -0.6919544, 0, 0.07058824, 1, 1,
0.4410313, 0.08008102, 1.503673, 0, 0.0627451, 1, 1,
0.4411876, 0.7784493, 1.329016, 0, 0.05882353, 1, 1,
0.4433244, 2.287834, -0.2540903, 0, 0.05098039, 1, 1,
0.4441448, -0.8859257, 3.762264, 0, 0.04705882, 1, 1,
0.4462828, 0.4418623, 2.646321, 0, 0.03921569, 1, 1,
0.4501154, -1.815128, 3.151971, 0, 0.03529412, 1, 1,
0.4540415, -0.8095568, 1.959133, 0, 0.02745098, 1, 1,
0.4563757, 0.8638966, 0.8086292, 0, 0.02352941, 1, 1,
0.4611467, 1.582091, 0.5431869, 0, 0.01568628, 1, 1,
0.4625039, -0.4816179, 1.472574, 0, 0.01176471, 1, 1,
0.463234, -1.54125, 2.955331, 0, 0.003921569, 1, 1,
0.4643521, -0.5390649, 2.882253, 0.003921569, 0, 1, 1,
0.4644924, -0.1521448, 0.5908754, 0.007843138, 0, 1, 1,
0.4655284, -0.318335, 2.024478, 0.01568628, 0, 1, 1,
0.4672155, 1.024678, 0.7782199, 0.01960784, 0, 1, 1,
0.4681042, 0.5321596, 0.2703606, 0.02745098, 0, 1, 1,
0.4686598, -0.4437949, 4.221174, 0.03137255, 0, 1, 1,
0.4702405, 0.5512532, 0.4127523, 0.03921569, 0, 1, 1,
0.471258, -1.126593, 3.104579, 0.04313726, 0, 1, 1,
0.4793914, 0.5184025, 1.238428, 0.05098039, 0, 1, 1,
0.4831161, -2.132235, 0.2507002, 0.05490196, 0, 1, 1,
0.4835317, -1.784617, 1.280078, 0.0627451, 0, 1, 1,
0.4888984, -1.113383, 4.030608, 0.06666667, 0, 1, 1,
0.4950507, -0.2401314, 3.217368, 0.07450981, 0, 1, 1,
0.5000798, -1.617418, 4.449481, 0.07843138, 0, 1, 1,
0.5022417, 0.474793, 1.269239, 0.08627451, 0, 1, 1,
0.5070815, -0.004533865, 0.6651564, 0.09019608, 0, 1, 1,
0.5078628, -0.5568022, 2.037253, 0.09803922, 0, 1, 1,
0.5088311, 0.7416356, 0.2887925, 0.1058824, 0, 1, 1,
0.5139505, -0.4141306, 2.131356, 0.1098039, 0, 1, 1,
0.5154085, 0.3645627, 0.980388, 0.1176471, 0, 1, 1,
0.5180929, -1.684522, 2.374051, 0.1215686, 0, 1, 1,
0.5223804, -1.576195, 2.45936, 0.1294118, 0, 1, 1,
0.5231488, -0.8401242, 1.828123, 0.1333333, 0, 1, 1,
0.5236529, 0.5616977, 1.980319, 0.1411765, 0, 1, 1,
0.5315859, -0.742642, 2.595237, 0.145098, 0, 1, 1,
0.534716, -0.3794009, 3.734139, 0.1529412, 0, 1, 1,
0.5347483, 1.566103, -0.6982926, 0.1568628, 0, 1, 1,
0.5355074, 1.172601, 0.9590481, 0.1647059, 0, 1, 1,
0.540988, -1.603132, 3.46546, 0.1686275, 0, 1, 1,
0.5414112, 0.1788362, 1.086782, 0.1764706, 0, 1, 1,
0.5436039, 0.04262203, 2.602844, 0.1803922, 0, 1, 1,
0.5519623, 0.6764224, -0.6898358, 0.1882353, 0, 1, 1,
0.5539733, 0.1764977, 3.178611, 0.1921569, 0, 1, 1,
0.5604354, 0.7711849, 3.010693, 0.2, 0, 1, 1,
0.5626515, 0.3839063, 1.53263, 0.2078431, 0, 1, 1,
0.5643446, -1.927164, 2.934983, 0.2117647, 0, 1, 1,
0.576764, -0.9186192, 4.244835, 0.2196078, 0, 1, 1,
0.5772207, 1.210074, 0.4079563, 0.2235294, 0, 1, 1,
0.5796873, 0.5835219, 1.639019, 0.2313726, 0, 1, 1,
0.591283, 0.4048826, -0.08385791, 0.2352941, 0, 1, 1,
0.5961928, -0.6936255, 4.218742, 0.2431373, 0, 1, 1,
0.6000033, 1.359392, -0.1287933, 0.2470588, 0, 1, 1,
0.6114135, 0.7323343, -0.3953367, 0.254902, 0, 1, 1,
0.6155407, -0.1424108, 1.539711, 0.2588235, 0, 1, 1,
0.6219054, -0.05080781, 2.144234, 0.2666667, 0, 1, 1,
0.6236774, 0.3842907, 1.232188, 0.2705882, 0, 1, 1,
0.6246886, -0.1496164, 1.683775, 0.2784314, 0, 1, 1,
0.6250294, 0.151064, 1.47754, 0.282353, 0, 1, 1,
0.6298804, 0.7884061, -1.127718, 0.2901961, 0, 1, 1,
0.6315295, 1.574233, 0.2729381, 0.2941177, 0, 1, 1,
0.6338086, -0.5406626, 1.378488, 0.3019608, 0, 1, 1,
0.6338699, 0.3666792, 0.7389089, 0.3098039, 0, 1, 1,
0.6344908, -1.044754, 2.200595, 0.3137255, 0, 1, 1,
0.6468108, 0.6381238, 1.318159, 0.3215686, 0, 1, 1,
0.6558886, 0.1259426, 0.8537306, 0.3254902, 0, 1, 1,
0.6562252, -2.205488, 2.635993, 0.3333333, 0, 1, 1,
0.6570579, -2.05918, 2.566303, 0.3372549, 0, 1, 1,
0.6617767, 0.3209109, 0.3732564, 0.345098, 0, 1, 1,
0.6621433, -1.560138, 3.557332, 0.3490196, 0, 1, 1,
0.6643429, 0.04948844, 0.8329315, 0.3568628, 0, 1, 1,
0.6643934, 0.2417512, 0.8669631, 0.3607843, 0, 1, 1,
0.6673568, -0.3570725, 3.422577, 0.3686275, 0, 1, 1,
0.6685455, -0.5771403, 2.65694, 0.372549, 0, 1, 1,
0.6702681, -1.201865, 1.187644, 0.3803922, 0, 1, 1,
0.6714612, 0.1511702, 1.809819, 0.3843137, 0, 1, 1,
0.6736628, -0.3023035, 3.127676, 0.3921569, 0, 1, 1,
0.678901, 0.1665824, -1.004583, 0.3960784, 0, 1, 1,
0.6803001, 1.074595, -0.163581, 0.4039216, 0, 1, 1,
0.6804453, 0.1122703, 0.8234931, 0.4117647, 0, 1, 1,
0.6819713, 0.1915092, 1.961929, 0.4156863, 0, 1, 1,
0.6826853, -0.2270049, 1.311536, 0.4235294, 0, 1, 1,
0.6837742, 0.6524464, -0.4082946, 0.427451, 0, 1, 1,
0.687678, 1.173761, -1.126905, 0.4352941, 0, 1, 1,
0.6934345, 0.7974809, -0.3786919, 0.4392157, 0, 1, 1,
0.6937449, -1.029456, 1.724907, 0.4470588, 0, 1, 1,
0.7049257, 0.3821986, 0.3366004, 0.4509804, 0, 1, 1,
0.7060099, 1.246985, 1.192905, 0.4588235, 0, 1, 1,
0.7122404, -0.8869311, 3.866779, 0.4627451, 0, 1, 1,
0.7137633, -0.1337652, 2.626063, 0.4705882, 0, 1, 1,
0.7207076, 0.8008373, 0.2449253, 0.4745098, 0, 1, 1,
0.7224759, 0.7769133, 1.121947, 0.4823529, 0, 1, 1,
0.7238562, 0.7040219, -0.7294674, 0.4862745, 0, 1, 1,
0.7243488, -0.98387, 3.461492, 0.4941176, 0, 1, 1,
0.7312394, 0.03618741, 1.949442, 0.5019608, 0, 1, 1,
0.7423217, -1.938155, 0.9345734, 0.5058824, 0, 1, 1,
0.7449316, 1.858437, -0.003975037, 0.5137255, 0, 1, 1,
0.7504475, 0.5027267, 0.794215, 0.5176471, 0, 1, 1,
0.7508382, -0.652655, 1.492345, 0.5254902, 0, 1, 1,
0.755519, -1.190968, 3.176759, 0.5294118, 0, 1, 1,
0.7571463, -0.4552783, 1.573969, 0.5372549, 0, 1, 1,
0.7581162, 0.1758116, 0.6899647, 0.5411765, 0, 1, 1,
0.7592577, 1.24791, 0.3654795, 0.5490196, 0, 1, 1,
0.7688708, -1.738328, 2.598755, 0.5529412, 0, 1, 1,
0.7743762, 0.8391379, 1.028265, 0.5607843, 0, 1, 1,
0.7788199, 0.9748755, 0.2340664, 0.5647059, 0, 1, 1,
0.7812414, 1.038712, -0.03510222, 0.572549, 0, 1, 1,
0.7823446, -0.3905675, 3.424004, 0.5764706, 0, 1, 1,
0.7830901, 0.8401845, 1.599101, 0.5843138, 0, 1, 1,
0.7890413, -0.4162227, 1.495525, 0.5882353, 0, 1, 1,
0.7938051, -1.26549, 2.75652, 0.5960785, 0, 1, 1,
0.7976957, 0.9963903, 0.09674889, 0.6039216, 0, 1, 1,
0.8031486, 0.2444959, 0.7998932, 0.6078432, 0, 1, 1,
0.8061136, -0.7997052, 3.338941, 0.6156863, 0, 1, 1,
0.8099964, 1.962665, 0.5532896, 0.6196079, 0, 1, 1,
0.8123994, 0.4096199, -0.5806828, 0.627451, 0, 1, 1,
0.8195474, -0.3723449, 1.42851, 0.6313726, 0, 1, 1,
0.8210645, -1.037974, 3.522575, 0.6392157, 0, 1, 1,
0.8247223, -0.7753996, 2.385372, 0.6431373, 0, 1, 1,
0.8253283, 0.4081424, 0.6783347, 0.6509804, 0, 1, 1,
0.8314435, -1.654517, 2.571465, 0.654902, 0, 1, 1,
0.8413907, 0.6012991, -0.5865849, 0.6627451, 0, 1, 1,
0.8484519, 1.477282, 0.7609943, 0.6666667, 0, 1, 1,
0.8527192, 0.1322872, 2.289901, 0.6745098, 0, 1, 1,
0.8561818, -0.1466097, 0.60017, 0.6784314, 0, 1, 1,
0.8570883, 1.678509, 0.3762496, 0.6862745, 0, 1, 1,
0.8715049, -0.6499811, 2.700418, 0.6901961, 0, 1, 1,
0.878249, -0.5763434, 1.260786, 0.6980392, 0, 1, 1,
0.8790883, -1.468827, 2.505012, 0.7058824, 0, 1, 1,
0.8791521, 2.26198, 0.459751, 0.7098039, 0, 1, 1,
0.8802043, -1.587248, 2.827488, 0.7176471, 0, 1, 1,
0.8811627, 1.804351, 0.8261545, 0.7215686, 0, 1, 1,
0.8864264, -0.3460413, 2.837516, 0.7294118, 0, 1, 1,
0.8887253, -1.408569, 3.368828, 0.7333333, 0, 1, 1,
0.895255, -0.5070487, 2.839096, 0.7411765, 0, 1, 1,
0.8959225, -1.285687, 2.282711, 0.7450981, 0, 1, 1,
0.8992246, -0.123662, 1.06391, 0.7529412, 0, 1, 1,
0.9034126, -0.2711652, 3.179041, 0.7568628, 0, 1, 1,
0.9042742, -0.5534876, 2.929275, 0.7647059, 0, 1, 1,
0.9072844, -0.4063458, 2.655722, 0.7686275, 0, 1, 1,
0.9084328, 0.8456236, 0.8311817, 0.7764706, 0, 1, 1,
0.909861, -2.364493, 2.697219, 0.7803922, 0, 1, 1,
0.920065, -0.001038843, 1.865536, 0.7882353, 0, 1, 1,
0.9206246, 0.4276817, -0.2571585, 0.7921569, 0, 1, 1,
0.9226307, -0.6481874, 2.341585, 0.8, 0, 1, 1,
0.9249362, -0.6024498, 1.838894, 0.8078431, 0, 1, 1,
0.9277796, 0.4008234, 0.5671819, 0.8117647, 0, 1, 1,
0.9369768, 0.945701, 1.125875, 0.8196079, 0, 1, 1,
0.9396023, 0.3952799, 1.912772, 0.8235294, 0, 1, 1,
0.940432, -0.03925273, 2.366631, 0.8313726, 0, 1, 1,
0.9438804, 0.6633837, 0.2740652, 0.8352941, 0, 1, 1,
0.9503866, 0.459188, 1.364928, 0.8431373, 0, 1, 1,
0.9509867, -0.7223911, 2.347821, 0.8470588, 0, 1, 1,
0.9608487, 1.264573, 1.419958, 0.854902, 0, 1, 1,
0.9628009, -0.4209878, 2.28225, 0.8588235, 0, 1, 1,
0.9695775, -0.04830097, 1.55651, 0.8666667, 0, 1, 1,
0.9706427, 1.269557, -1.486638, 0.8705882, 0, 1, 1,
0.9736923, 1.500373, 0.3466502, 0.8784314, 0, 1, 1,
0.974744, -0.6282635, 1.984986, 0.8823529, 0, 1, 1,
0.9823726, 0.956197, 1.694302, 0.8901961, 0, 1, 1,
0.984678, -0.1660344, 1.483613, 0.8941177, 0, 1, 1,
0.987638, -0.9855378, 1.708747, 0.9019608, 0, 1, 1,
0.9892094, 1.362733, 1.382845, 0.9098039, 0, 1, 1,
0.990478, 1.329486, -0.08307731, 0.9137255, 0, 1, 1,
0.9934026, -0.7727971, 1.751155, 0.9215686, 0, 1, 1,
0.9956089, -0.03056229, 1.404194, 0.9254902, 0, 1, 1,
1.001435, 1.361308, 0.02616619, 0.9333333, 0, 1, 1,
1.018989, -0.0152542, 2.039772, 0.9372549, 0, 1, 1,
1.019519, -2.717228, 1.810324, 0.945098, 0, 1, 1,
1.026372, -0.5036327, 1.830061, 0.9490196, 0, 1, 1,
1.026861, 0.2076655, -0.7396725, 0.9568627, 0, 1, 1,
1.028661, -2.234918, 2.943204, 0.9607843, 0, 1, 1,
1.043608, 0.6482926, 0.8371647, 0.9686275, 0, 1, 1,
1.060745, 0.2695646, 1.789499, 0.972549, 0, 1, 1,
1.062497, 0.4822524, 0.4684382, 0.9803922, 0, 1, 1,
1.06896, 0.1993112, -0.3211797, 0.9843137, 0, 1, 1,
1.069584, -0.008667388, 1.720584, 0.9921569, 0, 1, 1,
1.074643, 1.417366, 0.8677596, 0.9960784, 0, 1, 1,
1.074945, 1.448912, 0.8356254, 1, 0, 0.9960784, 1,
1.090064, 0.02586947, 0.4857149, 1, 0, 0.9882353, 1,
1.096207, 1.382949, 1.100175, 1, 0, 0.9843137, 1,
1.100269, 0.7072401, 1.93317, 1, 0, 0.9764706, 1,
1.109398, -0.6365104, -0.673183, 1, 0, 0.972549, 1,
1.110015, 0.8591381, 1.341727, 1, 0, 0.9647059, 1,
1.110247, 0.627561, -0.1054917, 1, 0, 0.9607843, 1,
1.115615, -0.3700271, 0.5536965, 1, 0, 0.9529412, 1,
1.117159, -1.213002, 3.355892, 1, 0, 0.9490196, 1,
1.120154, -0.3675177, 2.150655, 1, 0, 0.9411765, 1,
1.125876, -0.968266, 1.584604, 1, 0, 0.9372549, 1,
1.128315, 0.4030324, 1.893871, 1, 0, 0.9294118, 1,
1.128564, 0.1054594, 1.690787, 1, 0, 0.9254902, 1,
1.133927, -0.3652605, 2.352371, 1, 0, 0.9176471, 1,
1.137059, 0.917551, 0.669367, 1, 0, 0.9137255, 1,
1.141351, -0.3772837, 1.162277, 1, 0, 0.9058824, 1,
1.142204, -0.2706738, 3.651325, 1, 0, 0.9019608, 1,
1.159734, 1.173012, 1.645842, 1, 0, 0.8941177, 1,
1.16704, 0.2814091, 1.358296, 1, 0, 0.8862745, 1,
1.167139, 1.004228, 1.297218, 1, 0, 0.8823529, 1,
1.16773, -0.5215167, 0.722669, 1, 0, 0.8745098, 1,
1.168838, 0.007248748, 0.5871882, 1, 0, 0.8705882, 1,
1.170336, 1.406602, 1.075757, 1, 0, 0.8627451, 1,
1.171832, 0.8000993, 1.168088, 1, 0, 0.8588235, 1,
1.174224, -1.527324, 2.995124, 1, 0, 0.8509804, 1,
1.174385, -0.270353, 2.676598, 1, 0, 0.8470588, 1,
1.174546, 0.9111087, -0.4646282, 1, 0, 0.8392157, 1,
1.177372, -2.728915, 2.009181, 1, 0, 0.8352941, 1,
1.180753, -0.5073071, 3.790302, 1, 0, 0.827451, 1,
1.183175, 0.5066471, 1.566641, 1, 0, 0.8235294, 1,
1.187704, 1.500306, 1.101795, 1, 0, 0.8156863, 1,
1.205546, 0.3347695, 2.20746, 1, 0, 0.8117647, 1,
1.214622, -0.563843, 3.031438, 1, 0, 0.8039216, 1,
1.21623, 0.3941249, 0.3849564, 1, 0, 0.7960784, 1,
1.222009, 0.7001597, -0.01287974, 1, 0, 0.7921569, 1,
1.222564, 0.0008369609, 2.412012, 1, 0, 0.7843137, 1,
1.230724, 0.7404622, 2.847981, 1, 0, 0.7803922, 1,
1.233509, 1.365377, -1.553086, 1, 0, 0.772549, 1,
1.239568, 1.859658, 1.132642, 1, 0, 0.7686275, 1,
1.241952, 0.1159448, 3.331307, 1, 0, 0.7607843, 1,
1.254126, -1.886278, 2.355222, 1, 0, 0.7568628, 1,
1.275617, 1.134873, 1.313909, 1, 0, 0.7490196, 1,
1.28009, -0.08045137, 2.329116, 1, 0, 0.7450981, 1,
1.29474, -0.725306, 1.779073, 1, 0, 0.7372549, 1,
1.297356, 1.987087, 1.064424, 1, 0, 0.7333333, 1,
1.300907, 1.297495, -0.5537696, 1, 0, 0.7254902, 1,
1.305319, -0.009140037, 3.003865, 1, 0, 0.7215686, 1,
1.308679, 0.5884445, 1.97997, 1, 0, 0.7137255, 1,
1.311186, 0.2432399, 2.134533, 1, 0, 0.7098039, 1,
1.316422, 0.724463, 2.27438, 1, 0, 0.7019608, 1,
1.325916, 0.04345242, 1.787436, 1, 0, 0.6941177, 1,
1.327311, -0.09868973, 2.028452, 1, 0, 0.6901961, 1,
1.330079, -2.397543, 3.34725, 1, 0, 0.682353, 1,
1.334743, 0.9723622, -0.04432692, 1, 0, 0.6784314, 1,
1.339835, 0.8177228, 3.024735, 1, 0, 0.6705883, 1,
1.341124, 0.5011041, 1.396465, 1, 0, 0.6666667, 1,
1.342535, 0.8796039, -0.7692879, 1, 0, 0.6588235, 1,
1.355595, -1.457798, 1.030301, 1, 0, 0.654902, 1,
1.35626, 0.07188102, 1.494871, 1, 0, 0.6470588, 1,
1.358661, 0.7822372, 0.1063334, 1, 0, 0.6431373, 1,
1.360945, -1.068014, 3.462926, 1, 0, 0.6352941, 1,
1.361508, 1.027005, 0.3589392, 1, 0, 0.6313726, 1,
1.36175, 0.9048986, 0.5709289, 1, 0, 0.6235294, 1,
1.366059, -1.733385, 1.498487, 1, 0, 0.6196079, 1,
1.369107, -1.980307, 3.303471, 1, 0, 0.6117647, 1,
1.372233, -0.3368529, 1.311658, 1, 0, 0.6078432, 1,
1.379493, -0.827403, 1.920421, 1, 0, 0.6, 1,
1.381075, 0.5332144, 1.066267, 1, 0, 0.5921569, 1,
1.381907, -0.6554386, 2.657129, 1, 0, 0.5882353, 1,
1.395658, -0.5000221, 2.144161, 1, 0, 0.5803922, 1,
1.397905, -1.175748, 2.019756, 1, 0, 0.5764706, 1,
1.415604, -0.1912886, 0.892289, 1, 0, 0.5686275, 1,
1.425057, 0.9461919, -0.05535157, 1, 0, 0.5647059, 1,
1.425596, 1.246186, 2.583732, 1, 0, 0.5568628, 1,
1.426179, -1.959872, 1.713177, 1, 0, 0.5529412, 1,
1.426302, 0.9138633, -0.4613186, 1, 0, 0.5450981, 1,
1.435444, -0.7954427, 3.673594, 1, 0, 0.5411765, 1,
1.439888, 0.1426013, 0.4986118, 1, 0, 0.5333334, 1,
1.444228, 0.2272487, 0.9844402, 1, 0, 0.5294118, 1,
1.446445, 1.536086, -1.394685, 1, 0, 0.5215687, 1,
1.447717, 0.2604797, 1.090437, 1, 0, 0.5176471, 1,
1.454359, -0.8049327, 2.718027, 1, 0, 0.509804, 1,
1.455454, 0.3414855, 0.003828056, 1, 0, 0.5058824, 1,
1.463247, 0.1479421, 1.583454, 1, 0, 0.4980392, 1,
1.464927, -0.8414416, 3.029534, 1, 0, 0.4901961, 1,
1.477009, 1.157035, 0.5378298, 1, 0, 0.4862745, 1,
1.482056, -1.058498, 3.186946, 1, 0, 0.4784314, 1,
1.483491, -1.315316, 0.2005512, 1, 0, 0.4745098, 1,
1.490945, -1.322248, 1.19339, 1, 0, 0.4666667, 1,
1.497705, -0.767302, 0.3975697, 1, 0, 0.4627451, 1,
1.499852, 0.6294495, 0.1627337, 1, 0, 0.454902, 1,
1.51237, -1.911126, 3.579186, 1, 0, 0.4509804, 1,
1.51369, -0.9020824, 2.054881, 1, 0, 0.4431373, 1,
1.520515, -0.3385047, 1.322508, 1, 0, 0.4392157, 1,
1.522149, 0.3106796, 0.771473, 1, 0, 0.4313726, 1,
1.530475, 0.4831339, 0.8372599, 1, 0, 0.427451, 1,
1.534774, 0.3830672, 3.341615, 1, 0, 0.4196078, 1,
1.55016, -0.1222211, 2.554767, 1, 0, 0.4156863, 1,
1.562378, -0.6295548, 2.054639, 1, 0, 0.4078431, 1,
1.568012, -0.7122176, 2.801161, 1, 0, 0.4039216, 1,
1.570062, 0.7061342, -0.8444713, 1, 0, 0.3960784, 1,
1.57216, -0.03758815, 1.353093, 1, 0, 0.3882353, 1,
1.573751, -0.3356259, 1.610964, 1, 0, 0.3843137, 1,
1.574983, -0.2809242, 1.063151, 1, 0, 0.3764706, 1,
1.585802, -0.1797931, 1.87899, 1, 0, 0.372549, 1,
1.589774, -0.2341324, 2.143911, 1, 0, 0.3647059, 1,
1.590142, -1.018646, -0.1235426, 1, 0, 0.3607843, 1,
1.59312, -0.3243614, 1.619844, 1, 0, 0.3529412, 1,
1.594338, -0.1336608, 1.183127, 1, 0, 0.3490196, 1,
1.610462, 0.7866873, 2.795511, 1, 0, 0.3411765, 1,
1.642016, 0.0715827, 1.168488, 1, 0, 0.3372549, 1,
1.650863, 1.409918, 1.818183, 1, 0, 0.3294118, 1,
1.674517, -0.1602228, 2.352626, 1, 0, 0.3254902, 1,
1.676445, -0.9536472, 1.105304, 1, 0, 0.3176471, 1,
1.681357, 0.4499782, 2.62958, 1, 0, 0.3137255, 1,
1.683177, -0.8204942, 2.462653, 1, 0, 0.3058824, 1,
1.692776, -0.6262229, 1.58283, 1, 0, 0.2980392, 1,
1.707703, -0.1953851, 0.2361611, 1, 0, 0.2941177, 1,
1.720004, 1.580087, 1.248851, 1, 0, 0.2862745, 1,
1.724819, -1.540159, 2.027794, 1, 0, 0.282353, 1,
1.736073, -1.067006, 2.731298, 1, 0, 0.2745098, 1,
1.77195, 0.08590345, 2.864118, 1, 0, 0.2705882, 1,
1.777274, 0.5836321, 1.932694, 1, 0, 0.2627451, 1,
1.77773, -0.5322177, 0.2743324, 1, 0, 0.2588235, 1,
1.779887, -0.2924018, 0.4365593, 1, 0, 0.2509804, 1,
1.785284, 0.8940969, 2.078091, 1, 0, 0.2470588, 1,
1.794212, 0.1144789, 3.096841, 1, 0, 0.2392157, 1,
1.800548, -0.9822824, 0.2277817, 1, 0, 0.2352941, 1,
1.80478, 1.362765, 0.5644083, 1, 0, 0.227451, 1,
1.819525, 1.446202, 1.163791, 1, 0, 0.2235294, 1,
1.836405, 1.599405, 1.7709, 1, 0, 0.2156863, 1,
1.840448, 0.2736188, 1.77067, 1, 0, 0.2117647, 1,
1.902929, 0.597159, 1.184311, 1, 0, 0.2039216, 1,
2.012279, 2.140869, 1.114477, 1, 0, 0.1960784, 1,
2.01507, -1.345677, 2.417675, 1, 0, 0.1921569, 1,
2.034172, 2.828218, 0.11143, 1, 0, 0.1843137, 1,
2.041643, -0.5379526, 0.4670129, 1, 0, 0.1803922, 1,
2.057143, 1.705907, 1.071951, 1, 0, 0.172549, 1,
2.059718, -1.000718, 2.388457, 1, 0, 0.1686275, 1,
2.092091, -0.7729966, 1.606862, 1, 0, 0.1607843, 1,
2.095104, 1.887974, 0.2888022, 1, 0, 0.1568628, 1,
2.100023, -0.5752918, 2.971756, 1, 0, 0.1490196, 1,
2.11476, -0.46802, 1.791914, 1, 0, 0.145098, 1,
2.114856, 0.6504178, -0.08486218, 1, 0, 0.1372549, 1,
2.137119, -0.6439083, 2.259476, 1, 0, 0.1333333, 1,
2.151062, -1.156902, 1.298946, 1, 0, 0.1254902, 1,
2.158397, -0.7883447, 2.048105, 1, 0, 0.1215686, 1,
2.190174, 0.9380381, 1.195779, 1, 0, 0.1137255, 1,
2.219778, -1.591558, 2.424719, 1, 0, 0.1098039, 1,
2.286966, -1.502205, 3.091674, 1, 0, 0.1019608, 1,
2.291528, 1.545265, -0.1541235, 1, 0, 0.09411765, 1,
2.446586, 0.3200082, 1.460883, 1, 0, 0.09019608, 1,
2.495423, -0.6818027, 0.771872, 1, 0, 0.08235294, 1,
2.621574, -1.909523, 1.655126, 1, 0, 0.07843138, 1,
2.682303, 0.5915011, 1.660996, 1, 0, 0.07058824, 1,
2.753464, -0.1873451, 1.881467, 1, 0, 0.06666667, 1,
2.757197, -0.2318891, 1.762664, 1, 0, 0.05882353, 1,
2.816885, 0.4483672, 1.637776, 1, 0, 0.05490196, 1,
2.828959, 0.2003962, 1.209501, 1, 0, 0.04705882, 1,
2.886154, -0.1786498, 1.387449, 1, 0, 0.04313726, 1,
2.902481, -0.998449, 3.140802, 1, 0, 0.03529412, 1,
3.119729, 0.7576299, -1.520365, 1, 0, 0.03137255, 1,
3.150402, -2.315515, 1.25438, 1, 0, 0.02352941, 1,
3.176008, 0.3131426, 2.198826, 1, 0, 0.01960784, 1,
3.306985, 0.2442745, 1.24163, 1, 0, 0.01176471, 1,
3.332103, -0.5809798, 2.004307, 1, 0, 0.007843138, 1
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
0.06056488, -3.682448, -7.952647, 0, -0.5, 0.5, 0.5,
0.06056488, -3.682448, -7.952647, 1, -0.5, 0.5, 0.5,
0.06056488, -3.682448, -7.952647, 1, 1.5, 0.5, 0.5,
0.06056488, -3.682448, -7.952647, 0, 1.5, 0.5, 0.5
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
-4.320024, 0.08386362, -7.952647, 0, -0.5, 0.5, 0.5,
-4.320024, 0.08386362, -7.952647, 1, -0.5, 0.5, 0.5,
-4.320024, 0.08386362, -7.952647, 1, 1.5, 0.5, 0.5,
-4.320024, 0.08386362, -7.952647, 0, 1.5, 0.5, 0.5
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
-4.320024, -3.682448, -0.3339145, 0, -0.5, 0.5, 0.5,
-4.320024, -3.682448, -0.3339145, 1, -0.5, 0.5, 0.5,
-4.320024, -3.682448, -0.3339145, 1, 1.5, 0.5, 0.5,
-4.320024, -3.682448, -0.3339145, 0, 1.5, 0.5, 0.5
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
-3, -2.813299, -6.194478,
3, -2.813299, -6.194478,
-3, -2.813299, -6.194478,
-3, -2.958157, -6.487506,
-2, -2.813299, -6.194478,
-2, -2.958157, -6.487506,
-1, -2.813299, -6.194478,
-1, -2.958157, -6.487506,
0, -2.813299, -6.194478,
0, -2.958157, -6.487506,
1, -2.813299, -6.194478,
1, -2.958157, -6.487506,
2, -2.813299, -6.194478,
2, -2.958157, -6.487506,
3, -2.813299, -6.194478,
3, -2.958157, -6.487506
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
-3, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
-3, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
-3, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
-3, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
-2, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
-2, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
-2, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
-2, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
-1, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
-1, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
-1, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
-1, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
0, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
0, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
0, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
0, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
1, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
1, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
1, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
1, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
2, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
2, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
2, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
2, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5,
3, -3.247873, -7.073562, 0, -0.5, 0.5, 0.5,
3, -3.247873, -7.073562, 1, -0.5, 0.5, 0.5,
3, -3.247873, -7.073562, 1, 1.5, 0.5, 0.5,
3, -3.247873, -7.073562, 0, 1.5, 0.5, 0.5
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
-3.309119, -2, -6.194478,
-3.309119, 2, -6.194478,
-3.309119, -2, -6.194478,
-3.477603, -2, -6.487506,
-3.309119, -1, -6.194478,
-3.477603, -1, -6.487506,
-3.309119, 0, -6.194478,
-3.477603, 0, -6.487506,
-3.309119, 1, -6.194478,
-3.477603, 1, -6.487506,
-3.309119, 2, -6.194478,
-3.477603, 2, -6.487506
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
-3.814571, -2, -7.073562, 0, -0.5, 0.5, 0.5,
-3.814571, -2, -7.073562, 1, -0.5, 0.5, 0.5,
-3.814571, -2, -7.073562, 1, 1.5, 0.5, 0.5,
-3.814571, -2, -7.073562, 0, 1.5, 0.5, 0.5,
-3.814571, -1, -7.073562, 0, -0.5, 0.5, 0.5,
-3.814571, -1, -7.073562, 1, -0.5, 0.5, 0.5,
-3.814571, -1, -7.073562, 1, 1.5, 0.5, 0.5,
-3.814571, -1, -7.073562, 0, 1.5, 0.5, 0.5,
-3.814571, 0, -7.073562, 0, -0.5, 0.5, 0.5,
-3.814571, 0, -7.073562, 1, -0.5, 0.5, 0.5,
-3.814571, 0, -7.073562, 1, 1.5, 0.5, 0.5,
-3.814571, 0, -7.073562, 0, 1.5, 0.5, 0.5,
-3.814571, 1, -7.073562, 0, -0.5, 0.5, 0.5,
-3.814571, 1, -7.073562, 1, -0.5, 0.5, 0.5,
-3.814571, 1, -7.073562, 1, 1.5, 0.5, 0.5,
-3.814571, 1, -7.073562, 0, 1.5, 0.5, 0.5,
-3.814571, 2, -7.073562, 0, -0.5, 0.5, 0.5,
-3.814571, 2, -7.073562, 1, -0.5, 0.5, 0.5,
-3.814571, 2, -7.073562, 1, 1.5, 0.5, 0.5,
-3.814571, 2, -7.073562, 0, 1.5, 0.5, 0.5
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
-3.309119, -2.813299, -6,
-3.309119, -2.813299, 4,
-3.309119, -2.813299, -6,
-3.477603, -2.958157, -6,
-3.309119, -2.813299, -4,
-3.477603, -2.958157, -4,
-3.309119, -2.813299, -2,
-3.477603, -2.958157, -2,
-3.309119, -2.813299, 0,
-3.477603, -2.958157, 0,
-3.309119, -2.813299, 2,
-3.477603, -2.958157, 2,
-3.309119, -2.813299, 4,
-3.477603, -2.958157, 4
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
"-6",
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
-3.814571, -3.247873, -6, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -6, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -6, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, -6, 0, 1.5, 0.5, 0.5,
-3.814571, -3.247873, -4, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -4, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -4, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, -4, 0, 1.5, 0.5, 0.5,
-3.814571, -3.247873, -2, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -2, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, -2, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, -2, 0, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 0, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 0, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 0, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 0, 0, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 2, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 2, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 2, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 2, 0, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 4, 0, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 4, 1, -0.5, 0.5, 0.5,
-3.814571, -3.247873, 4, 1, 1.5, 0.5, 0.5,
-3.814571, -3.247873, 4, 0, 1.5, 0.5, 0.5
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
-3.309119, -2.813299, -6.194478,
-3.309119, 2.981026, -6.194478,
-3.309119, -2.813299, 5.526649,
-3.309119, 2.981026, 5.526649,
-3.309119, -2.813299, -6.194478,
-3.309119, -2.813299, 5.526649,
-3.309119, 2.981026, -6.194478,
-3.309119, 2.981026, 5.526649,
-3.309119, -2.813299, -6.194478,
3.430249, -2.813299, -6.194478,
-3.309119, -2.813299, 5.526649,
3.430249, -2.813299, 5.526649,
-3.309119, 2.981026, -6.194478,
3.430249, 2.981026, -6.194478,
-3.309119, 2.981026, 5.526649,
3.430249, 2.981026, 5.526649,
3.430249, -2.813299, -6.194478,
3.430249, 2.981026, -6.194478,
3.430249, -2.813299, 5.526649,
3.430249, 2.981026, 5.526649,
3.430249, -2.813299, -6.194478,
3.430249, -2.813299, 5.526649,
3.430249, 2.981026, -6.194478,
3.430249, 2.981026, 5.526649
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
var radius = 7.854745;
var distance = 34.94665;
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
mvMatrix.translate( -0.06056488, -0.08386362, 0.3339145 );
mvMatrix.scale( 1.260163, 1.465693, 0.7245638 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94665);
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
etoxazole<-read.table("etoxazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etoxazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
```

```r
y<-etoxazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
```

```r
z<-etoxazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
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
-3.210973, 1.901841, -1.428654, 0, 0, 1, 1, 1,
-2.757776, -0.5162491, -1.711635, 1, 0, 0, 1, 1,
-2.683086, -0.05689193, -2.148753, 1, 0, 0, 1, 1,
-2.655742, 0.6580992, -3.276434, 1, 0, 0, 1, 1,
-2.631152, -0.2348179, -1.206976, 1, 0, 0, 1, 1,
-2.575875, -0.7965564, -1.903185, 1, 0, 0, 1, 1,
-2.506296, 0.9448553, -1.694254, 0, 0, 0, 1, 1,
-2.491049, -1.481767, -1.820172, 0, 0, 0, 1, 1,
-2.397296, 0.5106753, -2.147175, 0, 0, 0, 1, 1,
-2.365971, -1.143114, -1.948879, 0, 0, 0, 1, 1,
-2.347216, -0.2390907, -1.723271, 0, 0, 0, 1, 1,
-2.314407, -1.200399, -1.403874, 0, 0, 0, 1, 1,
-2.249869, -0.2082866, -1.188637, 0, 0, 0, 1, 1,
-2.088132, -1.991771, -2.783147, 1, 1, 1, 1, 1,
-2.06391, 0.07453992, -1.694073, 1, 1, 1, 1, 1,
-2.04825, 0.1136175, -1.829231, 1, 1, 1, 1, 1,
-2.01043, 0.7316791, -1.39615, 1, 1, 1, 1, 1,
-2.004557, -0.1052281, -2.157537, 1, 1, 1, 1, 1,
-1.975811, 1.860282, -2.13511, 1, 1, 1, 1, 1,
-1.946457, -1.069368, -2.476263, 1, 1, 1, 1, 1,
-1.922245, 1.473407, -0.05720171, 1, 1, 1, 1, 1,
-1.919313, 1.638226, -0.1312827, 1, 1, 1, 1, 1,
-1.90682, 1.625288, -0.4716762, 1, 1, 1, 1, 1,
-1.900873, 0.7470499, -1.536488, 1, 1, 1, 1, 1,
-1.870153, -1.330463, -2.380766, 1, 1, 1, 1, 1,
-1.862645, 0.452208, -1.644915, 1, 1, 1, 1, 1,
-1.851359, -0.4163317, -2.339389, 1, 1, 1, 1, 1,
-1.848302, -0.2422763, -1.99436, 1, 1, 1, 1, 1,
-1.83442, -1.422584, -2.287094, 0, 0, 1, 1, 1,
-1.833793, -0.8117373, -0.7015781, 1, 0, 0, 1, 1,
-1.815228, 0.1765518, 0.4860878, 1, 0, 0, 1, 1,
-1.774927, 0.2847669, -2.313802, 1, 0, 0, 1, 1,
-1.773403, -0.4544273, -0.951224, 1, 0, 0, 1, 1,
-1.753086, 1.573396, -1.043321, 1, 0, 0, 1, 1,
-1.751052, -1.58825, -1.611578, 0, 0, 0, 1, 1,
-1.750451, -1.160934, -1.901947, 0, 0, 0, 1, 1,
-1.748284, 0.8208263, -0.9370142, 0, 0, 0, 1, 1,
-1.723803, 0.619248, -1.361044, 0, 0, 0, 1, 1,
-1.69958, 1.519313, 1.250617, 0, 0, 0, 1, 1,
-1.679864, 0.6786493, -0.4503111, 0, 0, 0, 1, 1,
-1.669589, 0.5792524, -2.049996, 0, 0, 0, 1, 1,
-1.647406, 1.024251, -2.091415, 1, 1, 1, 1, 1,
-1.637546, -1.06766, -2.984056, 1, 1, 1, 1, 1,
-1.624997, -0.5844678, -1.944245, 1, 1, 1, 1, 1,
-1.608736, 0.02836793, -2.284327, 1, 1, 1, 1, 1,
-1.599051, -0.6072596, -1.3074, 1, 1, 1, 1, 1,
-1.598524, -0.9483645, -2.272188, 1, 1, 1, 1, 1,
-1.575843, -0.4944089, -2.072692, 1, 1, 1, 1, 1,
-1.564825, 0.7909259, -3.656423, 1, 1, 1, 1, 1,
-1.564328, -0.3286626, -1.426344, 1, 1, 1, 1, 1,
-1.564029, 0.5348465, 0.2510038, 1, 1, 1, 1, 1,
-1.557567, 0.2021118, 0.01076911, 1, 1, 1, 1, 1,
-1.556474, 0.8150793, -1.208818, 1, 1, 1, 1, 1,
-1.55087, 0.4757176, 0.5004327, 1, 1, 1, 1, 1,
-1.509377, 0.2378416, -0.8716842, 1, 1, 1, 1, 1,
-1.501981, -0.5313486, -1.400124, 1, 1, 1, 1, 1,
-1.501749, -2.16128, -3.25352, 0, 0, 1, 1, 1,
-1.501108, 0.01961306, -1.087197, 1, 0, 0, 1, 1,
-1.492214, -0.0835688, -3.334697, 1, 0, 0, 1, 1,
-1.491136, 0.07799181, -1.204826, 1, 0, 0, 1, 1,
-1.490374, -0.5886346, -1.391844, 1, 0, 0, 1, 1,
-1.46849, 0.4960388, -1.395355, 1, 0, 0, 1, 1,
-1.455476, -0.7648408, -3.308942, 0, 0, 0, 1, 1,
-1.448527, -1.941676, -2.082113, 0, 0, 0, 1, 1,
-1.445485, 0.4579249, -0.9693868, 0, 0, 0, 1, 1,
-1.444359, -0.07063792, -2.302019, 0, 0, 0, 1, 1,
-1.434142, -0.9432851, -2.756716, 0, 0, 0, 1, 1,
-1.432503, 0.9084015, -2.061515, 0, 0, 0, 1, 1,
-1.429465, -0.03689879, -0.4047048, 0, 0, 0, 1, 1,
-1.427541, 0.6877951, -0.9511147, 1, 1, 1, 1, 1,
-1.426524, -1.230157, -1.991724, 1, 1, 1, 1, 1,
-1.411658, -0.15377, -3.009613, 1, 1, 1, 1, 1,
-1.411066, 0.8309295, 0.3124012, 1, 1, 1, 1, 1,
-1.406401, -1.13223, -1.295518, 1, 1, 1, 1, 1,
-1.401768, 0.3366403, -0.8407443, 1, 1, 1, 1, 1,
-1.398185, -1.352274, -3.761261, 1, 1, 1, 1, 1,
-1.396703, 0.5752914, 0.2127676, 1, 1, 1, 1, 1,
-1.386359, -0.2024469, -0.6423487, 1, 1, 1, 1, 1,
-1.385591, 1.207144, -0.7151176, 1, 1, 1, 1, 1,
-1.380261, -0.5115315, -1.987033, 1, 1, 1, 1, 1,
-1.379866, -1.457651, -1.443779, 1, 1, 1, 1, 1,
-1.370075, -0.5026085, -1.708075, 1, 1, 1, 1, 1,
-1.365999, 0.03901228, -2.095078, 1, 1, 1, 1, 1,
-1.357714, -0.5808323, -2.770613, 1, 1, 1, 1, 1,
-1.356937, 1.450263, 0.1817113, 0, 0, 1, 1, 1,
-1.355426, 1.672459, 0.1861508, 1, 0, 0, 1, 1,
-1.347508, -1.161014, -3.368634, 1, 0, 0, 1, 1,
-1.343855, -2.555007, -2.815534, 1, 0, 0, 1, 1,
-1.34059, -0.1473836, -0.9791541, 1, 0, 0, 1, 1,
-1.340003, 1.460027, 0.1122183, 1, 0, 0, 1, 1,
-1.335942, 1.132697, -1.416914, 0, 0, 0, 1, 1,
-1.334699, 1.559369, -0.257037, 0, 0, 0, 1, 1,
-1.330892, -0.9956532, -1.305094, 0, 0, 0, 1, 1,
-1.328739, 0.5917376, -0.4313757, 0, 0, 0, 1, 1,
-1.321691, 0.8400978, 0.2277585, 0, 0, 0, 1, 1,
-1.315388, -0.9221214, -2.615454, 0, 0, 0, 1, 1,
-1.314032, 0.007015939, -1.833049, 0, 0, 0, 1, 1,
-1.307844, 1.103044, -1.168709, 1, 1, 1, 1, 1,
-1.303109, 1.668512, 1.801781, 1, 1, 1, 1, 1,
-1.300578, 0.5247524, 0.3545267, 1, 1, 1, 1, 1,
-1.29794, 0.7629496, -1.843364, 1, 1, 1, 1, 1,
-1.282444, 0.85614, -2.397661, 1, 1, 1, 1, 1,
-1.275819, -0.8742507, -2.494134, 1, 1, 1, 1, 1,
-1.267181, -0.6504467, -0.186804, 1, 1, 1, 1, 1,
-1.257469, -0.656424, -2.757449, 1, 1, 1, 1, 1,
-1.247053, 1.21486, -2.251162, 1, 1, 1, 1, 1,
-1.245801, -0.3587115, 0.4855946, 1, 1, 1, 1, 1,
-1.244418, -1.638712, -2.024583, 1, 1, 1, 1, 1,
-1.243196, -0.3291599, -1.57945, 1, 1, 1, 1, 1,
-1.239352, -0.2071825, -2.350648, 1, 1, 1, 1, 1,
-1.227368, -0.01135998, -2.30607, 1, 1, 1, 1, 1,
-1.223487, -0.4022675, -1.857792, 1, 1, 1, 1, 1,
-1.222444, 0.689943, -1.556999, 0, 0, 1, 1, 1,
-1.210339, 0.5317764, -0.1100698, 1, 0, 0, 1, 1,
-1.209981, -1.134027, -2.23571, 1, 0, 0, 1, 1,
-1.206985, -0.184453, -0.7057046, 1, 0, 0, 1, 1,
-1.19785, 1.302681, -0.6989796, 1, 0, 0, 1, 1,
-1.190572, 1.115286, 1.765388, 1, 0, 0, 1, 1,
-1.190109, 0.9613215, -1.44897, 0, 0, 0, 1, 1,
-1.171438, -0.3597589, -2.089011, 0, 0, 0, 1, 1,
-1.16498, -0.4871687, -2.55283, 0, 0, 0, 1, 1,
-1.164606, 0.5004962, -1.886748, 0, 0, 0, 1, 1,
-1.161502, 1.201437, -0.3768232, 0, 0, 0, 1, 1,
-1.158995, 0.4851469, -1.765032, 0, 0, 0, 1, 1,
-1.153287, 0.6956683, -1.498014, 0, 0, 0, 1, 1,
-1.152344, 0.09011822, -2.269377, 1, 1, 1, 1, 1,
-1.151741, 0.5106733, -1.788093, 1, 1, 1, 1, 1,
-1.140576, -2.20294, -2.552801, 1, 1, 1, 1, 1,
-1.139367, 0.3828918, -2.487687, 1, 1, 1, 1, 1,
-1.135356, 0.8189901, -0.8673612, 1, 1, 1, 1, 1,
-1.128818, -1.615744, -2.173254, 1, 1, 1, 1, 1,
-1.124392, -1.072239, -2.717711, 1, 1, 1, 1, 1,
-1.124208, 2.710177, -0.2495467, 1, 1, 1, 1, 1,
-1.12218, 0.1010369, -3.744587, 1, 1, 1, 1, 1,
-1.121597, 0.001441084, -0.7774363, 1, 1, 1, 1, 1,
-1.121447, 1.416619, -0.622175, 1, 1, 1, 1, 1,
-1.118338, 1.817071, -0.310025, 1, 1, 1, 1, 1,
-1.114672, -0.1476525, -0.8331537, 1, 1, 1, 1, 1,
-1.111508, -1.034911, -1.698524, 1, 1, 1, 1, 1,
-1.10534, 0.3833716, -2.911285, 1, 1, 1, 1, 1,
-1.105286, -0.7481393, -2.237989, 0, 0, 1, 1, 1,
-1.100764, -0.9973096, -3.100089, 1, 0, 0, 1, 1,
-1.093601, -1.877795, -1.328618, 1, 0, 0, 1, 1,
-1.091625, 1.309262, -1.120244, 1, 0, 0, 1, 1,
-1.088885, 1.427737, -0.4105319, 1, 0, 0, 1, 1,
-1.074536, -0.7217895, -3.355783, 1, 0, 0, 1, 1,
-1.064808, 0.6110895, 0.8376272, 0, 0, 0, 1, 1,
-1.061478, 1.915647, -1.538191, 0, 0, 0, 1, 1,
-1.060203, -0.2386823, -1.099558, 0, 0, 0, 1, 1,
-1.058558, 0.05306125, -2.193272, 0, 0, 0, 1, 1,
-1.048786, -0.4636637, -1.958714, 0, 0, 0, 1, 1,
-1.040045, -0.4282468, -2.305036, 0, 0, 0, 1, 1,
-1.034644, -0.8142031, -3.587337, 0, 0, 0, 1, 1,
-1.024051, -0.9206039, -2.525415, 1, 1, 1, 1, 1,
-1.023319, 0.9309379, -0.116425, 1, 1, 1, 1, 1,
-1.017439, 0.8587914, -0.09021282, 1, 1, 1, 1, 1,
-1.014648, -0.5879682, -1.120344, 1, 1, 1, 1, 1,
-1.01204, -0.7340441, -1.769887, 1, 1, 1, 1, 1,
-1.010535, 0.5944139, -0.8981763, 1, 1, 1, 1, 1,
-1.009836, -0.3687896, -1.817654, 1, 1, 1, 1, 1,
-1.00475, -0.05845272, -2.537555, 1, 1, 1, 1, 1,
-0.9978989, -1.846198, -2.592389, 1, 1, 1, 1, 1,
-0.9919598, -0.9648499, -0.3297518, 1, 1, 1, 1, 1,
-0.9885834, 0.2487537, -2.317374, 1, 1, 1, 1, 1,
-0.9858622, -1.078441, -2.141274, 1, 1, 1, 1, 1,
-0.9846697, -1.302933, -1.718988, 1, 1, 1, 1, 1,
-0.9757566, 0.04338866, -1.415439, 1, 1, 1, 1, 1,
-0.9755447, 0.004909769, -1.124034, 1, 1, 1, 1, 1,
-0.9724512, -0.4778952, -1.29172, 0, 0, 1, 1, 1,
-0.9715158, -0.199752, 0.7599933, 1, 0, 0, 1, 1,
-0.9711958, -0.7672637, -2.719012, 1, 0, 0, 1, 1,
-0.9622487, 0.1254064, -1.218148, 1, 0, 0, 1, 1,
-0.9612792, 0.05505978, -1.808972, 1, 0, 0, 1, 1,
-0.9582152, 0.4315879, -2.04005, 1, 0, 0, 1, 1,
-0.9545981, -0.8677209, -0.3127722, 0, 0, 0, 1, 1,
-0.9510381, 0.08680104, -2.694167, 0, 0, 0, 1, 1,
-0.948354, 0.7148138, -2.157566, 0, 0, 0, 1, 1,
-0.9461305, -0.3086828, -1.634777, 0, 0, 0, 1, 1,
-0.9426966, -0.5712669, -3.371645, 0, 0, 0, 1, 1,
-0.939508, -0.91378, -2.691425, 0, 0, 0, 1, 1,
-0.9369438, -0.5184119, -1.777284, 0, 0, 0, 1, 1,
-0.9357657, 1.226935, -1.216375, 1, 1, 1, 1, 1,
-0.9352809, -1.256241, -0.6115629, 1, 1, 1, 1, 1,
-0.9276109, 1.016102, 0.2624322, 1, 1, 1, 1, 1,
-0.9264277, -0.8307025, -4.002787, 1, 1, 1, 1, 1,
-0.92122, 0.3297755, -1.300977, 1, 1, 1, 1, 1,
-0.9164923, -0.6281112, -0.85178, 1, 1, 1, 1, 1,
-0.9163327, 0.7460046, -1.204067, 1, 1, 1, 1, 1,
-0.9126928, -1.227301, -4.284566, 1, 1, 1, 1, 1,
-0.9099468, 0.4198954, -1.206273, 1, 1, 1, 1, 1,
-0.9082674, 1.017577, -1.685162, 1, 1, 1, 1, 1,
-0.9037113, -0.4394302, -1.680787, 1, 1, 1, 1, 1,
-0.9032125, -0.1152028, -0.2172654, 1, 1, 1, 1, 1,
-0.9014219, -1.223446, -4.531577, 1, 1, 1, 1, 1,
-0.8989644, 0.8470055, -1.066658, 1, 1, 1, 1, 1,
-0.8980062, -0.02874849, -1.743362, 1, 1, 1, 1, 1,
-0.8947583, -0.4878769, -1.638568, 0, 0, 1, 1, 1,
-0.8827699, -0.6662225, -1.617488, 1, 0, 0, 1, 1,
-0.8774688, -0.2692006, 1.086171, 1, 0, 0, 1, 1,
-0.8693946, -0.3581019, 0.1202137, 1, 0, 0, 1, 1,
-0.8673718, 1.060459, -1.960224, 1, 0, 0, 1, 1,
-0.8655389, 2.052803, 0.3758276, 1, 0, 0, 1, 1,
-0.8592613, 2.452209, -1.866446, 0, 0, 0, 1, 1,
-0.8574597, 0.01046128, -0.1614555, 0, 0, 0, 1, 1,
-0.8539783, 0.1727603, -1.011968, 0, 0, 0, 1, 1,
-0.84152, 0.1269636, -1.152099, 0, 0, 0, 1, 1,
-0.8375108, 0.4187402, -0.08891298, 0, 0, 0, 1, 1,
-0.8341116, 2.083483, 0.3501428, 0, 0, 0, 1, 1,
-0.8334096, 2.087392, -1.971377, 0, 0, 0, 1, 1,
-0.8323634, 0.4817444, -1.156217, 1, 1, 1, 1, 1,
-0.8300463, 0.03953907, 0.8336447, 1, 1, 1, 1, 1,
-0.8257396, 0.6040704, 0.3140509, 1, 1, 1, 1, 1,
-0.8223565, -1.510437, -2.831186, 1, 1, 1, 1, 1,
-0.8203045, 0.2020607, -0.1043095, 1, 1, 1, 1, 1,
-0.8195529, -1.753291, -3.679423, 1, 1, 1, 1, 1,
-0.8076969, 0.335334, -0.8741752, 1, 1, 1, 1, 1,
-0.7979309, -1.031875, -1.348842, 1, 1, 1, 1, 1,
-0.7896969, -0.4486787, -2.137007, 1, 1, 1, 1, 1,
-0.7884552, -0.7244359, -3.712329, 1, 1, 1, 1, 1,
-0.786456, 0.3658609, -0.5753676, 1, 1, 1, 1, 1,
-0.7820667, 0.4457892, 0.0869837, 1, 1, 1, 1, 1,
-0.7812997, -0.2312447, -2.26785, 1, 1, 1, 1, 1,
-0.7812639, 0.318532, -1.093156, 1, 1, 1, 1, 1,
-0.7779637, 0.1859548, -1.827262, 1, 1, 1, 1, 1,
-0.7770938, 1.363633, -0.1545134, 0, 0, 1, 1, 1,
-0.7703177, 0.2623575, -1.290184, 1, 0, 0, 1, 1,
-0.7696987, -0.6759248, -1.575462, 1, 0, 0, 1, 1,
-0.7666327, -1.208183, -0.640817, 1, 0, 0, 1, 1,
-0.7613425, -0.4886941, -1.48848, 1, 0, 0, 1, 1,
-0.7611254, 0.2563389, 0.2811509, 1, 0, 0, 1, 1,
-0.7565989, 0.7637492, -1.105325, 0, 0, 0, 1, 1,
-0.7503285, 0.7358746, -0.2060906, 0, 0, 0, 1, 1,
-0.7464949, 0.4955625, -1.100621, 0, 0, 0, 1, 1,
-0.7446118, -0.9828324, -3.240902, 0, 0, 0, 1, 1,
-0.7429926, -1.063252, -3.223898, 0, 0, 0, 1, 1,
-0.7425151, 0.3278835, -1.11609, 0, 0, 0, 1, 1,
-0.7386185, 0.2237074, -0.6597899, 0, 0, 0, 1, 1,
-0.7286315, -0.07731827, -0.4207518, 1, 1, 1, 1, 1,
-0.7235677, 1.026183, -1.669327, 1, 1, 1, 1, 1,
-0.7186747, 0.01246758, -0.360356, 1, 1, 1, 1, 1,
-0.715538, 1.189813, 0.08681691, 1, 1, 1, 1, 1,
-0.7119831, 0.2810262, -1.229922, 1, 1, 1, 1, 1,
-0.7111064, 0.5663957, -1.26023, 1, 1, 1, 1, 1,
-0.7102584, 0.07174876, -0.3175045, 1, 1, 1, 1, 1,
-0.6923203, 1.648337, -0.9170698, 1, 1, 1, 1, 1,
-0.692269, 1.063035, -0.5597975, 1, 1, 1, 1, 1,
-0.690146, 0.08646964, -1.884494, 1, 1, 1, 1, 1,
-0.6884072, 0.1386614, -2.12697, 1, 1, 1, 1, 1,
-0.6873748, -0.6864565, -2.660902, 1, 1, 1, 1, 1,
-0.6767946, -0.9980128, -2.619813, 1, 1, 1, 1, 1,
-0.6698044, -0.5924193, -2.608127, 1, 1, 1, 1, 1,
-0.6692569, -1.927255, -1.876304, 1, 1, 1, 1, 1,
-0.6627648, -0.8769696, -3.70082, 0, 0, 1, 1, 1,
-0.6544594, -0.5275712, -2.450314, 1, 0, 0, 1, 1,
-0.6542042, -0.4412049, -2.004956, 1, 0, 0, 1, 1,
-0.6536355, -0.1649082, -1.514476, 1, 0, 0, 1, 1,
-0.6424845, -0.4176222, -3.369178, 1, 0, 0, 1, 1,
-0.6367038, 0.0882423, -3.416595, 1, 0, 0, 1, 1,
-0.6366361, 2.896643, 2.028424, 0, 0, 0, 1, 1,
-0.6305544, 1.000613, -0.1212399, 0, 0, 0, 1, 1,
-0.6304579, 0.9831758, -1.468175, 0, 0, 0, 1, 1,
-0.6263711, -0.2298428, -3.064658, 0, 0, 0, 1, 1,
-0.625106, 0.5300316, -1.529276, 0, 0, 0, 1, 1,
-0.6219149, 0.8052426, -1.177655, 0, 0, 0, 1, 1,
-0.6209329, -0.5941528, -3.126276, 0, 0, 0, 1, 1,
-0.6189036, 1.260954, -2.208426, 1, 1, 1, 1, 1,
-0.6141576, 0.6013839, 0.8905677, 1, 1, 1, 1, 1,
-0.6092964, 0.5209948, -1.106055, 1, 1, 1, 1, 1,
-0.6089017, 0.3300102, -0.3266065, 1, 1, 1, 1, 1,
-0.6084384, -0.004259819, -1.771646, 1, 1, 1, 1, 1,
-0.6071452, 1.246751, 0.2607169, 1, 1, 1, 1, 1,
-0.6028356, 0.8291335, -1.598052, 1, 1, 1, 1, 1,
-0.5981275, -0.1366483, -0.9080217, 1, 1, 1, 1, 1,
-0.5957208, -0.304527, -2.907461, 1, 1, 1, 1, 1,
-0.5907217, -0.5919093, -2.284641, 1, 1, 1, 1, 1,
-0.5802967, -0.7598737, -2.797806, 1, 1, 1, 1, 1,
-0.5792096, 0.6182074, -0.1413663, 1, 1, 1, 1, 1,
-0.5782226, 0.3174187, -0.8925509, 1, 1, 1, 1, 1,
-0.5691606, 2.083971, 0.8597955, 1, 1, 1, 1, 1,
-0.5605898, 0.2954871, -2.352146, 1, 1, 1, 1, 1,
-0.5571702, -0.07884037, -3.451106, 0, 0, 1, 1, 1,
-0.5565506, -0.4919012, -3.066359, 1, 0, 0, 1, 1,
-0.5533616, -0.08788662, -1.862043, 1, 0, 0, 1, 1,
-0.5488293, 0.2264087, -0.5016525, 1, 0, 0, 1, 1,
-0.5486237, 0.3272477, -0.9797125, 1, 0, 0, 1, 1,
-0.5456092, 0.6940894, -1.085978, 1, 0, 0, 1, 1,
-0.5450345, 0.1139897, -1.682597, 0, 0, 0, 1, 1,
-0.5427452, -1.078179, -2.288034, 0, 0, 0, 1, 1,
-0.5331103, 0.05687206, -0.4871667, 0, 0, 0, 1, 1,
-0.5248255, 0.3089029, 0.2601759, 0, 0, 0, 1, 1,
-0.5149954, -1.696974, -3.066361, 0, 0, 0, 1, 1,
-0.5125977, -0.5215862, -2.522707, 0, 0, 0, 1, 1,
-0.5110823, 1.237745, -2.032822, 0, 0, 0, 1, 1,
-0.5068539, 1.736009, -1.799112, 1, 1, 1, 1, 1,
-0.5055863, -0.5020528, -0.6732258, 1, 1, 1, 1, 1,
-0.5008816, 0.3886839, -1.45757, 1, 1, 1, 1, 1,
-0.4961469, -1.910487, -2.138639, 1, 1, 1, 1, 1,
-0.4937426, 0.2478681, -0.7045572, 1, 1, 1, 1, 1,
-0.4915045, 0.2738712, -2.132742, 1, 1, 1, 1, 1,
-0.4824343, 0.4789098, -0.7489991, 1, 1, 1, 1, 1,
-0.4812706, 0.1773768, -0.6838073, 1, 1, 1, 1, 1,
-0.4757534, -0.6704227, -2.081469, 1, 1, 1, 1, 1,
-0.4724614, -0.4768353, -1.879588, 1, 1, 1, 1, 1,
-0.4716964, -1.313101, -2.054963, 1, 1, 1, 1, 1,
-0.4699939, 2.723328, 0.7030426, 1, 1, 1, 1, 1,
-0.4679847, -2.057285, -1.900233, 1, 1, 1, 1, 1,
-0.4674032, -1.22718, -2.672267, 1, 1, 1, 1, 1,
-0.4667542, -1.304632, -1.976935, 1, 1, 1, 1, 1,
-0.4623865, 0.2789036, -1.333878, 0, 0, 1, 1, 1,
-0.4606139, 0.3082751, -1.517438, 1, 0, 0, 1, 1,
-0.4583234, -2.097658, -3.418952, 1, 0, 0, 1, 1,
-0.4579673, 1.067658, -0.8676162, 1, 0, 0, 1, 1,
-0.4569493, 1.264892, -0.6675019, 1, 0, 0, 1, 1,
-0.4568533, -1.131815, -2.319616, 1, 0, 0, 1, 1,
-0.4553506, -0.4419248, -1.323597, 0, 0, 0, 1, 1,
-0.4553414, 0.9349023, -0.6307524, 0, 0, 0, 1, 1,
-0.4531153, 0.4154368, -1.063403, 0, 0, 0, 1, 1,
-0.4496049, 2.159991, -0.6002809, 0, 0, 0, 1, 1,
-0.4472724, -1.485555, -3.625132, 0, 0, 0, 1, 1,
-0.4407326, -0.6829648, -3.985912, 0, 0, 0, 1, 1,
-0.4344441, -0.6307778, -0.860114, 0, 0, 0, 1, 1,
-0.4332927, 1.102191, 0.2168092, 1, 1, 1, 1, 1,
-0.4332185, -0.5684542, -1.657344, 1, 1, 1, 1, 1,
-0.4331698, 0.03121796, -2.958581, 1, 1, 1, 1, 1,
-0.4293718, 0.2501988, -1.746095, 1, 1, 1, 1, 1,
-0.4273017, 1.132423, -1.141449, 1, 1, 1, 1, 1,
-0.426889, -1.11472, -5.288009, 1, 1, 1, 1, 1,
-0.4230774, 1.169624, -1.192825, 1, 1, 1, 1, 1,
-0.4217802, -0.3693743, -3.610591, 1, 1, 1, 1, 1,
-0.4209892, 0.7633111, -1.080108, 1, 1, 1, 1, 1,
-0.414635, 1.397778, -1.031965, 1, 1, 1, 1, 1,
-0.4129554, 1.28828, -1.269017, 1, 1, 1, 1, 1,
-0.4127474, -0.5094606, -2.780433, 1, 1, 1, 1, 1,
-0.4102082, 0.885312, -1.315125, 1, 1, 1, 1, 1,
-0.4091782, 0.9242837, -1.728414, 1, 1, 1, 1, 1,
-0.4040204, -0.3147715, -2.210452, 1, 1, 1, 1, 1,
-0.4026802, 0.9895752, -1.201606, 0, 0, 1, 1, 1,
-0.3965759, 0.6132375, -1.166703, 1, 0, 0, 1, 1,
-0.3962887, 0.02464968, -2.99133, 1, 0, 0, 1, 1,
-0.3938086, 0.755322, -2.080786, 1, 0, 0, 1, 1,
-0.3909001, 1.054427, 0.7129174, 1, 0, 0, 1, 1,
-0.3904474, -0.5207189, -2.304205, 1, 0, 0, 1, 1,
-0.3831959, 0.9801347, -1.567314, 0, 0, 0, 1, 1,
-0.3829232, -0.614613, -0.8018192, 0, 0, 0, 1, 1,
-0.3820647, 1.061848, 0.922978, 0, 0, 0, 1, 1,
-0.3819904, -0.4445495, -0.9377182, 0, 0, 0, 1, 1,
-0.3819623, 0.7477518, -0.1204516, 0, 0, 0, 1, 1,
-0.3808424, 1.00879, -0.4645447, 0, 0, 0, 1, 1,
-0.3762771, -0.7371729, -2.258244, 0, 0, 0, 1, 1,
-0.3753772, -1.219496, -3.709746, 1, 1, 1, 1, 1,
-0.3732724, -0.14195, -2.379071, 1, 1, 1, 1, 1,
-0.3699266, -0.2503253, -2.818874, 1, 1, 1, 1, 1,
-0.3675941, 0.6816211, -0.1990364, 1, 1, 1, 1, 1,
-0.3642147, -0.4695872, -2.641826, 1, 1, 1, 1, 1,
-0.3581733, -0.3331171, -2.790783, 1, 1, 1, 1, 1,
-0.358007, 1.288165, 0.2152199, 1, 1, 1, 1, 1,
-0.3564037, -0.2228876, -2.675532, 1, 1, 1, 1, 1,
-0.3558822, 1.562181, -0.6493814, 1, 1, 1, 1, 1,
-0.3523341, 0.6962006, -0.2809833, 1, 1, 1, 1, 1,
-0.3513638, 0.2839383, -0.2918534, 1, 1, 1, 1, 1,
-0.3511064, -2.590733, -3.592426, 1, 1, 1, 1, 1,
-0.3496609, -0.438264, -2.609137, 1, 1, 1, 1, 1,
-0.344327, -0.7664156, -1.871688, 1, 1, 1, 1, 1,
-0.3431412, -2.147869, -2.675237, 1, 1, 1, 1, 1,
-0.3420613, 1.19156, -0.4606946, 0, 0, 1, 1, 1,
-0.3396042, -1.42616, -3.389133, 1, 0, 0, 1, 1,
-0.3363694, 0.125482, -0.5375656, 1, 0, 0, 1, 1,
-0.3363363, 0.3336756, -1.684243, 1, 0, 0, 1, 1,
-0.3351113, 0.5309168, -0.38076, 1, 0, 0, 1, 1,
-0.3328499, -0.6223559, -0.6225072, 1, 0, 0, 1, 1,
-0.3141991, 0.1716726, 0.407225, 0, 0, 0, 1, 1,
-0.3136491, -1.748979, -3.480145, 0, 0, 0, 1, 1,
-0.3120439, 0.4554307, -0.7857973, 0, 0, 0, 1, 1,
-0.3086407, 0.7156448, -0.07314751, 0, 0, 0, 1, 1,
-0.3055661, 0.5948811, -1.408799, 0, 0, 0, 1, 1,
-0.3045045, -0.503383, -2.580277, 0, 0, 0, 1, 1,
-0.3032241, 1.354304, -1.211147, 0, 0, 0, 1, 1,
-0.2984492, 0.6274526, -0.9794628, 1, 1, 1, 1, 1,
-0.2965347, 0.0719864, -0.5246932, 1, 1, 1, 1, 1,
-0.2951905, -0.8366389, -1.131111, 1, 1, 1, 1, 1,
-0.2901826, -0.5895933, -1.879591, 1, 1, 1, 1, 1,
-0.2850111, -0.749573, -2.08486, 1, 1, 1, 1, 1,
-0.2842263, -0.3586513, -2.41384, 1, 1, 1, 1, 1,
-0.2813585, 1.037571, -0.5339041, 1, 1, 1, 1, 1,
-0.2772162, 0.6869254, 0.3350756, 1, 1, 1, 1, 1,
-0.2765619, -0.6900455, -2.453842, 1, 1, 1, 1, 1,
-0.2725991, 1.3934, 0.7456882, 1, 1, 1, 1, 1,
-0.2679225, 1.223325, -1.401822, 1, 1, 1, 1, 1,
-0.262272, -1.48033, -3.570746, 1, 1, 1, 1, 1,
-0.2587076, -0.6567858, -3.012345, 1, 1, 1, 1, 1,
-0.2525295, 0.9363087, 0.3603981, 1, 1, 1, 1, 1,
-0.2476084, 0.5126156, -0.6608483, 1, 1, 1, 1, 1,
-0.2450279, -0.7290645, -3.16011, 0, 0, 1, 1, 1,
-0.2447316, 0.2768565, -0.09553045, 1, 0, 0, 1, 1,
-0.2417791, 1.994208, 0.7123822, 1, 0, 0, 1, 1,
-0.2413003, 0.4096251, -0.6252038, 1, 0, 0, 1, 1,
-0.2404829, 1.061911, -0.7268797, 1, 0, 0, 1, 1,
-0.2386425, -1.791615, -2.40687, 1, 0, 0, 1, 1,
-0.2313288, -1.531456, -4.166343, 0, 0, 0, 1, 1,
-0.2300247, 0.3677556, -1.82936, 0, 0, 0, 1, 1,
-0.2289709, -0.3066886, -3.070791, 0, 0, 0, 1, 1,
-0.2283758, 0.4362242, -0.1865195, 0, 0, 0, 1, 1,
-0.2278195, -0.472729, -3.060578, 0, 0, 0, 1, 1,
-0.2236151, -0.3292178, -4.493303, 0, 0, 0, 1, 1,
-0.2230933, 1.306092, 0.8655712, 0, 0, 0, 1, 1,
-0.2203697, -0.9938617, -4.271785, 1, 1, 1, 1, 1,
-0.2192546, 0.6947977, 0.5204347, 1, 1, 1, 1, 1,
-0.2170992, 0.7336963, -0.9948147, 1, 1, 1, 1, 1,
-0.2169869, 2.235693, -0.4187108, 1, 1, 1, 1, 1,
-0.2123426, -0.503217, -1.930842, 1, 1, 1, 1, 1,
-0.2059339, -0.6128919, -3.515064, 1, 1, 1, 1, 1,
-0.1949089, -0.6685046, -3.964794, 1, 1, 1, 1, 1,
-0.1881568, 0.3199799, -0.2113, 1, 1, 1, 1, 1,
-0.1856913, 0.2765912, -0.9737535, 1, 1, 1, 1, 1,
-0.1851776, -0.5069114, -3.300642, 1, 1, 1, 1, 1,
-0.1838948, -0.4904453, -1.658791, 1, 1, 1, 1, 1,
-0.1831552, -1.28696, -3.745424, 1, 1, 1, 1, 1,
-0.1796621, -0.1250728, -2.021379, 1, 1, 1, 1, 1,
-0.179609, -0.1330165, -2.157161, 1, 1, 1, 1, 1,
-0.1795283, -0.0100252, -3.264272, 1, 1, 1, 1, 1,
-0.1665547, -2.426229, -2.20564, 0, 0, 1, 1, 1,
-0.1634832, -0.0472773, -2.466347, 1, 0, 0, 1, 1,
-0.1608358, 2.114278, 0.264731, 1, 0, 0, 1, 1,
-0.1563754, 0.5304754, -1.084275, 1, 0, 0, 1, 1,
-0.1541714, -0.5879285, -2.081887, 1, 0, 0, 1, 1,
-0.1536167, -0.5269784, -1.061211, 1, 0, 0, 1, 1,
-0.1535862, -0.18731, -3.17664, 0, 0, 0, 1, 1,
-0.1511734, 1.803811, 1.181609, 0, 0, 0, 1, 1,
-0.1487038, -0.425805, -1.407367, 0, 0, 0, 1, 1,
-0.1464193, -0.6269696, -3.455021, 0, 0, 0, 1, 1,
-0.1442111, -0.4186345, -1.925767, 0, 0, 0, 1, 1,
-0.1426077, -0.1427903, -1.656059, 0, 0, 0, 1, 1,
-0.1420171, -0.7275562, -3.496552, 0, 0, 0, 1, 1,
-0.1402874, -0.3037262, -1.403495, 1, 1, 1, 1, 1,
-0.1401235, 1.566711, 2.690394, 1, 1, 1, 1, 1,
-0.1383279, -0.8873301, -1.162288, 1, 1, 1, 1, 1,
-0.137158, 0.5988005, 0.4317262, 1, 1, 1, 1, 1,
-0.1354011, -0.5898529, -3.577433, 1, 1, 1, 1, 1,
-0.1317434, 0.2819955, 1.28415, 1, 1, 1, 1, 1,
-0.130574, 0.9575668, 0.6634499, 1, 1, 1, 1, 1,
-0.1281426, 0.05421344, -0.4791588, 1, 1, 1, 1, 1,
-0.1276193, 1.681746, 2.788217, 1, 1, 1, 1, 1,
-0.125702, -1.759837, -4.389695, 1, 1, 1, 1, 1,
-0.123698, 1.12487, -0.3980715, 1, 1, 1, 1, 1,
-0.1156527, -1.829428, -3.267575, 1, 1, 1, 1, 1,
-0.1131914, 0.3193914, -0.9353415, 1, 1, 1, 1, 1,
-0.1131559, 1.501667, 0.8254539, 1, 1, 1, 1, 1,
-0.1128196, -1.607241, -2.751635, 1, 1, 1, 1, 1,
-0.1105595, -0.1285129, -3.756096, 0, 0, 1, 1, 1,
-0.1066818, 2.543464, 0.1507178, 1, 0, 0, 1, 1,
-0.1042348, -0.07570047, 0.2537914, 1, 0, 0, 1, 1,
-0.1034809, -1.141064, -5.705744, 1, 0, 0, 1, 1,
-0.1003144, 0.8099634, 0.5182145, 1, 0, 0, 1, 1,
-0.09977431, -0.7211121, -5.284434, 1, 0, 0, 1, 1,
-0.09898215, -0.3587467, -4.108125, 0, 0, 0, 1, 1,
-0.09549256, 1.463853, -1.410626, 0, 0, 0, 1, 1,
-0.0903184, -0.4636366, -6.023782, 0, 0, 0, 1, 1,
-0.08651058, -0.357864, -2.333431, 0, 0, 0, 1, 1,
-0.08588622, -2.429007, -1.641608, 0, 0, 0, 1, 1,
-0.08436573, -1.94419, -3.296936, 0, 0, 0, 1, 1,
-0.07683588, -0.8247514, -2.824029, 0, 0, 0, 1, 1,
-0.06904738, -0.1305639, -2.631428, 1, 1, 1, 1, 1,
-0.06653029, 1.561401, 0.4069998, 1, 1, 1, 1, 1,
-0.0624245, -1.760153, -3.086815, 1, 1, 1, 1, 1,
-0.06093288, -0.7613061, -2.502943, 1, 1, 1, 1, 1,
-0.05320498, -0.8590895, -3.065909, 1, 1, 1, 1, 1,
-0.05112014, -1.93023, -2.362273, 1, 1, 1, 1, 1,
-0.04925807, 0.3430331, -0.4991263, 1, 1, 1, 1, 1,
-0.04322748, 0.6938046, 1.55268, 1, 1, 1, 1, 1,
-0.04276119, -1.565232, -2.447943, 1, 1, 1, 1, 1,
-0.04231498, -1.372014, -3.916025, 1, 1, 1, 1, 1,
-0.04038527, 1.145552, 1.030578, 1, 1, 1, 1, 1,
-0.03975288, -0.3912857, -3.19262, 1, 1, 1, 1, 1,
-0.03896407, -0.4627085, -3.278271, 1, 1, 1, 1, 1,
-0.03722699, -2.01682, -4.640805, 1, 1, 1, 1, 1,
-0.0370513, 0.884474, 0.6514545, 1, 1, 1, 1, 1,
-0.03681273, -1.809939, 0.2029022, 0, 0, 1, 1, 1,
-0.03030916, -1.122239, -3.653871, 1, 0, 0, 1, 1,
-0.02566117, -1.183869, -3.335182, 1, 0, 0, 1, 1,
-0.02529573, 0.3630648, 0.6250832, 1, 0, 0, 1, 1,
-0.02518438, 0.2815299, 0.9614213, 1, 0, 0, 1, 1,
-0.02325321, -0.2614516, -2.573164, 1, 0, 0, 1, 1,
-0.01695185, -0.09224454, -2.811704, 0, 0, 0, 1, 1,
-0.006684093, 0.2568263, 0.5726973, 0, 0, 0, 1, 1,
-0.003122567, -1.988456, -1.038894, 0, 0, 0, 1, 1,
-0.002544999, 1.145872, -0.5787157, 0, 0, 0, 1, 1,
-0.001772103, -1.831505, -2.987428, 0, 0, 0, 1, 1,
0.007022466, -1.99885, 3.385087, 0, 0, 0, 1, 1,
0.01014695, 0.8245375, 1.203415, 0, 0, 0, 1, 1,
0.01059048, -2.060677, 4.064466, 1, 1, 1, 1, 1,
0.01837651, -0.0198071, 2.269664, 1, 1, 1, 1, 1,
0.01856153, 0.1605928, 1.256745, 1, 1, 1, 1, 1,
0.02382127, -0.1285785, 2.964653, 1, 1, 1, 1, 1,
0.02457012, -0.07680833, 3.001906, 1, 1, 1, 1, 1,
0.02697705, -0.3198177, 3.115186, 1, 1, 1, 1, 1,
0.02889621, -1.183987, 3.889771, 1, 1, 1, 1, 1,
0.02994663, 0.2201809, -0.1132003, 1, 1, 1, 1, 1,
0.031566, 0.815888, -0.6219398, 1, 1, 1, 1, 1,
0.03400252, -1.152445, 3.49039, 1, 1, 1, 1, 1,
0.03913979, 1.191859, -0.713966, 1, 1, 1, 1, 1,
0.04412283, 1.400599, 0.8408815, 1, 1, 1, 1, 1,
0.04549154, -0.3654004, 3.928294, 1, 1, 1, 1, 1,
0.04766221, 0.6846591, -2.208686, 1, 1, 1, 1, 1,
0.04956526, -1.538706, 3.988551, 1, 1, 1, 1, 1,
0.05231196, -0.197058, 4.227619, 0, 0, 1, 1, 1,
0.05261938, -0.9187196, 5.061326, 1, 0, 0, 1, 1,
0.05466979, 0.652302, -1.653854, 1, 0, 0, 1, 1,
0.05788292, 0.4959897, 0.7912826, 1, 0, 0, 1, 1,
0.06150137, 0.5783582, 0.07716299, 1, 0, 0, 1, 1,
0.06219838, -1.767592, 3.311394, 1, 0, 0, 1, 1,
0.06776695, -0.08420436, 1.648931, 0, 0, 0, 1, 1,
0.07073364, -0.002170498, 0.3471766, 0, 0, 0, 1, 1,
0.07167657, 0.459502, 1.684145, 0, 0, 0, 1, 1,
0.07428065, -0.07379948, -0.09508373, 0, 0, 0, 1, 1,
0.07498573, -2.558556, 0.7763347, 0, 0, 0, 1, 1,
0.07584426, 0.9712306, -0.06621558, 0, 0, 0, 1, 1,
0.07710438, 0.3891056, 1.108746, 0, 0, 0, 1, 1,
0.07776082, -1.07167, 3.203722, 1, 1, 1, 1, 1,
0.07858849, 0.7547308, -0.1902732, 1, 1, 1, 1, 1,
0.07980759, -0.5385441, 5.129852, 1, 1, 1, 1, 1,
0.08387704, 0.1840698, 0.6567546, 1, 1, 1, 1, 1,
0.08670758, -0.3255553, 2.630893, 1, 1, 1, 1, 1,
0.08796354, 0.7145474, 0.7902899, 1, 1, 1, 1, 1,
0.0903898, -1.840162, 2.461321, 1, 1, 1, 1, 1,
0.09076197, 1.172041, 0.5053911, 1, 1, 1, 1, 1,
0.09336266, 0.4086218, 1.222837, 1, 1, 1, 1, 1,
0.09739487, 0.5553226, 0.2979405, 1, 1, 1, 1, 1,
0.1006471, 0.2189953, 0.9028859, 1, 1, 1, 1, 1,
0.1018739, -0.7751224, 3.12742, 1, 1, 1, 1, 1,
0.1026714, 0.05024542, 3.278353, 1, 1, 1, 1, 1,
0.1046094, 0.9758933, 2.110716, 1, 1, 1, 1, 1,
0.1050062, -0.1711178, 2.382324, 1, 1, 1, 1, 1,
0.1074544, 0.2025051, 0.08204776, 0, 0, 1, 1, 1,
0.1095929, -0.6799046, 4.32668, 1, 0, 0, 1, 1,
0.1151549, 0.9016427, 1.294719, 1, 0, 0, 1, 1,
0.1156677, 0.07300311, 1.35734, 1, 0, 0, 1, 1,
0.1157269, -0.4023065, 4.578621, 1, 0, 0, 1, 1,
0.1192606, -0.2841544, 3.075402, 1, 0, 0, 1, 1,
0.1211321, -0.1857299, 3.440213, 0, 0, 0, 1, 1,
0.1215814, -0.8980727, 3.290635, 0, 0, 0, 1, 1,
0.1240308, 0.4754935, 0.1069938, 0, 0, 0, 1, 1,
0.1247432, 0.7769011, 1.733117, 0, 0, 0, 1, 1,
0.1263974, 0.1704943, 0.9337478, 0, 0, 0, 1, 1,
0.1315344, 0.1543266, 1.43538, 0, 0, 0, 1, 1,
0.136069, 0.6416692, -1.413003, 0, 0, 0, 1, 1,
0.1386037, -1.681625, 2.13058, 1, 1, 1, 1, 1,
0.1388466, 1.374712, 0.4761044, 1, 1, 1, 1, 1,
0.1393074, -0.6738871, 1.805523, 1, 1, 1, 1, 1,
0.1407809, 0.3751277, 1.484645, 1, 1, 1, 1, 1,
0.1553827, -2.116724, 3.219198, 1, 1, 1, 1, 1,
0.1564269, 1.462876, 3.240821, 1, 1, 1, 1, 1,
0.1571775, 2.242512, 1.198673, 1, 1, 1, 1, 1,
0.1574122, 0.7574249, -0.1877659, 1, 1, 1, 1, 1,
0.1581592, 0.6469853, 0.5970247, 1, 1, 1, 1, 1,
0.163763, 0.8795141, -0.4738925, 1, 1, 1, 1, 1,
0.1713533, -0.3722729, 1.951188, 1, 1, 1, 1, 1,
0.17709, -0.1755145, 2.18567, 1, 1, 1, 1, 1,
0.1775271, 1.271152, -2.240897, 1, 1, 1, 1, 1,
0.1782846, -0.08966213, 0.8971363, 1, 1, 1, 1, 1,
0.1790799, -0.2756641, 1.46258, 1, 1, 1, 1, 1,
0.1813817, 1.271599, 0.504086, 0, 0, 1, 1, 1,
0.1837286, 2.550882, -0.4055598, 1, 0, 0, 1, 1,
0.1841002, -2.28288, 3.32778, 1, 0, 0, 1, 1,
0.1847569, -0.02204627, 0.2099097, 1, 0, 0, 1, 1,
0.1847913, -1.675132, 3.363019, 1, 0, 0, 1, 1,
0.185789, -0.2617559, 2.155277, 1, 0, 0, 1, 1,
0.185901, -0.4709475, 3.002362, 0, 0, 0, 1, 1,
0.1902013, 0.3486484, 1.192989, 0, 0, 0, 1, 1,
0.190476, -0.5686497, 3.12363, 0, 0, 0, 1, 1,
0.1930252, -0.6054226, 2.997406, 0, 0, 0, 1, 1,
0.1999085, -1.790342, 1.924881, 0, 0, 0, 1, 1,
0.2044057, -1.05473, 3.775903, 0, 0, 0, 1, 1,
0.2048924, 0.3128217, -0.6842138, 0, 0, 0, 1, 1,
0.2051226, -0.6851782, 5.355953, 1, 1, 1, 1, 1,
0.2056905, 1.314352, 1.362867, 1, 1, 1, 1, 1,
0.2089634, -0.2557432, 2.410375, 1, 1, 1, 1, 1,
0.2212617, -1.346318, 3.6001, 1, 1, 1, 1, 1,
0.2241905, 0.8613304, 1.004112, 1, 1, 1, 1, 1,
0.2338341, 0.19222, 2.813112, 1, 1, 1, 1, 1,
0.2348295, -2.127182, 2.551763, 1, 1, 1, 1, 1,
0.2369888, 0.2520008, 0.7891362, 1, 1, 1, 1, 1,
0.2420818, 1.298687, 2.133441, 1, 1, 1, 1, 1,
0.2468679, -0.8333223, 1.7399, 1, 1, 1, 1, 1,
0.2475558, 0.9634808, -0.2482061, 1, 1, 1, 1, 1,
0.2511028, -0.1469358, 3.384643, 1, 1, 1, 1, 1,
0.2527962, -0.7486718, 3.334809, 1, 1, 1, 1, 1,
0.2552028, 0.6720699, -1.272557, 1, 1, 1, 1, 1,
0.2564608, 1.318279, 1.337031, 1, 1, 1, 1, 1,
0.2602695, 0.2914396, 1.390608, 0, 0, 1, 1, 1,
0.261142, 0.6194944, 0.5134166, 1, 0, 0, 1, 1,
0.2667434, 2.055495, 2.020981, 1, 0, 0, 1, 1,
0.2674733, 0.2183584, 1.492968, 1, 0, 0, 1, 1,
0.2682047, -0.5129116, 2.076089, 1, 0, 0, 1, 1,
0.2704403, 1.175714, 0.01374308, 1, 0, 0, 1, 1,
0.2758221, 0.6647518, 0.941922, 0, 0, 0, 1, 1,
0.2759809, 1.076392, -0.08032195, 0, 0, 0, 1, 1,
0.2795754, -0.5667317, 2.637901, 0, 0, 0, 1, 1,
0.2841119, -0.8010652, 3.494014, 0, 0, 0, 1, 1,
0.2877191, -0.9749264, 3.203702, 0, 0, 0, 1, 1,
0.2891902, -1.117667, 2.026718, 0, 0, 0, 1, 1,
0.2976099, 2.003716, 0.5170553, 0, 0, 0, 1, 1,
0.2977522, -0.3078046, 2.296423, 1, 1, 1, 1, 1,
0.3005823, -1.14586, 3.178033, 1, 1, 1, 1, 1,
0.3026304, -1.951482, 3.440862, 1, 1, 1, 1, 1,
0.3056389, -1.059252, 3.531436, 1, 1, 1, 1, 1,
0.3059373, 0.9636959, -0.1252345, 1, 1, 1, 1, 1,
0.3059855, -0.2560712, 2.273956, 1, 1, 1, 1, 1,
0.3079151, -0.5083062, 2.212402, 1, 1, 1, 1, 1,
0.3195777, -0.3381307, 1.649313, 1, 1, 1, 1, 1,
0.3244622, -1.859909, 1.075477, 1, 1, 1, 1, 1,
0.3271414, 0.8868101, -0.5762202, 1, 1, 1, 1, 1,
0.3322076, 0.4439654, 1.575261, 1, 1, 1, 1, 1,
0.3348578, 1.502193, 0.5390204, 1, 1, 1, 1, 1,
0.3356985, -0.9020691, 1.750874, 1, 1, 1, 1, 1,
0.3373623, -1.440062, 2.063847, 1, 1, 1, 1, 1,
0.3374801, -0.6291593, 3.093595, 1, 1, 1, 1, 1,
0.3419651, -1.022143, 2.49028, 0, 0, 1, 1, 1,
0.3424223, -0.6189864, 1.148226, 1, 0, 0, 1, 1,
0.3424665, 1.121767, -0.7459419, 1, 0, 0, 1, 1,
0.3435993, 0.5428169, 1.094248, 1, 0, 0, 1, 1,
0.3452529, 1.062295, 1.962431, 1, 0, 0, 1, 1,
0.3470974, 1.887188, 0.1947522, 1, 0, 0, 1, 1,
0.3474515, -0.6657787, 3.818688, 0, 0, 0, 1, 1,
0.359686, -0.3939265, 1.721999, 0, 0, 0, 1, 1,
0.3614331, -0.9377463, 3.20225, 0, 0, 0, 1, 1,
0.3665573, 1.101483, 0.9045398, 0, 0, 0, 1, 1,
0.3727513, 0.5563035, 1.916996, 0, 0, 0, 1, 1,
0.3755907, -0.07823276, 0.5063629, 0, 0, 0, 1, 1,
0.3759482, 0.8778496, 0.3228451, 0, 0, 0, 1, 1,
0.3780885, 0.2792061, 2.351919, 1, 1, 1, 1, 1,
0.3837137, -0.7490855, 3.281566, 1, 1, 1, 1, 1,
0.3845924, 0.005373882, 2.380659, 1, 1, 1, 1, 1,
0.3875747, -0.09836838, 2.219645, 1, 1, 1, 1, 1,
0.3934381, 0.09347548, -0.0276045, 1, 1, 1, 1, 1,
0.3964631, -1.257954, 3.779195, 1, 1, 1, 1, 1,
0.3967721, 0.7109943, 0.2504087, 1, 1, 1, 1, 1,
0.3987504, -0.1259222, 2.018588, 1, 1, 1, 1, 1,
0.4000551, 0.3455032, -0.06413697, 1, 1, 1, 1, 1,
0.4026039, -0.8730542, 3.209799, 1, 1, 1, 1, 1,
0.40659, -1.619061, 1.535483, 1, 1, 1, 1, 1,
0.4077948, -1.214553, 3.130758, 1, 1, 1, 1, 1,
0.4113031, -0.5118108, 2.717225, 1, 1, 1, 1, 1,
0.4113365, -2.196015, 2.041256, 1, 1, 1, 1, 1,
0.4127162, -1.06043, 1.485161, 1, 1, 1, 1, 1,
0.4143277, -0.2554794, 3.863648, 0, 0, 1, 1, 1,
0.4154131, -0.3539074, 0.6608846, 1, 0, 0, 1, 1,
0.4205054, -0.550848, 2.285652, 1, 0, 0, 1, 1,
0.4222772, -2.158044, 1.989414, 1, 0, 0, 1, 1,
0.4226049, -0.2483025, 1.529065, 1, 0, 0, 1, 1,
0.4233847, -0.1510355, 1.248377, 1, 0, 0, 1, 1,
0.4237027, -1.158684, 3.98003, 0, 0, 0, 1, 1,
0.4257751, 1.340165, 0.2924688, 0, 0, 0, 1, 1,
0.4276557, -0.3335813, 2.398411, 0, 0, 0, 1, 1,
0.4298617, 0.482794, 0.5481912, 0, 0, 0, 1, 1,
0.4345203, -0.7889302, 1.873649, 0, 0, 0, 1, 1,
0.4360223, 1.849369, -0.6919544, 0, 0, 0, 1, 1,
0.4410313, 0.08008102, 1.503673, 0, 0, 0, 1, 1,
0.4411876, 0.7784493, 1.329016, 1, 1, 1, 1, 1,
0.4433244, 2.287834, -0.2540903, 1, 1, 1, 1, 1,
0.4441448, -0.8859257, 3.762264, 1, 1, 1, 1, 1,
0.4462828, 0.4418623, 2.646321, 1, 1, 1, 1, 1,
0.4501154, -1.815128, 3.151971, 1, 1, 1, 1, 1,
0.4540415, -0.8095568, 1.959133, 1, 1, 1, 1, 1,
0.4563757, 0.8638966, 0.8086292, 1, 1, 1, 1, 1,
0.4611467, 1.582091, 0.5431869, 1, 1, 1, 1, 1,
0.4625039, -0.4816179, 1.472574, 1, 1, 1, 1, 1,
0.463234, -1.54125, 2.955331, 1, 1, 1, 1, 1,
0.4643521, -0.5390649, 2.882253, 1, 1, 1, 1, 1,
0.4644924, -0.1521448, 0.5908754, 1, 1, 1, 1, 1,
0.4655284, -0.318335, 2.024478, 1, 1, 1, 1, 1,
0.4672155, 1.024678, 0.7782199, 1, 1, 1, 1, 1,
0.4681042, 0.5321596, 0.2703606, 1, 1, 1, 1, 1,
0.4686598, -0.4437949, 4.221174, 0, 0, 1, 1, 1,
0.4702405, 0.5512532, 0.4127523, 1, 0, 0, 1, 1,
0.471258, -1.126593, 3.104579, 1, 0, 0, 1, 1,
0.4793914, 0.5184025, 1.238428, 1, 0, 0, 1, 1,
0.4831161, -2.132235, 0.2507002, 1, 0, 0, 1, 1,
0.4835317, -1.784617, 1.280078, 1, 0, 0, 1, 1,
0.4888984, -1.113383, 4.030608, 0, 0, 0, 1, 1,
0.4950507, -0.2401314, 3.217368, 0, 0, 0, 1, 1,
0.5000798, -1.617418, 4.449481, 0, 0, 0, 1, 1,
0.5022417, 0.474793, 1.269239, 0, 0, 0, 1, 1,
0.5070815, -0.004533865, 0.6651564, 0, 0, 0, 1, 1,
0.5078628, -0.5568022, 2.037253, 0, 0, 0, 1, 1,
0.5088311, 0.7416356, 0.2887925, 0, 0, 0, 1, 1,
0.5139505, -0.4141306, 2.131356, 1, 1, 1, 1, 1,
0.5154085, 0.3645627, 0.980388, 1, 1, 1, 1, 1,
0.5180929, -1.684522, 2.374051, 1, 1, 1, 1, 1,
0.5223804, -1.576195, 2.45936, 1, 1, 1, 1, 1,
0.5231488, -0.8401242, 1.828123, 1, 1, 1, 1, 1,
0.5236529, 0.5616977, 1.980319, 1, 1, 1, 1, 1,
0.5315859, -0.742642, 2.595237, 1, 1, 1, 1, 1,
0.534716, -0.3794009, 3.734139, 1, 1, 1, 1, 1,
0.5347483, 1.566103, -0.6982926, 1, 1, 1, 1, 1,
0.5355074, 1.172601, 0.9590481, 1, 1, 1, 1, 1,
0.540988, -1.603132, 3.46546, 1, 1, 1, 1, 1,
0.5414112, 0.1788362, 1.086782, 1, 1, 1, 1, 1,
0.5436039, 0.04262203, 2.602844, 1, 1, 1, 1, 1,
0.5519623, 0.6764224, -0.6898358, 1, 1, 1, 1, 1,
0.5539733, 0.1764977, 3.178611, 1, 1, 1, 1, 1,
0.5604354, 0.7711849, 3.010693, 0, 0, 1, 1, 1,
0.5626515, 0.3839063, 1.53263, 1, 0, 0, 1, 1,
0.5643446, -1.927164, 2.934983, 1, 0, 0, 1, 1,
0.576764, -0.9186192, 4.244835, 1, 0, 0, 1, 1,
0.5772207, 1.210074, 0.4079563, 1, 0, 0, 1, 1,
0.5796873, 0.5835219, 1.639019, 1, 0, 0, 1, 1,
0.591283, 0.4048826, -0.08385791, 0, 0, 0, 1, 1,
0.5961928, -0.6936255, 4.218742, 0, 0, 0, 1, 1,
0.6000033, 1.359392, -0.1287933, 0, 0, 0, 1, 1,
0.6114135, 0.7323343, -0.3953367, 0, 0, 0, 1, 1,
0.6155407, -0.1424108, 1.539711, 0, 0, 0, 1, 1,
0.6219054, -0.05080781, 2.144234, 0, 0, 0, 1, 1,
0.6236774, 0.3842907, 1.232188, 0, 0, 0, 1, 1,
0.6246886, -0.1496164, 1.683775, 1, 1, 1, 1, 1,
0.6250294, 0.151064, 1.47754, 1, 1, 1, 1, 1,
0.6298804, 0.7884061, -1.127718, 1, 1, 1, 1, 1,
0.6315295, 1.574233, 0.2729381, 1, 1, 1, 1, 1,
0.6338086, -0.5406626, 1.378488, 1, 1, 1, 1, 1,
0.6338699, 0.3666792, 0.7389089, 1, 1, 1, 1, 1,
0.6344908, -1.044754, 2.200595, 1, 1, 1, 1, 1,
0.6468108, 0.6381238, 1.318159, 1, 1, 1, 1, 1,
0.6558886, 0.1259426, 0.8537306, 1, 1, 1, 1, 1,
0.6562252, -2.205488, 2.635993, 1, 1, 1, 1, 1,
0.6570579, -2.05918, 2.566303, 1, 1, 1, 1, 1,
0.6617767, 0.3209109, 0.3732564, 1, 1, 1, 1, 1,
0.6621433, -1.560138, 3.557332, 1, 1, 1, 1, 1,
0.6643429, 0.04948844, 0.8329315, 1, 1, 1, 1, 1,
0.6643934, 0.2417512, 0.8669631, 1, 1, 1, 1, 1,
0.6673568, -0.3570725, 3.422577, 0, 0, 1, 1, 1,
0.6685455, -0.5771403, 2.65694, 1, 0, 0, 1, 1,
0.6702681, -1.201865, 1.187644, 1, 0, 0, 1, 1,
0.6714612, 0.1511702, 1.809819, 1, 0, 0, 1, 1,
0.6736628, -0.3023035, 3.127676, 1, 0, 0, 1, 1,
0.678901, 0.1665824, -1.004583, 1, 0, 0, 1, 1,
0.6803001, 1.074595, -0.163581, 0, 0, 0, 1, 1,
0.6804453, 0.1122703, 0.8234931, 0, 0, 0, 1, 1,
0.6819713, 0.1915092, 1.961929, 0, 0, 0, 1, 1,
0.6826853, -0.2270049, 1.311536, 0, 0, 0, 1, 1,
0.6837742, 0.6524464, -0.4082946, 0, 0, 0, 1, 1,
0.687678, 1.173761, -1.126905, 0, 0, 0, 1, 1,
0.6934345, 0.7974809, -0.3786919, 0, 0, 0, 1, 1,
0.6937449, -1.029456, 1.724907, 1, 1, 1, 1, 1,
0.7049257, 0.3821986, 0.3366004, 1, 1, 1, 1, 1,
0.7060099, 1.246985, 1.192905, 1, 1, 1, 1, 1,
0.7122404, -0.8869311, 3.866779, 1, 1, 1, 1, 1,
0.7137633, -0.1337652, 2.626063, 1, 1, 1, 1, 1,
0.7207076, 0.8008373, 0.2449253, 1, 1, 1, 1, 1,
0.7224759, 0.7769133, 1.121947, 1, 1, 1, 1, 1,
0.7238562, 0.7040219, -0.7294674, 1, 1, 1, 1, 1,
0.7243488, -0.98387, 3.461492, 1, 1, 1, 1, 1,
0.7312394, 0.03618741, 1.949442, 1, 1, 1, 1, 1,
0.7423217, -1.938155, 0.9345734, 1, 1, 1, 1, 1,
0.7449316, 1.858437, -0.003975037, 1, 1, 1, 1, 1,
0.7504475, 0.5027267, 0.794215, 1, 1, 1, 1, 1,
0.7508382, -0.652655, 1.492345, 1, 1, 1, 1, 1,
0.755519, -1.190968, 3.176759, 1, 1, 1, 1, 1,
0.7571463, -0.4552783, 1.573969, 0, 0, 1, 1, 1,
0.7581162, 0.1758116, 0.6899647, 1, 0, 0, 1, 1,
0.7592577, 1.24791, 0.3654795, 1, 0, 0, 1, 1,
0.7688708, -1.738328, 2.598755, 1, 0, 0, 1, 1,
0.7743762, 0.8391379, 1.028265, 1, 0, 0, 1, 1,
0.7788199, 0.9748755, 0.2340664, 1, 0, 0, 1, 1,
0.7812414, 1.038712, -0.03510222, 0, 0, 0, 1, 1,
0.7823446, -0.3905675, 3.424004, 0, 0, 0, 1, 1,
0.7830901, 0.8401845, 1.599101, 0, 0, 0, 1, 1,
0.7890413, -0.4162227, 1.495525, 0, 0, 0, 1, 1,
0.7938051, -1.26549, 2.75652, 0, 0, 0, 1, 1,
0.7976957, 0.9963903, 0.09674889, 0, 0, 0, 1, 1,
0.8031486, 0.2444959, 0.7998932, 0, 0, 0, 1, 1,
0.8061136, -0.7997052, 3.338941, 1, 1, 1, 1, 1,
0.8099964, 1.962665, 0.5532896, 1, 1, 1, 1, 1,
0.8123994, 0.4096199, -0.5806828, 1, 1, 1, 1, 1,
0.8195474, -0.3723449, 1.42851, 1, 1, 1, 1, 1,
0.8210645, -1.037974, 3.522575, 1, 1, 1, 1, 1,
0.8247223, -0.7753996, 2.385372, 1, 1, 1, 1, 1,
0.8253283, 0.4081424, 0.6783347, 1, 1, 1, 1, 1,
0.8314435, -1.654517, 2.571465, 1, 1, 1, 1, 1,
0.8413907, 0.6012991, -0.5865849, 1, 1, 1, 1, 1,
0.8484519, 1.477282, 0.7609943, 1, 1, 1, 1, 1,
0.8527192, 0.1322872, 2.289901, 1, 1, 1, 1, 1,
0.8561818, -0.1466097, 0.60017, 1, 1, 1, 1, 1,
0.8570883, 1.678509, 0.3762496, 1, 1, 1, 1, 1,
0.8715049, -0.6499811, 2.700418, 1, 1, 1, 1, 1,
0.878249, -0.5763434, 1.260786, 1, 1, 1, 1, 1,
0.8790883, -1.468827, 2.505012, 0, 0, 1, 1, 1,
0.8791521, 2.26198, 0.459751, 1, 0, 0, 1, 1,
0.8802043, -1.587248, 2.827488, 1, 0, 0, 1, 1,
0.8811627, 1.804351, 0.8261545, 1, 0, 0, 1, 1,
0.8864264, -0.3460413, 2.837516, 1, 0, 0, 1, 1,
0.8887253, -1.408569, 3.368828, 1, 0, 0, 1, 1,
0.895255, -0.5070487, 2.839096, 0, 0, 0, 1, 1,
0.8959225, -1.285687, 2.282711, 0, 0, 0, 1, 1,
0.8992246, -0.123662, 1.06391, 0, 0, 0, 1, 1,
0.9034126, -0.2711652, 3.179041, 0, 0, 0, 1, 1,
0.9042742, -0.5534876, 2.929275, 0, 0, 0, 1, 1,
0.9072844, -0.4063458, 2.655722, 0, 0, 0, 1, 1,
0.9084328, 0.8456236, 0.8311817, 0, 0, 0, 1, 1,
0.909861, -2.364493, 2.697219, 1, 1, 1, 1, 1,
0.920065, -0.001038843, 1.865536, 1, 1, 1, 1, 1,
0.9206246, 0.4276817, -0.2571585, 1, 1, 1, 1, 1,
0.9226307, -0.6481874, 2.341585, 1, 1, 1, 1, 1,
0.9249362, -0.6024498, 1.838894, 1, 1, 1, 1, 1,
0.9277796, 0.4008234, 0.5671819, 1, 1, 1, 1, 1,
0.9369768, 0.945701, 1.125875, 1, 1, 1, 1, 1,
0.9396023, 0.3952799, 1.912772, 1, 1, 1, 1, 1,
0.940432, -0.03925273, 2.366631, 1, 1, 1, 1, 1,
0.9438804, 0.6633837, 0.2740652, 1, 1, 1, 1, 1,
0.9503866, 0.459188, 1.364928, 1, 1, 1, 1, 1,
0.9509867, -0.7223911, 2.347821, 1, 1, 1, 1, 1,
0.9608487, 1.264573, 1.419958, 1, 1, 1, 1, 1,
0.9628009, -0.4209878, 2.28225, 1, 1, 1, 1, 1,
0.9695775, -0.04830097, 1.55651, 1, 1, 1, 1, 1,
0.9706427, 1.269557, -1.486638, 0, 0, 1, 1, 1,
0.9736923, 1.500373, 0.3466502, 1, 0, 0, 1, 1,
0.974744, -0.6282635, 1.984986, 1, 0, 0, 1, 1,
0.9823726, 0.956197, 1.694302, 1, 0, 0, 1, 1,
0.984678, -0.1660344, 1.483613, 1, 0, 0, 1, 1,
0.987638, -0.9855378, 1.708747, 1, 0, 0, 1, 1,
0.9892094, 1.362733, 1.382845, 0, 0, 0, 1, 1,
0.990478, 1.329486, -0.08307731, 0, 0, 0, 1, 1,
0.9934026, -0.7727971, 1.751155, 0, 0, 0, 1, 1,
0.9956089, -0.03056229, 1.404194, 0, 0, 0, 1, 1,
1.001435, 1.361308, 0.02616619, 0, 0, 0, 1, 1,
1.018989, -0.0152542, 2.039772, 0, 0, 0, 1, 1,
1.019519, -2.717228, 1.810324, 0, 0, 0, 1, 1,
1.026372, -0.5036327, 1.830061, 1, 1, 1, 1, 1,
1.026861, 0.2076655, -0.7396725, 1, 1, 1, 1, 1,
1.028661, -2.234918, 2.943204, 1, 1, 1, 1, 1,
1.043608, 0.6482926, 0.8371647, 1, 1, 1, 1, 1,
1.060745, 0.2695646, 1.789499, 1, 1, 1, 1, 1,
1.062497, 0.4822524, 0.4684382, 1, 1, 1, 1, 1,
1.06896, 0.1993112, -0.3211797, 1, 1, 1, 1, 1,
1.069584, -0.008667388, 1.720584, 1, 1, 1, 1, 1,
1.074643, 1.417366, 0.8677596, 1, 1, 1, 1, 1,
1.074945, 1.448912, 0.8356254, 1, 1, 1, 1, 1,
1.090064, 0.02586947, 0.4857149, 1, 1, 1, 1, 1,
1.096207, 1.382949, 1.100175, 1, 1, 1, 1, 1,
1.100269, 0.7072401, 1.93317, 1, 1, 1, 1, 1,
1.109398, -0.6365104, -0.673183, 1, 1, 1, 1, 1,
1.110015, 0.8591381, 1.341727, 1, 1, 1, 1, 1,
1.110247, 0.627561, -0.1054917, 0, 0, 1, 1, 1,
1.115615, -0.3700271, 0.5536965, 1, 0, 0, 1, 1,
1.117159, -1.213002, 3.355892, 1, 0, 0, 1, 1,
1.120154, -0.3675177, 2.150655, 1, 0, 0, 1, 1,
1.125876, -0.968266, 1.584604, 1, 0, 0, 1, 1,
1.128315, 0.4030324, 1.893871, 1, 0, 0, 1, 1,
1.128564, 0.1054594, 1.690787, 0, 0, 0, 1, 1,
1.133927, -0.3652605, 2.352371, 0, 0, 0, 1, 1,
1.137059, 0.917551, 0.669367, 0, 0, 0, 1, 1,
1.141351, -0.3772837, 1.162277, 0, 0, 0, 1, 1,
1.142204, -0.2706738, 3.651325, 0, 0, 0, 1, 1,
1.159734, 1.173012, 1.645842, 0, 0, 0, 1, 1,
1.16704, 0.2814091, 1.358296, 0, 0, 0, 1, 1,
1.167139, 1.004228, 1.297218, 1, 1, 1, 1, 1,
1.16773, -0.5215167, 0.722669, 1, 1, 1, 1, 1,
1.168838, 0.007248748, 0.5871882, 1, 1, 1, 1, 1,
1.170336, 1.406602, 1.075757, 1, 1, 1, 1, 1,
1.171832, 0.8000993, 1.168088, 1, 1, 1, 1, 1,
1.174224, -1.527324, 2.995124, 1, 1, 1, 1, 1,
1.174385, -0.270353, 2.676598, 1, 1, 1, 1, 1,
1.174546, 0.9111087, -0.4646282, 1, 1, 1, 1, 1,
1.177372, -2.728915, 2.009181, 1, 1, 1, 1, 1,
1.180753, -0.5073071, 3.790302, 1, 1, 1, 1, 1,
1.183175, 0.5066471, 1.566641, 1, 1, 1, 1, 1,
1.187704, 1.500306, 1.101795, 1, 1, 1, 1, 1,
1.205546, 0.3347695, 2.20746, 1, 1, 1, 1, 1,
1.214622, -0.563843, 3.031438, 1, 1, 1, 1, 1,
1.21623, 0.3941249, 0.3849564, 1, 1, 1, 1, 1,
1.222009, 0.7001597, -0.01287974, 0, 0, 1, 1, 1,
1.222564, 0.0008369609, 2.412012, 1, 0, 0, 1, 1,
1.230724, 0.7404622, 2.847981, 1, 0, 0, 1, 1,
1.233509, 1.365377, -1.553086, 1, 0, 0, 1, 1,
1.239568, 1.859658, 1.132642, 1, 0, 0, 1, 1,
1.241952, 0.1159448, 3.331307, 1, 0, 0, 1, 1,
1.254126, -1.886278, 2.355222, 0, 0, 0, 1, 1,
1.275617, 1.134873, 1.313909, 0, 0, 0, 1, 1,
1.28009, -0.08045137, 2.329116, 0, 0, 0, 1, 1,
1.29474, -0.725306, 1.779073, 0, 0, 0, 1, 1,
1.297356, 1.987087, 1.064424, 0, 0, 0, 1, 1,
1.300907, 1.297495, -0.5537696, 0, 0, 0, 1, 1,
1.305319, -0.009140037, 3.003865, 0, 0, 0, 1, 1,
1.308679, 0.5884445, 1.97997, 1, 1, 1, 1, 1,
1.311186, 0.2432399, 2.134533, 1, 1, 1, 1, 1,
1.316422, 0.724463, 2.27438, 1, 1, 1, 1, 1,
1.325916, 0.04345242, 1.787436, 1, 1, 1, 1, 1,
1.327311, -0.09868973, 2.028452, 1, 1, 1, 1, 1,
1.330079, -2.397543, 3.34725, 1, 1, 1, 1, 1,
1.334743, 0.9723622, -0.04432692, 1, 1, 1, 1, 1,
1.339835, 0.8177228, 3.024735, 1, 1, 1, 1, 1,
1.341124, 0.5011041, 1.396465, 1, 1, 1, 1, 1,
1.342535, 0.8796039, -0.7692879, 1, 1, 1, 1, 1,
1.355595, -1.457798, 1.030301, 1, 1, 1, 1, 1,
1.35626, 0.07188102, 1.494871, 1, 1, 1, 1, 1,
1.358661, 0.7822372, 0.1063334, 1, 1, 1, 1, 1,
1.360945, -1.068014, 3.462926, 1, 1, 1, 1, 1,
1.361508, 1.027005, 0.3589392, 1, 1, 1, 1, 1,
1.36175, 0.9048986, 0.5709289, 0, 0, 1, 1, 1,
1.366059, -1.733385, 1.498487, 1, 0, 0, 1, 1,
1.369107, -1.980307, 3.303471, 1, 0, 0, 1, 1,
1.372233, -0.3368529, 1.311658, 1, 0, 0, 1, 1,
1.379493, -0.827403, 1.920421, 1, 0, 0, 1, 1,
1.381075, 0.5332144, 1.066267, 1, 0, 0, 1, 1,
1.381907, -0.6554386, 2.657129, 0, 0, 0, 1, 1,
1.395658, -0.5000221, 2.144161, 0, 0, 0, 1, 1,
1.397905, -1.175748, 2.019756, 0, 0, 0, 1, 1,
1.415604, -0.1912886, 0.892289, 0, 0, 0, 1, 1,
1.425057, 0.9461919, -0.05535157, 0, 0, 0, 1, 1,
1.425596, 1.246186, 2.583732, 0, 0, 0, 1, 1,
1.426179, -1.959872, 1.713177, 0, 0, 0, 1, 1,
1.426302, 0.9138633, -0.4613186, 1, 1, 1, 1, 1,
1.435444, -0.7954427, 3.673594, 1, 1, 1, 1, 1,
1.439888, 0.1426013, 0.4986118, 1, 1, 1, 1, 1,
1.444228, 0.2272487, 0.9844402, 1, 1, 1, 1, 1,
1.446445, 1.536086, -1.394685, 1, 1, 1, 1, 1,
1.447717, 0.2604797, 1.090437, 1, 1, 1, 1, 1,
1.454359, -0.8049327, 2.718027, 1, 1, 1, 1, 1,
1.455454, 0.3414855, 0.003828056, 1, 1, 1, 1, 1,
1.463247, 0.1479421, 1.583454, 1, 1, 1, 1, 1,
1.464927, -0.8414416, 3.029534, 1, 1, 1, 1, 1,
1.477009, 1.157035, 0.5378298, 1, 1, 1, 1, 1,
1.482056, -1.058498, 3.186946, 1, 1, 1, 1, 1,
1.483491, -1.315316, 0.2005512, 1, 1, 1, 1, 1,
1.490945, -1.322248, 1.19339, 1, 1, 1, 1, 1,
1.497705, -0.767302, 0.3975697, 1, 1, 1, 1, 1,
1.499852, 0.6294495, 0.1627337, 0, 0, 1, 1, 1,
1.51237, -1.911126, 3.579186, 1, 0, 0, 1, 1,
1.51369, -0.9020824, 2.054881, 1, 0, 0, 1, 1,
1.520515, -0.3385047, 1.322508, 1, 0, 0, 1, 1,
1.522149, 0.3106796, 0.771473, 1, 0, 0, 1, 1,
1.530475, 0.4831339, 0.8372599, 1, 0, 0, 1, 1,
1.534774, 0.3830672, 3.341615, 0, 0, 0, 1, 1,
1.55016, -0.1222211, 2.554767, 0, 0, 0, 1, 1,
1.562378, -0.6295548, 2.054639, 0, 0, 0, 1, 1,
1.568012, -0.7122176, 2.801161, 0, 0, 0, 1, 1,
1.570062, 0.7061342, -0.8444713, 0, 0, 0, 1, 1,
1.57216, -0.03758815, 1.353093, 0, 0, 0, 1, 1,
1.573751, -0.3356259, 1.610964, 0, 0, 0, 1, 1,
1.574983, -0.2809242, 1.063151, 1, 1, 1, 1, 1,
1.585802, -0.1797931, 1.87899, 1, 1, 1, 1, 1,
1.589774, -0.2341324, 2.143911, 1, 1, 1, 1, 1,
1.590142, -1.018646, -0.1235426, 1, 1, 1, 1, 1,
1.59312, -0.3243614, 1.619844, 1, 1, 1, 1, 1,
1.594338, -0.1336608, 1.183127, 1, 1, 1, 1, 1,
1.610462, 0.7866873, 2.795511, 1, 1, 1, 1, 1,
1.642016, 0.0715827, 1.168488, 1, 1, 1, 1, 1,
1.650863, 1.409918, 1.818183, 1, 1, 1, 1, 1,
1.674517, -0.1602228, 2.352626, 1, 1, 1, 1, 1,
1.676445, -0.9536472, 1.105304, 1, 1, 1, 1, 1,
1.681357, 0.4499782, 2.62958, 1, 1, 1, 1, 1,
1.683177, -0.8204942, 2.462653, 1, 1, 1, 1, 1,
1.692776, -0.6262229, 1.58283, 1, 1, 1, 1, 1,
1.707703, -0.1953851, 0.2361611, 1, 1, 1, 1, 1,
1.720004, 1.580087, 1.248851, 0, 0, 1, 1, 1,
1.724819, -1.540159, 2.027794, 1, 0, 0, 1, 1,
1.736073, -1.067006, 2.731298, 1, 0, 0, 1, 1,
1.77195, 0.08590345, 2.864118, 1, 0, 0, 1, 1,
1.777274, 0.5836321, 1.932694, 1, 0, 0, 1, 1,
1.77773, -0.5322177, 0.2743324, 1, 0, 0, 1, 1,
1.779887, -0.2924018, 0.4365593, 0, 0, 0, 1, 1,
1.785284, 0.8940969, 2.078091, 0, 0, 0, 1, 1,
1.794212, 0.1144789, 3.096841, 0, 0, 0, 1, 1,
1.800548, -0.9822824, 0.2277817, 0, 0, 0, 1, 1,
1.80478, 1.362765, 0.5644083, 0, 0, 0, 1, 1,
1.819525, 1.446202, 1.163791, 0, 0, 0, 1, 1,
1.836405, 1.599405, 1.7709, 0, 0, 0, 1, 1,
1.840448, 0.2736188, 1.77067, 1, 1, 1, 1, 1,
1.902929, 0.597159, 1.184311, 1, 1, 1, 1, 1,
2.012279, 2.140869, 1.114477, 1, 1, 1, 1, 1,
2.01507, -1.345677, 2.417675, 1, 1, 1, 1, 1,
2.034172, 2.828218, 0.11143, 1, 1, 1, 1, 1,
2.041643, -0.5379526, 0.4670129, 1, 1, 1, 1, 1,
2.057143, 1.705907, 1.071951, 1, 1, 1, 1, 1,
2.059718, -1.000718, 2.388457, 1, 1, 1, 1, 1,
2.092091, -0.7729966, 1.606862, 1, 1, 1, 1, 1,
2.095104, 1.887974, 0.2888022, 1, 1, 1, 1, 1,
2.100023, -0.5752918, 2.971756, 1, 1, 1, 1, 1,
2.11476, -0.46802, 1.791914, 1, 1, 1, 1, 1,
2.114856, 0.6504178, -0.08486218, 1, 1, 1, 1, 1,
2.137119, -0.6439083, 2.259476, 1, 1, 1, 1, 1,
2.151062, -1.156902, 1.298946, 1, 1, 1, 1, 1,
2.158397, -0.7883447, 2.048105, 0, 0, 1, 1, 1,
2.190174, 0.9380381, 1.195779, 1, 0, 0, 1, 1,
2.219778, -1.591558, 2.424719, 1, 0, 0, 1, 1,
2.286966, -1.502205, 3.091674, 1, 0, 0, 1, 1,
2.291528, 1.545265, -0.1541235, 1, 0, 0, 1, 1,
2.446586, 0.3200082, 1.460883, 1, 0, 0, 1, 1,
2.495423, -0.6818027, 0.771872, 0, 0, 0, 1, 1,
2.621574, -1.909523, 1.655126, 0, 0, 0, 1, 1,
2.682303, 0.5915011, 1.660996, 0, 0, 0, 1, 1,
2.753464, -0.1873451, 1.881467, 0, 0, 0, 1, 1,
2.757197, -0.2318891, 1.762664, 0, 0, 0, 1, 1,
2.816885, 0.4483672, 1.637776, 0, 0, 0, 1, 1,
2.828959, 0.2003962, 1.209501, 0, 0, 0, 1, 1,
2.886154, -0.1786498, 1.387449, 1, 1, 1, 1, 1,
2.902481, -0.998449, 3.140802, 1, 1, 1, 1, 1,
3.119729, 0.7576299, -1.520365, 1, 1, 1, 1, 1,
3.150402, -2.315515, 1.25438, 1, 1, 1, 1, 1,
3.176008, 0.3131426, 2.198826, 1, 1, 1, 1, 1,
3.306985, 0.2442745, 1.24163, 1, 1, 1, 1, 1,
3.332103, -0.5809798, 2.004307, 1, 1, 1, 1, 1
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
var radius = 9.686101;
var distance = 34.02202;
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
mvMatrix.translate( -0.06056499, -0.08386362, 0.3339145 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.02202);
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
