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
-3.688052, -1.519063, -3.349232, 1, 0, 0, 1,
-3.188612, 1.362106, -0.1082705, 1, 0.007843138, 0, 1,
-3.062214, -0.30906, -1.575764, 1, 0.01176471, 0, 1,
-2.749712, 0.7925191, -1.858428, 1, 0.01960784, 0, 1,
-2.69652, -0.2199022, -3.687281, 1, 0.02352941, 0, 1,
-2.671443, -0.1606051, -1.840528, 1, 0.03137255, 0, 1,
-2.658442, 1.194774, -1.460358, 1, 0.03529412, 0, 1,
-2.626447, 0.4994884, -1.240416, 1, 0.04313726, 0, 1,
-2.616807, -0.254009, -3.341833, 1, 0.04705882, 0, 1,
-2.597391, 1.648018, -0.9823416, 1, 0.05490196, 0, 1,
-2.536644, 0.2161449, -2.134289, 1, 0.05882353, 0, 1,
-2.510024, 0.1974225, -1.167387, 1, 0.06666667, 0, 1,
-2.475938, -0.7623408, -1.598502, 1, 0.07058824, 0, 1,
-2.300199, 0.2992754, -2.09728, 1, 0.07843138, 0, 1,
-2.292117, 1.167008, -0.9033374, 1, 0.08235294, 0, 1,
-2.235055, 0.6953388, 0.7191542, 1, 0.09019608, 0, 1,
-2.223394, 0.6775922, -1.283953, 1, 0.09411765, 0, 1,
-2.180568, -1.49783, -2.719791, 1, 0.1019608, 0, 1,
-2.149074, 1.66165, -2.898354, 1, 0.1098039, 0, 1,
-2.104916, 0.6735341, -2.638455, 1, 0.1137255, 0, 1,
-2.104729, -0.6468268, -0.9813598, 1, 0.1215686, 0, 1,
-2.091337, 0.054117, -1.830658, 1, 0.1254902, 0, 1,
-2.090037, 0.05546658, -4.052909, 1, 0.1333333, 0, 1,
-2.0658, -2.44734, -2.719477, 1, 0.1372549, 0, 1,
-2.049922, 0.4790425, -0.9482124, 1, 0.145098, 0, 1,
-2.033031, 0.5352733, -1.595473, 1, 0.1490196, 0, 1,
-2.023265, 0.02390768, -0.9885234, 1, 0.1568628, 0, 1,
-1.946534, 1.407662, -1.764182, 1, 0.1607843, 0, 1,
-1.920436, 0.931444, -0.4383093, 1, 0.1686275, 0, 1,
-1.917306, 0.0950287, -3.627802, 1, 0.172549, 0, 1,
-1.910612, 0.7436787, -1.161138, 1, 0.1803922, 0, 1,
-1.898752, -1.374216, -0.986734, 1, 0.1843137, 0, 1,
-1.898683, 0.3992535, -1.608782, 1, 0.1921569, 0, 1,
-1.871323, 0.8079629, -0.729249, 1, 0.1960784, 0, 1,
-1.854903, 0.1973995, -1.779373, 1, 0.2039216, 0, 1,
-1.837455, 0.6712109, -0.02404118, 1, 0.2117647, 0, 1,
-1.816378, 0.4474662, -0.8724939, 1, 0.2156863, 0, 1,
-1.802332, 0.1294266, -1.210752, 1, 0.2235294, 0, 1,
-1.795979, 1.358087, -1.453348, 1, 0.227451, 0, 1,
-1.775486, 0.4994572, -0.3428319, 1, 0.2352941, 0, 1,
-1.761023, -0.2692262, -3.561695, 1, 0.2392157, 0, 1,
-1.758562, 0.1297234, -2.440317, 1, 0.2470588, 0, 1,
-1.750944, -1.907437, -1.105248, 1, 0.2509804, 0, 1,
-1.728963, -0.674621, -3.885747, 1, 0.2588235, 0, 1,
-1.717706, -1.26525, -0.3393216, 1, 0.2627451, 0, 1,
-1.701623, -0.1528469, -0.9178483, 1, 0.2705882, 0, 1,
-1.69413, 0.09921151, -1.333672, 1, 0.2745098, 0, 1,
-1.679489, 0.6893904, -1.69918, 1, 0.282353, 0, 1,
-1.678874, 0.0902565, -0.4685692, 1, 0.2862745, 0, 1,
-1.675177, -0.3170151, -0.984465, 1, 0.2941177, 0, 1,
-1.639818, 0.8224189, -0.4893785, 1, 0.3019608, 0, 1,
-1.63804, 0.4423926, 0.7419031, 1, 0.3058824, 0, 1,
-1.632197, -0.2653398, -1.857346, 1, 0.3137255, 0, 1,
-1.624017, -0.1256619, -2.377884, 1, 0.3176471, 0, 1,
-1.615311, 0.4002084, -2.091085, 1, 0.3254902, 0, 1,
-1.608611, 0.3044747, -2.363185, 1, 0.3294118, 0, 1,
-1.605437, -1.03041, -3.407401, 1, 0.3372549, 0, 1,
-1.588526, -0.8984417, -1.940347, 1, 0.3411765, 0, 1,
-1.580049, -1.381259, -2.587506, 1, 0.3490196, 0, 1,
-1.57643, 0.1013056, -2.154562, 1, 0.3529412, 0, 1,
-1.562311, -1.109704, -0.3310416, 1, 0.3607843, 0, 1,
-1.55979, 1.025249, 1.085563, 1, 0.3647059, 0, 1,
-1.554937, -0.1189923, -1.611939, 1, 0.372549, 0, 1,
-1.543785, -1.593933, -2.162082, 1, 0.3764706, 0, 1,
-1.536055, 0.4447813, -0.4255877, 1, 0.3843137, 0, 1,
-1.533162, 0.8199653, 0.1190137, 1, 0.3882353, 0, 1,
-1.531374, -0.7598238, -2.158932, 1, 0.3960784, 0, 1,
-1.529866, -1.79995, -1.964234, 1, 0.4039216, 0, 1,
-1.523686, 0.01817401, -2.726238, 1, 0.4078431, 0, 1,
-1.522715, 0.8061929, -0.6259826, 1, 0.4156863, 0, 1,
-1.515921, -0.8286996, -0.5541592, 1, 0.4196078, 0, 1,
-1.515081, -0.03205429, -1.879395, 1, 0.427451, 0, 1,
-1.51031, -0.522895, -3.10426, 1, 0.4313726, 0, 1,
-1.505298, 1.461333, -0.7139027, 1, 0.4392157, 0, 1,
-1.502147, -1.165661, -2.183713, 1, 0.4431373, 0, 1,
-1.498427, 0.558279, -0.8574442, 1, 0.4509804, 0, 1,
-1.496559, -1.368568, -2.100859, 1, 0.454902, 0, 1,
-1.495393, 0.1039246, -1.614287, 1, 0.4627451, 0, 1,
-1.495389, -1.431689, -2.638535, 1, 0.4666667, 0, 1,
-1.485054, -0.1878226, -1.179656, 1, 0.4745098, 0, 1,
-1.482442, 0.8775892, -2.146546, 1, 0.4784314, 0, 1,
-1.46459, 0.2570186, -0.7620274, 1, 0.4862745, 0, 1,
-1.454398, 2.259561, -0.5766535, 1, 0.4901961, 0, 1,
-1.452388, -0.5160062, -3.447286, 1, 0.4980392, 0, 1,
-1.440734, 0.2427436, 0.2067821, 1, 0.5058824, 0, 1,
-1.426782, -1.24071, -1.576458, 1, 0.509804, 0, 1,
-1.426662, 1.502463, -0.2818, 1, 0.5176471, 0, 1,
-1.425483, -1.628126, -1.111938, 1, 0.5215687, 0, 1,
-1.41962, 0.5766996, -1.584271, 1, 0.5294118, 0, 1,
-1.407982, 0.6199595, -0.05767072, 1, 0.5333334, 0, 1,
-1.381468, -0.1616298, -1.67234, 1, 0.5411765, 0, 1,
-1.377864, 0.5513051, -0.3775361, 1, 0.5450981, 0, 1,
-1.374952, 0.1595308, -0.327566, 1, 0.5529412, 0, 1,
-1.372991, -0.5634438, -1.551012, 1, 0.5568628, 0, 1,
-1.371557, 1.580199, -0.4001184, 1, 0.5647059, 0, 1,
-1.370976, 1.147539, 0.1953453, 1, 0.5686275, 0, 1,
-1.366718, 0.747474, -0.7088792, 1, 0.5764706, 0, 1,
-1.340621, -0.9144028, -1.499561, 1, 0.5803922, 0, 1,
-1.334655, 1.564859, -2.382421, 1, 0.5882353, 0, 1,
-1.332692, 1.760576, 0.03799671, 1, 0.5921569, 0, 1,
-1.331194, 0.1958202, -1.205294, 1, 0.6, 0, 1,
-1.329993, 1.988893, -0.5314358, 1, 0.6078432, 0, 1,
-1.321674, 1.516511, -1.211435, 1, 0.6117647, 0, 1,
-1.321295, 0.7515101, -1.077122, 1, 0.6196079, 0, 1,
-1.310852, -1.704582, -4.059429, 1, 0.6235294, 0, 1,
-1.309395, 0.359874, -0.7596052, 1, 0.6313726, 0, 1,
-1.307577, -0.5689029, 0.03228904, 1, 0.6352941, 0, 1,
-1.306319, 1.534378, -0.4481315, 1, 0.6431373, 0, 1,
-1.305895, 0.901203, -1.786514, 1, 0.6470588, 0, 1,
-1.295178, -1.144899, -2.437286, 1, 0.654902, 0, 1,
-1.287636, 0.4293812, -1.605111, 1, 0.6588235, 0, 1,
-1.284388, -2.010611, -1.487629, 1, 0.6666667, 0, 1,
-1.282241, 0.7259802, -1.829398, 1, 0.6705883, 0, 1,
-1.280875, -1.276138, -1.748038, 1, 0.6784314, 0, 1,
-1.280706, -0.8854049, -3.386446, 1, 0.682353, 0, 1,
-1.279668, 1.638157, -0.5674689, 1, 0.6901961, 0, 1,
-1.277652, 0.8861778, -1.039287, 1, 0.6941177, 0, 1,
-1.27392, -2.060172, -2.232031, 1, 0.7019608, 0, 1,
-1.271857, -1.594879, -2.373671, 1, 0.7098039, 0, 1,
-1.270796, -0.5666823, -2.284155, 1, 0.7137255, 0, 1,
-1.27079, 0.5261365, -0.5437064, 1, 0.7215686, 0, 1,
-1.268388, 0.4315059, -1.092755, 1, 0.7254902, 0, 1,
-1.261858, 0.07085759, -1.182933, 1, 0.7333333, 0, 1,
-1.252481, -2.05681, -4.6303, 1, 0.7372549, 0, 1,
-1.238747, 1.03394, -1.963861, 1, 0.7450981, 0, 1,
-1.236839, 0.02994949, -1.997037, 1, 0.7490196, 0, 1,
-1.228212, -0.0562603, -2.901788, 1, 0.7568628, 0, 1,
-1.216717, -0.8016469, -1.414758, 1, 0.7607843, 0, 1,
-1.2165, 0.7595593, -1.582342, 1, 0.7686275, 0, 1,
-1.211391, 0.6457872, -1.152063, 1, 0.772549, 0, 1,
-1.200742, 0.09679478, -2.454508, 1, 0.7803922, 0, 1,
-1.200457, -0.1006867, -1.144499, 1, 0.7843137, 0, 1,
-1.19196, -2.398039, -1.824388, 1, 0.7921569, 0, 1,
-1.190529, 0.9326464, -2.182962, 1, 0.7960784, 0, 1,
-1.187867, 0.3074171, 0.6806336, 1, 0.8039216, 0, 1,
-1.184972, -1.768905, -1.416028, 1, 0.8117647, 0, 1,
-1.184607, 1.592192, -2.159084, 1, 0.8156863, 0, 1,
-1.183355, -0.1362787, -1.484341, 1, 0.8235294, 0, 1,
-1.182351, -0.129306, -1.26294, 1, 0.827451, 0, 1,
-1.18125, -0.133879, -3.69232, 1, 0.8352941, 0, 1,
-1.177371, -0.8859082, -1.799757, 1, 0.8392157, 0, 1,
-1.167745, -0.4242756, -1.431757, 1, 0.8470588, 0, 1,
-1.161582, -0.2225409, -1.043054, 1, 0.8509804, 0, 1,
-1.16031, 0.5628867, 0.4232003, 1, 0.8588235, 0, 1,
-1.159739, 0.2598521, -0.3259041, 1, 0.8627451, 0, 1,
-1.156805, 0.3935487, -2.041274, 1, 0.8705882, 0, 1,
-1.143029, 1.5444, -1.889687, 1, 0.8745098, 0, 1,
-1.140044, 0.4613383, -2.724792, 1, 0.8823529, 0, 1,
-1.139428, 0.5653815, -1.887205, 1, 0.8862745, 0, 1,
-1.135599, -0.02680007, -1.249534, 1, 0.8941177, 0, 1,
-1.126702, -0.8628254, -1.974127, 1, 0.8980392, 0, 1,
-1.122075, 0.2331391, -1.128263, 1, 0.9058824, 0, 1,
-1.120873, 0.1340254, -1.019612, 1, 0.9137255, 0, 1,
-1.116558, -0.6947326, -1.93559, 1, 0.9176471, 0, 1,
-1.116376, -2.206695, -2.832544, 1, 0.9254902, 0, 1,
-1.107563, -0.2211645, -4.800455, 1, 0.9294118, 0, 1,
-1.107221, 1.408359, -2.325985, 1, 0.9372549, 0, 1,
-1.104156, 0.2076483, -1.916474, 1, 0.9411765, 0, 1,
-1.089911, 0.7969045, 0.1534415, 1, 0.9490196, 0, 1,
-1.089037, -0.4665718, -2.686306, 1, 0.9529412, 0, 1,
-1.08803, -0.9809759, -2.860144, 1, 0.9607843, 0, 1,
-1.076364, -0.3761052, -2.631342, 1, 0.9647059, 0, 1,
-1.066267, 0.271145, -2.363096, 1, 0.972549, 0, 1,
-1.064366, 1.154118, -0.12856, 1, 0.9764706, 0, 1,
-1.063687, -0.2508751, -2.94166, 1, 0.9843137, 0, 1,
-1.056861, -0.8978406, -3.738221, 1, 0.9882353, 0, 1,
-1.047768, 2.732221, -1.917896, 1, 0.9960784, 0, 1,
-1.042592, 0.867797, -2.34182, 0.9960784, 1, 0, 1,
-1.042414, -1.399348, -4.15238, 0.9921569, 1, 0, 1,
-1.041664, -1.882057, -1.108707, 0.9843137, 1, 0, 1,
-1.038014, -1.171415, -2.310321, 0.9803922, 1, 0, 1,
-1.029248, -0.8789537, -1.218096, 0.972549, 1, 0, 1,
-1.023384, -1.259218, -3.235594, 0.9686275, 1, 0, 1,
-1.02037, 2.695515, -1.61208, 0.9607843, 1, 0, 1,
-1.019429, 1.427852, -0.4534851, 0.9568627, 1, 0, 1,
-1.018654, -0.9855523, -3.581956, 0.9490196, 1, 0, 1,
-1.011524, 0.3686063, -3.053562, 0.945098, 1, 0, 1,
-1.009758, 0.1999877, -0.8978053, 0.9372549, 1, 0, 1,
-0.9987875, -0.130719, -2.735343, 0.9333333, 1, 0, 1,
-0.9957472, -0.7696207, -0.5666998, 0.9254902, 1, 0, 1,
-0.9935363, -0.141343, -0.9194601, 0.9215686, 1, 0, 1,
-0.9853684, 0.6459542, -0.8495857, 0.9137255, 1, 0, 1,
-0.9831542, -0.06644204, -2.511815, 0.9098039, 1, 0, 1,
-0.9798249, -0.9867744, -3.053761, 0.9019608, 1, 0, 1,
-0.9743056, 1.008171, 0.2648751, 0.8941177, 1, 0, 1,
-0.9680881, 0.6767699, -1.09108, 0.8901961, 1, 0, 1,
-0.9666159, 1.147567, 0.7208582, 0.8823529, 1, 0, 1,
-0.9636118, 0.7165903, -1.725726, 0.8784314, 1, 0, 1,
-0.9614878, 0.8969584, 0.1552083, 0.8705882, 1, 0, 1,
-0.9609309, -0.5969598, -0.5140752, 0.8666667, 1, 0, 1,
-0.9568099, -0.3470971, 0.3425184, 0.8588235, 1, 0, 1,
-0.9567096, -0.2952494, -0.2973168, 0.854902, 1, 0, 1,
-0.9557464, -0.4259724, -3.766576, 0.8470588, 1, 0, 1,
-0.9537509, 1.654413, -1.689317, 0.8431373, 1, 0, 1,
-0.9532434, 0.7356671, 0.3671134, 0.8352941, 1, 0, 1,
-0.9523171, -0.07578865, -0.6096839, 0.8313726, 1, 0, 1,
-0.9438978, -0.2000384, -1.618515, 0.8235294, 1, 0, 1,
-0.9425216, -0.05606375, 0.4638342, 0.8196079, 1, 0, 1,
-0.9417088, -0.3476399, -2.934816, 0.8117647, 1, 0, 1,
-0.9407262, 1.612184, 1.142957, 0.8078431, 1, 0, 1,
-0.940194, 0.5789517, -1.51226, 0.8, 1, 0, 1,
-0.939324, 0.6360921, -1.015719, 0.7921569, 1, 0, 1,
-0.9391434, 0.6125365, -1.529715, 0.7882353, 1, 0, 1,
-0.9384964, 0.1965493, -2.689541, 0.7803922, 1, 0, 1,
-0.9336575, 1.502925, -1.818691, 0.7764706, 1, 0, 1,
-0.9335086, -0.6135879, -1.808905, 0.7686275, 1, 0, 1,
-0.9321895, 2.198772, -0.8399028, 0.7647059, 1, 0, 1,
-0.9309504, -0.5440578, -2.374749, 0.7568628, 1, 0, 1,
-0.9303966, -0.4959212, -3.481921, 0.7529412, 1, 0, 1,
-0.9282812, 0.5464631, -1.551552, 0.7450981, 1, 0, 1,
-0.9261817, -0.2115848, -2.261252, 0.7411765, 1, 0, 1,
-0.9115083, 1.488826, 0.1729029, 0.7333333, 1, 0, 1,
-0.9082627, 0.9144484, -0.452084, 0.7294118, 1, 0, 1,
-0.9075667, 1.712259, -1.164676, 0.7215686, 1, 0, 1,
-0.9038244, -0.9926087, -1.114835, 0.7176471, 1, 0, 1,
-0.8898879, -0.5828127, -4.40055, 0.7098039, 1, 0, 1,
-0.8895283, 2.144708, -0.03705639, 0.7058824, 1, 0, 1,
-0.8848683, 0.1827919, -1.733653, 0.6980392, 1, 0, 1,
-0.8831595, 1.062985, -0.9569794, 0.6901961, 1, 0, 1,
-0.8819491, -0.221911, -1.482058, 0.6862745, 1, 0, 1,
-0.880307, -0.3347141, -2.124409, 0.6784314, 1, 0, 1,
-0.8780127, 0.8128011, -2.297319, 0.6745098, 1, 0, 1,
-0.8742593, -0.4624045, -3.56637, 0.6666667, 1, 0, 1,
-0.8737372, 0.7242364, -1.650788, 0.6627451, 1, 0, 1,
-0.8723726, 0.7965697, -0.6131656, 0.654902, 1, 0, 1,
-0.8718087, -0.2048222, -3.213996, 0.6509804, 1, 0, 1,
-0.8692282, 1.454604, 2.133474, 0.6431373, 1, 0, 1,
-0.8636109, 2.142046, 1.59214, 0.6392157, 1, 0, 1,
-0.860751, -1.252955, -1.97674, 0.6313726, 1, 0, 1,
-0.8577461, 0.9457895, -0.9858684, 0.627451, 1, 0, 1,
-0.8573626, -0.2086269, -0.6175397, 0.6196079, 1, 0, 1,
-0.8427123, 0.7802564, 0.117585, 0.6156863, 1, 0, 1,
-0.8425015, -0.08287884, -0.6551926, 0.6078432, 1, 0, 1,
-0.8227701, 0.9354587, -2.280238, 0.6039216, 1, 0, 1,
-0.8166868, 0.353873, -3.075443, 0.5960785, 1, 0, 1,
-0.8164603, 0.5893469, 0.139319, 0.5882353, 1, 0, 1,
-0.8121415, -0.6517357, -2.097207, 0.5843138, 1, 0, 1,
-0.8116695, 0.266004, -1.747786, 0.5764706, 1, 0, 1,
-0.8095279, -0.42225, -2.723151, 0.572549, 1, 0, 1,
-0.809454, -0.46377, -2.154914, 0.5647059, 1, 0, 1,
-0.8060591, -1.363379, -2.294133, 0.5607843, 1, 0, 1,
-0.8054433, 0.5141849, -0.4122548, 0.5529412, 1, 0, 1,
-0.7880065, -1.732921, -4.191855, 0.5490196, 1, 0, 1,
-0.787475, 0.5073522, 1.035725, 0.5411765, 1, 0, 1,
-0.785928, -0.04994471, -1.365834, 0.5372549, 1, 0, 1,
-0.7761095, 0.32744, -1.341408, 0.5294118, 1, 0, 1,
-0.7746295, 0.455375, -0.8485211, 0.5254902, 1, 0, 1,
-0.770894, -0.8934185, -2.945086, 0.5176471, 1, 0, 1,
-0.7619407, -2.069983, -2.683376, 0.5137255, 1, 0, 1,
-0.7618727, -2.081581, -0.2128049, 0.5058824, 1, 0, 1,
-0.7606163, -2.149489, -3.664805, 0.5019608, 1, 0, 1,
-0.7577956, -1.808104, -4.054389, 0.4941176, 1, 0, 1,
-0.7566522, -1.030761, -2.476499, 0.4862745, 1, 0, 1,
-0.7561402, -0.6930768, -1.325101, 0.4823529, 1, 0, 1,
-0.7497624, 0.2624329, -1.977401, 0.4745098, 1, 0, 1,
-0.7495744, -0.45883, -3.047467, 0.4705882, 1, 0, 1,
-0.7487029, 1.479753, 0.0851228, 0.4627451, 1, 0, 1,
-0.7344092, -0.414092, 0.1223876, 0.4588235, 1, 0, 1,
-0.7323979, 0.2934825, -2.121773, 0.4509804, 1, 0, 1,
-0.7284697, 1.550642, -0.2016359, 0.4470588, 1, 0, 1,
-0.7196093, -1.631568, -2.124912, 0.4392157, 1, 0, 1,
-0.7186349, -0.4250444, -4.447437, 0.4352941, 1, 0, 1,
-0.7182016, -0.7450907, -2.074651, 0.427451, 1, 0, 1,
-0.7155012, 0.7376878, -0.4941909, 0.4235294, 1, 0, 1,
-0.7151044, -0.9579308, -1.849634, 0.4156863, 1, 0, 1,
-0.7122459, -0.2504102, -1.744007, 0.4117647, 1, 0, 1,
-0.7104225, 2.108673, -2.507212, 0.4039216, 1, 0, 1,
-0.7101241, -0.8396263, -0.289928, 0.3960784, 1, 0, 1,
-0.7065394, 0.08064231, -1.933185, 0.3921569, 1, 0, 1,
-0.7062932, -0.8344434, -2.682405, 0.3843137, 1, 0, 1,
-0.7037746, -1.433813, -2.334838, 0.3803922, 1, 0, 1,
-0.7007933, 0.3474492, 0.3869006, 0.372549, 1, 0, 1,
-0.6910617, 2.13365, -1.227827, 0.3686275, 1, 0, 1,
-0.6850654, 0.2957203, -0.6641833, 0.3607843, 1, 0, 1,
-0.6845478, -0.4836716, -3.07396, 0.3568628, 1, 0, 1,
-0.6771271, -1.983369, -2.173693, 0.3490196, 1, 0, 1,
-0.6743355, 1.100662, 0.6702796, 0.345098, 1, 0, 1,
-0.6736642, -1.431572, -1.968916, 0.3372549, 1, 0, 1,
-0.6716051, 0.04152861, 0.07879587, 0.3333333, 1, 0, 1,
-0.6707481, 1.748091, -0.4818818, 0.3254902, 1, 0, 1,
-0.6645795, -0.6977147, -2.44134, 0.3215686, 1, 0, 1,
-0.660149, -0.0456075, -2.207878, 0.3137255, 1, 0, 1,
-0.6565809, 0.06429917, -0.2223434, 0.3098039, 1, 0, 1,
-0.6549741, -0.2592846, -1.108087, 0.3019608, 1, 0, 1,
-0.6539418, 0.2935865, -1.923589, 0.2941177, 1, 0, 1,
-0.6427398, -0.4282326, -3.788514, 0.2901961, 1, 0, 1,
-0.6266973, -1.38266, -3.629251, 0.282353, 1, 0, 1,
-0.6148669, -0.6072185, -2.415104, 0.2784314, 1, 0, 1,
-0.6133879, -1.343358, -2.906255, 0.2705882, 1, 0, 1,
-0.6119494, 0.09937052, -1.175928, 0.2666667, 1, 0, 1,
-0.5989407, -0.9212444, -2.410975, 0.2588235, 1, 0, 1,
-0.5944496, -1.65275, -2.055107, 0.254902, 1, 0, 1,
-0.5915689, -0.07573113, -1.566756, 0.2470588, 1, 0, 1,
-0.5835732, -0.2333936, -1.810533, 0.2431373, 1, 0, 1,
-0.582576, -0.5677291, -2.141253, 0.2352941, 1, 0, 1,
-0.576137, 0.2304703, -0.1730797, 0.2313726, 1, 0, 1,
-0.5723768, -1.368264, -1.059668, 0.2235294, 1, 0, 1,
-0.5696483, 1.79005, 1.028448, 0.2196078, 1, 0, 1,
-0.5681915, -0.9411793, -3.294177, 0.2117647, 1, 0, 1,
-0.5680541, -0.7717554, -1.891159, 0.2078431, 1, 0, 1,
-0.5655797, -1.220167, -0.7454098, 0.2, 1, 0, 1,
-0.5631698, -0.07851078, -1.327811, 0.1921569, 1, 0, 1,
-0.5625992, -0.4312933, -3.196871, 0.1882353, 1, 0, 1,
-0.5576233, 0.210927, -1.669485, 0.1803922, 1, 0, 1,
-0.5472776, -1.258711, -3.170541, 0.1764706, 1, 0, 1,
-0.5460187, 0.2274625, -2.274068, 0.1686275, 1, 0, 1,
-0.5457214, 2.045732, -0.778591, 0.1647059, 1, 0, 1,
-0.5434986, 0.6298811, -1.50615, 0.1568628, 1, 0, 1,
-0.543377, -0.007073156, -1.086752, 0.1529412, 1, 0, 1,
-0.5418841, -0.3579067, -1.673355, 0.145098, 1, 0, 1,
-0.5408362, -1.34437, -4.08509, 0.1411765, 1, 0, 1,
-0.5305768, -1.728162, -4.744426, 0.1333333, 1, 0, 1,
-0.5259909, -1.112286, -3.940832, 0.1294118, 1, 0, 1,
-0.5186282, 1.337097, -1.989798, 0.1215686, 1, 0, 1,
-0.5043011, -0.495113, -2.538987, 0.1176471, 1, 0, 1,
-0.4974213, 1.859188, -1.085421, 0.1098039, 1, 0, 1,
-0.4970733, -2.620922, -1.03715, 0.1058824, 1, 0, 1,
-0.4933849, -0.06551022, -1.790432, 0.09803922, 1, 0, 1,
-0.4889113, -0.3612085, -2.867961, 0.09019608, 1, 0, 1,
-0.4861695, 0.9905749, 1.051293, 0.08627451, 1, 0, 1,
-0.4833973, -0.5724549, -3.597809, 0.07843138, 1, 0, 1,
-0.4824722, -0.1024229, -1.270237, 0.07450981, 1, 0, 1,
-0.4798551, 0.6075358, -1.464766, 0.06666667, 1, 0, 1,
-0.4798198, 0.9789777, -1.141113, 0.0627451, 1, 0, 1,
-0.4778637, 0.8409367, -0.01968538, 0.05490196, 1, 0, 1,
-0.4772204, 1.92237, 0.715605, 0.05098039, 1, 0, 1,
-0.4699184, 0.1083201, -2.161546, 0.04313726, 1, 0, 1,
-0.4645118, 1.770678, 0.1868708, 0.03921569, 1, 0, 1,
-0.4608633, 0.1391782, 0.2276911, 0.03137255, 1, 0, 1,
-0.4592497, -2.0448, -2.426612, 0.02745098, 1, 0, 1,
-0.4591863, 1.193323, -0.8275388, 0.01960784, 1, 0, 1,
-0.454362, 0.05686259, -1.464261, 0.01568628, 1, 0, 1,
-0.4465801, -0.3640096, -1.685511, 0.007843138, 1, 0, 1,
-0.4367047, 1.279982, -0.1517215, 0.003921569, 1, 0, 1,
-0.4327963, 0.4758738, -2.159683, 0, 1, 0.003921569, 1,
-0.4282695, -0.04121362, -1.311361, 0, 1, 0.01176471, 1,
-0.4255626, 1.937666, -1.076445, 0, 1, 0.01568628, 1,
-0.425167, 0.6557365, 0.5385579, 0, 1, 0.02352941, 1,
-0.4234063, -0.04821839, -1.595444, 0, 1, 0.02745098, 1,
-0.4227163, 0.9852589, -1.646454, 0, 1, 0.03529412, 1,
-0.4208142, -0.1556076, -2.911016, 0, 1, 0.03921569, 1,
-0.418626, -1.81488, -3.492399, 0, 1, 0.04705882, 1,
-0.4142026, -0.1227426, -1.000693, 0, 1, 0.05098039, 1,
-0.4113725, -0.6427092, -2.862709, 0, 1, 0.05882353, 1,
-0.4086658, -1.032869, -1.93949, 0, 1, 0.0627451, 1,
-0.4023836, 0.2764006, -0.8867831, 0, 1, 0.07058824, 1,
-0.4005176, 0.2018057, -1.629659, 0, 1, 0.07450981, 1,
-0.398836, 1.649422, -1.101594, 0, 1, 0.08235294, 1,
-0.3933924, -1.007287, -1.326085, 0, 1, 0.08627451, 1,
-0.3928387, -0.5434135, -3.421973, 0, 1, 0.09411765, 1,
-0.3914555, 0.09644578, -0.511479, 0, 1, 0.1019608, 1,
-0.3904108, 0.2557488, 1.503741, 0, 1, 0.1058824, 1,
-0.3847881, 0.1392698, -3.195591, 0, 1, 0.1137255, 1,
-0.3792104, 0.6209306, -1.325113, 0, 1, 0.1176471, 1,
-0.3754298, 0.4848047, -1.237272, 0, 1, 0.1254902, 1,
-0.3752552, 0.2369451, -3.041284, 0, 1, 0.1294118, 1,
-0.3734345, 1.746146, -0.6042354, 0, 1, 0.1372549, 1,
-0.3701465, -0.2923269, -2.966971, 0, 1, 0.1411765, 1,
-0.3690766, 0.6658638, -0.3548186, 0, 1, 0.1490196, 1,
-0.3690537, -0.9891385, -3.23697, 0, 1, 0.1529412, 1,
-0.3688401, 0.9398938, 0.3362556, 0, 1, 0.1607843, 1,
-0.3645914, -1.242477, -3.52216, 0, 1, 0.1647059, 1,
-0.3572236, -0.6019526, -2.920535, 0, 1, 0.172549, 1,
-0.3553718, -0.9515471, -1.254988, 0, 1, 0.1764706, 1,
-0.3513299, 0.6599684, 0.1920389, 0, 1, 0.1843137, 1,
-0.3476223, -0.9526167, -4.666432, 0, 1, 0.1882353, 1,
-0.3450311, -0.02241245, -3.309371, 0, 1, 0.1960784, 1,
-0.3449611, 0.1233239, -3.753358, 0, 1, 0.2039216, 1,
-0.3445176, -0.5933246, -2.159586, 0, 1, 0.2078431, 1,
-0.3397841, 0.1648225, -1.701889, 0, 1, 0.2156863, 1,
-0.3391118, 0.6938965, -0.06368049, 0, 1, 0.2196078, 1,
-0.3364474, 1.557682, -1.091994, 0, 1, 0.227451, 1,
-0.3357864, -1.640302, -3.906129, 0, 1, 0.2313726, 1,
-0.3310852, -0.1037494, -0.9779129, 0, 1, 0.2392157, 1,
-0.3303626, -0.8552179, -4.461819, 0, 1, 0.2431373, 1,
-0.3251716, -0.06136437, -1.885681, 0, 1, 0.2509804, 1,
-0.3248883, 0.2807386, 0.1660361, 0, 1, 0.254902, 1,
-0.3213327, -0.2460477, -3.114487, 0, 1, 0.2627451, 1,
-0.3179128, -0.612681, -2.246186, 0, 1, 0.2666667, 1,
-0.3153549, -0.2334684, -1.43722, 0, 1, 0.2745098, 1,
-0.3144046, -0.2123152, -2.631027, 0, 1, 0.2784314, 1,
-0.314122, 0.2708927, -0.6956822, 0, 1, 0.2862745, 1,
-0.3087054, 0.3801924, 0.8812962, 0, 1, 0.2901961, 1,
-0.3016058, 0.1102094, 1.01713, 0, 1, 0.2980392, 1,
-0.3011831, -1.440772, -1.334956, 0, 1, 0.3058824, 1,
-0.2946143, -1.457368, -2.59615, 0, 1, 0.3098039, 1,
-0.2863842, 1.66523, 0.08867659, 0, 1, 0.3176471, 1,
-0.2856282, 0.04720961, -2.607119, 0, 1, 0.3215686, 1,
-0.2834397, -1.417881, -3.849158, 0, 1, 0.3294118, 1,
-0.2815097, 0.3583927, 0.5762681, 0, 1, 0.3333333, 1,
-0.2782757, -0.4665524, -3.508392, 0, 1, 0.3411765, 1,
-0.2712863, 2.351142, 0.6256454, 0, 1, 0.345098, 1,
-0.2635307, -0.9883938, -3.309241, 0, 1, 0.3529412, 1,
-0.2592212, -0.7174295, -4.549225, 0, 1, 0.3568628, 1,
-0.2584568, -0.2375124, -2.917883, 0, 1, 0.3647059, 1,
-0.2521226, -0.3007648, -1.617386, 0, 1, 0.3686275, 1,
-0.2440532, -2.448486, -0.7357344, 0, 1, 0.3764706, 1,
-0.2438513, 0.7410941, 0.532411, 0, 1, 0.3803922, 1,
-0.2345194, 0.8875197, 0.1970176, 0, 1, 0.3882353, 1,
-0.2329374, 1.445235, 0.1493936, 0, 1, 0.3921569, 1,
-0.2200966, 0.9916718, 0.1569075, 0, 1, 0.4, 1,
-0.2197567, 0.8327016, -1.305814, 0, 1, 0.4078431, 1,
-0.2154672, -0.9272323, -3.968357, 0, 1, 0.4117647, 1,
-0.2147444, 1.807921, 0.1451392, 0, 1, 0.4196078, 1,
-0.2126431, 0.3909656, -1.513633, 0, 1, 0.4235294, 1,
-0.2124202, 0.7554669, -1.133567, 0, 1, 0.4313726, 1,
-0.2114952, -0.6554092, -4.602118, 0, 1, 0.4352941, 1,
-0.2088149, 0.8677767, -0.4308786, 0, 1, 0.4431373, 1,
-0.2077826, -2.187934, -3.141325, 0, 1, 0.4470588, 1,
-0.2014485, -0.2886958, -3.13771, 0, 1, 0.454902, 1,
-0.1976615, -0.07924961, -2.42483, 0, 1, 0.4588235, 1,
-0.1944069, -0.9251362, -1.47703, 0, 1, 0.4666667, 1,
-0.1941202, -0.5756198, -3.51966, 0, 1, 0.4705882, 1,
-0.192382, -0.5253404, -1.754422, 0, 1, 0.4784314, 1,
-0.1917999, -0.1836899, -2.618785, 0, 1, 0.4823529, 1,
-0.1837306, -0.3058555, -1.348444, 0, 1, 0.4901961, 1,
-0.1818387, 0.5600403, -3.03117, 0, 1, 0.4941176, 1,
-0.1782948, -0.7218155, -3.464715, 0, 1, 0.5019608, 1,
-0.1776957, 0.5732719, -0.2779881, 0, 1, 0.509804, 1,
-0.1771383, -0.6570355, -2.167825, 0, 1, 0.5137255, 1,
-0.1749511, 0.4020121, -0.07450061, 0, 1, 0.5215687, 1,
-0.1743475, 0.2956202, -0.823994, 0, 1, 0.5254902, 1,
-0.1708336, -0.6380976, -2.083531, 0, 1, 0.5333334, 1,
-0.1693549, -0.2452516, -3.717439, 0, 1, 0.5372549, 1,
-0.1683062, -1.491051, -3.215053, 0, 1, 0.5450981, 1,
-0.1647214, -0.2038912, -2.79898, 0, 1, 0.5490196, 1,
-0.1641165, -3.653291, -3.840425, 0, 1, 0.5568628, 1,
-0.1631137, -1.200859, -1.729205, 0, 1, 0.5607843, 1,
-0.1630506, -4.22596, -3.159277, 0, 1, 0.5686275, 1,
-0.1620669, -1.08759, -3.53082, 0, 1, 0.572549, 1,
-0.1499885, -1.118853, -4.750309, 0, 1, 0.5803922, 1,
-0.1498693, -0.0190356, -0.4231231, 0, 1, 0.5843138, 1,
-0.1485727, 1.688543, -0.778829, 0, 1, 0.5921569, 1,
-0.1461422, 0.608429, -0.9569406, 0, 1, 0.5960785, 1,
-0.1393349, 0.09412751, -0.5110397, 0, 1, 0.6039216, 1,
-0.1374319, -1.702261, -3.272961, 0, 1, 0.6117647, 1,
-0.1360121, -1.791486, -3.842461, 0, 1, 0.6156863, 1,
-0.133833, -0.6244102, -2.20433, 0, 1, 0.6235294, 1,
-0.1335282, 0.5452994, 0.09920298, 0, 1, 0.627451, 1,
-0.1333213, -0.8953814, -1.790637, 0, 1, 0.6352941, 1,
-0.1318454, 1.467931, 0.6485897, 0, 1, 0.6392157, 1,
-0.1312236, -0.9229634, -3.136765, 0, 1, 0.6470588, 1,
-0.1274711, -2.581757, -4.93367, 0, 1, 0.6509804, 1,
-0.1273605, 1.770202, 2.065545, 0, 1, 0.6588235, 1,
-0.1247214, -0.251633, -3.630506, 0, 1, 0.6627451, 1,
-0.1244325, -1.48226, -3.124878, 0, 1, 0.6705883, 1,
-0.1219536, -0.02187984, -3.008831, 0, 1, 0.6745098, 1,
-0.1149469, -0.3655668, -4.335284, 0, 1, 0.682353, 1,
-0.106787, 1.389353, -0.571268, 0, 1, 0.6862745, 1,
-0.1048171, -0.3789218, -1.98876, 0, 1, 0.6941177, 1,
-0.1000615, 0.1133808, 0.4970525, 0, 1, 0.7019608, 1,
-0.09801079, -0.8345242, -5.393449, 0, 1, 0.7058824, 1,
-0.0963148, -2.809914, -3.36534, 0, 1, 0.7137255, 1,
-0.08646479, -0.2535132, -2.524033, 0, 1, 0.7176471, 1,
-0.08532042, 2.093635, 1.038647, 0, 1, 0.7254902, 1,
-0.08354402, -0.7609698, -3.254708, 0, 1, 0.7294118, 1,
-0.08285925, -0.1528129, -3.329287, 0, 1, 0.7372549, 1,
-0.07803592, 0.8970716, 0.6400324, 0, 1, 0.7411765, 1,
-0.07717736, -0.4612939, -2.642797, 0, 1, 0.7490196, 1,
-0.07570421, 0.8914127, 0.2475853, 0, 1, 0.7529412, 1,
-0.07501182, 0.206044, -1.568935, 0, 1, 0.7607843, 1,
-0.07299224, 0.3926308, -0.005748279, 0, 1, 0.7647059, 1,
-0.06414916, 1.723722, -0.3478591, 0, 1, 0.772549, 1,
-0.060927, -0.7907252, -1.2655, 0, 1, 0.7764706, 1,
-0.06020296, 0.1010349, -1.447081, 0, 1, 0.7843137, 1,
-0.05995739, 0.6790562, -1.247923, 0, 1, 0.7882353, 1,
-0.05858902, 0.271313, -0.2618323, 0, 1, 0.7960784, 1,
-0.05683349, 0.2445733, -0.5678276, 0, 1, 0.8039216, 1,
-0.05608786, -2.72415, -2.188187, 0, 1, 0.8078431, 1,
-0.04862349, -0.5357153, -4.187555, 0, 1, 0.8156863, 1,
-0.0474874, 0.5054168, -0.1867019, 0, 1, 0.8196079, 1,
-0.04710951, 1.605064, -0.3479402, 0, 1, 0.827451, 1,
-0.04629923, -0.1794458, -2.710329, 0, 1, 0.8313726, 1,
-0.0461832, -0.2441161, -3.360415, 0, 1, 0.8392157, 1,
-0.04602305, 1.072061, -1.141977, 0, 1, 0.8431373, 1,
-0.04485875, 0.2182873, 1.150569, 0, 1, 0.8509804, 1,
-0.04262412, -0.2198724, -1.28716, 0, 1, 0.854902, 1,
-0.04212806, 0.3277856, -0.1505299, 0, 1, 0.8627451, 1,
-0.03733741, -0.544305, -2.195904, 0, 1, 0.8666667, 1,
-0.03052313, 1.826349, 0.04233298, 0, 1, 0.8745098, 1,
-0.01905509, 0.7618275, -0.8298113, 0, 1, 0.8784314, 1,
-0.01662687, -0.09649224, -4.423583, 0, 1, 0.8862745, 1,
-0.01658395, 1.891668, -0.8304913, 0, 1, 0.8901961, 1,
-0.01655304, 0.3953581, 0.1778606, 0, 1, 0.8980392, 1,
-0.01577711, -1.231706, -3.4618, 0, 1, 0.9058824, 1,
-0.01142729, -0.8038438, -5.198517, 0, 1, 0.9098039, 1,
-0.00907155, 0.3241826, -0.7370749, 0, 1, 0.9176471, 1,
-0.00760095, -0.6772989, -2.168226, 0, 1, 0.9215686, 1,
-0.006913915, -0.1759492, -3.873859, 0, 1, 0.9294118, 1,
-0.005559105, 0.324797, 0.9566871, 0, 1, 0.9333333, 1,
-0.004437139, -1.303518, -3.578906, 0, 1, 0.9411765, 1,
-0.0001121976, 1.181008, 0.5416592, 0, 1, 0.945098, 1,
0.00399109, -0.2344913, 2.746497, 0, 1, 0.9529412, 1,
0.004311667, 0.137483, 2.546166, 0, 1, 0.9568627, 1,
0.00482576, -1.129697, 2.847104, 0, 1, 0.9647059, 1,
0.004827087, 0.5224589, 0.7225561, 0, 1, 0.9686275, 1,
0.007688765, -0.7525787, 5.115638, 0, 1, 0.9764706, 1,
0.01024024, -1.407712, 3.706258, 0, 1, 0.9803922, 1,
0.01637871, 1.590088, 1.059381, 0, 1, 0.9882353, 1,
0.01709287, 0.7351696, 0.7698084, 0, 1, 0.9921569, 1,
0.02006611, -1.10559, 2.656575, 0, 1, 1, 1,
0.02113964, -0.01714858, 2.026361, 0, 0.9921569, 1, 1,
0.02242953, 0.4681177, 0.6081457, 0, 0.9882353, 1, 1,
0.02527938, -0.009127317, 2.4334, 0, 0.9803922, 1, 1,
0.02780975, 0.8273963, -0.7721225, 0, 0.9764706, 1, 1,
0.02883122, -0.1709902, 2.137264, 0, 0.9686275, 1, 1,
0.03069737, -0.623533, 5.356863, 0, 0.9647059, 1, 1,
0.0311996, -0.7318712, 2.230195, 0, 0.9568627, 1, 1,
0.03193718, -0.2267163, 1.799544, 0, 0.9529412, 1, 1,
0.03288391, 0.350337, -0.2859963, 0, 0.945098, 1, 1,
0.03957672, 0.02107169, 0.7454107, 0, 0.9411765, 1, 1,
0.04240566, 0.7547638, 1.103779, 0, 0.9333333, 1, 1,
0.04392561, 0.8732741, 0.3445863, 0, 0.9294118, 1, 1,
0.04657147, 0.1933711, -1.210716, 0, 0.9215686, 1, 1,
0.05344307, -0.3405316, 2.144349, 0, 0.9176471, 1, 1,
0.05608129, 0.3179518, -0.5963591, 0, 0.9098039, 1, 1,
0.05630369, 0.7166296, -1.561912, 0, 0.9058824, 1, 1,
0.05693254, -1.990769, 1.757166, 0, 0.8980392, 1, 1,
0.06013939, -0.5850384, 4.057746, 0, 0.8901961, 1, 1,
0.06253495, -0.5988924, 3.808353, 0, 0.8862745, 1, 1,
0.0670024, 0.1293925, -0.1510106, 0, 0.8784314, 1, 1,
0.07186636, 0.3244302, 1.220885, 0, 0.8745098, 1, 1,
0.07481848, 0.2365098, -0.9572393, 0, 0.8666667, 1, 1,
0.07698903, -2.99349, 2.324781, 0, 0.8627451, 1, 1,
0.07708697, 1.0839, -0.1295307, 0, 0.854902, 1, 1,
0.07848497, -0.1756674, 2.946863, 0, 0.8509804, 1, 1,
0.0791994, -0.4867836, 2.67022, 0, 0.8431373, 1, 1,
0.08006506, 0.6551712, 0.9596409, 0, 0.8392157, 1, 1,
0.08216978, 0.08823919, 1.337784, 0, 0.8313726, 1, 1,
0.08345643, -1.143452, 3.858641, 0, 0.827451, 1, 1,
0.08629905, 0.002656557, 2.916938, 0, 0.8196079, 1, 1,
0.0865987, 0.0646034, 1.524153, 0, 0.8156863, 1, 1,
0.08897607, 1.682806, 0.4322769, 0, 0.8078431, 1, 1,
0.09141198, 1.10726, 1.155632, 0, 0.8039216, 1, 1,
0.09192936, -1.67964, 1.318356, 0, 0.7960784, 1, 1,
0.09338743, 1.361427, 1.380299, 0, 0.7882353, 1, 1,
0.09402919, -0.3902788, 3.358165, 0, 0.7843137, 1, 1,
0.09548549, 0.05585788, 2.876233, 0, 0.7764706, 1, 1,
0.09560371, -0.1452522, 3.79291, 0, 0.772549, 1, 1,
0.09569604, 0.04085724, 2.1418, 0, 0.7647059, 1, 1,
0.0957071, 0.9917975, -0.1527487, 0, 0.7607843, 1, 1,
0.0957972, -0.3929404, 3.877817, 0, 0.7529412, 1, 1,
0.09831271, -0.6694136, 3.021717, 0, 0.7490196, 1, 1,
0.100336, -2.974852, 4.446855, 0, 0.7411765, 1, 1,
0.1093278, 0.7573932, 1.263671, 0, 0.7372549, 1, 1,
0.1098936, -0.7986515, 3.402458, 0, 0.7294118, 1, 1,
0.1113541, -0.2126631, 1.076195, 0, 0.7254902, 1, 1,
0.116563, -0.7998565, 2.423386, 0, 0.7176471, 1, 1,
0.116932, 0.6197343, 0.5605513, 0, 0.7137255, 1, 1,
0.1181998, -0.003701198, 2.303329, 0, 0.7058824, 1, 1,
0.1199987, 0.7564949, 0.4246684, 0, 0.6980392, 1, 1,
0.1213649, -0.7632626, 2.514104, 0, 0.6941177, 1, 1,
0.1216154, -1.744196, 3.656674, 0, 0.6862745, 1, 1,
0.1252765, 0.5696702, 0.4492537, 0, 0.682353, 1, 1,
0.1273856, -0.6879693, 3.640727, 0, 0.6745098, 1, 1,
0.1287054, 2.651978, -0.8592269, 0, 0.6705883, 1, 1,
0.1289461, 1.073311, 0.2614627, 0, 0.6627451, 1, 1,
0.1298284, -0.491514, 2.368753, 0, 0.6588235, 1, 1,
0.1300456, 0.3177381, -0.2192457, 0, 0.6509804, 1, 1,
0.1329592, -0.3300617, 3.239836, 0, 0.6470588, 1, 1,
0.1349879, -1.23447, 3.170612, 0, 0.6392157, 1, 1,
0.1362238, -0.9405964, 4.925528, 0, 0.6352941, 1, 1,
0.1364609, -0.2608749, 2.023629, 0, 0.627451, 1, 1,
0.1402556, 0.2148767, 1.407128, 0, 0.6235294, 1, 1,
0.1411381, 0.6044678, 1.034083, 0, 0.6156863, 1, 1,
0.143016, -0.951206, 4.077336, 0, 0.6117647, 1, 1,
0.1467409, -0.360218, 3.75164, 0, 0.6039216, 1, 1,
0.1472411, 2.049489, -0.3679007, 0, 0.5960785, 1, 1,
0.1485314, 0.447009, 0.331629, 0, 0.5921569, 1, 1,
0.1603358, 0.8924771, 0.07875161, 0, 0.5843138, 1, 1,
0.1615043, 1.052522, 0.6994246, 0, 0.5803922, 1, 1,
0.1622896, 0.6924905, -0.2049596, 0, 0.572549, 1, 1,
0.1646406, -0.2281162, 3.106039, 0, 0.5686275, 1, 1,
0.1657065, 0.6640206, 1.535321, 0, 0.5607843, 1, 1,
0.1685133, -1.236479, 4.455703, 0, 0.5568628, 1, 1,
0.1698245, -2.009013, 3.820452, 0, 0.5490196, 1, 1,
0.1735673, -0.7515249, 3.60756, 0, 0.5450981, 1, 1,
0.1746283, 0.8372555, 1.250546, 0, 0.5372549, 1, 1,
0.1748701, -1.265975, 3.983573, 0, 0.5333334, 1, 1,
0.1757967, -0.4734339, 3.125677, 0, 0.5254902, 1, 1,
0.1790176, 1.226526, -0.2625681, 0, 0.5215687, 1, 1,
0.1806209, -0.7226273, 4.437879, 0, 0.5137255, 1, 1,
0.1830344, -0.6403617, 2.411106, 0, 0.509804, 1, 1,
0.1862403, -1.653349, 1.77274, 0, 0.5019608, 1, 1,
0.1869978, -0.01850692, 0.8942491, 0, 0.4941176, 1, 1,
0.1919105, 0.03430429, 1.353856, 0, 0.4901961, 1, 1,
0.1926496, -0.4930156, 3.046304, 0, 0.4823529, 1, 1,
0.1969106, -1.25649, 1.904992, 0, 0.4784314, 1, 1,
0.1976883, -0.2485776, 4.407507, 0, 0.4705882, 1, 1,
0.2003786, -1.859235, 3.369014, 0, 0.4666667, 1, 1,
0.203463, 1.941289, -0.1790616, 0, 0.4588235, 1, 1,
0.2053758, 0.08113654, 0.3164403, 0, 0.454902, 1, 1,
0.2060139, 1.397003, -0.02279709, 0, 0.4470588, 1, 1,
0.2062652, 0.03854723, 1.723245, 0, 0.4431373, 1, 1,
0.2103571, -0.08963995, 0.9724283, 0, 0.4352941, 1, 1,
0.2113364, -0.05257951, 2.742672, 0, 0.4313726, 1, 1,
0.2169691, 0.3587236, 0.2474734, 0, 0.4235294, 1, 1,
0.2187976, -1.717206, 2.989297, 0, 0.4196078, 1, 1,
0.2222528, 1.069474, 0.2713493, 0, 0.4117647, 1, 1,
0.2223793, -0.4738406, 2.910628, 0, 0.4078431, 1, 1,
0.2230803, 0.2766344, -0.1483852, 0, 0.4, 1, 1,
0.223332, 0.120134, 1.600096, 0, 0.3921569, 1, 1,
0.2244486, -0.1630367, 3.025066, 0, 0.3882353, 1, 1,
0.2267552, 0.6366667, -0.7881172, 0, 0.3803922, 1, 1,
0.2270792, -1.176306, 2.563857, 0, 0.3764706, 1, 1,
0.2281103, 0.7867844, 2.0606, 0, 0.3686275, 1, 1,
0.2284648, -0.7175226, 3.787816, 0, 0.3647059, 1, 1,
0.229627, 1.084627, -0.6319232, 0, 0.3568628, 1, 1,
0.2325989, -0.07258794, 0.3927231, 0, 0.3529412, 1, 1,
0.2338153, 1.105794, -0.8162562, 0, 0.345098, 1, 1,
0.2352847, -1.977299, 3.392792, 0, 0.3411765, 1, 1,
0.2356037, 0.7024026, 1.5309, 0, 0.3333333, 1, 1,
0.2372821, -1.182908, 3.50711, 0, 0.3294118, 1, 1,
0.2387084, -0.05403346, 2.308571, 0, 0.3215686, 1, 1,
0.2414847, 1.335162, 0.1120933, 0, 0.3176471, 1, 1,
0.2436235, 0.07831523, 1.456778, 0, 0.3098039, 1, 1,
0.2450475, 0.7912371, -0.008608012, 0, 0.3058824, 1, 1,
0.2456027, 0.6208691, 0.1096863, 0, 0.2980392, 1, 1,
0.2457548, 1.207011, -0.5393617, 0, 0.2901961, 1, 1,
0.2469038, 0.4533755, 0.8885959, 0, 0.2862745, 1, 1,
0.2510385, 0.4684258, 0.473399, 0, 0.2784314, 1, 1,
0.2524085, 1.218533, 0.5798291, 0, 0.2745098, 1, 1,
0.2526291, -0.4764242, 1.46313, 0, 0.2666667, 1, 1,
0.2561291, 1.361023, -0.8070205, 0, 0.2627451, 1, 1,
0.2589741, -1.758989, 2.555489, 0, 0.254902, 1, 1,
0.2680753, 0.1592315, -0.8775911, 0, 0.2509804, 1, 1,
0.2688698, -0.5484927, 4.670464, 0, 0.2431373, 1, 1,
0.2733149, -0.4703106, 2.794254, 0, 0.2392157, 1, 1,
0.2740719, -0.4745012, 2.579732, 0, 0.2313726, 1, 1,
0.2765926, 1.58929, 0.9208544, 0, 0.227451, 1, 1,
0.2779662, -2.39479, 2.875471, 0, 0.2196078, 1, 1,
0.2804169, -0.9139357, 2.565202, 0, 0.2156863, 1, 1,
0.2847952, -0.02880857, 3.347742, 0, 0.2078431, 1, 1,
0.285683, 0.08311439, 2.545459, 0, 0.2039216, 1, 1,
0.286572, -0.8979914, 1.460148, 0, 0.1960784, 1, 1,
0.2940681, -1.138957, 3.721515, 0, 0.1882353, 1, 1,
0.297848, 1.133045, 0.9659733, 0, 0.1843137, 1, 1,
0.2994499, -0.2095724, 0.390436, 0, 0.1764706, 1, 1,
0.3040536, 2.77355, -0.6779541, 0, 0.172549, 1, 1,
0.3064082, 0.9200987, 0.05566207, 0, 0.1647059, 1, 1,
0.3108955, -1.273808, 4.356392, 0, 0.1607843, 1, 1,
0.3124513, 0.05961518, 2.451427, 0, 0.1529412, 1, 1,
0.3150642, -1.007994, 2.726054, 0, 0.1490196, 1, 1,
0.3185162, 0.004591283, 3.187493, 0, 0.1411765, 1, 1,
0.3211003, 1.920418, 0.4983419, 0, 0.1372549, 1, 1,
0.3260719, -0.3850248, 3.316981, 0, 0.1294118, 1, 1,
0.3317446, -0.06171922, 1.280956, 0, 0.1254902, 1, 1,
0.3349645, -0.7157119, 2.769472, 0, 0.1176471, 1, 1,
0.338162, 1.293007, 0.6597664, 0, 0.1137255, 1, 1,
0.3395664, 2.074406, -1.655101, 0, 0.1058824, 1, 1,
0.3403892, -0.4932092, 1.163911, 0, 0.09803922, 1, 1,
0.3412893, -0.1016567, 2.545261, 0, 0.09411765, 1, 1,
0.3463781, 0.9567348, -0.8130068, 0, 0.08627451, 1, 1,
0.3495994, -0.3853722, 3.642194, 0, 0.08235294, 1, 1,
0.3518229, -1.239295, 1.477128, 0, 0.07450981, 1, 1,
0.3542289, -1.041748, 2.717119, 0, 0.07058824, 1, 1,
0.3545437, 0.282223, 0.3402301, 0, 0.0627451, 1, 1,
0.3671451, 0.6383784, 2.472957, 0, 0.05882353, 1, 1,
0.3686502, 0.4206096, 0.6334916, 0, 0.05098039, 1, 1,
0.3700401, -1.866877, 1.088785, 0, 0.04705882, 1, 1,
0.3710915, 0.9915562, -0.3189483, 0, 0.03921569, 1, 1,
0.3716692, -0.03877657, 1.612769, 0, 0.03529412, 1, 1,
0.3720474, 0.429127, 0.1799878, 0, 0.02745098, 1, 1,
0.3720714, -1.645583, 2.970356, 0, 0.02352941, 1, 1,
0.3791706, 0.1544529, 1.871977, 0, 0.01568628, 1, 1,
0.3826703, 0.1534536, 1.683134, 0, 0.01176471, 1, 1,
0.3834355, 1.187707, 0.8352112, 0, 0.003921569, 1, 1,
0.3869122, 0.6307077, -0.4558942, 0.003921569, 0, 1, 1,
0.3919649, 0.7594936, 0.4214718, 0.007843138, 0, 1, 1,
0.3935138, -1.5218, 0.7551224, 0.01568628, 0, 1, 1,
0.3939568, -0.6464487, 3.186111, 0.01960784, 0, 1, 1,
0.3963509, 0.1219721, -1.42213, 0.02745098, 0, 1, 1,
0.3996751, -1.366175, 1.425047, 0.03137255, 0, 1, 1,
0.4021308, -1.777398, 2.654233, 0.03921569, 0, 1, 1,
0.4045632, -0.2069821, 3.036726, 0.04313726, 0, 1, 1,
0.4053894, -0.3157045, -0.355591, 0.05098039, 0, 1, 1,
0.4078101, 0.5065229, 2.14103, 0.05490196, 0, 1, 1,
0.4100307, 0.2299889, 1.193557, 0.0627451, 0, 1, 1,
0.4135531, -2.169252, 2.313402, 0.06666667, 0, 1, 1,
0.4157104, -1.267206, 2.971081, 0.07450981, 0, 1, 1,
0.4164577, -1.305191, 3.671606, 0.07843138, 0, 1, 1,
0.4165418, 1.615818, 1.322184, 0.08627451, 0, 1, 1,
0.4174988, -0.8592356, 3.006557, 0.09019608, 0, 1, 1,
0.417806, -0.2543055, 1.483181, 0.09803922, 0, 1, 1,
0.4185026, 0.7396601, 2.026168, 0.1058824, 0, 1, 1,
0.4186776, 1.391576, 0.6514103, 0.1098039, 0, 1, 1,
0.4226076, -0.3464369, 1.557023, 0.1176471, 0, 1, 1,
0.4233639, -0.4684165, 2.225498, 0.1215686, 0, 1, 1,
0.4237578, 0.5952855, 1.439991, 0.1294118, 0, 1, 1,
0.4249648, -1.018333, 2.229854, 0.1333333, 0, 1, 1,
0.4256318, 1.096606, -0.7301574, 0.1411765, 0, 1, 1,
0.4258491, 0.6308407, 1.429159, 0.145098, 0, 1, 1,
0.4277204, 0.0268133, 0.439512, 0.1529412, 0, 1, 1,
0.4309288, 1.022399, 0.9402787, 0.1568628, 0, 1, 1,
0.436224, 1.001693, -1.860797, 0.1647059, 0, 1, 1,
0.4367821, -0.7382483, 2.770471, 0.1686275, 0, 1, 1,
0.4372881, 1.118982, 0.3543591, 0.1764706, 0, 1, 1,
0.4380156, 0.01753751, 2.056046, 0.1803922, 0, 1, 1,
0.4413201, -1.606967, 3.993967, 0.1882353, 0, 1, 1,
0.4464322, 0.5304014, 0.2506451, 0.1921569, 0, 1, 1,
0.4501929, 0.7675745, -1.679302, 0.2, 0, 1, 1,
0.4531099, -0.01671099, -0.009833104, 0.2078431, 0, 1, 1,
0.4556567, 0.05934494, 1.196478, 0.2117647, 0, 1, 1,
0.4583428, -0.2569955, 0.5116113, 0.2196078, 0, 1, 1,
0.4646963, -0.1337055, 2.065812, 0.2235294, 0, 1, 1,
0.4655417, -0.4247152, 2.138829, 0.2313726, 0, 1, 1,
0.4665951, 1.660206, -0.5153767, 0.2352941, 0, 1, 1,
0.4677981, 0.4285425, 0.1459105, 0.2431373, 0, 1, 1,
0.4681019, 0.8944865, 0.2656244, 0.2470588, 0, 1, 1,
0.4697537, -0.255964, 3.240786, 0.254902, 0, 1, 1,
0.4717474, -0.1193696, 0.04813089, 0.2588235, 0, 1, 1,
0.4724565, 0.4474474, -0.6530257, 0.2666667, 0, 1, 1,
0.4789315, 0.0173987, 0.8889093, 0.2705882, 0, 1, 1,
0.4807656, 1.855628, 0.08378415, 0.2784314, 0, 1, 1,
0.4906308, -0.3882144, 1.368754, 0.282353, 0, 1, 1,
0.4910192, 0.621026, -0.3441832, 0.2901961, 0, 1, 1,
0.4934537, -1.239623, 1.101328, 0.2941177, 0, 1, 1,
0.5002148, -0.6064453, 1.53295, 0.3019608, 0, 1, 1,
0.505245, -1.425236, 2.330846, 0.3098039, 0, 1, 1,
0.5072337, 0.5970756, 0.3349017, 0.3137255, 0, 1, 1,
0.5144048, -0.1621995, 1.652041, 0.3215686, 0, 1, 1,
0.5210748, 0.7409577, 1.674834, 0.3254902, 0, 1, 1,
0.5269427, 0.9718289, -0.4723462, 0.3333333, 0, 1, 1,
0.5275092, 0.1335586, 0.8753763, 0.3372549, 0, 1, 1,
0.5417728, 1.743244, 0.7314743, 0.345098, 0, 1, 1,
0.5472874, -0.6692579, 3.882536, 0.3490196, 0, 1, 1,
0.5531299, -1.782779, 3.844681, 0.3568628, 0, 1, 1,
0.5561328, 1.543869, 0.1003689, 0.3607843, 0, 1, 1,
0.5567971, 0.288048, 1.443048, 0.3686275, 0, 1, 1,
0.5621657, -0.808194, 1.846701, 0.372549, 0, 1, 1,
0.5637689, 0.1594363, 0.436356, 0.3803922, 0, 1, 1,
0.5647617, -0.921468, 2.471039, 0.3843137, 0, 1, 1,
0.5674422, -0.9992937, 2.527833, 0.3921569, 0, 1, 1,
0.5701474, 1.498497, 0.4152936, 0.3960784, 0, 1, 1,
0.571084, -0.2241472, 1.363412, 0.4039216, 0, 1, 1,
0.5735536, 1.467927, 0.6958875, 0.4117647, 0, 1, 1,
0.5747372, -0.139503, 0.08047762, 0.4156863, 0, 1, 1,
0.5759739, -0.9052826, 3.576481, 0.4235294, 0, 1, 1,
0.5772815, -0.6211828, 2.893969, 0.427451, 0, 1, 1,
0.5827557, 0.106934, 3.214726, 0.4352941, 0, 1, 1,
0.5843561, -0.8246585, 4.103806, 0.4392157, 0, 1, 1,
0.5844145, -1.395442, 5.405565, 0.4470588, 0, 1, 1,
0.5864083, -1.395293, 1.923674, 0.4509804, 0, 1, 1,
0.5870348, 0.1780774, 1.904985, 0.4588235, 0, 1, 1,
0.5889025, -0.4233382, 2.284552, 0.4627451, 0, 1, 1,
0.5891402, 1.342167, 0.04918254, 0.4705882, 0, 1, 1,
0.5892577, -0.9906871, 2.657366, 0.4745098, 0, 1, 1,
0.590858, 0.1168579, -0.1514705, 0.4823529, 0, 1, 1,
0.5934741, 0.3882192, 0.8308265, 0.4862745, 0, 1, 1,
0.5983959, -1.086929, 1.024703, 0.4941176, 0, 1, 1,
0.5992584, -0.2158991, 1.920741, 0.5019608, 0, 1, 1,
0.6005245, 1.850123, -1.594545, 0.5058824, 0, 1, 1,
0.6068721, 3.512169, 1.721992, 0.5137255, 0, 1, 1,
0.6079736, -0.4350515, 2.950322, 0.5176471, 0, 1, 1,
0.6143368, 0.1533114, -0.4840866, 0.5254902, 0, 1, 1,
0.6147347, -0.2512909, 1.269226, 0.5294118, 0, 1, 1,
0.6149868, -0.5329691, 3.073035, 0.5372549, 0, 1, 1,
0.6189345, 0.3526732, 1.850665, 0.5411765, 0, 1, 1,
0.6209701, 0.07086407, 2.8852, 0.5490196, 0, 1, 1,
0.6304305, 0.261705, 0.9503177, 0.5529412, 0, 1, 1,
0.6316608, 0.1688429, 0.6379728, 0.5607843, 0, 1, 1,
0.6369023, 0.7735739, 1.877637, 0.5647059, 0, 1, 1,
0.638562, -0.4635607, -0.6901128, 0.572549, 0, 1, 1,
0.6391632, -0.1063422, 3.483191, 0.5764706, 0, 1, 1,
0.6431234, -0.9505427, 4.081228, 0.5843138, 0, 1, 1,
0.6473711, -0.624266, 2.430985, 0.5882353, 0, 1, 1,
0.6547737, -0.6264592, 1.80776, 0.5960785, 0, 1, 1,
0.6555808, 1.123363, 0.03593614, 0.6039216, 0, 1, 1,
0.6622589, 0.559285, 1.249372, 0.6078432, 0, 1, 1,
0.6700892, -1.492285, 3.897291, 0.6156863, 0, 1, 1,
0.6867749, 0.6411995, -0.6610762, 0.6196079, 0, 1, 1,
0.691472, -0.639955, 2.902413, 0.627451, 0, 1, 1,
0.69261, -1.108478, 1.39006, 0.6313726, 0, 1, 1,
0.695695, -0.3810176, 2.838054, 0.6392157, 0, 1, 1,
0.6976541, -0.06211528, 3.043252, 0.6431373, 0, 1, 1,
0.7006973, -0.4229385, 2.90982, 0.6509804, 0, 1, 1,
0.7009184, 0.3283143, 2.425128, 0.654902, 0, 1, 1,
0.7017911, -1.65454, 2.392221, 0.6627451, 0, 1, 1,
0.7088305, 2.321657, 1.084468, 0.6666667, 0, 1, 1,
0.733699, 1.874434, -0.6173492, 0.6745098, 0, 1, 1,
0.7401536, 0.2761966, 1.160376, 0.6784314, 0, 1, 1,
0.7462296, -0.4440938, 2.149438, 0.6862745, 0, 1, 1,
0.7524472, 0.1198067, 2.743347, 0.6901961, 0, 1, 1,
0.7525197, -0.1864871, 1.660442, 0.6980392, 0, 1, 1,
0.758169, 0.2514008, 1.440562, 0.7058824, 0, 1, 1,
0.7630446, 1.285229, 0.2628986, 0.7098039, 0, 1, 1,
0.7637771, -0.8092047, 1.589225, 0.7176471, 0, 1, 1,
0.7642168, -0.3407691, 3.448841, 0.7215686, 0, 1, 1,
0.7670289, -0.7963502, 1.81856, 0.7294118, 0, 1, 1,
0.7711228, 0.9104297, 0.9003383, 0.7333333, 0, 1, 1,
0.7723944, 0.2468113, 1.881802, 0.7411765, 0, 1, 1,
0.775412, -0.9157289, 2.455231, 0.7450981, 0, 1, 1,
0.7756412, 2.048701, 0.4463024, 0.7529412, 0, 1, 1,
0.7852082, 0.9860097, 2.128707, 0.7568628, 0, 1, 1,
0.7956995, 0.100768, 1.946166, 0.7647059, 0, 1, 1,
0.7964982, 0.1486727, 0.8871381, 0.7686275, 0, 1, 1,
0.7969824, 0.572078, 1.437217, 0.7764706, 0, 1, 1,
0.8057635, -0.9093671, 2.914346, 0.7803922, 0, 1, 1,
0.8058543, -0.9525649, 2.925316, 0.7882353, 0, 1, 1,
0.8062546, -0.9761423, 1.802493, 0.7921569, 0, 1, 1,
0.8147897, -1.415033, 2.378031, 0.8, 0, 1, 1,
0.8201612, -0.7519981, 2.422009, 0.8078431, 0, 1, 1,
0.8201919, 2.604631, 0.4425247, 0.8117647, 0, 1, 1,
0.8202834, -0.02477767, 2.491145, 0.8196079, 0, 1, 1,
0.822228, 1.685696, -1.523883, 0.8235294, 0, 1, 1,
0.8271379, -1.66337, 2.98283, 0.8313726, 0, 1, 1,
0.827419, -0.1540711, -0.2452896, 0.8352941, 0, 1, 1,
0.8285186, 0.9574683, 0.9141883, 0.8431373, 0, 1, 1,
0.8372407, 1.036955, 0.3945211, 0.8470588, 0, 1, 1,
0.8416609, 1.230058, 1.545511, 0.854902, 0, 1, 1,
0.8423166, 0.2360305, 1.049892, 0.8588235, 0, 1, 1,
0.8433478, -0.2276777, 1.78621, 0.8666667, 0, 1, 1,
0.8459899, 0.1662655, 3.226266, 0.8705882, 0, 1, 1,
0.8517418, -0.7857525, 1.667179, 0.8784314, 0, 1, 1,
0.8575152, 0.5272703, 0.4341344, 0.8823529, 0, 1, 1,
0.8587448, 1.294223, 1.287971, 0.8901961, 0, 1, 1,
0.8626809, 0.004418558, 2.845562, 0.8941177, 0, 1, 1,
0.8637614, 1.11088, -0.372333, 0.9019608, 0, 1, 1,
0.8667797, -1.505555, 2.828136, 0.9098039, 0, 1, 1,
0.8679336, 0.4561559, 2.308475, 0.9137255, 0, 1, 1,
0.8684442, 0.547052, 0.4530882, 0.9215686, 0, 1, 1,
0.8958012, 1.685659, -0.295946, 0.9254902, 0, 1, 1,
0.896017, -0.6946517, 3.346603, 0.9333333, 0, 1, 1,
0.8997139, -0.4623217, 1.721632, 0.9372549, 0, 1, 1,
0.902078, 1.793096, 1.086086, 0.945098, 0, 1, 1,
0.9027063, 0.02384099, 1.227073, 0.9490196, 0, 1, 1,
0.9044855, 0.6801944, 1.229279, 0.9568627, 0, 1, 1,
0.9073281, 0.7553009, 1.968615, 0.9607843, 0, 1, 1,
0.9098288, -1.592885, 2.775198, 0.9686275, 0, 1, 1,
0.9115338, 0.9075372, 0.8594558, 0.972549, 0, 1, 1,
0.9166514, 2.33674, 2.948113, 0.9803922, 0, 1, 1,
0.9167673, 0.05750043, 1.551849, 0.9843137, 0, 1, 1,
0.9261808, -0.1614133, 1.68977, 0.9921569, 0, 1, 1,
0.9294634, -0.9211948, 2.383734, 0.9960784, 0, 1, 1,
0.9325355, 0.0576035, 2.388609, 1, 0, 0.9960784, 1,
0.9332407, -1.185342, 2.913406, 1, 0, 0.9882353, 1,
0.9333117, 1.237039, 2.760632, 1, 0, 0.9843137, 1,
0.936514, -1.715426, 2.653728, 1, 0, 0.9764706, 1,
0.938615, -0.263997, 2.048723, 1, 0, 0.972549, 1,
0.9387299, 0.3400441, 1.298764, 1, 0, 0.9647059, 1,
0.9447228, -1.165843, 1.278382, 1, 0, 0.9607843, 1,
0.9529002, -0.9945359, 1.534019, 1, 0, 0.9529412, 1,
0.9693885, 0.06278352, 1.713836, 1, 0, 0.9490196, 1,
0.9755228, -0.5408346, 2.168776, 1, 0, 0.9411765, 1,
0.9773597, 1.566046, -0.8203753, 1, 0, 0.9372549, 1,
0.983607, -0.1585619, 0.9827018, 1, 0, 0.9294118, 1,
0.9846936, 2.193237, 0.9602392, 1, 0, 0.9254902, 1,
0.9850901, -0.8557464, 0.8059531, 1, 0, 0.9176471, 1,
0.9912419, 0.8047081, 1.324923, 1, 0, 0.9137255, 1,
1.00221, -0.5817728, 2.235362, 1, 0, 0.9058824, 1,
1.002251, 0.3450945, 0.4693377, 1, 0, 0.9019608, 1,
1.002693, -2.422562, 1.93827, 1, 0, 0.8941177, 1,
1.005481, 0.4022502, 1.956523, 1, 0, 0.8862745, 1,
1.02912, 0.2313766, 2.188886, 1, 0, 0.8823529, 1,
1.032806, 0.5920549, 1.816524, 1, 0, 0.8745098, 1,
1.033279, 0.3508218, 1.483004, 1, 0, 0.8705882, 1,
1.040745, -0.5609583, 2.67114, 1, 0, 0.8627451, 1,
1.047125, -0.910196, 1.740143, 1, 0, 0.8588235, 1,
1.048804, 0.7315021, 0.04828494, 1, 0, 0.8509804, 1,
1.050515, -0.7838385, 2.714582, 1, 0, 0.8470588, 1,
1.052801, 0.682733, 1.802583, 1, 0, 0.8392157, 1,
1.052889, 0.4399714, -0.0623253, 1, 0, 0.8352941, 1,
1.060636, -1.330069, 0.8106909, 1, 0, 0.827451, 1,
1.068099, -0.7376908, 2.19493, 1, 0, 0.8235294, 1,
1.076121, -1.212666, 1.538023, 1, 0, 0.8156863, 1,
1.076229, 0.607123, 0.2437333, 1, 0, 0.8117647, 1,
1.088509, -0.5340464, 1.706308, 1, 0, 0.8039216, 1,
1.095054, 0.26152, 0.2466972, 1, 0, 0.7960784, 1,
1.10018, -0.3644982, -0.04417112, 1, 0, 0.7921569, 1,
1.104815, 1.965069, 1.009577, 1, 0, 0.7843137, 1,
1.105827, -0.8298061, 3.413362, 1, 0, 0.7803922, 1,
1.107706, 0.02494843, 1.098972, 1, 0, 0.772549, 1,
1.107928, -0.0143635, 3.229443, 1, 0, 0.7686275, 1,
1.111713, 0.9609917, 1.217268, 1, 0, 0.7607843, 1,
1.113137, 0.621277, 0.7847836, 1, 0, 0.7568628, 1,
1.114583, 0.3979503, 2.271298, 1, 0, 0.7490196, 1,
1.120785, 0.09548629, 1.63892, 1, 0, 0.7450981, 1,
1.122127, -0.2825723, 2.378511, 1, 0, 0.7372549, 1,
1.127532, -0.5860541, 0.4426988, 1, 0, 0.7333333, 1,
1.128993, 2.421077, 2.755413, 1, 0, 0.7254902, 1,
1.129295, 0.5959827, 2.704732, 1, 0, 0.7215686, 1,
1.141703, -3.399992, 2.813124, 1, 0, 0.7137255, 1,
1.1449, 1.287655, 2.445316, 1, 0, 0.7098039, 1,
1.151367, 1.163428, 0.9955472, 1, 0, 0.7019608, 1,
1.15246, -0.1904777, 1.924231, 1, 0, 0.6941177, 1,
1.163516, -0.4008546, 1.990919, 1, 0, 0.6901961, 1,
1.167792, -0.3199532, 4.135, 1, 0, 0.682353, 1,
1.168544, 1.135383, 1.101369, 1, 0, 0.6784314, 1,
1.168816, -0.8041041, 2.817597, 1, 0, 0.6705883, 1,
1.172962, -1.087935, 1.066203, 1, 0, 0.6666667, 1,
1.187534, 0.2823645, 2.984552, 1, 0, 0.6588235, 1,
1.189438, -1.000489, 1.989344, 1, 0, 0.654902, 1,
1.196358, -1.791094, 3.521602, 1, 0, 0.6470588, 1,
1.205611, 0.5620157, 1.410965, 1, 0, 0.6431373, 1,
1.2147, 3.200762, 0.975686, 1, 0, 0.6352941, 1,
1.218004, 2.188618, -0.1048267, 1, 0, 0.6313726, 1,
1.22075, -0.5818947, 1.503044, 1, 0, 0.6235294, 1,
1.225562, -0.4998507, 1.806907, 1, 0, 0.6196079, 1,
1.227922, 0.02182028, 1.32976, 1, 0, 0.6117647, 1,
1.228086, -0.7638124, 2.165261, 1, 0, 0.6078432, 1,
1.240983, -0.3161851, 2.6646, 1, 0, 0.6, 1,
1.245332, 0.8904372, 1.901326, 1, 0, 0.5921569, 1,
1.246373, 0.7547964, 0.5614183, 1, 0, 0.5882353, 1,
1.247757, -1.29287, 1.786301, 1, 0, 0.5803922, 1,
1.271858, -1.710539, 0.9402153, 1, 0, 0.5764706, 1,
1.272759, -0.8222529, 1.427069, 1, 0, 0.5686275, 1,
1.289402, 1.380706, 0.9691134, 1, 0, 0.5647059, 1,
1.292363, -0.3482087, 2.316147, 1, 0, 0.5568628, 1,
1.294201, 1.843316, 0.3745364, 1, 0, 0.5529412, 1,
1.306819, -1.224579, 2.134266, 1, 0, 0.5450981, 1,
1.310884, 0.1197861, 0.2350081, 1, 0, 0.5411765, 1,
1.311683, -1.913085, 2.15934, 1, 0, 0.5333334, 1,
1.315382, -0.41611, 1.54015, 1, 0, 0.5294118, 1,
1.321614, -0.7333492, 0.7911979, 1, 0, 0.5215687, 1,
1.322608, -0.7305025, 1.961917, 1, 0, 0.5176471, 1,
1.329556, 0.5622322, 1.568177, 1, 0, 0.509804, 1,
1.33034, 0.1578255, 0.7395958, 1, 0, 0.5058824, 1,
1.331326, -0.8095563, 0.9058695, 1, 0, 0.4980392, 1,
1.335537, 0.05345402, 0.2580075, 1, 0, 0.4901961, 1,
1.366183, 0.5432855, 1.088914, 1, 0, 0.4862745, 1,
1.40684, -0.5842419, 1.381368, 1, 0, 0.4784314, 1,
1.40871, 1.643169, 1.286855, 1, 0, 0.4745098, 1,
1.428488, -0.1823526, 2.430272, 1, 0, 0.4666667, 1,
1.438719, 0.6766185, 0.5187374, 1, 0, 0.4627451, 1,
1.439268, 1.886038, 1.053545, 1, 0, 0.454902, 1,
1.443828, 2.164091, 1.070073, 1, 0, 0.4509804, 1,
1.450274, -0.5303134, 0.9100865, 1, 0, 0.4431373, 1,
1.458759, 1.043756, -0.4462285, 1, 0, 0.4392157, 1,
1.46377, -0.4202071, 3.081307, 1, 0, 0.4313726, 1,
1.464512, 0.1365117, 1.715336, 1, 0, 0.427451, 1,
1.464582, -0.8924164, 3.399662, 1, 0, 0.4196078, 1,
1.473331, -1.511112, 3.843366, 1, 0, 0.4156863, 1,
1.495261, -2.545522, 4.260894, 1, 0, 0.4078431, 1,
1.510028, 0.3468383, 1.97234, 1, 0, 0.4039216, 1,
1.511812, -1.657661, 2.377805, 1, 0, 0.3960784, 1,
1.513468, 0.4456935, 1.20734, 1, 0, 0.3882353, 1,
1.513694, -0.186928, 3.00236, 1, 0, 0.3843137, 1,
1.52905, 0.8728256, 2.008569, 1, 0, 0.3764706, 1,
1.535002, -0.8885935, 2.874364, 1, 0, 0.372549, 1,
1.547592, -1.249159, 2.994538, 1, 0, 0.3647059, 1,
1.558129, -0.7602939, 0.4207554, 1, 0, 0.3607843, 1,
1.558874, 1.187324, 3.364611, 1, 0, 0.3529412, 1,
1.566745, -1.745804, 2.951588, 1, 0, 0.3490196, 1,
1.57124, 1.221076, 2.0881, 1, 0, 0.3411765, 1,
1.582337, 0.2004441, 2.296221, 1, 0, 0.3372549, 1,
1.630752, 0.792676, -0.2440616, 1, 0, 0.3294118, 1,
1.634999, -1.474311, 2.414234, 1, 0, 0.3254902, 1,
1.637828, -0.426722, 3.022448, 1, 0, 0.3176471, 1,
1.64545, -1.144082, 4.307031, 1, 0, 0.3137255, 1,
1.659199, 0.1413559, 2.948339, 1, 0, 0.3058824, 1,
1.659303, -2.155038, 0.4007853, 1, 0, 0.2980392, 1,
1.661463, 0.06970888, 2.581427, 1, 0, 0.2941177, 1,
1.673187, 0.7633106, 1.526378, 1, 0, 0.2862745, 1,
1.682235, -1.064405, 1.134803, 1, 0, 0.282353, 1,
1.690613, 0.8490191, -0.5770801, 1, 0, 0.2745098, 1,
1.694892, 0.9912008, 1.594952, 1, 0, 0.2705882, 1,
1.696268, -0.9909658, 1.057292, 1, 0, 0.2627451, 1,
1.698781, 1.466006, 0.4820876, 1, 0, 0.2588235, 1,
1.732351, -1.089988, 2.327629, 1, 0, 0.2509804, 1,
1.735051, 0.2285325, 1.618575, 1, 0, 0.2470588, 1,
1.76093, 0.6914472, 0.400945, 1, 0, 0.2392157, 1,
1.762942, 0.6917211, 1.359462, 1, 0, 0.2352941, 1,
1.765475, -0.521905, 0.5247788, 1, 0, 0.227451, 1,
1.769023, -0.2779061, 2.307404, 1, 0, 0.2235294, 1,
1.775343, 1.506978, 2.552532, 1, 0, 0.2156863, 1,
1.77899, 0.2923314, 1.503698, 1, 0, 0.2117647, 1,
1.788676, -0.6941155, 1.551272, 1, 0, 0.2039216, 1,
1.810914, -0.4967715, 1.86398, 1, 0, 0.1960784, 1,
1.811455, 0.1021983, 2.097139, 1, 0, 0.1921569, 1,
1.814225, 1.963894, 0.9805161, 1, 0, 0.1843137, 1,
1.821445, -0.2076197, 1.440402, 1, 0, 0.1803922, 1,
1.862922, -1.324377, 3.413332, 1, 0, 0.172549, 1,
1.883893, -1.156708, 3.327035, 1, 0, 0.1686275, 1,
1.927933, 1.902428, 0.155301, 1, 0, 0.1607843, 1,
1.956915, 0.5272829, -1.005985, 1, 0, 0.1568628, 1,
1.987986, 0.002988807, 0.9306557, 1, 0, 0.1490196, 1,
2.027704, -0.03573802, 1.227684, 1, 0, 0.145098, 1,
2.054084, -1.339378, 2.020166, 1, 0, 0.1372549, 1,
2.062934, -0.04707692, 1.484212, 1, 0, 0.1333333, 1,
2.074241, -0.2095671, 2.151647, 1, 0, 0.1254902, 1,
2.142546, 0.6016679, -0.6276743, 1, 0, 0.1215686, 1,
2.150133, 0.0525603, 0.8385843, 1, 0, 0.1137255, 1,
2.163346, 1.497797, 0.6378734, 1, 0, 0.1098039, 1,
2.193038, -1.097972, 0.5203297, 1, 0, 0.1019608, 1,
2.201816, 0.687283, 1.420212, 1, 0, 0.09411765, 1,
2.274383, -0.6800131, 3.110434, 1, 0, 0.09019608, 1,
2.281147, -1.029845, 1.895813, 1, 0, 0.08235294, 1,
2.30185, 1.669051, 2.501112, 1, 0, 0.07843138, 1,
2.341239, 1.169057, 2.007107, 1, 0, 0.07058824, 1,
2.360183, -2.254024, 1.692106, 1, 0, 0.06666667, 1,
2.432761, -0.05930337, 2.367485, 1, 0, 0.05882353, 1,
2.562749, -0.9466329, 0.7182902, 1, 0, 0.05490196, 1,
2.678602, 0.1627006, -0.5406892, 1, 0, 0.04705882, 1,
2.894737, -1.408492, 2.341911, 1, 0, 0.04313726, 1,
2.927706, -0.03444054, 2.137335, 1, 0, 0.03529412, 1,
2.978163, 0.5390674, 1.111073, 1, 0, 0.03137255, 1,
3.110485, 0.8177699, 0.1186643, 1, 0, 0.02352941, 1,
3.371577, 1.158501, 0.9467988, 1, 0, 0.01960784, 1,
3.555904, -0.1411657, 0.8321299, 1, 0, 0.01176471, 1,
3.55615, 1.491231, 1.581604, 1, 0, 0.007843138, 1
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
-0.06595087, -5.537572, -7.223882, 0, -0.5, 0.5, 0.5,
-0.06595087, -5.537572, -7.223882, 1, -0.5, 0.5, 0.5,
-0.06595087, -5.537572, -7.223882, 1, 1.5, 0.5, 0.5,
-0.06595087, -5.537572, -7.223882, 0, 1.5, 0.5, 0.5
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
-4.915944, -0.3568956, -7.223882, 0, -0.5, 0.5, 0.5,
-4.915944, -0.3568956, -7.223882, 1, -0.5, 0.5, 0.5,
-4.915944, -0.3568956, -7.223882, 1, 1.5, 0.5, 0.5,
-4.915944, -0.3568956, -7.223882, 0, 1.5, 0.5, 0.5
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
-4.915944, -5.537572, 0.006057739, 0, -0.5, 0.5, 0.5,
-4.915944, -5.537572, 0.006057739, 1, -0.5, 0.5, 0.5,
-4.915944, -5.537572, 0.006057739, 1, 1.5, 0.5, 0.5,
-4.915944, -5.537572, 0.006057739, 0, 1.5, 0.5, 0.5
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
-2, -4.342031, -5.555435,
2, -4.342031, -5.555435,
-2, -4.342031, -5.555435,
-2, -4.541288, -5.833509,
0, -4.342031, -5.555435,
0, -4.541288, -5.833509,
2, -4.342031, -5.555435,
2, -4.541288, -5.833509
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
-2, -4.939802, -6.389658, 0, -0.5, 0.5, 0.5,
-2, -4.939802, -6.389658, 1, -0.5, 0.5, 0.5,
-2, -4.939802, -6.389658, 1, 1.5, 0.5, 0.5,
-2, -4.939802, -6.389658, 0, 1.5, 0.5, 0.5,
0, -4.939802, -6.389658, 0, -0.5, 0.5, 0.5,
0, -4.939802, -6.389658, 1, -0.5, 0.5, 0.5,
0, -4.939802, -6.389658, 1, 1.5, 0.5, 0.5,
0, -4.939802, -6.389658, 0, 1.5, 0.5, 0.5,
2, -4.939802, -6.389658, 0, -0.5, 0.5, 0.5,
2, -4.939802, -6.389658, 1, -0.5, 0.5, 0.5,
2, -4.939802, -6.389658, 1, 1.5, 0.5, 0.5,
2, -4.939802, -6.389658, 0, 1.5, 0.5, 0.5
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
-3.796715, -4, -5.555435,
-3.796715, 2, -5.555435,
-3.796715, -4, -5.555435,
-3.983253, -4, -5.833509,
-3.796715, -2, -5.555435,
-3.983253, -2, -5.833509,
-3.796715, 0, -5.555435,
-3.983253, 0, -5.833509,
-3.796715, 2, -5.555435,
-3.983253, 2, -5.833509
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
"-4",
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
-4.356329, -4, -6.389658, 0, -0.5, 0.5, 0.5,
-4.356329, -4, -6.389658, 1, -0.5, 0.5, 0.5,
-4.356329, -4, -6.389658, 1, 1.5, 0.5, 0.5,
-4.356329, -4, -6.389658, 0, 1.5, 0.5, 0.5,
-4.356329, -2, -6.389658, 0, -0.5, 0.5, 0.5,
-4.356329, -2, -6.389658, 1, -0.5, 0.5, 0.5,
-4.356329, -2, -6.389658, 1, 1.5, 0.5, 0.5,
-4.356329, -2, -6.389658, 0, 1.5, 0.5, 0.5,
-4.356329, 0, -6.389658, 0, -0.5, 0.5, 0.5,
-4.356329, 0, -6.389658, 1, -0.5, 0.5, 0.5,
-4.356329, 0, -6.389658, 1, 1.5, 0.5, 0.5,
-4.356329, 0, -6.389658, 0, 1.5, 0.5, 0.5,
-4.356329, 2, -6.389658, 0, -0.5, 0.5, 0.5,
-4.356329, 2, -6.389658, 1, -0.5, 0.5, 0.5,
-4.356329, 2, -6.389658, 1, 1.5, 0.5, 0.5,
-4.356329, 2, -6.389658, 0, 1.5, 0.5, 0.5
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
-3.796715, -4.342031, -4,
-3.796715, -4.342031, 4,
-3.796715, -4.342031, -4,
-3.983253, -4.541288, -4,
-3.796715, -4.342031, -2,
-3.983253, -4.541288, -2,
-3.796715, -4.342031, 0,
-3.983253, -4.541288, 0,
-3.796715, -4.342031, 2,
-3.983253, -4.541288, 2,
-3.796715, -4.342031, 4,
-3.983253, -4.541288, 4
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
-4.356329, -4.939802, -4, 0, -0.5, 0.5, 0.5,
-4.356329, -4.939802, -4, 1, -0.5, 0.5, 0.5,
-4.356329, -4.939802, -4, 1, 1.5, 0.5, 0.5,
-4.356329, -4.939802, -4, 0, 1.5, 0.5, 0.5,
-4.356329, -4.939802, -2, 0, -0.5, 0.5, 0.5,
-4.356329, -4.939802, -2, 1, -0.5, 0.5, 0.5,
-4.356329, -4.939802, -2, 1, 1.5, 0.5, 0.5,
-4.356329, -4.939802, -2, 0, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 0, 0, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 0, 1, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 0, 1, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 0, 0, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 2, 0, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 2, 1, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 2, 1, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 2, 0, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 4, 0, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 4, 1, -0.5, 0.5, 0.5,
-4.356329, -4.939802, 4, 1, 1.5, 0.5, 0.5,
-4.356329, -4.939802, 4, 0, 1.5, 0.5, 0.5
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
-3.796715, -4.342031, -5.555435,
-3.796715, 3.628241, -5.555435,
-3.796715, -4.342031, 5.56755,
-3.796715, 3.628241, 5.56755,
-3.796715, -4.342031, -5.555435,
-3.796715, -4.342031, 5.56755,
-3.796715, 3.628241, -5.555435,
-3.796715, 3.628241, 5.56755,
-3.796715, -4.342031, -5.555435,
3.664813, -4.342031, -5.555435,
-3.796715, -4.342031, 5.56755,
3.664813, -4.342031, 5.56755,
-3.796715, 3.628241, -5.555435,
3.664813, 3.628241, -5.555435,
-3.796715, 3.628241, 5.56755,
3.664813, 3.628241, 5.56755,
3.664813, -4.342031, -5.555435,
3.664813, 3.628241, -5.555435,
3.664813, -4.342031, 5.56755,
3.664813, 3.628241, 5.56755,
3.664813, -4.342031, -5.555435,
3.664813, -4.342031, 5.56755,
3.664813, 3.628241, -5.555435,
3.664813, 3.628241, 5.56755
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
var radius = 8.322571;
var distance = 37.02806;
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
mvMatrix.translate( 0.06595087, 0.3568956, -0.006057739 );
mvMatrix.scale( 1.20599, 1.129011, 0.8090029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.02806);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
nicotine_sulfate_1-m<-read.table("nicotine_sulfate_1-m.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nicotine_sulfate_1-m$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
```

```r
y<-nicotine_sulfate_1-m$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
```

```r
z<-nicotine_sulfate_1-m$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
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
-3.688052, -1.519063, -3.349232, 0, 0, 1, 1, 1,
-3.188612, 1.362106, -0.1082705, 1, 0, 0, 1, 1,
-3.062214, -0.30906, -1.575764, 1, 0, 0, 1, 1,
-2.749712, 0.7925191, -1.858428, 1, 0, 0, 1, 1,
-2.69652, -0.2199022, -3.687281, 1, 0, 0, 1, 1,
-2.671443, -0.1606051, -1.840528, 1, 0, 0, 1, 1,
-2.658442, 1.194774, -1.460358, 0, 0, 0, 1, 1,
-2.626447, 0.4994884, -1.240416, 0, 0, 0, 1, 1,
-2.616807, -0.254009, -3.341833, 0, 0, 0, 1, 1,
-2.597391, 1.648018, -0.9823416, 0, 0, 0, 1, 1,
-2.536644, 0.2161449, -2.134289, 0, 0, 0, 1, 1,
-2.510024, 0.1974225, -1.167387, 0, 0, 0, 1, 1,
-2.475938, -0.7623408, -1.598502, 0, 0, 0, 1, 1,
-2.300199, 0.2992754, -2.09728, 1, 1, 1, 1, 1,
-2.292117, 1.167008, -0.9033374, 1, 1, 1, 1, 1,
-2.235055, 0.6953388, 0.7191542, 1, 1, 1, 1, 1,
-2.223394, 0.6775922, -1.283953, 1, 1, 1, 1, 1,
-2.180568, -1.49783, -2.719791, 1, 1, 1, 1, 1,
-2.149074, 1.66165, -2.898354, 1, 1, 1, 1, 1,
-2.104916, 0.6735341, -2.638455, 1, 1, 1, 1, 1,
-2.104729, -0.6468268, -0.9813598, 1, 1, 1, 1, 1,
-2.091337, 0.054117, -1.830658, 1, 1, 1, 1, 1,
-2.090037, 0.05546658, -4.052909, 1, 1, 1, 1, 1,
-2.0658, -2.44734, -2.719477, 1, 1, 1, 1, 1,
-2.049922, 0.4790425, -0.9482124, 1, 1, 1, 1, 1,
-2.033031, 0.5352733, -1.595473, 1, 1, 1, 1, 1,
-2.023265, 0.02390768, -0.9885234, 1, 1, 1, 1, 1,
-1.946534, 1.407662, -1.764182, 1, 1, 1, 1, 1,
-1.920436, 0.931444, -0.4383093, 0, 0, 1, 1, 1,
-1.917306, 0.0950287, -3.627802, 1, 0, 0, 1, 1,
-1.910612, 0.7436787, -1.161138, 1, 0, 0, 1, 1,
-1.898752, -1.374216, -0.986734, 1, 0, 0, 1, 1,
-1.898683, 0.3992535, -1.608782, 1, 0, 0, 1, 1,
-1.871323, 0.8079629, -0.729249, 1, 0, 0, 1, 1,
-1.854903, 0.1973995, -1.779373, 0, 0, 0, 1, 1,
-1.837455, 0.6712109, -0.02404118, 0, 0, 0, 1, 1,
-1.816378, 0.4474662, -0.8724939, 0, 0, 0, 1, 1,
-1.802332, 0.1294266, -1.210752, 0, 0, 0, 1, 1,
-1.795979, 1.358087, -1.453348, 0, 0, 0, 1, 1,
-1.775486, 0.4994572, -0.3428319, 0, 0, 0, 1, 1,
-1.761023, -0.2692262, -3.561695, 0, 0, 0, 1, 1,
-1.758562, 0.1297234, -2.440317, 1, 1, 1, 1, 1,
-1.750944, -1.907437, -1.105248, 1, 1, 1, 1, 1,
-1.728963, -0.674621, -3.885747, 1, 1, 1, 1, 1,
-1.717706, -1.26525, -0.3393216, 1, 1, 1, 1, 1,
-1.701623, -0.1528469, -0.9178483, 1, 1, 1, 1, 1,
-1.69413, 0.09921151, -1.333672, 1, 1, 1, 1, 1,
-1.679489, 0.6893904, -1.69918, 1, 1, 1, 1, 1,
-1.678874, 0.0902565, -0.4685692, 1, 1, 1, 1, 1,
-1.675177, -0.3170151, -0.984465, 1, 1, 1, 1, 1,
-1.639818, 0.8224189, -0.4893785, 1, 1, 1, 1, 1,
-1.63804, 0.4423926, 0.7419031, 1, 1, 1, 1, 1,
-1.632197, -0.2653398, -1.857346, 1, 1, 1, 1, 1,
-1.624017, -0.1256619, -2.377884, 1, 1, 1, 1, 1,
-1.615311, 0.4002084, -2.091085, 1, 1, 1, 1, 1,
-1.608611, 0.3044747, -2.363185, 1, 1, 1, 1, 1,
-1.605437, -1.03041, -3.407401, 0, 0, 1, 1, 1,
-1.588526, -0.8984417, -1.940347, 1, 0, 0, 1, 1,
-1.580049, -1.381259, -2.587506, 1, 0, 0, 1, 1,
-1.57643, 0.1013056, -2.154562, 1, 0, 0, 1, 1,
-1.562311, -1.109704, -0.3310416, 1, 0, 0, 1, 1,
-1.55979, 1.025249, 1.085563, 1, 0, 0, 1, 1,
-1.554937, -0.1189923, -1.611939, 0, 0, 0, 1, 1,
-1.543785, -1.593933, -2.162082, 0, 0, 0, 1, 1,
-1.536055, 0.4447813, -0.4255877, 0, 0, 0, 1, 1,
-1.533162, 0.8199653, 0.1190137, 0, 0, 0, 1, 1,
-1.531374, -0.7598238, -2.158932, 0, 0, 0, 1, 1,
-1.529866, -1.79995, -1.964234, 0, 0, 0, 1, 1,
-1.523686, 0.01817401, -2.726238, 0, 0, 0, 1, 1,
-1.522715, 0.8061929, -0.6259826, 1, 1, 1, 1, 1,
-1.515921, -0.8286996, -0.5541592, 1, 1, 1, 1, 1,
-1.515081, -0.03205429, -1.879395, 1, 1, 1, 1, 1,
-1.51031, -0.522895, -3.10426, 1, 1, 1, 1, 1,
-1.505298, 1.461333, -0.7139027, 1, 1, 1, 1, 1,
-1.502147, -1.165661, -2.183713, 1, 1, 1, 1, 1,
-1.498427, 0.558279, -0.8574442, 1, 1, 1, 1, 1,
-1.496559, -1.368568, -2.100859, 1, 1, 1, 1, 1,
-1.495393, 0.1039246, -1.614287, 1, 1, 1, 1, 1,
-1.495389, -1.431689, -2.638535, 1, 1, 1, 1, 1,
-1.485054, -0.1878226, -1.179656, 1, 1, 1, 1, 1,
-1.482442, 0.8775892, -2.146546, 1, 1, 1, 1, 1,
-1.46459, 0.2570186, -0.7620274, 1, 1, 1, 1, 1,
-1.454398, 2.259561, -0.5766535, 1, 1, 1, 1, 1,
-1.452388, -0.5160062, -3.447286, 1, 1, 1, 1, 1,
-1.440734, 0.2427436, 0.2067821, 0, 0, 1, 1, 1,
-1.426782, -1.24071, -1.576458, 1, 0, 0, 1, 1,
-1.426662, 1.502463, -0.2818, 1, 0, 0, 1, 1,
-1.425483, -1.628126, -1.111938, 1, 0, 0, 1, 1,
-1.41962, 0.5766996, -1.584271, 1, 0, 0, 1, 1,
-1.407982, 0.6199595, -0.05767072, 1, 0, 0, 1, 1,
-1.381468, -0.1616298, -1.67234, 0, 0, 0, 1, 1,
-1.377864, 0.5513051, -0.3775361, 0, 0, 0, 1, 1,
-1.374952, 0.1595308, -0.327566, 0, 0, 0, 1, 1,
-1.372991, -0.5634438, -1.551012, 0, 0, 0, 1, 1,
-1.371557, 1.580199, -0.4001184, 0, 0, 0, 1, 1,
-1.370976, 1.147539, 0.1953453, 0, 0, 0, 1, 1,
-1.366718, 0.747474, -0.7088792, 0, 0, 0, 1, 1,
-1.340621, -0.9144028, -1.499561, 1, 1, 1, 1, 1,
-1.334655, 1.564859, -2.382421, 1, 1, 1, 1, 1,
-1.332692, 1.760576, 0.03799671, 1, 1, 1, 1, 1,
-1.331194, 0.1958202, -1.205294, 1, 1, 1, 1, 1,
-1.329993, 1.988893, -0.5314358, 1, 1, 1, 1, 1,
-1.321674, 1.516511, -1.211435, 1, 1, 1, 1, 1,
-1.321295, 0.7515101, -1.077122, 1, 1, 1, 1, 1,
-1.310852, -1.704582, -4.059429, 1, 1, 1, 1, 1,
-1.309395, 0.359874, -0.7596052, 1, 1, 1, 1, 1,
-1.307577, -0.5689029, 0.03228904, 1, 1, 1, 1, 1,
-1.306319, 1.534378, -0.4481315, 1, 1, 1, 1, 1,
-1.305895, 0.901203, -1.786514, 1, 1, 1, 1, 1,
-1.295178, -1.144899, -2.437286, 1, 1, 1, 1, 1,
-1.287636, 0.4293812, -1.605111, 1, 1, 1, 1, 1,
-1.284388, -2.010611, -1.487629, 1, 1, 1, 1, 1,
-1.282241, 0.7259802, -1.829398, 0, 0, 1, 1, 1,
-1.280875, -1.276138, -1.748038, 1, 0, 0, 1, 1,
-1.280706, -0.8854049, -3.386446, 1, 0, 0, 1, 1,
-1.279668, 1.638157, -0.5674689, 1, 0, 0, 1, 1,
-1.277652, 0.8861778, -1.039287, 1, 0, 0, 1, 1,
-1.27392, -2.060172, -2.232031, 1, 0, 0, 1, 1,
-1.271857, -1.594879, -2.373671, 0, 0, 0, 1, 1,
-1.270796, -0.5666823, -2.284155, 0, 0, 0, 1, 1,
-1.27079, 0.5261365, -0.5437064, 0, 0, 0, 1, 1,
-1.268388, 0.4315059, -1.092755, 0, 0, 0, 1, 1,
-1.261858, 0.07085759, -1.182933, 0, 0, 0, 1, 1,
-1.252481, -2.05681, -4.6303, 0, 0, 0, 1, 1,
-1.238747, 1.03394, -1.963861, 0, 0, 0, 1, 1,
-1.236839, 0.02994949, -1.997037, 1, 1, 1, 1, 1,
-1.228212, -0.0562603, -2.901788, 1, 1, 1, 1, 1,
-1.216717, -0.8016469, -1.414758, 1, 1, 1, 1, 1,
-1.2165, 0.7595593, -1.582342, 1, 1, 1, 1, 1,
-1.211391, 0.6457872, -1.152063, 1, 1, 1, 1, 1,
-1.200742, 0.09679478, -2.454508, 1, 1, 1, 1, 1,
-1.200457, -0.1006867, -1.144499, 1, 1, 1, 1, 1,
-1.19196, -2.398039, -1.824388, 1, 1, 1, 1, 1,
-1.190529, 0.9326464, -2.182962, 1, 1, 1, 1, 1,
-1.187867, 0.3074171, 0.6806336, 1, 1, 1, 1, 1,
-1.184972, -1.768905, -1.416028, 1, 1, 1, 1, 1,
-1.184607, 1.592192, -2.159084, 1, 1, 1, 1, 1,
-1.183355, -0.1362787, -1.484341, 1, 1, 1, 1, 1,
-1.182351, -0.129306, -1.26294, 1, 1, 1, 1, 1,
-1.18125, -0.133879, -3.69232, 1, 1, 1, 1, 1,
-1.177371, -0.8859082, -1.799757, 0, 0, 1, 1, 1,
-1.167745, -0.4242756, -1.431757, 1, 0, 0, 1, 1,
-1.161582, -0.2225409, -1.043054, 1, 0, 0, 1, 1,
-1.16031, 0.5628867, 0.4232003, 1, 0, 0, 1, 1,
-1.159739, 0.2598521, -0.3259041, 1, 0, 0, 1, 1,
-1.156805, 0.3935487, -2.041274, 1, 0, 0, 1, 1,
-1.143029, 1.5444, -1.889687, 0, 0, 0, 1, 1,
-1.140044, 0.4613383, -2.724792, 0, 0, 0, 1, 1,
-1.139428, 0.5653815, -1.887205, 0, 0, 0, 1, 1,
-1.135599, -0.02680007, -1.249534, 0, 0, 0, 1, 1,
-1.126702, -0.8628254, -1.974127, 0, 0, 0, 1, 1,
-1.122075, 0.2331391, -1.128263, 0, 0, 0, 1, 1,
-1.120873, 0.1340254, -1.019612, 0, 0, 0, 1, 1,
-1.116558, -0.6947326, -1.93559, 1, 1, 1, 1, 1,
-1.116376, -2.206695, -2.832544, 1, 1, 1, 1, 1,
-1.107563, -0.2211645, -4.800455, 1, 1, 1, 1, 1,
-1.107221, 1.408359, -2.325985, 1, 1, 1, 1, 1,
-1.104156, 0.2076483, -1.916474, 1, 1, 1, 1, 1,
-1.089911, 0.7969045, 0.1534415, 1, 1, 1, 1, 1,
-1.089037, -0.4665718, -2.686306, 1, 1, 1, 1, 1,
-1.08803, -0.9809759, -2.860144, 1, 1, 1, 1, 1,
-1.076364, -0.3761052, -2.631342, 1, 1, 1, 1, 1,
-1.066267, 0.271145, -2.363096, 1, 1, 1, 1, 1,
-1.064366, 1.154118, -0.12856, 1, 1, 1, 1, 1,
-1.063687, -0.2508751, -2.94166, 1, 1, 1, 1, 1,
-1.056861, -0.8978406, -3.738221, 1, 1, 1, 1, 1,
-1.047768, 2.732221, -1.917896, 1, 1, 1, 1, 1,
-1.042592, 0.867797, -2.34182, 1, 1, 1, 1, 1,
-1.042414, -1.399348, -4.15238, 0, 0, 1, 1, 1,
-1.041664, -1.882057, -1.108707, 1, 0, 0, 1, 1,
-1.038014, -1.171415, -2.310321, 1, 0, 0, 1, 1,
-1.029248, -0.8789537, -1.218096, 1, 0, 0, 1, 1,
-1.023384, -1.259218, -3.235594, 1, 0, 0, 1, 1,
-1.02037, 2.695515, -1.61208, 1, 0, 0, 1, 1,
-1.019429, 1.427852, -0.4534851, 0, 0, 0, 1, 1,
-1.018654, -0.9855523, -3.581956, 0, 0, 0, 1, 1,
-1.011524, 0.3686063, -3.053562, 0, 0, 0, 1, 1,
-1.009758, 0.1999877, -0.8978053, 0, 0, 0, 1, 1,
-0.9987875, -0.130719, -2.735343, 0, 0, 0, 1, 1,
-0.9957472, -0.7696207, -0.5666998, 0, 0, 0, 1, 1,
-0.9935363, -0.141343, -0.9194601, 0, 0, 0, 1, 1,
-0.9853684, 0.6459542, -0.8495857, 1, 1, 1, 1, 1,
-0.9831542, -0.06644204, -2.511815, 1, 1, 1, 1, 1,
-0.9798249, -0.9867744, -3.053761, 1, 1, 1, 1, 1,
-0.9743056, 1.008171, 0.2648751, 1, 1, 1, 1, 1,
-0.9680881, 0.6767699, -1.09108, 1, 1, 1, 1, 1,
-0.9666159, 1.147567, 0.7208582, 1, 1, 1, 1, 1,
-0.9636118, 0.7165903, -1.725726, 1, 1, 1, 1, 1,
-0.9614878, 0.8969584, 0.1552083, 1, 1, 1, 1, 1,
-0.9609309, -0.5969598, -0.5140752, 1, 1, 1, 1, 1,
-0.9568099, -0.3470971, 0.3425184, 1, 1, 1, 1, 1,
-0.9567096, -0.2952494, -0.2973168, 1, 1, 1, 1, 1,
-0.9557464, -0.4259724, -3.766576, 1, 1, 1, 1, 1,
-0.9537509, 1.654413, -1.689317, 1, 1, 1, 1, 1,
-0.9532434, 0.7356671, 0.3671134, 1, 1, 1, 1, 1,
-0.9523171, -0.07578865, -0.6096839, 1, 1, 1, 1, 1,
-0.9438978, -0.2000384, -1.618515, 0, 0, 1, 1, 1,
-0.9425216, -0.05606375, 0.4638342, 1, 0, 0, 1, 1,
-0.9417088, -0.3476399, -2.934816, 1, 0, 0, 1, 1,
-0.9407262, 1.612184, 1.142957, 1, 0, 0, 1, 1,
-0.940194, 0.5789517, -1.51226, 1, 0, 0, 1, 1,
-0.939324, 0.6360921, -1.015719, 1, 0, 0, 1, 1,
-0.9391434, 0.6125365, -1.529715, 0, 0, 0, 1, 1,
-0.9384964, 0.1965493, -2.689541, 0, 0, 0, 1, 1,
-0.9336575, 1.502925, -1.818691, 0, 0, 0, 1, 1,
-0.9335086, -0.6135879, -1.808905, 0, 0, 0, 1, 1,
-0.9321895, 2.198772, -0.8399028, 0, 0, 0, 1, 1,
-0.9309504, -0.5440578, -2.374749, 0, 0, 0, 1, 1,
-0.9303966, -0.4959212, -3.481921, 0, 0, 0, 1, 1,
-0.9282812, 0.5464631, -1.551552, 1, 1, 1, 1, 1,
-0.9261817, -0.2115848, -2.261252, 1, 1, 1, 1, 1,
-0.9115083, 1.488826, 0.1729029, 1, 1, 1, 1, 1,
-0.9082627, 0.9144484, -0.452084, 1, 1, 1, 1, 1,
-0.9075667, 1.712259, -1.164676, 1, 1, 1, 1, 1,
-0.9038244, -0.9926087, -1.114835, 1, 1, 1, 1, 1,
-0.8898879, -0.5828127, -4.40055, 1, 1, 1, 1, 1,
-0.8895283, 2.144708, -0.03705639, 1, 1, 1, 1, 1,
-0.8848683, 0.1827919, -1.733653, 1, 1, 1, 1, 1,
-0.8831595, 1.062985, -0.9569794, 1, 1, 1, 1, 1,
-0.8819491, -0.221911, -1.482058, 1, 1, 1, 1, 1,
-0.880307, -0.3347141, -2.124409, 1, 1, 1, 1, 1,
-0.8780127, 0.8128011, -2.297319, 1, 1, 1, 1, 1,
-0.8742593, -0.4624045, -3.56637, 1, 1, 1, 1, 1,
-0.8737372, 0.7242364, -1.650788, 1, 1, 1, 1, 1,
-0.8723726, 0.7965697, -0.6131656, 0, 0, 1, 1, 1,
-0.8718087, -0.2048222, -3.213996, 1, 0, 0, 1, 1,
-0.8692282, 1.454604, 2.133474, 1, 0, 0, 1, 1,
-0.8636109, 2.142046, 1.59214, 1, 0, 0, 1, 1,
-0.860751, -1.252955, -1.97674, 1, 0, 0, 1, 1,
-0.8577461, 0.9457895, -0.9858684, 1, 0, 0, 1, 1,
-0.8573626, -0.2086269, -0.6175397, 0, 0, 0, 1, 1,
-0.8427123, 0.7802564, 0.117585, 0, 0, 0, 1, 1,
-0.8425015, -0.08287884, -0.6551926, 0, 0, 0, 1, 1,
-0.8227701, 0.9354587, -2.280238, 0, 0, 0, 1, 1,
-0.8166868, 0.353873, -3.075443, 0, 0, 0, 1, 1,
-0.8164603, 0.5893469, 0.139319, 0, 0, 0, 1, 1,
-0.8121415, -0.6517357, -2.097207, 0, 0, 0, 1, 1,
-0.8116695, 0.266004, -1.747786, 1, 1, 1, 1, 1,
-0.8095279, -0.42225, -2.723151, 1, 1, 1, 1, 1,
-0.809454, -0.46377, -2.154914, 1, 1, 1, 1, 1,
-0.8060591, -1.363379, -2.294133, 1, 1, 1, 1, 1,
-0.8054433, 0.5141849, -0.4122548, 1, 1, 1, 1, 1,
-0.7880065, -1.732921, -4.191855, 1, 1, 1, 1, 1,
-0.787475, 0.5073522, 1.035725, 1, 1, 1, 1, 1,
-0.785928, -0.04994471, -1.365834, 1, 1, 1, 1, 1,
-0.7761095, 0.32744, -1.341408, 1, 1, 1, 1, 1,
-0.7746295, 0.455375, -0.8485211, 1, 1, 1, 1, 1,
-0.770894, -0.8934185, -2.945086, 1, 1, 1, 1, 1,
-0.7619407, -2.069983, -2.683376, 1, 1, 1, 1, 1,
-0.7618727, -2.081581, -0.2128049, 1, 1, 1, 1, 1,
-0.7606163, -2.149489, -3.664805, 1, 1, 1, 1, 1,
-0.7577956, -1.808104, -4.054389, 1, 1, 1, 1, 1,
-0.7566522, -1.030761, -2.476499, 0, 0, 1, 1, 1,
-0.7561402, -0.6930768, -1.325101, 1, 0, 0, 1, 1,
-0.7497624, 0.2624329, -1.977401, 1, 0, 0, 1, 1,
-0.7495744, -0.45883, -3.047467, 1, 0, 0, 1, 1,
-0.7487029, 1.479753, 0.0851228, 1, 0, 0, 1, 1,
-0.7344092, -0.414092, 0.1223876, 1, 0, 0, 1, 1,
-0.7323979, 0.2934825, -2.121773, 0, 0, 0, 1, 1,
-0.7284697, 1.550642, -0.2016359, 0, 0, 0, 1, 1,
-0.7196093, -1.631568, -2.124912, 0, 0, 0, 1, 1,
-0.7186349, -0.4250444, -4.447437, 0, 0, 0, 1, 1,
-0.7182016, -0.7450907, -2.074651, 0, 0, 0, 1, 1,
-0.7155012, 0.7376878, -0.4941909, 0, 0, 0, 1, 1,
-0.7151044, -0.9579308, -1.849634, 0, 0, 0, 1, 1,
-0.7122459, -0.2504102, -1.744007, 1, 1, 1, 1, 1,
-0.7104225, 2.108673, -2.507212, 1, 1, 1, 1, 1,
-0.7101241, -0.8396263, -0.289928, 1, 1, 1, 1, 1,
-0.7065394, 0.08064231, -1.933185, 1, 1, 1, 1, 1,
-0.7062932, -0.8344434, -2.682405, 1, 1, 1, 1, 1,
-0.7037746, -1.433813, -2.334838, 1, 1, 1, 1, 1,
-0.7007933, 0.3474492, 0.3869006, 1, 1, 1, 1, 1,
-0.6910617, 2.13365, -1.227827, 1, 1, 1, 1, 1,
-0.6850654, 0.2957203, -0.6641833, 1, 1, 1, 1, 1,
-0.6845478, -0.4836716, -3.07396, 1, 1, 1, 1, 1,
-0.6771271, -1.983369, -2.173693, 1, 1, 1, 1, 1,
-0.6743355, 1.100662, 0.6702796, 1, 1, 1, 1, 1,
-0.6736642, -1.431572, -1.968916, 1, 1, 1, 1, 1,
-0.6716051, 0.04152861, 0.07879587, 1, 1, 1, 1, 1,
-0.6707481, 1.748091, -0.4818818, 1, 1, 1, 1, 1,
-0.6645795, -0.6977147, -2.44134, 0, 0, 1, 1, 1,
-0.660149, -0.0456075, -2.207878, 1, 0, 0, 1, 1,
-0.6565809, 0.06429917, -0.2223434, 1, 0, 0, 1, 1,
-0.6549741, -0.2592846, -1.108087, 1, 0, 0, 1, 1,
-0.6539418, 0.2935865, -1.923589, 1, 0, 0, 1, 1,
-0.6427398, -0.4282326, -3.788514, 1, 0, 0, 1, 1,
-0.6266973, -1.38266, -3.629251, 0, 0, 0, 1, 1,
-0.6148669, -0.6072185, -2.415104, 0, 0, 0, 1, 1,
-0.6133879, -1.343358, -2.906255, 0, 0, 0, 1, 1,
-0.6119494, 0.09937052, -1.175928, 0, 0, 0, 1, 1,
-0.5989407, -0.9212444, -2.410975, 0, 0, 0, 1, 1,
-0.5944496, -1.65275, -2.055107, 0, 0, 0, 1, 1,
-0.5915689, -0.07573113, -1.566756, 0, 0, 0, 1, 1,
-0.5835732, -0.2333936, -1.810533, 1, 1, 1, 1, 1,
-0.582576, -0.5677291, -2.141253, 1, 1, 1, 1, 1,
-0.576137, 0.2304703, -0.1730797, 1, 1, 1, 1, 1,
-0.5723768, -1.368264, -1.059668, 1, 1, 1, 1, 1,
-0.5696483, 1.79005, 1.028448, 1, 1, 1, 1, 1,
-0.5681915, -0.9411793, -3.294177, 1, 1, 1, 1, 1,
-0.5680541, -0.7717554, -1.891159, 1, 1, 1, 1, 1,
-0.5655797, -1.220167, -0.7454098, 1, 1, 1, 1, 1,
-0.5631698, -0.07851078, -1.327811, 1, 1, 1, 1, 1,
-0.5625992, -0.4312933, -3.196871, 1, 1, 1, 1, 1,
-0.5576233, 0.210927, -1.669485, 1, 1, 1, 1, 1,
-0.5472776, -1.258711, -3.170541, 1, 1, 1, 1, 1,
-0.5460187, 0.2274625, -2.274068, 1, 1, 1, 1, 1,
-0.5457214, 2.045732, -0.778591, 1, 1, 1, 1, 1,
-0.5434986, 0.6298811, -1.50615, 1, 1, 1, 1, 1,
-0.543377, -0.007073156, -1.086752, 0, 0, 1, 1, 1,
-0.5418841, -0.3579067, -1.673355, 1, 0, 0, 1, 1,
-0.5408362, -1.34437, -4.08509, 1, 0, 0, 1, 1,
-0.5305768, -1.728162, -4.744426, 1, 0, 0, 1, 1,
-0.5259909, -1.112286, -3.940832, 1, 0, 0, 1, 1,
-0.5186282, 1.337097, -1.989798, 1, 0, 0, 1, 1,
-0.5043011, -0.495113, -2.538987, 0, 0, 0, 1, 1,
-0.4974213, 1.859188, -1.085421, 0, 0, 0, 1, 1,
-0.4970733, -2.620922, -1.03715, 0, 0, 0, 1, 1,
-0.4933849, -0.06551022, -1.790432, 0, 0, 0, 1, 1,
-0.4889113, -0.3612085, -2.867961, 0, 0, 0, 1, 1,
-0.4861695, 0.9905749, 1.051293, 0, 0, 0, 1, 1,
-0.4833973, -0.5724549, -3.597809, 0, 0, 0, 1, 1,
-0.4824722, -0.1024229, -1.270237, 1, 1, 1, 1, 1,
-0.4798551, 0.6075358, -1.464766, 1, 1, 1, 1, 1,
-0.4798198, 0.9789777, -1.141113, 1, 1, 1, 1, 1,
-0.4778637, 0.8409367, -0.01968538, 1, 1, 1, 1, 1,
-0.4772204, 1.92237, 0.715605, 1, 1, 1, 1, 1,
-0.4699184, 0.1083201, -2.161546, 1, 1, 1, 1, 1,
-0.4645118, 1.770678, 0.1868708, 1, 1, 1, 1, 1,
-0.4608633, 0.1391782, 0.2276911, 1, 1, 1, 1, 1,
-0.4592497, -2.0448, -2.426612, 1, 1, 1, 1, 1,
-0.4591863, 1.193323, -0.8275388, 1, 1, 1, 1, 1,
-0.454362, 0.05686259, -1.464261, 1, 1, 1, 1, 1,
-0.4465801, -0.3640096, -1.685511, 1, 1, 1, 1, 1,
-0.4367047, 1.279982, -0.1517215, 1, 1, 1, 1, 1,
-0.4327963, 0.4758738, -2.159683, 1, 1, 1, 1, 1,
-0.4282695, -0.04121362, -1.311361, 1, 1, 1, 1, 1,
-0.4255626, 1.937666, -1.076445, 0, 0, 1, 1, 1,
-0.425167, 0.6557365, 0.5385579, 1, 0, 0, 1, 1,
-0.4234063, -0.04821839, -1.595444, 1, 0, 0, 1, 1,
-0.4227163, 0.9852589, -1.646454, 1, 0, 0, 1, 1,
-0.4208142, -0.1556076, -2.911016, 1, 0, 0, 1, 1,
-0.418626, -1.81488, -3.492399, 1, 0, 0, 1, 1,
-0.4142026, -0.1227426, -1.000693, 0, 0, 0, 1, 1,
-0.4113725, -0.6427092, -2.862709, 0, 0, 0, 1, 1,
-0.4086658, -1.032869, -1.93949, 0, 0, 0, 1, 1,
-0.4023836, 0.2764006, -0.8867831, 0, 0, 0, 1, 1,
-0.4005176, 0.2018057, -1.629659, 0, 0, 0, 1, 1,
-0.398836, 1.649422, -1.101594, 0, 0, 0, 1, 1,
-0.3933924, -1.007287, -1.326085, 0, 0, 0, 1, 1,
-0.3928387, -0.5434135, -3.421973, 1, 1, 1, 1, 1,
-0.3914555, 0.09644578, -0.511479, 1, 1, 1, 1, 1,
-0.3904108, 0.2557488, 1.503741, 1, 1, 1, 1, 1,
-0.3847881, 0.1392698, -3.195591, 1, 1, 1, 1, 1,
-0.3792104, 0.6209306, -1.325113, 1, 1, 1, 1, 1,
-0.3754298, 0.4848047, -1.237272, 1, 1, 1, 1, 1,
-0.3752552, 0.2369451, -3.041284, 1, 1, 1, 1, 1,
-0.3734345, 1.746146, -0.6042354, 1, 1, 1, 1, 1,
-0.3701465, -0.2923269, -2.966971, 1, 1, 1, 1, 1,
-0.3690766, 0.6658638, -0.3548186, 1, 1, 1, 1, 1,
-0.3690537, -0.9891385, -3.23697, 1, 1, 1, 1, 1,
-0.3688401, 0.9398938, 0.3362556, 1, 1, 1, 1, 1,
-0.3645914, -1.242477, -3.52216, 1, 1, 1, 1, 1,
-0.3572236, -0.6019526, -2.920535, 1, 1, 1, 1, 1,
-0.3553718, -0.9515471, -1.254988, 1, 1, 1, 1, 1,
-0.3513299, 0.6599684, 0.1920389, 0, 0, 1, 1, 1,
-0.3476223, -0.9526167, -4.666432, 1, 0, 0, 1, 1,
-0.3450311, -0.02241245, -3.309371, 1, 0, 0, 1, 1,
-0.3449611, 0.1233239, -3.753358, 1, 0, 0, 1, 1,
-0.3445176, -0.5933246, -2.159586, 1, 0, 0, 1, 1,
-0.3397841, 0.1648225, -1.701889, 1, 0, 0, 1, 1,
-0.3391118, 0.6938965, -0.06368049, 0, 0, 0, 1, 1,
-0.3364474, 1.557682, -1.091994, 0, 0, 0, 1, 1,
-0.3357864, -1.640302, -3.906129, 0, 0, 0, 1, 1,
-0.3310852, -0.1037494, -0.9779129, 0, 0, 0, 1, 1,
-0.3303626, -0.8552179, -4.461819, 0, 0, 0, 1, 1,
-0.3251716, -0.06136437, -1.885681, 0, 0, 0, 1, 1,
-0.3248883, 0.2807386, 0.1660361, 0, 0, 0, 1, 1,
-0.3213327, -0.2460477, -3.114487, 1, 1, 1, 1, 1,
-0.3179128, -0.612681, -2.246186, 1, 1, 1, 1, 1,
-0.3153549, -0.2334684, -1.43722, 1, 1, 1, 1, 1,
-0.3144046, -0.2123152, -2.631027, 1, 1, 1, 1, 1,
-0.314122, 0.2708927, -0.6956822, 1, 1, 1, 1, 1,
-0.3087054, 0.3801924, 0.8812962, 1, 1, 1, 1, 1,
-0.3016058, 0.1102094, 1.01713, 1, 1, 1, 1, 1,
-0.3011831, -1.440772, -1.334956, 1, 1, 1, 1, 1,
-0.2946143, -1.457368, -2.59615, 1, 1, 1, 1, 1,
-0.2863842, 1.66523, 0.08867659, 1, 1, 1, 1, 1,
-0.2856282, 0.04720961, -2.607119, 1, 1, 1, 1, 1,
-0.2834397, -1.417881, -3.849158, 1, 1, 1, 1, 1,
-0.2815097, 0.3583927, 0.5762681, 1, 1, 1, 1, 1,
-0.2782757, -0.4665524, -3.508392, 1, 1, 1, 1, 1,
-0.2712863, 2.351142, 0.6256454, 1, 1, 1, 1, 1,
-0.2635307, -0.9883938, -3.309241, 0, 0, 1, 1, 1,
-0.2592212, -0.7174295, -4.549225, 1, 0, 0, 1, 1,
-0.2584568, -0.2375124, -2.917883, 1, 0, 0, 1, 1,
-0.2521226, -0.3007648, -1.617386, 1, 0, 0, 1, 1,
-0.2440532, -2.448486, -0.7357344, 1, 0, 0, 1, 1,
-0.2438513, 0.7410941, 0.532411, 1, 0, 0, 1, 1,
-0.2345194, 0.8875197, 0.1970176, 0, 0, 0, 1, 1,
-0.2329374, 1.445235, 0.1493936, 0, 0, 0, 1, 1,
-0.2200966, 0.9916718, 0.1569075, 0, 0, 0, 1, 1,
-0.2197567, 0.8327016, -1.305814, 0, 0, 0, 1, 1,
-0.2154672, -0.9272323, -3.968357, 0, 0, 0, 1, 1,
-0.2147444, 1.807921, 0.1451392, 0, 0, 0, 1, 1,
-0.2126431, 0.3909656, -1.513633, 0, 0, 0, 1, 1,
-0.2124202, 0.7554669, -1.133567, 1, 1, 1, 1, 1,
-0.2114952, -0.6554092, -4.602118, 1, 1, 1, 1, 1,
-0.2088149, 0.8677767, -0.4308786, 1, 1, 1, 1, 1,
-0.2077826, -2.187934, -3.141325, 1, 1, 1, 1, 1,
-0.2014485, -0.2886958, -3.13771, 1, 1, 1, 1, 1,
-0.1976615, -0.07924961, -2.42483, 1, 1, 1, 1, 1,
-0.1944069, -0.9251362, -1.47703, 1, 1, 1, 1, 1,
-0.1941202, -0.5756198, -3.51966, 1, 1, 1, 1, 1,
-0.192382, -0.5253404, -1.754422, 1, 1, 1, 1, 1,
-0.1917999, -0.1836899, -2.618785, 1, 1, 1, 1, 1,
-0.1837306, -0.3058555, -1.348444, 1, 1, 1, 1, 1,
-0.1818387, 0.5600403, -3.03117, 1, 1, 1, 1, 1,
-0.1782948, -0.7218155, -3.464715, 1, 1, 1, 1, 1,
-0.1776957, 0.5732719, -0.2779881, 1, 1, 1, 1, 1,
-0.1771383, -0.6570355, -2.167825, 1, 1, 1, 1, 1,
-0.1749511, 0.4020121, -0.07450061, 0, 0, 1, 1, 1,
-0.1743475, 0.2956202, -0.823994, 1, 0, 0, 1, 1,
-0.1708336, -0.6380976, -2.083531, 1, 0, 0, 1, 1,
-0.1693549, -0.2452516, -3.717439, 1, 0, 0, 1, 1,
-0.1683062, -1.491051, -3.215053, 1, 0, 0, 1, 1,
-0.1647214, -0.2038912, -2.79898, 1, 0, 0, 1, 1,
-0.1641165, -3.653291, -3.840425, 0, 0, 0, 1, 1,
-0.1631137, -1.200859, -1.729205, 0, 0, 0, 1, 1,
-0.1630506, -4.22596, -3.159277, 0, 0, 0, 1, 1,
-0.1620669, -1.08759, -3.53082, 0, 0, 0, 1, 1,
-0.1499885, -1.118853, -4.750309, 0, 0, 0, 1, 1,
-0.1498693, -0.0190356, -0.4231231, 0, 0, 0, 1, 1,
-0.1485727, 1.688543, -0.778829, 0, 0, 0, 1, 1,
-0.1461422, 0.608429, -0.9569406, 1, 1, 1, 1, 1,
-0.1393349, 0.09412751, -0.5110397, 1, 1, 1, 1, 1,
-0.1374319, -1.702261, -3.272961, 1, 1, 1, 1, 1,
-0.1360121, -1.791486, -3.842461, 1, 1, 1, 1, 1,
-0.133833, -0.6244102, -2.20433, 1, 1, 1, 1, 1,
-0.1335282, 0.5452994, 0.09920298, 1, 1, 1, 1, 1,
-0.1333213, -0.8953814, -1.790637, 1, 1, 1, 1, 1,
-0.1318454, 1.467931, 0.6485897, 1, 1, 1, 1, 1,
-0.1312236, -0.9229634, -3.136765, 1, 1, 1, 1, 1,
-0.1274711, -2.581757, -4.93367, 1, 1, 1, 1, 1,
-0.1273605, 1.770202, 2.065545, 1, 1, 1, 1, 1,
-0.1247214, -0.251633, -3.630506, 1, 1, 1, 1, 1,
-0.1244325, -1.48226, -3.124878, 1, 1, 1, 1, 1,
-0.1219536, -0.02187984, -3.008831, 1, 1, 1, 1, 1,
-0.1149469, -0.3655668, -4.335284, 1, 1, 1, 1, 1,
-0.106787, 1.389353, -0.571268, 0, 0, 1, 1, 1,
-0.1048171, -0.3789218, -1.98876, 1, 0, 0, 1, 1,
-0.1000615, 0.1133808, 0.4970525, 1, 0, 0, 1, 1,
-0.09801079, -0.8345242, -5.393449, 1, 0, 0, 1, 1,
-0.0963148, -2.809914, -3.36534, 1, 0, 0, 1, 1,
-0.08646479, -0.2535132, -2.524033, 1, 0, 0, 1, 1,
-0.08532042, 2.093635, 1.038647, 0, 0, 0, 1, 1,
-0.08354402, -0.7609698, -3.254708, 0, 0, 0, 1, 1,
-0.08285925, -0.1528129, -3.329287, 0, 0, 0, 1, 1,
-0.07803592, 0.8970716, 0.6400324, 0, 0, 0, 1, 1,
-0.07717736, -0.4612939, -2.642797, 0, 0, 0, 1, 1,
-0.07570421, 0.8914127, 0.2475853, 0, 0, 0, 1, 1,
-0.07501182, 0.206044, -1.568935, 0, 0, 0, 1, 1,
-0.07299224, 0.3926308, -0.005748279, 1, 1, 1, 1, 1,
-0.06414916, 1.723722, -0.3478591, 1, 1, 1, 1, 1,
-0.060927, -0.7907252, -1.2655, 1, 1, 1, 1, 1,
-0.06020296, 0.1010349, -1.447081, 1, 1, 1, 1, 1,
-0.05995739, 0.6790562, -1.247923, 1, 1, 1, 1, 1,
-0.05858902, 0.271313, -0.2618323, 1, 1, 1, 1, 1,
-0.05683349, 0.2445733, -0.5678276, 1, 1, 1, 1, 1,
-0.05608786, -2.72415, -2.188187, 1, 1, 1, 1, 1,
-0.04862349, -0.5357153, -4.187555, 1, 1, 1, 1, 1,
-0.0474874, 0.5054168, -0.1867019, 1, 1, 1, 1, 1,
-0.04710951, 1.605064, -0.3479402, 1, 1, 1, 1, 1,
-0.04629923, -0.1794458, -2.710329, 1, 1, 1, 1, 1,
-0.0461832, -0.2441161, -3.360415, 1, 1, 1, 1, 1,
-0.04602305, 1.072061, -1.141977, 1, 1, 1, 1, 1,
-0.04485875, 0.2182873, 1.150569, 1, 1, 1, 1, 1,
-0.04262412, -0.2198724, -1.28716, 0, 0, 1, 1, 1,
-0.04212806, 0.3277856, -0.1505299, 1, 0, 0, 1, 1,
-0.03733741, -0.544305, -2.195904, 1, 0, 0, 1, 1,
-0.03052313, 1.826349, 0.04233298, 1, 0, 0, 1, 1,
-0.01905509, 0.7618275, -0.8298113, 1, 0, 0, 1, 1,
-0.01662687, -0.09649224, -4.423583, 1, 0, 0, 1, 1,
-0.01658395, 1.891668, -0.8304913, 0, 0, 0, 1, 1,
-0.01655304, 0.3953581, 0.1778606, 0, 0, 0, 1, 1,
-0.01577711, -1.231706, -3.4618, 0, 0, 0, 1, 1,
-0.01142729, -0.8038438, -5.198517, 0, 0, 0, 1, 1,
-0.00907155, 0.3241826, -0.7370749, 0, 0, 0, 1, 1,
-0.00760095, -0.6772989, -2.168226, 0, 0, 0, 1, 1,
-0.006913915, -0.1759492, -3.873859, 0, 0, 0, 1, 1,
-0.005559105, 0.324797, 0.9566871, 1, 1, 1, 1, 1,
-0.004437139, -1.303518, -3.578906, 1, 1, 1, 1, 1,
-0.0001121976, 1.181008, 0.5416592, 1, 1, 1, 1, 1,
0.00399109, -0.2344913, 2.746497, 1, 1, 1, 1, 1,
0.004311667, 0.137483, 2.546166, 1, 1, 1, 1, 1,
0.00482576, -1.129697, 2.847104, 1, 1, 1, 1, 1,
0.004827087, 0.5224589, 0.7225561, 1, 1, 1, 1, 1,
0.007688765, -0.7525787, 5.115638, 1, 1, 1, 1, 1,
0.01024024, -1.407712, 3.706258, 1, 1, 1, 1, 1,
0.01637871, 1.590088, 1.059381, 1, 1, 1, 1, 1,
0.01709287, 0.7351696, 0.7698084, 1, 1, 1, 1, 1,
0.02006611, -1.10559, 2.656575, 1, 1, 1, 1, 1,
0.02113964, -0.01714858, 2.026361, 1, 1, 1, 1, 1,
0.02242953, 0.4681177, 0.6081457, 1, 1, 1, 1, 1,
0.02527938, -0.009127317, 2.4334, 1, 1, 1, 1, 1,
0.02780975, 0.8273963, -0.7721225, 0, 0, 1, 1, 1,
0.02883122, -0.1709902, 2.137264, 1, 0, 0, 1, 1,
0.03069737, -0.623533, 5.356863, 1, 0, 0, 1, 1,
0.0311996, -0.7318712, 2.230195, 1, 0, 0, 1, 1,
0.03193718, -0.2267163, 1.799544, 1, 0, 0, 1, 1,
0.03288391, 0.350337, -0.2859963, 1, 0, 0, 1, 1,
0.03957672, 0.02107169, 0.7454107, 0, 0, 0, 1, 1,
0.04240566, 0.7547638, 1.103779, 0, 0, 0, 1, 1,
0.04392561, 0.8732741, 0.3445863, 0, 0, 0, 1, 1,
0.04657147, 0.1933711, -1.210716, 0, 0, 0, 1, 1,
0.05344307, -0.3405316, 2.144349, 0, 0, 0, 1, 1,
0.05608129, 0.3179518, -0.5963591, 0, 0, 0, 1, 1,
0.05630369, 0.7166296, -1.561912, 0, 0, 0, 1, 1,
0.05693254, -1.990769, 1.757166, 1, 1, 1, 1, 1,
0.06013939, -0.5850384, 4.057746, 1, 1, 1, 1, 1,
0.06253495, -0.5988924, 3.808353, 1, 1, 1, 1, 1,
0.0670024, 0.1293925, -0.1510106, 1, 1, 1, 1, 1,
0.07186636, 0.3244302, 1.220885, 1, 1, 1, 1, 1,
0.07481848, 0.2365098, -0.9572393, 1, 1, 1, 1, 1,
0.07698903, -2.99349, 2.324781, 1, 1, 1, 1, 1,
0.07708697, 1.0839, -0.1295307, 1, 1, 1, 1, 1,
0.07848497, -0.1756674, 2.946863, 1, 1, 1, 1, 1,
0.0791994, -0.4867836, 2.67022, 1, 1, 1, 1, 1,
0.08006506, 0.6551712, 0.9596409, 1, 1, 1, 1, 1,
0.08216978, 0.08823919, 1.337784, 1, 1, 1, 1, 1,
0.08345643, -1.143452, 3.858641, 1, 1, 1, 1, 1,
0.08629905, 0.002656557, 2.916938, 1, 1, 1, 1, 1,
0.0865987, 0.0646034, 1.524153, 1, 1, 1, 1, 1,
0.08897607, 1.682806, 0.4322769, 0, 0, 1, 1, 1,
0.09141198, 1.10726, 1.155632, 1, 0, 0, 1, 1,
0.09192936, -1.67964, 1.318356, 1, 0, 0, 1, 1,
0.09338743, 1.361427, 1.380299, 1, 0, 0, 1, 1,
0.09402919, -0.3902788, 3.358165, 1, 0, 0, 1, 1,
0.09548549, 0.05585788, 2.876233, 1, 0, 0, 1, 1,
0.09560371, -0.1452522, 3.79291, 0, 0, 0, 1, 1,
0.09569604, 0.04085724, 2.1418, 0, 0, 0, 1, 1,
0.0957071, 0.9917975, -0.1527487, 0, 0, 0, 1, 1,
0.0957972, -0.3929404, 3.877817, 0, 0, 0, 1, 1,
0.09831271, -0.6694136, 3.021717, 0, 0, 0, 1, 1,
0.100336, -2.974852, 4.446855, 0, 0, 0, 1, 1,
0.1093278, 0.7573932, 1.263671, 0, 0, 0, 1, 1,
0.1098936, -0.7986515, 3.402458, 1, 1, 1, 1, 1,
0.1113541, -0.2126631, 1.076195, 1, 1, 1, 1, 1,
0.116563, -0.7998565, 2.423386, 1, 1, 1, 1, 1,
0.116932, 0.6197343, 0.5605513, 1, 1, 1, 1, 1,
0.1181998, -0.003701198, 2.303329, 1, 1, 1, 1, 1,
0.1199987, 0.7564949, 0.4246684, 1, 1, 1, 1, 1,
0.1213649, -0.7632626, 2.514104, 1, 1, 1, 1, 1,
0.1216154, -1.744196, 3.656674, 1, 1, 1, 1, 1,
0.1252765, 0.5696702, 0.4492537, 1, 1, 1, 1, 1,
0.1273856, -0.6879693, 3.640727, 1, 1, 1, 1, 1,
0.1287054, 2.651978, -0.8592269, 1, 1, 1, 1, 1,
0.1289461, 1.073311, 0.2614627, 1, 1, 1, 1, 1,
0.1298284, -0.491514, 2.368753, 1, 1, 1, 1, 1,
0.1300456, 0.3177381, -0.2192457, 1, 1, 1, 1, 1,
0.1329592, -0.3300617, 3.239836, 1, 1, 1, 1, 1,
0.1349879, -1.23447, 3.170612, 0, 0, 1, 1, 1,
0.1362238, -0.9405964, 4.925528, 1, 0, 0, 1, 1,
0.1364609, -0.2608749, 2.023629, 1, 0, 0, 1, 1,
0.1402556, 0.2148767, 1.407128, 1, 0, 0, 1, 1,
0.1411381, 0.6044678, 1.034083, 1, 0, 0, 1, 1,
0.143016, -0.951206, 4.077336, 1, 0, 0, 1, 1,
0.1467409, -0.360218, 3.75164, 0, 0, 0, 1, 1,
0.1472411, 2.049489, -0.3679007, 0, 0, 0, 1, 1,
0.1485314, 0.447009, 0.331629, 0, 0, 0, 1, 1,
0.1603358, 0.8924771, 0.07875161, 0, 0, 0, 1, 1,
0.1615043, 1.052522, 0.6994246, 0, 0, 0, 1, 1,
0.1622896, 0.6924905, -0.2049596, 0, 0, 0, 1, 1,
0.1646406, -0.2281162, 3.106039, 0, 0, 0, 1, 1,
0.1657065, 0.6640206, 1.535321, 1, 1, 1, 1, 1,
0.1685133, -1.236479, 4.455703, 1, 1, 1, 1, 1,
0.1698245, -2.009013, 3.820452, 1, 1, 1, 1, 1,
0.1735673, -0.7515249, 3.60756, 1, 1, 1, 1, 1,
0.1746283, 0.8372555, 1.250546, 1, 1, 1, 1, 1,
0.1748701, -1.265975, 3.983573, 1, 1, 1, 1, 1,
0.1757967, -0.4734339, 3.125677, 1, 1, 1, 1, 1,
0.1790176, 1.226526, -0.2625681, 1, 1, 1, 1, 1,
0.1806209, -0.7226273, 4.437879, 1, 1, 1, 1, 1,
0.1830344, -0.6403617, 2.411106, 1, 1, 1, 1, 1,
0.1862403, -1.653349, 1.77274, 1, 1, 1, 1, 1,
0.1869978, -0.01850692, 0.8942491, 1, 1, 1, 1, 1,
0.1919105, 0.03430429, 1.353856, 1, 1, 1, 1, 1,
0.1926496, -0.4930156, 3.046304, 1, 1, 1, 1, 1,
0.1969106, -1.25649, 1.904992, 1, 1, 1, 1, 1,
0.1976883, -0.2485776, 4.407507, 0, 0, 1, 1, 1,
0.2003786, -1.859235, 3.369014, 1, 0, 0, 1, 1,
0.203463, 1.941289, -0.1790616, 1, 0, 0, 1, 1,
0.2053758, 0.08113654, 0.3164403, 1, 0, 0, 1, 1,
0.2060139, 1.397003, -0.02279709, 1, 0, 0, 1, 1,
0.2062652, 0.03854723, 1.723245, 1, 0, 0, 1, 1,
0.2103571, -0.08963995, 0.9724283, 0, 0, 0, 1, 1,
0.2113364, -0.05257951, 2.742672, 0, 0, 0, 1, 1,
0.2169691, 0.3587236, 0.2474734, 0, 0, 0, 1, 1,
0.2187976, -1.717206, 2.989297, 0, 0, 0, 1, 1,
0.2222528, 1.069474, 0.2713493, 0, 0, 0, 1, 1,
0.2223793, -0.4738406, 2.910628, 0, 0, 0, 1, 1,
0.2230803, 0.2766344, -0.1483852, 0, 0, 0, 1, 1,
0.223332, 0.120134, 1.600096, 1, 1, 1, 1, 1,
0.2244486, -0.1630367, 3.025066, 1, 1, 1, 1, 1,
0.2267552, 0.6366667, -0.7881172, 1, 1, 1, 1, 1,
0.2270792, -1.176306, 2.563857, 1, 1, 1, 1, 1,
0.2281103, 0.7867844, 2.0606, 1, 1, 1, 1, 1,
0.2284648, -0.7175226, 3.787816, 1, 1, 1, 1, 1,
0.229627, 1.084627, -0.6319232, 1, 1, 1, 1, 1,
0.2325989, -0.07258794, 0.3927231, 1, 1, 1, 1, 1,
0.2338153, 1.105794, -0.8162562, 1, 1, 1, 1, 1,
0.2352847, -1.977299, 3.392792, 1, 1, 1, 1, 1,
0.2356037, 0.7024026, 1.5309, 1, 1, 1, 1, 1,
0.2372821, -1.182908, 3.50711, 1, 1, 1, 1, 1,
0.2387084, -0.05403346, 2.308571, 1, 1, 1, 1, 1,
0.2414847, 1.335162, 0.1120933, 1, 1, 1, 1, 1,
0.2436235, 0.07831523, 1.456778, 1, 1, 1, 1, 1,
0.2450475, 0.7912371, -0.008608012, 0, 0, 1, 1, 1,
0.2456027, 0.6208691, 0.1096863, 1, 0, 0, 1, 1,
0.2457548, 1.207011, -0.5393617, 1, 0, 0, 1, 1,
0.2469038, 0.4533755, 0.8885959, 1, 0, 0, 1, 1,
0.2510385, 0.4684258, 0.473399, 1, 0, 0, 1, 1,
0.2524085, 1.218533, 0.5798291, 1, 0, 0, 1, 1,
0.2526291, -0.4764242, 1.46313, 0, 0, 0, 1, 1,
0.2561291, 1.361023, -0.8070205, 0, 0, 0, 1, 1,
0.2589741, -1.758989, 2.555489, 0, 0, 0, 1, 1,
0.2680753, 0.1592315, -0.8775911, 0, 0, 0, 1, 1,
0.2688698, -0.5484927, 4.670464, 0, 0, 0, 1, 1,
0.2733149, -0.4703106, 2.794254, 0, 0, 0, 1, 1,
0.2740719, -0.4745012, 2.579732, 0, 0, 0, 1, 1,
0.2765926, 1.58929, 0.9208544, 1, 1, 1, 1, 1,
0.2779662, -2.39479, 2.875471, 1, 1, 1, 1, 1,
0.2804169, -0.9139357, 2.565202, 1, 1, 1, 1, 1,
0.2847952, -0.02880857, 3.347742, 1, 1, 1, 1, 1,
0.285683, 0.08311439, 2.545459, 1, 1, 1, 1, 1,
0.286572, -0.8979914, 1.460148, 1, 1, 1, 1, 1,
0.2940681, -1.138957, 3.721515, 1, 1, 1, 1, 1,
0.297848, 1.133045, 0.9659733, 1, 1, 1, 1, 1,
0.2994499, -0.2095724, 0.390436, 1, 1, 1, 1, 1,
0.3040536, 2.77355, -0.6779541, 1, 1, 1, 1, 1,
0.3064082, 0.9200987, 0.05566207, 1, 1, 1, 1, 1,
0.3108955, -1.273808, 4.356392, 1, 1, 1, 1, 1,
0.3124513, 0.05961518, 2.451427, 1, 1, 1, 1, 1,
0.3150642, -1.007994, 2.726054, 1, 1, 1, 1, 1,
0.3185162, 0.004591283, 3.187493, 1, 1, 1, 1, 1,
0.3211003, 1.920418, 0.4983419, 0, 0, 1, 1, 1,
0.3260719, -0.3850248, 3.316981, 1, 0, 0, 1, 1,
0.3317446, -0.06171922, 1.280956, 1, 0, 0, 1, 1,
0.3349645, -0.7157119, 2.769472, 1, 0, 0, 1, 1,
0.338162, 1.293007, 0.6597664, 1, 0, 0, 1, 1,
0.3395664, 2.074406, -1.655101, 1, 0, 0, 1, 1,
0.3403892, -0.4932092, 1.163911, 0, 0, 0, 1, 1,
0.3412893, -0.1016567, 2.545261, 0, 0, 0, 1, 1,
0.3463781, 0.9567348, -0.8130068, 0, 0, 0, 1, 1,
0.3495994, -0.3853722, 3.642194, 0, 0, 0, 1, 1,
0.3518229, -1.239295, 1.477128, 0, 0, 0, 1, 1,
0.3542289, -1.041748, 2.717119, 0, 0, 0, 1, 1,
0.3545437, 0.282223, 0.3402301, 0, 0, 0, 1, 1,
0.3671451, 0.6383784, 2.472957, 1, 1, 1, 1, 1,
0.3686502, 0.4206096, 0.6334916, 1, 1, 1, 1, 1,
0.3700401, -1.866877, 1.088785, 1, 1, 1, 1, 1,
0.3710915, 0.9915562, -0.3189483, 1, 1, 1, 1, 1,
0.3716692, -0.03877657, 1.612769, 1, 1, 1, 1, 1,
0.3720474, 0.429127, 0.1799878, 1, 1, 1, 1, 1,
0.3720714, -1.645583, 2.970356, 1, 1, 1, 1, 1,
0.3791706, 0.1544529, 1.871977, 1, 1, 1, 1, 1,
0.3826703, 0.1534536, 1.683134, 1, 1, 1, 1, 1,
0.3834355, 1.187707, 0.8352112, 1, 1, 1, 1, 1,
0.3869122, 0.6307077, -0.4558942, 1, 1, 1, 1, 1,
0.3919649, 0.7594936, 0.4214718, 1, 1, 1, 1, 1,
0.3935138, -1.5218, 0.7551224, 1, 1, 1, 1, 1,
0.3939568, -0.6464487, 3.186111, 1, 1, 1, 1, 1,
0.3963509, 0.1219721, -1.42213, 1, 1, 1, 1, 1,
0.3996751, -1.366175, 1.425047, 0, 0, 1, 1, 1,
0.4021308, -1.777398, 2.654233, 1, 0, 0, 1, 1,
0.4045632, -0.2069821, 3.036726, 1, 0, 0, 1, 1,
0.4053894, -0.3157045, -0.355591, 1, 0, 0, 1, 1,
0.4078101, 0.5065229, 2.14103, 1, 0, 0, 1, 1,
0.4100307, 0.2299889, 1.193557, 1, 0, 0, 1, 1,
0.4135531, -2.169252, 2.313402, 0, 0, 0, 1, 1,
0.4157104, -1.267206, 2.971081, 0, 0, 0, 1, 1,
0.4164577, -1.305191, 3.671606, 0, 0, 0, 1, 1,
0.4165418, 1.615818, 1.322184, 0, 0, 0, 1, 1,
0.4174988, -0.8592356, 3.006557, 0, 0, 0, 1, 1,
0.417806, -0.2543055, 1.483181, 0, 0, 0, 1, 1,
0.4185026, 0.7396601, 2.026168, 0, 0, 0, 1, 1,
0.4186776, 1.391576, 0.6514103, 1, 1, 1, 1, 1,
0.4226076, -0.3464369, 1.557023, 1, 1, 1, 1, 1,
0.4233639, -0.4684165, 2.225498, 1, 1, 1, 1, 1,
0.4237578, 0.5952855, 1.439991, 1, 1, 1, 1, 1,
0.4249648, -1.018333, 2.229854, 1, 1, 1, 1, 1,
0.4256318, 1.096606, -0.7301574, 1, 1, 1, 1, 1,
0.4258491, 0.6308407, 1.429159, 1, 1, 1, 1, 1,
0.4277204, 0.0268133, 0.439512, 1, 1, 1, 1, 1,
0.4309288, 1.022399, 0.9402787, 1, 1, 1, 1, 1,
0.436224, 1.001693, -1.860797, 1, 1, 1, 1, 1,
0.4367821, -0.7382483, 2.770471, 1, 1, 1, 1, 1,
0.4372881, 1.118982, 0.3543591, 1, 1, 1, 1, 1,
0.4380156, 0.01753751, 2.056046, 1, 1, 1, 1, 1,
0.4413201, -1.606967, 3.993967, 1, 1, 1, 1, 1,
0.4464322, 0.5304014, 0.2506451, 1, 1, 1, 1, 1,
0.4501929, 0.7675745, -1.679302, 0, 0, 1, 1, 1,
0.4531099, -0.01671099, -0.009833104, 1, 0, 0, 1, 1,
0.4556567, 0.05934494, 1.196478, 1, 0, 0, 1, 1,
0.4583428, -0.2569955, 0.5116113, 1, 0, 0, 1, 1,
0.4646963, -0.1337055, 2.065812, 1, 0, 0, 1, 1,
0.4655417, -0.4247152, 2.138829, 1, 0, 0, 1, 1,
0.4665951, 1.660206, -0.5153767, 0, 0, 0, 1, 1,
0.4677981, 0.4285425, 0.1459105, 0, 0, 0, 1, 1,
0.4681019, 0.8944865, 0.2656244, 0, 0, 0, 1, 1,
0.4697537, -0.255964, 3.240786, 0, 0, 0, 1, 1,
0.4717474, -0.1193696, 0.04813089, 0, 0, 0, 1, 1,
0.4724565, 0.4474474, -0.6530257, 0, 0, 0, 1, 1,
0.4789315, 0.0173987, 0.8889093, 0, 0, 0, 1, 1,
0.4807656, 1.855628, 0.08378415, 1, 1, 1, 1, 1,
0.4906308, -0.3882144, 1.368754, 1, 1, 1, 1, 1,
0.4910192, 0.621026, -0.3441832, 1, 1, 1, 1, 1,
0.4934537, -1.239623, 1.101328, 1, 1, 1, 1, 1,
0.5002148, -0.6064453, 1.53295, 1, 1, 1, 1, 1,
0.505245, -1.425236, 2.330846, 1, 1, 1, 1, 1,
0.5072337, 0.5970756, 0.3349017, 1, 1, 1, 1, 1,
0.5144048, -0.1621995, 1.652041, 1, 1, 1, 1, 1,
0.5210748, 0.7409577, 1.674834, 1, 1, 1, 1, 1,
0.5269427, 0.9718289, -0.4723462, 1, 1, 1, 1, 1,
0.5275092, 0.1335586, 0.8753763, 1, 1, 1, 1, 1,
0.5417728, 1.743244, 0.7314743, 1, 1, 1, 1, 1,
0.5472874, -0.6692579, 3.882536, 1, 1, 1, 1, 1,
0.5531299, -1.782779, 3.844681, 1, 1, 1, 1, 1,
0.5561328, 1.543869, 0.1003689, 1, 1, 1, 1, 1,
0.5567971, 0.288048, 1.443048, 0, 0, 1, 1, 1,
0.5621657, -0.808194, 1.846701, 1, 0, 0, 1, 1,
0.5637689, 0.1594363, 0.436356, 1, 0, 0, 1, 1,
0.5647617, -0.921468, 2.471039, 1, 0, 0, 1, 1,
0.5674422, -0.9992937, 2.527833, 1, 0, 0, 1, 1,
0.5701474, 1.498497, 0.4152936, 1, 0, 0, 1, 1,
0.571084, -0.2241472, 1.363412, 0, 0, 0, 1, 1,
0.5735536, 1.467927, 0.6958875, 0, 0, 0, 1, 1,
0.5747372, -0.139503, 0.08047762, 0, 0, 0, 1, 1,
0.5759739, -0.9052826, 3.576481, 0, 0, 0, 1, 1,
0.5772815, -0.6211828, 2.893969, 0, 0, 0, 1, 1,
0.5827557, 0.106934, 3.214726, 0, 0, 0, 1, 1,
0.5843561, -0.8246585, 4.103806, 0, 0, 0, 1, 1,
0.5844145, -1.395442, 5.405565, 1, 1, 1, 1, 1,
0.5864083, -1.395293, 1.923674, 1, 1, 1, 1, 1,
0.5870348, 0.1780774, 1.904985, 1, 1, 1, 1, 1,
0.5889025, -0.4233382, 2.284552, 1, 1, 1, 1, 1,
0.5891402, 1.342167, 0.04918254, 1, 1, 1, 1, 1,
0.5892577, -0.9906871, 2.657366, 1, 1, 1, 1, 1,
0.590858, 0.1168579, -0.1514705, 1, 1, 1, 1, 1,
0.5934741, 0.3882192, 0.8308265, 1, 1, 1, 1, 1,
0.5983959, -1.086929, 1.024703, 1, 1, 1, 1, 1,
0.5992584, -0.2158991, 1.920741, 1, 1, 1, 1, 1,
0.6005245, 1.850123, -1.594545, 1, 1, 1, 1, 1,
0.6068721, 3.512169, 1.721992, 1, 1, 1, 1, 1,
0.6079736, -0.4350515, 2.950322, 1, 1, 1, 1, 1,
0.6143368, 0.1533114, -0.4840866, 1, 1, 1, 1, 1,
0.6147347, -0.2512909, 1.269226, 1, 1, 1, 1, 1,
0.6149868, -0.5329691, 3.073035, 0, 0, 1, 1, 1,
0.6189345, 0.3526732, 1.850665, 1, 0, 0, 1, 1,
0.6209701, 0.07086407, 2.8852, 1, 0, 0, 1, 1,
0.6304305, 0.261705, 0.9503177, 1, 0, 0, 1, 1,
0.6316608, 0.1688429, 0.6379728, 1, 0, 0, 1, 1,
0.6369023, 0.7735739, 1.877637, 1, 0, 0, 1, 1,
0.638562, -0.4635607, -0.6901128, 0, 0, 0, 1, 1,
0.6391632, -0.1063422, 3.483191, 0, 0, 0, 1, 1,
0.6431234, -0.9505427, 4.081228, 0, 0, 0, 1, 1,
0.6473711, -0.624266, 2.430985, 0, 0, 0, 1, 1,
0.6547737, -0.6264592, 1.80776, 0, 0, 0, 1, 1,
0.6555808, 1.123363, 0.03593614, 0, 0, 0, 1, 1,
0.6622589, 0.559285, 1.249372, 0, 0, 0, 1, 1,
0.6700892, -1.492285, 3.897291, 1, 1, 1, 1, 1,
0.6867749, 0.6411995, -0.6610762, 1, 1, 1, 1, 1,
0.691472, -0.639955, 2.902413, 1, 1, 1, 1, 1,
0.69261, -1.108478, 1.39006, 1, 1, 1, 1, 1,
0.695695, -0.3810176, 2.838054, 1, 1, 1, 1, 1,
0.6976541, -0.06211528, 3.043252, 1, 1, 1, 1, 1,
0.7006973, -0.4229385, 2.90982, 1, 1, 1, 1, 1,
0.7009184, 0.3283143, 2.425128, 1, 1, 1, 1, 1,
0.7017911, -1.65454, 2.392221, 1, 1, 1, 1, 1,
0.7088305, 2.321657, 1.084468, 1, 1, 1, 1, 1,
0.733699, 1.874434, -0.6173492, 1, 1, 1, 1, 1,
0.7401536, 0.2761966, 1.160376, 1, 1, 1, 1, 1,
0.7462296, -0.4440938, 2.149438, 1, 1, 1, 1, 1,
0.7524472, 0.1198067, 2.743347, 1, 1, 1, 1, 1,
0.7525197, -0.1864871, 1.660442, 1, 1, 1, 1, 1,
0.758169, 0.2514008, 1.440562, 0, 0, 1, 1, 1,
0.7630446, 1.285229, 0.2628986, 1, 0, 0, 1, 1,
0.7637771, -0.8092047, 1.589225, 1, 0, 0, 1, 1,
0.7642168, -0.3407691, 3.448841, 1, 0, 0, 1, 1,
0.7670289, -0.7963502, 1.81856, 1, 0, 0, 1, 1,
0.7711228, 0.9104297, 0.9003383, 1, 0, 0, 1, 1,
0.7723944, 0.2468113, 1.881802, 0, 0, 0, 1, 1,
0.775412, -0.9157289, 2.455231, 0, 0, 0, 1, 1,
0.7756412, 2.048701, 0.4463024, 0, 0, 0, 1, 1,
0.7852082, 0.9860097, 2.128707, 0, 0, 0, 1, 1,
0.7956995, 0.100768, 1.946166, 0, 0, 0, 1, 1,
0.7964982, 0.1486727, 0.8871381, 0, 0, 0, 1, 1,
0.7969824, 0.572078, 1.437217, 0, 0, 0, 1, 1,
0.8057635, -0.9093671, 2.914346, 1, 1, 1, 1, 1,
0.8058543, -0.9525649, 2.925316, 1, 1, 1, 1, 1,
0.8062546, -0.9761423, 1.802493, 1, 1, 1, 1, 1,
0.8147897, -1.415033, 2.378031, 1, 1, 1, 1, 1,
0.8201612, -0.7519981, 2.422009, 1, 1, 1, 1, 1,
0.8201919, 2.604631, 0.4425247, 1, 1, 1, 1, 1,
0.8202834, -0.02477767, 2.491145, 1, 1, 1, 1, 1,
0.822228, 1.685696, -1.523883, 1, 1, 1, 1, 1,
0.8271379, -1.66337, 2.98283, 1, 1, 1, 1, 1,
0.827419, -0.1540711, -0.2452896, 1, 1, 1, 1, 1,
0.8285186, 0.9574683, 0.9141883, 1, 1, 1, 1, 1,
0.8372407, 1.036955, 0.3945211, 1, 1, 1, 1, 1,
0.8416609, 1.230058, 1.545511, 1, 1, 1, 1, 1,
0.8423166, 0.2360305, 1.049892, 1, 1, 1, 1, 1,
0.8433478, -0.2276777, 1.78621, 1, 1, 1, 1, 1,
0.8459899, 0.1662655, 3.226266, 0, 0, 1, 1, 1,
0.8517418, -0.7857525, 1.667179, 1, 0, 0, 1, 1,
0.8575152, 0.5272703, 0.4341344, 1, 0, 0, 1, 1,
0.8587448, 1.294223, 1.287971, 1, 0, 0, 1, 1,
0.8626809, 0.004418558, 2.845562, 1, 0, 0, 1, 1,
0.8637614, 1.11088, -0.372333, 1, 0, 0, 1, 1,
0.8667797, -1.505555, 2.828136, 0, 0, 0, 1, 1,
0.8679336, 0.4561559, 2.308475, 0, 0, 0, 1, 1,
0.8684442, 0.547052, 0.4530882, 0, 0, 0, 1, 1,
0.8958012, 1.685659, -0.295946, 0, 0, 0, 1, 1,
0.896017, -0.6946517, 3.346603, 0, 0, 0, 1, 1,
0.8997139, -0.4623217, 1.721632, 0, 0, 0, 1, 1,
0.902078, 1.793096, 1.086086, 0, 0, 0, 1, 1,
0.9027063, 0.02384099, 1.227073, 1, 1, 1, 1, 1,
0.9044855, 0.6801944, 1.229279, 1, 1, 1, 1, 1,
0.9073281, 0.7553009, 1.968615, 1, 1, 1, 1, 1,
0.9098288, -1.592885, 2.775198, 1, 1, 1, 1, 1,
0.9115338, 0.9075372, 0.8594558, 1, 1, 1, 1, 1,
0.9166514, 2.33674, 2.948113, 1, 1, 1, 1, 1,
0.9167673, 0.05750043, 1.551849, 1, 1, 1, 1, 1,
0.9261808, -0.1614133, 1.68977, 1, 1, 1, 1, 1,
0.9294634, -0.9211948, 2.383734, 1, 1, 1, 1, 1,
0.9325355, 0.0576035, 2.388609, 1, 1, 1, 1, 1,
0.9332407, -1.185342, 2.913406, 1, 1, 1, 1, 1,
0.9333117, 1.237039, 2.760632, 1, 1, 1, 1, 1,
0.936514, -1.715426, 2.653728, 1, 1, 1, 1, 1,
0.938615, -0.263997, 2.048723, 1, 1, 1, 1, 1,
0.9387299, 0.3400441, 1.298764, 1, 1, 1, 1, 1,
0.9447228, -1.165843, 1.278382, 0, 0, 1, 1, 1,
0.9529002, -0.9945359, 1.534019, 1, 0, 0, 1, 1,
0.9693885, 0.06278352, 1.713836, 1, 0, 0, 1, 1,
0.9755228, -0.5408346, 2.168776, 1, 0, 0, 1, 1,
0.9773597, 1.566046, -0.8203753, 1, 0, 0, 1, 1,
0.983607, -0.1585619, 0.9827018, 1, 0, 0, 1, 1,
0.9846936, 2.193237, 0.9602392, 0, 0, 0, 1, 1,
0.9850901, -0.8557464, 0.8059531, 0, 0, 0, 1, 1,
0.9912419, 0.8047081, 1.324923, 0, 0, 0, 1, 1,
1.00221, -0.5817728, 2.235362, 0, 0, 0, 1, 1,
1.002251, 0.3450945, 0.4693377, 0, 0, 0, 1, 1,
1.002693, -2.422562, 1.93827, 0, 0, 0, 1, 1,
1.005481, 0.4022502, 1.956523, 0, 0, 0, 1, 1,
1.02912, 0.2313766, 2.188886, 1, 1, 1, 1, 1,
1.032806, 0.5920549, 1.816524, 1, 1, 1, 1, 1,
1.033279, 0.3508218, 1.483004, 1, 1, 1, 1, 1,
1.040745, -0.5609583, 2.67114, 1, 1, 1, 1, 1,
1.047125, -0.910196, 1.740143, 1, 1, 1, 1, 1,
1.048804, 0.7315021, 0.04828494, 1, 1, 1, 1, 1,
1.050515, -0.7838385, 2.714582, 1, 1, 1, 1, 1,
1.052801, 0.682733, 1.802583, 1, 1, 1, 1, 1,
1.052889, 0.4399714, -0.0623253, 1, 1, 1, 1, 1,
1.060636, -1.330069, 0.8106909, 1, 1, 1, 1, 1,
1.068099, -0.7376908, 2.19493, 1, 1, 1, 1, 1,
1.076121, -1.212666, 1.538023, 1, 1, 1, 1, 1,
1.076229, 0.607123, 0.2437333, 1, 1, 1, 1, 1,
1.088509, -0.5340464, 1.706308, 1, 1, 1, 1, 1,
1.095054, 0.26152, 0.2466972, 1, 1, 1, 1, 1,
1.10018, -0.3644982, -0.04417112, 0, 0, 1, 1, 1,
1.104815, 1.965069, 1.009577, 1, 0, 0, 1, 1,
1.105827, -0.8298061, 3.413362, 1, 0, 0, 1, 1,
1.107706, 0.02494843, 1.098972, 1, 0, 0, 1, 1,
1.107928, -0.0143635, 3.229443, 1, 0, 0, 1, 1,
1.111713, 0.9609917, 1.217268, 1, 0, 0, 1, 1,
1.113137, 0.621277, 0.7847836, 0, 0, 0, 1, 1,
1.114583, 0.3979503, 2.271298, 0, 0, 0, 1, 1,
1.120785, 0.09548629, 1.63892, 0, 0, 0, 1, 1,
1.122127, -0.2825723, 2.378511, 0, 0, 0, 1, 1,
1.127532, -0.5860541, 0.4426988, 0, 0, 0, 1, 1,
1.128993, 2.421077, 2.755413, 0, 0, 0, 1, 1,
1.129295, 0.5959827, 2.704732, 0, 0, 0, 1, 1,
1.141703, -3.399992, 2.813124, 1, 1, 1, 1, 1,
1.1449, 1.287655, 2.445316, 1, 1, 1, 1, 1,
1.151367, 1.163428, 0.9955472, 1, 1, 1, 1, 1,
1.15246, -0.1904777, 1.924231, 1, 1, 1, 1, 1,
1.163516, -0.4008546, 1.990919, 1, 1, 1, 1, 1,
1.167792, -0.3199532, 4.135, 1, 1, 1, 1, 1,
1.168544, 1.135383, 1.101369, 1, 1, 1, 1, 1,
1.168816, -0.8041041, 2.817597, 1, 1, 1, 1, 1,
1.172962, -1.087935, 1.066203, 1, 1, 1, 1, 1,
1.187534, 0.2823645, 2.984552, 1, 1, 1, 1, 1,
1.189438, -1.000489, 1.989344, 1, 1, 1, 1, 1,
1.196358, -1.791094, 3.521602, 1, 1, 1, 1, 1,
1.205611, 0.5620157, 1.410965, 1, 1, 1, 1, 1,
1.2147, 3.200762, 0.975686, 1, 1, 1, 1, 1,
1.218004, 2.188618, -0.1048267, 1, 1, 1, 1, 1,
1.22075, -0.5818947, 1.503044, 0, 0, 1, 1, 1,
1.225562, -0.4998507, 1.806907, 1, 0, 0, 1, 1,
1.227922, 0.02182028, 1.32976, 1, 0, 0, 1, 1,
1.228086, -0.7638124, 2.165261, 1, 0, 0, 1, 1,
1.240983, -0.3161851, 2.6646, 1, 0, 0, 1, 1,
1.245332, 0.8904372, 1.901326, 1, 0, 0, 1, 1,
1.246373, 0.7547964, 0.5614183, 0, 0, 0, 1, 1,
1.247757, -1.29287, 1.786301, 0, 0, 0, 1, 1,
1.271858, -1.710539, 0.9402153, 0, 0, 0, 1, 1,
1.272759, -0.8222529, 1.427069, 0, 0, 0, 1, 1,
1.289402, 1.380706, 0.9691134, 0, 0, 0, 1, 1,
1.292363, -0.3482087, 2.316147, 0, 0, 0, 1, 1,
1.294201, 1.843316, 0.3745364, 0, 0, 0, 1, 1,
1.306819, -1.224579, 2.134266, 1, 1, 1, 1, 1,
1.310884, 0.1197861, 0.2350081, 1, 1, 1, 1, 1,
1.311683, -1.913085, 2.15934, 1, 1, 1, 1, 1,
1.315382, -0.41611, 1.54015, 1, 1, 1, 1, 1,
1.321614, -0.7333492, 0.7911979, 1, 1, 1, 1, 1,
1.322608, -0.7305025, 1.961917, 1, 1, 1, 1, 1,
1.329556, 0.5622322, 1.568177, 1, 1, 1, 1, 1,
1.33034, 0.1578255, 0.7395958, 1, 1, 1, 1, 1,
1.331326, -0.8095563, 0.9058695, 1, 1, 1, 1, 1,
1.335537, 0.05345402, 0.2580075, 1, 1, 1, 1, 1,
1.366183, 0.5432855, 1.088914, 1, 1, 1, 1, 1,
1.40684, -0.5842419, 1.381368, 1, 1, 1, 1, 1,
1.40871, 1.643169, 1.286855, 1, 1, 1, 1, 1,
1.428488, -0.1823526, 2.430272, 1, 1, 1, 1, 1,
1.438719, 0.6766185, 0.5187374, 1, 1, 1, 1, 1,
1.439268, 1.886038, 1.053545, 0, 0, 1, 1, 1,
1.443828, 2.164091, 1.070073, 1, 0, 0, 1, 1,
1.450274, -0.5303134, 0.9100865, 1, 0, 0, 1, 1,
1.458759, 1.043756, -0.4462285, 1, 0, 0, 1, 1,
1.46377, -0.4202071, 3.081307, 1, 0, 0, 1, 1,
1.464512, 0.1365117, 1.715336, 1, 0, 0, 1, 1,
1.464582, -0.8924164, 3.399662, 0, 0, 0, 1, 1,
1.473331, -1.511112, 3.843366, 0, 0, 0, 1, 1,
1.495261, -2.545522, 4.260894, 0, 0, 0, 1, 1,
1.510028, 0.3468383, 1.97234, 0, 0, 0, 1, 1,
1.511812, -1.657661, 2.377805, 0, 0, 0, 1, 1,
1.513468, 0.4456935, 1.20734, 0, 0, 0, 1, 1,
1.513694, -0.186928, 3.00236, 0, 0, 0, 1, 1,
1.52905, 0.8728256, 2.008569, 1, 1, 1, 1, 1,
1.535002, -0.8885935, 2.874364, 1, 1, 1, 1, 1,
1.547592, -1.249159, 2.994538, 1, 1, 1, 1, 1,
1.558129, -0.7602939, 0.4207554, 1, 1, 1, 1, 1,
1.558874, 1.187324, 3.364611, 1, 1, 1, 1, 1,
1.566745, -1.745804, 2.951588, 1, 1, 1, 1, 1,
1.57124, 1.221076, 2.0881, 1, 1, 1, 1, 1,
1.582337, 0.2004441, 2.296221, 1, 1, 1, 1, 1,
1.630752, 0.792676, -0.2440616, 1, 1, 1, 1, 1,
1.634999, -1.474311, 2.414234, 1, 1, 1, 1, 1,
1.637828, -0.426722, 3.022448, 1, 1, 1, 1, 1,
1.64545, -1.144082, 4.307031, 1, 1, 1, 1, 1,
1.659199, 0.1413559, 2.948339, 1, 1, 1, 1, 1,
1.659303, -2.155038, 0.4007853, 1, 1, 1, 1, 1,
1.661463, 0.06970888, 2.581427, 1, 1, 1, 1, 1,
1.673187, 0.7633106, 1.526378, 0, 0, 1, 1, 1,
1.682235, -1.064405, 1.134803, 1, 0, 0, 1, 1,
1.690613, 0.8490191, -0.5770801, 1, 0, 0, 1, 1,
1.694892, 0.9912008, 1.594952, 1, 0, 0, 1, 1,
1.696268, -0.9909658, 1.057292, 1, 0, 0, 1, 1,
1.698781, 1.466006, 0.4820876, 1, 0, 0, 1, 1,
1.732351, -1.089988, 2.327629, 0, 0, 0, 1, 1,
1.735051, 0.2285325, 1.618575, 0, 0, 0, 1, 1,
1.76093, 0.6914472, 0.400945, 0, 0, 0, 1, 1,
1.762942, 0.6917211, 1.359462, 0, 0, 0, 1, 1,
1.765475, -0.521905, 0.5247788, 0, 0, 0, 1, 1,
1.769023, -0.2779061, 2.307404, 0, 0, 0, 1, 1,
1.775343, 1.506978, 2.552532, 0, 0, 0, 1, 1,
1.77899, 0.2923314, 1.503698, 1, 1, 1, 1, 1,
1.788676, -0.6941155, 1.551272, 1, 1, 1, 1, 1,
1.810914, -0.4967715, 1.86398, 1, 1, 1, 1, 1,
1.811455, 0.1021983, 2.097139, 1, 1, 1, 1, 1,
1.814225, 1.963894, 0.9805161, 1, 1, 1, 1, 1,
1.821445, -0.2076197, 1.440402, 1, 1, 1, 1, 1,
1.862922, -1.324377, 3.413332, 1, 1, 1, 1, 1,
1.883893, -1.156708, 3.327035, 1, 1, 1, 1, 1,
1.927933, 1.902428, 0.155301, 1, 1, 1, 1, 1,
1.956915, 0.5272829, -1.005985, 1, 1, 1, 1, 1,
1.987986, 0.002988807, 0.9306557, 1, 1, 1, 1, 1,
2.027704, -0.03573802, 1.227684, 1, 1, 1, 1, 1,
2.054084, -1.339378, 2.020166, 1, 1, 1, 1, 1,
2.062934, -0.04707692, 1.484212, 1, 1, 1, 1, 1,
2.074241, -0.2095671, 2.151647, 1, 1, 1, 1, 1,
2.142546, 0.6016679, -0.6276743, 0, 0, 1, 1, 1,
2.150133, 0.0525603, 0.8385843, 1, 0, 0, 1, 1,
2.163346, 1.497797, 0.6378734, 1, 0, 0, 1, 1,
2.193038, -1.097972, 0.5203297, 1, 0, 0, 1, 1,
2.201816, 0.687283, 1.420212, 1, 0, 0, 1, 1,
2.274383, -0.6800131, 3.110434, 1, 0, 0, 1, 1,
2.281147, -1.029845, 1.895813, 0, 0, 0, 1, 1,
2.30185, 1.669051, 2.501112, 0, 0, 0, 1, 1,
2.341239, 1.169057, 2.007107, 0, 0, 0, 1, 1,
2.360183, -2.254024, 1.692106, 0, 0, 0, 1, 1,
2.432761, -0.05930337, 2.367485, 0, 0, 0, 1, 1,
2.562749, -0.9466329, 0.7182902, 0, 0, 0, 1, 1,
2.678602, 0.1627006, -0.5406892, 0, 0, 0, 1, 1,
2.894737, -1.408492, 2.341911, 1, 1, 1, 1, 1,
2.927706, -0.03444054, 2.137335, 1, 1, 1, 1, 1,
2.978163, 0.5390674, 1.111073, 1, 1, 1, 1, 1,
3.110485, 0.8177699, 0.1186643, 1, 1, 1, 1, 1,
3.371577, 1.158501, 0.9467988, 1, 1, 1, 1, 1,
3.555904, -0.1411657, 0.8321299, 1, 1, 1, 1, 1,
3.55615, 1.491231, 1.581604, 1, 1, 1, 1, 1
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
var radius = 10.20248;
var distance = 35.83578;
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
mvMatrix.translate( 0.06595087, 0.3568954, -0.006057739 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.83578);
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
