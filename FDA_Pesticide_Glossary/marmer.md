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
-3.442205, 0.3372752, -1.78583, 1, 0, 0, 1,
-3.29276, -0.3454447, -3.243546, 1, 0.007843138, 0, 1,
-2.913507, -1.032513, -1.921002, 1, 0.01176471, 0, 1,
-2.575433, -0.4623748, -0.6413112, 1, 0.01960784, 0, 1,
-2.453104, -0.3669761, -2.246765, 1, 0.02352941, 0, 1,
-2.441458, -0.6251296, -2.368806, 1, 0.03137255, 0, 1,
-2.342791, 1.126445, -0.6228575, 1, 0.03529412, 0, 1,
-2.337787, -0.1744212, -0.6998696, 1, 0.04313726, 0, 1,
-2.283243, -1.135332, -1.823137, 1, 0.04705882, 0, 1,
-2.275325, -0.9795482, -3.333965, 1, 0.05490196, 0, 1,
-2.269105, -1.047451, -2.442505, 1, 0.05882353, 0, 1,
-2.211559, -0.05755305, -2.275846, 1, 0.06666667, 0, 1,
-2.134099, -0.6079275, -1.214466, 1, 0.07058824, 0, 1,
-2.114804, 0.7427331, -2.008518, 1, 0.07843138, 0, 1,
-2.083031, -1.498578, -3.986027, 1, 0.08235294, 0, 1,
-2.072129, 1.106943, -0.6338824, 1, 0.09019608, 0, 1,
-2.067587, 0.1758151, -0.5039687, 1, 0.09411765, 0, 1,
-2.058367, 1.095138, -0.9590335, 1, 0.1019608, 0, 1,
-2.016185, -0.2441334, -1.117794, 1, 0.1098039, 0, 1,
-1.994799, 0.3653279, -1.608762, 1, 0.1137255, 0, 1,
-1.972302, 2.074461, -1.440994, 1, 0.1215686, 0, 1,
-1.96847, -1.014158, -1.590859, 1, 0.1254902, 0, 1,
-1.964536, 0.1676827, 0.2213411, 1, 0.1333333, 0, 1,
-1.954085, 0.7355041, -1.346917, 1, 0.1372549, 0, 1,
-1.949801, 0.9104601, -2.769768, 1, 0.145098, 0, 1,
-1.927561, 0.1918867, -2.017978, 1, 0.1490196, 0, 1,
-1.916091, 0.5861986, -0.468597, 1, 0.1568628, 0, 1,
-1.904903, 1.591336, 0.4751538, 1, 0.1607843, 0, 1,
-1.899767, -0.3222888, -2.563431, 1, 0.1686275, 0, 1,
-1.894729, -2.106901, -1.239267, 1, 0.172549, 0, 1,
-1.888707, -0.6454123, -1.696199, 1, 0.1803922, 0, 1,
-1.860908, -0.9974071, -2.561175, 1, 0.1843137, 0, 1,
-1.854462, -0.7066445, -3.469982, 1, 0.1921569, 0, 1,
-1.828841, 0.1447311, -1.010129, 1, 0.1960784, 0, 1,
-1.811561, -0.2553445, -1.772269, 1, 0.2039216, 0, 1,
-1.8021, 2.01351, 0.62941, 1, 0.2117647, 0, 1,
-1.773494, 2.178681, -0.1051909, 1, 0.2156863, 0, 1,
-1.772847, 1.300291, -2.449685, 1, 0.2235294, 0, 1,
-1.771003, 0.5738169, -0.5513363, 1, 0.227451, 0, 1,
-1.766685, -0.6949342, -1.599254, 1, 0.2352941, 0, 1,
-1.760793, -0.5576625, -1.660983, 1, 0.2392157, 0, 1,
-1.76022, 0.5371049, -0.9293362, 1, 0.2470588, 0, 1,
-1.747099, 0.7488886, -3.729539, 1, 0.2509804, 0, 1,
-1.72691, -0.3195947, -2.334604, 1, 0.2588235, 0, 1,
-1.722098, -0.2345549, -2.226032, 1, 0.2627451, 0, 1,
-1.717687, -0.6766837, -3.116669, 1, 0.2705882, 0, 1,
-1.699216, 0.07564341, -1.453795, 1, 0.2745098, 0, 1,
-1.684658, 1.139245, 0.9169253, 1, 0.282353, 0, 1,
-1.680325, -0.9583425, -1.367432, 1, 0.2862745, 0, 1,
-1.671509, 0.9871721, -1.473911, 1, 0.2941177, 0, 1,
-1.669256, 0.1701023, -1.842348, 1, 0.3019608, 0, 1,
-1.666442, 1.502223, -0.2002895, 1, 0.3058824, 0, 1,
-1.663055, -0.2775401, -0.5214742, 1, 0.3137255, 0, 1,
-1.658113, -0.03001536, -0.9558424, 1, 0.3176471, 0, 1,
-1.65258, 0.7806633, -2.395186, 1, 0.3254902, 0, 1,
-1.649654, -0.581622, -0.4345108, 1, 0.3294118, 0, 1,
-1.642681, -0.1484923, 0.5003302, 1, 0.3372549, 0, 1,
-1.621893, 0.5833603, -0.7626662, 1, 0.3411765, 0, 1,
-1.611603, 1.115703, -0.8218256, 1, 0.3490196, 0, 1,
-1.60351, -0.8286583, -1.765407, 1, 0.3529412, 0, 1,
-1.596027, 1.118085, -0.6724711, 1, 0.3607843, 0, 1,
-1.595767, -0.2548197, -1.222864, 1, 0.3647059, 0, 1,
-1.593419, -0.282826, -1.525895, 1, 0.372549, 0, 1,
-1.586557, -0.09661348, -0.7853659, 1, 0.3764706, 0, 1,
-1.57714, 0.6101148, -0.4104121, 1, 0.3843137, 0, 1,
-1.576554, 0.7050066, -1.767454, 1, 0.3882353, 0, 1,
-1.564109, 0.2226902, -1.015094, 1, 0.3960784, 0, 1,
-1.550924, -1.424291, -2.420253, 1, 0.4039216, 0, 1,
-1.538061, 1.627274, -1.065104, 1, 0.4078431, 0, 1,
-1.535301, 0.06261442, -0.4276987, 1, 0.4156863, 0, 1,
-1.52935, 1.165335, -1.623208, 1, 0.4196078, 0, 1,
-1.523005, -0.4074414, -0.9728597, 1, 0.427451, 0, 1,
-1.505897, 1.277733, -1.804144, 1, 0.4313726, 0, 1,
-1.504472, 0.2482107, -0.8711334, 1, 0.4392157, 0, 1,
-1.491156, 0.6943741, -1.750916, 1, 0.4431373, 0, 1,
-1.468411, 0.5867571, 0.1010069, 1, 0.4509804, 0, 1,
-1.458695, -0.2920348, -1.566902, 1, 0.454902, 0, 1,
-1.453702, 2.026209, -0.1086482, 1, 0.4627451, 0, 1,
-1.438372, -1.049447, -2.636912, 1, 0.4666667, 0, 1,
-1.435589, 1.780584, -1.277907, 1, 0.4745098, 0, 1,
-1.435438, -0.7280146, -1.525378, 1, 0.4784314, 0, 1,
-1.425384, 0.01410982, -2.987174, 1, 0.4862745, 0, 1,
-1.419365, -0.07906122, -0.3998184, 1, 0.4901961, 0, 1,
-1.413013, 0.2483942, -0.8876229, 1, 0.4980392, 0, 1,
-1.403085, 0.2952138, -0.6739196, 1, 0.5058824, 0, 1,
-1.402266, 0.1646765, -0.1413417, 1, 0.509804, 0, 1,
-1.401173, -1.338052, -1.785389, 1, 0.5176471, 0, 1,
-1.372825, 1.424828, -0.488678, 1, 0.5215687, 0, 1,
-1.371056, -1.956889, -0.1866041, 1, 0.5294118, 0, 1,
-1.368886, -0.921073, -1.777861, 1, 0.5333334, 0, 1,
-1.368723, 0.7481862, -0.7192771, 1, 0.5411765, 0, 1,
-1.355737, 1.178219, -0.5432469, 1, 0.5450981, 0, 1,
-1.355189, -0.8482883, -1.424614, 1, 0.5529412, 0, 1,
-1.353967, 0.3076141, -2.325889, 1, 0.5568628, 0, 1,
-1.350883, 0.4267113, -1.550589, 1, 0.5647059, 0, 1,
-1.338386, 0.3765948, -0.7308201, 1, 0.5686275, 0, 1,
-1.33581, 0.2634962, -3.024937, 1, 0.5764706, 0, 1,
-1.334556, 0.1587493, -1.01017, 1, 0.5803922, 0, 1,
-1.334238, -0.5686609, -1.773, 1, 0.5882353, 0, 1,
-1.334146, 0.2962919, -0.6066086, 1, 0.5921569, 0, 1,
-1.33181, -0.01676505, -1.923573, 1, 0.6, 0, 1,
-1.329389, 0.5106178, 0.6162084, 1, 0.6078432, 0, 1,
-1.322322, -1.321086, -4.269665, 1, 0.6117647, 0, 1,
-1.308926, -0.0637702, -3.015975, 1, 0.6196079, 0, 1,
-1.292391, -0.8054786, -2.577028, 1, 0.6235294, 0, 1,
-1.282971, -0.7434014, -2.091707, 1, 0.6313726, 0, 1,
-1.273081, 0.4417851, -0.6500588, 1, 0.6352941, 0, 1,
-1.26777, -2.174892, -1.731014, 1, 0.6431373, 0, 1,
-1.26666, 1.546074, -0.1291862, 1, 0.6470588, 0, 1,
-1.253073, -0.4677232, -2.461984, 1, 0.654902, 0, 1,
-1.246697, 0.4396413, -0.9336569, 1, 0.6588235, 0, 1,
-1.23638, 1.317613, -1.299749, 1, 0.6666667, 0, 1,
-1.234702, 0.6506527, -0.9629374, 1, 0.6705883, 0, 1,
-1.229437, -0.1298237, -2.04431, 1, 0.6784314, 0, 1,
-1.227182, -0.1729233, -1.789253, 1, 0.682353, 0, 1,
-1.227046, -0.8847896, -2.066879, 1, 0.6901961, 0, 1,
-1.22442, 0.1903068, -0.1633555, 1, 0.6941177, 0, 1,
-1.221615, -1.011102, -1.556371, 1, 0.7019608, 0, 1,
-1.219301, 0.1894671, -0.2178191, 1, 0.7098039, 0, 1,
-1.21885, -1.633458, -2.433284, 1, 0.7137255, 0, 1,
-1.2166, 0.394448, -1.037418, 1, 0.7215686, 0, 1,
-1.200973, -1.800208, -3.286392, 1, 0.7254902, 0, 1,
-1.198272, -1.602886, -3.191524, 1, 0.7333333, 0, 1,
-1.19759, -0.7422547, -0.8146455, 1, 0.7372549, 0, 1,
-1.193812, 0.1878984, -2.209116, 1, 0.7450981, 0, 1,
-1.192905, 1.745704, -1.318107, 1, 0.7490196, 0, 1,
-1.189615, 0.83752, -0.6229793, 1, 0.7568628, 0, 1,
-1.181397, -0.4076677, -2.730962, 1, 0.7607843, 0, 1,
-1.175267, 1.362059, -1.455774, 1, 0.7686275, 0, 1,
-1.173611, 1.391555, -0.6332583, 1, 0.772549, 0, 1,
-1.173467, -0.524916, -3.728705, 1, 0.7803922, 0, 1,
-1.172292, 0.9414104, -2.162115, 1, 0.7843137, 0, 1,
-1.171538, -0.5879475, -2.408766, 1, 0.7921569, 0, 1,
-1.168577, -1.449047, -0.9779019, 1, 0.7960784, 0, 1,
-1.168546, -1.777881, -2.996519, 1, 0.8039216, 0, 1,
-1.16686, -0.9491649, -1.930799, 1, 0.8117647, 0, 1,
-1.158409, 1.523494, -0.636619, 1, 0.8156863, 0, 1,
-1.157395, 1.377419, -0.4331501, 1, 0.8235294, 0, 1,
-1.156634, 0.9728395, -1.662813, 1, 0.827451, 0, 1,
-1.138224, -1.159137, -2.009064, 1, 0.8352941, 0, 1,
-1.137874, -0.5349933, 0.1606687, 1, 0.8392157, 0, 1,
-1.133307, 1.682113, -0.7969483, 1, 0.8470588, 0, 1,
-1.128129, 0.1945477, -2.258773, 1, 0.8509804, 0, 1,
-1.115815, 1.834402, -0.7409453, 1, 0.8588235, 0, 1,
-1.106035, -0.7399951, -0.9981187, 1, 0.8627451, 0, 1,
-1.105639, -1.50156, -4.39599, 1, 0.8705882, 0, 1,
-1.101505, 0.2164134, -2.066772, 1, 0.8745098, 0, 1,
-1.10104, 1.166435, 0.5600376, 1, 0.8823529, 0, 1,
-1.095772, 0.3612472, -2.025688, 1, 0.8862745, 0, 1,
-1.078227, 0.3516367, -1.661158, 1, 0.8941177, 0, 1,
-1.077806, -0.3558169, -0.4948165, 1, 0.8980392, 0, 1,
-1.070505, 0.9950845, 0.08171764, 1, 0.9058824, 0, 1,
-1.068575, 0.6741241, -1.593884, 1, 0.9137255, 0, 1,
-1.067771, 0.9661101, -0.8105022, 1, 0.9176471, 0, 1,
-1.065287, -1.073046, -2.689204, 1, 0.9254902, 0, 1,
-1.06518, -1.182319, -3.501705, 1, 0.9294118, 0, 1,
-1.062645, 0.2154504, -1.883568, 1, 0.9372549, 0, 1,
-1.058153, 0.5513362, -0.9992356, 1, 0.9411765, 0, 1,
-1.054654, 0.4721047, -0.4120575, 1, 0.9490196, 0, 1,
-1.052299, 0.05259478, -2.144037, 1, 0.9529412, 0, 1,
-1.040302, -1.049449, -2.608017, 1, 0.9607843, 0, 1,
-1.0348, 0.2870954, -1.712218, 1, 0.9647059, 0, 1,
-1.024302, 0.8144721, -2.505054, 1, 0.972549, 0, 1,
-1.021842, 0.1639023, -1.706956, 1, 0.9764706, 0, 1,
-1.017495, 0.8962529, -1.046558, 1, 0.9843137, 0, 1,
-1.013676, 1.420546, -0.1410868, 1, 0.9882353, 0, 1,
-1.010479, -0.7752098, -2.815798, 1, 0.9960784, 0, 1,
-1.006233, 0.07718419, -1.464546, 0.9960784, 1, 0, 1,
-1.005303, -0.8332212, -2.774143, 0.9921569, 1, 0, 1,
-0.9984619, -0.8247352, -0.5615429, 0.9843137, 1, 0, 1,
-0.9971851, -0.9006734, -3.319276, 0.9803922, 1, 0, 1,
-0.9946817, 2.689316, 0.12302, 0.972549, 1, 0, 1,
-0.9916657, 0.1031339, -0.09984586, 0.9686275, 1, 0, 1,
-0.9834746, 0.2169979, 0.1354202, 0.9607843, 1, 0, 1,
-0.9709373, -0.02577819, -2.958185, 0.9568627, 1, 0, 1,
-0.9676901, -1.029017, -0.3882865, 0.9490196, 1, 0, 1,
-0.9674529, -0.7390996, -3.359546, 0.945098, 1, 0, 1,
-0.966844, 0.581009, 1.723433, 0.9372549, 1, 0, 1,
-0.9642652, 0.6810133, -0.992757, 0.9333333, 1, 0, 1,
-0.9640761, -0.0449165, -4.356693, 0.9254902, 1, 0, 1,
-0.9592353, -1.76331, -3.661985, 0.9215686, 1, 0, 1,
-0.9531579, -1.110581, -2.416478, 0.9137255, 1, 0, 1,
-0.9491703, -0.807781, -2.448899, 0.9098039, 1, 0, 1,
-0.9463698, 0.03863242, -1.313063, 0.9019608, 1, 0, 1,
-0.9361932, -0.08727493, -1.07803, 0.8941177, 1, 0, 1,
-0.9335672, -1.449198, -0.8910857, 0.8901961, 1, 0, 1,
-0.9327044, 0.7377579, -1.148088, 0.8823529, 1, 0, 1,
-0.9310024, -0.7664397, -2.962927, 0.8784314, 1, 0, 1,
-0.9260705, -0.3510162, -2.60675, 0.8705882, 1, 0, 1,
-0.9235243, 0.3749528, 0.4004594, 0.8666667, 1, 0, 1,
-0.9229733, 0.4795893, -0.261063, 0.8588235, 1, 0, 1,
-0.9218439, -0.2579774, -1.345528, 0.854902, 1, 0, 1,
-0.9162694, 1.8152, 0.975113, 0.8470588, 1, 0, 1,
-0.9057525, 1.602985, 1.552812, 0.8431373, 1, 0, 1,
-0.8967724, 0.0540431, -1.486537, 0.8352941, 1, 0, 1,
-0.8912067, 0.1113513, -1.381333, 0.8313726, 1, 0, 1,
-0.8843833, 0.3196715, -2.082265, 0.8235294, 1, 0, 1,
-0.8820937, 0.3195821, -1.256894, 0.8196079, 1, 0, 1,
-0.8758041, -0.5161856, -3.108711, 0.8117647, 1, 0, 1,
-0.8750052, 1.615135, 0.01268238, 0.8078431, 1, 0, 1,
-0.8717744, -0.7164863, -0.493748, 0.8, 1, 0, 1,
-0.8646029, -1.238299, -3.252249, 0.7921569, 1, 0, 1,
-0.853467, 0.5436093, -2.492584, 0.7882353, 1, 0, 1,
-0.8453948, -0.6472455, -1.873637, 0.7803922, 1, 0, 1,
-0.8421237, 0.3613772, -1.814752, 0.7764706, 1, 0, 1,
-0.822525, 1.042336, -1.914718, 0.7686275, 1, 0, 1,
-0.8220481, 1.261275, -1.483712, 0.7647059, 1, 0, 1,
-0.8184755, 0.08068757, 0.9995397, 0.7568628, 1, 0, 1,
-0.815578, -0.6000608, -1.157165, 0.7529412, 1, 0, 1,
-0.813704, -0.7496932, -2.404438, 0.7450981, 1, 0, 1,
-0.8128452, 1.094518, 0.3370265, 0.7411765, 1, 0, 1,
-0.8112817, 1.558985, 0.3759337, 0.7333333, 1, 0, 1,
-0.8073236, -0.0948637, -1.368465, 0.7294118, 1, 0, 1,
-0.8002021, -0.06132798, -2.449942, 0.7215686, 1, 0, 1,
-0.7999662, -0.06303258, -2.809249, 0.7176471, 1, 0, 1,
-0.7976221, -0.694057, -4.643583, 0.7098039, 1, 0, 1,
-0.7968051, -0.7430315, -2.890014, 0.7058824, 1, 0, 1,
-0.7847028, 1.03017, -0.1681843, 0.6980392, 1, 0, 1,
-0.7794348, -0.6646649, -2.781155, 0.6901961, 1, 0, 1,
-0.777568, -0.4160419, -2.497276, 0.6862745, 1, 0, 1,
-0.7771729, -2.25734, -3.522172, 0.6784314, 1, 0, 1,
-0.7756161, 0.222132, -0.4421558, 0.6745098, 1, 0, 1,
-0.7678719, 0.08704091, -3.146509, 0.6666667, 1, 0, 1,
-0.7663288, -0.9082456, -2.573132, 0.6627451, 1, 0, 1,
-0.7659895, -0.7917919, -3.614806, 0.654902, 1, 0, 1,
-0.7655033, -1.204282, -4.203335, 0.6509804, 1, 0, 1,
-0.7620677, 0.8089532, -0.09922688, 0.6431373, 1, 0, 1,
-0.7502159, 0.4624799, -2.757303, 0.6392157, 1, 0, 1,
-0.7478411, -1.131165, -1.318167, 0.6313726, 1, 0, 1,
-0.7459862, 0.4154616, 0.03199261, 0.627451, 1, 0, 1,
-0.7425871, -0.9220295, -1.105678, 0.6196079, 1, 0, 1,
-0.7413218, 1.411094, -0.7504633, 0.6156863, 1, 0, 1,
-0.7385021, 1.815545, -0.9962543, 0.6078432, 1, 0, 1,
-0.7378794, -1.460858, -1.779976, 0.6039216, 1, 0, 1,
-0.7360488, 0.5929504, -0.9275238, 0.5960785, 1, 0, 1,
-0.7326311, 0.9139953, -0.6425958, 0.5882353, 1, 0, 1,
-0.7312078, 0.7705163, -2.040785, 0.5843138, 1, 0, 1,
-0.7280278, -0.6256436, -3.202431, 0.5764706, 1, 0, 1,
-0.7248902, -0.7680441, -2.773751, 0.572549, 1, 0, 1,
-0.7208059, -0.4278675, -1.179469, 0.5647059, 1, 0, 1,
-0.7152409, 0.2258876, -3.247199, 0.5607843, 1, 0, 1,
-0.7137179, 0.6804022, -1.66642, 0.5529412, 1, 0, 1,
-0.7001329, 0.2830987, -2.777337, 0.5490196, 1, 0, 1,
-0.6941329, -0.7127523, -1.546039, 0.5411765, 1, 0, 1,
-0.6933852, -1.212468, -1.798881, 0.5372549, 1, 0, 1,
-0.6906834, -1.675049, -1.786333, 0.5294118, 1, 0, 1,
-0.6898019, 2.122572, -0.4173943, 0.5254902, 1, 0, 1,
-0.6879913, -0.8370279, -2.385739, 0.5176471, 1, 0, 1,
-0.6846661, -0.3059876, -3.107576, 0.5137255, 1, 0, 1,
-0.6775098, -0.9739747, -3.438354, 0.5058824, 1, 0, 1,
-0.6761509, -0.4384233, 0.2099795, 0.5019608, 1, 0, 1,
-0.6757128, -0.196341, -1.662257, 0.4941176, 1, 0, 1,
-0.6733374, -0.6802276, -1.599741, 0.4862745, 1, 0, 1,
-0.6663292, 0.6639677, -1.500658, 0.4823529, 1, 0, 1,
-0.6661977, -0.5555865, -2.445212, 0.4745098, 1, 0, 1,
-0.6638691, -0.05002018, -2.066426, 0.4705882, 1, 0, 1,
-0.6632265, 0.4127819, -2.714619, 0.4627451, 1, 0, 1,
-0.662809, -0.7685955, -3.272326, 0.4588235, 1, 0, 1,
-0.6585634, 0.01502606, -0.5397661, 0.4509804, 1, 0, 1,
-0.6450265, 1.261528, -1.754397, 0.4470588, 1, 0, 1,
-0.6449279, -0.1700242, -0.2775601, 0.4392157, 1, 0, 1,
-0.6416501, -0.4641518, -1.08513, 0.4352941, 1, 0, 1,
-0.6398581, -0.2738194, -2.99712, 0.427451, 1, 0, 1,
-0.6238364, 0.2204884, -1.550134, 0.4235294, 1, 0, 1,
-0.6195788, 0.9396676, -1.198231, 0.4156863, 1, 0, 1,
-0.6177301, -1.898902, -3.678965, 0.4117647, 1, 0, 1,
-0.6133648, -0.4798551, -0.4844545, 0.4039216, 1, 0, 1,
-0.6114034, -0.5595541, -1.42099, 0.3960784, 1, 0, 1,
-0.6111761, -0.3098842, -1.396811, 0.3921569, 1, 0, 1,
-0.6099632, 1.319024, -0.5187706, 0.3843137, 1, 0, 1,
-0.6075258, 0.1026, -1.370883, 0.3803922, 1, 0, 1,
-0.6064568, -0.8716852, -3.179249, 0.372549, 1, 0, 1,
-0.6059864, -0.08455368, -1.685783, 0.3686275, 1, 0, 1,
-0.5971047, -0.5646249, -3.322445, 0.3607843, 1, 0, 1,
-0.5953794, 0.3815538, -1.179526, 0.3568628, 1, 0, 1,
-0.5938177, 0.2754567, 0.1319175, 0.3490196, 1, 0, 1,
-0.591438, -0.8332217, -4.610551, 0.345098, 1, 0, 1,
-0.5868465, 1.636616, -1.469646, 0.3372549, 1, 0, 1,
-0.5854448, 0.2258227, -0.6804469, 0.3333333, 1, 0, 1,
-0.5773036, -1.031063, -0.6842535, 0.3254902, 1, 0, 1,
-0.5737888, -2.101564, -3.788941, 0.3215686, 1, 0, 1,
-0.5672983, 0.9022425, -0.4597301, 0.3137255, 1, 0, 1,
-0.5668038, 0.268995, -0.3082979, 0.3098039, 1, 0, 1,
-0.5663419, -0.9316634, -3.481415, 0.3019608, 1, 0, 1,
-0.5638777, -0.2578863, -1.737971, 0.2941177, 1, 0, 1,
-0.5634158, -0.005414528, -0.1383201, 0.2901961, 1, 0, 1,
-0.5592388, 0.4257038, -2.396608, 0.282353, 1, 0, 1,
-0.5570574, -1.064526, -1.715272, 0.2784314, 1, 0, 1,
-0.5540627, -0.5886613, -2.386954, 0.2705882, 1, 0, 1,
-0.5535294, -0.8281566, -1.577497, 0.2666667, 1, 0, 1,
-0.5523891, -0.7519269, -1.684499, 0.2588235, 1, 0, 1,
-0.5486528, 0.7388623, -1.006429, 0.254902, 1, 0, 1,
-0.5398335, -0.1893241, -0.7805998, 0.2470588, 1, 0, 1,
-0.5382581, 0.4199764, 0.0890683, 0.2431373, 1, 0, 1,
-0.5319013, -0.3177623, -1.637867, 0.2352941, 1, 0, 1,
-0.5304253, 0.2620547, -0.2545273, 0.2313726, 1, 0, 1,
-0.5285333, 0.4728175, -0.2317069, 0.2235294, 1, 0, 1,
-0.5223392, -0.5954727, -3.368261, 0.2196078, 1, 0, 1,
-0.5216289, 1.412206, 0.03929052, 0.2117647, 1, 0, 1,
-0.5210363, -0.7345828, -2.512713, 0.2078431, 1, 0, 1,
-0.5202717, -0.5624061, -1.06874, 0.2, 1, 0, 1,
-0.5185657, -0.8435658, -5.408519, 0.1921569, 1, 0, 1,
-0.5128881, -0.7644782, -5.014816, 0.1882353, 1, 0, 1,
-0.5115831, -0.2641737, -2.435761, 0.1803922, 1, 0, 1,
-0.509275, -1.580172, -2.457653, 0.1764706, 1, 0, 1,
-0.5080244, 0.4062802, -0.6812938, 0.1686275, 1, 0, 1,
-0.5063354, -0.9965032, -3.548203, 0.1647059, 1, 0, 1,
-0.5045329, -0.2368153, -2.204297, 0.1568628, 1, 0, 1,
-0.5024279, -1.236312, -3.119072, 0.1529412, 1, 0, 1,
-0.5023257, 0.2356907, -1.508695, 0.145098, 1, 0, 1,
-0.5000558, -2.037561, -3.981351, 0.1411765, 1, 0, 1,
-0.4998362, -0.4970171, -0.5025443, 0.1333333, 1, 0, 1,
-0.4927203, -0.7612194, -2.971916, 0.1294118, 1, 0, 1,
-0.4885007, -0.9782731, -2.093468, 0.1215686, 1, 0, 1,
-0.4881121, 0.09367695, -1.780702, 0.1176471, 1, 0, 1,
-0.4876902, 2.404029, -1.623405, 0.1098039, 1, 0, 1,
-0.487325, 0.845638, -0.2793542, 0.1058824, 1, 0, 1,
-0.4847997, 1.097838, -0.2701916, 0.09803922, 1, 0, 1,
-0.4837855, -0.810517, -2.322591, 0.09019608, 1, 0, 1,
-0.4758952, -1.042742, -1.695256, 0.08627451, 1, 0, 1,
-0.475029, -0.02903805, -0.8546316, 0.07843138, 1, 0, 1,
-0.4723972, 0.7119872, 0.3904034, 0.07450981, 1, 0, 1,
-0.4707495, -0.3053917, -1.677565, 0.06666667, 1, 0, 1,
-0.4697399, 0.8491133, -0.4337329, 0.0627451, 1, 0, 1,
-0.4687714, 0.3101974, -0.2340522, 0.05490196, 1, 0, 1,
-0.4675846, 1.526678, -1.302211, 0.05098039, 1, 0, 1,
-0.4659971, -1.571026, -1.797125, 0.04313726, 1, 0, 1,
-0.4595751, -1.166426, -2.976713, 0.03921569, 1, 0, 1,
-0.4593523, 0.3252704, -0.6491547, 0.03137255, 1, 0, 1,
-0.4580712, 0.1597225, 0.8303888, 0.02745098, 1, 0, 1,
-0.4523058, 0.9823211, -1.998159, 0.01960784, 1, 0, 1,
-0.4466002, -0.4599506, -0.7211054, 0.01568628, 1, 0, 1,
-0.4424146, 0.4613611, -0.4740087, 0.007843138, 1, 0, 1,
-0.4422373, 0.3509743, 0.1710449, 0.003921569, 1, 0, 1,
-0.4418971, -1.104431, -4.060971, 0, 1, 0.003921569, 1,
-0.4403127, -2.102283, -3.875017, 0, 1, 0.01176471, 1,
-0.4396906, -0.6491408, -2.035505, 0, 1, 0.01568628, 1,
-0.4306983, -1.292805, -3.754342, 0, 1, 0.02352941, 1,
-0.4300854, 1.728262, 0.3724643, 0, 1, 0.02745098, 1,
-0.4187766, -0.562778, 0.04497097, 0, 1, 0.03529412, 1,
-0.4163083, -0.6102458, -2.133661, 0, 1, 0.03921569, 1,
-0.4158686, 0.6927041, -0.3481786, 0, 1, 0.04705882, 1,
-0.4145028, 0.5189383, -0.2526677, 0, 1, 0.05098039, 1,
-0.4091628, -0.5861353, -2.265778, 0, 1, 0.05882353, 1,
-0.405081, -0.9235286, -4.126434, 0, 1, 0.0627451, 1,
-0.403997, 0.7289644, -0.1120456, 0, 1, 0.07058824, 1,
-0.3982226, -0.5676926, -2.228014, 0, 1, 0.07450981, 1,
-0.3970821, -0.83847, -4.405828, 0, 1, 0.08235294, 1,
-0.3951115, -1.194436, -1.527239, 0, 1, 0.08627451, 1,
-0.393874, -1.631653, -4.207661, 0, 1, 0.09411765, 1,
-0.3923037, -0.8861984, -3.678967, 0, 1, 0.1019608, 1,
-0.3863595, 1.015052, -0.6898092, 0, 1, 0.1058824, 1,
-0.3859685, -0.8606855, -3.758361, 0, 1, 0.1137255, 1,
-0.3821253, 0.06252239, 0.4218446, 0, 1, 0.1176471, 1,
-0.3781613, -0.01070154, -3.313455, 0, 1, 0.1254902, 1,
-0.3779678, -0.1959952, -2.818322, 0, 1, 0.1294118, 1,
-0.3711705, 0.021023, -1.493408, 0, 1, 0.1372549, 1,
-0.3673747, -0.28354, -1.713599, 0, 1, 0.1411765, 1,
-0.3671428, 1.305505, 0.398553, 0, 1, 0.1490196, 1,
-0.3667672, 0.6948073, -2.381996, 0, 1, 0.1529412, 1,
-0.3664779, -2.355407, -3.191621, 0, 1, 0.1607843, 1,
-0.3657683, 0.9722746, 0.5545773, 0, 1, 0.1647059, 1,
-0.3637849, -2.474497, -1.374227, 0, 1, 0.172549, 1,
-0.3572534, 0.04824641, -1.467634, 0, 1, 0.1764706, 1,
-0.351858, -1.308044, -3.708325, 0, 1, 0.1843137, 1,
-0.3510445, 1.223542, -0.1868685, 0, 1, 0.1882353, 1,
-0.3473549, -1.75232, -2.675157, 0, 1, 0.1960784, 1,
-0.3451757, 1.377362, -0.8656317, 0, 1, 0.2039216, 1,
-0.3427297, 0.2540051, -0.4852691, 0, 1, 0.2078431, 1,
-0.3413298, -0.04966769, 0.05259623, 0, 1, 0.2156863, 1,
-0.3408529, -1.144053, -3.815163, 0, 1, 0.2196078, 1,
-0.340517, -0.3941489, -1.555351, 0, 1, 0.227451, 1,
-0.3381961, 1.045934, 1.426234, 0, 1, 0.2313726, 1,
-0.3372795, -0.6844659, -2.19107, 0, 1, 0.2392157, 1,
-0.3347789, -1.362971, -3.769989, 0, 1, 0.2431373, 1,
-0.3336894, 0.08843955, -0.3110038, 0, 1, 0.2509804, 1,
-0.3313186, 0.5405411, 0.1314349, 0, 1, 0.254902, 1,
-0.3243202, -0.4662246, -1.488996, 0, 1, 0.2627451, 1,
-0.3155015, -0.8880568, -3.322071, 0, 1, 0.2666667, 1,
-0.3143824, 0.9308912, -0.1684464, 0, 1, 0.2745098, 1,
-0.3124069, -0.05352756, -2.366686, 0, 1, 0.2784314, 1,
-0.3110813, 0.6028442, -1.091641, 0, 1, 0.2862745, 1,
-0.3107634, 0.7154031, 0.5663599, 0, 1, 0.2901961, 1,
-0.3099012, -0.08816883, -3.095801, 0, 1, 0.2980392, 1,
-0.3097223, -1.121048, -3.121026, 0, 1, 0.3058824, 1,
-0.3077895, 1.262256, -1.892555, 0, 1, 0.3098039, 1,
-0.3074993, 1.394484, -1.835446, 0, 1, 0.3176471, 1,
-0.3073469, -0.01903135, -1.039475, 0, 1, 0.3215686, 1,
-0.2920205, -0.2181167, -3.08858, 0, 1, 0.3294118, 1,
-0.289471, -1.474162, -3.309008, 0, 1, 0.3333333, 1,
-0.2893843, 0.07491069, -0.6232076, 0, 1, 0.3411765, 1,
-0.2875875, -0.3948919, -1.211172, 0, 1, 0.345098, 1,
-0.2863813, 0.2854218, -2.956953, 0, 1, 0.3529412, 1,
-0.2853141, 0.04750925, -2.183337, 0, 1, 0.3568628, 1,
-0.2848347, 0.5074848, -1.467689, 0, 1, 0.3647059, 1,
-0.2842883, 0.4348896, -1.709996, 0, 1, 0.3686275, 1,
-0.2815914, -2.357481, -5.190206, 0, 1, 0.3764706, 1,
-0.2773091, -1.084334, -3.011855, 0, 1, 0.3803922, 1,
-0.2745773, -0.2946863, -3.997111, 0, 1, 0.3882353, 1,
-0.2739154, -0.03086679, -1.674513, 0, 1, 0.3921569, 1,
-0.2734019, 1.786304, -0.3166593, 0, 1, 0.4, 1,
-0.2620766, -1.05941, -4.820659, 0, 1, 0.4078431, 1,
-0.2607476, 0.9229003, 0.02429463, 0, 1, 0.4117647, 1,
-0.2598775, -0.7773076, -1.653466, 0, 1, 0.4196078, 1,
-0.2595527, 0.1666958, -0.7145299, 0, 1, 0.4235294, 1,
-0.2586151, 0.002956328, -0.3798805, 0, 1, 0.4313726, 1,
-0.2541489, 0.1781668, -1.668892, 0, 1, 0.4352941, 1,
-0.2540872, 1.403153, 1.385663, 0, 1, 0.4431373, 1,
-0.2537701, 2.293683, -1.415365, 0, 1, 0.4470588, 1,
-0.2490031, 0.7943472, -0.6694011, 0, 1, 0.454902, 1,
-0.2479346, -0.2224884, -1.414736, 0, 1, 0.4588235, 1,
-0.2437277, -0.5965379, -1.787093, 0, 1, 0.4666667, 1,
-0.2411271, 0.4339393, -1.407872, 0, 1, 0.4705882, 1,
-0.2396946, 2.74474, -0.8621458, 0, 1, 0.4784314, 1,
-0.2384078, -0.2262756, -1.621138, 0, 1, 0.4823529, 1,
-0.234821, -0.3241937, -3.494502, 0, 1, 0.4901961, 1,
-0.2325902, -1.475948, -3.498442, 0, 1, 0.4941176, 1,
-0.2321005, -1.817762, -1.686271, 0, 1, 0.5019608, 1,
-0.2298368, -1.06192, -1.402995, 0, 1, 0.509804, 1,
-0.2284976, -0.8009208, -4.029716, 0, 1, 0.5137255, 1,
-0.2257237, 0.3802441, -0.3438999, 0, 1, 0.5215687, 1,
-0.2240697, 0.8744769, 0.2835076, 0, 1, 0.5254902, 1,
-0.2193412, 0.06550145, -1.463049, 0, 1, 0.5333334, 1,
-0.215736, -0.735873, -2.317385, 0, 1, 0.5372549, 1,
-0.2060486, 0.4815224, -0.8935159, 0, 1, 0.5450981, 1,
-0.2036168, -0.8563588, -3.788129, 0, 1, 0.5490196, 1,
-0.1973218, 0.433234, -1.003271, 0, 1, 0.5568628, 1,
-0.1968847, 1.050397, 0.007320059, 0, 1, 0.5607843, 1,
-0.1901738, -0.01034672, -4.05091, 0, 1, 0.5686275, 1,
-0.1883299, 0.2888393, 0.3508551, 0, 1, 0.572549, 1,
-0.1849268, -0.6547938, -2.769767, 0, 1, 0.5803922, 1,
-0.1790057, 0.4565919, -0.7808462, 0, 1, 0.5843138, 1,
-0.1756541, -1.073025, -4.022278, 0, 1, 0.5921569, 1,
-0.175398, -0.8725433, -2.397267, 0, 1, 0.5960785, 1,
-0.1730213, -0.1701597, -1.764882, 0, 1, 0.6039216, 1,
-0.1702352, 0.3616168, -0.6682762, 0, 1, 0.6117647, 1,
-0.1697301, 0.2903531, -0.7405676, 0, 1, 0.6156863, 1,
-0.1693512, 0.3077745, -0.2237401, 0, 1, 0.6235294, 1,
-0.1677414, -1.905725, -3.794743, 0, 1, 0.627451, 1,
-0.1645238, 0.5782089, -0.6131931, 0, 1, 0.6352941, 1,
-0.161731, -0.5272113, -1.462697, 0, 1, 0.6392157, 1,
-0.1604722, -1.280744, -1.924674, 0, 1, 0.6470588, 1,
-0.1542603, -1.077114, -4.59842, 0, 1, 0.6509804, 1,
-0.1533828, -1.353599, -1.551331, 0, 1, 0.6588235, 1,
-0.1514072, -1.082048, -4.941169, 0, 1, 0.6627451, 1,
-0.1504781, -0.1846087, -3.32357, 0, 1, 0.6705883, 1,
-0.1484671, 0.07849421, -0.550823, 0, 1, 0.6745098, 1,
-0.1427365, 1.097909, -0.1427953, 0, 1, 0.682353, 1,
-0.1385601, -2.473655, -2.560439, 0, 1, 0.6862745, 1,
-0.1333457, 1.409294, -0.6958756, 0, 1, 0.6941177, 1,
-0.1298928, -0.202759, -4.032699, 0, 1, 0.7019608, 1,
-0.1293208, 0.1848992, 1.68049, 0, 1, 0.7058824, 1,
-0.1269066, 1.84178, -0.1630704, 0, 1, 0.7137255, 1,
-0.1261746, -2.52767, -5.18749, 0, 1, 0.7176471, 1,
-0.1241543, 0.01754808, -2.296314, 0, 1, 0.7254902, 1,
-0.1185174, -0.07048114, -2.636985, 0, 1, 0.7294118, 1,
-0.1183028, -0.05856923, -0.5679513, 0, 1, 0.7372549, 1,
-0.1177391, 0.8436999, -1.566359, 0, 1, 0.7411765, 1,
-0.1162099, -1.081619, -4.239463, 0, 1, 0.7490196, 1,
-0.1059206, -2.131253, -3.272114, 0, 1, 0.7529412, 1,
-0.1017094, 0.4372924, -0.4645888, 0, 1, 0.7607843, 1,
-0.09784321, 1.9323, 1.241657, 0, 1, 0.7647059, 1,
-0.09759079, 0.7346314, 0.1496657, 0, 1, 0.772549, 1,
-0.0951869, -1.067064, -2.992406, 0, 1, 0.7764706, 1,
-0.09034479, 0.4588978, 0.1534532, 0, 1, 0.7843137, 1,
-0.087592, -1.005269, -3.008045, 0, 1, 0.7882353, 1,
-0.08433982, 0.07453861, -1.526797, 0, 1, 0.7960784, 1,
-0.08365023, 0.8812747, 0.5179331, 0, 1, 0.8039216, 1,
-0.07851652, -1.489848, -2.878841, 0, 1, 0.8078431, 1,
-0.07715659, 0.3422554, -0.3517143, 0, 1, 0.8156863, 1,
-0.07516029, 1.357108, 0.950076, 0, 1, 0.8196079, 1,
-0.06812894, -0.9203667, -2.57016, 0, 1, 0.827451, 1,
-0.06787214, -0.6732749, -2.682559, 0, 1, 0.8313726, 1,
-0.06129321, 0.9553594, 0.6621255, 0, 1, 0.8392157, 1,
-0.06020787, 1.084888, -0.1764307, 0, 1, 0.8431373, 1,
-0.05903475, -0.2524644, -5.515383, 0, 1, 0.8509804, 1,
-0.05553056, -0.9328169, -4.058387, 0, 1, 0.854902, 1,
-0.04925517, 2.027828, -3.086875, 0, 1, 0.8627451, 1,
-0.04546758, 0.9780607, -0.5062569, 0, 1, 0.8666667, 1,
-0.0424075, 0.8609389, -0.4810511, 0, 1, 0.8745098, 1,
-0.03946096, 0.317064, 0.4306423, 0, 1, 0.8784314, 1,
-0.03918312, 0.3869075, 0.1683777, 0, 1, 0.8862745, 1,
-0.03314602, 0.4258338, 0.9579142, 0, 1, 0.8901961, 1,
-0.0325345, 0.8320212, 0.1252795, 0, 1, 0.8980392, 1,
-0.03210821, 1.097681, 0.6875299, 0, 1, 0.9058824, 1,
-0.03177572, -0.02475939, -3.064007, 0, 1, 0.9098039, 1,
-0.02992539, -1.360051, -1.319867, 0, 1, 0.9176471, 1,
-0.02859392, 0.8603122, -1.59783, 0, 1, 0.9215686, 1,
-0.02589662, 1.481591, 0.5595577, 0, 1, 0.9294118, 1,
-0.02582052, 0.8228281, 0.1182746, 0, 1, 0.9333333, 1,
-0.02273851, -1.022066, -6.209058, 0, 1, 0.9411765, 1,
-0.02045306, -0.4939669, -1.040015, 0, 1, 0.945098, 1,
-0.0166375, 1.950484, -0.2493343, 0, 1, 0.9529412, 1,
-0.01659855, 1.063903, -0.6164396, 0, 1, 0.9568627, 1,
-0.01571828, 0.3109626, 1.185125, 0, 1, 0.9647059, 1,
-0.01225205, -0.7142023, -2.946428, 0, 1, 0.9686275, 1,
-0.00986218, -0.4279216, -3.534132, 0, 1, 0.9764706, 1,
-0.006760195, 0.7067695, -1.164352, 0, 1, 0.9803922, 1,
-0.00635552, 0.5327948, -0.5698674, 0, 1, 0.9882353, 1,
0.002274376, -0.7295312, 1.669112, 0, 1, 0.9921569, 1,
0.006324696, 1.474167, -0.007895088, 0, 1, 1, 1,
0.006799533, -0.1366571, 4.825251, 0, 0.9921569, 1, 1,
0.007826227, -1.324634, 2.518194, 0, 0.9882353, 1, 1,
0.008693211, -1.245735, 4.829812, 0, 0.9803922, 1, 1,
0.009583853, -1.075532, 4.57133, 0, 0.9764706, 1, 1,
0.0148401, 0.8522277, -0.3882471, 0, 0.9686275, 1, 1,
0.01625453, -0.8422744, 3.797678, 0, 0.9647059, 1, 1,
0.01873912, 1.97825, 1.620728, 0, 0.9568627, 1, 1,
0.01959138, -0.07995875, 3.648384, 0, 0.9529412, 1, 1,
0.02705912, -0.07499453, 2.740976, 0, 0.945098, 1, 1,
0.03189269, -0.4893113, 2.486613, 0, 0.9411765, 1, 1,
0.03757873, 0.4541311, 0.7593127, 0, 0.9333333, 1, 1,
0.04274951, 0.4091022, -0.6579945, 0, 0.9294118, 1, 1,
0.04375834, -1.136767, 3.87529, 0, 0.9215686, 1, 1,
0.05448829, -0.507875, 2.29609, 0, 0.9176471, 1, 1,
0.05519738, -0.7563236, 2.462967, 0, 0.9098039, 1, 1,
0.05649778, -0.4722726, 3.661994, 0, 0.9058824, 1, 1,
0.05746263, 0.1770897, 1.570973, 0, 0.8980392, 1, 1,
0.06045115, 1.617328, 1.870144, 0, 0.8901961, 1, 1,
0.06195213, 1.654361, -0.6129703, 0, 0.8862745, 1, 1,
0.06226294, 0.110862, 1.02136, 0, 0.8784314, 1, 1,
0.06363004, -0.3329561, 2.892636, 0, 0.8745098, 1, 1,
0.06398136, 0.1476198, 0.1794062, 0, 0.8666667, 1, 1,
0.06488593, 0.1759268, -0.4361754, 0, 0.8627451, 1, 1,
0.07294109, -0.7970565, 2.74541, 0, 0.854902, 1, 1,
0.07804753, -0.1144747, 1.763042, 0, 0.8509804, 1, 1,
0.0788851, -0.83982, 3.94066, 0, 0.8431373, 1, 1,
0.08100314, -0.2812493, 3.498943, 0, 0.8392157, 1, 1,
0.08201054, -2.475079, 3.204193, 0, 0.8313726, 1, 1,
0.08368698, -1.205489, 3.586223, 0, 0.827451, 1, 1,
0.08742049, -0.1978818, 1.855105, 0, 0.8196079, 1, 1,
0.09253148, -0.708797, 1.672489, 0, 0.8156863, 1, 1,
0.09315613, -0.520274, 3.092856, 0, 0.8078431, 1, 1,
0.09337072, -0.9229498, 4.080089, 0, 0.8039216, 1, 1,
0.0938794, -1.521018, 3.350266, 0, 0.7960784, 1, 1,
0.09574414, -1.00835, 3.375618, 0, 0.7882353, 1, 1,
0.1004605, 0.9108985, 0.4687743, 0, 0.7843137, 1, 1,
0.102314, -1.641458, 3.864623, 0, 0.7764706, 1, 1,
0.1023808, 1.864694, -0.2963269, 0, 0.772549, 1, 1,
0.107139, -0.3029031, 2.215104, 0, 0.7647059, 1, 1,
0.1083234, -0.04803891, 4.343387, 0, 0.7607843, 1, 1,
0.1106617, 0.2737048, 0.7348019, 0, 0.7529412, 1, 1,
0.1129087, 0.1054418, -0.8318627, 0, 0.7490196, 1, 1,
0.1139722, 2.874061, -1.897124, 0, 0.7411765, 1, 1,
0.1151076, 1.231209, -0.5576475, 0, 0.7372549, 1, 1,
0.1165382, -0.6891759, 2.784545, 0, 0.7294118, 1, 1,
0.1178744, 0.927673, 1.485247, 0, 0.7254902, 1, 1,
0.118502, -0.7546579, 3.541286, 0, 0.7176471, 1, 1,
0.1197775, 1.231126, -0.1003547, 0, 0.7137255, 1, 1,
0.1217707, 0.1386003, -1.378878, 0, 0.7058824, 1, 1,
0.1228721, -1.020985, 1.266696, 0, 0.6980392, 1, 1,
0.1298581, 0.5246993, -0.6022611, 0, 0.6941177, 1, 1,
0.1313542, -0.7526174, 2.360165, 0, 0.6862745, 1, 1,
0.1392707, -0.853102, 2.276522, 0, 0.682353, 1, 1,
0.1426484, -1.174196, 3.999357, 0, 0.6745098, 1, 1,
0.1446573, 1.725361, -0.3560833, 0, 0.6705883, 1, 1,
0.1492136, 0.6019517, 0.4310118, 0, 0.6627451, 1, 1,
0.1512262, 0.7556302, 0.7789488, 0, 0.6588235, 1, 1,
0.1522723, -0.2082899, 2.435778, 0, 0.6509804, 1, 1,
0.1527894, 0.2146479, 0.8904393, 0, 0.6470588, 1, 1,
0.1572277, 0.7443342, 0.1380879, 0, 0.6392157, 1, 1,
0.160756, -0.8018772, 3.417108, 0, 0.6352941, 1, 1,
0.1642852, 0.1479156, 1.246937, 0, 0.627451, 1, 1,
0.1648879, -0.3693575, 3.308288, 0, 0.6235294, 1, 1,
0.1660768, -0.495968, 2.225901, 0, 0.6156863, 1, 1,
0.1661034, -0.1037772, 1.674187, 0, 0.6117647, 1, 1,
0.1667108, 1.142169, 1.895493, 0, 0.6039216, 1, 1,
0.1677732, 0.290076, 0.819813, 0, 0.5960785, 1, 1,
0.1684232, -1.240277, 3.218662, 0, 0.5921569, 1, 1,
0.171941, -0.7397333, 1.409395, 0, 0.5843138, 1, 1,
0.175055, 0.1424782, 1.696885, 0, 0.5803922, 1, 1,
0.1755191, 0.2538293, 0.8780068, 0, 0.572549, 1, 1,
0.1821887, -0.9406971, 0.9007235, 0, 0.5686275, 1, 1,
0.186011, -0.2599548, 2.30086, 0, 0.5607843, 1, 1,
0.1893327, 1.543105, -2.564293, 0, 0.5568628, 1, 1,
0.1896422, -0.377023, 3.83362, 0, 0.5490196, 1, 1,
0.1908817, -1.248302, 3.564302, 0, 0.5450981, 1, 1,
0.1924136, -1.841325, 2.203628, 0, 0.5372549, 1, 1,
0.197175, -0.2491061, 3.073657, 0, 0.5333334, 1, 1,
0.1972654, 1.906837, -1.492487, 0, 0.5254902, 1, 1,
0.1990859, -0.6232726, 5.302173, 0, 0.5215687, 1, 1,
0.2044599, 0.04964953, 1.100747, 0, 0.5137255, 1, 1,
0.205097, 0.4155699, 0.8608425, 0, 0.509804, 1, 1,
0.2083853, 0.02173367, 1.112495, 0, 0.5019608, 1, 1,
0.2126959, -0.04173041, 2.362524, 0, 0.4941176, 1, 1,
0.2134947, 0.1365961, 2.269945, 0, 0.4901961, 1, 1,
0.2170207, 0.3241083, 1.105731, 0, 0.4823529, 1, 1,
0.2198723, 0.0885893, 0.602053, 0, 0.4784314, 1, 1,
0.2201391, -0.3286605, 2.287413, 0, 0.4705882, 1, 1,
0.2229731, 0.2766292, 0.3319634, 0, 0.4666667, 1, 1,
0.2243984, 0.2975793, -1.436651, 0, 0.4588235, 1, 1,
0.2257222, 0.8951665, -1.054114, 0, 0.454902, 1, 1,
0.2260444, 0.2114218, 2.264743, 0, 0.4470588, 1, 1,
0.2300984, -0.8237338, 1.798939, 0, 0.4431373, 1, 1,
0.2310328, 0.04889384, 0.3342091, 0, 0.4352941, 1, 1,
0.2315386, 1.079352, 0.6714041, 0, 0.4313726, 1, 1,
0.2382059, 0.02729662, 2.936451, 0, 0.4235294, 1, 1,
0.2384081, -0.324356, 2.79514, 0, 0.4196078, 1, 1,
0.2403906, -0.4509491, 1.595605, 0, 0.4117647, 1, 1,
0.242323, -0.3169278, 1.850182, 0, 0.4078431, 1, 1,
0.245644, -0.272551, 1.700055, 0, 0.4, 1, 1,
0.2461316, 0.1444748, 2.569086, 0, 0.3921569, 1, 1,
0.2488735, -0.2148919, 1.963891, 0, 0.3882353, 1, 1,
0.2491889, 0.2596112, 1.356153, 0, 0.3803922, 1, 1,
0.2541535, 0.9103506, 0.2860283, 0, 0.3764706, 1, 1,
0.2546662, -1.124721, 4.618051, 0, 0.3686275, 1, 1,
0.2563598, 0.4175065, -1.515581, 0, 0.3647059, 1, 1,
0.2609016, 0.9206766, 0.4226335, 0, 0.3568628, 1, 1,
0.263985, 0.2504384, 0.5552877, 0, 0.3529412, 1, 1,
0.2660856, 0.2697915, 0.8261824, 0, 0.345098, 1, 1,
0.2673, -0.6441774, 2.544992, 0, 0.3411765, 1, 1,
0.2697847, 1.068794, 0.2930269, 0, 0.3333333, 1, 1,
0.2718292, 0.3628342, 0.4015058, 0, 0.3294118, 1, 1,
0.2726859, 1.076149, 0.8098422, 0, 0.3215686, 1, 1,
0.2733768, -1.039001, 3.86777, 0, 0.3176471, 1, 1,
0.2776282, 1.14165, 0.1301555, 0, 0.3098039, 1, 1,
0.2840606, -1.288364, 4.432861, 0, 0.3058824, 1, 1,
0.2868351, 0.4416015, 2.145417, 0, 0.2980392, 1, 1,
0.2883972, -0.313284, 2.097705, 0, 0.2901961, 1, 1,
0.2892016, 0.5998077, -0.3173509, 0, 0.2862745, 1, 1,
0.2978433, -1.919232, 1.74061, 0, 0.2784314, 1, 1,
0.2983649, -0.7716858, 3.795966, 0, 0.2745098, 1, 1,
0.2985637, 0.4360665, 3.143758, 0, 0.2666667, 1, 1,
0.2995725, -1.304962, 2.63115, 0, 0.2627451, 1, 1,
0.3030418, -0.5585954, 1.335823, 0, 0.254902, 1, 1,
0.3035729, 0.3486974, 1.413607, 0, 0.2509804, 1, 1,
0.3049404, 0.5904072, 0.3809521, 0, 0.2431373, 1, 1,
0.3066289, 1.238979, 0.4957824, 0, 0.2392157, 1, 1,
0.3093281, -0.02014509, 0.7380781, 0, 0.2313726, 1, 1,
0.3114614, -0.9899676, 4.877842, 0, 0.227451, 1, 1,
0.3133892, -1.071067, 2.193924, 0, 0.2196078, 1, 1,
0.3153737, 1.312349, 1.327096, 0, 0.2156863, 1, 1,
0.3164006, 1.073325, 2.401214, 0, 0.2078431, 1, 1,
0.325408, 0.6633891, -0.0465709, 0, 0.2039216, 1, 1,
0.3430694, -1.252953, 3.324332, 0, 0.1960784, 1, 1,
0.3515107, -0.2472708, 1.436157, 0, 0.1882353, 1, 1,
0.3521346, -0.4542145, 2.168015, 0, 0.1843137, 1, 1,
0.3539251, 0.000176767, 2.40424, 0, 0.1764706, 1, 1,
0.3585078, -0.6823459, 1.827238, 0, 0.172549, 1, 1,
0.3599513, 1.083267, 0.04747902, 0, 0.1647059, 1, 1,
0.3645925, -1.479644, 2.521017, 0, 0.1607843, 1, 1,
0.3683343, -0.1692122, 1.917998, 0, 0.1529412, 1, 1,
0.3685153, -0.2116945, -0.4846554, 0, 0.1490196, 1, 1,
0.3696045, -0.08219884, 1.440894, 0, 0.1411765, 1, 1,
0.3760676, -0.2576627, 4.797233, 0, 0.1372549, 1, 1,
0.3770522, -2.178068, 4.033227, 0, 0.1294118, 1, 1,
0.3858678, 1.365724, -0.3755475, 0, 0.1254902, 1, 1,
0.3870538, -0.3419937, 1.854649, 0, 0.1176471, 1, 1,
0.3912857, -0.4202875, 4.316231, 0, 0.1137255, 1, 1,
0.3930964, -1.68933, 3.398422, 0, 0.1058824, 1, 1,
0.3972408, -0.4913504, 3.56707, 0, 0.09803922, 1, 1,
0.3974486, -1.101367, 2.371116, 0, 0.09411765, 1, 1,
0.3975115, 0.02473967, 1.382598, 0, 0.08627451, 1, 1,
0.4043176, 0.4968559, 0.7426475, 0, 0.08235294, 1, 1,
0.4047899, 0.1210854, 0.3501296, 0, 0.07450981, 1, 1,
0.4049544, 1.971671, 0.502156, 0, 0.07058824, 1, 1,
0.4065479, -0.939395, 1.097207, 0, 0.0627451, 1, 1,
0.4069609, -0.06153009, 1.320358, 0, 0.05882353, 1, 1,
0.4076648, 0.05638154, 1.753141, 0, 0.05098039, 1, 1,
0.4101821, 1.907696, -0.4979719, 0, 0.04705882, 1, 1,
0.4114137, 2.727593, -1.150986, 0, 0.03921569, 1, 1,
0.4143739, 0.2946542, 0.8177537, 0, 0.03529412, 1, 1,
0.4175057, -0.686176, 3.464104, 0, 0.02745098, 1, 1,
0.4212733, 0.8320282, 0.414079, 0, 0.02352941, 1, 1,
0.4258081, -0.3248698, 3.546095, 0, 0.01568628, 1, 1,
0.4300739, 0.5439558, -1.46766, 0, 0.01176471, 1, 1,
0.4311063, -0.8636388, 4.24534, 0, 0.003921569, 1, 1,
0.4401714, 1.232992, -0.08452994, 0.003921569, 0, 1, 1,
0.4422876, -0.8443229, 1.530872, 0.007843138, 0, 1, 1,
0.442627, -0.7523429, 2.490566, 0.01568628, 0, 1, 1,
0.4446689, -0.536736, 3.688276, 0.01960784, 0, 1, 1,
0.4498362, 0.585819, -0.03177419, 0.02745098, 0, 1, 1,
0.4502996, 0.5985985, 1.652474, 0.03137255, 0, 1, 1,
0.4548658, 0.4481021, -0.9153302, 0.03921569, 0, 1, 1,
0.4586111, -1.24399, 3.680554, 0.04313726, 0, 1, 1,
0.4608829, -0.6953657, 2.32044, 0.05098039, 0, 1, 1,
0.462367, -1.779444, 1.996182, 0.05490196, 0, 1, 1,
0.4651675, -0.9615952, 1.226918, 0.0627451, 0, 1, 1,
0.4686206, -1.787929, 2.886873, 0.06666667, 0, 1, 1,
0.4759518, 0.5871496, -0.4102872, 0.07450981, 0, 1, 1,
0.4785214, 1.806472, -0.6453745, 0.07843138, 0, 1, 1,
0.4790422, -0.9114503, 1.682663, 0.08627451, 0, 1, 1,
0.4873803, 1.529845, 1.791733, 0.09019608, 0, 1, 1,
0.4930273, -0.272904, 2.081254, 0.09803922, 0, 1, 1,
0.4961084, -0.2019429, 1.617199, 0.1058824, 0, 1, 1,
0.4989274, -0.3179864, 0.3444356, 0.1098039, 0, 1, 1,
0.5019982, 0.7198996, 0.7141499, 0.1176471, 0, 1, 1,
0.5036693, -0.5438585, 0.2021094, 0.1215686, 0, 1, 1,
0.5050031, 2.477386, 1.30265, 0.1294118, 0, 1, 1,
0.5069678, -2.127098, 2.306757, 0.1333333, 0, 1, 1,
0.5099672, 1.274243, 1.810147, 0.1411765, 0, 1, 1,
0.5103095, 0.1864587, 0.5511925, 0.145098, 0, 1, 1,
0.5145145, -0.7580176, 1.574505, 0.1529412, 0, 1, 1,
0.5150946, 0.1613497, 2.79458, 0.1568628, 0, 1, 1,
0.5159643, 1.131367, -1.244591, 0.1647059, 0, 1, 1,
0.5183117, 1.145594, 0.4415495, 0.1686275, 0, 1, 1,
0.5229609, 0.1446411, 1.723257, 0.1764706, 0, 1, 1,
0.5233905, 0.3270698, 1.506178, 0.1803922, 0, 1, 1,
0.524365, -0.8765674, 2.588359, 0.1882353, 0, 1, 1,
0.5249649, -0.6470401, 2.00758, 0.1921569, 0, 1, 1,
0.5254638, 0.7916193, 1.514867, 0.2, 0, 1, 1,
0.5260831, -0.4949758, 3.709759, 0.2078431, 0, 1, 1,
0.5332253, 0.7682087, 0.960874, 0.2117647, 0, 1, 1,
0.5342854, 1.396498, 0.2958957, 0.2196078, 0, 1, 1,
0.5479981, 1.039404, 1.155951, 0.2235294, 0, 1, 1,
0.5486522, -0.7679293, 1.054937, 0.2313726, 0, 1, 1,
0.5515183, 0.7902493, 1.75713, 0.2352941, 0, 1, 1,
0.5568996, -0.9532368, 0.8923002, 0.2431373, 0, 1, 1,
0.5587209, -0.1362346, 1.948306, 0.2470588, 0, 1, 1,
0.5601168, 0.7104595, 0.5243756, 0.254902, 0, 1, 1,
0.5644195, -1.732136, 4.341952, 0.2588235, 0, 1, 1,
0.5648913, 0.4737295, 2.369287, 0.2666667, 0, 1, 1,
0.5662754, 2.044898, 0.1953103, 0.2705882, 0, 1, 1,
0.5715032, -0.2894672, 1.911888, 0.2784314, 0, 1, 1,
0.571769, 2.249656, -0.8926488, 0.282353, 0, 1, 1,
0.5728645, 0.03231758, 0.9090282, 0.2901961, 0, 1, 1,
0.5770512, -0.09141256, 1.836412, 0.2941177, 0, 1, 1,
0.5796155, -0.942734, 1.66669, 0.3019608, 0, 1, 1,
0.5798933, 1.246308, 1.269681, 0.3098039, 0, 1, 1,
0.5813892, 0.3281392, 1.272833, 0.3137255, 0, 1, 1,
0.5848036, 0.2925932, 0.1944078, 0.3215686, 0, 1, 1,
0.5853704, -0.2118716, 2.548138, 0.3254902, 0, 1, 1,
0.5898589, 0.2429674, -0.5101955, 0.3333333, 0, 1, 1,
0.5927945, -0.9037917, 3.115738, 0.3372549, 0, 1, 1,
0.5933651, -0.1236179, 2.506285, 0.345098, 0, 1, 1,
0.5936893, 1.557366, 0.3075033, 0.3490196, 0, 1, 1,
0.6003098, -1.146269, 1.77273, 0.3568628, 0, 1, 1,
0.6088258, -2.113955, 2.924771, 0.3607843, 0, 1, 1,
0.6112498, -0.2086819, 2.383405, 0.3686275, 0, 1, 1,
0.6129737, 0.1710511, 0.7873435, 0.372549, 0, 1, 1,
0.6153461, 1.050913, -0.501818, 0.3803922, 0, 1, 1,
0.6163692, -0.8248364, 3.679666, 0.3843137, 0, 1, 1,
0.6164363, -0.7641461, 1.313387, 0.3921569, 0, 1, 1,
0.6172315, 0.7610155, 0.2031208, 0.3960784, 0, 1, 1,
0.6176819, -1.577693, 2.964487, 0.4039216, 0, 1, 1,
0.6195319, -1.375171, 3.619057, 0.4117647, 0, 1, 1,
0.6195844, 1.201313, 1.385501, 0.4156863, 0, 1, 1,
0.6219932, -2.561464, 4.03697, 0.4235294, 0, 1, 1,
0.6359308, -0.770824, 2.449274, 0.427451, 0, 1, 1,
0.6394616, 1.685812, 0.8827841, 0.4352941, 0, 1, 1,
0.6483909, 0.3092349, 1.592044, 0.4392157, 0, 1, 1,
0.6484021, -1.024739, 2.607382, 0.4470588, 0, 1, 1,
0.6502862, 1.807563, 0.974933, 0.4509804, 0, 1, 1,
0.6504112, -1.350971, 3.796747, 0.4588235, 0, 1, 1,
0.6533812, 0.4925762, 1.199188, 0.4627451, 0, 1, 1,
0.6538902, 0.5428689, 0.7803795, 0.4705882, 0, 1, 1,
0.6546372, -1.135982, 0.3853968, 0.4745098, 0, 1, 1,
0.6555662, 2.676734, 0.5042441, 0.4823529, 0, 1, 1,
0.6609622, -1.508741, 3.80929, 0.4862745, 0, 1, 1,
0.6637126, -0.7657545, 2.500081, 0.4941176, 0, 1, 1,
0.6709594, -0.7875818, 2.505439, 0.5019608, 0, 1, 1,
0.6719439, -0.5621045, 3.175545, 0.5058824, 0, 1, 1,
0.6721659, 0.1635632, 2.410504, 0.5137255, 0, 1, 1,
0.6825312, -1.612298, 3.362262, 0.5176471, 0, 1, 1,
0.6875078, -0.7010398, 1.663351, 0.5254902, 0, 1, 1,
0.6875284, 0.4619355, 1.714159, 0.5294118, 0, 1, 1,
0.6938403, 0.1399877, 0.165367, 0.5372549, 0, 1, 1,
0.6972492, 1.252714, -0.3426925, 0.5411765, 0, 1, 1,
0.698727, -1.670933, 2.280725, 0.5490196, 0, 1, 1,
0.7053541, 0.4583393, 2.757283, 0.5529412, 0, 1, 1,
0.7069035, -1.023306, 1.58075, 0.5607843, 0, 1, 1,
0.70973, 1.106038, 0.0606705, 0.5647059, 0, 1, 1,
0.7102368, -1.516661, 3.118793, 0.572549, 0, 1, 1,
0.713419, 0.8680126, 0.7465751, 0.5764706, 0, 1, 1,
0.71713, -0.6917556, 1.6918, 0.5843138, 0, 1, 1,
0.7214772, 1.229003, -0.009002196, 0.5882353, 0, 1, 1,
0.7286445, -1.08254, 2.159549, 0.5960785, 0, 1, 1,
0.7351312, -0.9311602, 2.584503, 0.6039216, 0, 1, 1,
0.736635, -1.085805, 4.47703, 0.6078432, 0, 1, 1,
0.744579, -0.8338714, 3.784728, 0.6156863, 0, 1, 1,
0.7473186, -0.6702183, 2.641882, 0.6196079, 0, 1, 1,
0.7481461, -0.2492807, 2.053368, 0.627451, 0, 1, 1,
0.7577142, 0.8282658, 0.847866, 0.6313726, 0, 1, 1,
0.7773085, 0.9366817, 1.041751, 0.6392157, 0, 1, 1,
0.7779703, -0.2280201, 1.182361, 0.6431373, 0, 1, 1,
0.7783419, 0.1794933, 1.702976, 0.6509804, 0, 1, 1,
0.7819613, -0.3972602, 3.463014, 0.654902, 0, 1, 1,
0.7847732, -0.8871229, 1.775859, 0.6627451, 0, 1, 1,
0.7911915, 1.084129, 2.006037, 0.6666667, 0, 1, 1,
0.7970541, 0.9038339, -0.2220825, 0.6745098, 0, 1, 1,
0.8015657, 1.636829, 0.7877067, 0.6784314, 0, 1, 1,
0.8034078, -0.1710988, 0.8296811, 0.6862745, 0, 1, 1,
0.8145097, -0.470063, 0.6829805, 0.6901961, 0, 1, 1,
0.8183793, 0.4655392, 0.7660559, 0.6980392, 0, 1, 1,
0.8192295, 0.1246732, 3.138793, 0.7058824, 0, 1, 1,
0.8200279, 1.007032, 2.261858, 0.7098039, 0, 1, 1,
0.8221332, -0.1569023, 1.085101, 0.7176471, 0, 1, 1,
0.8299432, -0.1422493, 1.121584, 0.7215686, 0, 1, 1,
0.8415699, 0.06908894, 1.754237, 0.7294118, 0, 1, 1,
0.8427193, 0.7472883, 1.463214, 0.7333333, 0, 1, 1,
0.8462014, 0.4593776, 0.7268872, 0.7411765, 0, 1, 1,
0.8470713, 1.35411, 2.253669, 0.7450981, 0, 1, 1,
0.850993, -0.5545822, 2.300513, 0.7529412, 0, 1, 1,
0.8546319, 0.4105569, 0.08933167, 0.7568628, 0, 1, 1,
0.86001, -0.1515067, 2.348287, 0.7647059, 0, 1, 1,
0.862247, 1.363501, 0.5788954, 0.7686275, 0, 1, 1,
0.8626266, 1.04364, -0.05703947, 0.7764706, 0, 1, 1,
0.8654494, 0.1973527, 1.43424, 0.7803922, 0, 1, 1,
0.8669965, -0.3360142, 1.540732, 0.7882353, 0, 1, 1,
0.872169, -1.509799, 1.317405, 0.7921569, 0, 1, 1,
0.8726258, -0.3028384, 3.216144, 0.8, 0, 1, 1,
0.878045, -0.1273389, 3.530955, 0.8078431, 0, 1, 1,
0.8780753, -1.320628, 2.422322, 0.8117647, 0, 1, 1,
0.8803841, -1.777223, 3.340397, 0.8196079, 0, 1, 1,
0.8804089, -0.07925174, 1.071304, 0.8235294, 0, 1, 1,
0.8819634, 2.748084, 2.221158, 0.8313726, 0, 1, 1,
0.8861654, -0.02434125, 1.880122, 0.8352941, 0, 1, 1,
0.8915986, 1.349325, 1.238461, 0.8431373, 0, 1, 1,
0.8974911, 0.342881, 0.1860045, 0.8470588, 0, 1, 1,
0.9101437, 1.068847, 0.5329973, 0.854902, 0, 1, 1,
0.9165199, 1.271046, 0.2482804, 0.8588235, 0, 1, 1,
0.917433, -0.9788116, 3.488085, 0.8666667, 0, 1, 1,
0.9187025, -0.4030755, -0.06314213, 0.8705882, 0, 1, 1,
0.9198501, -0.2617087, 3.449376, 0.8784314, 0, 1, 1,
0.9211199, 0.254406, 0.4229761, 0.8823529, 0, 1, 1,
0.9218073, -1.042619, 3.295278, 0.8901961, 0, 1, 1,
0.9237158, 0.3617359, 1.120956, 0.8941177, 0, 1, 1,
0.9237689, 0.248031, 2.819073, 0.9019608, 0, 1, 1,
0.9268349, -0.02594993, 2.569685, 0.9098039, 0, 1, 1,
0.9292998, 0.9291207, 0.1670057, 0.9137255, 0, 1, 1,
0.930411, 0.12109, -0.33575, 0.9215686, 0, 1, 1,
0.9328256, 0.4766308, 1.644249, 0.9254902, 0, 1, 1,
0.9385895, 1.726078, 1.42294, 0.9333333, 0, 1, 1,
0.9428911, -0.5302106, 0.7659572, 0.9372549, 0, 1, 1,
0.9431731, -1.406893, 3.683456, 0.945098, 0, 1, 1,
0.9471565, 0.5336103, 0.8271402, 0.9490196, 0, 1, 1,
0.9487797, -1.228434, 2.30388, 0.9568627, 0, 1, 1,
0.9670188, -0.06822007, -0.2064775, 0.9607843, 0, 1, 1,
0.9700512, 0.816142, 0.1190761, 0.9686275, 0, 1, 1,
0.9713867, 0.6610187, -0.5271758, 0.972549, 0, 1, 1,
0.9786814, 0.2454035, -0.3123703, 0.9803922, 0, 1, 1,
0.9845661, -0.598433, 2.65655, 0.9843137, 0, 1, 1,
0.9897591, 1.19459, 2.303691, 0.9921569, 0, 1, 1,
0.9946955, 0.7399384, 0.1004416, 0.9960784, 0, 1, 1,
0.9963833, 0.5555128, 0.1553083, 1, 0, 0.9960784, 1,
0.9966246, 1.179427, 0.9714876, 1, 0, 0.9882353, 1,
0.9980562, 1.226644, 0.1605013, 1, 0, 0.9843137, 1,
1.004679, 2.751898, 0.7164199, 1, 0, 0.9764706, 1,
1.010052, -0.457444, 2.331699, 1, 0, 0.972549, 1,
1.01617, 0.3758321, 0.9849925, 1, 0, 0.9647059, 1,
1.020365, -0.320835, 3.688318, 1, 0, 0.9607843, 1,
1.022925, -0.6548984, 4.018239, 1, 0, 0.9529412, 1,
1.023697, -1.016914, 2.578569, 1, 0, 0.9490196, 1,
1.034816, 1.846862, 0.2636212, 1, 0, 0.9411765, 1,
1.038824, -1.027286, 3.569594, 1, 0, 0.9372549, 1,
1.040031, 1.476243, 2.231244, 1, 0, 0.9294118, 1,
1.042366, -0.9552454, 2.071454, 1, 0, 0.9254902, 1,
1.054685, -0.9710408, 4.400957, 1, 0, 0.9176471, 1,
1.065059, 0.976066, 1.45727, 1, 0, 0.9137255, 1,
1.07243, -0.5824696, 2.292851, 1, 0, 0.9058824, 1,
1.076714, 0.3558659, 3.499252, 1, 0, 0.9019608, 1,
1.084187, 0.7172193, 1.451397, 1, 0, 0.8941177, 1,
1.088159, -0.2415601, 3.556343, 1, 0, 0.8862745, 1,
1.089467, 0.3482684, 1.198763, 1, 0, 0.8823529, 1,
1.091658, -0.1350508, 2.259409, 1, 0, 0.8745098, 1,
1.098668, -1.470614, 2.436651, 1, 0, 0.8705882, 1,
1.102142, 0.1576297, 1.952549, 1, 0, 0.8627451, 1,
1.106871, -0.8235828, 2.038323, 1, 0, 0.8588235, 1,
1.107435, -0.4048338, 1.236386, 1, 0, 0.8509804, 1,
1.116779, -0.308962, 3.251342, 1, 0, 0.8470588, 1,
1.128938, 0.8114312, 0.9413751, 1, 0, 0.8392157, 1,
1.134467, -0.5621229, 2.630218, 1, 0, 0.8352941, 1,
1.135605, 1.400537, 0.4703481, 1, 0, 0.827451, 1,
1.142154, 0.8263594, 1.937499, 1, 0, 0.8235294, 1,
1.154885, 0.3852312, 3.248851, 1, 0, 0.8156863, 1,
1.159312, -0.3903663, 2.0615, 1, 0, 0.8117647, 1,
1.160601, -0.3235067, 1.85765, 1, 0, 0.8039216, 1,
1.166283, -0.5777603, 2.520986, 1, 0, 0.7960784, 1,
1.166624, 0.2868009, 2.264505, 1, 0, 0.7921569, 1,
1.167833, 1.325922, 1.235828, 1, 0, 0.7843137, 1,
1.170094, -0.8758283, 2.703825, 1, 0, 0.7803922, 1,
1.178105, -0.4680547, 0.3014371, 1, 0, 0.772549, 1,
1.19603, -0.5333499, 0.8322769, 1, 0, 0.7686275, 1,
1.196341, 2.123933, -1.131497, 1, 0, 0.7607843, 1,
1.196974, -0.6372574, 1.147664, 1, 0, 0.7568628, 1,
1.208342, -1.664053, 3.639132, 1, 0, 0.7490196, 1,
1.216778, -1.882832, 3.594323, 1, 0, 0.7450981, 1,
1.224958, 0.6190291, 0.8160251, 1, 0, 0.7372549, 1,
1.225242, 0.5642813, 1.206222, 1, 0, 0.7333333, 1,
1.229162, -0.912815, 3.734132, 1, 0, 0.7254902, 1,
1.231562, -1.491076, 2.078855, 1, 0, 0.7215686, 1,
1.232902, 0.2099327, 1.377444, 1, 0, 0.7137255, 1,
1.239256, 1.00843, 0.9436159, 1, 0, 0.7098039, 1,
1.244944, -1.456818, 3.951325, 1, 0, 0.7019608, 1,
1.255033, 0.4324864, 0.2963927, 1, 0, 0.6941177, 1,
1.2599, -1.631949, 2.836474, 1, 0, 0.6901961, 1,
1.262928, 0.766504, 1.046728, 1, 0, 0.682353, 1,
1.263452, 1.120815, 1.090315, 1, 0, 0.6784314, 1,
1.270069, -0.03640565, 3.696896, 1, 0, 0.6705883, 1,
1.275167, 1.872619, -2.812024, 1, 0, 0.6666667, 1,
1.276299, 0.6812162, 1.711521, 1, 0, 0.6588235, 1,
1.276475, 0.1927068, 2.961805, 1, 0, 0.654902, 1,
1.276834, -0.7647454, 3.029875, 1, 0, 0.6470588, 1,
1.278839, 0.2954612, 1.44269, 1, 0, 0.6431373, 1,
1.282979, 0.2541266, 3.865768, 1, 0, 0.6352941, 1,
1.283879, 0.8172272, 0.7478321, 1, 0, 0.6313726, 1,
1.286078, -0.5144329, 2.082085, 1, 0, 0.6235294, 1,
1.286492, -0.1580075, 2.578799, 1, 0, 0.6196079, 1,
1.293198, 1.245695, 0.2952679, 1, 0, 0.6117647, 1,
1.295025, -2.068805, 1.671642, 1, 0, 0.6078432, 1,
1.299341, 0.7602886, 1.993693, 1, 0, 0.6, 1,
1.311504, -1.560032, 0.5367923, 1, 0, 0.5921569, 1,
1.312862, -0.07657421, 0.5027801, 1, 0, 0.5882353, 1,
1.314477, 2.137128, -0.05735971, 1, 0, 0.5803922, 1,
1.318851, 0.03898612, -0.3824266, 1, 0, 0.5764706, 1,
1.322458, 0.002850581, 3.235861, 1, 0, 0.5686275, 1,
1.322973, 1.11421, 1.952298, 1, 0, 0.5647059, 1,
1.346676, -1.250405, 2.578799, 1, 0, 0.5568628, 1,
1.360499, 1.181239, 2.331598, 1, 0, 0.5529412, 1,
1.363436, 0.9365542, -0.6519663, 1, 0, 0.5450981, 1,
1.365298, 0.8815931, 1.549481, 1, 0, 0.5411765, 1,
1.365382, -0.3163095, 2.201799, 1, 0, 0.5333334, 1,
1.386375, 0.1897423, 1.657449, 1, 0, 0.5294118, 1,
1.389307, -0.8054472, 1.463251, 1, 0, 0.5215687, 1,
1.392832, -0.3802455, 2.264741, 1, 0, 0.5176471, 1,
1.402609, 0.8721622, 0.156877, 1, 0, 0.509804, 1,
1.406411, 0.6054478, 1.140685, 1, 0, 0.5058824, 1,
1.417392, 1.050609, -0.4612966, 1, 0, 0.4980392, 1,
1.419594, 0.2618884, 3.622744, 1, 0, 0.4901961, 1,
1.42263, -0.1860165, -0.06473548, 1, 0, 0.4862745, 1,
1.44218, 0.1135636, 2.355503, 1, 0, 0.4784314, 1,
1.44339, 1.118847, 1.793191, 1, 0, 0.4745098, 1,
1.459854, -0.2604584, 0.9827403, 1, 0, 0.4666667, 1,
1.475214, -0.2288572, 0.6097628, 1, 0, 0.4627451, 1,
1.477447, 0.7296256, 2.75762, 1, 0, 0.454902, 1,
1.480401, -1.387321, 2.639122, 1, 0, 0.4509804, 1,
1.482699, -0.344234, 0.9609783, 1, 0, 0.4431373, 1,
1.487468, -1.017106, 2.18414, 1, 0, 0.4392157, 1,
1.504509, 0.4768078, 0.2278614, 1, 0, 0.4313726, 1,
1.505885, 0.9655032, 1.203732, 1, 0, 0.427451, 1,
1.511731, -1.39851, 1.68896, 1, 0, 0.4196078, 1,
1.516949, 0.3794692, -0.1503988, 1, 0, 0.4156863, 1,
1.519671, 1.865504, 0.5627486, 1, 0, 0.4078431, 1,
1.52112, 1.019042, 2.158846, 1, 0, 0.4039216, 1,
1.521351, 0.5876304, 1.73432, 1, 0, 0.3960784, 1,
1.52162, 0.1808818, 1.304065, 1, 0, 0.3882353, 1,
1.530739, -0.7195138, 2.180918, 1, 0, 0.3843137, 1,
1.534312, 1.229162, 0.6362232, 1, 0, 0.3764706, 1,
1.539717, 1.332293, -0.8526258, 1, 0, 0.372549, 1,
1.548916, -0.7548816, 1.144917, 1, 0, 0.3647059, 1,
1.550454, 0.9029102, -1.732641, 1, 0, 0.3607843, 1,
1.555718, 1.709655, -0.07003035, 1, 0, 0.3529412, 1,
1.555805, -0.6718034, 1.73228, 1, 0, 0.3490196, 1,
1.56936, -0.4292149, 0.600362, 1, 0, 0.3411765, 1,
1.574707, -0.159186, 0.3283975, 1, 0, 0.3372549, 1,
1.575767, -0.8151716, 1.527176, 1, 0, 0.3294118, 1,
1.584292, -1.299085, 2.083905, 1, 0, 0.3254902, 1,
1.589752, -0.1985485, 2.795391, 1, 0, 0.3176471, 1,
1.597061, 0.2151834, 1.383276, 1, 0, 0.3137255, 1,
1.597975, 1.46812, 3.101641, 1, 0, 0.3058824, 1,
1.610362, -0.3320274, 2.486296, 1, 0, 0.2980392, 1,
1.636528, 0.4523036, 0.6935284, 1, 0, 0.2941177, 1,
1.65379, 0.3623576, 2.494584, 1, 0, 0.2862745, 1,
1.665807, -1.258069, 3.030899, 1, 0, 0.282353, 1,
1.677899, 1.769017, 0.5227032, 1, 0, 0.2745098, 1,
1.716868, 0.9600559, 2.04228, 1, 0, 0.2705882, 1,
1.723855, -0.9896848, 2.542035, 1, 0, 0.2627451, 1,
1.734853, -0.9577422, 1.327327, 1, 0, 0.2588235, 1,
1.743858, -0.6901625, 1.331538, 1, 0, 0.2509804, 1,
1.755569, -0.4725749, 1.279247, 1, 0, 0.2470588, 1,
1.756248, -1.097982, 2.559791, 1, 0, 0.2392157, 1,
1.763166, 0.6244304, 0.5064799, 1, 0, 0.2352941, 1,
1.767701, 0.2860875, 2.156895, 1, 0, 0.227451, 1,
1.768981, -0.6040866, 3.822084, 1, 0, 0.2235294, 1,
1.781735, -0.6756693, -0.0161092, 1, 0, 0.2156863, 1,
1.825063, -0.5720171, 0.04796442, 1, 0, 0.2117647, 1,
1.849565, -0.7190701, 0.4556549, 1, 0, 0.2039216, 1,
1.866465, 0.1251995, 0.4331154, 1, 0, 0.1960784, 1,
1.870282, 1.385849, 1.224839, 1, 0, 0.1921569, 1,
1.877794, -0.6457993, 2.487206, 1, 0, 0.1843137, 1,
1.883578, -0.3355341, 0.8246323, 1, 0, 0.1803922, 1,
1.891496, -0.3728338, 1.684922, 1, 0, 0.172549, 1,
1.899347, 0.6653996, -0.1164216, 1, 0, 0.1686275, 1,
1.901363, 0.1758345, 3.133899, 1, 0, 0.1607843, 1,
1.917696, -1.778896, 1.765914, 1, 0, 0.1568628, 1,
1.926549, -0.1163423, 0.7852286, 1, 0, 0.1490196, 1,
1.929991, -1.511133, 1.46855, 1, 0, 0.145098, 1,
1.937187, -1.618859, 0.6296303, 1, 0, 0.1372549, 1,
1.97278, 1.398622, 0.2947362, 1, 0, 0.1333333, 1,
1.973061, 0.8773859, 1.334209, 1, 0, 0.1254902, 1,
1.998395, 1.202436, -0.7197769, 1, 0, 0.1215686, 1,
1.99887, 0.7918053, -0.940891, 1, 0, 0.1137255, 1,
2.004989, -3.108696, 3.899573, 1, 0, 0.1098039, 1,
2.076365, -0.1666419, 3.851462, 1, 0, 0.1019608, 1,
2.083569, -2.096374, 1.218914, 1, 0, 0.09411765, 1,
2.107906, 2.036925, 1.318616, 1, 0, 0.09019608, 1,
2.134054, 0.3420113, 1.330703, 1, 0, 0.08235294, 1,
2.139362, -0.6447125, 1.870226, 1, 0, 0.07843138, 1,
2.157675, -0.9635903, 0.9591719, 1, 0, 0.07058824, 1,
2.186402, 1.270225, -0.4389499, 1, 0, 0.06666667, 1,
2.221222, -1.215313, 2.373592, 1, 0, 0.05882353, 1,
2.260987, -0.6885622, 3.562228, 1, 0, 0.05490196, 1,
2.278946, 0.3786421, 0.2530928, 1, 0, 0.04705882, 1,
2.337005, 0.9474767, 0.943249, 1, 0, 0.04313726, 1,
2.410172, 0.03911266, 0.3186954, 1, 0, 0.03529412, 1,
2.500066, 2.463319, 2.310235, 1, 0, 0.03137255, 1,
2.510021, -1.071186, 3.426682, 1, 0, 0.02352941, 1,
3.165943, -0.1255103, 2.10943, 1, 0, 0.01960784, 1,
3.343763, -1.282282, 0.2621002, 1, 0, 0.01176471, 1,
3.438396, -0.4698015, 0.7472632, 1, 0, 0.007843138, 1
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
-0.001904845, -4.122774, -8.160212, 0, -0.5, 0.5, 0.5,
-0.001904845, -4.122774, -8.160212, 1, -0.5, 0.5, 0.5,
-0.001904845, -4.122774, -8.160212, 1, 1.5, 0.5, 0.5,
-0.001904845, -4.122774, -8.160212, 0, 1.5, 0.5, 0.5
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
-4.608467, -0.1173176, -8.160212, 0, -0.5, 0.5, 0.5,
-4.608467, -0.1173176, -8.160212, 1, -0.5, 0.5, 0.5,
-4.608467, -0.1173176, -8.160212, 1, 1.5, 0.5, 0.5,
-4.608467, -0.1173176, -8.160212, 0, 1.5, 0.5, 0.5
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
-4.608467, -4.122774, -0.4534428, 0, -0.5, 0.5, 0.5,
-4.608467, -4.122774, -0.4534428, 1, -0.5, 0.5, 0.5,
-4.608467, -4.122774, -0.4534428, 1, 1.5, 0.5, 0.5,
-4.608467, -4.122774, -0.4534428, 0, 1.5, 0.5, 0.5
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
-3, -3.198438, -6.381727,
3, -3.198438, -6.381727,
-3, -3.198438, -6.381727,
-3, -3.352494, -6.678141,
-2, -3.198438, -6.381727,
-2, -3.352494, -6.678141,
-1, -3.198438, -6.381727,
-1, -3.352494, -6.678141,
0, -3.198438, -6.381727,
0, -3.352494, -6.678141,
1, -3.198438, -6.381727,
1, -3.352494, -6.678141,
2, -3.198438, -6.381727,
2, -3.352494, -6.678141,
3, -3.198438, -6.381727,
3, -3.352494, -6.678141
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
-3, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
-3, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
-3, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
-3, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
-2, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
-2, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
-2, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
-2, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
-1, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
-1, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
-1, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
-1, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
0, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
0, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
0, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
0, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
1, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
1, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
1, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
1, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
2, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
2, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
2, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
2, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5,
3, -3.660606, -7.270969, 0, -0.5, 0.5, 0.5,
3, -3.660606, -7.270969, 1, -0.5, 0.5, 0.5,
3, -3.660606, -7.270969, 1, 1.5, 0.5, 0.5,
3, -3.660606, -7.270969, 0, 1.5, 0.5, 0.5
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
-3.545414, -3, -6.381727,
-3.545414, 2, -6.381727,
-3.545414, -3, -6.381727,
-3.72259, -3, -6.678141,
-3.545414, -2, -6.381727,
-3.72259, -2, -6.678141,
-3.545414, -1, -6.381727,
-3.72259, -1, -6.678141,
-3.545414, 0, -6.381727,
-3.72259, 0, -6.678141,
-3.545414, 1, -6.381727,
-3.72259, 1, -6.678141,
-3.545414, 2, -6.381727,
-3.72259, 2, -6.678141
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
-4.076941, -3, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, -3, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, -3, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, -3, -7.270969, 0, 1.5, 0.5, 0.5,
-4.076941, -2, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, -2, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, -2, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, -2, -7.270969, 0, 1.5, 0.5, 0.5,
-4.076941, -1, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, -1, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, -1, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, -1, -7.270969, 0, 1.5, 0.5, 0.5,
-4.076941, 0, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, 0, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, 0, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, 0, -7.270969, 0, 1.5, 0.5, 0.5,
-4.076941, 1, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, 1, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, 1, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, 1, -7.270969, 0, 1.5, 0.5, 0.5,
-4.076941, 2, -7.270969, 0, -0.5, 0.5, 0.5,
-4.076941, 2, -7.270969, 1, -0.5, 0.5, 0.5,
-4.076941, 2, -7.270969, 1, 1.5, 0.5, 0.5,
-4.076941, 2, -7.270969, 0, 1.5, 0.5, 0.5
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
-3.545414, -3.198438, -6,
-3.545414, -3.198438, 4,
-3.545414, -3.198438, -6,
-3.72259, -3.352494, -6,
-3.545414, -3.198438, -4,
-3.72259, -3.352494, -4,
-3.545414, -3.198438, -2,
-3.72259, -3.352494, -2,
-3.545414, -3.198438, 0,
-3.72259, -3.352494, 0,
-3.545414, -3.198438, 2,
-3.72259, -3.352494, 2,
-3.545414, -3.198438, 4,
-3.72259, -3.352494, 4
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
-4.076941, -3.660606, -6, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -6, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -6, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, -6, 0, 1.5, 0.5, 0.5,
-4.076941, -3.660606, -4, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -4, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -4, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, -4, 0, 1.5, 0.5, 0.5,
-4.076941, -3.660606, -2, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -2, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, -2, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, -2, 0, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 0, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 0, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 0, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 0, 0, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 2, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 2, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 2, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 2, 0, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 4, 0, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 4, 1, -0.5, 0.5, 0.5,
-4.076941, -3.660606, 4, 1, 1.5, 0.5, 0.5,
-4.076941, -3.660606, 4, 0, 1.5, 0.5, 0.5
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
-3.545414, -3.198438, -6.381727,
-3.545414, 2.963803, -6.381727,
-3.545414, -3.198438, 5.474841,
-3.545414, 2.963803, 5.474841,
-3.545414, -3.198438, -6.381727,
-3.545414, -3.198438, 5.474841,
-3.545414, 2.963803, -6.381727,
-3.545414, 2.963803, 5.474841,
-3.545414, -3.198438, -6.381727,
3.541605, -3.198438, -6.381727,
-3.545414, -3.198438, 5.474841,
3.541605, -3.198438, 5.474841,
-3.545414, 2.963803, -6.381727,
3.541605, 2.963803, -6.381727,
-3.545414, 2.963803, 5.474841,
3.541605, 2.963803, 5.474841,
3.541605, -3.198438, -6.381727,
3.541605, 2.963803, -6.381727,
3.541605, -3.198438, 5.474841,
3.541605, 2.963803, 5.474841,
3.541605, -3.198438, -6.381727,
3.541605, -3.198438, 5.474841,
3.541605, 2.963803, -6.381727,
3.541605, 2.963803, 5.474841
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
var radius = 8.076661;
var distance = 35.93398;
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
mvMatrix.translate( 0.001904845, 0.1173176, 0.4534428 );
mvMatrix.scale( 1.232203, 1.417122, 0.7365238 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.93398);
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
marmer<-read.table("marmer.xyz")
```

```
## Error in read.table("marmer.xyz"): no lines available in input
```

```r
x<-marmer$V2
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
```

```r
y<-marmer$V3
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
```

```r
z<-marmer$V4
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
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
-3.442205, 0.3372752, -1.78583, 0, 0, 1, 1, 1,
-3.29276, -0.3454447, -3.243546, 1, 0, 0, 1, 1,
-2.913507, -1.032513, -1.921002, 1, 0, 0, 1, 1,
-2.575433, -0.4623748, -0.6413112, 1, 0, 0, 1, 1,
-2.453104, -0.3669761, -2.246765, 1, 0, 0, 1, 1,
-2.441458, -0.6251296, -2.368806, 1, 0, 0, 1, 1,
-2.342791, 1.126445, -0.6228575, 0, 0, 0, 1, 1,
-2.337787, -0.1744212, -0.6998696, 0, 0, 0, 1, 1,
-2.283243, -1.135332, -1.823137, 0, 0, 0, 1, 1,
-2.275325, -0.9795482, -3.333965, 0, 0, 0, 1, 1,
-2.269105, -1.047451, -2.442505, 0, 0, 0, 1, 1,
-2.211559, -0.05755305, -2.275846, 0, 0, 0, 1, 1,
-2.134099, -0.6079275, -1.214466, 0, 0, 0, 1, 1,
-2.114804, 0.7427331, -2.008518, 1, 1, 1, 1, 1,
-2.083031, -1.498578, -3.986027, 1, 1, 1, 1, 1,
-2.072129, 1.106943, -0.6338824, 1, 1, 1, 1, 1,
-2.067587, 0.1758151, -0.5039687, 1, 1, 1, 1, 1,
-2.058367, 1.095138, -0.9590335, 1, 1, 1, 1, 1,
-2.016185, -0.2441334, -1.117794, 1, 1, 1, 1, 1,
-1.994799, 0.3653279, -1.608762, 1, 1, 1, 1, 1,
-1.972302, 2.074461, -1.440994, 1, 1, 1, 1, 1,
-1.96847, -1.014158, -1.590859, 1, 1, 1, 1, 1,
-1.964536, 0.1676827, 0.2213411, 1, 1, 1, 1, 1,
-1.954085, 0.7355041, -1.346917, 1, 1, 1, 1, 1,
-1.949801, 0.9104601, -2.769768, 1, 1, 1, 1, 1,
-1.927561, 0.1918867, -2.017978, 1, 1, 1, 1, 1,
-1.916091, 0.5861986, -0.468597, 1, 1, 1, 1, 1,
-1.904903, 1.591336, 0.4751538, 1, 1, 1, 1, 1,
-1.899767, -0.3222888, -2.563431, 0, 0, 1, 1, 1,
-1.894729, -2.106901, -1.239267, 1, 0, 0, 1, 1,
-1.888707, -0.6454123, -1.696199, 1, 0, 0, 1, 1,
-1.860908, -0.9974071, -2.561175, 1, 0, 0, 1, 1,
-1.854462, -0.7066445, -3.469982, 1, 0, 0, 1, 1,
-1.828841, 0.1447311, -1.010129, 1, 0, 0, 1, 1,
-1.811561, -0.2553445, -1.772269, 0, 0, 0, 1, 1,
-1.8021, 2.01351, 0.62941, 0, 0, 0, 1, 1,
-1.773494, 2.178681, -0.1051909, 0, 0, 0, 1, 1,
-1.772847, 1.300291, -2.449685, 0, 0, 0, 1, 1,
-1.771003, 0.5738169, -0.5513363, 0, 0, 0, 1, 1,
-1.766685, -0.6949342, -1.599254, 0, 0, 0, 1, 1,
-1.760793, -0.5576625, -1.660983, 0, 0, 0, 1, 1,
-1.76022, 0.5371049, -0.9293362, 1, 1, 1, 1, 1,
-1.747099, 0.7488886, -3.729539, 1, 1, 1, 1, 1,
-1.72691, -0.3195947, -2.334604, 1, 1, 1, 1, 1,
-1.722098, -0.2345549, -2.226032, 1, 1, 1, 1, 1,
-1.717687, -0.6766837, -3.116669, 1, 1, 1, 1, 1,
-1.699216, 0.07564341, -1.453795, 1, 1, 1, 1, 1,
-1.684658, 1.139245, 0.9169253, 1, 1, 1, 1, 1,
-1.680325, -0.9583425, -1.367432, 1, 1, 1, 1, 1,
-1.671509, 0.9871721, -1.473911, 1, 1, 1, 1, 1,
-1.669256, 0.1701023, -1.842348, 1, 1, 1, 1, 1,
-1.666442, 1.502223, -0.2002895, 1, 1, 1, 1, 1,
-1.663055, -0.2775401, -0.5214742, 1, 1, 1, 1, 1,
-1.658113, -0.03001536, -0.9558424, 1, 1, 1, 1, 1,
-1.65258, 0.7806633, -2.395186, 1, 1, 1, 1, 1,
-1.649654, -0.581622, -0.4345108, 1, 1, 1, 1, 1,
-1.642681, -0.1484923, 0.5003302, 0, 0, 1, 1, 1,
-1.621893, 0.5833603, -0.7626662, 1, 0, 0, 1, 1,
-1.611603, 1.115703, -0.8218256, 1, 0, 0, 1, 1,
-1.60351, -0.8286583, -1.765407, 1, 0, 0, 1, 1,
-1.596027, 1.118085, -0.6724711, 1, 0, 0, 1, 1,
-1.595767, -0.2548197, -1.222864, 1, 0, 0, 1, 1,
-1.593419, -0.282826, -1.525895, 0, 0, 0, 1, 1,
-1.586557, -0.09661348, -0.7853659, 0, 0, 0, 1, 1,
-1.57714, 0.6101148, -0.4104121, 0, 0, 0, 1, 1,
-1.576554, 0.7050066, -1.767454, 0, 0, 0, 1, 1,
-1.564109, 0.2226902, -1.015094, 0, 0, 0, 1, 1,
-1.550924, -1.424291, -2.420253, 0, 0, 0, 1, 1,
-1.538061, 1.627274, -1.065104, 0, 0, 0, 1, 1,
-1.535301, 0.06261442, -0.4276987, 1, 1, 1, 1, 1,
-1.52935, 1.165335, -1.623208, 1, 1, 1, 1, 1,
-1.523005, -0.4074414, -0.9728597, 1, 1, 1, 1, 1,
-1.505897, 1.277733, -1.804144, 1, 1, 1, 1, 1,
-1.504472, 0.2482107, -0.8711334, 1, 1, 1, 1, 1,
-1.491156, 0.6943741, -1.750916, 1, 1, 1, 1, 1,
-1.468411, 0.5867571, 0.1010069, 1, 1, 1, 1, 1,
-1.458695, -0.2920348, -1.566902, 1, 1, 1, 1, 1,
-1.453702, 2.026209, -0.1086482, 1, 1, 1, 1, 1,
-1.438372, -1.049447, -2.636912, 1, 1, 1, 1, 1,
-1.435589, 1.780584, -1.277907, 1, 1, 1, 1, 1,
-1.435438, -0.7280146, -1.525378, 1, 1, 1, 1, 1,
-1.425384, 0.01410982, -2.987174, 1, 1, 1, 1, 1,
-1.419365, -0.07906122, -0.3998184, 1, 1, 1, 1, 1,
-1.413013, 0.2483942, -0.8876229, 1, 1, 1, 1, 1,
-1.403085, 0.2952138, -0.6739196, 0, 0, 1, 1, 1,
-1.402266, 0.1646765, -0.1413417, 1, 0, 0, 1, 1,
-1.401173, -1.338052, -1.785389, 1, 0, 0, 1, 1,
-1.372825, 1.424828, -0.488678, 1, 0, 0, 1, 1,
-1.371056, -1.956889, -0.1866041, 1, 0, 0, 1, 1,
-1.368886, -0.921073, -1.777861, 1, 0, 0, 1, 1,
-1.368723, 0.7481862, -0.7192771, 0, 0, 0, 1, 1,
-1.355737, 1.178219, -0.5432469, 0, 0, 0, 1, 1,
-1.355189, -0.8482883, -1.424614, 0, 0, 0, 1, 1,
-1.353967, 0.3076141, -2.325889, 0, 0, 0, 1, 1,
-1.350883, 0.4267113, -1.550589, 0, 0, 0, 1, 1,
-1.338386, 0.3765948, -0.7308201, 0, 0, 0, 1, 1,
-1.33581, 0.2634962, -3.024937, 0, 0, 0, 1, 1,
-1.334556, 0.1587493, -1.01017, 1, 1, 1, 1, 1,
-1.334238, -0.5686609, -1.773, 1, 1, 1, 1, 1,
-1.334146, 0.2962919, -0.6066086, 1, 1, 1, 1, 1,
-1.33181, -0.01676505, -1.923573, 1, 1, 1, 1, 1,
-1.329389, 0.5106178, 0.6162084, 1, 1, 1, 1, 1,
-1.322322, -1.321086, -4.269665, 1, 1, 1, 1, 1,
-1.308926, -0.0637702, -3.015975, 1, 1, 1, 1, 1,
-1.292391, -0.8054786, -2.577028, 1, 1, 1, 1, 1,
-1.282971, -0.7434014, -2.091707, 1, 1, 1, 1, 1,
-1.273081, 0.4417851, -0.6500588, 1, 1, 1, 1, 1,
-1.26777, -2.174892, -1.731014, 1, 1, 1, 1, 1,
-1.26666, 1.546074, -0.1291862, 1, 1, 1, 1, 1,
-1.253073, -0.4677232, -2.461984, 1, 1, 1, 1, 1,
-1.246697, 0.4396413, -0.9336569, 1, 1, 1, 1, 1,
-1.23638, 1.317613, -1.299749, 1, 1, 1, 1, 1,
-1.234702, 0.6506527, -0.9629374, 0, 0, 1, 1, 1,
-1.229437, -0.1298237, -2.04431, 1, 0, 0, 1, 1,
-1.227182, -0.1729233, -1.789253, 1, 0, 0, 1, 1,
-1.227046, -0.8847896, -2.066879, 1, 0, 0, 1, 1,
-1.22442, 0.1903068, -0.1633555, 1, 0, 0, 1, 1,
-1.221615, -1.011102, -1.556371, 1, 0, 0, 1, 1,
-1.219301, 0.1894671, -0.2178191, 0, 0, 0, 1, 1,
-1.21885, -1.633458, -2.433284, 0, 0, 0, 1, 1,
-1.2166, 0.394448, -1.037418, 0, 0, 0, 1, 1,
-1.200973, -1.800208, -3.286392, 0, 0, 0, 1, 1,
-1.198272, -1.602886, -3.191524, 0, 0, 0, 1, 1,
-1.19759, -0.7422547, -0.8146455, 0, 0, 0, 1, 1,
-1.193812, 0.1878984, -2.209116, 0, 0, 0, 1, 1,
-1.192905, 1.745704, -1.318107, 1, 1, 1, 1, 1,
-1.189615, 0.83752, -0.6229793, 1, 1, 1, 1, 1,
-1.181397, -0.4076677, -2.730962, 1, 1, 1, 1, 1,
-1.175267, 1.362059, -1.455774, 1, 1, 1, 1, 1,
-1.173611, 1.391555, -0.6332583, 1, 1, 1, 1, 1,
-1.173467, -0.524916, -3.728705, 1, 1, 1, 1, 1,
-1.172292, 0.9414104, -2.162115, 1, 1, 1, 1, 1,
-1.171538, -0.5879475, -2.408766, 1, 1, 1, 1, 1,
-1.168577, -1.449047, -0.9779019, 1, 1, 1, 1, 1,
-1.168546, -1.777881, -2.996519, 1, 1, 1, 1, 1,
-1.16686, -0.9491649, -1.930799, 1, 1, 1, 1, 1,
-1.158409, 1.523494, -0.636619, 1, 1, 1, 1, 1,
-1.157395, 1.377419, -0.4331501, 1, 1, 1, 1, 1,
-1.156634, 0.9728395, -1.662813, 1, 1, 1, 1, 1,
-1.138224, -1.159137, -2.009064, 1, 1, 1, 1, 1,
-1.137874, -0.5349933, 0.1606687, 0, 0, 1, 1, 1,
-1.133307, 1.682113, -0.7969483, 1, 0, 0, 1, 1,
-1.128129, 0.1945477, -2.258773, 1, 0, 0, 1, 1,
-1.115815, 1.834402, -0.7409453, 1, 0, 0, 1, 1,
-1.106035, -0.7399951, -0.9981187, 1, 0, 0, 1, 1,
-1.105639, -1.50156, -4.39599, 1, 0, 0, 1, 1,
-1.101505, 0.2164134, -2.066772, 0, 0, 0, 1, 1,
-1.10104, 1.166435, 0.5600376, 0, 0, 0, 1, 1,
-1.095772, 0.3612472, -2.025688, 0, 0, 0, 1, 1,
-1.078227, 0.3516367, -1.661158, 0, 0, 0, 1, 1,
-1.077806, -0.3558169, -0.4948165, 0, 0, 0, 1, 1,
-1.070505, 0.9950845, 0.08171764, 0, 0, 0, 1, 1,
-1.068575, 0.6741241, -1.593884, 0, 0, 0, 1, 1,
-1.067771, 0.9661101, -0.8105022, 1, 1, 1, 1, 1,
-1.065287, -1.073046, -2.689204, 1, 1, 1, 1, 1,
-1.06518, -1.182319, -3.501705, 1, 1, 1, 1, 1,
-1.062645, 0.2154504, -1.883568, 1, 1, 1, 1, 1,
-1.058153, 0.5513362, -0.9992356, 1, 1, 1, 1, 1,
-1.054654, 0.4721047, -0.4120575, 1, 1, 1, 1, 1,
-1.052299, 0.05259478, -2.144037, 1, 1, 1, 1, 1,
-1.040302, -1.049449, -2.608017, 1, 1, 1, 1, 1,
-1.0348, 0.2870954, -1.712218, 1, 1, 1, 1, 1,
-1.024302, 0.8144721, -2.505054, 1, 1, 1, 1, 1,
-1.021842, 0.1639023, -1.706956, 1, 1, 1, 1, 1,
-1.017495, 0.8962529, -1.046558, 1, 1, 1, 1, 1,
-1.013676, 1.420546, -0.1410868, 1, 1, 1, 1, 1,
-1.010479, -0.7752098, -2.815798, 1, 1, 1, 1, 1,
-1.006233, 0.07718419, -1.464546, 1, 1, 1, 1, 1,
-1.005303, -0.8332212, -2.774143, 0, 0, 1, 1, 1,
-0.9984619, -0.8247352, -0.5615429, 1, 0, 0, 1, 1,
-0.9971851, -0.9006734, -3.319276, 1, 0, 0, 1, 1,
-0.9946817, 2.689316, 0.12302, 1, 0, 0, 1, 1,
-0.9916657, 0.1031339, -0.09984586, 1, 0, 0, 1, 1,
-0.9834746, 0.2169979, 0.1354202, 1, 0, 0, 1, 1,
-0.9709373, -0.02577819, -2.958185, 0, 0, 0, 1, 1,
-0.9676901, -1.029017, -0.3882865, 0, 0, 0, 1, 1,
-0.9674529, -0.7390996, -3.359546, 0, 0, 0, 1, 1,
-0.966844, 0.581009, 1.723433, 0, 0, 0, 1, 1,
-0.9642652, 0.6810133, -0.992757, 0, 0, 0, 1, 1,
-0.9640761, -0.0449165, -4.356693, 0, 0, 0, 1, 1,
-0.9592353, -1.76331, -3.661985, 0, 0, 0, 1, 1,
-0.9531579, -1.110581, -2.416478, 1, 1, 1, 1, 1,
-0.9491703, -0.807781, -2.448899, 1, 1, 1, 1, 1,
-0.9463698, 0.03863242, -1.313063, 1, 1, 1, 1, 1,
-0.9361932, -0.08727493, -1.07803, 1, 1, 1, 1, 1,
-0.9335672, -1.449198, -0.8910857, 1, 1, 1, 1, 1,
-0.9327044, 0.7377579, -1.148088, 1, 1, 1, 1, 1,
-0.9310024, -0.7664397, -2.962927, 1, 1, 1, 1, 1,
-0.9260705, -0.3510162, -2.60675, 1, 1, 1, 1, 1,
-0.9235243, 0.3749528, 0.4004594, 1, 1, 1, 1, 1,
-0.9229733, 0.4795893, -0.261063, 1, 1, 1, 1, 1,
-0.9218439, -0.2579774, -1.345528, 1, 1, 1, 1, 1,
-0.9162694, 1.8152, 0.975113, 1, 1, 1, 1, 1,
-0.9057525, 1.602985, 1.552812, 1, 1, 1, 1, 1,
-0.8967724, 0.0540431, -1.486537, 1, 1, 1, 1, 1,
-0.8912067, 0.1113513, -1.381333, 1, 1, 1, 1, 1,
-0.8843833, 0.3196715, -2.082265, 0, 0, 1, 1, 1,
-0.8820937, 0.3195821, -1.256894, 1, 0, 0, 1, 1,
-0.8758041, -0.5161856, -3.108711, 1, 0, 0, 1, 1,
-0.8750052, 1.615135, 0.01268238, 1, 0, 0, 1, 1,
-0.8717744, -0.7164863, -0.493748, 1, 0, 0, 1, 1,
-0.8646029, -1.238299, -3.252249, 1, 0, 0, 1, 1,
-0.853467, 0.5436093, -2.492584, 0, 0, 0, 1, 1,
-0.8453948, -0.6472455, -1.873637, 0, 0, 0, 1, 1,
-0.8421237, 0.3613772, -1.814752, 0, 0, 0, 1, 1,
-0.822525, 1.042336, -1.914718, 0, 0, 0, 1, 1,
-0.8220481, 1.261275, -1.483712, 0, 0, 0, 1, 1,
-0.8184755, 0.08068757, 0.9995397, 0, 0, 0, 1, 1,
-0.815578, -0.6000608, -1.157165, 0, 0, 0, 1, 1,
-0.813704, -0.7496932, -2.404438, 1, 1, 1, 1, 1,
-0.8128452, 1.094518, 0.3370265, 1, 1, 1, 1, 1,
-0.8112817, 1.558985, 0.3759337, 1, 1, 1, 1, 1,
-0.8073236, -0.0948637, -1.368465, 1, 1, 1, 1, 1,
-0.8002021, -0.06132798, -2.449942, 1, 1, 1, 1, 1,
-0.7999662, -0.06303258, -2.809249, 1, 1, 1, 1, 1,
-0.7976221, -0.694057, -4.643583, 1, 1, 1, 1, 1,
-0.7968051, -0.7430315, -2.890014, 1, 1, 1, 1, 1,
-0.7847028, 1.03017, -0.1681843, 1, 1, 1, 1, 1,
-0.7794348, -0.6646649, -2.781155, 1, 1, 1, 1, 1,
-0.777568, -0.4160419, -2.497276, 1, 1, 1, 1, 1,
-0.7771729, -2.25734, -3.522172, 1, 1, 1, 1, 1,
-0.7756161, 0.222132, -0.4421558, 1, 1, 1, 1, 1,
-0.7678719, 0.08704091, -3.146509, 1, 1, 1, 1, 1,
-0.7663288, -0.9082456, -2.573132, 1, 1, 1, 1, 1,
-0.7659895, -0.7917919, -3.614806, 0, 0, 1, 1, 1,
-0.7655033, -1.204282, -4.203335, 1, 0, 0, 1, 1,
-0.7620677, 0.8089532, -0.09922688, 1, 0, 0, 1, 1,
-0.7502159, 0.4624799, -2.757303, 1, 0, 0, 1, 1,
-0.7478411, -1.131165, -1.318167, 1, 0, 0, 1, 1,
-0.7459862, 0.4154616, 0.03199261, 1, 0, 0, 1, 1,
-0.7425871, -0.9220295, -1.105678, 0, 0, 0, 1, 1,
-0.7413218, 1.411094, -0.7504633, 0, 0, 0, 1, 1,
-0.7385021, 1.815545, -0.9962543, 0, 0, 0, 1, 1,
-0.7378794, -1.460858, -1.779976, 0, 0, 0, 1, 1,
-0.7360488, 0.5929504, -0.9275238, 0, 0, 0, 1, 1,
-0.7326311, 0.9139953, -0.6425958, 0, 0, 0, 1, 1,
-0.7312078, 0.7705163, -2.040785, 0, 0, 0, 1, 1,
-0.7280278, -0.6256436, -3.202431, 1, 1, 1, 1, 1,
-0.7248902, -0.7680441, -2.773751, 1, 1, 1, 1, 1,
-0.7208059, -0.4278675, -1.179469, 1, 1, 1, 1, 1,
-0.7152409, 0.2258876, -3.247199, 1, 1, 1, 1, 1,
-0.7137179, 0.6804022, -1.66642, 1, 1, 1, 1, 1,
-0.7001329, 0.2830987, -2.777337, 1, 1, 1, 1, 1,
-0.6941329, -0.7127523, -1.546039, 1, 1, 1, 1, 1,
-0.6933852, -1.212468, -1.798881, 1, 1, 1, 1, 1,
-0.6906834, -1.675049, -1.786333, 1, 1, 1, 1, 1,
-0.6898019, 2.122572, -0.4173943, 1, 1, 1, 1, 1,
-0.6879913, -0.8370279, -2.385739, 1, 1, 1, 1, 1,
-0.6846661, -0.3059876, -3.107576, 1, 1, 1, 1, 1,
-0.6775098, -0.9739747, -3.438354, 1, 1, 1, 1, 1,
-0.6761509, -0.4384233, 0.2099795, 1, 1, 1, 1, 1,
-0.6757128, -0.196341, -1.662257, 1, 1, 1, 1, 1,
-0.6733374, -0.6802276, -1.599741, 0, 0, 1, 1, 1,
-0.6663292, 0.6639677, -1.500658, 1, 0, 0, 1, 1,
-0.6661977, -0.5555865, -2.445212, 1, 0, 0, 1, 1,
-0.6638691, -0.05002018, -2.066426, 1, 0, 0, 1, 1,
-0.6632265, 0.4127819, -2.714619, 1, 0, 0, 1, 1,
-0.662809, -0.7685955, -3.272326, 1, 0, 0, 1, 1,
-0.6585634, 0.01502606, -0.5397661, 0, 0, 0, 1, 1,
-0.6450265, 1.261528, -1.754397, 0, 0, 0, 1, 1,
-0.6449279, -0.1700242, -0.2775601, 0, 0, 0, 1, 1,
-0.6416501, -0.4641518, -1.08513, 0, 0, 0, 1, 1,
-0.6398581, -0.2738194, -2.99712, 0, 0, 0, 1, 1,
-0.6238364, 0.2204884, -1.550134, 0, 0, 0, 1, 1,
-0.6195788, 0.9396676, -1.198231, 0, 0, 0, 1, 1,
-0.6177301, -1.898902, -3.678965, 1, 1, 1, 1, 1,
-0.6133648, -0.4798551, -0.4844545, 1, 1, 1, 1, 1,
-0.6114034, -0.5595541, -1.42099, 1, 1, 1, 1, 1,
-0.6111761, -0.3098842, -1.396811, 1, 1, 1, 1, 1,
-0.6099632, 1.319024, -0.5187706, 1, 1, 1, 1, 1,
-0.6075258, 0.1026, -1.370883, 1, 1, 1, 1, 1,
-0.6064568, -0.8716852, -3.179249, 1, 1, 1, 1, 1,
-0.6059864, -0.08455368, -1.685783, 1, 1, 1, 1, 1,
-0.5971047, -0.5646249, -3.322445, 1, 1, 1, 1, 1,
-0.5953794, 0.3815538, -1.179526, 1, 1, 1, 1, 1,
-0.5938177, 0.2754567, 0.1319175, 1, 1, 1, 1, 1,
-0.591438, -0.8332217, -4.610551, 1, 1, 1, 1, 1,
-0.5868465, 1.636616, -1.469646, 1, 1, 1, 1, 1,
-0.5854448, 0.2258227, -0.6804469, 1, 1, 1, 1, 1,
-0.5773036, -1.031063, -0.6842535, 1, 1, 1, 1, 1,
-0.5737888, -2.101564, -3.788941, 0, 0, 1, 1, 1,
-0.5672983, 0.9022425, -0.4597301, 1, 0, 0, 1, 1,
-0.5668038, 0.268995, -0.3082979, 1, 0, 0, 1, 1,
-0.5663419, -0.9316634, -3.481415, 1, 0, 0, 1, 1,
-0.5638777, -0.2578863, -1.737971, 1, 0, 0, 1, 1,
-0.5634158, -0.005414528, -0.1383201, 1, 0, 0, 1, 1,
-0.5592388, 0.4257038, -2.396608, 0, 0, 0, 1, 1,
-0.5570574, -1.064526, -1.715272, 0, 0, 0, 1, 1,
-0.5540627, -0.5886613, -2.386954, 0, 0, 0, 1, 1,
-0.5535294, -0.8281566, -1.577497, 0, 0, 0, 1, 1,
-0.5523891, -0.7519269, -1.684499, 0, 0, 0, 1, 1,
-0.5486528, 0.7388623, -1.006429, 0, 0, 0, 1, 1,
-0.5398335, -0.1893241, -0.7805998, 0, 0, 0, 1, 1,
-0.5382581, 0.4199764, 0.0890683, 1, 1, 1, 1, 1,
-0.5319013, -0.3177623, -1.637867, 1, 1, 1, 1, 1,
-0.5304253, 0.2620547, -0.2545273, 1, 1, 1, 1, 1,
-0.5285333, 0.4728175, -0.2317069, 1, 1, 1, 1, 1,
-0.5223392, -0.5954727, -3.368261, 1, 1, 1, 1, 1,
-0.5216289, 1.412206, 0.03929052, 1, 1, 1, 1, 1,
-0.5210363, -0.7345828, -2.512713, 1, 1, 1, 1, 1,
-0.5202717, -0.5624061, -1.06874, 1, 1, 1, 1, 1,
-0.5185657, -0.8435658, -5.408519, 1, 1, 1, 1, 1,
-0.5128881, -0.7644782, -5.014816, 1, 1, 1, 1, 1,
-0.5115831, -0.2641737, -2.435761, 1, 1, 1, 1, 1,
-0.509275, -1.580172, -2.457653, 1, 1, 1, 1, 1,
-0.5080244, 0.4062802, -0.6812938, 1, 1, 1, 1, 1,
-0.5063354, -0.9965032, -3.548203, 1, 1, 1, 1, 1,
-0.5045329, -0.2368153, -2.204297, 1, 1, 1, 1, 1,
-0.5024279, -1.236312, -3.119072, 0, 0, 1, 1, 1,
-0.5023257, 0.2356907, -1.508695, 1, 0, 0, 1, 1,
-0.5000558, -2.037561, -3.981351, 1, 0, 0, 1, 1,
-0.4998362, -0.4970171, -0.5025443, 1, 0, 0, 1, 1,
-0.4927203, -0.7612194, -2.971916, 1, 0, 0, 1, 1,
-0.4885007, -0.9782731, -2.093468, 1, 0, 0, 1, 1,
-0.4881121, 0.09367695, -1.780702, 0, 0, 0, 1, 1,
-0.4876902, 2.404029, -1.623405, 0, 0, 0, 1, 1,
-0.487325, 0.845638, -0.2793542, 0, 0, 0, 1, 1,
-0.4847997, 1.097838, -0.2701916, 0, 0, 0, 1, 1,
-0.4837855, -0.810517, -2.322591, 0, 0, 0, 1, 1,
-0.4758952, -1.042742, -1.695256, 0, 0, 0, 1, 1,
-0.475029, -0.02903805, -0.8546316, 0, 0, 0, 1, 1,
-0.4723972, 0.7119872, 0.3904034, 1, 1, 1, 1, 1,
-0.4707495, -0.3053917, -1.677565, 1, 1, 1, 1, 1,
-0.4697399, 0.8491133, -0.4337329, 1, 1, 1, 1, 1,
-0.4687714, 0.3101974, -0.2340522, 1, 1, 1, 1, 1,
-0.4675846, 1.526678, -1.302211, 1, 1, 1, 1, 1,
-0.4659971, -1.571026, -1.797125, 1, 1, 1, 1, 1,
-0.4595751, -1.166426, -2.976713, 1, 1, 1, 1, 1,
-0.4593523, 0.3252704, -0.6491547, 1, 1, 1, 1, 1,
-0.4580712, 0.1597225, 0.8303888, 1, 1, 1, 1, 1,
-0.4523058, 0.9823211, -1.998159, 1, 1, 1, 1, 1,
-0.4466002, -0.4599506, -0.7211054, 1, 1, 1, 1, 1,
-0.4424146, 0.4613611, -0.4740087, 1, 1, 1, 1, 1,
-0.4422373, 0.3509743, 0.1710449, 1, 1, 1, 1, 1,
-0.4418971, -1.104431, -4.060971, 1, 1, 1, 1, 1,
-0.4403127, -2.102283, -3.875017, 1, 1, 1, 1, 1,
-0.4396906, -0.6491408, -2.035505, 0, 0, 1, 1, 1,
-0.4306983, -1.292805, -3.754342, 1, 0, 0, 1, 1,
-0.4300854, 1.728262, 0.3724643, 1, 0, 0, 1, 1,
-0.4187766, -0.562778, 0.04497097, 1, 0, 0, 1, 1,
-0.4163083, -0.6102458, -2.133661, 1, 0, 0, 1, 1,
-0.4158686, 0.6927041, -0.3481786, 1, 0, 0, 1, 1,
-0.4145028, 0.5189383, -0.2526677, 0, 0, 0, 1, 1,
-0.4091628, -0.5861353, -2.265778, 0, 0, 0, 1, 1,
-0.405081, -0.9235286, -4.126434, 0, 0, 0, 1, 1,
-0.403997, 0.7289644, -0.1120456, 0, 0, 0, 1, 1,
-0.3982226, -0.5676926, -2.228014, 0, 0, 0, 1, 1,
-0.3970821, -0.83847, -4.405828, 0, 0, 0, 1, 1,
-0.3951115, -1.194436, -1.527239, 0, 0, 0, 1, 1,
-0.393874, -1.631653, -4.207661, 1, 1, 1, 1, 1,
-0.3923037, -0.8861984, -3.678967, 1, 1, 1, 1, 1,
-0.3863595, 1.015052, -0.6898092, 1, 1, 1, 1, 1,
-0.3859685, -0.8606855, -3.758361, 1, 1, 1, 1, 1,
-0.3821253, 0.06252239, 0.4218446, 1, 1, 1, 1, 1,
-0.3781613, -0.01070154, -3.313455, 1, 1, 1, 1, 1,
-0.3779678, -0.1959952, -2.818322, 1, 1, 1, 1, 1,
-0.3711705, 0.021023, -1.493408, 1, 1, 1, 1, 1,
-0.3673747, -0.28354, -1.713599, 1, 1, 1, 1, 1,
-0.3671428, 1.305505, 0.398553, 1, 1, 1, 1, 1,
-0.3667672, 0.6948073, -2.381996, 1, 1, 1, 1, 1,
-0.3664779, -2.355407, -3.191621, 1, 1, 1, 1, 1,
-0.3657683, 0.9722746, 0.5545773, 1, 1, 1, 1, 1,
-0.3637849, -2.474497, -1.374227, 1, 1, 1, 1, 1,
-0.3572534, 0.04824641, -1.467634, 1, 1, 1, 1, 1,
-0.351858, -1.308044, -3.708325, 0, 0, 1, 1, 1,
-0.3510445, 1.223542, -0.1868685, 1, 0, 0, 1, 1,
-0.3473549, -1.75232, -2.675157, 1, 0, 0, 1, 1,
-0.3451757, 1.377362, -0.8656317, 1, 0, 0, 1, 1,
-0.3427297, 0.2540051, -0.4852691, 1, 0, 0, 1, 1,
-0.3413298, -0.04966769, 0.05259623, 1, 0, 0, 1, 1,
-0.3408529, -1.144053, -3.815163, 0, 0, 0, 1, 1,
-0.340517, -0.3941489, -1.555351, 0, 0, 0, 1, 1,
-0.3381961, 1.045934, 1.426234, 0, 0, 0, 1, 1,
-0.3372795, -0.6844659, -2.19107, 0, 0, 0, 1, 1,
-0.3347789, -1.362971, -3.769989, 0, 0, 0, 1, 1,
-0.3336894, 0.08843955, -0.3110038, 0, 0, 0, 1, 1,
-0.3313186, 0.5405411, 0.1314349, 0, 0, 0, 1, 1,
-0.3243202, -0.4662246, -1.488996, 1, 1, 1, 1, 1,
-0.3155015, -0.8880568, -3.322071, 1, 1, 1, 1, 1,
-0.3143824, 0.9308912, -0.1684464, 1, 1, 1, 1, 1,
-0.3124069, -0.05352756, -2.366686, 1, 1, 1, 1, 1,
-0.3110813, 0.6028442, -1.091641, 1, 1, 1, 1, 1,
-0.3107634, 0.7154031, 0.5663599, 1, 1, 1, 1, 1,
-0.3099012, -0.08816883, -3.095801, 1, 1, 1, 1, 1,
-0.3097223, -1.121048, -3.121026, 1, 1, 1, 1, 1,
-0.3077895, 1.262256, -1.892555, 1, 1, 1, 1, 1,
-0.3074993, 1.394484, -1.835446, 1, 1, 1, 1, 1,
-0.3073469, -0.01903135, -1.039475, 1, 1, 1, 1, 1,
-0.2920205, -0.2181167, -3.08858, 1, 1, 1, 1, 1,
-0.289471, -1.474162, -3.309008, 1, 1, 1, 1, 1,
-0.2893843, 0.07491069, -0.6232076, 1, 1, 1, 1, 1,
-0.2875875, -0.3948919, -1.211172, 1, 1, 1, 1, 1,
-0.2863813, 0.2854218, -2.956953, 0, 0, 1, 1, 1,
-0.2853141, 0.04750925, -2.183337, 1, 0, 0, 1, 1,
-0.2848347, 0.5074848, -1.467689, 1, 0, 0, 1, 1,
-0.2842883, 0.4348896, -1.709996, 1, 0, 0, 1, 1,
-0.2815914, -2.357481, -5.190206, 1, 0, 0, 1, 1,
-0.2773091, -1.084334, -3.011855, 1, 0, 0, 1, 1,
-0.2745773, -0.2946863, -3.997111, 0, 0, 0, 1, 1,
-0.2739154, -0.03086679, -1.674513, 0, 0, 0, 1, 1,
-0.2734019, 1.786304, -0.3166593, 0, 0, 0, 1, 1,
-0.2620766, -1.05941, -4.820659, 0, 0, 0, 1, 1,
-0.2607476, 0.9229003, 0.02429463, 0, 0, 0, 1, 1,
-0.2598775, -0.7773076, -1.653466, 0, 0, 0, 1, 1,
-0.2595527, 0.1666958, -0.7145299, 0, 0, 0, 1, 1,
-0.2586151, 0.002956328, -0.3798805, 1, 1, 1, 1, 1,
-0.2541489, 0.1781668, -1.668892, 1, 1, 1, 1, 1,
-0.2540872, 1.403153, 1.385663, 1, 1, 1, 1, 1,
-0.2537701, 2.293683, -1.415365, 1, 1, 1, 1, 1,
-0.2490031, 0.7943472, -0.6694011, 1, 1, 1, 1, 1,
-0.2479346, -0.2224884, -1.414736, 1, 1, 1, 1, 1,
-0.2437277, -0.5965379, -1.787093, 1, 1, 1, 1, 1,
-0.2411271, 0.4339393, -1.407872, 1, 1, 1, 1, 1,
-0.2396946, 2.74474, -0.8621458, 1, 1, 1, 1, 1,
-0.2384078, -0.2262756, -1.621138, 1, 1, 1, 1, 1,
-0.234821, -0.3241937, -3.494502, 1, 1, 1, 1, 1,
-0.2325902, -1.475948, -3.498442, 1, 1, 1, 1, 1,
-0.2321005, -1.817762, -1.686271, 1, 1, 1, 1, 1,
-0.2298368, -1.06192, -1.402995, 1, 1, 1, 1, 1,
-0.2284976, -0.8009208, -4.029716, 1, 1, 1, 1, 1,
-0.2257237, 0.3802441, -0.3438999, 0, 0, 1, 1, 1,
-0.2240697, 0.8744769, 0.2835076, 1, 0, 0, 1, 1,
-0.2193412, 0.06550145, -1.463049, 1, 0, 0, 1, 1,
-0.215736, -0.735873, -2.317385, 1, 0, 0, 1, 1,
-0.2060486, 0.4815224, -0.8935159, 1, 0, 0, 1, 1,
-0.2036168, -0.8563588, -3.788129, 1, 0, 0, 1, 1,
-0.1973218, 0.433234, -1.003271, 0, 0, 0, 1, 1,
-0.1968847, 1.050397, 0.007320059, 0, 0, 0, 1, 1,
-0.1901738, -0.01034672, -4.05091, 0, 0, 0, 1, 1,
-0.1883299, 0.2888393, 0.3508551, 0, 0, 0, 1, 1,
-0.1849268, -0.6547938, -2.769767, 0, 0, 0, 1, 1,
-0.1790057, 0.4565919, -0.7808462, 0, 0, 0, 1, 1,
-0.1756541, -1.073025, -4.022278, 0, 0, 0, 1, 1,
-0.175398, -0.8725433, -2.397267, 1, 1, 1, 1, 1,
-0.1730213, -0.1701597, -1.764882, 1, 1, 1, 1, 1,
-0.1702352, 0.3616168, -0.6682762, 1, 1, 1, 1, 1,
-0.1697301, 0.2903531, -0.7405676, 1, 1, 1, 1, 1,
-0.1693512, 0.3077745, -0.2237401, 1, 1, 1, 1, 1,
-0.1677414, -1.905725, -3.794743, 1, 1, 1, 1, 1,
-0.1645238, 0.5782089, -0.6131931, 1, 1, 1, 1, 1,
-0.161731, -0.5272113, -1.462697, 1, 1, 1, 1, 1,
-0.1604722, -1.280744, -1.924674, 1, 1, 1, 1, 1,
-0.1542603, -1.077114, -4.59842, 1, 1, 1, 1, 1,
-0.1533828, -1.353599, -1.551331, 1, 1, 1, 1, 1,
-0.1514072, -1.082048, -4.941169, 1, 1, 1, 1, 1,
-0.1504781, -0.1846087, -3.32357, 1, 1, 1, 1, 1,
-0.1484671, 0.07849421, -0.550823, 1, 1, 1, 1, 1,
-0.1427365, 1.097909, -0.1427953, 1, 1, 1, 1, 1,
-0.1385601, -2.473655, -2.560439, 0, 0, 1, 1, 1,
-0.1333457, 1.409294, -0.6958756, 1, 0, 0, 1, 1,
-0.1298928, -0.202759, -4.032699, 1, 0, 0, 1, 1,
-0.1293208, 0.1848992, 1.68049, 1, 0, 0, 1, 1,
-0.1269066, 1.84178, -0.1630704, 1, 0, 0, 1, 1,
-0.1261746, -2.52767, -5.18749, 1, 0, 0, 1, 1,
-0.1241543, 0.01754808, -2.296314, 0, 0, 0, 1, 1,
-0.1185174, -0.07048114, -2.636985, 0, 0, 0, 1, 1,
-0.1183028, -0.05856923, -0.5679513, 0, 0, 0, 1, 1,
-0.1177391, 0.8436999, -1.566359, 0, 0, 0, 1, 1,
-0.1162099, -1.081619, -4.239463, 0, 0, 0, 1, 1,
-0.1059206, -2.131253, -3.272114, 0, 0, 0, 1, 1,
-0.1017094, 0.4372924, -0.4645888, 0, 0, 0, 1, 1,
-0.09784321, 1.9323, 1.241657, 1, 1, 1, 1, 1,
-0.09759079, 0.7346314, 0.1496657, 1, 1, 1, 1, 1,
-0.0951869, -1.067064, -2.992406, 1, 1, 1, 1, 1,
-0.09034479, 0.4588978, 0.1534532, 1, 1, 1, 1, 1,
-0.087592, -1.005269, -3.008045, 1, 1, 1, 1, 1,
-0.08433982, 0.07453861, -1.526797, 1, 1, 1, 1, 1,
-0.08365023, 0.8812747, 0.5179331, 1, 1, 1, 1, 1,
-0.07851652, -1.489848, -2.878841, 1, 1, 1, 1, 1,
-0.07715659, 0.3422554, -0.3517143, 1, 1, 1, 1, 1,
-0.07516029, 1.357108, 0.950076, 1, 1, 1, 1, 1,
-0.06812894, -0.9203667, -2.57016, 1, 1, 1, 1, 1,
-0.06787214, -0.6732749, -2.682559, 1, 1, 1, 1, 1,
-0.06129321, 0.9553594, 0.6621255, 1, 1, 1, 1, 1,
-0.06020787, 1.084888, -0.1764307, 1, 1, 1, 1, 1,
-0.05903475, -0.2524644, -5.515383, 1, 1, 1, 1, 1,
-0.05553056, -0.9328169, -4.058387, 0, 0, 1, 1, 1,
-0.04925517, 2.027828, -3.086875, 1, 0, 0, 1, 1,
-0.04546758, 0.9780607, -0.5062569, 1, 0, 0, 1, 1,
-0.0424075, 0.8609389, -0.4810511, 1, 0, 0, 1, 1,
-0.03946096, 0.317064, 0.4306423, 1, 0, 0, 1, 1,
-0.03918312, 0.3869075, 0.1683777, 1, 0, 0, 1, 1,
-0.03314602, 0.4258338, 0.9579142, 0, 0, 0, 1, 1,
-0.0325345, 0.8320212, 0.1252795, 0, 0, 0, 1, 1,
-0.03210821, 1.097681, 0.6875299, 0, 0, 0, 1, 1,
-0.03177572, -0.02475939, -3.064007, 0, 0, 0, 1, 1,
-0.02992539, -1.360051, -1.319867, 0, 0, 0, 1, 1,
-0.02859392, 0.8603122, -1.59783, 0, 0, 0, 1, 1,
-0.02589662, 1.481591, 0.5595577, 0, 0, 0, 1, 1,
-0.02582052, 0.8228281, 0.1182746, 1, 1, 1, 1, 1,
-0.02273851, -1.022066, -6.209058, 1, 1, 1, 1, 1,
-0.02045306, -0.4939669, -1.040015, 1, 1, 1, 1, 1,
-0.0166375, 1.950484, -0.2493343, 1, 1, 1, 1, 1,
-0.01659855, 1.063903, -0.6164396, 1, 1, 1, 1, 1,
-0.01571828, 0.3109626, 1.185125, 1, 1, 1, 1, 1,
-0.01225205, -0.7142023, -2.946428, 1, 1, 1, 1, 1,
-0.00986218, -0.4279216, -3.534132, 1, 1, 1, 1, 1,
-0.006760195, 0.7067695, -1.164352, 1, 1, 1, 1, 1,
-0.00635552, 0.5327948, -0.5698674, 1, 1, 1, 1, 1,
0.002274376, -0.7295312, 1.669112, 1, 1, 1, 1, 1,
0.006324696, 1.474167, -0.007895088, 1, 1, 1, 1, 1,
0.006799533, -0.1366571, 4.825251, 1, 1, 1, 1, 1,
0.007826227, -1.324634, 2.518194, 1, 1, 1, 1, 1,
0.008693211, -1.245735, 4.829812, 1, 1, 1, 1, 1,
0.009583853, -1.075532, 4.57133, 0, 0, 1, 1, 1,
0.0148401, 0.8522277, -0.3882471, 1, 0, 0, 1, 1,
0.01625453, -0.8422744, 3.797678, 1, 0, 0, 1, 1,
0.01873912, 1.97825, 1.620728, 1, 0, 0, 1, 1,
0.01959138, -0.07995875, 3.648384, 1, 0, 0, 1, 1,
0.02705912, -0.07499453, 2.740976, 1, 0, 0, 1, 1,
0.03189269, -0.4893113, 2.486613, 0, 0, 0, 1, 1,
0.03757873, 0.4541311, 0.7593127, 0, 0, 0, 1, 1,
0.04274951, 0.4091022, -0.6579945, 0, 0, 0, 1, 1,
0.04375834, -1.136767, 3.87529, 0, 0, 0, 1, 1,
0.05448829, -0.507875, 2.29609, 0, 0, 0, 1, 1,
0.05519738, -0.7563236, 2.462967, 0, 0, 0, 1, 1,
0.05649778, -0.4722726, 3.661994, 0, 0, 0, 1, 1,
0.05746263, 0.1770897, 1.570973, 1, 1, 1, 1, 1,
0.06045115, 1.617328, 1.870144, 1, 1, 1, 1, 1,
0.06195213, 1.654361, -0.6129703, 1, 1, 1, 1, 1,
0.06226294, 0.110862, 1.02136, 1, 1, 1, 1, 1,
0.06363004, -0.3329561, 2.892636, 1, 1, 1, 1, 1,
0.06398136, 0.1476198, 0.1794062, 1, 1, 1, 1, 1,
0.06488593, 0.1759268, -0.4361754, 1, 1, 1, 1, 1,
0.07294109, -0.7970565, 2.74541, 1, 1, 1, 1, 1,
0.07804753, -0.1144747, 1.763042, 1, 1, 1, 1, 1,
0.0788851, -0.83982, 3.94066, 1, 1, 1, 1, 1,
0.08100314, -0.2812493, 3.498943, 1, 1, 1, 1, 1,
0.08201054, -2.475079, 3.204193, 1, 1, 1, 1, 1,
0.08368698, -1.205489, 3.586223, 1, 1, 1, 1, 1,
0.08742049, -0.1978818, 1.855105, 1, 1, 1, 1, 1,
0.09253148, -0.708797, 1.672489, 1, 1, 1, 1, 1,
0.09315613, -0.520274, 3.092856, 0, 0, 1, 1, 1,
0.09337072, -0.9229498, 4.080089, 1, 0, 0, 1, 1,
0.0938794, -1.521018, 3.350266, 1, 0, 0, 1, 1,
0.09574414, -1.00835, 3.375618, 1, 0, 0, 1, 1,
0.1004605, 0.9108985, 0.4687743, 1, 0, 0, 1, 1,
0.102314, -1.641458, 3.864623, 1, 0, 0, 1, 1,
0.1023808, 1.864694, -0.2963269, 0, 0, 0, 1, 1,
0.107139, -0.3029031, 2.215104, 0, 0, 0, 1, 1,
0.1083234, -0.04803891, 4.343387, 0, 0, 0, 1, 1,
0.1106617, 0.2737048, 0.7348019, 0, 0, 0, 1, 1,
0.1129087, 0.1054418, -0.8318627, 0, 0, 0, 1, 1,
0.1139722, 2.874061, -1.897124, 0, 0, 0, 1, 1,
0.1151076, 1.231209, -0.5576475, 0, 0, 0, 1, 1,
0.1165382, -0.6891759, 2.784545, 1, 1, 1, 1, 1,
0.1178744, 0.927673, 1.485247, 1, 1, 1, 1, 1,
0.118502, -0.7546579, 3.541286, 1, 1, 1, 1, 1,
0.1197775, 1.231126, -0.1003547, 1, 1, 1, 1, 1,
0.1217707, 0.1386003, -1.378878, 1, 1, 1, 1, 1,
0.1228721, -1.020985, 1.266696, 1, 1, 1, 1, 1,
0.1298581, 0.5246993, -0.6022611, 1, 1, 1, 1, 1,
0.1313542, -0.7526174, 2.360165, 1, 1, 1, 1, 1,
0.1392707, -0.853102, 2.276522, 1, 1, 1, 1, 1,
0.1426484, -1.174196, 3.999357, 1, 1, 1, 1, 1,
0.1446573, 1.725361, -0.3560833, 1, 1, 1, 1, 1,
0.1492136, 0.6019517, 0.4310118, 1, 1, 1, 1, 1,
0.1512262, 0.7556302, 0.7789488, 1, 1, 1, 1, 1,
0.1522723, -0.2082899, 2.435778, 1, 1, 1, 1, 1,
0.1527894, 0.2146479, 0.8904393, 1, 1, 1, 1, 1,
0.1572277, 0.7443342, 0.1380879, 0, 0, 1, 1, 1,
0.160756, -0.8018772, 3.417108, 1, 0, 0, 1, 1,
0.1642852, 0.1479156, 1.246937, 1, 0, 0, 1, 1,
0.1648879, -0.3693575, 3.308288, 1, 0, 0, 1, 1,
0.1660768, -0.495968, 2.225901, 1, 0, 0, 1, 1,
0.1661034, -0.1037772, 1.674187, 1, 0, 0, 1, 1,
0.1667108, 1.142169, 1.895493, 0, 0, 0, 1, 1,
0.1677732, 0.290076, 0.819813, 0, 0, 0, 1, 1,
0.1684232, -1.240277, 3.218662, 0, 0, 0, 1, 1,
0.171941, -0.7397333, 1.409395, 0, 0, 0, 1, 1,
0.175055, 0.1424782, 1.696885, 0, 0, 0, 1, 1,
0.1755191, 0.2538293, 0.8780068, 0, 0, 0, 1, 1,
0.1821887, -0.9406971, 0.9007235, 0, 0, 0, 1, 1,
0.186011, -0.2599548, 2.30086, 1, 1, 1, 1, 1,
0.1893327, 1.543105, -2.564293, 1, 1, 1, 1, 1,
0.1896422, -0.377023, 3.83362, 1, 1, 1, 1, 1,
0.1908817, -1.248302, 3.564302, 1, 1, 1, 1, 1,
0.1924136, -1.841325, 2.203628, 1, 1, 1, 1, 1,
0.197175, -0.2491061, 3.073657, 1, 1, 1, 1, 1,
0.1972654, 1.906837, -1.492487, 1, 1, 1, 1, 1,
0.1990859, -0.6232726, 5.302173, 1, 1, 1, 1, 1,
0.2044599, 0.04964953, 1.100747, 1, 1, 1, 1, 1,
0.205097, 0.4155699, 0.8608425, 1, 1, 1, 1, 1,
0.2083853, 0.02173367, 1.112495, 1, 1, 1, 1, 1,
0.2126959, -0.04173041, 2.362524, 1, 1, 1, 1, 1,
0.2134947, 0.1365961, 2.269945, 1, 1, 1, 1, 1,
0.2170207, 0.3241083, 1.105731, 1, 1, 1, 1, 1,
0.2198723, 0.0885893, 0.602053, 1, 1, 1, 1, 1,
0.2201391, -0.3286605, 2.287413, 0, 0, 1, 1, 1,
0.2229731, 0.2766292, 0.3319634, 1, 0, 0, 1, 1,
0.2243984, 0.2975793, -1.436651, 1, 0, 0, 1, 1,
0.2257222, 0.8951665, -1.054114, 1, 0, 0, 1, 1,
0.2260444, 0.2114218, 2.264743, 1, 0, 0, 1, 1,
0.2300984, -0.8237338, 1.798939, 1, 0, 0, 1, 1,
0.2310328, 0.04889384, 0.3342091, 0, 0, 0, 1, 1,
0.2315386, 1.079352, 0.6714041, 0, 0, 0, 1, 1,
0.2382059, 0.02729662, 2.936451, 0, 0, 0, 1, 1,
0.2384081, -0.324356, 2.79514, 0, 0, 0, 1, 1,
0.2403906, -0.4509491, 1.595605, 0, 0, 0, 1, 1,
0.242323, -0.3169278, 1.850182, 0, 0, 0, 1, 1,
0.245644, -0.272551, 1.700055, 0, 0, 0, 1, 1,
0.2461316, 0.1444748, 2.569086, 1, 1, 1, 1, 1,
0.2488735, -0.2148919, 1.963891, 1, 1, 1, 1, 1,
0.2491889, 0.2596112, 1.356153, 1, 1, 1, 1, 1,
0.2541535, 0.9103506, 0.2860283, 1, 1, 1, 1, 1,
0.2546662, -1.124721, 4.618051, 1, 1, 1, 1, 1,
0.2563598, 0.4175065, -1.515581, 1, 1, 1, 1, 1,
0.2609016, 0.9206766, 0.4226335, 1, 1, 1, 1, 1,
0.263985, 0.2504384, 0.5552877, 1, 1, 1, 1, 1,
0.2660856, 0.2697915, 0.8261824, 1, 1, 1, 1, 1,
0.2673, -0.6441774, 2.544992, 1, 1, 1, 1, 1,
0.2697847, 1.068794, 0.2930269, 1, 1, 1, 1, 1,
0.2718292, 0.3628342, 0.4015058, 1, 1, 1, 1, 1,
0.2726859, 1.076149, 0.8098422, 1, 1, 1, 1, 1,
0.2733768, -1.039001, 3.86777, 1, 1, 1, 1, 1,
0.2776282, 1.14165, 0.1301555, 1, 1, 1, 1, 1,
0.2840606, -1.288364, 4.432861, 0, 0, 1, 1, 1,
0.2868351, 0.4416015, 2.145417, 1, 0, 0, 1, 1,
0.2883972, -0.313284, 2.097705, 1, 0, 0, 1, 1,
0.2892016, 0.5998077, -0.3173509, 1, 0, 0, 1, 1,
0.2978433, -1.919232, 1.74061, 1, 0, 0, 1, 1,
0.2983649, -0.7716858, 3.795966, 1, 0, 0, 1, 1,
0.2985637, 0.4360665, 3.143758, 0, 0, 0, 1, 1,
0.2995725, -1.304962, 2.63115, 0, 0, 0, 1, 1,
0.3030418, -0.5585954, 1.335823, 0, 0, 0, 1, 1,
0.3035729, 0.3486974, 1.413607, 0, 0, 0, 1, 1,
0.3049404, 0.5904072, 0.3809521, 0, 0, 0, 1, 1,
0.3066289, 1.238979, 0.4957824, 0, 0, 0, 1, 1,
0.3093281, -0.02014509, 0.7380781, 0, 0, 0, 1, 1,
0.3114614, -0.9899676, 4.877842, 1, 1, 1, 1, 1,
0.3133892, -1.071067, 2.193924, 1, 1, 1, 1, 1,
0.3153737, 1.312349, 1.327096, 1, 1, 1, 1, 1,
0.3164006, 1.073325, 2.401214, 1, 1, 1, 1, 1,
0.325408, 0.6633891, -0.0465709, 1, 1, 1, 1, 1,
0.3430694, -1.252953, 3.324332, 1, 1, 1, 1, 1,
0.3515107, -0.2472708, 1.436157, 1, 1, 1, 1, 1,
0.3521346, -0.4542145, 2.168015, 1, 1, 1, 1, 1,
0.3539251, 0.000176767, 2.40424, 1, 1, 1, 1, 1,
0.3585078, -0.6823459, 1.827238, 1, 1, 1, 1, 1,
0.3599513, 1.083267, 0.04747902, 1, 1, 1, 1, 1,
0.3645925, -1.479644, 2.521017, 1, 1, 1, 1, 1,
0.3683343, -0.1692122, 1.917998, 1, 1, 1, 1, 1,
0.3685153, -0.2116945, -0.4846554, 1, 1, 1, 1, 1,
0.3696045, -0.08219884, 1.440894, 1, 1, 1, 1, 1,
0.3760676, -0.2576627, 4.797233, 0, 0, 1, 1, 1,
0.3770522, -2.178068, 4.033227, 1, 0, 0, 1, 1,
0.3858678, 1.365724, -0.3755475, 1, 0, 0, 1, 1,
0.3870538, -0.3419937, 1.854649, 1, 0, 0, 1, 1,
0.3912857, -0.4202875, 4.316231, 1, 0, 0, 1, 1,
0.3930964, -1.68933, 3.398422, 1, 0, 0, 1, 1,
0.3972408, -0.4913504, 3.56707, 0, 0, 0, 1, 1,
0.3974486, -1.101367, 2.371116, 0, 0, 0, 1, 1,
0.3975115, 0.02473967, 1.382598, 0, 0, 0, 1, 1,
0.4043176, 0.4968559, 0.7426475, 0, 0, 0, 1, 1,
0.4047899, 0.1210854, 0.3501296, 0, 0, 0, 1, 1,
0.4049544, 1.971671, 0.502156, 0, 0, 0, 1, 1,
0.4065479, -0.939395, 1.097207, 0, 0, 0, 1, 1,
0.4069609, -0.06153009, 1.320358, 1, 1, 1, 1, 1,
0.4076648, 0.05638154, 1.753141, 1, 1, 1, 1, 1,
0.4101821, 1.907696, -0.4979719, 1, 1, 1, 1, 1,
0.4114137, 2.727593, -1.150986, 1, 1, 1, 1, 1,
0.4143739, 0.2946542, 0.8177537, 1, 1, 1, 1, 1,
0.4175057, -0.686176, 3.464104, 1, 1, 1, 1, 1,
0.4212733, 0.8320282, 0.414079, 1, 1, 1, 1, 1,
0.4258081, -0.3248698, 3.546095, 1, 1, 1, 1, 1,
0.4300739, 0.5439558, -1.46766, 1, 1, 1, 1, 1,
0.4311063, -0.8636388, 4.24534, 1, 1, 1, 1, 1,
0.4401714, 1.232992, -0.08452994, 1, 1, 1, 1, 1,
0.4422876, -0.8443229, 1.530872, 1, 1, 1, 1, 1,
0.442627, -0.7523429, 2.490566, 1, 1, 1, 1, 1,
0.4446689, -0.536736, 3.688276, 1, 1, 1, 1, 1,
0.4498362, 0.585819, -0.03177419, 1, 1, 1, 1, 1,
0.4502996, 0.5985985, 1.652474, 0, 0, 1, 1, 1,
0.4548658, 0.4481021, -0.9153302, 1, 0, 0, 1, 1,
0.4586111, -1.24399, 3.680554, 1, 0, 0, 1, 1,
0.4608829, -0.6953657, 2.32044, 1, 0, 0, 1, 1,
0.462367, -1.779444, 1.996182, 1, 0, 0, 1, 1,
0.4651675, -0.9615952, 1.226918, 1, 0, 0, 1, 1,
0.4686206, -1.787929, 2.886873, 0, 0, 0, 1, 1,
0.4759518, 0.5871496, -0.4102872, 0, 0, 0, 1, 1,
0.4785214, 1.806472, -0.6453745, 0, 0, 0, 1, 1,
0.4790422, -0.9114503, 1.682663, 0, 0, 0, 1, 1,
0.4873803, 1.529845, 1.791733, 0, 0, 0, 1, 1,
0.4930273, -0.272904, 2.081254, 0, 0, 0, 1, 1,
0.4961084, -0.2019429, 1.617199, 0, 0, 0, 1, 1,
0.4989274, -0.3179864, 0.3444356, 1, 1, 1, 1, 1,
0.5019982, 0.7198996, 0.7141499, 1, 1, 1, 1, 1,
0.5036693, -0.5438585, 0.2021094, 1, 1, 1, 1, 1,
0.5050031, 2.477386, 1.30265, 1, 1, 1, 1, 1,
0.5069678, -2.127098, 2.306757, 1, 1, 1, 1, 1,
0.5099672, 1.274243, 1.810147, 1, 1, 1, 1, 1,
0.5103095, 0.1864587, 0.5511925, 1, 1, 1, 1, 1,
0.5145145, -0.7580176, 1.574505, 1, 1, 1, 1, 1,
0.5150946, 0.1613497, 2.79458, 1, 1, 1, 1, 1,
0.5159643, 1.131367, -1.244591, 1, 1, 1, 1, 1,
0.5183117, 1.145594, 0.4415495, 1, 1, 1, 1, 1,
0.5229609, 0.1446411, 1.723257, 1, 1, 1, 1, 1,
0.5233905, 0.3270698, 1.506178, 1, 1, 1, 1, 1,
0.524365, -0.8765674, 2.588359, 1, 1, 1, 1, 1,
0.5249649, -0.6470401, 2.00758, 1, 1, 1, 1, 1,
0.5254638, 0.7916193, 1.514867, 0, 0, 1, 1, 1,
0.5260831, -0.4949758, 3.709759, 1, 0, 0, 1, 1,
0.5332253, 0.7682087, 0.960874, 1, 0, 0, 1, 1,
0.5342854, 1.396498, 0.2958957, 1, 0, 0, 1, 1,
0.5479981, 1.039404, 1.155951, 1, 0, 0, 1, 1,
0.5486522, -0.7679293, 1.054937, 1, 0, 0, 1, 1,
0.5515183, 0.7902493, 1.75713, 0, 0, 0, 1, 1,
0.5568996, -0.9532368, 0.8923002, 0, 0, 0, 1, 1,
0.5587209, -0.1362346, 1.948306, 0, 0, 0, 1, 1,
0.5601168, 0.7104595, 0.5243756, 0, 0, 0, 1, 1,
0.5644195, -1.732136, 4.341952, 0, 0, 0, 1, 1,
0.5648913, 0.4737295, 2.369287, 0, 0, 0, 1, 1,
0.5662754, 2.044898, 0.1953103, 0, 0, 0, 1, 1,
0.5715032, -0.2894672, 1.911888, 1, 1, 1, 1, 1,
0.571769, 2.249656, -0.8926488, 1, 1, 1, 1, 1,
0.5728645, 0.03231758, 0.9090282, 1, 1, 1, 1, 1,
0.5770512, -0.09141256, 1.836412, 1, 1, 1, 1, 1,
0.5796155, -0.942734, 1.66669, 1, 1, 1, 1, 1,
0.5798933, 1.246308, 1.269681, 1, 1, 1, 1, 1,
0.5813892, 0.3281392, 1.272833, 1, 1, 1, 1, 1,
0.5848036, 0.2925932, 0.1944078, 1, 1, 1, 1, 1,
0.5853704, -0.2118716, 2.548138, 1, 1, 1, 1, 1,
0.5898589, 0.2429674, -0.5101955, 1, 1, 1, 1, 1,
0.5927945, -0.9037917, 3.115738, 1, 1, 1, 1, 1,
0.5933651, -0.1236179, 2.506285, 1, 1, 1, 1, 1,
0.5936893, 1.557366, 0.3075033, 1, 1, 1, 1, 1,
0.6003098, -1.146269, 1.77273, 1, 1, 1, 1, 1,
0.6088258, -2.113955, 2.924771, 1, 1, 1, 1, 1,
0.6112498, -0.2086819, 2.383405, 0, 0, 1, 1, 1,
0.6129737, 0.1710511, 0.7873435, 1, 0, 0, 1, 1,
0.6153461, 1.050913, -0.501818, 1, 0, 0, 1, 1,
0.6163692, -0.8248364, 3.679666, 1, 0, 0, 1, 1,
0.6164363, -0.7641461, 1.313387, 1, 0, 0, 1, 1,
0.6172315, 0.7610155, 0.2031208, 1, 0, 0, 1, 1,
0.6176819, -1.577693, 2.964487, 0, 0, 0, 1, 1,
0.6195319, -1.375171, 3.619057, 0, 0, 0, 1, 1,
0.6195844, 1.201313, 1.385501, 0, 0, 0, 1, 1,
0.6219932, -2.561464, 4.03697, 0, 0, 0, 1, 1,
0.6359308, -0.770824, 2.449274, 0, 0, 0, 1, 1,
0.6394616, 1.685812, 0.8827841, 0, 0, 0, 1, 1,
0.6483909, 0.3092349, 1.592044, 0, 0, 0, 1, 1,
0.6484021, -1.024739, 2.607382, 1, 1, 1, 1, 1,
0.6502862, 1.807563, 0.974933, 1, 1, 1, 1, 1,
0.6504112, -1.350971, 3.796747, 1, 1, 1, 1, 1,
0.6533812, 0.4925762, 1.199188, 1, 1, 1, 1, 1,
0.6538902, 0.5428689, 0.7803795, 1, 1, 1, 1, 1,
0.6546372, -1.135982, 0.3853968, 1, 1, 1, 1, 1,
0.6555662, 2.676734, 0.5042441, 1, 1, 1, 1, 1,
0.6609622, -1.508741, 3.80929, 1, 1, 1, 1, 1,
0.6637126, -0.7657545, 2.500081, 1, 1, 1, 1, 1,
0.6709594, -0.7875818, 2.505439, 1, 1, 1, 1, 1,
0.6719439, -0.5621045, 3.175545, 1, 1, 1, 1, 1,
0.6721659, 0.1635632, 2.410504, 1, 1, 1, 1, 1,
0.6825312, -1.612298, 3.362262, 1, 1, 1, 1, 1,
0.6875078, -0.7010398, 1.663351, 1, 1, 1, 1, 1,
0.6875284, 0.4619355, 1.714159, 1, 1, 1, 1, 1,
0.6938403, 0.1399877, 0.165367, 0, 0, 1, 1, 1,
0.6972492, 1.252714, -0.3426925, 1, 0, 0, 1, 1,
0.698727, -1.670933, 2.280725, 1, 0, 0, 1, 1,
0.7053541, 0.4583393, 2.757283, 1, 0, 0, 1, 1,
0.7069035, -1.023306, 1.58075, 1, 0, 0, 1, 1,
0.70973, 1.106038, 0.0606705, 1, 0, 0, 1, 1,
0.7102368, -1.516661, 3.118793, 0, 0, 0, 1, 1,
0.713419, 0.8680126, 0.7465751, 0, 0, 0, 1, 1,
0.71713, -0.6917556, 1.6918, 0, 0, 0, 1, 1,
0.7214772, 1.229003, -0.009002196, 0, 0, 0, 1, 1,
0.7286445, -1.08254, 2.159549, 0, 0, 0, 1, 1,
0.7351312, -0.9311602, 2.584503, 0, 0, 0, 1, 1,
0.736635, -1.085805, 4.47703, 0, 0, 0, 1, 1,
0.744579, -0.8338714, 3.784728, 1, 1, 1, 1, 1,
0.7473186, -0.6702183, 2.641882, 1, 1, 1, 1, 1,
0.7481461, -0.2492807, 2.053368, 1, 1, 1, 1, 1,
0.7577142, 0.8282658, 0.847866, 1, 1, 1, 1, 1,
0.7773085, 0.9366817, 1.041751, 1, 1, 1, 1, 1,
0.7779703, -0.2280201, 1.182361, 1, 1, 1, 1, 1,
0.7783419, 0.1794933, 1.702976, 1, 1, 1, 1, 1,
0.7819613, -0.3972602, 3.463014, 1, 1, 1, 1, 1,
0.7847732, -0.8871229, 1.775859, 1, 1, 1, 1, 1,
0.7911915, 1.084129, 2.006037, 1, 1, 1, 1, 1,
0.7970541, 0.9038339, -0.2220825, 1, 1, 1, 1, 1,
0.8015657, 1.636829, 0.7877067, 1, 1, 1, 1, 1,
0.8034078, -0.1710988, 0.8296811, 1, 1, 1, 1, 1,
0.8145097, -0.470063, 0.6829805, 1, 1, 1, 1, 1,
0.8183793, 0.4655392, 0.7660559, 1, 1, 1, 1, 1,
0.8192295, 0.1246732, 3.138793, 0, 0, 1, 1, 1,
0.8200279, 1.007032, 2.261858, 1, 0, 0, 1, 1,
0.8221332, -0.1569023, 1.085101, 1, 0, 0, 1, 1,
0.8299432, -0.1422493, 1.121584, 1, 0, 0, 1, 1,
0.8415699, 0.06908894, 1.754237, 1, 0, 0, 1, 1,
0.8427193, 0.7472883, 1.463214, 1, 0, 0, 1, 1,
0.8462014, 0.4593776, 0.7268872, 0, 0, 0, 1, 1,
0.8470713, 1.35411, 2.253669, 0, 0, 0, 1, 1,
0.850993, -0.5545822, 2.300513, 0, 0, 0, 1, 1,
0.8546319, 0.4105569, 0.08933167, 0, 0, 0, 1, 1,
0.86001, -0.1515067, 2.348287, 0, 0, 0, 1, 1,
0.862247, 1.363501, 0.5788954, 0, 0, 0, 1, 1,
0.8626266, 1.04364, -0.05703947, 0, 0, 0, 1, 1,
0.8654494, 0.1973527, 1.43424, 1, 1, 1, 1, 1,
0.8669965, -0.3360142, 1.540732, 1, 1, 1, 1, 1,
0.872169, -1.509799, 1.317405, 1, 1, 1, 1, 1,
0.8726258, -0.3028384, 3.216144, 1, 1, 1, 1, 1,
0.878045, -0.1273389, 3.530955, 1, 1, 1, 1, 1,
0.8780753, -1.320628, 2.422322, 1, 1, 1, 1, 1,
0.8803841, -1.777223, 3.340397, 1, 1, 1, 1, 1,
0.8804089, -0.07925174, 1.071304, 1, 1, 1, 1, 1,
0.8819634, 2.748084, 2.221158, 1, 1, 1, 1, 1,
0.8861654, -0.02434125, 1.880122, 1, 1, 1, 1, 1,
0.8915986, 1.349325, 1.238461, 1, 1, 1, 1, 1,
0.8974911, 0.342881, 0.1860045, 1, 1, 1, 1, 1,
0.9101437, 1.068847, 0.5329973, 1, 1, 1, 1, 1,
0.9165199, 1.271046, 0.2482804, 1, 1, 1, 1, 1,
0.917433, -0.9788116, 3.488085, 1, 1, 1, 1, 1,
0.9187025, -0.4030755, -0.06314213, 0, 0, 1, 1, 1,
0.9198501, -0.2617087, 3.449376, 1, 0, 0, 1, 1,
0.9211199, 0.254406, 0.4229761, 1, 0, 0, 1, 1,
0.9218073, -1.042619, 3.295278, 1, 0, 0, 1, 1,
0.9237158, 0.3617359, 1.120956, 1, 0, 0, 1, 1,
0.9237689, 0.248031, 2.819073, 1, 0, 0, 1, 1,
0.9268349, -0.02594993, 2.569685, 0, 0, 0, 1, 1,
0.9292998, 0.9291207, 0.1670057, 0, 0, 0, 1, 1,
0.930411, 0.12109, -0.33575, 0, 0, 0, 1, 1,
0.9328256, 0.4766308, 1.644249, 0, 0, 0, 1, 1,
0.9385895, 1.726078, 1.42294, 0, 0, 0, 1, 1,
0.9428911, -0.5302106, 0.7659572, 0, 0, 0, 1, 1,
0.9431731, -1.406893, 3.683456, 0, 0, 0, 1, 1,
0.9471565, 0.5336103, 0.8271402, 1, 1, 1, 1, 1,
0.9487797, -1.228434, 2.30388, 1, 1, 1, 1, 1,
0.9670188, -0.06822007, -0.2064775, 1, 1, 1, 1, 1,
0.9700512, 0.816142, 0.1190761, 1, 1, 1, 1, 1,
0.9713867, 0.6610187, -0.5271758, 1, 1, 1, 1, 1,
0.9786814, 0.2454035, -0.3123703, 1, 1, 1, 1, 1,
0.9845661, -0.598433, 2.65655, 1, 1, 1, 1, 1,
0.9897591, 1.19459, 2.303691, 1, 1, 1, 1, 1,
0.9946955, 0.7399384, 0.1004416, 1, 1, 1, 1, 1,
0.9963833, 0.5555128, 0.1553083, 1, 1, 1, 1, 1,
0.9966246, 1.179427, 0.9714876, 1, 1, 1, 1, 1,
0.9980562, 1.226644, 0.1605013, 1, 1, 1, 1, 1,
1.004679, 2.751898, 0.7164199, 1, 1, 1, 1, 1,
1.010052, -0.457444, 2.331699, 1, 1, 1, 1, 1,
1.01617, 0.3758321, 0.9849925, 1, 1, 1, 1, 1,
1.020365, -0.320835, 3.688318, 0, 0, 1, 1, 1,
1.022925, -0.6548984, 4.018239, 1, 0, 0, 1, 1,
1.023697, -1.016914, 2.578569, 1, 0, 0, 1, 1,
1.034816, 1.846862, 0.2636212, 1, 0, 0, 1, 1,
1.038824, -1.027286, 3.569594, 1, 0, 0, 1, 1,
1.040031, 1.476243, 2.231244, 1, 0, 0, 1, 1,
1.042366, -0.9552454, 2.071454, 0, 0, 0, 1, 1,
1.054685, -0.9710408, 4.400957, 0, 0, 0, 1, 1,
1.065059, 0.976066, 1.45727, 0, 0, 0, 1, 1,
1.07243, -0.5824696, 2.292851, 0, 0, 0, 1, 1,
1.076714, 0.3558659, 3.499252, 0, 0, 0, 1, 1,
1.084187, 0.7172193, 1.451397, 0, 0, 0, 1, 1,
1.088159, -0.2415601, 3.556343, 0, 0, 0, 1, 1,
1.089467, 0.3482684, 1.198763, 1, 1, 1, 1, 1,
1.091658, -0.1350508, 2.259409, 1, 1, 1, 1, 1,
1.098668, -1.470614, 2.436651, 1, 1, 1, 1, 1,
1.102142, 0.1576297, 1.952549, 1, 1, 1, 1, 1,
1.106871, -0.8235828, 2.038323, 1, 1, 1, 1, 1,
1.107435, -0.4048338, 1.236386, 1, 1, 1, 1, 1,
1.116779, -0.308962, 3.251342, 1, 1, 1, 1, 1,
1.128938, 0.8114312, 0.9413751, 1, 1, 1, 1, 1,
1.134467, -0.5621229, 2.630218, 1, 1, 1, 1, 1,
1.135605, 1.400537, 0.4703481, 1, 1, 1, 1, 1,
1.142154, 0.8263594, 1.937499, 1, 1, 1, 1, 1,
1.154885, 0.3852312, 3.248851, 1, 1, 1, 1, 1,
1.159312, -0.3903663, 2.0615, 1, 1, 1, 1, 1,
1.160601, -0.3235067, 1.85765, 1, 1, 1, 1, 1,
1.166283, -0.5777603, 2.520986, 1, 1, 1, 1, 1,
1.166624, 0.2868009, 2.264505, 0, 0, 1, 1, 1,
1.167833, 1.325922, 1.235828, 1, 0, 0, 1, 1,
1.170094, -0.8758283, 2.703825, 1, 0, 0, 1, 1,
1.178105, -0.4680547, 0.3014371, 1, 0, 0, 1, 1,
1.19603, -0.5333499, 0.8322769, 1, 0, 0, 1, 1,
1.196341, 2.123933, -1.131497, 1, 0, 0, 1, 1,
1.196974, -0.6372574, 1.147664, 0, 0, 0, 1, 1,
1.208342, -1.664053, 3.639132, 0, 0, 0, 1, 1,
1.216778, -1.882832, 3.594323, 0, 0, 0, 1, 1,
1.224958, 0.6190291, 0.8160251, 0, 0, 0, 1, 1,
1.225242, 0.5642813, 1.206222, 0, 0, 0, 1, 1,
1.229162, -0.912815, 3.734132, 0, 0, 0, 1, 1,
1.231562, -1.491076, 2.078855, 0, 0, 0, 1, 1,
1.232902, 0.2099327, 1.377444, 1, 1, 1, 1, 1,
1.239256, 1.00843, 0.9436159, 1, 1, 1, 1, 1,
1.244944, -1.456818, 3.951325, 1, 1, 1, 1, 1,
1.255033, 0.4324864, 0.2963927, 1, 1, 1, 1, 1,
1.2599, -1.631949, 2.836474, 1, 1, 1, 1, 1,
1.262928, 0.766504, 1.046728, 1, 1, 1, 1, 1,
1.263452, 1.120815, 1.090315, 1, 1, 1, 1, 1,
1.270069, -0.03640565, 3.696896, 1, 1, 1, 1, 1,
1.275167, 1.872619, -2.812024, 1, 1, 1, 1, 1,
1.276299, 0.6812162, 1.711521, 1, 1, 1, 1, 1,
1.276475, 0.1927068, 2.961805, 1, 1, 1, 1, 1,
1.276834, -0.7647454, 3.029875, 1, 1, 1, 1, 1,
1.278839, 0.2954612, 1.44269, 1, 1, 1, 1, 1,
1.282979, 0.2541266, 3.865768, 1, 1, 1, 1, 1,
1.283879, 0.8172272, 0.7478321, 1, 1, 1, 1, 1,
1.286078, -0.5144329, 2.082085, 0, 0, 1, 1, 1,
1.286492, -0.1580075, 2.578799, 1, 0, 0, 1, 1,
1.293198, 1.245695, 0.2952679, 1, 0, 0, 1, 1,
1.295025, -2.068805, 1.671642, 1, 0, 0, 1, 1,
1.299341, 0.7602886, 1.993693, 1, 0, 0, 1, 1,
1.311504, -1.560032, 0.5367923, 1, 0, 0, 1, 1,
1.312862, -0.07657421, 0.5027801, 0, 0, 0, 1, 1,
1.314477, 2.137128, -0.05735971, 0, 0, 0, 1, 1,
1.318851, 0.03898612, -0.3824266, 0, 0, 0, 1, 1,
1.322458, 0.002850581, 3.235861, 0, 0, 0, 1, 1,
1.322973, 1.11421, 1.952298, 0, 0, 0, 1, 1,
1.346676, -1.250405, 2.578799, 0, 0, 0, 1, 1,
1.360499, 1.181239, 2.331598, 0, 0, 0, 1, 1,
1.363436, 0.9365542, -0.6519663, 1, 1, 1, 1, 1,
1.365298, 0.8815931, 1.549481, 1, 1, 1, 1, 1,
1.365382, -0.3163095, 2.201799, 1, 1, 1, 1, 1,
1.386375, 0.1897423, 1.657449, 1, 1, 1, 1, 1,
1.389307, -0.8054472, 1.463251, 1, 1, 1, 1, 1,
1.392832, -0.3802455, 2.264741, 1, 1, 1, 1, 1,
1.402609, 0.8721622, 0.156877, 1, 1, 1, 1, 1,
1.406411, 0.6054478, 1.140685, 1, 1, 1, 1, 1,
1.417392, 1.050609, -0.4612966, 1, 1, 1, 1, 1,
1.419594, 0.2618884, 3.622744, 1, 1, 1, 1, 1,
1.42263, -0.1860165, -0.06473548, 1, 1, 1, 1, 1,
1.44218, 0.1135636, 2.355503, 1, 1, 1, 1, 1,
1.44339, 1.118847, 1.793191, 1, 1, 1, 1, 1,
1.459854, -0.2604584, 0.9827403, 1, 1, 1, 1, 1,
1.475214, -0.2288572, 0.6097628, 1, 1, 1, 1, 1,
1.477447, 0.7296256, 2.75762, 0, 0, 1, 1, 1,
1.480401, -1.387321, 2.639122, 1, 0, 0, 1, 1,
1.482699, -0.344234, 0.9609783, 1, 0, 0, 1, 1,
1.487468, -1.017106, 2.18414, 1, 0, 0, 1, 1,
1.504509, 0.4768078, 0.2278614, 1, 0, 0, 1, 1,
1.505885, 0.9655032, 1.203732, 1, 0, 0, 1, 1,
1.511731, -1.39851, 1.68896, 0, 0, 0, 1, 1,
1.516949, 0.3794692, -0.1503988, 0, 0, 0, 1, 1,
1.519671, 1.865504, 0.5627486, 0, 0, 0, 1, 1,
1.52112, 1.019042, 2.158846, 0, 0, 0, 1, 1,
1.521351, 0.5876304, 1.73432, 0, 0, 0, 1, 1,
1.52162, 0.1808818, 1.304065, 0, 0, 0, 1, 1,
1.530739, -0.7195138, 2.180918, 0, 0, 0, 1, 1,
1.534312, 1.229162, 0.6362232, 1, 1, 1, 1, 1,
1.539717, 1.332293, -0.8526258, 1, 1, 1, 1, 1,
1.548916, -0.7548816, 1.144917, 1, 1, 1, 1, 1,
1.550454, 0.9029102, -1.732641, 1, 1, 1, 1, 1,
1.555718, 1.709655, -0.07003035, 1, 1, 1, 1, 1,
1.555805, -0.6718034, 1.73228, 1, 1, 1, 1, 1,
1.56936, -0.4292149, 0.600362, 1, 1, 1, 1, 1,
1.574707, -0.159186, 0.3283975, 1, 1, 1, 1, 1,
1.575767, -0.8151716, 1.527176, 1, 1, 1, 1, 1,
1.584292, -1.299085, 2.083905, 1, 1, 1, 1, 1,
1.589752, -0.1985485, 2.795391, 1, 1, 1, 1, 1,
1.597061, 0.2151834, 1.383276, 1, 1, 1, 1, 1,
1.597975, 1.46812, 3.101641, 1, 1, 1, 1, 1,
1.610362, -0.3320274, 2.486296, 1, 1, 1, 1, 1,
1.636528, 0.4523036, 0.6935284, 1, 1, 1, 1, 1,
1.65379, 0.3623576, 2.494584, 0, 0, 1, 1, 1,
1.665807, -1.258069, 3.030899, 1, 0, 0, 1, 1,
1.677899, 1.769017, 0.5227032, 1, 0, 0, 1, 1,
1.716868, 0.9600559, 2.04228, 1, 0, 0, 1, 1,
1.723855, -0.9896848, 2.542035, 1, 0, 0, 1, 1,
1.734853, -0.9577422, 1.327327, 1, 0, 0, 1, 1,
1.743858, -0.6901625, 1.331538, 0, 0, 0, 1, 1,
1.755569, -0.4725749, 1.279247, 0, 0, 0, 1, 1,
1.756248, -1.097982, 2.559791, 0, 0, 0, 1, 1,
1.763166, 0.6244304, 0.5064799, 0, 0, 0, 1, 1,
1.767701, 0.2860875, 2.156895, 0, 0, 0, 1, 1,
1.768981, -0.6040866, 3.822084, 0, 0, 0, 1, 1,
1.781735, -0.6756693, -0.0161092, 0, 0, 0, 1, 1,
1.825063, -0.5720171, 0.04796442, 1, 1, 1, 1, 1,
1.849565, -0.7190701, 0.4556549, 1, 1, 1, 1, 1,
1.866465, 0.1251995, 0.4331154, 1, 1, 1, 1, 1,
1.870282, 1.385849, 1.224839, 1, 1, 1, 1, 1,
1.877794, -0.6457993, 2.487206, 1, 1, 1, 1, 1,
1.883578, -0.3355341, 0.8246323, 1, 1, 1, 1, 1,
1.891496, -0.3728338, 1.684922, 1, 1, 1, 1, 1,
1.899347, 0.6653996, -0.1164216, 1, 1, 1, 1, 1,
1.901363, 0.1758345, 3.133899, 1, 1, 1, 1, 1,
1.917696, -1.778896, 1.765914, 1, 1, 1, 1, 1,
1.926549, -0.1163423, 0.7852286, 1, 1, 1, 1, 1,
1.929991, -1.511133, 1.46855, 1, 1, 1, 1, 1,
1.937187, -1.618859, 0.6296303, 1, 1, 1, 1, 1,
1.97278, 1.398622, 0.2947362, 1, 1, 1, 1, 1,
1.973061, 0.8773859, 1.334209, 1, 1, 1, 1, 1,
1.998395, 1.202436, -0.7197769, 0, 0, 1, 1, 1,
1.99887, 0.7918053, -0.940891, 1, 0, 0, 1, 1,
2.004989, -3.108696, 3.899573, 1, 0, 0, 1, 1,
2.076365, -0.1666419, 3.851462, 1, 0, 0, 1, 1,
2.083569, -2.096374, 1.218914, 1, 0, 0, 1, 1,
2.107906, 2.036925, 1.318616, 1, 0, 0, 1, 1,
2.134054, 0.3420113, 1.330703, 0, 0, 0, 1, 1,
2.139362, -0.6447125, 1.870226, 0, 0, 0, 1, 1,
2.157675, -0.9635903, 0.9591719, 0, 0, 0, 1, 1,
2.186402, 1.270225, -0.4389499, 0, 0, 0, 1, 1,
2.221222, -1.215313, 2.373592, 0, 0, 0, 1, 1,
2.260987, -0.6885622, 3.562228, 0, 0, 0, 1, 1,
2.278946, 0.3786421, 0.2530928, 0, 0, 0, 1, 1,
2.337005, 0.9474767, 0.943249, 1, 1, 1, 1, 1,
2.410172, 0.03911266, 0.3186954, 1, 1, 1, 1, 1,
2.500066, 2.463319, 2.310235, 1, 1, 1, 1, 1,
2.510021, -1.071186, 3.426682, 1, 1, 1, 1, 1,
3.165943, -0.1255103, 2.10943, 1, 1, 1, 1, 1,
3.343763, -1.282282, 0.2621002, 1, 1, 1, 1, 1,
3.438396, -0.4698015, 0.7472632, 1, 1, 1, 1, 1
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
var radius = 9.917445;
var distance = 34.8346;
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
mvMatrix.translate( 0.001904964, 0.1173176, 0.4534428 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8346);
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
