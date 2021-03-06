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
-3.221181, 0.4381564, -1.449553, 1, 0, 0, 1,
-3.077555, -2.495578, -2.192744, 1, 0.007843138, 0, 1,
-2.975909, -0.3405125, -2.975991, 1, 0.01176471, 0, 1,
-2.708496, -0.6080827, -2.051112, 1, 0.01960784, 0, 1,
-2.704745, -0.4062679, -1.879292, 1, 0.02352941, 0, 1,
-2.660409, -0.8738517, -3.80327, 1, 0.03137255, 0, 1,
-2.485585, -0.2608709, -1.77006, 1, 0.03529412, 0, 1,
-2.48183, -0.6307374, -2.822231, 1, 0.04313726, 0, 1,
-2.448023, -1.248123, -0.3091588, 1, 0.04705882, 0, 1,
-2.391837, -0.9278454, -1.605687, 1, 0.05490196, 0, 1,
-2.321149, 0.03718686, -1.367451, 1, 0.05882353, 0, 1,
-2.320435, 1.716019, -0.9116881, 1, 0.06666667, 0, 1,
-2.318801, -3.589585, -2.115791, 1, 0.07058824, 0, 1,
-2.316991, 2.750639, -0.5497294, 1, 0.07843138, 0, 1,
-2.247226, -0.08751716, -2.936723, 1, 0.08235294, 0, 1,
-2.192854, -2.561596, -2.876222, 1, 0.09019608, 0, 1,
-2.182509, 1.671235, -0.9669134, 1, 0.09411765, 0, 1,
-2.124236, 0.6307776, -1.832984, 1, 0.1019608, 0, 1,
-2.09835, 1.321083, 2.32124, 1, 0.1098039, 0, 1,
-2.082839, -0.3565857, -3.599295, 1, 0.1137255, 0, 1,
-2.074322, -0.3598643, -2.855282, 1, 0.1215686, 0, 1,
-2.073138, 0.2008352, 0.3757844, 1, 0.1254902, 0, 1,
-2.050358, 0.7704513, 0.5394155, 1, 0.1333333, 0, 1,
-2.031464, 0.3415302, -0.8885627, 1, 0.1372549, 0, 1,
-1.932178, 0.5785013, -0.5574812, 1, 0.145098, 0, 1,
-1.928548, -0.7327902, -0.9913756, 1, 0.1490196, 0, 1,
-1.915052, -1.379327, -1.672255, 1, 0.1568628, 0, 1,
-1.870965, -0.640225, -1.846972, 1, 0.1607843, 0, 1,
-1.8704, -0.8031012, -3.019269, 1, 0.1686275, 0, 1,
-1.867776, 1.125309, -0.7281613, 1, 0.172549, 0, 1,
-1.866039, -0.4891879, -3.795995, 1, 0.1803922, 0, 1,
-1.864599, -0.03599958, -2.79065, 1, 0.1843137, 0, 1,
-1.851951, -0.2354332, -0.9674171, 1, 0.1921569, 0, 1,
-1.839624, 1.588582, -3.154406, 1, 0.1960784, 0, 1,
-1.831032, 1.439258, -1.033668, 1, 0.2039216, 0, 1,
-1.822207, -1.007686, 0.4220851, 1, 0.2117647, 0, 1,
-1.792004, -0.8504481, -1.460687, 1, 0.2156863, 0, 1,
-1.789893, 0.3759802, -0.4470425, 1, 0.2235294, 0, 1,
-1.77508, -2.606481, -1.89014, 1, 0.227451, 0, 1,
-1.772817, -0.7745358, -1.603057, 1, 0.2352941, 0, 1,
-1.767876, 0.4738156, -1.285668, 1, 0.2392157, 0, 1,
-1.749211, 2.34538, 1.80099, 1, 0.2470588, 0, 1,
-1.747103, -0.260061, -2.247197, 1, 0.2509804, 0, 1,
-1.743795, 0.06909154, -1.074529, 1, 0.2588235, 0, 1,
-1.741722, -0.4141712, -0.7603096, 1, 0.2627451, 0, 1,
-1.727431, -2.376098, -4.44396, 1, 0.2705882, 0, 1,
-1.719576, -0.9488087, -1.639054, 1, 0.2745098, 0, 1,
-1.703227, 1.471822, 1.611191, 1, 0.282353, 0, 1,
-1.700339, 1.396381, 1.597979, 1, 0.2862745, 0, 1,
-1.698248, -0.3898037, -1.530505, 1, 0.2941177, 0, 1,
-1.686837, 1.590217, -1.793099, 1, 0.3019608, 0, 1,
-1.67439, -1.075488, -1.019535, 1, 0.3058824, 0, 1,
-1.66503, -0.101492, -2.905233, 1, 0.3137255, 0, 1,
-1.635045, -0.6452919, -2.454707, 1, 0.3176471, 0, 1,
-1.625872, -2.016103, -2.147561, 1, 0.3254902, 0, 1,
-1.622724, -0.6405863, -1.181497, 1, 0.3294118, 0, 1,
-1.621702, -0.2758365, -1.539618, 1, 0.3372549, 0, 1,
-1.606868, 1.516544, -0.446206, 1, 0.3411765, 0, 1,
-1.593769, -0.9417697, -4.005362, 1, 0.3490196, 0, 1,
-1.583842, 0.10528, -1.837468, 1, 0.3529412, 0, 1,
-1.578422, 0.6620045, -1.289935, 1, 0.3607843, 0, 1,
-1.566927, 0.9003847, -1.026573, 1, 0.3647059, 0, 1,
-1.562342, 1.807953, -0.5042425, 1, 0.372549, 0, 1,
-1.553991, -0.5702674, -2.09123, 1, 0.3764706, 0, 1,
-1.553805, 0.2225395, -0.3597468, 1, 0.3843137, 0, 1,
-1.548494, -1.091633, -2.680511, 1, 0.3882353, 0, 1,
-1.547183, -1.071916, -2.643122, 1, 0.3960784, 0, 1,
-1.54482, -1.177531, -2.844473, 1, 0.4039216, 0, 1,
-1.535593, 1.880392, 0.6389163, 1, 0.4078431, 0, 1,
-1.530345, -0.6411901, -1.147363, 1, 0.4156863, 0, 1,
-1.529575, -0.7282782, -2.712341, 1, 0.4196078, 0, 1,
-1.525477, -1.560742, -3.240213, 1, 0.427451, 0, 1,
-1.523784, 1.542262, -1.791151, 1, 0.4313726, 0, 1,
-1.516605, -0.2434337, -1.600073, 1, 0.4392157, 0, 1,
-1.516442, -1.533938, -2.727549, 1, 0.4431373, 0, 1,
-1.491381, -0.2538284, -1.356893, 1, 0.4509804, 0, 1,
-1.482126, 0.1046968, -2.947854, 1, 0.454902, 0, 1,
-1.480223, -0.4622904, -1.212139, 1, 0.4627451, 0, 1,
-1.479189, 0.7663506, -0.3170826, 1, 0.4666667, 0, 1,
-1.477587, -0.01631632, -1.672388, 1, 0.4745098, 0, 1,
-1.471736, 0.3937942, 0.4795952, 1, 0.4784314, 0, 1,
-1.458562, 2.101001, -3.05813, 1, 0.4862745, 0, 1,
-1.457206, -1.229723, -2.710104, 1, 0.4901961, 0, 1,
-1.450756, -1.923285, -2.844709, 1, 0.4980392, 0, 1,
-1.445359, 0.1677784, -2.60974, 1, 0.5058824, 0, 1,
-1.442415, 1.881153, -0.08490696, 1, 0.509804, 0, 1,
-1.441057, -0.6333054, -2.376448, 1, 0.5176471, 0, 1,
-1.439493, -1.798667, -3.033847, 1, 0.5215687, 0, 1,
-1.427588, 1.481849, -2.724432, 1, 0.5294118, 0, 1,
-1.426275, 0.7295136, -1.76847, 1, 0.5333334, 0, 1,
-1.408195, 0.9183989, -1.783002, 1, 0.5411765, 0, 1,
-1.40184, -0.9465005, -3.254409, 1, 0.5450981, 0, 1,
-1.399249, 0.5817891, 0.3572227, 1, 0.5529412, 0, 1,
-1.389503, -0.3115585, -3.068075, 1, 0.5568628, 0, 1,
-1.377149, -0.2306623, -1.91869, 1, 0.5647059, 0, 1,
-1.365316, 1.415899, -2.722495, 1, 0.5686275, 0, 1,
-1.363495, 0.4845529, -1.244709, 1, 0.5764706, 0, 1,
-1.363063, -1.104847, -2.828848, 1, 0.5803922, 0, 1,
-1.362497, 0.01867347, -4.059522, 1, 0.5882353, 0, 1,
-1.361727, 2.139726, -1.142806, 1, 0.5921569, 0, 1,
-1.343045, -1.2441, -2.007656, 1, 0.6, 0, 1,
-1.336524, -0.06432456, -1.431508, 1, 0.6078432, 0, 1,
-1.311191, -1.797083, -3.487795, 1, 0.6117647, 0, 1,
-1.299978, -1.616642, -3.119106, 1, 0.6196079, 0, 1,
-1.28861, -0.5306908, -2.896625, 1, 0.6235294, 0, 1,
-1.279519, 0.04631562, -1.991479, 1, 0.6313726, 0, 1,
-1.271677, -0.315268, -1.928008, 1, 0.6352941, 0, 1,
-1.262202, -0.5757992, -4.050219, 1, 0.6431373, 0, 1,
-1.252522, -0.523837, -2.453141, 1, 0.6470588, 0, 1,
-1.248925, -2.136847, -3.56101, 1, 0.654902, 0, 1,
-1.232966, -0.6231623, -3.377951, 1, 0.6588235, 0, 1,
-1.224195, 2.31791, -0.9411551, 1, 0.6666667, 0, 1,
-1.222116, -0.2597029, -2.985298, 1, 0.6705883, 0, 1,
-1.221949, 0.1896306, -2.057542, 1, 0.6784314, 0, 1,
-1.221258, 0.2574445, -1.710108, 1, 0.682353, 0, 1,
-1.212126, -0.1837054, -4.629767, 1, 0.6901961, 0, 1,
-1.200321, -0.0418744, -2.250154, 1, 0.6941177, 0, 1,
-1.194938, -1.143931, -2.119078, 1, 0.7019608, 0, 1,
-1.189986, -1.268288, -3.674339, 1, 0.7098039, 0, 1,
-1.188746, 1.084747, -1.010116, 1, 0.7137255, 0, 1,
-1.185119, -1.070858, -1.446826, 1, 0.7215686, 0, 1,
-1.184411, 1.161129, -1.605687, 1, 0.7254902, 0, 1,
-1.18244, 0.6013493, -2.035722, 1, 0.7333333, 0, 1,
-1.176535, 0.2637418, -2.716754, 1, 0.7372549, 0, 1,
-1.173973, 0.5501317, -1.924314, 1, 0.7450981, 0, 1,
-1.167603, 0.8833297, 0.6432662, 1, 0.7490196, 0, 1,
-1.166397, 0.3383349, 0.04237143, 1, 0.7568628, 0, 1,
-1.160713, 1.099934, -1.473721, 1, 0.7607843, 0, 1,
-1.158523, -0.07227649, -1.274462, 1, 0.7686275, 0, 1,
-1.156375, -0.6599155, -2.724227, 1, 0.772549, 0, 1,
-1.142053, -1.390445, -1.777878, 1, 0.7803922, 0, 1,
-1.139111, 1.899584, -0.1930749, 1, 0.7843137, 0, 1,
-1.13662, -0.8874265, -3.183558, 1, 0.7921569, 0, 1,
-1.135191, 0.1232414, -0.0991952, 1, 0.7960784, 0, 1,
-1.1341, -0.6875429, -0.4791341, 1, 0.8039216, 0, 1,
-1.133762, -0.3284693, -2.287113, 1, 0.8117647, 0, 1,
-1.12449, 0.5003641, -1.034773, 1, 0.8156863, 0, 1,
-1.115365, 0.01945868, -2.09698, 1, 0.8235294, 0, 1,
-1.108115, 0.6652617, -0.4911433, 1, 0.827451, 0, 1,
-1.106775, -0.04255818, -0.7865814, 1, 0.8352941, 0, 1,
-1.099365, -0.1281755, -0.9748982, 1, 0.8392157, 0, 1,
-1.086625, -0.5942979, -0.6657367, 1, 0.8470588, 0, 1,
-1.086607, 0.6598705, -0.5215027, 1, 0.8509804, 0, 1,
-1.080643, 0.06903774, -3.967373, 1, 0.8588235, 0, 1,
-1.075816, -0.5347412, -3.361225, 1, 0.8627451, 0, 1,
-1.072262, -1.063739, -0.8430246, 1, 0.8705882, 0, 1,
-1.053951, 0.0436097, -2.483251, 1, 0.8745098, 0, 1,
-1.044154, 0.9021602, -1.396344, 1, 0.8823529, 0, 1,
-1.034328, 2.371807, -1.82676, 1, 0.8862745, 0, 1,
-1.02589, -1.088324, -1.112156, 1, 0.8941177, 0, 1,
-1.021997, 0.2347111, -0.3798873, 1, 0.8980392, 0, 1,
-1.016671, -0.5203772, -1.365361, 1, 0.9058824, 0, 1,
-1.01506, 0.02024638, -3.186291, 1, 0.9137255, 0, 1,
-1.002526, 0.4633292, -1.525501, 1, 0.9176471, 0, 1,
-0.9959768, 1.309838, -1.325557, 1, 0.9254902, 0, 1,
-0.9919023, 0.04711742, -1.226106, 1, 0.9294118, 0, 1,
-0.9873484, 0.4699236, -1.623039, 1, 0.9372549, 0, 1,
-0.987271, 1.548358, -2.782716, 1, 0.9411765, 0, 1,
-0.9847321, -1.723948, -2.303603, 1, 0.9490196, 0, 1,
-0.9832154, 0.9033542, 0.1837822, 1, 0.9529412, 0, 1,
-0.9808633, 0.2536673, -1.850686, 1, 0.9607843, 0, 1,
-0.9776834, -0.6336814, -3.491359, 1, 0.9647059, 0, 1,
-0.975439, 0.1201192, -1.02765, 1, 0.972549, 0, 1,
-0.973607, -0.5578528, -2.202012, 1, 0.9764706, 0, 1,
-0.9693425, 0.2241526, -0.5371267, 1, 0.9843137, 0, 1,
-0.9666184, 0.490636, -0.06468923, 1, 0.9882353, 0, 1,
-0.9609715, -0.3957166, -1.760848, 1, 0.9960784, 0, 1,
-0.9583741, -0.6859133, -2.408221, 0.9960784, 1, 0, 1,
-0.9534112, -0.6253921, -3.522544, 0.9921569, 1, 0, 1,
-0.9508348, 1.502618, -1.204963, 0.9843137, 1, 0, 1,
-0.9443664, 0.9925399, -0.6378251, 0.9803922, 1, 0, 1,
-0.9413297, -0.8044457, -0.9588085, 0.972549, 1, 0, 1,
-0.9412102, 1.615313, -0.5921424, 0.9686275, 1, 0, 1,
-0.940617, -0.60795, -1.604209, 0.9607843, 1, 0, 1,
-0.9387385, 0.1946258, -0.9285981, 0.9568627, 1, 0, 1,
-0.9378744, 0.6130177, -3.373163, 0.9490196, 1, 0, 1,
-0.9351597, -2.33816, -2.911365, 0.945098, 1, 0, 1,
-0.9318077, -1.183069, -1.42698, 0.9372549, 1, 0, 1,
-0.9274725, -1.066822, -1.681451, 0.9333333, 1, 0, 1,
-0.9248751, -0.4033154, -1.039584, 0.9254902, 1, 0, 1,
-0.9199808, 0.3180107, -2.294054, 0.9215686, 1, 0, 1,
-0.9153129, 0.5589064, -1.285985, 0.9137255, 1, 0, 1,
-0.907014, -0.09950239, -2.446982, 0.9098039, 1, 0, 1,
-0.9065377, 1.118372, -0.7410213, 0.9019608, 1, 0, 1,
-0.9062625, 0.5264418, -2.52279, 0.8941177, 1, 0, 1,
-0.8996373, 0.1661683, -2.94712, 0.8901961, 1, 0, 1,
-0.897983, 0.1596953, -0.5649616, 0.8823529, 1, 0, 1,
-0.8937311, 0.6261173, -0.5089567, 0.8784314, 1, 0, 1,
-0.889162, -0.3870621, 0.290892, 0.8705882, 1, 0, 1,
-0.886697, -0.5736799, -2.794169, 0.8666667, 1, 0, 1,
-0.8861504, -1.379866, -3.432476, 0.8588235, 1, 0, 1,
-0.8836673, 0.4485583, -2.283626, 0.854902, 1, 0, 1,
-0.881605, -2.119186, -3.864671, 0.8470588, 1, 0, 1,
-0.877417, -0.1238335, -2.053992, 0.8431373, 1, 0, 1,
-0.8756229, 0.3858483, -1.111638, 0.8352941, 1, 0, 1,
-0.8721474, 0.0005488508, -0.8890813, 0.8313726, 1, 0, 1,
-0.8644252, 2.136732, -0.8644629, 0.8235294, 1, 0, 1,
-0.8636102, -0.5366032, -2.071007, 0.8196079, 1, 0, 1,
-0.8632998, 1.817123, -0.7637255, 0.8117647, 1, 0, 1,
-0.8618677, 0.2250423, -2.87887, 0.8078431, 1, 0, 1,
-0.8613111, -0.7880028, -1.866297, 0.8, 1, 0, 1,
-0.8547145, -1.507855, -2.055878, 0.7921569, 1, 0, 1,
-0.8510948, 0.07791407, -0.690666, 0.7882353, 1, 0, 1,
-0.8430846, -1.597602, -1.443756, 0.7803922, 1, 0, 1,
-0.8424987, 0.1970102, -0.7302917, 0.7764706, 1, 0, 1,
-0.8415759, 0.4208092, -0.6197055, 0.7686275, 1, 0, 1,
-0.8409345, 0.1262987, -1.53471, 0.7647059, 1, 0, 1,
-0.8328664, -0.5884026, -1.749853, 0.7568628, 1, 0, 1,
-0.8327121, 1.178797, -0.8380973, 0.7529412, 1, 0, 1,
-0.8325893, -1.103237, -0.8460612, 0.7450981, 1, 0, 1,
-0.8320307, 0.0370936, -0.6437426, 0.7411765, 1, 0, 1,
-0.8243715, 0.04879773, -1.58514, 0.7333333, 1, 0, 1,
-0.8178157, -0.091412, -1.349291, 0.7294118, 1, 0, 1,
-0.8168916, -0.7370217, -1.496215, 0.7215686, 1, 0, 1,
-0.7976455, 0.694679, 1.605806, 0.7176471, 1, 0, 1,
-0.7940233, -2.163332, -2.923956, 0.7098039, 1, 0, 1,
-0.7894493, 0.3410068, -1.102148, 0.7058824, 1, 0, 1,
-0.7884582, -0.7052084, -0.5101946, 0.6980392, 1, 0, 1,
-0.7852697, 0.07950491, -1.479153, 0.6901961, 1, 0, 1,
-0.7849452, 1.22588, 0.6945307, 0.6862745, 1, 0, 1,
-0.7836583, -0.2134956, -2.452295, 0.6784314, 1, 0, 1,
-0.7830844, -0.387518, -2.095968, 0.6745098, 1, 0, 1,
-0.770883, -0.4084281, -0.6401454, 0.6666667, 1, 0, 1,
-0.7673673, 1.874408, -0.1153757, 0.6627451, 1, 0, 1,
-0.7667949, 0.7488521, -0.7985656, 0.654902, 1, 0, 1,
-0.7645567, -0.5751643, -0.618795, 0.6509804, 1, 0, 1,
-0.7600036, -0.5412747, -2.875756, 0.6431373, 1, 0, 1,
-0.7561833, -1.911664, -1.295794, 0.6392157, 1, 0, 1,
-0.7481834, 1.047918, -1.165207, 0.6313726, 1, 0, 1,
-0.7472219, -0.07781287, -0.3479044, 0.627451, 1, 0, 1,
-0.7469278, 0.9473203, -0.6578274, 0.6196079, 1, 0, 1,
-0.7454444, 1.452731, -0.241139, 0.6156863, 1, 0, 1,
-0.7431781, -2.393631, -2.186473, 0.6078432, 1, 0, 1,
-0.7384055, 1.044229, 1.708548, 0.6039216, 1, 0, 1,
-0.7376155, -0.08959359, 0.648883, 0.5960785, 1, 0, 1,
-0.7336907, -0.3772728, -2.690469, 0.5882353, 1, 0, 1,
-0.7327883, 0.571658, -0.3583587, 0.5843138, 1, 0, 1,
-0.7327049, -0.8691011, -1.109267, 0.5764706, 1, 0, 1,
-0.7317427, -0.987459, -1.916442, 0.572549, 1, 0, 1,
-0.7293593, 0.7187894, -2.514088, 0.5647059, 1, 0, 1,
-0.7240158, -0.5327652, -3.841522, 0.5607843, 1, 0, 1,
-0.7187831, 0.1770052, -2.641305, 0.5529412, 1, 0, 1,
-0.7125234, -0.373009, -2.724003, 0.5490196, 1, 0, 1,
-0.7122115, -0.4251085, -2.491799, 0.5411765, 1, 0, 1,
-0.7116758, 1.34412, -1.689246, 0.5372549, 1, 0, 1,
-0.710978, -0.4219037, -3.380483, 0.5294118, 1, 0, 1,
-0.7095829, 0.1937715, -2.688633, 0.5254902, 1, 0, 1,
-0.7095779, -0.6997509, -2.791623, 0.5176471, 1, 0, 1,
-0.7041502, 0.7999255, -0.1457215, 0.5137255, 1, 0, 1,
-0.7040053, -0.6720951, -2.096455, 0.5058824, 1, 0, 1,
-0.7026725, -0.1204125, -0.6225027, 0.5019608, 1, 0, 1,
-0.7020969, -0.8152164, -2.633391, 0.4941176, 1, 0, 1,
-0.7009512, 1.019462, 0.6523422, 0.4862745, 1, 0, 1,
-0.6974211, 0.4698487, -2.194307, 0.4823529, 1, 0, 1,
-0.6972743, 0.1366155, -1.053059, 0.4745098, 1, 0, 1,
-0.6947924, -0.3339346, -2.921371, 0.4705882, 1, 0, 1,
-0.6911087, -0.7436295, -0.6767223, 0.4627451, 1, 0, 1,
-0.6834894, 0.4116932, -1.04728, 0.4588235, 1, 0, 1,
-0.6737574, 1.501068, 0.456881, 0.4509804, 1, 0, 1,
-0.6734621, -1.656164, -2.93432, 0.4470588, 1, 0, 1,
-0.6677263, 1.895156, -0.109788, 0.4392157, 1, 0, 1,
-0.6666581, -0.4448215, -2.167579, 0.4352941, 1, 0, 1,
-0.6652669, -0.6380255, -3.185357, 0.427451, 1, 0, 1,
-0.6592381, -0.2813258, -2.198691, 0.4235294, 1, 0, 1,
-0.6559184, 0.2492339, -0.2686053, 0.4156863, 1, 0, 1,
-0.6537147, 8.171608e-05, -3.158271, 0.4117647, 1, 0, 1,
-0.6530892, 0.9506344, -0.4205852, 0.4039216, 1, 0, 1,
-0.6496076, 1.260055, -0.557224, 0.3960784, 1, 0, 1,
-0.6479494, -0.1970783, -0.8328474, 0.3921569, 1, 0, 1,
-0.6405405, -0.6839802, -0.6976298, 0.3843137, 1, 0, 1,
-0.6401382, 1.110761, -0.7611673, 0.3803922, 1, 0, 1,
-0.6393242, -0.4163969, -1.014371, 0.372549, 1, 0, 1,
-0.6352688, 1.139126, 0.7818999, 0.3686275, 1, 0, 1,
-0.6294718, 0.4714195, -1.455014, 0.3607843, 1, 0, 1,
-0.6294087, -0.9848678, -3.995544, 0.3568628, 1, 0, 1,
-0.6289411, -1.599768, -3.054544, 0.3490196, 1, 0, 1,
-0.6273792, -0.6605212, -2.338048, 0.345098, 1, 0, 1,
-0.6242014, 1.74526, -0.6402101, 0.3372549, 1, 0, 1,
-0.6188905, 2.915948, -0.4689309, 0.3333333, 1, 0, 1,
-0.6167369, 1.58748, -0.1928094, 0.3254902, 1, 0, 1,
-0.615226, -0.3043226, -2.193033, 0.3215686, 1, 0, 1,
-0.6141987, -0.2116885, -2.852627, 0.3137255, 1, 0, 1,
-0.611101, -2.100347, -1.890915, 0.3098039, 1, 0, 1,
-0.6106759, -1.100106, -3.659894, 0.3019608, 1, 0, 1,
-0.6018902, -0.4263144, -1.015997, 0.2941177, 1, 0, 1,
-0.5987825, 1.226244, 0.1122034, 0.2901961, 1, 0, 1,
-0.5979173, 0.4180997, -1.063921, 0.282353, 1, 0, 1,
-0.592231, -2.848829, -2.607241, 0.2784314, 1, 0, 1,
-0.588247, 0.04003539, -0.7490484, 0.2705882, 1, 0, 1,
-0.5801578, -0.2296386, -2.695279, 0.2666667, 1, 0, 1,
-0.5781305, 0.8656868, -0.1391073, 0.2588235, 1, 0, 1,
-0.577548, 0.5718424, -0.7136005, 0.254902, 1, 0, 1,
-0.5771927, -1.213344, -2.20139, 0.2470588, 1, 0, 1,
-0.5747313, 2.019679, -0.2321532, 0.2431373, 1, 0, 1,
-0.5723643, 0.4632924, -0.5739869, 0.2352941, 1, 0, 1,
-0.5686229, -0.1471469, -4.33097, 0.2313726, 1, 0, 1,
-0.5685717, 0.8222516, 0.533776, 0.2235294, 1, 0, 1,
-0.5644496, -1.467613, -3.608546, 0.2196078, 1, 0, 1,
-0.5640453, -0.937732, -2.248087, 0.2117647, 1, 0, 1,
-0.5561157, -1.24186, -3.052944, 0.2078431, 1, 0, 1,
-0.5552428, 0.8264298, -2.932194, 0.2, 1, 0, 1,
-0.5516204, 0.244221, -2.018886, 0.1921569, 1, 0, 1,
-0.5499213, 0.1232021, 0.1091652, 0.1882353, 1, 0, 1,
-0.549124, 0.1576127, -1.121936, 0.1803922, 1, 0, 1,
-0.5489633, -0.9990264, -2.215743, 0.1764706, 1, 0, 1,
-0.5478975, 1.414496, -1.43308, 0.1686275, 1, 0, 1,
-0.545301, -0.5502385, -2.387044, 0.1647059, 1, 0, 1,
-0.5425432, 2.155757, 0.1543351, 0.1568628, 1, 0, 1,
-0.5400668, -1.838977, -3.846663, 0.1529412, 1, 0, 1,
-0.5337539, 0.6255198, 0.6724046, 0.145098, 1, 0, 1,
-0.5337273, -0.2532965, -3.314115, 0.1411765, 1, 0, 1,
-0.5284187, 0.03904428, -1.950839, 0.1333333, 1, 0, 1,
-0.5271569, -1.148208, -3.94808, 0.1294118, 1, 0, 1,
-0.5225504, 1.035323, -0.3558203, 0.1215686, 1, 0, 1,
-0.5210069, 1.294527, -0.3685202, 0.1176471, 1, 0, 1,
-0.517344, -0.4726524, -2.215892, 0.1098039, 1, 0, 1,
-0.5167514, -1.717661, -0.3626375, 0.1058824, 1, 0, 1,
-0.5161715, -1.032941, -3.43613, 0.09803922, 1, 0, 1,
-0.5159302, -0.09548789, -3.367152, 0.09019608, 1, 0, 1,
-0.5143172, 0.8998805, -1.015211, 0.08627451, 1, 0, 1,
-0.5140041, 1.17735, -0.3508944, 0.07843138, 1, 0, 1,
-0.5008446, 0.5720948, -0.1531033, 0.07450981, 1, 0, 1,
-0.4922187, -0.03914227, -1.792524, 0.06666667, 1, 0, 1,
-0.4858799, -0.5077605, -1.994429, 0.0627451, 1, 0, 1,
-0.4856871, 0.9401308, -0.7544056, 0.05490196, 1, 0, 1,
-0.4823332, -0.4868159, -1.965224, 0.05098039, 1, 0, 1,
-0.4814397, -0.2361084, -1.453117, 0.04313726, 1, 0, 1,
-0.480722, 0.8014137, -0.5385902, 0.03921569, 1, 0, 1,
-0.4797968, -0.1416901, -1.238737, 0.03137255, 1, 0, 1,
-0.4797321, -1.359592, -2.80431, 0.02745098, 1, 0, 1,
-0.4797274, -1.708882, -3.235749, 0.01960784, 1, 0, 1,
-0.4795829, -1.561121, -3.427896, 0.01568628, 1, 0, 1,
-0.4792329, 0.1858526, -0.6754125, 0.007843138, 1, 0, 1,
-0.4731969, -0.1266226, -0.5400041, 0.003921569, 1, 0, 1,
-0.4721301, -0.3014345, -1.544737, 0, 1, 0.003921569, 1,
-0.4678001, 1.328374, -1.155386, 0, 1, 0.01176471, 1,
-0.4617063, 1.410497, -0.9646459, 0, 1, 0.01568628, 1,
-0.4599291, -1.115092, -4.44694, 0, 1, 0.02352941, 1,
-0.4548362, -0.03251889, -2.116645, 0, 1, 0.02745098, 1,
-0.4548299, 0.43796, -0.7303103, 0, 1, 0.03529412, 1,
-0.4546289, -1.692485, -0.9198059, 0, 1, 0.03921569, 1,
-0.4456887, -0.4347724, -2.039325, 0, 1, 0.04705882, 1,
-0.4433263, 0.3382871, -0.009370093, 0, 1, 0.05098039, 1,
-0.4423074, -1.22671, -3.992988, 0, 1, 0.05882353, 1,
-0.4372279, 0.09330146, -1.205722, 0, 1, 0.0627451, 1,
-0.4361553, -0.5695537, -2.296939, 0, 1, 0.07058824, 1,
-0.4348062, -1.041341, -0.4012488, 0, 1, 0.07450981, 1,
-0.4342004, 0.9762523, 0.1074955, 0, 1, 0.08235294, 1,
-0.4335407, 0.06499741, -1.936151, 0, 1, 0.08627451, 1,
-0.4307599, 0.8761001, -0.9014095, 0, 1, 0.09411765, 1,
-0.4259532, -2.266612, -3.04928, 0, 1, 0.1019608, 1,
-0.4251531, -0.001324427, -2.45489, 0, 1, 0.1058824, 1,
-0.419029, 0.4140252, -0.8166164, 0, 1, 0.1137255, 1,
-0.4179732, -0.4853184, -2.273371, 0, 1, 0.1176471, 1,
-0.4173841, 0.5701848, 0.06321235, 0, 1, 0.1254902, 1,
-0.4170558, -0.06334704, -2.366263, 0, 1, 0.1294118, 1,
-0.4109218, -0.09408196, -1.999594, 0, 1, 0.1372549, 1,
-0.40618, 0.7202194, 1.948368, 0, 1, 0.1411765, 1,
-0.4059633, -0.5281871, -3.788704, 0, 1, 0.1490196, 1,
-0.395963, 0.04262494, -1.028284, 0, 1, 0.1529412, 1,
-0.3892117, -0.5244054, -3.55159, 0, 1, 0.1607843, 1,
-0.3867932, -0.4125811, -1.564941, 0, 1, 0.1647059, 1,
-0.3849529, 0.4256811, -2.37748, 0, 1, 0.172549, 1,
-0.384654, 1.526115, 0.01076238, 0, 1, 0.1764706, 1,
-0.3796236, -0.9834462, -2.396924, 0, 1, 0.1843137, 1,
-0.3792168, 0.2458953, -1.402111, 0, 1, 0.1882353, 1,
-0.3784911, -1.801021, -1.699745, 0, 1, 0.1960784, 1,
-0.3761571, 0.3512811, 1.022853, 0, 1, 0.2039216, 1,
-0.3735543, -0.4843344, -2.713323, 0, 1, 0.2078431, 1,
-0.3687526, 0.7186242, -0.666168, 0, 1, 0.2156863, 1,
-0.3668388, -1.01885, -2.896406, 0, 1, 0.2196078, 1,
-0.3664731, -0.2815064, -0.4322091, 0, 1, 0.227451, 1,
-0.364417, 0.1596407, -1.176172, 0, 1, 0.2313726, 1,
-0.3642303, -1.306414, -0.1744142, 0, 1, 0.2392157, 1,
-0.3639624, -0.5998809, -2.983673, 0, 1, 0.2431373, 1,
-0.363307, -0.9414744, -4.388504, 0, 1, 0.2509804, 1,
-0.3556266, 1.219285, -1.597942, 0, 1, 0.254902, 1,
-0.3509057, 1.036491, 0.6468043, 0, 1, 0.2627451, 1,
-0.3391122, 0.8339701, 0.03223222, 0, 1, 0.2666667, 1,
-0.3376592, 0.01507024, -1.341266, 0, 1, 0.2745098, 1,
-0.3367978, -0.827827, -4.019552, 0, 1, 0.2784314, 1,
-0.336542, 2.241202, 1.084476, 0, 1, 0.2862745, 1,
-0.3364176, 0.03293119, -1.795228, 0, 1, 0.2901961, 1,
-0.3310094, -0.2122808, -1.056955, 0, 1, 0.2980392, 1,
-0.3291189, 0.1210961, -0.2869783, 0, 1, 0.3058824, 1,
-0.327463, 0.524121, -0.4905172, 0, 1, 0.3098039, 1,
-0.3268561, 0.002787654, -3.401933, 0, 1, 0.3176471, 1,
-0.3262917, 1.26461, 0.6346844, 0, 1, 0.3215686, 1,
-0.3260316, -1.604992, -2.898457, 0, 1, 0.3294118, 1,
-0.3233947, 0.6607936, -0.1925404, 0, 1, 0.3333333, 1,
-0.3199678, 0.5989437, -0.52244, 0, 1, 0.3411765, 1,
-0.3175512, -0.1353874, -2.662701, 0, 1, 0.345098, 1,
-0.3174004, 0.6211503, 1.626917, 0, 1, 0.3529412, 1,
-0.3092722, -0.7348851, -3.66772, 0, 1, 0.3568628, 1,
-0.3084159, -1.315169, -1.787828, 0, 1, 0.3647059, 1,
-0.3081071, 0.3258933, 0.003223976, 0, 1, 0.3686275, 1,
-0.3078081, -0.6406018, -1.769037, 0, 1, 0.3764706, 1,
-0.30678, -1.199407, -3.241909, 0, 1, 0.3803922, 1,
-0.3057636, 0.1179363, 0.5276084, 0, 1, 0.3882353, 1,
-0.3049887, 0.6091153, 0.6919788, 0, 1, 0.3921569, 1,
-0.3048821, 0.8748645, 0.1418906, 0, 1, 0.4, 1,
-0.3019389, -1.16012, -3.313516, 0, 1, 0.4078431, 1,
-0.2992843, -0.1642881, -0.418492, 0, 1, 0.4117647, 1,
-0.2940354, -0.6654023, -0.9079849, 0, 1, 0.4196078, 1,
-0.293019, 1.238082, -0.6498733, 0, 1, 0.4235294, 1,
-0.2919928, -0.01403875, -1.742676, 0, 1, 0.4313726, 1,
-0.2913234, 0.1852469, -0.9162989, 0, 1, 0.4352941, 1,
-0.2860105, -1.138616, -1.951779, 0, 1, 0.4431373, 1,
-0.2859646, -1.124294, -4.896119, 0, 1, 0.4470588, 1,
-0.2830873, -1.24333, -2.533745, 0, 1, 0.454902, 1,
-0.2790651, 1.527684, 1.151833, 0, 1, 0.4588235, 1,
-0.2784324, -0.2318896, -3.07998, 0, 1, 0.4666667, 1,
-0.2765173, -0.4530088, -1.977725, 0, 1, 0.4705882, 1,
-0.2753048, 0.9716471, 0.4633273, 0, 1, 0.4784314, 1,
-0.2705583, 0.1144452, -1.460672, 0, 1, 0.4823529, 1,
-0.2654263, -0.03444153, 0.5986309, 0, 1, 0.4901961, 1,
-0.2651756, 0.3610465, -1.355778, 0, 1, 0.4941176, 1,
-0.2622221, -0.3870154, -2.469697, 0, 1, 0.5019608, 1,
-0.2582501, -0.7214179, -2.972461, 0, 1, 0.509804, 1,
-0.2574943, -1.02447, -2.567775, 0, 1, 0.5137255, 1,
-0.2561232, -0.8226846, -3.640698, 0, 1, 0.5215687, 1,
-0.2546517, 1.596961, 0.6504238, 0, 1, 0.5254902, 1,
-0.2502818, 0.4949408, -1.151542, 0, 1, 0.5333334, 1,
-0.2500406, 0.3001099, -1.665589, 0, 1, 0.5372549, 1,
-0.249201, -0.5996084, -3.83087, 0, 1, 0.5450981, 1,
-0.2478774, -2.018478, -2.823883, 0, 1, 0.5490196, 1,
-0.2457995, 0.7344301, -1.415633, 0, 1, 0.5568628, 1,
-0.2431516, 0.399965, 0.2635324, 0, 1, 0.5607843, 1,
-0.2368092, 1.490556, 1.037629, 0, 1, 0.5686275, 1,
-0.236593, -1.251762, -3.426625, 0, 1, 0.572549, 1,
-0.2364017, -1.710648, -4.786651, 0, 1, 0.5803922, 1,
-0.2323919, 0.9817623, -0.5465074, 0, 1, 0.5843138, 1,
-0.2312834, 0.06732178, 0.09509464, 0, 1, 0.5921569, 1,
-0.227791, 0.07860069, -1.256032, 0, 1, 0.5960785, 1,
-0.2276888, 1.533179, -0.7980474, 0, 1, 0.6039216, 1,
-0.2259399, -0.3689263, -2.617754, 0, 1, 0.6117647, 1,
-0.2220781, -0.2247611, -3.602564, 0, 1, 0.6156863, 1,
-0.2195159, 0.1973592, -1.629954, 0, 1, 0.6235294, 1,
-0.2183181, 1.156192, 1.006873, 0, 1, 0.627451, 1,
-0.2128983, 1.744556, -0.8757952, 0, 1, 0.6352941, 1,
-0.2116634, 0.03330755, -1.550072, 0, 1, 0.6392157, 1,
-0.2111981, 2.044554, 0.5887676, 0, 1, 0.6470588, 1,
-0.2102499, 1.934652, -0.9542931, 0, 1, 0.6509804, 1,
-0.206932, -0.4989068, -3.921197, 0, 1, 0.6588235, 1,
-0.2065405, 0.7874483, -0.6339247, 0, 1, 0.6627451, 1,
-0.2062982, 1.05606, -0.7041219, 0, 1, 0.6705883, 1,
-0.1943671, -2.373064, -2.843796, 0, 1, 0.6745098, 1,
-0.193088, -0.3482902, -2.699384, 0, 1, 0.682353, 1,
-0.1916229, 0.4373836, -0.481844, 0, 1, 0.6862745, 1,
-0.1873554, -0.983761, -0.2533854, 0, 1, 0.6941177, 1,
-0.1868579, -0.4915992, -2.68708, 0, 1, 0.7019608, 1,
-0.1862034, 1.452442, -0.9101462, 0, 1, 0.7058824, 1,
-0.1861785, 0.4702621, -0.08620945, 0, 1, 0.7137255, 1,
-0.1846408, 0.6613672, 1.736404, 0, 1, 0.7176471, 1,
-0.174076, -0.3258489, -1.893533, 0, 1, 0.7254902, 1,
-0.1736693, 1.472886, 0.4129884, 0, 1, 0.7294118, 1,
-0.1673393, -0.6057352, -3.101272, 0, 1, 0.7372549, 1,
-0.1665778, -0.7745019, -1.314608, 0, 1, 0.7411765, 1,
-0.1634955, 0.3546106, -0.3146361, 0, 1, 0.7490196, 1,
-0.1620029, -0.6350558, -4.059252, 0, 1, 0.7529412, 1,
-0.1615503, -0.6983888, -2.563869, 0, 1, 0.7607843, 1,
-0.1590578, -0.05787125, -1.906813, 0, 1, 0.7647059, 1,
-0.1567264, 0.2667052, -0.6087232, 0, 1, 0.772549, 1,
-0.1543019, 0.4312543, -0.9001909, 0, 1, 0.7764706, 1,
-0.153131, -1.803882, -2.593263, 0, 1, 0.7843137, 1,
-0.1518892, -0.119777, -0.7783149, 0, 1, 0.7882353, 1,
-0.1517809, -0.210708, -1.195665, 0, 1, 0.7960784, 1,
-0.1475447, -0.4125618, -2.734492, 0, 1, 0.8039216, 1,
-0.1405877, -1.883371, -3.206121, 0, 1, 0.8078431, 1,
-0.1378117, 1.241119, 0.7535509, 0, 1, 0.8156863, 1,
-0.126754, -0.8475773, -2.956548, 0, 1, 0.8196079, 1,
-0.1247836, -1.288963, -4.783725, 0, 1, 0.827451, 1,
-0.123165, 1.44308, 0.2030952, 0, 1, 0.8313726, 1,
-0.1214668, -0.2212137, -2.116282, 0, 1, 0.8392157, 1,
-0.1188613, -0.3359624, -3.220805, 0, 1, 0.8431373, 1,
-0.1186499, 0.4850154, 1.062796, 0, 1, 0.8509804, 1,
-0.1183318, 0.4205795, -0.6581735, 0, 1, 0.854902, 1,
-0.1179782, 1.773978, 0.4409694, 0, 1, 0.8627451, 1,
-0.1062386, -0.2664406, -2.833258, 0, 1, 0.8666667, 1,
-0.1058591, -0.1417427, -2.599708, 0, 1, 0.8745098, 1,
-0.1039881, 1.040361, 0.4371666, 0, 1, 0.8784314, 1,
-0.1036448, -0.1754891, -3.457617, 0, 1, 0.8862745, 1,
-0.1032378, -0.6223993, -1.778486, 0, 1, 0.8901961, 1,
-0.1030147, 1.936416, -1.381471, 0, 1, 0.8980392, 1,
-0.1021052, -0.03817675, -2.384174, 0, 1, 0.9058824, 1,
-0.1011248, 2.645291, -0.586297, 0, 1, 0.9098039, 1,
-0.1011003, -0.4747606, -4.14485, 0, 1, 0.9176471, 1,
-0.1000813, 0.6720534, -2.682589, 0, 1, 0.9215686, 1,
-0.09736877, 0.5858933, 0.09300701, 0, 1, 0.9294118, 1,
-0.09518047, -2.019253, -3.191024, 0, 1, 0.9333333, 1,
-0.08963422, 0.6644275, 0.63994, 0, 1, 0.9411765, 1,
-0.08863416, 0.4409913, -1.131095, 0, 1, 0.945098, 1,
-0.08330645, 2.47827, 0.6592153, 0, 1, 0.9529412, 1,
-0.08209961, -0.09118223, -2.397901, 0, 1, 0.9568627, 1,
-0.081892, 1.163325, 1.369365, 0, 1, 0.9647059, 1,
-0.08153185, 1.20188, 1.863046, 0, 1, 0.9686275, 1,
-0.08120603, -1.18925, -3.250793, 0, 1, 0.9764706, 1,
-0.08056022, -0.4332518, -4.119112, 0, 1, 0.9803922, 1,
-0.07879306, 0.4160303, 0.06312295, 0, 1, 0.9882353, 1,
-0.07737795, 0.6458803, 0.9144076, 0, 1, 0.9921569, 1,
-0.07664998, 1.154599, 1.53879, 0, 1, 1, 1,
-0.07660217, 0.3618578, -1.192011, 0, 0.9921569, 1, 1,
-0.07580648, 1.0058, -1.614998, 0, 0.9882353, 1, 1,
-0.07453337, 0.02739683, -2.107255, 0, 0.9803922, 1, 1,
-0.0742673, 1.381776, 1.09285, 0, 0.9764706, 1, 1,
-0.07404035, 0.2943681, -0.08396203, 0, 0.9686275, 1, 1,
-0.07242627, 0.3649738, -0.1019411, 0, 0.9647059, 1, 1,
-0.07232315, 1.037982, -0.8464928, 0, 0.9568627, 1, 1,
-0.06939198, -1.678349, -3.405506, 0, 0.9529412, 1, 1,
-0.06889906, 0.1347553, -0.1950098, 0, 0.945098, 1, 1,
-0.0672159, 1.664427, -1.026215, 0, 0.9411765, 1, 1,
-0.04158686, -0.208405, -0.7839623, 0, 0.9333333, 1, 1,
-0.03491135, 0.021356, -0.8433094, 0, 0.9294118, 1, 1,
-0.03347572, -0.1460266, -1.732959, 0, 0.9215686, 1, 1,
-0.03344362, 0.9406409, 2.429005, 0, 0.9176471, 1, 1,
-0.02748039, -0.5166937, -5.898126, 0, 0.9098039, 1, 1,
-0.0274508, -1.492776, -2.909737, 0, 0.9058824, 1, 1,
-0.02391089, -2.002599, -3.237212, 0, 0.8980392, 1, 1,
-0.02102505, -1.185925, -3.834594, 0, 0.8901961, 1, 1,
-0.01340457, 0.06023896, -0.5682105, 0, 0.8862745, 1, 1,
-0.006798063, 0.3773315, -0.5574257, 0, 0.8784314, 1, 1,
-0.002768237, 0.3426922, 1.375449, 0, 0.8745098, 1, 1,
-0.002083058, -2.010951, -4.331954, 0, 0.8666667, 1, 1,
-0.001701792, 0.3762668, 0.649686, 0, 0.8627451, 1, 1,
-0.001271805, -0.3814082, -4.177751, 0, 0.854902, 1, 1,
-0.0002922551, -1.423267, -1.524352, 0, 0.8509804, 1, 1,
0.0006455229, 0.3946028, 0.3473417, 0, 0.8431373, 1, 1,
0.007677537, -0.6055977, 2.025266, 0, 0.8392157, 1, 1,
0.02342874, 1.223741, 0.8550221, 0, 0.8313726, 1, 1,
0.02474588, -0.2585652, 2.049978, 0, 0.827451, 1, 1,
0.02887982, 0.1337411, 0.09024127, 0, 0.8196079, 1, 1,
0.02922385, 0.6936874, 1.3468, 0, 0.8156863, 1, 1,
0.03110642, -1.469803, 1.776415, 0, 0.8078431, 1, 1,
0.03159999, -0.1395592, 1.939511, 0, 0.8039216, 1, 1,
0.03786181, 0.8519474, -0.06628795, 0, 0.7960784, 1, 1,
0.04744244, 1.257547, 0.8338795, 0, 0.7882353, 1, 1,
0.05431062, 0.920732, 0.1435509, 0, 0.7843137, 1, 1,
0.05451115, 0.6709758, 2.021698, 0, 0.7764706, 1, 1,
0.05580739, 1.41077, 0.9569545, 0, 0.772549, 1, 1,
0.06158582, -0.6845645, 4.337208, 0, 0.7647059, 1, 1,
0.06284704, 1.966819, -0.4736878, 0, 0.7607843, 1, 1,
0.0628613, 0.5765755, -0.06668899, 0, 0.7529412, 1, 1,
0.06625511, 2.295563, 0.5801047, 0, 0.7490196, 1, 1,
0.06873702, -1.132994, 2.378559, 0, 0.7411765, 1, 1,
0.07215743, -0.004379985, 2.18176, 0, 0.7372549, 1, 1,
0.07281705, 1.422299, -2.286431, 0, 0.7294118, 1, 1,
0.07294717, -0.2072122, 3.637567, 0, 0.7254902, 1, 1,
0.07334456, -1.609191, 3.996403, 0, 0.7176471, 1, 1,
0.07507013, -0.4280572, 2.569673, 0, 0.7137255, 1, 1,
0.07847411, -0.1876572, 4.116028, 0, 0.7058824, 1, 1,
0.08148567, -0.7239297, 2.961163, 0, 0.6980392, 1, 1,
0.08441744, 0.05473736, 2.429064, 0, 0.6941177, 1, 1,
0.08492516, -0.01798649, 1.584857, 0, 0.6862745, 1, 1,
0.09133621, 2.086682, 1.710192, 0, 0.682353, 1, 1,
0.09787612, -0.7976063, 4.419158, 0, 0.6745098, 1, 1,
0.1007283, -0.9795307, 4.213192, 0, 0.6705883, 1, 1,
0.1028092, -2.446516, 4.084051, 0, 0.6627451, 1, 1,
0.1030454, -2.062873, 2.35943, 0, 0.6588235, 1, 1,
0.1082877, -0.189711, 1.705323, 0, 0.6509804, 1, 1,
0.1098146, 0.3003477, 0.6445385, 0, 0.6470588, 1, 1,
0.1119784, -0.6649386, 2.673136, 0, 0.6392157, 1, 1,
0.1128567, -0.3404925, 1.34564, 0, 0.6352941, 1, 1,
0.1154414, 1.483916, 1.213796, 0, 0.627451, 1, 1,
0.1227746, -0.3584972, 3.842424, 0, 0.6235294, 1, 1,
0.1250197, 0.3671993, 0.05112628, 0, 0.6156863, 1, 1,
0.1303929, -0.1684491, 2.475386, 0, 0.6117647, 1, 1,
0.1306386, 0.6711026, 1.405022, 0, 0.6039216, 1, 1,
0.1313006, 0.7079791, 0.2854289, 0, 0.5960785, 1, 1,
0.1323731, 1.206777, -0.9995639, 0, 0.5921569, 1, 1,
0.1365664, 0.6883842, 1.585073, 0, 0.5843138, 1, 1,
0.1410086, 0.3007662, 0.6999588, 0, 0.5803922, 1, 1,
0.1410364, -1.069697, 2.844092, 0, 0.572549, 1, 1,
0.1462678, -0.9826777, 3.257122, 0, 0.5686275, 1, 1,
0.1475418, 1.257233, 0.9401149, 0, 0.5607843, 1, 1,
0.1499287, -0.2197757, 2.770105, 0, 0.5568628, 1, 1,
0.15216, -0.9904227, 3.215397, 0, 0.5490196, 1, 1,
0.1527605, -2.142498, 2.015224, 0, 0.5450981, 1, 1,
0.1563226, -1.069278, 4.548918, 0, 0.5372549, 1, 1,
0.1648887, -0.120846, 1.777917, 0, 0.5333334, 1, 1,
0.1693455, -0.2328286, 2.703311, 0, 0.5254902, 1, 1,
0.1717223, -0.8807332, 0.6344221, 0, 0.5215687, 1, 1,
0.1727399, -0.1538657, 2.879822, 0, 0.5137255, 1, 1,
0.1747061, -0.2542164, 4.349426, 0, 0.509804, 1, 1,
0.1771495, 0.2501844, 0.5129865, 0, 0.5019608, 1, 1,
0.1824531, 1.812975, 0.2472129, 0, 0.4941176, 1, 1,
0.1841255, -0.9054554, 2.485545, 0, 0.4901961, 1, 1,
0.1886088, -1.469142, 1.254683, 0, 0.4823529, 1, 1,
0.1926562, -1.097505, 3.145797, 0, 0.4784314, 1, 1,
0.1938092, 0.1041056, 2.688077, 0, 0.4705882, 1, 1,
0.1982478, -0.3733494, 2.073859, 0, 0.4666667, 1, 1,
0.2021087, -0.1920549, 2.959427, 0, 0.4588235, 1, 1,
0.2055342, 0.4232138, 0.6739912, 0, 0.454902, 1, 1,
0.2064879, 0.3855726, 0.1157822, 0, 0.4470588, 1, 1,
0.209198, 0.9410261, -0.5634898, 0, 0.4431373, 1, 1,
0.2171256, 0.3443867, 0.6182725, 0, 0.4352941, 1, 1,
0.2189131, 0.6422749, -1.008767, 0, 0.4313726, 1, 1,
0.2194431, -2.042895, 2.378506, 0, 0.4235294, 1, 1,
0.2199967, 0.2329265, -0.1214126, 0, 0.4196078, 1, 1,
0.2325249, 0.02586821, 2.466522, 0, 0.4117647, 1, 1,
0.2352102, -0.5630085, 3.022826, 0, 0.4078431, 1, 1,
0.2360365, 0.4509996, 1.557638, 0, 0.4, 1, 1,
0.2386626, 0.04017146, 0.681852, 0, 0.3921569, 1, 1,
0.2391568, -0.2916705, 0.6745251, 0, 0.3882353, 1, 1,
0.2422158, -0.4226348, 2.158968, 0, 0.3803922, 1, 1,
0.2435856, -1.712275, 3.651413, 0, 0.3764706, 1, 1,
0.2436272, -1.057062, 2.022032, 0, 0.3686275, 1, 1,
0.2456933, -0.254359, 3.586144, 0, 0.3647059, 1, 1,
0.2510939, 0.2422362, 2.020211, 0, 0.3568628, 1, 1,
0.253473, -0.3497774, 1.116572, 0, 0.3529412, 1, 1,
0.2568373, -0.05236446, 2.622805, 0, 0.345098, 1, 1,
0.2611803, -0.415882, 2.013635, 0, 0.3411765, 1, 1,
0.2676493, -0.2644455, 0.5185014, 0, 0.3333333, 1, 1,
0.2686751, -0.5385427, 3.250984, 0, 0.3294118, 1, 1,
0.269595, -2.086559, 4.262621, 0, 0.3215686, 1, 1,
0.2696499, -1.757824, 3.010869, 0, 0.3176471, 1, 1,
0.2728769, -0.540765, 3.881215, 0, 0.3098039, 1, 1,
0.273977, -0.6005654, 3.235328, 0, 0.3058824, 1, 1,
0.2761354, -1.379658, 2.082862, 0, 0.2980392, 1, 1,
0.2812955, 0.1487788, 0.2674997, 0, 0.2901961, 1, 1,
0.2920748, 1.4643, 0.2970813, 0, 0.2862745, 1, 1,
0.295841, -0.2642117, 2.787847, 0, 0.2784314, 1, 1,
0.3020037, 1.125474, -1.140865, 0, 0.2745098, 1, 1,
0.3021152, -0.432038, 3.273244, 0, 0.2666667, 1, 1,
0.3083706, 0.769051, -0.1646781, 0, 0.2627451, 1, 1,
0.3102953, -0.7108029, 2.100814, 0, 0.254902, 1, 1,
0.312418, 1.864267, 0.5080585, 0, 0.2509804, 1, 1,
0.3154458, 0.7621849, 2.709424, 0, 0.2431373, 1, 1,
0.3247375, 0.5686901, 0.9264128, 0, 0.2392157, 1, 1,
0.3254742, -1.931917, 2.996448, 0, 0.2313726, 1, 1,
0.326958, -0.1701841, 0.7272429, 0, 0.227451, 1, 1,
0.3273695, 0.6584043, 0.5403275, 0, 0.2196078, 1, 1,
0.3274919, -0.7090549, 2.776409, 0, 0.2156863, 1, 1,
0.3325792, 0.2515178, 1.574988, 0, 0.2078431, 1, 1,
0.3334745, -1.142632, 2.757564, 0, 0.2039216, 1, 1,
0.3339607, -1.179471, 3.023211, 0, 0.1960784, 1, 1,
0.335661, -1.745041, 4.199606, 0, 0.1882353, 1, 1,
0.3397437, 0.1032806, 1.570692, 0, 0.1843137, 1, 1,
0.3432105, 0.2951429, -0.9398749, 0, 0.1764706, 1, 1,
0.3440754, -1.398501, 1.960937, 0, 0.172549, 1, 1,
0.344225, 1.077595, 0.2329222, 0, 0.1647059, 1, 1,
0.3471702, 0.1861515, 1.371107, 0, 0.1607843, 1, 1,
0.3533609, -0.8706214, 2.74026, 0, 0.1529412, 1, 1,
0.3553959, 0.04079967, -1.162392, 0, 0.1490196, 1, 1,
0.3569755, -0.08604401, 1.8311, 0, 0.1411765, 1, 1,
0.3577059, 1.764556, -1.898971, 0, 0.1372549, 1, 1,
0.3593288, 0.8655261, 1.470934, 0, 0.1294118, 1, 1,
0.360144, -0.2647257, 2.745818, 0, 0.1254902, 1, 1,
0.3606105, -1.607246, 3.081203, 0, 0.1176471, 1, 1,
0.3624175, 0.6719362, -2.397612, 0, 0.1137255, 1, 1,
0.3631378, -0.7793852, 1.721632, 0, 0.1058824, 1, 1,
0.3679613, 1.601502, 1.923353, 0, 0.09803922, 1, 1,
0.3682709, -0.5476608, 3.177484, 0, 0.09411765, 1, 1,
0.3685286, 0.8119135, -0.280693, 0, 0.08627451, 1, 1,
0.3700911, 0.5334829, 1.551646, 0, 0.08235294, 1, 1,
0.3701547, -1.511354, 4.418649, 0, 0.07450981, 1, 1,
0.3763741, 0.2466285, 0.7282692, 0, 0.07058824, 1, 1,
0.376687, -0.6160965, 1.288273, 0, 0.0627451, 1, 1,
0.3801729, 1.642971, -0.7527658, 0, 0.05882353, 1, 1,
0.3836648, -1.891126, 2.294731, 0, 0.05098039, 1, 1,
0.3893858, 0.3537052, 1.211153, 0, 0.04705882, 1, 1,
0.390875, 0.3563353, 2.411434, 0, 0.03921569, 1, 1,
0.3998498, 0.5070726, 0.4363018, 0, 0.03529412, 1, 1,
0.4003729, -0.9592955, 1.7457, 0, 0.02745098, 1, 1,
0.4007072, 0.4440471, 1.662552, 0, 0.02352941, 1, 1,
0.4024973, -1.579272, 5.226984, 0, 0.01568628, 1, 1,
0.4025591, 1.835553, -0.01234214, 0, 0.01176471, 1, 1,
0.405704, 0.2981315, 1.385888, 0, 0.003921569, 1, 1,
0.4102465, -0.2580523, 2.568249, 0.003921569, 0, 1, 1,
0.4113427, -0.2241367, 1.199387, 0.007843138, 0, 1, 1,
0.4131229, 1.171565, -0.4189367, 0.01568628, 0, 1, 1,
0.4168482, 1.155006, -0.4247329, 0.01960784, 0, 1, 1,
0.4187839, 0.5569826, -0.8628597, 0.02745098, 0, 1, 1,
0.4201375, -1.247162, 2.288687, 0.03137255, 0, 1, 1,
0.4227112, -0.4618394, 3.396, 0.03921569, 0, 1, 1,
0.4234604, 1.083456, 0.6917939, 0.04313726, 0, 1, 1,
0.4264382, 1.410313, 0.2055338, 0.05098039, 0, 1, 1,
0.4426847, -0.2448805, 1.507819, 0.05490196, 0, 1, 1,
0.4483989, -0.1989634, 3.154958, 0.0627451, 0, 1, 1,
0.4509404, 1.13937, 0.3412116, 0.06666667, 0, 1, 1,
0.454236, -0.01087762, 1.494129, 0.07450981, 0, 1, 1,
0.4550054, 1.334606, 1.356719, 0.07843138, 0, 1, 1,
0.4574814, 0.5916742, 0.3846627, 0.08627451, 0, 1, 1,
0.4585302, -0.1418988, 2.02488, 0.09019608, 0, 1, 1,
0.4609145, 1.497472, 1.188056, 0.09803922, 0, 1, 1,
0.4614674, -1.508463, 3.102045, 0.1058824, 0, 1, 1,
0.4795938, 0.3408436, 1.392094, 0.1098039, 0, 1, 1,
0.4811195, -0.6540038, 3.822081, 0.1176471, 0, 1, 1,
0.4857316, 0.8095037, -0.07554957, 0.1215686, 0, 1, 1,
0.4876345, -0.4632737, 2.273078, 0.1294118, 0, 1, 1,
0.4938205, -0.9261254, 2.834381, 0.1333333, 0, 1, 1,
0.4961474, 0.3607301, -0.5368154, 0.1411765, 0, 1, 1,
0.4997836, -1.545322, 2.435099, 0.145098, 0, 1, 1,
0.5044581, 0.09675769, 0.8862481, 0.1529412, 0, 1, 1,
0.5047449, 0.3751127, 0.4771899, 0.1568628, 0, 1, 1,
0.5058562, -1.204634, 4.036939, 0.1647059, 0, 1, 1,
0.509437, -0.02792173, 0.9785465, 0.1686275, 0, 1, 1,
0.5127599, -1.211055, 1.728672, 0.1764706, 0, 1, 1,
0.512934, 0.4181694, 0.8150697, 0.1803922, 0, 1, 1,
0.519591, 0.005188047, 2.905258, 0.1882353, 0, 1, 1,
0.5199788, -0.9275509, 2.251076, 0.1921569, 0, 1, 1,
0.5211286, -0.9725925, 0.2546492, 0.2, 0, 1, 1,
0.5229463, -1.936155, 2.340969, 0.2078431, 0, 1, 1,
0.5302178, 0.1197417, 0.3506353, 0.2117647, 0, 1, 1,
0.5332446, 0.4143532, 1.142283, 0.2196078, 0, 1, 1,
0.5332859, 0.2868122, 1.743979, 0.2235294, 0, 1, 1,
0.5370893, -0.7968222, 2.138475, 0.2313726, 0, 1, 1,
0.5374946, 0.5952243, 2.254127, 0.2352941, 0, 1, 1,
0.5403789, -0.6376101, 2.60587, 0.2431373, 0, 1, 1,
0.5431914, -0.9898804, 4.772179, 0.2470588, 0, 1, 1,
0.5487313, -2.059423, 4.128204, 0.254902, 0, 1, 1,
0.5529305, -0.1263516, 1.645754, 0.2588235, 0, 1, 1,
0.5535368, 0.5361254, 0.1079241, 0.2666667, 0, 1, 1,
0.5588813, 0.8147798, 0.5086351, 0.2705882, 0, 1, 1,
0.558945, 0.5594888, -0.6749574, 0.2784314, 0, 1, 1,
0.5618995, -1.017439, 2.326134, 0.282353, 0, 1, 1,
0.5621077, 1.161117, -0.01689376, 0.2901961, 0, 1, 1,
0.5743245, 0.1325444, 2.306834, 0.2941177, 0, 1, 1,
0.5827305, 0.1122516, 2.935362, 0.3019608, 0, 1, 1,
0.590381, 2.451474, -1.199598, 0.3098039, 0, 1, 1,
0.5915696, 0.5817382, 1.723887, 0.3137255, 0, 1, 1,
0.5927197, -0.710949, 2.811392, 0.3215686, 0, 1, 1,
0.6019247, -1.384071, 1.476142, 0.3254902, 0, 1, 1,
0.615521, -0.02794219, 0.6388014, 0.3333333, 0, 1, 1,
0.6170706, 0.9265242, 0.6085525, 0.3372549, 0, 1, 1,
0.6185885, -0.403393, 3.586959, 0.345098, 0, 1, 1,
0.6233112, -0.7770658, 3.964398, 0.3490196, 0, 1, 1,
0.628786, 0.7615829, -0.8886749, 0.3568628, 0, 1, 1,
0.6289991, -0.5515711, 1.573349, 0.3607843, 0, 1, 1,
0.6319828, -1.040697, 2.035611, 0.3686275, 0, 1, 1,
0.6332033, 0.9779552, -0.1984272, 0.372549, 0, 1, 1,
0.6359544, 1.825827, 0.3084735, 0.3803922, 0, 1, 1,
0.6452684, -0.9611797, 2.754574, 0.3843137, 0, 1, 1,
0.6458091, 0.2794778, 3.294496, 0.3921569, 0, 1, 1,
0.6472313, 0.6940098, 0.9964831, 0.3960784, 0, 1, 1,
0.6507642, -0.57454, 2.560574, 0.4039216, 0, 1, 1,
0.6535991, 1.114109, 0.06274781, 0.4117647, 0, 1, 1,
0.658157, -0.1235789, 1.662024, 0.4156863, 0, 1, 1,
0.660098, 0.3388127, 1.70049, 0.4235294, 0, 1, 1,
0.6636208, -0.2130521, 2.856169, 0.427451, 0, 1, 1,
0.6686398, -0.01948639, 3.117191, 0.4352941, 0, 1, 1,
0.6704031, 0.3522508, 3.077322, 0.4392157, 0, 1, 1,
0.6777136, -1.235023, 2.18691, 0.4470588, 0, 1, 1,
0.6808455, 0.7879065, -0.403557, 0.4509804, 0, 1, 1,
0.6851567, -1.337913, 2.275179, 0.4588235, 0, 1, 1,
0.6878121, 0.1022072, 0.4923665, 0.4627451, 0, 1, 1,
0.6948138, -0.9245733, 3.64911, 0.4705882, 0, 1, 1,
0.7011528, -1.246747, 4.09724, 0.4745098, 0, 1, 1,
0.7045497, 0.1584735, 2.632077, 0.4823529, 0, 1, 1,
0.7076701, -0.3469229, 3.160564, 0.4862745, 0, 1, 1,
0.7179583, -0.8710971, 1.707843, 0.4941176, 0, 1, 1,
0.7183452, -0.8062999, 2.404649, 0.5019608, 0, 1, 1,
0.7276884, -0.2995606, 1.715632, 0.5058824, 0, 1, 1,
0.729901, -0.7073001, 2.485597, 0.5137255, 0, 1, 1,
0.7299637, -0.2952723, 2.187079, 0.5176471, 0, 1, 1,
0.7318439, 0.9825719, -0.9501095, 0.5254902, 0, 1, 1,
0.7349371, -1.831186, 2.331604, 0.5294118, 0, 1, 1,
0.7364771, -0.2890242, 0.1174668, 0.5372549, 0, 1, 1,
0.7388431, -2.301661, 2.803426, 0.5411765, 0, 1, 1,
0.7450059, -0.1005099, 1.60689, 0.5490196, 0, 1, 1,
0.7461231, 0.81884, 0.05614847, 0.5529412, 0, 1, 1,
0.7535685, -0.8283537, 1.670986, 0.5607843, 0, 1, 1,
0.7610657, 1.616486, 0.4944495, 0.5647059, 0, 1, 1,
0.7630672, 0.8328691, 0.8601862, 0.572549, 0, 1, 1,
0.7649496, 0.6218227, 1.745528, 0.5764706, 0, 1, 1,
0.7716146, 0.3785335, 0.2476036, 0.5843138, 0, 1, 1,
0.773603, 0.009742907, 1.447255, 0.5882353, 0, 1, 1,
0.7747663, 0.4469547, 1.749769, 0.5960785, 0, 1, 1,
0.7769132, -0.6239604, 3.112363, 0.6039216, 0, 1, 1,
0.7794242, 0.7468317, 2.684237, 0.6078432, 0, 1, 1,
0.7979814, 1.279096, -0.7468676, 0.6156863, 0, 1, 1,
0.8001007, 0.4607167, -0.4393196, 0.6196079, 0, 1, 1,
0.8012156, 0.5126983, -0.8248272, 0.627451, 0, 1, 1,
0.8035187, -0.3839377, 4.31136, 0.6313726, 0, 1, 1,
0.8072109, -1.517448, 1.911001, 0.6392157, 0, 1, 1,
0.8112698, -0.5191548, 3.077531, 0.6431373, 0, 1, 1,
0.811799, 0.563217, 1.064451, 0.6509804, 0, 1, 1,
0.8167205, -0.8766012, 2.020275, 0.654902, 0, 1, 1,
0.8209418, 0.6632746, 1.340097, 0.6627451, 0, 1, 1,
0.836256, 1.268986, -0.2391936, 0.6666667, 0, 1, 1,
0.8498055, -1.417098, 3.039372, 0.6745098, 0, 1, 1,
0.8521801, -0.03720457, 1.943804, 0.6784314, 0, 1, 1,
0.8590305, 0.9224295, 1.47519, 0.6862745, 0, 1, 1,
0.8676652, -0.6325116, -0.3014258, 0.6901961, 0, 1, 1,
0.8679104, 0.4063047, 0.760696, 0.6980392, 0, 1, 1,
0.8708083, 0.4168787, 1.832845, 0.7058824, 0, 1, 1,
0.8757756, -1.27874, 3.989132, 0.7098039, 0, 1, 1,
0.8775145, -0.3673076, 1.912236, 0.7176471, 0, 1, 1,
0.8786817, 0.6500227, 0.5826673, 0.7215686, 0, 1, 1,
0.8858129, 0.4311889, -0.2135809, 0.7294118, 0, 1, 1,
0.8870626, 1.301751, 0.4365123, 0.7333333, 0, 1, 1,
0.8872626, 0.2096805, 1.442697, 0.7411765, 0, 1, 1,
0.8914054, -0.03961933, 2.387893, 0.7450981, 0, 1, 1,
0.897685, 0.6573038, 0.8639204, 0.7529412, 0, 1, 1,
0.9026461, -0.6139691, 1.514157, 0.7568628, 0, 1, 1,
0.9091989, 0.6840195, 3.086061, 0.7647059, 0, 1, 1,
0.9096904, -1.143395, 3.81973, 0.7686275, 0, 1, 1,
0.9099743, -0.2619035, -0.04415252, 0.7764706, 0, 1, 1,
0.9149442, -0.1827842, 1.217239, 0.7803922, 0, 1, 1,
0.9177412, 2.004574, 2.133082, 0.7882353, 0, 1, 1,
0.9182066, -0.8109732, 2.742132, 0.7921569, 0, 1, 1,
0.9185272, -1.513806, 4.553798, 0.8, 0, 1, 1,
0.9216008, -1.116143, 1.41129, 0.8078431, 0, 1, 1,
0.9298369, 0.5591906, 1.784912, 0.8117647, 0, 1, 1,
0.9370008, 1.014965, 0.2235886, 0.8196079, 0, 1, 1,
0.9420464, -0.7634266, 2.195314, 0.8235294, 0, 1, 1,
0.9421803, 1.453981, -0.1402738, 0.8313726, 0, 1, 1,
0.9467925, -0.2424627, 1.085444, 0.8352941, 0, 1, 1,
0.9496508, -0.1510689, 0.9271744, 0.8431373, 0, 1, 1,
0.9499657, 1.598904, 0.1440466, 0.8470588, 0, 1, 1,
0.9515724, 0.748399, 0.3037288, 0.854902, 0, 1, 1,
0.9552982, 0.4351822, 1.913565, 0.8588235, 0, 1, 1,
0.9691558, -1.347648, 3.176362, 0.8666667, 0, 1, 1,
0.9703499, -1.473291, 0.6080114, 0.8705882, 0, 1, 1,
0.972195, 1.074827, 2.3985, 0.8784314, 0, 1, 1,
0.9731949, 0.2089641, 2.363042, 0.8823529, 0, 1, 1,
0.9736128, -0.6346975, 2.495365, 0.8901961, 0, 1, 1,
0.9754125, -0.319848, 3.344044, 0.8941177, 0, 1, 1,
0.9777255, 0.122252, 1.600713, 0.9019608, 0, 1, 1,
0.9806789, -1.692813, 3.42715, 0.9098039, 0, 1, 1,
0.9812813, 1.247219, 1.564783, 0.9137255, 0, 1, 1,
0.9879483, 1.801668, 0.6033053, 0.9215686, 0, 1, 1,
0.9888743, 1.262408, 1.571401, 0.9254902, 0, 1, 1,
0.9892681, -0.03585489, 1.929781, 0.9333333, 0, 1, 1,
0.996067, 1.600239, 1.732919, 0.9372549, 0, 1, 1,
1.001377, -0.4808037, 0.3702261, 0.945098, 0, 1, 1,
1.004604, 0.4653333, 0.4855924, 0.9490196, 0, 1, 1,
1.005457, -0.7678703, 3.019268, 0.9568627, 0, 1, 1,
1.009462, 1.013032, 0.4425242, 0.9607843, 0, 1, 1,
1.009518, 0.8130055, 1.384703, 0.9686275, 0, 1, 1,
1.011052, -0.02717513, 3.01562, 0.972549, 0, 1, 1,
1.012278, 0.1195439, 1.574906, 0.9803922, 0, 1, 1,
1.015018, -1.293923, 2.899141, 0.9843137, 0, 1, 1,
1.016785, -0.2782194, 2.967444, 0.9921569, 0, 1, 1,
1.022299, 0.6126752, 2.729022, 0.9960784, 0, 1, 1,
1.02297, 0.04321341, 2.57565, 1, 0, 0.9960784, 1,
1.026345, -0.1979306, 1.59454, 1, 0, 0.9882353, 1,
1.027432, -0.4513073, 2.416251, 1, 0, 0.9843137, 1,
1.028352, 1.088546, 1.592638, 1, 0, 0.9764706, 1,
1.028882, 1.101473, 1.506006, 1, 0, 0.972549, 1,
1.031602, -0.9319353, 4.631573, 1, 0, 0.9647059, 1,
1.03717, -1.055648, 2.562943, 1, 0, 0.9607843, 1,
1.040859, 0.01509337, 3.249409, 1, 0, 0.9529412, 1,
1.047858, -0.730754, -0.1444828, 1, 0, 0.9490196, 1,
1.051758, -1.499731, 3.605556, 1, 0, 0.9411765, 1,
1.05338, -1.318888, 1.337288, 1, 0, 0.9372549, 1,
1.056769, -1.193877, 2.0693, 1, 0, 0.9294118, 1,
1.064132, 0.3893795, 1.164403, 1, 0, 0.9254902, 1,
1.070619, 1.21054, -0.6161984, 1, 0, 0.9176471, 1,
1.076099, 0.3863535, -0.3436658, 1, 0, 0.9137255, 1,
1.082126, -0.4532724, 2.447383, 1, 0, 0.9058824, 1,
1.091201, -0.9928167, 2.553282, 1, 0, 0.9019608, 1,
1.091289, -0.1639939, 2.447394, 1, 0, 0.8941177, 1,
1.092658, 1.061737, -1.437418, 1, 0, 0.8862745, 1,
1.094261, -0.4219105, 2.039657, 1, 0, 0.8823529, 1,
1.094997, 0.5831347, -0.01432592, 1, 0, 0.8745098, 1,
1.099268, 1.58597, 1.018935, 1, 0, 0.8705882, 1,
1.105537, -0.2151219, 2.492117, 1, 0, 0.8627451, 1,
1.107173, -1.034567, 1.092416, 1, 0, 0.8588235, 1,
1.109751, 0.2695973, 2.820327, 1, 0, 0.8509804, 1,
1.110081, 0.3591, 0.8893256, 1, 0, 0.8470588, 1,
1.11103, 1.622741, 1.652593, 1, 0, 0.8392157, 1,
1.112626, 0.8481042, 3.1866, 1, 0, 0.8352941, 1,
1.121854, -0.9413257, 3.41302, 1, 0, 0.827451, 1,
1.124981, -0.3874093, 1.637752, 1, 0, 0.8235294, 1,
1.127221, 0.3999914, 0.8337786, 1, 0, 0.8156863, 1,
1.135649, -0.5599246, 3.157964, 1, 0, 0.8117647, 1,
1.15238, 0.3873209, 2.078686, 1, 0, 0.8039216, 1,
1.152615, -0.5204442, 3.016741, 1, 0, 0.7960784, 1,
1.159277, -0.4515851, 1.722642, 1, 0, 0.7921569, 1,
1.160181, -0.5876702, 1.827045, 1, 0, 0.7843137, 1,
1.16074, -0.1675661, 1.705369, 1, 0, 0.7803922, 1,
1.160953, -0.3498824, 1.770832, 1, 0, 0.772549, 1,
1.162279, -1.937035, 1.7844, 1, 0, 0.7686275, 1,
1.166609, 0.8023069, 0.1362146, 1, 0, 0.7607843, 1,
1.166748, 0.471399, 0.7196814, 1, 0, 0.7568628, 1,
1.174085, 1.536226, 2.350892, 1, 0, 0.7490196, 1,
1.174091, -0.2052658, 2.285049, 1, 0, 0.7450981, 1,
1.174504, 1.450764, 0.4926572, 1, 0, 0.7372549, 1,
1.175132, 0.7315074, 1.889916, 1, 0, 0.7333333, 1,
1.175671, 0.05155905, 1.028314, 1, 0, 0.7254902, 1,
1.178148, -0.4687937, 1.14413, 1, 0, 0.7215686, 1,
1.199468, 1.246568, 2.735979, 1, 0, 0.7137255, 1,
1.205491, 0.3137184, 2.277543, 1, 0, 0.7098039, 1,
1.209939, 0.07525898, 0.09916297, 1, 0, 0.7019608, 1,
1.210317, -1.006703, 3.207113, 1, 0, 0.6941177, 1,
1.216222, 0.4857582, 3.275639, 1, 0, 0.6901961, 1,
1.220069, -0.7988166, 2.98686, 1, 0, 0.682353, 1,
1.223075, 1.838599, -0.6362185, 1, 0, 0.6784314, 1,
1.224469, 0.3838162, 1.00261, 1, 0, 0.6705883, 1,
1.230269, -0.3295686, 1.423834, 1, 0, 0.6666667, 1,
1.235177, -0.6529797, 1.584645, 1, 0, 0.6588235, 1,
1.252204, 0.197168, 1.322884, 1, 0, 0.654902, 1,
1.257143, -3.24211, 2.156581, 1, 0, 0.6470588, 1,
1.257161, 0.1770273, 0.5296575, 1, 0, 0.6431373, 1,
1.26194, 2.432094, 0.7924769, 1, 0, 0.6352941, 1,
1.275793, 1.171775, 2.380648, 1, 0, 0.6313726, 1,
1.281418, 1.520684, 0.8910559, 1, 0, 0.6235294, 1,
1.297948, 1.781133, -0.3516559, 1, 0, 0.6196079, 1,
1.30117, -1.050081, 2.453703, 1, 0, 0.6117647, 1,
1.303126, -0.6909372, 2.849123, 1, 0, 0.6078432, 1,
1.308205, -0.9704655, 3.090102, 1, 0, 0.6, 1,
1.31704, 0.09860198, 2.033512, 1, 0, 0.5921569, 1,
1.327492, -0.4535436, 0.1434768, 1, 0, 0.5882353, 1,
1.327986, -1.158316, 2.448892, 1, 0, 0.5803922, 1,
1.346691, -0.7864177, 3.014633, 1, 0, 0.5764706, 1,
1.350184, -0.703238, 1.559412, 1, 0, 0.5686275, 1,
1.351603, 0.6561353, -0.3289452, 1, 0, 0.5647059, 1,
1.361214, 1.304474, 1.557844, 1, 0, 0.5568628, 1,
1.367223, -2.108821, 3.653256, 1, 0, 0.5529412, 1,
1.379018, 1.074035, -1.26627, 1, 0, 0.5450981, 1,
1.380379, 0.7925026, 1.349156, 1, 0, 0.5411765, 1,
1.394043, 0.1620377, 1.336491, 1, 0, 0.5333334, 1,
1.397507, 0.1116791, 2.545742, 1, 0, 0.5294118, 1,
1.401333, 1.042879, 0.7575566, 1, 0, 0.5215687, 1,
1.404391, -0.5036502, 0.6779634, 1, 0, 0.5176471, 1,
1.410356, -0.7987596, 2.635375, 1, 0, 0.509804, 1,
1.410584, -0.6385334, 1.84876, 1, 0, 0.5058824, 1,
1.411804, -1.473921, 1.21672, 1, 0, 0.4980392, 1,
1.416271, -0.7981124, 3.230387, 1, 0, 0.4901961, 1,
1.418053, 0.5141259, 1.611337, 1, 0, 0.4862745, 1,
1.424271, 0.8530418, 1.620649, 1, 0, 0.4784314, 1,
1.431506, 0.8954824, 0.3692324, 1, 0, 0.4745098, 1,
1.433817, -1.223717, 1.897374, 1, 0, 0.4666667, 1,
1.434682, 0.6089182, 0.4208407, 1, 0, 0.4627451, 1,
1.43632, -0.8691137, 2.058422, 1, 0, 0.454902, 1,
1.438394, -0.2024677, 0.5736561, 1, 0, 0.4509804, 1,
1.439798, 1.683913, 2.428607, 1, 0, 0.4431373, 1,
1.440233, -0.9386747, 1.180768, 1, 0, 0.4392157, 1,
1.448079, 0.263936, 1.549883, 1, 0, 0.4313726, 1,
1.469738, -0.86168, 2.954348, 1, 0, 0.427451, 1,
1.484398, 0.7877605, 0.9346733, 1, 0, 0.4196078, 1,
1.488147, 0.02675765, 0.3105, 1, 0, 0.4156863, 1,
1.490282, -0.3295943, 1.215572, 1, 0, 0.4078431, 1,
1.491037, -0.3158198, 0.5935141, 1, 0, 0.4039216, 1,
1.492485, 0.3093401, 0.5395129, 1, 0, 0.3960784, 1,
1.49268, 1.481801, 0.05406068, 1, 0, 0.3882353, 1,
1.509657, 0.954767, 1.496994, 1, 0, 0.3843137, 1,
1.515792, -1.581897, 4.017159, 1, 0, 0.3764706, 1,
1.529006, 1.294755, 1.72426, 1, 0, 0.372549, 1,
1.532148, -0.1308205, 0.5020214, 1, 0, 0.3647059, 1,
1.540712, -1.093091, 3.194666, 1, 0, 0.3607843, 1,
1.547065, 0.5063344, 1.140863, 1, 0, 0.3529412, 1,
1.561735, 0.8479715, 2.461635, 1, 0, 0.3490196, 1,
1.564509, -1.574915, 1.772169, 1, 0, 0.3411765, 1,
1.584431, 1.206496, 1.826575, 1, 0, 0.3372549, 1,
1.585435, -1.128924, 3.841582, 1, 0, 0.3294118, 1,
1.593431, -0.8506149, 1.33565, 1, 0, 0.3254902, 1,
1.599729, -0.1399525, 1.58662, 1, 0, 0.3176471, 1,
1.600879, 0.439586, 0.64062, 1, 0, 0.3137255, 1,
1.615965, -1.752863, 2.68065, 1, 0, 0.3058824, 1,
1.626034, -0.6078517, 2.546541, 1, 0, 0.2980392, 1,
1.655291, 0.4268069, 1.352074, 1, 0, 0.2941177, 1,
1.661575, -0.5770605, 2.182983, 1, 0, 0.2862745, 1,
1.698149, -0.421394, 1.68976, 1, 0, 0.282353, 1,
1.698612, 0.7286331, 1.27341, 1, 0, 0.2745098, 1,
1.6993, -0.3066617, 2.205065, 1, 0, 0.2705882, 1,
1.717188, -1.239398, 1.845693, 1, 0, 0.2627451, 1,
1.717209, 0.1441822, 1.946745, 1, 0, 0.2588235, 1,
1.721855, 0.7643993, 2.228238, 1, 0, 0.2509804, 1,
1.742281, -0.6904365, 2.654625, 1, 0, 0.2470588, 1,
1.743285, -0.8353852, 1.178817, 1, 0, 0.2392157, 1,
1.743681, -0.4747194, 2.244616, 1, 0, 0.2352941, 1,
1.754396, -0.9472684, 4.135799, 1, 0, 0.227451, 1,
1.763331, -0.8814251, 1.661637, 1, 0, 0.2235294, 1,
1.771779, 0.4186756, 0.3067953, 1, 0, 0.2156863, 1,
1.779989, -2.228407, 2.864991, 1, 0, 0.2117647, 1,
1.784129, -0.8035851, 1.966822, 1, 0, 0.2039216, 1,
1.835561, -0.2331662, 2.715834, 1, 0, 0.1960784, 1,
1.842837, 0.4614845, 1.333094, 1, 0, 0.1921569, 1,
1.854597, 0.6313111, -0.7810301, 1, 0, 0.1843137, 1,
1.864002, -0.09791528, -0.1989202, 1, 0, 0.1803922, 1,
1.875439, 1.369839, 2.203556, 1, 0, 0.172549, 1,
1.88947, 0.1285851, -0.3669481, 1, 0, 0.1686275, 1,
1.898666, -0.1260396, 2.176723, 1, 0, 0.1607843, 1,
1.901454, 0.5915076, 0.4324789, 1, 0, 0.1568628, 1,
1.904189, -0.571172, 0.5325081, 1, 0, 0.1490196, 1,
1.91317, 0.1539618, 1.262851, 1, 0, 0.145098, 1,
1.919783, 1.226694, 1.855316, 1, 0, 0.1372549, 1,
1.920054, -1.811671, 2.392198, 1, 0, 0.1333333, 1,
1.932904, 0.02910548, 1.006496, 1, 0, 0.1254902, 1,
1.939996, 1.925772, 1.492101, 1, 0, 0.1215686, 1,
2.002451, -0.8759626, 2.803759, 1, 0, 0.1137255, 1,
2.071092, 1.472869, 0.8805527, 1, 0, 0.1098039, 1,
2.0816, 1.122322, 1.841797, 1, 0, 0.1019608, 1,
2.093923, 0.7023793, 0.3754969, 1, 0, 0.09411765, 1,
2.114584, -0.5474372, 0.01402526, 1, 0, 0.09019608, 1,
2.158702, -0.1673605, 2.236794, 1, 0, 0.08235294, 1,
2.238965, 0.6538334, 1.641659, 1, 0, 0.07843138, 1,
2.239844, 0.3590589, 2.063072, 1, 0, 0.07058824, 1,
2.257682, 0.08369379, 1.97389, 1, 0, 0.06666667, 1,
2.262657, 1.214505, 1.250847, 1, 0, 0.05882353, 1,
2.281974, 1.177181, -0.1194838, 1, 0, 0.05490196, 1,
2.296226, -0.1942426, 1.104719, 1, 0, 0.04705882, 1,
2.356684, 0.2480188, 1.536328, 1, 0, 0.04313726, 1,
2.448341, -0.05250137, 2.047265, 1, 0, 0.03529412, 1,
2.468421, -0.8086984, -0.5002617, 1, 0, 0.03137255, 1,
2.582637, -0.922341, 3.284659, 1, 0, 0.02352941, 1,
2.641671, -0.2674129, 1.326873, 1, 0, 0.01960784, 1,
2.642985, -0.8433278, 1.332613, 1, 0, 0.01176471, 1,
3.071515, 1.351735, 0.7999108, 1, 0, 0.007843138, 1
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
-0.07483292, -4.692273, -7.783832, 0, -0.5, 0.5, 0.5,
-0.07483292, -4.692273, -7.783832, 1, -0.5, 0.5, 0.5,
-0.07483292, -4.692273, -7.783832, 1, 1.5, 0.5, 0.5,
-0.07483292, -4.692273, -7.783832, 0, 1.5, 0.5, 0.5
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
-4.287793, -0.3368185, -7.783832, 0, -0.5, 0.5, 0.5,
-4.287793, -0.3368185, -7.783832, 1, -0.5, 0.5, 0.5,
-4.287793, -0.3368185, -7.783832, 1, 1.5, 0.5, 0.5,
-4.287793, -0.3368185, -7.783832, 0, 1.5, 0.5, 0.5
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
-4.287793, -4.692273, -0.3355708, 0, -0.5, 0.5, 0.5,
-4.287793, -4.692273, -0.3355708, 1, -0.5, 0.5, 0.5,
-4.287793, -4.692273, -0.3355708, 1, 1.5, 0.5, 0.5,
-4.287793, -4.692273, -0.3355708, 0, 1.5, 0.5, 0.5
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
-3, -3.687168, -6.065002,
3, -3.687168, -6.065002,
-3, -3.687168, -6.065002,
-3, -3.854686, -6.351474,
-2, -3.687168, -6.065002,
-2, -3.854686, -6.351474,
-1, -3.687168, -6.065002,
-1, -3.854686, -6.351474,
0, -3.687168, -6.065002,
0, -3.854686, -6.351474,
1, -3.687168, -6.065002,
1, -3.854686, -6.351474,
2, -3.687168, -6.065002,
2, -3.854686, -6.351474,
3, -3.687168, -6.065002,
3, -3.854686, -6.351474
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
-3, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
-3, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
-3, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
-3, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
-2, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
-2, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
-2, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
-2, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
-1, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
-1, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
-1, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
-1, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
0, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
0, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
0, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
0, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
1, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
1, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
1, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
1, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
2, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
2, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
2, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
2, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5,
3, -4.189721, -6.924417, 0, -0.5, 0.5, 0.5,
3, -4.189721, -6.924417, 1, -0.5, 0.5, 0.5,
3, -4.189721, -6.924417, 1, 1.5, 0.5, 0.5,
3, -4.189721, -6.924417, 0, 1.5, 0.5, 0.5
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
-3.315572, -3, -6.065002,
-3.315572, 2, -6.065002,
-3.315572, -3, -6.065002,
-3.477608, -3, -6.351474,
-3.315572, -2, -6.065002,
-3.477608, -2, -6.351474,
-3.315572, -1, -6.065002,
-3.477608, -1, -6.351474,
-3.315572, 0, -6.065002,
-3.477608, 0, -6.351474,
-3.315572, 1, -6.065002,
-3.477608, 1, -6.351474,
-3.315572, 2, -6.065002,
-3.477608, 2, -6.351474
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
-3.801682, -3, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, -3, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, -3, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, -3, -6.924417, 0, 1.5, 0.5, 0.5,
-3.801682, -2, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, -2, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, -2, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, -2, -6.924417, 0, 1.5, 0.5, 0.5,
-3.801682, -1, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, -1, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, -1, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, -1, -6.924417, 0, 1.5, 0.5, 0.5,
-3.801682, 0, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, 0, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, 0, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, 0, -6.924417, 0, 1.5, 0.5, 0.5,
-3.801682, 1, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, 1, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, 1, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, 1, -6.924417, 0, 1.5, 0.5, 0.5,
-3.801682, 2, -6.924417, 0, -0.5, 0.5, 0.5,
-3.801682, 2, -6.924417, 1, -0.5, 0.5, 0.5,
-3.801682, 2, -6.924417, 1, 1.5, 0.5, 0.5,
-3.801682, 2, -6.924417, 0, 1.5, 0.5, 0.5
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
-3.315572, -3.687168, -4,
-3.315572, -3.687168, 4,
-3.315572, -3.687168, -4,
-3.477608, -3.854686, -4,
-3.315572, -3.687168, -2,
-3.477608, -3.854686, -2,
-3.315572, -3.687168, 0,
-3.477608, -3.854686, 0,
-3.315572, -3.687168, 2,
-3.477608, -3.854686, 2,
-3.315572, -3.687168, 4,
-3.477608, -3.854686, 4
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
-3.801682, -4.189721, -4, 0, -0.5, 0.5, 0.5,
-3.801682, -4.189721, -4, 1, -0.5, 0.5, 0.5,
-3.801682, -4.189721, -4, 1, 1.5, 0.5, 0.5,
-3.801682, -4.189721, -4, 0, 1.5, 0.5, 0.5,
-3.801682, -4.189721, -2, 0, -0.5, 0.5, 0.5,
-3.801682, -4.189721, -2, 1, -0.5, 0.5, 0.5,
-3.801682, -4.189721, -2, 1, 1.5, 0.5, 0.5,
-3.801682, -4.189721, -2, 0, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 0, 0, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 0, 1, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 0, 1, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 0, 0, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 2, 0, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 2, 1, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 2, 1, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 2, 0, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 4, 0, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 4, 1, -0.5, 0.5, 0.5,
-3.801682, -4.189721, 4, 1, 1.5, 0.5, 0.5,
-3.801682, -4.189721, 4, 0, 1.5, 0.5, 0.5
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
-3.315572, -3.687168, -6.065002,
-3.315572, 3.013531, -6.065002,
-3.315572, -3.687168, 5.393861,
-3.315572, 3.013531, 5.393861,
-3.315572, -3.687168, -6.065002,
-3.315572, -3.687168, 5.393861,
-3.315572, 3.013531, -6.065002,
-3.315572, 3.013531, 5.393861,
-3.315572, -3.687168, -6.065002,
3.165906, -3.687168, -6.065002,
-3.315572, -3.687168, 5.393861,
3.165906, -3.687168, 5.393861,
-3.315572, 3.013531, -6.065002,
3.165906, 3.013531, -6.065002,
-3.315572, 3.013531, 5.393861,
3.165906, 3.013531, 5.393861,
3.165906, -3.687168, -6.065002,
3.165906, 3.013531, -6.065002,
3.165906, -3.687168, 5.393861,
3.165906, 3.013531, 5.393861,
3.165906, -3.687168, -6.065002,
3.165906, -3.687168, 5.393861,
3.165906, 3.013531, -6.065002,
3.165906, 3.013531, 5.393861
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
var radius = 7.888006;
var distance = 35.09463;
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
mvMatrix.translate( 0.07483292, 0.3368185, 0.3355708 );
mvMatrix.scale( 1.315852, 1.272802, 0.7442856 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09463);
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
oxamyl<-read.table("oxamyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxamyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
y<-oxamyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
z<-oxamyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
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
-3.221181, 0.4381564, -1.449553, 0, 0, 1, 1, 1,
-3.077555, -2.495578, -2.192744, 1, 0, 0, 1, 1,
-2.975909, -0.3405125, -2.975991, 1, 0, 0, 1, 1,
-2.708496, -0.6080827, -2.051112, 1, 0, 0, 1, 1,
-2.704745, -0.4062679, -1.879292, 1, 0, 0, 1, 1,
-2.660409, -0.8738517, -3.80327, 1, 0, 0, 1, 1,
-2.485585, -0.2608709, -1.77006, 0, 0, 0, 1, 1,
-2.48183, -0.6307374, -2.822231, 0, 0, 0, 1, 1,
-2.448023, -1.248123, -0.3091588, 0, 0, 0, 1, 1,
-2.391837, -0.9278454, -1.605687, 0, 0, 0, 1, 1,
-2.321149, 0.03718686, -1.367451, 0, 0, 0, 1, 1,
-2.320435, 1.716019, -0.9116881, 0, 0, 0, 1, 1,
-2.318801, -3.589585, -2.115791, 0, 0, 0, 1, 1,
-2.316991, 2.750639, -0.5497294, 1, 1, 1, 1, 1,
-2.247226, -0.08751716, -2.936723, 1, 1, 1, 1, 1,
-2.192854, -2.561596, -2.876222, 1, 1, 1, 1, 1,
-2.182509, 1.671235, -0.9669134, 1, 1, 1, 1, 1,
-2.124236, 0.6307776, -1.832984, 1, 1, 1, 1, 1,
-2.09835, 1.321083, 2.32124, 1, 1, 1, 1, 1,
-2.082839, -0.3565857, -3.599295, 1, 1, 1, 1, 1,
-2.074322, -0.3598643, -2.855282, 1, 1, 1, 1, 1,
-2.073138, 0.2008352, 0.3757844, 1, 1, 1, 1, 1,
-2.050358, 0.7704513, 0.5394155, 1, 1, 1, 1, 1,
-2.031464, 0.3415302, -0.8885627, 1, 1, 1, 1, 1,
-1.932178, 0.5785013, -0.5574812, 1, 1, 1, 1, 1,
-1.928548, -0.7327902, -0.9913756, 1, 1, 1, 1, 1,
-1.915052, -1.379327, -1.672255, 1, 1, 1, 1, 1,
-1.870965, -0.640225, -1.846972, 1, 1, 1, 1, 1,
-1.8704, -0.8031012, -3.019269, 0, 0, 1, 1, 1,
-1.867776, 1.125309, -0.7281613, 1, 0, 0, 1, 1,
-1.866039, -0.4891879, -3.795995, 1, 0, 0, 1, 1,
-1.864599, -0.03599958, -2.79065, 1, 0, 0, 1, 1,
-1.851951, -0.2354332, -0.9674171, 1, 0, 0, 1, 1,
-1.839624, 1.588582, -3.154406, 1, 0, 0, 1, 1,
-1.831032, 1.439258, -1.033668, 0, 0, 0, 1, 1,
-1.822207, -1.007686, 0.4220851, 0, 0, 0, 1, 1,
-1.792004, -0.8504481, -1.460687, 0, 0, 0, 1, 1,
-1.789893, 0.3759802, -0.4470425, 0, 0, 0, 1, 1,
-1.77508, -2.606481, -1.89014, 0, 0, 0, 1, 1,
-1.772817, -0.7745358, -1.603057, 0, 0, 0, 1, 1,
-1.767876, 0.4738156, -1.285668, 0, 0, 0, 1, 1,
-1.749211, 2.34538, 1.80099, 1, 1, 1, 1, 1,
-1.747103, -0.260061, -2.247197, 1, 1, 1, 1, 1,
-1.743795, 0.06909154, -1.074529, 1, 1, 1, 1, 1,
-1.741722, -0.4141712, -0.7603096, 1, 1, 1, 1, 1,
-1.727431, -2.376098, -4.44396, 1, 1, 1, 1, 1,
-1.719576, -0.9488087, -1.639054, 1, 1, 1, 1, 1,
-1.703227, 1.471822, 1.611191, 1, 1, 1, 1, 1,
-1.700339, 1.396381, 1.597979, 1, 1, 1, 1, 1,
-1.698248, -0.3898037, -1.530505, 1, 1, 1, 1, 1,
-1.686837, 1.590217, -1.793099, 1, 1, 1, 1, 1,
-1.67439, -1.075488, -1.019535, 1, 1, 1, 1, 1,
-1.66503, -0.101492, -2.905233, 1, 1, 1, 1, 1,
-1.635045, -0.6452919, -2.454707, 1, 1, 1, 1, 1,
-1.625872, -2.016103, -2.147561, 1, 1, 1, 1, 1,
-1.622724, -0.6405863, -1.181497, 1, 1, 1, 1, 1,
-1.621702, -0.2758365, -1.539618, 0, 0, 1, 1, 1,
-1.606868, 1.516544, -0.446206, 1, 0, 0, 1, 1,
-1.593769, -0.9417697, -4.005362, 1, 0, 0, 1, 1,
-1.583842, 0.10528, -1.837468, 1, 0, 0, 1, 1,
-1.578422, 0.6620045, -1.289935, 1, 0, 0, 1, 1,
-1.566927, 0.9003847, -1.026573, 1, 0, 0, 1, 1,
-1.562342, 1.807953, -0.5042425, 0, 0, 0, 1, 1,
-1.553991, -0.5702674, -2.09123, 0, 0, 0, 1, 1,
-1.553805, 0.2225395, -0.3597468, 0, 0, 0, 1, 1,
-1.548494, -1.091633, -2.680511, 0, 0, 0, 1, 1,
-1.547183, -1.071916, -2.643122, 0, 0, 0, 1, 1,
-1.54482, -1.177531, -2.844473, 0, 0, 0, 1, 1,
-1.535593, 1.880392, 0.6389163, 0, 0, 0, 1, 1,
-1.530345, -0.6411901, -1.147363, 1, 1, 1, 1, 1,
-1.529575, -0.7282782, -2.712341, 1, 1, 1, 1, 1,
-1.525477, -1.560742, -3.240213, 1, 1, 1, 1, 1,
-1.523784, 1.542262, -1.791151, 1, 1, 1, 1, 1,
-1.516605, -0.2434337, -1.600073, 1, 1, 1, 1, 1,
-1.516442, -1.533938, -2.727549, 1, 1, 1, 1, 1,
-1.491381, -0.2538284, -1.356893, 1, 1, 1, 1, 1,
-1.482126, 0.1046968, -2.947854, 1, 1, 1, 1, 1,
-1.480223, -0.4622904, -1.212139, 1, 1, 1, 1, 1,
-1.479189, 0.7663506, -0.3170826, 1, 1, 1, 1, 1,
-1.477587, -0.01631632, -1.672388, 1, 1, 1, 1, 1,
-1.471736, 0.3937942, 0.4795952, 1, 1, 1, 1, 1,
-1.458562, 2.101001, -3.05813, 1, 1, 1, 1, 1,
-1.457206, -1.229723, -2.710104, 1, 1, 1, 1, 1,
-1.450756, -1.923285, -2.844709, 1, 1, 1, 1, 1,
-1.445359, 0.1677784, -2.60974, 0, 0, 1, 1, 1,
-1.442415, 1.881153, -0.08490696, 1, 0, 0, 1, 1,
-1.441057, -0.6333054, -2.376448, 1, 0, 0, 1, 1,
-1.439493, -1.798667, -3.033847, 1, 0, 0, 1, 1,
-1.427588, 1.481849, -2.724432, 1, 0, 0, 1, 1,
-1.426275, 0.7295136, -1.76847, 1, 0, 0, 1, 1,
-1.408195, 0.9183989, -1.783002, 0, 0, 0, 1, 1,
-1.40184, -0.9465005, -3.254409, 0, 0, 0, 1, 1,
-1.399249, 0.5817891, 0.3572227, 0, 0, 0, 1, 1,
-1.389503, -0.3115585, -3.068075, 0, 0, 0, 1, 1,
-1.377149, -0.2306623, -1.91869, 0, 0, 0, 1, 1,
-1.365316, 1.415899, -2.722495, 0, 0, 0, 1, 1,
-1.363495, 0.4845529, -1.244709, 0, 0, 0, 1, 1,
-1.363063, -1.104847, -2.828848, 1, 1, 1, 1, 1,
-1.362497, 0.01867347, -4.059522, 1, 1, 1, 1, 1,
-1.361727, 2.139726, -1.142806, 1, 1, 1, 1, 1,
-1.343045, -1.2441, -2.007656, 1, 1, 1, 1, 1,
-1.336524, -0.06432456, -1.431508, 1, 1, 1, 1, 1,
-1.311191, -1.797083, -3.487795, 1, 1, 1, 1, 1,
-1.299978, -1.616642, -3.119106, 1, 1, 1, 1, 1,
-1.28861, -0.5306908, -2.896625, 1, 1, 1, 1, 1,
-1.279519, 0.04631562, -1.991479, 1, 1, 1, 1, 1,
-1.271677, -0.315268, -1.928008, 1, 1, 1, 1, 1,
-1.262202, -0.5757992, -4.050219, 1, 1, 1, 1, 1,
-1.252522, -0.523837, -2.453141, 1, 1, 1, 1, 1,
-1.248925, -2.136847, -3.56101, 1, 1, 1, 1, 1,
-1.232966, -0.6231623, -3.377951, 1, 1, 1, 1, 1,
-1.224195, 2.31791, -0.9411551, 1, 1, 1, 1, 1,
-1.222116, -0.2597029, -2.985298, 0, 0, 1, 1, 1,
-1.221949, 0.1896306, -2.057542, 1, 0, 0, 1, 1,
-1.221258, 0.2574445, -1.710108, 1, 0, 0, 1, 1,
-1.212126, -0.1837054, -4.629767, 1, 0, 0, 1, 1,
-1.200321, -0.0418744, -2.250154, 1, 0, 0, 1, 1,
-1.194938, -1.143931, -2.119078, 1, 0, 0, 1, 1,
-1.189986, -1.268288, -3.674339, 0, 0, 0, 1, 1,
-1.188746, 1.084747, -1.010116, 0, 0, 0, 1, 1,
-1.185119, -1.070858, -1.446826, 0, 0, 0, 1, 1,
-1.184411, 1.161129, -1.605687, 0, 0, 0, 1, 1,
-1.18244, 0.6013493, -2.035722, 0, 0, 0, 1, 1,
-1.176535, 0.2637418, -2.716754, 0, 0, 0, 1, 1,
-1.173973, 0.5501317, -1.924314, 0, 0, 0, 1, 1,
-1.167603, 0.8833297, 0.6432662, 1, 1, 1, 1, 1,
-1.166397, 0.3383349, 0.04237143, 1, 1, 1, 1, 1,
-1.160713, 1.099934, -1.473721, 1, 1, 1, 1, 1,
-1.158523, -0.07227649, -1.274462, 1, 1, 1, 1, 1,
-1.156375, -0.6599155, -2.724227, 1, 1, 1, 1, 1,
-1.142053, -1.390445, -1.777878, 1, 1, 1, 1, 1,
-1.139111, 1.899584, -0.1930749, 1, 1, 1, 1, 1,
-1.13662, -0.8874265, -3.183558, 1, 1, 1, 1, 1,
-1.135191, 0.1232414, -0.0991952, 1, 1, 1, 1, 1,
-1.1341, -0.6875429, -0.4791341, 1, 1, 1, 1, 1,
-1.133762, -0.3284693, -2.287113, 1, 1, 1, 1, 1,
-1.12449, 0.5003641, -1.034773, 1, 1, 1, 1, 1,
-1.115365, 0.01945868, -2.09698, 1, 1, 1, 1, 1,
-1.108115, 0.6652617, -0.4911433, 1, 1, 1, 1, 1,
-1.106775, -0.04255818, -0.7865814, 1, 1, 1, 1, 1,
-1.099365, -0.1281755, -0.9748982, 0, 0, 1, 1, 1,
-1.086625, -0.5942979, -0.6657367, 1, 0, 0, 1, 1,
-1.086607, 0.6598705, -0.5215027, 1, 0, 0, 1, 1,
-1.080643, 0.06903774, -3.967373, 1, 0, 0, 1, 1,
-1.075816, -0.5347412, -3.361225, 1, 0, 0, 1, 1,
-1.072262, -1.063739, -0.8430246, 1, 0, 0, 1, 1,
-1.053951, 0.0436097, -2.483251, 0, 0, 0, 1, 1,
-1.044154, 0.9021602, -1.396344, 0, 0, 0, 1, 1,
-1.034328, 2.371807, -1.82676, 0, 0, 0, 1, 1,
-1.02589, -1.088324, -1.112156, 0, 0, 0, 1, 1,
-1.021997, 0.2347111, -0.3798873, 0, 0, 0, 1, 1,
-1.016671, -0.5203772, -1.365361, 0, 0, 0, 1, 1,
-1.01506, 0.02024638, -3.186291, 0, 0, 0, 1, 1,
-1.002526, 0.4633292, -1.525501, 1, 1, 1, 1, 1,
-0.9959768, 1.309838, -1.325557, 1, 1, 1, 1, 1,
-0.9919023, 0.04711742, -1.226106, 1, 1, 1, 1, 1,
-0.9873484, 0.4699236, -1.623039, 1, 1, 1, 1, 1,
-0.987271, 1.548358, -2.782716, 1, 1, 1, 1, 1,
-0.9847321, -1.723948, -2.303603, 1, 1, 1, 1, 1,
-0.9832154, 0.9033542, 0.1837822, 1, 1, 1, 1, 1,
-0.9808633, 0.2536673, -1.850686, 1, 1, 1, 1, 1,
-0.9776834, -0.6336814, -3.491359, 1, 1, 1, 1, 1,
-0.975439, 0.1201192, -1.02765, 1, 1, 1, 1, 1,
-0.973607, -0.5578528, -2.202012, 1, 1, 1, 1, 1,
-0.9693425, 0.2241526, -0.5371267, 1, 1, 1, 1, 1,
-0.9666184, 0.490636, -0.06468923, 1, 1, 1, 1, 1,
-0.9609715, -0.3957166, -1.760848, 1, 1, 1, 1, 1,
-0.9583741, -0.6859133, -2.408221, 1, 1, 1, 1, 1,
-0.9534112, -0.6253921, -3.522544, 0, 0, 1, 1, 1,
-0.9508348, 1.502618, -1.204963, 1, 0, 0, 1, 1,
-0.9443664, 0.9925399, -0.6378251, 1, 0, 0, 1, 1,
-0.9413297, -0.8044457, -0.9588085, 1, 0, 0, 1, 1,
-0.9412102, 1.615313, -0.5921424, 1, 0, 0, 1, 1,
-0.940617, -0.60795, -1.604209, 1, 0, 0, 1, 1,
-0.9387385, 0.1946258, -0.9285981, 0, 0, 0, 1, 1,
-0.9378744, 0.6130177, -3.373163, 0, 0, 0, 1, 1,
-0.9351597, -2.33816, -2.911365, 0, 0, 0, 1, 1,
-0.9318077, -1.183069, -1.42698, 0, 0, 0, 1, 1,
-0.9274725, -1.066822, -1.681451, 0, 0, 0, 1, 1,
-0.9248751, -0.4033154, -1.039584, 0, 0, 0, 1, 1,
-0.9199808, 0.3180107, -2.294054, 0, 0, 0, 1, 1,
-0.9153129, 0.5589064, -1.285985, 1, 1, 1, 1, 1,
-0.907014, -0.09950239, -2.446982, 1, 1, 1, 1, 1,
-0.9065377, 1.118372, -0.7410213, 1, 1, 1, 1, 1,
-0.9062625, 0.5264418, -2.52279, 1, 1, 1, 1, 1,
-0.8996373, 0.1661683, -2.94712, 1, 1, 1, 1, 1,
-0.897983, 0.1596953, -0.5649616, 1, 1, 1, 1, 1,
-0.8937311, 0.6261173, -0.5089567, 1, 1, 1, 1, 1,
-0.889162, -0.3870621, 0.290892, 1, 1, 1, 1, 1,
-0.886697, -0.5736799, -2.794169, 1, 1, 1, 1, 1,
-0.8861504, -1.379866, -3.432476, 1, 1, 1, 1, 1,
-0.8836673, 0.4485583, -2.283626, 1, 1, 1, 1, 1,
-0.881605, -2.119186, -3.864671, 1, 1, 1, 1, 1,
-0.877417, -0.1238335, -2.053992, 1, 1, 1, 1, 1,
-0.8756229, 0.3858483, -1.111638, 1, 1, 1, 1, 1,
-0.8721474, 0.0005488508, -0.8890813, 1, 1, 1, 1, 1,
-0.8644252, 2.136732, -0.8644629, 0, 0, 1, 1, 1,
-0.8636102, -0.5366032, -2.071007, 1, 0, 0, 1, 1,
-0.8632998, 1.817123, -0.7637255, 1, 0, 0, 1, 1,
-0.8618677, 0.2250423, -2.87887, 1, 0, 0, 1, 1,
-0.8613111, -0.7880028, -1.866297, 1, 0, 0, 1, 1,
-0.8547145, -1.507855, -2.055878, 1, 0, 0, 1, 1,
-0.8510948, 0.07791407, -0.690666, 0, 0, 0, 1, 1,
-0.8430846, -1.597602, -1.443756, 0, 0, 0, 1, 1,
-0.8424987, 0.1970102, -0.7302917, 0, 0, 0, 1, 1,
-0.8415759, 0.4208092, -0.6197055, 0, 0, 0, 1, 1,
-0.8409345, 0.1262987, -1.53471, 0, 0, 0, 1, 1,
-0.8328664, -0.5884026, -1.749853, 0, 0, 0, 1, 1,
-0.8327121, 1.178797, -0.8380973, 0, 0, 0, 1, 1,
-0.8325893, -1.103237, -0.8460612, 1, 1, 1, 1, 1,
-0.8320307, 0.0370936, -0.6437426, 1, 1, 1, 1, 1,
-0.8243715, 0.04879773, -1.58514, 1, 1, 1, 1, 1,
-0.8178157, -0.091412, -1.349291, 1, 1, 1, 1, 1,
-0.8168916, -0.7370217, -1.496215, 1, 1, 1, 1, 1,
-0.7976455, 0.694679, 1.605806, 1, 1, 1, 1, 1,
-0.7940233, -2.163332, -2.923956, 1, 1, 1, 1, 1,
-0.7894493, 0.3410068, -1.102148, 1, 1, 1, 1, 1,
-0.7884582, -0.7052084, -0.5101946, 1, 1, 1, 1, 1,
-0.7852697, 0.07950491, -1.479153, 1, 1, 1, 1, 1,
-0.7849452, 1.22588, 0.6945307, 1, 1, 1, 1, 1,
-0.7836583, -0.2134956, -2.452295, 1, 1, 1, 1, 1,
-0.7830844, -0.387518, -2.095968, 1, 1, 1, 1, 1,
-0.770883, -0.4084281, -0.6401454, 1, 1, 1, 1, 1,
-0.7673673, 1.874408, -0.1153757, 1, 1, 1, 1, 1,
-0.7667949, 0.7488521, -0.7985656, 0, 0, 1, 1, 1,
-0.7645567, -0.5751643, -0.618795, 1, 0, 0, 1, 1,
-0.7600036, -0.5412747, -2.875756, 1, 0, 0, 1, 1,
-0.7561833, -1.911664, -1.295794, 1, 0, 0, 1, 1,
-0.7481834, 1.047918, -1.165207, 1, 0, 0, 1, 1,
-0.7472219, -0.07781287, -0.3479044, 1, 0, 0, 1, 1,
-0.7469278, 0.9473203, -0.6578274, 0, 0, 0, 1, 1,
-0.7454444, 1.452731, -0.241139, 0, 0, 0, 1, 1,
-0.7431781, -2.393631, -2.186473, 0, 0, 0, 1, 1,
-0.7384055, 1.044229, 1.708548, 0, 0, 0, 1, 1,
-0.7376155, -0.08959359, 0.648883, 0, 0, 0, 1, 1,
-0.7336907, -0.3772728, -2.690469, 0, 0, 0, 1, 1,
-0.7327883, 0.571658, -0.3583587, 0, 0, 0, 1, 1,
-0.7327049, -0.8691011, -1.109267, 1, 1, 1, 1, 1,
-0.7317427, -0.987459, -1.916442, 1, 1, 1, 1, 1,
-0.7293593, 0.7187894, -2.514088, 1, 1, 1, 1, 1,
-0.7240158, -0.5327652, -3.841522, 1, 1, 1, 1, 1,
-0.7187831, 0.1770052, -2.641305, 1, 1, 1, 1, 1,
-0.7125234, -0.373009, -2.724003, 1, 1, 1, 1, 1,
-0.7122115, -0.4251085, -2.491799, 1, 1, 1, 1, 1,
-0.7116758, 1.34412, -1.689246, 1, 1, 1, 1, 1,
-0.710978, -0.4219037, -3.380483, 1, 1, 1, 1, 1,
-0.7095829, 0.1937715, -2.688633, 1, 1, 1, 1, 1,
-0.7095779, -0.6997509, -2.791623, 1, 1, 1, 1, 1,
-0.7041502, 0.7999255, -0.1457215, 1, 1, 1, 1, 1,
-0.7040053, -0.6720951, -2.096455, 1, 1, 1, 1, 1,
-0.7026725, -0.1204125, -0.6225027, 1, 1, 1, 1, 1,
-0.7020969, -0.8152164, -2.633391, 1, 1, 1, 1, 1,
-0.7009512, 1.019462, 0.6523422, 0, 0, 1, 1, 1,
-0.6974211, 0.4698487, -2.194307, 1, 0, 0, 1, 1,
-0.6972743, 0.1366155, -1.053059, 1, 0, 0, 1, 1,
-0.6947924, -0.3339346, -2.921371, 1, 0, 0, 1, 1,
-0.6911087, -0.7436295, -0.6767223, 1, 0, 0, 1, 1,
-0.6834894, 0.4116932, -1.04728, 1, 0, 0, 1, 1,
-0.6737574, 1.501068, 0.456881, 0, 0, 0, 1, 1,
-0.6734621, -1.656164, -2.93432, 0, 0, 0, 1, 1,
-0.6677263, 1.895156, -0.109788, 0, 0, 0, 1, 1,
-0.6666581, -0.4448215, -2.167579, 0, 0, 0, 1, 1,
-0.6652669, -0.6380255, -3.185357, 0, 0, 0, 1, 1,
-0.6592381, -0.2813258, -2.198691, 0, 0, 0, 1, 1,
-0.6559184, 0.2492339, -0.2686053, 0, 0, 0, 1, 1,
-0.6537147, 8.171608e-05, -3.158271, 1, 1, 1, 1, 1,
-0.6530892, 0.9506344, -0.4205852, 1, 1, 1, 1, 1,
-0.6496076, 1.260055, -0.557224, 1, 1, 1, 1, 1,
-0.6479494, -0.1970783, -0.8328474, 1, 1, 1, 1, 1,
-0.6405405, -0.6839802, -0.6976298, 1, 1, 1, 1, 1,
-0.6401382, 1.110761, -0.7611673, 1, 1, 1, 1, 1,
-0.6393242, -0.4163969, -1.014371, 1, 1, 1, 1, 1,
-0.6352688, 1.139126, 0.7818999, 1, 1, 1, 1, 1,
-0.6294718, 0.4714195, -1.455014, 1, 1, 1, 1, 1,
-0.6294087, -0.9848678, -3.995544, 1, 1, 1, 1, 1,
-0.6289411, -1.599768, -3.054544, 1, 1, 1, 1, 1,
-0.6273792, -0.6605212, -2.338048, 1, 1, 1, 1, 1,
-0.6242014, 1.74526, -0.6402101, 1, 1, 1, 1, 1,
-0.6188905, 2.915948, -0.4689309, 1, 1, 1, 1, 1,
-0.6167369, 1.58748, -0.1928094, 1, 1, 1, 1, 1,
-0.615226, -0.3043226, -2.193033, 0, 0, 1, 1, 1,
-0.6141987, -0.2116885, -2.852627, 1, 0, 0, 1, 1,
-0.611101, -2.100347, -1.890915, 1, 0, 0, 1, 1,
-0.6106759, -1.100106, -3.659894, 1, 0, 0, 1, 1,
-0.6018902, -0.4263144, -1.015997, 1, 0, 0, 1, 1,
-0.5987825, 1.226244, 0.1122034, 1, 0, 0, 1, 1,
-0.5979173, 0.4180997, -1.063921, 0, 0, 0, 1, 1,
-0.592231, -2.848829, -2.607241, 0, 0, 0, 1, 1,
-0.588247, 0.04003539, -0.7490484, 0, 0, 0, 1, 1,
-0.5801578, -0.2296386, -2.695279, 0, 0, 0, 1, 1,
-0.5781305, 0.8656868, -0.1391073, 0, 0, 0, 1, 1,
-0.577548, 0.5718424, -0.7136005, 0, 0, 0, 1, 1,
-0.5771927, -1.213344, -2.20139, 0, 0, 0, 1, 1,
-0.5747313, 2.019679, -0.2321532, 1, 1, 1, 1, 1,
-0.5723643, 0.4632924, -0.5739869, 1, 1, 1, 1, 1,
-0.5686229, -0.1471469, -4.33097, 1, 1, 1, 1, 1,
-0.5685717, 0.8222516, 0.533776, 1, 1, 1, 1, 1,
-0.5644496, -1.467613, -3.608546, 1, 1, 1, 1, 1,
-0.5640453, -0.937732, -2.248087, 1, 1, 1, 1, 1,
-0.5561157, -1.24186, -3.052944, 1, 1, 1, 1, 1,
-0.5552428, 0.8264298, -2.932194, 1, 1, 1, 1, 1,
-0.5516204, 0.244221, -2.018886, 1, 1, 1, 1, 1,
-0.5499213, 0.1232021, 0.1091652, 1, 1, 1, 1, 1,
-0.549124, 0.1576127, -1.121936, 1, 1, 1, 1, 1,
-0.5489633, -0.9990264, -2.215743, 1, 1, 1, 1, 1,
-0.5478975, 1.414496, -1.43308, 1, 1, 1, 1, 1,
-0.545301, -0.5502385, -2.387044, 1, 1, 1, 1, 1,
-0.5425432, 2.155757, 0.1543351, 1, 1, 1, 1, 1,
-0.5400668, -1.838977, -3.846663, 0, 0, 1, 1, 1,
-0.5337539, 0.6255198, 0.6724046, 1, 0, 0, 1, 1,
-0.5337273, -0.2532965, -3.314115, 1, 0, 0, 1, 1,
-0.5284187, 0.03904428, -1.950839, 1, 0, 0, 1, 1,
-0.5271569, -1.148208, -3.94808, 1, 0, 0, 1, 1,
-0.5225504, 1.035323, -0.3558203, 1, 0, 0, 1, 1,
-0.5210069, 1.294527, -0.3685202, 0, 0, 0, 1, 1,
-0.517344, -0.4726524, -2.215892, 0, 0, 0, 1, 1,
-0.5167514, -1.717661, -0.3626375, 0, 0, 0, 1, 1,
-0.5161715, -1.032941, -3.43613, 0, 0, 0, 1, 1,
-0.5159302, -0.09548789, -3.367152, 0, 0, 0, 1, 1,
-0.5143172, 0.8998805, -1.015211, 0, 0, 0, 1, 1,
-0.5140041, 1.17735, -0.3508944, 0, 0, 0, 1, 1,
-0.5008446, 0.5720948, -0.1531033, 1, 1, 1, 1, 1,
-0.4922187, -0.03914227, -1.792524, 1, 1, 1, 1, 1,
-0.4858799, -0.5077605, -1.994429, 1, 1, 1, 1, 1,
-0.4856871, 0.9401308, -0.7544056, 1, 1, 1, 1, 1,
-0.4823332, -0.4868159, -1.965224, 1, 1, 1, 1, 1,
-0.4814397, -0.2361084, -1.453117, 1, 1, 1, 1, 1,
-0.480722, 0.8014137, -0.5385902, 1, 1, 1, 1, 1,
-0.4797968, -0.1416901, -1.238737, 1, 1, 1, 1, 1,
-0.4797321, -1.359592, -2.80431, 1, 1, 1, 1, 1,
-0.4797274, -1.708882, -3.235749, 1, 1, 1, 1, 1,
-0.4795829, -1.561121, -3.427896, 1, 1, 1, 1, 1,
-0.4792329, 0.1858526, -0.6754125, 1, 1, 1, 1, 1,
-0.4731969, -0.1266226, -0.5400041, 1, 1, 1, 1, 1,
-0.4721301, -0.3014345, -1.544737, 1, 1, 1, 1, 1,
-0.4678001, 1.328374, -1.155386, 1, 1, 1, 1, 1,
-0.4617063, 1.410497, -0.9646459, 0, 0, 1, 1, 1,
-0.4599291, -1.115092, -4.44694, 1, 0, 0, 1, 1,
-0.4548362, -0.03251889, -2.116645, 1, 0, 0, 1, 1,
-0.4548299, 0.43796, -0.7303103, 1, 0, 0, 1, 1,
-0.4546289, -1.692485, -0.9198059, 1, 0, 0, 1, 1,
-0.4456887, -0.4347724, -2.039325, 1, 0, 0, 1, 1,
-0.4433263, 0.3382871, -0.009370093, 0, 0, 0, 1, 1,
-0.4423074, -1.22671, -3.992988, 0, 0, 0, 1, 1,
-0.4372279, 0.09330146, -1.205722, 0, 0, 0, 1, 1,
-0.4361553, -0.5695537, -2.296939, 0, 0, 0, 1, 1,
-0.4348062, -1.041341, -0.4012488, 0, 0, 0, 1, 1,
-0.4342004, 0.9762523, 0.1074955, 0, 0, 0, 1, 1,
-0.4335407, 0.06499741, -1.936151, 0, 0, 0, 1, 1,
-0.4307599, 0.8761001, -0.9014095, 1, 1, 1, 1, 1,
-0.4259532, -2.266612, -3.04928, 1, 1, 1, 1, 1,
-0.4251531, -0.001324427, -2.45489, 1, 1, 1, 1, 1,
-0.419029, 0.4140252, -0.8166164, 1, 1, 1, 1, 1,
-0.4179732, -0.4853184, -2.273371, 1, 1, 1, 1, 1,
-0.4173841, 0.5701848, 0.06321235, 1, 1, 1, 1, 1,
-0.4170558, -0.06334704, -2.366263, 1, 1, 1, 1, 1,
-0.4109218, -0.09408196, -1.999594, 1, 1, 1, 1, 1,
-0.40618, 0.7202194, 1.948368, 1, 1, 1, 1, 1,
-0.4059633, -0.5281871, -3.788704, 1, 1, 1, 1, 1,
-0.395963, 0.04262494, -1.028284, 1, 1, 1, 1, 1,
-0.3892117, -0.5244054, -3.55159, 1, 1, 1, 1, 1,
-0.3867932, -0.4125811, -1.564941, 1, 1, 1, 1, 1,
-0.3849529, 0.4256811, -2.37748, 1, 1, 1, 1, 1,
-0.384654, 1.526115, 0.01076238, 1, 1, 1, 1, 1,
-0.3796236, -0.9834462, -2.396924, 0, 0, 1, 1, 1,
-0.3792168, 0.2458953, -1.402111, 1, 0, 0, 1, 1,
-0.3784911, -1.801021, -1.699745, 1, 0, 0, 1, 1,
-0.3761571, 0.3512811, 1.022853, 1, 0, 0, 1, 1,
-0.3735543, -0.4843344, -2.713323, 1, 0, 0, 1, 1,
-0.3687526, 0.7186242, -0.666168, 1, 0, 0, 1, 1,
-0.3668388, -1.01885, -2.896406, 0, 0, 0, 1, 1,
-0.3664731, -0.2815064, -0.4322091, 0, 0, 0, 1, 1,
-0.364417, 0.1596407, -1.176172, 0, 0, 0, 1, 1,
-0.3642303, -1.306414, -0.1744142, 0, 0, 0, 1, 1,
-0.3639624, -0.5998809, -2.983673, 0, 0, 0, 1, 1,
-0.363307, -0.9414744, -4.388504, 0, 0, 0, 1, 1,
-0.3556266, 1.219285, -1.597942, 0, 0, 0, 1, 1,
-0.3509057, 1.036491, 0.6468043, 1, 1, 1, 1, 1,
-0.3391122, 0.8339701, 0.03223222, 1, 1, 1, 1, 1,
-0.3376592, 0.01507024, -1.341266, 1, 1, 1, 1, 1,
-0.3367978, -0.827827, -4.019552, 1, 1, 1, 1, 1,
-0.336542, 2.241202, 1.084476, 1, 1, 1, 1, 1,
-0.3364176, 0.03293119, -1.795228, 1, 1, 1, 1, 1,
-0.3310094, -0.2122808, -1.056955, 1, 1, 1, 1, 1,
-0.3291189, 0.1210961, -0.2869783, 1, 1, 1, 1, 1,
-0.327463, 0.524121, -0.4905172, 1, 1, 1, 1, 1,
-0.3268561, 0.002787654, -3.401933, 1, 1, 1, 1, 1,
-0.3262917, 1.26461, 0.6346844, 1, 1, 1, 1, 1,
-0.3260316, -1.604992, -2.898457, 1, 1, 1, 1, 1,
-0.3233947, 0.6607936, -0.1925404, 1, 1, 1, 1, 1,
-0.3199678, 0.5989437, -0.52244, 1, 1, 1, 1, 1,
-0.3175512, -0.1353874, -2.662701, 1, 1, 1, 1, 1,
-0.3174004, 0.6211503, 1.626917, 0, 0, 1, 1, 1,
-0.3092722, -0.7348851, -3.66772, 1, 0, 0, 1, 1,
-0.3084159, -1.315169, -1.787828, 1, 0, 0, 1, 1,
-0.3081071, 0.3258933, 0.003223976, 1, 0, 0, 1, 1,
-0.3078081, -0.6406018, -1.769037, 1, 0, 0, 1, 1,
-0.30678, -1.199407, -3.241909, 1, 0, 0, 1, 1,
-0.3057636, 0.1179363, 0.5276084, 0, 0, 0, 1, 1,
-0.3049887, 0.6091153, 0.6919788, 0, 0, 0, 1, 1,
-0.3048821, 0.8748645, 0.1418906, 0, 0, 0, 1, 1,
-0.3019389, -1.16012, -3.313516, 0, 0, 0, 1, 1,
-0.2992843, -0.1642881, -0.418492, 0, 0, 0, 1, 1,
-0.2940354, -0.6654023, -0.9079849, 0, 0, 0, 1, 1,
-0.293019, 1.238082, -0.6498733, 0, 0, 0, 1, 1,
-0.2919928, -0.01403875, -1.742676, 1, 1, 1, 1, 1,
-0.2913234, 0.1852469, -0.9162989, 1, 1, 1, 1, 1,
-0.2860105, -1.138616, -1.951779, 1, 1, 1, 1, 1,
-0.2859646, -1.124294, -4.896119, 1, 1, 1, 1, 1,
-0.2830873, -1.24333, -2.533745, 1, 1, 1, 1, 1,
-0.2790651, 1.527684, 1.151833, 1, 1, 1, 1, 1,
-0.2784324, -0.2318896, -3.07998, 1, 1, 1, 1, 1,
-0.2765173, -0.4530088, -1.977725, 1, 1, 1, 1, 1,
-0.2753048, 0.9716471, 0.4633273, 1, 1, 1, 1, 1,
-0.2705583, 0.1144452, -1.460672, 1, 1, 1, 1, 1,
-0.2654263, -0.03444153, 0.5986309, 1, 1, 1, 1, 1,
-0.2651756, 0.3610465, -1.355778, 1, 1, 1, 1, 1,
-0.2622221, -0.3870154, -2.469697, 1, 1, 1, 1, 1,
-0.2582501, -0.7214179, -2.972461, 1, 1, 1, 1, 1,
-0.2574943, -1.02447, -2.567775, 1, 1, 1, 1, 1,
-0.2561232, -0.8226846, -3.640698, 0, 0, 1, 1, 1,
-0.2546517, 1.596961, 0.6504238, 1, 0, 0, 1, 1,
-0.2502818, 0.4949408, -1.151542, 1, 0, 0, 1, 1,
-0.2500406, 0.3001099, -1.665589, 1, 0, 0, 1, 1,
-0.249201, -0.5996084, -3.83087, 1, 0, 0, 1, 1,
-0.2478774, -2.018478, -2.823883, 1, 0, 0, 1, 1,
-0.2457995, 0.7344301, -1.415633, 0, 0, 0, 1, 1,
-0.2431516, 0.399965, 0.2635324, 0, 0, 0, 1, 1,
-0.2368092, 1.490556, 1.037629, 0, 0, 0, 1, 1,
-0.236593, -1.251762, -3.426625, 0, 0, 0, 1, 1,
-0.2364017, -1.710648, -4.786651, 0, 0, 0, 1, 1,
-0.2323919, 0.9817623, -0.5465074, 0, 0, 0, 1, 1,
-0.2312834, 0.06732178, 0.09509464, 0, 0, 0, 1, 1,
-0.227791, 0.07860069, -1.256032, 1, 1, 1, 1, 1,
-0.2276888, 1.533179, -0.7980474, 1, 1, 1, 1, 1,
-0.2259399, -0.3689263, -2.617754, 1, 1, 1, 1, 1,
-0.2220781, -0.2247611, -3.602564, 1, 1, 1, 1, 1,
-0.2195159, 0.1973592, -1.629954, 1, 1, 1, 1, 1,
-0.2183181, 1.156192, 1.006873, 1, 1, 1, 1, 1,
-0.2128983, 1.744556, -0.8757952, 1, 1, 1, 1, 1,
-0.2116634, 0.03330755, -1.550072, 1, 1, 1, 1, 1,
-0.2111981, 2.044554, 0.5887676, 1, 1, 1, 1, 1,
-0.2102499, 1.934652, -0.9542931, 1, 1, 1, 1, 1,
-0.206932, -0.4989068, -3.921197, 1, 1, 1, 1, 1,
-0.2065405, 0.7874483, -0.6339247, 1, 1, 1, 1, 1,
-0.2062982, 1.05606, -0.7041219, 1, 1, 1, 1, 1,
-0.1943671, -2.373064, -2.843796, 1, 1, 1, 1, 1,
-0.193088, -0.3482902, -2.699384, 1, 1, 1, 1, 1,
-0.1916229, 0.4373836, -0.481844, 0, 0, 1, 1, 1,
-0.1873554, -0.983761, -0.2533854, 1, 0, 0, 1, 1,
-0.1868579, -0.4915992, -2.68708, 1, 0, 0, 1, 1,
-0.1862034, 1.452442, -0.9101462, 1, 0, 0, 1, 1,
-0.1861785, 0.4702621, -0.08620945, 1, 0, 0, 1, 1,
-0.1846408, 0.6613672, 1.736404, 1, 0, 0, 1, 1,
-0.174076, -0.3258489, -1.893533, 0, 0, 0, 1, 1,
-0.1736693, 1.472886, 0.4129884, 0, 0, 0, 1, 1,
-0.1673393, -0.6057352, -3.101272, 0, 0, 0, 1, 1,
-0.1665778, -0.7745019, -1.314608, 0, 0, 0, 1, 1,
-0.1634955, 0.3546106, -0.3146361, 0, 0, 0, 1, 1,
-0.1620029, -0.6350558, -4.059252, 0, 0, 0, 1, 1,
-0.1615503, -0.6983888, -2.563869, 0, 0, 0, 1, 1,
-0.1590578, -0.05787125, -1.906813, 1, 1, 1, 1, 1,
-0.1567264, 0.2667052, -0.6087232, 1, 1, 1, 1, 1,
-0.1543019, 0.4312543, -0.9001909, 1, 1, 1, 1, 1,
-0.153131, -1.803882, -2.593263, 1, 1, 1, 1, 1,
-0.1518892, -0.119777, -0.7783149, 1, 1, 1, 1, 1,
-0.1517809, -0.210708, -1.195665, 1, 1, 1, 1, 1,
-0.1475447, -0.4125618, -2.734492, 1, 1, 1, 1, 1,
-0.1405877, -1.883371, -3.206121, 1, 1, 1, 1, 1,
-0.1378117, 1.241119, 0.7535509, 1, 1, 1, 1, 1,
-0.126754, -0.8475773, -2.956548, 1, 1, 1, 1, 1,
-0.1247836, -1.288963, -4.783725, 1, 1, 1, 1, 1,
-0.123165, 1.44308, 0.2030952, 1, 1, 1, 1, 1,
-0.1214668, -0.2212137, -2.116282, 1, 1, 1, 1, 1,
-0.1188613, -0.3359624, -3.220805, 1, 1, 1, 1, 1,
-0.1186499, 0.4850154, 1.062796, 1, 1, 1, 1, 1,
-0.1183318, 0.4205795, -0.6581735, 0, 0, 1, 1, 1,
-0.1179782, 1.773978, 0.4409694, 1, 0, 0, 1, 1,
-0.1062386, -0.2664406, -2.833258, 1, 0, 0, 1, 1,
-0.1058591, -0.1417427, -2.599708, 1, 0, 0, 1, 1,
-0.1039881, 1.040361, 0.4371666, 1, 0, 0, 1, 1,
-0.1036448, -0.1754891, -3.457617, 1, 0, 0, 1, 1,
-0.1032378, -0.6223993, -1.778486, 0, 0, 0, 1, 1,
-0.1030147, 1.936416, -1.381471, 0, 0, 0, 1, 1,
-0.1021052, -0.03817675, -2.384174, 0, 0, 0, 1, 1,
-0.1011248, 2.645291, -0.586297, 0, 0, 0, 1, 1,
-0.1011003, -0.4747606, -4.14485, 0, 0, 0, 1, 1,
-0.1000813, 0.6720534, -2.682589, 0, 0, 0, 1, 1,
-0.09736877, 0.5858933, 0.09300701, 0, 0, 0, 1, 1,
-0.09518047, -2.019253, -3.191024, 1, 1, 1, 1, 1,
-0.08963422, 0.6644275, 0.63994, 1, 1, 1, 1, 1,
-0.08863416, 0.4409913, -1.131095, 1, 1, 1, 1, 1,
-0.08330645, 2.47827, 0.6592153, 1, 1, 1, 1, 1,
-0.08209961, -0.09118223, -2.397901, 1, 1, 1, 1, 1,
-0.081892, 1.163325, 1.369365, 1, 1, 1, 1, 1,
-0.08153185, 1.20188, 1.863046, 1, 1, 1, 1, 1,
-0.08120603, -1.18925, -3.250793, 1, 1, 1, 1, 1,
-0.08056022, -0.4332518, -4.119112, 1, 1, 1, 1, 1,
-0.07879306, 0.4160303, 0.06312295, 1, 1, 1, 1, 1,
-0.07737795, 0.6458803, 0.9144076, 1, 1, 1, 1, 1,
-0.07664998, 1.154599, 1.53879, 1, 1, 1, 1, 1,
-0.07660217, 0.3618578, -1.192011, 1, 1, 1, 1, 1,
-0.07580648, 1.0058, -1.614998, 1, 1, 1, 1, 1,
-0.07453337, 0.02739683, -2.107255, 1, 1, 1, 1, 1,
-0.0742673, 1.381776, 1.09285, 0, 0, 1, 1, 1,
-0.07404035, 0.2943681, -0.08396203, 1, 0, 0, 1, 1,
-0.07242627, 0.3649738, -0.1019411, 1, 0, 0, 1, 1,
-0.07232315, 1.037982, -0.8464928, 1, 0, 0, 1, 1,
-0.06939198, -1.678349, -3.405506, 1, 0, 0, 1, 1,
-0.06889906, 0.1347553, -0.1950098, 1, 0, 0, 1, 1,
-0.0672159, 1.664427, -1.026215, 0, 0, 0, 1, 1,
-0.04158686, -0.208405, -0.7839623, 0, 0, 0, 1, 1,
-0.03491135, 0.021356, -0.8433094, 0, 0, 0, 1, 1,
-0.03347572, -0.1460266, -1.732959, 0, 0, 0, 1, 1,
-0.03344362, 0.9406409, 2.429005, 0, 0, 0, 1, 1,
-0.02748039, -0.5166937, -5.898126, 0, 0, 0, 1, 1,
-0.0274508, -1.492776, -2.909737, 0, 0, 0, 1, 1,
-0.02391089, -2.002599, -3.237212, 1, 1, 1, 1, 1,
-0.02102505, -1.185925, -3.834594, 1, 1, 1, 1, 1,
-0.01340457, 0.06023896, -0.5682105, 1, 1, 1, 1, 1,
-0.006798063, 0.3773315, -0.5574257, 1, 1, 1, 1, 1,
-0.002768237, 0.3426922, 1.375449, 1, 1, 1, 1, 1,
-0.002083058, -2.010951, -4.331954, 1, 1, 1, 1, 1,
-0.001701792, 0.3762668, 0.649686, 1, 1, 1, 1, 1,
-0.001271805, -0.3814082, -4.177751, 1, 1, 1, 1, 1,
-0.0002922551, -1.423267, -1.524352, 1, 1, 1, 1, 1,
0.0006455229, 0.3946028, 0.3473417, 1, 1, 1, 1, 1,
0.007677537, -0.6055977, 2.025266, 1, 1, 1, 1, 1,
0.02342874, 1.223741, 0.8550221, 1, 1, 1, 1, 1,
0.02474588, -0.2585652, 2.049978, 1, 1, 1, 1, 1,
0.02887982, 0.1337411, 0.09024127, 1, 1, 1, 1, 1,
0.02922385, 0.6936874, 1.3468, 1, 1, 1, 1, 1,
0.03110642, -1.469803, 1.776415, 0, 0, 1, 1, 1,
0.03159999, -0.1395592, 1.939511, 1, 0, 0, 1, 1,
0.03786181, 0.8519474, -0.06628795, 1, 0, 0, 1, 1,
0.04744244, 1.257547, 0.8338795, 1, 0, 0, 1, 1,
0.05431062, 0.920732, 0.1435509, 1, 0, 0, 1, 1,
0.05451115, 0.6709758, 2.021698, 1, 0, 0, 1, 1,
0.05580739, 1.41077, 0.9569545, 0, 0, 0, 1, 1,
0.06158582, -0.6845645, 4.337208, 0, 0, 0, 1, 1,
0.06284704, 1.966819, -0.4736878, 0, 0, 0, 1, 1,
0.0628613, 0.5765755, -0.06668899, 0, 0, 0, 1, 1,
0.06625511, 2.295563, 0.5801047, 0, 0, 0, 1, 1,
0.06873702, -1.132994, 2.378559, 0, 0, 0, 1, 1,
0.07215743, -0.004379985, 2.18176, 0, 0, 0, 1, 1,
0.07281705, 1.422299, -2.286431, 1, 1, 1, 1, 1,
0.07294717, -0.2072122, 3.637567, 1, 1, 1, 1, 1,
0.07334456, -1.609191, 3.996403, 1, 1, 1, 1, 1,
0.07507013, -0.4280572, 2.569673, 1, 1, 1, 1, 1,
0.07847411, -0.1876572, 4.116028, 1, 1, 1, 1, 1,
0.08148567, -0.7239297, 2.961163, 1, 1, 1, 1, 1,
0.08441744, 0.05473736, 2.429064, 1, 1, 1, 1, 1,
0.08492516, -0.01798649, 1.584857, 1, 1, 1, 1, 1,
0.09133621, 2.086682, 1.710192, 1, 1, 1, 1, 1,
0.09787612, -0.7976063, 4.419158, 1, 1, 1, 1, 1,
0.1007283, -0.9795307, 4.213192, 1, 1, 1, 1, 1,
0.1028092, -2.446516, 4.084051, 1, 1, 1, 1, 1,
0.1030454, -2.062873, 2.35943, 1, 1, 1, 1, 1,
0.1082877, -0.189711, 1.705323, 1, 1, 1, 1, 1,
0.1098146, 0.3003477, 0.6445385, 1, 1, 1, 1, 1,
0.1119784, -0.6649386, 2.673136, 0, 0, 1, 1, 1,
0.1128567, -0.3404925, 1.34564, 1, 0, 0, 1, 1,
0.1154414, 1.483916, 1.213796, 1, 0, 0, 1, 1,
0.1227746, -0.3584972, 3.842424, 1, 0, 0, 1, 1,
0.1250197, 0.3671993, 0.05112628, 1, 0, 0, 1, 1,
0.1303929, -0.1684491, 2.475386, 1, 0, 0, 1, 1,
0.1306386, 0.6711026, 1.405022, 0, 0, 0, 1, 1,
0.1313006, 0.7079791, 0.2854289, 0, 0, 0, 1, 1,
0.1323731, 1.206777, -0.9995639, 0, 0, 0, 1, 1,
0.1365664, 0.6883842, 1.585073, 0, 0, 0, 1, 1,
0.1410086, 0.3007662, 0.6999588, 0, 0, 0, 1, 1,
0.1410364, -1.069697, 2.844092, 0, 0, 0, 1, 1,
0.1462678, -0.9826777, 3.257122, 0, 0, 0, 1, 1,
0.1475418, 1.257233, 0.9401149, 1, 1, 1, 1, 1,
0.1499287, -0.2197757, 2.770105, 1, 1, 1, 1, 1,
0.15216, -0.9904227, 3.215397, 1, 1, 1, 1, 1,
0.1527605, -2.142498, 2.015224, 1, 1, 1, 1, 1,
0.1563226, -1.069278, 4.548918, 1, 1, 1, 1, 1,
0.1648887, -0.120846, 1.777917, 1, 1, 1, 1, 1,
0.1693455, -0.2328286, 2.703311, 1, 1, 1, 1, 1,
0.1717223, -0.8807332, 0.6344221, 1, 1, 1, 1, 1,
0.1727399, -0.1538657, 2.879822, 1, 1, 1, 1, 1,
0.1747061, -0.2542164, 4.349426, 1, 1, 1, 1, 1,
0.1771495, 0.2501844, 0.5129865, 1, 1, 1, 1, 1,
0.1824531, 1.812975, 0.2472129, 1, 1, 1, 1, 1,
0.1841255, -0.9054554, 2.485545, 1, 1, 1, 1, 1,
0.1886088, -1.469142, 1.254683, 1, 1, 1, 1, 1,
0.1926562, -1.097505, 3.145797, 1, 1, 1, 1, 1,
0.1938092, 0.1041056, 2.688077, 0, 0, 1, 1, 1,
0.1982478, -0.3733494, 2.073859, 1, 0, 0, 1, 1,
0.2021087, -0.1920549, 2.959427, 1, 0, 0, 1, 1,
0.2055342, 0.4232138, 0.6739912, 1, 0, 0, 1, 1,
0.2064879, 0.3855726, 0.1157822, 1, 0, 0, 1, 1,
0.209198, 0.9410261, -0.5634898, 1, 0, 0, 1, 1,
0.2171256, 0.3443867, 0.6182725, 0, 0, 0, 1, 1,
0.2189131, 0.6422749, -1.008767, 0, 0, 0, 1, 1,
0.2194431, -2.042895, 2.378506, 0, 0, 0, 1, 1,
0.2199967, 0.2329265, -0.1214126, 0, 0, 0, 1, 1,
0.2325249, 0.02586821, 2.466522, 0, 0, 0, 1, 1,
0.2352102, -0.5630085, 3.022826, 0, 0, 0, 1, 1,
0.2360365, 0.4509996, 1.557638, 0, 0, 0, 1, 1,
0.2386626, 0.04017146, 0.681852, 1, 1, 1, 1, 1,
0.2391568, -0.2916705, 0.6745251, 1, 1, 1, 1, 1,
0.2422158, -0.4226348, 2.158968, 1, 1, 1, 1, 1,
0.2435856, -1.712275, 3.651413, 1, 1, 1, 1, 1,
0.2436272, -1.057062, 2.022032, 1, 1, 1, 1, 1,
0.2456933, -0.254359, 3.586144, 1, 1, 1, 1, 1,
0.2510939, 0.2422362, 2.020211, 1, 1, 1, 1, 1,
0.253473, -0.3497774, 1.116572, 1, 1, 1, 1, 1,
0.2568373, -0.05236446, 2.622805, 1, 1, 1, 1, 1,
0.2611803, -0.415882, 2.013635, 1, 1, 1, 1, 1,
0.2676493, -0.2644455, 0.5185014, 1, 1, 1, 1, 1,
0.2686751, -0.5385427, 3.250984, 1, 1, 1, 1, 1,
0.269595, -2.086559, 4.262621, 1, 1, 1, 1, 1,
0.2696499, -1.757824, 3.010869, 1, 1, 1, 1, 1,
0.2728769, -0.540765, 3.881215, 1, 1, 1, 1, 1,
0.273977, -0.6005654, 3.235328, 0, 0, 1, 1, 1,
0.2761354, -1.379658, 2.082862, 1, 0, 0, 1, 1,
0.2812955, 0.1487788, 0.2674997, 1, 0, 0, 1, 1,
0.2920748, 1.4643, 0.2970813, 1, 0, 0, 1, 1,
0.295841, -0.2642117, 2.787847, 1, 0, 0, 1, 1,
0.3020037, 1.125474, -1.140865, 1, 0, 0, 1, 1,
0.3021152, -0.432038, 3.273244, 0, 0, 0, 1, 1,
0.3083706, 0.769051, -0.1646781, 0, 0, 0, 1, 1,
0.3102953, -0.7108029, 2.100814, 0, 0, 0, 1, 1,
0.312418, 1.864267, 0.5080585, 0, 0, 0, 1, 1,
0.3154458, 0.7621849, 2.709424, 0, 0, 0, 1, 1,
0.3247375, 0.5686901, 0.9264128, 0, 0, 0, 1, 1,
0.3254742, -1.931917, 2.996448, 0, 0, 0, 1, 1,
0.326958, -0.1701841, 0.7272429, 1, 1, 1, 1, 1,
0.3273695, 0.6584043, 0.5403275, 1, 1, 1, 1, 1,
0.3274919, -0.7090549, 2.776409, 1, 1, 1, 1, 1,
0.3325792, 0.2515178, 1.574988, 1, 1, 1, 1, 1,
0.3334745, -1.142632, 2.757564, 1, 1, 1, 1, 1,
0.3339607, -1.179471, 3.023211, 1, 1, 1, 1, 1,
0.335661, -1.745041, 4.199606, 1, 1, 1, 1, 1,
0.3397437, 0.1032806, 1.570692, 1, 1, 1, 1, 1,
0.3432105, 0.2951429, -0.9398749, 1, 1, 1, 1, 1,
0.3440754, -1.398501, 1.960937, 1, 1, 1, 1, 1,
0.344225, 1.077595, 0.2329222, 1, 1, 1, 1, 1,
0.3471702, 0.1861515, 1.371107, 1, 1, 1, 1, 1,
0.3533609, -0.8706214, 2.74026, 1, 1, 1, 1, 1,
0.3553959, 0.04079967, -1.162392, 1, 1, 1, 1, 1,
0.3569755, -0.08604401, 1.8311, 1, 1, 1, 1, 1,
0.3577059, 1.764556, -1.898971, 0, 0, 1, 1, 1,
0.3593288, 0.8655261, 1.470934, 1, 0, 0, 1, 1,
0.360144, -0.2647257, 2.745818, 1, 0, 0, 1, 1,
0.3606105, -1.607246, 3.081203, 1, 0, 0, 1, 1,
0.3624175, 0.6719362, -2.397612, 1, 0, 0, 1, 1,
0.3631378, -0.7793852, 1.721632, 1, 0, 0, 1, 1,
0.3679613, 1.601502, 1.923353, 0, 0, 0, 1, 1,
0.3682709, -0.5476608, 3.177484, 0, 0, 0, 1, 1,
0.3685286, 0.8119135, -0.280693, 0, 0, 0, 1, 1,
0.3700911, 0.5334829, 1.551646, 0, 0, 0, 1, 1,
0.3701547, -1.511354, 4.418649, 0, 0, 0, 1, 1,
0.3763741, 0.2466285, 0.7282692, 0, 0, 0, 1, 1,
0.376687, -0.6160965, 1.288273, 0, 0, 0, 1, 1,
0.3801729, 1.642971, -0.7527658, 1, 1, 1, 1, 1,
0.3836648, -1.891126, 2.294731, 1, 1, 1, 1, 1,
0.3893858, 0.3537052, 1.211153, 1, 1, 1, 1, 1,
0.390875, 0.3563353, 2.411434, 1, 1, 1, 1, 1,
0.3998498, 0.5070726, 0.4363018, 1, 1, 1, 1, 1,
0.4003729, -0.9592955, 1.7457, 1, 1, 1, 1, 1,
0.4007072, 0.4440471, 1.662552, 1, 1, 1, 1, 1,
0.4024973, -1.579272, 5.226984, 1, 1, 1, 1, 1,
0.4025591, 1.835553, -0.01234214, 1, 1, 1, 1, 1,
0.405704, 0.2981315, 1.385888, 1, 1, 1, 1, 1,
0.4102465, -0.2580523, 2.568249, 1, 1, 1, 1, 1,
0.4113427, -0.2241367, 1.199387, 1, 1, 1, 1, 1,
0.4131229, 1.171565, -0.4189367, 1, 1, 1, 1, 1,
0.4168482, 1.155006, -0.4247329, 1, 1, 1, 1, 1,
0.4187839, 0.5569826, -0.8628597, 1, 1, 1, 1, 1,
0.4201375, -1.247162, 2.288687, 0, 0, 1, 1, 1,
0.4227112, -0.4618394, 3.396, 1, 0, 0, 1, 1,
0.4234604, 1.083456, 0.6917939, 1, 0, 0, 1, 1,
0.4264382, 1.410313, 0.2055338, 1, 0, 0, 1, 1,
0.4426847, -0.2448805, 1.507819, 1, 0, 0, 1, 1,
0.4483989, -0.1989634, 3.154958, 1, 0, 0, 1, 1,
0.4509404, 1.13937, 0.3412116, 0, 0, 0, 1, 1,
0.454236, -0.01087762, 1.494129, 0, 0, 0, 1, 1,
0.4550054, 1.334606, 1.356719, 0, 0, 0, 1, 1,
0.4574814, 0.5916742, 0.3846627, 0, 0, 0, 1, 1,
0.4585302, -0.1418988, 2.02488, 0, 0, 0, 1, 1,
0.4609145, 1.497472, 1.188056, 0, 0, 0, 1, 1,
0.4614674, -1.508463, 3.102045, 0, 0, 0, 1, 1,
0.4795938, 0.3408436, 1.392094, 1, 1, 1, 1, 1,
0.4811195, -0.6540038, 3.822081, 1, 1, 1, 1, 1,
0.4857316, 0.8095037, -0.07554957, 1, 1, 1, 1, 1,
0.4876345, -0.4632737, 2.273078, 1, 1, 1, 1, 1,
0.4938205, -0.9261254, 2.834381, 1, 1, 1, 1, 1,
0.4961474, 0.3607301, -0.5368154, 1, 1, 1, 1, 1,
0.4997836, -1.545322, 2.435099, 1, 1, 1, 1, 1,
0.5044581, 0.09675769, 0.8862481, 1, 1, 1, 1, 1,
0.5047449, 0.3751127, 0.4771899, 1, 1, 1, 1, 1,
0.5058562, -1.204634, 4.036939, 1, 1, 1, 1, 1,
0.509437, -0.02792173, 0.9785465, 1, 1, 1, 1, 1,
0.5127599, -1.211055, 1.728672, 1, 1, 1, 1, 1,
0.512934, 0.4181694, 0.8150697, 1, 1, 1, 1, 1,
0.519591, 0.005188047, 2.905258, 1, 1, 1, 1, 1,
0.5199788, -0.9275509, 2.251076, 1, 1, 1, 1, 1,
0.5211286, -0.9725925, 0.2546492, 0, 0, 1, 1, 1,
0.5229463, -1.936155, 2.340969, 1, 0, 0, 1, 1,
0.5302178, 0.1197417, 0.3506353, 1, 0, 0, 1, 1,
0.5332446, 0.4143532, 1.142283, 1, 0, 0, 1, 1,
0.5332859, 0.2868122, 1.743979, 1, 0, 0, 1, 1,
0.5370893, -0.7968222, 2.138475, 1, 0, 0, 1, 1,
0.5374946, 0.5952243, 2.254127, 0, 0, 0, 1, 1,
0.5403789, -0.6376101, 2.60587, 0, 0, 0, 1, 1,
0.5431914, -0.9898804, 4.772179, 0, 0, 0, 1, 1,
0.5487313, -2.059423, 4.128204, 0, 0, 0, 1, 1,
0.5529305, -0.1263516, 1.645754, 0, 0, 0, 1, 1,
0.5535368, 0.5361254, 0.1079241, 0, 0, 0, 1, 1,
0.5588813, 0.8147798, 0.5086351, 0, 0, 0, 1, 1,
0.558945, 0.5594888, -0.6749574, 1, 1, 1, 1, 1,
0.5618995, -1.017439, 2.326134, 1, 1, 1, 1, 1,
0.5621077, 1.161117, -0.01689376, 1, 1, 1, 1, 1,
0.5743245, 0.1325444, 2.306834, 1, 1, 1, 1, 1,
0.5827305, 0.1122516, 2.935362, 1, 1, 1, 1, 1,
0.590381, 2.451474, -1.199598, 1, 1, 1, 1, 1,
0.5915696, 0.5817382, 1.723887, 1, 1, 1, 1, 1,
0.5927197, -0.710949, 2.811392, 1, 1, 1, 1, 1,
0.6019247, -1.384071, 1.476142, 1, 1, 1, 1, 1,
0.615521, -0.02794219, 0.6388014, 1, 1, 1, 1, 1,
0.6170706, 0.9265242, 0.6085525, 1, 1, 1, 1, 1,
0.6185885, -0.403393, 3.586959, 1, 1, 1, 1, 1,
0.6233112, -0.7770658, 3.964398, 1, 1, 1, 1, 1,
0.628786, 0.7615829, -0.8886749, 1, 1, 1, 1, 1,
0.6289991, -0.5515711, 1.573349, 1, 1, 1, 1, 1,
0.6319828, -1.040697, 2.035611, 0, 0, 1, 1, 1,
0.6332033, 0.9779552, -0.1984272, 1, 0, 0, 1, 1,
0.6359544, 1.825827, 0.3084735, 1, 0, 0, 1, 1,
0.6452684, -0.9611797, 2.754574, 1, 0, 0, 1, 1,
0.6458091, 0.2794778, 3.294496, 1, 0, 0, 1, 1,
0.6472313, 0.6940098, 0.9964831, 1, 0, 0, 1, 1,
0.6507642, -0.57454, 2.560574, 0, 0, 0, 1, 1,
0.6535991, 1.114109, 0.06274781, 0, 0, 0, 1, 1,
0.658157, -0.1235789, 1.662024, 0, 0, 0, 1, 1,
0.660098, 0.3388127, 1.70049, 0, 0, 0, 1, 1,
0.6636208, -0.2130521, 2.856169, 0, 0, 0, 1, 1,
0.6686398, -0.01948639, 3.117191, 0, 0, 0, 1, 1,
0.6704031, 0.3522508, 3.077322, 0, 0, 0, 1, 1,
0.6777136, -1.235023, 2.18691, 1, 1, 1, 1, 1,
0.6808455, 0.7879065, -0.403557, 1, 1, 1, 1, 1,
0.6851567, -1.337913, 2.275179, 1, 1, 1, 1, 1,
0.6878121, 0.1022072, 0.4923665, 1, 1, 1, 1, 1,
0.6948138, -0.9245733, 3.64911, 1, 1, 1, 1, 1,
0.7011528, -1.246747, 4.09724, 1, 1, 1, 1, 1,
0.7045497, 0.1584735, 2.632077, 1, 1, 1, 1, 1,
0.7076701, -0.3469229, 3.160564, 1, 1, 1, 1, 1,
0.7179583, -0.8710971, 1.707843, 1, 1, 1, 1, 1,
0.7183452, -0.8062999, 2.404649, 1, 1, 1, 1, 1,
0.7276884, -0.2995606, 1.715632, 1, 1, 1, 1, 1,
0.729901, -0.7073001, 2.485597, 1, 1, 1, 1, 1,
0.7299637, -0.2952723, 2.187079, 1, 1, 1, 1, 1,
0.7318439, 0.9825719, -0.9501095, 1, 1, 1, 1, 1,
0.7349371, -1.831186, 2.331604, 1, 1, 1, 1, 1,
0.7364771, -0.2890242, 0.1174668, 0, 0, 1, 1, 1,
0.7388431, -2.301661, 2.803426, 1, 0, 0, 1, 1,
0.7450059, -0.1005099, 1.60689, 1, 0, 0, 1, 1,
0.7461231, 0.81884, 0.05614847, 1, 0, 0, 1, 1,
0.7535685, -0.8283537, 1.670986, 1, 0, 0, 1, 1,
0.7610657, 1.616486, 0.4944495, 1, 0, 0, 1, 1,
0.7630672, 0.8328691, 0.8601862, 0, 0, 0, 1, 1,
0.7649496, 0.6218227, 1.745528, 0, 0, 0, 1, 1,
0.7716146, 0.3785335, 0.2476036, 0, 0, 0, 1, 1,
0.773603, 0.009742907, 1.447255, 0, 0, 0, 1, 1,
0.7747663, 0.4469547, 1.749769, 0, 0, 0, 1, 1,
0.7769132, -0.6239604, 3.112363, 0, 0, 0, 1, 1,
0.7794242, 0.7468317, 2.684237, 0, 0, 0, 1, 1,
0.7979814, 1.279096, -0.7468676, 1, 1, 1, 1, 1,
0.8001007, 0.4607167, -0.4393196, 1, 1, 1, 1, 1,
0.8012156, 0.5126983, -0.8248272, 1, 1, 1, 1, 1,
0.8035187, -0.3839377, 4.31136, 1, 1, 1, 1, 1,
0.8072109, -1.517448, 1.911001, 1, 1, 1, 1, 1,
0.8112698, -0.5191548, 3.077531, 1, 1, 1, 1, 1,
0.811799, 0.563217, 1.064451, 1, 1, 1, 1, 1,
0.8167205, -0.8766012, 2.020275, 1, 1, 1, 1, 1,
0.8209418, 0.6632746, 1.340097, 1, 1, 1, 1, 1,
0.836256, 1.268986, -0.2391936, 1, 1, 1, 1, 1,
0.8498055, -1.417098, 3.039372, 1, 1, 1, 1, 1,
0.8521801, -0.03720457, 1.943804, 1, 1, 1, 1, 1,
0.8590305, 0.9224295, 1.47519, 1, 1, 1, 1, 1,
0.8676652, -0.6325116, -0.3014258, 1, 1, 1, 1, 1,
0.8679104, 0.4063047, 0.760696, 1, 1, 1, 1, 1,
0.8708083, 0.4168787, 1.832845, 0, 0, 1, 1, 1,
0.8757756, -1.27874, 3.989132, 1, 0, 0, 1, 1,
0.8775145, -0.3673076, 1.912236, 1, 0, 0, 1, 1,
0.8786817, 0.6500227, 0.5826673, 1, 0, 0, 1, 1,
0.8858129, 0.4311889, -0.2135809, 1, 0, 0, 1, 1,
0.8870626, 1.301751, 0.4365123, 1, 0, 0, 1, 1,
0.8872626, 0.2096805, 1.442697, 0, 0, 0, 1, 1,
0.8914054, -0.03961933, 2.387893, 0, 0, 0, 1, 1,
0.897685, 0.6573038, 0.8639204, 0, 0, 0, 1, 1,
0.9026461, -0.6139691, 1.514157, 0, 0, 0, 1, 1,
0.9091989, 0.6840195, 3.086061, 0, 0, 0, 1, 1,
0.9096904, -1.143395, 3.81973, 0, 0, 0, 1, 1,
0.9099743, -0.2619035, -0.04415252, 0, 0, 0, 1, 1,
0.9149442, -0.1827842, 1.217239, 1, 1, 1, 1, 1,
0.9177412, 2.004574, 2.133082, 1, 1, 1, 1, 1,
0.9182066, -0.8109732, 2.742132, 1, 1, 1, 1, 1,
0.9185272, -1.513806, 4.553798, 1, 1, 1, 1, 1,
0.9216008, -1.116143, 1.41129, 1, 1, 1, 1, 1,
0.9298369, 0.5591906, 1.784912, 1, 1, 1, 1, 1,
0.9370008, 1.014965, 0.2235886, 1, 1, 1, 1, 1,
0.9420464, -0.7634266, 2.195314, 1, 1, 1, 1, 1,
0.9421803, 1.453981, -0.1402738, 1, 1, 1, 1, 1,
0.9467925, -0.2424627, 1.085444, 1, 1, 1, 1, 1,
0.9496508, -0.1510689, 0.9271744, 1, 1, 1, 1, 1,
0.9499657, 1.598904, 0.1440466, 1, 1, 1, 1, 1,
0.9515724, 0.748399, 0.3037288, 1, 1, 1, 1, 1,
0.9552982, 0.4351822, 1.913565, 1, 1, 1, 1, 1,
0.9691558, -1.347648, 3.176362, 1, 1, 1, 1, 1,
0.9703499, -1.473291, 0.6080114, 0, 0, 1, 1, 1,
0.972195, 1.074827, 2.3985, 1, 0, 0, 1, 1,
0.9731949, 0.2089641, 2.363042, 1, 0, 0, 1, 1,
0.9736128, -0.6346975, 2.495365, 1, 0, 0, 1, 1,
0.9754125, -0.319848, 3.344044, 1, 0, 0, 1, 1,
0.9777255, 0.122252, 1.600713, 1, 0, 0, 1, 1,
0.9806789, -1.692813, 3.42715, 0, 0, 0, 1, 1,
0.9812813, 1.247219, 1.564783, 0, 0, 0, 1, 1,
0.9879483, 1.801668, 0.6033053, 0, 0, 0, 1, 1,
0.9888743, 1.262408, 1.571401, 0, 0, 0, 1, 1,
0.9892681, -0.03585489, 1.929781, 0, 0, 0, 1, 1,
0.996067, 1.600239, 1.732919, 0, 0, 0, 1, 1,
1.001377, -0.4808037, 0.3702261, 0, 0, 0, 1, 1,
1.004604, 0.4653333, 0.4855924, 1, 1, 1, 1, 1,
1.005457, -0.7678703, 3.019268, 1, 1, 1, 1, 1,
1.009462, 1.013032, 0.4425242, 1, 1, 1, 1, 1,
1.009518, 0.8130055, 1.384703, 1, 1, 1, 1, 1,
1.011052, -0.02717513, 3.01562, 1, 1, 1, 1, 1,
1.012278, 0.1195439, 1.574906, 1, 1, 1, 1, 1,
1.015018, -1.293923, 2.899141, 1, 1, 1, 1, 1,
1.016785, -0.2782194, 2.967444, 1, 1, 1, 1, 1,
1.022299, 0.6126752, 2.729022, 1, 1, 1, 1, 1,
1.02297, 0.04321341, 2.57565, 1, 1, 1, 1, 1,
1.026345, -0.1979306, 1.59454, 1, 1, 1, 1, 1,
1.027432, -0.4513073, 2.416251, 1, 1, 1, 1, 1,
1.028352, 1.088546, 1.592638, 1, 1, 1, 1, 1,
1.028882, 1.101473, 1.506006, 1, 1, 1, 1, 1,
1.031602, -0.9319353, 4.631573, 1, 1, 1, 1, 1,
1.03717, -1.055648, 2.562943, 0, 0, 1, 1, 1,
1.040859, 0.01509337, 3.249409, 1, 0, 0, 1, 1,
1.047858, -0.730754, -0.1444828, 1, 0, 0, 1, 1,
1.051758, -1.499731, 3.605556, 1, 0, 0, 1, 1,
1.05338, -1.318888, 1.337288, 1, 0, 0, 1, 1,
1.056769, -1.193877, 2.0693, 1, 0, 0, 1, 1,
1.064132, 0.3893795, 1.164403, 0, 0, 0, 1, 1,
1.070619, 1.21054, -0.6161984, 0, 0, 0, 1, 1,
1.076099, 0.3863535, -0.3436658, 0, 0, 0, 1, 1,
1.082126, -0.4532724, 2.447383, 0, 0, 0, 1, 1,
1.091201, -0.9928167, 2.553282, 0, 0, 0, 1, 1,
1.091289, -0.1639939, 2.447394, 0, 0, 0, 1, 1,
1.092658, 1.061737, -1.437418, 0, 0, 0, 1, 1,
1.094261, -0.4219105, 2.039657, 1, 1, 1, 1, 1,
1.094997, 0.5831347, -0.01432592, 1, 1, 1, 1, 1,
1.099268, 1.58597, 1.018935, 1, 1, 1, 1, 1,
1.105537, -0.2151219, 2.492117, 1, 1, 1, 1, 1,
1.107173, -1.034567, 1.092416, 1, 1, 1, 1, 1,
1.109751, 0.2695973, 2.820327, 1, 1, 1, 1, 1,
1.110081, 0.3591, 0.8893256, 1, 1, 1, 1, 1,
1.11103, 1.622741, 1.652593, 1, 1, 1, 1, 1,
1.112626, 0.8481042, 3.1866, 1, 1, 1, 1, 1,
1.121854, -0.9413257, 3.41302, 1, 1, 1, 1, 1,
1.124981, -0.3874093, 1.637752, 1, 1, 1, 1, 1,
1.127221, 0.3999914, 0.8337786, 1, 1, 1, 1, 1,
1.135649, -0.5599246, 3.157964, 1, 1, 1, 1, 1,
1.15238, 0.3873209, 2.078686, 1, 1, 1, 1, 1,
1.152615, -0.5204442, 3.016741, 1, 1, 1, 1, 1,
1.159277, -0.4515851, 1.722642, 0, 0, 1, 1, 1,
1.160181, -0.5876702, 1.827045, 1, 0, 0, 1, 1,
1.16074, -0.1675661, 1.705369, 1, 0, 0, 1, 1,
1.160953, -0.3498824, 1.770832, 1, 0, 0, 1, 1,
1.162279, -1.937035, 1.7844, 1, 0, 0, 1, 1,
1.166609, 0.8023069, 0.1362146, 1, 0, 0, 1, 1,
1.166748, 0.471399, 0.7196814, 0, 0, 0, 1, 1,
1.174085, 1.536226, 2.350892, 0, 0, 0, 1, 1,
1.174091, -0.2052658, 2.285049, 0, 0, 0, 1, 1,
1.174504, 1.450764, 0.4926572, 0, 0, 0, 1, 1,
1.175132, 0.7315074, 1.889916, 0, 0, 0, 1, 1,
1.175671, 0.05155905, 1.028314, 0, 0, 0, 1, 1,
1.178148, -0.4687937, 1.14413, 0, 0, 0, 1, 1,
1.199468, 1.246568, 2.735979, 1, 1, 1, 1, 1,
1.205491, 0.3137184, 2.277543, 1, 1, 1, 1, 1,
1.209939, 0.07525898, 0.09916297, 1, 1, 1, 1, 1,
1.210317, -1.006703, 3.207113, 1, 1, 1, 1, 1,
1.216222, 0.4857582, 3.275639, 1, 1, 1, 1, 1,
1.220069, -0.7988166, 2.98686, 1, 1, 1, 1, 1,
1.223075, 1.838599, -0.6362185, 1, 1, 1, 1, 1,
1.224469, 0.3838162, 1.00261, 1, 1, 1, 1, 1,
1.230269, -0.3295686, 1.423834, 1, 1, 1, 1, 1,
1.235177, -0.6529797, 1.584645, 1, 1, 1, 1, 1,
1.252204, 0.197168, 1.322884, 1, 1, 1, 1, 1,
1.257143, -3.24211, 2.156581, 1, 1, 1, 1, 1,
1.257161, 0.1770273, 0.5296575, 1, 1, 1, 1, 1,
1.26194, 2.432094, 0.7924769, 1, 1, 1, 1, 1,
1.275793, 1.171775, 2.380648, 1, 1, 1, 1, 1,
1.281418, 1.520684, 0.8910559, 0, 0, 1, 1, 1,
1.297948, 1.781133, -0.3516559, 1, 0, 0, 1, 1,
1.30117, -1.050081, 2.453703, 1, 0, 0, 1, 1,
1.303126, -0.6909372, 2.849123, 1, 0, 0, 1, 1,
1.308205, -0.9704655, 3.090102, 1, 0, 0, 1, 1,
1.31704, 0.09860198, 2.033512, 1, 0, 0, 1, 1,
1.327492, -0.4535436, 0.1434768, 0, 0, 0, 1, 1,
1.327986, -1.158316, 2.448892, 0, 0, 0, 1, 1,
1.346691, -0.7864177, 3.014633, 0, 0, 0, 1, 1,
1.350184, -0.703238, 1.559412, 0, 0, 0, 1, 1,
1.351603, 0.6561353, -0.3289452, 0, 0, 0, 1, 1,
1.361214, 1.304474, 1.557844, 0, 0, 0, 1, 1,
1.367223, -2.108821, 3.653256, 0, 0, 0, 1, 1,
1.379018, 1.074035, -1.26627, 1, 1, 1, 1, 1,
1.380379, 0.7925026, 1.349156, 1, 1, 1, 1, 1,
1.394043, 0.1620377, 1.336491, 1, 1, 1, 1, 1,
1.397507, 0.1116791, 2.545742, 1, 1, 1, 1, 1,
1.401333, 1.042879, 0.7575566, 1, 1, 1, 1, 1,
1.404391, -0.5036502, 0.6779634, 1, 1, 1, 1, 1,
1.410356, -0.7987596, 2.635375, 1, 1, 1, 1, 1,
1.410584, -0.6385334, 1.84876, 1, 1, 1, 1, 1,
1.411804, -1.473921, 1.21672, 1, 1, 1, 1, 1,
1.416271, -0.7981124, 3.230387, 1, 1, 1, 1, 1,
1.418053, 0.5141259, 1.611337, 1, 1, 1, 1, 1,
1.424271, 0.8530418, 1.620649, 1, 1, 1, 1, 1,
1.431506, 0.8954824, 0.3692324, 1, 1, 1, 1, 1,
1.433817, -1.223717, 1.897374, 1, 1, 1, 1, 1,
1.434682, 0.6089182, 0.4208407, 1, 1, 1, 1, 1,
1.43632, -0.8691137, 2.058422, 0, 0, 1, 1, 1,
1.438394, -0.2024677, 0.5736561, 1, 0, 0, 1, 1,
1.439798, 1.683913, 2.428607, 1, 0, 0, 1, 1,
1.440233, -0.9386747, 1.180768, 1, 0, 0, 1, 1,
1.448079, 0.263936, 1.549883, 1, 0, 0, 1, 1,
1.469738, -0.86168, 2.954348, 1, 0, 0, 1, 1,
1.484398, 0.7877605, 0.9346733, 0, 0, 0, 1, 1,
1.488147, 0.02675765, 0.3105, 0, 0, 0, 1, 1,
1.490282, -0.3295943, 1.215572, 0, 0, 0, 1, 1,
1.491037, -0.3158198, 0.5935141, 0, 0, 0, 1, 1,
1.492485, 0.3093401, 0.5395129, 0, 0, 0, 1, 1,
1.49268, 1.481801, 0.05406068, 0, 0, 0, 1, 1,
1.509657, 0.954767, 1.496994, 0, 0, 0, 1, 1,
1.515792, -1.581897, 4.017159, 1, 1, 1, 1, 1,
1.529006, 1.294755, 1.72426, 1, 1, 1, 1, 1,
1.532148, -0.1308205, 0.5020214, 1, 1, 1, 1, 1,
1.540712, -1.093091, 3.194666, 1, 1, 1, 1, 1,
1.547065, 0.5063344, 1.140863, 1, 1, 1, 1, 1,
1.561735, 0.8479715, 2.461635, 1, 1, 1, 1, 1,
1.564509, -1.574915, 1.772169, 1, 1, 1, 1, 1,
1.584431, 1.206496, 1.826575, 1, 1, 1, 1, 1,
1.585435, -1.128924, 3.841582, 1, 1, 1, 1, 1,
1.593431, -0.8506149, 1.33565, 1, 1, 1, 1, 1,
1.599729, -0.1399525, 1.58662, 1, 1, 1, 1, 1,
1.600879, 0.439586, 0.64062, 1, 1, 1, 1, 1,
1.615965, -1.752863, 2.68065, 1, 1, 1, 1, 1,
1.626034, -0.6078517, 2.546541, 1, 1, 1, 1, 1,
1.655291, 0.4268069, 1.352074, 1, 1, 1, 1, 1,
1.661575, -0.5770605, 2.182983, 0, 0, 1, 1, 1,
1.698149, -0.421394, 1.68976, 1, 0, 0, 1, 1,
1.698612, 0.7286331, 1.27341, 1, 0, 0, 1, 1,
1.6993, -0.3066617, 2.205065, 1, 0, 0, 1, 1,
1.717188, -1.239398, 1.845693, 1, 0, 0, 1, 1,
1.717209, 0.1441822, 1.946745, 1, 0, 0, 1, 1,
1.721855, 0.7643993, 2.228238, 0, 0, 0, 1, 1,
1.742281, -0.6904365, 2.654625, 0, 0, 0, 1, 1,
1.743285, -0.8353852, 1.178817, 0, 0, 0, 1, 1,
1.743681, -0.4747194, 2.244616, 0, 0, 0, 1, 1,
1.754396, -0.9472684, 4.135799, 0, 0, 0, 1, 1,
1.763331, -0.8814251, 1.661637, 0, 0, 0, 1, 1,
1.771779, 0.4186756, 0.3067953, 0, 0, 0, 1, 1,
1.779989, -2.228407, 2.864991, 1, 1, 1, 1, 1,
1.784129, -0.8035851, 1.966822, 1, 1, 1, 1, 1,
1.835561, -0.2331662, 2.715834, 1, 1, 1, 1, 1,
1.842837, 0.4614845, 1.333094, 1, 1, 1, 1, 1,
1.854597, 0.6313111, -0.7810301, 1, 1, 1, 1, 1,
1.864002, -0.09791528, -0.1989202, 1, 1, 1, 1, 1,
1.875439, 1.369839, 2.203556, 1, 1, 1, 1, 1,
1.88947, 0.1285851, -0.3669481, 1, 1, 1, 1, 1,
1.898666, -0.1260396, 2.176723, 1, 1, 1, 1, 1,
1.901454, 0.5915076, 0.4324789, 1, 1, 1, 1, 1,
1.904189, -0.571172, 0.5325081, 1, 1, 1, 1, 1,
1.91317, 0.1539618, 1.262851, 1, 1, 1, 1, 1,
1.919783, 1.226694, 1.855316, 1, 1, 1, 1, 1,
1.920054, -1.811671, 2.392198, 1, 1, 1, 1, 1,
1.932904, 0.02910548, 1.006496, 1, 1, 1, 1, 1,
1.939996, 1.925772, 1.492101, 0, 0, 1, 1, 1,
2.002451, -0.8759626, 2.803759, 1, 0, 0, 1, 1,
2.071092, 1.472869, 0.8805527, 1, 0, 0, 1, 1,
2.0816, 1.122322, 1.841797, 1, 0, 0, 1, 1,
2.093923, 0.7023793, 0.3754969, 1, 0, 0, 1, 1,
2.114584, -0.5474372, 0.01402526, 1, 0, 0, 1, 1,
2.158702, -0.1673605, 2.236794, 0, 0, 0, 1, 1,
2.238965, 0.6538334, 1.641659, 0, 0, 0, 1, 1,
2.239844, 0.3590589, 2.063072, 0, 0, 0, 1, 1,
2.257682, 0.08369379, 1.97389, 0, 0, 0, 1, 1,
2.262657, 1.214505, 1.250847, 0, 0, 0, 1, 1,
2.281974, 1.177181, -0.1194838, 0, 0, 0, 1, 1,
2.296226, -0.1942426, 1.104719, 0, 0, 0, 1, 1,
2.356684, 0.2480188, 1.536328, 1, 1, 1, 1, 1,
2.448341, -0.05250137, 2.047265, 1, 1, 1, 1, 1,
2.468421, -0.8086984, -0.5002617, 1, 1, 1, 1, 1,
2.582637, -0.922341, 3.284659, 1, 1, 1, 1, 1,
2.641671, -0.2674129, 1.326873, 1, 1, 1, 1, 1,
2.642985, -0.8433278, 1.332613, 1, 1, 1, 1, 1,
3.071515, 1.351735, 0.7999108, 1, 1, 1, 1, 1
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
var radius = 9.73642;
var distance = 34.19876;
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
mvMatrix.translate( 0.07483292, 0.3368186, 0.3355708 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19876);
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
