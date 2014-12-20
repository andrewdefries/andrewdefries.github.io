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
-3.580864, 0.976168, -1.273604, 1, 0, 0, 1,
-2.611722, -0.1709152, -2.264314, 1, 0.007843138, 0, 1,
-2.555437, -1.692208, -1.497457, 1, 0.01176471, 0, 1,
-2.447966, 0.2544635, -1.015632, 1, 0.01960784, 0, 1,
-2.428082, 1.017219, 0.04919074, 1, 0.02352941, 0, 1,
-2.427061, 0.7711151, -1.374892, 1, 0.03137255, 0, 1,
-2.395365, 1.31367, -1.211928, 1, 0.03529412, 0, 1,
-2.375334, 0.2513145, -1.647097, 1, 0.04313726, 0, 1,
-2.369652, 0.1592076, -1.148449, 1, 0.04705882, 0, 1,
-2.351917, -0.7609258, -3.196217, 1, 0.05490196, 0, 1,
-2.258081, 0.865755, 0.05754993, 1, 0.05882353, 0, 1,
-2.237357, 0.06771257, -1.177976, 1, 0.06666667, 0, 1,
-2.17259, 0.03745712, -3.135734, 1, 0.07058824, 0, 1,
-2.162501, 0.2493938, -1.110254, 1, 0.07843138, 0, 1,
-2.055183, -1.745888, -3.217093, 1, 0.08235294, 0, 1,
-2.027786, -0.1191503, -0.9920885, 1, 0.09019608, 0, 1,
-2.00932, -1.000834, -3.801779, 1, 0.09411765, 0, 1,
-1.983651, -0.1832831, -1.738699, 1, 0.1019608, 0, 1,
-1.959828, -1.848425, -2.567995, 1, 0.1098039, 0, 1,
-1.951901, -1.553427, -2.587475, 1, 0.1137255, 0, 1,
-1.937622, 0.7205045, 0.1126341, 1, 0.1215686, 0, 1,
-1.928046, -0.5134608, -1.352284, 1, 0.1254902, 0, 1,
-1.927431, 0.04757532, -2.064534, 1, 0.1333333, 0, 1,
-1.925364, 0.3339021, -2.388643, 1, 0.1372549, 0, 1,
-1.913424, -0.4990671, 0.1326281, 1, 0.145098, 0, 1,
-1.913054, -0.9136852, -2.23814, 1, 0.1490196, 0, 1,
-1.905552, -0.2125749, -2.664051, 1, 0.1568628, 0, 1,
-1.898943, 1.688494, -2.095547, 1, 0.1607843, 0, 1,
-1.897777, -1.807027, -2.398726, 1, 0.1686275, 0, 1,
-1.888018, 0.3060622, -1.143816, 1, 0.172549, 0, 1,
-1.885219, 0.4921181, -1.618926, 1, 0.1803922, 0, 1,
-1.884954, -0.4378971, -0.7116303, 1, 0.1843137, 0, 1,
-1.884248, 0.2822652, -2.233289, 1, 0.1921569, 0, 1,
-1.856044, 1.803849, -2.406927, 1, 0.1960784, 0, 1,
-1.854351, 1.460008, -1.121806, 1, 0.2039216, 0, 1,
-1.826792, -1.51632, -2.928221, 1, 0.2117647, 0, 1,
-1.780496, -0.1438618, -2.888176, 1, 0.2156863, 0, 1,
-1.778615, -2.032653, -2.197983, 1, 0.2235294, 0, 1,
-1.770858, 0.9954911, -0.1521245, 1, 0.227451, 0, 1,
-1.761519, -0.5152279, -1.861423, 1, 0.2352941, 0, 1,
-1.758998, -0.5233122, -2.465387, 1, 0.2392157, 0, 1,
-1.747183, 0.5883956, -1.90148, 1, 0.2470588, 0, 1,
-1.745598, 0.9806148, -1.983001, 1, 0.2509804, 0, 1,
-1.731602, -1.364888, -1.566307, 1, 0.2588235, 0, 1,
-1.727685, 0.9260077, 0.504654, 1, 0.2627451, 0, 1,
-1.72208, -0.74056, -3.335938, 1, 0.2705882, 0, 1,
-1.715272, 1.150283, -0.9080361, 1, 0.2745098, 0, 1,
-1.702378, 0.1643249, -2.822417, 1, 0.282353, 0, 1,
-1.694058, -0.001280291, -1.972879, 1, 0.2862745, 0, 1,
-1.669841, -1.751816, -2.542307, 1, 0.2941177, 0, 1,
-1.663313, 2.06807, -0.7863466, 1, 0.3019608, 0, 1,
-1.659036, -0.01710273, -1.757331, 1, 0.3058824, 0, 1,
-1.646426, -1.191363, -1.340816, 1, 0.3137255, 0, 1,
-1.644035, -2.23972, -0.2732539, 1, 0.3176471, 0, 1,
-1.641342, 0.4640545, -1.562844, 1, 0.3254902, 0, 1,
-1.621055, -1.459478, -2.537557, 1, 0.3294118, 0, 1,
-1.606045, -1.131297, -2.911814, 1, 0.3372549, 0, 1,
-1.603802, 0.2387948, -2.774091, 1, 0.3411765, 0, 1,
-1.589534, 0.3729784, -0.05782279, 1, 0.3490196, 0, 1,
-1.55896, -0.5071303, -1.19703, 1, 0.3529412, 0, 1,
-1.556255, -0.6002759, -1.931418, 1, 0.3607843, 0, 1,
-1.553645, -0.4512337, -3.615103, 1, 0.3647059, 0, 1,
-1.544514, -0.4666587, -0.6996536, 1, 0.372549, 0, 1,
-1.529378, -1.061538, -0.9022108, 1, 0.3764706, 0, 1,
-1.528966, 1.007292, 0.1659686, 1, 0.3843137, 0, 1,
-1.528768, 0.6221679, -0.881664, 1, 0.3882353, 0, 1,
-1.521031, 0.1509171, -0.890752, 1, 0.3960784, 0, 1,
-1.519048, 0.7747126, -0.2174949, 1, 0.4039216, 0, 1,
-1.513265, -0.6893337, -2.031844, 1, 0.4078431, 0, 1,
-1.509345, -0.1748849, -1.731148, 1, 0.4156863, 0, 1,
-1.495351, -0.7915293, -0.8630818, 1, 0.4196078, 0, 1,
-1.490488, -0.6122047, -1.348054, 1, 0.427451, 0, 1,
-1.482478, 0.7259843, -0.9310966, 1, 0.4313726, 0, 1,
-1.4777, 1.447632, -0.1249223, 1, 0.4392157, 0, 1,
-1.477231, 0.3984017, -1.087968, 1, 0.4431373, 0, 1,
-1.463922, 1.207558, -1.12926, 1, 0.4509804, 0, 1,
-1.453373, 1.016441, -3.090899, 1, 0.454902, 0, 1,
-1.445329, 0.5996, -1.441575, 1, 0.4627451, 0, 1,
-1.434456, -0.3335372, -1.674142, 1, 0.4666667, 0, 1,
-1.433456, -0.6441454, -2.095711, 1, 0.4745098, 0, 1,
-1.432293, -0.4216897, -2.252735, 1, 0.4784314, 0, 1,
-1.427678, 1.489944, -1.6502, 1, 0.4862745, 0, 1,
-1.424167, 0.2973819, 0.3748975, 1, 0.4901961, 0, 1,
-1.421084, -1.697223, -2.510037, 1, 0.4980392, 0, 1,
-1.41292, 0.7833619, 0.4137439, 1, 0.5058824, 0, 1,
-1.412813, -0.650683, -2.780591, 1, 0.509804, 0, 1,
-1.401172, -0.5315744, -1.382898, 1, 0.5176471, 0, 1,
-1.390536, -0.4661239, -0.9382371, 1, 0.5215687, 0, 1,
-1.390073, 0.8421074, -0.9148337, 1, 0.5294118, 0, 1,
-1.364217, -0.5403365, -2.686411, 1, 0.5333334, 0, 1,
-1.356135, -0.318633, -1.72921, 1, 0.5411765, 0, 1,
-1.350313, 0.1553688, -2.849443, 1, 0.5450981, 0, 1,
-1.331043, -0.3698903, -0.6762385, 1, 0.5529412, 0, 1,
-1.327824, 1.898814, 0.2007914, 1, 0.5568628, 0, 1,
-1.326312, 0.4806011, -2.645059, 1, 0.5647059, 0, 1,
-1.320507, -0.6209175, -4.105526, 1, 0.5686275, 0, 1,
-1.308072, -1.001779, -1.704223, 1, 0.5764706, 0, 1,
-1.306052, 0.1023387, -1.943713, 1, 0.5803922, 0, 1,
-1.305265, -2.926786, -1.072443, 1, 0.5882353, 0, 1,
-1.299827, -1.356286, -3.514342, 1, 0.5921569, 0, 1,
-1.299123, 1.544239, 1.687643, 1, 0.6, 0, 1,
-1.290585, 0.3582729, -1.739241, 1, 0.6078432, 0, 1,
-1.288748, -0.394327, -1.13196, 1, 0.6117647, 0, 1,
-1.288168, 1.366477, -0.1722538, 1, 0.6196079, 0, 1,
-1.279041, 0.6059394, -1.091286, 1, 0.6235294, 0, 1,
-1.274325, -0.9737893, -2.622387, 1, 0.6313726, 0, 1,
-1.271809, -0.9020904, -3.069037, 1, 0.6352941, 0, 1,
-1.269139, -1.574239, -1.656481, 1, 0.6431373, 0, 1,
-1.265786, 0.7020437, -0.1687077, 1, 0.6470588, 0, 1,
-1.2603, 0.6917489, -2.218484, 1, 0.654902, 0, 1,
-1.257987, 0.1571832, -1.897122, 1, 0.6588235, 0, 1,
-1.252516, -0.7076163, -3.40768, 1, 0.6666667, 0, 1,
-1.249742, 0.3402563, -1.066821, 1, 0.6705883, 0, 1,
-1.248625, -0.6158239, -2.853098, 1, 0.6784314, 0, 1,
-1.233146, 0.4079401, -0.3390833, 1, 0.682353, 0, 1,
-1.227666, 0.8241628, -0.7413284, 1, 0.6901961, 0, 1,
-1.226648, 1.053029, -3.10208, 1, 0.6941177, 0, 1,
-1.226358, -0.8373587, -2.7477, 1, 0.7019608, 0, 1,
-1.224933, 1.025773, -0.3259567, 1, 0.7098039, 0, 1,
-1.217109, 0.1267323, -1.645048, 1, 0.7137255, 0, 1,
-1.213664, 0.600244, -0.3263864, 1, 0.7215686, 0, 1,
-1.20858, 1.537086, -2.503603, 1, 0.7254902, 0, 1,
-1.198632, -1.197464, -3.601445, 1, 0.7333333, 0, 1,
-1.191577, -0.4179189, -2.617675, 1, 0.7372549, 0, 1,
-1.185467, -0.6735368, -0.9561669, 1, 0.7450981, 0, 1,
-1.183013, -1.579331, -3.106895, 1, 0.7490196, 0, 1,
-1.181562, -0.8524083, -1.410855, 1, 0.7568628, 0, 1,
-1.174035, -1.158465, -3.474034, 1, 0.7607843, 0, 1,
-1.170635, -0.633158, -2.479147, 1, 0.7686275, 0, 1,
-1.157515, -0.8298414, -3.559008, 1, 0.772549, 0, 1,
-1.153448, 0.6033052, -0.4045609, 1, 0.7803922, 0, 1,
-1.138403, 0.8406999, -3.301782, 1, 0.7843137, 0, 1,
-1.13683, 0.3857516, -0.5466448, 1, 0.7921569, 0, 1,
-1.133551, -0.1910155, -2.715404, 1, 0.7960784, 0, 1,
-1.128398, -1.78035, -3.327544, 1, 0.8039216, 0, 1,
-1.122603, 1.932428, -0.8991218, 1, 0.8117647, 0, 1,
-1.117414, 0.5980548, -3.239136, 1, 0.8156863, 0, 1,
-1.116347, 0.1026126, -2.444211, 1, 0.8235294, 0, 1,
-1.115236, 1.267576, -0.5509084, 1, 0.827451, 0, 1,
-1.106208, -0.4457335, -2.154112, 1, 0.8352941, 0, 1,
-1.103282, -1.362892, -2.454588, 1, 0.8392157, 0, 1,
-1.089953, -0.3206115, -1.62959, 1, 0.8470588, 0, 1,
-1.083602, 1.072075, -0.3950481, 1, 0.8509804, 0, 1,
-1.082189, -0.08607213, -2.460387, 1, 0.8588235, 0, 1,
-1.07068, 2.595953, 0.3207461, 1, 0.8627451, 0, 1,
-1.070671, -0.7548426, -1.239193, 1, 0.8705882, 0, 1,
-1.070534, 0.3849761, -1.3267, 1, 0.8745098, 0, 1,
-1.069932, 0.6995303, -0.05094819, 1, 0.8823529, 0, 1,
-1.067071, 1.008316, 0.6411654, 1, 0.8862745, 0, 1,
-1.064012, 0.5381213, -1.117244, 1, 0.8941177, 0, 1,
-1.053805, -0.2723098, -3.882962, 1, 0.8980392, 0, 1,
-1.05345, 1.418527, 0.4833245, 1, 0.9058824, 0, 1,
-1.052278, 0.9266911, -0.9453975, 1, 0.9137255, 0, 1,
-1.047115, -1.124135, -2.572042, 1, 0.9176471, 0, 1,
-1.042755, 0.3284785, -1.550195, 1, 0.9254902, 0, 1,
-1.04247, 0.1249844, 0.9853614, 1, 0.9294118, 0, 1,
-1.039389, 1.431098, 0.005551208, 1, 0.9372549, 0, 1,
-1.034716, -1.038131, -3.695098, 1, 0.9411765, 0, 1,
-1.031881, -1.983991, -1.958365, 1, 0.9490196, 0, 1,
-1.030598, 0.8620566, -0.268385, 1, 0.9529412, 0, 1,
-1.020853, 0.6808797, -0.6888693, 1, 0.9607843, 0, 1,
-1.01756, -0.9444385, -1.59272, 1, 0.9647059, 0, 1,
-1.004162, 0.428151, -1.272012, 1, 0.972549, 0, 1,
-1.004111, -0.2268732, -2.011395, 1, 0.9764706, 0, 1,
-1.001699, -1.414841, -3.374704, 1, 0.9843137, 0, 1,
-1.001368, -0.6848116, -1.362871, 1, 0.9882353, 0, 1,
-0.9979824, -0.7927269, -2.634484, 1, 0.9960784, 0, 1,
-0.9978556, 0.5206649, -1.003721, 0.9960784, 1, 0, 1,
-0.9951513, -0.02035744, -1.209008, 0.9921569, 1, 0, 1,
-0.9925013, -0.5647795, -1.486681, 0.9843137, 1, 0, 1,
-0.987112, -0.1755858, -1.068946, 0.9803922, 1, 0, 1,
-0.9865782, -1.679253, -1.777687, 0.972549, 1, 0, 1,
-0.9830352, -1.433917, -2.963806, 0.9686275, 1, 0, 1,
-0.9803963, 1.065173, -0.9654394, 0.9607843, 1, 0, 1,
-0.9781053, -1.030515, -3.663389, 0.9568627, 1, 0, 1,
-0.9694464, 0.6671527, -0.5011725, 0.9490196, 1, 0, 1,
-0.9608679, 0.6881319, -0.2605834, 0.945098, 1, 0, 1,
-0.9601316, 0.06492875, -1.527651, 0.9372549, 1, 0, 1,
-0.9509687, 0.8921158, -1.04526, 0.9333333, 1, 0, 1,
-0.947798, 0.9237692, 0.01080579, 0.9254902, 1, 0, 1,
-0.9470168, 0.5145374, 0.9247102, 0.9215686, 1, 0, 1,
-0.9443841, 0.7921886, -0.1139553, 0.9137255, 1, 0, 1,
-0.9288241, 0.04237643, -1.709114, 0.9098039, 1, 0, 1,
-0.9277847, 0.7808161, -2.86496, 0.9019608, 1, 0, 1,
-0.9236801, 0.0184761, -2.024706, 0.8941177, 1, 0, 1,
-0.9222977, 0.2660707, -1.807736, 0.8901961, 1, 0, 1,
-0.919655, 0.9598954, -0.6504986, 0.8823529, 1, 0, 1,
-0.9112865, 0.7295812, -2.157155, 0.8784314, 1, 0, 1,
-0.9023314, -0.3907712, -4.012683, 0.8705882, 1, 0, 1,
-0.9002472, 0.368692, 1.141317, 0.8666667, 1, 0, 1,
-0.892854, -0.1368748, 0.7300349, 0.8588235, 1, 0, 1,
-0.8901087, 0.8556278, -2.1582, 0.854902, 1, 0, 1,
-0.8865551, 0.1958838, -2.082021, 0.8470588, 1, 0, 1,
-0.8845819, 0.969915, -1.547038, 0.8431373, 1, 0, 1,
-0.8831449, 0.2474021, -3.043839, 0.8352941, 1, 0, 1,
-0.8814309, -1.233253, -2.951049, 0.8313726, 1, 0, 1,
-0.8803493, 1.147178, -0.4033666, 0.8235294, 1, 0, 1,
-0.8776159, 2.9378, -0.4874989, 0.8196079, 1, 0, 1,
-0.8769946, 0.005654863, -3.660688, 0.8117647, 1, 0, 1,
-0.8750394, 0.3927377, 0.6415513, 0.8078431, 1, 0, 1,
-0.875012, 0.2589863, -0.564047, 0.8, 1, 0, 1,
-0.872371, 0.9665811, -2.399546, 0.7921569, 1, 0, 1,
-0.8713782, -1.331536, -4.991029, 0.7882353, 1, 0, 1,
-0.8686519, -0.190259, -1.753185, 0.7803922, 1, 0, 1,
-0.8604633, 1.610382, 0.4444585, 0.7764706, 1, 0, 1,
-0.8545544, -1.476614, -1.759845, 0.7686275, 1, 0, 1,
-0.8523753, -0.4340783, -2.88081, 0.7647059, 1, 0, 1,
-0.8505678, -0.4309426, -0.82292, 0.7568628, 1, 0, 1,
-0.8497051, -0.824916, -3.255892, 0.7529412, 1, 0, 1,
-0.8487847, -0.5280073, -1.143484, 0.7450981, 1, 0, 1,
-0.8467333, -0.07639617, -1.417025, 0.7411765, 1, 0, 1,
-0.8444942, -0.2021895, -0.2382125, 0.7333333, 1, 0, 1,
-0.8431638, -0.3080652, -1.645794, 0.7294118, 1, 0, 1,
-0.8430812, 0.561451, -0.8486769, 0.7215686, 1, 0, 1,
-0.8429106, 1.228369, -0.3496687, 0.7176471, 1, 0, 1,
-0.8395457, -1.864973, -1.801908, 0.7098039, 1, 0, 1,
-0.8313058, -2.647113, -2.575266, 0.7058824, 1, 0, 1,
-0.8290724, 0.5634466, -1.768241, 0.6980392, 1, 0, 1,
-0.8268118, 1.095131, 0.0862985, 0.6901961, 1, 0, 1,
-0.8206443, 1.967704, -1.86359, 0.6862745, 1, 0, 1,
-0.8194397, 1.087725, -1.38932, 0.6784314, 1, 0, 1,
-0.8167417, 0.9986584, -2.01999, 0.6745098, 1, 0, 1,
-0.8094183, -0.05146385, -2.091155, 0.6666667, 1, 0, 1,
-0.8008506, -0.8230003, -1.870474, 0.6627451, 1, 0, 1,
-0.7999045, -0.5234715, -2.083642, 0.654902, 1, 0, 1,
-0.7956545, -0.4655456, -2.163652, 0.6509804, 1, 0, 1,
-0.7954946, 1.059587, -0.243872, 0.6431373, 1, 0, 1,
-0.7951617, 0.4025384, -2.63771, 0.6392157, 1, 0, 1,
-0.7942922, 1.239095, -3.062652, 0.6313726, 1, 0, 1,
-0.7927068, 1.405411, -1.913098, 0.627451, 1, 0, 1,
-0.7921446, -0.2375083, -1.200555, 0.6196079, 1, 0, 1,
-0.7908872, 0.05167551, -3.396153, 0.6156863, 1, 0, 1,
-0.7885931, 0.09156585, -0.1477281, 0.6078432, 1, 0, 1,
-0.7727452, 1.246861, 0.464561, 0.6039216, 1, 0, 1,
-0.7625348, 0.6409299, -1.925871, 0.5960785, 1, 0, 1,
-0.7595024, -1.229745, -2.418207, 0.5882353, 1, 0, 1,
-0.7591159, 0.3358567, -0.01005093, 0.5843138, 1, 0, 1,
-0.7584009, -1.737535, -2.886443, 0.5764706, 1, 0, 1,
-0.7583022, -0.08690974, -0.8211471, 0.572549, 1, 0, 1,
-0.7500346, -0.08224443, -0.2453743, 0.5647059, 1, 0, 1,
-0.7472955, 0.1837105, -2.281736, 0.5607843, 1, 0, 1,
-0.7433198, -0.6751995, 0.07036791, 0.5529412, 1, 0, 1,
-0.7386453, 0.2227602, -2.006829, 0.5490196, 1, 0, 1,
-0.7313256, 0.4483864, -3.223972, 0.5411765, 1, 0, 1,
-0.7300097, -1.409217, -2.996821, 0.5372549, 1, 0, 1,
-0.7285535, -2.093262, -1.101808, 0.5294118, 1, 0, 1,
-0.7221029, 0.6274008, -1.346624, 0.5254902, 1, 0, 1,
-0.7214069, 0.1008761, -2.59773, 0.5176471, 1, 0, 1,
-0.703263, -0.08358262, -2.301847, 0.5137255, 1, 0, 1,
-0.7003844, 0.2866833, 0.5888077, 0.5058824, 1, 0, 1,
-0.7001839, 0.2056046, -2.224557, 0.5019608, 1, 0, 1,
-0.6980918, 1.272206, 2.201686, 0.4941176, 1, 0, 1,
-0.6969776, 1.856936, -1.332787, 0.4862745, 1, 0, 1,
-0.6962144, 0.4968067, -1.300593, 0.4823529, 1, 0, 1,
-0.6853291, 1.622534, -1.032607, 0.4745098, 1, 0, 1,
-0.679269, 0.5426463, 0.2825294, 0.4705882, 1, 0, 1,
-0.6735821, 0.826611, -1.558972, 0.4627451, 1, 0, 1,
-0.6681838, -1.252994, -2.431898, 0.4588235, 1, 0, 1,
-0.6677064, 1.103441, 0.8823407, 0.4509804, 1, 0, 1,
-0.6623442, 0.4254874, -1.632784, 0.4470588, 1, 0, 1,
-0.6589212, 0.5348538, -0.6219297, 0.4392157, 1, 0, 1,
-0.6498168, 1.712044, -2.628212, 0.4352941, 1, 0, 1,
-0.6491946, -0.2334915, -2.426432, 0.427451, 1, 0, 1,
-0.6463481, 1.731644, 0.0276448, 0.4235294, 1, 0, 1,
-0.6451669, -0.1187344, -2.503105, 0.4156863, 1, 0, 1,
-0.6410459, 0.4791616, -1.036346, 0.4117647, 1, 0, 1,
-0.6365573, 0.1346124, -2.45553, 0.4039216, 1, 0, 1,
-0.635989, 0.09646557, -0.7805644, 0.3960784, 1, 0, 1,
-0.6312587, 1.155472, 1.601325, 0.3921569, 1, 0, 1,
-0.6311473, 1.00555, -1.928175, 0.3843137, 1, 0, 1,
-0.6292545, -0.75324, -1.26377, 0.3803922, 1, 0, 1,
-0.626548, 0.1529502, -2.45758, 0.372549, 1, 0, 1,
-0.6197144, -0.6562076, -0.7871134, 0.3686275, 1, 0, 1,
-0.6164835, -0.3323701, -2.653429, 0.3607843, 1, 0, 1,
-0.6131065, 0.378114, -0.5663337, 0.3568628, 1, 0, 1,
-0.6122553, 0.6990799, -0.56238, 0.3490196, 1, 0, 1,
-0.611237, -0.7535027, -2.915329, 0.345098, 1, 0, 1,
-0.6009933, -0.1354047, -0.5410783, 0.3372549, 1, 0, 1,
-0.5992946, 0.5238078, -0.9172832, 0.3333333, 1, 0, 1,
-0.5980534, 1.979968, -1.418856, 0.3254902, 1, 0, 1,
-0.5946186, 0.1918118, -0.7310201, 0.3215686, 1, 0, 1,
-0.5927029, -1.366189, -3.328397, 0.3137255, 1, 0, 1,
-0.5916529, -0.5549034, -1.651999, 0.3098039, 1, 0, 1,
-0.5914489, 1.194949, -0.3581497, 0.3019608, 1, 0, 1,
-0.5896795, 1.255609, 0.5704278, 0.2941177, 1, 0, 1,
-0.5875031, 0.1135178, -2.920833, 0.2901961, 1, 0, 1,
-0.5803162, -1.61389, -3.41005, 0.282353, 1, 0, 1,
-0.5801036, -0.7927345, -3.090936, 0.2784314, 1, 0, 1,
-0.5758663, -1.593175, -1.768141, 0.2705882, 1, 0, 1,
-0.5729206, 2.709398, -0.7491216, 0.2666667, 1, 0, 1,
-0.5718366, -1.376125, -4.185045, 0.2588235, 1, 0, 1,
-0.5645989, 0.3377937, -1.94007, 0.254902, 1, 0, 1,
-0.5589018, 0.2638467, -1.905511, 0.2470588, 1, 0, 1,
-0.5486723, -0.17078, -0.5758588, 0.2431373, 1, 0, 1,
-0.5400226, -2.251394, -3.232187, 0.2352941, 1, 0, 1,
-0.537558, 0.7052245, -0.5702323, 0.2313726, 1, 0, 1,
-0.5300342, 1.659219, -0.4144188, 0.2235294, 1, 0, 1,
-0.5261316, 1.112186, -0.8391424, 0.2196078, 1, 0, 1,
-0.5208278, 0.2445839, 0.1603956, 0.2117647, 1, 0, 1,
-0.5186448, 0.05030743, -1.543238, 0.2078431, 1, 0, 1,
-0.5186127, -1.60789, -2.701772, 0.2, 1, 0, 1,
-0.5184941, -1.369129, -3.095671, 0.1921569, 1, 0, 1,
-0.5175638, 1.049757, -0.481548, 0.1882353, 1, 0, 1,
-0.5104483, 0.10787, -0.6151925, 0.1803922, 1, 0, 1,
-0.509357, 0.0568451, -3.413354, 0.1764706, 1, 0, 1,
-0.5071938, -0.003615812, -2.125878, 0.1686275, 1, 0, 1,
-0.5034471, 0.03270737, -1.778514, 0.1647059, 1, 0, 1,
-0.502803, 1.618547, 1.466176, 0.1568628, 1, 0, 1,
-0.5008616, -0.6397466, -0.5208525, 0.1529412, 1, 0, 1,
-0.4992033, 1.100128, -0.1964639, 0.145098, 1, 0, 1,
-0.4981402, 0.7844062, 0.8788704, 0.1411765, 1, 0, 1,
-0.4972039, -1.442783, -3.658417, 0.1333333, 1, 0, 1,
-0.4970409, 0.1851106, -2.084372, 0.1294118, 1, 0, 1,
-0.4955342, 1.558528, 0.1485777, 0.1215686, 1, 0, 1,
-0.4955008, -1.2384, -3.103349, 0.1176471, 1, 0, 1,
-0.4939142, -0.6538085, -1.734862, 0.1098039, 1, 0, 1,
-0.4935696, 0.007358253, -1.083747, 0.1058824, 1, 0, 1,
-0.4843219, 0.414276, 0.4040772, 0.09803922, 1, 0, 1,
-0.4826226, 0.296749, -2.09076, 0.09019608, 1, 0, 1,
-0.4802122, 0.6147661, 1.195345, 0.08627451, 1, 0, 1,
-0.4796398, -1.15584, -4.528415, 0.07843138, 1, 0, 1,
-0.479225, -1.694353, -2.279016, 0.07450981, 1, 0, 1,
-0.4750693, 0.3279744, -0.7020378, 0.06666667, 1, 0, 1,
-0.4727018, 1.142925, 1.080482, 0.0627451, 1, 0, 1,
-0.4696588, 0.9221547, -0.600205, 0.05490196, 1, 0, 1,
-0.4669811, 1.716851, 0.1351175, 0.05098039, 1, 0, 1,
-0.4653835, 0.4866092, -0.5159031, 0.04313726, 1, 0, 1,
-0.463544, 0.431966, -1.044393, 0.03921569, 1, 0, 1,
-0.463013, 0.330783, -0.4495959, 0.03137255, 1, 0, 1,
-0.4607131, -1.131841, -2.653138, 0.02745098, 1, 0, 1,
-0.4557618, 0.8844593, -0.1240067, 0.01960784, 1, 0, 1,
-0.4513443, 0.207187, -2.913806, 0.01568628, 1, 0, 1,
-0.4504716, 0.08382474, -3.456544, 0.007843138, 1, 0, 1,
-0.449038, 2.326237, -0.5778769, 0.003921569, 1, 0, 1,
-0.4482867, -0.1873292, -2.029654, 0, 1, 0.003921569, 1,
-0.4444193, 1.124552, 0.5242342, 0, 1, 0.01176471, 1,
-0.4375322, 1.089118, -2.700176, 0, 1, 0.01568628, 1,
-0.4333039, 0.4261685, -0.2466568, 0, 1, 0.02352941, 1,
-0.4325281, -0.2658063, -4.1394, 0, 1, 0.02745098, 1,
-0.4321471, -0.1406554, -3.88978, 0, 1, 0.03529412, 1,
-0.4313596, 1.437858, 1.151043, 0, 1, 0.03921569, 1,
-0.4280898, 0.3781361, -0.007682151, 0, 1, 0.04705882, 1,
-0.4268151, 1.240767, -1.543173, 0, 1, 0.05098039, 1,
-0.4252427, -0.377583, -0.6335893, 0, 1, 0.05882353, 1,
-0.4238137, -1.056486, -3.046915, 0, 1, 0.0627451, 1,
-0.4225721, -0.1535754, -1.010987, 0, 1, 0.07058824, 1,
-0.4180301, 0.680755, -1.351602, 0, 1, 0.07450981, 1,
-0.412229, -0.4601994, -3.133016, 0, 1, 0.08235294, 1,
-0.4119761, -0.007169806, -2.190303, 0, 1, 0.08627451, 1,
-0.4085166, -1.4395, -2.263521, 0, 1, 0.09411765, 1,
-0.4040493, 1.824876, 0.2637781, 0, 1, 0.1019608, 1,
-0.4029647, 0.842069, -0.4550962, 0, 1, 0.1058824, 1,
-0.3965374, -0.8029019, -1.07922, 0, 1, 0.1137255, 1,
-0.3954068, 0.07847515, -0.1141768, 0, 1, 0.1176471, 1,
-0.3928511, 0.5556488, -0.4248438, 0, 1, 0.1254902, 1,
-0.3896104, -0.2752835, -2.676676, 0, 1, 0.1294118, 1,
-0.3873754, -0.9535643, -2.71712, 0, 1, 0.1372549, 1,
-0.3870649, -0.4741798, -3.180962, 0, 1, 0.1411765, 1,
-0.3819148, 0.5257056, 0.02815188, 0, 1, 0.1490196, 1,
-0.3791985, -0.8709962, -3.872596, 0, 1, 0.1529412, 1,
-0.3766379, -0.07989983, -3.113865, 0, 1, 0.1607843, 1,
-0.376368, -2.163832, -3.443008, 0, 1, 0.1647059, 1,
-0.3751498, 0.798673, -0.8226615, 0, 1, 0.172549, 1,
-0.3749263, 0.1441499, -2.48475, 0, 1, 0.1764706, 1,
-0.3731912, -0.7900058, -1.340778, 0, 1, 0.1843137, 1,
-0.3726084, 0.6135377, 1.072603, 0, 1, 0.1882353, 1,
-0.3712113, 0.631479, -3.080671, 0, 1, 0.1960784, 1,
-0.3641394, -0.8086107, -2.567965, 0, 1, 0.2039216, 1,
-0.3583268, 0.852792, 0.5415767, 0, 1, 0.2078431, 1,
-0.3574265, 1.174246, -0.7311292, 0, 1, 0.2156863, 1,
-0.3562869, -0.06582269, -1.189498, 0, 1, 0.2196078, 1,
-0.3560746, -0.9529872, -3.298398, 0, 1, 0.227451, 1,
-0.3553819, -1.424124, -4.670747, 0, 1, 0.2313726, 1,
-0.3542341, 1.155164, 0.07341442, 0, 1, 0.2392157, 1,
-0.3528856, 0.4276867, 0.6060547, 0, 1, 0.2431373, 1,
-0.3460393, -1.452324, -3.872629, 0, 1, 0.2509804, 1,
-0.3456987, -0.3808653, -3.425554, 0, 1, 0.254902, 1,
-0.3445822, 0.5042611, -0.06930891, 0, 1, 0.2627451, 1,
-0.3423563, 0.3564624, -0.342401, 0, 1, 0.2666667, 1,
-0.3382488, 0.4844713, -0.07838526, 0, 1, 0.2745098, 1,
-0.3372274, -0.5666881, -3.098381, 0, 1, 0.2784314, 1,
-0.3329383, -1.636409, -2.040981, 0, 1, 0.2862745, 1,
-0.3289031, -0.4349005, -3.177125, 0, 1, 0.2901961, 1,
-0.3285384, 0.38773, 0.2344923, 0, 1, 0.2980392, 1,
-0.32654, -1.644104, -4.641304, 0, 1, 0.3058824, 1,
-0.326387, 0.5804605, -1.359393, 0, 1, 0.3098039, 1,
-0.3252533, -0.6988786, -3.799518, 0, 1, 0.3176471, 1,
-0.3217025, 0.5319088, -0.3657383, 0, 1, 0.3215686, 1,
-0.3201951, -0.4002385, -1.434508, 0, 1, 0.3294118, 1,
-0.3184703, -0.1770826, -1.019047, 0, 1, 0.3333333, 1,
-0.3171524, -0.5090952, -0.8497649, 0, 1, 0.3411765, 1,
-0.3140392, -0.359381, -1.924869, 0, 1, 0.345098, 1,
-0.3120159, 0.7589628, 0.2586816, 0, 1, 0.3529412, 1,
-0.3097384, 2.040637, -1.076479, 0, 1, 0.3568628, 1,
-0.3061257, 0.183359, -1.290146, 0, 1, 0.3647059, 1,
-0.3040939, 0.9842218, 0.04729189, 0, 1, 0.3686275, 1,
-0.3017022, 0.8478889, -0.8133459, 0, 1, 0.3764706, 1,
-0.2939982, 1.456252, -0.6099655, 0, 1, 0.3803922, 1,
-0.2930536, -1.404776, -2.069726, 0, 1, 0.3882353, 1,
-0.2912076, 1.21647, 1.243514, 0, 1, 0.3921569, 1,
-0.2901129, -1.158836, -2.473098, 0, 1, 0.4, 1,
-0.2895986, 0.9776699, 0.1075584, 0, 1, 0.4078431, 1,
-0.2895329, -1.054789, -2.329539, 0, 1, 0.4117647, 1,
-0.2894024, -0.1188186, -2.215258, 0, 1, 0.4196078, 1,
-0.2870182, 0.2415835, -2.550478, 0, 1, 0.4235294, 1,
-0.2779271, 1.600338, 0.4041337, 0, 1, 0.4313726, 1,
-0.2768392, 0.3653764, -1.080986, 0, 1, 0.4352941, 1,
-0.2757718, -1.431268, -4.341008, 0, 1, 0.4431373, 1,
-0.2696265, -0.09969281, -2.342429, 0, 1, 0.4470588, 1,
-0.2670498, -0.4557531, -3.618202, 0, 1, 0.454902, 1,
-0.2649047, 0.4584945, 0.5725337, 0, 1, 0.4588235, 1,
-0.2606835, -1.039158, -1.905407, 0, 1, 0.4666667, 1,
-0.2582153, 0.3821004, -0.1340167, 0, 1, 0.4705882, 1,
-0.2550358, 0.3951889, -0.8324782, 0, 1, 0.4784314, 1,
-0.2469916, 0.8129925, -0.7905242, 0, 1, 0.4823529, 1,
-0.2441956, 0.3887294, -1.599122, 0, 1, 0.4901961, 1,
-0.2334586, -1.137268, -3.397852, 0, 1, 0.4941176, 1,
-0.2331712, -1.029395, -3.936641, 0, 1, 0.5019608, 1,
-0.2221226, 2.27556, -0.9466425, 0, 1, 0.509804, 1,
-0.2204813, 1.111088, -0.8450869, 0, 1, 0.5137255, 1,
-0.2196701, -0.7660019, 0.5186302, 0, 1, 0.5215687, 1,
-0.2181059, 1.836327, -0.6703287, 0, 1, 0.5254902, 1,
-0.2163391, -0.619014, -2.679154, 0, 1, 0.5333334, 1,
-0.2135324, 0.6010559, -1.305016, 0, 1, 0.5372549, 1,
-0.2114554, 0.7078229, -0.1247413, 0, 1, 0.5450981, 1,
-0.2110174, 0.286908, 0.2002989, 0, 1, 0.5490196, 1,
-0.2105032, 0.5602517, -0.4302908, 0, 1, 0.5568628, 1,
-0.2101323, -2.711286, -4.460649, 0, 1, 0.5607843, 1,
-0.2096848, 0.3916281, 0.73282, 0, 1, 0.5686275, 1,
-0.206039, -1.171031, -4.229297, 0, 1, 0.572549, 1,
-0.2008194, 0.4279993, -0.06566758, 0, 1, 0.5803922, 1,
-0.1975185, -0.008374323, -0.1063484, 0, 1, 0.5843138, 1,
-0.1974697, 1.757116, 0.1326334, 0, 1, 0.5921569, 1,
-0.1949816, 1.175273, -0.9056305, 0, 1, 0.5960785, 1,
-0.1944149, -1.539083, -2.191397, 0, 1, 0.6039216, 1,
-0.1928663, 0.1888259, 1.119002, 0, 1, 0.6117647, 1,
-0.1882429, 0.4822908, -1.490759, 0, 1, 0.6156863, 1,
-0.1879054, 1.025611, -0.1466939, 0, 1, 0.6235294, 1,
-0.1866294, 0.5412801, -0.8331107, 0, 1, 0.627451, 1,
-0.1854309, -0.5393838, -2.933049, 0, 1, 0.6352941, 1,
-0.1820984, -0.01274776, -1.702488, 0, 1, 0.6392157, 1,
-0.1810767, 0.1447287, -1.664034, 0, 1, 0.6470588, 1,
-0.1808369, -0.5355376, -1.002372, 0, 1, 0.6509804, 1,
-0.1801199, 1.047717, 0.3304445, 0, 1, 0.6588235, 1,
-0.1798557, -0.4522447, -2.461876, 0, 1, 0.6627451, 1,
-0.1783634, -0.1414201, -0.4045074, 0, 1, 0.6705883, 1,
-0.1755231, 1.275817, -0.6998217, 0, 1, 0.6745098, 1,
-0.1690391, 0.4346855, 0.1966941, 0, 1, 0.682353, 1,
-0.1683456, 1.068516, 0.356721, 0, 1, 0.6862745, 1,
-0.167911, -1.886423, -3.099075, 0, 1, 0.6941177, 1,
-0.1607479, 0.849729, 0.3796765, 0, 1, 0.7019608, 1,
-0.156891, -0.4641676, -3.479293, 0, 1, 0.7058824, 1,
-0.156034, -0.2851377, -4.17885, 0, 1, 0.7137255, 1,
-0.1544871, 0.1857192, 1.138992, 0, 1, 0.7176471, 1,
-0.1541426, 1.10369, 0.6552343, 0, 1, 0.7254902, 1,
-0.1514389, 1.271544, 0.1156778, 0, 1, 0.7294118, 1,
-0.1500296, -0.522772, -3.498361, 0, 1, 0.7372549, 1,
-0.1480254, -1.011702, -1.723144, 0, 1, 0.7411765, 1,
-0.1432561, 1.01256, -0.857521, 0, 1, 0.7490196, 1,
-0.1404893, -0.05364571, -3.220841, 0, 1, 0.7529412, 1,
-0.1399995, -0.7587589, -2.974155, 0, 1, 0.7607843, 1,
-0.130736, 0.1492531, 0.3130017, 0, 1, 0.7647059, 1,
-0.1280628, -1.159551, -4.106854, 0, 1, 0.772549, 1,
-0.1279871, -0.2991935, -1.710141, 0, 1, 0.7764706, 1,
-0.127175, 0.4397443, -0.565824, 0, 1, 0.7843137, 1,
-0.1269028, 0.3589644, -1.549428, 0, 1, 0.7882353, 1,
-0.1256033, -0.1429903, -2.698809, 0, 1, 0.7960784, 1,
-0.1255763, -0.3502137, -1.707614, 0, 1, 0.8039216, 1,
-0.1220661, 1.178678, -1.166238, 0, 1, 0.8078431, 1,
-0.1163489, -1.382246, -2.302467, 0, 1, 0.8156863, 1,
-0.1160093, -0.189956, -3.67189, 0, 1, 0.8196079, 1,
-0.114755, -0.2533109, -2.293978, 0, 1, 0.827451, 1,
-0.1144554, -1.207742, -3.202041, 0, 1, 0.8313726, 1,
-0.1141221, -0.1057357, -1.533061, 0, 1, 0.8392157, 1,
-0.1109477, -0.6406761, -3.630431, 0, 1, 0.8431373, 1,
-0.1108337, -0.7996519, -2.478531, 0, 1, 0.8509804, 1,
-0.108973, 1.433634, -0.9509073, 0, 1, 0.854902, 1,
-0.1082513, 0.8394048, -0.7681774, 0, 1, 0.8627451, 1,
-0.1063463, 0.7905, -2.511471, 0, 1, 0.8666667, 1,
-0.1028752, 0.7215903, 0.007173453, 0, 1, 0.8745098, 1,
-0.1011908, -1.597491, -2.873658, 0, 1, 0.8784314, 1,
-0.09887366, -0.105418, -0.8894823, 0, 1, 0.8862745, 1,
-0.09759365, -0.6736911, -4.531849, 0, 1, 0.8901961, 1,
-0.09637278, -1.013523, -3.233613, 0, 1, 0.8980392, 1,
-0.09572465, -0.2285332, -1.452704, 0, 1, 0.9058824, 1,
-0.09390423, -0.5939394, -4.945059, 0, 1, 0.9098039, 1,
-0.09193355, 0.8814107, 0.934128, 0, 1, 0.9176471, 1,
-0.0869949, -1.31244, -3.90755, 0, 1, 0.9215686, 1,
-0.08534119, -1.001807, -1.324113, 0, 1, 0.9294118, 1,
-0.082743, -0.3356379, -2.11988, 0, 1, 0.9333333, 1,
-0.08260388, 0.4471848, 0.4192356, 0, 1, 0.9411765, 1,
-0.0805663, -0.3442039, -1.846136, 0, 1, 0.945098, 1,
-0.07203368, -0.8019825, -4.449259, 0, 1, 0.9529412, 1,
-0.07174125, -0.3045963, -2.258469, 0, 1, 0.9568627, 1,
-0.06893396, 1.241096, 0.5641789, 0, 1, 0.9647059, 1,
-0.06777681, 0.1904587, -1.420271, 0, 1, 0.9686275, 1,
-0.06702584, -0.6425418, -2.650449, 0, 1, 0.9764706, 1,
-0.06681973, -0.5426688, -4.064507, 0, 1, 0.9803922, 1,
-0.06632873, -1.201784, -5.105133, 0, 1, 0.9882353, 1,
-0.06589637, 0.3257693, -0.4755007, 0, 1, 0.9921569, 1,
-0.06542509, 0.9873425, -1.949298, 0, 1, 1, 1,
-0.06483956, 0.7747834, -1.13652, 0, 0.9921569, 1, 1,
-0.06347764, 0.0001678199, -2.848914, 0, 0.9882353, 1, 1,
-0.06141102, -0.9817711, -3.190902, 0, 0.9803922, 1, 1,
-0.06064837, -0.5879161, -2.707434, 0, 0.9764706, 1, 1,
-0.06050449, 1.598774, -0.5946119, 0, 0.9686275, 1, 1,
-0.05752784, 0.1868988, -0.683225, 0, 0.9647059, 1, 1,
-0.05614227, 0.5489129, -1.734982, 0, 0.9568627, 1, 1,
-0.05251483, -1.711476, -2.540114, 0, 0.9529412, 1, 1,
-0.04752722, 0.06781297, -1.101587, 0, 0.945098, 1, 1,
-0.04348946, -0.9215378, -1.663605, 0, 0.9411765, 1, 1,
-0.04294361, -1.653929, -4.412089, 0, 0.9333333, 1, 1,
-0.03799789, -2.077332, -3.209652, 0, 0.9294118, 1, 1,
-0.03383452, -0.6430327, -1.71692, 0, 0.9215686, 1, 1,
-0.03210077, -1.036628, -4.789053, 0, 0.9176471, 1, 1,
-0.028884, 0.5220447, -1.032547, 0, 0.9098039, 1, 1,
-0.0287219, -0.2909995, -2.382536, 0, 0.9058824, 1, 1,
-0.02640734, 0.06668444, 1.5216, 0, 0.8980392, 1, 1,
-0.02529208, 1.230819, -0.6634287, 0, 0.8901961, 1, 1,
-0.0233484, 0.8611432, -0.810309, 0, 0.8862745, 1, 1,
-0.02124613, 1.586949, 1.355142, 0, 0.8784314, 1, 1,
-0.02043402, -0.3231588, -2.250182, 0, 0.8745098, 1, 1,
-0.01896233, -1.901059, -1.884304, 0, 0.8666667, 1, 1,
-0.01870597, -0.8271207, -4.475569, 0, 0.8627451, 1, 1,
-0.01847535, 0.3720079, -1.863584, 0, 0.854902, 1, 1,
-0.01383231, 0.0953206, -0.7480419, 0, 0.8509804, 1, 1,
-0.01068532, 0.8850383, 1.014419, 0, 0.8431373, 1, 1,
0.00131343, -0.3604004, 2.152773, 0, 0.8392157, 1, 1,
0.004283153, 0.5631325, 0.3698355, 0, 0.8313726, 1, 1,
0.007889427, -0.7127928, 3.644434, 0, 0.827451, 1, 1,
0.01128504, -0.1835805, 2.769037, 0, 0.8196079, 1, 1,
0.01146806, -0.7922419, 4.552628, 0, 0.8156863, 1, 1,
0.01182106, 1.645862, 0.3868651, 0, 0.8078431, 1, 1,
0.01262648, -1.050539, 2.622834, 0, 0.8039216, 1, 1,
0.01372324, 2.675468, 0.03291323, 0, 0.7960784, 1, 1,
0.01619551, -0.1988921, 1.012907, 0, 0.7882353, 1, 1,
0.02007636, -0.3986318, 4.178136, 0, 0.7843137, 1, 1,
0.02198382, -2.455408, 1.434225, 0, 0.7764706, 1, 1,
0.0232075, 0.8865809, 1.493781, 0, 0.772549, 1, 1,
0.03363929, 1.661777, 1.575216, 0, 0.7647059, 1, 1,
0.03472888, 0.799395, -1.545322, 0, 0.7607843, 1, 1,
0.03743619, 1.110825, 1.840204, 0, 0.7529412, 1, 1,
0.04098137, -1.699873, 1.4929, 0, 0.7490196, 1, 1,
0.04492204, -1.600512, 2.150398, 0, 0.7411765, 1, 1,
0.04565687, -0.7528151, 3.417602, 0, 0.7372549, 1, 1,
0.04751554, -0.873493, 4.510542, 0, 0.7294118, 1, 1,
0.05571616, -0.1790256, 1.565968, 0, 0.7254902, 1, 1,
0.05814126, -0.9327757, 3.217979, 0, 0.7176471, 1, 1,
0.05864428, 0.1713201, 1.230847, 0, 0.7137255, 1, 1,
0.05994436, 0.9010991, -0.9044327, 0, 0.7058824, 1, 1,
0.06887792, -1.405569, 1.805351, 0, 0.6980392, 1, 1,
0.07528609, 1.195451, 0.1149492, 0, 0.6941177, 1, 1,
0.07656852, 0.1695528, 1.959848, 0, 0.6862745, 1, 1,
0.08630513, -0.6600922, 0.705779, 0, 0.682353, 1, 1,
0.09822942, -0.7000742, 1.993269, 0, 0.6745098, 1, 1,
0.09854738, 0.08507115, -0.02262013, 0, 0.6705883, 1, 1,
0.0995236, 0.7983338, -0.3018345, 0, 0.6627451, 1, 1,
0.1003675, -0.8827906, 2.651724, 0, 0.6588235, 1, 1,
0.1020821, -0.5583735, 4.549842, 0, 0.6509804, 1, 1,
0.103726, -0.02985059, 1.650908, 0, 0.6470588, 1, 1,
0.1065717, 0.8465865, 0.4696512, 0, 0.6392157, 1, 1,
0.1078691, 0.6134509, 0.7510127, 0, 0.6352941, 1, 1,
0.1091416, 0.7411444, 0.1361752, 0, 0.627451, 1, 1,
0.1137635, 1.079324, -0.2911591, 0, 0.6235294, 1, 1,
0.1182554, 0.3318308, 0.2164692, 0, 0.6156863, 1, 1,
0.1190311, -0.2014939, 2.205669, 0, 0.6117647, 1, 1,
0.1216706, 1.056079, 0.3777632, 0, 0.6039216, 1, 1,
0.1255457, 0.8349673, 0.7730163, 0, 0.5960785, 1, 1,
0.1258008, -1.071066, 3.15519, 0, 0.5921569, 1, 1,
0.1344217, 1.761343, 0.4711771, 0, 0.5843138, 1, 1,
0.1356937, -0.06953032, 1.466658, 0, 0.5803922, 1, 1,
0.1386154, 0.4993362, 0.09260942, 0, 0.572549, 1, 1,
0.1439456, -0.2242356, 1.218687, 0, 0.5686275, 1, 1,
0.1460464, -0.4945332, 4.496175, 0, 0.5607843, 1, 1,
0.149899, 1.040403, -0.03110946, 0, 0.5568628, 1, 1,
0.1507189, -0.1448763, 1.776348, 0, 0.5490196, 1, 1,
0.152307, 1.20258, -0.6107231, 0, 0.5450981, 1, 1,
0.1525272, 0.07313766, 1.671615, 0, 0.5372549, 1, 1,
0.1535926, 0.05916234, 1.369467, 0, 0.5333334, 1, 1,
0.1595055, -0.7112143, 2.528965, 0, 0.5254902, 1, 1,
0.1615228, 0.0617731, 1.378223, 0, 0.5215687, 1, 1,
0.1616357, -0.03539231, 3.638282, 0, 0.5137255, 1, 1,
0.1638413, -1.483303, 4.101815, 0, 0.509804, 1, 1,
0.164199, -0.6079429, 3.496764, 0, 0.5019608, 1, 1,
0.1660339, -1.26029, 3.461862, 0, 0.4941176, 1, 1,
0.168689, -1.348089, 3.629287, 0, 0.4901961, 1, 1,
0.1688876, 0.02882337, 3.177767, 0, 0.4823529, 1, 1,
0.1711718, 1.064896, -0.9903197, 0, 0.4784314, 1, 1,
0.1750201, -1.638591, 3.736965, 0, 0.4705882, 1, 1,
0.1758297, 1.117398, -0.008441412, 0, 0.4666667, 1, 1,
0.177319, 0.156954, 1.085995, 0, 0.4588235, 1, 1,
0.1791272, -0.4244179, 1.803766, 0, 0.454902, 1, 1,
0.1819192, 0.6454978, -1.425399, 0, 0.4470588, 1, 1,
0.1872365, -0.1948601, 3.900472, 0, 0.4431373, 1, 1,
0.1875829, 0.5779225, 1.704687, 0, 0.4352941, 1, 1,
0.1881556, 0.2832468, 2.54635, 0, 0.4313726, 1, 1,
0.1936679, -0.8472916, 3.571908, 0, 0.4235294, 1, 1,
0.1944291, 1.446254, -1.354821, 0, 0.4196078, 1, 1,
0.1969143, 0.1200516, 0.2249089, 0, 0.4117647, 1, 1,
0.2014059, 1.927966, -1.42771, 0, 0.4078431, 1, 1,
0.2033857, 0.8886853, -0.6996437, 0, 0.4, 1, 1,
0.2058312, -1.382596, 2.771003, 0, 0.3921569, 1, 1,
0.2061012, 0.8098593, 1.018341, 0, 0.3882353, 1, 1,
0.2105028, 0.9144069, 0.0887792, 0, 0.3803922, 1, 1,
0.2141085, 0.7714862, 0.4658256, 0, 0.3764706, 1, 1,
0.2228223, -0.3987588, 3.012329, 0, 0.3686275, 1, 1,
0.2239485, -0.3374726, 2.887765, 0, 0.3647059, 1, 1,
0.2252956, 0.819235, -0.02202681, 0, 0.3568628, 1, 1,
0.2313267, -0.4609191, 3.403909, 0, 0.3529412, 1, 1,
0.2317819, 0.481927, 0.4639557, 0, 0.345098, 1, 1,
0.2337606, -0.05307191, 2.780483, 0, 0.3411765, 1, 1,
0.2340998, 1.044779, -1.292524, 0, 0.3333333, 1, 1,
0.2400284, -2.085991, 1.94855, 0, 0.3294118, 1, 1,
0.2417057, -0.8207266, 3.107686, 0, 0.3215686, 1, 1,
0.2418156, 0.6653273, -0.2132569, 0, 0.3176471, 1, 1,
0.2418703, 1.89336, 0.2622942, 0, 0.3098039, 1, 1,
0.2432664, 1.342393, 0.1649882, 0, 0.3058824, 1, 1,
0.2438746, 0.9859672, 0.3797889, 0, 0.2980392, 1, 1,
0.2453562, 0.7808025, 1.36592, 0, 0.2901961, 1, 1,
0.2466456, 1.389421, 1.07147, 0, 0.2862745, 1, 1,
0.2471471, 0.2231271, 1.597365, 0, 0.2784314, 1, 1,
0.2482449, -0.738538, 3.407448, 0, 0.2745098, 1, 1,
0.2482507, -0.6176517, 4.483999, 0, 0.2666667, 1, 1,
0.2491157, -0.5506992, 2.363259, 0, 0.2627451, 1, 1,
0.2553639, -1.031629, 3.33194, 0, 0.254902, 1, 1,
0.2584883, -0.1768022, 2.585963, 0, 0.2509804, 1, 1,
0.2588731, -0.1548801, 2.569331, 0, 0.2431373, 1, 1,
0.2601051, -1.123246, 2.344254, 0, 0.2392157, 1, 1,
0.2668034, 0.0995334, 2.837892, 0, 0.2313726, 1, 1,
0.2751833, 0.7000508, -0.2377222, 0, 0.227451, 1, 1,
0.2755741, -0.8389736, 3.228987, 0, 0.2196078, 1, 1,
0.2815046, 0.8994434, -0.4298365, 0, 0.2156863, 1, 1,
0.2822549, -1.927713, 1.693473, 0, 0.2078431, 1, 1,
0.2915135, -1.162831, 2.961729, 0, 0.2039216, 1, 1,
0.2919914, 2.454038, -1.673107, 0, 0.1960784, 1, 1,
0.2989626, -1.765189, 4.430747, 0, 0.1882353, 1, 1,
0.3041013, -2.734373, 3.720344, 0, 0.1843137, 1, 1,
0.3084229, 0.1785646, 0.6693518, 0, 0.1764706, 1, 1,
0.309834, 0.4704307, -0.7978568, 0, 0.172549, 1, 1,
0.3099424, -0.290084, 0.8815051, 0, 0.1647059, 1, 1,
0.3106395, 0.1509368, 1.507308, 0, 0.1607843, 1, 1,
0.3126486, 0.2113475, -0.3131532, 0, 0.1529412, 1, 1,
0.31548, -0.8609166, 2.288705, 0, 0.1490196, 1, 1,
0.3180537, -0.336351, 1.512097, 0, 0.1411765, 1, 1,
0.3187729, 0.9994109, -1.342063, 0, 0.1372549, 1, 1,
0.3216785, -1.430029, 2.032692, 0, 0.1294118, 1, 1,
0.3229758, -0.1589898, 2.798067, 0, 0.1254902, 1, 1,
0.3234545, -0.1908576, 3.196764, 0, 0.1176471, 1, 1,
0.3333581, -0.05337958, 1.801277, 0, 0.1137255, 1, 1,
0.3362885, -1.210265, 2.597474, 0, 0.1058824, 1, 1,
0.3391002, 0.2362636, 0.03503238, 0, 0.09803922, 1, 1,
0.3419734, -0.8441222, 3.0573, 0, 0.09411765, 1, 1,
0.3420874, 0.05860628, 1.549973, 0, 0.08627451, 1, 1,
0.3438592, 1.32286, 0.4668652, 0, 0.08235294, 1, 1,
0.3464242, -2.824518, 3.14206, 0, 0.07450981, 1, 1,
0.3484782, -0.01445959, 1.004146, 0, 0.07058824, 1, 1,
0.3507176, -0.2521932, 1.667598, 0, 0.0627451, 1, 1,
0.3586609, -0.1113074, 1.02798, 0, 0.05882353, 1, 1,
0.3607048, -1.045873, 2.060085, 0, 0.05098039, 1, 1,
0.3665329, 1.701289, -1.840961, 0, 0.04705882, 1, 1,
0.3695797, 0.346003, 0.8419244, 0, 0.03921569, 1, 1,
0.3735133, -0.6709129, 2.898325, 0, 0.03529412, 1, 1,
0.3740547, -0.5805082, 0.4680462, 0, 0.02745098, 1, 1,
0.3799905, 0.4399668, 0.600345, 0, 0.02352941, 1, 1,
0.3823497, 1.453358, -0.5957716, 0, 0.01568628, 1, 1,
0.3875652, 0.1303246, 1.275131, 0, 0.01176471, 1, 1,
0.3922167, -0.7457878, 3.354579, 0, 0.003921569, 1, 1,
0.3946882, -0.09553326, 1.123404, 0.003921569, 0, 1, 1,
0.4067245, 1.010136, -0.4058981, 0.007843138, 0, 1, 1,
0.4070533, -0.1401372, 2.255439, 0.01568628, 0, 1, 1,
0.407419, -0.4849681, 2.279694, 0.01960784, 0, 1, 1,
0.4174347, 1.836352, 0.8814858, 0.02745098, 0, 1, 1,
0.4201385, 1.342445, 1.064682, 0.03137255, 0, 1, 1,
0.42343, -0.2630902, 3.030552, 0.03921569, 0, 1, 1,
0.4251961, -1.883021, 1.806409, 0.04313726, 0, 1, 1,
0.4296612, -0.1557632, 1.053562, 0.05098039, 0, 1, 1,
0.4332437, 0.4821728, 1.301703, 0.05490196, 0, 1, 1,
0.4346079, -0.1897323, 2.202976, 0.0627451, 0, 1, 1,
0.4354005, 0.135227, -0.05450287, 0.06666667, 0, 1, 1,
0.4369887, 0.06095969, 1.852733, 0.07450981, 0, 1, 1,
0.4381477, 1.228748, -0.318535, 0.07843138, 0, 1, 1,
0.4383588, 0.170793, 0.4060126, 0.08627451, 0, 1, 1,
0.4411903, 0.03367427, -0.467335, 0.09019608, 0, 1, 1,
0.4442773, 0.7152473, 1.322884, 0.09803922, 0, 1, 1,
0.4473221, -1.880964, 1.783661, 0.1058824, 0, 1, 1,
0.4485621, 0.3051052, 0.8740099, 0.1098039, 0, 1, 1,
0.451234, -0.8093157, 2.120413, 0.1176471, 0, 1, 1,
0.461291, -0.4572062, 2.528388, 0.1215686, 0, 1, 1,
0.4626378, 0.2171282, 0.7345977, 0.1294118, 0, 1, 1,
0.4643736, 0.6522005, 2.014124, 0.1333333, 0, 1, 1,
0.4675256, 2.114944, -0.631172, 0.1411765, 0, 1, 1,
0.4709198, -0.91866, 3.903179, 0.145098, 0, 1, 1,
0.4711607, -0.194098, 0.6754227, 0.1529412, 0, 1, 1,
0.4765458, 0.6272832, 1.023363, 0.1568628, 0, 1, 1,
0.478501, 0.2459408, 2.008023, 0.1647059, 0, 1, 1,
0.4796572, -1.058193, 2.03893, 0.1686275, 0, 1, 1,
0.4799373, -0.4123817, 3.644615, 0.1764706, 0, 1, 1,
0.4852982, -0.5428553, 3.051789, 0.1803922, 0, 1, 1,
0.495156, 0.06330547, 1.507871, 0.1882353, 0, 1, 1,
0.4953732, 0.1587012, -0.09706832, 0.1921569, 0, 1, 1,
0.4965288, 0.5447742, -0.5120023, 0.2, 0, 1, 1,
0.4971272, 0.1271391, 2.723696, 0.2078431, 0, 1, 1,
0.5166634, 0.7251822, 2.574494, 0.2117647, 0, 1, 1,
0.5237748, -0.08402672, 2.316913, 0.2196078, 0, 1, 1,
0.5255077, -0.497458, 4.975911, 0.2235294, 0, 1, 1,
0.5271091, -1.132642, 1.346974, 0.2313726, 0, 1, 1,
0.5277416, 1.346893, 0.02615424, 0.2352941, 0, 1, 1,
0.5337324, 0.8144595, -1.140614, 0.2431373, 0, 1, 1,
0.5338202, -0.5165689, 3.762241, 0.2470588, 0, 1, 1,
0.5343966, -1.001285, 3.899002, 0.254902, 0, 1, 1,
0.5345562, 0.3684588, 0.02718161, 0.2588235, 0, 1, 1,
0.5427014, 0.5993042, 1.813365, 0.2666667, 0, 1, 1,
0.5480476, -1.09335, 3.315315, 0.2705882, 0, 1, 1,
0.5512353, -0.987449, 2.995351, 0.2784314, 0, 1, 1,
0.554898, 0.708955, 1.590659, 0.282353, 0, 1, 1,
0.5567164, -0.7148989, 2.224429, 0.2901961, 0, 1, 1,
0.5567661, 0.1680948, 1.682842, 0.2941177, 0, 1, 1,
0.5587411, -2.783438, 2.543401, 0.3019608, 0, 1, 1,
0.55912, -0.3236368, 2.679098, 0.3098039, 0, 1, 1,
0.5662295, 0.08527735, 1.686449, 0.3137255, 0, 1, 1,
0.5690265, 0.4770766, 0.434491, 0.3215686, 0, 1, 1,
0.5753588, 1.444196, 1.176038, 0.3254902, 0, 1, 1,
0.5790852, 0.3870959, 0.8569128, 0.3333333, 0, 1, 1,
0.5877313, -0.2947012, 1.650333, 0.3372549, 0, 1, 1,
0.5883043, 0.3642815, 1.072212, 0.345098, 0, 1, 1,
0.5886151, 0.0750365, 1.917862, 0.3490196, 0, 1, 1,
0.5963941, -0.9720997, 1.922359, 0.3568628, 0, 1, 1,
0.5966241, -1.08301, 2.601181, 0.3607843, 0, 1, 1,
0.5967776, 0.1144343, 1.318281, 0.3686275, 0, 1, 1,
0.5976092, -0.2003946, 0.8176916, 0.372549, 0, 1, 1,
0.6010584, -1.759956, 3.767951, 0.3803922, 0, 1, 1,
0.606629, -1.136517, 2.575601, 0.3843137, 0, 1, 1,
0.6082833, 0.0244828, 2.470669, 0.3921569, 0, 1, 1,
0.6087804, 0.8609959, 0.08795039, 0.3960784, 0, 1, 1,
0.6134921, 1.182324, -0.2886203, 0.4039216, 0, 1, 1,
0.6146266, 1.235706, -3.376848, 0.4117647, 0, 1, 1,
0.618279, 0.03480158, 2.227282, 0.4156863, 0, 1, 1,
0.6197353, -1.45463, 4.406332, 0.4235294, 0, 1, 1,
0.6218753, -2.816718, 3.446059, 0.427451, 0, 1, 1,
0.6221896, 1.12533, 1.367312, 0.4352941, 0, 1, 1,
0.6231128, -0.2533551, 2.439983, 0.4392157, 0, 1, 1,
0.6231418, 1.145595, -0.8233214, 0.4470588, 0, 1, 1,
0.6237228, -0.4509749, 3.970644, 0.4509804, 0, 1, 1,
0.6265798, -1.114496, 3.780297, 0.4588235, 0, 1, 1,
0.6272593, -1.531928, 5.042454, 0.4627451, 0, 1, 1,
0.6345847, 0.6797308, 1.39716, 0.4705882, 0, 1, 1,
0.6408956, -2.876077, 1.456357, 0.4745098, 0, 1, 1,
0.6433784, 0.4157612, 0.4202649, 0.4823529, 0, 1, 1,
0.6454232, -1.272066, 1.973958, 0.4862745, 0, 1, 1,
0.6454378, -2.26541, 2.050033, 0.4941176, 0, 1, 1,
0.6463776, 0.3581792, 1.02596, 0.5019608, 0, 1, 1,
0.6467896, -0.1263485, 2.26607, 0.5058824, 0, 1, 1,
0.6475796, 0.06235269, 1.178803, 0.5137255, 0, 1, 1,
0.6477156, 0.7592873, 0.3072947, 0.5176471, 0, 1, 1,
0.6496018, -0.9768532, 1.686711, 0.5254902, 0, 1, 1,
0.6504415, -0.9905057, 1.420828, 0.5294118, 0, 1, 1,
0.6513079, 0.006286064, 0.1495896, 0.5372549, 0, 1, 1,
0.6691571, 1.38064, -0.9695712, 0.5411765, 0, 1, 1,
0.693092, 0.05740633, 1.691156, 0.5490196, 0, 1, 1,
0.7021553, -0.01379857, 1.236907, 0.5529412, 0, 1, 1,
0.7155964, 1.747998, -2.214217, 0.5607843, 0, 1, 1,
0.720646, 1.556232, -0.5324321, 0.5647059, 0, 1, 1,
0.7214131, 0.469455, 0.888923, 0.572549, 0, 1, 1,
0.7251019, -1.17938, 2.223724, 0.5764706, 0, 1, 1,
0.7255334, -0.9151354, 3.830362, 0.5843138, 0, 1, 1,
0.7293445, 0.2660441, 3.051386, 0.5882353, 0, 1, 1,
0.7308613, -0.08211712, 1.459532, 0.5960785, 0, 1, 1,
0.7342702, 0.9873296, 1.133989, 0.6039216, 0, 1, 1,
0.7351003, 1.118626, 1.868193, 0.6078432, 0, 1, 1,
0.7474511, -0.117164, 1.057802, 0.6156863, 0, 1, 1,
0.7492489, 0.08506615, 0.4651492, 0.6196079, 0, 1, 1,
0.7498416, -1.253262, 1.845369, 0.627451, 0, 1, 1,
0.7568345, 1.077346, 2.207, 0.6313726, 0, 1, 1,
0.7621252, -1.31768, 3.050925, 0.6392157, 0, 1, 1,
0.7673556, 0.6166225, 2.078901, 0.6431373, 0, 1, 1,
0.7711371, -0.4596611, 2.991555, 0.6509804, 0, 1, 1,
0.7747995, -0.2338158, 3.218062, 0.654902, 0, 1, 1,
0.7768007, 0.2546034, 1.582406, 0.6627451, 0, 1, 1,
0.7785928, 1.46074, 0.2961727, 0.6666667, 0, 1, 1,
0.7803962, -0.571968, 1.722536, 0.6745098, 0, 1, 1,
0.7842356, 0.4348989, -0.2689736, 0.6784314, 0, 1, 1,
0.7848378, -0.5259527, -0.9139362, 0.6862745, 0, 1, 1,
0.790476, -0.653317, 0.9869881, 0.6901961, 0, 1, 1,
0.7961559, -0.03281436, 1.698714, 0.6980392, 0, 1, 1,
0.7975585, 0.135432, 2.551111, 0.7058824, 0, 1, 1,
0.7976131, -1.05587, 2.988638, 0.7098039, 0, 1, 1,
0.7983036, 0.9193982, 0.7624117, 0.7176471, 0, 1, 1,
0.8081331, -2.715999, 1.728889, 0.7215686, 0, 1, 1,
0.8151839, 0.3524329, 1.470958, 0.7294118, 0, 1, 1,
0.816504, 0.9427402, -0.1671761, 0.7333333, 0, 1, 1,
0.8177573, -1.15978, 2.564275, 0.7411765, 0, 1, 1,
0.8209313, 0.03736643, 3.402566, 0.7450981, 0, 1, 1,
0.8303152, 0.7133021, 1.441618, 0.7529412, 0, 1, 1,
0.8366277, -1.458572, 2.496869, 0.7568628, 0, 1, 1,
0.8374985, 0.5111598, 2.533974, 0.7647059, 0, 1, 1,
0.8431424, 0.2715674, 0.9889372, 0.7686275, 0, 1, 1,
0.8449746, -1.773109, 3.330382, 0.7764706, 0, 1, 1,
0.852918, -0.7797323, 1.543452, 0.7803922, 0, 1, 1,
0.8530992, 0.09506048, 2.146952, 0.7882353, 0, 1, 1,
0.8563681, 0.09957215, 1.44309, 0.7921569, 0, 1, 1,
0.860615, 0.05882679, 1.575154, 0.8, 0, 1, 1,
0.8624964, -0.07138156, 1.534815, 0.8078431, 0, 1, 1,
0.8658726, 0.2458165, 0.5071809, 0.8117647, 0, 1, 1,
0.8669016, -1.931676, 4.282964, 0.8196079, 0, 1, 1,
0.8694422, -1.08501, 4.004738, 0.8235294, 0, 1, 1,
0.8755226, 0.04163713, 1.206784, 0.8313726, 0, 1, 1,
0.8836763, 0.6658077, 2.051058, 0.8352941, 0, 1, 1,
0.8905922, 0.61074, 1.509107, 0.8431373, 0, 1, 1,
0.8996694, 0.4807966, 0.1175178, 0.8470588, 0, 1, 1,
0.904653, 0.3669661, 3.93581, 0.854902, 0, 1, 1,
0.9088277, -1.312717, 2.543299, 0.8588235, 0, 1, 1,
0.9110386, -1.135522, 1.292264, 0.8666667, 0, 1, 1,
0.9111695, -1.794113, 2.660799, 0.8705882, 0, 1, 1,
0.9163102, -1.159896, 3.049982, 0.8784314, 0, 1, 1,
0.9232982, 1.679545, 1.677887, 0.8823529, 0, 1, 1,
0.9265635, -0.2810048, 2.120834, 0.8901961, 0, 1, 1,
0.9282929, 0.5833585, 2.797027, 0.8941177, 0, 1, 1,
0.9420182, -0.4747271, 2.722824, 0.9019608, 0, 1, 1,
0.9488989, -0.6812311, 1.808639, 0.9098039, 0, 1, 1,
0.9513025, 1.572663, -0.2632623, 0.9137255, 0, 1, 1,
0.9586277, -0.7133523, 2.032346, 0.9215686, 0, 1, 1,
0.9592183, -1.043065, 1.815162, 0.9254902, 0, 1, 1,
0.9599043, -1.200401, 1.700772, 0.9333333, 0, 1, 1,
0.9620587, 1.620611, 1.767502, 0.9372549, 0, 1, 1,
0.9626912, -1.198207, 0.6375207, 0.945098, 0, 1, 1,
0.9648167, -2.004134, 1.875967, 0.9490196, 0, 1, 1,
0.9672613, 2.024122, 0.5381651, 0.9568627, 0, 1, 1,
0.9789118, -0.2429085, 3.343713, 0.9607843, 0, 1, 1,
0.9794055, -0.5469955, 0.7254627, 0.9686275, 0, 1, 1,
0.9873304, -1.25726, 1.199353, 0.972549, 0, 1, 1,
0.9925256, 2.383043, -2.156539, 0.9803922, 0, 1, 1,
0.9946533, -2.131535, 2.337207, 0.9843137, 0, 1, 1,
1.000147, 0.8875414, 1.851249, 0.9921569, 0, 1, 1,
1.001936, 0.6256204, 0.495464, 0.9960784, 0, 1, 1,
1.008499, 0.01147824, 3.204613, 1, 0, 0.9960784, 1,
1.014522, 0.6880845, 0.6594401, 1, 0, 0.9882353, 1,
1.014857, -1.070102, 2.04527, 1, 0, 0.9843137, 1,
1.020944, -0.4426722, 2.889397, 1, 0, 0.9764706, 1,
1.042815, 1.929022, 1.409112, 1, 0, 0.972549, 1,
1.043202, 0.9238066, -1.285203, 1, 0, 0.9647059, 1,
1.043689, -1.469173, 1.601492, 1, 0, 0.9607843, 1,
1.044363, 0.8067958, 1.270567, 1, 0, 0.9529412, 1,
1.049161, -1.642403, 3.485841, 1, 0, 0.9490196, 1,
1.049857, -0.8516901, 3.692931, 1, 0, 0.9411765, 1,
1.060096, 0.658564, 0.9384127, 1, 0, 0.9372549, 1,
1.060262, -2.355947, 2.985935, 1, 0, 0.9294118, 1,
1.061712, 0.640347, 2.17097, 1, 0, 0.9254902, 1,
1.063088, -0.2715483, 0.3853847, 1, 0, 0.9176471, 1,
1.063824, 3.006156, 0.1946399, 1, 0, 0.9137255, 1,
1.070172, 0.7432337, 2.955539, 1, 0, 0.9058824, 1,
1.074797, -1.380187, 2.417715, 1, 0, 0.9019608, 1,
1.075382, 0.02286971, 1.980369, 1, 0, 0.8941177, 1,
1.083873, 0.4689747, 1.326406, 1, 0, 0.8862745, 1,
1.084304, 0.1862664, 1.263937, 1, 0, 0.8823529, 1,
1.086847, 1.159065, 0.8429663, 1, 0, 0.8745098, 1,
1.098782, 1.496799, -1.040724, 1, 0, 0.8705882, 1,
1.105067, 0.02296758, 2.58045, 1, 0, 0.8627451, 1,
1.105438, 0.6415117, 1.210413, 1, 0, 0.8588235, 1,
1.112861, -1.540625, 1.275529, 1, 0, 0.8509804, 1,
1.113898, 2.317463, 2.514108, 1, 0, 0.8470588, 1,
1.118927, -0.6463559, 0.8104824, 1, 0, 0.8392157, 1,
1.119116, -0.4926686, 4.374869, 1, 0, 0.8352941, 1,
1.13286, -1.270595, 2.381212, 1, 0, 0.827451, 1,
1.13795, 1.025963, 1.811161, 1, 0, 0.8235294, 1,
1.138774, 0.8362726, 1.458392, 1, 0, 0.8156863, 1,
1.151946, -1.083938, 3.505938, 1, 0, 0.8117647, 1,
1.15506, 0.1293461, 2.343234, 1, 0, 0.8039216, 1,
1.156531, 1.347639, 1.273683, 1, 0, 0.7960784, 1,
1.164067, 0.470721, 0.3796448, 1, 0, 0.7921569, 1,
1.172218, 0.7441285, 1.777162, 1, 0, 0.7843137, 1,
1.177759, 1.071743, 1.149595, 1, 0, 0.7803922, 1,
1.17816, -0.7721032, 1.434618, 1, 0, 0.772549, 1,
1.179551, -0.7379129, 2.979781, 1, 0, 0.7686275, 1,
1.183373, 0.9552664, 1.434411, 1, 0, 0.7607843, 1,
1.196797, 2.685624, -0.5597367, 1, 0, 0.7568628, 1,
1.203416, -0.12392, 1.861992, 1, 0, 0.7490196, 1,
1.204918, 0.1388906, 3.10727, 1, 0, 0.7450981, 1,
1.215152, 0.5969446, 1.140806, 1, 0, 0.7372549, 1,
1.217146, 0.8628244, 1.916095, 1, 0, 0.7333333, 1,
1.218129, 1.997895, 1.101314, 1, 0, 0.7254902, 1,
1.226686, 1.97795, 0.3748834, 1, 0, 0.7215686, 1,
1.229385, -0.3023079, 2.097594, 1, 0, 0.7137255, 1,
1.235589, 1.817099, -0.1245559, 1, 0, 0.7098039, 1,
1.24323, -0.5426622, 4.157024, 1, 0, 0.7019608, 1,
1.247062, -0.8977419, 2.762379, 1, 0, 0.6941177, 1,
1.248186, 0.7591513, 0.2527949, 1, 0, 0.6901961, 1,
1.250139, -0.7624233, 2.674057, 1, 0, 0.682353, 1,
1.25097, -1.550047, 2.324999, 1, 0, 0.6784314, 1,
1.252484, -1.198582, 1.815331, 1, 0, 0.6705883, 1,
1.253342, -0.4349993, 2.646931, 1, 0, 0.6666667, 1,
1.263506, 0.1118481, 2.223027, 1, 0, 0.6588235, 1,
1.272931, 1.824129, 2.666639, 1, 0, 0.654902, 1,
1.27589, 0.8538154, 2.109787, 1, 0, 0.6470588, 1,
1.276353, 0.8311586, 0.9604204, 1, 0, 0.6431373, 1,
1.278908, 0.3475967, 0.1235582, 1, 0, 0.6352941, 1,
1.285018, 0.05378627, 1.377865, 1, 0, 0.6313726, 1,
1.29006, 0.7933531, 1.405542, 1, 0, 0.6235294, 1,
1.291879, -1.042406, 3.839412, 1, 0, 0.6196079, 1,
1.300824, -0.1113176, 2.585173, 1, 0, 0.6117647, 1,
1.305494, 1.040705, 1.788042, 1, 0, 0.6078432, 1,
1.307869, 0.1212671, 0.2064656, 1, 0, 0.6, 1,
1.312226, -0.2855468, 1.768384, 1, 0, 0.5921569, 1,
1.322523, 0.8339965, 1.264568, 1, 0, 0.5882353, 1,
1.327071, 1.425612, -0.4544654, 1, 0, 0.5803922, 1,
1.355659, 0.8460107, 0.2679845, 1, 0, 0.5764706, 1,
1.359976, -0.4968781, 0.4528672, 1, 0, 0.5686275, 1,
1.36874, 1.144716, -0.5134954, 1, 0, 0.5647059, 1,
1.368941, -0.2227118, 2.589526, 1, 0, 0.5568628, 1,
1.373301, 0.0743262, 0.6807116, 1, 0, 0.5529412, 1,
1.379535, -0.1216623, 0.9313295, 1, 0, 0.5450981, 1,
1.390989, -0.1071028, 1.67952, 1, 0, 0.5411765, 1,
1.392974, 0.7213692, 2.9166, 1, 0, 0.5333334, 1,
1.40147, 1.03832, 1.984988, 1, 0, 0.5294118, 1,
1.401621, -0.3930575, 1.158616, 1, 0, 0.5215687, 1,
1.406188, 0.947863, 1.757288, 1, 0, 0.5176471, 1,
1.413183, 0.2088814, 0.6475419, 1, 0, 0.509804, 1,
1.413477, 1.053095, 3.13151, 1, 0, 0.5058824, 1,
1.414946, 1.259204, 0.2182985, 1, 0, 0.4980392, 1,
1.415075, 0.816582, 0.3414714, 1, 0, 0.4901961, 1,
1.417658, 1.469833, 0.3951246, 1, 0, 0.4862745, 1,
1.431379, -0.594425, 1.539917, 1, 0, 0.4784314, 1,
1.439946, 0.4594163, 0.9030184, 1, 0, 0.4745098, 1,
1.440627, -1.009331, 3.301431, 1, 0, 0.4666667, 1,
1.44579, 0.1611577, 1.054608, 1, 0, 0.4627451, 1,
1.446583, -0.5332667, 1.263661, 1, 0, 0.454902, 1,
1.453313, -0.4264727, 3.910675, 1, 0, 0.4509804, 1,
1.464139, -1.243587, 2.942199, 1, 0, 0.4431373, 1,
1.466907, -1.856256, 3.019344, 1, 0, 0.4392157, 1,
1.468933, 0.9421938, 0.8597929, 1, 0, 0.4313726, 1,
1.476454, -0.1673312, 1.347902, 1, 0, 0.427451, 1,
1.47677, -0.8224751, 2.291339, 1, 0, 0.4196078, 1,
1.492206, 0.1347749, 1.719523, 1, 0, 0.4156863, 1,
1.495982, 1.285986, 0.2691596, 1, 0, 0.4078431, 1,
1.51125, 2.07145, 1.062281, 1, 0, 0.4039216, 1,
1.517339, 0.3081846, 2.307955, 1, 0, 0.3960784, 1,
1.526479, 0.3030736, 3.563664, 1, 0, 0.3882353, 1,
1.533479, -1.896036, 2.183938, 1, 0, 0.3843137, 1,
1.549405, -0.5363987, 1.670661, 1, 0, 0.3764706, 1,
1.557926, 0.03596097, 2.254862, 1, 0, 0.372549, 1,
1.584354, -0.4852305, 3.160673, 1, 0, 0.3647059, 1,
1.584692, 1.750864, 1.230762, 1, 0, 0.3607843, 1,
1.584916, 0.6617961, 0.135962, 1, 0, 0.3529412, 1,
1.585059, -1.254266, 3.462122, 1, 0, 0.3490196, 1,
1.590448, 0.4265874, 1.373119, 1, 0, 0.3411765, 1,
1.603371, -1.670498, 3.942511, 1, 0, 0.3372549, 1,
1.609563, 0.9701007, 0.428277, 1, 0, 0.3294118, 1,
1.614866, -0.7283713, 2.440605, 1, 0, 0.3254902, 1,
1.617156, -0.1219087, 2.300509, 1, 0, 0.3176471, 1,
1.623092, 0.2425075, -0.5380372, 1, 0, 0.3137255, 1,
1.628858, -0.5083769, 2.659028, 1, 0, 0.3058824, 1,
1.630171, 0.4097237, 0.8681551, 1, 0, 0.2980392, 1,
1.653299, 1.154187, 0.2757604, 1, 0, 0.2941177, 1,
1.658039, -0.2258162, 0.5789837, 1, 0, 0.2862745, 1,
1.67817, -0.4943625, 1.246398, 1, 0, 0.282353, 1,
1.681346, -1.751783, 1.959851, 1, 0, 0.2745098, 1,
1.68275, -0.3571718, 1.482081, 1, 0, 0.2705882, 1,
1.68834, -0.1578214, 0.6002888, 1, 0, 0.2627451, 1,
1.688734, 0.5710101, 0.6496254, 1, 0, 0.2588235, 1,
1.702287, -0.9598616, 0.01603769, 1, 0, 0.2509804, 1,
1.704004, -0.5005315, 1.491655, 1, 0, 0.2470588, 1,
1.734079, 0.2492446, 2.568815, 1, 0, 0.2392157, 1,
1.74544, -0.9462125, 3.07185, 1, 0, 0.2352941, 1,
1.757452, 0.4950944, 1.045461, 1, 0, 0.227451, 1,
1.770884, -0.2116449, 2.610832, 1, 0, 0.2235294, 1,
1.79227, -0.2561464, 0.4901441, 1, 0, 0.2156863, 1,
1.79343, -0.951277, 2.454784, 1, 0, 0.2117647, 1,
1.876996, -2.241602, 3.074358, 1, 0, 0.2039216, 1,
1.883314, -0.2730175, 1.520711, 1, 0, 0.1960784, 1,
1.885246, 1.599586, 0.547889, 1, 0, 0.1921569, 1,
1.892578, -0.4320043, 1.053545, 1, 0, 0.1843137, 1,
1.897324, 0.02951207, 0.873346, 1, 0, 0.1803922, 1,
1.907308, 0.7806408, 1.212906, 1, 0, 0.172549, 1,
1.910019, -1.490811, 0.6907765, 1, 0, 0.1686275, 1,
1.927646, -0.2562617, -0.2869354, 1, 0, 0.1607843, 1,
1.947559, -1.00725, 3.204635, 1, 0, 0.1568628, 1,
1.966311, 0.3394829, 1.838693, 1, 0, 0.1490196, 1,
1.978517, 1.974475, -1.032924, 1, 0, 0.145098, 1,
2.018032, 0.07749984, 1.787745, 1, 0, 0.1372549, 1,
2.022104, -0.9717923, 0.4906991, 1, 0, 0.1333333, 1,
2.049973, -0.02582694, 3.557108, 1, 0, 0.1254902, 1,
2.053403, -0.08250175, 2.686107, 1, 0, 0.1215686, 1,
2.088326, -0.2994386, 1.975193, 1, 0, 0.1137255, 1,
2.10556, 2.502283, -1.019232, 1, 0, 0.1098039, 1,
2.165678, 0.7695253, -0.572521, 1, 0, 0.1019608, 1,
2.171987, -0.6051378, 2.149241, 1, 0, 0.09411765, 1,
2.209032, 0.2562174, 1.609342, 1, 0, 0.09019608, 1,
2.246569, 0.7277477, 0.8485217, 1, 0, 0.08235294, 1,
2.262019, 0.1259954, 1.952645, 1, 0, 0.07843138, 1,
2.281812, 0.4398982, 0.6218008, 1, 0, 0.07058824, 1,
2.317233, 1.188741, 2.544297, 1, 0, 0.06666667, 1,
2.342405, -0.5065892, 1.831516, 1, 0, 0.05882353, 1,
2.376081, 0.3436563, -0.1453778, 1, 0, 0.05490196, 1,
2.394144, -1.035575, 4.66588, 1, 0, 0.04705882, 1,
2.4873, -0.1648198, 1.869248, 1, 0, 0.04313726, 1,
2.494395, 0.7028055, 2.085333, 1, 0, 0.03529412, 1,
2.537344, 0.3063318, 1.515876, 1, 0, 0.03137255, 1,
2.6269, -1.185736, 0.2542278, 1, 0, 0.02352941, 1,
2.741725, 0.2384477, 0.9678285, 1, 0, 0.01960784, 1,
2.75341, -0.8031834, 0.7650743, 1, 0, 0.01176471, 1,
3.330795, 1.278755, 1.112499, 1, 0, 0.007843138, 1
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
-0.1250348, -3.93242, -6.825149, 0, -0.5, 0.5, 0.5,
-0.1250348, -3.93242, -6.825149, 1, -0.5, 0.5, 0.5,
-0.1250348, -3.93242, -6.825149, 1, 1.5, 0.5, 0.5,
-0.1250348, -3.93242, -6.825149, 0, 1.5, 0.5, 0.5
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
-4.752391, 0.03968501, -6.825149, 0, -0.5, 0.5, 0.5,
-4.752391, 0.03968501, -6.825149, 1, -0.5, 0.5, 0.5,
-4.752391, 0.03968501, -6.825149, 1, 1.5, 0.5, 0.5,
-4.752391, 0.03968501, -6.825149, 0, 1.5, 0.5, 0.5
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
-4.752391, -3.93242, -0.03133917, 0, -0.5, 0.5, 0.5,
-4.752391, -3.93242, -0.03133917, 1, -0.5, 0.5, 0.5,
-4.752391, -3.93242, -0.03133917, 1, 1.5, 0.5, 0.5,
-4.752391, -3.93242, -0.03133917, 0, 1.5, 0.5, 0.5
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
-3, -3.01578, -5.257346,
3, -3.01578, -5.257346,
-3, -3.01578, -5.257346,
-3, -3.168554, -5.518647,
-2, -3.01578, -5.257346,
-2, -3.168554, -5.518647,
-1, -3.01578, -5.257346,
-1, -3.168554, -5.518647,
0, -3.01578, -5.257346,
0, -3.168554, -5.518647,
1, -3.01578, -5.257346,
1, -3.168554, -5.518647,
2, -3.01578, -5.257346,
2, -3.168554, -5.518647,
3, -3.01578, -5.257346,
3, -3.168554, -5.518647
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
-3, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
-3, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
-3, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
-3, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
-2, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
-2, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
-2, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
-2, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
-1, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
-1, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
-1, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
-1, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
0, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
0, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
0, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
0, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
1, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
1, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
1, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
1, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
2, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
2, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
2, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
2, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5,
3, -3.4741, -6.041247, 0, -0.5, 0.5, 0.5,
3, -3.4741, -6.041247, 1, -0.5, 0.5, 0.5,
3, -3.4741, -6.041247, 1, 1.5, 0.5, 0.5,
3, -3.4741, -6.041247, 0, 1.5, 0.5, 0.5
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
-3.684539, -2, -5.257346,
-3.684539, 3, -5.257346,
-3.684539, -2, -5.257346,
-3.862514, -2, -5.518647,
-3.684539, -1, -5.257346,
-3.862514, -1, -5.518647,
-3.684539, 0, -5.257346,
-3.862514, 0, -5.518647,
-3.684539, 1, -5.257346,
-3.862514, 1, -5.518647,
-3.684539, 2, -5.257346,
-3.862514, 2, -5.518647,
-3.684539, 3, -5.257346,
-3.862514, 3, -5.518647
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
-4.218465, -2, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, -2, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, -2, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, -2, -6.041247, 0, 1.5, 0.5, 0.5,
-4.218465, -1, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, -1, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, -1, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, -1, -6.041247, 0, 1.5, 0.5, 0.5,
-4.218465, 0, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, 0, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, 0, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, 0, -6.041247, 0, 1.5, 0.5, 0.5,
-4.218465, 1, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, 1, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, 1, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, 1, -6.041247, 0, 1.5, 0.5, 0.5,
-4.218465, 2, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, 2, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, 2, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, 2, -6.041247, 0, 1.5, 0.5, 0.5,
-4.218465, 3, -6.041247, 0, -0.5, 0.5, 0.5,
-4.218465, 3, -6.041247, 1, -0.5, 0.5, 0.5,
-4.218465, 3, -6.041247, 1, 1.5, 0.5, 0.5,
-4.218465, 3, -6.041247, 0, 1.5, 0.5, 0.5
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
-3.684539, -3.01578, -4,
-3.684539, -3.01578, 4,
-3.684539, -3.01578, -4,
-3.862514, -3.168554, -4,
-3.684539, -3.01578, -2,
-3.862514, -3.168554, -2,
-3.684539, -3.01578, 0,
-3.862514, -3.168554, 0,
-3.684539, -3.01578, 2,
-3.862514, -3.168554, 2,
-3.684539, -3.01578, 4,
-3.862514, -3.168554, 4
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
-4.218465, -3.4741, -4, 0, -0.5, 0.5, 0.5,
-4.218465, -3.4741, -4, 1, -0.5, 0.5, 0.5,
-4.218465, -3.4741, -4, 1, 1.5, 0.5, 0.5,
-4.218465, -3.4741, -4, 0, 1.5, 0.5, 0.5,
-4.218465, -3.4741, -2, 0, -0.5, 0.5, 0.5,
-4.218465, -3.4741, -2, 1, -0.5, 0.5, 0.5,
-4.218465, -3.4741, -2, 1, 1.5, 0.5, 0.5,
-4.218465, -3.4741, -2, 0, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 0, 0, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 0, 1, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 0, 1, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 0, 0, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 2, 0, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 2, 1, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 2, 1, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 2, 0, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 4, 0, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 4, 1, -0.5, 0.5, 0.5,
-4.218465, -3.4741, 4, 1, 1.5, 0.5, 0.5,
-4.218465, -3.4741, 4, 0, 1.5, 0.5, 0.5
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
-3.684539, -3.01578, -5.257346,
-3.684539, 3.09515, -5.257346,
-3.684539, -3.01578, 5.194668,
-3.684539, 3.09515, 5.194668,
-3.684539, -3.01578, -5.257346,
-3.684539, -3.01578, 5.194668,
-3.684539, 3.09515, -5.257346,
-3.684539, 3.09515, 5.194668,
-3.684539, -3.01578, -5.257346,
3.43447, -3.01578, -5.257346,
-3.684539, -3.01578, 5.194668,
3.43447, -3.01578, 5.194668,
-3.684539, 3.09515, -5.257346,
3.43447, 3.09515, -5.257346,
-3.684539, 3.09515, 5.194668,
3.43447, 3.09515, 5.194668,
3.43447, -3.01578, -5.257346,
3.43447, 3.09515, -5.257346,
3.43447, -3.01578, 5.194668,
3.43447, 3.09515, 5.194668,
3.43447, -3.01578, -5.257346,
3.43447, -3.01578, 5.194668,
3.43447, 3.09515, -5.257346,
3.43447, 3.09515, 5.194668
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
var radius = 7.499878;
var distance = 33.3678;
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
mvMatrix.translate( 0.1250348, -0.03968501, 0.03133917 );
mvMatrix.scale( 1.139065, 1.326969, 0.7758328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.3678);
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
fenpiclonil<-read.table("fenpiclonil.xyz")
```

```
## Error in read.table("fenpiclonil.xyz"): no lines available in input
```

```r
x<-fenpiclonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
y<-fenpiclonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
z<-fenpiclonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
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
-3.580864, 0.976168, -1.273604, 0, 0, 1, 1, 1,
-2.611722, -0.1709152, -2.264314, 1, 0, 0, 1, 1,
-2.555437, -1.692208, -1.497457, 1, 0, 0, 1, 1,
-2.447966, 0.2544635, -1.015632, 1, 0, 0, 1, 1,
-2.428082, 1.017219, 0.04919074, 1, 0, 0, 1, 1,
-2.427061, 0.7711151, -1.374892, 1, 0, 0, 1, 1,
-2.395365, 1.31367, -1.211928, 0, 0, 0, 1, 1,
-2.375334, 0.2513145, -1.647097, 0, 0, 0, 1, 1,
-2.369652, 0.1592076, -1.148449, 0, 0, 0, 1, 1,
-2.351917, -0.7609258, -3.196217, 0, 0, 0, 1, 1,
-2.258081, 0.865755, 0.05754993, 0, 0, 0, 1, 1,
-2.237357, 0.06771257, -1.177976, 0, 0, 0, 1, 1,
-2.17259, 0.03745712, -3.135734, 0, 0, 0, 1, 1,
-2.162501, 0.2493938, -1.110254, 1, 1, 1, 1, 1,
-2.055183, -1.745888, -3.217093, 1, 1, 1, 1, 1,
-2.027786, -0.1191503, -0.9920885, 1, 1, 1, 1, 1,
-2.00932, -1.000834, -3.801779, 1, 1, 1, 1, 1,
-1.983651, -0.1832831, -1.738699, 1, 1, 1, 1, 1,
-1.959828, -1.848425, -2.567995, 1, 1, 1, 1, 1,
-1.951901, -1.553427, -2.587475, 1, 1, 1, 1, 1,
-1.937622, 0.7205045, 0.1126341, 1, 1, 1, 1, 1,
-1.928046, -0.5134608, -1.352284, 1, 1, 1, 1, 1,
-1.927431, 0.04757532, -2.064534, 1, 1, 1, 1, 1,
-1.925364, 0.3339021, -2.388643, 1, 1, 1, 1, 1,
-1.913424, -0.4990671, 0.1326281, 1, 1, 1, 1, 1,
-1.913054, -0.9136852, -2.23814, 1, 1, 1, 1, 1,
-1.905552, -0.2125749, -2.664051, 1, 1, 1, 1, 1,
-1.898943, 1.688494, -2.095547, 1, 1, 1, 1, 1,
-1.897777, -1.807027, -2.398726, 0, 0, 1, 1, 1,
-1.888018, 0.3060622, -1.143816, 1, 0, 0, 1, 1,
-1.885219, 0.4921181, -1.618926, 1, 0, 0, 1, 1,
-1.884954, -0.4378971, -0.7116303, 1, 0, 0, 1, 1,
-1.884248, 0.2822652, -2.233289, 1, 0, 0, 1, 1,
-1.856044, 1.803849, -2.406927, 1, 0, 0, 1, 1,
-1.854351, 1.460008, -1.121806, 0, 0, 0, 1, 1,
-1.826792, -1.51632, -2.928221, 0, 0, 0, 1, 1,
-1.780496, -0.1438618, -2.888176, 0, 0, 0, 1, 1,
-1.778615, -2.032653, -2.197983, 0, 0, 0, 1, 1,
-1.770858, 0.9954911, -0.1521245, 0, 0, 0, 1, 1,
-1.761519, -0.5152279, -1.861423, 0, 0, 0, 1, 1,
-1.758998, -0.5233122, -2.465387, 0, 0, 0, 1, 1,
-1.747183, 0.5883956, -1.90148, 1, 1, 1, 1, 1,
-1.745598, 0.9806148, -1.983001, 1, 1, 1, 1, 1,
-1.731602, -1.364888, -1.566307, 1, 1, 1, 1, 1,
-1.727685, 0.9260077, 0.504654, 1, 1, 1, 1, 1,
-1.72208, -0.74056, -3.335938, 1, 1, 1, 1, 1,
-1.715272, 1.150283, -0.9080361, 1, 1, 1, 1, 1,
-1.702378, 0.1643249, -2.822417, 1, 1, 1, 1, 1,
-1.694058, -0.001280291, -1.972879, 1, 1, 1, 1, 1,
-1.669841, -1.751816, -2.542307, 1, 1, 1, 1, 1,
-1.663313, 2.06807, -0.7863466, 1, 1, 1, 1, 1,
-1.659036, -0.01710273, -1.757331, 1, 1, 1, 1, 1,
-1.646426, -1.191363, -1.340816, 1, 1, 1, 1, 1,
-1.644035, -2.23972, -0.2732539, 1, 1, 1, 1, 1,
-1.641342, 0.4640545, -1.562844, 1, 1, 1, 1, 1,
-1.621055, -1.459478, -2.537557, 1, 1, 1, 1, 1,
-1.606045, -1.131297, -2.911814, 0, 0, 1, 1, 1,
-1.603802, 0.2387948, -2.774091, 1, 0, 0, 1, 1,
-1.589534, 0.3729784, -0.05782279, 1, 0, 0, 1, 1,
-1.55896, -0.5071303, -1.19703, 1, 0, 0, 1, 1,
-1.556255, -0.6002759, -1.931418, 1, 0, 0, 1, 1,
-1.553645, -0.4512337, -3.615103, 1, 0, 0, 1, 1,
-1.544514, -0.4666587, -0.6996536, 0, 0, 0, 1, 1,
-1.529378, -1.061538, -0.9022108, 0, 0, 0, 1, 1,
-1.528966, 1.007292, 0.1659686, 0, 0, 0, 1, 1,
-1.528768, 0.6221679, -0.881664, 0, 0, 0, 1, 1,
-1.521031, 0.1509171, -0.890752, 0, 0, 0, 1, 1,
-1.519048, 0.7747126, -0.2174949, 0, 0, 0, 1, 1,
-1.513265, -0.6893337, -2.031844, 0, 0, 0, 1, 1,
-1.509345, -0.1748849, -1.731148, 1, 1, 1, 1, 1,
-1.495351, -0.7915293, -0.8630818, 1, 1, 1, 1, 1,
-1.490488, -0.6122047, -1.348054, 1, 1, 1, 1, 1,
-1.482478, 0.7259843, -0.9310966, 1, 1, 1, 1, 1,
-1.4777, 1.447632, -0.1249223, 1, 1, 1, 1, 1,
-1.477231, 0.3984017, -1.087968, 1, 1, 1, 1, 1,
-1.463922, 1.207558, -1.12926, 1, 1, 1, 1, 1,
-1.453373, 1.016441, -3.090899, 1, 1, 1, 1, 1,
-1.445329, 0.5996, -1.441575, 1, 1, 1, 1, 1,
-1.434456, -0.3335372, -1.674142, 1, 1, 1, 1, 1,
-1.433456, -0.6441454, -2.095711, 1, 1, 1, 1, 1,
-1.432293, -0.4216897, -2.252735, 1, 1, 1, 1, 1,
-1.427678, 1.489944, -1.6502, 1, 1, 1, 1, 1,
-1.424167, 0.2973819, 0.3748975, 1, 1, 1, 1, 1,
-1.421084, -1.697223, -2.510037, 1, 1, 1, 1, 1,
-1.41292, 0.7833619, 0.4137439, 0, 0, 1, 1, 1,
-1.412813, -0.650683, -2.780591, 1, 0, 0, 1, 1,
-1.401172, -0.5315744, -1.382898, 1, 0, 0, 1, 1,
-1.390536, -0.4661239, -0.9382371, 1, 0, 0, 1, 1,
-1.390073, 0.8421074, -0.9148337, 1, 0, 0, 1, 1,
-1.364217, -0.5403365, -2.686411, 1, 0, 0, 1, 1,
-1.356135, -0.318633, -1.72921, 0, 0, 0, 1, 1,
-1.350313, 0.1553688, -2.849443, 0, 0, 0, 1, 1,
-1.331043, -0.3698903, -0.6762385, 0, 0, 0, 1, 1,
-1.327824, 1.898814, 0.2007914, 0, 0, 0, 1, 1,
-1.326312, 0.4806011, -2.645059, 0, 0, 0, 1, 1,
-1.320507, -0.6209175, -4.105526, 0, 0, 0, 1, 1,
-1.308072, -1.001779, -1.704223, 0, 0, 0, 1, 1,
-1.306052, 0.1023387, -1.943713, 1, 1, 1, 1, 1,
-1.305265, -2.926786, -1.072443, 1, 1, 1, 1, 1,
-1.299827, -1.356286, -3.514342, 1, 1, 1, 1, 1,
-1.299123, 1.544239, 1.687643, 1, 1, 1, 1, 1,
-1.290585, 0.3582729, -1.739241, 1, 1, 1, 1, 1,
-1.288748, -0.394327, -1.13196, 1, 1, 1, 1, 1,
-1.288168, 1.366477, -0.1722538, 1, 1, 1, 1, 1,
-1.279041, 0.6059394, -1.091286, 1, 1, 1, 1, 1,
-1.274325, -0.9737893, -2.622387, 1, 1, 1, 1, 1,
-1.271809, -0.9020904, -3.069037, 1, 1, 1, 1, 1,
-1.269139, -1.574239, -1.656481, 1, 1, 1, 1, 1,
-1.265786, 0.7020437, -0.1687077, 1, 1, 1, 1, 1,
-1.2603, 0.6917489, -2.218484, 1, 1, 1, 1, 1,
-1.257987, 0.1571832, -1.897122, 1, 1, 1, 1, 1,
-1.252516, -0.7076163, -3.40768, 1, 1, 1, 1, 1,
-1.249742, 0.3402563, -1.066821, 0, 0, 1, 1, 1,
-1.248625, -0.6158239, -2.853098, 1, 0, 0, 1, 1,
-1.233146, 0.4079401, -0.3390833, 1, 0, 0, 1, 1,
-1.227666, 0.8241628, -0.7413284, 1, 0, 0, 1, 1,
-1.226648, 1.053029, -3.10208, 1, 0, 0, 1, 1,
-1.226358, -0.8373587, -2.7477, 1, 0, 0, 1, 1,
-1.224933, 1.025773, -0.3259567, 0, 0, 0, 1, 1,
-1.217109, 0.1267323, -1.645048, 0, 0, 0, 1, 1,
-1.213664, 0.600244, -0.3263864, 0, 0, 0, 1, 1,
-1.20858, 1.537086, -2.503603, 0, 0, 0, 1, 1,
-1.198632, -1.197464, -3.601445, 0, 0, 0, 1, 1,
-1.191577, -0.4179189, -2.617675, 0, 0, 0, 1, 1,
-1.185467, -0.6735368, -0.9561669, 0, 0, 0, 1, 1,
-1.183013, -1.579331, -3.106895, 1, 1, 1, 1, 1,
-1.181562, -0.8524083, -1.410855, 1, 1, 1, 1, 1,
-1.174035, -1.158465, -3.474034, 1, 1, 1, 1, 1,
-1.170635, -0.633158, -2.479147, 1, 1, 1, 1, 1,
-1.157515, -0.8298414, -3.559008, 1, 1, 1, 1, 1,
-1.153448, 0.6033052, -0.4045609, 1, 1, 1, 1, 1,
-1.138403, 0.8406999, -3.301782, 1, 1, 1, 1, 1,
-1.13683, 0.3857516, -0.5466448, 1, 1, 1, 1, 1,
-1.133551, -0.1910155, -2.715404, 1, 1, 1, 1, 1,
-1.128398, -1.78035, -3.327544, 1, 1, 1, 1, 1,
-1.122603, 1.932428, -0.8991218, 1, 1, 1, 1, 1,
-1.117414, 0.5980548, -3.239136, 1, 1, 1, 1, 1,
-1.116347, 0.1026126, -2.444211, 1, 1, 1, 1, 1,
-1.115236, 1.267576, -0.5509084, 1, 1, 1, 1, 1,
-1.106208, -0.4457335, -2.154112, 1, 1, 1, 1, 1,
-1.103282, -1.362892, -2.454588, 0, 0, 1, 1, 1,
-1.089953, -0.3206115, -1.62959, 1, 0, 0, 1, 1,
-1.083602, 1.072075, -0.3950481, 1, 0, 0, 1, 1,
-1.082189, -0.08607213, -2.460387, 1, 0, 0, 1, 1,
-1.07068, 2.595953, 0.3207461, 1, 0, 0, 1, 1,
-1.070671, -0.7548426, -1.239193, 1, 0, 0, 1, 1,
-1.070534, 0.3849761, -1.3267, 0, 0, 0, 1, 1,
-1.069932, 0.6995303, -0.05094819, 0, 0, 0, 1, 1,
-1.067071, 1.008316, 0.6411654, 0, 0, 0, 1, 1,
-1.064012, 0.5381213, -1.117244, 0, 0, 0, 1, 1,
-1.053805, -0.2723098, -3.882962, 0, 0, 0, 1, 1,
-1.05345, 1.418527, 0.4833245, 0, 0, 0, 1, 1,
-1.052278, 0.9266911, -0.9453975, 0, 0, 0, 1, 1,
-1.047115, -1.124135, -2.572042, 1, 1, 1, 1, 1,
-1.042755, 0.3284785, -1.550195, 1, 1, 1, 1, 1,
-1.04247, 0.1249844, 0.9853614, 1, 1, 1, 1, 1,
-1.039389, 1.431098, 0.005551208, 1, 1, 1, 1, 1,
-1.034716, -1.038131, -3.695098, 1, 1, 1, 1, 1,
-1.031881, -1.983991, -1.958365, 1, 1, 1, 1, 1,
-1.030598, 0.8620566, -0.268385, 1, 1, 1, 1, 1,
-1.020853, 0.6808797, -0.6888693, 1, 1, 1, 1, 1,
-1.01756, -0.9444385, -1.59272, 1, 1, 1, 1, 1,
-1.004162, 0.428151, -1.272012, 1, 1, 1, 1, 1,
-1.004111, -0.2268732, -2.011395, 1, 1, 1, 1, 1,
-1.001699, -1.414841, -3.374704, 1, 1, 1, 1, 1,
-1.001368, -0.6848116, -1.362871, 1, 1, 1, 1, 1,
-0.9979824, -0.7927269, -2.634484, 1, 1, 1, 1, 1,
-0.9978556, 0.5206649, -1.003721, 1, 1, 1, 1, 1,
-0.9951513, -0.02035744, -1.209008, 0, 0, 1, 1, 1,
-0.9925013, -0.5647795, -1.486681, 1, 0, 0, 1, 1,
-0.987112, -0.1755858, -1.068946, 1, 0, 0, 1, 1,
-0.9865782, -1.679253, -1.777687, 1, 0, 0, 1, 1,
-0.9830352, -1.433917, -2.963806, 1, 0, 0, 1, 1,
-0.9803963, 1.065173, -0.9654394, 1, 0, 0, 1, 1,
-0.9781053, -1.030515, -3.663389, 0, 0, 0, 1, 1,
-0.9694464, 0.6671527, -0.5011725, 0, 0, 0, 1, 1,
-0.9608679, 0.6881319, -0.2605834, 0, 0, 0, 1, 1,
-0.9601316, 0.06492875, -1.527651, 0, 0, 0, 1, 1,
-0.9509687, 0.8921158, -1.04526, 0, 0, 0, 1, 1,
-0.947798, 0.9237692, 0.01080579, 0, 0, 0, 1, 1,
-0.9470168, 0.5145374, 0.9247102, 0, 0, 0, 1, 1,
-0.9443841, 0.7921886, -0.1139553, 1, 1, 1, 1, 1,
-0.9288241, 0.04237643, -1.709114, 1, 1, 1, 1, 1,
-0.9277847, 0.7808161, -2.86496, 1, 1, 1, 1, 1,
-0.9236801, 0.0184761, -2.024706, 1, 1, 1, 1, 1,
-0.9222977, 0.2660707, -1.807736, 1, 1, 1, 1, 1,
-0.919655, 0.9598954, -0.6504986, 1, 1, 1, 1, 1,
-0.9112865, 0.7295812, -2.157155, 1, 1, 1, 1, 1,
-0.9023314, -0.3907712, -4.012683, 1, 1, 1, 1, 1,
-0.9002472, 0.368692, 1.141317, 1, 1, 1, 1, 1,
-0.892854, -0.1368748, 0.7300349, 1, 1, 1, 1, 1,
-0.8901087, 0.8556278, -2.1582, 1, 1, 1, 1, 1,
-0.8865551, 0.1958838, -2.082021, 1, 1, 1, 1, 1,
-0.8845819, 0.969915, -1.547038, 1, 1, 1, 1, 1,
-0.8831449, 0.2474021, -3.043839, 1, 1, 1, 1, 1,
-0.8814309, -1.233253, -2.951049, 1, 1, 1, 1, 1,
-0.8803493, 1.147178, -0.4033666, 0, 0, 1, 1, 1,
-0.8776159, 2.9378, -0.4874989, 1, 0, 0, 1, 1,
-0.8769946, 0.005654863, -3.660688, 1, 0, 0, 1, 1,
-0.8750394, 0.3927377, 0.6415513, 1, 0, 0, 1, 1,
-0.875012, 0.2589863, -0.564047, 1, 0, 0, 1, 1,
-0.872371, 0.9665811, -2.399546, 1, 0, 0, 1, 1,
-0.8713782, -1.331536, -4.991029, 0, 0, 0, 1, 1,
-0.8686519, -0.190259, -1.753185, 0, 0, 0, 1, 1,
-0.8604633, 1.610382, 0.4444585, 0, 0, 0, 1, 1,
-0.8545544, -1.476614, -1.759845, 0, 0, 0, 1, 1,
-0.8523753, -0.4340783, -2.88081, 0, 0, 0, 1, 1,
-0.8505678, -0.4309426, -0.82292, 0, 0, 0, 1, 1,
-0.8497051, -0.824916, -3.255892, 0, 0, 0, 1, 1,
-0.8487847, -0.5280073, -1.143484, 1, 1, 1, 1, 1,
-0.8467333, -0.07639617, -1.417025, 1, 1, 1, 1, 1,
-0.8444942, -0.2021895, -0.2382125, 1, 1, 1, 1, 1,
-0.8431638, -0.3080652, -1.645794, 1, 1, 1, 1, 1,
-0.8430812, 0.561451, -0.8486769, 1, 1, 1, 1, 1,
-0.8429106, 1.228369, -0.3496687, 1, 1, 1, 1, 1,
-0.8395457, -1.864973, -1.801908, 1, 1, 1, 1, 1,
-0.8313058, -2.647113, -2.575266, 1, 1, 1, 1, 1,
-0.8290724, 0.5634466, -1.768241, 1, 1, 1, 1, 1,
-0.8268118, 1.095131, 0.0862985, 1, 1, 1, 1, 1,
-0.8206443, 1.967704, -1.86359, 1, 1, 1, 1, 1,
-0.8194397, 1.087725, -1.38932, 1, 1, 1, 1, 1,
-0.8167417, 0.9986584, -2.01999, 1, 1, 1, 1, 1,
-0.8094183, -0.05146385, -2.091155, 1, 1, 1, 1, 1,
-0.8008506, -0.8230003, -1.870474, 1, 1, 1, 1, 1,
-0.7999045, -0.5234715, -2.083642, 0, 0, 1, 1, 1,
-0.7956545, -0.4655456, -2.163652, 1, 0, 0, 1, 1,
-0.7954946, 1.059587, -0.243872, 1, 0, 0, 1, 1,
-0.7951617, 0.4025384, -2.63771, 1, 0, 0, 1, 1,
-0.7942922, 1.239095, -3.062652, 1, 0, 0, 1, 1,
-0.7927068, 1.405411, -1.913098, 1, 0, 0, 1, 1,
-0.7921446, -0.2375083, -1.200555, 0, 0, 0, 1, 1,
-0.7908872, 0.05167551, -3.396153, 0, 0, 0, 1, 1,
-0.7885931, 0.09156585, -0.1477281, 0, 0, 0, 1, 1,
-0.7727452, 1.246861, 0.464561, 0, 0, 0, 1, 1,
-0.7625348, 0.6409299, -1.925871, 0, 0, 0, 1, 1,
-0.7595024, -1.229745, -2.418207, 0, 0, 0, 1, 1,
-0.7591159, 0.3358567, -0.01005093, 0, 0, 0, 1, 1,
-0.7584009, -1.737535, -2.886443, 1, 1, 1, 1, 1,
-0.7583022, -0.08690974, -0.8211471, 1, 1, 1, 1, 1,
-0.7500346, -0.08224443, -0.2453743, 1, 1, 1, 1, 1,
-0.7472955, 0.1837105, -2.281736, 1, 1, 1, 1, 1,
-0.7433198, -0.6751995, 0.07036791, 1, 1, 1, 1, 1,
-0.7386453, 0.2227602, -2.006829, 1, 1, 1, 1, 1,
-0.7313256, 0.4483864, -3.223972, 1, 1, 1, 1, 1,
-0.7300097, -1.409217, -2.996821, 1, 1, 1, 1, 1,
-0.7285535, -2.093262, -1.101808, 1, 1, 1, 1, 1,
-0.7221029, 0.6274008, -1.346624, 1, 1, 1, 1, 1,
-0.7214069, 0.1008761, -2.59773, 1, 1, 1, 1, 1,
-0.703263, -0.08358262, -2.301847, 1, 1, 1, 1, 1,
-0.7003844, 0.2866833, 0.5888077, 1, 1, 1, 1, 1,
-0.7001839, 0.2056046, -2.224557, 1, 1, 1, 1, 1,
-0.6980918, 1.272206, 2.201686, 1, 1, 1, 1, 1,
-0.6969776, 1.856936, -1.332787, 0, 0, 1, 1, 1,
-0.6962144, 0.4968067, -1.300593, 1, 0, 0, 1, 1,
-0.6853291, 1.622534, -1.032607, 1, 0, 0, 1, 1,
-0.679269, 0.5426463, 0.2825294, 1, 0, 0, 1, 1,
-0.6735821, 0.826611, -1.558972, 1, 0, 0, 1, 1,
-0.6681838, -1.252994, -2.431898, 1, 0, 0, 1, 1,
-0.6677064, 1.103441, 0.8823407, 0, 0, 0, 1, 1,
-0.6623442, 0.4254874, -1.632784, 0, 0, 0, 1, 1,
-0.6589212, 0.5348538, -0.6219297, 0, 0, 0, 1, 1,
-0.6498168, 1.712044, -2.628212, 0, 0, 0, 1, 1,
-0.6491946, -0.2334915, -2.426432, 0, 0, 0, 1, 1,
-0.6463481, 1.731644, 0.0276448, 0, 0, 0, 1, 1,
-0.6451669, -0.1187344, -2.503105, 0, 0, 0, 1, 1,
-0.6410459, 0.4791616, -1.036346, 1, 1, 1, 1, 1,
-0.6365573, 0.1346124, -2.45553, 1, 1, 1, 1, 1,
-0.635989, 0.09646557, -0.7805644, 1, 1, 1, 1, 1,
-0.6312587, 1.155472, 1.601325, 1, 1, 1, 1, 1,
-0.6311473, 1.00555, -1.928175, 1, 1, 1, 1, 1,
-0.6292545, -0.75324, -1.26377, 1, 1, 1, 1, 1,
-0.626548, 0.1529502, -2.45758, 1, 1, 1, 1, 1,
-0.6197144, -0.6562076, -0.7871134, 1, 1, 1, 1, 1,
-0.6164835, -0.3323701, -2.653429, 1, 1, 1, 1, 1,
-0.6131065, 0.378114, -0.5663337, 1, 1, 1, 1, 1,
-0.6122553, 0.6990799, -0.56238, 1, 1, 1, 1, 1,
-0.611237, -0.7535027, -2.915329, 1, 1, 1, 1, 1,
-0.6009933, -0.1354047, -0.5410783, 1, 1, 1, 1, 1,
-0.5992946, 0.5238078, -0.9172832, 1, 1, 1, 1, 1,
-0.5980534, 1.979968, -1.418856, 1, 1, 1, 1, 1,
-0.5946186, 0.1918118, -0.7310201, 0, 0, 1, 1, 1,
-0.5927029, -1.366189, -3.328397, 1, 0, 0, 1, 1,
-0.5916529, -0.5549034, -1.651999, 1, 0, 0, 1, 1,
-0.5914489, 1.194949, -0.3581497, 1, 0, 0, 1, 1,
-0.5896795, 1.255609, 0.5704278, 1, 0, 0, 1, 1,
-0.5875031, 0.1135178, -2.920833, 1, 0, 0, 1, 1,
-0.5803162, -1.61389, -3.41005, 0, 0, 0, 1, 1,
-0.5801036, -0.7927345, -3.090936, 0, 0, 0, 1, 1,
-0.5758663, -1.593175, -1.768141, 0, 0, 0, 1, 1,
-0.5729206, 2.709398, -0.7491216, 0, 0, 0, 1, 1,
-0.5718366, -1.376125, -4.185045, 0, 0, 0, 1, 1,
-0.5645989, 0.3377937, -1.94007, 0, 0, 0, 1, 1,
-0.5589018, 0.2638467, -1.905511, 0, 0, 0, 1, 1,
-0.5486723, -0.17078, -0.5758588, 1, 1, 1, 1, 1,
-0.5400226, -2.251394, -3.232187, 1, 1, 1, 1, 1,
-0.537558, 0.7052245, -0.5702323, 1, 1, 1, 1, 1,
-0.5300342, 1.659219, -0.4144188, 1, 1, 1, 1, 1,
-0.5261316, 1.112186, -0.8391424, 1, 1, 1, 1, 1,
-0.5208278, 0.2445839, 0.1603956, 1, 1, 1, 1, 1,
-0.5186448, 0.05030743, -1.543238, 1, 1, 1, 1, 1,
-0.5186127, -1.60789, -2.701772, 1, 1, 1, 1, 1,
-0.5184941, -1.369129, -3.095671, 1, 1, 1, 1, 1,
-0.5175638, 1.049757, -0.481548, 1, 1, 1, 1, 1,
-0.5104483, 0.10787, -0.6151925, 1, 1, 1, 1, 1,
-0.509357, 0.0568451, -3.413354, 1, 1, 1, 1, 1,
-0.5071938, -0.003615812, -2.125878, 1, 1, 1, 1, 1,
-0.5034471, 0.03270737, -1.778514, 1, 1, 1, 1, 1,
-0.502803, 1.618547, 1.466176, 1, 1, 1, 1, 1,
-0.5008616, -0.6397466, -0.5208525, 0, 0, 1, 1, 1,
-0.4992033, 1.100128, -0.1964639, 1, 0, 0, 1, 1,
-0.4981402, 0.7844062, 0.8788704, 1, 0, 0, 1, 1,
-0.4972039, -1.442783, -3.658417, 1, 0, 0, 1, 1,
-0.4970409, 0.1851106, -2.084372, 1, 0, 0, 1, 1,
-0.4955342, 1.558528, 0.1485777, 1, 0, 0, 1, 1,
-0.4955008, -1.2384, -3.103349, 0, 0, 0, 1, 1,
-0.4939142, -0.6538085, -1.734862, 0, 0, 0, 1, 1,
-0.4935696, 0.007358253, -1.083747, 0, 0, 0, 1, 1,
-0.4843219, 0.414276, 0.4040772, 0, 0, 0, 1, 1,
-0.4826226, 0.296749, -2.09076, 0, 0, 0, 1, 1,
-0.4802122, 0.6147661, 1.195345, 0, 0, 0, 1, 1,
-0.4796398, -1.15584, -4.528415, 0, 0, 0, 1, 1,
-0.479225, -1.694353, -2.279016, 1, 1, 1, 1, 1,
-0.4750693, 0.3279744, -0.7020378, 1, 1, 1, 1, 1,
-0.4727018, 1.142925, 1.080482, 1, 1, 1, 1, 1,
-0.4696588, 0.9221547, -0.600205, 1, 1, 1, 1, 1,
-0.4669811, 1.716851, 0.1351175, 1, 1, 1, 1, 1,
-0.4653835, 0.4866092, -0.5159031, 1, 1, 1, 1, 1,
-0.463544, 0.431966, -1.044393, 1, 1, 1, 1, 1,
-0.463013, 0.330783, -0.4495959, 1, 1, 1, 1, 1,
-0.4607131, -1.131841, -2.653138, 1, 1, 1, 1, 1,
-0.4557618, 0.8844593, -0.1240067, 1, 1, 1, 1, 1,
-0.4513443, 0.207187, -2.913806, 1, 1, 1, 1, 1,
-0.4504716, 0.08382474, -3.456544, 1, 1, 1, 1, 1,
-0.449038, 2.326237, -0.5778769, 1, 1, 1, 1, 1,
-0.4482867, -0.1873292, -2.029654, 1, 1, 1, 1, 1,
-0.4444193, 1.124552, 0.5242342, 1, 1, 1, 1, 1,
-0.4375322, 1.089118, -2.700176, 0, 0, 1, 1, 1,
-0.4333039, 0.4261685, -0.2466568, 1, 0, 0, 1, 1,
-0.4325281, -0.2658063, -4.1394, 1, 0, 0, 1, 1,
-0.4321471, -0.1406554, -3.88978, 1, 0, 0, 1, 1,
-0.4313596, 1.437858, 1.151043, 1, 0, 0, 1, 1,
-0.4280898, 0.3781361, -0.007682151, 1, 0, 0, 1, 1,
-0.4268151, 1.240767, -1.543173, 0, 0, 0, 1, 1,
-0.4252427, -0.377583, -0.6335893, 0, 0, 0, 1, 1,
-0.4238137, -1.056486, -3.046915, 0, 0, 0, 1, 1,
-0.4225721, -0.1535754, -1.010987, 0, 0, 0, 1, 1,
-0.4180301, 0.680755, -1.351602, 0, 0, 0, 1, 1,
-0.412229, -0.4601994, -3.133016, 0, 0, 0, 1, 1,
-0.4119761, -0.007169806, -2.190303, 0, 0, 0, 1, 1,
-0.4085166, -1.4395, -2.263521, 1, 1, 1, 1, 1,
-0.4040493, 1.824876, 0.2637781, 1, 1, 1, 1, 1,
-0.4029647, 0.842069, -0.4550962, 1, 1, 1, 1, 1,
-0.3965374, -0.8029019, -1.07922, 1, 1, 1, 1, 1,
-0.3954068, 0.07847515, -0.1141768, 1, 1, 1, 1, 1,
-0.3928511, 0.5556488, -0.4248438, 1, 1, 1, 1, 1,
-0.3896104, -0.2752835, -2.676676, 1, 1, 1, 1, 1,
-0.3873754, -0.9535643, -2.71712, 1, 1, 1, 1, 1,
-0.3870649, -0.4741798, -3.180962, 1, 1, 1, 1, 1,
-0.3819148, 0.5257056, 0.02815188, 1, 1, 1, 1, 1,
-0.3791985, -0.8709962, -3.872596, 1, 1, 1, 1, 1,
-0.3766379, -0.07989983, -3.113865, 1, 1, 1, 1, 1,
-0.376368, -2.163832, -3.443008, 1, 1, 1, 1, 1,
-0.3751498, 0.798673, -0.8226615, 1, 1, 1, 1, 1,
-0.3749263, 0.1441499, -2.48475, 1, 1, 1, 1, 1,
-0.3731912, -0.7900058, -1.340778, 0, 0, 1, 1, 1,
-0.3726084, 0.6135377, 1.072603, 1, 0, 0, 1, 1,
-0.3712113, 0.631479, -3.080671, 1, 0, 0, 1, 1,
-0.3641394, -0.8086107, -2.567965, 1, 0, 0, 1, 1,
-0.3583268, 0.852792, 0.5415767, 1, 0, 0, 1, 1,
-0.3574265, 1.174246, -0.7311292, 1, 0, 0, 1, 1,
-0.3562869, -0.06582269, -1.189498, 0, 0, 0, 1, 1,
-0.3560746, -0.9529872, -3.298398, 0, 0, 0, 1, 1,
-0.3553819, -1.424124, -4.670747, 0, 0, 0, 1, 1,
-0.3542341, 1.155164, 0.07341442, 0, 0, 0, 1, 1,
-0.3528856, 0.4276867, 0.6060547, 0, 0, 0, 1, 1,
-0.3460393, -1.452324, -3.872629, 0, 0, 0, 1, 1,
-0.3456987, -0.3808653, -3.425554, 0, 0, 0, 1, 1,
-0.3445822, 0.5042611, -0.06930891, 1, 1, 1, 1, 1,
-0.3423563, 0.3564624, -0.342401, 1, 1, 1, 1, 1,
-0.3382488, 0.4844713, -0.07838526, 1, 1, 1, 1, 1,
-0.3372274, -0.5666881, -3.098381, 1, 1, 1, 1, 1,
-0.3329383, -1.636409, -2.040981, 1, 1, 1, 1, 1,
-0.3289031, -0.4349005, -3.177125, 1, 1, 1, 1, 1,
-0.3285384, 0.38773, 0.2344923, 1, 1, 1, 1, 1,
-0.32654, -1.644104, -4.641304, 1, 1, 1, 1, 1,
-0.326387, 0.5804605, -1.359393, 1, 1, 1, 1, 1,
-0.3252533, -0.6988786, -3.799518, 1, 1, 1, 1, 1,
-0.3217025, 0.5319088, -0.3657383, 1, 1, 1, 1, 1,
-0.3201951, -0.4002385, -1.434508, 1, 1, 1, 1, 1,
-0.3184703, -0.1770826, -1.019047, 1, 1, 1, 1, 1,
-0.3171524, -0.5090952, -0.8497649, 1, 1, 1, 1, 1,
-0.3140392, -0.359381, -1.924869, 1, 1, 1, 1, 1,
-0.3120159, 0.7589628, 0.2586816, 0, 0, 1, 1, 1,
-0.3097384, 2.040637, -1.076479, 1, 0, 0, 1, 1,
-0.3061257, 0.183359, -1.290146, 1, 0, 0, 1, 1,
-0.3040939, 0.9842218, 0.04729189, 1, 0, 0, 1, 1,
-0.3017022, 0.8478889, -0.8133459, 1, 0, 0, 1, 1,
-0.2939982, 1.456252, -0.6099655, 1, 0, 0, 1, 1,
-0.2930536, -1.404776, -2.069726, 0, 0, 0, 1, 1,
-0.2912076, 1.21647, 1.243514, 0, 0, 0, 1, 1,
-0.2901129, -1.158836, -2.473098, 0, 0, 0, 1, 1,
-0.2895986, 0.9776699, 0.1075584, 0, 0, 0, 1, 1,
-0.2895329, -1.054789, -2.329539, 0, 0, 0, 1, 1,
-0.2894024, -0.1188186, -2.215258, 0, 0, 0, 1, 1,
-0.2870182, 0.2415835, -2.550478, 0, 0, 0, 1, 1,
-0.2779271, 1.600338, 0.4041337, 1, 1, 1, 1, 1,
-0.2768392, 0.3653764, -1.080986, 1, 1, 1, 1, 1,
-0.2757718, -1.431268, -4.341008, 1, 1, 1, 1, 1,
-0.2696265, -0.09969281, -2.342429, 1, 1, 1, 1, 1,
-0.2670498, -0.4557531, -3.618202, 1, 1, 1, 1, 1,
-0.2649047, 0.4584945, 0.5725337, 1, 1, 1, 1, 1,
-0.2606835, -1.039158, -1.905407, 1, 1, 1, 1, 1,
-0.2582153, 0.3821004, -0.1340167, 1, 1, 1, 1, 1,
-0.2550358, 0.3951889, -0.8324782, 1, 1, 1, 1, 1,
-0.2469916, 0.8129925, -0.7905242, 1, 1, 1, 1, 1,
-0.2441956, 0.3887294, -1.599122, 1, 1, 1, 1, 1,
-0.2334586, -1.137268, -3.397852, 1, 1, 1, 1, 1,
-0.2331712, -1.029395, -3.936641, 1, 1, 1, 1, 1,
-0.2221226, 2.27556, -0.9466425, 1, 1, 1, 1, 1,
-0.2204813, 1.111088, -0.8450869, 1, 1, 1, 1, 1,
-0.2196701, -0.7660019, 0.5186302, 0, 0, 1, 1, 1,
-0.2181059, 1.836327, -0.6703287, 1, 0, 0, 1, 1,
-0.2163391, -0.619014, -2.679154, 1, 0, 0, 1, 1,
-0.2135324, 0.6010559, -1.305016, 1, 0, 0, 1, 1,
-0.2114554, 0.7078229, -0.1247413, 1, 0, 0, 1, 1,
-0.2110174, 0.286908, 0.2002989, 1, 0, 0, 1, 1,
-0.2105032, 0.5602517, -0.4302908, 0, 0, 0, 1, 1,
-0.2101323, -2.711286, -4.460649, 0, 0, 0, 1, 1,
-0.2096848, 0.3916281, 0.73282, 0, 0, 0, 1, 1,
-0.206039, -1.171031, -4.229297, 0, 0, 0, 1, 1,
-0.2008194, 0.4279993, -0.06566758, 0, 0, 0, 1, 1,
-0.1975185, -0.008374323, -0.1063484, 0, 0, 0, 1, 1,
-0.1974697, 1.757116, 0.1326334, 0, 0, 0, 1, 1,
-0.1949816, 1.175273, -0.9056305, 1, 1, 1, 1, 1,
-0.1944149, -1.539083, -2.191397, 1, 1, 1, 1, 1,
-0.1928663, 0.1888259, 1.119002, 1, 1, 1, 1, 1,
-0.1882429, 0.4822908, -1.490759, 1, 1, 1, 1, 1,
-0.1879054, 1.025611, -0.1466939, 1, 1, 1, 1, 1,
-0.1866294, 0.5412801, -0.8331107, 1, 1, 1, 1, 1,
-0.1854309, -0.5393838, -2.933049, 1, 1, 1, 1, 1,
-0.1820984, -0.01274776, -1.702488, 1, 1, 1, 1, 1,
-0.1810767, 0.1447287, -1.664034, 1, 1, 1, 1, 1,
-0.1808369, -0.5355376, -1.002372, 1, 1, 1, 1, 1,
-0.1801199, 1.047717, 0.3304445, 1, 1, 1, 1, 1,
-0.1798557, -0.4522447, -2.461876, 1, 1, 1, 1, 1,
-0.1783634, -0.1414201, -0.4045074, 1, 1, 1, 1, 1,
-0.1755231, 1.275817, -0.6998217, 1, 1, 1, 1, 1,
-0.1690391, 0.4346855, 0.1966941, 1, 1, 1, 1, 1,
-0.1683456, 1.068516, 0.356721, 0, 0, 1, 1, 1,
-0.167911, -1.886423, -3.099075, 1, 0, 0, 1, 1,
-0.1607479, 0.849729, 0.3796765, 1, 0, 0, 1, 1,
-0.156891, -0.4641676, -3.479293, 1, 0, 0, 1, 1,
-0.156034, -0.2851377, -4.17885, 1, 0, 0, 1, 1,
-0.1544871, 0.1857192, 1.138992, 1, 0, 0, 1, 1,
-0.1541426, 1.10369, 0.6552343, 0, 0, 0, 1, 1,
-0.1514389, 1.271544, 0.1156778, 0, 0, 0, 1, 1,
-0.1500296, -0.522772, -3.498361, 0, 0, 0, 1, 1,
-0.1480254, -1.011702, -1.723144, 0, 0, 0, 1, 1,
-0.1432561, 1.01256, -0.857521, 0, 0, 0, 1, 1,
-0.1404893, -0.05364571, -3.220841, 0, 0, 0, 1, 1,
-0.1399995, -0.7587589, -2.974155, 0, 0, 0, 1, 1,
-0.130736, 0.1492531, 0.3130017, 1, 1, 1, 1, 1,
-0.1280628, -1.159551, -4.106854, 1, 1, 1, 1, 1,
-0.1279871, -0.2991935, -1.710141, 1, 1, 1, 1, 1,
-0.127175, 0.4397443, -0.565824, 1, 1, 1, 1, 1,
-0.1269028, 0.3589644, -1.549428, 1, 1, 1, 1, 1,
-0.1256033, -0.1429903, -2.698809, 1, 1, 1, 1, 1,
-0.1255763, -0.3502137, -1.707614, 1, 1, 1, 1, 1,
-0.1220661, 1.178678, -1.166238, 1, 1, 1, 1, 1,
-0.1163489, -1.382246, -2.302467, 1, 1, 1, 1, 1,
-0.1160093, -0.189956, -3.67189, 1, 1, 1, 1, 1,
-0.114755, -0.2533109, -2.293978, 1, 1, 1, 1, 1,
-0.1144554, -1.207742, -3.202041, 1, 1, 1, 1, 1,
-0.1141221, -0.1057357, -1.533061, 1, 1, 1, 1, 1,
-0.1109477, -0.6406761, -3.630431, 1, 1, 1, 1, 1,
-0.1108337, -0.7996519, -2.478531, 1, 1, 1, 1, 1,
-0.108973, 1.433634, -0.9509073, 0, 0, 1, 1, 1,
-0.1082513, 0.8394048, -0.7681774, 1, 0, 0, 1, 1,
-0.1063463, 0.7905, -2.511471, 1, 0, 0, 1, 1,
-0.1028752, 0.7215903, 0.007173453, 1, 0, 0, 1, 1,
-0.1011908, -1.597491, -2.873658, 1, 0, 0, 1, 1,
-0.09887366, -0.105418, -0.8894823, 1, 0, 0, 1, 1,
-0.09759365, -0.6736911, -4.531849, 0, 0, 0, 1, 1,
-0.09637278, -1.013523, -3.233613, 0, 0, 0, 1, 1,
-0.09572465, -0.2285332, -1.452704, 0, 0, 0, 1, 1,
-0.09390423, -0.5939394, -4.945059, 0, 0, 0, 1, 1,
-0.09193355, 0.8814107, 0.934128, 0, 0, 0, 1, 1,
-0.0869949, -1.31244, -3.90755, 0, 0, 0, 1, 1,
-0.08534119, -1.001807, -1.324113, 0, 0, 0, 1, 1,
-0.082743, -0.3356379, -2.11988, 1, 1, 1, 1, 1,
-0.08260388, 0.4471848, 0.4192356, 1, 1, 1, 1, 1,
-0.0805663, -0.3442039, -1.846136, 1, 1, 1, 1, 1,
-0.07203368, -0.8019825, -4.449259, 1, 1, 1, 1, 1,
-0.07174125, -0.3045963, -2.258469, 1, 1, 1, 1, 1,
-0.06893396, 1.241096, 0.5641789, 1, 1, 1, 1, 1,
-0.06777681, 0.1904587, -1.420271, 1, 1, 1, 1, 1,
-0.06702584, -0.6425418, -2.650449, 1, 1, 1, 1, 1,
-0.06681973, -0.5426688, -4.064507, 1, 1, 1, 1, 1,
-0.06632873, -1.201784, -5.105133, 1, 1, 1, 1, 1,
-0.06589637, 0.3257693, -0.4755007, 1, 1, 1, 1, 1,
-0.06542509, 0.9873425, -1.949298, 1, 1, 1, 1, 1,
-0.06483956, 0.7747834, -1.13652, 1, 1, 1, 1, 1,
-0.06347764, 0.0001678199, -2.848914, 1, 1, 1, 1, 1,
-0.06141102, -0.9817711, -3.190902, 1, 1, 1, 1, 1,
-0.06064837, -0.5879161, -2.707434, 0, 0, 1, 1, 1,
-0.06050449, 1.598774, -0.5946119, 1, 0, 0, 1, 1,
-0.05752784, 0.1868988, -0.683225, 1, 0, 0, 1, 1,
-0.05614227, 0.5489129, -1.734982, 1, 0, 0, 1, 1,
-0.05251483, -1.711476, -2.540114, 1, 0, 0, 1, 1,
-0.04752722, 0.06781297, -1.101587, 1, 0, 0, 1, 1,
-0.04348946, -0.9215378, -1.663605, 0, 0, 0, 1, 1,
-0.04294361, -1.653929, -4.412089, 0, 0, 0, 1, 1,
-0.03799789, -2.077332, -3.209652, 0, 0, 0, 1, 1,
-0.03383452, -0.6430327, -1.71692, 0, 0, 0, 1, 1,
-0.03210077, -1.036628, -4.789053, 0, 0, 0, 1, 1,
-0.028884, 0.5220447, -1.032547, 0, 0, 0, 1, 1,
-0.0287219, -0.2909995, -2.382536, 0, 0, 0, 1, 1,
-0.02640734, 0.06668444, 1.5216, 1, 1, 1, 1, 1,
-0.02529208, 1.230819, -0.6634287, 1, 1, 1, 1, 1,
-0.0233484, 0.8611432, -0.810309, 1, 1, 1, 1, 1,
-0.02124613, 1.586949, 1.355142, 1, 1, 1, 1, 1,
-0.02043402, -0.3231588, -2.250182, 1, 1, 1, 1, 1,
-0.01896233, -1.901059, -1.884304, 1, 1, 1, 1, 1,
-0.01870597, -0.8271207, -4.475569, 1, 1, 1, 1, 1,
-0.01847535, 0.3720079, -1.863584, 1, 1, 1, 1, 1,
-0.01383231, 0.0953206, -0.7480419, 1, 1, 1, 1, 1,
-0.01068532, 0.8850383, 1.014419, 1, 1, 1, 1, 1,
0.00131343, -0.3604004, 2.152773, 1, 1, 1, 1, 1,
0.004283153, 0.5631325, 0.3698355, 1, 1, 1, 1, 1,
0.007889427, -0.7127928, 3.644434, 1, 1, 1, 1, 1,
0.01128504, -0.1835805, 2.769037, 1, 1, 1, 1, 1,
0.01146806, -0.7922419, 4.552628, 1, 1, 1, 1, 1,
0.01182106, 1.645862, 0.3868651, 0, 0, 1, 1, 1,
0.01262648, -1.050539, 2.622834, 1, 0, 0, 1, 1,
0.01372324, 2.675468, 0.03291323, 1, 0, 0, 1, 1,
0.01619551, -0.1988921, 1.012907, 1, 0, 0, 1, 1,
0.02007636, -0.3986318, 4.178136, 1, 0, 0, 1, 1,
0.02198382, -2.455408, 1.434225, 1, 0, 0, 1, 1,
0.0232075, 0.8865809, 1.493781, 0, 0, 0, 1, 1,
0.03363929, 1.661777, 1.575216, 0, 0, 0, 1, 1,
0.03472888, 0.799395, -1.545322, 0, 0, 0, 1, 1,
0.03743619, 1.110825, 1.840204, 0, 0, 0, 1, 1,
0.04098137, -1.699873, 1.4929, 0, 0, 0, 1, 1,
0.04492204, -1.600512, 2.150398, 0, 0, 0, 1, 1,
0.04565687, -0.7528151, 3.417602, 0, 0, 0, 1, 1,
0.04751554, -0.873493, 4.510542, 1, 1, 1, 1, 1,
0.05571616, -0.1790256, 1.565968, 1, 1, 1, 1, 1,
0.05814126, -0.9327757, 3.217979, 1, 1, 1, 1, 1,
0.05864428, 0.1713201, 1.230847, 1, 1, 1, 1, 1,
0.05994436, 0.9010991, -0.9044327, 1, 1, 1, 1, 1,
0.06887792, -1.405569, 1.805351, 1, 1, 1, 1, 1,
0.07528609, 1.195451, 0.1149492, 1, 1, 1, 1, 1,
0.07656852, 0.1695528, 1.959848, 1, 1, 1, 1, 1,
0.08630513, -0.6600922, 0.705779, 1, 1, 1, 1, 1,
0.09822942, -0.7000742, 1.993269, 1, 1, 1, 1, 1,
0.09854738, 0.08507115, -0.02262013, 1, 1, 1, 1, 1,
0.0995236, 0.7983338, -0.3018345, 1, 1, 1, 1, 1,
0.1003675, -0.8827906, 2.651724, 1, 1, 1, 1, 1,
0.1020821, -0.5583735, 4.549842, 1, 1, 1, 1, 1,
0.103726, -0.02985059, 1.650908, 1, 1, 1, 1, 1,
0.1065717, 0.8465865, 0.4696512, 0, 0, 1, 1, 1,
0.1078691, 0.6134509, 0.7510127, 1, 0, 0, 1, 1,
0.1091416, 0.7411444, 0.1361752, 1, 0, 0, 1, 1,
0.1137635, 1.079324, -0.2911591, 1, 0, 0, 1, 1,
0.1182554, 0.3318308, 0.2164692, 1, 0, 0, 1, 1,
0.1190311, -0.2014939, 2.205669, 1, 0, 0, 1, 1,
0.1216706, 1.056079, 0.3777632, 0, 0, 0, 1, 1,
0.1255457, 0.8349673, 0.7730163, 0, 0, 0, 1, 1,
0.1258008, -1.071066, 3.15519, 0, 0, 0, 1, 1,
0.1344217, 1.761343, 0.4711771, 0, 0, 0, 1, 1,
0.1356937, -0.06953032, 1.466658, 0, 0, 0, 1, 1,
0.1386154, 0.4993362, 0.09260942, 0, 0, 0, 1, 1,
0.1439456, -0.2242356, 1.218687, 0, 0, 0, 1, 1,
0.1460464, -0.4945332, 4.496175, 1, 1, 1, 1, 1,
0.149899, 1.040403, -0.03110946, 1, 1, 1, 1, 1,
0.1507189, -0.1448763, 1.776348, 1, 1, 1, 1, 1,
0.152307, 1.20258, -0.6107231, 1, 1, 1, 1, 1,
0.1525272, 0.07313766, 1.671615, 1, 1, 1, 1, 1,
0.1535926, 0.05916234, 1.369467, 1, 1, 1, 1, 1,
0.1595055, -0.7112143, 2.528965, 1, 1, 1, 1, 1,
0.1615228, 0.0617731, 1.378223, 1, 1, 1, 1, 1,
0.1616357, -0.03539231, 3.638282, 1, 1, 1, 1, 1,
0.1638413, -1.483303, 4.101815, 1, 1, 1, 1, 1,
0.164199, -0.6079429, 3.496764, 1, 1, 1, 1, 1,
0.1660339, -1.26029, 3.461862, 1, 1, 1, 1, 1,
0.168689, -1.348089, 3.629287, 1, 1, 1, 1, 1,
0.1688876, 0.02882337, 3.177767, 1, 1, 1, 1, 1,
0.1711718, 1.064896, -0.9903197, 1, 1, 1, 1, 1,
0.1750201, -1.638591, 3.736965, 0, 0, 1, 1, 1,
0.1758297, 1.117398, -0.008441412, 1, 0, 0, 1, 1,
0.177319, 0.156954, 1.085995, 1, 0, 0, 1, 1,
0.1791272, -0.4244179, 1.803766, 1, 0, 0, 1, 1,
0.1819192, 0.6454978, -1.425399, 1, 0, 0, 1, 1,
0.1872365, -0.1948601, 3.900472, 1, 0, 0, 1, 1,
0.1875829, 0.5779225, 1.704687, 0, 0, 0, 1, 1,
0.1881556, 0.2832468, 2.54635, 0, 0, 0, 1, 1,
0.1936679, -0.8472916, 3.571908, 0, 0, 0, 1, 1,
0.1944291, 1.446254, -1.354821, 0, 0, 0, 1, 1,
0.1969143, 0.1200516, 0.2249089, 0, 0, 0, 1, 1,
0.2014059, 1.927966, -1.42771, 0, 0, 0, 1, 1,
0.2033857, 0.8886853, -0.6996437, 0, 0, 0, 1, 1,
0.2058312, -1.382596, 2.771003, 1, 1, 1, 1, 1,
0.2061012, 0.8098593, 1.018341, 1, 1, 1, 1, 1,
0.2105028, 0.9144069, 0.0887792, 1, 1, 1, 1, 1,
0.2141085, 0.7714862, 0.4658256, 1, 1, 1, 1, 1,
0.2228223, -0.3987588, 3.012329, 1, 1, 1, 1, 1,
0.2239485, -0.3374726, 2.887765, 1, 1, 1, 1, 1,
0.2252956, 0.819235, -0.02202681, 1, 1, 1, 1, 1,
0.2313267, -0.4609191, 3.403909, 1, 1, 1, 1, 1,
0.2317819, 0.481927, 0.4639557, 1, 1, 1, 1, 1,
0.2337606, -0.05307191, 2.780483, 1, 1, 1, 1, 1,
0.2340998, 1.044779, -1.292524, 1, 1, 1, 1, 1,
0.2400284, -2.085991, 1.94855, 1, 1, 1, 1, 1,
0.2417057, -0.8207266, 3.107686, 1, 1, 1, 1, 1,
0.2418156, 0.6653273, -0.2132569, 1, 1, 1, 1, 1,
0.2418703, 1.89336, 0.2622942, 1, 1, 1, 1, 1,
0.2432664, 1.342393, 0.1649882, 0, 0, 1, 1, 1,
0.2438746, 0.9859672, 0.3797889, 1, 0, 0, 1, 1,
0.2453562, 0.7808025, 1.36592, 1, 0, 0, 1, 1,
0.2466456, 1.389421, 1.07147, 1, 0, 0, 1, 1,
0.2471471, 0.2231271, 1.597365, 1, 0, 0, 1, 1,
0.2482449, -0.738538, 3.407448, 1, 0, 0, 1, 1,
0.2482507, -0.6176517, 4.483999, 0, 0, 0, 1, 1,
0.2491157, -0.5506992, 2.363259, 0, 0, 0, 1, 1,
0.2553639, -1.031629, 3.33194, 0, 0, 0, 1, 1,
0.2584883, -0.1768022, 2.585963, 0, 0, 0, 1, 1,
0.2588731, -0.1548801, 2.569331, 0, 0, 0, 1, 1,
0.2601051, -1.123246, 2.344254, 0, 0, 0, 1, 1,
0.2668034, 0.0995334, 2.837892, 0, 0, 0, 1, 1,
0.2751833, 0.7000508, -0.2377222, 1, 1, 1, 1, 1,
0.2755741, -0.8389736, 3.228987, 1, 1, 1, 1, 1,
0.2815046, 0.8994434, -0.4298365, 1, 1, 1, 1, 1,
0.2822549, -1.927713, 1.693473, 1, 1, 1, 1, 1,
0.2915135, -1.162831, 2.961729, 1, 1, 1, 1, 1,
0.2919914, 2.454038, -1.673107, 1, 1, 1, 1, 1,
0.2989626, -1.765189, 4.430747, 1, 1, 1, 1, 1,
0.3041013, -2.734373, 3.720344, 1, 1, 1, 1, 1,
0.3084229, 0.1785646, 0.6693518, 1, 1, 1, 1, 1,
0.309834, 0.4704307, -0.7978568, 1, 1, 1, 1, 1,
0.3099424, -0.290084, 0.8815051, 1, 1, 1, 1, 1,
0.3106395, 0.1509368, 1.507308, 1, 1, 1, 1, 1,
0.3126486, 0.2113475, -0.3131532, 1, 1, 1, 1, 1,
0.31548, -0.8609166, 2.288705, 1, 1, 1, 1, 1,
0.3180537, -0.336351, 1.512097, 1, 1, 1, 1, 1,
0.3187729, 0.9994109, -1.342063, 0, 0, 1, 1, 1,
0.3216785, -1.430029, 2.032692, 1, 0, 0, 1, 1,
0.3229758, -0.1589898, 2.798067, 1, 0, 0, 1, 1,
0.3234545, -0.1908576, 3.196764, 1, 0, 0, 1, 1,
0.3333581, -0.05337958, 1.801277, 1, 0, 0, 1, 1,
0.3362885, -1.210265, 2.597474, 1, 0, 0, 1, 1,
0.3391002, 0.2362636, 0.03503238, 0, 0, 0, 1, 1,
0.3419734, -0.8441222, 3.0573, 0, 0, 0, 1, 1,
0.3420874, 0.05860628, 1.549973, 0, 0, 0, 1, 1,
0.3438592, 1.32286, 0.4668652, 0, 0, 0, 1, 1,
0.3464242, -2.824518, 3.14206, 0, 0, 0, 1, 1,
0.3484782, -0.01445959, 1.004146, 0, 0, 0, 1, 1,
0.3507176, -0.2521932, 1.667598, 0, 0, 0, 1, 1,
0.3586609, -0.1113074, 1.02798, 1, 1, 1, 1, 1,
0.3607048, -1.045873, 2.060085, 1, 1, 1, 1, 1,
0.3665329, 1.701289, -1.840961, 1, 1, 1, 1, 1,
0.3695797, 0.346003, 0.8419244, 1, 1, 1, 1, 1,
0.3735133, -0.6709129, 2.898325, 1, 1, 1, 1, 1,
0.3740547, -0.5805082, 0.4680462, 1, 1, 1, 1, 1,
0.3799905, 0.4399668, 0.600345, 1, 1, 1, 1, 1,
0.3823497, 1.453358, -0.5957716, 1, 1, 1, 1, 1,
0.3875652, 0.1303246, 1.275131, 1, 1, 1, 1, 1,
0.3922167, -0.7457878, 3.354579, 1, 1, 1, 1, 1,
0.3946882, -0.09553326, 1.123404, 1, 1, 1, 1, 1,
0.4067245, 1.010136, -0.4058981, 1, 1, 1, 1, 1,
0.4070533, -0.1401372, 2.255439, 1, 1, 1, 1, 1,
0.407419, -0.4849681, 2.279694, 1, 1, 1, 1, 1,
0.4174347, 1.836352, 0.8814858, 1, 1, 1, 1, 1,
0.4201385, 1.342445, 1.064682, 0, 0, 1, 1, 1,
0.42343, -0.2630902, 3.030552, 1, 0, 0, 1, 1,
0.4251961, -1.883021, 1.806409, 1, 0, 0, 1, 1,
0.4296612, -0.1557632, 1.053562, 1, 0, 0, 1, 1,
0.4332437, 0.4821728, 1.301703, 1, 0, 0, 1, 1,
0.4346079, -0.1897323, 2.202976, 1, 0, 0, 1, 1,
0.4354005, 0.135227, -0.05450287, 0, 0, 0, 1, 1,
0.4369887, 0.06095969, 1.852733, 0, 0, 0, 1, 1,
0.4381477, 1.228748, -0.318535, 0, 0, 0, 1, 1,
0.4383588, 0.170793, 0.4060126, 0, 0, 0, 1, 1,
0.4411903, 0.03367427, -0.467335, 0, 0, 0, 1, 1,
0.4442773, 0.7152473, 1.322884, 0, 0, 0, 1, 1,
0.4473221, -1.880964, 1.783661, 0, 0, 0, 1, 1,
0.4485621, 0.3051052, 0.8740099, 1, 1, 1, 1, 1,
0.451234, -0.8093157, 2.120413, 1, 1, 1, 1, 1,
0.461291, -0.4572062, 2.528388, 1, 1, 1, 1, 1,
0.4626378, 0.2171282, 0.7345977, 1, 1, 1, 1, 1,
0.4643736, 0.6522005, 2.014124, 1, 1, 1, 1, 1,
0.4675256, 2.114944, -0.631172, 1, 1, 1, 1, 1,
0.4709198, -0.91866, 3.903179, 1, 1, 1, 1, 1,
0.4711607, -0.194098, 0.6754227, 1, 1, 1, 1, 1,
0.4765458, 0.6272832, 1.023363, 1, 1, 1, 1, 1,
0.478501, 0.2459408, 2.008023, 1, 1, 1, 1, 1,
0.4796572, -1.058193, 2.03893, 1, 1, 1, 1, 1,
0.4799373, -0.4123817, 3.644615, 1, 1, 1, 1, 1,
0.4852982, -0.5428553, 3.051789, 1, 1, 1, 1, 1,
0.495156, 0.06330547, 1.507871, 1, 1, 1, 1, 1,
0.4953732, 0.1587012, -0.09706832, 1, 1, 1, 1, 1,
0.4965288, 0.5447742, -0.5120023, 0, 0, 1, 1, 1,
0.4971272, 0.1271391, 2.723696, 1, 0, 0, 1, 1,
0.5166634, 0.7251822, 2.574494, 1, 0, 0, 1, 1,
0.5237748, -0.08402672, 2.316913, 1, 0, 0, 1, 1,
0.5255077, -0.497458, 4.975911, 1, 0, 0, 1, 1,
0.5271091, -1.132642, 1.346974, 1, 0, 0, 1, 1,
0.5277416, 1.346893, 0.02615424, 0, 0, 0, 1, 1,
0.5337324, 0.8144595, -1.140614, 0, 0, 0, 1, 1,
0.5338202, -0.5165689, 3.762241, 0, 0, 0, 1, 1,
0.5343966, -1.001285, 3.899002, 0, 0, 0, 1, 1,
0.5345562, 0.3684588, 0.02718161, 0, 0, 0, 1, 1,
0.5427014, 0.5993042, 1.813365, 0, 0, 0, 1, 1,
0.5480476, -1.09335, 3.315315, 0, 0, 0, 1, 1,
0.5512353, -0.987449, 2.995351, 1, 1, 1, 1, 1,
0.554898, 0.708955, 1.590659, 1, 1, 1, 1, 1,
0.5567164, -0.7148989, 2.224429, 1, 1, 1, 1, 1,
0.5567661, 0.1680948, 1.682842, 1, 1, 1, 1, 1,
0.5587411, -2.783438, 2.543401, 1, 1, 1, 1, 1,
0.55912, -0.3236368, 2.679098, 1, 1, 1, 1, 1,
0.5662295, 0.08527735, 1.686449, 1, 1, 1, 1, 1,
0.5690265, 0.4770766, 0.434491, 1, 1, 1, 1, 1,
0.5753588, 1.444196, 1.176038, 1, 1, 1, 1, 1,
0.5790852, 0.3870959, 0.8569128, 1, 1, 1, 1, 1,
0.5877313, -0.2947012, 1.650333, 1, 1, 1, 1, 1,
0.5883043, 0.3642815, 1.072212, 1, 1, 1, 1, 1,
0.5886151, 0.0750365, 1.917862, 1, 1, 1, 1, 1,
0.5963941, -0.9720997, 1.922359, 1, 1, 1, 1, 1,
0.5966241, -1.08301, 2.601181, 1, 1, 1, 1, 1,
0.5967776, 0.1144343, 1.318281, 0, 0, 1, 1, 1,
0.5976092, -0.2003946, 0.8176916, 1, 0, 0, 1, 1,
0.6010584, -1.759956, 3.767951, 1, 0, 0, 1, 1,
0.606629, -1.136517, 2.575601, 1, 0, 0, 1, 1,
0.6082833, 0.0244828, 2.470669, 1, 0, 0, 1, 1,
0.6087804, 0.8609959, 0.08795039, 1, 0, 0, 1, 1,
0.6134921, 1.182324, -0.2886203, 0, 0, 0, 1, 1,
0.6146266, 1.235706, -3.376848, 0, 0, 0, 1, 1,
0.618279, 0.03480158, 2.227282, 0, 0, 0, 1, 1,
0.6197353, -1.45463, 4.406332, 0, 0, 0, 1, 1,
0.6218753, -2.816718, 3.446059, 0, 0, 0, 1, 1,
0.6221896, 1.12533, 1.367312, 0, 0, 0, 1, 1,
0.6231128, -0.2533551, 2.439983, 0, 0, 0, 1, 1,
0.6231418, 1.145595, -0.8233214, 1, 1, 1, 1, 1,
0.6237228, -0.4509749, 3.970644, 1, 1, 1, 1, 1,
0.6265798, -1.114496, 3.780297, 1, 1, 1, 1, 1,
0.6272593, -1.531928, 5.042454, 1, 1, 1, 1, 1,
0.6345847, 0.6797308, 1.39716, 1, 1, 1, 1, 1,
0.6408956, -2.876077, 1.456357, 1, 1, 1, 1, 1,
0.6433784, 0.4157612, 0.4202649, 1, 1, 1, 1, 1,
0.6454232, -1.272066, 1.973958, 1, 1, 1, 1, 1,
0.6454378, -2.26541, 2.050033, 1, 1, 1, 1, 1,
0.6463776, 0.3581792, 1.02596, 1, 1, 1, 1, 1,
0.6467896, -0.1263485, 2.26607, 1, 1, 1, 1, 1,
0.6475796, 0.06235269, 1.178803, 1, 1, 1, 1, 1,
0.6477156, 0.7592873, 0.3072947, 1, 1, 1, 1, 1,
0.6496018, -0.9768532, 1.686711, 1, 1, 1, 1, 1,
0.6504415, -0.9905057, 1.420828, 1, 1, 1, 1, 1,
0.6513079, 0.006286064, 0.1495896, 0, 0, 1, 1, 1,
0.6691571, 1.38064, -0.9695712, 1, 0, 0, 1, 1,
0.693092, 0.05740633, 1.691156, 1, 0, 0, 1, 1,
0.7021553, -0.01379857, 1.236907, 1, 0, 0, 1, 1,
0.7155964, 1.747998, -2.214217, 1, 0, 0, 1, 1,
0.720646, 1.556232, -0.5324321, 1, 0, 0, 1, 1,
0.7214131, 0.469455, 0.888923, 0, 0, 0, 1, 1,
0.7251019, -1.17938, 2.223724, 0, 0, 0, 1, 1,
0.7255334, -0.9151354, 3.830362, 0, 0, 0, 1, 1,
0.7293445, 0.2660441, 3.051386, 0, 0, 0, 1, 1,
0.7308613, -0.08211712, 1.459532, 0, 0, 0, 1, 1,
0.7342702, 0.9873296, 1.133989, 0, 0, 0, 1, 1,
0.7351003, 1.118626, 1.868193, 0, 0, 0, 1, 1,
0.7474511, -0.117164, 1.057802, 1, 1, 1, 1, 1,
0.7492489, 0.08506615, 0.4651492, 1, 1, 1, 1, 1,
0.7498416, -1.253262, 1.845369, 1, 1, 1, 1, 1,
0.7568345, 1.077346, 2.207, 1, 1, 1, 1, 1,
0.7621252, -1.31768, 3.050925, 1, 1, 1, 1, 1,
0.7673556, 0.6166225, 2.078901, 1, 1, 1, 1, 1,
0.7711371, -0.4596611, 2.991555, 1, 1, 1, 1, 1,
0.7747995, -0.2338158, 3.218062, 1, 1, 1, 1, 1,
0.7768007, 0.2546034, 1.582406, 1, 1, 1, 1, 1,
0.7785928, 1.46074, 0.2961727, 1, 1, 1, 1, 1,
0.7803962, -0.571968, 1.722536, 1, 1, 1, 1, 1,
0.7842356, 0.4348989, -0.2689736, 1, 1, 1, 1, 1,
0.7848378, -0.5259527, -0.9139362, 1, 1, 1, 1, 1,
0.790476, -0.653317, 0.9869881, 1, 1, 1, 1, 1,
0.7961559, -0.03281436, 1.698714, 1, 1, 1, 1, 1,
0.7975585, 0.135432, 2.551111, 0, 0, 1, 1, 1,
0.7976131, -1.05587, 2.988638, 1, 0, 0, 1, 1,
0.7983036, 0.9193982, 0.7624117, 1, 0, 0, 1, 1,
0.8081331, -2.715999, 1.728889, 1, 0, 0, 1, 1,
0.8151839, 0.3524329, 1.470958, 1, 0, 0, 1, 1,
0.816504, 0.9427402, -0.1671761, 1, 0, 0, 1, 1,
0.8177573, -1.15978, 2.564275, 0, 0, 0, 1, 1,
0.8209313, 0.03736643, 3.402566, 0, 0, 0, 1, 1,
0.8303152, 0.7133021, 1.441618, 0, 0, 0, 1, 1,
0.8366277, -1.458572, 2.496869, 0, 0, 0, 1, 1,
0.8374985, 0.5111598, 2.533974, 0, 0, 0, 1, 1,
0.8431424, 0.2715674, 0.9889372, 0, 0, 0, 1, 1,
0.8449746, -1.773109, 3.330382, 0, 0, 0, 1, 1,
0.852918, -0.7797323, 1.543452, 1, 1, 1, 1, 1,
0.8530992, 0.09506048, 2.146952, 1, 1, 1, 1, 1,
0.8563681, 0.09957215, 1.44309, 1, 1, 1, 1, 1,
0.860615, 0.05882679, 1.575154, 1, 1, 1, 1, 1,
0.8624964, -0.07138156, 1.534815, 1, 1, 1, 1, 1,
0.8658726, 0.2458165, 0.5071809, 1, 1, 1, 1, 1,
0.8669016, -1.931676, 4.282964, 1, 1, 1, 1, 1,
0.8694422, -1.08501, 4.004738, 1, 1, 1, 1, 1,
0.8755226, 0.04163713, 1.206784, 1, 1, 1, 1, 1,
0.8836763, 0.6658077, 2.051058, 1, 1, 1, 1, 1,
0.8905922, 0.61074, 1.509107, 1, 1, 1, 1, 1,
0.8996694, 0.4807966, 0.1175178, 1, 1, 1, 1, 1,
0.904653, 0.3669661, 3.93581, 1, 1, 1, 1, 1,
0.9088277, -1.312717, 2.543299, 1, 1, 1, 1, 1,
0.9110386, -1.135522, 1.292264, 1, 1, 1, 1, 1,
0.9111695, -1.794113, 2.660799, 0, 0, 1, 1, 1,
0.9163102, -1.159896, 3.049982, 1, 0, 0, 1, 1,
0.9232982, 1.679545, 1.677887, 1, 0, 0, 1, 1,
0.9265635, -0.2810048, 2.120834, 1, 0, 0, 1, 1,
0.9282929, 0.5833585, 2.797027, 1, 0, 0, 1, 1,
0.9420182, -0.4747271, 2.722824, 1, 0, 0, 1, 1,
0.9488989, -0.6812311, 1.808639, 0, 0, 0, 1, 1,
0.9513025, 1.572663, -0.2632623, 0, 0, 0, 1, 1,
0.9586277, -0.7133523, 2.032346, 0, 0, 0, 1, 1,
0.9592183, -1.043065, 1.815162, 0, 0, 0, 1, 1,
0.9599043, -1.200401, 1.700772, 0, 0, 0, 1, 1,
0.9620587, 1.620611, 1.767502, 0, 0, 0, 1, 1,
0.9626912, -1.198207, 0.6375207, 0, 0, 0, 1, 1,
0.9648167, -2.004134, 1.875967, 1, 1, 1, 1, 1,
0.9672613, 2.024122, 0.5381651, 1, 1, 1, 1, 1,
0.9789118, -0.2429085, 3.343713, 1, 1, 1, 1, 1,
0.9794055, -0.5469955, 0.7254627, 1, 1, 1, 1, 1,
0.9873304, -1.25726, 1.199353, 1, 1, 1, 1, 1,
0.9925256, 2.383043, -2.156539, 1, 1, 1, 1, 1,
0.9946533, -2.131535, 2.337207, 1, 1, 1, 1, 1,
1.000147, 0.8875414, 1.851249, 1, 1, 1, 1, 1,
1.001936, 0.6256204, 0.495464, 1, 1, 1, 1, 1,
1.008499, 0.01147824, 3.204613, 1, 1, 1, 1, 1,
1.014522, 0.6880845, 0.6594401, 1, 1, 1, 1, 1,
1.014857, -1.070102, 2.04527, 1, 1, 1, 1, 1,
1.020944, -0.4426722, 2.889397, 1, 1, 1, 1, 1,
1.042815, 1.929022, 1.409112, 1, 1, 1, 1, 1,
1.043202, 0.9238066, -1.285203, 1, 1, 1, 1, 1,
1.043689, -1.469173, 1.601492, 0, 0, 1, 1, 1,
1.044363, 0.8067958, 1.270567, 1, 0, 0, 1, 1,
1.049161, -1.642403, 3.485841, 1, 0, 0, 1, 1,
1.049857, -0.8516901, 3.692931, 1, 0, 0, 1, 1,
1.060096, 0.658564, 0.9384127, 1, 0, 0, 1, 1,
1.060262, -2.355947, 2.985935, 1, 0, 0, 1, 1,
1.061712, 0.640347, 2.17097, 0, 0, 0, 1, 1,
1.063088, -0.2715483, 0.3853847, 0, 0, 0, 1, 1,
1.063824, 3.006156, 0.1946399, 0, 0, 0, 1, 1,
1.070172, 0.7432337, 2.955539, 0, 0, 0, 1, 1,
1.074797, -1.380187, 2.417715, 0, 0, 0, 1, 1,
1.075382, 0.02286971, 1.980369, 0, 0, 0, 1, 1,
1.083873, 0.4689747, 1.326406, 0, 0, 0, 1, 1,
1.084304, 0.1862664, 1.263937, 1, 1, 1, 1, 1,
1.086847, 1.159065, 0.8429663, 1, 1, 1, 1, 1,
1.098782, 1.496799, -1.040724, 1, 1, 1, 1, 1,
1.105067, 0.02296758, 2.58045, 1, 1, 1, 1, 1,
1.105438, 0.6415117, 1.210413, 1, 1, 1, 1, 1,
1.112861, -1.540625, 1.275529, 1, 1, 1, 1, 1,
1.113898, 2.317463, 2.514108, 1, 1, 1, 1, 1,
1.118927, -0.6463559, 0.8104824, 1, 1, 1, 1, 1,
1.119116, -0.4926686, 4.374869, 1, 1, 1, 1, 1,
1.13286, -1.270595, 2.381212, 1, 1, 1, 1, 1,
1.13795, 1.025963, 1.811161, 1, 1, 1, 1, 1,
1.138774, 0.8362726, 1.458392, 1, 1, 1, 1, 1,
1.151946, -1.083938, 3.505938, 1, 1, 1, 1, 1,
1.15506, 0.1293461, 2.343234, 1, 1, 1, 1, 1,
1.156531, 1.347639, 1.273683, 1, 1, 1, 1, 1,
1.164067, 0.470721, 0.3796448, 0, 0, 1, 1, 1,
1.172218, 0.7441285, 1.777162, 1, 0, 0, 1, 1,
1.177759, 1.071743, 1.149595, 1, 0, 0, 1, 1,
1.17816, -0.7721032, 1.434618, 1, 0, 0, 1, 1,
1.179551, -0.7379129, 2.979781, 1, 0, 0, 1, 1,
1.183373, 0.9552664, 1.434411, 1, 0, 0, 1, 1,
1.196797, 2.685624, -0.5597367, 0, 0, 0, 1, 1,
1.203416, -0.12392, 1.861992, 0, 0, 0, 1, 1,
1.204918, 0.1388906, 3.10727, 0, 0, 0, 1, 1,
1.215152, 0.5969446, 1.140806, 0, 0, 0, 1, 1,
1.217146, 0.8628244, 1.916095, 0, 0, 0, 1, 1,
1.218129, 1.997895, 1.101314, 0, 0, 0, 1, 1,
1.226686, 1.97795, 0.3748834, 0, 0, 0, 1, 1,
1.229385, -0.3023079, 2.097594, 1, 1, 1, 1, 1,
1.235589, 1.817099, -0.1245559, 1, 1, 1, 1, 1,
1.24323, -0.5426622, 4.157024, 1, 1, 1, 1, 1,
1.247062, -0.8977419, 2.762379, 1, 1, 1, 1, 1,
1.248186, 0.7591513, 0.2527949, 1, 1, 1, 1, 1,
1.250139, -0.7624233, 2.674057, 1, 1, 1, 1, 1,
1.25097, -1.550047, 2.324999, 1, 1, 1, 1, 1,
1.252484, -1.198582, 1.815331, 1, 1, 1, 1, 1,
1.253342, -0.4349993, 2.646931, 1, 1, 1, 1, 1,
1.263506, 0.1118481, 2.223027, 1, 1, 1, 1, 1,
1.272931, 1.824129, 2.666639, 1, 1, 1, 1, 1,
1.27589, 0.8538154, 2.109787, 1, 1, 1, 1, 1,
1.276353, 0.8311586, 0.9604204, 1, 1, 1, 1, 1,
1.278908, 0.3475967, 0.1235582, 1, 1, 1, 1, 1,
1.285018, 0.05378627, 1.377865, 1, 1, 1, 1, 1,
1.29006, 0.7933531, 1.405542, 0, 0, 1, 1, 1,
1.291879, -1.042406, 3.839412, 1, 0, 0, 1, 1,
1.300824, -0.1113176, 2.585173, 1, 0, 0, 1, 1,
1.305494, 1.040705, 1.788042, 1, 0, 0, 1, 1,
1.307869, 0.1212671, 0.2064656, 1, 0, 0, 1, 1,
1.312226, -0.2855468, 1.768384, 1, 0, 0, 1, 1,
1.322523, 0.8339965, 1.264568, 0, 0, 0, 1, 1,
1.327071, 1.425612, -0.4544654, 0, 0, 0, 1, 1,
1.355659, 0.8460107, 0.2679845, 0, 0, 0, 1, 1,
1.359976, -0.4968781, 0.4528672, 0, 0, 0, 1, 1,
1.36874, 1.144716, -0.5134954, 0, 0, 0, 1, 1,
1.368941, -0.2227118, 2.589526, 0, 0, 0, 1, 1,
1.373301, 0.0743262, 0.6807116, 0, 0, 0, 1, 1,
1.379535, -0.1216623, 0.9313295, 1, 1, 1, 1, 1,
1.390989, -0.1071028, 1.67952, 1, 1, 1, 1, 1,
1.392974, 0.7213692, 2.9166, 1, 1, 1, 1, 1,
1.40147, 1.03832, 1.984988, 1, 1, 1, 1, 1,
1.401621, -0.3930575, 1.158616, 1, 1, 1, 1, 1,
1.406188, 0.947863, 1.757288, 1, 1, 1, 1, 1,
1.413183, 0.2088814, 0.6475419, 1, 1, 1, 1, 1,
1.413477, 1.053095, 3.13151, 1, 1, 1, 1, 1,
1.414946, 1.259204, 0.2182985, 1, 1, 1, 1, 1,
1.415075, 0.816582, 0.3414714, 1, 1, 1, 1, 1,
1.417658, 1.469833, 0.3951246, 1, 1, 1, 1, 1,
1.431379, -0.594425, 1.539917, 1, 1, 1, 1, 1,
1.439946, 0.4594163, 0.9030184, 1, 1, 1, 1, 1,
1.440627, -1.009331, 3.301431, 1, 1, 1, 1, 1,
1.44579, 0.1611577, 1.054608, 1, 1, 1, 1, 1,
1.446583, -0.5332667, 1.263661, 0, 0, 1, 1, 1,
1.453313, -0.4264727, 3.910675, 1, 0, 0, 1, 1,
1.464139, -1.243587, 2.942199, 1, 0, 0, 1, 1,
1.466907, -1.856256, 3.019344, 1, 0, 0, 1, 1,
1.468933, 0.9421938, 0.8597929, 1, 0, 0, 1, 1,
1.476454, -0.1673312, 1.347902, 1, 0, 0, 1, 1,
1.47677, -0.8224751, 2.291339, 0, 0, 0, 1, 1,
1.492206, 0.1347749, 1.719523, 0, 0, 0, 1, 1,
1.495982, 1.285986, 0.2691596, 0, 0, 0, 1, 1,
1.51125, 2.07145, 1.062281, 0, 0, 0, 1, 1,
1.517339, 0.3081846, 2.307955, 0, 0, 0, 1, 1,
1.526479, 0.3030736, 3.563664, 0, 0, 0, 1, 1,
1.533479, -1.896036, 2.183938, 0, 0, 0, 1, 1,
1.549405, -0.5363987, 1.670661, 1, 1, 1, 1, 1,
1.557926, 0.03596097, 2.254862, 1, 1, 1, 1, 1,
1.584354, -0.4852305, 3.160673, 1, 1, 1, 1, 1,
1.584692, 1.750864, 1.230762, 1, 1, 1, 1, 1,
1.584916, 0.6617961, 0.135962, 1, 1, 1, 1, 1,
1.585059, -1.254266, 3.462122, 1, 1, 1, 1, 1,
1.590448, 0.4265874, 1.373119, 1, 1, 1, 1, 1,
1.603371, -1.670498, 3.942511, 1, 1, 1, 1, 1,
1.609563, 0.9701007, 0.428277, 1, 1, 1, 1, 1,
1.614866, -0.7283713, 2.440605, 1, 1, 1, 1, 1,
1.617156, -0.1219087, 2.300509, 1, 1, 1, 1, 1,
1.623092, 0.2425075, -0.5380372, 1, 1, 1, 1, 1,
1.628858, -0.5083769, 2.659028, 1, 1, 1, 1, 1,
1.630171, 0.4097237, 0.8681551, 1, 1, 1, 1, 1,
1.653299, 1.154187, 0.2757604, 1, 1, 1, 1, 1,
1.658039, -0.2258162, 0.5789837, 0, 0, 1, 1, 1,
1.67817, -0.4943625, 1.246398, 1, 0, 0, 1, 1,
1.681346, -1.751783, 1.959851, 1, 0, 0, 1, 1,
1.68275, -0.3571718, 1.482081, 1, 0, 0, 1, 1,
1.68834, -0.1578214, 0.6002888, 1, 0, 0, 1, 1,
1.688734, 0.5710101, 0.6496254, 1, 0, 0, 1, 1,
1.702287, -0.9598616, 0.01603769, 0, 0, 0, 1, 1,
1.704004, -0.5005315, 1.491655, 0, 0, 0, 1, 1,
1.734079, 0.2492446, 2.568815, 0, 0, 0, 1, 1,
1.74544, -0.9462125, 3.07185, 0, 0, 0, 1, 1,
1.757452, 0.4950944, 1.045461, 0, 0, 0, 1, 1,
1.770884, -0.2116449, 2.610832, 0, 0, 0, 1, 1,
1.79227, -0.2561464, 0.4901441, 0, 0, 0, 1, 1,
1.79343, -0.951277, 2.454784, 1, 1, 1, 1, 1,
1.876996, -2.241602, 3.074358, 1, 1, 1, 1, 1,
1.883314, -0.2730175, 1.520711, 1, 1, 1, 1, 1,
1.885246, 1.599586, 0.547889, 1, 1, 1, 1, 1,
1.892578, -0.4320043, 1.053545, 1, 1, 1, 1, 1,
1.897324, 0.02951207, 0.873346, 1, 1, 1, 1, 1,
1.907308, 0.7806408, 1.212906, 1, 1, 1, 1, 1,
1.910019, -1.490811, 0.6907765, 1, 1, 1, 1, 1,
1.927646, -0.2562617, -0.2869354, 1, 1, 1, 1, 1,
1.947559, -1.00725, 3.204635, 1, 1, 1, 1, 1,
1.966311, 0.3394829, 1.838693, 1, 1, 1, 1, 1,
1.978517, 1.974475, -1.032924, 1, 1, 1, 1, 1,
2.018032, 0.07749984, 1.787745, 1, 1, 1, 1, 1,
2.022104, -0.9717923, 0.4906991, 1, 1, 1, 1, 1,
2.049973, -0.02582694, 3.557108, 1, 1, 1, 1, 1,
2.053403, -0.08250175, 2.686107, 0, 0, 1, 1, 1,
2.088326, -0.2994386, 1.975193, 1, 0, 0, 1, 1,
2.10556, 2.502283, -1.019232, 1, 0, 0, 1, 1,
2.165678, 0.7695253, -0.572521, 1, 0, 0, 1, 1,
2.171987, -0.6051378, 2.149241, 1, 0, 0, 1, 1,
2.209032, 0.2562174, 1.609342, 1, 0, 0, 1, 1,
2.246569, 0.7277477, 0.8485217, 0, 0, 0, 1, 1,
2.262019, 0.1259954, 1.952645, 0, 0, 0, 1, 1,
2.281812, 0.4398982, 0.6218008, 0, 0, 0, 1, 1,
2.317233, 1.188741, 2.544297, 0, 0, 0, 1, 1,
2.342405, -0.5065892, 1.831516, 0, 0, 0, 1, 1,
2.376081, 0.3436563, -0.1453778, 0, 0, 0, 1, 1,
2.394144, -1.035575, 4.66588, 0, 0, 0, 1, 1,
2.4873, -0.1648198, 1.869248, 1, 1, 1, 1, 1,
2.494395, 0.7028055, 2.085333, 1, 1, 1, 1, 1,
2.537344, 0.3063318, 1.515876, 1, 1, 1, 1, 1,
2.6269, -1.185736, 0.2542278, 1, 1, 1, 1, 1,
2.741725, 0.2384477, 0.9678285, 1, 1, 1, 1, 1,
2.75341, -0.8031834, 0.7650743, 1, 1, 1, 1, 1,
3.330795, 1.278755, 1.112499, 1, 1, 1, 1, 1
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
var radius = 9.364759;
var distance = 32.89332;
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
mvMatrix.translate( 0.1250348, -0.03968501, 0.03133917 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89332);
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
