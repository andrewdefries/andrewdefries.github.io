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
-3.420663, -0.1496295, -2.682674, 1, 0, 0, 1,
-2.947023, -0.9969709, -2.220787, 1, 0.007843138, 0, 1,
-2.911386, -0.6779376, -3.942543, 1, 0.01176471, 0, 1,
-2.867396, -2.141, -2.960671, 1, 0.01960784, 0, 1,
-2.839008, 1.318462, -0.06070125, 1, 0.02352941, 0, 1,
-2.729559, -0.5443407, -2.562107, 1, 0.03137255, 0, 1,
-2.385184, 1.624333, -0.260324, 1, 0.03529412, 0, 1,
-2.340434, -0.2795309, -1.768921, 1, 0.04313726, 0, 1,
-2.29554, -0.8378264, -1.458626, 1, 0.04705882, 0, 1,
-2.285589, -1.547486, -2.673953, 1, 0.05490196, 0, 1,
-2.284447, -0.7643299, -2.549631, 1, 0.05882353, 0, 1,
-2.236048, -0.5966428, -2.668491, 1, 0.06666667, 0, 1,
-2.224297, -0.7375486, -2.776122, 1, 0.07058824, 0, 1,
-2.205559, -1.039594, -4.187888, 1, 0.07843138, 0, 1,
-2.184683, 0.648845, -3.131153, 1, 0.08235294, 0, 1,
-2.168646, -0.04060984, -2.386445, 1, 0.09019608, 0, 1,
-2.103154, -0.08285219, -3.167481, 1, 0.09411765, 0, 1,
-2.090554, 0.6418043, -0.4181322, 1, 0.1019608, 0, 1,
-2.026681, 0.0173297, -2.428042, 1, 0.1098039, 0, 1,
-2.003366, 1.285693, -2.831169, 1, 0.1137255, 0, 1,
-2.001416, 0.571497, -3.134557, 1, 0.1215686, 0, 1,
-1.999983, 0.1452126, -0.3027065, 1, 0.1254902, 0, 1,
-1.999935, -0.04025422, -3.205414, 1, 0.1333333, 0, 1,
-1.991599, 2.246266, 0.1001375, 1, 0.1372549, 0, 1,
-1.977988, 0.6660637, -1.497271, 1, 0.145098, 0, 1,
-1.976856, 1.432944, 0.09978259, 1, 0.1490196, 0, 1,
-1.873709, -1.506704, -4.296519, 1, 0.1568628, 0, 1,
-1.866517, 0.9622237, 0.1758818, 1, 0.1607843, 0, 1,
-1.839803, 0.2450723, -3.845102, 1, 0.1686275, 0, 1,
-1.829138, 0.2677603, -1.27103, 1, 0.172549, 0, 1,
-1.815954, 0.3998523, -1.726862, 1, 0.1803922, 0, 1,
-1.80499, -0.963675, -0.9303105, 1, 0.1843137, 0, 1,
-1.800803, 0.4792747, -1.57291, 1, 0.1921569, 0, 1,
-1.786371, 2.327631, -0.6595578, 1, 0.1960784, 0, 1,
-1.781988, 1.448735, -1.194657, 1, 0.2039216, 0, 1,
-1.772679, 1.163075, -2.034539, 1, 0.2117647, 0, 1,
-1.767969, 1.448124, -0.4373418, 1, 0.2156863, 0, 1,
-1.764877, 2.131022, 0.4736022, 1, 0.2235294, 0, 1,
-1.752884, 0.8241609, 0.3213188, 1, 0.227451, 0, 1,
-1.752743, -1.615165, -3.811161, 1, 0.2352941, 0, 1,
-1.728325, 0.164091, -0.5290461, 1, 0.2392157, 0, 1,
-1.725723, 0.91065, -2.113722, 1, 0.2470588, 0, 1,
-1.719326, -0.08816647, -2.278454, 1, 0.2509804, 0, 1,
-1.716844, 1.818187, -0.8016824, 1, 0.2588235, 0, 1,
-1.714349, -0.39045, -1.046071, 1, 0.2627451, 0, 1,
-1.710515, -0.9091985, 0.03654832, 1, 0.2705882, 0, 1,
-1.696359, 0.2914419, -0.6062503, 1, 0.2745098, 0, 1,
-1.694985, -0.6323012, -3.477876, 1, 0.282353, 0, 1,
-1.692768, -0.0350203, -1.452439, 1, 0.2862745, 0, 1,
-1.684852, -1.037488, -3.450901, 1, 0.2941177, 0, 1,
-1.678489, -1.643777, -1.818566, 1, 0.3019608, 0, 1,
-1.671238, -0.3167378, -2.624752, 1, 0.3058824, 0, 1,
-1.661206, 0.3986585, -2.895281, 1, 0.3137255, 0, 1,
-1.660253, 0.7727827, -3.634439, 1, 0.3176471, 0, 1,
-1.6501, -1.646003, -1.525232, 1, 0.3254902, 0, 1,
-1.640201, 0.3785558, -1.309106, 1, 0.3294118, 0, 1,
-1.631562, 0.002680539, 0.2753244, 1, 0.3372549, 0, 1,
-1.630339, -0.5780938, -3.186358, 1, 0.3411765, 0, 1,
-1.613149, -1.028247, -1.786876, 1, 0.3490196, 0, 1,
-1.613006, -0.3020965, -1.996612, 1, 0.3529412, 0, 1,
-1.590191, -0.5547608, -2.643834, 1, 0.3607843, 0, 1,
-1.549773, -1.388694, -1.511056, 1, 0.3647059, 0, 1,
-1.548042, -0.9630589, -1.990703, 1, 0.372549, 0, 1,
-1.51641, 1.968903, -0.3251112, 1, 0.3764706, 0, 1,
-1.515386, -0.5451511, -3.016838, 1, 0.3843137, 0, 1,
-1.510519, 0.3309485, -0.8986686, 1, 0.3882353, 0, 1,
-1.510381, -0.3256234, -0.8574184, 1, 0.3960784, 0, 1,
-1.503193, -0.1120664, -3.124691, 1, 0.4039216, 0, 1,
-1.49583, -0.2947554, -0.3482303, 1, 0.4078431, 0, 1,
-1.484175, -0.2345201, -2.131544, 1, 0.4156863, 0, 1,
-1.454114, 2.023741, -1.756301, 1, 0.4196078, 0, 1,
-1.451798, 0.7583682, -0.3275854, 1, 0.427451, 0, 1,
-1.44763, -0.1039894, -0.2636958, 1, 0.4313726, 0, 1,
-1.446461, -0.5052332, -0.8087098, 1, 0.4392157, 0, 1,
-1.44547, -0.1462222, -2.559886, 1, 0.4431373, 0, 1,
-1.444142, 0.4508601, -1.36955, 1, 0.4509804, 0, 1,
-1.430458, 0.06624603, -1.08151, 1, 0.454902, 0, 1,
-1.414269, 0.2795599, -1.961662, 1, 0.4627451, 0, 1,
-1.40745, -0.870782, -2.89836, 1, 0.4666667, 0, 1,
-1.40712, -0.5427629, -1.860964, 1, 0.4745098, 0, 1,
-1.405797, -0.03100078, -0.1972992, 1, 0.4784314, 0, 1,
-1.402356, -1.388412, -1.481216, 1, 0.4862745, 0, 1,
-1.396791, 0.4087593, -0.1455057, 1, 0.4901961, 0, 1,
-1.396011, 0.4369264, -1.246005, 1, 0.4980392, 0, 1,
-1.394941, 0.07757464, -1.22313, 1, 0.5058824, 0, 1,
-1.384447, 0.8482896, -2.342558, 1, 0.509804, 0, 1,
-1.384238, 1.551861, -0.1878001, 1, 0.5176471, 0, 1,
-1.381829, -1.821937, -2.304698, 1, 0.5215687, 0, 1,
-1.370133, 0.8031652, -1.549307, 1, 0.5294118, 0, 1,
-1.366638, -0.5213767, -2.853737, 1, 0.5333334, 0, 1,
-1.364592, -0.3726841, -1.491492, 1, 0.5411765, 0, 1,
-1.362218, -0.2660528, -2.80905, 1, 0.5450981, 0, 1,
-1.357627, 0.5953876, 0.1310215, 1, 0.5529412, 0, 1,
-1.356638, 0.1818309, -0.8287815, 1, 0.5568628, 0, 1,
-1.354648, -0.9454238, -3.412497, 1, 0.5647059, 0, 1,
-1.349069, -1.156388, -2.854297, 1, 0.5686275, 0, 1,
-1.340596, -0.780383, -1.60588, 1, 0.5764706, 0, 1,
-1.314893, -1.249431, -1.934393, 1, 0.5803922, 0, 1,
-1.303346, -0.01158355, -0.9501921, 1, 0.5882353, 0, 1,
-1.299085, 0.6696969, -0.461997, 1, 0.5921569, 0, 1,
-1.293844, -1.856578, -1.562774, 1, 0.6, 0, 1,
-1.289293, -0.8888092, -2.43091, 1, 0.6078432, 0, 1,
-1.28312, -0.1502799, -1.13105, 1, 0.6117647, 0, 1,
-1.279364, -0.5487879, -2.179883, 1, 0.6196079, 0, 1,
-1.276946, -0.2465595, -0.808014, 1, 0.6235294, 0, 1,
-1.276536, -0.6196937, -2.39949, 1, 0.6313726, 0, 1,
-1.26129, 0.06423801, -2.080199, 1, 0.6352941, 0, 1,
-1.259907, 0.5232657, -0.8061134, 1, 0.6431373, 0, 1,
-1.248778, -0.07363716, -1.216677, 1, 0.6470588, 0, 1,
-1.248163, -1.42163, -2.443263, 1, 0.654902, 0, 1,
-1.240143, -2.456293, -1.002601, 1, 0.6588235, 0, 1,
-1.239225, 0.5807723, -0.3247007, 1, 0.6666667, 0, 1,
-1.237726, -0.6972964, -1.774375, 1, 0.6705883, 0, 1,
-1.233428, 0.9018368, 1.106409, 1, 0.6784314, 0, 1,
-1.222006, 0.1256674, 0.3911481, 1, 0.682353, 0, 1,
-1.218561, -0.2679763, -2.4092, 1, 0.6901961, 0, 1,
-1.202287, -0.4359685, -1.838124, 1, 0.6941177, 0, 1,
-1.19755, -0.1254832, -2.162266, 1, 0.7019608, 0, 1,
-1.190725, 0.8104479, -1.700288, 1, 0.7098039, 0, 1,
-1.189303, -2.33309, -0.8828942, 1, 0.7137255, 0, 1,
-1.187449, 0.9854507, -0.8470195, 1, 0.7215686, 0, 1,
-1.1814, -0.06507065, -2.788338, 1, 0.7254902, 0, 1,
-1.171086, -0.1218145, -1.082684, 1, 0.7333333, 0, 1,
-1.168125, 1.289441, 0.5132282, 1, 0.7372549, 0, 1,
-1.166672, -1.444383, -3.121402, 1, 0.7450981, 0, 1,
-1.166501, 0.6020602, -1.857105, 1, 0.7490196, 0, 1,
-1.16303, -0.5944149, -0.6204694, 1, 0.7568628, 0, 1,
-1.159198, -0.19212, 0.6606581, 1, 0.7607843, 0, 1,
-1.151822, -0.3829091, -0.6022509, 1, 0.7686275, 0, 1,
-1.149923, 2.423186, 0.546052, 1, 0.772549, 0, 1,
-1.146709, 0.3595315, -0.1856921, 1, 0.7803922, 0, 1,
-1.125295, -0.8921394, -2.813909, 1, 0.7843137, 0, 1,
-1.124858, -1.146379, -1.95594, 1, 0.7921569, 0, 1,
-1.124026, 0.2735148, -1.505867, 1, 0.7960784, 0, 1,
-1.122835, -1.241963, -3.223115, 1, 0.8039216, 0, 1,
-1.122618, 0.8948939, -0.5604057, 1, 0.8117647, 0, 1,
-1.121272, 0.3544221, -3.115843, 1, 0.8156863, 0, 1,
-1.120461, -0.4822482, -3.328391, 1, 0.8235294, 0, 1,
-1.120388, -1.887838, -3.113161, 1, 0.827451, 0, 1,
-1.116952, 0.3464805, -0.377143, 1, 0.8352941, 0, 1,
-1.10808, 0.9819518, -0.306001, 1, 0.8392157, 0, 1,
-1.097103, 0.4236354, -0.4311009, 1, 0.8470588, 0, 1,
-1.096453, 0.7278457, 0.4149902, 1, 0.8509804, 0, 1,
-1.092672, 0.152137, -2.290524, 1, 0.8588235, 0, 1,
-1.089909, 1.83462, -0.7418515, 1, 0.8627451, 0, 1,
-1.085435, 0.09982614, -1.830125, 1, 0.8705882, 0, 1,
-1.077304, -0.1820262, -0.1126914, 1, 0.8745098, 0, 1,
-1.076626, 1.470225, -0.003243086, 1, 0.8823529, 0, 1,
-1.068727, 0.4138068, -1.172243, 1, 0.8862745, 0, 1,
-1.060731, 0.7034817, -2.627264, 1, 0.8941177, 0, 1,
-1.054025, 1.16157, -0.494267, 1, 0.8980392, 0, 1,
-1.053581, 0.6319008, 1.358058, 1, 0.9058824, 0, 1,
-1.051954, 0.2573295, -2.743296, 1, 0.9137255, 0, 1,
-1.049811, 1.516159, -0.3998537, 1, 0.9176471, 0, 1,
-1.049311, -0.5775337, -1.483615, 1, 0.9254902, 0, 1,
-1.048692, 0.3882113, 0.4308362, 1, 0.9294118, 0, 1,
-1.045332, -0.06537846, 0.0147749, 1, 0.9372549, 0, 1,
-1.040114, -0.9252945, -0.9376756, 1, 0.9411765, 0, 1,
-1.038603, 1.071888, -0.8739919, 1, 0.9490196, 0, 1,
-1.038449, -0.9275644, -1.580097, 1, 0.9529412, 0, 1,
-1.036464, -0.1566127, -2.97878, 1, 0.9607843, 0, 1,
-1.035839, 0.5844691, -1.906386, 1, 0.9647059, 0, 1,
-1.035192, -0.2665978, -3.682009, 1, 0.972549, 0, 1,
-1.020457, 0.8074571, -0.1918508, 1, 0.9764706, 0, 1,
-1.01836, 0.4428693, -0.7317923, 1, 0.9843137, 0, 1,
-1.015332, -2.426913, -2.019641, 1, 0.9882353, 0, 1,
-1.004968, -0.7598214, -3.153354, 1, 0.9960784, 0, 1,
-1.002823, 1.068404, -0.1553326, 0.9960784, 1, 0, 1,
-0.9994364, -0.6719189, -1.343609, 0.9921569, 1, 0, 1,
-0.9986995, -0.5503374, -2.119139, 0.9843137, 1, 0, 1,
-0.9984904, 0.5936318, 1.20598, 0.9803922, 1, 0, 1,
-0.9955617, -0.7049832, -0.8747314, 0.972549, 1, 0, 1,
-0.9935734, -1.702978, -2.929621, 0.9686275, 1, 0, 1,
-0.9925584, -0.318568, -1.831176, 0.9607843, 1, 0, 1,
-0.9862736, -0.06599766, -2.197148, 0.9568627, 1, 0, 1,
-0.9861025, -0.4457829, -1.553504, 0.9490196, 1, 0, 1,
-0.9802384, 0.2060764, -1.199712, 0.945098, 1, 0, 1,
-0.9711072, -0.09973326, -2.28675, 0.9372549, 1, 0, 1,
-0.9659967, -0.1751278, -1.590016, 0.9333333, 1, 0, 1,
-0.9595, 1.822768, -1.789847, 0.9254902, 1, 0, 1,
-0.9581925, -1.37193, -2.964327, 0.9215686, 1, 0, 1,
-0.9546678, -0.00763736, 0.7553805, 0.9137255, 1, 0, 1,
-0.9546288, 0.360114, -2.11229, 0.9098039, 1, 0, 1,
-0.9542149, 0.1440591, -0.4830926, 0.9019608, 1, 0, 1,
-0.9512898, -1.024268, -2.594012, 0.8941177, 1, 0, 1,
-0.9510093, -1.359366, -1.274637, 0.8901961, 1, 0, 1,
-0.9500743, -0.1792939, -2.699819, 0.8823529, 1, 0, 1,
-0.9457885, 0.2195279, -2.441225, 0.8784314, 1, 0, 1,
-0.9379455, -0.3752701, -2.170203, 0.8705882, 1, 0, 1,
-0.9376259, -0.5903451, -1.87173, 0.8666667, 1, 0, 1,
-0.9323364, -0.2401683, -2.718726, 0.8588235, 1, 0, 1,
-0.9322922, 1.227693, -1.200531, 0.854902, 1, 0, 1,
-0.9319376, 0.3737192, 0.3374099, 0.8470588, 1, 0, 1,
-0.9316261, 1.432948, -0.6361166, 0.8431373, 1, 0, 1,
-0.9314013, -1.423344, -0.6120927, 0.8352941, 1, 0, 1,
-0.9312457, -0.8730887, -2.849663, 0.8313726, 1, 0, 1,
-0.9281587, -0.5676588, -0.6832035, 0.8235294, 1, 0, 1,
-0.9204115, 1.29878, -1.843853, 0.8196079, 1, 0, 1,
-0.9145856, 0.6405864, -0.5538343, 0.8117647, 1, 0, 1,
-0.9112084, -0.4180057, -3.281628, 0.8078431, 1, 0, 1,
-0.9101025, -1.28414, -1.766213, 0.8, 1, 0, 1,
-0.9061843, 1.618461, -1.197265, 0.7921569, 1, 0, 1,
-0.9016513, -0.5029207, -0.03361978, 0.7882353, 1, 0, 1,
-0.9001171, 0.7894257, -3.445346, 0.7803922, 1, 0, 1,
-0.8924254, 1.8226, 0.5411843, 0.7764706, 1, 0, 1,
-0.880869, 0.3261108, -1.639266, 0.7686275, 1, 0, 1,
-0.8791106, 2.286631, -3.415529, 0.7647059, 1, 0, 1,
-0.8756941, -0.01538765, -3.075774, 0.7568628, 1, 0, 1,
-0.8709003, 0.185344, -0.9710703, 0.7529412, 1, 0, 1,
-0.8603348, -1.421621, -2.396666, 0.7450981, 1, 0, 1,
-0.8494449, -1.157855, -0.8853568, 0.7411765, 1, 0, 1,
-0.8408169, 0.2483082, -1.964091, 0.7333333, 1, 0, 1,
-0.8381878, -0.8730999, -2.019721, 0.7294118, 1, 0, 1,
-0.8378516, 0.3608411, -1.571833, 0.7215686, 1, 0, 1,
-0.8373854, 0.2058735, -1.11804, 0.7176471, 1, 0, 1,
-0.8359193, 0.01165877, -1.461084, 0.7098039, 1, 0, 1,
-0.8345585, 0.3250252, 0.06591129, 0.7058824, 1, 0, 1,
-0.8344585, -1.924248, -1.162279, 0.6980392, 1, 0, 1,
-0.8331861, -0.5100705, -1.886684, 0.6901961, 1, 0, 1,
-0.8230966, 0.6214907, -2.690376, 0.6862745, 1, 0, 1,
-0.8196215, -0.8233742, -0.6756389, 0.6784314, 1, 0, 1,
-0.8141467, 1.209195, -0.04024747, 0.6745098, 1, 0, 1,
-0.8138761, 1.061023, -0.850301, 0.6666667, 1, 0, 1,
-0.8121421, 1.081409, 0.8788313, 0.6627451, 1, 0, 1,
-0.805632, -1.177244, 0.2173115, 0.654902, 1, 0, 1,
-0.8030763, 0.8664357, -2.101817, 0.6509804, 1, 0, 1,
-0.8009365, -0.3284713, -1.388211, 0.6431373, 1, 0, 1,
-0.7993017, 1.204927, -0.1124485, 0.6392157, 1, 0, 1,
-0.7953058, -0.4451358, -3.446526, 0.6313726, 1, 0, 1,
-0.7923035, -0.5867574, -2.952387, 0.627451, 1, 0, 1,
-0.7869872, 1.577424, -0.8564031, 0.6196079, 1, 0, 1,
-0.7839534, 2.187437, -1.044082, 0.6156863, 1, 0, 1,
-0.7770685, -0.6640525, -3.02927, 0.6078432, 1, 0, 1,
-0.7753823, 0.9599515, -0.1909199, 0.6039216, 1, 0, 1,
-0.7737299, -0.0290092, -1.702414, 0.5960785, 1, 0, 1,
-0.7693161, -0.6720445, -3.80882, 0.5882353, 1, 0, 1,
-0.7671649, -0.6791813, -3.239384, 0.5843138, 1, 0, 1,
-0.7659904, 0.1717373, -1.193576, 0.5764706, 1, 0, 1,
-0.7608456, -0.1685691, -1.942898, 0.572549, 1, 0, 1,
-0.7487949, 1.179088, -1.252483, 0.5647059, 1, 0, 1,
-0.7470982, 0.2260528, 0.1489034, 0.5607843, 1, 0, 1,
-0.7437817, 0.3379603, -0.3050797, 0.5529412, 1, 0, 1,
-0.7397895, 0.9158167, -2.213961, 0.5490196, 1, 0, 1,
-0.7382651, -0.5894726, -2.5933, 0.5411765, 1, 0, 1,
-0.7363642, 0.5681556, -2.837384, 0.5372549, 1, 0, 1,
-0.7323329, 1.429225, 0.0829048, 0.5294118, 1, 0, 1,
-0.7312784, 1.104322, -1.832711, 0.5254902, 1, 0, 1,
-0.7312647, -2.004886, -2.523507, 0.5176471, 1, 0, 1,
-0.7296833, 0.5336035, -1.287091, 0.5137255, 1, 0, 1,
-0.728107, 1.084381, -1.191671, 0.5058824, 1, 0, 1,
-0.7266627, -0.3570956, -3.925511, 0.5019608, 1, 0, 1,
-0.7187819, -0.4991776, -1.740516, 0.4941176, 1, 0, 1,
-0.7131531, 1.708424, 0.4752469, 0.4862745, 1, 0, 1,
-0.7103865, 0.305729, 1.010169, 0.4823529, 1, 0, 1,
-0.7046826, -0.09041923, -2.599699, 0.4745098, 1, 0, 1,
-0.7032052, -1.08564, -2.017292, 0.4705882, 1, 0, 1,
-0.7028022, -0.9416699, -2.977745, 0.4627451, 1, 0, 1,
-0.7026802, 1.081119, 0.5931485, 0.4588235, 1, 0, 1,
-0.7022875, 2.09029, -0.1803453, 0.4509804, 1, 0, 1,
-0.6992829, 0.283739, -0.9104444, 0.4470588, 1, 0, 1,
-0.6987803, -0.3795037, -0.7747639, 0.4392157, 1, 0, 1,
-0.6979004, 1.808049, 1.137695, 0.4352941, 1, 0, 1,
-0.6922, -1.288556, -2.221424, 0.427451, 1, 0, 1,
-0.6918334, 0.2993956, -0.1207046, 0.4235294, 1, 0, 1,
-0.6851624, 0.8530639, -0.8951027, 0.4156863, 1, 0, 1,
-0.6844954, 0.04764077, -1.62834, 0.4117647, 1, 0, 1,
-0.6821169, -0.5797809, -1.756501, 0.4039216, 1, 0, 1,
-0.6797156, -1.204165, -2.480937, 0.3960784, 1, 0, 1,
-0.676383, 0.8050994, -0.5016109, 0.3921569, 1, 0, 1,
-0.6723057, 1.977456, 0.2077685, 0.3843137, 1, 0, 1,
-0.6721252, -0.405783, -2.406042, 0.3803922, 1, 0, 1,
-0.669477, 2.044252, 1.396405, 0.372549, 1, 0, 1,
-0.6623976, 0.4425421, -1.933687, 0.3686275, 1, 0, 1,
-0.658174, -1.777803, -2.676482, 0.3607843, 1, 0, 1,
-0.6529391, -0.4228149, -1.470092, 0.3568628, 1, 0, 1,
-0.645385, -0.9247098, -4.361319, 0.3490196, 1, 0, 1,
-0.6422253, -0.1118327, -2.533182, 0.345098, 1, 0, 1,
-0.6418236, 1.059683, -1.871027, 0.3372549, 1, 0, 1,
-0.640249, -0.1881651, -1.627403, 0.3333333, 1, 0, 1,
-0.6391661, 0.5725821, -1.176469, 0.3254902, 1, 0, 1,
-0.6294637, 0.495376, 0.1943551, 0.3215686, 1, 0, 1,
-0.629067, 0.3275149, -0.1145536, 0.3137255, 1, 0, 1,
-0.6279503, 0.2156399, -2.386991, 0.3098039, 1, 0, 1,
-0.6141503, -0.08046796, -2.942775, 0.3019608, 1, 0, 1,
-0.6036013, 0.9021561, -1.423155, 0.2941177, 1, 0, 1,
-0.6011551, -0.7849203, -3.234494, 0.2901961, 1, 0, 1,
-0.5988204, -2.079329, -1.98993, 0.282353, 1, 0, 1,
-0.5932211, -1.358487, -0.910761, 0.2784314, 1, 0, 1,
-0.5915186, -0.3843349, -2.234373, 0.2705882, 1, 0, 1,
-0.5902284, 1.846509, -0.7900043, 0.2666667, 1, 0, 1,
-0.5900396, -0.7860526, -3.286692, 0.2588235, 1, 0, 1,
-0.5895223, -1.491859, -2.132249, 0.254902, 1, 0, 1,
-0.5873449, -0.03545786, -1.688887, 0.2470588, 1, 0, 1,
-0.5837941, 0.4167858, -1.433696, 0.2431373, 1, 0, 1,
-0.583649, -1.137588, -3.794688, 0.2352941, 1, 0, 1,
-0.5836443, -1.115846, -1.132184, 0.2313726, 1, 0, 1,
-0.5833681, 1.884493, 1.103767, 0.2235294, 1, 0, 1,
-0.5804808, 1.528273, 0.07781175, 0.2196078, 1, 0, 1,
-0.5763392, -0.6907313, -1.769078, 0.2117647, 1, 0, 1,
-0.5746685, -1.360847, -4.268241, 0.2078431, 1, 0, 1,
-0.5699772, 1.398059, -0.9778669, 0.2, 1, 0, 1,
-0.5686204, 0.163671, -0.3625815, 0.1921569, 1, 0, 1,
-0.565963, -0.3034276, -2.829552, 0.1882353, 1, 0, 1,
-0.5637492, 0.7128643, 0.4367468, 0.1803922, 1, 0, 1,
-0.5597138, -0.5738231, -2.971467, 0.1764706, 1, 0, 1,
-0.5490183, -1.631665, -2.584303, 0.1686275, 1, 0, 1,
-0.5483023, 1.470622, -1.401649, 0.1647059, 1, 0, 1,
-0.5478845, -0.5890853, -3.428606, 0.1568628, 1, 0, 1,
-0.5449303, 1.130175, 0.6539329, 0.1529412, 1, 0, 1,
-0.5420427, -0.01464376, -1.745349, 0.145098, 1, 0, 1,
-0.5381762, 1.997387, -0.07410218, 0.1411765, 1, 0, 1,
-0.534921, -1.2116, -2.3264, 0.1333333, 1, 0, 1,
-0.5321915, -1.122264, -4.200735, 0.1294118, 1, 0, 1,
-0.5231406, 0.004704915, -0.1465174, 0.1215686, 1, 0, 1,
-0.5213082, -0.847712, -0.9478068, 0.1176471, 1, 0, 1,
-0.5119532, 0.7446741, 0.3053567, 0.1098039, 1, 0, 1,
-0.5115346, 0.9770637, -0.8381074, 0.1058824, 1, 0, 1,
-0.509506, -0.2015644, -0.6251141, 0.09803922, 1, 0, 1,
-0.5070853, 0.6041568, -1.375391, 0.09019608, 1, 0, 1,
-0.5064346, 0.1286275, -0.8375842, 0.08627451, 1, 0, 1,
-0.5043023, -1.215899, -2.65789, 0.07843138, 1, 0, 1,
-0.5041992, 0.5775295, -1.549503, 0.07450981, 1, 0, 1,
-0.5019312, -0.2425373, -1.628509, 0.06666667, 1, 0, 1,
-0.4999238, -2.688523, -2.151275, 0.0627451, 1, 0, 1,
-0.4958988, 1.202699, -0.377114, 0.05490196, 1, 0, 1,
-0.4919712, 1.147626, 0.2754654, 0.05098039, 1, 0, 1,
-0.4890347, 0.9209681, -1.618394, 0.04313726, 1, 0, 1,
-0.4888102, -0.5132929, -2.357477, 0.03921569, 1, 0, 1,
-0.485808, 0.1112325, -1.710428, 0.03137255, 1, 0, 1,
-0.4815603, -1.629403, -0.9342184, 0.02745098, 1, 0, 1,
-0.4810502, -0.01762238, -2.926651, 0.01960784, 1, 0, 1,
-0.4808017, 0.7849425, 0.0681081, 0.01568628, 1, 0, 1,
-0.4798625, 1.314882, -0.4282414, 0.007843138, 1, 0, 1,
-0.4645324, -0.2355122, -2.362286, 0.003921569, 1, 0, 1,
-0.4643604, 0.2364672, -0.07349549, 0, 1, 0.003921569, 1,
-0.4635345, 0.8620321, -0.9977127, 0, 1, 0.01176471, 1,
-0.4607252, 0.3178043, -2.923518, 0, 1, 0.01568628, 1,
-0.4603048, 0.07601629, -0.83375, 0, 1, 0.02352941, 1,
-0.4599442, -0.04249268, -3.381383, 0, 1, 0.02745098, 1,
-0.4500325, 1.364965, 0.7027339, 0, 1, 0.03529412, 1,
-0.4447646, -0.4544764, -0.1915053, 0, 1, 0.03921569, 1,
-0.4369382, -0.7289091, -3.072325, 0, 1, 0.04705882, 1,
-0.4346181, -0.5338292, -2.688053, 0, 1, 0.05098039, 1,
-0.4307799, 0.2495942, -1.258198, 0, 1, 0.05882353, 1,
-0.4276441, -0.8604782, -2.515553, 0, 1, 0.0627451, 1,
-0.425455, -0.9314755, -1.564614, 0, 1, 0.07058824, 1,
-0.4233562, -1.207066, -3.154491, 0, 1, 0.07450981, 1,
-0.417998, -1.990989, -3.872618, 0, 1, 0.08235294, 1,
-0.4142907, -0.8214619, -2.252309, 0, 1, 0.08627451, 1,
-0.413448, -0.1250534, -2.632013, 0, 1, 0.09411765, 1,
-0.4093726, 0.1892754, -2.694871, 0, 1, 0.1019608, 1,
-0.4075216, -1.004212, -3.167977, 0, 1, 0.1058824, 1,
-0.4007273, 0.4852498, -0.4656298, 0, 1, 0.1137255, 1,
-0.3950251, 1.818358, 0.04513126, 0, 1, 0.1176471, 1,
-0.3880946, -0.796278, -1.387526, 0, 1, 0.1254902, 1,
-0.3864816, -2.307663, -3.483627, 0, 1, 0.1294118, 1,
-0.3818729, -0.03474551, -0.0814259, 0, 1, 0.1372549, 1,
-0.3812808, -0.9677092, -2.543307, 0, 1, 0.1411765, 1,
-0.3725804, -0.5259852, -2.906527, 0, 1, 0.1490196, 1,
-0.3703104, 2.116579, -1.262511, 0, 1, 0.1529412, 1,
-0.362519, 0.7091228, -0.3128622, 0, 1, 0.1607843, 1,
-0.3583181, -0.364583, -0.07419369, 0, 1, 0.1647059, 1,
-0.3495148, 0.4736496, 0.05040734, 0, 1, 0.172549, 1,
-0.3434523, -1.813253, -2.480378, 0, 1, 0.1764706, 1,
-0.342351, -1.407867, -3.380265, 0, 1, 0.1843137, 1,
-0.3411078, 0.8590943, -1.21479, 0, 1, 0.1882353, 1,
-0.3380033, -0.8715905, -3.211737, 0, 1, 0.1960784, 1,
-0.3324567, -0.03881572, -2.604943, 0, 1, 0.2039216, 1,
-0.3317456, -0.6401517, -1.82345, 0, 1, 0.2078431, 1,
-0.3306228, -0.09426995, -2.011169, 0, 1, 0.2156863, 1,
-0.3279067, 0.6005055, -1.081833, 0, 1, 0.2196078, 1,
-0.3221223, 0.7452985, -0.0799543, 0, 1, 0.227451, 1,
-0.3211853, -0.6898407, -2.133733, 0, 1, 0.2313726, 1,
-0.3206091, 1.29182, -0.3494124, 0, 1, 0.2392157, 1,
-0.3130061, -0.03937219, -3.287171, 0, 1, 0.2431373, 1,
-0.3090912, -1.409677, -2.179567, 0, 1, 0.2509804, 1,
-0.3087897, 0.7495759, 0.5923671, 0, 1, 0.254902, 1,
-0.3033166, -1.597573, -2.318521, 0, 1, 0.2627451, 1,
-0.3026245, 0.09424547, -1.688162, 0, 1, 0.2666667, 1,
-0.2990052, 0.552292, -2.36911, 0, 1, 0.2745098, 1,
-0.2955162, 1.746963, -1.155875, 0, 1, 0.2784314, 1,
-0.2949264, 1.111959, -0.2874745, 0, 1, 0.2862745, 1,
-0.2948392, 0.3188902, 0.6450048, 0, 1, 0.2901961, 1,
-0.2929362, -1.056015, -2.924595, 0, 1, 0.2980392, 1,
-0.2893881, -1.248711, -1.527117, 0, 1, 0.3058824, 1,
-0.2878487, 0.9482997, 0.3807493, 0, 1, 0.3098039, 1,
-0.2820749, 0.2429865, 0.9371747, 0, 1, 0.3176471, 1,
-0.2819224, -0.1448538, -1.471847, 0, 1, 0.3215686, 1,
-0.2807131, -0.6026468, -1.905767, 0, 1, 0.3294118, 1,
-0.2758402, -1.521852, -4.458636, 0, 1, 0.3333333, 1,
-0.2742684, 0.06002271, -2.236411, 0, 1, 0.3411765, 1,
-0.2703251, 0.7833453, -0.5917553, 0, 1, 0.345098, 1,
-0.2680666, -0.1523941, -0.6205976, 0, 1, 0.3529412, 1,
-0.267096, -0.7292678, -1.811729, 0, 1, 0.3568628, 1,
-0.2635869, -0.8610144, -2.686922, 0, 1, 0.3647059, 1,
-0.2621121, -0.1596892, -3.219897, 0, 1, 0.3686275, 1,
-0.2589739, -1.156357, -2.726646, 0, 1, 0.3764706, 1,
-0.2490031, 1.986984, -0.4434879, 0, 1, 0.3803922, 1,
-0.2482123, 0.5058068, 0.5961848, 0, 1, 0.3882353, 1,
-0.2471232, -0.5069076, -1.552456, 0, 1, 0.3921569, 1,
-0.245326, -0.07552734, -4.406136, 0, 1, 0.4, 1,
-0.2438373, -0.09711535, -3.896008, 0, 1, 0.4078431, 1,
-0.2414781, 1.41561, -0.3356696, 0, 1, 0.4117647, 1,
-0.2271045, 1.02227, -1.003195, 0, 1, 0.4196078, 1,
-0.2221496, 1.583291, -0.6661867, 0, 1, 0.4235294, 1,
-0.2170309, 1.105384, -0.2211641, 0, 1, 0.4313726, 1,
-0.2158625, 0.1833215, -2.448196, 0, 1, 0.4352941, 1,
-0.2146399, 0.4224033, -2.213063, 0, 1, 0.4431373, 1,
-0.2145396, 2.769285, 0.6066878, 0, 1, 0.4470588, 1,
-0.2135316, -0.3627631, -2.727471, 0, 1, 0.454902, 1,
-0.2101231, -1.545035, -2.848783, 0, 1, 0.4588235, 1,
-0.20936, 0.4656305, -1.126161, 0, 1, 0.4666667, 1,
-0.2047602, -1.197019, -2.869229, 0, 1, 0.4705882, 1,
-0.2024706, -1.426595, -4.374667, 0, 1, 0.4784314, 1,
-0.1996299, 0.539857, -0.3875777, 0, 1, 0.4823529, 1,
-0.1980469, -2.960056, -2.773951, 0, 1, 0.4901961, 1,
-0.1939723, -0.3561168, -2.259485, 0, 1, 0.4941176, 1,
-0.1874987, 0.1929032, -2.987763, 0, 1, 0.5019608, 1,
-0.1868842, -0.009390519, -0.08670079, 0, 1, 0.509804, 1,
-0.1867026, 1.587323, 0.9125285, 0, 1, 0.5137255, 1,
-0.1852612, 0.1254314, -0.4970669, 0, 1, 0.5215687, 1,
-0.1782823, 0.3126299, 0.3008417, 0, 1, 0.5254902, 1,
-0.1761095, -0.8183254, -2.691471, 0, 1, 0.5333334, 1,
-0.1606515, -0.8027866, -2.068358, 0, 1, 0.5372549, 1,
-0.1531818, -1.387551, -3.814662, 0, 1, 0.5450981, 1,
-0.1516652, -0.2078688, -1.138706, 0, 1, 0.5490196, 1,
-0.1445012, -0.3539596, -2.95758, 0, 1, 0.5568628, 1,
-0.1440105, 0.7382463, 0.9113863, 0, 1, 0.5607843, 1,
-0.1431681, 0.01231656, -0.8335024, 0, 1, 0.5686275, 1,
-0.1406657, 1.175448, 1.701704, 0, 1, 0.572549, 1,
-0.1396236, -0.3582483, -3.686017, 0, 1, 0.5803922, 1,
-0.1373233, 0.2816544, -1.150225, 0, 1, 0.5843138, 1,
-0.1364774, -0.3020521, -3.67117, 0, 1, 0.5921569, 1,
-0.1362553, -0.6083444, -3.13181, 0, 1, 0.5960785, 1,
-0.1332288, 0.4616935, -0.2677063, 0, 1, 0.6039216, 1,
-0.1322993, -2.146602, -4.20006, 0, 1, 0.6117647, 1,
-0.1303639, -0.123663, -2.830583, 0, 1, 0.6156863, 1,
-0.1188929, 0.7541072, 1.158425, 0, 1, 0.6235294, 1,
-0.1169195, 2.626473, 0.1505911, 0, 1, 0.627451, 1,
-0.1160528, -0.61527, -0.7478105, 0, 1, 0.6352941, 1,
-0.1118265, -0.6141019, -3.661752, 0, 1, 0.6392157, 1,
-0.1065874, -0.7119897, -2.364557, 0, 1, 0.6470588, 1,
-0.1056529, -1.07777, -3.162723, 0, 1, 0.6509804, 1,
-0.09722652, 0.01396363, -3.155958, 0, 1, 0.6588235, 1,
-0.09511736, 1.532878, -0.5396141, 0, 1, 0.6627451, 1,
-0.08661475, 1.335336, 0.5191923, 0, 1, 0.6705883, 1,
-0.08612135, 1.268636, 0.08223822, 0, 1, 0.6745098, 1,
-0.08577111, -0.9074997, -1.989407, 0, 1, 0.682353, 1,
-0.07660019, -0.3785103, -2.505432, 0, 1, 0.6862745, 1,
-0.07507765, -0.7295632, -1.307992, 0, 1, 0.6941177, 1,
-0.0750187, -0.2835048, -3.644176, 0, 1, 0.7019608, 1,
-0.07442361, 0.006068836, -1.882046, 0, 1, 0.7058824, 1,
-0.0667007, 0.7090343, 0.5276228, 0, 1, 0.7137255, 1,
-0.06373525, -1.102923, -1.127496, 0, 1, 0.7176471, 1,
-0.06315131, 0.4740372, -1.118626, 0, 1, 0.7254902, 1,
-0.06282184, -0.208817, -0.7716202, 0, 1, 0.7294118, 1,
-0.06276169, -0.5371024, -2.414765, 0, 1, 0.7372549, 1,
-0.05645741, 0.9191734, 0.9176384, 0, 1, 0.7411765, 1,
-0.05346382, -1.273473, -2.391015, 0, 1, 0.7490196, 1,
-0.05162333, -0.05759376, -3.065506, 0, 1, 0.7529412, 1,
-0.04979371, 1.271851, 0.1562894, 0, 1, 0.7607843, 1,
-0.04159855, -0.009280472, 0.3020996, 0, 1, 0.7647059, 1,
-0.0396768, 1.395706, -2.147898, 0, 1, 0.772549, 1,
-0.03782382, -0.2767889, -2.378029, 0, 1, 0.7764706, 1,
-0.03606897, 2.131222, -1.034384, 0, 1, 0.7843137, 1,
-0.03548645, 1.006511, -0.4267201, 0, 1, 0.7882353, 1,
-0.03272618, 0.5116917, -0.5423821, 0, 1, 0.7960784, 1,
-0.0310798, 0.3970987, -0.5813845, 0, 1, 0.8039216, 1,
-0.02984827, 0.003262244, -1.408024, 0, 1, 0.8078431, 1,
-0.02500748, -0.07406504, -2.990469, 0, 1, 0.8156863, 1,
-0.02098706, -1.490225, -4.340068, 0, 1, 0.8196079, 1,
-0.02050164, -0.7124412, -1.298901, 0, 1, 0.827451, 1,
-0.01911029, 1.064254, -0.6627672, 0, 1, 0.8313726, 1,
-0.01528796, -1.015994, -3.223835, 0, 1, 0.8392157, 1,
-0.0128594, -0.5289161, -2.690864, 0, 1, 0.8431373, 1,
-0.01115029, -0.144001, -2.25851, 0, 1, 0.8509804, 1,
-0.002734389, 0.2127529, -0.2576836, 0, 1, 0.854902, 1,
-0.001616482, -1.756526, -4.343206, 0, 1, 0.8627451, 1,
-0.0006812874, 0.4779348, -0.6313685, 0, 1, 0.8666667, 1,
0.0007942393, -0.2885878, 1.983293, 0, 1, 0.8745098, 1,
0.001587402, -0.3674517, 3.155392, 0, 1, 0.8784314, 1,
0.00436335, 0.09793449, 0.105, 0, 1, 0.8862745, 1,
0.004397584, 0.8203067, -1.767937, 0, 1, 0.8901961, 1,
0.004941522, 0.3973419, 0.356735, 0, 1, 0.8980392, 1,
0.008114538, 1.361361, 0.5241357, 0, 1, 0.9058824, 1,
0.01285104, -2.917128, 2.817977, 0, 1, 0.9098039, 1,
0.02160345, -0.7017067, 2.387039, 0, 1, 0.9176471, 1,
0.02546562, -0.7721931, 2.797197, 0, 1, 0.9215686, 1,
0.02551377, -0.08290859, 3.218839, 0, 1, 0.9294118, 1,
0.0266775, 1.073607, -0.07772209, 0, 1, 0.9333333, 1,
0.02714801, 2.818344, 0.116269, 0, 1, 0.9411765, 1,
0.02737737, -0.2531812, 2.585887, 0, 1, 0.945098, 1,
0.02907494, -0.6171005, 2.752689, 0, 1, 0.9529412, 1,
0.03735022, 1.353515, -0.2043867, 0, 1, 0.9568627, 1,
0.03918628, 0.8065655, 0.007072827, 0, 1, 0.9647059, 1,
0.04412076, -0.2803048, 3.24069, 0, 1, 0.9686275, 1,
0.04671082, 1.587386, -0.7781391, 0, 1, 0.9764706, 1,
0.05260129, 1.296338, 3.613984, 0, 1, 0.9803922, 1,
0.05871556, 1.68702, 0.9235286, 0, 1, 0.9882353, 1,
0.06277644, 0.2327206, 0.8558499, 0, 1, 0.9921569, 1,
0.06713386, -0.1878104, 5.221881, 0, 1, 1, 1,
0.06799421, -0.9413882, 3.179544, 0, 0.9921569, 1, 1,
0.0688822, 1.186849, 0.2574746, 0, 0.9882353, 1, 1,
0.06921624, -1.020904, 2.491811, 0, 0.9803922, 1, 1,
0.07425344, 0.862111, -0.4430245, 0, 0.9764706, 1, 1,
0.07492148, -2.106376, 3.152287, 0, 0.9686275, 1, 1,
0.07521559, 1.390482, 0.3185467, 0, 0.9647059, 1, 1,
0.07655068, -0.3094045, 2.222065, 0, 0.9568627, 1, 1,
0.07702819, 0.7898972, 1.656472, 0, 0.9529412, 1, 1,
0.08059836, -0.5930919, 3.04258, 0, 0.945098, 1, 1,
0.08690029, 0.3199004, 2.214725, 0, 0.9411765, 1, 1,
0.08934175, -0.2111857, 1.962948, 0, 0.9333333, 1, 1,
0.09024788, 0.8516065, -1.197864, 0, 0.9294118, 1, 1,
0.09203736, -1.006913, 4.452047, 0, 0.9215686, 1, 1,
0.09774976, -0.4192273, 1.965867, 0, 0.9176471, 1, 1,
0.09884432, 0.06594738, 0.6955894, 0, 0.9098039, 1, 1,
0.1040593, 0.8036343, -0.7060798, 0, 0.9058824, 1, 1,
0.1048152, 0.2466661, 0.06508624, 0, 0.8980392, 1, 1,
0.1087146, 0.8900527, -1.169239, 0, 0.8901961, 1, 1,
0.1115161, -0.04949727, 2.823211, 0, 0.8862745, 1, 1,
0.1177022, 0.9823898, 1.10617, 0, 0.8784314, 1, 1,
0.1210991, -0.4339614, 0.791019, 0, 0.8745098, 1, 1,
0.1263154, 2.265487, -0.3844068, 0, 0.8666667, 1, 1,
0.1303855, 0.6983874, -0.5876168, 0, 0.8627451, 1, 1,
0.1311309, -0.07720502, 1.499876, 0, 0.854902, 1, 1,
0.1320706, -0.4510503, 4.018907, 0, 0.8509804, 1, 1,
0.1344155, -2.403402, 3.231673, 0, 0.8431373, 1, 1,
0.1431161, -0.5366646, 3.465627, 0, 0.8392157, 1, 1,
0.1442605, 1.51534, -0.3321305, 0, 0.8313726, 1, 1,
0.1449725, -0.3141843, 3.718547, 0, 0.827451, 1, 1,
0.145064, -1.077609, 2.857217, 0, 0.8196079, 1, 1,
0.1483756, 0.6760737, 0.2639879, 0, 0.8156863, 1, 1,
0.1508136, -1.784738, 3.218558, 0, 0.8078431, 1, 1,
0.1522861, 0.00140413, 2.84076, 0, 0.8039216, 1, 1,
0.1530457, 1.46636, 0.1322167, 0, 0.7960784, 1, 1,
0.1544712, -0.9358637, 3.015672, 0, 0.7882353, 1, 1,
0.1566425, 0.5339478, 0.9278672, 0, 0.7843137, 1, 1,
0.1584082, 0.538774, 1.982059, 0, 0.7764706, 1, 1,
0.162384, 0.6004988, 0.6175822, 0, 0.772549, 1, 1,
0.1655283, 0.5629157, -0.4924519, 0, 0.7647059, 1, 1,
0.1744621, -1.100271, 3.018468, 0, 0.7607843, 1, 1,
0.1755564, -0.1261234, 1.894671, 0, 0.7529412, 1, 1,
0.1774877, -1.267889, 3.721178, 0, 0.7490196, 1, 1,
0.178003, -0.5649651, 1.773153, 0, 0.7411765, 1, 1,
0.178742, -0.8337941, 2.154169, 0, 0.7372549, 1, 1,
0.1820524, -0.27871, 2.536683, 0, 0.7294118, 1, 1,
0.1836866, -2.422919, 3.177432, 0, 0.7254902, 1, 1,
0.1859085, -1.483722, 3.535811, 0, 0.7176471, 1, 1,
0.1876848, -0.7841474, 2.056144, 0, 0.7137255, 1, 1,
0.1910082, 0.2195866, 1.105864, 0, 0.7058824, 1, 1,
0.1939786, -0.385707, 1.681859, 0, 0.6980392, 1, 1,
0.1954798, 0.3801242, 0.6807007, 0, 0.6941177, 1, 1,
0.1956087, -1.22031, 2.763638, 0, 0.6862745, 1, 1,
0.1972728, -2.23721, 2.138063, 0, 0.682353, 1, 1,
0.1977617, -0.07256803, 2.414839, 0, 0.6745098, 1, 1,
0.2003183, 0.6393788, 0.3973196, 0, 0.6705883, 1, 1,
0.2007853, 0.8721237, -0.6628156, 0, 0.6627451, 1, 1,
0.205345, 2.362296, -1.150444, 0, 0.6588235, 1, 1,
0.20614, -1.59594, 2.17085, 0, 0.6509804, 1, 1,
0.2064782, -0.05078272, 1.46461, 0, 0.6470588, 1, 1,
0.207217, 0.5061513, -0.2828874, 0, 0.6392157, 1, 1,
0.210876, 0.8441324, -0.1023825, 0, 0.6352941, 1, 1,
0.2139364, -0.4604044, 3.17859, 0, 0.627451, 1, 1,
0.2144459, -0.2474627, 1.880654, 0, 0.6235294, 1, 1,
0.2154234, 0.4999724, -0.3525763, 0, 0.6156863, 1, 1,
0.219901, 0.02340127, 2.828568, 0, 0.6117647, 1, 1,
0.2216048, -0.07698724, 2.986918, 0, 0.6039216, 1, 1,
0.2236543, -0.2231095, 1.279094, 0, 0.5960785, 1, 1,
0.2282972, 0.2835711, 2.266295, 0, 0.5921569, 1, 1,
0.2292962, -1.878669, 4.418298, 0, 0.5843138, 1, 1,
0.2298418, 1.029156, -0.03226705, 0, 0.5803922, 1, 1,
0.2397012, -0.4962881, 2.45703, 0, 0.572549, 1, 1,
0.2402458, 0.167618, 1.936846, 0, 0.5686275, 1, 1,
0.2416898, -0.8507774, 2.045264, 0, 0.5607843, 1, 1,
0.2424785, -0.09247369, 1.150554, 0, 0.5568628, 1, 1,
0.2467201, 0.1032762, 2.126226, 0, 0.5490196, 1, 1,
0.2505521, -0.4612376, 2.252408, 0, 0.5450981, 1, 1,
0.2551532, -0.2394596, 2.322368, 0, 0.5372549, 1, 1,
0.2561382, 1.245273, 0.7088326, 0, 0.5333334, 1, 1,
0.2582594, 1.506867, -0.3647979, 0, 0.5254902, 1, 1,
0.2630681, 0.09542824, 2.894999, 0, 0.5215687, 1, 1,
0.2635725, -1.251569, 2.195467, 0, 0.5137255, 1, 1,
0.2645286, -1.427959, 2.391483, 0, 0.509804, 1, 1,
0.264632, -0.8922622, 1.592197, 0, 0.5019608, 1, 1,
0.2648144, 0.4183691, 1.317861, 0, 0.4941176, 1, 1,
0.2660519, 0.04889366, 3.352536, 0, 0.4901961, 1, 1,
0.2662118, -0.491011, 1.950762, 0, 0.4823529, 1, 1,
0.2665988, 1.21563, 0.4961392, 0, 0.4784314, 1, 1,
0.2669607, 0.06828038, 1.760717, 0, 0.4705882, 1, 1,
0.2671485, -0.6499784, 3.018358, 0, 0.4666667, 1, 1,
0.2683971, -0.1615491, 0.3701687, 0, 0.4588235, 1, 1,
0.2741573, 1.52293, 0.6897951, 0, 0.454902, 1, 1,
0.2745566, 0.1513345, 0.01760185, 0, 0.4470588, 1, 1,
0.2841001, -0.5691462, 2.633561, 0, 0.4431373, 1, 1,
0.2845172, -0.546008, 1.683911, 0, 0.4352941, 1, 1,
0.2850085, 0.9912264, 0.7603124, 0, 0.4313726, 1, 1,
0.2851757, -1.292146, 3.097384, 0, 0.4235294, 1, 1,
0.2871435, 0.8003663, -0.1414956, 0, 0.4196078, 1, 1,
0.2892473, 1.102653, 0.6079122, 0, 0.4117647, 1, 1,
0.2914018, 0.5881432, 1.285213, 0, 0.4078431, 1, 1,
0.2919057, -1.148741, 2.164143, 0, 0.4, 1, 1,
0.3013735, -0.3181467, 1.953842, 0, 0.3921569, 1, 1,
0.3051742, 0.2104568, 3.139194, 0, 0.3882353, 1, 1,
0.3095956, 0.5415874, 0.900715, 0, 0.3803922, 1, 1,
0.318144, -0.489029, 1.194256, 0, 0.3764706, 1, 1,
0.3213403, 0.3846265, -0.2233055, 0, 0.3686275, 1, 1,
0.3295125, 1.521049, -0.3093854, 0, 0.3647059, 1, 1,
0.3296694, 1.312768, 1.016069, 0, 0.3568628, 1, 1,
0.3325671, -0.3552192, 4.206734, 0, 0.3529412, 1, 1,
0.332799, -0.8614811, 3.217484, 0, 0.345098, 1, 1,
0.3357567, -0.5993142, 2.653352, 0, 0.3411765, 1, 1,
0.339854, 0.1786605, 0.9587108, 0, 0.3333333, 1, 1,
0.3417077, 0.4356081, 1.444054, 0, 0.3294118, 1, 1,
0.3465967, -1.485636, 2.23344, 0, 0.3215686, 1, 1,
0.348195, -0.1439086, 1.878967, 0, 0.3176471, 1, 1,
0.3512761, -1.060296, 3.770745, 0, 0.3098039, 1, 1,
0.3528443, 1.20981, 1.069154, 0, 0.3058824, 1, 1,
0.3598433, 1.330571, 0.9241498, 0, 0.2980392, 1, 1,
0.3616939, -0.7719595, 3.253623, 0, 0.2901961, 1, 1,
0.3626674, -0.679876, 3.564491, 0, 0.2862745, 1, 1,
0.3675154, -0.2486343, 0.5357374, 0, 0.2784314, 1, 1,
0.3686786, 0.4970725, 1.636053, 0, 0.2745098, 1, 1,
0.3688099, 1.468367, 1.487761, 0, 0.2666667, 1, 1,
0.3691971, 0.4431897, 0.6889663, 0, 0.2627451, 1, 1,
0.3766448, -0.9138309, 2.117515, 0, 0.254902, 1, 1,
0.3771265, -1.007157, 0.5097737, 0, 0.2509804, 1, 1,
0.3776706, -2.161181, 2.592048, 0, 0.2431373, 1, 1,
0.3830736, -0.154696, 2.896452, 0, 0.2392157, 1, 1,
0.3882429, 0.1654744, 0.4351647, 0, 0.2313726, 1, 1,
0.3885488, 0.633482, 1.561093, 0, 0.227451, 1, 1,
0.396563, 0.06952409, -0.2673028, 0, 0.2196078, 1, 1,
0.4053181, -0.8338033, 2.912426, 0, 0.2156863, 1, 1,
0.4079411, 1.149941, 0.6145675, 0, 0.2078431, 1, 1,
0.4100862, -0.4791035, 2.251114, 0, 0.2039216, 1, 1,
0.4101892, 0.9602398, 0.6850173, 0, 0.1960784, 1, 1,
0.4115282, 1.572447, 0.4036298, 0, 0.1882353, 1, 1,
0.4126798, 0.083899, 2.983382, 0, 0.1843137, 1, 1,
0.416621, 0.2924983, -0.8036491, 0, 0.1764706, 1, 1,
0.4168548, -2.112406, 3.424013, 0, 0.172549, 1, 1,
0.4200673, 0.1955331, 2.096279, 0, 0.1647059, 1, 1,
0.4201344, -0.2487159, 1.727742, 0, 0.1607843, 1, 1,
0.4222279, 0.8347114, -0.09156252, 0, 0.1529412, 1, 1,
0.4228261, -0.7947955, 3.589465, 0, 0.1490196, 1, 1,
0.4311736, -1.589019, 2.709706, 0, 0.1411765, 1, 1,
0.4322454, 0.6523148, -1.002186, 0, 0.1372549, 1, 1,
0.4335166, 0.03592831, 0.4109219, 0, 0.1294118, 1, 1,
0.4360538, 0.4059475, 2.264634, 0, 0.1254902, 1, 1,
0.4408578, 0.84203, 1.861389, 0, 0.1176471, 1, 1,
0.4442153, 0.8027297, -1.583639, 0, 0.1137255, 1, 1,
0.4469329, 0.02979081, 1.64366, 0, 0.1058824, 1, 1,
0.4493008, -0.9186232, 3.114578, 0, 0.09803922, 1, 1,
0.452365, 0.233454, 1.589148, 0, 0.09411765, 1, 1,
0.4529566, -0.5794444, 4.378064, 0, 0.08627451, 1, 1,
0.465033, -0.3796548, 2.61605, 0, 0.08235294, 1, 1,
0.4659153, -0.2802291, 4.135723, 0, 0.07450981, 1, 1,
0.4666134, -0.8747334, 3.249984, 0, 0.07058824, 1, 1,
0.4682803, 1.879931, 1.21821, 0, 0.0627451, 1, 1,
0.4683284, 0.8834013, 0.7164364, 0, 0.05882353, 1, 1,
0.468354, 0.2443048, 1.697563, 0, 0.05098039, 1, 1,
0.4696642, 0.7552236, -0.359174, 0, 0.04705882, 1, 1,
0.4702767, 0.635888, 0.6993063, 0, 0.03921569, 1, 1,
0.4721078, 1.512014, -0.256687, 0, 0.03529412, 1, 1,
0.4732929, -0.7954555, 1.622528, 0, 0.02745098, 1, 1,
0.4793245, 2.311126, 0.8830011, 0, 0.02352941, 1, 1,
0.4812422, -1.409664, 4.423433, 0, 0.01568628, 1, 1,
0.4873183, -0.6094648, 3.17782, 0, 0.01176471, 1, 1,
0.4939716, 0.04855902, 1.82292, 0, 0.003921569, 1, 1,
0.4962373, -0.03104082, 1.17043, 0.003921569, 0, 1, 1,
0.5089516, 0.6672813, 0.5125592, 0.007843138, 0, 1, 1,
0.5142864, -1.109133, 3.773922, 0.01568628, 0, 1, 1,
0.5173422, -0.1873057, 1.021933, 0.01960784, 0, 1, 1,
0.5201146, -0.2948081, 1.719407, 0.02745098, 0, 1, 1,
0.5207027, 1.540401, -0.3918928, 0.03137255, 0, 1, 1,
0.5216561, -0.06697473, 3.582061, 0.03921569, 0, 1, 1,
0.5221027, 0.7021827, 0.0691065, 0.04313726, 0, 1, 1,
0.5233714, -0.9574198, 0.6376714, 0.05098039, 0, 1, 1,
0.5300276, 0.5222753, 0.4500495, 0.05490196, 0, 1, 1,
0.5310087, 2.102071, -1.265169, 0.0627451, 0, 1, 1,
0.5330663, -0.162446, 0.7755166, 0.06666667, 0, 1, 1,
0.5362877, 0.6762522, 1.179995, 0.07450981, 0, 1, 1,
0.5363795, -0.1696003, 2.013441, 0.07843138, 0, 1, 1,
0.5388605, -0.723016, 2.605706, 0.08627451, 0, 1, 1,
0.5444365, 0.2491705, 3.161354, 0.09019608, 0, 1, 1,
0.5464708, -0.9877465, 5.030518, 0.09803922, 0, 1, 1,
0.5476752, -0.01020952, 2.591262, 0.1058824, 0, 1, 1,
0.5484849, -1.141479, 1.602848, 0.1098039, 0, 1, 1,
0.5507314, 0.648716, 0.5361855, 0.1176471, 0, 1, 1,
0.552626, -0.6040809, 1.301009, 0.1215686, 0, 1, 1,
0.5546088, 0.01593613, 1.670297, 0.1294118, 0, 1, 1,
0.5561882, -0.08759289, 2.863511, 0.1333333, 0, 1, 1,
0.5602765, 1.810832, -0.03354456, 0.1411765, 0, 1, 1,
0.5616822, 0.5846674, 2.023307, 0.145098, 0, 1, 1,
0.5629213, 0.9233776, 0.07603627, 0.1529412, 0, 1, 1,
0.5685574, 1.295698, -0.6278245, 0.1568628, 0, 1, 1,
0.5727708, 1.393957, 0.391475, 0.1647059, 0, 1, 1,
0.5745339, 0.1115758, 0.6705653, 0.1686275, 0, 1, 1,
0.57573, 0.4515401, -0.7748207, 0.1764706, 0, 1, 1,
0.5773204, -0.08967882, 2.102892, 0.1803922, 0, 1, 1,
0.5791679, -0.7100298, 2.313693, 0.1882353, 0, 1, 1,
0.5853996, -0.2200315, 2.948223, 0.1921569, 0, 1, 1,
0.5939153, -1.495238, 3.428026, 0.2, 0, 1, 1,
0.5942536, -0.5537217, 1.904432, 0.2078431, 0, 1, 1,
0.59682, 1.076216, 0.9739562, 0.2117647, 0, 1, 1,
0.5978651, -0.7201297, 4.694165, 0.2196078, 0, 1, 1,
0.6000702, 1.284286, -1.34415, 0.2235294, 0, 1, 1,
0.6005022, -2.206239, 2.37393, 0.2313726, 0, 1, 1,
0.6040087, 0.2999997, 1.497953, 0.2352941, 0, 1, 1,
0.6101412, 0.3823792, 0.1397139, 0.2431373, 0, 1, 1,
0.6113497, 0.1859009, 1.874498, 0.2470588, 0, 1, 1,
0.616819, 0.2059568, 1.121072, 0.254902, 0, 1, 1,
0.6168287, -0.3490241, 1.050846, 0.2588235, 0, 1, 1,
0.6208704, -1.511669, 1.094405, 0.2666667, 0, 1, 1,
0.6243013, -0.8568726, 2.249006, 0.2705882, 0, 1, 1,
0.6288743, -0.01563822, 0.3863491, 0.2784314, 0, 1, 1,
0.6376893, -1.478565, 3.847513, 0.282353, 0, 1, 1,
0.6430454, 0.786687, -0.4408294, 0.2901961, 0, 1, 1,
0.6445108, -0.9817517, 3.289828, 0.2941177, 0, 1, 1,
0.6480691, -0.9670938, 2.000558, 0.3019608, 0, 1, 1,
0.64823, 1.223294, 0.1001223, 0.3098039, 0, 1, 1,
0.6487917, 0.6253174, 1.959152, 0.3137255, 0, 1, 1,
0.6538996, 0.2421052, -0.1338602, 0.3215686, 0, 1, 1,
0.6545637, 0.7572098, 2.038678, 0.3254902, 0, 1, 1,
0.6573415, -0.602135, 2.40534, 0.3333333, 0, 1, 1,
0.657546, -0.460668, 3.322803, 0.3372549, 0, 1, 1,
0.6616485, 0.05237461, 1.180785, 0.345098, 0, 1, 1,
0.6658356, 0.8625323, -0.8980208, 0.3490196, 0, 1, 1,
0.6676412, -0.293662, 2.390055, 0.3568628, 0, 1, 1,
0.68154, 2.856452, -0.3876168, 0.3607843, 0, 1, 1,
0.6827355, -0.5014555, 2.453979, 0.3686275, 0, 1, 1,
0.689034, 1.267503, 0.5035079, 0.372549, 0, 1, 1,
0.6909556, -0.3840472, -0.1222288, 0.3803922, 0, 1, 1,
0.6956238, 0.2036218, 2.061349, 0.3843137, 0, 1, 1,
0.6963624, -0.7778288, 3.14231, 0.3921569, 0, 1, 1,
0.6971612, 0.5932685, -0.149363, 0.3960784, 0, 1, 1,
0.7018921, 1.314978, 0.8632351, 0.4039216, 0, 1, 1,
0.7062715, -0.3081203, 1.350617, 0.4117647, 0, 1, 1,
0.7067622, 0.3329122, 0.4015316, 0.4156863, 0, 1, 1,
0.7078063, -0.7904781, 1.540371, 0.4235294, 0, 1, 1,
0.7089284, -1.0078, 2.409544, 0.427451, 0, 1, 1,
0.7123324, -1.749362, 3.791902, 0.4352941, 0, 1, 1,
0.7151543, -0.9851962, 1.944883, 0.4392157, 0, 1, 1,
0.7155774, 1.817862, 0.536495, 0.4470588, 0, 1, 1,
0.7244769, -0.595736, 1.656976, 0.4509804, 0, 1, 1,
0.7289877, -0.1437659, 0.9901624, 0.4588235, 0, 1, 1,
0.7322274, -0.7206488, 0.5374045, 0.4627451, 0, 1, 1,
0.7401829, -0.5534246, 1.631625, 0.4705882, 0, 1, 1,
0.7445963, -1.782751, 4.146476, 0.4745098, 0, 1, 1,
0.7506586, 0.01368052, 1.387912, 0.4823529, 0, 1, 1,
0.7584491, -1.016416, 0.819204, 0.4862745, 0, 1, 1,
0.7613668, 0.9185956, 2.634072, 0.4941176, 0, 1, 1,
0.7632251, -0.5925555, 0.919857, 0.5019608, 0, 1, 1,
0.7682573, 1.812853, 1.106499, 0.5058824, 0, 1, 1,
0.7722828, -0.519547, 1.7667, 0.5137255, 0, 1, 1,
0.7758002, 0.3341983, 0.7449945, 0.5176471, 0, 1, 1,
0.7797725, 0.1092343, 3.161352, 0.5254902, 0, 1, 1,
0.7798834, 0.6969069, 2.234325, 0.5294118, 0, 1, 1,
0.78168, -2.326305, 3.16103, 0.5372549, 0, 1, 1,
0.7851831, -0.08825322, 1.878496, 0.5411765, 0, 1, 1,
0.7855704, -0.4571409, 0.5573196, 0.5490196, 0, 1, 1,
0.7915441, -0.6620148, 1.062015, 0.5529412, 0, 1, 1,
0.7967796, -1.064418, 2.248456, 0.5607843, 0, 1, 1,
0.7968155, -0.991004, 2.491389, 0.5647059, 0, 1, 1,
0.7987037, 1.021047, 0.3577166, 0.572549, 0, 1, 1,
0.8001286, 1.384582, 2.469302, 0.5764706, 0, 1, 1,
0.8087388, -0.05432932, 1.03833, 0.5843138, 0, 1, 1,
0.8118911, 0.4380901, 0.9274355, 0.5882353, 0, 1, 1,
0.8143808, -0.6927317, 1.563277, 0.5960785, 0, 1, 1,
0.8216545, -0.01257113, 0.3912039, 0.6039216, 0, 1, 1,
0.8252255, 0.08208328, 3.091508, 0.6078432, 0, 1, 1,
0.8394079, 0.7681051, -0.288612, 0.6156863, 0, 1, 1,
0.8444629, 0.5220354, 1.031916, 0.6196079, 0, 1, 1,
0.8450229, 1.164095, 0.2861327, 0.627451, 0, 1, 1,
0.8497775, 0.9665671, 0.1805326, 0.6313726, 0, 1, 1,
0.8548074, -0.1322612, 2.936303, 0.6392157, 0, 1, 1,
0.8565071, -0.1780756, 2.487988, 0.6431373, 0, 1, 1,
0.8568795, -0.08151945, 2.99568, 0.6509804, 0, 1, 1,
0.8608824, -0.05908135, 3.208286, 0.654902, 0, 1, 1,
0.8659244, -0.3081543, 2.014207, 0.6627451, 0, 1, 1,
0.873247, 2.184958, 1.259333, 0.6666667, 0, 1, 1,
0.8735803, -0.7054714, 1.509291, 0.6745098, 0, 1, 1,
0.8793982, -0.4775336, 1.178083, 0.6784314, 0, 1, 1,
0.8882464, -0.6664907, 2.363928, 0.6862745, 0, 1, 1,
0.8910351, 0.1454366, 1.053407, 0.6901961, 0, 1, 1,
0.8933516, 1.518973, -0.8122395, 0.6980392, 0, 1, 1,
0.9032242, 0.4001773, 0.5842789, 0.7058824, 0, 1, 1,
0.9032748, 0.974748, 0.9737226, 0.7098039, 0, 1, 1,
0.9083388, -0.8864828, 1.835708, 0.7176471, 0, 1, 1,
0.9111769, -0.4313793, 0.7856249, 0.7215686, 0, 1, 1,
0.9204935, 1.50254, -0.05226029, 0.7294118, 0, 1, 1,
0.9290096, -1.293054, 2.710245, 0.7333333, 0, 1, 1,
0.9290564, -0.7904919, 3.767376, 0.7411765, 0, 1, 1,
0.9309707, 1.546168, 1.541295, 0.7450981, 0, 1, 1,
0.9335011, -0.005239103, 0.5582427, 0.7529412, 0, 1, 1,
0.9373711, 1.517163, 1.663217, 0.7568628, 0, 1, 1,
0.9404571, 2.682558, 1.195376, 0.7647059, 0, 1, 1,
0.940724, 0.2313865, 1.470215, 0.7686275, 0, 1, 1,
0.9447411, -0.8472347, 1.985386, 0.7764706, 0, 1, 1,
0.9454619, 1.420471, -0.1473659, 0.7803922, 0, 1, 1,
0.9484178, -0.726411, 2.290608, 0.7882353, 0, 1, 1,
0.9488692, 1.691889, 0.6968568, 0.7921569, 0, 1, 1,
0.9494719, 0.1579697, 1.360058, 0.8, 0, 1, 1,
0.950225, 0.8601242, 2.167367, 0.8078431, 0, 1, 1,
0.9567693, -0.2422108, 0.1530292, 0.8117647, 0, 1, 1,
0.9585096, 0.6275114, 2.16761, 0.8196079, 0, 1, 1,
0.9606974, 0.1070034, 2.022194, 0.8235294, 0, 1, 1,
0.9609526, -1.958904, 3.349964, 0.8313726, 0, 1, 1,
0.9632492, -0.5690603, 4.388841, 0.8352941, 0, 1, 1,
0.9726709, -1.716183, 2.055583, 0.8431373, 0, 1, 1,
0.9767699, -1.155728, 2.282736, 0.8470588, 0, 1, 1,
0.9774438, 1.712279, 0.5203161, 0.854902, 0, 1, 1,
0.9786779, -0.7596093, 2.412211, 0.8588235, 0, 1, 1,
0.9829294, -0.1792568, 1.453959, 0.8666667, 0, 1, 1,
0.9883018, 1.24192, 1.18946, 0.8705882, 0, 1, 1,
0.9911782, -0.6034771, 2.99162, 0.8784314, 0, 1, 1,
0.9923697, -0.4660268, 2.052474, 0.8823529, 0, 1, 1,
0.9963113, -0.2384527, 1.067671, 0.8901961, 0, 1, 1,
0.9971009, -0.5811362, 3.069116, 0.8941177, 0, 1, 1,
0.9980568, 0.07265536, 2.484729, 0.9019608, 0, 1, 1,
1.001127, -0.2441584, -0.1708901, 0.9098039, 0, 1, 1,
1.001455, 0.5686403, -0.2368125, 0.9137255, 0, 1, 1,
1.002993, 1.168976, 1.438394, 0.9215686, 0, 1, 1,
1.003261, -0.03214609, 3.522215, 0.9254902, 0, 1, 1,
1.006498, -0.7543854, 2.851659, 0.9333333, 0, 1, 1,
1.008998, -0.3245016, 3.018397, 0.9372549, 0, 1, 1,
1.01425, -0.3840758, 1.604359, 0.945098, 0, 1, 1,
1.017151, 0.2266396, 0.5867143, 0.9490196, 0, 1, 1,
1.018921, -0.1844584, 1.618553, 0.9568627, 0, 1, 1,
1.02256, -1.986031, 2.621147, 0.9607843, 0, 1, 1,
1.027461, 0.8359939, 0.5839668, 0.9686275, 0, 1, 1,
1.027733, -1.13822, 1.800137, 0.972549, 0, 1, 1,
1.030001, -0.5435238, 1.733308, 0.9803922, 0, 1, 1,
1.03939, -0.5212902, 3.164719, 0.9843137, 0, 1, 1,
1.044237, -0.1067324, 1.013551, 0.9921569, 0, 1, 1,
1.052652, 1.483367, 1.377977, 0.9960784, 0, 1, 1,
1.057572, 0.5101544, 1.524997, 1, 0, 0.9960784, 1,
1.063867, -0.940831, 3.553705, 1, 0, 0.9882353, 1,
1.067659, 0.762737, 3.043036, 1, 0, 0.9843137, 1,
1.07313, -0.01480234, 1.536375, 1, 0, 0.9764706, 1,
1.073835, -0.3384157, 1.850724, 1, 0, 0.972549, 1,
1.074875, -0.5796968, 2.457512, 1, 0, 0.9647059, 1,
1.083496, -2.846004, 2.113158, 1, 0, 0.9607843, 1,
1.084485, 1.791029, -1.354582, 1, 0, 0.9529412, 1,
1.087539, -0.5533165, 1.714494, 1, 0, 0.9490196, 1,
1.093435, -0.2879549, 1.332221, 1, 0, 0.9411765, 1,
1.094171, -0.1554793, 3.847404, 1, 0, 0.9372549, 1,
1.098936, -0.856537, 1.642142, 1, 0, 0.9294118, 1,
1.102249, 1.589216, 1.045235, 1, 0, 0.9254902, 1,
1.106202, -1.223737, 2.434388, 1, 0, 0.9176471, 1,
1.106476, 0.015914, 3.066734, 1, 0, 0.9137255, 1,
1.117756, -1.144832, 3.352143, 1, 0, 0.9058824, 1,
1.123148, -2.181845, 3.836692, 1, 0, 0.9019608, 1,
1.125698, 1.590799, 1.660168, 1, 0, 0.8941177, 1,
1.128791, -0.3247659, 2.833056, 1, 0, 0.8862745, 1,
1.136537, 1.459823, 1.296983, 1, 0, 0.8823529, 1,
1.138228, -0.4025367, 2.348332, 1, 0, 0.8745098, 1,
1.141463, 1.820868, 2.167836, 1, 0, 0.8705882, 1,
1.143415, 0.04410421, 3.814618, 1, 0, 0.8627451, 1,
1.144772, 0.5539445, 2.231021, 1, 0, 0.8588235, 1,
1.14901, 2.433756, -0.1147814, 1, 0, 0.8509804, 1,
1.153204, -0.1538223, 1.213655, 1, 0, 0.8470588, 1,
1.153439, 1.343919, 2.793826, 1, 0, 0.8392157, 1,
1.156893, 1.160114, -0.3640727, 1, 0, 0.8352941, 1,
1.172376, 0.5459728, 1.662766, 1, 0, 0.827451, 1,
1.173895, -0.1513944, 2.546902, 1, 0, 0.8235294, 1,
1.174408, 1.224218, 0.932112, 1, 0, 0.8156863, 1,
1.17546, -0.7216976, 2.333766, 1, 0, 0.8117647, 1,
1.185624, 0.1269042, -0.8895412, 1, 0, 0.8039216, 1,
1.188132, -0.06991291, 2.309125, 1, 0, 0.7960784, 1,
1.190424, 1.212485, 2.049322, 1, 0, 0.7921569, 1,
1.197205, 0.4751566, 0.7159931, 1, 0, 0.7843137, 1,
1.19895, 0.2548392, 1.761679, 1, 0, 0.7803922, 1,
1.201785, 0.2197808, 1.890669, 1, 0, 0.772549, 1,
1.202124, -0.6995394, 1.629968, 1, 0, 0.7686275, 1,
1.211185, 0.2787753, 2.487138, 1, 0, 0.7607843, 1,
1.213406, -0.740752, 2.89684, 1, 0, 0.7568628, 1,
1.220627, 1.659598, 0.5831367, 1, 0, 0.7490196, 1,
1.229708, 0.09872419, 3.311514, 1, 0, 0.7450981, 1,
1.231864, 1.086955, -0.6061991, 1, 0, 0.7372549, 1,
1.232757, -0.7592936, 3.143516, 1, 0, 0.7333333, 1,
1.247518, 0.2885304, -0.1688762, 1, 0, 0.7254902, 1,
1.250951, -0.5133132, 2.359326, 1, 0, 0.7215686, 1,
1.257113, -0.7835996, 1.377696, 1, 0, 0.7137255, 1,
1.258617, -1.795624, 2.435509, 1, 0, 0.7098039, 1,
1.265169, 1.18867, 2.31244, 1, 0, 0.7019608, 1,
1.265636, 0.1696748, 1.168475, 1, 0, 0.6941177, 1,
1.274722, -0.4883018, 1.108609, 1, 0, 0.6901961, 1,
1.274949, -0.6666301, 4.021131, 1, 0, 0.682353, 1,
1.284427, 0.447316, 1.77594, 1, 0, 0.6784314, 1,
1.285886, 1.289011, 2.63247, 1, 0, 0.6705883, 1,
1.286344, 0.7287866, 1.118743, 1, 0, 0.6666667, 1,
1.293657, -0.3239776, 0.06673582, 1, 0, 0.6588235, 1,
1.311733, 0.4654486, 1.63987, 1, 0, 0.654902, 1,
1.312587, -1.31212, 3.051497, 1, 0, 0.6470588, 1,
1.319077, -0.05494959, 3.657109, 1, 0, 0.6431373, 1,
1.323975, -0.4028318, 1.903403, 1, 0, 0.6352941, 1,
1.335142, -0.5780949, -0.1264317, 1, 0, 0.6313726, 1,
1.335975, 1.684187, 1.514392, 1, 0, 0.6235294, 1,
1.353027, -0.07744279, 1.243018, 1, 0, 0.6196079, 1,
1.354308, 0.09549247, 1.065198, 1, 0, 0.6117647, 1,
1.363004, 0.2773191, 2.275533, 1, 0, 0.6078432, 1,
1.363382, -0.4879458, 1.615651, 1, 0, 0.6, 1,
1.365278, 0.3476427, 2.235861, 1, 0, 0.5921569, 1,
1.370586, -0.6209373, 1.861717, 1, 0, 0.5882353, 1,
1.371095, -1.854404, 2.153052, 1, 0, 0.5803922, 1,
1.381353, -0.3794897, 3.826435, 1, 0, 0.5764706, 1,
1.382228, 0.215061, 0.3056717, 1, 0, 0.5686275, 1,
1.385625, -0.09609038, 1.820757, 1, 0, 0.5647059, 1,
1.391703, -0.6609496, 2.080365, 1, 0, 0.5568628, 1,
1.394857, -0.2343439, 0.577278, 1, 0, 0.5529412, 1,
1.400212, 0.100875, 1.931513, 1, 0, 0.5450981, 1,
1.404737, -0.4633518, -0.5382244, 1, 0, 0.5411765, 1,
1.412201, -1.243608, 1.958525, 1, 0, 0.5333334, 1,
1.427291, -0.3091048, 0.9907538, 1, 0, 0.5294118, 1,
1.428859, -1.126141, 1.235116, 1, 0, 0.5215687, 1,
1.445452, -0.6308399, 1.606791, 1, 0, 0.5176471, 1,
1.445966, -1.861788, 0.4098703, 1, 0, 0.509804, 1,
1.468707, 1.483364, 1.297832, 1, 0, 0.5058824, 1,
1.46963, 0.1438039, 2.211026, 1, 0, 0.4980392, 1,
1.473598, 1.13717, 1.619146, 1, 0, 0.4901961, 1,
1.475216, 0.0259274, 2.918784, 1, 0, 0.4862745, 1,
1.484133, 0.8362134, 2.544749, 1, 0, 0.4784314, 1,
1.487155, -2.376192, 3.153341, 1, 0, 0.4745098, 1,
1.499424, -0.9666437, 1.792767, 1, 0, 0.4666667, 1,
1.502351, -0.4577831, -0.09712326, 1, 0, 0.4627451, 1,
1.508629, -0.05019736, 3.153186, 1, 0, 0.454902, 1,
1.520976, -0.2926131, 1.090676, 1, 0, 0.4509804, 1,
1.523196, -1.925626, 2.065088, 1, 0, 0.4431373, 1,
1.533892, 1.282244, 1.219823, 1, 0, 0.4392157, 1,
1.534885, 0.417725, 1.628129, 1, 0, 0.4313726, 1,
1.537038, -2.191811, 1.591579, 1, 0, 0.427451, 1,
1.537315, 1.238276, 0.488513, 1, 0, 0.4196078, 1,
1.541196, -0.5495178, 0.8187606, 1, 0, 0.4156863, 1,
1.542571, 0.7641342, 0.6338867, 1, 0, 0.4078431, 1,
1.544017, -1.46567, 2.959027, 1, 0, 0.4039216, 1,
1.546991, 1.078596, 0.9745137, 1, 0, 0.3960784, 1,
1.552162, -0.2756945, 1.772553, 1, 0, 0.3882353, 1,
1.554523, 0.5157642, 0.3322107, 1, 0, 0.3843137, 1,
1.565899, 0.8943833, 1.378307, 1, 0, 0.3764706, 1,
1.571599, 0.8695635, 2.275053, 1, 0, 0.372549, 1,
1.584015, -2.036572, 3.347986, 1, 0, 0.3647059, 1,
1.587679, 0.731217, -0.924374, 1, 0, 0.3607843, 1,
1.61354, 0.4193145, 0.2136477, 1, 0, 0.3529412, 1,
1.618823, -0.2054866, 1.231354, 1, 0, 0.3490196, 1,
1.620358, 2.562503, 0.1371952, 1, 0, 0.3411765, 1,
1.620744, 0.3219005, -0.2336697, 1, 0, 0.3372549, 1,
1.623805, -0.5806753, -0.01933894, 1, 0, 0.3294118, 1,
1.627498, 0.4016797, 2.216116, 1, 0, 0.3254902, 1,
1.632065, 0.2815726, 0.4159144, 1, 0, 0.3176471, 1,
1.633567, -1.131317, 2.590289, 1, 0, 0.3137255, 1,
1.638543, 0.2598799, 2.532126, 1, 0, 0.3058824, 1,
1.642704, 0.1707937, 3.164574, 1, 0, 0.2980392, 1,
1.662505, 0.7483484, 1.219639, 1, 0, 0.2941177, 1,
1.663304, 0.5966642, 0.2289067, 1, 0, 0.2862745, 1,
1.663512, 0.1280362, 0.3532227, 1, 0, 0.282353, 1,
1.67193, 0.6798202, 2.391334, 1, 0, 0.2745098, 1,
1.675953, 1.663669, 1.094085, 1, 0, 0.2705882, 1,
1.682267, -1.139714, 1.839995, 1, 0, 0.2627451, 1,
1.726109, -0.8438936, 1.257185, 1, 0, 0.2588235, 1,
1.73062, -1.169928, 0.9166115, 1, 0, 0.2509804, 1,
1.735977, 0.7103022, -0.2205227, 1, 0, 0.2470588, 1,
1.759712, -0.9174641, 2.371417, 1, 0, 0.2392157, 1,
1.759901, 0.3213934, 2.254805, 1, 0, 0.2352941, 1,
1.764131, -1.058281, 1.376316, 1, 0, 0.227451, 1,
1.775099, -1.400368, 3.613658, 1, 0, 0.2235294, 1,
1.782053, 0.6922207, 2.509129, 1, 0, 0.2156863, 1,
1.810791, 1.089523, 1.745953, 1, 0, 0.2117647, 1,
1.830258, -1.621524, 3.120379, 1, 0, 0.2039216, 1,
1.835851, -0.5817475, 1.061971, 1, 0, 0.1960784, 1,
1.845203, 2.534632, 0.1492971, 1, 0, 0.1921569, 1,
1.856497, 1.120258, 0.8794075, 1, 0, 0.1843137, 1,
1.904254, -2.289407, 0.5921534, 1, 0, 0.1803922, 1,
1.917381, 0.06656977, 1.190644, 1, 0, 0.172549, 1,
1.942125, -0.02893127, 1.433414, 1, 0, 0.1686275, 1,
1.946569, 1.788452, 0.7856686, 1, 0, 0.1607843, 1,
1.961787, 0.1203832, 2.164598, 1, 0, 0.1568628, 1,
1.966915, 0.8045616, 1.307599, 1, 0, 0.1490196, 1,
1.977109, 1.029064, 2.310641, 1, 0, 0.145098, 1,
2.006221, 1.320582, 0.6793354, 1, 0, 0.1372549, 1,
2.009536, 0.8791506, 2.97005, 1, 0, 0.1333333, 1,
2.031475, 0.7693344, 0.7519646, 1, 0, 0.1254902, 1,
2.055866, 0.4784397, 0.9281255, 1, 0, 0.1215686, 1,
2.077903, 0.309839, 2.26137, 1, 0, 0.1137255, 1,
2.091011, 0.1412625, 2.386465, 1, 0, 0.1098039, 1,
2.098327, 2.029519, 1.213199, 1, 0, 0.1019608, 1,
2.11036, -1.294101, 0.541067, 1, 0, 0.09411765, 1,
2.200796, 0.03281792, -0.3661039, 1, 0, 0.09019608, 1,
2.260137, 0.8987553, -0.06074087, 1, 0, 0.08235294, 1,
2.265335, -0.8367211, 2.496722, 1, 0, 0.07843138, 1,
2.268179, 0.4372281, 1.086838, 1, 0, 0.07058824, 1,
2.333547, -0.3943155, 2.847219, 1, 0, 0.06666667, 1,
2.361178, -1.168365, 0.2361009, 1, 0, 0.05882353, 1,
2.371528, -0.2520852, 0.3003188, 1, 0, 0.05490196, 1,
2.410439, -0.2923449, 0.8185047, 1, 0, 0.04705882, 1,
2.419304, -0.493486, 2.195531, 1, 0, 0.04313726, 1,
2.432714, 0.8081747, 2.949846, 1, 0, 0.03529412, 1,
2.467467, 1.963349, 2.209891, 1, 0, 0.03137255, 1,
2.693197, -0.2746035, 1.911752, 1, 0, 0.02352941, 1,
2.761331, 0.8742043, 1.903728, 1, 0, 0.01960784, 1,
3.173537, -1.30041, 3.157951, 1, 0, 0.01176471, 1,
4.619224, 0.2824346, 1.602385, 1, 0, 0.007843138, 1
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
0.5992807, -3.945954, -6.099483, 0, -0.5, 0.5, 0.5,
0.5992807, -3.945954, -6.099483, 1, -0.5, 0.5, 0.5,
0.5992807, -3.945954, -6.099483, 1, 1.5, 0.5, 0.5,
0.5992807, -3.945954, -6.099483, 0, 1.5, 0.5, 0.5
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
-4.783423, -0.05180168, -6.099483, 0, -0.5, 0.5, 0.5,
-4.783423, -0.05180168, -6.099483, 1, -0.5, 0.5, 0.5,
-4.783423, -0.05180168, -6.099483, 1, 1.5, 0.5, 0.5,
-4.783423, -0.05180168, -6.099483, 0, 1.5, 0.5, 0.5
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
-4.783423, -3.945954, 0.3816226, 0, -0.5, 0.5, 0.5,
-4.783423, -3.945954, 0.3816226, 1, -0.5, 0.5, 0.5,
-4.783423, -3.945954, 0.3816226, 1, 1.5, 0.5, 0.5,
-4.783423, -3.945954, 0.3816226, 0, 1.5, 0.5, 0.5
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
-2, -3.047303, -4.603844,
4, -3.047303, -4.603844,
-2, -3.047303, -4.603844,
-2, -3.197078, -4.853117,
0, -3.047303, -4.603844,
0, -3.197078, -4.853117,
2, -3.047303, -4.603844,
2, -3.197078, -4.853117,
4, -3.047303, -4.603844,
4, -3.197078, -4.853117
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
"2",
"4"
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
-2, -3.496629, -5.351664, 0, -0.5, 0.5, 0.5,
-2, -3.496629, -5.351664, 1, -0.5, 0.5, 0.5,
-2, -3.496629, -5.351664, 1, 1.5, 0.5, 0.5,
-2, -3.496629, -5.351664, 0, 1.5, 0.5, 0.5,
0, -3.496629, -5.351664, 0, -0.5, 0.5, 0.5,
0, -3.496629, -5.351664, 1, -0.5, 0.5, 0.5,
0, -3.496629, -5.351664, 1, 1.5, 0.5, 0.5,
0, -3.496629, -5.351664, 0, 1.5, 0.5, 0.5,
2, -3.496629, -5.351664, 0, -0.5, 0.5, 0.5,
2, -3.496629, -5.351664, 1, -0.5, 0.5, 0.5,
2, -3.496629, -5.351664, 1, 1.5, 0.5, 0.5,
2, -3.496629, -5.351664, 0, 1.5, 0.5, 0.5,
4, -3.496629, -5.351664, 0, -0.5, 0.5, 0.5,
4, -3.496629, -5.351664, 1, -0.5, 0.5, 0.5,
4, -3.496629, -5.351664, 1, 1.5, 0.5, 0.5,
4, -3.496629, -5.351664, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.541261, -2, -4.603844,
-3.541261, 2, -4.603844,
-3.541261, -2, -4.603844,
-3.748288, -2, -4.853117,
-3.541261, -1, -4.603844,
-3.748288, -1, -4.853117,
-3.541261, 0, -4.603844,
-3.748288, 0, -4.853117,
-3.541261, 1, -4.603844,
-3.748288, 1, -4.853117,
-3.541261, 2, -4.603844,
-3.748288, 2, -4.853117
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
-4.162342, -2, -5.351664, 0, -0.5, 0.5, 0.5,
-4.162342, -2, -5.351664, 1, -0.5, 0.5, 0.5,
-4.162342, -2, -5.351664, 1, 1.5, 0.5, 0.5,
-4.162342, -2, -5.351664, 0, 1.5, 0.5, 0.5,
-4.162342, -1, -5.351664, 0, -0.5, 0.5, 0.5,
-4.162342, -1, -5.351664, 1, -0.5, 0.5, 0.5,
-4.162342, -1, -5.351664, 1, 1.5, 0.5, 0.5,
-4.162342, -1, -5.351664, 0, 1.5, 0.5, 0.5,
-4.162342, 0, -5.351664, 0, -0.5, 0.5, 0.5,
-4.162342, 0, -5.351664, 1, -0.5, 0.5, 0.5,
-4.162342, 0, -5.351664, 1, 1.5, 0.5, 0.5,
-4.162342, 0, -5.351664, 0, 1.5, 0.5, 0.5,
-4.162342, 1, -5.351664, 0, -0.5, 0.5, 0.5,
-4.162342, 1, -5.351664, 1, -0.5, 0.5, 0.5,
-4.162342, 1, -5.351664, 1, 1.5, 0.5, 0.5,
-4.162342, 1, -5.351664, 0, 1.5, 0.5, 0.5,
-4.162342, 2, -5.351664, 0, -0.5, 0.5, 0.5,
-4.162342, 2, -5.351664, 1, -0.5, 0.5, 0.5,
-4.162342, 2, -5.351664, 1, 1.5, 0.5, 0.5,
-4.162342, 2, -5.351664, 0, 1.5, 0.5, 0.5
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
-3.541261, -3.047303, -4,
-3.541261, -3.047303, 4,
-3.541261, -3.047303, -4,
-3.748288, -3.197078, -4,
-3.541261, -3.047303, -2,
-3.748288, -3.197078, -2,
-3.541261, -3.047303, 0,
-3.748288, -3.197078, 0,
-3.541261, -3.047303, 2,
-3.748288, -3.197078, 2,
-3.541261, -3.047303, 4,
-3.748288, -3.197078, 4
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
-4.162342, -3.496629, -4, 0, -0.5, 0.5, 0.5,
-4.162342, -3.496629, -4, 1, -0.5, 0.5, 0.5,
-4.162342, -3.496629, -4, 1, 1.5, 0.5, 0.5,
-4.162342, -3.496629, -4, 0, 1.5, 0.5, 0.5,
-4.162342, -3.496629, -2, 0, -0.5, 0.5, 0.5,
-4.162342, -3.496629, -2, 1, -0.5, 0.5, 0.5,
-4.162342, -3.496629, -2, 1, 1.5, 0.5, 0.5,
-4.162342, -3.496629, -2, 0, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 0, 0, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 0, 1, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 0, 1, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 0, 0, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 2, 0, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 2, 1, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 2, 1, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 2, 0, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 4, 0, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 4, 1, -0.5, 0.5, 0.5,
-4.162342, -3.496629, 4, 1, 1.5, 0.5, 0.5,
-4.162342, -3.496629, 4, 0, 1.5, 0.5, 0.5
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
-3.541261, -3.047303, -4.603844,
-3.541261, 2.9437, -4.603844,
-3.541261, -3.047303, 5.367089,
-3.541261, 2.9437, 5.367089,
-3.541261, -3.047303, -4.603844,
-3.541261, -3.047303, 5.367089,
-3.541261, 2.9437, -4.603844,
-3.541261, 2.9437, 5.367089,
-3.541261, -3.047303, -4.603844,
4.739822, -3.047303, -4.603844,
-3.541261, -3.047303, 5.367089,
4.739822, -3.047303, 5.367089,
-3.541261, 2.9437, -4.603844,
4.739822, 2.9437, -4.603844,
-3.541261, 2.9437, 5.367089,
4.739822, 2.9437, 5.367089,
4.739822, -3.047303, -4.603844,
4.739822, 2.9437, -4.603844,
4.739822, -3.047303, 5.367089,
4.739822, 2.9437, 5.367089,
4.739822, -3.047303, -4.603844,
4.739822, -3.047303, 5.367089,
4.739822, 2.9437, -4.603844,
4.739822, 2.9437, 5.367089
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
var radius = 7.624673;
var distance = 33.92303;
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
mvMatrix.translate( -0.5992807, 0.05180168, -0.3816226 );
mvMatrix.scale( 0.9955155, 1.376054, 0.826798 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.92303);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
fosetyl<-read.table("fosetyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fosetyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
```

```r
y<-fosetyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
```

```r
z<-fosetyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
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
-3.420663, -0.1496295, -2.682674, 0, 0, 1, 1, 1,
-2.947023, -0.9969709, -2.220787, 1, 0, 0, 1, 1,
-2.911386, -0.6779376, -3.942543, 1, 0, 0, 1, 1,
-2.867396, -2.141, -2.960671, 1, 0, 0, 1, 1,
-2.839008, 1.318462, -0.06070125, 1, 0, 0, 1, 1,
-2.729559, -0.5443407, -2.562107, 1, 0, 0, 1, 1,
-2.385184, 1.624333, -0.260324, 0, 0, 0, 1, 1,
-2.340434, -0.2795309, -1.768921, 0, 0, 0, 1, 1,
-2.29554, -0.8378264, -1.458626, 0, 0, 0, 1, 1,
-2.285589, -1.547486, -2.673953, 0, 0, 0, 1, 1,
-2.284447, -0.7643299, -2.549631, 0, 0, 0, 1, 1,
-2.236048, -0.5966428, -2.668491, 0, 0, 0, 1, 1,
-2.224297, -0.7375486, -2.776122, 0, 0, 0, 1, 1,
-2.205559, -1.039594, -4.187888, 1, 1, 1, 1, 1,
-2.184683, 0.648845, -3.131153, 1, 1, 1, 1, 1,
-2.168646, -0.04060984, -2.386445, 1, 1, 1, 1, 1,
-2.103154, -0.08285219, -3.167481, 1, 1, 1, 1, 1,
-2.090554, 0.6418043, -0.4181322, 1, 1, 1, 1, 1,
-2.026681, 0.0173297, -2.428042, 1, 1, 1, 1, 1,
-2.003366, 1.285693, -2.831169, 1, 1, 1, 1, 1,
-2.001416, 0.571497, -3.134557, 1, 1, 1, 1, 1,
-1.999983, 0.1452126, -0.3027065, 1, 1, 1, 1, 1,
-1.999935, -0.04025422, -3.205414, 1, 1, 1, 1, 1,
-1.991599, 2.246266, 0.1001375, 1, 1, 1, 1, 1,
-1.977988, 0.6660637, -1.497271, 1, 1, 1, 1, 1,
-1.976856, 1.432944, 0.09978259, 1, 1, 1, 1, 1,
-1.873709, -1.506704, -4.296519, 1, 1, 1, 1, 1,
-1.866517, 0.9622237, 0.1758818, 1, 1, 1, 1, 1,
-1.839803, 0.2450723, -3.845102, 0, 0, 1, 1, 1,
-1.829138, 0.2677603, -1.27103, 1, 0, 0, 1, 1,
-1.815954, 0.3998523, -1.726862, 1, 0, 0, 1, 1,
-1.80499, -0.963675, -0.9303105, 1, 0, 0, 1, 1,
-1.800803, 0.4792747, -1.57291, 1, 0, 0, 1, 1,
-1.786371, 2.327631, -0.6595578, 1, 0, 0, 1, 1,
-1.781988, 1.448735, -1.194657, 0, 0, 0, 1, 1,
-1.772679, 1.163075, -2.034539, 0, 0, 0, 1, 1,
-1.767969, 1.448124, -0.4373418, 0, 0, 0, 1, 1,
-1.764877, 2.131022, 0.4736022, 0, 0, 0, 1, 1,
-1.752884, 0.8241609, 0.3213188, 0, 0, 0, 1, 1,
-1.752743, -1.615165, -3.811161, 0, 0, 0, 1, 1,
-1.728325, 0.164091, -0.5290461, 0, 0, 0, 1, 1,
-1.725723, 0.91065, -2.113722, 1, 1, 1, 1, 1,
-1.719326, -0.08816647, -2.278454, 1, 1, 1, 1, 1,
-1.716844, 1.818187, -0.8016824, 1, 1, 1, 1, 1,
-1.714349, -0.39045, -1.046071, 1, 1, 1, 1, 1,
-1.710515, -0.9091985, 0.03654832, 1, 1, 1, 1, 1,
-1.696359, 0.2914419, -0.6062503, 1, 1, 1, 1, 1,
-1.694985, -0.6323012, -3.477876, 1, 1, 1, 1, 1,
-1.692768, -0.0350203, -1.452439, 1, 1, 1, 1, 1,
-1.684852, -1.037488, -3.450901, 1, 1, 1, 1, 1,
-1.678489, -1.643777, -1.818566, 1, 1, 1, 1, 1,
-1.671238, -0.3167378, -2.624752, 1, 1, 1, 1, 1,
-1.661206, 0.3986585, -2.895281, 1, 1, 1, 1, 1,
-1.660253, 0.7727827, -3.634439, 1, 1, 1, 1, 1,
-1.6501, -1.646003, -1.525232, 1, 1, 1, 1, 1,
-1.640201, 0.3785558, -1.309106, 1, 1, 1, 1, 1,
-1.631562, 0.002680539, 0.2753244, 0, 0, 1, 1, 1,
-1.630339, -0.5780938, -3.186358, 1, 0, 0, 1, 1,
-1.613149, -1.028247, -1.786876, 1, 0, 0, 1, 1,
-1.613006, -0.3020965, -1.996612, 1, 0, 0, 1, 1,
-1.590191, -0.5547608, -2.643834, 1, 0, 0, 1, 1,
-1.549773, -1.388694, -1.511056, 1, 0, 0, 1, 1,
-1.548042, -0.9630589, -1.990703, 0, 0, 0, 1, 1,
-1.51641, 1.968903, -0.3251112, 0, 0, 0, 1, 1,
-1.515386, -0.5451511, -3.016838, 0, 0, 0, 1, 1,
-1.510519, 0.3309485, -0.8986686, 0, 0, 0, 1, 1,
-1.510381, -0.3256234, -0.8574184, 0, 0, 0, 1, 1,
-1.503193, -0.1120664, -3.124691, 0, 0, 0, 1, 1,
-1.49583, -0.2947554, -0.3482303, 0, 0, 0, 1, 1,
-1.484175, -0.2345201, -2.131544, 1, 1, 1, 1, 1,
-1.454114, 2.023741, -1.756301, 1, 1, 1, 1, 1,
-1.451798, 0.7583682, -0.3275854, 1, 1, 1, 1, 1,
-1.44763, -0.1039894, -0.2636958, 1, 1, 1, 1, 1,
-1.446461, -0.5052332, -0.8087098, 1, 1, 1, 1, 1,
-1.44547, -0.1462222, -2.559886, 1, 1, 1, 1, 1,
-1.444142, 0.4508601, -1.36955, 1, 1, 1, 1, 1,
-1.430458, 0.06624603, -1.08151, 1, 1, 1, 1, 1,
-1.414269, 0.2795599, -1.961662, 1, 1, 1, 1, 1,
-1.40745, -0.870782, -2.89836, 1, 1, 1, 1, 1,
-1.40712, -0.5427629, -1.860964, 1, 1, 1, 1, 1,
-1.405797, -0.03100078, -0.1972992, 1, 1, 1, 1, 1,
-1.402356, -1.388412, -1.481216, 1, 1, 1, 1, 1,
-1.396791, 0.4087593, -0.1455057, 1, 1, 1, 1, 1,
-1.396011, 0.4369264, -1.246005, 1, 1, 1, 1, 1,
-1.394941, 0.07757464, -1.22313, 0, 0, 1, 1, 1,
-1.384447, 0.8482896, -2.342558, 1, 0, 0, 1, 1,
-1.384238, 1.551861, -0.1878001, 1, 0, 0, 1, 1,
-1.381829, -1.821937, -2.304698, 1, 0, 0, 1, 1,
-1.370133, 0.8031652, -1.549307, 1, 0, 0, 1, 1,
-1.366638, -0.5213767, -2.853737, 1, 0, 0, 1, 1,
-1.364592, -0.3726841, -1.491492, 0, 0, 0, 1, 1,
-1.362218, -0.2660528, -2.80905, 0, 0, 0, 1, 1,
-1.357627, 0.5953876, 0.1310215, 0, 0, 0, 1, 1,
-1.356638, 0.1818309, -0.8287815, 0, 0, 0, 1, 1,
-1.354648, -0.9454238, -3.412497, 0, 0, 0, 1, 1,
-1.349069, -1.156388, -2.854297, 0, 0, 0, 1, 1,
-1.340596, -0.780383, -1.60588, 0, 0, 0, 1, 1,
-1.314893, -1.249431, -1.934393, 1, 1, 1, 1, 1,
-1.303346, -0.01158355, -0.9501921, 1, 1, 1, 1, 1,
-1.299085, 0.6696969, -0.461997, 1, 1, 1, 1, 1,
-1.293844, -1.856578, -1.562774, 1, 1, 1, 1, 1,
-1.289293, -0.8888092, -2.43091, 1, 1, 1, 1, 1,
-1.28312, -0.1502799, -1.13105, 1, 1, 1, 1, 1,
-1.279364, -0.5487879, -2.179883, 1, 1, 1, 1, 1,
-1.276946, -0.2465595, -0.808014, 1, 1, 1, 1, 1,
-1.276536, -0.6196937, -2.39949, 1, 1, 1, 1, 1,
-1.26129, 0.06423801, -2.080199, 1, 1, 1, 1, 1,
-1.259907, 0.5232657, -0.8061134, 1, 1, 1, 1, 1,
-1.248778, -0.07363716, -1.216677, 1, 1, 1, 1, 1,
-1.248163, -1.42163, -2.443263, 1, 1, 1, 1, 1,
-1.240143, -2.456293, -1.002601, 1, 1, 1, 1, 1,
-1.239225, 0.5807723, -0.3247007, 1, 1, 1, 1, 1,
-1.237726, -0.6972964, -1.774375, 0, 0, 1, 1, 1,
-1.233428, 0.9018368, 1.106409, 1, 0, 0, 1, 1,
-1.222006, 0.1256674, 0.3911481, 1, 0, 0, 1, 1,
-1.218561, -0.2679763, -2.4092, 1, 0, 0, 1, 1,
-1.202287, -0.4359685, -1.838124, 1, 0, 0, 1, 1,
-1.19755, -0.1254832, -2.162266, 1, 0, 0, 1, 1,
-1.190725, 0.8104479, -1.700288, 0, 0, 0, 1, 1,
-1.189303, -2.33309, -0.8828942, 0, 0, 0, 1, 1,
-1.187449, 0.9854507, -0.8470195, 0, 0, 0, 1, 1,
-1.1814, -0.06507065, -2.788338, 0, 0, 0, 1, 1,
-1.171086, -0.1218145, -1.082684, 0, 0, 0, 1, 1,
-1.168125, 1.289441, 0.5132282, 0, 0, 0, 1, 1,
-1.166672, -1.444383, -3.121402, 0, 0, 0, 1, 1,
-1.166501, 0.6020602, -1.857105, 1, 1, 1, 1, 1,
-1.16303, -0.5944149, -0.6204694, 1, 1, 1, 1, 1,
-1.159198, -0.19212, 0.6606581, 1, 1, 1, 1, 1,
-1.151822, -0.3829091, -0.6022509, 1, 1, 1, 1, 1,
-1.149923, 2.423186, 0.546052, 1, 1, 1, 1, 1,
-1.146709, 0.3595315, -0.1856921, 1, 1, 1, 1, 1,
-1.125295, -0.8921394, -2.813909, 1, 1, 1, 1, 1,
-1.124858, -1.146379, -1.95594, 1, 1, 1, 1, 1,
-1.124026, 0.2735148, -1.505867, 1, 1, 1, 1, 1,
-1.122835, -1.241963, -3.223115, 1, 1, 1, 1, 1,
-1.122618, 0.8948939, -0.5604057, 1, 1, 1, 1, 1,
-1.121272, 0.3544221, -3.115843, 1, 1, 1, 1, 1,
-1.120461, -0.4822482, -3.328391, 1, 1, 1, 1, 1,
-1.120388, -1.887838, -3.113161, 1, 1, 1, 1, 1,
-1.116952, 0.3464805, -0.377143, 1, 1, 1, 1, 1,
-1.10808, 0.9819518, -0.306001, 0, 0, 1, 1, 1,
-1.097103, 0.4236354, -0.4311009, 1, 0, 0, 1, 1,
-1.096453, 0.7278457, 0.4149902, 1, 0, 0, 1, 1,
-1.092672, 0.152137, -2.290524, 1, 0, 0, 1, 1,
-1.089909, 1.83462, -0.7418515, 1, 0, 0, 1, 1,
-1.085435, 0.09982614, -1.830125, 1, 0, 0, 1, 1,
-1.077304, -0.1820262, -0.1126914, 0, 0, 0, 1, 1,
-1.076626, 1.470225, -0.003243086, 0, 0, 0, 1, 1,
-1.068727, 0.4138068, -1.172243, 0, 0, 0, 1, 1,
-1.060731, 0.7034817, -2.627264, 0, 0, 0, 1, 1,
-1.054025, 1.16157, -0.494267, 0, 0, 0, 1, 1,
-1.053581, 0.6319008, 1.358058, 0, 0, 0, 1, 1,
-1.051954, 0.2573295, -2.743296, 0, 0, 0, 1, 1,
-1.049811, 1.516159, -0.3998537, 1, 1, 1, 1, 1,
-1.049311, -0.5775337, -1.483615, 1, 1, 1, 1, 1,
-1.048692, 0.3882113, 0.4308362, 1, 1, 1, 1, 1,
-1.045332, -0.06537846, 0.0147749, 1, 1, 1, 1, 1,
-1.040114, -0.9252945, -0.9376756, 1, 1, 1, 1, 1,
-1.038603, 1.071888, -0.8739919, 1, 1, 1, 1, 1,
-1.038449, -0.9275644, -1.580097, 1, 1, 1, 1, 1,
-1.036464, -0.1566127, -2.97878, 1, 1, 1, 1, 1,
-1.035839, 0.5844691, -1.906386, 1, 1, 1, 1, 1,
-1.035192, -0.2665978, -3.682009, 1, 1, 1, 1, 1,
-1.020457, 0.8074571, -0.1918508, 1, 1, 1, 1, 1,
-1.01836, 0.4428693, -0.7317923, 1, 1, 1, 1, 1,
-1.015332, -2.426913, -2.019641, 1, 1, 1, 1, 1,
-1.004968, -0.7598214, -3.153354, 1, 1, 1, 1, 1,
-1.002823, 1.068404, -0.1553326, 1, 1, 1, 1, 1,
-0.9994364, -0.6719189, -1.343609, 0, 0, 1, 1, 1,
-0.9986995, -0.5503374, -2.119139, 1, 0, 0, 1, 1,
-0.9984904, 0.5936318, 1.20598, 1, 0, 0, 1, 1,
-0.9955617, -0.7049832, -0.8747314, 1, 0, 0, 1, 1,
-0.9935734, -1.702978, -2.929621, 1, 0, 0, 1, 1,
-0.9925584, -0.318568, -1.831176, 1, 0, 0, 1, 1,
-0.9862736, -0.06599766, -2.197148, 0, 0, 0, 1, 1,
-0.9861025, -0.4457829, -1.553504, 0, 0, 0, 1, 1,
-0.9802384, 0.2060764, -1.199712, 0, 0, 0, 1, 1,
-0.9711072, -0.09973326, -2.28675, 0, 0, 0, 1, 1,
-0.9659967, -0.1751278, -1.590016, 0, 0, 0, 1, 1,
-0.9595, 1.822768, -1.789847, 0, 0, 0, 1, 1,
-0.9581925, -1.37193, -2.964327, 0, 0, 0, 1, 1,
-0.9546678, -0.00763736, 0.7553805, 1, 1, 1, 1, 1,
-0.9546288, 0.360114, -2.11229, 1, 1, 1, 1, 1,
-0.9542149, 0.1440591, -0.4830926, 1, 1, 1, 1, 1,
-0.9512898, -1.024268, -2.594012, 1, 1, 1, 1, 1,
-0.9510093, -1.359366, -1.274637, 1, 1, 1, 1, 1,
-0.9500743, -0.1792939, -2.699819, 1, 1, 1, 1, 1,
-0.9457885, 0.2195279, -2.441225, 1, 1, 1, 1, 1,
-0.9379455, -0.3752701, -2.170203, 1, 1, 1, 1, 1,
-0.9376259, -0.5903451, -1.87173, 1, 1, 1, 1, 1,
-0.9323364, -0.2401683, -2.718726, 1, 1, 1, 1, 1,
-0.9322922, 1.227693, -1.200531, 1, 1, 1, 1, 1,
-0.9319376, 0.3737192, 0.3374099, 1, 1, 1, 1, 1,
-0.9316261, 1.432948, -0.6361166, 1, 1, 1, 1, 1,
-0.9314013, -1.423344, -0.6120927, 1, 1, 1, 1, 1,
-0.9312457, -0.8730887, -2.849663, 1, 1, 1, 1, 1,
-0.9281587, -0.5676588, -0.6832035, 0, 0, 1, 1, 1,
-0.9204115, 1.29878, -1.843853, 1, 0, 0, 1, 1,
-0.9145856, 0.6405864, -0.5538343, 1, 0, 0, 1, 1,
-0.9112084, -0.4180057, -3.281628, 1, 0, 0, 1, 1,
-0.9101025, -1.28414, -1.766213, 1, 0, 0, 1, 1,
-0.9061843, 1.618461, -1.197265, 1, 0, 0, 1, 1,
-0.9016513, -0.5029207, -0.03361978, 0, 0, 0, 1, 1,
-0.9001171, 0.7894257, -3.445346, 0, 0, 0, 1, 1,
-0.8924254, 1.8226, 0.5411843, 0, 0, 0, 1, 1,
-0.880869, 0.3261108, -1.639266, 0, 0, 0, 1, 1,
-0.8791106, 2.286631, -3.415529, 0, 0, 0, 1, 1,
-0.8756941, -0.01538765, -3.075774, 0, 0, 0, 1, 1,
-0.8709003, 0.185344, -0.9710703, 0, 0, 0, 1, 1,
-0.8603348, -1.421621, -2.396666, 1, 1, 1, 1, 1,
-0.8494449, -1.157855, -0.8853568, 1, 1, 1, 1, 1,
-0.8408169, 0.2483082, -1.964091, 1, 1, 1, 1, 1,
-0.8381878, -0.8730999, -2.019721, 1, 1, 1, 1, 1,
-0.8378516, 0.3608411, -1.571833, 1, 1, 1, 1, 1,
-0.8373854, 0.2058735, -1.11804, 1, 1, 1, 1, 1,
-0.8359193, 0.01165877, -1.461084, 1, 1, 1, 1, 1,
-0.8345585, 0.3250252, 0.06591129, 1, 1, 1, 1, 1,
-0.8344585, -1.924248, -1.162279, 1, 1, 1, 1, 1,
-0.8331861, -0.5100705, -1.886684, 1, 1, 1, 1, 1,
-0.8230966, 0.6214907, -2.690376, 1, 1, 1, 1, 1,
-0.8196215, -0.8233742, -0.6756389, 1, 1, 1, 1, 1,
-0.8141467, 1.209195, -0.04024747, 1, 1, 1, 1, 1,
-0.8138761, 1.061023, -0.850301, 1, 1, 1, 1, 1,
-0.8121421, 1.081409, 0.8788313, 1, 1, 1, 1, 1,
-0.805632, -1.177244, 0.2173115, 0, 0, 1, 1, 1,
-0.8030763, 0.8664357, -2.101817, 1, 0, 0, 1, 1,
-0.8009365, -0.3284713, -1.388211, 1, 0, 0, 1, 1,
-0.7993017, 1.204927, -0.1124485, 1, 0, 0, 1, 1,
-0.7953058, -0.4451358, -3.446526, 1, 0, 0, 1, 1,
-0.7923035, -0.5867574, -2.952387, 1, 0, 0, 1, 1,
-0.7869872, 1.577424, -0.8564031, 0, 0, 0, 1, 1,
-0.7839534, 2.187437, -1.044082, 0, 0, 0, 1, 1,
-0.7770685, -0.6640525, -3.02927, 0, 0, 0, 1, 1,
-0.7753823, 0.9599515, -0.1909199, 0, 0, 0, 1, 1,
-0.7737299, -0.0290092, -1.702414, 0, 0, 0, 1, 1,
-0.7693161, -0.6720445, -3.80882, 0, 0, 0, 1, 1,
-0.7671649, -0.6791813, -3.239384, 0, 0, 0, 1, 1,
-0.7659904, 0.1717373, -1.193576, 1, 1, 1, 1, 1,
-0.7608456, -0.1685691, -1.942898, 1, 1, 1, 1, 1,
-0.7487949, 1.179088, -1.252483, 1, 1, 1, 1, 1,
-0.7470982, 0.2260528, 0.1489034, 1, 1, 1, 1, 1,
-0.7437817, 0.3379603, -0.3050797, 1, 1, 1, 1, 1,
-0.7397895, 0.9158167, -2.213961, 1, 1, 1, 1, 1,
-0.7382651, -0.5894726, -2.5933, 1, 1, 1, 1, 1,
-0.7363642, 0.5681556, -2.837384, 1, 1, 1, 1, 1,
-0.7323329, 1.429225, 0.0829048, 1, 1, 1, 1, 1,
-0.7312784, 1.104322, -1.832711, 1, 1, 1, 1, 1,
-0.7312647, -2.004886, -2.523507, 1, 1, 1, 1, 1,
-0.7296833, 0.5336035, -1.287091, 1, 1, 1, 1, 1,
-0.728107, 1.084381, -1.191671, 1, 1, 1, 1, 1,
-0.7266627, -0.3570956, -3.925511, 1, 1, 1, 1, 1,
-0.7187819, -0.4991776, -1.740516, 1, 1, 1, 1, 1,
-0.7131531, 1.708424, 0.4752469, 0, 0, 1, 1, 1,
-0.7103865, 0.305729, 1.010169, 1, 0, 0, 1, 1,
-0.7046826, -0.09041923, -2.599699, 1, 0, 0, 1, 1,
-0.7032052, -1.08564, -2.017292, 1, 0, 0, 1, 1,
-0.7028022, -0.9416699, -2.977745, 1, 0, 0, 1, 1,
-0.7026802, 1.081119, 0.5931485, 1, 0, 0, 1, 1,
-0.7022875, 2.09029, -0.1803453, 0, 0, 0, 1, 1,
-0.6992829, 0.283739, -0.9104444, 0, 0, 0, 1, 1,
-0.6987803, -0.3795037, -0.7747639, 0, 0, 0, 1, 1,
-0.6979004, 1.808049, 1.137695, 0, 0, 0, 1, 1,
-0.6922, -1.288556, -2.221424, 0, 0, 0, 1, 1,
-0.6918334, 0.2993956, -0.1207046, 0, 0, 0, 1, 1,
-0.6851624, 0.8530639, -0.8951027, 0, 0, 0, 1, 1,
-0.6844954, 0.04764077, -1.62834, 1, 1, 1, 1, 1,
-0.6821169, -0.5797809, -1.756501, 1, 1, 1, 1, 1,
-0.6797156, -1.204165, -2.480937, 1, 1, 1, 1, 1,
-0.676383, 0.8050994, -0.5016109, 1, 1, 1, 1, 1,
-0.6723057, 1.977456, 0.2077685, 1, 1, 1, 1, 1,
-0.6721252, -0.405783, -2.406042, 1, 1, 1, 1, 1,
-0.669477, 2.044252, 1.396405, 1, 1, 1, 1, 1,
-0.6623976, 0.4425421, -1.933687, 1, 1, 1, 1, 1,
-0.658174, -1.777803, -2.676482, 1, 1, 1, 1, 1,
-0.6529391, -0.4228149, -1.470092, 1, 1, 1, 1, 1,
-0.645385, -0.9247098, -4.361319, 1, 1, 1, 1, 1,
-0.6422253, -0.1118327, -2.533182, 1, 1, 1, 1, 1,
-0.6418236, 1.059683, -1.871027, 1, 1, 1, 1, 1,
-0.640249, -0.1881651, -1.627403, 1, 1, 1, 1, 1,
-0.6391661, 0.5725821, -1.176469, 1, 1, 1, 1, 1,
-0.6294637, 0.495376, 0.1943551, 0, 0, 1, 1, 1,
-0.629067, 0.3275149, -0.1145536, 1, 0, 0, 1, 1,
-0.6279503, 0.2156399, -2.386991, 1, 0, 0, 1, 1,
-0.6141503, -0.08046796, -2.942775, 1, 0, 0, 1, 1,
-0.6036013, 0.9021561, -1.423155, 1, 0, 0, 1, 1,
-0.6011551, -0.7849203, -3.234494, 1, 0, 0, 1, 1,
-0.5988204, -2.079329, -1.98993, 0, 0, 0, 1, 1,
-0.5932211, -1.358487, -0.910761, 0, 0, 0, 1, 1,
-0.5915186, -0.3843349, -2.234373, 0, 0, 0, 1, 1,
-0.5902284, 1.846509, -0.7900043, 0, 0, 0, 1, 1,
-0.5900396, -0.7860526, -3.286692, 0, 0, 0, 1, 1,
-0.5895223, -1.491859, -2.132249, 0, 0, 0, 1, 1,
-0.5873449, -0.03545786, -1.688887, 0, 0, 0, 1, 1,
-0.5837941, 0.4167858, -1.433696, 1, 1, 1, 1, 1,
-0.583649, -1.137588, -3.794688, 1, 1, 1, 1, 1,
-0.5836443, -1.115846, -1.132184, 1, 1, 1, 1, 1,
-0.5833681, 1.884493, 1.103767, 1, 1, 1, 1, 1,
-0.5804808, 1.528273, 0.07781175, 1, 1, 1, 1, 1,
-0.5763392, -0.6907313, -1.769078, 1, 1, 1, 1, 1,
-0.5746685, -1.360847, -4.268241, 1, 1, 1, 1, 1,
-0.5699772, 1.398059, -0.9778669, 1, 1, 1, 1, 1,
-0.5686204, 0.163671, -0.3625815, 1, 1, 1, 1, 1,
-0.565963, -0.3034276, -2.829552, 1, 1, 1, 1, 1,
-0.5637492, 0.7128643, 0.4367468, 1, 1, 1, 1, 1,
-0.5597138, -0.5738231, -2.971467, 1, 1, 1, 1, 1,
-0.5490183, -1.631665, -2.584303, 1, 1, 1, 1, 1,
-0.5483023, 1.470622, -1.401649, 1, 1, 1, 1, 1,
-0.5478845, -0.5890853, -3.428606, 1, 1, 1, 1, 1,
-0.5449303, 1.130175, 0.6539329, 0, 0, 1, 1, 1,
-0.5420427, -0.01464376, -1.745349, 1, 0, 0, 1, 1,
-0.5381762, 1.997387, -0.07410218, 1, 0, 0, 1, 1,
-0.534921, -1.2116, -2.3264, 1, 0, 0, 1, 1,
-0.5321915, -1.122264, -4.200735, 1, 0, 0, 1, 1,
-0.5231406, 0.004704915, -0.1465174, 1, 0, 0, 1, 1,
-0.5213082, -0.847712, -0.9478068, 0, 0, 0, 1, 1,
-0.5119532, 0.7446741, 0.3053567, 0, 0, 0, 1, 1,
-0.5115346, 0.9770637, -0.8381074, 0, 0, 0, 1, 1,
-0.509506, -0.2015644, -0.6251141, 0, 0, 0, 1, 1,
-0.5070853, 0.6041568, -1.375391, 0, 0, 0, 1, 1,
-0.5064346, 0.1286275, -0.8375842, 0, 0, 0, 1, 1,
-0.5043023, -1.215899, -2.65789, 0, 0, 0, 1, 1,
-0.5041992, 0.5775295, -1.549503, 1, 1, 1, 1, 1,
-0.5019312, -0.2425373, -1.628509, 1, 1, 1, 1, 1,
-0.4999238, -2.688523, -2.151275, 1, 1, 1, 1, 1,
-0.4958988, 1.202699, -0.377114, 1, 1, 1, 1, 1,
-0.4919712, 1.147626, 0.2754654, 1, 1, 1, 1, 1,
-0.4890347, 0.9209681, -1.618394, 1, 1, 1, 1, 1,
-0.4888102, -0.5132929, -2.357477, 1, 1, 1, 1, 1,
-0.485808, 0.1112325, -1.710428, 1, 1, 1, 1, 1,
-0.4815603, -1.629403, -0.9342184, 1, 1, 1, 1, 1,
-0.4810502, -0.01762238, -2.926651, 1, 1, 1, 1, 1,
-0.4808017, 0.7849425, 0.0681081, 1, 1, 1, 1, 1,
-0.4798625, 1.314882, -0.4282414, 1, 1, 1, 1, 1,
-0.4645324, -0.2355122, -2.362286, 1, 1, 1, 1, 1,
-0.4643604, 0.2364672, -0.07349549, 1, 1, 1, 1, 1,
-0.4635345, 0.8620321, -0.9977127, 1, 1, 1, 1, 1,
-0.4607252, 0.3178043, -2.923518, 0, 0, 1, 1, 1,
-0.4603048, 0.07601629, -0.83375, 1, 0, 0, 1, 1,
-0.4599442, -0.04249268, -3.381383, 1, 0, 0, 1, 1,
-0.4500325, 1.364965, 0.7027339, 1, 0, 0, 1, 1,
-0.4447646, -0.4544764, -0.1915053, 1, 0, 0, 1, 1,
-0.4369382, -0.7289091, -3.072325, 1, 0, 0, 1, 1,
-0.4346181, -0.5338292, -2.688053, 0, 0, 0, 1, 1,
-0.4307799, 0.2495942, -1.258198, 0, 0, 0, 1, 1,
-0.4276441, -0.8604782, -2.515553, 0, 0, 0, 1, 1,
-0.425455, -0.9314755, -1.564614, 0, 0, 0, 1, 1,
-0.4233562, -1.207066, -3.154491, 0, 0, 0, 1, 1,
-0.417998, -1.990989, -3.872618, 0, 0, 0, 1, 1,
-0.4142907, -0.8214619, -2.252309, 0, 0, 0, 1, 1,
-0.413448, -0.1250534, -2.632013, 1, 1, 1, 1, 1,
-0.4093726, 0.1892754, -2.694871, 1, 1, 1, 1, 1,
-0.4075216, -1.004212, -3.167977, 1, 1, 1, 1, 1,
-0.4007273, 0.4852498, -0.4656298, 1, 1, 1, 1, 1,
-0.3950251, 1.818358, 0.04513126, 1, 1, 1, 1, 1,
-0.3880946, -0.796278, -1.387526, 1, 1, 1, 1, 1,
-0.3864816, -2.307663, -3.483627, 1, 1, 1, 1, 1,
-0.3818729, -0.03474551, -0.0814259, 1, 1, 1, 1, 1,
-0.3812808, -0.9677092, -2.543307, 1, 1, 1, 1, 1,
-0.3725804, -0.5259852, -2.906527, 1, 1, 1, 1, 1,
-0.3703104, 2.116579, -1.262511, 1, 1, 1, 1, 1,
-0.362519, 0.7091228, -0.3128622, 1, 1, 1, 1, 1,
-0.3583181, -0.364583, -0.07419369, 1, 1, 1, 1, 1,
-0.3495148, 0.4736496, 0.05040734, 1, 1, 1, 1, 1,
-0.3434523, -1.813253, -2.480378, 1, 1, 1, 1, 1,
-0.342351, -1.407867, -3.380265, 0, 0, 1, 1, 1,
-0.3411078, 0.8590943, -1.21479, 1, 0, 0, 1, 1,
-0.3380033, -0.8715905, -3.211737, 1, 0, 0, 1, 1,
-0.3324567, -0.03881572, -2.604943, 1, 0, 0, 1, 1,
-0.3317456, -0.6401517, -1.82345, 1, 0, 0, 1, 1,
-0.3306228, -0.09426995, -2.011169, 1, 0, 0, 1, 1,
-0.3279067, 0.6005055, -1.081833, 0, 0, 0, 1, 1,
-0.3221223, 0.7452985, -0.0799543, 0, 0, 0, 1, 1,
-0.3211853, -0.6898407, -2.133733, 0, 0, 0, 1, 1,
-0.3206091, 1.29182, -0.3494124, 0, 0, 0, 1, 1,
-0.3130061, -0.03937219, -3.287171, 0, 0, 0, 1, 1,
-0.3090912, -1.409677, -2.179567, 0, 0, 0, 1, 1,
-0.3087897, 0.7495759, 0.5923671, 0, 0, 0, 1, 1,
-0.3033166, -1.597573, -2.318521, 1, 1, 1, 1, 1,
-0.3026245, 0.09424547, -1.688162, 1, 1, 1, 1, 1,
-0.2990052, 0.552292, -2.36911, 1, 1, 1, 1, 1,
-0.2955162, 1.746963, -1.155875, 1, 1, 1, 1, 1,
-0.2949264, 1.111959, -0.2874745, 1, 1, 1, 1, 1,
-0.2948392, 0.3188902, 0.6450048, 1, 1, 1, 1, 1,
-0.2929362, -1.056015, -2.924595, 1, 1, 1, 1, 1,
-0.2893881, -1.248711, -1.527117, 1, 1, 1, 1, 1,
-0.2878487, 0.9482997, 0.3807493, 1, 1, 1, 1, 1,
-0.2820749, 0.2429865, 0.9371747, 1, 1, 1, 1, 1,
-0.2819224, -0.1448538, -1.471847, 1, 1, 1, 1, 1,
-0.2807131, -0.6026468, -1.905767, 1, 1, 1, 1, 1,
-0.2758402, -1.521852, -4.458636, 1, 1, 1, 1, 1,
-0.2742684, 0.06002271, -2.236411, 1, 1, 1, 1, 1,
-0.2703251, 0.7833453, -0.5917553, 1, 1, 1, 1, 1,
-0.2680666, -0.1523941, -0.6205976, 0, 0, 1, 1, 1,
-0.267096, -0.7292678, -1.811729, 1, 0, 0, 1, 1,
-0.2635869, -0.8610144, -2.686922, 1, 0, 0, 1, 1,
-0.2621121, -0.1596892, -3.219897, 1, 0, 0, 1, 1,
-0.2589739, -1.156357, -2.726646, 1, 0, 0, 1, 1,
-0.2490031, 1.986984, -0.4434879, 1, 0, 0, 1, 1,
-0.2482123, 0.5058068, 0.5961848, 0, 0, 0, 1, 1,
-0.2471232, -0.5069076, -1.552456, 0, 0, 0, 1, 1,
-0.245326, -0.07552734, -4.406136, 0, 0, 0, 1, 1,
-0.2438373, -0.09711535, -3.896008, 0, 0, 0, 1, 1,
-0.2414781, 1.41561, -0.3356696, 0, 0, 0, 1, 1,
-0.2271045, 1.02227, -1.003195, 0, 0, 0, 1, 1,
-0.2221496, 1.583291, -0.6661867, 0, 0, 0, 1, 1,
-0.2170309, 1.105384, -0.2211641, 1, 1, 1, 1, 1,
-0.2158625, 0.1833215, -2.448196, 1, 1, 1, 1, 1,
-0.2146399, 0.4224033, -2.213063, 1, 1, 1, 1, 1,
-0.2145396, 2.769285, 0.6066878, 1, 1, 1, 1, 1,
-0.2135316, -0.3627631, -2.727471, 1, 1, 1, 1, 1,
-0.2101231, -1.545035, -2.848783, 1, 1, 1, 1, 1,
-0.20936, 0.4656305, -1.126161, 1, 1, 1, 1, 1,
-0.2047602, -1.197019, -2.869229, 1, 1, 1, 1, 1,
-0.2024706, -1.426595, -4.374667, 1, 1, 1, 1, 1,
-0.1996299, 0.539857, -0.3875777, 1, 1, 1, 1, 1,
-0.1980469, -2.960056, -2.773951, 1, 1, 1, 1, 1,
-0.1939723, -0.3561168, -2.259485, 1, 1, 1, 1, 1,
-0.1874987, 0.1929032, -2.987763, 1, 1, 1, 1, 1,
-0.1868842, -0.009390519, -0.08670079, 1, 1, 1, 1, 1,
-0.1867026, 1.587323, 0.9125285, 1, 1, 1, 1, 1,
-0.1852612, 0.1254314, -0.4970669, 0, 0, 1, 1, 1,
-0.1782823, 0.3126299, 0.3008417, 1, 0, 0, 1, 1,
-0.1761095, -0.8183254, -2.691471, 1, 0, 0, 1, 1,
-0.1606515, -0.8027866, -2.068358, 1, 0, 0, 1, 1,
-0.1531818, -1.387551, -3.814662, 1, 0, 0, 1, 1,
-0.1516652, -0.2078688, -1.138706, 1, 0, 0, 1, 1,
-0.1445012, -0.3539596, -2.95758, 0, 0, 0, 1, 1,
-0.1440105, 0.7382463, 0.9113863, 0, 0, 0, 1, 1,
-0.1431681, 0.01231656, -0.8335024, 0, 0, 0, 1, 1,
-0.1406657, 1.175448, 1.701704, 0, 0, 0, 1, 1,
-0.1396236, -0.3582483, -3.686017, 0, 0, 0, 1, 1,
-0.1373233, 0.2816544, -1.150225, 0, 0, 0, 1, 1,
-0.1364774, -0.3020521, -3.67117, 0, 0, 0, 1, 1,
-0.1362553, -0.6083444, -3.13181, 1, 1, 1, 1, 1,
-0.1332288, 0.4616935, -0.2677063, 1, 1, 1, 1, 1,
-0.1322993, -2.146602, -4.20006, 1, 1, 1, 1, 1,
-0.1303639, -0.123663, -2.830583, 1, 1, 1, 1, 1,
-0.1188929, 0.7541072, 1.158425, 1, 1, 1, 1, 1,
-0.1169195, 2.626473, 0.1505911, 1, 1, 1, 1, 1,
-0.1160528, -0.61527, -0.7478105, 1, 1, 1, 1, 1,
-0.1118265, -0.6141019, -3.661752, 1, 1, 1, 1, 1,
-0.1065874, -0.7119897, -2.364557, 1, 1, 1, 1, 1,
-0.1056529, -1.07777, -3.162723, 1, 1, 1, 1, 1,
-0.09722652, 0.01396363, -3.155958, 1, 1, 1, 1, 1,
-0.09511736, 1.532878, -0.5396141, 1, 1, 1, 1, 1,
-0.08661475, 1.335336, 0.5191923, 1, 1, 1, 1, 1,
-0.08612135, 1.268636, 0.08223822, 1, 1, 1, 1, 1,
-0.08577111, -0.9074997, -1.989407, 1, 1, 1, 1, 1,
-0.07660019, -0.3785103, -2.505432, 0, 0, 1, 1, 1,
-0.07507765, -0.7295632, -1.307992, 1, 0, 0, 1, 1,
-0.0750187, -0.2835048, -3.644176, 1, 0, 0, 1, 1,
-0.07442361, 0.006068836, -1.882046, 1, 0, 0, 1, 1,
-0.0667007, 0.7090343, 0.5276228, 1, 0, 0, 1, 1,
-0.06373525, -1.102923, -1.127496, 1, 0, 0, 1, 1,
-0.06315131, 0.4740372, -1.118626, 0, 0, 0, 1, 1,
-0.06282184, -0.208817, -0.7716202, 0, 0, 0, 1, 1,
-0.06276169, -0.5371024, -2.414765, 0, 0, 0, 1, 1,
-0.05645741, 0.9191734, 0.9176384, 0, 0, 0, 1, 1,
-0.05346382, -1.273473, -2.391015, 0, 0, 0, 1, 1,
-0.05162333, -0.05759376, -3.065506, 0, 0, 0, 1, 1,
-0.04979371, 1.271851, 0.1562894, 0, 0, 0, 1, 1,
-0.04159855, -0.009280472, 0.3020996, 1, 1, 1, 1, 1,
-0.0396768, 1.395706, -2.147898, 1, 1, 1, 1, 1,
-0.03782382, -0.2767889, -2.378029, 1, 1, 1, 1, 1,
-0.03606897, 2.131222, -1.034384, 1, 1, 1, 1, 1,
-0.03548645, 1.006511, -0.4267201, 1, 1, 1, 1, 1,
-0.03272618, 0.5116917, -0.5423821, 1, 1, 1, 1, 1,
-0.0310798, 0.3970987, -0.5813845, 1, 1, 1, 1, 1,
-0.02984827, 0.003262244, -1.408024, 1, 1, 1, 1, 1,
-0.02500748, -0.07406504, -2.990469, 1, 1, 1, 1, 1,
-0.02098706, -1.490225, -4.340068, 1, 1, 1, 1, 1,
-0.02050164, -0.7124412, -1.298901, 1, 1, 1, 1, 1,
-0.01911029, 1.064254, -0.6627672, 1, 1, 1, 1, 1,
-0.01528796, -1.015994, -3.223835, 1, 1, 1, 1, 1,
-0.0128594, -0.5289161, -2.690864, 1, 1, 1, 1, 1,
-0.01115029, -0.144001, -2.25851, 1, 1, 1, 1, 1,
-0.002734389, 0.2127529, -0.2576836, 0, 0, 1, 1, 1,
-0.001616482, -1.756526, -4.343206, 1, 0, 0, 1, 1,
-0.0006812874, 0.4779348, -0.6313685, 1, 0, 0, 1, 1,
0.0007942393, -0.2885878, 1.983293, 1, 0, 0, 1, 1,
0.001587402, -0.3674517, 3.155392, 1, 0, 0, 1, 1,
0.00436335, 0.09793449, 0.105, 1, 0, 0, 1, 1,
0.004397584, 0.8203067, -1.767937, 0, 0, 0, 1, 1,
0.004941522, 0.3973419, 0.356735, 0, 0, 0, 1, 1,
0.008114538, 1.361361, 0.5241357, 0, 0, 0, 1, 1,
0.01285104, -2.917128, 2.817977, 0, 0, 0, 1, 1,
0.02160345, -0.7017067, 2.387039, 0, 0, 0, 1, 1,
0.02546562, -0.7721931, 2.797197, 0, 0, 0, 1, 1,
0.02551377, -0.08290859, 3.218839, 0, 0, 0, 1, 1,
0.0266775, 1.073607, -0.07772209, 1, 1, 1, 1, 1,
0.02714801, 2.818344, 0.116269, 1, 1, 1, 1, 1,
0.02737737, -0.2531812, 2.585887, 1, 1, 1, 1, 1,
0.02907494, -0.6171005, 2.752689, 1, 1, 1, 1, 1,
0.03735022, 1.353515, -0.2043867, 1, 1, 1, 1, 1,
0.03918628, 0.8065655, 0.007072827, 1, 1, 1, 1, 1,
0.04412076, -0.2803048, 3.24069, 1, 1, 1, 1, 1,
0.04671082, 1.587386, -0.7781391, 1, 1, 1, 1, 1,
0.05260129, 1.296338, 3.613984, 1, 1, 1, 1, 1,
0.05871556, 1.68702, 0.9235286, 1, 1, 1, 1, 1,
0.06277644, 0.2327206, 0.8558499, 1, 1, 1, 1, 1,
0.06713386, -0.1878104, 5.221881, 1, 1, 1, 1, 1,
0.06799421, -0.9413882, 3.179544, 1, 1, 1, 1, 1,
0.0688822, 1.186849, 0.2574746, 1, 1, 1, 1, 1,
0.06921624, -1.020904, 2.491811, 1, 1, 1, 1, 1,
0.07425344, 0.862111, -0.4430245, 0, 0, 1, 1, 1,
0.07492148, -2.106376, 3.152287, 1, 0, 0, 1, 1,
0.07521559, 1.390482, 0.3185467, 1, 0, 0, 1, 1,
0.07655068, -0.3094045, 2.222065, 1, 0, 0, 1, 1,
0.07702819, 0.7898972, 1.656472, 1, 0, 0, 1, 1,
0.08059836, -0.5930919, 3.04258, 1, 0, 0, 1, 1,
0.08690029, 0.3199004, 2.214725, 0, 0, 0, 1, 1,
0.08934175, -0.2111857, 1.962948, 0, 0, 0, 1, 1,
0.09024788, 0.8516065, -1.197864, 0, 0, 0, 1, 1,
0.09203736, -1.006913, 4.452047, 0, 0, 0, 1, 1,
0.09774976, -0.4192273, 1.965867, 0, 0, 0, 1, 1,
0.09884432, 0.06594738, 0.6955894, 0, 0, 0, 1, 1,
0.1040593, 0.8036343, -0.7060798, 0, 0, 0, 1, 1,
0.1048152, 0.2466661, 0.06508624, 1, 1, 1, 1, 1,
0.1087146, 0.8900527, -1.169239, 1, 1, 1, 1, 1,
0.1115161, -0.04949727, 2.823211, 1, 1, 1, 1, 1,
0.1177022, 0.9823898, 1.10617, 1, 1, 1, 1, 1,
0.1210991, -0.4339614, 0.791019, 1, 1, 1, 1, 1,
0.1263154, 2.265487, -0.3844068, 1, 1, 1, 1, 1,
0.1303855, 0.6983874, -0.5876168, 1, 1, 1, 1, 1,
0.1311309, -0.07720502, 1.499876, 1, 1, 1, 1, 1,
0.1320706, -0.4510503, 4.018907, 1, 1, 1, 1, 1,
0.1344155, -2.403402, 3.231673, 1, 1, 1, 1, 1,
0.1431161, -0.5366646, 3.465627, 1, 1, 1, 1, 1,
0.1442605, 1.51534, -0.3321305, 1, 1, 1, 1, 1,
0.1449725, -0.3141843, 3.718547, 1, 1, 1, 1, 1,
0.145064, -1.077609, 2.857217, 1, 1, 1, 1, 1,
0.1483756, 0.6760737, 0.2639879, 1, 1, 1, 1, 1,
0.1508136, -1.784738, 3.218558, 0, 0, 1, 1, 1,
0.1522861, 0.00140413, 2.84076, 1, 0, 0, 1, 1,
0.1530457, 1.46636, 0.1322167, 1, 0, 0, 1, 1,
0.1544712, -0.9358637, 3.015672, 1, 0, 0, 1, 1,
0.1566425, 0.5339478, 0.9278672, 1, 0, 0, 1, 1,
0.1584082, 0.538774, 1.982059, 1, 0, 0, 1, 1,
0.162384, 0.6004988, 0.6175822, 0, 0, 0, 1, 1,
0.1655283, 0.5629157, -0.4924519, 0, 0, 0, 1, 1,
0.1744621, -1.100271, 3.018468, 0, 0, 0, 1, 1,
0.1755564, -0.1261234, 1.894671, 0, 0, 0, 1, 1,
0.1774877, -1.267889, 3.721178, 0, 0, 0, 1, 1,
0.178003, -0.5649651, 1.773153, 0, 0, 0, 1, 1,
0.178742, -0.8337941, 2.154169, 0, 0, 0, 1, 1,
0.1820524, -0.27871, 2.536683, 1, 1, 1, 1, 1,
0.1836866, -2.422919, 3.177432, 1, 1, 1, 1, 1,
0.1859085, -1.483722, 3.535811, 1, 1, 1, 1, 1,
0.1876848, -0.7841474, 2.056144, 1, 1, 1, 1, 1,
0.1910082, 0.2195866, 1.105864, 1, 1, 1, 1, 1,
0.1939786, -0.385707, 1.681859, 1, 1, 1, 1, 1,
0.1954798, 0.3801242, 0.6807007, 1, 1, 1, 1, 1,
0.1956087, -1.22031, 2.763638, 1, 1, 1, 1, 1,
0.1972728, -2.23721, 2.138063, 1, 1, 1, 1, 1,
0.1977617, -0.07256803, 2.414839, 1, 1, 1, 1, 1,
0.2003183, 0.6393788, 0.3973196, 1, 1, 1, 1, 1,
0.2007853, 0.8721237, -0.6628156, 1, 1, 1, 1, 1,
0.205345, 2.362296, -1.150444, 1, 1, 1, 1, 1,
0.20614, -1.59594, 2.17085, 1, 1, 1, 1, 1,
0.2064782, -0.05078272, 1.46461, 1, 1, 1, 1, 1,
0.207217, 0.5061513, -0.2828874, 0, 0, 1, 1, 1,
0.210876, 0.8441324, -0.1023825, 1, 0, 0, 1, 1,
0.2139364, -0.4604044, 3.17859, 1, 0, 0, 1, 1,
0.2144459, -0.2474627, 1.880654, 1, 0, 0, 1, 1,
0.2154234, 0.4999724, -0.3525763, 1, 0, 0, 1, 1,
0.219901, 0.02340127, 2.828568, 1, 0, 0, 1, 1,
0.2216048, -0.07698724, 2.986918, 0, 0, 0, 1, 1,
0.2236543, -0.2231095, 1.279094, 0, 0, 0, 1, 1,
0.2282972, 0.2835711, 2.266295, 0, 0, 0, 1, 1,
0.2292962, -1.878669, 4.418298, 0, 0, 0, 1, 1,
0.2298418, 1.029156, -0.03226705, 0, 0, 0, 1, 1,
0.2397012, -0.4962881, 2.45703, 0, 0, 0, 1, 1,
0.2402458, 0.167618, 1.936846, 0, 0, 0, 1, 1,
0.2416898, -0.8507774, 2.045264, 1, 1, 1, 1, 1,
0.2424785, -0.09247369, 1.150554, 1, 1, 1, 1, 1,
0.2467201, 0.1032762, 2.126226, 1, 1, 1, 1, 1,
0.2505521, -0.4612376, 2.252408, 1, 1, 1, 1, 1,
0.2551532, -0.2394596, 2.322368, 1, 1, 1, 1, 1,
0.2561382, 1.245273, 0.7088326, 1, 1, 1, 1, 1,
0.2582594, 1.506867, -0.3647979, 1, 1, 1, 1, 1,
0.2630681, 0.09542824, 2.894999, 1, 1, 1, 1, 1,
0.2635725, -1.251569, 2.195467, 1, 1, 1, 1, 1,
0.2645286, -1.427959, 2.391483, 1, 1, 1, 1, 1,
0.264632, -0.8922622, 1.592197, 1, 1, 1, 1, 1,
0.2648144, 0.4183691, 1.317861, 1, 1, 1, 1, 1,
0.2660519, 0.04889366, 3.352536, 1, 1, 1, 1, 1,
0.2662118, -0.491011, 1.950762, 1, 1, 1, 1, 1,
0.2665988, 1.21563, 0.4961392, 1, 1, 1, 1, 1,
0.2669607, 0.06828038, 1.760717, 0, 0, 1, 1, 1,
0.2671485, -0.6499784, 3.018358, 1, 0, 0, 1, 1,
0.2683971, -0.1615491, 0.3701687, 1, 0, 0, 1, 1,
0.2741573, 1.52293, 0.6897951, 1, 0, 0, 1, 1,
0.2745566, 0.1513345, 0.01760185, 1, 0, 0, 1, 1,
0.2841001, -0.5691462, 2.633561, 1, 0, 0, 1, 1,
0.2845172, -0.546008, 1.683911, 0, 0, 0, 1, 1,
0.2850085, 0.9912264, 0.7603124, 0, 0, 0, 1, 1,
0.2851757, -1.292146, 3.097384, 0, 0, 0, 1, 1,
0.2871435, 0.8003663, -0.1414956, 0, 0, 0, 1, 1,
0.2892473, 1.102653, 0.6079122, 0, 0, 0, 1, 1,
0.2914018, 0.5881432, 1.285213, 0, 0, 0, 1, 1,
0.2919057, -1.148741, 2.164143, 0, 0, 0, 1, 1,
0.3013735, -0.3181467, 1.953842, 1, 1, 1, 1, 1,
0.3051742, 0.2104568, 3.139194, 1, 1, 1, 1, 1,
0.3095956, 0.5415874, 0.900715, 1, 1, 1, 1, 1,
0.318144, -0.489029, 1.194256, 1, 1, 1, 1, 1,
0.3213403, 0.3846265, -0.2233055, 1, 1, 1, 1, 1,
0.3295125, 1.521049, -0.3093854, 1, 1, 1, 1, 1,
0.3296694, 1.312768, 1.016069, 1, 1, 1, 1, 1,
0.3325671, -0.3552192, 4.206734, 1, 1, 1, 1, 1,
0.332799, -0.8614811, 3.217484, 1, 1, 1, 1, 1,
0.3357567, -0.5993142, 2.653352, 1, 1, 1, 1, 1,
0.339854, 0.1786605, 0.9587108, 1, 1, 1, 1, 1,
0.3417077, 0.4356081, 1.444054, 1, 1, 1, 1, 1,
0.3465967, -1.485636, 2.23344, 1, 1, 1, 1, 1,
0.348195, -0.1439086, 1.878967, 1, 1, 1, 1, 1,
0.3512761, -1.060296, 3.770745, 1, 1, 1, 1, 1,
0.3528443, 1.20981, 1.069154, 0, 0, 1, 1, 1,
0.3598433, 1.330571, 0.9241498, 1, 0, 0, 1, 1,
0.3616939, -0.7719595, 3.253623, 1, 0, 0, 1, 1,
0.3626674, -0.679876, 3.564491, 1, 0, 0, 1, 1,
0.3675154, -0.2486343, 0.5357374, 1, 0, 0, 1, 1,
0.3686786, 0.4970725, 1.636053, 1, 0, 0, 1, 1,
0.3688099, 1.468367, 1.487761, 0, 0, 0, 1, 1,
0.3691971, 0.4431897, 0.6889663, 0, 0, 0, 1, 1,
0.3766448, -0.9138309, 2.117515, 0, 0, 0, 1, 1,
0.3771265, -1.007157, 0.5097737, 0, 0, 0, 1, 1,
0.3776706, -2.161181, 2.592048, 0, 0, 0, 1, 1,
0.3830736, -0.154696, 2.896452, 0, 0, 0, 1, 1,
0.3882429, 0.1654744, 0.4351647, 0, 0, 0, 1, 1,
0.3885488, 0.633482, 1.561093, 1, 1, 1, 1, 1,
0.396563, 0.06952409, -0.2673028, 1, 1, 1, 1, 1,
0.4053181, -0.8338033, 2.912426, 1, 1, 1, 1, 1,
0.4079411, 1.149941, 0.6145675, 1, 1, 1, 1, 1,
0.4100862, -0.4791035, 2.251114, 1, 1, 1, 1, 1,
0.4101892, 0.9602398, 0.6850173, 1, 1, 1, 1, 1,
0.4115282, 1.572447, 0.4036298, 1, 1, 1, 1, 1,
0.4126798, 0.083899, 2.983382, 1, 1, 1, 1, 1,
0.416621, 0.2924983, -0.8036491, 1, 1, 1, 1, 1,
0.4168548, -2.112406, 3.424013, 1, 1, 1, 1, 1,
0.4200673, 0.1955331, 2.096279, 1, 1, 1, 1, 1,
0.4201344, -0.2487159, 1.727742, 1, 1, 1, 1, 1,
0.4222279, 0.8347114, -0.09156252, 1, 1, 1, 1, 1,
0.4228261, -0.7947955, 3.589465, 1, 1, 1, 1, 1,
0.4311736, -1.589019, 2.709706, 1, 1, 1, 1, 1,
0.4322454, 0.6523148, -1.002186, 0, 0, 1, 1, 1,
0.4335166, 0.03592831, 0.4109219, 1, 0, 0, 1, 1,
0.4360538, 0.4059475, 2.264634, 1, 0, 0, 1, 1,
0.4408578, 0.84203, 1.861389, 1, 0, 0, 1, 1,
0.4442153, 0.8027297, -1.583639, 1, 0, 0, 1, 1,
0.4469329, 0.02979081, 1.64366, 1, 0, 0, 1, 1,
0.4493008, -0.9186232, 3.114578, 0, 0, 0, 1, 1,
0.452365, 0.233454, 1.589148, 0, 0, 0, 1, 1,
0.4529566, -0.5794444, 4.378064, 0, 0, 0, 1, 1,
0.465033, -0.3796548, 2.61605, 0, 0, 0, 1, 1,
0.4659153, -0.2802291, 4.135723, 0, 0, 0, 1, 1,
0.4666134, -0.8747334, 3.249984, 0, 0, 0, 1, 1,
0.4682803, 1.879931, 1.21821, 0, 0, 0, 1, 1,
0.4683284, 0.8834013, 0.7164364, 1, 1, 1, 1, 1,
0.468354, 0.2443048, 1.697563, 1, 1, 1, 1, 1,
0.4696642, 0.7552236, -0.359174, 1, 1, 1, 1, 1,
0.4702767, 0.635888, 0.6993063, 1, 1, 1, 1, 1,
0.4721078, 1.512014, -0.256687, 1, 1, 1, 1, 1,
0.4732929, -0.7954555, 1.622528, 1, 1, 1, 1, 1,
0.4793245, 2.311126, 0.8830011, 1, 1, 1, 1, 1,
0.4812422, -1.409664, 4.423433, 1, 1, 1, 1, 1,
0.4873183, -0.6094648, 3.17782, 1, 1, 1, 1, 1,
0.4939716, 0.04855902, 1.82292, 1, 1, 1, 1, 1,
0.4962373, -0.03104082, 1.17043, 1, 1, 1, 1, 1,
0.5089516, 0.6672813, 0.5125592, 1, 1, 1, 1, 1,
0.5142864, -1.109133, 3.773922, 1, 1, 1, 1, 1,
0.5173422, -0.1873057, 1.021933, 1, 1, 1, 1, 1,
0.5201146, -0.2948081, 1.719407, 1, 1, 1, 1, 1,
0.5207027, 1.540401, -0.3918928, 0, 0, 1, 1, 1,
0.5216561, -0.06697473, 3.582061, 1, 0, 0, 1, 1,
0.5221027, 0.7021827, 0.0691065, 1, 0, 0, 1, 1,
0.5233714, -0.9574198, 0.6376714, 1, 0, 0, 1, 1,
0.5300276, 0.5222753, 0.4500495, 1, 0, 0, 1, 1,
0.5310087, 2.102071, -1.265169, 1, 0, 0, 1, 1,
0.5330663, -0.162446, 0.7755166, 0, 0, 0, 1, 1,
0.5362877, 0.6762522, 1.179995, 0, 0, 0, 1, 1,
0.5363795, -0.1696003, 2.013441, 0, 0, 0, 1, 1,
0.5388605, -0.723016, 2.605706, 0, 0, 0, 1, 1,
0.5444365, 0.2491705, 3.161354, 0, 0, 0, 1, 1,
0.5464708, -0.9877465, 5.030518, 0, 0, 0, 1, 1,
0.5476752, -0.01020952, 2.591262, 0, 0, 0, 1, 1,
0.5484849, -1.141479, 1.602848, 1, 1, 1, 1, 1,
0.5507314, 0.648716, 0.5361855, 1, 1, 1, 1, 1,
0.552626, -0.6040809, 1.301009, 1, 1, 1, 1, 1,
0.5546088, 0.01593613, 1.670297, 1, 1, 1, 1, 1,
0.5561882, -0.08759289, 2.863511, 1, 1, 1, 1, 1,
0.5602765, 1.810832, -0.03354456, 1, 1, 1, 1, 1,
0.5616822, 0.5846674, 2.023307, 1, 1, 1, 1, 1,
0.5629213, 0.9233776, 0.07603627, 1, 1, 1, 1, 1,
0.5685574, 1.295698, -0.6278245, 1, 1, 1, 1, 1,
0.5727708, 1.393957, 0.391475, 1, 1, 1, 1, 1,
0.5745339, 0.1115758, 0.6705653, 1, 1, 1, 1, 1,
0.57573, 0.4515401, -0.7748207, 1, 1, 1, 1, 1,
0.5773204, -0.08967882, 2.102892, 1, 1, 1, 1, 1,
0.5791679, -0.7100298, 2.313693, 1, 1, 1, 1, 1,
0.5853996, -0.2200315, 2.948223, 1, 1, 1, 1, 1,
0.5939153, -1.495238, 3.428026, 0, 0, 1, 1, 1,
0.5942536, -0.5537217, 1.904432, 1, 0, 0, 1, 1,
0.59682, 1.076216, 0.9739562, 1, 0, 0, 1, 1,
0.5978651, -0.7201297, 4.694165, 1, 0, 0, 1, 1,
0.6000702, 1.284286, -1.34415, 1, 0, 0, 1, 1,
0.6005022, -2.206239, 2.37393, 1, 0, 0, 1, 1,
0.6040087, 0.2999997, 1.497953, 0, 0, 0, 1, 1,
0.6101412, 0.3823792, 0.1397139, 0, 0, 0, 1, 1,
0.6113497, 0.1859009, 1.874498, 0, 0, 0, 1, 1,
0.616819, 0.2059568, 1.121072, 0, 0, 0, 1, 1,
0.6168287, -0.3490241, 1.050846, 0, 0, 0, 1, 1,
0.6208704, -1.511669, 1.094405, 0, 0, 0, 1, 1,
0.6243013, -0.8568726, 2.249006, 0, 0, 0, 1, 1,
0.6288743, -0.01563822, 0.3863491, 1, 1, 1, 1, 1,
0.6376893, -1.478565, 3.847513, 1, 1, 1, 1, 1,
0.6430454, 0.786687, -0.4408294, 1, 1, 1, 1, 1,
0.6445108, -0.9817517, 3.289828, 1, 1, 1, 1, 1,
0.6480691, -0.9670938, 2.000558, 1, 1, 1, 1, 1,
0.64823, 1.223294, 0.1001223, 1, 1, 1, 1, 1,
0.6487917, 0.6253174, 1.959152, 1, 1, 1, 1, 1,
0.6538996, 0.2421052, -0.1338602, 1, 1, 1, 1, 1,
0.6545637, 0.7572098, 2.038678, 1, 1, 1, 1, 1,
0.6573415, -0.602135, 2.40534, 1, 1, 1, 1, 1,
0.657546, -0.460668, 3.322803, 1, 1, 1, 1, 1,
0.6616485, 0.05237461, 1.180785, 1, 1, 1, 1, 1,
0.6658356, 0.8625323, -0.8980208, 1, 1, 1, 1, 1,
0.6676412, -0.293662, 2.390055, 1, 1, 1, 1, 1,
0.68154, 2.856452, -0.3876168, 1, 1, 1, 1, 1,
0.6827355, -0.5014555, 2.453979, 0, 0, 1, 1, 1,
0.689034, 1.267503, 0.5035079, 1, 0, 0, 1, 1,
0.6909556, -0.3840472, -0.1222288, 1, 0, 0, 1, 1,
0.6956238, 0.2036218, 2.061349, 1, 0, 0, 1, 1,
0.6963624, -0.7778288, 3.14231, 1, 0, 0, 1, 1,
0.6971612, 0.5932685, -0.149363, 1, 0, 0, 1, 1,
0.7018921, 1.314978, 0.8632351, 0, 0, 0, 1, 1,
0.7062715, -0.3081203, 1.350617, 0, 0, 0, 1, 1,
0.7067622, 0.3329122, 0.4015316, 0, 0, 0, 1, 1,
0.7078063, -0.7904781, 1.540371, 0, 0, 0, 1, 1,
0.7089284, -1.0078, 2.409544, 0, 0, 0, 1, 1,
0.7123324, -1.749362, 3.791902, 0, 0, 0, 1, 1,
0.7151543, -0.9851962, 1.944883, 0, 0, 0, 1, 1,
0.7155774, 1.817862, 0.536495, 1, 1, 1, 1, 1,
0.7244769, -0.595736, 1.656976, 1, 1, 1, 1, 1,
0.7289877, -0.1437659, 0.9901624, 1, 1, 1, 1, 1,
0.7322274, -0.7206488, 0.5374045, 1, 1, 1, 1, 1,
0.7401829, -0.5534246, 1.631625, 1, 1, 1, 1, 1,
0.7445963, -1.782751, 4.146476, 1, 1, 1, 1, 1,
0.7506586, 0.01368052, 1.387912, 1, 1, 1, 1, 1,
0.7584491, -1.016416, 0.819204, 1, 1, 1, 1, 1,
0.7613668, 0.9185956, 2.634072, 1, 1, 1, 1, 1,
0.7632251, -0.5925555, 0.919857, 1, 1, 1, 1, 1,
0.7682573, 1.812853, 1.106499, 1, 1, 1, 1, 1,
0.7722828, -0.519547, 1.7667, 1, 1, 1, 1, 1,
0.7758002, 0.3341983, 0.7449945, 1, 1, 1, 1, 1,
0.7797725, 0.1092343, 3.161352, 1, 1, 1, 1, 1,
0.7798834, 0.6969069, 2.234325, 1, 1, 1, 1, 1,
0.78168, -2.326305, 3.16103, 0, 0, 1, 1, 1,
0.7851831, -0.08825322, 1.878496, 1, 0, 0, 1, 1,
0.7855704, -0.4571409, 0.5573196, 1, 0, 0, 1, 1,
0.7915441, -0.6620148, 1.062015, 1, 0, 0, 1, 1,
0.7967796, -1.064418, 2.248456, 1, 0, 0, 1, 1,
0.7968155, -0.991004, 2.491389, 1, 0, 0, 1, 1,
0.7987037, 1.021047, 0.3577166, 0, 0, 0, 1, 1,
0.8001286, 1.384582, 2.469302, 0, 0, 0, 1, 1,
0.8087388, -0.05432932, 1.03833, 0, 0, 0, 1, 1,
0.8118911, 0.4380901, 0.9274355, 0, 0, 0, 1, 1,
0.8143808, -0.6927317, 1.563277, 0, 0, 0, 1, 1,
0.8216545, -0.01257113, 0.3912039, 0, 0, 0, 1, 1,
0.8252255, 0.08208328, 3.091508, 0, 0, 0, 1, 1,
0.8394079, 0.7681051, -0.288612, 1, 1, 1, 1, 1,
0.8444629, 0.5220354, 1.031916, 1, 1, 1, 1, 1,
0.8450229, 1.164095, 0.2861327, 1, 1, 1, 1, 1,
0.8497775, 0.9665671, 0.1805326, 1, 1, 1, 1, 1,
0.8548074, -0.1322612, 2.936303, 1, 1, 1, 1, 1,
0.8565071, -0.1780756, 2.487988, 1, 1, 1, 1, 1,
0.8568795, -0.08151945, 2.99568, 1, 1, 1, 1, 1,
0.8608824, -0.05908135, 3.208286, 1, 1, 1, 1, 1,
0.8659244, -0.3081543, 2.014207, 1, 1, 1, 1, 1,
0.873247, 2.184958, 1.259333, 1, 1, 1, 1, 1,
0.8735803, -0.7054714, 1.509291, 1, 1, 1, 1, 1,
0.8793982, -0.4775336, 1.178083, 1, 1, 1, 1, 1,
0.8882464, -0.6664907, 2.363928, 1, 1, 1, 1, 1,
0.8910351, 0.1454366, 1.053407, 1, 1, 1, 1, 1,
0.8933516, 1.518973, -0.8122395, 1, 1, 1, 1, 1,
0.9032242, 0.4001773, 0.5842789, 0, 0, 1, 1, 1,
0.9032748, 0.974748, 0.9737226, 1, 0, 0, 1, 1,
0.9083388, -0.8864828, 1.835708, 1, 0, 0, 1, 1,
0.9111769, -0.4313793, 0.7856249, 1, 0, 0, 1, 1,
0.9204935, 1.50254, -0.05226029, 1, 0, 0, 1, 1,
0.9290096, -1.293054, 2.710245, 1, 0, 0, 1, 1,
0.9290564, -0.7904919, 3.767376, 0, 0, 0, 1, 1,
0.9309707, 1.546168, 1.541295, 0, 0, 0, 1, 1,
0.9335011, -0.005239103, 0.5582427, 0, 0, 0, 1, 1,
0.9373711, 1.517163, 1.663217, 0, 0, 0, 1, 1,
0.9404571, 2.682558, 1.195376, 0, 0, 0, 1, 1,
0.940724, 0.2313865, 1.470215, 0, 0, 0, 1, 1,
0.9447411, -0.8472347, 1.985386, 0, 0, 0, 1, 1,
0.9454619, 1.420471, -0.1473659, 1, 1, 1, 1, 1,
0.9484178, -0.726411, 2.290608, 1, 1, 1, 1, 1,
0.9488692, 1.691889, 0.6968568, 1, 1, 1, 1, 1,
0.9494719, 0.1579697, 1.360058, 1, 1, 1, 1, 1,
0.950225, 0.8601242, 2.167367, 1, 1, 1, 1, 1,
0.9567693, -0.2422108, 0.1530292, 1, 1, 1, 1, 1,
0.9585096, 0.6275114, 2.16761, 1, 1, 1, 1, 1,
0.9606974, 0.1070034, 2.022194, 1, 1, 1, 1, 1,
0.9609526, -1.958904, 3.349964, 1, 1, 1, 1, 1,
0.9632492, -0.5690603, 4.388841, 1, 1, 1, 1, 1,
0.9726709, -1.716183, 2.055583, 1, 1, 1, 1, 1,
0.9767699, -1.155728, 2.282736, 1, 1, 1, 1, 1,
0.9774438, 1.712279, 0.5203161, 1, 1, 1, 1, 1,
0.9786779, -0.7596093, 2.412211, 1, 1, 1, 1, 1,
0.9829294, -0.1792568, 1.453959, 1, 1, 1, 1, 1,
0.9883018, 1.24192, 1.18946, 0, 0, 1, 1, 1,
0.9911782, -0.6034771, 2.99162, 1, 0, 0, 1, 1,
0.9923697, -0.4660268, 2.052474, 1, 0, 0, 1, 1,
0.9963113, -0.2384527, 1.067671, 1, 0, 0, 1, 1,
0.9971009, -0.5811362, 3.069116, 1, 0, 0, 1, 1,
0.9980568, 0.07265536, 2.484729, 1, 0, 0, 1, 1,
1.001127, -0.2441584, -0.1708901, 0, 0, 0, 1, 1,
1.001455, 0.5686403, -0.2368125, 0, 0, 0, 1, 1,
1.002993, 1.168976, 1.438394, 0, 0, 0, 1, 1,
1.003261, -0.03214609, 3.522215, 0, 0, 0, 1, 1,
1.006498, -0.7543854, 2.851659, 0, 0, 0, 1, 1,
1.008998, -0.3245016, 3.018397, 0, 0, 0, 1, 1,
1.01425, -0.3840758, 1.604359, 0, 0, 0, 1, 1,
1.017151, 0.2266396, 0.5867143, 1, 1, 1, 1, 1,
1.018921, -0.1844584, 1.618553, 1, 1, 1, 1, 1,
1.02256, -1.986031, 2.621147, 1, 1, 1, 1, 1,
1.027461, 0.8359939, 0.5839668, 1, 1, 1, 1, 1,
1.027733, -1.13822, 1.800137, 1, 1, 1, 1, 1,
1.030001, -0.5435238, 1.733308, 1, 1, 1, 1, 1,
1.03939, -0.5212902, 3.164719, 1, 1, 1, 1, 1,
1.044237, -0.1067324, 1.013551, 1, 1, 1, 1, 1,
1.052652, 1.483367, 1.377977, 1, 1, 1, 1, 1,
1.057572, 0.5101544, 1.524997, 1, 1, 1, 1, 1,
1.063867, -0.940831, 3.553705, 1, 1, 1, 1, 1,
1.067659, 0.762737, 3.043036, 1, 1, 1, 1, 1,
1.07313, -0.01480234, 1.536375, 1, 1, 1, 1, 1,
1.073835, -0.3384157, 1.850724, 1, 1, 1, 1, 1,
1.074875, -0.5796968, 2.457512, 1, 1, 1, 1, 1,
1.083496, -2.846004, 2.113158, 0, 0, 1, 1, 1,
1.084485, 1.791029, -1.354582, 1, 0, 0, 1, 1,
1.087539, -0.5533165, 1.714494, 1, 0, 0, 1, 1,
1.093435, -0.2879549, 1.332221, 1, 0, 0, 1, 1,
1.094171, -0.1554793, 3.847404, 1, 0, 0, 1, 1,
1.098936, -0.856537, 1.642142, 1, 0, 0, 1, 1,
1.102249, 1.589216, 1.045235, 0, 0, 0, 1, 1,
1.106202, -1.223737, 2.434388, 0, 0, 0, 1, 1,
1.106476, 0.015914, 3.066734, 0, 0, 0, 1, 1,
1.117756, -1.144832, 3.352143, 0, 0, 0, 1, 1,
1.123148, -2.181845, 3.836692, 0, 0, 0, 1, 1,
1.125698, 1.590799, 1.660168, 0, 0, 0, 1, 1,
1.128791, -0.3247659, 2.833056, 0, 0, 0, 1, 1,
1.136537, 1.459823, 1.296983, 1, 1, 1, 1, 1,
1.138228, -0.4025367, 2.348332, 1, 1, 1, 1, 1,
1.141463, 1.820868, 2.167836, 1, 1, 1, 1, 1,
1.143415, 0.04410421, 3.814618, 1, 1, 1, 1, 1,
1.144772, 0.5539445, 2.231021, 1, 1, 1, 1, 1,
1.14901, 2.433756, -0.1147814, 1, 1, 1, 1, 1,
1.153204, -0.1538223, 1.213655, 1, 1, 1, 1, 1,
1.153439, 1.343919, 2.793826, 1, 1, 1, 1, 1,
1.156893, 1.160114, -0.3640727, 1, 1, 1, 1, 1,
1.172376, 0.5459728, 1.662766, 1, 1, 1, 1, 1,
1.173895, -0.1513944, 2.546902, 1, 1, 1, 1, 1,
1.174408, 1.224218, 0.932112, 1, 1, 1, 1, 1,
1.17546, -0.7216976, 2.333766, 1, 1, 1, 1, 1,
1.185624, 0.1269042, -0.8895412, 1, 1, 1, 1, 1,
1.188132, -0.06991291, 2.309125, 1, 1, 1, 1, 1,
1.190424, 1.212485, 2.049322, 0, 0, 1, 1, 1,
1.197205, 0.4751566, 0.7159931, 1, 0, 0, 1, 1,
1.19895, 0.2548392, 1.761679, 1, 0, 0, 1, 1,
1.201785, 0.2197808, 1.890669, 1, 0, 0, 1, 1,
1.202124, -0.6995394, 1.629968, 1, 0, 0, 1, 1,
1.211185, 0.2787753, 2.487138, 1, 0, 0, 1, 1,
1.213406, -0.740752, 2.89684, 0, 0, 0, 1, 1,
1.220627, 1.659598, 0.5831367, 0, 0, 0, 1, 1,
1.229708, 0.09872419, 3.311514, 0, 0, 0, 1, 1,
1.231864, 1.086955, -0.6061991, 0, 0, 0, 1, 1,
1.232757, -0.7592936, 3.143516, 0, 0, 0, 1, 1,
1.247518, 0.2885304, -0.1688762, 0, 0, 0, 1, 1,
1.250951, -0.5133132, 2.359326, 0, 0, 0, 1, 1,
1.257113, -0.7835996, 1.377696, 1, 1, 1, 1, 1,
1.258617, -1.795624, 2.435509, 1, 1, 1, 1, 1,
1.265169, 1.18867, 2.31244, 1, 1, 1, 1, 1,
1.265636, 0.1696748, 1.168475, 1, 1, 1, 1, 1,
1.274722, -0.4883018, 1.108609, 1, 1, 1, 1, 1,
1.274949, -0.6666301, 4.021131, 1, 1, 1, 1, 1,
1.284427, 0.447316, 1.77594, 1, 1, 1, 1, 1,
1.285886, 1.289011, 2.63247, 1, 1, 1, 1, 1,
1.286344, 0.7287866, 1.118743, 1, 1, 1, 1, 1,
1.293657, -0.3239776, 0.06673582, 1, 1, 1, 1, 1,
1.311733, 0.4654486, 1.63987, 1, 1, 1, 1, 1,
1.312587, -1.31212, 3.051497, 1, 1, 1, 1, 1,
1.319077, -0.05494959, 3.657109, 1, 1, 1, 1, 1,
1.323975, -0.4028318, 1.903403, 1, 1, 1, 1, 1,
1.335142, -0.5780949, -0.1264317, 1, 1, 1, 1, 1,
1.335975, 1.684187, 1.514392, 0, 0, 1, 1, 1,
1.353027, -0.07744279, 1.243018, 1, 0, 0, 1, 1,
1.354308, 0.09549247, 1.065198, 1, 0, 0, 1, 1,
1.363004, 0.2773191, 2.275533, 1, 0, 0, 1, 1,
1.363382, -0.4879458, 1.615651, 1, 0, 0, 1, 1,
1.365278, 0.3476427, 2.235861, 1, 0, 0, 1, 1,
1.370586, -0.6209373, 1.861717, 0, 0, 0, 1, 1,
1.371095, -1.854404, 2.153052, 0, 0, 0, 1, 1,
1.381353, -0.3794897, 3.826435, 0, 0, 0, 1, 1,
1.382228, 0.215061, 0.3056717, 0, 0, 0, 1, 1,
1.385625, -0.09609038, 1.820757, 0, 0, 0, 1, 1,
1.391703, -0.6609496, 2.080365, 0, 0, 0, 1, 1,
1.394857, -0.2343439, 0.577278, 0, 0, 0, 1, 1,
1.400212, 0.100875, 1.931513, 1, 1, 1, 1, 1,
1.404737, -0.4633518, -0.5382244, 1, 1, 1, 1, 1,
1.412201, -1.243608, 1.958525, 1, 1, 1, 1, 1,
1.427291, -0.3091048, 0.9907538, 1, 1, 1, 1, 1,
1.428859, -1.126141, 1.235116, 1, 1, 1, 1, 1,
1.445452, -0.6308399, 1.606791, 1, 1, 1, 1, 1,
1.445966, -1.861788, 0.4098703, 1, 1, 1, 1, 1,
1.468707, 1.483364, 1.297832, 1, 1, 1, 1, 1,
1.46963, 0.1438039, 2.211026, 1, 1, 1, 1, 1,
1.473598, 1.13717, 1.619146, 1, 1, 1, 1, 1,
1.475216, 0.0259274, 2.918784, 1, 1, 1, 1, 1,
1.484133, 0.8362134, 2.544749, 1, 1, 1, 1, 1,
1.487155, -2.376192, 3.153341, 1, 1, 1, 1, 1,
1.499424, -0.9666437, 1.792767, 1, 1, 1, 1, 1,
1.502351, -0.4577831, -0.09712326, 1, 1, 1, 1, 1,
1.508629, -0.05019736, 3.153186, 0, 0, 1, 1, 1,
1.520976, -0.2926131, 1.090676, 1, 0, 0, 1, 1,
1.523196, -1.925626, 2.065088, 1, 0, 0, 1, 1,
1.533892, 1.282244, 1.219823, 1, 0, 0, 1, 1,
1.534885, 0.417725, 1.628129, 1, 0, 0, 1, 1,
1.537038, -2.191811, 1.591579, 1, 0, 0, 1, 1,
1.537315, 1.238276, 0.488513, 0, 0, 0, 1, 1,
1.541196, -0.5495178, 0.8187606, 0, 0, 0, 1, 1,
1.542571, 0.7641342, 0.6338867, 0, 0, 0, 1, 1,
1.544017, -1.46567, 2.959027, 0, 0, 0, 1, 1,
1.546991, 1.078596, 0.9745137, 0, 0, 0, 1, 1,
1.552162, -0.2756945, 1.772553, 0, 0, 0, 1, 1,
1.554523, 0.5157642, 0.3322107, 0, 0, 0, 1, 1,
1.565899, 0.8943833, 1.378307, 1, 1, 1, 1, 1,
1.571599, 0.8695635, 2.275053, 1, 1, 1, 1, 1,
1.584015, -2.036572, 3.347986, 1, 1, 1, 1, 1,
1.587679, 0.731217, -0.924374, 1, 1, 1, 1, 1,
1.61354, 0.4193145, 0.2136477, 1, 1, 1, 1, 1,
1.618823, -0.2054866, 1.231354, 1, 1, 1, 1, 1,
1.620358, 2.562503, 0.1371952, 1, 1, 1, 1, 1,
1.620744, 0.3219005, -0.2336697, 1, 1, 1, 1, 1,
1.623805, -0.5806753, -0.01933894, 1, 1, 1, 1, 1,
1.627498, 0.4016797, 2.216116, 1, 1, 1, 1, 1,
1.632065, 0.2815726, 0.4159144, 1, 1, 1, 1, 1,
1.633567, -1.131317, 2.590289, 1, 1, 1, 1, 1,
1.638543, 0.2598799, 2.532126, 1, 1, 1, 1, 1,
1.642704, 0.1707937, 3.164574, 1, 1, 1, 1, 1,
1.662505, 0.7483484, 1.219639, 1, 1, 1, 1, 1,
1.663304, 0.5966642, 0.2289067, 0, 0, 1, 1, 1,
1.663512, 0.1280362, 0.3532227, 1, 0, 0, 1, 1,
1.67193, 0.6798202, 2.391334, 1, 0, 0, 1, 1,
1.675953, 1.663669, 1.094085, 1, 0, 0, 1, 1,
1.682267, -1.139714, 1.839995, 1, 0, 0, 1, 1,
1.726109, -0.8438936, 1.257185, 1, 0, 0, 1, 1,
1.73062, -1.169928, 0.9166115, 0, 0, 0, 1, 1,
1.735977, 0.7103022, -0.2205227, 0, 0, 0, 1, 1,
1.759712, -0.9174641, 2.371417, 0, 0, 0, 1, 1,
1.759901, 0.3213934, 2.254805, 0, 0, 0, 1, 1,
1.764131, -1.058281, 1.376316, 0, 0, 0, 1, 1,
1.775099, -1.400368, 3.613658, 0, 0, 0, 1, 1,
1.782053, 0.6922207, 2.509129, 0, 0, 0, 1, 1,
1.810791, 1.089523, 1.745953, 1, 1, 1, 1, 1,
1.830258, -1.621524, 3.120379, 1, 1, 1, 1, 1,
1.835851, -0.5817475, 1.061971, 1, 1, 1, 1, 1,
1.845203, 2.534632, 0.1492971, 1, 1, 1, 1, 1,
1.856497, 1.120258, 0.8794075, 1, 1, 1, 1, 1,
1.904254, -2.289407, 0.5921534, 1, 1, 1, 1, 1,
1.917381, 0.06656977, 1.190644, 1, 1, 1, 1, 1,
1.942125, -0.02893127, 1.433414, 1, 1, 1, 1, 1,
1.946569, 1.788452, 0.7856686, 1, 1, 1, 1, 1,
1.961787, 0.1203832, 2.164598, 1, 1, 1, 1, 1,
1.966915, 0.8045616, 1.307599, 1, 1, 1, 1, 1,
1.977109, 1.029064, 2.310641, 1, 1, 1, 1, 1,
2.006221, 1.320582, 0.6793354, 1, 1, 1, 1, 1,
2.009536, 0.8791506, 2.97005, 1, 1, 1, 1, 1,
2.031475, 0.7693344, 0.7519646, 1, 1, 1, 1, 1,
2.055866, 0.4784397, 0.9281255, 0, 0, 1, 1, 1,
2.077903, 0.309839, 2.26137, 1, 0, 0, 1, 1,
2.091011, 0.1412625, 2.386465, 1, 0, 0, 1, 1,
2.098327, 2.029519, 1.213199, 1, 0, 0, 1, 1,
2.11036, -1.294101, 0.541067, 1, 0, 0, 1, 1,
2.200796, 0.03281792, -0.3661039, 1, 0, 0, 1, 1,
2.260137, 0.8987553, -0.06074087, 0, 0, 0, 1, 1,
2.265335, -0.8367211, 2.496722, 0, 0, 0, 1, 1,
2.268179, 0.4372281, 1.086838, 0, 0, 0, 1, 1,
2.333547, -0.3943155, 2.847219, 0, 0, 0, 1, 1,
2.361178, -1.168365, 0.2361009, 0, 0, 0, 1, 1,
2.371528, -0.2520852, 0.3003188, 0, 0, 0, 1, 1,
2.410439, -0.2923449, 0.8185047, 0, 0, 0, 1, 1,
2.419304, -0.493486, 2.195531, 1, 1, 1, 1, 1,
2.432714, 0.8081747, 2.949846, 1, 1, 1, 1, 1,
2.467467, 1.963349, 2.209891, 1, 1, 1, 1, 1,
2.693197, -0.2746035, 1.911752, 1, 1, 1, 1, 1,
2.761331, 0.8742043, 1.903728, 1, 1, 1, 1, 1,
3.173537, -1.30041, 3.157951, 1, 1, 1, 1, 1,
4.619224, 0.2824346, 1.602385, 1, 1, 1, 1, 1
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
var radius = 9.499753;
var distance = 33.36748;
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
mvMatrix.translate( -0.5992806, 0.05180168, -0.3816226 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36748);
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