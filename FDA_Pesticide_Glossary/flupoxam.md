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
-4.180096, 0.8776537, -1.780768, 1, 0, 0, 1,
-3.521162, -0.3013739, -0.9197605, 1, 0.007843138, 0, 1,
-2.89939, 0.5070595, -2.630933, 1, 0.01176471, 0, 1,
-2.496139, 1.158629, -2.728419, 1, 0.01960784, 0, 1,
-2.495961, 0.07209332, 0.1646848, 1, 0.02352941, 0, 1,
-2.483163, -0.1984295, 0.0575937, 1, 0.03137255, 0, 1,
-2.393284, 0.889145, -0.2229583, 1, 0.03529412, 0, 1,
-2.38172, 1.689291, -1.409231, 1, 0.04313726, 0, 1,
-2.373089, 0.6322813, 0.6791214, 1, 0.04705882, 0, 1,
-2.213144, 0.5466518, -2.009948, 1, 0.05490196, 0, 1,
-2.189741, 0.01627739, -0.8955485, 1, 0.05882353, 0, 1,
-2.142899, 1.248173, -0.6344889, 1, 0.06666667, 0, 1,
-2.125013, -1.340258, -1.767783, 1, 0.07058824, 0, 1,
-2.078819, 0.6508879, -1.322933, 1, 0.07843138, 0, 1,
-2.062058, -0.3400046, -1.582337, 1, 0.08235294, 0, 1,
-2.051519, 0.3937097, -0.6476442, 1, 0.09019608, 0, 1,
-2.036366, 0.3507103, -0.5175667, 1, 0.09411765, 0, 1,
-2.018929, -0.3932613, -1.198113, 1, 0.1019608, 0, 1,
-1.955029, 0.02562078, -2.469554, 1, 0.1098039, 0, 1,
-1.952715, 0.09226369, 0.05153773, 1, 0.1137255, 0, 1,
-1.934503, -0.895463, -2.497265, 1, 0.1215686, 0, 1,
-1.927367, -1.601284, -3.227734, 1, 0.1254902, 0, 1,
-1.923346, 0.5471103, -2.032515, 1, 0.1333333, 0, 1,
-1.92146, -0.04523125, -2.366895, 1, 0.1372549, 0, 1,
-1.895512, 0.5385848, -1.149761, 1, 0.145098, 0, 1,
-1.879116, -0.4457164, -1.090781, 1, 0.1490196, 0, 1,
-1.839502, 0.6217619, -0.614777, 1, 0.1568628, 0, 1,
-1.804633, 0.1863548, -0.3993524, 1, 0.1607843, 0, 1,
-1.797569, -0.7623966, -2.188858, 1, 0.1686275, 0, 1,
-1.767245, 0.4309213, 0.05424899, 1, 0.172549, 0, 1,
-1.763822, -0.1423606, -3.573586, 1, 0.1803922, 0, 1,
-1.758128, -1.44927, -1.150115, 1, 0.1843137, 0, 1,
-1.732874, 1.789945, 0.8030561, 1, 0.1921569, 0, 1,
-1.732699, -0.9966271, -0.8392915, 1, 0.1960784, 0, 1,
-1.721957, -0.7017277, -2.427847, 1, 0.2039216, 0, 1,
-1.715585, 1.18509, -1.621525, 1, 0.2117647, 0, 1,
-1.700698, 0.2803379, -0.2099214, 1, 0.2156863, 0, 1,
-1.692573, 0.8336161, -0.5603039, 1, 0.2235294, 0, 1,
-1.691129, 0.008435668, -1.277162, 1, 0.227451, 0, 1,
-1.687183, -0.9715912, -1.993065, 1, 0.2352941, 0, 1,
-1.681248, 1.503047, -1.065351, 1, 0.2392157, 0, 1,
-1.67848, -0.7525642, -0.4807395, 1, 0.2470588, 0, 1,
-1.676788, -0.2409674, 0.3234909, 1, 0.2509804, 0, 1,
-1.675211, -0.7089053, -3.158117, 1, 0.2588235, 0, 1,
-1.668158, -1.480166, -1.457314, 1, 0.2627451, 0, 1,
-1.66281, -0.3064681, -0.7153901, 1, 0.2705882, 0, 1,
-1.649436, -0.09945701, 0.4630516, 1, 0.2745098, 0, 1,
-1.642916, 0.7565054, -0.0858717, 1, 0.282353, 0, 1,
-1.632135, -1.423308, -2.687943, 1, 0.2862745, 0, 1,
-1.631594, -0.04098547, -1.074977, 1, 0.2941177, 0, 1,
-1.626328, 0.0374816, -2.111737, 1, 0.3019608, 0, 1,
-1.62268, -0.2499183, -1.994279, 1, 0.3058824, 0, 1,
-1.603944, 0.9086127, -1.716903, 1, 0.3137255, 0, 1,
-1.600785, 0.4805259, 0.183728, 1, 0.3176471, 0, 1,
-1.563964, 0.102323, -2.546365, 1, 0.3254902, 0, 1,
-1.563361, -0.7556839, -2.42558, 1, 0.3294118, 0, 1,
-1.556471, 0.4220304, -2.662353, 1, 0.3372549, 0, 1,
-1.531179, -1.568969, -2.091435, 1, 0.3411765, 0, 1,
-1.508523, -1.924049, -2.157443, 1, 0.3490196, 0, 1,
-1.50255, -0.1857356, -0.6762336, 1, 0.3529412, 0, 1,
-1.501928, -0.7579746, -0.8948829, 1, 0.3607843, 0, 1,
-1.47306, -1.16031, -0.6087763, 1, 0.3647059, 0, 1,
-1.472989, -0.9374052, -2.247306, 1, 0.372549, 0, 1,
-1.457394, -0.002049517, -3.261533, 1, 0.3764706, 0, 1,
-1.45648, -2.742599, -1.580103, 1, 0.3843137, 0, 1,
-1.446876, -1.167397, -0.6852452, 1, 0.3882353, 0, 1,
-1.442875, -0.9962898, -4.483155, 1, 0.3960784, 0, 1,
-1.439829, -0.2643245, -2.293734, 1, 0.4039216, 0, 1,
-1.439813, -0.1290907, -3.573243, 1, 0.4078431, 0, 1,
-1.435054, 0.9102305, -0.005661637, 1, 0.4156863, 0, 1,
-1.420395, -1.730964, -3.187508, 1, 0.4196078, 0, 1,
-1.418145, 0.5834669, 0.08641736, 1, 0.427451, 0, 1,
-1.417725, 0.6785788, -2.223005, 1, 0.4313726, 0, 1,
-1.413938, -0.6360196, -1.946707, 1, 0.4392157, 0, 1,
-1.405016, -1.894191, -2.638163, 1, 0.4431373, 0, 1,
-1.402256, -0.02268239, -2.291186, 1, 0.4509804, 0, 1,
-1.395151, 0.7228705, 0.3302473, 1, 0.454902, 0, 1,
-1.384365, 0.138764, -1.112058, 1, 0.4627451, 0, 1,
-1.373166, -0.4258601, -2.677874, 1, 0.4666667, 0, 1,
-1.371461, -0.5188208, -2.78812, 1, 0.4745098, 0, 1,
-1.364054, -0.008302798, 1.139784, 1, 0.4784314, 0, 1,
-1.360579, 0.2399322, -0.6782141, 1, 0.4862745, 0, 1,
-1.34896, 0.3500049, -0.09320935, 1, 0.4901961, 0, 1,
-1.334241, 2.355181, -0.5070572, 1, 0.4980392, 0, 1,
-1.328643, 0.5395523, -0.3416778, 1, 0.5058824, 0, 1,
-1.324913, 0.1906697, -0.7749471, 1, 0.509804, 0, 1,
-1.323814, 0.325034, -1.061084, 1, 0.5176471, 0, 1,
-1.322814, -1.040754, -2.824553, 1, 0.5215687, 0, 1,
-1.321392, 1.111874, -1.279771, 1, 0.5294118, 0, 1,
-1.316417, 0.7654207, -1.742713, 1, 0.5333334, 0, 1,
-1.315107, 0.7711632, -1.054283, 1, 0.5411765, 0, 1,
-1.312543, 0.3485845, -0.965328, 1, 0.5450981, 0, 1,
-1.306403, -1.08676, -1.89668, 1, 0.5529412, 0, 1,
-1.298783, 0.6149645, -1.069213, 1, 0.5568628, 0, 1,
-1.293019, 0.9896573, -1.336327, 1, 0.5647059, 0, 1,
-1.285825, -0.07532493, -1.854961, 1, 0.5686275, 0, 1,
-1.28411, -2.137085, -2.29717, 1, 0.5764706, 0, 1,
-1.262658, 0.5123088, 0.0121425, 1, 0.5803922, 0, 1,
-1.262212, 0.6887657, 0.3601876, 1, 0.5882353, 0, 1,
-1.256406, 0.184407, -0.01387558, 1, 0.5921569, 0, 1,
-1.252565, 0.647297, -2.550033, 1, 0.6, 0, 1,
-1.244847, -1.181241, -2.541744, 1, 0.6078432, 0, 1,
-1.239439, 2.184952, -0.1317625, 1, 0.6117647, 0, 1,
-1.236325, 0.5668628, 0.1947323, 1, 0.6196079, 0, 1,
-1.234707, 0.1045516, -0.561582, 1, 0.6235294, 0, 1,
-1.225872, -0.4506905, -2.636328, 1, 0.6313726, 0, 1,
-1.221857, -0.291962, -3.4196, 1, 0.6352941, 0, 1,
-1.219971, 0.6411605, -2.478549, 1, 0.6431373, 0, 1,
-1.211938, 2.360648, 0.6193661, 1, 0.6470588, 0, 1,
-1.200402, 0.2725145, -0.05488217, 1, 0.654902, 0, 1,
-1.19826, 2.152443, 0.1704945, 1, 0.6588235, 0, 1,
-1.18816, -0.445678, -2.213944, 1, 0.6666667, 0, 1,
-1.184187, -0.9019774, -0.732635, 1, 0.6705883, 0, 1,
-1.181714, 0.8031732, -0.1558036, 1, 0.6784314, 0, 1,
-1.178131, 1.851892, -0.5573288, 1, 0.682353, 0, 1,
-1.171014, -0.8145098, -3.596179, 1, 0.6901961, 0, 1,
-1.141791, -0.02444073, -2.576694, 1, 0.6941177, 0, 1,
-1.139634, -0.5309832, -1.907329, 1, 0.7019608, 0, 1,
-1.138998, 1.746218, 0.657765, 1, 0.7098039, 0, 1,
-1.136982, 2.057161, -0.05593431, 1, 0.7137255, 0, 1,
-1.133464, 1.356819, 0.5180227, 1, 0.7215686, 0, 1,
-1.13216, 0.7401211, -0.8735059, 1, 0.7254902, 0, 1,
-1.12283, -0.4027599, -1.939258, 1, 0.7333333, 0, 1,
-1.11947, -0.9887268, -0.8739247, 1, 0.7372549, 0, 1,
-1.108131, -1.484194, -1.307702, 1, 0.7450981, 0, 1,
-1.10703, -1.417913, -4.080401, 1, 0.7490196, 0, 1,
-1.10539, -0.5289378, -3.569407, 1, 0.7568628, 0, 1,
-1.104232, 0.3458709, -1.240521, 1, 0.7607843, 0, 1,
-1.068191, 0.2598024, -0.3780093, 1, 0.7686275, 0, 1,
-1.061997, 1.738935, -0.853963, 1, 0.772549, 0, 1,
-1.061803, 1.46502, -1.393907, 1, 0.7803922, 0, 1,
-1.058997, 0.7095802, -0.1877847, 1, 0.7843137, 0, 1,
-1.055481, 0.9716917, -0.655296, 1, 0.7921569, 0, 1,
-1.053789, -0.7359993, -2.083213, 1, 0.7960784, 0, 1,
-1.045152, -0.7345303, -1.87904, 1, 0.8039216, 0, 1,
-1.038404, 0.8569635, -0.998126, 1, 0.8117647, 0, 1,
-1.035242, -0.1205885, -1.548887, 1, 0.8156863, 0, 1,
-1.035167, -0.09658685, -4.202034, 1, 0.8235294, 0, 1,
-1.032944, -1.046046, -2.977458, 1, 0.827451, 0, 1,
-1.029954, -0.5537112, -0.8127037, 1, 0.8352941, 0, 1,
-1.024893, -0.4163297, -2.158667, 1, 0.8392157, 0, 1,
-1.024794, 0.9613579, 0.3318639, 1, 0.8470588, 0, 1,
-1.022978, -0.2654587, -3.791137, 1, 0.8509804, 0, 1,
-1.02183, 0.9896922, -3.698507, 1, 0.8588235, 0, 1,
-1.014677, -0.9414563, -2.94302, 1, 0.8627451, 0, 1,
-1.014408, 0.9905516, -1.83032, 1, 0.8705882, 0, 1,
-1.012558, 1.221227, 0.7325653, 1, 0.8745098, 0, 1,
-1.008055, 0.430685, -1.886533, 1, 0.8823529, 0, 1,
-1.001694, -1.613388, -2.949933, 1, 0.8862745, 0, 1,
-1.000065, -0.2309508, -3.308535, 1, 0.8941177, 0, 1,
-0.9971815, -0.405497, -2.426888, 1, 0.8980392, 0, 1,
-0.995081, 0.5609797, -1.752445, 1, 0.9058824, 0, 1,
-0.9944402, 1.148594, -0.07356406, 1, 0.9137255, 0, 1,
-0.9888088, 1.863017, 0.757126, 1, 0.9176471, 0, 1,
-0.9881992, -0.08948816, -0.2489253, 1, 0.9254902, 0, 1,
-0.9881551, 0.3971324, -1.184223, 1, 0.9294118, 0, 1,
-0.9787999, 0.6851877, -1.220152, 1, 0.9372549, 0, 1,
-0.9779248, 0.8838747, -0.8438922, 1, 0.9411765, 0, 1,
-0.9764856, -0.8317087, -2.690598, 1, 0.9490196, 0, 1,
-0.9735624, -2.433999, -3.135494, 1, 0.9529412, 0, 1,
-0.9663528, 1.926438, 0.4941302, 1, 0.9607843, 0, 1,
-0.9621192, -2.072361, -4.050591, 1, 0.9647059, 0, 1,
-0.9585292, -1.085465, -2.904627, 1, 0.972549, 0, 1,
-0.9509305, 0.5450465, -1.443872, 1, 0.9764706, 0, 1,
-0.9495771, 0.1554886, -1.990764, 1, 0.9843137, 0, 1,
-0.9456, -0.3207425, -0.7912496, 1, 0.9882353, 0, 1,
-0.9378457, -0.4311325, -2.302289, 1, 0.9960784, 0, 1,
-0.9347882, -0.6395109, -2.791012, 0.9960784, 1, 0, 1,
-0.9283543, 0.7729913, -1.056944, 0.9921569, 1, 0, 1,
-0.9272849, 0.1043406, -1.602834, 0.9843137, 1, 0, 1,
-0.922422, 1.15869, -1.165007, 0.9803922, 1, 0, 1,
-0.9197615, -0.1152968, -1.793177, 0.972549, 1, 0, 1,
-0.9167222, -0.7259008, -1.387975, 0.9686275, 1, 0, 1,
-0.91497, 0.5336426, -0.5481726, 0.9607843, 1, 0, 1,
-0.9132196, 1.27091, -0.209543, 0.9568627, 1, 0, 1,
-0.9123341, -1.796, -3.666028, 0.9490196, 1, 0, 1,
-0.9104844, -0.089554, -1.359518, 0.945098, 1, 0, 1,
-0.9100155, 2.446657, 2.273142, 0.9372549, 1, 0, 1,
-0.9090998, 0.2880336, -0.5391534, 0.9333333, 1, 0, 1,
-0.9038419, 0.404159, -0.2498378, 0.9254902, 1, 0, 1,
-0.9012893, 0.1750102, -0.9688228, 0.9215686, 1, 0, 1,
-0.8947915, -0.7130724, -0.3605215, 0.9137255, 1, 0, 1,
-0.8941732, 1.330317, 0.3166394, 0.9098039, 1, 0, 1,
-0.8871892, 0.9397282, 0.2459325, 0.9019608, 1, 0, 1,
-0.8788675, 0.1155663, -1.558381, 0.8941177, 1, 0, 1,
-0.8751806, 1.30107, 0.3278844, 0.8901961, 1, 0, 1,
-0.8729267, -0.2925145, -3.072502, 0.8823529, 1, 0, 1,
-0.8627838, -0.6566311, -2.817807, 0.8784314, 1, 0, 1,
-0.8430888, -2.099758, -3.625272, 0.8705882, 1, 0, 1,
-0.8410597, -0.896901, -0.1934979, 0.8666667, 1, 0, 1,
-0.8272523, 1.542444, -0.5207688, 0.8588235, 1, 0, 1,
-0.8191421, -0.6903719, -2.25859, 0.854902, 1, 0, 1,
-0.8130439, -0.1384805, -2.649128, 0.8470588, 1, 0, 1,
-0.8126408, -0.8396819, -3.241966, 0.8431373, 1, 0, 1,
-0.8081166, -0.8095235, -2.1915, 0.8352941, 1, 0, 1,
-0.8063138, 1.665564, -0.5197623, 0.8313726, 1, 0, 1,
-0.8029064, 0.2459802, -1.721731, 0.8235294, 1, 0, 1,
-0.7986868, -0.727143, -0.782295, 0.8196079, 1, 0, 1,
-0.798583, 1.725123, -0.3712282, 0.8117647, 1, 0, 1,
-0.7960985, -0.6844225, -1.831442, 0.8078431, 1, 0, 1,
-0.7940592, -0.1172001, -2.187292, 0.8, 1, 0, 1,
-0.7939331, 1.317871, 0.7512926, 0.7921569, 1, 0, 1,
-0.790796, -1.074158, -1.236693, 0.7882353, 1, 0, 1,
-0.7895381, 0.8914389, -1.094769, 0.7803922, 1, 0, 1,
-0.7797362, 0.9258616, -1.536941, 0.7764706, 1, 0, 1,
-0.779711, -1.551234, -1.938767, 0.7686275, 1, 0, 1,
-0.7785239, -0.9606787, -0.0952967, 0.7647059, 1, 0, 1,
-0.7754274, -2.009699, -4.214888, 0.7568628, 1, 0, 1,
-0.7752647, 1.195198, -2.437979, 0.7529412, 1, 0, 1,
-0.7742627, 0.381892, -1.353876, 0.7450981, 1, 0, 1,
-0.7738866, 1.546551, 1.030514, 0.7411765, 1, 0, 1,
-0.7715253, 0.3652217, -1.45004, 0.7333333, 1, 0, 1,
-0.7682558, 0.7451571, -1.645027, 0.7294118, 1, 0, 1,
-0.7649872, 0.5656678, -1.591349, 0.7215686, 1, 0, 1,
-0.7636546, -0.7795615, -2.451335, 0.7176471, 1, 0, 1,
-0.7515461, -0.5282284, -1.929709, 0.7098039, 1, 0, 1,
-0.7495586, -1.131478, -2.342281, 0.7058824, 1, 0, 1,
-0.7487379, -0.2144106, -2.436406, 0.6980392, 1, 0, 1,
-0.7473304, -0.5798368, -2.767867, 0.6901961, 1, 0, 1,
-0.7465954, 1.284911, -0.9875969, 0.6862745, 1, 0, 1,
-0.7446005, -0.2685665, -0.05307185, 0.6784314, 1, 0, 1,
-0.7442919, 0.8210585, 1.994918, 0.6745098, 1, 0, 1,
-0.7343698, -0.07449201, -0.4854969, 0.6666667, 1, 0, 1,
-0.7324027, -0.8962368, -2.258241, 0.6627451, 1, 0, 1,
-0.7296605, 0.9389371, 0.2889929, 0.654902, 1, 0, 1,
-0.7293623, -0.3958753, -3.333282, 0.6509804, 1, 0, 1,
-0.7290139, 0.4054574, -0.7699702, 0.6431373, 1, 0, 1,
-0.7167688, -1.427758, -2.826245, 0.6392157, 1, 0, 1,
-0.7166811, -1.495547, -3.249269, 0.6313726, 1, 0, 1,
-0.7166174, -0.7374929, -1.856537, 0.627451, 1, 0, 1,
-0.7124216, 0.6081622, 0.01287754, 0.6196079, 1, 0, 1,
-0.7085944, 1.473177, 0.2285625, 0.6156863, 1, 0, 1,
-0.7010089, -0.2832543, -2.083524, 0.6078432, 1, 0, 1,
-0.6989194, 0.1131844, 0.1753318, 0.6039216, 1, 0, 1,
-0.6987531, 0.1285695, -0.7674621, 0.5960785, 1, 0, 1,
-0.6908529, 0.441802, 0.0249489, 0.5882353, 1, 0, 1,
-0.6906781, -1.016971, -2.924538, 0.5843138, 1, 0, 1,
-0.6897852, 0.8733983, -0.01375039, 0.5764706, 1, 0, 1,
-0.6877748, -2.182914, -3.246821, 0.572549, 1, 0, 1,
-0.6830151, 0.5803354, -1.143755, 0.5647059, 1, 0, 1,
-0.6826634, 0.5261715, -1.471215, 0.5607843, 1, 0, 1,
-0.6823803, -1.412688, -2.041372, 0.5529412, 1, 0, 1,
-0.6807413, 0.7687884, -2.605118, 0.5490196, 1, 0, 1,
-0.6775956, -0.6996396, -0.9238353, 0.5411765, 1, 0, 1,
-0.676652, -1.543373, -2.124995, 0.5372549, 1, 0, 1,
-0.6746719, -0.4490103, -0.8331488, 0.5294118, 1, 0, 1,
-0.6717442, -0.5669916, -3.088093, 0.5254902, 1, 0, 1,
-0.6704044, 0.2585605, -2.359373, 0.5176471, 1, 0, 1,
-0.6641952, -1.035905, -3.07437, 0.5137255, 1, 0, 1,
-0.6613545, -1.436989, -3.282194, 0.5058824, 1, 0, 1,
-0.6610941, -2.300341, -3.539379, 0.5019608, 1, 0, 1,
-0.6607951, 0.6705114, 0.2604922, 0.4941176, 1, 0, 1,
-0.660163, -2.216531, -2.377058, 0.4862745, 1, 0, 1,
-0.6587105, -0.3350743, -1.532175, 0.4823529, 1, 0, 1,
-0.6565546, 0.0784099, -0.05547574, 0.4745098, 1, 0, 1,
-0.6512543, 0.8014165, -0.5309134, 0.4705882, 1, 0, 1,
-0.6511559, -2.54908, -2.321842, 0.4627451, 1, 0, 1,
-0.6502354, -1.552657, -2.27988, 0.4588235, 1, 0, 1,
-0.6477021, 1.600545, -0.2537425, 0.4509804, 1, 0, 1,
-0.6406684, -0.5298662, -2.91458, 0.4470588, 1, 0, 1,
-0.6361369, 0.8466765, 2.075287, 0.4392157, 1, 0, 1,
-0.635139, 0.7748538, -1.9814, 0.4352941, 1, 0, 1,
-0.6328112, 0.7397245, -1.15121, 0.427451, 1, 0, 1,
-0.6291808, -1.730439, -2.941654, 0.4235294, 1, 0, 1,
-0.61948, 0.4654017, -1.26685, 0.4156863, 1, 0, 1,
-0.6091231, 0.6700818, 0.1647774, 0.4117647, 1, 0, 1,
-0.6059356, 0.436928, -0.06942801, 0.4039216, 1, 0, 1,
-0.6046712, 0.5535756, -0.6970731, 0.3960784, 1, 0, 1,
-0.6004403, 1.841131, -1.330392, 0.3921569, 1, 0, 1,
-0.5947989, 0.03003191, -3.762142, 0.3843137, 1, 0, 1,
-0.5935379, 1.640224, 0.9175918, 0.3803922, 1, 0, 1,
-0.586637, 0.8450157, 0.6354055, 0.372549, 1, 0, 1,
-0.5840757, 1.153464, -1.416927, 0.3686275, 1, 0, 1,
-0.583065, 1.566382, -1.190439, 0.3607843, 1, 0, 1,
-0.5782217, 1.109221, -1.726969, 0.3568628, 1, 0, 1,
-0.5735813, 2.231364, -2.194672, 0.3490196, 1, 0, 1,
-0.5716695, 0.3558339, 0.9335989, 0.345098, 1, 0, 1,
-0.5706901, -0.8028447, -3.990869, 0.3372549, 1, 0, 1,
-0.5697066, -0.4363658, -2.130066, 0.3333333, 1, 0, 1,
-0.5619383, -1.555356, -1.97449, 0.3254902, 1, 0, 1,
-0.5539818, -1.50494, -3.081505, 0.3215686, 1, 0, 1,
-0.5536465, 0.1355451, -1.840489, 0.3137255, 1, 0, 1,
-0.5533746, -1.183236, -1.778342, 0.3098039, 1, 0, 1,
-0.5517315, 0.6572936, 0.958348, 0.3019608, 1, 0, 1,
-0.5497748, -3.161149, -4.207044, 0.2941177, 1, 0, 1,
-0.5467935, -0.6528208, -2.523106, 0.2901961, 1, 0, 1,
-0.5447689, -0.4310907, -1.256677, 0.282353, 1, 0, 1,
-0.5439106, -0.8854843, -3.433944, 0.2784314, 1, 0, 1,
-0.5380951, -0.9782456, -0.6004403, 0.2705882, 1, 0, 1,
-0.5368723, -1.497949, -0.3979751, 0.2666667, 1, 0, 1,
-0.5293356, 1.823893, -1.038233, 0.2588235, 1, 0, 1,
-0.5254044, -1.828035, -3.685049, 0.254902, 1, 0, 1,
-0.5230001, 1.047467, -0.1795844, 0.2470588, 1, 0, 1,
-0.5217194, -1.381341, -1.496767, 0.2431373, 1, 0, 1,
-0.5155805, 2.289005, 0.5350792, 0.2352941, 1, 0, 1,
-0.5107955, -0.9223427, -3.176984, 0.2313726, 1, 0, 1,
-0.4895188, 0.4246202, -1.095829, 0.2235294, 1, 0, 1,
-0.4894039, -1.894331, -3.081255, 0.2196078, 1, 0, 1,
-0.4890335, -0.9664724, -4.100821, 0.2117647, 1, 0, 1,
-0.4822115, -0.9232122, -1.661973, 0.2078431, 1, 0, 1,
-0.4804624, -0.4425996, -1.816608, 0.2, 1, 0, 1,
-0.4801324, -1.143654, -1.173161, 0.1921569, 1, 0, 1,
-0.4796094, -0.752202, -1.453867, 0.1882353, 1, 0, 1,
-0.4772959, 0.2371838, 0.5746836, 0.1803922, 1, 0, 1,
-0.4756572, 0.1620065, -1.53558, 0.1764706, 1, 0, 1,
-0.4750555, 0.2902564, 0.2738825, 0.1686275, 1, 0, 1,
-0.4733534, 0.248179, -0.5484813, 0.1647059, 1, 0, 1,
-0.469118, -1.33359, -2.162974, 0.1568628, 1, 0, 1,
-0.4690524, -0.2580737, 0.02288069, 0.1529412, 1, 0, 1,
-0.4657897, 1.981626, -0.4229756, 0.145098, 1, 0, 1,
-0.459816, 1.779233, 2.497224, 0.1411765, 1, 0, 1,
-0.4588484, -0.6324641, -3.154297, 0.1333333, 1, 0, 1,
-0.4585027, -1.317244, -0.5938452, 0.1294118, 1, 0, 1,
-0.4537843, -0.8842009, -3.414352, 0.1215686, 1, 0, 1,
-0.4515802, -0.6319299, -2.37425, 0.1176471, 1, 0, 1,
-0.451413, -0.9776778, -1.245079, 0.1098039, 1, 0, 1,
-0.451229, -0.656683, -5.11785, 0.1058824, 1, 0, 1,
-0.4472754, -0.1946265, 0.7132443, 0.09803922, 1, 0, 1,
-0.4471866, -1.344195, -2.396101, 0.09019608, 1, 0, 1,
-0.4458109, 0.06258658, -2.505758, 0.08627451, 1, 0, 1,
-0.4438297, 0.5636771, -1.031799, 0.07843138, 1, 0, 1,
-0.4435681, 0.9459841, 0.2219115, 0.07450981, 1, 0, 1,
-0.4432469, -0.4002706, -1.788799, 0.06666667, 1, 0, 1,
-0.4406371, -0.3464187, -1.629524, 0.0627451, 1, 0, 1,
-0.4303492, 0.8771257, -0.7339275, 0.05490196, 1, 0, 1,
-0.4295796, 1.64904, -0.1225991, 0.05098039, 1, 0, 1,
-0.4228651, -0.02624269, -3.645629, 0.04313726, 1, 0, 1,
-0.4216831, -0.39294, -4.367743, 0.03921569, 1, 0, 1,
-0.4174559, -0.2172551, -0.9374106, 0.03137255, 1, 0, 1,
-0.4173774, -0.5745328, -1.068118, 0.02745098, 1, 0, 1,
-0.4126214, -0.2482511, -3.863824, 0.01960784, 1, 0, 1,
-0.4120247, -0.24377, -2.732649, 0.01568628, 1, 0, 1,
-0.4094833, -0.3276724, -3.503375, 0.007843138, 1, 0, 1,
-0.4044755, -1.373768, -2.29234, 0.003921569, 1, 0, 1,
-0.4042395, 1.275135, -0.4375998, 0, 1, 0.003921569, 1,
-0.3965545, -0.3810551, -2.934173, 0, 1, 0.01176471, 1,
-0.3961898, 0.03008126, -0.9216678, 0, 1, 0.01568628, 1,
-0.3904199, 0.4913785, -1.039594, 0, 1, 0.02352941, 1,
-0.3895029, 0.1760622, -2.520037, 0, 1, 0.02745098, 1,
-0.3891708, 0.8560307, -0.1118501, 0, 1, 0.03529412, 1,
-0.3868204, 0.1505348, -0.8622704, 0, 1, 0.03921569, 1,
-0.3853792, 0.05413862, -1.492451, 0, 1, 0.04705882, 1,
-0.3851395, 1.362565, -0.6013597, 0, 1, 0.05098039, 1,
-0.3834611, 0.1255485, -0.6251188, 0, 1, 0.05882353, 1,
-0.378314, 1.482132, -0.7743071, 0, 1, 0.0627451, 1,
-0.3772796, -0.4573107, -1.116329, 0, 1, 0.07058824, 1,
-0.3768078, 1.599577, 1.165594, 0, 1, 0.07450981, 1,
-0.3757263, -1.069096, -0.606113, 0, 1, 0.08235294, 1,
-0.3715794, -0.239749, -2.584204, 0, 1, 0.08627451, 1,
-0.3714675, 1.41914, 1.329331, 0, 1, 0.09411765, 1,
-0.3685901, 0.621182, -0.6563621, 0, 1, 0.1019608, 1,
-0.366299, 0.2807179, -1.223679, 0, 1, 0.1058824, 1,
-0.3651141, -0.4725906, -2.433987, 0, 1, 0.1137255, 1,
-0.3645236, -1.701797, -1.95608, 0, 1, 0.1176471, 1,
-0.3606971, 0.6552587, -1.363544, 0, 1, 0.1254902, 1,
-0.3600928, 1.643678, 0.2076745, 0, 1, 0.1294118, 1,
-0.356852, -1.317497, -3.332671, 0, 1, 0.1372549, 1,
-0.3551497, 0.6827543, -1.294806, 0, 1, 0.1411765, 1,
-0.3495339, -0.5907014, -3.809223, 0, 1, 0.1490196, 1,
-0.3486849, -0.5610025, -2.571267, 0, 1, 0.1529412, 1,
-0.344633, -0.1913573, -3.798286, 0, 1, 0.1607843, 1,
-0.3419175, -0.727951, -2.518353, 0, 1, 0.1647059, 1,
-0.3406346, 0.8878898, -0.6725829, 0, 1, 0.172549, 1,
-0.3402895, 2.623531, 0.2376894, 0, 1, 0.1764706, 1,
-0.339825, 0.8514946, -0.3479228, 0, 1, 0.1843137, 1,
-0.3358655, -0.218605, -0.98154, 0, 1, 0.1882353, 1,
-0.3354897, -1.554585, -2.896832, 0, 1, 0.1960784, 1,
-0.3346061, -0.4381059, -3.663594, 0, 1, 0.2039216, 1,
-0.3323532, 0.8658662, -0.9603196, 0, 1, 0.2078431, 1,
-0.3284819, -0.3716215, -1.82209, 0, 1, 0.2156863, 1,
-0.3283973, -1.077935, -4.06087, 0, 1, 0.2196078, 1,
-0.3247313, 0.3763774, -1.332369, 0, 1, 0.227451, 1,
-0.3214075, -0.9445668, -3.1844, 0, 1, 0.2313726, 1,
-0.3198761, 0.2498923, -0.3058997, 0, 1, 0.2392157, 1,
-0.3136302, 0.9050543, -0.2093161, 0, 1, 0.2431373, 1,
-0.3131745, -1.161041, -3.519596, 0, 1, 0.2509804, 1,
-0.3128296, -0.8569773, -3.125497, 0, 1, 0.254902, 1,
-0.3126538, 0.7381189, 0.3771342, 0, 1, 0.2627451, 1,
-0.3125338, -1.318725, -3.209427, 0, 1, 0.2666667, 1,
-0.312007, 0.8309643, -1.551016, 0, 1, 0.2745098, 1,
-0.307235, -1.059103, -3.613821, 0, 1, 0.2784314, 1,
-0.3018126, 1.420968, 0.3966062, 0, 1, 0.2862745, 1,
-0.2961293, -0.5144878, -1.352243, 0, 1, 0.2901961, 1,
-0.2915259, 0.7614469, -0.06192563, 0, 1, 0.2980392, 1,
-0.29018, -0.4459847, -3.762861, 0, 1, 0.3058824, 1,
-0.2884152, 0.8311524, -0.2222615, 0, 1, 0.3098039, 1,
-0.2876951, -2.444453, -0.9027264, 0, 1, 0.3176471, 1,
-0.2773682, -0.1556165, -2.25786, 0, 1, 0.3215686, 1,
-0.2738313, 2.0788, 0.2246997, 0, 1, 0.3294118, 1,
-0.2704689, 1.039915, -0.2850794, 0, 1, 0.3333333, 1,
-0.2698296, -1.373136, -2.936135, 0, 1, 0.3411765, 1,
-0.2695313, -1.090844, -3.806525, 0, 1, 0.345098, 1,
-0.2684295, -0.4420849, -2.854153, 0, 1, 0.3529412, 1,
-0.2658666, 0.3216763, -1.509037, 0, 1, 0.3568628, 1,
-0.2627326, 0.1943105, -2.298869, 0, 1, 0.3647059, 1,
-0.260332, -0.7712955, -1.148642, 0, 1, 0.3686275, 1,
-0.2593196, -0.168434, -3.219956, 0, 1, 0.3764706, 1,
-0.2525699, -0.4453457, -2.771347, 0, 1, 0.3803922, 1,
-0.2484515, 0.6931766, -1.637056, 0, 1, 0.3882353, 1,
-0.2437386, -1.236632, -4.403038, 0, 1, 0.3921569, 1,
-0.2434803, 0.3689035, -1.652665, 0, 1, 0.4, 1,
-0.2432242, -0.01227116, -3.028653, 0, 1, 0.4078431, 1,
-0.2431823, 0.3082666, -1.57275, 0, 1, 0.4117647, 1,
-0.2426387, -0.08155666, -3.019598, 0, 1, 0.4196078, 1,
-0.2359985, -1.908556, -3.278801, 0, 1, 0.4235294, 1,
-0.2341914, 0.1788093, -1.148249, 0, 1, 0.4313726, 1,
-0.2248015, 1.211872, 0.1432015, 0, 1, 0.4352941, 1,
-0.2243988, -0.558171, -3.72555, 0, 1, 0.4431373, 1,
-0.2231324, -1.86044, -3.399533, 0, 1, 0.4470588, 1,
-0.2162355, 0.1886812, -1.207421, 0, 1, 0.454902, 1,
-0.2121612, 1.370983, 1.020824, 0, 1, 0.4588235, 1,
-0.2099898, -0.05692084, -1.508562, 0, 1, 0.4666667, 1,
-0.208487, -0.9027577, -2.51373, 0, 1, 0.4705882, 1,
-0.2069752, -0.3896302, -2.160306, 0, 1, 0.4784314, 1,
-0.2068671, 1.032678, 0.04113053, 0, 1, 0.4823529, 1,
-0.205478, -0.3649668, -2.026851, 0, 1, 0.4901961, 1,
-0.2033005, -0.4832788, -3.737812, 0, 1, 0.4941176, 1,
-0.1997021, -0.4877458, -2.958034, 0, 1, 0.5019608, 1,
-0.1951128, 0.4444929, -1.378245, 0, 1, 0.509804, 1,
-0.1943288, -1.013686, -3.421051, 0, 1, 0.5137255, 1,
-0.1926653, -0.3447975, -2.294743, 0, 1, 0.5215687, 1,
-0.1872468, 1.646351, -1.121127, 0, 1, 0.5254902, 1,
-0.1859524, 1.501886, -0.8847245, 0, 1, 0.5333334, 1,
-0.1841934, -0.9179921, -2.011846, 0, 1, 0.5372549, 1,
-0.1741719, 0.9364155, 1.400999, 0, 1, 0.5450981, 1,
-0.1695248, 0.2741075, -0.06793641, 0, 1, 0.5490196, 1,
-0.1668138, 1.47802, 0.9942856, 0, 1, 0.5568628, 1,
-0.1659077, -1.554304, -2.310808, 0, 1, 0.5607843, 1,
-0.1652936, 2.16233, 0.9843578, 0, 1, 0.5686275, 1,
-0.1582517, -0.05579919, -1.260021, 0, 1, 0.572549, 1,
-0.1570936, 1.841665, -0.08171795, 0, 1, 0.5803922, 1,
-0.1558159, -1.270163, -1.531553, 0, 1, 0.5843138, 1,
-0.154415, -0.7397076, -2.394884, 0, 1, 0.5921569, 1,
-0.148349, 0.3840479, 0.07076557, 0, 1, 0.5960785, 1,
-0.146756, 0.5751998, -0.2664418, 0, 1, 0.6039216, 1,
-0.1449707, -0.4208209, -2.985614, 0, 1, 0.6117647, 1,
-0.1409597, 1.278438, -1.076669, 0, 1, 0.6156863, 1,
-0.1396697, 0.1195825, -1.907282, 0, 1, 0.6235294, 1,
-0.138454, 0.2609904, -2.868513, 0, 1, 0.627451, 1,
-0.1281208, 1.000506, 0.9178925, 0, 1, 0.6352941, 1,
-0.1265041, -0.06672347, -3.567505, 0, 1, 0.6392157, 1,
-0.1243235, -1.195706, -4.060238, 0, 1, 0.6470588, 1,
-0.1213814, 0.1690232, -1.355482, 0, 1, 0.6509804, 1,
-0.1191584, 0.7978148, 0.100196, 0, 1, 0.6588235, 1,
-0.1094272, 0.0387878, -1.418981, 0, 1, 0.6627451, 1,
-0.10812, -0.9158502, -4.104858, 0, 1, 0.6705883, 1,
-0.1064922, -0.07214154, -2.186954, 0, 1, 0.6745098, 1,
-0.1054854, 0.03609861, -0.4053348, 0, 1, 0.682353, 1,
-0.1036291, 1.415908, 0.8248669, 0, 1, 0.6862745, 1,
-0.1034685, 0.5865901, -2.535789, 0, 1, 0.6941177, 1,
-0.09985184, -0.5058318, -3.606584, 0, 1, 0.7019608, 1,
-0.09674403, 0.3429452, -1.82498, 0, 1, 0.7058824, 1,
-0.09652577, -0.7078093, -2.314472, 0, 1, 0.7137255, 1,
-0.0949608, -0.8992015, -3.770655, 0, 1, 0.7176471, 1,
-0.0945994, -1.108581, -3.367068, 0, 1, 0.7254902, 1,
-0.09278822, -0.3723184, -1.775709, 0, 1, 0.7294118, 1,
-0.09012114, -0.8091504, -1.382966, 0, 1, 0.7372549, 1,
-0.08930913, 0.02175465, -0.6111838, 0, 1, 0.7411765, 1,
-0.08747178, -0.1288751, -2.156765, 0, 1, 0.7490196, 1,
-0.08667409, 1.481706, -0.8578763, 0, 1, 0.7529412, 1,
-0.08534857, 1.364671, 0.9070673, 0, 1, 0.7607843, 1,
-0.08332977, 0.1689321, -0.127533, 0, 1, 0.7647059, 1,
-0.08304698, 0.3936181, -1.306808, 0, 1, 0.772549, 1,
-0.07893753, -0.01031666, -2.311824, 0, 1, 0.7764706, 1,
-0.07590111, 1.119116, 0.7094701, 0, 1, 0.7843137, 1,
-0.0692165, 0.538915, -1.698813, 0, 1, 0.7882353, 1,
-0.06749097, -0.8875673, -3.205121, 0, 1, 0.7960784, 1,
-0.06705812, 0.1559938, -2.630471, 0, 1, 0.8039216, 1,
-0.06366774, 1.021242, -1.419484, 0, 1, 0.8078431, 1,
-0.06223625, -1.063679, -3.443205, 0, 1, 0.8156863, 1,
-0.06081899, -0.09740429, -2.999097, 0, 1, 0.8196079, 1,
-0.05893496, 0.6075858, 0.3190551, 0, 1, 0.827451, 1,
-0.05843867, -1.258382, -2.258107, 0, 1, 0.8313726, 1,
-0.0577655, -0.4847349, -4.363468, 0, 1, 0.8392157, 1,
-0.05646822, 0.3073181, 0.2372783, 0, 1, 0.8431373, 1,
-0.05619575, 1.256468, 0.8886368, 0, 1, 0.8509804, 1,
-0.05371704, -1.432437, -2.281014, 0, 1, 0.854902, 1,
-0.05243748, 0.8619056, -0.2170232, 0, 1, 0.8627451, 1,
-0.04712097, -0.6895039, -4.00274, 0, 1, 0.8666667, 1,
-0.04269337, -0.06708452, -3.023544, 0, 1, 0.8745098, 1,
-0.04162747, 1.451552, -0.3281378, 0, 1, 0.8784314, 1,
-0.03984017, 0.4088561, -0.510874, 0, 1, 0.8862745, 1,
-0.03434581, -1.015822, -0.8785427, 0, 1, 0.8901961, 1,
-0.03068758, 1.329927, 0.1820624, 0, 1, 0.8980392, 1,
-0.03033795, -0.9696279, -3.452241, 0, 1, 0.9058824, 1,
-0.03003671, -0.4543047, -3.437034, 0, 1, 0.9098039, 1,
-0.02641625, -0.1055978, -3.632394, 0, 1, 0.9176471, 1,
-0.02600892, -1.085214, -3.986076, 0, 1, 0.9215686, 1,
-0.02578311, -0.02622826, -1.637733, 0, 1, 0.9294118, 1,
-0.02181913, -0.4238931, -2.785657, 0, 1, 0.9333333, 1,
-0.02168626, 0.09544116, -0.09243485, 0, 1, 0.9411765, 1,
-0.02017575, -0.3697893, -4.053518, 0, 1, 0.945098, 1,
-0.01410035, -0.1479285, -4.513892, 0, 1, 0.9529412, 1,
-0.01390704, -1.157506, -3.151616, 0, 1, 0.9568627, 1,
-0.01306467, -1.098587, -1.813061, 0, 1, 0.9647059, 1,
-0.01294254, -0.2581868, -2.989758, 0, 1, 0.9686275, 1,
-0.01093012, -0.8923916, -1.789395, 0, 1, 0.9764706, 1,
-0.01020786, -0.04515746, -5.446043, 0, 1, 0.9803922, 1,
-0.008646447, -0.8859889, -3.71872, 0, 1, 0.9882353, 1,
-0.008395024, 0.05891361, -0.4979376, 0, 1, 0.9921569, 1,
-0.005670025, -1.874295, -4.113406, 0, 1, 1, 1,
0.004230378, -0.6107201, 2.513841, 0, 0.9921569, 1, 1,
0.009443114, 0.1040073, -0.03391135, 0, 0.9882353, 1, 1,
0.01067885, -0.4911023, 3.357876, 0, 0.9803922, 1, 1,
0.01266645, -0.740974, 3.115171, 0, 0.9764706, 1, 1,
0.01749212, -1.497212, 4.71145, 0, 0.9686275, 1, 1,
0.0175609, 0.5265526, 1.682665, 0, 0.9647059, 1, 1,
0.01894528, 0.1011179, -0.3941903, 0, 0.9568627, 1, 1,
0.01911534, -0.4192798, 2.309142, 0, 0.9529412, 1, 1,
0.0206664, 1.118814, -0.8844656, 0, 0.945098, 1, 1,
0.02777265, 0.6280864, -0.2182884, 0, 0.9411765, 1, 1,
0.02949537, -0.7598972, 2.227039, 0, 0.9333333, 1, 1,
0.03584063, -1.553309, 4.213928, 0, 0.9294118, 1, 1,
0.03763003, 0.9385766, 2.566396, 0, 0.9215686, 1, 1,
0.03927634, 0.06519309, 1.527643, 0, 0.9176471, 1, 1,
0.04050322, 1.484611, 0.3362011, 0, 0.9098039, 1, 1,
0.04551792, -0.4016561, 2.566284, 0, 0.9058824, 1, 1,
0.04811677, -2.178447, 2.683985, 0, 0.8980392, 1, 1,
0.04819097, -1.473568, 2.306469, 0, 0.8901961, 1, 1,
0.04867519, -1.388399, 5.457545, 0, 0.8862745, 1, 1,
0.04994448, 0.8471303, 1.330974, 0, 0.8784314, 1, 1,
0.05001228, 0.9430034, -1.875857, 0, 0.8745098, 1, 1,
0.05021663, 1.249607, 1.015409, 0, 0.8666667, 1, 1,
0.05090826, -0.7782815, 3.820974, 0, 0.8627451, 1, 1,
0.05460042, -1.062311, 3.280696, 0, 0.854902, 1, 1,
0.05570224, -0.1176895, 1.243467, 0, 0.8509804, 1, 1,
0.06019225, 0.32665, -0.3262347, 0, 0.8431373, 1, 1,
0.06160728, -0.9109247, 3.144832, 0, 0.8392157, 1, 1,
0.06212049, -0.4483056, 3.566034, 0, 0.8313726, 1, 1,
0.06621961, 0.1374875, -0.2283466, 0, 0.827451, 1, 1,
0.07184332, 0.8564324, 0.1446454, 0, 0.8196079, 1, 1,
0.07316, -1.710114, 1.141797, 0, 0.8156863, 1, 1,
0.07790467, -0.346462, 3.162943, 0, 0.8078431, 1, 1,
0.08039622, 0.31988, -1.160053, 0, 0.8039216, 1, 1,
0.0806068, 2.079943, 0.229368, 0, 0.7960784, 1, 1,
0.08196677, -1.589275, 1.771178, 0, 0.7882353, 1, 1,
0.08551495, 0.2737219, 1.834718, 0, 0.7843137, 1, 1,
0.08687874, -1.058082, 1.855975, 0, 0.7764706, 1, 1,
0.0874254, 2.611995, -0.04570264, 0, 0.772549, 1, 1,
0.08833945, 0.6588717, 0.2555765, 0, 0.7647059, 1, 1,
0.08955269, 0.1846473, 1.024238, 0, 0.7607843, 1, 1,
0.09018856, 1.320711, 1.372235, 0, 0.7529412, 1, 1,
0.09904946, -1.100483, 3.214908, 0, 0.7490196, 1, 1,
0.1027617, 1.121696, -0.09646028, 0, 0.7411765, 1, 1,
0.106965, -0.1578256, 2.690802, 0, 0.7372549, 1, 1,
0.1081835, -1.170878, 2.324737, 0, 0.7294118, 1, 1,
0.110069, 0.8429651, 0.28673, 0, 0.7254902, 1, 1,
0.1116016, -0.4279514, 4.131355, 0, 0.7176471, 1, 1,
0.1136338, 0.8530162, 1.115855, 0, 0.7137255, 1, 1,
0.1147278, -0.9875426, 4.132441, 0, 0.7058824, 1, 1,
0.1180339, 2.37995, 1.034775, 0, 0.6980392, 1, 1,
0.1201032, 0.7627505, -0.02338096, 0, 0.6941177, 1, 1,
0.1220242, -1.074472, 1.040158, 0, 0.6862745, 1, 1,
0.1260247, -0.3019044, 2.554628, 0, 0.682353, 1, 1,
0.1381611, -0.1689991, -0.2236145, 0, 0.6745098, 1, 1,
0.1385979, -0.3867452, 2.48476, 0, 0.6705883, 1, 1,
0.1400007, 0.7607058, -0.4334215, 0, 0.6627451, 1, 1,
0.1414224, -1.277575, 1.864951, 0, 0.6588235, 1, 1,
0.1431938, -0.8157706, 1.992684, 0, 0.6509804, 1, 1,
0.1446051, -0.8591178, 3.50976, 0, 0.6470588, 1, 1,
0.1473019, -0.2488616, 4.214221, 0, 0.6392157, 1, 1,
0.1509715, 0.8057086, -0.6908079, 0, 0.6352941, 1, 1,
0.1522329, -1.263206, 2.323492, 0, 0.627451, 1, 1,
0.1523456, -0.4246157, 2.422195, 0, 0.6235294, 1, 1,
0.1577384, -0.6039642, 3.06786, 0, 0.6156863, 1, 1,
0.1591631, 1.587342, 1.314369, 0, 0.6117647, 1, 1,
0.1603133, -1.891313, 3.817588, 0, 0.6039216, 1, 1,
0.1629976, 1.447057, 0.3061152, 0, 0.5960785, 1, 1,
0.1634679, 0.3108696, 1.362171, 0, 0.5921569, 1, 1,
0.1646301, -0.8611253, 3.787772, 0, 0.5843138, 1, 1,
0.1657504, -0.187054, 1.613395, 0, 0.5803922, 1, 1,
0.1685493, 1.16404, 2.484035, 0, 0.572549, 1, 1,
0.1722298, -0.1603268, 1.429908, 0, 0.5686275, 1, 1,
0.1731314, -1.526861, 3.815606, 0, 0.5607843, 1, 1,
0.1769736, 0.7372137, 0.3366108, 0, 0.5568628, 1, 1,
0.1793996, -1.336908, 3.085106, 0, 0.5490196, 1, 1,
0.1798856, 1.767063, -0.7483044, 0, 0.5450981, 1, 1,
0.1879259, 0.8154156, 0.498394, 0, 0.5372549, 1, 1,
0.1879621, -0.4303695, 3.933428, 0, 0.5333334, 1, 1,
0.1885168, -0.4042783, 0.8931268, 0, 0.5254902, 1, 1,
0.1938426, -0.3218402, 3.796084, 0, 0.5215687, 1, 1,
0.1941219, -0.9504972, 3.52601, 0, 0.5137255, 1, 1,
0.1953962, -0.5106881, 1.671806, 0, 0.509804, 1, 1,
0.1972942, 1.670143, -0.006639856, 0, 0.5019608, 1, 1,
0.2018823, -0.9921314, 2.449868, 0, 0.4941176, 1, 1,
0.2056898, -2.195817, 2.579921, 0, 0.4901961, 1, 1,
0.2077236, -0.6423607, 4.369002, 0, 0.4823529, 1, 1,
0.2093046, 0.01452811, 3.048563, 0, 0.4784314, 1, 1,
0.2107481, -1.577962, 3.896584, 0, 0.4705882, 1, 1,
0.2136102, 1.813101, -0.06676286, 0, 0.4666667, 1, 1,
0.2159429, -0.2541969, 2.933039, 0, 0.4588235, 1, 1,
0.2165718, -0.8357696, 2.523906, 0, 0.454902, 1, 1,
0.2168217, 1.948439, -0.2405428, 0, 0.4470588, 1, 1,
0.2204818, 2.766047, 0.1397409, 0, 0.4431373, 1, 1,
0.2266207, -0.7566123, 3.81033, 0, 0.4352941, 1, 1,
0.2269747, 0.7891794, -0.4193495, 0, 0.4313726, 1, 1,
0.2294155, 0.351967, -0.2656491, 0, 0.4235294, 1, 1,
0.2315553, 0.1904186, 1.254756, 0, 0.4196078, 1, 1,
0.2335759, 0.1049483, 2.350948, 0, 0.4117647, 1, 1,
0.2364002, -0.6584776, 3.144677, 0, 0.4078431, 1, 1,
0.236454, -0.8477308, 4.213632, 0, 0.4, 1, 1,
0.2424093, 0.5670304, 0.4854566, 0, 0.3921569, 1, 1,
0.2437046, -1.273451, 2.537243, 0, 0.3882353, 1, 1,
0.2481808, 0.2457482, 0.866641, 0, 0.3803922, 1, 1,
0.2505396, -0.4359269, 1.969711, 0, 0.3764706, 1, 1,
0.25197, -1.137686, 3.239502, 0, 0.3686275, 1, 1,
0.2566289, 0.7454769, 2.379078, 0, 0.3647059, 1, 1,
0.2645622, 0.3088087, 0.03148364, 0, 0.3568628, 1, 1,
0.2647963, -2.10019, 1.866225, 0, 0.3529412, 1, 1,
0.2656527, 0.3137852, 0.6989232, 0, 0.345098, 1, 1,
0.2665027, 0.8063037, 0.1903251, 0, 0.3411765, 1, 1,
0.2668654, -0.5438743, 3.676165, 0, 0.3333333, 1, 1,
0.2680537, 0.02363607, 1.751205, 0, 0.3294118, 1, 1,
0.270791, 0.5014907, -0.671442, 0, 0.3215686, 1, 1,
0.2718334, -0.9930679, 2.858416, 0, 0.3176471, 1, 1,
0.2744615, 0.4329009, 1.870852, 0, 0.3098039, 1, 1,
0.2802149, 0.1604259, -0.6140191, 0, 0.3058824, 1, 1,
0.2829112, 0.3536796, 0.5215642, 0, 0.2980392, 1, 1,
0.2834108, 1.257664, -1.422968, 0, 0.2901961, 1, 1,
0.2874798, -0.165552, 2.085329, 0, 0.2862745, 1, 1,
0.2888211, -0.6720069, 1.178257, 0, 0.2784314, 1, 1,
0.2985408, -1.456115, 3.800004, 0, 0.2745098, 1, 1,
0.3012235, -1.117351, 2.381935, 0, 0.2666667, 1, 1,
0.3027548, -0.6732422, 1.398099, 0, 0.2627451, 1, 1,
0.3030216, -0.2033903, 3.469594, 0, 0.254902, 1, 1,
0.3085253, -0.7914899, 3.285352, 0, 0.2509804, 1, 1,
0.3109748, -0.05062395, 1.683733, 0, 0.2431373, 1, 1,
0.3152794, -0.7022258, 3.392068, 0, 0.2392157, 1, 1,
0.3171741, -0.3089626, 2.720135, 0, 0.2313726, 1, 1,
0.3210571, 0.1713933, 1.883983, 0, 0.227451, 1, 1,
0.3251043, -0.8157972, 1.902943, 0, 0.2196078, 1, 1,
0.3257698, 1.044525, -0.2596532, 0, 0.2156863, 1, 1,
0.3266401, 1.1134, -0.5409325, 0, 0.2078431, 1, 1,
0.328905, 0.3920455, 0.0993925, 0, 0.2039216, 1, 1,
0.3298563, 1.252837, 1.062553, 0, 0.1960784, 1, 1,
0.3302077, -1.736431, 3.53299, 0, 0.1882353, 1, 1,
0.336816, 0.9072692, -0.4025459, 0, 0.1843137, 1, 1,
0.3436911, -1.693181, 1.765185, 0, 0.1764706, 1, 1,
0.3496101, -0.4267804, 3.869406, 0, 0.172549, 1, 1,
0.3517112, -0.1381546, 2.691651, 0, 0.1647059, 1, 1,
0.3531811, 2.314656, -1.17851, 0, 0.1607843, 1, 1,
0.3570586, 0.009433372, 1.907437, 0, 0.1529412, 1, 1,
0.3671722, -0.4130087, 3.325737, 0, 0.1490196, 1, 1,
0.3687757, -0.2812059, 2.546231, 0, 0.1411765, 1, 1,
0.3697135, -0.2229495, 2.595338, 0, 0.1372549, 1, 1,
0.3713613, 1.311475, 1.842317, 0, 0.1294118, 1, 1,
0.3723298, -0.4116525, 1.994071, 0, 0.1254902, 1, 1,
0.3733425, -2.324162, 3.070348, 0, 0.1176471, 1, 1,
0.3761413, -1.253008, 2.432507, 0, 0.1137255, 1, 1,
0.3762688, 0.7206557, -0.2344243, 0, 0.1058824, 1, 1,
0.3766997, -0.07987914, 3.999099, 0, 0.09803922, 1, 1,
0.3803788, 0.2605929, 0.5971389, 0, 0.09411765, 1, 1,
0.3837885, -1.412908, 3.246498, 0, 0.08627451, 1, 1,
0.3885962, -0.7471899, 2.068152, 0, 0.08235294, 1, 1,
0.391846, -1.028376, 2.387498, 0, 0.07450981, 1, 1,
0.3947118, 0.3911764, 0.7058619, 0, 0.07058824, 1, 1,
0.396599, 0.3669762, 0.8221877, 0, 0.0627451, 1, 1,
0.3983479, 1.33172, 0.1517523, 0, 0.05882353, 1, 1,
0.400501, 0.2268647, 0.04020549, 0, 0.05098039, 1, 1,
0.4024573, -0.2734382, 2.203055, 0, 0.04705882, 1, 1,
0.4067698, 0.249754, 1.491241, 0, 0.03921569, 1, 1,
0.4111693, 0.7572322, 1.982661, 0, 0.03529412, 1, 1,
0.4122346, -0.164749, 0.2962354, 0, 0.02745098, 1, 1,
0.4150752, -0.848025, 3.522874, 0, 0.02352941, 1, 1,
0.4151679, -1.487455, 4.904159, 0, 0.01568628, 1, 1,
0.4169407, -0.8783934, 1.143668, 0, 0.01176471, 1, 1,
0.4230336, 0.2437211, 1.076849, 0, 0.003921569, 1, 1,
0.423438, 1.337658, 1.843226, 0.003921569, 0, 1, 1,
0.4292623, 0.3909233, 1.762181, 0.007843138, 0, 1, 1,
0.4332849, 1.009059, -0.04087878, 0.01568628, 0, 1, 1,
0.4366701, -0.5208024, 3.166893, 0.01960784, 0, 1, 1,
0.4406146, 0.1267029, 0.7866721, 0.02745098, 0, 1, 1,
0.4425074, 0.03552958, 3.012484, 0.03137255, 0, 1, 1,
0.442578, -0.5260594, 3.684234, 0.03921569, 0, 1, 1,
0.4494067, 0.281959, -0.2991, 0.04313726, 0, 1, 1,
0.454744, 1.280018, -0.3167039, 0.05098039, 0, 1, 1,
0.4573623, -1.785408, 3.096716, 0.05490196, 0, 1, 1,
0.4580453, -1.410976, 3.504247, 0.0627451, 0, 1, 1,
0.459993, 0.09780005, 0.2198615, 0.06666667, 0, 1, 1,
0.4633911, -0.03749437, 0.448885, 0.07450981, 0, 1, 1,
0.4643733, 1.428506, 0.6032462, 0.07843138, 0, 1, 1,
0.4662649, 0.4030725, 0.3743024, 0.08627451, 0, 1, 1,
0.4682914, -1.181581, 1.171414, 0.09019608, 0, 1, 1,
0.4692983, 0.6581528, -1.053974, 0.09803922, 0, 1, 1,
0.4700945, 1.302994, 0.3966576, 0.1058824, 0, 1, 1,
0.4726344, -0.4074767, 0.7618459, 0.1098039, 0, 1, 1,
0.478285, -0.1665378, 1.358119, 0.1176471, 0, 1, 1,
0.4797759, -0.2349228, 2.495788, 0.1215686, 0, 1, 1,
0.4821914, 1.286645, 0.1828764, 0.1294118, 0, 1, 1,
0.4838891, 0.5257866, 1.614006, 0.1333333, 0, 1, 1,
0.4859686, 1.005704, 0.8077816, 0.1411765, 0, 1, 1,
0.4861972, 0.04875989, 2.446089, 0.145098, 0, 1, 1,
0.4869316, 1.69473, 1.213837, 0.1529412, 0, 1, 1,
0.4891559, -0.01251727, 2.377837, 0.1568628, 0, 1, 1,
0.4933167, -1.449033, 2.426926, 0.1647059, 0, 1, 1,
0.497337, 1.104247, 0.9274904, 0.1686275, 0, 1, 1,
0.4980482, 0.2493276, 2.032423, 0.1764706, 0, 1, 1,
0.4985946, -0.07327277, 1.574325, 0.1803922, 0, 1, 1,
0.5060889, -0.8389651, 4.751471, 0.1882353, 0, 1, 1,
0.5068985, -0.4183565, 3.495611, 0.1921569, 0, 1, 1,
0.5092453, 0.2527982, 0.9843798, 0.2, 0, 1, 1,
0.5093672, -0.2357537, 0.8429571, 0.2078431, 0, 1, 1,
0.5102445, -0.9076805, 3.147488, 0.2117647, 0, 1, 1,
0.5104847, 1.437078, 0.5728689, 0.2196078, 0, 1, 1,
0.5179504, -0.6231133, 3.061502, 0.2235294, 0, 1, 1,
0.5204946, -0.5916061, 3.565103, 0.2313726, 0, 1, 1,
0.5204968, 2.54072, -0.1282099, 0.2352941, 0, 1, 1,
0.5232162, 1.003122, 2.463261, 0.2431373, 0, 1, 1,
0.5240136, 0.3487713, 1.206392, 0.2470588, 0, 1, 1,
0.5245754, 1.753293, -0.6874752, 0.254902, 0, 1, 1,
0.5249651, -1.792427, 1.642305, 0.2588235, 0, 1, 1,
0.5252171, 0.1550796, 1.751725, 0.2666667, 0, 1, 1,
0.5256062, 0.4391503, -0.3391766, 0.2705882, 0, 1, 1,
0.5288259, 0.5670695, 1.300891, 0.2784314, 0, 1, 1,
0.5307594, 0.5530047, 1.626959, 0.282353, 0, 1, 1,
0.5320255, -0.3793265, 2.031304, 0.2901961, 0, 1, 1,
0.5338627, -0.5198107, 2.17826, 0.2941177, 0, 1, 1,
0.5378067, -1.101624, 2.873637, 0.3019608, 0, 1, 1,
0.5384552, -0.4482813, 1.948602, 0.3098039, 0, 1, 1,
0.5395283, 0.5316764, 1.297854, 0.3137255, 0, 1, 1,
0.5405995, -0.1142972, 1.069674, 0.3215686, 0, 1, 1,
0.5427722, 0.9247056, -0.8994855, 0.3254902, 0, 1, 1,
0.5447714, 1.124359, 1.803437, 0.3333333, 0, 1, 1,
0.5539046, -0.5618669, 3.493327, 0.3372549, 0, 1, 1,
0.5556298, -0.5163558, 3.774602, 0.345098, 0, 1, 1,
0.5621068, -0.7683818, 2.74503, 0.3490196, 0, 1, 1,
0.5677006, -0.9444086, 1.504352, 0.3568628, 0, 1, 1,
0.5689557, 0.4396539, 3.015714, 0.3607843, 0, 1, 1,
0.5708954, -0.3986252, 2.216199, 0.3686275, 0, 1, 1,
0.5749899, 0.3886246, 0.1664291, 0.372549, 0, 1, 1,
0.5751845, 0.5140726, -0.09453668, 0.3803922, 0, 1, 1,
0.584434, 0.8396866, 2.623646, 0.3843137, 0, 1, 1,
0.5868556, 0.5022448, -0.2748517, 0.3921569, 0, 1, 1,
0.5900652, -1.603485, 2.230221, 0.3960784, 0, 1, 1,
0.5911298, -0.147847, 3.236412, 0.4039216, 0, 1, 1,
0.5920943, 0.2246099, -0.01716365, 0.4117647, 0, 1, 1,
0.5930498, -0.1983416, 1.872971, 0.4156863, 0, 1, 1,
0.5944092, -1.244306, 2.505133, 0.4235294, 0, 1, 1,
0.597135, -0.1421907, 1.36384, 0.427451, 0, 1, 1,
0.602106, 2.022228, 0.3314025, 0.4352941, 0, 1, 1,
0.6193061, 1.245508, 0.4088767, 0.4392157, 0, 1, 1,
0.6243194, -0.1214787, 3.606024, 0.4470588, 0, 1, 1,
0.625093, -0.5491866, -0.1965785, 0.4509804, 0, 1, 1,
0.6378778, -0.3212481, 3.104956, 0.4588235, 0, 1, 1,
0.642778, 0.08155139, 0.3739317, 0.4627451, 0, 1, 1,
0.6488501, 0.5971642, 0.4317914, 0.4705882, 0, 1, 1,
0.6506768, 0.4749487, 1.330037, 0.4745098, 0, 1, 1,
0.6520153, 0.5534477, -0.1070588, 0.4823529, 0, 1, 1,
0.6525128, -0.162442, 2.674432, 0.4862745, 0, 1, 1,
0.66377, 0.4516554, 1.90835, 0.4941176, 0, 1, 1,
0.6658139, -0.4179891, 0.03439003, 0.5019608, 0, 1, 1,
0.6661014, 0.171349, 1.355647, 0.5058824, 0, 1, 1,
0.670643, 0.01811278, 1.244827, 0.5137255, 0, 1, 1,
0.6716993, 0.006001553, 0.6115149, 0.5176471, 0, 1, 1,
0.672358, 0.3586352, -0.09527004, 0.5254902, 0, 1, 1,
0.6756427, 0.04764397, 2.386943, 0.5294118, 0, 1, 1,
0.6756584, -0.251241, -0.06306299, 0.5372549, 0, 1, 1,
0.6766239, -2.533078, 2.221145, 0.5411765, 0, 1, 1,
0.6777704, -0.6535547, 2.0922, 0.5490196, 0, 1, 1,
0.6793274, -0.4135947, 3.294088, 0.5529412, 0, 1, 1,
0.6807261, -1.518122, 2.301146, 0.5607843, 0, 1, 1,
0.6817257, 1.020795, 0.6871285, 0.5647059, 0, 1, 1,
0.6874394, -0.4448147, 2.388443, 0.572549, 0, 1, 1,
0.687674, 1.117562, 0.7364511, 0.5764706, 0, 1, 1,
0.6888205, 1.23748, 0.6898375, 0.5843138, 0, 1, 1,
0.6927615, 1.392498, -1.144415, 0.5882353, 0, 1, 1,
0.6983584, 0.5834125, 1.024395, 0.5960785, 0, 1, 1,
0.6996451, -1.317721, 0.4868028, 0.6039216, 0, 1, 1,
0.7005898, 0.6953686, 1.334928, 0.6078432, 0, 1, 1,
0.7007263, -0.7601494, 1.804739, 0.6156863, 0, 1, 1,
0.7028424, -1.583169, 3.729738, 0.6196079, 0, 1, 1,
0.7067001, -1.046829, 2.067685, 0.627451, 0, 1, 1,
0.7071142, -0.9999709, 2.454549, 0.6313726, 0, 1, 1,
0.707541, -0.01684143, 0.05999683, 0.6392157, 0, 1, 1,
0.711933, 0.5496778, 0.5839072, 0.6431373, 0, 1, 1,
0.7154814, 0.09281272, 3.446021, 0.6509804, 0, 1, 1,
0.7158705, 1.170244, 1.082894, 0.654902, 0, 1, 1,
0.7206928, 2.485867, 0.3377486, 0.6627451, 0, 1, 1,
0.7256368, 1.195211, 0.7421739, 0.6666667, 0, 1, 1,
0.7284915, 1.320415, 1.901549, 0.6745098, 0, 1, 1,
0.7370184, 0.1639276, -0.5735241, 0.6784314, 0, 1, 1,
0.7427553, 1.127158, 2.136093, 0.6862745, 0, 1, 1,
0.7436011, -0.1722255, 2.280739, 0.6901961, 0, 1, 1,
0.7491226, -1.478215, 3.189454, 0.6980392, 0, 1, 1,
0.7491676, -0.6491889, 1.245203, 0.7058824, 0, 1, 1,
0.7528732, -0.4905388, 1.881909, 0.7098039, 0, 1, 1,
0.7551169, 1.494223, 0.6778703, 0.7176471, 0, 1, 1,
0.7571064, 1.167061, 1.258226, 0.7215686, 0, 1, 1,
0.7579374, -0.1252093, 2.229043, 0.7294118, 0, 1, 1,
0.7623833, 0.2679281, 1.742164, 0.7333333, 0, 1, 1,
0.7704304, 0.5060778, 2.115425, 0.7411765, 0, 1, 1,
0.7710793, -0.1257646, 1.798975, 0.7450981, 0, 1, 1,
0.7751775, 1.056925, 1.539996, 0.7529412, 0, 1, 1,
0.7753889, 2.280917, -0.08454741, 0.7568628, 0, 1, 1,
0.7766801, 0.3061652, 2.647857, 0.7647059, 0, 1, 1,
0.7816653, -2.110847, 3.16542, 0.7686275, 0, 1, 1,
0.7849817, 1.663517, -0.07939188, 0.7764706, 0, 1, 1,
0.7864121, -0.1590102, 2.297803, 0.7803922, 0, 1, 1,
0.7894385, -0.5173887, 3.252577, 0.7882353, 0, 1, 1,
0.7924561, 1.4213, -0.9028969, 0.7921569, 0, 1, 1,
0.7932703, 0.3962475, 0.5513147, 0.8, 0, 1, 1,
0.7933549, -0.18071, 3.049972, 0.8078431, 0, 1, 1,
0.7935845, 1.447603, 0.2477063, 0.8117647, 0, 1, 1,
0.7936245, -1.33406, 2.120814, 0.8196079, 0, 1, 1,
0.7937586, 0.2037089, 2.598284, 0.8235294, 0, 1, 1,
0.7972085, -0.6978472, 2.013273, 0.8313726, 0, 1, 1,
0.8126989, -1.588868, 3.166398, 0.8352941, 0, 1, 1,
0.8152199, 1.724916, 1.086766, 0.8431373, 0, 1, 1,
0.8181811, -1.353353, 1.835497, 0.8470588, 0, 1, 1,
0.8229078, -0.09306268, 2.699713, 0.854902, 0, 1, 1,
0.826643, -1.429442, 3.305577, 0.8588235, 0, 1, 1,
0.8349016, 0.4693261, 0.6411232, 0.8666667, 0, 1, 1,
0.836414, -0.4274765, 3.300963, 0.8705882, 0, 1, 1,
0.841505, -0.3037783, 1.816887, 0.8784314, 0, 1, 1,
0.8443673, -1.303815, 2.668483, 0.8823529, 0, 1, 1,
0.850387, -0.6952275, 2.928031, 0.8901961, 0, 1, 1,
0.8535286, 0.9553114, 0.7795339, 0.8941177, 0, 1, 1,
0.8547475, 0.439025, -0.5036038, 0.9019608, 0, 1, 1,
0.8554336, -0.215974, 2.34148, 0.9098039, 0, 1, 1,
0.857199, -0.7256893, 3.638865, 0.9137255, 0, 1, 1,
0.8575018, 1.647685, 0.2992439, 0.9215686, 0, 1, 1,
0.8714965, -0.6952508, 3.569469, 0.9254902, 0, 1, 1,
0.8727595, 0.236728, -0.2015359, 0.9333333, 0, 1, 1,
0.8729742, 0.353945, -0.06464534, 0.9372549, 0, 1, 1,
0.8824843, 0.980638, 0.6157213, 0.945098, 0, 1, 1,
0.8826309, -0.936657, 2.096231, 0.9490196, 0, 1, 1,
0.8847087, -0.5255365, 3.03238, 0.9568627, 0, 1, 1,
0.8894089, -0.3541484, 2.693207, 0.9607843, 0, 1, 1,
0.8962379, -0.1096538, 1.909339, 0.9686275, 0, 1, 1,
0.8967237, 1.120706, 0.5993077, 0.972549, 0, 1, 1,
0.8977506, 2.248372, 0.218753, 0.9803922, 0, 1, 1,
0.8978357, 0.4245722, 2.894983, 0.9843137, 0, 1, 1,
0.9016429, 0.3221911, 0.6488522, 0.9921569, 0, 1, 1,
0.9050685, 0.7064571, 0.6575415, 0.9960784, 0, 1, 1,
0.9149889, 0.8418443, 1.456112, 1, 0, 0.9960784, 1,
0.9161199, 0.8553847, -0.1631856, 1, 0, 0.9882353, 1,
0.918196, 0.2648253, 2.053132, 1, 0, 0.9843137, 1,
0.9218751, 1.382703, -0.9060534, 1, 0, 0.9764706, 1,
0.9268411, 0.1589987, 1.243147, 1, 0, 0.972549, 1,
0.9358616, 0.5061951, 1.808192, 1, 0, 0.9647059, 1,
0.9397517, -1.100395, 1.715177, 1, 0, 0.9607843, 1,
0.9458911, -0.4068079, 2.023726, 1, 0, 0.9529412, 1,
0.9544103, -0.8517326, 3.139028, 1, 0, 0.9490196, 1,
0.9562562, 0.7470921, 1.143631, 1, 0, 0.9411765, 1,
0.975974, 0.1748305, 1.4543, 1, 0, 0.9372549, 1,
0.9821942, -1.215959, 2.006229, 1, 0, 0.9294118, 1,
0.9832774, 0.4434034, 1.892198, 1, 0, 0.9254902, 1,
0.9834411, -0.7144811, 2.633706, 1, 0, 0.9176471, 1,
0.9868959, 0.3745103, -0.8090296, 1, 0, 0.9137255, 1,
0.9897596, -1.069268, 3.534995, 1, 0, 0.9058824, 1,
0.9901877, -0.3808637, 0.2111129, 1, 0, 0.9019608, 1,
0.9929585, 1.708559, -0.8272793, 1, 0, 0.8941177, 1,
0.9977488, 1.881646, 0.6116358, 1, 0, 0.8862745, 1,
1.007945, -1.366575, 1.428548, 1, 0, 0.8823529, 1,
1.008336, 0.4327444, -0.9739128, 1, 0, 0.8745098, 1,
1.010992, 1.433593, 0.5081273, 1, 0, 0.8705882, 1,
1.013826, -0.0967917, 0.8118376, 1, 0, 0.8627451, 1,
1.017785, 0.6866578, 1.137933, 1, 0, 0.8588235, 1,
1.024263, -0.37676, 1.105034, 1, 0, 0.8509804, 1,
1.025479, -1.087998, 2.936459, 1, 0, 0.8470588, 1,
1.028574, -1.365134, 1.972086, 1, 0, 0.8392157, 1,
1.047723, -0.3823494, 3.893959, 1, 0, 0.8352941, 1,
1.059641, 0.1004834, 3.653007, 1, 0, 0.827451, 1,
1.060185, 1.149718, 0.325026, 1, 0, 0.8235294, 1,
1.06397, -0.9357678, 2.249112, 1, 0, 0.8156863, 1,
1.067985, -0.6157508, 1.642495, 1, 0, 0.8117647, 1,
1.069069, -0.2270905, 0.8974256, 1, 0, 0.8039216, 1,
1.073327, -0.09043688, 0.9820046, 1, 0, 0.7960784, 1,
1.084937, -0.2845013, 1.24207, 1, 0, 0.7921569, 1,
1.089625, 1.582124, 0.06918919, 1, 0, 0.7843137, 1,
1.09421, 0.4284347, 0.695735, 1, 0, 0.7803922, 1,
1.095179, 2.069538, 0.9203405, 1, 0, 0.772549, 1,
1.10679, -1.318988, 0.9240179, 1, 0, 0.7686275, 1,
1.117921, 0.7418295, 1.605244, 1, 0, 0.7607843, 1,
1.120754, 0.4692304, 1.330045, 1, 0, 0.7568628, 1,
1.126905, -1.288438, 1.873763, 1, 0, 0.7490196, 1,
1.126968, 0.5314028, 0.8778363, 1, 0, 0.7450981, 1,
1.136541, -0.1982302, 1.860298, 1, 0, 0.7372549, 1,
1.140876, -0.2127136, 1.693144, 1, 0, 0.7333333, 1,
1.143218, -0.2446297, 2.059037, 1, 0, 0.7254902, 1,
1.160688, 1.506162, 0.3116801, 1, 0, 0.7215686, 1,
1.162767, 0.07696679, 2.937447, 1, 0, 0.7137255, 1,
1.174467, 1.331173, 0.05481153, 1, 0, 0.7098039, 1,
1.182864, -0.4661787, 3.272709, 1, 0, 0.7019608, 1,
1.183288, -0.8132951, 1.933905, 1, 0, 0.6941177, 1,
1.190952, 1.557609, 0.4093942, 1, 0, 0.6901961, 1,
1.201667, 0.02220736, 0.7207879, 1, 0, 0.682353, 1,
1.206208, -0.1429269, 2.008529, 1, 0, 0.6784314, 1,
1.206362, 0.6704159, 0.8279455, 1, 0, 0.6705883, 1,
1.224084, 0.9784201, 1.075815, 1, 0, 0.6666667, 1,
1.228117, -0.3243799, 0.9828478, 1, 0, 0.6588235, 1,
1.243089, 0.7495686, -0.2537957, 1, 0, 0.654902, 1,
1.243341, 1.033583, -0.5464831, 1, 0, 0.6470588, 1,
1.247125, 2.260476, 1.01473, 1, 0, 0.6431373, 1,
1.248503, 0.7539837, 0.9012281, 1, 0, 0.6352941, 1,
1.250207, -0.5037525, 1.790692, 1, 0, 0.6313726, 1,
1.252686, 0.9548196, 1.951867, 1, 0, 0.6235294, 1,
1.255032, -1.454219, 1.902736, 1, 0, 0.6196079, 1,
1.259269, 0.3837525, 0.4875285, 1, 0, 0.6117647, 1,
1.260781, 0.4454476, 0.9683535, 1, 0, 0.6078432, 1,
1.274549, -1.053256, 3.173352, 1, 0, 0.6, 1,
1.275984, -0.2041754, -0.3023663, 1, 0, 0.5921569, 1,
1.278528, 0.5178899, 0.7740914, 1, 0, 0.5882353, 1,
1.280548, -0.5138394, 1.545879, 1, 0, 0.5803922, 1,
1.280913, -0.6823831, 3.44836, 1, 0, 0.5764706, 1,
1.281591, 0.2173163, -0.1238975, 1, 0, 0.5686275, 1,
1.284231, 0.2599001, 1.434487, 1, 0, 0.5647059, 1,
1.291389, 0.7725746, 1.603647, 1, 0, 0.5568628, 1,
1.298394, -1.165617, 2.882671, 1, 0, 0.5529412, 1,
1.303412, 0.4511741, 1.397476, 1, 0, 0.5450981, 1,
1.315792, 0.8211363, 2.945487, 1, 0, 0.5411765, 1,
1.317571, -1.006726, 0.08899464, 1, 0, 0.5333334, 1,
1.320565, 0.0539594, 2.780562, 1, 0, 0.5294118, 1,
1.320569, 1.345168, -0.04253127, 1, 0, 0.5215687, 1,
1.321293, 0.3386033, -0.2198664, 1, 0, 0.5176471, 1,
1.338773, -2.754853, 0.7872816, 1, 0, 0.509804, 1,
1.344807, 0.3896802, -0.2068942, 1, 0, 0.5058824, 1,
1.365709, -0.6302665, 0.7878445, 1, 0, 0.4980392, 1,
1.372686, -0.4194748, 1.421936, 1, 0, 0.4901961, 1,
1.374618, -1.677619, 4.165177, 1, 0, 0.4862745, 1,
1.377071, -0.8578406, 2.824816, 1, 0, 0.4784314, 1,
1.380165, -1.637999, 1.007561, 1, 0, 0.4745098, 1,
1.384178, 0.03854127, 0.9692261, 1, 0, 0.4666667, 1,
1.384276, 0.8336489, -0.2732311, 1, 0, 0.4627451, 1,
1.394068, 0.2812986, 1.790336, 1, 0, 0.454902, 1,
1.397353, 0.5150849, 1.055071, 1, 0, 0.4509804, 1,
1.397693, 0.7937642, 1.381123, 1, 0, 0.4431373, 1,
1.40447, 0.107037, 1.478652, 1, 0, 0.4392157, 1,
1.413888, -0.3493986, 2.874552, 1, 0, 0.4313726, 1,
1.437035, -0.9567458, 3.374285, 1, 0, 0.427451, 1,
1.442115, 2.049397, -1.059717, 1, 0, 0.4196078, 1,
1.449637, -1.280466, 3.345424, 1, 0, 0.4156863, 1,
1.451713, -0.4925487, 2.320521, 1, 0, 0.4078431, 1,
1.46218, -0.7690189, 1.472289, 1, 0, 0.4039216, 1,
1.46905, -1.061076, 2.675559, 1, 0, 0.3960784, 1,
1.471821, 0.01889767, 1.549, 1, 0, 0.3882353, 1,
1.480567, -1.712095, 3.777352, 1, 0, 0.3843137, 1,
1.484402, 1.319875, 1.545161, 1, 0, 0.3764706, 1,
1.485628, -1.021289, 1.69922, 1, 0, 0.372549, 1,
1.487155, -1.532985, 3.219314, 1, 0, 0.3647059, 1,
1.491449, 1.343616, 0.9374478, 1, 0, 0.3607843, 1,
1.500345, -0.06215168, 3.817446, 1, 0, 0.3529412, 1,
1.502134, 1.178565, 0.3679148, 1, 0, 0.3490196, 1,
1.51223, 1.299461, 0.07609349, 1, 0, 0.3411765, 1,
1.516819, -0.8059365, 2.196927, 1, 0, 0.3372549, 1,
1.519574, -0.1527325, 3.42961, 1, 0, 0.3294118, 1,
1.542372, 1.900776, -0.3222571, 1, 0, 0.3254902, 1,
1.589476, -0.7083737, 2.935616, 1, 0, 0.3176471, 1,
1.612159, -1.229422, 0.9205248, 1, 0, 0.3137255, 1,
1.61804, 1.715207, 1.674308, 1, 0, 0.3058824, 1,
1.621341, 0.4722432, 1.777499, 1, 0, 0.2980392, 1,
1.631836, -0.5394176, 2.220453, 1, 0, 0.2941177, 1,
1.64794, -0.1349258, 3.163885, 1, 0, 0.2862745, 1,
1.650689, -0.7960583, 3.907193, 1, 0, 0.282353, 1,
1.654809, 0.9698622, 1.150535, 1, 0, 0.2745098, 1,
1.66429, -0.9415951, 2.9967, 1, 0, 0.2705882, 1,
1.672974, 1.196603, 0.7262227, 1, 0, 0.2627451, 1,
1.67339, 0.4019583, 1.759226, 1, 0, 0.2588235, 1,
1.685014, -0.8056443, 3.544052, 1, 0, 0.2509804, 1,
1.730823, 1.946145, -1.381601, 1, 0, 0.2470588, 1,
1.733876, -0.1811297, 1.11621, 1, 0, 0.2392157, 1,
1.741434, -0.645734, 2.991452, 1, 0, 0.2352941, 1,
1.755737, 1.456996, 0.1720778, 1, 0, 0.227451, 1,
1.759972, 0.8643408, 0.9930578, 1, 0, 0.2235294, 1,
1.765985, -0.2912923, 1.960708, 1, 0, 0.2156863, 1,
1.767385, -0.2515866, -0.6402023, 1, 0, 0.2117647, 1,
1.773575, 0.1125433, 0.4069909, 1, 0, 0.2039216, 1,
1.803232, -0.852594, 1.921589, 1, 0, 0.1960784, 1,
1.855605, -0.149222, 2.642292, 1, 0, 0.1921569, 1,
1.863687, -0.1992812, 0.2030181, 1, 0, 0.1843137, 1,
1.866039, -0.3701555, 0.8798617, 1, 0, 0.1803922, 1,
1.866765, 0.09963891, 3.316497, 1, 0, 0.172549, 1,
1.86816, 1.163076, 0.6364174, 1, 0, 0.1686275, 1,
1.901984, 0.05960791, 2.14762, 1, 0, 0.1607843, 1,
1.904315, -1.19783, 2.025341, 1, 0, 0.1568628, 1,
1.912259, 1.23636, 2.924472, 1, 0, 0.1490196, 1,
1.950591, 2.014304, 1.428845, 1, 0, 0.145098, 1,
1.974231, 1.154861, 2.156449, 1, 0, 0.1372549, 1,
2.039489, 1.127694, 2.422205, 1, 0, 0.1333333, 1,
2.074855, -1.005477, 3.270507, 1, 0, 0.1254902, 1,
2.09059, 1.878423, -0.4849176, 1, 0, 0.1215686, 1,
2.153941, -1.029483, 1.966451, 1, 0, 0.1137255, 1,
2.168351, -1.193779, 4.167193, 1, 0, 0.1098039, 1,
2.189766, 0.60909, 3.198846, 1, 0, 0.1019608, 1,
2.201743, -1.159943, 1.795471, 1, 0, 0.09411765, 1,
2.217863, 1.173196, 0.6294999, 1, 0, 0.09019608, 1,
2.240183, 0.1277366, 0.1166518, 1, 0, 0.08235294, 1,
2.259906, -1.677687, 2.928335, 1, 0, 0.07843138, 1,
2.275994, -0.3002639, 1.444608, 1, 0, 0.07058824, 1,
2.33289, -0.1284314, 0.7622136, 1, 0, 0.06666667, 1,
2.348728, 0.02711019, 2.139557, 1, 0, 0.05882353, 1,
2.455361, 1.158956, 2.32339, 1, 0, 0.05490196, 1,
2.46326, 1.075369, 1.14338, 1, 0, 0.04705882, 1,
2.493273, 0.4913372, 1.802343, 1, 0, 0.04313726, 1,
2.516451, 0.1190023, 2.002723, 1, 0, 0.03529412, 1,
2.524319, 0.720822, 0.953952, 1, 0, 0.03137255, 1,
2.577522, -0.0003091453, -0.7906194, 1, 0, 0.02352941, 1,
2.598149, -0.1227835, -0.2380541, 1, 0, 0.01960784, 1,
2.654986, -0.09010669, 3.203449, 1, 0, 0.01176471, 1,
2.785363, -0.375832, 1.207459, 1, 0, 0.007843138, 1
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
-0.6973667, -4.165809, -7.294201, 0, -0.5, 0.5, 0.5,
-0.6973667, -4.165809, -7.294201, 1, -0.5, 0.5, 0.5,
-0.6973667, -4.165809, -7.294201, 1, 1.5, 0.5, 0.5,
-0.6973667, -4.165809, -7.294201, 0, 1.5, 0.5, 0.5
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
-5.360742, -0.1975509, -7.294201, 0, -0.5, 0.5, 0.5,
-5.360742, -0.1975509, -7.294201, 1, -0.5, 0.5, 0.5,
-5.360742, -0.1975509, -7.294201, 1, 1.5, 0.5, 0.5,
-5.360742, -0.1975509, -7.294201, 0, 1.5, 0.5, 0.5
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
-5.360742, -4.165809, 0.005751133, 0, -0.5, 0.5, 0.5,
-5.360742, -4.165809, 0.005751133, 1, -0.5, 0.5, 0.5,
-5.360742, -4.165809, 0.005751133, 1, 1.5, 0.5, 0.5,
-5.360742, -4.165809, 0.005751133, 0, 1.5, 0.5, 0.5
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
-4, -3.250057, -5.609597,
2, -3.250057, -5.609597,
-4, -3.250057, -5.609597,
-4, -3.402682, -5.890364,
-3, -3.250057, -5.609597,
-3, -3.402682, -5.890364,
-2, -3.250057, -5.609597,
-2, -3.402682, -5.890364,
-1, -3.250057, -5.609597,
-1, -3.402682, -5.890364,
0, -3.250057, -5.609597,
0, -3.402682, -5.890364,
1, -3.250057, -5.609597,
1, -3.402682, -5.890364,
2, -3.250057, -5.609597,
2, -3.402682, -5.890364
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
"-4",
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
-4, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
-4, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
-4, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
-4, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
-3, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
-3, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
-3, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
-3, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
-2, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
-2, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
-2, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
-2, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
-1, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
-1, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
-1, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
-1, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
0, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
0, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
0, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
0, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
1, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
1, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
1, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
1, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5,
2, -3.707933, -6.451899, 0, -0.5, 0.5, 0.5,
2, -3.707933, -6.451899, 1, -0.5, 0.5, 0.5,
2, -3.707933, -6.451899, 1, 1.5, 0.5, 0.5,
2, -3.707933, -6.451899, 0, 1.5, 0.5, 0.5
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
-4.284578, -3, -5.609597,
-4.284578, 2, -5.609597,
-4.284578, -3, -5.609597,
-4.463939, -3, -5.890364,
-4.284578, -2, -5.609597,
-4.463939, -2, -5.890364,
-4.284578, -1, -5.609597,
-4.463939, -1, -5.890364,
-4.284578, 0, -5.609597,
-4.463939, 0, -5.890364,
-4.284578, 1, -5.609597,
-4.463939, 1, -5.890364,
-4.284578, 2, -5.609597,
-4.463939, 2, -5.890364
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
-4.822659, -3, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, -3, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, -3, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, -3, -6.451899, 0, 1.5, 0.5, 0.5,
-4.822659, -2, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, -2, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, -2, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, -2, -6.451899, 0, 1.5, 0.5, 0.5,
-4.822659, -1, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, -1, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, -1, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, -1, -6.451899, 0, 1.5, 0.5, 0.5,
-4.822659, 0, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, 0, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, 0, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, 0, -6.451899, 0, 1.5, 0.5, 0.5,
-4.822659, 1, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, 1, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, 1, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, 1, -6.451899, 0, 1.5, 0.5, 0.5,
-4.822659, 2, -6.451899, 0, -0.5, 0.5, 0.5,
-4.822659, 2, -6.451899, 1, -0.5, 0.5, 0.5,
-4.822659, 2, -6.451899, 1, 1.5, 0.5, 0.5,
-4.822659, 2, -6.451899, 0, 1.5, 0.5, 0.5
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
-4.284578, -3.250057, -4,
-4.284578, -3.250057, 4,
-4.284578, -3.250057, -4,
-4.463939, -3.402682, -4,
-4.284578, -3.250057, -2,
-4.463939, -3.402682, -2,
-4.284578, -3.250057, 0,
-4.463939, -3.402682, 0,
-4.284578, -3.250057, 2,
-4.463939, -3.402682, 2,
-4.284578, -3.250057, 4,
-4.463939, -3.402682, 4
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
-4.822659, -3.707933, -4, 0, -0.5, 0.5, 0.5,
-4.822659, -3.707933, -4, 1, -0.5, 0.5, 0.5,
-4.822659, -3.707933, -4, 1, 1.5, 0.5, 0.5,
-4.822659, -3.707933, -4, 0, 1.5, 0.5, 0.5,
-4.822659, -3.707933, -2, 0, -0.5, 0.5, 0.5,
-4.822659, -3.707933, -2, 1, -0.5, 0.5, 0.5,
-4.822659, -3.707933, -2, 1, 1.5, 0.5, 0.5,
-4.822659, -3.707933, -2, 0, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 0, 0, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 0, 1, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 0, 1, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 0, 0, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 2, 0, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 2, 1, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 2, 1, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 2, 0, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 4, 0, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 4, 1, -0.5, 0.5, 0.5,
-4.822659, -3.707933, 4, 1, 1.5, 0.5, 0.5,
-4.822659, -3.707933, 4, 0, 1.5, 0.5, 0.5
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
-4.284578, -3.250057, -5.609597,
-4.284578, 2.854955, -5.609597,
-4.284578, -3.250057, 5.621099,
-4.284578, 2.854955, 5.621099,
-4.284578, -3.250057, -5.609597,
-4.284578, -3.250057, 5.621099,
-4.284578, 2.854955, -5.609597,
-4.284578, 2.854955, 5.621099,
-4.284578, -3.250057, -5.609597,
2.889845, -3.250057, -5.609597,
-4.284578, -3.250057, 5.621099,
2.889845, -3.250057, 5.621099,
-4.284578, 2.854955, -5.609597,
2.889845, 2.854955, -5.609597,
-4.284578, 2.854955, 5.621099,
2.889845, 2.854955, 5.621099,
2.889845, -3.250057, -5.609597,
2.889845, 2.854955, -5.609597,
2.889845, -3.250057, 5.621099,
2.889845, 2.854955, 5.621099,
2.889845, -3.250057, -5.609597,
2.889845, -3.250057, 5.621099,
2.889845, 2.854955, -5.609597,
2.889845, 2.854955, 5.621099
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
var radius = 7.827362;
var distance = 34.82482;
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
mvMatrix.translate( 0.6973667, 0.1975509, -0.005751133 );
mvMatrix.scale( 1.179621, 1.386254, 0.7535684 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.82482);
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
flupoxam<-read.table("flupoxam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flupoxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
```

```r
y<-flupoxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
```

```r
z<-flupoxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
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
-4.180096, 0.8776537, -1.780768, 0, 0, 1, 1, 1,
-3.521162, -0.3013739, -0.9197605, 1, 0, 0, 1, 1,
-2.89939, 0.5070595, -2.630933, 1, 0, 0, 1, 1,
-2.496139, 1.158629, -2.728419, 1, 0, 0, 1, 1,
-2.495961, 0.07209332, 0.1646848, 1, 0, 0, 1, 1,
-2.483163, -0.1984295, 0.0575937, 1, 0, 0, 1, 1,
-2.393284, 0.889145, -0.2229583, 0, 0, 0, 1, 1,
-2.38172, 1.689291, -1.409231, 0, 0, 0, 1, 1,
-2.373089, 0.6322813, 0.6791214, 0, 0, 0, 1, 1,
-2.213144, 0.5466518, -2.009948, 0, 0, 0, 1, 1,
-2.189741, 0.01627739, -0.8955485, 0, 0, 0, 1, 1,
-2.142899, 1.248173, -0.6344889, 0, 0, 0, 1, 1,
-2.125013, -1.340258, -1.767783, 0, 0, 0, 1, 1,
-2.078819, 0.6508879, -1.322933, 1, 1, 1, 1, 1,
-2.062058, -0.3400046, -1.582337, 1, 1, 1, 1, 1,
-2.051519, 0.3937097, -0.6476442, 1, 1, 1, 1, 1,
-2.036366, 0.3507103, -0.5175667, 1, 1, 1, 1, 1,
-2.018929, -0.3932613, -1.198113, 1, 1, 1, 1, 1,
-1.955029, 0.02562078, -2.469554, 1, 1, 1, 1, 1,
-1.952715, 0.09226369, 0.05153773, 1, 1, 1, 1, 1,
-1.934503, -0.895463, -2.497265, 1, 1, 1, 1, 1,
-1.927367, -1.601284, -3.227734, 1, 1, 1, 1, 1,
-1.923346, 0.5471103, -2.032515, 1, 1, 1, 1, 1,
-1.92146, -0.04523125, -2.366895, 1, 1, 1, 1, 1,
-1.895512, 0.5385848, -1.149761, 1, 1, 1, 1, 1,
-1.879116, -0.4457164, -1.090781, 1, 1, 1, 1, 1,
-1.839502, 0.6217619, -0.614777, 1, 1, 1, 1, 1,
-1.804633, 0.1863548, -0.3993524, 1, 1, 1, 1, 1,
-1.797569, -0.7623966, -2.188858, 0, 0, 1, 1, 1,
-1.767245, 0.4309213, 0.05424899, 1, 0, 0, 1, 1,
-1.763822, -0.1423606, -3.573586, 1, 0, 0, 1, 1,
-1.758128, -1.44927, -1.150115, 1, 0, 0, 1, 1,
-1.732874, 1.789945, 0.8030561, 1, 0, 0, 1, 1,
-1.732699, -0.9966271, -0.8392915, 1, 0, 0, 1, 1,
-1.721957, -0.7017277, -2.427847, 0, 0, 0, 1, 1,
-1.715585, 1.18509, -1.621525, 0, 0, 0, 1, 1,
-1.700698, 0.2803379, -0.2099214, 0, 0, 0, 1, 1,
-1.692573, 0.8336161, -0.5603039, 0, 0, 0, 1, 1,
-1.691129, 0.008435668, -1.277162, 0, 0, 0, 1, 1,
-1.687183, -0.9715912, -1.993065, 0, 0, 0, 1, 1,
-1.681248, 1.503047, -1.065351, 0, 0, 0, 1, 1,
-1.67848, -0.7525642, -0.4807395, 1, 1, 1, 1, 1,
-1.676788, -0.2409674, 0.3234909, 1, 1, 1, 1, 1,
-1.675211, -0.7089053, -3.158117, 1, 1, 1, 1, 1,
-1.668158, -1.480166, -1.457314, 1, 1, 1, 1, 1,
-1.66281, -0.3064681, -0.7153901, 1, 1, 1, 1, 1,
-1.649436, -0.09945701, 0.4630516, 1, 1, 1, 1, 1,
-1.642916, 0.7565054, -0.0858717, 1, 1, 1, 1, 1,
-1.632135, -1.423308, -2.687943, 1, 1, 1, 1, 1,
-1.631594, -0.04098547, -1.074977, 1, 1, 1, 1, 1,
-1.626328, 0.0374816, -2.111737, 1, 1, 1, 1, 1,
-1.62268, -0.2499183, -1.994279, 1, 1, 1, 1, 1,
-1.603944, 0.9086127, -1.716903, 1, 1, 1, 1, 1,
-1.600785, 0.4805259, 0.183728, 1, 1, 1, 1, 1,
-1.563964, 0.102323, -2.546365, 1, 1, 1, 1, 1,
-1.563361, -0.7556839, -2.42558, 1, 1, 1, 1, 1,
-1.556471, 0.4220304, -2.662353, 0, 0, 1, 1, 1,
-1.531179, -1.568969, -2.091435, 1, 0, 0, 1, 1,
-1.508523, -1.924049, -2.157443, 1, 0, 0, 1, 1,
-1.50255, -0.1857356, -0.6762336, 1, 0, 0, 1, 1,
-1.501928, -0.7579746, -0.8948829, 1, 0, 0, 1, 1,
-1.47306, -1.16031, -0.6087763, 1, 0, 0, 1, 1,
-1.472989, -0.9374052, -2.247306, 0, 0, 0, 1, 1,
-1.457394, -0.002049517, -3.261533, 0, 0, 0, 1, 1,
-1.45648, -2.742599, -1.580103, 0, 0, 0, 1, 1,
-1.446876, -1.167397, -0.6852452, 0, 0, 0, 1, 1,
-1.442875, -0.9962898, -4.483155, 0, 0, 0, 1, 1,
-1.439829, -0.2643245, -2.293734, 0, 0, 0, 1, 1,
-1.439813, -0.1290907, -3.573243, 0, 0, 0, 1, 1,
-1.435054, 0.9102305, -0.005661637, 1, 1, 1, 1, 1,
-1.420395, -1.730964, -3.187508, 1, 1, 1, 1, 1,
-1.418145, 0.5834669, 0.08641736, 1, 1, 1, 1, 1,
-1.417725, 0.6785788, -2.223005, 1, 1, 1, 1, 1,
-1.413938, -0.6360196, -1.946707, 1, 1, 1, 1, 1,
-1.405016, -1.894191, -2.638163, 1, 1, 1, 1, 1,
-1.402256, -0.02268239, -2.291186, 1, 1, 1, 1, 1,
-1.395151, 0.7228705, 0.3302473, 1, 1, 1, 1, 1,
-1.384365, 0.138764, -1.112058, 1, 1, 1, 1, 1,
-1.373166, -0.4258601, -2.677874, 1, 1, 1, 1, 1,
-1.371461, -0.5188208, -2.78812, 1, 1, 1, 1, 1,
-1.364054, -0.008302798, 1.139784, 1, 1, 1, 1, 1,
-1.360579, 0.2399322, -0.6782141, 1, 1, 1, 1, 1,
-1.34896, 0.3500049, -0.09320935, 1, 1, 1, 1, 1,
-1.334241, 2.355181, -0.5070572, 1, 1, 1, 1, 1,
-1.328643, 0.5395523, -0.3416778, 0, 0, 1, 1, 1,
-1.324913, 0.1906697, -0.7749471, 1, 0, 0, 1, 1,
-1.323814, 0.325034, -1.061084, 1, 0, 0, 1, 1,
-1.322814, -1.040754, -2.824553, 1, 0, 0, 1, 1,
-1.321392, 1.111874, -1.279771, 1, 0, 0, 1, 1,
-1.316417, 0.7654207, -1.742713, 1, 0, 0, 1, 1,
-1.315107, 0.7711632, -1.054283, 0, 0, 0, 1, 1,
-1.312543, 0.3485845, -0.965328, 0, 0, 0, 1, 1,
-1.306403, -1.08676, -1.89668, 0, 0, 0, 1, 1,
-1.298783, 0.6149645, -1.069213, 0, 0, 0, 1, 1,
-1.293019, 0.9896573, -1.336327, 0, 0, 0, 1, 1,
-1.285825, -0.07532493, -1.854961, 0, 0, 0, 1, 1,
-1.28411, -2.137085, -2.29717, 0, 0, 0, 1, 1,
-1.262658, 0.5123088, 0.0121425, 1, 1, 1, 1, 1,
-1.262212, 0.6887657, 0.3601876, 1, 1, 1, 1, 1,
-1.256406, 0.184407, -0.01387558, 1, 1, 1, 1, 1,
-1.252565, 0.647297, -2.550033, 1, 1, 1, 1, 1,
-1.244847, -1.181241, -2.541744, 1, 1, 1, 1, 1,
-1.239439, 2.184952, -0.1317625, 1, 1, 1, 1, 1,
-1.236325, 0.5668628, 0.1947323, 1, 1, 1, 1, 1,
-1.234707, 0.1045516, -0.561582, 1, 1, 1, 1, 1,
-1.225872, -0.4506905, -2.636328, 1, 1, 1, 1, 1,
-1.221857, -0.291962, -3.4196, 1, 1, 1, 1, 1,
-1.219971, 0.6411605, -2.478549, 1, 1, 1, 1, 1,
-1.211938, 2.360648, 0.6193661, 1, 1, 1, 1, 1,
-1.200402, 0.2725145, -0.05488217, 1, 1, 1, 1, 1,
-1.19826, 2.152443, 0.1704945, 1, 1, 1, 1, 1,
-1.18816, -0.445678, -2.213944, 1, 1, 1, 1, 1,
-1.184187, -0.9019774, -0.732635, 0, 0, 1, 1, 1,
-1.181714, 0.8031732, -0.1558036, 1, 0, 0, 1, 1,
-1.178131, 1.851892, -0.5573288, 1, 0, 0, 1, 1,
-1.171014, -0.8145098, -3.596179, 1, 0, 0, 1, 1,
-1.141791, -0.02444073, -2.576694, 1, 0, 0, 1, 1,
-1.139634, -0.5309832, -1.907329, 1, 0, 0, 1, 1,
-1.138998, 1.746218, 0.657765, 0, 0, 0, 1, 1,
-1.136982, 2.057161, -0.05593431, 0, 0, 0, 1, 1,
-1.133464, 1.356819, 0.5180227, 0, 0, 0, 1, 1,
-1.13216, 0.7401211, -0.8735059, 0, 0, 0, 1, 1,
-1.12283, -0.4027599, -1.939258, 0, 0, 0, 1, 1,
-1.11947, -0.9887268, -0.8739247, 0, 0, 0, 1, 1,
-1.108131, -1.484194, -1.307702, 0, 0, 0, 1, 1,
-1.10703, -1.417913, -4.080401, 1, 1, 1, 1, 1,
-1.10539, -0.5289378, -3.569407, 1, 1, 1, 1, 1,
-1.104232, 0.3458709, -1.240521, 1, 1, 1, 1, 1,
-1.068191, 0.2598024, -0.3780093, 1, 1, 1, 1, 1,
-1.061997, 1.738935, -0.853963, 1, 1, 1, 1, 1,
-1.061803, 1.46502, -1.393907, 1, 1, 1, 1, 1,
-1.058997, 0.7095802, -0.1877847, 1, 1, 1, 1, 1,
-1.055481, 0.9716917, -0.655296, 1, 1, 1, 1, 1,
-1.053789, -0.7359993, -2.083213, 1, 1, 1, 1, 1,
-1.045152, -0.7345303, -1.87904, 1, 1, 1, 1, 1,
-1.038404, 0.8569635, -0.998126, 1, 1, 1, 1, 1,
-1.035242, -0.1205885, -1.548887, 1, 1, 1, 1, 1,
-1.035167, -0.09658685, -4.202034, 1, 1, 1, 1, 1,
-1.032944, -1.046046, -2.977458, 1, 1, 1, 1, 1,
-1.029954, -0.5537112, -0.8127037, 1, 1, 1, 1, 1,
-1.024893, -0.4163297, -2.158667, 0, 0, 1, 1, 1,
-1.024794, 0.9613579, 0.3318639, 1, 0, 0, 1, 1,
-1.022978, -0.2654587, -3.791137, 1, 0, 0, 1, 1,
-1.02183, 0.9896922, -3.698507, 1, 0, 0, 1, 1,
-1.014677, -0.9414563, -2.94302, 1, 0, 0, 1, 1,
-1.014408, 0.9905516, -1.83032, 1, 0, 0, 1, 1,
-1.012558, 1.221227, 0.7325653, 0, 0, 0, 1, 1,
-1.008055, 0.430685, -1.886533, 0, 0, 0, 1, 1,
-1.001694, -1.613388, -2.949933, 0, 0, 0, 1, 1,
-1.000065, -0.2309508, -3.308535, 0, 0, 0, 1, 1,
-0.9971815, -0.405497, -2.426888, 0, 0, 0, 1, 1,
-0.995081, 0.5609797, -1.752445, 0, 0, 0, 1, 1,
-0.9944402, 1.148594, -0.07356406, 0, 0, 0, 1, 1,
-0.9888088, 1.863017, 0.757126, 1, 1, 1, 1, 1,
-0.9881992, -0.08948816, -0.2489253, 1, 1, 1, 1, 1,
-0.9881551, 0.3971324, -1.184223, 1, 1, 1, 1, 1,
-0.9787999, 0.6851877, -1.220152, 1, 1, 1, 1, 1,
-0.9779248, 0.8838747, -0.8438922, 1, 1, 1, 1, 1,
-0.9764856, -0.8317087, -2.690598, 1, 1, 1, 1, 1,
-0.9735624, -2.433999, -3.135494, 1, 1, 1, 1, 1,
-0.9663528, 1.926438, 0.4941302, 1, 1, 1, 1, 1,
-0.9621192, -2.072361, -4.050591, 1, 1, 1, 1, 1,
-0.9585292, -1.085465, -2.904627, 1, 1, 1, 1, 1,
-0.9509305, 0.5450465, -1.443872, 1, 1, 1, 1, 1,
-0.9495771, 0.1554886, -1.990764, 1, 1, 1, 1, 1,
-0.9456, -0.3207425, -0.7912496, 1, 1, 1, 1, 1,
-0.9378457, -0.4311325, -2.302289, 1, 1, 1, 1, 1,
-0.9347882, -0.6395109, -2.791012, 1, 1, 1, 1, 1,
-0.9283543, 0.7729913, -1.056944, 0, 0, 1, 1, 1,
-0.9272849, 0.1043406, -1.602834, 1, 0, 0, 1, 1,
-0.922422, 1.15869, -1.165007, 1, 0, 0, 1, 1,
-0.9197615, -0.1152968, -1.793177, 1, 0, 0, 1, 1,
-0.9167222, -0.7259008, -1.387975, 1, 0, 0, 1, 1,
-0.91497, 0.5336426, -0.5481726, 1, 0, 0, 1, 1,
-0.9132196, 1.27091, -0.209543, 0, 0, 0, 1, 1,
-0.9123341, -1.796, -3.666028, 0, 0, 0, 1, 1,
-0.9104844, -0.089554, -1.359518, 0, 0, 0, 1, 1,
-0.9100155, 2.446657, 2.273142, 0, 0, 0, 1, 1,
-0.9090998, 0.2880336, -0.5391534, 0, 0, 0, 1, 1,
-0.9038419, 0.404159, -0.2498378, 0, 0, 0, 1, 1,
-0.9012893, 0.1750102, -0.9688228, 0, 0, 0, 1, 1,
-0.8947915, -0.7130724, -0.3605215, 1, 1, 1, 1, 1,
-0.8941732, 1.330317, 0.3166394, 1, 1, 1, 1, 1,
-0.8871892, 0.9397282, 0.2459325, 1, 1, 1, 1, 1,
-0.8788675, 0.1155663, -1.558381, 1, 1, 1, 1, 1,
-0.8751806, 1.30107, 0.3278844, 1, 1, 1, 1, 1,
-0.8729267, -0.2925145, -3.072502, 1, 1, 1, 1, 1,
-0.8627838, -0.6566311, -2.817807, 1, 1, 1, 1, 1,
-0.8430888, -2.099758, -3.625272, 1, 1, 1, 1, 1,
-0.8410597, -0.896901, -0.1934979, 1, 1, 1, 1, 1,
-0.8272523, 1.542444, -0.5207688, 1, 1, 1, 1, 1,
-0.8191421, -0.6903719, -2.25859, 1, 1, 1, 1, 1,
-0.8130439, -0.1384805, -2.649128, 1, 1, 1, 1, 1,
-0.8126408, -0.8396819, -3.241966, 1, 1, 1, 1, 1,
-0.8081166, -0.8095235, -2.1915, 1, 1, 1, 1, 1,
-0.8063138, 1.665564, -0.5197623, 1, 1, 1, 1, 1,
-0.8029064, 0.2459802, -1.721731, 0, 0, 1, 1, 1,
-0.7986868, -0.727143, -0.782295, 1, 0, 0, 1, 1,
-0.798583, 1.725123, -0.3712282, 1, 0, 0, 1, 1,
-0.7960985, -0.6844225, -1.831442, 1, 0, 0, 1, 1,
-0.7940592, -0.1172001, -2.187292, 1, 0, 0, 1, 1,
-0.7939331, 1.317871, 0.7512926, 1, 0, 0, 1, 1,
-0.790796, -1.074158, -1.236693, 0, 0, 0, 1, 1,
-0.7895381, 0.8914389, -1.094769, 0, 0, 0, 1, 1,
-0.7797362, 0.9258616, -1.536941, 0, 0, 0, 1, 1,
-0.779711, -1.551234, -1.938767, 0, 0, 0, 1, 1,
-0.7785239, -0.9606787, -0.0952967, 0, 0, 0, 1, 1,
-0.7754274, -2.009699, -4.214888, 0, 0, 0, 1, 1,
-0.7752647, 1.195198, -2.437979, 0, 0, 0, 1, 1,
-0.7742627, 0.381892, -1.353876, 1, 1, 1, 1, 1,
-0.7738866, 1.546551, 1.030514, 1, 1, 1, 1, 1,
-0.7715253, 0.3652217, -1.45004, 1, 1, 1, 1, 1,
-0.7682558, 0.7451571, -1.645027, 1, 1, 1, 1, 1,
-0.7649872, 0.5656678, -1.591349, 1, 1, 1, 1, 1,
-0.7636546, -0.7795615, -2.451335, 1, 1, 1, 1, 1,
-0.7515461, -0.5282284, -1.929709, 1, 1, 1, 1, 1,
-0.7495586, -1.131478, -2.342281, 1, 1, 1, 1, 1,
-0.7487379, -0.2144106, -2.436406, 1, 1, 1, 1, 1,
-0.7473304, -0.5798368, -2.767867, 1, 1, 1, 1, 1,
-0.7465954, 1.284911, -0.9875969, 1, 1, 1, 1, 1,
-0.7446005, -0.2685665, -0.05307185, 1, 1, 1, 1, 1,
-0.7442919, 0.8210585, 1.994918, 1, 1, 1, 1, 1,
-0.7343698, -0.07449201, -0.4854969, 1, 1, 1, 1, 1,
-0.7324027, -0.8962368, -2.258241, 1, 1, 1, 1, 1,
-0.7296605, 0.9389371, 0.2889929, 0, 0, 1, 1, 1,
-0.7293623, -0.3958753, -3.333282, 1, 0, 0, 1, 1,
-0.7290139, 0.4054574, -0.7699702, 1, 0, 0, 1, 1,
-0.7167688, -1.427758, -2.826245, 1, 0, 0, 1, 1,
-0.7166811, -1.495547, -3.249269, 1, 0, 0, 1, 1,
-0.7166174, -0.7374929, -1.856537, 1, 0, 0, 1, 1,
-0.7124216, 0.6081622, 0.01287754, 0, 0, 0, 1, 1,
-0.7085944, 1.473177, 0.2285625, 0, 0, 0, 1, 1,
-0.7010089, -0.2832543, -2.083524, 0, 0, 0, 1, 1,
-0.6989194, 0.1131844, 0.1753318, 0, 0, 0, 1, 1,
-0.6987531, 0.1285695, -0.7674621, 0, 0, 0, 1, 1,
-0.6908529, 0.441802, 0.0249489, 0, 0, 0, 1, 1,
-0.6906781, -1.016971, -2.924538, 0, 0, 0, 1, 1,
-0.6897852, 0.8733983, -0.01375039, 1, 1, 1, 1, 1,
-0.6877748, -2.182914, -3.246821, 1, 1, 1, 1, 1,
-0.6830151, 0.5803354, -1.143755, 1, 1, 1, 1, 1,
-0.6826634, 0.5261715, -1.471215, 1, 1, 1, 1, 1,
-0.6823803, -1.412688, -2.041372, 1, 1, 1, 1, 1,
-0.6807413, 0.7687884, -2.605118, 1, 1, 1, 1, 1,
-0.6775956, -0.6996396, -0.9238353, 1, 1, 1, 1, 1,
-0.676652, -1.543373, -2.124995, 1, 1, 1, 1, 1,
-0.6746719, -0.4490103, -0.8331488, 1, 1, 1, 1, 1,
-0.6717442, -0.5669916, -3.088093, 1, 1, 1, 1, 1,
-0.6704044, 0.2585605, -2.359373, 1, 1, 1, 1, 1,
-0.6641952, -1.035905, -3.07437, 1, 1, 1, 1, 1,
-0.6613545, -1.436989, -3.282194, 1, 1, 1, 1, 1,
-0.6610941, -2.300341, -3.539379, 1, 1, 1, 1, 1,
-0.6607951, 0.6705114, 0.2604922, 1, 1, 1, 1, 1,
-0.660163, -2.216531, -2.377058, 0, 0, 1, 1, 1,
-0.6587105, -0.3350743, -1.532175, 1, 0, 0, 1, 1,
-0.6565546, 0.0784099, -0.05547574, 1, 0, 0, 1, 1,
-0.6512543, 0.8014165, -0.5309134, 1, 0, 0, 1, 1,
-0.6511559, -2.54908, -2.321842, 1, 0, 0, 1, 1,
-0.6502354, -1.552657, -2.27988, 1, 0, 0, 1, 1,
-0.6477021, 1.600545, -0.2537425, 0, 0, 0, 1, 1,
-0.6406684, -0.5298662, -2.91458, 0, 0, 0, 1, 1,
-0.6361369, 0.8466765, 2.075287, 0, 0, 0, 1, 1,
-0.635139, 0.7748538, -1.9814, 0, 0, 0, 1, 1,
-0.6328112, 0.7397245, -1.15121, 0, 0, 0, 1, 1,
-0.6291808, -1.730439, -2.941654, 0, 0, 0, 1, 1,
-0.61948, 0.4654017, -1.26685, 0, 0, 0, 1, 1,
-0.6091231, 0.6700818, 0.1647774, 1, 1, 1, 1, 1,
-0.6059356, 0.436928, -0.06942801, 1, 1, 1, 1, 1,
-0.6046712, 0.5535756, -0.6970731, 1, 1, 1, 1, 1,
-0.6004403, 1.841131, -1.330392, 1, 1, 1, 1, 1,
-0.5947989, 0.03003191, -3.762142, 1, 1, 1, 1, 1,
-0.5935379, 1.640224, 0.9175918, 1, 1, 1, 1, 1,
-0.586637, 0.8450157, 0.6354055, 1, 1, 1, 1, 1,
-0.5840757, 1.153464, -1.416927, 1, 1, 1, 1, 1,
-0.583065, 1.566382, -1.190439, 1, 1, 1, 1, 1,
-0.5782217, 1.109221, -1.726969, 1, 1, 1, 1, 1,
-0.5735813, 2.231364, -2.194672, 1, 1, 1, 1, 1,
-0.5716695, 0.3558339, 0.9335989, 1, 1, 1, 1, 1,
-0.5706901, -0.8028447, -3.990869, 1, 1, 1, 1, 1,
-0.5697066, -0.4363658, -2.130066, 1, 1, 1, 1, 1,
-0.5619383, -1.555356, -1.97449, 1, 1, 1, 1, 1,
-0.5539818, -1.50494, -3.081505, 0, 0, 1, 1, 1,
-0.5536465, 0.1355451, -1.840489, 1, 0, 0, 1, 1,
-0.5533746, -1.183236, -1.778342, 1, 0, 0, 1, 1,
-0.5517315, 0.6572936, 0.958348, 1, 0, 0, 1, 1,
-0.5497748, -3.161149, -4.207044, 1, 0, 0, 1, 1,
-0.5467935, -0.6528208, -2.523106, 1, 0, 0, 1, 1,
-0.5447689, -0.4310907, -1.256677, 0, 0, 0, 1, 1,
-0.5439106, -0.8854843, -3.433944, 0, 0, 0, 1, 1,
-0.5380951, -0.9782456, -0.6004403, 0, 0, 0, 1, 1,
-0.5368723, -1.497949, -0.3979751, 0, 0, 0, 1, 1,
-0.5293356, 1.823893, -1.038233, 0, 0, 0, 1, 1,
-0.5254044, -1.828035, -3.685049, 0, 0, 0, 1, 1,
-0.5230001, 1.047467, -0.1795844, 0, 0, 0, 1, 1,
-0.5217194, -1.381341, -1.496767, 1, 1, 1, 1, 1,
-0.5155805, 2.289005, 0.5350792, 1, 1, 1, 1, 1,
-0.5107955, -0.9223427, -3.176984, 1, 1, 1, 1, 1,
-0.4895188, 0.4246202, -1.095829, 1, 1, 1, 1, 1,
-0.4894039, -1.894331, -3.081255, 1, 1, 1, 1, 1,
-0.4890335, -0.9664724, -4.100821, 1, 1, 1, 1, 1,
-0.4822115, -0.9232122, -1.661973, 1, 1, 1, 1, 1,
-0.4804624, -0.4425996, -1.816608, 1, 1, 1, 1, 1,
-0.4801324, -1.143654, -1.173161, 1, 1, 1, 1, 1,
-0.4796094, -0.752202, -1.453867, 1, 1, 1, 1, 1,
-0.4772959, 0.2371838, 0.5746836, 1, 1, 1, 1, 1,
-0.4756572, 0.1620065, -1.53558, 1, 1, 1, 1, 1,
-0.4750555, 0.2902564, 0.2738825, 1, 1, 1, 1, 1,
-0.4733534, 0.248179, -0.5484813, 1, 1, 1, 1, 1,
-0.469118, -1.33359, -2.162974, 1, 1, 1, 1, 1,
-0.4690524, -0.2580737, 0.02288069, 0, 0, 1, 1, 1,
-0.4657897, 1.981626, -0.4229756, 1, 0, 0, 1, 1,
-0.459816, 1.779233, 2.497224, 1, 0, 0, 1, 1,
-0.4588484, -0.6324641, -3.154297, 1, 0, 0, 1, 1,
-0.4585027, -1.317244, -0.5938452, 1, 0, 0, 1, 1,
-0.4537843, -0.8842009, -3.414352, 1, 0, 0, 1, 1,
-0.4515802, -0.6319299, -2.37425, 0, 0, 0, 1, 1,
-0.451413, -0.9776778, -1.245079, 0, 0, 0, 1, 1,
-0.451229, -0.656683, -5.11785, 0, 0, 0, 1, 1,
-0.4472754, -0.1946265, 0.7132443, 0, 0, 0, 1, 1,
-0.4471866, -1.344195, -2.396101, 0, 0, 0, 1, 1,
-0.4458109, 0.06258658, -2.505758, 0, 0, 0, 1, 1,
-0.4438297, 0.5636771, -1.031799, 0, 0, 0, 1, 1,
-0.4435681, 0.9459841, 0.2219115, 1, 1, 1, 1, 1,
-0.4432469, -0.4002706, -1.788799, 1, 1, 1, 1, 1,
-0.4406371, -0.3464187, -1.629524, 1, 1, 1, 1, 1,
-0.4303492, 0.8771257, -0.7339275, 1, 1, 1, 1, 1,
-0.4295796, 1.64904, -0.1225991, 1, 1, 1, 1, 1,
-0.4228651, -0.02624269, -3.645629, 1, 1, 1, 1, 1,
-0.4216831, -0.39294, -4.367743, 1, 1, 1, 1, 1,
-0.4174559, -0.2172551, -0.9374106, 1, 1, 1, 1, 1,
-0.4173774, -0.5745328, -1.068118, 1, 1, 1, 1, 1,
-0.4126214, -0.2482511, -3.863824, 1, 1, 1, 1, 1,
-0.4120247, -0.24377, -2.732649, 1, 1, 1, 1, 1,
-0.4094833, -0.3276724, -3.503375, 1, 1, 1, 1, 1,
-0.4044755, -1.373768, -2.29234, 1, 1, 1, 1, 1,
-0.4042395, 1.275135, -0.4375998, 1, 1, 1, 1, 1,
-0.3965545, -0.3810551, -2.934173, 1, 1, 1, 1, 1,
-0.3961898, 0.03008126, -0.9216678, 0, 0, 1, 1, 1,
-0.3904199, 0.4913785, -1.039594, 1, 0, 0, 1, 1,
-0.3895029, 0.1760622, -2.520037, 1, 0, 0, 1, 1,
-0.3891708, 0.8560307, -0.1118501, 1, 0, 0, 1, 1,
-0.3868204, 0.1505348, -0.8622704, 1, 0, 0, 1, 1,
-0.3853792, 0.05413862, -1.492451, 1, 0, 0, 1, 1,
-0.3851395, 1.362565, -0.6013597, 0, 0, 0, 1, 1,
-0.3834611, 0.1255485, -0.6251188, 0, 0, 0, 1, 1,
-0.378314, 1.482132, -0.7743071, 0, 0, 0, 1, 1,
-0.3772796, -0.4573107, -1.116329, 0, 0, 0, 1, 1,
-0.3768078, 1.599577, 1.165594, 0, 0, 0, 1, 1,
-0.3757263, -1.069096, -0.606113, 0, 0, 0, 1, 1,
-0.3715794, -0.239749, -2.584204, 0, 0, 0, 1, 1,
-0.3714675, 1.41914, 1.329331, 1, 1, 1, 1, 1,
-0.3685901, 0.621182, -0.6563621, 1, 1, 1, 1, 1,
-0.366299, 0.2807179, -1.223679, 1, 1, 1, 1, 1,
-0.3651141, -0.4725906, -2.433987, 1, 1, 1, 1, 1,
-0.3645236, -1.701797, -1.95608, 1, 1, 1, 1, 1,
-0.3606971, 0.6552587, -1.363544, 1, 1, 1, 1, 1,
-0.3600928, 1.643678, 0.2076745, 1, 1, 1, 1, 1,
-0.356852, -1.317497, -3.332671, 1, 1, 1, 1, 1,
-0.3551497, 0.6827543, -1.294806, 1, 1, 1, 1, 1,
-0.3495339, -0.5907014, -3.809223, 1, 1, 1, 1, 1,
-0.3486849, -0.5610025, -2.571267, 1, 1, 1, 1, 1,
-0.344633, -0.1913573, -3.798286, 1, 1, 1, 1, 1,
-0.3419175, -0.727951, -2.518353, 1, 1, 1, 1, 1,
-0.3406346, 0.8878898, -0.6725829, 1, 1, 1, 1, 1,
-0.3402895, 2.623531, 0.2376894, 1, 1, 1, 1, 1,
-0.339825, 0.8514946, -0.3479228, 0, 0, 1, 1, 1,
-0.3358655, -0.218605, -0.98154, 1, 0, 0, 1, 1,
-0.3354897, -1.554585, -2.896832, 1, 0, 0, 1, 1,
-0.3346061, -0.4381059, -3.663594, 1, 0, 0, 1, 1,
-0.3323532, 0.8658662, -0.9603196, 1, 0, 0, 1, 1,
-0.3284819, -0.3716215, -1.82209, 1, 0, 0, 1, 1,
-0.3283973, -1.077935, -4.06087, 0, 0, 0, 1, 1,
-0.3247313, 0.3763774, -1.332369, 0, 0, 0, 1, 1,
-0.3214075, -0.9445668, -3.1844, 0, 0, 0, 1, 1,
-0.3198761, 0.2498923, -0.3058997, 0, 0, 0, 1, 1,
-0.3136302, 0.9050543, -0.2093161, 0, 0, 0, 1, 1,
-0.3131745, -1.161041, -3.519596, 0, 0, 0, 1, 1,
-0.3128296, -0.8569773, -3.125497, 0, 0, 0, 1, 1,
-0.3126538, 0.7381189, 0.3771342, 1, 1, 1, 1, 1,
-0.3125338, -1.318725, -3.209427, 1, 1, 1, 1, 1,
-0.312007, 0.8309643, -1.551016, 1, 1, 1, 1, 1,
-0.307235, -1.059103, -3.613821, 1, 1, 1, 1, 1,
-0.3018126, 1.420968, 0.3966062, 1, 1, 1, 1, 1,
-0.2961293, -0.5144878, -1.352243, 1, 1, 1, 1, 1,
-0.2915259, 0.7614469, -0.06192563, 1, 1, 1, 1, 1,
-0.29018, -0.4459847, -3.762861, 1, 1, 1, 1, 1,
-0.2884152, 0.8311524, -0.2222615, 1, 1, 1, 1, 1,
-0.2876951, -2.444453, -0.9027264, 1, 1, 1, 1, 1,
-0.2773682, -0.1556165, -2.25786, 1, 1, 1, 1, 1,
-0.2738313, 2.0788, 0.2246997, 1, 1, 1, 1, 1,
-0.2704689, 1.039915, -0.2850794, 1, 1, 1, 1, 1,
-0.2698296, -1.373136, -2.936135, 1, 1, 1, 1, 1,
-0.2695313, -1.090844, -3.806525, 1, 1, 1, 1, 1,
-0.2684295, -0.4420849, -2.854153, 0, 0, 1, 1, 1,
-0.2658666, 0.3216763, -1.509037, 1, 0, 0, 1, 1,
-0.2627326, 0.1943105, -2.298869, 1, 0, 0, 1, 1,
-0.260332, -0.7712955, -1.148642, 1, 0, 0, 1, 1,
-0.2593196, -0.168434, -3.219956, 1, 0, 0, 1, 1,
-0.2525699, -0.4453457, -2.771347, 1, 0, 0, 1, 1,
-0.2484515, 0.6931766, -1.637056, 0, 0, 0, 1, 1,
-0.2437386, -1.236632, -4.403038, 0, 0, 0, 1, 1,
-0.2434803, 0.3689035, -1.652665, 0, 0, 0, 1, 1,
-0.2432242, -0.01227116, -3.028653, 0, 0, 0, 1, 1,
-0.2431823, 0.3082666, -1.57275, 0, 0, 0, 1, 1,
-0.2426387, -0.08155666, -3.019598, 0, 0, 0, 1, 1,
-0.2359985, -1.908556, -3.278801, 0, 0, 0, 1, 1,
-0.2341914, 0.1788093, -1.148249, 1, 1, 1, 1, 1,
-0.2248015, 1.211872, 0.1432015, 1, 1, 1, 1, 1,
-0.2243988, -0.558171, -3.72555, 1, 1, 1, 1, 1,
-0.2231324, -1.86044, -3.399533, 1, 1, 1, 1, 1,
-0.2162355, 0.1886812, -1.207421, 1, 1, 1, 1, 1,
-0.2121612, 1.370983, 1.020824, 1, 1, 1, 1, 1,
-0.2099898, -0.05692084, -1.508562, 1, 1, 1, 1, 1,
-0.208487, -0.9027577, -2.51373, 1, 1, 1, 1, 1,
-0.2069752, -0.3896302, -2.160306, 1, 1, 1, 1, 1,
-0.2068671, 1.032678, 0.04113053, 1, 1, 1, 1, 1,
-0.205478, -0.3649668, -2.026851, 1, 1, 1, 1, 1,
-0.2033005, -0.4832788, -3.737812, 1, 1, 1, 1, 1,
-0.1997021, -0.4877458, -2.958034, 1, 1, 1, 1, 1,
-0.1951128, 0.4444929, -1.378245, 1, 1, 1, 1, 1,
-0.1943288, -1.013686, -3.421051, 1, 1, 1, 1, 1,
-0.1926653, -0.3447975, -2.294743, 0, 0, 1, 1, 1,
-0.1872468, 1.646351, -1.121127, 1, 0, 0, 1, 1,
-0.1859524, 1.501886, -0.8847245, 1, 0, 0, 1, 1,
-0.1841934, -0.9179921, -2.011846, 1, 0, 0, 1, 1,
-0.1741719, 0.9364155, 1.400999, 1, 0, 0, 1, 1,
-0.1695248, 0.2741075, -0.06793641, 1, 0, 0, 1, 1,
-0.1668138, 1.47802, 0.9942856, 0, 0, 0, 1, 1,
-0.1659077, -1.554304, -2.310808, 0, 0, 0, 1, 1,
-0.1652936, 2.16233, 0.9843578, 0, 0, 0, 1, 1,
-0.1582517, -0.05579919, -1.260021, 0, 0, 0, 1, 1,
-0.1570936, 1.841665, -0.08171795, 0, 0, 0, 1, 1,
-0.1558159, -1.270163, -1.531553, 0, 0, 0, 1, 1,
-0.154415, -0.7397076, -2.394884, 0, 0, 0, 1, 1,
-0.148349, 0.3840479, 0.07076557, 1, 1, 1, 1, 1,
-0.146756, 0.5751998, -0.2664418, 1, 1, 1, 1, 1,
-0.1449707, -0.4208209, -2.985614, 1, 1, 1, 1, 1,
-0.1409597, 1.278438, -1.076669, 1, 1, 1, 1, 1,
-0.1396697, 0.1195825, -1.907282, 1, 1, 1, 1, 1,
-0.138454, 0.2609904, -2.868513, 1, 1, 1, 1, 1,
-0.1281208, 1.000506, 0.9178925, 1, 1, 1, 1, 1,
-0.1265041, -0.06672347, -3.567505, 1, 1, 1, 1, 1,
-0.1243235, -1.195706, -4.060238, 1, 1, 1, 1, 1,
-0.1213814, 0.1690232, -1.355482, 1, 1, 1, 1, 1,
-0.1191584, 0.7978148, 0.100196, 1, 1, 1, 1, 1,
-0.1094272, 0.0387878, -1.418981, 1, 1, 1, 1, 1,
-0.10812, -0.9158502, -4.104858, 1, 1, 1, 1, 1,
-0.1064922, -0.07214154, -2.186954, 1, 1, 1, 1, 1,
-0.1054854, 0.03609861, -0.4053348, 1, 1, 1, 1, 1,
-0.1036291, 1.415908, 0.8248669, 0, 0, 1, 1, 1,
-0.1034685, 0.5865901, -2.535789, 1, 0, 0, 1, 1,
-0.09985184, -0.5058318, -3.606584, 1, 0, 0, 1, 1,
-0.09674403, 0.3429452, -1.82498, 1, 0, 0, 1, 1,
-0.09652577, -0.7078093, -2.314472, 1, 0, 0, 1, 1,
-0.0949608, -0.8992015, -3.770655, 1, 0, 0, 1, 1,
-0.0945994, -1.108581, -3.367068, 0, 0, 0, 1, 1,
-0.09278822, -0.3723184, -1.775709, 0, 0, 0, 1, 1,
-0.09012114, -0.8091504, -1.382966, 0, 0, 0, 1, 1,
-0.08930913, 0.02175465, -0.6111838, 0, 0, 0, 1, 1,
-0.08747178, -0.1288751, -2.156765, 0, 0, 0, 1, 1,
-0.08667409, 1.481706, -0.8578763, 0, 0, 0, 1, 1,
-0.08534857, 1.364671, 0.9070673, 0, 0, 0, 1, 1,
-0.08332977, 0.1689321, -0.127533, 1, 1, 1, 1, 1,
-0.08304698, 0.3936181, -1.306808, 1, 1, 1, 1, 1,
-0.07893753, -0.01031666, -2.311824, 1, 1, 1, 1, 1,
-0.07590111, 1.119116, 0.7094701, 1, 1, 1, 1, 1,
-0.0692165, 0.538915, -1.698813, 1, 1, 1, 1, 1,
-0.06749097, -0.8875673, -3.205121, 1, 1, 1, 1, 1,
-0.06705812, 0.1559938, -2.630471, 1, 1, 1, 1, 1,
-0.06366774, 1.021242, -1.419484, 1, 1, 1, 1, 1,
-0.06223625, -1.063679, -3.443205, 1, 1, 1, 1, 1,
-0.06081899, -0.09740429, -2.999097, 1, 1, 1, 1, 1,
-0.05893496, 0.6075858, 0.3190551, 1, 1, 1, 1, 1,
-0.05843867, -1.258382, -2.258107, 1, 1, 1, 1, 1,
-0.0577655, -0.4847349, -4.363468, 1, 1, 1, 1, 1,
-0.05646822, 0.3073181, 0.2372783, 1, 1, 1, 1, 1,
-0.05619575, 1.256468, 0.8886368, 1, 1, 1, 1, 1,
-0.05371704, -1.432437, -2.281014, 0, 0, 1, 1, 1,
-0.05243748, 0.8619056, -0.2170232, 1, 0, 0, 1, 1,
-0.04712097, -0.6895039, -4.00274, 1, 0, 0, 1, 1,
-0.04269337, -0.06708452, -3.023544, 1, 0, 0, 1, 1,
-0.04162747, 1.451552, -0.3281378, 1, 0, 0, 1, 1,
-0.03984017, 0.4088561, -0.510874, 1, 0, 0, 1, 1,
-0.03434581, -1.015822, -0.8785427, 0, 0, 0, 1, 1,
-0.03068758, 1.329927, 0.1820624, 0, 0, 0, 1, 1,
-0.03033795, -0.9696279, -3.452241, 0, 0, 0, 1, 1,
-0.03003671, -0.4543047, -3.437034, 0, 0, 0, 1, 1,
-0.02641625, -0.1055978, -3.632394, 0, 0, 0, 1, 1,
-0.02600892, -1.085214, -3.986076, 0, 0, 0, 1, 1,
-0.02578311, -0.02622826, -1.637733, 0, 0, 0, 1, 1,
-0.02181913, -0.4238931, -2.785657, 1, 1, 1, 1, 1,
-0.02168626, 0.09544116, -0.09243485, 1, 1, 1, 1, 1,
-0.02017575, -0.3697893, -4.053518, 1, 1, 1, 1, 1,
-0.01410035, -0.1479285, -4.513892, 1, 1, 1, 1, 1,
-0.01390704, -1.157506, -3.151616, 1, 1, 1, 1, 1,
-0.01306467, -1.098587, -1.813061, 1, 1, 1, 1, 1,
-0.01294254, -0.2581868, -2.989758, 1, 1, 1, 1, 1,
-0.01093012, -0.8923916, -1.789395, 1, 1, 1, 1, 1,
-0.01020786, -0.04515746, -5.446043, 1, 1, 1, 1, 1,
-0.008646447, -0.8859889, -3.71872, 1, 1, 1, 1, 1,
-0.008395024, 0.05891361, -0.4979376, 1, 1, 1, 1, 1,
-0.005670025, -1.874295, -4.113406, 1, 1, 1, 1, 1,
0.004230378, -0.6107201, 2.513841, 1, 1, 1, 1, 1,
0.009443114, 0.1040073, -0.03391135, 1, 1, 1, 1, 1,
0.01067885, -0.4911023, 3.357876, 1, 1, 1, 1, 1,
0.01266645, -0.740974, 3.115171, 0, 0, 1, 1, 1,
0.01749212, -1.497212, 4.71145, 1, 0, 0, 1, 1,
0.0175609, 0.5265526, 1.682665, 1, 0, 0, 1, 1,
0.01894528, 0.1011179, -0.3941903, 1, 0, 0, 1, 1,
0.01911534, -0.4192798, 2.309142, 1, 0, 0, 1, 1,
0.0206664, 1.118814, -0.8844656, 1, 0, 0, 1, 1,
0.02777265, 0.6280864, -0.2182884, 0, 0, 0, 1, 1,
0.02949537, -0.7598972, 2.227039, 0, 0, 0, 1, 1,
0.03584063, -1.553309, 4.213928, 0, 0, 0, 1, 1,
0.03763003, 0.9385766, 2.566396, 0, 0, 0, 1, 1,
0.03927634, 0.06519309, 1.527643, 0, 0, 0, 1, 1,
0.04050322, 1.484611, 0.3362011, 0, 0, 0, 1, 1,
0.04551792, -0.4016561, 2.566284, 0, 0, 0, 1, 1,
0.04811677, -2.178447, 2.683985, 1, 1, 1, 1, 1,
0.04819097, -1.473568, 2.306469, 1, 1, 1, 1, 1,
0.04867519, -1.388399, 5.457545, 1, 1, 1, 1, 1,
0.04994448, 0.8471303, 1.330974, 1, 1, 1, 1, 1,
0.05001228, 0.9430034, -1.875857, 1, 1, 1, 1, 1,
0.05021663, 1.249607, 1.015409, 1, 1, 1, 1, 1,
0.05090826, -0.7782815, 3.820974, 1, 1, 1, 1, 1,
0.05460042, -1.062311, 3.280696, 1, 1, 1, 1, 1,
0.05570224, -0.1176895, 1.243467, 1, 1, 1, 1, 1,
0.06019225, 0.32665, -0.3262347, 1, 1, 1, 1, 1,
0.06160728, -0.9109247, 3.144832, 1, 1, 1, 1, 1,
0.06212049, -0.4483056, 3.566034, 1, 1, 1, 1, 1,
0.06621961, 0.1374875, -0.2283466, 1, 1, 1, 1, 1,
0.07184332, 0.8564324, 0.1446454, 1, 1, 1, 1, 1,
0.07316, -1.710114, 1.141797, 1, 1, 1, 1, 1,
0.07790467, -0.346462, 3.162943, 0, 0, 1, 1, 1,
0.08039622, 0.31988, -1.160053, 1, 0, 0, 1, 1,
0.0806068, 2.079943, 0.229368, 1, 0, 0, 1, 1,
0.08196677, -1.589275, 1.771178, 1, 0, 0, 1, 1,
0.08551495, 0.2737219, 1.834718, 1, 0, 0, 1, 1,
0.08687874, -1.058082, 1.855975, 1, 0, 0, 1, 1,
0.0874254, 2.611995, -0.04570264, 0, 0, 0, 1, 1,
0.08833945, 0.6588717, 0.2555765, 0, 0, 0, 1, 1,
0.08955269, 0.1846473, 1.024238, 0, 0, 0, 1, 1,
0.09018856, 1.320711, 1.372235, 0, 0, 0, 1, 1,
0.09904946, -1.100483, 3.214908, 0, 0, 0, 1, 1,
0.1027617, 1.121696, -0.09646028, 0, 0, 0, 1, 1,
0.106965, -0.1578256, 2.690802, 0, 0, 0, 1, 1,
0.1081835, -1.170878, 2.324737, 1, 1, 1, 1, 1,
0.110069, 0.8429651, 0.28673, 1, 1, 1, 1, 1,
0.1116016, -0.4279514, 4.131355, 1, 1, 1, 1, 1,
0.1136338, 0.8530162, 1.115855, 1, 1, 1, 1, 1,
0.1147278, -0.9875426, 4.132441, 1, 1, 1, 1, 1,
0.1180339, 2.37995, 1.034775, 1, 1, 1, 1, 1,
0.1201032, 0.7627505, -0.02338096, 1, 1, 1, 1, 1,
0.1220242, -1.074472, 1.040158, 1, 1, 1, 1, 1,
0.1260247, -0.3019044, 2.554628, 1, 1, 1, 1, 1,
0.1381611, -0.1689991, -0.2236145, 1, 1, 1, 1, 1,
0.1385979, -0.3867452, 2.48476, 1, 1, 1, 1, 1,
0.1400007, 0.7607058, -0.4334215, 1, 1, 1, 1, 1,
0.1414224, -1.277575, 1.864951, 1, 1, 1, 1, 1,
0.1431938, -0.8157706, 1.992684, 1, 1, 1, 1, 1,
0.1446051, -0.8591178, 3.50976, 1, 1, 1, 1, 1,
0.1473019, -0.2488616, 4.214221, 0, 0, 1, 1, 1,
0.1509715, 0.8057086, -0.6908079, 1, 0, 0, 1, 1,
0.1522329, -1.263206, 2.323492, 1, 0, 0, 1, 1,
0.1523456, -0.4246157, 2.422195, 1, 0, 0, 1, 1,
0.1577384, -0.6039642, 3.06786, 1, 0, 0, 1, 1,
0.1591631, 1.587342, 1.314369, 1, 0, 0, 1, 1,
0.1603133, -1.891313, 3.817588, 0, 0, 0, 1, 1,
0.1629976, 1.447057, 0.3061152, 0, 0, 0, 1, 1,
0.1634679, 0.3108696, 1.362171, 0, 0, 0, 1, 1,
0.1646301, -0.8611253, 3.787772, 0, 0, 0, 1, 1,
0.1657504, -0.187054, 1.613395, 0, 0, 0, 1, 1,
0.1685493, 1.16404, 2.484035, 0, 0, 0, 1, 1,
0.1722298, -0.1603268, 1.429908, 0, 0, 0, 1, 1,
0.1731314, -1.526861, 3.815606, 1, 1, 1, 1, 1,
0.1769736, 0.7372137, 0.3366108, 1, 1, 1, 1, 1,
0.1793996, -1.336908, 3.085106, 1, 1, 1, 1, 1,
0.1798856, 1.767063, -0.7483044, 1, 1, 1, 1, 1,
0.1879259, 0.8154156, 0.498394, 1, 1, 1, 1, 1,
0.1879621, -0.4303695, 3.933428, 1, 1, 1, 1, 1,
0.1885168, -0.4042783, 0.8931268, 1, 1, 1, 1, 1,
0.1938426, -0.3218402, 3.796084, 1, 1, 1, 1, 1,
0.1941219, -0.9504972, 3.52601, 1, 1, 1, 1, 1,
0.1953962, -0.5106881, 1.671806, 1, 1, 1, 1, 1,
0.1972942, 1.670143, -0.006639856, 1, 1, 1, 1, 1,
0.2018823, -0.9921314, 2.449868, 1, 1, 1, 1, 1,
0.2056898, -2.195817, 2.579921, 1, 1, 1, 1, 1,
0.2077236, -0.6423607, 4.369002, 1, 1, 1, 1, 1,
0.2093046, 0.01452811, 3.048563, 1, 1, 1, 1, 1,
0.2107481, -1.577962, 3.896584, 0, 0, 1, 1, 1,
0.2136102, 1.813101, -0.06676286, 1, 0, 0, 1, 1,
0.2159429, -0.2541969, 2.933039, 1, 0, 0, 1, 1,
0.2165718, -0.8357696, 2.523906, 1, 0, 0, 1, 1,
0.2168217, 1.948439, -0.2405428, 1, 0, 0, 1, 1,
0.2204818, 2.766047, 0.1397409, 1, 0, 0, 1, 1,
0.2266207, -0.7566123, 3.81033, 0, 0, 0, 1, 1,
0.2269747, 0.7891794, -0.4193495, 0, 0, 0, 1, 1,
0.2294155, 0.351967, -0.2656491, 0, 0, 0, 1, 1,
0.2315553, 0.1904186, 1.254756, 0, 0, 0, 1, 1,
0.2335759, 0.1049483, 2.350948, 0, 0, 0, 1, 1,
0.2364002, -0.6584776, 3.144677, 0, 0, 0, 1, 1,
0.236454, -0.8477308, 4.213632, 0, 0, 0, 1, 1,
0.2424093, 0.5670304, 0.4854566, 1, 1, 1, 1, 1,
0.2437046, -1.273451, 2.537243, 1, 1, 1, 1, 1,
0.2481808, 0.2457482, 0.866641, 1, 1, 1, 1, 1,
0.2505396, -0.4359269, 1.969711, 1, 1, 1, 1, 1,
0.25197, -1.137686, 3.239502, 1, 1, 1, 1, 1,
0.2566289, 0.7454769, 2.379078, 1, 1, 1, 1, 1,
0.2645622, 0.3088087, 0.03148364, 1, 1, 1, 1, 1,
0.2647963, -2.10019, 1.866225, 1, 1, 1, 1, 1,
0.2656527, 0.3137852, 0.6989232, 1, 1, 1, 1, 1,
0.2665027, 0.8063037, 0.1903251, 1, 1, 1, 1, 1,
0.2668654, -0.5438743, 3.676165, 1, 1, 1, 1, 1,
0.2680537, 0.02363607, 1.751205, 1, 1, 1, 1, 1,
0.270791, 0.5014907, -0.671442, 1, 1, 1, 1, 1,
0.2718334, -0.9930679, 2.858416, 1, 1, 1, 1, 1,
0.2744615, 0.4329009, 1.870852, 1, 1, 1, 1, 1,
0.2802149, 0.1604259, -0.6140191, 0, 0, 1, 1, 1,
0.2829112, 0.3536796, 0.5215642, 1, 0, 0, 1, 1,
0.2834108, 1.257664, -1.422968, 1, 0, 0, 1, 1,
0.2874798, -0.165552, 2.085329, 1, 0, 0, 1, 1,
0.2888211, -0.6720069, 1.178257, 1, 0, 0, 1, 1,
0.2985408, -1.456115, 3.800004, 1, 0, 0, 1, 1,
0.3012235, -1.117351, 2.381935, 0, 0, 0, 1, 1,
0.3027548, -0.6732422, 1.398099, 0, 0, 0, 1, 1,
0.3030216, -0.2033903, 3.469594, 0, 0, 0, 1, 1,
0.3085253, -0.7914899, 3.285352, 0, 0, 0, 1, 1,
0.3109748, -0.05062395, 1.683733, 0, 0, 0, 1, 1,
0.3152794, -0.7022258, 3.392068, 0, 0, 0, 1, 1,
0.3171741, -0.3089626, 2.720135, 0, 0, 0, 1, 1,
0.3210571, 0.1713933, 1.883983, 1, 1, 1, 1, 1,
0.3251043, -0.8157972, 1.902943, 1, 1, 1, 1, 1,
0.3257698, 1.044525, -0.2596532, 1, 1, 1, 1, 1,
0.3266401, 1.1134, -0.5409325, 1, 1, 1, 1, 1,
0.328905, 0.3920455, 0.0993925, 1, 1, 1, 1, 1,
0.3298563, 1.252837, 1.062553, 1, 1, 1, 1, 1,
0.3302077, -1.736431, 3.53299, 1, 1, 1, 1, 1,
0.336816, 0.9072692, -0.4025459, 1, 1, 1, 1, 1,
0.3436911, -1.693181, 1.765185, 1, 1, 1, 1, 1,
0.3496101, -0.4267804, 3.869406, 1, 1, 1, 1, 1,
0.3517112, -0.1381546, 2.691651, 1, 1, 1, 1, 1,
0.3531811, 2.314656, -1.17851, 1, 1, 1, 1, 1,
0.3570586, 0.009433372, 1.907437, 1, 1, 1, 1, 1,
0.3671722, -0.4130087, 3.325737, 1, 1, 1, 1, 1,
0.3687757, -0.2812059, 2.546231, 1, 1, 1, 1, 1,
0.3697135, -0.2229495, 2.595338, 0, 0, 1, 1, 1,
0.3713613, 1.311475, 1.842317, 1, 0, 0, 1, 1,
0.3723298, -0.4116525, 1.994071, 1, 0, 0, 1, 1,
0.3733425, -2.324162, 3.070348, 1, 0, 0, 1, 1,
0.3761413, -1.253008, 2.432507, 1, 0, 0, 1, 1,
0.3762688, 0.7206557, -0.2344243, 1, 0, 0, 1, 1,
0.3766997, -0.07987914, 3.999099, 0, 0, 0, 1, 1,
0.3803788, 0.2605929, 0.5971389, 0, 0, 0, 1, 1,
0.3837885, -1.412908, 3.246498, 0, 0, 0, 1, 1,
0.3885962, -0.7471899, 2.068152, 0, 0, 0, 1, 1,
0.391846, -1.028376, 2.387498, 0, 0, 0, 1, 1,
0.3947118, 0.3911764, 0.7058619, 0, 0, 0, 1, 1,
0.396599, 0.3669762, 0.8221877, 0, 0, 0, 1, 1,
0.3983479, 1.33172, 0.1517523, 1, 1, 1, 1, 1,
0.400501, 0.2268647, 0.04020549, 1, 1, 1, 1, 1,
0.4024573, -0.2734382, 2.203055, 1, 1, 1, 1, 1,
0.4067698, 0.249754, 1.491241, 1, 1, 1, 1, 1,
0.4111693, 0.7572322, 1.982661, 1, 1, 1, 1, 1,
0.4122346, -0.164749, 0.2962354, 1, 1, 1, 1, 1,
0.4150752, -0.848025, 3.522874, 1, 1, 1, 1, 1,
0.4151679, -1.487455, 4.904159, 1, 1, 1, 1, 1,
0.4169407, -0.8783934, 1.143668, 1, 1, 1, 1, 1,
0.4230336, 0.2437211, 1.076849, 1, 1, 1, 1, 1,
0.423438, 1.337658, 1.843226, 1, 1, 1, 1, 1,
0.4292623, 0.3909233, 1.762181, 1, 1, 1, 1, 1,
0.4332849, 1.009059, -0.04087878, 1, 1, 1, 1, 1,
0.4366701, -0.5208024, 3.166893, 1, 1, 1, 1, 1,
0.4406146, 0.1267029, 0.7866721, 1, 1, 1, 1, 1,
0.4425074, 0.03552958, 3.012484, 0, 0, 1, 1, 1,
0.442578, -0.5260594, 3.684234, 1, 0, 0, 1, 1,
0.4494067, 0.281959, -0.2991, 1, 0, 0, 1, 1,
0.454744, 1.280018, -0.3167039, 1, 0, 0, 1, 1,
0.4573623, -1.785408, 3.096716, 1, 0, 0, 1, 1,
0.4580453, -1.410976, 3.504247, 1, 0, 0, 1, 1,
0.459993, 0.09780005, 0.2198615, 0, 0, 0, 1, 1,
0.4633911, -0.03749437, 0.448885, 0, 0, 0, 1, 1,
0.4643733, 1.428506, 0.6032462, 0, 0, 0, 1, 1,
0.4662649, 0.4030725, 0.3743024, 0, 0, 0, 1, 1,
0.4682914, -1.181581, 1.171414, 0, 0, 0, 1, 1,
0.4692983, 0.6581528, -1.053974, 0, 0, 0, 1, 1,
0.4700945, 1.302994, 0.3966576, 0, 0, 0, 1, 1,
0.4726344, -0.4074767, 0.7618459, 1, 1, 1, 1, 1,
0.478285, -0.1665378, 1.358119, 1, 1, 1, 1, 1,
0.4797759, -0.2349228, 2.495788, 1, 1, 1, 1, 1,
0.4821914, 1.286645, 0.1828764, 1, 1, 1, 1, 1,
0.4838891, 0.5257866, 1.614006, 1, 1, 1, 1, 1,
0.4859686, 1.005704, 0.8077816, 1, 1, 1, 1, 1,
0.4861972, 0.04875989, 2.446089, 1, 1, 1, 1, 1,
0.4869316, 1.69473, 1.213837, 1, 1, 1, 1, 1,
0.4891559, -0.01251727, 2.377837, 1, 1, 1, 1, 1,
0.4933167, -1.449033, 2.426926, 1, 1, 1, 1, 1,
0.497337, 1.104247, 0.9274904, 1, 1, 1, 1, 1,
0.4980482, 0.2493276, 2.032423, 1, 1, 1, 1, 1,
0.4985946, -0.07327277, 1.574325, 1, 1, 1, 1, 1,
0.5060889, -0.8389651, 4.751471, 1, 1, 1, 1, 1,
0.5068985, -0.4183565, 3.495611, 1, 1, 1, 1, 1,
0.5092453, 0.2527982, 0.9843798, 0, 0, 1, 1, 1,
0.5093672, -0.2357537, 0.8429571, 1, 0, 0, 1, 1,
0.5102445, -0.9076805, 3.147488, 1, 0, 0, 1, 1,
0.5104847, 1.437078, 0.5728689, 1, 0, 0, 1, 1,
0.5179504, -0.6231133, 3.061502, 1, 0, 0, 1, 1,
0.5204946, -0.5916061, 3.565103, 1, 0, 0, 1, 1,
0.5204968, 2.54072, -0.1282099, 0, 0, 0, 1, 1,
0.5232162, 1.003122, 2.463261, 0, 0, 0, 1, 1,
0.5240136, 0.3487713, 1.206392, 0, 0, 0, 1, 1,
0.5245754, 1.753293, -0.6874752, 0, 0, 0, 1, 1,
0.5249651, -1.792427, 1.642305, 0, 0, 0, 1, 1,
0.5252171, 0.1550796, 1.751725, 0, 0, 0, 1, 1,
0.5256062, 0.4391503, -0.3391766, 0, 0, 0, 1, 1,
0.5288259, 0.5670695, 1.300891, 1, 1, 1, 1, 1,
0.5307594, 0.5530047, 1.626959, 1, 1, 1, 1, 1,
0.5320255, -0.3793265, 2.031304, 1, 1, 1, 1, 1,
0.5338627, -0.5198107, 2.17826, 1, 1, 1, 1, 1,
0.5378067, -1.101624, 2.873637, 1, 1, 1, 1, 1,
0.5384552, -0.4482813, 1.948602, 1, 1, 1, 1, 1,
0.5395283, 0.5316764, 1.297854, 1, 1, 1, 1, 1,
0.5405995, -0.1142972, 1.069674, 1, 1, 1, 1, 1,
0.5427722, 0.9247056, -0.8994855, 1, 1, 1, 1, 1,
0.5447714, 1.124359, 1.803437, 1, 1, 1, 1, 1,
0.5539046, -0.5618669, 3.493327, 1, 1, 1, 1, 1,
0.5556298, -0.5163558, 3.774602, 1, 1, 1, 1, 1,
0.5621068, -0.7683818, 2.74503, 1, 1, 1, 1, 1,
0.5677006, -0.9444086, 1.504352, 1, 1, 1, 1, 1,
0.5689557, 0.4396539, 3.015714, 1, 1, 1, 1, 1,
0.5708954, -0.3986252, 2.216199, 0, 0, 1, 1, 1,
0.5749899, 0.3886246, 0.1664291, 1, 0, 0, 1, 1,
0.5751845, 0.5140726, -0.09453668, 1, 0, 0, 1, 1,
0.584434, 0.8396866, 2.623646, 1, 0, 0, 1, 1,
0.5868556, 0.5022448, -0.2748517, 1, 0, 0, 1, 1,
0.5900652, -1.603485, 2.230221, 1, 0, 0, 1, 1,
0.5911298, -0.147847, 3.236412, 0, 0, 0, 1, 1,
0.5920943, 0.2246099, -0.01716365, 0, 0, 0, 1, 1,
0.5930498, -0.1983416, 1.872971, 0, 0, 0, 1, 1,
0.5944092, -1.244306, 2.505133, 0, 0, 0, 1, 1,
0.597135, -0.1421907, 1.36384, 0, 0, 0, 1, 1,
0.602106, 2.022228, 0.3314025, 0, 0, 0, 1, 1,
0.6193061, 1.245508, 0.4088767, 0, 0, 0, 1, 1,
0.6243194, -0.1214787, 3.606024, 1, 1, 1, 1, 1,
0.625093, -0.5491866, -0.1965785, 1, 1, 1, 1, 1,
0.6378778, -0.3212481, 3.104956, 1, 1, 1, 1, 1,
0.642778, 0.08155139, 0.3739317, 1, 1, 1, 1, 1,
0.6488501, 0.5971642, 0.4317914, 1, 1, 1, 1, 1,
0.6506768, 0.4749487, 1.330037, 1, 1, 1, 1, 1,
0.6520153, 0.5534477, -0.1070588, 1, 1, 1, 1, 1,
0.6525128, -0.162442, 2.674432, 1, 1, 1, 1, 1,
0.66377, 0.4516554, 1.90835, 1, 1, 1, 1, 1,
0.6658139, -0.4179891, 0.03439003, 1, 1, 1, 1, 1,
0.6661014, 0.171349, 1.355647, 1, 1, 1, 1, 1,
0.670643, 0.01811278, 1.244827, 1, 1, 1, 1, 1,
0.6716993, 0.006001553, 0.6115149, 1, 1, 1, 1, 1,
0.672358, 0.3586352, -0.09527004, 1, 1, 1, 1, 1,
0.6756427, 0.04764397, 2.386943, 1, 1, 1, 1, 1,
0.6756584, -0.251241, -0.06306299, 0, 0, 1, 1, 1,
0.6766239, -2.533078, 2.221145, 1, 0, 0, 1, 1,
0.6777704, -0.6535547, 2.0922, 1, 0, 0, 1, 1,
0.6793274, -0.4135947, 3.294088, 1, 0, 0, 1, 1,
0.6807261, -1.518122, 2.301146, 1, 0, 0, 1, 1,
0.6817257, 1.020795, 0.6871285, 1, 0, 0, 1, 1,
0.6874394, -0.4448147, 2.388443, 0, 0, 0, 1, 1,
0.687674, 1.117562, 0.7364511, 0, 0, 0, 1, 1,
0.6888205, 1.23748, 0.6898375, 0, 0, 0, 1, 1,
0.6927615, 1.392498, -1.144415, 0, 0, 0, 1, 1,
0.6983584, 0.5834125, 1.024395, 0, 0, 0, 1, 1,
0.6996451, -1.317721, 0.4868028, 0, 0, 0, 1, 1,
0.7005898, 0.6953686, 1.334928, 0, 0, 0, 1, 1,
0.7007263, -0.7601494, 1.804739, 1, 1, 1, 1, 1,
0.7028424, -1.583169, 3.729738, 1, 1, 1, 1, 1,
0.7067001, -1.046829, 2.067685, 1, 1, 1, 1, 1,
0.7071142, -0.9999709, 2.454549, 1, 1, 1, 1, 1,
0.707541, -0.01684143, 0.05999683, 1, 1, 1, 1, 1,
0.711933, 0.5496778, 0.5839072, 1, 1, 1, 1, 1,
0.7154814, 0.09281272, 3.446021, 1, 1, 1, 1, 1,
0.7158705, 1.170244, 1.082894, 1, 1, 1, 1, 1,
0.7206928, 2.485867, 0.3377486, 1, 1, 1, 1, 1,
0.7256368, 1.195211, 0.7421739, 1, 1, 1, 1, 1,
0.7284915, 1.320415, 1.901549, 1, 1, 1, 1, 1,
0.7370184, 0.1639276, -0.5735241, 1, 1, 1, 1, 1,
0.7427553, 1.127158, 2.136093, 1, 1, 1, 1, 1,
0.7436011, -0.1722255, 2.280739, 1, 1, 1, 1, 1,
0.7491226, -1.478215, 3.189454, 1, 1, 1, 1, 1,
0.7491676, -0.6491889, 1.245203, 0, 0, 1, 1, 1,
0.7528732, -0.4905388, 1.881909, 1, 0, 0, 1, 1,
0.7551169, 1.494223, 0.6778703, 1, 0, 0, 1, 1,
0.7571064, 1.167061, 1.258226, 1, 0, 0, 1, 1,
0.7579374, -0.1252093, 2.229043, 1, 0, 0, 1, 1,
0.7623833, 0.2679281, 1.742164, 1, 0, 0, 1, 1,
0.7704304, 0.5060778, 2.115425, 0, 0, 0, 1, 1,
0.7710793, -0.1257646, 1.798975, 0, 0, 0, 1, 1,
0.7751775, 1.056925, 1.539996, 0, 0, 0, 1, 1,
0.7753889, 2.280917, -0.08454741, 0, 0, 0, 1, 1,
0.7766801, 0.3061652, 2.647857, 0, 0, 0, 1, 1,
0.7816653, -2.110847, 3.16542, 0, 0, 0, 1, 1,
0.7849817, 1.663517, -0.07939188, 0, 0, 0, 1, 1,
0.7864121, -0.1590102, 2.297803, 1, 1, 1, 1, 1,
0.7894385, -0.5173887, 3.252577, 1, 1, 1, 1, 1,
0.7924561, 1.4213, -0.9028969, 1, 1, 1, 1, 1,
0.7932703, 0.3962475, 0.5513147, 1, 1, 1, 1, 1,
0.7933549, -0.18071, 3.049972, 1, 1, 1, 1, 1,
0.7935845, 1.447603, 0.2477063, 1, 1, 1, 1, 1,
0.7936245, -1.33406, 2.120814, 1, 1, 1, 1, 1,
0.7937586, 0.2037089, 2.598284, 1, 1, 1, 1, 1,
0.7972085, -0.6978472, 2.013273, 1, 1, 1, 1, 1,
0.8126989, -1.588868, 3.166398, 1, 1, 1, 1, 1,
0.8152199, 1.724916, 1.086766, 1, 1, 1, 1, 1,
0.8181811, -1.353353, 1.835497, 1, 1, 1, 1, 1,
0.8229078, -0.09306268, 2.699713, 1, 1, 1, 1, 1,
0.826643, -1.429442, 3.305577, 1, 1, 1, 1, 1,
0.8349016, 0.4693261, 0.6411232, 1, 1, 1, 1, 1,
0.836414, -0.4274765, 3.300963, 0, 0, 1, 1, 1,
0.841505, -0.3037783, 1.816887, 1, 0, 0, 1, 1,
0.8443673, -1.303815, 2.668483, 1, 0, 0, 1, 1,
0.850387, -0.6952275, 2.928031, 1, 0, 0, 1, 1,
0.8535286, 0.9553114, 0.7795339, 1, 0, 0, 1, 1,
0.8547475, 0.439025, -0.5036038, 1, 0, 0, 1, 1,
0.8554336, -0.215974, 2.34148, 0, 0, 0, 1, 1,
0.857199, -0.7256893, 3.638865, 0, 0, 0, 1, 1,
0.8575018, 1.647685, 0.2992439, 0, 0, 0, 1, 1,
0.8714965, -0.6952508, 3.569469, 0, 0, 0, 1, 1,
0.8727595, 0.236728, -0.2015359, 0, 0, 0, 1, 1,
0.8729742, 0.353945, -0.06464534, 0, 0, 0, 1, 1,
0.8824843, 0.980638, 0.6157213, 0, 0, 0, 1, 1,
0.8826309, -0.936657, 2.096231, 1, 1, 1, 1, 1,
0.8847087, -0.5255365, 3.03238, 1, 1, 1, 1, 1,
0.8894089, -0.3541484, 2.693207, 1, 1, 1, 1, 1,
0.8962379, -0.1096538, 1.909339, 1, 1, 1, 1, 1,
0.8967237, 1.120706, 0.5993077, 1, 1, 1, 1, 1,
0.8977506, 2.248372, 0.218753, 1, 1, 1, 1, 1,
0.8978357, 0.4245722, 2.894983, 1, 1, 1, 1, 1,
0.9016429, 0.3221911, 0.6488522, 1, 1, 1, 1, 1,
0.9050685, 0.7064571, 0.6575415, 1, 1, 1, 1, 1,
0.9149889, 0.8418443, 1.456112, 1, 1, 1, 1, 1,
0.9161199, 0.8553847, -0.1631856, 1, 1, 1, 1, 1,
0.918196, 0.2648253, 2.053132, 1, 1, 1, 1, 1,
0.9218751, 1.382703, -0.9060534, 1, 1, 1, 1, 1,
0.9268411, 0.1589987, 1.243147, 1, 1, 1, 1, 1,
0.9358616, 0.5061951, 1.808192, 1, 1, 1, 1, 1,
0.9397517, -1.100395, 1.715177, 0, 0, 1, 1, 1,
0.9458911, -0.4068079, 2.023726, 1, 0, 0, 1, 1,
0.9544103, -0.8517326, 3.139028, 1, 0, 0, 1, 1,
0.9562562, 0.7470921, 1.143631, 1, 0, 0, 1, 1,
0.975974, 0.1748305, 1.4543, 1, 0, 0, 1, 1,
0.9821942, -1.215959, 2.006229, 1, 0, 0, 1, 1,
0.9832774, 0.4434034, 1.892198, 0, 0, 0, 1, 1,
0.9834411, -0.7144811, 2.633706, 0, 0, 0, 1, 1,
0.9868959, 0.3745103, -0.8090296, 0, 0, 0, 1, 1,
0.9897596, -1.069268, 3.534995, 0, 0, 0, 1, 1,
0.9901877, -0.3808637, 0.2111129, 0, 0, 0, 1, 1,
0.9929585, 1.708559, -0.8272793, 0, 0, 0, 1, 1,
0.9977488, 1.881646, 0.6116358, 0, 0, 0, 1, 1,
1.007945, -1.366575, 1.428548, 1, 1, 1, 1, 1,
1.008336, 0.4327444, -0.9739128, 1, 1, 1, 1, 1,
1.010992, 1.433593, 0.5081273, 1, 1, 1, 1, 1,
1.013826, -0.0967917, 0.8118376, 1, 1, 1, 1, 1,
1.017785, 0.6866578, 1.137933, 1, 1, 1, 1, 1,
1.024263, -0.37676, 1.105034, 1, 1, 1, 1, 1,
1.025479, -1.087998, 2.936459, 1, 1, 1, 1, 1,
1.028574, -1.365134, 1.972086, 1, 1, 1, 1, 1,
1.047723, -0.3823494, 3.893959, 1, 1, 1, 1, 1,
1.059641, 0.1004834, 3.653007, 1, 1, 1, 1, 1,
1.060185, 1.149718, 0.325026, 1, 1, 1, 1, 1,
1.06397, -0.9357678, 2.249112, 1, 1, 1, 1, 1,
1.067985, -0.6157508, 1.642495, 1, 1, 1, 1, 1,
1.069069, -0.2270905, 0.8974256, 1, 1, 1, 1, 1,
1.073327, -0.09043688, 0.9820046, 1, 1, 1, 1, 1,
1.084937, -0.2845013, 1.24207, 0, 0, 1, 1, 1,
1.089625, 1.582124, 0.06918919, 1, 0, 0, 1, 1,
1.09421, 0.4284347, 0.695735, 1, 0, 0, 1, 1,
1.095179, 2.069538, 0.9203405, 1, 0, 0, 1, 1,
1.10679, -1.318988, 0.9240179, 1, 0, 0, 1, 1,
1.117921, 0.7418295, 1.605244, 1, 0, 0, 1, 1,
1.120754, 0.4692304, 1.330045, 0, 0, 0, 1, 1,
1.126905, -1.288438, 1.873763, 0, 0, 0, 1, 1,
1.126968, 0.5314028, 0.8778363, 0, 0, 0, 1, 1,
1.136541, -0.1982302, 1.860298, 0, 0, 0, 1, 1,
1.140876, -0.2127136, 1.693144, 0, 0, 0, 1, 1,
1.143218, -0.2446297, 2.059037, 0, 0, 0, 1, 1,
1.160688, 1.506162, 0.3116801, 0, 0, 0, 1, 1,
1.162767, 0.07696679, 2.937447, 1, 1, 1, 1, 1,
1.174467, 1.331173, 0.05481153, 1, 1, 1, 1, 1,
1.182864, -0.4661787, 3.272709, 1, 1, 1, 1, 1,
1.183288, -0.8132951, 1.933905, 1, 1, 1, 1, 1,
1.190952, 1.557609, 0.4093942, 1, 1, 1, 1, 1,
1.201667, 0.02220736, 0.7207879, 1, 1, 1, 1, 1,
1.206208, -0.1429269, 2.008529, 1, 1, 1, 1, 1,
1.206362, 0.6704159, 0.8279455, 1, 1, 1, 1, 1,
1.224084, 0.9784201, 1.075815, 1, 1, 1, 1, 1,
1.228117, -0.3243799, 0.9828478, 1, 1, 1, 1, 1,
1.243089, 0.7495686, -0.2537957, 1, 1, 1, 1, 1,
1.243341, 1.033583, -0.5464831, 1, 1, 1, 1, 1,
1.247125, 2.260476, 1.01473, 1, 1, 1, 1, 1,
1.248503, 0.7539837, 0.9012281, 1, 1, 1, 1, 1,
1.250207, -0.5037525, 1.790692, 1, 1, 1, 1, 1,
1.252686, 0.9548196, 1.951867, 0, 0, 1, 1, 1,
1.255032, -1.454219, 1.902736, 1, 0, 0, 1, 1,
1.259269, 0.3837525, 0.4875285, 1, 0, 0, 1, 1,
1.260781, 0.4454476, 0.9683535, 1, 0, 0, 1, 1,
1.274549, -1.053256, 3.173352, 1, 0, 0, 1, 1,
1.275984, -0.2041754, -0.3023663, 1, 0, 0, 1, 1,
1.278528, 0.5178899, 0.7740914, 0, 0, 0, 1, 1,
1.280548, -0.5138394, 1.545879, 0, 0, 0, 1, 1,
1.280913, -0.6823831, 3.44836, 0, 0, 0, 1, 1,
1.281591, 0.2173163, -0.1238975, 0, 0, 0, 1, 1,
1.284231, 0.2599001, 1.434487, 0, 0, 0, 1, 1,
1.291389, 0.7725746, 1.603647, 0, 0, 0, 1, 1,
1.298394, -1.165617, 2.882671, 0, 0, 0, 1, 1,
1.303412, 0.4511741, 1.397476, 1, 1, 1, 1, 1,
1.315792, 0.8211363, 2.945487, 1, 1, 1, 1, 1,
1.317571, -1.006726, 0.08899464, 1, 1, 1, 1, 1,
1.320565, 0.0539594, 2.780562, 1, 1, 1, 1, 1,
1.320569, 1.345168, -0.04253127, 1, 1, 1, 1, 1,
1.321293, 0.3386033, -0.2198664, 1, 1, 1, 1, 1,
1.338773, -2.754853, 0.7872816, 1, 1, 1, 1, 1,
1.344807, 0.3896802, -0.2068942, 1, 1, 1, 1, 1,
1.365709, -0.6302665, 0.7878445, 1, 1, 1, 1, 1,
1.372686, -0.4194748, 1.421936, 1, 1, 1, 1, 1,
1.374618, -1.677619, 4.165177, 1, 1, 1, 1, 1,
1.377071, -0.8578406, 2.824816, 1, 1, 1, 1, 1,
1.380165, -1.637999, 1.007561, 1, 1, 1, 1, 1,
1.384178, 0.03854127, 0.9692261, 1, 1, 1, 1, 1,
1.384276, 0.8336489, -0.2732311, 1, 1, 1, 1, 1,
1.394068, 0.2812986, 1.790336, 0, 0, 1, 1, 1,
1.397353, 0.5150849, 1.055071, 1, 0, 0, 1, 1,
1.397693, 0.7937642, 1.381123, 1, 0, 0, 1, 1,
1.40447, 0.107037, 1.478652, 1, 0, 0, 1, 1,
1.413888, -0.3493986, 2.874552, 1, 0, 0, 1, 1,
1.437035, -0.9567458, 3.374285, 1, 0, 0, 1, 1,
1.442115, 2.049397, -1.059717, 0, 0, 0, 1, 1,
1.449637, -1.280466, 3.345424, 0, 0, 0, 1, 1,
1.451713, -0.4925487, 2.320521, 0, 0, 0, 1, 1,
1.46218, -0.7690189, 1.472289, 0, 0, 0, 1, 1,
1.46905, -1.061076, 2.675559, 0, 0, 0, 1, 1,
1.471821, 0.01889767, 1.549, 0, 0, 0, 1, 1,
1.480567, -1.712095, 3.777352, 0, 0, 0, 1, 1,
1.484402, 1.319875, 1.545161, 1, 1, 1, 1, 1,
1.485628, -1.021289, 1.69922, 1, 1, 1, 1, 1,
1.487155, -1.532985, 3.219314, 1, 1, 1, 1, 1,
1.491449, 1.343616, 0.9374478, 1, 1, 1, 1, 1,
1.500345, -0.06215168, 3.817446, 1, 1, 1, 1, 1,
1.502134, 1.178565, 0.3679148, 1, 1, 1, 1, 1,
1.51223, 1.299461, 0.07609349, 1, 1, 1, 1, 1,
1.516819, -0.8059365, 2.196927, 1, 1, 1, 1, 1,
1.519574, -0.1527325, 3.42961, 1, 1, 1, 1, 1,
1.542372, 1.900776, -0.3222571, 1, 1, 1, 1, 1,
1.589476, -0.7083737, 2.935616, 1, 1, 1, 1, 1,
1.612159, -1.229422, 0.9205248, 1, 1, 1, 1, 1,
1.61804, 1.715207, 1.674308, 1, 1, 1, 1, 1,
1.621341, 0.4722432, 1.777499, 1, 1, 1, 1, 1,
1.631836, -0.5394176, 2.220453, 1, 1, 1, 1, 1,
1.64794, -0.1349258, 3.163885, 0, 0, 1, 1, 1,
1.650689, -0.7960583, 3.907193, 1, 0, 0, 1, 1,
1.654809, 0.9698622, 1.150535, 1, 0, 0, 1, 1,
1.66429, -0.9415951, 2.9967, 1, 0, 0, 1, 1,
1.672974, 1.196603, 0.7262227, 1, 0, 0, 1, 1,
1.67339, 0.4019583, 1.759226, 1, 0, 0, 1, 1,
1.685014, -0.8056443, 3.544052, 0, 0, 0, 1, 1,
1.730823, 1.946145, -1.381601, 0, 0, 0, 1, 1,
1.733876, -0.1811297, 1.11621, 0, 0, 0, 1, 1,
1.741434, -0.645734, 2.991452, 0, 0, 0, 1, 1,
1.755737, 1.456996, 0.1720778, 0, 0, 0, 1, 1,
1.759972, 0.8643408, 0.9930578, 0, 0, 0, 1, 1,
1.765985, -0.2912923, 1.960708, 0, 0, 0, 1, 1,
1.767385, -0.2515866, -0.6402023, 1, 1, 1, 1, 1,
1.773575, 0.1125433, 0.4069909, 1, 1, 1, 1, 1,
1.803232, -0.852594, 1.921589, 1, 1, 1, 1, 1,
1.855605, -0.149222, 2.642292, 1, 1, 1, 1, 1,
1.863687, -0.1992812, 0.2030181, 1, 1, 1, 1, 1,
1.866039, -0.3701555, 0.8798617, 1, 1, 1, 1, 1,
1.866765, 0.09963891, 3.316497, 1, 1, 1, 1, 1,
1.86816, 1.163076, 0.6364174, 1, 1, 1, 1, 1,
1.901984, 0.05960791, 2.14762, 1, 1, 1, 1, 1,
1.904315, -1.19783, 2.025341, 1, 1, 1, 1, 1,
1.912259, 1.23636, 2.924472, 1, 1, 1, 1, 1,
1.950591, 2.014304, 1.428845, 1, 1, 1, 1, 1,
1.974231, 1.154861, 2.156449, 1, 1, 1, 1, 1,
2.039489, 1.127694, 2.422205, 1, 1, 1, 1, 1,
2.074855, -1.005477, 3.270507, 1, 1, 1, 1, 1,
2.09059, 1.878423, -0.4849176, 0, 0, 1, 1, 1,
2.153941, -1.029483, 1.966451, 1, 0, 0, 1, 1,
2.168351, -1.193779, 4.167193, 1, 0, 0, 1, 1,
2.189766, 0.60909, 3.198846, 1, 0, 0, 1, 1,
2.201743, -1.159943, 1.795471, 1, 0, 0, 1, 1,
2.217863, 1.173196, 0.6294999, 1, 0, 0, 1, 1,
2.240183, 0.1277366, 0.1166518, 0, 0, 0, 1, 1,
2.259906, -1.677687, 2.928335, 0, 0, 0, 1, 1,
2.275994, -0.3002639, 1.444608, 0, 0, 0, 1, 1,
2.33289, -0.1284314, 0.7622136, 0, 0, 0, 1, 1,
2.348728, 0.02711019, 2.139557, 0, 0, 0, 1, 1,
2.455361, 1.158956, 2.32339, 0, 0, 0, 1, 1,
2.46326, 1.075369, 1.14338, 0, 0, 0, 1, 1,
2.493273, 0.4913372, 1.802343, 1, 1, 1, 1, 1,
2.516451, 0.1190023, 2.002723, 1, 1, 1, 1, 1,
2.524319, 0.720822, 0.953952, 1, 1, 1, 1, 1,
2.577522, -0.0003091453, -0.7906194, 1, 1, 1, 1, 1,
2.598149, -0.1227835, -0.2380541, 1, 1, 1, 1, 1,
2.654986, -0.09010669, 3.203449, 1, 1, 1, 1, 1,
2.785363, -0.375832, 1.207459, 1, 1, 1, 1, 1
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
var radius = 9.679414;
var distance = 33.99853;
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
mvMatrix.translate( 0.6973667, 0.1975509, -0.005751133 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.99853);
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