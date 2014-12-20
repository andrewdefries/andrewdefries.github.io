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
-2.70357, -0.6688882, -2.154684, 1, 0, 0, 1,
-2.596042, 1.538881, 0.1991129, 1, 0.007843138, 0, 1,
-2.466722, 1.009964, -1.395188, 1, 0.01176471, 0, 1,
-2.444854, 1.438641, 0.908673, 1, 0.01960784, 0, 1,
-2.405823, 1.68849, 0.5898414, 1, 0.02352941, 0, 1,
-2.339504, -0.2555116, -0.4131255, 1, 0.03137255, 0, 1,
-2.309333, -1.041872, -3.736097, 1, 0.03529412, 0, 1,
-2.307374, 0.1270193, -2.062285, 1, 0.04313726, 0, 1,
-2.306488, 0.003871533, -1.686285, 1, 0.04705882, 0, 1,
-2.14628, 0.5565163, -0.206459, 1, 0.05490196, 0, 1,
-2.072816, 0.204997, -1.382494, 1, 0.05882353, 0, 1,
-2.064019, -1.424197, -2.908376, 1, 0.06666667, 0, 1,
-2.0523, 0.1393348, -0.9571751, 1, 0.07058824, 0, 1,
-2.023634, 0.6694186, -2.149588, 1, 0.07843138, 0, 1,
-2.021156, 0.9519384, -0.9344035, 1, 0.08235294, 0, 1,
-2.02054, -0.02700383, -1.258665, 1, 0.09019608, 0, 1,
-2.017671, 1.667917, -0.828248, 1, 0.09411765, 0, 1,
-2.017452, 0.04678745, -1.496707, 1, 0.1019608, 0, 1,
-1.992438, 1.384859, 0.07994888, 1, 0.1098039, 0, 1,
-1.991031, -2.021542, -1.299955, 1, 0.1137255, 0, 1,
-1.98671, -3.047724, -2.247303, 1, 0.1215686, 0, 1,
-1.977128, 0.4770029, 0.3149003, 1, 0.1254902, 0, 1,
-1.96191, -0.1529506, -1.713415, 1, 0.1333333, 0, 1,
-1.960649, -0.01216207, -0.3804904, 1, 0.1372549, 0, 1,
-1.954304, 1.214697, 0.4961097, 1, 0.145098, 0, 1,
-1.952997, -0.3070278, -2.315211, 1, 0.1490196, 0, 1,
-1.952425, -0.6980711, -0.9834791, 1, 0.1568628, 0, 1,
-1.950655, -0.08298516, -2.234824, 1, 0.1607843, 0, 1,
-1.937976, 0.2706725, -1.734805, 1, 0.1686275, 0, 1,
-1.924346, 1.426444, -2.945593, 1, 0.172549, 0, 1,
-1.900558, 2.058704, 0.2411032, 1, 0.1803922, 0, 1,
-1.870782, 0.341692, -1.855624, 1, 0.1843137, 0, 1,
-1.840594, -3.115882, -3.299737, 1, 0.1921569, 0, 1,
-1.826618, 0.3944234, -1.730875, 1, 0.1960784, 0, 1,
-1.825037, 0.2273905, -1.410382, 1, 0.2039216, 0, 1,
-1.804218, 0.1175642, -1.095482, 1, 0.2117647, 0, 1,
-1.758628, 0.5001991, -2.740517, 1, 0.2156863, 0, 1,
-1.758322, 1.438807, -1.239958, 1, 0.2235294, 0, 1,
-1.753185, 0.09199927, -1.519127, 1, 0.227451, 0, 1,
-1.747216, -0.2681871, -2.719692, 1, 0.2352941, 0, 1,
-1.745375, -0.3499281, -2.68192, 1, 0.2392157, 0, 1,
-1.723733, -0.6741127, -0.6672549, 1, 0.2470588, 0, 1,
-1.715998, 0.5906715, -0.8256874, 1, 0.2509804, 0, 1,
-1.687183, -0.4531182, -1.032448, 1, 0.2588235, 0, 1,
-1.672647, -1.099383, -1.981679, 1, 0.2627451, 0, 1,
-1.666325, 0.8630489, -1.688247, 1, 0.2705882, 0, 1,
-1.657684, -0.130959, -2.445676, 1, 0.2745098, 0, 1,
-1.652424, 0.2990516, -3.136227, 1, 0.282353, 0, 1,
-1.645266, -0.2464435, -1.820579, 1, 0.2862745, 0, 1,
-1.637531, 0.4722727, -1.637786, 1, 0.2941177, 0, 1,
-1.604057, -0.6414565, -2.820172, 1, 0.3019608, 0, 1,
-1.59989, 0.2622213, -2.279655, 1, 0.3058824, 0, 1,
-1.598906, -1.862841, -2.269638, 1, 0.3137255, 0, 1,
-1.595682, 0.7680181, 0.0848277, 1, 0.3176471, 0, 1,
-1.591055, 0.1954567, 0.5045563, 1, 0.3254902, 0, 1,
-1.586209, 0.9053257, 2.041506, 1, 0.3294118, 0, 1,
-1.5676, -1.302898, -0.5023946, 1, 0.3372549, 0, 1,
-1.565458, 0.6298037, -0.4826279, 1, 0.3411765, 0, 1,
-1.551838, 0.5462072, -1.342898, 1, 0.3490196, 0, 1,
-1.546566, 0.04202084, -2.493747, 1, 0.3529412, 0, 1,
-1.537271, 0.9225295, -1.279669, 1, 0.3607843, 0, 1,
-1.533328, 0.5118616, -2.111605, 1, 0.3647059, 0, 1,
-1.533099, -0.5853475, -1.505936, 1, 0.372549, 0, 1,
-1.528088, 0.6853971, -2.460234, 1, 0.3764706, 0, 1,
-1.525722, 0.7461985, 0.08594186, 1, 0.3843137, 0, 1,
-1.522564, 1.977637, -1.395413, 1, 0.3882353, 0, 1,
-1.515359, 0.2932999, -3.028126, 1, 0.3960784, 0, 1,
-1.512355, 0.5086108, -2.34307, 1, 0.4039216, 0, 1,
-1.498786, -0.5012382, -1.758107, 1, 0.4078431, 0, 1,
-1.498761, 2.920104, 0.289052, 1, 0.4156863, 0, 1,
-1.490743, -0.762749, -2.183525, 1, 0.4196078, 0, 1,
-1.471214, -0.4537607, -1.576993, 1, 0.427451, 0, 1,
-1.468782, 1.458061, -1.078789, 1, 0.4313726, 0, 1,
-1.468491, 1.328295, -0.6599993, 1, 0.4392157, 0, 1,
-1.466914, -0.3374515, -0.9232869, 1, 0.4431373, 0, 1,
-1.449635, 0.5573473, -2.114383, 1, 0.4509804, 0, 1,
-1.443472, 0.4183933, -1.356368, 1, 0.454902, 0, 1,
-1.436609, 1.059944, -1.877712, 1, 0.4627451, 0, 1,
-1.422726, -1.517952, -1.741504, 1, 0.4666667, 0, 1,
-1.407562, 0.5592096, -2.188775, 1, 0.4745098, 0, 1,
-1.397115, -0.9009734, -2.987446, 1, 0.4784314, 0, 1,
-1.393642, 0.4879322, -1.891394, 1, 0.4862745, 0, 1,
-1.389436, 1.043421, -1.70658, 1, 0.4901961, 0, 1,
-1.379512, 0.9593601, -1.177979, 1, 0.4980392, 0, 1,
-1.378731, -0.249987, -2.557953, 1, 0.5058824, 0, 1,
-1.374504, 0.9141504, -1.068447, 1, 0.509804, 0, 1,
-1.366874, -1.931549, -2.160996, 1, 0.5176471, 0, 1,
-1.363822, 0.159993, -2.583969, 1, 0.5215687, 0, 1,
-1.359279, 0.5877892, -2.27324, 1, 0.5294118, 0, 1,
-1.358204, -1.207643, -3.86658, 1, 0.5333334, 0, 1,
-1.356803, -0.3006112, -2.603493, 1, 0.5411765, 0, 1,
-1.341864, -0.4823838, -3.174389, 1, 0.5450981, 0, 1,
-1.341829, -0.3847371, -3.046429, 1, 0.5529412, 0, 1,
-1.334196, -0.0008033892, -2.324296, 1, 0.5568628, 0, 1,
-1.323117, -1.686629, -3.79688, 1, 0.5647059, 0, 1,
-1.318769, -0.4741494, -3.805986, 1, 0.5686275, 0, 1,
-1.315303, -1.947413, -3.767582, 1, 0.5764706, 0, 1,
-1.309896, -0.6737533, -3.123522, 1, 0.5803922, 0, 1,
-1.30948, 1.131997, 0.04396621, 1, 0.5882353, 0, 1,
-1.295004, 0.03997456, -0.6916842, 1, 0.5921569, 0, 1,
-1.28956, -0.4105545, -3.137679, 1, 0.6, 0, 1,
-1.279486, 0.5004832, -1.210371, 1, 0.6078432, 0, 1,
-1.272601, 0.7478266, -0.6930251, 1, 0.6117647, 0, 1,
-1.255855, 0.1871271, -0.8999804, 1, 0.6196079, 0, 1,
-1.254068, 1.045124, 0.06854102, 1, 0.6235294, 0, 1,
-1.253978, 0.9927846, -1.658622, 1, 0.6313726, 0, 1,
-1.253356, 0.2911555, -1.306604, 1, 0.6352941, 0, 1,
-1.251775, 0.6132262, 0.05634759, 1, 0.6431373, 0, 1,
-1.249712, -0.6218049, -2.294149, 1, 0.6470588, 0, 1,
-1.246992, 0.245917, -1.70069, 1, 0.654902, 0, 1,
-1.246079, -1.175094, -2.236803, 1, 0.6588235, 0, 1,
-1.237972, 0.6997702, 0.2521112, 1, 0.6666667, 0, 1,
-1.223415, -0.5793759, -1.700196, 1, 0.6705883, 0, 1,
-1.221702, 0.6007373, -1.761006, 1, 0.6784314, 0, 1,
-1.210242, -2.052883, -4.088721, 1, 0.682353, 0, 1,
-1.2086, 1.12485, 0.3122093, 1, 0.6901961, 0, 1,
-1.202694, -0.9823405, -2.980155, 1, 0.6941177, 0, 1,
-1.200438, -0.7108067, -2.058306, 1, 0.7019608, 0, 1,
-1.198907, -0.5333138, -3.565473, 1, 0.7098039, 0, 1,
-1.198236, -0.1233899, -2.039245, 1, 0.7137255, 0, 1,
-1.198124, -1.312217, -2.935473, 1, 0.7215686, 0, 1,
-1.191897, -0.6744276, -1.279986, 1, 0.7254902, 0, 1,
-1.191288, -0.3325738, -2.293825, 1, 0.7333333, 0, 1,
-1.178991, 0.5067773, 0.4628567, 1, 0.7372549, 0, 1,
-1.176419, -0.9318228, -1.617341, 1, 0.7450981, 0, 1,
-1.176093, -0.2536308, -3.108012, 1, 0.7490196, 0, 1,
-1.172668, 0.7528181, -2.101572, 1, 0.7568628, 0, 1,
-1.166178, 0.2930187, -1.081025, 1, 0.7607843, 0, 1,
-1.165074, -0.408398, -1.726132, 1, 0.7686275, 0, 1,
-1.164711, 0.7892412, -0.7464269, 1, 0.772549, 0, 1,
-1.152797, -0.07352292, -2.097791, 1, 0.7803922, 0, 1,
-1.143744, 0.4482615, -2.483957, 1, 0.7843137, 0, 1,
-1.142253, -1.575134, -4.154287, 1, 0.7921569, 0, 1,
-1.132347, 2.052741, -1.689322, 1, 0.7960784, 0, 1,
-1.129873, -1.102866, -2.633316, 1, 0.8039216, 0, 1,
-1.123746, -0.1207902, -3.348812, 1, 0.8117647, 0, 1,
-1.119173, 1.533493, -0.1216567, 1, 0.8156863, 0, 1,
-1.117475, 0.006913109, -1.404788, 1, 0.8235294, 0, 1,
-1.086266, 0.4522656, -1.682776, 1, 0.827451, 0, 1,
-1.083555, 0.2382571, -2.301517, 1, 0.8352941, 0, 1,
-1.080707, -0.8615151, -1.880639, 1, 0.8392157, 0, 1,
-1.079751, -1.764943, -1.732719, 1, 0.8470588, 0, 1,
-1.075338, -0.2331144, -2.480351, 1, 0.8509804, 0, 1,
-1.074962, 1.219362, -1.016393, 1, 0.8588235, 0, 1,
-1.07488, -0.1424472, -1.93187, 1, 0.8627451, 0, 1,
-1.07338, -0.1362777, -3.510919, 1, 0.8705882, 0, 1,
-1.07312, 0.4114297, -3.093426, 1, 0.8745098, 0, 1,
-1.064596, 1.295447, -0.02473216, 1, 0.8823529, 0, 1,
-1.057852, 0.7942066, -0.3445384, 1, 0.8862745, 0, 1,
-1.056502, -1.264866, -2.67892, 1, 0.8941177, 0, 1,
-1.053796, -0.2968748, -2.878599, 1, 0.8980392, 0, 1,
-1.042534, -0.7954757, -0.2799299, 1, 0.9058824, 0, 1,
-1.036615, 0.541665, -1.395493, 1, 0.9137255, 0, 1,
-1.033968, 0.9171842, 0.04479975, 1, 0.9176471, 0, 1,
-1.03324, -1.19409, -0.6812224, 1, 0.9254902, 0, 1,
-1.029973, 0.8243486, -1.181052, 1, 0.9294118, 0, 1,
-1.023847, -0.1088182, -2.602638, 1, 0.9372549, 0, 1,
-1.022406, -0.9481038, -1.621519, 1, 0.9411765, 0, 1,
-1.02033, 0.495351, -1.187095, 1, 0.9490196, 0, 1,
-1.016925, 0.1878656, -2.692176, 1, 0.9529412, 0, 1,
-1.01665, 0.357156, -0.4332319, 1, 0.9607843, 0, 1,
-1.007533, -0.7753269, -2.489951, 1, 0.9647059, 0, 1,
-1.006448, 0.8942345, 0.3967777, 1, 0.972549, 0, 1,
-1.004409, -0.9167364, -3.123554, 1, 0.9764706, 0, 1,
-1.001505, -0.06106567, -1.927187, 1, 0.9843137, 0, 1,
-0.9879635, -1.781267, -3.780532, 1, 0.9882353, 0, 1,
-0.9832234, -0.6599289, -1.86141, 1, 0.9960784, 0, 1,
-0.982016, -0.5128446, -4.455506, 0.9960784, 1, 0, 1,
-0.981688, 1.49596, -0.5137919, 0.9921569, 1, 0, 1,
-0.9775674, 1.28374, -0.6613382, 0.9843137, 1, 0, 1,
-0.9708369, -0.5900086, -0.6631788, 0.9803922, 1, 0, 1,
-0.9689117, -1.017283, -2.508051, 0.972549, 1, 0, 1,
-0.9668316, -1.549152, -2.16283, 0.9686275, 1, 0, 1,
-0.964829, 0.2611069, -1.946389, 0.9607843, 1, 0, 1,
-0.9578493, 1.106869, -0.1892173, 0.9568627, 1, 0, 1,
-0.9541519, -0.4011812, -2.103107, 0.9490196, 1, 0, 1,
-0.9468162, -0.4453509, -2.029401, 0.945098, 1, 0, 1,
-0.9388171, 0.00025501, -1.299125, 0.9372549, 1, 0, 1,
-0.9282218, 0.7923971, -0.3273834, 0.9333333, 1, 0, 1,
-0.9245668, -1.147526, -3.360221, 0.9254902, 1, 0, 1,
-0.9205173, -0.6219468, -0.9959677, 0.9215686, 1, 0, 1,
-0.9181843, -0.1463006, -1.176043, 0.9137255, 1, 0, 1,
-0.9165387, -1.215673, -1.288805, 0.9098039, 1, 0, 1,
-0.9066337, 0.2805799, -1.067331, 0.9019608, 1, 0, 1,
-0.9060787, -0.6105384, -3.242432, 0.8941177, 1, 0, 1,
-0.9043272, 1.990786, 1.599713, 0.8901961, 1, 0, 1,
-0.8974995, 1.825661, -0.6907937, 0.8823529, 1, 0, 1,
-0.8970768, 0.147853, -2.513581, 0.8784314, 1, 0, 1,
-0.8947025, -1.104989, -1.95806, 0.8705882, 1, 0, 1,
-0.8895486, -0.118006, -2.525349, 0.8666667, 1, 0, 1,
-0.8875283, -1.12646, -2.978527, 0.8588235, 1, 0, 1,
-0.8860921, -1.390948, -3.528189, 0.854902, 1, 0, 1,
-0.8847752, 0.001604974, -0.3977366, 0.8470588, 1, 0, 1,
-0.8830818, -2.672386, -2.184726, 0.8431373, 1, 0, 1,
-0.8809682, 0.124455, -0.7508054, 0.8352941, 1, 0, 1,
-0.8779565, -0.3185779, -3.197016, 0.8313726, 1, 0, 1,
-0.8769409, -0.250574, -2.924169, 0.8235294, 1, 0, 1,
-0.8720844, 0.9183617, -0.4195552, 0.8196079, 1, 0, 1,
-0.8701621, -0.2604767, -2.885868, 0.8117647, 1, 0, 1,
-0.8666369, -0.2462189, -1.948947, 0.8078431, 1, 0, 1,
-0.8598396, -0.4549759, -1.648831, 0.8, 1, 0, 1,
-0.8585675, -0.9583244, -1.76227, 0.7921569, 1, 0, 1,
-0.8579952, 0.2649259, -1.061328, 0.7882353, 1, 0, 1,
-0.8559656, 1.366297, -1.230282, 0.7803922, 1, 0, 1,
-0.8438717, 2.315715, -0.3866005, 0.7764706, 1, 0, 1,
-0.8416328, 2.095358, 1.625484, 0.7686275, 1, 0, 1,
-0.8349781, 1.535213, 0.01249433, 0.7647059, 1, 0, 1,
-0.8337517, -0.7451186, -1.48698, 0.7568628, 1, 0, 1,
-0.8333197, 0.9653276, -0.2548731, 0.7529412, 1, 0, 1,
-0.8328743, 1.653667, 1.055997, 0.7450981, 1, 0, 1,
-0.8294419, 0.4233674, -1.701248, 0.7411765, 1, 0, 1,
-0.8290936, -0.6953228, -3.082127, 0.7333333, 1, 0, 1,
-0.8270719, -0.1912856, -2.276201, 0.7294118, 1, 0, 1,
-0.8263542, 0.004320505, -0.782404, 0.7215686, 1, 0, 1,
-0.8257834, 2.398564, 0.318365, 0.7176471, 1, 0, 1,
-0.8235025, -0.5285777, -3.005601, 0.7098039, 1, 0, 1,
-0.8193224, -1.323137, -1.938277, 0.7058824, 1, 0, 1,
-0.8178782, -0.1887052, -2.228353, 0.6980392, 1, 0, 1,
-0.814822, 0.1184164, -3.03478, 0.6901961, 1, 0, 1,
-0.8096538, -0.3442917, -1.421312, 0.6862745, 1, 0, 1,
-0.8002553, 1.517906, 0.7137782, 0.6784314, 1, 0, 1,
-0.794866, 0.02935049, -1.640101, 0.6745098, 1, 0, 1,
-0.7907903, -0.5309666, -4.380349, 0.6666667, 1, 0, 1,
-0.7906756, -2.145008, -2.287061, 0.6627451, 1, 0, 1,
-0.7874492, 1.726183, -0.2357649, 0.654902, 1, 0, 1,
-0.7854489, 1.462512, -1.664485, 0.6509804, 1, 0, 1,
-0.7813876, 1.159346, 1.360578, 0.6431373, 1, 0, 1,
-0.7799695, -1.719154, -1.042712, 0.6392157, 1, 0, 1,
-0.7788081, -0.8979726, -4.072855, 0.6313726, 1, 0, 1,
-0.7778179, -0.03127867, -1.586871, 0.627451, 1, 0, 1,
-0.7770658, -0.91536, -2.209169, 0.6196079, 1, 0, 1,
-0.7689231, -0.06454672, -1.407113, 0.6156863, 1, 0, 1,
-0.7673196, -0.4308199, -3.083393, 0.6078432, 1, 0, 1,
-0.7646991, 1.100826, -1.472847, 0.6039216, 1, 0, 1,
-0.7603141, 0.07864074, -1.660913, 0.5960785, 1, 0, 1,
-0.7568771, -1.933113, -3.281798, 0.5882353, 1, 0, 1,
-0.7542495, -0.04769849, -0.9321104, 0.5843138, 1, 0, 1,
-0.7492808, 0.6908152, -0.212699, 0.5764706, 1, 0, 1,
-0.7432061, -1.217888, -4.305257, 0.572549, 1, 0, 1,
-0.7402354, 1.460719, -0.2156879, 0.5647059, 1, 0, 1,
-0.7383348, 1.566787, -1.647672, 0.5607843, 1, 0, 1,
-0.7233864, -2.718076, -2.890071, 0.5529412, 1, 0, 1,
-0.7201926, 1.650112, -0.1184128, 0.5490196, 1, 0, 1,
-0.7192399, 2.362339, -0.7235099, 0.5411765, 1, 0, 1,
-0.7156104, -0.5759099, -3.97767, 0.5372549, 1, 0, 1,
-0.7148428, 0.3951332, -0.9173757, 0.5294118, 1, 0, 1,
-0.7140188, 0.05367111, -2.39442, 0.5254902, 1, 0, 1,
-0.7128577, 0.6988878, -1.366077, 0.5176471, 1, 0, 1,
-0.7069212, -0.9372939, -2.803943, 0.5137255, 1, 0, 1,
-0.7053931, -1.763098, -1.10334, 0.5058824, 1, 0, 1,
-0.7006533, -0.9045871, -4.977132, 0.5019608, 1, 0, 1,
-0.699059, 1.063553, -2.286094, 0.4941176, 1, 0, 1,
-0.6988922, -0.8496403, -3.382525, 0.4862745, 1, 0, 1,
-0.6845728, 1.462554, -0.06875932, 0.4823529, 1, 0, 1,
-0.6836205, 0.2582773, -1.325001, 0.4745098, 1, 0, 1,
-0.6835635, 0.5646285, -1.147814, 0.4705882, 1, 0, 1,
-0.6809927, -0.5313246, -3.624305, 0.4627451, 1, 0, 1,
-0.6804013, -0.2040472, -1.106873, 0.4588235, 1, 0, 1,
-0.6798741, -1.284992, -5.383524, 0.4509804, 1, 0, 1,
-0.679236, -0.02541535, -0.09004769, 0.4470588, 1, 0, 1,
-0.6784317, 1.186694, 1.362027, 0.4392157, 1, 0, 1,
-0.6732361, 0.9172686, 1.213532, 0.4352941, 1, 0, 1,
-0.6724513, 1.104978, -1.459965, 0.427451, 1, 0, 1,
-0.6701992, -0.3621695, -3.034425, 0.4235294, 1, 0, 1,
-0.6691948, 0.7849875, -0.2053463, 0.4156863, 1, 0, 1,
-0.6660686, -0.04682004, -1.388713, 0.4117647, 1, 0, 1,
-0.6656082, -0.136671, -0.9151966, 0.4039216, 1, 0, 1,
-0.6626981, -1.495629, -2.393969, 0.3960784, 1, 0, 1,
-0.6607847, -0.1991273, -2.622467, 0.3921569, 1, 0, 1,
-0.6589674, 0.3703566, -2.095682, 0.3843137, 1, 0, 1,
-0.6560627, 0.6071709, -0.5677772, 0.3803922, 1, 0, 1,
-0.6534557, -0.9297118, -2.841677, 0.372549, 1, 0, 1,
-0.6521416, -0.09834892, -2.850972, 0.3686275, 1, 0, 1,
-0.6414261, 2.028975, 1.210528, 0.3607843, 1, 0, 1,
-0.6365114, 0.3603666, -1.919546, 0.3568628, 1, 0, 1,
-0.6349726, 1.420934, -1.498404, 0.3490196, 1, 0, 1,
-0.6299297, 1.671533, 0.1074231, 0.345098, 1, 0, 1,
-0.6285039, -1.287027, -2.069339, 0.3372549, 1, 0, 1,
-0.627899, 0.9956868, -0.1032461, 0.3333333, 1, 0, 1,
-0.6236697, -0.3516377, -2.660973, 0.3254902, 1, 0, 1,
-0.6236054, -2.006315, -1.103889, 0.3215686, 1, 0, 1,
-0.6168776, 0.6965216, -1.132969, 0.3137255, 1, 0, 1,
-0.6149729, 0.7840477, -1.33272, 0.3098039, 1, 0, 1,
-0.6143855, -0.4267063, -2.397856, 0.3019608, 1, 0, 1,
-0.6128625, 0.7468477, 0.1963994, 0.2941177, 1, 0, 1,
-0.6077791, -1.889367, -3.884701, 0.2901961, 1, 0, 1,
-0.6066929, -0.9002938, -2.445361, 0.282353, 1, 0, 1,
-0.6059344, -2.239629, -3.393152, 0.2784314, 1, 0, 1,
-0.5977893, 1.076039, -0.4881555, 0.2705882, 1, 0, 1,
-0.5968727, 1.232607, 0.6227137, 0.2666667, 1, 0, 1,
-0.5962378, 0.01299382, 0.121153, 0.2588235, 1, 0, 1,
-0.5896344, 0.5044876, -0.1620506, 0.254902, 1, 0, 1,
-0.5884219, 0.3665426, 0.3440808, 0.2470588, 1, 0, 1,
-0.5787412, 0.1331667, -1.255185, 0.2431373, 1, 0, 1,
-0.5783935, 0.04290586, -1.898725, 0.2352941, 1, 0, 1,
-0.5724449, -1.533616, -6.332924, 0.2313726, 1, 0, 1,
-0.5722404, -0.7051182, -2.914782, 0.2235294, 1, 0, 1,
-0.5651212, -0.3835986, -2.128546, 0.2196078, 1, 0, 1,
-0.563973, -0.1490762, -3.131022, 0.2117647, 1, 0, 1,
-0.5639267, -0.1088504, -2.151677, 0.2078431, 1, 0, 1,
-0.5632567, 0.947129, 0.753914, 0.2, 1, 0, 1,
-0.5594803, 3.082548, 0.1165576, 0.1921569, 1, 0, 1,
-0.5593484, 0.1830493, 0.03863701, 0.1882353, 1, 0, 1,
-0.5591759, 0.9623138, -0.7878432, 0.1803922, 1, 0, 1,
-0.5573137, -1.209676, -1.180114, 0.1764706, 1, 0, 1,
-0.5545647, -0.453072, -2.221241, 0.1686275, 1, 0, 1,
-0.5528827, -0.385005, -0.7423341, 0.1647059, 1, 0, 1,
-0.5486677, 0.3850045, -0.6597816, 0.1568628, 1, 0, 1,
-0.5469863, -0.6671081, -2.50935, 0.1529412, 1, 0, 1,
-0.5468207, 0.750427, 1.601766, 0.145098, 1, 0, 1,
-0.5459048, 0.5626748, -1.561815, 0.1411765, 1, 0, 1,
-0.5447347, -0.8688533, -2.349357, 0.1333333, 1, 0, 1,
-0.5325226, 0.8769839, -0.4360328, 0.1294118, 1, 0, 1,
-0.5261248, 0.2767918, 1.412245, 0.1215686, 1, 0, 1,
-0.5221038, -0.9025465, -3.42589, 0.1176471, 1, 0, 1,
-0.5211681, -1.941177, -4.391935, 0.1098039, 1, 0, 1,
-0.5206462, -0.2874417, -2.512633, 0.1058824, 1, 0, 1,
-0.5206025, -0.4816092, -1.59476, 0.09803922, 1, 0, 1,
-0.518359, -1.425969, -4.896425, 0.09019608, 1, 0, 1,
-0.5177915, -0.696732, -2.980024, 0.08627451, 1, 0, 1,
-0.5176325, 1.646999, -0.02130449, 0.07843138, 1, 0, 1,
-0.5175107, 0.0452199, -1.437525, 0.07450981, 1, 0, 1,
-0.5121707, -1.108058, -4.050144, 0.06666667, 1, 0, 1,
-0.5119846, 0.1857776, -0.1531176, 0.0627451, 1, 0, 1,
-0.5068524, -0.5392686, -1.364335, 0.05490196, 1, 0, 1,
-0.500639, -0.5226859, -3.333822, 0.05098039, 1, 0, 1,
-0.4992898, 0.745001, 0.2341515, 0.04313726, 1, 0, 1,
-0.4992569, 1.222515, 0.5532862, 0.03921569, 1, 0, 1,
-0.4991982, -0.5499324, -3.199269, 0.03137255, 1, 0, 1,
-0.4987941, 2.335686, -0.3912431, 0.02745098, 1, 0, 1,
-0.4976564, -0.899002, -4.172247, 0.01960784, 1, 0, 1,
-0.4975335, -0.6895501, -1.948278, 0.01568628, 1, 0, 1,
-0.4955213, -1.334554, -4.172496, 0.007843138, 1, 0, 1,
-0.4933124, -1.417729, -2.673255, 0.003921569, 1, 0, 1,
-0.489818, -0.5795675, -1.743284, 0, 1, 0.003921569, 1,
-0.4705923, 1.183219, 0.7385939, 0, 1, 0.01176471, 1,
-0.4649106, 0.4612508, -2.097194, 0, 1, 0.01568628, 1,
-0.4635375, 1.526626, -0.3420935, 0, 1, 0.02352941, 1,
-0.456343, 1.414679, 1.224732, 0, 1, 0.02745098, 1,
-0.4526575, 0.1115043, 0.9559983, 0, 1, 0.03529412, 1,
-0.4521769, 0.1645387, -0.7467666, 0, 1, 0.03921569, 1,
-0.4480337, 0.05637022, -1.153284, 0, 1, 0.04705882, 1,
-0.4410649, 0.5929552, -0.2633369, 0, 1, 0.05098039, 1,
-0.4404227, -2.035696, -1.088181, 0, 1, 0.05882353, 1,
-0.4357623, -0.05552943, -2.226994, 0, 1, 0.0627451, 1,
-0.4326166, 1.196609, -0.1743239, 0, 1, 0.07058824, 1,
-0.4315814, -1.461088, -4.170029, 0, 1, 0.07450981, 1,
-0.4283467, 2.343796, -0.30437, 0, 1, 0.08235294, 1,
-0.4199635, -0.3582434, -1.732135, 0, 1, 0.08627451, 1,
-0.4181917, -0.0857001, -1.603627, 0, 1, 0.09411765, 1,
-0.4119702, 0.6482694, 1.214372, 0, 1, 0.1019608, 1,
-0.4064222, -1.008592, -2.891833, 0, 1, 0.1058824, 1,
-0.4053901, -0.5484552, -3.165483, 0, 1, 0.1137255, 1,
-0.4043038, 0.3932524, -1.996457, 0, 1, 0.1176471, 1,
-0.4038704, 1.57543, -0.7576796, 0, 1, 0.1254902, 1,
-0.4023379, -2.768402, -3.446288, 0, 1, 0.1294118, 1,
-0.3973048, -0.4318601, -3.277581, 0, 1, 0.1372549, 1,
-0.3964927, 0.380907, -0.6283109, 0, 1, 0.1411765, 1,
-0.3721808, -0.5496143, -3.428997, 0, 1, 0.1490196, 1,
-0.3674642, -1.319374, -3.621258, 0, 1, 0.1529412, 1,
-0.3667099, 0.7451357, -1.724352, 0, 1, 0.1607843, 1,
-0.3651266, 0.261658, -1.201865, 0, 1, 0.1647059, 1,
-0.3623816, -0.422524, -1.900331, 0, 1, 0.172549, 1,
-0.3565267, 0.943088, -0.2339517, 0, 1, 0.1764706, 1,
-0.3539061, 0.9775286, -1.533557, 0, 1, 0.1843137, 1,
-0.351513, -1.132062, -3.225347, 0, 1, 0.1882353, 1,
-0.348245, -0.2346937, -1.123469, 0, 1, 0.1960784, 1,
-0.3465282, 0.8507529, 0.3379469, 0, 1, 0.2039216, 1,
-0.3448092, -1.321144, -2.648944, 0, 1, 0.2078431, 1,
-0.3315006, -0.599236, -1.827504, 0, 1, 0.2156863, 1,
-0.326849, -0.4872749, -3.379201, 0, 1, 0.2196078, 1,
-0.3233486, -1.370733, -3.179564, 0, 1, 0.227451, 1,
-0.3215905, -1.960086, -4.442101, 0, 1, 0.2313726, 1,
-0.3197965, 0.5395182, -0.6668286, 0, 1, 0.2392157, 1,
-0.3191106, 0.7559322, -2.618485, 0, 1, 0.2431373, 1,
-0.3184802, -0.6017392, -3.101147, 0, 1, 0.2509804, 1,
-0.3171112, 1.465696, -1.043206, 0, 1, 0.254902, 1,
-0.3132164, -0.5767839, -3.427097, 0, 1, 0.2627451, 1,
-0.3125407, 1.407888, -0.7985144, 0, 1, 0.2666667, 1,
-0.3109361, -1.47896, -1.123361, 0, 1, 0.2745098, 1,
-0.3099861, 0.4459006, -0.692798, 0, 1, 0.2784314, 1,
-0.3048375, -0.2921605, -2.81124, 0, 1, 0.2862745, 1,
-0.304146, 1.041982, -0.5884312, 0, 1, 0.2901961, 1,
-0.2962538, 1.193168, -1.480973, 0, 1, 0.2980392, 1,
-0.2951086, 1.336744, 0.2916859, 0, 1, 0.3058824, 1,
-0.2946617, -0.2143483, -4.001228, 0, 1, 0.3098039, 1,
-0.2931273, 1.437163, -1.306898, 0, 1, 0.3176471, 1,
-0.2918295, -1.979255, -1.403514, 0, 1, 0.3215686, 1,
-0.2890174, 1.212036, 1.310519, 0, 1, 0.3294118, 1,
-0.2832596, 0.3393669, -0.6130237, 0, 1, 0.3333333, 1,
-0.2811283, 1.228569, -0.704075, 0, 1, 0.3411765, 1,
-0.2789507, -0.2374393, -2.718646, 0, 1, 0.345098, 1,
-0.2748952, 0.6799365, -0.04775476, 0, 1, 0.3529412, 1,
-0.2713942, -1.040671, -2.061227, 0, 1, 0.3568628, 1,
-0.2691515, 0.1613019, -1.671077, 0, 1, 0.3647059, 1,
-0.2638426, 0.8679002, 1.025404, 0, 1, 0.3686275, 1,
-0.2635267, -0.05833804, -1.932197, 0, 1, 0.3764706, 1,
-0.2633628, 0.479337, -0.3853011, 0, 1, 0.3803922, 1,
-0.2627518, 0.7904977, 0.4644563, 0, 1, 0.3882353, 1,
-0.2585918, 0.2381436, -1.185639, 0, 1, 0.3921569, 1,
-0.2545096, 2.054779, 0.3641239, 0, 1, 0.4, 1,
-0.2498382, 0.3782005, -0.7961574, 0, 1, 0.4078431, 1,
-0.2477374, -1.750915, -2.952567, 0, 1, 0.4117647, 1,
-0.2431862, -0.1264389, -2.46229, 0, 1, 0.4196078, 1,
-0.2412346, 0.6177043, -0.3823425, 0, 1, 0.4235294, 1,
-0.2411189, -2.476439, -2.580116, 0, 1, 0.4313726, 1,
-0.2397062, -1.598726, -1.691461, 0, 1, 0.4352941, 1,
-0.2383038, 1.185295, -1.379971, 0, 1, 0.4431373, 1,
-0.2354647, 1.367146, 1.070566, 0, 1, 0.4470588, 1,
-0.2328183, 0.8923275, 0.1625823, 0, 1, 0.454902, 1,
-0.2326867, 1.092724, -1.978395, 0, 1, 0.4588235, 1,
-0.2320892, 0.3091139, 0.9237265, 0, 1, 0.4666667, 1,
-0.2292155, 0.1955616, -0.1574142, 0, 1, 0.4705882, 1,
-0.2275719, -0.1110284, -1.815557, 0, 1, 0.4784314, 1,
-0.2268274, 0.6221299, -1.391482, 0, 1, 0.4823529, 1,
-0.221572, 0.7080696, 0.2327405, 0, 1, 0.4901961, 1,
-0.2200749, 0.7438249, 0.4900321, 0, 1, 0.4941176, 1,
-0.2151916, -1.147658, -3.754779, 0, 1, 0.5019608, 1,
-0.2111046, 0.3593122, -0.2424038, 0, 1, 0.509804, 1,
-0.2101746, 0.4894503, 0.4949584, 0, 1, 0.5137255, 1,
-0.2059374, 0.2457079, -0.6037257, 0, 1, 0.5215687, 1,
-0.2034965, -0.5015018, -1.212094, 0, 1, 0.5254902, 1,
-0.2027515, -0.3961724, -3.866514, 0, 1, 0.5333334, 1,
-0.2017656, 0.5570322, -1.660209, 0, 1, 0.5372549, 1,
-0.1990687, -0.03262959, -0.6830705, 0, 1, 0.5450981, 1,
-0.1985671, -0.231421, -3.865146, 0, 1, 0.5490196, 1,
-0.1965171, -1.429927, -4.638214, 0, 1, 0.5568628, 1,
-0.1935554, 0.8477356, -0.5389125, 0, 1, 0.5607843, 1,
-0.1926528, -0.1575739, -1.18313, 0, 1, 0.5686275, 1,
-0.1921394, 0.1866418, -0.7793617, 0, 1, 0.572549, 1,
-0.1912332, -0.1450843, -0.2971404, 0, 1, 0.5803922, 1,
-0.1904218, 0.8835275, 0.3596568, 0, 1, 0.5843138, 1,
-0.1865472, 0.8843664, -0.1491239, 0, 1, 0.5921569, 1,
-0.1829417, 0.29378, -0.4117735, 0, 1, 0.5960785, 1,
-0.1791893, 1.87481, -0.7116201, 0, 1, 0.6039216, 1,
-0.1771052, -0.1153303, -2.643483, 0, 1, 0.6117647, 1,
-0.1763766, -0.5553904, -1.152428, 0, 1, 0.6156863, 1,
-0.1763756, 0.8361269, -1.111263, 0, 1, 0.6235294, 1,
-0.1737702, 0.1925807, -0.06983586, 0, 1, 0.627451, 1,
-0.1711008, -0.6251853, -2.724474, 0, 1, 0.6352941, 1,
-0.1697325, -0.5518895, -2.058507, 0, 1, 0.6392157, 1,
-0.1695829, -1.90832, -1.983157, 0, 1, 0.6470588, 1,
-0.1669873, -1.243089, -1.76159, 0, 1, 0.6509804, 1,
-0.164706, 1.410793, -0.5317035, 0, 1, 0.6588235, 1,
-0.1614232, -2.283418, -2.662554, 0, 1, 0.6627451, 1,
-0.1590334, 0.5237639, -1.102305, 0, 1, 0.6705883, 1,
-0.1574598, 1.447962, 0.8344184, 0, 1, 0.6745098, 1,
-0.1570403, -0.3322375, -2.049477, 0, 1, 0.682353, 1,
-0.1515157, -0.467568, -2.078433, 0, 1, 0.6862745, 1,
-0.1505784, 0.5367758, 0.2616327, 0, 1, 0.6941177, 1,
-0.1503788, -1.281905, -3.245158, 0, 1, 0.7019608, 1,
-0.1493816, -1.591733, -2.103553, 0, 1, 0.7058824, 1,
-0.1366141, -0.2587511, -3.048906, 0, 1, 0.7137255, 1,
-0.1346347, 0.5525213, 1.884195, 0, 1, 0.7176471, 1,
-0.1330331, 0.9156466, -0.6154638, 0, 1, 0.7254902, 1,
-0.132841, -0.2202777, -1.981291, 0, 1, 0.7294118, 1,
-0.1319993, -1.935319, -3.449673, 0, 1, 0.7372549, 1,
-0.1310494, -1.750739, -4.009976, 0, 1, 0.7411765, 1,
-0.1297027, -0.3166391, -4.467927, 0, 1, 0.7490196, 1,
-0.1293374, -1.06348, -3.155488, 0, 1, 0.7529412, 1,
-0.1271151, -0.7723343, -3.326305, 0, 1, 0.7607843, 1,
-0.1193583, -1.035008, -2.501801, 0, 1, 0.7647059, 1,
-0.1188711, 1.317845, -1.243696, 0, 1, 0.772549, 1,
-0.1132596, -0.4882007, -1.346005, 0, 1, 0.7764706, 1,
-0.1106168, 1.530366, 0.1642146, 0, 1, 0.7843137, 1,
-0.1083632, -0.6323021, -3.363484, 0, 1, 0.7882353, 1,
-0.1048918, 1.353404, -1.974725, 0, 1, 0.7960784, 1,
-0.1048073, 1.529959, 2.068966, 0, 1, 0.8039216, 1,
-0.1046465, -0.9613994, -3.309728, 0, 1, 0.8078431, 1,
-0.1030414, -0.1074358, -3.644315, 0, 1, 0.8156863, 1,
-0.1023148, -0.3365389, -3.117822, 0, 1, 0.8196079, 1,
-0.1010398, 0.2742286, -0.7318641, 0, 1, 0.827451, 1,
-0.09794765, -1.128884, -2.251937, 0, 1, 0.8313726, 1,
-0.09746139, -0.1653419, -1.742112, 0, 1, 0.8392157, 1,
-0.09709201, 0.628351, -1.039779, 0, 1, 0.8431373, 1,
-0.0914003, -1.931698, -1.582254, 0, 1, 0.8509804, 1,
-0.0892037, 0.09453503, -0.9552342, 0, 1, 0.854902, 1,
-0.08845539, -1.003226, -3.228103, 0, 1, 0.8627451, 1,
-0.0794703, -0.6907049, -3.914342, 0, 1, 0.8666667, 1,
-0.07828458, -0.2526126, -2.916244, 0, 1, 0.8745098, 1,
-0.07604137, -0.8647462, -4.238929, 0, 1, 0.8784314, 1,
-0.07554989, 1.154437, -1.073838, 0, 1, 0.8862745, 1,
-0.0754564, -1.759145, -2.216773, 0, 1, 0.8901961, 1,
-0.07348114, 0.4959645, -0.9310625, 0, 1, 0.8980392, 1,
-0.07261264, 1.464216, -0.005029457, 0, 1, 0.9058824, 1,
-0.07090659, -1.607487, -3.456568, 0, 1, 0.9098039, 1,
-0.06922454, 0.9564994, -1.502657, 0, 1, 0.9176471, 1,
-0.06824677, 2.354153, -0.6528918, 0, 1, 0.9215686, 1,
-0.06403139, -1.72863, -3.076668, 0, 1, 0.9294118, 1,
-0.05936201, -1.056808, -2.047498, 0, 1, 0.9333333, 1,
-0.0533395, -0.1434354, -2.493236, 0, 1, 0.9411765, 1,
-0.05310379, 2.574797, 0.5987638, 0, 1, 0.945098, 1,
-0.0460736, 0.322531, -1.942465, 0, 1, 0.9529412, 1,
-0.04050182, 0.7813618, -0.7579803, 0, 1, 0.9568627, 1,
-0.038073, -1.313896, -3.064952, 0, 1, 0.9647059, 1,
-0.0266919, 0.1217699, 0.3036452, 0, 1, 0.9686275, 1,
-0.02650439, -1.218199, -3.515102, 0, 1, 0.9764706, 1,
-0.02358204, -0.4189775, -4.177691, 0, 1, 0.9803922, 1,
-0.0229975, -1.606082, -1.699012, 0, 1, 0.9882353, 1,
-0.02293608, 0.44449, 0.5186962, 0, 1, 0.9921569, 1,
-0.01525158, 0.5375715, 1.406487, 0, 1, 1, 1,
-0.01242172, 0.2535798, 0.6240142, 0, 0.9921569, 1, 1,
-0.01109674, -2.448682, -2.75018, 0, 0.9882353, 1, 1,
-0.008065666, -0.3856734, -1.988011, 0, 0.9803922, 1, 1,
-0.006065786, 0.3361129, 2.07419, 0, 0.9764706, 1, 1,
-0.005711447, -2.268582, -3.431858, 0, 0.9686275, 1, 1,
-0.000303985, 0.9141791, -0.955503, 0, 0.9647059, 1, 1,
0.0003314213, -0.043713, 4.683744, 0, 0.9568627, 1, 1,
0.004246775, -0.4405639, 4.261985, 0, 0.9529412, 1, 1,
0.006134134, 0.2654899, 0.2919871, 0, 0.945098, 1, 1,
0.007173498, 0.4508265, -0.6599666, 0, 0.9411765, 1, 1,
0.008601153, 1.014796, 0.2631161, 0, 0.9333333, 1, 1,
0.008790603, 0.6663641, 0.2495761, 0, 0.9294118, 1, 1,
0.009285472, -0.4289526, 4.129137, 0, 0.9215686, 1, 1,
0.009462805, -1.988792, 1.938596, 0, 0.9176471, 1, 1,
0.01136296, 0.07400927, -0.2315156, 0, 0.9098039, 1, 1,
0.01183317, 0.797126, 1.402548, 0, 0.9058824, 1, 1,
0.0139291, 0.1969722, -1.877504, 0, 0.8980392, 1, 1,
0.01553914, -1.67003, 3.798392, 0, 0.8901961, 1, 1,
0.01818046, -1.456744, 2.2093, 0, 0.8862745, 1, 1,
0.02400058, 1.29009, -0.756302, 0, 0.8784314, 1, 1,
0.02545768, 0.852745, -1.731063, 0, 0.8745098, 1, 1,
0.02557022, -0.6563126, 1.240324, 0, 0.8666667, 1, 1,
0.02657343, -0.8356593, 2.401709, 0, 0.8627451, 1, 1,
0.03011636, 1.992009, 0.8601425, 0, 0.854902, 1, 1,
0.03592306, -0.3500118, 4.141798, 0, 0.8509804, 1, 1,
0.04035141, -0.4472013, 4.396218, 0, 0.8431373, 1, 1,
0.04178837, -1.208501, 2.446933, 0, 0.8392157, 1, 1,
0.04186274, 0.03434931, 0.43094, 0, 0.8313726, 1, 1,
0.04539839, 1.220611, 0.5871381, 0, 0.827451, 1, 1,
0.04830579, -0.4881211, 3.018992, 0, 0.8196079, 1, 1,
0.05069938, 0.1996278, -0.2543522, 0, 0.8156863, 1, 1,
0.05203409, 0.7604272, 0.2821928, 0, 0.8078431, 1, 1,
0.05371163, -2.180228, 3.443838, 0, 0.8039216, 1, 1,
0.06224051, -1.481507, 4.611645, 0, 0.7960784, 1, 1,
0.06263581, 1.49172, 0.7120449, 0, 0.7882353, 1, 1,
0.06940641, -1.407633, 4.082522, 0, 0.7843137, 1, 1,
0.07332004, 0.6807489, 0.7856268, 0, 0.7764706, 1, 1,
0.0735801, 0.7510915, -1.719354, 0, 0.772549, 1, 1,
0.07736181, -0.1836515, 1.466195, 0, 0.7647059, 1, 1,
0.07770632, 1.604232, 2.241956, 0, 0.7607843, 1, 1,
0.08147223, -0.01839524, 1.762556, 0, 0.7529412, 1, 1,
0.08434156, 0.248105, -0.396378, 0, 0.7490196, 1, 1,
0.08519194, -0.9319084, 3.37236, 0, 0.7411765, 1, 1,
0.0906928, 0.8937863, 0.443791, 0, 0.7372549, 1, 1,
0.09154828, 0.5941889, 0.7394123, 0, 0.7294118, 1, 1,
0.09277243, -0.5419192, 3.445339, 0, 0.7254902, 1, 1,
0.09675159, 0.8138512, -0.06009677, 0, 0.7176471, 1, 1,
0.09862512, 0.1164945, 1.041904, 0, 0.7137255, 1, 1,
0.1055649, 1.372318, 0.2733032, 0, 0.7058824, 1, 1,
0.1057828, 0.3497652, -2.077107, 0, 0.6980392, 1, 1,
0.105944, -0.3596673, 3.358628, 0, 0.6941177, 1, 1,
0.1115778, 1.117363, -0.5350115, 0, 0.6862745, 1, 1,
0.1164236, -0.02224886, 2.636041, 0, 0.682353, 1, 1,
0.1181733, 0.8437101, 0.08442724, 0, 0.6745098, 1, 1,
0.1259505, -0.86027, 2.787537, 0, 0.6705883, 1, 1,
0.1308357, -0.2359648, 2.101071, 0, 0.6627451, 1, 1,
0.1333024, 0.2603438, -2.625193, 0, 0.6588235, 1, 1,
0.1380043, 1.301073, 0.2954936, 0, 0.6509804, 1, 1,
0.1412655, 0.750785, 1.104015, 0, 0.6470588, 1, 1,
0.1478255, 0.9303665, 0.7970719, 0, 0.6392157, 1, 1,
0.1507661, -0.07603292, 2.254793, 0, 0.6352941, 1, 1,
0.1510319, 0.4003577, -1.033243, 0, 0.627451, 1, 1,
0.1520382, -1.274499, 2.636122, 0, 0.6235294, 1, 1,
0.1526208, 0.8721235, -1.037721, 0, 0.6156863, 1, 1,
0.1529837, -1.341401, 2.477267, 0, 0.6117647, 1, 1,
0.1531318, -0.9846291, 2.477992, 0, 0.6039216, 1, 1,
0.1535787, 0.9386265, -1.555317, 0, 0.5960785, 1, 1,
0.156065, 1.102089, 0.6659613, 0, 0.5921569, 1, 1,
0.1604872, -0.7169783, 1.420881, 0, 0.5843138, 1, 1,
0.1613911, -0.2581839, 4.061428, 0, 0.5803922, 1, 1,
0.1614578, 0.5300879, 1.755589, 0, 0.572549, 1, 1,
0.1655199, -0.131269, 2.71672, 0, 0.5686275, 1, 1,
0.1694936, 2.099362, 0.3558174, 0, 0.5607843, 1, 1,
0.1707359, -0.02742971, 2.899401, 0, 0.5568628, 1, 1,
0.1710055, 1.435031, -0.3737531, 0, 0.5490196, 1, 1,
0.1719367, 0.9973352, -0.6992424, 0, 0.5450981, 1, 1,
0.1731716, 1.574179, 0.0715436, 0, 0.5372549, 1, 1,
0.1743466, 1.534507, 0.145373, 0, 0.5333334, 1, 1,
0.1770622, -0.2705006, 0.9171133, 0, 0.5254902, 1, 1,
0.1808287, -0.9215956, 2.084724, 0, 0.5215687, 1, 1,
0.1827158, 0.3758495, 0.9215001, 0, 0.5137255, 1, 1,
0.1856138, -0.2300043, 2.600114, 0, 0.509804, 1, 1,
0.1882184, 0.4360676, 0.3784136, 0, 0.5019608, 1, 1,
0.1903481, 0.7293928, -0.6225915, 0, 0.4941176, 1, 1,
0.1929462, -0.4237015, 2.846584, 0, 0.4901961, 1, 1,
0.1964579, 0.4221188, 1.285266, 0, 0.4823529, 1, 1,
0.1971746, 0.4383908, -0.3387759, 0, 0.4784314, 1, 1,
0.1982746, -0.4006402, 4.103998, 0, 0.4705882, 1, 1,
0.1987445, 0.8490191, 1.962231, 0, 0.4666667, 1, 1,
0.2006407, -1.411444, 2.377375, 0, 0.4588235, 1, 1,
0.201434, -1.055894, 3.484604, 0, 0.454902, 1, 1,
0.2018466, -2.861212, 2.893806, 0, 0.4470588, 1, 1,
0.2028168, -1.594285, 2.800293, 0, 0.4431373, 1, 1,
0.2052059, -0.3857456, 3.965387, 0, 0.4352941, 1, 1,
0.2058154, 0.6224036, 0.9002321, 0, 0.4313726, 1, 1,
0.2068095, 0.3853883, 0.7852401, 0, 0.4235294, 1, 1,
0.2072477, 0.07056087, 2.664294, 0, 0.4196078, 1, 1,
0.2094688, -0.5250321, 2.400468, 0, 0.4117647, 1, 1,
0.2097997, 1.681848, 0.2373237, 0, 0.4078431, 1, 1,
0.2124602, -0.4346943, 2.888533, 0, 0.4, 1, 1,
0.2154169, 0.6045135, -0.3108178, 0, 0.3921569, 1, 1,
0.2215905, -1.352207, 2.325566, 0, 0.3882353, 1, 1,
0.2229984, -0.6933175, 1.042427, 0, 0.3803922, 1, 1,
0.2246908, -0.7855952, 2.348231, 0, 0.3764706, 1, 1,
0.2248462, -0.4963345, 2.59391, 0, 0.3686275, 1, 1,
0.2261252, -1.587895, 2.541821, 0, 0.3647059, 1, 1,
0.2292296, 0.4518881, 1.184861, 0, 0.3568628, 1, 1,
0.2301255, -0.3985648, 4.221671, 0, 0.3529412, 1, 1,
0.2305675, -1.452176, 4.090055, 0, 0.345098, 1, 1,
0.2310327, 0.4122089, 0.6222941, 0, 0.3411765, 1, 1,
0.2332766, 0.4735999, -0.6756577, 0, 0.3333333, 1, 1,
0.2362964, 1.344947, 2.604067, 0, 0.3294118, 1, 1,
0.236874, 1.152498, 1.305119, 0, 0.3215686, 1, 1,
0.2456457, -0.5815855, 2.126487, 0, 0.3176471, 1, 1,
0.2468232, -2.415518, 6.20571, 0, 0.3098039, 1, 1,
0.2471262, -0.9857407, 1.763245, 0, 0.3058824, 1, 1,
0.2477497, -1.286856, 0.5162914, 0, 0.2980392, 1, 1,
0.2488884, 0.8352359, 0.5354301, 0, 0.2901961, 1, 1,
0.2501605, 1.173198, 0.6380993, 0, 0.2862745, 1, 1,
0.2557089, -0.7413183, 3.115345, 0, 0.2784314, 1, 1,
0.2563579, -0.9235457, 2.483635, 0, 0.2745098, 1, 1,
0.2566444, 0.4448342, 0.1384041, 0, 0.2666667, 1, 1,
0.2604185, 0.8824518, -0.7150463, 0, 0.2627451, 1, 1,
0.2605492, -0.8246347, 1.422701, 0, 0.254902, 1, 1,
0.2674538, -0.02307257, 2.467777, 0, 0.2509804, 1, 1,
0.2691492, 1.573552, 1.355899, 0, 0.2431373, 1, 1,
0.273708, -1.837871, 4.249424, 0, 0.2392157, 1, 1,
0.2759001, -0.4245996, 4.201001, 0, 0.2313726, 1, 1,
0.2784194, 0.3023624, 0.8426085, 0, 0.227451, 1, 1,
0.2890236, 0.1402902, 1.052979, 0, 0.2196078, 1, 1,
0.2918454, -1.074008, 3.421835, 0, 0.2156863, 1, 1,
0.2942218, 0.2735635, -0.818581, 0, 0.2078431, 1, 1,
0.2980942, 0.7538294, -0.1080561, 0, 0.2039216, 1, 1,
0.2983102, 0.724916, -0.3890247, 0, 0.1960784, 1, 1,
0.3000052, -1.289353, 3.252046, 0, 0.1882353, 1, 1,
0.3008298, 0.236147, 1.167019, 0, 0.1843137, 1, 1,
0.3048094, 0.414965, 0.7842238, 0, 0.1764706, 1, 1,
0.312221, -1.388637, 1.337022, 0, 0.172549, 1, 1,
0.3210294, 0.3523909, 0.05416223, 0, 0.1647059, 1, 1,
0.3217762, -2.095266, 2.825961, 0, 0.1607843, 1, 1,
0.3241748, -1.036313, 3.717136, 0, 0.1529412, 1, 1,
0.3280304, 1.704683, 1.885671, 0, 0.1490196, 1, 1,
0.3293836, -0.4273082, 1.008834, 0, 0.1411765, 1, 1,
0.334154, 1.021265, 1.789108, 0, 0.1372549, 1, 1,
0.3376253, 0.06083728, 0.2135563, 0, 0.1294118, 1, 1,
0.3484592, 1.319425, -1.068747, 0, 0.1254902, 1, 1,
0.3498596, 2.213602, 1.057996, 0, 0.1176471, 1, 1,
0.3515833, 0.9578737, 1.224427, 0, 0.1137255, 1, 1,
0.3557029, -0.756181, 0.4331753, 0, 0.1058824, 1, 1,
0.355728, 0.7606567, 0.708206, 0, 0.09803922, 1, 1,
0.3575422, 0.9597312, -1.060039, 0, 0.09411765, 1, 1,
0.3617893, 0.1606786, 1.249018, 0, 0.08627451, 1, 1,
0.3621176, 0.5345674, -0.3750394, 0, 0.08235294, 1, 1,
0.3663316, -1.531957, 3.156136, 0, 0.07450981, 1, 1,
0.3699198, -0.2247512, 0.899305, 0, 0.07058824, 1, 1,
0.3703546, 0.18217, 0.1655808, 0, 0.0627451, 1, 1,
0.3762228, 1.36391, -0.04494652, 0, 0.05882353, 1, 1,
0.3838606, 0.6551995, 0.7990326, 0, 0.05098039, 1, 1,
0.384773, 1.464622, 0.03604221, 0, 0.04705882, 1, 1,
0.3856224, 0.02022867, 1.510203, 0, 0.03921569, 1, 1,
0.3865868, -0.2122, 2.186552, 0, 0.03529412, 1, 1,
0.3874088, -0.5477246, 2.71727, 0, 0.02745098, 1, 1,
0.3913241, -2.368225, 3.336034, 0, 0.02352941, 1, 1,
0.3936323, -0.4142951, 3.106657, 0, 0.01568628, 1, 1,
0.3964148, 0.1202877, 0.5462841, 0, 0.01176471, 1, 1,
0.4001325, 0.886089, 0.8654142, 0, 0.003921569, 1, 1,
0.4057992, 0.820879, 0.05461825, 0.003921569, 0, 1, 1,
0.4067475, 0.890089, 1.956184, 0.007843138, 0, 1, 1,
0.4081175, -0.9692162, 1.747467, 0.01568628, 0, 1, 1,
0.4086597, 0.2910947, 0.9728439, 0.01960784, 0, 1, 1,
0.4197435, 1.365695, -0.06047799, 0.02745098, 0, 1, 1,
0.4222897, -0.7725663, 2.046423, 0.03137255, 0, 1, 1,
0.4231465, 0.9728792, -0.86006, 0.03921569, 0, 1, 1,
0.427671, -0.7905624, 1.625697, 0.04313726, 0, 1, 1,
0.4281133, -0.3603208, 2.819269, 0.05098039, 0, 1, 1,
0.4309333, 0.8264233, -0.08917218, 0.05490196, 0, 1, 1,
0.4373383, -0.8970159, 4.020305, 0.0627451, 0, 1, 1,
0.4450804, -1.336814, 3.880031, 0.06666667, 0, 1, 1,
0.4463252, -0.8085754, 2.804041, 0.07450981, 0, 1, 1,
0.4548663, -1.143525, 2.291449, 0.07843138, 0, 1, 1,
0.4556194, 0.4260688, 1.262115, 0.08627451, 0, 1, 1,
0.4562873, -1.303465, 2.08348, 0.09019608, 0, 1, 1,
0.459671, 0.1085692, 0.8809934, 0.09803922, 0, 1, 1,
0.4640113, -0.4835309, 1.031891, 0.1058824, 0, 1, 1,
0.4659685, 1.327288, 1.388444, 0.1098039, 0, 1, 1,
0.4667921, 0.6392436, 1.608685, 0.1176471, 0, 1, 1,
0.4668751, 1.467536, 0.4463442, 0.1215686, 0, 1, 1,
0.472535, 0.0579896, 0.7229378, 0.1294118, 0, 1, 1,
0.4777061, -0.7348985, 2.148746, 0.1333333, 0, 1, 1,
0.4828207, 0.2500212, 0.360707, 0.1411765, 0, 1, 1,
0.4829862, 0.124315, 1.701306, 0.145098, 0, 1, 1,
0.4842268, 0.6078472, -0.17386, 0.1529412, 0, 1, 1,
0.4846144, -1.511332, 3.646609, 0.1568628, 0, 1, 1,
0.4850989, 1.477087, -0.5212489, 0.1647059, 0, 1, 1,
0.4859491, -0.9473899, 3.059577, 0.1686275, 0, 1, 1,
0.4860833, -0.2257241, 2.937335, 0.1764706, 0, 1, 1,
0.489952, 0.9777983, 0.5033051, 0.1803922, 0, 1, 1,
0.4900838, 0.6165591, 1.042129, 0.1882353, 0, 1, 1,
0.4953257, 0.9674569, 0.6515713, 0.1921569, 0, 1, 1,
0.4963746, 0.6005502, 1.095702, 0.2, 0, 1, 1,
0.5058394, -1.228063, 3.488058, 0.2078431, 0, 1, 1,
0.5095365, -0.8777246, 4.729558, 0.2117647, 0, 1, 1,
0.514094, -0.7172874, 2.069171, 0.2196078, 0, 1, 1,
0.5173205, -0.5339822, 1.431264, 0.2235294, 0, 1, 1,
0.5220414, 0.5437072, -0.1361862, 0.2313726, 0, 1, 1,
0.5220714, -0.5540504, 2.191869, 0.2352941, 0, 1, 1,
0.5235757, -0.353527, 1.295394, 0.2431373, 0, 1, 1,
0.5249484, -0.9275684, 0.3254025, 0.2470588, 0, 1, 1,
0.5261655, -0.3099271, 1.172794, 0.254902, 0, 1, 1,
0.5265959, -1.409817, 3.537362, 0.2588235, 0, 1, 1,
0.5276662, 0.634726, 0.9894199, 0.2666667, 0, 1, 1,
0.5298349, -0.2393971, 1.919987, 0.2705882, 0, 1, 1,
0.5315617, 0.4852383, -1.328382, 0.2784314, 0, 1, 1,
0.5323381, -0.1727265, 1.396188, 0.282353, 0, 1, 1,
0.5343008, 0.821414, 0.8973572, 0.2901961, 0, 1, 1,
0.5358409, -0.2852746, 1.83437, 0.2941177, 0, 1, 1,
0.5409603, 0.05182835, -0.5594215, 0.3019608, 0, 1, 1,
0.5418873, 0.2012805, -0.8408465, 0.3098039, 0, 1, 1,
0.542977, 0.9905553, 0.08536863, 0.3137255, 0, 1, 1,
0.5430766, 0.1883839, 0.6194028, 0.3215686, 0, 1, 1,
0.548093, -0.3634904, 2.098, 0.3254902, 0, 1, 1,
0.5625132, -1.507127, 4.702402, 0.3333333, 0, 1, 1,
0.5667282, 0.03351637, 1.59645, 0.3372549, 0, 1, 1,
0.5711257, -1.317018, 3.742715, 0.345098, 0, 1, 1,
0.5718788, -0.533426, 2.892043, 0.3490196, 0, 1, 1,
0.5719669, 0.8313971, -0.5476152, 0.3568628, 0, 1, 1,
0.576896, 0.5063793, 1.175207, 0.3607843, 0, 1, 1,
0.5781087, 0.5776889, 1.607654, 0.3686275, 0, 1, 1,
0.5795755, -0.2754404, 2.629916, 0.372549, 0, 1, 1,
0.5882797, -0.3375663, 2.766274, 0.3803922, 0, 1, 1,
0.5893007, 0.04528602, 1.551321, 0.3843137, 0, 1, 1,
0.5980996, 3.122318, -0.7777702, 0.3921569, 0, 1, 1,
0.5983942, 0.1503438, -0.2727316, 0.3960784, 0, 1, 1,
0.6002208, 0.8190767, -0.3622797, 0.4039216, 0, 1, 1,
0.6009907, 0.677826, 1.268516, 0.4117647, 0, 1, 1,
0.6030443, -0.4883312, 2.311164, 0.4156863, 0, 1, 1,
0.6034498, -0.9486732, 1.933868, 0.4235294, 0, 1, 1,
0.6064215, 0.8953683, 1.105288, 0.427451, 0, 1, 1,
0.6099014, -0.8843195, 1.941983, 0.4352941, 0, 1, 1,
0.6152381, -0.6498471, 3.716386, 0.4392157, 0, 1, 1,
0.6175354, 1.442571, 1.298176, 0.4470588, 0, 1, 1,
0.6240025, -1.442295, 1.629779, 0.4509804, 0, 1, 1,
0.6269793, -1.237411, 3.490494, 0.4588235, 0, 1, 1,
0.6419833, 0.6815144, 0.969699, 0.4627451, 0, 1, 1,
0.6485407, 2.839029, 2.029142, 0.4705882, 0, 1, 1,
0.6515009, 0.2901841, 1.954345, 0.4745098, 0, 1, 1,
0.6541122, 0.01778178, 2.558525, 0.4823529, 0, 1, 1,
0.6566455, 1.4525, 1.287382, 0.4862745, 0, 1, 1,
0.6591675, 1.036963, 0.8745709, 0.4941176, 0, 1, 1,
0.6594292, -0.2583148, 2.481564, 0.5019608, 0, 1, 1,
0.6606305, -0.5738005, 2.061471, 0.5058824, 0, 1, 1,
0.6690757, -0.03094521, 2.164565, 0.5137255, 0, 1, 1,
0.6769391, -1.145957, 2.705514, 0.5176471, 0, 1, 1,
0.6797633, 1.259107, 0.991281, 0.5254902, 0, 1, 1,
0.6813357, 0.9411594, -0.5287579, 0.5294118, 0, 1, 1,
0.6915061, 0.4457441, 0.4550445, 0.5372549, 0, 1, 1,
0.6956961, 2.427878, 0.0356509, 0.5411765, 0, 1, 1,
0.7001824, 0.2374144, 0.8343135, 0.5490196, 0, 1, 1,
0.7051858, 0.3007033, 1.622825, 0.5529412, 0, 1, 1,
0.7098283, 2.146236, -0.3363316, 0.5607843, 0, 1, 1,
0.7165154, 0.2299933, 1.592813, 0.5647059, 0, 1, 1,
0.7193125, 1.126614, 0.2323293, 0.572549, 0, 1, 1,
0.7219847, 0.02188012, 1.16229, 0.5764706, 0, 1, 1,
0.7223568, -0.2162547, 3.494376, 0.5843138, 0, 1, 1,
0.7228917, -0.1636235, 1.650845, 0.5882353, 0, 1, 1,
0.7268538, 0.658214, 1.865982, 0.5960785, 0, 1, 1,
0.7284965, 0.8772158, 0.05710405, 0.6039216, 0, 1, 1,
0.7290505, -0.9973135, 2.844383, 0.6078432, 0, 1, 1,
0.736609, -0.2842633, 1.867355, 0.6156863, 0, 1, 1,
0.7387006, -2.826329, 3.201705, 0.6196079, 0, 1, 1,
0.7401541, -1.240083, 1.798833, 0.627451, 0, 1, 1,
0.7454747, -0.2502264, 2.845505, 0.6313726, 0, 1, 1,
0.7458471, -0.2998001, 2.891979, 0.6392157, 0, 1, 1,
0.7510183, -2.033448, 1.800611, 0.6431373, 0, 1, 1,
0.757447, 1.898628, -0.09143997, 0.6509804, 0, 1, 1,
0.7584457, -1.494654, 1.678315, 0.654902, 0, 1, 1,
0.7592535, -0.08577629, 0.6997871, 0.6627451, 0, 1, 1,
0.7598656, 0.1844323, 2.394247, 0.6666667, 0, 1, 1,
0.7600499, -1.492677, 3.628098, 0.6745098, 0, 1, 1,
0.7606822, -1.04608, 3.086167, 0.6784314, 0, 1, 1,
0.7606872, -0.3025258, 2.113017, 0.6862745, 0, 1, 1,
0.7647829, 1.219264, 0.1630502, 0.6901961, 0, 1, 1,
0.7679326, -0.4700205, 1.039714, 0.6980392, 0, 1, 1,
0.7686117, -0.5817171, 1.577937, 0.7058824, 0, 1, 1,
0.7755953, -0.7284862, 0.3688155, 0.7098039, 0, 1, 1,
0.7762441, 0.1045147, 2.429273, 0.7176471, 0, 1, 1,
0.7768934, -1.106975, 1.637415, 0.7215686, 0, 1, 1,
0.7824464, 0.9059111, 0.9062494, 0.7294118, 0, 1, 1,
0.7825997, 0.06718378, -0.2439649, 0.7333333, 0, 1, 1,
0.7851998, 2.109915, -0.06937236, 0.7411765, 0, 1, 1,
0.7883782, -1.009575, 1.732076, 0.7450981, 0, 1, 1,
0.7934824, 0.4967378, 1.405725, 0.7529412, 0, 1, 1,
0.7975638, -1.033728, 0.189024, 0.7568628, 0, 1, 1,
0.8013739, -0.2326011, 1.821578, 0.7647059, 0, 1, 1,
0.807875, -0.1048106, 1.233858, 0.7686275, 0, 1, 1,
0.8165392, -0.05515846, 1.24824, 0.7764706, 0, 1, 1,
0.8172799, -0.5647233, 2.715051, 0.7803922, 0, 1, 1,
0.8188348, -0.4302962, 0.1966315, 0.7882353, 0, 1, 1,
0.8188691, -2.031506, 4.109004, 0.7921569, 0, 1, 1,
0.8278112, 0.06690793, 1.374377, 0.8, 0, 1, 1,
0.8319321, -1.779757, 3.242042, 0.8078431, 0, 1, 1,
0.8336312, 1.202155, 2.161974, 0.8117647, 0, 1, 1,
0.836283, -0.3427071, 1.643874, 0.8196079, 0, 1, 1,
0.8370945, -1.490121, 2.749087, 0.8235294, 0, 1, 1,
0.837343, -2.083781, 2.047899, 0.8313726, 0, 1, 1,
0.8377091, -0.03530446, 1.141605, 0.8352941, 0, 1, 1,
0.8409476, -1.833069, 2.782146, 0.8431373, 0, 1, 1,
0.8416135, 0.2207351, -0.4353075, 0.8470588, 0, 1, 1,
0.8455455, 0.9972951, 1.789338, 0.854902, 0, 1, 1,
0.8458705, 0.1500429, 2.154403, 0.8588235, 0, 1, 1,
0.848356, -0.240292, 2.015165, 0.8666667, 0, 1, 1,
0.8517038, 0.4803055, 1.086555, 0.8705882, 0, 1, 1,
0.8554378, -0.1634622, 2.381955, 0.8784314, 0, 1, 1,
0.8568903, 0.5162166, 0.03477361, 0.8823529, 0, 1, 1,
0.86161, 0.8567923, -0.03684294, 0.8901961, 0, 1, 1,
0.8674118, 0.3159806, 0.1956523, 0.8941177, 0, 1, 1,
0.8718998, -0.1294199, 1.054819, 0.9019608, 0, 1, 1,
0.8725222, 1.166984, -0.5568683, 0.9098039, 0, 1, 1,
0.8802487, 1.570386, 0.7774493, 0.9137255, 0, 1, 1,
0.8848804, 1.490884, 0.6039226, 0.9215686, 0, 1, 1,
0.892415, -1.083582, 1.163375, 0.9254902, 0, 1, 1,
0.8928559, -0.8996857, 2.365081, 0.9333333, 0, 1, 1,
0.8958553, -1.236274, 3.964593, 0.9372549, 0, 1, 1,
0.9014801, -0.4678402, 1.746831, 0.945098, 0, 1, 1,
0.9030148, 1.165663, -0.8750417, 0.9490196, 0, 1, 1,
0.9091584, -1.873198, 2.963694, 0.9568627, 0, 1, 1,
0.9114732, 0.6090744, 1.325238, 0.9607843, 0, 1, 1,
0.9184079, 2.506599, 1.574068, 0.9686275, 0, 1, 1,
0.9294887, -0.1785115, 3.822155, 0.972549, 0, 1, 1,
0.9380087, -1.421903, 2.929088, 0.9803922, 0, 1, 1,
0.9437342, 0.3653595, 1.412556, 0.9843137, 0, 1, 1,
0.9453958, 0.7270654, 0.3169927, 0.9921569, 0, 1, 1,
0.9469291, 0.5538108, 1.020682, 0.9960784, 0, 1, 1,
0.9471069, 1.052702, -0.1335015, 1, 0, 0.9960784, 1,
0.9577671, -1.504772, 2.885768, 1, 0, 0.9882353, 1,
0.9584439, 0.4711645, 1.397666, 1, 0, 0.9843137, 1,
0.9586954, -0.4086386, -0.1230668, 1, 0, 0.9764706, 1,
0.959173, 1.597463, 2.308023, 1, 0, 0.972549, 1,
0.9659032, -1.037858, 3.249425, 1, 0, 0.9647059, 1,
0.9715444, 0.6722192, 1.951138, 1, 0, 0.9607843, 1,
0.9734567, -0.8040977, 2.796333, 1, 0, 0.9529412, 1,
0.9763823, -1.156009, 1.951294, 1, 0, 0.9490196, 1,
0.978245, -1.703415, 3.519176, 1, 0, 0.9411765, 1,
0.9809938, 0.238093, 0.4863987, 1, 0, 0.9372549, 1,
0.9888372, -0.05446616, 1.951171, 1, 0, 0.9294118, 1,
0.994104, -0.3070772, 1.586447, 1, 0, 0.9254902, 1,
1.001021, -0.6115243, 0.3117571, 1, 0, 0.9176471, 1,
1.00473, 0.2812066, 1.880236, 1, 0, 0.9137255, 1,
1.011106, 0.9255574, 1.707003, 1, 0, 0.9058824, 1,
1.020248, 0.6818444, 1.92807, 1, 0, 0.9019608, 1,
1.021271, -1.93295, 2.399594, 1, 0, 0.8941177, 1,
1.026449, 0.790993, 1.273345, 1, 0, 0.8862745, 1,
1.028227, -1.253978, 2.482673, 1, 0, 0.8823529, 1,
1.030754, -0.5235037, 1.204488, 1, 0, 0.8745098, 1,
1.047795, 0.6538956, 1.777812, 1, 0, 0.8705882, 1,
1.05037, 1.154846, -1.478996, 1, 0, 0.8627451, 1,
1.052994, 2.724148, 0.5302033, 1, 0, 0.8588235, 1,
1.053792, 1.937748, 0.4393948, 1, 0, 0.8509804, 1,
1.0625, -0.1827972, 0.9944028, 1, 0, 0.8470588, 1,
1.071643, -0.6374676, 0.7153754, 1, 0, 0.8392157, 1,
1.077928, 0.0469474, 0.317044, 1, 0, 0.8352941, 1,
1.082344, -0.9488928, 1.834304, 1, 0, 0.827451, 1,
1.083267, -0.4493879, 2.931468, 1, 0, 0.8235294, 1,
1.084765, -1.525985, 2.114183, 1, 0, 0.8156863, 1,
1.085212, 0.8688154, 0.001356104, 1, 0, 0.8117647, 1,
1.089515, -1.166997, 2.474063, 1, 0, 0.8039216, 1,
1.091858, 0.4584727, -0.07662797, 1, 0, 0.7960784, 1,
1.092657, -1.489087, 1.271216, 1, 0, 0.7921569, 1,
1.098101, -0.2401209, -0.530843, 1, 0, 0.7843137, 1,
1.100034, 0.2522692, 0.7859176, 1, 0, 0.7803922, 1,
1.100788, -0.05923223, 2.26904, 1, 0, 0.772549, 1,
1.10423, -1.261306, 2.789289, 1, 0, 0.7686275, 1,
1.11326, -1.162616, 1.651886, 1, 0, 0.7607843, 1,
1.118249, 0.4876237, 1.487145, 1, 0, 0.7568628, 1,
1.121204, -1.232787, 2.153436, 1, 0, 0.7490196, 1,
1.121729, 0.3644929, 0.9500068, 1, 0, 0.7450981, 1,
1.128054, 0.4234473, 2.18099, 1, 0, 0.7372549, 1,
1.134055, 0.06033182, 1.141032, 1, 0, 0.7333333, 1,
1.13551, -0.1265036, -0.3181143, 1, 0, 0.7254902, 1,
1.139248, 0.432631, 0.8369607, 1, 0, 0.7215686, 1,
1.143895, -0.5330131, 1.98218, 1, 0, 0.7137255, 1,
1.14919, 0.7757964, 0.7624153, 1, 0, 0.7098039, 1,
1.150436, 0.0252536, 1.552595, 1, 0, 0.7019608, 1,
1.1549, -1.508657, 3.222845, 1, 0, 0.6941177, 1,
1.167405, 0.8954415, 0.4076409, 1, 0, 0.6901961, 1,
1.167618, 0.7654925, 1.435269, 1, 0, 0.682353, 1,
1.176555, 0.4266252, 1.063903, 1, 0, 0.6784314, 1,
1.190069, 1.706083, 0.924704, 1, 0, 0.6705883, 1,
1.190414, -0.8239308, 3.025565, 1, 0, 0.6666667, 1,
1.192785, 0.1653394, 1.65769, 1, 0, 0.6588235, 1,
1.193951, -0.1495868, 1.35489, 1, 0, 0.654902, 1,
1.195457, 0.8762346, 0.4273299, 1, 0, 0.6470588, 1,
1.201073, 1.153375, 0.766988, 1, 0, 0.6431373, 1,
1.202652, -1.17004, 2.025786, 1, 0, 0.6352941, 1,
1.203697, 0.2608608, -0.7028102, 1, 0, 0.6313726, 1,
1.214791, -0.5295999, 2.737407, 1, 0, 0.6235294, 1,
1.218281, 0.8711845, 1.368703, 1, 0, 0.6196079, 1,
1.240269, 0.7384828, 0.7539732, 1, 0, 0.6117647, 1,
1.259434, -0.2936363, 3.083097, 1, 0, 0.6078432, 1,
1.266355, 0.1738988, 2.462999, 1, 0, 0.6, 1,
1.267944, -0.671652, 2.270991, 1, 0, 0.5921569, 1,
1.272251, 0.5606036, 1.824149, 1, 0, 0.5882353, 1,
1.280824, 0.4626748, 2.043486, 1, 0, 0.5803922, 1,
1.287141, -1.763679, 1.737761, 1, 0, 0.5764706, 1,
1.290824, 1.244716, 1.548958, 1, 0, 0.5686275, 1,
1.299755, 0.3639717, 1.802065, 1, 0, 0.5647059, 1,
1.300793, -0.353326, 1.785831, 1, 0, 0.5568628, 1,
1.30296, -1.483424, 1.041865, 1, 0, 0.5529412, 1,
1.30651, 1.115219, 2.791705, 1, 0, 0.5450981, 1,
1.318878, -1.750956, 2.537231, 1, 0, 0.5411765, 1,
1.319999, -0.1393076, 1.556438, 1, 0, 0.5333334, 1,
1.322936, 0.1424402, 1.398446, 1, 0, 0.5294118, 1,
1.329934, -0.5619609, 1.490844, 1, 0, 0.5215687, 1,
1.330829, 1.338147, 0.7777164, 1, 0, 0.5176471, 1,
1.332955, -0.5952285, -0.1590821, 1, 0, 0.509804, 1,
1.354757, 1.497126, 0.6387612, 1, 0, 0.5058824, 1,
1.360337, -0.4197851, 1.971178, 1, 0, 0.4980392, 1,
1.386767, 0.9818136, 1.713505, 1, 0, 0.4901961, 1,
1.391602, 0.7144136, 1.090658, 1, 0, 0.4862745, 1,
1.401827, -1.596047, 2.820258, 1, 0, 0.4784314, 1,
1.407305, -0.3296529, 0.3496482, 1, 0, 0.4745098, 1,
1.418114, 1.152023, 0.1346108, 1, 0, 0.4666667, 1,
1.419767, 0.06582356, -0.05345284, 1, 0, 0.4627451, 1,
1.43006, -0.2202332, 0.7427239, 1, 0, 0.454902, 1,
1.43604, -0.9129711, 1.528793, 1, 0, 0.4509804, 1,
1.439871, 0.4102769, 1.436845, 1, 0, 0.4431373, 1,
1.440068, -0.865568, 0.8185952, 1, 0, 0.4392157, 1,
1.445744, -0.3541126, 2.138521, 1, 0, 0.4313726, 1,
1.465162, -0.976836, 1.402725, 1, 0, 0.427451, 1,
1.465627, 0.5275296, 0.2638311, 1, 0, 0.4196078, 1,
1.485723, -0.331945, 1.531089, 1, 0, 0.4156863, 1,
1.488229, -0.111175, 2.142771, 1, 0, 0.4078431, 1,
1.49901, -0.4283993, 0.03829284, 1, 0, 0.4039216, 1,
1.502466, -1.535833, 1.787848, 1, 0, 0.3960784, 1,
1.505747, -1.309161, 1.958148, 1, 0, 0.3882353, 1,
1.521623, -0.4262858, 2.962614, 1, 0, 0.3843137, 1,
1.527013, 0.1970676, 1.959204, 1, 0, 0.3764706, 1,
1.529814, 0.587329, 1.50272, 1, 0, 0.372549, 1,
1.541766, 0.1583799, 0.7690465, 1, 0, 0.3647059, 1,
1.557339, 0.05357079, 2.227159, 1, 0, 0.3607843, 1,
1.572488, 0.04827293, 1.466157, 1, 0, 0.3529412, 1,
1.573919, 1.271961, 1.166834, 1, 0, 0.3490196, 1,
1.585429, 0.2118684, 3.284324, 1, 0, 0.3411765, 1,
1.588777, 1.329197, 0.8646289, 1, 0, 0.3372549, 1,
1.590561, 0.1803916, 0.8859586, 1, 0, 0.3294118, 1,
1.596736, -0.2621663, 2.867895, 1, 0, 0.3254902, 1,
1.615017, -1.70248, 1.497079, 1, 0, 0.3176471, 1,
1.622035, 1.226869, 0.006340877, 1, 0, 0.3137255, 1,
1.62939, -0.2613533, 2.895564, 1, 0, 0.3058824, 1,
1.649709, -0.04500768, 2.52947, 1, 0, 0.2980392, 1,
1.689287, 0.3662646, 0.2149503, 1, 0, 0.2941177, 1,
1.711359, -0.2630378, 1.952513, 1, 0, 0.2862745, 1,
1.714694, 0.844871, 1.101618, 1, 0, 0.282353, 1,
1.715372, -1.925438, 0.9792072, 1, 0, 0.2745098, 1,
1.716061, 0.7213825, 2.451676, 1, 0, 0.2705882, 1,
1.730622, 0.3690009, 0.5114371, 1, 0, 0.2627451, 1,
1.744998, 0.9311346, 1.523834, 1, 0, 0.2588235, 1,
1.763897, -0.8023731, 1.297302, 1, 0, 0.2509804, 1,
1.770078, 0.3460132, 1.330626, 1, 0, 0.2470588, 1,
1.772496, -0.1935115, 2.016206, 1, 0, 0.2392157, 1,
1.778102, 0.48027, 0.8117121, 1, 0, 0.2352941, 1,
1.785224, -2.031846, 1.699353, 1, 0, 0.227451, 1,
1.78957, -0.6304727, 1.549295, 1, 0, 0.2235294, 1,
1.790402, 1.026924, 1.715831, 1, 0, 0.2156863, 1,
1.818728, 1.011197, 1.766714, 1, 0, 0.2117647, 1,
1.829974, 0.6567351, 2.130457, 1, 0, 0.2039216, 1,
1.854437, -1.884836, 2.098948, 1, 0, 0.1960784, 1,
1.85469, 0.7378954, -0.03949553, 1, 0, 0.1921569, 1,
1.856068, -0.8086214, 3.277335, 1, 0, 0.1843137, 1,
1.887309, -0.6619486, 1.325647, 1, 0, 0.1803922, 1,
1.936617, -1.459307, 1.194796, 1, 0, 0.172549, 1,
1.953564, -0.3628331, 3.092304, 1, 0, 0.1686275, 1,
1.980279, 1.321885, 0.5108625, 1, 0, 0.1607843, 1,
1.99135, 1.943271, 1.249065, 1, 0, 0.1568628, 1,
1.995628, -1.689285, 2.023114, 1, 0, 0.1490196, 1,
2.025549, 1.065926, 0.5776662, 1, 0, 0.145098, 1,
2.037699, 0.0316043, 1.499565, 1, 0, 0.1372549, 1,
2.039032, 1.880941, -1.535131, 1, 0, 0.1333333, 1,
2.072317, 0.3776787, 1.748499, 1, 0, 0.1254902, 1,
2.099024, 0.8247259, 1.343369, 1, 0, 0.1215686, 1,
2.104513, -0.6855435, 2.091014, 1, 0, 0.1137255, 1,
2.144404, 0.2673344, 2.101989, 1, 0, 0.1098039, 1,
2.218449, 0.7291937, 0.6776289, 1, 0, 0.1019608, 1,
2.316602, 0.07212756, 2.262183, 1, 0, 0.09411765, 1,
2.333455, 0.3634147, 2.771061, 1, 0, 0.09019608, 1,
2.343466, 0.02999115, 1.332345, 1, 0, 0.08235294, 1,
2.350086, 0.4157213, 0.8648667, 1, 0, 0.07843138, 1,
2.369056, -0.7420976, 2.044007, 1, 0, 0.07058824, 1,
2.389634, -0.9175797, 1.10694, 1, 0, 0.06666667, 1,
2.433432, 1.574626, 1.159963, 1, 0, 0.05882353, 1,
2.434604, 0.5424495, 2.314574, 1, 0, 0.05490196, 1,
2.517271, -1.347374, 0.6309411, 1, 0, 0.04705882, 1,
2.550086, -0.3992066, 3.730347, 1, 0, 0.04313726, 1,
2.619936, 0.8890855, 0.8497652, 1, 0, 0.03529412, 1,
2.786597, 1.159297, 0.4898095, 1, 0, 0.03137255, 1,
2.889542, -0.4179346, 1.957831, 1, 0, 0.02352941, 1,
3.037297, 1.76065, 0.6520446, 1, 0, 0.01960784, 1,
3.152492, -0.4303178, 0.7318911, 1, 0, 0.01176471, 1,
3.215353, 2.387352, -0.2092981, 1, 0, 0.007843138, 1
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
0.2558916, -4.173257, -8.458222, 0, -0.5, 0.5, 0.5,
0.2558916, -4.173257, -8.458222, 1, -0.5, 0.5, 0.5,
0.2558916, -4.173257, -8.458222, 1, 1.5, 0.5, 0.5,
0.2558916, -4.173257, -8.458222, 0, 1.5, 0.5, 0.5
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
-3.706828, 0.003217936, -8.458222, 0, -0.5, 0.5, 0.5,
-3.706828, 0.003217936, -8.458222, 1, -0.5, 0.5, 0.5,
-3.706828, 0.003217936, -8.458222, 1, 1.5, 0.5, 0.5,
-3.706828, 0.003217936, -8.458222, 0, 1.5, 0.5, 0.5
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
-3.706828, -4.173257, -0.06360698, 0, -0.5, 0.5, 0.5,
-3.706828, -4.173257, -0.06360698, 1, -0.5, 0.5, 0.5,
-3.706828, -4.173257, -0.06360698, 1, 1.5, 0.5, 0.5,
-3.706828, -4.173257, -0.06360698, 0, 1.5, 0.5, 0.5
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
-2, -3.209455, -6.521003,
3, -3.209455, -6.521003,
-2, -3.209455, -6.521003,
-2, -3.370089, -6.843873,
-1, -3.209455, -6.521003,
-1, -3.370089, -6.843873,
0, -3.209455, -6.521003,
0, -3.370089, -6.843873,
1, -3.209455, -6.521003,
1, -3.370089, -6.843873,
2, -3.209455, -6.521003,
2, -3.370089, -6.843873,
3, -3.209455, -6.521003,
3, -3.370089, -6.843873
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
-2, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
-2, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
-2, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
-2, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5,
-1, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
-1, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
-1, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
-1, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5,
0, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
0, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
0, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
0, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5,
1, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
1, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
1, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
1, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5,
2, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
2, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
2, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
2, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5,
3, -3.691356, -7.489613, 0, -0.5, 0.5, 0.5,
3, -3.691356, -7.489613, 1, -0.5, 0.5, 0.5,
3, -3.691356, -7.489613, 1, 1.5, 0.5, 0.5,
3, -3.691356, -7.489613, 0, 1.5, 0.5, 0.5
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
-2.792354, -3, -6.521003,
-2.792354, 3, -6.521003,
-2.792354, -3, -6.521003,
-2.944766, -3, -6.843873,
-2.792354, -2, -6.521003,
-2.944766, -2, -6.843873,
-2.792354, -1, -6.521003,
-2.944766, -1, -6.843873,
-2.792354, 0, -6.521003,
-2.944766, 0, -6.843873,
-2.792354, 1, -6.521003,
-2.944766, 1, -6.843873,
-2.792354, 2, -6.521003,
-2.944766, 2, -6.843873,
-2.792354, 3, -6.521003,
-2.944766, 3, -6.843873
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
-3.249591, -3, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, -3, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, -3, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, -3, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, -2, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, -2, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, -2, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, -2, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, -1, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, -1, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, -1, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, -1, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, 0, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, 0, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, 0, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, 0, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, 1, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, 1, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, 1, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, 1, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, 2, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, 2, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, 2, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, 2, -7.489613, 0, 1.5, 0.5, 0.5,
-3.249591, 3, -7.489613, 0, -0.5, 0.5, 0.5,
-3.249591, 3, -7.489613, 1, -0.5, 0.5, 0.5,
-3.249591, 3, -7.489613, 1, 1.5, 0.5, 0.5,
-3.249591, 3, -7.489613, 0, 1.5, 0.5, 0.5
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
-2.792354, -3.209455, -6,
-2.792354, -3.209455, 6,
-2.792354, -3.209455, -6,
-2.944766, -3.370089, -6,
-2.792354, -3.209455, -4,
-2.944766, -3.370089, -4,
-2.792354, -3.209455, -2,
-2.944766, -3.370089, -2,
-2.792354, -3.209455, 0,
-2.944766, -3.370089, 0,
-2.792354, -3.209455, 2,
-2.944766, -3.370089, 2,
-2.792354, -3.209455, 4,
-2.944766, -3.370089, 4,
-2.792354, -3.209455, 6,
-2.944766, -3.370089, 6
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
-3.249591, -3.691356, -6, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -6, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -6, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, -6, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, -4, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -4, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -4, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, -4, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, -2, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -2, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, -2, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, -2, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 0, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 0, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 0, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 0, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 2, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 2, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 2, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 2, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 4, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 4, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 4, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 4, 0, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 6, 0, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 6, 1, -0.5, 0.5, 0.5,
-3.249591, -3.691356, 6, 1, 1.5, 0.5, 0.5,
-3.249591, -3.691356, 6, 0, 1.5, 0.5, 0.5
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
-2.792354, -3.209455, -6.521003,
-2.792354, 3.215891, -6.521003,
-2.792354, -3.209455, 6.393789,
-2.792354, 3.215891, 6.393789,
-2.792354, -3.209455, -6.521003,
-2.792354, -3.209455, 6.393789,
-2.792354, 3.215891, -6.521003,
-2.792354, 3.215891, 6.393789,
-2.792354, -3.209455, -6.521003,
3.304137, -3.209455, -6.521003,
-2.792354, -3.209455, 6.393789,
3.304137, -3.209455, 6.393789,
-2.792354, 3.215891, -6.521003,
3.304137, 3.215891, -6.521003,
-2.792354, 3.215891, 6.393789,
3.304137, 3.215891, 6.393789,
3.304137, -3.209455, -6.521003,
3.304137, 3.215891, -6.521003,
3.304137, -3.209455, 6.393789,
3.304137, 3.215891, 6.393789,
3.304137, -3.209455, -6.521003,
3.304137, -3.209455, 6.393789,
3.304137, 3.215891, -6.521003,
3.304137, 3.215891, 6.393789
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
var radius = 8.362282;
var distance = 37.20473;
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
mvMatrix.translate( -0.2558916, -0.003217936, 0.06360698 );
mvMatrix.scale( 1.48306, 1.407156, 0.7000858 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.20473);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
haloxyfop<-read.table("haloxyfop.xyz")
```

```
## Error in read.table("haloxyfop.xyz"): no lines available in input
```

```r
x<-haloxyfop$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
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
-2.70357, -0.6688882, -2.154684, 0, 0, 1, 1, 1,
-2.596042, 1.538881, 0.1991129, 1, 0, 0, 1, 1,
-2.466722, 1.009964, -1.395188, 1, 0, 0, 1, 1,
-2.444854, 1.438641, 0.908673, 1, 0, 0, 1, 1,
-2.405823, 1.68849, 0.5898414, 1, 0, 0, 1, 1,
-2.339504, -0.2555116, -0.4131255, 1, 0, 0, 1, 1,
-2.309333, -1.041872, -3.736097, 0, 0, 0, 1, 1,
-2.307374, 0.1270193, -2.062285, 0, 0, 0, 1, 1,
-2.306488, 0.003871533, -1.686285, 0, 0, 0, 1, 1,
-2.14628, 0.5565163, -0.206459, 0, 0, 0, 1, 1,
-2.072816, 0.204997, -1.382494, 0, 0, 0, 1, 1,
-2.064019, -1.424197, -2.908376, 0, 0, 0, 1, 1,
-2.0523, 0.1393348, -0.9571751, 0, 0, 0, 1, 1,
-2.023634, 0.6694186, -2.149588, 1, 1, 1, 1, 1,
-2.021156, 0.9519384, -0.9344035, 1, 1, 1, 1, 1,
-2.02054, -0.02700383, -1.258665, 1, 1, 1, 1, 1,
-2.017671, 1.667917, -0.828248, 1, 1, 1, 1, 1,
-2.017452, 0.04678745, -1.496707, 1, 1, 1, 1, 1,
-1.992438, 1.384859, 0.07994888, 1, 1, 1, 1, 1,
-1.991031, -2.021542, -1.299955, 1, 1, 1, 1, 1,
-1.98671, -3.047724, -2.247303, 1, 1, 1, 1, 1,
-1.977128, 0.4770029, 0.3149003, 1, 1, 1, 1, 1,
-1.96191, -0.1529506, -1.713415, 1, 1, 1, 1, 1,
-1.960649, -0.01216207, -0.3804904, 1, 1, 1, 1, 1,
-1.954304, 1.214697, 0.4961097, 1, 1, 1, 1, 1,
-1.952997, -0.3070278, -2.315211, 1, 1, 1, 1, 1,
-1.952425, -0.6980711, -0.9834791, 1, 1, 1, 1, 1,
-1.950655, -0.08298516, -2.234824, 1, 1, 1, 1, 1,
-1.937976, 0.2706725, -1.734805, 0, 0, 1, 1, 1,
-1.924346, 1.426444, -2.945593, 1, 0, 0, 1, 1,
-1.900558, 2.058704, 0.2411032, 1, 0, 0, 1, 1,
-1.870782, 0.341692, -1.855624, 1, 0, 0, 1, 1,
-1.840594, -3.115882, -3.299737, 1, 0, 0, 1, 1,
-1.826618, 0.3944234, -1.730875, 1, 0, 0, 1, 1,
-1.825037, 0.2273905, -1.410382, 0, 0, 0, 1, 1,
-1.804218, 0.1175642, -1.095482, 0, 0, 0, 1, 1,
-1.758628, 0.5001991, -2.740517, 0, 0, 0, 1, 1,
-1.758322, 1.438807, -1.239958, 0, 0, 0, 1, 1,
-1.753185, 0.09199927, -1.519127, 0, 0, 0, 1, 1,
-1.747216, -0.2681871, -2.719692, 0, 0, 0, 1, 1,
-1.745375, -0.3499281, -2.68192, 0, 0, 0, 1, 1,
-1.723733, -0.6741127, -0.6672549, 1, 1, 1, 1, 1,
-1.715998, 0.5906715, -0.8256874, 1, 1, 1, 1, 1,
-1.687183, -0.4531182, -1.032448, 1, 1, 1, 1, 1,
-1.672647, -1.099383, -1.981679, 1, 1, 1, 1, 1,
-1.666325, 0.8630489, -1.688247, 1, 1, 1, 1, 1,
-1.657684, -0.130959, -2.445676, 1, 1, 1, 1, 1,
-1.652424, 0.2990516, -3.136227, 1, 1, 1, 1, 1,
-1.645266, -0.2464435, -1.820579, 1, 1, 1, 1, 1,
-1.637531, 0.4722727, -1.637786, 1, 1, 1, 1, 1,
-1.604057, -0.6414565, -2.820172, 1, 1, 1, 1, 1,
-1.59989, 0.2622213, -2.279655, 1, 1, 1, 1, 1,
-1.598906, -1.862841, -2.269638, 1, 1, 1, 1, 1,
-1.595682, 0.7680181, 0.0848277, 1, 1, 1, 1, 1,
-1.591055, 0.1954567, 0.5045563, 1, 1, 1, 1, 1,
-1.586209, 0.9053257, 2.041506, 1, 1, 1, 1, 1,
-1.5676, -1.302898, -0.5023946, 0, 0, 1, 1, 1,
-1.565458, 0.6298037, -0.4826279, 1, 0, 0, 1, 1,
-1.551838, 0.5462072, -1.342898, 1, 0, 0, 1, 1,
-1.546566, 0.04202084, -2.493747, 1, 0, 0, 1, 1,
-1.537271, 0.9225295, -1.279669, 1, 0, 0, 1, 1,
-1.533328, 0.5118616, -2.111605, 1, 0, 0, 1, 1,
-1.533099, -0.5853475, -1.505936, 0, 0, 0, 1, 1,
-1.528088, 0.6853971, -2.460234, 0, 0, 0, 1, 1,
-1.525722, 0.7461985, 0.08594186, 0, 0, 0, 1, 1,
-1.522564, 1.977637, -1.395413, 0, 0, 0, 1, 1,
-1.515359, 0.2932999, -3.028126, 0, 0, 0, 1, 1,
-1.512355, 0.5086108, -2.34307, 0, 0, 0, 1, 1,
-1.498786, -0.5012382, -1.758107, 0, 0, 0, 1, 1,
-1.498761, 2.920104, 0.289052, 1, 1, 1, 1, 1,
-1.490743, -0.762749, -2.183525, 1, 1, 1, 1, 1,
-1.471214, -0.4537607, -1.576993, 1, 1, 1, 1, 1,
-1.468782, 1.458061, -1.078789, 1, 1, 1, 1, 1,
-1.468491, 1.328295, -0.6599993, 1, 1, 1, 1, 1,
-1.466914, -0.3374515, -0.9232869, 1, 1, 1, 1, 1,
-1.449635, 0.5573473, -2.114383, 1, 1, 1, 1, 1,
-1.443472, 0.4183933, -1.356368, 1, 1, 1, 1, 1,
-1.436609, 1.059944, -1.877712, 1, 1, 1, 1, 1,
-1.422726, -1.517952, -1.741504, 1, 1, 1, 1, 1,
-1.407562, 0.5592096, -2.188775, 1, 1, 1, 1, 1,
-1.397115, -0.9009734, -2.987446, 1, 1, 1, 1, 1,
-1.393642, 0.4879322, -1.891394, 1, 1, 1, 1, 1,
-1.389436, 1.043421, -1.70658, 1, 1, 1, 1, 1,
-1.379512, 0.9593601, -1.177979, 1, 1, 1, 1, 1,
-1.378731, -0.249987, -2.557953, 0, 0, 1, 1, 1,
-1.374504, 0.9141504, -1.068447, 1, 0, 0, 1, 1,
-1.366874, -1.931549, -2.160996, 1, 0, 0, 1, 1,
-1.363822, 0.159993, -2.583969, 1, 0, 0, 1, 1,
-1.359279, 0.5877892, -2.27324, 1, 0, 0, 1, 1,
-1.358204, -1.207643, -3.86658, 1, 0, 0, 1, 1,
-1.356803, -0.3006112, -2.603493, 0, 0, 0, 1, 1,
-1.341864, -0.4823838, -3.174389, 0, 0, 0, 1, 1,
-1.341829, -0.3847371, -3.046429, 0, 0, 0, 1, 1,
-1.334196, -0.0008033892, -2.324296, 0, 0, 0, 1, 1,
-1.323117, -1.686629, -3.79688, 0, 0, 0, 1, 1,
-1.318769, -0.4741494, -3.805986, 0, 0, 0, 1, 1,
-1.315303, -1.947413, -3.767582, 0, 0, 0, 1, 1,
-1.309896, -0.6737533, -3.123522, 1, 1, 1, 1, 1,
-1.30948, 1.131997, 0.04396621, 1, 1, 1, 1, 1,
-1.295004, 0.03997456, -0.6916842, 1, 1, 1, 1, 1,
-1.28956, -0.4105545, -3.137679, 1, 1, 1, 1, 1,
-1.279486, 0.5004832, -1.210371, 1, 1, 1, 1, 1,
-1.272601, 0.7478266, -0.6930251, 1, 1, 1, 1, 1,
-1.255855, 0.1871271, -0.8999804, 1, 1, 1, 1, 1,
-1.254068, 1.045124, 0.06854102, 1, 1, 1, 1, 1,
-1.253978, 0.9927846, -1.658622, 1, 1, 1, 1, 1,
-1.253356, 0.2911555, -1.306604, 1, 1, 1, 1, 1,
-1.251775, 0.6132262, 0.05634759, 1, 1, 1, 1, 1,
-1.249712, -0.6218049, -2.294149, 1, 1, 1, 1, 1,
-1.246992, 0.245917, -1.70069, 1, 1, 1, 1, 1,
-1.246079, -1.175094, -2.236803, 1, 1, 1, 1, 1,
-1.237972, 0.6997702, 0.2521112, 1, 1, 1, 1, 1,
-1.223415, -0.5793759, -1.700196, 0, 0, 1, 1, 1,
-1.221702, 0.6007373, -1.761006, 1, 0, 0, 1, 1,
-1.210242, -2.052883, -4.088721, 1, 0, 0, 1, 1,
-1.2086, 1.12485, 0.3122093, 1, 0, 0, 1, 1,
-1.202694, -0.9823405, -2.980155, 1, 0, 0, 1, 1,
-1.200438, -0.7108067, -2.058306, 1, 0, 0, 1, 1,
-1.198907, -0.5333138, -3.565473, 0, 0, 0, 1, 1,
-1.198236, -0.1233899, -2.039245, 0, 0, 0, 1, 1,
-1.198124, -1.312217, -2.935473, 0, 0, 0, 1, 1,
-1.191897, -0.6744276, -1.279986, 0, 0, 0, 1, 1,
-1.191288, -0.3325738, -2.293825, 0, 0, 0, 1, 1,
-1.178991, 0.5067773, 0.4628567, 0, 0, 0, 1, 1,
-1.176419, -0.9318228, -1.617341, 0, 0, 0, 1, 1,
-1.176093, -0.2536308, -3.108012, 1, 1, 1, 1, 1,
-1.172668, 0.7528181, -2.101572, 1, 1, 1, 1, 1,
-1.166178, 0.2930187, -1.081025, 1, 1, 1, 1, 1,
-1.165074, -0.408398, -1.726132, 1, 1, 1, 1, 1,
-1.164711, 0.7892412, -0.7464269, 1, 1, 1, 1, 1,
-1.152797, -0.07352292, -2.097791, 1, 1, 1, 1, 1,
-1.143744, 0.4482615, -2.483957, 1, 1, 1, 1, 1,
-1.142253, -1.575134, -4.154287, 1, 1, 1, 1, 1,
-1.132347, 2.052741, -1.689322, 1, 1, 1, 1, 1,
-1.129873, -1.102866, -2.633316, 1, 1, 1, 1, 1,
-1.123746, -0.1207902, -3.348812, 1, 1, 1, 1, 1,
-1.119173, 1.533493, -0.1216567, 1, 1, 1, 1, 1,
-1.117475, 0.006913109, -1.404788, 1, 1, 1, 1, 1,
-1.086266, 0.4522656, -1.682776, 1, 1, 1, 1, 1,
-1.083555, 0.2382571, -2.301517, 1, 1, 1, 1, 1,
-1.080707, -0.8615151, -1.880639, 0, 0, 1, 1, 1,
-1.079751, -1.764943, -1.732719, 1, 0, 0, 1, 1,
-1.075338, -0.2331144, -2.480351, 1, 0, 0, 1, 1,
-1.074962, 1.219362, -1.016393, 1, 0, 0, 1, 1,
-1.07488, -0.1424472, -1.93187, 1, 0, 0, 1, 1,
-1.07338, -0.1362777, -3.510919, 1, 0, 0, 1, 1,
-1.07312, 0.4114297, -3.093426, 0, 0, 0, 1, 1,
-1.064596, 1.295447, -0.02473216, 0, 0, 0, 1, 1,
-1.057852, 0.7942066, -0.3445384, 0, 0, 0, 1, 1,
-1.056502, -1.264866, -2.67892, 0, 0, 0, 1, 1,
-1.053796, -0.2968748, -2.878599, 0, 0, 0, 1, 1,
-1.042534, -0.7954757, -0.2799299, 0, 0, 0, 1, 1,
-1.036615, 0.541665, -1.395493, 0, 0, 0, 1, 1,
-1.033968, 0.9171842, 0.04479975, 1, 1, 1, 1, 1,
-1.03324, -1.19409, -0.6812224, 1, 1, 1, 1, 1,
-1.029973, 0.8243486, -1.181052, 1, 1, 1, 1, 1,
-1.023847, -0.1088182, -2.602638, 1, 1, 1, 1, 1,
-1.022406, -0.9481038, -1.621519, 1, 1, 1, 1, 1,
-1.02033, 0.495351, -1.187095, 1, 1, 1, 1, 1,
-1.016925, 0.1878656, -2.692176, 1, 1, 1, 1, 1,
-1.01665, 0.357156, -0.4332319, 1, 1, 1, 1, 1,
-1.007533, -0.7753269, -2.489951, 1, 1, 1, 1, 1,
-1.006448, 0.8942345, 0.3967777, 1, 1, 1, 1, 1,
-1.004409, -0.9167364, -3.123554, 1, 1, 1, 1, 1,
-1.001505, -0.06106567, -1.927187, 1, 1, 1, 1, 1,
-0.9879635, -1.781267, -3.780532, 1, 1, 1, 1, 1,
-0.9832234, -0.6599289, -1.86141, 1, 1, 1, 1, 1,
-0.982016, -0.5128446, -4.455506, 1, 1, 1, 1, 1,
-0.981688, 1.49596, -0.5137919, 0, 0, 1, 1, 1,
-0.9775674, 1.28374, -0.6613382, 1, 0, 0, 1, 1,
-0.9708369, -0.5900086, -0.6631788, 1, 0, 0, 1, 1,
-0.9689117, -1.017283, -2.508051, 1, 0, 0, 1, 1,
-0.9668316, -1.549152, -2.16283, 1, 0, 0, 1, 1,
-0.964829, 0.2611069, -1.946389, 1, 0, 0, 1, 1,
-0.9578493, 1.106869, -0.1892173, 0, 0, 0, 1, 1,
-0.9541519, -0.4011812, -2.103107, 0, 0, 0, 1, 1,
-0.9468162, -0.4453509, -2.029401, 0, 0, 0, 1, 1,
-0.9388171, 0.00025501, -1.299125, 0, 0, 0, 1, 1,
-0.9282218, 0.7923971, -0.3273834, 0, 0, 0, 1, 1,
-0.9245668, -1.147526, -3.360221, 0, 0, 0, 1, 1,
-0.9205173, -0.6219468, -0.9959677, 0, 0, 0, 1, 1,
-0.9181843, -0.1463006, -1.176043, 1, 1, 1, 1, 1,
-0.9165387, -1.215673, -1.288805, 1, 1, 1, 1, 1,
-0.9066337, 0.2805799, -1.067331, 1, 1, 1, 1, 1,
-0.9060787, -0.6105384, -3.242432, 1, 1, 1, 1, 1,
-0.9043272, 1.990786, 1.599713, 1, 1, 1, 1, 1,
-0.8974995, 1.825661, -0.6907937, 1, 1, 1, 1, 1,
-0.8970768, 0.147853, -2.513581, 1, 1, 1, 1, 1,
-0.8947025, -1.104989, -1.95806, 1, 1, 1, 1, 1,
-0.8895486, -0.118006, -2.525349, 1, 1, 1, 1, 1,
-0.8875283, -1.12646, -2.978527, 1, 1, 1, 1, 1,
-0.8860921, -1.390948, -3.528189, 1, 1, 1, 1, 1,
-0.8847752, 0.001604974, -0.3977366, 1, 1, 1, 1, 1,
-0.8830818, -2.672386, -2.184726, 1, 1, 1, 1, 1,
-0.8809682, 0.124455, -0.7508054, 1, 1, 1, 1, 1,
-0.8779565, -0.3185779, -3.197016, 1, 1, 1, 1, 1,
-0.8769409, -0.250574, -2.924169, 0, 0, 1, 1, 1,
-0.8720844, 0.9183617, -0.4195552, 1, 0, 0, 1, 1,
-0.8701621, -0.2604767, -2.885868, 1, 0, 0, 1, 1,
-0.8666369, -0.2462189, -1.948947, 1, 0, 0, 1, 1,
-0.8598396, -0.4549759, -1.648831, 1, 0, 0, 1, 1,
-0.8585675, -0.9583244, -1.76227, 1, 0, 0, 1, 1,
-0.8579952, 0.2649259, -1.061328, 0, 0, 0, 1, 1,
-0.8559656, 1.366297, -1.230282, 0, 0, 0, 1, 1,
-0.8438717, 2.315715, -0.3866005, 0, 0, 0, 1, 1,
-0.8416328, 2.095358, 1.625484, 0, 0, 0, 1, 1,
-0.8349781, 1.535213, 0.01249433, 0, 0, 0, 1, 1,
-0.8337517, -0.7451186, -1.48698, 0, 0, 0, 1, 1,
-0.8333197, 0.9653276, -0.2548731, 0, 0, 0, 1, 1,
-0.8328743, 1.653667, 1.055997, 1, 1, 1, 1, 1,
-0.8294419, 0.4233674, -1.701248, 1, 1, 1, 1, 1,
-0.8290936, -0.6953228, -3.082127, 1, 1, 1, 1, 1,
-0.8270719, -0.1912856, -2.276201, 1, 1, 1, 1, 1,
-0.8263542, 0.004320505, -0.782404, 1, 1, 1, 1, 1,
-0.8257834, 2.398564, 0.318365, 1, 1, 1, 1, 1,
-0.8235025, -0.5285777, -3.005601, 1, 1, 1, 1, 1,
-0.8193224, -1.323137, -1.938277, 1, 1, 1, 1, 1,
-0.8178782, -0.1887052, -2.228353, 1, 1, 1, 1, 1,
-0.814822, 0.1184164, -3.03478, 1, 1, 1, 1, 1,
-0.8096538, -0.3442917, -1.421312, 1, 1, 1, 1, 1,
-0.8002553, 1.517906, 0.7137782, 1, 1, 1, 1, 1,
-0.794866, 0.02935049, -1.640101, 1, 1, 1, 1, 1,
-0.7907903, -0.5309666, -4.380349, 1, 1, 1, 1, 1,
-0.7906756, -2.145008, -2.287061, 1, 1, 1, 1, 1,
-0.7874492, 1.726183, -0.2357649, 0, 0, 1, 1, 1,
-0.7854489, 1.462512, -1.664485, 1, 0, 0, 1, 1,
-0.7813876, 1.159346, 1.360578, 1, 0, 0, 1, 1,
-0.7799695, -1.719154, -1.042712, 1, 0, 0, 1, 1,
-0.7788081, -0.8979726, -4.072855, 1, 0, 0, 1, 1,
-0.7778179, -0.03127867, -1.586871, 1, 0, 0, 1, 1,
-0.7770658, -0.91536, -2.209169, 0, 0, 0, 1, 1,
-0.7689231, -0.06454672, -1.407113, 0, 0, 0, 1, 1,
-0.7673196, -0.4308199, -3.083393, 0, 0, 0, 1, 1,
-0.7646991, 1.100826, -1.472847, 0, 0, 0, 1, 1,
-0.7603141, 0.07864074, -1.660913, 0, 0, 0, 1, 1,
-0.7568771, -1.933113, -3.281798, 0, 0, 0, 1, 1,
-0.7542495, -0.04769849, -0.9321104, 0, 0, 0, 1, 1,
-0.7492808, 0.6908152, -0.212699, 1, 1, 1, 1, 1,
-0.7432061, -1.217888, -4.305257, 1, 1, 1, 1, 1,
-0.7402354, 1.460719, -0.2156879, 1, 1, 1, 1, 1,
-0.7383348, 1.566787, -1.647672, 1, 1, 1, 1, 1,
-0.7233864, -2.718076, -2.890071, 1, 1, 1, 1, 1,
-0.7201926, 1.650112, -0.1184128, 1, 1, 1, 1, 1,
-0.7192399, 2.362339, -0.7235099, 1, 1, 1, 1, 1,
-0.7156104, -0.5759099, -3.97767, 1, 1, 1, 1, 1,
-0.7148428, 0.3951332, -0.9173757, 1, 1, 1, 1, 1,
-0.7140188, 0.05367111, -2.39442, 1, 1, 1, 1, 1,
-0.7128577, 0.6988878, -1.366077, 1, 1, 1, 1, 1,
-0.7069212, -0.9372939, -2.803943, 1, 1, 1, 1, 1,
-0.7053931, -1.763098, -1.10334, 1, 1, 1, 1, 1,
-0.7006533, -0.9045871, -4.977132, 1, 1, 1, 1, 1,
-0.699059, 1.063553, -2.286094, 1, 1, 1, 1, 1,
-0.6988922, -0.8496403, -3.382525, 0, 0, 1, 1, 1,
-0.6845728, 1.462554, -0.06875932, 1, 0, 0, 1, 1,
-0.6836205, 0.2582773, -1.325001, 1, 0, 0, 1, 1,
-0.6835635, 0.5646285, -1.147814, 1, 0, 0, 1, 1,
-0.6809927, -0.5313246, -3.624305, 1, 0, 0, 1, 1,
-0.6804013, -0.2040472, -1.106873, 1, 0, 0, 1, 1,
-0.6798741, -1.284992, -5.383524, 0, 0, 0, 1, 1,
-0.679236, -0.02541535, -0.09004769, 0, 0, 0, 1, 1,
-0.6784317, 1.186694, 1.362027, 0, 0, 0, 1, 1,
-0.6732361, 0.9172686, 1.213532, 0, 0, 0, 1, 1,
-0.6724513, 1.104978, -1.459965, 0, 0, 0, 1, 1,
-0.6701992, -0.3621695, -3.034425, 0, 0, 0, 1, 1,
-0.6691948, 0.7849875, -0.2053463, 0, 0, 0, 1, 1,
-0.6660686, -0.04682004, -1.388713, 1, 1, 1, 1, 1,
-0.6656082, -0.136671, -0.9151966, 1, 1, 1, 1, 1,
-0.6626981, -1.495629, -2.393969, 1, 1, 1, 1, 1,
-0.6607847, -0.1991273, -2.622467, 1, 1, 1, 1, 1,
-0.6589674, 0.3703566, -2.095682, 1, 1, 1, 1, 1,
-0.6560627, 0.6071709, -0.5677772, 1, 1, 1, 1, 1,
-0.6534557, -0.9297118, -2.841677, 1, 1, 1, 1, 1,
-0.6521416, -0.09834892, -2.850972, 1, 1, 1, 1, 1,
-0.6414261, 2.028975, 1.210528, 1, 1, 1, 1, 1,
-0.6365114, 0.3603666, -1.919546, 1, 1, 1, 1, 1,
-0.6349726, 1.420934, -1.498404, 1, 1, 1, 1, 1,
-0.6299297, 1.671533, 0.1074231, 1, 1, 1, 1, 1,
-0.6285039, -1.287027, -2.069339, 1, 1, 1, 1, 1,
-0.627899, 0.9956868, -0.1032461, 1, 1, 1, 1, 1,
-0.6236697, -0.3516377, -2.660973, 1, 1, 1, 1, 1,
-0.6236054, -2.006315, -1.103889, 0, 0, 1, 1, 1,
-0.6168776, 0.6965216, -1.132969, 1, 0, 0, 1, 1,
-0.6149729, 0.7840477, -1.33272, 1, 0, 0, 1, 1,
-0.6143855, -0.4267063, -2.397856, 1, 0, 0, 1, 1,
-0.6128625, 0.7468477, 0.1963994, 1, 0, 0, 1, 1,
-0.6077791, -1.889367, -3.884701, 1, 0, 0, 1, 1,
-0.6066929, -0.9002938, -2.445361, 0, 0, 0, 1, 1,
-0.6059344, -2.239629, -3.393152, 0, 0, 0, 1, 1,
-0.5977893, 1.076039, -0.4881555, 0, 0, 0, 1, 1,
-0.5968727, 1.232607, 0.6227137, 0, 0, 0, 1, 1,
-0.5962378, 0.01299382, 0.121153, 0, 0, 0, 1, 1,
-0.5896344, 0.5044876, -0.1620506, 0, 0, 0, 1, 1,
-0.5884219, 0.3665426, 0.3440808, 0, 0, 0, 1, 1,
-0.5787412, 0.1331667, -1.255185, 1, 1, 1, 1, 1,
-0.5783935, 0.04290586, -1.898725, 1, 1, 1, 1, 1,
-0.5724449, -1.533616, -6.332924, 1, 1, 1, 1, 1,
-0.5722404, -0.7051182, -2.914782, 1, 1, 1, 1, 1,
-0.5651212, -0.3835986, -2.128546, 1, 1, 1, 1, 1,
-0.563973, -0.1490762, -3.131022, 1, 1, 1, 1, 1,
-0.5639267, -0.1088504, -2.151677, 1, 1, 1, 1, 1,
-0.5632567, 0.947129, 0.753914, 1, 1, 1, 1, 1,
-0.5594803, 3.082548, 0.1165576, 1, 1, 1, 1, 1,
-0.5593484, 0.1830493, 0.03863701, 1, 1, 1, 1, 1,
-0.5591759, 0.9623138, -0.7878432, 1, 1, 1, 1, 1,
-0.5573137, -1.209676, -1.180114, 1, 1, 1, 1, 1,
-0.5545647, -0.453072, -2.221241, 1, 1, 1, 1, 1,
-0.5528827, -0.385005, -0.7423341, 1, 1, 1, 1, 1,
-0.5486677, 0.3850045, -0.6597816, 1, 1, 1, 1, 1,
-0.5469863, -0.6671081, -2.50935, 0, 0, 1, 1, 1,
-0.5468207, 0.750427, 1.601766, 1, 0, 0, 1, 1,
-0.5459048, 0.5626748, -1.561815, 1, 0, 0, 1, 1,
-0.5447347, -0.8688533, -2.349357, 1, 0, 0, 1, 1,
-0.5325226, 0.8769839, -0.4360328, 1, 0, 0, 1, 1,
-0.5261248, 0.2767918, 1.412245, 1, 0, 0, 1, 1,
-0.5221038, -0.9025465, -3.42589, 0, 0, 0, 1, 1,
-0.5211681, -1.941177, -4.391935, 0, 0, 0, 1, 1,
-0.5206462, -0.2874417, -2.512633, 0, 0, 0, 1, 1,
-0.5206025, -0.4816092, -1.59476, 0, 0, 0, 1, 1,
-0.518359, -1.425969, -4.896425, 0, 0, 0, 1, 1,
-0.5177915, -0.696732, -2.980024, 0, 0, 0, 1, 1,
-0.5176325, 1.646999, -0.02130449, 0, 0, 0, 1, 1,
-0.5175107, 0.0452199, -1.437525, 1, 1, 1, 1, 1,
-0.5121707, -1.108058, -4.050144, 1, 1, 1, 1, 1,
-0.5119846, 0.1857776, -0.1531176, 1, 1, 1, 1, 1,
-0.5068524, -0.5392686, -1.364335, 1, 1, 1, 1, 1,
-0.500639, -0.5226859, -3.333822, 1, 1, 1, 1, 1,
-0.4992898, 0.745001, 0.2341515, 1, 1, 1, 1, 1,
-0.4992569, 1.222515, 0.5532862, 1, 1, 1, 1, 1,
-0.4991982, -0.5499324, -3.199269, 1, 1, 1, 1, 1,
-0.4987941, 2.335686, -0.3912431, 1, 1, 1, 1, 1,
-0.4976564, -0.899002, -4.172247, 1, 1, 1, 1, 1,
-0.4975335, -0.6895501, -1.948278, 1, 1, 1, 1, 1,
-0.4955213, -1.334554, -4.172496, 1, 1, 1, 1, 1,
-0.4933124, -1.417729, -2.673255, 1, 1, 1, 1, 1,
-0.489818, -0.5795675, -1.743284, 1, 1, 1, 1, 1,
-0.4705923, 1.183219, 0.7385939, 1, 1, 1, 1, 1,
-0.4649106, 0.4612508, -2.097194, 0, 0, 1, 1, 1,
-0.4635375, 1.526626, -0.3420935, 1, 0, 0, 1, 1,
-0.456343, 1.414679, 1.224732, 1, 0, 0, 1, 1,
-0.4526575, 0.1115043, 0.9559983, 1, 0, 0, 1, 1,
-0.4521769, 0.1645387, -0.7467666, 1, 0, 0, 1, 1,
-0.4480337, 0.05637022, -1.153284, 1, 0, 0, 1, 1,
-0.4410649, 0.5929552, -0.2633369, 0, 0, 0, 1, 1,
-0.4404227, -2.035696, -1.088181, 0, 0, 0, 1, 1,
-0.4357623, -0.05552943, -2.226994, 0, 0, 0, 1, 1,
-0.4326166, 1.196609, -0.1743239, 0, 0, 0, 1, 1,
-0.4315814, -1.461088, -4.170029, 0, 0, 0, 1, 1,
-0.4283467, 2.343796, -0.30437, 0, 0, 0, 1, 1,
-0.4199635, -0.3582434, -1.732135, 0, 0, 0, 1, 1,
-0.4181917, -0.0857001, -1.603627, 1, 1, 1, 1, 1,
-0.4119702, 0.6482694, 1.214372, 1, 1, 1, 1, 1,
-0.4064222, -1.008592, -2.891833, 1, 1, 1, 1, 1,
-0.4053901, -0.5484552, -3.165483, 1, 1, 1, 1, 1,
-0.4043038, 0.3932524, -1.996457, 1, 1, 1, 1, 1,
-0.4038704, 1.57543, -0.7576796, 1, 1, 1, 1, 1,
-0.4023379, -2.768402, -3.446288, 1, 1, 1, 1, 1,
-0.3973048, -0.4318601, -3.277581, 1, 1, 1, 1, 1,
-0.3964927, 0.380907, -0.6283109, 1, 1, 1, 1, 1,
-0.3721808, -0.5496143, -3.428997, 1, 1, 1, 1, 1,
-0.3674642, -1.319374, -3.621258, 1, 1, 1, 1, 1,
-0.3667099, 0.7451357, -1.724352, 1, 1, 1, 1, 1,
-0.3651266, 0.261658, -1.201865, 1, 1, 1, 1, 1,
-0.3623816, -0.422524, -1.900331, 1, 1, 1, 1, 1,
-0.3565267, 0.943088, -0.2339517, 1, 1, 1, 1, 1,
-0.3539061, 0.9775286, -1.533557, 0, 0, 1, 1, 1,
-0.351513, -1.132062, -3.225347, 1, 0, 0, 1, 1,
-0.348245, -0.2346937, -1.123469, 1, 0, 0, 1, 1,
-0.3465282, 0.8507529, 0.3379469, 1, 0, 0, 1, 1,
-0.3448092, -1.321144, -2.648944, 1, 0, 0, 1, 1,
-0.3315006, -0.599236, -1.827504, 1, 0, 0, 1, 1,
-0.326849, -0.4872749, -3.379201, 0, 0, 0, 1, 1,
-0.3233486, -1.370733, -3.179564, 0, 0, 0, 1, 1,
-0.3215905, -1.960086, -4.442101, 0, 0, 0, 1, 1,
-0.3197965, 0.5395182, -0.6668286, 0, 0, 0, 1, 1,
-0.3191106, 0.7559322, -2.618485, 0, 0, 0, 1, 1,
-0.3184802, -0.6017392, -3.101147, 0, 0, 0, 1, 1,
-0.3171112, 1.465696, -1.043206, 0, 0, 0, 1, 1,
-0.3132164, -0.5767839, -3.427097, 1, 1, 1, 1, 1,
-0.3125407, 1.407888, -0.7985144, 1, 1, 1, 1, 1,
-0.3109361, -1.47896, -1.123361, 1, 1, 1, 1, 1,
-0.3099861, 0.4459006, -0.692798, 1, 1, 1, 1, 1,
-0.3048375, -0.2921605, -2.81124, 1, 1, 1, 1, 1,
-0.304146, 1.041982, -0.5884312, 1, 1, 1, 1, 1,
-0.2962538, 1.193168, -1.480973, 1, 1, 1, 1, 1,
-0.2951086, 1.336744, 0.2916859, 1, 1, 1, 1, 1,
-0.2946617, -0.2143483, -4.001228, 1, 1, 1, 1, 1,
-0.2931273, 1.437163, -1.306898, 1, 1, 1, 1, 1,
-0.2918295, -1.979255, -1.403514, 1, 1, 1, 1, 1,
-0.2890174, 1.212036, 1.310519, 1, 1, 1, 1, 1,
-0.2832596, 0.3393669, -0.6130237, 1, 1, 1, 1, 1,
-0.2811283, 1.228569, -0.704075, 1, 1, 1, 1, 1,
-0.2789507, -0.2374393, -2.718646, 1, 1, 1, 1, 1,
-0.2748952, 0.6799365, -0.04775476, 0, 0, 1, 1, 1,
-0.2713942, -1.040671, -2.061227, 1, 0, 0, 1, 1,
-0.2691515, 0.1613019, -1.671077, 1, 0, 0, 1, 1,
-0.2638426, 0.8679002, 1.025404, 1, 0, 0, 1, 1,
-0.2635267, -0.05833804, -1.932197, 1, 0, 0, 1, 1,
-0.2633628, 0.479337, -0.3853011, 1, 0, 0, 1, 1,
-0.2627518, 0.7904977, 0.4644563, 0, 0, 0, 1, 1,
-0.2585918, 0.2381436, -1.185639, 0, 0, 0, 1, 1,
-0.2545096, 2.054779, 0.3641239, 0, 0, 0, 1, 1,
-0.2498382, 0.3782005, -0.7961574, 0, 0, 0, 1, 1,
-0.2477374, -1.750915, -2.952567, 0, 0, 0, 1, 1,
-0.2431862, -0.1264389, -2.46229, 0, 0, 0, 1, 1,
-0.2412346, 0.6177043, -0.3823425, 0, 0, 0, 1, 1,
-0.2411189, -2.476439, -2.580116, 1, 1, 1, 1, 1,
-0.2397062, -1.598726, -1.691461, 1, 1, 1, 1, 1,
-0.2383038, 1.185295, -1.379971, 1, 1, 1, 1, 1,
-0.2354647, 1.367146, 1.070566, 1, 1, 1, 1, 1,
-0.2328183, 0.8923275, 0.1625823, 1, 1, 1, 1, 1,
-0.2326867, 1.092724, -1.978395, 1, 1, 1, 1, 1,
-0.2320892, 0.3091139, 0.9237265, 1, 1, 1, 1, 1,
-0.2292155, 0.1955616, -0.1574142, 1, 1, 1, 1, 1,
-0.2275719, -0.1110284, -1.815557, 1, 1, 1, 1, 1,
-0.2268274, 0.6221299, -1.391482, 1, 1, 1, 1, 1,
-0.221572, 0.7080696, 0.2327405, 1, 1, 1, 1, 1,
-0.2200749, 0.7438249, 0.4900321, 1, 1, 1, 1, 1,
-0.2151916, -1.147658, -3.754779, 1, 1, 1, 1, 1,
-0.2111046, 0.3593122, -0.2424038, 1, 1, 1, 1, 1,
-0.2101746, 0.4894503, 0.4949584, 1, 1, 1, 1, 1,
-0.2059374, 0.2457079, -0.6037257, 0, 0, 1, 1, 1,
-0.2034965, -0.5015018, -1.212094, 1, 0, 0, 1, 1,
-0.2027515, -0.3961724, -3.866514, 1, 0, 0, 1, 1,
-0.2017656, 0.5570322, -1.660209, 1, 0, 0, 1, 1,
-0.1990687, -0.03262959, -0.6830705, 1, 0, 0, 1, 1,
-0.1985671, -0.231421, -3.865146, 1, 0, 0, 1, 1,
-0.1965171, -1.429927, -4.638214, 0, 0, 0, 1, 1,
-0.1935554, 0.8477356, -0.5389125, 0, 0, 0, 1, 1,
-0.1926528, -0.1575739, -1.18313, 0, 0, 0, 1, 1,
-0.1921394, 0.1866418, -0.7793617, 0, 0, 0, 1, 1,
-0.1912332, -0.1450843, -0.2971404, 0, 0, 0, 1, 1,
-0.1904218, 0.8835275, 0.3596568, 0, 0, 0, 1, 1,
-0.1865472, 0.8843664, -0.1491239, 0, 0, 0, 1, 1,
-0.1829417, 0.29378, -0.4117735, 1, 1, 1, 1, 1,
-0.1791893, 1.87481, -0.7116201, 1, 1, 1, 1, 1,
-0.1771052, -0.1153303, -2.643483, 1, 1, 1, 1, 1,
-0.1763766, -0.5553904, -1.152428, 1, 1, 1, 1, 1,
-0.1763756, 0.8361269, -1.111263, 1, 1, 1, 1, 1,
-0.1737702, 0.1925807, -0.06983586, 1, 1, 1, 1, 1,
-0.1711008, -0.6251853, -2.724474, 1, 1, 1, 1, 1,
-0.1697325, -0.5518895, -2.058507, 1, 1, 1, 1, 1,
-0.1695829, -1.90832, -1.983157, 1, 1, 1, 1, 1,
-0.1669873, -1.243089, -1.76159, 1, 1, 1, 1, 1,
-0.164706, 1.410793, -0.5317035, 1, 1, 1, 1, 1,
-0.1614232, -2.283418, -2.662554, 1, 1, 1, 1, 1,
-0.1590334, 0.5237639, -1.102305, 1, 1, 1, 1, 1,
-0.1574598, 1.447962, 0.8344184, 1, 1, 1, 1, 1,
-0.1570403, -0.3322375, -2.049477, 1, 1, 1, 1, 1,
-0.1515157, -0.467568, -2.078433, 0, 0, 1, 1, 1,
-0.1505784, 0.5367758, 0.2616327, 1, 0, 0, 1, 1,
-0.1503788, -1.281905, -3.245158, 1, 0, 0, 1, 1,
-0.1493816, -1.591733, -2.103553, 1, 0, 0, 1, 1,
-0.1366141, -0.2587511, -3.048906, 1, 0, 0, 1, 1,
-0.1346347, 0.5525213, 1.884195, 1, 0, 0, 1, 1,
-0.1330331, 0.9156466, -0.6154638, 0, 0, 0, 1, 1,
-0.132841, -0.2202777, -1.981291, 0, 0, 0, 1, 1,
-0.1319993, -1.935319, -3.449673, 0, 0, 0, 1, 1,
-0.1310494, -1.750739, -4.009976, 0, 0, 0, 1, 1,
-0.1297027, -0.3166391, -4.467927, 0, 0, 0, 1, 1,
-0.1293374, -1.06348, -3.155488, 0, 0, 0, 1, 1,
-0.1271151, -0.7723343, -3.326305, 0, 0, 0, 1, 1,
-0.1193583, -1.035008, -2.501801, 1, 1, 1, 1, 1,
-0.1188711, 1.317845, -1.243696, 1, 1, 1, 1, 1,
-0.1132596, -0.4882007, -1.346005, 1, 1, 1, 1, 1,
-0.1106168, 1.530366, 0.1642146, 1, 1, 1, 1, 1,
-0.1083632, -0.6323021, -3.363484, 1, 1, 1, 1, 1,
-0.1048918, 1.353404, -1.974725, 1, 1, 1, 1, 1,
-0.1048073, 1.529959, 2.068966, 1, 1, 1, 1, 1,
-0.1046465, -0.9613994, -3.309728, 1, 1, 1, 1, 1,
-0.1030414, -0.1074358, -3.644315, 1, 1, 1, 1, 1,
-0.1023148, -0.3365389, -3.117822, 1, 1, 1, 1, 1,
-0.1010398, 0.2742286, -0.7318641, 1, 1, 1, 1, 1,
-0.09794765, -1.128884, -2.251937, 1, 1, 1, 1, 1,
-0.09746139, -0.1653419, -1.742112, 1, 1, 1, 1, 1,
-0.09709201, 0.628351, -1.039779, 1, 1, 1, 1, 1,
-0.0914003, -1.931698, -1.582254, 1, 1, 1, 1, 1,
-0.0892037, 0.09453503, -0.9552342, 0, 0, 1, 1, 1,
-0.08845539, -1.003226, -3.228103, 1, 0, 0, 1, 1,
-0.0794703, -0.6907049, -3.914342, 1, 0, 0, 1, 1,
-0.07828458, -0.2526126, -2.916244, 1, 0, 0, 1, 1,
-0.07604137, -0.8647462, -4.238929, 1, 0, 0, 1, 1,
-0.07554989, 1.154437, -1.073838, 1, 0, 0, 1, 1,
-0.0754564, -1.759145, -2.216773, 0, 0, 0, 1, 1,
-0.07348114, 0.4959645, -0.9310625, 0, 0, 0, 1, 1,
-0.07261264, 1.464216, -0.005029457, 0, 0, 0, 1, 1,
-0.07090659, -1.607487, -3.456568, 0, 0, 0, 1, 1,
-0.06922454, 0.9564994, -1.502657, 0, 0, 0, 1, 1,
-0.06824677, 2.354153, -0.6528918, 0, 0, 0, 1, 1,
-0.06403139, -1.72863, -3.076668, 0, 0, 0, 1, 1,
-0.05936201, -1.056808, -2.047498, 1, 1, 1, 1, 1,
-0.0533395, -0.1434354, -2.493236, 1, 1, 1, 1, 1,
-0.05310379, 2.574797, 0.5987638, 1, 1, 1, 1, 1,
-0.0460736, 0.322531, -1.942465, 1, 1, 1, 1, 1,
-0.04050182, 0.7813618, -0.7579803, 1, 1, 1, 1, 1,
-0.038073, -1.313896, -3.064952, 1, 1, 1, 1, 1,
-0.0266919, 0.1217699, 0.3036452, 1, 1, 1, 1, 1,
-0.02650439, -1.218199, -3.515102, 1, 1, 1, 1, 1,
-0.02358204, -0.4189775, -4.177691, 1, 1, 1, 1, 1,
-0.0229975, -1.606082, -1.699012, 1, 1, 1, 1, 1,
-0.02293608, 0.44449, 0.5186962, 1, 1, 1, 1, 1,
-0.01525158, 0.5375715, 1.406487, 1, 1, 1, 1, 1,
-0.01242172, 0.2535798, 0.6240142, 1, 1, 1, 1, 1,
-0.01109674, -2.448682, -2.75018, 1, 1, 1, 1, 1,
-0.008065666, -0.3856734, -1.988011, 1, 1, 1, 1, 1,
-0.006065786, 0.3361129, 2.07419, 0, 0, 1, 1, 1,
-0.005711447, -2.268582, -3.431858, 1, 0, 0, 1, 1,
-0.000303985, 0.9141791, -0.955503, 1, 0, 0, 1, 1,
0.0003314213, -0.043713, 4.683744, 1, 0, 0, 1, 1,
0.004246775, -0.4405639, 4.261985, 1, 0, 0, 1, 1,
0.006134134, 0.2654899, 0.2919871, 1, 0, 0, 1, 1,
0.007173498, 0.4508265, -0.6599666, 0, 0, 0, 1, 1,
0.008601153, 1.014796, 0.2631161, 0, 0, 0, 1, 1,
0.008790603, 0.6663641, 0.2495761, 0, 0, 0, 1, 1,
0.009285472, -0.4289526, 4.129137, 0, 0, 0, 1, 1,
0.009462805, -1.988792, 1.938596, 0, 0, 0, 1, 1,
0.01136296, 0.07400927, -0.2315156, 0, 0, 0, 1, 1,
0.01183317, 0.797126, 1.402548, 0, 0, 0, 1, 1,
0.0139291, 0.1969722, -1.877504, 1, 1, 1, 1, 1,
0.01553914, -1.67003, 3.798392, 1, 1, 1, 1, 1,
0.01818046, -1.456744, 2.2093, 1, 1, 1, 1, 1,
0.02400058, 1.29009, -0.756302, 1, 1, 1, 1, 1,
0.02545768, 0.852745, -1.731063, 1, 1, 1, 1, 1,
0.02557022, -0.6563126, 1.240324, 1, 1, 1, 1, 1,
0.02657343, -0.8356593, 2.401709, 1, 1, 1, 1, 1,
0.03011636, 1.992009, 0.8601425, 1, 1, 1, 1, 1,
0.03592306, -0.3500118, 4.141798, 1, 1, 1, 1, 1,
0.04035141, -0.4472013, 4.396218, 1, 1, 1, 1, 1,
0.04178837, -1.208501, 2.446933, 1, 1, 1, 1, 1,
0.04186274, 0.03434931, 0.43094, 1, 1, 1, 1, 1,
0.04539839, 1.220611, 0.5871381, 1, 1, 1, 1, 1,
0.04830579, -0.4881211, 3.018992, 1, 1, 1, 1, 1,
0.05069938, 0.1996278, -0.2543522, 1, 1, 1, 1, 1,
0.05203409, 0.7604272, 0.2821928, 0, 0, 1, 1, 1,
0.05371163, -2.180228, 3.443838, 1, 0, 0, 1, 1,
0.06224051, -1.481507, 4.611645, 1, 0, 0, 1, 1,
0.06263581, 1.49172, 0.7120449, 1, 0, 0, 1, 1,
0.06940641, -1.407633, 4.082522, 1, 0, 0, 1, 1,
0.07332004, 0.6807489, 0.7856268, 1, 0, 0, 1, 1,
0.0735801, 0.7510915, -1.719354, 0, 0, 0, 1, 1,
0.07736181, -0.1836515, 1.466195, 0, 0, 0, 1, 1,
0.07770632, 1.604232, 2.241956, 0, 0, 0, 1, 1,
0.08147223, -0.01839524, 1.762556, 0, 0, 0, 1, 1,
0.08434156, 0.248105, -0.396378, 0, 0, 0, 1, 1,
0.08519194, -0.9319084, 3.37236, 0, 0, 0, 1, 1,
0.0906928, 0.8937863, 0.443791, 0, 0, 0, 1, 1,
0.09154828, 0.5941889, 0.7394123, 1, 1, 1, 1, 1,
0.09277243, -0.5419192, 3.445339, 1, 1, 1, 1, 1,
0.09675159, 0.8138512, -0.06009677, 1, 1, 1, 1, 1,
0.09862512, 0.1164945, 1.041904, 1, 1, 1, 1, 1,
0.1055649, 1.372318, 0.2733032, 1, 1, 1, 1, 1,
0.1057828, 0.3497652, -2.077107, 1, 1, 1, 1, 1,
0.105944, -0.3596673, 3.358628, 1, 1, 1, 1, 1,
0.1115778, 1.117363, -0.5350115, 1, 1, 1, 1, 1,
0.1164236, -0.02224886, 2.636041, 1, 1, 1, 1, 1,
0.1181733, 0.8437101, 0.08442724, 1, 1, 1, 1, 1,
0.1259505, -0.86027, 2.787537, 1, 1, 1, 1, 1,
0.1308357, -0.2359648, 2.101071, 1, 1, 1, 1, 1,
0.1333024, 0.2603438, -2.625193, 1, 1, 1, 1, 1,
0.1380043, 1.301073, 0.2954936, 1, 1, 1, 1, 1,
0.1412655, 0.750785, 1.104015, 1, 1, 1, 1, 1,
0.1478255, 0.9303665, 0.7970719, 0, 0, 1, 1, 1,
0.1507661, -0.07603292, 2.254793, 1, 0, 0, 1, 1,
0.1510319, 0.4003577, -1.033243, 1, 0, 0, 1, 1,
0.1520382, -1.274499, 2.636122, 1, 0, 0, 1, 1,
0.1526208, 0.8721235, -1.037721, 1, 0, 0, 1, 1,
0.1529837, -1.341401, 2.477267, 1, 0, 0, 1, 1,
0.1531318, -0.9846291, 2.477992, 0, 0, 0, 1, 1,
0.1535787, 0.9386265, -1.555317, 0, 0, 0, 1, 1,
0.156065, 1.102089, 0.6659613, 0, 0, 0, 1, 1,
0.1604872, -0.7169783, 1.420881, 0, 0, 0, 1, 1,
0.1613911, -0.2581839, 4.061428, 0, 0, 0, 1, 1,
0.1614578, 0.5300879, 1.755589, 0, 0, 0, 1, 1,
0.1655199, -0.131269, 2.71672, 0, 0, 0, 1, 1,
0.1694936, 2.099362, 0.3558174, 1, 1, 1, 1, 1,
0.1707359, -0.02742971, 2.899401, 1, 1, 1, 1, 1,
0.1710055, 1.435031, -0.3737531, 1, 1, 1, 1, 1,
0.1719367, 0.9973352, -0.6992424, 1, 1, 1, 1, 1,
0.1731716, 1.574179, 0.0715436, 1, 1, 1, 1, 1,
0.1743466, 1.534507, 0.145373, 1, 1, 1, 1, 1,
0.1770622, -0.2705006, 0.9171133, 1, 1, 1, 1, 1,
0.1808287, -0.9215956, 2.084724, 1, 1, 1, 1, 1,
0.1827158, 0.3758495, 0.9215001, 1, 1, 1, 1, 1,
0.1856138, -0.2300043, 2.600114, 1, 1, 1, 1, 1,
0.1882184, 0.4360676, 0.3784136, 1, 1, 1, 1, 1,
0.1903481, 0.7293928, -0.6225915, 1, 1, 1, 1, 1,
0.1929462, -0.4237015, 2.846584, 1, 1, 1, 1, 1,
0.1964579, 0.4221188, 1.285266, 1, 1, 1, 1, 1,
0.1971746, 0.4383908, -0.3387759, 1, 1, 1, 1, 1,
0.1982746, -0.4006402, 4.103998, 0, 0, 1, 1, 1,
0.1987445, 0.8490191, 1.962231, 1, 0, 0, 1, 1,
0.2006407, -1.411444, 2.377375, 1, 0, 0, 1, 1,
0.201434, -1.055894, 3.484604, 1, 0, 0, 1, 1,
0.2018466, -2.861212, 2.893806, 1, 0, 0, 1, 1,
0.2028168, -1.594285, 2.800293, 1, 0, 0, 1, 1,
0.2052059, -0.3857456, 3.965387, 0, 0, 0, 1, 1,
0.2058154, 0.6224036, 0.9002321, 0, 0, 0, 1, 1,
0.2068095, 0.3853883, 0.7852401, 0, 0, 0, 1, 1,
0.2072477, 0.07056087, 2.664294, 0, 0, 0, 1, 1,
0.2094688, -0.5250321, 2.400468, 0, 0, 0, 1, 1,
0.2097997, 1.681848, 0.2373237, 0, 0, 0, 1, 1,
0.2124602, -0.4346943, 2.888533, 0, 0, 0, 1, 1,
0.2154169, 0.6045135, -0.3108178, 1, 1, 1, 1, 1,
0.2215905, -1.352207, 2.325566, 1, 1, 1, 1, 1,
0.2229984, -0.6933175, 1.042427, 1, 1, 1, 1, 1,
0.2246908, -0.7855952, 2.348231, 1, 1, 1, 1, 1,
0.2248462, -0.4963345, 2.59391, 1, 1, 1, 1, 1,
0.2261252, -1.587895, 2.541821, 1, 1, 1, 1, 1,
0.2292296, 0.4518881, 1.184861, 1, 1, 1, 1, 1,
0.2301255, -0.3985648, 4.221671, 1, 1, 1, 1, 1,
0.2305675, -1.452176, 4.090055, 1, 1, 1, 1, 1,
0.2310327, 0.4122089, 0.6222941, 1, 1, 1, 1, 1,
0.2332766, 0.4735999, -0.6756577, 1, 1, 1, 1, 1,
0.2362964, 1.344947, 2.604067, 1, 1, 1, 1, 1,
0.236874, 1.152498, 1.305119, 1, 1, 1, 1, 1,
0.2456457, -0.5815855, 2.126487, 1, 1, 1, 1, 1,
0.2468232, -2.415518, 6.20571, 1, 1, 1, 1, 1,
0.2471262, -0.9857407, 1.763245, 0, 0, 1, 1, 1,
0.2477497, -1.286856, 0.5162914, 1, 0, 0, 1, 1,
0.2488884, 0.8352359, 0.5354301, 1, 0, 0, 1, 1,
0.2501605, 1.173198, 0.6380993, 1, 0, 0, 1, 1,
0.2557089, -0.7413183, 3.115345, 1, 0, 0, 1, 1,
0.2563579, -0.9235457, 2.483635, 1, 0, 0, 1, 1,
0.2566444, 0.4448342, 0.1384041, 0, 0, 0, 1, 1,
0.2604185, 0.8824518, -0.7150463, 0, 0, 0, 1, 1,
0.2605492, -0.8246347, 1.422701, 0, 0, 0, 1, 1,
0.2674538, -0.02307257, 2.467777, 0, 0, 0, 1, 1,
0.2691492, 1.573552, 1.355899, 0, 0, 0, 1, 1,
0.273708, -1.837871, 4.249424, 0, 0, 0, 1, 1,
0.2759001, -0.4245996, 4.201001, 0, 0, 0, 1, 1,
0.2784194, 0.3023624, 0.8426085, 1, 1, 1, 1, 1,
0.2890236, 0.1402902, 1.052979, 1, 1, 1, 1, 1,
0.2918454, -1.074008, 3.421835, 1, 1, 1, 1, 1,
0.2942218, 0.2735635, -0.818581, 1, 1, 1, 1, 1,
0.2980942, 0.7538294, -0.1080561, 1, 1, 1, 1, 1,
0.2983102, 0.724916, -0.3890247, 1, 1, 1, 1, 1,
0.3000052, -1.289353, 3.252046, 1, 1, 1, 1, 1,
0.3008298, 0.236147, 1.167019, 1, 1, 1, 1, 1,
0.3048094, 0.414965, 0.7842238, 1, 1, 1, 1, 1,
0.312221, -1.388637, 1.337022, 1, 1, 1, 1, 1,
0.3210294, 0.3523909, 0.05416223, 1, 1, 1, 1, 1,
0.3217762, -2.095266, 2.825961, 1, 1, 1, 1, 1,
0.3241748, -1.036313, 3.717136, 1, 1, 1, 1, 1,
0.3280304, 1.704683, 1.885671, 1, 1, 1, 1, 1,
0.3293836, -0.4273082, 1.008834, 1, 1, 1, 1, 1,
0.334154, 1.021265, 1.789108, 0, 0, 1, 1, 1,
0.3376253, 0.06083728, 0.2135563, 1, 0, 0, 1, 1,
0.3484592, 1.319425, -1.068747, 1, 0, 0, 1, 1,
0.3498596, 2.213602, 1.057996, 1, 0, 0, 1, 1,
0.3515833, 0.9578737, 1.224427, 1, 0, 0, 1, 1,
0.3557029, -0.756181, 0.4331753, 1, 0, 0, 1, 1,
0.355728, 0.7606567, 0.708206, 0, 0, 0, 1, 1,
0.3575422, 0.9597312, -1.060039, 0, 0, 0, 1, 1,
0.3617893, 0.1606786, 1.249018, 0, 0, 0, 1, 1,
0.3621176, 0.5345674, -0.3750394, 0, 0, 0, 1, 1,
0.3663316, -1.531957, 3.156136, 0, 0, 0, 1, 1,
0.3699198, -0.2247512, 0.899305, 0, 0, 0, 1, 1,
0.3703546, 0.18217, 0.1655808, 0, 0, 0, 1, 1,
0.3762228, 1.36391, -0.04494652, 1, 1, 1, 1, 1,
0.3838606, 0.6551995, 0.7990326, 1, 1, 1, 1, 1,
0.384773, 1.464622, 0.03604221, 1, 1, 1, 1, 1,
0.3856224, 0.02022867, 1.510203, 1, 1, 1, 1, 1,
0.3865868, -0.2122, 2.186552, 1, 1, 1, 1, 1,
0.3874088, -0.5477246, 2.71727, 1, 1, 1, 1, 1,
0.3913241, -2.368225, 3.336034, 1, 1, 1, 1, 1,
0.3936323, -0.4142951, 3.106657, 1, 1, 1, 1, 1,
0.3964148, 0.1202877, 0.5462841, 1, 1, 1, 1, 1,
0.4001325, 0.886089, 0.8654142, 1, 1, 1, 1, 1,
0.4057992, 0.820879, 0.05461825, 1, 1, 1, 1, 1,
0.4067475, 0.890089, 1.956184, 1, 1, 1, 1, 1,
0.4081175, -0.9692162, 1.747467, 1, 1, 1, 1, 1,
0.4086597, 0.2910947, 0.9728439, 1, 1, 1, 1, 1,
0.4197435, 1.365695, -0.06047799, 1, 1, 1, 1, 1,
0.4222897, -0.7725663, 2.046423, 0, 0, 1, 1, 1,
0.4231465, 0.9728792, -0.86006, 1, 0, 0, 1, 1,
0.427671, -0.7905624, 1.625697, 1, 0, 0, 1, 1,
0.4281133, -0.3603208, 2.819269, 1, 0, 0, 1, 1,
0.4309333, 0.8264233, -0.08917218, 1, 0, 0, 1, 1,
0.4373383, -0.8970159, 4.020305, 1, 0, 0, 1, 1,
0.4450804, -1.336814, 3.880031, 0, 0, 0, 1, 1,
0.4463252, -0.8085754, 2.804041, 0, 0, 0, 1, 1,
0.4548663, -1.143525, 2.291449, 0, 0, 0, 1, 1,
0.4556194, 0.4260688, 1.262115, 0, 0, 0, 1, 1,
0.4562873, -1.303465, 2.08348, 0, 0, 0, 1, 1,
0.459671, 0.1085692, 0.8809934, 0, 0, 0, 1, 1,
0.4640113, -0.4835309, 1.031891, 0, 0, 0, 1, 1,
0.4659685, 1.327288, 1.388444, 1, 1, 1, 1, 1,
0.4667921, 0.6392436, 1.608685, 1, 1, 1, 1, 1,
0.4668751, 1.467536, 0.4463442, 1, 1, 1, 1, 1,
0.472535, 0.0579896, 0.7229378, 1, 1, 1, 1, 1,
0.4777061, -0.7348985, 2.148746, 1, 1, 1, 1, 1,
0.4828207, 0.2500212, 0.360707, 1, 1, 1, 1, 1,
0.4829862, 0.124315, 1.701306, 1, 1, 1, 1, 1,
0.4842268, 0.6078472, -0.17386, 1, 1, 1, 1, 1,
0.4846144, -1.511332, 3.646609, 1, 1, 1, 1, 1,
0.4850989, 1.477087, -0.5212489, 1, 1, 1, 1, 1,
0.4859491, -0.9473899, 3.059577, 1, 1, 1, 1, 1,
0.4860833, -0.2257241, 2.937335, 1, 1, 1, 1, 1,
0.489952, 0.9777983, 0.5033051, 1, 1, 1, 1, 1,
0.4900838, 0.6165591, 1.042129, 1, 1, 1, 1, 1,
0.4953257, 0.9674569, 0.6515713, 1, 1, 1, 1, 1,
0.4963746, 0.6005502, 1.095702, 0, 0, 1, 1, 1,
0.5058394, -1.228063, 3.488058, 1, 0, 0, 1, 1,
0.5095365, -0.8777246, 4.729558, 1, 0, 0, 1, 1,
0.514094, -0.7172874, 2.069171, 1, 0, 0, 1, 1,
0.5173205, -0.5339822, 1.431264, 1, 0, 0, 1, 1,
0.5220414, 0.5437072, -0.1361862, 1, 0, 0, 1, 1,
0.5220714, -0.5540504, 2.191869, 0, 0, 0, 1, 1,
0.5235757, -0.353527, 1.295394, 0, 0, 0, 1, 1,
0.5249484, -0.9275684, 0.3254025, 0, 0, 0, 1, 1,
0.5261655, -0.3099271, 1.172794, 0, 0, 0, 1, 1,
0.5265959, -1.409817, 3.537362, 0, 0, 0, 1, 1,
0.5276662, 0.634726, 0.9894199, 0, 0, 0, 1, 1,
0.5298349, -0.2393971, 1.919987, 0, 0, 0, 1, 1,
0.5315617, 0.4852383, -1.328382, 1, 1, 1, 1, 1,
0.5323381, -0.1727265, 1.396188, 1, 1, 1, 1, 1,
0.5343008, 0.821414, 0.8973572, 1, 1, 1, 1, 1,
0.5358409, -0.2852746, 1.83437, 1, 1, 1, 1, 1,
0.5409603, 0.05182835, -0.5594215, 1, 1, 1, 1, 1,
0.5418873, 0.2012805, -0.8408465, 1, 1, 1, 1, 1,
0.542977, 0.9905553, 0.08536863, 1, 1, 1, 1, 1,
0.5430766, 0.1883839, 0.6194028, 1, 1, 1, 1, 1,
0.548093, -0.3634904, 2.098, 1, 1, 1, 1, 1,
0.5625132, -1.507127, 4.702402, 1, 1, 1, 1, 1,
0.5667282, 0.03351637, 1.59645, 1, 1, 1, 1, 1,
0.5711257, -1.317018, 3.742715, 1, 1, 1, 1, 1,
0.5718788, -0.533426, 2.892043, 1, 1, 1, 1, 1,
0.5719669, 0.8313971, -0.5476152, 1, 1, 1, 1, 1,
0.576896, 0.5063793, 1.175207, 1, 1, 1, 1, 1,
0.5781087, 0.5776889, 1.607654, 0, 0, 1, 1, 1,
0.5795755, -0.2754404, 2.629916, 1, 0, 0, 1, 1,
0.5882797, -0.3375663, 2.766274, 1, 0, 0, 1, 1,
0.5893007, 0.04528602, 1.551321, 1, 0, 0, 1, 1,
0.5980996, 3.122318, -0.7777702, 1, 0, 0, 1, 1,
0.5983942, 0.1503438, -0.2727316, 1, 0, 0, 1, 1,
0.6002208, 0.8190767, -0.3622797, 0, 0, 0, 1, 1,
0.6009907, 0.677826, 1.268516, 0, 0, 0, 1, 1,
0.6030443, -0.4883312, 2.311164, 0, 0, 0, 1, 1,
0.6034498, -0.9486732, 1.933868, 0, 0, 0, 1, 1,
0.6064215, 0.8953683, 1.105288, 0, 0, 0, 1, 1,
0.6099014, -0.8843195, 1.941983, 0, 0, 0, 1, 1,
0.6152381, -0.6498471, 3.716386, 0, 0, 0, 1, 1,
0.6175354, 1.442571, 1.298176, 1, 1, 1, 1, 1,
0.6240025, -1.442295, 1.629779, 1, 1, 1, 1, 1,
0.6269793, -1.237411, 3.490494, 1, 1, 1, 1, 1,
0.6419833, 0.6815144, 0.969699, 1, 1, 1, 1, 1,
0.6485407, 2.839029, 2.029142, 1, 1, 1, 1, 1,
0.6515009, 0.2901841, 1.954345, 1, 1, 1, 1, 1,
0.6541122, 0.01778178, 2.558525, 1, 1, 1, 1, 1,
0.6566455, 1.4525, 1.287382, 1, 1, 1, 1, 1,
0.6591675, 1.036963, 0.8745709, 1, 1, 1, 1, 1,
0.6594292, -0.2583148, 2.481564, 1, 1, 1, 1, 1,
0.6606305, -0.5738005, 2.061471, 1, 1, 1, 1, 1,
0.6690757, -0.03094521, 2.164565, 1, 1, 1, 1, 1,
0.6769391, -1.145957, 2.705514, 1, 1, 1, 1, 1,
0.6797633, 1.259107, 0.991281, 1, 1, 1, 1, 1,
0.6813357, 0.9411594, -0.5287579, 1, 1, 1, 1, 1,
0.6915061, 0.4457441, 0.4550445, 0, 0, 1, 1, 1,
0.6956961, 2.427878, 0.0356509, 1, 0, 0, 1, 1,
0.7001824, 0.2374144, 0.8343135, 1, 0, 0, 1, 1,
0.7051858, 0.3007033, 1.622825, 1, 0, 0, 1, 1,
0.7098283, 2.146236, -0.3363316, 1, 0, 0, 1, 1,
0.7165154, 0.2299933, 1.592813, 1, 0, 0, 1, 1,
0.7193125, 1.126614, 0.2323293, 0, 0, 0, 1, 1,
0.7219847, 0.02188012, 1.16229, 0, 0, 0, 1, 1,
0.7223568, -0.2162547, 3.494376, 0, 0, 0, 1, 1,
0.7228917, -0.1636235, 1.650845, 0, 0, 0, 1, 1,
0.7268538, 0.658214, 1.865982, 0, 0, 0, 1, 1,
0.7284965, 0.8772158, 0.05710405, 0, 0, 0, 1, 1,
0.7290505, -0.9973135, 2.844383, 0, 0, 0, 1, 1,
0.736609, -0.2842633, 1.867355, 1, 1, 1, 1, 1,
0.7387006, -2.826329, 3.201705, 1, 1, 1, 1, 1,
0.7401541, -1.240083, 1.798833, 1, 1, 1, 1, 1,
0.7454747, -0.2502264, 2.845505, 1, 1, 1, 1, 1,
0.7458471, -0.2998001, 2.891979, 1, 1, 1, 1, 1,
0.7510183, -2.033448, 1.800611, 1, 1, 1, 1, 1,
0.757447, 1.898628, -0.09143997, 1, 1, 1, 1, 1,
0.7584457, -1.494654, 1.678315, 1, 1, 1, 1, 1,
0.7592535, -0.08577629, 0.6997871, 1, 1, 1, 1, 1,
0.7598656, 0.1844323, 2.394247, 1, 1, 1, 1, 1,
0.7600499, -1.492677, 3.628098, 1, 1, 1, 1, 1,
0.7606822, -1.04608, 3.086167, 1, 1, 1, 1, 1,
0.7606872, -0.3025258, 2.113017, 1, 1, 1, 1, 1,
0.7647829, 1.219264, 0.1630502, 1, 1, 1, 1, 1,
0.7679326, -0.4700205, 1.039714, 1, 1, 1, 1, 1,
0.7686117, -0.5817171, 1.577937, 0, 0, 1, 1, 1,
0.7755953, -0.7284862, 0.3688155, 1, 0, 0, 1, 1,
0.7762441, 0.1045147, 2.429273, 1, 0, 0, 1, 1,
0.7768934, -1.106975, 1.637415, 1, 0, 0, 1, 1,
0.7824464, 0.9059111, 0.9062494, 1, 0, 0, 1, 1,
0.7825997, 0.06718378, -0.2439649, 1, 0, 0, 1, 1,
0.7851998, 2.109915, -0.06937236, 0, 0, 0, 1, 1,
0.7883782, -1.009575, 1.732076, 0, 0, 0, 1, 1,
0.7934824, 0.4967378, 1.405725, 0, 0, 0, 1, 1,
0.7975638, -1.033728, 0.189024, 0, 0, 0, 1, 1,
0.8013739, -0.2326011, 1.821578, 0, 0, 0, 1, 1,
0.807875, -0.1048106, 1.233858, 0, 0, 0, 1, 1,
0.8165392, -0.05515846, 1.24824, 0, 0, 0, 1, 1,
0.8172799, -0.5647233, 2.715051, 1, 1, 1, 1, 1,
0.8188348, -0.4302962, 0.1966315, 1, 1, 1, 1, 1,
0.8188691, -2.031506, 4.109004, 1, 1, 1, 1, 1,
0.8278112, 0.06690793, 1.374377, 1, 1, 1, 1, 1,
0.8319321, -1.779757, 3.242042, 1, 1, 1, 1, 1,
0.8336312, 1.202155, 2.161974, 1, 1, 1, 1, 1,
0.836283, -0.3427071, 1.643874, 1, 1, 1, 1, 1,
0.8370945, -1.490121, 2.749087, 1, 1, 1, 1, 1,
0.837343, -2.083781, 2.047899, 1, 1, 1, 1, 1,
0.8377091, -0.03530446, 1.141605, 1, 1, 1, 1, 1,
0.8409476, -1.833069, 2.782146, 1, 1, 1, 1, 1,
0.8416135, 0.2207351, -0.4353075, 1, 1, 1, 1, 1,
0.8455455, 0.9972951, 1.789338, 1, 1, 1, 1, 1,
0.8458705, 0.1500429, 2.154403, 1, 1, 1, 1, 1,
0.848356, -0.240292, 2.015165, 1, 1, 1, 1, 1,
0.8517038, 0.4803055, 1.086555, 0, 0, 1, 1, 1,
0.8554378, -0.1634622, 2.381955, 1, 0, 0, 1, 1,
0.8568903, 0.5162166, 0.03477361, 1, 0, 0, 1, 1,
0.86161, 0.8567923, -0.03684294, 1, 0, 0, 1, 1,
0.8674118, 0.3159806, 0.1956523, 1, 0, 0, 1, 1,
0.8718998, -0.1294199, 1.054819, 1, 0, 0, 1, 1,
0.8725222, 1.166984, -0.5568683, 0, 0, 0, 1, 1,
0.8802487, 1.570386, 0.7774493, 0, 0, 0, 1, 1,
0.8848804, 1.490884, 0.6039226, 0, 0, 0, 1, 1,
0.892415, -1.083582, 1.163375, 0, 0, 0, 1, 1,
0.8928559, -0.8996857, 2.365081, 0, 0, 0, 1, 1,
0.8958553, -1.236274, 3.964593, 0, 0, 0, 1, 1,
0.9014801, -0.4678402, 1.746831, 0, 0, 0, 1, 1,
0.9030148, 1.165663, -0.8750417, 1, 1, 1, 1, 1,
0.9091584, -1.873198, 2.963694, 1, 1, 1, 1, 1,
0.9114732, 0.6090744, 1.325238, 1, 1, 1, 1, 1,
0.9184079, 2.506599, 1.574068, 1, 1, 1, 1, 1,
0.9294887, -0.1785115, 3.822155, 1, 1, 1, 1, 1,
0.9380087, -1.421903, 2.929088, 1, 1, 1, 1, 1,
0.9437342, 0.3653595, 1.412556, 1, 1, 1, 1, 1,
0.9453958, 0.7270654, 0.3169927, 1, 1, 1, 1, 1,
0.9469291, 0.5538108, 1.020682, 1, 1, 1, 1, 1,
0.9471069, 1.052702, -0.1335015, 1, 1, 1, 1, 1,
0.9577671, -1.504772, 2.885768, 1, 1, 1, 1, 1,
0.9584439, 0.4711645, 1.397666, 1, 1, 1, 1, 1,
0.9586954, -0.4086386, -0.1230668, 1, 1, 1, 1, 1,
0.959173, 1.597463, 2.308023, 1, 1, 1, 1, 1,
0.9659032, -1.037858, 3.249425, 1, 1, 1, 1, 1,
0.9715444, 0.6722192, 1.951138, 0, 0, 1, 1, 1,
0.9734567, -0.8040977, 2.796333, 1, 0, 0, 1, 1,
0.9763823, -1.156009, 1.951294, 1, 0, 0, 1, 1,
0.978245, -1.703415, 3.519176, 1, 0, 0, 1, 1,
0.9809938, 0.238093, 0.4863987, 1, 0, 0, 1, 1,
0.9888372, -0.05446616, 1.951171, 1, 0, 0, 1, 1,
0.994104, -0.3070772, 1.586447, 0, 0, 0, 1, 1,
1.001021, -0.6115243, 0.3117571, 0, 0, 0, 1, 1,
1.00473, 0.2812066, 1.880236, 0, 0, 0, 1, 1,
1.011106, 0.9255574, 1.707003, 0, 0, 0, 1, 1,
1.020248, 0.6818444, 1.92807, 0, 0, 0, 1, 1,
1.021271, -1.93295, 2.399594, 0, 0, 0, 1, 1,
1.026449, 0.790993, 1.273345, 0, 0, 0, 1, 1,
1.028227, -1.253978, 2.482673, 1, 1, 1, 1, 1,
1.030754, -0.5235037, 1.204488, 1, 1, 1, 1, 1,
1.047795, 0.6538956, 1.777812, 1, 1, 1, 1, 1,
1.05037, 1.154846, -1.478996, 1, 1, 1, 1, 1,
1.052994, 2.724148, 0.5302033, 1, 1, 1, 1, 1,
1.053792, 1.937748, 0.4393948, 1, 1, 1, 1, 1,
1.0625, -0.1827972, 0.9944028, 1, 1, 1, 1, 1,
1.071643, -0.6374676, 0.7153754, 1, 1, 1, 1, 1,
1.077928, 0.0469474, 0.317044, 1, 1, 1, 1, 1,
1.082344, -0.9488928, 1.834304, 1, 1, 1, 1, 1,
1.083267, -0.4493879, 2.931468, 1, 1, 1, 1, 1,
1.084765, -1.525985, 2.114183, 1, 1, 1, 1, 1,
1.085212, 0.8688154, 0.001356104, 1, 1, 1, 1, 1,
1.089515, -1.166997, 2.474063, 1, 1, 1, 1, 1,
1.091858, 0.4584727, -0.07662797, 1, 1, 1, 1, 1,
1.092657, -1.489087, 1.271216, 0, 0, 1, 1, 1,
1.098101, -0.2401209, -0.530843, 1, 0, 0, 1, 1,
1.100034, 0.2522692, 0.7859176, 1, 0, 0, 1, 1,
1.100788, -0.05923223, 2.26904, 1, 0, 0, 1, 1,
1.10423, -1.261306, 2.789289, 1, 0, 0, 1, 1,
1.11326, -1.162616, 1.651886, 1, 0, 0, 1, 1,
1.118249, 0.4876237, 1.487145, 0, 0, 0, 1, 1,
1.121204, -1.232787, 2.153436, 0, 0, 0, 1, 1,
1.121729, 0.3644929, 0.9500068, 0, 0, 0, 1, 1,
1.128054, 0.4234473, 2.18099, 0, 0, 0, 1, 1,
1.134055, 0.06033182, 1.141032, 0, 0, 0, 1, 1,
1.13551, -0.1265036, -0.3181143, 0, 0, 0, 1, 1,
1.139248, 0.432631, 0.8369607, 0, 0, 0, 1, 1,
1.143895, -0.5330131, 1.98218, 1, 1, 1, 1, 1,
1.14919, 0.7757964, 0.7624153, 1, 1, 1, 1, 1,
1.150436, 0.0252536, 1.552595, 1, 1, 1, 1, 1,
1.1549, -1.508657, 3.222845, 1, 1, 1, 1, 1,
1.167405, 0.8954415, 0.4076409, 1, 1, 1, 1, 1,
1.167618, 0.7654925, 1.435269, 1, 1, 1, 1, 1,
1.176555, 0.4266252, 1.063903, 1, 1, 1, 1, 1,
1.190069, 1.706083, 0.924704, 1, 1, 1, 1, 1,
1.190414, -0.8239308, 3.025565, 1, 1, 1, 1, 1,
1.192785, 0.1653394, 1.65769, 1, 1, 1, 1, 1,
1.193951, -0.1495868, 1.35489, 1, 1, 1, 1, 1,
1.195457, 0.8762346, 0.4273299, 1, 1, 1, 1, 1,
1.201073, 1.153375, 0.766988, 1, 1, 1, 1, 1,
1.202652, -1.17004, 2.025786, 1, 1, 1, 1, 1,
1.203697, 0.2608608, -0.7028102, 1, 1, 1, 1, 1,
1.214791, -0.5295999, 2.737407, 0, 0, 1, 1, 1,
1.218281, 0.8711845, 1.368703, 1, 0, 0, 1, 1,
1.240269, 0.7384828, 0.7539732, 1, 0, 0, 1, 1,
1.259434, -0.2936363, 3.083097, 1, 0, 0, 1, 1,
1.266355, 0.1738988, 2.462999, 1, 0, 0, 1, 1,
1.267944, -0.671652, 2.270991, 1, 0, 0, 1, 1,
1.272251, 0.5606036, 1.824149, 0, 0, 0, 1, 1,
1.280824, 0.4626748, 2.043486, 0, 0, 0, 1, 1,
1.287141, -1.763679, 1.737761, 0, 0, 0, 1, 1,
1.290824, 1.244716, 1.548958, 0, 0, 0, 1, 1,
1.299755, 0.3639717, 1.802065, 0, 0, 0, 1, 1,
1.300793, -0.353326, 1.785831, 0, 0, 0, 1, 1,
1.30296, -1.483424, 1.041865, 0, 0, 0, 1, 1,
1.30651, 1.115219, 2.791705, 1, 1, 1, 1, 1,
1.318878, -1.750956, 2.537231, 1, 1, 1, 1, 1,
1.319999, -0.1393076, 1.556438, 1, 1, 1, 1, 1,
1.322936, 0.1424402, 1.398446, 1, 1, 1, 1, 1,
1.329934, -0.5619609, 1.490844, 1, 1, 1, 1, 1,
1.330829, 1.338147, 0.7777164, 1, 1, 1, 1, 1,
1.332955, -0.5952285, -0.1590821, 1, 1, 1, 1, 1,
1.354757, 1.497126, 0.6387612, 1, 1, 1, 1, 1,
1.360337, -0.4197851, 1.971178, 1, 1, 1, 1, 1,
1.386767, 0.9818136, 1.713505, 1, 1, 1, 1, 1,
1.391602, 0.7144136, 1.090658, 1, 1, 1, 1, 1,
1.401827, -1.596047, 2.820258, 1, 1, 1, 1, 1,
1.407305, -0.3296529, 0.3496482, 1, 1, 1, 1, 1,
1.418114, 1.152023, 0.1346108, 1, 1, 1, 1, 1,
1.419767, 0.06582356, -0.05345284, 1, 1, 1, 1, 1,
1.43006, -0.2202332, 0.7427239, 0, 0, 1, 1, 1,
1.43604, -0.9129711, 1.528793, 1, 0, 0, 1, 1,
1.439871, 0.4102769, 1.436845, 1, 0, 0, 1, 1,
1.440068, -0.865568, 0.8185952, 1, 0, 0, 1, 1,
1.445744, -0.3541126, 2.138521, 1, 0, 0, 1, 1,
1.465162, -0.976836, 1.402725, 1, 0, 0, 1, 1,
1.465627, 0.5275296, 0.2638311, 0, 0, 0, 1, 1,
1.485723, -0.331945, 1.531089, 0, 0, 0, 1, 1,
1.488229, -0.111175, 2.142771, 0, 0, 0, 1, 1,
1.49901, -0.4283993, 0.03829284, 0, 0, 0, 1, 1,
1.502466, -1.535833, 1.787848, 0, 0, 0, 1, 1,
1.505747, -1.309161, 1.958148, 0, 0, 0, 1, 1,
1.521623, -0.4262858, 2.962614, 0, 0, 0, 1, 1,
1.527013, 0.1970676, 1.959204, 1, 1, 1, 1, 1,
1.529814, 0.587329, 1.50272, 1, 1, 1, 1, 1,
1.541766, 0.1583799, 0.7690465, 1, 1, 1, 1, 1,
1.557339, 0.05357079, 2.227159, 1, 1, 1, 1, 1,
1.572488, 0.04827293, 1.466157, 1, 1, 1, 1, 1,
1.573919, 1.271961, 1.166834, 1, 1, 1, 1, 1,
1.585429, 0.2118684, 3.284324, 1, 1, 1, 1, 1,
1.588777, 1.329197, 0.8646289, 1, 1, 1, 1, 1,
1.590561, 0.1803916, 0.8859586, 1, 1, 1, 1, 1,
1.596736, -0.2621663, 2.867895, 1, 1, 1, 1, 1,
1.615017, -1.70248, 1.497079, 1, 1, 1, 1, 1,
1.622035, 1.226869, 0.006340877, 1, 1, 1, 1, 1,
1.62939, -0.2613533, 2.895564, 1, 1, 1, 1, 1,
1.649709, -0.04500768, 2.52947, 1, 1, 1, 1, 1,
1.689287, 0.3662646, 0.2149503, 1, 1, 1, 1, 1,
1.711359, -0.2630378, 1.952513, 0, 0, 1, 1, 1,
1.714694, 0.844871, 1.101618, 1, 0, 0, 1, 1,
1.715372, -1.925438, 0.9792072, 1, 0, 0, 1, 1,
1.716061, 0.7213825, 2.451676, 1, 0, 0, 1, 1,
1.730622, 0.3690009, 0.5114371, 1, 0, 0, 1, 1,
1.744998, 0.9311346, 1.523834, 1, 0, 0, 1, 1,
1.763897, -0.8023731, 1.297302, 0, 0, 0, 1, 1,
1.770078, 0.3460132, 1.330626, 0, 0, 0, 1, 1,
1.772496, -0.1935115, 2.016206, 0, 0, 0, 1, 1,
1.778102, 0.48027, 0.8117121, 0, 0, 0, 1, 1,
1.785224, -2.031846, 1.699353, 0, 0, 0, 1, 1,
1.78957, -0.6304727, 1.549295, 0, 0, 0, 1, 1,
1.790402, 1.026924, 1.715831, 0, 0, 0, 1, 1,
1.818728, 1.011197, 1.766714, 1, 1, 1, 1, 1,
1.829974, 0.6567351, 2.130457, 1, 1, 1, 1, 1,
1.854437, -1.884836, 2.098948, 1, 1, 1, 1, 1,
1.85469, 0.7378954, -0.03949553, 1, 1, 1, 1, 1,
1.856068, -0.8086214, 3.277335, 1, 1, 1, 1, 1,
1.887309, -0.6619486, 1.325647, 1, 1, 1, 1, 1,
1.936617, -1.459307, 1.194796, 1, 1, 1, 1, 1,
1.953564, -0.3628331, 3.092304, 1, 1, 1, 1, 1,
1.980279, 1.321885, 0.5108625, 1, 1, 1, 1, 1,
1.99135, 1.943271, 1.249065, 1, 1, 1, 1, 1,
1.995628, -1.689285, 2.023114, 1, 1, 1, 1, 1,
2.025549, 1.065926, 0.5776662, 1, 1, 1, 1, 1,
2.037699, 0.0316043, 1.499565, 1, 1, 1, 1, 1,
2.039032, 1.880941, -1.535131, 1, 1, 1, 1, 1,
2.072317, 0.3776787, 1.748499, 1, 1, 1, 1, 1,
2.099024, 0.8247259, 1.343369, 0, 0, 1, 1, 1,
2.104513, -0.6855435, 2.091014, 1, 0, 0, 1, 1,
2.144404, 0.2673344, 2.101989, 1, 0, 0, 1, 1,
2.218449, 0.7291937, 0.6776289, 1, 0, 0, 1, 1,
2.316602, 0.07212756, 2.262183, 1, 0, 0, 1, 1,
2.333455, 0.3634147, 2.771061, 1, 0, 0, 1, 1,
2.343466, 0.02999115, 1.332345, 0, 0, 0, 1, 1,
2.350086, 0.4157213, 0.8648667, 0, 0, 0, 1, 1,
2.369056, -0.7420976, 2.044007, 0, 0, 0, 1, 1,
2.389634, -0.9175797, 1.10694, 0, 0, 0, 1, 1,
2.433432, 1.574626, 1.159963, 0, 0, 0, 1, 1,
2.434604, 0.5424495, 2.314574, 0, 0, 0, 1, 1,
2.517271, -1.347374, 0.6309411, 0, 0, 0, 1, 1,
2.550086, -0.3992066, 3.730347, 1, 1, 1, 1, 1,
2.619936, 0.8890855, 0.8497652, 1, 1, 1, 1, 1,
2.786597, 1.159297, 0.4898095, 1, 1, 1, 1, 1,
2.889542, -0.4179346, 1.957831, 1, 1, 1, 1, 1,
3.037297, 1.76065, 0.6520446, 1, 1, 1, 1, 1,
3.152492, -0.4303178, 0.7318911, 1, 1, 1, 1, 1,
3.215353, 2.387352, -0.2092981, 1, 1, 1, 1, 1
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
var radius = 10.17053;
var distance = 35.72355;
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
mvMatrix.translate( -0.2558914, -0.003217936, 0.06360698 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.72355);
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
