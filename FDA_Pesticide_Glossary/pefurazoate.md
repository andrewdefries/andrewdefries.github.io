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
-3.458126, 1.548718, -1.00289, 1, 0, 0, 1,
-2.683268, 1.155811, -0.05323531, 1, 0.007843138, 0, 1,
-2.484227, -1.151899, 0.002442624, 1, 0.01176471, 0, 1,
-2.475006, -2.043427, -2.723669, 1, 0.01960784, 0, 1,
-2.438021, 1.001247, -2.37596, 1, 0.02352941, 0, 1,
-2.415751, -1.571274, 0.3797885, 1, 0.03137255, 0, 1,
-2.349357, 0.5195122, -2.033281, 1, 0.03529412, 0, 1,
-2.196573, -0.962286, -2.832821, 1, 0.04313726, 0, 1,
-2.193161, -0.2541568, -0.5035103, 1, 0.04705882, 0, 1,
-2.190942, 1.017012, -0.6189579, 1, 0.05490196, 0, 1,
-2.169778, 0.9697472, 0.166601, 1, 0.05882353, 0, 1,
-2.152356, -1.125798, -2.255441, 1, 0.06666667, 0, 1,
-2.11138, -2.152856, -0.5022326, 1, 0.07058824, 0, 1,
-2.096347, 0.3906397, -0.7025707, 1, 0.07843138, 0, 1,
-2.079577, -0.5768433, -2.860668, 1, 0.08235294, 0, 1,
-2.040853, 1.302236, -1.889199, 1, 0.09019608, 0, 1,
-2.039355, -0.2118715, -1.035255, 1, 0.09411765, 0, 1,
-2.026968, 0.4131135, 0.2649634, 1, 0.1019608, 0, 1,
-2.006839, -1.43719, -0.802122, 1, 0.1098039, 0, 1,
-2.005552, -1.009392, 0.232795, 1, 0.1137255, 0, 1,
-2.000441, 0.785111, -1.886906, 1, 0.1215686, 0, 1,
-1.990766, 1.02205, -2.529529, 1, 0.1254902, 0, 1,
-1.973957, 1.988234, -2.862553, 1, 0.1333333, 0, 1,
-1.970842, 0.838627, -3.168695, 1, 0.1372549, 0, 1,
-1.94454, 1.139711, -0.5315161, 1, 0.145098, 0, 1,
-1.927771, 1.617712, -0.8075538, 1, 0.1490196, 0, 1,
-1.919178, -0.09123539, -1.610633, 1, 0.1568628, 0, 1,
-1.904556, -0.9110752, -0.2874447, 1, 0.1607843, 0, 1,
-1.903188, -0.1484411, -2.941375, 1, 0.1686275, 0, 1,
-1.900693, -0.0360374, -0.6160439, 1, 0.172549, 0, 1,
-1.893392, 0.04842504, -3.221843, 1, 0.1803922, 0, 1,
-1.888771, 0.665966, -0.2442284, 1, 0.1843137, 0, 1,
-1.882501, -1.835713, -2.328161, 1, 0.1921569, 0, 1,
-1.868817, 0.1065309, -1.785493, 1, 0.1960784, 0, 1,
-1.866106, -1.108358, -2.534071, 1, 0.2039216, 0, 1,
-1.85271, -0.542127, -0.299503, 1, 0.2117647, 0, 1,
-1.827181, -0.7556541, -2.015847, 1, 0.2156863, 0, 1,
-1.818982, 1.522927, -0.7128832, 1, 0.2235294, 0, 1,
-1.81223, -0.1738437, -1.944547, 1, 0.227451, 0, 1,
-1.811595, 0.5083638, -1.140506, 1, 0.2352941, 0, 1,
-1.79268, -0.006796249, -1.544828, 1, 0.2392157, 0, 1,
-1.764011, -1.140895, -4.688594, 1, 0.2470588, 0, 1,
-1.74357, 0.1202395, -2.032041, 1, 0.2509804, 0, 1,
-1.732323, 0.2631553, -1.865722, 1, 0.2588235, 0, 1,
-1.729852, -0.5078585, -1.940286, 1, 0.2627451, 0, 1,
-1.711216, -0.4910106, -2.423407, 1, 0.2705882, 0, 1,
-1.69213, -1.079054, -4.434875, 1, 0.2745098, 0, 1,
-1.676154, -2.378258, -1.917552, 1, 0.282353, 0, 1,
-1.674241, 0.07033299, -0.7313511, 1, 0.2862745, 0, 1,
-1.665838, 0.3396545, -1.792544, 1, 0.2941177, 0, 1,
-1.663986, 1.846163, 0.121735, 1, 0.3019608, 0, 1,
-1.591385, 0.3195764, -2.405762, 1, 0.3058824, 0, 1,
-1.587953, 2.022859, -1.109452, 1, 0.3137255, 0, 1,
-1.584678, 1.091761, -0.1222507, 1, 0.3176471, 0, 1,
-1.578498, -1.02461, -1.416145, 1, 0.3254902, 0, 1,
-1.569983, -0.3424897, -2.870806, 1, 0.3294118, 0, 1,
-1.564587, 0.5330328, -1.037051, 1, 0.3372549, 0, 1,
-1.545984, -0.5170787, -2.244668, 1, 0.3411765, 0, 1,
-1.541226, -0.5492449, -2.023993, 1, 0.3490196, 0, 1,
-1.538511, -0.3376373, -0.2864653, 1, 0.3529412, 0, 1,
-1.511572, 1.046836, -1.439882, 1, 0.3607843, 0, 1,
-1.50157, 0.6711841, -1.454515, 1, 0.3647059, 0, 1,
-1.500218, -0.357253, -2.919096, 1, 0.372549, 0, 1,
-1.4948, 0.5720593, 0.1193702, 1, 0.3764706, 0, 1,
-1.4944, 0.4333975, -2.880259, 1, 0.3843137, 0, 1,
-1.490499, 0.35493, -2.329492, 1, 0.3882353, 0, 1,
-1.487407, 1.623672, -3.163763, 1, 0.3960784, 0, 1,
-1.481985, -0.200769, -2.651818, 1, 0.4039216, 0, 1,
-1.47742, 0.003999622, -1.192924, 1, 0.4078431, 0, 1,
-1.473692, 1.618118, 0.01439373, 1, 0.4156863, 0, 1,
-1.472743, -0.2985099, -1.944031, 1, 0.4196078, 0, 1,
-1.468292, 0.3845824, -2.028178, 1, 0.427451, 0, 1,
-1.467955, 1.410978, -0.3784075, 1, 0.4313726, 0, 1,
-1.458186, 0.5455768, -0.6674985, 1, 0.4392157, 0, 1,
-1.440377, -0.7744484, -1.264716, 1, 0.4431373, 0, 1,
-1.421763, 0.3020965, -1.284225, 1, 0.4509804, 0, 1,
-1.421141, -1.13239, -2.438182, 1, 0.454902, 0, 1,
-1.413874, 2.080246, -0.963509, 1, 0.4627451, 0, 1,
-1.41085, 0.9944577, -1.991494, 1, 0.4666667, 0, 1,
-1.394674, 0.7870049, -2.201515, 1, 0.4745098, 0, 1,
-1.393985, -1.802897, -3.566158, 1, 0.4784314, 0, 1,
-1.375067, 0.6594034, 0.2828582, 1, 0.4862745, 0, 1,
-1.370315, 0.3806602, -1.038131, 1, 0.4901961, 0, 1,
-1.367283, -1.253986, -0.1119836, 1, 0.4980392, 0, 1,
-1.36337, 1.119442, -0.7005914, 1, 0.5058824, 0, 1,
-1.361336, 0.7139139, 0.2166073, 1, 0.509804, 0, 1,
-1.356493, -0.5159515, -1.528238, 1, 0.5176471, 0, 1,
-1.356257, -0.9090869, -2.61169, 1, 0.5215687, 0, 1,
-1.35202, -0.1338679, -0.9293593, 1, 0.5294118, 0, 1,
-1.348361, 0.5541314, -1.921592, 1, 0.5333334, 0, 1,
-1.340062, 1.51011, -1.211283, 1, 0.5411765, 0, 1,
-1.337368, 0.2822175, -2.048604, 1, 0.5450981, 0, 1,
-1.333114, 0.2003936, -0.5024053, 1, 0.5529412, 0, 1,
-1.312996, -0.3620602, -2.072402, 1, 0.5568628, 0, 1,
-1.308031, -1.148097, -3.670078, 1, 0.5647059, 0, 1,
-1.301475, 0.1746212, -2.391134, 1, 0.5686275, 0, 1,
-1.295943, 0.5052852, -2.111974, 1, 0.5764706, 0, 1,
-1.29308, -1.808038, -1.666155, 1, 0.5803922, 0, 1,
-1.291188, -0.3340214, -2.329389, 1, 0.5882353, 0, 1,
-1.281792, 0.007761578, -3.459843, 1, 0.5921569, 0, 1,
-1.278897, -0.1948135, -1.490866, 1, 0.6, 0, 1,
-1.270637, -0.4792727, -0.02146815, 1, 0.6078432, 0, 1,
-1.263868, -0.7460387, -3.274857, 1, 0.6117647, 0, 1,
-1.262708, -0.1070803, -1.99667, 1, 0.6196079, 0, 1,
-1.253209, -0.2633313, -2.146603, 1, 0.6235294, 0, 1,
-1.239924, -0.6364328, -1.447459, 1, 0.6313726, 0, 1,
-1.239097, -0.9329972, -3.960836, 1, 0.6352941, 0, 1,
-1.234195, -1.340377, -5.12892, 1, 0.6431373, 0, 1,
-1.228971, -1.354032, -3.682076, 1, 0.6470588, 0, 1,
-1.217815, 1.496929, -1.778123, 1, 0.654902, 0, 1,
-1.214637, 1.067774, -0.1659228, 1, 0.6588235, 0, 1,
-1.204867, 0.1125711, 0.5278812, 1, 0.6666667, 0, 1,
-1.204514, -1.000671, -2.909747, 1, 0.6705883, 0, 1,
-1.203923, -2.000278, -3.172997, 1, 0.6784314, 0, 1,
-1.194608, 0.8015927, -1.993657, 1, 0.682353, 0, 1,
-1.181127, 0.768267, -0.8202255, 1, 0.6901961, 0, 1,
-1.173646, 0.3199365, -0.4683259, 1, 0.6941177, 0, 1,
-1.16952, 1.073436, -0.1006149, 1, 0.7019608, 0, 1,
-1.161099, -1.265169, -3.243052, 1, 0.7098039, 0, 1,
-1.159531, -1.261962, -1.620718, 1, 0.7137255, 0, 1,
-1.15669, -0.08801968, -1.133558, 1, 0.7215686, 0, 1,
-1.152478, 1.684991, 0.4381328, 1, 0.7254902, 0, 1,
-1.151488, 0.5799782, -1.916224, 1, 0.7333333, 0, 1,
-1.137902, -0.7691707, -2.296132, 1, 0.7372549, 0, 1,
-1.136811, -0.6146112, -2.427934, 1, 0.7450981, 0, 1,
-1.132207, -0.133049, -3.099589, 1, 0.7490196, 0, 1,
-1.132186, 1.499437, 0.2404994, 1, 0.7568628, 0, 1,
-1.11119, -1.128999, -2.509625, 1, 0.7607843, 0, 1,
-1.105631, -0.5524827, -2.00099, 1, 0.7686275, 0, 1,
-1.103712, -0.6771188, -2.27872, 1, 0.772549, 0, 1,
-1.098937, -0.9829042, -1.478804, 1, 0.7803922, 0, 1,
-1.098262, 0.4193872, -1.140384, 1, 0.7843137, 0, 1,
-1.086185, -0.375212, -0.61527, 1, 0.7921569, 0, 1,
-1.083447, 1.844525, -0.27327, 1, 0.7960784, 0, 1,
-1.083156, -0.8593993, -2.484841, 1, 0.8039216, 0, 1,
-1.082672, 0.7502459, -1.051906, 1, 0.8117647, 0, 1,
-1.080843, -0.8692776, -1.898353, 1, 0.8156863, 0, 1,
-1.079076, -1.841061, -1.24907, 1, 0.8235294, 0, 1,
-1.068604, -0.7822446, -1.846091, 1, 0.827451, 0, 1,
-1.064322, 0.7839945, -0.3180274, 1, 0.8352941, 0, 1,
-1.062152, -0.2129137, -3.894784, 1, 0.8392157, 0, 1,
-1.059063, 0.1027204, -3.073339, 1, 0.8470588, 0, 1,
-1.053112, -2.163499, -3.848055, 1, 0.8509804, 0, 1,
-1.037021, 0.1854003, -1.000634, 1, 0.8588235, 0, 1,
-1.022687, 0.2180249, -3.567218, 1, 0.8627451, 0, 1,
-1.016456, 1.369548, 0.1604828, 1, 0.8705882, 0, 1,
-1.003253, 1.22004, -1.204112, 1, 0.8745098, 0, 1,
-0.9966536, 0.5587509, -0.07619508, 1, 0.8823529, 0, 1,
-0.9955928, -0.6028816, -1.272984, 1, 0.8862745, 0, 1,
-0.9950084, -0.08353316, -0.2397837, 1, 0.8941177, 0, 1,
-0.991425, 0.2114716, -0.4541488, 1, 0.8980392, 0, 1,
-0.9902329, -0.01573178, -0.5490912, 1, 0.9058824, 0, 1,
-0.9863278, -0.4907114, -1.524007, 1, 0.9137255, 0, 1,
-0.9850844, 0.5090235, -2.393388, 1, 0.9176471, 0, 1,
-0.9769059, 0.1438525, -2.551443, 1, 0.9254902, 0, 1,
-0.9736033, -0.6668056, -1.96841, 1, 0.9294118, 0, 1,
-0.9702551, -0.2772913, -1.2225, 1, 0.9372549, 0, 1,
-0.9678886, 0.19016, -0.4952136, 1, 0.9411765, 0, 1,
-0.9670182, -1.462194, -3.494556, 1, 0.9490196, 0, 1,
-0.9647114, 0.4624835, -1.882087, 1, 0.9529412, 0, 1,
-0.9467281, -1.12306, -2.323729, 1, 0.9607843, 0, 1,
-0.9427251, 0.5415761, -0.3654681, 1, 0.9647059, 0, 1,
-0.9353251, 0.31073, -0.6805188, 1, 0.972549, 0, 1,
-0.9328194, 1.007736, -2.936215, 1, 0.9764706, 0, 1,
-0.9314715, -1.62097, -2.332346, 1, 0.9843137, 0, 1,
-0.9303867, 0.8575033, 0.1444527, 1, 0.9882353, 0, 1,
-0.9300292, 0.5658109, -1.063769, 1, 0.9960784, 0, 1,
-0.9204425, -0.2287028, -2.511887, 0.9960784, 1, 0, 1,
-0.9116802, -0.349977, -2.970581, 0.9921569, 1, 0, 1,
-0.9080065, 0.5685439, -1.192151, 0.9843137, 1, 0, 1,
-0.9037676, 0.4829421, -1.898712, 0.9803922, 1, 0, 1,
-0.8938265, 1.304838, -0.2403229, 0.972549, 1, 0, 1,
-0.8933364, 0.4928955, 0.5727516, 0.9686275, 1, 0, 1,
-0.8904843, 0.4750874, -1.235181, 0.9607843, 1, 0, 1,
-0.8891055, -0.5196562, -2.81066, 0.9568627, 1, 0, 1,
-0.8880406, 0.1998974, 1.145525, 0.9490196, 1, 0, 1,
-0.8801657, -0.4913267, -0.193278, 0.945098, 1, 0, 1,
-0.8767532, -0.5085803, -3.493356, 0.9372549, 1, 0, 1,
-0.8643303, 0.1507961, -1.353887, 0.9333333, 1, 0, 1,
-0.8632163, -1.00371, -1.945677, 0.9254902, 1, 0, 1,
-0.8583136, 1.281966, -0.6208276, 0.9215686, 1, 0, 1,
-0.8503705, -0.6990924, -1.806138, 0.9137255, 1, 0, 1,
-0.8473816, 1.907793, -0.08479679, 0.9098039, 1, 0, 1,
-0.8426255, -0.5024142, -1.289928, 0.9019608, 1, 0, 1,
-0.8381202, -0.8509994, -2.333082, 0.8941177, 1, 0, 1,
-0.8343077, -0.6928685, -3.772524, 0.8901961, 1, 0, 1,
-0.8342901, -0.6131966, -3.630491, 0.8823529, 1, 0, 1,
-0.8340871, -1.431721, -3.787848, 0.8784314, 1, 0, 1,
-0.8329569, 1.945302, -0.167355, 0.8705882, 1, 0, 1,
-0.8197287, 1.333573, 0.570341, 0.8666667, 1, 0, 1,
-0.81175, -1.539507, -3.063963, 0.8588235, 1, 0, 1,
-0.8086702, 0.3300585, -1.436692, 0.854902, 1, 0, 1,
-0.808368, 1.247585, -2.275118, 0.8470588, 1, 0, 1,
-0.8016626, -0.7184349, -2.28122, 0.8431373, 1, 0, 1,
-0.7994229, -0.1581451, -1.631221, 0.8352941, 1, 0, 1,
-0.7983475, 0.2174439, 0.5192873, 0.8313726, 1, 0, 1,
-0.7946512, 0.7891344, -0.7763343, 0.8235294, 1, 0, 1,
-0.7870381, -0.3336276, 0.01784546, 0.8196079, 1, 0, 1,
-0.7823671, -0.3412891, -2.889847, 0.8117647, 1, 0, 1,
-0.7815038, 0.5503918, -2.094043, 0.8078431, 1, 0, 1,
-0.781248, -2.259631, -1.161244, 0.8, 1, 0, 1,
-0.7757177, -0.3100198, -2.622411, 0.7921569, 1, 0, 1,
-0.7673301, -1.743106, -2.936786, 0.7882353, 1, 0, 1,
-0.7652566, 1.039445, -0.05330441, 0.7803922, 1, 0, 1,
-0.7636918, 0.1544361, -0.7925386, 0.7764706, 1, 0, 1,
-0.7571871, -0.1582572, 0.8029741, 0.7686275, 1, 0, 1,
-0.7563791, 1.487437, -2.36577, 0.7647059, 1, 0, 1,
-0.7556257, 0.8038046, -0.9884858, 0.7568628, 1, 0, 1,
-0.7552832, -0.690034, -2.094393, 0.7529412, 1, 0, 1,
-0.753533, -0.7468864, -1.204933, 0.7450981, 1, 0, 1,
-0.7534715, 1.423841, -0.6302943, 0.7411765, 1, 0, 1,
-0.752916, -1.03039, -3.122289, 0.7333333, 1, 0, 1,
-0.7510158, -1.088374, -3.191131, 0.7294118, 1, 0, 1,
-0.7462726, 1.758132, -1.702663, 0.7215686, 1, 0, 1,
-0.7399167, -0.1472331, -3.887615, 0.7176471, 1, 0, 1,
-0.739523, -2.110565, -3.582231, 0.7098039, 1, 0, 1,
-0.7319618, -0.6199636, -1.950244, 0.7058824, 1, 0, 1,
-0.7216983, 0.1332957, -0.9080368, 0.6980392, 1, 0, 1,
-0.7178618, -1.198571, -2.903059, 0.6901961, 1, 0, 1,
-0.7017133, 1.406395, 1.324835, 0.6862745, 1, 0, 1,
-0.6963032, 0.0261805, -0.743672, 0.6784314, 1, 0, 1,
-0.681877, 1.441256, 2.467, 0.6745098, 1, 0, 1,
-0.6747754, 0.2458662, -1.475208, 0.6666667, 1, 0, 1,
-0.6723393, 1.88126, 0.5549656, 0.6627451, 1, 0, 1,
-0.6673578, 0.1495671, -0.9071358, 0.654902, 1, 0, 1,
-0.6634723, 0.4554739, -1.132061, 0.6509804, 1, 0, 1,
-0.6610271, -1.159507, -3.919637, 0.6431373, 1, 0, 1,
-0.6593479, 1.532632, 0.004570642, 0.6392157, 1, 0, 1,
-0.6580319, -0.9728476, -2.220813, 0.6313726, 1, 0, 1,
-0.6561602, -0.4019856, -3.577705, 0.627451, 1, 0, 1,
-0.652097, 1.625504, -0.5328298, 0.6196079, 1, 0, 1,
-0.6515618, -1.047716, -1.777234, 0.6156863, 1, 0, 1,
-0.6497256, 0.7038068, -2.590058, 0.6078432, 1, 0, 1,
-0.6371202, -2.649413, -2.878346, 0.6039216, 1, 0, 1,
-0.6357411, -1.815157, -2.883744, 0.5960785, 1, 0, 1,
-0.6333964, 0.01881348, -3.96691, 0.5882353, 1, 0, 1,
-0.6246218, -0.2772371, -2.240381, 0.5843138, 1, 0, 1,
-0.6242198, 1.581316, -1.057822, 0.5764706, 1, 0, 1,
-0.6229854, -0.8282904, -1.791355, 0.572549, 1, 0, 1,
-0.6215595, -2.107218, -2.394266, 0.5647059, 1, 0, 1,
-0.6176985, -1.776757, -4.151733, 0.5607843, 1, 0, 1,
-0.617027, -0.3995043, -2.707796, 0.5529412, 1, 0, 1,
-0.6161696, 0.4768189, -1.383379, 0.5490196, 1, 0, 1,
-0.6070219, -0.4222374, -2.033095, 0.5411765, 1, 0, 1,
-0.6066302, -2.014704, -3.448734, 0.5372549, 1, 0, 1,
-0.6035229, -0.1888604, -2.214114, 0.5294118, 1, 0, 1,
-0.6020842, -0.01256622, -1.724948, 0.5254902, 1, 0, 1,
-0.5931616, 1.138955, -0.7863651, 0.5176471, 1, 0, 1,
-0.5904311, -0.004620587, -2.948696, 0.5137255, 1, 0, 1,
-0.589113, 1.175511, -1.105471, 0.5058824, 1, 0, 1,
-0.5884424, -2.074692, -3.124237, 0.5019608, 1, 0, 1,
-0.5876203, -0.4085861, -0.4142992, 0.4941176, 1, 0, 1,
-0.5860161, 2.274517, 0.6917634, 0.4862745, 1, 0, 1,
-0.579281, -0.5388573, -3.019944, 0.4823529, 1, 0, 1,
-0.5760933, -0.7463575, -2.915145, 0.4745098, 1, 0, 1,
-0.5720398, 1.377223, -0.8540174, 0.4705882, 1, 0, 1,
-0.5557763, -0.4982701, -2.174438, 0.4627451, 1, 0, 1,
-0.5556876, 1.963158, -0.2071167, 0.4588235, 1, 0, 1,
-0.5553897, -0.1123638, -1.28694, 0.4509804, 1, 0, 1,
-0.5552306, -0.3393665, -2.770792, 0.4470588, 1, 0, 1,
-0.5514732, 0.537748, -0.9534344, 0.4392157, 1, 0, 1,
-0.5462761, -0.3035482, -2.283158, 0.4352941, 1, 0, 1,
-0.5451555, -0.4114554, -1.97182, 0.427451, 1, 0, 1,
-0.5442499, -0.7944464, -2.318609, 0.4235294, 1, 0, 1,
-0.5418634, -0.5459951, -1.830371, 0.4156863, 1, 0, 1,
-0.5417799, 1.68664, -0.7342766, 0.4117647, 1, 0, 1,
-0.5409006, 0.9196891, -0.2757364, 0.4039216, 1, 0, 1,
-0.5398791, 0.6343891, -0.4060055, 0.3960784, 1, 0, 1,
-0.5365633, 0.7189243, -1.15214, 0.3921569, 1, 0, 1,
-0.5279104, 0.5824375, -0.2487361, 0.3843137, 1, 0, 1,
-0.5110573, 0.1104809, -3.112302, 0.3803922, 1, 0, 1,
-0.5105677, 0.2976303, -1.204799, 0.372549, 1, 0, 1,
-0.5089523, -1.905937, -3.222606, 0.3686275, 1, 0, 1,
-0.5073327, 0.5279465, -1.701768, 0.3607843, 1, 0, 1,
-0.5069814, 0.9179491, 0.4893283, 0.3568628, 1, 0, 1,
-0.5035338, -2.191795, -4.105022, 0.3490196, 1, 0, 1,
-0.5033095, -0.7571573, -0.7237154, 0.345098, 1, 0, 1,
-0.5029972, -0.2263666, -1.173745, 0.3372549, 1, 0, 1,
-0.49782, 0.05964916, -1.619537, 0.3333333, 1, 0, 1,
-0.494061, 0.8529832, -0.8940212, 0.3254902, 1, 0, 1,
-0.4911077, 0.8362977, -0.3231121, 0.3215686, 1, 0, 1,
-0.4878055, -0.4685217, -4.333968, 0.3137255, 1, 0, 1,
-0.4866784, -0.9588681, -2.991414, 0.3098039, 1, 0, 1,
-0.4855205, -1.862876, -3.3282, 0.3019608, 1, 0, 1,
-0.4824733, -0.4051104, -1.447995, 0.2941177, 1, 0, 1,
-0.4777782, 0.1959577, -0.6463953, 0.2901961, 1, 0, 1,
-0.4767004, 0.8279015, -0.7826868, 0.282353, 1, 0, 1,
-0.4734808, 1.736368, 1.534696, 0.2784314, 1, 0, 1,
-0.4709271, -0.7576025, 0.07308006, 0.2705882, 1, 0, 1,
-0.4684091, -0.5431666, -1.775087, 0.2666667, 1, 0, 1,
-0.4668312, 1.333637, -1.11918, 0.2588235, 1, 0, 1,
-0.4612964, 2.548227, -2.77227, 0.254902, 1, 0, 1,
-0.459593, 0.3010941, -0.9895224, 0.2470588, 1, 0, 1,
-0.4565728, -0.6090385, -1.770287, 0.2431373, 1, 0, 1,
-0.453721, 0.009989772, -1.204388, 0.2352941, 1, 0, 1,
-0.4532241, -1.139096, -3.409115, 0.2313726, 1, 0, 1,
-0.453015, -1.224278, -3.85027, 0.2235294, 1, 0, 1,
-0.4522468, -0.8040482, -1.993683, 0.2196078, 1, 0, 1,
-0.4490562, -0.8981161, -2.923695, 0.2117647, 1, 0, 1,
-0.445889, 1.768806, 0.08508708, 0.2078431, 1, 0, 1,
-0.4455409, 0.05914695, -2.305098, 0.2, 1, 0, 1,
-0.4415968, -0.6702997, -4.817204, 0.1921569, 1, 0, 1,
-0.4386794, 1.088034, -1.590702, 0.1882353, 1, 0, 1,
-0.4375274, 1.251972, -0.2606239, 0.1803922, 1, 0, 1,
-0.4374612, 0.3279011, -0.8515357, 0.1764706, 1, 0, 1,
-0.4336944, 0.6598176, 0.4661312, 0.1686275, 1, 0, 1,
-0.4298276, -0.3561206, -1.635736, 0.1647059, 1, 0, 1,
-0.4295506, 0.5369111, 0.9193365, 0.1568628, 1, 0, 1,
-0.4236186, 0.4450947, -0.1864965, 0.1529412, 1, 0, 1,
-0.4228306, -1.317333, -4.00086, 0.145098, 1, 0, 1,
-0.4225942, 0.2929446, -0.5310045, 0.1411765, 1, 0, 1,
-0.4222952, 0.930036, -1.157744, 0.1333333, 1, 0, 1,
-0.418795, 0.5533504, -0.08554374, 0.1294118, 1, 0, 1,
-0.4152163, 1.580395, -1.079286, 0.1215686, 1, 0, 1,
-0.4151709, -1.225726, -3.350356, 0.1176471, 1, 0, 1,
-0.4144953, 0.394338, -0.5927501, 0.1098039, 1, 0, 1,
-0.4137917, -0.1301966, -1.742889, 0.1058824, 1, 0, 1,
-0.4125096, -2.12322, -3.10404, 0.09803922, 1, 0, 1,
-0.4117481, 0.961002, -0.3516057, 0.09019608, 1, 0, 1,
-0.4108444, -1.00656, -1.82591, 0.08627451, 1, 0, 1,
-0.4049091, -0.281378, -2.689715, 0.07843138, 1, 0, 1,
-0.4019269, -0.3866007, -1.178946, 0.07450981, 1, 0, 1,
-0.4004939, -0.5550446, -1.748705, 0.06666667, 1, 0, 1,
-0.3987417, 1.738404, -1.754678, 0.0627451, 1, 0, 1,
-0.3939476, -0.3568215, -2.150058, 0.05490196, 1, 0, 1,
-0.3922542, -1.331995, -2.947987, 0.05098039, 1, 0, 1,
-0.386098, 0.2433639, -0.09126554, 0.04313726, 1, 0, 1,
-0.3847638, 0.4877263, -0.4626851, 0.03921569, 1, 0, 1,
-0.3847439, 0.2173743, -2.38696, 0.03137255, 1, 0, 1,
-0.3835514, -0.4299046, -1.447842, 0.02745098, 1, 0, 1,
-0.3824435, 0.8952452, 0.1293209, 0.01960784, 1, 0, 1,
-0.3815463, 0.9981592, -1.108086, 0.01568628, 1, 0, 1,
-0.3798982, -0.0610178, -1.991651, 0.007843138, 1, 0, 1,
-0.3750834, 1.069242, -0.7027479, 0.003921569, 1, 0, 1,
-0.370991, 0.5754204, 0.797213, 0, 1, 0.003921569, 1,
-0.3690133, -1.319177, -2.664803, 0, 1, 0.01176471, 1,
-0.3666542, -0.5686753, -3.503647, 0, 1, 0.01568628, 1,
-0.3642187, -1.297776, -1.667228, 0, 1, 0.02352941, 1,
-0.3636481, -0.6130955, 0.4137309, 0, 1, 0.02745098, 1,
-0.363522, 0.5492338, -1.105957, 0, 1, 0.03529412, 1,
-0.3614069, -0.4005511, -1.323414, 0, 1, 0.03921569, 1,
-0.3603805, -2.052778, -3.271948, 0, 1, 0.04705882, 1,
-0.3598014, 0.2046881, -1.296009, 0, 1, 0.05098039, 1,
-0.3482817, -0.2985804, -1.53283, 0, 1, 0.05882353, 1,
-0.3479046, 0.9615897, 1.025894, 0, 1, 0.0627451, 1,
-0.3390757, -0.5109379, -2.426315, 0, 1, 0.07058824, 1,
-0.3384382, 0.6639751, 1.071917, 0, 1, 0.07450981, 1,
-0.3376339, -1.064681, -2.158863, 0, 1, 0.08235294, 1,
-0.3375646, 1.039675, -1.3501, 0, 1, 0.08627451, 1,
-0.3348131, 0.3986683, -0.1956354, 0, 1, 0.09411765, 1,
-0.3279531, 0.556905, -0.3925987, 0, 1, 0.1019608, 1,
-0.3270781, -0.9869249, -3.188204, 0, 1, 0.1058824, 1,
-0.3253911, 1.588074, -0.4490275, 0, 1, 0.1137255, 1,
-0.3251787, -1.096025, -2.493338, 0, 1, 0.1176471, 1,
-0.3238064, -0.9923953, -2.872382, 0, 1, 0.1254902, 1,
-0.3224356, -0.02195866, -0.1725333, 0, 1, 0.1294118, 1,
-0.3208537, -0.3742458, -4.332842, 0, 1, 0.1372549, 1,
-0.320015, -1.253429, -3.406514, 0, 1, 0.1411765, 1,
-0.3199586, 1.417862, -0.9694102, 0, 1, 0.1490196, 1,
-0.3050295, -0.8867736, -1.35643, 0, 1, 0.1529412, 1,
-0.3024587, -0.1924028, 0.0776993, 0, 1, 0.1607843, 1,
-0.3017442, -0.1352978, -1.593515, 0, 1, 0.1647059, 1,
-0.3000446, 0.8913515, -0.9464098, 0, 1, 0.172549, 1,
-0.2999134, -1.319445, -3.321222, 0, 1, 0.1764706, 1,
-0.2932295, -0.5045431, -2.989338, 0, 1, 0.1843137, 1,
-0.2876881, -0.02890184, -2.828513, 0, 1, 0.1882353, 1,
-0.2861434, 1.072303, 0.4633296, 0, 1, 0.1960784, 1,
-0.2856616, -1.061706, -2.910836, 0, 1, 0.2039216, 1,
-0.2825493, -2.737549, -3.824948, 0, 1, 0.2078431, 1,
-0.2822933, 1.023723, 1.199855, 0, 1, 0.2156863, 1,
-0.2818826, -0.2677398, -0.8394484, 0, 1, 0.2196078, 1,
-0.2780761, -0.5624657, -1.486576, 0, 1, 0.227451, 1,
-0.2738799, 0.1018049, -1.974005, 0, 1, 0.2313726, 1,
-0.2723029, 0.1624653, -0.5918658, 0, 1, 0.2392157, 1,
-0.2721883, -0.2733909, -2.874853, 0, 1, 0.2431373, 1,
-0.2699162, -0.4826172, -1.868893, 0, 1, 0.2509804, 1,
-0.2690701, 0.2536297, -0.6582333, 0, 1, 0.254902, 1,
-0.2682617, -0.8691669, -0.8267214, 0, 1, 0.2627451, 1,
-0.2608382, -0.2800509, -2.265816, 0, 1, 0.2666667, 1,
-0.25849, -1.194677, -2.464599, 0, 1, 0.2745098, 1,
-0.2538528, -0.9771017, -4.871074, 0, 1, 0.2784314, 1,
-0.2536521, -0.4073176, -2.252883, 0, 1, 0.2862745, 1,
-0.250882, 0.5717017, 0.3231333, 0, 1, 0.2901961, 1,
-0.2436667, -0.5477322, -4.978847, 0, 1, 0.2980392, 1,
-0.2434626, 0.3698183, 0.004249808, 0, 1, 0.3058824, 1,
-0.2428376, -0.6054026, -3.164299, 0, 1, 0.3098039, 1,
-0.2394908, 1.410747, -0.109158, 0, 1, 0.3176471, 1,
-0.2389325, -0.1081471, -2.620439, 0, 1, 0.3215686, 1,
-0.2357994, -0.4695416, -3.247534, 0, 1, 0.3294118, 1,
-0.2324194, -0.5854374, -2.632091, 0, 1, 0.3333333, 1,
-0.2237255, -0.2921948, -2.824233, 0, 1, 0.3411765, 1,
-0.221476, -1.43504, -1.823126, 0, 1, 0.345098, 1,
-0.2211007, -0.3703578, -0.7126054, 0, 1, 0.3529412, 1,
-0.220255, -2.006224, -2.964129, 0, 1, 0.3568628, 1,
-0.2180819, 0.6545019, -0.4199034, 0, 1, 0.3647059, 1,
-0.2176156, -1.046046, -2.282941, 0, 1, 0.3686275, 1,
-0.217373, 0.3568105, 0.06006658, 0, 1, 0.3764706, 1,
-0.2173502, 1.623739, 0.3070848, 0, 1, 0.3803922, 1,
-0.2167273, -0.5854991, -2.934486, 0, 1, 0.3882353, 1,
-0.2165903, -2.668133, -4.302734, 0, 1, 0.3921569, 1,
-0.2163447, -0.4696157, -1.106417, 0, 1, 0.4, 1,
-0.2152322, 1.012734, -2.690369, 0, 1, 0.4078431, 1,
-0.2135908, -0.423167, -0.5828066, 0, 1, 0.4117647, 1,
-0.2115643, 0.9724271, -0.2346307, 0, 1, 0.4196078, 1,
-0.2108788, 1.740018, 0.1863701, 0, 1, 0.4235294, 1,
-0.2086508, -0.654218, -3.597541, 0, 1, 0.4313726, 1,
-0.2086406, 0.2329163, -2.026894, 0, 1, 0.4352941, 1,
-0.2068838, -0.8528039, -4.010611, 0, 1, 0.4431373, 1,
-0.205291, -0.1124203, -3.359213, 0, 1, 0.4470588, 1,
-0.2019762, 0.5034813, -1.349342, 0, 1, 0.454902, 1,
-0.199054, 0.8244836, 0.8802266, 0, 1, 0.4588235, 1,
-0.1972047, 0.4112256, -0.365506, 0, 1, 0.4666667, 1,
-0.1932281, -0.7041705, -3.431152, 0, 1, 0.4705882, 1,
-0.1915123, -0.9400244, -2.518486, 0, 1, 0.4784314, 1,
-0.1894552, -0.3020879, -1.106965, 0, 1, 0.4823529, 1,
-0.1882749, 0.281128, 0.1001208, 0, 1, 0.4901961, 1,
-0.185931, -2.015947, -2.832, 0, 1, 0.4941176, 1,
-0.1824387, -0.4887097, -5.380451, 0, 1, 0.5019608, 1,
-0.1810505, 1.667447, 0.2667335, 0, 1, 0.509804, 1,
-0.1737574, -0.9725546, -1.059968, 0, 1, 0.5137255, 1,
-0.1732605, 0.2552905, 0.6781248, 0, 1, 0.5215687, 1,
-0.1717718, -0.188027, -2.350909, 0, 1, 0.5254902, 1,
-0.1681075, 0.6707144, -1.74448, 0, 1, 0.5333334, 1,
-0.1677661, -0.4179588, -2.035729, 0, 1, 0.5372549, 1,
-0.1667314, 0.3661812, -0.5021705, 0, 1, 0.5450981, 1,
-0.1662636, -0.2226405, -2.608293, 0, 1, 0.5490196, 1,
-0.1637678, 0.5710553, -0.4169051, 0, 1, 0.5568628, 1,
-0.1594786, 2.258767, 0.3430961, 0, 1, 0.5607843, 1,
-0.1584083, -0.9802441, -3.011876, 0, 1, 0.5686275, 1,
-0.154527, -0.1373152, -2.825856, 0, 1, 0.572549, 1,
-0.1534362, -0.9817631, -2.852089, 0, 1, 0.5803922, 1,
-0.1522842, -0.923584, -3.443477, 0, 1, 0.5843138, 1,
-0.148958, -0.6542466, -3.970526, 0, 1, 0.5921569, 1,
-0.1457293, 0.7948093, 0.2012319, 0, 1, 0.5960785, 1,
-0.1416913, -0.8618382, -2.94993, 0, 1, 0.6039216, 1,
-0.136704, -0.1701495, -0.779166, 0, 1, 0.6117647, 1,
-0.1355921, 2.220111, 0.6783614, 0, 1, 0.6156863, 1,
-0.1336891, 0.794183, 1.147234, 0, 1, 0.6235294, 1,
-0.1330977, -0.4939036, -3.417098, 0, 1, 0.627451, 1,
-0.1309298, 0.518564, -0.6184786, 0, 1, 0.6352941, 1,
-0.1296741, -0.4577455, -2.956318, 0, 1, 0.6392157, 1,
-0.1292993, -1.578667, -2.336921, 0, 1, 0.6470588, 1,
-0.1273286, 0.183212, -0.01856037, 0, 1, 0.6509804, 1,
-0.1249626, 0.7178057, 0.1470786, 0, 1, 0.6588235, 1,
-0.1207068, -0.001336268, -3.176852, 0, 1, 0.6627451, 1,
-0.1203541, 1.944745, 0.2271509, 0, 1, 0.6705883, 1,
-0.1153013, 0.356638, -0.9054033, 0, 1, 0.6745098, 1,
-0.1148318, 0.5232097, 0.4353116, 0, 1, 0.682353, 1,
-0.1115624, 0.8016054, -0.4140168, 0, 1, 0.6862745, 1,
-0.1106807, -0.6195937, -1.74527, 0, 1, 0.6941177, 1,
-0.1106408, -1.007322, -2.933334, 0, 1, 0.7019608, 1,
-0.1093838, -0.7083327, -3.348852, 0, 1, 0.7058824, 1,
-0.1087718, -0.9971675, -4.169915, 0, 1, 0.7137255, 1,
-0.1080258, 0.6516328, -2.420427, 0, 1, 0.7176471, 1,
-0.1076131, -0.7518687, -3.086609, 0, 1, 0.7254902, 1,
-0.1069299, 0.2914294, -0.8585769, 0, 1, 0.7294118, 1,
-0.1066036, -0.2646073, -3.506086, 0, 1, 0.7372549, 1,
-0.1033815, 1.508643, 0.356687, 0, 1, 0.7411765, 1,
-0.1028557, 0.1013614, -1.742294, 0, 1, 0.7490196, 1,
-0.08613683, -1.460168, -2.425447, 0, 1, 0.7529412, 1,
-0.08463233, -1.112732, -4.743483, 0, 1, 0.7607843, 1,
-0.08189775, -0.9854605, -4.633807, 0, 1, 0.7647059, 1,
-0.08163623, -0.6910431, -1.254685, 0, 1, 0.772549, 1,
-0.07702929, 0.646345, 0.3042124, 0, 1, 0.7764706, 1,
-0.07262125, -0.4273814, -3.735246, 0, 1, 0.7843137, 1,
-0.0674755, -0.272002, -1.112221, 0, 1, 0.7882353, 1,
-0.06639839, 0.0264479, -0.8961294, 0, 1, 0.7960784, 1,
-0.0642853, -1.259474, -1.71832, 0, 1, 0.8039216, 1,
-0.06083828, 0.9301695, 1.359619, 0, 1, 0.8078431, 1,
-0.06032399, 0.994646, 0.06857537, 0, 1, 0.8156863, 1,
-0.0574476, -0.7495721, -3.198149, 0, 1, 0.8196079, 1,
-0.05566534, -0.5842465, -2.737598, 0, 1, 0.827451, 1,
-0.05472799, 1.647609, 0.1663258, 0, 1, 0.8313726, 1,
-0.05439168, -0.6014944, -1.90562, 0, 1, 0.8392157, 1,
-0.05094348, 0.4087882, -2.17811, 0, 1, 0.8431373, 1,
-0.04966713, 1.579267, 0.9309397, 0, 1, 0.8509804, 1,
-0.04896316, -0.4189214, -3.711515, 0, 1, 0.854902, 1,
-0.04604193, -1.547499, -3.028909, 0, 1, 0.8627451, 1,
-0.04323742, 0.6634538, 0.9957732, 0, 1, 0.8666667, 1,
-0.04082269, 0.147196, -0.6610606, 0, 1, 0.8745098, 1,
-0.03760458, 0.7346442, 0.9742607, 0, 1, 0.8784314, 1,
-0.03221316, -0.02206087, -1.719729, 0, 1, 0.8862745, 1,
-0.02768193, -1.034205, -3.657124, 0, 1, 0.8901961, 1,
-0.02745013, -0.2280229, -2.77783, 0, 1, 0.8980392, 1,
-0.02619366, -1.128425, -3.480147, 0, 1, 0.9058824, 1,
-0.02553093, -0.7508957, -1.954349, 0, 1, 0.9098039, 1,
-0.02078819, 0.2698475, -1.303565, 0, 1, 0.9176471, 1,
-0.02000642, 0.1290521, 0.5755132, 0, 1, 0.9215686, 1,
-0.01765368, -0.4437797, -3.529558, 0, 1, 0.9294118, 1,
-0.01761888, 0.06931205, 0.7733444, 0, 1, 0.9333333, 1,
-0.01723978, -0.935138, -2.317682, 0, 1, 0.9411765, 1,
-0.01446482, 0.7663409, 0.08504035, 0, 1, 0.945098, 1,
-0.01335201, 1.120121, -1.085895, 0, 1, 0.9529412, 1,
-0.008477882, -0.4580528, -1.790275, 0, 1, 0.9568627, 1,
-0.004298382, -0.163033, -3.225811, 0, 1, 0.9647059, 1,
0.0005039683, 0.4114894, 1.634449, 0, 1, 0.9686275, 1,
0.002804231, -0.5404368, 3.670199, 0, 1, 0.9764706, 1,
0.00535095, -1.033523, 3.111134, 0, 1, 0.9803922, 1,
0.009678328, -0.05085936, 3.815358, 0, 1, 0.9882353, 1,
0.01081785, 0.9118647, 0.08536676, 0, 1, 0.9921569, 1,
0.01209743, 0.6582688, 0.4205651, 0, 1, 1, 1,
0.01356649, -0.3028288, 3.562557, 0, 0.9921569, 1, 1,
0.01717933, -0.1058862, 2.449647, 0, 0.9882353, 1, 1,
0.01830136, 0.1571989, 0.1372506, 0, 0.9803922, 1, 1,
0.02232116, -0.1811076, 2.682431, 0, 0.9764706, 1, 1,
0.02314402, -0.6690677, 4.034957, 0, 0.9686275, 1, 1,
0.02446999, 0.8367966, -0.7352462, 0, 0.9647059, 1, 1,
0.02481584, -0.3737484, 3.132176, 0, 0.9568627, 1, 1,
0.03327858, 0.6166559, -0.4318922, 0, 0.9529412, 1, 1,
0.03923641, -1.009466, 4.157178, 0, 0.945098, 1, 1,
0.04239829, 0.5971341, 1.956152, 0, 0.9411765, 1, 1,
0.04341912, 1.713825, 0.9159643, 0, 0.9333333, 1, 1,
0.04544934, -0.7354438, 0.8336214, 0, 0.9294118, 1, 1,
0.05147224, -1.980028, 3.951737, 0, 0.9215686, 1, 1,
0.05445063, 0.3606253, -0.2235453, 0, 0.9176471, 1, 1,
0.06643498, -0.1279947, 3.912072, 0, 0.9098039, 1, 1,
0.06791073, -1.062173, 4.123943, 0, 0.9058824, 1, 1,
0.07217853, 0.4370049, -1.135523, 0, 0.8980392, 1, 1,
0.07291547, 0.3709247, 1.286171, 0, 0.8901961, 1, 1,
0.07437724, -0.3056988, 4.73381, 0, 0.8862745, 1, 1,
0.07788274, 0.7871692, 0.9890732, 0, 0.8784314, 1, 1,
0.08203466, -0.2762175, 3.036005, 0, 0.8745098, 1, 1,
0.0855846, 0.3381377, 1.268297, 0, 0.8666667, 1, 1,
0.08848177, -0.3782558, 3.547747, 0, 0.8627451, 1, 1,
0.09058103, -0.5396913, 3.618757, 0, 0.854902, 1, 1,
0.09246834, 0.005317954, 2.401346, 0, 0.8509804, 1, 1,
0.09662914, -0.8675619, 2.682582, 0, 0.8431373, 1, 1,
0.09756611, 1.071246, 0.1754451, 0, 0.8392157, 1, 1,
0.1046191, -0.7704288, 3.15636, 0, 0.8313726, 1, 1,
0.1053121, -0.4032988, 1.450474, 0, 0.827451, 1, 1,
0.1053297, -0.84299, 0.7481611, 0, 0.8196079, 1, 1,
0.106244, -0.898036, 2.809571, 0, 0.8156863, 1, 1,
0.111556, 0.2939953, 1.180922, 0, 0.8078431, 1, 1,
0.1128659, 0.9294232, 0.763272, 0, 0.8039216, 1, 1,
0.1136984, 0.4805846, 0.5768188, 0, 0.7960784, 1, 1,
0.114575, -1.49533, 2.971098, 0, 0.7882353, 1, 1,
0.1170687, 0.7436935, -0.342636, 0, 0.7843137, 1, 1,
0.1176998, -0.3994021, 4.074788, 0, 0.7764706, 1, 1,
0.1218783, -0.3585275, 3.917711, 0, 0.772549, 1, 1,
0.1270537, -0.09493242, 1.889572, 0, 0.7647059, 1, 1,
0.1308001, -1.026843, 2.734687, 0, 0.7607843, 1, 1,
0.133191, 0.03897109, 0.8049934, 0, 0.7529412, 1, 1,
0.134515, -1.590498, 2.73666, 0, 0.7490196, 1, 1,
0.1346162, -1.352973, 2.682864, 0, 0.7411765, 1, 1,
0.136992, -1.316452, 1.703439, 0, 0.7372549, 1, 1,
0.1396402, -1.200765, 2.890101, 0, 0.7294118, 1, 1,
0.1453228, 0.5429963, 0.8338518, 0, 0.7254902, 1, 1,
0.1469058, -0.2247447, 1.937413, 0, 0.7176471, 1, 1,
0.1509309, -1.54881, 3.858804, 0, 0.7137255, 1, 1,
0.1532034, -1.125956, 2.861701, 0, 0.7058824, 1, 1,
0.1561462, 0.5750452, 1.009695, 0, 0.6980392, 1, 1,
0.1575741, -0.4856266, 1.757476, 0, 0.6941177, 1, 1,
0.1590652, -1.51698, 3.555274, 0, 0.6862745, 1, 1,
0.1594726, -1.037777, 3.579969, 0, 0.682353, 1, 1,
0.1644674, -0.1615692, 3.041145, 0, 0.6745098, 1, 1,
0.1664358, -0.8027726, 2.637554, 0, 0.6705883, 1, 1,
0.1683998, 0.6896658, -0.8581775, 0, 0.6627451, 1, 1,
0.1687012, -0.174754, 2.893106, 0, 0.6588235, 1, 1,
0.1710511, -1.803445, 3.016465, 0, 0.6509804, 1, 1,
0.1716607, 1.660986, -0.09411579, 0, 0.6470588, 1, 1,
0.171678, 0.6106603, 1.753537, 0, 0.6392157, 1, 1,
0.1719842, -1.017321, 4.395875, 0, 0.6352941, 1, 1,
0.175126, -0.9996722, 2.839581, 0, 0.627451, 1, 1,
0.1820219, 0.3473523, 0.6356222, 0, 0.6235294, 1, 1,
0.1836652, -0.1720067, 4.694957, 0, 0.6156863, 1, 1,
0.1910682, 0.4344025, 1.901046, 0, 0.6117647, 1, 1,
0.1917621, 0.9172932, 0.9483719, 0, 0.6039216, 1, 1,
0.1944164, 0.04754368, 0.7759287, 0, 0.5960785, 1, 1,
0.1946935, 0.495668, 0.8973802, 0, 0.5921569, 1, 1,
0.1989856, 1.220372, -1.151546, 0, 0.5843138, 1, 1,
0.2040004, 0.2152774, 1.755476, 0, 0.5803922, 1, 1,
0.2044939, 0.5253535, 1.810493, 0, 0.572549, 1, 1,
0.2047744, 1.021864, -0.3903375, 0, 0.5686275, 1, 1,
0.207565, -1.612323, 1.108802, 0, 0.5607843, 1, 1,
0.2077065, -0.1603945, 2.883817, 0, 0.5568628, 1, 1,
0.2081352, -1.231057, 4.320103, 0, 0.5490196, 1, 1,
0.208666, -0.04655291, 1.161105, 0, 0.5450981, 1, 1,
0.212229, -1.366702, 3.684267, 0, 0.5372549, 1, 1,
0.2126304, -0.5516006, 2.992325, 0, 0.5333334, 1, 1,
0.2136987, -0.3704337, 2.965924, 0, 0.5254902, 1, 1,
0.2153338, -1.606658, 3.10891, 0, 0.5215687, 1, 1,
0.2159874, -0.4368127, 1.167483, 0, 0.5137255, 1, 1,
0.219154, -0.9935658, 2.70208, 0, 0.509804, 1, 1,
0.2201438, -0.9784625, 3.093631, 0, 0.5019608, 1, 1,
0.221924, -0.5871388, 3.041157, 0, 0.4941176, 1, 1,
0.226802, 1.086915, -0.7792191, 0, 0.4901961, 1, 1,
0.2355837, 0.6374521, 0.6082285, 0, 0.4823529, 1, 1,
0.2360069, -0.3656373, 2.342291, 0, 0.4784314, 1, 1,
0.238895, -0.4144687, 3.134158, 0, 0.4705882, 1, 1,
0.2475246, -0.6591078, 3.730325, 0, 0.4666667, 1, 1,
0.2483755, -0.7642682, 3.180607, 0, 0.4588235, 1, 1,
0.2544291, -1.236104, 2.98538, 0, 0.454902, 1, 1,
0.2601742, -0.6982355, 2.376795, 0, 0.4470588, 1, 1,
0.2616146, 0.4676664, 0.6870441, 0, 0.4431373, 1, 1,
0.2647164, 0.6265819, 1.658923, 0, 0.4352941, 1, 1,
0.2662918, 0.09321931, 1.726172, 0, 0.4313726, 1, 1,
0.2669598, 1.756862, 0.4768931, 0, 0.4235294, 1, 1,
0.2684022, -0.4240501, 1.069643, 0, 0.4196078, 1, 1,
0.2756849, 0.8682849, 1.940985, 0, 0.4117647, 1, 1,
0.2801213, 1.170486, -0.4388331, 0, 0.4078431, 1, 1,
0.2805169, 0.8867139, 0.8466935, 0, 0.4, 1, 1,
0.2834711, -1.463512, 1.613476, 0, 0.3921569, 1, 1,
0.2840871, 0.2171237, 2.622522, 0, 0.3882353, 1, 1,
0.2896857, 0.928975, -0.7760602, 0, 0.3803922, 1, 1,
0.2902573, 0.5543346, 0.7052931, 0, 0.3764706, 1, 1,
0.2920095, 2.339542, 1.976901, 0, 0.3686275, 1, 1,
0.2965162, -0.6523548, 2.256332, 0, 0.3647059, 1, 1,
0.3009413, 1.508506, 0.154961, 0, 0.3568628, 1, 1,
0.303004, 0.2433232, 0.6522961, 0, 0.3529412, 1, 1,
0.3062127, -0.7405327, 2.035471, 0, 0.345098, 1, 1,
0.3082745, 1.567428, 1.046784, 0, 0.3411765, 1, 1,
0.3094044, -1.774205, 3.829231, 0, 0.3333333, 1, 1,
0.3116848, 2.242349, 0.733061, 0, 0.3294118, 1, 1,
0.316027, -0.322933, 3.801486, 0, 0.3215686, 1, 1,
0.3172231, -1.401778, 1.174499, 0, 0.3176471, 1, 1,
0.3207931, 0.1620798, 2.084352, 0, 0.3098039, 1, 1,
0.3216465, -2.65903, 1.566365, 0, 0.3058824, 1, 1,
0.3258405, 0.8975549, 0.5386633, 0, 0.2980392, 1, 1,
0.326162, 0.8882727, -1.35977, 0, 0.2901961, 1, 1,
0.3267563, 1.257659, 1.745925, 0, 0.2862745, 1, 1,
0.3269744, -0.0387446, 1.006163, 0, 0.2784314, 1, 1,
0.3373225, 2.691565, 2.353757, 0, 0.2745098, 1, 1,
0.337421, -0.9456177, 3.129087, 0, 0.2666667, 1, 1,
0.3377532, 1.613783, -0.7306113, 0, 0.2627451, 1, 1,
0.3384343, 0.4265683, 0.04268203, 0, 0.254902, 1, 1,
0.3411957, 0.6705952, 0.4424212, 0, 0.2509804, 1, 1,
0.3424432, -2.322135, 3.052572, 0, 0.2431373, 1, 1,
0.3459128, -0.5602123, 3.709322, 0, 0.2392157, 1, 1,
0.3463439, 0.3950629, 0.2255258, 0, 0.2313726, 1, 1,
0.3526846, -0.9633495, 3.882457, 0, 0.227451, 1, 1,
0.3601426, -1.351105, 3.141815, 0, 0.2196078, 1, 1,
0.3680786, -0.8295182, 3.060425, 0, 0.2156863, 1, 1,
0.3709961, 0.3603964, 1.203158, 0, 0.2078431, 1, 1,
0.3722029, 1.599344, 0.4489298, 0, 0.2039216, 1, 1,
0.3733614, 0.9330335, -0.6662177, 0, 0.1960784, 1, 1,
0.3795323, -0.6270389, 1.821179, 0, 0.1882353, 1, 1,
0.3848489, -0.193881, 2.475102, 0, 0.1843137, 1, 1,
0.3871026, -0.3763566, 1.666149, 0, 0.1764706, 1, 1,
0.3908756, 1.005245, -0.5215768, 0, 0.172549, 1, 1,
0.3931788, -2.157887, 4.139123, 0, 0.1647059, 1, 1,
0.3942114, -0.3558293, 3.176271, 0, 0.1607843, 1, 1,
0.3971725, 0.6613787, 0.281031, 0, 0.1529412, 1, 1,
0.3995205, -0.7321379, 2.000356, 0, 0.1490196, 1, 1,
0.4043467, 0.2082861, 0.7535587, 0, 0.1411765, 1, 1,
0.4055324, 0.1373745, 1.46375, 0, 0.1372549, 1, 1,
0.4089674, -1.741871, 2.384539, 0, 0.1294118, 1, 1,
0.4106006, -0.6635235, 2.116905, 0, 0.1254902, 1, 1,
0.4109831, -0.625257, 3.085072, 0, 0.1176471, 1, 1,
0.4118429, 0.1431537, 1.590253, 0, 0.1137255, 1, 1,
0.4123962, 0.4794431, 1.67335, 0, 0.1058824, 1, 1,
0.4127063, -0.3796176, 0.387274, 0, 0.09803922, 1, 1,
0.4166929, -0.7213756, 3.381105, 0, 0.09411765, 1, 1,
0.4206083, 0.2652362, 1.566903, 0, 0.08627451, 1, 1,
0.4277793, 0.6065775, 0.6764678, 0, 0.08235294, 1, 1,
0.4279869, 0.5631414, 1.432819, 0, 0.07450981, 1, 1,
0.4287637, 0.2837689, 0.5544129, 0, 0.07058824, 1, 1,
0.429177, -1.935362, 3.825958, 0, 0.0627451, 1, 1,
0.4300805, -0.6710181, 3.212182, 0, 0.05882353, 1, 1,
0.4343489, -0.4995891, 2.017836, 0, 0.05098039, 1, 1,
0.4395698, -0.01801432, 1.525442, 0, 0.04705882, 1, 1,
0.4427278, 1.096758, -1.55321, 0, 0.03921569, 1, 1,
0.4427759, -0.4834669, 3.849921, 0, 0.03529412, 1, 1,
0.4482691, 0.4375807, -0.07715181, 0, 0.02745098, 1, 1,
0.4544806, 0.9463981, 1.737456, 0, 0.02352941, 1, 1,
0.4552227, 0.4982996, 0.5998568, 0, 0.01568628, 1, 1,
0.4573379, -1.285207, 4.262405, 0, 0.01176471, 1, 1,
0.4582435, 0.5857814, 0.997264, 0, 0.003921569, 1, 1,
0.4605769, 1.877109, 0.7646516, 0.003921569, 0, 1, 1,
0.4644857, -1.339999, 2.817958, 0.007843138, 0, 1, 1,
0.4669081, -0.5115017, 2.409107, 0.01568628, 0, 1, 1,
0.4713647, -0.944493, 2.873579, 0.01960784, 0, 1, 1,
0.4737417, -1.49402, 3.119091, 0.02745098, 0, 1, 1,
0.4755334, -0.8694516, 2.184261, 0.03137255, 0, 1, 1,
0.4755633, 0.007148612, 1.480344, 0.03921569, 0, 1, 1,
0.4760106, -1.739509, 4.171672, 0.04313726, 0, 1, 1,
0.480783, 0.8231658, 0.5697043, 0.05098039, 0, 1, 1,
0.4880605, -0.1989063, -0.001970082, 0.05490196, 0, 1, 1,
0.4972778, 1.25399, 1.042359, 0.0627451, 0, 1, 1,
0.5025889, -0.08087035, 2.928865, 0.06666667, 0, 1, 1,
0.5050235, 0.9511454, 1.868149, 0.07450981, 0, 1, 1,
0.5060997, -0.453366, 1.805929, 0.07843138, 0, 1, 1,
0.5077673, -0.8894337, 2.759991, 0.08627451, 0, 1, 1,
0.5083788, -0.7959963, 4.243553, 0.09019608, 0, 1, 1,
0.5085534, 0.7808705, -0.660974, 0.09803922, 0, 1, 1,
0.5131139, 0.588888, 2.172033, 0.1058824, 0, 1, 1,
0.5159693, 1.329281, 0.6674861, 0.1098039, 0, 1, 1,
0.5213302, -1.044309, 3.101231, 0.1176471, 0, 1, 1,
0.5215132, -2.335951, 1.531282, 0.1215686, 0, 1, 1,
0.5240187, -0.4608833, 4.119566, 0.1294118, 0, 1, 1,
0.5240768, -0.3682173, 2.943807, 0.1333333, 0, 1, 1,
0.5286832, 0.5460817, 0.08204881, 0.1411765, 0, 1, 1,
0.5308244, 0.8126932, 1.678902, 0.145098, 0, 1, 1,
0.5358818, -0.1268208, 1.999147, 0.1529412, 0, 1, 1,
0.5414959, 1.642463, 0.2007562, 0.1568628, 0, 1, 1,
0.5430085, -1.807111, 1.954157, 0.1647059, 0, 1, 1,
0.5438089, -1.764875, 4.104599, 0.1686275, 0, 1, 1,
0.5471575, -1.186529, 3.402681, 0.1764706, 0, 1, 1,
0.5479279, 0.9650596, 2.020785, 0.1803922, 0, 1, 1,
0.5499368, 0.3800681, 0.8401843, 0.1882353, 0, 1, 1,
0.55527, -1.526436, 2.34962, 0.1921569, 0, 1, 1,
0.5562952, 0.9824504, 1.664265, 0.2, 0, 1, 1,
0.5585895, -0.5264741, 2.751069, 0.2078431, 0, 1, 1,
0.5640309, 0.7837473, 1.048933, 0.2117647, 0, 1, 1,
0.5645508, -0.5748102, 1.444806, 0.2196078, 0, 1, 1,
0.5735693, 0.4697444, 0.4987261, 0.2235294, 0, 1, 1,
0.5742298, -0.07053164, 1.533371, 0.2313726, 0, 1, 1,
0.5777103, -1.526058, 3.638717, 0.2352941, 0, 1, 1,
0.5815526, 0.09140933, 0.9864824, 0.2431373, 0, 1, 1,
0.5834147, 0.9229614, 1.479893, 0.2470588, 0, 1, 1,
0.5855813, 1.728897, 0.8712783, 0.254902, 0, 1, 1,
0.5862978, 0.833801, 1.36923, 0.2588235, 0, 1, 1,
0.5896169, 2.133862, 1.783774, 0.2666667, 0, 1, 1,
0.5907261, -1.333389, 3.09895, 0.2705882, 0, 1, 1,
0.5926692, 0.3994161, -0.3303562, 0.2784314, 0, 1, 1,
0.5950429, 0.719353, 1.952505, 0.282353, 0, 1, 1,
0.5965868, -1.361533, 3.626063, 0.2901961, 0, 1, 1,
0.599323, -0.1608665, 1.003899, 0.2941177, 0, 1, 1,
0.6144048, -0.4770926, 4.016026, 0.3019608, 0, 1, 1,
0.6153675, -0.3338782, 2.715214, 0.3098039, 0, 1, 1,
0.6212873, -0.7332212, 2.597693, 0.3137255, 0, 1, 1,
0.6222838, -1.406824, 1.871905, 0.3215686, 0, 1, 1,
0.6241149, -1.545359, 1.59409, 0.3254902, 0, 1, 1,
0.6248865, 0.5622703, -0.6034352, 0.3333333, 0, 1, 1,
0.6318243, -0.6137456, 1.458545, 0.3372549, 0, 1, 1,
0.6345999, 0.1268392, 1.182337, 0.345098, 0, 1, 1,
0.6364771, -0.5239431, 2.266961, 0.3490196, 0, 1, 1,
0.6366866, 1.655459, 0.6627015, 0.3568628, 0, 1, 1,
0.6370641, -1.375368, 2.702194, 0.3607843, 0, 1, 1,
0.6396393, -0.105384, 1.184715, 0.3686275, 0, 1, 1,
0.6396734, 0.5692487, 2.432323, 0.372549, 0, 1, 1,
0.6402059, 2.052031, 2.049582, 0.3803922, 0, 1, 1,
0.6422388, 0.105243, 1.590267, 0.3843137, 0, 1, 1,
0.6439658, 2.128751, 0.4743123, 0.3921569, 0, 1, 1,
0.6472826, 0.497627, -0.8348297, 0.3960784, 0, 1, 1,
0.6483595, -0.1397697, 2.016106, 0.4039216, 0, 1, 1,
0.6500493, -1.104658, 2.754029, 0.4117647, 0, 1, 1,
0.6565277, 0.5383851, 1.316929, 0.4156863, 0, 1, 1,
0.6667144, 1.846334, -0.1021415, 0.4235294, 0, 1, 1,
0.6892434, -0.5533125, 0.9473523, 0.427451, 0, 1, 1,
0.6904418, -0.4234476, 1.650474, 0.4352941, 0, 1, 1,
0.6934154, -1.36346, 0.9213895, 0.4392157, 0, 1, 1,
0.6975275, 1.547624, -1.391143, 0.4470588, 0, 1, 1,
0.6982546, 0.05744955, 2.134172, 0.4509804, 0, 1, 1,
0.6987277, -0.5772686, 0.1340859, 0.4588235, 0, 1, 1,
0.703714, 0.9959729, 3.052579, 0.4627451, 0, 1, 1,
0.7038391, 0.4037687, 2.594488, 0.4705882, 0, 1, 1,
0.7099978, 1.84854, 0.4237366, 0.4745098, 0, 1, 1,
0.7125588, 0.7647859, 2.749852, 0.4823529, 0, 1, 1,
0.7151295, 2.169113, -0.1922211, 0.4862745, 0, 1, 1,
0.7172821, 0.1071268, 0.9018562, 0.4941176, 0, 1, 1,
0.717699, 0.4856452, 2.221317, 0.5019608, 0, 1, 1,
0.7199616, 0.9021896, 2.156918, 0.5058824, 0, 1, 1,
0.7213724, 0.5132252, -0.07003934, 0.5137255, 0, 1, 1,
0.7225597, 1.29582, 0.9540583, 0.5176471, 0, 1, 1,
0.7237434, -1.6813, 2.513508, 0.5254902, 0, 1, 1,
0.7256567, 0.433693, -0.5557768, 0.5294118, 0, 1, 1,
0.726162, 0.1878246, 0.8407894, 0.5372549, 0, 1, 1,
0.7299823, -3.501853e-05, 0.8462124, 0.5411765, 0, 1, 1,
0.7309592, -1.399462, 1.842544, 0.5490196, 0, 1, 1,
0.736603, 0.7643077, 0.3964849, 0.5529412, 0, 1, 1,
0.7429472, -1.651032, 2.865502, 0.5607843, 0, 1, 1,
0.7430046, -0.001633396, 0.8898869, 0.5647059, 0, 1, 1,
0.7502602, 2.147967, 0.5761889, 0.572549, 0, 1, 1,
0.7531639, -1.064123, 2.994787, 0.5764706, 0, 1, 1,
0.760833, 0.2626802, -0.02163676, 0.5843138, 0, 1, 1,
0.7630092, 2.110119, -0.9456711, 0.5882353, 0, 1, 1,
0.7667343, 1.363166, -0.2308634, 0.5960785, 0, 1, 1,
0.7681851, 1.193412, 2.697684, 0.6039216, 0, 1, 1,
0.7716196, 1.105654, -0.008535345, 0.6078432, 0, 1, 1,
0.7738957, 0.1925356, 1.869157, 0.6156863, 0, 1, 1,
0.7739288, 0.3781065, 2.134832, 0.6196079, 0, 1, 1,
0.7857685, -1.543622, 2.840473, 0.627451, 0, 1, 1,
0.7875, -0.3984233, 0.3792324, 0.6313726, 0, 1, 1,
0.7896023, -1.493472, 1.533831, 0.6392157, 0, 1, 1,
0.7969978, 1.084534, 1.65255, 0.6431373, 0, 1, 1,
0.7982407, 2.076685, 0.420842, 0.6509804, 0, 1, 1,
0.8012407, -0.8937998, 1.941598, 0.654902, 0, 1, 1,
0.8051234, -0.1028802, 1.334272, 0.6627451, 0, 1, 1,
0.8077899, -1.810984, 0.8556299, 0.6666667, 0, 1, 1,
0.8102941, 2.268536, -0.4368119, 0.6745098, 0, 1, 1,
0.8104405, -0.5164534, 3.241054, 0.6784314, 0, 1, 1,
0.8112234, -1.32947, 2.450438, 0.6862745, 0, 1, 1,
0.8140293, -0.7259812, 2.164463, 0.6901961, 0, 1, 1,
0.8156488, 0.8200037, 0.02475249, 0.6980392, 0, 1, 1,
0.8180733, -0.003145661, 1.65608, 0.7058824, 0, 1, 1,
0.8269604, 0.2628831, 0.8276393, 0.7098039, 0, 1, 1,
0.8349355, 0.3570705, 1.08786, 0.7176471, 0, 1, 1,
0.8392022, 0.6494942, -1.500021, 0.7215686, 0, 1, 1,
0.8409682, -1.458753, 1.985048, 0.7294118, 0, 1, 1,
0.844358, -1.528645, 2.35139, 0.7333333, 0, 1, 1,
0.848401, 0.3779573, 0.3351568, 0.7411765, 0, 1, 1,
0.8510645, 0.8203115, 0.2026623, 0.7450981, 0, 1, 1,
0.8536094, -0.002589996, 2.067913, 0.7529412, 0, 1, 1,
0.8583099, 0.6852431, 2.427632, 0.7568628, 0, 1, 1,
0.8692546, 0.2899474, 2.779768, 0.7647059, 0, 1, 1,
0.8783965, -0.3252791, 0.5934256, 0.7686275, 0, 1, 1,
0.8907573, -1.02729, 0.2812698, 0.7764706, 0, 1, 1,
0.8914368, 0.2032651, 0.9534588, 0.7803922, 0, 1, 1,
0.8947474, 0.7151369, 0.06086637, 0.7882353, 0, 1, 1,
0.901999, 0.2442259, -0.6713079, 0.7921569, 0, 1, 1,
0.9030609, -0.6802555, 3.470799, 0.8, 0, 1, 1,
0.9034684, 0.6082458, 0.4002447, 0.8078431, 0, 1, 1,
0.9051694, -0.1340052, 2.40308, 0.8117647, 0, 1, 1,
0.9079779, 0.2091543, 1.356771, 0.8196079, 0, 1, 1,
0.9123942, 0.8404732, -0.2062705, 0.8235294, 0, 1, 1,
0.9160913, 1.724427, -1.382961, 0.8313726, 0, 1, 1,
0.9217556, -0.7850449, 0.7582787, 0.8352941, 0, 1, 1,
0.9241378, -1.616798, 1.891886, 0.8431373, 0, 1, 1,
0.9272701, 0.6238129, 0.6675166, 0.8470588, 0, 1, 1,
0.9358129, 0.03180077, 0.8274131, 0.854902, 0, 1, 1,
0.9387789, -0.4368955, 2.333856, 0.8588235, 0, 1, 1,
0.9393831, -0.5174878, 1.078351, 0.8666667, 0, 1, 1,
0.9422908, 0.2965723, 0.407378, 0.8705882, 0, 1, 1,
0.9425889, -0.3906583, 2.118681, 0.8784314, 0, 1, 1,
0.9546244, -0.7549137, 2.431945, 0.8823529, 0, 1, 1,
0.9546468, -0.6559858, 0.6472523, 0.8901961, 0, 1, 1,
0.9553268, -0.9895094, 2.720722, 0.8941177, 0, 1, 1,
0.9566265, -0.2433484, 1.535724, 0.9019608, 0, 1, 1,
0.9622462, -1.14722, 2.394955, 0.9098039, 0, 1, 1,
0.9700232, -1.187065, 2.356663, 0.9137255, 0, 1, 1,
0.9701807, 0.8560214, 0.6094315, 0.9215686, 0, 1, 1,
0.9744658, 1.600862, 0.35861, 0.9254902, 0, 1, 1,
0.975876, -0.1739923, 1.616617, 0.9333333, 0, 1, 1,
0.9797451, 0.4486826, 1.136326, 0.9372549, 0, 1, 1,
0.9817443, 1.074348, 1.214585, 0.945098, 0, 1, 1,
0.9872465, -0.3216572, 1.575676, 0.9490196, 0, 1, 1,
0.9985361, -0.904197, 4.169571, 0.9568627, 0, 1, 1,
1.000876, -0.4044698, 2.471842, 0.9607843, 0, 1, 1,
1.00275, -1.637441, 3.100941, 0.9686275, 0, 1, 1,
1.004616, -0.8789086, 3.153653, 0.972549, 0, 1, 1,
1.006348, -0.8553717, 1.175765, 0.9803922, 0, 1, 1,
1.020381, -0.3921612, 0.3460457, 0.9843137, 0, 1, 1,
1.0222, 1.692118, 0.1416526, 0.9921569, 0, 1, 1,
1.02361, -0.7310553, 1.118947, 0.9960784, 0, 1, 1,
1.030477, -0.5351914, 2.18577, 1, 0, 0.9960784, 1,
1.036621, 0.01799284, 1.749595, 1, 0, 0.9882353, 1,
1.039047, 0.2130355, 0.8047292, 1, 0, 0.9843137, 1,
1.041121, 1.098494, 0.9571948, 1, 0, 0.9764706, 1,
1.041524, 0.09762242, 1.128847, 1, 0, 0.972549, 1,
1.044223, 1.239991, 2.410274, 1, 0, 0.9647059, 1,
1.044486, 1.50169, 1.101807, 1, 0, 0.9607843, 1,
1.044832, -0.06434805, 0.949839, 1, 0, 0.9529412, 1,
1.048331, -0.1998827, 1.592971, 1, 0, 0.9490196, 1,
1.049853, -1.238703, 2.934397, 1, 0, 0.9411765, 1,
1.06519, 0.1134724, 0.9886484, 1, 0, 0.9372549, 1,
1.071328, -0.04371365, 2.521344, 1, 0, 0.9294118, 1,
1.079593, 0.7711745, 2.409239, 1, 0, 0.9254902, 1,
1.082144, 0.1105561, 0.08283083, 1, 0, 0.9176471, 1,
1.085025, -0.9932332, 3.726996, 1, 0, 0.9137255, 1,
1.089349, 0.8949555, 0.3889308, 1, 0, 0.9058824, 1,
1.091785, -1.117055, 2.445417, 1, 0, 0.9019608, 1,
1.093632, 0.3108711, 2.052704, 1, 0, 0.8941177, 1,
1.096533, -0.9214613, 1.116441, 1, 0, 0.8862745, 1,
1.100149, 1.887797, -0.7049855, 1, 0, 0.8823529, 1,
1.102893, -0.8367319, 1.840167, 1, 0, 0.8745098, 1,
1.108221, -0.883758, 1.619088, 1, 0, 0.8705882, 1,
1.112098, -0.7036906, 1.952148, 1, 0, 0.8627451, 1,
1.115978, 0.8409494, 0.2868204, 1, 0, 0.8588235, 1,
1.117067, -0.7258797, 2.070443, 1, 0, 0.8509804, 1,
1.123389, 0.4876049, 1.311663, 1, 0, 0.8470588, 1,
1.129284, 0.5831772, 1.020539, 1, 0, 0.8392157, 1,
1.131033, -1.309801, 2.075195, 1, 0, 0.8352941, 1,
1.133564, -1.008969, 3.862082, 1, 0, 0.827451, 1,
1.134389, 1.81818, 0.3869656, 1, 0, 0.8235294, 1,
1.13682, -0.8725013, 3.426133, 1, 0, 0.8156863, 1,
1.137934, 1.686426, -0.4329144, 1, 0, 0.8117647, 1,
1.139742, 1.047506, 0.3540184, 1, 0, 0.8039216, 1,
1.142451, -0.6867673, 1.340889, 1, 0, 0.7960784, 1,
1.143552, -0.4048431, 2.889599, 1, 0, 0.7921569, 1,
1.14637, 1.212498, 0.9264156, 1, 0, 0.7843137, 1,
1.147297, -0.1489757, 0.6574256, 1, 0, 0.7803922, 1,
1.150142, 0.3980024, 1.292232, 1, 0, 0.772549, 1,
1.150306, 0.9412645, 1.997192, 1, 0, 0.7686275, 1,
1.152747, 0.5844202, 1.201235, 1, 0, 0.7607843, 1,
1.15623, -2.006873, 1.695288, 1, 0, 0.7568628, 1,
1.178691, 0.6584188, 1.651749, 1, 0, 0.7490196, 1,
1.180142, 1.138868, 2.259411, 1, 0, 0.7450981, 1,
1.187727, 1.658418, 0.3001485, 1, 0, 0.7372549, 1,
1.199247, 1.77878, 0.8415648, 1, 0, 0.7333333, 1,
1.202898, 0.3098262, 1.825278, 1, 0, 0.7254902, 1,
1.204671, -0.6441298, 1.720112, 1, 0, 0.7215686, 1,
1.216132, -0.07230651, 0.2118793, 1, 0, 0.7137255, 1,
1.220576, 0.3733329, 1.069902, 1, 0, 0.7098039, 1,
1.223198, 0.7223043, 0.7413095, 1, 0, 0.7019608, 1,
1.228476, 1.518967, 1.936278, 1, 0, 0.6941177, 1,
1.230434, 1.321752, 1.231925, 1, 0, 0.6901961, 1,
1.23111, 1.055168, -1.332302, 1, 0, 0.682353, 1,
1.246371, 1.057325, 0.4774904, 1, 0, 0.6784314, 1,
1.254421, 0.4650432, 1.208765, 1, 0, 0.6705883, 1,
1.257527, 0.1941954, 1.936396, 1, 0, 0.6666667, 1,
1.258532, 0.1529902, 1.389536, 1, 0, 0.6588235, 1,
1.2587, 0.4470484, 0.6668457, 1, 0, 0.654902, 1,
1.262536, -0.4350929, 1.190759, 1, 0, 0.6470588, 1,
1.270457, 0.8058885, 0.4358213, 1, 0, 0.6431373, 1,
1.277558, -3.482, 3.800701, 1, 0, 0.6352941, 1,
1.283391, -0.7566952, 2.122322, 1, 0, 0.6313726, 1,
1.30074, -1.887068, 1.82814, 1, 0, 0.6235294, 1,
1.306439, -0.05012998, 1.355858, 1, 0, 0.6196079, 1,
1.309512, 0.2618707, 1.395146, 1, 0, 0.6117647, 1,
1.31288, -1.217165, 2.952, 1, 0, 0.6078432, 1,
1.315273, -0.7458938, 1.411062, 1, 0, 0.6, 1,
1.318742, 0.6483783, 0.7082497, 1, 0, 0.5921569, 1,
1.335289, 0.0001653504, 2.308872, 1, 0, 0.5882353, 1,
1.337695, -0.9611445, 4.729914, 1, 0, 0.5803922, 1,
1.339489, 0.7553245, 1.258354, 1, 0, 0.5764706, 1,
1.340182, 1.486333, 1.623975, 1, 0, 0.5686275, 1,
1.353847, 0.430099, -0.3554371, 1, 0, 0.5647059, 1,
1.355062, -1.938954, 1.978859, 1, 0, 0.5568628, 1,
1.355404, 0.5013316, 1.382263, 1, 0, 0.5529412, 1,
1.368085, -0.04424092, 2.317205, 1, 0, 0.5450981, 1,
1.371958, 0.007201009, 2.648009, 1, 0, 0.5411765, 1,
1.37401, 0.1269946, 2.085705, 1, 0, 0.5333334, 1,
1.377232, 1.728178, 1.063417, 1, 0, 0.5294118, 1,
1.384953, 1.050358, 0.791075, 1, 0, 0.5215687, 1,
1.387612, 1.076759, 1.088452, 1, 0, 0.5176471, 1,
1.387734, -1.184512, 2.108164, 1, 0, 0.509804, 1,
1.392502, -1.32067, 1.914618, 1, 0, 0.5058824, 1,
1.403899, 0.5179159, 1.763517, 1, 0, 0.4980392, 1,
1.408442, 0.4373704, 2.17802, 1, 0, 0.4901961, 1,
1.423976, 1.008982, 0.4772803, 1, 0, 0.4862745, 1,
1.424501, 1.073905, 0.5335443, 1, 0, 0.4784314, 1,
1.443417, -1.260057, -0.5616513, 1, 0, 0.4745098, 1,
1.445784, 0.7907708, -0.1827795, 1, 0, 0.4666667, 1,
1.453756, 0.9895827, -2.186987, 1, 0, 0.4627451, 1,
1.464094, 0.4743673, 2.753757, 1, 0, 0.454902, 1,
1.469389, 0.9297942, -1.099718, 1, 0, 0.4509804, 1,
1.472575, 1.27924, 1.382427, 1, 0, 0.4431373, 1,
1.485034, 0.1302337, 2.331689, 1, 0, 0.4392157, 1,
1.49341, 0.7674617, 0.7955069, 1, 0, 0.4313726, 1,
1.49482, -2.035653, 2.355122, 1, 0, 0.427451, 1,
1.49737, -0.8624611, 0.5613265, 1, 0, 0.4196078, 1,
1.514959, -1.725138, 0.4068099, 1, 0, 0.4156863, 1,
1.515838, -1.541421, 1.193109, 1, 0, 0.4078431, 1,
1.521688, 0.1801002, 2.701604, 1, 0, 0.4039216, 1,
1.552241, -1.194894, 0.7561843, 1, 0, 0.3960784, 1,
1.552977, -0.3861905, 2.108599, 1, 0, 0.3882353, 1,
1.553969, 1.084436, 2.706294, 1, 0, 0.3843137, 1,
1.566929, 1.008138, 2.41082, 1, 0, 0.3764706, 1,
1.58365, -1.38996, 1.536964, 1, 0, 0.372549, 1,
1.584006, -0.7589374, 2.199145, 1, 0, 0.3647059, 1,
1.590625, 1.003707, -0.4132536, 1, 0, 0.3607843, 1,
1.594784, 0.4808489, 1.023067, 1, 0, 0.3529412, 1,
1.602301, -0.9241492, 1.281636, 1, 0, 0.3490196, 1,
1.605935, 0.1023819, 0.7815864, 1, 0, 0.3411765, 1,
1.612386, 1.256514, 1.996596, 1, 0, 0.3372549, 1,
1.614139, 0.5898408, 1.146277, 1, 0, 0.3294118, 1,
1.617814, 1.370669, 1.493493, 1, 0, 0.3254902, 1,
1.628028, -1.420377, 3.766917, 1, 0, 0.3176471, 1,
1.640024, -0.5483012, -1.074095, 1, 0, 0.3137255, 1,
1.644232, 0.9410542, 1.084523, 1, 0, 0.3058824, 1,
1.65134, -1.414887, 1.267384, 1, 0, 0.2980392, 1,
1.659245, 0.4415296, 0.1985232, 1, 0, 0.2941177, 1,
1.666816, 0.3998238, 1.505611, 1, 0, 0.2862745, 1,
1.670155, 0.5389569, 0.1285881, 1, 0, 0.282353, 1,
1.69466, 0.7138881, 1.69574, 1, 0, 0.2745098, 1,
1.701936, -0.9031654, 3.018462, 1, 0, 0.2705882, 1,
1.702495, -1.652344, 2.851089, 1, 0, 0.2627451, 1,
1.722657, -1.846391, 1.728106, 1, 0, 0.2588235, 1,
1.754878, 0.693355, 0.3752165, 1, 0, 0.2509804, 1,
1.756158, 2.137381, -0.6842507, 1, 0, 0.2470588, 1,
1.768724, 0.9506397, 0.8381653, 1, 0, 0.2392157, 1,
1.794235, -1.004166, 1.11796, 1, 0, 0.2352941, 1,
1.80214, 0.4884869, 0.7395912, 1, 0, 0.227451, 1,
1.816558, -0.04029971, 1.213279, 1, 0, 0.2235294, 1,
1.822938, -1.474038, 2.482749, 1, 0, 0.2156863, 1,
1.849336, -1.236212, 2.175246, 1, 0, 0.2117647, 1,
1.874854, -1.705228, 2.677048, 1, 0, 0.2039216, 1,
1.924264, -1.08079, 2.382679, 1, 0, 0.1960784, 1,
1.947043, 1.38425, -0.3525107, 1, 0, 0.1921569, 1,
1.977569, 1.576716, 1.412674, 1, 0, 0.1843137, 1,
1.978564, -0.3903375, 1.986701, 1, 0, 0.1803922, 1,
2.001591, 0.1652985, 2.107427, 1, 0, 0.172549, 1,
2.019629, 0.3014815, 1.829542, 1, 0, 0.1686275, 1,
2.023536, 2.517689, 0.0596216, 1, 0, 0.1607843, 1,
2.034889, 0.5905067, 1.866802, 1, 0, 0.1568628, 1,
2.042314, 0.5593891, 2.182753, 1, 0, 0.1490196, 1,
2.071562, -1.343441, 3.252297, 1, 0, 0.145098, 1,
2.189318, -0.7468058, 0.8110381, 1, 0, 0.1372549, 1,
2.192278, -1.869963, 3.094589, 1, 0, 0.1333333, 1,
2.202777, -0.597155, 3.807577, 1, 0, 0.1254902, 1,
2.259773, -0.9512359, 2.596044, 1, 0, 0.1215686, 1,
2.328292, 0.03041117, 2.106815, 1, 0, 0.1137255, 1,
2.335537, 0.3742307, -0.532654, 1, 0, 0.1098039, 1,
2.342209, 0.7928224, 1.419286, 1, 0, 0.1019608, 1,
2.363899, -0.4766321, 3.162696, 1, 0, 0.09411765, 1,
2.431362, 0.06121037, 2.316105, 1, 0, 0.09019608, 1,
2.434675, 1.286274, 0.07707649, 1, 0, 0.08235294, 1,
2.449732, 0.4688151, 1.472683, 1, 0, 0.07843138, 1,
2.454158, 0.06834443, 0.4533921, 1, 0, 0.07058824, 1,
2.477354, -0.0515861, 1.106967, 1, 0, 0.06666667, 1,
2.507423, 0.1631467, 1.114805, 1, 0, 0.05882353, 1,
2.522779, 0.5790919, 1.588766, 1, 0, 0.05490196, 1,
2.534803, -1.948085, 0.9177247, 1, 0, 0.04705882, 1,
2.665317, -1.12382, 1.363408, 1, 0, 0.04313726, 1,
2.743809, 0.2244863, 1.383274, 1, 0, 0.03529412, 1,
2.835468, -0.1039013, 2.389889, 1, 0, 0.03137255, 1,
2.854836, 0.7093903, 2.697269, 1, 0, 0.02352941, 1,
3.098072, 1.522149, -0.7731403, 1, 0, 0.01960784, 1,
3.180661, 0.4298514, 2.325742, 1, 0, 0.01176471, 1,
3.209594, -0.4367831, 2.977437, 1, 0, 0.007843138, 1
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
-0.1242661, -4.528419, -7.094818, 0, -0.5, 0.5, 0.5,
-0.1242661, -4.528419, -7.094818, 1, -0.5, 0.5, 0.5,
-0.1242661, -4.528419, -7.094818, 1, 1.5, 0.5, 0.5,
-0.1242661, -4.528419, -7.094818, 0, 1.5, 0.5, 0.5
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
-4.588304, -0.3952174, -7.094818, 0, -0.5, 0.5, 0.5,
-4.588304, -0.3952174, -7.094818, 1, -0.5, 0.5, 0.5,
-4.588304, -0.3952174, -7.094818, 1, 1.5, 0.5, 0.5,
-4.588304, -0.3952174, -7.094818, 0, 1.5, 0.5, 0.5
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
-4.588304, -4.528419, -0.3233202, 0, -0.5, 0.5, 0.5,
-4.588304, -4.528419, -0.3233202, 1, -0.5, 0.5, 0.5,
-4.588304, -4.528419, -0.3233202, 1, 1.5, 0.5, 0.5,
-4.588304, -4.528419, -0.3233202, 0, 1.5, 0.5, 0.5
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
-3, -3.574603, -5.532165,
3, -3.574603, -5.532165,
-3, -3.574603, -5.532165,
-3, -3.733573, -5.792607,
-2, -3.574603, -5.532165,
-2, -3.733573, -5.792607,
-1, -3.574603, -5.532165,
-1, -3.733573, -5.792607,
0, -3.574603, -5.532165,
0, -3.733573, -5.792607,
1, -3.574603, -5.532165,
1, -3.733573, -5.792607,
2, -3.574603, -5.532165,
2, -3.733573, -5.792607,
3, -3.574603, -5.532165,
3, -3.733573, -5.792607
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
-3, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
-3, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
-3, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
-3, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
-2, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
-2, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
-2, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
-2, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
-1, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
-1, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
-1, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
-1, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
0, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
0, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
0, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
0, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
1, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
1, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
1, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
1, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
2, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
2, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
2, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
2, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5,
3, -4.051511, -6.313491, 0, -0.5, 0.5, 0.5,
3, -4.051511, -6.313491, 1, -0.5, 0.5, 0.5,
3, -4.051511, -6.313491, 1, 1.5, 0.5, 0.5,
3, -4.051511, -6.313491, 0, 1.5, 0.5, 0.5
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
-3.558142, -3, -5.532165,
-3.558142, 2, -5.532165,
-3.558142, -3, -5.532165,
-3.729836, -3, -5.792607,
-3.558142, -2, -5.532165,
-3.729836, -2, -5.792607,
-3.558142, -1, -5.532165,
-3.729836, -1, -5.792607,
-3.558142, 0, -5.532165,
-3.729836, 0, -5.792607,
-3.558142, 1, -5.532165,
-3.729836, 1, -5.792607,
-3.558142, 2, -5.532165,
-3.729836, 2, -5.792607
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
-4.073223, -3, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, -3, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, -3, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, -3, -6.313491, 0, 1.5, 0.5, 0.5,
-4.073223, -2, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, -2, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, -2, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, -2, -6.313491, 0, 1.5, 0.5, 0.5,
-4.073223, -1, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, -1, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, -1, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, -1, -6.313491, 0, 1.5, 0.5, 0.5,
-4.073223, 0, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, 0, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, 0, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, 0, -6.313491, 0, 1.5, 0.5, 0.5,
-4.073223, 1, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, 1, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, 1, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, 1, -6.313491, 0, 1.5, 0.5, 0.5,
-4.073223, 2, -6.313491, 0, -0.5, 0.5, 0.5,
-4.073223, 2, -6.313491, 1, -0.5, 0.5, 0.5,
-4.073223, 2, -6.313491, 1, 1.5, 0.5, 0.5,
-4.073223, 2, -6.313491, 0, 1.5, 0.5, 0.5
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
-3.558142, -3.574603, -4,
-3.558142, -3.574603, 4,
-3.558142, -3.574603, -4,
-3.729836, -3.733573, -4,
-3.558142, -3.574603, -2,
-3.729836, -3.733573, -2,
-3.558142, -3.574603, 0,
-3.729836, -3.733573, 0,
-3.558142, -3.574603, 2,
-3.729836, -3.733573, 2,
-3.558142, -3.574603, 4,
-3.729836, -3.733573, 4
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
-4.073223, -4.051511, -4, 0, -0.5, 0.5, 0.5,
-4.073223, -4.051511, -4, 1, -0.5, 0.5, 0.5,
-4.073223, -4.051511, -4, 1, 1.5, 0.5, 0.5,
-4.073223, -4.051511, -4, 0, 1.5, 0.5, 0.5,
-4.073223, -4.051511, -2, 0, -0.5, 0.5, 0.5,
-4.073223, -4.051511, -2, 1, -0.5, 0.5, 0.5,
-4.073223, -4.051511, -2, 1, 1.5, 0.5, 0.5,
-4.073223, -4.051511, -2, 0, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 0, 0, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 0, 1, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 0, 1, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 0, 0, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 2, 0, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 2, 1, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 2, 1, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 2, 0, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 4, 0, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 4, 1, -0.5, 0.5, 0.5,
-4.073223, -4.051511, 4, 1, 1.5, 0.5, 0.5,
-4.073223, -4.051511, 4, 0, 1.5, 0.5, 0.5
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
-3.558142, -3.574603, -5.532165,
-3.558142, 2.784168, -5.532165,
-3.558142, -3.574603, 4.885524,
-3.558142, 2.784168, 4.885524,
-3.558142, -3.574603, -5.532165,
-3.558142, -3.574603, 4.885524,
-3.558142, 2.784168, -5.532165,
-3.558142, 2.784168, 4.885524,
-3.558142, -3.574603, -5.532165,
3.309609, -3.574603, -5.532165,
-3.558142, -3.574603, 4.885524,
3.309609, -3.574603, 4.885524,
-3.558142, 2.784168, -5.532165,
3.309609, 2.784168, -5.532165,
-3.558142, 2.784168, 4.885524,
3.309609, 2.784168, 4.885524,
3.309609, -3.574603, -5.532165,
3.309609, 2.784168, -5.532165,
3.309609, -3.574603, 4.885524,
3.309609, 2.784168, 4.885524,
3.309609, -3.574603, -5.532165,
3.309609, -3.574603, 4.885524,
3.309609, 2.784168, -5.532165,
3.309609, 2.784168, 4.885524
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
var radius = 7.478173;
var distance = 33.27124;
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
mvMatrix.translate( 0.1242661, 0.3952174, 0.3233202 );
mvMatrix.scale( 1.177321, 1.271558, 0.7761364 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.27124);
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
pefurazoate<-read.table("pefurazoate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pefurazoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
y<-pefurazoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
z<-pefurazoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
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
-3.458126, 1.548718, -1.00289, 0, 0, 1, 1, 1,
-2.683268, 1.155811, -0.05323531, 1, 0, 0, 1, 1,
-2.484227, -1.151899, 0.002442624, 1, 0, 0, 1, 1,
-2.475006, -2.043427, -2.723669, 1, 0, 0, 1, 1,
-2.438021, 1.001247, -2.37596, 1, 0, 0, 1, 1,
-2.415751, -1.571274, 0.3797885, 1, 0, 0, 1, 1,
-2.349357, 0.5195122, -2.033281, 0, 0, 0, 1, 1,
-2.196573, -0.962286, -2.832821, 0, 0, 0, 1, 1,
-2.193161, -0.2541568, -0.5035103, 0, 0, 0, 1, 1,
-2.190942, 1.017012, -0.6189579, 0, 0, 0, 1, 1,
-2.169778, 0.9697472, 0.166601, 0, 0, 0, 1, 1,
-2.152356, -1.125798, -2.255441, 0, 0, 0, 1, 1,
-2.11138, -2.152856, -0.5022326, 0, 0, 0, 1, 1,
-2.096347, 0.3906397, -0.7025707, 1, 1, 1, 1, 1,
-2.079577, -0.5768433, -2.860668, 1, 1, 1, 1, 1,
-2.040853, 1.302236, -1.889199, 1, 1, 1, 1, 1,
-2.039355, -0.2118715, -1.035255, 1, 1, 1, 1, 1,
-2.026968, 0.4131135, 0.2649634, 1, 1, 1, 1, 1,
-2.006839, -1.43719, -0.802122, 1, 1, 1, 1, 1,
-2.005552, -1.009392, 0.232795, 1, 1, 1, 1, 1,
-2.000441, 0.785111, -1.886906, 1, 1, 1, 1, 1,
-1.990766, 1.02205, -2.529529, 1, 1, 1, 1, 1,
-1.973957, 1.988234, -2.862553, 1, 1, 1, 1, 1,
-1.970842, 0.838627, -3.168695, 1, 1, 1, 1, 1,
-1.94454, 1.139711, -0.5315161, 1, 1, 1, 1, 1,
-1.927771, 1.617712, -0.8075538, 1, 1, 1, 1, 1,
-1.919178, -0.09123539, -1.610633, 1, 1, 1, 1, 1,
-1.904556, -0.9110752, -0.2874447, 1, 1, 1, 1, 1,
-1.903188, -0.1484411, -2.941375, 0, 0, 1, 1, 1,
-1.900693, -0.0360374, -0.6160439, 1, 0, 0, 1, 1,
-1.893392, 0.04842504, -3.221843, 1, 0, 0, 1, 1,
-1.888771, 0.665966, -0.2442284, 1, 0, 0, 1, 1,
-1.882501, -1.835713, -2.328161, 1, 0, 0, 1, 1,
-1.868817, 0.1065309, -1.785493, 1, 0, 0, 1, 1,
-1.866106, -1.108358, -2.534071, 0, 0, 0, 1, 1,
-1.85271, -0.542127, -0.299503, 0, 0, 0, 1, 1,
-1.827181, -0.7556541, -2.015847, 0, 0, 0, 1, 1,
-1.818982, 1.522927, -0.7128832, 0, 0, 0, 1, 1,
-1.81223, -0.1738437, -1.944547, 0, 0, 0, 1, 1,
-1.811595, 0.5083638, -1.140506, 0, 0, 0, 1, 1,
-1.79268, -0.006796249, -1.544828, 0, 0, 0, 1, 1,
-1.764011, -1.140895, -4.688594, 1, 1, 1, 1, 1,
-1.74357, 0.1202395, -2.032041, 1, 1, 1, 1, 1,
-1.732323, 0.2631553, -1.865722, 1, 1, 1, 1, 1,
-1.729852, -0.5078585, -1.940286, 1, 1, 1, 1, 1,
-1.711216, -0.4910106, -2.423407, 1, 1, 1, 1, 1,
-1.69213, -1.079054, -4.434875, 1, 1, 1, 1, 1,
-1.676154, -2.378258, -1.917552, 1, 1, 1, 1, 1,
-1.674241, 0.07033299, -0.7313511, 1, 1, 1, 1, 1,
-1.665838, 0.3396545, -1.792544, 1, 1, 1, 1, 1,
-1.663986, 1.846163, 0.121735, 1, 1, 1, 1, 1,
-1.591385, 0.3195764, -2.405762, 1, 1, 1, 1, 1,
-1.587953, 2.022859, -1.109452, 1, 1, 1, 1, 1,
-1.584678, 1.091761, -0.1222507, 1, 1, 1, 1, 1,
-1.578498, -1.02461, -1.416145, 1, 1, 1, 1, 1,
-1.569983, -0.3424897, -2.870806, 1, 1, 1, 1, 1,
-1.564587, 0.5330328, -1.037051, 0, 0, 1, 1, 1,
-1.545984, -0.5170787, -2.244668, 1, 0, 0, 1, 1,
-1.541226, -0.5492449, -2.023993, 1, 0, 0, 1, 1,
-1.538511, -0.3376373, -0.2864653, 1, 0, 0, 1, 1,
-1.511572, 1.046836, -1.439882, 1, 0, 0, 1, 1,
-1.50157, 0.6711841, -1.454515, 1, 0, 0, 1, 1,
-1.500218, -0.357253, -2.919096, 0, 0, 0, 1, 1,
-1.4948, 0.5720593, 0.1193702, 0, 0, 0, 1, 1,
-1.4944, 0.4333975, -2.880259, 0, 0, 0, 1, 1,
-1.490499, 0.35493, -2.329492, 0, 0, 0, 1, 1,
-1.487407, 1.623672, -3.163763, 0, 0, 0, 1, 1,
-1.481985, -0.200769, -2.651818, 0, 0, 0, 1, 1,
-1.47742, 0.003999622, -1.192924, 0, 0, 0, 1, 1,
-1.473692, 1.618118, 0.01439373, 1, 1, 1, 1, 1,
-1.472743, -0.2985099, -1.944031, 1, 1, 1, 1, 1,
-1.468292, 0.3845824, -2.028178, 1, 1, 1, 1, 1,
-1.467955, 1.410978, -0.3784075, 1, 1, 1, 1, 1,
-1.458186, 0.5455768, -0.6674985, 1, 1, 1, 1, 1,
-1.440377, -0.7744484, -1.264716, 1, 1, 1, 1, 1,
-1.421763, 0.3020965, -1.284225, 1, 1, 1, 1, 1,
-1.421141, -1.13239, -2.438182, 1, 1, 1, 1, 1,
-1.413874, 2.080246, -0.963509, 1, 1, 1, 1, 1,
-1.41085, 0.9944577, -1.991494, 1, 1, 1, 1, 1,
-1.394674, 0.7870049, -2.201515, 1, 1, 1, 1, 1,
-1.393985, -1.802897, -3.566158, 1, 1, 1, 1, 1,
-1.375067, 0.6594034, 0.2828582, 1, 1, 1, 1, 1,
-1.370315, 0.3806602, -1.038131, 1, 1, 1, 1, 1,
-1.367283, -1.253986, -0.1119836, 1, 1, 1, 1, 1,
-1.36337, 1.119442, -0.7005914, 0, 0, 1, 1, 1,
-1.361336, 0.7139139, 0.2166073, 1, 0, 0, 1, 1,
-1.356493, -0.5159515, -1.528238, 1, 0, 0, 1, 1,
-1.356257, -0.9090869, -2.61169, 1, 0, 0, 1, 1,
-1.35202, -0.1338679, -0.9293593, 1, 0, 0, 1, 1,
-1.348361, 0.5541314, -1.921592, 1, 0, 0, 1, 1,
-1.340062, 1.51011, -1.211283, 0, 0, 0, 1, 1,
-1.337368, 0.2822175, -2.048604, 0, 0, 0, 1, 1,
-1.333114, 0.2003936, -0.5024053, 0, 0, 0, 1, 1,
-1.312996, -0.3620602, -2.072402, 0, 0, 0, 1, 1,
-1.308031, -1.148097, -3.670078, 0, 0, 0, 1, 1,
-1.301475, 0.1746212, -2.391134, 0, 0, 0, 1, 1,
-1.295943, 0.5052852, -2.111974, 0, 0, 0, 1, 1,
-1.29308, -1.808038, -1.666155, 1, 1, 1, 1, 1,
-1.291188, -0.3340214, -2.329389, 1, 1, 1, 1, 1,
-1.281792, 0.007761578, -3.459843, 1, 1, 1, 1, 1,
-1.278897, -0.1948135, -1.490866, 1, 1, 1, 1, 1,
-1.270637, -0.4792727, -0.02146815, 1, 1, 1, 1, 1,
-1.263868, -0.7460387, -3.274857, 1, 1, 1, 1, 1,
-1.262708, -0.1070803, -1.99667, 1, 1, 1, 1, 1,
-1.253209, -0.2633313, -2.146603, 1, 1, 1, 1, 1,
-1.239924, -0.6364328, -1.447459, 1, 1, 1, 1, 1,
-1.239097, -0.9329972, -3.960836, 1, 1, 1, 1, 1,
-1.234195, -1.340377, -5.12892, 1, 1, 1, 1, 1,
-1.228971, -1.354032, -3.682076, 1, 1, 1, 1, 1,
-1.217815, 1.496929, -1.778123, 1, 1, 1, 1, 1,
-1.214637, 1.067774, -0.1659228, 1, 1, 1, 1, 1,
-1.204867, 0.1125711, 0.5278812, 1, 1, 1, 1, 1,
-1.204514, -1.000671, -2.909747, 0, 0, 1, 1, 1,
-1.203923, -2.000278, -3.172997, 1, 0, 0, 1, 1,
-1.194608, 0.8015927, -1.993657, 1, 0, 0, 1, 1,
-1.181127, 0.768267, -0.8202255, 1, 0, 0, 1, 1,
-1.173646, 0.3199365, -0.4683259, 1, 0, 0, 1, 1,
-1.16952, 1.073436, -0.1006149, 1, 0, 0, 1, 1,
-1.161099, -1.265169, -3.243052, 0, 0, 0, 1, 1,
-1.159531, -1.261962, -1.620718, 0, 0, 0, 1, 1,
-1.15669, -0.08801968, -1.133558, 0, 0, 0, 1, 1,
-1.152478, 1.684991, 0.4381328, 0, 0, 0, 1, 1,
-1.151488, 0.5799782, -1.916224, 0, 0, 0, 1, 1,
-1.137902, -0.7691707, -2.296132, 0, 0, 0, 1, 1,
-1.136811, -0.6146112, -2.427934, 0, 0, 0, 1, 1,
-1.132207, -0.133049, -3.099589, 1, 1, 1, 1, 1,
-1.132186, 1.499437, 0.2404994, 1, 1, 1, 1, 1,
-1.11119, -1.128999, -2.509625, 1, 1, 1, 1, 1,
-1.105631, -0.5524827, -2.00099, 1, 1, 1, 1, 1,
-1.103712, -0.6771188, -2.27872, 1, 1, 1, 1, 1,
-1.098937, -0.9829042, -1.478804, 1, 1, 1, 1, 1,
-1.098262, 0.4193872, -1.140384, 1, 1, 1, 1, 1,
-1.086185, -0.375212, -0.61527, 1, 1, 1, 1, 1,
-1.083447, 1.844525, -0.27327, 1, 1, 1, 1, 1,
-1.083156, -0.8593993, -2.484841, 1, 1, 1, 1, 1,
-1.082672, 0.7502459, -1.051906, 1, 1, 1, 1, 1,
-1.080843, -0.8692776, -1.898353, 1, 1, 1, 1, 1,
-1.079076, -1.841061, -1.24907, 1, 1, 1, 1, 1,
-1.068604, -0.7822446, -1.846091, 1, 1, 1, 1, 1,
-1.064322, 0.7839945, -0.3180274, 1, 1, 1, 1, 1,
-1.062152, -0.2129137, -3.894784, 0, 0, 1, 1, 1,
-1.059063, 0.1027204, -3.073339, 1, 0, 0, 1, 1,
-1.053112, -2.163499, -3.848055, 1, 0, 0, 1, 1,
-1.037021, 0.1854003, -1.000634, 1, 0, 0, 1, 1,
-1.022687, 0.2180249, -3.567218, 1, 0, 0, 1, 1,
-1.016456, 1.369548, 0.1604828, 1, 0, 0, 1, 1,
-1.003253, 1.22004, -1.204112, 0, 0, 0, 1, 1,
-0.9966536, 0.5587509, -0.07619508, 0, 0, 0, 1, 1,
-0.9955928, -0.6028816, -1.272984, 0, 0, 0, 1, 1,
-0.9950084, -0.08353316, -0.2397837, 0, 0, 0, 1, 1,
-0.991425, 0.2114716, -0.4541488, 0, 0, 0, 1, 1,
-0.9902329, -0.01573178, -0.5490912, 0, 0, 0, 1, 1,
-0.9863278, -0.4907114, -1.524007, 0, 0, 0, 1, 1,
-0.9850844, 0.5090235, -2.393388, 1, 1, 1, 1, 1,
-0.9769059, 0.1438525, -2.551443, 1, 1, 1, 1, 1,
-0.9736033, -0.6668056, -1.96841, 1, 1, 1, 1, 1,
-0.9702551, -0.2772913, -1.2225, 1, 1, 1, 1, 1,
-0.9678886, 0.19016, -0.4952136, 1, 1, 1, 1, 1,
-0.9670182, -1.462194, -3.494556, 1, 1, 1, 1, 1,
-0.9647114, 0.4624835, -1.882087, 1, 1, 1, 1, 1,
-0.9467281, -1.12306, -2.323729, 1, 1, 1, 1, 1,
-0.9427251, 0.5415761, -0.3654681, 1, 1, 1, 1, 1,
-0.9353251, 0.31073, -0.6805188, 1, 1, 1, 1, 1,
-0.9328194, 1.007736, -2.936215, 1, 1, 1, 1, 1,
-0.9314715, -1.62097, -2.332346, 1, 1, 1, 1, 1,
-0.9303867, 0.8575033, 0.1444527, 1, 1, 1, 1, 1,
-0.9300292, 0.5658109, -1.063769, 1, 1, 1, 1, 1,
-0.9204425, -0.2287028, -2.511887, 1, 1, 1, 1, 1,
-0.9116802, -0.349977, -2.970581, 0, 0, 1, 1, 1,
-0.9080065, 0.5685439, -1.192151, 1, 0, 0, 1, 1,
-0.9037676, 0.4829421, -1.898712, 1, 0, 0, 1, 1,
-0.8938265, 1.304838, -0.2403229, 1, 0, 0, 1, 1,
-0.8933364, 0.4928955, 0.5727516, 1, 0, 0, 1, 1,
-0.8904843, 0.4750874, -1.235181, 1, 0, 0, 1, 1,
-0.8891055, -0.5196562, -2.81066, 0, 0, 0, 1, 1,
-0.8880406, 0.1998974, 1.145525, 0, 0, 0, 1, 1,
-0.8801657, -0.4913267, -0.193278, 0, 0, 0, 1, 1,
-0.8767532, -0.5085803, -3.493356, 0, 0, 0, 1, 1,
-0.8643303, 0.1507961, -1.353887, 0, 0, 0, 1, 1,
-0.8632163, -1.00371, -1.945677, 0, 0, 0, 1, 1,
-0.8583136, 1.281966, -0.6208276, 0, 0, 0, 1, 1,
-0.8503705, -0.6990924, -1.806138, 1, 1, 1, 1, 1,
-0.8473816, 1.907793, -0.08479679, 1, 1, 1, 1, 1,
-0.8426255, -0.5024142, -1.289928, 1, 1, 1, 1, 1,
-0.8381202, -0.8509994, -2.333082, 1, 1, 1, 1, 1,
-0.8343077, -0.6928685, -3.772524, 1, 1, 1, 1, 1,
-0.8342901, -0.6131966, -3.630491, 1, 1, 1, 1, 1,
-0.8340871, -1.431721, -3.787848, 1, 1, 1, 1, 1,
-0.8329569, 1.945302, -0.167355, 1, 1, 1, 1, 1,
-0.8197287, 1.333573, 0.570341, 1, 1, 1, 1, 1,
-0.81175, -1.539507, -3.063963, 1, 1, 1, 1, 1,
-0.8086702, 0.3300585, -1.436692, 1, 1, 1, 1, 1,
-0.808368, 1.247585, -2.275118, 1, 1, 1, 1, 1,
-0.8016626, -0.7184349, -2.28122, 1, 1, 1, 1, 1,
-0.7994229, -0.1581451, -1.631221, 1, 1, 1, 1, 1,
-0.7983475, 0.2174439, 0.5192873, 1, 1, 1, 1, 1,
-0.7946512, 0.7891344, -0.7763343, 0, 0, 1, 1, 1,
-0.7870381, -0.3336276, 0.01784546, 1, 0, 0, 1, 1,
-0.7823671, -0.3412891, -2.889847, 1, 0, 0, 1, 1,
-0.7815038, 0.5503918, -2.094043, 1, 0, 0, 1, 1,
-0.781248, -2.259631, -1.161244, 1, 0, 0, 1, 1,
-0.7757177, -0.3100198, -2.622411, 1, 0, 0, 1, 1,
-0.7673301, -1.743106, -2.936786, 0, 0, 0, 1, 1,
-0.7652566, 1.039445, -0.05330441, 0, 0, 0, 1, 1,
-0.7636918, 0.1544361, -0.7925386, 0, 0, 0, 1, 1,
-0.7571871, -0.1582572, 0.8029741, 0, 0, 0, 1, 1,
-0.7563791, 1.487437, -2.36577, 0, 0, 0, 1, 1,
-0.7556257, 0.8038046, -0.9884858, 0, 0, 0, 1, 1,
-0.7552832, -0.690034, -2.094393, 0, 0, 0, 1, 1,
-0.753533, -0.7468864, -1.204933, 1, 1, 1, 1, 1,
-0.7534715, 1.423841, -0.6302943, 1, 1, 1, 1, 1,
-0.752916, -1.03039, -3.122289, 1, 1, 1, 1, 1,
-0.7510158, -1.088374, -3.191131, 1, 1, 1, 1, 1,
-0.7462726, 1.758132, -1.702663, 1, 1, 1, 1, 1,
-0.7399167, -0.1472331, -3.887615, 1, 1, 1, 1, 1,
-0.739523, -2.110565, -3.582231, 1, 1, 1, 1, 1,
-0.7319618, -0.6199636, -1.950244, 1, 1, 1, 1, 1,
-0.7216983, 0.1332957, -0.9080368, 1, 1, 1, 1, 1,
-0.7178618, -1.198571, -2.903059, 1, 1, 1, 1, 1,
-0.7017133, 1.406395, 1.324835, 1, 1, 1, 1, 1,
-0.6963032, 0.0261805, -0.743672, 1, 1, 1, 1, 1,
-0.681877, 1.441256, 2.467, 1, 1, 1, 1, 1,
-0.6747754, 0.2458662, -1.475208, 1, 1, 1, 1, 1,
-0.6723393, 1.88126, 0.5549656, 1, 1, 1, 1, 1,
-0.6673578, 0.1495671, -0.9071358, 0, 0, 1, 1, 1,
-0.6634723, 0.4554739, -1.132061, 1, 0, 0, 1, 1,
-0.6610271, -1.159507, -3.919637, 1, 0, 0, 1, 1,
-0.6593479, 1.532632, 0.004570642, 1, 0, 0, 1, 1,
-0.6580319, -0.9728476, -2.220813, 1, 0, 0, 1, 1,
-0.6561602, -0.4019856, -3.577705, 1, 0, 0, 1, 1,
-0.652097, 1.625504, -0.5328298, 0, 0, 0, 1, 1,
-0.6515618, -1.047716, -1.777234, 0, 0, 0, 1, 1,
-0.6497256, 0.7038068, -2.590058, 0, 0, 0, 1, 1,
-0.6371202, -2.649413, -2.878346, 0, 0, 0, 1, 1,
-0.6357411, -1.815157, -2.883744, 0, 0, 0, 1, 1,
-0.6333964, 0.01881348, -3.96691, 0, 0, 0, 1, 1,
-0.6246218, -0.2772371, -2.240381, 0, 0, 0, 1, 1,
-0.6242198, 1.581316, -1.057822, 1, 1, 1, 1, 1,
-0.6229854, -0.8282904, -1.791355, 1, 1, 1, 1, 1,
-0.6215595, -2.107218, -2.394266, 1, 1, 1, 1, 1,
-0.6176985, -1.776757, -4.151733, 1, 1, 1, 1, 1,
-0.617027, -0.3995043, -2.707796, 1, 1, 1, 1, 1,
-0.6161696, 0.4768189, -1.383379, 1, 1, 1, 1, 1,
-0.6070219, -0.4222374, -2.033095, 1, 1, 1, 1, 1,
-0.6066302, -2.014704, -3.448734, 1, 1, 1, 1, 1,
-0.6035229, -0.1888604, -2.214114, 1, 1, 1, 1, 1,
-0.6020842, -0.01256622, -1.724948, 1, 1, 1, 1, 1,
-0.5931616, 1.138955, -0.7863651, 1, 1, 1, 1, 1,
-0.5904311, -0.004620587, -2.948696, 1, 1, 1, 1, 1,
-0.589113, 1.175511, -1.105471, 1, 1, 1, 1, 1,
-0.5884424, -2.074692, -3.124237, 1, 1, 1, 1, 1,
-0.5876203, -0.4085861, -0.4142992, 1, 1, 1, 1, 1,
-0.5860161, 2.274517, 0.6917634, 0, 0, 1, 1, 1,
-0.579281, -0.5388573, -3.019944, 1, 0, 0, 1, 1,
-0.5760933, -0.7463575, -2.915145, 1, 0, 0, 1, 1,
-0.5720398, 1.377223, -0.8540174, 1, 0, 0, 1, 1,
-0.5557763, -0.4982701, -2.174438, 1, 0, 0, 1, 1,
-0.5556876, 1.963158, -0.2071167, 1, 0, 0, 1, 1,
-0.5553897, -0.1123638, -1.28694, 0, 0, 0, 1, 1,
-0.5552306, -0.3393665, -2.770792, 0, 0, 0, 1, 1,
-0.5514732, 0.537748, -0.9534344, 0, 0, 0, 1, 1,
-0.5462761, -0.3035482, -2.283158, 0, 0, 0, 1, 1,
-0.5451555, -0.4114554, -1.97182, 0, 0, 0, 1, 1,
-0.5442499, -0.7944464, -2.318609, 0, 0, 0, 1, 1,
-0.5418634, -0.5459951, -1.830371, 0, 0, 0, 1, 1,
-0.5417799, 1.68664, -0.7342766, 1, 1, 1, 1, 1,
-0.5409006, 0.9196891, -0.2757364, 1, 1, 1, 1, 1,
-0.5398791, 0.6343891, -0.4060055, 1, 1, 1, 1, 1,
-0.5365633, 0.7189243, -1.15214, 1, 1, 1, 1, 1,
-0.5279104, 0.5824375, -0.2487361, 1, 1, 1, 1, 1,
-0.5110573, 0.1104809, -3.112302, 1, 1, 1, 1, 1,
-0.5105677, 0.2976303, -1.204799, 1, 1, 1, 1, 1,
-0.5089523, -1.905937, -3.222606, 1, 1, 1, 1, 1,
-0.5073327, 0.5279465, -1.701768, 1, 1, 1, 1, 1,
-0.5069814, 0.9179491, 0.4893283, 1, 1, 1, 1, 1,
-0.5035338, -2.191795, -4.105022, 1, 1, 1, 1, 1,
-0.5033095, -0.7571573, -0.7237154, 1, 1, 1, 1, 1,
-0.5029972, -0.2263666, -1.173745, 1, 1, 1, 1, 1,
-0.49782, 0.05964916, -1.619537, 1, 1, 1, 1, 1,
-0.494061, 0.8529832, -0.8940212, 1, 1, 1, 1, 1,
-0.4911077, 0.8362977, -0.3231121, 0, 0, 1, 1, 1,
-0.4878055, -0.4685217, -4.333968, 1, 0, 0, 1, 1,
-0.4866784, -0.9588681, -2.991414, 1, 0, 0, 1, 1,
-0.4855205, -1.862876, -3.3282, 1, 0, 0, 1, 1,
-0.4824733, -0.4051104, -1.447995, 1, 0, 0, 1, 1,
-0.4777782, 0.1959577, -0.6463953, 1, 0, 0, 1, 1,
-0.4767004, 0.8279015, -0.7826868, 0, 0, 0, 1, 1,
-0.4734808, 1.736368, 1.534696, 0, 0, 0, 1, 1,
-0.4709271, -0.7576025, 0.07308006, 0, 0, 0, 1, 1,
-0.4684091, -0.5431666, -1.775087, 0, 0, 0, 1, 1,
-0.4668312, 1.333637, -1.11918, 0, 0, 0, 1, 1,
-0.4612964, 2.548227, -2.77227, 0, 0, 0, 1, 1,
-0.459593, 0.3010941, -0.9895224, 0, 0, 0, 1, 1,
-0.4565728, -0.6090385, -1.770287, 1, 1, 1, 1, 1,
-0.453721, 0.009989772, -1.204388, 1, 1, 1, 1, 1,
-0.4532241, -1.139096, -3.409115, 1, 1, 1, 1, 1,
-0.453015, -1.224278, -3.85027, 1, 1, 1, 1, 1,
-0.4522468, -0.8040482, -1.993683, 1, 1, 1, 1, 1,
-0.4490562, -0.8981161, -2.923695, 1, 1, 1, 1, 1,
-0.445889, 1.768806, 0.08508708, 1, 1, 1, 1, 1,
-0.4455409, 0.05914695, -2.305098, 1, 1, 1, 1, 1,
-0.4415968, -0.6702997, -4.817204, 1, 1, 1, 1, 1,
-0.4386794, 1.088034, -1.590702, 1, 1, 1, 1, 1,
-0.4375274, 1.251972, -0.2606239, 1, 1, 1, 1, 1,
-0.4374612, 0.3279011, -0.8515357, 1, 1, 1, 1, 1,
-0.4336944, 0.6598176, 0.4661312, 1, 1, 1, 1, 1,
-0.4298276, -0.3561206, -1.635736, 1, 1, 1, 1, 1,
-0.4295506, 0.5369111, 0.9193365, 1, 1, 1, 1, 1,
-0.4236186, 0.4450947, -0.1864965, 0, 0, 1, 1, 1,
-0.4228306, -1.317333, -4.00086, 1, 0, 0, 1, 1,
-0.4225942, 0.2929446, -0.5310045, 1, 0, 0, 1, 1,
-0.4222952, 0.930036, -1.157744, 1, 0, 0, 1, 1,
-0.418795, 0.5533504, -0.08554374, 1, 0, 0, 1, 1,
-0.4152163, 1.580395, -1.079286, 1, 0, 0, 1, 1,
-0.4151709, -1.225726, -3.350356, 0, 0, 0, 1, 1,
-0.4144953, 0.394338, -0.5927501, 0, 0, 0, 1, 1,
-0.4137917, -0.1301966, -1.742889, 0, 0, 0, 1, 1,
-0.4125096, -2.12322, -3.10404, 0, 0, 0, 1, 1,
-0.4117481, 0.961002, -0.3516057, 0, 0, 0, 1, 1,
-0.4108444, -1.00656, -1.82591, 0, 0, 0, 1, 1,
-0.4049091, -0.281378, -2.689715, 0, 0, 0, 1, 1,
-0.4019269, -0.3866007, -1.178946, 1, 1, 1, 1, 1,
-0.4004939, -0.5550446, -1.748705, 1, 1, 1, 1, 1,
-0.3987417, 1.738404, -1.754678, 1, 1, 1, 1, 1,
-0.3939476, -0.3568215, -2.150058, 1, 1, 1, 1, 1,
-0.3922542, -1.331995, -2.947987, 1, 1, 1, 1, 1,
-0.386098, 0.2433639, -0.09126554, 1, 1, 1, 1, 1,
-0.3847638, 0.4877263, -0.4626851, 1, 1, 1, 1, 1,
-0.3847439, 0.2173743, -2.38696, 1, 1, 1, 1, 1,
-0.3835514, -0.4299046, -1.447842, 1, 1, 1, 1, 1,
-0.3824435, 0.8952452, 0.1293209, 1, 1, 1, 1, 1,
-0.3815463, 0.9981592, -1.108086, 1, 1, 1, 1, 1,
-0.3798982, -0.0610178, -1.991651, 1, 1, 1, 1, 1,
-0.3750834, 1.069242, -0.7027479, 1, 1, 1, 1, 1,
-0.370991, 0.5754204, 0.797213, 1, 1, 1, 1, 1,
-0.3690133, -1.319177, -2.664803, 1, 1, 1, 1, 1,
-0.3666542, -0.5686753, -3.503647, 0, 0, 1, 1, 1,
-0.3642187, -1.297776, -1.667228, 1, 0, 0, 1, 1,
-0.3636481, -0.6130955, 0.4137309, 1, 0, 0, 1, 1,
-0.363522, 0.5492338, -1.105957, 1, 0, 0, 1, 1,
-0.3614069, -0.4005511, -1.323414, 1, 0, 0, 1, 1,
-0.3603805, -2.052778, -3.271948, 1, 0, 0, 1, 1,
-0.3598014, 0.2046881, -1.296009, 0, 0, 0, 1, 1,
-0.3482817, -0.2985804, -1.53283, 0, 0, 0, 1, 1,
-0.3479046, 0.9615897, 1.025894, 0, 0, 0, 1, 1,
-0.3390757, -0.5109379, -2.426315, 0, 0, 0, 1, 1,
-0.3384382, 0.6639751, 1.071917, 0, 0, 0, 1, 1,
-0.3376339, -1.064681, -2.158863, 0, 0, 0, 1, 1,
-0.3375646, 1.039675, -1.3501, 0, 0, 0, 1, 1,
-0.3348131, 0.3986683, -0.1956354, 1, 1, 1, 1, 1,
-0.3279531, 0.556905, -0.3925987, 1, 1, 1, 1, 1,
-0.3270781, -0.9869249, -3.188204, 1, 1, 1, 1, 1,
-0.3253911, 1.588074, -0.4490275, 1, 1, 1, 1, 1,
-0.3251787, -1.096025, -2.493338, 1, 1, 1, 1, 1,
-0.3238064, -0.9923953, -2.872382, 1, 1, 1, 1, 1,
-0.3224356, -0.02195866, -0.1725333, 1, 1, 1, 1, 1,
-0.3208537, -0.3742458, -4.332842, 1, 1, 1, 1, 1,
-0.320015, -1.253429, -3.406514, 1, 1, 1, 1, 1,
-0.3199586, 1.417862, -0.9694102, 1, 1, 1, 1, 1,
-0.3050295, -0.8867736, -1.35643, 1, 1, 1, 1, 1,
-0.3024587, -0.1924028, 0.0776993, 1, 1, 1, 1, 1,
-0.3017442, -0.1352978, -1.593515, 1, 1, 1, 1, 1,
-0.3000446, 0.8913515, -0.9464098, 1, 1, 1, 1, 1,
-0.2999134, -1.319445, -3.321222, 1, 1, 1, 1, 1,
-0.2932295, -0.5045431, -2.989338, 0, 0, 1, 1, 1,
-0.2876881, -0.02890184, -2.828513, 1, 0, 0, 1, 1,
-0.2861434, 1.072303, 0.4633296, 1, 0, 0, 1, 1,
-0.2856616, -1.061706, -2.910836, 1, 0, 0, 1, 1,
-0.2825493, -2.737549, -3.824948, 1, 0, 0, 1, 1,
-0.2822933, 1.023723, 1.199855, 1, 0, 0, 1, 1,
-0.2818826, -0.2677398, -0.8394484, 0, 0, 0, 1, 1,
-0.2780761, -0.5624657, -1.486576, 0, 0, 0, 1, 1,
-0.2738799, 0.1018049, -1.974005, 0, 0, 0, 1, 1,
-0.2723029, 0.1624653, -0.5918658, 0, 0, 0, 1, 1,
-0.2721883, -0.2733909, -2.874853, 0, 0, 0, 1, 1,
-0.2699162, -0.4826172, -1.868893, 0, 0, 0, 1, 1,
-0.2690701, 0.2536297, -0.6582333, 0, 0, 0, 1, 1,
-0.2682617, -0.8691669, -0.8267214, 1, 1, 1, 1, 1,
-0.2608382, -0.2800509, -2.265816, 1, 1, 1, 1, 1,
-0.25849, -1.194677, -2.464599, 1, 1, 1, 1, 1,
-0.2538528, -0.9771017, -4.871074, 1, 1, 1, 1, 1,
-0.2536521, -0.4073176, -2.252883, 1, 1, 1, 1, 1,
-0.250882, 0.5717017, 0.3231333, 1, 1, 1, 1, 1,
-0.2436667, -0.5477322, -4.978847, 1, 1, 1, 1, 1,
-0.2434626, 0.3698183, 0.004249808, 1, 1, 1, 1, 1,
-0.2428376, -0.6054026, -3.164299, 1, 1, 1, 1, 1,
-0.2394908, 1.410747, -0.109158, 1, 1, 1, 1, 1,
-0.2389325, -0.1081471, -2.620439, 1, 1, 1, 1, 1,
-0.2357994, -0.4695416, -3.247534, 1, 1, 1, 1, 1,
-0.2324194, -0.5854374, -2.632091, 1, 1, 1, 1, 1,
-0.2237255, -0.2921948, -2.824233, 1, 1, 1, 1, 1,
-0.221476, -1.43504, -1.823126, 1, 1, 1, 1, 1,
-0.2211007, -0.3703578, -0.7126054, 0, 0, 1, 1, 1,
-0.220255, -2.006224, -2.964129, 1, 0, 0, 1, 1,
-0.2180819, 0.6545019, -0.4199034, 1, 0, 0, 1, 1,
-0.2176156, -1.046046, -2.282941, 1, 0, 0, 1, 1,
-0.217373, 0.3568105, 0.06006658, 1, 0, 0, 1, 1,
-0.2173502, 1.623739, 0.3070848, 1, 0, 0, 1, 1,
-0.2167273, -0.5854991, -2.934486, 0, 0, 0, 1, 1,
-0.2165903, -2.668133, -4.302734, 0, 0, 0, 1, 1,
-0.2163447, -0.4696157, -1.106417, 0, 0, 0, 1, 1,
-0.2152322, 1.012734, -2.690369, 0, 0, 0, 1, 1,
-0.2135908, -0.423167, -0.5828066, 0, 0, 0, 1, 1,
-0.2115643, 0.9724271, -0.2346307, 0, 0, 0, 1, 1,
-0.2108788, 1.740018, 0.1863701, 0, 0, 0, 1, 1,
-0.2086508, -0.654218, -3.597541, 1, 1, 1, 1, 1,
-0.2086406, 0.2329163, -2.026894, 1, 1, 1, 1, 1,
-0.2068838, -0.8528039, -4.010611, 1, 1, 1, 1, 1,
-0.205291, -0.1124203, -3.359213, 1, 1, 1, 1, 1,
-0.2019762, 0.5034813, -1.349342, 1, 1, 1, 1, 1,
-0.199054, 0.8244836, 0.8802266, 1, 1, 1, 1, 1,
-0.1972047, 0.4112256, -0.365506, 1, 1, 1, 1, 1,
-0.1932281, -0.7041705, -3.431152, 1, 1, 1, 1, 1,
-0.1915123, -0.9400244, -2.518486, 1, 1, 1, 1, 1,
-0.1894552, -0.3020879, -1.106965, 1, 1, 1, 1, 1,
-0.1882749, 0.281128, 0.1001208, 1, 1, 1, 1, 1,
-0.185931, -2.015947, -2.832, 1, 1, 1, 1, 1,
-0.1824387, -0.4887097, -5.380451, 1, 1, 1, 1, 1,
-0.1810505, 1.667447, 0.2667335, 1, 1, 1, 1, 1,
-0.1737574, -0.9725546, -1.059968, 1, 1, 1, 1, 1,
-0.1732605, 0.2552905, 0.6781248, 0, 0, 1, 1, 1,
-0.1717718, -0.188027, -2.350909, 1, 0, 0, 1, 1,
-0.1681075, 0.6707144, -1.74448, 1, 0, 0, 1, 1,
-0.1677661, -0.4179588, -2.035729, 1, 0, 0, 1, 1,
-0.1667314, 0.3661812, -0.5021705, 1, 0, 0, 1, 1,
-0.1662636, -0.2226405, -2.608293, 1, 0, 0, 1, 1,
-0.1637678, 0.5710553, -0.4169051, 0, 0, 0, 1, 1,
-0.1594786, 2.258767, 0.3430961, 0, 0, 0, 1, 1,
-0.1584083, -0.9802441, -3.011876, 0, 0, 0, 1, 1,
-0.154527, -0.1373152, -2.825856, 0, 0, 0, 1, 1,
-0.1534362, -0.9817631, -2.852089, 0, 0, 0, 1, 1,
-0.1522842, -0.923584, -3.443477, 0, 0, 0, 1, 1,
-0.148958, -0.6542466, -3.970526, 0, 0, 0, 1, 1,
-0.1457293, 0.7948093, 0.2012319, 1, 1, 1, 1, 1,
-0.1416913, -0.8618382, -2.94993, 1, 1, 1, 1, 1,
-0.136704, -0.1701495, -0.779166, 1, 1, 1, 1, 1,
-0.1355921, 2.220111, 0.6783614, 1, 1, 1, 1, 1,
-0.1336891, 0.794183, 1.147234, 1, 1, 1, 1, 1,
-0.1330977, -0.4939036, -3.417098, 1, 1, 1, 1, 1,
-0.1309298, 0.518564, -0.6184786, 1, 1, 1, 1, 1,
-0.1296741, -0.4577455, -2.956318, 1, 1, 1, 1, 1,
-0.1292993, -1.578667, -2.336921, 1, 1, 1, 1, 1,
-0.1273286, 0.183212, -0.01856037, 1, 1, 1, 1, 1,
-0.1249626, 0.7178057, 0.1470786, 1, 1, 1, 1, 1,
-0.1207068, -0.001336268, -3.176852, 1, 1, 1, 1, 1,
-0.1203541, 1.944745, 0.2271509, 1, 1, 1, 1, 1,
-0.1153013, 0.356638, -0.9054033, 1, 1, 1, 1, 1,
-0.1148318, 0.5232097, 0.4353116, 1, 1, 1, 1, 1,
-0.1115624, 0.8016054, -0.4140168, 0, 0, 1, 1, 1,
-0.1106807, -0.6195937, -1.74527, 1, 0, 0, 1, 1,
-0.1106408, -1.007322, -2.933334, 1, 0, 0, 1, 1,
-0.1093838, -0.7083327, -3.348852, 1, 0, 0, 1, 1,
-0.1087718, -0.9971675, -4.169915, 1, 0, 0, 1, 1,
-0.1080258, 0.6516328, -2.420427, 1, 0, 0, 1, 1,
-0.1076131, -0.7518687, -3.086609, 0, 0, 0, 1, 1,
-0.1069299, 0.2914294, -0.8585769, 0, 0, 0, 1, 1,
-0.1066036, -0.2646073, -3.506086, 0, 0, 0, 1, 1,
-0.1033815, 1.508643, 0.356687, 0, 0, 0, 1, 1,
-0.1028557, 0.1013614, -1.742294, 0, 0, 0, 1, 1,
-0.08613683, -1.460168, -2.425447, 0, 0, 0, 1, 1,
-0.08463233, -1.112732, -4.743483, 0, 0, 0, 1, 1,
-0.08189775, -0.9854605, -4.633807, 1, 1, 1, 1, 1,
-0.08163623, -0.6910431, -1.254685, 1, 1, 1, 1, 1,
-0.07702929, 0.646345, 0.3042124, 1, 1, 1, 1, 1,
-0.07262125, -0.4273814, -3.735246, 1, 1, 1, 1, 1,
-0.0674755, -0.272002, -1.112221, 1, 1, 1, 1, 1,
-0.06639839, 0.0264479, -0.8961294, 1, 1, 1, 1, 1,
-0.0642853, -1.259474, -1.71832, 1, 1, 1, 1, 1,
-0.06083828, 0.9301695, 1.359619, 1, 1, 1, 1, 1,
-0.06032399, 0.994646, 0.06857537, 1, 1, 1, 1, 1,
-0.0574476, -0.7495721, -3.198149, 1, 1, 1, 1, 1,
-0.05566534, -0.5842465, -2.737598, 1, 1, 1, 1, 1,
-0.05472799, 1.647609, 0.1663258, 1, 1, 1, 1, 1,
-0.05439168, -0.6014944, -1.90562, 1, 1, 1, 1, 1,
-0.05094348, 0.4087882, -2.17811, 1, 1, 1, 1, 1,
-0.04966713, 1.579267, 0.9309397, 1, 1, 1, 1, 1,
-0.04896316, -0.4189214, -3.711515, 0, 0, 1, 1, 1,
-0.04604193, -1.547499, -3.028909, 1, 0, 0, 1, 1,
-0.04323742, 0.6634538, 0.9957732, 1, 0, 0, 1, 1,
-0.04082269, 0.147196, -0.6610606, 1, 0, 0, 1, 1,
-0.03760458, 0.7346442, 0.9742607, 1, 0, 0, 1, 1,
-0.03221316, -0.02206087, -1.719729, 1, 0, 0, 1, 1,
-0.02768193, -1.034205, -3.657124, 0, 0, 0, 1, 1,
-0.02745013, -0.2280229, -2.77783, 0, 0, 0, 1, 1,
-0.02619366, -1.128425, -3.480147, 0, 0, 0, 1, 1,
-0.02553093, -0.7508957, -1.954349, 0, 0, 0, 1, 1,
-0.02078819, 0.2698475, -1.303565, 0, 0, 0, 1, 1,
-0.02000642, 0.1290521, 0.5755132, 0, 0, 0, 1, 1,
-0.01765368, -0.4437797, -3.529558, 0, 0, 0, 1, 1,
-0.01761888, 0.06931205, 0.7733444, 1, 1, 1, 1, 1,
-0.01723978, -0.935138, -2.317682, 1, 1, 1, 1, 1,
-0.01446482, 0.7663409, 0.08504035, 1, 1, 1, 1, 1,
-0.01335201, 1.120121, -1.085895, 1, 1, 1, 1, 1,
-0.008477882, -0.4580528, -1.790275, 1, 1, 1, 1, 1,
-0.004298382, -0.163033, -3.225811, 1, 1, 1, 1, 1,
0.0005039683, 0.4114894, 1.634449, 1, 1, 1, 1, 1,
0.002804231, -0.5404368, 3.670199, 1, 1, 1, 1, 1,
0.00535095, -1.033523, 3.111134, 1, 1, 1, 1, 1,
0.009678328, -0.05085936, 3.815358, 1, 1, 1, 1, 1,
0.01081785, 0.9118647, 0.08536676, 1, 1, 1, 1, 1,
0.01209743, 0.6582688, 0.4205651, 1, 1, 1, 1, 1,
0.01356649, -0.3028288, 3.562557, 1, 1, 1, 1, 1,
0.01717933, -0.1058862, 2.449647, 1, 1, 1, 1, 1,
0.01830136, 0.1571989, 0.1372506, 1, 1, 1, 1, 1,
0.02232116, -0.1811076, 2.682431, 0, 0, 1, 1, 1,
0.02314402, -0.6690677, 4.034957, 1, 0, 0, 1, 1,
0.02446999, 0.8367966, -0.7352462, 1, 0, 0, 1, 1,
0.02481584, -0.3737484, 3.132176, 1, 0, 0, 1, 1,
0.03327858, 0.6166559, -0.4318922, 1, 0, 0, 1, 1,
0.03923641, -1.009466, 4.157178, 1, 0, 0, 1, 1,
0.04239829, 0.5971341, 1.956152, 0, 0, 0, 1, 1,
0.04341912, 1.713825, 0.9159643, 0, 0, 0, 1, 1,
0.04544934, -0.7354438, 0.8336214, 0, 0, 0, 1, 1,
0.05147224, -1.980028, 3.951737, 0, 0, 0, 1, 1,
0.05445063, 0.3606253, -0.2235453, 0, 0, 0, 1, 1,
0.06643498, -0.1279947, 3.912072, 0, 0, 0, 1, 1,
0.06791073, -1.062173, 4.123943, 0, 0, 0, 1, 1,
0.07217853, 0.4370049, -1.135523, 1, 1, 1, 1, 1,
0.07291547, 0.3709247, 1.286171, 1, 1, 1, 1, 1,
0.07437724, -0.3056988, 4.73381, 1, 1, 1, 1, 1,
0.07788274, 0.7871692, 0.9890732, 1, 1, 1, 1, 1,
0.08203466, -0.2762175, 3.036005, 1, 1, 1, 1, 1,
0.0855846, 0.3381377, 1.268297, 1, 1, 1, 1, 1,
0.08848177, -0.3782558, 3.547747, 1, 1, 1, 1, 1,
0.09058103, -0.5396913, 3.618757, 1, 1, 1, 1, 1,
0.09246834, 0.005317954, 2.401346, 1, 1, 1, 1, 1,
0.09662914, -0.8675619, 2.682582, 1, 1, 1, 1, 1,
0.09756611, 1.071246, 0.1754451, 1, 1, 1, 1, 1,
0.1046191, -0.7704288, 3.15636, 1, 1, 1, 1, 1,
0.1053121, -0.4032988, 1.450474, 1, 1, 1, 1, 1,
0.1053297, -0.84299, 0.7481611, 1, 1, 1, 1, 1,
0.106244, -0.898036, 2.809571, 1, 1, 1, 1, 1,
0.111556, 0.2939953, 1.180922, 0, 0, 1, 1, 1,
0.1128659, 0.9294232, 0.763272, 1, 0, 0, 1, 1,
0.1136984, 0.4805846, 0.5768188, 1, 0, 0, 1, 1,
0.114575, -1.49533, 2.971098, 1, 0, 0, 1, 1,
0.1170687, 0.7436935, -0.342636, 1, 0, 0, 1, 1,
0.1176998, -0.3994021, 4.074788, 1, 0, 0, 1, 1,
0.1218783, -0.3585275, 3.917711, 0, 0, 0, 1, 1,
0.1270537, -0.09493242, 1.889572, 0, 0, 0, 1, 1,
0.1308001, -1.026843, 2.734687, 0, 0, 0, 1, 1,
0.133191, 0.03897109, 0.8049934, 0, 0, 0, 1, 1,
0.134515, -1.590498, 2.73666, 0, 0, 0, 1, 1,
0.1346162, -1.352973, 2.682864, 0, 0, 0, 1, 1,
0.136992, -1.316452, 1.703439, 0, 0, 0, 1, 1,
0.1396402, -1.200765, 2.890101, 1, 1, 1, 1, 1,
0.1453228, 0.5429963, 0.8338518, 1, 1, 1, 1, 1,
0.1469058, -0.2247447, 1.937413, 1, 1, 1, 1, 1,
0.1509309, -1.54881, 3.858804, 1, 1, 1, 1, 1,
0.1532034, -1.125956, 2.861701, 1, 1, 1, 1, 1,
0.1561462, 0.5750452, 1.009695, 1, 1, 1, 1, 1,
0.1575741, -0.4856266, 1.757476, 1, 1, 1, 1, 1,
0.1590652, -1.51698, 3.555274, 1, 1, 1, 1, 1,
0.1594726, -1.037777, 3.579969, 1, 1, 1, 1, 1,
0.1644674, -0.1615692, 3.041145, 1, 1, 1, 1, 1,
0.1664358, -0.8027726, 2.637554, 1, 1, 1, 1, 1,
0.1683998, 0.6896658, -0.8581775, 1, 1, 1, 1, 1,
0.1687012, -0.174754, 2.893106, 1, 1, 1, 1, 1,
0.1710511, -1.803445, 3.016465, 1, 1, 1, 1, 1,
0.1716607, 1.660986, -0.09411579, 1, 1, 1, 1, 1,
0.171678, 0.6106603, 1.753537, 0, 0, 1, 1, 1,
0.1719842, -1.017321, 4.395875, 1, 0, 0, 1, 1,
0.175126, -0.9996722, 2.839581, 1, 0, 0, 1, 1,
0.1820219, 0.3473523, 0.6356222, 1, 0, 0, 1, 1,
0.1836652, -0.1720067, 4.694957, 1, 0, 0, 1, 1,
0.1910682, 0.4344025, 1.901046, 1, 0, 0, 1, 1,
0.1917621, 0.9172932, 0.9483719, 0, 0, 0, 1, 1,
0.1944164, 0.04754368, 0.7759287, 0, 0, 0, 1, 1,
0.1946935, 0.495668, 0.8973802, 0, 0, 0, 1, 1,
0.1989856, 1.220372, -1.151546, 0, 0, 0, 1, 1,
0.2040004, 0.2152774, 1.755476, 0, 0, 0, 1, 1,
0.2044939, 0.5253535, 1.810493, 0, 0, 0, 1, 1,
0.2047744, 1.021864, -0.3903375, 0, 0, 0, 1, 1,
0.207565, -1.612323, 1.108802, 1, 1, 1, 1, 1,
0.2077065, -0.1603945, 2.883817, 1, 1, 1, 1, 1,
0.2081352, -1.231057, 4.320103, 1, 1, 1, 1, 1,
0.208666, -0.04655291, 1.161105, 1, 1, 1, 1, 1,
0.212229, -1.366702, 3.684267, 1, 1, 1, 1, 1,
0.2126304, -0.5516006, 2.992325, 1, 1, 1, 1, 1,
0.2136987, -0.3704337, 2.965924, 1, 1, 1, 1, 1,
0.2153338, -1.606658, 3.10891, 1, 1, 1, 1, 1,
0.2159874, -0.4368127, 1.167483, 1, 1, 1, 1, 1,
0.219154, -0.9935658, 2.70208, 1, 1, 1, 1, 1,
0.2201438, -0.9784625, 3.093631, 1, 1, 1, 1, 1,
0.221924, -0.5871388, 3.041157, 1, 1, 1, 1, 1,
0.226802, 1.086915, -0.7792191, 1, 1, 1, 1, 1,
0.2355837, 0.6374521, 0.6082285, 1, 1, 1, 1, 1,
0.2360069, -0.3656373, 2.342291, 1, 1, 1, 1, 1,
0.238895, -0.4144687, 3.134158, 0, 0, 1, 1, 1,
0.2475246, -0.6591078, 3.730325, 1, 0, 0, 1, 1,
0.2483755, -0.7642682, 3.180607, 1, 0, 0, 1, 1,
0.2544291, -1.236104, 2.98538, 1, 0, 0, 1, 1,
0.2601742, -0.6982355, 2.376795, 1, 0, 0, 1, 1,
0.2616146, 0.4676664, 0.6870441, 1, 0, 0, 1, 1,
0.2647164, 0.6265819, 1.658923, 0, 0, 0, 1, 1,
0.2662918, 0.09321931, 1.726172, 0, 0, 0, 1, 1,
0.2669598, 1.756862, 0.4768931, 0, 0, 0, 1, 1,
0.2684022, -0.4240501, 1.069643, 0, 0, 0, 1, 1,
0.2756849, 0.8682849, 1.940985, 0, 0, 0, 1, 1,
0.2801213, 1.170486, -0.4388331, 0, 0, 0, 1, 1,
0.2805169, 0.8867139, 0.8466935, 0, 0, 0, 1, 1,
0.2834711, -1.463512, 1.613476, 1, 1, 1, 1, 1,
0.2840871, 0.2171237, 2.622522, 1, 1, 1, 1, 1,
0.2896857, 0.928975, -0.7760602, 1, 1, 1, 1, 1,
0.2902573, 0.5543346, 0.7052931, 1, 1, 1, 1, 1,
0.2920095, 2.339542, 1.976901, 1, 1, 1, 1, 1,
0.2965162, -0.6523548, 2.256332, 1, 1, 1, 1, 1,
0.3009413, 1.508506, 0.154961, 1, 1, 1, 1, 1,
0.303004, 0.2433232, 0.6522961, 1, 1, 1, 1, 1,
0.3062127, -0.7405327, 2.035471, 1, 1, 1, 1, 1,
0.3082745, 1.567428, 1.046784, 1, 1, 1, 1, 1,
0.3094044, -1.774205, 3.829231, 1, 1, 1, 1, 1,
0.3116848, 2.242349, 0.733061, 1, 1, 1, 1, 1,
0.316027, -0.322933, 3.801486, 1, 1, 1, 1, 1,
0.3172231, -1.401778, 1.174499, 1, 1, 1, 1, 1,
0.3207931, 0.1620798, 2.084352, 1, 1, 1, 1, 1,
0.3216465, -2.65903, 1.566365, 0, 0, 1, 1, 1,
0.3258405, 0.8975549, 0.5386633, 1, 0, 0, 1, 1,
0.326162, 0.8882727, -1.35977, 1, 0, 0, 1, 1,
0.3267563, 1.257659, 1.745925, 1, 0, 0, 1, 1,
0.3269744, -0.0387446, 1.006163, 1, 0, 0, 1, 1,
0.3373225, 2.691565, 2.353757, 1, 0, 0, 1, 1,
0.337421, -0.9456177, 3.129087, 0, 0, 0, 1, 1,
0.3377532, 1.613783, -0.7306113, 0, 0, 0, 1, 1,
0.3384343, 0.4265683, 0.04268203, 0, 0, 0, 1, 1,
0.3411957, 0.6705952, 0.4424212, 0, 0, 0, 1, 1,
0.3424432, -2.322135, 3.052572, 0, 0, 0, 1, 1,
0.3459128, -0.5602123, 3.709322, 0, 0, 0, 1, 1,
0.3463439, 0.3950629, 0.2255258, 0, 0, 0, 1, 1,
0.3526846, -0.9633495, 3.882457, 1, 1, 1, 1, 1,
0.3601426, -1.351105, 3.141815, 1, 1, 1, 1, 1,
0.3680786, -0.8295182, 3.060425, 1, 1, 1, 1, 1,
0.3709961, 0.3603964, 1.203158, 1, 1, 1, 1, 1,
0.3722029, 1.599344, 0.4489298, 1, 1, 1, 1, 1,
0.3733614, 0.9330335, -0.6662177, 1, 1, 1, 1, 1,
0.3795323, -0.6270389, 1.821179, 1, 1, 1, 1, 1,
0.3848489, -0.193881, 2.475102, 1, 1, 1, 1, 1,
0.3871026, -0.3763566, 1.666149, 1, 1, 1, 1, 1,
0.3908756, 1.005245, -0.5215768, 1, 1, 1, 1, 1,
0.3931788, -2.157887, 4.139123, 1, 1, 1, 1, 1,
0.3942114, -0.3558293, 3.176271, 1, 1, 1, 1, 1,
0.3971725, 0.6613787, 0.281031, 1, 1, 1, 1, 1,
0.3995205, -0.7321379, 2.000356, 1, 1, 1, 1, 1,
0.4043467, 0.2082861, 0.7535587, 1, 1, 1, 1, 1,
0.4055324, 0.1373745, 1.46375, 0, 0, 1, 1, 1,
0.4089674, -1.741871, 2.384539, 1, 0, 0, 1, 1,
0.4106006, -0.6635235, 2.116905, 1, 0, 0, 1, 1,
0.4109831, -0.625257, 3.085072, 1, 0, 0, 1, 1,
0.4118429, 0.1431537, 1.590253, 1, 0, 0, 1, 1,
0.4123962, 0.4794431, 1.67335, 1, 0, 0, 1, 1,
0.4127063, -0.3796176, 0.387274, 0, 0, 0, 1, 1,
0.4166929, -0.7213756, 3.381105, 0, 0, 0, 1, 1,
0.4206083, 0.2652362, 1.566903, 0, 0, 0, 1, 1,
0.4277793, 0.6065775, 0.6764678, 0, 0, 0, 1, 1,
0.4279869, 0.5631414, 1.432819, 0, 0, 0, 1, 1,
0.4287637, 0.2837689, 0.5544129, 0, 0, 0, 1, 1,
0.429177, -1.935362, 3.825958, 0, 0, 0, 1, 1,
0.4300805, -0.6710181, 3.212182, 1, 1, 1, 1, 1,
0.4343489, -0.4995891, 2.017836, 1, 1, 1, 1, 1,
0.4395698, -0.01801432, 1.525442, 1, 1, 1, 1, 1,
0.4427278, 1.096758, -1.55321, 1, 1, 1, 1, 1,
0.4427759, -0.4834669, 3.849921, 1, 1, 1, 1, 1,
0.4482691, 0.4375807, -0.07715181, 1, 1, 1, 1, 1,
0.4544806, 0.9463981, 1.737456, 1, 1, 1, 1, 1,
0.4552227, 0.4982996, 0.5998568, 1, 1, 1, 1, 1,
0.4573379, -1.285207, 4.262405, 1, 1, 1, 1, 1,
0.4582435, 0.5857814, 0.997264, 1, 1, 1, 1, 1,
0.4605769, 1.877109, 0.7646516, 1, 1, 1, 1, 1,
0.4644857, -1.339999, 2.817958, 1, 1, 1, 1, 1,
0.4669081, -0.5115017, 2.409107, 1, 1, 1, 1, 1,
0.4713647, -0.944493, 2.873579, 1, 1, 1, 1, 1,
0.4737417, -1.49402, 3.119091, 1, 1, 1, 1, 1,
0.4755334, -0.8694516, 2.184261, 0, 0, 1, 1, 1,
0.4755633, 0.007148612, 1.480344, 1, 0, 0, 1, 1,
0.4760106, -1.739509, 4.171672, 1, 0, 0, 1, 1,
0.480783, 0.8231658, 0.5697043, 1, 0, 0, 1, 1,
0.4880605, -0.1989063, -0.001970082, 1, 0, 0, 1, 1,
0.4972778, 1.25399, 1.042359, 1, 0, 0, 1, 1,
0.5025889, -0.08087035, 2.928865, 0, 0, 0, 1, 1,
0.5050235, 0.9511454, 1.868149, 0, 0, 0, 1, 1,
0.5060997, -0.453366, 1.805929, 0, 0, 0, 1, 1,
0.5077673, -0.8894337, 2.759991, 0, 0, 0, 1, 1,
0.5083788, -0.7959963, 4.243553, 0, 0, 0, 1, 1,
0.5085534, 0.7808705, -0.660974, 0, 0, 0, 1, 1,
0.5131139, 0.588888, 2.172033, 0, 0, 0, 1, 1,
0.5159693, 1.329281, 0.6674861, 1, 1, 1, 1, 1,
0.5213302, -1.044309, 3.101231, 1, 1, 1, 1, 1,
0.5215132, -2.335951, 1.531282, 1, 1, 1, 1, 1,
0.5240187, -0.4608833, 4.119566, 1, 1, 1, 1, 1,
0.5240768, -0.3682173, 2.943807, 1, 1, 1, 1, 1,
0.5286832, 0.5460817, 0.08204881, 1, 1, 1, 1, 1,
0.5308244, 0.8126932, 1.678902, 1, 1, 1, 1, 1,
0.5358818, -0.1268208, 1.999147, 1, 1, 1, 1, 1,
0.5414959, 1.642463, 0.2007562, 1, 1, 1, 1, 1,
0.5430085, -1.807111, 1.954157, 1, 1, 1, 1, 1,
0.5438089, -1.764875, 4.104599, 1, 1, 1, 1, 1,
0.5471575, -1.186529, 3.402681, 1, 1, 1, 1, 1,
0.5479279, 0.9650596, 2.020785, 1, 1, 1, 1, 1,
0.5499368, 0.3800681, 0.8401843, 1, 1, 1, 1, 1,
0.55527, -1.526436, 2.34962, 1, 1, 1, 1, 1,
0.5562952, 0.9824504, 1.664265, 0, 0, 1, 1, 1,
0.5585895, -0.5264741, 2.751069, 1, 0, 0, 1, 1,
0.5640309, 0.7837473, 1.048933, 1, 0, 0, 1, 1,
0.5645508, -0.5748102, 1.444806, 1, 0, 0, 1, 1,
0.5735693, 0.4697444, 0.4987261, 1, 0, 0, 1, 1,
0.5742298, -0.07053164, 1.533371, 1, 0, 0, 1, 1,
0.5777103, -1.526058, 3.638717, 0, 0, 0, 1, 1,
0.5815526, 0.09140933, 0.9864824, 0, 0, 0, 1, 1,
0.5834147, 0.9229614, 1.479893, 0, 0, 0, 1, 1,
0.5855813, 1.728897, 0.8712783, 0, 0, 0, 1, 1,
0.5862978, 0.833801, 1.36923, 0, 0, 0, 1, 1,
0.5896169, 2.133862, 1.783774, 0, 0, 0, 1, 1,
0.5907261, -1.333389, 3.09895, 0, 0, 0, 1, 1,
0.5926692, 0.3994161, -0.3303562, 1, 1, 1, 1, 1,
0.5950429, 0.719353, 1.952505, 1, 1, 1, 1, 1,
0.5965868, -1.361533, 3.626063, 1, 1, 1, 1, 1,
0.599323, -0.1608665, 1.003899, 1, 1, 1, 1, 1,
0.6144048, -0.4770926, 4.016026, 1, 1, 1, 1, 1,
0.6153675, -0.3338782, 2.715214, 1, 1, 1, 1, 1,
0.6212873, -0.7332212, 2.597693, 1, 1, 1, 1, 1,
0.6222838, -1.406824, 1.871905, 1, 1, 1, 1, 1,
0.6241149, -1.545359, 1.59409, 1, 1, 1, 1, 1,
0.6248865, 0.5622703, -0.6034352, 1, 1, 1, 1, 1,
0.6318243, -0.6137456, 1.458545, 1, 1, 1, 1, 1,
0.6345999, 0.1268392, 1.182337, 1, 1, 1, 1, 1,
0.6364771, -0.5239431, 2.266961, 1, 1, 1, 1, 1,
0.6366866, 1.655459, 0.6627015, 1, 1, 1, 1, 1,
0.6370641, -1.375368, 2.702194, 1, 1, 1, 1, 1,
0.6396393, -0.105384, 1.184715, 0, 0, 1, 1, 1,
0.6396734, 0.5692487, 2.432323, 1, 0, 0, 1, 1,
0.6402059, 2.052031, 2.049582, 1, 0, 0, 1, 1,
0.6422388, 0.105243, 1.590267, 1, 0, 0, 1, 1,
0.6439658, 2.128751, 0.4743123, 1, 0, 0, 1, 1,
0.6472826, 0.497627, -0.8348297, 1, 0, 0, 1, 1,
0.6483595, -0.1397697, 2.016106, 0, 0, 0, 1, 1,
0.6500493, -1.104658, 2.754029, 0, 0, 0, 1, 1,
0.6565277, 0.5383851, 1.316929, 0, 0, 0, 1, 1,
0.6667144, 1.846334, -0.1021415, 0, 0, 0, 1, 1,
0.6892434, -0.5533125, 0.9473523, 0, 0, 0, 1, 1,
0.6904418, -0.4234476, 1.650474, 0, 0, 0, 1, 1,
0.6934154, -1.36346, 0.9213895, 0, 0, 0, 1, 1,
0.6975275, 1.547624, -1.391143, 1, 1, 1, 1, 1,
0.6982546, 0.05744955, 2.134172, 1, 1, 1, 1, 1,
0.6987277, -0.5772686, 0.1340859, 1, 1, 1, 1, 1,
0.703714, 0.9959729, 3.052579, 1, 1, 1, 1, 1,
0.7038391, 0.4037687, 2.594488, 1, 1, 1, 1, 1,
0.7099978, 1.84854, 0.4237366, 1, 1, 1, 1, 1,
0.7125588, 0.7647859, 2.749852, 1, 1, 1, 1, 1,
0.7151295, 2.169113, -0.1922211, 1, 1, 1, 1, 1,
0.7172821, 0.1071268, 0.9018562, 1, 1, 1, 1, 1,
0.717699, 0.4856452, 2.221317, 1, 1, 1, 1, 1,
0.7199616, 0.9021896, 2.156918, 1, 1, 1, 1, 1,
0.7213724, 0.5132252, -0.07003934, 1, 1, 1, 1, 1,
0.7225597, 1.29582, 0.9540583, 1, 1, 1, 1, 1,
0.7237434, -1.6813, 2.513508, 1, 1, 1, 1, 1,
0.7256567, 0.433693, -0.5557768, 1, 1, 1, 1, 1,
0.726162, 0.1878246, 0.8407894, 0, 0, 1, 1, 1,
0.7299823, -3.501853e-05, 0.8462124, 1, 0, 0, 1, 1,
0.7309592, -1.399462, 1.842544, 1, 0, 0, 1, 1,
0.736603, 0.7643077, 0.3964849, 1, 0, 0, 1, 1,
0.7429472, -1.651032, 2.865502, 1, 0, 0, 1, 1,
0.7430046, -0.001633396, 0.8898869, 1, 0, 0, 1, 1,
0.7502602, 2.147967, 0.5761889, 0, 0, 0, 1, 1,
0.7531639, -1.064123, 2.994787, 0, 0, 0, 1, 1,
0.760833, 0.2626802, -0.02163676, 0, 0, 0, 1, 1,
0.7630092, 2.110119, -0.9456711, 0, 0, 0, 1, 1,
0.7667343, 1.363166, -0.2308634, 0, 0, 0, 1, 1,
0.7681851, 1.193412, 2.697684, 0, 0, 0, 1, 1,
0.7716196, 1.105654, -0.008535345, 0, 0, 0, 1, 1,
0.7738957, 0.1925356, 1.869157, 1, 1, 1, 1, 1,
0.7739288, 0.3781065, 2.134832, 1, 1, 1, 1, 1,
0.7857685, -1.543622, 2.840473, 1, 1, 1, 1, 1,
0.7875, -0.3984233, 0.3792324, 1, 1, 1, 1, 1,
0.7896023, -1.493472, 1.533831, 1, 1, 1, 1, 1,
0.7969978, 1.084534, 1.65255, 1, 1, 1, 1, 1,
0.7982407, 2.076685, 0.420842, 1, 1, 1, 1, 1,
0.8012407, -0.8937998, 1.941598, 1, 1, 1, 1, 1,
0.8051234, -0.1028802, 1.334272, 1, 1, 1, 1, 1,
0.8077899, -1.810984, 0.8556299, 1, 1, 1, 1, 1,
0.8102941, 2.268536, -0.4368119, 1, 1, 1, 1, 1,
0.8104405, -0.5164534, 3.241054, 1, 1, 1, 1, 1,
0.8112234, -1.32947, 2.450438, 1, 1, 1, 1, 1,
0.8140293, -0.7259812, 2.164463, 1, 1, 1, 1, 1,
0.8156488, 0.8200037, 0.02475249, 1, 1, 1, 1, 1,
0.8180733, -0.003145661, 1.65608, 0, 0, 1, 1, 1,
0.8269604, 0.2628831, 0.8276393, 1, 0, 0, 1, 1,
0.8349355, 0.3570705, 1.08786, 1, 0, 0, 1, 1,
0.8392022, 0.6494942, -1.500021, 1, 0, 0, 1, 1,
0.8409682, -1.458753, 1.985048, 1, 0, 0, 1, 1,
0.844358, -1.528645, 2.35139, 1, 0, 0, 1, 1,
0.848401, 0.3779573, 0.3351568, 0, 0, 0, 1, 1,
0.8510645, 0.8203115, 0.2026623, 0, 0, 0, 1, 1,
0.8536094, -0.002589996, 2.067913, 0, 0, 0, 1, 1,
0.8583099, 0.6852431, 2.427632, 0, 0, 0, 1, 1,
0.8692546, 0.2899474, 2.779768, 0, 0, 0, 1, 1,
0.8783965, -0.3252791, 0.5934256, 0, 0, 0, 1, 1,
0.8907573, -1.02729, 0.2812698, 0, 0, 0, 1, 1,
0.8914368, 0.2032651, 0.9534588, 1, 1, 1, 1, 1,
0.8947474, 0.7151369, 0.06086637, 1, 1, 1, 1, 1,
0.901999, 0.2442259, -0.6713079, 1, 1, 1, 1, 1,
0.9030609, -0.6802555, 3.470799, 1, 1, 1, 1, 1,
0.9034684, 0.6082458, 0.4002447, 1, 1, 1, 1, 1,
0.9051694, -0.1340052, 2.40308, 1, 1, 1, 1, 1,
0.9079779, 0.2091543, 1.356771, 1, 1, 1, 1, 1,
0.9123942, 0.8404732, -0.2062705, 1, 1, 1, 1, 1,
0.9160913, 1.724427, -1.382961, 1, 1, 1, 1, 1,
0.9217556, -0.7850449, 0.7582787, 1, 1, 1, 1, 1,
0.9241378, -1.616798, 1.891886, 1, 1, 1, 1, 1,
0.9272701, 0.6238129, 0.6675166, 1, 1, 1, 1, 1,
0.9358129, 0.03180077, 0.8274131, 1, 1, 1, 1, 1,
0.9387789, -0.4368955, 2.333856, 1, 1, 1, 1, 1,
0.9393831, -0.5174878, 1.078351, 1, 1, 1, 1, 1,
0.9422908, 0.2965723, 0.407378, 0, 0, 1, 1, 1,
0.9425889, -0.3906583, 2.118681, 1, 0, 0, 1, 1,
0.9546244, -0.7549137, 2.431945, 1, 0, 0, 1, 1,
0.9546468, -0.6559858, 0.6472523, 1, 0, 0, 1, 1,
0.9553268, -0.9895094, 2.720722, 1, 0, 0, 1, 1,
0.9566265, -0.2433484, 1.535724, 1, 0, 0, 1, 1,
0.9622462, -1.14722, 2.394955, 0, 0, 0, 1, 1,
0.9700232, -1.187065, 2.356663, 0, 0, 0, 1, 1,
0.9701807, 0.8560214, 0.6094315, 0, 0, 0, 1, 1,
0.9744658, 1.600862, 0.35861, 0, 0, 0, 1, 1,
0.975876, -0.1739923, 1.616617, 0, 0, 0, 1, 1,
0.9797451, 0.4486826, 1.136326, 0, 0, 0, 1, 1,
0.9817443, 1.074348, 1.214585, 0, 0, 0, 1, 1,
0.9872465, -0.3216572, 1.575676, 1, 1, 1, 1, 1,
0.9985361, -0.904197, 4.169571, 1, 1, 1, 1, 1,
1.000876, -0.4044698, 2.471842, 1, 1, 1, 1, 1,
1.00275, -1.637441, 3.100941, 1, 1, 1, 1, 1,
1.004616, -0.8789086, 3.153653, 1, 1, 1, 1, 1,
1.006348, -0.8553717, 1.175765, 1, 1, 1, 1, 1,
1.020381, -0.3921612, 0.3460457, 1, 1, 1, 1, 1,
1.0222, 1.692118, 0.1416526, 1, 1, 1, 1, 1,
1.02361, -0.7310553, 1.118947, 1, 1, 1, 1, 1,
1.030477, -0.5351914, 2.18577, 1, 1, 1, 1, 1,
1.036621, 0.01799284, 1.749595, 1, 1, 1, 1, 1,
1.039047, 0.2130355, 0.8047292, 1, 1, 1, 1, 1,
1.041121, 1.098494, 0.9571948, 1, 1, 1, 1, 1,
1.041524, 0.09762242, 1.128847, 1, 1, 1, 1, 1,
1.044223, 1.239991, 2.410274, 1, 1, 1, 1, 1,
1.044486, 1.50169, 1.101807, 0, 0, 1, 1, 1,
1.044832, -0.06434805, 0.949839, 1, 0, 0, 1, 1,
1.048331, -0.1998827, 1.592971, 1, 0, 0, 1, 1,
1.049853, -1.238703, 2.934397, 1, 0, 0, 1, 1,
1.06519, 0.1134724, 0.9886484, 1, 0, 0, 1, 1,
1.071328, -0.04371365, 2.521344, 1, 0, 0, 1, 1,
1.079593, 0.7711745, 2.409239, 0, 0, 0, 1, 1,
1.082144, 0.1105561, 0.08283083, 0, 0, 0, 1, 1,
1.085025, -0.9932332, 3.726996, 0, 0, 0, 1, 1,
1.089349, 0.8949555, 0.3889308, 0, 0, 0, 1, 1,
1.091785, -1.117055, 2.445417, 0, 0, 0, 1, 1,
1.093632, 0.3108711, 2.052704, 0, 0, 0, 1, 1,
1.096533, -0.9214613, 1.116441, 0, 0, 0, 1, 1,
1.100149, 1.887797, -0.7049855, 1, 1, 1, 1, 1,
1.102893, -0.8367319, 1.840167, 1, 1, 1, 1, 1,
1.108221, -0.883758, 1.619088, 1, 1, 1, 1, 1,
1.112098, -0.7036906, 1.952148, 1, 1, 1, 1, 1,
1.115978, 0.8409494, 0.2868204, 1, 1, 1, 1, 1,
1.117067, -0.7258797, 2.070443, 1, 1, 1, 1, 1,
1.123389, 0.4876049, 1.311663, 1, 1, 1, 1, 1,
1.129284, 0.5831772, 1.020539, 1, 1, 1, 1, 1,
1.131033, -1.309801, 2.075195, 1, 1, 1, 1, 1,
1.133564, -1.008969, 3.862082, 1, 1, 1, 1, 1,
1.134389, 1.81818, 0.3869656, 1, 1, 1, 1, 1,
1.13682, -0.8725013, 3.426133, 1, 1, 1, 1, 1,
1.137934, 1.686426, -0.4329144, 1, 1, 1, 1, 1,
1.139742, 1.047506, 0.3540184, 1, 1, 1, 1, 1,
1.142451, -0.6867673, 1.340889, 1, 1, 1, 1, 1,
1.143552, -0.4048431, 2.889599, 0, 0, 1, 1, 1,
1.14637, 1.212498, 0.9264156, 1, 0, 0, 1, 1,
1.147297, -0.1489757, 0.6574256, 1, 0, 0, 1, 1,
1.150142, 0.3980024, 1.292232, 1, 0, 0, 1, 1,
1.150306, 0.9412645, 1.997192, 1, 0, 0, 1, 1,
1.152747, 0.5844202, 1.201235, 1, 0, 0, 1, 1,
1.15623, -2.006873, 1.695288, 0, 0, 0, 1, 1,
1.178691, 0.6584188, 1.651749, 0, 0, 0, 1, 1,
1.180142, 1.138868, 2.259411, 0, 0, 0, 1, 1,
1.187727, 1.658418, 0.3001485, 0, 0, 0, 1, 1,
1.199247, 1.77878, 0.8415648, 0, 0, 0, 1, 1,
1.202898, 0.3098262, 1.825278, 0, 0, 0, 1, 1,
1.204671, -0.6441298, 1.720112, 0, 0, 0, 1, 1,
1.216132, -0.07230651, 0.2118793, 1, 1, 1, 1, 1,
1.220576, 0.3733329, 1.069902, 1, 1, 1, 1, 1,
1.223198, 0.7223043, 0.7413095, 1, 1, 1, 1, 1,
1.228476, 1.518967, 1.936278, 1, 1, 1, 1, 1,
1.230434, 1.321752, 1.231925, 1, 1, 1, 1, 1,
1.23111, 1.055168, -1.332302, 1, 1, 1, 1, 1,
1.246371, 1.057325, 0.4774904, 1, 1, 1, 1, 1,
1.254421, 0.4650432, 1.208765, 1, 1, 1, 1, 1,
1.257527, 0.1941954, 1.936396, 1, 1, 1, 1, 1,
1.258532, 0.1529902, 1.389536, 1, 1, 1, 1, 1,
1.2587, 0.4470484, 0.6668457, 1, 1, 1, 1, 1,
1.262536, -0.4350929, 1.190759, 1, 1, 1, 1, 1,
1.270457, 0.8058885, 0.4358213, 1, 1, 1, 1, 1,
1.277558, -3.482, 3.800701, 1, 1, 1, 1, 1,
1.283391, -0.7566952, 2.122322, 1, 1, 1, 1, 1,
1.30074, -1.887068, 1.82814, 0, 0, 1, 1, 1,
1.306439, -0.05012998, 1.355858, 1, 0, 0, 1, 1,
1.309512, 0.2618707, 1.395146, 1, 0, 0, 1, 1,
1.31288, -1.217165, 2.952, 1, 0, 0, 1, 1,
1.315273, -0.7458938, 1.411062, 1, 0, 0, 1, 1,
1.318742, 0.6483783, 0.7082497, 1, 0, 0, 1, 1,
1.335289, 0.0001653504, 2.308872, 0, 0, 0, 1, 1,
1.337695, -0.9611445, 4.729914, 0, 0, 0, 1, 1,
1.339489, 0.7553245, 1.258354, 0, 0, 0, 1, 1,
1.340182, 1.486333, 1.623975, 0, 0, 0, 1, 1,
1.353847, 0.430099, -0.3554371, 0, 0, 0, 1, 1,
1.355062, -1.938954, 1.978859, 0, 0, 0, 1, 1,
1.355404, 0.5013316, 1.382263, 0, 0, 0, 1, 1,
1.368085, -0.04424092, 2.317205, 1, 1, 1, 1, 1,
1.371958, 0.007201009, 2.648009, 1, 1, 1, 1, 1,
1.37401, 0.1269946, 2.085705, 1, 1, 1, 1, 1,
1.377232, 1.728178, 1.063417, 1, 1, 1, 1, 1,
1.384953, 1.050358, 0.791075, 1, 1, 1, 1, 1,
1.387612, 1.076759, 1.088452, 1, 1, 1, 1, 1,
1.387734, -1.184512, 2.108164, 1, 1, 1, 1, 1,
1.392502, -1.32067, 1.914618, 1, 1, 1, 1, 1,
1.403899, 0.5179159, 1.763517, 1, 1, 1, 1, 1,
1.408442, 0.4373704, 2.17802, 1, 1, 1, 1, 1,
1.423976, 1.008982, 0.4772803, 1, 1, 1, 1, 1,
1.424501, 1.073905, 0.5335443, 1, 1, 1, 1, 1,
1.443417, -1.260057, -0.5616513, 1, 1, 1, 1, 1,
1.445784, 0.7907708, -0.1827795, 1, 1, 1, 1, 1,
1.453756, 0.9895827, -2.186987, 1, 1, 1, 1, 1,
1.464094, 0.4743673, 2.753757, 0, 0, 1, 1, 1,
1.469389, 0.9297942, -1.099718, 1, 0, 0, 1, 1,
1.472575, 1.27924, 1.382427, 1, 0, 0, 1, 1,
1.485034, 0.1302337, 2.331689, 1, 0, 0, 1, 1,
1.49341, 0.7674617, 0.7955069, 1, 0, 0, 1, 1,
1.49482, -2.035653, 2.355122, 1, 0, 0, 1, 1,
1.49737, -0.8624611, 0.5613265, 0, 0, 0, 1, 1,
1.514959, -1.725138, 0.4068099, 0, 0, 0, 1, 1,
1.515838, -1.541421, 1.193109, 0, 0, 0, 1, 1,
1.521688, 0.1801002, 2.701604, 0, 0, 0, 1, 1,
1.552241, -1.194894, 0.7561843, 0, 0, 0, 1, 1,
1.552977, -0.3861905, 2.108599, 0, 0, 0, 1, 1,
1.553969, 1.084436, 2.706294, 0, 0, 0, 1, 1,
1.566929, 1.008138, 2.41082, 1, 1, 1, 1, 1,
1.58365, -1.38996, 1.536964, 1, 1, 1, 1, 1,
1.584006, -0.7589374, 2.199145, 1, 1, 1, 1, 1,
1.590625, 1.003707, -0.4132536, 1, 1, 1, 1, 1,
1.594784, 0.4808489, 1.023067, 1, 1, 1, 1, 1,
1.602301, -0.9241492, 1.281636, 1, 1, 1, 1, 1,
1.605935, 0.1023819, 0.7815864, 1, 1, 1, 1, 1,
1.612386, 1.256514, 1.996596, 1, 1, 1, 1, 1,
1.614139, 0.5898408, 1.146277, 1, 1, 1, 1, 1,
1.617814, 1.370669, 1.493493, 1, 1, 1, 1, 1,
1.628028, -1.420377, 3.766917, 1, 1, 1, 1, 1,
1.640024, -0.5483012, -1.074095, 1, 1, 1, 1, 1,
1.644232, 0.9410542, 1.084523, 1, 1, 1, 1, 1,
1.65134, -1.414887, 1.267384, 1, 1, 1, 1, 1,
1.659245, 0.4415296, 0.1985232, 1, 1, 1, 1, 1,
1.666816, 0.3998238, 1.505611, 0, 0, 1, 1, 1,
1.670155, 0.5389569, 0.1285881, 1, 0, 0, 1, 1,
1.69466, 0.7138881, 1.69574, 1, 0, 0, 1, 1,
1.701936, -0.9031654, 3.018462, 1, 0, 0, 1, 1,
1.702495, -1.652344, 2.851089, 1, 0, 0, 1, 1,
1.722657, -1.846391, 1.728106, 1, 0, 0, 1, 1,
1.754878, 0.693355, 0.3752165, 0, 0, 0, 1, 1,
1.756158, 2.137381, -0.6842507, 0, 0, 0, 1, 1,
1.768724, 0.9506397, 0.8381653, 0, 0, 0, 1, 1,
1.794235, -1.004166, 1.11796, 0, 0, 0, 1, 1,
1.80214, 0.4884869, 0.7395912, 0, 0, 0, 1, 1,
1.816558, -0.04029971, 1.213279, 0, 0, 0, 1, 1,
1.822938, -1.474038, 2.482749, 0, 0, 0, 1, 1,
1.849336, -1.236212, 2.175246, 1, 1, 1, 1, 1,
1.874854, -1.705228, 2.677048, 1, 1, 1, 1, 1,
1.924264, -1.08079, 2.382679, 1, 1, 1, 1, 1,
1.947043, 1.38425, -0.3525107, 1, 1, 1, 1, 1,
1.977569, 1.576716, 1.412674, 1, 1, 1, 1, 1,
1.978564, -0.3903375, 1.986701, 1, 1, 1, 1, 1,
2.001591, 0.1652985, 2.107427, 1, 1, 1, 1, 1,
2.019629, 0.3014815, 1.829542, 1, 1, 1, 1, 1,
2.023536, 2.517689, 0.0596216, 1, 1, 1, 1, 1,
2.034889, 0.5905067, 1.866802, 1, 1, 1, 1, 1,
2.042314, 0.5593891, 2.182753, 1, 1, 1, 1, 1,
2.071562, -1.343441, 3.252297, 1, 1, 1, 1, 1,
2.189318, -0.7468058, 0.8110381, 1, 1, 1, 1, 1,
2.192278, -1.869963, 3.094589, 1, 1, 1, 1, 1,
2.202777, -0.597155, 3.807577, 1, 1, 1, 1, 1,
2.259773, -0.9512359, 2.596044, 0, 0, 1, 1, 1,
2.328292, 0.03041117, 2.106815, 1, 0, 0, 1, 1,
2.335537, 0.3742307, -0.532654, 1, 0, 0, 1, 1,
2.342209, 0.7928224, 1.419286, 1, 0, 0, 1, 1,
2.363899, -0.4766321, 3.162696, 1, 0, 0, 1, 1,
2.431362, 0.06121037, 2.316105, 1, 0, 0, 1, 1,
2.434675, 1.286274, 0.07707649, 0, 0, 0, 1, 1,
2.449732, 0.4688151, 1.472683, 0, 0, 0, 1, 1,
2.454158, 0.06834443, 0.4533921, 0, 0, 0, 1, 1,
2.477354, -0.0515861, 1.106967, 0, 0, 0, 1, 1,
2.507423, 0.1631467, 1.114805, 0, 0, 0, 1, 1,
2.522779, 0.5790919, 1.588766, 0, 0, 0, 1, 1,
2.534803, -1.948085, 0.9177247, 0, 0, 0, 1, 1,
2.665317, -1.12382, 1.363408, 1, 1, 1, 1, 1,
2.743809, 0.2244863, 1.383274, 1, 1, 1, 1, 1,
2.835468, -0.1039013, 2.389889, 1, 1, 1, 1, 1,
2.854836, 0.7093903, 2.697269, 1, 1, 1, 1, 1,
3.098072, 1.522149, -0.7731403, 1, 1, 1, 1, 1,
3.180661, 0.4298514, 2.325742, 1, 1, 1, 1, 1,
3.209594, -0.4367831, 2.977437, 1, 1, 1, 1, 1
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
var radius = 9.345014;
var distance = 32.82396;
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
mvMatrix.translate( 0.1242661, 0.3952174, 0.3233202 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.82396);
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
