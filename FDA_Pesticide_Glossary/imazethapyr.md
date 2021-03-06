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
-2.769419, 0.1636731, -0.833009, 1, 0, 0, 1,
-2.645102, -2.381144, -1.610441, 1, 0.007843138, 0, 1,
-2.623957, -0.3332421, -3.209459, 1, 0.01176471, 0, 1,
-2.611635, 1.304775, -1.257813, 1, 0.01960784, 0, 1,
-2.522071, 0.6930599, -4.093553, 1, 0.02352941, 0, 1,
-2.434891, 1.51293, -2.243393, 1, 0.03137255, 0, 1,
-2.429425, -0.8848547, -1.850142, 1, 0.03529412, 0, 1,
-2.392239, 0.4123814, -1.290139, 1, 0.04313726, 0, 1,
-2.388963, 0.4487423, -0.9427929, 1, 0.04705882, 0, 1,
-2.351188, -3.132134, -4.298917, 1, 0.05490196, 0, 1,
-2.349938, 0.004974322, -0.9847327, 1, 0.05882353, 0, 1,
-2.305935, -2.619029, -2.629892, 1, 0.06666667, 0, 1,
-2.29525, -0.1826833, -0.9510313, 1, 0.07058824, 0, 1,
-2.293894, -0.5263117, -1.299857, 1, 0.07843138, 0, 1,
-2.282557, -0.4092119, -1.482637, 1, 0.08235294, 0, 1,
-2.247882, 0.2690669, -0.3311822, 1, 0.09019608, 0, 1,
-2.242889, 0.4501806, -0.9680773, 1, 0.09411765, 0, 1,
-2.194107, -0.7035424, -1.914572, 1, 0.1019608, 0, 1,
-2.157387, 0.01332592, -1.795295, 1, 0.1098039, 0, 1,
-2.143419, 0.8448796, -1.459258, 1, 0.1137255, 0, 1,
-2.050332, 0.4386505, -2.227558, 1, 0.1215686, 0, 1,
-2.040566, 1.779393, 0.1222518, 1, 0.1254902, 0, 1,
-2.024071, 1.620545, 0.8196431, 1, 0.1333333, 0, 1,
-2.00893, 1.342563, -0.1694559, 1, 0.1372549, 0, 1,
-1.992797, -1.872271, -1.493611, 1, 0.145098, 0, 1,
-1.966461, -1.489292, -1.426726, 1, 0.1490196, 0, 1,
-1.923928, 1.377737, -0.4129107, 1, 0.1568628, 0, 1,
-1.923795, 0.4863221, 0.6627225, 1, 0.1607843, 0, 1,
-1.904525, 0.01233496, -1.686396, 1, 0.1686275, 0, 1,
-1.885904, 0.1977355, -2.101734, 1, 0.172549, 0, 1,
-1.868657, 1.3857, -0.8027499, 1, 0.1803922, 0, 1,
-1.853252, 0.06084264, -1.91986, 1, 0.1843137, 0, 1,
-1.840298, -0.9478158, -2.458907, 1, 0.1921569, 0, 1,
-1.837826, 0.5715798, -2.843123, 1, 0.1960784, 0, 1,
-1.835201, 0.004295004, -0.4876898, 1, 0.2039216, 0, 1,
-1.811381, -1.624614, -1.592646, 1, 0.2117647, 0, 1,
-1.808658, 0.378017, -1.476072, 1, 0.2156863, 0, 1,
-1.782081, -0.7475446, -1.276253, 1, 0.2235294, 0, 1,
-1.764879, -1.281716, -4.063708, 1, 0.227451, 0, 1,
-1.761119, -0.1930586, -1.219683, 1, 0.2352941, 0, 1,
-1.72576, 1.244272, 2.236249, 1, 0.2392157, 0, 1,
-1.722937, 0.9206269, 2.455119, 1, 0.2470588, 0, 1,
-1.722697, 0.7763458, -0.2873519, 1, 0.2509804, 0, 1,
-1.720134, 2.045352, -0.8414149, 1, 0.2588235, 0, 1,
-1.71382, -0.07593236, 0.1566121, 1, 0.2627451, 0, 1,
-1.696901, 1.342029, -1.442742, 1, 0.2705882, 0, 1,
-1.696419, 1.274856, -0.717478, 1, 0.2745098, 0, 1,
-1.688817, 1.570533, -0.8238934, 1, 0.282353, 0, 1,
-1.682829, 1.296868, -2.833377, 1, 0.2862745, 0, 1,
-1.670528, 0.5008705, -0.9581037, 1, 0.2941177, 0, 1,
-1.660347, -0.7879111, -3.428832, 1, 0.3019608, 0, 1,
-1.65706, 0.9021736, -3.150978, 1, 0.3058824, 0, 1,
-1.651251, 1.127074, -1.219499, 1, 0.3137255, 0, 1,
-1.640593, -0.392423, -1.437452, 1, 0.3176471, 0, 1,
-1.639257, -1.230848, -2.531799, 1, 0.3254902, 0, 1,
-1.637322, 1.145227, -0.6645318, 1, 0.3294118, 0, 1,
-1.633624, -0.06298625, -2.709047, 1, 0.3372549, 0, 1,
-1.630713, 0.3595079, -2.069431, 1, 0.3411765, 0, 1,
-1.62849, -0.9629073, -3.584453, 1, 0.3490196, 0, 1,
-1.624111, -0.7304526, -1.982817, 1, 0.3529412, 0, 1,
-1.621776, -0.4884912, -1.943493, 1, 0.3607843, 0, 1,
-1.613857, -0.6367069, -2.114197, 1, 0.3647059, 0, 1,
-1.608076, -0.6142045, -3.219849, 1, 0.372549, 0, 1,
-1.60445, 0.3339358, -2.317291, 1, 0.3764706, 0, 1,
-1.598889, -0.6600653, -2.69953, 1, 0.3843137, 0, 1,
-1.590319, -1.494363, -2.547496, 1, 0.3882353, 0, 1,
-1.589238, 0.001679857, -1.220408, 1, 0.3960784, 0, 1,
-1.585003, -1.454515, -3.261743, 1, 0.4039216, 0, 1,
-1.567459, -0.7714159, -1.450987, 1, 0.4078431, 0, 1,
-1.567184, 3.968891, 1.040014, 1, 0.4156863, 0, 1,
-1.562837, 1.060842, 1.306669, 1, 0.4196078, 0, 1,
-1.555965, -0.06114833, -2.493085, 1, 0.427451, 0, 1,
-1.554131, -1.257954, -2.270492, 1, 0.4313726, 0, 1,
-1.539335, -1.801948, -2.836098, 1, 0.4392157, 0, 1,
-1.526854, 0.6651984, -3.381059, 1, 0.4431373, 0, 1,
-1.523853, 0.254474, -1.62375, 1, 0.4509804, 0, 1,
-1.514067, -1.52057, -2.057025, 1, 0.454902, 0, 1,
-1.506617, -0.8423905, -3.492194, 1, 0.4627451, 0, 1,
-1.503828, -0.1755415, -2.288159, 1, 0.4666667, 0, 1,
-1.481116, -0.9294654, -2.608452, 1, 0.4745098, 0, 1,
-1.480106, 1.639061, -0.2087086, 1, 0.4784314, 0, 1,
-1.479914, 0.9578183, 0.1182443, 1, 0.4862745, 0, 1,
-1.477886, 1.618847, -0.9129889, 1, 0.4901961, 0, 1,
-1.472273, 0.4710795, -1.314426, 1, 0.4980392, 0, 1,
-1.468182, -0.2539569, -1.940035, 1, 0.5058824, 0, 1,
-1.467274, 1.004758, -0.5334986, 1, 0.509804, 0, 1,
-1.458836, 0.5311036, -0.3604534, 1, 0.5176471, 0, 1,
-1.456515, -0.1120203, -3.326225, 1, 0.5215687, 0, 1,
-1.430699, -1.148066, -2.893179, 1, 0.5294118, 0, 1,
-1.428828, 0.2180056, -1.393541, 1, 0.5333334, 0, 1,
-1.422737, 1.52259, -0.7900708, 1, 0.5411765, 0, 1,
-1.412729, 1.004146, -1.609967, 1, 0.5450981, 0, 1,
-1.407161, 0.4393877, -0.5973557, 1, 0.5529412, 0, 1,
-1.39724, -0.9794618, -2.867269, 1, 0.5568628, 0, 1,
-1.39527, -0.130893, -1.037846, 1, 0.5647059, 0, 1,
-1.38792, -0.3507786, -2.508959, 1, 0.5686275, 0, 1,
-1.379577, 1.735564, 0.1357005, 1, 0.5764706, 0, 1,
-1.371844, 0.3400997, -1.10352, 1, 0.5803922, 0, 1,
-1.371343, 0.2899559, 0.4682604, 1, 0.5882353, 0, 1,
-1.371205, -0.1737651, -0.3390612, 1, 0.5921569, 0, 1,
-1.366746, -1.556233, -2.473362, 1, 0.6, 0, 1,
-1.353327, 0.8568777, 0.440726, 1, 0.6078432, 0, 1,
-1.348367, 0.8166634, -1.297187, 1, 0.6117647, 0, 1,
-1.347793, 0.2914793, -3.897866, 1, 0.6196079, 0, 1,
-1.316116, -2.495162, -0.3723874, 1, 0.6235294, 0, 1,
-1.311063, 0.8954684, -1.380073, 1, 0.6313726, 0, 1,
-1.30257, 0.7203463, -1.403493, 1, 0.6352941, 0, 1,
-1.29912, 1.115853, -0.3315805, 1, 0.6431373, 0, 1,
-1.298944, -2.322882, -1.802209, 1, 0.6470588, 0, 1,
-1.297667, -0.08454748, -1.28729, 1, 0.654902, 0, 1,
-1.295823, 0.4906184, -1.502041, 1, 0.6588235, 0, 1,
-1.287826, 0.5302812, -1.699662, 1, 0.6666667, 0, 1,
-1.282679, 1.143773, -1.583208, 1, 0.6705883, 0, 1,
-1.277202, 0.7498074, -1.133514, 1, 0.6784314, 0, 1,
-1.271901, 0.5178221, -2.263713, 1, 0.682353, 0, 1,
-1.256323, 1.508996, -0.6738999, 1, 0.6901961, 0, 1,
-1.241305, 0.4366014, -0.4717844, 1, 0.6941177, 0, 1,
-1.239051, 0.2539876, -1.560784, 1, 0.7019608, 0, 1,
-1.233522, -0.1184272, -3.494898, 1, 0.7098039, 0, 1,
-1.225595, 0.0253091, -1.637821, 1, 0.7137255, 0, 1,
-1.21629, -0.8039667, -1.045137, 1, 0.7215686, 0, 1,
-1.20846, 1.266425, 0.4802207, 1, 0.7254902, 0, 1,
-1.208456, -1.596054, -2.551972, 1, 0.7333333, 0, 1,
-1.200602, 0.7449005, -1.175815, 1, 0.7372549, 0, 1,
-1.19419, -0.8865456, -2.81103, 1, 0.7450981, 0, 1,
-1.185318, -0.3497116, -1.918522, 1, 0.7490196, 0, 1,
-1.184268, -0.7033126, -0.9898317, 1, 0.7568628, 0, 1,
-1.182607, -1.445432, -2.822556, 1, 0.7607843, 0, 1,
-1.177271, -0.1842171, -2.241097, 1, 0.7686275, 0, 1,
-1.175802, -0.1102803, -1.259831, 1, 0.772549, 0, 1,
-1.16486, 1.043741, -1.550268, 1, 0.7803922, 0, 1,
-1.160673, -0.3982591, -2.683242, 1, 0.7843137, 0, 1,
-1.152911, 0.4613006, -2.740355, 1, 0.7921569, 0, 1,
-1.146782, 0.7427495, -0.5399173, 1, 0.7960784, 0, 1,
-1.146752, -0.3071951, -2.793933, 1, 0.8039216, 0, 1,
-1.143118, 1.488232, -1.339087, 1, 0.8117647, 0, 1,
-1.141965, -0.299659, -0.00421489, 1, 0.8156863, 0, 1,
-1.140872, 1.941769, -0.2377955, 1, 0.8235294, 0, 1,
-1.138204, -1.319151, -3.074975, 1, 0.827451, 0, 1,
-1.134405, -0.743909, -1.28505, 1, 0.8352941, 0, 1,
-1.131564, 0.5852811, -2.070997, 1, 0.8392157, 0, 1,
-1.13147, -0.4166225, -2.328317, 1, 0.8470588, 0, 1,
-1.127025, -1.685581, -1.582506, 1, 0.8509804, 0, 1,
-1.118005, 1.461169, 0.7808615, 1, 0.8588235, 0, 1,
-1.117099, 0.7073168, -2.654586, 1, 0.8627451, 0, 1,
-1.103197, 0.6314434, -1.341036, 1, 0.8705882, 0, 1,
-1.102628, 0.07717557, -2.403655, 1, 0.8745098, 0, 1,
-1.097033, 0.06058801, -1.411507, 1, 0.8823529, 0, 1,
-1.095394, 0.1885335, -2.003799, 1, 0.8862745, 0, 1,
-1.088913, -0.7017111, -3.423356, 1, 0.8941177, 0, 1,
-1.086518, -0.3003686, -2.017641, 1, 0.8980392, 0, 1,
-1.085652, -0.8006715, -2.967782, 1, 0.9058824, 0, 1,
-1.082633, 1.084424, -1.103552, 1, 0.9137255, 0, 1,
-1.079116, -0.9857219, -3.574334, 1, 0.9176471, 0, 1,
-1.078893, -1.112588, -1.43816, 1, 0.9254902, 0, 1,
-1.04171, -0.7252381, -1.795246, 1, 0.9294118, 0, 1,
-1.040757, 1.584969, -0.4022789, 1, 0.9372549, 0, 1,
-1.039206, -0.8429343, -1.992681, 1, 0.9411765, 0, 1,
-1.034125, -1.162977, -3.251018, 1, 0.9490196, 0, 1,
-1.032726, 0.4049936, -1.641392, 1, 0.9529412, 0, 1,
-1.031762, 0.6158445, -0.08735764, 1, 0.9607843, 0, 1,
-1.029666, -1.062775, -3.506526, 1, 0.9647059, 0, 1,
-1.029352, 2.180456, 0.8283293, 1, 0.972549, 0, 1,
-1.028666, -3.213004, -3.325992, 1, 0.9764706, 0, 1,
-1.026659, 1.574436, -0.9558935, 1, 0.9843137, 0, 1,
-1.018822, -1.726231, -1.601516, 1, 0.9882353, 0, 1,
-1.01606, 0.2574149, -2.218691, 1, 0.9960784, 0, 1,
-1.010988, -1.398829, -1.562333, 0.9960784, 1, 0, 1,
-1.000739, -0.0512458, -0.6217492, 0.9921569, 1, 0, 1,
-0.9962099, -1.491851, -4.394372, 0.9843137, 1, 0, 1,
-0.9948321, 1.298875, -0.4922835, 0.9803922, 1, 0, 1,
-0.991138, 1.176244, 0.4435631, 0.972549, 1, 0, 1,
-0.9853234, -1.397895, -1.920234, 0.9686275, 1, 0, 1,
-0.9782044, 1.102658, -0.3533701, 0.9607843, 1, 0, 1,
-0.9778443, 0.6127186, -1.486138, 0.9568627, 1, 0, 1,
-0.9765417, -0.1181453, -1.366735, 0.9490196, 1, 0, 1,
-0.9755273, 0.6173205, -0.1382048, 0.945098, 1, 0, 1,
-0.9750392, -0.6497144, -3.228405, 0.9372549, 1, 0, 1,
-0.9739949, 0.01994751, -2.716156, 0.9333333, 1, 0, 1,
-0.9536901, -1.368327, -1.566502, 0.9254902, 1, 0, 1,
-0.9480159, 1.099131, -2.865633, 0.9215686, 1, 0, 1,
-0.9415385, -1.024135, -1.724624, 0.9137255, 1, 0, 1,
-0.9401801, 0.2398876, -1.586414, 0.9098039, 1, 0, 1,
-0.9370181, -1.025381, -2.212124, 0.9019608, 1, 0, 1,
-0.9363903, 0.2907069, -1.408394, 0.8941177, 1, 0, 1,
-0.9357002, 0.2520228, 0.8329377, 0.8901961, 1, 0, 1,
-0.9353298, -0.2637929, -2.288805, 0.8823529, 1, 0, 1,
-0.9340025, 1.95411, -0.178949, 0.8784314, 1, 0, 1,
-0.9337489, 2.135232, 0.9257287, 0.8705882, 1, 0, 1,
-0.9336153, -0.7702747, -1.273548, 0.8666667, 1, 0, 1,
-0.9335997, -1.668634, -3.549407, 0.8588235, 1, 0, 1,
-0.9334754, 1.654072, -0.03907469, 0.854902, 1, 0, 1,
-0.9318094, -1.289496, -2.407654, 0.8470588, 1, 0, 1,
-0.9274743, 0.2618175, -0.7260934, 0.8431373, 1, 0, 1,
-0.9204248, 1.206527, 1.087969, 0.8352941, 1, 0, 1,
-0.9187192, -0.4666281, -3.122329, 0.8313726, 1, 0, 1,
-0.913038, 1.206844, 0.9615646, 0.8235294, 1, 0, 1,
-0.9083896, -0.9561347, -0.9714955, 0.8196079, 1, 0, 1,
-0.9062986, -0.8749335, -1.073338, 0.8117647, 1, 0, 1,
-0.9061294, -0.3821401, -1.130865, 0.8078431, 1, 0, 1,
-0.9033669, 0.1698488, -1.955866, 0.8, 1, 0, 1,
-0.9020903, 0.6713629, -2.025333, 0.7921569, 1, 0, 1,
-0.8899933, 2.383228, -0.2494625, 0.7882353, 1, 0, 1,
-0.8886876, 0.3148936, 0.2970611, 0.7803922, 1, 0, 1,
-0.8882503, 1.948534, -1.233935, 0.7764706, 1, 0, 1,
-0.8840805, -1.356702, -2.069447, 0.7686275, 1, 0, 1,
-0.8807786, -0.1488239, -1.9983, 0.7647059, 1, 0, 1,
-0.8699629, 0.3472688, -0.03192678, 0.7568628, 1, 0, 1,
-0.8668793, 0.49325, -1.304507, 0.7529412, 1, 0, 1,
-0.8653861, 0.3504011, 0.3799207, 0.7450981, 1, 0, 1,
-0.8628065, -0.6651597, -2.171639, 0.7411765, 1, 0, 1,
-0.8569216, 0.7271194, 1.699982, 0.7333333, 1, 0, 1,
-0.8547281, 0.2861716, -1.78511, 0.7294118, 1, 0, 1,
-0.851992, 0.4395146, -1.801736, 0.7215686, 1, 0, 1,
-0.8511031, 0.9326508, -0.2848694, 0.7176471, 1, 0, 1,
-0.8491231, 0.08905572, -1.691672, 0.7098039, 1, 0, 1,
-0.8471396, 0.7856255, 0.1059557, 0.7058824, 1, 0, 1,
-0.841869, -2.839258, -1.778412, 0.6980392, 1, 0, 1,
-0.8328808, -0.185251, -3.026423, 0.6901961, 1, 0, 1,
-0.8325991, 1.07648, -1.308124, 0.6862745, 1, 0, 1,
-0.827397, 0.3412592, -3.811471, 0.6784314, 1, 0, 1,
-0.8273363, 0.8151165, -2.498368, 0.6745098, 1, 0, 1,
-0.8255888, 1.063062, -1.070622, 0.6666667, 1, 0, 1,
-0.8195041, 1.230072, -0.8396407, 0.6627451, 1, 0, 1,
-0.8094218, -0.8366073, -2.657436, 0.654902, 1, 0, 1,
-0.8093377, -1.192784, -1.301614, 0.6509804, 1, 0, 1,
-0.8084247, 0.0007585507, -1.100732, 0.6431373, 1, 0, 1,
-0.8003103, -2.027907, -3.263901, 0.6392157, 1, 0, 1,
-0.7987927, 1.555023, -1.087609, 0.6313726, 1, 0, 1,
-0.7978347, 0.7258266, -0.4807088, 0.627451, 1, 0, 1,
-0.7973536, -2.132451, -1.852085, 0.6196079, 1, 0, 1,
-0.7953755, 1.484465, -1.807406, 0.6156863, 1, 0, 1,
-0.7917528, 0.05454294, -1.891743, 0.6078432, 1, 0, 1,
-0.791365, -0.3496337, -2.311113, 0.6039216, 1, 0, 1,
-0.7884942, -2.408259, -4.167622, 0.5960785, 1, 0, 1,
-0.7884334, 0.3094175, -2.105185, 0.5882353, 1, 0, 1,
-0.7846459, 0.5973197, -0.8045096, 0.5843138, 1, 0, 1,
-0.7785179, 1.528652, -1.471107, 0.5764706, 1, 0, 1,
-0.7740641, 0.2605768, -1.223925, 0.572549, 1, 0, 1,
-0.7611904, 0.5948532, -0.8190974, 0.5647059, 1, 0, 1,
-0.7543113, 0.5043832, 0.03811662, 0.5607843, 1, 0, 1,
-0.7533108, -1.500352, -1.503692, 0.5529412, 1, 0, 1,
-0.7518808, -0.9210196, -2.286649, 0.5490196, 1, 0, 1,
-0.7516435, 1.260765, -0.6362514, 0.5411765, 1, 0, 1,
-0.7449176, -2.04609, -3.724118, 0.5372549, 1, 0, 1,
-0.7448148, -0.02485546, -0.7780154, 0.5294118, 1, 0, 1,
-0.7437049, -0.7974606, -2.473207, 0.5254902, 1, 0, 1,
-0.7432308, 0.3724627, -0.9523816, 0.5176471, 1, 0, 1,
-0.7427669, -1.586266, -0.3761975, 0.5137255, 1, 0, 1,
-0.7409222, -0.4848099, -0.3495463, 0.5058824, 1, 0, 1,
-0.7399737, -0.6069582, -0.3745991, 0.5019608, 1, 0, 1,
-0.7370903, -1.274758, -3.977165, 0.4941176, 1, 0, 1,
-0.735633, -1.360626, -3.201339, 0.4862745, 1, 0, 1,
-0.725605, -0.4171084, -2.268101, 0.4823529, 1, 0, 1,
-0.718275, -0.476115, -1.932458, 0.4745098, 1, 0, 1,
-0.7158439, 0.7644166, -1.123584, 0.4705882, 1, 0, 1,
-0.7146152, -0.3665704, -2.291072, 0.4627451, 1, 0, 1,
-0.7101414, -0.7865012, -0.7477489, 0.4588235, 1, 0, 1,
-0.6969624, 0.007073225, -3.056308, 0.4509804, 1, 0, 1,
-0.6918026, 0.189652, 0.07824904, 0.4470588, 1, 0, 1,
-0.690841, -0.3040041, -3.176404, 0.4392157, 1, 0, 1,
-0.6860332, 0.4297805, -1.329186, 0.4352941, 1, 0, 1,
-0.6858762, -0.2217153, 0.792206, 0.427451, 1, 0, 1,
-0.6830264, 1.098514, -0.005732524, 0.4235294, 1, 0, 1,
-0.6821702, 1.973903, -0.1510658, 0.4156863, 1, 0, 1,
-0.6819611, 1.840546, -0.1990776, 0.4117647, 1, 0, 1,
-0.6770792, -0.1944334, -1.769537, 0.4039216, 1, 0, 1,
-0.6737825, 0.3937171, -2.188955, 0.3960784, 1, 0, 1,
-0.6707505, 0.3121413, -2.516501, 0.3921569, 1, 0, 1,
-0.6677132, -0.3827293, -1.31392, 0.3843137, 1, 0, 1,
-0.661873, -0.7153192, -1.492318, 0.3803922, 1, 0, 1,
-0.6601842, -1.426708, -0.5859531, 0.372549, 1, 0, 1,
-0.6566759, 0.2277492, -0.05174642, 0.3686275, 1, 0, 1,
-0.6541559, -0.2623336, -2.22797, 0.3607843, 1, 0, 1,
-0.6510791, -0.3320746, -0.7099123, 0.3568628, 1, 0, 1,
-0.6505377, -0.1587914, 0.5204815, 0.3490196, 1, 0, 1,
-0.6473518, -1.042106, -3.303376, 0.345098, 1, 0, 1,
-0.6376623, -0.5509348, -1.993122, 0.3372549, 1, 0, 1,
-0.6366173, 0.5774235, 0.9275858, 0.3333333, 1, 0, 1,
-0.6347123, -1.022639, -1.914098, 0.3254902, 1, 0, 1,
-0.6329818, 0.03032378, -2.304951, 0.3215686, 1, 0, 1,
-0.6302277, 1.004445, -1.153248, 0.3137255, 1, 0, 1,
-0.6299896, 0.757538, -1.639951, 0.3098039, 1, 0, 1,
-0.6220769, 0.6194515, -0.06012118, 0.3019608, 1, 0, 1,
-0.6217346, 0.2559827, -1.599932, 0.2941177, 1, 0, 1,
-0.6211088, 0.5468706, 0.0628641, 0.2901961, 1, 0, 1,
-0.6202435, 0.1324567, -1.061441, 0.282353, 1, 0, 1,
-0.611281, -0.4346674, -2.285196, 0.2784314, 1, 0, 1,
-0.6109816, -0.1886208, -1.895298, 0.2705882, 1, 0, 1,
-0.6091458, -0.8813276, -2.267253, 0.2666667, 1, 0, 1,
-0.6072852, 0.3883692, -0.6312967, 0.2588235, 1, 0, 1,
-0.6060258, -0.2673064, -1.527512, 0.254902, 1, 0, 1,
-0.6028575, 0.2480213, -2.769618, 0.2470588, 1, 0, 1,
-0.6026005, -0.7977289, -3.544767, 0.2431373, 1, 0, 1,
-0.6004536, 0.9182593, -1.318719, 0.2352941, 1, 0, 1,
-0.5992294, -1.828149, -3.227826, 0.2313726, 1, 0, 1,
-0.5982734, 0.5247723, -0.3719674, 0.2235294, 1, 0, 1,
-0.595562, -1.528694, -5.050211, 0.2196078, 1, 0, 1,
-0.5919958, 0.8745489, -0.3693421, 0.2117647, 1, 0, 1,
-0.5897336, 0.2283778, -1.333411, 0.2078431, 1, 0, 1,
-0.5866297, -0.8356016, -1.50881, 0.2, 1, 0, 1,
-0.5858534, 0.4555691, -1.728253, 0.1921569, 1, 0, 1,
-0.5815309, -0.793115, -2.399576, 0.1882353, 1, 0, 1,
-0.5800295, 0.1635796, -1.627662, 0.1803922, 1, 0, 1,
-0.5713999, -0.4247231, -1.982832, 0.1764706, 1, 0, 1,
-0.5687875, -0.6479363, -3.053297, 0.1686275, 1, 0, 1,
-0.56774, -0.9929428, -2.987434, 0.1647059, 1, 0, 1,
-0.5672668, -1.608581, -4.395183, 0.1568628, 1, 0, 1,
-0.5636607, 0.2660241, 1.414328, 0.1529412, 1, 0, 1,
-0.5612428, 1.350238, -1.763168, 0.145098, 1, 0, 1,
-0.5581292, 0.2247643, -0.2049084, 0.1411765, 1, 0, 1,
-0.5577388, 0.2381922, -0.1905077, 0.1333333, 1, 0, 1,
-0.5573248, 0.2939113, -1.781565, 0.1294118, 1, 0, 1,
-0.5568671, 0.0368802, -1.854547, 0.1215686, 1, 0, 1,
-0.5509485, -1.329512, -1.737679, 0.1176471, 1, 0, 1,
-0.5448737, 0.9737733, 0.03716374, 0.1098039, 1, 0, 1,
-0.544513, -0.2335647, -1.634604, 0.1058824, 1, 0, 1,
-0.5408931, -0.500599, -2.589278, 0.09803922, 1, 0, 1,
-0.5256341, -0.7194914, -0.3586916, 0.09019608, 1, 0, 1,
-0.5255035, -1.561102, -3.498313, 0.08627451, 1, 0, 1,
-0.524936, 2.180355, -1.712957, 0.07843138, 1, 0, 1,
-0.5247549, -0.6108404, -6.128884, 0.07450981, 1, 0, 1,
-0.5238165, 1.119874, -0.2891203, 0.06666667, 1, 0, 1,
-0.5236315, 1.415292, -0.3024438, 0.0627451, 1, 0, 1,
-0.5196083, -1.158889, -3.540856, 0.05490196, 1, 0, 1,
-0.5189076, -1.285329, -2.842408, 0.05098039, 1, 0, 1,
-0.5183448, -0.5590293, -1.644241, 0.04313726, 1, 0, 1,
-0.5136446, -0.5352205, -1.585282, 0.03921569, 1, 0, 1,
-0.5129972, -1.549703, -3.777164, 0.03137255, 1, 0, 1,
-0.5124512, 1.602544, -0.3834787, 0.02745098, 1, 0, 1,
-0.509672, 0.3292824, 1.636593, 0.01960784, 1, 0, 1,
-0.5036011, 1.584547, -1.205206, 0.01568628, 1, 0, 1,
-0.5031278, 0.4166102, -1.907163, 0.007843138, 1, 0, 1,
-0.5022045, 1.089714, -0.7287626, 0.003921569, 1, 0, 1,
-0.4977764, 1.247899, 1.690617, 0, 1, 0.003921569, 1,
-0.4961109, -1.173586, -3.009989, 0, 1, 0.01176471, 1,
-0.4918384, 1.247113, -2.034201, 0, 1, 0.01568628, 1,
-0.4898006, 0.3005807, -1.86131, 0, 1, 0.02352941, 1,
-0.4862596, 1.076064, 1.830335, 0, 1, 0.02745098, 1,
-0.4800836, 1.245337, 0.7824553, 0, 1, 0.03529412, 1,
-0.4793691, 0.9750188, -1.317684, 0, 1, 0.03921569, 1,
-0.4789255, -0.1507434, -2.252002, 0, 1, 0.04705882, 1,
-0.4774701, -0.7244675, -1.727083, 0, 1, 0.05098039, 1,
-0.4662995, 0.9054137, -0.1125493, 0, 1, 0.05882353, 1,
-0.4646873, -0.1521057, -2.362381, 0, 1, 0.0627451, 1,
-0.4640527, -0.2040294, -4.201807, 0, 1, 0.07058824, 1,
-0.4592581, -0.6187072, -2.21318, 0, 1, 0.07450981, 1,
-0.4555553, 0.1663737, -1.259655, 0, 1, 0.08235294, 1,
-0.4541059, 0.3062026, -1.442822, 0, 1, 0.08627451, 1,
-0.4534, 0.8440269, -0.05615366, 0, 1, 0.09411765, 1,
-0.4526208, 0.6116881, 0.1490669, 0, 1, 0.1019608, 1,
-0.4520624, -0.448741, -1.962786, 0, 1, 0.1058824, 1,
-0.4504163, -1.007231, -3.527858, 0, 1, 0.1137255, 1,
-0.4496417, -1.717256, -1.504641, 0, 1, 0.1176471, 1,
-0.446953, 0.6228852, 0.780596, 0, 1, 0.1254902, 1,
-0.4400735, 1.429702, -3.838714, 0, 1, 0.1294118, 1,
-0.4385085, -1.75015, -3.934855, 0, 1, 0.1372549, 1,
-0.4356348, -1.34255, -1.865213, 0, 1, 0.1411765, 1,
-0.4339371, -0.5909486, -2.282067, 0, 1, 0.1490196, 1,
-0.433506, -0.1218145, -1.451995, 0, 1, 0.1529412, 1,
-0.4259236, 0.5000373, -2.1005, 0, 1, 0.1607843, 1,
-0.4257496, -0.4091143, -4.551413, 0, 1, 0.1647059, 1,
-0.4249654, -0.08779031, -0.6696569, 0, 1, 0.172549, 1,
-0.419442, -0.9496546, -3.828107, 0, 1, 0.1764706, 1,
-0.4182225, -1.516935, -2.934423, 0, 1, 0.1843137, 1,
-0.4168594, 0.9631189, -0.07045481, 0, 1, 0.1882353, 1,
-0.4116503, 0.1835725, -1.194533, 0, 1, 0.1960784, 1,
-0.4043573, 0.3826151, -1.238414, 0, 1, 0.2039216, 1,
-0.4007974, 1.664383, 0.6087851, 0, 1, 0.2078431, 1,
-0.3999623, 0.9418117, 0.06447405, 0, 1, 0.2156863, 1,
-0.3996461, 0.758629, 1.617605, 0, 1, 0.2196078, 1,
-0.3991253, 1.993002, -1.152233, 0, 1, 0.227451, 1,
-0.3982506, -0.8656775, -5.718092, 0, 1, 0.2313726, 1,
-0.3927719, 0.4238506, -0.8163239, 0, 1, 0.2392157, 1,
-0.3922101, 0.2573256, -0.2618687, 0, 1, 0.2431373, 1,
-0.3865133, 0.4240651, 0.150132, 0, 1, 0.2509804, 1,
-0.3859501, -0.7040398, -3.063972, 0, 1, 0.254902, 1,
-0.3837498, 0.6451294, -1.44829, 0, 1, 0.2627451, 1,
-0.383553, -3.200412, -3.380544, 0, 1, 0.2666667, 1,
-0.3789425, 0.3224612, -2.07092, 0, 1, 0.2745098, 1,
-0.3762569, -0.3466743, -2.560627, 0, 1, 0.2784314, 1,
-0.3731373, -0.2258513, -2.731177, 0, 1, 0.2862745, 1,
-0.3703751, 0.2221116, -1.188845, 0, 1, 0.2901961, 1,
-0.36803, 0.07504858, -2.711578, 0, 1, 0.2980392, 1,
-0.3674632, -0.9829068, -5.169121, 0, 1, 0.3058824, 1,
-0.3622413, 1.170097, 0.2647043, 0, 1, 0.3098039, 1,
-0.3493545, 0.08034654, -1.582603, 0, 1, 0.3176471, 1,
-0.348372, 0.5701654, 0.1309818, 0, 1, 0.3215686, 1,
-0.3470954, 0.9050964, -1.383993, 0, 1, 0.3294118, 1,
-0.3447821, -0.7171551, -2.331569, 0, 1, 0.3333333, 1,
-0.3245248, -0.9296, -3.441392, 0, 1, 0.3411765, 1,
-0.3208424, -0.5490292, -2.02954, 0, 1, 0.345098, 1,
-0.3166177, 0.3555255, -0.4476969, 0, 1, 0.3529412, 1,
-0.3163372, 0.6867283, 1.315136, 0, 1, 0.3568628, 1,
-0.3083762, -1.00173, -3.837017, 0, 1, 0.3647059, 1,
-0.3037412, -2.041785, -2.861837, 0, 1, 0.3686275, 1,
-0.3000061, -1.769533, -2.807124, 0, 1, 0.3764706, 1,
-0.2982348, 0.7765034, 0.1790292, 0, 1, 0.3803922, 1,
-0.2951218, -0.479949, -1.934041, 0, 1, 0.3882353, 1,
-0.2924678, 0.4041536, 0.3813439, 0, 1, 0.3921569, 1,
-0.2906914, -0.2010796, -2.056649, 0, 1, 0.4, 1,
-0.2884564, 0.2625031, -2.378663, 0, 1, 0.4078431, 1,
-0.2879015, 0.138137, -1.673572, 0, 1, 0.4117647, 1,
-0.2809745, -1.209884, -2.630181, 0, 1, 0.4196078, 1,
-0.2798647, 1.914141, -1.539267, 0, 1, 0.4235294, 1,
-0.2739053, 0.4364574, -1.528112, 0, 1, 0.4313726, 1,
-0.2711103, 1.539594, -1.712287, 0, 1, 0.4352941, 1,
-0.2695196, -0.1883376, -2.811912, 0, 1, 0.4431373, 1,
-0.2674647, -1.329296, -1.555396, 0, 1, 0.4470588, 1,
-0.2623235, -0.5228256, -4.144343, 0, 1, 0.454902, 1,
-0.2622994, 0.1098973, -1.221288, 0, 1, 0.4588235, 1,
-0.2622853, 0.8259636, -1.242797, 0, 1, 0.4666667, 1,
-0.262145, -1.080847, -1.992685, 0, 1, 0.4705882, 1,
-0.2616838, -1.204189, -4.665048, 0, 1, 0.4784314, 1,
-0.2613553, 1.063718, 1.301607, 0, 1, 0.4823529, 1,
-0.2605199, 0.6737023, 0.7481749, 0, 1, 0.4901961, 1,
-0.2580363, -0.4848435, -3.718711, 0, 1, 0.4941176, 1,
-0.2580183, 1.268781, -1.344103, 0, 1, 0.5019608, 1,
-0.2571186, 1.997963, -1.007631, 0, 1, 0.509804, 1,
-0.2547744, -0.6199807, -0.6116024, 0, 1, 0.5137255, 1,
-0.2544242, -1.020321, -2.593616, 0, 1, 0.5215687, 1,
-0.2530181, -0.748313, -1.627475, 0, 1, 0.5254902, 1,
-0.2513268, 1.394627, -0.2041772, 0, 1, 0.5333334, 1,
-0.2498197, -0.233741, -1.492656, 0, 1, 0.5372549, 1,
-0.2388539, 0.2258484, -0.2689759, 0, 1, 0.5450981, 1,
-0.2387266, 0.5540034, -1.861206, 0, 1, 0.5490196, 1,
-0.2379042, 1.374726, 1.520011, 0, 1, 0.5568628, 1,
-0.2355164, 0.8330718, 0.6291209, 0, 1, 0.5607843, 1,
-0.225462, -1.007991, -3.216402, 0, 1, 0.5686275, 1,
-0.2184775, 0.8839434, -0.7848197, 0, 1, 0.572549, 1,
-0.2179329, 0.2805311, -1.068257, 0, 1, 0.5803922, 1,
-0.217558, -0.7181603, -1.186298, 0, 1, 0.5843138, 1,
-0.2145428, -0.5752057, -1.03615, 0, 1, 0.5921569, 1,
-0.2106756, -2.252517, -1.973277, 0, 1, 0.5960785, 1,
-0.2084031, 0.3373331, -0.1906215, 0, 1, 0.6039216, 1,
-0.2043694, -0.6163525, -3.073321, 0, 1, 0.6117647, 1,
-0.2036288, 1.183153, 0.4583008, 0, 1, 0.6156863, 1,
-0.2032173, 1.594229, 0.2104203, 0, 1, 0.6235294, 1,
-0.1971737, -0.6532463, -4.518646, 0, 1, 0.627451, 1,
-0.188715, 1.585131, 0.2224904, 0, 1, 0.6352941, 1,
-0.1874657, -0.04256015, -2.946288, 0, 1, 0.6392157, 1,
-0.1829404, 0.4577627, 1.453896, 0, 1, 0.6470588, 1,
-0.1822282, -1.35043, -2.367236, 0, 1, 0.6509804, 1,
-0.1781414, 0.6355127, 2.525894, 0, 1, 0.6588235, 1,
-0.1695126, -0.7517785, -2.141498, 0, 1, 0.6627451, 1,
-0.1682384, 2.131006, -0.1998874, 0, 1, 0.6705883, 1,
-0.1668027, 0.3111734, -1.45636, 0, 1, 0.6745098, 1,
-0.1666274, -1.711663, -3.299158, 0, 1, 0.682353, 1,
-0.1653029, 0.5844688, -0.288633, 0, 1, 0.6862745, 1,
-0.1643166, 0.1596614, -1.380064, 0, 1, 0.6941177, 1,
-0.1632725, 0.6976789, -0.4056596, 0, 1, 0.7019608, 1,
-0.1629035, 0.009361795, -1.037073, 0, 1, 0.7058824, 1,
-0.1609992, -0.4980957, -3.786206, 0, 1, 0.7137255, 1,
-0.1584315, -0.6880357, -3.989031, 0, 1, 0.7176471, 1,
-0.1581085, -0.8598464, -2.913785, 0, 1, 0.7254902, 1,
-0.1542721, -0.957111, -5.097377, 0, 1, 0.7294118, 1,
-0.1537601, -0.6233262, -3.314143, 0, 1, 0.7372549, 1,
-0.1537403, -0.7856236, -5.211793, 0, 1, 0.7411765, 1,
-0.1527921, -0.179968, -1.21119, 0, 1, 0.7490196, 1,
-0.147819, 1.446623, 0.07295462, 0, 1, 0.7529412, 1,
-0.146546, -0.366179, -2.93716, 0, 1, 0.7607843, 1,
-0.1464955, -1.166828, -4.634768, 0, 1, 0.7647059, 1,
-0.1428052, 0.9230624, -0.1008091, 0, 1, 0.772549, 1,
-0.1404269, 0.6666114, 0.612083, 0, 1, 0.7764706, 1,
-0.1346335, 0.1100941, -1.281671, 0, 1, 0.7843137, 1,
-0.1340165, -0.5827214, -4.016306, 0, 1, 0.7882353, 1,
-0.1292849, 0.9258599, 0.5584723, 0, 1, 0.7960784, 1,
-0.1279199, -0.8100325, -1.531906, 0, 1, 0.8039216, 1,
-0.1251914, 0.8646758, -0.6312501, 0, 1, 0.8078431, 1,
-0.1238882, -0.6589383, -2.383981, 0, 1, 0.8156863, 1,
-0.1232933, 1.38854, 0.6290396, 0, 1, 0.8196079, 1,
-0.1210404, 0.4235672, 0.732022, 0, 1, 0.827451, 1,
-0.1186893, -0.1674512, -3.058846, 0, 1, 0.8313726, 1,
-0.1159659, -0.247342, -2.690732, 0, 1, 0.8392157, 1,
-0.1157414, 0.01683398, -0.3701226, 0, 1, 0.8431373, 1,
-0.1139563, -1.252825, -2.311226, 0, 1, 0.8509804, 1,
-0.1119457, 1.982293, 0.3348895, 0, 1, 0.854902, 1,
-0.1087037, 0.273619, -0.9957652, 0, 1, 0.8627451, 1,
-0.1057139, -0.2743295, -1.409782, 0, 1, 0.8666667, 1,
-0.09955716, -0.8800556, -4.843356, 0, 1, 0.8745098, 1,
-0.0991829, -0.1164563, -2.309289, 0, 1, 0.8784314, 1,
-0.0987209, -1.279073, -4.287394, 0, 1, 0.8862745, 1,
-0.09859058, -0.2383775, -2.76704, 0, 1, 0.8901961, 1,
-0.09841122, 0.1141355, -0.160591, 0, 1, 0.8980392, 1,
-0.09629784, -0.6252037, -2.576253, 0, 1, 0.9058824, 1,
-0.09178005, 1.064706, -0.7972273, 0, 1, 0.9098039, 1,
-0.09053038, 1.647653, 0.5382441, 0, 1, 0.9176471, 1,
-0.08663771, -1.590689, -3.352645, 0, 1, 0.9215686, 1,
-0.0852806, -0.4104405, -2.379197, 0, 1, 0.9294118, 1,
-0.08456137, 0.8624372, -1.064147, 0, 1, 0.9333333, 1,
-0.08117521, -1.852241, -1.563963, 0, 1, 0.9411765, 1,
-0.08085287, -0.1430707, -0.6563069, 0, 1, 0.945098, 1,
-0.07880306, 0.8950529, -0.7810167, 0, 1, 0.9529412, 1,
-0.07756377, 0.7958244, 0.6991143, 0, 1, 0.9568627, 1,
-0.07543498, 0.4249335, -1.500286, 0, 1, 0.9647059, 1,
-0.07484984, -0.9722241, -4.035388, 0, 1, 0.9686275, 1,
-0.07045501, -0.3121803, -1.448507, 0, 1, 0.9764706, 1,
-0.06828579, 1.820706, -0.9416355, 0, 1, 0.9803922, 1,
-0.06587515, 1.412508, -1.541747, 0, 1, 0.9882353, 1,
-0.06357297, -1.047043, -2.182624, 0, 1, 0.9921569, 1,
-0.06336422, 0.9738641, 0.3862526, 0, 1, 1, 1,
-0.06107164, -0.2984836, -2.359847, 0, 0.9921569, 1, 1,
-0.05938231, 0.2715326, -2.129764, 0, 0.9882353, 1, 1,
-0.0564912, -0.0012395, -1.325012, 0, 0.9803922, 1, 1,
-0.05329311, -1.988388, -2.14102, 0, 0.9764706, 1, 1,
-0.0497092, 0.4700828, 0.2908208, 0, 0.9686275, 1, 1,
-0.04766451, 1.748695, 1.739958, 0, 0.9647059, 1, 1,
-0.03269111, -1.523977, -2.347997, 0, 0.9568627, 1, 1,
-0.02992932, -1.218168, -2.454088, 0, 0.9529412, 1, 1,
-0.02898165, -1.738418, -2.781216, 0, 0.945098, 1, 1,
-0.02799067, -0.4636319, -2.734896, 0, 0.9411765, 1, 1,
-0.02354727, 1.397753, 0.3675966, 0, 0.9333333, 1, 1,
-0.02254239, 0.8560234, 0.362554, 0, 0.9294118, 1, 1,
-0.02136001, -1.018764, -3.070468, 0, 0.9215686, 1, 1,
-0.02093249, 0.2603874, -0.276094, 0, 0.9176471, 1, 1,
-0.01139662, -0.01312748, -2.518783, 0, 0.9098039, 1, 1,
-0.006422884, 0.2134993, -0.7774163, 0, 0.9058824, 1, 1,
-0.004585798, -1.660933, -2.925145, 0, 0.8980392, 1, 1,
-0.000371991, -0.5158854, -2.282014, 0, 0.8901961, 1, 1,
0.0004804324, -1.375565, 4.111775, 0, 0.8862745, 1, 1,
0.00235644, -0.07761332, 4.248101, 0, 0.8784314, 1, 1,
0.002480673, -2.235672, 3.733152, 0, 0.8745098, 1, 1,
0.00400527, 0.3302438, -0.9992095, 0, 0.8666667, 1, 1,
0.004704986, -1.159662, 3.926754, 0, 0.8627451, 1, 1,
0.00532661, -0.830111, 3.364294, 0, 0.854902, 1, 1,
0.007191632, -2.168257, 2.969507, 0, 0.8509804, 1, 1,
0.008706654, 1.134705, -1.365818, 0, 0.8431373, 1, 1,
0.01107377, 0.1861669, 0.1456958, 0, 0.8392157, 1, 1,
0.01761678, 0.2700844, -0.4518802, 0, 0.8313726, 1, 1,
0.01990462, 0.5227991, 0.3005188, 0, 0.827451, 1, 1,
0.02580666, -0.8573502, 3.232687, 0, 0.8196079, 1, 1,
0.02971431, 0.3857025, 0.06853957, 0, 0.8156863, 1, 1,
0.03118225, -1.007501, 5.458906, 0, 0.8078431, 1, 1,
0.03352418, 0.4707739, -1.059087, 0, 0.8039216, 1, 1,
0.03440853, -0.4216864, 1.864881, 0, 0.7960784, 1, 1,
0.0377935, -0.8014352, 4.32865, 0, 0.7882353, 1, 1,
0.04439308, 1.131707, -1.513083, 0, 0.7843137, 1, 1,
0.04961655, -1.438659, 2.888829, 0, 0.7764706, 1, 1,
0.05093231, -0.5353056, 1.742805, 0, 0.772549, 1, 1,
0.05369942, -0.07225993, 1.008477, 0, 0.7647059, 1, 1,
0.05902837, -2.404278, 2.552247, 0, 0.7607843, 1, 1,
0.0594344, -1.127967, 2.559792, 0, 0.7529412, 1, 1,
0.05945754, -0.3337368, 4.146746, 0, 0.7490196, 1, 1,
0.06607924, 0.5100432, -1.531044, 0, 0.7411765, 1, 1,
0.06770491, 2.047768, 0.8080955, 0, 0.7372549, 1, 1,
0.07053418, -1.915438, 2.539455, 0, 0.7294118, 1, 1,
0.07183288, 1.561976, -0.7107435, 0, 0.7254902, 1, 1,
0.07312738, 1.328109, 0.5742643, 0, 0.7176471, 1, 1,
0.07687073, -0.4661727, 1.432209, 0, 0.7137255, 1, 1,
0.08227998, 1.126816, -0.1315325, 0, 0.7058824, 1, 1,
0.08464984, 1.088398, -1.928902, 0, 0.6980392, 1, 1,
0.08734295, 1.070656, 2.025426, 0, 0.6941177, 1, 1,
0.09026168, -0.3583919, 3.908509, 0, 0.6862745, 1, 1,
0.0936311, -0.2875702, 0.8417794, 0, 0.682353, 1, 1,
0.09924201, -0.8237716, 4.199605, 0, 0.6745098, 1, 1,
0.09936775, 1.967686, -0.5038545, 0, 0.6705883, 1, 1,
0.09988966, -0.5850866, 2.949858, 0, 0.6627451, 1, 1,
0.1002589, 0.6882595, 0.8450136, 0, 0.6588235, 1, 1,
0.1052014, 0.6174849, 1.196899, 0, 0.6509804, 1, 1,
0.1064203, 1.876404, 0.738547, 0, 0.6470588, 1, 1,
0.1082883, 0.9551636, -1.096613, 0, 0.6392157, 1, 1,
0.1094998, -0.2535522, 3.645287, 0, 0.6352941, 1, 1,
0.1156807, -0.3180367, 1.938892, 0, 0.627451, 1, 1,
0.1176505, 0.6130695, -0.2173894, 0, 0.6235294, 1, 1,
0.1272212, -1.486706, 1.552344, 0, 0.6156863, 1, 1,
0.1318091, -0.5671908, 1.845421, 0, 0.6117647, 1, 1,
0.132847, -0.4311009, 2.20752, 0, 0.6039216, 1, 1,
0.1332989, -0.6333094, 2.041654, 0, 0.5960785, 1, 1,
0.1336772, -0.4368713, 3.965259, 0, 0.5921569, 1, 1,
0.1352098, 0.3620407, 1.654685, 0, 0.5843138, 1, 1,
0.1357382, 0.3193418, -0.687704, 0, 0.5803922, 1, 1,
0.137632, -1.339028, 3.44181, 0, 0.572549, 1, 1,
0.139851, -0.9083117, 4.442786, 0, 0.5686275, 1, 1,
0.1428721, -1.596223, 3.443306, 0, 0.5607843, 1, 1,
0.144505, 1.733943, -0.08357898, 0, 0.5568628, 1, 1,
0.145528, -2.092719, 3.065173, 0, 0.5490196, 1, 1,
0.1483537, -0.2145703, 2.51486, 0, 0.5450981, 1, 1,
0.1490052, -0.8112233, 5.154235, 0, 0.5372549, 1, 1,
0.1506927, -0.0038799, 3.553426, 0, 0.5333334, 1, 1,
0.1511916, 0.5564455, 1.237906, 0, 0.5254902, 1, 1,
0.1616787, 0.3805668, 0.01978908, 0, 0.5215687, 1, 1,
0.1632097, 0.7161359, -0.2477929, 0, 0.5137255, 1, 1,
0.1675993, -1.286563, 1.673063, 0, 0.509804, 1, 1,
0.1680636, -0.1048221, 2.190697, 0, 0.5019608, 1, 1,
0.17214, 0.7221571, 0.617863, 0, 0.4941176, 1, 1,
0.1723687, 0.2904187, 0.1599855, 0, 0.4901961, 1, 1,
0.1732607, -0.4441016, 2.161085, 0, 0.4823529, 1, 1,
0.1747267, -0.4843984, 2.408616, 0, 0.4784314, 1, 1,
0.1754576, 0.6543714, 0.8178867, 0, 0.4705882, 1, 1,
0.1767838, 2.182784, -0.8918409, 0, 0.4666667, 1, 1,
0.177497, -0.08096171, 1.095415, 0, 0.4588235, 1, 1,
0.1789554, 0.7206532, -1.326738, 0, 0.454902, 1, 1,
0.1809571, 0.4503734, 2.255487, 0, 0.4470588, 1, 1,
0.1873219, -2.550307, 2.835176, 0, 0.4431373, 1, 1,
0.1878959, -0.8702996, 2.525166, 0, 0.4352941, 1, 1,
0.1898675, -0.3138865, 1.980001, 0, 0.4313726, 1, 1,
0.1949452, -1.945146, 2.40238, 0, 0.4235294, 1, 1,
0.1954267, -0.3098048, 2.982938, 0, 0.4196078, 1, 1,
0.2108973, 0.3960892, 1.442338, 0, 0.4117647, 1, 1,
0.2111325, -0.5450891, 0.5599706, 0, 0.4078431, 1, 1,
0.214336, -0.3200394, 0.9826974, 0, 0.4, 1, 1,
0.215606, -0.4171302, 2.721241, 0, 0.3921569, 1, 1,
0.2212648, -1.564, 3.365373, 0, 0.3882353, 1, 1,
0.223086, -0.03976519, 2.307241, 0, 0.3803922, 1, 1,
0.2232957, 0.9789031, 0.2534293, 0, 0.3764706, 1, 1,
0.2242662, -0.8575259, 2.546375, 0, 0.3686275, 1, 1,
0.2265332, -1.174517, 1.93189, 0, 0.3647059, 1, 1,
0.2302117, 1.237945, 0.6104785, 0, 0.3568628, 1, 1,
0.2308978, 0.7222463, 0.7382098, 0, 0.3529412, 1, 1,
0.2346086, 0.3150096, 0.1784314, 0, 0.345098, 1, 1,
0.2348264, 0.947522, -0.6710119, 0, 0.3411765, 1, 1,
0.2368199, -1.11312, 3.200752, 0, 0.3333333, 1, 1,
0.2376195, -0.2287919, 1.655693, 0, 0.3294118, 1, 1,
0.2391606, 1.012028, 2.01206, 0, 0.3215686, 1, 1,
0.2426316, 2.076236, -0.9300075, 0, 0.3176471, 1, 1,
0.2440218, -2.270573, 2.470167, 0, 0.3098039, 1, 1,
0.2441096, 0.3034751, 2.952827, 0, 0.3058824, 1, 1,
0.2449731, 1.324677, -0.1189028, 0, 0.2980392, 1, 1,
0.2453215, -1.014524, 2.302443, 0, 0.2901961, 1, 1,
0.2473543, -0.09492221, 2.014225, 0, 0.2862745, 1, 1,
0.2474903, -0.05688174, 2.287335, 0, 0.2784314, 1, 1,
0.2488396, -1.301025, 3.485454, 0, 0.2745098, 1, 1,
0.2542363, 0.1329587, 0.7959919, 0, 0.2666667, 1, 1,
0.2579367, -0.6197291, 2.591386, 0, 0.2627451, 1, 1,
0.2590806, -2.71712, 4.026273, 0, 0.254902, 1, 1,
0.260846, -0.9322118, 2.474921, 0, 0.2509804, 1, 1,
0.2608514, 0.8741739, -0.05645063, 0, 0.2431373, 1, 1,
0.2617193, -0.8322046, 3.019722, 0, 0.2392157, 1, 1,
0.2631692, -1.974487, 2.897748, 0, 0.2313726, 1, 1,
0.2651148, 0.2944134, -0.10976, 0, 0.227451, 1, 1,
0.2669815, -1.064719, 4.743775, 0, 0.2196078, 1, 1,
0.2682061, -1.836242, 2.902892, 0, 0.2156863, 1, 1,
0.2709365, 0.334504, -1.327102, 0, 0.2078431, 1, 1,
0.2744627, 0.2379455, 0.3466088, 0, 0.2039216, 1, 1,
0.2745854, 0.4175196, 1.115564, 0, 0.1960784, 1, 1,
0.2766775, -1.398278, 3.361612, 0, 0.1882353, 1, 1,
0.2779777, 0.7607411, -0.2399379, 0, 0.1843137, 1, 1,
0.2797889, -0.3930191, 3.647906, 0, 0.1764706, 1, 1,
0.2811427, 0.3470535, 1.043426, 0, 0.172549, 1, 1,
0.2815862, -0.6759294, 2.146592, 0, 0.1647059, 1, 1,
0.2843255, -2.94912, 3.210815, 0, 0.1607843, 1, 1,
0.2871559, 0.511652, -0.5600353, 0, 0.1529412, 1, 1,
0.2971211, 1.841724, -0.03679028, 0, 0.1490196, 1, 1,
0.2992539, 0.1601843, -0.6477045, 0, 0.1411765, 1, 1,
0.300449, -1.708107, 3.04738, 0, 0.1372549, 1, 1,
0.3023926, 0.7752954, -0.4313391, 0, 0.1294118, 1, 1,
0.3036353, -1.549516, 2.839062, 0, 0.1254902, 1, 1,
0.3121488, -0.4791676, 2.110403, 0, 0.1176471, 1, 1,
0.3166874, 0.196594, 1.41176, 0, 0.1137255, 1, 1,
0.3193002, 0.1952333, 0.8988022, 0, 0.1058824, 1, 1,
0.3236962, -0.3729537, 4.585181, 0, 0.09803922, 1, 1,
0.3348008, -1.07815, 2.011782, 0, 0.09411765, 1, 1,
0.3378047, -1.331161, 1.282477, 0, 0.08627451, 1, 1,
0.342744, -0.7530391, 1.746225, 0, 0.08235294, 1, 1,
0.3459282, -0.1844345, 1.874009, 0, 0.07450981, 1, 1,
0.349696, -0.8340341, 1.813175, 0, 0.07058824, 1, 1,
0.3534379, 0.2569496, 0.7989812, 0, 0.0627451, 1, 1,
0.3548138, 1.269438, 1.061007, 0, 0.05882353, 1, 1,
0.3614941, -1.014899, 2.410882, 0, 0.05098039, 1, 1,
0.3656232, -1.530742, 2.355044, 0, 0.04705882, 1, 1,
0.3710298, -2.752941, 3.39593, 0, 0.03921569, 1, 1,
0.3760522, -0.2660463, 2.643147, 0, 0.03529412, 1, 1,
0.378942, 0.8912283, -0.5731412, 0, 0.02745098, 1, 1,
0.3851049, 1.703114, 3.058598, 0, 0.02352941, 1, 1,
0.3873357, 1.610475, -1.166639, 0, 0.01568628, 1, 1,
0.3883114, -1.311891, 1.393697, 0, 0.01176471, 1, 1,
0.3897476, -0.3429306, 2.212291, 0, 0.003921569, 1, 1,
0.3931389, 1.119169, -1.221216, 0.003921569, 0, 1, 1,
0.3970083, -0.586148, 5.225296, 0.007843138, 0, 1, 1,
0.3988854, -1.865138, 1.468209, 0.01568628, 0, 1, 1,
0.4002083, -1.580293, 2.20988, 0.01960784, 0, 1, 1,
0.4011534, 0.3658079, 1.273076, 0.02745098, 0, 1, 1,
0.4028577, -0.07769896, 2.492187, 0.03137255, 0, 1, 1,
0.4033871, 0.6660922, 1.079572, 0.03921569, 0, 1, 1,
0.4065449, -0.6477565, 3.005955, 0.04313726, 0, 1, 1,
0.4094688, -0.1507759, 1.65131, 0.05098039, 0, 1, 1,
0.4096121, -0.8175243, 2.276192, 0.05490196, 0, 1, 1,
0.4106033, -0.7419472, 3.356322, 0.0627451, 0, 1, 1,
0.4126177, -0.7937374, 1.242347, 0.06666667, 0, 1, 1,
0.4128801, -0.8043612, 3.870535, 0.07450981, 0, 1, 1,
0.4147724, 0.1222735, 2.177514, 0.07843138, 0, 1, 1,
0.4162382, 1.436404, 0.5281186, 0.08627451, 0, 1, 1,
0.4229606, -1.299309, 3.989405, 0.09019608, 0, 1, 1,
0.4309174, 0.3889502, 0.9774508, 0.09803922, 0, 1, 1,
0.4355391, 1.643527, -0.06046058, 0.1058824, 0, 1, 1,
0.4371632, -1.575685, 2.782387, 0.1098039, 0, 1, 1,
0.4443583, 0.3878013, 1.121335, 0.1176471, 0, 1, 1,
0.4487405, -1.578167, 2.690463, 0.1215686, 0, 1, 1,
0.4491944, -0.280858, 4.243401, 0.1294118, 0, 1, 1,
0.4516558, -1.128664, 3.464522, 0.1333333, 0, 1, 1,
0.4523052, 0.2686723, 0.109164, 0.1411765, 0, 1, 1,
0.4531268, -0.184512, 3.48716, 0.145098, 0, 1, 1,
0.4531451, 0.8232238, 0.2272462, 0.1529412, 0, 1, 1,
0.4542567, 1.886236, 0.5982344, 0.1568628, 0, 1, 1,
0.4569867, -0.6953011, 2.363893, 0.1647059, 0, 1, 1,
0.458027, -1.97981, 0.9709275, 0.1686275, 0, 1, 1,
0.4612268, 2.291036, 0.4921531, 0.1764706, 0, 1, 1,
0.466358, 0.4664525, 1.942745, 0.1803922, 0, 1, 1,
0.4697887, -0.9627913, 3.809775, 0.1882353, 0, 1, 1,
0.4701752, -1.430601, 2.892745, 0.1921569, 0, 1, 1,
0.4718271, -0.9378919, 4.140004, 0.2, 0, 1, 1,
0.4740966, -1.666271, 3.735983, 0.2078431, 0, 1, 1,
0.4765556, -1.182487, 1.484491, 0.2117647, 0, 1, 1,
0.479998, -1.490456, 4.250571, 0.2196078, 0, 1, 1,
0.4889044, -1.875027, 2.159375, 0.2235294, 0, 1, 1,
0.4901499, -0.570752, 2.589809, 0.2313726, 0, 1, 1,
0.4913537, 0.6810424, -0.4877247, 0.2352941, 0, 1, 1,
0.4942147, 0.4942738, 1.215173, 0.2431373, 0, 1, 1,
0.495268, -1.589327, 2.452324, 0.2470588, 0, 1, 1,
0.4953269, 1.001415, 0.5000621, 0.254902, 0, 1, 1,
0.4960119, 0.7359549, 1.788225, 0.2588235, 0, 1, 1,
0.4984877, 0.2051563, 3.250372, 0.2666667, 0, 1, 1,
0.5006229, 0.5146276, 0.2764594, 0.2705882, 0, 1, 1,
0.5022811, 0.8034663, -0.4205736, 0.2784314, 0, 1, 1,
0.5133188, 0.1302487, 1.005779, 0.282353, 0, 1, 1,
0.5168208, -0.9353532, 4.824206, 0.2901961, 0, 1, 1,
0.5225976, 0.84916, 0.9324349, 0.2941177, 0, 1, 1,
0.5228326, 1.054312, 0.07706815, 0.3019608, 0, 1, 1,
0.5243543, 0.165785, 1.544719, 0.3098039, 0, 1, 1,
0.5300323, -0.1757883, 2.31326, 0.3137255, 0, 1, 1,
0.5326003, -0.7418368, 0.6630092, 0.3215686, 0, 1, 1,
0.5381398, 0.5333425, 0.4487768, 0.3254902, 0, 1, 1,
0.5392873, -0.2177422, 2.688141, 0.3333333, 0, 1, 1,
0.5437317, -0.5152704, 4.349283, 0.3372549, 0, 1, 1,
0.5452512, -1.815332, 5.105882, 0.345098, 0, 1, 1,
0.5482769, -1.077565, 0.7004926, 0.3490196, 0, 1, 1,
0.5492484, 0.52262, 0.3920726, 0.3568628, 0, 1, 1,
0.5505099, 0.1240892, 2.14933, 0.3607843, 0, 1, 1,
0.5512869, -0.5895724, 3.545432, 0.3686275, 0, 1, 1,
0.5552418, 0.2194529, 1.408637, 0.372549, 0, 1, 1,
0.558661, 0.7688656, 1.309037, 0.3803922, 0, 1, 1,
0.5621095, 0.2513177, 0.3987593, 0.3843137, 0, 1, 1,
0.5637266, 1.346508, -0.3216676, 0.3921569, 0, 1, 1,
0.5640563, 0.1434866, 0.4228357, 0.3960784, 0, 1, 1,
0.5664594, 1.513803, -0.116426, 0.4039216, 0, 1, 1,
0.5749796, -0.2097341, 0.8152329, 0.4117647, 0, 1, 1,
0.5771124, 0.2346157, -0.05533388, 0.4156863, 0, 1, 1,
0.5788472, 0.8610773, 2.581329, 0.4235294, 0, 1, 1,
0.5797824, -1.10672, 2.240379, 0.427451, 0, 1, 1,
0.5810991, -0.9855691, 1.094008, 0.4352941, 0, 1, 1,
0.5853063, 0.5048899, -0.5475433, 0.4392157, 0, 1, 1,
0.5855943, -1.469631, 5.692657, 0.4470588, 0, 1, 1,
0.5865393, 0.04875891, 0.6488841, 0.4509804, 0, 1, 1,
0.5902007, 0.5172684, 1.779445, 0.4588235, 0, 1, 1,
0.59031, 0.02827109, 1.426931, 0.4627451, 0, 1, 1,
0.5922217, -0.695783, 2.786142, 0.4705882, 0, 1, 1,
0.5965608, 0.6794704, 2.071712, 0.4745098, 0, 1, 1,
0.6002192, 0.01195583, 0.9433908, 0.4823529, 0, 1, 1,
0.603807, -0.6428782, 2.985357, 0.4862745, 0, 1, 1,
0.6066815, 0.4191453, 0.3000565, 0.4941176, 0, 1, 1,
0.6067541, -0.8922611, 2.919251, 0.5019608, 0, 1, 1,
0.6080157, -0.4196004, 2.028442, 0.5058824, 0, 1, 1,
0.615798, -0.3985932, 3.10108, 0.5137255, 0, 1, 1,
0.6170837, 0.7227861, 0.815385, 0.5176471, 0, 1, 1,
0.6228988, 1.579768, -0.2820426, 0.5254902, 0, 1, 1,
0.6250395, -1.817347, 4.085969, 0.5294118, 0, 1, 1,
0.6268716, -1.728345, 2.651488, 0.5372549, 0, 1, 1,
0.6282902, -1.162649, 1.589687, 0.5411765, 0, 1, 1,
0.628681, 0.2374119, 0.2491385, 0.5490196, 0, 1, 1,
0.6319352, -0.4903661, 3.00788, 0.5529412, 0, 1, 1,
0.6328503, 0.5120679, 0.8043729, 0.5607843, 0, 1, 1,
0.634447, 0.2348391, 0.5258064, 0.5647059, 0, 1, 1,
0.635939, 2.840517, -0.15104, 0.572549, 0, 1, 1,
0.6359683, 0.5632898, 1.07708, 0.5764706, 0, 1, 1,
0.6378253, 0.8662642, 1.7888, 0.5843138, 0, 1, 1,
0.6501051, 0.5562403, -0.08255012, 0.5882353, 0, 1, 1,
0.6502537, -0.8262317, 3.169114, 0.5960785, 0, 1, 1,
0.6526312, 0.7854008, 0.1791413, 0.6039216, 0, 1, 1,
0.6575003, -0.2313577, 2.975524, 0.6078432, 0, 1, 1,
0.6585009, 0.3114245, 2.078614, 0.6156863, 0, 1, 1,
0.6601012, -0.2171887, 2.32344, 0.6196079, 0, 1, 1,
0.6607323, 0.06202716, -0.04498146, 0.627451, 0, 1, 1,
0.6614065, 1.091978, 0.08490425, 0.6313726, 0, 1, 1,
0.6665815, 0.4989888, 0.01697836, 0.6392157, 0, 1, 1,
0.668299, 0.4137566, 1.14134, 0.6431373, 0, 1, 1,
0.6697429, -1.85068, 4.97754, 0.6509804, 0, 1, 1,
0.6732113, -0.5878642, 0.9798658, 0.654902, 0, 1, 1,
0.6753216, -1.062408, 3.252178, 0.6627451, 0, 1, 1,
0.6756865, 0.5673673, -0.5908318, 0.6666667, 0, 1, 1,
0.6827366, -0.4609212, 2.693882, 0.6745098, 0, 1, 1,
0.6856976, 1.532032, -0.9352186, 0.6784314, 0, 1, 1,
0.6877614, -0.7049426, 2.880497, 0.6862745, 0, 1, 1,
0.6917671, -1.045615, 1.488052, 0.6901961, 0, 1, 1,
0.6937538, -0.7507992, 1.331411, 0.6980392, 0, 1, 1,
0.7047389, -1.292831, 1.864915, 0.7058824, 0, 1, 1,
0.7078937, -1.04696, 2.873008, 0.7098039, 0, 1, 1,
0.7127846, 0.1649383, 2.272824, 0.7176471, 0, 1, 1,
0.7219158, 0.8900536, 0.167182, 0.7215686, 0, 1, 1,
0.7221605, -0.7329022, 2.448898, 0.7294118, 0, 1, 1,
0.7232733, 0.4638173, -0.2356184, 0.7333333, 0, 1, 1,
0.7277066, 0.5746598, -0.1527239, 0.7411765, 0, 1, 1,
0.7294997, -2.225017, 4.155971, 0.7450981, 0, 1, 1,
0.7307582, 0.08620838, 0.7394102, 0.7529412, 0, 1, 1,
0.7346084, 0.5286776, -0.3339443, 0.7568628, 0, 1, 1,
0.7367287, -1.64955, 0.82728, 0.7647059, 0, 1, 1,
0.7383273, 0.1546959, 1.535318, 0.7686275, 0, 1, 1,
0.7463779, -0.1225062, 2.528154, 0.7764706, 0, 1, 1,
0.7569175, 0.3268152, 0.8128, 0.7803922, 0, 1, 1,
0.7590472, 0.484065, 3.331413, 0.7882353, 0, 1, 1,
0.7697709, 0.04829727, 1.322952, 0.7921569, 0, 1, 1,
0.7750326, -0.1538028, 0.1498116, 0.8, 0, 1, 1,
0.7752187, -0.9076473, 3.040802, 0.8078431, 0, 1, 1,
0.7762578, -1.347272, 3.247977, 0.8117647, 0, 1, 1,
0.7797053, -0.34142, 1.558455, 0.8196079, 0, 1, 1,
0.7832907, 1.303389, -0.9097382, 0.8235294, 0, 1, 1,
0.7947432, 0.5449867, 1.061147, 0.8313726, 0, 1, 1,
0.7998785, -0.857526, 1.85132, 0.8352941, 0, 1, 1,
0.8011072, 0.796592, 2.342837, 0.8431373, 0, 1, 1,
0.8039166, -0.168435, 3.24849, 0.8470588, 0, 1, 1,
0.8042132, 1.184917, 1.379757, 0.854902, 0, 1, 1,
0.8090681, 0.3302744, 0.53888, 0.8588235, 0, 1, 1,
0.8111292, -0.1589807, 2.320307, 0.8666667, 0, 1, 1,
0.812953, 0.09726783, 2.052886, 0.8705882, 0, 1, 1,
0.8161075, -0.1128468, 0.8285368, 0.8784314, 0, 1, 1,
0.8163272, 1.627438, 1.331389, 0.8823529, 0, 1, 1,
0.816369, 0.144555, 1.696356, 0.8901961, 0, 1, 1,
0.8178564, 0.589371, 0.9076415, 0.8941177, 0, 1, 1,
0.8180522, -0.3015973, 0.4545904, 0.9019608, 0, 1, 1,
0.8208838, 0.02544108, 1.451942, 0.9098039, 0, 1, 1,
0.8215131, -0.4479884, 0.4043757, 0.9137255, 0, 1, 1,
0.8241863, -1.067239, 2.618825, 0.9215686, 0, 1, 1,
0.8258854, 0.6323894, 0.4140878, 0.9254902, 0, 1, 1,
0.8307154, 1.699401, 1.398741, 0.9333333, 0, 1, 1,
0.8375145, -1.364608, 2.442495, 0.9372549, 0, 1, 1,
0.8375384, -0.9700477, 1.80087, 0.945098, 0, 1, 1,
0.8416852, -1.183358, 1.082143, 0.9490196, 0, 1, 1,
0.8456028, -0.9207688, 2.305831, 0.9568627, 0, 1, 1,
0.8459474, 0.4020478, 0.9473783, 0.9607843, 0, 1, 1,
0.8566477, -1.474222, 2.276208, 0.9686275, 0, 1, 1,
0.8605388, 0.7117232, 2.516707, 0.972549, 0, 1, 1,
0.8613313, 0.5244433, 1.650916, 0.9803922, 0, 1, 1,
0.8653306, -1.912914, 2.130908, 0.9843137, 0, 1, 1,
0.8819538, 0.4745326, -0.7450733, 0.9921569, 0, 1, 1,
0.8878872, 0.287849, 2.847765, 0.9960784, 0, 1, 1,
0.8920078, 0.7700359, 1.237373, 1, 0, 0.9960784, 1,
0.895715, -0.7901344, 1.606392, 1, 0, 0.9882353, 1,
0.8957175, 1.506546, -0.2478086, 1, 0, 0.9843137, 1,
0.8987758, -0.4692158, 1.83959, 1, 0, 0.9764706, 1,
0.8991532, -0.5209556, 0.759152, 1, 0, 0.972549, 1,
0.9001482, 0.5281166, 0.001047209, 1, 0, 0.9647059, 1,
0.9039675, 1.480519, -0.002303677, 1, 0, 0.9607843, 1,
0.9053452, 0.3281845, 0.1675119, 1, 0, 0.9529412, 1,
0.9103603, -0.9692811, 3.578292, 1, 0, 0.9490196, 1,
0.9104328, -0.354128, 1.906244, 1, 0, 0.9411765, 1,
0.911936, -0.2440172, 2.285279, 1, 0, 0.9372549, 1,
0.9127242, 0.6385437, 0.1424699, 1, 0, 0.9294118, 1,
0.9142783, -0.1163922, 1.115501, 1, 0, 0.9254902, 1,
0.9161733, 0.0120371, 2.230622, 1, 0, 0.9176471, 1,
0.91842, -0.2100874, 2.217489, 1, 0, 0.9137255, 1,
0.9188848, -0.1478571, 2.197334, 1, 0, 0.9058824, 1,
0.922038, -1.01938, 4.469463, 1, 0, 0.9019608, 1,
0.9249087, -1.843161, 2.726682, 1, 0, 0.8941177, 1,
0.9275369, 0.1568908, 1.144826, 1, 0, 0.8862745, 1,
0.9315601, -0.4744225, 0.5648288, 1, 0, 0.8823529, 1,
0.9475374, 1.684942, 0.9520828, 1, 0, 0.8745098, 1,
0.9490263, -0.1925841, 3.47852, 1, 0, 0.8705882, 1,
0.9504303, -0.7743739, 3.433024, 1, 0, 0.8627451, 1,
0.9531642, 0.02513849, 0.9725346, 1, 0, 0.8588235, 1,
0.9578016, 0.2505808, 1.019702, 1, 0, 0.8509804, 1,
0.9623939, -1.604885, 2.276738, 1, 0, 0.8470588, 1,
0.9634839, 0.5089116, 0.4299648, 1, 0, 0.8392157, 1,
0.9695956, -0.7208772, 3.582264, 1, 0, 0.8352941, 1,
0.9727947, -0.3304192, 1.904703, 1, 0, 0.827451, 1,
0.9783101, 1.043224, -1.383625, 1, 0, 0.8235294, 1,
0.9796517, 0.920586, 1.820771, 1, 0, 0.8156863, 1,
0.9812157, -0.165162, 2.043362, 1, 0, 0.8117647, 1,
0.9852126, -0.06769871, 2.136118, 1, 0, 0.8039216, 1,
0.9994421, -0.3357615, 1.758599, 1, 0, 0.7960784, 1,
1.006321, -1.348393, 3.652092, 1, 0, 0.7921569, 1,
1.006691, 0.8686693, 1.219162, 1, 0, 0.7843137, 1,
1.017669, 0.5688892, 0.8607418, 1, 0, 0.7803922, 1,
1.021962, 2.175859, 0.2835072, 1, 0, 0.772549, 1,
1.026085, 1.080919, -0.3216387, 1, 0, 0.7686275, 1,
1.028198, -0.2411325, 1.577935, 1, 0, 0.7607843, 1,
1.030005, -1.85436, 3.169028, 1, 0, 0.7568628, 1,
1.032929, 0.5714468, 1.573305, 1, 0, 0.7490196, 1,
1.034188, 0.8994739, 2.198791, 1, 0, 0.7450981, 1,
1.034994, -1.27816, 3.112896, 1, 0, 0.7372549, 1,
1.043673, 0.8519635, 0.909906, 1, 0, 0.7333333, 1,
1.049099, -0.2290729, 1.905266, 1, 0, 0.7254902, 1,
1.051249, -1.156191, 1.778836, 1, 0, 0.7215686, 1,
1.052098, 1.345915, 2.359337, 1, 0, 0.7137255, 1,
1.060347, 0.9556732, 1.456962, 1, 0, 0.7098039, 1,
1.060944, 0.04355875, 0.8832675, 1, 0, 0.7019608, 1,
1.064468, 1.365612, 1.809811, 1, 0, 0.6941177, 1,
1.075392, -1.563633, 3.064718, 1, 0, 0.6901961, 1,
1.075465, -0.893856, 2.821324, 1, 0, 0.682353, 1,
1.082328, 1.289177, 0.7865695, 1, 0, 0.6784314, 1,
1.088124, -1.504659, 3.267951, 1, 0, 0.6705883, 1,
1.097044, -0.3045692, 2.924254, 1, 0, 0.6666667, 1,
1.099966, -0.222028, 0.5422592, 1, 0, 0.6588235, 1,
1.106734, -0.6723032, 2.363264, 1, 0, 0.654902, 1,
1.113547, 0.37803, 0.6287211, 1, 0, 0.6470588, 1,
1.116396, -0.4314442, 3.224964, 1, 0, 0.6431373, 1,
1.120704, 0.3437056, -0.201358, 1, 0, 0.6352941, 1,
1.122229, 0.7671363, 1.294031, 1, 0, 0.6313726, 1,
1.122299, 0.1628621, 0.8304203, 1, 0, 0.6235294, 1,
1.125444, -1.304258, 3.681833, 1, 0, 0.6196079, 1,
1.142114, -0.7838245, 3.232151, 1, 0, 0.6117647, 1,
1.148443, -1.591039, 2.283714, 1, 0, 0.6078432, 1,
1.163254, 0.207673, 1.836452, 1, 0, 0.6, 1,
1.175102, 0.5638582, 0.1671163, 1, 0, 0.5921569, 1,
1.175322, -1.066779, 3.26208, 1, 0, 0.5882353, 1,
1.18706, 0.4792104, -0.01309096, 1, 0, 0.5803922, 1,
1.193184, -0.5700046, 1.425943, 1, 0, 0.5764706, 1,
1.198296, 0.1511739, 1.528838, 1, 0, 0.5686275, 1,
1.199791, 0.9269282, 3.359956, 1, 0, 0.5647059, 1,
1.209537, -2.14126, 3.166723, 1, 0, 0.5568628, 1,
1.213768, -0.1531187, -0.4263708, 1, 0, 0.5529412, 1,
1.216117, 0.4483171, 2.513745, 1, 0, 0.5450981, 1,
1.226818, -1.428332, 2.546263, 1, 0, 0.5411765, 1,
1.227854, -0.3791563, 3.258213, 1, 0, 0.5333334, 1,
1.248422, 1.467887, -0.4301276, 1, 0, 0.5294118, 1,
1.250085, 1.617277, 1.553079, 1, 0, 0.5215687, 1,
1.252891, -0.618408, 1.794588, 1, 0, 0.5176471, 1,
1.25335, 0.9991139, 0.9529852, 1, 0, 0.509804, 1,
1.25864, 2.107792, 1.67397, 1, 0, 0.5058824, 1,
1.261936, -1.400162, 1.660419, 1, 0, 0.4980392, 1,
1.266529, 0.319411, 1.91679, 1, 0, 0.4901961, 1,
1.270665, -0.6117434, 3.459322, 1, 0, 0.4862745, 1,
1.273399, -1.330733, 2.569224, 1, 0, 0.4784314, 1,
1.285402, 1.786811, -0.5886227, 1, 0, 0.4745098, 1,
1.28784, -1.90619, 2.301167, 1, 0, 0.4666667, 1,
1.289918, -0.5555332, 1.063041, 1, 0, 0.4627451, 1,
1.291353, -0.7000913, 0.6959355, 1, 0, 0.454902, 1,
1.299281, -0.9387791, 1.699361, 1, 0, 0.4509804, 1,
1.305713, -0.939329, 3.1851, 1, 0, 0.4431373, 1,
1.317951, -1.105858, 1.779952, 1, 0, 0.4392157, 1,
1.319155, 0.477293, 0.4736852, 1, 0, 0.4313726, 1,
1.322852, 0.7321554, -0.08442472, 1, 0, 0.427451, 1,
1.335207, -0.9116712, 1.523093, 1, 0, 0.4196078, 1,
1.336442, 2.153819, 0.6192355, 1, 0, 0.4156863, 1,
1.339331, 0.3545892, 0.7993798, 1, 0, 0.4078431, 1,
1.352108, -0.6634932, 3.153234, 1, 0, 0.4039216, 1,
1.356212, -1.452349, 2.464133, 1, 0, 0.3960784, 1,
1.358763, 0.3529231, 0.9886329, 1, 0, 0.3882353, 1,
1.360536, -1.097745, 2.946132, 1, 0, 0.3843137, 1,
1.362126, -0.01012404, 2.318785, 1, 0, 0.3764706, 1,
1.362216, 0.174895, 0.4083417, 1, 0, 0.372549, 1,
1.375778, 0.3761138, 0.9407897, 1, 0, 0.3647059, 1,
1.380879, -0.4159225, 1.244991, 1, 0, 0.3607843, 1,
1.386996, 0.2496469, 0.7727444, 1, 0, 0.3529412, 1,
1.390932, 0.4326193, 1.320481, 1, 0, 0.3490196, 1,
1.402536, 0.6143793, -0.1592653, 1, 0, 0.3411765, 1,
1.403457, -0.5807052, 1.90961, 1, 0, 0.3372549, 1,
1.407628, -0.1018218, 2.467738, 1, 0, 0.3294118, 1,
1.408995, 2.249835, 1.501414, 1, 0, 0.3254902, 1,
1.423894, -0.03410991, -0.3456145, 1, 0, 0.3176471, 1,
1.430517, -0.4416132, 1.075263, 1, 0, 0.3137255, 1,
1.455725, 1.111949, 1.134067, 1, 0, 0.3058824, 1,
1.484551, -0.6392876, 3.339646, 1, 0, 0.2980392, 1,
1.488122, -1.940277, 3.247687, 1, 0, 0.2941177, 1,
1.523621, -0.191436, -0.1336663, 1, 0, 0.2862745, 1,
1.526404, -0.8056451, 1.467923, 1, 0, 0.282353, 1,
1.530163, 0.3606971, 2.422949, 1, 0, 0.2745098, 1,
1.533748, -0.3654956, 1.716017, 1, 0, 0.2705882, 1,
1.54793, 0.3389024, 1.3143, 1, 0, 0.2627451, 1,
1.547956, -0.9732997, 1.732689, 1, 0, 0.2588235, 1,
1.553698, -0.4482687, 3.114399, 1, 0, 0.2509804, 1,
1.571852, -0.798784, 1.571003, 1, 0, 0.2470588, 1,
1.588035, -0.2184822, 2.826182, 1, 0, 0.2392157, 1,
1.606379, 0.7705972, 2.14378, 1, 0, 0.2352941, 1,
1.613608, -0.9363914, 0.4966555, 1, 0, 0.227451, 1,
1.630435, 0.7866057, -1.488878, 1, 0, 0.2235294, 1,
1.691374, 1.273274, 2.88728, 1, 0, 0.2156863, 1,
1.694941, -0.715714, 0.9645175, 1, 0, 0.2117647, 1,
1.729028, 2.304529, -0.2196431, 1, 0, 0.2039216, 1,
1.736507, -0.4607263, 0.3971263, 1, 0, 0.1960784, 1,
1.738317, -1.333006, 3.180313, 1, 0, 0.1921569, 1,
1.794019, -1.616891, 2.913969, 1, 0, 0.1843137, 1,
1.816063, 0.3194667, 2.542578, 1, 0, 0.1803922, 1,
1.820677, 0.09258064, 3.435957, 1, 0, 0.172549, 1,
1.855748, -1.457297, 2.513279, 1, 0, 0.1686275, 1,
1.867362, -0.08386858, 2.659708, 1, 0, 0.1607843, 1,
1.883104, 1.421714, -0.1767909, 1, 0, 0.1568628, 1,
1.883512, 0.007495343, 0.2064878, 1, 0, 0.1490196, 1,
1.901865, -0.5352628, 1.146451, 1, 0, 0.145098, 1,
1.926283, 1.390196, 0.4542461, 1, 0, 0.1372549, 1,
1.93289, -1.81153, 2.930739, 1, 0, 0.1333333, 1,
1.940548, -0.3188314, 1.235036, 1, 0, 0.1254902, 1,
1.971955, -0.4226828, 3.393755, 1, 0, 0.1215686, 1,
1.990667, 1.502319, 1.144379, 1, 0, 0.1137255, 1,
2.014501, -0.1580233, 1.106052, 1, 0, 0.1098039, 1,
2.021116, 1.955221, 0.7490016, 1, 0, 0.1019608, 1,
2.05264, -1.769755, 2.717074, 1, 0, 0.09411765, 1,
2.056658, 0.3670734, -0.5030755, 1, 0, 0.09019608, 1,
2.091676, 0.1454557, -0.5811061, 1, 0, 0.08235294, 1,
2.146971, -0.6490905, 1.891832, 1, 0, 0.07843138, 1,
2.185484, 0.05769137, 1.647644, 1, 0, 0.07058824, 1,
2.212914, 0.3364502, 1.721678, 1, 0, 0.06666667, 1,
2.269615, -0.4603741, 2.408695, 1, 0, 0.05882353, 1,
2.325683, 0.9763688, 1.103936, 1, 0, 0.05490196, 1,
2.362919, -0.7124164, 1.419332, 1, 0, 0.04705882, 1,
2.372691, 1.145277, 0.6819044, 1, 0, 0.04313726, 1,
2.379347, 1.712823, 0.9577092, 1, 0, 0.03529412, 1,
2.709758, 0.1428153, 1.896634, 1, 0, 0.03137255, 1,
2.860235, 1.293244, 0.9583099, 1, 0, 0.02352941, 1,
2.900661, 0.8892191, 1.395196, 1, 0, 0.01960784, 1,
3.08415, 0.4831839, 0.6887658, 1, 0, 0.01176471, 1,
3.291189, -1.418009, 1.057113, 1, 0, 0.007843138, 1
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
0.2608852, -4.430335, -8.132635, 0, -0.5, 0.5, 0.5,
0.2608852, -4.430335, -8.132635, 1, -0.5, 0.5, 0.5,
0.2608852, -4.430335, -8.132635, 1, 1.5, 0.5, 0.5,
0.2608852, -4.430335, -8.132635, 0, 1.5, 0.5, 0.5
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
-3.796692, 0.3779434, -8.132635, 0, -0.5, 0.5, 0.5,
-3.796692, 0.3779434, -8.132635, 1, -0.5, 0.5, 0.5,
-3.796692, 0.3779434, -8.132635, 1, 1.5, 0.5, 0.5,
-3.796692, 0.3779434, -8.132635, 0, 1.5, 0.5, 0.5
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
-3.796692, -4.430335, -0.2181132, 0, -0.5, 0.5, 0.5,
-3.796692, -4.430335, -0.2181132, 1, -0.5, 0.5, 0.5,
-3.796692, -4.430335, -0.2181132, 1, 1.5, 0.5, 0.5,
-3.796692, -4.430335, -0.2181132, 0, 1.5, 0.5, 0.5
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
-2, -3.320732, -6.306207,
3, -3.320732, -6.306207,
-2, -3.320732, -6.306207,
-2, -3.505666, -6.610611,
-1, -3.320732, -6.306207,
-1, -3.505666, -6.610611,
0, -3.320732, -6.306207,
0, -3.505666, -6.610611,
1, -3.320732, -6.306207,
1, -3.505666, -6.610611,
2, -3.320732, -6.306207,
2, -3.505666, -6.610611,
3, -3.320732, -6.306207,
3, -3.505666, -6.610611
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
-2, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
-2, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
-2, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
-2, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5,
-1, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
-1, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
-1, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
-1, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5,
0, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
0, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
0, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
0, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5,
1, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
1, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
1, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
1, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5,
2, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
2, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
2, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
2, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5,
3, -3.875534, -7.219421, 0, -0.5, 0.5, 0.5,
3, -3.875534, -7.219421, 1, -0.5, 0.5, 0.5,
3, -3.875534, -7.219421, 1, 1.5, 0.5, 0.5,
3, -3.875534, -7.219421, 0, 1.5, 0.5, 0.5
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
-2.860328, -2, -6.306207,
-2.860328, 2, -6.306207,
-2.860328, -2, -6.306207,
-3.016389, -2, -6.610611,
-2.860328, 0, -6.306207,
-3.016389, 0, -6.610611,
-2.860328, 2, -6.306207,
-3.016389, 2, -6.610611
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
"0",
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
-3.32851, -2, -7.219421, 0, -0.5, 0.5, 0.5,
-3.32851, -2, -7.219421, 1, -0.5, 0.5, 0.5,
-3.32851, -2, -7.219421, 1, 1.5, 0.5, 0.5,
-3.32851, -2, -7.219421, 0, 1.5, 0.5, 0.5,
-3.32851, 0, -7.219421, 0, -0.5, 0.5, 0.5,
-3.32851, 0, -7.219421, 1, -0.5, 0.5, 0.5,
-3.32851, 0, -7.219421, 1, 1.5, 0.5, 0.5,
-3.32851, 0, -7.219421, 0, 1.5, 0.5, 0.5,
-3.32851, 2, -7.219421, 0, -0.5, 0.5, 0.5,
-3.32851, 2, -7.219421, 1, -0.5, 0.5, 0.5,
-3.32851, 2, -7.219421, 1, 1.5, 0.5, 0.5,
-3.32851, 2, -7.219421, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.860328, -3.320732, -6,
-2.860328, -3.320732, 4,
-2.860328, -3.320732, -6,
-3.016389, -3.505666, -6,
-2.860328, -3.320732, -4,
-3.016389, -3.505666, -4,
-2.860328, -3.320732, -2,
-3.016389, -3.505666, -2,
-2.860328, -3.320732, 0,
-3.016389, -3.505666, 0,
-2.860328, -3.320732, 2,
-3.016389, -3.505666, 2,
-2.860328, -3.320732, 4,
-3.016389, -3.505666, 4
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
-3.32851, -3.875534, -6, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -6, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -6, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, -6, 0, 1.5, 0.5, 0.5,
-3.32851, -3.875534, -4, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -4, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -4, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, -4, 0, 1.5, 0.5, 0.5,
-3.32851, -3.875534, -2, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -2, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, -2, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, -2, 0, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 0, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 0, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 0, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 0, 0, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 2, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 2, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 2, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 2, 0, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 4, 0, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 4, 1, -0.5, 0.5, 0.5,
-3.32851, -3.875534, 4, 1, 1.5, 0.5, 0.5,
-3.32851, -3.875534, 4, 0, 1.5, 0.5, 0.5
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
-2.860328, -3.320732, -6.306207,
-2.860328, 4.076619, -6.306207,
-2.860328, -3.320732, 5.869981,
-2.860328, 4.076619, 5.869981,
-2.860328, -3.320732, -6.306207,
-2.860328, -3.320732, 5.869981,
-2.860328, 4.076619, -6.306207,
-2.860328, 4.076619, 5.869981,
-2.860328, -3.320732, -6.306207,
3.382099, -3.320732, -6.306207,
-2.860328, -3.320732, 5.869981,
3.382099, -3.320732, 5.869981,
-2.860328, 4.076619, -6.306207,
3.382099, 4.076619, -6.306207,
-2.860328, 4.076619, 5.869981,
3.382099, 4.076619, 5.869981,
3.382099, -3.320732, -6.306207,
3.382099, 4.076619, -6.306207,
3.382099, -3.320732, 5.869981,
3.382099, 4.076619, 5.869981,
3.382099, -3.320732, -6.306207,
3.382099, -3.320732, 5.869981,
3.382099, 4.076619, -6.306207,
3.382099, 4.076619, 5.869981
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
var radius = 8.3059;
var distance = 36.95389;
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
mvMatrix.translate( -0.2608852, -0.3779434, 0.2181132 );
mvMatrix.scale( 1.438624, 1.214016, 0.7375463 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.95389);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
imazethapyr<-read.table("imazethapyr.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazethapyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
```

```r
y<-imazethapyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
```

```r
z<-imazethapyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
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
-2.769419, 0.1636731, -0.833009, 0, 0, 1, 1, 1,
-2.645102, -2.381144, -1.610441, 1, 0, 0, 1, 1,
-2.623957, -0.3332421, -3.209459, 1, 0, 0, 1, 1,
-2.611635, 1.304775, -1.257813, 1, 0, 0, 1, 1,
-2.522071, 0.6930599, -4.093553, 1, 0, 0, 1, 1,
-2.434891, 1.51293, -2.243393, 1, 0, 0, 1, 1,
-2.429425, -0.8848547, -1.850142, 0, 0, 0, 1, 1,
-2.392239, 0.4123814, -1.290139, 0, 0, 0, 1, 1,
-2.388963, 0.4487423, -0.9427929, 0, 0, 0, 1, 1,
-2.351188, -3.132134, -4.298917, 0, 0, 0, 1, 1,
-2.349938, 0.004974322, -0.9847327, 0, 0, 0, 1, 1,
-2.305935, -2.619029, -2.629892, 0, 0, 0, 1, 1,
-2.29525, -0.1826833, -0.9510313, 0, 0, 0, 1, 1,
-2.293894, -0.5263117, -1.299857, 1, 1, 1, 1, 1,
-2.282557, -0.4092119, -1.482637, 1, 1, 1, 1, 1,
-2.247882, 0.2690669, -0.3311822, 1, 1, 1, 1, 1,
-2.242889, 0.4501806, -0.9680773, 1, 1, 1, 1, 1,
-2.194107, -0.7035424, -1.914572, 1, 1, 1, 1, 1,
-2.157387, 0.01332592, -1.795295, 1, 1, 1, 1, 1,
-2.143419, 0.8448796, -1.459258, 1, 1, 1, 1, 1,
-2.050332, 0.4386505, -2.227558, 1, 1, 1, 1, 1,
-2.040566, 1.779393, 0.1222518, 1, 1, 1, 1, 1,
-2.024071, 1.620545, 0.8196431, 1, 1, 1, 1, 1,
-2.00893, 1.342563, -0.1694559, 1, 1, 1, 1, 1,
-1.992797, -1.872271, -1.493611, 1, 1, 1, 1, 1,
-1.966461, -1.489292, -1.426726, 1, 1, 1, 1, 1,
-1.923928, 1.377737, -0.4129107, 1, 1, 1, 1, 1,
-1.923795, 0.4863221, 0.6627225, 1, 1, 1, 1, 1,
-1.904525, 0.01233496, -1.686396, 0, 0, 1, 1, 1,
-1.885904, 0.1977355, -2.101734, 1, 0, 0, 1, 1,
-1.868657, 1.3857, -0.8027499, 1, 0, 0, 1, 1,
-1.853252, 0.06084264, -1.91986, 1, 0, 0, 1, 1,
-1.840298, -0.9478158, -2.458907, 1, 0, 0, 1, 1,
-1.837826, 0.5715798, -2.843123, 1, 0, 0, 1, 1,
-1.835201, 0.004295004, -0.4876898, 0, 0, 0, 1, 1,
-1.811381, -1.624614, -1.592646, 0, 0, 0, 1, 1,
-1.808658, 0.378017, -1.476072, 0, 0, 0, 1, 1,
-1.782081, -0.7475446, -1.276253, 0, 0, 0, 1, 1,
-1.764879, -1.281716, -4.063708, 0, 0, 0, 1, 1,
-1.761119, -0.1930586, -1.219683, 0, 0, 0, 1, 1,
-1.72576, 1.244272, 2.236249, 0, 0, 0, 1, 1,
-1.722937, 0.9206269, 2.455119, 1, 1, 1, 1, 1,
-1.722697, 0.7763458, -0.2873519, 1, 1, 1, 1, 1,
-1.720134, 2.045352, -0.8414149, 1, 1, 1, 1, 1,
-1.71382, -0.07593236, 0.1566121, 1, 1, 1, 1, 1,
-1.696901, 1.342029, -1.442742, 1, 1, 1, 1, 1,
-1.696419, 1.274856, -0.717478, 1, 1, 1, 1, 1,
-1.688817, 1.570533, -0.8238934, 1, 1, 1, 1, 1,
-1.682829, 1.296868, -2.833377, 1, 1, 1, 1, 1,
-1.670528, 0.5008705, -0.9581037, 1, 1, 1, 1, 1,
-1.660347, -0.7879111, -3.428832, 1, 1, 1, 1, 1,
-1.65706, 0.9021736, -3.150978, 1, 1, 1, 1, 1,
-1.651251, 1.127074, -1.219499, 1, 1, 1, 1, 1,
-1.640593, -0.392423, -1.437452, 1, 1, 1, 1, 1,
-1.639257, -1.230848, -2.531799, 1, 1, 1, 1, 1,
-1.637322, 1.145227, -0.6645318, 1, 1, 1, 1, 1,
-1.633624, -0.06298625, -2.709047, 0, 0, 1, 1, 1,
-1.630713, 0.3595079, -2.069431, 1, 0, 0, 1, 1,
-1.62849, -0.9629073, -3.584453, 1, 0, 0, 1, 1,
-1.624111, -0.7304526, -1.982817, 1, 0, 0, 1, 1,
-1.621776, -0.4884912, -1.943493, 1, 0, 0, 1, 1,
-1.613857, -0.6367069, -2.114197, 1, 0, 0, 1, 1,
-1.608076, -0.6142045, -3.219849, 0, 0, 0, 1, 1,
-1.60445, 0.3339358, -2.317291, 0, 0, 0, 1, 1,
-1.598889, -0.6600653, -2.69953, 0, 0, 0, 1, 1,
-1.590319, -1.494363, -2.547496, 0, 0, 0, 1, 1,
-1.589238, 0.001679857, -1.220408, 0, 0, 0, 1, 1,
-1.585003, -1.454515, -3.261743, 0, 0, 0, 1, 1,
-1.567459, -0.7714159, -1.450987, 0, 0, 0, 1, 1,
-1.567184, 3.968891, 1.040014, 1, 1, 1, 1, 1,
-1.562837, 1.060842, 1.306669, 1, 1, 1, 1, 1,
-1.555965, -0.06114833, -2.493085, 1, 1, 1, 1, 1,
-1.554131, -1.257954, -2.270492, 1, 1, 1, 1, 1,
-1.539335, -1.801948, -2.836098, 1, 1, 1, 1, 1,
-1.526854, 0.6651984, -3.381059, 1, 1, 1, 1, 1,
-1.523853, 0.254474, -1.62375, 1, 1, 1, 1, 1,
-1.514067, -1.52057, -2.057025, 1, 1, 1, 1, 1,
-1.506617, -0.8423905, -3.492194, 1, 1, 1, 1, 1,
-1.503828, -0.1755415, -2.288159, 1, 1, 1, 1, 1,
-1.481116, -0.9294654, -2.608452, 1, 1, 1, 1, 1,
-1.480106, 1.639061, -0.2087086, 1, 1, 1, 1, 1,
-1.479914, 0.9578183, 0.1182443, 1, 1, 1, 1, 1,
-1.477886, 1.618847, -0.9129889, 1, 1, 1, 1, 1,
-1.472273, 0.4710795, -1.314426, 1, 1, 1, 1, 1,
-1.468182, -0.2539569, -1.940035, 0, 0, 1, 1, 1,
-1.467274, 1.004758, -0.5334986, 1, 0, 0, 1, 1,
-1.458836, 0.5311036, -0.3604534, 1, 0, 0, 1, 1,
-1.456515, -0.1120203, -3.326225, 1, 0, 0, 1, 1,
-1.430699, -1.148066, -2.893179, 1, 0, 0, 1, 1,
-1.428828, 0.2180056, -1.393541, 1, 0, 0, 1, 1,
-1.422737, 1.52259, -0.7900708, 0, 0, 0, 1, 1,
-1.412729, 1.004146, -1.609967, 0, 0, 0, 1, 1,
-1.407161, 0.4393877, -0.5973557, 0, 0, 0, 1, 1,
-1.39724, -0.9794618, -2.867269, 0, 0, 0, 1, 1,
-1.39527, -0.130893, -1.037846, 0, 0, 0, 1, 1,
-1.38792, -0.3507786, -2.508959, 0, 0, 0, 1, 1,
-1.379577, 1.735564, 0.1357005, 0, 0, 0, 1, 1,
-1.371844, 0.3400997, -1.10352, 1, 1, 1, 1, 1,
-1.371343, 0.2899559, 0.4682604, 1, 1, 1, 1, 1,
-1.371205, -0.1737651, -0.3390612, 1, 1, 1, 1, 1,
-1.366746, -1.556233, -2.473362, 1, 1, 1, 1, 1,
-1.353327, 0.8568777, 0.440726, 1, 1, 1, 1, 1,
-1.348367, 0.8166634, -1.297187, 1, 1, 1, 1, 1,
-1.347793, 0.2914793, -3.897866, 1, 1, 1, 1, 1,
-1.316116, -2.495162, -0.3723874, 1, 1, 1, 1, 1,
-1.311063, 0.8954684, -1.380073, 1, 1, 1, 1, 1,
-1.30257, 0.7203463, -1.403493, 1, 1, 1, 1, 1,
-1.29912, 1.115853, -0.3315805, 1, 1, 1, 1, 1,
-1.298944, -2.322882, -1.802209, 1, 1, 1, 1, 1,
-1.297667, -0.08454748, -1.28729, 1, 1, 1, 1, 1,
-1.295823, 0.4906184, -1.502041, 1, 1, 1, 1, 1,
-1.287826, 0.5302812, -1.699662, 1, 1, 1, 1, 1,
-1.282679, 1.143773, -1.583208, 0, 0, 1, 1, 1,
-1.277202, 0.7498074, -1.133514, 1, 0, 0, 1, 1,
-1.271901, 0.5178221, -2.263713, 1, 0, 0, 1, 1,
-1.256323, 1.508996, -0.6738999, 1, 0, 0, 1, 1,
-1.241305, 0.4366014, -0.4717844, 1, 0, 0, 1, 1,
-1.239051, 0.2539876, -1.560784, 1, 0, 0, 1, 1,
-1.233522, -0.1184272, -3.494898, 0, 0, 0, 1, 1,
-1.225595, 0.0253091, -1.637821, 0, 0, 0, 1, 1,
-1.21629, -0.8039667, -1.045137, 0, 0, 0, 1, 1,
-1.20846, 1.266425, 0.4802207, 0, 0, 0, 1, 1,
-1.208456, -1.596054, -2.551972, 0, 0, 0, 1, 1,
-1.200602, 0.7449005, -1.175815, 0, 0, 0, 1, 1,
-1.19419, -0.8865456, -2.81103, 0, 0, 0, 1, 1,
-1.185318, -0.3497116, -1.918522, 1, 1, 1, 1, 1,
-1.184268, -0.7033126, -0.9898317, 1, 1, 1, 1, 1,
-1.182607, -1.445432, -2.822556, 1, 1, 1, 1, 1,
-1.177271, -0.1842171, -2.241097, 1, 1, 1, 1, 1,
-1.175802, -0.1102803, -1.259831, 1, 1, 1, 1, 1,
-1.16486, 1.043741, -1.550268, 1, 1, 1, 1, 1,
-1.160673, -0.3982591, -2.683242, 1, 1, 1, 1, 1,
-1.152911, 0.4613006, -2.740355, 1, 1, 1, 1, 1,
-1.146782, 0.7427495, -0.5399173, 1, 1, 1, 1, 1,
-1.146752, -0.3071951, -2.793933, 1, 1, 1, 1, 1,
-1.143118, 1.488232, -1.339087, 1, 1, 1, 1, 1,
-1.141965, -0.299659, -0.00421489, 1, 1, 1, 1, 1,
-1.140872, 1.941769, -0.2377955, 1, 1, 1, 1, 1,
-1.138204, -1.319151, -3.074975, 1, 1, 1, 1, 1,
-1.134405, -0.743909, -1.28505, 1, 1, 1, 1, 1,
-1.131564, 0.5852811, -2.070997, 0, 0, 1, 1, 1,
-1.13147, -0.4166225, -2.328317, 1, 0, 0, 1, 1,
-1.127025, -1.685581, -1.582506, 1, 0, 0, 1, 1,
-1.118005, 1.461169, 0.7808615, 1, 0, 0, 1, 1,
-1.117099, 0.7073168, -2.654586, 1, 0, 0, 1, 1,
-1.103197, 0.6314434, -1.341036, 1, 0, 0, 1, 1,
-1.102628, 0.07717557, -2.403655, 0, 0, 0, 1, 1,
-1.097033, 0.06058801, -1.411507, 0, 0, 0, 1, 1,
-1.095394, 0.1885335, -2.003799, 0, 0, 0, 1, 1,
-1.088913, -0.7017111, -3.423356, 0, 0, 0, 1, 1,
-1.086518, -0.3003686, -2.017641, 0, 0, 0, 1, 1,
-1.085652, -0.8006715, -2.967782, 0, 0, 0, 1, 1,
-1.082633, 1.084424, -1.103552, 0, 0, 0, 1, 1,
-1.079116, -0.9857219, -3.574334, 1, 1, 1, 1, 1,
-1.078893, -1.112588, -1.43816, 1, 1, 1, 1, 1,
-1.04171, -0.7252381, -1.795246, 1, 1, 1, 1, 1,
-1.040757, 1.584969, -0.4022789, 1, 1, 1, 1, 1,
-1.039206, -0.8429343, -1.992681, 1, 1, 1, 1, 1,
-1.034125, -1.162977, -3.251018, 1, 1, 1, 1, 1,
-1.032726, 0.4049936, -1.641392, 1, 1, 1, 1, 1,
-1.031762, 0.6158445, -0.08735764, 1, 1, 1, 1, 1,
-1.029666, -1.062775, -3.506526, 1, 1, 1, 1, 1,
-1.029352, 2.180456, 0.8283293, 1, 1, 1, 1, 1,
-1.028666, -3.213004, -3.325992, 1, 1, 1, 1, 1,
-1.026659, 1.574436, -0.9558935, 1, 1, 1, 1, 1,
-1.018822, -1.726231, -1.601516, 1, 1, 1, 1, 1,
-1.01606, 0.2574149, -2.218691, 1, 1, 1, 1, 1,
-1.010988, -1.398829, -1.562333, 1, 1, 1, 1, 1,
-1.000739, -0.0512458, -0.6217492, 0, 0, 1, 1, 1,
-0.9962099, -1.491851, -4.394372, 1, 0, 0, 1, 1,
-0.9948321, 1.298875, -0.4922835, 1, 0, 0, 1, 1,
-0.991138, 1.176244, 0.4435631, 1, 0, 0, 1, 1,
-0.9853234, -1.397895, -1.920234, 1, 0, 0, 1, 1,
-0.9782044, 1.102658, -0.3533701, 1, 0, 0, 1, 1,
-0.9778443, 0.6127186, -1.486138, 0, 0, 0, 1, 1,
-0.9765417, -0.1181453, -1.366735, 0, 0, 0, 1, 1,
-0.9755273, 0.6173205, -0.1382048, 0, 0, 0, 1, 1,
-0.9750392, -0.6497144, -3.228405, 0, 0, 0, 1, 1,
-0.9739949, 0.01994751, -2.716156, 0, 0, 0, 1, 1,
-0.9536901, -1.368327, -1.566502, 0, 0, 0, 1, 1,
-0.9480159, 1.099131, -2.865633, 0, 0, 0, 1, 1,
-0.9415385, -1.024135, -1.724624, 1, 1, 1, 1, 1,
-0.9401801, 0.2398876, -1.586414, 1, 1, 1, 1, 1,
-0.9370181, -1.025381, -2.212124, 1, 1, 1, 1, 1,
-0.9363903, 0.2907069, -1.408394, 1, 1, 1, 1, 1,
-0.9357002, 0.2520228, 0.8329377, 1, 1, 1, 1, 1,
-0.9353298, -0.2637929, -2.288805, 1, 1, 1, 1, 1,
-0.9340025, 1.95411, -0.178949, 1, 1, 1, 1, 1,
-0.9337489, 2.135232, 0.9257287, 1, 1, 1, 1, 1,
-0.9336153, -0.7702747, -1.273548, 1, 1, 1, 1, 1,
-0.9335997, -1.668634, -3.549407, 1, 1, 1, 1, 1,
-0.9334754, 1.654072, -0.03907469, 1, 1, 1, 1, 1,
-0.9318094, -1.289496, -2.407654, 1, 1, 1, 1, 1,
-0.9274743, 0.2618175, -0.7260934, 1, 1, 1, 1, 1,
-0.9204248, 1.206527, 1.087969, 1, 1, 1, 1, 1,
-0.9187192, -0.4666281, -3.122329, 1, 1, 1, 1, 1,
-0.913038, 1.206844, 0.9615646, 0, 0, 1, 1, 1,
-0.9083896, -0.9561347, -0.9714955, 1, 0, 0, 1, 1,
-0.9062986, -0.8749335, -1.073338, 1, 0, 0, 1, 1,
-0.9061294, -0.3821401, -1.130865, 1, 0, 0, 1, 1,
-0.9033669, 0.1698488, -1.955866, 1, 0, 0, 1, 1,
-0.9020903, 0.6713629, -2.025333, 1, 0, 0, 1, 1,
-0.8899933, 2.383228, -0.2494625, 0, 0, 0, 1, 1,
-0.8886876, 0.3148936, 0.2970611, 0, 0, 0, 1, 1,
-0.8882503, 1.948534, -1.233935, 0, 0, 0, 1, 1,
-0.8840805, -1.356702, -2.069447, 0, 0, 0, 1, 1,
-0.8807786, -0.1488239, -1.9983, 0, 0, 0, 1, 1,
-0.8699629, 0.3472688, -0.03192678, 0, 0, 0, 1, 1,
-0.8668793, 0.49325, -1.304507, 0, 0, 0, 1, 1,
-0.8653861, 0.3504011, 0.3799207, 1, 1, 1, 1, 1,
-0.8628065, -0.6651597, -2.171639, 1, 1, 1, 1, 1,
-0.8569216, 0.7271194, 1.699982, 1, 1, 1, 1, 1,
-0.8547281, 0.2861716, -1.78511, 1, 1, 1, 1, 1,
-0.851992, 0.4395146, -1.801736, 1, 1, 1, 1, 1,
-0.8511031, 0.9326508, -0.2848694, 1, 1, 1, 1, 1,
-0.8491231, 0.08905572, -1.691672, 1, 1, 1, 1, 1,
-0.8471396, 0.7856255, 0.1059557, 1, 1, 1, 1, 1,
-0.841869, -2.839258, -1.778412, 1, 1, 1, 1, 1,
-0.8328808, -0.185251, -3.026423, 1, 1, 1, 1, 1,
-0.8325991, 1.07648, -1.308124, 1, 1, 1, 1, 1,
-0.827397, 0.3412592, -3.811471, 1, 1, 1, 1, 1,
-0.8273363, 0.8151165, -2.498368, 1, 1, 1, 1, 1,
-0.8255888, 1.063062, -1.070622, 1, 1, 1, 1, 1,
-0.8195041, 1.230072, -0.8396407, 1, 1, 1, 1, 1,
-0.8094218, -0.8366073, -2.657436, 0, 0, 1, 1, 1,
-0.8093377, -1.192784, -1.301614, 1, 0, 0, 1, 1,
-0.8084247, 0.0007585507, -1.100732, 1, 0, 0, 1, 1,
-0.8003103, -2.027907, -3.263901, 1, 0, 0, 1, 1,
-0.7987927, 1.555023, -1.087609, 1, 0, 0, 1, 1,
-0.7978347, 0.7258266, -0.4807088, 1, 0, 0, 1, 1,
-0.7973536, -2.132451, -1.852085, 0, 0, 0, 1, 1,
-0.7953755, 1.484465, -1.807406, 0, 0, 0, 1, 1,
-0.7917528, 0.05454294, -1.891743, 0, 0, 0, 1, 1,
-0.791365, -0.3496337, -2.311113, 0, 0, 0, 1, 1,
-0.7884942, -2.408259, -4.167622, 0, 0, 0, 1, 1,
-0.7884334, 0.3094175, -2.105185, 0, 0, 0, 1, 1,
-0.7846459, 0.5973197, -0.8045096, 0, 0, 0, 1, 1,
-0.7785179, 1.528652, -1.471107, 1, 1, 1, 1, 1,
-0.7740641, 0.2605768, -1.223925, 1, 1, 1, 1, 1,
-0.7611904, 0.5948532, -0.8190974, 1, 1, 1, 1, 1,
-0.7543113, 0.5043832, 0.03811662, 1, 1, 1, 1, 1,
-0.7533108, -1.500352, -1.503692, 1, 1, 1, 1, 1,
-0.7518808, -0.9210196, -2.286649, 1, 1, 1, 1, 1,
-0.7516435, 1.260765, -0.6362514, 1, 1, 1, 1, 1,
-0.7449176, -2.04609, -3.724118, 1, 1, 1, 1, 1,
-0.7448148, -0.02485546, -0.7780154, 1, 1, 1, 1, 1,
-0.7437049, -0.7974606, -2.473207, 1, 1, 1, 1, 1,
-0.7432308, 0.3724627, -0.9523816, 1, 1, 1, 1, 1,
-0.7427669, -1.586266, -0.3761975, 1, 1, 1, 1, 1,
-0.7409222, -0.4848099, -0.3495463, 1, 1, 1, 1, 1,
-0.7399737, -0.6069582, -0.3745991, 1, 1, 1, 1, 1,
-0.7370903, -1.274758, -3.977165, 1, 1, 1, 1, 1,
-0.735633, -1.360626, -3.201339, 0, 0, 1, 1, 1,
-0.725605, -0.4171084, -2.268101, 1, 0, 0, 1, 1,
-0.718275, -0.476115, -1.932458, 1, 0, 0, 1, 1,
-0.7158439, 0.7644166, -1.123584, 1, 0, 0, 1, 1,
-0.7146152, -0.3665704, -2.291072, 1, 0, 0, 1, 1,
-0.7101414, -0.7865012, -0.7477489, 1, 0, 0, 1, 1,
-0.6969624, 0.007073225, -3.056308, 0, 0, 0, 1, 1,
-0.6918026, 0.189652, 0.07824904, 0, 0, 0, 1, 1,
-0.690841, -0.3040041, -3.176404, 0, 0, 0, 1, 1,
-0.6860332, 0.4297805, -1.329186, 0, 0, 0, 1, 1,
-0.6858762, -0.2217153, 0.792206, 0, 0, 0, 1, 1,
-0.6830264, 1.098514, -0.005732524, 0, 0, 0, 1, 1,
-0.6821702, 1.973903, -0.1510658, 0, 0, 0, 1, 1,
-0.6819611, 1.840546, -0.1990776, 1, 1, 1, 1, 1,
-0.6770792, -0.1944334, -1.769537, 1, 1, 1, 1, 1,
-0.6737825, 0.3937171, -2.188955, 1, 1, 1, 1, 1,
-0.6707505, 0.3121413, -2.516501, 1, 1, 1, 1, 1,
-0.6677132, -0.3827293, -1.31392, 1, 1, 1, 1, 1,
-0.661873, -0.7153192, -1.492318, 1, 1, 1, 1, 1,
-0.6601842, -1.426708, -0.5859531, 1, 1, 1, 1, 1,
-0.6566759, 0.2277492, -0.05174642, 1, 1, 1, 1, 1,
-0.6541559, -0.2623336, -2.22797, 1, 1, 1, 1, 1,
-0.6510791, -0.3320746, -0.7099123, 1, 1, 1, 1, 1,
-0.6505377, -0.1587914, 0.5204815, 1, 1, 1, 1, 1,
-0.6473518, -1.042106, -3.303376, 1, 1, 1, 1, 1,
-0.6376623, -0.5509348, -1.993122, 1, 1, 1, 1, 1,
-0.6366173, 0.5774235, 0.9275858, 1, 1, 1, 1, 1,
-0.6347123, -1.022639, -1.914098, 1, 1, 1, 1, 1,
-0.6329818, 0.03032378, -2.304951, 0, 0, 1, 1, 1,
-0.6302277, 1.004445, -1.153248, 1, 0, 0, 1, 1,
-0.6299896, 0.757538, -1.639951, 1, 0, 0, 1, 1,
-0.6220769, 0.6194515, -0.06012118, 1, 0, 0, 1, 1,
-0.6217346, 0.2559827, -1.599932, 1, 0, 0, 1, 1,
-0.6211088, 0.5468706, 0.0628641, 1, 0, 0, 1, 1,
-0.6202435, 0.1324567, -1.061441, 0, 0, 0, 1, 1,
-0.611281, -0.4346674, -2.285196, 0, 0, 0, 1, 1,
-0.6109816, -0.1886208, -1.895298, 0, 0, 0, 1, 1,
-0.6091458, -0.8813276, -2.267253, 0, 0, 0, 1, 1,
-0.6072852, 0.3883692, -0.6312967, 0, 0, 0, 1, 1,
-0.6060258, -0.2673064, -1.527512, 0, 0, 0, 1, 1,
-0.6028575, 0.2480213, -2.769618, 0, 0, 0, 1, 1,
-0.6026005, -0.7977289, -3.544767, 1, 1, 1, 1, 1,
-0.6004536, 0.9182593, -1.318719, 1, 1, 1, 1, 1,
-0.5992294, -1.828149, -3.227826, 1, 1, 1, 1, 1,
-0.5982734, 0.5247723, -0.3719674, 1, 1, 1, 1, 1,
-0.595562, -1.528694, -5.050211, 1, 1, 1, 1, 1,
-0.5919958, 0.8745489, -0.3693421, 1, 1, 1, 1, 1,
-0.5897336, 0.2283778, -1.333411, 1, 1, 1, 1, 1,
-0.5866297, -0.8356016, -1.50881, 1, 1, 1, 1, 1,
-0.5858534, 0.4555691, -1.728253, 1, 1, 1, 1, 1,
-0.5815309, -0.793115, -2.399576, 1, 1, 1, 1, 1,
-0.5800295, 0.1635796, -1.627662, 1, 1, 1, 1, 1,
-0.5713999, -0.4247231, -1.982832, 1, 1, 1, 1, 1,
-0.5687875, -0.6479363, -3.053297, 1, 1, 1, 1, 1,
-0.56774, -0.9929428, -2.987434, 1, 1, 1, 1, 1,
-0.5672668, -1.608581, -4.395183, 1, 1, 1, 1, 1,
-0.5636607, 0.2660241, 1.414328, 0, 0, 1, 1, 1,
-0.5612428, 1.350238, -1.763168, 1, 0, 0, 1, 1,
-0.5581292, 0.2247643, -0.2049084, 1, 0, 0, 1, 1,
-0.5577388, 0.2381922, -0.1905077, 1, 0, 0, 1, 1,
-0.5573248, 0.2939113, -1.781565, 1, 0, 0, 1, 1,
-0.5568671, 0.0368802, -1.854547, 1, 0, 0, 1, 1,
-0.5509485, -1.329512, -1.737679, 0, 0, 0, 1, 1,
-0.5448737, 0.9737733, 0.03716374, 0, 0, 0, 1, 1,
-0.544513, -0.2335647, -1.634604, 0, 0, 0, 1, 1,
-0.5408931, -0.500599, -2.589278, 0, 0, 0, 1, 1,
-0.5256341, -0.7194914, -0.3586916, 0, 0, 0, 1, 1,
-0.5255035, -1.561102, -3.498313, 0, 0, 0, 1, 1,
-0.524936, 2.180355, -1.712957, 0, 0, 0, 1, 1,
-0.5247549, -0.6108404, -6.128884, 1, 1, 1, 1, 1,
-0.5238165, 1.119874, -0.2891203, 1, 1, 1, 1, 1,
-0.5236315, 1.415292, -0.3024438, 1, 1, 1, 1, 1,
-0.5196083, -1.158889, -3.540856, 1, 1, 1, 1, 1,
-0.5189076, -1.285329, -2.842408, 1, 1, 1, 1, 1,
-0.5183448, -0.5590293, -1.644241, 1, 1, 1, 1, 1,
-0.5136446, -0.5352205, -1.585282, 1, 1, 1, 1, 1,
-0.5129972, -1.549703, -3.777164, 1, 1, 1, 1, 1,
-0.5124512, 1.602544, -0.3834787, 1, 1, 1, 1, 1,
-0.509672, 0.3292824, 1.636593, 1, 1, 1, 1, 1,
-0.5036011, 1.584547, -1.205206, 1, 1, 1, 1, 1,
-0.5031278, 0.4166102, -1.907163, 1, 1, 1, 1, 1,
-0.5022045, 1.089714, -0.7287626, 1, 1, 1, 1, 1,
-0.4977764, 1.247899, 1.690617, 1, 1, 1, 1, 1,
-0.4961109, -1.173586, -3.009989, 1, 1, 1, 1, 1,
-0.4918384, 1.247113, -2.034201, 0, 0, 1, 1, 1,
-0.4898006, 0.3005807, -1.86131, 1, 0, 0, 1, 1,
-0.4862596, 1.076064, 1.830335, 1, 0, 0, 1, 1,
-0.4800836, 1.245337, 0.7824553, 1, 0, 0, 1, 1,
-0.4793691, 0.9750188, -1.317684, 1, 0, 0, 1, 1,
-0.4789255, -0.1507434, -2.252002, 1, 0, 0, 1, 1,
-0.4774701, -0.7244675, -1.727083, 0, 0, 0, 1, 1,
-0.4662995, 0.9054137, -0.1125493, 0, 0, 0, 1, 1,
-0.4646873, -0.1521057, -2.362381, 0, 0, 0, 1, 1,
-0.4640527, -0.2040294, -4.201807, 0, 0, 0, 1, 1,
-0.4592581, -0.6187072, -2.21318, 0, 0, 0, 1, 1,
-0.4555553, 0.1663737, -1.259655, 0, 0, 0, 1, 1,
-0.4541059, 0.3062026, -1.442822, 0, 0, 0, 1, 1,
-0.4534, 0.8440269, -0.05615366, 1, 1, 1, 1, 1,
-0.4526208, 0.6116881, 0.1490669, 1, 1, 1, 1, 1,
-0.4520624, -0.448741, -1.962786, 1, 1, 1, 1, 1,
-0.4504163, -1.007231, -3.527858, 1, 1, 1, 1, 1,
-0.4496417, -1.717256, -1.504641, 1, 1, 1, 1, 1,
-0.446953, 0.6228852, 0.780596, 1, 1, 1, 1, 1,
-0.4400735, 1.429702, -3.838714, 1, 1, 1, 1, 1,
-0.4385085, -1.75015, -3.934855, 1, 1, 1, 1, 1,
-0.4356348, -1.34255, -1.865213, 1, 1, 1, 1, 1,
-0.4339371, -0.5909486, -2.282067, 1, 1, 1, 1, 1,
-0.433506, -0.1218145, -1.451995, 1, 1, 1, 1, 1,
-0.4259236, 0.5000373, -2.1005, 1, 1, 1, 1, 1,
-0.4257496, -0.4091143, -4.551413, 1, 1, 1, 1, 1,
-0.4249654, -0.08779031, -0.6696569, 1, 1, 1, 1, 1,
-0.419442, -0.9496546, -3.828107, 1, 1, 1, 1, 1,
-0.4182225, -1.516935, -2.934423, 0, 0, 1, 1, 1,
-0.4168594, 0.9631189, -0.07045481, 1, 0, 0, 1, 1,
-0.4116503, 0.1835725, -1.194533, 1, 0, 0, 1, 1,
-0.4043573, 0.3826151, -1.238414, 1, 0, 0, 1, 1,
-0.4007974, 1.664383, 0.6087851, 1, 0, 0, 1, 1,
-0.3999623, 0.9418117, 0.06447405, 1, 0, 0, 1, 1,
-0.3996461, 0.758629, 1.617605, 0, 0, 0, 1, 1,
-0.3991253, 1.993002, -1.152233, 0, 0, 0, 1, 1,
-0.3982506, -0.8656775, -5.718092, 0, 0, 0, 1, 1,
-0.3927719, 0.4238506, -0.8163239, 0, 0, 0, 1, 1,
-0.3922101, 0.2573256, -0.2618687, 0, 0, 0, 1, 1,
-0.3865133, 0.4240651, 0.150132, 0, 0, 0, 1, 1,
-0.3859501, -0.7040398, -3.063972, 0, 0, 0, 1, 1,
-0.3837498, 0.6451294, -1.44829, 1, 1, 1, 1, 1,
-0.383553, -3.200412, -3.380544, 1, 1, 1, 1, 1,
-0.3789425, 0.3224612, -2.07092, 1, 1, 1, 1, 1,
-0.3762569, -0.3466743, -2.560627, 1, 1, 1, 1, 1,
-0.3731373, -0.2258513, -2.731177, 1, 1, 1, 1, 1,
-0.3703751, 0.2221116, -1.188845, 1, 1, 1, 1, 1,
-0.36803, 0.07504858, -2.711578, 1, 1, 1, 1, 1,
-0.3674632, -0.9829068, -5.169121, 1, 1, 1, 1, 1,
-0.3622413, 1.170097, 0.2647043, 1, 1, 1, 1, 1,
-0.3493545, 0.08034654, -1.582603, 1, 1, 1, 1, 1,
-0.348372, 0.5701654, 0.1309818, 1, 1, 1, 1, 1,
-0.3470954, 0.9050964, -1.383993, 1, 1, 1, 1, 1,
-0.3447821, -0.7171551, -2.331569, 1, 1, 1, 1, 1,
-0.3245248, -0.9296, -3.441392, 1, 1, 1, 1, 1,
-0.3208424, -0.5490292, -2.02954, 1, 1, 1, 1, 1,
-0.3166177, 0.3555255, -0.4476969, 0, 0, 1, 1, 1,
-0.3163372, 0.6867283, 1.315136, 1, 0, 0, 1, 1,
-0.3083762, -1.00173, -3.837017, 1, 0, 0, 1, 1,
-0.3037412, -2.041785, -2.861837, 1, 0, 0, 1, 1,
-0.3000061, -1.769533, -2.807124, 1, 0, 0, 1, 1,
-0.2982348, 0.7765034, 0.1790292, 1, 0, 0, 1, 1,
-0.2951218, -0.479949, -1.934041, 0, 0, 0, 1, 1,
-0.2924678, 0.4041536, 0.3813439, 0, 0, 0, 1, 1,
-0.2906914, -0.2010796, -2.056649, 0, 0, 0, 1, 1,
-0.2884564, 0.2625031, -2.378663, 0, 0, 0, 1, 1,
-0.2879015, 0.138137, -1.673572, 0, 0, 0, 1, 1,
-0.2809745, -1.209884, -2.630181, 0, 0, 0, 1, 1,
-0.2798647, 1.914141, -1.539267, 0, 0, 0, 1, 1,
-0.2739053, 0.4364574, -1.528112, 1, 1, 1, 1, 1,
-0.2711103, 1.539594, -1.712287, 1, 1, 1, 1, 1,
-0.2695196, -0.1883376, -2.811912, 1, 1, 1, 1, 1,
-0.2674647, -1.329296, -1.555396, 1, 1, 1, 1, 1,
-0.2623235, -0.5228256, -4.144343, 1, 1, 1, 1, 1,
-0.2622994, 0.1098973, -1.221288, 1, 1, 1, 1, 1,
-0.2622853, 0.8259636, -1.242797, 1, 1, 1, 1, 1,
-0.262145, -1.080847, -1.992685, 1, 1, 1, 1, 1,
-0.2616838, -1.204189, -4.665048, 1, 1, 1, 1, 1,
-0.2613553, 1.063718, 1.301607, 1, 1, 1, 1, 1,
-0.2605199, 0.6737023, 0.7481749, 1, 1, 1, 1, 1,
-0.2580363, -0.4848435, -3.718711, 1, 1, 1, 1, 1,
-0.2580183, 1.268781, -1.344103, 1, 1, 1, 1, 1,
-0.2571186, 1.997963, -1.007631, 1, 1, 1, 1, 1,
-0.2547744, -0.6199807, -0.6116024, 1, 1, 1, 1, 1,
-0.2544242, -1.020321, -2.593616, 0, 0, 1, 1, 1,
-0.2530181, -0.748313, -1.627475, 1, 0, 0, 1, 1,
-0.2513268, 1.394627, -0.2041772, 1, 0, 0, 1, 1,
-0.2498197, -0.233741, -1.492656, 1, 0, 0, 1, 1,
-0.2388539, 0.2258484, -0.2689759, 1, 0, 0, 1, 1,
-0.2387266, 0.5540034, -1.861206, 1, 0, 0, 1, 1,
-0.2379042, 1.374726, 1.520011, 0, 0, 0, 1, 1,
-0.2355164, 0.8330718, 0.6291209, 0, 0, 0, 1, 1,
-0.225462, -1.007991, -3.216402, 0, 0, 0, 1, 1,
-0.2184775, 0.8839434, -0.7848197, 0, 0, 0, 1, 1,
-0.2179329, 0.2805311, -1.068257, 0, 0, 0, 1, 1,
-0.217558, -0.7181603, -1.186298, 0, 0, 0, 1, 1,
-0.2145428, -0.5752057, -1.03615, 0, 0, 0, 1, 1,
-0.2106756, -2.252517, -1.973277, 1, 1, 1, 1, 1,
-0.2084031, 0.3373331, -0.1906215, 1, 1, 1, 1, 1,
-0.2043694, -0.6163525, -3.073321, 1, 1, 1, 1, 1,
-0.2036288, 1.183153, 0.4583008, 1, 1, 1, 1, 1,
-0.2032173, 1.594229, 0.2104203, 1, 1, 1, 1, 1,
-0.1971737, -0.6532463, -4.518646, 1, 1, 1, 1, 1,
-0.188715, 1.585131, 0.2224904, 1, 1, 1, 1, 1,
-0.1874657, -0.04256015, -2.946288, 1, 1, 1, 1, 1,
-0.1829404, 0.4577627, 1.453896, 1, 1, 1, 1, 1,
-0.1822282, -1.35043, -2.367236, 1, 1, 1, 1, 1,
-0.1781414, 0.6355127, 2.525894, 1, 1, 1, 1, 1,
-0.1695126, -0.7517785, -2.141498, 1, 1, 1, 1, 1,
-0.1682384, 2.131006, -0.1998874, 1, 1, 1, 1, 1,
-0.1668027, 0.3111734, -1.45636, 1, 1, 1, 1, 1,
-0.1666274, -1.711663, -3.299158, 1, 1, 1, 1, 1,
-0.1653029, 0.5844688, -0.288633, 0, 0, 1, 1, 1,
-0.1643166, 0.1596614, -1.380064, 1, 0, 0, 1, 1,
-0.1632725, 0.6976789, -0.4056596, 1, 0, 0, 1, 1,
-0.1629035, 0.009361795, -1.037073, 1, 0, 0, 1, 1,
-0.1609992, -0.4980957, -3.786206, 1, 0, 0, 1, 1,
-0.1584315, -0.6880357, -3.989031, 1, 0, 0, 1, 1,
-0.1581085, -0.8598464, -2.913785, 0, 0, 0, 1, 1,
-0.1542721, -0.957111, -5.097377, 0, 0, 0, 1, 1,
-0.1537601, -0.6233262, -3.314143, 0, 0, 0, 1, 1,
-0.1537403, -0.7856236, -5.211793, 0, 0, 0, 1, 1,
-0.1527921, -0.179968, -1.21119, 0, 0, 0, 1, 1,
-0.147819, 1.446623, 0.07295462, 0, 0, 0, 1, 1,
-0.146546, -0.366179, -2.93716, 0, 0, 0, 1, 1,
-0.1464955, -1.166828, -4.634768, 1, 1, 1, 1, 1,
-0.1428052, 0.9230624, -0.1008091, 1, 1, 1, 1, 1,
-0.1404269, 0.6666114, 0.612083, 1, 1, 1, 1, 1,
-0.1346335, 0.1100941, -1.281671, 1, 1, 1, 1, 1,
-0.1340165, -0.5827214, -4.016306, 1, 1, 1, 1, 1,
-0.1292849, 0.9258599, 0.5584723, 1, 1, 1, 1, 1,
-0.1279199, -0.8100325, -1.531906, 1, 1, 1, 1, 1,
-0.1251914, 0.8646758, -0.6312501, 1, 1, 1, 1, 1,
-0.1238882, -0.6589383, -2.383981, 1, 1, 1, 1, 1,
-0.1232933, 1.38854, 0.6290396, 1, 1, 1, 1, 1,
-0.1210404, 0.4235672, 0.732022, 1, 1, 1, 1, 1,
-0.1186893, -0.1674512, -3.058846, 1, 1, 1, 1, 1,
-0.1159659, -0.247342, -2.690732, 1, 1, 1, 1, 1,
-0.1157414, 0.01683398, -0.3701226, 1, 1, 1, 1, 1,
-0.1139563, -1.252825, -2.311226, 1, 1, 1, 1, 1,
-0.1119457, 1.982293, 0.3348895, 0, 0, 1, 1, 1,
-0.1087037, 0.273619, -0.9957652, 1, 0, 0, 1, 1,
-0.1057139, -0.2743295, -1.409782, 1, 0, 0, 1, 1,
-0.09955716, -0.8800556, -4.843356, 1, 0, 0, 1, 1,
-0.0991829, -0.1164563, -2.309289, 1, 0, 0, 1, 1,
-0.0987209, -1.279073, -4.287394, 1, 0, 0, 1, 1,
-0.09859058, -0.2383775, -2.76704, 0, 0, 0, 1, 1,
-0.09841122, 0.1141355, -0.160591, 0, 0, 0, 1, 1,
-0.09629784, -0.6252037, -2.576253, 0, 0, 0, 1, 1,
-0.09178005, 1.064706, -0.7972273, 0, 0, 0, 1, 1,
-0.09053038, 1.647653, 0.5382441, 0, 0, 0, 1, 1,
-0.08663771, -1.590689, -3.352645, 0, 0, 0, 1, 1,
-0.0852806, -0.4104405, -2.379197, 0, 0, 0, 1, 1,
-0.08456137, 0.8624372, -1.064147, 1, 1, 1, 1, 1,
-0.08117521, -1.852241, -1.563963, 1, 1, 1, 1, 1,
-0.08085287, -0.1430707, -0.6563069, 1, 1, 1, 1, 1,
-0.07880306, 0.8950529, -0.7810167, 1, 1, 1, 1, 1,
-0.07756377, 0.7958244, 0.6991143, 1, 1, 1, 1, 1,
-0.07543498, 0.4249335, -1.500286, 1, 1, 1, 1, 1,
-0.07484984, -0.9722241, -4.035388, 1, 1, 1, 1, 1,
-0.07045501, -0.3121803, -1.448507, 1, 1, 1, 1, 1,
-0.06828579, 1.820706, -0.9416355, 1, 1, 1, 1, 1,
-0.06587515, 1.412508, -1.541747, 1, 1, 1, 1, 1,
-0.06357297, -1.047043, -2.182624, 1, 1, 1, 1, 1,
-0.06336422, 0.9738641, 0.3862526, 1, 1, 1, 1, 1,
-0.06107164, -0.2984836, -2.359847, 1, 1, 1, 1, 1,
-0.05938231, 0.2715326, -2.129764, 1, 1, 1, 1, 1,
-0.0564912, -0.0012395, -1.325012, 1, 1, 1, 1, 1,
-0.05329311, -1.988388, -2.14102, 0, 0, 1, 1, 1,
-0.0497092, 0.4700828, 0.2908208, 1, 0, 0, 1, 1,
-0.04766451, 1.748695, 1.739958, 1, 0, 0, 1, 1,
-0.03269111, -1.523977, -2.347997, 1, 0, 0, 1, 1,
-0.02992932, -1.218168, -2.454088, 1, 0, 0, 1, 1,
-0.02898165, -1.738418, -2.781216, 1, 0, 0, 1, 1,
-0.02799067, -0.4636319, -2.734896, 0, 0, 0, 1, 1,
-0.02354727, 1.397753, 0.3675966, 0, 0, 0, 1, 1,
-0.02254239, 0.8560234, 0.362554, 0, 0, 0, 1, 1,
-0.02136001, -1.018764, -3.070468, 0, 0, 0, 1, 1,
-0.02093249, 0.2603874, -0.276094, 0, 0, 0, 1, 1,
-0.01139662, -0.01312748, -2.518783, 0, 0, 0, 1, 1,
-0.006422884, 0.2134993, -0.7774163, 0, 0, 0, 1, 1,
-0.004585798, -1.660933, -2.925145, 1, 1, 1, 1, 1,
-0.000371991, -0.5158854, -2.282014, 1, 1, 1, 1, 1,
0.0004804324, -1.375565, 4.111775, 1, 1, 1, 1, 1,
0.00235644, -0.07761332, 4.248101, 1, 1, 1, 1, 1,
0.002480673, -2.235672, 3.733152, 1, 1, 1, 1, 1,
0.00400527, 0.3302438, -0.9992095, 1, 1, 1, 1, 1,
0.004704986, -1.159662, 3.926754, 1, 1, 1, 1, 1,
0.00532661, -0.830111, 3.364294, 1, 1, 1, 1, 1,
0.007191632, -2.168257, 2.969507, 1, 1, 1, 1, 1,
0.008706654, 1.134705, -1.365818, 1, 1, 1, 1, 1,
0.01107377, 0.1861669, 0.1456958, 1, 1, 1, 1, 1,
0.01761678, 0.2700844, -0.4518802, 1, 1, 1, 1, 1,
0.01990462, 0.5227991, 0.3005188, 1, 1, 1, 1, 1,
0.02580666, -0.8573502, 3.232687, 1, 1, 1, 1, 1,
0.02971431, 0.3857025, 0.06853957, 1, 1, 1, 1, 1,
0.03118225, -1.007501, 5.458906, 0, 0, 1, 1, 1,
0.03352418, 0.4707739, -1.059087, 1, 0, 0, 1, 1,
0.03440853, -0.4216864, 1.864881, 1, 0, 0, 1, 1,
0.0377935, -0.8014352, 4.32865, 1, 0, 0, 1, 1,
0.04439308, 1.131707, -1.513083, 1, 0, 0, 1, 1,
0.04961655, -1.438659, 2.888829, 1, 0, 0, 1, 1,
0.05093231, -0.5353056, 1.742805, 0, 0, 0, 1, 1,
0.05369942, -0.07225993, 1.008477, 0, 0, 0, 1, 1,
0.05902837, -2.404278, 2.552247, 0, 0, 0, 1, 1,
0.0594344, -1.127967, 2.559792, 0, 0, 0, 1, 1,
0.05945754, -0.3337368, 4.146746, 0, 0, 0, 1, 1,
0.06607924, 0.5100432, -1.531044, 0, 0, 0, 1, 1,
0.06770491, 2.047768, 0.8080955, 0, 0, 0, 1, 1,
0.07053418, -1.915438, 2.539455, 1, 1, 1, 1, 1,
0.07183288, 1.561976, -0.7107435, 1, 1, 1, 1, 1,
0.07312738, 1.328109, 0.5742643, 1, 1, 1, 1, 1,
0.07687073, -0.4661727, 1.432209, 1, 1, 1, 1, 1,
0.08227998, 1.126816, -0.1315325, 1, 1, 1, 1, 1,
0.08464984, 1.088398, -1.928902, 1, 1, 1, 1, 1,
0.08734295, 1.070656, 2.025426, 1, 1, 1, 1, 1,
0.09026168, -0.3583919, 3.908509, 1, 1, 1, 1, 1,
0.0936311, -0.2875702, 0.8417794, 1, 1, 1, 1, 1,
0.09924201, -0.8237716, 4.199605, 1, 1, 1, 1, 1,
0.09936775, 1.967686, -0.5038545, 1, 1, 1, 1, 1,
0.09988966, -0.5850866, 2.949858, 1, 1, 1, 1, 1,
0.1002589, 0.6882595, 0.8450136, 1, 1, 1, 1, 1,
0.1052014, 0.6174849, 1.196899, 1, 1, 1, 1, 1,
0.1064203, 1.876404, 0.738547, 1, 1, 1, 1, 1,
0.1082883, 0.9551636, -1.096613, 0, 0, 1, 1, 1,
0.1094998, -0.2535522, 3.645287, 1, 0, 0, 1, 1,
0.1156807, -0.3180367, 1.938892, 1, 0, 0, 1, 1,
0.1176505, 0.6130695, -0.2173894, 1, 0, 0, 1, 1,
0.1272212, -1.486706, 1.552344, 1, 0, 0, 1, 1,
0.1318091, -0.5671908, 1.845421, 1, 0, 0, 1, 1,
0.132847, -0.4311009, 2.20752, 0, 0, 0, 1, 1,
0.1332989, -0.6333094, 2.041654, 0, 0, 0, 1, 1,
0.1336772, -0.4368713, 3.965259, 0, 0, 0, 1, 1,
0.1352098, 0.3620407, 1.654685, 0, 0, 0, 1, 1,
0.1357382, 0.3193418, -0.687704, 0, 0, 0, 1, 1,
0.137632, -1.339028, 3.44181, 0, 0, 0, 1, 1,
0.139851, -0.9083117, 4.442786, 0, 0, 0, 1, 1,
0.1428721, -1.596223, 3.443306, 1, 1, 1, 1, 1,
0.144505, 1.733943, -0.08357898, 1, 1, 1, 1, 1,
0.145528, -2.092719, 3.065173, 1, 1, 1, 1, 1,
0.1483537, -0.2145703, 2.51486, 1, 1, 1, 1, 1,
0.1490052, -0.8112233, 5.154235, 1, 1, 1, 1, 1,
0.1506927, -0.0038799, 3.553426, 1, 1, 1, 1, 1,
0.1511916, 0.5564455, 1.237906, 1, 1, 1, 1, 1,
0.1616787, 0.3805668, 0.01978908, 1, 1, 1, 1, 1,
0.1632097, 0.7161359, -0.2477929, 1, 1, 1, 1, 1,
0.1675993, -1.286563, 1.673063, 1, 1, 1, 1, 1,
0.1680636, -0.1048221, 2.190697, 1, 1, 1, 1, 1,
0.17214, 0.7221571, 0.617863, 1, 1, 1, 1, 1,
0.1723687, 0.2904187, 0.1599855, 1, 1, 1, 1, 1,
0.1732607, -0.4441016, 2.161085, 1, 1, 1, 1, 1,
0.1747267, -0.4843984, 2.408616, 1, 1, 1, 1, 1,
0.1754576, 0.6543714, 0.8178867, 0, 0, 1, 1, 1,
0.1767838, 2.182784, -0.8918409, 1, 0, 0, 1, 1,
0.177497, -0.08096171, 1.095415, 1, 0, 0, 1, 1,
0.1789554, 0.7206532, -1.326738, 1, 0, 0, 1, 1,
0.1809571, 0.4503734, 2.255487, 1, 0, 0, 1, 1,
0.1873219, -2.550307, 2.835176, 1, 0, 0, 1, 1,
0.1878959, -0.8702996, 2.525166, 0, 0, 0, 1, 1,
0.1898675, -0.3138865, 1.980001, 0, 0, 0, 1, 1,
0.1949452, -1.945146, 2.40238, 0, 0, 0, 1, 1,
0.1954267, -0.3098048, 2.982938, 0, 0, 0, 1, 1,
0.2108973, 0.3960892, 1.442338, 0, 0, 0, 1, 1,
0.2111325, -0.5450891, 0.5599706, 0, 0, 0, 1, 1,
0.214336, -0.3200394, 0.9826974, 0, 0, 0, 1, 1,
0.215606, -0.4171302, 2.721241, 1, 1, 1, 1, 1,
0.2212648, -1.564, 3.365373, 1, 1, 1, 1, 1,
0.223086, -0.03976519, 2.307241, 1, 1, 1, 1, 1,
0.2232957, 0.9789031, 0.2534293, 1, 1, 1, 1, 1,
0.2242662, -0.8575259, 2.546375, 1, 1, 1, 1, 1,
0.2265332, -1.174517, 1.93189, 1, 1, 1, 1, 1,
0.2302117, 1.237945, 0.6104785, 1, 1, 1, 1, 1,
0.2308978, 0.7222463, 0.7382098, 1, 1, 1, 1, 1,
0.2346086, 0.3150096, 0.1784314, 1, 1, 1, 1, 1,
0.2348264, 0.947522, -0.6710119, 1, 1, 1, 1, 1,
0.2368199, -1.11312, 3.200752, 1, 1, 1, 1, 1,
0.2376195, -0.2287919, 1.655693, 1, 1, 1, 1, 1,
0.2391606, 1.012028, 2.01206, 1, 1, 1, 1, 1,
0.2426316, 2.076236, -0.9300075, 1, 1, 1, 1, 1,
0.2440218, -2.270573, 2.470167, 1, 1, 1, 1, 1,
0.2441096, 0.3034751, 2.952827, 0, 0, 1, 1, 1,
0.2449731, 1.324677, -0.1189028, 1, 0, 0, 1, 1,
0.2453215, -1.014524, 2.302443, 1, 0, 0, 1, 1,
0.2473543, -0.09492221, 2.014225, 1, 0, 0, 1, 1,
0.2474903, -0.05688174, 2.287335, 1, 0, 0, 1, 1,
0.2488396, -1.301025, 3.485454, 1, 0, 0, 1, 1,
0.2542363, 0.1329587, 0.7959919, 0, 0, 0, 1, 1,
0.2579367, -0.6197291, 2.591386, 0, 0, 0, 1, 1,
0.2590806, -2.71712, 4.026273, 0, 0, 0, 1, 1,
0.260846, -0.9322118, 2.474921, 0, 0, 0, 1, 1,
0.2608514, 0.8741739, -0.05645063, 0, 0, 0, 1, 1,
0.2617193, -0.8322046, 3.019722, 0, 0, 0, 1, 1,
0.2631692, -1.974487, 2.897748, 0, 0, 0, 1, 1,
0.2651148, 0.2944134, -0.10976, 1, 1, 1, 1, 1,
0.2669815, -1.064719, 4.743775, 1, 1, 1, 1, 1,
0.2682061, -1.836242, 2.902892, 1, 1, 1, 1, 1,
0.2709365, 0.334504, -1.327102, 1, 1, 1, 1, 1,
0.2744627, 0.2379455, 0.3466088, 1, 1, 1, 1, 1,
0.2745854, 0.4175196, 1.115564, 1, 1, 1, 1, 1,
0.2766775, -1.398278, 3.361612, 1, 1, 1, 1, 1,
0.2779777, 0.7607411, -0.2399379, 1, 1, 1, 1, 1,
0.2797889, -0.3930191, 3.647906, 1, 1, 1, 1, 1,
0.2811427, 0.3470535, 1.043426, 1, 1, 1, 1, 1,
0.2815862, -0.6759294, 2.146592, 1, 1, 1, 1, 1,
0.2843255, -2.94912, 3.210815, 1, 1, 1, 1, 1,
0.2871559, 0.511652, -0.5600353, 1, 1, 1, 1, 1,
0.2971211, 1.841724, -0.03679028, 1, 1, 1, 1, 1,
0.2992539, 0.1601843, -0.6477045, 1, 1, 1, 1, 1,
0.300449, -1.708107, 3.04738, 0, 0, 1, 1, 1,
0.3023926, 0.7752954, -0.4313391, 1, 0, 0, 1, 1,
0.3036353, -1.549516, 2.839062, 1, 0, 0, 1, 1,
0.3121488, -0.4791676, 2.110403, 1, 0, 0, 1, 1,
0.3166874, 0.196594, 1.41176, 1, 0, 0, 1, 1,
0.3193002, 0.1952333, 0.8988022, 1, 0, 0, 1, 1,
0.3236962, -0.3729537, 4.585181, 0, 0, 0, 1, 1,
0.3348008, -1.07815, 2.011782, 0, 0, 0, 1, 1,
0.3378047, -1.331161, 1.282477, 0, 0, 0, 1, 1,
0.342744, -0.7530391, 1.746225, 0, 0, 0, 1, 1,
0.3459282, -0.1844345, 1.874009, 0, 0, 0, 1, 1,
0.349696, -0.8340341, 1.813175, 0, 0, 0, 1, 1,
0.3534379, 0.2569496, 0.7989812, 0, 0, 0, 1, 1,
0.3548138, 1.269438, 1.061007, 1, 1, 1, 1, 1,
0.3614941, -1.014899, 2.410882, 1, 1, 1, 1, 1,
0.3656232, -1.530742, 2.355044, 1, 1, 1, 1, 1,
0.3710298, -2.752941, 3.39593, 1, 1, 1, 1, 1,
0.3760522, -0.2660463, 2.643147, 1, 1, 1, 1, 1,
0.378942, 0.8912283, -0.5731412, 1, 1, 1, 1, 1,
0.3851049, 1.703114, 3.058598, 1, 1, 1, 1, 1,
0.3873357, 1.610475, -1.166639, 1, 1, 1, 1, 1,
0.3883114, -1.311891, 1.393697, 1, 1, 1, 1, 1,
0.3897476, -0.3429306, 2.212291, 1, 1, 1, 1, 1,
0.3931389, 1.119169, -1.221216, 1, 1, 1, 1, 1,
0.3970083, -0.586148, 5.225296, 1, 1, 1, 1, 1,
0.3988854, -1.865138, 1.468209, 1, 1, 1, 1, 1,
0.4002083, -1.580293, 2.20988, 1, 1, 1, 1, 1,
0.4011534, 0.3658079, 1.273076, 1, 1, 1, 1, 1,
0.4028577, -0.07769896, 2.492187, 0, 0, 1, 1, 1,
0.4033871, 0.6660922, 1.079572, 1, 0, 0, 1, 1,
0.4065449, -0.6477565, 3.005955, 1, 0, 0, 1, 1,
0.4094688, -0.1507759, 1.65131, 1, 0, 0, 1, 1,
0.4096121, -0.8175243, 2.276192, 1, 0, 0, 1, 1,
0.4106033, -0.7419472, 3.356322, 1, 0, 0, 1, 1,
0.4126177, -0.7937374, 1.242347, 0, 0, 0, 1, 1,
0.4128801, -0.8043612, 3.870535, 0, 0, 0, 1, 1,
0.4147724, 0.1222735, 2.177514, 0, 0, 0, 1, 1,
0.4162382, 1.436404, 0.5281186, 0, 0, 0, 1, 1,
0.4229606, -1.299309, 3.989405, 0, 0, 0, 1, 1,
0.4309174, 0.3889502, 0.9774508, 0, 0, 0, 1, 1,
0.4355391, 1.643527, -0.06046058, 0, 0, 0, 1, 1,
0.4371632, -1.575685, 2.782387, 1, 1, 1, 1, 1,
0.4443583, 0.3878013, 1.121335, 1, 1, 1, 1, 1,
0.4487405, -1.578167, 2.690463, 1, 1, 1, 1, 1,
0.4491944, -0.280858, 4.243401, 1, 1, 1, 1, 1,
0.4516558, -1.128664, 3.464522, 1, 1, 1, 1, 1,
0.4523052, 0.2686723, 0.109164, 1, 1, 1, 1, 1,
0.4531268, -0.184512, 3.48716, 1, 1, 1, 1, 1,
0.4531451, 0.8232238, 0.2272462, 1, 1, 1, 1, 1,
0.4542567, 1.886236, 0.5982344, 1, 1, 1, 1, 1,
0.4569867, -0.6953011, 2.363893, 1, 1, 1, 1, 1,
0.458027, -1.97981, 0.9709275, 1, 1, 1, 1, 1,
0.4612268, 2.291036, 0.4921531, 1, 1, 1, 1, 1,
0.466358, 0.4664525, 1.942745, 1, 1, 1, 1, 1,
0.4697887, -0.9627913, 3.809775, 1, 1, 1, 1, 1,
0.4701752, -1.430601, 2.892745, 1, 1, 1, 1, 1,
0.4718271, -0.9378919, 4.140004, 0, 0, 1, 1, 1,
0.4740966, -1.666271, 3.735983, 1, 0, 0, 1, 1,
0.4765556, -1.182487, 1.484491, 1, 0, 0, 1, 1,
0.479998, -1.490456, 4.250571, 1, 0, 0, 1, 1,
0.4889044, -1.875027, 2.159375, 1, 0, 0, 1, 1,
0.4901499, -0.570752, 2.589809, 1, 0, 0, 1, 1,
0.4913537, 0.6810424, -0.4877247, 0, 0, 0, 1, 1,
0.4942147, 0.4942738, 1.215173, 0, 0, 0, 1, 1,
0.495268, -1.589327, 2.452324, 0, 0, 0, 1, 1,
0.4953269, 1.001415, 0.5000621, 0, 0, 0, 1, 1,
0.4960119, 0.7359549, 1.788225, 0, 0, 0, 1, 1,
0.4984877, 0.2051563, 3.250372, 0, 0, 0, 1, 1,
0.5006229, 0.5146276, 0.2764594, 0, 0, 0, 1, 1,
0.5022811, 0.8034663, -0.4205736, 1, 1, 1, 1, 1,
0.5133188, 0.1302487, 1.005779, 1, 1, 1, 1, 1,
0.5168208, -0.9353532, 4.824206, 1, 1, 1, 1, 1,
0.5225976, 0.84916, 0.9324349, 1, 1, 1, 1, 1,
0.5228326, 1.054312, 0.07706815, 1, 1, 1, 1, 1,
0.5243543, 0.165785, 1.544719, 1, 1, 1, 1, 1,
0.5300323, -0.1757883, 2.31326, 1, 1, 1, 1, 1,
0.5326003, -0.7418368, 0.6630092, 1, 1, 1, 1, 1,
0.5381398, 0.5333425, 0.4487768, 1, 1, 1, 1, 1,
0.5392873, -0.2177422, 2.688141, 1, 1, 1, 1, 1,
0.5437317, -0.5152704, 4.349283, 1, 1, 1, 1, 1,
0.5452512, -1.815332, 5.105882, 1, 1, 1, 1, 1,
0.5482769, -1.077565, 0.7004926, 1, 1, 1, 1, 1,
0.5492484, 0.52262, 0.3920726, 1, 1, 1, 1, 1,
0.5505099, 0.1240892, 2.14933, 1, 1, 1, 1, 1,
0.5512869, -0.5895724, 3.545432, 0, 0, 1, 1, 1,
0.5552418, 0.2194529, 1.408637, 1, 0, 0, 1, 1,
0.558661, 0.7688656, 1.309037, 1, 0, 0, 1, 1,
0.5621095, 0.2513177, 0.3987593, 1, 0, 0, 1, 1,
0.5637266, 1.346508, -0.3216676, 1, 0, 0, 1, 1,
0.5640563, 0.1434866, 0.4228357, 1, 0, 0, 1, 1,
0.5664594, 1.513803, -0.116426, 0, 0, 0, 1, 1,
0.5749796, -0.2097341, 0.8152329, 0, 0, 0, 1, 1,
0.5771124, 0.2346157, -0.05533388, 0, 0, 0, 1, 1,
0.5788472, 0.8610773, 2.581329, 0, 0, 0, 1, 1,
0.5797824, -1.10672, 2.240379, 0, 0, 0, 1, 1,
0.5810991, -0.9855691, 1.094008, 0, 0, 0, 1, 1,
0.5853063, 0.5048899, -0.5475433, 0, 0, 0, 1, 1,
0.5855943, -1.469631, 5.692657, 1, 1, 1, 1, 1,
0.5865393, 0.04875891, 0.6488841, 1, 1, 1, 1, 1,
0.5902007, 0.5172684, 1.779445, 1, 1, 1, 1, 1,
0.59031, 0.02827109, 1.426931, 1, 1, 1, 1, 1,
0.5922217, -0.695783, 2.786142, 1, 1, 1, 1, 1,
0.5965608, 0.6794704, 2.071712, 1, 1, 1, 1, 1,
0.6002192, 0.01195583, 0.9433908, 1, 1, 1, 1, 1,
0.603807, -0.6428782, 2.985357, 1, 1, 1, 1, 1,
0.6066815, 0.4191453, 0.3000565, 1, 1, 1, 1, 1,
0.6067541, -0.8922611, 2.919251, 1, 1, 1, 1, 1,
0.6080157, -0.4196004, 2.028442, 1, 1, 1, 1, 1,
0.615798, -0.3985932, 3.10108, 1, 1, 1, 1, 1,
0.6170837, 0.7227861, 0.815385, 1, 1, 1, 1, 1,
0.6228988, 1.579768, -0.2820426, 1, 1, 1, 1, 1,
0.6250395, -1.817347, 4.085969, 1, 1, 1, 1, 1,
0.6268716, -1.728345, 2.651488, 0, 0, 1, 1, 1,
0.6282902, -1.162649, 1.589687, 1, 0, 0, 1, 1,
0.628681, 0.2374119, 0.2491385, 1, 0, 0, 1, 1,
0.6319352, -0.4903661, 3.00788, 1, 0, 0, 1, 1,
0.6328503, 0.5120679, 0.8043729, 1, 0, 0, 1, 1,
0.634447, 0.2348391, 0.5258064, 1, 0, 0, 1, 1,
0.635939, 2.840517, -0.15104, 0, 0, 0, 1, 1,
0.6359683, 0.5632898, 1.07708, 0, 0, 0, 1, 1,
0.6378253, 0.8662642, 1.7888, 0, 0, 0, 1, 1,
0.6501051, 0.5562403, -0.08255012, 0, 0, 0, 1, 1,
0.6502537, -0.8262317, 3.169114, 0, 0, 0, 1, 1,
0.6526312, 0.7854008, 0.1791413, 0, 0, 0, 1, 1,
0.6575003, -0.2313577, 2.975524, 0, 0, 0, 1, 1,
0.6585009, 0.3114245, 2.078614, 1, 1, 1, 1, 1,
0.6601012, -0.2171887, 2.32344, 1, 1, 1, 1, 1,
0.6607323, 0.06202716, -0.04498146, 1, 1, 1, 1, 1,
0.6614065, 1.091978, 0.08490425, 1, 1, 1, 1, 1,
0.6665815, 0.4989888, 0.01697836, 1, 1, 1, 1, 1,
0.668299, 0.4137566, 1.14134, 1, 1, 1, 1, 1,
0.6697429, -1.85068, 4.97754, 1, 1, 1, 1, 1,
0.6732113, -0.5878642, 0.9798658, 1, 1, 1, 1, 1,
0.6753216, -1.062408, 3.252178, 1, 1, 1, 1, 1,
0.6756865, 0.5673673, -0.5908318, 1, 1, 1, 1, 1,
0.6827366, -0.4609212, 2.693882, 1, 1, 1, 1, 1,
0.6856976, 1.532032, -0.9352186, 1, 1, 1, 1, 1,
0.6877614, -0.7049426, 2.880497, 1, 1, 1, 1, 1,
0.6917671, -1.045615, 1.488052, 1, 1, 1, 1, 1,
0.6937538, -0.7507992, 1.331411, 1, 1, 1, 1, 1,
0.7047389, -1.292831, 1.864915, 0, 0, 1, 1, 1,
0.7078937, -1.04696, 2.873008, 1, 0, 0, 1, 1,
0.7127846, 0.1649383, 2.272824, 1, 0, 0, 1, 1,
0.7219158, 0.8900536, 0.167182, 1, 0, 0, 1, 1,
0.7221605, -0.7329022, 2.448898, 1, 0, 0, 1, 1,
0.7232733, 0.4638173, -0.2356184, 1, 0, 0, 1, 1,
0.7277066, 0.5746598, -0.1527239, 0, 0, 0, 1, 1,
0.7294997, -2.225017, 4.155971, 0, 0, 0, 1, 1,
0.7307582, 0.08620838, 0.7394102, 0, 0, 0, 1, 1,
0.7346084, 0.5286776, -0.3339443, 0, 0, 0, 1, 1,
0.7367287, -1.64955, 0.82728, 0, 0, 0, 1, 1,
0.7383273, 0.1546959, 1.535318, 0, 0, 0, 1, 1,
0.7463779, -0.1225062, 2.528154, 0, 0, 0, 1, 1,
0.7569175, 0.3268152, 0.8128, 1, 1, 1, 1, 1,
0.7590472, 0.484065, 3.331413, 1, 1, 1, 1, 1,
0.7697709, 0.04829727, 1.322952, 1, 1, 1, 1, 1,
0.7750326, -0.1538028, 0.1498116, 1, 1, 1, 1, 1,
0.7752187, -0.9076473, 3.040802, 1, 1, 1, 1, 1,
0.7762578, -1.347272, 3.247977, 1, 1, 1, 1, 1,
0.7797053, -0.34142, 1.558455, 1, 1, 1, 1, 1,
0.7832907, 1.303389, -0.9097382, 1, 1, 1, 1, 1,
0.7947432, 0.5449867, 1.061147, 1, 1, 1, 1, 1,
0.7998785, -0.857526, 1.85132, 1, 1, 1, 1, 1,
0.8011072, 0.796592, 2.342837, 1, 1, 1, 1, 1,
0.8039166, -0.168435, 3.24849, 1, 1, 1, 1, 1,
0.8042132, 1.184917, 1.379757, 1, 1, 1, 1, 1,
0.8090681, 0.3302744, 0.53888, 1, 1, 1, 1, 1,
0.8111292, -0.1589807, 2.320307, 1, 1, 1, 1, 1,
0.812953, 0.09726783, 2.052886, 0, 0, 1, 1, 1,
0.8161075, -0.1128468, 0.8285368, 1, 0, 0, 1, 1,
0.8163272, 1.627438, 1.331389, 1, 0, 0, 1, 1,
0.816369, 0.144555, 1.696356, 1, 0, 0, 1, 1,
0.8178564, 0.589371, 0.9076415, 1, 0, 0, 1, 1,
0.8180522, -0.3015973, 0.4545904, 1, 0, 0, 1, 1,
0.8208838, 0.02544108, 1.451942, 0, 0, 0, 1, 1,
0.8215131, -0.4479884, 0.4043757, 0, 0, 0, 1, 1,
0.8241863, -1.067239, 2.618825, 0, 0, 0, 1, 1,
0.8258854, 0.6323894, 0.4140878, 0, 0, 0, 1, 1,
0.8307154, 1.699401, 1.398741, 0, 0, 0, 1, 1,
0.8375145, -1.364608, 2.442495, 0, 0, 0, 1, 1,
0.8375384, -0.9700477, 1.80087, 0, 0, 0, 1, 1,
0.8416852, -1.183358, 1.082143, 1, 1, 1, 1, 1,
0.8456028, -0.9207688, 2.305831, 1, 1, 1, 1, 1,
0.8459474, 0.4020478, 0.9473783, 1, 1, 1, 1, 1,
0.8566477, -1.474222, 2.276208, 1, 1, 1, 1, 1,
0.8605388, 0.7117232, 2.516707, 1, 1, 1, 1, 1,
0.8613313, 0.5244433, 1.650916, 1, 1, 1, 1, 1,
0.8653306, -1.912914, 2.130908, 1, 1, 1, 1, 1,
0.8819538, 0.4745326, -0.7450733, 1, 1, 1, 1, 1,
0.8878872, 0.287849, 2.847765, 1, 1, 1, 1, 1,
0.8920078, 0.7700359, 1.237373, 1, 1, 1, 1, 1,
0.895715, -0.7901344, 1.606392, 1, 1, 1, 1, 1,
0.8957175, 1.506546, -0.2478086, 1, 1, 1, 1, 1,
0.8987758, -0.4692158, 1.83959, 1, 1, 1, 1, 1,
0.8991532, -0.5209556, 0.759152, 1, 1, 1, 1, 1,
0.9001482, 0.5281166, 0.001047209, 1, 1, 1, 1, 1,
0.9039675, 1.480519, -0.002303677, 0, 0, 1, 1, 1,
0.9053452, 0.3281845, 0.1675119, 1, 0, 0, 1, 1,
0.9103603, -0.9692811, 3.578292, 1, 0, 0, 1, 1,
0.9104328, -0.354128, 1.906244, 1, 0, 0, 1, 1,
0.911936, -0.2440172, 2.285279, 1, 0, 0, 1, 1,
0.9127242, 0.6385437, 0.1424699, 1, 0, 0, 1, 1,
0.9142783, -0.1163922, 1.115501, 0, 0, 0, 1, 1,
0.9161733, 0.0120371, 2.230622, 0, 0, 0, 1, 1,
0.91842, -0.2100874, 2.217489, 0, 0, 0, 1, 1,
0.9188848, -0.1478571, 2.197334, 0, 0, 0, 1, 1,
0.922038, -1.01938, 4.469463, 0, 0, 0, 1, 1,
0.9249087, -1.843161, 2.726682, 0, 0, 0, 1, 1,
0.9275369, 0.1568908, 1.144826, 0, 0, 0, 1, 1,
0.9315601, -0.4744225, 0.5648288, 1, 1, 1, 1, 1,
0.9475374, 1.684942, 0.9520828, 1, 1, 1, 1, 1,
0.9490263, -0.1925841, 3.47852, 1, 1, 1, 1, 1,
0.9504303, -0.7743739, 3.433024, 1, 1, 1, 1, 1,
0.9531642, 0.02513849, 0.9725346, 1, 1, 1, 1, 1,
0.9578016, 0.2505808, 1.019702, 1, 1, 1, 1, 1,
0.9623939, -1.604885, 2.276738, 1, 1, 1, 1, 1,
0.9634839, 0.5089116, 0.4299648, 1, 1, 1, 1, 1,
0.9695956, -0.7208772, 3.582264, 1, 1, 1, 1, 1,
0.9727947, -0.3304192, 1.904703, 1, 1, 1, 1, 1,
0.9783101, 1.043224, -1.383625, 1, 1, 1, 1, 1,
0.9796517, 0.920586, 1.820771, 1, 1, 1, 1, 1,
0.9812157, -0.165162, 2.043362, 1, 1, 1, 1, 1,
0.9852126, -0.06769871, 2.136118, 1, 1, 1, 1, 1,
0.9994421, -0.3357615, 1.758599, 1, 1, 1, 1, 1,
1.006321, -1.348393, 3.652092, 0, 0, 1, 1, 1,
1.006691, 0.8686693, 1.219162, 1, 0, 0, 1, 1,
1.017669, 0.5688892, 0.8607418, 1, 0, 0, 1, 1,
1.021962, 2.175859, 0.2835072, 1, 0, 0, 1, 1,
1.026085, 1.080919, -0.3216387, 1, 0, 0, 1, 1,
1.028198, -0.2411325, 1.577935, 1, 0, 0, 1, 1,
1.030005, -1.85436, 3.169028, 0, 0, 0, 1, 1,
1.032929, 0.5714468, 1.573305, 0, 0, 0, 1, 1,
1.034188, 0.8994739, 2.198791, 0, 0, 0, 1, 1,
1.034994, -1.27816, 3.112896, 0, 0, 0, 1, 1,
1.043673, 0.8519635, 0.909906, 0, 0, 0, 1, 1,
1.049099, -0.2290729, 1.905266, 0, 0, 0, 1, 1,
1.051249, -1.156191, 1.778836, 0, 0, 0, 1, 1,
1.052098, 1.345915, 2.359337, 1, 1, 1, 1, 1,
1.060347, 0.9556732, 1.456962, 1, 1, 1, 1, 1,
1.060944, 0.04355875, 0.8832675, 1, 1, 1, 1, 1,
1.064468, 1.365612, 1.809811, 1, 1, 1, 1, 1,
1.075392, -1.563633, 3.064718, 1, 1, 1, 1, 1,
1.075465, -0.893856, 2.821324, 1, 1, 1, 1, 1,
1.082328, 1.289177, 0.7865695, 1, 1, 1, 1, 1,
1.088124, -1.504659, 3.267951, 1, 1, 1, 1, 1,
1.097044, -0.3045692, 2.924254, 1, 1, 1, 1, 1,
1.099966, -0.222028, 0.5422592, 1, 1, 1, 1, 1,
1.106734, -0.6723032, 2.363264, 1, 1, 1, 1, 1,
1.113547, 0.37803, 0.6287211, 1, 1, 1, 1, 1,
1.116396, -0.4314442, 3.224964, 1, 1, 1, 1, 1,
1.120704, 0.3437056, -0.201358, 1, 1, 1, 1, 1,
1.122229, 0.7671363, 1.294031, 1, 1, 1, 1, 1,
1.122299, 0.1628621, 0.8304203, 0, 0, 1, 1, 1,
1.125444, -1.304258, 3.681833, 1, 0, 0, 1, 1,
1.142114, -0.7838245, 3.232151, 1, 0, 0, 1, 1,
1.148443, -1.591039, 2.283714, 1, 0, 0, 1, 1,
1.163254, 0.207673, 1.836452, 1, 0, 0, 1, 1,
1.175102, 0.5638582, 0.1671163, 1, 0, 0, 1, 1,
1.175322, -1.066779, 3.26208, 0, 0, 0, 1, 1,
1.18706, 0.4792104, -0.01309096, 0, 0, 0, 1, 1,
1.193184, -0.5700046, 1.425943, 0, 0, 0, 1, 1,
1.198296, 0.1511739, 1.528838, 0, 0, 0, 1, 1,
1.199791, 0.9269282, 3.359956, 0, 0, 0, 1, 1,
1.209537, -2.14126, 3.166723, 0, 0, 0, 1, 1,
1.213768, -0.1531187, -0.4263708, 0, 0, 0, 1, 1,
1.216117, 0.4483171, 2.513745, 1, 1, 1, 1, 1,
1.226818, -1.428332, 2.546263, 1, 1, 1, 1, 1,
1.227854, -0.3791563, 3.258213, 1, 1, 1, 1, 1,
1.248422, 1.467887, -0.4301276, 1, 1, 1, 1, 1,
1.250085, 1.617277, 1.553079, 1, 1, 1, 1, 1,
1.252891, -0.618408, 1.794588, 1, 1, 1, 1, 1,
1.25335, 0.9991139, 0.9529852, 1, 1, 1, 1, 1,
1.25864, 2.107792, 1.67397, 1, 1, 1, 1, 1,
1.261936, -1.400162, 1.660419, 1, 1, 1, 1, 1,
1.266529, 0.319411, 1.91679, 1, 1, 1, 1, 1,
1.270665, -0.6117434, 3.459322, 1, 1, 1, 1, 1,
1.273399, -1.330733, 2.569224, 1, 1, 1, 1, 1,
1.285402, 1.786811, -0.5886227, 1, 1, 1, 1, 1,
1.28784, -1.90619, 2.301167, 1, 1, 1, 1, 1,
1.289918, -0.5555332, 1.063041, 1, 1, 1, 1, 1,
1.291353, -0.7000913, 0.6959355, 0, 0, 1, 1, 1,
1.299281, -0.9387791, 1.699361, 1, 0, 0, 1, 1,
1.305713, -0.939329, 3.1851, 1, 0, 0, 1, 1,
1.317951, -1.105858, 1.779952, 1, 0, 0, 1, 1,
1.319155, 0.477293, 0.4736852, 1, 0, 0, 1, 1,
1.322852, 0.7321554, -0.08442472, 1, 0, 0, 1, 1,
1.335207, -0.9116712, 1.523093, 0, 0, 0, 1, 1,
1.336442, 2.153819, 0.6192355, 0, 0, 0, 1, 1,
1.339331, 0.3545892, 0.7993798, 0, 0, 0, 1, 1,
1.352108, -0.6634932, 3.153234, 0, 0, 0, 1, 1,
1.356212, -1.452349, 2.464133, 0, 0, 0, 1, 1,
1.358763, 0.3529231, 0.9886329, 0, 0, 0, 1, 1,
1.360536, -1.097745, 2.946132, 0, 0, 0, 1, 1,
1.362126, -0.01012404, 2.318785, 1, 1, 1, 1, 1,
1.362216, 0.174895, 0.4083417, 1, 1, 1, 1, 1,
1.375778, 0.3761138, 0.9407897, 1, 1, 1, 1, 1,
1.380879, -0.4159225, 1.244991, 1, 1, 1, 1, 1,
1.386996, 0.2496469, 0.7727444, 1, 1, 1, 1, 1,
1.390932, 0.4326193, 1.320481, 1, 1, 1, 1, 1,
1.402536, 0.6143793, -0.1592653, 1, 1, 1, 1, 1,
1.403457, -0.5807052, 1.90961, 1, 1, 1, 1, 1,
1.407628, -0.1018218, 2.467738, 1, 1, 1, 1, 1,
1.408995, 2.249835, 1.501414, 1, 1, 1, 1, 1,
1.423894, -0.03410991, -0.3456145, 1, 1, 1, 1, 1,
1.430517, -0.4416132, 1.075263, 1, 1, 1, 1, 1,
1.455725, 1.111949, 1.134067, 1, 1, 1, 1, 1,
1.484551, -0.6392876, 3.339646, 1, 1, 1, 1, 1,
1.488122, -1.940277, 3.247687, 1, 1, 1, 1, 1,
1.523621, -0.191436, -0.1336663, 0, 0, 1, 1, 1,
1.526404, -0.8056451, 1.467923, 1, 0, 0, 1, 1,
1.530163, 0.3606971, 2.422949, 1, 0, 0, 1, 1,
1.533748, -0.3654956, 1.716017, 1, 0, 0, 1, 1,
1.54793, 0.3389024, 1.3143, 1, 0, 0, 1, 1,
1.547956, -0.9732997, 1.732689, 1, 0, 0, 1, 1,
1.553698, -0.4482687, 3.114399, 0, 0, 0, 1, 1,
1.571852, -0.798784, 1.571003, 0, 0, 0, 1, 1,
1.588035, -0.2184822, 2.826182, 0, 0, 0, 1, 1,
1.606379, 0.7705972, 2.14378, 0, 0, 0, 1, 1,
1.613608, -0.9363914, 0.4966555, 0, 0, 0, 1, 1,
1.630435, 0.7866057, -1.488878, 0, 0, 0, 1, 1,
1.691374, 1.273274, 2.88728, 0, 0, 0, 1, 1,
1.694941, -0.715714, 0.9645175, 1, 1, 1, 1, 1,
1.729028, 2.304529, -0.2196431, 1, 1, 1, 1, 1,
1.736507, -0.4607263, 0.3971263, 1, 1, 1, 1, 1,
1.738317, -1.333006, 3.180313, 1, 1, 1, 1, 1,
1.794019, -1.616891, 2.913969, 1, 1, 1, 1, 1,
1.816063, 0.3194667, 2.542578, 1, 1, 1, 1, 1,
1.820677, 0.09258064, 3.435957, 1, 1, 1, 1, 1,
1.855748, -1.457297, 2.513279, 1, 1, 1, 1, 1,
1.867362, -0.08386858, 2.659708, 1, 1, 1, 1, 1,
1.883104, 1.421714, -0.1767909, 1, 1, 1, 1, 1,
1.883512, 0.007495343, 0.2064878, 1, 1, 1, 1, 1,
1.901865, -0.5352628, 1.146451, 1, 1, 1, 1, 1,
1.926283, 1.390196, 0.4542461, 1, 1, 1, 1, 1,
1.93289, -1.81153, 2.930739, 1, 1, 1, 1, 1,
1.940548, -0.3188314, 1.235036, 1, 1, 1, 1, 1,
1.971955, -0.4226828, 3.393755, 0, 0, 1, 1, 1,
1.990667, 1.502319, 1.144379, 1, 0, 0, 1, 1,
2.014501, -0.1580233, 1.106052, 1, 0, 0, 1, 1,
2.021116, 1.955221, 0.7490016, 1, 0, 0, 1, 1,
2.05264, -1.769755, 2.717074, 1, 0, 0, 1, 1,
2.056658, 0.3670734, -0.5030755, 1, 0, 0, 1, 1,
2.091676, 0.1454557, -0.5811061, 0, 0, 0, 1, 1,
2.146971, -0.6490905, 1.891832, 0, 0, 0, 1, 1,
2.185484, 0.05769137, 1.647644, 0, 0, 0, 1, 1,
2.212914, 0.3364502, 1.721678, 0, 0, 0, 1, 1,
2.269615, -0.4603741, 2.408695, 0, 0, 0, 1, 1,
2.325683, 0.9763688, 1.103936, 0, 0, 0, 1, 1,
2.362919, -0.7124164, 1.419332, 0, 0, 0, 1, 1,
2.372691, 1.145277, 0.6819044, 1, 1, 1, 1, 1,
2.379347, 1.712823, 0.9577092, 1, 1, 1, 1, 1,
2.709758, 0.1428153, 1.896634, 1, 1, 1, 1, 1,
2.860235, 1.293244, 0.9583099, 1, 1, 1, 1, 1,
2.900661, 0.8892191, 1.395196, 1, 1, 1, 1, 1,
3.08415, 0.4831839, 0.6887658, 1, 1, 1, 1, 1,
3.291189, -1.418009, 1.057113, 1, 1, 1, 1, 1
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
var radius = 10.1462;
var distance = 35.63811;
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
mvMatrix.translate( -0.2608851, -0.3779433, 0.2181132 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.63811);
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
