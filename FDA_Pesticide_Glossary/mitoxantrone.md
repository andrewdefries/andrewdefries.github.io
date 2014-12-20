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
-3.120581, 1.498345, 0.686732, 1, 0, 0, 1,
-3.005921, -2.528676, -3.684227, 1, 0.007843138, 0, 1,
-2.957074, 0.4417464, -0.8221265, 1, 0.01176471, 0, 1,
-2.707214, 0.1733675, -1.405878, 1, 0.01960784, 0, 1,
-2.653728, -1.323127, -2.238246, 1, 0.02352941, 0, 1,
-2.56426, -1.52287, -2.456458, 1, 0.03137255, 0, 1,
-2.460768, 0.5879096, -2.173027, 1, 0.03529412, 0, 1,
-2.394127, -1.077857, -2.046623, 1, 0.04313726, 0, 1,
-2.367958, 0.6539284, -1.669934, 1, 0.04705882, 0, 1,
-2.281323, 2.160929, -0.01588661, 1, 0.05490196, 0, 1,
-2.280833, -1.206223, -1.789067, 1, 0.05882353, 0, 1,
-2.241695, -0.3057633, -0.3736658, 1, 0.06666667, 0, 1,
-2.236079, -2.19126, -3.685288, 1, 0.07058824, 0, 1,
-2.076253, -1.256805, -1.347489, 1, 0.07843138, 0, 1,
-2.075608, 0.4462284, -1.846463, 1, 0.08235294, 0, 1,
-2.044582, 1.01104, -0.7875417, 1, 0.09019608, 0, 1,
-1.977662, 0.6094162, -0.1520217, 1, 0.09411765, 0, 1,
-1.937216, -0.9671113, -1.112808, 1, 0.1019608, 0, 1,
-1.917573, -0.9691644, -2.42635, 1, 0.1098039, 0, 1,
-1.886079, 1.317362, -2.485097, 1, 0.1137255, 0, 1,
-1.856183, 0.1473306, -1.365193, 1, 0.1215686, 0, 1,
-1.826103, -0.7987524, -1.84227, 1, 0.1254902, 0, 1,
-1.825156, -0.4202014, -2.445788, 1, 0.1333333, 0, 1,
-1.817014, -2.20094, -2.916294, 1, 0.1372549, 0, 1,
-1.802174, 0.9345803, -1.539505, 1, 0.145098, 0, 1,
-1.796616, 0.2750842, -1.652519, 1, 0.1490196, 0, 1,
-1.783668, 0.1844065, -1.527753, 1, 0.1568628, 0, 1,
-1.757183, -1.711087, -3.870342, 1, 0.1607843, 0, 1,
-1.749971, 0.06707411, -3.833115, 1, 0.1686275, 0, 1,
-1.697695, 0.1595284, -1.566133, 1, 0.172549, 0, 1,
-1.695438, -1.486246, -1.384794, 1, 0.1803922, 0, 1,
-1.693111, -0.757461, -0.971124, 1, 0.1843137, 0, 1,
-1.690944, 0.3614274, -1.130672, 1, 0.1921569, 0, 1,
-1.685776, 0.9125657, 0.7175039, 1, 0.1960784, 0, 1,
-1.671793, 1.115545, -3.008707, 1, 0.2039216, 0, 1,
-1.670652, -0.6603847, -2.878311, 1, 0.2117647, 0, 1,
-1.649853, 0.9386024, -0.8135526, 1, 0.2156863, 0, 1,
-1.640596, -2.058684, -3.930253, 1, 0.2235294, 0, 1,
-1.638131, -0.2014509, -1.607687, 1, 0.227451, 0, 1,
-1.632436, 0.0611372, -3.082096, 1, 0.2352941, 0, 1,
-1.623653, 0.4354392, -1.599872, 1, 0.2392157, 0, 1,
-1.605421, 0.3647877, -1.372649, 1, 0.2470588, 0, 1,
-1.577152, 2.067712, -1.06314, 1, 0.2509804, 0, 1,
-1.572673, 0.5113155, -2.275061, 1, 0.2588235, 0, 1,
-1.570134, -0.7616847, -1.166659, 1, 0.2627451, 0, 1,
-1.568529, 0.8519964, -1.670609, 1, 0.2705882, 0, 1,
-1.561731, -0.7281478, -2.728124, 1, 0.2745098, 0, 1,
-1.558854, 0.8859597, -1.143026, 1, 0.282353, 0, 1,
-1.545338, 2.837505, -0.7142414, 1, 0.2862745, 0, 1,
-1.543367, -0.2084249, -1.064349, 1, 0.2941177, 0, 1,
-1.53383, 1.23963, -1.863732, 1, 0.3019608, 0, 1,
-1.521514, -1.411291, -1.887655, 1, 0.3058824, 0, 1,
-1.510225, -1.306498, -2.083045, 1, 0.3137255, 0, 1,
-1.505902, -0.1389961, -1.550744, 1, 0.3176471, 0, 1,
-1.505573, 0.082683, -1.553494, 1, 0.3254902, 0, 1,
-1.501446, -0.8085836, -3.749074, 1, 0.3294118, 0, 1,
-1.49322, -0.8010983, -0.7403184, 1, 0.3372549, 0, 1,
-1.477691, -0.3727544, -1.842997, 1, 0.3411765, 0, 1,
-1.453126, -1.285492, -2.66548, 1, 0.3490196, 0, 1,
-1.44681, 1.3373, -2.032192, 1, 0.3529412, 0, 1,
-1.445838, -0.2150761, -2.631478, 1, 0.3607843, 0, 1,
-1.441394, -1.465064, -2.217656, 1, 0.3647059, 0, 1,
-1.438776, 1.150226, -0.7909584, 1, 0.372549, 0, 1,
-1.42742, 0.3023019, -1.513617, 1, 0.3764706, 0, 1,
-1.426205, 0.338365, -1.801377, 1, 0.3843137, 0, 1,
-1.424748, -0.8058572, -2.694554, 1, 0.3882353, 0, 1,
-1.419967, 2.078476, 1.053515, 1, 0.3960784, 0, 1,
-1.411625, -0.06489943, -2.039481, 1, 0.4039216, 0, 1,
-1.411223, -0.5590484, -0.8867539, 1, 0.4078431, 0, 1,
-1.404947, 1.049454, 0.2745989, 1, 0.4156863, 0, 1,
-1.400153, -0.4900761, -0.6584177, 1, 0.4196078, 0, 1,
-1.384924, -2.284314, -4.302345, 1, 0.427451, 0, 1,
-1.378866, 0.1425968, -2.390065, 1, 0.4313726, 0, 1,
-1.361779, 0.4082227, -1.203003, 1, 0.4392157, 0, 1,
-1.347169, -0.1905208, -1.850441, 1, 0.4431373, 0, 1,
-1.342432, -0.7508854, -2.456176, 1, 0.4509804, 0, 1,
-1.338841, 0.2137076, 0.3733023, 1, 0.454902, 0, 1,
-1.337235, 1.149637, 0.4827033, 1, 0.4627451, 0, 1,
-1.329399, -0.6347927, -1.863435, 1, 0.4666667, 0, 1,
-1.308447, 1.585099, 0.1014113, 1, 0.4745098, 0, 1,
-1.288922, 0.9143841, -1.612596, 1, 0.4784314, 0, 1,
-1.288614, -0.0667692, -0.8454883, 1, 0.4862745, 0, 1,
-1.28325, -0.3631477, 0.6319216, 1, 0.4901961, 0, 1,
-1.281465, -0.8559721, -0.7862014, 1, 0.4980392, 0, 1,
-1.268775, 0.1185298, -1.147141, 1, 0.5058824, 0, 1,
-1.267477, -2.159904, -4.211114, 1, 0.509804, 0, 1,
-1.262977, -0.4200089, -1.392596, 1, 0.5176471, 0, 1,
-1.262469, 1.052335, -0.2326001, 1, 0.5215687, 0, 1,
-1.241097, -1.311619, -1.223248, 1, 0.5294118, 0, 1,
-1.219679, 0.1094668, -1.90072, 1, 0.5333334, 0, 1,
-1.21844, 1.830962, -0.3776822, 1, 0.5411765, 0, 1,
-1.20479, -0.3662311, -1.826886, 1, 0.5450981, 0, 1,
-1.20288, 0.1313872, -1.595281, 1, 0.5529412, 0, 1,
-1.200743, -1.240191, -0.1634411, 1, 0.5568628, 0, 1,
-1.196134, 0.7021427, -1.897755, 1, 0.5647059, 0, 1,
-1.184512, -0.7468259, -2.949093, 1, 0.5686275, 0, 1,
-1.174514, 1.58994, 0.7378346, 1, 0.5764706, 0, 1,
-1.170715, 1.18645, -1.237582, 1, 0.5803922, 0, 1,
-1.163434, 0.4009809, -0.7279175, 1, 0.5882353, 0, 1,
-1.153812, 2.109323, -0.2788784, 1, 0.5921569, 0, 1,
-1.146074, -0.6298746, -2.642318, 1, 0.6, 0, 1,
-1.143815, -0.7803026, -2.406992, 1, 0.6078432, 0, 1,
-1.141929, -0.45248, -1.684641, 1, 0.6117647, 0, 1,
-1.140966, -2.570615, -3.128974, 1, 0.6196079, 0, 1,
-1.140865, 0.8802564, -1.94186, 1, 0.6235294, 0, 1,
-1.128328, 1.949652, -1.838527, 1, 0.6313726, 0, 1,
-1.119712, 0.7042724, 0.548709, 1, 0.6352941, 0, 1,
-1.114789, -0.1447394, -1.574319, 1, 0.6431373, 0, 1,
-1.114673, -0.6933945, -1.991625, 1, 0.6470588, 0, 1,
-1.112181, 0.9425157, -1.740704, 1, 0.654902, 0, 1,
-1.099618, -2.148695, -3.08771, 1, 0.6588235, 0, 1,
-1.097624, 1.247158, 0.595052, 1, 0.6666667, 0, 1,
-1.097341, -0.7625239, -1.570575, 1, 0.6705883, 0, 1,
-1.0904, 1.514331, 0.8646546, 1, 0.6784314, 0, 1,
-1.08835, -0.005131642, -1.349169, 1, 0.682353, 0, 1,
-1.08667, 0.4891285, -0.7838097, 1, 0.6901961, 0, 1,
-1.085342, 0.839815, -0.8986475, 1, 0.6941177, 0, 1,
-1.080786, 0.8373435, -0.731499, 1, 0.7019608, 0, 1,
-1.079881, -1.317474, -1.950441, 1, 0.7098039, 0, 1,
-1.072025, -2.218789, -1.267016, 1, 0.7137255, 0, 1,
-1.064311, 1.196589, -1.309724, 1, 0.7215686, 0, 1,
-1.059201, -0.4156698, -3.565976, 1, 0.7254902, 0, 1,
-1.050506, -0.374539, -3.66459, 1, 0.7333333, 0, 1,
-1.042186, -0.3237198, -1.647388, 1, 0.7372549, 0, 1,
-1.041125, 0.2025031, -1.862933, 1, 0.7450981, 0, 1,
-1.039536, -0.8929851, -1.417086, 1, 0.7490196, 0, 1,
-1.039034, -0.1280986, -1.800842, 1, 0.7568628, 0, 1,
-1.033608, 1.056121, -0.2575195, 1, 0.7607843, 0, 1,
-1.030786, 0.6629844, -2.378165, 1, 0.7686275, 0, 1,
-1.027881, -1.198196, -3.174446, 1, 0.772549, 0, 1,
-1.027152, 2.25073, -0.5649031, 1, 0.7803922, 0, 1,
-1.025359, 1.334426, -0.6079946, 1, 0.7843137, 0, 1,
-1.022894, 1.174407, -1.098232, 1, 0.7921569, 0, 1,
-1.015268, 0.6514233, -0.538919, 1, 0.7960784, 0, 1,
-0.9983783, 1.61899, 0.7421394, 1, 0.8039216, 0, 1,
-0.9942603, -1.092165, -2.922621, 1, 0.8117647, 0, 1,
-0.9895617, 0.02637966, -1.928324, 1, 0.8156863, 0, 1,
-0.9858645, -0.7419519, -3.367304, 1, 0.8235294, 0, 1,
-0.9795077, 0.5646477, -0.4637178, 1, 0.827451, 0, 1,
-0.9787054, 0.8508567, -0.1459443, 1, 0.8352941, 0, 1,
-0.9743953, -0.596642, -1.753114, 1, 0.8392157, 0, 1,
-0.9712138, 0.7083512, -0.04741875, 1, 0.8470588, 0, 1,
-0.969908, -1.584576, -2.394883, 1, 0.8509804, 0, 1,
-0.9585071, -0.9620587, -2.534423, 1, 0.8588235, 0, 1,
-0.9579836, 0.595079, -1.585589, 1, 0.8627451, 0, 1,
-0.948788, 1.429884, -1.67321, 1, 0.8705882, 0, 1,
-0.9476812, -0.3550646, -2.180303, 1, 0.8745098, 0, 1,
-0.9426828, -0.3139819, -1.918101, 1, 0.8823529, 0, 1,
-0.9408296, -0.6884059, -2.155154, 1, 0.8862745, 0, 1,
-0.9308085, 0.6707737, -1.887792, 1, 0.8941177, 0, 1,
-0.9295655, 0.1887712, -0.4869819, 1, 0.8980392, 0, 1,
-0.9288304, 0.2021925, -1.282439, 1, 0.9058824, 0, 1,
-0.9263593, 0.1464554, -1.445738, 1, 0.9137255, 0, 1,
-0.9254122, 0.380902, -0.04941875, 1, 0.9176471, 0, 1,
-0.9186869, -1.473369, -3.645934, 1, 0.9254902, 0, 1,
-0.9185118, 0.2433754, -1.717631, 1, 0.9294118, 0, 1,
-0.9153925, 0.5672991, -1.363817, 1, 0.9372549, 0, 1,
-0.9107533, -0.7245962, -1.785669, 1, 0.9411765, 0, 1,
-0.9099585, 0.2928269, 0.0842056, 1, 0.9490196, 0, 1,
-0.9094242, 1.068315, -0.9743589, 1, 0.9529412, 0, 1,
-0.9091893, 0.4695082, -0.4124053, 1, 0.9607843, 0, 1,
-0.9078226, 0.0990351, 0.1626237, 1, 0.9647059, 0, 1,
-0.906507, -0.3064854, -3.403405, 1, 0.972549, 0, 1,
-0.9057029, -0.4379857, -2.478447, 1, 0.9764706, 0, 1,
-0.9034488, -0.8556731, -2.132959, 1, 0.9843137, 0, 1,
-0.9003792, 0.1414186, -1.649996, 1, 0.9882353, 0, 1,
-0.8973245, -0.8148093, -3.546993, 1, 0.9960784, 0, 1,
-0.889054, -0.3211494, -0.542617, 0.9960784, 1, 0, 1,
-0.8832222, -0.4863337, -0.7106724, 0.9921569, 1, 0, 1,
-0.8722184, 0.254951, -0.0867013, 0.9843137, 1, 0, 1,
-0.8663198, -0.1178058, -0.5569735, 0.9803922, 1, 0, 1,
-0.863053, -0.6122573, -1.287998, 0.972549, 1, 0, 1,
-0.8579003, -1.042267, -5.237438, 0.9686275, 1, 0, 1,
-0.8536618, -0.9686624, -2.271105, 0.9607843, 1, 0, 1,
-0.8478091, -1.282976, -0.870609, 0.9568627, 1, 0, 1,
-0.836475, -0.5127657, -2.482825, 0.9490196, 1, 0, 1,
-0.832574, -0.6972059, -1.52687, 0.945098, 1, 0, 1,
-0.830038, -1.525544, -2.391374, 0.9372549, 1, 0, 1,
-0.8287053, -0.850937, -3.97578, 0.9333333, 1, 0, 1,
-0.8271746, 0.07027835, -0.08710846, 0.9254902, 1, 0, 1,
-0.8254585, 1.271287, 0.529965, 0.9215686, 1, 0, 1,
-0.8197734, 0.2542182, -1.41264, 0.9137255, 1, 0, 1,
-0.8146939, -0.04204028, -1.343847, 0.9098039, 1, 0, 1,
-0.8135242, 0.2777222, -1.229571, 0.9019608, 1, 0, 1,
-0.8076076, -0.01715478, -1.094884, 0.8941177, 1, 0, 1,
-0.8002256, -1.286131, -4.404933, 0.8901961, 1, 0, 1,
-0.7987036, -0.3687313, -3.204856, 0.8823529, 1, 0, 1,
-0.7984563, -1.496188, -1.828792, 0.8784314, 1, 0, 1,
-0.7955912, 1.187771, 1.422328, 0.8705882, 1, 0, 1,
-0.7878127, -0.2981293, -2.559616, 0.8666667, 1, 0, 1,
-0.7830713, -0.9745611, -2.223176, 0.8588235, 1, 0, 1,
-0.7784389, 0.02178679, -2.568545, 0.854902, 1, 0, 1,
-0.774003, 0.8512034, -2.582959, 0.8470588, 1, 0, 1,
-0.7678137, -1.048467, -3.476757, 0.8431373, 1, 0, 1,
-0.7623132, -0.5927868, -1.767451, 0.8352941, 1, 0, 1,
-0.7553122, 0.02232829, -1.458524, 0.8313726, 1, 0, 1,
-0.7510048, 0.2951975, -1.579378, 0.8235294, 1, 0, 1,
-0.7508219, 1.580557, -1.535184, 0.8196079, 1, 0, 1,
-0.7497112, 1.223918, 0.3437847, 0.8117647, 1, 0, 1,
-0.7451256, -0.949103, -3.713757, 0.8078431, 1, 0, 1,
-0.7377276, -0.7551255, -3.042444, 0.8, 1, 0, 1,
-0.7282203, -0.8496757, -2.090223, 0.7921569, 1, 0, 1,
-0.7214553, 1.385692, 0.08482322, 0.7882353, 1, 0, 1,
-0.7213423, -0.4568678, -1.94975, 0.7803922, 1, 0, 1,
-0.7208062, -0.7853585, -0.1070006, 0.7764706, 1, 0, 1,
-0.7189465, 1.027751, 0.3905665, 0.7686275, 1, 0, 1,
-0.7166022, 0.6344937, -1.170925, 0.7647059, 1, 0, 1,
-0.714774, -0.2500844, -3.068673, 0.7568628, 1, 0, 1,
-0.710802, 0.1176294, -2.740708, 0.7529412, 1, 0, 1,
-0.7093425, -2.20264, -3.880638, 0.7450981, 1, 0, 1,
-0.7082744, -1.29684, -2.993199, 0.7411765, 1, 0, 1,
-0.7068285, -0.6678736, -2.425052, 0.7333333, 1, 0, 1,
-0.6971759, -2.776238, -3.326209, 0.7294118, 1, 0, 1,
-0.6922955, -2.110344, -2.866532, 0.7215686, 1, 0, 1,
-0.6896883, -2.017784, -2.381672, 0.7176471, 1, 0, 1,
-0.6858196, 0.3758571, -1.942832, 0.7098039, 1, 0, 1,
-0.6832728, -0.4908307, -2.776017, 0.7058824, 1, 0, 1,
-0.6825131, 0.3641706, -1.371522, 0.6980392, 1, 0, 1,
-0.6808066, 0.2209931, -1.874094, 0.6901961, 1, 0, 1,
-0.6750308, 0.6949966, -0.2960359, 0.6862745, 1, 0, 1,
-0.6750147, -0.05896872, -1.335299, 0.6784314, 1, 0, 1,
-0.6622264, -1.79898, -2.803162, 0.6745098, 1, 0, 1,
-0.661158, -0.4507104, -3.05239, 0.6666667, 1, 0, 1,
-0.660238, 1.050573, -0.286086, 0.6627451, 1, 0, 1,
-0.6562055, -0.2824556, -3.749257, 0.654902, 1, 0, 1,
-0.6536248, -2.223447, -2.877231, 0.6509804, 1, 0, 1,
-0.6529119, -0.4424845, -1.518209, 0.6431373, 1, 0, 1,
-0.6525068, -0.9878717, -1.692755, 0.6392157, 1, 0, 1,
-0.6510511, 0.02279252, -1.858374, 0.6313726, 1, 0, 1,
-0.6470072, -1.858703, -2.654251, 0.627451, 1, 0, 1,
-0.6461667, 0.4706483, -1.197761, 0.6196079, 1, 0, 1,
-0.6457562, -1.077499, -1.721036, 0.6156863, 1, 0, 1,
-0.6374972, -1.094848, -3.028627, 0.6078432, 1, 0, 1,
-0.6305538, -0.7493511, -2.29994, 0.6039216, 1, 0, 1,
-0.6277878, 0.5397958, -1.610134, 0.5960785, 1, 0, 1,
-0.6260151, -0.4699474, -2.747619, 0.5882353, 1, 0, 1,
-0.6187662, -0.2359708, -2.061157, 0.5843138, 1, 0, 1,
-0.6146379, -0.03230165, -1.405819, 0.5764706, 1, 0, 1,
-0.6143302, 0.968352, -1.497572, 0.572549, 1, 0, 1,
-0.6135879, 2.131142, -1.601615, 0.5647059, 1, 0, 1,
-0.6115292, -1.276978, -4.609796, 0.5607843, 1, 0, 1,
-0.6098634, -0.3660547, -1.479615, 0.5529412, 1, 0, 1,
-0.6098192, 1.217837, -1.254838, 0.5490196, 1, 0, 1,
-0.6092912, 0.4555035, -1.994354, 0.5411765, 1, 0, 1,
-0.6063684, 0.6992838, -0.8464471, 0.5372549, 1, 0, 1,
-0.6058739, -2.016514, -2.322794, 0.5294118, 1, 0, 1,
-0.6005583, 1.86566, -1.598622, 0.5254902, 1, 0, 1,
-0.5968515, -1.075693, -1.200488, 0.5176471, 1, 0, 1,
-0.5948674, 0.8546428, -2.098872, 0.5137255, 1, 0, 1,
-0.590201, -1.009136, -3.317662, 0.5058824, 1, 0, 1,
-0.5887597, -1.013871, -2.508255, 0.5019608, 1, 0, 1,
-0.5875268, -1.013906, -2.188684, 0.4941176, 1, 0, 1,
-0.585417, 0.1050443, -3.297907, 0.4862745, 1, 0, 1,
-0.5819101, -0.5914392, -3.383953, 0.4823529, 1, 0, 1,
-0.5761292, 1.133538, -2.558765, 0.4745098, 1, 0, 1,
-0.5748242, 0.2202589, -1.43294, 0.4705882, 1, 0, 1,
-0.5740094, -1.333687, -2.586396, 0.4627451, 1, 0, 1,
-0.5687279, 1.372479, 1.315703, 0.4588235, 1, 0, 1,
-0.5654896, -0.0857113, -0.7968563, 0.4509804, 1, 0, 1,
-0.5646871, 1.772081, -0.356912, 0.4470588, 1, 0, 1,
-0.5603325, -0.25357, -2.988076, 0.4392157, 1, 0, 1,
-0.5577897, 1.080123, -0.5459916, 0.4352941, 1, 0, 1,
-0.5566255, 1.7551, 0.5912068, 0.427451, 1, 0, 1,
-0.5549754, 1.507326, 0.06911932, 0.4235294, 1, 0, 1,
-0.5529786, 1.281412, 0.6178858, 0.4156863, 1, 0, 1,
-0.5517251, -1.766238, -3.594517, 0.4117647, 1, 0, 1,
-0.5492457, -0.3159441, -2.495751, 0.4039216, 1, 0, 1,
-0.5477718, 0.9774163, 0.6184946, 0.3960784, 1, 0, 1,
-0.5477681, 1.556155, -0.5223413, 0.3921569, 1, 0, 1,
-0.5474782, 1.151334, -0.5805536, 0.3843137, 1, 0, 1,
-0.5439087, -0.03258534, -2.004247, 0.3803922, 1, 0, 1,
-0.5372145, -2.636438, -3.899247, 0.372549, 1, 0, 1,
-0.5303307, 0.9141769, -1.616624, 0.3686275, 1, 0, 1,
-0.5263175, 0.2333987, -0.7715957, 0.3607843, 1, 0, 1,
-0.5260112, -2.221513, -4.274712, 0.3568628, 1, 0, 1,
-0.5246031, 1.157235, -0.4738948, 0.3490196, 1, 0, 1,
-0.5179273, 0.02439071, -1.426615, 0.345098, 1, 0, 1,
-0.5136514, -0.9083275, -2.204171, 0.3372549, 1, 0, 1,
-0.5132229, -0.4577164, -1.900214, 0.3333333, 1, 0, 1,
-0.5131181, -0.4934433, -1.956311, 0.3254902, 1, 0, 1,
-0.5098383, 1.18592, 0.6769323, 0.3215686, 1, 0, 1,
-0.5081648, -2.079664, -3.604723, 0.3137255, 1, 0, 1,
-0.5027531, -0.1247684, -2.518414, 0.3098039, 1, 0, 1,
-0.5026571, 1.561724, 0.5293093, 0.3019608, 1, 0, 1,
-0.5006443, 1.546995, -0.2614627, 0.2941177, 1, 0, 1,
-0.4980884, -0.3800517, -1.171347, 0.2901961, 1, 0, 1,
-0.4913034, 0.545715, -0.7725289, 0.282353, 1, 0, 1,
-0.490078, 0.6147965, 0.8413681, 0.2784314, 1, 0, 1,
-0.4896038, -0.5285796, -2.82648, 0.2705882, 1, 0, 1,
-0.4870887, -0.9573714, -3.308609, 0.2666667, 1, 0, 1,
-0.4840869, 0.2001968, -3.242082, 0.2588235, 1, 0, 1,
-0.481573, -0.1130688, -1.679797, 0.254902, 1, 0, 1,
-0.4788193, 2.43439, -0.953466, 0.2470588, 1, 0, 1,
-0.4779251, -0.7767345, -1.867226, 0.2431373, 1, 0, 1,
-0.4762386, -0.5980927, -3.140437, 0.2352941, 1, 0, 1,
-0.4755235, -1.569022, -1.218123, 0.2313726, 1, 0, 1,
-0.473058, 0.251623, -1.070718, 0.2235294, 1, 0, 1,
-0.4682702, -0.6548471, -2.404455, 0.2196078, 1, 0, 1,
-0.4649107, -0.01463806, -0.8182302, 0.2117647, 1, 0, 1,
-0.4611593, 2.210922, 0.5728815, 0.2078431, 1, 0, 1,
-0.4552822, 1.044163, -0.7210491, 0.2, 1, 0, 1,
-0.453788, 0.6731356, -1.005849, 0.1921569, 1, 0, 1,
-0.4519873, -0.3645434, -2.639748, 0.1882353, 1, 0, 1,
-0.4507394, 0.01998477, -0.5063627, 0.1803922, 1, 0, 1,
-0.4458574, -0.3509035, -1.010128, 0.1764706, 1, 0, 1,
-0.4445527, 0.9018317, -1.304752, 0.1686275, 1, 0, 1,
-0.4419986, 0.4323172, -0.1902812, 0.1647059, 1, 0, 1,
-0.440416, 0.7449563, 0.03760929, 0.1568628, 1, 0, 1,
-0.4394385, -0.3505434, -1.853621, 0.1529412, 1, 0, 1,
-0.4389053, -0.6938961, -3.896756, 0.145098, 1, 0, 1,
-0.4341766, -0.05063587, -1.186571, 0.1411765, 1, 0, 1,
-0.429895, -0.02318127, -3.320123, 0.1333333, 1, 0, 1,
-0.4271567, 0.1203, -0.3634278, 0.1294118, 1, 0, 1,
-0.4236707, 0.2592904, -2.200961, 0.1215686, 1, 0, 1,
-0.4192511, -0.8421504, -1.304148, 0.1176471, 1, 0, 1,
-0.417989, 1.643033, -1.987087, 0.1098039, 1, 0, 1,
-0.4149233, -0.8925859, -2.858191, 0.1058824, 1, 0, 1,
-0.4123486, 0.4620912, -1.456217, 0.09803922, 1, 0, 1,
-0.4084479, -1.091338, -3.248806, 0.09019608, 1, 0, 1,
-0.4082734, 0.9525688, 0.6810179, 0.08627451, 1, 0, 1,
-0.4069355, 0.5388352, 0.1811361, 0.07843138, 1, 0, 1,
-0.4049963, -1.404976, -1.743975, 0.07450981, 1, 0, 1,
-0.4033499, -1.740286, -1.656192, 0.06666667, 1, 0, 1,
-0.3969212, -0.7264962, -2.079664, 0.0627451, 1, 0, 1,
-0.39683, -2.114223, -1.583786, 0.05490196, 1, 0, 1,
-0.396068, -0.4554127, -1.922102, 0.05098039, 1, 0, 1,
-0.3945225, 0.8979625, -0.5592552, 0.04313726, 1, 0, 1,
-0.388364, 0.7396169, 0.0237755, 0.03921569, 1, 0, 1,
-0.3822696, -0.6910201, -3.085088, 0.03137255, 1, 0, 1,
-0.3776316, -0.7156842, -1.734553, 0.02745098, 1, 0, 1,
-0.3775162, -0.5248114, -1.95958, 0.01960784, 1, 0, 1,
-0.3774076, -1.035677, -2.506644, 0.01568628, 1, 0, 1,
-0.3693935, 0.3886359, -1.227103, 0.007843138, 1, 0, 1,
-0.3690005, -1.519999, -3.142699, 0.003921569, 1, 0, 1,
-0.3689224, 1.720464, 0.9478405, 0, 1, 0.003921569, 1,
-0.368519, -0.4572107, -2.506653, 0, 1, 0.01176471, 1,
-0.3677369, 0.1741353, -0.4783735, 0, 1, 0.01568628, 1,
-0.3665042, 0.6685142, 0.9723651, 0, 1, 0.02352941, 1,
-0.3649379, -0.2967257, -1.928198, 0, 1, 0.02745098, 1,
-0.3631092, 0.5858687, -1.260381, 0, 1, 0.03529412, 1,
-0.3583545, -0.4690217, -3.679467, 0, 1, 0.03921569, 1,
-0.3581858, -0.3820228, -3.258432, 0, 1, 0.04705882, 1,
-0.3523011, 0.06044409, -0.9118234, 0, 1, 0.05098039, 1,
-0.3506815, -0.6106562, -3.917852, 0, 1, 0.05882353, 1,
-0.3491451, -0.08110355, -1.950416, 0, 1, 0.0627451, 1,
-0.3479933, -1.267672, -3.579893, 0, 1, 0.07058824, 1,
-0.3456373, 0.2256666, -1.890385, 0, 1, 0.07450981, 1,
-0.3451338, -1.168783, -3.735997, 0, 1, 0.08235294, 1,
-0.3444276, 0.224429, -1.311564, 0, 1, 0.08627451, 1,
-0.3431755, 0.3066746, 0.5060918, 0, 1, 0.09411765, 1,
-0.3416756, 0.6537188, -0.3714281, 0, 1, 0.1019608, 1,
-0.3411882, 0.292044, -0.5677862, 0, 1, 0.1058824, 1,
-0.3409268, 1.153099, 1.635865, 0, 1, 0.1137255, 1,
-0.3384219, -0.4034262, -3.569251, 0, 1, 0.1176471, 1,
-0.3366274, -1.398394, -2.74434, 0, 1, 0.1254902, 1,
-0.3363318, 1.308172, 1.106018, 0, 1, 0.1294118, 1,
-0.3360503, 0.2929322, 0.1227643, 0, 1, 0.1372549, 1,
-0.3331403, 1.001845, -0.8152769, 0, 1, 0.1411765, 1,
-0.3289658, -0.2852308, 1.003336, 0, 1, 0.1490196, 1,
-0.3287665, 0.4550451, 0.6768717, 0, 1, 0.1529412, 1,
-0.3236231, 1.178535, -2.481575, 0, 1, 0.1607843, 1,
-0.3225644, 1.098395, -0.4086321, 0, 1, 0.1647059, 1,
-0.3215255, -0.2881839, -3.459725, 0, 1, 0.172549, 1,
-0.318642, 0.235534, -1.936177, 0, 1, 0.1764706, 1,
-0.3173061, -0.104393, -4.280544, 0, 1, 0.1843137, 1,
-0.3153025, 1.645143, -0.8444497, 0, 1, 0.1882353, 1,
-0.3138916, 0.6087925, 0.01075534, 0, 1, 0.1960784, 1,
-0.3125649, 0.4931335, -0.624975, 0, 1, 0.2039216, 1,
-0.3102224, -0.4296176, -3.141307, 0, 1, 0.2078431, 1,
-0.3056478, 1.709268, 0.04714996, 0, 1, 0.2156863, 1,
-0.2953164, -0.2736154, -3.406643, 0, 1, 0.2196078, 1,
-0.2949864, -0.9314364, -3.196379, 0, 1, 0.227451, 1,
-0.2922862, 0.9985356, 0.9038445, 0, 1, 0.2313726, 1,
-0.29048, -0.2568647, -1.52545, 0, 1, 0.2392157, 1,
-0.2887695, -0.4813628, -2.689237, 0, 1, 0.2431373, 1,
-0.2804357, -0.06918509, -1.188502, 0, 1, 0.2509804, 1,
-0.2796476, 0.05163825, -1.529043, 0, 1, 0.254902, 1,
-0.2777629, -0.469541, -3.191049, 0, 1, 0.2627451, 1,
-0.2752803, -1.138192, -3.353243, 0, 1, 0.2666667, 1,
-0.2697029, 0.573358, 1.692878, 0, 1, 0.2745098, 1,
-0.2684029, -0.1695284, -1.816322, 0, 1, 0.2784314, 1,
-0.2683471, -2.205322, -2.616456, 0, 1, 0.2862745, 1,
-0.2674212, -0.09510498, -3.539015, 0, 1, 0.2901961, 1,
-0.2647479, -0.0335243, -2.469493, 0, 1, 0.2980392, 1,
-0.2638378, -1.091277, -2.66956, 0, 1, 0.3058824, 1,
-0.2609402, -0.0838965, -1.281644, 0, 1, 0.3098039, 1,
-0.2575694, -0.6572348, -1.709832, 0, 1, 0.3176471, 1,
-0.2513618, -0.9456743, -2.700999, 0, 1, 0.3215686, 1,
-0.2504258, -1.280465, -4.469972, 0, 1, 0.3294118, 1,
-0.2495264, 0.1343854, -0.8193359, 0, 1, 0.3333333, 1,
-0.24929, -2.907387, -3.078309, 0, 1, 0.3411765, 1,
-0.247005, -1.717884, -1.638548, 0, 1, 0.345098, 1,
-0.2468178, -1.785561, -2.53462, 0, 1, 0.3529412, 1,
-0.2460513, 1.782115, 0.2920067, 0, 1, 0.3568628, 1,
-0.2390211, 0.98246, 0.1160554, 0, 1, 0.3647059, 1,
-0.2353387, 1.262338, 1.279369, 0, 1, 0.3686275, 1,
-0.2348878, 2.024891, -0.6415314, 0, 1, 0.3764706, 1,
-0.231268, -0.2437209, -3.615939, 0, 1, 0.3803922, 1,
-0.2308735, -1.34912, -2.393882, 0, 1, 0.3882353, 1,
-0.229607, -0.03264764, -1.90471, 0, 1, 0.3921569, 1,
-0.2284238, 0.1284965, 2.765007, 0, 1, 0.4, 1,
-0.2283456, -0.9624849, -3.461239, 0, 1, 0.4078431, 1,
-0.2273661, -0.5981495, -2.468983, 0, 1, 0.4117647, 1,
-0.2262808, 0.4663979, -2.458914, 0, 1, 0.4196078, 1,
-0.2254446, 0.9733917, -0.5327977, 0, 1, 0.4235294, 1,
-0.2248998, -1.525763, -5.17153, 0, 1, 0.4313726, 1,
-0.2181316, 0.6854395, -0.02198274, 0, 1, 0.4352941, 1,
-0.2098164, 0.0713787, -2.146233, 0, 1, 0.4431373, 1,
-0.2096264, 1.509032, -2.341568, 0, 1, 0.4470588, 1,
-0.208184, -1.348506, -4.511352, 0, 1, 0.454902, 1,
-0.2061034, 0.7302257, 0.8300966, 0, 1, 0.4588235, 1,
-0.1932747, 0.8292759, -1.382798, 0, 1, 0.4666667, 1,
-0.1884478, -1.17857, -2.864051, 0, 1, 0.4705882, 1,
-0.1848481, -1.18817, -2.581553, 0, 1, 0.4784314, 1,
-0.1836523, -0.9779407, -1.577351, 0, 1, 0.4823529, 1,
-0.181648, -1.519902, -4.076508, 0, 1, 0.4901961, 1,
-0.1799434, 0.7454349, -1.420784, 0, 1, 0.4941176, 1,
-0.1793246, 0.4474761, 0.5620398, 0, 1, 0.5019608, 1,
-0.1791674, 0.9133153, 1.484056, 0, 1, 0.509804, 1,
-0.1769024, -1.841112, -2.916765, 0, 1, 0.5137255, 1,
-0.1735081, 0.02511518, -1.649143, 0, 1, 0.5215687, 1,
-0.1719398, -0.6348068, -2.664483, 0, 1, 0.5254902, 1,
-0.1707358, 0.4307803, -1.473936, 0, 1, 0.5333334, 1,
-0.1661238, 0.9362918, 0.3703445, 0, 1, 0.5372549, 1,
-0.1642868, -0.417582, -4.507539, 0, 1, 0.5450981, 1,
-0.1616782, -0.364942, -2.774018, 0, 1, 0.5490196, 1,
-0.1600112, -2.330317, -3.006027, 0, 1, 0.5568628, 1,
-0.1583966, 1.175592, 0.2603909, 0, 1, 0.5607843, 1,
-0.1553748, -0.7144498, -2.604392, 0, 1, 0.5686275, 1,
-0.1505272, -0.7653336, -2.16388, 0, 1, 0.572549, 1,
-0.1479507, -1.128574, -2.875318, 0, 1, 0.5803922, 1,
-0.1468081, 0.4921449, -0.6103283, 0, 1, 0.5843138, 1,
-0.1450411, -1.261385, -3.647418, 0, 1, 0.5921569, 1,
-0.13775, 1.210171, -1.094956, 0, 1, 0.5960785, 1,
-0.1373318, 0.3337909, -1.573146, 0, 1, 0.6039216, 1,
-0.1313626, 0.07490703, -0.7033993, 0, 1, 0.6117647, 1,
-0.1313567, -0.4120913, -2.267863, 0, 1, 0.6156863, 1,
-0.129007, 0.05460243, -1.133106, 0, 1, 0.6235294, 1,
-0.1163138, 1.070665, -0.8589877, 0, 1, 0.627451, 1,
-0.1153515, 2.028893, -0.3373384, 0, 1, 0.6352941, 1,
-0.1134147, 1.847769, 0.4275332, 0, 1, 0.6392157, 1,
-0.1124606, 0.05901842, -1.187836, 0, 1, 0.6470588, 1,
-0.1124368, -0.4760186, -1.784668, 0, 1, 0.6509804, 1,
-0.110395, 1.073876, 0.3820678, 0, 1, 0.6588235, 1,
-0.1092888, 0.8472517, 0.05143997, 0, 1, 0.6627451, 1,
-0.1051261, 1.175076, -1.26642, 0, 1, 0.6705883, 1,
-0.1050966, 0.1557024, -0.9676339, 0, 1, 0.6745098, 1,
-0.1042701, 0.9623881, -2.56885, 0, 1, 0.682353, 1,
-0.09746014, -0.786447, -4.398395, 0, 1, 0.6862745, 1,
-0.09707669, -1.365627, -3.454964, 0, 1, 0.6941177, 1,
-0.09624548, 0.7165521, -1.999519, 0, 1, 0.7019608, 1,
-0.09468636, -0.1071516, -2.706552, 0, 1, 0.7058824, 1,
-0.09450852, -1.13578, -3.828987, 0, 1, 0.7137255, 1,
-0.09191476, -1.817194, -4.557813, 0, 1, 0.7176471, 1,
-0.09044185, 0.3742127, -0.5631593, 0, 1, 0.7254902, 1,
-0.08834474, 0.1958743, -0.4140194, 0, 1, 0.7294118, 1,
-0.08534008, -0.713835, -4.443295, 0, 1, 0.7372549, 1,
-0.08455072, -0.3758482, -3.21263, 0, 1, 0.7411765, 1,
-0.08292949, -0.4509006, -3.832729, 0, 1, 0.7490196, 1,
-0.07965957, 0.6985625, 0.2046465, 0, 1, 0.7529412, 1,
-0.07810813, -2.657848, -1.440973, 0, 1, 0.7607843, 1,
-0.07634286, 0.067334, -0.02622624, 0, 1, 0.7647059, 1,
-0.07579637, -0.02377646, -3.027163, 0, 1, 0.772549, 1,
-0.07548018, -0.9028089, -4.817264, 0, 1, 0.7764706, 1,
-0.07542159, 0.6375138, 1.140456, 0, 1, 0.7843137, 1,
-0.07296262, -1.092661, -2.496819, 0, 1, 0.7882353, 1,
-0.07020653, -0.7268363, -1.10893, 0, 1, 0.7960784, 1,
-0.07017723, 0.03104563, -1.019786, 0, 1, 0.8039216, 1,
-0.06450371, 0.5071515, -1.125265, 0, 1, 0.8078431, 1,
-0.06448321, -1.410905, -3.775248, 0, 1, 0.8156863, 1,
-0.06398295, 0.8900042, 0.8197342, 0, 1, 0.8196079, 1,
-0.06355722, -1.235892, -4.246135, 0, 1, 0.827451, 1,
-0.05969217, 0.05693347, 1.321651, 0, 1, 0.8313726, 1,
-0.05883003, -0.1384516, -2.268941, 0, 1, 0.8392157, 1,
-0.0557778, -1.45334, -3.0645, 0, 1, 0.8431373, 1,
-0.04852317, -0.9692727, -3.635721, 0, 1, 0.8509804, 1,
-0.0484302, 0.8460673, 0.2592621, 0, 1, 0.854902, 1,
-0.04519167, 1.323342, -1.780457, 0, 1, 0.8627451, 1,
-0.04210827, 0.4543093, 0.1909454, 0, 1, 0.8666667, 1,
-0.03962134, 0.9552113, -1.105991, 0, 1, 0.8745098, 1,
-0.03923225, 0.913412, 0.1882884, 0, 1, 0.8784314, 1,
-0.03879004, -0.3541966, -3.159516, 0, 1, 0.8862745, 1,
-0.03385742, 1.168452, -0.03865852, 0, 1, 0.8901961, 1,
-0.0216287, -1.836988, -3.424821, 0, 1, 0.8980392, 1,
-0.02119242, -0.4239245, -2.652315, 0, 1, 0.9058824, 1,
-0.01214524, 1.65898, 0.9024773, 0, 1, 0.9098039, 1,
-0.008757242, 0.2101853, -2.034579, 0, 1, 0.9176471, 1,
-0.00856898, -0.1987623, -3.02447, 0, 1, 0.9215686, 1,
-0.006390256, 1.570622, -0.08282516, 0, 1, 0.9294118, 1,
-0.003131326, 1.08564, 0.8281921, 0, 1, 0.9333333, 1,
-0.003002404, -0.843982, -2.825266, 0, 1, 0.9411765, 1,
0.003580761, -0.054819, 5.056643, 0, 1, 0.945098, 1,
0.004600104, 0.4955121, 1.068648, 0, 1, 0.9529412, 1,
0.005105267, -0.1758866, 2.209354, 0, 1, 0.9568627, 1,
0.005928331, 0.1665801, 0.7714864, 0, 1, 0.9647059, 1,
0.007181325, -1.050925, 3.542787, 0, 1, 0.9686275, 1,
0.007330381, 0.8334979, -1.514398, 0, 1, 0.9764706, 1,
0.009253666, -0.3526265, 2.919108, 0, 1, 0.9803922, 1,
0.01359668, -0.141837, 3.510979, 0, 1, 0.9882353, 1,
0.01561129, -1.32879, 3.717713, 0, 1, 0.9921569, 1,
0.01568425, 0.9828075, 2.036772, 0, 1, 1, 1,
0.01688027, 1.535516, -0.9120021, 0, 0.9921569, 1, 1,
0.01781254, 0.7207843, -0.5844426, 0, 0.9882353, 1, 1,
0.02062179, 1.243169, -0.9954901, 0, 0.9803922, 1, 1,
0.02307718, 0.6824619, 0.2042099, 0, 0.9764706, 1, 1,
0.02778165, -0.3157316, 4.405341, 0, 0.9686275, 1, 1,
0.03372547, -0.3364496, 2.764436, 0, 0.9647059, 1, 1,
0.03525735, -0.938888, 2.661226, 0, 0.9568627, 1, 1,
0.03911909, -1.395534, 3.311418, 0, 0.9529412, 1, 1,
0.03936244, 1.177194, 1.587618, 0, 0.945098, 1, 1,
0.04059158, -0.2922101, 2.099261, 0, 0.9411765, 1, 1,
0.04099304, -2.052988, 3.792797, 0, 0.9333333, 1, 1,
0.04147166, 0.3390672, -0.440587, 0, 0.9294118, 1, 1,
0.04849472, -0.3783834, 2.666508, 0, 0.9215686, 1, 1,
0.0495613, 0.03000183, 2.552263, 0, 0.9176471, 1, 1,
0.05015192, 1.170865, -0.9651461, 0, 0.9098039, 1, 1,
0.05063508, -0.6372751, 4.564997, 0, 0.9058824, 1, 1,
0.05264396, -1.149129, 4.14557, 0, 0.8980392, 1, 1,
0.05487347, -2.98059, 3.206138, 0, 0.8901961, 1, 1,
0.0566079, -1.142384, 4.238046, 0, 0.8862745, 1, 1,
0.05765564, 0.08365577, 0.6239793, 0, 0.8784314, 1, 1,
0.06273524, 0.7327121, -0.9106861, 0, 0.8745098, 1, 1,
0.06396879, -1.122517, 2.004477, 0, 0.8666667, 1, 1,
0.06684401, 0.2107121, 1.917872, 0, 0.8627451, 1, 1,
0.07766925, 0.7845882, -0.3820588, 0, 0.854902, 1, 1,
0.07777981, -0.5603864, 2.244568, 0, 0.8509804, 1, 1,
0.07930584, 1.83891, 2.307358, 0, 0.8431373, 1, 1,
0.0832288, -0.2703237, 3.5157, 0, 0.8392157, 1, 1,
0.08619928, -0.8682067, 3.259006, 0, 0.8313726, 1, 1,
0.09122279, -0.3283591, 2.927836, 0, 0.827451, 1, 1,
0.09400571, 0.9924835, 1.387613, 0, 0.8196079, 1, 1,
0.09496259, -1.419148, 2.64172, 0, 0.8156863, 1, 1,
0.09638362, -0.0750903, 1.759922, 0, 0.8078431, 1, 1,
0.09700113, 0.9883663, -2.331716, 0, 0.8039216, 1, 1,
0.09756503, 0.1170092, 1.324976, 0, 0.7960784, 1, 1,
0.098752, -0.2977244, 2.549324, 0, 0.7882353, 1, 1,
0.1017314, -0.3258484, 1.496725, 0, 0.7843137, 1, 1,
0.1045985, -0.7674676, 2.478072, 0, 0.7764706, 1, 1,
0.1075713, 0.5373284, -0.02972721, 0, 0.772549, 1, 1,
0.1113569, 0.09364791, 2.754471, 0, 0.7647059, 1, 1,
0.1132704, 1.222422, 0.7962348, 0, 0.7607843, 1, 1,
0.1137394, 1.49645, -0.1041123, 0, 0.7529412, 1, 1,
0.115949, 0.9770756, -0.2200138, 0, 0.7490196, 1, 1,
0.1165026, -2.009064, 5.074834, 0, 0.7411765, 1, 1,
0.1172024, 0.1560268, 1.262362, 0, 0.7372549, 1, 1,
0.1178292, 0.7917429, -1.089242, 0, 0.7294118, 1, 1,
0.1205123, -0.876506, 3.815354, 0, 0.7254902, 1, 1,
0.1307656, -0.5220008, 4.08431, 0, 0.7176471, 1, 1,
0.1311057, -0.9639146, 2.046523, 0, 0.7137255, 1, 1,
0.1324693, -1.797196, 1.410494, 0, 0.7058824, 1, 1,
0.1346768, 1.175209, -0.09732336, 0, 0.6980392, 1, 1,
0.1364849, -0.5790387, 2.002742, 0, 0.6941177, 1, 1,
0.1424939, -1.349362, 1.830188, 0, 0.6862745, 1, 1,
0.1464459, 0.3868096, -0.3170342, 0, 0.682353, 1, 1,
0.1479894, -1.595563, 3.73259, 0, 0.6745098, 1, 1,
0.1516653, -0.3901156, 3.460297, 0, 0.6705883, 1, 1,
0.1531359, -1.042528, 1.696245, 0, 0.6627451, 1, 1,
0.1559075, -1.934766, 3.486315, 0, 0.6588235, 1, 1,
0.1570007, 0.818224, 0.4505761, 0, 0.6509804, 1, 1,
0.1573828, -1.587665, 3.512738, 0, 0.6470588, 1, 1,
0.1577953, -0.07754458, 3.409317, 0, 0.6392157, 1, 1,
0.1587968, -1.479337, 1.83548, 0, 0.6352941, 1, 1,
0.1592509, -1.978635, 4.904365, 0, 0.627451, 1, 1,
0.1593295, -0.9286546, 3.383558, 0, 0.6235294, 1, 1,
0.162644, 1.281439, -0.8464895, 0, 0.6156863, 1, 1,
0.166283, -0.7488579, 5.317781, 0, 0.6117647, 1, 1,
0.1711186, -0.03855424, 1.803974, 0, 0.6039216, 1, 1,
0.1722082, -1.558998, 2.10314, 0, 0.5960785, 1, 1,
0.1728711, 0.7954565, 0.5183178, 0, 0.5921569, 1, 1,
0.1766503, -0.09324364, 1.651516, 0, 0.5843138, 1, 1,
0.1766763, 0.9708483, -0.5473844, 0, 0.5803922, 1, 1,
0.1803931, -0.2582066, 2.717191, 0, 0.572549, 1, 1,
0.1818472, 0.6046027, -1.054102, 0, 0.5686275, 1, 1,
0.1841305, -0.6009971, 2.857496, 0, 0.5607843, 1, 1,
0.1864044, -0.04699702, 0.626272, 0, 0.5568628, 1, 1,
0.1953246, -0.09630182, 2.798455, 0, 0.5490196, 1, 1,
0.195337, -0.2331006, 4.325381, 0, 0.5450981, 1, 1,
0.1968856, -0.9729553, 2.934656, 0, 0.5372549, 1, 1,
0.1980135, 0.6840454, 0.2347898, 0, 0.5333334, 1, 1,
0.1992109, 0.1815174, 0.6261742, 0, 0.5254902, 1, 1,
0.2003459, 1.468521, 0.1482276, 0, 0.5215687, 1, 1,
0.2064384, 1.180644, -1.172516, 0, 0.5137255, 1, 1,
0.2094461, 0.4901303, -0.4128191, 0, 0.509804, 1, 1,
0.2121437, 0.3087747, -0.1088317, 0, 0.5019608, 1, 1,
0.2156535, -0.5981489, 2.999113, 0, 0.4941176, 1, 1,
0.2187844, 0.2861804, 0.8657005, 0, 0.4901961, 1, 1,
0.2199199, 2.786871, -1.137046, 0, 0.4823529, 1, 1,
0.2206575, -0.1621763, 2.394674, 0, 0.4784314, 1, 1,
0.2214197, 0.6794334, 2.091539, 0, 0.4705882, 1, 1,
0.23054, 0.9412251, 0.2710359, 0, 0.4666667, 1, 1,
0.2417322, -0.6264775, 2.796262, 0, 0.4588235, 1, 1,
0.2419707, 1.369331, -1.265538, 0, 0.454902, 1, 1,
0.2434921, 0.2565076, 1.807853, 0, 0.4470588, 1, 1,
0.2454069, 0.2120915, -1.048058, 0, 0.4431373, 1, 1,
0.2473902, -0.05429832, 3.761041, 0, 0.4352941, 1, 1,
0.2508271, -0.07882124, 0.692668, 0, 0.4313726, 1, 1,
0.2532271, -1.227977, 3.32919, 0, 0.4235294, 1, 1,
0.2535284, 0.512665, 1.718347, 0, 0.4196078, 1, 1,
0.25385, 2.104717, 0.948086, 0, 0.4117647, 1, 1,
0.2559178, 0.8041051, 0.9419153, 0, 0.4078431, 1, 1,
0.2575628, -3.481247, 2.677413, 0, 0.4, 1, 1,
0.2578261, -0.7596003, 3.07305, 0, 0.3921569, 1, 1,
0.2601981, 0.3579263, 0.6758447, 0, 0.3882353, 1, 1,
0.2606955, -1.727177, 2.54752, 0, 0.3803922, 1, 1,
0.2623334, -0.05853608, 2.659071, 0, 0.3764706, 1, 1,
0.264076, -1.666216, 3.095619, 0, 0.3686275, 1, 1,
0.2647595, -0.2227111, 2.394992, 0, 0.3647059, 1, 1,
0.2685218, 0.1254895, 3.064564, 0, 0.3568628, 1, 1,
0.272101, -0.03662918, 1.938119, 0, 0.3529412, 1, 1,
0.2783911, 1.184254, 0.01875805, 0, 0.345098, 1, 1,
0.2795321, -0.5889812, 3.732743, 0, 0.3411765, 1, 1,
0.2816316, -0.1202078, 1.958551, 0, 0.3333333, 1, 1,
0.2859365, 3.56511, 1.314901, 0, 0.3294118, 1, 1,
0.2904599, 0.5363811, -0.8580176, 0, 0.3215686, 1, 1,
0.2931423, -2.115475, 2.232525, 0, 0.3176471, 1, 1,
0.297855, 0.8746979, 0.8947044, 0, 0.3098039, 1, 1,
0.2996868, -1.496689, 4.048418, 0, 0.3058824, 1, 1,
0.3069013, 0.9356856, 0.4671077, 0, 0.2980392, 1, 1,
0.3071085, 1.375309, -0.8754718, 0, 0.2901961, 1, 1,
0.3131517, -2.570527, 2.537194, 0, 0.2862745, 1, 1,
0.3150398, 1.617312, 0.5289755, 0, 0.2784314, 1, 1,
0.333138, -0.3908751, 3.582918, 0, 0.2745098, 1, 1,
0.3367311, 3.245409, -0.7963361, 0, 0.2666667, 1, 1,
0.3437603, -0.2211728, 1.625805, 0, 0.2627451, 1, 1,
0.3521939, 0.7900438, -2.329989, 0, 0.254902, 1, 1,
0.3590411, 0.7427045, 1.60513, 0, 0.2509804, 1, 1,
0.3624773, -0.4752076, 2.314011, 0, 0.2431373, 1, 1,
0.3651439, 1.70796, 0.009796005, 0, 0.2392157, 1, 1,
0.3696884, 0.1449234, 0.7595369, 0, 0.2313726, 1, 1,
0.3730976, -1.276768, 2.907314, 0, 0.227451, 1, 1,
0.3769872, -0.7036335, 3.180894, 0, 0.2196078, 1, 1,
0.3792155, 0.9866022, 1.741339, 0, 0.2156863, 1, 1,
0.380494, -0.5878508, 2.57006, 0, 0.2078431, 1, 1,
0.3827403, 0.6664799, 1.30198, 0, 0.2039216, 1, 1,
0.3841267, 1.048394, -0.09210002, 0, 0.1960784, 1, 1,
0.3885785, -0.843977, 4.508207, 0, 0.1882353, 1, 1,
0.3950199, -0.4754787, 2.764587, 0, 0.1843137, 1, 1,
0.3979027, -0.5464511, 1.71576, 0, 0.1764706, 1, 1,
0.3995759, 0.2403033, -0.4894746, 0, 0.172549, 1, 1,
0.4006966, -0.8928701, 1.537895, 0, 0.1647059, 1, 1,
0.4012748, 0.4666157, 1.259271, 0, 0.1607843, 1, 1,
0.4023176, 0.5385302, 1.261687, 0, 0.1529412, 1, 1,
0.404029, -1.536053, 2.550853, 0, 0.1490196, 1, 1,
0.4066752, -0.09008408, 1.753565, 0, 0.1411765, 1, 1,
0.4067697, -0.02392215, 2.47694, 0, 0.1372549, 1, 1,
0.4071321, 0.5813544, 0.1136824, 0, 0.1294118, 1, 1,
0.4084716, -0.05245, -0.317199, 0, 0.1254902, 1, 1,
0.4085828, 1.191012, 0.173977, 0, 0.1176471, 1, 1,
0.4095192, -0.2417968, 2.528001, 0, 0.1137255, 1, 1,
0.4148222, 1.181646, 0.2293206, 0, 0.1058824, 1, 1,
0.4156106, -0.5693824, 2.61338, 0, 0.09803922, 1, 1,
0.4200743, 0.1666028, 0.4590197, 0, 0.09411765, 1, 1,
0.425108, -0.7223678, 1.428105, 0, 0.08627451, 1, 1,
0.4296588, -0.7445149, 1.942787, 0, 0.08235294, 1, 1,
0.4307495, -0.8944188, 2.411569, 0, 0.07450981, 1, 1,
0.4311196, 1.013258, 0.5794661, 0, 0.07058824, 1, 1,
0.4315767, 0.763259, 0.08886892, 0, 0.0627451, 1, 1,
0.4358005, -1.2712, 2.693983, 0, 0.05882353, 1, 1,
0.4389775, -0.3167412, 1.249999, 0, 0.05098039, 1, 1,
0.4398148, -0.7641795, 2.523222, 0, 0.04705882, 1, 1,
0.4439034, -1.682622, 4.045362, 0, 0.03921569, 1, 1,
0.444759, 0.4324017, 0.06493435, 0, 0.03529412, 1, 1,
0.4455085, -0.1886749, 0.7607367, 0, 0.02745098, 1, 1,
0.4462686, 0.1638359, 2.805992, 0, 0.02352941, 1, 1,
0.4580941, -1.199329, 2.607494, 0, 0.01568628, 1, 1,
0.4631809, -0.5441492, 1.551668, 0, 0.01176471, 1, 1,
0.4646761, 0.2945296, 0.7286488, 0, 0.003921569, 1, 1,
0.465584, -0.7822332, 4.062789, 0.003921569, 0, 1, 1,
0.4657983, 1.334755, 0.3567267, 0.007843138, 0, 1, 1,
0.4686701, -1.913678, 4.07147, 0.01568628, 0, 1, 1,
0.4709278, -0.8055998, 2.204624, 0.01960784, 0, 1, 1,
0.4713002, -0.1304742, 0.7868866, 0.02745098, 0, 1, 1,
0.4717264, -0.6989599, 2.757045, 0.03137255, 0, 1, 1,
0.479638, -0.9520615, 3.6183, 0.03921569, 0, 1, 1,
0.4806263, -0.4830357, 1.555173, 0.04313726, 0, 1, 1,
0.4807999, 1.380318, 0.4227092, 0.05098039, 0, 1, 1,
0.4828313, 0.5332512, -0.9618515, 0.05490196, 0, 1, 1,
0.4860696, -0.2474099, 2.0578, 0.0627451, 0, 1, 1,
0.4867068, -0.7425601, 2.368886, 0.06666667, 0, 1, 1,
0.4878731, -0.4427057, 0.4729843, 0.07450981, 0, 1, 1,
0.4884056, -0.5690331, 3.954319, 0.07843138, 0, 1, 1,
0.4939159, 0.1820638, 1.64934, 0.08627451, 0, 1, 1,
0.4947334, 1.035733, 0.8103902, 0.09019608, 0, 1, 1,
0.4947806, 1.613711, 0.3006301, 0.09803922, 0, 1, 1,
0.4981411, 1.424303, 2.155927, 0.1058824, 0, 1, 1,
0.5007603, 0.4280194, 0.6757973, 0.1098039, 0, 1, 1,
0.5050824, 0.7301756, 0.6159149, 0.1176471, 0, 1, 1,
0.5096326, -0.297438, 2.095349, 0.1215686, 0, 1, 1,
0.5099162, 0.5154392, 1.405772, 0.1294118, 0, 1, 1,
0.5164033, 0.1915714, -0.1525548, 0.1333333, 0, 1, 1,
0.5178439, 2.079547, -0.5410767, 0.1411765, 0, 1, 1,
0.5207785, 0.8772134, 0.7116011, 0.145098, 0, 1, 1,
0.526355, 1.959236, 0.05413888, 0.1529412, 0, 1, 1,
0.5308262, 0.8816947, 0.3966505, 0.1568628, 0, 1, 1,
0.5328494, 0.3001427, -1.093669, 0.1647059, 0, 1, 1,
0.5331709, -0.9799891, 4.000527, 0.1686275, 0, 1, 1,
0.5333342, -0.5304148, 2.949565, 0.1764706, 0, 1, 1,
0.533452, 0.6710109, 1.651547, 0.1803922, 0, 1, 1,
0.534007, -1.194005, 1.624051, 0.1882353, 0, 1, 1,
0.5419694, 1.493984, 0.9500458, 0.1921569, 0, 1, 1,
0.5425599, 0.1263728, 1.31307, 0.2, 0, 1, 1,
0.543808, 0.3559612, -0.2945767, 0.2078431, 0, 1, 1,
0.5442295, -0.317295, 2.135292, 0.2117647, 0, 1, 1,
0.5455508, -0.3614716, 2.498554, 0.2196078, 0, 1, 1,
0.5477424, -0.2968324, 1.38942, 0.2235294, 0, 1, 1,
0.5499316, -0.7056323, 3.407959, 0.2313726, 0, 1, 1,
0.5517427, -0.3098578, 1.700907, 0.2352941, 0, 1, 1,
0.5589786, 1.135783, 0.3964068, 0.2431373, 0, 1, 1,
0.5592884, 0.4219605, 1.505636, 0.2470588, 0, 1, 1,
0.5605134, 0.2704084, 2.213154, 0.254902, 0, 1, 1,
0.5609366, 1.212929, 0.9674811, 0.2588235, 0, 1, 1,
0.5630831, -1.226045, 4.171452, 0.2666667, 0, 1, 1,
0.5715239, 0.3833102, 0.4476551, 0.2705882, 0, 1, 1,
0.5747655, 0.2027313, 0.6882246, 0.2784314, 0, 1, 1,
0.5777337, -0.8390496, 1.461969, 0.282353, 0, 1, 1,
0.5813056, -0.9462768, 3.131432, 0.2901961, 0, 1, 1,
0.5856044, -1.824288, 3.347625, 0.2941177, 0, 1, 1,
0.5862194, -0.1337352, 0.9175385, 0.3019608, 0, 1, 1,
0.5867413, -1.734173, 2.045187, 0.3098039, 0, 1, 1,
0.5875797, -0.6746573, 3.929753, 0.3137255, 0, 1, 1,
0.5875974, 1.898279, -0.09089467, 0.3215686, 0, 1, 1,
0.5879753, -0.6756852, 2.637514, 0.3254902, 0, 1, 1,
0.5903499, 0.2490942, 1.042217, 0.3333333, 0, 1, 1,
0.5905563, 0.4607394, 1.206961, 0.3372549, 0, 1, 1,
0.59061, -0.4430151, 1.123498, 0.345098, 0, 1, 1,
0.5989294, -0.3045553, 2.073494, 0.3490196, 0, 1, 1,
0.6018518, -0.5238473, 3.417312, 0.3568628, 0, 1, 1,
0.6057454, 1.182556, 2.762368, 0.3607843, 0, 1, 1,
0.6143527, -0.5728254, 1.282702, 0.3686275, 0, 1, 1,
0.6168848, 1.211378, 0.7051036, 0.372549, 0, 1, 1,
0.6173467, 0.5572487, 0.1405998, 0.3803922, 0, 1, 1,
0.6175705, -1.120914, 2.064802, 0.3843137, 0, 1, 1,
0.6184286, 0.02844155, 1.403551, 0.3921569, 0, 1, 1,
0.6206576, -0.2705155, 4.188241, 0.3960784, 0, 1, 1,
0.6236659, -0.4178821, 3.052032, 0.4039216, 0, 1, 1,
0.6238438, -0.7043888, 2.003188, 0.4117647, 0, 1, 1,
0.6254687, 1.336875, -0.1748415, 0.4156863, 0, 1, 1,
0.6278076, 0.2136388, 0.4246561, 0.4235294, 0, 1, 1,
0.6392768, 0.0220251, 1.56561, 0.427451, 0, 1, 1,
0.6399009, -1.473758, 2.555716, 0.4352941, 0, 1, 1,
0.6402745, -1.470222, 0.7542357, 0.4392157, 0, 1, 1,
0.6407471, -2.84764, 1.49419, 0.4470588, 0, 1, 1,
0.6412672, -1.524057, 2.419136, 0.4509804, 0, 1, 1,
0.64294, 0.8832446, -0.2635143, 0.4588235, 0, 1, 1,
0.6462966, 0.7017916, 0.1104868, 0.4627451, 0, 1, 1,
0.6483394, 0.3950251, 0.8702148, 0.4705882, 0, 1, 1,
0.6505437, -0.318021, 2.131249, 0.4745098, 0, 1, 1,
0.6525229, 0.6118168, 1.652185, 0.4823529, 0, 1, 1,
0.6561415, 0.785272, 1.643623, 0.4862745, 0, 1, 1,
0.6584407, 0.2073469, 1.933619, 0.4941176, 0, 1, 1,
0.6711761, -0.1182446, 1.688053, 0.5019608, 0, 1, 1,
0.6727557, -0.4605855, 1.48333, 0.5058824, 0, 1, 1,
0.6731598, -1.148503, 3.118027, 0.5137255, 0, 1, 1,
0.6778645, 0.7645946, -0.4985121, 0.5176471, 0, 1, 1,
0.6839215, 2.331991, 0.3136449, 0.5254902, 0, 1, 1,
0.6845073, 0.8263209, 1.076947, 0.5294118, 0, 1, 1,
0.6861627, 0.8647634, 1.581785, 0.5372549, 0, 1, 1,
0.6865938, 0.5543438, 1.567485, 0.5411765, 0, 1, 1,
0.6876642, -1.14085, 1.050209, 0.5490196, 0, 1, 1,
0.6878133, -0.1787476, 3.461593, 0.5529412, 0, 1, 1,
0.6899968, -1.448581, 2.06408, 0.5607843, 0, 1, 1,
0.6909447, 0.2823624, 2.488426, 0.5647059, 0, 1, 1,
0.6967688, -0.1220905, 1.823298, 0.572549, 0, 1, 1,
0.6980122, -1.324468, 2.82673, 0.5764706, 0, 1, 1,
0.6997092, 0.7624421, 1.254069, 0.5843138, 0, 1, 1,
0.7014139, 0.09937588, -0.1298125, 0.5882353, 0, 1, 1,
0.7081935, -0.8944341, 3.10869, 0.5960785, 0, 1, 1,
0.7120424, 0.008105132, 1.920579, 0.6039216, 0, 1, 1,
0.7164061, -0.03610145, 2.154158, 0.6078432, 0, 1, 1,
0.7166521, 1.526534, -0.3938082, 0.6156863, 0, 1, 1,
0.7311906, 3.690108, 1.539969, 0.6196079, 0, 1, 1,
0.7362361, -0.01706624, 1.36398, 0.627451, 0, 1, 1,
0.7363946, -0.3606477, 2.14344, 0.6313726, 0, 1, 1,
0.7436416, -0.8219909, 2.648844, 0.6392157, 0, 1, 1,
0.7476558, 0.3504448, 1.24449, 0.6431373, 0, 1, 1,
0.7497169, -0.2069667, 1.884405, 0.6509804, 0, 1, 1,
0.7515184, -0.6557589, 2.891497, 0.654902, 0, 1, 1,
0.7559116, -1.97798, 2.648411, 0.6627451, 0, 1, 1,
0.7585391, 2.10992, 0.1336925, 0.6666667, 0, 1, 1,
0.7596486, -0.8051299, 2.037172, 0.6745098, 0, 1, 1,
0.7611532, -0.7998385, 2.011188, 0.6784314, 0, 1, 1,
0.7695567, 1.085161, 0.239288, 0.6862745, 0, 1, 1,
0.7746325, -0.4094773, 1.499138, 0.6901961, 0, 1, 1,
0.7882192, -1.010488, 3.22755, 0.6980392, 0, 1, 1,
0.7920209, -0.2363233, 2.290771, 0.7058824, 0, 1, 1,
0.7993143, -0.7782173, 3.155366, 0.7098039, 0, 1, 1,
0.8015901, 0.3413848, 2.028795, 0.7176471, 0, 1, 1,
0.8023849, -0.758057, 2.212874, 0.7215686, 0, 1, 1,
0.8038897, -1.824754, 2.041584, 0.7294118, 0, 1, 1,
0.8048896, -0.05967065, 0.4401808, 0.7333333, 0, 1, 1,
0.808001, -0.8706873, 3.209805, 0.7411765, 0, 1, 1,
0.8085082, -0.8076892, 0.6907733, 0.7450981, 0, 1, 1,
0.813862, -0.2083713, 2.326385, 0.7529412, 0, 1, 1,
0.8174066, 1.253593, 0.4592347, 0.7568628, 0, 1, 1,
0.8213989, 1.39076, 2.028757, 0.7647059, 0, 1, 1,
0.825963, 0.9644634, 2.158818, 0.7686275, 0, 1, 1,
0.8374695, -1.090479, 2.04802, 0.7764706, 0, 1, 1,
0.8424434, -0.5973594, 2.805536, 0.7803922, 0, 1, 1,
0.8588531, 1.800368, -0.02101898, 0.7882353, 0, 1, 1,
0.8595722, 1.092055, -0.5136535, 0.7921569, 0, 1, 1,
0.8604631, -2.562449, 2.616818, 0.8, 0, 1, 1,
0.8609912, -0.08961909, 2.568372, 0.8078431, 0, 1, 1,
0.8613111, 0.2838696, 2.142072, 0.8117647, 0, 1, 1,
0.864399, -0.1975587, -1.16786, 0.8196079, 0, 1, 1,
0.8687044, -1.307542, 2.08178, 0.8235294, 0, 1, 1,
0.8710172, -0.1133134, 1.198704, 0.8313726, 0, 1, 1,
0.8766207, 0.6328793, 0.5172451, 0.8352941, 0, 1, 1,
0.8768173, 0.3863162, 1.646711, 0.8431373, 0, 1, 1,
0.8807119, 0.8052386, 2.001132, 0.8470588, 0, 1, 1,
0.8855064, -1.268782, 0.8304634, 0.854902, 0, 1, 1,
0.8886405, 0.8732473, 1.148383, 0.8588235, 0, 1, 1,
0.8950942, 0.6284862, 0.477826, 0.8666667, 0, 1, 1,
0.8956364, 0.06108304, 0.9682522, 0.8705882, 0, 1, 1,
0.896279, 0.2303551, 1.398255, 0.8784314, 0, 1, 1,
0.9075403, -1.206537, 3.953159, 0.8823529, 0, 1, 1,
0.9186907, 0.3525763, 2.073629, 0.8901961, 0, 1, 1,
0.9211153, 0.1491959, 1.91497, 0.8941177, 0, 1, 1,
0.9264489, 0.2374862, 1.466843, 0.9019608, 0, 1, 1,
0.9264742, -0.7657996, 1.410478, 0.9098039, 0, 1, 1,
0.9278215, -1.964864, 2.362212, 0.9137255, 0, 1, 1,
0.9292043, -0.08516676, 2.016179, 0.9215686, 0, 1, 1,
0.9355047, 1.253342, 0.430471, 0.9254902, 0, 1, 1,
0.9412485, -0.6021577, 2.195547, 0.9333333, 0, 1, 1,
0.945262, -0.1891855, 1.770722, 0.9372549, 0, 1, 1,
0.9511206, 0.8802127, 2.106785, 0.945098, 0, 1, 1,
0.9541674, -0.3443781, -0.2253984, 0.9490196, 0, 1, 1,
0.9682888, -0.4014535, 2.068191, 0.9568627, 0, 1, 1,
0.9688757, -0.8193471, 3.472654, 0.9607843, 0, 1, 1,
0.9698916, 0.3846564, 0.8167207, 0.9686275, 0, 1, 1,
0.9716259, 1.617993, -1.294388, 0.972549, 0, 1, 1,
0.9742525, -0.7940338, 2.322706, 0.9803922, 0, 1, 1,
0.9788073, 1.53748, 0.0432596, 0.9843137, 0, 1, 1,
0.9802387, 1.287254, 1.14094, 0.9921569, 0, 1, 1,
0.9807209, 1.225371, -1.21439, 0.9960784, 0, 1, 1,
0.9842388, 0.1046118, 1.256441, 1, 0, 0.9960784, 1,
0.9865539, -0.6264344, 1.089613, 1, 0, 0.9882353, 1,
0.9866906, 1.230574, 0.1579131, 1, 0, 0.9843137, 1,
0.9867123, -1.267754, 3.671435, 1, 0, 0.9764706, 1,
0.987918, -0.6882318, 1.232208, 1, 0, 0.972549, 1,
0.9914408, 1.079552, 0.2648365, 1, 0, 0.9647059, 1,
0.9942534, -0.7761835, 1.929459, 1, 0, 0.9607843, 1,
0.9960298, 0.5625156, 0.9970112, 1, 0, 0.9529412, 1,
0.9995661, 0.2105613, 0.1590123, 1, 0, 0.9490196, 1,
1.003043, -1.040302, 2.309128, 1, 0, 0.9411765, 1,
1.013275, -0.7311398, 2.5471, 1, 0, 0.9372549, 1,
1.022286, -0.3798006, 1.91853, 1, 0, 0.9294118, 1,
1.0253, -0.3642575, 1.582579, 1, 0, 0.9254902, 1,
1.02608, 2.688424, 1.182026, 1, 0, 0.9176471, 1,
1.027052, -1.315375, 2.064025, 1, 0, 0.9137255, 1,
1.029809, -0.07745015, 2.182746, 1, 0, 0.9058824, 1,
1.031145, -1.367033, 1.897694, 1, 0, 0.9019608, 1,
1.033325, 0.3297143, -0.003692804, 1, 0, 0.8941177, 1,
1.03636, 0.3946976, 1.165632, 1, 0, 0.8862745, 1,
1.038381, -1.728116, 0.8730773, 1, 0, 0.8823529, 1,
1.053308, -1.052218, 2.832378, 1, 0, 0.8745098, 1,
1.056967, 0.001173465, 1.947625, 1, 0, 0.8705882, 1,
1.059298, -0.9522075, 2.150135, 1, 0, 0.8627451, 1,
1.060643, -0.6107492, 2.172948, 1, 0, 0.8588235, 1,
1.061162, 0.1101219, 0.2290612, 1, 0, 0.8509804, 1,
1.062708, -1.220709, 0.1248237, 1, 0, 0.8470588, 1,
1.063123, 1.645016, 1.731543, 1, 0, 0.8392157, 1,
1.070415, 0.01935601, 1.971535, 1, 0, 0.8352941, 1,
1.081454, -0.5907609, 1.394613, 1, 0, 0.827451, 1,
1.082708, 1.224511, 0.9506486, 1, 0, 0.8235294, 1,
1.083472, 0.2336843, 0.7460812, 1, 0, 0.8156863, 1,
1.084271, -0.5240748, 2.251236, 1, 0, 0.8117647, 1,
1.086144, -0.1156257, 1.562728, 1, 0, 0.8039216, 1,
1.088248, 0.596561, -0.3234684, 1, 0, 0.7960784, 1,
1.092425, -0.5698506, -0.1027143, 1, 0, 0.7921569, 1,
1.097672, 1.010282, 0.4368494, 1, 0, 0.7843137, 1,
1.098415, 1.459389, 2.751257, 1, 0, 0.7803922, 1,
1.099239, 2.319125, -0.3689443, 1, 0, 0.772549, 1,
1.113341, -1.144259, 2.504212, 1, 0, 0.7686275, 1,
1.1188, 0.9767648, 0.3860071, 1, 0, 0.7607843, 1,
1.127072, -0.4816079, 1.841053, 1, 0, 0.7568628, 1,
1.130786, -0.4314923, 0.9962021, 1, 0, 0.7490196, 1,
1.13132, -0.3609683, 1.80941, 1, 0, 0.7450981, 1,
1.145437, -0.2543058, 1.053771, 1, 0, 0.7372549, 1,
1.15141, 1.051083, 2.019159, 1, 0, 0.7333333, 1,
1.152559, 0.2895218, -0.05117772, 1, 0, 0.7254902, 1,
1.153767, -1.940351, 2.914374, 1, 0, 0.7215686, 1,
1.160614, 0.1074251, -0.05720521, 1, 0, 0.7137255, 1,
1.167526, 0.4915322, 2.358812, 1, 0, 0.7098039, 1,
1.168819, -0.5997769, 1.813214, 1, 0, 0.7019608, 1,
1.170905, -0.5523613, 2.916725, 1, 0, 0.6941177, 1,
1.171441, -1.113362, 2.610208, 1, 0, 0.6901961, 1,
1.179925, -0.2535863, 0.9009777, 1, 0, 0.682353, 1,
1.184792, 0.8447486, 0.1083005, 1, 0, 0.6784314, 1,
1.188635, 0.2058486, 0.614073, 1, 0, 0.6705883, 1,
1.189144, -0.6368278, 2.080814, 1, 0, 0.6666667, 1,
1.189659, 0.7569547, 0.4409123, 1, 0, 0.6588235, 1,
1.196182, -0.3666589, 0.5998567, 1, 0, 0.654902, 1,
1.1968, -1.312593, 2.94534, 1, 0, 0.6470588, 1,
1.197135, -1.22554, 1.92965, 1, 0, 0.6431373, 1,
1.206612, -0.8059809, 3.004648, 1, 0, 0.6352941, 1,
1.20778, -0.261171, 1.833653, 1, 0, 0.6313726, 1,
1.209785, 0.7950406, 2.027061, 1, 0, 0.6235294, 1,
1.21755, 0.08716781, 2.633865, 1, 0, 0.6196079, 1,
1.219867, 0.698355, 0.5561203, 1, 0, 0.6117647, 1,
1.225169, 0.4050722, 0.07254318, 1, 0, 0.6078432, 1,
1.237553, -0.3948189, 0.7608783, 1, 0, 0.6, 1,
1.241925, 1.546901, 2.829343, 1, 0, 0.5921569, 1,
1.242977, -2.195619, 4.237768, 1, 0, 0.5882353, 1,
1.243917, 1.639081, 0.6985655, 1, 0, 0.5803922, 1,
1.252966, -0.1527349, 1.603617, 1, 0, 0.5764706, 1,
1.257023, -0.4212356, 1.973121, 1, 0, 0.5686275, 1,
1.258901, -0.6510578, 1.444121, 1, 0, 0.5647059, 1,
1.272554, -1.24507, 3.117014, 1, 0, 0.5568628, 1,
1.281725, 0.6562115, 1.192606, 1, 0, 0.5529412, 1,
1.283723, 0.2991107, -0.4774902, 1, 0, 0.5450981, 1,
1.289913, -0.4976899, 2.142522, 1, 0, 0.5411765, 1,
1.29628, 1.406892, 1.465791, 1, 0, 0.5333334, 1,
1.30461, -0.3334371, 0.4732112, 1, 0, 0.5294118, 1,
1.313281, 0.03181023, 1.6024, 1, 0, 0.5215687, 1,
1.315436, -1.869102, 0.7240145, 1, 0, 0.5176471, 1,
1.317637, 1.399393, 0.416586, 1, 0, 0.509804, 1,
1.32004, 0.5060586, 2.537323, 1, 0, 0.5058824, 1,
1.330957, 1.547637, -1.432657, 1, 0, 0.4980392, 1,
1.336429, 0.1307342, -0.2946008, 1, 0, 0.4901961, 1,
1.340557, -0.3130691, 1.882346, 1, 0, 0.4862745, 1,
1.343588, -0.1424085, 1.720369, 1, 0, 0.4784314, 1,
1.351877, 2.556467, 0.1026484, 1, 0, 0.4745098, 1,
1.353701, -0.1870057, 2.633785, 1, 0, 0.4666667, 1,
1.35479, -0.7418593, 1.611393, 1, 0, 0.4627451, 1,
1.355829, 1.218997, 1.319219, 1, 0, 0.454902, 1,
1.359294, -0.1783268, -0.5135602, 1, 0, 0.4509804, 1,
1.359564, -1.301703, 2.329049, 1, 0, 0.4431373, 1,
1.40592, -0.4991173, 1.790749, 1, 0, 0.4392157, 1,
1.427534, -1.40141, 3.04382, 1, 0, 0.4313726, 1,
1.4307, -0.4065003, 0.9019083, 1, 0, 0.427451, 1,
1.434592, 0.1999284, 0.1966083, 1, 0, 0.4196078, 1,
1.435471, 1.229199, 0.9135361, 1, 0, 0.4156863, 1,
1.451191, 0.6278381, 0.773065, 1, 0, 0.4078431, 1,
1.459813, 0.6859059, -0.5146669, 1, 0, 0.4039216, 1,
1.461491, 0.9613099, 0.1491584, 1, 0, 0.3960784, 1,
1.464506, -0.1628375, 2.339574, 1, 0, 0.3882353, 1,
1.467412, 0.8733183, 1.347399, 1, 0, 0.3843137, 1,
1.485407, -0.588037, 1.346979, 1, 0, 0.3764706, 1,
1.509557, 1.934947, -0.1291588, 1, 0, 0.372549, 1,
1.511267, 1.068677, 0.5926959, 1, 0, 0.3647059, 1,
1.519899, -0.3423279, 3.067214, 1, 0, 0.3607843, 1,
1.524541, -0.8642359, 2.780011, 1, 0, 0.3529412, 1,
1.528108, -0.6641667, 1.768311, 1, 0, 0.3490196, 1,
1.528339, -0.1719028, 2.138506, 1, 0, 0.3411765, 1,
1.52957, -1.681732, 2.912077, 1, 0, 0.3372549, 1,
1.540908, -1.647689, 1.877761, 1, 0, 0.3294118, 1,
1.571298, -0.9085639, 3.214086, 1, 0, 0.3254902, 1,
1.571597, -1.522054, 2.46124, 1, 0, 0.3176471, 1,
1.572075, -1.732804, 4.498457, 1, 0, 0.3137255, 1,
1.578747, 1.003701, 0.4128807, 1, 0, 0.3058824, 1,
1.584089, 0.9375566, 1.400831, 1, 0, 0.2980392, 1,
1.586421, 0.5236511, 0.1756436, 1, 0, 0.2941177, 1,
1.588668, 2.295832, 0.7549683, 1, 0, 0.2862745, 1,
1.614764, -0.4458054, 1.290477, 1, 0, 0.282353, 1,
1.615106, -0.02754342, 2.742331, 1, 0, 0.2745098, 1,
1.616748, 0.2698136, 1.213153, 1, 0, 0.2705882, 1,
1.634034, 0.6914554, 1.085149, 1, 0, 0.2627451, 1,
1.648369, -0.6765636, 4.369811, 1, 0, 0.2588235, 1,
1.654669, -0.5089538, 0.3900547, 1, 0, 0.2509804, 1,
1.657786, -0.317079, 2.123385, 1, 0, 0.2470588, 1,
1.660203, 1.046995, 2.06876, 1, 0, 0.2392157, 1,
1.66243, 0.6276671, 2.17173, 1, 0, 0.2352941, 1,
1.669292, 0.6414579, 1.38552, 1, 0, 0.227451, 1,
1.669414, -1.50117, 2.046407, 1, 0, 0.2235294, 1,
1.721292, -1.047123, 3.900947, 1, 0, 0.2156863, 1,
1.74518, -0.4028141, 1.310496, 1, 0, 0.2117647, 1,
1.795359, 0.1071887, 1.958497, 1, 0, 0.2039216, 1,
1.807017, 0.6744146, -0.1687135, 1, 0, 0.1960784, 1,
1.809061, -0.4224619, 0.6443538, 1, 0, 0.1921569, 1,
1.846067, 0.5037025, 0.7174141, 1, 0, 0.1843137, 1,
1.870447, 0.6273056, 0.06820755, 1, 0, 0.1803922, 1,
1.878974, 1.164333, 1.74119, 1, 0, 0.172549, 1,
1.89279, -0.7145447, 1.78895, 1, 0, 0.1686275, 1,
1.924201, 0.6099176, 1.076075, 1, 0, 0.1607843, 1,
1.942392, 1.274695, -0.7870436, 1, 0, 0.1568628, 1,
1.961014, 0.1135002, 1.810232, 1, 0, 0.1490196, 1,
1.968076, -1.781457, 1.441891, 1, 0, 0.145098, 1,
1.988447, 1.024995, -1.193357, 1, 0, 0.1372549, 1,
2.019376, 1.479379, 3.14113, 1, 0, 0.1333333, 1,
2.020315, 1.7119, -0.7278842, 1, 0, 0.1254902, 1,
2.034014, 0.5761529, 3.250682, 1, 0, 0.1215686, 1,
2.077056, -0.01339094, 2.19501, 1, 0, 0.1137255, 1,
2.102808, 0.2871181, 1.137909, 1, 0, 0.1098039, 1,
2.131922, -0.7511297, 2.587321, 1, 0, 0.1019608, 1,
2.151044, -1.668525, 1.230278, 1, 0, 0.09411765, 1,
2.188331, 0.5161363, 1.313981, 1, 0, 0.09019608, 1,
2.19681, -0.1961333, 0.5721452, 1, 0, 0.08235294, 1,
2.235794, -0.7311972, 1.936198, 1, 0, 0.07843138, 1,
2.239437, -0.8788555, 0.3786104, 1, 0, 0.07058824, 1,
2.262296, 0.06979156, 2.8094, 1, 0, 0.06666667, 1,
2.267987, -2.129204, -0.438026, 1, 0, 0.05882353, 1,
2.378564, 0.01305438, 0.3006541, 1, 0, 0.05490196, 1,
2.419483, 0.0346753, 0.5285157, 1, 0, 0.04705882, 1,
2.423378, -0.3531717, 3.275367, 1, 0, 0.04313726, 1,
2.518517, 1.160223, 2.051523, 1, 0, 0.03529412, 1,
2.553066, 1.430632, 1.916494, 1, 0, 0.03137255, 1,
2.611884, -0.1164492, 0.4038651, 1, 0, 0.02352941, 1,
2.638165, 0.08454244, 1.878839, 1, 0, 0.01960784, 1,
2.743754, 0.517121, 0.8642743, 1, 0, 0.01176471, 1,
2.775161, -1.414174, 1.892976, 1, 0, 0.007843138, 1
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
-0.1727101, -4.696792, -7.026548, 0, -0.5, 0.5, 0.5,
-0.1727101, -4.696792, -7.026548, 1, -0.5, 0.5, 0.5,
-0.1727101, -4.696792, -7.026548, 1, 1.5, 0.5, 0.5,
-0.1727101, -4.696792, -7.026548, 0, 1.5, 0.5, 0.5
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
-4.119909, 0.1044307, -7.026548, 0, -0.5, 0.5, 0.5,
-4.119909, 0.1044307, -7.026548, 1, -0.5, 0.5, 0.5,
-4.119909, 0.1044307, -7.026548, 1, 1.5, 0.5, 0.5,
-4.119909, 0.1044307, -7.026548, 0, 1.5, 0.5, 0.5
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
-4.119909, -4.696792, 0.04017138, 0, -0.5, 0.5, 0.5,
-4.119909, -4.696792, 0.04017138, 1, -0.5, 0.5, 0.5,
-4.119909, -4.696792, 0.04017138, 1, 1.5, 0.5, 0.5,
-4.119909, -4.696792, 0.04017138, 0, 1.5, 0.5, 0.5
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
-3, -3.588817, -5.395766,
2, -3.588817, -5.395766,
-3, -3.588817, -5.395766,
-3, -3.77348, -5.667563,
-2, -3.588817, -5.395766,
-2, -3.77348, -5.667563,
-1, -3.588817, -5.395766,
-1, -3.77348, -5.667563,
0, -3.588817, -5.395766,
0, -3.77348, -5.667563,
1, -3.588817, -5.395766,
1, -3.77348, -5.667563,
2, -3.588817, -5.395766,
2, -3.77348, -5.667563
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
-3, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
-3, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
-3, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
-3, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5,
-2, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
-2, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
-2, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
-2, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5,
-1, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
-1, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
-1, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
-1, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5,
0, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
0, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
0, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
0, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5,
1, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
1, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
1, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
1, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5,
2, -4.142805, -6.211157, 0, -0.5, 0.5, 0.5,
2, -4.142805, -6.211157, 1, -0.5, 0.5, 0.5,
2, -4.142805, -6.211157, 1, 1.5, 0.5, 0.5,
2, -4.142805, -6.211157, 0, 1.5, 0.5, 0.5
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
-3.209017, -2, -5.395766,
-3.209017, 2, -5.395766,
-3.209017, -2, -5.395766,
-3.360832, -2, -5.667563,
-3.209017, 0, -5.395766,
-3.360832, 0, -5.667563,
-3.209017, 2, -5.395766,
-3.360832, 2, -5.667563
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
-3.664463, -2, -6.211157, 0, -0.5, 0.5, 0.5,
-3.664463, -2, -6.211157, 1, -0.5, 0.5, 0.5,
-3.664463, -2, -6.211157, 1, 1.5, 0.5, 0.5,
-3.664463, -2, -6.211157, 0, 1.5, 0.5, 0.5,
-3.664463, 0, -6.211157, 0, -0.5, 0.5, 0.5,
-3.664463, 0, -6.211157, 1, -0.5, 0.5, 0.5,
-3.664463, 0, -6.211157, 1, 1.5, 0.5, 0.5,
-3.664463, 0, -6.211157, 0, 1.5, 0.5, 0.5,
-3.664463, 2, -6.211157, 0, -0.5, 0.5, 0.5,
-3.664463, 2, -6.211157, 1, -0.5, 0.5, 0.5,
-3.664463, 2, -6.211157, 1, 1.5, 0.5, 0.5,
-3.664463, 2, -6.211157, 0, 1.5, 0.5, 0.5
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
-3.209017, -3.588817, -4,
-3.209017, -3.588817, 4,
-3.209017, -3.588817, -4,
-3.360832, -3.77348, -4,
-3.209017, -3.588817, -2,
-3.360832, -3.77348, -2,
-3.209017, -3.588817, 0,
-3.360832, -3.77348, 0,
-3.209017, -3.588817, 2,
-3.360832, -3.77348, 2,
-3.209017, -3.588817, 4,
-3.360832, -3.77348, 4
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
-3.664463, -4.142805, -4, 0, -0.5, 0.5, 0.5,
-3.664463, -4.142805, -4, 1, -0.5, 0.5, 0.5,
-3.664463, -4.142805, -4, 1, 1.5, 0.5, 0.5,
-3.664463, -4.142805, -4, 0, 1.5, 0.5, 0.5,
-3.664463, -4.142805, -2, 0, -0.5, 0.5, 0.5,
-3.664463, -4.142805, -2, 1, -0.5, 0.5, 0.5,
-3.664463, -4.142805, -2, 1, 1.5, 0.5, 0.5,
-3.664463, -4.142805, -2, 0, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 0, 0, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 0, 1, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 0, 1, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 0, 0, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 2, 0, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 2, 1, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 2, 1, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 2, 0, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 4, 0, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 4, 1, -0.5, 0.5, 0.5,
-3.664463, -4.142805, 4, 1, 1.5, 0.5, 0.5,
-3.664463, -4.142805, 4, 0, 1.5, 0.5, 0.5
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
-3.209017, -3.588817, -5.395766,
-3.209017, 3.797679, -5.395766,
-3.209017, -3.588817, 5.476109,
-3.209017, 3.797679, 5.476109,
-3.209017, -3.588817, -5.395766,
-3.209017, -3.588817, 5.476109,
-3.209017, 3.797679, -5.395766,
-3.209017, 3.797679, 5.476109,
-3.209017, -3.588817, -5.395766,
2.863597, -3.588817, -5.395766,
-3.209017, -3.588817, 5.476109,
2.863597, -3.588817, 5.476109,
-3.209017, 3.797679, -5.395766,
2.863597, 3.797679, -5.395766,
-3.209017, 3.797679, 5.476109,
2.863597, 3.797679, 5.476109,
2.863597, -3.588817, -5.395766,
2.863597, 3.797679, -5.395766,
2.863597, -3.588817, 5.476109,
2.863597, 3.797679, 5.476109,
2.863597, -3.588817, -5.395766,
2.863597, -3.588817, 5.476109,
2.863597, 3.797679, -5.395766,
2.863597, 3.797679, 5.476109
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
var radius = 7.731379;
var distance = 34.39778;
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
mvMatrix.translate( 0.1727101, -0.1044307, -0.04017138 );
mvMatrix.scale( 1.37656, 1.131703, 0.7688939 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39778);
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
mitoxantrone<-read.table("mitoxantrone.xyz")
```

```
## Error in read.table("mitoxantrone.xyz"): no lines available in input
```

```r
x<-mitoxantrone$V2
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
```

```r
y<-mitoxantrone$V3
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
```

```r
z<-mitoxantrone$V4
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
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
-3.120581, 1.498345, 0.686732, 0, 0, 1, 1, 1,
-3.005921, -2.528676, -3.684227, 1, 0, 0, 1, 1,
-2.957074, 0.4417464, -0.8221265, 1, 0, 0, 1, 1,
-2.707214, 0.1733675, -1.405878, 1, 0, 0, 1, 1,
-2.653728, -1.323127, -2.238246, 1, 0, 0, 1, 1,
-2.56426, -1.52287, -2.456458, 1, 0, 0, 1, 1,
-2.460768, 0.5879096, -2.173027, 0, 0, 0, 1, 1,
-2.394127, -1.077857, -2.046623, 0, 0, 0, 1, 1,
-2.367958, 0.6539284, -1.669934, 0, 0, 0, 1, 1,
-2.281323, 2.160929, -0.01588661, 0, 0, 0, 1, 1,
-2.280833, -1.206223, -1.789067, 0, 0, 0, 1, 1,
-2.241695, -0.3057633, -0.3736658, 0, 0, 0, 1, 1,
-2.236079, -2.19126, -3.685288, 0, 0, 0, 1, 1,
-2.076253, -1.256805, -1.347489, 1, 1, 1, 1, 1,
-2.075608, 0.4462284, -1.846463, 1, 1, 1, 1, 1,
-2.044582, 1.01104, -0.7875417, 1, 1, 1, 1, 1,
-1.977662, 0.6094162, -0.1520217, 1, 1, 1, 1, 1,
-1.937216, -0.9671113, -1.112808, 1, 1, 1, 1, 1,
-1.917573, -0.9691644, -2.42635, 1, 1, 1, 1, 1,
-1.886079, 1.317362, -2.485097, 1, 1, 1, 1, 1,
-1.856183, 0.1473306, -1.365193, 1, 1, 1, 1, 1,
-1.826103, -0.7987524, -1.84227, 1, 1, 1, 1, 1,
-1.825156, -0.4202014, -2.445788, 1, 1, 1, 1, 1,
-1.817014, -2.20094, -2.916294, 1, 1, 1, 1, 1,
-1.802174, 0.9345803, -1.539505, 1, 1, 1, 1, 1,
-1.796616, 0.2750842, -1.652519, 1, 1, 1, 1, 1,
-1.783668, 0.1844065, -1.527753, 1, 1, 1, 1, 1,
-1.757183, -1.711087, -3.870342, 1, 1, 1, 1, 1,
-1.749971, 0.06707411, -3.833115, 0, 0, 1, 1, 1,
-1.697695, 0.1595284, -1.566133, 1, 0, 0, 1, 1,
-1.695438, -1.486246, -1.384794, 1, 0, 0, 1, 1,
-1.693111, -0.757461, -0.971124, 1, 0, 0, 1, 1,
-1.690944, 0.3614274, -1.130672, 1, 0, 0, 1, 1,
-1.685776, 0.9125657, 0.7175039, 1, 0, 0, 1, 1,
-1.671793, 1.115545, -3.008707, 0, 0, 0, 1, 1,
-1.670652, -0.6603847, -2.878311, 0, 0, 0, 1, 1,
-1.649853, 0.9386024, -0.8135526, 0, 0, 0, 1, 1,
-1.640596, -2.058684, -3.930253, 0, 0, 0, 1, 1,
-1.638131, -0.2014509, -1.607687, 0, 0, 0, 1, 1,
-1.632436, 0.0611372, -3.082096, 0, 0, 0, 1, 1,
-1.623653, 0.4354392, -1.599872, 0, 0, 0, 1, 1,
-1.605421, 0.3647877, -1.372649, 1, 1, 1, 1, 1,
-1.577152, 2.067712, -1.06314, 1, 1, 1, 1, 1,
-1.572673, 0.5113155, -2.275061, 1, 1, 1, 1, 1,
-1.570134, -0.7616847, -1.166659, 1, 1, 1, 1, 1,
-1.568529, 0.8519964, -1.670609, 1, 1, 1, 1, 1,
-1.561731, -0.7281478, -2.728124, 1, 1, 1, 1, 1,
-1.558854, 0.8859597, -1.143026, 1, 1, 1, 1, 1,
-1.545338, 2.837505, -0.7142414, 1, 1, 1, 1, 1,
-1.543367, -0.2084249, -1.064349, 1, 1, 1, 1, 1,
-1.53383, 1.23963, -1.863732, 1, 1, 1, 1, 1,
-1.521514, -1.411291, -1.887655, 1, 1, 1, 1, 1,
-1.510225, -1.306498, -2.083045, 1, 1, 1, 1, 1,
-1.505902, -0.1389961, -1.550744, 1, 1, 1, 1, 1,
-1.505573, 0.082683, -1.553494, 1, 1, 1, 1, 1,
-1.501446, -0.8085836, -3.749074, 1, 1, 1, 1, 1,
-1.49322, -0.8010983, -0.7403184, 0, 0, 1, 1, 1,
-1.477691, -0.3727544, -1.842997, 1, 0, 0, 1, 1,
-1.453126, -1.285492, -2.66548, 1, 0, 0, 1, 1,
-1.44681, 1.3373, -2.032192, 1, 0, 0, 1, 1,
-1.445838, -0.2150761, -2.631478, 1, 0, 0, 1, 1,
-1.441394, -1.465064, -2.217656, 1, 0, 0, 1, 1,
-1.438776, 1.150226, -0.7909584, 0, 0, 0, 1, 1,
-1.42742, 0.3023019, -1.513617, 0, 0, 0, 1, 1,
-1.426205, 0.338365, -1.801377, 0, 0, 0, 1, 1,
-1.424748, -0.8058572, -2.694554, 0, 0, 0, 1, 1,
-1.419967, 2.078476, 1.053515, 0, 0, 0, 1, 1,
-1.411625, -0.06489943, -2.039481, 0, 0, 0, 1, 1,
-1.411223, -0.5590484, -0.8867539, 0, 0, 0, 1, 1,
-1.404947, 1.049454, 0.2745989, 1, 1, 1, 1, 1,
-1.400153, -0.4900761, -0.6584177, 1, 1, 1, 1, 1,
-1.384924, -2.284314, -4.302345, 1, 1, 1, 1, 1,
-1.378866, 0.1425968, -2.390065, 1, 1, 1, 1, 1,
-1.361779, 0.4082227, -1.203003, 1, 1, 1, 1, 1,
-1.347169, -0.1905208, -1.850441, 1, 1, 1, 1, 1,
-1.342432, -0.7508854, -2.456176, 1, 1, 1, 1, 1,
-1.338841, 0.2137076, 0.3733023, 1, 1, 1, 1, 1,
-1.337235, 1.149637, 0.4827033, 1, 1, 1, 1, 1,
-1.329399, -0.6347927, -1.863435, 1, 1, 1, 1, 1,
-1.308447, 1.585099, 0.1014113, 1, 1, 1, 1, 1,
-1.288922, 0.9143841, -1.612596, 1, 1, 1, 1, 1,
-1.288614, -0.0667692, -0.8454883, 1, 1, 1, 1, 1,
-1.28325, -0.3631477, 0.6319216, 1, 1, 1, 1, 1,
-1.281465, -0.8559721, -0.7862014, 1, 1, 1, 1, 1,
-1.268775, 0.1185298, -1.147141, 0, 0, 1, 1, 1,
-1.267477, -2.159904, -4.211114, 1, 0, 0, 1, 1,
-1.262977, -0.4200089, -1.392596, 1, 0, 0, 1, 1,
-1.262469, 1.052335, -0.2326001, 1, 0, 0, 1, 1,
-1.241097, -1.311619, -1.223248, 1, 0, 0, 1, 1,
-1.219679, 0.1094668, -1.90072, 1, 0, 0, 1, 1,
-1.21844, 1.830962, -0.3776822, 0, 0, 0, 1, 1,
-1.20479, -0.3662311, -1.826886, 0, 0, 0, 1, 1,
-1.20288, 0.1313872, -1.595281, 0, 0, 0, 1, 1,
-1.200743, -1.240191, -0.1634411, 0, 0, 0, 1, 1,
-1.196134, 0.7021427, -1.897755, 0, 0, 0, 1, 1,
-1.184512, -0.7468259, -2.949093, 0, 0, 0, 1, 1,
-1.174514, 1.58994, 0.7378346, 0, 0, 0, 1, 1,
-1.170715, 1.18645, -1.237582, 1, 1, 1, 1, 1,
-1.163434, 0.4009809, -0.7279175, 1, 1, 1, 1, 1,
-1.153812, 2.109323, -0.2788784, 1, 1, 1, 1, 1,
-1.146074, -0.6298746, -2.642318, 1, 1, 1, 1, 1,
-1.143815, -0.7803026, -2.406992, 1, 1, 1, 1, 1,
-1.141929, -0.45248, -1.684641, 1, 1, 1, 1, 1,
-1.140966, -2.570615, -3.128974, 1, 1, 1, 1, 1,
-1.140865, 0.8802564, -1.94186, 1, 1, 1, 1, 1,
-1.128328, 1.949652, -1.838527, 1, 1, 1, 1, 1,
-1.119712, 0.7042724, 0.548709, 1, 1, 1, 1, 1,
-1.114789, -0.1447394, -1.574319, 1, 1, 1, 1, 1,
-1.114673, -0.6933945, -1.991625, 1, 1, 1, 1, 1,
-1.112181, 0.9425157, -1.740704, 1, 1, 1, 1, 1,
-1.099618, -2.148695, -3.08771, 1, 1, 1, 1, 1,
-1.097624, 1.247158, 0.595052, 1, 1, 1, 1, 1,
-1.097341, -0.7625239, -1.570575, 0, 0, 1, 1, 1,
-1.0904, 1.514331, 0.8646546, 1, 0, 0, 1, 1,
-1.08835, -0.005131642, -1.349169, 1, 0, 0, 1, 1,
-1.08667, 0.4891285, -0.7838097, 1, 0, 0, 1, 1,
-1.085342, 0.839815, -0.8986475, 1, 0, 0, 1, 1,
-1.080786, 0.8373435, -0.731499, 1, 0, 0, 1, 1,
-1.079881, -1.317474, -1.950441, 0, 0, 0, 1, 1,
-1.072025, -2.218789, -1.267016, 0, 0, 0, 1, 1,
-1.064311, 1.196589, -1.309724, 0, 0, 0, 1, 1,
-1.059201, -0.4156698, -3.565976, 0, 0, 0, 1, 1,
-1.050506, -0.374539, -3.66459, 0, 0, 0, 1, 1,
-1.042186, -0.3237198, -1.647388, 0, 0, 0, 1, 1,
-1.041125, 0.2025031, -1.862933, 0, 0, 0, 1, 1,
-1.039536, -0.8929851, -1.417086, 1, 1, 1, 1, 1,
-1.039034, -0.1280986, -1.800842, 1, 1, 1, 1, 1,
-1.033608, 1.056121, -0.2575195, 1, 1, 1, 1, 1,
-1.030786, 0.6629844, -2.378165, 1, 1, 1, 1, 1,
-1.027881, -1.198196, -3.174446, 1, 1, 1, 1, 1,
-1.027152, 2.25073, -0.5649031, 1, 1, 1, 1, 1,
-1.025359, 1.334426, -0.6079946, 1, 1, 1, 1, 1,
-1.022894, 1.174407, -1.098232, 1, 1, 1, 1, 1,
-1.015268, 0.6514233, -0.538919, 1, 1, 1, 1, 1,
-0.9983783, 1.61899, 0.7421394, 1, 1, 1, 1, 1,
-0.9942603, -1.092165, -2.922621, 1, 1, 1, 1, 1,
-0.9895617, 0.02637966, -1.928324, 1, 1, 1, 1, 1,
-0.9858645, -0.7419519, -3.367304, 1, 1, 1, 1, 1,
-0.9795077, 0.5646477, -0.4637178, 1, 1, 1, 1, 1,
-0.9787054, 0.8508567, -0.1459443, 1, 1, 1, 1, 1,
-0.9743953, -0.596642, -1.753114, 0, 0, 1, 1, 1,
-0.9712138, 0.7083512, -0.04741875, 1, 0, 0, 1, 1,
-0.969908, -1.584576, -2.394883, 1, 0, 0, 1, 1,
-0.9585071, -0.9620587, -2.534423, 1, 0, 0, 1, 1,
-0.9579836, 0.595079, -1.585589, 1, 0, 0, 1, 1,
-0.948788, 1.429884, -1.67321, 1, 0, 0, 1, 1,
-0.9476812, -0.3550646, -2.180303, 0, 0, 0, 1, 1,
-0.9426828, -0.3139819, -1.918101, 0, 0, 0, 1, 1,
-0.9408296, -0.6884059, -2.155154, 0, 0, 0, 1, 1,
-0.9308085, 0.6707737, -1.887792, 0, 0, 0, 1, 1,
-0.9295655, 0.1887712, -0.4869819, 0, 0, 0, 1, 1,
-0.9288304, 0.2021925, -1.282439, 0, 0, 0, 1, 1,
-0.9263593, 0.1464554, -1.445738, 0, 0, 0, 1, 1,
-0.9254122, 0.380902, -0.04941875, 1, 1, 1, 1, 1,
-0.9186869, -1.473369, -3.645934, 1, 1, 1, 1, 1,
-0.9185118, 0.2433754, -1.717631, 1, 1, 1, 1, 1,
-0.9153925, 0.5672991, -1.363817, 1, 1, 1, 1, 1,
-0.9107533, -0.7245962, -1.785669, 1, 1, 1, 1, 1,
-0.9099585, 0.2928269, 0.0842056, 1, 1, 1, 1, 1,
-0.9094242, 1.068315, -0.9743589, 1, 1, 1, 1, 1,
-0.9091893, 0.4695082, -0.4124053, 1, 1, 1, 1, 1,
-0.9078226, 0.0990351, 0.1626237, 1, 1, 1, 1, 1,
-0.906507, -0.3064854, -3.403405, 1, 1, 1, 1, 1,
-0.9057029, -0.4379857, -2.478447, 1, 1, 1, 1, 1,
-0.9034488, -0.8556731, -2.132959, 1, 1, 1, 1, 1,
-0.9003792, 0.1414186, -1.649996, 1, 1, 1, 1, 1,
-0.8973245, -0.8148093, -3.546993, 1, 1, 1, 1, 1,
-0.889054, -0.3211494, -0.542617, 1, 1, 1, 1, 1,
-0.8832222, -0.4863337, -0.7106724, 0, 0, 1, 1, 1,
-0.8722184, 0.254951, -0.0867013, 1, 0, 0, 1, 1,
-0.8663198, -0.1178058, -0.5569735, 1, 0, 0, 1, 1,
-0.863053, -0.6122573, -1.287998, 1, 0, 0, 1, 1,
-0.8579003, -1.042267, -5.237438, 1, 0, 0, 1, 1,
-0.8536618, -0.9686624, -2.271105, 1, 0, 0, 1, 1,
-0.8478091, -1.282976, -0.870609, 0, 0, 0, 1, 1,
-0.836475, -0.5127657, -2.482825, 0, 0, 0, 1, 1,
-0.832574, -0.6972059, -1.52687, 0, 0, 0, 1, 1,
-0.830038, -1.525544, -2.391374, 0, 0, 0, 1, 1,
-0.8287053, -0.850937, -3.97578, 0, 0, 0, 1, 1,
-0.8271746, 0.07027835, -0.08710846, 0, 0, 0, 1, 1,
-0.8254585, 1.271287, 0.529965, 0, 0, 0, 1, 1,
-0.8197734, 0.2542182, -1.41264, 1, 1, 1, 1, 1,
-0.8146939, -0.04204028, -1.343847, 1, 1, 1, 1, 1,
-0.8135242, 0.2777222, -1.229571, 1, 1, 1, 1, 1,
-0.8076076, -0.01715478, -1.094884, 1, 1, 1, 1, 1,
-0.8002256, -1.286131, -4.404933, 1, 1, 1, 1, 1,
-0.7987036, -0.3687313, -3.204856, 1, 1, 1, 1, 1,
-0.7984563, -1.496188, -1.828792, 1, 1, 1, 1, 1,
-0.7955912, 1.187771, 1.422328, 1, 1, 1, 1, 1,
-0.7878127, -0.2981293, -2.559616, 1, 1, 1, 1, 1,
-0.7830713, -0.9745611, -2.223176, 1, 1, 1, 1, 1,
-0.7784389, 0.02178679, -2.568545, 1, 1, 1, 1, 1,
-0.774003, 0.8512034, -2.582959, 1, 1, 1, 1, 1,
-0.7678137, -1.048467, -3.476757, 1, 1, 1, 1, 1,
-0.7623132, -0.5927868, -1.767451, 1, 1, 1, 1, 1,
-0.7553122, 0.02232829, -1.458524, 1, 1, 1, 1, 1,
-0.7510048, 0.2951975, -1.579378, 0, 0, 1, 1, 1,
-0.7508219, 1.580557, -1.535184, 1, 0, 0, 1, 1,
-0.7497112, 1.223918, 0.3437847, 1, 0, 0, 1, 1,
-0.7451256, -0.949103, -3.713757, 1, 0, 0, 1, 1,
-0.7377276, -0.7551255, -3.042444, 1, 0, 0, 1, 1,
-0.7282203, -0.8496757, -2.090223, 1, 0, 0, 1, 1,
-0.7214553, 1.385692, 0.08482322, 0, 0, 0, 1, 1,
-0.7213423, -0.4568678, -1.94975, 0, 0, 0, 1, 1,
-0.7208062, -0.7853585, -0.1070006, 0, 0, 0, 1, 1,
-0.7189465, 1.027751, 0.3905665, 0, 0, 0, 1, 1,
-0.7166022, 0.6344937, -1.170925, 0, 0, 0, 1, 1,
-0.714774, -0.2500844, -3.068673, 0, 0, 0, 1, 1,
-0.710802, 0.1176294, -2.740708, 0, 0, 0, 1, 1,
-0.7093425, -2.20264, -3.880638, 1, 1, 1, 1, 1,
-0.7082744, -1.29684, -2.993199, 1, 1, 1, 1, 1,
-0.7068285, -0.6678736, -2.425052, 1, 1, 1, 1, 1,
-0.6971759, -2.776238, -3.326209, 1, 1, 1, 1, 1,
-0.6922955, -2.110344, -2.866532, 1, 1, 1, 1, 1,
-0.6896883, -2.017784, -2.381672, 1, 1, 1, 1, 1,
-0.6858196, 0.3758571, -1.942832, 1, 1, 1, 1, 1,
-0.6832728, -0.4908307, -2.776017, 1, 1, 1, 1, 1,
-0.6825131, 0.3641706, -1.371522, 1, 1, 1, 1, 1,
-0.6808066, 0.2209931, -1.874094, 1, 1, 1, 1, 1,
-0.6750308, 0.6949966, -0.2960359, 1, 1, 1, 1, 1,
-0.6750147, -0.05896872, -1.335299, 1, 1, 1, 1, 1,
-0.6622264, -1.79898, -2.803162, 1, 1, 1, 1, 1,
-0.661158, -0.4507104, -3.05239, 1, 1, 1, 1, 1,
-0.660238, 1.050573, -0.286086, 1, 1, 1, 1, 1,
-0.6562055, -0.2824556, -3.749257, 0, 0, 1, 1, 1,
-0.6536248, -2.223447, -2.877231, 1, 0, 0, 1, 1,
-0.6529119, -0.4424845, -1.518209, 1, 0, 0, 1, 1,
-0.6525068, -0.9878717, -1.692755, 1, 0, 0, 1, 1,
-0.6510511, 0.02279252, -1.858374, 1, 0, 0, 1, 1,
-0.6470072, -1.858703, -2.654251, 1, 0, 0, 1, 1,
-0.6461667, 0.4706483, -1.197761, 0, 0, 0, 1, 1,
-0.6457562, -1.077499, -1.721036, 0, 0, 0, 1, 1,
-0.6374972, -1.094848, -3.028627, 0, 0, 0, 1, 1,
-0.6305538, -0.7493511, -2.29994, 0, 0, 0, 1, 1,
-0.6277878, 0.5397958, -1.610134, 0, 0, 0, 1, 1,
-0.6260151, -0.4699474, -2.747619, 0, 0, 0, 1, 1,
-0.6187662, -0.2359708, -2.061157, 0, 0, 0, 1, 1,
-0.6146379, -0.03230165, -1.405819, 1, 1, 1, 1, 1,
-0.6143302, 0.968352, -1.497572, 1, 1, 1, 1, 1,
-0.6135879, 2.131142, -1.601615, 1, 1, 1, 1, 1,
-0.6115292, -1.276978, -4.609796, 1, 1, 1, 1, 1,
-0.6098634, -0.3660547, -1.479615, 1, 1, 1, 1, 1,
-0.6098192, 1.217837, -1.254838, 1, 1, 1, 1, 1,
-0.6092912, 0.4555035, -1.994354, 1, 1, 1, 1, 1,
-0.6063684, 0.6992838, -0.8464471, 1, 1, 1, 1, 1,
-0.6058739, -2.016514, -2.322794, 1, 1, 1, 1, 1,
-0.6005583, 1.86566, -1.598622, 1, 1, 1, 1, 1,
-0.5968515, -1.075693, -1.200488, 1, 1, 1, 1, 1,
-0.5948674, 0.8546428, -2.098872, 1, 1, 1, 1, 1,
-0.590201, -1.009136, -3.317662, 1, 1, 1, 1, 1,
-0.5887597, -1.013871, -2.508255, 1, 1, 1, 1, 1,
-0.5875268, -1.013906, -2.188684, 1, 1, 1, 1, 1,
-0.585417, 0.1050443, -3.297907, 0, 0, 1, 1, 1,
-0.5819101, -0.5914392, -3.383953, 1, 0, 0, 1, 1,
-0.5761292, 1.133538, -2.558765, 1, 0, 0, 1, 1,
-0.5748242, 0.2202589, -1.43294, 1, 0, 0, 1, 1,
-0.5740094, -1.333687, -2.586396, 1, 0, 0, 1, 1,
-0.5687279, 1.372479, 1.315703, 1, 0, 0, 1, 1,
-0.5654896, -0.0857113, -0.7968563, 0, 0, 0, 1, 1,
-0.5646871, 1.772081, -0.356912, 0, 0, 0, 1, 1,
-0.5603325, -0.25357, -2.988076, 0, 0, 0, 1, 1,
-0.5577897, 1.080123, -0.5459916, 0, 0, 0, 1, 1,
-0.5566255, 1.7551, 0.5912068, 0, 0, 0, 1, 1,
-0.5549754, 1.507326, 0.06911932, 0, 0, 0, 1, 1,
-0.5529786, 1.281412, 0.6178858, 0, 0, 0, 1, 1,
-0.5517251, -1.766238, -3.594517, 1, 1, 1, 1, 1,
-0.5492457, -0.3159441, -2.495751, 1, 1, 1, 1, 1,
-0.5477718, 0.9774163, 0.6184946, 1, 1, 1, 1, 1,
-0.5477681, 1.556155, -0.5223413, 1, 1, 1, 1, 1,
-0.5474782, 1.151334, -0.5805536, 1, 1, 1, 1, 1,
-0.5439087, -0.03258534, -2.004247, 1, 1, 1, 1, 1,
-0.5372145, -2.636438, -3.899247, 1, 1, 1, 1, 1,
-0.5303307, 0.9141769, -1.616624, 1, 1, 1, 1, 1,
-0.5263175, 0.2333987, -0.7715957, 1, 1, 1, 1, 1,
-0.5260112, -2.221513, -4.274712, 1, 1, 1, 1, 1,
-0.5246031, 1.157235, -0.4738948, 1, 1, 1, 1, 1,
-0.5179273, 0.02439071, -1.426615, 1, 1, 1, 1, 1,
-0.5136514, -0.9083275, -2.204171, 1, 1, 1, 1, 1,
-0.5132229, -0.4577164, -1.900214, 1, 1, 1, 1, 1,
-0.5131181, -0.4934433, -1.956311, 1, 1, 1, 1, 1,
-0.5098383, 1.18592, 0.6769323, 0, 0, 1, 1, 1,
-0.5081648, -2.079664, -3.604723, 1, 0, 0, 1, 1,
-0.5027531, -0.1247684, -2.518414, 1, 0, 0, 1, 1,
-0.5026571, 1.561724, 0.5293093, 1, 0, 0, 1, 1,
-0.5006443, 1.546995, -0.2614627, 1, 0, 0, 1, 1,
-0.4980884, -0.3800517, -1.171347, 1, 0, 0, 1, 1,
-0.4913034, 0.545715, -0.7725289, 0, 0, 0, 1, 1,
-0.490078, 0.6147965, 0.8413681, 0, 0, 0, 1, 1,
-0.4896038, -0.5285796, -2.82648, 0, 0, 0, 1, 1,
-0.4870887, -0.9573714, -3.308609, 0, 0, 0, 1, 1,
-0.4840869, 0.2001968, -3.242082, 0, 0, 0, 1, 1,
-0.481573, -0.1130688, -1.679797, 0, 0, 0, 1, 1,
-0.4788193, 2.43439, -0.953466, 0, 0, 0, 1, 1,
-0.4779251, -0.7767345, -1.867226, 1, 1, 1, 1, 1,
-0.4762386, -0.5980927, -3.140437, 1, 1, 1, 1, 1,
-0.4755235, -1.569022, -1.218123, 1, 1, 1, 1, 1,
-0.473058, 0.251623, -1.070718, 1, 1, 1, 1, 1,
-0.4682702, -0.6548471, -2.404455, 1, 1, 1, 1, 1,
-0.4649107, -0.01463806, -0.8182302, 1, 1, 1, 1, 1,
-0.4611593, 2.210922, 0.5728815, 1, 1, 1, 1, 1,
-0.4552822, 1.044163, -0.7210491, 1, 1, 1, 1, 1,
-0.453788, 0.6731356, -1.005849, 1, 1, 1, 1, 1,
-0.4519873, -0.3645434, -2.639748, 1, 1, 1, 1, 1,
-0.4507394, 0.01998477, -0.5063627, 1, 1, 1, 1, 1,
-0.4458574, -0.3509035, -1.010128, 1, 1, 1, 1, 1,
-0.4445527, 0.9018317, -1.304752, 1, 1, 1, 1, 1,
-0.4419986, 0.4323172, -0.1902812, 1, 1, 1, 1, 1,
-0.440416, 0.7449563, 0.03760929, 1, 1, 1, 1, 1,
-0.4394385, -0.3505434, -1.853621, 0, 0, 1, 1, 1,
-0.4389053, -0.6938961, -3.896756, 1, 0, 0, 1, 1,
-0.4341766, -0.05063587, -1.186571, 1, 0, 0, 1, 1,
-0.429895, -0.02318127, -3.320123, 1, 0, 0, 1, 1,
-0.4271567, 0.1203, -0.3634278, 1, 0, 0, 1, 1,
-0.4236707, 0.2592904, -2.200961, 1, 0, 0, 1, 1,
-0.4192511, -0.8421504, -1.304148, 0, 0, 0, 1, 1,
-0.417989, 1.643033, -1.987087, 0, 0, 0, 1, 1,
-0.4149233, -0.8925859, -2.858191, 0, 0, 0, 1, 1,
-0.4123486, 0.4620912, -1.456217, 0, 0, 0, 1, 1,
-0.4084479, -1.091338, -3.248806, 0, 0, 0, 1, 1,
-0.4082734, 0.9525688, 0.6810179, 0, 0, 0, 1, 1,
-0.4069355, 0.5388352, 0.1811361, 0, 0, 0, 1, 1,
-0.4049963, -1.404976, -1.743975, 1, 1, 1, 1, 1,
-0.4033499, -1.740286, -1.656192, 1, 1, 1, 1, 1,
-0.3969212, -0.7264962, -2.079664, 1, 1, 1, 1, 1,
-0.39683, -2.114223, -1.583786, 1, 1, 1, 1, 1,
-0.396068, -0.4554127, -1.922102, 1, 1, 1, 1, 1,
-0.3945225, 0.8979625, -0.5592552, 1, 1, 1, 1, 1,
-0.388364, 0.7396169, 0.0237755, 1, 1, 1, 1, 1,
-0.3822696, -0.6910201, -3.085088, 1, 1, 1, 1, 1,
-0.3776316, -0.7156842, -1.734553, 1, 1, 1, 1, 1,
-0.3775162, -0.5248114, -1.95958, 1, 1, 1, 1, 1,
-0.3774076, -1.035677, -2.506644, 1, 1, 1, 1, 1,
-0.3693935, 0.3886359, -1.227103, 1, 1, 1, 1, 1,
-0.3690005, -1.519999, -3.142699, 1, 1, 1, 1, 1,
-0.3689224, 1.720464, 0.9478405, 1, 1, 1, 1, 1,
-0.368519, -0.4572107, -2.506653, 1, 1, 1, 1, 1,
-0.3677369, 0.1741353, -0.4783735, 0, 0, 1, 1, 1,
-0.3665042, 0.6685142, 0.9723651, 1, 0, 0, 1, 1,
-0.3649379, -0.2967257, -1.928198, 1, 0, 0, 1, 1,
-0.3631092, 0.5858687, -1.260381, 1, 0, 0, 1, 1,
-0.3583545, -0.4690217, -3.679467, 1, 0, 0, 1, 1,
-0.3581858, -0.3820228, -3.258432, 1, 0, 0, 1, 1,
-0.3523011, 0.06044409, -0.9118234, 0, 0, 0, 1, 1,
-0.3506815, -0.6106562, -3.917852, 0, 0, 0, 1, 1,
-0.3491451, -0.08110355, -1.950416, 0, 0, 0, 1, 1,
-0.3479933, -1.267672, -3.579893, 0, 0, 0, 1, 1,
-0.3456373, 0.2256666, -1.890385, 0, 0, 0, 1, 1,
-0.3451338, -1.168783, -3.735997, 0, 0, 0, 1, 1,
-0.3444276, 0.224429, -1.311564, 0, 0, 0, 1, 1,
-0.3431755, 0.3066746, 0.5060918, 1, 1, 1, 1, 1,
-0.3416756, 0.6537188, -0.3714281, 1, 1, 1, 1, 1,
-0.3411882, 0.292044, -0.5677862, 1, 1, 1, 1, 1,
-0.3409268, 1.153099, 1.635865, 1, 1, 1, 1, 1,
-0.3384219, -0.4034262, -3.569251, 1, 1, 1, 1, 1,
-0.3366274, -1.398394, -2.74434, 1, 1, 1, 1, 1,
-0.3363318, 1.308172, 1.106018, 1, 1, 1, 1, 1,
-0.3360503, 0.2929322, 0.1227643, 1, 1, 1, 1, 1,
-0.3331403, 1.001845, -0.8152769, 1, 1, 1, 1, 1,
-0.3289658, -0.2852308, 1.003336, 1, 1, 1, 1, 1,
-0.3287665, 0.4550451, 0.6768717, 1, 1, 1, 1, 1,
-0.3236231, 1.178535, -2.481575, 1, 1, 1, 1, 1,
-0.3225644, 1.098395, -0.4086321, 1, 1, 1, 1, 1,
-0.3215255, -0.2881839, -3.459725, 1, 1, 1, 1, 1,
-0.318642, 0.235534, -1.936177, 1, 1, 1, 1, 1,
-0.3173061, -0.104393, -4.280544, 0, 0, 1, 1, 1,
-0.3153025, 1.645143, -0.8444497, 1, 0, 0, 1, 1,
-0.3138916, 0.6087925, 0.01075534, 1, 0, 0, 1, 1,
-0.3125649, 0.4931335, -0.624975, 1, 0, 0, 1, 1,
-0.3102224, -0.4296176, -3.141307, 1, 0, 0, 1, 1,
-0.3056478, 1.709268, 0.04714996, 1, 0, 0, 1, 1,
-0.2953164, -0.2736154, -3.406643, 0, 0, 0, 1, 1,
-0.2949864, -0.9314364, -3.196379, 0, 0, 0, 1, 1,
-0.2922862, 0.9985356, 0.9038445, 0, 0, 0, 1, 1,
-0.29048, -0.2568647, -1.52545, 0, 0, 0, 1, 1,
-0.2887695, -0.4813628, -2.689237, 0, 0, 0, 1, 1,
-0.2804357, -0.06918509, -1.188502, 0, 0, 0, 1, 1,
-0.2796476, 0.05163825, -1.529043, 0, 0, 0, 1, 1,
-0.2777629, -0.469541, -3.191049, 1, 1, 1, 1, 1,
-0.2752803, -1.138192, -3.353243, 1, 1, 1, 1, 1,
-0.2697029, 0.573358, 1.692878, 1, 1, 1, 1, 1,
-0.2684029, -0.1695284, -1.816322, 1, 1, 1, 1, 1,
-0.2683471, -2.205322, -2.616456, 1, 1, 1, 1, 1,
-0.2674212, -0.09510498, -3.539015, 1, 1, 1, 1, 1,
-0.2647479, -0.0335243, -2.469493, 1, 1, 1, 1, 1,
-0.2638378, -1.091277, -2.66956, 1, 1, 1, 1, 1,
-0.2609402, -0.0838965, -1.281644, 1, 1, 1, 1, 1,
-0.2575694, -0.6572348, -1.709832, 1, 1, 1, 1, 1,
-0.2513618, -0.9456743, -2.700999, 1, 1, 1, 1, 1,
-0.2504258, -1.280465, -4.469972, 1, 1, 1, 1, 1,
-0.2495264, 0.1343854, -0.8193359, 1, 1, 1, 1, 1,
-0.24929, -2.907387, -3.078309, 1, 1, 1, 1, 1,
-0.247005, -1.717884, -1.638548, 1, 1, 1, 1, 1,
-0.2468178, -1.785561, -2.53462, 0, 0, 1, 1, 1,
-0.2460513, 1.782115, 0.2920067, 1, 0, 0, 1, 1,
-0.2390211, 0.98246, 0.1160554, 1, 0, 0, 1, 1,
-0.2353387, 1.262338, 1.279369, 1, 0, 0, 1, 1,
-0.2348878, 2.024891, -0.6415314, 1, 0, 0, 1, 1,
-0.231268, -0.2437209, -3.615939, 1, 0, 0, 1, 1,
-0.2308735, -1.34912, -2.393882, 0, 0, 0, 1, 1,
-0.229607, -0.03264764, -1.90471, 0, 0, 0, 1, 1,
-0.2284238, 0.1284965, 2.765007, 0, 0, 0, 1, 1,
-0.2283456, -0.9624849, -3.461239, 0, 0, 0, 1, 1,
-0.2273661, -0.5981495, -2.468983, 0, 0, 0, 1, 1,
-0.2262808, 0.4663979, -2.458914, 0, 0, 0, 1, 1,
-0.2254446, 0.9733917, -0.5327977, 0, 0, 0, 1, 1,
-0.2248998, -1.525763, -5.17153, 1, 1, 1, 1, 1,
-0.2181316, 0.6854395, -0.02198274, 1, 1, 1, 1, 1,
-0.2098164, 0.0713787, -2.146233, 1, 1, 1, 1, 1,
-0.2096264, 1.509032, -2.341568, 1, 1, 1, 1, 1,
-0.208184, -1.348506, -4.511352, 1, 1, 1, 1, 1,
-0.2061034, 0.7302257, 0.8300966, 1, 1, 1, 1, 1,
-0.1932747, 0.8292759, -1.382798, 1, 1, 1, 1, 1,
-0.1884478, -1.17857, -2.864051, 1, 1, 1, 1, 1,
-0.1848481, -1.18817, -2.581553, 1, 1, 1, 1, 1,
-0.1836523, -0.9779407, -1.577351, 1, 1, 1, 1, 1,
-0.181648, -1.519902, -4.076508, 1, 1, 1, 1, 1,
-0.1799434, 0.7454349, -1.420784, 1, 1, 1, 1, 1,
-0.1793246, 0.4474761, 0.5620398, 1, 1, 1, 1, 1,
-0.1791674, 0.9133153, 1.484056, 1, 1, 1, 1, 1,
-0.1769024, -1.841112, -2.916765, 1, 1, 1, 1, 1,
-0.1735081, 0.02511518, -1.649143, 0, 0, 1, 1, 1,
-0.1719398, -0.6348068, -2.664483, 1, 0, 0, 1, 1,
-0.1707358, 0.4307803, -1.473936, 1, 0, 0, 1, 1,
-0.1661238, 0.9362918, 0.3703445, 1, 0, 0, 1, 1,
-0.1642868, -0.417582, -4.507539, 1, 0, 0, 1, 1,
-0.1616782, -0.364942, -2.774018, 1, 0, 0, 1, 1,
-0.1600112, -2.330317, -3.006027, 0, 0, 0, 1, 1,
-0.1583966, 1.175592, 0.2603909, 0, 0, 0, 1, 1,
-0.1553748, -0.7144498, -2.604392, 0, 0, 0, 1, 1,
-0.1505272, -0.7653336, -2.16388, 0, 0, 0, 1, 1,
-0.1479507, -1.128574, -2.875318, 0, 0, 0, 1, 1,
-0.1468081, 0.4921449, -0.6103283, 0, 0, 0, 1, 1,
-0.1450411, -1.261385, -3.647418, 0, 0, 0, 1, 1,
-0.13775, 1.210171, -1.094956, 1, 1, 1, 1, 1,
-0.1373318, 0.3337909, -1.573146, 1, 1, 1, 1, 1,
-0.1313626, 0.07490703, -0.7033993, 1, 1, 1, 1, 1,
-0.1313567, -0.4120913, -2.267863, 1, 1, 1, 1, 1,
-0.129007, 0.05460243, -1.133106, 1, 1, 1, 1, 1,
-0.1163138, 1.070665, -0.8589877, 1, 1, 1, 1, 1,
-0.1153515, 2.028893, -0.3373384, 1, 1, 1, 1, 1,
-0.1134147, 1.847769, 0.4275332, 1, 1, 1, 1, 1,
-0.1124606, 0.05901842, -1.187836, 1, 1, 1, 1, 1,
-0.1124368, -0.4760186, -1.784668, 1, 1, 1, 1, 1,
-0.110395, 1.073876, 0.3820678, 1, 1, 1, 1, 1,
-0.1092888, 0.8472517, 0.05143997, 1, 1, 1, 1, 1,
-0.1051261, 1.175076, -1.26642, 1, 1, 1, 1, 1,
-0.1050966, 0.1557024, -0.9676339, 1, 1, 1, 1, 1,
-0.1042701, 0.9623881, -2.56885, 1, 1, 1, 1, 1,
-0.09746014, -0.786447, -4.398395, 0, 0, 1, 1, 1,
-0.09707669, -1.365627, -3.454964, 1, 0, 0, 1, 1,
-0.09624548, 0.7165521, -1.999519, 1, 0, 0, 1, 1,
-0.09468636, -0.1071516, -2.706552, 1, 0, 0, 1, 1,
-0.09450852, -1.13578, -3.828987, 1, 0, 0, 1, 1,
-0.09191476, -1.817194, -4.557813, 1, 0, 0, 1, 1,
-0.09044185, 0.3742127, -0.5631593, 0, 0, 0, 1, 1,
-0.08834474, 0.1958743, -0.4140194, 0, 0, 0, 1, 1,
-0.08534008, -0.713835, -4.443295, 0, 0, 0, 1, 1,
-0.08455072, -0.3758482, -3.21263, 0, 0, 0, 1, 1,
-0.08292949, -0.4509006, -3.832729, 0, 0, 0, 1, 1,
-0.07965957, 0.6985625, 0.2046465, 0, 0, 0, 1, 1,
-0.07810813, -2.657848, -1.440973, 0, 0, 0, 1, 1,
-0.07634286, 0.067334, -0.02622624, 1, 1, 1, 1, 1,
-0.07579637, -0.02377646, -3.027163, 1, 1, 1, 1, 1,
-0.07548018, -0.9028089, -4.817264, 1, 1, 1, 1, 1,
-0.07542159, 0.6375138, 1.140456, 1, 1, 1, 1, 1,
-0.07296262, -1.092661, -2.496819, 1, 1, 1, 1, 1,
-0.07020653, -0.7268363, -1.10893, 1, 1, 1, 1, 1,
-0.07017723, 0.03104563, -1.019786, 1, 1, 1, 1, 1,
-0.06450371, 0.5071515, -1.125265, 1, 1, 1, 1, 1,
-0.06448321, -1.410905, -3.775248, 1, 1, 1, 1, 1,
-0.06398295, 0.8900042, 0.8197342, 1, 1, 1, 1, 1,
-0.06355722, -1.235892, -4.246135, 1, 1, 1, 1, 1,
-0.05969217, 0.05693347, 1.321651, 1, 1, 1, 1, 1,
-0.05883003, -0.1384516, -2.268941, 1, 1, 1, 1, 1,
-0.0557778, -1.45334, -3.0645, 1, 1, 1, 1, 1,
-0.04852317, -0.9692727, -3.635721, 1, 1, 1, 1, 1,
-0.0484302, 0.8460673, 0.2592621, 0, 0, 1, 1, 1,
-0.04519167, 1.323342, -1.780457, 1, 0, 0, 1, 1,
-0.04210827, 0.4543093, 0.1909454, 1, 0, 0, 1, 1,
-0.03962134, 0.9552113, -1.105991, 1, 0, 0, 1, 1,
-0.03923225, 0.913412, 0.1882884, 1, 0, 0, 1, 1,
-0.03879004, -0.3541966, -3.159516, 1, 0, 0, 1, 1,
-0.03385742, 1.168452, -0.03865852, 0, 0, 0, 1, 1,
-0.0216287, -1.836988, -3.424821, 0, 0, 0, 1, 1,
-0.02119242, -0.4239245, -2.652315, 0, 0, 0, 1, 1,
-0.01214524, 1.65898, 0.9024773, 0, 0, 0, 1, 1,
-0.008757242, 0.2101853, -2.034579, 0, 0, 0, 1, 1,
-0.00856898, -0.1987623, -3.02447, 0, 0, 0, 1, 1,
-0.006390256, 1.570622, -0.08282516, 0, 0, 0, 1, 1,
-0.003131326, 1.08564, 0.8281921, 1, 1, 1, 1, 1,
-0.003002404, -0.843982, -2.825266, 1, 1, 1, 1, 1,
0.003580761, -0.054819, 5.056643, 1, 1, 1, 1, 1,
0.004600104, 0.4955121, 1.068648, 1, 1, 1, 1, 1,
0.005105267, -0.1758866, 2.209354, 1, 1, 1, 1, 1,
0.005928331, 0.1665801, 0.7714864, 1, 1, 1, 1, 1,
0.007181325, -1.050925, 3.542787, 1, 1, 1, 1, 1,
0.007330381, 0.8334979, -1.514398, 1, 1, 1, 1, 1,
0.009253666, -0.3526265, 2.919108, 1, 1, 1, 1, 1,
0.01359668, -0.141837, 3.510979, 1, 1, 1, 1, 1,
0.01561129, -1.32879, 3.717713, 1, 1, 1, 1, 1,
0.01568425, 0.9828075, 2.036772, 1, 1, 1, 1, 1,
0.01688027, 1.535516, -0.9120021, 1, 1, 1, 1, 1,
0.01781254, 0.7207843, -0.5844426, 1, 1, 1, 1, 1,
0.02062179, 1.243169, -0.9954901, 1, 1, 1, 1, 1,
0.02307718, 0.6824619, 0.2042099, 0, 0, 1, 1, 1,
0.02778165, -0.3157316, 4.405341, 1, 0, 0, 1, 1,
0.03372547, -0.3364496, 2.764436, 1, 0, 0, 1, 1,
0.03525735, -0.938888, 2.661226, 1, 0, 0, 1, 1,
0.03911909, -1.395534, 3.311418, 1, 0, 0, 1, 1,
0.03936244, 1.177194, 1.587618, 1, 0, 0, 1, 1,
0.04059158, -0.2922101, 2.099261, 0, 0, 0, 1, 1,
0.04099304, -2.052988, 3.792797, 0, 0, 0, 1, 1,
0.04147166, 0.3390672, -0.440587, 0, 0, 0, 1, 1,
0.04849472, -0.3783834, 2.666508, 0, 0, 0, 1, 1,
0.0495613, 0.03000183, 2.552263, 0, 0, 0, 1, 1,
0.05015192, 1.170865, -0.9651461, 0, 0, 0, 1, 1,
0.05063508, -0.6372751, 4.564997, 0, 0, 0, 1, 1,
0.05264396, -1.149129, 4.14557, 1, 1, 1, 1, 1,
0.05487347, -2.98059, 3.206138, 1, 1, 1, 1, 1,
0.0566079, -1.142384, 4.238046, 1, 1, 1, 1, 1,
0.05765564, 0.08365577, 0.6239793, 1, 1, 1, 1, 1,
0.06273524, 0.7327121, -0.9106861, 1, 1, 1, 1, 1,
0.06396879, -1.122517, 2.004477, 1, 1, 1, 1, 1,
0.06684401, 0.2107121, 1.917872, 1, 1, 1, 1, 1,
0.07766925, 0.7845882, -0.3820588, 1, 1, 1, 1, 1,
0.07777981, -0.5603864, 2.244568, 1, 1, 1, 1, 1,
0.07930584, 1.83891, 2.307358, 1, 1, 1, 1, 1,
0.0832288, -0.2703237, 3.5157, 1, 1, 1, 1, 1,
0.08619928, -0.8682067, 3.259006, 1, 1, 1, 1, 1,
0.09122279, -0.3283591, 2.927836, 1, 1, 1, 1, 1,
0.09400571, 0.9924835, 1.387613, 1, 1, 1, 1, 1,
0.09496259, -1.419148, 2.64172, 1, 1, 1, 1, 1,
0.09638362, -0.0750903, 1.759922, 0, 0, 1, 1, 1,
0.09700113, 0.9883663, -2.331716, 1, 0, 0, 1, 1,
0.09756503, 0.1170092, 1.324976, 1, 0, 0, 1, 1,
0.098752, -0.2977244, 2.549324, 1, 0, 0, 1, 1,
0.1017314, -0.3258484, 1.496725, 1, 0, 0, 1, 1,
0.1045985, -0.7674676, 2.478072, 1, 0, 0, 1, 1,
0.1075713, 0.5373284, -0.02972721, 0, 0, 0, 1, 1,
0.1113569, 0.09364791, 2.754471, 0, 0, 0, 1, 1,
0.1132704, 1.222422, 0.7962348, 0, 0, 0, 1, 1,
0.1137394, 1.49645, -0.1041123, 0, 0, 0, 1, 1,
0.115949, 0.9770756, -0.2200138, 0, 0, 0, 1, 1,
0.1165026, -2.009064, 5.074834, 0, 0, 0, 1, 1,
0.1172024, 0.1560268, 1.262362, 0, 0, 0, 1, 1,
0.1178292, 0.7917429, -1.089242, 1, 1, 1, 1, 1,
0.1205123, -0.876506, 3.815354, 1, 1, 1, 1, 1,
0.1307656, -0.5220008, 4.08431, 1, 1, 1, 1, 1,
0.1311057, -0.9639146, 2.046523, 1, 1, 1, 1, 1,
0.1324693, -1.797196, 1.410494, 1, 1, 1, 1, 1,
0.1346768, 1.175209, -0.09732336, 1, 1, 1, 1, 1,
0.1364849, -0.5790387, 2.002742, 1, 1, 1, 1, 1,
0.1424939, -1.349362, 1.830188, 1, 1, 1, 1, 1,
0.1464459, 0.3868096, -0.3170342, 1, 1, 1, 1, 1,
0.1479894, -1.595563, 3.73259, 1, 1, 1, 1, 1,
0.1516653, -0.3901156, 3.460297, 1, 1, 1, 1, 1,
0.1531359, -1.042528, 1.696245, 1, 1, 1, 1, 1,
0.1559075, -1.934766, 3.486315, 1, 1, 1, 1, 1,
0.1570007, 0.818224, 0.4505761, 1, 1, 1, 1, 1,
0.1573828, -1.587665, 3.512738, 1, 1, 1, 1, 1,
0.1577953, -0.07754458, 3.409317, 0, 0, 1, 1, 1,
0.1587968, -1.479337, 1.83548, 1, 0, 0, 1, 1,
0.1592509, -1.978635, 4.904365, 1, 0, 0, 1, 1,
0.1593295, -0.9286546, 3.383558, 1, 0, 0, 1, 1,
0.162644, 1.281439, -0.8464895, 1, 0, 0, 1, 1,
0.166283, -0.7488579, 5.317781, 1, 0, 0, 1, 1,
0.1711186, -0.03855424, 1.803974, 0, 0, 0, 1, 1,
0.1722082, -1.558998, 2.10314, 0, 0, 0, 1, 1,
0.1728711, 0.7954565, 0.5183178, 0, 0, 0, 1, 1,
0.1766503, -0.09324364, 1.651516, 0, 0, 0, 1, 1,
0.1766763, 0.9708483, -0.5473844, 0, 0, 0, 1, 1,
0.1803931, -0.2582066, 2.717191, 0, 0, 0, 1, 1,
0.1818472, 0.6046027, -1.054102, 0, 0, 0, 1, 1,
0.1841305, -0.6009971, 2.857496, 1, 1, 1, 1, 1,
0.1864044, -0.04699702, 0.626272, 1, 1, 1, 1, 1,
0.1953246, -0.09630182, 2.798455, 1, 1, 1, 1, 1,
0.195337, -0.2331006, 4.325381, 1, 1, 1, 1, 1,
0.1968856, -0.9729553, 2.934656, 1, 1, 1, 1, 1,
0.1980135, 0.6840454, 0.2347898, 1, 1, 1, 1, 1,
0.1992109, 0.1815174, 0.6261742, 1, 1, 1, 1, 1,
0.2003459, 1.468521, 0.1482276, 1, 1, 1, 1, 1,
0.2064384, 1.180644, -1.172516, 1, 1, 1, 1, 1,
0.2094461, 0.4901303, -0.4128191, 1, 1, 1, 1, 1,
0.2121437, 0.3087747, -0.1088317, 1, 1, 1, 1, 1,
0.2156535, -0.5981489, 2.999113, 1, 1, 1, 1, 1,
0.2187844, 0.2861804, 0.8657005, 1, 1, 1, 1, 1,
0.2199199, 2.786871, -1.137046, 1, 1, 1, 1, 1,
0.2206575, -0.1621763, 2.394674, 1, 1, 1, 1, 1,
0.2214197, 0.6794334, 2.091539, 0, 0, 1, 1, 1,
0.23054, 0.9412251, 0.2710359, 1, 0, 0, 1, 1,
0.2417322, -0.6264775, 2.796262, 1, 0, 0, 1, 1,
0.2419707, 1.369331, -1.265538, 1, 0, 0, 1, 1,
0.2434921, 0.2565076, 1.807853, 1, 0, 0, 1, 1,
0.2454069, 0.2120915, -1.048058, 1, 0, 0, 1, 1,
0.2473902, -0.05429832, 3.761041, 0, 0, 0, 1, 1,
0.2508271, -0.07882124, 0.692668, 0, 0, 0, 1, 1,
0.2532271, -1.227977, 3.32919, 0, 0, 0, 1, 1,
0.2535284, 0.512665, 1.718347, 0, 0, 0, 1, 1,
0.25385, 2.104717, 0.948086, 0, 0, 0, 1, 1,
0.2559178, 0.8041051, 0.9419153, 0, 0, 0, 1, 1,
0.2575628, -3.481247, 2.677413, 0, 0, 0, 1, 1,
0.2578261, -0.7596003, 3.07305, 1, 1, 1, 1, 1,
0.2601981, 0.3579263, 0.6758447, 1, 1, 1, 1, 1,
0.2606955, -1.727177, 2.54752, 1, 1, 1, 1, 1,
0.2623334, -0.05853608, 2.659071, 1, 1, 1, 1, 1,
0.264076, -1.666216, 3.095619, 1, 1, 1, 1, 1,
0.2647595, -0.2227111, 2.394992, 1, 1, 1, 1, 1,
0.2685218, 0.1254895, 3.064564, 1, 1, 1, 1, 1,
0.272101, -0.03662918, 1.938119, 1, 1, 1, 1, 1,
0.2783911, 1.184254, 0.01875805, 1, 1, 1, 1, 1,
0.2795321, -0.5889812, 3.732743, 1, 1, 1, 1, 1,
0.2816316, -0.1202078, 1.958551, 1, 1, 1, 1, 1,
0.2859365, 3.56511, 1.314901, 1, 1, 1, 1, 1,
0.2904599, 0.5363811, -0.8580176, 1, 1, 1, 1, 1,
0.2931423, -2.115475, 2.232525, 1, 1, 1, 1, 1,
0.297855, 0.8746979, 0.8947044, 1, 1, 1, 1, 1,
0.2996868, -1.496689, 4.048418, 0, 0, 1, 1, 1,
0.3069013, 0.9356856, 0.4671077, 1, 0, 0, 1, 1,
0.3071085, 1.375309, -0.8754718, 1, 0, 0, 1, 1,
0.3131517, -2.570527, 2.537194, 1, 0, 0, 1, 1,
0.3150398, 1.617312, 0.5289755, 1, 0, 0, 1, 1,
0.333138, -0.3908751, 3.582918, 1, 0, 0, 1, 1,
0.3367311, 3.245409, -0.7963361, 0, 0, 0, 1, 1,
0.3437603, -0.2211728, 1.625805, 0, 0, 0, 1, 1,
0.3521939, 0.7900438, -2.329989, 0, 0, 0, 1, 1,
0.3590411, 0.7427045, 1.60513, 0, 0, 0, 1, 1,
0.3624773, -0.4752076, 2.314011, 0, 0, 0, 1, 1,
0.3651439, 1.70796, 0.009796005, 0, 0, 0, 1, 1,
0.3696884, 0.1449234, 0.7595369, 0, 0, 0, 1, 1,
0.3730976, -1.276768, 2.907314, 1, 1, 1, 1, 1,
0.3769872, -0.7036335, 3.180894, 1, 1, 1, 1, 1,
0.3792155, 0.9866022, 1.741339, 1, 1, 1, 1, 1,
0.380494, -0.5878508, 2.57006, 1, 1, 1, 1, 1,
0.3827403, 0.6664799, 1.30198, 1, 1, 1, 1, 1,
0.3841267, 1.048394, -0.09210002, 1, 1, 1, 1, 1,
0.3885785, -0.843977, 4.508207, 1, 1, 1, 1, 1,
0.3950199, -0.4754787, 2.764587, 1, 1, 1, 1, 1,
0.3979027, -0.5464511, 1.71576, 1, 1, 1, 1, 1,
0.3995759, 0.2403033, -0.4894746, 1, 1, 1, 1, 1,
0.4006966, -0.8928701, 1.537895, 1, 1, 1, 1, 1,
0.4012748, 0.4666157, 1.259271, 1, 1, 1, 1, 1,
0.4023176, 0.5385302, 1.261687, 1, 1, 1, 1, 1,
0.404029, -1.536053, 2.550853, 1, 1, 1, 1, 1,
0.4066752, -0.09008408, 1.753565, 1, 1, 1, 1, 1,
0.4067697, -0.02392215, 2.47694, 0, 0, 1, 1, 1,
0.4071321, 0.5813544, 0.1136824, 1, 0, 0, 1, 1,
0.4084716, -0.05245, -0.317199, 1, 0, 0, 1, 1,
0.4085828, 1.191012, 0.173977, 1, 0, 0, 1, 1,
0.4095192, -0.2417968, 2.528001, 1, 0, 0, 1, 1,
0.4148222, 1.181646, 0.2293206, 1, 0, 0, 1, 1,
0.4156106, -0.5693824, 2.61338, 0, 0, 0, 1, 1,
0.4200743, 0.1666028, 0.4590197, 0, 0, 0, 1, 1,
0.425108, -0.7223678, 1.428105, 0, 0, 0, 1, 1,
0.4296588, -0.7445149, 1.942787, 0, 0, 0, 1, 1,
0.4307495, -0.8944188, 2.411569, 0, 0, 0, 1, 1,
0.4311196, 1.013258, 0.5794661, 0, 0, 0, 1, 1,
0.4315767, 0.763259, 0.08886892, 0, 0, 0, 1, 1,
0.4358005, -1.2712, 2.693983, 1, 1, 1, 1, 1,
0.4389775, -0.3167412, 1.249999, 1, 1, 1, 1, 1,
0.4398148, -0.7641795, 2.523222, 1, 1, 1, 1, 1,
0.4439034, -1.682622, 4.045362, 1, 1, 1, 1, 1,
0.444759, 0.4324017, 0.06493435, 1, 1, 1, 1, 1,
0.4455085, -0.1886749, 0.7607367, 1, 1, 1, 1, 1,
0.4462686, 0.1638359, 2.805992, 1, 1, 1, 1, 1,
0.4580941, -1.199329, 2.607494, 1, 1, 1, 1, 1,
0.4631809, -0.5441492, 1.551668, 1, 1, 1, 1, 1,
0.4646761, 0.2945296, 0.7286488, 1, 1, 1, 1, 1,
0.465584, -0.7822332, 4.062789, 1, 1, 1, 1, 1,
0.4657983, 1.334755, 0.3567267, 1, 1, 1, 1, 1,
0.4686701, -1.913678, 4.07147, 1, 1, 1, 1, 1,
0.4709278, -0.8055998, 2.204624, 1, 1, 1, 1, 1,
0.4713002, -0.1304742, 0.7868866, 1, 1, 1, 1, 1,
0.4717264, -0.6989599, 2.757045, 0, 0, 1, 1, 1,
0.479638, -0.9520615, 3.6183, 1, 0, 0, 1, 1,
0.4806263, -0.4830357, 1.555173, 1, 0, 0, 1, 1,
0.4807999, 1.380318, 0.4227092, 1, 0, 0, 1, 1,
0.4828313, 0.5332512, -0.9618515, 1, 0, 0, 1, 1,
0.4860696, -0.2474099, 2.0578, 1, 0, 0, 1, 1,
0.4867068, -0.7425601, 2.368886, 0, 0, 0, 1, 1,
0.4878731, -0.4427057, 0.4729843, 0, 0, 0, 1, 1,
0.4884056, -0.5690331, 3.954319, 0, 0, 0, 1, 1,
0.4939159, 0.1820638, 1.64934, 0, 0, 0, 1, 1,
0.4947334, 1.035733, 0.8103902, 0, 0, 0, 1, 1,
0.4947806, 1.613711, 0.3006301, 0, 0, 0, 1, 1,
0.4981411, 1.424303, 2.155927, 0, 0, 0, 1, 1,
0.5007603, 0.4280194, 0.6757973, 1, 1, 1, 1, 1,
0.5050824, 0.7301756, 0.6159149, 1, 1, 1, 1, 1,
0.5096326, -0.297438, 2.095349, 1, 1, 1, 1, 1,
0.5099162, 0.5154392, 1.405772, 1, 1, 1, 1, 1,
0.5164033, 0.1915714, -0.1525548, 1, 1, 1, 1, 1,
0.5178439, 2.079547, -0.5410767, 1, 1, 1, 1, 1,
0.5207785, 0.8772134, 0.7116011, 1, 1, 1, 1, 1,
0.526355, 1.959236, 0.05413888, 1, 1, 1, 1, 1,
0.5308262, 0.8816947, 0.3966505, 1, 1, 1, 1, 1,
0.5328494, 0.3001427, -1.093669, 1, 1, 1, 1, 1,
0.5331709, -0.9799891, 4.000527, 1, 1, 1, 1, 1,
0.5333342, -0.5304148, 2.949565, 1, 1, 1, 1, 1,
0.533452, 0.6710109, 1.651547, 1, 1, 1, 1, 1,
0.534007, -1.194005, 1.624051, 1, 1, 1, 1, 1,
0.5419694, 1.493984, 0.9500458, 1, 1, 1, 1, 1,
0.5425599, 0.1263728, 1.31307, 0, 0, 1, 1, 1,
0.543808, 0.3559612, -0.2945767, 1, 0, 0, 1, 1,
0.5442295, -0.317295, 2.135292, 1, 0, 0, 1, 1,
0.5455508, -0.3614716, 2.498554, 1, 0, 0, 1, 1,
0.5477424, -0.2968324, 1.38942, 1, 0, 0, 1, 1,
0.5499316, -0.7056323, 3.407959, 1, 0, 0, 1, 1,
0.5517427, -0.3098578, 1.700907, 0, 0, 0, 1, 1,
0.5589786, 1.135783, 0.3964068, 0, 0, 0, 1, 1,
0.5592884, 0.4219605, 1.505636, 0, 0, 0, 1, 1,
0.5605134, 0.2704084, 2.213154, 0, 0, 0, 1, 1,
0.5609366, 1.212929, 0.9674811, 0, 0, 0, 1, 1,
0.5630831, -1.226045, 4.171452, 0, 0, 0, 1, 1,
0.5715239, 0.3833102, 0.4476551, 0, 0, 0, 1, 1,
0.5747655, 0.2027313, 0.6882246, 1, 1, 1, 1, 1,
0.5777337, -0.8390496, 1.461969, 1, 1, 1, 1, 1,
0.5813056, -0.9462768, 3.131432, 1, 1, 1, 1, 1,
0.5856044, -1.824288, 3.347625, 1, 1, 1, 1, 1,
0.5862194, -0.1337352, 0.9175385, 1, 1, 1, 1, 1,
0.5867413, -1.734173, 2.045187, 1, 1, 1, 1, 1,
0.5875797, -0.6746573, 3.929753, 1, 1, 1, 1, 1,
0.5875974, 1.898279, -0.09089467, 1, 1, 1, 1, 1,
0.5879753, -0.6756852, 2.637514, 1, 1, 1, 1, 1,
0.5903499, 0.2490942, 1.042217, 1, 1, 1, 1, 1,
0.5905563, 0.4607394, 1.206961, 1, 1, 1, 1, 1,
0.59061, -0.4430151, 1.123498, 1, 1, 1, 1, 1,
0.5989294, -0.3045553, 2.073494, 1, 1, 1, 1, 1,
0.6018518, -0.5238473, 3.417312, 1, 1, 1, 1, 1,
0.6057454, 1.182556, 2.762368, 1, 1, 1, 1, 1,
0.6143527, -0.5728254, 1.282702, 0, 0, 1, 1, 1,
0.6168848, 1.211378, 0.7051036, 1, 0, 0, 1, 1,
0.6173467, 0.5572487, 0.1405998, 1, 0, 0, 1, 1,
0.6175705, -1.120914, 2.064802, 1, 0, 0, 1, 1,
0.6184286, 0.02844155, 1.403551, 1, 0, 0, 1, 1,
0.6206576, -0.2705155, 4.188241, 1, 0, 0, 1, 1,
0.6236659, -0.4178821, 3.052032, 0, 0, 0, 1, 1,
0.6238438, -0.7043888, 2.003188, 0, 0, 0, 1, 1,
0.6254687, 1.336875, -0.1748415, 0, 0, 0, 1, 1,
0.6278076, 0.2136388, 0.4246561, 0, 0, 0, 1, 1,
0.6392768, 0.0220251, 1.56561, 0, 0, 0, 1, 1,
0.6399009, -1.473758, 2.555716, 0, 0, 0, 1, 1,
0.6402745, -1.470222, 0.7542357, 0, 0, 0, 1, 1,
0.6407471, -2.84764, 1.49419, 1, 1, 1, 1, 1,
0.6412672, -1.524057, 2.419136, 1, 1, 1, 1, 1,
0.64294, 0.8832446, -0.2635143, 1, 1, 1, 1, 1,
0.6462966, 0.7017916, 0.1104868, 1, 1, 1, 1, 1,
0.6483394, 0.3950251, 0.8702148, 1, 1, 1, 1, 1,
0.6505437, -0.318021, 2.131249, 1, 1, 1, 1, 1,
0.6525229, 0.6118168, 1.652185, 1, 1, 1, 1, 1,
0.6561415, 0.785272, 1.643623, 1, 1, 1, 1, 1,
0.6584407, 0.2073469, 1.933619, 1, 1, 1, 1, 1,
0.6711761, -0.1182446, 1.688053, 1, 1, 1, 1, 1,
0.6727557, -0.4605855, 1.48333, 1, 1, 1, 1, 1,
0.6731598, -1.148503, 3.118027, 1, 1, 1, 1, 1,
0.6778645, 0.7645946, -0.4985121, 1, 1, 1, 1, 1,
0.6839215, 2.331991, 0.3136449, 1, 1, 1, 1, 1,
0.6845073, 0.8263209, 1.076947, 1, 1, 1, 1, 1,
0.6861627, 0.8647634, 1.581785, 0, 0, 1, 1, 1,
0.6865938, 0.5543438, 1.567485, 1, 0, 0, 1, 1,
0.6876642, -1.14085, 1.050209, 1, 0, 0, 1, 1,
0.6878133, -0.1787476, 3.461593, 1, 0, 0, 1, 1,
0.6899968, -1.448581, 2.06408, 1, 0, 0, 1, 1,
0.6909447, 0.2823624, 2.488426, 1, 0, 0, 1, 1,
0.6967688, -0.1220905, 1.823298, 0, 0, 0, 1, 1,
0.6980122, -1.324468, 2.82673, 0, 0, 0, 1, 1,
0.6997092, 0.7624421, 1.254069, 0, 0, 0, 1, 1,
0.7014139, 0.09937588, -0.1298125, 0, 0, 0, 1, 1,
0.7081935, -0.8944341, 3.10869, 0, 0, 0, 1, 1,
0.7120424, 0.008105132, 1.920579, 0, 0, 0, 1, 1,
0.7164061, -0.03610145, 2.154158, 0, 0, 0, 1, 1,
0.7166521, 1.526534, -0.3938082, 1, 1, 1, 1, 1,
0.7311906, 3.690108, 1.539969, 1, 1, 1, 1, 1,
0.7362361, -0.01706624, 1.36398, 1, 1, 1, 1, 1,
0.7363946, -0.3606477, 2.14344, 1, 1, 1, 1, 1,
0.7436416, -0.8219909, 2.648844, 1, 1, 1, 1, 1,
0.7476558, 0.3504448, 1.24449, 1, 1, 1, 1, 1,
0.7497169, -0.2069667, 1.884405, 1, 1, 1, 1, 1,
0.7515184, -0.6557589, 2.891497, 1, 1, 1, 1, 1,
0.7559116, -1.97798, 2.648411, 1, 1, 1, 1, 1,
0.7585391, 2.10992, 0.1336925, 1, 1, 1, 1, 1,
0.7596486, -0.8051299, 2.037172, 1, 1, 1, 1, 1,
0.7611532, -0.7998385, 2.011188, 1, 1, 1, 1, 1,
0.7695567, 1.085161, 0.239288, 1, 1, 1, 1, 1,
0.7746325, -0.4094773, 1.499138, 1, 1, 1, 1, 1,
0.7882192, -1.010488, 3.22755, 1, 1, 1, 1, 1,
0.7920209, -0.2363233, 2.290771, 0, 0, 1, 1, 1,
0.7993143, -0.7782173, 3.155366, 1, 0, 0, 1, 1,
0.8015901, 0.3413848, 2.028795, 1, 0, 0, 1, 1,
0.8023849, -0.758057, 2.212874, 1, 0, 0, 1, 1,
0.8038897, -1.824754, 2.041584, 1, 0, 0, 1, 1,
0.8048896, -0.05967065, 0.4401808, 1, 0, 0, 1, 1,
0.808001, -0.8706873, 3.209805, 0, 0, 0, 1, 1,
0.8085082, -0.8076892, 0.6907733, 0, 0, 0, 1, 1,
0.813862, -0.2083713, 2.326385, 0, 0, 0, 1, 1,
0.8174066, 1.253593, 0.4592347, 0, 0, 0, 1, 1,
0.8213989, 1.39076, 2.028757, 0, 0, 0, 1, 1,
0.825963, 0.9644634, 2.158818, 0, 0, 0, 1, 1,
0.8374695, -1.090479, 2.04802, 0, 0, 0, 1, 1,
0.8424434, -0.5973594, 2.805536, 1, 1, 1, 1, 1,
0.8588531, 1.800368, -0.02101898, 1, 1, 1, 1, 1,
0.8595722, 1.092055, -0.5136535, 1, 1, 1, 1, 1,
0.8604631, -2.562449, 2.616818, 1, 1, 1, 1, 1,
0.8609912, -0.08961909, 2.568372, 1, 1, 1, 1, 1,
0.8613111, 0.2838696, 2.142072, 1, 1, 1, 1, 1,
0.864399, -0.1975587, -1.16786, 1, 1, 1, 1, 1,
0.8687044, -1.307542, 2.08178, 1, 1, 1, 1, 1,
0.8710172, -0.1133134, 1.198704, 1, 1, 1, 1, 1,
0.8766207, 0.6328793, 0.5172451, 1, 1, 1, 1, 1,
0.8768173, 0.3863162, 1.646711, 1, 1, 1, 1, 1,
0.8807119, 0.8052386, 2.001132, 1, 1, 1, 1, 1,
0.8855064, -1.268782, 0.8304634, 1, 1, 1, 1, 1,
0.8886405, 0.8732473, 1.148383, 1, 1, 1, 1, 1,
0.8950942, 0.6284862, 0.477826, 1, 1, 1, 1, 1,
0.8956364, 0.06108304, 0.9682522, 0, 0, 1, 1, 1,
0.896279, 0.2303551, 1.398255, 1, 0, 0, 1, 1,
0.9075403, -1.206537, 3.953159, 1, 0, 0, 1, 1,
0.9186907, 0.3525763, 2.073629, 1, 0, 0, 1, 1,
0.9211153, 0.1491959, 1.91497, 1, 0, 0, 1, 1,
0.9264489, 0.2374862, 1.466843, 1, 0, 0, 1, 1,
0.9264742, -0.7657996, 1.410478, 0, 0, 0, 1, 1,
0.9278215, -1.964864, 2.362212, 0, 0, 0, 1, 1,
0.9292043, -0.08516676, 2.016179, 0, 0, 0, 1, 1,
0.9355047, 1.253342, 0.430471, 0, 0, 0, 1, 1,
0.9412485, -0.6021577, 2.195547, 0, 0, 0, 1, 1,
0.945262, -0.1891855, 1.770722, 0, 0, 0, 1, 1,
0.9511206, 0.8802127, 2.106785, 0, 0, 0, 1, 1,
0.9541674, -0.3443781, -0.2253984, 1, 1, 1, 1, 1,
0.9682888, -0.4014535, 2.068191, 1, 1, 1, 1, 1,
0.9688757, -0.8193471, 3.472654, 1, 1, 1, 1, 1,
0.9698916, 0.3846564, 0.8167207, 1, 1, 1, 1, 1,
0.9716259, 1.617993, -1.294388, 1, 1, 1, 1, 1,
0.9742525, -0.7940338, 2.322706, 1, 1, 1, 1, 1,
0.9788073, 1.53748, 0.0432596, 1, 1, 1, 1, 1,
0.9802387, 1.287254, 1.14094, 1, 1, 1, 1, 1,
0.9807209, 1.225371, -1.21439, 1, 1, 1, 1, 1,
0.9842388, 0.1046118, 1.256441, 1, 1, 1, 1, 1,
0.9865539, -0.6264344, 1.089613, 1, 1, 1, 1, 1,
0.9866906, 1.230574, 0.1579131, 1, 1, 1, 1, 1,
0.9867123, -1.267754, 3.671435, 1, 1, 1, 1, 1,
0.987918, -0.6882318, 1.232208, 1, 1, 1, 1, 1,
0.9914408, 1.079552, 0.2648365, 1, 1, 1, 1, 1,
0.9942534, -0.7761835, 1.929459, 0, 0, 1, 1, 1,
0.9960298, 0.5625156, 0.9970112, 1, 0, 0, 1, 1,
0.9995661, 0.2105613, 0.1590123, 1, 0, 0, 1, 1,
1.003043, -1.040302, 2.309128, 1, 0, 0, 1, 1,
1.013275, -0.7311398, 2.5471, 1, 0, 0, 1, 1,
1.022286, -0.3798006, 1.91853, 1, 0, 0, 1, 1,
1.0253, -0.3642575, 1.582579, 0, 0, 0, 1, 1,
1.02608, 2.688424, 1.182026, 0, 0, 0, 1, 1,
1.027052, -1.315375, 2.064025, 0, 0, 0, 1, 1,
1.029809, -0.07745015, 2.182746, 0, 0, 0, 1, 1,
1.031145, -1.367033, 1.897694, 0, 0, 0, 1, 1,
1.033325, 0.3297143, -0.003692804, 0, 0, 0, 1, 1,
1.03636, 0.3946976, 1.165632, 0, 0, 0, 1, 1,
1.038381, -1.728116, 0.8730773, 1, 1, 1, 1, 1,
1.053308, -1.052218, 2.832378, 1, 1, 1, 1, 1,
1.056967, 0.001173465, 1.947625, 1, 1, 1, 1, 1,
1.059298, -0.9522075, 2.150135, 1, 1, 1, 1, 1,
1.060643, -0.6107492, 2.172948, 1, 1, 1, 1, 1,
1.061162, 0.1101219, 0.2290612, 1, 1, 1, 1, 1,
1.062708, -1.220709, 0.1248237, 1, 1, 1, 1, 1,
1.063123, 1.645016, 1.731543, 1, 1, 1, 1, 1,
1.070415, 0.01935601, 1.971535, 1, 1, 1, 1, 1,
1.081454, -0.5907609, 1.394613, 1, 1, 1, 1, 1,
1.082708, 1.224511, 0.9506486, 1, 1, 1, 1, 1,
1.083472, 0.2336843, 0.7460812, 1, 1, 1, 1, 1,
1.084271, -0.5240748, 2.251236, 1, 1, 1, 1, 1,
1.086144, -0.1156257, 1.562728, 1, 1, 1, 1, 1,
1.088248, 0.596561, -0.3234684, 1, 1, 1, 1, 1,
1.092425, -0.5698506, -0.1027143, 0, 0, 1, 1, 1,
1.097672, 1.010282, 0.4368494, 1, 0, 0, 1, 1,
1.098415, 1.459389, 2.751257, 1, 0, 0, 1, 1,
1.099239, 2.319125, -0.3689443, 1, 0, 0, 1, 1,
1.113341, -1.144259, 2.504212, 1, 0, 0, 1, 1,
1.1188, 0.9767648, 0.3860071, 1, 0, 0, 1, 1,
1.127072, -0.4816079, 1.841053, 0, 0, 0, 1, 1,
1.130786, -0.4314923, 0.9962021, 0, 0, 0, 1, 1,
1.13132, -0.3609683, 1.80941, 0, 0, 0, 1, 1,
1.145437, -0.2543058, 1.053771, 0, 0, 0, 1, 1,
1.15141, 1.051083, 2.019159, 0, 0, 0, 1, 1,
1.152559, 0.2895218, -0.05117772, 0, 0, 0, 1, 1,
1.153767, -1.940351, 2.914374, 0, 0, 0, 1, 1,
1.160614, 0.1074251, -0.05720521, 1, 1, 1, 1, 1,
1.167526, 0.4915322, 2.358812, 1, 1, 1, 1, 1,
1.168819, -0.5997769, 1.813214, 1, 1, 1, 1, 1,
1.170905, -0.5523613, 2.916725, 1, 1, 1, 1, 1,
1.171441, -1.113362, 2.610208, 1, 1, 1, 1, 1,
1.179925, -0.2535863, 0.9009777, 1, 1, 1, 1, 1,
1.184792, 0.8447486, 0.1083005, 1, 1, 1, 1, 1,
1.188635, 0.2058486, 0.614073, 1, 1, 1, 1, 1,
1.189144, -0.6368278, 2.080814, 1, 1, 1, 1, 1,
1.189659, 0.7569547, 0.4409123, 1, 1, 1, 1, 1,
1.196182, -0.3666589, 0.5998567, 1, 1, 1, 1, 1,
1.1968, -1.312593, 2.94534, 1, 1, 1, 1, 1,
1.197135, -1.22554, 1.92965, 1, 1, 1, 1, 1,
1.206612, -0.8059809, 3.004648, 1, 1, 1, 1, 1,
1.20778, -0.261171, 1.833653, 1, 1, 1, 1, 1,
1.209785, 0.7950406, 2.027061, 0, 0, 1, 1, 1,
1.21755, 0.08716781, 2.633865, 1, 0, 0, 1, 1,
1.219867, 0.698355, 0.5561203, 1, 0, 0, 1, 1,
1.225169, 0.4050722, 0.07254318, 1, 0, 0, 1, 1,
1.237553, -0.3948189, 0.7608783, 1, 0, 0, 1, 1,
1.241925, 1.546901, 2.829343, 1, 0, 0, 1, 1,
1.242977, -2.195619, 4.237768, 0, 0, 0, 1, 1,
1.243917, 1.639081, 0.6985655, 0, 0, 0, 1, 1,
1.252966, -0.1527349, 1.603617, 0, 0, 0, 1, 1,
1.257023, -0.4212356, 1.973121, 0, 0, 0, 1, 1,
1.258901, -0.6510578, 1.444121, 0, 0, 0, 1, 1,
1.272554, -1.24507, 3.117014, 0, 0, 0, 1, 1,
1.281725, 0.6562115, 1.192606, 0, 0, 0, 1, 1,
1.283723, 0.2991107, -0.4774902, 1, 1, 1, 1, 1,
1.289913, -0.4976899, 2.142522, 1, 1, 1, 1, 1,
1.29628, 1.406892, 1.465791, 1, 1, 1, 1, 1,
1.30461, -0.3334371, 0.4732112, 1, 1, 1, 1, 1,
1.313281, 0.03181023, 1.6024, 1, 1, 1, 1, 1,
1.315436, -1.869102, 0.7240145, 1, 1, 1, 1, 1,
1.317637, 1.399393, 0.416586, 1, 1, 1, 1, 1,
1.32004, 0.5060586, 2.537323, 1, 1, 1, 1, 1,
1.330957, 1.547637, -1.432657, 1, 1, 1, 1, 1,
1.336429, 0.1307342, -0.2946008, 1, 1, 1, 1, 1,
1.340557, -0.3130691, 1.882346, 1, 1, 1, 1, 1,
1.343588, -0.1424085, 1.720369, 1, 1, 1, 1, 1,
1.351877, 2.556467, 0.1026484, 1, 1, 1, 1, 1,
1.353701, -0.1870057, 2.633785, 1, 1, 1, 1, 1,
1.35479, -0.7418593, 1.611393, 1, 1, 1, 1, 1,
1.355829, 1.218997, 1.319219, 0, 0, 1, 1, 1,
1.359294, -0.1783268, -0.5135602, 1, 0, 0, 1, 1,
1.359564, -1.301703, 2.329049, 1, 0, 0, 1, 1,
1.40592, -0.4991173, 1.790749, 1, 0, 0, 1, 1,
1.427534, -1.40141, 3.04382, 1, 0, 0, 1, 1,
1.4307, -0.4065003, 0.9019083, 1, 0, 0, 1, 1,
1.434592, 0.1999284, 0.1966083, 0, 0, 0, 1, 1,
1.435471, 1.229199, 0.9135361, 0, 0, 0, 1, 1,
1.451191, 0.6278381, 0.773065, 0, 0, 0, 1, 1,
1.459813, 0.6859059, -0.5146669, 0, 0, 0, 1, 1,
1.461491, 0.9613099, 0.1491584, 0, 0, 0, 1, 1,
1.464506, -0.1628375, 2.339574, 0, 0, 0, 1, 1,
1.467412, 0.8733183, 1.347399, 0, 0, 0, 1, 1,
1.485407, -0.588037, 1.346979, 1, 1, 1, 1, 1,
1.509557, 1.934947, -0.1291588, 1, 1, 1, 1, 1,
1.511267, 1.068677, 0.5926959, 1, 1, 1, 1, 1,
1.519899, -0.3423279, 3.067214, 1, 1, 1, 1, 1,
1.524541, -0.8642359, 2.780011, 1, 1, 1, 1, 1,
1.528108, -0.6641667, 1.768311, 1, 1, 1, 1, 1,
1.528339, -0.1719028, 2.138506, 1, 1, 1, 1, 1,
1.52957, -1.681732, 2.912077, 1, 1, 1, 1, 1,
1.540908, -1.647689, 1.877761, 1, 1, 1, 1, 1,
1.571298, -0.9085639, 3.214086, 1, 1, 1, 1, 1,
1.571597, -1.522054, 2.46124, 1, 1, 1, 1, 1,
1.572075, -1.732804, 4.498457, 1, 1, 1, 1, 1,
1.578747, 1.003701, 0.4128807, 1, 1, 1, 1, 1,
1.584089, 0.9375566, 1.400831, 1, 1, 1, 1, 1,
1.586421, 0.5236511, 0.1756436, 1, 1, 1, 1, 1,
1.588668, 2.295832, 0.7549683, 0, 0, 1, 1, 1,
1.614764, -0.4458054, 1.290477, 1, 0, 0, 1, 1,
1.615106, -0.02754342, 2.742331, 1, 0, 0, 1, 1,
1.616748, 0.2698136, 1.213153, 1, 0, 0, 1, 1,
1.634034, 0.6914554, 1.085149, 1, 0, 0, 1, 1,
1.648369, -0.6765636, 4.369811, 1, 0, 0, 1, 1,
1.654669, -0.5089538, 0.3900547, 0, 0, 0, 1, 1,
1.657786, -0.317079, 2.123385, 0, 0, 0, 1, 1,
1.660203, 1.046995, 2.06876, 0, 0, 0, 1, 1,
1.66243, 0.6276671, 2.17173, 0, 0, 0, 1, 1,
1.669292, 0.6414579, 1.38552, 0, 0, 0, 1, 1,
1.669414, -1.50117, 2.046407, 0, 0, 0, 1, 1,
1.721292, -1.047123, 3.900947, 0, 0, 0, 1, 1,
1.74518, -0.4028141, 1.310496, 1, 1, 1, 1, 1,
1.795359, 0.1071887, 1.958497, 1, 1, 1, 1, 1,
1.807017, 0.6744146, -0.1687135, 1, 1, 1, 1, 1,
1.809061, -0.4224619, 0.6443538, 1, 1, 1, 1, 1,
1.846067, 0.5037025, 0.7174141, 1, 1, 1, 1, 1,
1.870447, 0.6273056, 0.06820755, 1, 1, 1, 1, 1,
1.878974, 1.164333, 1.74119, 1, 1, 1, 1, 1,
1.89279, -0.7145447, 1.78895, 1, 1, 1, 1, 1,
1.924201, 0.6099176, 1.076075, 1, 1, 1, 1, 1,
1.942392, 1.274695, -0.7870436, 1, 1, 1, 1, 1,
1.961014, 0.1135002, 1.810232, 1, 1, 1, 1, 1,
1.968076, -1.781457, 1.441891, 1, 1, 1, 1, 1,
1.988447, 1.024995, -1.193357, 1, 1, 1, 1, 1,
2.019376, 1.479379, 3.14113, 1, 1, 1, 1, 1,
2.020315, 1.7119, -0.7278842, 1, 1, 1, 1, 1,
2.034014, 0.5761529, 3.250682, 0, 0, 1, 1, 1,
2.077056, -0.01339094, 2.19501, 1, 0, 0, 1, 1,
2.102808, 0.2871181, 1.137909, 1, 0, 0, 1, 1,
2.131922, -0.7511297, 2.587321, 1, 0, 0, 1, 1,
2.151044, -1.668525, 1.230278, 1, 0, 0, 1, 1,
2.188331, 0.5161363, 1.313981, 1, 0, 0, 1, 1,
2.19681, -0.1961333, 0.5721452, 0, 0, 0, 1, 1,
2.235794, -0.7311972, 1.936198, 0, 0, 0, 1, 1,
2.239437, -0.8788555, 0.3786104, 0, 0, 0, 1, 1,
2.262296, 0.06979156, 2.8094, 0, 0, 0, 1, 1,
2.267987, -2.129204, -0.438026, 0, 0, 0, 1, 1,
2.378564, 0.01305438, 0.3006541, 0, 0, 0, 1, 1,
2.419483, 0.0346753, 0.5285157, 0, 0, 0, 1, 1,
2.423378, -0.3531717, 3.275367, 1, 1, 1, 1, 1,
2.518517, 1.160223, 2.051523, 1, 1, 1, 1, 1,
2.553066, 1.430632, 1.916494, 1, 1, 1, 1, 1,
2.611884, -0.1164492, 0.4038651, 1, 1, 1, 1, 1,
2.638165, 0.08454244, 1.878839, 1, 1, 1, 1, 1,
2.743754, 0.517121, 0.8642743, 1, 1, 1, 1, 1,
2.775161, -1.414174, 1.892976, 1, 1, 1, 1, 1
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
var radius = 9.590997;
var distance = 33.68797;
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
mvMatrix.translate( 0.1727099, -0.1044307, -0.04017138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68797);
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
