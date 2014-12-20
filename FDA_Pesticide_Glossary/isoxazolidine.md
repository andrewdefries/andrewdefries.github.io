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
-3.338065, -0.8793158, -0.08394265, 1, 0, 0, 1,
-2.940924, 1.06699, -1.118772, 1, 0.007843138, 0, 1,
-2.879771, -0.3320794, -1.310578, 1, 0.01176471, 0, 1,
-2.656455, 0.9588416, -1.998385, 1, 0.01960784, 0, 1,
-2.643463, -0.1600116, -2.707266, 1, 0.02352941, 0, 1,
-2.536211, -0.09956475, -2.375611, 1, 0.03137255, 0, 1,
-2.514512, 0.822704, -0.6724572, 1, 0.03529412, 0, 1,
-2.435636, 0.5489802, 0.02952195, 1, 0.04313726, 0, 1,
-2.362187, -0.1655648, -2.242155, 1, 0.04705882, 0, 1,
-2.339968, -0.1630402, -1.382795, 1, 0.05490196, 0, 1,
-2.3387, -0.1045446, -1.090625, 1, 0.05882353, 0, 1,
-2.283349, 0.4311427, -1.74754, 1, 0.06666667, 0, 1,
-2.257726, 0.9635447, -1.268645, 1, 0.07058824, 0, 1,
-2.246022, -0.06165839, -1.866801, 1, 0.07843138, 0, 1,
-2.227551, 1.083291, -1.334303, 1, 0.08235294, 0, 1,
-2.177579, 0.9799003, -0.4727957, 1, 0.09019608, 0, 1,
-2.169473, 0.6639077, -1.944456, 1, 0.09411765, 0, 1,
-2.168115, 0.0288483, -0.977727, 1, 0.1019608, 0, 1,
-2.15858, -0.7696738, -3.236488, 1, 0.1098039, 0, 1,
-2.130307, 0.4535271, -1.534578, 1, 0.1137255, 0, 1,
-2.077775, 1.002384, -0.1311863, 1, 0.1215686, 0, 1,
-2.038161, -1.014047, -2.724163, 1, 0.1254902, 0, 1,
-2.034041, -1.150288, -2.916924, 1, 0.1333333, 0, 1,
-2.000987, 0.3865892, -1.348394, 1, 0.1372549, 0, 1,
-1.990732, -0.64271, -1.663871, 1, 0.145098, 0, 1,
-1.957049, 1.175315, 1.301437, 1, 0.1490196, 0, 1,
-1.950509, 1.129078, -2.959494, 1, 0.1568628, 0, 1,
-1.936232, 0.77163, -0.4355683, 1, 0.1607843, 0, 1,
-1.898179, -0.06584685, -1.564554, 1, 0.1686275, 0, 1,
-1.877881, -0.5821407, -2.109658, 1, 0.172549, 0, 1,
-1.854957, 1.577047, -1.049891, 1, 0.1803922, 0, 1,
-1.811886, 1.197927, -0.7647161, 1, 0.1843137, 0, 1,
-1.793119, -0.9884859, -2.243362, 1, 0.1921569, 0, 1,
-1.782271, 1.639518, -2.434655, 1, 0.1960784, 0, 1,
-1.756128, -0.8624293, -2.145971, 1, 0.2039216, 0, 1,
-1.755668, -0.01285717, -1.917124, 1, 0.2117647, 0, 1,
-1.755357, -0.6064537, -1.439202, 1, 0.2156863, 0, 1,
-1.74656, -0.8719019, -0.7767807, 1, 0.2235294, 0, 1,
-1.712055, -0.365805, -2.124531, 1, 0.227451, 0, 1,
-1.710946, 1.984194, -0.433637, 1, 0.2352941, 0, 1,
-1.702342, 0.7622595, -0.4066272, 1, 0.2392157, 0, 1,
-1.689451, -0.08584069, -1.402079, 1, 0.2470588, 0, 1,
-1.675345, -0.8379487, -0.8468877, 1, 0.2509804, 0, 1,
-1.641794, 1.033778, 0.5834311, 1, 0.2588235, 0, 1,
-1.639011, -0.9903906, -1.688674, 1, 0.2627451, 0, 1,
-1.629033, -0.1403396, -2.605895, 1, 0.2705882, 0, 1,
-1.624693, 0.6025169, -1.230596, 1, 0.2745098, 0, 1,
-1.618291, 0.8660842, -0.9542346, 1, 0.282353, 0, 1,
-1.616886, -0.1840333, -2.199091, 1, 0.2862745, 0, 1,
-1.611209, -1.540534, -4.390416, 1, 0.2941177, 0, 1,
-1.599317, -0.2807166, -1.093581, 1, 0.3019608, 0, 1,
-1.592224, -0.8533865, -1.626948, 1, 0.3058824, 0, 1,
-1.588948, 1.084455, -1.503443, 1, 0.3137255, 0, 1,
-1.584141, 1.990554, -0.899658, 1, 0.3176471, 0, 1,
-1.580695, 0.5837976, 0.9345307, 1, 0.3254902, 0, 1,
-1.562622, -1.747426, -0.4293056, 1, 0.3294118, 0, 1,
-1.56193, -0.02912977, -1.353276, 1, 0.3372549, 0, 1,
-1.54656, -1.543776, -2.154608, 1, 0.3411765, 0, 1,
-1.539951, -1.33533, -1.406746, 1, 0.3490196, 0, 1,
-1.53184, -0.7271065, -2.624894, 1, 0.3529412, 0, 1,
-1.526306, 1.158077, -0.7263272, 1, 0.3607843, 0, 1,
-1.514829, -0.08904631, 0.4919995, 1, 0.3647059, 0, 1,
-1.511513, -0.2651563, -2.328417, 1, 0.372549, 0, 1,
-1.507905, -1.17141, -2.094561, 1, 0.3764706, 0, 1,
-1.504615, -0.2098862, -2.001914, 1, 0.3843137, 0, 1,
-1.5018, -1.194431, -3.824727, 1, 0.3882353, 0, 1,
-1.49903, -1.225422, -2.542419, 1, 0.3960784, 0, 1,
-1.497872, 0.7030529, -1.525538, 1, 0.4039216, 0, 1,
-1.491734, 1.99375, 0.6180934, 1, 0.4078431, 0, 1,
-1.485114, -0.2216262, -1.386162, 1, 0.4156863, 0, 1,
-1.472343, 0.0760782, -1.633253, 1, 0.4196078, 0, 1,
-1.470696, -1.274475, -1.814409, 1, 0.427451, 0, 1,
-1.461797, 1.104225, -1.532654, 1, 0.4313726, 0, 1,
-1.451874, -0.438978, -2.125776, 1, 0.4392157, 0, 1,
-1.448772, 0.816298, -1.974262, 1, 0.4431373, 0, 1,
-1.446858, -0.4498366, -0.5769158, 1, 0.4509804, 0, 1,
-1.44628, 0.3873424, -3.276316, 1, 0.454902, 0, 1,
-1.43535, -1.134825, -0.2654729, 1, 0.4627451, 0, 1,
-1.434647, 1.086986, 0.0912431, 1, 0.4666667, 0, 1,
-1.429869, -0.2033792, -2.262522, 1, 0.4745098, 0, 1,
-1.40969, -0.9946483, -3.383426, 1, 0.4784314, 0, 1,
-1.407465, -0.01753637, -0.6007537, 1, 0.4862745, 0, 1,
-1.4032, 0.2805393, -0.6330191, 1, 0.4901961, 0, 1,
-1.399798, -0.1752569, -2.822886, 1, 0.4980392, 0, 1,
-1.393928, -0.8382593, -1.718983, 1, 0.5058824, 0, 1,
-1.393771, -0.1491456, -1.409028, 1, 0.509804, 0, 1,
-1.388738, -0.1768438, -0.8042192, 1, 0.5176471, 0, 1,
-1.373241, -0.03964255, -1.848531, 1, 0.5215687, 0, 1,
-1.361669, -0.2763842, -2.523324, 1, 0.5294118, 0, 1,
-1.35543, -1.196149, -0.0424, 1, 0.5333334, 0, 1,
-1.345246, 2.759942, -0.9816909, 1, 0.5411765, 0, 1,
-1.334462, 1.14097, -0.6051272, 1, 0.5450981, 0, 1,
-1.331682, -0.1033294, -1.836882, 1, 0.5529412, 0, 1,
-1.323369, -0.6142868, -2.243146, 1, 0.5568628, 0, 1,
-1.323358, -1.480614, -1.467952, 1, 0.5647059, 0, 1,
-1.321558, -0.2855963, -0.8100805, 1, 0.5686275, 0, 1,
-1.315524, 0.01883611, -0.6515838, 1, 0.5764706, 0, 1,
-1.315287, 1.351246, 0.9637848, 1, 0.5803922, 0, 1,
-1.29907, 0.1071354, -2.633, 1, 0.5882353, 0, 1,
-1.292081, -1.320351, -1.944676, 1, 0.5921569, 0, 1,
-1.292034, -1.820896, -1.72101, 1, 0.6, 0, 1,
-1.281323, -0.4615096, 0.02388079, 1, 0.6078432, 0, 1,
-1.272744, -0.6611292, -0.7065068, 1, 0.6117647, 0, 1,
-1.26747, 0.5061599, -0.06715354, 1, 0.6196079, 0, 1,
-1.256243, 2.552465, -1.638492, 1, 0.6235294, 0, 1,
-1.248704, -0.8630647, -1.191952, 1, 0.6313726, 0, 1,
-1.247995, -1.376399, -1.102946, 1, 0.6352941, 0, 1,
-1.235896, 0.6543158, -0.1932492, 1, 0.6431373, 0, 1,
-1.230914, -0.05875625, -1.568174, 1, 0.6470588, 0, 1,
-1.227005, -0.8032258, -1.643209, 1, 0.654902, 0, 1,
-1.219376, -0.07763059, -1.285156, 1, 0.6588235, 0, 1,
-1.216128, -0.408357, -0.8000867, 1, 0.6666667, 0, 1,
-1.187038, -0.839368, -1.501651, 1, 0.6705883, 0, 1,
-1.180732, 0.910249, -2.750478, 1, 0.6784314, 0, 1,
-1.176175, 0.2261668, -0.6113597, 1, 0.682353, 0, 1,
-1.17334, 0.9080054, 0.6628805, 1, 0.6901961, 0, 1,
-1.172426, 0.1021705, -2.329057, 1, 0.6941177, 0, 1,
-1.166352, 0.6664529, -0.957545, 1, 0.7019608, 0, 1,
-1.161439, 0.01748394, -2.339709, 1, 0.7098039, 0, 1,
-1.159726, 0.6306593, -0.331182, 1, 0.7137255, 0, 1,
-1.154223, -1.454497, -2.753254, 1, 0.7215686, 0, 1,
-1.15294, 1.294826, -0.7603285, 1, 0.7254902, 0, 1,
-1.146881, -0.5032556, -2.066422, 1, 0.7333333, 0, 1,
-1.145675, 0.235945, -1.833877, 1, 0.7372549, 0, 1,
-1.144061, 1.18736, -1.350658, 1, 0.7450981, 0, 1,
-1.134747, 0.3889982, -2.348682, 1, 0.7490196, 0, 1,
-1.132579, -1.10534, -3.622821, 1, 0.7568628, 0, 1,
-1.121023, 0.5363486, -0.4097032, 1, 0.7607843, 0, 1,
-1.119019, 0.7960134, -2.37217, 1, 0.7686275, 0, 1,
-1.112481, 1.081532, -1.707349, 1, 0.772549, 0, 1,
-1.096738, -1.516139, -3.170609, 1, 0.7803922, 0, 1,
-1.095921, 0.4332544, -0.3788413, 1, 0.7843137, 0, 1,
-1.094276, 0.5136886, -2.500398, 1, 0.7921569, 0, 1,
-1.090907, -1.94378, -3.080845, 1, 0.7960784, 0, 1,
-1.088517, 0.9615958, 0.2709841, 1, 0.8039216, 0, 1,
-1.087508, 1.300125, -0.2082848, 1, 0.8117647, 0, 1,
-1.087453, 1.807516, -0.779842, 1, 0.8156863, 0, 1,
-1.086399, 0.3339541, -2.849608, 1, 0.8235294, 0, 1,
-1.085605, 0.5644494, -2.224912, 1, 0.827451, 0, 1,
-1.084262, 1.444903, -0.3500018, 1, 0.8352941, 0, 1,
-1.077074, 0.3547079, -0.7766881, 1, 0.8392157, 0, 1,
-1.074627, 0.478469, -1.031143, 1, 0.8470588, 0, 1,
-1.070189, 0.4970249, -2.032711, 1, 0.8509804, 0, 1,
-1.065777, -0.5986547, -2.800837, 1, 0.8588235, 0, 1,
-1.063808, 1.019805, -0.9501467, 1, 0.8627451, 0, 1,
-1.058485, -0.2122359, -1.786873, 1, 0.8705882, 0, 1,
-1.057459, -1.195479, -2.165586, 1, 0.8745098, 0, 1,
-1.053111, 0.1117039, -2.520498, 1, 0.8823529, 0, 1,
-1.051557, -0.9642125, -1.661795, 1, 0.8862745, 0, 1,
-1.047855, 2.037962, -0.4654838, 1, 0.8941177, 0, 1,
-1.042354, 0.7368502, -0.7857552, 1, 0.8980392, 0, 1,
-1.040153, 0.9506137, -1.179023, 1, 0.9058824, 0, 1,
-1.040043, 0.213882, -2.498618, 1, 0.9137255, 0, 1,
-1.032773, -1.308658, -2.586399, 1, 0.9176471, 0, 1,
-1.020041, 0.02182582, -1.230303, 1, 0.9254902, 0, 1,
-1.015013, -0.3132915, -2.057108, 1, 0.9294118, 0, 1,
-1.011237, 0.1492914, -1.331552, 1, 0.9372549, 0, 1,
-1.010517, -0.2130773, -0.4416614, 1, 0.9411765, 0, 1,
-1.000225, -2.596453, -5.189453, 1, 0.9490196, 0, 1,
-0.9929393, -1.943314, -0.5915625, 1, 0.9529412, 0, 1,
-0.9861141, -1.585388, -2.395697, 1, 0.9607843, 0, 1,
-0.9853001, -0.1502207, -3.159543, 1, 0.9647059, 0, 1,
-0.9827516, 0.3304495, -2.017371, 1, 0.972549, 0, 1,
-0.9793393, 0.3490165, 0.5403061, 1, 0.9764706, 0, 1,
-0.9666929, 0.09241731, -2.552308, 1, 0.9843137, 0, 1,
-0.9621564, -2.148994, -2.592223, 1, 0.9882353, 0, 1,
-0.959402, 1.12952, -1.054851, 1, 0.9960784, 0, 1,
-0.9587727, 0.5592579, -1.61767, 0.9960784, 1, 0, 1,
-0.9568535, 1.15885, 0.2042271, 0.9921569, 1, 0, 1,
-0.9530944, 0.3949452, -1.866609, 0.9843137, 1, 0, 1,
-0.952769, -1.220113, -1.617788, 0.9803922, 1, 0, 1,
-0.9497098, -0.04685297, -0.2868024, 0.972549, 1, 0, 1,
-0.9476469, -2.737833, -0.6792005, 0.9686275, 1, 0, 1,
-0.9476007, 0.3533578, -0.955942, 0.9607843, 1, 0, 1,
-0.9448892, 0.3114422, -2.239307, 0.9568627, 1, 0, 1,
-0.9314874, 0.4609951, -0.9378544, 0.9490196, 1, 0, 1,
-0.9268635, 0.1088606, -1.308135, 0.945098, 1, 0, 1,
-0.9260477, -1.176518, -3.238828, 0.9372549, 1, 0, 1,
-0.9229835, 1.416948, -0.9160661, 0.9333333, 1, 0, 1,
-0.9187227, -0.9246127, -2.550764, 0.9254902, 1, 0, 1,
-0.9178581, -1.013324, -2.347025, 0.9215686, 1, 0, 1,
-0.916185, 2.303158, -1.846781, 0.9137255, 1, 0, 1,
-0.9145211, -1.219012, -3.368016, 0.9098039, 1, 0, 1,
-0.9126276, -1.799738, -2.146509, 0.9019608, 1, 0, 1,
-0.9100782, -0.5141392, -2.001228, 0.8941177, 1, 0, 1,
-0.9094677, -3.067665, -2.710988, 0.8901961, 1, 0, 1,
-0.8968024, -1.295167, -1.673425, 0.8823529, 1, 0, 1,
-0.8963882, -0.003110002, -3.377193, 0.8784314, 1, 0, 1,
-0.8939363, 2.507751, 2.497638, 0.8705882, 1, 0, 1,
-0.8835544, 1.036219, -3.391696, 0.8666667, 1, 0, 1,
-0.8788775, 2.077068, -1.473057, 0.8588235, 1, 0, 1,
-0.8727973, -1.198363, -1.209999, 0.854902, 1, 0, 1,
-0.8692372, -1.571669, -2.459587, 0.8470588, 1, 0, 1,
-0.8630696, 1.193013, -0.9156002, 0.8431373, 1, 0, 1,
-0.8585234, 0.6985471, -2.137859, 0.8352941, 1, 0, 1,
-0.8487909, -0.9345177, -3.263984, 0.8313726, 1, 0, 1,
-0.837925, -1.094669, -3.663636, 0.8235294, 1, 0, 1,
-0.8365656, -0.01489756, -1.935762, 0.8196079, 1, 0, 1,
-0.8340138, 1.196245, -2.427395, 0.8117647, 1, 0, 1,
-0.8321344, -0.907029, -0.5309546, 0.8078431, 1, 0, 1,
-0.8288379, 0.4132102, -1.315155, 0.8, 1, 0, 1,
-0.8124699, 1.422201, -0.3109384, 0.7921569, 1, 0, 1,
-0.8087802, 1.40241, -0.8498458, 0.7882353, 1, 0, 1,
-0.7904302, -1.07629, -2.041041, 0.7803922, 1, 0, 1,
-0.7839138, 0.3523684, -0.8038902, 0.7764706, 1, 0, 1,
-0.7793652, 1.292161, 0.01764122, 0.7686275, 1, 0, 1,
-0.7785361, -0.2521974, -0.06031104, 0.7647059, 1, 0, 1,
-0.777588, -0.6626867, -2.51048, 0.7568628, 1, 0, 1,
-0.776248, -2.468132, -3.453759, 0.7529412, 1, 0, 1,
-0.7732593, -1.568985, -1.462364, 0.7450981, 1, 0, 1,
-0.7661797, -1.505934, -3.763242, 0.7411765, 1, 0, 1,
-0.7609268, -0.6801653, -0.1670304, 0.7333333, 1, 0, 1,
-0.7591038, -1.186447, -1.15057, 0.7294118, 1, 0, 1,
-0.7581802, 0.4196474, -1.269272, 0.7215686, 1, 0, 1,
-0.755712, -0.5055696, -1.521283, 0.7176471, 1, 0, 1,
-0.7520772, -0.929121, -0.4975841, 0.7098039, 1, 0, 1,
-0.7508065, -0.6573159, -1.684985, 0.7058824, 1, 0, 1,
-0.7504576, -0.3273987, -1.404205, 0.6980392, 1, 0, 1,
-0.7492914, -0.7176057, -2.358274, 0.6901961, 1, 0, 1,
-0.7490631, 0.7534931, -0.2735718, 0.6862745, 1, 0, 1,
-0.744341, -0.1828076, -1.348925, 0.6784314, 1, 0, 1,
-0.7421852, 1.201579, -0.6381986, 0.6745098, 1, 0, 1,
-0.7401158, 0.3648217, -0.3461785, 0.6666667, 1, 0, 1,
-0.7302781, -0.8509742, -1.930617, 0.6627451, 1, 0, 1,
-0.7302759, 0.5412478, -1.760308, 0.654902, 1, 0, 1,
-0.7256916, 0.2805053, -0.5536085, 0.6509804, 1, 0, 1,
-0.724807, -1.49969, -2.431265, 0.6431373, 1, 0, 1,
-0.7220885, -0.924711, -3.421133, 0.6392157, 1, 0, 1,
-0.7194899, -0.7441372, -0.8581752, 0.6313726, 1, 0, 1,
-0.7191786, 0.4829688, -0.8735576, 0.627451, 1, 0, 1,
-0.7179111, 1.122004, 0.386629, 0.6196079, 1, 0, 1,
-0.7111155, 0.251375, -1.051666, 0.6156863, 1, 0, 1,
-0.7060897, -1.02767, -2.162816, 0.6078432, 1, 0, 1,
-0.7005953, 0.03900735, -0.465021, 0.6039216, 1, 0, 1,
-0.6969041, 1.071999, -0.5984262, 0.5960785, 1, 0, 1,
-0.6911876, -0.2270399, -1.30462, 0.5882353, 1, 0, 1,
-0.6881559, 0.8135725, -0.3956805, 0.5843138, 1, 0, 1,
-0.6876465, -0.932587, -1.617922, 0.5764706, 1, 0, 1,
-0.6833085, -1.593335, -1.05386, 0.572549, 1, 0, 1,
-0.6829976, 0.8345149, -0.5050941, 0.5647059, 1, 0, 1,
-0.6828464, 1.556949, -1.728843, 0.5607843, 1, 0, 1,
-0.6820521, 0.1264483, -1.845417, 0.5529412, 1, 0, 1,
-0.6745361, 0.3237852, -0.585165, 0.5490196, 1, 0, 1,
-0.6670022, -1.122955, -3.442329, 0.5411765, 1, 0, 1,
-0.6549026, 0.1806901, 0.4441138, 0.5372549, 1, 0, 1,
-0.651547, 0.6455123, -2.246811, 0.5294118, 1, 0, 1,
-0.6495504, 1.383909, 0.3693013, 0.5254902, 1, 0, 1,
-0.6494182, -1.113288, -3.803502, 0.5176471, 1, 0, 1,
-0.6400664, 0.004325698, -1.605471, 0.5137255, 1, 0, 1,
-0.6341735, -0.2304377, -3.307378, 0.5058824, 1, 0, 1,
-0.6330622, -0.1258259, -1.315606, 0.5019608, 1, 0, 1,
-0.6294103, -0.1698079, -3.372664, 0.4941176, 1, 0, 1,
-0.6248659, -1.049431, -1.315348, 0.4862745, 1, 0, 1,
-0.6230491, -0.7876862, -2.67094, 0.4823529, 1, 0, 1,
-0.6226804, -0.0936568, -1.374163, 0.4745098, 1, 0, 1,
-0.6220455, -1.0239, -2.455302, 0.4705882, 1, 0, 1,
-0.6198838, 0.7668689, -2.390583, 0.4627451, 1, 0, 1,
-0.6182408, 0.6425444, -0.3619606, 0.4588235, 1, 0, 1,
-0.6109353, -0.4394982, -0.004436843, 0.4509804, 1, 0, 1,
-0.6089951, -0.2480826, -1.852824, 0.4470588, 1, 0, 1,
-0.6084533, -1.227767, -2.595979, 0.4392157, 1, 0, 1,
-0.6050034, 0.1912283, -1.185874, 0.4352941, 1, 0, 1,
-0.6031874, 0.6046972, -0.8867036, 0.427451, 1, 0, 1,
-0.5996217, 0.8501205, -0.9871944, 0.4235294, 1, 0, 1,
-0.5992177, -0.3063073, -1.383872, 0.4156863, 1, 0, 1,
-0.5986508, -0.06967467, -1.792898, 0.4117647, 1, 0, 1,
-0.5968208, -0.2560683, -2.249475, 0.4039216, 1, 0, 1,
-0.5958374, 0.6945471, -0.9902357, 0.3960784, 1, 0, 1,
-0.5933788, -0.5514332, -3.118797, 0.3921569, 1, 0, 1,
-0.5932811, -0.1222691, -2.293948, 0.3843137, 1, 0, 1,
-0.5910793, 0.1931013, -1.510151, 0.3803922, 1, 0, 1,
-0.5855972, 1.163534, -0.7856132, 0.372549, 1, 0, 1,
-0.5855324, -1.351435, -2.925308, 0.3686275, 1, 0, 1,
-0.5845399, 0.3547638, -0.2280592, 0.3607843, 1, 0, 1,
-0.5839354, 0.8665286, 1.121394, 0.3568628, 1, 0, 1,
-0.5751728, 0.6387653, -1.024322, 0.3490196, 1, 0, 1,
-0.570561, 0.9298551, 0.720131, 0.345098, 1, 0, 1,
-0.56938, 0.599911, 0.8685607, 0.3372549, 1, 0, 1,
-0.5690863, 0.7146233, -1.272068, 0.3333333, 1, 0, 1,
-0.5636762, 0.1656924, 0.5396095, 0.3254902, 1, 0, 1,
-0.5615317, 0.3991064, -0.5363317, 0.3215686, 1, 0, 1,
-0.5596859, 0.3023691, 0.4514923, 0.3137255, 1, 0, 1,
-0.5576361, 1.666773, 0.0637439, 0.3098039, 1, 0, 1,
-0.5549442, 1.453, 1.318115, 0.3019608, 1, 0, 1,
-0.5532387, 0.993826, -0.36035, 0.2941177, 1, 0, 1,
-0.5510032, -0.1708519, -3.863017, 0.2901961, 1, 0, 1,
-0.5506374, -0.1706791, -1.333017, 0.282353, 1, 0, 1,
-0.5500793, 1.033899, -1.651035, 0.2784314, 1, 0, 1,
-0.5428799, 1.909531, -0.03625599, 0.2705882, 1, 0, 1,
-0.5365047, 1.184097, -1.216342, 0.2666667, 1, 0, 1,
-0.5358669, 0.9400484, -0.8688446, 0.2588235, 1, 0, 1,
-0.5336978, -0.6843002, -1.254937, 0.254902, 1, 0, 1,
-0.5331161, -0.8183412, -1.871884, 0.2470588, 1, 0, 1,
-0.5321662, 0.1925741, -1.400121, 0.2431373, 1, 0, 1,
-0.5307002, 0.1173276, -1.16363, 0.2352941, 1, 0, 1,
-0.5270739, 0.5111659, -1.436327, 0.2313726, 1, 0, 1,
-0.5270578, -0.6518945, -2.812591, 0.2235294, 1, 0, 1,
-0.5257049, -0.3480131, -1.832064, 0.2196078, 1, 0, 1,
-0.5256903, -0.1790661, -3.33382, 0.2117647, 1, 0, 1,
-0.5225162, 0.0239249, -0.9935686, 0.2078431, 1, 0, 1,
-0.521041, 1.698631, -0.3141802, 0.2, 1, 0, 1,
-0.5149857, 0.5868325, -0.01007935, 0.1921569, 1, 0, 1,
-0.5149267, -0.3375992, -1.238594, 0.1882353, 1, 0, 1,
-0.5079856, 0.7524458, -1.99863, 0.1803922, 1, 0, 1,
-0.5070862, 1.211863, -1.258792, 0.1764706, 1, 0, 1,
-0.5062691, 1.459903, -0.814217, 0.1686275, 1, 0, 1,
-0.5033928, -0.2011661, -0.7877426, 0.1647059, 1, 0, 1,
-0.5033124, -0.2078962, -4.233123, 0.1568628, 1, 0, 1,
-0.4998989, 0.2660393, -1.391755, 0.1529412, 1, 0, 1,
-0.4962879, -0.2187714, -1.444977, 0.145098, 1, 0, 1,
-0.4947982, 1.229569, -0.06959736, 0.1411765, 1, 0, 1,
-0.4936938, 0.4175485, 1.08952, 0.1333333, 1, 0, 1,
-0.4780303, 0.368731, -1.818106, 0.1294118, 1, 0, 1,
-0.4772169, -0.08363517, -1.060788, 0.1215686, 1, 0, 1,
-0.4751337, -1.24359, -3.24985, 0.1176471, 1, 0, 1,
-0.4750725, 0.7099131, 0.7682328, 0.1098039, 1, 0, 1,
-0.4741657, -0.03117407, -1.3831, 0.1058824, 1, 0, 1,
-0.4720465, -0.7868732, -1.034654, 0.09803922, 1, 0, 1,
-0.4711989, -0.06335194, -1.433127, 0.09019608, 1, 0, 1,
-0.4710271, 0.0530066, -0.8917496, 0.08627451, 1, 0, 1,
-0.4678932, -1.328258, -4.669493, 0.07843138, 1, 0, 1,
-0.4667273, 0.2160315, -1.404072, 0.07450981, 1, 0, 1,
-0.4642015, 1.524301, -0.2673245, 0.06666667, 1, 0, 1,
-0.4601625, 0.4021845, 0.2986632, 0.0627451, 1, 0, 1,
-0.4598978, -1.639082, -2.442972, 0.05490196, 1, 0, 1,
-0.4582828, 0.4197414, 0.1427681, 0.05098039, 1, 0, 1,
-0.4535823, 0.6488282, 1.670823, 0.04313726, 1, 0, 1,
-0.4487285, 1.537967, 0.1334701, 0.03921569, 1, 0, 1,
-0.4482739, -1.20917, -2.162915, 0.03137255, 1, 0, 1,
-0.4426841, -0.6818306, -2.028324, 0.02745098, 1, 0, 1,
-0.4395621, 0.3448528, -0.007687921, 0.01960784, 1, 0, 1,
-0.4340007, -0.05046314, -3.007663, 0.01568628, 1, 0, 1,
-0.432068, 1.194678, -1.202309, 0.007843138, 1, 0, 1,
-0.4272592, 0.4364051, -2.465271, 0.003921569, 1, 0, 1,
-0.4262663, -0.6122794, -3.432164, 0, 1, 0.003921569, 1,
-0.4224345, 1.647805, 0.3787764, 0, 1, 0.01176471, 1,
-0.4168968, -0.002473388, -0.8408527, 0, 1, 0.01568628, 1,
-0.4165733, 0.4822465, -1.543089, 0, 1, 0.02352941, 1,
-0.4082935, -0.9939572, -4.236208, 0, 1, 0.02745098, 1,
-0.3989937, -1.010428, -2.314345, 0, 1, 0.03529412, 1,
-0.3972879, 0.04435655, -0.7680348, 0, 1, 0.03921569, 1,
-0.3946109, -0.4741335, -4.216139, 0, 1, 0.04705882, 1,
-0.3877791, 0.5922338, 1.121415, 0, 1, 0.05098039, 1,
-0.3872074, 0.03734041, -1.074283, 0, 1, 0.05882353, 1,
-0.3845132, 0.3594801, -1.204823, 0, 1, 0.0627451, 1,
-0.3792001, 0.3686403, -1.080914, 0, 1, 0.07058824, 1,
-0.3777241, -0.1005436, -1.85095, 0, 1, 0.07450981, 1,
-0.3755433, 1.335296, 0.4432135, 0, 1, 0.08235294, 1,
-0.3750657, 1.773461, -1.087708, 0, 1, 0.08627451, 1,
-0.3747469, 1.536701, 0.4850834, 0, 1, 0.09411765, 1,
-0.3743985, -0.009801826, -1.226558, 0, 1, 0.1019608, 1,
-0.3734303, -0.5983458, -1.02388, 0, 1, 0.1058824, 1,
-0.3687229, 0.3285802, -0.7803299, 0, 1, 0.1137255, 1,
-0.3676004, 0.9392375, -1.057152, 0, 1, 0.1176471, 1,
-0.3582236, -0.9556274, -2.133923, 0, 1, 0.1254902, 1,
-0.3570189, -0.6361722, -2.371484, 0, 1, 0.1294118, 1,
-0.3564809, -0.7008509, -2.930148, 0, 1, 0.1372549, 1,
-0.3546721, -0.5153155, -4.830004, 0, 1, 0.1411765, 1,
-0.3544835, -1.052402, -1.308353, 0, 1, 0.1490196, 1,
-0.3542036, -0.4969048, -2.441055, 0, 1, 0.1529412, 1,
-0.3541017, -1.04722, -4.709547, 0, 1, 0.1607843, 1,
-0.3521586, 1.189684, -0.3182732, 0, 1, 0.1647059, 1,
-0.3506866, 0.6431583, -0.8833479, 0, 1, 0.172549, 1,
-0.3482753, 0.1550232, -1.626681, 0, 1, 0.1764706, 1,
-0.3479553, -0.681087, -3.24213, 0, 1, 0.1843137, 1,
-0.3422771, -0.7245268, -3.63273, 0, 1, 0.1882353, 1,
-0.3393272, -1.124451, -2.598597, 0, 1, 0.1960784, 1,
-0.3319126, 0.2252487, -3.374681, 0, 1, 0.2039216, 1,
-0.3300315, 0.7913388, -1.907189, 0, 1, 0.2078431, 1,
-0.3239369, -0.7370466, -3.387864, 0, 1, 0.2156863, 1,
-0.3237522, 1.51401, -2.12601, 0, 1, 0.2196078, 1,
-0.3235993, 0.101678, -1.635573, 0, 1, 0.227451, 1,
-0.3183502, -0.9919357, -3.123964, 0, 1, 0.2313726, 1,
-0.3173978, 1.443789, 0.01094715, 0, 1, 0.2392157, 1,
-0.3171595, 0.1301757, -0.6683633, 0, 1, 0.2431373, 1,
-0.3131368, -0.6335797, -2.55288, 0, 1, 0.2509804, 1,
-0.3115093, -0.9771771, -2.0116, 0, 1, 0.254902, 1,
-0.3111943, -0.7937638, -1.718478, 0, 1, 0.2627451, 1,
-0.3026613, -1.106508, -3.708972, 0, 1, 0.2666667, 1,
-0.2999671, -0.04327151, -1.483123, 0, 1, 0.2745098, 1,
-0.2897391, 1.14818, -0.2368262, 0, 1, 0.2784314, 1,
-0.2836746, -0.9374823, -3.414927, 0, 1, 0.2862745, 1,
-0.2765158, 0.1299555, 0.2987628, 0, 1, 0.2901961, 1,
-0.2701884, 0.2428535, -0.4104865, 0, 1, 0.2980392, 1,
-0.260842, 1.323871, 0.09472673, 0, 1, 0.3058824, 1,
-0.2604791, -1.178761, -3.613233, 0, 1, 0.3098039, 1,
-0.2542873, -0.09042746, -3.787587, 0, 1, 0.3176471, 1,
-0.252207, -0.2502389, -2.403104, 0, 1, 0.3215686, 1,
-0.2516251, -1.462429, -2.805307, 0, 1, 0.3294118, 1,
-0.2490751, 0.2959854, -1.190772, 0, 1, 0.3333333, 1,
-0.2469913, 1.168591, 1.684717, 0, 1, 0.3411765, 1,
-0.245763, -0.2530472, -2.582114, 0, 1, 0.345098, 1,
-0.24262, -1.103516, -2.631199, 0, 1, 0.3529412, 1,
-0.2405478, -0.9293935, -2.880381, 0, 1, 0.3568628, 1,
-0.2395505, -0.1920311, -1.395782, 0, 1, 0.3647059, 1,
-0.2355484, -1.043642, -2.566038, 0, 1, 0.3686275, 1,
-0.2308489, 1.538205, -0.1566399, 0, 1, 0.3764706, 1,
-0.2294487, -1.688641, -0.7088001, 0, 1, 0.3803922, 1,
-0.223272, -0.4222794, -3.475698, 0, 1, 0.3882353, 1,
-0.2204363, -0.3209605, -2.458971, 0, 1, 0.3921569, 1,
-0.2179932, -0.3924148, -2.882969, 0, 1, 0.4, 1,
-0.2162338, -0.03845532, -3.17541, 0, 1, 0.4078431, 1,
-0.2141411, -0.6146498, -3.930732, 0, 1, 0.4117647, 1,
-0.2102946, -1.260501, -2.240893, 0, 1, 0.4196078, 1,
-0.2066288, 0.04055052, -2.01478, 0, 1, 0.4235294, 1,
-0.2042858, -2.714761, -2.418737, 0, 1, 0.4313726, 1,
-0.2040447, 0.9188616, 0.2489128, 0, 1, 0.4352941, 1,
-0.1993096, 0.04357962, -1.0065, 0, 1, 0.4431373, 1,
-0.1976499, -0.4994892, -4.435032, 0, 1, 0.4470588, 1,
-0.1975213, 0.2017344, 0.239079, 0, 1, 0.454902, 1,
-0.1951545, -0.1242193, -2.177291, 0, 1, 0.4588235, 1,
-0.194492, 0.2631458, 0.5399984, 0, 1, 0.4666667, 1,
-0.1917391, 0.3172017, -0.1522928, 0, 1, 0.4705882, 1,
-0.1897848, 0.12914, -1.24921, 0, 1, 0.4784314, 1,
-0.1870047, 1.764219, -0.2594937, 0, 1, 0.4823529, 1,
-0.1853519, -0.867683, -2.445807, 0, 1, 0.4901961, 1,
-0.1822081, -1.817754, -2.712722, 0, 1, 0.4941176, 1,
-0.181426, 1.505563, -0.1649461, 0, 1, 0.5019608, 1,
-0.181022, -0.1180237, -3.013382, 0, 1, 0.509804, 1,
-0.1766461, -0.3632533, -3.064929, 0, 1, 0.5137255, 1,
-0.1760187, 0.5579368, -0.8784889, 0, 1, 0.5215687, 1,
-0.171526, -0.8235303, -1.517263, 0, 1, 0.5254902, 1,
-0.1686958, -0.3583989, -1.810987, 0, 1, 0.5333334, 1,
-0.1595856, -0.2191169, -2.837222, 0, 1, 0.5372549, 1,
-0.1586378, 1.28343, 0.593953, 0, 1, 0.5450981, 1,
-0.1574447, 0.5506184, 0.4860953, 0, 1, 0.5490196, 1,
-0.1508196, 1.227825, 0.100875, 0, 1, 0.5568628, 1,
-0.1451337, 0.5722367, -0.330141, 0, 1, 0.5607843, 1,
-0.1441069, 1.120085, 0.07230041, 0, 1, 0.5686275, 1,
-0.1439631, 0.1642969, -1.316898, 0, 1, 0.572549, 1,
-0.1410763, 1.805382, 1.068256, 0, 1, 0.5803922, 1,
-0.1381406, 0.1797279, -0.2144715, 0, 1, 0.5843138, 1,
-0.1281258, 0.8838869, 1.527061, 0, 1, 0.5921569, 1,
-0.1272966, -1.005421, -0.9993651, 0, 1, 0.5960785, 1,
-0.126226, -2.284425, -3.229426, 0, 1, 0.6039216, 1,
-0.1245658, 0.6491183, 0.07776812, 0, 1, 0.6117647, 1,
-0.1199194, -1.080683, -2.881499, 0, 1, 0.6156863, 1,
-0.1187235, 0.2591613, -0.8849997, 0, 1, 0.6235294, 1,
-0.1168055, 0.6244062, -0.2197458, 0, 1, 0.627451, 1,
-0.1157064, -0.5184197, -2.99033, 0, 1, 0.6352941, 1,
-0.1140791, -0.08321896, -2.234525, 0, 1, 0.6392157, 1,
-0.1139861, -0.6610702, -1.611537, 0, 1, 0.6470588, 1,
-0.1113274, 1.105782, 0.3447673, 0, 1, 0.6509804, 1,
-0.1097979, -0.2892302, -3.906636, 0, 1, 0.6588235, 1,
-0.1087493, -1.538908, -4.306195, 0, 1, 0.6627451, 1,
-0.1035152, 0.147139, 0.9650494, 0, 1, 0.6705883, 1,
-0.1006815, -0.3928906, -3.772605, 0, 1, 0.6745098, 1,
-0.09915812, 0.4190857, -0.171154, 0, 1, 0.682353, 1,
-0.09882722, -1.109433, 0.08876976, 0, 1, 0.6862745, 1,
-0.09881845, 0.1259234, -2.178212, 0, 1, 0.6941177, 1,
-0.09642256, -1.75353, -3.979183, 0, 1, 0.7019608, 1,
-0.09316993, 2.449931, 1.565796, 0, 1, 0.7058824, 1,
-0.08396731, -0.9330872, -2.985475, 0, 1, 0.7137255, 1,
-0.08169033, 0.5994375, -0.6500353, 0, 1, 0.7176471, 1,
-0.0774197, -1.030293, -2.454172, 0, 1, 0.7254902, 1,
-0.07287154, -0.6539492, -2.584353, 0, 1, 0.7294118, 1,
-0.06983453, -1.297179, -2.777777, 0, 1, 0.7372549, 1,
-0.06947888, 0.1059305, -0.8998008, 0, 1, 0.7411765, 1,
-0.06893267, -1.602193, -4.786406, 0, 1, 0.7490196, 1,
-0.06228954, 0.6605018, 0.4281872, 0, 1, 0.7529412, 1,
-0.06123357, 0.2221047, 1.178344, 0, 1, 0.7607843, 1,
-0.06089987, 0.04397953, -1.41714, 0, 1, 0.7647059, 1,
-0.05865692, -0.4914996, -1.96051, 0, 1, 0.772549, 1,
-0.05821281, 0.1230601, -0.630941, 0, 1, 0.7764706, 1,
-0.05399403, 1.470453, -0.897639, 0, 1, 0.7843137, 1,
-0.05346953, 0.07943439, -1.661671, 0, 1, 0.7882353, 1,
-0.05223108, -2.504824, -4.240728, 0, 1, 0.7960784, 1,
-0.04985156, 1.237571, 0.07812337, 0, 1, 0.8039216, 1,
-0.04828504, 1.75121, 0.3045706, 0, 1, 0.8078431, 1,
-0.04049193, -0.03988878, -1.670701, 0, 1, 0.8156863, 1,
-0.03973132, -0.2473713, -2.520409, 0, 1, 0.8196079, 1,
-0.03928735, 0.04381275, -1.115466, 0, 1, 0.827451, 1,
-0.03743969, 2.392066, 1.441154, 0, 1, 0.8313726, 1,
-0.03568583, -1.470619, -5.112068, 0, 1, 0.8392157, 1,
-0.03253895, 0.6016874, 0.6490785, 0, 1, 0.8431373, 1,
-0.03041773, 1.789002, -1.287943, 0, 1, 0.8509804, 1,
-0.02598087, -2.026314, -4.104105, 0, 1, 0.854902, 1,
-0.02426708, -0.9407137, -0.5540751, 0, 1, 0.8627451, 1,
-0.02305362, -0.6214103, -2.497375, 0, 1, 0.8666667, 1,
-0.02233572, 0.07218425, -0.9752389, 0, 1, 0.8745098, 1,
-0.01744491, 0.09951193, -1.135644, 0, 1, 0.8784314, 1,
-0.01329935, -0.2587629, -2.363504, 0, 1, 0.8862745, 1,
-0.01065256, 0.02737146, 1.279947, 0, 1, 0.8901961, 1,
-0.006172226, 1.473985, 0.6560858, 0, 1, 0.8980392, 1,
-0.002449869, -1.118346, -3.777814, 0, 1, 0.9058824, 1,
4.068205e-05, 0.3538593, 1.20019, 0, 1, 0.9098039, 1,
0.001461075, -0.7604893, 4.352771, 0, 1, 0.9176471, 1,
0.002494645, -0.868301, 2.942875, 0, 1, 0.9215686, 1,
0.003237397, -0.9898012, 3.623615, 0, 1, 0.9294118, 1,
0.003787241, -0.02357372, 4.710042, 0, 1, 0.9333333, 1,
0.003901227, -0.2924858, 2.675985, 0, 1, 0.9411765, 1,
0.009444382, -1.470564, 4.434694, 0, 1, 0.945098, 1,
0.02159683, 1.225665, -0.9679798, 0, 1, 0.9529412, 1,
0.02330527, -1.832507, 3.594994, 0, 1, 0.9568627, 1,
0.02946668, 2.034582, 1.548055, 0, 1, 0.9647059, 1,
0.0349081, 0.3084808, -0.1322722, 0, 1, 0.9686275, 1,
0.04116524, 3.240919, 2.17489, 0, 1, 0.9764706, 1,
0.04513099, -0.4410988, 4.196516, 0, 1, 0.9803922, 1,
0.04606942, -0.02112717, 3.921731, 0, 1, 0.9882353, 1,
0.04753722, -0.7364298, 3.049281, 0, 1, 0.9921569, 1,
0.04935773, 1.099758, -0.1326484, 0, 1, 1, 1,
0.05349015, 0.9333408, 0.3227178, 0, 0.9921569, 1, 1,
0.05582667, -0.5819377, 3.513274, 0, 0.9882353, 1, 1,
0.0563859, 0.1073706, -0.628101, 0, 0.9803922, 1, 1,
0.05752841, 0.832629, -0.282519, 0, 0.9764706, 1, 1,
0.06157983, 1.780493, 0.5332573, 0, 0.9686275, 1, 1,
0.06727712, 0.453219, 0.07608112, 0, 0.9647059, 1, 1,
0.06748737, -0.00273217, 3.874998, 0, 0.9568627, 1, 1,
0.0752942, 0.3646872, -1.516986, 0, 0.9529412, 1, 1,
0.07879701, -1.282177, 3.81196, 0, 0.945098, 1, 1,
0.07928132, 0.9182776, 0.2686041, 0, 0.9411765, 1, 1,
0.08051142, 1.963786, 0.6591925, 0, 0.9333333, 1, 1,
0.08123949, 1.188921, -1.369898, 0, 0.9294118, 1, 1,
0.08312456, -1.201687, 1.700976, 0, 0.9215686, 1, 1,
0.08346193, 1.055597, 2.327054, 0, 0.9176471, 1, 1,
0.08447222, -0.1321478, 3.134839, 0, 0.9098039, 1, 1,
0.08666545, -0.5668473, 3.654037, 0, 0.9058824, 1, 1,
0.08785272, -1.439988, 1.665519, 0, 0.8980392, 1, 1,
0.08850908, 1.124225, -2.272673, 0, 0.8901961, 1, 1,
0.08867798, -1.484871, 4.002864, 0, 0.8862745, 1, 1,
0.09010066, -0.1029244, 4.078956, 0, 0.8784314, 1, 1,
0.09292351, -0.7726979, 1.872394, 0, 0.8745098, 1, 1,
0.09806706, -0.4914033, 3.068096, 0, 0.8666667, 1, 1,
0.09949732, 0.4214199, 0.1478101, 0, 0.8627451, 1, 1,
0.1053089, -0.1029868, 4.246149, 0, 0.854902, 1, 1,
0.1092745, 0.06484613, 2.387997, 0, 0.8509804, 1, 1,
0.1100987, -0.03661317, 1.748654, 0, 0.8431373, 1, 1,
0.1110786, -0.683832, 1.976725, 0, 0.8392157, 1, 1,
0.1202953, -0.6026311, 1.336986, 0, 0.8313726, 1, 1,
0.1207261, 2.160352, 1.805003, 0, 0.827451, 1, 1,
0.1233979, 0.1908789, 1.575887, 0, 0.8196079, 1, 1,
0.1238832, 1.477569, -0.3571427, 0, 0.8156863, 1, 1,
0.1286585, 2.327277, 0.0808202, 0, 0.8078431, 1, 1,
0.1339634, 1.552668, 0.3816122, 0, 0.8039216, 1, 1,
0.1347772, 0.2245058, 0.442253, 0, 0.7960784, 1, 1,
0.1363195, -1.944365, 2.180655, 0, 0.7882353, 1, 1,
0.1373346, 0.7637155, 1.153719, 0, 0.7843137, 1, 1,
0.1389538, 0.2509904, 0.889021, 0, 0.7764706, 1, 1,
0.1419673, 1.591168, -1.104746, 0, 0.772549, 1, 1,
0.1427586, -0.6394813, 3.202916, 0, 0.7647059, 1, 1,
0.1474814, 0.8924735, 0.6541671, 0, 0.7607843, 1, 1,
0.1514702, 0.07220008, 1.234604, 0, 0.7529412, 1, 1,
0.1564279, -0.6105325, 2.59269, 0, 0.7490196, 1, 1,
0.1590721, 0.7374516, 0.2036254, 0, 0.7411765, 1, 1,
0.1604596, -2.215625, 2.903658, 0, 0.7372549, 1, 1,
0.1611896, -1.009817, 2.765189, 0, 0.7294118, 1, 1,
0.1630304, 0.1663062, 0.5365264, 0, 0.7254902, 1, 1,
0.1649259, -0.2278266, 4.397842, 0, 0.7176471, 1, 1,
0.1665309, -0.9652131, 3.232826, 0, 0.7137255, 1, 1,
0.1672297, 0.4550635, 1.193646, 0, 0.7058824, 1, 1,
0.1691078, 0.2760603, -0.8389508, 0, 0.6980392, 1, 1,
0.1733416, 0.3806944, 0.06577026, 0, 0.6941177, 1, 1,
0.1748341, -0.09964231, 1.664728, 0, 0.6862745, 1, 1,
0.1785377, 0.02452032, 0.495577, 0, 0.682353, 1, 1,
0.1910645, 2.145863, 0.5528957, 0, 0.6745098, 1, 1,
0.1912914, -0.5647289, 1.900185, 0, 0.6705883, 1, 1,
0.1975325, -0.7246497, 3.454934, 0, 0.6627451, 1, 1,
0.1986243, 0.5499022, -1.864501, 0, 0.6588235, 1, 1,
0.1990787, -0.2128158, 1.787289, 0, 0.6509804, 1, 1,
0.2024126, 1.723383, 1.115849, 0, 0.6470588, 1, 1,
0.2037322, -0.5207034, 1.408878, 0, 0.6392157, 1, 1,
0.2095408, 0.3007672, 0.7150948, 0, 0.6352941, 1, 1,
0.210999, 0.4516963, -0.2793292, 0, 0.627451, 1, 1,
0.2114486, 1.50389, -0.582402, 0, 0.6235294, 1, 1,
0.2125454, 2.482612, 1.435237, 0, 0.6156863, 1, 1,
0.2141974, 0.8579016, 0.206029, 0, 0.6117647, 1, 1,
0.2163609, -1.377875, 2.92131, 0, 0.6039216, 1, 1,
0.2195175, 0.2894833, 1.379675, 0, 0.5960785, 1, 1,
0.2262404, 1.299035, 0.5638787, 0, 0.5921569, 1, 1,
0.2262515, 1.265662, -1.176674, 0, 0.5843138, 1, 1,
0.2290811, 0.2595661, 0.6850598, 0, 0.5803922, 1, 1,
0.2342716, -0.6941301, 1.766959, 0, 0.572549, 1, 1,
0.2343839, -0.2643621, 1.889361, 0, 0.5686275, 1, 1,
0.2348635, 0.1579739, 1.434299, 0, 0.5607843, 1, 1,
0.236836, -0.7259645, 3.289527, 0, 0.5568628, 1, 1,
0.2409956, -0.4896992, 1.619324, 0, 0.5490196, 1, 1,
0.2443585, 1.408058, 2.416326, 0, 0.5450981, 1, 1,
0.2445968, 0.5653249, 0.6392553, 0, 0.5372549, 1, 1,
0.2499308, 1.059616, 2.007989, 0, 0.5333334, 1, 1,
0.253163, -0.6866705, 3.354032, 0, 0.5254902, 1, 1,
0.2567991, -0.9862928, 3.818071, 0, 0.5215687, 1, 1,
0.2578287, -0.3925889, 2.210763, 0, 0.5137255, 1, 1,
0.2588421, 2.066561, 0.1829655, 0, 0.509804, 1, 1,
0.2610878, 0.6903995, 0.8266377, 0, 0.5019608, 1, 1,
0.2619527, -0.1238056, 2.335955, 0, 0.4941176, 1, 1,
0.2638909, -0.582387, 4.077962, 0, 0.4901961, 1, 1,
0.267679, 0.4198349, -0.4814241, 0, 0.4823529, 1, 1,
0.2726364, -0.2890349, 1.088578, 0, 0.4784314, 1, 1,
0.2730285, 0.7842989, 0.5730019, 0, 0.4705882, 1, 1,
0.2823578, -0.4648425, 2.363474, 0, 0.4666667, 1, 1,
0.2874147, -1.288464, 0.4766528, 0, 0.4588235, 1, 1,
0.2882385, 0.6629604, 0.8755255, 0, 0.454902, 1, 1,
0.2903309, 0.8403978, 0.9557971, 0, 0.4470588, 1, 1,
0.2913096, -1.638126, 3.962609, 0, 0.4431373, 1, 1,
0.2919377, 2.168689, 1.349021, 0, 0.4352941, 1, 1,
0.2978238, 0.4820616, 0.7068563, 0, 0.4313726, 1, 1,
0.2996, -1.638845, 3.773705, 0, 0.4235294, 1, 1,
0.3000522, -0.7880153, 4.834599, 0, 0.4196078, 1, 1,
0.3011905, 1.092666, 0.5386189, 0, 0.4117647, 1, 1,
0.3013988, 0.4150969, -0.3316475, 0, 0.4078431, 1, 1,
0.3015543, 0.7871134, -0.35064, 0, 0.4, 1, 1,
0.301681, 0.3291512, -0.2500003, 0, 0.3921569, 1, 1,
0.3049384, -1.066035, 4.004575, 0, 0.3882353, 1, 1,
0.3083805, 1.023239, -0.6755998, 0, 0.3803922, 1, 1,
0.3097616, 0.09994476, 1.648643, 0, 0.3764706, 1, 1,
0.3160466, 1.449862, 0.6156274, 0, 0.3686275, 1, 1,
0.3182017, 1.30012, -0.02177623, 0, 0.3647059, 1, 1,
0.3184009, 0.7591731, -0.7811552, 0, 0.3568628, 1, 1,
0.3235751, -0.3768383, 2.944111, 0, 0.3529412, 1, 1,
0.3254064, -0.7178353, 1.954945, 0, 0.345098, 1, 1,
0.3255588, 0.1636061, 0.8209975, 0, 0.3411765, 1, 1,
0.3300158, -0.7489861, 4.550488, 0, 0.3333333, 1, 1,
0.3305042, -2.829767, 2.719, 0, 0.3294118, 1, 1,
0.3318752, -1.245774, 2.954151, 0, 0.3215686, 1, 1,
0.3326365, -1.852372, 1.379935, 0, 0.3176471, 1, 1,
0.3331324, 0.1020334, 1.463813, 0, 0.3098039, 1, 1,
0.3342817, -0.1632943, 3.579269, 0, 0.3058824, 1, 1,
0.3361211, -2.69924, 3.338397, 0, 0.2980392, 1, 1,
0.3400074, -0.2197073, 2.675017, 0, 0.2901961, 1, 1,
0.3410561, 1.057515, 0.5453625, 0, 0.2862745, 1, 1,
0.3442132, 2.614656, 0.5808019, 0, 0.2784314, 1, 1,
0.3453968, -0.2307997, 2.711453, 0, 0.2745098, 1, 1,
0.3549679, -0.9425498, 0.8904203, 0, 0.2666667, 1, 1,
0.3573712, -0.3535354, 2.671563, 0, 0.2627451, 1, 1,
0.3577192, -0.5440624, 2.508046, 0, 0.254902, 1, 1,
0.3599549, -0.7064742, 0.4958579, 0, 0.2509804, 1, 1,
0.3719125, 0.2948433, 1.3551, 0, 0.2431373, 1, 1,
0.3735764, -0.7880313, 2.663696, 0, 0.2392157, 1, 1,
0.3762317, 1.221541, -0.2707694, 0, 0.2313726, 1, 1,
0.3766012, 1.796808, -1.739737, 0, 0.227451, 1, 1,
0.3767592, -0.3371305, 0.9359486, 0, 0.2196078, 1, 1,
0.3776542, -0.7531841, 3.790006, 0, 0.2156863, 1, 1,
0.3792628, -0.1543577, 1.570186, 0, 0.2078431, 1, 1,
0.3859848, 0.4593271, 0.3721675, 0, 0.2039216, 1, 1,
0.3878494, -0.2584604, 1.665585, 0, 0.1960784, 1, 1,
0.3919966, -0.009467314, -0.1298524, 0, 0.1882353, 1, 1,
0.3924358, -0.7168887, 2.262547, 0, 0.1843137, 1, 1,
0.3962274, 0.02398307, 2.985134, 0, 0.1764706, 1, 1,
0.3992211, 0.5029811, -0.1296271, 0, 0.172549, 1, 1,
0.401568, -0.04876375, 0.522848, 0, 0.1647059, 1, 1,
0.4019515, 0.796945, -1.411625, 0, 0.1607843, 1, 1,
0.4043418, 1.808943, -1.620419, 0, 0.1529412, 1, 1,
0.4105572, -1.27845, 2.422711, 0, 0.1490196, 1, 1,
0.4114544, -0.2353026, 2.138527, 0, 0.1411765, 1, 1,
0.413701, 0.511885, 1.392139, 0, 0.1372549, 1, 1,
0.4156053, -0.1861502, 1.84524, 0, 0.1294118, 1, 1,
0.4171025, -0.4036598, 1.235881, 0, 0.1254902, 1, 1,
0.4192523, -0.04778591, 2.321361, 0, 0.1176471, 1, 1,
0.421111, -0.2031052, 1.285955, 0, 0.1137255, 1, 1,
0.429511, -2.119913, 2.739772, 0, 0.1058824, 1, 1,
0.4302826, -0.1595708, 0.3865248, 0, 0.09803922, 1, 1,
0.4309177, -0.6328642, 3.084412, 0, 0.09411765, 1, 1,
0.4324959, 0.5492129, 0.6535069, 0, 0.08627451, 1, 1,
0.4361553, 1.743709, 0.453869, 0, 0.08235294, 1, 1,
0.4392425, 0.4711642, 1.476504, 0, 0.07450981, 1, 1,
0.441947, 0.1151354, 0.8724176, 0, 0.07058824, 1, 1,
0.4440345, -1.083669, 0.5379233, 0, 0.0627451, 1, 1,
0.4440618, 0.7084479, 2.135282, 0, 0.05882353, 1, 1,
0.4464134, -0.9914791, 4.43182, 0, 0.05098039, 1, 1,
0.4499401, -0.9409038, 3.443968, 0, 0.04705882, 1, 1,
0.4502953, -1.642151, 3.116103, 0, 0.03921569, 1, 1,
0.4505436, -0.3571416, 1.476366, 0, 0.03529412, 1, 1,
0.4511575, 0.1517901, 3.188799, 0, 0.02745098, 1, 1,
0.4525436, -0.5417824, 1.146551, 0, 0.02352941, 1, 1,
0.4531204, -0.5420919, 3.118038, 0, 0.01568628, 1, 1,
0.4546915, 1.9796, 0.7280259, 0, 0.01176471, 1, 1,
0.4558771, 1.468707, -0.4432233, 0, 0.003921569, 1, 1,
0.4593066, -0.3380113, 2.899563, 0.003921569, 0, 1, 1,
0.4616778, 0.6408114, 1.226994, 0.007843138, 0, 1, 1,
0.4661612, 0.1905455, 1.556174, 0.01568628, 0, 1, 1,
0.4698044, 0.9103789, -0.522597, 0.01960784, 0, 1, 1,
0.4727411, 0.6471485, 0.5009746, 0.02745098, 0, 1, 1,
0.4808538, -1.187309, 3.469707, 0.03137255, 0, 1, 1,
0.4821564, 0.2199897, 0.3143273, 0.03921569, 0, 1, 1,
0.4840249, 0.05847006, 2.597706, 0.04313726, 0, 1, 1,
0.4947601, -0.8020368, 3.613399, 0.05098039, 0, 1, 1,
0.4949189, -0.5356726, 2.214016, 0.05490196, 0, 1, 1,
0.495289, -1.290335, 3.728352, 0.0627451, 0, 1, 1,
0.4960011, -0.2909116, 2.957913, 0.06666667, 0, 1, 1,
0.4983771, 1.543548, 0.7133706, 0.07450981, 0, 1, 1,
0.5002536, 1.24927, -0.1617735, 0.07843138, 0, 1, 1,
0.5004835, 0.2506376, 0.915648, 0.08627451, 0, 1, 1,
0.5038964, 0.8935252, 0.09986065, 0.09019608, 0, 1, 1,
0.5044142, 1.015205, 1.424822, 0.09803922, 0, 1, 1,
0.504649, -0.5128457, 2.240376, 0.1058824, 0, 1, 1,
0.5065593, 0.607086, -0.8524716, 0.1098039, 0, 1, 1,
0.5124336, -0.3171937, 1.554369, 0.1176471, 0, 1, 1,
0.5145431, 0.6437118, -0.4739479, 0.1215686, 0, 1, 1,
0.5164772, -0.5257035, 1.612745, 0.1294118, 0, 1, 1,
0.518273, 1.078581, 0.3670479, 0.1333333, 0, 1, 1,
0.5213015, 0.3686962, 1.509465, 0.1411765, 0, 1, 1,
0.5268325, 1.316156, 0.7140945, 0.145098, 0, 1, 1,
0.5269331, 0.6086566, 2.610936, 0.1529412, 0, 1, 1,
0.5286524, 0.4724648, 0.1191945, 0.1568628, 0, 1, 1,
0.5303614, 1.261022, -0.01057479, 0.1647059, 0, 1, 1,
0.5338899, 0.02701711, 1.040101, 0.1686275, 0, 1, 1,
0.5355706, 1.833726, -0.9115184, 0.1764706, 0, 1, 1,
0.5382023, -0.7160463, 3.378397, 0.1803922, 0, 1, 1,
0.5401655, 0.9680533, -0.3971474, 0.1882353, 0, 1, 1,
0.5410406, -0.04867332, 2.913264, 0.1921569, 0, 1, 1,
0.5457981, 0.3787436, 1.498734, 0.2, 0, 1, 1,
0.546591, -0.09949788, 3.327396, 0.2078431, 0, 1, 1,
0.5488937, -1.976671, 3.016317, 0.2117647, 0, 1, 1,
0.5493494, -0.2147429, 2.522806, 0.2196078, 0, 1, 1,
0.5524451, -1.387592, 3.424991, 0.2235294, 0, 1, 1,
0.5583944, 0.05780467, 1.633324, 0.2313726, 0, 1, 1,
0.5640444, 1.313462, 0.4866231, 0.2352941, 0, 1, 1,
0.5642011, 1.368162, -0.885325, 0.2431373, 0, 1, 1,
0.5672495, -0.4205473, 0.1891815, 0.2470588, 0, 1, 1,
0.5705002, 0.2731466, 1.781989, 0.254902, 0, 1, 1,
0.5732763, 0.1775675, 1.113978, 0.2588235, 0, 1, 1,
0.5739694, 1.168285, 0.2692747, 0.2666667, 0, 1, 1,
0.5741721, 0.4640215, 0.7030864, 0.2705882, 0, 1, 1,
0.5743355, 0.7065232, -0.844089, 0.2784314, 0, 1, 1,
0.5757167, 0.9707486, 0.2254625, 0.282353, 0, 1, 1,
0.5761335, -2.38661, 2.750019, 0.2901961, 0, 1, 1,
0.5778148, 1.126782, 1.148241, 0.2941177, 0, 1, 1,
0.5839843, 0.8024991, 1.941092, 0.3019608, 0, 1, 1,
0.5881212, 0.4973519, 3.272913, 0.3098039, 0, 1, 1,
0.5887631, 0.1548015, 2.2257, 0.3137255, 0, 1, 1,
0.5894284, 0.2247182, -0.6291689, 0.3215686, 0, 1, 1,
0.5896503, -0.9292606, 2.349441, 0.3254902, 0, 1, 1,
0.5899118, 0.1981323, 1.52257, 0.3333333, 0, 1, 1,
0.5923926, 2.440611, 0.4480655, 0.3372549, 0, 1, 1,
0.5948906, 1.616914, -0.2714512, 0.345098, 0, 1, 1,
0.5973705, 0.4390242, 2.352981, 0.3490196, 0, 1, 1,
0.6048325, 0.1231621, 1.043804, 0.3568628, 0, 1, 1,
0.6054829, 0.6528232, 1.247979, 0.3607843, 0, 1, 1,
0.6109891, -0.286019, 1.912516, 0.3686275, 0, 1, 1,
0.6169713, -1.150691, -0.3853803, 0.372549, 0, 1, 1,
0.6219323, -1.166493, 3.18375, 0.3803922, 0, 1, 1,
0.6230064, -0.4748821, 2.812669, 0.3843137, 0, 1, 1,
0.626949, -0.6945249, 2.70084, 0.3921569, 0, 1, 1,
0.6322916, 0.6399621, 0.1411767, 0.3960784, 0, 1, 1,
0.6331152, -0.03571282, 3.458165, 0.4039216, 0, 1, 1,
0.6352435, 1.074186, 0.3270252, 0.4117647, 0, 1, 1,
0.6360022, -0.2977841, 1.967569, 0.4156863, 0, 1, 1,
0.6360444, 0.2790562, 3.294129, 0.4235294, 0, 1, 1,
0.6402847, 0.158066, 0.75442, 0.427451, 0, 1, 1,
0.6433627, 0.1169493, 0.9713634, 0.4352941, 0, 1, 1,
0.644892, -0.6578701, 3.392451, 0.4392157, 0, 1, 1,
0.6502553, -0.2012154, 2.269945, 0.4470588, 0, 1, 1,
0.6641546, 0.1071101, -0.7644023, 0.4509804, 0, 1, 1,
0.6648067, 0.5816118, 0.4355299, 0.4588235, 0, 1, 1,
0.6841808, 2.302193, -0.286087, 0.4627451, 0, 1, 1,
0.6892397, -1.68645, 4.285411, 0.4705882, 0, 1, 1,
0.6898572, -1.720764, 2.328697, 0.4745098, 0, 1, 1,
0.6911551, 1.48501, 0.3654191, 0.4823529, 0, 1, 1,
0.6942127, 1.559382, 0.3724318, 0.4862745, 0, 1, 1,
0.7056283, -0.05917762, 1.698722, 0.4941176, 0, 1, 1,
0.706257, 0.2226073, -0.1452808, 0.5019608, 0, 1, 1,
0.7090257, -0.4842821, 2.086654, 0.5058824, 0, 1, 1,
0.7142998, 0.8751406, -0.5473315, 0.5137255, 0, 1, 1,
0.7211967, 1.556578, 1.269339, 0.5176471, 0, 1, 1,
0.7225022, -0.1166771, 3.13235, 0.5254902, 0, 1, 1,
0.7277274, -0.1760225, 0.652273, 0.5294118, 0, 1, 1,
0.7298551, -1.25169, 3.205098, 0.5372549, 0, 1, 1,
0.7319868, 1.205281, 2.298182, 0.5411765, 0, 1, 1,
0.7333094, 0.3488411, 1.915218, 0.5490196, 0, 1, 1,
0.736136, 0.5852564, 0.3529024, 0.5529412, 0, 1, 1,
0.7487385, 0.4368171, 0.8243665, 0.5607843, 0, 1, 1,
0.7502831, -0.522662, 1.408864, 0.5647059, 0, 1, 1,
0.7563736, 0.06469977, 1.809677, 0.572549, 0, 1, 1,
0.7572929, 0.3404177, 1.414326, 0.5764706, 0, 1, 1,
0.7574773, -1.939567, 2.26146, 0.5843138, 0, 1, 1,
0.7689409, -0.8633838, 3.754856, 0.5882353, 0, 1, 1,
0.769447, 0.8737828, -0.2317324, 0.5960785, 0, 1, 1,
0.7741931, 1.463146, -0.542656, 0.6039216, 0, 1, 1,
0.7751007, 0.2797187, 0.8748206, 0.6078432, 0, 1, 1,
0.7764704, 0.7035719, 1.103261, 0.6156863, 0, 1, 1,
0.7787474, -0.7568662, 4.214592, 0.6196079, 0, 1, 1,
0.78484, -0.5079406, 2.65346, 0.627451, 0, 1, 1,
0.7857713, -0.1174434, 1.823911, 0.6313726, 0, 1, 1,
0.7875094, -1.562952, 2.25652, 0.6392157, 0, 1, 1,
0.7888508, 0.4443276, 2.2379, 0.6431373, 0, 1, 1,
0.7906685, -0.6517749, 3.652837, 0.6509804, 0, 1, 1,
0.7942374, 0.7710389, 1.312739, 0.654902, 0, 1, 1,
0.7943956, -0.06534676, 2.03555, 0.6627451, 0, 1, 1,
0.7948822, 0.3184327, 2.771316, 0.6666667, 0, 1, 1,
0.8087571, -0.1644367, 2.166584, 0.6745098, 0, 1, 1,
0.809532, -0.9216883, 2.311113, 0.6784314, 0, 1, 1,
0.8107315, -1.537056, 1.929809, 0.6862745, 0, 1, 1,
0.8148661, -0.4123848, 2.7385, 0.6901961, 0, 1, 1,
0.8186083, 0.4075064, 2.161522, 0.6980392, 0, 1, 1,
0.8206038, -0.2764004, 1.88958, 0.7058824, 0, 1, 1,
0.8219593, 0.393586, -0.7525735, 0.7098039, 0, 1, 1,
0.8276668, 0.07319437, 0.7110618, 0.7176471, 0, 1, 1,
0.8288398, 1.166474, 4.054106, 0.7215686, 0, 1, 1,
0.8353735, -1.333786, 2.675122, 0.7294118, 0, 1, 1,
0.8386642, 1.830675, 0.1758499, 0.7333333, 0, 1, 1,
0.8426677, 0.6303347, 0.4470788, 0.7411765, 0, 1, 1,
0.8433087, -1.379868, 1.141551, 0.7450981, 0, 1, 1,
0.8434462, 0.5820531, 2.092546, 0.7529412, 0, 1, 1,
0.8469723, -0.3471136, 0.4400879, 0.7568628, 0, 1, 1,
0.8506156, 1.204499, 1.182785, 0.7647059, 0, 1, 1,
0.8521771, -1.838312, 2.185305, 0.7686275, 0, 1, 1,
0.8531475, 1.219333, 0.6796674, 0.7764706, 0, 1, 1,
0.8565411, 0.297773, -0.6557065, 0.7803922, 0, 1, 1,
0.8571423, 0.2199408, 1.647773, 0.7882353, 0, 1, 1,
0.8627369, -0.1261273, 3.964337, 0.7921569, 0, 1, 1,
0.8649163, -0.6668949, 3.869635, 0.8, 0, 1, 1,
0.8652244, 0.6872835, -0.7557175, 0.8078431, 0, 1, 1,
0.865626, 2.611367, 2.265167, 0.8117647, 0, 1, 1,
0.8684062, -0.8580465, 1.941331, 0.8196079, 0, 1, 1,
0.8724339, -0.2167776, 0.652477, 0.8235294, 0, 1, 1,
0.8751074, 0.2522485, 0.9412978, 0.8313726, 0, 1, 1,
0.8771699, -1.899458, 0.9033805, 0.8352941, 0, 1, 1,
0.8792768, 1.022108, -0.06375689, 0.8431373, 0, 1, 1,
0.8793848, -0.899841, 3.201657, 0.8470588, 0, 1, 1,
0.8846031, -0.06602161, 2.221467, 0.854902, 0, 1, 1,
0.8847741, -1.024452, -0.185341, 0.8588235, 0, 1, 1,
0.8929774, 1.227017, 0.1804005, 0.8666667, 0, 1, 1,
0.893324, -0.502214, 2.20289, 0.8705882, 0, 1, 1,
0.8948557, -0.09898139, 2.072247, 0.8784314, 0, 1, 1,
0.9003287, -1.538306, 4.406334, 0.8823529, 0, 1, 1,
0.9010352, 1.986071, 0.3629266, 0.8901961, 0, 1, 1,
0.9113228, 0.2103905, 2.122546, 0.8941177, 0, 1, 1,
0.9115176, 1.275034, 0.3702979, 0.9019608, 0, 1, 1,
0.9163598, -0.6494257, 2.297069, 0.9098039, 0, 1, 1,
0.9209387, 0.7144111, 1.146755, 0.9137255, 0, 1, 1,
0.9257864, 0.4441687, -0.2683748, 0.9215686, 0, 1, 1,
0.9261163, 0.05802721, 2.559571, 0.9254902, 0, 1, 1,
0.9294232, -0.2481108, 2.640582, 0.9333333, 0, 1, 1,
0.9301177, 0.8502624, 1.494329, 0.9372549, 0, 1, 1,
0.9306471, -0.6754088, 1.451882, 0.945098, 0, 1, 1,
0.9375875, -1.531843, 1.436133, 0.9490196, 0, 1, 1,
0.9396947, 0.2132034, 2.398594, 0.9568627, 0, 1, 1,
0.9446217, -0.7343355, 3.490721, 0.9607843, 0, 1, 1,
0.9484265, -0.6159967, 2.807747, 0.9686275, 0, 1, 1,
0.9594269, 1.020322, 1.48273, 0.972549, 0, 1, 1,
0.9608093, 1.025283, -0.7328095, 0.9803922, 0, 1, 1,
0.9617649, 2.243859, 1.31741, 0.9843137, 0, 1, 1,
0.9807392, -0.9446261, 1.812494, 0.9921569, 0, 1, 1,
0.9822389, 0.8588833, 1.811571, 0.9960784, 0, 1, 1,
0.9847074, -0.3973162, 1.884116, 1, 0, 0.9960784, 1,
0.9868401, -1.005884, 2.349659, 1, 0, 0.9882353, 1,
0.9906971, 1.430883, 1.204743, 1, 0, 0.9843137, 1,
0.9921125, 1.692931, -1.83674, 1, 0, 0.9764706, 1,
1.002004, 0.6660107, 0.3693652, 1, 0, 0.972549, 1,
1.003518, -0.04139254, 2.451078, 1, 0, 0.9647059, 1,
1.014297, 0.7775755, 0.4137362, 1, 0, 0.9607843, 1,
1.018297, -1.176678, 1.821255, 1, 0, 0.9529412, 1,
1.027277, -0.8427889, 2.644192, 1, 0, 0.9490196, 1,
1.027284, 3.268817, -2.915637, 1, 0, 0.9411765, 1,
1.029328, 0.6309676, 2.455564, 1, 0, 0.9372549, 1,
1.032399, -0.9690698, 2.303039, 1, 0, 0.9294118, 1,
1.032735, 0.6818168, 0.5291629, 1, 0, 0.9254902, 1,
1.033245, 1.336284, 0.3078149, 1, 0, 0.9176471, 1,
1.03794, 0.6456864, -0.4203308, 1, 0, 0.9137255, 1,
1.039479, -1.478507, 2.230854, 1, 0, 0.9058824, 1,
1.040384, 0.3172409, -0.2200834, 1, 0, 0.9019608, 1,
1.048486, 0.1946419, 1.915987, 1, 0, 0.8941177, 1,
1.055733, 1.352508, 1.032536, 1, 0, 0.8862745, 1,
1.063615, 0.4940369, 2.768351, 1, 0, 0.8823529, 1,
1.072681, -0.2260914, 1.614185, 1, 0, 0.8745098, 1,
1.080679, 0.4716417, 0.1856878, 1, 0, 0.8705882, 1,
1.089686, 1.178261, -0.9091874, 1, 0, 0.8627451, 1,
1.097722, 1.192657, 0.8303158, 1, 0, 0.8588235, 1,
1.102445, 0.7552767, 0.8435212, 1, 0, 0.8509804, 1,
1.113512, 0.9393231, 2.412014, 1, 0, 0.8470588, 1,
1.117702, -1.059847, 1.922219, 1, 0, 0.8392157, 1,
1.145763, 0.7297176, 1.748654, 1, 0, 0.8352941, 1,
1.149517, 0.2413271, 2.70727, 1, 0, 0.827451, 1,
1.161265, -1.168953, 2.562554, 1, 0, 0.8235294, 1,
1.167193, -1.141147, 1.50389, 1, 0, 0.8156863, 1,
1.168396, 0.3173925, 3.130595, 1, 0, 0.8117647, 1,
1.184435, -0.318597, 3.414163, 1, 0, 0.8039216, 1,
1.195919, -2.269177, 3.446209, 1, 0, 0.7960784, 1,
1.201057, -0.5110452, 1.568058, 1, 0, 0.7921569, 1,
1.210778, -0.1593186, 3.516888, 1, 0, 0.7843137, 1,
1.225294, 1.481673, 0.8758299, 1, 0, 0.7803922, 1,
1.228681, -0.5797906, 1.253434, 1, 0, 0.772549, 1,
1.240132, -0.7631716, 3.411771, 1, 0, 0.7686275, 1,
1.243069, -1.458218, 4.147233, 1, 0, 0.7607843, 1,
1.24499, 0.7920012, 0.6471362, 1, 0, 0.7568628, 1,
1.250183, -0.1481652, 1.636396, 1, 0, 0.7490196, 1,
1.256475, -0.09664045, 1.81651, 1, 0, 0.7450981, 1,
1.256721, 2.127665, 1.01701, 1, 0, 0.7372549, 1,
1.257555, -0.1815563, 1.749956, 1, 0, 0.7333333, 1,
1.262931, 0.5228298, 0.4388901, 1, 0, 0.7254902, 1,
1.275271, -0.1049676, 1.381115, 1, 0, 0.7215686, 1,
1.276325, -1.010952, 2.216458, 1, 0, 0.7137255, 1,
1.281299, -1.093959, 1.505308, 1, 0, 0.7098039, 1,
1.283764, -2.606566, 4.202268, 1, 0, 0.7019608, 1,
1.288488, -1.228924, 0.05646709, 1, 0, 0.6941177, 1,
1.291656, -0.4663706, 0.917895, 1, 0, 0.6901961, 1,
1.295867, -0.9715055, 2.64606, 1, 0, 0.682353, 1,
1.300607, -0.6474564, 3.108361, 1, 0, 0.6784314, 1,
1.30189, 0.4000656, 0.8495226, 1, 0, 0.6705883, 1,
1.302337, 1.242014, 1.150673, 1, 0, 0.6666667, 1,
1.320179, 0.9578317, 0.189775, 1, 0, 0.6588235, 1,
1.32093, 2.229251, 0.3617245, 1, 0, 0.654902, 1,
1.322182, -0.5980493, 2.065282, 1, 0, 0.6470588, 1,
1.324843, -0.0805558, 1.671579, 1, 0, 0.6431373, 1,
1.328702, 0.8559754, 1.143924, 1, 0, 0.6352941, 1,
1.34751, 1.638195, 1.263626, 1, 0, 0.6313726, 1,
1.353419, -0.1600523, 2.009007, 1, 0, 0.6235294, 1,
1.356149, -0.4810491, 1.563238, 1, 0, 0.6196079, 1,
1.366991, -0.1393952, 1.469537, 1, 0, 0.6117647, 1,
1.370016, -0.2428948, 0.2369184, 1, 0, 0.6078432, 1,
1.375076, -0.2104421, 0.852751, 1, 0, 0.6, 1,
1.375256, 0.261241, 1.173415, 1, 0, 0.5921569, 1,
1.377294, -0.05855294, 2.500874, 1, 0, 0.5882353, 1,
1.383398, 0.551124, 0.03330192, 1, 0, 0.5803922, 1,
1.39419, -1.668077, 1.078288, 1, 0, 0.5764706, 1,
1.395569, -0.2394354, 2.233218, 1, 0, 0.5686275, 1,
1.403388, 0.02633156, 0.6305792, 1, 0, 0.5647059, 1,
1.409934, 2.32635, -0.4674762, 1, 0, 0.5568628, 1,
1.412673, 0.5543002, 2.194822, 1, 0, 0.5529412, 1,
1.420676, -0.2309769, 1.353578, 1, 0, 0.5450981, 1,
1.422136, 1.443994, 0.3619567, 1, 0, 0.5411765, 1,
1.433128, 0.7048494, 0.8913711, 1, 0, 0.5333334, 1,
1.43398, 0.609166, 0.9796975, 1, 0, 0.5294118, 1,
1.435972, 1.35924, 1.368202, 1, 0, 0.5215687, 1,
1.438957, -0.9595048, 2.010452, 1, 0, 0.5176471, 1,
1.45237, -0.8384652, 1.97192, 1, 0, 0.509804, 1,
1.456331, -2.402374, 2.245504, 1, 0, 0.5058824, 1,
1.461284, 2.562251, 1.815002, 1, 0, 0.4980392, 1,
1.463675, 0.2791864, 0.3179429, 1, 0, 0.4901961, 1,
1.464932, 0.4009177, 0.9958696, 1, 0, 0.4862745, 1,
1.470807, 0.2703406, 2.105848, 1, 0, 0.4784314, 1,
1.473813, -0.5014631, 2.615427, 1, 0, 0.4745098, 1,
1.502639, 1.370914, 1.018295, 1, 0, 0.4666667, 1,
1.512436, -0.357861, 2.494746, 1, 0, 0.4627451, 1,
1.513214, 0.7490385, 1.801474, 1, 0, 0.454902, 1,
1.517154, 0.4358455, 1.194258, 1, 0, 0.4509804, 1,
1.51825, -0.2371497, 0.2863582, 1, 0, 0.4431373, 1,
1.522076, 1.24784, 0.8869438, 1, 0, 0.4392157, 1,
1.527372, -0.7440776, 1.874571, 1, 0, 0.4313726, 1,
1.531264, -0.7142159, 1.918549, 1, 0, 0.427451, 1,
1.532743, 1.940999, 1.215472, 1, 0, 0.4196078, 1,
1.535135, 0.4558781, 1.020259, 1, 0, 0.4156863, 1,
1.543162, 2.47823, -0.1987954, 1, 0, 0.4078431, 1,
1.544656, 0.272703, 2.013695, 1, 0, 0.4039216, 1,
1.550841, 0.08504085, 1.31025, 1, 0, 0.3960784, 1,
1.555147, -0.8532594, 1.942235, 1, 0, 0.3882353, 1,
1.559678, 0.2416747, 3.018004, 1, 0, 0.3843137, 1,
1.567158, 1.407485, 0.2246165, 1, 0, 0.3764706, 1,
1.567587, 0.0330946, 2.421212, 1, 0, 0.372549, 1,
1.568411, 0.9816642, 2.092165, 1, 0, 0.3647059, 1,
1.577675, 0.2160886, 1.487512, 1, 0, 0.3607843, 1,
1.579761, -1.009758, 4.333784, 1, 0, 0.3529412, 1,
1.582021, -0.2198395, 1.950194, 1, 0, 0.3490196, 1,
1.584394, 0.2631676, 1.433469, 1, 0, 0.3411765, 1,
1.602856, -1.096908, 3.524663, 1, 0, 0.3372549, 1,
1.605596, -1.041874, 0.4959404, 1, 0, 0.3294118, 1,
1.612422, 0.4901103, 2.018609, 1, 0, 0.3254902, 1,
1.617522, -0.05775027, 1.8997, 1, 0, 0.3176471, 1,
1.647119, -0.6782014, 2.928593, 1, 0, 0.3137255, 1,
1.65776, -0.385214, 3.071631, 1, 0, 0.3058824, 1,
1.668373, -0.4130665, 1.666751, 1, 0, 0.2980392, 1,
1.673355, -0.4006124, 1.37925, 1, 0, 0.2941177, 1,
1.674181, -0.1193407, 2.384747, 1, 0, 0.2862745, 1,
1.680526, 1.644103, 0.7400709, 1, 0, 0.282353, 1,
1.685541, -0.4483061, 2.816789, 1, 0, 0.2745098, 1,
1.692261, 0.4185778, 0.3698249, 1, 0, 0.2705882, 1,
1.703274, -0.8365571, 1.682712, 1, 0, 0.2627451, 1,
1.712418, -1.007879, 2.188525, 1, 0, 0.2588235, 1,
1.73739, -0.06245532, -0.2145634, 1, 0, 0.2509804, 1,
1.75916, 0.0001682865, 0.9000828, 1, 0, 0.2470588, 1,
1.763816, -0.01473338, 3.468743, 1, 0, 0.2392157, 1,
1.771404, -0.1721977, 2.448332, 1, 0, 0.2352941, 1,
1.778306, -0.7012458, 2.58377, 1, 0, 0.227451, 1,
1.787543, 0.4204441, 1.492704, 1, 0, 0.2235294, 1,
1.790405, -1.210948, 2.268113, 1, 0, 0.2156863, 1,
1.806338, -0.9279203, 3.679734, 1, 0, 0.2117647, 1,
1.811972, 0.897553, 1.096136, 1, 0, 0.2039216, 1,
1.814468, -0.7737968, 1.363299, 1, 0, 0.1960784, 1,
1.818928, -0.8394958, 3.145878, 1, 0, 0.1921569, 1,
1.828716, -0.2850092, 1.071892, 1, 0, 0.1843137, 1,
1.829948, -0.4509477, 2.433712, 1, 0, 0.1803922, 1,
1.852611, -0.1123515, 2.948075, 1, 0, 0.172549, 1,
1.874149, -0.3047921, 2.74452, 1, 0, 0.1686275, 1,
1.879072, -2.37339, 1.964182, 1, 0, 0.1607843, 1,
1.882204, 0.1478391, 0.90834, 1, 0, 0.1568628, 1,
1.969071, 0.6430476, 0.597066, 1, 0, 0.1490196, 1,
2.047821, -0.281137, 3.223393, 1, 0, 0.145098, 1,
2.084405, 1.963669, 2.559673, 1, 0, 0.1372549, 1,
2.119224, -0.4930595, 2.642391, 1, 0, 0.1333333, 1,
2.138749, 1.256591, 2.127646, 1, 0, 0.1254902, 1,
2.161828, 0.8309644, 1.481426, 1, 0, 0.1215686, 1,
2.17633, 2.163043, 0.6588497, 1, 0, 0.1137255, 1,
2.179009, -0.978457, 2.506754, 1, 0, 0.1098039, 1,
2.198915, 0.4238981, 1.604869, 1, 0, 0.1019608, 1,
2.201029, 0.3310449, 1.017398, 1, 0, 0.09411765, 1,
2.213078, 0.9613373, 2.188074, 1, 0, 0.09019608, 1,
2.226397, -0.04258601, 1.359671, 1, 0, 0.08235294, 1,
2.237815, -0.5850425, -1.29769, 1, 0, 0.07843138, 1,
2.250654, -0.2943712, 1.745754, 1, 0, 0.07058824, 1,
2.402831, -1.070306, 1.531419, 1, 0, 0.06666667, 1,
2.56818, 1.249941, 3.730706, 1, 0, 0.05882353, 1,
2.580975, -0.13679, 2.064059, 1, 0, 0.05490196, 1,
2.615197, 1.152704, 0.513289, 1, 0, 0.04705882, 1,
2.615232, -0.6026565, 3.003444, 1, 0, 0.04313726, 1,
2.658934, 1.111616, 1.45298, 1, 0, 0.03529412, 1,
2.69683, -0.04159968, 1.801085, 1, 0, 0.03137255, 1,
2.85302, -0.1448424, 2.465661, 1, 0, 0.02352941, 1,
2.900666, 0.8128899, 0.336544, 1, 0, 0.01960784, 1,
2.9836, 0.6160335, 1.275835, 1, 0, 0.01176471, 1,
3.505278, -1.03135, 2.385573, 1, 0, 0.007843138, 1
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
0.08360672, -4.141699, -6.88853, 0, -0.5, 0.5, 0.5,
0.08360672, -4.141699, -6.88853, 1, -0.5, 0.5, 0.5,
0.08360672, -4.141699, -6.88853, 1, 1.5, 0.5, 0.5,
0.08360672, -4.141699, -6.88853, 0, 1.5, 0.5, 0.5
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
-4.498011, 0.1005757, -6.88853, 0, -0.5, 0.5, 0.5,
-4.498011, 0.1005757, -6.88853, 1, -0.5, 0.5, 0.5,
-4.498011, 0.1005757, -6.88853, 1, 1.5, 0.5, 0.5,
-4.498011, 0.1005757, -6.88853, 0, 1.5, 0.5, 0.5
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
-4.498011, -4.141699, -0.1774273, 0, -0.5, 0.5, 0.5,
-4.498011, -4.141699, -0.1774273, 1, -0.5, 0.5, 0.5,
-4.498011, -4.141699, -0.1774273, 1, 1.5, 0.5, 0.5,
-4.498011, -4.141699, -0.1774273, 0, 1.5, 0.5, 0.5
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
-3, -3.162713, -5.339814,
3, -3.162713, -5.339814,
-3, -3.162713, -5.339814,
-3, -3.325877, -5.597933,
-2, -3.162713, -5.339814,
-2, -3.325877, -5.597933,
-1, -3.162713, -5.339814,
-1, -3.325877, -5.597933,
0, -3.162713, -5.339814,
0, -3.325877, -5.597933,
1, -3.162713, -5.339814,
1, -3.325877, -5.597933,
2, -3.162713, -5.339814,
2, -3.325877, -5.597933,
3, -3.162713, -5.339814,
3, -3.325877, -5.597933
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
-3, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
-3, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
-3, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
-3, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
-2, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
-2, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
-2, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
-2, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
-1, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
-1, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
-1, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
-1, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
0, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
0, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
0, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
0, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
1, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
1, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
1, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
1, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
2, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
2, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
2, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
2, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5,
3, -3.652206, -6.114172, 0, -0.5, 0.5, 0.5,
3, -3.652206, -6.114172, 1, -0.5, 0.5, 0.5,
3, -3.652206, -6.114172, 1, 1.5, 0.5, 0.5,
3, -3.652206, -6.114172, 0, 1.5, 0.5, 0.5
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
-3.440715, -3, -5.339814,
-3.440715, 3, -5.339814,
-3.440715, -3, -5.339814,
-3.616931, -3, -5.597933,
-3.440715, -2, -5.339814,
-3.616931, -2, -5.597933,
-3.440715, -1, -5.339814,
-3.616931, -1, -5.597933,
-3.440715, 0, -5.339814,
-3.616931, 0, -5.597933,
-3.440715, 1, -5.339814,
-3.616931, 1, -5.597933,
-3.440715, 2, -5.339814,
-3.616931, 2, -5.597933,
-3.440715, 3, -5.339814,
-3.616931, 3, -5.597933
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
-3.969363, -3, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, -3, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, -3, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, -3, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, -2, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, -2, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, -2, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, -2, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, -1, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, -1, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, -1, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, -1, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, 0, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, 0, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, 0, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, 0, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, 1, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, 1, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, 1, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, 1, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, 2, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, 2, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, 2, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, 2, -6.114172, 0, 1.5, 0.5, 0.5,
-3.969363, 3, -6.114172, 0, -0.5, 0.5, 0.5,
-3.969363, 3, -6.114172, 1, -0.5, 0.5, 0.5,
-3.969363, 3, -6.114172, 1, 1.5, 0.5, 0.5,
-3.969363, 3, -6.114172, 0, 1.5, 0.5, 0.5
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
-3.440715, -3.162713, -4,
-3.440715, -3.162713, 4,
-3.440715, -3.162713, -4,
-3.616931, -3.325877, -4,
-3.440715, -3.162713, -2,
-3.616931, -3.325877, -2,
-3.440715, -3.162713, 0,
-3.616931, -3.325877, 0,
-3.440715, -3.162713, 2,
-3.616931, -3.325877, 2,
-3.440715, -3.162713, 4,
-3.616931, -3.325877, 4
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
-3.969363, -3.652206, -4, 0, -0.5, 0.5, 0.5,
-3.969363, -3.652206, -4, 1, -0.5, 0.5, 0.5,
-3.969363, -3.652206, -4, 1, 1.5, 0.5, 0.5,
-3.969363, -3.652206, -4, 0, 1.5, 0.5, 0.5,
-3.969363, -3.652206, -2, 0, -0.5, 0.5, 0.5,
-3.969363, -3.652206, -2, 1, -0.5, 0.5, 0.5,
-3.969363, -3.652206, -2, 1, 1.5, 0.5, 0.5,
-3.969363, -3.652206, -2, 0, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 0, 0, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 0, 1, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 0, 1, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 0, 0, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 2, 0, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 2, 1, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 2, 1, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 2, 0, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 4, 0, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 4, 1, -0.5, 0.5, 0.5,
-3.969363, -3.652206, 4, 1, 1.5, 0.5, 0.5,
-3.969363, -3.652206, 4, 0, 1.5, 0.5, 0.5
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
-3.440715, -3.162713, -5.339814,
-3.440715, 3.363864, -5.339814,
-3.440715, -3.162713, 4.984959,
-3.440715, 3.363864, 4.984959,
-3.440715, -3.162713, -5.339814,
-3.440715, -3.162713, 4.984959,
-3.440715, 3.363864, -5.339814,
-3.440715, 3.363864, 4.984959,
-3.440715, -3.162713, -5.339814,
3.607928, -3.162713, -5.339814,
-3.440715, -3.162713, 4.984959,
3.607928, -3.162713, 4.984959,
-3.440715, 3.363864, -5.339814,
3.607928, 3.363864, -5.339814,
-3.440715, 3.363864, 4.984959,
3.607928, 3.363864, 4.984959,
3.607928, -3.162713, -5.339814,
3.607928, 3.363864, -5.339814,
3.607928, -3.162713, 4.984959,
3.607928, 3.363864, 4.984959,
3.607928, -3.162713, -5.339814,
3.607928, -3.162713, 4.984959,
3.607928, 3.363864, -5.339814,
3.607928, 3.363864, 4.984959
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
var radius = 7.530461;
var distance = 33.50387;
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
mvMatrix.translate( -0.08360672, -0.1005757, 0.1774273 );
mvMatrix.scale( 1.155128, 1.247527, 0.7885967 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50387);
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
isoxazolidine<-read.table("isoxazolidine.xyz")
```

```
## Error in read.table("isoxazolidine.xyz"): no lines available in input
```

```r
x<-isoxazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
y<-isoxazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
z<-isoxazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
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
-3.338065, -0.8793158, -0.08394265, 0, 0, 1, 1, 1,
-2.940924, 1.06699, -1.118772, 1, 0, 0, 1, 1,
-2.879771, -0.3320794, -1.310578, 1, 0, 0, 1, 1,
-2.656455, 0.9588416, -1.998385, 1, 0, 0, 1, 1,
-2.643463, -0.1600116, -2.707266, 1, 0, 0, 1, 1,
-2.536211, -0.09956475, -2.375611, 1, 0, 0, 1, 1,
-2.514512, 0.822704, -0.6724572, 0, 0, 0, 1, 1,
-2.435636, 0.5489802, 0.02952195, 0, 0, 0, 1, 1,
-2.362187, -0.1655648, -2.242155, 0, 0, 0, 1, 1,
-2.339968, -0.1630402, -1.382795, 0, 0, 0, 1, 1,
-2.3387, -0.1045446, -1.090625, 0, 0, 0, 1, 1,
-2.283349, 0.4311427, -1.74754, 0, 0, 0, 1, 1,
-2.257726, 0.9635447, -1.268645, 0, 0, 0, 1, 1,
-2.246022, -0.06165839, -1.866801, 1, 1, 1, 1, 1,
-2.227551, 1.083291, -1.334303, 1, 1, 1, 1, 1,
-2.177579, 0.9799003, -0.4727957, 1, 1, 1, 1, 1,
-2.169473, 0.6639077, -1.944456, 1, 1, 1, 1, 1,
-2.168115, 0.0288483, -0.977727, 1, 1, 1, 1, 1,
-2.15858, -0.7696738, -3.236488, 1, 1, 1, 1, 1,
-2.130307, 0.4535271, -1.534578, 1, 1, 1, 1, 1,
-2.077775, 1.002384, -0.1311863, 1, 1, 1, 1, 1,
-2.038161, -1.014047, -2.724163, 1, 1, 1, 1, 1,
-2.034041, -1.150288, -2.916924, 1, 1, 1, 1, 1,
-2.000987, 0.3865892, -1.348394, 1, 1, 1, 1, 1,
-1.990732, -0.64271, -1.663871, 1, 1, 1, 1, 1,
-1.957049, 1.175315, 1.301437, 1, 1, 1, 1, 1,
-1.950509, 1.129078, -2.959494, 1, 1, 1, 1, 1,
-1.936232, 0.77163, -0.4355683, 1, 1, 1, 1, 1,
-1.898179, -0.06584685, -1.564554, 0, 0, 1, 1, 1,
-1.877881, -0.5821407, -2.109658, 1, 0, 0, 1, 1,
-1.854957, 1.577047, -1.049891, 1, 0, 0, 1, 1,
-1.811886, 1.197927, -0.7647161, 1, 0, 0, 1, 1,
-1.793119, -0.9884859, -2.243362, 1, 0, 0, 1, 1,
-1.782271, 1.639518, -2.434655, 1, 0, 0, 1, 1,
-1.756128, -0.8624293, -2.145971, 0, 0, 0, 1, 1,
-1.755668, -0.01285717, -1.917124, 0, 0, 0, 1, 1,
-1.755357, -0.6064537, -1.439202, 0, 0, 0, 1, 1,
-1.74656, -0.8719019, -0.7767807, 0, 0, 0, 1, 1,
-1.712055, -0.365805, -2.124531, 0, 0, 0, 1, 1,
-1.710946, 1.984194, -0.433637, 0, 0, 0, 1, 1,
-1.702342, 0.7622595, -0.4066272, 0, 0, 0, 1, 1,
-1.689451, -0.08584069, -1.402079, 1, 1, 1, 1, 1,
-1.675345, -0.8379487, -0.8468877, 1, 1, 1, 1, 1,
-1.641794, 1.033778, 0.5834311, 1, 1, 1, 1, 1,
-1.639011, -0.9903906, -1.688674, 1, 1, 1, 1, 1,
-1.629033, -0.1403396, -2.605895, 1, 1, 1, 1, 1,
-1.624693, 0.6025169, -1.230596, 1, 1, 1, 1, 1,
-1.618291, 0.8660842, -0.9542346, 1, 1, 1, 1, 1,
-1.616886, -0.1840333, -2.199091, 1, 1, 1, 1, 1,
-1.611209, -1.540534, -4.390416, 1, 1, 1, 1, 1,
-1.599317, -0.2807166, -1.093581, 1, 1, 1, 1, 1,
-1.592224, -0.8533865, -1.626948, 1, 1, 1, 1, 1,
-1.588948, 1.084455, -1.503443, 1, 1, 1, 1, 1,
-1.584141, 1.990554, -0.899658, 1, 1, 1, 1, 1,
-1.580695, 0.5837976, 0.9345307, 1, 1, 1, 1, 1,
-1.562622, -1.747426, -0.4293056, 1, 1, 1, 1, 1,
-1.56193, -0.02912977, -1.353276, 0, 0, 1, 1, 1,
-1.54656, -1.543776, -2.154608, 1, 0, 0, 1, 1,
-1.539951, -1.33533, -1.406746, 1, 0, 0, 1, 1,
-1.53184, -0.7271065, -2.624894, 1, 0, 0, 1, 1,
-1.526306, 1.158077, -0.7263272, 1, 0, 0, 1, 1,
-1.514829, -0.08904631, 0.4919995, 1, 0, 0, 1, 1,
-1.511513, -0.2651563, -2.328417, 0, 0, 0, 1, 1,
-1.507905, -1.17141, -2.094561, 0, 0, 0, 1, 1,
-1.504615, -0.2098862, -2.001914, 0, 0, 0, 1, 1,
-1.5018, -1.194431, -3.824727, 0, 0, 0, 1, 1,
-1.49903, -1.225422, -2.542419, 0, 0, 0, 1, 1,
-1.497872, 0.7030529, -1.525538, 0, 0, 0, 1, 1,
-1.491734, 1.99375, 0.6180934, 0, 0, 0, 1, 1,
-1.485114, -0.2216262, -1.386162, 1, 1, 1, 1, 1,
-1.472343, 0.0760782, -1.633253, 1, 1, 1, 1, 1,
-1.470696, -1.274475, -1.814409, 1, 1, 1, 1, 1,
-1.461797, 1.104225, -1.532654, 1, 1, 1, 1, 1,
-1.451874, -0.438978, -2.125776, 1, 1, 1, 1, 1,
-1.448772, 0.816298, -1.974262, 1, 1, 1, 1, 1,
-1.446858, -0.4498366, -0.5769158, 1, 1, 1, 1, 1,
-1.44628, 0.3873424, -3.276316, 1, 1, 1, 1, 1,
-1.43535, -1.134825, -0.2654729, 1, 1, 1, 1, 1,
-1.434647, 1.086986, 0.0912431, 1, 1, 1, 1, 1,
-1.429869, -0.2033792, -2.262522, 1, 1, 1, 1, 1,
-1.40969, -0.9946483, -3.383426, 1, 1, 1, 1, 1,
-1.407465, -0.01753637, -0.6007537, 1, 1, 1, 1, 1,
-1.4032, 0.2805393, -0.6330191, 1, 1, 1, 1, 1,
-1.399798, -0.1752569, -2.822886, 1, 1, 1, 1, 1,
-1.393928, -0.8382593, -1.718983, 0, 0, 1, 1, 1,
-1.393771, -0.1491456, -1.409028, 1, 0, 0, 1, 1,
-1.388738, -0.1768438, -0.8042192, 1, 0, 0, 1, 1,
-1.373241, -0.03964255, -1.848531, 1, 0, 0, 1, 1,
-1.361669, -0.2763842, -2.523324, 1, 0, 0, 1, 1,
-1.35543, -1.196149, -0.0424, 1, 0, 0, 1, 1,
-1.345246, 2.759942, -0.9816909, 0, 0, 0, 1, 1,
-1.334462, 1.14097, -0.6051272, 0, 0, 0, 1, 1,
-1.331682, -0.1033294, -1.836882, 0, 0, 0, 1, 1,
-1.323369, -0.6142868, -2.243146, 0, 0, 0, 1, 1,
-1.323358, -1.480614, -1.467952, 0, 0, 0, 1, 1,
-1.321558, -0.2855963, -0.8100805, 0, 0, 0, 1, 1,
-1.315524, 0.01883611, -0.6515838, 0, 0, 0, 1, 1,
-1.315287, 1.351246, 0.9637848, 1, 1, 1, 1, 1,
-1.29907, 0.1071354, -2.633, 1, 1, 1, 1, 1,
-1.292081, -1.320351, -1.944676, 1, 1, 1, 1, 1,
-1.292034, -1.820896, -1.72101, 1, 1, 1, 1, 1,
-1.281323, -0.4615096, 0.02388079, 1, 1, 1, 1, 1,
-1.272744, -0.6611292, -0.7065068, 1, 1, 1, 1, 1,
-1.26747, 0.5061599, -0.06715354, 1, 1, 1, 1, 1,
-1.256243, 2.552465, -1.638492, 1, 1, 1, 1, 1,
-1.248704, -0.8630647, -1.191952, 1, 1, 1, 1, 1,
-1.247995, -1.376399, -1.102946, 1, 1, 1, 1, 1,
-1.235896, 0.6543158, -0.1932492, 1, 1, 1, 1, 1,
-1.230914, -0.05875625, -1.568174, 1, 1, 1, 1, 1,
-1.227005, -0.8032258, -1.643209, 1, 1, 1, 1, 1,
-1.219376, -0.07763059, -1.285156, 1, 1, 1, 1, 1,
-1.216128, -0.408357, -0.8000867, 1, 1, 1, 1, 1,
-1.187038, -0.839368, -1.501651, 0, 0, 1, 1, 1,
-1.180732, 0.910249, -2.750478, 1, 0, 0, 1, 1,
-1.176175, 0.2261668, -0.6113597, 1, 0, 0, 1, 1,
-1.17334, 0.9080054, 0.6628805, 1, 0, 0, 1, 1,
-1.172426, 0.1021705, -2.329057, 1, 0, 0, 1, 1,
-1.166352, 0.6664529, -0.957545, 1, 0, 0, 1, 1,
-1.161439, 0.01748394, -2.339709, 0, 0, 0, 1, 1,
-1.159726, 0.6306593, -0.331182, 0, 0, 0, 1, 1,
-1.154223, -1.454497, -2.753254, 0, 0, 0, 1, 1,
-1.15294, 1.294826, -0.7603285, 0, 0, 0, 1, 1,
-1.146881, -0.5032556, -2.066422, 0, 0, 0, 1, 1,
-1.145675, 0.235945, -1.833877, 0, 0, 0, 1, 1,
-1.144061, 1.18736, -1.350658, 0, 0, 0, 1, 1,
-1.134747, 0.3889982, -2.348682, 1, 1, 1, 1, 1,
-1.132579, -1.10534, -3.622821, 1, 1, 1, 1, 1,
-1.121023, 0.5363486, -0.4097032, 1, 1, 1, 1, 1,
-1.119019, 0.7960134, -2.37217, 1, 1, 1, 1, 1,
-1.112481, 1.081532, -1.707349, 1, 1, 1, 1, 1,
-1.096738, -1.516139, -3.170609, 1, 1, 1, 1, 1,
-1.095921, 0.4332544, -0.3788413, 1, 1, 1, 1, 1,
-1.094276, 0.5136886, -2.500398, 1, 1, 1, 1, 1,
-1.090907, -1.94378, -3.080845, 1, 1, 1, 1, 1,
-1.088517, 0.9615958, 0.2709841, 1, 1, 1, 1, 1,
-1.087508, 1.300125, -0.2082848, 1, 1, 1, 1, 1,
-1.087453, 1.807516, -0.779842, 1, 1, 1, 1, 1,
-1.086399, 0.3339541, -2.849608, 1, 1, 1, 1, 1,
-1.085605, 0.5644494, -2.224912, 1, 1, 1, 1, 1,
-1.084262, 1.444903, -0.3500018, 1, 1, 1, 1, 1,
-1.077074, 0.3547079, -0.7766881, 0, 0, 1, 1, 1,
-1.074627, 0.478469, -1.031143, 1, 0, 0, 1, 1,
-1.070189, 0.4970249, -2.032711, 1, 0, 0, 1, 1,
-1.065777, -0.5986547, -2.800837, 1, 0, 0, 1, 1,
-1.063808, 1.019805, -0.9501467, 1, 0, 0, 1, 1,
-1.058485, -0.2122359, -1.786873, 1, 0, 0, 1, 1,
-1.057459, -1.195479, -2.165586, 0, 0, 0, 1, 1,
-1.053111, 0.1117039, -2.520498, 0, 0, 0, 1, 1,
-1.051557, -0.9642125, -1.661795, 0, 0, 0, 1, 1,
-1.047855, 2.037962, -0.4654838, 0, 0, 0, 1, 1,
-1.042354, 0.7368502, -0.7857552, 0, 0, 0, 1, 1,
-1.040153, 0.9506137, -1.179023, 0, 0, 0, 1, 1,
-1.040043, 0.213882, -2.498618, 0, 0, 0, 1, 1,
-1.032773, -1.308658, -2.586399, 1, 1, 1, 1, 1,
-1.020041, 0.02182582, -1.230303, 1, 1, 1, 1, 1,
-1.015013, -0.3132915, -2.057108, 1, 1, 1, 1, 1,
-1.011237, 0.1492914, -1.331552, 1, 1, 1, 1, 1,
-1.010517, -0.2130773, -0.4416614, 1, 1, 1, 1, 1,
-1.000225, -2.596453, -5.189453, 1, 1, 1, 1, 1,
-0.9929393, -1.943314, -0.5915625, 1, 1, 1, 1, 1,
-0.9861141, -1.585388, -2.395697, 1, 1, 1, 1, 1,
-0.9853001, -0.1502207, -3.159543, 1, 1, 1, 1, 1,
-0.9827516, 0.3304495, -2.017371, 1, 1, 1, 1, 1,
-0.9793393, 0.3490165, 0.5403061, 1, 1, 1, 1, 1,
-0.9666929, 0.09241731, -2.552308, 1, 1, 1, 1, 1,
-0.9621564, -2.148994, -2.592223, 1, 1, 1, 1, 1,
-0.959402, 1.12952, -1.054851, 1, 1, 1, 1, 1,
-0.9587727, 0.5592579, -1.61767, 1, 1, 1, 1, 1,
-0.9568535, 1.15885, 0.2042271, 0, 0, 1, 1, 1,
-0.9530944, 0.3949452, -1.866609, 1, 0, 0, 1, 1,
-0.952769, -1.220113, -1.617788, 1, 0, 0, 1, 1,
-0.9497098, -0.04685297, -0.2868024, 1, 0, 0, 1, 1,
-0.9476469, -2.737833, -0.6792005, 1, 0, 0, 1, 1,
-0.9476007, 0.3533578, -0.955942, 1, 0, 0, 1, 1,
-0.9448892, 0.3114422, -2.239307, 0, 0, 0, 1, 1,
-0.9314874, 0.4609951, -0.9378544, 0, 0, 0, 1, 1,
-0.9268635, 0.1088606, -1.308135, 0, 0, 0, 1, 1,
-0.9260477, -1.176518, -3.238828, 0, 0, 0, 1, 1,
-0.9229835, 1.416948, -0.9160661, 0, 0, 0, 1, 1,
-0.9187227, -0.9246127, -2.550764, 0, 0, 0, 1, 1,
-0.9178581, -1.013324, -2.347025, 0, 0, 0, 1, 1,
-0.916185, 2.303158, -1.846781, 1, 1, 1, 1, 1,
-0.9145211, -1.219012, -3.368016, 1, 1, 1, 1, 1,
-0.9126276, -1.799738, -2.146509, 1, 1, 1, 1, 1,
-0.9100782, -0.5141392, -2.001228, 1, 1, 1, 1, 1,
-0.9094677, -3.067665, -2.710988, 1, 1, 1, 1, 1,
-0.8968024, -1.295167, -1.673425, 1, 1, 1, 1, 1,
-0.8963882, -0.003110002, -3.377193, 1, 1, 1, 1, 1,
-0.8939363, 2.507751, 2.497638, 1, 1, 1, 1, 1,
-0.8835544, 1.036219, -3.391696, 1, 1, 1, 1, 1,
-0.8788775, 2.077068, -1.473057, 1, 1, 1, 1, 1,
-0.8727973, -1.198363, -1.209999, 1, 1, 1, 1, 1,
-0.8692372, -1.571669, -2.459587, 1, 1, 1, 1, 1,
-0.8630696, 1.193013, -0.9156002, 1, 1, 1, 1, 1,
-0.8585234, 0.6985471, -2.137859, 1, 1, 1, 1, 1,
-0.8487909, -0.9345177, -3.263984, 1, 1, 1, 1, 1,
-0.837925, -1.094669, -3.663636, 0, 0, 1, 1, 1,
-0.8365656, -0.01489756, -1.935762, 1, 0, 0, 1, 1,
-0.8340138, 1.196245, -2.427395, 1, 0, 0, 1, 1,
-0.8321344, -0.907029, -0.5309546, 1, 0, 0, 1, 1,
-0.8288379, 0.4132102, -1.315155, 1, 0, 0, 1, 1,
-0.8124699, 1.422201, -0.3109384, 1, 0, 0, 1, 1,
-0.8087802, 1.40241, -0.8498458, 0, 0, 0, 1, 1,
-0.7904302, -1.07629, -2.041041, 0, 0, 0, 1, 1,
-0.7839138, 0.3523684, -0.8038902, 0, 0, 0, 1, 1,
-0.7793652, 1.292161, 0.01764122, 0, 0, 0, 1, 1,
-0.7785361, -0.2521974, -0.06031104, 0, 0, 0, 1, 1,
-0.777588, -0.6626867, -2.51048, 0, 0, 0, 1, 1,
-0.776248, -2.468132, -3.453759, 0, 0, 0, 1, 1,
-0.7732593, -1.568985, -1.462364, 1, 1, 1, 1, 1,
-0.7661797, -1.505934, -3.763242, 1, 1, 1, 1, 1,
-0.7609268, -0.6801653, -0.1670304, 1, 1, 1, 1, 1,
-0.7591038, -1.186447, -1.15057, 1, 1, 1, 1, 1,
-0.7581802, 0.4196474, -1.269272, 1, 1, 1, 1, 1,
-0.755712, -0.5055696, -1.521283, 1, 1, 1, 1, 1,
-0.7520772, -0.929121, -0.4975841, 1, 1, 1, 1, 1,
-0.7508065, -0.6573159, -1.684985, 1, 1, 1, 1, 1,
-0.7504576, -0.3273987, -1.404205, 1, 1, 1, 1, 1,
-0.7492914, -0.7176057, -2.358274, 1, 1, 1, 1, 1,
-0.7490631, 0.7534931, -0.2735718, 1, 1, 1, 1, 1,
-0.744341, -0.1828076, -1.348925, 1, 1, 1, 1, 1,
-0.7421852, 1.201579, -0.6381986, 1, 1, 1, 1, 1,
-0.7401158, 0.3648217, -0.3461785, 1, 1, 1, 1, 1,
-0.7302781, -0.8509742, -1.930617, 1, 1, 1, 1, 1,
-0.7302759, 0.5412478, -1.760308, 0, 0, 1, 1, 1,
-0.7256916, 0.2805053, -0.5536085, 1, 0, 0, 1, 1,
-0.724807, -1.49969, -2.431265, 1, 0, 0, 1, 1,
-0.7220885, -0.924711, -3.421133, 1, 0, 0, 1, 1,
-0.7194899, -0.7441372, -0.8581752, 1, 0, 0, 1, 1,
-0.7191786, 0.4829688, -0.8735576, 1, 0, 0, 1, 1,
-0.7179111, 1.122004, 0.386629, 0, 0, 0, 1, 1,
-0.7111155, 0.251375, -1.051666, 0, 0, 0, 1, 1,
-0.7060897, -1.02767, -2.162816, 0, 0, 0, 1, 1,
-0.7005953, 0.03900735, -0.465021, 0, 0, 0, 1, 1,
-0.6969041, 1.071999, -0.5984262, 0, 0, 0, 1, 1,
-0.6911876, -0.2270399, -1.30462, 0, 0, 0, 1, 1,
-0.6881559, 0.8135725, -0.3956805, 0, 0, 0, 1, 1,
-0.6876465, -0.932587, -1.617922, 1, 1, 1, 1, 1,
-0.6833085, -1.593335, -1.05386, 1, 1, 1, 1, 1,
-0.6829976, 0.8345149, -0.5050941, 1, 1, 1, 1, 1,
-0.6828464, 1.556949, -1.728843, 1, 1, 1, 1, 1,
-0.6820521, 0.1264483, -1.845417, 1, 1, 1, 1, 1,
-0.6745361, 0.3237852, -0.585165, 1, 1, 1, 1, 1,
-0.6670022, -1.122955, -3.442329, 1, 1, 1, 1, 1,
-0.6549026, 0.1806901, 0.4441138, 1, 1, 1, 1, 1,
-0.651547, 0.6455123, -2.246811, 1, 1, 1, 1, 1,
-0.6495504, 1.383909, 0.3693013, 1, 1, 1, 1, 1,
-0.6494182, -1.113288, -3.803502, 1, 1, 1, 1, 1,
-0.6400664, 0.004325698, -1.605471, 1, 1, 1, 1, 1,
-0.6341735, -0.2304377, -3.307378, 1, 1, 1, 1, 1,
-0.6330622, -0.1258259, -1.315606, 1, 1, 1, 1, 1,
-0.6294103, -0.1698079, -3.372664, 1, 1, 1, 1, 1,
-0.6248659, -1.049431, -1.315348, 0, 0, 1, 1, 1,
-0.6230491, -0.7876862, -2.67094, 1, 0, 0, 1, 1,
-0.6226804, -0.0936568, -1.374163, 1, 0, 0, 1, 1,
-0.6220455, -1.0239, -2.455302, 1, 0, 0, 1, 1,
-0.6198838, 0.7668689, -2.390583, 1, 0, 0, 1, 1,
-0.6182408, 0.6425444, -0.3619606, 1, 0, 0, 1, 1,
-0.6109353, -0.4394982, -0.004436843, 0, 0, 0, 1, 1,
-0.6089951, -0.2480826, -1.852824, 0, 0, 0, 1, 1,
-0.6084533, -1.227767, -2.595979, 0, 0, 0, 1, 1,
-0.6050034, 0.1912283, -1.185874, 0, 0, 0, 1, 1,
-0.6031874, 0.6046972, -0.8867036, 0, 0, 0, 1, 1,
-0.5996217, 0.8501205, -0.9871944, 0, 0, 0, 1, 1,
-0.5992177, -0.3063073, -1.383872, 0, 0, 0, 1, 1,
-0.5986508, -0.06967467, -1.792898, 1, 1, 1, 1, 1,
-0.5968208, -0.2560683, -2.249475, 1, 1, 1, 1, 1,
-0.5958374, 0.6945471, -0.9902357, 1, 1, 1, 1, 1,
-0.5933788, -0.5514332, -3.118797, 1, 1, 1, 1, 1,
-0.5932811, -0.1222691, -2.293948, 1, 1, 1, 1, 1,
-0.5910793, 0.1931013, -1.510151, 1, 1, 1, 1, 1,
-0.5855972, 1.163534, -0.7856132, 1, 1, 1, 1, 1,
-0.5855324, -1.351435, -2.925308, 1, 1, 1, 1, 1,
-0.5845399, 0.3547638, -0.2280592, 1, 1, 1, 1, 1,
-0.5839354, 0.8665286, 1.121394, 1, 1, 1, 1, 1,
-0.5751728, 0.6387653, -1.024322, 1, 1, 1, 1, 1,
-0.570561, 0.9298551, 0.720131, 1, 1, 1, 1, 1,
-0.56938, 0.599911, 0.8685607, 1, 1, 1, 1, 1,
-0.5690863, 0.7146233, -1.272068, 1, 1, 1, 1, 1,
-0.5636762, 0.1656924, 0.5396095, 1, 1, 1, 1, 1,
-0.5615317, 0.3991064, -0.5363317, 0, 0, 1, 1, 1,
-0.5596859, 0.3023691, 0.4514923, 1, 0, 0, 1, 1,
-0.5576361, 1.666773, 0.0637439, 1, 0, 0, 1, 1,
-0.5549442, 1.453, 1.318115, 1, 0, 0, 1, 1,
-0.5532387, 0.993826, -0.36035, 1, 0, 0, 1, 1,
-0.5510032, -0.1708519, -3.863017, 1, 0, 0, 1, 1,
-0.5506374, -0.1706791, -1.333017, 0, 0, 0, 1, 1,
-0.5500793, 1.033899, -1.651035, 0, 0, 0, 1, 1,
-0.5428799, 1.909531, -0.03625599, 0, 0, 0, 1, 1,
-0.5365047, 1.184097, -1.216342, 0, 0, 0, 1, 1,
-0.5358669, 0.9400484, -0.8688446, 0, 0, 0, 1, 1,
-0.5336978, -0.6843002, -1.254937, 0, 0, 0, 1, 1,
-0.5331161, -0.8183412, -1.871884, 0, 0, 0, 1, 1,
-0.5321662, 0.1925741, -1.400121, 1, 1, 1, 1, 1,
-0.5307002, 0.1173276, -1.16363, 1, 1, 1, 1, 1,
-0.5270739, 0.5111659, -1.436327, 1, 1, 1, 1, 1,
-0.5270578, -0.6518945, -2.812591, 1, 1, 1, 1, 1,
-0.5257049, -0.3480131, -1.832064, 1, 1, 1, 1, 1,
-0.5256903, -0.1790661, -3.33382, 1, 1, 1, 1, 1,
-0.5225162, 0.0239249, -0.9935686, 1, 1, 1, 1, 1,
-0.521041, 1.698631, -0.3141802, 1, 1, 1, 1, 1,
-0.5149857, 0.5868325, -0.01007935, 1, 1, 1, 1, 1,
-0.5149267, -0.3375992, -1.238594, 1, 1, 1, 1, 1,
-0.5079856, 0.7524458, -1.99863, 1, 1, 1, 1, 1,
-0.5070862, 1.211863, -1.258792, 1, 1, 1, 1, 1,
-0.5062691, 1.459903, -0.814217, 1, 1, 1, 1, 1,
-0.5033928, -0.2011661, -0.7877426, 1, 1, 1, 1, 1,
-0.5033124, -0.2078962, -4.233123, 1, 1, 1, 1, 1,
-0.4998989, 0.2660393, -1.391755, 0, 0, 1, 1, 1,
-0.4962879, -0.2187714, -1.444977, 1, 0, 0, 1, 1,
-0.4947982, 1.229569, -0.06959736, 1, 0, 0, 1, 1,
-0.4936938, 0.4175485, 1.08952, 1, 0, 0, 1, 1,
-0.4780303, 0.368731, -1.818106, 1, 0, 0, 1, 1,
-0.4772169, -0.08363517, -1.060788, 1, 0, 0, 1, 1,
-0.4751337, -1.24359, -3.24985, 0, 0, 0, 1, 1,
-0.4750725, 0.7099131, 0.7682328, 0, 0, 0, 1, 1,
-0.4741657, -0.03117407, -1.3831, 0, 0, 0, 1, 1,
-0.4720465, -0.7868732, -1.034654, 0, 0, 0, 1, 1,
-0.4711989, -0.06335194, -1.433127, 0, 0, 0, 1, 1,
-0.4710271, 0.0530066, -0.8917496, 0, 0, 0, 1, 1,
-0.4678932, -1.328258, -4.669493, 0, 0, 0, 1, 1,
-0.4667273, 0.2160315, -1.404072, 1, 1, 1, 1, 1,
-0.4642015, 1.524301, -0.2673245, 1, 1, 1, 1, 1,
-0.4601625, 0.4021845, 0.2986632, 1, 1, 1, 1, 1,
-0.4598978, -1.639082, -2.442972, 1, 1, 1, 1, 1,
-0.4582828, 0.4197414, 0.1427681, 1, 1, 1, 1, 1,
-0.4535823, 0.6488282, 1.670823, 1, 1, 1, 1, 1,
-0.4487285, 1.537967, 0.1334701, 1, 1, 1, 1, 1,
-0.4482739, -1.20917, -2.162915, 1, 1, 1, 1, 1,
-0.4426841, -0.6818306, -2.028324, 1, 1, 1, 1, 1,
-0.4395621, 0.3448528, -0.007687921, 1, 1, 1, 1, 1,
-0.4340007, -0.05046314, -3.007663, 1, 1, 1, 1, 1,
-0.432068, 1.194678, -1.202309, 1, 1, 1, 1, 1,
-0.4272592, 0.4364051, -2.465271, 1, 1, 1, 1, 1,
-0.4262663, -0.6122794, -3.432164, 1, 1, 1, 1, 1,
-0.4224345, 1.647805, 0.3787764, 1, 1, 1, 1, 1,
-0.4168968, -0.002473388, -0.8408527, 0, 0, 1, 1, 1,
-0.4165733, 0.4822465, -1.543089, 1, 0, 0, 1, 1,
-0.4082935, -0.9939572, -4.236208, 1, 0, 0, 1, 1,
-0.3989937, -1.010428, -2.314345, 1, 0, 0, 1, 1,
-0.3972879, 0.04435655, -0.7680348, 1, 0, 0, 1, 1,
-0.3946109, -0.4741335, -4.216139, 1, 0, 0, 1, 1,
-0.3877791, 0.5922338, 1.121415, 0, 0, 0, 1, 1,
-0.3872074, 0.03734041, -1.074283, 0, 0, 0, 1, 1,
-0.3845132, 0.3594801, -1.204823, 0, 0, 0, 1, 1,
-0.3792001, 0.3686403, -1.080914, 0, 0, 0, 1, 1,
-0.3777241, -0.1005436, -1.85095, 0, 0, 0, 1, 1,
-0.3755433, 1.335296, 0.4432135, 0, 0, 0, 1, 1,
-0.3750657, 1.773461, -1.087708, 0, 0, 0, 1, 1,
-0.3747469, 1.536701, 0.4850834, 1, 1, 1, 1, 1,
-0.3743985, -0.009801826, -1.226558, 1, 1, 1, 1, 1,
-0.3734303, -0.5983458, -1.02388, 1, 1, 1, 1, 1,
-0.3687229, 0.3285802, -0.7803299, 1, 1, 1, 1, 1,
-0.3676004, 0.9392375, -1.057152, 1, 1, 1, 1, 1,
-0.3582236, -0.9556274, -2.133923, 1, 1, 1, 1, 1,
-0.3570189, -0.6361722, -2.371484, 1, 1, 1, 1, 1,
-0.3564809, -0.7008509, -2.930148, 1, 1, 1, 1, 1,
-0.3546721, -0.5153155, -4.830004, 1, 1, 1, 1, 1,
-0.3544835, -1.052402, -1.308353, 1, 1, 1, 1, 1,
-0.3542036, -0.4969048, -2.441055, 1, 1, 1, 1, 1,
-0.3541017, -1.04722, -4.709547, 1, 1, 1, 1, 1,
-0.3521586, 1.189684, -0.3182732, 1, 1, 1, 1, 1,
-0.3506866, 0.6431583, -0.8833479, 1, 1, 1, 1, 1,
-0.3482753, 0.1550232, -1.626681, 1, 1, 1, 1, 1,
-0.3479553, -0.681087, -3.24213, 0, 0, 1, 1, 1,
-0.3422771, -0.7245268, -3.63273, 1, 0, 0, 1, 1,
-0.3393272, -1.124451, -2.598597, 1, 0, 0, 1, 1,
-0.3319126, 0.2252487, -3.374681, 1, 0, 0, 1, 1,
-0.3300315, 0.7913388, -1.907189, 1, 0, 0, 1, 1,
-0.3239369, -0.7370466, -3.387864, 1, 0, 0, 1, 1,
-0.3237522, 1.51401, -2.12601, 0, 0, 0, 1, 1,
-0.3235993, 0.101678, -1.635573, 0, 0, 0, 1, 1,
-0.3183502, -0.9919357, -3.123964, 0, 0, 0, 1, 1,
-0.3173978, 1.443789, 0.01094715, 0, 0, 0, 1, 1,
-0.3171595, 0.1301757, -0.6683633, 0, 0, 0, 1, 1,
-0.3131368, -0.6335797, -2.55288, 0, 0, 0, 1, 1,
-0.3115093, -0.9771771, -2.0116, 0, 0, 0, 1, 1,
-0.3111943, -0.7937638, -1.718478, 1, 1, 1, 1, 1,
-0.3026613, -1.106508, -3.708972, 1, 1, 1, 1, 1,
-0.2999671, -0.04327151, -1.483123, 1, 1, 1, 1, 1,
-0.2897391, 1.14818, -0.2368262, 1, 1, 1, 1, 1,
-0.2836746, -0.9374823, -3.414927, 1, 1, 1, 1, 1,
-0.2765158, 0.1299555, 0.2987628, 1, 1, 1, 1, 1,
-0.2701884, 0.2428535, -0.4104865, 1, 1, 1, 1, 1,
-0.260842, 1.323871, 0.09472673, 1, 1, 1, 1, 1,
-0.2604791, -1.178761, -3.613233, 1, 1, 1, 1, 1,
-0.2542873, -0.09042746, -3.787587, 1, 1, 1, 1, 1,
-0.252207, -0.2502389, -2.403104, 1, 1, 1, 1, 1,
-0.2516251, -1.462429, -2.805307, 1, 1, 1, 1, 1,
-0.2490751, 0.2959854, -1.190772, 1, 1, 1, 1, 1,
-0.2469913, 1.168591, 1.684717, 1, 1, 1, 1, 1,
-0.245763, -0.2530472, -2.582114, 1, 1, 1, 1, 1,
-0.24262, -1.103516, -2.631199, 0, 0, 1, 1, 1,
-0.2405478, -0.9293935, -2.880381, 1, 0, 0, 1, 1,
-0.2395505, -0.1920311, -1.395782, 1, 0, 0, 1, 1,
-0.2355484, -1.043642, -2.566038, 1, 0, 0, 1, 1,
-0.2308489, 1.538205, -0.1566399, 1, 0, 0, 1, 1,
-0.2294487, -1.688641, -0.7088001, 1, 0, 0, 1, 1,
-0.223272, -0.4222794, -3.475698, 0, 0, 0, 1, 1,
-0.2204363, -0.3209605, -2.458971, 0, 0, 0, 1, 1,
-0.2179932, -0.3924148, -2.882969, 0, 0, 0, 1, 1,
-0.2162338, -0.03845532, -3.17541, 0, 0, 0, 1, 1,
-0.2141411, -0.6146498, -3.930732, 0, 0, 0, 1, 1,
-0.2102946, -1.260501, -2.240893, 0, 0, 0, 1, 1,
-0.2066288, 0.04055052, -2.01478, 0, 0, 0, 1, 1,
-0.2042858, -2.714761, -2.418737, 1, 1, 1, 1, 1,
-0.2040447, 0.9188616, 0.2489128, 1, 1, 1, 1, 1,
-0.1993096, 0.04357962, -1.0065, 1, 1, 1, 1, 1,
-0.1976499, -0.4994892, -4.435032, 1, 1, 1, 1, 1,
-0.1975213, 0.2017344, 0.239079, 1, 1, 1, 1, 1,
-0.1951545, -0.1242193, -2.177291, 1, 1, 1, 1, 1,
-0.194492, 0.2631458, 0.5399984, 1, 1, 1, 1, 1,
-0.1917391, 0.3172017, -0.1522928, 1, 1, 1, 1, 1,
-0.1897848, 0.12914, -1.24921, 1, 1, 1, 1, 1,
-0.1870047, 1.764219, -0.2594937, 1, 1, 1, 1, 1,
-0.1853519, -0.867683, -2.445807, 1, 1, 1, 1, 1,
-0.1822081, -1.817754, -2.712722, 1, 1, 1, 1, 1,
-0.181426, 1.505563, -0.1649461, 1, 1, 1, 1, 1,
-0.181022, -0.1180237, -3.013382, 1, 1, 1, 1, 1,
-0.1766461, -0.3632533, -3.064929, 1, 1, 1, 1, 1,
-0.1760187, 0.5579368, -0.8784889, 0, 0, 1, 1, 1,
-0.171526, -0.8235303, -1.517263, 1, 0, 0, 1, 1,
-0.1686958, -0.3583989, -1.810987, 1, 0, 0, 1, 1,
-0.1595856, -0.2191169, -2.837222, 1, 0, 0, 1, 1,
-0.1586378, 1.28343, 0.593953, 1, 0, 0, 1, 1,
-0.1574447, 0.5506184, 0.4860953, 1, 0, 0, 1, 1,
-0.1508196, 1.227825, 0.100875, 0, 0, 0, 1, 1,
-0.1451337, 0.5722367, -0.330141, 0, 0, 0, 1, 1,
-0.1441069, 1.120085, 0.07230041, 0, 0, 0, 1, 1,
-0.1439631, 0.1642969, -1.316898, 0, 0, 0, 1, 1,
-0.1410763, 1.805382, 1.068256, 0, 0, 0, 1, 1,
-0.1381406, 0.1797279, -0.2144715, 0, 0, 0, 1, 1,
-0.1281258, 0.8838869, 1.527061, 0, 0, 0, 1, 1,
-0.1272966, -1.005421, -0.9993651, 1, 1, 1, 1, 1,
-0.126226, -2.284425, -3.229426, 1, 1, 1, 1, 1,
-0.1245658, 0.6491183, 0.07776812, 1, 1, 1, 1, 1,
-0.1199194, -1.080683, -2.881499, 1, 1, 1, 1, 1,
-0.1187235, 0.2591613, -0.8849997, 1, 1, 1, 1, 1,
-0.1168055, 0.6244062, -0.2197458, 1, 1, 1, 1, 1,
-0.1157064, -0.5184197, -2.99033, 1, 1, 1, 1, 1,
-0.1140791, -0.08321896, -2.234525, 1, 1, 1, 1, 1,
-0.1139861, -0.6610702, -1.611537, 1, 1, 1, 1, 1,
-0.1113274, 1.105782, 0.3447673, 1, 1, 1, 1, 1,
-0.1097979, -0.2892302, -3.906636, 1, 1, 1, 1, 1,
-0.1087493, -1.538908, -4.306195, 1, 1, 1, 1, 1,
-0.1035152, 0.147139, 0.9650494, 1, 1, 1, 1, 1,
-0.1006815, -0.3928906, -3.772605, 1, 1, 1, 1, 1,
-0.09915812, 0.4190857, -0.171154, 1, 1, 1, 1, 1,
-0.09882722, -1.109433, 0.08876976, 0, 0, 1, 1, 1,
-0.09881845, 0.1259234, -2.178212, 1, 0, 0, 1, 1,
-0.09642256, -1.75353, -3.979183, 1, 0, 0, 1, 1,
-0.09316993, 2.449931, 1.565796, 1, 0, 0, 1, 1,
-0.08396731, -0.9330872, -2.985475, 1, 0, 0, 1, 1,
-0.08169033, 0.5994375, -0.6500353, 1, 0, 0, 1, 1,
-0.0774197, -1.030293, -2.454172, 0, 0, 0, 1, 1,
-0.07287154, -0.6539492, -2.584353, 0, 0, 0, 1, 1,
-0.06983453, -1.297179, -2.777777, 0, 0, 0, 1, 1,
-0.06947888, 0.1059305, -0.8998008, 0, 0, 0, 1, 1,
-0.06893267, -1.602193, -4.786406, 0, 0, 0, 1, 1,
-0.06228954, 0.6605018, 0.4281872, 0, 0, 0, 1, 1,
-0.06123357, 0.2221047, 1.178344, 0, 0, 0, 1, 1,
-0.06089987, 0.04397953, -1.41714, 1, 1, 1, 1, 1,
-0.05865692, -0.4914996, -1.96051, 1, 1, 1, 1, 1,
-0.05821281, 0.1230601, -0.630941, 1, 1, 1, 1, 1,
-0.05399403, 1.470453, -0.897639, 1, 1, 1, 1, 1,
-0.05346953, 0.07943439, -1.661671, 1, 1, 1, 1, 1,
-0.05223108, -2.504824, -4.240728, 1, 1, 1, 1, 1,
-0.04985156, 1.237571, 0.07812337, 1, 1, 1, 1, 1,
-0.04828504, 1.75121, 0.3045706, 1, 1, 1, 1, 1,
-0.04049193, -0.03988878, -1.670701, 1, 1, 1, 1, 1,
-0.03973132, -0.2473713, -2.520409, 1, 1, 1, 1, 1,
-0.03928735, 0.04381275, -1.115466, 1, 1, 1, 1, 1,
-0.03743969, 2.392066, 1.441154, 1, 1, 1, 1, 1,
-0.03568583, -1.470619, -5.112068, 1, 1, 1, 1, 1,
-0.03253895, 0.6016874, 0.6490785, 1, 1, 1, 1, 1,
-0.03041773, 1.789002, -1.287943, 1, 1, 1, 1, 1,
-0.02598087, -2.026314, -4.104105, 0, 0, 1, 1, 1,
-0.02426708, -0.9407137, -0.5540751, 1, 0, 0, 1, 1,
-0.02305362, -0.6214103, -2.497375, 1, 0, 0, 1, 1,
-0.02233572, 0.07218425, -0.9752389, 1, 0, 0, 1, 1,
-0.01744491, 0.09951193, -1.135644, 1, 0, 0, 1, 1,
-0.01329935, -0.2587629, -2.363504, 1, 0, 0, 1, 1,
-0.01065256, 0.02737146, 1.279947, 0, 0, 0, 1, 1,
-0.006172226, 1.473985, 0.6560858, 0, 0, 0, 1, 1,
-0.002449869, -1.118346, -3.777814, 0, 0, 0, 1, 1,
4.068205e-05, 0.3538593, 1.20019, 0, 0, 0, 1, 1,
0.001461075, -0.7604893, 4.352771, 0, 0, 0, 1, 1,
0.002494645, -0.868301, 2.942875, 0, 0, 0, 1, 1,
0.003237397, -0.9898012, 3.623615, 0, 0, 0, 1, 1,
0.003787241, -0.02357372, 4.710042, 1, 1, 1, 1, 1,
0.003901227, -0.2924858, 2.675985, 1, 1, 1, 1, 1,
0.009444382, -1.470564, 4.434694, 1, 1, 1, 1, 1,
0.02159683, 1.225665, -0.9679798, 1, 1, 1, 1, 1,
0.02330527, -1.832507, 3.594994, 1, 1, 1, 1, 1,
0.02946668, 2.034582, 1.548055, 1, 1, 1, 1, 1,
0.0349081, 0.3084808, -0.1322722, 1, 1, 1, 1, 1,
0.04116524, 3.240919, 2.17489, 1, 1, 1, 1, 1,
0.04513099, -0.4410988, 4.196516, 1, 1, 1, 1, 1,
0.04606942, -0.02112717, 3.921731, 1, 1, 1, 1, 1,
0.04753722, -0.7364298, 3.049281, 1, 1, 1, 1, 1,
0.04935773, 1.099758, -0.1326484, 1, 1, 1, 1, 1,
0.05349015, 0.9333408, 0.3227178, 1, 1, 1, 1, 1,
0.05582667, -0.5819377, 3.513274, 1, 1, 1, 1, 1,
0.0563859, 0.1073706, -0.628101, 1, 1, 1, 1, 1,
0.05752841, 0.832629, -0.282519, 0, 0, 1, 1, 1,
0.06157983, 1.780493, 0.5332573, 1, 0, 0, 1, 1,
0.06727712, 0.453219, 0.07608112, 1, 0, 0, 1, 1,
0.06748737, -0.00273217, 3.874998, 1, 0, 0, 1, 1,
0.0752942, 0.3646872, -1.516986, 1, 0, 0, 1, 1,
0.07879701, -1.282177, 3.81196, 1, 0, 0, 1, 1,
0.07928132, 0.9182776, 0.2686041, 0, 0, 0, 1, 1,
0.08051142, 1.963786, 0.6591925, 0, 0, 0, 1, 1,
0.08123949, 1.188921, -1.369898, 0, 0, 0, 1, 1,
0.08312456, -1.201687, 1.700976, 0, 0, 0, 1, 1,
0.08346193, 1.055597, 2.327054, 0, 0, 0, 1, 1,
0.08447222, -0.1321478, 3.134839, 0, 0, 0, 1, 1,
0.08666545, -0.5668473, 3.654037, 0, 0, 0, 1, 1,
0.08785272, -1.439988, 1.665519, 1, 1, 1, 1, 1,
0.08850908, 1.124225, -2.272673, 1, 1, 1, 1, 1,
0.08867798, -1.484871, 4.002864, 1, 1, 1, 1, 1,
0.09010066, -0.1029244, 4.078956, 1, 1, 1, 1, 1,
0.09292351, -0.7726979, 1.872394, 1, 1, 1, 1, 1,
0.09806706, -0.4914033, 3.068096, 1, 1, 1, 1, 1,
0.09949732, 0.4214199, 0.1478101, 1, 1, 1, 1, 1,
0.1053089, -0.1029868, 4.246149, 1, 1, 1, 1, 1,
0.1092745, 0.06484613, 2.387997, 1, 1, 1, 1, 1,
0.1100987, -0.03661317, 1.748654, 1, 1, 1, 1, 1,
0.1110786, -0.683832, 1.976725, 1, 1, 1, 1, 1,
0.1202953, -0.6026311, 1.336986, 1, 1, 1, 1, 1,
0.1207261, 2.160352, 1.805003, 1, 1, 1, 1, 1,
0.1233979, 0.1908789, 1.575887, 1, 1, 1, 1, 1,
0.1238832, 1.477569, -0.3571427, 1, 1, 1, 1, 1,
0.1286585, 2.327277, 0.0808202, 0, 0, 1, 1, 1,
0.1339634, 1.552668, 0.3816122, 1, 0, 0, 1, 1,
0.1347772, 0.2245058, 0.442253, 1, 0, 0, 1, 1,
0.1363195, -1.944365, 2.180655, 1, 0, 0, 1, 1,
0.1373346, 0.7637155, 1.153719, 1, 0, 0, 1, 1,
0.1389538, 0.2509904, 0.889021, 1, 0, 0, 1, 1,
0.1419673, 1.591168, -1.104746, 0, 0, 0, 1, 1,
0.1427586, -0.6394813, 3.202916, 0, 0, 0, 1, 1,
0.1474814, 0.8924735, 0.6541671, 0, 0, 0, 1, 1,
0.1514702, 0.07220008, 1.234604, 0, 0, 0, 1, 1,
0.1564279, -0.6105325, 2.59269, 0, 0, 0, 1, 1,
0.1590721, 0.7374516, 0.2036254, 0, 0, 0, 1, 1,
0.1604596, -2.215625, 2.903658, 0, 0, 0, 1, 1,
0.1611896, -1.009817, 2.765189, 1, 1, 1, 1, 1,
0.1630304, 0.1663062, 0.5365264, 1, 1, 1, 1, 1,
0.1649259, -0.2278266, 4.397842, 1, 1, 1, 1, 1,
0.1665309, -0.9652131, 3.232826, 1, 1, 1, 1, 1,
0.1672297, 0.4550635, 1.193646, 1, 1, 1, 1, 1,
0.1691078, 0.2760603, -0.8389508, 1, 1, 1, 1, 1,
0.1733416, 0.3806944, 0.06577026, 1, 1, 1, 1, 1,
0.1748341, -0.09964231, 1.664728, 1, 1, 1, 1, 1,
0.1785377, 0.02452032, 0.495577, 1, 1, 1, 1, 1,
0.1910645, 2.145863, 0.5528957, 1, 1, 1, 1, 1,
0.1912914, -0.5647289, 1.900185, 1, 1, 1, 1, 1,
0.1975325, -0.7246497, 3.454934, 1, 1, 1, 1, 1,
0.1986243, 0.5499022, -1.864501, 1, 1, 1, 1, 1,
0.1990787, -0.2128158, 1.787289, 1, 1, 1, 1, 1,
0.2024126, 1.723383, 1.115849, 1, 1, 1, 1, 1,
0.2037322, -0.5207034, 1.408878, 0, 0, 1, 1, 1,
0.2095408, 0.3007672, 0.7150948, 1, 0, 0, 1, 1,
0.210999, 0.4516963, -0.2793292, 1, 0, 0, 1, 1,
0.2114486, 1.50389, -0.582402, 1, 0, 0, 1, 1,
0.2125454, 2.482612, 1.435237, 1, 0, 0, 1, 1,
0.2141974, 0.8579016, 0.206029, 1, 0, 0, 1, 1,
0.2163609, -1.377875, 2.92131, 0, 0, 0, 1, 1,
0.2195175, 0.2894833, 1.379675, 0, 0, 0, 1, 1,
0.2262404, 1.299035, 0.5638787, 0, 0, 0, 1, 1,
0.2262515, 1.265662, -1.176674, 0, 0, 0, 1, 1,
0.2290811, 0.2595661, 0.6850598, 0, 0, 0, 1, 1,
0.2342716, -0.6941301, 1.766959, 0, 0, 0, 1, 1,
0.2343839, -0.2643621, 1.889361, 0, 0, 0, 1, 1,
0.2348635, 0.1579739, 1.434299, 1, 1, 1, 1, 1,
0.236836, -0.7259645, 3.289527, 1, 1, 1, 1, 1,
0.2409956, -0.4896992, 1.619324, 1, 1, 1, 1, 1,
0.2443585, 1.408058, 2.416326, 1, 1, 1, 1, 1,
0.2445968, 0.5653249, 0.6392553, 1, 1, 1, 1, 1,
0.2499308, 1.059616, 2.007989, 1, 1, 1, 1, 1,
0.253163, -0.6866705, 3.354032, 1, 1, 1, 1, 1,
0.2567991, -0.9862928, 3.818071, 1, 1, 1, 1, 1,
0.2578287, -0.3925889, 2.210763, 1, 1, 1, 1, 1,
0.2588421, 2.066561, 0.1829655, 1, 1, 1, 1, 1,
0.2610878, 0.6903995, 0.8266377, 1, 1, 1, 1, 1,
0.2619527, -0.1238056, 2.335955, 1, 1, 1, 1, 1,
0.2638909, -0.582387, 4.077962, 1, 1, 1, 1, 1,
0.267679, 0.4198349, -0.4814241, 1, 1, 1, 1, 1,
0.2726364, -0.2890349, 1.088578, 1, 1, 1, 1, 1,
0.2730285, 0.7842989, 0.5730019, 0, 0, 1, 1, 1,
0.2823578, -0.4648425, 2.363474, 1, 0, 0, 1, 1,
0.2874147, -1.288464, 0.4766528, 1, 0, 0, 1, 1,
0.2882385, 0.6629604, 0.8755255, 1, 0, 0, 1, 1,
0.2903309, 0.8403978, 0.9557971, 1, 0, 0, 1, 1,
0.2913096, -1.638126, 3.962609, 1, 0, 0, 1, 1,
0.2919377, 2.168689, 1.349021, 0, 0, 0, 1, 1,
0.2978238, 0.4820616, 0.7068563, 0, 0, 0, 1, 1,
0.2996, -1.638845, 3.773705, 0, 0, 0, 1, 1,
0.3000522, -0.7880153, 4.834599, 0, 0, 0, 1, 1,
0.3011905, 1.092666, 0.5386189, 0, 0, 0, 1, 1,
0.3013988, 0.4150969, -0.3316475, 0, 0, 0, 1, 1,
0.3015543, 0.7871134, -0.35064, 0, 0, 0, 1, 1,
0.301681, 0.3291512, -0.2500003, 1, 1, 1, 1, 1,
0.3049384, -1.066035, 4.004575, 1, 1, 1, 1, 1,
0.3083805, 1.023239, -0.6755998, 1, 1, 1, 1, 1,
0.3097616, 0.09994476, 1.648643, 1, 1, 1, 1, 1,
0.3160466, 1.449862, 0.6156274, 1, 1, 1, 1, 1,
0.3182017, 1.30012, -0.02177623, 1, 1, 1, 1, 1,
0.3184009, 0.7591731, -0.7811552, 1, 1, 1, 1, 1,
0.3235751, -0.3768383, 2.944111, 1, 1, 1, 1, 1,
0.3254064, -0.7178353, 1.954945, 1, 1, 1, 1, 1,
0.3255588, 0.1636061, 0.8209975, 1, 1, 1, 1, 1,
0.3300158, -0.7489861, 4.550488, 1, 1, 1, 1, 1,
0.3305042, -2.829767, 2.719, 1, 1, 1, 1, 1,
0.3318752, -1.245774, 2.954151, 1, 1, 1, 1, 1,
0.3326365, -1.852372, 1.379935, 1, 1, 1, 1, 1,
0.3331324, 0.1020334, 1.463813, 1, 1, 1, 1, 1,
0.3342817, -0.1632943, 3.579269, 0, 0, 1, 1, 1,
0.3361211, -2.69924, 3.338397, 1, 0, 0, 1, 1,
0.3400074, -0.2197073, 2.675017, 1, 0, 0, 1, 1,
0.3410561, 1.057515, 0.5453625, 1, 0, 0, 1, 1,
0.3442132, 2.614656, 0.5808019, 1, 0, 0, 1, 1,
0.3453968, -0.2307997, 2.711453, 1, 0, 0, 1, 1,
0.3549679, -0.9425498, 0.8904203, 0, 0, 0, 1, 1,
0.3573712, -0.3535354, 2.671563, 0, 0, 0, 1, 1,
0.3577192, -0.5440624, 2.508046, 0, 0, 0, 1, 1,
0.3599549, -0.7064742, 0.4958579, 0, 0, 0, 1, 1,
0.3719125, 0.2948433, 1.3551, 0, 0, 0, 1, 1,
0.3735764, -0.7880313, 2.663696, 0, 0, 0, 1, 1,
0.3762317, 1.221541, -0.2707694, 0, 0, 0, 1, 1,
0.3766012, 1.796808, -1.739737, 1, 1, 1, 1, 1,
0.3767592, -0.3371305, 0.9359486, 1, 1, 1, 1, 1,
0.3776542, -0.7531841, 3.790006, 1, 1, 1, 1, 1,
0.3792628, -0.1543577, 1.570186, 1, 1, 1, 1, 1,
0.3859848, 0.4593271, 0.3721675, 1, 1, 1, 1, 1,
0.3878494, -0.2584604, 1.665585, 1, 1, 1, 1, 1,
0.3919966, -0.009467314, -0.1298524, 1, 1, 1, 1, 1,
0.3924358, -0.7168887, 2.262547, 1, 1, 1, 1, 1,
0.3962274, 0.02398307, 2.985134, 1, 1, 1, 1, 1,
0.3992211, 0.5029811, -0.1296271, 1, 1, 1, 1, 1,
0.401568, -0.04876375, 0.522848, 1, 1, 1, 1, 1,
0.4019515, 0.796945, -1.411625, 1, 1, 1, 1, 1,
0.4043418, 1.808943, -1.620419, 1, 1, 1, 1, 1,
0.4105572, -1.27845, 2.422711, 1, 1, 1, 1, 1,
0.4114544, -0.2353026, 2.138527, 1, 1, 1, 1, 1,
0.413701, 0.511885, 1.392139, 0, 0, 1, 1, 1,
0.4156053, -0.1861502, 1.84524, 1, 0, 0, 1, 1,
0.4171025, -0.4036598, 1.235881, 1, 0, 0, 1, 1,
0.4192523, -0.04778591, 2.321361, 1, 0, 0, 1, 1,
0.421111, -0.2031052, 1.285955, 1, 0, 0, 1, 1,
0.429511, -2.119913, 2.739772, 1, 0, 0, 1, 1,
0.4302826, -0.1595708, 0.3865248, 0, 0, 0, 1, 1,
0.4309177, -0.6328642, 3.084412, 0, 0, 0, 1, 1,
0.4324959, 0.5492129, 0.6535069, 0, 0, 0, 1, 1,
0.4361553, 1.743709, 0.453869, 0, 0, 0, 1, 1,
0.4392425, 0.4711642, 1.476504, 0, 0, 0, 1, 1,
0.441947, 0.1151354, 0.8724176, 0, 0, 0, 1, 1,
0.4440345, -1.083669, 0.5379233, 0, 0, 0, 1, 1,
0.4440618, 0.7084479, 2.135282, 1, 1, 1, 1, 1,
0.4464134, -0.9914791, 4.43182, 1, 1, 1, 1, 1,
0.4499401, -0.9409038, 3.443968, 1, 1, 1, 1, 1,
0.4502953, -1.642151, 3.116103, 1, 1, 1, 1, 1,
0.4505436, -0.3571416, 1.476366, 1, 1, 1, 1, 1,
0.4511575, 0.1517901, 3.188799, 1, 1, 1, 1, 1,
0.4525436, -0.5417824, 1.146551, 1, 1, 1, 1, 1,
0.4531204, -0.5420919, 3.118038, 1, 1, 1, 1, 1,
0.4546915, 1.9796, 0.7280259, 1, 1, 1, 1, 1,
0.4558771, 1.468707, -0.4432233, 1, 1, 1, 1, 1,
0.4593066, -0.3380113, 2.899563, 1, 1, 1, 1, 1,
0.4616778, 0.6408114, 1.226994, 1, 1, 1, 1, 1,
0.4661612, 0.1905455, 1.556174, 1, 1, 1, 1, 1,
0.4698044, 0.9103789, -0.522597, 1, 1, 1, 1, 1,
0.4727411, 0.6471485, 0.5009746, 1, 1, 1, 1, 1,
0.4808538, -1.187309, 3.469707, 0, 0, 1, 1, 1,
0.4821564, 0.2199897, 0.3143273, 1, 0, 0, 1, 1,
0.4840249, 0.05847006, 2.597706, 1, 0, 0, 1, 1,
0.4947601, -0.8020368, 3.613399, 1, 0, 0, 1, 1,
0.4949189, -0.5356726, 2.214016, 1, 0, 0, 1, 1,
0.495289, -1.290335, 3.728352, 1, 0, 0, 1, 1,
0.4960011, -0.2909116, 2.957913, 0, 0, 0, 1, 1,
0.4983771, 1.543548, 0.7133706, 0, 0, 0, 1, 1,
0.5002536, 1.24927, -0.1617735, 0, 0, 0, 1, 1,
0.5004835, 0.2506376, 0.915648, 0, 0, 0, 1, 1,
0.5038964, 0.8935252, 0.09986065, 0, 0, 0, 1, 1,
0.5044142, 1.015205, 1.424822, 0, 0, 0, 1, 1,
0.504649, -0.5128457, 2.240376, 0, 0, 0, 1, 1,
0.5065593, 0.607086, -0.8524716, 1, 1, 1, 1, 1,
0.5124336, -0.3171937, 1.554369, 1, 1, 1, 1, 1,
0.5145431, 0.6437118, -0.4739479, 1, 1, 1, 1, 1,
0.5164772, -0.5257035, 1.612745, 1, 1, 1, 1, 1,
0.518273, 1.078581, 0.3670479, 1, 1, 1, 1, 1,
0.5213015, 0.3686962, 1.509465, 1, 1, 1, 1, 1,
0.5268325, 1.316156, 0.7140945, 1, 1, 1, 1, 1,
0.5269331, 0.6086566, 2.610936, 1, 1, 1, 1, 1,
0.5286524, 0.4724648, 0.1191945, 1, 1, 1, 1, 1,
0.5303614, 1.261022, -0.01057479, 1, 1, 1, 1, 1,
0.5338899, 0.02701711, 1.040101, 1, 1, 1, 1, 1,
0.5355706, 1.833726, -0.9115184, 1, 1, 1, 1, 1,
0.5382023, -0.7160463, 3.378397, 1, 1, 1, 1, 1,
0.5401655, 0.9680533, -0.3971474, 1, 1, 1, 1, 1,
0.5410406, -0.04867332, 2.913264, 1, 1, 1, 1, 1,
0.5457981, 0.3787436, 1.498734, 0, 0, 1, 1, 1,
0.546591, -0.09949788, 3.327396, 1, 0, 0, 1, 1,
0.5488937, -1.976671, 3.016317, 1, 0, 0, 1, 1,
0.5493494, -0.2147429, 2.522806, 1, 0, 0, 1, 1,
0.5524451, -1.387592, 3.424991, 1, 0, 0, 1, 1,
0.5583944, 0.05780467, 1.633324, 1, 0, 0, 1, 1,
0.5640444, 1.313462, 0.4866231, 0, 0, 0, 1, 1,
0.5642011, 1.368162, -0.885325, 0, 0, 0, 1, 1,
0.5672495, -0.4205473, 0.1891815, 0, 0, 0, 1, 1,
0.5705002, 0.2731466, 1.781989, 0, 0, 0, 1, 1,
0.5732763, 0.1775675, 1.113978, 0, 0, 0, 1, 1,
0.5739694, 1.168285, 0.2692747, 0, 0, 0, 1, 1,
0.5741721, 0.4640215, 0.7030864, 0, 0, 0, 1, 1,
0.5743355, 0.7065232, -0.844089, 1, 1, 1, 1, 1,
0.5757167, 0.9707486, 0.2254625, 1, 1, 1, 1, 1,
0.5761335, -2.38661, 2.750019, 1, 1, 1, 1, 1,
0.5778148, 1.126782, 1.148241, 1, 1, 1, 1, 1,
0.5839843, 0.8024991, 1.941092, 1, 1, 1, 1, 1,
0.5881212, 0.4973519, 3.272913, 1, 1, 1, 1, 1,
0.5887631, 0.1548015, 2.2257, 1, 1, 1, 1, 1,
0.5894284, 0.2247182, -0.6291689, 1, 1, 1, 1, 1,
0.5896503, -0.9292606, 2.349441, 1, 1, 1, 1, 1,
0.5899118, 0.1981323, 1.52257, 1, 1, 1, 1, 1,
0.5923926, 2.440611, 0.4480655, 1, 1, 1, 1, 1,
0.5948906, 1.616914, -0.2714512, 1, 1, 1, 1, 1,
0.5973705, 0.4390242, 2.352981, 1, 1, 1, 1, 1,
0.6048325, 0.1231621, 1.043804, 1, 1, 1, 1, 1,
0.6054829, 0.6528232, 1.247979, 1, 1, 1, 1, 1,
0.6109891, -0.286019, 1.912516, 0, 0, 1, 1, 1,
0.6169713, -1.150691, -0.3853803, 1, 0, 0, 1, 1,
0.6219323, -1.166493, 3.18375, 1, 0, 0, 1, 1,
0.6230064, -0.4748821, 2.812669, 1, 0, 0, 1, 1,
0.626949, -0.6945249, 2.70084, 1, 0, 0, 1, 1,
0.6322916, 0.6399621, 0.1411767, 1, 0, 0, 1, 1,
0.6331152, -0.03571282, 3.458165, 0, 0, 0, 1, 1,
0.6352435, 1.074186, 0.3270252, 0, 0, 0, 1, 1,
0.6360022, -0.2977841, 1.967569, 0, 0, 0, 1, 1,
0.6360444, 0.2790562, 3.294129, 0, 0, 0, 1, 1,
0.6402847, 0.158066, 0.75442, 0, 0, 0, 1, 1,
0.6433627, 0.1169493, 0.9713634, 0, 0, 0, 1, 1,
0.644892, -0.6578701, 3.392451, 0, 0, 0, 1, 1,
0.6502553, -0.2012154, 2.269945, 1, 1, 1, 1, 1,
0.6641546, 0.1071101, -0.7644023, 1, 1, 1, 1, 1,
0.6648067, 0.5816118, 0.4355299, 1, 1, 1, 1, 1,
0.6841808, 2.302193, -0.286087, 1, 1, 1, 1, 1,
0.6892397, -1.68645, 4.285411, 1, 1, 1, 1, 1,
0.6898572, -1.720764, 2.328697, 1, 1, 1, 1, 1,
0.6911551, 1.48501, 0.3654191, 1, 1, 1, 1, 1,
0.6942127, 1.559382, 0.3724318, 1, 1, 1, 1, 1,
0.7056283, -0.05917762, 1.698722, 1, 1, 1, 1, 1,
0.706257, 0.2226073, -0.1452808, 1, 1, 1, 1, 1,
0.7090257, -0.4842821, 2.086654, 1, 1, 1, 1, 1,
0.7142998, 0.8751406, -0.5473315, 1, 1, 1, 1, 1,
0.7211967, 1.556578, 1.269339, 1, 1, 1, 1, 1,
0.7225022, -0.1166771, 3.13235, 1, 1, 1, 1, 1,
0.7277274, -0.1760225, 0.652273, 1, 1, 1, 1, 1,
0.7298551, -1.25169, 3.205098, 0, 0, 1, 1, 1,
0.7319868, 1.205281, 2.298182, 1, 0, 0, 1, 1,
0.7333094, 0.3488411, 1.915218, 1, 0, 0, 1, 1,
0.736136, 0.5852564, 0.3529024, 1, 0, 0, 1, 1,
0.7487385, 0.4368171, 0.8243665, 1, 0, 0, 1, 1,
0.7502831, -0.522662, 1.408864, 1, 0, 0, 1, 1,
0.7563736, 0.06469977, 1.809677, 0, 0, 0, 1, 1,
0.7572929, 0.3404177, 1.414326, 0, 0, 0, 1, 1,
0.7574773, -1.939567, 2.26146, 0, 0, 0, 1, 1,
0.7689409, -0.8633838, 3.754856, 0, 0, 0, 1, 1,
0.769447, 0.8737828, -0.2317324, 0, 0, 0, 1, 1,
0.7741931, 1.463146, -0.542656, 0, 0, 0, 1, 1,
0.7751007, 0.2797187, 0.8748206, 0, 0, 0, 1, 1,
0.7764704, 0.7035719, 1.103261, 1, 1, 1, 1, 1,
0.7787474, -0.7568662, 4.214592, 1, 1, 1, 1, 1,
0.78484, -0.5079406, 2.65346, 1, 1, 1, 1, 1,
0.7857713, -0.1174434, 1.823911, 1, 1, 1, 1, 1,
0.7875094, -1.562952, 2.25652, 1, 1, 1, 1, 1,
0.7888508, 0.4443276, 2.2379, 1, 1, 1, 1, 1,
0.7906685, -0.6517749, 3.652837, 1, 1, 1, 1, 1,
0.7942374, 0.7710389, 1.312739, 1, 1, 1, 1, 1,
0.7943956, -0.06534676, 2.03555, 1, 1, 1, 1, 1,
0.7948822, 0.3184327, 2.771316, 1, 1, 1, 1, 1,
0.8087571, -0.1644367, 2.166584, 1, 1, 1, 1, 1,
0.809532, -0.9216883, 2.311113, 1, 1, 1, 1, 1,
0.8107315, -1.537056, 1.929809, 1, 1, 1, 1, 1,
0.8148661, -0.4123848, 2.7385, 1, 1, 1, 1, 1,
0.8186083, 0.4075064, 2.161522, 1, 1, 1, 1, 1,
0.8206038, -0.2764004, 1.88958, 0, 0, 1, 1, 1,
0.8219593, 0.393586, -0.7525735, 1, 0, 0, 1, 1,
0.8276668, 0.07319437, 0.7110618, 1, 0, 0, 1, 1,
0.8288398, 1.166474, 4.054106, 1, 0, 0, 1, 1,
0.8353735, -1.333786, 2.675122, 1, 0, 0, 1, 1,
0.8386642, 1.830675, 0.1758499, 1, 0, 0, 1, 1,
0.8426677, 0.6303347, 0.4470788, 0, 0, 0, 1, 1,
0.8433087, -1.379868, 1.141551, 0, 0, 0, 1, 1,
0.8434462, 0.5820531, 2.092546, 0, 0, 0, 1, 1,
0.8469723, -0.3471136, 0.4400879, 0, 0, 0, 1, 1,
0.8506156, 1.204499, 1.182785, 0, 0, 0, 1, 1,
0.8521771, -1.838312, 2.185305, 0, 0, 0, 1, 1,
0.8531475, 1.219333, 0.6796674, 0, 0, 0, 1, 1,
0.8565411, 0.297773, -0.6557065, 1, 1, 1, 1, 1,
0.8571423, 0.2199408, 1.647773, 1, 1, 1, 1, 1,
0.8627369, -0.1261273, 3.964337, 1, 1, 1, 1, 1,
0.8649163, -0.6668949, 3.869635, 1, 1, 1, 1, 1,
0.8652244, 0.6872835, -0.7557175, 1, 1, 1, 1, 1,
0.865626, 2.611367, 2.265167, 1, 1, 1, 1, 1,
0.8684062, -0.8580465, 1.941331, 1, 1, 1, 1, 1,
0.8724339, -0.2167776, 0.652477, 1, 1, 1, 1, 1,
0.8751074, 0.2522485, 0.9412978, 1, 1, 1, 1, 1,
0.8771699, -1.899458, 0.9033805, 1, 1, 1, 1, 1,
0.8792768, 1.022108, -0.06375689, 1, 1, 1, 1, 1,
0.8793848, -0.899841, 3.201657, 1, 1, 1, 1, 1,
0.8846031, -0.06602161, 2.221467, 1, 1, 1, 1, 1,
0.8847741, -1.024452, -0.185341, 1, 1, 1, 1, 1,
0.8929774, 1.227017, 0.1804005, 1, 1, 1, 1, 1,
0.893324, -0.502214, 2.20289, 0, 0, 1, 1, 1,
0.8948557, -0.09898139, 2.072247, 1, 0, 0, 1, 1,
0.9003287, -1.538306, 4.406334, 1, 0, 0, 1, 1,
0.9010352, 1.986071, 0.3629266, 1, 0, 0, 1, 1,
0.9113228, 0.2103905, 2.122546, 1, 0, 0, 1, 1,
0.9115176, 1.275034, 0.3702979, 1, 0, 0, 1, 1,
0.9163598, -0.6494257, 2.297069, 0, 0, 0, 1, 1,
0.9209387, 0.7144111, 1.146755, 0, 0, 0, 1, 1,
0.9257864, 0.4441687, -0.2683748, 0, 0, 0, 1, 1,
0.9261163, 0.05802721, 2.559571, 0, 0, 0, 1, 1,
0.9294232, -0.2481108, 2.640582, 0, 0, 0, 1, 1,
0.9301177, 0.8502624, 1.494329, 0, 0, 0, 1, 1,
0.9306471, -0.6754088, 1.451882, 0, 0, 0, 1, 1,
0.9375875, -1.531843, 1.436133, 1, 1, 1, 1, 1,
0.9396947, 0.2132034, 2.398594, 1, 1, 1, 1, 1,
0.9446217, -0.7343355, 3.490721, 1, 1, 1, 1, 1,
0.9484265, -0.6159967, 2.807747, 1, 1, 1, 1, 1,
0.9594269, 1.020322, 1.48273, 1, 1, 1, 1, 1,
0.9608093, 1.025283, -0.7328095, 1, 1, 1, 1, 1,
0.9617649, 2.243859, 1.31741, 1, 1, 1, 1, 1,
0.9807392, -0.9446261, 1.812494, 1, 1, 1, 1, 1,
0.9822389, 0.8588833, 1.811571, 1, 1, 1, 1, 1,
0.9847074, -0.3973162, 1.884116, 1, 1, 1, 1, 1,
0.9868401, -1.005884, 2.349659, 1, 1, 1, 1, 1,
0.9906971, 1.430883, 1.204743, 1, 1, 1, 1, 1,
0.9921125, 1.692931, -1.83674, 1, 1, 1, 1, 1,
1.002004, 0.6660107, 0.3693652, 1, 1, 1, 1, 1,
1.003518, -0.04139254, 2.451078, 1, 1, 1, 1, 1,
1.014297, 0.7775755, 0.4137362, 0, 0, 1, 1, 1,
1.018297, -1.176678, 1.821255, 1, 0, 0, 1, 1,
1.027277, -0.8427889, 2.644192, 1, 0, 0, 1, 1,
1.027284, 3.268817, -2.915637, 1, 0, 0, 1, 1,
1.029328, 0.6309676, 2.455564, 1, 0, 0, 1, 1,
1.032399, -0.9690698, 2.303039, 1, 0, 0, 1, 1,
1.032735, 0.6818168, 0.5291629, 0, 0, 0, 1, 1,
1.033245, 1.336284, 0.3078149, 0, 0, 0, 1, 1,
1.03794, 0.6456864, -0.4203308, 0, 0, 0, 1, 1,
1.039479, -1.478507, 2.230854, 0, 0, 0, 1, 1,
1.040384, 0.3172409, -0.2200834, 0, 0, 0, 1, 1,
1.048486, 0.1946419, 1.915987, 0, 0, 0, 1, 1,
1.055733, 1.352508, 1.032536, 0, 0, 0, 1, 1,
1.063615, 0.4940369, 2.768351, 1, 1, 1, 1, 1,
1.072681, -0.2260914, 1.614185, 1, 1, 1, 1, 1,
1.080679, 0.4716417, 0.1856878, 1, 1, 1, 1, 1,
1.089686, 1.178261, -0.9091874, 1, 1, 1, 1, 1,
1.097722, 1.192657, 0.8303158, 1, 1, 1, 1, 1,
1.102445, 0.7552767, 0.8435212, 1, 1, 1, 1, 1,
1.113512, 0.9393231, 2.412014, 1, 1, 1, 1, 1,
1.117702, -1.059847, 1.922219, 1, 1, 1, 1, 1,
1.145763, 0.7297176, 1.748654, 1, 1, 1, 1, 1,
1.149517, 0.2413271, 2.70727, 1, 1, 1, 1, 1,
1.161265, -1.168953, 2.562554, 1, 1, 1, 1, 1,
1.167193, -1.141147, 1.50389, 1, 1, 1, 1, 1,
1.168396, 0.3173925, 3.130595, 1, 1, 1, 1, 1,
1.184435, -0.318597, 3.414163, 1, 1, 1, 1, 1,
1.195919, -2.269177, 3.446209, 1, 1, 1, 1, 1,
1.201057, -0.5110452, 1.568058, 0, 0, 1, 1, 1,
1.210778, -0.1593186, 3.516888, 1, 0, 0, 1, 1,
1.225294, 1.481673, 0.8758299, 1, 0, 0, 1, 1,
1.228681, -0.5797906, 1.253434, 1, 0, 0, 1, 1,
1.240132, -0.7631716, 3.411771, 1, 0, 0, 1, 1,
1.243069, -1.458218, 4.147233, 1, 0, 0, 1, 1,
1.24499, 0.7920012, 0.6471362, 0, 0, 0, 1, 1,
1.250183, -0.1481652, 1.636396, 0, 0, 0, 1, 1,
1.256475, -0.09664045, 1.81651, 0, 0, 0, 1, 1,
1.256721, 2.127665, 1.01701, 0, 0, 0, 1, 1,
1.257555, -0.1815563, 1.749956, 0, 0, 0, 1, 1,
1.262931, 0.5228298, 0.4388901, 0, 0, 0, 1, 1,
1.275271, -0.1049676, 1.381115, 0, 0, 0, 1, 1,
1.276325, -1.010952, 2.216458, 1, 1, 1, 1, 1,
1.281299, -1.093959, 1.505308, 1, 1, 1, 1, 1,
1.283764, -2.606566, 4.202268, 1, 1, 1, 1, 1,
1.288488, -1.228924, 0.05646709, 1, 1, 1, 1, 1,
1.291656, -0.4663706, 0.917895, 1, 1, 1, 1, 1,
1.295867, -0.9715055, 2.64606, 1, 1, 1, 1, 1,
1.300607, -0.6474564, 3.108361, 1, 1, 1, 1, 1,
1.30189, 0.4000656, 0.8495226, 1, 1, 1, 1, 1,
1.302337, 1.242014, 1.150673, 1, 1, 1, 1, 1,
1.320179, 0.9578317, 0.189775, 1, 1, 1, 1, 1,
1.32093, 2.229251, 0.3617245, 1, 1, 1, 1, 1,
1.322182, -0.5980493, 2.065282, 1, 1, 1, 1, 1,
1.324843, -0.0805558, 1.671579, 1, 1, 1, 1, 1,
1.328702, 0.8559754, 1.143924, 1, 1, 1, 1, 1,
1.34751, 1.638195, 1.263626, 1, 1, 1, 1, 1,
1.353419, -0.1600523, 2.009007, 0, 0, 1, 1, 1,
1.356149, -0.4810491, 1.563238, 1, 0, 0, 1, 1,
1.366991, -0.1393952, 1.469537, 1, 0, 0, 1, 1,
1.370016, -0.2428948, 0.2369184, 1, 0, 0, 1, 1,
1.375076, -0.2104421, 0.852751, 1, 0, 0, 1, 1,
1.375256, 0.261241, 1.173415, 1, 0, 0, 1, 1,
1.377294, -0.05855294, 2.500874, 0, 0, 0, 1, 1,
1.383398, 0.551124, 0.03330192, 0, 0, 0, 1, 1,
1.39419, -1.668077, 1.078288, 0, 0, 0, 1, 1,
1.395569, -0.2394354, 2.233218, 0, 0, 0, 1, 1,
1.403388, 0.02633156, 0.6305792, 0, 0, 0, 1, 1,
1.409934, 2.32635, -0.4674762, 0, 0, 0, 1, 1,
1.412673, 0.5543002, 2.194822, 0, 0, 0, 1, 1,
1.420676, -0.2309769, 1.353578, 1, 1, 1, 1, 1,
1.422136, 1.443994, 0.3619567, 1, 1, 1, 1, 1,
1.433128, 0.7048494, 0.8913711, 1, 1, 1, 1, 1,
1.43398, 0.609166, 0.9796975, 1, 1, 1, 1, 1,
1.435972, 1.35924, 1.368202, 1, 1, 1, 1, 1,
1.438957, -0.9595048, 2.010452, 1, 1, 1, 1, 1,
1.45237, -0.8384652, 1.97192, 1, 1, 1, 1, 1,
1.456331, -2.402374, 2.245504, 1, 1, 1, 1, 1,
1.461284, 2.562251, 1.815002, 1, 1, 1, 1, 1,
1.463675, 0.2791864, 0.3179429, 1, 1, 1, 1, 1,
1.464932, 0.4009177, 0.9958696, 1, 1, 1, 1, 1,
1.470807, 0.2703406, 2.105848, 1, 1, 1, 1, 1,
1.473813, -0.5014631, 2.615427, 1, 1, 1, 1, 1,
1.502639, 1.370914, 1.018295, 1, 1, 1, 1, 1,
1.512436, -0.357861, 2.494746, 1, 1, 1, 1, 1,
1.513214, 0.7490385, 1.801474, 0, 0, 1, 1, 1,
1.517154, 0.4358455, 1.194258, 1, 0, 0, 1, 1,
1.51825, -0.2371497, 0.2863582, 1, 0, 0, 1, 1,
1.522076, 1.24784, 0.8869438, 1, 0, 0, 1, 1,
1.527372, -0.7440776, 1.874571, 1, 0, 0, 1, 1,
1.531264, -0.7142159, 1.918549, 1, 0, 0, 1, 1,
1.532743, 1.940999, 1.215472, 0, 0, 0, 1, 1,
1.535135, 0.4558781, 1.020259, 0, 0, 0, 1, 1,
1.543162, 2.47823, -0.1987954, 0, 0, 0, 1, 1,
1.544656, 0.272703, 2.013695, 0, 0, 0, 1, 1,
1.550841, 0.08504085, 1.31025, 0, 0, 0, 1, 1,
1.555147, -0.8532594, 1.942235, 0, 0, 0, 1, 1,
1.559678, 0.2416747, 3.018004, 0, 0, 0, 1, 1,
1.567158, 1.407485, 0.2246165, 1, 1, 1, 1, 1,
1.567587, 0.0330946, 2.421212, 1, 1, 1, 1, 1,
1.568411, 0.9816642, 2.092165, 1, 1, 1, 1, 1,
1.577675, 0.2160886, 1.487512, 1, 1, 1, 1, 1,
1.579761, -1.009758, 4.333784, 1, 1, 1, 1, 1,
1.582021, -0.2198395, 1.950194, 1, 1, 1, 1, 1,
1.584394, 0.2631676, 1.433469, 1, 1, 1, 1, 1,
1.602856, -1.096908, 3.524663, 1, 1, 1, 1, 1,
1.605596, -1.041874, 0.4959404, 1, 1, 1, 1, 1,
1.612422, 0.4901103, 2.018609, 1, 1, 1, 1, 1,
1.617522, -0.05775027, 1.8997, 1, 1, 1, 1, 1,
1.647119, -0.6782014, 2.928593, 1, 1, 1, 1, 1,
1.65776, -0.385214, 3.071631, 1, 1, 1, 1, 1,
1.668373, -0.4130665, 1.666751, 1, 1, 1, 1, 1,
1.673355, -0.4006124, 1.37925, 1, 1, 1, 1, 1,
1.674181, -0.1193407, 2.384747, 0, 0, 1, 1, 1,
1.680526, 1.644103, 0.7400709, 1, 0, 0, 1, 1,
1.685541, -0.4483061, 2.816789, 1, 0, 0, 1, 1,
1.692261, 0.4185778, 0.3698249, 1, 0, 0, 1, 1,
1.703274, -0.8365571, 1.682712, 1, 0, 0, 1, 1,
1.712418, -1.007879, 2.188525, 1, 0, 0, 1, 1,
1.73739, -0.06245532, -0.2145634, 0, 0, 0, 1, 1,
1.75916, 0.0001682865, 0.9000828, 0, 0, 0, 1, 1,
1.763816, -0.01473338, 3.468743, 0, 0, 0, 1, 1,
1.771404, -0.1721977, 2.448332, 0, 0, 0, 1, 1,
1.778306, -0.7012458, 2.58377, 0, 0, 0, 1, 1,
1.787543, 0.4204441, 1.492704, 0, 0, 0, 1, 1,
1.790405, -1.210948, 2.268113, 0, 0, 0, 1, 1,
1.806338, -0.9279203, 3.679734, 1, 1, 1, 1, 1,
1.811972, 0.897553, 1.096136, 1, 1, 1, 1, 1,
1.814468, -0.7737968, 1.363299, 1, 1, 1, 1, 1,
1.818928, -0.8394958, 3.145878, 1, 1, 1, 1, 1,
1.828716, -0.2850092, 1.071892, 1, 1, 1, 1, 1,
1.829948, -0.4509477, 2.433712, 1, 1, 1, 1, 1,
1.852611, -0.1123515, 2.948075, 1, 1, 1, 1, 1,
1.874149, -0.3047921, 2.74452, 1, 1, 1, 1, 1,
1.879072, -2.37339, 1.964182, 1, 1, 1, 1, 1,
1.882204, 0.1478391, 0.90834, 1, 1, 1, 1, 1,
1.969071, 0.6430476, 0.597066, 1, 1, 1, 1, 1,
2.047821, -0.281137, 3.223393, 1, 1, 1, 1, 1,
2.084405, 1.963669, 2.559673, 1, 1, 1, 1, 1,
2.119224, -0.4930595, 2.642391, 1, 1, 1, 1, 1,
2.138749, 1.256591, 2.127646, 1, 1, 1, 1, 1,
2.161828, 0.8309644, 1.481426, 0, 0, 1, 1, 1,
2.17633, 2.163043, 0.6588497, 1, 0, 0, 1, 1,
2.179009, -0.978457, 2.506754, 1, 0, 0, 1, 1,
2.198915, 0.4238981, 1.604869, 1, 0, 0, 1, 1,
2.201029, 0.3310449, 1.017398, 1, 0, 0, 1, 1,
2.213078, 0.9613373, 2.188074, 1, 0, 0, 1, 1,
2.226397, -0.04258601, 1.359671, 0, 0, 0, 1, 1,
2.237815, -0.5850425, -1.29769, 0, 0, 0, 1, 1,
2.250654, -0.2943712, 1.745754, 0, 0, 0, 1, 1,
2.402831, -1.070306, 1.531419, 0, 0, 0, 1, 1,
2.56818, 1.249941, 3.730706, 0, 0, 0, 1, 1,
2.580975, -0.13679, 2.064059, 0, 0, 0, 1, 1,
2.615197, 1.152704, 0.513289, 0, 0, 0, 1, 1,
2.615232, -0.6026565, 3.003444, 1, 1, 1, 1, 1,
2.658934, 1.111616, 1.45298, 1, 1, 1, 1, 1,
2.69683, -0.04159968, 1.801085, 1, 1, 1, 1, 1,
2.85302, -0.1448424, 2.465661, 1, 1, 1, 1, 1,
2.900666, 0.8128899, 0.336544, 1, 1, 1, 1, 1,
2.9836, 0.6160335, 1.275835, 1, 1, 1, 1, 1,
3.505278, -1.03135, 2.385573, 1, 1, 1, 1, 1
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
var radius = 9.4029;
var distance = 33.02729;
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
mvMatrix.translate( -0.08360672, -0.1005759, 0.1774273 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.02729);
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
