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
-3.105123, -1.013966, -2.770513, 1, 0, 0, 1,
-3.032079, 0.6152406, -2.201479, 1, 0.007843138, 0, 1,
-2.750867, -0.4333448, 0.1353538, 1, 0.01176471, 0, 1,
-2.748416, -0.4231988, -1.789061, 1, 0.01960784, 0, 1,
-2.624613, -0.5660048, -1.577062, 1, 0.02352941, 0, 1,
-2.606129, -0.0227482, -1.842182, 1, 0.03137255, 0, 1,
-2.525653, 0.8315049, 0.6064672, 1, 0.03529412, 0, 1,
-2.395407, -0.06302483, -2.021882, 1, 0.04313726, 0, 1,
-2.37854, -0.2923427, -1.992301, 1, 0.04705882, 0, 1,
-2.344287, 0.5855978, -2.270487, 1, 0.05490196, 0, 1,
-2.316953, -0.4142016, -2.368409, 1, 0.05882353, 0, 1,
-2.308698, -0.445306, -2.119073, 1, 0.06666667, 0, 1,
-2.185409, 1.478128, -0.7227697, 1, 0.07058824, 0, 1,
-2.176487, 0.06551897, -0.7913294, 1, 0.07843138, 0, 1,
-2.139206, 0.6344012, -2.461377, 1, 0.08235294, 0, 1,
-2.125366, 0.5955511, -0.9644554, 1, 0.09019608, 0, 1,
-2.117646, -1.420357, -2.589025, 1, 0.09411765, 0, 1,
-2.065231, -0.03020338, -2.73828, 1, 0.1019608, 0, 1,
-2.055106, 0.4011128, -2.51473, 1, 0.1098039, 0, 1,
-2.014209, 1.808858, 0.06296994, 1, 0.1137255, 0, 1,
-2.013837, 0.471033, -1.078176, 1, 0.1215686, 0, 1,
-2.013265, 1.574231, -1.880277, 1, 0.1254902, 0, 1,
-2.011524, -0.1946779, -0.9638433, 1, 0.1333333, 0, 1,
-2.002793, 0.7312341, -0.9281517, 1, 0.1372549, 0, 1,
-1.938494, 0.4493366, -1.833665, 1, 0.145098, 0, 1,
-1.928439, 0.9544243, -2.546273, 1, 0.1490196, 0, 1,
-1.926179, -0.8919998, -0.8512731, 1, 0.1568628, 0, 1,
-1.914869, 0.5110089, -1.442557, 1, 0.1607843, 0, 1,
-1.909316, -1.269189, -3.57965, 1, 0.1686275, 0, 1,
-1.898471, 1.47701, 0.919998, 1, 0.172549, 0, 1,
-1.872914, -0.4417048, -1.977145, 1, 0.1803922, 0, 1,
-1.858992, -0.4977524, -2.825938, 1, 0.1843137, 0, 1,
-1.857641, 0.2187448, -2.45031, 1, 0.1921569, 0, 1,
-1.847626, -0.7346387, -2.295395, 1, 0.1960784, 0, 1,
-1.830874, 0.4772952, -1.054358, 1, 0.2039216, 0, 1,
-1.817715, 0.8042315, -3.721995, 1, 0.2117647, 0, 1,
-1.790255, 1.129286, -0.558754, 1, 0.2156863, 0, 1,
-1.781344, -0.1315069, -0.9776731, 1, 0.2235294, 0, 1,
-1.767728, -0.0366955, -1.513638, 1, 0.227451, 0, 1,
-1.762943, -1.707936, -2.387233, 1, 0.2352941, 0, 1,
-1.723573, -1.080776, -2.468798, 1, 0.2392157, 0, 1,
-1.720186, 0.2846365, -1.589047, 1, 0.2470588, 0, 1,
-1.712392, -0.9584047, -2.310585, 1, 0.2509804, 0, 1,
-1.703336, 0.9764012, -2.282348, 1, 0.2588235, 0, 1,
-1.694966, -1.879596, -1.660023, 1, 0.2627451, 0, 1,
-1.684069, -0.5947245, -1.651618, 1, 0.2705882, 0, 1,
-1.645854, 2.102832, -1.211957, 1, 0.2745098, 0, 1,
-1.633759, 1.322245, -2.554079, 1, 0.282353, 0, 1,
-1.63369, -0.008370376, -1.683561, 1, 0.2862745, 0, 1,
-1.629829, -1.329235, -2.7128, 1, 0.2941177, 0, 1,
-1.627614, 1.032886, -3.198446, 1, 0.3019608, 0, 1,
-1.591682, 0.124505, -0.0173216, 1, 0.3058824, 0, 1,
-1.583414, 0.9492193, -2.384822, 1, 0.3137255, 0, 1,
-1.573595, -0.9131331, -1.188645, 1, 0.3176471, 0, 1,
-1.565364, -1.086282, -1.635581, 1, 0.3254902, 0, 1,
-1.560521, 0.7158799, -1.074679, 1, 0.3294118, 0, 1,
-1.548708, 1.3761, -0.1750139, 1, 0.3372549, 0, 1,
-1.544736, -1.033408, -1.244693, 1, 0.3411765, 0, 1,
-1.540325, -0.2922427, -1.990596, 1, 0.3490196, 0, 1,
-1.54019, -1.691263, -2.929578, 1, 0.3529412, 0, 1,
-1.537537, 1.563802, -1.727296, 1, 0.3607843, 0, 1,
-1.533028, -0.7633203, -0.1839104, 1, 0.3647059, 0, 1,
-1.528992, 0.613368, -1.989631, 1, 0.372549, 0, 1,
-1.524666, -1.670656, -3.655015, 1, 0.3764706, 0, 1,
-1.521104, 0.5925618, 0.2816729, 1, 0.3843137, 0, 1,
-1.500678, 1.102448, -2.213513, 1, 0.3882353, 0, 1,
-1.481405, 1.883006, -1.51132, 1, 0.3960784, 0, 1,
-1.480917, -1.174727, -1.94167, 1, 0.4039216, 0, 1,
-1.480077, -1.460868, -2.73679, 1, 0.4078431, 0, 1,
-1.464145, 0.5770987, -3.273702, 1, 0.4156863, 0, 1,
-1.458793, -0.08261291, -0.2188197, 1, 0.4196078, 0, 1,
-1.457307, -0.2520016, -2.81476, 1, 0.427451, 0, 1,
-1.452023, 0.9007727, -0.7625208, 1, 0.4313726, 0, 1,
-1.450089, 0.1451275, -1.29472, 1, 0.4392157, 0, 1,
-1.448836, -0.005168673, -2.883311, 1, 0.4431373, 0, 1,
-1.448822, 2.386609, 1.215328, 1, 0.4509804, 0, 1,
-1.440903, 0.02473441, -0.3853459, 1, 0.454902, 0, 1,
-1.438762, 0.5731132, -1.30719, 1, 0.4627451, 0, 1,
-1.426072, 0.6102266, -2.544789, 1, 0.4666667, 0, 1,
-1.41596, 0.4111914, -2.196927, 1, 0.4745098, 0, 1,
-1.414578, -1.081288, -2.314617, 1, 0.4784314, 0, 1,
-1.410882, 0.8311541, -0.7685874, 1, 0.4862745, 0, 1,
-1.400294, 1.648642, -2.231705, 1, 0.4901961, 0, 1,
-1.398238, 0.4008971, -0.8907822, 1, 0.4980392, 0, 1,
-1.383629, 1.228654, -0.3544075, 1, 0.5058824, 0, 1,
-1.373254, 1.105867, -2.428933, 1, 0.509804, 0, 1,
-1.372488, 0.001050115, -0.65181, 1, 0.5176471, 0, 1,
-1.369516, 0.03233065, -2.37454, 1, 0.5215687, 0, 1,
-1.358285, -0.7118152, -2.72456, 1, 0.5294118, 0, 1,
-1.353246, -1.268899, -2.310587, 1, 0.5333334, 0, 1,
-1.352499, -0.286968, -2.881088, 1, 0.5411765, 0, 1,
-1.345401, -1.06108, -2.998422, 1, 0.5450981, 0, 1,
-1.344753, -0.01202528, 0.2855054, 1, 0.5529412, 0, 1,
-1.339381, 3.067963, 0.2477031, 1, 0.5568628, 0, 1,
-1.336402, -0.522902, -0.3118834, 1, 0.5647059, 0, 1,
-1.33504, -0.1408468, -2.413618, 1, 0.5686275, 0, 1,
-1.33502, 2.204371, -1.257934, 1, 0.5764706, 0, 1,
-1.329915, -0.3135424, -1.9363, 1, 0.5803922, 0, 1,
-1.327135, -0.6037928, -1.641451, 1, 0.5882353, 0, 1,
-1.311744, -1.66758, -2.955263, 1, 0.5921569, 0, 1,
-1.303649, -0.1745238, -3.182901, 1, 0.6, 0, 1,
-1.295861, -0.3132689, -1.123875, 1, 0.6078432, 0, 1,
-1.295166, -2.3086, -3.156042, 1, 0.6117647, 0, 1,
-1.280739, -1.408396, -0.8367629, 1, 0.6196079, 0, 1,
-1.269775, -1.406528, -1.057115, 1, 0.6235294, 0, 1,
-1.268919, 0.8925635, -0.826942, 1, 0.6313726, 0, 1,
-1.26526, 2.1097, -0.1146262, 1, 0.6352941, 0, 1,
-1.255974, 0.950087, -2.478873, 1, 0.6431373, 0, 1,
-1.247298, 0.821784, -0.9505902, 1, 0.6470588, 0, 1,
-1.246705, 1.942689, -2.525467, 1, 0.654902, 0, 1,
-1.241976, 0.2419811, -2.35322, 1, 0.6588235, 0, 1,
-1.239071, 0.9017267, 0.02499156, 1, 0.6666667, 0, 1,
-1.223976, -0.6363403, -1.526943, 1, 0.6705883, 0, 1,
-1.22234, -0.8390123, -3.053961, 1, 0.6784314, 0, 1,
-1.219292, 0.5835588, -1.383681, 1, 0.682353, 0, 1,
-1.217227, 1.80332, -2.296452, 1, 0.6901961, 0, 1,
-1.21642, -0.02545954, -2.829332, 1, 0.6941177, 0, 1,
-1.216014, -0.923733, -2.082928, 1, 0.7019608, 0, 1,
-1.19905, 1.066147, -0.5434877, 1, 0.7098039, 0, 1,
-1.197666, 0.5272462, -1.679727, 1, 0.7137255, 0, 1,
-1.19419, -0.2343913, -3.095474, 1, 0.7215686, 0, 1,
-1.188046, 0.5147066, 1.42579, 1, 0.7254902, 0, 1,
-1.185545, 0.06795519, 0.5766215, 1, 0.7333333, 0, 1,
-1.178594, -0.7255964, -1.930161, 1, 0.7372549, 0, 1,
-1.168309, 0.1438816, -0.4583283, 1, 0.7450981, 0, 1,
-1.166808, 1.05896, -0.1374902, 1, 0.7490196, 0, 1,
-1.162598, 0.4834295, 0.7622526, 1, 0.7568628, 0, 1,
-1.159745, 2.088406, -1.236019, 1, 0.7607843, 0, 1,
-1.149807, 0.01310792, -2.957866, 1, 0.7686275, 0, 1,
-1.144603, 0.2725211, -0.7558482, 1, 0.772549, 0, 1,
-1.13991, 1.139464, -0.6566402, 1, 0.7803922, 0, 1,
-1.139036, -0.6320885, -1.552987, 1, 0.7843137, 0, 1,
-1.130608, -1.334361, -1.938424, 1, 0.7921569, 0, 1,
-1.128072, 0.03958014, -0.9090663, 1, 0.7960784, 0, 1,
-1.123684, 0.1715539, -1.021494, 1, 0.8039216, 0, 1,
-1.123566, 0.5642219, -1.912682, 1, 0.8117647, 0, 1,
-1.121944, 1.009469, -0.4937831, 1, 0.8156863, 0, 1,
-1.120854, -1.016182, -1.775395, 1, 0.8235294, 0, 1,
-1.11938, -0.5799584, -2.039984, 1, 0.827451, 0, 1,
-1.105059, 0.206949, -1.353489, 1, 0.8352941, 0, 1,
-1.095003, 0.332567, -2.711943, 1, 0.8392157, 0, 1,
-1.080698, 0.01725532, -0.2246529, 1, 0.8470588, 0, 1,
-1.058706, -0.07034415, -2.657828, 1, 0.8509804, 0, 1,
-1.048694, -2.677944, -2.903894, 1, 0.8588235, 0, 1,
-1.041641, -2.89553, -2.586918, 1, 0.8627451, 0, 1,
-1.026527, -1.402409, -2.533837, 1, 0.8705882, 0, 1,
-1.024472, 1.40575, -1.29892, 1, 0.8745098, 0, 1,
-1.020827, -0.1419909, -0.9606855, 1, 0.8823529, 0, 1,
-1.011299, 0.2010314, 0.1525977, 1, 0.8862745, 0, 1,
-1.007534, 0.2208363, -1.28099, 1, 0.8941177, 0, 1,
-1.007293, 1.368043, -1.348376, 1, 0.8980392, 0, 1,
-1.006131, 0.9949531, -0.6705055, 1, 0.9058824, 0, 1,
-0.9956765, -0.9853494, -2.032689, 1, 0.9137255, 0, 1,
-0.9892998, -0.3363843, -0.504748, 1, 0.9176471, 0, 1,
-0.983316, 0.8995841, -0.3658928, 1, 0.9254902, 0, 1,
-0.977853, -0.5517197, -2.259068, 1, 0.9294118, 0, 1,
-0.9736618, 1.848769, -0.899801, 1, 0.9372549, 0, 1,
-0.968185, -0.5479397, 0.400987, 1, 0.9411765, 0, 1,
-0.9628027, 0.4450844, -3.245896, 1, 0.9490196, 0, 1,
-0.9574644, -0.266153, -3.727059, 1, 0.9529412, 0, 1,
-0.9474709, 0.2643588, -1.364086, 1, 0.9607843, 0, 1,
-0.9437572, -0.4563379, -1.76133, 1, 0.9647059, 0, 1,
-0.9390552, 0.7107295, -2.907889, 1, 0.972549, 0, 1,
-0.9380719, -2.609866, -2.464501, 1, 0.9764706, 0, 1,
-0.9363166, 2.365028, -1.142106, 1, 0.9843137, 0, 1,
-0.9294563, 0.4033312, -2.873343, 1, 0.9882353, 0, 1,
-0.9292622, 0.5235777, 0.04218285, 1, 0.9960784, 0, 1,
-0.9230599, -1.288538, -1.735755, 0.9960784, 1, 0, 1,
-0.913873, -0.2249251, -1.186769, 0.9921569, 1, 0, 1,
-0.9119424, 0.4899677, 0.4961239, 0.9843137, 1, 0, 1,
-0.9109272, -0.481767, -2.387153, 0.9803922, 1, 0, 1,
-0.9095006, -0.5421704, -2.043498, 0.972549, 1, 0, 1,
-0.9086636, -0.1764336, -3.289733, 0.9686275, 1, 0, 1,
-0.9073451, -0.02290295, -1.643565, 0.9607843, 1, 0, 1,
-0.9049043, -0.8122672, -2.494356, 0.9568627, 1, 0, 1,
-0.8977473, -1.560602, -3.147337, 0.9490196, 1, 0, 1,
-0.8973529, -1.00964, -2.161366, 0.945098, 1, 0, 1,
-0.8955909, -0.05763229, -1.556601, 0.9372549, 1, 0, 1,
-0.8946959, 0.3126621, -0.4120189, 0.9333333, 1, 0, 1,
-0.888092, 1.147208, -1.585565, 0.9254902, 1, 0, 1,
-0.8807746, -1.994089, -4.003628, 0.9215686, 1, 0, 1,
-0.8787702, 1.860706, -0.2928085, 0.9137255, 1, 0, 1,
-0.8784829, 0.5669414, -1.357953, 0.9098039, 1, 0, 1,
-0.8719647, 0.2813281, -0.6465713, 0.9019608, 1, 0, 1,
-0.8710141, 1.500904, 0.6751061, 0.8941177, 1, 0, 1,
-0.8668534, 1.920337, -0.1928609, 0.8901961, 1, 0, 1,
-0.8649188, 0.932384, -1.143382, 0.8823529, 1, 0, 1,
-0.8582321, 0.4302403, -1.159332, 0.8784314, 1, 0, 1,
-0.8561358, 0.9342773, -1.261905, 0.8705882, 1, 0, 1,
-0.8502485, 0.5218212, -1.584638, 0.8666667, 1, 0, 1,
-0.8494235, 0.5050818, -2.033541, 0.8588235, 1, 0, 1,
-0.8465065, -0.8286869, -0.7933803, 0.854902, 1, 0, 1,
-0.840044, -0.4175014, -1.303821, 0.8470588, 1, 0, 1,
-0.8379883, -0.2531108, -2.217804, 0.8431373, 1, 0, 1,
-0.8325257, 0.4509105, -1.940161, 0.8352941, 1, 0, 1,
-0.8322165, -0.2061558, -0.8267837, 0.8313726, 1, 0, 1,
-0.8302993, 2.100785, -0.5985117, 0.8235294, 1, 0, 1,
-0.8271295, 1.038193, -1.565569, 0.8196079, 1, 0, 1,
-0.8231611, 1.336154, 0.3508412, 0.8117647, 1, 0, 1,
-0.8212237, -1.123953, -3.797908, 0.8078431, 1, 0, 1,
-0.8201128, -0.005940844, -1.149262, 0.8, 1, 0, 1,
-0.812803, 1.087433, -1.509679, 0.7921569, 1, 0, 1,
-0.811915, -0.3458482, -3.556077, 0.7882353, 1, 0, 1,
-0.8104601, 1.693457, 0.9431559, 0.7803922, 1, 0, 1,
-0.809693, 0.1147135, -2.356947, 0.7764706, 1, 0, 1,
-0.8093974, 0.1098461, -1.17602, 0.7686275, 1, 0, 1,
-0.8089787, -1.918108, -1.303363, 0.7647059, 1, 0, 1,
-0.8066766, -0.1827203, -1.273321, 0.7568628, 1, 0, 1,
-0.7988126, 0.1351776, -1.823412, 0.7529412, 1, 0, 1,
-0.7952377, -1.207212, -1.183199, 0.7450981, 1, 0, 1,
-0.792607, -0.225106, -2.736917, 0.7411765, 1, 0, 1,
-0.7862734, -0.2373447, -0.8512513, 0.7333333, 1, 0, 1,
-0.7840933, 0.2163173, -0.5218251, 0.7294118, 1, 0, 1,
-0.7778112, 0.4523582, -0.01090745, 0.7215686, 1, 0, 1,
-0.7758855, 1.357862, 0.73333, 0.7176471, 1, 0, 1,
-0.7713633, 0.2278738, -1.731992, 0.7098039, 1, 0, 1,
-0.7700741, -0.3301378, -0.7825192, 0.7058824, 1, 0, 1,
-0.7616092, 0.3759302, -1.414069, 0.6980392, 1, 0, 1,
-0.7481737, 0.4223146, -1.538023, 0.6901961, 1, 0, 1,
-0.743172, -0.6683021, -2.505498, 0.6862745, 1, 0, 1,
-0.7422739, -1.258672, -3.862898, 0.6784314, 1, 0, 1,
-0.7404702, -0.2604991, -0.5668405, 0.6745098, 1, 0, 1,
-0.7389175, 0.08577847, -1.510239, 0.6666667, 1, 0, 1,
-0.7289067, 1.308319, 0.4973259, 0.6627451, 1, 0, 1,
-0.7285993, -0.01565239, -1.792358, 0.654902, 1, 0, 1,
-0.7096211, -0.5535288, -4.261203, 0.6509804, 1, 0, 1,
-0.7072067, -0.4474716, -0.7340404, 0.6431373, 1, 0, 1,
-0.7064243, -1.760002, -2.926393, 0.6392157, 1, 0, 1,
-0.7047244, 0.3619492, -0.1921618, 0.6313726, 1, 0, 1,
-0.7045379, -1.213021, -4.01506, 0.627451, 1, 0, 1,
-0.7039298, -0.3875965, -1.631459, 0.6196079, 1, 0, 1,
-0.7037463, -1.020111, -2.609967, 0.6156863, 1, 0, 1,
-0.7021086, 0.131124, -2.506211, 0.6078432, 1, 0, 1,
-0.6998196, -1.269934, -3.53098, 0.6039216, 1, 0, 1,
-0.6948495, -1.285066, -3.971165, 0.5960785, 1, 0, 1,
-0.6906368, 0.7278984, -1.108481, 0.5882353, 1, 0, 1,
-0.6798693, -0.4986566, -1.615906, 0.5843138, 1, 0, 1,
-0.6756935, 1.43246, -0.9853564, 0.5764706, 1, 0, 1,
-0.6735851, -1.797451, -2.767759, 0.572549, 1, 0, 1,
-0.6662842, -0.1227288, -1.850404, 0.5647059, 1, 0, 1,
-0.665014, 0.7240863, 1.559831, 0.5607843, 1, 0, 1,
-0.6543481, -1.00457, -2.323921, 0.5529412, 1, 0, 1,
-0.6494288, 1.368555, -1.15258, 0.5490196, 1, 0, 1,
-0.6491197, 0.07723358, -3.494503, 0.5411765, 1, 0, 1,
-0.6477847, 0.2362002, -1.134182, 0.5372549, 1, 0, 1,
-0.6438061, -0.681967, -3.273211, 0.5294118, 1, 0, 1,
-0.6341284, 1.649953, 0.2752054, 0.5254902, 1, 0, 1,
-0.6302924, 1.259223, -1.759985, 0.5176471, 1, 0, 1,
-0.6277298, -0.9401141, -2.210664, 0.5137255, 1, 0, 1,
-0.6227652, 0.632809, 0.2382347, 0.5058824, 1, 0, 1,
-0.6177105, -0.5904813, -3.100732, 0.5019608, 1, 0, 1,
-0.6123612, -0.1751495, -0.4711854, 0.4941176, 1, 0, 1,
-0.6084152, 0.05722559, -1.045804, 0.4862745, 1, 0, 1,
-0.6066231, 0.2798407, -0.727754, 0.4823529, 1, 0, 1,
-0.6010838, 0.5735841, -1.381431, 0.4745098, 1, 0, 1,
-0.6004497, 0.9084053, -0.07157755, 0.4705882, 1, 0, 1,
-0.5987357, -0.6379656, -1.145008, 0.4627451, 1, 0, 1,
-0.5986402, 0.441905, -1.744486, 0.4588235, 1, 0, 1,
-0.5979626, 0.8866323, -0.007817789, 0.4509804, 1, 0, 1,
-0.5965707, -0.7820812, -1.886567, 0.4470588, 1, 0, 1,
-0.5949784, 0.3762681, -1.521113, 0.4392157, 1, 0, 1,
-0.5921952, -1.047207, -2.845447, 0.4352941, 1, 0, 1,
-0.5919225, 0.9825093, 1.079184, 0.427451, 1, 0, 1,
-0.5912355, 0.01437816, -0.5661273, 0.4235294, 1, 0, 1,
-0.5784893, -0.3335813, -2.297879, 0.4156863, 1, 0, 1,
-0.5783314, 0.6481331, 0.03496986, 0.4117647, 1, 0, 1,
-0.5681303, -0.1612587, -0.3596236, 0.4039216, 1, 0, 1,
-0.5648046, 0.3804561, 0.4681027, 0.3960784, 1, 0, 1,
-0.5638946, -0.5314518, -1.658933, 0.3921569, 1, 0, 1,
-0.5633145, 0.491897, -2.11621, 0.3843137, 1, 0, 1,
-0.5627226, 0.6841675, 0.2795906, 0.3803922, 1, 0, 1,
-0.5612751, 0.9345762, 0.4445967, 0.372549, 1, 0, 1,
-0.5595197, 1.184282, 0.1788945, 0.3686275, 1, 0, 1,
-0.557865, -1.013832, -3.239652, 0.3607843, 1, 0, 1,
-0.5550432, 0.3190198, -0.2821949, 0.3568628, 1, 0, 1,
-0.5545692, -1.912499, -4.350571, 0.3490196, 1, 0, 1,
-0.5537904, -0.07873178, -0.832298, 0.345098, 1, 0, 1,
-0.5509999, 0.3609288, -0.5358308, 0.3372549, 1, 0, 1,
-0.5505258, -1.405069, -2.138558, 0.3333333, 1, 0, 1,
-0.5466292, -0.2302279, -2.075035, 0.3254902, 1, 0, 1,
-0.5379646, 1.539627, -0.1868991, 0.3215686, 1, 0, 1,
-0.5372616, 0.32035, -0.9418211, 0.3137255, 1, 0, 1,
-0.5356195, 1.448734, -1.291571, 0.3098039, 1, 0, 1,
-0.5332137, 0.0872494, -2.276335, 0.3019608, 1, 0, 1,
-0.5329756, -0.1080717, 0.04927663, 0.2941177, 1, 0, 1,
-0.5318535, -0.9545514, -1.586384, 0.2901961, 1, 0, 1,
-0.5233288, 0.2183986, -1.548295, 0.282353, 1, 0, 1,
-0.5210603, -0.4204183, -2.732442, 0.2784314, 1, 0, 1,
-0.5177763, -0.4654242, -3.187698, 0.2705882, 1, 0, 1,
-0.5117898, 0.1927853, 0.5579531, 0.2666667, 1, 0, 1,
-0.5089072, -0.3932562, -2.512399, 0.2588235, 1, 0, 1,
-0.5084741, 0.0726143, -0.4075477, 0.254902, 1, 0, 1,
-0.5070916, -0.4326596, -1.826836, 0.2470588, 1, 0, 1,
-0.5065938, -0.02814914, -2.436396, 0.2431373, 1, 0, 1,
-0.5039418, 0.861316, -0.2638532, 0.2352941, 1, 0, 1,
-0.5026172, 1.211705, -0.1143712, 0.2313726, 1, 0, 1,
-0.4974663, -0.6402262, -1.798873, 0.2235294, 1, 0, 1,
-0.497375, 1.231821, -1.722659, 0.2196078, 1, 0, 1,
-0.4849963, -1.468389, -2.873152, 0.2117647, 1, 0, 1,
-0.4812032, -0.3871198, -2.026811, 0.2078431, 1, 0, 1,
-0.4804943, 0.8381565, -0.699457, 0.2, 1, 0, 1,
-0.4746111, 1.348373, 0.4304868, 0.1921569, 1, 0, 1,
-0.4695282, 0.4014062, -2.541984, 0.1882353, 1, 0, 1,
-0.4646621, 1.792723, 1.222553, 0.1803922, 1, 0, 1,
-0.4636128, 0.007176318, -0.3925048, 0.1764706, 1, 0, 1,
-0.4628309, -0.7006724, -3.239351, 0.1686275, 1, 0, 1,
-0.4622413, 1.39356, 0.2467058, 0.1647059, 1, 0, 1,
-0.4605044, 0.9664948, -1.184307, 0.1568628, 1, 0, 1,
-0.4571027, -0.4344987, -0.9567131, 0.1529412, 1, 0, 1,
-0.453061, 0.7608534, 0.2113483, 0.145098, 1, 0, 1,
-0.4530005, 0.05917402, -0.8427401, 0.1411765, 1, 0, 1,
-0.4513987, 0.6071905, -1.378863, 0.1333333, 1, 0, 1,
-0.4412045, 0.6947709, -2.24823, 0.1294118, 1, 0, 1,
-0.4388725, -0.1418588, -1.769023, 0.1215686, 1, 0, 1,
-0.4334201, -0.06841291, -2.73859, 0.1176471, 1, 0, 1,
-0.4276641, -0.5184449, -4.879108, 0.1098039, 1, 0, 1,
-0.4253314, -0.6909262, -1.861255, 0.1058824, 1, 0, 1,
-0.4251553, 0.1508061, -2.179279, 0.09803922, 1, 0, 1,
-0.4241502, -0.66085, -1.194476, 0.09019608, 1, 0, 1,
-0.4167515, -1.354942, -2.960835, 0.08627451, 1, 0, 1,
-0.4148095, 0.8986468, -0.8293847, 0.07843138, 1, 0, 1,
-0.4143383, -0.3956524, -2.94314, 0.07450981, 1, 0, 1,
-0.4102397, 0.1343266, -0.1073646, 0.06666667, 1, 0, 1,
-0.4086209, 0.7549418, -1.836721, 0.0627451, 1, 0, 1,
-0.408424, 0.9013099, -1.833229, 0.05490196, 1, 0, 1,
-0.4074753, -0.1521783, -1.707422, 0.05098039, 1, 0, 1,
-0.4037903, 0.2256668, -0.6559901, 0.04313726, 1, 0, 1,
-0.3948062, 0.01570142, -0.01379459, 0.03921569, 1, 0, 1,
-0.390835, 0.9983691, 2.274743, 0.03137255, 1, 0, 1,
-0.3879704, 0.8514431, -3.696873, 0.02745098, 1, 0, 1,
-0.3871416, -2.085769, -5.017127, 0.01960784, 1, 0, 1,
-0.387119, -0.9941006, -3.016458, 0.01568628, 1, 0, 1,
-0.3780006, -0.8904404, -2.006539, 0.007843138, 1, 0, 1,
-0.375706, -0.8714939, -3.130427, 0.003921569, 1, 0, 1,
-0.3755081, -1.274963, -2.479129, 0, 1, 0.003921569, 1,
-0.3751624, -1.08049, -2.413763, 0, 1, 0.01176471, 1,
-0.3714845, 1.459826, -1.642494, 0, 1, 0.01568628, 1,
-0.3712444, 0.2111283, -2.805956, 0, 1, 0.02352941, 1,
-0.3693135, 0.4524142, -1.488759, 0, 1, 0.02745098, 1,
-0.3684398, -1.185957, -2.027194, 0, 1, 0.03529412, 1,
-0.3663155, -1.427082, -4.700569, 0, 1, 0.03921569, 1,
-0.3641936, -0.9346352, -2.525084, 0, 1, 0.04705882, 1,
-0.3620142, 0.3828018, 1.033288, 0, 1, 0.05098039, 1,
-0.360507, -2.515982, -2.278025, 0, 1, 0.05882353, 1,
-0.3589194, -0.19575, -0.9438856, 0, 1, 0.0627451, 1,
-0.3536674, -2.450811, -1.893721, 0, 1, 0.07058824, 1,
-0.3527788, 0.1375371, -1.5089, 0, 1, 0.07450981, 1,
-0.3520009, -0.1067061, -1.140776, 0, 1, 0.08235294, 1,
-0.3488049, -1.314591, -1.342622, 0, 1, 0.08627451, 1,
-0.3479003, -0.5421839, -2.153694, 0, 1, 0.09411765, 1,
-0.3456461, 0.5182016, 0.7349409, 0, 1, 0.1019608, 1,
-0.3454593, -0.08591644, 0.08119465, 0, 1, 0.1058824, 1,
-0.3407995, 0.1046704, -0.1565002, 0, 1, 0.1137255, 1,
-0.3376653, -0.134706, -1.691917, 0, 1, 0.1176471, 1,
-0.3367871, -1.494108, -3.77995, 0, 1, 0.1254902, 1,
-0.3339531, -1.545793, -3.865932, 0, 1, 0.1294118, 1,
-0.3333907, -0.05106616, -0.5274736, 0, 1, 0.1372549, 1,
-0.3327505, -0.9085034, -2.299772, 0, 1, 0.1411765, 1,
-0.3312388, 1.214802, 1.407729, 0, 1, 0.1490196, 1,
-0.3293908, 1.611241, 0.1791147, 0, 1, 0.1529412, 1,
-0.3280084, 0.87813, -0.1798656, 0, 1, 0.1607843, 1,
-0.3249016, 0.6053384, -0.6330099, 0, 1, 0.1647059, 1,
-0.3192084, -0.4334465, -0.8205353, 0, 1, 0.172549, 1,
-0.3148108, -1.233365, -3.710925, 0, 1, 0.1764706, 1,
-0.3144501, -0.6151617, -3.455714, 0, 1, 0.1843137, 1,
-0.3141142, 1.549956, -1.136151, 0, 1, 0.1882353, 1,
-0.3108099, -1.212081, -1.731343, 0, 1, 0.1960784, 1,
-0.3107726, -1.518382, -2.444881, 0, 1, 0.2039216, 1,
-0.3093302, -0.1191108, -1.965792, 0, 1, 0.2078431, 1,
-0.3057582, 0.8329504, -1.384373, 0, 1, 0.2156863, 1,
-0.3010134, 0.7686245, -0.7385301, 0, 1, 0.2196078, 1,
-0.2968513, 0.5433439, 0.7514641, 0, 1, 0.227451, 1,
-0.2958299, 0.305435, 0.6555945, 0, 1, 0.2313726, 1,
-0.2929236, 0.1157158, -2.084194, 0, 1, 0.2392157, 1,
-0.28372, 0.2312486, -1.48545, 0, 1, 0.2431373, 1,
-0.2823239, 0.122055, -1.149974, 0, 1, 0.2509804, 1,
-0.2801311, 0.0007642574, -1.878047, 0, 1, 0.254902, 1,
-0.2778901, -1.337016, -3.017984, 0, 1, 0.2627451, 1,
-0.275666, -0.7858796, -3.122925, 0, 1, 0.2666667, 1,
-0.2728021, -0.01942271, -0.3859445, 0, 1, 0.2745098, 1,
-0.2687768, 0.3290861, -1.056356, 0, 1, 0.2784314, 1,
-0.265947, 0.1436901, -1.075283, 0, 1, 0.2862745, 1,
-0.2657433, 0.5597284, -1.874564, 0, 1, 0.2901961, 1,
-0.2652384, 1.049404, 0.7097428, 0, 1, 0.2980392, 1,
-0.2638909, 0.7466391, 1.349241, 0, 1, 0.3058824, 1,
-0.2633322, -0.1160999, -2.392397, 0, 1, 0.3098039, 1,
-0.2610867, 1.125982, 1.658299, 0, 1, 0.3176471, 1,
-0.2575427, -0.2204098, -1.866079, 0, 1, 0.3215686, 1,
-0.2566111, -1.116566, -2.193086, 0, 1, 0.3294118, 1,
-0.2539647, 1.379891, -0.1552104, 0, 1, 0.3333333, 1,
-0.2536075, 1.178852, 1.699254, 0, 1, 0.3411765, 1,
-0.2495848, -0.660751, -1.259589, 0, 1, 0.345098, 1,
-0.2361995, -0.1132158, -1.510337, 0, 1, 0.3529412, 1,
-0.2337946, 0.7226933, -0.5522404, 0, 1, 0.3568628, 1,
-0.2334367, 0.01206828, -1.257364, 0, 1, 0.3647059, 1,
-0.232574, 0.1251904, -1.132488, 0, 1, 0.3686275, 1,
-0.2320184, 0.8308825, 1.079623, 0, 1, 0.3764706, 1,
-0.2313466, -0.5419725, -1.575875, 0, 1, 0.3803922, 1,
-0.2307546, 0.1163558, -1.104956, 0, 1, 0.3882353, 1,
-0.2292415, -2.328546, -4.101227, 0, 1, 0.3921569, 1,
-0.2274496, 1.13306, -0.2390009, 0, 1, 0.4, 1,
-0.2273946, 0.006170133, -0.581146, 0, 1, 0.4078431, 1,
-0.2264361, -1.55902, -3.973558, 0, 1, 0.4117647, 1,
-0.2251222, 1.403085, 0.9193867, 0, 1, 0.4196078, 1,
-0.2208488, 0.8495951, -0.1154436, 0, 1, 0.4235294, 1,
-0.218738, 1.548333, 0.4255949, 0, 1, 0.4313726, 1,
-0.2159719, 1.310456, 0.1755731, 0, 1, 0.4352941, 1,
-0.2041452, -0.05462118, -1.175462, 0, 1, 0.4431373, 1,
-0.1955589, -0.422031, -3.692662, 0, 1, 0.4470588, 1,
-0.1891037, 0.3741511, 0.04219201, 0, 1, 0.454902, 1,
-0.184989, 0.1970161, -0.9155528, 0, 1, 0.4588235, 1,
-0.183636, 0.6944243, 1.250682, 0, 1, 0.4666667, 1,
-0.1800296, -0.4478106, -2.029693, 0, 1, 0.4705882, 1,
-0.1796533, 0.2234643, -0.9102689, 0, 1, 0.4784314, 1,
-0.1781805, -0.7425119, -3.091539, 0, 1, 0.4823529, 1,
-0.174895, -0.1499714, -3.54326, 0, 1, 0.4901961, 1,
-0.1695406, 0.0360084, -1.37306, 0, 1, 0.4941176, 1,
-0.1692659, -0.3463045, -2.502352, 0, 1, 0.5019608, 1,
-0.1678803, 0.6484306, -0.9507004, 0, 1, 0.509804, 1,
-0.1673466, -1.415292, -1.656749, 0, 1, 0.5137255, 1,
-0.1598741, 0.9357444, -1.402355, 0, 1, 0.5215687, 1,
-0.1557083, 0.6822901, -2.023028, 0, 1, 0.5254902, 1,
-0.1531337, -0.88803, -1.903144, 0, 1, 0.5333334, 1,
-0.1530679, 0.2851617, -2.132197, 0, 1, 0.5372549, 1,
-0.1493286, 0.4796447, -0.7800631, 0, 1, 0.5450981, 1,
-0.1483626, -0.2665934, -3.614213, 0, 1, 0.5490196, 1,
-0.1472731, -0.3630557, -3.189477, 0, 1, 0.5568628, 1,
-0.1453281, -0.01640325, -2.23321, 0, 1, 0.5607843, 1,
-0.142829, -0.2626392, -0.1734568, 0, 1, 0.5686275, 1,
-0.1400407, 0.4845657, -0.2146296, 0, 1, 0.572549, 1,
-0.1369039, 0.4703715, -0.4836728, 0, 1, 0.5803922, 1,
-0.1345036, -0.1477264, -3.33125, 0, 1, 0.5843138, 1,
-0.133521, 1.192048, -2.058553, 0, 1, 0.5921569, 1,
-0.1318635, 0.9663376, 0.09696601, 0, 1, 0.5960785, 1,
-0.1291558, -1.050973, -3.380574, 0, 1, 0.6039216, 1,
-0.1262615, -0.7763286, -1.240997, 0, 1, 0.6117647, 1,
-0.1219833, 1.323306, -0.3443809, 0, 1, 0.6156863, 1,
-0.1214731, -0.1516831, -2.202294, 0, 1, 0.6235294, 1,
-0.1192668, -2.611257, -3.833644, 0, 1, 0.627451, 1,
-0.1184053, -0.2389123, -1.169826, 0, 1, 0.6352941, 1,
-0.1177327, -0.9815726, -2.650451, 0, 1, 0.6392157, 1,
-0.1176349, -0.8608913, -4.193117, 0, 1, 0.6470588, 1,
-0.1175725, -0.7218226, -3.755421, 0, 1, 0.6509804, 1,
-0.1171253, 0.8197483, -0.8631226, 0, 1, 0.6588235, 1,
-0.1117943, -1.701166, -3.705162, 0, 1, 0.6627451, 1,
-0.1042519, -1.0394, -2.001828, 0, 1, 0.6705883, 1,
-0.09657981, 0.3345323, 2.179316, 0, 1, 0.6745098, 1,
-0.09649334, -1.073988, -5.246531, 0, 1, 0.682353, 1,
-0.09615293, 0.1789562, -0.1779826, 0, 1, 0.6862745, 1,
-0.09542829, -0.4796587, -4.408436, 0, 1, 0.6941177, 1,
-0.09537839, 0.7916338, -0.8187629, 0, 1, 0.7019608, 1,
-0.09126569, 0.8018116, -0.5242426, 0, 1, 0.7058824, 1,
-0.09120171, 0.290484, -0.5480311, 0, 1, 0.7137255, 1,
-0.08910593, -1.48838, -6.149852, 0, 1, 0.7176471, 1,
-0.08798163, -0.8998088, -2.946487, 0, 1, 0.7254902, 1,
-0.07843539, -0.3344955, -1.954101, 0, 1, 0.7294118, 1,
-0.07511098, -0.9230986, -3.744343, 0, 1, 0.7372549, 1,
-0.07185421, -0.1256516, -3.350363, 0, 1, 0.7411765, 1,
-0.07072408, -0.2292864, -3.018776, 0, 1, 0.7490196, 1,
-0.06990999, 0.2132034, 0.3022929, 0, 1, 0.7529412, 1,
-0.06579676, 0.6503133, -1.077007, 0, 1, 0.7607843, 1,
-0.05319135, 2.000702, -1.97589, 0, 1, 0.7647059, 1,
-0.04948189, -0.7971439, -4.353567, 0, 1, 0.772549, 1,
-0.04798465, 0.6326702, -2.199311, 0, 1, 0.7764706, 1,
-0.04568335, -0.654907, -3.679834, 0, 1, 0.7843137, 1,
-0.04548216, 1.76772, -0.4106109, 0, 1, 0.7882353, 1,
-0.03676724, 0.5059456, 0.3849332, 0, 1, 0.7960784, 1,
-0.03636914, -0.3062235, -3.4237, 0, 1, 0.8039216, 1,
-0.03368404, 0.8380867, 0.1758515, 0, 1, 0.8078431, 1,
-0.03368008, 0.1483481, -2.19027, 0, 1, 0.8156863, 1,
-0.03293566, 0.2806322, 0.799234, 0, 1, 0.8196079, 1,
-0.03178523, -0.5628135, -4.808609, 0, 1, 0.827451, 1,
-0.02948726, 0.9795718, 0.9881238, 0, 1, 0.8313726, 1,
-0.02110063, -1.710616, -3.013654, 0, 1, 0.8392157, 1,
-0.01905315, 0.5518081, -0.8333561, 0, 1, 0.8431373, 1,
-0.01819012, 0.2838809, -0.4147754, 0, 1, 0.8509804, 1,
-0.01782323, -1.626097, -4.092194, 0, 1, 0.854902, 1,
-0.01694401, 1.518547, 0.4026683, 0, 1, 0.8627451, 1,
-0.01342789, -2.254496, -3.756152, 0, 1, 0.8666667, 1,
-0.007016207, 0.502019, -0.563071, 0, 1, 0.8745098, 1,
-0.003825318, -0.2377926, -3.2083, 0, 1, 0.8784314, 1,
-0.003612083, -1.51439, -3.89744, 0, 1, 0.8862745, 1,
-0.001317839, -0.2017711, -3.661717, 0, 1, 0.8901961, 1,
-0.001153219, -1.904099, -0.7919105, 0, 1, 0.8980392, 1,
8.653526e-06, -0.2241366, 3.018166, 0, 1, 0.9058824, 1,
0.0007650249, -0.726545, 3.089039, 0, 1, 0.9098039, 1,
0.0009006429, 2.582841, -0.7219526, 0, 1, 0.9176471, 1,
0.003307517, 0.0717622, 0.6461943, 0, 1, 0.9215686, 1,
0.003563344, 0.8221636, 1.878632, 0, 1, 0.9294118, 1,
0.004455877, 0.01554468, 0.286632, 0, 1, 0.9333333, 1,
0.005910217, -1.244754, 3.896826, 0, 1, 0.9411765, 1,
0.01152361, -0.6021809, 5.248661, 0, 1, 0.945098, 1,
0.01247068, 1.111561, 1.282223, 0, 1, 0.9529412, 1,
0.01264995, -0.8358001, 2.523031, 0, 1, 0.9568627, 1,
0.01567205, -0.5698797, 4.049572, 0, 1, 0.9647059, 1,
0.01822621, 0.3430724, -0.5687322, 0, 1, 0.9686275, 1,
0.01925977, 0.9875142, -1.1894, 0, 1, 0.9764706, 1,
0.0217381, 0.8750025, -1.003052, 0, 1, 0.9803922, 1,
0.02233224, -1.288891, 3.120191, 0, 1, 0.9882353, 1,
0.03147559, -1.181924, 1.826857, 0, 1, 0.9921569, 1,
0.03298018, -0.3807585, 3.037593, 0, 1, 1, 1,
0.03310176, 0.02087045, 0.7714441, 0, 0.9921569, 1, 1,
0.03573041, -0.4079507, 3.406806, 0, 0.9882353, 1, 1,
0.03838553, -0.1666835, 2.662912, 0, 0.9803922, 1, 1,
0.03990073, -0.4108996, 4.927138, 0, 0.9764706, 1, 1,
0.04517388, -1.851803, 4.954972, 0, 0.9686275, 1, 1,
0.04558824, -0.555532, 4.408141, 0, 0.9647059, 1, 1,
0.04813108, -0.4704109, 4.101952, 0, 0.9568627, 1, 1,
0.0548658, -0.5912385, 2.197553, 0, 0.9529412, 1, 1,
0.0589269, 1.093622, -0.8388634, 0, 0.945098, 1, 1,
0.06299739, -0.03522279, 2.909993, 0, 0.9411765, 1, 1,
0.06462095, -2.557892, 2.640108, 0, 0.9333333, 1, 1,
0.06678059, 0.1619861, -0.09906522, 0, 0.9294118, 1, 1,
0.07278334, -0.835386, 2.682868, 0, 0.9215686, 1, 1,
0.08552925, -1.01452, 2.132392, 0, 0.9176471, 1, 1,
0.0864636, 0.9387348, 1.681246, 0, 0.9098039, 1, 1,
0.08656993, -1.187249, 2.471661, 0, 0.9058824, 1, 1,
0.09051338, 0.8159668, 0.3862278, 0, 0.8980392, 1, 1,
0.09214646, 0.4693102, -0.6710256, 0, 0.8901961, 1, 1,
0.09631012, -1.668216, 5.080032, 0, 0.8862745, 1, 1,
0.09885383, -1.344546, 3.634795, 0, 0.8784314, 1, 1,
0.09990294, -0.4583994, 2.485821, 0, 0.8745098, 1, 1,
0.1016565, 1.625943, 0.2745883, 0, 0.8666667, 1, 1,
0.1162798, 1.753514, 0.6038673, 0, 0.8627451, 1, 1,
0.1177145, -0.3010828, 2.789783, 0, 0.854902, 1, 1,
0.1178971, -0.7585102, 3.924833, 0, 0.8509804, 1, 1,
0.1197359, -1.023586, 1.22796, 0, 0.8431373, 1, 1,
0.1219545, -1.223269, 3.064647, 0, 0.8392157, 1, 1,
0.1220006, -0.4648199, 3.595977, 0, 0.8313726, 1, 1,
0.1244424, -0.8517783, 2.511184, 0, 0.827451, 1, 1,
0.1349775, 1.048534, 0.05555952, 0, 0.8196079, 1, 1,
0.1362015, -0.549751, 2.457472, 0, 0.8156863, 1, 1,
0.1378671, -1.313079, 2.480989, 0, 0.8078431, 1, 1,
0.1386696, -0.5165742, 2.476195, 0, 0.8039216, 1, 1,
0.1394448, -0.5940723, 2.152873, 0, 0.7960784, 1, 1,
0.140379, -0.669541, 3.313257, 0, 0.7882353, 1, 1,
0.1413373, -1.022444, 4.313179, 0, 0.7843137, 1, 1,
0.1419715, 0.684507, 0.5183209, 0, 0.7764706, 1, 1,
0.1421973, -0.7646982, 0.1660898, 0, 0.772549, 1, 1,
0.1423927, 0.8655551, -1.623047, 0, 0.7647059, 1, 1,
0.1471908, 0.1862361, -0.7733553, 0, 0.7607843, 1, 1,
0.1482194, -0.226952, 2.424965, 0, 0.7529412, 1, 1,
0.1564016, -1.186572, 2.121411, 0, 0.7490196, 1, 1,
0.156984, -1.199737, 2.586746, 0, 0.7411765, 1, 1,
0.1598146, -0.02874515, 0.1498593, 0, 0.7372549, 1, 1,
0.166417, -0.8221087, 4.521302, 0, 0.7294118, 1, 1,
0.1676585, 0.6347001, 3.174693, 0, 0.7254902, 1, 1,
0.170302, -1.092372, 3.335098, 0, 0.7176471, 1, 1,
0.1778035, -0.6354093, 3.629033, 0, 0.7137255, 1, 1,
0.178037, 0.6861768, -1.041668, 0, 0.7058824, 1, 1,
0.1783588, 0.3525934, 1.912892, 0, 0.6980392, 1, 1,
0.1871817, 1.406652, 0.03382853, 0, 0.6941177, 1, 1,
0.1879711, -0.7886211, 3.188274, 0, 0.6862745, 1, 1,
0.1890375, -1.575455, 2.912165, 0, 0.682353, 1, 1,
0.1943707, 1.374058, 0.5757886, 0, 0.6745098, 1, 1,
0.1959837, -0.1347758, 1.340843, 0, 0.6705883, 1, 1,
0.1961282, 0.5906897, 1.074607, 0, 0.6627451, 1, 1,
0.1976633, -0.2828574, 2.735334, 0, 0.6588235, 1, 1,
0.1981752, 0.05841888, 1.346234, 0, 0.6509804, 1, 1,
0.1983076, -0.1046252, 1.616339, 0, 0.6470588, 1, 1,
0.2019719, -0.03435479, 2.028118, 0, 0.6392157, 1, 1,
0.2028917, -0.5074688, 4.693034, 0, 0.6352941, 1, 1,
0.2052812, -0.1906702, 2.283663, 0, 0.627451, 1, 1,
0.2095046, 1.404378, 0.01604433, 0, 0.6235294, 1, 1,
0.2103217, -1.038428, 2.256523, 0, 0.6156863, 1, 1,
0.2178108, 0.14669, 0.1882218, 0, 0.6117647, 1, 1,
0.2183743, -0.4586887, 2.659426, 0, 0.6039216, 1, 1,
0.2196611, 1.519309, 0.2341735, 0, 0.5960785, 1, 1,
0.2221657, -1.002555, 3.74334, 0, 0.5921569, 1, 1,
0.2233072, -0.09199894, 1.50412, 0, 0.5843138, 1, 1,
0.2240174, 0.9933463, 0.8475563, 0, 0.5803922, 1, 1,
0.2253079, 1.306375, -1.109142, 0, 0.572549, 1, 1,
0.2259012, 1.061539, 0.7068079, 0, 0.5686275, 1, 1,
0.22866, -1.036994, 0.5975294, 0, 0.5607843, 1, 1,
0.2314977, 0.9431922, -1.245291, 0, 0.5568628, 1, 1,
0.231643, -1.749815, 5.138436, 0, 0.5490196, 1, 1,
0.2321325, 0.00721311, 0.9828749, 0, 0.5450981, 1, 1,
0.2372199, 0.9942625, -1.070778, 0, 0.5372549, 1, 1,
0.2377258, 0.1626852, -0.3927788, 0, 0.5333334, 1, 1,
0.2384006, -0.6780753, 2.466233, 0, 0.5254902, 1, 1,
0.2394343, -0.5012516, 4.73285, 0, 0.5215687, 1, 1,
0.2417493, 1.497047, 0.3368184, 0, 0.5137255, 1, 1,
0.2430376, -0.0885809, 2.591264, 0, 0.509804, 1, 1,
0.2461443, -0.4609347, 3.297229, 0, 0.5019608, 1, 1,
0.2498358, -2.029466, 2.700674, 0, 0.4941176, 1, 1,
0.2549616, -0.07318471, 2.083164, 0, 0.4901961, 1, 1,
0.2558123, 0.3056529, 0.9602095, 0, 0.4823529, 1, 1,
0.2606545, -0.9005783, 3.338063, 0, 0.4784314, 1, 1,
0.2642866, -0.5193115, 2.934858, 0, 0.4705882, 1, 1,
0.2650275, -0.817809, 2.265008, 0, 0.4666667, 1, 1,
0.2676851, 0.3262038, 1.708193, 0, 0.4588235, 1, 1,
0.2715319, 0.1508865, 0.3828476, 0, 0.454902, 1, 1,
0.2743793, 2.1981, 0.7745731, 0, 0.4470588, 1, 1,
0.2785998, -0.9452659, 3.449597, 0, 0.4431373, 1, 1,
0.2789453, -1.546338, 0.7539456, 0, 0.4352941, 1, 1,
0.2789519, 0.1286097, -0.857324, 0, 0.4313726, 1, 1,
0.2798688, -0.6291177, 2.265502, 0, 0.4235294, 1, 1,
0.281083, -0.43205, 2.699073, 0, 0.4196078, 1, 1,
0.2812674, 0.1287911, 0.04198198, 0, 0.4117647, 1, 1,
0.2829047, -0.3304485, 3.933216, 0, 0.4078431, 1, 1,
0.2842321, -0.886672, 3.224057, 0, 0.4, 1, 1,
0.2843525, -0.2485269, 3.927343, 0, 0.3921569, 1, 1,
0.2845103, -0.1286387, -0.1693098, 0, 0.3882353, 1, 1,
0.2874112, -0.185697, 4.135971, 0, 0.3803922, 1, 1,
0.2894769, 0.3468747, 2.368515, 0, 0.3764706, 1, 1,
0.2900844, -0.1338871, 2.726561, 0, 0.3686275, 1, 1,
0.2903488, 0.3663865, 0.6441805, 0, 0.3647059, 1, 1,
0.2921287, 4.021737, 0.9032819, 0, 0.3568628, 1, 1,
0.292705, 0.5693449, 1.878327, 0, 0.3529412, 1, 1,
0.2944026, 0.2068346, 1.067043, 0, 0.345098, 1, 1,
0.2963745, -1.715746, 2.890134, 0, 0.3411765, 1, 1,
0.296604, 0.6297349, -0.1931791, 0, 0.3333333, 1, 1,
0.2968906, 1.720278, 1.297853, 0, 0.3294118, 1, 1,
0.2987513, 1.335394, 0.7605613, 0, 0.3215686, 1, 1,
0.3046709, 0.7190057, -0.2237521, 0, 0.3176471, 1, 1,
0.306151, 0.1637252, 1.642324, 0, 0.3098039, 1, 1,
0.3063484, 2.310247, 0.4232642, 0, 0.3058824, 1, 1,
0.3114915, 0.6193975, -0.9544118, 0, 0.2980392, 1, 1,
0.3135235, -1.276029, 3.985122, 0, 0.2901961, 1, 1,
0.3184532, -0.8483869, 2.380573, 0, 0.2862745, 1, 1,
0.3200018, -1.761905, 1.997549, 0, 0.2784314, 1, 1,
0.3222494, 0.3102739, 1.801363, 0, 0.2745098, 1, 1,
0.3236234, 0.07934001, 2.173112, 0, 0.2666667, 1, 1,
0.3291596, 0.1736489, 0.9081575, 0, 0.2627451, 1, 1,
0.3293515, 1.231837, 0.8147191, 0, 0.254902, 1, 1,
0.3397305, -0.1028735, 2.51152, 0, 0.2509804, 1, 1,
0.3402582, -1.068384, 2.004419, 0, 0.2431373, 1, 1,
0.3409218, 1.070515, -0.3341187, 0, 0.2392157, 1, 1,
0.3528839, 0.7319068, 1.420799, 0, 0.2313726, 1, 1,
0.354709, 0.6329395, 0.7175878, 0, 0.227451, 1, 1,
0.3551073, -0.8341463, 2.523508, 0, 0.2196078, 1, 1,
0.3590668, 0.7180567, 0.8544475, 0, 0.2156863, 1, 1,
0.3601954, -0.1558254, 2.044095, 0, 0.2078431, 1, 1,
0.3652216, -0.7044006, 2.304537, 0, 0.2039216, 1, 1,
0.3652671, 1.041648, -0.2300992, 0, 0.1960784, 1, 1,
0.3671078, -1.50771, 3.468528, 0, 0.1882353, 1, 1,
0.3705618, 0.701961, -0.1372217, 0, 0.1843137, 1, 1,
0.3714054, -0.4989146, 4.247659, 0, 0.1764706, 1, 1,
0.3720322, -0.7859577, 1.833742, 0, 0.172549, 1, 1,
0.3738441, 1.870542, 2.172106, 0, 0.1647059, 1, 1,
0.3774478, -0.9731979, 3.339936, 0, 0.1607843, 1, 1,
0.3790819, -0.7614976, 1.941947, 0, 0.1529412, 1, 1,
0.3817258, 1.817397, -0.9670708, 0, 0.1490196, 1, 1,
0.3844091, 0.2039798, 2.545286, 0, 0.1411765, 1, 1,
0.3908318, -0.3860757, 2.866693, 0, 0.1372549, 1, 1,
0.3956966, 0.9383193, 1.859218, 0, 0.1294118, 1, 1,
0.3985616, 0.0424209, 1.525501, 0, 0.1254902, 1, 1,
0.3991401, 0.1377327, 0.4813243, 0, 0.1176471, 1, 1,
0.4006159, -1.013267, 3.249216, 0, 0.1137255, 1, 1,
0.404071, -0.9089845, 2.932044, 0, 0.1058824, 1, 1,
0.4048365, -0.3046941, 3.115536, 0, 0.09803922, 1, 1,
0.414645, 1.239622, 1.10919, 0, 0.09411765, 1, 1,
0.4147191, -0.4917505, 2.251761, 0, 0.08627451, 1, 1,
0.4150369, -0.9262309, 4.101515, 0, 0.08235294, 1, 1,
0.4237896, -1.366186, 1.695514, 0, 0.07450981, 1, 1,
0.4244722, -0.06308173, 1.190449, 0, 0.07058824, 1, 1,
0.4275152, -0.3427435, 2.565272, 0, 0.0627451, 1, 1,
0.4295082, 1.462819, 0.1554347, 0, 0.05882353, 1, 1,
0.4341884, -2.159275, 1.480783, 0, 0.05098039, 1, 1,
0.4389158, -1.055164, 2.114394, 0, 0.04705882, 1, 1,
0.4405296, -0.6753646, 2.782734, 0, 0.03921569, 1, 1,
0.4408351, -0.6689842, 3.981402, 0, 0.03529412, 1, 1,
0.4414409, -1.518476, 3.031914, 0, 0.02745098, 1, 1,
0.4505666, 1.428057, 0.1654499, 0, 0.02352941, 1, 1,
0.4517009, -0.126591, 1.550353, 0, 0.01568628, 1, 1,
0.4554593, 0.5389976, 0.2752883, 0, 0.01176471, 1, 1,
0.4566922, -0.1405943, 2.494191, 0, 0.003921569, 1, 1,
0.4572652, 0.4995211, 0.9317025, 0.003921569, 0, 1, 1,
0.4577959, 0.3767208, 1.736671, 0.007843138, 0, 1, 1,
0.4586098, 0.6819407, -0.05763167, 0.01568628, 0, 1, 1,
0.4616483, 0.8585589, -0.73334, 0.01960784, 0, 1, 1,
0.4617773, 1.126412, -0.5714456, 0.02745098, 0, 1, 1,
0.4718724, -0.09375523, 3.253162, 0.03137255, 0, 1, 1,
0.4742777, 0.3055536, 0.462119, 0.03921569, 0, 1, 1,
0.4766617, 0.2106779, 1.072594, 0.04313726, 0, 1, 1,
0.4770362, 0.7991188, 0.2640288, 0.05098039, 0, 1, 1,
0.4815175, -0.5817149, 1.817375, 0.05490196, 0, 1, 1,
0.4829035, 0.1886895, 0.3805263, 0.0627451, 0, 1, 1,
0.4871342, 1.363808, 1.886577, 0.06666667, 0, 1, 1,
0.4879937, 0.2786554, 0.2426715, 0.07450981, 0, 1, 1,
0.4883399, -1.78044, 3.28125, 0.07843138, 0, 1, 1,
0.4915752, 0.6112422, 0.02673126, 0.08627451, 0, 1, 1,
0.4928621, -0.1138859, -0.3415585, 0.09019608, 0, 1, 1,
0.4953575, -0.3501884, 0.9697475, 0.09803922, 0, 1, 1,
0.4964597, -0.7720718, 1.576559, 0.1058824, 0, 1, 1,
0.5012215, 0.1559599, 3.612766, 0.1098039, 0, 1, 1,
0.5037227, -2.284039, 3.269882, 0.1176471, 0, 1, 1,
0.5050806, 0.06918173, 1.165696, 0.1215686, 0, 1, 1,
0.5064005, 0.3050668, 0.2911263, 0.1294118, 0, 1, 1,
0.5070356, -1.409714, 3.819432, 0.1333333, 0, 1, 1,
0.5072086, -0.4751205, 2.663697, 0.1411765, 0, 1, 1,
0.5126216, -0.05474621, 2.257766, 0.145098, 0, 1, 1,
0.5181752, 2.319748, 0.3218204, 0.1529412, 0, 1, 1,
0.5197832, 0.793809, 0.4883732, 0.1568628, 0, 1, 1,
0.5244421, -0.6469664, 2.470229, 0.1647059, 0, 1, 1,
0.5256614, -0.5658137, 1.576437, 0.1686275, 0, 1, 1,
0.5283934, 0.4871053, 1.508489, 0.1764706, 0, 1, 1,
0.5305237, 0.9629894, 0.9721194, 0.1803922, 0, 1, 1,
0.5309212, -0.63783, 3.219787, 0.1882353, 0, 1, 1,
0.5364884, -1.231673, 2.593445, 0.1921569, 0, 1, 1,
0.5389351, -1.006716, 2.289713, 0.2, 0, 1, 1,
0.5425643, 1.666915, -0.3147111, 0.2078431, 0, 1, 1,
0.5485206, -0.01580025, 1.920955, 0.2117647, 0, 1, 1,
0.5488162, 0.6479852, 1.43694, 0.2196078, 0, 1, 1,
0.5503189, -1.409235, 2.976464, 0.2235294, 0, 1, 1,
0.5503216, 0.2101917, 2.792583, 0.2313726, 0, 1, 1,
0.5503954, 1.985202, 0.8420092, 0.2352941, 0, 1, 1,
0.5540454, -2.245086, 3.072675, 0.2431373, 0, 1, 1,
0.558157, -0.9899575, 0.4309376, 0.2470588, 0, 1, 1,
0.5595089, -1.06514, 3.931665, 0.254902, 0, 1, 1,
0.5608934, -1.167384, 1.410937, 0.2588235, 0, 1, 1,
0.5614237, -0.3929983, 1.969204, 0.2666667, 0, 1, 1,
0.5615856, -1.083522, 3.502085, 0.2705882, 0, 1, 1,
0.5619228, -1.082657, 3.91776, 0.2784314, 0, 1, 1,
0.5658643, -1.245756, 1.828361, 0.282353, 0, 1, 1,
0.568693, 0.9022207, 0.8190185, 0.2901961, 0, 1, 1,
0.5701514, 2.176877, 0.03806001, 0.2941177, 0, 1, 1,
0.5710431, 0.2206831, 1.298141, 0.3019608, 0, 1, 1,
0.5715281, 0.6898811, 1.41157, 0.3098039, 0, 1, 1,
0.572427, -0.9741018, 3.511652, 0.3137255, 0, 1, 1,
0.5763393, 0.09921709, 1.239299, 0.3215686, 0, 1, 1,
0.5771638, -0.6134255, 3.128731, 0.3254902, 0, 1, 1,
0.5795858, 0.5106732, 1.75869, 0.3333333, 0, 1, 1,
0.5811151, 1.509403, 1.631165, 0.3372549, 0, 1, 1,
0.5850335, 0.07281344, 0.750299, 0.345098, 0, 1, 1,
0.5880483, 0.601383, -0.7884883, 0.3490196, 0, 1, 1,
0.5922149, 1.905165, 0.427235, 0.3568628, 0, 1, 1,
0.5922431, 0.7745953, 0.128438, 0.3607843, 0, 1, 1,
0.5924081, 0.1999862, 1.301493, 0.3686275, 0, 1, 1,
0.5927516, 2.071789, 1.244044, 0.372549, 0, 1, 1,
0.5946511, -0.01301815, 0.4507273, 0.3803922, 0, 1, 1,
0.5953039, -0.2083578, 0.4599045, 0.3843137, 0, 1, 1,
0.5990955, -0.3315352, 0.9135101, 0.3921569, 0, 1, 1,
0.5994989, -0.6759385, 2.400873, 0.3960784, 0, 1, 1,
0.6022657, 1.624116, 1.044105, 0.4039216, 0, 1, 1,
0.6028846, 0.0107785, 2.439432, 0.4117647, 0, 1, 1,
0.6035303, -0.03090132, 1.448765, 0.4156863, 0, 1, 1,
0.6045515, 1.836669, -0.6622844, 0.4235294, 0, 1, 1,
0.6069192, 0.9153728, 0.4494114, 0.427451, 0, 1, 1,
0.6105568, -0.08161453, 1.392453, 0.4352941, 0, 1, 1,
0.614437, 0.6868248, 1.566356, 0.4392157, 0, 1, 1,
0.6168455, 0.8953608, 1.502866, 0.4470588, 0, 1, 1,
0.6185321, -0.6633042, 2.746637, 0.4509804, 0, 1, 1,
0.6226884, -0.2511451, 2.665848, 0.4588235, 0, 1, 1,
0.6277002, -0.03880769, 1.989222, 0.4627451, 0, 1, 1,
0.6280395, -0.9172948, 1.733975, 0.4705882, 0, 1, 1,
0.6310665, -0.2357221, 1.385755, 0.4745098, 0, 1, 1,
0.6342039, 0.2521676, 1.38746, 0.4823529, 0, 1, 1,
0.6344872, 1.298739, -0.6196936, 0.4862745, 0, 1, 1,
0.6346548, 0.3106541, 1.881612, 0.4941176, 0, 1, 1,
0.635208, 0.1076067, 1.131606, 0.5019608, 0, 1, 1,
0.6371076, -1.827009, 2.728264, 0.5058824, 0, 1, 1,
0.6388793, -0.9530142, 1.693775, 0.5137255, 0, 1, 1,
0.6390211, -0.7169346, 1.829705, 0.5176471, 0, 1, 1,
0.6392027, 1.426776, 0.3126872, 0.5254902, 0, 1, 1,
0.6418297, -0.9128408, 2.006144, 0.5294118, 0, 1, 1,
0.6428069, -0.1955856, 3.427458, 0.5372549, 0, 1, 1,
0.6448752, -0.7601477, 3.253556, 0.5411765, 0, 1, 1,
0.6465971, 0.1677376, 2.030589, 0.5490196, 0, 1, 1,
0.6481693, -1.042966, 1.330589, 0.5529412, 0, 1, 1,
0.6487016, -0.3627065, 2.784575, 0.5607843, 0, 1, 1,
0.6494673, 0.471059, 0.857188, 0.5647059, 0, 1, 1,
0.6613217, 0.02986895, 0.8065443, 0.572549, 0, 1, 1,
0.6660388, 0.04055788, 2.812464, 0.5764706, 0, 1, 1,
0.6660641, -1.40997, 1.390429, 0.5843138, 0, 1, 1,
0.6684919, -0.9689425, 1.979225, 0.5882353, 0, 1, 1,
0.6859846, 0.4302386, 1.809521, 0.5960785, 0, 1, 1,
0.696898, 1.083576, -0.4725719, 0.6039216, 0, 1, 1,
0.7014456, -2.299388, 2.580671, 0.6078432, 0, 1, 1,
0.7072861, -1.202605, 2.995173, 0.6156863, 0, 1, 1,
0.7090797, -0.2935222, 1.854176, 0.6196079, 0, 1, 1,
0.709663, -1.011523, 1.640033, 0.627451, 0, 1, 1,
0.7098777, 2.886373, 1.103023, 0.6313726, 0, 1, 1,
0.7153386, -0.350481, 3.264803, 0.6392157, 0, 1, 1,
0.7162498, 1.003904, -0.8087008, 0.6431373, 0, 1, 1,
0.7178437, 0.276128, 1.285242, 0.6509804, 0, 1, 1,
0.7197856, 0.3992238, 2.037739, 0.654902, 0, 1, 1,
0.7280262, 1.232532, 0.4945166, 0.6627451, 0, 1, 1,
0.7369444, -0.7504175, 2.446067, 0.6666667, 0, 1, 1,
0.7395496, 1.167673, 0.3779717, 0.6745098, 0, 1, 1,
0.7464252, -1.525715, 3.604875, 0.6784314, 0, 1, 1,
0.7475241, -0.4357275, 0.5635508, 0.6862745, 0, 1, 1,
0.7523821, -0.640104, 1.390386, 0.6901961, 0, 1, 1,
0.7534135, 0.377796, 1.601489, 0.6980392, 0, 1, 1,
0.7784856, -0.5471959, 2.583107, 0.7058824, 0, 1, 1,
0.781288, -0.1117315, 1.42692, 0.7098039, 0, 1, 1,
0.7874561, 0.7115231, 0.4246992, 0.7176471, 0, 1, 1,
0.7914201, -2.131952, 2.654469, 0.7215686, 0, 1, 1,
0.7942338, -0.07412554, 3.49055, 0.7294118, 0, 1, 1,
0.7985361, 1.076721, -1.434408, 0.7333333, 0, 1, 1,
0.8069945, 0.7380778, 1.682516, 0.7411765, 0, 1, 1,
0.8093572, -0.07671262, 0.7740853, 0.7450981, 0, 1, 1,
0.8122054, -0.3341605, 1.733599, 0.7529412, 0, 1, 1,
0.8122241, 0.6581172, 1.185548, 0.7568628, 0, 1, 1,
0.8125629, -2.290134, 2.509058, 0.7647059, 0, 1, 1,
0.8132843, -0.08100872, 1.395306, 0.7686275, 0, 1, 1,
0.8137968, 2.739213, -0.1530929, 0.7764706, 0, 1, 1,
0.8156094, 0.2112773, 1.207563, 0.7803922, 0, 1, 1,
0.8164531, -0.06442806, 3.026205, 0.7882353, 0, 1, 1,
0.8228443, 0.7598127, -0.9036546, 0.7921569, 0, 1, 1,
0.8303881, 0.5142791, -0.8072667, 0.8, 0, 1, 1,
0.8333572, 1.396537, 1.313893, 0.8078431, 0, 1, 1,
0.8397272, 0.5385005, 1.445836, 0.8117647, 0, 1, 1,
0.8442476, -0.05119415, 2.523886, 0.8196079, 0, 1, 1,
0.8465835, -0.3135699, 1.407369, 0.8235294, 0, 1, 1,
0.8497295, 0.07198048, 1.01333, 0.8313726, 0, 1, 1,
0.8546718, 1.952899, 2.068371, 0.8352941, 0, 1, 1,
0.8551008, 0.9693734, 0.06277725, 0.8431373, 0, 1, 1,
0.8554382, 1.512879, 0.9166632, 0.8470588, 0, 1, 1,
0.8655063, -0.2731151, 2.564855, 0.854902, 0, 1, 1,
0.8683791, 1.848696, 0.4145154, 0.8588235, 0, 1, 1,
0.8718084, 0.8736464, 0.7803282, 0.8666667, 0, 1, 1,
0.8718108, 0.09380486, 0.855119, 0.8705882, 0, 1, 1,
0.8733428, -1.395727, 2.304149, 0.8784314, 0, 1, 1,
0.8770927, 1.156782, 1.082616, 0.8823529, 0, 1, 1,
0.8775372, 1.690655, -0.2888597, 0.8901961, 0, 1, 1,
0.8793754, 0.00306443, 1.827248, 0.8941177, 0, 1, 1,
0.8803481, 0.9132789, 1.264143, 0.9019608, 0, 1, 1,
0.8854784, 1.446453, 1.228609, 0.9098039, 0, 1, 1,
0.8867851, -0.9780619, 2.855243, 0.9137255, 0, 1, 1,
0.8868943, -0.4140642, 1.817268, 0.9215686, 0, 1, 1,
0.8916935, -0.1877932, 1.842019, 0.9254902, 0, 1, 1,
0.892379, 0.05204612, 0.838815, 0.9333333, 0, 1, 1,
0.8950393, -1.637717, 2.703067, 0.9372549, 0, 1, 1,
0.8976318, -0.3034941, 2.367498, 0.945098, 0, 1, 1,
0.9018649, -0.3357319, 2.393456, 0.9490196, 0, 1, 1,
0.9026579, -1.478388, 2.111676, 0.9568627, 0, 1, 1,
0.9065849, 0.2324054, 1.638492, 0.9607843, 0, 1, 1,
0.9105907, -1.2575, 1.727112, 0.9686275, 0, 1, 1,
0.9208696, 0.08037192, 2.061288, 0.972549, 0, 1, 1,
0.9262247, 0.04785748, 2.844647, 0.9803922, 0, 1, 1,
0.9279906, -0.352097, 1.966792, 0.9843137, 0, 1, 1,
0.9369144, 0.8004687, 2.73663, 0.9921569, 0, 1, 1,
0.9379232, -0.5436481, 1.36732, 0.9960784, 0, 1, 1,
0.9430408, -0.3178153, 3.595373, 1, 0, 0.9960784, 1,
0.9474207, -0.9193205, 1.249096, 1, 0, 0.9882353, 1,
0.9548275, -0.3419267, 2.858282, 1, 0, 0.9843137, 1,
0.9551904, 0.8790257, 0.1325241, 1, 0, 0.9764706, 1,
0.9553857, 0.505229, 0.6452678, 1, 0, 0.972549, 1,
0.9562573, -0.8375157, 3.250873, 1, 0, 0.9647059, 1,
0.9597452, 0.6282888, 1.532274, 1, 0, 0.9607843, 1,
0.9630259, -0.1998978, 2.326486, 1, 0, 0.9529412, 1,
0.966046, -0.780596, 2.407615, 1, 0, 0.9490196, 1,
0.9776419, -0.4733825, 2.362985, 1, 0, 0.9411765, 1,
0.981154, -1.597015, 1.05284, 1, 0, 0.9372549, 1,
0.9873717, -0.02087692, 0.4858456, 1, 0, 0.9294118, 1,
0.989068, 0.5238666, 0.1433398, 1, 0, 0.9254902, 1,
0.9923891, -0.2766755, 1.539343, 1, 0, 0.9176471, 1,
0.9970814, 0.8534788, 1.11787, 1, 0, 0.9137255, 1,
0.9983541, -0.6023813, 0.6907575, 1, 0, 0.9058824, 1,
0.9984207, 0.5532728, -0.2574241, 1, 0, 0.9019608, 1,
1.002737, -1.117628, 1.681855, 1, 0, 0.8941177, 1,
1.010501, 1.346564, 1.064377, 1, 0, 0.8862745, 1,
1.013246, 1.957835, 1.368938, 1, 0, 0.8823529, 1,
1.013356, 0.1994809, 2.776069, 1, 0, 0.8745098, 1,
1.016579, 0.4053648, 1.73957, 1, 0, 0.8705882, 1,
1.016911, -0.5650181, 1.425509, 1, 0, 0.8627451, 1,
1.02267, -0.8186703, 2.194651, 1, 0, 0.8588235, 1,
1.026165, 1.277459, 1.44736, 1, 0, 0.8509804, 1,
1.027864, -0.6389669, 2.825542, 1, 0, 0.8470588, 1,
1.030826, -1.001143, 1.223789, 1, 0, 0.8392157, 1,
1.043776, 0.2439791, 1.372973, 1, 0, 0.8352941, 1,
1.048899, 0.6470765, 0.7191702, 1, 0, 0.827451, 1,
1.049117, -0.009459218, -0.632971, 1, 0, 0.8235294, 1,
1.058967, -0.2601305, 1.312738, 1, 0, 0.8156863, 1,
1.061791, 0.1465271, 1.599763, 1, 0, 0.8117647, 1,
1.076228, -0.01712799, 0.8603528, 1, 0, 0.8039216, 1,
1.079538, 0.2166875, 2.686535, 1, 0, 0.7960784, 1,
1.085738, 3.64728, -0.8336033, 1, 0, 0.7921569, 1,
1.090439, -0.3403755, 1.517004, 1, 0, 0.7843137, 1,
1.093172, -0.4283676, 1.564404, 1, 0, 0.7803922, 1,
1.09626, -0.9840936, 3.777, 1, 0, 0.772549, 1,
1.100465, -0.9494438, 3.488776, 1, 0, 0.7686275, 1,
1.107742, 0.2971583, 0.1962994, 1, 0, 0.7607843, 1,
1.12252, -0.1323477, 2.148831, 1, 0, 0.7568628, 1,
1.124272, 0.476081, 1.399826, 1, 0, 0.7490196, 1,
1.135847, 0.03877313, 1.703868, 1, 0, 0.7450981, 1,
1.142165, 0.5057056, 0.2436493, 1, 0, 0.7372549, 1,
1.144924, 0.6519607, 0.7937996, 1, 0, 0.7333333, 1,
1.150152, -0.4167271, 2.957059, 1, 0, 0.7254902, 1,
1.152447, -0.009626526, 3.067981, 1, 0, 0.7215686, 1,
1.154053, -0.7015015, -0.04022023, 1, 0, 0.7137255, 1,
1.155213, -0.7379089, 2.180685, 1, 0, 0.7098039, 1,
1.160492, -0.3607519, 1.899366, 1, 0, 0.7019608, 1,
1.164966, -0.133278, 1.854864, 1, 0, 0.6941177, 1,
1.165636, 0.1177862, 1.781623, 1, 0, 0.6901961, 1,
1.166246, -0.5979135, 3.168995, 1, 0, 0.682353, 1,
1.16956, -1.670297, 4.128714, 1, 0, 0.6784314, 1,
1.177228, 2.644272, 0.2258903, 1, 0, 0.6705883, 1,
1.182874, -0.7842259, 2.251382, 1, 0, 0.6666667, 1,
1.183602, 0.9944739, -0.5760822, 1, 0, 0.6588235, 1,
1.186851, -1.012537, 2.046573, 1, 0, 0.654902, 1,
1.188558, -0.3229995, 0.02288975, 1, 0, 0.6470588, 1,
1.189885, 1.864297, -0.6354064, 1, 0, 0.6431373, 1,
1.190443, 1.425762, -2.464152, 1, 0, 0.6352941, 1,
1.193712, 0.2862146, 2.465266, 1, 0, 0.6313726, 1,
1.196158, -1.71443, 2.912858, 1, 0, 0.6235294, 1,
1.202486, -0.7671536, 0.1907114, 1, 0, 0.6196079, 1,
1.224378, 0.08667086, 2.247337, 1, 0, 0.6117647, 1,
1.231547, -0.5581855, 1.495553, 1, 0, 0.6078432, 1,
1.232697, -0.3148313, 1.525102, 1, 0, 0.6, 1,
1.262871, 1.488854, 0.4317528, 1, 0, 0.5921569, 1,
1.276192, -0.6337384, 0.5480395, 1, 0, 0.5882353, 1,
1.30091, 2.891491, 0.2900839, 1, 0, 0.5803922, 1,
1.302907, 0.2541413, 2.930388, 1, 0, 0.5764706, 1,
1.312641, -1.086234, 1.197452, 1, 0, 0.5686275, 1,
1.312747, 0.3893771, 2.54881, 1, 0, 0.5647059, 1,
1.314255, -2.197673, 1.767939, 1, 0, 0.5568628, 1,
1.315636, 2.442362, 0.4819871, 1, 0, 0.5529412, 1,
1.321049, -1.752898, 2.199567, 1, 0, 0.5450981, 1,
1.323628, -0.7058345, 2.184869, 1, 0, 0.5411765, 1,
1.329057, 2.457907, 0.7590707, 1, 0, 0.5333334, 1,
1.329137, 0.6409336, 0.2024065, 1, 0, 0.5294118, 1,
1.336789, 0.06854935, 3.063524, 1, 0, 0.5215687, 1,
1.337828, 0.180996, 1.056621, 1, 0, 0.5176471, 1,
1.340825, 0.09728348, 2.655207, 1, 0, 0.509804, 1,
1.342631, 0.2278, 1.348677, 1, 0, 0.5058824, 1,
1.352933, 0.03785976, 1.225465, 1, 0, 0.4980392, 1,
1.355098, 0.4623531, 1.269253, 1, 0, 0.4901961, 1,
1.356842, -0.1868481, 1.231946, 1, 0, 0.4862745, 1,
1.356934, -0.2246934, 3.003015, 1, 0, 0.4784314, 1,
1.357235, -0.2584219, 0.3800189, 1, 0, 0.4745098, 1,
1.3629, -0.3048499, 1.863453, 1, 0, 0.4666667, 1,
1.367261, 0.4030671, 2.712338, 1, 0, 0.4627451, 1,
1.377165, 0.7413899, 1.949889, 1, 0, 0.454902, 1,
1.384935, 1.914448, 1.103181, 1, 0, 0.4509804, 1,
1.38648, -0.6722538, 4.12104, 1, 0, 0.4431373, 1,
1.388023, 0.2326892, 0.9983397, 1, 0, 0.4392157, 1,
1.388165, -0.7772165, 3.360617, 1, 0, 0.4313726, 1,
1.4002, 0.1616022, -1.01171, 1, 0, 0.427451, 1,
1.406891, -0.7135859, 1.44435, 1, 0, 0.4196078, 1,
1.424786, 0.7485281, 0.8954965, 1, 0, 0.4156863, 1,
1.425487, -0.03068086, 0.7066096, 1, 0, 0.4078431, 1,
1.426531, -0.4858555, 1.556998, 1, 0, 0.4039216, 1,
1.428077, 1.130296, -0.7816917, 1, 0, 0.3960784, 1,
1.429033, 1.085864, 0.6277398, 1, 0, 0.3882353, 1,
1.431165, -0.4916647, 2.560675, 1, 0, 0.3843137, 1,
1.450987, 0.839655, 0.1831754, 1, 0, 0.3764706, 1,
1.456, -0.07521367, 1.495351, 1, 0, 0.372549, 1,
1.467677, 0.05980569, 2.383162, 1, 0, 0.3647059, 1,
1.467906, 1.043385, 1.060798, 1, 0, 0.3607843, 1,
1.475829, 0.4582341, 2.350195, 1, 0, 0.3529412, 1,
1.479366, 1.163187, 1.435077, 1, 0, 0.3490196, 1,
1.493881, -1.008718, 2.485915, 1, 0, 0.3411765, 1,
1.495956, -2.718429, 3.69547, 1, 0, 0.3372549, 1,
1.50576, 2.167208, 1.245496, 1, 0, 0.3294118, 1,
1.53293, -0.378551, 3.069158, 1, 0, 0.3254902, 1,
1.536205, -1.01998, 0.4462004, 1, 0, 0.3176471, 1,
1.537621, -0.1727015, 0.3222336, 1, 0, 0.3137255, 1,
1.544325, 0.6471208, 1.374129, 1, 0, 0.3058824, 1,
1.548741, -0.685595, 0.5898759, 1, 0, 0.2980392, 1,
1.55382, -0.3588661, 1.026827, 1, 0, 0.2941177, 1,
1.56705, 1.037536, 1.735266, 1, 0, 0.2862745, 1,
1.568072, 0.0940727, 0.578904, 1, 0, 0.282353, 1,
1.578059, 0.0728474, 2.965969, 1, 0, 0.2745098, 1,
1.59445, 0.4483255, 1.01204, 1, 0, 0.2705882, 1,
1.595186, -0.9386352, 2.323523, 1, 0, 0.2627451, 1,
1.597526, -0.05856747, 2.224459, 1, 0, 0.2588235, 1,
1.602861, -0.04896595, 1.790418, 1, 0, 0.2509804, 1,
1.63138, -0.2594245, 1.759506, 1, 0, 0.2470588, 1,
1.639231, 1.523007, 0.3621939, 1, 0, 0.2392157, 1,
1.646195, 0.940517, 0.436983, 1, 0, 0.2352941, 1,
1.65281, -1.58587, 1.79472, 1, 0, 0.227451, 1,
1.671157, 0.5491272, 0.7423694, 1, 0, 0.2235294, 1,
1.684634, -0.1071479, 2.103203, 1, 0, 0.2156863, 1,
1.702102, 0.1082866, 0.4376858, 1, 0, 0.2117647, 1,
1.733024, -0.1713769, 0.7384598, 1, 0, 0.2039216, 1,
1.752748, -0.4841262, 0.518225, 1, 0, 0.1960784, 1,
1.754437, -1.028564, 2.367796, 1, 0, 0.1921569, 1,
1.7677, -0.7156947, 1.385551, 1, 0, 0.1843137, 1,
1.788575, 1.658477, 2.331363, 1, 0, 0.1803922, 1,
1.78973, -0.06816446, 0.8414991, 1, 0, 0.172549, 1,
1.792385, -1.190262, 2.13118, 1, 0, 0.1686275, 1,
1.793286, -1.131029, 3.128983, 1, 0, 0.1607843, 1,
1.802629, 0.291909, 3.177248, 1, 0, 0.1568628, 1,
1.803977, 0.6858296, 2.337557, 1, 0, 0.1490196, 1,
1.813426, -3.001415, 3.753088, 1, 0, 0.145098, 1,
1.846214, -0.1886478, 1.024396, 1, 0, 0.1372549, 1,
1.848354, -0.7402465, 2.456694, 1, 0, 0.1333333, 1,
1.851551, -0.5892958, 2.539454, 1, 0, 0.1254902, 1,
1.87957, 1.071509, 1.365916, 1, 0, 0.1215686, 1,
1.883821, -0.8363125, 2.630722, 1, 0, 0.1137255, 1,
1.892897, -2.253149, 1.317397, 1, 0, 0.1098039, 1,
1.903, -0.03379461, 2.438292, 1, 0, 0.1019608, 1,
1.909912, 0.7002301, 0.04153315, 1, 0, 0.09411765, 1,
1.929161, -0.4125312, 1.190538, 1, 0, 0.09019608, 1,
1.932372, 0.2784771, 2.210833, 1, 0, 0.08235294, 1,
1.95461, 0.7450432, 2.292668, 1, 0, 0.07843138, 1,
2.009297, 0.6617078, 1.000915, 1, 0, 0.07058824, 1,
2.010247, -1.697951, 2.203097, 1, 0, 0.06666667, 1,
2.056134, -0.339801, 0.4031888, 1, 0, 0.05882353, 1,
2.114118, -0.629719, 0.3378087, 1, 0, 0.05490196, 1,
2.201817, -0.3970669, 2.069331, 1, 0, 0.04705882, 1,
2.234441, -1.135245, 2.678969, 1, 0, 0.04313726, 1,
2.301273, -0.5257978, 1.148933, 1, 0, 0.03529412, 1,
2.312662, 0.3679076, 0.5785146, 1, 0, 0.03137255, 1,
2.320005, 1.36874, -1.145653, 1, 0, 0.02352941, 1,
2.412612, -0.4825283, 1.103398, 1, 0, 0.01960784, 1,
2.693702, 0.6855547, 1.47095, 1, 0, 0.01176471, 1,
2.722209, -1.010165, 1.242635, 1, 0, 0.007843138, 1
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
-0.1914568, -4.191839, -8.081901, 0, -0.5, 0.5, 0.5,
-0.1914568, -4.191839, -8.081901, 1, -0.5, 0.5, 0.5,
-0.1914568, -4.191839, -8.081901, 1, 1.5, 0.5, 0.5,
-0.1914568, -4.191839, -8.081901, 0, 1.5, 0.5, 0.5
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
-4.092855, 0.510161, -8.081901, 0, -0.5, 0.5, 0.5,
-4.092855, 0.510161, -8.081901, 1, -0.5, 0.5, 0.5,
-4.092855, 0.510161, -8.081901, 1, 1.5, 0.5, 0.5,
-4.092855, 0.510161, -8.081901, 0, 1.5, 0.5, 0.5
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
-4.092855, -4.191839, -0.4505959, 0, -0.5, 0.5, 0.5,
-4.092855, -4.191839, -0.4505959, 1, -0.5, 0.5, 0.5,
-4.092855, -4.191839, -0.4505959, 1, 1.5, 0.5, 0.5,
-4.092855, -4.191839, -0.4505959, 0, 1.5, 0.5, 0.5
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
-3, -3.106762, -6.32083,
2, -3.106762, -6.32083,
-3, -3.106762, -6.32083,
-3, -3.287608, -6.614342,
-2, -3.106762, -6.32083,
-2, -3.287608, -6.614342,
-1, -3.106762, -6.32083,
-1, -3.287608, -6.614342,
0, -3.106762, -6.32083,
0, -3.287608, -6.614342,
1, -3.106762, -6.32083,
1, -3.287608, -6.614342,
2, -3.106762, -6.32083,
2, -3.287608, -6.614342
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
-3, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
-3, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
-3, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
-3, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5,
-2, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
-2, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
-2, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
-2, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5,
-1, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
-1, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
-1, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
-1, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5,
0, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
0, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
0, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
0, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5,
1, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
1, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
1, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
1, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5,
2, -3.6493, -7.201365, 0, -0.5, 0.5, 0.5,
2, -3.6493, -7.201365, 1, -0.5, 0.5, 0.5,
2, -3.6493, -7.201365, 1, 1.5, 0.5, 0.5,
2, -3.6493, -7.201365, 0, 1.5, 0.5, 0.5
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
-3.192533, -2, -6.32083,
-3.192533, 4, -6.32083,
-3.192533, -2, -6.32083,
-3.342587, -2, -6.614342,
-3.192533, 0, -6.32083,
-3.342587, 0, -6.614342,
-3.192533, 2, -6.32083,
-3.342587, 2, -6.614342,
-3.192533, 4, -6.32083,
-3.342587, 4, -6.614342
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
"2",
"4"
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
-3.642694, -2, -7.201365, 0, -0.5, 0.5, 0.5,
-3.642694, -2, -7.201365, 1, -0.5, 0.5, 0.5,
-3.642694, -2, -7.201365, 1, 1.5, 0.5, 0.5,
-3.642694, -2, -7.201365, 0, 1.5, 0.5, 0.5,
-3.642694, 0, -7.201365, 0, -0.5, 0.5, 0.5,
-3.642694, 0, -7.201365, 1, -0.5, 0.5, 0.5,
-3.642694, 0, -7.201365, 1, 1.5, 0.5, 0.5,
-3.642694, 0, -7.201365, 0, 1.5, 0.5, 0.5,
-3.642694, 2, -7.201365, 0, -0.5, 0.5, 0.5,
-3.642694, 2, -7.201365, 1, -0.5, 0.5, 0.5,
-3.642694, 2, -7.201365, 1, 1.5, 0.5, 0.5,
-3.642694, 2, -7.201365, 0, 1.5, 0.5, 0.5,
-3.642694, 4, -7.201365, 0, -0.5, 0.5, 0.5,
-3.642694, 4, -7.201365, 1, -0.5, 0.5, 0.5,
-3.642694, 4, -7.201365, 1, 1.5, 0.5, 0.5,
-3.642694, 4, -7.201365, 0, 1.5, 0.5, 0.5
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
-3.192533, -3.106762, -6,
-3.192533, -3.106762, 4,
-3.192533, -3.106762, -6,
-3.342587, -3.287608, -6,
-3.192533, -3.106762, -4,
-3.342587, -3.287608, -4,
-3.192533, -3.106762, -2,
-3.342587, -3.287608, -2,
-3.192533, -3.106762, 0,
-3.342587, -3.287608, 0,
-3.192533, -3.106762, 2,
-3.342587, -3.287608, 2,
-3.192533, -3.106762, 4,
-3.342587, -3.287608, 4
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
-3.642694, -3.6493, -6, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -6, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -6, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, -6, 0, 1.5, 0.5, 0.5,
-3.642694, -3.6493, -4, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -4, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -4, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, -4, 0, 1.5, 0.5, 0.5,
-3.642694, -3.6493, -2, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -2, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, -2, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, -2, 0, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 0, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 0, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 0, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 0, 0, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 2, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 2, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 2, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 2, 0, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 4, 0, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 4, 1, -0.5, 0.5, 0.5,
-3.642694, -3.6493, 4, 1, 1.5, 0.5, 0.5,
-3.642694, -3.6493, 4, 0, 1.5, 0.5, 0.5
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
-3.192533, -3.106762, -6.32083,
-3.192533, 4.127084, -6.32083,
-3.192533, -3.106762, 5.419638,
-3.192533, 4.127084, 5.419638,
-3.192533, -3.106762, -6.32083,
-3.192533, -3.106762, 5.419638,
-3.192533, 4.127084, -6.32083,
-3.192533, 4.127084, 5.419638,
-3.192533, -3.106762, -6.32083,
2.809619, -3.106762, -6.32083,
-3.192533, -3.106762, 5.419638,
2.809619, -3.106762, 5.419638,
-3.192533, 4.127084, -6.32083,
2.809619, 4.127084, -6.32083,
-3.192533, 4.127084, 5.419638,
2.809619, 4.127084, 5.419638,
2.809619, -3.106762, -6.32083,
2.809619, 4.127084, -6.32083,
2.809619, -3.106762, 5.419638,
2.809619, 4.127084, 5.419638,
2.809619, -3.106762, -6.32083,
2.809619, -3.106762, 5.419638,
2.809619, 4.127084, -6.32083,
2.809619, 4.127084, 5.419638
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
var radius = 8.030914;
var distance = 35.73045;
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
mvMatrix.translate( 0.1914568, -0.510161, 0.4505959 );
mvMatrix.scale( 1.446678, 1.200355, 0.7395942 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73045);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
methfuroxam<-read.table("methfuroxam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methfuroxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
y<-methfuroxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
z<-methfuroxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
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
-3.105123, -1.013966, -2.770513, 0, 0, 1, 1, 1,
-3.032079, 0.6152406, -2.201479, 1, 0, 0, 1, 1,
-2.750867, -0.4333448, 0.1353538, 1, 0, 0, 1, 1,
-2.748416, -0.4231988, -1.789061, 1, 0, 0, 1, 1,
-2.624613, -0.5660048, -1.577062, 1, 0, 0, 1, 1,
-2.606129, -0.0227482, -1.842182, 1, 0, 0, 1, 1,
-2.525653, 0.8315049, 0.6064672, 0, 0, 0, 1, 1,
-2.395407, -0.06302483, -2.021882, 0, 0, 0, 1, 1,
-2.37854, -0.2923427, -1.992301, 0, 0, 0, 1, 1,
-2.344287, 0.5855978, -2.270487, 0, 0, 0, 1, 1,
-2.316953, -0.4142016, -2.368409, 0, 0, 0, 1, 1,
-2.308698, -0.445306, -2.119073, 0, 0, 0, 1, 1,
-2.185409, 1.478128, -0.7227697, 0, 0, 0, 1, 1,
-2.176487, 0.06551897, -0.7913294, 1, 1, 1, 1, 1,
-2.139206, 0.6344012, -2.461377, 1, 1, 1, 1, 1,
-2.125366, 0.5955511, -0.9644554, 1, 1, 1, 1, 1,
-2.117646, -1.420357, -2.589025, 1, 1, 1, 1, 1,
-2.065231, -0.03020338, -2.73828, 1, 1, 1, 1, 1,
-2.055106, 0.4011128, -2.51473, 1, 1, 1, 1, 1,
-2.014209, 1.808858, 0.06296994, 1, 1, 1, 1, 1,
-2.013837, 0.471033, -1.078176, 1, 1, 1, 1, 1,
-2.013265, 1.574231, -1.880277, 1, 1, 1, 1, 1,
-2.011524, -0.1946779, -0.9638433, 1, 1, 1, 1, 1,
-2.002793, 0.7312341, -0.9281517, 1, 1, 1, 1, 1,
-1.938494, 0.4493366, -1.833665, 1, 1, 1, 1, 1,
-1.928439, 0.9544243, -2.546273, 1, 1, 1, 1, 1,
-1.926179, -0.8919998, -0.8512731, 1, 1, 1, 1, 1,
-1.914869, 0.5110089, -1.442557, 1, 1, 1, 1, 1,
-1.909316, -1.269189, -3.57965, 0, 0, 1, 1, 1,
-1.898471, 1.47701, 0.919998, 1, 0, 0, 1, 1,
-1.872914, -0.4417048, -1.977145, 1, 0, 0, 1, 1,
-1.858992, -0.4977524, -2.825938, 1, 0, 0, 1, 1,
-1.857641, 0.2187448, -2.45031, 1, 0, 0, 1, 1,
-1.847626, -0.7346387, -2.295395, 1, 0, 0, 1, 1,
-1.830874, 0.4772952, -1.054358, 0, 0, 0, 1, 1,
-1.817715, 0.8042315, -3.721995, 0, 0, 0, 1, 1,
-1.790255, 1.129286, -0.558754, 0, 0, 0, 1, 1,
-1.781344, -0.1315069, -0.9776731, 0, 0, 0, 1, 1,
-1.767728, -0.0366955, -1.513638, 0, 0, 0, 1, 1,
-1.762943, -1.707936, -2.387233, 0, 0, 0, 1, 1,
-1.723573, -1.080776, -2.468798, 0, 0, 0, 1, 1,
-1.720186, 0.2846365, -1.589047, 1, 1, 1, 1, 1,
-1.712392, -0.9584047, -2.310585, 1, 1, 1, 1, 1,
-1.703336, 0.9764012, -2.282348, 1, 1, 1, 1, 1,
-1.694966, -1.879596, -1.660023, 1, 1, 1, 1, 1,
-1.684069, -0.5947245, -1.651618, 1, 1, 1, 1, 1,
-1.645854, 2.102832, -1.211957, 1, 1, 1, 1, 1,
-1.633759, 1.322245, -2.554079, 1, 1, 1, 1, 1,
-1.63369, -0.008370376, -1.683561, 1, 1, 1, 1, 1,
-1.629829, -1.329235, -2.7128, 1, 1, 1, 1, 1,
-1.627614, 1.032886, -3.198446, 1, 1, 1, 1, 1,
-1.591682, 0.124505, -0.0173216, 1, 1, 1, 1, 1,
-1.583414, 0.9492193, -2.384822, 1, 1, 1, 1, 1,
-1.573595, -0.9131331, -1.188645, 1, 1, 1, 1, 1,
-1.565364, -1.086282, -1.635581, 1, 1, 1, 1, 1,
-1.560521, 0.7158799, -1.074679, 1, 1, 1, 1, 1,
-1.548708, 1.3761, -0.1750139, 0, 0, 1, 1, 1,
-1.544736, -1.033408, -1.244693, 1, 0, 0, 1, 1,
-1.540325, -0.2922427, -1.990596, 1, 0, 0, 1, 1,
-1.54019, -1.691263, -2.929578, 1, 0, 0, 1, 1,
-1.537537, 1.563802, -1.727296, 1, 0, 0, 1, 1,
-1.533028, -0.7633203, -0.1839104, 1, 0, 0, 1, 1,
-1.528992, 0.613368, -1.989631, 0, 0, 0, 1, 1,
-1.524666, -1.670656, -3.655015, 0, 0, 0, 1, 1,
-1.521104, 0.5925618, 0.2816729, 0, 0, 0, 1, 1,
-1.500678, 1.102448, -2.213513, 0, 0, 0, 1, 1,
-1.481405, 1.883006, -1.51132, 0, 0, 0, 1, 1,
-1.480917, -1.174727, -1.94167, 0, 0, 0, 1, 1,
-1.480077, -1.460868, -2.73679, 0, 0, 0, 1, 1,
-1.464145, 0.5770987, -3.273702, 1, 1, 1, 1, 1,
-1.458793, -0.08261291, -0.2188197, 1, 1, 1, 1, 1,
-1.457307, -0.2520016, -2.81476, 1, 1, 1, 1, 1,
-1.452023, 0.9007727, -0.7625208, 1, 1, 1, 1, 1,
-1.450089, 0.1451275, -1.29472, 1, 1, 1, 1, 1,
-1.448836, -0.005168673, -2.883311, 1, 1, 1, 1, 1,
-1.448822, 2.386609, 1.215328, 1, 1, 1, 1, 1,
-1.440903, 0.02473441, -0.3853459, 1, 1, 1, 1, 1,
-1.438762, 0.5731132, -1.30719, 1, 1, 1, 1, 1,
-1.426072, 0.6102266, -2.544789, 1, 1, 1, 1, 1,
-1.41596, 0.4111914, -2.196927, 1, 1, 1, 1, 1,
-1.414578, -1.081288, -2.314617, 1, 1, 1, 1, 1,
-1.410882, 0.8311541, -0.7685874, 1, 1, 1, 1, 1,
-1.400294, 1.648642, -2.231705, 1, 1, 1, 1, 1,
-1.398238, 0.4008971, -0.8907822, 1, 1, 1, 1, 1,
-1.383629, 1.228654, -0.3544075, 0, 0, 1, 1, 1,
-1.373254, 1.105867, -2.428933, 1, 0, 0, 1, 1,
-1.372488, 0.001050115, -0.65181, 1, 0, 0, 1, 1,
-1.369516, 0.03233065, -2.37454, 1, 0, 0, 1, 1,
-1.358285, -0.7118152, -2.72456, 1, 0, 0, 1, 1,
-1.353246, -1.268899, -2.310587, 1, 0, 0, 1, 1,
-1.352499, -0.286968, -2.881088, 0, 0, 0, 1, 1,
-1.345401, -1.06108, -2.998422, 0, 0, 0, 1, 1,
-1.344753, -0.01202528, 0.2855054, 0, 0, 0, 1, 1,
-1.339381, 3.067963, 0.2477031, 0, 0, 0, 1, 1,
-1.336402, -0.522902, -0.3118834, 0, 0, 0, 1, 1,
-1.33504, -0.1408468, -2.413618, 0, 0, 0, 1, 1,
-1.33502, 2.204371, -1.257934, 0, 0, 0, 1, 1,
-1.329915, -0.3135424, -1.9363, 1, 1, 1, 1, 1,
-1.327135, -0.6037928, -1.641451, 1, 1, 1, 1, 1,
-1.311744, -1.66758, -2.955263, 1, 1, 1, 1, 1,
-1.303649, -0.1745238, -3.182901, 1, 1, 1, 1, 1,
-1.295861, -0.3132689, -1.123875, 1, 1, 1, 1, 1,
-1.295166, -2.3086, -3.156042, 1, 1, 1, 1, 1,
-1.280739, -1.408396, -0.8367629, 1, 1, 1, 1, 1,
-1.269775, -1.406528, -1.057115, 1, 1, 1, 1, 1,
-1.268919, 0.8925635, -0.826942, 1, 1, 1, 1, 1,
-1.26526, 2.1097, -0.1146262, 1, 1, 1, 1, 1,
-1.255974, 0.950087, -2.478873, 1, 1, 1, 1, 1,
-1.247298, 0.821784, -0.9505902, 1, 1, 1, 1, 1,
-1.246705, 1.942689, -2.525467, 1, 1, 1, 1, 1,
-1.241976, 0.2419811, -2.35322, 1, 1, 1, 1, 1,
-1.239071, 0.9017267, 0.02499156, 1, 1, 1, 1, 1,
-1.223976, -0.6363403, -1.526943, 0, 0, 1, 1, 1,
-1.22234, -0.8390123, -3.053961, 1, 0, 0, 1, 1,
-1.219292, 0.5835588, -1.383681, 1, 0, 0, 1, 1,
-1.217227, 1.80332, -2.296452, 1, 0, 0, 1, 1,
-1.21642, -0.02545954, -2.829332, 1, 0, 0, 1, 1,
-1.216014, -0.923733, -2.082928, 1, 0, 0, 1, 1,
-1.19905, 1.066147, -0.5434877, 0, 0, 0, 1, 1,
-1.197666, 0.5272462, -1.679727, 0, 0, 0, 1, 1,
-1.19419, -0.2343913, -3.095474, 0, 0, 0, 1, 1,
-1.188046, 0.5147066, 1.42579, 0, 0, 0, 1, 1,
-1.185545, 0.06795519, 0.5766215, 0, 0, 0, 1, 1,
-1.178594, -0.7255964, -1.930161, 0, 0, 0, 1, 1,
-1.168309, 0.1438816, -0.4583283, 0, 0, 0, 1, 1,
-1.166808, 1.05896, -0.1374902, 1, 1, 1, 1, 1,
-1.162598, 0.4834295, 0.7622526, 1, 1, 1, 1, 1,
-1.159745, 2.088406, -1.236019, 1, 1, 1, 1, 1,
-1.149807, 0.01310792, -2.957866, 1, 1, 1, 1, 1,
-1.144603, 0.2725211, -0.7558482, 1, 1, 1, 1, 1,
-1.13991, 1.139464, -0.6566402, 1, 1, 1, 1, 1,
-1.139036, -0.6320885, -1.552987, 1, 1, 1, 1, 1,
-1.130608, -1.334361, -1.938424, 1, 1, 1, 1, 1,
-1.128072, 0.03958014, -0.9090663, 1, 1, 1, 1, 1,
-1.123684, 0.1715539, -1.021494, 1, 1, 1, 1, 1,
-1.123566, 0.5642219, -1.912682, 1, 1, 1, 1, 1,
-1.121944, 1.009469, -0.4937831, 1, 1, 1, 1, 1,
-1.120854, -1.016182, -1.775395, 1, 1, 1, 1, 1,
-1.11938, -0.5799584, -2.039984, 1, 1, 1, 1, 1,
-1.105059, 0.206949, -1.353489, 1, 1, 1, 1, 1,
-1.095003, 0.332567, -2.711943, 0, 0, 1, 1, 1,
-1.080698, 0.01725532, -0.2246529, 1, 0, 0, 1, 1,
-1.058706, -0.07034415, -2.657828, 1, 0, 0, 1, 1,
-1.048694, -2.677944, -2.903894, 1, 0, 0, 1, 1,
-1.041641, -2.89553, -2.586918, 1, 0, 0, 1, 1,
-1.026527, -1.402409, -2.533837, 1, 0, 0, 1, 1,
-1.024472, 1.40575, -1.29892, 0, 0, 0, 1, 1,
-1.020827, -0.1419909, -0.9606855, 0, 0, 0, 1, 1,
-1.011299, 0.2010314, 0.1525977, 0, 0, 0, 1, 1,
-1.007534, 0.2208363, -1.28099, 0, 0, 0, 1, 1,
-1.007293, 1.368043, -1.348376, 0, 0, 0, 1, 1,
-1.006131, 0.9949531, -0.6705055, 0, 0, 0, 1, 1,
-0.9956765, -0.9853494, -2.032689, 0, 0, 0, 1, 1,
-0.9892998, -0.3363843, -0.504748, 1, 1, 1, 1, 1,
-0.983316, 0.8995841, -0.3658928, 1, 1, 1, 1, 1,
-0.977853, -0.5517197, -2.259068, 1, 1, 1, 1, 1,
-0.9736618, 1.848769, -0.899801, 1, 1, 1, 1, 1,
-0.968185, -0.5479397, 0.400987, 1, 1, 1, 1, 1,
-0.9628027, 0.4450844, -3.245896, 1, 1, 1, 1, 1,
-0.9574644, -0.266153, -3.727059, 1, 1, 1, 1, 1,
-0.9474709, 0.2643588, -1.364086, 1, 1, 1, 1, 1,
-0.9437572, -0.4563379, -1.76133, 1, 1, 1, 1, 1,
-0.9390552, 0.7107295, -2.907889, 1, 1, 1, 1, 1,
-0.9380719, -2.609866, -2.464501, 1, 1, 1, 1, 1,
-0.9363166, 2.365028, -1.142106, 1, 1, 1, 1, 1,
-0.9294563, 0.4033312, -2.873343, 1, 1, 1, 1, 1,
-0.9292622, 0.5235777, 0.04218285, 1, 1, 1, 1, 1,
-0.9230599, -1.288538, -1.735755, 1, 1, 1, 1, 1,
-0.913873, -0.2249251, -1.186769, 0, 0, 1, 1, 1,
-0.9119424, 0.4899677, 0.4961239, 1, 0, 0, 1, 1,
-0.9109272, -0.481767, -2.387153, 1, 0, 0, 1, 1,
-0.9095006, -0.5421704, -2.043498, 1, 0, 0, 1, 1,
-0.9086636, -0.1764336, -3.289733, 1, 0, 0, 1, 1,
-0.9073451, -0.02290295, -1.643565, 1, 0, 0, 1, 1,
-0.9049043, -0.8122672, -2.494356, 0, 0, 0, 1, 1,
-0.8977473, -1.560602, -3.147337, 0, 0, 0, 1, 1,
-0.8973529, -1.00964, -2.161366, 0, 0, 0, 1, 1,
-0.8955909, -0.05763229, -1.556601, 0, 0, 0, 1, 1,
-0.8946959, 0.3126621, -0.4120189, 0, 0, 0, 1, 1,
-0.888092, 1.147208, -1.585565, 0, 0, 0, 1, 1,
-0.8807746, -1.994089, -4.003628, 0, 0, 0, 1, 1,
-0.8787702, 1.860706, -0.2928085, 1, 1, 1, 1, 1,
-0.8784829, 0.5669414, -1.357953, 1, 1, 1, 1, 1,
-0.8719647, 0.2813281, -0.6465713, 1, 1, 1, 1, 1,
-0.8710141, 1.500904, 0.6751061, 1, 1, 1, 1, 1,
-0.8668534, 1.920337, -0.1928609, 1, 1, 1, 1, 1,
-0.8649188, 0.932384, -1.143382, 1, 1, 1, 1, 1,
-0.8582321, 0.4302403, -1.159332, 1, 1, 1, 1, 1,
-0.8561358, 0.9342773, -1.261905, 1, 1, 1, 1, 1,
-0.8502485, 0.5218212, -1.584638, 1, 1, 1, 1, 1,
-0.8494235, 0.5050818, -2.033541, 1, 1, 1, 1, 1,
-0.8465065, -0.8286869, -0.7933803, 1, 1, 1, 1, 1,
-0.840044, -0.4175014, -1.303821, 1, 1, 1, 1, 1,
-0.8379883, -0.2531108, -2.217804, 1, 1, 1, 1, 1,
-0.8325257, 0.4509105, -1.940161, 1, 1, 1, 1, 1,
-0.8322165, -0.2061558, -0.8267837, 1, 1, 1, 1, 1,
-0.8302993, 2.100785, -0.5985117, 0, 0, 1, 1, 1,
-0.8271295, 1.038193, -1.565569, 1, 0, 0, 1, 1,
-0.8231611, 1.336154, 0.3508412, 1, 0, 0, 1, 1,
-0.8212237, -1.123953, -3.797908, 1, 0, 0, 1, 1,
-0.8201128, -0.005940844, -1.149262, 1, 0, 0, 1, 1,
-0.812803, 1.087433, -1.509679, 1, 0, 0, 1, 1,
-0.811915, -0.3458482, -3.556077, 0, 0, 0, 1, 1,
-0.8104601, 1.693457, 0.9431559, 0, 0, 0, 1, 1,
-0.809693, 0.1147135, -2.356947, 0, 0, 0, 1, 1,
-0.8093974, 0.1098461, -1.17602, 0, 0, 0, 1, 1,
-0.8089787, -1.918108, -1.303363, 0, 0, 0, 1, 1,
-0.8066766, -0.1827203, -1.273321, 0, 0, 0, 1, 1,
-0.7988126, 0.1351776, -1.823412, 0, 0, 0, 1, 1,
-0.7952377, -1.207212, -1.183199, 1, 1, 1, 1, 1,
-0.792607, -0.225106, -2.736917, 1, 1, 1, 1, 1,
-0.7862734, -0.2373447, -0.8512513, 1, 1, 1, 1, 1,
-0.7840933, 0.2163173, -0.5218251, 1, 1, 1, 1, 1,
-0.7778112, 0.4523582, -0.01090745, 1, 1, 1, 1, 1,
-0.7758855, 1.357862, 0.73333, 1, 1, 1, 1, 1,
-0.7713633, 0.2278738, -1.731992, 1, 1, 1, 1, 1,
-0.7700741, -0.3301378, -0.7825192, 1, 1, 1, 1, 1,
-0.7616092, 0.3759302, -1.414069, 1, 1, 1, 1, 1,
-0.7481737, 0.4223146, -1.538023, 1, 1, 1, 1, 1,
-0.743172, -0.6683021, -2.505498, 1, 1, 1, 1, 1,
-0.7422739, -1.258672, -3.862898, 1, 1, 1, 1, 1,
-0.7404702, -0.2604991, -0.5668405, 1, 1, 1, 1, 1,
-0.7389175, 0.08577847, -1.510239, 1, 1, 1, 1, 1,
-0.7289067, 1.308319, 0.4973259, 1, 1, 1, 1, 1,
-0.7285993, -0.01565239, -1.792358, 0, 0, 1, 1, 1,
-0.7096211, -0.5535288, -4.261203, 1, 0, 0, 1, 1,
-0.7072067, -0.4474716, -0.7340404, 1, 0, 0, 1, 1,
-0.7064243, -1.760002, -2.926393, 1, 0, 0, 1, 1,
-0.7047244, 0.3619492, -0.1921618, 1, 0, 0, 1, 1,
-0.7045379, -1.213021, -4.01506, 1, 0, 0, 1, 1,
-0.7039298, -0.3875965, -1.631459, 0, 0, 0, 1, 1,
-0.7037463, -1.020111, -2.609967, 0, 0, 0, 1, 1,
-0.7021086, 0.131124, -2.506211, 0, 0, 0, 1, 1,
-0.6998196, -1.269934, -3.53098, 0, 0, 0, 1, 1,
-0.6948495, -1.285066, -3.971165, 0, 0, 0, 1, 1,
-0.6906368, 0.7278984, -1.108481, 0, 0, 0, 1, 1,
-0.6798693, -0.4986566, -1.615906, 0, 0, 0, 1, 1,
-0.6756935, 1.43246, -0.9853564, 1, 1, 1, 1, 1,
-0.6735851, -1.797451, -2.767759, 1, 1, 1, 1, 1,
-0.6662842, -0.1227288, -1.850404, 1, 1, 1, 1, 1,
-0.665014, 0.7240863, 1.559831, 1, 1, 1, 1, 1,
-0.6543481, -1.00457, -2.323921, 1, 1, 1, 1, 1,
-0.6494288, 1.368555, -1.15258, 1, 1, 1, 1, 1,
-0.6491197, 0.07723358, -3.494503, 1, 1, 1, 1, 1,
-0.6477847, 0.2362002, -1.134182, 1, 1, 1, 1, 1,
-0.6438061, -0.681967, -3.273211, 1, 1, 1, 1, 1,
-0.6341284, 1.649953, 0.2752054, 1, 1, 1, 1, 1,
-0.6302924, 1.259223, -1.759985, 1, 1, 1, 1, 1,
-0.6277298, -0.9401141, -2.210664, 1, 1, 1, 1, 1,
-0.6227652, 0.632809, 0.2382347, 1, 1, 1, 1, 1,
-0.6177105, -0.5904813, -3.100732, 1, 1, 1, 1, 1,
-0.6123612, -0.1751495, -0.4711854, 1, 1, 1, 1, 1,
-0.6084152, 0.05722559, -1.045804, 0, 0, 1, 1, 1,
-0.6066231, 0.2798407, -0.727754, 1, 0, 0, 1, 1,
-0.6010838, 0.5735841, -1.381431, 1, 0, 0, 1, 1,
-0.6004497, 0.9084053, -0.07157755, 1, 0, 0, 1, 1,
-0.5987357, -0.6379656, -1.145008, 1, 0, 0, 1, 1,
-0.5986402, 0.441905, -1.744486, 1, 0, 0, 1, 1,
-0.5979626, 0.8866323, -0.007817789, 0, 0, 0, 1, 1,
-0.5965707, -0.7820812, -1.886567, 0, 0, 0, 1, 1,
-0.5949784, 0.3762681, -1.521113, 0, 0, 0, 1, 1,
-0.5921952, -1.047207, -2.845447, 0, 0, 0, 1, 1,
-0.5919225, 0.9825093, 1.079184, 0, 0, 0, 1, 1,
-0.5912355, 0.01437816, -0.5661273, 0, 0, 0, 1, 1,
-0.5784893, -0.3335813, -2.297879, 0, 0, 0, 1, 1,
-0.5783314, 0.6481331, 0.03496986, 1, 1, 1, 1, 1,
-0.5681303, -0.1612587, -0.3596236, 1, 1, 1, 1, 1,
-0.5648046, 0.3804561, 0.4681027, 1, 1, 1, 1, 1,
-0.5638946, -0.5314518, -1.658933, 1, 1, 1, 1, 1,
-0.5633145, 0.491897, -2.11621, 1, 1, 1, 1, 1,
-0.5627226, 0.6841675, 0.2795906, 1, 1, 1, 1, 1,
-0.5612751, 0.9345762, 0.4445967, 1, 1, 1, 1, 1,
-0.5595197, 1.184282, 0.1788945, 1, 1, 1, 1, 1,
-0.557865, -1.013832, -3.239652, 1, 1, 1, 1, 1,
-0.5550432, 0.3190198, -0.2821949, 1, 1, 1, 1, 1,
-0.5545692, -1.912499, -4.350571, 1, 1, 1, 1, 1,
-0.5537904, -0.07873178, -0.832298, 1, 1, 1, 1, 1,
-0.5509999, 0.3609288, -0.5358308, 1, 1, 1, 1, 1,
-0.5505258, -1.405069, -2.138558, 1, 1, 1, 1, 1,
-0.5466292, -0.2302279, -2.075035, 1, 1, 1, 1, 1,
-0.5379646, 1.539627, -0.1868991, 0, 0, 1, 1, 1,
-0.5372616, 0.32035, -0.9418211, 1, 0, 0, 1, 1,
-0.5356195, 1.448734, -1.291571, 1, 0, 0, 1, 1,
-0.5332137, 0.0872494, -2.276335, 1, 0, 0, 1, 1,
-0.5329756, -0.1080717, 0.04927663, 1, 0, 0, 1, 1,
-0.5318535, -0.9545514, -1.586384, 1, 0, 0, 1, 1,
-0.5233288, 0.2183986, -1.548295, 0, 0, 0, 1, 1,
-0.5210603, -0.4204183, -2.732442, 0, 0, 0, 1, 1,
-0.5177763, -0.4654242, -3.187698, 0, 0, 0, 1, 1,
-0.5117898, 0.1927853, 0.5579531, 0, 0, 0, 1, 1,
-0.5089072, -0.3932562, -2.512399, 0, 0, 0, 1, 1,
-0.5084741, 0.0726143, -0.4075477, 0, 0, 0, 1, 1,
-0.5070916, -0.4326596, -1.826836, 0, 0, 0, 1, 1,
-0.5065938, -0.02814914, -2.436396, 1, 1, 1, 1, 1,
-0.5039418, 0.861316, -0.2638532, 1, 1, 1, 1, 1,
-0.5026172, 1.211705, -0.1143712, 1, 1, 1, 1, 1,
-0.4974663, -0.6402262, -1.798873, 1, 1, 1, 1, 1,
-0.497375, 1.231821, -1.722659, 1, 1, 1, 1, 1,
-0.4849963, -1.468389, -2.873152, 1, 1, 1, 1, 1,
-0.4812032, -0.3871198, -2.026811, 1, 1, 1, 1, 1,
-0.4804943, 0.8381565, -0.699457, 1, 1, 1, 1, 1,
-0.4746111, 1.348373, 0.4304868, 1, 1, 1, 1, 1,
-0.4695282, 0.4014062, -2.541984, 1, 1, 1, 1, 1,
-0.4646621, 1.792723, 1.222553, 1, 1, 1, 1, 1,
-0.4636128, 0.007176318, -0.3925048, 1, 1, 1, 1, 1,
-0.4628309, -0.7006724, -3.239351, 1, 1, 1, 1, 1,
-0.4622413, 1.39356, 0.2467058, 1, 1, 1, 1, 1,
-0.4605044, 0.9664948, -1.184307, 1, 1, 1, 1, 1,
-0.4571027, -0.4344987, -0.9567131, 0, 0, 1, 1, 1,
-0.453061, 0.7608534, 0.2113483, 1, 0, 0, 1, 1,
-0.4530005, 0.05917402, -0.8427401, 1, 0, 0, 1, 1,
-0.4513987, 0.6071905, -1.378863, 1, 0, 0, 1, 1,
-0.4412045, 0.6947709, -2.24823, 1, 0, 0, 1, 1,
-0.4388725, -0.1418588, -1.769023, 1, 0, 0, 1, 1,
-0.4334201, -0.06841291, -2.73859, 0, 0, 0, 1, 1,
-0.4276641, -0.5184449, -4.879108, 0, 0, 0, 1, 1,
-0.4253314, -0.6909262, -1.861255, 0, 0, 0, 1, 1,
-0.4251553, 0.1508061, -2.179279, 0, 0, 0, 1, 1,
-0.4241502, -0.66085, -1.194476, 0, 0, 0, 1, 1,
-0.4167515, -1.354942, -2.960835, 0, 0, 0, 1, 1,
-0.4148095, 0.8986468, -0.8293847, 0, 0, 0, 1, 1,
-0.4143383, -0.3956524, -2.94314, 1, 1, 1, 1, 1,
-0.4102397, 0.1343266, -0.1073646, 1, 1, 1, 1, 1,
-0.4086209, 0.7549418, -1.836721, 1, 1, 1, 1, 1,
-0.408424, 0.9013099, -1.833229, 1, 1, 1, 1, 1,
-0.4074753, -0.1521783, -1.707422, 1, 1, 1, 1, 1,
-0.4037903, 0.2256668, -0.6559901, 1, 1, 1, 1, 1,
-0.3948062, 0.01570142, -0.01379459, 1, 1, 1, 1, 1,
-0.390835, 0.9983691, 2.274743, 1, 1, 1, 1, 1,
-0.3879704, 0.8514431, -3.696873, 1, 1, 1, 1, 1,
-0.3871416, -2.085769, -5.017127, 1, 1, 1, 1, 1,
-0.387119, -0.9941006, -3.016458, 1, 1, 1, 1, 1,
-0.3780006, -0.8904404, -2.006539, 1, 1, 1, 1, 1,
-0.375706, -0.8714939, -3.130427, 1, 1, 1, 1, 1,
-0.3755081, -1.274963, -2.479129, 1, 1, 1, 1, 1,
-0.3751624, -1.08049, -2.413763, 1, 1, 1, 1, 1,
-0.3714845, 1.459826, -1.642494, 0, 0, 1, 1, 1,
-0.3712444, 0.2111283, -2.805956, 1, 0, 0, 1, 1,
-0.3693135, 0.4524142, -1.488759, 1, 0, 0, 1, 1,
-0.3684398, -1.185957, -2.027194, 1, 0, 0, 1, 1,
-0.3663155, -1.427082, -4.700569, 1, 0, 0, 1, 1,
-0.3641936, -0.9346352, -2.525084, 1, 0, 0, 1, 1,
-0.3620142, 0.3828018, 1.033288, 0, 0, 0, 1, 1,
-0.360507, -2.515982, -2.278025, 0, 0, 0, 1, 1,
-0.3589194, -0.19575, -0.9438856, 0, 0, 0, 1, 1,
-0.3536674, -2.450811, -1.893721, 0, 0, 0, 1, 1,
-0.3527788, 0.1375371, -1.5089, 0, 0, 0, 1, 1,
-0.3520009, -0.1067061, -1.140776, 0, 0, 0, 1, 1,
-0.3488049, -1.314591, -1.342622, 0, 0, 0, 1, 1,
-0.3479003, -0.5421839, -2.153694, 1, 1, 1, 1, 1,
-0.3456461, 0.5182016, 0.7349409, 1, 1, 1, 1, 1,
-0.3454593, -0.08591644, 0.08119465, 1, 1, 1, 1, 1,
-0.3407995, 0.1046704, -0.1565002, 1, 1, 1, 1, 1,
-0.3376653, -0.134706, -1.691917, 1, 1, 1, 1, 1,
-0.3367871, -1.494108, -3.77995, 1, 1, 1, 1, 1,
-0.3339531, -1.545793, -3.865932, 1, 1, 1, 1, 1,
-0.3333907, -0.05106616, -0.5274736, 1, 1, 1, 1, 1,
-0.3327505, -0.9085034, -2.299772, 1, 1, 1, 1, 1,
-0.3312388, 1.214802, 1.407729, 1, 1, 1, 1, 1,
-0.3293908, 1.611241, 0.1791147, 1, 1, 1, 1, 1,
-0.3280084, 0.87813, -0.1798656, 1, 1, 1, 1, 1,
-0.3249016, 0.6053384, -0.6330099, 1, 1, 1, 1, 1,
-0.3192084, -0.4334465, -0.8205353, 1, 1, 1, 1, 1,
-0.3148108, -1.233365, -3.710925, 1, 1, 1, 1, 1,
-0.3144501, -0.6151617, -3.455714, 0, 0, 1, 1, 1,
-0.3141142, 1.549956, -1.136151, 1, 0, 0, 1, 1,
-0.3108099, -1.212081, -1.731343, 1, 0, 0, 1, 1,
-0.3107726, -1.518382, -2.444881, 1, 0, 0, 1, 1,
-0.3093302, -0.1191108, -1.965792, 1, 0, 0, 1, 1,
-0.3057582, 0.8329504, -1.384373, 1, 0, 0, 1, 1,
-0.3010134, 0.7686245, -0.7385301, 0, 0, 0, 1, 1,
-0.2968513, 0.5433439, 0.7514641, 0, 0, 0, 1, 1,
-0.2958299, 0.305435, 0.6555945, 0, 0, 0, 1, 1,
-0.2929236, 0.1157158, -2.084194, 0, 0, 0, 1, 1,
-0.28372, 0.2312486, -1.48545, 0, 0, 0, 1, 1,
-0.2823239, 0.122055, -1.149974, 0, 0, 0, 1, 1,
-0.2801311, 0.0007642574, -1.878047, 0, 0, 0, 1, 1,
-0.2778901, -1.337016, -3.017984, 1, 1, 1, 1, 1,
-0.275666, -0.7858796, -3.122925, 1, 1, 1, 1, 1,
-0.2728021, -0.01942271, -0.3859445, 1, 1, 1, 1, 1,
-0.2687768, 0.3290861, -1.056356, 1, 1, 1, 1, 1,
-0.265947, 0.1436901, -1.075283, 1, 1, 1, 1, 1,
-0.2657433, 0.5597284, -1.874564, 1, 1, 1, 1, 1,
-0.2652384, 1.049404, 0.7097428, 1, 1, 1, 1, 1,
-0.2638909, 0.7466391, 1.349241, 1, 1, 1, 1, 1,
-0.2633322, -0.1160999, -2.392397, 1, 1, 1, 1, 1,
-0.2610867, 1.125982, 1.658299, 1, 1, 1, 1, 1,
-0.2575427, -0.2204098, -1.866079, 1, 1, 1, 1, 1,
-0.2566111, -1.116566, -2.193086, 1, 1, 1, 1, 1,
-0.2539647, 1.379891, -0.1552104, 1, 1, 1, 1, 1,
-0.2536075, 1.178852, 1.699254, 1, 1, 1, 1, 1,
-0.2495848, -0.660751, -1.259589, 1, 1, 1, 1, 1,
-0.2361995, -0.1132158, -1.510337, 0, 0, 1, 1, 1,
-0.2337946, 0.7226933, -0.5522404, 1, 0, 0, 1, 1,
-0.2334367, 0.01206828, -1.257364, 1, 0, 0, 1, 1,
-0.232574, 0.1251904, -1.132488, 1, 0, 0, 1, 1,
-0.2320184, 0.8308825, 1.079623, 1, 0, 0, 1, 1,
-0.2313466, -0.5419725, -1.575875, 1, 0, 0, 1, 1,
-0.2307546, 0.1163558, -1.104956, 0, 0, 0, 1, 1,
-0.2292415, -2.328546, -4.101227, 0, 0, 0, 1, 1,
-0.2274496, 1.13306, -0.2390009, 0, 0, 0, 1, 1,
-0.2273946, 0.006170133, -0.581146, 0, 0, 0, 1, 1,
-0.2264361, -1.55902, -3.973558, 0, 0, 0, 1, 1,
-0.2251222, 1.403085, 0.9193867, 0, 0, 0, 1, 1,
-0.2208488, 0.8495951, -0.1154436, 0, 0, 0, 1, 1,
-0.218738, 1.548333, 0.4255949, 1, 1, 1, 1, 1,
-0.2159719, 1.310456, 0.1755731, 1, 1, 1, 1, 1,
-0.2041452, -0.05462118, -1.175462, 1, 1, 1, 1, 1,
-0.1955589, -0.422031, -3.692662, 1, 1, 1, 1, 1,
-0.1891037, 0.3741511, 0.04219201, 1, 1, 1, 1, 1,
-0.184989, 0.1970161, -0.9155528, 1, 1, 1, 1, 1,
-0.183636, 0.6944243, 1.250682, 1, 1, 1, 1, 1,
-0.1800296, -0.4478106, -2.029693, 1, 1, 1, 1, 1,
-0.1796533, 0.2234643, -0.9102689, 1, 1, 1, 1, 1,
-0.1781805, -0.7425119, -3.091539, 1, 1, 1, 1, 1,
-0.174895, -0.1499714, -3.54326, 1, 1, 1, 1, 1,
-0.1695406, 0.0360084, -1.37306, 1, 1, 1, 1, 1,
-0.1692659, -0.3463045, -2.502352, 1, 1, 1, 1, 1,
-0.1678803, 0.6484306, -0.9507004, 1, 1, 1, 1, 1,
-0.1673466, -1.415292, -1.656749, 1, 1, 1, 1, 1,
-0.1598741, 0.9357444, -1.402355, 0, 0, 1, 1, 1,
-0.1557083, 0.6822901, -2.023028, 1, 0, 0, 1, 1,
-0.1531337, -0.88803, -1.903144, 1, 0, 0, 1, 1,
-0.1530679, 0.2851617, -2.132197, 1, 0, 0, 1, 1,
-0.1493286, 0.4796447, -0.7800631, 1, 0, 0, 1, 1,
-0.1483626, -0.2665934, -3.614213, 1, 0, 0, 1, 1,
-0.1472731, -0.3630557, -3.189477, 0, 0, 0, 1, 1,
-0.1453281, -0.01640325, -2.23321, 0, 0, 0, 1, 1,
-0.142829, -0.2626392, -0.1734568, 0, 0, 0, 1, 1,
-0.1400407, 0.4845657, -0.2146296, 0, 0, 0, 1, 1,
-0.1369039, 0.4703715, -0.4836728, 0, 0, 0, 1, 1,
-0.1345036, -0.1477264, -3.33125, 0, 0, 0, 1, 1,
-0.133521, 1.192048, -2.058553, 0, 0, 0, 1, 1,
-0.1318635, 0.9663376, 0.09696601, 1, 1, 1, 1, 1,
-0.1291558, -1.050973, -3.380574, 1, 1, 1, 1, 1,
-0.1262615, -0.7763286, -1.240997, 1, 1, 1, 1, 1,
-0.1219833, 1.323306, -0.3443809, 1, 1, 1, 1, 1,
-0.1214731, -0.1516831, -2.202294, 1, 1, 1, 1, 1,
-0.1192668, -2.611257, -3.833644, 1, 1, 1, 1, 1,
-0.1184053, -0.2389123, -1.169826, 1, 1, 1, 1, 1,
-0.1177327, -0.9815726, -2.650451, 1, 1, 1, 1, 1,
-0.1176349, -0.8608913, -4.193117, 1, 1, 1, 1, 1,
-0.1175725, -0.7218226, -3.755421, 1, 1, 1, 1, 1,
-0.1171253, 0.8197483, -0.8631226, 1, 1, 1, 1, 1,
-0.1117943, -1.701166, -3.705162, 1, 1, 1, 1, 1,
-0.1042519, -1.0394, -2.001828, 1, 1, 1, 1, 1,
-0.09657981, 0.3345323, 2.179316, 1, 1, 1, 1, 1,
-0.09649334, -1.073988, -5.246531, 1, 1, 1, 1, 1,
-0.09615293, 0.1789562, -0.1779826, 0, 0, 1, 1, 1,
-0.09542829, -0.4796587, -4.408436, 1, 0, 0, 1, 1,
-0.09537839, 0.7916338, -0.8187629, 1, 0, 0, 1, 1,
-0.09126569, 0.8018116, -0.5242426, 1, 0, 0, 1, 1,
-0.09120171, 0.290484, -0.5480311, 1, 0, 0, 1, 1,
-0.08910593, -1.48838, -6.149852, 1, 0, 0, 1, 1,
-0.08798163, -0.8998088, -2.946487, 0, 0, 0, 1, 1,
-0.07843539, -0.3344955, -1.954101, 0, 0, 0, 1, 1,
-0.07511098, -0.9230986, -3.744343, 0, 0, 0, 1, 1,
-0.07185421, -0.1256516, -3.350363, 0, 0, 0, 1, 1,
-0.07072408, -0.2292864, -3.018776, 0, 0, 0, 1, 1,
-0.06990999, 0.2132034, 0.3022929, 0, 0, 0, 1, 1,
-0.06579676, 0.6503133, -1.077007, 0, 0, 0, 1, 1,
-0.05319135, 2.000702, -1.97589, 1, 1, 1, 1, 1,
-0.04948189, -0.7971439, -4.353567, 1, 1, 1, 1, 1,
-0.04798465, 0.6326702, -2.199311, 1, 1, 1, 1, 1,
-0.04568335, -0.654907, -3.679834, 1, 1, 1, 1, 1,
-0.04548216, 1.76772, -0.4106109, 1, 1, 1, 1, 1,
-0.03676724, 0.5059456, 0.3849332, 1, 1, 1, 1, 1,
-0.03636914, -0.3062235, -3.4237, 1, 1, 1, 1, 1,
-0.03368404, 0.8380867, 0.1758515, 1, 1, 1, 1, 1,
-0.03368008, 0.1483481, -2.19027, 1, 1, 1, 1, 1,
-0.03293566, 0.2806322, 0.799234, 1, 1, 1, 1, 1,
-0.03178523, -0.5628135, -4.808609, 1, 1, 1, 1, 1,
-0.02948726, 0.9795718, 0.9881238, 1, 1, 1, 1, 1,
-0.02110063, -1.710616, -3.013654, 1, 1, 1, 1, 1,
-0.01905315, 0.5518081, -0.8333561, 1, 1, 1, 1, 1,
-0.01819012, 0.2838809, -0.4147754, 1, 1, 1, 1, 1,
-0.01782323, -1.626097, -4.092194, 0, 0, 1, 1, 1,
-0.01694401, 1.518547, 0.4026683, 1, 0, 0, 1, 1,
-0.01342789, -2.254496, -3.756152, 1, 0, 0, 1, 1,
-0.007016207, 0.502019, -0.563071, 1, 0, 0, 1, 1,
-0.003825318, -0.2377926, -3.2083, 1, 0, 0, 1, 1,
-0.003612083, -1.51439, -3.89744, 1, 0, 0, 1, 1,
-0.001317839, -0.2017711, -3.661717, 0, 0, 0, 1, 1,
-0.001153219, -1.904099, -0.7919105, 0, 0, 0, 1, 1,
8.653526e-06, -0.2241366, 3.018166, 0, 0, 0, 1, 1,
0.0007650249, -0.726545, 3.089039, 0, 0, 0, 1, 1,
0.0009006429, 2.582841, -0.7219526, 0, 0, 0, 1, 1,
0.003307517, 0.0717622, 0.6461943, 0, 0, 0, 1, 1,
0.003563344, 0.8221636, 1.878632, 0, 0, 0, 1, 1,
0.004455877, 0.01554468, 0.286632, 1, 1, 1, 1, 1,
0.005910217, -1.244754, 3.896826, 1, 1, 1, 1, 1,
0.01152361, -0.6021809, 5.248661, 1, 1, 1, 1, 1,
0.01247068, 1.111561, 1.282223, 1, 1, 1, 1, 1,
0.01264995, -0.8358001, 2.523031, 1, 1, 1, 1, 1,
0.01567205, -0.5698797, 4.049572, 1, 1, 1, 1, 1,
0.01822621, 0.3430724, -0.5687322, 1, 1, 1, 1, 1,
0.01925977, 0.9875142, -1.1894, 1, 1, 1, 1, 1,
0.0217381, 0.8750025, -1.003052, 1, 1, 1, 1, 1,
0.02233224, -1.288891, 3.120191, 1, 1, 1, 1, 1,
0.03147559, -1.181924, 1.826857, 1, 1, 1, 1, 1,
0.03298018, -0.3807585, 3.037593, 1, 1, 1, 1, 1,
0.03310176, 0.02087045, 0.7714441, 1, 1, 1, 1, 1,
0.03573041, -0.4079507, 3.406806, 1, 1, 1, 1, 1,
0.03838553, -0.1666835, 2.662912, 1, 1, 1, 1, 1,
0.03990073, -0.4108996, 4.927138, 0, 0, 1, 1, 1,
0.04517388, -1.851803, 4.954972, 1, 0, 0, 1, 1,
0.04558824, -0.555532, 4.408141, 1, 0, 0, 1, 1,
0.04813108, -0.4704109, 4.101952, 1, 0, 0, 1, 1,
0.0548658, -0.5912385, 2.197553, 1, 0, 0, 1, 1,
0.0589269, 1.093622, -0.8388634, 1, 0, 0, 1, 1,
0.06299739, -0.03522279, 2.909993, 0, 0, 0, 1, 1,
0.06462095, -2.557892, 2.640108, 0, 0, 0, 1, 1,
0.06678059, 0.1619861, -0.09906522, 0, 0, 0, 1, 1,
0.07278334, -0.835386, 2.682868, 0, 0, 0, 1, 1,
0.08552925, -1.01452, 2.132392, 0, 0, 0, 1, 1,
0.0864636, 0.9387348, 1.681246, 0, 0, 0, 1, 1,
0.08656993, -1.187249, 2.471661, 0, 0, 0, 1, 1,
0.09051338, 0.8159668, 0.3862278, 1, 1, 1, 1, 1,
0.09214646, 0.4693102, -0.6710256, 1, 1, 1, 1, 1,
0.09631012, -1.668216, 5.080032, 1, 1, 1, 1, 1,
0.09885383, -1.344546, 3.634795, 1, 1, 1, 1, 1,
0.09990294, -0.4583994, 2.485821, 1, 1, 1, 1, 1,
0.1016565, 1.625943, 0.2745883, 1, 1, 1, 1, 1,
0.1162798, 1.753514, 0.6038673, 1, 1, 1, 1, 1,
0.1177145, -0.3010828, 2.789783, 1, 1, 1, 1, 1,
0.1178971, -0.7585102, 3.924833, 1, 1, 1, 1, 1,
0.1197359, -1.023586, 1.22796, 1, 1, 1, 1, 1,
0.1219545, -1.223269, 3.064647, 1, 1, 1, 1, 1,
0.1220006, -0.4648199, 3.595977, 1, 1, 1, 1, 1,
0.1244424, -0.8517783, 2.511184, 1, 1, 1, 1, 1,
0.1349775, 1.048534, 0.05555952, 1, 1, 1, 1, 1,
0.1362015, -0.549751, 2.457472, 1, 1, 1, 1, 1,
0.1378671, -1.313079, 2.480989, 0, 0, 1, 1, 1,
0.1386696, -0.5165742, 2.476195, 1, 0, 0, 1, 1,
0.1394448, -0.5940723, 2.152873, 1, 0, 0, 1, 1,
0.140379, -0.669541, 3.313257, 1, 0, 0, 1, 1,
0.1413373, -1.022444, 4.313179, 1, 0, 0, 1, 1,
0.1419715, 0.684507, 0.5183209, 1, 0, 0, 1, 1,
0.1421973, -0.7646982, 0.1660898, 0, 0, 0, 1, 1,
0.1423927, 0.8655551, -1.623047, 0, 0, 0, 1, 1,
0.1471908, 0.1862361, -0.7733553, 0, 0, 0, 1, 1,
0.1482194, -0.226952, 2.424965, 0, 0, 0, 1, 1,
0.1564016, -1.186572, 2.121411, 0, 0, 0, 1, 1,
0.156984, -1.199737, 2.586746, 0, 0, 0, 1, 1,
0.1598146, -0.02874515, 0.1498593, 0, 0, 0, 1, 1,
0.166417, -0.8221087, 4.521302, 1, 1, 1, 1, 1,
0.1676585, 0.6347001, 3.174693, 1, 1, 1, 1, 1,
0.170302, -1.092372, 3.335098, 1, 1, 1, 1, 1,
0.1778035, -0.6354093, 3.629033, 1, 1, 1, 1, 1,
0.178037, 0.6861768, -1.041668, 1, 1, 1, 1, 1,
0.1783588, 0.3525934, 1.912892, 1, 1, 1, 1, 1,
0.1871817, 1.406652, 0.03382853, 1, 1, 1, 1, 1,
0.1879711, -0.7886211, 3.188274, 1, 1, 1, 1, 1,
0.1890375, -1.575455, 2.912165, 1, 1, 1, 1, 1,
0.1943707, 1.374058, 0.5757886, 1, 1, 1, 1, 1,
0.1959837, -0.1347758, 1.340843, 1, 1, 1, 1, 1,
0.1961282, 0.5906897, 1.074607, 1, 1, 1, 1, 1,
0.1976633, -0.2828574, 2.735334, 1, 1, 1, 1, 1,
0.1981752, 0.05841888, 1.346234, 1, 1, 1, 1, 1,
0.1983076, -0.1046252, 1.616339, 1, 1, 1, 1, 1,
0.2019719, -0.03435479, 2.028118, 0, 0, 1, 1, 1,
0.2028917, -0.5074688, 4.693034, 1, 0, 0, 1, 1,
0.2052812, -0.1906702, 2.283663, 1, 0, 0, 1, 1,
0.2095046, 1.404378, 0.01604433, 1, 0, 0, 1, 1,
0.2103217, -1.038428, 2.256523, 1, 0, 0, 1, 1,
0.2178108, 0.14669, 0.1882218, 1, 0, 0, 1, 1,
0.2183743, -0.4586887, 2.659426, 0, 0, 0, 1, 1,
0.2196611, 1.519309, 0.2341735, 0, 0, 0, 1, 1,
0.2221657, -1.002555, 3.74334, 0, 0, 0, 1, 1,
0.2233072, -0.09199894, 1.50412, 0, 0, 0, 1, 1,
0.2240174, 0.9933463, 0.8475563, 0, 0, 0, 1, 1,
0.2253079, 1.306375, -1.109142, 0, 0, 0, 1, 1,
0.2259012, 1.061539, 0.7068079, 0, 0, 0, 1, 1,
0.22866, -1.036994, 0.5975294, 1, 1, 1, 1, 1,
0.2314977, 0.9431922, -1.245291, 1, 1, 1, 1, 1,
0.231643, -1.749815, 5.138436, 1, 1, 1, 1, 1,
0.2321325, 0.00721311, 0.9828749, 1, 1, 1, 1, 1,
0.2372199, 0.9942625, -1.070778, 1, 1, 1, 1, 1,
0.2377258, 0.1626852, -0.3927788, 1, 1, 1, 1, 1,
0.2384006, -0.6780753, 2.466233, 1, 1, 1, 1, 1,
0.2394343, -0.5012516, 4.73285, 1, 1, 1, 1, 1,
0.2417493, 1.497047, 0.3368184, 1, 1, 1, 1, 1,
0.2430376, -0.0885809, 2.591264, 1, 1, 1, 1, 1,
0.2461443, -0.4609347, 3.297229, 1, 1, 1, 1, 1,
0.2498358, -2.029466, 2.700674, 1, 1, 1, 1, 1,
0.2549616, -0.07318471, 2.083164, 1, 1, 1, 1, 1,
0.2558123, 0.3056529, 0.9602095, 1, 1, 1, 1, 1,
0.2606545, -0.9005783, 3.338063, 1, 1, 1, 1, 1,
0.2642866, -0.5193115, 2.934858, 0, 0, 1, 1, 1,
0.2650275, -0.817809, 2.265008, 1, 0, 0, 1, 1,
0.2676851, 0.3262038, 1.708193, 1, 0, 0, 1, 1,
0.2715319, 0.1508865, 0.3828476, 1, 0, 0, 1, 1,
0.2743793, 2.1981, 0.7745731, 1, 0, 0, 1, 1,
0.2785998, -0.9452659, 3.449597, 1, 0, 0, 1, 1,
0.2789453, -1.546338, 0.7539456, 0, 0, 0, 1, 1,
0.2789519, 0.1286097, -0.857324, 0, 0, 0, 1, 1,
0.2798688, -0.6291177, 2.265502, 0, 0, 0, 1, 1,
0.281083, -0.43205, 2.699073, 0, 0, 0, 1, 1,
0.2812674, 0.1287911, 0.04198198, 0, 0, 0, 1, 1,
0.2829047, -0.3304485, 3.933216, 0, 0, 0, 1, 1,
0.2842321, -0.886672, 3.224057, 0, 0, 0, 1, 1,
0.2843525, -0.2485269, 3.927343, 1, 1, 1, 1, 1,
0.2845103, -0.1286387, -0.1693098, 1, 1, 1, 1, 1,
0.2874112, -0.185697, 4.135971, 1, 1, 1, 1, 1,
0.2894769, 0.3468747, 2.368515, 1, 1, 1, 1, 1,
0.2900844, -0.1338871, 2.726561, 1, 1, 1, 1, 1,
0.2903488, 0.3663865, 0.6441805, 1, 1, 1, 1, 1,
0.2921287, 4.021737, 0.9032819, 1, 1, 1, 1, 1,
0.292705, 0.5693449, 1.878327, 1, 1, 1, 1, 1,
0.2944026, 0.2068346, 1.067043, 1, 1, 1, 1, 1,
0.2963745, -1.715746, 2.890134, 1, 1, 1, 1, 1,
0.296604, 0.6297349, -0.1931791, 1, 1, 1, 1, 1,
0.2968906, 1.720278, 1.297853, 1, 1, 1, 1, 1,
0.2987513, 1.335394, 0.7605613, 1, 1, 1, 1, 1,
0.3046709, 0.7190057, -0.2237521, 1, 1, 1, 1, 1,
0.306151, 0.1637252, 1.642324, 1, 1, 1, 1, 1,
0.3063484, 2.310247, 0.4232642, 0, 0, 1, 1, 1,
0.3114915, 0.6193975, -0.9544118, 1, 0, 0, 1, 1,
0.3135235, -1.276029, 3.985122, 1, 0, 0, 1, 1,
0.3184532, -0.8483869, 2.380573, 1, 0, 0, 1, 1,
0.3200018, -1.761905, 1.997549, 1, 0, 0, 1, 1,
0.3222494, 0.3102739, 1.801363, 1, 0, 0, 1, 1,
0.3236234, 0.07934001, 2.173112, 0, 0, 0, 1, 1,
0.3291596, 0.1736489, 0.9081575, 0, 0, 0, 1, 1,
0.3293515, 1.231837, 0.8147191, 0, 0, 0, 1, 1,
0.3397305, -0.1028735, 2.51152, 0, 0, 0, 1, 1,
0.3402582, -1.068384, 2.004419, 0, 0, 0, 1, 1,
0.3409218, 1.070515, -0.3341187, 0, 0, 0, 1, 1,
0.3528839, 0.7319068, 1.420799, 0, 0, 0, 1, 1,
0.354709, 0.6329395, 0.7175878, 1, 1, 1, 1, 1,
0.3551073, -0.8341463, 2.523508, 1, 1, 1, 1, 1,
0.3590668, 0.7180567, 0.8544475, 1, 1, 1, 1, 1,
0.3601954, -0.1558254, 2.044095, 1, 1, 1, 1, 1,
0.3652216, -0.7044006, 2.304537, 1, 1, 1, 1, 1,
0.3652671, 1.041648, -0.2300992, 1, 1, 1, 1, 1,
0.3671078, -1.50771, 3.468528, 1, 1, 1, 1, 1,
0.3705618, 0.701961, -0.1372217, 1, 1, 1, 1, 1,
0.3714054, -0.4989146, 4.247659, 1, 1, 1, 1, 1,
0.3720322, -0.7859577, 1.833742, 1, 1, 1, 1, 1,
0.3738441, 1.870542, 2.172106, 1, 1, 1, 1, 1,
0.3774478, -0.9731979, 3.339936, 1, 1, 1, 1, 1,
0.3790819, -0.7614976, 1.941947, 1, 1, 1, 1, 1,
0.3817258, 1.817397, -0.9670708, 1, 1, 1, 1, 1,
0.3844091, 0.2039798, 2.545286, 1, 1, 1, 1, 1,
0.3908318, -0.3860757, 2.866693, 0, 0, 1, 1, 1,
0.3956966, 0.9383193, 1.859218, 1, 0, 0, 1, 1,
0.3985616, 0.0424209, 1.525501, 1, 0, 0, 1, 1,
0.3991401, 0.1377327, 0.4813243, 1, 0, 0, 1, 1,
0.4006159, -1.013267, 3.249216, 1, 0, 0, 1, 1,
0.404071, -0.9089845, 2.932044, 1, 0, 0, 1, 1,
0.4048365, -0.3046941, 3.115536, 0, 0, 0, 1, 1,
0.414645, 1.239622, 1.10919, 0, 0, 0, 1, 1,
0.4147191, -0.4917505, 2.251761, 0, 0, 0, 1, 1,
0.4150369, -0.9262309, 4.101515, 0, 0, 0, 1, 1,
0.4237896, -1.366186, 1.695514, 0, 0, 0, 1, 1,
0.4244722, -0.06308173, 1.190449, 0, 0, 0, 1, 1,
0.4275152, -0.3427435, 2.565272, 0, 0, 0, 1, 1,
0.4295082, 1.462819, 0.1554347, 1, 1, 1, 1, 1,
0.4341884, -2.159275, 1.480783, 1, 1, 1, 1, 1,
0.4389158, -1.055164, 2.114394, 1, 1, 1, 1, 1,
0.4405296, -0.6753646, 2.782734, 1, 1, 1, 1, 1,
0.4408351, -0.6689842, 3.981402, 1, 1, 1, 1, 1,
0.4414409, -1.518476, 3.031914, 1, 1, 1, 1, 1,
0.4505666, 1.428057, 0.1654499, 1, 1, 1, 1, 1,
0.4517009, -0.126591, 1.550353, 1, 1, 1, 1, 1,
0.4554593, 0.5389976, 0.2752883, 1, 1, 1, 1, 1,
0.4566922, -0.1405943, 2.494191, 1, 1, 1, 1, 1,
0.4572652, 0.4995211, 0.9317025, 1, 1, 1, 1, 1,
0.4577959, 0.3767208, 1.736671, 1, 1, 1, 1, 1,
0.4586098, 0.6819407, -0.05763167, 1, 1, 1, 1, 1,
0.4616483, 0.8585589, -0.73334, 1, 1, 1, 1, 1,
0.4617773, 1.126412, -0.5714456, 1, 1, 1, 1, 1,
0.4718724, -0.09375523, 3.253162, 0, 0, 1, 1, 1,
0.4742777, 0.3055536, 0.462119, 1, 0, 0, 1, 1,
0.4766617, 0.2106779, 1.072594, 1, 0, 0, 1, 1,
0.4770362, 0.7991188, 0.2640288, 1, 0, 0, 1, 1,
0.4815175, -0.5817149, 1.817375, 1, 0, 0, 1, 1,
0.4829035, 0.1886895, 0.3805263, 1, 0, 0, 1, 1,
0.4871342, 1.363808, 1.886577, 0, 0, 0, 1, 1,
0.4879937, 0.2786554, 0.2426715, 0, 0, 0, 1, 1,
0.4883399, -1.78044, 3.28125, 0, 0, 0, 1, 1,
0.4915752, 0.6112422, 0.02673126, 0, 0, 0, 1, 1,
0.4928621, -0.1138859, -0.3415585, 0, 0, 0, 1, 1,
0.4953575, -0.3501884, 0.9697475, 0, 0, 0, 1, 1,
0.4964597, -0.7720718, 1.576559, 0, 0, 0, 1, 1,
0.5012215, 0.1559599, 3.612766, 1, 1, 1, 1, 1,
0.5037227, -2.284039, 3.269882, 1, 1, 1, 1, 1,
0.5050806, 0.06918173, 1.165696, 1, 1, 1, 1, 1,
0.5064005, 0.3050668, 0.2911263, 1, 1, 1, 1, 1,
0.5070356, -1.409714, 3.819432, 1, 1, 1, 1, 1,
0.5072086, -0.4751205, 2.663697, 1, 1, 1, 1, 1,
0.5126216, -0.05474621, 2.257766, 1, 1, 1, 1, 1,
0.5181752, 2.319748, 0.3218204, 1, 1, 1, 1, 1,
0.5197832, 0.793809, 0.4883732, 1, 1, 1, 1, 1,
0.5244421, -0.6469664, 2.470229, 1, 1, 1, 1, 1,
0.5256614, -0.5658137, 1.576437, 1, 1, 1, 1, 1,
0.5283934, 0.4871053, 1.508489, 1, 1, 1, 1, 1,
0.5305237, 0.9629894, 0.9721194, 1, 1, 1, 1, 1,
0.5309212, -0.63783, 3.219787, 1, 1, 1, 1, 1,
0.5364884, -1.231673, 2.593445, 1, 1, 1, 1, 1,
0.5389351, -1.006716, 2.289713, 0, 0, 1, 1, 1,
0.5425643, 1.666915, -0.3147111, 1, 0, 0, 1, 1,
0.5485206, -0.01580025, 1.920955, 1, 0, 0, 1, 1,
0.5488162, 0.6479852, 1.43694, 1, 0, 0, 1, 1,
0.5503189, -1.409235, 2.976464, 1, 0, 0, 1, 1,
0.5503216, 0.2101917, 2.792583, 1, 0, 0, 1, 1,
0.5503954, 1.985202, 0.8420092, 0, 0, 0, 1, 1,
0.5540454, -2.245086, 3.072675, 0, 0, 0, 1, 1,
0.558157, -0.9899575, 0.4309376, 0, 0, 0, 1, 1,
0.5595089, -1.06514, 3.931665, 0, 0, 0, 1, 1,
0.5608934, -1.167384, 1.410937, 0, 0, 0, 1, 1,
0.5614237, -0.3929983, 1.969204, 0, 0, 0, 1, 1,
0.5615856, -1.083522, 3.502085, 0, 0, 0, 1, 1,
0.5619228, -1.082657, 3.91776, 1, 1, 1, 1, 1,
0.5658643, -1.245756, 1.828361, 1, 1, 1, 1, 1,
0.568693, 0.9022207, 0.8190185, 1, 1, 1, 1, 1,
0.5701514, 2.176877, 0.03806001, 1, 1, 1, 1, 1,
0.5710431, 0.2206831, 1.298141, 1, 1, 1, 1, 1,
0.5715281, 0.6898811, 1.41157, 1, 1, 1, 1, 1,
0.572427, -0.9741018, 3.511652, 1, 1, 1, 1, 1,
0.5763393, 0.09921709, 1.239299, 1, 1, 1, 1, 1,
0.5771638, -0.6134255, 3.128731, 1, 1, 1, 1, 1,
0.5795858, 0.5106732, 1.75869, 1, 1, 1, 1, 1,
0.5811151, 1.509403, 1.631165, 1, 1, 1, 1, 1,
0.5850335, 0.07281344, 0.750299, 1, 1, 1, 1, 1,
0.5880483, 0.601383, -0.7884883, 1, 1, 1, 1, 1,
0.5922149, 1.905165, 0.427235, 1, 1, 1, 1, 1,
0.5922431, 0.7745953, 0.128438, 1, 1, 1, 1, 1,
0.5924081, 0.1999862, 1.301493, 0, 0, 1, 1, 1,
0.5927516, 2.071789, 1.244044, 1, 0, 0, 1, 1,
0.5946511, -0.01301815, 0.4507273, 1, 0, 0, 1, 1,
0.5953039, -0.2083578, 0.4599045, 1, 0, 0, 1, 1,
0.5990955, -0.3315352, 0.9135101, 1, 0, 0, 1, 1,
0.5994989, -0.6759385, 2.400873, 1, 0, 0, 1, 1,
0.6022657, 1.624116, 1.044105, 0, 0, 0, 1, 1,
0.6028846, 0.0107785, 2.439432, 0, 0, 0, 1, 1,
0.6035303, -0.03090132, 1.448765, 0, 0, 0, 1, 1,
0.6045515, 1.836669, -0.6622844, 0, 0, 0, 1, 1,
0.6069192, 0.9153728, 0.4494114, 0, 0, 0, 1, 1,
0.6105568, -0.08161453, 1.392453, 0, 0, 0, 1, 1,
0.614437, 0.6868248, 1.566356, 0, 0, 0, 1, 1,
0.6168455, 0.8953608, 1.502866, 1, 1, 1, 1, 1,
0.6185321, -0.6633042, 2.746637, 1, 1, 1, 1, 1,
0.6226884, -0.2511451, 2.665848, 1, 1, 1, 1, 1,
0.6277002, -0.03880769, 1.989222, 1, 1, 1, 1, 1,
0.6280395, -0.9172948, 1.733975, 1, 1, 1, 1, 1,
0.6310665, -0.2357221, 1.385755, 1, 1, 1, 1, 1,
0.6342039, 0.2521676, 1.38746, 1, 1, 1, 1, 1,
0.6344872, 1.298739, -0.6196936, 1, 1, 1, 1, 1,
0.6346548, 0.3106541, 1.881612, 1, 1, 1, 1, 1,
0.635208, 0.1076067, 1.131606, 1, 1, 1, 1, 1,
0.6371076, -1.827009, 2.728264, 1, 1, 1, 1, 1,
0.6388793, -0.9530142, 1.693775, 1, 1, 1, 1, 1,
0.6390211, -0.7169346, 1.829705, 1, 1, 1, 1, 1,
0.6392027, 1.426776, 0.3126872, 1, 1, 1, 1, 1,
0.6418297, -0.9128408, 2.006144, 1, 1, 1, 1, 1,
0.6428069, -0.1955856, 3.427458, 0, 0, 1, 1, 1,
0.6448752, -0.7601477, 3.253556, 1, 0, 0, 1, 1,
0.6465971, 0.1677376, 2.030589, 1, 0, 0, 1, 1,
0.6481693, -1.042966, 1.330589, 1, 0, 0, 1, 1,
0.6487016, -0.3627065, 2.784575, 1, 0, 0, 1, 1,
0.6494673, 0.471059, 0.857188, 1, 0, 0, 1, 1,
0.6613217, 0.02986895, 0.8065443, 0, 0, 0, 1, 1,
0.6660388, 0.04055788, 2.812464, 0, 0, 0, 1, 1,
0.6660641, -1.40997, 1.390429, 0, 0, 0, 1, 1,
0.6684919, -0.9689425, 1.979225, 0, 0, 0, 1, 1,
0.6859846, 0.4302386, 1.809521, 0, 0, 0, 1, 1,
0.696898, 1.083576, -0.4725719, 0, 0, 0, 1, 1,
0.7014456, -2.299388, 2.580671, 0, 0, 0, 1, 1,
0.7072861, -1.202605, 2.995173, 1, 1, 1, 1, 1,
0.7090797, -0.2935222, 1.854176, 1, 1, 1, 1, 1,
0.709663, -1.011523, 1.640033, 1, 1, 1, 1, 1,
0.7098777, 2.886373, 1.103023, 1, 1, 1, 1, 1,
0.7153386, -0.350481, 3.264803, 1, 1, 1, 1, 1,
0.7162498, 1.003904, -0.8087008, 1, 1, 1, 1, 1,
0.7178437, 0.276128, 1.285242, 1, 1, 1, 1, 1,
0.7197856, 0.3992238, 2.037739, 1, 1, 1, 1, 1,
0.7280262, 1.232532, 0.4945166, 1, 1, 1, 1, 1,
0.7369444, -0.7504175, 2.446067, 1, 1, 1, 1, 1,
0.7395496, 1.167673, 0.3779717, 1, 1, 1, 1, 1,
0.7464252, -1.525715, 3.604875, 1, 1, 1, 1, 1,
0.7475241, -0.4357275, 0.5635508, 1, 1, 1, 1, 1,
0.7523821, -0.640104, 1.390386, 1, 1, 1, 1, 1,
0.7534135, 0.377796, 1.601489, 1, 1, 1, 1, 1,
0.7784856, -0.5471959, 2.583107, 0, 0, 1, 1, 1,
0.781288, -0.1117315, 1.42692, 1, 0, 0, 1, 1,
0.7874561, 0.7115231, 0.4246992, 1, 0, 0, 1, 1,
0.7914201, -2.131952, 2.654469, 1, 0, 0, 1, 1,
0.7942338, -0.07412554, 3.49055, 1, 0, 0, 1, 1,
0.7985361, 1.076721, -1.434408, 1, 0, 0, 1, 1,
0.8069945, 0.7380778, 1.682516, 0, 0, 0, 1, 1,
0.8093572, -0.07671262, 0.7740853, 0, 0, 0, 1, 1,
0.8122054, -0.3341605, 1.733599, 0, 0, 0, 1, 1,
0.8122241, 0.6581172, 1.185548, 0, 0, 0, 1, 1,
0.8125629, -2.290134, 2.509058, 0, 0, 0, 1, 1,
0.8132843, -0.08100872, 1.395306, 0, 0, 0, 1, 1,
0.8137968, 2.739213, -0.1530929, 0, 0, 0, 1, 1,
0.8156094, 0.2112773, 1.207563, 1, 1, 1, 1, 1,
0.8164531, -0.06442806, 3.026205, 1, 1, 1, 1, 1,
0.8228443, 0.7598127, -0.9036546, 1, 1, 1, 1, 1,
0.8303881, 0.5142791, -0.8072667, 1, 1, 1, 1, 1,
0.8333572, 1.396537, 1.313893, 1, 1, 1, 1, 1,
0.8397272, 0.5385005, 1.445836, 1, 1, 1, 1, 1,
0.8442476, -0.05119415, 2.523886, 1, 1, 1, 1, 1,
0.8465835, -0.3135699, 1.407369, 1, 1, 1, 1, 1,
0.8497295, 0.07198048, 1.01333, 1, 1, 1, 1, 1,
0.8546718, 1.952899, 2.068371, 1, 1, 1, 1, 1,
0.8551008, 0.9693734, 0.06277725, 1, 1, 1, 1, 1,
0.8554382, 1.512879, 0.9166632, 1, 1, 1, 1, 1,
0.8655063, -0.2731151, 2.564855, 1, 1, 1, 1, 1,
0.8683791, 1.848696, 0.4145154, 1, 1, 1, 1, 1,
0.8718084, 0.8736464, 0.7803282, 1, 1, 1, 1, 1,
0.8718108, 0.09380486, 0.855119, 0, 0, 1, 1, 1,
0.8733428, -1.395727, 2.304149, 1, 0, 0, 1, 1,
0.8770927, 1.156782, 1.082616, 1, 0, 0, 1, 1,
0.8775372, 1.690655, -0.2888597, 1, 0, 0, 1, 1,
0.8793754, 0.00306443, 1.827248, 1, 0, 0, 1, 1,
0.8803481, 0.9132789, 1.264143, 1, 0, 0, 1, 1,
0.8854784, 1.446453, 1.228609, 0, 0, 0, 1, 1,
0.8867851, -0.9780619, 2.855243, 0, 0, 0, 1, 1,
0.8868943, -0.4140642, 1.817268, 0, 0, 0, 1, 1,
0.8916935, -0.1877932, 1.842019, 0, 0, 0, 1, 1,
0.892379, 0.05204612, 0.838815, 0, 0, 0, 1, 1,
0.8950393, -1.637717, 2.703067, 0, 0, 0, 1, 1,
0.8976318, -0.3034941, 2.367498, 0, 0, 0, 1, 1,
0.9018649, -0.3357319, 2.393456, 1, 1, 1, 1, 1,
0.9026579, -1.478388, 2.111676, 1, 1, 1, 1, 1,
0.9065849, 0.2324054, 1.638492, 1, 1, 1, 1, 1,
0.9105907, -1.2575, 1.727112, 1, 1, 1, 1, 1,
0.9208696, 0.08037192, 2.061288, 1, 1, 1, 1, 1,
0.9262247, 0.04785748, 2.844647, 1, 1, 1, 1, 1,
0.9279906, -0.352097, 1.966792, 1, 1, 1, 1, 1,
0.9369144, 0.8004687, 2.73663, 1, 1, 1, 1, 1,
0.9379232, -0.5436481, 1.36732, 1, 1, 1, 1, 1,
0.9430408, -0.3178153, 3.595373, 1, 1, 1, 1, 1,
0.9474207, -0.9193205, 1.249096, 1, 1, 1, 1, 1,
0.9548275, -0.3419267, 2.858282, 1, 1, 1, 1, 1,
0.9551904, 0.8790257, 0.1325241, 1, 1, 1, 1, 1,
0.9553857, 0.505229, 0.6452678, 1, 1, 1, 1, 1,
0.9562573, -0.8375157, 3.250873, 1, 1, 1, 1, 1,
0.9597452, 0.6282888, 1.532274, 0, 0, 1, 1, 1,
0.9630259, -0.1998978, 2.326486, 1, 0, 0, 1, 1,
0.966046, -0.780596, 2.407615, 1, 0, 0, 1, 1,
0.9776419, -0.4733825, 2.362985, 1, 0, 0, 1, 1,
0.981154, -1.597015, 1.05284, 1, 0, 0, 1, 1,
0.9873717, -0.02087692, 0.4858456, 1, 0, 0, 1, 1,
0.989068, 0.5238666, 0.1433398, 0, 0, 0, 1, 1,
0.9923891, -0.2766755, 1.539343, 0, 0, 0, 1, 1,
0.9970814, 0.8534788, 1.11787, 0, 0, 0, 1, 1,
0.9983541, -0.6023813, 0.6907575, 0, 0, 0, 1, 1,
0.9984207, 0.5532728, -0.2574241, 0, 0, 0, 1, 1,
1.002737, -1.117628, 1.681855, 0, 0, 0, 1, 1,
1.010501, 1.346564, 1.064377, 0, 0, 0, 1, 1,
1.013246, 1.957835, 1.368938, 1, 1, 1, 1, 1,
1.013356, 0.1994809, 2.776069, 1, 1, 1, 1, 1,
1.016579, 0.4053648, 1.73957, 1, 1, 1, 1, 1,
1.016911, -0.5650181, 1.425509, 1, 1, 1, 1, 1,
1.02267, -0.8186703, 2.194651, 1, 1, 1, 1, 1,
1.026165, 1.277459, 1.44736, 1, 1, 1, 1, 1,
1.027864, -0.6389669, 2.825542, 1, 1, 1, 1, 1,
1.030826, -1.001143, 1.223789, 1, 1, 1, 1, 1,
1.043776, 0.2439791, 1.372973, 1, 1, 1, 1, 1,
1.048899, 0.6470765, 0.7191702, 1, 1, 1, 1, 1,
1.049117, -0.009459218, -0.632971, 1, 1, 1, 1, 1,
1.058967, -0.2601305, 1.312738, 1, 1, 1, 1, 1,
1.061791, 0.1465271, 1.599763, 1, 1, 1, 1, 1,
1.076228, -0.01712799, 0.8603528, 1, 1, 1, 1, 1,
1.079538, 0.2166875, 2.686535, 1, 1, 1, 1, 1,
1.085738, 3.64728, -0.8336033, 0, 0, 1, 1, 1,
1.090439, -0.3403755, 1.517004, 1, 0, 0, 1, 1,
1.093172, -0.4283676, 1.564404, 1, 0, 0, 1, 1,
1.09626, -0.9840936, 3.777, 1, 0, 0, 1, 1,
1.100465, -0.9494438, 3.488776, 1, 0, 0, 1, 1,
1.107742, 0.2971583, 0.1962994, 1, 0, 0, 1, 1,
1.12252, -0.1323477, 2.148831, 0, 0, 0, 1, 1,
1.124272, 0.476081, 1.399826, 0, 0, 0, 1, 1,
1.135847, 0.03877313, 1.703868, 0, 0, 0, 1, 1,
1.142165, 0.5057056, 0.2436493, 0, 0, 0, 1, 1,
1.144924, 0.6519607, 0.7937996, 0, 0, 0, 1, 1,
1.150152, -0.4167271, 2.957059, 0, 0, 0, 1, 1,
1.152447, -0.009626526, 3.067981, 0, 0, 0, 1, 1,
1.154053, -0.7015015, -0.04022023, 1, 1, 1, 1, 1,
1.155213, -0.7379089, 2.180685, 1, 1, 1, 1, 1,
1.160492, -0.3607519, 1.899366, 1, 1, 1, 1, 1,
1.164966, -0.133278, 1.854864, 1, 1, 1, 1, 1,
1.165636, 0.1177862, 1.781623, 1, 1, 1, 1, 1,
1.166246, -0.5979135, 3.168995, 1, 1, 1, 1, 1,
1.16956, -1.670297, 4.128714, 1, 1, 1, 1, 1,
1.177228, 2.644272, 0.2258903, 1, 1, 1, 1, 1,
1.182874, -0.7842259, 2.251382, 1, 1, 1, 1, 1,
1.183602, 0.9944739, -0.5760822, 1, 1, 1, 1, 1,
1.186851, -1.012537, 2.046573, 1, 1, 1, 1, 1,
1.188558, -0.3229995, 0.02288975, 1, 1, 1, 1, 1,
1.189885, 1.864297, -0.6354064, 1, 1, 1, 1, 1,
1.190443, 1.425762, -2.464152, 1, 1, 1, 1, 1,
1.193712, 0.2862146, 2.465266, 1, 1, 1, 1, 1,
1.196158, -1.71443, 2.912858, 0, 0, 1, 1, 1,
1.202486, -0.7671536, 0.1907114, 1, 0, 0, 1, 1,
1.224378, 0.08667086, 2.247337, 1, 0, 0, 1, 1,
1.231547, -0.5581855, 1.495553, 1, 0, 0, 1, 1,
1.232697, -0.3148313, 1.525102, 1, 0, 0, 1, 1,
1.262871, 1.488854, 0.4317528, 1, 0, 0, 1, 1,
1.276192, -0.6337384, 0.5480395, 0, 0, 0, 1, 1,
1.30091, 2.891491, 0.2900839, 0, 0, 0, 1, 1,
1.302907, 0.2541413, 2.930388, 0, 0, 0, 1, 1,
1.312641, -1.086234, 1.197452, 0, 0, 0, 1, 1,
1.312747, 0.3893771, 2.54881, 0, 0, 0, 1, 1,
1.314255, -2.197673, 1.767939, 0, 0, 0, 1, 1,
1.315636, 2.442362, 0.4819871, 0, 0, 0, 1, 1,
1.321049, -1.752898, 2.199567, 1, 1, 1, 1, 1,
1.323628, -0.7058345, 2.184869, 1, 1, 1, 1, 1,
1.329057, 2.457907, 0.7590707, 1, 1, 1, 1, 1,
1.329137, 0.6409336, 0.2024065, 1, 1, 1, 1, 1,
1.336789, 0.06854935, 3.063524, 1, 1, 1, 1, 1,
1.337828, 0.180996, 1.056621, 1, 1, 1, 1, 1,
1.340825, 0.09728348, 2.655207, 1, 1, 1, 1, 1,
1.342631, 0.2278, 1.348677, 1, 1, 1, 1, 1,
1.352933, 0.03785976, 1.225465, 1, 1, 1, 1, 1,
1.355098, 0.4623531, 1.269253, 1, 1, 1, 1, 1,
1.356842, -0.1868481, 1.231946, 1, 1, 1, 1, 1,
1.356934, -0.2246934, 3.003015, 1, 1, 1, 1, 1,
1.357235, -0.2584219, 0.3800189, 1, 1, 1, 1, 1,
1.3629, -0.3048499, 1.863453, 1, 1, 1, 1, 1,
1.367261, 0.4030671, 2.712338, 1, 1, 1, 1, 1,
1.377165, 0.7413899, 1.949889, 0, 0, 1, 1, 1,
1.384935, 1.914448, 1.103181, 1, 0, 0, 1, 1,
1.38648, -0.6722538, 4.12104, 1, 0, 0, 1, 1,
1.388023, 0.2326892, 0.9983397, 1, 0, 0, 1, 1,
1.388165, -0.7772165, 3.360617, 1, 0, 0, 1, 1,
1.4002, 0.1616022, -1.01171, 1, 0, 0, 1, 1,
1.406891, -0.7135859, 1.44435, 0, 0, 0, 1, 1,
1.424786, 0.7485281, 0.8954965, 0, 0, 0, 1, 1,
1.425487, -0.03068086, 0.7066096, 0, 0, 0, 1, 1,
1.426531, -0.4858555, 1.556998, 0, 0, 0, 1, 1,
1.428077, 1.130296, -0.7816917, 0, 0, 0, 1, 1,
1.429033, 1.085864, 0.6277398, 0, 0, 0, 1, 1,
1.431165, -0.4916647, 2.560675, 0, 0, 0, 1, 1,
1.450987, 0.839655, 0.1831754, 1, 1, 1, 1, 1,
1.456, -0.07521367, 1.495351, 1, 1, 1, 1, 1,
1.467677, 0.05980569, 2.383162, 1, 1, 1, 1, 1,
1.467906, 1.043385, 1.060798, 1, 1, 1, 1, 1,
1.475829, 0.4582341, 2.350195, 1, 1, 1, 1, 1,
1.479366, 1.163187, 1.435077, 1, 1, 1, 1, 1,
1.493881, -1.008718, 2.485915, 1, 1, 1, 1, 1,
1.495956, -2.718429, 3.69547, 1, 1, 1, 1, 1,
1.50576, 2.167208, 1.245496, 1, 1, 1, 1, 1,
1.53293, -0.378551, 3.069158, 1, 1, 1, 1, 1,
1.536205, -1.01998, 0.4462004, 1, 1, 1, 1, 1,
1.537621, -0.1727015, 0.3222336, 1, 1, 1, 1, 1,
1.544325, 0.6471208, 1.374129, 1, 1, 1, 1, 1,
1.548741, -0.685595, 0.5898759, 1, 1, 1, 1, 1,
1.55382, -0.3588661, 1.026827, 1, 1, 1, 1, 1,
1.56705, 1.037536, 1.735266, 0, 0, 1, 1, 1,
1.568072, 0.0940727, 0.578904, 1, 0, 0, 1, 1,
1.578059, 0.0728474, 2.965969, 1, 0, 0, 1, 1,
1.59445, 0.4483255, 1.01204, 1, 0, 0, 1, 1,
1.595186, -0.9386352, 2.323523, 1, 0, 0, 1, 1,
1.597526, -0.05856747, 2.224459, 1, 0, 0, 1, 1,
1.602861, -0.04896595, 1.790418, 0, 0, 0, 1, 1,
1.63138, -0.2594245, 1.759506, 0, 0, 0, 1, 1,
1.639231, 1.523007, 0.3621939, 0, 0, 0, 1, 1,
1.646195, 0.940517, 0.436983, 0, 0, 0, 1, 1,
1.65281, -1.58587, 1.79472, 0, 0, 0, 1, 1,
1.671157, 0.5491272, 0.7423694, 0, 0, 0, 1, 1,
1.684634, -0.1071479, 2.103203, 0, 0, 0, 1, 1,
1.702102, 0.1082866, 0.4376858, 1, 1, 1, 1, 1,
1.733024, -0.1713769, 0.7384598, 1, 1, 1, 1, 1,
1.752748, -0.4841262, 0.518225, 1, 1, 1, 1, 1,
1.754437, -1.028564, 2.367796, 1, 1, 1, 1, 1,
1.7677, -0.7156947, 1.385551, 1, 1, 1, 1, 1,
1.788575, 1.658477, 2.331363, 1, 1, 1, 1, 1,
1.78973, -0.06816446, 0.8414991, 1, 1, 1, 1, 1,
1.792385, -1.190262, 2.13118, 1, 1, 1, 1, 1,
1.793286, -1.131029, 3.128983, 1, 1, 1, 1, 1,
1.802629, 0.291909, 3.177248, 1, 1, 1, 1, 1,
1.803977, 0.6858296, 2.337557, 1, 1, 1, 1, 1,
1.813426, -3.001415, 3.753088, 1, 1, 1, 1, 1,
1.846214, -0.1886478, 1.024396, 1, 1, 1, 1, 1,
1.848354, -0.7402465, 2.456694, 1, 1, 1, 1, 1,
1.851551, -0.5892958, 2.539454, 1, 1, 1, 1, 1,
1.87957, 1.071509, 1.365916, 0, 0, 1, 1, 1,
1.883821, -0.8363125, 2.630722, 1, 0, 0, 1, 1,
1.892897, -2.253149, 1.317397, 1, 0, 0, 1, 1,
1.903, -0.03379461, 2.438292, 1, 0, 0, 1, 1,
1.909912, 0.7002301, 0.04153315, 1, 0, 0, 1, 1,
1.929161, -0.4125312, 1.190538, 1, 0, 0, 1, 1,
1.932372, 0.2784771, 2.210833, 0, 0, 0, 1, 1,
1.95461, 0.7450432, 2.292668, 0, 0, 0, 1, 1,
2.009297, 0.6617078, 1.000915, 0, 0, 0, 1, 1,
2.010247, -1.697951, 2.203097, 0, 0, 0, 1, 1,
2.056134, -0.339801, 0.4031888, 0, 0, 0, 1, 1,
2.114118, -0.629719, 0.3378087, 0, 0, 0, 1, 1,
2.201817, -0.3970669, 2.069331, 0, 0, 0, 1, 1,
2.234441, -1.135245, 2.678969, 1, 1, 1, 1, 1,
2.301273, -0.5257978, 1.148933, 1, 1, 1, 1, 1,
2.312662, 0.3679076, 0.5785146, 1, 1, 1, 1, 1,
2.320005, 1.36874, -1.145653, 1, 1, 1, 1, 1,
2.412612, -0.4825283, 1.103398, 1, 1, 1, 1, 1,
2.693702, 0.6855547, 1.47095, 1, 1, 1, 1, 1,
2.722209, -1.010165, 1.242635, 1, 1, 1, 1, 1
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
var radius = 9.872531;
var distance = 34.67685;
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
mvMatrix.translate( 0.1914567, -0.5101612, 0.4505959 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67685);
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
