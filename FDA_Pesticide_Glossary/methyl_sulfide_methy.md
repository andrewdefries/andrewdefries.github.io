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
-2.76635, -3.052227, -1.50694, 1, 0, 0, 1,
-2.759415, 2.384797, -0.9872206, 1, 0.007843138, 0, 1,
-2.736484, 1.211248, -3.822277, 1, 0.01176471, 0, 1,
-2.468395, 0.9484604, -1.533804, 1, 0.01960784, 0, 1,
-2.377149, 0.253438, -1.342134, 1, 0.02352941, 0, 1,
-2.338862, 0.4403426, -0.4308271, 1, 0.03137255, 0, 1,
-2.287334, -0.1797817, 0.01311502, 1, 0.03529412, 0, 1,
-2.260974, 0.7183225, -0.3325798, 1, 0.04313726, 0, 1,
-2.181344, 0.5989356, -1.258409, 1, 0.04705882, 0, 1,
-2.116405, 0.4235701, -0.8974336, 1, 0.05490196, 0, 1,
-2.111191, 1.535184, -1.192343, 1, 0.05882353, 0, 1,
-2.104139, 0.3818381, -0.8836112, 1, 0.06666667, 0, 1,
-2.064892, -1.29739, -2.737291, 1, 0.07058824, 0, 1,
-2.044707, -1.248777, -1.742313, 1, 0.07843138, 0, 1,
-2.037724, 1.11038, 0.3492849, 1, 0.08235294, 0, 1,
-2.013227, -0.5598276, -2.474029, 1, 0.09019608, 0, 1,
-2.007479, 0.4912442, -1.102378, 1, 0.09411765, 0, 1,
-1.98725, 1.226756, -0.5638728, 1, 0.1019608, 0, 1,
-1.976018, 0.4034808, -1.551921, 1, 0.1098039, 0, 1,
-1.974072, -0.643197, -3.619457, 1, 0.1137255, 0, 1,
-1.928983, -0.2475376, 1.131457, 1, 0.1215686, 0, 1,
-1.894076, 0.6051568, -0.2008419, 1, 0.1254902, 0, 1,
-1.869978, -0.9304944, -2.076682, 1, 0.1333333, 0, 1,
-1.836529, -0.1617067, -2.745126, 1, 0.1372549, 0, 1,
-1.830935, 1.479728, -2.128841, 1, 0.145098, 0, 1,
-1.825163, -0.5597895, -3.096124, 1, 0.1490196, 0, 1,
-1.810202, 0.1876336, -1.406456, 1, 0.1568628, 0, 1,
-1.791995, -1.456316, -0.8578827, 1, 0.1607843, 0, 1,
-1.781918, 0.1104786, -3.297132, 1, 0.1686275, 0, 1,
-1.775396, -0.4659199, -1.613141, 1, 0.172549, 0, 1,
-1.765525, 0.5700469, -1.825891, 1, 0.1803922, 0, 1,
-1.754079, -0.2428358, -1.093504, 1, 0.1843137, 0, 1,
-1.739037, -1.490567, -1.426865, 1, 0.1921569, 0, 1,
-1.737831, 0.9454612, 0.9958224, 1, 0.1960784, 0, 1,
-1.73672, 0.029525, -3.70116, 1, 0.2039216, 0, 1,
-1.71649, -0.3816774, 0.1336196, 1, 0.2117647, 0, 1,
-1.710054, -0.0518536, -2.947384, 1, 0.2156863, 0, 1,
-1.701886, 0.9203798, -0.5640541, 1, 0.2235294, 0, 1,
-1.692942, -0.5547372, -1.989197, 1, 0.227451, 0, 1,
-1.690112, 0.8670067, -1.414916, 1, 0.2352941, 0, 1,
-1.688017, 1.493582, -0.9519857, 1, 0.2392157, 0, 1,
-1.687013, 1.782587, -0.152839, 1, 0.2470588, 0, 1,
-1.673249, 0.6035951, -2.219428, 1, 0.2509804, 0, 1,
-1.671903, -1.939704, -3.364697, 1, 0.2588235, 0, 1,
-1.651411, -0.3316659, -1.514689, 1, 0.2627451, 0, 1,
-1.644175, -0.04595268, -2.483381, 1, 0.2705882, 0, 1,
-1.639118, 1.516104, -1.318684, 1, 0.2745098, 0, 1,
-1.629186, 0.6516603, -0.6224801, 1, 0.282353, 0, 1,
-1.607774, -0.271046, -0.4236939, 1, 0.2862745, 0, 1,
-1.580467, 0.4938813, -0.3832133, 1, 0.2941177, 0, 1,
-1.577916, -0.231289, -2.217824, 1, 0.3019608, 0, 1,
-1.557526, -1.437935, -1.852432, 1, 0.3058824, 0, 1,
-1.552285, -0.7968533, -0.3760284, 1, 0.3137255, 0, 1,
-1.548651, 1.220026, -0.8393764, 1, 0.3176471, 0, 1,
-1.538553, -0.8562119, -2.310822, 1, 0.3254902, 0, 1,
-1.535555, -2.035089, -1.841533, 1, 0.3294118, 0, 1,
-1.524412, -0.07855554, -3.176002, 1, 0.3372549, 0, 1,
-1.502447, -0.882454, -3.278111, 1, 0.3411765, 0, 1,
-1.500527, 0.7690823, -1.755351, 1, 0.3490196, 0, 1,
-1.479303, -0.5329309, -1.623072, 1, 0.3529412, 0, 1,
-1.469995, -0.7935262, -3.897692, 1, 0.3607843, 0, 1,
-1.466156, -0.06085979, -0.9097492, 1, 0.3647059, 0, 1,
-1.462644, -1.541402, -1.892051, 1, 0.372549, 0, 1,
-1.455539, 0.5590344, -1.320433, 1, 0.3764706, 0, 1,
-1.438089, 0.7658222, -0.3886207, 1, 0.3843137, 0, 1,
-1.429343, 2.034612, -0.2632489, 1, 0.3882353, 0, 1,
-1.419558, -0.4984524, -0.8634371, 1, 0.3960784, 0, 1,
-1.418905, 0.7356694, -2.031827, 1, 0.4039216, 0, 1,
-1.406297, 0.2580664, -0.6556584, 1, 0.4078431, 0, 1,
-1.394118, -0.2296419, -0.5285384, 1, 0.4156863, 0, 1,
-1.389797, -0.04484858, -0.1998287, 1, 0.4196078, 0, 1,
-1.380485, -2.120679, -2.829935, 1, 0.427451, 0, 1,
-1.363764, 0.1990411, -2.180176, 1, 0.4313726, 0, 1,
-1.345804, -1.066078, -3.627729, 1, 0.4392157, 0, 1,
-1.344361, -1.031531, -2.954684, 1, 0.4431373, 0, 1,
-1.340628, 0.5596653, 0.09868981, 1, 0.4509804, 0, 1,
-1.339851, 0.3495834, -1.52573, 1, 0.454902, 0, 1,
-1.32884, 0.3111869, -0.8146116, 1, 0.4627451, 0, 1,
-1.323798, 0.3064217, -2.386405, 1, 0.4666667, 0, 1,
-1.313548, 0.1556451, -1.056787, 1, 0.4745098, 0, 1,
-1.312844, 0.6041921, -2.104348, 1, 0.4784314, 0, 1,
-1.312785, 1.15381, -1.933277, 1, 0.4862745, 0, 1,
-1.309961, -0.390241, -1.665289, 1, 0.4901961, 0, 1,
-1.308124, 0.818929, -1.197602, 1, 0.4980392, 0, 1,
-1.305343, -0.3092616, -2.022804, 1, 0.5058824, 0, 1,
-1.297948, -0.8864964, -0.562485, 1, 0.509804, 0, 1,
-1.297471, 1.156866, -1.058612, 1, 0.5176471, 0, 1,
-1.296686, -1.606985, -2.311214, 1, 0.5215687, 0, 1,
-1.294013, 0.05662496, -0.6668246, 1, 0.5294118, 0, 1,
-1.28297, -0.9199504, -3.494047, 1, 0.5333334, 0, 1,
-1.279803, -0.8054688, -2.111078, 1, 0.5411765, 0, 1,
-1.266825, 1.043413, -1.511817, 1, 0.5450981, 0, 1,
-1.249802, 0.6520993, -0.4820367, 1, 0.5529412, 0, 1,
-1.239449, 0.793891, -1.05312, 1, 0.5568628, 0, 1,
-1.238388, 0.6817155, -1.022475, 1, 0.5647059, 0, 1,
-1.234794, -0.5239752, -2.134786, 1, 0.5686275, 0, 1,
-1.234501, 0.3236747, -1.620916, 1, 0.5764706, 0, 1,
-1.232293, 0.9296484, -3.137124, 1, 0.5803922, 0, 1,
-1.218024, 0.8815462, -0.1743443, 1, 0.5882353, 0, 1,
-1.208297, 0.2450389, -0.2424437, 1, 0.5921569, 0, 1,
-1.207834, 0.4878587, 0.3642757, 1, 0.6, 0, 1,
-1.202314, 0.5962639, -3.041179, 1, 0.6078432, 0, 1,
-1.191347, 1.051451, -0.599841, 1, 0.6117647, 0, 1,
-1.187143, -1.128945, -2.225768, 1, 0.6196079, 0, 1,
-1.181697, 0.4395088, -2.802001, 1, 0.6235294, 0, 1,
-1.179202, 0.1769302, -2.679241, 1, 0.6313726, 0, 1,
-1.17471, 1.177392, -0.2109664, 1, 0.6352941, 0, 1,
-1.174495, -0.02749978, -0.2716313, 1, 0.6431373, 0, 1,
-1.168127, 2.374864, -0.02647867, 1, 0.6470588, 0, 1,
-1.163162, 1.526563, -1.139501, 1, 0.654902, 0, 1,
-1.161232, -0.2545512, -1.72499, 1, 0.6588235, 0, 1,
-1.150909, 0.241117, -2.620254, 1, 0.6666667, 0, 1,
-1.15063, -1.062584, -4.102261, 1, 0.6705883, 0, 1,
-1.140523, 0.833432, -0.895911, 1, 0.6784314, 0, 1,
-1.137127, 0.1294647, -1.949346, 1, 0.682353, 0, 1,
-1.135975, 1.512755, 0.3402443, 1, 0.6901961, 0, 1,
-1.133139, -0.8506904, -2.388692, 1, 0.6941177, 0, 1,
-1.125951, 0.4684859, -0.5232899, 1, 0.7019608, 0, 1,
-1.12328, -0.6102927, -2.36531, 1, 0.7098039, 0, 1,
-1.116707, -0.7515674, -2.711346, 1, 0.7137255, 0, 1,
-1.111676, -0.3262638, -1.589021, 1, 0.7215686, 0, 1,
-1.109675, 0.2349231, -1.971091, 1, 0.7254902, 0, 1,
-1.1084, 2.081461, -1.069792, 1, 0.7333333, 0, 1,
-1.099298, 0.4125816, -0.1023262, 1, 0.7372549, 0, 1,
-1.095163, -0.3472307, -2.378762, 1, 0.7450981, 0, 1,
-1.093633, -0.1936669, -2.190857, 1, 0.7490196, 0, 1,
-1.090099, 1.199079, -1.130576, 1, 0.7568628, 0, 1,
-1.089067, 0.009966955, -1.087651, 1, 0.7607843, 0, 1,
-1.081046, 1.897795, -1.289355, 1, 0.7686275, 0, 1,
-1.08078, 1.065421, -0.7834479, 1, 0.772549, 0, 1,
-1.078215, 1.343387, -1.425917, 1, 0.7803922, 0, 1,
-1.07163, 0.7231234, -2.290312, 1, 0.7843137, 0, 1,
-1.071508, -1.343169, -2.014451, 1, 0.7921569, 0, 1,
-1.058798, -0.4132898, -1.862268, 1, 0.7960784, 0, 1,
-1.051859, 0.04534823, -1.368198, 1, 0.8039216, 0, 1,
-1.049414, -0.4899746, -2.100596, 1, 0.8117647, 0, 1,
-1.024683, -1.603601, -2.055246, 1, 0.8156863, 0, 1,
-1.023625, 0.6981137, -0.2661319, 1, 0.8235294, 0, 1,
-1.023283, -0.3050814, -3.632626, 1, 0.827451, 0, 1,
-1.020714, 0.7286524, -0.2287066, 1, 0.8352941, 0, 1,
-1.015611, 0.1160478, -0.8751424, 1, 0.8392157, 0, 1,
-1.013127, -2.121147, -2.982065, 1, 0.8470588, 0, 1,
-1.011734, -0.003125686, -0.1439546, 1, 0.8509804, 0, 1,
-1.008353, 0.2114149, -1.459156, 1, 0.8588235, 0, 1,
-1.00694, 0.7499964, -2.113082, 1, 0.8627451, 0, 1,
-1.004479, 1.124975, -0.127827, 1, 0.8705882, 0, 1,
-1.0012, 0.6211079, -1.099814, 1, 0.8745098, 0, 1,
-0.9962008, -1.451784, -1.481108, 1, 0.8823529, 0, 1,
-0.992067, -0.3451088, -1.334181, 1, 0.8862745, 0, 1,
-0.9914527, -1.519097, -1.355683, 1, 0.8941177, 0, 1,
-0.9836966, 0.4586634, -1.286641, 1, 0.8980392, 0, 1,
-0.9812159, -0.662405, -3.252104, 1, 0.9058824, 0, 1,
-0.975228, 0.1450713, 0.02172196, 1, 0.9137255, 0, 1,
-0.9740036, 0.2501317, -0.569099, 1, 0.9176471, 0, 1,
-0.9726758, 1.930396, 0.2798238, 1, 0.9254902, 0, 1,
-0.9724913, -0.2517529, -0.83909, 1, 0.9294118, 0, 1,
-0.9710737, -1.96876, -2.591318, 1, 0.9372549, 0, 1,
-0.9611735, 0.9494015, -0.08214756, 1, 0.9411765, 0, 1,
-0.951315, 0.3551474, -1.872571, 1, 0.9490196, 0, 1,
-0.9509098, 0.2451204, -0.4344928, 1, 0.9529412, 0, 1,
-0.9474638, 0.1686468, -0.09427672, 1, 0.9607843, 0, 1,
-0.9465978, 1.342176, -0.9707088, 1, 0.9647059, 0, 1,
-0.9459302, 0.6099091, -0.4237903, 1, 0.972549, 0, 1,
-0.9458557, -1.107072, -2.859393, 1, 0.9764706, 0, 1,
-0.9399169, -0.829418, -1.353639, 1, 0.9843137, 0, 1,
-0.9346069, 0.7138071, -1.391142, 1, 0.9882353, 0, 1,
-0.9335349, 0.5594044, -0.04076979, 1, 0.9960784, 0, 1,
-0.9329884, 0.08349958, -1.936918, 0.9960784, 1, 0, 1,
-0.9160055, 0.2036527, -1.457643, 0.9921569, 1, 0, 1,
-0.9087287, -0.392929, -3.684042, 0.9843137, 1, 0, 1,
-0.9060129, 0.3324117, -1.463819, 0.9803922, 1, 0, 1,
-0.9039941, 0.5623953, -2.159369, 0.972549, 1, 0, 1,
-0.8953519, -0.3883824, -2.008028, 0.9686275, 1, 0, 1,
-0.8894442, 0.08264489, -2.250309, 0.9607843, 1, 0, 1,
-0.8879055, 1.178379, -1.84787, 0.9568627, 1, 0, 1,
-0.8844898, 0.2053208, -0.7100596, 0.9490196, 1, 0, 1,
-0.873211, -1.586988, -2.002784, 0.945098, 1, 0, 1,
-0.8627173, 1.986957, -0.7530293, 0.9372549, 1, 0, 1,
-0.8598995, -1.065469, -4.317094, 0.9333333, 1, 0, 1,
-0.8552403, -1.053882, -3.276931, 0.9254902, 1, 0, 1,
-0.8511857, -0.1918656, -2.511596, 0.9215686, 1, 0, 1,
-0.8470732, -0.3768468, -2.064368, 0.9137255, 1, 0, 1,
-0.8446479, 1.068678, -1.200924, 0.9098039, 1, 0, 1,
-0.8435742, 0.3649732, -0.843415, 0.9019608, 1, 0, 1,
-0.8428817, 0.3768535, -1.87525, 0.8941177, 1, 0, 1,
-0.8422438, -0.5435531, -2.056674, 0.8901961, 1, 0, 1,
-0.8421358, -0.5011268, -2.540006, 0.8823529, 1, 0, 1,
-0.8411338, 0.03964613, -1.808889, 0.8784314, 1, 0, 1,
-0.8377253, -0.4987695, -0.7677203, 0.8705882, 1, 0, 1,
-0.8342624, -1.068557, -3.102423, 0.8666667, 1, 0, 1,
-0.8320972, 1.140742, 0.01051516, 0.8588235, 1, 0, 1,
-0.8245973, -1.603422, -1.394515, 0.854902, 1, 0, 1,
-0.8162712, -0.01036371, -0.05040843, 0.8470588, 1, 0, 1,
-0.8114552, -0.07558474, -1.333881, 0.8431373, 1, 0, 1,
-0.8076691, -0.6327482, -2.856338, 0.8352941, 1, 0, 1,
-0.8073956, 0.7875408, -1.36922, 0.8313726, 1, 0, 1,
-0.7974201, -1.362927, -3.233114, 0.8235294, 1, 0, 1,
-0.7950209, 0.6522095, -1.556783, 0.8196079, 1, 0, 1,
-0.7932964, 0.1977049, -2.53393, 0.8117647, 1, 0, 1,
-0.7889745, 0.7588376, -0.2721303, 0.8078431, 1, 0, 1,
-0.7875143, -0.606621, -1.646541, 0.8, 1, 0, 1,
-0.7867396, -0.2553015, -1.840865, 0.7921569, 1, 0, 1,
-0.7808648, -2.128114, -2.846837, 0.7882353, 1, 0, 1,
-0.7803509, -0.8034139, -1.054774, 0.7803922, 1, 0, 1,
-0.7782423, 0.7327582, -0.8988491, 0.7764706, 1, 0, 1,
-0.7661343, 0.2940035, 0.3765063, 0.7686275, 1, 0, 1,
-0.7652423, 0.971654, -1.306771, 0.7647059, 1, 0, 1,
-0.7636073, -0.1286796, -1.242796, 0.7568628, 1, 0, 1,
-0.7548928, -0.2090144, -0.3931226, 0.7529412, 1, 0, 1,
-0.7543561, 1.084469, 0.0746908, 0.7450981, 1, 0, 1,
-0.751658, 0.4088513, -1.127478, 0.7411765, 1, 0, 1,
-0.7511675, 0.2853487, -1.080329, 0.7333333, 1, 0, 1,
-0.7508842, -0.5281059, -1.573141, 0.7294118, 1, 0, 1,
-0.7480683, 1.070345, -0.9126594, 0.7215686, 1, 0, 1,
-0.7464055, 0.7078272, -0.9473514, 0.7176471, 1, 0, 1,
-0.7409614, 0.1954827, 0.4262388, 0.7098039, 1, 0, 1,
-0.7383378, 0.3331658, -1.458938, 0.7058824, 1, 0, 1,
-0.7358075, -1.422426, -1.082945, 0.6980392, 1, 0, 1,
-0.7341436, -1.828429, -3.544691, 0.6901961, 1, 0, 1,
-0.7282596, -1.025022, -2.045258, 0.6862745, 1, 0, 1,
-0.7215419, -0.111843, -1.746847, 0.6784314, 1, 0, 1,
-0.7099878, -0.1019616, -1.408984, 0.6745098, 1, 0, 1,
-0.7032003, 0.8978792, 0.6566293, 0.6666667, 1, 0, 1,
-0.7031146, -0.3146507, -2.292339, 0.6627451, 1, 0, 1,
-0.6997893, 0.3031182, 0.5631703, 0.654902, 1, 0, 1,
-0.6963722, -0.8176376, -3.472683, 0.6509804, 1, 0, 1,
-0.6947962, 0.9599727, -0.5652923, 0.6431373, 1, 0, 1,
-0.6932148, -0.160914, -2.34767, 0.6392157, 1, 0, 1,
-0.6922132, 0.1068474, -3.215585, 0.6313726, 1, 0, 1,
-0.6900807, 0.1166919, -2.173727, 0.627451, 1, 0, 1,
-0.6888468, -1.168862, -3.284531, 0.6196079, 1, 0, 1,
-0.6828662, 0.05805614, -0.3190024, 0.6156863, 1, 0, 1,
-0.681915, 0.3433087, 2.001973, 0.6078432, 1, 0, 1,
-0.6790634, 0.1767084, -0.8464734, 0.6039216, 1, 0, 1,
-0.6762822, 0.5065752, -0.8743074, 0.5960785, 1, 0, 1,
-0.6760065, -1.839406, -1.117859, 0.5882353, 1, 0, 1,
-0.6702151, -0.9377701, -2.676344, 0.5843138, 1, 0, 1,
-0.667412, 0.932505, -2.184864, 0.5764706, 1, 0, 1,
-0.6622285, 0.3681532, 2.49299, 0.572549, 1, 0, 1,
-0.6598809, 0.06366801, -2.764905, 0.5647059, 1, 0, 1,
-0.652341, -0.3823566, -0.8819922, 0.5607843, 1, 0, 1,
-0.6512041, -0.618526, -1.263004, 0.5529412, 1, 0, 1,
-0.6489089, -0.1892676, -0.2144794, 0.5490196, 1, 0, 1,
-0.6481841, -0.09721925, -1.780929, 0.5411765, 1, 0, 1,
-0.645013, -1.528303, -5.131605, 0.5372549, 1, 0, 1,
-0.6426662, 2.212879, 0.4327537, 0.5294118, 1, 0, 1,
-0.6415938, -1.091392, -4.064772, 0.5254902, 1, 0, 1,
-0.6369747, -1.232555, -3.816635, 0.5176471, 1, 0, 1,
-0.6292905, 0.425871, -0.4142091, 0.5137255, 1, 0, 1,
-0.6284361, -1.655512, -4.616294, 0.5058824, 1, 0, 1,
-0.6232223, 0.4086536, -0.7209797, 0.5019608, 1, 0, 1,
-0.6213728, -0.7192244, -2.348028, 0.4941176, 1, 0, 1,
-0.6204597, -0.991986, -3.378798, 0.4862745, 1, 0, 1,
-0.617179, 0.7915412, 0.1590073, 0.4823529, 1, 0, 1,
-0.6153236, 0.4760772, -1.165049, 0.4745098, 1, 0, 1,
-0.6066858, -1.47639, -2.837621, 0.4705882, 1, 0, 1,
-0.6037726, -0.1256213, -2.276052, 0.4627451, 1, 0, 1,
-0.6023355, 0.9142783, -0.3571141, 0.4588235, 1, 0, 1,
-0.5931953, 0.5082411, -0.9959067, 0.4509804, 1, 0, 1,
-0.5926763, 0.6628866, -0.7850105, 0.4470588, 1, 0, 1,
-0.5892422, 0.0446015, -1.336187, 0.4392157, 1, 0, 1,
-0.5837286, -1.00133, -2.905091, 0.4352941, 1, 0, 1,
-0.5830939, -0.0949616, -2.018483, 0.427451, 1, 0, 1,
-0.5829224, -0.8414398, -1.63233, 0.4235294, 1, 0, 1,
-0.5797594, -0.6411312, -3.588624, 0.4156863, 1, 0, 1,
-0.5747148, 0.01715196, -1.791157, 0.4117647, 1, 0, 1,
-0.5719678, -0.09582109, -1.843229, 0.4039216, 1, 0, 1,
-0.5678778, -1.472788, -0.7277163, 0.3960784, 1, 0, 1,
-0.5618678, 1.089732, -1.465576, 0.3921569, 1, 0, 1,
-0.5599942, 0.6040505, -1.147328, 0.3843137, 1, 0, 1,
-0.5599645, 0.2459359, -0.9846334, 0.3803922, 1, 0, 1,
-0.5579539, -0.05061645, -2.235625, 0.372549, 1, 0, 1,
-0.5571536, -0.5757892, -2.190007, 0.3686275, 1, 0, 1,
-0.5558458, 0.6274663, -1.550405, 0.3607843, 1, 0, 1,
-0.5536855, 0.3507023, -1.521114, 0.3568628, 1, 0, 1,
-0.5472313, 0.2467453, -0.4063073, 0.3490196, 1, 0, 1,
-0.5448444, 1.824854, -0.6926076, 0.345098, 1, 0, 1,
-0.5439995, -0.3016447, -3.14112, 0.3372549, 1, 0, 1,
-0.5410744, -1.779787, -3.198159, 0.3333333, 1, 0, 1,
-0.5330576, -0.5410493, -2.94472, 0.3254902, 1, 0, 1,
-0.531822, -0.9333848, -4.066067, 0.3215686, 1, 0, 1,
-0.5236002, 0.3423266, -2.71775, 0.3137255, 1, 0, 1,
-0.5235911, -0.3045546, -5.240735, 0.3098039, 1, 0, 1,
-0.520936, 0.06807081, -0.9866371, 0.3019608, 1, 0, 1,
-0.519287, 1.758298, 0.01359753, 0.2941177, 1, 0, 1,
-0.511773, 1.540707, -0.331802, 0.2901961, 1, 0, 1,
-0.5034924, -0.2968703, -0.5737294, 0.282353, 1, 0, 1,
-0.4985506, -1.624878, -1.856089, 0.2784314, 1, 0, 1,
-0.4980303, -0.06205121, -0.5970316, 0.2705882, 1, 0, 1,
-0.4934971, 0.1441241, -0.4782006, 0.2666667, 1, 0, 1,
-0.4918698, -0.5480501, -3.351424, 0.2588235, 1, 0, 1,
-0.4770458, -0.3951278, -2.432126, 0.254902, 1, 0, 1,
-0.4762043, -0.3999221, -3.037643, 0.2470588, 1, 0, 1,
-0.4737857, -1.239414, -1.273453, 0.2431373, 1, 0, 1,
-0.4735998, 0.2518529, 0.5921587, 0.2352941, 1, 0, 1,
-0.4734658, -0.3803238, -1.898961, 0.2313726, 1, 0, 1,
-0.4723851, -0.7129763, -2.941312, 0.2235294, 1, 0, 1,
-0.4675162, 1.034244, 0.258593, 0.2196078, 1, 0, 1,
-0.4608595, 0.2880295, -0.7444962, 0.2117647, 1, 0, 1,
-0.4592922, 0.08337955, -1.386084, 0.2078431, 1, 0, 1,
-0.4583804, 0.8137854, -1.394907, 0.2, 1, 0, 1,
-0.4523173, 1.013741, -0.8983077, 0.1921569, 1, 0, 1,
-0.4509889, 0.6052516, -0.0212566, 0.1882353, 1, 0, 1,
-0.4501934, 0.1057947, -1.487564, 0.1803922, 1, 0, 1,
-0.4462404, 0.1989007, -2.89724, 0.1764706, 1, 0, 1,
-0.4455519, 1.006379, -0.4781977, 0.1686275, 1, 0, 1,
-0.4453101, 0.8572428, 1.235227, 0.1647059, 1, 0, 1,
-0.4431261, 2.31259, 0.6512496, 0.1568628, 1, 0, 1,
-0.4376276, 1.450769, 1.619629, 0.1529412, 1, 0, 1,
-0.4329313, -0.5504886, -2.922235, 0.145098, 1, 0, 1,
-0.4296866, -1.962071, -2.039652, 0.1411765, 1, 0, 1,
-0.4284347, -2.333727, -3.781403, 0.1333333, 1, 0, 1,
-0.4274203, -1.216387, -2.732788, 0.1294118, 1, 0, 1,
-0.4273074, 0.3175225, -1.791273, 0.1215686, 1, 0, 1,
-0.426581, 0.8505538, -0.8085538, 0.1176471, 1, 0, 1,
-0.4251355, 0.7561393, -0.9780077, 0.1098039, 1, 0, 1,
-0.4237963, -0.1845329, -1.902317, 0.1058824, 1, 0, 1,
-0.4217446, 0.3393947, 0.2759577, 0.09803922, 1, 0, 1,
-0.4201949, 1.500488, 0.1816115, 0.09019608, 1, 0, 1,
-0.4184833, 0.9633706, -1.434444, 0.08627451, 1, 0, 1,
-0.4165611, 0.8506752, -0.006963102, 0.07843138, 1, 0, 1,
-0.4163462, -0.6366491, -2.056277, 0.07450981, 1, 0, 1,
-0.4112369, -1.422675, -2.760324, 0.06666667, 1, 0, 1,
-0.4081737, -0.6165189, -2.06148, 0.0627451, 1, 0, 1,
-0.4003238, 0.4658497, -1.080508, 0.05490196, 1, 0, 1,
-0.4003187, -1.797649, -2.210535, 0.05098039, 1, 0, 1,
-0.3996931, 0.3067324, -2.059462, 0.04313726, 1, 0, 1,
-0.3983186, 0.7085236, 0.1907786, 0.03921569, 1, 0, 1,
-0.3972181, -1.135119, -3.093648, 0.03137255, 1, 0, 1,
-0.3961159, 0.06784726, -0.7608852, 0.02745098, 1, 0, 1,
-0.3943211, -0.1848506, -0.4726876, 0.01960784, 1, 0, 1,
-0.390614, -1.746304, -2.707352, 0.01568628, 1, 0, 1,
-0.3895407, 1.082829, -0.728255, 0.007843138, 1, 0, 1,
-0.3894987, 0.2703651, 0.1955978, 0.003921569, 1, 0, 1,
-0.3855935, -1.027734, -2.963234, 0, 1, 0.003921569, 1,
-0.3794405, -1.293584, -2.258329, 0, 1, 0.01176471, 1,
-0.3787713, 1.104924, -0.4388503, 0, 1, 0.01568628, 1,
-0.3723814, -2.149384, -1.500204, 0, 1, 0.02352941, 1,
-0.3723805, -0.4937373, -4.991394, 0, 1, 0.02745098, 1,
-0.3720005, -0.04294268, -0.09468617, 0, 1, 0.03529412, 1,
-0.3708766, -0.8009383, -2.033118, 0, 1, 0.03921569, 1,
-0.3660918, -0.3689003, -3.521741, 0, 1, 0.04705882, 1,
-0.3659549, 0.3693386, 2.299472, 0, 1, 0.05098039, 1,
-0.3609646, 0.5143582, -2.45499, 0, 1, 0.05882353, 1,
-0.3573577, -0.1334802, -2.890016, 0, 1, 0.0627451, 1,
-0.355124, -0.1723364, -1.686179, 0, 1, 0.07058824, 1,
-0.3521519, -0.4201128, -1.570845, 0, 1, 0.07450981, 1,
-0.3473086, 0.7131092, 0.5258958, 0, 1, 0.08235294, 1,
-0.3420354, 0.8684496, -0.8762261, 0, 1, 0.08627451, 1,
-0.341796, -0.3519737, -2.3505, 0, 1, 0.09411765, 1,
-0.337495, 0.381546, -2.641528, 0, 1, 0.1019608, 1,
-0.3272599, 0.09229377, 0.2407859, 0, 1, 0.1058824, 1,
-0.3215708, 0.2378465, -2.253488, 0, 1, 0.1137255, 1,
-0.3194268, -0.08801854, -2.705664, 0, 1, 0.1176471, 1,
-0.3190582, 0.2451292, -1.532792, 0, 1, 0.1254902, 1,
-0.318129, 0.5471548, -1.424399, 0, 1, 0.1294118, 1,
-0.3143761, -0.6076264, -2.235996, 0, 1, 0.1372549, 1,
-0.3100323, 1.186467, -0.7702227, 0, 1, 0.1411765, 1,
-0.3099725, 0.4150472, 0.174063, 0, 1, 0.1490196, 1,
-0.306097, -0.4215707, -1.613575, 0, 1, 0.1529412, 1,
-0.3052253, -0.387708, -2.890492, 0, 1, 0.1607843, 1,
-0.2998948, 0.4690173, -0.7710562, 0, 1, 0.1647059, 1,
-0.2952077, 0.244953, -0.6402696, 0, 1, 0.172549, 1,
-0.2899759, 0.6193942, -0.0590556, 0, 1, 0.1764706, 1,
-0.2832687, 1.609089, -0.5756973, 0, 1, 0.1843137, 1,
-0.28002, 1.034017, -0.2491671, 0, 1, 0.1882353, 1,
-0.2754692, 1.326494, -0.1246317, 0, 1, 0.1960784, 1,
-0.2724812, -1.605159, -4.437869, 0, 1, 0.2039216, 1,
-0.2713258, -0.5009293, -2.353119, 0, 1, 0.2078431, 1,
-0.2712985, 1.074139, -0.3979556, 0, 1, 0.2156863, 1,
-0.2692483, 0.3584787, -0.6954199, 0, 1, 0.2196078, 1,
-0.2666923, -1.271192, -3.796227, 0, 1, 0.227451, 1,
-0.2597076, -1.609147, -2.293418, 0, 1, 0.2313726, 1,
-0.2549399, 1.801546, 0.04699793, 0, 1, 0.2392157, 1,
-0.2530865, -0.6995187, -1.86632, 0, 1, 0.2431373, 1,
-0.2525291, 0.03368579, -1.223813, 0, 1, 0.2509804, 1,
-0.2501612, 0.6794345, 0.3048632, 0, 1, 0.254902, 1,
-0.249355, 0.5958011, -1.894092, 0, 1, 0.2627451, 1,
-0.2482087, -0.2982094, -1.927687, 0, 1, 0.2666667, 1,
-0.2473565, -0.1379441, -1.391436, 0, 1, 0.2745098, 1,
-0.2464962, 0.9777692, -1.036491, 0, 1, 0.2784314, 1,
-0.2389847, 1.671361, -1.2641, 0, 1, 0.2862745, 1,
-0.2370663, 0.07731872, -0.7147984, 0, 1, 0.2901961, 1,
-0.2365971, -0.1729661, -2.153335, 0, 1, 0.2980392, 1,
-0.23528, 0.5448849, 0.3843714, 0, 1, 0.3058824, 1,
-0.2310987, 0.7918895, -0.06890999, 0, 1, 0.3098039, 1,
-0.2309709, 2.080852, -1.045598, 0, 1, 0.3176471, 1,
-0.2302828, 1.368097, 0.7112514, 0, 1, 0.3215686, 1,
-0.2266242, 0.5932676, -1.043815, 0, 1, 0.3294118, 1,
-0.2259489, -0.267526, -3.188469, 0, 1, 0.3333333, 1,
-0.2241374, -1.842863, -4.592732, 0, 1, 0.3411765, 1,
-0.2200583, -1.240348, -2.758127, 0, 1, 0.345098, 1,
-0.2188257, 1.534657, -1.018519, 0, 1, 0.3529412, 1,
-0.2113411, -0.5859646, -3.268799, 0, 1, 0.3568628, 1,
-0.2108299, 0.8144205, -0.4048281, 0, 1, 0.3647059, 1,
-0.2087102, 0.4765955, -0.9774143, 0, 1, 0.3686275, 1,
-0.2078959, 0.7345056, 0.9563209, 0, 1, 0.3764706, 1,
-0.2049394, 1.02765, 0.5901803, 0, 1, 0.3803922, 1,
-0.203649, -1.655734, -4.995789, 0, 1, 0.3882353, 1,
-0.2034632, -1.242709, -2.375608, 0, 1, 0.3921569, 1,
-0.2019889, 0.8952706, -1.534788, 0, 1, 0.4, 1,
-0.197932, -0.6518629, -3.340732, 0, 1, 0.4078431, 1,
-0.1959231, -0.3510853, -3.357857, 0, 1, 0.4117647, 1,
-0.1948776, -0.8009798, -4.205089, 0, 1, 0.4196078, 1,
-0.1895934, -0.9316506, -3.992376, 0, 1, 0.4235294, 1,
-0.1895536, 0.7578486, 0.4281634, 0, 1, 0.4313726, 1,
-0.1846073, -1.047178, -2.623957, 0, 1, 0.4352941, 1,
-0.184503, 1.060643, -1.35773, 0, 1, 0.4431373, 1,
-0.1763195, 0.47843, 1.409816, 0, 1, 0.4470588, 1,
-0.1756621, 0.4104294, 0.09018912, 0, 1, 0.454902, 1,
-0.175252, -1.232307, -3.248445, 0, 1, 0.4588235, 1,
-0.1752079, -1.066166, -3.348462, 0, 1, 0.4666667, 1,
-0.1741412, 0.1753617, -1.580317, 0, 1, 0.4705882, 1,
-0.1736295, -1.101359, -3.267953, 0, 1, 0.4784314, 1,
-0.1726751, 0.4069425, -0.05536202, 0, 1, 0.4823529, 1,
-0.1708114, 1.044357, -1.681718, 0, 1, 0.4901961, 1,
-0.1693527, -1.557722, -2.486011, 0, 1, 0.4941176, 1,
-0.1674346, -0.8161263, -3.031354, 0, 1, 0.5019608, 1,
-0.1664359, 0.3160587, -1.447744, 0, 1, 0.509804, 1,
-0.1650776, 0.1601638, -1.018394, 0, 1, 0.5137255, 1,
-0.1566035, 0.6390944, 0.07689179, 0, 1, 0.5215687, 1,
-0.1535214, -0.8419209, -2.585015, 0, 1, 0.5254902, 1,
-0.151935, -0.5386381, -1.838961, 0, 1, 0.5333334, 1,
-0.1489825, 0.3896456, -0.2933607, 0, 1, 0.5372549, 1,
-0.1441179, 0.8605733, -2.064589, 0, 1, 0.5450981, 1,
-0.137286, 0.4848115, -0.7632937, 0, 1, 0.5490196, 1,
-0.1321533, -0.8830581, -1.812629, 0, 1, 0.5568628, 1,
-0.1296249, -0.08937276, -3.476265, 0, 1, 0.5607843, 1,
-0.1241039, 1.226247, 0.4679334, 0, 1, 0.5686275, 1,
-0.1214799, -1.141055, -4.225875, 0, 1, 0.572549, 1,
-0.1211477, -0.1561426, -3.855913, 0, 1, 0.5803922, 1,
-0.1193531, 0.1024342, -1.935126, 0, 1, 0.5843138, 1,
-0.1122391, -2.051782, -1.243101, 0, 1, 0.5921569, 1,
-0.1121411, -1.633839, -2.352107, 0, 1, 0.5960785, 1,
-0.09702298, 1.115012, 0.1426452, 0, 1, 0.6039216, 1,
-0.09513546, 1.328314, -0.8813641, 0, 1, 0.6117647, 1,
-0.09445807, 1.876594, 0.6379051, 0, 1, 0.6156863, 1,
-0.0915676, -0.08657453, -2.913525, 0, 1, 0.6235294, 1,
-0.08999156, 0.7756662, -1.214084, 0, 1, 0.627451, 1,
-0.08778334, -1.500046, -3.172411, 0, 1, 0.6352941, 1,
-0.08700953, 0.6667972, -0.8260287, 0, 1, 0.6392157, 1,
-0.08646534, 0.7853124, -0.7948506, 0, 1, 0.6470588, 1,
-0.0822548, -0.3874207, -4.928181, 0, 1, 0.6509804, 1,
-0.08151849, 0.1856338, -0.438553, 0, 1, 0.6588235, 1,
-0.08028083, 0.7358952, -0.1623349, 0, 1, 0.6627451, 1,
-0.07793868, -0.2619338, -2.855837, 0, 1, 0.6705883, 1,
-0.07686635, 0.8105375, -1.888414, 0, 1, 0.6745098, 1,
-0.07686158, 0.7638857, 1.369008, 0, 1, 0.682353, 1,
-0.07614791, 0.2399296, -0.4144887, 0, 1, 0.6862745, 1,
-0.07599235, 0.3425439, -0.5284702, 0, 1, 0.6941177, 1,
-0.0712867, 0.8874115, -1.51113, 0, 1, 0.7019608, 1,
-0.06739141, -0.6012424, -2.826466, 0, 1, 0.7058824, 1,
-0.06548482, -1.599285, -3.033834, 0, 1, 0.7137255, 1,
-0.06510245, -0.3646947, -3.540069, 0, 1, 0.7176471, 1,
-0.06486966, 0.3062092, -1.331071, 0, 1, 0.7254902, 1,
-0.06469372, 1.191769, 1.674745, 0, 1, 0.7294118, 1,
-0.06323835, 1.035422, 0.5588247, 0, 1, 0.7372549, 1,
-0.06197584, 0.4195612, -0.2168355, 0, 1, 0.7411765, 1,
-0.05568945, 0.04058299, 0.1525318, 0, 1, 0.7490196, 1,
-0.05487252, -1.087359, -3.260917, 0, 1, 0.7529412, 1,
-0.05298008, 0.6367158, 0.4002385, 0, 1, 0.7607843, 1,
-0.05279818, 0.305389, -0.118916, 0, 1, 0.7647059, 1,
-0.05129884, -0.704458, -3.736448, 0, 1, 0.772549, 1,
-0.05074846, -0.1359342, -2.038904, 0, 1, 0.7764706, 1,
-0.04203603, -0.650614, -4.54206, 0, 1, 0.7843137, 1,
-0.0400304, 1.428519, -0.8289676, 0, 1, 0.7882353, 1,
-0.03795948, 0.6080204, -1.467895, 0, 1, 0.7960784, 1,
-0.03669965, 0.08235916, 0.1665512, 0, 1, 0.8039216, 1,
-0.03648161, 0.3698688, 1.789737, 0, 1, 0.8078431, 1,
-0.03600213, 0.5113463, 0.4032348, 0, 1, 0.8156863, 1,
-0.02763502, -1.069711, -2.287951, 0, 1, 0.8196079, 1,
-0.02335193, -2.28349, -3.923542, 0, 1, 0.827451, 1,
-0.02173732, -0.5129957, -4.309335, 0, 1, 0.8313726, 1,
-0.01823087, 0.5110753, -0.4941806, 0, 1, 0.8392157, 1,
-0.01702127, -0.7097682, -3.842875, 0, 1, 0.8431373, 1,
-0.01571895, -0.4985405, -2.4595, 0, 1, 0.8509804, 1,
-0.01279235, 1.281099, -0.2000264, 0, 1, 0.854902, 1,
-0.01203934, 1.132758, 0.2327489, 0, 1, 0.8627451, 1,
-0.006284113, 1.277123, -0.2299398, 0, 1, 0.8666667, 1,
0.0009322896, 0.2683852, -0.06419948, 0, 1, 0.8745098, 1,
0.0009923537, -0.009970578, 3.246957, 0, 1, 0.8784314, 1,
0.01086069, -0.5808495, 4.051175, 0, 1, 0.8862745, 1,
0.01137654, -0.2877029, 4.328052, 0, 1, 0.8901961, 1,
0.01428336, 0.4463741, -0.4463197, 0, 1, 0.8980392, 1,
0.01606677, -0.01366713, 1.677753, 0, 1, 0.9058824, 1,
0.02124541, -0.08554447, 2.307365, 0, 1, 0.9098039, 1,
0.02314319, -1.233285, 4.251074, 0, 1, 0.9176471, 1,
0.02907593, -0.7660322, 2.990309, 0, 1, 0.9215686, 1,
0.03225572, -0.9632505, 3.195346, 0, 1, 0.9294118, 1,
0.0351168, 0.3550656, -0.2332601, 0, 1, 0.9333333, 1,
0.03593096, 1.497812, -0.6236219, 0, 1, 0.9411765, 1,
0.03883706, -1.923032, 2.341249, 0, 1, 0.945098, 1,
0.0421654, 0.6802335, -0.6786698, 0, 1, 0.9529412, 1,
0.04325281, -0.7262727, 2.56171, 0, 1, 0.9568627, 1,
0.0442079, -0.5865635, 2.577594, 0, 1, 0.9647059, 1,
0.04441651, 1.484692, 0.7778767, 0, 1, 0.9686275, 1,
0.04983131, -0.1718006, 3.728197, 0, 1, 0.9764706, 1,
0.05067489, -0.9508142, -0.2399002, 0, 1, 0.9803922, 1,
0.05264777, 0.2979041, 1.051646, 0, 1, 0.9882353, 1,
0.05495203, -1.194413, 3.698264, 0, 1, 0.9921569, 1,
0.05681987, -1.22257, 2.251089, 0, 1, 1, 1,
0.07236131, -2.164356, 3.448934, 0, 0.9921569, 1, 1,
0.07237354, -0.1582562, 3.449651, 0, 0.9882353, 1, 1,
0.07343155, 0.4748942, -0.155469, 0, 0.9803922, 1, 1,
0.0742493, 0.1103931, 1.266604, 0, 0.9764706, 1, 1,
0.07506934, 0.3001878, -0.08240757, 0, 0.9686275, 1, 1,
0.08350182, -0.3649508, 2.697574, 0, 0.9647059, 1, 1,
0.08376207, 1.992213, 0.08956895, 0, 0.9568627, 1, 1,
0.08537411, 0.09903559, 0.2022176, 0, 0.9529412, 1, 1,
0.08554303, -0.042678, 4.167201, 0, 0.945098, 1, 1,
0.08971258, -1.230116, 3.056104, 0, 0.9411765, 1, 1,
0.09211868, 1.360664, 1.303807, 0, 0.9333333, 1, 1,
0.09336002, -1.285075, 3.812164, 0, 0.9294118, 1, 1,
0.09554973, 0.8117353, 1.080252, 0, 0.9215686, 1, 1,
0.09865917, 0.6811921, 0.137807, 0, 0.9176471, 1, 1,
0.09988912, 2.20706, -0.261071, 0, 0.9098039, 1, 1,
0.1046145, -0.3297026, 4.378448, 0, 0.9058824, 1, 1,
0.1094413, 1.057396, -0.2732722, 0, 0.8980392, 1, 1,
0.1116725, -1.075295, 2.191479, 0, 0.8901961, 1, 1,
0.1127562, -0.2329552, 2.183382, 0, 0.8862745, 1, 1,
0.1141883, -1.161913, 4.380916, 0, 0.8784314, 1, 1,
0.1196903, -1.230276, 3.829463, 0, 0.8745098, 1, 1,
0.12857, -0.4922832, 3.370383, 0, 0.8666667, 1, 1,
0.1304492, -0.1571975, 3.767422, 0, 0.8627451, 1, 1,
0.1396183, 0.05464773, 1.383233, 0, 0.854902, 1, 1,
0.1397929, -1.650166, 3.963826, 0, 0.8509804, 1, 1,
0.1440111, 0.1966566, 0.9707621, 0, 0.8431373, 1, 1,
0.1461043, 0.6675071, -1.471704, 0, 0.8392157, 1, 1,
0.1470657, 0.1836566, -0.6990653, 0, 0.8313726, 1, 1,
0.1471721, -0.1702115, 2.986072, 0, 0.827451, 1, 1,
0.1481773, 1.514772, -0.3442589, 0, 0.8196079, 1, 1,
0.1497645, -0.7828822, 2.239, 0, 0.8156863, 1, 1,
0.1511923, 0.9954605, -0.6785379, 0, 0.8078431, 1, 1,
0.1533864, -0.09880038, 1.768718, 0, 0.8039216, 1, 1,
0.1552117, 0.8605842, -0.1366873, 0, 0.7960784, 1, 1,
0.1605478, 0.9185137, -0.2009194, 0, 0.7882353, 1, 1,
0.1622822, 0.2222791, 0.3982725, 0, 0.7843137, 1, 1,
0.1642082, 1.560181, -0.4001861, 0, 0.7764706, 1, 1,
0.1683268, 1.173061, -0.8244537, 0, 0.772549, 1, 1,
0.1685507, 1.402327, 0.725683, 0, 0.7647059, 1, 1,
0.1697104, -0.7030252, 3.550731, 0, 0.7607843, 1, 1,
0.1707157, 0.3835958, 2.69378, 0, 0.7529412, 1, 1,
0.1761772, -0.181152, 2.561435, 0, 0.7490196, 1, 1,
0.1780772, 0.09797918, 0.8839708, 0, 0.7411765, 1, 1,
0.1867972, 0.1703207, -0.2653038, 0, 0.7372549, 1, 1,
0.1921124, -0.7763581, 1.740177, 0, 0.7294118, 1, 1,
0.192253, 0.5725065, 0.8418346, 0, 0.7254902, 1, 1,
0.1924876, 0.9967833, 1.298311, 0, 0.7176471, 1, 1,
0.1935748, -0.4869356, 3.937986, 0, 0.7137255, 1, 1,
0.1938262, 0.8556686, 2.151801, 0, 0.7058824, 1, 1,
0.194396, -1.232544, 4.944355, 0, 0.6980392, 1, 1,
0.1944118, 0.5055869, 0.3386625, 0, 0.6941177, 1, 1,
0.1996339, 0.1326854, 1.853294, 0, 0.6862745, 1, 1,
0.2025465, 0.7016689, 1.44966, 0, 0.682353, 1, 1,
0.202771, 0.01296083, 1.76307, 0, 0.6745098, 1, 1,
0.2115671, -0.7741577, 2.55098, 0, 0.6705883, 1, 1,
0.2122989, -0.7136242, 3.722887, 0, 0.6627451, 1, 1,
0.2127308, -0.7550508, 2.326912, 0, 0.6588235, 1, 1,
0.2128325, -0.2257548, 4.997786, 0, 0.6509804, 1, 1,
0.2204107, 0.03072818, 1.632128, 0, 0.6470588, 1, 1,
0.2209223, -0.6255899, 3.930835, 0, 0.6392157, 1, 1,
0.2233615, -0.4863165, 2.814637, 0, 0.6352941, 1, 1,
0.2265315, 0.4250048, -0.8147082, 0, 0.627451, 1, 1,
0.2363491, -0.8884501, 1.220851, 0, 0.6235294, 1, 1,
0.2382581, 0.09094048, -0.1702394, 0, 0.6156863, 1, 1,
0.2428753, 1.424392, -0.2501185, 0, 0.6117647, 1, 1,
0.2461648, 1.637662, -1.117248, 0, 0.6039216, 1, 1,
0.2485794, -0.3205513, 3.769016, 0, 0.5960785, 1, 1,
0.2498797, 1.652516, -0.560239, 0, 0.5921569, 1, 1,
0.2551524, -0.8036807, 3.804316, 0, 0.5843138, 1, 1,
0.2568195, -0.8068634, 1.042953, 0, 0.5803922, 1, 1,
0.2595072, -0.2605624, 3.522476, 0, 0.572549, 1, 1,
0.2609043, 0.6932892, 0.9956946, 0, 0.5686275, 1, 1,
0.2632745, -1.526877, 2.05843, 0, 0.5607843, 1, 1,
0.2635416, -0.4066854, 1.75373, 0, 0.5568628, 1, 1,
0.2658922, -2.048061, 2.710921, 0, 0.5490196, 1, 1,
0.268808, 0.04552973, 1.570481, 0, 0.5450981, 1, 1,
0.2761389, -1.212444, 4.246233, 0, 0.5372549, 1, 1,
0.27795, 0.8430497, -0.1130306, 0, 0.5333334, 1, 1,
0.2782317, -0.9302148, 3.199832, 0, 0.5254902, 1, 1,
0.2807336, 0.3886439, 0.3061281, 0, 0.5215687, 1, 1,
0.2822279, -0.7920694, 4.025187, 0, 0.5137255, 1, 1,
0.2839544, 0.665547, 1.291163, 0, 0.509804, 1, 1,
0.2854777, 0.1084378, 0.6425417, 0, 0.5019608, 1, 1,
0.291714, 0.6254408, 0.7178054, 0, 0.4941176, 1, 1,
0.2942225, -1.213272, 2.878069, 0, 0.4901961, 1, 1,
0.2953179, -2.58332, 1.996207, 0, 0.4823529, 1, 1,
0.2997971, 1.420238, -1.055585, 0, 0.4784314, 1, 1,
0.3066348, -0.4048627, 2.441691, 0, 0.4705882, 1, 1,
0.3080946, 0.8086814, 1.056349, 0, 0.4666667, 1, 1,
0.3090031, -0.5426621, 3.762933, 0, 0.4588235, 1, 1,
0.3139703, -0.4256327, 3.121259, 0, 0.454902, 1, 1,
0.3147056, 0.1654215, 0.008854684, 0, 0.4470588, 1, 1,
0.316487, -1.016801, 2.104042, 0, 0.4431373, 1, 1,
0.3167899, 0.7394842, 0.5797623, 0, 0.4352941, 1, 1,
0.3170381, -0.2777743, 1.684485, 0, 0.4313726, 1, 1,
0.3217992, -0.2065342, 1.693579, 0, 0.4235294, 1, 1,
0.3265369, -0.3542347, 1.734633, 0, 0.4196078, 1, 1,
0.3282205, -0.6630428, 2.92691, 0, 0.4117647, 1, 1,
0.3303013, -1.443711, 2.936943, 0, 0.4078431, 1, 1,
0.3311346, -0.09554674, 3.888202, 0, 0.4, 1, 1,
0.338326, -0.1904172, 2.771612, 0, 0.3921569, 1, 1,
0.3406524, 1.047513, 0.4392993, 0, 0.3882353, 1, 1,
0.3445947, 0.3003656, 0.9098238, 0, 0.3803922, 1, 1,
0.3446449, -1.089537, 3.05677, 0, 0.3764706, 1, 1,
0.3468171, -0.09393285, 2.662143, 0, 0.3686275, 1, 1,
0.3517961, -0.1485571, 1.107099, 0, 0.3647059, 1, 1,
0.3521617, 0.7153924, 1.248989, 0, 0.3568628, 1, 1,
0.3559835, -1.101517, 1.321156, 0, 0.3529412, 1, 1,
0.357414, 0.2167544, 0.1441325, 0, 0.345098, 1, 1,
0.3604572, 0.4615428, 1.808752, 0, 0.3411765, 1, 1,
0.3634485, 1.660287, 0.8146214, 0, 0.3333333, 1, 1,
0.3636626, 0.03749888, 0.9116469, 0, 0.3294118, 1, 1,
0.3656665, -0.1164866, 1.121856, 0, 0.3215686, 1, 1,
0.3706731, 0.4260261, 1.710187, 0, 0.3176471, 1, 1,
0.3755222, 0.5480083, -0.5035247, 0, 0.3098039, 1, 1,
0.3793473, -0.967676, 1.627409, 0, 0.3058824, 1, 1,
0.3798651, 0.04219198, 1.50307, 0, 0.2980392, 1, 1,
0.3817364, 0.06024722, 0.7128331, 0, 0.2901961, 1, 1,
0.3832906, -0.06816978, 1.494598, 0, 0.2862745, 1, 1,
0.3850256, -3.275427, 3.656038, 0, 0.2784314, 1, 1,
0.3861832, 0.3793606, 0.2329528, 0, 0.2745098, 1, 1,
0.3870786, 0.8948923, -1.593383, 0, 0.2666667, 1, 1,
0.389064, -2.128105, 4.898352, 0, 0.2627451, 1, 1,
0.3892835, -0.3673941, 2.470967, 0, 0.254902, 1, 1,
0.3921478, -1.468686, 5.970409, 0, 0.2509804, 1, 1,
0.3968606, 0.7915143, 1.905486, 0, 0.2431373, 1, 1,
0.3968789, -0.2384476, 0.9580607, 0, 0.2392157, 1, 1,
0.3988535, 1.399985, -1.387588, 0, 0.2313726, 1, 1,
0.3989097, -1.73275, 2.160608, 0, 0.227451, 1, 1,
0.3995242, -0.03215065, 0.5749984, 0, 0.2196078, 1, 1,
0.4005699, 1.009539, 0.531085, 0, 0.2156863, 1, 1,
0.4017214, 0.4030907, -0.01716518, 0, 0.2078431, 1, 1,
0.4035299, 0.3850425, 1.361348, 0, 0.2039216, 1, 1,
0.4053106, -0.5678509, 5.218247, 0, 0.1960784, 1, 1,
0.416508, 0.4142348, 1.105245, 0, 0.1882353, 1, 1,
0.4166067, -0.637005, 2.726789, 0, 0.1843137, 1, 1,
0.4217322, -0.7628244, 4.907382, 0, 0.1764706, 1, 1,
0.4219702, -0.001719904, 0.3702024, 0, 0.172549, 1, 1,
0.4254265, -0.1963093, 1.726374, 0, 0.1647059, 1, 1,
0.4254276, -0.04020019, 2.614749, 0, 0.1607843, 1, 1,
0.4258426, 0.2755409, 0.7245814, 0, 0.1529412, 1, 1,
0.4335106, -1.026181, 1.70666, 0, 0.1490196, 1, 1,
0.4353455, -0.3524732, 1.933231, 0, 0.1411765, 1, 1,
0.443221, 0.2157556, 1.449979, 0, 0.1372549, 1, 1,
0.4461268, 0.3902465, -1.267515, 0, 0.1294118, 1, 1,
0.4487025, 0.4647611, 2.083915, 0, 0.1254902, 1, 1,
0.4505938, 0.6414308, 1.652874, 0, 0.1176471, 1, 1,
0.4507744, -0.1785008, 2.703267, 0, 0.1137255, 1, 1,
0.4508945, 1.143717, -0.305159, 0, 0.1058824, 1, 1,
0.4551512, 2.411274, -0.02318075, 0, 0.09803922, 1, 1,
0.4560276, -0.228296, 1.472091, 0, 0.09411765, 1, 1,
0.4569845, 0.4265052, 0.4138939, 0, 0.08627451, 1, 1,
0.4584406, 0.6157303, 0.8003365, 0, 0.08235294, 1, 1,
0.4632142, 0.1491798, 1.237299, 0, 0.07450981, 1, 1,
0.4634243, -0.8607777, 4.424686, 0, 0.07058824, 1, 1,
0.4650908, -0.5910599, 2.496423, 0, 0.0627451, 1, 1,
0.4660848, 1.627811, 0.2526365, 0, 0.05882353, 1, 1,
0.4675916, -0.03108834, 2.330417, 0, 0.05098039, 1, 1,
0.4704414, -1.600827, 4.321203, 0, 0.04705882, 1, 1,
0.4751427, -1.10629, 0.9230854, 0, 0.03921569, 1, 1,
0.4793769, -0.474575, 3.596825, 0, 0.03529412, 1, 1,
0.4806232, 0.5138406, 1.316603, 0, 0.02745098, 1, 1,
0.4822468, -0.07853474, 0.4096541, 0, 0.02352941, 1, 1,
0.4863712, 1.255609, -0.05647444, 0, 0.01568628, 1, 1,
0.4877393, 0.6603589, 0.5654371, 0, 0.01176471, 1, 1,
0.4914038, 0.5987498, -0.1804457, 0, 0.003921569, 1, 1,
0.4998479, 0.7219491, 0.2713214, 0.003921569, 0, 1, 1,
0.5005124, 1.023453, 1.501422, 0.007843138, 0, 1, 1,
0.5032225, -0.1481451, 2.743377, 0.01568628, 0, 1, 1,
0.5039196, -1.469184, 2.204049, 0.01960784, 0, 1, 1,
0.5040241, -0.1940754, 2.665092, 0.02745098, 0, 1, 1,
0.5050558, 1.749975, 1.472246, 0.03137255, 0, 1, 1,
0.5140619, 0.01970274, 2.904414, 0.03921569, 0, 1, 1,
0.5155756, -0.7540005, 3.119197, 0.04313726, 0, 1, 1,
0.5183681, 0.2775382, 2.441823, 0.05098039, 0, 1, 1,
0.5214404, -0.1631125, 1.736039, 0.05490196, 0, 1, 1,
0.5216108, 1.190748, 0.7907211, 0.0627451, 0, 1, 1,
0.5309336, 0.2718498, 0.5232026, 0.06666667, 0, 1, 1,
0.5318989, -0.7655776, 2.535353, 0.07450981, 0, 1, 1,
0.532275, 0.333671, -0.5959276, 0.07843138, 0, 1, 1,
0.5329964, -0.7998637, 3.280461, 0.08627451, 0, 1, 1,
0.5365518, 0.9019103, 0.0732129, 0.09019608, 0, 1, 1,
0.536809, -0.5859069, 4.223487, 0.09803922, 0, 1, 1,
0.5418869, -2.109944, 4.352584, 0.1058824, 0, 1, 1,
0.5435402, 1.070264, -0.1618875, 0.1098039, 0, 1, 1,
0.5450355, -0.3131339, 2.913075, 0.1176471, 0, 1, 1,
0.5454356, -1.522892, 1.119381, 0.1215686, 0, 1, 1,
0.547654, -0.7320827, 2.52876, 0.1294118, 0, 1, 1,
0.5498219, 1.701734, 2.635177, 0.1333333, 0, 1, 1,
0.5517393, 0.849143, 1.333937, 0.1411765, 0, 1, 1,
0.5521898, 0.3743285, 3.112458, 0.145098, 0, 1, 1,
0.5539944, -0.2682238, 1.192758, 0.1529412, 0, 1, 1,
0.5572007, 0.7064688, 0.7950296, 0.1568628, 0, 1, 1,
0.5574902, 0.7164716, 1.852684, 0.1647059, 0, 1, 1,
0.5591304, -0.9337065, 3.242228, 0.1686275, 0, 1, 1,
0.5622926, 0.3414561, 0.7142234, 0.1764706, 0, 1, 1,
0.5640045, -0.7876675, 2.209846, 0.1803922, 0, 1, 1,
0.5759515, 0.1588685, 2.731524, 0.1882353, 0, 1, 1,
0.5803853, 2.997443, 0.6175269, 0.1921569, 0, 1, 1,
0.5873531, 0.6273192, -0.4895909, 0.2, 0, 1, 1,
0.5904695, -1.073698, 2.189284, 0.2078431, 0, 1, 1,
0.593036, -1.194908, 3.297926, 0.2117647, 0, 1, 1,
0.5946388, 0.7385011, 1.577522, 0.2196078, 0, 1, 1,
0.6019147, -1.463143, 2.710954, 0.2235294, 0, 1, 1,
0.6028953, 0.3753971, -0.1837321, 0.2313726, 0, 1, 1,
0.6047352, 0.08680914, 1.748024, 0.2352941, 0, 1, 1,
0.6052926, 1.300522, -0.3550421, 0.2431373, 0, 1, 1,
0.6074336, 0.0381093, 2.83291, 0.2470588, 0, 1, 1,
0.6166303, 0.9383376, 0.8675802, 0.254902, 0, 1, 1,
0.623317, -1.182835, 3.138935, 0.2588235, 0, 1, 1,
0.6274387, -1.025849, 3.256001, 0.2666667, 0, 1, 1,
0.633943, 1.489126, -0.6227879, 0.2705882, 0, 1, 1,
0.6383121, -1.764937, 2.255081, 0.2784314, 0, 1, 1,
0.6389123, -2.085271, 2.531895, 0.282353, 0, 1, 1,
0.6392125, -1.169876, 1.211487, 0.2901961, 0, 1, 1,
0.6426658, 0.6210312, 0.3864446, 0.2941177, 0, 1, 1,
0.6557094, -0.2510242, 2.173327, 0.3019608, 0, 1, 1,
0.6594963, -0.06357259, 1.025864, 0.3098039, 0, 1, 1,
0.6616034, 0.7184566, 1.474489, 0.3137255, 0, 1, 1,
0.6618918, 0.8726937, 1.949029, 0.3215686, 0, 1, 1,
0.6651256, -1.173358, 3.226531, 0.3254902, 0, 1, 1,
0.6683947, 1.64457, -0.1571113, 0.3333333, 0, 1, 1,
0.673331, 1.661485, 0.4373738, 0.3372549, 0, 1, 1,
0.6736674, 1.291538, 1.662093, 0.345098, 0, 1, 1,
0.6757069, -0.6527456, 2.159786, 0.3490196, 0, 1, 1,
0.6762362, 0.661128, 2.631449, 0.3568628, 0, 1, 1,
0.6767392, 0.03034516, 0.9981055, 0.3607843, 0, 1, 1,
0.6872225, 1.115229, -0.1227097, 0.3686275, 0, 1, 1,
0.688314, 0.0245173, 0.2479887, 0.372549, 0, 1, 1,
0.6902971, -0.4038817, 3.621583, 0.3803922, 0, 1, 1,
0.6925039, -0.7380503, 0.8221456, 0.3843137, 0, 1, 1,
0.695822, 2.336706, 0.4284826, 0.3921569, 0, 1, 1,
0.6966469, 1.329469, -0.5488086, 0.3960784, 0, 1, 1,
0.6988114, 0.9472765, 0.3360524, 0.4039216, 0, 1, 1,
0.7002442, 1.302695, 0.8806389, 0.4117647, 0, 1, 1,
0.7103778, 2.339583, 1.836684, 0.4156863, 0, 1, 1,
0.7104121, -0.2571959, 2.365416, 0.4235294, 0, 1, 1,
0.7120483, -0.8162423, 2.292951, 0.427451, 0, 1, 1,
0.714175, 0.9276342, -0.2911607, 0.4352941, 0, 1, 1,
0.7154374, 1.825606, 0.3857249, 0.4392157, 0, 1, 1,
0.725712, -0.513783, 2.224815, 0.4470588, 0, 1, 1,
0.7311061, 0.572005, 0.6713874, 0.4509804, 0, 1, 1,
0.7339458, 1.531212, 0.7076516, 0.4588235, 0, 1, 1,
0.7372011, 0.3577534, -0.06367949, 0.4627451, 0, 1, 1,
0.7414649, 0.5470563, -0.9898513, 0.4705882, 0, 1, 1,
0.7423309, -1.265263, 1.644013, 0.4745098, 0, 1, 1,
0.7426683, 0.673079, 3.374835, 0.4823529, 0, 1, 1,
0.742983, -0.3955149, 2.570561, 0.4862745, 0, 1, 1,
0.7494228, 0.7189207, 0.292003, 0.4941176, 0, 1, 1,
0.7516995, 0.8898233, 2.465522, 0.5019608, 0, 1, 1,
0.7529153, 1.323811, 0.6570818, 0.5058824, 0, 1, 1,
0.7555812, -0.4080456, 0.6479889, 0.5137255, 0, 1, 1,
0.7607236, -2.128988, 3.554004, 0.5176471, 0, 1, 1,
0.7614254, -0.6281551, 1.851708, 0.5254902, 0, 1, 1,
0.7626222, 0.2517099, 2.657091, 0.5294118, 0, 1, 1,
0.7637302, 1.401069, -0.2379429, 0.5372549, 0, 1, 1,
0.7662974, 0.9597592, -0.1226284, 0.5411765, 0, 1, 1,
0.766893, 1.502389, 0.6328697, 0.5490196, 0, 1, 1,
0.7695755, 1.196406, 0.0192629, 0.5529412, 0, 1, 1,
0.773858, -0.5124992, 3.075277, 0.5607843, 0, 1, 1,
0.775717, 0.5070152, 0.4372519, 0.5647059, 0, 1, 1,
0.7757663, 0.8027637, 0.2377193, 0.572549, 0, 1, 1,
0.7778246, -1.39079, 4.790102, 0.5764706, 0, 1, 1,
0.7794523, 1.256816, 1.684218, 0.5843138, 0, 1, 1,
0.7815334, -0.2526803, 2.221346, 0.5882353, 0, 1, 1,
0.7920972, -1.549022, 3.154547, 0.5960785, 0, 1, 1,
0.793017, -0.4971759, 0.951719, 0.6039216, 0, 1, 1,
0.7941601, -2.775185, 2.60278, 0.6078432, 0, 1, 1,
0.7949765, -0.5797481, 2.412404, 0.6156863, 0, 1, 1,
0.7991621, 0.2443361, 1.946497, 0.6196079, 0, 1, 1,
0.8007426, -0.09023735, 1.233571, 0.627451, 0, 1, 1,
0.8034802, -0.6276874, 1.359744, 0.6313726, 0, 1, 1,
0.8101613, 0.1565845, 3.004429, 0.6392157, 0, 1, 1,
0.8167434, 0.3777934, 1.428076, 0.6431373, 0, 1, 1,
0.8184146, 0.1962575, 0.5742426, 0.6509804, 0, 1, 1,
0.8269801, 1.98973, 0.4361061, 0.654902, 0, 1, 1,
0.8272392, -1.354815, 1.858932, 0.6627451, 0, 1, 1,
0.827794, 1.63227, 0.3506981, 0.6666667, 0, 1, 1,
0.8284243, -0.7763842, 2.798512, 0.6745098, 0, 1, 1,
0.8297018, -2.824704, 1.119011, 0.6784314, 0, 1, 1,
0.8387521, -0.4826738, 1.461645, 0.6862745, 0, 1, 1,
0.8411353, 0.1882031, 0.9260569, 0.6901961, 0, 1, 1,
0.8412194, 0.1556049, 0.5517827, 0.6980392, 0, 1, 1,
0.8498752, -1.935665, 3.808652, 0.7058824, 0, 1, 1,
0.8547832, -1.793137, 2.391716, 0.7098039, 0, 1, 1,
0.8579547, 0.953846, 1.362492, 0.7176471, 0, 1, 1,
0.8671761, 0.145406, 3.397331, 0.7215686, 0, 1, 1,
0.8674194, 0.87893, -0.1068415, 0.7294118, 0, 1, 1,
0.8694647, 0.9821609, -0.07609153, 0.7333333, 0, 1, 1,
0.8701395, -0.4253263, 3.099613, 0.7411765, 0, 1, 1,
0.8715796, -0.5999153, 2.570584, 0.7450981, 0, 1, 1,
0.8771471, 1.077399, 0.7151758, 0.7529412, 0, 1, 1,
0.8792127, -0.5511489, 0.9924268, 0.7568628, 0, 1, 1,
0.8833255, -0.9277738, 2.386303, 0.7647059, 0, 1, 1,
0.8837361, -1.101606, 3.510897, 0.7686275, 0, 1, 1,
0.8865198, -0.08489031, 0.7387349, 0.7764706, 0, 1, 1,
0.8869749, 0.4378972, 0.7312932, 0.7803922, 0, 1, 1,
0.8902044, -1.156011, 2.161245, 0.7882353, 0, 1, 1,
0.8935204, -0.3142927, 2.087566, 0.7921569, 0, 1, 1,
0.8982431, 1.729696, -0.4787916, 0.8, 0, 1, 1,
0.905425, -1.592287, 3.86887, 0.8078431, 0, 1, 1,
0.908456, 0.1484911, 0.3758072, 0.8117647, 0, 1, 1,
0.9119709, 2.10996, 1.135315, 0.8196079, 0, 1, 1,
0.9131154, -0.3042005, 1.093828, 0.8235294, 0, 1, 1,
0.9131365, -2.024869, 1.155388, 0.8313726, 0, 1, 1,
0.9178923, -1.190878, 3.295486, 0.8352941, 0, 1, 1,
0.9253122, -1.436988, 3.630895, 0.8431373, 0, 1, 1,
0.9273885, -1.981121, 3.851667, 0.8470588, 0, 1, 1,
0.9290809, -1.760226, 3.698263, 0.854902, 0, 1, 1,
0.9308283, 1.11146, 1.958034, 0.8588235, 0, 1, 1,
0.9312453, -0.1784698, 2.513158, 0.8666667, 0, 1, 1,
0.9383501, 0.1799351, 2.116579, 0.8705882, 0, 1, 1,
0.9419418, -0.9948164, 3.171416, 0.8784314, 0, 1, 1,
0.9421024, 0.2225801, 2.458489, 0.8823529, 0, 1, 1,
0.9476494, -0.6113228, 4.199049, 0.8901961, 0, 1, 1,
0.9477861, -1.535007, 2.71809, 0.8941177, 0, 1, 1,
0.9498965, -0.4590347, 0.578667, 0.9019608, 0, 1, 1,
0.9601997, -0.5921609, 1.202968, 0.9098039, 0, 1, 1,
0.9706359, -0.3622171, 1.544256, 0.9137255, 0, 1, 1,
0.9712865, 0.7282351, 2.112417, 0.9215686, 0, 1, 1,
0.972867, -1.061342, 1.259841, 0.9254902, 0, 1, 1,
0.9764531, -0.4026436, 1.818272, 0.9333333, 0, 1, 1,
0.978745, -1.23427, 1.569314, 0.9372549, 0, 1, 1,
0.9798812, -2.142574, 2.167381, 0.945098, 0, 1, 1,
0.9805366, 0.637408, 1.72368, 0.9490196, 0, 1, 1,
0.9814896, 0.1604352, 0.8479285, 0.9568627, 0, 1, 1,
0.9830119, 0.4315436, 1.661516, 0.9607843, 0, 1, 1,
0.9857559, -0.4685226, 3.266326, 0.9686275, 0, 1, 1,
0.9888933, 0.5230406, 2.319419, 0.972549, 0, 1, 1,
0.9901381, 0.6325076, 2.577927, 0.9803922, 0, 1, 1,
0.9902462, 1.369133, -0.3018777, 0.9843137, 0, 1, 1,
0.9923251, -2.282399, 4.316268, 0.9921569, 0, 1, 1,
0.9942634, -1.754301, 0.6431676, 0.9960784, 0, 1, 1,
0.9959962, -0.234869, 0.7629261, 1, 0, 0.9960784, 1,
1.001215, 0.7489696, -1.124421, 1, 0, 0.9882353, 1,
1.006143, 0.5005571, 1.598736, 1, 0, 0.9843137, 1,
1.008435, -0.9164337, 1.23164, 1, 0, 0.9764706, 1,
1.009773, 0.1093903, 1.416583, 1, 0, 0.972549, 1,
1.023973, 2.164359, 0.653831, 1, 0, 0.9647059, 1,
1.024192, -0.8112262, 1.236916, 1, 0, 0.9607843, 1,
1.028947, -0.539339, 1.128339, 1, 0, 0.9529412, 1,
1.029163, 0.196715, 1.658015, 1, 0, 0.9490196, 1,
1.038907, -0.01264587, 0.9307789, 1, 0, 0.9411765, 1,
1.039527, 0.3258261, 0.7513172, 1, 0, 0.9372549, 1,
1.043006, 1.67147, 1.963965, 1, 0, 0.9294118, 1,
1.044574, -0.760028, 1.622426, 1, 0, 0.9254902, 1,
1.052086, -0.1977031, 0.9528604, 1, 0, 0.9176471, 1,
1.054568, 1.842465, -0.1449965, 1, 0, 0.9137255, 1,
1.060274, -1.343229, 2.643669, 1, 0, 0.9058824, 1,
1.061102, -0.39954, 2.318331, 1, 0, 0.9019608, 1,
1.066437, 0.5302411, -0.1320805, 1, 0, 0.8941177, 1,
1.067107, 0.9223304, 0.6972213, 1, 0, 0.8862745, 1,
1.070846, -1.755631, 2.149739, 1, 0, 0.8823529, 1,
1.071094, 0.1189602, 0.2663853, 1, 0, 0.8745098, 1,
1.074117, 0.6336689, 0.3669319, 1, 0, 0.8705882, 1,
1.080213, -2.147115, 1.961614, 1, 0, 0.8627451, 1,
1.098159, -0.7677344, 2.69408, 1, 0, 0.8588235, 1,
1.099519, -0.1179452, 2.972037, 1, 0, 0.8509804, 1,
1.102575, -0.4184711, 1.631346, 1, 0, 0.8470588, 1,
1.105035, 0.3910092, 0.5822771, 1, 0, 0.8392157, 1,
1.109484, -0.8374467, 0.4163338, 1, 0, 0.8352941, 1,
1.11045, 0.4294459, 2.693427, 1, 0, 0.827451, 1,
1.115835, 0.8972663, 2.288014, 1, 0, 0.8235294, 1,
1.117292, 1.664144, -1.113502, 1, 0, 0.8156863, 1,
1.131657, -1.084276, 2.669993, 1, 0, 0.8117647, 1,
1.133548, -1.269156, 4.185919, 1, 0, 0.8039216, 1,
1.136433, -0.4807261, 0.8407447, 1, 0, 0.7960784, 1,
1.137144, -0.8023381, 1.1838, 1, 0, 0.7921569, 1,
1.138718, 1.996824, -1.800753, 1, 0, 0.7843137, 1,
1.141987, 1.693459, 1.504565, 1, 0, 0.7803922, 1,
1.152442, -0.2484325, 0.3631521, 1, 0, 0.772549, 1,
1.153429, 0.1167689, 2.184823, 1, 0, 0.7686275, 1,
1.175906, -0.5252172, 2.312668, 1, 0, 0.7607843, 1,
1.18504, -0.8931053, 2.814456, 1, 0, 0.7568628, 1,
1.196877, -0.3468775, 3.014179, 1, 0, 0.7490196, 1,
1.201754, 2.028204, 0.3625413, 1, 0, 0.7450981, 1,
1.204238, -0.09449982, 1.53812, 1, 0, 0.7372549, 1,
1.205401, -0.1990531, 3.078838, 1, 0, 0.7333333, 1,
1.206199, -0.8130813, 1.729913, 1, 0, 0.7254902, 1,
1.207228, 0.7371685, 0.1681003, 1, 0, 0.7215686, 1,
1.214614, -1.217184, 1.748086, 1, 0, 0.7137255, 1,
1.215067, 0.7906249, 0.5696695, 1, 0, 0.7098039, 1,
1.21566, -0.6310485, 1.917726, 1, 0, 0.7019608, 1,
1.232635, 1.119704, 0.7564399, 1, 0, 0.6941177, 1,
1.235437, -0.5498086, 1.241216, 1, 0, 0.6901961, 1,
1.240252, -1.265257, 2.950746, 1, 0, 0.682353, 1,
1.241554, 0.229789, 2.41996, 1, 0, 0.6784314, 1,
1.246228, 2.113759, -0.8221694, 1, 0, 0.6705883, 1,
1.254408, 1.185664, -0.6581094, 1, 0, 0.6666667, 1,
1.25448, 1.007923, -0.5344512, 1, 0, 0.6588235, 1,
1.264887, 0.03545236, 2.57344, 1, 0, 0.654902, 1,
1.268382, -1.916765, 3.265221, 1, 0, 0.6470588, 1,
1.269324, -0.04996394, 1.820428, 1, 0, 0.6431373, 1,
1.28357, 0.9789336, 0.02209757, 1, 0, 0.6352941, 1,
1.289031, 0.3003133, 3.14111, 1, 0, 0.6313726, 1,
1.293645, 0.8943672, 0.3774091, 1, 0, 0.6235294, 1,
1.296574, -2.493048, 1.767685, 1, 0, 0.6196079, 1,
1.29932, 0.7680957, 0.147631, 1, 0, 0.6117647, 1,
1.299568, -1.44701, 2.230304, 1, 0, 0.6078432, 1,
1.299744, -0.4617463, 2.219679, 1, 0, 0.6, 1,
1.309464, -1.407171, 2.063375, 1, 0, 0.5921569, 1,
1.311005, 0.868502, 1.771374, 1, 0, 0.5882353, 1,
1.324369, -1.070401, 1.550138, 1, 0, 0.5803922, 1,
1.329231, -0.6980942, 2.97784, 1, 0, 0.5764706, 1,
1.337389, 0.7877463, 0.1828084, 1, 0, 0.5686275, 1,
1.33873, -1.292304, 2.222018, 1, 0, 0.5647059, 1,
1.343691, 0.6032838, 1.232037, 1, 0, 0.5568628, 1,
1.344819, 0.7121608, 0.8159206, 1, 0, 0.5529412, 1,
1.3581, -0.8938177, 1.561604, 1, 0, 0.5450981, 1,
1.360188, -0.008852731, 1.013419, 1, 0, 0.5411765, 1,
1.368924, 0.5320419, 3.09078, 1, 0, 0.5333334, 1,
1.37476, 1.775028, 1.701395, 1, 0, 0.5294118, 1,
1.377758, 0.4176452, 1.708827, 1, 0, 0.5215687, 1,
1.378079, 0.3822933, 2.600704, 1, 0, 0.5176471, 1,
1.381106, 0.004736547, 3.128938, 1, 0, 0.509804, 1,
1.390133, -0.440556, 2.074825, 1, 0, 0.5058824, 1,
1.391656, -0.0232923, 2.698011, 1, 0, 0.4980392, 1,
1.413153, -1.296512, 0.4121963, 1, 0, 0.4901961, 1,
1.416441, 0.3613223, -0.8902551, 1, 0, 0.4862745, 1,
1.418503, -1.715166, 1.656222, 1, 0, 0.4784314, 1,
1.426583, -0.790321, 3.370458, 1, 0, 0.4745098, 1,
1.429137, -0.4746772, 2.895009, 1, 0, 0.4666667, 1,
1.434412, 0.06959681, -0.3997073, 1, 0, 0.4627451, 1,
1.43993, 1.750969, 1.748101, 1, 0, 0.454902, 1,
1.442628, 1.168622, 0.9412318, 1, 0, 0.4509804, 1,
1.445443, 0.3977114, 1.697995, 1, 0, 0.4431373, 1,
1.453467, -0.2670085, 0.1025779, 1, 0, 0.4392157, 1,
1.457524, 0.07421377, 2.818356, 1, 0, 0.4313726, 1,
1.467423, 0.9841133, 0.5234712, 1, 0, 0.427451, 1,
1.471609, -0.8367428, 2.351905, 1, 0, 0.4196078, 1,
1.475326, -0.5198172, 0.6053071, 1, 0, 0.4156863, 1,
1.478566, -1.743257, 2.838041, 1, 0, 0.4078431, 1,
1.484551, -0.1371183, 0.3847604, 1, 0, 0.4039216, 1,
1.497822, -0.3429921, 1.239852, 1, 0, 0.3960784, 1,
1.49921, 1.868518, 0.4098524, 1, 0, 0.3882353, 1,
1.499449, -1.330576, 2.024646, 1, 0, 0.3843137, 1,
1.507604, -0.004106848, 1.511654, 1, 0, 0.3764706, 1,
1.51066, 0.9243155, 1.52167, 1, 0, 0.372549, 1,
1.512088, 0.1287663, -0.7825068, 1, 0, 0.3647059, 1,
1.518437, 1.984363, -0.2323003, 1, 0, 0.3607843, 1,
1.519284, -0.8648046, 1.511816, 1, 0, 0.3529412, 1,
1.520943, 2.073705, 0.8646449, 1, 0, 0.3490196, 1,
1.535268, 0.7247452, 2.040832, 1, 0, 0.3411765, 1,
1.541921, 0.6829437, 1.552384, 1, 0, 0.3372549, 1,
1.550664, -0.03909795, 1.226661, 1, 0, 0.3294118, 1,
1.585278, -0.4667422, 3.467221, 1, 0, 0.3254902, 1,
1.62223, 1.822213, 0.3144821, 1, 0, 0.3176471, 1,
1.626475, 0.05353384, 1.122356, 1, 0, 0.3137255, 1,
1.630067, 0.05978865, 0.7329627, 1, 0, 0.3058824, 1,
1.641826, -1.279583, 0.4001303, 1, 0, 0.2980392, 1,
1.652949, -0.1372258, 4.089972, 1, 0, 0.2941177, 1,
1.663182, -1.142577, 2.597516, 1, 0, 0.2862745, 1,
1.678926, -0.682446, 2.537148, 1, 0, 0.282353, 1,
1.69511, 0.3455311, 1.973523, 1, 0, 0.2745098, 1,
1.697173, -0.02817261, 1.545737, 1, 0, 0.2705882, 1,
1.706715, 0.2725294, 2.399594, 1, 0, 0.2627451, 1,
1.70791, 0.8600435, 0.2730044, 1, 0, 0.2588235, 1,
1.720451, -1.672104, 1.562366, 1, 0, 0.2509804, 1,
1.720672, -0.2102519, 1.61169, 1, 0, 0.2470588, 1,
1.739901, 1.416345, -0.8634359, 1, 0, 0.2392157, 1,
1.745605, -0.8908387, -0.2405618, 1, 0, 0.2352941, 1,
1.756442, 1.128961, 0.1132806, 1, 0, 0.227451, 1,
1.762747, -0.7219629, 1.526389, 1, 0, 0.2235294, 1,
1.768502, -1.187511, 1.028563, 1, 0, 0.2156863, 1,
1.772199, 1.022503, 1.453032, 1, 0, 0.2117647, 1,
1.81933, -0.8317629, -0.3518491, 1, 0, 0.2039216, 1,
1.841305, -0.1644591, 1.502254, 1, 0, 0.1960784, 1,
1.842121, 1.14577, 2.212747, 1, 0, 0.1921569, 1,
1.853606, 1.271186, 0.7987506, 1, 0, 0.1843137, 1,
1.858572, 0.5561014, 0.325525, 1, 0, 0.1803922, 1,
1.870817, 0.3264609, 3.017805, 1, 0, 0.172549, 1,
1.883721, -0.6537156, 1.80897, 1, 0, 0.1686275, 1,
1.915224, 1.291645, 0.7267267, 1, 0, 0.1607843, 1,
1.954153, 1.411728, -0.2461767, 1, 0, 0.1568628, 1,
1.957991, 0.4532281, 0.7140102, 1, 0, 0.1490196, 1,
2.000106, -2.180883, 0.4288526, 1, 0, 0.145098, 1,
2.006144, -0.7702783, 2.216201, 1, 0, 0.1372549, 1,
2.029486, 2.720718, 0.5231185, 1, 0, 0.1333333, 1,
2.036258, 2.552305, 0.2381448, 1, 0, 0.1254902, 1,
2.06494, 0.6516581, 2.799347, 1, 0, 0.1215686, 1,
2.069844, -0.9533306, 2.534822, 1, 0, 0.1137255, 1,
2.07871, 0.713519, 0.2974554, 1, 0, 0.1098039, 1,
2.090383, -0.09420791, 1.917054, 1, 0, 0.1019608, 1,
2.096337, -0.1384277, 1.061065, 1, 0, 0.09411765, 1,
2.140891, 0.6395223, 2.204227, 1, 0, 0.09019608, 1,
2.141808, -2.579329, 5.34563, 1, 0, 0.08235294, 1,
2.213019, -0.6293578, 2.048568, 1, 0, 0.07843138, 1,
2.237032, -0.8194318, 1.333748, 1, 0, 0.07058824, 1,
2.26675, -1.600727, 2.107174, 1, 0, 0.06666667, 1,
2.275322, -0.8760001, 3.058433, 1, 0, 0.05882353, 1,
2.33071, -0.4460911, 1.972455, 1, 0, 0.05490196, 1,
2.367317, 0.0349962, 1.528485, 1, 0, 0.04705882, 1,
2.437563, -0.8284664, 2.282881, 1, 0, 0.04313726, 1,
2.516773, -0.6560598, 0.8608728, 1, 0, 0.03529412, 1,
2.628266, 0.6055092, 1.276343, 1, 0, 0.03137255, 1,
2.723794, 0.6122721, 1.359249, 1, 0, 0.02352941, 1,
2.806699, -0.6221913, 0.5234029, 1, 0, 0.01960784, 1,
3.1553, -1.593877, 2.186352, 1, 0, 0.01176471, 1,
3.781357, 0.5996637, 2.448332, 1, 0, 0.007843138, 1
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
0.5075036, -4.338678, -7.141024, 0, -0.5, 0.5, 0.5,
0.5075036, -4.338678, -7.141024, 1, -0.5, 0.5, 0.5,
0.5075036, -4.338678, -7.141024, 1, 1.5, 0.5, 0.5,
0.5075036, -4.338678, -7.141024, 0, 1.5, 0.5, 0.5
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
-3.876186, -0.1389918, -7.141024, 0, -0.5, 0.5, 0.5,
-3.876186, -0.1389918, -7.141024, 1, -0.5, 0.5, 0.5,
-3.876186, -0.1389918, -7.141024, 1, 1.5, 0.5, 0.5,
-3.876186, -0.1389918, -7.141024, 0, 1.5, 0.5, 0.5
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
-3.876186, -4.338678, 0.3648369, 0, -0.5, 0.5, 0.5,
-3.876186, -4.338678, 0.3648369, 1, -0.5, 0.5, 0.5,
-3.876186, -4.338678, 0.3648369, 1, 1.5, 0.5, 0.5,
-3.876186, -4.338678, 0.3648369, 0, 1.5, 0.5, 0.5
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
-2, -3.36952, -5.408902,
3, -3.36952, -5.408902,
-2, -3.36952, -5.408902,
-2, -3.531046, -5.697589,
-1, -3.36952, -5.408902,
-1, -3.531046, -5.697589,
0, -3.36952, -5.408902,
0, -3.531046, -5.697589,
1, -3.36952, -5.408902,
1, -3.531046, -5.697589,
2, -3.36952, -5.408902,
2, -3.531046, -5.697589,
3, -3.36952, -5.408902,
3, -3.531046, -5.697589
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
-2, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
-2, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
-2, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
-2, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5,
-1, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
-1, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
-1, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
-1, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5,
0, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
0, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
0, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
0, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5,
1, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
1, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
1, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
1, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5,
2, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
2, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
2, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
2, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5,
3, -3.854099, -6.274963, 0, -0.5, 0.5, 0.5,
3, -3.854099, -6.274963, 1, -0.5, 0.5, 0.5,
3, -3.854099, -6.274963, 1, 1.5, 0.5, 0.5,
3, -3.854099, -6.274963, 0, 1.5, 0.5, 0.5
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
-2.864565, -3, -5.408902,
-2.864565, 2, -5.408902,
-2.864565, -3, -5.408902,
-3.033169, -3, -5.697589,
-2.864565, -2, -5.408902,
-3.033169, -2, -5.697589,
-2.864565, -1, -5.408902,
-3.033169, -1, -5.697589,
-2.864565, 0, -5.408902,
-3.033169, 0, -5.697589,
-2.864565, 1, -5.408902,
-3.033169, 1, -5.697589,
-2.864565, 2, -5.408902,
-3.033169, 2, -5.697589
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
-3.370376, -3, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, -3, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, -3, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, -3, -6.274963, 0, 1.5, 0.5, 0.5,
-3.370376, -2, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, -2, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, -2, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, -2, -6.274963, 0, 1.5, 0.5, 0.5,
-3.370376, -1, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, -1, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, -1, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, -1, -6.274963, 0, 1.5, 0.5, 0.5,
-3.370376, 0, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, 0, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, 0, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, 0, -6.274963, 0, 1.5, 0.5, 0.5,
-3.370376, 1, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, 1, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, 1, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, 1, -6.274963, 0, 1.5, 0.5, 0.5,
-3.370376, 2, -6.274963, 0, -0.5, 0.5, 0.5,
-3.370376, 2, -6.274963, 1, -0.5, 0.5, 0.5,
-3.370376, 2, -6.274963, 1, 1.5, 0.5, 0.5,
-3.370376, 2, -6.274963, 0, 1.5, 0.5, 0.5
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
-2.864565, -3.36952, -4,
-2.864565, -3.36952, 4,
-2.864565, -3.36952, -4,
-3.033169, -3.531046, -4,
-2.864565, -3.36952, -2,
-3.033169, -3.531046, -2,
-2.864565, -3.36952, 0,
-3.033169, -3.531046, 0,
-2.864565, -3.36952, 2,
-3.033169, -3.531046, 2,
-2.864565, -3.36952, 4,
-3.033169, -3.531046, 4
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
-3.370376, -3.854099, -4, 0, -0.5, 0.5, 0.5,
-3.370376, -3.854099, -4, 1, -0.5, 0.5, 0.5,
-3.370376, -3.854099, -4, 1, 1.5, 0.5, 0.5,
-3.370376, -3.854099, -4, 0, 1.5, 0.5, 0.5,
-3.370376, -3.854099, -2, 0, -0.5, 0.5, 0.5,
-3.370376, -3.854099, -2, 1, -0.5, 0.5, 0.5,
-3.370376, -3.854099, -2, 1, 1.5, 0.5, 0.5,
-3.370376, -3.854099, -2, 0, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 0, 0, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 0, 1, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 0, 1, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 0, 0, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 2, 0, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 2, 1, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 2, 1, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 2, 0, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 4, 0, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 4, 1, -0.5, 0.5, 0.5,
-3.370376, -3.854099, 4, 1, 1.5, 0.5, 0.5,
-3.370376, -3.854099, 4, 0, 1.5, 0.5, 0.5
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
-2.864565, -3.36952, -5.408902,
-2.864565, 3.091536, -5.408902,
-2.864565, -3.36952, 6.138576,
-2.864565, 3.091536, 6.138576,
-2.864565, -3.36952, -5.408902,
-2.864565, -3.36952, 6.138576,
-2.864565, 3.091536, -5.408902,
-2.864565, 3.091536, 6.138576,
-2.864565, -3.36952, -5.408902,
3.879573, -3.36952, -5.408902,
-2.864565, -3.36952, 6.138576,
3.879573, -3.36952, 6.138576,
-2.864565, 3.091536, -5.408902,
3.879573, 3.091536, -5.408902,
-2.864565, 3.091536, 6.138576,
3.879573, 3.091536, 6.138576,
3.879573, -3.36952, -5.408902,
3.879573, 3.091536, -5.408902,
3.879573, -3.36952, 6.138576,
3.879573, 3.091536, 6.138576,
3.879573, -3.36952, -5.408902,
3.879573, -3.36952, 6.138576,
3.879573, 3.091536, -5.408902,
3.879573, 3.091536, 6.138576
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
var radius = 7.930518;
var distance = 35.28377;
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
mvMatrix.translate( -0.5075036, 0.1389918, -0.3648369 );
mvMatrix.scale( 1.27142, 1.327125, 0.7425544 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.28377);
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
methyl_sulfide_methy<-read.table("methyl_sulfide_methy.xyz", skip=1)
x<-methyl_sulfide_methy$V2
y<-methyl_sulfide_methy$V3
z<-methyl_sulfide_methy$V4
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
6, 11, 2, 0, 0, 1, 1, 1,
3, 6, 1, 1, 0, 0, 1, 1,
3, 8, 1, 1, 0, 0, 1, 1,
4, 9, 1, 1, 0, 0, 1, 1,
1, 9, 1, 1, 0, 0, 1, 1,
3, 7, 1, 1, 0, 0, 1, 1,
3, 5, 1, 0, 0, 0, 1, 1,
4, 3, 1, 0, 0, 0, 1, 1,
4, 1, 1, 0, 0, 0, 1, 1,
3, 2, 1, 0, 0, 0, 1, 1,
1, 1, 1, 0, 0, 0, 1, 1,
1, 3, 1, 0, 0, 0, 1, 1,
3, 4, 1, 0, 0, 0, 1, 1,
2, 4, 1, 1, 1, 1, 1, 1,
5, 4, 1, 1, 1, 1, 1, 1,
1, 10, 1, 1, 1, 1, 1, 1,
2, 6, 1, 1, 1, 1, 1, 1,
5, 6, 1, 1, 1, 1, 1, 1
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
var radius = 7.816969;
var distance = 27.45677;
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
mvMatrix.translate( -3.5, -6, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -27.45677);
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
for (var i = 0; i < 18; i++) {
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