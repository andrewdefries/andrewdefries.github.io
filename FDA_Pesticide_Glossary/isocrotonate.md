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
-3.735101, 0.5357744, -1.447563, 1, 0, 0, 1,
-3.312769, 2.064067, -2.095219, 1, 0.007843138, 0, 1,
-3.311304, 0.09676345, -2.887888, 1, 0.01176471, 0, 1,
-2.833854, -2.448291, -2.362324, 1, 0.01960784, 0, 1,
-2.702035, -0.2403641, -1.884339, 1, 0.02352941, 0, 1,
-2.55191, 1.293119, -0.9324663, 1, 0.03137255, 0, 1,
-2.489352, -0.6457472, -0.8076185, 1, 0.03529412, 0, 1,
-2.467945, -1.055388, -2.035942, 1, 0.04313726, 0, 1,
-2.460576, -1.138494, -2.755376, 1, 0.04705882, 0, 1,
-2.372785, 0.1164418, -2.588206, 1, 0.05490196, 0, 1,
-2.346187, 0.7418681, -0.9752281, 1, 0.05882353, 0, 1,
-2.279889, -1.126394, -3.014962, 1, 0.06666667, 0, 1,
-2.26493, 2.25092, -0.5885473, 1, 0.07058824, 0, 1,
-2.251537, 2.480589, -0.1752295, 1, 0.07843138, 0, 1,
-2.232604, 1.119918, -0.8489738, 1, 0.08235294, 0, 1,
-2.193224, -1.059579, -1.8059, 1, 0.09019608, 0, 1,
-2.162663, -0.8957977, -0.855922, 1, 0.09411765, 0, 1,
-2.098937, 0.5694396, -0.5114091, 1, 0.1019608, 0, 1,
-2.089385, -0.1465052, -1.134418, 1, 0.1098039, 0, 1,
-2.087828, -1.172243, -2.555398, 1, 0.1137255, 0, 1,
-2.044726, -0.03675857, -1.859522, 1, 0.1215686, 0, 1,
-2.033945, -0.3394186, -0.6326447, 1, 0.1254902, 0, 1,
-2.029764, 0.5397733, -2.074515, 1, 0.1333333, 0, 1,
-1.997862, -1.895062, -3.674301, 1, 0.1372549, 0, 1,
-1.988092, 0.3384375, 0.8081809, 1, 0.145098, 0, 1,
-1.969123, 1.332094, -1.858129, 1, 0.1490196, 0, 1,
-1.959892, -1.406913, -1.863121, 1, 0.1568628, 0, 1,
-1.954602, -0.2896102, -1.342408, 1, 0.1607843, 0, 1,
-1.929365, 2.773366, 0.7496102, 1, 0.1686275, 0, 1,
-1.908098, -0.3950895, -0.7369244, 1, 0.172549, 0, 1,
-1.891911, 0.2721189, -1.574703, 1, 0.1803922, 0, 1,
-1.884221, 0.145969, -2.774474, 1, 0.1843137, 0, 1,
-1.874897, -0.4325444, -4.609859, 1, 0.1921569, 0, 1,
-1.84732, 0.8437948, -0.7254474, 1, 0.1960784, 0, 1,
-1.768218, -0.9561875, -3.842077, 1, 0.2039216, 0, 1,
-1.761782, 1.300587, -1.214667, 1, 0.2117647, 0, 1,
-1.74923, 1.239764, -0.09238129, 1, 0.2156863, 0, 1,
-1.748893, 0.2498095, -0.4007364, 1, 0.2235294, 0, 1,
-1.734791, -0.05200966, -1.293362, 1, 0.227451, 0, 1,
-1.716923, 0.7664227, -2.923001, 1, 0.2352941, 0, 1,
-1.709343, 0.2392129, -1.803072, 1, 0.2392157, 0, 1,
-1.703565, 0.3902172, -0.9111487, 1, 0.2470588, 0, 1,
-1.680326, -0.6830233, -2.27224, 1, 0.2509804, 0, 1,
-1.660405, -0.3421125, -0.8982679, 1, 0.2588235, 0, 1,
-1.649747, -1.603094, -2.385685, 1, 0.2627451, 0, 1,
-1.643952, -0.8503815, -2.630641, 1, 0.2705882, 0, 1,
-1.627576, 0.2740723, -0.04389339, 1, 0.2745098, 0, 1,
-1.618111, -0.2686509, -2.58166, 1, 0.282353, 0, 1,
-1.615629, 1.382519, -0.1655187, 1, 0.2862745, 0, 1,
-1.614164, -1.10155, -2.554793, 1, 0.2941177, 0, 1,
-1.591896, -1.525179, -4.088364, 1, 0.3019608, 0, 1,
-1.578014, -1.431846, -1.023014, 1, 0.3058824, 0, 1,
-1.570782, -0.6204596, 0.4821229, 1, 0.3137255, 0, 1,
-1.566536, 1.012308, 0.7999008, 1, 0.3176471, 0, 1,
-1.564172, -1.326645, -1.957557, 1, 0.3254902, 0, 1,
-1.561998, 0.2471879, -1.453698, 1, 0.3294118, 0, 1,
-1.561986, 0.1480602, 0.1531567, 1, 0.3372549, 0, 1,
-1.56075, -1.71007, -4.328393, 1, 0.3411765, 0, 1,
-1.554531, -0.6702876, -2.843445, 1, 0.3490196, 0, 1,
-1.546239, 0.8582602, 1.022532, 1, 0.3529412, 0, 1,
-1.529019, -1.158051, -1.883798, 1, 0.3607843, 0, 1,
-1.525337, -0.106384, -0.5550619, 1, 0.3647059, 0, 1,
-1.503689, 2.403178, -0.7183613, 1, 0.372549, 0, 1,
-1.50262, 1.413459, -3.207061, 1, 0.3764706, 0, 1,
-1.496191, 0.4863757, -0.8084111, 1, 0.3843137, 0, 1,
-1.495986, -0.3741503, -1.663925, 1, 0.3882353, 0, 1,
-1.491805, -0.05428528, -1.782546, 1, 0.3960784, 0, 1,
-1.491028, 0.6754802, -1.489631, 1, 0.4039216, 0, 1,
-1.490662, 0.2537108, -1.016374, 1, 0.4078431, 0, 1,
-1.489043, 0.6291312, 0.8841158, 1, 0.4156863, 0, 1,
-1.482436, -0.4521093, -2.665729, 1, 0.4196078, 0, 1,
-1.479929, 1.124585, 0.4098718, 1, 0.427451, 0, 1,
-1.479671, 0.6009284, -1.570418, 1, 0.4313726, 0, 1,
-1.477566, -0.892386, -2.477974, 1, 0.4392157, 0, 1,
-1.468536, 0.09067576, 0.8706073, 1, 0.4431373, 0, 1,
-1.462139, 0.4116551, -1.692432, 1, 0.4509804, 0, 1,
-1.461562, -0.6162583, -2.509247, 1, 0.454902, 0, 1,
-1.459292, 0.5994002, -2.342884, 1, 0.4627451, 0, 1,
-1.453609, -2.113314, -3.531884, 1, 0.4666667, 0, 1,
-1.448465, -1.35387, -2.654723, 1, 0.4745098, 0, 1,
-1.42362, -1.58491, 0.06919893, 1, 0.4784314, 0, 1,
-1.419992, -0.2974823, -2.88795, 1, 0.4862745, 0, 1,
-1.413166, 0.206852, -2.707928, 1, 0.4901961, 0, 1,
-1.41066, 0.8719685, -3.756932, 1, 0.4980392, 0, 1,
-1.408419, 0.2736904, -2.353712, 1, 0.5058824, 0, 1,
-1.386353, -1.190711, -1.537266, 1, 0.509804, 0, 1,
-1.383575, -1.293982, -0.8220168, 1, 0.5176471, 0, 1,
-1.378348, 0.6833747, -1.427589, 1, 0.5215687, 0, 1,
-1.371649, -1.319321, -1.249506, 1, 0.5294118, 0, 1,
-1.370307, 1.116937, 0.30807, 1, 0.5333334, 0, 1,
-1.346786, 0.6035013, -2.578171, 1, 0.5411765, 0, 1,
-1.339351, -2.236442, -3.476575, 1, 0.5450981, 0, 1,
-1.336822, 0.8746733, -1.211893, 1, 0.5529412, 0, 1,
-1.329913, 1.143577, 1.228896, 1, 0.5568628, 0, 1,
-1.326402, 0.6749095, -1.806952, 1, 0.5647059, 0, 1,
-1.317537, 0.6599039, -0.8518661, 1, 0.5686275, 0, 1,
-1.316871, -1.480004, -1.326478, 1, 0.5764706, 0, 1,
-1.302922, 1.178317, 0.5840906, 1, 0.5803922, 0, 1,
-1.301117, 0.4459629, -1.533555, 1, 0.5882353, 0, 1,
-1.296526, 0.07411072, -2.696817, 1, 0.5921569, 0, 1,
-1.28963, -2.287461, -2.505119, 1, 0.6, 0, 1,
-1.288134, 0.5466762, -1.570587, 1, 0.6078432, 0, 1,
-1.279302, -1.464292, -3.024717, 1, 0.6117647, 0, 1,
-1.273466, 1.101716, -0.1759287, 1, 0.6196079, 0, 1,
-1.273194, -0.352743, -1.471763, 1, 0.6235294, 0, 1,
-1.268647, -1.139624, -2.267674, 1, 0.6313726, 0, 1,
-1.268405, -1.687265, -2.146874, 1, 0.6352941, 0, 1,
-1.267766, -1.36604, -2.318189, 1, 0.6431373, 0, 1,
-1.259931, -0.3665565, -1.934781, 1, 0.6470588, 0, 1,
-1.258412, -2.023956, -4.053381, 1, 0.654902, 0, 1,
-1.257529, 0.2867354, -0.6022419, 1, 0.6588235, 0, 1,
-1.254281, -0.44989, -2.04322, 1, 0.6666667, 0, 1,
-1.235821, -0.04016585, -1.314406, 1, 0.6705883, 0, 1,
-1.234594, -0.3386852, -2.426599, 1, 0.6784314, 0, 1,
-1.231715, 0.3222772, -2.332887, 1, 0.682353, 0, 1,
-1.23063, -0.7741735, -1.859063, 1, 0.6901961, 0, 1,
-1.224177, 0.02643288, -0.5162407, 1, 0.6941177, 0, 1,
-1.221681, -1.633598, -1.067174, 1, 0.7019608, 0, 1,
-1.217266, -0.07387534, -1.96257, 1, 0.7098039, 0, 1,
-1.214363, 1.65482, 0.878066, 1, 0.7137255, 0, 1,
-1.21323, 2.144939, 1.994448, 1, 0.7215686, 0, 1,
-1.208765, -0.2483059, -1.976808, 1, 0.7254902, 0, 1,
-1.206991, 0.3441447, -3.09497, 1, 0.7333333, 0, 1,
-1.199332, 1.29583, -0.3984285, 1, 0.7372549, 0, 1,
-1.19798, -0.03449786, 0.02680984, 1, 0.7450981, 0, 1,
-1.196386, 0.7239642, -0.3083539, 1, 0.7490196, 0, 1,
-1.190102, 1.092227, -0.7963369, 1, 0.7568628, 0, 1,
-1.189546, -1.281558, -4.029758, 1, 0.7607843, 0, 1,
-1.18753, 1.357778, -1.069645, 1, 0.7686275, 0, 1,
-1.180915, 1.949253, -0.6111075, 1, 0.772549, 0, 1,
-1.17594, -0.5373961, -1.835153, 1, 0.7803922, 0, 1,
-1.172768, 0.7671875, -0.8958205, 1, 0.7843137, 0, 1,
-1.172527, -0.02632494, -3.082193, 1, 0.7921569, 0, 1,
-1.17204, -2.018719, -1.999625, 1, 0.7960784, 0, 1,
-1.162498, 2.673508, -0.001570562, 1, 0.8039216, 0, 1,
-1.162078, 0.1097746, -0.5668973, 1, 0.8117647, 0, 1,
-1.155042, -0.367214, -1.115392, 1, 0.8156863, 0, 1,
-1.154037, 1.071939, -1.109134, 1, 0.8235294, 0, 1,
-1.147645, 1.033903, -1.228789, 1, 0.827451, 0, 1,
-1.145796, -2.154136, -2.908799, 1, 0.8352941, 0, 1,
-1.13104, 1.415699, -0.4834129, 1, 0.8392157, 0, 1,
-1.128983, -1.361564, -1.896019, 1, 0.8470588, 0, 1,
-1.127672, 0.3102703, -1.184548, 1, 0.8509804, 0, 1,
-1.127084, 0.4696067, -1.261289, 1, 0.8588235, 0, 1,
-1.123029, 0.8052963, 0.5561039, 1, 0.8627451, 0, 1,
-1.121719, 0.5707901, 0.307402, 1, 0.8705882, 0, 1,
-1.119916, 0.451691, -1.485629, 1, 0.8745098, 0, 1,
-1.119012, -0.8126635, -3.701377, 1, 0.8823529, 0, 1,
-1.107947, -0.7627866, -1.29814, 1, 0.8862745, 0, 1,
-1.105278, 1.034568, -0.5705016, 1, 0.8941177, 0, 1,
-1.103814, 1.113261, -2.334707, 1, 0.8980392, 0, 1,
-1.103429, -1.633537, -2.659345, 1, 0.9058824, 0, 1,
-1.10212, -0.3203815, -1.402761, 1, 0.9137255, 0, 1,
-1.101376, -0.5643083, -4.618887, 1, 0.9176471, 0, 1,
-1.096544, -1.699145, -3.539924, 1, 0.9254902, 0, 1,
-1.095255, 1.087902, -1.264986, 1, 0.9294118, 0, 1,
-1.093755, 0.9412551, -1.206787, 1, 0.9372549, 0, 1,
-1.090812, -0.1796099, -1.577769, 1, 0.9411765, 0, 1,
-1.077213, 0.002335806, -2.307808, 1, 0.9490196, 0, 1,
-1.076895, 0.3328425, -1.819204, 1, 0.9529412, 0, 1,
-1.070884, 0.6418787, -0.4445723, 1, 0.9607843, 0, 1,
-1.070218, -0.3961358, -2.296999, 1, 0.9647059, 0, 1,
-1.067337, -0.2148109, -1.39914, 1, 0.972549, 0, 1,
-1.061804, -0.5093482, -2.229269, 1, 0.9764706, 0, 1,
-1.060657, -0.2644297, -1.278497, 1, 0.9843137, 0, 1,
-1.058454, -0.9447244, -2.203451, 1, 0.9882353, 0, 1,
-1.057132, 0.111661, -1.515718, 1, 0.9960784, 0, 1,
-1.052712, -0.5616011, -1.924154, 0.9960784, 1, 0, 1,
-1.0486, 1.665453, 0.1154781, 0.9921569, 1, 0, 1,
-1.048388, -1.716031, -1.872357, 0.9843137, 1, 0, 1,
-1.044178, 0.04672294, -2.300696, 0.9803922, 1, 0, 1,
-1.04258, -1.182487, -2.328629, 0.972549, 1, 0, 1,
-1.038553, -0.8039654, -3.102585, 0.9686275, 1, 0, 1,
-1.038321, -0.8685604, -0.8305181, 0.9607843, 1, 0, 1,
-1.02998, 0.7046352, 0.3169166, 0.9568627, 1, 0, 1,
-1.028178, -0.04316166, -2.102586, 0.9490196, 1, 0, 1,
-1.026718, -0.977715, -1.565467, 0.945098, 1, 0, 1,
-1.024417, 0.1773909, -0.8096819, 0.9372549, 1, 0, 1,
-1.016215, 0.6863835, -1.814236, 0.9333333, 1, 0, 1,
-1.008625, 0.06458076, -0.7744279, 0.9254902, 1, 0, 1,
-1.006297, -1.038314, -1.9636, 0.9215686, 1, 0, 1,
-1.000129, -0.2004456, -1.487644, 0.9137255, 1, 0, 1,
-0.9988803, -0.3371576, -0.2595844, 0.9098039, 1, 0, 1,
-0.9943442, -0.7128055, -2.566771, 0.9019608, 1, 0, 1,
-0.9933395, -1.197725, -3.495513, 0.8941177, 1, 0, 1,
-0.9901069, -0.8753674, -2.776249, 0.8901961, 1, 0, 1,
-0.9867385, 0.6426637, -0.8946913, 0.8823529, 1, 0, 1,
-0.9850117, -0.7328292, -1.774678, 0.8784314, 1, 0, 1,
-0.9783573, -1.119514, -0.9371889, 0.8705882, 1, 0, 1,
-0.9563844, -1.220005, -2.187246, 0.8666667, 1, 0, 1,
-0.9543496, 0.0951688, -1.282013, 0.8588235, 1, 0, 1,
-0.9512579, 2.241337, -0.3588749, 0.854902, 1, 0, 1,
-0.9491264, 0.9982474, -1.069329, 0.8470588, 1, 0, 1,
-0.9386318, 0.4049518, 0.5078161, 0.8431373, 1, 0, 1,
-0.9327677, -0.2862428, -0.9751923, 0.8352941, 1, 0, 1,
-0.9323403, -1.25214, -1.272287, 0.8313726, 1, 0, 1,
-0.9315332, -0.6879121, -2.133656, 0.8235294, 1, 0, 1,
-0.9032274, 1.514789, -1.012174, 0.8196079, 1, 0, 1,
-0.8931645, -0.3554721, -1.448516, 0.8117647, 1, 0, 1,
-0.8926048, -1.364498, -3.493528, 0.8078431, 1, 0, 1,
-0.8872046, 0.5331746, -2.041658, 0.8, 1, 0, 1,
-0.8870111, 0.4276485, -1.163895, 0.7921569, 1, 0, 1,
-0.8830674, -0.6350855, -2.559572, 0.7882353, 1, 0, 1,
-0.8738075, -2.282238, -3.178661, 0.7803922, 1, 0, 1,
-0.8682662, -0.2161446, -3.417652, 0.7764706, 1, 0, 1,
-0.8611013, -0.3364368, -1.627419, 0.7686275, 1, 0, 1,
-0.8504391, -0.3087479, -1.291474, 0.7647059, 1, 0, 1,
-0.8453604, -1.40498, -3.311252, 0.7568628, 1, 0, 1,
-0.8453299, -1.230336, -3.266504, 0.7529412, 1, 0, 1,
-0.8407922, -0.3593768, -1.585402, 0.7450981, 1, 0, 1,
-0.8312258, 0.914818, -0.00416816, 0.7411765, 1, 0, 1,
-0.8296894, 2.162354, -1.007441, 0.7333333, 1, 0, 1,
-0.825576, -0.9614035, -0.8089101, 0.7294118, 1, 0, 1,
-0.8219669, 0.7263575, -1.44044, 0.7215686, 1, 0, 1,
-0.8182181, -0.3927122, -1.837297, 0.7176471, 1, 0, 1,
-0.8114262, -0.5620622, -1.200424, 0.7098039, 1, 0, 1,
-0.8101597, 0.7839729, -2.325773, 0.7058824, 1, 0, 1,
-0.8078567, -1.303071, -4.114482, 0.6980392, 1, 0, 1,
-0.8076667, -0.3898141, -2.18888, 0.6901961, 1, 0, 1,
-0.8020806, -1.9394, -3.078536, 0.6862745, 1, 0, 1,
-0.8016244, 1.022856, -1.300817, 0.6784314, 1, 0, 1,
-0.7944278, -0.8544796, -2.141114, 0.6745098, 1, 0, 1,
-0.7939877, 0.1984557, -1.875771, 0.6666667, 1, 0, 1,
-0.7926304, -0.05843428, -1.867063, 0.6627451, 1, 0, 1,
-0.7921138, -0.6294096, -0.7844544, 0.654902, 1, 0, 1,
-0.7883825, -0.8241994, -3.414298, 0.6509804, 1, 0, 1,
-0.7851336, 0.05194547, 0.6406604, 0.6431373, 1, 0, 1,
-0.7824752, 0.4443302, -0.5946968, 0.6392157, 1, 0, 1,
-0.7801829, 2.718077, 0.9769515, 0.6313726, 1, 0, 1,
-0.7753026, 1.205489, -0.5050411, 0.627451, 1, 0, 1,
-0.7707504, 0.1311495, -1.907795, 0.6196079, 1, 0, 1,
-0.7648792, -0.6952364, -4.014181, 0.6156863, 1, 0, 1,
-0.7571419, 0.1364616, 1.648031, 0.6078432, 1, 0, 1,
-0.7557333, -0.4977347, -3.213226, 0.6039216, 1, 0, 1,
-0.7494668, 0.6355655, -0.1728441, 0.5960785, 1, 0, 1,
-0.748822, -1.390028, -1.502965, 0.5882353, 1, 0, 1,
-0.7454244, -0.3713903, -1.386664, 0.5843138, 1, 0, 1,
-0.7434066, -2.085077, -4.043314, 0.5764706, 1, 0, 1,
-0.7412617, -1.020627, -1.313919, 0.572549, 1, 0, 1,
-0.7404192, -0.5839483, -3.977965, 0.5647059, 1, 0, 1,
-0.7378379, -1.262524, -2.810346, 0.5607843, 1, 0, 1,
-0.7377778, -1.547361, -3.438426, 0.5529412, 1, 0, 1,
-0.7278894, -1.161052, -3.253573, 0.5490196, 1, 0, 1,
-0.72236, -1.271866, -3.826762, 0.5411765, 1, 0, 1,
-0.7190974, -2.428076, -3.106794, 0.5372549, 1, 0, 1,
-0.7185584, -0.273468, -1.111472, 0.5294118, 1, 0, 1,
-0.7149158, -0.745551, -1.40678, 0.5254902, 1, 0, 1,
-0.7118451, 0.5271818, -1.271389, 0.5176471, 1, 0, 1,
-0.7092711, -1.297531, -2.881765, 0.5137255, 1, 0, 1,
-0.7082932, -0.06105404, -1.555889, 0.5058824, 1, 0, 1,
-0.7044055, 2.694458, 0.02018863, 0.5019608, 1, 0, 1,
-0.7031563, -0.9235194, -1.488441, 0.4941176, 1, 0, 1,
-0.698179, 0.4206204, 1.045, 0.4862745, 1, 0, 1,
-0.6954741, -1.622109, -2.34695, 0.4823529, 1, 0, 1,
-0.6949241, -1.912284, -1.586386, 0.4745098, 1, 0, 1,
-0.6944983, -2.935591, -0.5802737, 0.4705882, 1, 0, 1,
-0.68752, -0.3023244, -1.232528, 0.4627451, 1, 0, 1,
-0.6851005, -1.588481, -3.018492, 0.4588235, 1, 0, 1,
-0.684606, -0.5281865, -1.985196, 0.4509804, 1, 0, 1,
-0.6820464, 0.04201083, -1.549431, 0.4470588, 1, 0, 1,
-0.6802745, -1.318509, -2.733771, 0.4392157, 1, 0, 1,
-0.6783426, 1.361695, 1.220415, 0.4352941, 1, 0, 1,
-0.6775675, -0.5625623, -2.361971, 0.427451, 1, 0, 1,
-0.6763622, -1.317065, -2.050139, 0.4235294, 1, 0, 1,
-0.6641789, -0.6204584, -3.033542, 0.4156863, 1, 0, 1,
-0.6634715, 0.003111628, -1.676604, 0.4117647, 1, 0, 1,
-0.6609706, 2.018115, -0.02764533, 0.4039216, 1, 0, 1,
-0.6587843, 0.2574715, -1.464488, 0.3960784, 1, 0, 1,
-0.6569227, 0.5866155, -0.5433814, 0.3921569, 1, 0, 1,
-0.6540354, 0.8201994, -0.6815131, 0.3843137, 1, 0, 1,
-0.6492584, -0.3374074, -3.560555, 0.3803922, 1, 0, 1,
-0.6446818, -0.8391039, 0.1984684, 0.372549, 1, 0, 1,
-0.6374896, 0.8464544, -0.1548668, 0.3686275, 1, 0, 1,
-0.6358563, 0.2644493, -1.009784, 0.3607843, 1, 0, 1,
-0.6348464, -0.7055432, -3.453164, 0.3568628, 1, 0, 1,
-0.634106, 1.404857, -1.581145, 0.3490196, 1, 0, 1,
-0.6276146, 0.1678124, 0.09700192, 0.345098, 1, 0, 1,
-0.6263706, 0.668529, 1.492061, 0.3372549, 1, 0, 1,
-0.6263152, -0.231844, -3.013372, 0.3333333, 1, 0, 1,
-0.6261384, 0.6881692, 0.9852808, 0.3254902, 1, 0, 1,
-0.6203479, -0.1454134, -2.450505, 0.3215686, 1, 0, 1,
-0.61814, 0.171978, -1.178188, 0.3137255, 1, 0, 1,
-0.6125861, 1.159733, -0.2439239, 0.3098039, 1, 0, 1,
-0.611481, -0.3546379, -3.301939, 0.3019608, 1, 0, 1,
-0.6097739, 1.909133, -1.12751, 0.2941177, 1, 0, 1,
-0.6081442, 1.765646, 0.384614, 0.2901961, 1, 0, 1,
-0.6065581, 0.6282864, -0.9134114, 0.282353, 1, 0, 1,
-0.6064017, 0.04814802, -1.350956, 0.2784314, 1, 0, 1,
-0.6052309, 0.2129193, -0.1649497, 0.2705882, 1, 0, 1,
-0.6049441, 0.1120548, -1.156892, 0.2666667, 1, 0, 1,
-0.6029739, 0.383905, -2.534667, 0.2588235, 1, 0, 1,
-0.5920795, 0.8609537, -1.720506, 0.254902, 1, 0, 1,
-0.5896063, -1.21318, -4.70918, 0.2470588, 1, 0, 1,
-0.5837417, 0.936219, -0.4190625, 0.2431373, 1, 0, 1,
-0.5764035, -0.1161466, -1.566542, 0.2352941, 1, 0, 1,
-0.5727148, 0.1218975, -0.971737, 0.2313726, 1, 0, 1,
-0.5720251, 0.8531091, 0.0158014, 0.2235294, 1, 0, 1,
-0.5714324, -0.7122827, -3.03473, 0.2196078, 1, 0, 1,
-0.5424362, 0.6147153, 0.4958368, 0.2117647, 1, 0, 1,
-0.5422027, -0.0161369, -2.598651, 0.2078431, 1, 0, 1,
-0.541187, 1.111867, -1.302212, 0.2, 1, 0, 1,
-0.5407826, -0.5327436, -1.715466, 0.1921569, 1, 0, 1,
-0.5406336, 0.02582476, 0.91952, 0.1882353, 1, 0, 1,
-0.5384808, -2.158659, -2.141565, 0.1803922, 1, 0, 1,
-0.5355276, 0.207417, -2.393368, 0.1764706, 1, 0, 1,
-0.5271743, -0.08086974, -2.057304, 0.1686275, 1, 0, 1,
-0.5262287, 0.9880758, -0.9901953, 0.1647059, 1, 0, 1,
-0.521581, 1.19318, 0.4139393, 0.1568628, 1, 0, 1,
-0.5205751, -0.5971496, -2.331903, 0.1529412, 1, 0, 1,
-0.5175131, -1.538392, -0.9022761, 0.145098, 1, 0, 1,
-0.5171875, 1.13331, -0.8102945, 0.1411765, 1, 0, 1,
-0.5127169, 0.1660758, -1.027414, 0.1333333, 1, 0, 1,
-0.5119286, -0.6415903, -1.82983, 0.1294118, 1, 0, 1,
-0.5103173, 0.5846643, -1.828811, 0.1215686, 1, 0, 1,
-0.5088974, -0.849182, -2.463719, 0.1176471, 1, 0, 1,
-0.5026609, -0.268417, -2.327734, 0.1098039, 1, 0, 1,
-0.5016517, 0.7567207, -0.3946308, 0.1058824, 1, 0, 1,
-0.5015141, 1.009412, -0.2836877, 0.09803922, 1, 0, 1,
-0.492349, -1.796223, -4.206587, 0.09019608, 1, 0, 1,
-0.4813987, 0.8613006, -0.567933, 0.08627451, 1, 0, 1,
-0.478161, 2.250322, 0.4866235, 0.07843138, 1, 0, 1,
-0.4771561, 0.2061594, -0.7878125, 0.07450981, 1, 0, 1,
-0.4761346, -1.101519, -2.691229, 0.06666667, 1, 0, 1,
-0.4750869, 1.783849, 0.1396293, 0.0627451, 1, 0, 1,
-0.4700221, 0.9773571, -2.270888, 0.05490196, 1, 0, 1,
-0.4685247, -0.5966568, -3.273121, 0.05098039, 1, 0, 1,
-0.4665631, 1.44141, -0.7865373, 0.04313726, 1, 0, 1,
-0.460694, 0.9755424, 0.1747681, 0.03921569, 1, 0, 1,
-0.4489939, 1.143887, -1.582735, 0.03137255, 1, 0, 1,
-0.4455041, 1.473963, -0.9100691, 0.02745098, 1, 0, 1,
-0.441851, -0.9487982, -3.567636, 0.01960784, 1, 0, 1,
-0.4408203, 1.077836, -0.4574141, 0.01568628, 1, 0, 1,
-0.4391012, 1.069348, 0.05568065, 0.007843138, 1, 0, 1,
-0.4370061, -0.231895, -2.289279, 0.003921569, 1, 0, 1,
-0.4340219, 1.416265, 1.144136, 0, 1, 0.003921569, 1,
-0.4338995, 1.858514, -1.222674, 0, 1, 0.01176471, 1,
-0.4314786, -1.029523, -3.034281, 0, 1, 0.01568628, 1,
-0.4267654, -1.713942, -1.865773, 0, 1, 0.02352941, 1,
-0.4239387, 0.8657708, 1.053135, 0, 1, 0.02745098, 1,
-0.4208041, -1.484122, -3.624616, 0, 1, 0.03529412, 1,
-0.4183058, -0.06066967, -1.974323, 0, 1, 0.03921569, 1,
-0.4178047, -0.2613868, -1.848148, 0, 1, 0.04705882, 1,
-0.4121229, -0.02369647, -1.159454, 0, 1, 0.05098039, 1,
-0.4116163, 0.6827306, -0.06078272, 0, 1, 0.05882353, 1,
-0.4108801, 1.442588, -1.277014, 0, 1, 0.0627451, 1,
-0.4105989, -0.2620015, -3.320436, 0, 1, 0.07058824, 1,
-0.4092313, 0.5396628, 0.5435077, 0, 1, 0.07450981, 1,
-0.4088199, -0.8860686, -3.247108, 0, 1, 0.08235294, 1,
-0.3998127, 0.1796342, -2.255659, 0, 1, 0.08627451, 1,
-0.3953767, 0.09229472, -1.870219, 0, 1, 0.09411765, 1,
-0.3941049, 0.3722408, -0.3686648, 0, 1, 0.1019608, 1,
-0.3881474, 0.672932, -0.5511949, 0, 1, 0.1058824, 1,
-0.3871795, 0.09405758, -0.7133057, 0, 1, 0.1137255, 1,
-0.3849503, -1.617567, -1.660481, 0, 1, 0.1176471, 1,
-0.3843486, 0.4889785, 0.4151983, 0, 1, 0.1254902, 1,
-0.3824716, 0.9743602, -0.8533184, 0, 1, 0.1294118, 1,
-0.3821729, 0.06829938, -0.145873, 0, 1, 0.1372549, 1,
-0.3762316, 0.6567395, -0.6164363, 0, 1, 0.1411765, 1,
-0.3761342, 0.3625618, -0.2822214, 0, 1, 0.1490196, 1,
-0.3680977, 0.741326, 0.6814598, 0, 1, 0.1529412, 1,
-0.3657026, 2.403512, -0.537585, 0, 1, 0.1607843, 1,
-0.364886, -0.3144785, -2.356236, 0, 1, 0.1647059, 1,
-0.3626339, -0.8273543, -3.746877, 0, 1, 0.172549, 1,
-0.362599, 0.4841312, 1.304323, 0, 1, 0.1764706, 1,
-0.3548205, 0.686565, -1.434719, 0, 1, 0.1843137, 1,
-0.3547224, -0.0439114, -2.763417, 0, 1, 0.1882353, 1,
-0.3532382, -0.9287367, -1.723254, 0, 1, 0.1960784, 1,
-0.35278, -1.991011, -4.704658, 0, 1, 0.2039216, 1,
-0.351839, -1.25607, -2.21144, 0, 1, 0.2078431, 1,
-0.350309, 0.7132423, -0.5993054, 0, 1, 0.2156863, 1,
-0.3468, -0.00166111, -1.198476, 0, 1, 0.2196078, 1,
-0.3449371, -0.3058697, -3.735362, 0, 1, 0.227451, 1,
-0.3448137, 0.3346584, -0.5157683, 0, 1, 0.2313726, 1,
-0.3410361, -2.433913, -2.321916, 0, 1, 0.2392157, 1,
-0.3406264, 0.9217201, 0.04638601, 0, 1, 0.2431373, 1,
-0.3393617, -2.303094, -2.107458, 0, 1, 0.2509804, 1,
-0.3337994, -0.1381612, -2.877126, 0, 1, 0.254902, 1,
-0.3327613, -0.6658103, -2.319689, 0, 1, 0.2627451, 1,
-0.3316836, 0.3181793, -1.936105, 0, 1, 0.2666667, 1,
-0.3315994, 1.219431, -1.738312, 0, 1, 0.2745098, 1,
-0.3288576, 1.05651, -1.347848, 0, 1, 0.2784314, 1,
-0.3280025, -1.297266, -3.549856, 0, 1, 0.2862745, 1,
-0.3261241, 0.702076, 1.303264, 0, 1, 0.2901961, 1,
-0.3251074, 0.4618544, 0.08004136, 0, 1, 0.2980392, 1,
-0.3232756, 1.186731, -2.25179, 0, 1, 0.3058824, 1,
-0.3177727, -0.7185267, -2.558735, 0, 1, 0.3098039, 1,
-0.3165488, 0.8837088, -1.075316, 0, 1, 0.3176471, 1,
-0.3162806, 0.5134317, -0.2017487, 0, 1, 0.3215686, 1,
-0.3132418, 0.3735764, -2.055331, 0, 1, 0.3294118, 1,
-0.3094339, -0.1464431, -2.599937, 0, 1, 0.3333333, 1,
-0.3088993, 0.09875057, -0.1358763, 0, 1, 0.3411765, 1,
-0.3044653, -0.00723499, -0.2121117, 0, 1, 0.345098, 1,
-0.3033277, 0.2039822, -1.805629, 0, 1, 0.3529412, 1,
-0.2976365, -0.9051321, -4.017995, 0, 1, 0.3568628, 1,
-0.2970285, 1.959644, -0.8704836, 0, 1, 0.3647059, 1,
-0.2902631, -0.7590249, -1.936944, 0, 1, 0.3686275, 1,
-0.2877501, 1.067416, 0.7281804, 0, 1, 0.3764706, 1,
-0.2819778, 0.8564581, -0.9650254, 0, 1, 0.3803922, 1,
-0.2796012, 0.1786623, -2.942851, 0, 1, 0.3882353, 1,
-0.2786449, -3.328734, -2.623684, 0, 1, 0.3921569, 1,
-0.2776832, 0.3308733, -0.92902, 0, 1, 0.4, 1,
-0.2744738, 2.108963, -1.792068, 0, 1, 0.4078431, 1,
-0.2741677, 0.2205115, -0.2024312, 0, 1, 0.4117647, 1,
-0.2670679, 1.002151, 1.932663, 0, 1, 0.4196078, 1,
-0.2669223, -0.4748481, -2.482037, 0, 1, 0.4235294, 1,
-0.2645594, 0.2495981, -0.4874794, 0, 1, 0.4313726, 1,
-0.2645549, 1.967458, -1.613128, 0, 1, 0.4352941, 1,
-0.2641305, -0.8466932, -1.489355, 0, 1, 0.4431373, 1,
-0.2641049, -2.139787, -2.135015, 0, 1, 0.4470588, 1,
-0.2636605, -0.613562, -2.604626, 0, 1, 0.454902, 1,
-0.2629341, -1.506043, -2.426734, 0, 1, 0.4588235, 1,
-0.2478775, -0.9514925, -1.509655, 0, 1, 0.4666667, 1,
-0.2465008, 0.3172923, -0.8206255, 0, 1, 0.4705882, 1,
-0.2456025, 1.737424, -0.7081925, 0, 1, 0.4784314, 1,
-0.2453381, -0.7517062, -1.774408, 0, 1, 0.4823529, 1,
-0.2452693, 1.481568, -1.280183, 0, 1, 0.4901961, 1,
-0.2426209, 0.6140214, 1.084504, 0, 1, 0.4941176, 1,
-0.2419181, -0.3885302, -2.198273, 0, 1, 0.5019608, 1,
-0.2413439, -0.4087423, -3.308978, 0, 1, 0.509804, 1,
-0.2406212, 0.5978014, -0.3174669, 0, 1, 0.5137255, 1,
-0.2396698, 0.03828638, -1.736337, 0, 1, 0.5215687, 1,
-0.2367829, 0.9685619, -0.5809468, 0, 1, 0.5254902, 1,
-0.2312115, -0.6776357, -2.899619, 0, 1, 0.5333334, 1,
-0.2279519, 0.03565042, -0.9253942, 0, 1, 0.5372549, 1,
-0.2275652, 0.8342912, -0.2136991, 0, 1, 0.5450981, 1,
-0.2270344, -0.2341904, -1.889196, 0, 1, 0.5490196, 1,
-0.2189135, 0.1563801, -1.297092, 0, 1, 0.5568628, 1,
-0.2168785, 2.525348, -1.051567, 0, 1, 0.5607843, 1,
-0.2125799, -1.075307, -3.529501, 0, 1, 0.5686275, 1,
-0.211933, 0.2308168, -3.465429, 0, 1, 0.572549, 1,
-0.2076885, 0.07443884, -1.82705, 0, 1, 0.5803922, 1,
-0.2052202, -2.143111, -4.936506, 0, 1, 0.5843138, 1,
-0.2045238, 0.002366538, -1.415172, 0, 1, 0.5921569, 1,
-0.2004217, 1.921678, 2.93311, 0, 1, 0.5960785, 1,
-0.1982182, -1.608206, -1.331853, 0, 1, 0.6039216, 1,
-0.1969556, -1.514304, -1.699352, 0, 1, 0.6117647, 1,
-0.19589, -0.4743547, -1.575827, 0, 1, 0.6156863, 1,
-0.1918879, -0.6157538, -2.758953, 0, 1, 0.6235294, 1,
-0.1901656, 0.7245539, -1.092641, 0, 1, 0.627451, 1,
-0.1895944, 1.583219, 0.8277283, 0, 1, 0.6352941, 1,
-0.1895484, -1.070965, -2.243849, 0, 1, 0.6392157, 1,
-0.1893356, 0.9622167, 1.4911, 0, 1, 0.6470588, 1,
-0.1769186, -0.6988584, -1.485166, 0, 1, 0.6509804, 1,
-0.1761816, -0.08764527, -2.501121, 0, 1, 0.6588235, 1,
-0.1748562, 0.9055873, -0.680384, 0, 1, 0.6627451, 1,
-0.1726399, 0.5770041, -0.6233063, 0, 1, 0.6705883, 1,
-0.1691825, 0.3478923, 1.24787, 0, 1, 0.6745098, 1,
-0.1672026, 0.4135436, 0.9750497, 0, 1, 0.682353, 1,
-0.1625994, 1.134836, 1.559522, 0, 1, 0.6862745, 1,
-0.1583208, -0.3491575, -3.691984, 0, 1, 0.6941177, 1,
-0.1581253, 0.06370537, -1.088134, 0, 1, 0.7019608, 1,
-0.153847, -0.5492553, -2.997668, 0, 1, 0.7058824, 1,
-0.1528525, 0.0949397, -0.6919603, 0, 1, 0.7137255, 1,
-0.1515504, -0.4446684, -4.206077, 0, 1, 0.7176471, 1,
-0.1477704, -0.5813506, -2.608624, 0, 1, 0.7254902, 1,
-0.1457351, -0.4890725, -3.247891, 0, 1, 0.7294118, 1,
-0.1406011, 0.02176883, -2.030793, 0, 1, 0.7372549, 1,
-0.1386343, 1.323361, 0.802592, 0, 1, 0.7411765, 1,
-0.1384521, -1.677507, -2.088726, 0, 1, 0.7490196, 1,
-0.1369184, 0.4724874, -1.213444, 0, 1, 0.7529412, 1,
-0.1354723, 1.873485, 1.244779, 0, 1, 0.7607843, 1,
-0.1340663, 0.9697617, 0.4993418, 0, 1, 0.7647059, 1,
-0.1282297, -1.160528, -2.04791, 0, 1, 0.772549, 1,
-0.1254418, 0.6332541, -1.421805, 0, 1, 0.7764706, 1,
-0.125007, 0.8761169, -0.2279765, 0, 1, 0.7843137, 1,
-0.1222951, 1.107423, -0.2734584, 0, 1, 0.7882353, 1,
-0.1221744, -0.0005872897, -1.713127, 0, 1, 0.7960784, 1,
-0.1175942, -2.38713, -2.301339, 0, 1, 0.8039216, 1,
-0.1093051, -0.1370451, -3.354068, 0, 1, 0.8078431, 1,
-0.1092307, 1.000226, 0.4777635, 0, 1, 0.8156863, 1,
-0.1085424, 0.9523092, -0.4597636, 0, 1, 0.8196079, 1,
-0.1078703, -0.2381788, -2.277993, 0, 1, 0.827451, 1,
-0.1058583, 0.4342798, -1.141966, 0, 1, 0.8313726, 1,
-0.1057781, 0.6829616, 1.142912, 0, 1, 0.8392157, 1,
-0.1047952, -0.5488911, -3.01065, 0, 1, 0.8431373, 1,
-0.102239, -0.7576657, -2.904622, 0, 1, 0.8509804, 1,
-0.1009763, -0.1698375, -2.91576, 0, 1, 0.854902, 1,
-0.1007748, 0.2922993, 0.1550656, 0, 1, 0.8627451, 1,
-0.1001469, 0.275987, -2.647201, 0, 1, 0.8666667, 1,
-0.09769738, -0.02050068, -2.199218, 0, 1, 0.8745098, 1,
-0.09481676, 0.3612501, 2.046658, 0, 1, 0.8784314, 1,
-0.09155396, 1.980775, -0.925575, 0, 1, 0.8862745, 1,
-0.08971551, 1.898059, 0.7389591, 0, 1, 0.8901961, 1,
-0.0873666, -0.4439164, -2.480743, 0, 1, 0.8980392, 1,
-0.08070577, 2.757263, 0.501863, 0, 1, 0.9058824, 1,
-0.07984508, -0.05894223, -2.58963, 0, 1, 0.9098039, 1,
-0.07601803, 0.1713806, -0.3950256, 0, 1, 0.9176471, 1,
-0.06973011, 0.357949, 1.367285, 0, 1, 0.9215686, 1,
-0.06700549, -1.202655, -2.113541, 0, 1, 0.9294118, 1,
-0.06536455, 0.9053771, -1.058779, 0, 1, 0.9333333, 1,
-0.06432576, 1.555395, -1.518557, 0, 1, 0.9411765, 1,
-0.06142058, -0.8643104, -2.856947, 0, 1, 0.945098, 1,
-0.05961451, -1.400252, -2.455298, 0, 1, 0.9529412, 1,
-0.0518234, 0.1946921, -0.9888052, 0, 1, 0.9568627, 1,
-0.03791051, -0.2564288, -2.192484, 0, 1, 0.9647059, 1,
-0.03181406, 0.2705889, -0.4538026, 0, 1, 0.9686275, 1,
-0.0294405, -0.4892723, -2.771834, 0, 1, 0.9764706, 1,
-0.02930118, -0.9330158, -2.00931, 0, 1, 0.9803922, 1,
-0.02199707, 1.225725, -1.494717, 0, 1, 0.9882353, 1,
-0.01895865, -0.02643207, -2.097756, 0, 1, 0.9921569, 1,
-0.01769287, 0.02987808, 0.5654873, 0, 1, 1, 1,
-0.007691056, -0.6993924, -2.344677, 0, 0.9921569, 1, 1,
-0.003210098, -0.3680484, -3.441287, 0, 0.9882353, 1, 1,
-0.00184442, 0.2657454, -0.06429879, 0, 0.9803922, 1, 1,
-0.0005538007, 0.5551421, 1.134308, 0, 0.9764706, 1, 1,
0.0101492, -1.278732, 1.911364, 0, 0.9686275, 1, 1,
0.01443057, -0.9059066, 3.007398, 0, 0.9647059, 1, 1,
0.01831939, -1.071192, 1.240238, 0, 0.9568627, 1, 1,
0.01890883, 0.5953357, 1.413933, 0, 0.9529412, 1, 1,
0.02452971, -0.5675609, 1.669948, 0, 0.945098, 1, 1,
0.02989571, -1.677411, 3.729368, 0, 0.9411765, 1, 1,
0.03370981, 0.4572963, 0.5864911, 0, 0.9333333, 1, 1,
0.0369646, 0.5160876, -0.9054734, 0, 0.9294118, 1, 1,
0.04207393, 0.2330214, 0.7187483, 0, 0.9215686, 1, 1,
0.04279532, 0.2254979, 1.328413, 0, 0.9176471, 1, 1,
0.04414865, 0.827081, -0.4081376, 0, 0.9098039, 1, 1,
0.04848773, -0.9170474, 2.174417, 0, 0.9058824, 1, 1,
0.04850529, -1.44948, 2.765591, 0, 0.8980392, 1, 1,
0.04977635, -0.2980483, 3.202454, 0, 0.8901961, 1, 1,
0.04999768, -0.2937853, 2.488833, 0, 0.8862745, 1, 1,
0.05908635, -0.1850289, 1.928525, 0, 0.8784314, 1, 1,
0.05987082, -1.465651, 3.428967, 0, 0.8745098, 1, 1,
0.06213914, 0.2512286, -0.4091507, 0, 0.8666667, 1, 1,
0.06584389, -0.8655949, 3.297955, 0, 0.8627451, 1, 1,
0.06991109, 1.203899, -1.050511, 0, 0.854902, 1, 1,
0.07160568, 1.2272, 0.9367966, 0, 0.8509804, 1, 1,
0.07558129, -0.370283, 4.542231, 0, 0.8431373, 1, 1,
0.08138702, -1.170028, 1.814895, 0, 0.8392157, 1, 1,
0.08228056, -0.3816771, 4.725149, 0, 0.8313726, 1, 1,
0.08443017, -0.4931585, 2.007768, 0, 0.827451, 1, 1,
0.08532059, -0.6524452, 1.453058, 0, 0.8196079, 1, 1,
0.0879769, 0.06088086, 2.128721, 0, 0.8156863, 1, 1,
0.08822487, -0.3909299, 2.547118, 0, 0.8078431, 1, 1,
0.08961538, 0.7572918, 0.2484659, 0, 0.8039216, 1, 1,
0.08972172, 0.2305672, 0.5951712, 0, 0.7960784, 1, 1,
0.08996684, -1.425287, 2.829448, 0, 0.7882353, 1, 1,
0.09419873, 0.8464965, -1.153705, 0, 0.7843137, 1, 1,
0.0980697, 0.3791735, -0.1087753, 0, 0.7764706, 1, 1,
0.09853949, 0.2844046, 0.8904034, 0, 0.772549, 1, 1,
0.09990172, -1.570589, 2.716301, 0, 0.7647059, 1, 1,
0.10218, 1.423751, 0.1457978, 0, 0.7607843, 1, 1,
0.1054621, 0.31776, 0.5286713, 0, 0.7529412, 1, 1,
0.1062099, 0.4658938, 1.318548, 0, 0.7490196, 1, 1,
0.1100338, -0.6820245, 3.482145, 0, 0.7411765, 1, 1,
0.1128935, -0.4772657, 2.907136, 0, 0.7372549, 1, 1,
0.1179434, -0.2991867, 2.912793, 0, 0.7294118, 1, 1,
0.1183074, 1.516107, -0.5072308, 0, 0.7254902, 1, 1,
0.1265924, 1.372105, -1.787787, 0, 0.7176471, 1, 1,
0.127874, -0.4222664, 2.404712, 0, 0.7137255, 1, 1,
0.1320336, 0.2303807, 0.1846266, 0, 0.7058824, 1, 1,
0.1376728, 0.3367636, 1.213173, 0, 0.6980392, 1, 1,
0.1490207, -0.08953983, 0.5091969, 0, 0.6941177, 1, 1,
0.152425, -0.9113808, 2.501628, 0, 0.6862745, 1, 1,
0.1550837, 0.6221863, -0.8190849, 0, 0.682353, 1, 1,
0.1570791, -0.7297048, 2.646628, 0, 0.6745098, 1, 1,
0.1576228, -0.3037175, 2.21504, 0, 0.6705883, 1, 1,
0.1590284, 0.02431159, -1.371009, 0, 0.6627451, 1, 1,
0.1615735, -1.406911, 3.029633, 0, 0.6588235, 1, 1,
0.1623528, 0.2010072, 1.427985, 0, 0.6509804, 1, 1,
0.1641521, 0.1119658, 0.5140008, 0, 0.6470588, 1, 1,
0.1653057, 0.2669387, -0.2994007, 0, 0.6392157, 1, 1,
0.1793376, 0.9464839, -1.349494, 0, 0.6352941, 1, 1,
0.1797607, 0.6489212, 1.745547, 0, 0.627451, 1, 1,
0.1834671, 1.389292, 0.4743211, 0, 0.6235294, 1, 1,
0.189282, 1.632268, 2.021172, 0, 0.6156863, 1, 1,
0.1907084, 0.2813533, -1.015504, 0, 0.6117647, 1, 1,
0.1908263, -0.8061553, 3.017943, 0, 0.6039216, 1, 1,
0.1909887, -0.2838027, 2.503241, 0, 0.5960785, 1, 1,
0.1935631, -0.1816064, 3.076292, 0, 0.5921569, 1, 1,
0.1949779, -0.08455215, 2.488973, 0, 0.5843138, 1, 1,
0.2016536, -1.128247, 3.199418, 0, 0.5803922, 1, 1,
0.2032313, -0.4902934, 2.429343, 0, 0.572549, 1, 1,
0.2063852, 1.00781, -1.383316, 0, 0.5686275, 1, 1,
0.2083642, -0.5051942, 3.223622, 0, 0.5607843, 1, 1,
0.20854, 1.026636, -0.6598139, 0, 0.5568628, 1, 1,
0.2114927, 0.3440627, 0.5667412, 0, 0.5490196, 1, 1,
0.2165803, -1.351299, 2.32928, 0, 0.5450981, 1, 1,
0.2177663, 0.6902535, -0.953276, 0, 0.5372549, 1, 1,
0.2182806, 1.218174, 0.6725844, 0, 0.5333334, 1, 1,
0.2186332, 0.4117801, -0.3840012, 0, 0.5254902, 1, 1,
0.2186554, 0.9016688, 0.4337929, 0, 0.5215687, 1, 1,
0.2197354, -0.5644943, 1.566311, 0, 0.5137255, 1, 1,
0.220881, 0.02380418, 1.826033, 0, 0.509804, 1, 1,
0.2217246, 0.03681441, 0.6489161, 0, 0.5019608, 1, 1,
0.2245464, -0.7038585, 1.25464, 0, 0.4941176, 1, 1,
0.2264653, -0.6630188, 1.79743, 0, 0.4901961, 1, 1,
0.2266586, -0.2554537, 2.475214, 0, 0.4823529, 1, 1,
0.2286632, 0.89265, -0.9827875, 0, 0.4784314, 1, 1,
0.2315635, -0.9186218, 3.895815, 0, 0.4705882, 1, 1,
0.2315782, -1.017049, 2.990669, 0, 0.4666667, 1, 1,
0.2392858, -0.799647, 2.624048, 0, 0.4588235, 1, 1,
0.241324, -0.5550118, 2.348813, 0, 0.454902, 1, 1,
0.2465105, 0.07506137, 1.754932, 0, 0.4470588, 1, 1,
0.2503677, 1.162625, 1.471731, 0, 0.4431373, 1, 1,
0.253084, -0.8891906, 4.47755, 0, 0.4352941, 1, 1,
0.2608936, -0.395721, 2.549675, 0, 0.4313726, 1, 1,
0.2618074, 1.348307, -0.9858934, 0, 0.4235294, 1, 1,
0.2642346, 0.5447801, 0.9109355, 0, 0.4196078, 1, 1,
0.267061, -0.6561378, 0.6983334, 0, 0.4117647, 1, 1,
0.2677172, 0.247291, 0.4532097, 0, 0.4078431, 1, 1,
0.2692561, -1.597625, 2.960757, 0, 0.4, 1, 1,
0.2704358, -0.6306738, 3.242861, 0, 0.3921569, 1, 1,
0.2704686, -0.9924337, 2.107274, 0, 0.3882353, 1, 1,
0.2729605, -0.6571757, 3.062814, 0, 0.3803922, 1, 1,
0.2731251, 0.6709755, 0.6472324, 0, 0.3764706, 1, 1,
0.2748216, -1.25005, 4.313316, 0, 0.3686275, 1, 1,
0.2774797, 0.09620009, 0.758034, 0, 0.3647059, 1, 1,
0.2815843, -0.8343452, 2.412687, 0, 0.3568628, 1, 1,
0.2883372, 0.5912039, 2.590205, 0, 0.3529412, 1, 1,
0.289478, -0.8766548, 4.404606, 0, 0.345098, 1, 1,
0.2903862, 1.496274, -0.5613756, 0, 0.3411765, 1, 1,
0.2912286, 0.4478231, -0.3528338, 0, 0.3333333, 1, 1,
0.296656, -0.9169286, 3.160322, 0, 0.3294118, 1, 1,
0.2973017, -0.6045285, 5.57182, 0, 0.3215686, 1, 1,
0.3016848, 0.5723553, 0.04112247, 0, 0.3176471, 1, 1,
0.3031923, -0.8368891, 2.074217, 0, 0.3098039, 1, 1,
0.3053756, -2.314306, 4.127451, 0, 0.3058824, 1, 1,
0.3070118, -1.016094, 1.286373, 0, 0.2980392, 1, 1,
0.307117, 0.5552925, 0.9386168, 0, 0.2901961, 1, 1,
0.312814, 0.4351276, 0.04780432, 0, 0.2862745, 1, 1,
0.3145236, 0.8141497, -0.9410728, 0, 0.2784314, 1, 1,
0.3204435, -0.4439197, 1.53322, 0, 0.2745098, 1, 1,
0.3237134, -0.2237432, 4.275531, 0, 0.2666667, 1, 1,
0.3271666, 0.9779801, 0.5326052, 0, 0.2627451, 1, 1,
0.3277923, -0.3250125, 2.347245, 0, 0.254902, 1, 1,
0.3285784, 1.147414, 0.9175267, 0, 0.2509804, 1, 1,
0.3319452, 0.6700995, -0.03770155, 0, 0.2431373, 1, 1,
0.3322164, 0.8608119, 0.2174882, 0, 0.2392157, 1, 1,
0.3370488, -0.07652622, 1.44537, 0, 0.2313726, 1, 1,
0.3377513, 0.3847365, 1.34518, 0, 0.227451, 1, 1,
0.3381342, -0.4202226, 2.285286, 0, 0.2196078, 1, 1,
0.3385878, -1.357241, 5.330812, 0, 0.2156863, 1, 1,
0.3412328, 0.3500593, 0.5059422, 0, 0.2078431, 1, 1,
0.3425183, -1.912821, 2.333063, 0, 0.2039216, 1, 1,
0.3437534, 0.2504845, 2.028449, 0, 0.1960784, 1, 1,
0.3438378, -0.4897925, 3.931015, 0, 0.1882353, 1, 1,
0.3439848, -0.9219756, 3.596412, 0, 0.1843137, 1, 1,
0.3440842, 1.22471, 0.7780472, 0, 0.1764706, 1, 1,
0.3468322, -0.5841421, 3.233778, 0, 0.172549, 1, 1,
0.3484002, -0.09718595, 1.867763, 0, 0.1647059, 1, 1,
0.3498784, 0.9879639, 0.4909118, 0, 0.1607843, 1, 1,
0.3533631, -0.9059654, 0.3161288, 0, 0.1529412, 1, 1,
0.3538489, -0.3730883, 2.233831, 0, 0.1490196, 1, 1,
0.3563398, -0.2524416, 2.41713, 0, 0.1411765, 1, 1,
0.3586561, -1.302789, 3.799465, 0, 0.1372549, 1, 1,
0.3593174, -0.3194776, 3.445276, 0, 0.1294118, 1, 1,
0.3639937, -1.217315, 2.494433, 0, 0.1254902, 1, 1,
0.3652983, -0.4267499, 3.413204, 0, 0.1176471, 1, 1,
0.3696023, 1.25361, 0.2210274, 0, 0.1137255, 1, 1,
0.370466, -0.2821855, 2.082606, 0, 0.1058824, 1, 1,
0.3711519, 1.062536, 1.303723, 0, 0.09803922, 1, 1,
0.3721029, -0.07599121, 1.481111, 0, 0.09411765, 1, 1,
0.3736382, 0.9144092, 1.665888, 0, 0.08627451, 1, 1,
0.378426, 0.2385404, 1.201743, 0, 0.08235294, 1, 1,
0.3792627, 1.314893, 1.291031, 0, 0.07450981, 1, 1,
0.3796167, 0.889864, -0.2644983, 0, 0.07058824, 1, 1,
0.3836027, -0.5328435, 2.840774, 0, 0.0627451, 1, 1,
0.3911197, -0.2724483, 3.610016, 0, 0.05882353, 1, 1,
0.3980742, -0.9742464, 2.203384, 0, 0.05098039, 1, 1,
0.3991119, 0.5886524, 1.075136, 0, 0.04705882, 1, 1,
0.4031429, 0.4978582, 0.3803756, 0, 0.03921569, 1, 1,
0.4124672, -0.43649, 1.009036, 0, 0.03529412, 1, 1,
0.4151083, -0.2901414, 1.496421, 0, 0.02745098, 1, 1,
0.4153118, -0.1332651, 0.5931391, 0, 0.02352941, 1, 1,
0.4155546, 0.5308627, 0.6353425, 0, 0.01568628, 1, 1,
0.4169597, -1.054672, 1.176273, 0, 0.01176471, 1, 1,
0.4194829, 0.07073141, 1.137637, 0, 0.003921569, 1, 1,
0.4218359, -0.2284078, 2.985851, 0.003921569, 0, 1, 1,
0.4240641, -1.936201, 2.852603, 0.007843138, 0, 1, 1,
0.4260529, 0.3034945, 1.899572, 0.01568628, 0, 1, 1,
0.4298893, -0.01183698, 2.239337, 0.01960784, 0, 1, 1,
0.4318903, -1.303309, 2.667627, 0.02745098, 0, 1, 1,
0.4324383, 0.3580832, 1.125437, 0.03137255, 0, 1, 1,
0.4360376, -1.001402, 1.024541, 0.03921569, 0, 1, 1,
0.4368442, 1.306125, 1.883954, 0.04313726, 0, 1, 1,
0.4390903, -1.57932, 2.684685, 0.05098039, 0, 1, 1,
0.4411941, 0.9950702, 1.598655, 0.05490196, 0, 1, 1,
0.441757, -0.1459282, 0.302626, 0.0627451, 0, 1, 1,
0.4423688, 0.619539, 1.487274, 0.06666667, 0, 1, 1,
0.4429905, 1.424975, 1.273133, 0.07450981, 0, 1, 1,
0.4477722, -0.450096, 1.472605, 0.07843138, 0, 1, 1,
0.4536525, 1.986299, 1.270241, 0.08627451, 0, 1, 1,
0.4587618, -0.6574798, 1.708414, 0.09019608, 0, 1, 1,
0.4602033, -0.5627186, 2.237738, 0.09803922, 0, 1, 1,
0.4602247, -0.08839641, 2.722025, 0.1058824, 0, 1, 1,
0.462866, 0.7308108, 1.09908, 0.1098039, 0, 1, 1,
0.4674579, 0.8176767, 1.043694, 0.1176471, 0, 1, 1,
0.4681011, 0.6623326, 0.5063429, 0.1215686, 0, 1, 1,
0.4691926, -1.313764, 2.357522, 0.1294118, 0, 1, 1,
0.4698499, -0.4211942, 3.898502, 0.1333333, 0, 1, 1,
0.4724935, 0.9647052, -1.393398, 0.1411765, 0, 1, 1,
0.4744026, -0.2647077, 3.733329, 0.145098, 0, 1, 1,
0.4822547, -0.3932814, 1.774985, 0.1529412, 0, 1, 1,
0.4829915, -0.2556486, 3.275313, 0.1568628, 0, 1, 1,
0.4894352, -0.01758754, 2.291945, 0.1647059, 0, 1, 1,
0.4902951, 1.175675, 0.8367627, 0.1686275, 0, 1, 1,
0.4985554, -1.803499, 3.877609, 0.1764706, 0, 1, 1,
0.5012968, 1.095206, 2.574513, 0.1803922, 0, 1, 1,
0.5018727, 0.5371297, -1.564083, 0.1882353, 0, 1, 1,
0.5067752, -0.2836713, 2.225084, 0.1921569, 0, 1, 1,
0.506966, -1.743485, 3.172303, 0.2, 0, 1, 1,
0.5070674, 1.668596, -0.2111985, 0.2078431, 0, 1, 1,
0.5081845, 1.211164, -1.342289, 0.2117647, 0, 1, 1,
0.5090725, -0.1701121, 2.691587, 0.2196078, 0, 1, 1,
0.5160389, 1.099323, -1.198411, 0.2235294, 0, 1, 1,
0.5189506, 1.409827, 1.705607, 0.2313726, 0, 1, 1,
0.519986, 0.5898037, 2.52743, 0.2352941, 0, 1, 1,
0.523959, 1.422094, 0.9255766, 0.2431373, 0, 1, 1,
0.5257122, -1.367711, 4.542599, 0.2470588, 0, 1, 1,
0.5273513, 0.1075129, -0.0163447, 0.254902, 0, 1, 1,
0.5283219, 0.6491516, 0.6890054, 0.2588235, 0, 1, 1,
0.5295603, -1.736985, 2.122037, 0.2666667, 0, 1, 1,
0.5316576, -0.7009106, 4.728423, 0.2705882, 0, 1, 1,
0.5338314, -0.2451295, 3.561575, 0.2784314, 0, 1, 1,
0.5354518, 1.135588, 1.19331, 0.282353, 0, 1, 1,
0.5363633, -0.5046447, 2.479733, 0.2901961, 0, 1, 1,
0.5367936, 1.166604, 2.24639, 0.2941177, 0, 1, 1,
0.5387775, 0.5266663, -0.007894528, 0.3019608, 0, 1, 1,
0.5400209, 0.5562136, -0.709282, 0.3098039, 0, 1, 1,
0.5401518, -0.114002, 0.9764197, 0.3137255, 0, 1, 1,
0.5405136, 0.3729063, 1.15654, 0.3215686, 0, 1, 1,
0.5410549, 0.2518782, -0.6183141, 0.3254902, 0, 1, 1,
0.5478391, 0.2754479, 0.2250952, 0.3333333, 0, 1, 1,
0.5493239, -0.160133, 1.146308, 0.3372549, 0, 1, 1,
0.5511953, 0.1066608, 2.041435, 0.345098, 0, 1, 1,
0.5537705, 2.413513, 0.5780755, 0.3490196, 0, 1, 1,
0.5581811, -0.4130021, 1.815512, 0.3568628, 0, 1, 1,
0.5593995, -1.179629, 2.72467, 0.3607843, 0, 1, 1,
0.56122, 0.07877804, 0.3067411, 0.3686275, 0, 1, 1,
0.5621647, 0.6393418, 1.174098, 0.372549, 0, 1, 1,
0.5628344, 0.3421685, 1.380569, 0.3803922, 0, 1, 1,
0.5721366, 1.571833, 1.265518, 0.3843137, 0, 1, 1,
0.5730586, 0.6094419, 0.5142652, 0.3921569, 0, 1, 1,
0.5734405, 1.287469, 2.814768, 0.3960784, 0, 1, 1,
0.5750206, 0.01077143, 1.364475, 0.4039216, 0, 1, 1,
0.5754704, 1.051301, 1.104954, 0.4117647, 0, 1, 1,
0.5843518, 1.485352, 0.04765169, 0.4156863, 0, 1, 1,
0.5851782, -0.2280619, 2.023935, 0.4235294, 0, 1, 1,
0.5885232, -0.5030366, 2.714585, 0.427451, 0, 1, 1,
0.5919309, -0.9422162, 3.330887, 0.4352941, 0, 1, 1,
0.5937468, -1.239085, 4.094695, 0.4392157, 0, 1, 1,
0.6033337, 0.7991799, 0.05627443, 0.4470588, 0, 1, 1,
0.6036384, -1.414224, 1.781193, 0.4509804, 0, 1, 1,
0.6042588, 1.109002, 1.184447, 0.4588235, 0, 1, 1,
0.6049354, 0.05076296, 1.146635, 0.4627451, 0, 1, 1,
0.6105597, -0.4965384, 2.547258, 0.4705882, 0, 1, 1,
0.6106929, -0.07422868, 0.9369129, 0.4745098, 0, 1, 1,
0.6118632, -0.3101066, 4.713071, 0.4823529, 0, 1, 1,
0.6127691, 0.9373767, 1.039952, 0.4862745, 0, 1, 1,
0.6158797, -0.9815647, 2.116586, 0.4941176, 0, 1, 1,
0.6166523, -2.016755, 2.459444, 0.5019608, 0, 1, 1,
0.6210328, -0.02019399, 2.959728, 0.5058824, 0, 1, 1,
0.6247662, 0.1687645, 1.77779, 0.5137255, 0, 1, 1,
0.6270148, 0.4781132, 1.257904, 0.5176471, 0, 1, 1,
0.6284932, 0.9959837, 2.134146, 0.5254902, 0, 1, 1,
0.6355034, 0.1794342, 0.8336061, 0.5294118, 0, 1, 1,
0.6372609, -0.7685465, 2.512398, 0.5372549, 0, 1, 1,
0.6424853, -0.8308368, 2.950658, 0.5411765, 0, 1, 1,
0.6490545, -0.9309196, 2.336274, 0.5490196, 0, 1, 1,
0.6507504, -0.1344834, 3.498302, 0.5529412, 0, 1, 1,
0.6516785, 0.6094388, 0.09553152, 0.5607843, 0, 1, 1,
0.6533164, 1.419448, 0.2072915, 0.5647059, 0, 1, 1,
0.6610578, 0.01906844, 1.193433, 0.572549, 0, 1, 1,
0.661425, 0.2949648, 1.644498, 0.5764706, 0, 1, 1,
0.6629241, 1.164322, 0.06555466, 0.5843138, 0, 1, 1,
0.6647273, -1.884525, 4.599586, 0.5882353, 0, 1, 1,
0.6703868, -0.7014642, 3.970472, 0.5960785, 0, 1, 1,
0.6732506, 0.3343377, 1.684968, 0.6039216, 0, 1, 1,
0.6759765, 0.3332874, 0.6337447, 0.6078432, 0, 1, 1,
0.6769894, -0.9665951, 3.640108, 0.6156863, 0, 1, 1,
0.6775777, -1.652325, 3.068233, 0.6196079, 0, 1, 1,
0.6793466, 1.29438, -0.2749384, 0.627451, 0, 1, 1,
0.6812118, 0.9662582, 1.001674, 0.6313726, 0, 1, 1,
0.6861625, -0.4280017, 1.093505, 0.6392157, 0, 1, 1,
0.6877013, -0.02822984, 1.292933, 0.6431373, 0, 1, 1,
0.6951875, 1.759242, 0.7033025, 0.6509804, 0, 1, 1,
0.6973606, -1.553505, 2.860446, 0.654902, 0, 1, 1,
0.6977243, 1.259182, -1.154144, 0.6627451, 0, 1, 1,
0.7089153, -0.3652421, 2.32416, 0.6666667, 0, 1, 1,
0.7098603, 0.09437027, 2.081634, 0.6745098, 0, 1, 1,
0.7136242, 0.9630297, 1.477685, 0.6784314, 0, 1, 1,
0.714968, 1.07289, 0.4125318, 0.6862745, 0, 1, 1,
0.715773, -0.08893397, 0.6463998, 0.6901961, 0, 1, 1,
0.7170007, 1.320231, 0.6441061, 0.6980392, 0, 1, 1,
0.7170259, 0.1763496, 1.408379, 0.7058824, 0, 1, 1,
0.7186036, 0.6689839, 0.3760548, 0.7098039, 0, 1, 1,
0.7211348, -0.07422513, 2.474856, 0.7176471, 0, 1, 1,
0.7216026, -0.7446221, 2.555718, 0.7215686, 0, 1, 1,
0.7268591, -2.060988, 1.363348, 0.7294118, 0, 1, 1,
0.7341335, 0.7385162, -0.02776613, 0.7333333, 0, 1, 1,
0.7342535, 0.7191188, 1.699221, 0.7411765, 0, 1, 1,
0.736201, 0.8442302, 0.6887447, 0.7450981, 0, 1, 1,
0.7365471, -0.4620692, 2.79307, 0.7529412, 0, 1, 1,
0.7373976, -1.455079, 2.959403, 0.7568628, 0, 1, 1,
0.7429909, -0.2802305, 1.446259, 0.7647059, 0, 1, 1,
0.7474074, 0.2025455, 0.8199666, 0.7686275, 0, 1, 1,
0.7576786, 0.1904973, 1.989677, 0.7764706, 0, 1, 1,
0.7599254, 0.7556283, 2.256272, 0.7803922, 0, 1, 1,
0.7608074, 0.8305162, 1.826558, 0.7882353, 0, 1, 1,
0.7634112, 1.559656, -0.07426801, 0.7921569, 0, 1, 1,
0.7716125, 0.6705086, 2.551136, 0.8, 0, 1, 1,
0.7724793, 1.261623, 1.528711, 0.8078431, 0, 1, 1,
0.7760068, -1.732243, 3.202753, 0.8117647, 0, 1, 1,
0.7781613, -0.6590249, 2.124862, 0.8196079, 0, 1, 1,
0.7803376, 2.130751, 0.8842893, 0.8235294, 0, 1, 1,
0.780834, 2.103229, -0.02476119, 0.8313726, 0, 1, 1,
0.7829929, -2.021285, 3.861892, 0.8352941, 0, 1, 1,
0.7842134, 0.3236748, -1.957457, 0.8431373, 0, 1, 1,
0.7884941, -2.544745, 2.873768, 0.8470588, 0, 1, 1,
0.7929463, -0.7226642, 3.818526, 0.854902, 0, 1, 1,
0.7935707, -1.748308, 1.863319, 0.8588235, 0, 1, 1,
0.795635, 0.4166041, 1.167471, 0.8666667, 0, 1, 1,
0.8059151, 1.698213, 0.631281, 0.8705882, 0, 1, 1,
0.8093428, -0.8276911, 1.28643, 0.8784314, 0, 1, 1,
0.8137359, 2.07705, -0.5129943, 0.8823529, 0, 1, 1,
0.8151599, 1.061929, 0.3399058, 0.8901961, 0, 1, 1,
0.8225743, 1.629758, -0.1791805, 0.8941177, 0, 1, 1,
0.8225756, 0.4852773, 0.01085709, 0.9019608, 0, 1, 1,
0.8232585, 0.38396, 0.4214502, 0.9098039, 0, 1, 1,
0.8298979, 1.784604, -0.04402281, 0.9137255, 0, 1, 1,
0.8316867, -0.5075477, 3.335967, 0.9215686, 0, 1, 1,
0.8342819, -2.868997, 2.905285, 0.9254902, 0, 1, 1,
0.8373696, -1.625096, 3.617432, 0.9333333, 0, 1, 1,
0.8409993, 0.578096, 3.370497, 0.9372549, 0, 1, 1,
0.8412399, 0.2056895, 2.429218, 0.945098, 0, 1, 1,
0.8481532, -0.1139938, 0.6223394, 0.9490196, 0, 1, 1,
0.8595225, 1.99038, 0.7085878, 0.9568627, 0, 1, 1,
0.8674601, 0.4615048, 1.58739, 0.9607843, 0, 1, 1,
0.8908834, 1.587227, 0.6554801, 0.9686275, 0, 1, 1,
0.904499, 0.7987412, 0.5538229, 0.972549, 0, 1, 1,
0.905682, -1.43702, 2.85801, 0.9803922, 0, 1, 1,
0.9107763, -0.5199274, 2.719316, 0.9843137, 0, 1, 1,
0.9156201, -1.659454, 1.088586, 0.9921569, 0, 1, 1,
0.9191383, 0.2858298, 2.128834, 0.9960784, 0, 1, 1,
0.9195751, 2.351045, -0.1925758, 1, 0, 0.9960784, 1,
0.9211795, -0.9265555, 0.6645484, 1, 0, 0.9882353, 1,
0.9342548, -0.9065205, 1.469314, 1, 0, 0.9843137, 1,
0.9343101, -0.8288969, 2.226961, 1, 0, 0.9764706, 1,
0.9448503, 1.208034, 0.3234081, 1, 0, 0.972549, 1,
0.9522632, 0.5100427, -2.700539, 1, 0, 0.9647059, 1,
0.9525728, -0.7466753, 2.484313, 1, 0, 0.9607843, 1,
0.9552417, 1.230966, -0.3720255, 1, 0, 0.9529412, 1,
0.9593979, -0.7555928, 1.77836, 1, 0, 0.9490196, 1,
0.959542, -0.2813096, 2.149861, 1, 0, 0.9411765, 1,
0.9607233, 0.2004595, 1.45144, 1, 0, 0.9372549, 1,
0.9672382, 0.9646367, 1.042025, 1, 0, 0.9294118, 1,
0.9771886, 0.2986099, 1.950229, 1, 0, 0.9254902, 1,
0.9809315, 0.711392, 0.9978383, 1, 0, 0.9176471, 1,
0.9927112, -0.6697548, 3.032666, 1, 0, 0.9137255, 1,
0.9981666, 0.6680683, 2.633166, 1, 0, 0.9058824, 1,
0.9996002, 0.3688848, 1.405483, 1, 0, 0.9019608, 1,
1.000209, 0.8322315, 1.573445, 1, 0, 0.8941177, 1,
1.002255, 0.871136, 0.4081544, 1, 0, 0.8862745, 1,
1.003299, -0.243647, 2.684988, 1, 0, 0.8823529, 1,
1.010049, -0.5211202, 3.025681, 1, 0, 0.8745098, 1,
1.016134, -0.6317148, 4.161422, 1, 0, 0.8705882, 1,
1.020678, 0.2082851, 2.744176, 1, 0, 0.8627451, 1,
1.024083, 0.4222045, 1.726034, 1, 0, 0.8588235, 1,
1.026683, -0.2451667, 3.473269, 1, 0, 0.8509804, 1,
1.028926, -1.332296, 3.144554, 1, 0, 0.8470588, 1,
1.035694, 0.1676578, 1.201895, 1, 0, 0.8392157, 1,
1.035988, -0.2375614, 1.360756, 1, 0, 0.8352941, 1,
1.036654, -0.7322775, 3.057366, 1, 0, 0.827451, 1,
1.036699, 0.568518, 0.03276078, 1, 0, 0.8235294, 1,
1.03861, 1.858693, 1.272168, 1, 0, 0.8156863, 1,
1.03996, 0.9175338, 0.4880237, 1, 0, 0.8117647, 1,
1.043136, -0.1474439, 2.405846, 1, 0, 0.8039216, 1,
1.044485, 0.4086666, 0.6702123, 1, 0, 0.7960784, 1,
1.046191, 1.50029, 2.414186, 1, 0, 0.7921569, 1,
1.05196, 1.883413, 1.13721, 1, 0, 0.7843137, 1,
1.05497, -0.8374025, 3.359108, 1, 0, 0.7803922, 1,
1.059115, 0.5286856, 0.9221683, 1, 0, 0.772549, 1,
1.071026, 0.518595, -0.6497252, 1, 0, 0.7686275, 1,
1.072465, -0.4950014, 0.8924843, 1, 0, 0.7607843, 1,
1.074354, -1.94417, 2.219229, 1, 0, 0.7568628, 1,
1.089016, 0.7942908, 0.5523187, 1, 0, 0.7490196, 1,
1.090013, -0.389171, 2.131371, 1, 0, 0.7450981, 1,
1.092256, 0.9160298, 1.996815, 1, 0, 0.7372549, 1,
1.105922, 0.7188511, 0.009106757, 1, 0, 0.7333333, 1,
1.10664, -0.446325, 1.619334, 1, 0, 0.7254902, 1,
1.111083, 2.133504, 0.4387082, 1, 0, 0.7215686, 1,
1.124321, 0.2756088, -0.4718416, 1, 0, 0.7137255, 1,
1.137779, -1.409899, 3.316179, 1, 0, 0.7098039, 1,
1.143351, -0.9199839, 3.461506, 1, 0, 0.7019608, 1,
1.149454, -1.05682, 2.263171, 1, 0, 0.6941177, 1,
1.152244, 0.3936262, 3.193159, 1, 0, 0.6901961, 1,
1.162494, -0.8235342, 3.249045, 1, 0, 0.682353, 1,
1.164995, 0.7870481, 1.305207, 1, 0, 0.6784314, 1,
1.172093, 0.1361055, 2.083111, 1, 0, 0.6705883, 1,
1.176007, -1.445651, 1.475977, 1, 0, 0.6666667, 1,
1.17711, -0.2581288, 2.196333, 1, 0, 0.6588235, 1,
1.189825, -0.5134837, 1.960256, 1, 0, 0.654902, 1,
1.206589, -1.340181, 2.5072, 1, 0, 0.6470588, 1,
1.20726, -1.405878, 2.443557, 1, 0, 0.6431373, 1,
1.212994, 1.20391, 0.4859282, 1, 0, 0.6352941, 1,
1.230075, 3.075508, 0.5876115, 1, 0, 0.6313726, 1,
1.231317, -0.4402239, 1.606383, 1, 0, 0.6235294, 1,
1.232013, 0.01259904, 2.405068, 1, 0, 0.6196079, 1,
1.233326, -0.9663449, 1.735974, 1, 0, 0.6117647, 1,
1.240175, -0.1889638, 1.066529, 1, 0, 0.6078432, 1,
1.245863, 0.8654386, 0.1593547, 1, 0, 0.6, 1,
1.246505, 0.7012788, 2.815556, 1, 0, 0.5921569, 1,
1.247954, -0.6537686, 2.01626, 1, 0, 0.5882353, 1,
1.248358, -0.3526908, 1.790393, 1, 0, 0.5803922, 1,
1.25026, -0.3974573, 1.633472, 1, 0, 0.5764706, 1,
1.257478, -0.7037739, 1.088245, 1, 0, 0.5686275, 1,
1.25869, -0.8751566, 2.515064, 1, 0, 0.5647059, 1,
1.272268, 0.0998483, 2.703003, 1, 0, 0.5568628, 1,
1.282418, -1.288557, 1.533233, 1, 0, 0.5529412, 1,
1.287791, -0.5021734, 1.486766, 1, 0, 0.5450981, 1,
1.290951, 0.8239917, 0.7205732, 1, 0, 0.5411765, 1,
1.294687, 0.9813021, 0.9785394, 1, 0, 0.5333334, 1,
1.297925, 1.854334, -0.3225257, 1, 0, 0.5294118, 1,
1.300666, 0.4078372, 0.7182869, 1, 0, 0.5215687, 1,
1.307313, 1.431934, -0.2332181, 1, 0, 0.5176471, 1,
1.309487, -0.3073899, 3.666617, 1, 0, 0.509804, 1,
1.319597, 1.561413, 1.497549, 1, 0, 0.5058824, 1,
1.329654, -0.4267265, 0.4915975, 1, 0, 0.4980392, 1,
1.331759, 0.1663988, -0.4315361, 1, 0, 0.4901961, 1,
1.339329, -0.299371, 4.113803, 1, 0, 0.4862745, 1,
1.340819, 1.164461, -0.6126764, 1, 0, 0.4784314, 1,
1.344524, -1.108841, 3.853332, 1, 0, 0.4745098, 1,
1.351975, -0.08039344, 1.71077, 1, 0, 0.4666667, 1,
1.35481, -0.4359333, 3.064494, 1, 0, 0.4627451, 1,
1.359433, -1.306082, 2.423054, 1, 0, 0.454902, 1,
1.364501, 0.4852171, 2.119254, 1, 0, 0.4509804, 1,
1.377913, -1.05733, 2.217004, 1, 0, 0.4431373, 1,
1.382538, 0.795446, 1.109782, 1, 0, 0.4392157, 1,
1.383696, -0.03102129, 2.091, 1, 0, 0.4313726, 1,
1.393668, 0.08486814, 1.196646, 1, 0, 0.427451, 1,
1.394718, 1.255741, -0.2693625, 1, 0, 0.4196078, 1,
1.411841, -0.6009706, 2.75026, 1, 0, 0.4156863, 1,
1.415572, -1.167824, 3.074503, 1, 0, 0.4078431, 1,
1.42619, 0.6867771, 1.625194, 1, 0, 0.4039216, 1,
1.430829, 0.456431, 0.1767311, 1, 0, 0.3960784, 1,
1.436375, 0.3820627, 1.494132, 1, 0, 0.3882353, 1,
1.439169, -0.2958463, 2.589779, 1, 0, 0.3843137, 1,
1.445779, -1.15302, 1.966187, 1, 0, 0.3764706, 1,
1.447865, 0.3629727, 1.904508, 1, 0, 0.372549, 1,
1.452235, 0.4920451, 1.823437, 1, 0, 0.3647059, 1,
1.471764, -0.4778232, 1.172177, 1, 0, 0.3607843, 1,
1.472486, 0.2607449, 3.273611, 1, 0, 0.3529412, 1,
1.473146, -0.9059261, 3.920768, 1, 0, 0.3490196, 1,
1.473319, -0.08783562, 3.537748, 1, 0, 0.3411765, 1,
1.487971, -0.06767808, 1.440712, 1, 0, 0.3372549, 1,
1.502358, 0.3224504, 0.6895346, 1, 0, 0.3294118, 1,
1.506742, -1.33118, 3.631395, 1, 0, 0.3254902, 1,
1.545593, -1.632349, 2.189873, 1, 0, 0.3176471, 1,
1.547238, 0.05892755, 1.845717, 1, 0, 0.3137255, 1,
1.555884, 1.457804, 1.304901, 1, 0, 0.3058824, 1,
1.576677, -0.3685041, 2.032695, 1, 0, 0.2980392, 1,
1.590562, 0.003008994, 2.50682, 1, 0, 0.2941177, 1,
1.597522, 1.060506, 0.5955195, 1, 0, 0.2862745, 1,
1.599975, 1.040997, 0.5658237, 1, 0, 0.282353, 1,
1.63387, -0.3343286, 2.341375, 1, 0, 0.2745098, 1,
1.642902, 0.9162347, 0.2739089, 1, 0, 0.2705882, 1,
1.643208, 0.3207674, -0.06067614, 1, 0, 0.2627451, 1,
1.668883, 1.283141, -0.2178012, 1, 0, 0.2588235, 1,
1.677969, 0.359948, 1.295711, 1, 0, 0.2509804, 1,
1.69917, 0.3023508, 1.116698, 1, 0, 0.2470588, 1,
1.700138, 1.265176, 0.4228778, 1, 0, 0.2392157, 1,
1.721271, 0.7851503, 3.065392, 1, 0, 0.2352941, 1,
1.732891, -0.471618, 1.784953, 1, 0, 0.227451, 1,
1.773637, 1.011679, 0.6321511, 1, 0, 0.2235294, 1,
1.828398, -0.6107456, 1.950735, 1, 0, 0.2156863, 1,
1.843516, 0.5733098, -0.8991377, 1, 0, 0.2117647, 1,
1.853741, 0.7463598, 1.126713, 1, 0, 0.2039216, 1,
1.878381, 0.7542253, -0.1512097, 1, 0, 0.1960784, 1,
1.878873, 0.4184659, 1.105969, 1, 0, 0.1921569, 1,
1.884681, 0.2344402, 0.4075054, 1, 0, 0.1843137, 1,
1.906259, 0.1996776, 2.161173, 1, 0, 0.1803922, 1,
1.915152, 0.787687, 0.5324572, 1, 0, 0.172549, 1,
1.922938, -1.860471, 3.058072, 1, 0, 0.1686275, 1,
1.943237, -0.8864051, 2.568004, 1, 0, 0.1607843, 1,
1.951779, 1.497923, 1.601529, 1, 0, 0.1568628, 1,
1.962612, -0.5505121, 1.13129, 1, 0, 0.1490196, 1,
1.990362, 0.1021601, 2.332792, 1, 0, 0.145098, 1,
1.99119, 1.196954, 2.02213, 1, 0, 0.1372549, 1,
1.991883, 0.7720664, 1.675484, 1, 0, 0.1333333, 1,
1.993847, 0.1946918, -0.1777391, 1, 0, 0.1254902, 1,
2.016096, -0.5308281, 3.555357, 1, 0, 0.1215686, 1,
2.031603, -1.030959, 2.190787, 1, 0, 0.1137255, 1,
2.041981, -0.06953714, 3.326889, 1, 0, 0.1098039, 1,
2.044608, 0.2422997, 1.808897, 1, 0, 0.1019608, 1,
2.054314, 0.593189, 1.668213, 1, 0, 0.09411765, 1,
2.093921, -1.41044, 2.548231, 1, 0, 0.09019608, 1,
2.099812, 0.1940216, 0.9374208, 1, 0, 0.08235294, 1,
2.121313, -0.6952255, 1.38384, 1, 0, 0.07843138, 1,
2.23214, -0.7406114, 1.946839, 1, 0, 0.07058824, 1,
2.253479, -0.6723174, 1.755862, 1, 0, 0.06666667, 1,
2.293305, 1.465159, 1.091335, 1, 0, 0.05882353, 1,
2.302343, -0.319915, 1.927706, 1, 0, 0.05490196, 1,
2.307022, 0.3572465, 0.08515386, 1, 0, 0.04705882, 1,
2.34724, -0.5644704, 2.868294, 1, 0, 0.04313726, 1,
2.410508, -1.429525, 1.784368, 1, 0, 0.03529412, 1,
2.42994, 0.2092883, 2.11673, 1, 0, 0.03137255, 1,
2.633866, 0.07596707, 1.661376, 1, 0, 0.02352941, 1,
2.659337, 1.448272, 0.3463856, 1, 0, 0.01960784, 1,
2.735744, 1.834888, 1.77359, 1, 0, 0.01176471, 1,
2.919205, -1.183968, 1.921384, 1, 0, 0.007843138, 1
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
-0.4079479, -4.414253, -6.717668, 0, -0.5, 0.5, 0.5,
-0.4079479, -4.414253, -6.717668, 1, -0.5, 0.5, 0.5,
-0.4079479, -4.414253, -6.717668, 1, 1.5, 0.5, 0.5,
-0.4079479, -4.414253, -6.717668, 0, 1.5, 0.5, 0.5
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
-4.863006, -0.1266131, -6.717668, 0, -0.5, 0.5, 0.5,
-4.863006, -0.1266131, -6.717668, 1, -0.5, 0.5, 0.5,
-4.863006, -0.1266131, -6.717668, 1, 1.5, 0.5, 0.5,
-4.863006, -0.1266131, -6.717668, 0, 1.5, 0.5, 0.5
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
-4.863006, -4.414253, 0.3176568, 0, -0.5, 0.5, 0.5,
-4.863006, -4.414253, 0.3176568, 1, -0.5, 0.5, 0.5,
-4.863006, -4.414253, 0.3176568, 1, 1.5, 0.5, 0.5,
-4.863006, -4.414253, 0.3176568, 0, 1.5, 0.5, 0.5
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
-3, -3.424798, -5.094131,
2, -3.424798, -5.094131,
-3, -3.424798, -5.094131,
-3, -3.589707, -5.36472,
-2, -3.424798, -5.094131,
-2, -3.589707, -5.36472,
-1, -3.424798, -5.094131,
-1, -3.589707, -5.36472,
0, -3.424798, -5.094131,
0, -3.589707, -5.36472,
1, -3.424798, -5.094131,
1, -3.589707, -5.36472,
2, -3.424798, -5.094131,
2, -3.589707, -5.36472
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
-3, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
-3, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
-3, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
-3, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5,
-2, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
-2, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
-2, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
-2, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5,
-1, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
-1, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
-1, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
-1, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5,
0, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
0, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
0, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
0, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5,
1, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
1, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
1, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
1, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5,
2, -3.919525, -5.9059, 0, -0.5, 0.5, 0.5,
2, -3.919525, -5.9059, 1, -0.5, 0.5, 0.5,
2, -3.919525, -5.9059, 1, 1.5, 0.5, 0.5,
2, -3.919525, -5.9059, 0, 1.5, 0.5, 0.5
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
-3.834916, -3, -5.094131,
-3.834916, 3, -5.094131,
-3.834916, -3, -5.094131,
-4.006264, -3, -5.36472,
-3.834916, -2, -5.094131,
-4.006264, -2, -5.36472,
-3.834916, -1, -5.094131,
-4.006264, -1, -5.36472,
-3.834916, 0, -5.094131,
-4.006264, 0, -5.36472,
-3.834916, 1, -5.094131,
-4.006264, 1, -5.36472,
-3.834916, 2, -5.094131,
-4.006264, 2, -5.36472,
-3.834916, 3, -5.094131,
-4.006264, 3, -5.36472
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
-4.348961, -3, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, -3, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, -3, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, -3, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, -2, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, -2, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, -2, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, -2, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, -1, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, -1, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, -1, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, -1, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, 0, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, 0, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, 0, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, 0, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, 1, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, 1, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, 1, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, 1, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, 2, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, 2, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, 2, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, 2, -5.9059, 0, 1.5, 0.5, 0.5,
-4.348961, 3, -5.9059, 0, -0.5, 0.5, 0.5,
-4.348961, 3, -5.9059, 1, -0.5, 0.5, 0.5,
-4.348961, 3, -5.9059, 1, 1.5, 0.5, 0.5,
-4.348961, 3, -5.9059, 0, 1.5, 0.5, 0.5
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
-3.834916, -3.424798, -4,
-3.834916, -3.424798, 4,
-3.834916, -3.424798, -4,
-4.006264, -3.589707, -4,
-3.834916, -3.424798, -2,
-4.006264, -3.589707, -2,
-3.834916, -3.424798, 0,
-4.006264, -3.589707, 0,
-3.834916, -3.424798, 2,
-4.006264, -3.589707, 2,
-3.834916, -3.424798, 4,
-4.006264, -3.589707, 4
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
-4.348961, -3.919525, -4, 0, -0.5, 0.5, 0.5,
-4.348961, -3.919525, -4, 1, -0.5, 0.5, 0.5,
-4.348961, -3.919525, -4, 1, 1.5, 0.5, 0.5,
-4.348961, -3.919525, -4, 0, 1.5, 0.5, 0.5,
-4.348961, -3.919525, -2, 0, -0.5, 0.5, 0.5,
-4.348961, -3.919525, -2, 1, -0.5, 0.5, 0.5,
-4.348961, -3.919525, -2, 1, 1.5, 0.5, 0.5,
-4.348961, -3.919525, -2, 0, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 0, 0, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 0, 1, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 0, 1, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 0, 0, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 2, 0, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 2, 1, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 2, 1, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 2, 0, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 4, 0, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 4, 1, -0.5, 0.5, 0.5,
-4.348961, -3.919525, 4, 1, 1.5, 0.5, 0.5,
-4.348961, -3.919525, 4, 0, 1.5, 0.5, 0.5
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
-3.834916, -3.424798, -5.094131,
-3.834916, 3.171571, -5.094131,
-3.834916, -3.424798, 5.729445,
-3.834916, 3.171571, 5.729445,
-3.834916, -3.424798, -5.094131,
-3.834916, -3.424798, 5.729445,
-3.834916, 3.171571, -5.094131,
-3.834916, 3.171571, 5.729445,
-3.834916, -3.424798, -5.094131,
3.01902, -3.424798, -5.094131,
-3.834916, -3.424798, 5.729445,
3.01902, -3.424798, 5.729445,
-3.834916, 3.171571, -5.094131,
3.01902, 3.171571, -5.094131,
-3.834916, 3.171571, 5.729445,
3.01902, 3.171571, 5.729445,
3.01902, -3.424798, -5.094131,
3.01902, 3.171571, -5.094131,
3.01902, -3.424798, 5.729445,
3.01902, 3.171571, 5.729445,
3.01902, -3.424798, -5.094131,
3.01902, -3.424798, 5.729445,
3.01902, 3.171571, -5.094131,
3.01902, 3.171571, 5.729445
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
var radius = 7.694478;
var distance = 34.23361;
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
mvMatrix.translate( 0.4079479, 0.1266131, -0.3176568 );
mvMatrix.scale( 1.213817, 1.261212, 0.7686388 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.23361);
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
isocrotonate<-read.table("isocrotonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isocrotonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
```

```r
y<-isocrotonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
```

```r
z<-isocrotonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
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
-3.735101, 0.5357744, -1.447563, 0, 0, 1, 1, 1,
-3.312769, 2.064067, -2.095219, 1, 0, 0, 1, 1,
-3.311304, 0.09676345, -2.887888, 1, 0, 0, 1, 1,
-2.833854, -2.448291, -2.362324, 1, 0, 0, 1, 1,
-2.702035, -0.2403641, -1.884339, 1, 0, 0, 1, 1,
-2.55191, 1.293119, -0.9324663, 1, 0, 0, 1, 1,
-2.489352, -0.6457472, -0.8076185, 0, 0, 0, 1, 1,
-2.467945, -1.055388, -2.035942, 0, 0, 0, 1, 1,
-2.460576, -1.138494, -2.755376, 0, 0, 0, 1, 1,
-2.372785, 0.1164418, -2.588206, 0, 0, 0, 1, 1,
-2.346187, 0.7418681, -0.9752281, 0, 0, 0, 1, 1,
-2.279889, -1.126394, -3.014962, 0, 0, 0, 1, 1,
-2.26493, 2.25092, -0.5885473, 0, 0, 0, 1, 1,
-2.251537, 2.480589, -0.1752295, 1, 1, 1, 1, 1,
-2.232604, 1.119918, -0.8489738, 1, 1, 1, 1, 1,
-2.193224, -1.059579, -1.8059, 1, 1, 1, 1, 1,
-2.162663, -0.8957977, -0.855922, 1, 1, 1, 1, 1,
-2.098937, 0.5694396, -0.5114091, 1, 1, 1, 1, 1,
-2.089385, -0.1465052, -1.134418, 1, 1, 1, 1, 1,
-2.087828, -1.172243, -2.555398, 1, 1, 1, 1, 1,
-2.044726, -0.03675857, -1.859522, 1, 1, 1, 1, 1,
-2.033945, -0.3394186, -0.6326447, 1, 1, 1, 1, 1,
-2.029764, 0.5397733, -2.074515, 1, 1, 1, 1, 1,
-1.997862, -1.895062, -3.674301, 1, 1, 1, 1, 1,
-1.988092, 0.3384375, 0.8081809, 1, 1, 1, 1, 1,
-1.969123, 1.332094, -1.858129, 1, 1, 1, 1, 1,
-1.959892, -1.406913, -1.863121, 1, 1, 1, 1, 1,
-1.954602, -0.2896102, -1.342408, 1, 1, 1, 1, 1,
-1.929365, 2.773366, 0.7496102, 0, 0, 1, 1, 1,
-1.908098, -0.3950895, -0.7369244, 1, 0, 0, 1, 1,
-1.891911, 0.2721189, -1.574703, 1, 0, 0, 1, 1,
-1.884221, 0.145969, -2.774474, 1, 0, 0, 1, 1,
-1.874897, -0.4325444, -4.609859, 1, 0, 0, 1, 1,
-1.84732, 0.8437948, -0.7254474, 1, 0, 0, 1, 1,
-1.768218, -0.9561875, -3.842077, 0, 0, 0, 1, 1,
-1.761782, 1.300587, -1.214667, 0, 0, 0, 1, 1,
-1.74923, 1.239764, -0.09238129, 0, 0, 0, 1, 1,
-1.748893, 0.2498095, -0.4007364, 0, 0, 0, 1, 1,
-1.734791, -0.05200966, -1.293362, 0, 0, 0, 1, 1,
-1.716923, 0.7664227, -2.923001, 0, 0, 0, 1, 1,
-1.709343, 0.2392129, -1.803072, 0, 0, 0, 1, 1,
-1.703565, 0.3902172, -0.9111487, 1, 1, 1, 1, 1,
-1.680326, -0.6830233, -2.27224, 1, 1, 1, 1, 1,
-1.660405, -0.3421125, -0.8982679, 1, 1, 1, 1, 1,
-1.649747, -1.603094, -2.385685, 1, 1, 1, 1, 1,
-1.643952, -0.8503815, -2.630641, 1, 1, 1, 1, 1,
-1.627576, 0.2740723, -0.04389339, 1, 1, 1, 1, 1,
-1.618111, -0.2686509, -2.58166, 1, 1, 1, 1, 1,
-1.615629, 1.382519, -0.1655187, 1, 1, 1, 1, 1,
-1.614164, -1.10155, -2.554793, 1, 1, 1, 1, 1,
-1.591896, -1.525179, -4.088364, 1, 1, 1, 1, 1,
-1.578014, -1.431846, -1.023014, 1, 1, 1, 1, 1,
-1.570782, -0.6204596, 0.4821229, 1, 1, 1, 1, 1,
-1.566536, 1.012308, 0.7999008, 1, 1, 1, 1, 1,
-1.564172, -1.326645, -1.957557, 1, 1, 1, 1, 1,
-1.561998, 0.2471879, -1.453698, 1, 1, 1, 1, 1,
-1.561986, 0.1480602, 0.1531567, 0, 0, 1, 1, 1,
-1.56075, -1.71007, -4.328393, 1, 0, 0, 1, 1,
-1.554531, -0.6702876, -2.843445, 1, 0, 0, 1, 1,
-1.546239, 0.8582602, 1.022532, 1, 0, 0, 1, 1,
-1.529019, -1.158051, -1.883798, 1, 0, 0, 1, 1,
-1.525337, -0.106384, -0.5550619, 1, 0, 0, 1, 1,
-1.503689, 2.403178, -0.7183613, 0, 0, 0, 1, 1,
-1.50262, 1.413459, -3.207061, 0, 0, 0, 1, 1,
-1.496191, 0.4863757, -0.8084111, 0, 0, 0, 1, 1,
-1.495986, -0.3741503, -1.663925, 0, 0, 0, 1, 1,
-1.491805, -0.05428528, -1.782546, 0, 0, 0, 1, 1,
-1.491028, 0.6754802, -1.489631, 0, 0, 0, 1, 1,
-1.490662, 0.2537108, -1.016374, 0, 0, 0, 1, 1,
-1.489043, 0.6291312, 0.8841158, 1, 1, 1, 1, 1,
-1.482436, -0.4521093, -2.665729, 1, 1, 1, 1, 1,
-1.479929, 1.124585, 0.4098718, 1, 1, 1, 1, 1,
-1.479671, 0.6009284, -1.570418, 1, 1, 1, 1, 1,
-1.477566, -0.892386, -2.477974, 1, 1, 1, 1, 1,
-1.468536, 0.09067576, 0.8706073, 1, 1, 1, 1, 1,
-1.462139, 0.4116551, -1.692432, 1, 1, 1, 1, 1,
-1.461562, -0.6162583, -2.509247, 1, 1, 1, 1, 1,
-1.459292, 0.5994002, -2.342884, 1, 1, 1, 1, 1,
-1.453609, -2.113314, -3.531884, 1, 1, 1, 1, 1,
-1.448465, -1.35387, -2.654723, 1, 1, 1, 1, 1,
-1.42362, -1.58491, 0.06919893, 1, 1, 1, 1, 1,
-1.419992, -0.2974823, -2.88795, 1, 1, 1, 1, 1,
-1.413166, 0.206852, -2.707928, 1, 1, 1, 1, 1,
-1.41066, 0.8719685, -3.756932, 1, 1, 1, 1, 1,
-1.408419, 0.2736904, -2.353712, 0, 0, 1, 1, 1,
-1.386353, -1.190711, -1.537266, 1, 0, 0, 1, 1,
-1.383575, -1.293982, -0.8220168, 1, 0, 0, 1, 1,
-1.378348, 0.6833747, -1.427589, 1, 0, 0, 1, 1,
-1.371649, -1.319321, -1.249506, 1, 0, 0, 1, 1,
-1.370307, 1.116937, 0.30807, 1, 0, 0, 1, 1,
-1.346786, 0.6035013, -2.578171, 0, 0, 0, 1, 1,
-1.339351, -2.236442, -3.476575, 0, 0, 0, 1, 1,
-1.336822, 0.8746733, -1.211893, 0, 0, 0, 1, 1,
-1.329913, 1.143577, 1.228896, 0, 0, 0, 1, 1,
-1.326402, 0.6749095, -1.806952, 0, 0, 0, 1, 1,
-1.317537, 0.6599039, -0.8518661, 0, 0, 0, 1, 1,
-1.316871, -1.480004, -1.326478, 0, 0, 0, 1, 1,
-1.302922, 1.178317, 0.5840906, 1, 1, 1, 1, 1,
-1.301117, 0.4459629, -1.533555, 1, 1, 1, 1, 1,
-1.296526, 0.07411072, -2.696817, 1, 1, 1, 1, 1,
-1.28963, -2.287461, -2.505119, 1, 1, 1, 1, 1,
-1.288134, 0.5466762, -1.570587, 1, 1, 1, 1, 1,
-1.279302, -1.464292, -3.024717, 1, 1, 1, 1, 1,
-1.273466, 1.101716, -0.1759287, 1, 1, 1, 1, 1,
-1.273194, -0.352743, -1.471763, 1, 1, 1, 1, 1,
-1.268647, -1.139624, -2.267674, 1, 1, 1, 1, 1,
-1.268405, -1.687265, -2.146874, 1, 1, 1, 1, 1,
-1.267766, -1.36604, -2.318189, 1, 1, 1, 1, 1,
-1.259931, -0.3665565, -1.934781, 1, 1, 1, 1, 1,
-1.258412, -2.023956, -4.053381, 1, 1, 1, 1, 1,
-1.257529, 0.2867354, -0.6022419, 1, 1, 1, 1, 1,
-1.254281, -0.44989, -2.04322, 1, 1, 1, 1, 1,
-1.235821, -0.04016585, -1.314406, 0, 0, 1, 1, 1,
-1.234594, -0.3386852, -2.426599, 1, 0, 0, 1, 1,
-1.231715, 0.3222772, -2.332887, 1, 0, 0, 1, 1,
-1.23063, -0.7741735, -1.859063, 1, 0, 0, 1, 1,
-1.224177, 0.02643288, -0.5162407, 1, 0, 0, 1, 1,
-1.221681, -1.633598, -1.067174, 1, 0, 0, 1, 1,
-1.217266, -0.07387534, -1.96257, 0, 0, 0, 1, 1,
-1.214363, 1.65482, 0.878066, 0, 0, 0, 1, 1,
-1.21323, 2.144939, 1.994448, 0, 0, 0, 1, 1,
-1.208765, -0.2483059, -1.976808, 0, 0, 0, 1, 1,
-1.206991, 0.3441447, -3.09497, 0, 0, 0, 1, 1,
-1.199332, 1.29583, -0.3984285, 0, 0, 0, 1, 1,
-1.19798, -0.03449786, 0.02680984, 0, 0, 0, 1, 1,
-1.196386, 0.7239642, -0.3083539, 1, 1, 1, 1, 1,
-1.190102, 1.092227, -0.7963369, 1, 1, 1, 1, 1,
-1.189546, -1.281558, -4.029758, 1, 1, 1, 1, 1,
-1.18753, 1.357778, -1.069645, 1, 1, 1, 1, 1,
-1.180915, 1.949253, -0.6111075, 1, 1, 1, 1, 1,
-1.17594, -0.5373961, -1.835153, 1, 1, 1, 1, 1,
-1.172768, 0.7671875, -0.8958205, 1, 1, 1, 1, 1,
-1.172527, -0.02632494, -3.082193, 1, 1, 1, 1, 1,
-1.17204, -2.018719, -1.999625, 1, 1, 1, 1, 1,
-1.162498, 2.673508, -0.001570562, 1, 1, 1, 1, 1,
-1.162078, 0.1097746, -0.5668973, 1, 1, 1, 1, 1,
-1.155042, -0.367214, -1.115392, 1, 1, 1, 1, 1,
-1.154037, 1.071939, -1.109134, 1, 1, 1, 1, 1,
-1.147645, 1.033903, -1.228789, 1, 1, 1, 1, 1,
-1.145796, -2.154136, -2.908799, 1, 1, 1, 1, 1,
-1.13104, 1.415699, -0.4834129, 0, 0, 1, 1, 1,
-1.128983, -1.361564, -1.896019, 1, 0, 0, 1, 1,
-1.127672, 0.3102703, -1.184548, 1, 0, 0, 1, 1,
-1.127084, 0.4696067, -1.261289, 1, 0, 0, 1, 1,
-1.123029, 0.8052963, 0.5561039, 1, 0, 0, 1, 1,
-1.121719, 0.5707901, 0.307402, 1, 0, 0, 1, 1,
-1.119916, 0.451691, -1.485629, 0, 0, 0, 1, 1,
-1.119012, -0.8126635, -3.701377, 0, 0, 0, 1, 1,
-1.107947, -0.7627866, -1.29814, 0, 0, 0, 1, 1,
-1.105278, 1.034568, -0.5705016, 0, 0, 0, 1, 1,
-1.103814, 1.113261, -2.334707, 0, 0, 0, 1, 1,
-1.103429, -1.633537, -2.659345, 0, 0, 0, 1, 1,
-1.10212, -0.3203815, -1.402761, 0, 0, 0, 1, 1,
-1.101376, -0.5643083, -4.618887, 1, 1, 1, 1, 1,
-1.096544, -1.699145, -3.539924, 1, 1, 1, 1, 1,
-1.095255, 1.087902, -1.264986, 1, 1, 1, 1, 1,
-1.093755, 0.9412551, -1.206787, 1, 1, 1, 1, 1,
-1.090812, -0.1796099, -1.577769, 1, 1, 1, 1, 1,
-1.077213, 0.002335806, -2.307808, 1, 1, 1, 1, 1,
-1.076895, 0.3328425, -1.819204, 1, 1, 1, 1, 1,
-1.070884, 0.6418787, -0.4445723, 1, 1, 1, 1, 1,
-1.070218, -0.3961358, -2.296999, 1, 1, 1, 1, 1,
-1.067337, -0.2148109, -1.39914, 1, 1, 1, 1, 1,
-1.061804, -0.5093482, -2.229269, 1, 1, 1, 1, 1,
-1.060657, -0.2644297, -1.278497, 1, 1, 1, 1, 1,
-1.058454, -0.9447244, -2.203451, 1, 1, 1, 1, 1,
-1.057132, 0.111661, -1.515718, 1, 1, 1, 1, 1,
-1.052712, -0.5616011, -1.924154, 1, 1, 1, 1, 1,
-1.0486, 1.665453, 0.1154781, 0, 0, 1, 1, 1,
-1.048388, -1.716031, -1.872357, 1, 0, 0, 1, 1,
-1.044178, 0.04672294, -2.300696, 1, 0, 0, 1, 1,
-1.04258, -1.182487, -2.328629, 1, 0, 0, 1, 1,
-1.038553, -0.8039654, -3.102585, 1, 0, 0, 1, 1,
-1.038321, -0.8685604, -0.8305181, 1, 0, 0, 1, 1,
-1.02998, 0.7046352, 0.3169166, 0, 0, 0, 1, 1,
-1.028178, -0.04316166, -2.102586, 0, 0, 0, 1, 1,
-1.026718, -0.977715, -1.565467, 0, 0, 0, 1, 1,
-1.024417, 0.1773909, -0.8096819, 0, 0, 0, 1, 1,
-1.016215, 0.6863835, -1.814236, 0, 0, 0, 1, 1,
-1.008625, 0.06458076, -0.7744279, 0, 0, 0, 1, 1,
-1.006297, -1.038314, -1.9636, 0, 0, 0, 1, 1,
-1.000129, -0.2004456, -1.487644, 1, 1, 1, 1, 1,
-0.9988803, -0.3371576, -0.2595844, 1, 1, 1, 1, 1,
-0.9943442, -0.7128055, -2.566771, 1, 1, 1, 1, 1,
-0.9933395, -1.197725, -3.495513, 1, 1, 1, 1, 1,
-0.9901069, -0.8753674, -2.776249, 1, 1, 1, 1, 1,
-0.9867385, 0.6426637, -0.8946913, 1, 1, 1, 1, 1,
-0.9850117, -0.7328292, -1.774678, 1, 1, 1, 1, 1,
-0.9783573, -1.119514, -0.9371889, 1, 1, 1, 1, 1,
-0.9563844, -1.220005, -2.187246, 1, 1, 1, 1, 1,
-0.9543496, 0.0951688, -1.282013, 1, 1, 1, 1, 1,
-0.9512579, 2.241337, -0.3588749, 1, 1, 1, 1, 1,
-0.9491264, 0.9982474, -1.069329, 1, 1, 1, 1, 1,
-0.9386318, 0.4049518, 0.5078161, 1, 1, 1, 1, 1,
-0.9327677, -0.2862428, -0.9751923, 1, 1, 1, 1, 1,
-0.9323403, -1.25214, -1.272287, 1, 1, 1, 1, 1,
-0.9315332, -0.6879121, -2.133656, 0, 0, 1, 1, 1,
-0.9032274, 1.514789, -1.012174, 1, 0, 0, 1, 1,
-0.8931645, -0.3554721, -1.448516, 1, 0, 0, 1, 1,
-0.8926048, -1.364498, -3.493528, 1, 0, 0, 1, 1,
-0.8872046, 0.5331746, -2.041658, 1, 0, 0, 1, 1,
-0.8870111, 0.4276485, -1.163895, 1, 0, 0, 1, 1,
-0.8830674, -0.6350855, -2.559572, 0, 0, 0, 1, 1,
-0.8738075, -2.282238, -3.178661, 0, 0, 0, 1, 1,
-0.8682662, -0.2161446, -3.417652, 0, 0, 0, 1, 1,
-0.8611013, -0.3364368, -1.627419, 0, 0, 0, 1, 1,
-0.8504391, -0.3087479, -1.291474, 0, 0, 0, 1, 1,
-0.8453604, -1.40498, -3.311252, 0, 0, 0, 1, 1,
-0.8453299, -1.230336, -3.266504, 0, 0, 0, 1, 1,
-0.8407922, -0.3593768, -1.585402, 1, 1, 1, 1, 1,
-0.8312258, 0.914818, -0.00416816, 1, 1, 1, 1, 1,
-0.8296894, 2.162354, -1.007441, 1, 1, 1, 1, 1,
-0.825576, -0.9614035, -0.8089101, 1, 1, 1, 1, 1,
-0.8219669, 0.7263575, -1.44044, 1, 1, 1, 1, 1,
-0.8182181, -0.3927122, -1.837297, 1, 1, 1, 1, 1,
-0.8114262, -0.5620622, -1.200424, 1, 1, 1, 1, 1,
-0.8101597, 0.7839729, -2.325773, 1, 1, 1, 1, 1,
-0.8078567, -1.303071, -4.114482, 1, 1, 1, 1, 1,
-0.8076667, -0.3898141, -2.18888, 1, 1, 1, 1, 1,
-0.8020806, -1.9394, -3.078536, 1, 1, 1, 1, 1,
-0.8016244, 1.022856, -1.300817, 1, 1, 1, 1, 1,
-0.7944278, -0.8544796, -2.141114, 1, 1, 1, 1, 1,
-0.7939877, 0.1984557, -1.875771, 1, 1, 1, 1, 1,
-0.7926304, -0.05843428, -1.867063, 1, 1, 1, 1, 1,
-0.7921138, -0.6294096, -0.7844544, 0, 0, 1, 1, 1,
-0.7883825, -0.8241994, -3.414298, 1, 0, 0, 1, 1,
-0.7851336, 0.05194547, 0.6406604, 1, 0, 0, 1, 1,
-0.7824752, 0.4443302, -0.5946968, 1, 0, 0, 1, 1,
-0.7801829, 2.718077, 0.9769515, 1, 0, 0, 1, 1,
-0.7753026, 1.205489, -0.5050411, 1, 0, 0, 1, 1,
-0.7707504, 0.1311495, -1.907795, 0, 0, 0, 1, 1,
-0.7648792, -0.6952364, -4.014181, 0, 0, 0, 1, 1,
-0.7571419, 0.1364616, 1.648031, 0, 0, 0, 1, 1,
-0.7557333, -0.4977347, -3.213226, 0, 0, 0, 1, 1,
-0.7494668, 0.6355655, -0.1728441, 0, 0, 0, 1, 1,
-0.748822, -1.390028, -1.502965, 0, 0, 0, 1, 1,
-0.7454244, -0.3713903, -1.386664, 0, 0, 0, 1, 1,
-0.7434066, -2.085077, -4.043314, 1, 1, 1, 1, 1,
-0.7412617, -1.020627, -1.313919, 1, 1, 1, 1, 1,
-0.7404192, -0.5839483, -3.977965, 1, 1, 1, 1, 1,
-0.7378379, -1.262524, -2.810346, 1, 1, 1, 1, 1,
-0.7377778, -1.547361, -3.438426, 1, 1, 1, 1, 1,
-0.7278894, -1.161052, -3.253573, 1, 1, 1, 1, 1,
-0.72236, -1.271866, -3.826762, 1, 1, 1, 1, 1,
-0.7190974, -2.428076, -3.106794, 1, 1, 1, 1, 1,
-0.7185584, -0.273468, -1.111472, 1, 1, 1, 1, 1,
-0.7149158, -0.745551, -1.40678, 1, 1, 1, 1, 1,
-0.7118451, 0.5271818, -1.271389, 1, 1, 1, 1, 1,
-0.7092711, -1.297531, -2.881765, 1, 1, 1, 1, 1,
-0.7082932, -0.06105404, -1.555889, 1, 1, 1, 1, 1,
-0.7044055, 2.694458, 0.02018863, 1, 1, 1, 1, 1,
-0.7031563, -0.9235194, -1.488441, 1, 1, 1, 1, 1,
-0.698179, 0.4206204, 1.045, 0, 0, 1, 1, 1,
-0.6954741, -1.622109, -2.34695, 1, 0, 0, 1, 1,
-0.6949241, -1.912284, -1.586386, 1, 0, 0, 1, 1,
-0.6944983, -2.935591, -0.5802737, 1, 0, 0, 1, 1,
-0.68752, -0.3023244, -1.232528, 1, 0, 0, 1, 1,
-0.6851005, -1.588481, -3.018492, 1, 0, 0, 1, 1,
-0.684606, -0.5281865, -1.985196, 0, 0, 0, 1, 1,
-0.6820464, 0.04201083, -1.549431, 0, 0, 0, 1, 1,
-0.6802745, -1.318509, -2.733771, 0, 0, 0, 1, 1,
-0.6783426, 1.361695, 1.220415, 0, 0, 0, 1, 1,
-0.6775675, -0.5625623, -2.361971, 0, 0, 0, 1, 1,
-0.6763622, -1.317065, -2.050139, 0, 0, 0, 1, 1,
-0.6641789, -0.6204584, -3.033542, 0, 0, 0, 1, 1,
-0.6634715, 0.003111628, -1.676604, 1, 1, 1, 1, 1,
-0.6609706, 2.018115, -0.02764533, 1, 1, 1, 1, 1,
-0.6587843, 0.2574715, -1.464488, 1, 1, 1, 1, 1,
-0.6569227, 0.5866155, -0.5433814, 1, 1, 1, 1, 1,
-0.6540354, 0.8201994, -0.6815131, 1, 1, 1, 1, 1,
-0.6492584, -0.3374074, -3.560555, 1, 1, 1, 1, 1,
-0.6446818, -0.8391039, 0.1984684, 1, 1, 1, 1, 1,
-0.6374896, 0.8464544, -0.1548668, 1, 1, 1, 1, 1,
-0.6358563, 0.2644493, -1.009784, 1, 1, 1, 1, 1,
-0.6348464, -0.7055432, -3.453164, 1, 1, 1, 1, 1,
-0.634106, 1.404857, -1.581145, 1, 1, 1, 1, 1,
-0.6276146, 0.1678124, 0.09700192, 1, 1, 1, 1, 1,
-0.6263706, 0.668529, 1.492061, 1, 1, 1, 1, 1,
-0.6263152, -0.231844, -3.013372, 1, 1, 1, 1, 1,
-0.6261384, 0.6881692, 0.9852808, 1, 1, 1, 1, 1,
-0.6203479, -0.1454134, -2.450505, 0, 0, 1, 1, 1,
-0.61814, 0.171978, -1.178188, 1, 0, 0, 1, 1,
-0.6125861, 1.159733, -0.2439239, 1, 0, 0, 1, 1,
-0.611481, -0.3546379, -3.301939, 1, 0, 0, 1, 1,
-0.6097739, 1.909133, -1.12751, 1, 0, 0, 1, 1,
-0.6081442, 1.765646, 0.384614, 1, 0, 0, 1, 1,
-0.6065581, 0.6282864, -0.9134114, 0, 0, 0, 1, 1,
-0.6064017, 0.04814802, -1.350956, 0, 0, 0, 1, 1,
-0.6052309, 0.2129193, -0.1649497, 0, 0, 0, 1, 1,
-0.6049441, 0.1120548, -1.156892, 0, 0, 0, 1, 1,
-0.6029739, 0.383905, -2.534667, 0, 0, 0, 1, 1,
-0.5920795, 0.8609537, -1.720506, 0, 0, 0, 1, 1,
-0.5896063, -1.21318, -4.70918, 0, 0, 0, 1, 1,
-0.5837417, 0.936219, -0.4190625, 1, 1, 1, 1, 1,
-0.5764035, -0.1161466, -1.566542, 1, 1, 1, 1, 1,
-0.5727148, 0.1218975, -0.971737, 1, 1, 1, 1, 1,
-0.5720251, 0.8531091, 0.0158014, 1, 1, 1, 1, 1,
-0.5714324, -0.7122827, -3.03473, 1, 1, 1, 1, 1,
-0.5424362, 0.6147153, 0.4958368, 1, 1, 1, 1, 1,
-0.5422027, -0.0161369, -2.598651, 1, 1, 1, 1, 1,
-0.541187, 1.111867, -1.302212, 1, 1, 1, 1, 1,
-0.5407826, -0.5327436, -1.715466, 1, 1, 1, 1, 1,
-0.5406336, 0.02582476, 0.91952, 1, 1, 1, 1, 1,
-0.5384808, -2.158659, -2.141565, 1, 1, 1, 1, 1,
-0.5355276, 0.207417, -2.393368, 1, 1, 1, 1, 1,
-0.5271743, -0.08086974, -2.057304, 1, 1, 1, 1, 1,
-0.5262287, 0.9880758, -0.9901953, 1, 1, 1, 1, 1,
-0.521581, 1.19318, 0.4139393, 1, 1, 1, 1, 1,
-0.5205751, -0.5971496, -2.331903, 0, 0, 1, 1, 1,
-0.5175131, -1.538392, -0.9022761, 1, 0, 0, 1, 1,
-0.5171875, 1.13331, -0.8102945, 1, 0, 0, 1, 1,
-0.5127169, 0.1660758, -1.027414, 1, 0, 0, 1, 1,
-0.5119286, -0.6415903, -1.82983, 1, 0, 0, 1, 1,
-0.5103173, 0.5846643, -1.828811, 1, 0, 0, 1, 1,
-0.5088974, -0.849182, -2.463719, 0, 0, 0, 1, 1,
-0.5026609, -0.268417, -2.327734, 0, 0, 0, 1, 1,
-0.5016517, 0.7567207, -0.3946308, 0, 0, 0, 1, 1,
-0.5015141, 1.009412, -0.2836877, 0, 0, 0, 1, 1,
-0.492349, -1.796223, -4.206587, 0, 0, 0, 1, 1,
-0.4813987, 0.8613006, -0.567933, 0, 0, 0, 1, 1,
-0.478161, 2.250322, 0.4866235, 0, 0, 0, 1, 1,
-0.4771561, 0.2061594, -0.7878125, 1, 1, 1, 1, 1,
-0.4761346, -1.101519, -2.691229, 1, 1, 1, 1, 1,
-0.4750869, 1.783849, 0.1396293, 1, 1, 1, 1, 1,
-0.4700221, 0.9773571, -2.270888, 1, 1, 1, 1, 1,
-0.4685247, -0.5966568, -3.273121, 1, 1, 1, 1, 1,
-0.4665631, 1.44141, -0.7865373, 1, 1, 1, 1, 1,
-0.460694, 0.9755424, 0.1747681, 1, 1, 1, 1, 1,
-0.4489939, 1.143887, -1.582735, 1, 1, 1, 1, 1,
-0.4455041, 1.473963, -0.9100691, 1, 1, 1, 1, 1,
-0.441851, -0.9487982, -3.567636, 1, 1, 1, 1, 1,
-0.4408203, 1.077836, -0.4574141, 1, 1, 1, 1, 1,
-0.4391012, 1.069348, 0.05568065, 1, 1, 1, 1, 1,
-0.4370061, -0.231895, -2.289279, 1, 1, 1, 1, 1,
-0.4340219, 1.416265, 1.144136, 1, 1, 1, 1, 1,
-0.4338995, 1.858514, -1.222674, 1, 1, 1, 1, 1,
-0.4314786, -1.029523, -3.034281, 0, 0, 1, 1, 1,
-0.4267654, -1.713942, -1.865773, 1, 0, 0, 1, 1,
-0.4239387, 0.8657708, 1.053135, 1, 0, 0, 1, 1,
-0.4208041, -1.484122, -3.624616, 1, 0, 0, 1, 1,
-0.4183058, -0.06066967, -1.974323, 1, 0, 0, 1, 1,
-0.4178047, -0.2613868, -1.848148, 1, 0, 0, 1, 1,
-0.4121229, -0.02369647, -1.159454, 0, 0, 0, 1, 1,
-0.4116163, 0.6827306, -0.06078272, 0, 0, 0, 1, 1,
-0.4108801, 1.442588, -1.277014, 0, 0, 0, 1, 1,
-0.4105989, -0.2620015, -3.320436, 0, 0, 0, 1, 1,
-0.4092313, 0.5396628, 0.5435077, 0, 0, 0, 1, 1,
-0.4088199, -0.8860686, -3.247108, 0, 0, 0, 1, 1,
-0.3998127, 0.1796342, -2.255659, 0, 0, 0, 1, 1,
-0.3953767, 0.09229472, -1.870219, 1, 1, 1, 1, 1,
-0.3941049, 0.3722408, -0.3686648, 1, 1, 1, 1, 1,
-0.3881474, 0.672932, -0.5511949, 1, 1, 1, 1, 1,
-0.3871795, 0.09405758, -0.7133057, 1, 1, 1, 1, 1,
-0.3849503, -1.617567, -1.660481, 1, 1, 1, 1, 1,
-0.3843486, 0.4889785, 0.4151983, 1, 1, 1, 1, 1,
-0.3824716, 0.9743602, -0.8533184, 1, 1, 1, 1, 1,
-0.3821729, 0.06829938, -0.145873, 1, 1, 1, 1, 1,
-0.3762316, 0.6567395, -0.6164363, 1, 1, 1, 1, 1,
-0.3761342, 0.3625618, -0.2822214, 1, 1, 1, 1, 1,
-0.3680977, 0.741326, 0.6814598, 1, 1, 1, 1, 1,
-0.3657026, 2.403512, -0.537585, 1, 1, 1, 1, 1,
-0.364886, -0.3144785, -2.356236, 1, 1, 1, 1, 1,
-0.3626339, -0.8273543, -3.746877, 1, 1, 1, 1, 1,
-0.362599, 0.4841312, 1.304323, 1, 1, 1, 1, 1,
-0.3548205, 0.686565, -1.434719, 0, 0, 1, 1, 1,
-0.3547224, -0.0439114, -2.763417, 1, 0, 0, 1, 1,
-0.3532382, -0.9287367, -1.723254, 1, 0, 0, 1, 1,
-0.35278, -1.991011, -4.704658, 1, 0, 0, 1, 1,
-0.351839, -1.25607, -2.21144, 1, 0, 0, 1, 1,
-0.350309, 0.7132423, -0.5993054, 1, 0, 0, 1, 1,
-0.3468, -0.00166111, -1.198476, 0, 0, 0, 1, 1,
-0.3449371, -0.3058697, -3.735362, 0, 0, 0, 1, 1,
-0.3448137, 0.3346584, -0.5157683, 0, 0, 0, 1, 1,
-0.3410361, -2.433913, -2.321916, 0, 0, 0, 1, 1,
-0.3406264, 0.9217201, 0.04638601, 0, 0, 0, 1, 1,
-0.3393617, -2.303094, -2.107458, 0, 0, 0, 1, 1,
-0.3337994, -0.1381612, -2.877126, 0, 0, 0, 1, 1,
-0.3327613, -0.6658103, -2.319689, 1, 1, 1, 1, 1,
-0.3316836, 0.3181793, -1.936105, 1, 1, 1, 1, 1,
-0.3315994, 1.219431, -1.738312, 1, 1, 1, 1, 1,
-0.3288576, 1.05651, -1.347848, 1, 1, 1, 1, 1,
-0.3280025, -1.297266, -3.549856, 1, 1, 1, 1, 1,
-0.3261241, 0.702076, 1.303264, 1, 1, 1, 1, 1,
-0.3251074, 0.4618544, 0.08004136, 1, 1, 1, 1, 1,
-0.3232756, 1.186731, -2.25179, 1, 1, 1, 1, 1,
-0.3177727, -0.7185267, -2.558735, 1, 1, 1, 1, 1,
-0.3165488, 0.8837088, -1.075316, 1, 1, 1, 1, 1,
-0.3162806, 0.5134317, -0.2017487, 1, 1, 1, 1, 1,
-0.3132418, 0.3735764, -2.055331, 1, 1, 1, 1, 1,
-0.3094339, -0.1464431, -2.599937, 1, 1, 1, 1, 1,
-0.3088993, 0.09875057, -0.1358763, 1, 1, 1, 1, 1,
-0.3044653, -0.00723499, -0.2121117, 1, 1, 1, 1, 1,
-0.3033277, 0.2039822, -1.805629, 0, 0, 1, 1, 1,
-0.2976365, -0.9051321, -4.017995, 1, 0, 0, 1, 1,
-0.2970285, 1.959644, -0.8704836, 1, 0, 0, 1, 1,
-0.2902631, -0.7590249, -1.936944, 1, 0, 0, 1, 1,
-0.2877501, 1.067416, 0.7281804, 1, 0, 0, 1, 1,
-0.2819778, 0.8564581, -0.9650254, 1, 0, 0, 1, 1,
-0.2796012, 0.1786623, -2.942851, 0, 0, 0, 1, 1,
-0.2786449, -3.328734, -2.623684, 0, 0, 0, 1, 1,
-0.2776832, 0.3308733, -0.92902, 0, 0, 0, 1, 1,
-0.2744738, 2.108963, -1.792068, 0, 0, 0, 1, 1,
-0.2741677, 0.2205115, -0.2024312, 0, 0, 0, 1, 1,
-0.2670679, 1.002151, 1.932663, 0, 0, 0, 1, 1,
-0.2669223, -0.4748481, -2.482037, 0, 0, 0, 1, 1,
-0.2645594, 0.2495981, -0.4874794, 1, 1, 1, 1, 1,
-0.2645549, 1.967458, -1.613128, 1, 1, 1, 1, 1,
-0.2641305, -0.8466932, -1.489355, 1, 1, 1, 1, 1,
-0.2641049, -2.139787, -2.135015, 1, 1, 1, 1, 1,
-0.2636605, -0.613562, -2.604626, 1, 1, 1, 1, 1,
-0.2629341, -1.506043, -2.426734, 1, 1, 1, 1, 1,
-0.2478775, -0.9514925, -1.509655, 1, 1, 1, 1, 1,
-0.2465008, 0.3172923, -0.8206255, 1, 1, 1, 1, 1,
-0.2456025, 1.737424, -0.7081925, 1, 1, 1, 1, 1,
-0.2453381, -0.7517062, -1.774408, 1, 1, 1, 1, 1,
-0.2452693, 1.481568, -1.280183, 1, 1, 1, 1, 1,
-0.2426209, 0.6140214, 1.084504, 1, 1, 1, 1, 1,
-0.2419181, -0.3885302, -2.198273, 1, 1, 1, 1, 1,
-0.2413439, -0.4087423, -3.308978, 1, 1, 1, 1, 1,
-0.2406212, 0.5978014, -0.3174669, 1, 1, 1, 1, 1,
-0.2396698, 0.03828638, -1.736337, 0, 0, 1, 1, 1,
-0.2367829, 0.9685619, -0.5809468, 1, 0, 0, 1, 1,
-0.2312115, -0.6776357, -2.899619, 1, 0, 0, 1, 1,
-0.2279519, 0.03565042, -0.9253942, 1, 0, 0, 1, 1,
-0.2275652, 0.8342912, -0.2136991, 1, 0, 0, 1, 1,
-0.2270344, -0.2341904, -1.889196, 1, 0, 0, 1, 1,
-0.2189135, 0.1563801, -1.297092, 0, 0, 0, 1, 1,
-0.2168785, 2.525348, -1.051567, 0, 0, 0, 1, 1,
-0.2125799, -1.075307, -3.529501, 0, 0, 0, 1, 1,
-0.211933, 0.2308168, -3.465429, 0, 0, 0, 1, 1,
-0.2076885, 0.07443884, -1.82705, 0, 0, 0, 1, 1,
-0.2052202, -2.143111, -4.936506, 0, 0, 0, 1, 1,
-0.2045238, 0.002366538, -1.415172, 0, 0, 0, 1, 1,
-0.2004217, 1.921678, 2.93311, 1, 1, 1, 1, 1,
-0.1982182, -1.608206, -1.331853, 1, 1, 1, 1, 1,
-0.1969556, -1.514304, -1.699352, 1, 1, 1, 1, 1,
-0.19589, -0.4743547, -1.575827, 1, 1, 1, 1, 1,
-0.1918879, -0.6157538, -2.758953, 1, 1, 1, 1, 1,
-0.1901656, 0.7245539, -1.092641, 1, 1, 1, 1, 1,
-0.1895944, 1.583219, 0.8277283, 1, 1, 1, 1, 1,
-0.1895484, -1.070965, -2.243849, 1, 1, 1, 1, 1,
-0.1893356, 0.9622167, 1.4911, 1, 1, 1, 1, 1,
-0.1769186, -0.6988584, -1.485166, 1, 1, 1, 1, 1,
-0.1761816, -0.08764527, -2.501121, 1, 1, 1, 1, 1,
-0.1748562, 0.9055873, -0.680384, 1, 1, 1, 1, 1,
-0.1726399, 0.5770041, -0.6233063, 1, 1, 1, 1, 1,
-0.1691825, 0.3478923, 1.24787, 1, 1, 1, 1, 1,
-0.1672026, 0.4135436, 0.9750497, 1, 1, 1, 1, 1,
-0.1625994, 1.134836, 1.559522, 0, 0, 1, 1, 1,
-0.1583208, -0.3491575, -3.691984, 1, 0, 0, 1, 1,
-0.1581253, 0.06370537, -1.088134, 1, 0, 0, 1, 1,
-0.153847, -0.5492553, -2.997668, 1, 0, 0, 1, 1,
-0.1528525, 0.0949397, -0.6919603, 1, 0, 0, 1, 1,
-0.1515504, -0.4446684, -4.206077, 1, 0, 0, 1, 1,
-0.1477704, -0.5813506, -2.608624, 0, 0, 0, 1, 1,
-0.1457351, -0.4890725, -3.247891, 0, 0, 0, 1, 1,
-0.1406011, 0.02176883, -2.030793, 0, 0, 0, 1, 1,
-0.1386343, 1.323361, 0.802592, 0, 0, 0, 1, 1,
-0.1384521, -1.677507, -2.088726, 0, 0, 0, 1, 1,
-0.1369184, 0.4724874, -1.213444, 0, 0, 0, 1, 1,
-0.1354723, 1.873485, 1.244779, 0, 0, 0, 1, 1,
-0.1340663, 0.9697617, 0.4993418, 1, 1, 1, 1, 1,
-0.1282297, -1.160528, -2.04791, 1, 1, 1, 1, 1,
-0.1254418, 0.6332541, -1.421805, 1, 1, 1, 1, 1,
-0.125007, 0.8761169, -0.2279765, 1, 1, 1, 1, 1,
-0.1222951, 1.107423, -0.2734584, 1, 1, 1, 1, 1,
-0.1221744, -0.0005872897, -1.713127, 1, 1, 1, 1, 1,
-0.1175942, -2.38713, -2.301339, 1, 1, 1, 1, 1,
-0.1093051, -0.1370451, -3.354068, 1, 1, 1, 1, 1,
-0.1092307, 1.000226, 0.4777635, 1, 1, 1, 1, 1,
-0.1085424, 0.9523092, -0.4597636, 1, 1, 1, 1, 1,
-0.1078703, -0.2381788, -2.277993, 1, 1, 1, 1, 1,
-0.1058583, 0.4342798, -1.141966, 1, 1, 1, 1, 1,
-0.1057781, 0.6829616, 1.142912, 1, 1, 1, 1, 1,
-0.1047952, -0.5488911, -3.01065, 1, 1, 1, 1, 1,
-0.102239, -0.7576657, -2.904622, 1, 1, 1, 1, 1,
-0.1009763, -0.1698375, -2.91576, 0, 0, 1, 1, 1,
-0.1007748, 0.2922993, 0.1550656, 1, 0, 0, 1, 1,
-0.1001469, 0.275987, -2.647201, 1, 0, 0, 1, 1,
-0.09769738, -0.02050068, -2.199218, 1, 0, 0, 1, 1,
-0.09481676, 0.3612501, 2.046658, 1, 0, 0, 1, 1,
-0.09155396, 1.980775, -0.925575, 1, 0, 0, 1, 1,
-0.08971551, 1.898059, 0.7389591, 0, 0, 0, 1, 1,
-0.0873666, -0.4439164, -2.480743, 0, 0, 0, 1, 1,
-0.08070577, 2.757263, 0.501863, 0, 0, 0, 1, 1,
-0.07984508, -0.05894223, -2.58963, 0, 0, 0, 1, 1,
-0.07601803, 0.1713806, -0.3950256, 0, 0, 0, 1, 1,
-0.06973011, 0.357949, 1.367285, 0, 0, 0, 1, 1,
-0.06700549, -1.202655, -2.113541, 0, 0, 0, 1, 1,
-0.06536455, 0.9053771, -1.058779, 1, 1, 1, 1, 1,
-0.06432576, 1.555395, -1.518557, 1, 1, 1, 1, 1,
-0.06142058, -0.8643104, -2.856947, 1, 1, 1, 1, 1,
-0.05961451, -1.400252, -2.455298, 1, 1, 1, 1, 1,
-0.0518234, 0.1946921, -0.9888052, 1, 1, 1, 1, 1,
-0.03791051, -0.2564288, -2.192484, 1, 1, 1, 1, 1,
-0.03181406, 0.2705889, -0.4538026, 1, 1, 1, 1, 1,
-0.0294405, -0.4892723, -2.771834, 1, 1, 1, 1, 1,
-0.02930118, -0.9330158, -2.00931, 1, 1, 1, 1, 1,
-0.02199707, 1.225725, -1.494717, 1, 1, 1, 1, 1,
-0.01895865, -0.02643207, -2.097756, 1, 1, 1, 1, 1,
-0.01769287, 0.02987808, 0.5654873, 1, 1, 1, 1, 1,
-0.007691056, -0.6993924, -2.344677, 1, 1, 1, 1, 1,
-0.003210098, -0.3680484, -3.441287, 1, 1, 1, 1, 1,
-0.00184442, 0.2657454, -0.06429879, 1, 1, 1, 1, 1,
-0.0005538007, 0.5551421, 1.134308, 0, 0, 1, 1, 1,
0.0101492, -1.278732, 1.911364, 1, 0, 0, 1, 1,
0.01443057, -0.9059066, 3.007398, 1, 0, 0, 1, 1,
0.01831939, -1.071192, 1.240238, 1, 0, 0, 1, 1,
0.01890883, 0.5953357, 1.413933, 1, 0, 0, 1, 1,
0.02452971, -0.5675609, 1.669948, 1, 0, 0, 1, 1,
0.02989571, -1.677411, 3.729368, 0, 0, 0, 1, 1,
0.03370981, 0.4572963, 0.5864911, 0, 0, 0, 1, 1,
0.0369646, 0.5160876, -0.9054734, 0, 0, 0, 1, 1,
0.04207393, 0.2330214, 0.7187483, 0, 0, 0, 1, 1,
0.04279532, 0.2254979, 1.328413, 0, 0, 0, 1, 1,
0.04414865, 0.827081, -0.4081376, 0, 0, 0, 1, 1,
0.04848773, -0.9170474, 2.174417, 0, 0, 0, 1, 1,
0.04850529, -1.44948, 2.765591, 1, 1, 1, 1, 1,
0.04977635, -0.2980483, 3.202454, 1, 1, 1, 1, 1,
0.04999768, -0.2937853, 2.488833, 1, 1, 1, 1, 1,
0.05908635, -0.1850289, 1.928525, 1, 1, 1, 1, 1,
0.05987082, -1.465651, 3.428967, 1, 1, 1, 1, 1,
0.06213914, 0.2512286, -0.4091507, 1, 1, 1, 1, 1,
0.06584389, -0.8655949, 3.297955, 1, 1, 1, 1, 1,
0.06991109, 1.203899, -1.050511, 1, 1, 1, 1, 1,
0.07160568, 1.2272, 0.9367966, 1, 1, 1, 1, 1,
0.07558129, -0.370283, 4.542231, 1, 1, 1, 1, 1,
0.08138702, -1.170028, 1.814895, 1, 1, 1, 1, 1,
0.08228056, -0.3816771, 4.725149, 1, 1, 1, 1, 1,
0.08443017, -0.4931585, 2.007768, 1, 1, 1, 1, 1,
0.08532059, -0.6524452, 1.453058, 1, 1, 1, 1, 1,
0.0879769, 0.06088086, 2.128721, 1, 1, 1, 1, 1,
0.08822487, -0.3909299, 2.547118, 0, 0, 1, 1, 1,
0.08961538, 0.7572918, 0.2484659, 1, 0, 0, 1, 1,
0.08972172, 0.2305672, 0.5951712, 1, 0, 0, 1, 1,
0.08996684, -1.425287, 2.829448, 1, 0, 0, 1, 1,
0.09419873, 0.8464965, -1.153705, 1, 0, 0, 1, 1,
0.0980697, 0.3791735, -0.1087753, 1, 0, 0, 1, 1,
0.09853949, 0.2844046, 0.8904034, 0, 0, 0, 1, 1,
0.09990172, -1.570589, 2.716301, 0, 0, 0, 1, 1,
0.10218, 1.423751, 0.1457978, 0, 0, 0, 1, 1,
0.1054621, 0.31776, 0.5286713, 0, 0, 0, 1, 1,
0.1062099, 0.4658938, 1.318548, 0, 0, 0, 1, 1,
0.1100338, -0.6820245, 3.482145, 0, 0, 0, 1, 1,
0.1128935, -0.4772657, 2.907136, 0, 0, 0, 1, 1,
0.1179434, -0.2991867, 2.912793, 1, 1, 1, 1, 1,
0.1183074, 1.516107, -0.5072308, 1, 1, 1, 1, 1,
0.1265924, 1.372105, -1.787787, 1, 1, 1, 1, 1,
0.127874, -0.4222664, 2.404712, 1, 1, 1, 1, 1,
0.1320336, 0.2303807, 0.1846266, 1, 1, 1, 1, 1,
0.1376728, 0.3367636, 1.213173, 1, 1, 1, 1, 1,
0.1490207, -0.08953983, 0.5091969, 1, 1, 1, 1, 1,
0.152425, -0.9113808, 2.501628, 1, 1, 1, 1, 1,
0.1550837, 0.6221863, -0.8190849, 1, 1, 1, 1, 1,
0.1570791, -0.7297048, 2.646628, 1, 1, 1, 1, 1,
0.1576228, -0.3037175, 2.21504, 1, 1, 1, 1, 1,
0.1590284, 0.02431159, -1.371009, 1, 1, 1, 1, 1,
0.1615735, -1.406911, 3.029633, 1, 1, 1, 1, 1,
0.1623528, 0.2010072, 1.427985, 1, 1, 1, 1, 1,
0.1641521, 0.1119658, 0.5140008, 1, 1, 1, 1, 1,
0.1653057, 0.2669387, -0.2994007, 0, 0, 1, 1, 1,
0.1793376, 0.9464839, -1.349494, 1, 0, 0, 1, 1,
0.1797607, 0.6489212, 1.745547, 1, 0, 0, 1, 1,
0.1834671, 1.389292, 0.4743211, 1, 0, 0, 1, 1,
0.189282, 1.632268, 2.021172, 1, 0, 0, 1, 1,
0.1907084, 0.2813533, -1.015504, 1, 0, 0, 1, 1,
0.1908263, -0.8061553, 3.017943, 0, 0, 0, 1, 1,
0.1909887, -0.2838027, 2.503241, 0, 0, 0, 1, 1,
0.1935631, -0.1816064, 3.076292, 0, 0, 0, 1, 1,
0.1949779, -0.08455215, 2.488973, 0, 0, 0, 1, 1,
0.2016536, -1.128247, 3.199418, 0, 0, 0, 1, 1,
0.2032313, -0.4902934, 2.429343, 0, 0, 0, 1, 1,
0.2063852, 1.00781, -1.383316, 0, 0, 0, 1, 1,
0.2083642, -0.5051942, 3.223622, 1, 1, 1, 1, 1,
0.20854, 1.026636, -0.6598139, 1, 1, 1, 1, 1,
0.2114927, 0.3440627, 0.5667412, 1, 1, 1, 1, 1,
0.2165803, -1.351299, 2.32928, 1, 1, 1, 1, 1,
0.2177663, 0.6902535, -0.953276, 1, 1, 1, 1, 1,
0.2182806, 1.218174, 0.6725844, 1, 1, 1, 1, 1,
0.2186332, 0.4117801, -0.3840012, 1, 1, 1, 1, 1,
0.2186554, 0.9016688, 0.4337929, 1, 1, 1, 1, 1,
0.2197354, -0.5644943, 1.566311, 1, 1, 1, 1, 1,
0.220881, 0.02380418, 1.826033, 1, 1, 1, 1, 1,
0.2217246, 0.03681441, 0.6489161, 1, 1, 1, 1, 1,
0.2245464, -0.7038585, 1.25464, 1, 1, 1, 1, 1,
0.2264653, -0.6630188, 1.79743, 1, 1, 1, 1, 1,
0.2266586, -0.2554537, 2.475214, 1, 1, 1, 1, 1,
0.2286632, 0.89265, -0.9827875, 1, 1, 1, 1, 1,
0.2315635, -0.9186218, 3.895815, 0, 0, 1, 1, 1,
0.2315782, -1.017049, 2.990669, 1, 0, 0, 1, 1,
0.2392858, -0.799647, 2.624048, 1, 0, 0, 1, 1,
0.241324, -0.5550118, 2.348813, 1, 0, 0, 1, 1,
0.2465105, 0.07506137, 1.754932, 1, 0, 0, 1, 1,
0.2503677, 1.162625, 1.471731, 1, 0, 0, 1, 1,
0.253084, -0.8891906, 4.47755, 0, 0, 0, 1, 1,
0.2608936, -0.395721, 2.549675, 0, 0, 0, 1, 1,
0.2618074, 1.348307, -0.9858934, 0, 0, 0, 1, 1,
0.2642346, 0.5447801, 0.9109355, 0, 0, 0, 1, 1,
0.267061, -0.6561378, 0.6983334, 0, 0, 0, 1, 1,
0.2677172, 0.247291, 0.4532097, 0, 0, 0, 1, 1,
0.2692561, -1.597625, 2.960757, 0, 0, 0, 1, 1,
0.2704358, -0.6306738, 3.242861, 1, 1, 1, 1, 1,
0.2704686, -0.9924337, 2.107274, 1, 1, 1, 1, 1,
0.2729605, -0.6571757, 3.062814, 1, 1, 1, 1, 1,
0.2731251, 0.6709755, 0.6472324, 1, 1, 1, 1, 1,
0.2748216, -1.25005, 4.313316, 1, 1, 1, 1, 1,
0.2774797, 0.09620009, 0.758034, 1, 1, 1, 1, 1,
0.2815843, -0.8343452, 2.412687, 1, 1, 1, 1, 1,
0.2883372, 0.5912039, 2.590205, 1, 1, 1, 1, 1,
0.289478, -0.8766548, 4.404606, 1, 1, 1, 1, 1,
0.2903862, 1.496274, -0.5613756, 1, 1, 1, 1, 1,
0.2912286, 0.4478231, -0.3528338, 1, 1, 1, 1, 1,
0.296656, -0.9169286, 3.160322, 1, 1, 1, 1, 1,
0.2973017, -0.6045285, 5.57182, 1, 1, 1, 1, 1,
0.3016848, 0.5723553, 0.04112247, 1, 1, 1, 1, 1,
0.3031923, -0.8368891, 2.074217, 1, 1, 1, 1, 1,
0.3053756, -2.314306, 4.127451, 0, 0, 1, 1, 1,
0.3070118, -1.016094, 1.286373, 1, 0, 0, 1, 1,
0.307117, 0.5552925, 0.9386168, 1, 0, 0, 1, 1,
0.312814, 0.4351276, 0.04780432, 1, 0, 0, 1, 1,
0.3145236, 0.8141497, -0.9410728, 1, 0, 0, 1, 1,
0.3204435, -0.4439197, 1.53322, 1, 0, 0, 1, 1,
0.3237134, -0.2237432, 4.275531, 0, 0, 0, 1, 1,
0.3271666, 0.9779801, 0.5326052, 0, 0, 0, 1, 1,
0.3277923, -0.3250125, 2.347245, 0, 0, 0, 1, 1,
0.3285784, 1.147414, 0.9175267, 0, 0, 0, 1, 1,
0.3319452, 0.6700995, -0.03770155, 0, 0, 0, 1, 1,
0.3322164, 0.8608119, 0.2174882, 0, 0, 0, 1, 1,
0.3370488, -0.07652622, 1.44537, 0, 0, 0, 1, 1,
0.3377513, 0.3847365, 1.34518, 1, 1, 1, 1, 1,
0.3381342, -0.4202226, 2.285286, 1, 1, 1, 1, 1,
0.3385878, -1.357241, 5.330812, 1, 1, 1, 1, 1,
0.3412328, 0.3500593, 0.5059422, 1, 1, 1, 1, 1,
0.3425183, -1.912821, 2.333063, 1, 1, 1, 1, 1,
0.3437534, 0.2504845, 2.028449, 1, 1, 1, 1, 1,
0.3438378, -0.4897925, 3.931015, 1, 1, 1, 1, 1,
0.3439848, -0.9219756, 3.596412, 1, 1, 1, 1, 1,
0.3440842, 1.22471, 0.7780472, 1, 1, 1, 1, 1,
0.3468322, -0.5841421, 3.233778, 1, 1, 1, 1, 1,
0.3484002, -0.09718595, 1.867763, 1, 1, 1, 1, 1,
0.3498784, 0.9879639, 0.4909118, 1, 1, 1, 1, 1,
0.3533631, -0.9059654, 0.3161288, 1, 1, 1, 1, 1,
0.3538489, -0.3730883, 2.233831, 1, 1, 1, 1, 1,
0.3563398, -0.2524416, 2.41713, 1, 1, 1, 1, 1,
0.3586561, -1.302789, 3.799465, 0, 0, 1, 1, 1,
0.3593174, -0.3194776, 3.445276, 1, 0, 0, 1, 1,
0.3639937, -1.217315, 2.494433, 1, 0, 0, 1, 1,
0.3652983, -0.4267499, 3.413204, 1, 0, 0, 1, 1,
0.3696023, 1.25361, 0.2210274, 1, 0, 0, 1, 1,
0.370466, -0.2821855, 2.082606, 1, 0, 0, 1, 1,
0.3711519, 1.062536, 1.303723, 0, 0, 0, 1, 1,
0.3721029, -0.07599121, 1.481111, 0, 0, 0, 1, 1,
0.3736382, 0.9144092, 1.665888, 0, 0, 0, 1, 1,
0.378426, 0.2385404, 1.201743, 0, 0, 0, 1, 1,
0.3792627, 1.314893, 1.291031, 0, 0, 0, 1, 1,
0.3796167, 0.889864, -0.2644983, 0, 0, 0, 1, 1,
0.3836027, -0.5328435, 2.840774, 0, 0, 0, 1, 1,
0.3911197, -0.2724483, 3.610016, 1, 1, 1, 1, 1,
0.3980742, -0.9742464, 2.203384, 1, 1, 1, 1, 1,
0.3991119, 0.5886524, 1.075136, 1, 1, 1, 1, 1,
0.4031429, 0.4978582, 0.3803756, 1, 1, 1, 1, 1,
0.4124672, -0.43649, 1.009036, 1, 1, 1, 1, 1,
0.4151083, -0.2901414, 1.496421, 1, 1, 1, 1, 1,
0.4153118, -0.1332651, 0.5931391, 1, 1, 1, 1, 1,
0.4155546, 0.5308627, 0.6353425, 1, 1, 1, 1, 1,
0.4169597, -1.054672, 1.176273, 1, 1, 1, 1, 1,
0.4194829, 0.07073141, 1.137637, 1, 1, 1, 1, 1,
0.4218359, -0.2284078, 2.985851, 1, 1, 1, 1, 1,
0.4240641, -1.936201, 2.852603, 1, 1, 1, 1, 1,
0.4260529, 0.3034945, 1.899572, 1, 1, 1, 1, 1,
0.4298893, -0.01183698, 2.239337, 1, 1, 1, 1, 1,
0.4318903, -1.303309, 2.667627, 1, 1, 1, 1, 1,
0.4324383, 0.3580832, 1.125437, 0, 0, 1, 1, 1,
0.4360376, -1.001402, 1.024541, 1, 0, 0, 1, 1,
0.4368442, 1.306125, 1.883954, 1, 0, 0, 1, 1,
0.4390903, -1.57932, 2.684685, 1, 0, 0, 1, 1,
0.4411941, 0.9950702, 1.598655, 1, 0, 0, 1, 1,
0.441757, -0.1459282, 0.302626, 1, 0, 0, 1, 1,
0.4423688, 0.619539, 1.487274, 0, 0, 0, 1, 1,
0.4429905, 1.424975, 1.273133, 0, 0, 0, 1, 1,
0.4477722, -0.450096, 1.472605, 0, 0, 0, 1, 1,
0.4536525, 1.986299, 1.270241, 0, 0, 0, 1, 1,
0.4587618, -0.6574798, 1.708414, 0, 0, 0, 1, 1,
0.4602033, -0.5627186, 2.237738, 0, 0, 0, 1, 1,
0.4602247, -0.08839641, 2.722025, 0, 0, 0, 1, 1,
0.462866, 0.7308108, 1.09908, 1, 1, 1, 1, 1,
0.4674579, 0.8176767, 1.043694, 1, 1, 1, 1, 1,
0.4681011, 0.6623326, 0.5063429, 1, 1, 1, 1, 1,
0.4691926, -1.313764, 2.357522, 1, 1, 1, 1, 1,
0.4698499, -0.4211942, 3.898502, 1, 1, 1, 1, 1,
0.4724935, 0.9647052, -1.393398, 1, 1, 1, 1, 1,
0.4744026, -0.2647077, 3.733329, 1, 1, 1, 1, 1,
0.4822547, -0.3932814, 1.774985, 1, 1, 1, 1, 1,
0.4829915, -0.2556486, 3.275313, 1, 1, 1, 1, 1,
0.4894352, -0.01758754, 2.291945, 1, 1, 1, 1, 1,
0.4902951, 1.175675, 0.8367627, 1, 1, 1, 1, 1,
0.4985554, -1.803499, 3.877609, 1, 1, 1, 1, 1,
0.5012968, 1.095206, 2.574513, 1, 1, 1, 1, 1,
0.5018727, 0.5371297, -1.564083, 1, 1, 1, 1, 1,
0.5067752, -0.2836713, 2.225084, 1, 1, 1, 1, 1,
0.506966, -1.743485, 3.172303, 0, 0, 1, 1, 1,
0.5070674, 1.668596, -0.2111985, 1, 0, 0, 1, 1,
0.5081845, 1.211164, -1.342289, 1, 0, 0, 1, 1,
0.5090725, -0.1701121, 2.691587, 1, 0, 0, 1, 1,
0.5160389, 1.099323, -1.198411, 1, 0, 0, 1, 1,
0.5189506, 1.409827, 1.705607, 1, 0, 0, 1, 1,
0.519986, 0.5898037, 2.52743, 0, 0, 0, 1, 1,
0.523959, 1.422094, 0.9255766, 0, 0, 0, 1, 1,
0.5257122, -1.367711, 4.542599, 0, 0, 0, 1, 1,
0.5273513, 0.1075129, -0.0163447, 0, 0, 0, 1, 1,
0.5283219, 0.6491516, 0.6890054, 0, 0, 0, 1, 1,
0.5295603, -1.736985, 2.122037, 0, 0, 0, 1, 1,
0.5316576, -0.7009106, 4.728423, 0, 0, 0, 1, 1,
0.5338314, -0.2451295, 3.561575, 1, 1, 1, 1, 1,
0.5354518, 1.135588, 1.19331, 1, 1, 1, 1, 1,
0.5363633, -0.5046447, 2.479733, 1, 1, 1, 1, 1,
0.5367936, 1.166604, 2.24639, 1, 1, 1, 1, 1,
0.5387775, 0.5266663, -0.007894528, 1, 1, 1, 1, 1,
0.5400209, 0.5562136, -0.709282, 1, 1, 1, 1, 1,
0.5401518, -0.114002, 0.9764197, 1, 1, 1, 1, 1,
0.5405136, 0.3729063, 1.15654, 1, 1, 1, 1, 1,
0.5410549, 0.2518782, -0.6183141, 1, 1, 1, 1, 1,
0.5478391, 0.2754479, 0.2250952, 1, 1, 1, 1, 1,
0.5493239, -0.160133, 1.146308, 1, 1, 1, 1, 1,
0.5511953, 0.1066608, 2.041435, 1, 1, 1, 1, 1,
0.5537705, 2.413513, 0.5780755, 1, 1, 1, 1, 1,
0.5581811, -0.4130021, 1.815512, 1, 1, 1, 1, 1,
0.5593995, -1.179629, 2.72467, 1, 1, 1, 1, 1,
0.56122, 0.07877804, 0.3067411, 0, 0, 1, 1, 1,
0.5621647, 0.6393418, 1.174098, 1, 0, 0, 1, 1,
0.5628344, 0.3421685, 1.380569, 1, 0, 0, 1, 1,
0.5721366, 1.571833, 1.265518, 1, 0, 0, 1, 1,
0.5730586, 0.6094419, 0.5142652, 1, 0, 0, 1, 1,
0.5734405, 1.287469, 2.814768, 1, 0, 0, 1, 1,
0.5750206, 0.01077143, 1.364475, 0, 0, 0, 1, 1,
0.5754704, 1.051301, 1.104954, 0, 0, 0, 1, 1,
0.5843518, 1.485352, 0.04765169, 0, 0, 0, 1, 1,
0.5851782, -0.2280619, 2.023935, 0, 0, 0, 1, 1,
0.5885232, -0.5030366, 2.714585, 0, 0, 0, 1, 1,
0.5919309, -0.9422162, 3.330887, 0, 0, 0, 1, 1,
0.5937468, -1.239085, 4.094695, 0, 0, 0, 1, 1,
0.6033337, 0.7991799, 0.05627443, 1, 1, 1, 1, 1,
0.6036384, -1.414224, 1.781193, 1, 1, 1, 1, 1,
0.6042588, 1.109002, 1.184447, 1, 1, 1, 1, 1,
0.6049354, 0.05076296, 1.146635, 1, 1, 1, 1, 1,
0.6105597, -0.4965384, 2.547258, 1, 1, 1, 1, 1,
0.6106929, -0.07422868, 0.9369129, 1, 1, 1, 1, 1,
0.6118632, -0.3101066, 4.713071, 1, 1, 1, 1, 1,
0.6127691, 0.9373767, 1.039952, 1, 1, 1, 1, 1,
0.6158797, -0.9815647, 2.116586, 1, 1, 1, 1, 1,
0.6166523, -2.016755, 2.459444, 1, 1, 1, 1, 1,
0.6210328, -0.02019399, 2.959728, 1, 1, 1, 1, 1,
0.6247662, 0.1687645, 1.77779, 1, 1, 1, 1, 1,
0.6270148, 0.4781132, 1.257904, 1, 1, 1, 1, 1,
0.6284932, 0.9959837, 2.134146, 1, 1, 1, 1, 1,
0.6355034, 0.1794342, 0.8336061, 1, 1, 1, 1, 1,
0.6372609, -0.7685465, 2.512398, 0, 0, 1, 1, 1,
0.6424853, -0.8308368, 2.950658, 1, 0, 0, 1, 1,
0.6490545, -0.9309196, 2.336274, 1, 0, 0, 1, 1,
0.6507504, -0.1344834, 3.498302, 1, 0, 0, 1, 1,
0.6516785, 0.6094388, 0.09553152, 1, 0, 0, 1, 1,
0.6533164, 1.419448, 0.2072915, 1, 0, 0, 1, 1,
0.6610578, 0.01906844, 1.193433, 0, 0, 0, 1, 1,
0.661425, 0.2949648, 1.644498, 0, 0, 0, 1, 1,
0.6629241, 1.164322, 0.06555466, 0, 0, 0, 1, 1,
0.6647273, -1.884525, 4.599586, 0, 0, 0, 1, 1,
0.6703868, -0.7014642, 3.970472, 0, 0, 0, 1, 1,
0.6732506, 0.3343377, 1.684968, 0, 0, 0, 1, 1,
0.6759765, 0.3332874, 0.6337447, 0, 0, 0, 1, 1,
0.6769894, -0.9665951, 3.640108, 1, 1, 1, 1, 1,
0.6775777, -1.652325, 3.068233, 1, 1, 1, 1, 1,
0.6793466, 1.29438, -0.2749384, 1, 1, 1, 1, 1,
0.6812118, 0.9662582, 1.001674, 1, 1, 1, 1, 1,
0.6861625, -0.4280017, 1.093505, 1, 1, 1, 1, 1,
0.6877013, -0.02822984, 1.292933, 1, 1, 1, 1, 1,
0.6951875, 1.759242, 0.7033025, 1, 1, 1, 1, 1,
0.6973606, -1.553505, 2.860446, 1, 1, 1, 1, 1,
0.6977243, 1.259182, -1.154144, 1, 1, 1, 1, 1,
0.7089153, -0.3652421, 2.32416, 1, 1, 1, 1, 1,
0.7098603, 0.09437027, 2.081634, 1, 1, 1, 1, 1,
0.7136242, 0.9630297, 1.477685, 1, 1, 1, 1, 1,
0.714968, 1.07289, 0.4125318, 1, 1, 1, 1, 1,
0.715773, -0.08893397, 0.6463998, 1, 1, 1, 1, 1,
0.7170007, 1.320231, 0.6441061, 1, 1, 1, 1, 1,
0.7170259, 0.1763496, 1.408379, 0, 0, 1, 1, 1,
0.7186036, 0.6689839, 0.3760548, 1, 0, 0, 1, 1,
0.7211348, -0.07422513, 2.474856, 1, 0, 0, 1, 1,
0.7216026, -0.7446221, 2.555718, 1, 0, 0, 1, 1,
0.7268591, -2.060988, 1.363348, 1, 0, 0, 1, 1,
0.7341335, 0.7385162, -0.02776613, 1, 0, 0, 1, 1,
0.7342535, 0.7191188, 1.699221, 0, 0, 0, 1, 1,
0.736201, 0.8442302, 0.6887447, 0, 0, 0, 1, 1,
0.7365471, -0.4620692, 2.79307, 0, 0, 0, 1, 1,
0.7373976, -1.455079, 2.959403, 0, 0, 0, 1, 1,
0.7429909, -0.2802305, 1.446259, 0, 0, 0, 1, 1,
0.7474074, 0.2025455, 0.8199666, 0, 0, 0, 1, 1,
0.7576786, 0.1904973, 1.989677, 0, 0, 0, 1, 1,
0.7599254, 0.7556283, 2.256272, 1, 1, 1, 1, 1,
0.7608074, 0.8305162, 1.826558, 1, 1, 1, 1, 1,
0.7634112, 1.559656, -0.07426801, 1, 1, 1, 1, 1,
0.7716125, 0.6705086, 2.551136, 1, 1, 1, 1, 1,
0.7724793, 1.261623, 1.528711, 1, 1, 1, 1, 1,
0.7760068, -1.732243, 3.202753, 1, 1, 1, 1, 1,
0.7781613, -0.6590249, 2.124862, 1, 1, 1, 1, 1,
0.7803376, 2.130751, 0.8842893, 1, 1, 1, 1, 1,
0.780834, 2.103229, -0.02476119, 1, 1, 1, 1, 1,
0.7829929, -2.021285, 3.861892, 1, 1, 1, 1, 1,
0.7842134, 0.3236748, -1.957457, 1, 1, 1, 1, 1,
0.7884941, -2.544745, 2.873768, 1, 1, 1, 1, 1,
0.7929463, -0.7226642, 3.818526, 1, 1, 1, 1, 1,
0.7935707, -1.748308, 1.863319, 1, 1, 1, 1, 1,
0.795635, 0.4166041, 1.167471, 1, 1, 1, 1, 1,
0.8059151, 1.698213, 0.631281, 0, 0, 1, 1, 1,
0.8093428, -0.8276911, 1.28643, 1, 0, 0, 1, 1,
0.8137359, 2.07705, -0.5129943, 1, 0, 0, 1, 1,
0.8151599, 1.061929, 0.3399058, 1, 0, 0, 1, 1,
0.8225743, 1.629758, -0.1791805, 1, 0, 0, 1, 1,
0.8225756, 0.4852773, 0.01085709, 1, 0, 0, 1, 1,
0.8232585, 0.38396, 0.4214502, 0, 0, 0, 1, 1,
0.8298979, 1.784604, -0.04402281, 0, 0, 0, 1, 1,
0.8316867, -0.5075477, 3.335967, 0, 0, 0, 1, 1,
0.8342819, -2.868997, 2.905285, 0, 0, 0, 1, 1,
0.8373696, -1.625096, 3.617432, 0, 0, 0, 1, 1,
0.8409993, 0.578096, 3.370497, 0, 0, 0, 1, 1,
0.8412399, 0.2056895, 2.429218, 0, 0, 0, 1, 1,
0.8481532, -0.1139938, 0.6223394, 1, 1, 1, 1, 1,
0.8595225, 1.99038, 0.7085878, 1, 1, 1, 1, 1,
0.8674601, 0.4615048, 1.58739, 1, 1, 1, 1, 1,
0.8908834, 1.587227, 0.6554801, 1, 1, 1, 1, 1,
0.904499, 0.7987412, 0.5538229, 1, 1, 1, 1, 1,
0.905682, -1.43702, 2.85801, 1, 1, 1, 1, 1,
0.9107763, -0.5199274, 2.719316, 1, 1, 1, 1, 1,
0.9156201, -1.659454, 1.088586, 1, 1, 1, 1, 1,
0.9191383, 0.2858298, 2.128834, 1, 1, 1, 1, 1,
0.9195751, 2.351045, -0.1925758, 1, 1, 1, 1, 1,
0.9211795, -0.9265555, 0.6645484, 1, 1, 1, 1, 1,
0.9342548, -0.9065205, 1.469314, 1, 1, 1, 1, 1,
0.9343101, -0.8288969, 2.226961, 1, 1, 1, 1, 1,
0.9448503, 1.208034, 0.3234081, 1, 1, 1, 1, 1,
0.9522632, 0.5100427, -2.700539, 1, 1, 1, 1, 1,
0.9525728, -0.7466753, 2.484313, 0, 0, 1, 1, 1,
0.9552417, 1.230966, -0.3720255, 1, 0, 0, 1, 1,
0.9593979, -0.7555928, 1.77836, 1, 0, 0, 1, 1,
0.959542, -0.2813096, 2.149861, 1, 0, 0, 1, 1,
0.9607233, 0.2004595, 1.45144, 1, 0, 0, 1, 1,
0.9672382, 0.9646367, 1.042025, 1, 0, 0, 1, 1,
0.9771886, 0.2986099, 1.950229, 0, 0, 0, 1, 1,
0.9809315, 0.711392, 0.9978383, 0, 0, 0, 1, 1,
0.9927112, -0.6697548, 3.032666, 0, 0, 0, 1, 1,
0.9981666, 0.6680683, 2.633166, 0, 0, 0, 1, 1,
0.9996002, 0.3688848, 1.405483, 0, 0, 0, 1, 1,
1.000209, 0.8322315, 1.573445, 0, 0, 0, 1, 1,
1.002255, 0.871136, 0.4081544, 0, 0, 0, 1, 1,
1.003299, -0.243647, 2.684988, 1, 1, 1, 1, 1,
1.010049, -0.5211202, 3.025681, 1, 1, 1, 1, 1,
1.016134, -0.6317148, 4.161422, 1, 1, 1, 1, 1,
1.020678, 0.2082851, 2.744176, 1, 1, 1, 1, 1,
1.024083, 0.4222045, 1.726034, 1, 1, 1, 1, 1,
1.026683, -0.2451667, 3.473269, 1, 1, 1, 1, 1,
1.028926, -1.332296, 3.144554, 1, 1, 1, 1, 1,
1.035694, 0.1676578, 1.201895, 1, 1, 1, 1, 1,
1.035988, -0.2375614, 1.360756, 1, 1, 1, 1, 1,
1.036654, -0.7322775, 3.057366, 1, 1, 1, 1, 1,
1.036699, 0.568518, 0.03276078, 1, 1, 1, 1, 1,
1.03861, 1.858693, 1.272168, 1, 1, 1, 1, 1,
1.03996, 0.9175338, 0.4880237, 1, 1, 1, 1, 1,
1.043136, -0.1474439, 2.405846, 1, 1, 1, 1, 1,
1.044485, 0.4086666, 0.6702123, 1, 1, 1, 1, 1,
1.046191, 1.50029, 2.414186, 0, 0, 1, 1, 1,
1.05196, 1.883413, 1.13721, 1, 0, 0, 1, 1,
1.05497, -0.8374025, 3.359108, 1, 0, 0, 1, 1,
1.059115, 0.5286856, 0.9221683, 1, 0, 0, 1, 1,
1.071026, 0.518595, -0.6497252, 1, 0, 0, 1, 1,
1.072465, -0.4950014, 0.8924843, 1, 0, 0, 1, 1,
1.074354, -1.94417, 2.219229, 0, 0, 0, 1, 1,
1.089016, 0.7942908, 0.5523187, 0, 0, 0, 1, 1,
1.090013, -0.389171, 2.131371, 0, 0, 0, 1, 1,
1.092256, 0.9160298, 1.996815, 0, 0, 0, 1, 1,
1.105922, 0.7188511, 0.009106757, 0, 0, 0, 1, 1,
1.10664, -0.446325, 1.619334, 0, 0, 0, 1, 1,
1.111083, 2.133504, 0.4387082, 0, 0, 0, 1, 1,
1.124321, 0.2756088, -0.4718416, 1, 1, 1, 1, 1,
1.137779, -1.409899, 3.316179, 1, 1, 1, 1, 1,
1.143351, -0.9199839, 3.461506, 1, 1, 1, 1, 1,
1.149454, -1.05682, 2.263171, 1, 1, 1, 1, 1,
1.152244, 0.3936262, 3.193159, 1, 1, 1, 1, 1,
1.162494, -0.8235342, 3.249045, 1, 1, 1, 1, 1,
1.164995, 0.7870481, 1.305207, 1, 1, 1, 1, 1,
1.172093, 0.1361055, 2.083111, 1, 1, 1, 1, 1,
1.176007, -1.445651, 1.475977, 1, 1, 1, 1, 1,
1.17711, -0.2581288, 2.196333, 1, 1, 1, 1, 1,
1.189825, -0.5134837, 1.960256, 1, 1, 1, 1, 1,
1.206589, -1.340181, 2.5072, 1, 1, 1, 1, 1,
1.20726, -1.405878, 2.443557, 1, 1, 1, 1, 1,
1.212994, 1.20391, 0.4859282, 1, 1, 1, 1, 1,
1.230075, 3.075508, 0.5876115, 1, 1, 1, 1, 1,
1.231317, -0.4402239, 1.606383, 0, 0, 1, 1, 1,
1.232013, 0.01259904, 2.405068, 1, 0, 0, 1, 1,
1.233326, -0.9663449, 1.735974, 1, 0, 0, 1, 1,
1.240175, -0.1889638, 1.066529, 1, 0, 0, 1, 1,
1.245863, 0.8654386, 0.1593547, 1, 0, 0, 1, 1,
1.246505, 0.7012788, 2.815556, 1, 0, 0, 1, 1,
1.247954, -0.6537686, 2.01626, 0, 0, 0, 1, 1,
1.248358, -0.3526908, 1.790393, 0, 0, 0, 1, 1,
1.25026, -0.3974573, 1.633472, 0, 0, 0, 1, 1,
1.257478, -0.7037739, 1.088245, 0, 0, 0, 1, 1,
1.25869, -0.8751566, 2.515064, 0, 0, 0, 1, 1,
1.272268, 0.0998483, 2.703003, 0, 0, 0, 1, 1,
1.282418, -1.288557, 1.533233, 0, 0, 0, 1, 1,
1.287791, -0.5021734, 1.486766, 1, 1, 1, 1, 1,
1.290951, 0.8239917, 0.7205732, 1, 1, 1, 1, 1,
1.294687, 0.9813021, 0.9785394, 1, 1, 1, 1, 1,
1.297925, 1.854334, -0.3225257, 1, 1, 1, 1, 1,
1.300666, 0.4078372, 0.7182869, 1, 1, 1, 1, 1,
1.307313, 1.431934, -0.2332181, 1, 1, 1, 1, 1,
1.309487, -0.3073899, 3.666617, 1, 1, 1, 1, 1,
1.319597, 1.561413, 1.497549, 1, 1, 1, 1, 1,
1.329654, -0.4267265, 0.4915975, 1, 1, 1, 1, 1,
1.331759, 0.1663988, -0.4315361, 1, 1, 1, 1, 1,
1.339329, -0.299371, 4.113803, 1, 1, 1, 1, 1,
1.340819, 1.164461, -0.6126764, 1, 1, 1, 1, 1,
1.344524, -1.108841, 3.853332, 1, 1, 1, 1, 1,
1.351975, -0.08039344, 1.71077, 1, 1, 1, 1, 1,
1.35481, -0.4359333, 3.064494, 1, 1, 1, 1, 1,
1.359433, -1.306082, 2.423054, 0, 0, 1, 1, 1,
1.364501, 0.4852171, 2.119254, 1, 0, 0, 1, 1,
1.377913, -1.05733, 2.217004, 1, 0, 0, 1, 1,
1.382538, 0.795446, 1.109782, 1, 0, 0, 1, 1,
1.383696, -0.03102129, 2.091, 1, 0, 0, 1, 1,
1.393668, 0.08486814, 1.196646, 1, 0, 0, 1, 1,
1.394718, 1.255741, -0.2693625, 0, 0, 0, 1, 1,
1.411841, -0.6009706, 2.75026, 0, 0, 0, 1, 1,
1.415572, -1.167824, 3.074503, 0, 0, 0, 1, 1,
1.42619, 0.6867771, 1.625194, 0, 0, 0, 1, 1,
1.430829, 0.456431, 0.1767311, 0, 0, 0, 1, 1,
1.436375, 0.3820627, 1.494132, 0, 0, 0, 1, 1,
1.439169, -0.2958463, 2.589779, 0, 0, 0, 1, 1,
1.445779, -1.15302, 1.966187, 1, 1, 1, 1, 1,
1.447865, 0.3629727, 1.904508, 1, 1, 1, 1, 1,
1.452235, 0.4920451, 1.823437, 1, 1, 1, 1, 1,
1.471764, -0.4778232, 1.172177, 1, 1, 1, 1, 1,
1.472486, 0.2607449, 3.273611, 1, 1, 1, 1, 1,
1.473146, -0.9059261, 3.920768, 1, 1, 1, 1, 1,
1.473319, -0.08783562, 3.537748, 1, 1, 1, 1, 1,
1.487971, -0.06767808, 1.440712, 1, 1, 1, 1, 1,
1.502358, 0.3224504, 0.6895346, 1, 1, 1, 1, 1,
1.506742, -1.33118, 3.631395, 1, 1, 1, 1, 1,
1.545593, -1.632349, 2.189873, 1, 1, 1, 1, 1,
1.547238, 0.05892755, 1.845717, 1, 1, 1, 1, 1,
1.555884, 1.457804, 1.304901, 1, 1, 1, 1, 1,
1.576677, -0.3685041, 2.032695, 1, 1, 1, 1, 1,
1.590562, 0.003008994, 2.50682, 1, 1, 1, 1, 1,
1.597522, 1.060506, 0.5955195, 0, 0, 1, 1, 1,
1.599975, 1.040997, 0.5658237, 1, 0, 0, 1, 1,
1.63387, -0.3343286, 2.341375, 1, 0, 0, 1, 1,
1.642902, 0.9162347, 0.2739089, 1, 0, 0, 1, 1,
1.643208, 0.3207674, -0.06067614, 1, 0, 0, 1, 1,
1.668883, 1.283141, -0.2178012, 1, 0, 0, 1, 1,
1.677969, 0.359948, 1.295711, 0, 0, 0, 1, 1,
1.69917, 0.3023508, 1.116698, 0, 0, 0, 1, 1,
1.700138, 1.265176, 0.4228778, 0, 0, 0, 1, 1,
1.721271, 0.7851503, 3.065392, 0, 0, 0, 1, 1,
1.732891, -0.471618, 1.784953, 0, 0, 0, 1, 1,
1.773637, 1.011679, 0.6321511, 0, 0, 0, 1, 1,
1.828398, -0.6107456, 1.950735, 0, 0, 0, 1, 1,
1.843516, 0.5733098, -0.8991377, 1, 1, 1, 1, 1,
1.853741, 0.7463598, 1.126713, 1, 1, 1, 1, 1,
1.878381, 0.7542253, -0.1512097, 1, 1, 1, 1, 1,
1.878873, 0.4184659, 1.105969, 1, 1, 1, 1, 1,
1.884681, 0.2344402, 0.4075054, 1, 1, 1, 1, 1,
1.906259, 0.1996776, 2.161173, 1, 1, 1, 1, 1,
1.915152, 0.787687, 0.5324572, 1, 1, 1, 1, 1,
1.922938, -1.860471, 3.058072, 1, 1, 1, 1, 1,
1.943237, -0.8864051, 2.568004, 1, 1, 1, 1, 1,
1.951779, 1.497923, 1.601529, 1, 1, 1, 1, 1,
1.962612, -0.5505121, 1.13129, 1, 1, 1, 1, 1,
1.990362, 0.1021601, 2.332792, 1, 1, 1, 1, 1,
1.99119, 1.196954, 2.02213, 1, 1, 1, 1, 1,
1.991883, 0.7720664, 1.675484, 1, 1, 1, 1, 1,
1.993847, 0.1946918, -0.1777391, 1, 1, 1, 1, 1,
2.016096, -0.5308281, 3.555357, 0, 0, 1, 1, 1,
2.031603, -1.030959, 2.190787, 1, 0, 0, 1, 1,
2.041981, -0.06953714, 3.326889, 1, 0, 0, 1, 1,
2.044608, 0.2422997, 1.808897, 1, 0, 0, 1, 1,
2.054314, 0.593189, 1.668213, 1, 0, 0, 1, 1,
2.093921, -1.41044, 2.548231, 1, 0, 0, 1, 1,
2.099812, 0.1940216, 0.9374208, 0, 0, 0, 1, 1,
2.121313, -0.6952255, 1.38384, 0, 0, 0, 1, 1,
2.23214, -0.7406114, 1.946839, 0, 0, 0, 1, 1,
2.253479, -0.6723174, 1.755862, 0, 0, 0, 1, 1,
2.293305, 1.465159, 1.091335, 0, 0, 0, 1, 1,
2.302343, -0.319915, 1.927706, 0, 0, 0, 1, 1,
2.307022, 0.3572465, 0.08515386, 0, 0, 0, 1, 1,
2.34724, -0.5644704, 2.868294, 1, 1, 1, 1, 1,
2.410508, -1.429525, 1.784368, 1, 1, 1, 1, 1,
2.42994, 0.2092883, 2.11673, 1, 1, 1, 1, 1,
2.633866, 0.07596707, 1.661376, 1, 1, 1, 1, 1,
2.659337, 1.448272, 0.3463856, 1, 1, 1, 1, 1,
2.735744, 1.834888, 1.77359, 1, 1, 1, 1, 1,
2.919205, -1.183968, 1.921384, 1, 1, 1, 1, 1
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
var radius = 9.557767;
var distance = 33.57125;
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
mvMatrix.translate( 0.4079478, 0.1266131, -0.3176568 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57125);
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
