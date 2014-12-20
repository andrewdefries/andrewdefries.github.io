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
-2.882496, 1.083298, -1.396525, 1, 0, 0, 1,
-2.730519, 0.3809588, -1.575507, 1, 0.007843138, 0, 1,
-2.673705, 1.12507, -0.1231363, 1, 0.01176471, 0, 1,
-2.597492, -0.1075399, -1.32802, 1, 0.01960784, 0, 1,
-2.53194, 1.099683, -0.1418027, 1, 0.02352941, 0, 1,
-2.512637, -0.692253, -1.507866, 1, 0.03137255, 0, 1,
-2.398658, 1.238838, -2.299408, 1, 0.03529412, 0, 1,
-2.395222, 1.248665, -2.949435, 1, 0.04313726, 0, 1,
-2.338729, 0.3314594, -1.326176, 1, 0.04705882, 0, 1,
-2.312041, -0.2826425, -1.604976, 1, 0.05490196, 0, 1,
-2.299407, 1.166879, -1.382047, 1, 0.05882353, 0, 1,
-2.271425, -0.309608, -0.725597, 1, 0.06666667, 0, 1,
-2.233152, 0.05207661, -3.610893, 1, 0.07058824, 0, 1,
-2.220325, 0.6412898, -2.274826, 1, 0.07843138, 0, 1,
-2.187432, 0.3954943, -0.7773754, 1, 0.08235294, 0, 1,
-2.12269, 0.879254, -2.151014, 1, 0.09019608, 0, 1,
-2.120051, 0.2207714, -3.307665, 1, 0.09411765, 0, 1,
-2.119963, 1.40881, -1.598334, 1, 0.1019608, 0, 1,
-2.037321, -0.5999665, -0.3680768, 1, 0.1098039, 0, 1,
-2.023737, 0.1807621, -0.7923504, 1, 0.1137255, 0, 1,
-2.023196, -1.382973, -1.834011, 1, 0.1215686, 0, 1,
-2.000767, 0.09530552, -1.606027, 1, 0.1254902, 0, 1,
-1.978641, 1.109186, -0.3941485, 1, 0.1333333, 0, 1,
-1.977405, 1.087197, -0.6148283, 1, 0.1372549, 0, 1,
-1.968773, 0.2639467, -1.676267, 1, 0.145098, 0, 1,
-1.957453, 0.7735106, -1.478051, 1, 0.1490196, 0, 1,
-1.936353, 1.068671, -2.453599, 1, 0.1568628, 0, 1,
-1.934108, 0.262765, -0.5861812, 1, 0.1607843, 0, 1,
-1.919928, -0.1817859, -1.15881, 1, 0.1686275, 0, 1,
-1.907931, -1.457419, -1.309792, 1, 0.172549, 0, 1,
-1.884453, -1.157718, -1.545335, 1, 0.1803922, 0, 1,
-1.847753, -0.6478685, -2.2574, 1, 0.1843137, 0, 1,
-1.843303, 0.2717013, -2.004625, 1, 0.1921569, 0, 1,
-1.837324, 0.4021212, -2.814955, 1, 0.1960784, 0, 1,
-1.835111, -0.5770925, -0.6420074, 1, 0.2039216, 0, 1,
-1.82971, -0.7677701, -3.075278, 1, 0.2117647, 0, 1,
-1.828844, -0.623068, -3.076823, 1, 0.2156863, 0, 1,
-1.822598, 0.8919274, -1.499109, 1, 0.2235294, 0, 1,
-1.8207, 0.1996375, -2.951806, 1, 0.227451, 0, 1,
-1.814336, -1.846426, -2.48909, 1, 0.2352941, 0, 1,
-1.813681, 0.3630394, -1.462986, 1, 0.2392157, 0, 1,
-1.776626, -1.470121, -1.741411, 1, 0.2470588, 0, 1,
-1.775006, 0.536033, -1.69414, 1, 0.2509804, 0, 1,
-1.762343, 0.2141694, -3.032551, 1, 0.2588235, 0, 1,
-1.758365, 1.214353, -0.2064169, 1, 0.2627451, 0, 1,
-1.750292, -0.9948155, -2.846714, 1, 0.2705882, 0, 1,
-1.749766, -0.9935311, -1.921378, 1, 0.2745098, 0, 1,
-1.735636, -0.4970958, -3.138431, 1, 0.282353, 0, 1,
-1.702526, -1.296309, -2.521175, 1, 0.2862745, 0, 1,
-1.696877, 0.0225044, 0.0377641, 1, 0.2941177, 0, 1,
-1.691455, 0.1285613, -2.677803, 1, 0.3019608, 0, 1,
-1.637926, -0.7147647, -1.460072, 1, 0.3058824, 0, 1,
-1.629871, -1.745169, -2.110938, 1, 0.3137255, 0, 1,
-1.626076, -0.4765954, 0.2993478, 1, 0.3176471, 0, 1,
-1.611436, 0.8826082, -0.7922146, 1, 0.3254902, 0, 1,
-1.609691, -0.2036547, -1.554656, 1, 0.3294118, 0, 1,
-1.603403, -1.231999, -1.499373, 1, 0.3372549, 0, 1,
-1.594992, 0.006743713, -3.289886, 1, 0.3411765, 0, 1,
-1.594748, 0.7942458, -0.6580007, 1, 0.3490196, 0, 1,
-1.58838, 1.300306, -1.534742, 1, 0.3529412, 0, 1,
-1.550335, -0.4464797, -2.972717, 1, 0.3607843, 0, 1,
-1.549714, 0.9805878, -0.2617038, 1, 0.3647059, 0, 1,
-1.5321, -0.3342066, -1.912773, 1, 0.372549, 0, 1,
-1.531352, 1.428452, -0.3859675, 1, 0.3764706, 0, 1,
-1.529241, 0.6509523, -2.250371, 1, 0.3843137, 0, 1,
-1.517653, -0.2054885, -2.222824, 1, 0.3882353, 0, 1,
-1.500242, 0.4524178, -0.8287038, 1, 0.3960784, 0, 1,
-1.499822, -0.288569, -0.8471561, 1, 0.4039216, 0, 1,
-1.485476, 0.5534431, -0.9109751, 1, 0.4078431, 0, 1,
-1.484123, -0.4226132, -2.774977, 1, 0.4156863, 0, 1,
-1.47909, -1.674973, -4.39781, 1, 0.4196078, 0, 1,
-1.471538, 0.5128195, -1.372303, 1, 0.427451, 0, 1,
-1.446336, 1.3673, -2.637264, 1, 0.4313726, 0, 1,
-1.433798, -0.3233527, -1.40461, 1, 0.4392157, 0, 1,
-1.432927, 0.001190998, -1.899197, 1, 0.4431373, 0, 1,
-1.431366, -2.462625, -2.895551, 1, 0.4509804, 0, 1,
-1.418911, -2.459914, -3.32064, 1, 0.454902, 0, 1,
-1.416561, -0.4364269, -0.5466498, 1, 0.4627451, 0, 1,
-1.410689, -0.2563097, -0.6425971, 1, 0.4666667, 0, 1,
-1.400937, -1.4661, -3.295316, 1, 0.4745098, 0, 1,
-1.398378, -0.6062337, -3.136092, 1, 0.4784314, 0, 1,
-1.395406, -0.4121526, -2.79673, 1, 0.4862745, 0, 1,
-1.390216, -0.06126179, -1.683749, 1, 0.4901961, 0, 1,
-1.386371, -0.6893398, 0.8111034, 1, 0.4980392, 0, 1,
-1.382294, -0.902439, -1.624934, 1, 0.5058824, 0, 1,
-1.369203, 0.5812726, -1.655294, 1, 0.509804, 0, 1,
-1.364913, -1.738287, -3.219208, 1, 0.5176471, 0, 1,
-1.357029, -0.5399144, -0.8403006, 1, 0.5215687, 0, 1,
-1.351627, -0.130568, -3.232201, 1, 0.5294118, 0, 1,
-1.335339, 0.9368554, -1.201612, 1, 0.5333334, 0, 1,
-1.329047, -0.3897088, -1.500573, 1, 0.5411765, 0, 1,
-1.328015, -0.5892734, -3.12224, 1, 0.5450981, 0, 1,
-1.32754, -0.6070544, -2.62848, 1, 0.5529412, 0, 1,
-1.309936, -1.922198, -4.63558, 1, 0.5568628, 0, 1,
-1.298552, -0.1067587, -0.4377123, 1, 0.5647059, 0, 1,
-1.288225, -0.226786, -3.513961, 1, 0.5686275, 0, 1,
-1.285102, -0.988508, -2.955119, 1, 0.5764706, 0, 1,
-1.278065, -0.9356991, -2.473166, 1, 0.5803922, 0, 1,
-1.275661, -0.7255676, -2.158744, 1, 0.5882353, 0, 1,
-1.267457, -0.4017384, -2.171635, 1, 0.5921569, 0, 1,
-1.266043, -0.7058988, -2.391967, 1, 0.6, 0, 1,
-1.264155, 0.8473797, -1.043651, 1, 0.6078432, 0, 1,
-1.262088, -0.7146441, -2.882959, 1, 0.6117647, 0, 1,
-1.261526, -0.4886994, -0.3874669, 1, 0.6196079, 0, 1,
-1.252783, -0.9004272, -1.961311, 1, 0.6235294, 0, 1,
-1.246137, 1.872785, -0.8683033, 1, 0.6313726, 0, 1,
-1.236806, 0.5703791, -1.793159, 1, 0.6352941, 0, 1,
-1.228293, -1.720333, -2.919483, 1, 0.6431373, 0, 1,
-1.2204, -0.8016676, -3.382772, 1, 0.6470588, 0, 1,
-1.214237, -0.2686107, -1.186039, 1, 0.654902, 0, 1,
-1.209687, -0.265514, -1.39191, 1, 0.6588235, 0, 1,
-1.207275, -0.1084921, -1.884576, 1, 0.6666667, 0, 1,
-1.20491, 0.8966421, 0.05657705, 1, 0.6705883, 0, 1,
-1.20029, -0.3204288, -2.816304, 1, 0.6784314, 0, 1,
-1.19087, 1.12479, 0.03768469, 1, 0.682353, 0, 1,
-1.189216, -1.759317, -2.622869, 1, 0.6901961, 0, 1,
-1.186678, 1.431256, -1.937901, 1, 0.6941177, 0, 1,
-1.186538, -3.077633, -2.936519, 1, 0.7019608, 0, 1,
-1.185307, 0.3303365, -0.07871954, 1, 0.7098039, 0, 1,
-1.171734, 0.6375065, -0.4306914, 1, 0.7137255, 0, 1,
-1.169737, 0.5622031, 0.2616622, 1, 0.7215686, 0, 1,
-1.164826, -1.199958, -3.643455, 1, 0.7254902, 0, 1,
-1.161018, 1.243935, -0.8652601, 1, 0.7333333, 0, 1,
-1.146473, 0.4618269, -2.172784, 1, 0.7372549, 0, 1,
-1.142909, 1.888802, -1.324937, 1, 0.7450981, 0, 1,
-1.140085, -0.7947678, -1.51377, 1, 0.7490196, 0, 1,
-1.139, -0.04999843, -0.406908, 1, 0.7568628, 0, 1,
-1.124933, 0.5498909, -0.5804372, 1, 0.7607843, 0, 1,
-1.120571, 1.041346, -0.4230058, 1, 0.7686275, 0, 1,
-1.120052, 0.6348832, -1.579658, 1, 0.772549, 0, 1,
-1.119687, 1.35417, 0.6399369, 1, 0.7803922, 0, 1,
-1.110884, 1.088891, -1.588372, 1, 0.7843137, 0, 1,
-1.109089, 1.310363, -2.463434, 1, 0.7921569, 0, 1,
-1.107867, -1.407702, -2.513689, 1, 0.7960784, 0, 1,
-1.104952, 1.200867, -0.1767737, 1, 0.8039216, 0, 1,
-1.100482, 1.159191, 0.6332362, 1, 0.8117647, 0, 1,
-1.092171, 1.203637, 0.3036575, 1, 0.8156863, 0, 1,
-1.091328, 1.420596, -0.4916768, 1, 0.8235294, 0, 1,
-1.090379, 0.4082635, -1.764434, 1, 0.827451, 0, 1,
-1.080266, 2.008767, -0.04806792, 1, 0.8352941, 0, 1,
-1.079326, 0.5696024, -1.197255, 1, 0.8392157, 0, 1,
-1.079047, -0.6311843, -2.175848, 1, 0.8470588, 0, 1,
-1.078404, 0.2748753, -1.060399, 1, 0.8509804, 0, 1,
-1.070175, 0.3216132, -1.197109, 1, 0.8588235, 0, 1,
-1.065453, -1.063949, -1.769541, 1, 0.8627451, 0, 1,
-1.053475, 0.5766599, -1.841316, 1, 0.8705882, 0, 1,
-1.034931, 1.219445, 0.3598651, 1, 0.8745098, 0, 1,
-1.033712, -0.04044219, -2.211169, 1, 0.8823529, 0, 1,
-1.031525, -0.1782471, -3.567461, 1, 0.8862745, 0, 1,
-1.031295, 0.8512278, -2.21381, 1, 0.8941177, 0, 1,
-1.02784, -0.3617924, -0.8941864, 1, 0.8980392, 0, 1,
-1.024826, 0.5453719, -0.2908619, 1, 0.9058824, 0, 1,
-1.022365, -2.074473, 0.7333161, 1, 0.9137255, 0, 1,
-1.017466, 0.37465, 0.2203063, 1, 0.9176471, 0, 1,
-1.008471, -0.8382761, -3.572004, 1, 0.9254902, 0, 1,
-1.008237, -0.9690849, -2.539723, 1, 0.9294118, 0, 1,
-0.9983231, 0.9265099, -1.045316, 1, 0.9372549, 0, 1,
-0.9942952, -1.47208, -1.715236, 1, 0.9411765, 0, 1,
-0.9942786, -0.5696908, -1.032302, 1, 0.9490196, 0, 1,
-0.9936205, -0.7200396, -2.575109, 1, 0.9529412, 0, 1,
-0.9908491, 1.247726, -2.283481, 1, 0.9607843, 0, 1,
-0.9874436, 0.4896253, -2.708838, 1, 0.9647059, 0, 1,
-0.9844364, 0.7535062, 0.6965532, 1, 0.972549, 0, 1,
-0.9820481, -2.295447, -2.389702, 1, 0.9764706, 0, 1,
-0.9766347, 0.663482, -2.424376, 1, 0.9843137, 0, 1,
-0.9698092, -0.5347112, -3.155045, 1, 0.9882353, 0, 1,
-0.9619248, -0.1674469, -2.29427, 1, 0.9960784, 0, 1,
-0.9570114, 0.3585087, -0.9081013, 0.9960784, 1, 0, 1,
-0.9547853, 1.550753, -0.7545537, 0.9921569, 1, 0, 1,
-0.9502488, -0.7206655, -1.310331, 0.9843137, 1, 0, 1,
-0.942812, -0.9786652, -2.787248, 0.9803922, 1, 0, 1,
-0.938331, -0.1510307, -3.001626, 0.972549, 1, 0, 1,
-0.9323376, -0.7889685, -2.915829, 0.9686275, 1, 0, 1,
-0.9320015, -0.2040175, -1.578722, 0.9607843, 1, 0, 1,
-0.9287806, 0.5324045, -0.9989814, 0.9568627, 1, 0, 1,
-0.9265124, -0.7402927, -3.11661, 0.9490196, 1, 0, 1,
-0.9230998, 0.2016924, -0.940493, 0.945098, 1, 0, 1,
-0.9201599, -0.4008403, -3.726533, 0.9372549, 1, 0, 1,
-0.9096887, -0.09507425, -1.208579, 0.9333333, 1, 0, 1,
-0.9091399, -0.7132406, -1.788364, 0.9254902, 1, 0, 1,
-0.9048169, -0.03266858, -1.342844, 0.9215686, 1, 0, 1,
-0.8999584, -0.2652096, -2.396527, 0.9137255, 1, 0, 1,
-0.8988287, 0.7344298, -0.6102929, 0.9098039, 1, 0, 1,
-0.8846828, -1.073158, -2.563697, 0.9019608, 1, 0, 1,
-0.884131, -0.4575451, -1.363812, 0.8941177, 1, 0, 1,
-0.8827668, -0.2882766, -0.3457025, 0.8901961, 1, 0, 1,
-0.8816173, -0.6281325, -1.629121, 0.8823529, 1, 0, 1,
-0.8806886, 1.048791, -1.566513, 0.8784314, 1, 0, 1,
-0.8765255, -0.1203725, -1.647792, 0.8705882, 1, 0, 1,
-0.8763721, 0.09333253, -1.975991, 0.8666667, 1, 0, 1,
-0.8739499, -0.4370093, -2.969576, 0.8588235, 1, 0, 1,
-0.8693928, -0.638329, -3.79831, 0.854902, 1, 0, 1,
-0.8689549, -1.675083, -4.229216, 0.8470588, 1, 0, 1,
-0.8558384, -1.793616, -1.228963, 0.8431373, 1, 0, 1,
-0.854802, -1.813361, -0.5945255, 0.8352941, 1, 0, 1,
-0.8545287, -0.4721342, -3.806649, 0.8313726, 1, 0, 1,
-0.8522858, 1.004959, -0.5898571, 0.8235294, 1, 0, 1,
-0.8463941, 0.6124024, -1.781217, 0.8196079, 1, 0, 1,
-0.835805, 0.8018982, -2.219433, 0.8117647, 1, 0, 1,
-0.8356784, 0.547536, -1.098222, 0.8078431, 1, 0, 1,
-0.8314142, -1.696335, -3.024382, 0.8, 1, 0, 1,
-0.8304885, 0.3576494, -1.596066, 0.7921569, 1, 0, 1,
-0.8302088, -0.1644028, -1.842864, 0.7882353, 1, 0, 1,
-0.8298348, 0.2667193, 0.2917381, 0.7803922, 1, 0, 1,
-0.8241835, -0.7226424, -1.472222, 0.7764706, 1, 0, 1,
-0.8159453, -0.6853688, -3.005371, 0.7686275, 1, 0, 1,
-0.8139722, 0.3771844, -2.04444, 0.7647059, 1, 0, 1,
-0.812833, 1.299985, 0.195986, 0.7568628, 1, 0, 1,
-0.8110409, 0.08683488, -0.5448406, 0.7529412, 1, 0, 1,
-0.8066671, -0.2417218, -1.568177, 0.7450981, 1, 0, 1,
-0.806151, -1.672651, -4.495182, 0.7411765, 1, 0, 1,
-0.8026482, 0.5711119, -0.5189595, 0.7333333, 1, 0, 1,
-0.7935481, 0.01518873, -1.925019, 0.7294118, 1, 0, 1,
-0.7922332, -0.6673074, -1.084405, 0.7215686, 1, 0, 1,
-0.792122, 1.31541, 0.4438187, 0.7176471, 1, 0, 1,
-0.7909727, 0.2803477, 0.0381134, 0.7098039, 1, 0, 1,
-0.7885749, -0.1410542, -2.100463, 0.7058824, 1, 0, 1,
-0.7862972, 0.9208696, -2.0822, 0.6980392, 1, 0, 1,
-0.7730073, 0.2695018, -0.7369971, 0.6901961, 1, 0, 1,
-0.7686383, -1.632595, -2.261632, 0.6862745, 1, 0, 1,
-0.7686344, 0.9420666, -0.8427872, 0.6784314, 1, 0, 1,
-0.7585402, 0.6147071, -0.5782111, 0.6745098, 1, 0, 1,
-0.755492, -0.7832811, -1.835482, 0.6666667, 1, 0, 1,
-0.7461007, -0.1446774, -1.695172, 0.6627451, 1, 0, 1,
-0.7458223, 0.07436491, -2.050872, 0.654902, 1, 0, 1,
-0.7426273, -1.329804, -1.456903, 0.6509804, 1, 0, 1,
-0.7393284, -1.154326, -2.435037, 0.6431373, 1, 0, 1,
-0.7382991, 0.5012291, 0.8537984, 0.6392157, 1, 0, 1,
-0.7358308, 0.01376715, -2.913896, 0.6313726, 1, 0, 1,
-0.7349566, 1.632745, -0.4677433, 0.627451, 1, 0, 1,
-0.7184298, 0.4529203, 0.2713183, 0.6196079, 1, 0, 1,
-0.7156928, -0.06706064, -0.4199609, 0.6156863, 1, 0, 1,
-0.713962, 0.1314146, -2.83946, 0.6078432, 1, 0, 1,
-0.7078066, -0.001309411, -3.39554, 0.6039216, 1, 0, 1,
-0.7075477, 0.9441277, -0.4488699, 0.5960785, 1, 0, 1,
-0.7070844, -0.2391606, -0.421899, 0.5882353, 1, 0, 1,
-0.7064872, -0.3618545, -2.982074, 0.5843138, 1, 0, 1,
-0.7004531, 0.8270894, -0.7988889, 0.5764706, 1, 0, 1,
-0.6981536, 1.090527, -1.45854, 0.572549, 1, 0, 1,
-0.6938431, 0.8784113, -1.348688, 0.5647059, 1, 0, 1,
-0.6935145, 0.8517472, -0.3682959, 0.5607843, 1, 0, 1,
-0.6930605, 0.8110281, -1.965247, 0.5529412, 1, 0, 1,
-0.6862404, -0.3981371, -2.631062, 0.5490196, 1, 0, 1,
-0.6853191, 1.42958, -0.4560535, 0.5411765, 1, 0, 1,
-0.6830616, -0.2704877, -2.114486, 0.5372549, 1, 0, 1,
-0.6798113, -0.2580637, -1.881347, 0.5294118, 1, 0, 1,
-0.6788525, 0.1028695, -2.215093, 0.5254902, 1, 0, 1,
-0.6715807, -0.2305393, -2.651134, 0.5176471, 1, 0, 1,
-0.6683077, 0.3676352, -1.410265, 0.5137255, 1, 0, 1,
-0.6647227, -1.871452, -2.717893, 0.5058824, 1, 0, 1,
-0.6639308, -0.1021197, -2.107306, 0.5019608, 1, 0, 1,
-0.6615506, -2.00699, -3.100092, 0.4941176, 1, 0, 1,
-0.6603429, 0.02148019, -2.973682, 0.4862745, 1, 0, 1,
-0.658675, -0.5576737, -1.579004, 0.4823529, 1, 0, 1,
-0.6582918, 0.9816487, 0.6208354, 0.4745098, 1, 0, 1,
-0.6575664, 2.246148, 0.5206653, 0.4705882, 1, 0, 1,
-0.654505, 1.613758, -0.1376737, 0.4627451, 1, 0, 1,
-0.6540247, -1.18316, -3.401574, 0.4588235, 1, 0, 1,
-0.6472428, -0.1438537, -2.487101, 0.4509804, 1, 0, 1,
-0.646793, -0.3656661, -2.329394, 0.4470588, 1, 0, 1,
-0.639577, -1.832724, -2.550573, 0.4392157, 1, 0, 1,
-0.6376953, 0.7895899, -0.9864552, 0.4352941, 1, 0, 1,
-0.6352704, -0.4512665, -1.819197, 0.427451, 1, 0, 1,
-0.6311415, -0.1513121, -1.199832, 0.4235294, 1, 0, 1,
-0.6274289, 0.8947552, 0.7060035, 0.4156863, 1, 0, 1,
-0.6250125, -0.278941, -1.483705, 0.4117647, 1, 0, 1,
-0.6202214, -0.4045603, -1.509764, 0.4039216, 1, 0, 1,
-0.6172013, 0.3292176, 0.2168735, 0.3960784, 1, 0, 1,
-0.6143649, -1.100086, -0.7317913, 0.3921569, 1, 0, 1,
-0.6112351, 1.299476, -1.677948, 0.3843137, 1, 0, 1,
-0.6111837, 0.2425282, -0.4301419, 0.3803922, 1, 0, 1,
-0.6088325, -0.3796311, 0.09980786, 0.372549, 1, 0, 1,
-0.6064997, 0.767656, -0.1142295, 0.3686275, 1, 0, 1,
-0.6038837, 0.1040407, -0.1320121, 0.3607843, 1, 0, 1,
-0.6011306, 1.020071, -2.98912, 0.3568628, 1, 0, 1,
-0.5972977, 0.4629864, -0.1152365, 0.3490196, 1, 0, 1,
-0.5953382, 2.991561, 0.9019111, 0.345098, 1, 0, 1,
-0.5926512, -0.2156655, -2.011689, 0.3372549, 1, 0, 1,
-0.5889305, 0.4414553, -1.222913, 0.3333333, 1, 0, 1,
-0.5887629, 2.074516, 0.4963694, 0.3254902, 1, 0, 1,
-0.5869736, 0.6475883, -1.335013, 0.3215686, 1, 0, 1,
-0.5798979, -2.64023, -5.287315, 0.3137255, 1, 0, 1,
-0.5774342, 0.5530995, -1.935278, 0.3098039, 1, 0, 1,
-0.5768564, -0.3358322, -4.260581, 0.3019608, 1, 0, 1,
-0.5727173, 1.363199, 0.1460989, 0.2941177, 1, 0, 1,
-0.5715352, 0.2383692, -3.284969, 0.2901961, 1, 0, 1,
-0.570952, 0.9403097, -0.1926841, 0.282353, 1, 0, 1,
-0.5611865, -0.7320477, -3.700441, 0.2784314, 1, 0, 1,
-0.5552478, 0.5003428, -2.233742, 0.2705882, 1, 0, 1,
-0.5541701, -1.289392, -3.184727, 0.2666667, 1, 0, 1,
-0.5495896, 0.1705122, -1.104177, 0.2588235, 1, 0, 1,
-0.5473204, -1.24248, -2.387139, 0.254902, 1, 0, 1,
-0.5462017, 0.6756642, -1.107785, 0.2470588, 1, 0, 1,
-0.5423933, 1.001827, 0.04089617, 0.2431373, 1, 0, 1,
-0.5423238, -1.407737, -0.3565659, 0.2352941, 1, 0, 1,
-0.5388761, 2.442024, -0.315643, 0.2313726, 1, 0, 1,
-0.5377155, 0.9621083, -2.693338, 0.2235294, 1, 0, 1,
-0.5373366, 0.6776701, -2.275405, 0.2196078, 1, 0, 1,
-0.537195, 0.2708296, 0.446778, 0.2117647, 1, 0, 1,
-0.5305072, 0.7237201, -1.807738, 0.2078431, 1, 0, 1,
-0.5299844, 2.668839, 0.3547923, 0.2, 1, 0, 1,
-0.529312, 1.223414, -0.9120744, 0.1921569, 1, 0, 1,
-0.5223709, -0.9757752, -2.64741, 0.1882353, 1, 0, 1,
-0.5215796, -1.782959, -2.038659, 0.1803922, 1, 0, 1,
-0.5196827, 0.03274924, -0.7494139, 0.1764706, 1, 0, 1,
-0.5192369, -0.02910213, -2.062469, 0.1686275, 1, 0, 1,
-0.5172266, -1.346225, -3.607896, 0.1647059, 1, 0, 1,
-0.5167002, 0.3782026, -0.3084759, 0.1568628, 1, 0, 1,
-0.5154367, -0.148947, -2.079791, 0.1529412, 1, 0, 1,
-0.5132327, -1.931869, -2.34296, 0.145098, 1, 0, 1,
-0.5055935, -1.776076, -4.621867, 0.1411765, 1, 0, 1,
-0.4979031, 0.03262876, -2.409567, 0.1333333, 1, 0, 1,
-0.4977002, 0.2617828, -1.562063, 0.1294118, 1, 0, 1,
-0.4916445, 0.4679415, 0.407616, 0.1215686, 1, 0, 1,
-0.4894942, -0.1699618, 0.2151097, 0.1176471, 1, 0, 1,
-0.4870585, -1.201283, -2.648316, 0.1098039, 1, 0, 1,
-0.4870176, 2.028259, -0.5056326, 0.1058824, 1, 0, 1,
-0.4868055, -1.36964, -4.440697, 0.09803922, 1, 0, 1,
-0.4746797, -1.309582, -2.337847, 0.09019608, 1, 0, 1,
-0.4723051, -0.2319886, -2.213678, 0.08627451, 1, 0, 1,
-0.4683375, 1.837022, 1.83039, 0.07843138, 1, 0, 1,
-0.4669434, 0.3746183, -1.93171, 0.07450981, 1, 0, 1,
-0.4626199, -1.405914, -1.57162, 0.06666667, 1, 0, 1,
-0.4526213, -0.9248164, -1.972794, 0.0627451, 1, 0, 1,
-0.4506885, -0.4962435, -2.674377, 0.05490196, 1, 0, 1,
-0.4503583, -1.5031, -3.390816, 0.05098039, 1, 0, 1,
-0.4362857, -0.893617, -3.363269, 0.04313726, 1, 0, 1,
-0.4359808, -0.8898749, -1.162705, 0.03921569, 1, 0, 1,
-0.4328238, -1.038968, -2.698856, 0.03137255, 1, 0, 1,
-0.4312654, 0.9362104, 0.1024539, 0.02745098, 1, 0, 1,
-0.4273556, 2.390238, 0.1665604, 0.01960784, 1, 0, 1,
-0.4202204, -0.8884337, -3.20173, 0.01568628, 1, 0, 1,
-0.4179384, 0.8912853, 1.198139, 0.007843138, 1, 0, 1,
-0.4137604, 0.251382, -1.891031, 0.003921569, 1, 0, 1,
-0.4108516, 0.0997391, -1.384472, 0, 1, 0.003921569, 1,
-0.407903, 0.8648745, -0.4547705, 0, 1, 0.01176471, 1,
-0.3982488, 0.607003, 0.1978289, 0, 1, 0.01568628, 1,
-0.3940739, -0.4688363, -1.44042, 0, 1, 0.02352941, 1,
-0.3863769, -0.3564413, -1.688712, 0, 1, 0.02745098, 1,
-0.3858457, -0.04374351, -1.011667, 0, 1, 0.03529412, 1,
-0.3836835, -0.6188667, -1.917566, 0, 1, 0.03921569, 1,
-0.3797201, 1.088981, -1.041474, 0, 1, 0.04705882, 1,
-0.3786798, 0.9726148, -0.1816266, 0, 1, 0.05098039, 1,
-0.3784777, -0.4269355, -3.169969, 0, 1, 0.05882353, 1,
-0.3663265, 0.2492606, -1.685646, 0, 1, 0.0627451, 1,
-0.3654493, -0.8034652, -4.331554, 0, 1, 0.07058824, 1,
-0.3649504, -1.291455, -3.320261, 0, 1, 0.07450981, 1,
-0.3632588, 0.8063607, 0.7494549, 0, 1, 0.08235294, 1,
-0.3624541, 1.278809, 1.587126, 0, 1, 0.08627451, 1,
-0.3584434, 0.680895, -1.304579, 0, 1, 0.09411765, 1,
-0.3510175, -1.789715, -2.502723, 0, 1, 0.1019608, 1,
-0.3419825, -0.5985772, -3.461854, 0, 1, 0.1058824, 1,
-0.3411419, 1.352052, 0.2012905, 0, 1, 0.1137255, 1,
-0.3323387, 0.1954588, -1.329324, 0, 1, 0.1176471, 1,
-0.330943, -0.5951882, -1.914164, 0, 1, 0.1254902, 1,
-0.3291986, -1.28823, -3.737857, 0, 1, 0.1294118, 1,
-0.3285643, 2.067614, -0.7612709, 0, 1, 0.1372549, 1,
-0.3275493, 1.257935, -0.41575, 0, 1, 0.1411765, 1,
-0.3274407, -0.752909, -2.092721, 0, 1, 0.1490196, 1,
-0.3248609, -0.7171343, -1.731639, 0, 1, 0.1529412, 1,
-0.3218814, -0.8960205, -2.987992, 0, 1, 0.1607843, 1,
-0.3183552, 1.264447, -0.09302523, 0, 1, 0.1647059, 1,
-0.3171621, 0.04978442, -2.263386, 0, 1, 0.172549, 1,
-0.317152, 1.077609, -0.3695948, 0, 1, 0.1764706, 1,
-0.3157937, -0.1134894, -1.326219, 0, 1, 0.1843137, 1,
-0.3089487, 0.07906497, -0.4111325, 0, 1, 0.1882353, 1,
-0.3080269, -0.1570978, -2.446624, 0, 1, 0.1960784, 1,
-0.3023273, 0.04292415, -1.369438, 0, 1, 0.2039216, 1,
-0.3019347, 0.9898221, 0.4862119, 0, 1, 0.2078431, 1,
-0.3011362, 0.3549795, -1.178824, 0, 1, 0.2156863, 1,
-0.300197, 0.01807321, -2.245795, 0, 1, 0.2196078, 1,
-0.2951091, -0.4471171, -2.871629, 0, 1, 0.227451, 1,
-0.2946011, -0.6038854, -1.427109, 0, 1, 0.2313726, 1,
-0.2945036, -1.073754, -2.829188, 0, 1, 0.2392157, 1,
-0.2944763, 1.26353, 0.7122343, 0, 1, 0.2431373, 1,
-0.291871, -1.065872, -1.104131, 0, 1, 0.2509804, 1,
-0.289735, -0.4961482, -2.333526, 0, 1, 0.254902, 1,
-0.2867347, 0.205176, -0.391263, 0, 1, 0.2627451, 1,
-0.2823048, 1.10703, 0.2701663, 0, 1, 0.2666667, 1,
-0.2812568, -2.083652, -2.998883, 0, 1, 0.2745098, 1,
-0.2768271, -0.2265147, -4.42152, 0, 1, 0.2784314, 1,
-0.2761309, -0.5008562, -3.286349, 0, 1, 0.2862745, 1,
-0.2716215, 1.181074, -0.5496899, 0, 1, 0.2901961, 1,
-0.2699388, 0.05761088, -0.7368721, 0, 1, 0.2980392, 1,
-0.2689463, -0.336708, -2.934065, 0, 1, 0.3058824, 1,
-0.2679732, 0.8073754, -1.103828, 0, 1, 0.3098039, 1,
-0.2673305, 1.309239, 0.8690627, 0, 1, 0.3176471, 1,
-0.2672255, 0.104653, -0.432899, 0, 1, 0.3215686, 1,
-0.2647502, 0.6031886, -1.613035, 0, 1, 0.3294118, 1,
-0.2626235, 0.7367926, -0.5753554, 0, 1, 0.3333333, 1,
-0.2614681, -1.469468, -2.666008, 0, 1, 0.3411765, 1,
-0.2593117, -0.5528208, -1.867675, 0, 1, 0.345098, 1,
-0.2584854, -0.9033906, -3.282991, 0, 1, 0.3529412, 1,
-0.2501242, -1.377519, -3.650173, 0, 1, 0.3568628, 1,
-0.2500839, 0.2673854, -1.016257, 0, 1, 0.3647059, 1,
-0.2491846, 0.6444497, 1.553969, 0, 1, 0.3686275, 1,
-0.245791, -0.4264518, -2.075764, 0, 1, 0.3764706, 1,
-0.2436667, -0.4732125, -1.731167, 0, 1, 0.3803922, 1,
-0.2381641, -1.632878, -3.559098, 0, 1, 0.3882353, 1,
-0.2361931, -0.06662499, -1.920044, 0, 1, 0.3921569, 1,
-0.2350481, 2.188034, 0.7884751, 0, 1, 0.4, 1,
-0.2347339, 0.3716062, -1.630001, 0, 1, 0.4078431, 1,
-0.2344588, -0.1057432, -3.848791, 0, 1, 0.4117647, 1,
-0.23242, 0.1737473, -1.087023, 0, 1, 0.4196078, 1,
-0.2314585, -0.6820598, -3.56012, 0, 1, 0.4235294, 1,
-0.224727, -0.4803808, -0.9633194, 0, 1, 0.4313726, 1,
-0.2245788, -1.540792, -3.209547, 0, 1, 0.4352941, 1,
-0.2245715, 0.03647973, 0.1213616, 0, 1, 0.4431373, 1,
-0.2236212, -0.2405762, -2.077884, 0, 1, 0.4470588, 1,
-0.2207531, 0.9678891, -0.4767575, 0, 1, 0.454902, 1,
-0.2201229, -1.048104, -3.888217, 0, 1, 0.4588235, 1,
-0.2191136, 0.3401442, -0.01556032, 0, 1, 0.4666667, 1,
-0.215309, -0.3390845, -2.767047, 0, 1, 0.4705882, 1,
-0.2140716, -0.943653, -2.16076, 0, 1, 0.4784314, 1,
-0.2107311, 0.05282098, -1.049197, 0, 1, 0.4823529, 1,
-0.2081906, -0.05281888, -1.015488, 0, 1, 0.4901961, 1,
-0.2070875, -0.1248434, -4.718715, 0, 1, 0.4941176, 1,
-0.2062735, -2.20014, -4.038288, 0, 1, 0.5019608, 1,
-0.2053559, -0.6997535, -2.930709, 0, 1, 0.509804, 1,
-0.2012787, -1.607551, -3.821648, 0, 1, 0.5137255, 1,
-0.1994886, -0.7282368, -1.368325, 0, 1, 0.5215687, 1,
-0.1971559, 0.6100457, -1.009889, 0, 1, 0.5254902, 1,
-0.194388, -0.1035238, -1.915606, 0, 1, 0.5333334, 1,
-0.1919993, -0.9850639, -2.607376, 0, 1, 0.5372549, 1,
-0.1907435, 0.1858465, -1.706049, 0, 1, 0.5450981, 1,
-0.1891032, 0.2348212, -1.098128, 0, 1, 0.5490196, 1,
-0.1884667, -0.1759435, -3.746135, 0, 1, 0.5568628, 1,
-0.1857373, -0.07795714, -1.267603, 0, 1, 0.5607843, 1,
-0.1836162, -1.016175, -2.807229, 0, 1, 0.5686275, 1,
-0.183132, 1.246369, -0.9627628, 0, 1, 0.572549, 1,
-0.1755326, -1.678556, -3.07065, 0, 1, 0.5803922, 1,
-0.1743167, 0.1240789, -1.184396, 0, 1, 0.5843138, 1,
-0.1730883, 0.1973096, 2.388108, 0, 1, 0.5921569, 1,
-0.1611561, -0.636539, -1.754261, 0, 1, 0.5960785, 1,
-0.1556876, -1.383531, -3.828476, 0, 1, 0.6039216, 1,
-0.1529954, 0.6489558, 0.4029973, 0, 1, 0.6117647, 1,
-0.1509656, 0.7362351, 1.064542, 0, 1, 0.6156863, 1,
-0.1496054, -0.03400533, -3.112197, 0, 1, 0.6235294, 1,
-0.1449945, -1.887445, -4.087775, 0, 1, 0.627451, 1,
-0.1447972, 0.4157473, -0.8807071, 0, 1, 0.6352941, 1,
-0.1413814, -0.1702916, -2.717, 0, 1, 0.6392157, 1,
-0.1372209, 0.2577954, -0.4362706, 0, 1, 0.6470588, 1,
-0.1335959, -0.1372712, -1.05589, 0, 1, 0.6509804, 1,
-0.1314286, 0.1961448, 1.639251, 0, 1, 0.6588235, 1,
-0.1286228, -1.253805, -3.138627, 0, 1, 0.6627451, 1,
-0.1280863, 1.541453, -0.5591582, 0, 1, 0.6705883, 1,
-0.1270272, -0.05638538, -2.348702, 0, 1, 0.6745098, 1,
-0.1193453, -0.7099782, -1.493856, 0, 1, 0.682353, 1,
-0.1114114, 1.43814, 0.2215932, 0, 1, 0.6862745, 1,
-0.1111988, -1.802356, -5.01214, 0, 1, 0.6941177, 1,
-0.1103756, 0.6110142, 0.5837797, 0, 1, 0.7019608, 1,
-0.1091995, 0.9191307, -0.06318484, 0, 1, 0.7058824, 1,
-0.1081279, 0.867404, -1.133543, 0, 1, 0.7137255, 1,
-0.1049394, 0.4695293, -0.1406191, 0, 1, 0.7176471, 1,
-0.1015369, 0.795449, -0.2038645, 0, 1, 0.7254902, 1,
-0.09793109, 0.3788888, -0.2697643, 0, 1, 0.7294118, 1,
-0.09421044, 0.8726606, 0.3033502, 0, 1, 0.7372549, 1,
-0.09052311, -0.4734557, -2.945615, 0, 1, 0.7411765, 1,
-0.08970062, -1.876361, -2.371907, 0, 1, 0.7490196, 1,
-0.08912227, -0.4732377, -3.35648, 0, 1, 0.7529412, 1,
-0.08634791, -1.484917, -1.603552, 0, 1, 0.7607843, 1,
-0.08250253, -0.6959506, -1.902769, 0, 1, 0.7647059, 1,
-0.07968937, 1.365124, 0.9821694, 0, 1, 0.772549, 1,
-0.07693174, 0.9032665, -0.3507861, 0, 1, 0.7764706, 1,
-0.07452727, -0.7419902, -3.802412, 0, 1, 0.7843137, 1,
-0.0728262, 1.758394, 0.5623185, 0, 1, 0.7882353, 1,
-0.07093128, 0.3488644, -1.171807, 0, 1, 0.7960784, 1,
-0.07005412, -0.3967194, -1.768736, 0, 1, 0.8039216, 1,
-0.06890481, -0.5527666, -3.044735, 0, 1, 0.8078431, 1,
-0.06691444, 0.4242697, -1.171339, 0, 1, 0.8156863, 1,
-0.06581834, 0.9817468, 0.8979385, 0, 1, 0.8196079, 1,
-0.06491909, 0.278022, -0.08718738, 0, 1, 0.827451, 1,
-0.06053593, 0.6221169, -0.329586, 0, 1, 0.8313726, 1,
-0.0583843, -0.9184035, -3.673182, 0, 1, 0.8392157, 1,
-0.05762674, 0.7908986, 0.8991339, 0, 1, 0.8431373, 1,
-0.05742969, -0.612321, -1.667901, 0, 1, 0.8509804, 1,
-0.04845095, -1.341041, -1.663682, 0, 1, 0.854902, 1,
-0.04703785, 0.8441316, -0.4118305, 0, 1, 0.8627451, 1,
-0.04478399, -0.995874, -2.890429, 0, 1, 0.8666667, 1,
-0.0386738, -0.5862267, -0.9291789, 0, 1, 0.8745098, 1,
-0.03559844, -0.6120792, -2.059484, 0, 1, 0.8784314, 1,
-0.03409293, 1.151108, -0.263025, 0, 1, 0.8862745, 1,
-0.02986691, 1.416232, 1.223067, 0, 1, 0.8901961, 1,
-0.02903889, 0.5715753, -0.04868232, 0, 1, 0.8980392, 1,
-0.02867434, 1.245211, -0.1013532, 0, 1, 0.9058824, 1,
-0.02724055, -1.739916, -3.262863, 0, 1, 0.9098039, 1,
-0.02695979, 0.8676811, -0.3253243, 0, 1, 0.9176471, 1,
-0.02679202, 1.420009, -2.206143, 0, 1, 0.9215686, 1,
-0.01971141, -0.4077945, -4.320294, 0, 1, 0.9294118, 1,
-0.01758747, 1.385253, -0.7132322, 0, 1, 0.9333333, 1,
-0.0154374, -0.282644, -1.317198, 0, 1, 0.9411765, 1,
-0.01341402, 1.170777, 0.8792379, 0, 1, 0.945098, 1,
-0.01279896, -0.6341884, -3.590149, 0, 1, 0.9529412, 1,
-0.0108401, -0.2779438, -2.875401, 0, 1, 0.9568627, 1,
-0.01038378, -0.7559234, -2.705297, 0, 1, 0.9647059, 1,
-0.006123785, -0.6594999, -2.980038, 0, 1, 0.9686275, 1,
-0.004789728, 1.345953, 0.08243888, 0, 1, 0.9764706, 1,
-0.003678472, 0.5065665, 0.7125673, 0, 1, 0.9803922, 1,
-0.002492414, -0.647177, -1.855063, 0, 1, 0.9882353, 1,
0.001336662, 0.3927838, -0.3863011, 0, 1, 0.9921569, 1,
0.006734965, 0.858655, 1.352693, 0, 1, 1, 1,
0.007982844, 0.202406, -0.1565061, 0, 0.9921569, 1, 1,
0.01031378, -0.3765134, 3.380656, 0, 0.9882353, 1, 1,
0.01123576, -1.555552, 3.851474, 0, 0.9803922, 1, 1,
0.01201293, -0.3659597, 0.9815407, 0, 0.9764706, 1, 1,
0.01251999, -0.4312238, 4.24063, 0, 0.9686275, 1, 1,
0.01405396, 0.318626, -1.070859, 0, 0.9647059, 1, 1,
0.01693406, 0.6071137, 2.114119, 0, 0.9568627, 1, 1,
0.01792228, 0.8196295, -1.033592, 0, 0.9529412, 1, 1,
0.01917402, 0.5339396, -0.9952, 0, 0.945098, 1, 1,
0.020288, -1.373456, 5.55835, 0, 0.9411765, 1, 1,
0.02158615, -0.6289541, 3.408773, 0, 0.9333333, 1, 1,
0.02181264, 0.01021594, 0.6271557, 0, 0.9294118, 1, 1,
0.02208429, -0.8759325, 2.801378, 0, 0.9215686, 1, 1,
0.02864075, 0.115772, 1.49043, 0, 0.9176471, 1, 1,
0.03134036, -0.1020728, 3.510512, 0, 0.9098039, 1, 1,
0.0317916, -0.843827, 4.122091, 0, 0.9058824, 1, 1,
0.03449911, -0.5297468, 4.281385, 0, 0.8980392, 1, 1,
0.03455905, -0.1235593, 2.518869, 0, 0.8901961, 1, 1,
0.03608351, 0.2549134, -1.231162, 0, 0.8862745, 1, 1,
0.04034767, -0.6914364, 2.573301, 0, 0.8784314, 1, 1,
0.04113999, 0.7093932, -1.308386, 0, 0.8745098, 1, 1,
0.04165807, -1.267035, 4.213858, 0, 0.8666667, 1, 1,
0.04199975, -1.39768, 2.502783, 0, 0.8627451, 1, 1,
0.04619216, -0.05821987, 3.34222, 0, 0.854902, 1, 1,
0.04791213, -0.4579354, 5.718535, 0, 0.8509804, 1, 1,
0.04966569, -0.9875166, 3.139799, 0, 0.8431373, 1, 1,
0.05161167, 0.06993879, -0.6578317, 0, 0.8392157, 1, 1,
0.05276613, -0.3746311, 3.230306, 0, 0.8313726, 1, 1,
0.05417716, 1.764013, -0.6963722, 0, 0.827451, 1, 1,
0.05775902, 0.2807629, 1.015763, 0, 0.8196079, 1, 1,
0.06171773, -0.06649893, 3.125797, 0, 0.8156863, 1, 1,
0.06309602, 0.5000815, 0.4459353, 0, 0.8078431, 1, 1,
0.06497532, 0.264834, 0.1651901, 0, 0.8039216, 1, 1,
0.06578949, -0.47242, 3.204426, 0, 0.7960784, 1, 1,
0.07570021, -0.44251, 3.180007, 0, 0.7882353, 1, 1,
0.07763623, 1.41323, 0.6946187, 0, 0.7843137, 1, 1,
0.07785083, -0.4282672, -0.2241439, 0, 0.7764706, 1, 1,
0.07869009, 2.050951, -0.109833, 0, 0.772549, 1, 1,
0.0793573, -1.181374, 3.388425, 0, 0.7647059, 1, 1,
0.0836757, 0.6503922, 0.04270062, 0, 0.7607843, 1, 1,
0.08525499, 0.2407189, -0.2868642, 0, 0.7529412, 1, 1,
0.0872931, 1.311161, -0.060373, 0, 0.7490196, 1, 1,
0.08730733, 0.5049534, -0.02431601, 0, 0.7411765, 1, 1,
0.08964106, 0.340809, 0.1450229, 0, 0.7372549, 1, 1,
0.09022279, 0.7753802, 0.02413264, 0, 0.7294118, 1, 1,
0.09455124, 0.8505537, -1.528318, 0, 0.7254902, 1, 1,
0.1000918, -1.36747, 2.028225, 0, 0.7176471, 1, 1,
0.108396, 1.013529, 0.5799428, 0, 0.7137255, 1, 1,
0.1086607, -0.7850096, 2.91027, 0, 0.7058824, 1, 1,
0.109419, -0.03373121, 4.005778, 0, 0.6980392, 1, 1,
0.1122384, -1.051385, 4.308953, 0, 0.6941177, 1, 1,
0.1128214, -0.08572225, 2.527076, 0, 0.6862745, 1, 1,
0.1129473, -0.376394, 1.31894, 0, 0.682353, 1, 1,
0.1148936, -0.09191924, 3.587362, 0, 0.6745098, 1, 1,
0.1153653, 0.9892266, 0.9225499, 0, 0.6705883, 1, 1,
0.1232178, 0.2171158, 1.607103, 0, 0.6627451, 1, 1,
0.1279937, 0.5306565, 1.114026, 0, 0.6588235, 1, 1,
0.1302887, 2.080043, 1.098259, 0, 0.6509804, 1, 1,
0.1311201, -0.3479982, 2.144329, 0, 0.6470588, 1, 1,
0.1319276, -1.37168, 1.885607, 0, 0.6392157, 1, 1,
0.1323756, 1.392425, 0.1837799, 0, 0.6352941, 1, 1,
0.1346617, 1.07704, 2.218706, 0, 0.627451, 1, 1,
0.1356328, -1.477931, 3.161834, 0, 0.6235294, 1, 1,
0.1380826, 0.7757677, -0.178683, 0, 0.6156863, 1, 1,
0.1382424, -0.7619269, 5.044348, 0, 0.6117647, 1, 1,
0.1476578, -0.9506772, 1.281646, 0, 0.6039216, 1, 1,
0.1478812, -0.1474424, 3.23799, 0, 0.5960785, 1, 1,
0.1544256, 0.495119, 0.4904352, 0, 0.5921569, 1, 1,
0.1546378, 0.3600031, 0.3663988, 0, 0.5843138, 1, 1,
0.1575628, 0.8567606, 0.8136473, 0, 0.5803922, 1, 1,
0.1609252, 2.455215, 0.7306413, 0, 0.572549, 1, 1,
0.1627203, 0.7876779, -1.632876, 0, 0.5686275, 1, 1,
0.1641147, 0.7528796, 0.7448993, 0, 0.5607843, 1, 1,
0.1645188, -0.226048, 2.216708, 0, 0.5568628, 1, 1,
0.1709745, -0.9161006, 1.677914, 0, 0.5490196, 1, 1,
0.1811451, 0.4320906, -2.303126, 0, 0.5450981, 1, 1,
0.1822039, 0.1793211, 1.535634, 0, 0.5372549, 1, 1,
0.1843226, -0.234777, 1.790988, 0, 0.5333334, 1, 1,
0.1980499, 0.2006641, 0.8914697, 0, 0.5254902, 1, 1,
0.2024379, -0.3441173, 4.032751, 0, 0.5215687, 1, 1,
0.2079508, 0.5293288, 0.9003693, 0, 0.5137255, 1, 1,
0.2097934, -0.9996213, 2.929617, 0, 0.509804, 1, 1,
0.2127259, 0.3889353, 1.273536, 0, 0.5019608, 1, 1,
0.214204, -0.4477855, 0.9734754, 0, 0.4941176, 1, 1,
0.2143147, 1.240474, 0.8970659, 0, 0.4901961, 1, 1,
0.218437, -0.4020128, 0.8918038, 0, 0.4823529, 1, 1,
0.221813, 0.7640255, 0.449523, 0, 0.4784314, 1, 1,
0.2235386, -0.6362528, 2.306318, 0, 0.4705882, 1, 1,
0.2235689, 1.241219, -1.022574, 0, 0.4666667, 1, 1,
0.2293601, -2.754236, 4.233978, 0, 0.4588235, 1, 1,
0.2294478, -0.3196638, 1.434298, 0, 0.454902, 1, 1,
0.2320954, -0.4419414, 2.390597, 0, 0.4470588, 1, 1,
0.2330523, -0.06136772, 0.8179707, 0, 0.4431373, 1, 1,
0.2352783, -0.9103922, 1.572757, 0, 0.4352941, 1, 1,
0.2366058, 2.268573, 0.5465854, 0, 0.4313726, 1, 1,
0.2382929, 0.150438, 1.374982, 0, 0.4235294, 1, 1,
0.2390245, -0.2441482, 1.940604, 0, 0.4196078, 1, 1,
0.2391612, -0.2411552, 1.955642, 0, 0.4117647, 1, 1,
0.239673, -1.161738, 2.985498, 0, 0.4078431, 1, 1,
0.2400558, -0.586911, 2.326025, 0, 0.4, 1, 1,
0.2403287, 0.9408649, -1.35501, 0, 0.3921569, 1, 1,
0.2438886, -1.565517, 3.233661, 0, 0.3882353, 1, 1,
0.2440598, 0.1328838, 0.5436429, 0, 0.3803922, 1, 1,
0.2485015, 0.3877779, -0.1490272, 0, 0.3764706, 1, 1,
0.2489262, -1.232294, 2.125071, 0, 0.3686275, 1, 1,
0.2544343, -0.2194413, 1.695885, 0, 0.3647059, 1, 1,
0.2590783, 0.9302798, 0.4768655, 0, 0.3568628, 1, 1,
0.2607012, -0.4143773, 3.696497, 0, 0.3529412, 1, 1,
0.261712, 0.1619125, -0.06437778, 0, 0.345098, 1, 1,
0.2627373, 0.09430574, 0.9886781, 0, 0.3411765, 1, 1,
0.2660241, 1.414026, 0.9600876, 0, 0.3333333, 1, 1,
0.2669154, 1.773638, 1.874875, 0, 0.3294118, 1, 1,
0.2740524, 0.4450785, 1.601415, 0, 0.3215686, 1, 1,
0.2774711, -0.4006538, 3.276969, 0, 0.3176471, 1, 1,
0.282315, 0.7022761, -1.296264, 0, 0.3098039, 1, 1,
0.2827913, 2.730719, -1.673538, 0, 0.3058824, 1, 1,
0.2835473, -0.6687041, 4.167683, 0, 0.2980392, 1, 1,
0.2836071, 0.7868543, 2.075717, 0, 0.2901961, 1, 1,
0.2868766, 1.179787, 0.7319323, 0, 0.2862745, 1, 1,
0.2964605, 1.829131, -2.593497, 0, 0.2784314, 1, 1,
0.2969109, -0.7901755, 3.050364, 0, 0.2745098, 1, 1,
0.3009341, 0.8910278, -0.5710033, 0, 0.2666667, 1, 1,
0.3026823, 0.3416073, 1.517731, 0, 0.2627451, 1, 1,
0.3060172, -1.296575, 2.495919, 0, 0.254902, 1, 1,
0.3067886, 0.9786263, 1.439169, 0, 0.2509804, 1, 1,
0.3070253, 0.9773638, 0.772751, 0, 0.2431373, 1, 1,
0.3089359, 1.406777, -1.044982, 0, 0.2392157, 1, 1,
0.3114422, -1.583925, 5.716792, 0, 0.2313726, 1, 1,
0.3306344, -0.7946692, 4.717739, 0, 0.227451, 1, 1,
0.3440074, 0.3249106, -0.1039708, 0, 0.2196078, 1, 1,
0.3471253, 1.34659, -0.3308098, 0, 0.2156863, 1, 1,
0.3476136, -0.6537421, 3.010568, 0, 0.2078431, 1, 1,
0.3610591, 2.430274, -0.8599858, 0, 0.2039216, 1, 1,
0.361987, 0.1099058, 0.2241431, 0, 0.1960784, 1, 1,
0.3625702, -0.3256114, 2.742612, 0, 0.1882353, 1, 1,
0.3657217, 0.4435902, 0.9354488, 0, 0.1843137, 1, 1,
0.3660684, 0.1051714, 0.5440311, 0, 0.1764706, 1, 1,
0.3707733, 0.4251383, -0.7436166, 0, 0.172549, 1, 1,
0.3709126, 0.002400863, 1.711628, 0, 0.1647059, 1, 1,
0.3755978, 0.04721458, 1.633525, 0, 0.1607843, 1, 1,
0.3765958, -1.273819, 3.525947, 0, 0.1529412, 1, 1,
0.3818059, -0.3654512, 3.384798, 0, 0.1490196, 1, 1,
0.3832235, -0.2837274, 2.539151, 0, 0.1411765, 1, 1,
0.3837995, 0.7444972, 1.194963, 0, 0.1372549, 1, 1,
0.3844225, -0.4689478, 1.593337, 0, 0.1294118, 1, 1,
0.3844336, -1.352696, 1.897305, 0, 0.1254902, 1, 1,
0.3853711, 0.2147046, 3.170771, 0, 0.1176471, 1, 1,
0.38629, 0.5039577, 0.3801171, 0, 0.1137255, 1, 1,
0.3874262, -1.022709, 4.04159, 0, 0.1058824, 1, 1,
0.3880647, 1.67998, 1.366052, 0, 0.09803922, 1, 1,
0.3917117, -0.2535852, 0.1896957, 0, 0.09411765, 1, 1,
0.3926351, -0.6750052, 4.479304, 0, 0.08627451, 1, 1,
0.3998934, 0.3131597, 2.754446, 0, 0.08235294, 1, 1,
0.4000711, 1.100361, 0.1607661, 0, 0.07450981, 1, 1,
0.4001249, -0.3793177, 2.196135, 0, 0.07058824, 1, 1,
0.405542, 0.01535461, 3.238896, 0, 0.0627451, 1, 1,
0.4144143, 0.8122358, -0.591549, 0, 0.05882353, 1, 1,
0.4153623, 0.4568721, -0.7994974, 0, 0.05098039, 1, 1,
0.4175254, 1.040066, 0.7651402, 0, 0.04705882, 1, 1,
0.4187967, -0.5213175, 2.105204, 0, 0.03921569, 1, 1,
0.4238651, 1.096947, -0.5058882, 0, 0.03529412, 1, 1,
0.4322632, -2.631549, 1.263633, 0, 0.02745098, 1, 1,
0.4355798, -0.3137396, 3.558053, 0, 0.02352941, 1, 1,
0.4408517, -0.3742691, 3.452698, 0, 0.01568628, 1, 1,
0.4457725, -1.662943, 2.918359, 0, 0.01176471, 1, 1,
0.453152, 0.234555, 2.783817, 0, 0.003921569, 1, 1,
0.4549285, -0.9458529, 4.386079, 0.003921569, 0, 1, 1,
0.4557124, 0.3640673, 2.699356, 0.007843138, 0, 1, 1,
0.4562104, 0.7529225, 3.020713, 0.01568628, 0, 1, 1,
0.4582221, -1.551834, 3.376654, 0.01960784, 0, 1, 1,
0.4605483, 0.196137, -0.6599494, 0.02745098, 0, 1, 1,
0.4606567, -0.8100474, 4.77921, 0.03137255, 0, 1, 1,
0.4618604, 1.572055, 0.7060651, 0.03921569, 0, 1, 1,
0.4621949, 1.065922, 0.6213749, 0.04313726, 0, 1, 1,
0.4630581, -0.06915183, 3.558002, 0.05098039, 0, 1, 1,
0.463483, 0.1154475, -0.3657022, 0.05490196, 0, 1, 1,
0.4643025, -1.189841, 3.794437, 0.0627451, 0, 1, 1,
0.4643523, 0.5445498, -1.393462, 0.06666667, 0, 1, 1,
0.4676309, -0.8485234, 4.36378, 0.07450981, 0, 1, 1,
0.4689938, 0.3398624, -0.7980748, 0.07843138, 0, 1, 1,
0.4702139, -0.6248224, 2.636408, 0.08627451, 0, 1, 1,
0.4705599, 0.4587017, 0.3172095, 0.09019608, 0, 1, 1,
0.471752, -0.9782382, 3.161029, 0.09803922, 0, 1, 1,
0.4741263, -0.5736732, 3.471514, 0.1058824, 0, 1, 1,
0.4769216, -0.2109072, 1.807855, 0.1098039, 0, 1, 1,
0.4803646, 0.379145, 0.3598752, 0.1176471, 0, 1, 1,
0.4908839, -0.7588339, 2.299419, 0.1215686, 0, 1, 1,
0.4940666, -0.6433686, 1.954786, 0.1294118, 0, 1, 1,
0.4941963, 0.4926241, 1.022544, 0.1333333, 0, 1, 1,
0.4946008, 0.3423589, 1.508963, 0.1411765, 0, 1, 1,
0.4951358, 0.03327341, 1.335638, 0.145098, 0, 1, 1,
0.4960972, -1.751219, 0.8753848, 0.1529412, 0, 1, 1,
0.4965498, -0.2325879, 2.860846, 0.1568628, 0, 1, 1,
0.49788, -0.2431588, 2.799036, 0.1647059, 0, 1, 1,
0.49804, -0.1678314, 2.279958, 0.1686275, 0, 1, 1,
0.5049245, -1.476587, 2.87974, 0.1764706, 0, 1, 1,
0.5061975, 0.8467669, 1.849304, 0.1803922, 0, 1, 1,
0.5126097, -0.6847975, 1.429989, 0.1882353, 0, 1, 1,
0.5130368, 0.914681, 0.3659644, 0.1921569, 0, 1, 1,
0.5141302, 1.288703, 1.119652, 0.2, 0, 1, 1,
0.5266871, -2.320294, 3.441759, 0.2078431, 0, 1, 1,
0.5302489, 0.1312529, 1.828165, 0.2117647, 0, 1, 1,
0.5306677, -1.11299, 2.881205, 0.2196078, 0, 1, 1,
0.5318736, -0.4639117, 2.605098, 0.2235294, 0, 1, 1,
0.5339589, -0.1206687, 0.6410201, 0.2313726, 0, 1, 1,
0.5363709, -0.4066441, 1.285172, 0.2352941, 0, 1, 1,
0.5366794, -0.1920106, 2.595942, 0.2431373, 0, 1, 1,
0.5381284, -0.727361, 2.962132, 0.2470588, 0, 1, 1,
0.5419698, -0.751928, 1.244952, 0.254902, 0, 1, 1,
0.5430537, 1.577935, -0.1451822, 0.2588235, 0, 1, 1,
0.555164, -1.070164, 2.631779, 0.2666667, 0, 1, 1,
0.5584617, -0.4610276, 3.137769, 0.2705882, 0, 1, 1,
0.5612833, -0.5812441, 1.754693, 0.2784314, 0, 1, 1,
0.5620397, 0.759126, -0.1817248, 0.282353, 0, 1, 1,
0.5659443, -1.113727, 1.873166, 0.2901961, 0, 1, 1,
0.5677533, -1.320956, 1.901482, 0.2941177, 0, 1, 1,
0.5719547, 0.4521087, -0.185056, 0.3019608, 0, 1, 1,
0.5727274, -0.8582102, 2.21171, 0.3098039, 0, 1, 1,
0.5761448, -0.7844521, 1.443861, 0.3137255, 0, 1, 1,
0.579654, 0.8011209, 0.04104709, 0.3215686, 0, 1, 1,
0.580071, 1.378218, 0.4378497, 0.3254902, 0, 1, 1,
0.583457, 0.61006, 1.709526, 0.3333333, 0, 1, 1,
0.5851168, 0.9411437, 1.862664, 0.3372549, 0, 1, 1,
0.5870792, -0.340141, 2.337399, 0.345098, 0, 1, 1,
0.5901366, 1.044543, -1.095907, 0.3490196, 0, 1, 1,
0.5966765, 0.4130949, 0.2261579, 0.3568628, 0, 1, 1,
0.5978035, -0.6481355, 3.280859, 0.3607843, 0, 1, 1,
0.6017318, 2.141933, 1.527348, 0.3686275, 0, 1, 1,
0.6064957, 0.02587463, 1.745028, 0.372549, 0, 1, 1,
0.609984, -0.6216219, 2.260214, 0.3803922, 0, 1, 1,
0.6176108, -0.2437094, 2.072684, 0.3843137, 0, 1, 1,
0.6213829, 0.7163385, 0.7120129, 0.3921569, 0, 1, 1,
0.6229911, -0.8821028, 2.281425, 0.3960784, 0, 1, 1,
0.6248669, 0.2978572, 0.6417867, 0.4039216, 0, 1, 1,
0.6301773, -0.08930857, 1.774177, 0.4117647, 0, 1, 1,
0.6350378, -0.03488613, 2.355513, 0.4156863, 0, 1, 1,
0.6364437, 1.759447, -0.6994962, 0.4235294, 0, 1, 1,
0.6488399, 0.9437991, 0.6908183, 0.427451, 0, 1, 1,
0.6556327, 0.8253721, 1.643907, 0.4352941, 0, 1, 1,
0.6580127, 0.4985794, 0.7838445, 0.4392157, 0, 1, 1,
0.6635645, -0.5524269, 2.804168, 0.4470588, 0, 1, 1,
0.6728743, 1.462545, 0.7704563, 0.4509804, 0, 1, 1,
0.6742234, 0.1166282, 3.184422, 0.4588235, 0, 1, 1,
0.6755042, 1.615706, -0.6338731, 0.4627451, 0, 1, 1,
0.6788377, 1.609369, 0.5182676, 0.4705882, 0, 1, 1,
0.6857954, -0.8270531, 1.713995, 0.4745098, 0, 1, 1,
0.6891617, -1.125987, 2.102609, 0.4823529, 0, 1, 1,
0.7009995, 0.2428564, 0.2593131, 0.4862745, 0, 1, 1,
0.7126016, 0.02139776, 1.868469, 0.4941176, 0, 1, 1,
0.7134218, -1.073864, 1.370423, 0.5019608, 0, 1, 1,
0.7163545, 0.5957025, 2.428367, 0.5058824, 0, 1, 1,
0.7166634, 1.075238, -0.2870619, 0.5137255, 0, 1, 1,
0.7179126, -0.4854812, 2.999071, 0.5176471, 0, 1, 1,
0.7220529, 0.2547989, 2.558977, 0.5254902, 0, 1, 1,
0.722508, 0.2815584, 0.389266, 0.5294118, 0, 1, 1,
0.7295423, 0.2571944, -0.4028358, 0.5372549, 0, 1, 1,
0.7328306, -0.1936379, 3.005058, 0.5411765, 0, 1, 1,
0.7354087, -0.7336312, 2.994071, 0.5490196, 0, 1, 1,
0.7414618, -1.200498, 3.656712, 0.5529412, 0, 1, 1,
0.74433, -0.05580399, 2.644985, 0.5607843, 0, 1, 1,
0.7469729, 2.484922, -2.14121, 0.5647059, 0, 1, 1,
0.7473673, 0.302929, 1.247347, 0.572549, 0, 1, 1,
0.7496508, 0.3126804, -0.128154, 0.5764706, 0, 1, 1,
0.75051, 0.8302354, 0.5800167, 0.5843138, 0, 1, 1,
0.7512707, 0.6793966, 1.172472, 0.5882353, 0, 1, 1,
0.7545094, 0.8365996, -0.2128207, 0.5960785, 0, 1, 1,
0.7637898, 0.3448056, 1.243948, 0.6039216, 0, 1, 1,
0.7651847, 0.3022756, 1.022806, 0.6078432, 0, 1, 1,
0.7687675, 0.09629779, 1.103556, 0.6156863, 0, 1, 1,
0.772844, -0.119665, 0.620182, 0.6196079, 0, 1, 1,
0.775308, -0.860388, 3.782026, 0.627451, 0, 1, 1,
0.7780911, 0.4324352, 0.3733532, 0.6313726, 0, 1, 1,
0.7894871, -0.08058422, 1.039671, 0.6392157, 0, 1, 1,
0.792409, -0.316047, 1.001214, 0.6431373, 0, 1, 1,
0.7943289, 0.1899156, 1.091138, 0.6509804, 0, 1, 1,
0.7948727, -1.798102, 2.638293, 0.654902, 0, 1, 1,
0.795658, -0.9785358, 0.4364822, 0.6627451, 0, 1, 1,
0.8009889, -0.148837, 0.3123381, 0.6666667, 0, 1, 1,
0.8010607, -1.290386, 1.709234, 0.6745098, 0, 1, 1,
0.8021488, -0.2160808, 1.045371, 0.6784314, 0, 1, 1,
0.8052824, 0.7715331, 1.83795, 0.6862745, 0, 1, 1,
0.819444, -2.657232, 1.625034, 0.6901961, 0, 1, 1,
0.8204783, -0.4253028, 2.008787, 0.6980392, 0, 1, 1,
0.8222662, 0.7174315, -0.05804761, 0.7058824, 0, 1, 1,
0.8262841, -1.061715, 3.896667, 0.7098039, 0, 1, 1,
0.8263231, 0.1592017, 0.4464801, 0.7176471, 0, 1, 1,
0.8291733, 1.726951, 0.7869723, 0.7215686, 0, 1, 1,
0.8300917, -0.3161272, 1.987035, 0.7294118, 0, 1, 1,
0.8304306, -1.13262, 3.708876, 0.7333333, 0, 1, 1,
0.8312152, 1.601814, -0.2093353, 0.7411765, 0, 1, 1,
0.8337491, 0.4932453, 1.002174, 0.7450981, 0, 1, 1,
0.8434435, 1.068991, -1.107856, 0.7529412, 0, 1, 1,
0.8510883, 0.9997283, -0.5696048, 0.7568628, 0, 1, 1,
0.8553894, 0.5964628, 1.263719, 0.7647059, 0, 1, 1,
0.8593018, 1.838109, 0.2984782, 0.7686275, 0, 1, 1,
0.86001, -0.1410708, 0.7491455, 0.7764706, 0, 1, 1,
0.8677759, 1.96023, 1.223099, 0.7803922, 0, 1, 1,
0.872812, 0.1820597, 0.6612459, 0.7882353, 0, 1, 1,
0.8744206, 1.874934, 1.477932, 0.7921569, 0, 1, 1,
0.8748047, -0.7660633, 2.98257, 0.8, 0, 1, 1,
0.8795199, 0.7274287, -0.7637753, 0.8078431, 0, 1, 1,
0.8815129, -0.1572065, 3.746588, 0.8117647, 0, 1, 1,
0.8819599, -0.3330763, 1.275737, 0.8196079, 0, 1, 1,
0.8827164, 1.605457, -0.1144804, 0.8235294, 0, 1, 1,
0.8834817, -0.1457976, 1.197305, 0.8313726, 0, 1, 1,
0.8862934, 0.4748091, -0.2015505, 0.8352941, 0, 1, 1,
0.8865709, -0.3209079, 1.232507, 0.8431373, 0, 1, 1,
0.893196, 0.963272, 0.1103187, 0.8470588, 0, 1, 1,
0.8969017, 1.280539, 0.3063503, 0.854902, 0, 1, 1,
0.9006355, 2.170848, 1.858188, 0.8588235, 0, 1, 1,
0.9011068, 1.045644, 0.06387052, 0.8666667, 0, 1, 1,
0.9081032, 0.6870793, 2.43052, 0.8705882, 0, 1, 1,
0.9131471, -1.012344, 1.034416, 0.8784314, 0, 1, 1,
0.9166746, -0.5421736, 2.005576, 0.8823529, 0, 1, 1,
0.921459, 0.7536368, 0.5771196, 0.8901961, 0, 1, 1,
0.9225003, 1.329131, 0.8140876, 0.8941177, 0, 1, 1,
0.9285659, -0.8510829, 3.382187, 0.9019608, 0, 1, 1,
0.9318674, -0.4173234, 2.395966, 0.9098039, 0, 1, 1,
0.9333904, -0.7200009, 3.745812, 0.9137255, 0, 1, 1,
0.9338906, 0.2731796, 1.339232, 0.9215686, 0, 1, 1,
0.9351981, 0.7276215, 1.80622, 0.9254902, 0, 1, 1,
0.9384962, -0.8060625, 1.574394, 0.9333333, 0, 1, 1,
0.9433453, 0.4103973, 0.9914247, 0.9372549, 0, 1, 1,
0.9467196, 0.1467255, -1.331395, 0.945098, 0, 1, 1,
0.9487129, -1.073091, 2.522222, 0.9490196, 0, 1, 1,
0.9508739, 0.8000756, 0.2454066, 0.9568627, 0, 1, 1,
0.9533167, -1.697228, 2.269382, 0.9607843, 0, 1, 1,
0.9533623, -0.3851562, 1.297439, 0.9686275, 0, 1, 1,
0.9578672, 1.502472, 1.917294, 0.972549, 0, 1, 1,
0.9609845, -0.3433556, 1.183709, 0.9803922, 0, 1, 1,
0.9615049, -1.18518, -0.1120407, 0.9843137, 0, 1, 1,
0.9659113, 0.5410433, -1.098938, 0.9921569, 0, 1, 1,
0.9742454, 0.5053629, 2.704881, 0.9960784, 0, 1, 1,
0.9746922, 0.1071401, 1.058015, 1, 0, 0.9960784, 1,
0.9783733, 0.06554335, 1.089673, 1, 0, 0.9882353, 1,
0.9798039, 0.1400593, 0.5273889, 1, 0, 0.9843137, 1,
0.9803577, -0.4041456, 2.674628, 1, 0, 0.9764706, 1,
0.9814383, 1.050864, 2.098271, 1, 0, 0.972549, 1,
0.9837577, 2.24226, -1.163921, 1, 0, 0.9647059, 1,
0.9894177, 0.6984128, 1.311532, 1, 0, 0.9607843, 1,
0.9899256, -1.305157, 3.126555, 1, 0, 0.9529412, 1,
0.9900056, -2.099049, 2.954353, 1, 0, 0.9490196, 1,
0.9918105, 0.8443446, 0.8753996, 1, 0, 0.9411765, 1,
1.012447, -0.549131, 1.686564, 1, 0, 0.9372549, 1,
1.013466, -0.9780393, 3.371965, 1, 0, 0.9294118, 1,
1.023106, -1.376421, 1.266203, 1, 0, 0.9254902, 1,
1.024528, 0.07286076, 2.684442, 1, 0, 0.9176471, 1,
1.054187, -0.1930235, 3.150946, 1, 0, 0.9137255, 1,
1.062156, 0.3370867, -0.4647207, 1, 0, 0.9058824, 1,
1.064115, 0.2420227, 0.7968159, 1, 0, 0.9019608, 1,
1.070251, -1.659409, 2.732538, 1, 0, 0.8941177, 1,
1.070461, -0.855254, 1.37162, 1, 0, 0.8862745, 1,
1.074834, 0.2334335, 1.271626, 1, 0, 0.8823529, 1,
1.091429, 1.32141, 0.08395322, 1, 0, 0.8745098, 1,
1.092976, -0.1003363, 0.8502358, 1, 0, 0.8705882, 1,
1.093585, -0.3455096, -1.036875, 1, 0, 0.8627451, 1,
1.097063, -0.2370846, 1.574168, 1, 0, 0.8588235, 1,
1.09708, 0.1429502, 2.027798, 1, 0, 0.8509804, 1,
1.105544, 0.6249624, 2.327692, 1, 0, 0.8470588, 1,
1.106247, 0.2348583, 0.1361471, 1, 0, 0.8392157, 1,
1.109935, -1.101149, 1.581778, 1, 0, 0.8352941, 1,
1.118861, 1.619938, -0.988355, 1, 0, 0.827451, 1,
1.11984, -0.03080024, 2.574928, 1, 0, 0.8235294, 1,
1.122236, -0.2863332, 2.108194, 1, 0, 0.8156863, 1,
1.122738, 0.1617198, 1.757695, 1, 0, 0.8117647, 1,
1.124051, -1.329076, 4.034971, 1, 0, 0.8039216, 1,
1.127188, -1.22036, 3.262924, 1, 0, 0.7960784, 1,
1.129546, 1.016769, 0.8901595, 1, 0, 0.7921569, 1,
1.135972, 0.4515959, 1.302448, 1, 0, 0.7843137, 1,
1.138891, 0.9051297, 1.185336, 1, 0, 0.7803922, 1,
1.14076, -1.294719, 3.315263, 1, 0, 0.772549, 1,
1.145212, 0.4785069, 0.967728, 1, 0, 0.7686275, 1,
1.14591, -0.8788688, 2.961806, 1, 0, 0.7607843, 1,
1.146384, 0.5239819, 2.231943, 1, 0, 0.7568628, 1,
1.163107, 0.647522, 1.201413, 1, 0, 0.7490196, 1,
1.183699, -0.5893715, 1.891715, 1, 0, 0.7450981, 1,
1.188132, -0.1681586, 2.175164, 1, 0, 0.7372549, 1,
1.190556, 1.006941, 0.8883137, 1, 0, 0.7333333, 1,
1.190688, 1.3853, -0.3008712, 1, 0, 0.7254902, 1,
1.19737, -1.092424, 1.367, 1, 0, 0.7215686, 1,
1.201267, 0.148101, 2.351982, 1, 0, 0.7137255, 1,
1.211426, 1.241873, -0.180535, 1, 0, 0.7098039, 1,
1.213122, -0.05010569, 1.355399, 1, 0, 0.7019608, 1,
1.22121, -0.5061904, 3.184386, 1, 0, 0.6941177, 1,
1.225977, 0.6241839, 0.3735638, 1, 0, 0.6901961, 1,
1.233933, 1.286429, 0.3831742, 1, 0, 0.682353, 1,
1.249182, 0.1001706, 2.794694, 1, 0, 0.6784314, 1,
1.25254, -0.6207881, 1.183025, 1, 0, 0.6705883, 1,
1.2528, -0.9198933, 1.305611, 1, 0, 0.6666667, 1,
1.25332, -0.6556138, 1.736154, 1, 0, 0.6588235, 1,
1.262552, 1.535758, 0.9319458, 1, 0, 0.654902, 1,
1.270464, 0.6629373, 1.704402, 1, 0, 0.6470588, 1,
1.280307, 0.1655319, 1.995322, 1, 0, 0.6431373, 1,
1.286567, 2.08498, 1.094069, 1, 0, 0.6352941, 1,
1.287161, 0.1762128, 0.4192018, 1, 0, 0.6313726, 1,
1.292964, 0.5159774, 1.876807, 1, 0, 0.6235294, 1,
1.295703, 1.343987, 0.1892243, 1, 0, 0.6196079, 1,
1.297176, -1.127426, 2.159547, 1, 0, 0.6117647, 1,
1.30878, -1.420108, 1.43553, 1, 0, 0.6078432, 1,
1.30889, 0.08619607, 1.650539, 1, 0, 0.6, 1,
1.313628, -0.4645444, 1.451403, 1, 0, 0.5921569, 1,
1.313649, -0.9498534, 1.560461, 1, 0, 0.5882353, 1,
1.31716, 2.875017, -0.09314925, 1, 0, 0.5803922, 1,
1.323331, -0.4166486, 1.776081, 1, 0, 0.5764706, 1,
1.323758, -0.8774204, 2.384982, 1, 0, 0.5686275, 1,
1.349656, 1.208261, 0.865018, 1, 0, 0.5647059, 1,
1.350175, -1.183203, 3.696006, 1, 0, 0.5568628, 1,
1.352062, -0.2305192, 2.350694, 1, 0, 0.5529412, 1,
1.36483, 1.428999, 0.4491404, 1, 0, 0.5450981, 1,
1.371537, -0.2191684, 1.394292, 1, 0, 0.5411765, 1,
1.378996, -1.813372, 2.808871, 1, 0, 0.5333334, 1,
1.390399, 0.3983113, 0.8785235, 1, 0, 0.5294118, 1,
1.395489, 0.266614, 1.850849, 1, 0, 0.5215687, 1,
1.397551, -0.4667733, 0.1684525, 1, 0, 0.5176471, 1,
1.403072, 0.7623773, 1.881404, 1, 0, 0.509804, 1,
1.416786, -3.317109, 3.517184, 1, 0, 0.5058824, 1,
1.418157, -0.6227526, 2.084062, 1, 0, 0.4980392, 1,
1.432795, -0.1055998, 0.1643467, 1, 0, 0.4901961, 1,
1.433293, -1.656777, 2.865547, 1, 0, 0.4862745, 1,
1.433427, -1.129071, 2.374275, 1, 0, 0.4784314, 1,
1.436819, 0.2799182, 1.044353, 1, 0, 0.4745098, 1,
1.446048, 0.4859079, 2.033886, 1, 0, 0.4666667, 1,
1.446954, -1.627374, 2.718281, 1, 0, 0.4627451, 1,
1.447235, -1.663063, 1.473989, 1, 0, 0.454902, 1,
1.455882, -0.7978503, 1.961476, 1, 0, 0.4509804, 1,
1.458304, -1.435455, 2.584203, 1, 0, 0.4431373, 1,
1.462025, 0.3127096, 1.290501, 1, 0, 0.4392157, 1,
1.47016, 0.617974, 1.94872, 1, 0, 0.4313726, 1,
1.486633, -0.2622716, 1.353873, 1, 0, 0.427451, 1,
1.489619, -0.4696405, 1.216229, 1, 0, 0.4196078, 1,
1.505674, 0.0325407, 1.589262, 1, 0, 0.4156863, 1,
1.515615, -0.6202726, 1.29441, 1, 0, 0.4078431, 1,
1.519083, -1.784425, 1.305387, 1, 0, 0.4039216, 1,
1.531071, -1.188843, 1.664236, 1, 0, 0.3960784, 1,
1.531202, 0.05249269, -0.1331265, 1, 0, 0.3882353, 1,
1.559596, 0.04491085, 3.3798, 1, 0, 0.3843137, 1,
1.56538, 0.6410512, 1.943787, 1, 0, 0.3764706, 1,
1.571961, -1.353494, 1.994877, 1, 0, 0.372549, 1,
1.575812, -1.492706, 1.267331, 1, 0, 0.3647059, 1,
1.583021, -0.6352494, 1.897889, 1, 0, 0.3607843, 1,
1.586366, -0.03704657, 1.030818, 1, 0, 0.3529412, 1,
1.591813, -0.4871965, 0.9284593, 1, 0, 0.3490196, 1,
1.598858, -1.328297, 1.521787, 1, 0, 0.3411765, 1,
1.601975, -0.7047451, 1.937367, 1, 0, 0.3372549, 1,
1.618334, -0.02847614, 1.311114, 1, 0, 0.3294118, 1,
1.64193, 0.01559562, 1.599602, 1, 0, 0.3254902, 1,
1.654429, -0.5607638, 1.497422, 1, 0, 0.3176471, 1,
1.660521, 1.065566, 1.765702, 1, 0, 0.3137255, 1,
1.66572, 0.4139456, -0.2667661, 1, 0, 0.3058824, 1,
1.67046, 0.4226525, 1.104942, 1, 0, 0.2980392, 1,
1.681535, 0.5125517, 2.013101, 1, 0, 0.2941177, 1,
1.688245, 1.812725, -0.01453615, 1, 0, 0.2862745, 1,
1.691068, 0.9173656, 0.9854226, 1, 0, 0.282353, 1,
1.69345, -1.045536, 1.280519, 1, 0, 0.2745098, 1,
1.699832, -2.258109, 3.040068, 1, 0, 0.2705882, 1,
1.705689, 1.825157, 1.426027, 1, 0, 0.2627451, 1,
1.720796, 1.108316, 1.231695, 1, 0, 0.2588235, 1,
1.729383, -0.09686296, -0.05195301, 1, 0, 0.2509804, 1,
1.745393, -0.85282, 2.394651, 1, 0, 0.2470588, 1,
1.74955, 0.4982465, 0.08924893, 1, 0, 0.2392157, 1,
1.760455, 1.318491e-05, 3.0274, 1, 0, 0.2352941, 1,
1.764333, 1.106616, 2.117747, 1, 0, 0.227451, 1,
1.789556, 0.8373071, 0.583227, 1, 0, 0.2235294, 1,
1.795257, 0.3404913, -0.4816829, 1, 0, 0.2156863, 1,
1.818642, 0.5241289, 1.371573, 1, 0, 0.2117647, 1,
1.838904, 0.7191086, 1.272505, 1, 0, 0.2039216, 1,
1.85437, 0.5434091, 1.397683, 1, 0, 0.1960784, 1,
1.873456, 0.1068614, 0.8549917, 1, 0, 0.1921569, 1,
1.877751, 0.3592975, 1.646793, 1, 0, 0.1843137, 1,
1.908737, 0.1044489, 1.704854, 1, 0, 0.1803922, 1,
1.918411, -0.4090023, 0.1983855, 1, 0, 0.172549, 1,
1.923866, 1.198118, 1.028748, 1, 0, 0.1686275, 1,
1.950408, 0.5607197, 0.9078385, 1, 0, 0.1607843, 1,
1.974926, -0.2976727, 2.103222, 1, 0, 0.1568628, 1,
2.036101, -0.6713218, 3.870213, 1, 0, 0.1490196, 1,
2.038343, 0.2297682, 1.314686, 1, 0, 0.145098, 1,
2.041414, -0.7353491, 1.180561, 1, 0, 0.1372549, 1,
2.075057, -0.2691158, 0.5305645, 1, 0, 0.1333333, 1,
2.094959, 0.5784784, 2.24159, 1, 0, 0.1254902, 1,
2.101802, -1.635406, 2.563479, 1, 0, 0.1215686, 1,
2.121637, 0.516484, 1.163264, 1, 0, 0.1137255, 1,
2.150292, 1.346312, -0.4435298, 1, 0, 0.1098039, 1,
2.154782, -0.5317211, 3.370395, 1, 0, 0.1019608, 1,
2.190105, 1.279617, 0.3806567, 1, 0, 0.09411765, 1,
2.199068, -1.176419, 1.180107, 1, 0, 0.09019608, 1,
2.239549, -0.9525412, 1.682201, 1, 0, 0.08235294, 1,
2.265817, -1.658723, 1.326914, 1, 0, 0.07843138, 1,
2.343988, -0.6806912, 1.223473, 1, 0, 0.07058824, 1,
2.355198, 0.8446262, 2.833485, 1, 0, 0.06666667, 1,
2.357674, 1.014232, 0.8708537, 1, 0, 0.05882353, 1,
2.361178, -1.057597, 1.776581, 1, 0, 0.05490196, 1,
2.397317, -1.056356, 2.715216, 1, 0, 0.04705882, 1,
2.40807, -1.572387, 1.583979, 1, 0, 0.04313726, 1,
2.512107, -0.1936637, 2.667701, 1, 0, 0.03529412, 1,
2.525295, 0.02645071, 1.521138, 1, 0, 0.03137255, 1,
2.581074, 1.52366, 1.310295, 1, 0, 0.02352941, 1,
2.622214, -1.033116, 2.307429, 1, 0, 0.01960784, 1,
2.840717, -1.013113, 3.333282, 1, 0, 0.01176471, 1,
2.861958, 0.5711365, 2.683337, 1, 0, 0.007843138, 1
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
-0.01026928, -4.386429, -7.152806, 0, -0.5, 0.5, 0.5,
-0.01026928, -4.386429, -7.152806, 1, -0.5, 0.5, 0.5,
-0.01026928, -4.386429, -7.152806, 1, 1.5, 0.5, 0.5,
-0.01026928, -4.386429, -7.152806, 0, 1.5, 0.5, 0.5
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
-3.856181, -0.162774, -7.152806, 0, -0.5, 0.5, 0.5,
-3.856181, -0.162774, -7.152806, 1, -0.5, 0.5, 0.5,
-3.856181, -0.162774, -7.152806, 1, 1.5, 0.5, 0.5,
-3.856181, -0.162774, -7.152806, 0, 1.5, 0.5, 0.5
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
-3.856181, -4.386429, 0.2156103, 0, -0.5, 0.5, 0.5,
-3.856181, -4.386429, 0.2156103, 1, -0.5, 0.5, 0.5,
-3.856181, -4.386429, 0.2156103, 1, 1.5, 0.5, 0.5,
-3.856181, -4.386429, 0.2156103, 0, 1.5, 0.5, 0.5
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
-2, -3.411739, -5.452403,
2, -3.411739, -5.452403,
-2, -3.411739, -5.452403,
-2, -3.574188, -5.735803,
-1, -3.411739, -5.452403,
-1, -3.574188, -5.735803,
0, -3.411739, -5.452403,
0, -3.574188, -5.735803,
1, -3.411739, -5.452403,
1, -3.574188, -5.735803,
2, -3.411739, -5.452403,
2, -3.574188, -5.735803
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
-2, -3.899084, -6.302605, 0, -0.5, 0.5, 0.5,
-2, -3.899084, -6.302605, 1, -0.5, 0.5, 0.5,
-2, -3.899084, -6.302605, 1, 1.5, 0.5, 0.5,
-2, -3.899084, -6.302605, 0, 1.5, 0.5, 0.5,
-1, -3.899084, -6.302605, 0, -0.5, 0.5, 0.5,
-1, -3.899084, -6.302605, 1, -0.5, 0.5, 0.5,
-1, -3.899084, -6.302605, 1, 1.5, 0.5, 0.5,
-1, -3.899084, -6.302605, 0, 1.5, 0.5, 0.5,
0, -3.899084, -6.302605, 0, -0.5, 0.5, 0.5,
0, -3.899084, -6.302605, 1, -0.5, 0.5, 0.5,
0, -3.899084, -6.302605, 1, 1.5, 0.5, 0.5,
0, -3.899084, -6.302605, 0, 1.5, 0.5, 0.5,
1, -3.899084, -6.302605, 0, -0.5, 0.5, 0.5,
1, -3.899084, -6.302605, 1, -0.5, 0.5, 0.5,
1, -3.899084, -6.302605, 1, 1.5, 0.5, 0.5,
1, -3.899084, -6.302605, 0, 1.5, 0.5, 0.5,
2, -3.899084, -6.302605, 0, -0.5, 0.5, 0.5,
2, -3.899084, -6.302605, 1, -0.5, 0.5, 0.5,
2, -3.899084, -6.302605, 1, 1.5, 0.5, 0.5,
2, -3.899084, -6.302605, 0, 1.5, 0.5, 0.5
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
-2.968663, -3, -5.452403,
-2.968663, 2, -5.452403,
-2.968663, -3, -5.452403,
-3.116583, -3, -5.735803,
-2.968663, -2, -5.452403,
-3.116583, -2, -5.735803,
-2.968663, -1, -5.452403,
-3.116583, -1, -5.735803,
-2.968663, 0, -5.452403,
-3.116583, 0, -5.735803,
-2.968663, 1, -5.452403,
-3.116583, 1, -5.735803,
-2.968663, 2, -5.452403,
-3.116583, 2, -5.735803
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
-3.412422, -3, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, -3, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, -3, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, -3, -6.302605, 0, 1.5, 0.5, 0.5,
-3.412422, -2, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, -2, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, -2, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, -2, -6.302605, 0, 1.5, 0.5, 0.5,
-3.412422, -1, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, -1, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, -1, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, -1, -6.302605, 0, 1.5, 0.5, 0.5,
-3.412422, 0, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, 0, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, 0, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, 0, -6.302605, 0, 1.5, 0.5, 0.5,
-3.412422, 1, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, 1, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, 1, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, 1, -6.302605, 0, 1.5, 0.5, 0.5,
-3.412422, 2, -6.302605, 0, -0.5, 0.5, 0.5,
-3.412422, 2, -6.302605, 1, -0.5, 0.5, 0.5,
-3.412422, 2, -6.302605, 1, 1.5, 0.5, 0.5,
-3.412422, 2, -6.302605, 0, 1.5, 0.5, 0.5
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
-2.968663, -3.411739, -4,
-2.968663, -3.411739, 4,
-2.968663, -3.411739, -4,
-3.116583, -3.574188, -4,
-2.968663, -3.411739, -2,
-3.116583, -3.574188, -2,
-2.968663, -3.411739, 0,
-3.116583, -3.574188, 0,
-2.968663, -3.411739, 2,
-3.116583, -3.574188, 2,
-2.968663, -3.411739, 4,
-3.116583, -3.574188, 4
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
-3.412422, -3.899084, -4, 0, -0.5, 0.5, 0.5,
-3.412422, -3.899084, -4, 1, -0.5, 0.5, 0.5,
-3.412422, -3.899084, -4, 1, 1.5, 0.5, 0.5,
-3.412422, -3.899084, -4, 0, 1.5, 0.5, 0.5,
-3.412422, -3.899084, -2, 0, -0.5, 0.5, 0.5,
-3.412422, -3.899084, -2, 1, -0.5, 0.5, 0.5,
-3.412422, -3.899084, -2, 1, 1.5, 0.5, 0.5,
-3.412422, -3.899084, -2, 0, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 0, 0, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 0, 1, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 0, 1, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 0, 0, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 2, 0, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 2, 1, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 2, 1, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 2, 0, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 4, 0, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 4, 1, -0.5, 0.5, 0.5,
-3.412422, -3.899084, 4, 1, 1.5, 0.5, 0.5,
-3.412422, -3.899084, 4, 0, 1.5, 0.5, 0.5
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
-2.968663, -3.411739, -5.452403,
-2.968663, 3.086191, -5.452403,
-2.968663, -3.411739, 5.883623,
-2.968663, 3.086191, 5.883623,
-2.968663, -3.411739, -5.452403,
-2.968663, -3.411739, 5.883623,
-2.968663, 3.086191, -5.452403,
-2.968663, 3.086191, 5.883623,
-2.968663, -3.411739, -5.452403,
2.948124, -3.411739, -5.452403,
-2.968663, -3.411739, 5.883623,
2.948124, -3.411739, 5.883623,
-2.968663, 3.086191, -5.452403,
2.948124, 3.086191, -5.452403,
-2.968663, 3.086191, 5.883623,
2.948124, 3.086191, 5.883623,
2.948124, -3.411739, -5.452403,
2.948124, 3.086191, -5.452403,
2.948124, -3.411739, 5.883623,
2.948124, 3.086191, 5.883623,
2.948124, -3.411739, -5.452403,
2.948124, -3.411739, 5.883623,
2.948124, 3.086191, -5.452403,
2.948124, 3.086191, 5.883623
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
var radius = 7.659168;
var distance = 34.07651;
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
mvMatrix.translate( 0.01026928, 0.162774, -0.2156103 );
mvMatrix.scale( 1.399618, 1.274443, 0.7305244 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07651);
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
fluazifop-P-butyl<-read.table("fluazifop-P-butyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluazifop-P-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
```

```r
y<-fluazifop-P-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
```

```r
z<-fluazifop-P-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
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
-2.882496, 1.083298, -1.396525, 0, 0, 1, 1, 1,
-2.730519, 0.3809588, -1.575507, 1, 0, 0, 1, 1,
-2.673705, 1.12507, -0.1231363, 1, 0, 0, 1, 1,
-2.597492, -0.1075399, -1.32802, 1, 0, 0, 1, 1,
-2.53194, 1.099683, -0.1418027, 1, 0, 0, 1, 1,
-2.512637, -0.692253, -1.507866, 1, 0, 0, 1, 1,
-2.398658, 1.238838, -2.299408, 0, 0, 0, 1, 1,
-2.395222, 1.248665, -2.949435, 0, 0, 0, 1, 1,
-2.338729, 0.3314594, -1.326176, 0, 0, 0, 1, 1,
-2.312041, -0.2826425, -1.604976, 0, 0, 0, 1, 1,
-2.299407, 1.166879, -1.382047, 0, 0, 0, 1, 1,
-2.271425, -0.309608, -0.725597, 0, 0, 0, 1, 1,
-2.233152, 0.05207661, -3.610893, 0, 0, 0, 1, 1,
-2.220325, 0.6412898, -2.274826, 1, 1, 1, 1, 1,
-2.187432, 0.3954943, -0.7773754, 1, 1, 1, 1, 1,
-2.12269, 0.879254, -2.151014, 1, 1, 1, 1, 1,
-2.120051, 0.2207714, -3.307665, 1, 1, 1, 1, 1,
-2.119963, 1.40881, -1.598334, 1, 1, 1, 1, 1,
-2.037321, -0.5999665, -0.3680768, 1, 1, 1, 1, 1,
-2.023737, 0.1807621, -0.7923504, 1, 1, 1, 1, 1,
-2.023196, -1.382973, -1.834011, 1, 1, 1, 1, 1,
-2.000767, 0.09530552, -1.606027, 1, 1, 1, 1, 1,
-1.978641, 1.109186, -0.3941485, 1, 1, 1, 1, 1,
-1.977405, 1.087197, -0.6148283, 1, 1, 1, 1, 1,
-1.968773, 0.2639467, -1.676267, 1, 1, 1, 1, 1,
-1.957453, 0.7735106, -1.478051, 1, 1, 1, 1, 1,
-1.936353, 1.068671, -2.453599, 1, 1, 1, 1, 1,
-1.934108, 0.262765, -0.5861812, 1, 1, 1, 1, 1,
-1.919928, -0.1817859, -1.15881, 0, 0, 1, 1, 1,
-1.907931, -1.457419, -1.309792, 1, 0, 0, 1, 1,
-1.884453, -1.157718, -1.545335, 1, 0, 0, 1, 1,
-1.847753, -0.6478685, -2.2574, 1, 0, 0, 1, 1,
-1.843303, 0.2717013, -2.004625, 1, 0, 0, 1, 1,
-1.837324, 0.4021212, -2.814955, 1, 0, 0, 1, 1,
-1.835111, -0.5770925, -0.6420074, 0, 0, 0, 1, 1,
-1.82971, -0.7677701, -3.075278, 0, 0, 0, 1, 1,
-1.828844, -0.623068, -3.076823, 0, 0, 0, 1, 1,
-1.822598, 0.8919274, -1.499109, 0, 0, 0, 1, 1,
-1.8207, 0.1996375, -2.951806, 0, 0, 0, 1, 1,
-1.814336, -1.846426, -2.48909, 0, 0, 0, 1, 1,
-1.813681, 0.3630394, -1.462986, 0, 0, 0, 1, 1,
-1.776626, -1.470121, -1.741411, 1, 1, 1, 1, 1,
-1.775006, 0.536033, -1.69414, 1, 1, 1, 1, 1,
-1.762343, 0.2141694, -3.032551, 1, 1, 1, 1, 1,
-1.758365, 1.214353, -0.2064169, 1, 1, 1, 1, 1,
-1.750292, -0.9948155, -2.846714, 1, 1, 1, 1, 1,
-1.749766, -0.9935311, -1.921378, 1, 1, 1, 1, 1,
-1.735636, -0.4970958, -3.138431, 1, 1, 1, 1, 1,
-1.702526, -1.296309, -2.521175, 1, 1, 1, 1, 1,
-1.696877, 0.0225044, 0.0377641, 1, 1, 1, 1, 1,
-1.691455, 0.1285613, -2.677803, 1, 1, 1, 1, 1,
-1.637926, -0.7147647, -1.460072, 1, 1, 1, 1, 1,
-1.629871, -1.745169, -2.110938, 1, 1, 1, 1, 1,
-1.626076, -0.4765954, 0.2993478, 1, 1, 1, 1, 1,
-1.611436, 0.8826082, -0.7922146, 1, 1, 1, 1, 1,
-1.609691, -0.2036547, -1.554656, 1, 1, 1, 1, 1,
-1.603403, -1.231999, -1.499373, 0, 0, 1, 1, 1,
-1.594992, 0.006743713, -3.289886, 1, 0, 0, 1, 1,
-1.594748, 0.7942458, -0.6580007, 1, 0, 0, 1, 1,
-1.58838, 1.300306, -1.534742, 1, 0, 0, 1, 1,
-1.550335, -0.4464797, -2.972717, 1, 0, 0, 1, 1,
-1.549714, 0.9805878, -0.2617038, 1, 0, 0, 1, 1,
-1.5321, -0.3342066, -1.912773, 0, 0, 0, 1, 1,
-1.531352, 1.428452, -0.3859675, 0, 0, 0, 1, 1,
-1.529241, 0.6509523, -2.250371, 0, 0, 0, 1, 1,
-1.517653, -0.2054885, -2.222824, 0, 0, 0, 1, 1,
-1.500242, 0.4524178, -0.8287038, 0, 0, 0, 1, 1,
-1.499822, -0.288569, -0.8471561, 0, 0, 0, 1, 1,
-1.485476, 0.5534431, -0.9109751, 0, 0, 0, 1, 1,
-1.484123, -0.4226132, -2.774977, 1, 1, 1, 1, 1,
-1.47909, -1.674973, -4.39781, 1, 1, 1, 1, 1,
-1.471538, 0.5128195, -1.372303, 1, 1, 1, 1, 1,
-1.446336, 1.3673, -2.637264, 1, 1, 1, 1, 1,
-1.433798, -0.3233527, -1.40461, 1, 1, 1, 1, 1,
-1.432927, 0.001190998, -1.899197, 1, 1, 1, 1, 1,
-1.431366, -2.462625, -2.895551, 1, 1, 1, 1, 1,
-1.418911, -2.459914, -3.32064, 1, 1, 1, 1, 1,
-1.416561, -0.4364269, -0.5466498, 1, 1, 1, 1, 1,
-1.410689, -0.2563097, -0.6425971, 1, 1, 1, 1, 1,
-1.400937, -1.4661, -3.295316, 1, 1, 1, 1, 1,
-1.398378, -0.6062337, -3.136092, 1, 1, 1, 1, 1,
-1.395406, -0.4121526, -2.79673, 1, 1, 1, 1, 1,
-1.390216, -0.06126179, -1.683749, 1, 1, 1, 1, 1,
-1.386371, -0.6893398, 0.8111034, 1, 1, 1, 1, 1,
-1.382294, -0.902439, -1.624934, 0, 0, 1, 1, 1,
-1.369203, 0.5812726, -1.655294, 1, 0, 0, 1, 1,
-1.364913, -1.738287, -3.219208, 1, 0, 0, 1, 1,
-1.357029, -0.5399144, -0.8403006, 1, 0, 0, 1, 1,
-1.351627, -0.130568, -3.232201, 1, 0, 0, 1, 1,
-1.335339, 0.9368554, -1.201612, 1, 0, 0, 1, 1,
-1.329047, -0.3897088, -1.500573, 0, 0, 0, 1, 1,
-1.328015, -0.5892734, -3.12224, 0, 0, 0, 1, 1,
-1.32754, -0.6070544, -2.62848, 0, 0, 0, 1, 1,
-1.309936, -1.922198, -4.63558, 0, 0, 0, 1, 1,
-1.298552, -0.1067587, -0.4377123, 0, 0, 0, 1, 1,
-1.288225, -0.226786, -3.513961, 0, 0, 0, 1, 1,
-1.285102, -0.988508, -2.955119, 0, 0, 0, 1, 1,
-1.278065, -0.9356991, -2.473166, 1, 1, 1, 1, 1,
-1.275661, -0.7255676, -2.158744, 1, 1, 1, 1, 1,
-1.267457, -0.4017384, -2.171635, 1, 1, 1, 1, 1,
-1.266043, -0.7058988, -2.391967, 1, 1, 1, 1, 1,
-1.264155, 0.8473797, -1.043651, 1, 1, 1, 1, 1,
-1.262088, -0.7146441, -2.882959, 1, 1, 1, 1, 1,
-1.261526, -0.4886994, -0.3874669, 1, 1, 1, 1, 1,
-1.252783, -0.9004272, -1.961311, 1, 1, 1, 1, 1,
-1.246137, 1.872785, -0.8683033, 1, 1, 1, 1, 1,
-1.236806, 0.5703791, -1.793159, 1, 1, 1, 1, 1,
-1.228293, -1.720333, -2.919483, 1, 1, 1, 1, 1,
-1.2204, -0.8016676, -3.382772, 1, 1, 1, 1, 1,
-1.214237, -0.2686107, -1.186039, 1, 1, 1, 1, 1,
-1.209687, -0.265514, -1.39191, 1, 1, 1, 1, 1,
-1.207275, -0.1084921, -1.884576, 1, 1, 1, 1, 1,
-1.20491, 0.8966421, 0.05657705, 0, 0, 1, 1, 1,
-1.20029, -0.3204288, -2.816304, 1, 0, 0, 1, 1,
-1.19087, 1.12479, 0.03768469, 1, 0, 0, 1, 1,
-1.189216, -1.759317, -2.622869, 1, 0, 0, 1, 1,
-1.186678, 1.431256, -1.937901, 1, 0, 0, 1, 1,
-1.186538, -3.077633, -2.936519, 1, 0, 0, 1, 1,
-1.185307, 0.3303365, -0.07871954, 0, 0, 0, 1, 1,
-1.171734, 0.6375065, -0.4306914, 0, 0, 0, 1, 1,
-1.169737, 0.5622031, 0.2616622, 0, 0, 0, 1, 1,
-1.164826, -1.199958, -3.643455, 0, 0, 0, 1, 1,
-1.161018, 1.243935, -0.8652601, 0, 0, 0, 1, 1,
-1.146473, 0.4618269, -2.172784, 0, 0, 0, 1, 1,
-1.142909, 1.888802, -1.324937, 0, 0, 0, 1, 1,
-1.140085, -0.7947678, -1.51377, 1, 1, 1, 1, 1,
-1.139, -0.04999843, -0.406908, 1, 1, 1, 1, 1,
-1.124933, 0.5498909, -0.5804372, 1, 1, 1, 1, 1,
-1.120571, 1.041346, -0.4230058, 1, 1, 1, 1, 1,
-1.120052, 0.6348832, -1.579658, 1, 1, 1, 1, 1,
-1.119687, 1.35417, 0.6399369, 1, 1, 1, 1, 1,
-1.110884, 1.088891, -1.588372, 1, 1, 1, 1, 1,
-1.109089, 1.310363, -2.463434, 1, 1, 1, 1, 1,
-1.107867, -1.407702, -2.513689, 1, 1, 1, 1, 1,
-1.104952, 1.200867, -0.1767737, 1, 1, 1, 1, 1,
-1.100482, 1.159191, 0.6332362, 1, 1, 1, 1, 1,
-1.092171, 1.203637, 0.3036575, 1, 1, 1, 1, 1,
-1.091328, 1.420596, -0.4916768, 1, 1, 1, 1, 1,
-1.090379, 0.4082635, -1.764434, 1, 1, 1, 1, 1,
-1.080266, 2.008767, -0.04806792, 1, 1, 1, 1, 1,
-1.079326, 0.5696024, -1.197255, 0, 0, 1, 1, 1,
-1.079047, -0.6311843, -2.175848, 1, 0, 0, 1, 1,
-1.078404, 0.2748753, -1.060399, 1, 0, 0, 1, 1,
-1.070175, 0.3216132, -1.197109, 1, 0, 0, 1, 1,
-1.065453, -1.063949, -1.769541, 1, 0, 0, 1, 1,
-1.053475, 0.5766599, -1.841316, 1, 0, 0, 1, 1,
-1.034931, 1.219445, 0.3598651, 0, 0, 0, 1, 1,
-1.033712, -0.04044219, -2.211169, 0, 0, 0, 1, 1,
-1.031525, -0.1782471, -3.567461, 0, 0, 0, 1, 1,
-1.031295, 0.8512278, -2.21381, 0, 0, 0, 1, 1,
-1.02784, -0.3617924, -0.8941864, 0, 0, 0, 1, 1,
-1.024826, 0.5453719, -0.2908619, 0, 0, 0, 1, 1,
-1.022365, -2.074473, 0.7333161, 0, 0, 0, 1, 1,
-1.017466, 0.37465, 0.2203063, 1, 1, 1, 1, 1,
-1.008471, -0.8382761, -3.572004, 1, 1, 1, 1, 1,
-1.008237, -0.9690849, -2.539723, 1, 1, 1, 1, 1,
-0.9983231, 0.9265099, -1.045316, 1, 1, 1, 1, 1,
-0.9942952, -1.47208, -1.715236, 1, 1, 1, 1, 1,
-0.9942786, -0.5696908, -1.032302, 1, 1, 1, 1, 1,
-0.9936205, -0.7200396, -2.575109, 1, 1, 1, 1, 1,
-0.9908491, 1.247726, -2.283481, 1, 1, 1, 1, 1,
-0.9874436, 0.4896253, -2.708838, 1, 1, 1, 1, 1,
-0.9844364, 0.7535062, 0.6965532, 1, 1, 1, 1, 1,
-0.9820481, -2.295447, -2.389702, 1, 1, 1, 1, 1,
-0.9766347, 0.663482, -2.424376, 1, 1, 1, 1, 1,
-0.9698092, -0.5347112, -3.155045, 1, 1, 1, 1, 1,
-0.9619248, -0.1674469, -2.29427, 1, 1, 1, 1, 1,
-0.9570114, 0.3585087, -0.9081013, 1, 1, 1, 1, 1,
-0.9547853, 1.550753, -0.7545537, 0, 0, 1, 1, 1,
-0.9502488, -0.7206655, -1.310331, 1, 0, 0, 1, 1,
-0.942812, -0.9786652, -2.787248, 1, 0, 0, 1, 1,
-0.938331, -0.1510307, -3.001626, 1, 0, 0, 1, 1,
-0.9323376, -0.7889685, -2.915829, 1, 0, 0, 1, 1,
-0.9320015, -0.2040175, -1.578722, 1, 0, 0, 1, 1,
-0.9287806, 0.5324045, -0.9989814, 0, 0, 0, 1, 1,
-0.9265124, -0.7402927, -3.11661, 0, 0, 0, 1, 1,
-0.9230998, 0.2016924, -0.940493, 0, 0, 0, 1, 1,
-0.9201599, -0.4008403, -3.726533, 0, 0, 0, 1, 1,
-0.9096887, -0.09507425, -1.208579, 0, 0, 0, 1, 1,
-0.9091399, -0.7132406, -1.788364, 0, 0, 0, 1, 1,
-0.9048169, -0.03266858, -1.342844, 0, 0, 0, 1, 1,
-0.8999584, -0.2652096, -2.396527, 1, 1, 1, 1, 1,
-0.8988287, 0.7344298, -0.6102929, 1, 1, 1, 1, 1,
-0.8846828, -1.073158, -2.563697, 1, 1, 1, 1, 1,
-0.884131, -0.4575451, -1.363812, 1, 1, 1, 1, 1,
-0.8827668, -0.2882766, -0.3457025, 1, 1, 1, 1, 1,
-0.8816173, -0.6281325, -1.629121, 1, 1, 1, 1, 1,
-0.8806886, 1.048791, -1.566513, 1, 1, 1, 1, 1,
-0.8765255, -0.1203725, -1.647792, 1, 1, 1, 1, 1,
-0.8763721, 0.09333253, -1.975991, 1, 1, 1, 1, 1,
-0.8739499, -0.4370093, -2.969576, 1, 1, 1, 1, 1,
-0.8693928, -0.638329, -3.79831, 1, 1, 1, 1, 1,
-0.8689549, -1.675083, -4.229216, 1, 1, 1, 1, 1,
-0.8558384, -1.793616, -1.228963, 1, 1, 1, 1, 1,
-0.854802, -1.813361, -0.5945255, 1, 1, 1, 1, 1,
-0.8545287, -0.4721342, -3.806649, 1, 1, 1, 1, 1,
-0.8522858, 1.004959, -0.5898571, 0, 0, 1, 1, 1,
-0.8463941, 0.6124024, -1.781217, 1, 0, 0, 1, 1,
-0.835805, 0.8018982, -2.219433, 1, 0, 0, 1, 1,
-0.8356784, 0.547536, -1.098222, 1, 0, 0, 1, 1,
-0.8314142, -1.696335, -3.024382, 1, 0, 0, 1, 1,
-0.8304885, 0.3576494, -1.596066, 1, 0, 0, 1, 1,
-0.8302088, -0.1644028, -1.842864, 0, 0, 0, 1, 1,
-0.8298348, 0.2667193, 0.2917381, 0, 0, 0, 1, 1,
-0.8241835, -0.7226424, -1.472222, 0, 0, 0, 1, 1,
-0.8159453, -0.6853688, -3.005371, 0, 0, 0, 1, 1,
-0.8139722, 0.3771844, -2.04444, 0, 0, 0, 1, 1,
-0.812833, 1.299985, 0.195986, 0, 0, 0, 1, 1,
-0.8110409, 0.08683488, -0.5448406, 0, 0, 0, 1, 1,
-0.8066671, -0.2417218, -1.568177, 1, 1, 1, 1, 1,
-0.806151, -1.672651, -4.495182, 1, 1, 1, 1, 1,
-0.8026482, 0.5711119, -0.5189595, 1, 1, 1, 1, 1,
-0.7935481, 0.01518873, -1.925019, 1, 1, 1, 1, 1,
-0.7922332, -0.6673074, -1.084405, 1, 1, 1, 1, 1,
-0.792122, 1.31541, 0.4438187, 1, 1, 1, 1, 1,
-0.7909727, 0.2803477, 0.0381134, 1, 1, 1, 1, 1,
-0.7885749, -0.1410542, -2.100463, 1, 1, 1, 1, 1,
-0.7862972, 0.9208696, -2.0822, 1, 1, 1, 1, 1,
-0.7730073, 0.2695018, -0.7369971, 1, 1, 1, 1, 1,
-0.7686383, -1.632595, -2.261632, 1, 1, 1, 1, 1,
-0.7686344, 0.9420666, -0.8427872, 1, 1, 1, 1, 1,
-0.7585402, 0.6147071, -0.5782111, 1, 1, 1, 1, 1,
-0.755492, -0.7832811, -1.835482, 1, 1, 1, 1, 1,
-0.7461007, -0.1446774, -1.695172, 1, 1, 1, 1, 1,
-0.7458223, 0.07436491, -2.050872, 0, 0, 1, 1, 1,
-0.7426273, -1.329804, -1.456903, 1, 0, 0, 1, 1,
-0.7393284, -1.154326, -2.435037, 1, 0, 0, 1, 1,
-0.7382991, 0.5012291, 0.8537984, 1, 0, 0, 1, 1,
-0.7358308, 0.01376715, -2.913896, 1, 0, 0, 1, 1,
-0.7349566, 1.632745, -0.4677433, 1, 0, 0, 1, 1,
-0.7184298, 0.4529203, 0.2713183, 0, 0, 0, 1, 1,
-0.7156928, -0.06706064, -0.4199609, 0, 0, 0, 1, 1,
-0.713962, 0.1314146, -2.83946, 0, 0, 0, 1, 1,
-0.7078066, -0.001309411, -3.39554, 0, 0, 0, 1, 1,
-0.7075477, 0.9441277, -0.4488699, 0, 0, 0, 1, 1,
-0.7070844, -0.2391606, -0.421899, 0, 0, 0, 1, 1,
-0.7064872, -0.3618545, -2.982074, 0, 0, 0, 1, 1,
-0.7004531, 0.8270894, -0.7988889, 1, 1, 1, 1, 1,
-0.6981536, 1.090527, -1.45854, 1, 1, 1, 1, 1,
-0.6938431, 0.8784113, -1.348688, 1, 1, 1, 1, 1,
-0.6935145, 0.8517472, -0.3682959, 1, 1, 1, 1, 1,
-0.6930605, 0.8110281, -1.965247, 1, 1, 1, 1, 1,
-0.6862404, -0.3981371, -2.631062, 1, 1, 1, 1, 1,
-0.6853191, 1.42958, -0.4560535, 1, 1, 1, 1, 1,
-0.6830616, -0.2704877, -2.114486, 1, 1, 1, 1, 1,
-0.6798113, -0.2580637, -1.881347, 1, 1, 1, 1, 1,
-0.6788525, 0.1028695, -2.215093, 1, 1, 1, 1, 1,
-0.6715807, -0.2305393, -2.651134, 1, 1, 1, 1, 1,
-0.6683077, 0.3676352, -1.410265, 1, 1, 1, 1, 1,
-0.6647227, -1.871452, -2.717893, 1, 1, 1, 1, 1,
-0.6639308, -0.1021197, -2.107306, 1, 1, 1, 1, 1,
-0.6615506, -2.00699, -3.100092, 1, 1, 1, 1, 1,
-0.6603429, 0.02148019, -2.973682, 0, 0, 1, 1, 1,
-0.658675, -0.5576737, -1.579004, 1, 0, 0, 1, 1,
-0.6582918, 0.9816487, 0.6208354, 1, 0, 0, 1, 1,
-0.6575664, 2.246148, 0.5206653, 1, 0, 0, 1, 1,
-0.654505, 1.613758, -0.1376737, 1, 0, 0, 1, 1,
-0.6540247, -1.18316, -3.401574, 1, 0, 0, 1, 1,
-0.6472428, -0.1438537, -2.487101, 0, 0, 0, 1, 1,
-0.646793, -0.3656661, -2.329394, 0, 0, 0, 1, 1,
-0.639577, -1.832724, -2.550573, 0, 0, 0, 1, 1,
-0.6376953, 0.7895899, -0.9864552, 0, 0, 0, 1, 1,
-0.6352704, -0.4512665, -1.819197, 0, 0, 0, 1, 1,
-0.6311415, -0.1513121, -1.199832, 0, 0, 0, 1, 1,
-0.6274289, 0.8947552, 0.7060035, 0, 0, 0, 1, 1,
-0.6250125, -0.278941, -1.483705, 1, 1, 1, 1, 1,
-0.6202214, -0.4045603, -1.509764, 1, 1, 1, 1, 1,
-0.6172013, 0.3292176, 0.2168735, 1, 1, 1, 1, 1,
-0.6143649, -1.100086, -0.7317913, 1, 1, 1, 1, 1,
-0.6112351, 1.299476, -1.677948, 1, 1, 1, 1, 1,
-0.6111837, 0.2425282, -0.4301419, 1, 1, 1, 1, 1,
-0.6088325, -0.3796311, 0.09980786, 1, 1, 1, 1, 1,
-0.6064997, 0.767656, -0.1142295, 1, 1, 1, 1, 1,
-0.6038837, 0.1040407, -0.1320121, 1, 1, 1, 1, 1,
-0.6011306, 1.020071, -2.98912, 1, 1, 1, 1, 1,
-0.5972977, 0.4629864, -0.1152365, 1, 1, 1, 1, 1,
-0.5953382, 2.991561, 0.9019111, 1, 1, 1, 1, 1,
-0.5926512, -0.2156655, -2.011689, 1, 1, 1, 1, 1,
-0.5889305, 0.4414553, -1.222913, 1, 1, 1, 1, 1,
-0.5887629, 2.074516, 0.4963694, 1, 1, 1, 1, 1,
-0.5869736, 0.6475883, -1.335013, 0, 0, 1, 1, 1,
-0.5798979, -2.64023, -5.287315, 1, 0, 0, 1, 1,
-0.5774342, 0.5530995, -1.935278, 1, 0, 0, 1, 1,
-0.5768564, -0.3358322, -4.260581, 1, 0, 0, 1, 1,
-0.5727173, 1.363199, 0.1460989, 1, 0, 0, 1, 1,
-0.5715352, 0.2383692, -3.284969, 1, 0, 0, 1, 1,
-0.570952, 0.9403097, -0.1926841, 0, 0, 0, 1, 1,
-0.5611865, -0.7320477, -3.700441, 0, 0, 0, 1, 1,
-0.5552478, 0.5003428, -2.233742, 0, 0, 0, 1, 1,
-0.5541701, -1.289392, -3.184727, 0, 0, 0, 1, 1,
-0.5495896, 0.1705122, -1.104177, 0, 0, 0, 1, 1,
-0.5473204, -1.24248, -2.387139, 0, 0, 0, 1, 1,
-0.5462017, 0.6756642, -1.107785, 0, 0, 0, 1, 1,
-0.5423933, 1.001827, 0.04089617, 1, 1, 1, 1, 1,
-0.5423238, -1.407737, -0.3565659, 1, 1, 1, 1, 1,
-0.5388761, 2.442024, -0.315643, 1, 1, 1, 1, 1,
-0.5377155, 0.9621083, -2.693338, 1, 1, 1, 1, 1,
-0.5373366, 0.6776701, -2.275405, 1, 1, 1, 1, 1,
-0.537195, 0.2708296, 0.446778, 1, 1, 1, 1, 1,
-0.5305072, 0.7237201, -1.807738, 1, 1, 1, 1, 1,
-0.5299844, 2.668839, 0.3547923, 1, 1, 1, 1, 1,
-0.529312, 1.223414, -0.9120744, 1, 1, 1, 1, 1,
-0.5223709, -0.9757752, -2.64741, 1, 1, 1, 1, 1,
-0.5215796, -1.782959, -2.038659, 1, 1, 1, 1, 1,
-0.5196827, 0.03274924, -0.7494139, 1, 1, 1, 1, 1,
-0.5192369, -0.02910213, -2.062469, 1, 1, 1, 1, 1,
-0.5172266, -1.346225, -3.607896, 1, 1, 1, 1, 1,
-0.5167002, 0.3782026, -0.3084759, 1, 1, 1, 1, 1,
-0.5154367, -0.148947, -2.079791, 0, 0, 1, 1, 1,
-0.5132327, -1.931869, -2.34296, 1, 0, 0, 1, 1,
-0.5055935, -1.776076, -4.621867, 1, 0, 0, 1, 1,
-0.4979031, 0.03262876, -2.409567, 1, 0, 0, 1, 1,
-0.4977002, 0.2617828, -1.562063, 1, 0, 0, 1, 1,
-0.4916445, 0.4679415, 0.407616, 1, 0, 0, 1, 1,
-0.4894942, -0.1699618, 0.2151097, 0, 0, 0, 1, 1,
-0.4870585, -1.201283, -2.648316, 0, 0, 0, 1, 1,
-0.4870176, 2.028259, -0.5056326, 0, 0, 0, 1, 1,
-0.4868055, -1.36964, -4.440697, 0, 0, 0, 1, 1,
-0.4746797, -1.309582, -2.337847, 0, 0, 0, 1, 1,
-0.4723051, -0.2319886, -2.213678, 0, 0, 0, 1, 1,
-0.4683375, 1.837022, 1.83039, 0, 0, 0, 1, 1,
-0.4669434, 0.3746183, -1.93171, 1, 1, 1, 1, 1,
-0.4626199, -1.405914, -1.57162, 1, 1, 1, 1, 1,
-0.4526213, -0.9248164, -1.972794, 1, 1, 1, 1, 1,
-0.4506885, -0.4962435, -2.674377, 1, 1, 1, 1, 1,
-0.4503583, -1.5031, -3.390816, 1, 1, 1, 1, 1,
-0.4362857, -0.893617, -3.363269, 1, 1, 1, 1, 1,
-0.4359808, -0.8898749, -1.162705, 1, 1, 1, 1, 1,
-0.4328238, -1.038968, -2.698856, 1, 1, 1, 1, 1,
-0.4312654, 0.9362104, 0.1024539, 1, 1, 1, 1, 1,
-0.4273556, 2.390238, 0.1665604, 1, 1, 1, 1, 1,
-0.4202204, -0.8884337, -3.20173, 1, 1, 1, 1, 1,
-0.4179384, 0.8912853, 1.198139, 1, 1, 1, 1, 1,
-0.4137604, 0.251382, -1.891031, 1, 1, 1, 1, 1,
-0.4108516, 0.0997391, -1.384472, 1, 1, 1, 1, 1,
-0.407903, 0.8648745, -0.4547705, 1, 1, 1, 1, 1,
-0.3982488, 0.607003, 0.1978289, 0, 0, 1, 1, 1,
-0.3940739, -0.4688363, -1.44042, 1, 0, 0, 1, 1,
-0.3863769, -0.3564413, -1.688712, 1, 0, 0, 1, 1,
-0.3858457, -0.04374351, -1.011667, 1, 0, 0, 1, 1,
-0.3836835, -0.6188667, -1.917566, 1, 0, 0, 1, 1,
-0.3797201, 1.088981, -1.041474, 1, 0, 0, 1, 1,
-0.3786798, 0.9726148, -0.1816266, 0, 0, 0, 1, 1,
-0.3784777, -0.4269355, -3.169969, 0, 0, 0, 1, 1,
-0.3663265, 0.2492606, -1.685646, 0, 0, 0, 1, 1,
-0.3654493, -0.8034652, -4.331554, 0, 0, 0, 1, 1,
-0.3649504, -1.291455, -3.320261, 0, 0, 0, 1, 1,
-0.3632588, 0.8063607, 0.7494549, 0, 0, 0, 1, 1,
-0.3624541, 1.278809, 1.587126, 0, 0, 0, 1, 1,
-0.3584434, 0.680895, -1.304579, 1, 1, 1, 1, 1,
-0.3510175, -1.789715, -2.502723, 1, 1, 1, 1, 1,
-0.3419825, -0.5985772, -3.461854, 1, 1, 1, 1, 1,
-0.3411419, 1.352052, 0.2012905, 1, 1, 1, 1, 1,
-0.3323387, 0.1954588, -1.329324, 1, 1, 1, 1, 1,
-0.330943, -0.5951882, -1.914164, 1, 1, 1, 1, 1,
-0.3291986, -1.28823, -3.737857, 1, 1, 1, 1, 1,
-0.3285643, 2.067614, -0.7612709, 1, 1, 1, 1, 1,
-0.3275493, 1.257935, -0.41575, 1, 1, 1, 1, 1,
-0.3274407, -0.752909, -2.092721, 1, 1, 1, 1, 1,
-0.3248609, -0.7171343, -1.731639, 1, 1, 1, 1, 1,
-0.3218814, -0.8960205, -2.987992, 1, 1, 1, 1, 1,
-0.3183552, 1.264447, -0.09302523, 1, 1, 1, 1, 1,
-0.3171621, 0.04978442, -2.263386, 1, 1, 1, 1, 1,
-0.317152, 1.077609, -0.3695948, 1, 1, 1, 1, 1,
-0.3157937, -0.1134894, -1.326219, 0, 0, 1, 1, 1,
-0.3089487, 0.07906497, -0.4111325, 1, 0, 0, 1, 1,
-0.3080269, -0.1570978, -2.446624, 1, 0, 0, 1, 1,
-0.3023273, 0.04292415, -1.369438, 1, 0, 0, 1, 1,
-0.3019347, 0.9898221, 0.4862119, 1, 0, 0, 1, 1,
-0.3011362, 0.3549795, -1.178824, 1, 0, 0, 1, 1,
-0.300197, 0.01807321, -2.245795, 0, 0, 0, 1, 1,
-0.2951091, -0.4471171, -2.871629, 0, 0, 0, 1, 1,
-0.2946011, -0.6038854, -1.427109, 0, 0, 0, 1, 1,
-0.2945036, -1.073754, -2.829188, 0, 0, 0, 1, 1,
-0.2944763, 1.26353, 0.7122343, 0, 0, 0, 1, 1,
-0.291871, -1.065872, -1.104131, 0, 0, 0, 1, 1,
-0.289735, -0.4961482, -2.333526, 0, 0, 0, 1, 1,
-0.2867347, 0.205176, -0.391263, 1, 1, 1, 1, 1,
-0.2823048, 1.10703, 0.2701663, 1, 1, 1, 1, 1,
-0.2812568, -2.083652, -2.998883, 1, 1, 1, 1, 1,
-0.2768271, -0.2265147, -4.42152, 1, 1, 1, 1, 1,
-0.2761309, -0.5008562, -3.286349, 1, 1, 1, 1, 1,
-0.2716215, 1.181074, -0.5496899, 1, 1, 1, 1, 1,
-0.2699388, 0.05761088, -0.7368721, 1, 1, 1, 1, 1,
-0.2689463, -0.336708, -2.934065, 1, 1, 1, 1, 1,
-0.2679732, 0.8073754, -1.103828, 1, 1, 1, 1, 1,
-0.2673305, 1.309239, 0.8690627, 1, 1, 1, 1, 1,
-0.2672255, 0.104653, -0.432899, 1, 1, 1, 1, 1,
-0.2647502, 0.6031886, -1.613035, 1, 1, 1, 1, 1,
-0.2626235, 0.7367926, -0.5753554, 1, 1, 1, 1, 1,
-0.2614681, -1.469468, -2.666008, 1, 1, 1, 1, 1,
-0.2593117, -0.5528208, -1.867675, 1, 1, 1, 1, 1,
-0.2584854, -0.9033906, -3.282991, 0, 0, 1, 1, 1,
-0.2501242, -1.377519, -3.650173, 1, 0, 0, 1, 1,
-0.2500839, 0.2673854, -1.016257, 1, 0, 0, 1, 1,
-0.2491846, 0.6444497, 1.553969, 1, 0, 0, 1, 1,
-0.245791, -0.4264518, -2.075764, 1, 0, 0, 1, 1,
-0.2436667, -0.4732125, -1.731167, 1, 0, 0, 1, 1,
-0.2381641, -1.632878, -3.559098, 0, 0, 0, 1, 1,
-0.2361931, -0.06662499, -1.920044, 0, 0, 0, 1, 1,
-0.2350481, 2.188034, 0.7884751, 0, 0, 0, 1, 1,
-0.2347339, 0.3716062, -1.630001, 0, 0, 0, 1, 1,
-0.2344588, -0.1057432, -3.848791, 0, 0, 0, 1, 1,
-0.23242, 0.1737473, -1.087023, 0, 0, 0, 1, 1,
-0.2314585, -0.6820598, -3.56012, 0, 0, 0, 1, 1,
-0.224727, -0.4803808, -0.9633194, 1, 1, 1, 1, 1,
-0.2245788, -1.540792, -3.209547, 1, 1, 1, 1, 1,
-0.2245715, 0.03647973, 0.1213616, 1, 1, 1, 1, 1,
-0.2236212, -0.2405762, -2.077884, 1, 1, 1, 1, 1,
-0.2207531, 0.9678891, -0.4767575, 1, 1, 1, 1, 1,
-0.2201229, -1.048104, -3.888217, 1, 1, 1, 1, 1,
-0.2191136, 0.3401442, -0.01556032, 1, 1, 1, 1, 1,
-0.215309, -0.3390845, -2.767047, 1, 1, 1, 1, 1,
-0.2140716, -0.943653, -2.16076, 1, 1, 1, 1, 1,
-0.2107311, 0.05282098, -1.049197, 1, 1, 1, 1, 1,
-0.2081906, -0.05281888, -1.015488, 1, 1, 1, 1, 1,
-0.2070875, -0.1248434, -4.718715, 1, 1, 1, 1, 1,
-0.2062735, -2.20014, -4.038288, 1, 1, 1, 1, 1,
-0.2053559, -0.6997535, -2.930709, 1, 1, 1, 1, 1,
-0.2012787, -1.607551, -3.821648, 1, 1, 1, 1, 1,
-0.1994886, -0.7282368, -1.368325, 0, 0, 1, 1, 1,
-0.1971559, 0.6100457, -1.009889, 1, 0, 0, 1, 1,
-0.194388, -0.1035238, -1.915606, 1, 0, 0, 1, 1,
-0.1919993, -0.9850639, -2.607376, 1, 0, 0, 1, 1,
-0.1907435, 0.1858465, -1.706049, 1, 0, 0, 1, 1,
-0.1891032, 0.2348212, -1.098128, 1, 0, 0, 1, 1,
-0.1884667, -0.1759435, -3.746135, 0, 0, 0, 1, 1,
-0.1857373, -0.07795714, -1.267603, 0, 0, 0, 1, 1,
-0.1836162, -1.016175, -2.807229, 0, 0, 0, 1, 1,
-0.183132, 1.246369, -0.9627628, 0, 0, 0, 1, 1,
-0.1755326, -1.678556, -3.07065, 0, 0, 0, 1, 1,
-0.1743167, 0.1240789, -1.184396, 0, 0, 0, 1, 1,
-0.1730883, 0.1973096, 2.388108, 0, 0, 0, 1, 1,
-0.1611561, -0.636539, -1.754261, 1, 1, 1, 1, 1,
-0.1556876, -1.383531, -3.828476, 1, 1, 1, 1, 1,
-0.1529954, 0.6489558, 0.4029973, 1, 1, 1, 1, 1,
-0.1509656, 0.7362351, 1.064542, 1, 1, 1, 1, 1,
-0.1496054, -0.03400533, -3.112197, 1, 1, 1, 1, 1,
-0.1449945, -1.887445, -4.087775, 1, 1, 1, 1, 1,
-0.1447972, 0.4157473, -0.8807071, 1, 1, 1, 1, 1,
-0.1413814, -0.1702916, -2.717, 1, 1, 1, 1, 1,
-0.1372209, 0.2577954, -0.4362706, 1, 1, 1, 1, 1,
-0.1335959, -0.1372712, -1.05589, 1, 1, 1, 1, 1,
-0.1314286, 0.1961448, 1.639251, 1, 1, 1, 1, 1,
-0.1286228, -1.253805, -3.138627, 1, 1, 1, 1, 1,
-0.1280863, 1.541453, -0.5591582, 1, 1, 1, 1, 1,
-0.1270272, -0.05638538, -2.348702, 1, 1, 1, 1, 1,
-0.1193453, -0.7099782, -1.493856, 1, 1, 1, 1, 1,
-0.1114114, 1.43814, 0.2215932, 0, 0, 1, 1, 1,
-0.1111988, -1.802356, -5.01214, 1, 0, 0, 1, 1,
-0.1103756, 0.6110142, 0.5837797, 1, 0, 0, 1, 1,
-0.1091995, 0.9191307, -0.06318484, 1, 0, 0, 1, 1,
-0.1081279, 0.867404, -1.133543, 1, 0, 0, 1, 1,
-0.1049394, 0.4695293, -0.1406191, 1, 0, 0, 1, 1,
-0.1015369, 0.795449, -0.2038645, 0, 0, 0, 1, 1,
-0.09793109, 0.3788888, -0.2697643, 0, 0, 0, 1, 1,
-0.09421044, 0.8726606, 0.3033502, 0, 0, 0, 1, 1,
-0.09052311, -0.4734557, -2.945615, 0, 0, 0, 1, 1,
-0.08970062, -1.876361, -2.371907, 0, 0, 0, 1, 1,
-0.08912227, -0.4732377, -3.35648, 0, 0, 0, 1, 1,
-0.08634791, -1.484917, -1.603552, 0, 0, 0, 1, 1,
-0.08250253, -0.6959506, -1.902769, 1, 1, 1, 1, 1,
-0.07968937, 1.365124, 0.9821694, 1, 1, 1, 1, 1,
-0.07693174, 0.9032665, -0.3507861, 1, 1, 1, 1, 1,
-0.07452727, -0.7419902, -3.802412, 1, 1, 1, 1, 1,
-0.0728262, 1.758394, 0.5623185, 1, 1, 1, 1, 1,
-0.07093128, 0.3488644, -1.171807, 1, 1, 1, 1, 1,
-0.07005412, -0.3967194, -1.768736, 1, 1, 1, 1, 1,
-0.06890481, -0.5527666, -3.044735, 1, 1, 1, 1, 1,
-0.06691444, 0.4242697, -1.171339, 1, 1, 1, 1, 1,
-0.06581834, 0.9817468, 0.8979385, 1, 1, 1, 1, 1,
-0.06491909, 0.278022, -0.08718738, 1, 1, 1, 1, 1,
-0.06053593, 0.6221169, -0.329586, 1, 1, 1, 1, 1,
-0.0583843, -0.9184035, -3.673182, 1, 1, 1, 1, 1,
-0.05762674, 0.7908986, 0.8991339, 1, 1, 1, 1, 1,
-0.05742969, -0.612321, -1.667901, 1, 1, 1, 1, 1,
-0.04845095, -1.341041, -1.663682, 0, 0, 1, 1, 1,
-0.04703785, 0.8441316, -0.4118305, 1, 0, 0, 1, 1,
-0.04478399, -0.995874, -2.890429, 1, 0, 0, 1, 1,
-0.0386738, -0.5862267, -0.9291789, 1, 0, 0, 1, 1,
-0.03559844, -0.6120792, -2.059484, 1, 0, 0, 1, 1,
-0.03409293, 1.151108, -0.263025, 1, 0, 0, 1, 1,
-0.02986691, 1.416232, 1.223067, 0, 0, 0, 1, 1,
-0.02903889, 0.5715753, -0.04868232, 0, 0, 0, 1, 1,
-0.02867434, 1.245211, -0.1013532, 0, 0, 0, 1, 1,
-0.02724055, -1.739916, -3.262863, 0, 0, 0, 1, 1,
-0.02695979, 0.8676811, -0.3253243, 0, 0, 0, 1, 1,
-0.02679202, 1.420009, -2.206143, 0, 0, 0, 1, 1,
-0.01971141, -0.4077945, -4.320294, 0, 0, 0, 1, 1,
-0.01758747, 1.385253, -0.7132322, 1, 1, 1, 1, 1,
-0.0154374, -0.282644, -1.317198, 1, 1, 1, 1, 1,
-0.01341402, 1.170777, 0.8792379, 1, 1, 1, 1, 1,
-0.01279896, -0.6341884, -3.590149, 1, 1, 1, 1, 1,
-0.0108401, -0.2779438, -2.875401, 1, 1, 1, 1, 1,
-0.01038378, -0.7559234, -2.705297, 1, 1, 1, 1, 1,
-0.006123785, -0.6594999, -2.980038, 1, 1, 1, 1, 1,
-0.004789728, 1.345953, 0.08243888, 1, 1, 1, 1, 1,
-0.003678472, 0.5065665, 0.7125673, 1, 1, 1, 1, 1,
-0.002492414, -0.647177, -1.855063, 1, 1, 1, 1, 1,
0.001336662, 0.3927838, -0.3863011, 1, 1, 1, 1, 1,
0.006734965, 0.858655, 1.352693, 1, 1, 1, 1, 1,
0.007982844, 0.202406, -0.1565061, 1, 1, 1, 1, 1,
0.01031378, -0.3765134, 3.380656, 1, 1, 1, 1, 1,
0.01123576, -1.555552, 3.851474, 1, 1, 1, 1, 1,
0.01201293, -0.3659597, 0.9815407, 0, 0, 1, 1, 1,
0.01251999, -0.4312238, 4.24063, 1, 0, 0, 1, 1,
0.01405396, 0.318626, -1.070859, 1, 0, 0, 1, 1,
0.01693406, 0.6071137, 2.114119, 1, 0, 0, 1, 1,
0.01792228, 0.8196295, -1.033592, 1, 0, 0, 1, 1,
0.01917402, 0.5339396, -0.9952, 1, 0, 0, 1, 1,
0.020288, -1.373456, 5.55835, 0, 0, 0, 1, 1,
0.02158615, -0.6289541, 3.408773, 0, 0, 0, 1, 1,
0.02181264, 0.01021594, 0.6271557, 0, 0, 0, 1, 1,
0.02208429, -0.8759325, 2.801378, 0, 0, 0, 1, 1,
0.02864075, 0.115772, 1.49043, 0, 0, 0, 1, 1,
0.03134036, -0.1020728, 3.510512, 0, 0, 0, 1, 1,
0.0317916, -0.843827, 4.122091, 0, 0, 0, 1, 1,
0.03449911, -0.5297468, 4.281385, 1, 1, 1, 1, 1,
0.03455905, -0.1235593, 2.518869, 1, 1, 1, 1, 1,
0.03608351, 0.2549134, -1.231162, 1, 1, 1, 1, 1,
0.04034767, -0.6914364, 2.573301, 1, 1, 1, 1, 1,
0.04113999, 0.7093932, -1.308386, 1, 1, 1, 1, 1,
0.04165807, -1.267035, 4.213858, 1, 1, 1, 1, 1,
0.04199975, -1.39768, 2.502783, 1, 1, 1, 1, 1,
0.04619216, -0.05821987, 3.34222, 1, 1, 1, 1, 1,
0.04791213, -0.4579354, 5.718535, 1, 1, 1, 1, 1,
0.04966569, -0.9875166, 3.139799, 1, 1, 1, 1, 1,
0.05161167, 0.06993879, -0.6578317, 1, 1, 1, 1, 1,
0.05276613, -0.3746311, 3.230306, 1, 1, 1, 1, 1,
0.05417716, 1.764013, -0.6963722, 1, 1, 1, 1, 1,
0.05775902, 0.2807629, 1.015763, 1, 1, 1, 1, 1,
0.06171773, -0.06649893, 3.125797, 1, 1, 1, 1, 1,
0.06309602, 0.5000815, 0.4459353, 0, 0, 1, 1, 1,
0.06497532, 0.264834, 0.1651901, 1, 0, 0, 1, 1,
0.06578949, -0.47242, 3.204426, 1, 0, 0, 1, 1,
0.07570021, -0.44251, 3.180007, 1, 0, 0, 1, 1,
0.07763623, 1.41323, 0.6946187, 1, 0, 0, 1, 1,
0.07785083, -0.4282672, -0.2241439, 1, 0, 0, 1, 1,
0.07869009, 2.050951, -0.109833, 0, 0, 0, 1, 1,
0.0793573, -1.181374, 3.388425, 0, 0, 0, 1, 1,
0.0836757, 0.6503922, 0.04270062, 0, 0, 0, 1, 1,
0.08525499, 0.2407189, -0.2868642, 0, 0, 0, 1, 1,
0.0872931, 1.311161, -0.060373, 0, 0, 0, 1, 1,
0.08730733, 0.5049534, -0.02431601, 0, 0, 0, 1, 1,
0.08964106, 0.340809, 0.1450229, 0, 0, 0, 1, 1,
0.09022279, 0.7753802, 0.02413264, 1, 1, 1, 1, 1,
0.09455124, 0.8505537, -1.528318, 1, 1, 1, 1, 1,
0.1000918, -1.36747, 2.028225, 1, 1, 1, 1, 1,
0.108396, 1.013529, 0.5799428, 1, 1, 1, 1, 1,
0.1086607, -0.7850096, 2.91027, 1, 1, 1, 1, 1,
0.109419, -0.03373121, 4.005778, 1, 1, 1, 1, 1,
0.1122384, -1.051385, 4.308953, 1, 1, 1, 1, 1,
0.1128214, -0.08572225, 2.527076, 1, 1, 1, 1, 1,
0.1129473, -0.376394, 1.31894, 1, 1, 1, 1, 1,
0.1148936, -0.09191924, 3.587362, 1, 1, 1, 1, 1,
0.1153653, 0.9892266, 0.9225499, 1, 1, 1, 1, 1,
0.1232178, 0.2171158, 1.607103, 1, 1, 1, 1, 1,
0.1279937, 0.5306565, 1.114026, 1, 1, 1, 1, 1,
0.1302887, 2.080043, 1.098259, 1, 1, 1, 1, 1,
0.1311201, -0.3479982, 2.144329, 1, 1, 1, 1, 1,
0.1319276, -1.37168, 1.885607, 0, 0, 1, 1, 1,
0.1323756, 1.392425, 0.1837799, 1, 0, 0, 1, 1,
0.1346617, 1.07704, 2.218706, 1, 0, 0, 1, 1,
0.1356328, -1.477931, 3.161834, 1, 0, 0, 1, 1,
0.1380826, 0.7757677, -0.178683, 1, 0, 0, 1, 1,
0.1382424, -0.7619269, 5.044348, 1, 0, 0, 1, 1,
0.1476578, -0.9506772, 1.281646, 0, 0, 0, 1, 1,
0.1478812, -0.1474424, 3.23799, 0, 0, 0, 1, 1,
0.1544256, 0.495119, 0.4904352, 0, 0, 0, 1, 1,
0.1546378, 0.3600031, 0.3663988, 0, 0, 0, 1, 1,
0.1575628, 0.8567606, 0.8136473, 0, 0, 0, 1, 1,
0.1609252, 2.455215, 0.7306413, 0, 0, 0, 1, 1,
0.1627203, 0.7876779, -1.632876, 0, 0, 0, 1, 1,
0.1641147, 0.7528796, 0.7448993, 1, 1, 1, 1, 1,
0.1645188, -0.226048, 2.216708, 1, 1, 1, 1, 1,
0.1709745, -0.9161006, 1.677914, 1, 1, 1, 1, 1,
0.1811451, 0.4320906, -2.303126, 1, 1, 1, 1, 1,
0.1822039, 0.1793211, 1.535634, 1, 1, 1, 1, 1,
0.1843226, -0.234777, 1.790988, 1, 1, 1, 1, 1,
0.1980499, 0.2006641, 0.8914697, 1, 1, 1, 1, 1,
0.2024379, -0.3441173, 4.032751, 1, 1, 1, 1, 1,
0.2079508, 0.5293288, 0.9003693, 1, 1, 1, 1, 1,
0.2097934, -0.9996213, 2.929617, 1, 1, 1, 1, 1,
0.2127259, 0.3889353, 1.273536, 1, 1, 1, 1, 1,
0.214204, -0.4477855, 0.9734754, 1, 1, 1, 1, 1,
0.2143147, 1.240474, 0.8970659, 1, 1, 1, 1, 1,
0.218437, -0.4020128, 0.8918038, 1, 1, 1, 1, 1,
0.221813, 0.7640255, 0.449523, 1, 1, 1, 1, 1,
0.2235386, -0.6362528, 2.306318, 0, 0, 1, 1, 1,
0.2235689, 1.241219, -1.022574, 1, 0, 0, 1, 1,
0.2293601, -2.754236, 4.233978, 1, 0, 0, 1, 1,
0.2294478, -0.3196638, 1.434298, 1, 0, 0, 1, 1,
0.2320954, -0.4419414, 2.390597, 1, 0, 0, 1, 1,
0.2330523, -0.06136772, 0.8179707, 1, 0, 0, 1, 1,
0.2352783, -0.9103922, 1.572757, 0, 0, 0, 1, 1,
0.2366058, 2.268573, 0.5465854, 0, 0, 0, 1, 1,
0.2382929, 0.150438, 1.374982, 0, 0, 0, 1, 1,
0.2390245, -0.2441482, 1.940604, 0, 0, 0, 1, 1,
0.2391612, -0.2411552, 1.955642, 0, 0, 0, 1, 1,
0.239673, -1.161738, 2.985498, 0, 0, 0, 1, 1,
0.2400558, -0.586911, 2.326025, 0, 0, 0, 1, 1,
0.2403287, 0.9408649, -1.35501, 1, 1, 1, 1, 1,
0.2438886, -1.565517, 3.233661, 1, 1, 1, 1, 1,
0.2440598, 0.1328838, 0.5436429, 1, 1, 1, 1, 1,
0.2485015, 0.3877779, -0.1490272, 1, 1, 1, 1, 1,
0.2489262, -1.232294, 2.125071, 1, 1, 1, 1, 1,
0.2544343, -0.2194413, 1.695885, 1, 1, 1, 1, 1,
0.2590783, 0.9302798, 0.4768655, 1, 1, 1, 1, 1,
0.2607012, -0.4143773, 3.696497, 1, 1, 1, 1, 1,
0.261712, 0.1619125, -0.06437778, 1, 1, 1, 1, 1,
0.2627373, 0.09430574, 0.9886781, 1, 1, 1, 1, 1,
0.2660241, 1.414026, 0.9600876, 1, 1, 1, 1, 1,
0.2669154, 1.773638, 1.874875, 1, 1, 1, 1, 1,
0.2740524, 0.4450785, 1.601415, 1, 1, 1, 1, 1,
0.2774711, -0.4006538, 3.276969, 1, 1, 1, 1, 1,
0.282315, 0.7022761, -1.296264, 1, 1, 1, 1, 1,
0.2827913, 2.730719, -1.673538, 0, 0, 1, 1, 1,
0.2835473, -0.6687041, 4.167683, 1, 0, 0, 1, 1,
0.2836071, 0.7868543, 2.075717, 1, 0, 0, 1, 1,
0.2868766, 1.179787, 0.7319323, 1, 0, 0, 1, 1,
0.2964605, 1.829131, -2.593497, 1, 0, 0, 1, 1,
0.2969109, -0.7901755, 3.050364, 1, 0, 0, 1, 1,
0.3009341, 0.8910278, -0.5710033, 0, 0, 0, 1, 1,
0.3026823, 0.3416073, 1.517731, 0, 0, 0, 1, 1,
0.3060172, -1.296575, 2.495919, 0, 0, 0, 1, 1,
0.3067886, 0.9786263, 1.439169, 0, 0, 0, 1, 1,
0.3070253, 0.9773638, 0.772751, 0, 0, 0, 1, 1,
0.3089359, 1.406777, -1.044982, 0, 0, 0, 1, 1,
0.3114422, -1.583925, 5.716792, 0, 0, 0, 1, 1,
0.3306344, -0.7946692, 4.717739, 1, 1, 1, 1, 1,
0.3440074, 0.3249106, -0.1039708, 1, 1, 1, 1, 1,
0.3471253, 1.34659, -0.3308098, 1, 1, 1, 1, 1,
0.3476136, -0.6537421, 3.010568, 1, 1, 1, 1, 1,
0.3610591, 2.430274, -0.8599858, 1, 1, 1, 1, 1,
0.361987, 0.1099058, 0.2241431, 1, 1, 1, 1, 1,
0.3625702, -0.3256114, 2.742612, 1, 1, 1, 1, 1,
0.3657217, 0.4435902, 0.9354488, 1, 1, 1, 1, 1,
0.3660684, 0.1051714, 0.5440311, 1, 1, 1, 1, 1,
0.3707733, 0.4251383, -0.7436166, 1, 1, 1, 1, 1,
0.3709126, 0.002400863, 1.711628, 1, 1, 1, 1, 1,
0.3755978, 0.04721458, 1.633525, 1, 1, 1, 1, 1,
0.3765958, -1.273819, 3.525947, 1, 1, 1, 1, 1,
0.3818059, -0.3654512, 3.384798, 1, 1, 1, 1, 1,
0.3832235, -0.2837274, 2.539151, 1, 1, 1, 1, 1,
0.3837995, 0.7444972, 1.194963, 0, 0, 1, 1, 1,
0.3844225, -0.4689478, 1.593337, 1, 0, 0, 1, 1,
0.3844336, -1.352696, 1.897305, 1, 0, 0, 1, 1,
0.3853711, 0.2147046, 3.170771, 1, 0, 0, 1, 1,
0.38629, 0.5039577, 0.3801171, 1, 0, 0, 1, 1,
0.3874262, -1.022709, 4.04159, 1, 0, 0, 1, 1,
0.3880647, 1.67998, 1.366052, 0, 0, 0, 1, 1,
0.3917117, -0.2535852, 0.1896957, 0, 0, 0, 1, 1,
0.3926351, -0.6750052, 4.479304, 0, 0, 0, 1, 1,
0.3998934, 0.3131597, 2.754446, 0, 0, 0, 1, 1,
0.4000711, 1.100361, 0.1607661, 0, 0, 0, 1, 1,
0.4001249, -0.3793177, 2.196135, 0, 0, 0, 1, 1,
0.405542, 0.01535461, 3.238896, 0, 0, 0, 1, 1,
0.4144143, 0.8122358, -0.591549, 1, 1, 1, 1, 1,
0.4153623, 0.4568721, -0.7994974, 1, 1, 1, 1, 1,
0.4175254, 1.040066, 0.7651402, 1, 1, 1, 1, 1,
0.4187967, -0.5213175, 2.105204, 1, 1, 1, 1, 1,
0.4238651, 1.096947, -0.5058882, 1, 1, 1, 1, 1,
0.4322632, -2.631549, 1.263633, 1, 1, 1, 1, 1,
0.4355798, -0.3137396, 3.558053, 1, 1, 1, 1, 1,
0.4408517, -0.3742691, 3.452698, 1, 1, 1, 1, 1,
0.4457725, -1.662943, 2.918359, 1, 1, 1, 1, 1,
0.453152, 0.234555, 2.783817, 1, 1, 1, 1, 1,
0.4549285, -0.9458529, 4.386079, 1, 1, 1, 1, 1,
0.4557124, 0.3640673, 2.699356, 1, 1, 1, 1, 1,
0.4562104, 0.7529225, 3.020713, 1, 1, 1, 1, 1,
0.4582221, -1.551834, 3.376654, 1, 1, 1, 1, 1,
0.4605483, 0.196137, -0.6599494, 1, 1, 1, 1, 1,
0.4606567, -0.8100474, 4.77921, 0, 0, 1, 1, 1,
0.4618604, 1.572055, 0.7060651, 1, 0, 0, 1, 1,
0.4621949, 1.065922, 0.6213749, 1, 0, 0, 1, 1,
0.4630581, -0.06915183, 3.558002, 1, 0, 0, 1, 1,
0.463483, 0.1154475, -0.3657022, 1, 0, 0, 1, 1,
0.4643025, -1.189841, 3.794437, 1, 0, 0, 1, 1,
0.4643523, 0.5445498, -1.393462, 0, 0, 0, 1, 1,
0.4676309, -0.8485234, 4.36378, 0, 0, 0, 1, 1,
0.4689938, 0.3398624, -0.7980748, 0, 0, 0, 1, 1,
0.4702139, -0.6248224, 2.636408, 0, 0, 0, 1, 1,
0.4705599, 0.4587017, 0.3172095, 0, 0, 0, 1, 1,
0.471752, -0.9782382, 3.161029, 0, 0, 0, 1, 1,
0.4741263, -0.5736732, 3.471514, 0, 0, 0, 1, 1,
0.4769216, -0.2109072, 1.807855, 1, 1, 1, 1, 1,
0.4803646, 0.379145, 0.3598752, 1, 1, 1, 1, 1,
0.4908839, -0.7588339, 2.299419, 1, 1, 1, 1, 1,
0.4940666, -0.6433686, 1.954786, 1, 1, 1, 1, 1,
0.4941963, 0.4926241, 1.022544, 1, 1, 1, 1, 1,
0.4946008, 0.3423589, 1.508963, 1, 1, 1, 1, 1,
0.4951358, 0.03327341, 1.335638, 1, 1, 1, 1, 1,
0.4960972, -1.751219, 0.8753848, 1, 1, 1, 1, 1,
0.4965498, -0.2325879, 2.860846, 1, 1, 1, 1, 1,
0.49788, -0.2431588, 2.799036, 1, 1, 1, 1, 1,
0.49804, -0.1678314, 2.279958, 1, 1, 1, 1, 1,
0.5049245, -1.476587, 2.87974, 1, 1, 1, 1, 1,
0.5061975, 0.8467669, 1.849304, 1, 1, 1, 1, 1,
0.5126097, -0.6847975, 1.429989, 1, 1, 1, 1, 1,
0.5130368, 0.914681, 0.3659644, 1, 1, 1, 1, 1,
0.5141302, 1.288703, 1.119652, 0, 0, 1, 1, 1,
0.5266871, -2.320294, 3.441759, 1, 0, 0, 1, 1,
0.5302489, 0.1312529, 1.828165, 1, 0, 0, 1, 1,
0.5306677, -1.11299, 2.881205, 1, 0, 0, 1, 1,
0.5318736, -0.4639117, 2.605098, 1, 0, 0, 1, 1,
0.5339589, -0.1206687, 0.6410201, 1, 0, 0, 1, 1,
0.5363709, -0.4066441, 1.285172, 0, 0, 0, 1, 1,
0.5366794, -0.1920106, 2.595942, 0, 0, 0, 1, 1,
0.5381284, -0.727361, 2.962132, 0, 0, 0, 1, 1,
0.5419698, -0.751928, 1.244952, 0, 0, 0, 1, 1,
0.5430537, 1.577935, -0.1451822, 0, 0, 0, 1, 1,
0.555164, -1.070164, 2.631779, 0, 0, 0, 1, 1,
0.5584617, -0.4610276, 3.137769, 0, 0, 0, 1, 1,
0.5612833, -0.5812441, 1.754693, 1, 1, 1, 1, 1,
0.5620397, 0.759126, -0.1817248, 1, 1, 1, 1, 1,
0.5659443, -1.113727, 1.873166, 1, 1, 1, 1, 1,
0.5677533, -1.320956, 1.901482, 1, 1, 1, 1, 1,
0.5719547, 0.4521087, -0.185056, 1, 1, 1, 1, 1,
0.5727274, -0.8582102, 2.21171, 1, 1, 1, 1, 1,
0.5761448, -0.7844521, 1.443861, 1, 1, 1, 1, 1,
0.579654, 0.8011209, 0.04104709, 1, 1, 1, 1, 1,
0.580071, 1.378218, 0.4378497, 1, 1, 1, 1, 1,
0.583457, 0.61006, 1.709526, 1, 1, 1, 1, 1,
0.5851168, 0.9411437, 1.862664, 1, 1, 1, 1, 1,
0.5870792, -0.340141, 2.337399, 1, 1, 1, 1, 1,
0.5901366, 1.044543, -1.095907, 1, 1, 1, 1, 1,
0.5966765, 0.4130949, 0.2261579, 1, 1, 1, 1, 1,
0.5978035, -0.6481355, 3.280859, 1, 1, 1, 1, 1,
0.6017318, 2.141933, 1.527348, 0, 0, 1, 1, 1,
0.6064957, 0.02587463, 1.745028, 1, 0, 0, 1, 1,
0.609984, -0.6216219, 2.260214, 1, 0, 0, 1, 1,
0.6176108, -0.2437094, 2.072684, 1, 0, 0, 1, 1,
0.6213829, 0.7163385, 0.7120129, 1, 0, 0, 1, 1,
0.6229911, -0.8821028, 2.281425, 1, 0, 0, 1, 1,
0.6248669, 0.2978572, 0.6417867, 0, 0, 0, 1, 1,
0.6301773, -0.08930857, 1.774177, 0, 0, 0, 1, 1,
0.6350378, -0.03488613, 2.355513, 0, 0, 0, 1, 1,
0.6364437, 1.759447, -0.6994962, 0, 0, 0, 1, 1,
0.6488399, 0.9437991, 0.6908183, 0, 0, 0, 1, 1,
0.6556327, 0.8253721, 1.643907, 0, 0, 0, 1, 1,
0.6580127, 0.4985794, 0.7838445, 0, 0, 0, 1, 1,
0.6635645, -0.5524269, 2.804168, 1, 1, 1, 1, 1,
0.6728743, 1.462545, 0.7704563, 1, 1, 1, 1, 1,
0.6742234, 0.1166282, 3.184422, 1, 1, 1, 1, 1,
0.6755042, 1.615706, -0.6338731, 1, 1, 1, 1, 1,
0.6788377, 1.609369, 0.5182676, 1, 1, 1, 1, 1,
0.6857954, -0.8270531, 1.713995, 1, 1, 1, 1, 1,
0.6891617, -1.125987, 2.102609, 1, 1, 1, 1, 1,
0.7009995, 0.2428564, 0.2593131, 1, 1, 1, 1, 1,
0.7126016, 0.02139776, 1.868469, 1, 1, 1, 1, 1,
0.7134218, -1.073864, 1.370423, 1, 1, 1, 1, 1,
0.7163545, 0.5957025, 2.428367, 1, 1, 1, 1, 1,
0.7166634, 1.075238, -0.2870619, 1, 1, 1, 1, 1,
0.7179126, -0.4854812, 2.999071, 1, 1, 1, 1, 1,
0.7220529, 0.2547989, 2.558977, 1, 1, 1, 1, 1,
0.722508, 0.2815584, 0.389266, 1, 1, 1, 1, 1,
0.7295423, 0.2571944, -0.4028358, 0, 0, 1, 1, 1,
0.7328306, -0.1936379, 3.005058, 1, 0, 0, 1, 1,
0.7354087, -0.7336312, 2.994071, 1, 0, 0, 1, 1,
0.7414618, -1.200498, 3.656712, 1, 0, 0, 1, 1,
0.74433, -0.05580399, 2.644985, 1, 0, 0, 1, 1,
0.7469729, 2.484922, -2.14121, 1, 0, 0, 1, 1,
0.7473673, 0.302929, 1.247347, 0, 0, 0, 1, 1,
0.7496508, 0.3126804, -0.128154, 0, 0, 0, 1, 1,
0.75051, 0.8302354, 0.5800167, 0, 0, 0, 1, 1,
0.7512707, 0.6793966, 1.172472, 0, 0, 0, 1, 1,
0.7545094, 0.8365996, -0.2128207, 0, 0, 0, 1, 1,
0.7637898, 0.3448056, 1.243948, 0, 0, 0, 1, 1,
0.7651847, 0.3022756, 1.022806, 0, 0, 0, 1, 1,
0.7687675, 0.09629779, 1.103556, 1, 1, 1, 1, 1,
0.772844, -0.119665, 0.620182, 1, 1, 1, 1, 1,
0.775308, -0.860388, 3.782026, 1, 1, 1, 1, 1,
0.7780911, 0.4324352, 0.3733532, 1, 1, 1, 1, 1,
0.7894871, -0.08058422, 1.039671, 1, 1, 1, 1, 1,
0.792409, -0.316047, 1.001214, 1, 1, 1, 1, 1,
0.7943289, 0.1899156, 1.091138, 1, 1, 1, 1, 1,
0.7948727, -1.798102, 2.638293, 1, 1, 1, 1, 1,
0.795658, -0.9785358, 0.4364822, 1, 1, 1, 1, 1,
0.8009889, -0.148837, 0.3123381, 1, 1, 1, 1, 1,
0.8010607, -1.290386, 1.709234, 1, 1, 1, 1, 1,
0.8021488, -0.2160808, 1.045371, 1, 1, 1, 1, 1,
0.8052824, 0.7715331, 1.83795, 1, 1, 1, 1, 1,
0.819444, -2.657232, 1.625034, 1, 1, 1, 1, 1,
0.8204783, -0.4253028, 2.008787, 1, 1, 1, 1, 1,
0.8222662, 0.7174315, -0.05804761, 0, 0, 1, 1, 1,
0.8262841, -1.061715, 3.896667, 1, 0, 0, 1, 1,
0.8263231, 0.1592017, 0.4464801, 1, 0, 0, 1, 1,
0.8291733, 1.726951, 0.7869723, 1, 0, 0, 1, 1,
0.8300917, -0.3161272, 1.987035, 1, 0, 0, 1, 1,
0.8304306, -1.13262, 3.708876, 1, 0, 0, 1, 1,
0.8312152, 1.601814, -0.2093353, 0, 0, 0, 1, 1,
0.8337491, 0.4932453, 1.002174, 0, 0, 0, 1, 1,
0.8434435, 1.068991, -1.107856, 0, 0, 0, 1, 1,
0.8510883, 0.9997283, -0.5696048, 0, 0, 0, 1, 1,
0.8553894, 0.5964628, 1.263719, 0, 0, 0, 1, 1,
0.8593018, 1.838109, 0.2984782, 0, 0, 0, 1, 1,
0.86001, -0.1410708, 0.7491455, 0, 0, 0, 1, 1,
0.8677759, 1.96023, 1.223099, 1, 1, 1, 1, 1,
0.872812, 0.1820597, 0.6612459, 1, 1, 1, 1, 1,
0.8744206, 1.874934, 1.477932, 1, 1, 1, 1, 1,
0.8748047, -0.7660633, 2.98257, 1, 1, 1, 1, 1,
0.8795199, 0.7274287, -0.7637753, 1, 1, 1, 1, 1,
0.8815129, -0.1572065, 3.746588, 1, 1, 1, 1, 1,
0.8819599, -0.3330763, 1.275737, 1, 1, 1, 1, 1,
0.8827164, 1.605457, -0.1144804, 1, 1, 1, 1, 1,
0.8834817, -0.1457976, 1.197305, 1, 1, 1, 1, 1,
0.8862934, 0.4748091, -0.2015505, 1, 1, 1, 1, 1,
0.8865709, -0.3209079, 1.232507, 1, 1, 1, 1, 1,
0.893196, 0.963272, 0.1103187, 1, 1, 1, 1, 1,
0.8969017, 1.280539, 0.3063503, 1, 1, 1, 1, 1,
0.9006355, 2.170848, 1.858188, 1, 1, 1, 1, 1,
0.9011068, 1.045644, 0.06387052, 1, 1, 1, 1, 1,
0.9081032, 0.6870793, 2.43052, 0, 0, 1, 1, 1,
0.9131471, -1.012344, 1.034416, 1, 0, 0, 1, 1,
0.9166746, -0.5421736, 2.005576, 1, 0, 0, 1, 1,
0.921459, 0.7536368, 0.5771196, 1, 0, 0, 1, 1,
0.9225003, 1.329131, 0.8140876, 1, 0, 0, 1, 1,
0.9285659, -0.8510829, 3.382187, 1, 0, 0, 1, 1,
0.9318674, -0.4173234, 2.395966, 0, 0, 0, 1, 1,
0.9333904, -0.7200009, 3.745812, 0, 0, 0, 1, 1,
0.9338906, 0.2731796, 1.339232, 0, 0, 0, 1, 1,
0.9351981, 0.7276215, 1.80622, 0, 0, 0, 1, 1,
0.9384962, -0.8060625, 1.574394, 0, 0, 0, 1, 1,
0.9433453, 0.4103973, 0.9914247, 0, 0, 0, 1, 1,
0.9467196, 0.1467255, -1.331395, 0, 0, 0, 1, 1,
0.9487129, -1.073091, 2.522222, 1, 1, 1, 1, 1,
0.9508739, 0.8000756, 0.2454066, 1, 1, 1, 1, 1,
0.9533167, -1.697228, 2.269382, 1, 1, 1, 1, 1,
0.9533623, -0.3851562, 1.297439, 1, 1, 1, 1, 1,
0.9578672, 1.502472, 1.917294, 1, 1, 1, 1, 1,
0.9609845, -0.3433556, 1.183709, 1, 1, 1, 1, 1,
0.9615049, -1.18518, -0.1120407, 1, 1, 1, 1, 1,
0.9659113, 0.5410433, -1.098938, 1, 1, 1, 1, 1,
0.9742454, 0.5053629, 2.704881, 1, 1, 1, 1, 1,
0.9746922, 0.1071401, 1.058015, 1, 1, 1, 1, 1,
0.9783733, 0.06554335, 1.089673, 1, 1, 1, 1, 1,
0.9798039, 0.1400593, 0.5273889, 1, 1, 1, 1, 1,
0.9803577, -0.4041456, 2.674628, 1, 1, 1, 1, 1,
0.9814383, 1.050864, 2.098271, 1, 1, 1, 1, 1,
0.9837577, 2.24226, -1.163921, 1, 1, 1, 1, 1,
0.9894177, 0.6984128, 1.311532, 0, 0, 1, 1, 1,
0.9899256, -1.305157, 3.126555, 1, 0, 0, 1, 1,
0.9900056, -2.099049, 2.954353, 1, 0, 0, 1, 1,
0.9918105, 0.8443446, 0.8753996, 1, 0, 0, 1, 1,
1.012447, -0.549131, 1.686564, 1, 0, 0, 1, 1,
1.013466, -0.9780393, 3.371965, 1, 0, 0, 1, 1,
1.023106, -1.376421, 1.266203, 0, 0, 0, 1, 1,
1.024528, 0.07286076, 2.684442, 0, 0, 0, 1, 1,
1.054187, -0.1930235, 3.150946, 0, 0, 0, 1, 1,
1.062156, 0.3370867, -0.4647207, 0, 0, 0, 1, 1,
1.064115, 0.2420227, 0.7968159, 0, 0, 0, 1, 1,
1.070251, -1.659409, 2.732538, 0, 0, 0, 1, 1,
1.070461, -0.855254, 1.37162, 0, 0, 0, 1, 1,
1.074834, 0.2334335, 1.271626, 1, 1, 1, 1, 1,
1.091429, 1.32141, 0.08395322, 1, 1, 1, 1, 1,
1.092976, -0.1003363, 0.8502358, 1, 1, 1, 1, 1,
1.093585, -0.3455096, -1.036875, 1, 1, 1, 1, 1,
1.097063, -0.2370846, 1.574168, 1, 1, 1, 1, 1,
1.09708, 0.1429502, 2.027798, 1, 1, 1, 1, 1,
1.105544, 0.6249624, 2.327692, 1, 1, 1, 1, 1,
1.106247, 0.2348583, 0.1361471, 1, 1, 1, 1, 1,
1.109935, -1.101149, 1.581778, 1, 1, 1, 1, 1,
1.118861, 1.619938, -0.988355, 1, 1, 1, 1, 1,
1.11984, -0.03080024, 2.574928, 1, 1, 1, 1, 1,
1.122236, -0.2863332, 2.108194, 1, 1, 1, 1, 1,
1.122738, 0.1617198, 1.757695, 1, 1, 1, 1, 1,
1.124051, -1.329076, 4.034971, 1, 1, 1, 1, 1,
1.127188, -1.22036, 3.262924, 1, 1, 1, 1, 1,
1.129546, 1.016769, 0.8901595, 0, 0, 1, 1, 1,
1.135972, 0.4515959, 1.302448, 1, 0, 0, 1, 1,
1.138891, 0.9051297, 1.185336, 1, 0, 0, 1, 1,
1.14076, -1.294719, 3.315263, 1, 0, 0, 1, 1,
1.145212, 0.4785069, 0.967728, 1, 0, 0, 1, 1,
1.14591, -0.8788688, 2.961806, 1, 0, 0, 1, 1,
1.146384, 0.5239819, 2.231943, 0, 0, 0, 1, 1,
1.163107, 0.647522, 1.201413, 0, 0, 0, 1, 1,
1.183699, -0.5893715, 1.891715, 0, 0, 0, 1, 1,
1.188132, -0.1681586, 2.175164, 0, 0, 0, 1, 1,
1.190556, 1.006941, 0.8883137, 0, 0, 0, 1, 1,
1.190688, 1.3853, -0.3008712, 0, 0, 0, 1, 1,
1.19737, -1.092424, 1.367, 0, 0, 0, 1, 1,
1.201267, 0.148101, 2.351982, 1, 1, 1, 1, 1,
1.211426, 1.241873, -0.180535, 1, 1, 1, 1, 1,
1.213122, -0.05010569, 1.355399, 1, 1, 1, 1, 1,
1.22121, -0.5061904, 3.184386, 1, 1, 1, 1, 1,
1.225977, 0.6241839, 0.3735638, 1, 1, 1, 1, 1,
1.233933, 1.286429, 0.3831742, 1, 1, 1, 1, 1,
1.249182, 0.1001706, 2.794694, 1, 1, 1, 1, 1,
1.25254, -0.6207881, 1.183025, 1, 1, 1, 1, 1,
1.2528, -0.9198933, 1.305611, 1, 1, 1, 1, 1,
1.25332, -0.6556138, 1.736154, 1, 1, 1, 1, 1,
1.262552, 1.535758, 0.9319458, 1, 1, 1, 1, 1,
1.270464, 0.6629373, 1.704402, 1, 1, 1, 1, 1,
1.280307, 0.1655319, 1.995322, 1, 1, 1, 1, 1,
1.286567, 2.08498, 1.094069, 1, 1, 1, 1, 1,
1.287161, 0.1762128, 0.4192018, 1, 1, 1, 1, 1,
1.292964, 0.5159774, 1.876807, 0, 0, 1, 1, 1,
1.295703, 1.343987, 0.1892243, 1, 0, 0, 1, 1,
1.297176, -1.127426, 2.159547, 1, 0, 0, 1, 1,
1.30878, -1.420108, 1.43553, 1, 0, 0, 1, 1,
1.30889, 0.08619607, 1.650539, 1, 0, 0, 1, 1,
1.313628, -0.4645444, 1.451403, 1, 0, 0, 1, 1,
1.313649, -0.9498534, 1.560461, 0, 0, 0, 1, 1,
1.31716, 2.875017, -0.09314925, 0, 0, 0, 1, 1,
1.323331, -0.4166486, 1.776081, 0, 0, 0, 1, 1,
1.323758, -0.8774204, 2.384982, 0, 0, 0, 1, 1,
1.349656, 1.208261, 0.865018, 0, 0, 0, 1, 1,
1.350175, -1.183203, 3.696006, 0, 0, 0, 1, 1,
1.352062, -0.2305192, 2.350694, 0, 0, 0, 1, 1,
1.36483, 1.428999, 0.4491404, 1, 1, 1, 1, 1,
1.371537, -0.2191684, 1.394292, 1, 1, 1, 1, 1,
1.378996, -1.813372, 2.808871, 1, 1, 1, 1, 1,
1.390399, 0.3983113, 0.8785235, 1, 1, 1, 1, 1,
1.395489, 0.266614, 1.850849, 1, 1, 1, 1, 1,
1.397551, -0.4667733, 0.1684525, 1, 1, 1, 1, 1,
1.403072, 0.7623773, 1.881404, 1, 1, 1, 1, 1,
1.416786, -3.317109, 3.517184, 1, 1, 1, 1, 1,
1.418157, -0.6227526, 2.084062, 1, 1, 1, 1, 1,
1.432795, -0.1055998, 0.1643467, 1, 1, 1, 1, 1,
1.433293, -1.656777, 2.865547, 1, 1, 1, 1, 1,
1.433427, -1.129071, 2.374275, 1, 1, 1, 1, 1,
1.436819, 0.2799182, 1.044353, 1, 1, 1, 1, 1,
1.446048, 0.4859079, 2.033886, 1, 1, 1, 1, 1,
1.446954, -1.627374, 2.718281, 1, 1, 1, 1, 1,
1.447235, -1.663063, 1.473989, 0, 0, 1, 1, 1,
1.455882, -0.7978503, 1.961476, 1, 0, 0, 1, 1,
1.458304, -1.435455, 2.584203, 1, 0, 0, 1, 1,
1.462025, 0.3127096, 1.290501, 1, 0, 0, 1, 1,
1.47016, 0.617974, 1.94872, 1, 0, 0, 1, 1,
1.486633, -0.2622716, 1.353873, 1, 0, 0, 1, 1,
1.489619, -0.4696405, 1.216229, 0, 0, 0, 1, 1,
1.505674, 0.0325407, 1.589262, 0, 0, 0, 1, 1,
1.515615, -0.6202726, 1.29441, 0, 0, 0, 1, 1,
1.519083, -1.784425, 1.305387, 0, 0, 0, 1, 1,
1.531071, -1.188843, 1.664236, 0, 0, 0, 1, 1,
1.531202, 0.05249269, -0.1331265, 0, 0, 0, 1, 1,
1.559596, 0.04491085, 3.3798, 0, 0, 0, 1, 1,
1.56538, 0.6410512, 1.943787, 1, 1, 1, 1, 1,
1.571961, -1.353494, 1.994877, 1, 1, 1, 1, 1,
1.575812, -1.492706, 1.267331, 1, 1, 1, 1, 1,
1.583021, -0.6352494, 1.897889, 1, 1, 1, 1, 1,
1.586366, -0.03704657, 1.030818, 1, 1, 1, 1, 1,
1.591813, -0.4871965, 0.9284593, 1, 1, 1, 1, 1,
1.598858, -1.328297, 1.521787, 1, 1, 1, 1, 1,
1.601975, -0.7047451, 1.937367, 1, 1, 1, 1, 1,
1.618334, -0.02847614, 1.311114, 1, 1, 1, 1, 1,
1.64193, 0.01559562, 1.599602, 1, 1, 1, 1, 1,
1.654429, -0.5607638, 1.497422, 1, 1, 1, 1, 1,
1.660521, 1.065566, 1.765702, 1, 1, 1, 1, 1,
1.66572, 0.4139456, -0.2667661, 1, 1, 1, 1, 1,
1.67046, 0.4226525, 1.104942, 1, 1, 1, 1, 1,
1.681535, 0.5125517, 2.013101, 1, 1, 1, 1, 1,
1.688245, 1.812725, -0.01453615, 0, 0, 1, 1, 1,
1.691068, 0.9173656, 0.9854226, 1, 0, 0, 1, 1,
1.69345, -1.045536, 1.280519, 1, 0, 0, 1, 1,
1.699832, -2.258109, 3.040068, 1, 0, 0, 1, 1,
1.705689, 1.825157, 1.426027, 1, 0, 0, 1, 1,
1.720796, 1.108316, 1.231695, 1, 0, 0, 1, 1,
1.729383, -0.09686296, -0.05195301, 0, 0, 0, 1, 1,
1.745393, -0.85282, 2.394651, 0, 0, 0, 1, 1,
1.74955, 0.4982465, 0.08924893, 0, 0, 0, 1, 1,
1.760455, 1.318491e-05, 3.0274, 0, 0, 0, 1, 1,
1.764333, 1.106616, 2.117747, 0, 0, 0, 1, 1,
1.789556, 0.8373071, 0.583227, 0, 0, 0, 1, 1,
1.795257, 0.3404913, -0.4816829, 0, 0, 0, 1, 1,
1.818642, 0.5241289, 1.371573, 1, 1, 1, 1, 1,
1.838904, 0.7191086, 1.272505, 1, 1, 1, 1, 1,
1.85437, 0.5434091, 1.397683, 1, 1, 1, 1, 1,
1.873456, 0.1068614, 0.8549917, 1, 1, 1, 1, 1,
1.877751, 0.3592975, 1.646793, 1, 1, 1, 1, 1,
1.908737, 0.1044489, 1.704854, 1, 1, 1, 1, 1,
1.918411, -0.4090023, 0.1983855, 1, 1, 1, 1, 1,
1.923866, 1.198118, 1.028748, 1, 1, 1, 1, 1,
1.950408, 0.5607197, 0.9078385, 1, 1, 1, 1, 1,
1.974926, -0.2976727, 2.103222, 1, 1, 1, 1, 1,
2.036101, -0.6713218, 3.870213, 1, 1, 1, 1, 1,
2.038343, 0.2297682, 1.314686, 1, 1, 1, 1, 1,
2.041414, -0.7353491, 1.180561, 1, 1, 1, 1, 1,
2.075057, -0.2691158, 0.5305645, 1, 1, 1, 1, 1,
2.094959, 0.5784784, 2.24159, 1, 1, 1, 1, 1,
2.101802, -1.635406, 2.563479, 0, 0, 1, 1, 1,
2.121637, 0.516484, 1.163264, 1, 0, 0, 1, 1,
2.150292, 1.346312, -0.4435298, 1, 0, 0, 1, 1,
2.154782, -0.5317211, 3.370395, 1, 0, 0, 1, 1,
2.190105, 1.279617, 0.3806567, 1, 0, 0, 1, 1,
2.199068, -1.176419, 1.180107, 1, 0, 0, 1, 1,
2.239549, -0.9525412, 1.682201, 0, 0, 0, 1, 1,
2.265817, -1.658723, 1.326914, 0, 0, 0, 1, 1,
2.343988, -0.6806912, 1.223473, 0, 0, 0, 1, 1,
2.355198, 0.8446262, 2.833485, 0, 0, 0, 1, 1,
2.357674, 1.014232, 0.8708537, 0, 0, 0, 1, 1,
2.361178, -1.057597, 1.776581, 0, 0, 0, 1, 1,
2.397317, -1.056356, 2.715216, 0, 0, 0, 1, 1,
2.40807, -1.572387, 1.583979, 1, 1, 1, 1, 1,
2.512107, -0.1936637, 2.667701, 1, 1, 1, 1, 1,
2.525295, 0.02645071, 1.521138, 1, 1, 1, 1, 1,
2.581074, 1.52366, 1.310295, 1, 1, 1, 1, 1,
2.622214, -1.033116, 2.307429, 1, 1, 1, 1, 1,
2.840717, -1.013113, 3.333282, 1, 1, 1, 1, 1,
2.861958, 0.5711365, 2.683337, 1, 1, 1, 1, 1
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
var radius = 9.497064;
var distance = 33.35803;
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
mvMatrix.translate( 0.01026928, 0.162774, -0.2156103 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35803);
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
