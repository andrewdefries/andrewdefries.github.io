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
-3.113201, -0.4386342, -1.535704, 1, 0, 0, 1,
-2.61574, -1.513162, -3.819345, 1, 0.007843138, 0, 1,
-2.603588, 0.1270877, -0.1384499, 1, 0.01176471, 0, 1,
-2.597225, -0.578324, -3.019141, 1, 0.01960784, 0, 1,
-2.531209, 1.554068, -0.8811353, 1, 0.02352941, 0, 1,
-2.446644, 0.9872641, -1.009697, 1, 0.03137255, 0, 1,
-2.38404, -0.4422598, -2.699964, 1, 0.03529412, 0, 1,
-2.319554, 0.4832838, -2.453472, 1, 0.04313726, 0, 1,
-2.306607, 0.731352, 0.01024215, 1, 0.04705882, 0, 1,
-2.246359, -0.2185565, -0.1593899, 1, 0.05490196, 0, 1,
-2.240817, 0.1607828, 0.2303081, 1, 0.05882353, 0, 1,
-2.230999, 1.354496, 0.002552976, 1, 0.06666667, 0, 1,
-2.204328, -0.4618201, -3.239281, 1, 0.07058824, 0, 1,
-2.189059, 0.09777771, -1.207051, 1, 0.07843138, 0, 1,
-2.184143, 0.2082718, -0.7512334, 1, 0.08235294, 0, 1,
-2.180737, -0.7242109, -1.515934, 1, 0.09019608, 0, 1,
-2.13179, 1.655728, 1.402356, 1, 0.09411765, 0, 1,
-2.108495, -1.219174, -3.131366, 1, 0.1019608, 0, 1,
-2.102332, 0.7116085, -1.364094, 1, 0.1098039, 0, 1,
-2.095991, -1.828598, -0.7899745, 1, 0.1137255, 0, 1,
-2.091308, 2.059342, 0.5606036, 1, 0.1215686, 0, 1,
-2.090129, 1.1439, -0.6661899, 1, 0.1254902, 0, 1,
-2.08788, 1.65102, -1.169034, 1, 0.1333333, 0, 1,
-2.059878, 0.68598, 0.4482781, 1, 0.1372549, 0, 1,
-2.011937, 0.9155259, -1.105048, 1, 0.145098, 0, 1,
-1.997021, 2.380267, -0.6485025, 1, 0.1490196, 0, 1,
-1.962382, -0.2533979, -0.4991139, 1, 0.1568628, 0, 1,
-1.960694, 0.5002922, -2.079267, 1, 0.1607843, 0, 1,
-1.921725, -1.242977, -3.180825, 1, 0.1686275, 0, 1,
-1.905677, 0.16891, -1.094515, 1, 0.172549, 0, 1,
-1.905278, -2.486742, -2.787528, 1, 0.1803922, 0, 1,
-1.896505, -1.481251, -1.365768, 1, 0.1843137, 0, 1,
-1.879176, -0.3751404, -0.8573053, 1, 0.1921569, 0, 1,
-1.870219, 1.422994, -1.202021, 1, 0.1960784, 0, 1,
-1.852867, -0.7923241, -0.9752076, 1, 0.2039216, 0, 1,
-1.8369, 0.1612993, -2.640729, 1, 0.2117647, 0, 1,
-1.809204, 1.3196, -1.21231, 1, 0.2156863, 0, 1,
-1.807719, 0.4832023, 0.083065, 1, 0.2235294, 0, 1,
-1.798743, 0.2711308, -1.410253, 1, 0.227451, 0, 1,
-1.78485, -0.3962516, -0.83217, 1, 0.2352941, 0, 1,
-1.784788, 0.4043401, -2.22516, 1, 0.2392157, 0, 1,
-1.773538, 0.5026624, -0.7178797, 1, 0.2470588, 0, 1,
-1.746985, 0.8490385, -0.7197657, 1, 0.2509804, 0, 1,
-1.715309, -0.5646148, -1.92981, 1, 0.2588235, 0, 1,
-1.712785, -1.139188, -1.949514, 1, 0.2627451, 0, 1,
-1.710957, -0.2556502, -0.2742865, 1, 0.2705882, 0, 1,
-1.710163, 0.03568777, -1.638198, 1, 0.2745098, 0, 1,
-1.701154, 0.638782, -2.108967, 1, 0.282353, 0, 1,
-1.700722, 0.356426, -1.818879, 1, 0.2862745, 0, 1,
-1.689326, -1.224941, -2.348248, 1, 0.2941177, 0, 1,
-1.682957, -0.2115647, -1.964127, 1, 0.3019608, 0, 1,
-1.671466, -0.3112281, -2.032307, 1, 0.3058824, 0, 1,
-1.665562, -0.5718992, -2.269364, 1, 0.3137255, 0, 1,
-1.662422, -0.7131829, -1.603863, 1, 0.3176471, 0, 1,
-1.661349, -1.463269, -1.500448, 1, 0.3254902, 0, 1,
-1.640272, -2.405412, -2.137768, 1, 0.3294118, 0, 1,
-1.638898, -0.3420007, -2.632401, 1, 0.3372549, 0, 1,
-1.629105, 1.539441, -3.400842, 1, 0.3411765, 0, 1,
-1.620087, 1.609116, -0.766428, 1, 0.3490196, 0, 1,
-1.613665, -0.1258699, -3.315248, 1, 0.3529412, 0, 1,
-1.613267, -1.192925, -2.396313, 1, 0.3607843, 0, 1,
-1.609798, 0.6474238, -2.519523, 1, 0.3647059, 0, 1,
-1.596284, -0.5762665, -4.261931, 1, 0.372549, 0, 1,
-1.593154, -0.1358098, -1.931368, 1, 0.3764706, 0, 1,
-1.586146, 1.652927, -0.5805295, 1, 0.3843137, 0, 1,
-1.562711, 1.142453, -1.224392, 1, 0.3882353, 0, 1,
-1.558149, 0.9411824, -0.5890701, 1, 0.3960784, 0, 1,
-1.556883, -0.2547676, -0.8364392, 1, 0.4039216, 0, 1,
-1.543266, 0.4069801, -2.181763, 1, 0.4078431, 0, 1,
-1.527832, -0.01694446, -1.047088, 1, 0.4156863, 0, 1,
-1.486567, -0.3919462, -1.199206, 1, 0.4196078, 0, 1,
-1.468805, -0.02382599, -0.3876027, 1, 0.427451, 0, 1,
-1.467434, -0.5723053, -1.731816, 1, 0.4313726, 0, 1,
-1.465834, -0.8579038, -3.327074, 1, 0.4392157, 0, 1,
-1.455969, 0.8143385, -0.04431413, 1, 0.4431373, 0, 1,
-1.441245, -0.5107523, -1.381309, 1, 0.4509804, 0, 1,
-1.438459, -2.355677, -2.267883, 1, 0.454902, 0, 1,
-1.423462, -1.081461, -0.638216, 1, 0.4627451, 0, 1,
-1.420092, 0.8118917, -1.617732, 1, 0.4666667, 0, 1,
-1.401471, 1.294638, 0.4415165, 1, 0.4745098, 0, 1,
-1.396024, -0.1343161, -2.01725, 1, 0.4784314, 0, 1,
-1.385179, -2.103919, -2.859619, 1, 0.4862745, 0, 1,
-1.383978, 0.3126322, -0.8035617, 1, 0.4901961, 0, 1,
-1.381761, -0.1438019, -1.18261, 1, 0.4980392, 0, 1,
-1.374177, 1.778911, -1.255781, 1, 0.5058824, 0, 1,
-1.345573, -0.4958484, -0.8260052, 1, 0.509804, 0, 1,
-1.338048, -1.486672, -1.807349, 1, 0.5176471, 0, 1,
-1.337644, -0.1267737, -1.948919, 1, 0.5215687, 0, 1,
-1.326433, 0.4396304, -1.273399, 1, 0.5294118, 0, 1,
-1.323999, 0.1855868, -2.098057, 1, 0.5333334, 0, 1,
-1.321512, -0.6475354, -2.477387, 1, 0.5411765, 0, 1,
-1.320441, -0.1197447, -1.128188, 1, 0.5450981, 0, 1,
-1.312395, 0.6831195, -1.771793, 1, 0.5529412, 0, 1,
-1.310839, 0.4886847, -2.103139, 1, 0.5568628, 0, 1,
-1.309492, 0.6295307, -0.6475351, 1, 0.5647059, 0, 1,
-1.296556, 1.152165, -1.687425, 1, 0.5686275, 0, 1,
-1.296034, -1.13844, -1.757351, 1, 0.5764706, 0, 1,
-1.288619, 1.072248, 0.1618513, 1, 0.5803922, 0, 1,
-1.287739, -0.5576478, -2.972959, 1, 0.5882353, 0, 1,
-1.276883, -1.31574, -2.149717, 1, 0.5921569, 0, 1,
-1.26746, -0.5649527, -0.590884, 1, 0.6, 0, 1,
-1.257236, 0.1840446, -0.7769344, 1, 0.6078432, 0, 1,
-1.253469, 2.007929, -0.4766646, 1, 0.6117647, 0, 1,
-1.247161, -0.5819596, -0.07343433, 1, 0.6196079, 0, 1,
-1.24401, 1.397018, -0.814728, 1, 0.6235294, 0, 1,
-1.24309, -0.9158846, -3.788126, 1, 0.6313726, 0, 1,
-1.242218, -0.2799254, -1.003006, 1, 0.6352941, 0, 1,
-1.239583, 0.2773314, -1.598179, 1, 0.6431373, 0, 1,
-1.238852, 1.617356, -1.561456, 1, 0.6470588, 0, 1,
-1.230848, -1.295135, -2.735408, 1, 0.654902, 0, 1,
-1.221004, 0.9550847, -1.598084, 1, 0.6588235, 0, 1,
-1.220578, -0.5970373, 0.03750683, 1, 0.6666667, 0, 1,
-1.211107, 0.4520359, -3.800815, 1, 0.6705883, 0, 1,
-1.209769, 0.5677678, -1.083408, 1, 0.6784314, 0, 1,
-1.204912, 0.0742095, -1.998465, 1, 0.682353, 0, 1,
-1.201778, 0.01617319, -3.948207, 1, 0.6901961, 0, 1,
-1.174338, 1.534603, -0.2494819, 1, 0.6941177, 0, 1,
-1.174268, 0.2505373, -1.235829, 1, 0.7019608, 0, 1,
-1.17154, 0.7481852, -1.702236, 1, 0.7098039, 0, 1,
-1.169423, 1.823997, 0.3190694, 1, 0.7137255, 0, 1,
-1.168804, -0.2564477, -1.985409, 1, 0.7215686, 0, 1,
-1.165029, 2.312519, 0.1572578, 1, 0.7254902, 0, 1,
-1.158367, 0.7125544, -0.6872501, 1, 0.7333333, 0, 1,
-1.157471, 0.7921906, -2.004821, 1, 0.7372549, 0, 1,
-1.153947, -0.8876793, -1.14509, 1, 0.7450981, 0, 1,
-1.151246, -0.9201342, -0.8529583, 1, 0.7490196, 0, 1,
-1.148292, 0.7842797, -1.482028, 1, 0.7568628, 0, 1,
-1.139899, 1.050889, 0.1354567, 1, 0.7607843, 0, 1,
-1.137785, 2.14177, 0.4463342, 1, 0.7686275, 0, 1,
-1.13562, -1.306861, -2.748128, 1, 0.772549, 0, 1,
-1.133372, 0.2632803, -1.627051, 1, 0.7803922, 0, 1,
-1.131292, -0.06705288, -1.253035, 1, 0.7843137, 0, 1,
-1.129001, -1.282439, -2.096076, 1, 0.7921569, 0, 1,
-1.128361, 0.04071223, -1.799433, 1, 0.7960784, 0, 1,
-1.124942, -0.6470606, -1.657255, 1, 0.8039216, 0, 1,
-1.119671, 1.301588, -0.6343985, 1, 0.8117647, 0, 1,
-1.117261, -0.962725, -2.200062, 1, 0.8156863, 0, 1,
-1.114714, 1.821826, -1.223054, 1, 0.8235294, 0, 1,
-1.114695, 0.2807771, -1.990273, 1, 0.827451, 0, 1,
-1.113634, -0.8374491, -1.56173, 1, 0.8352941, 0, 1,
-1.108401, 0.1817859, -4.341029, 1, 0.8392157, 0, 1,
-1.106155, 0.1624343, -1.449958, 1, 0.8470588, 0, 1,
-1.087161, -0.451034, -2.743023, 1, 0.8509804, 0, 1,
-1.08621, -0.2356383, 0.2374203, 1, 0.8588235, 0, 1,
-1.081531, -0.909526, -2.854104, 1, 0.8627451, 0, 1,
-1.078295, -1.523994, -3.650891, 1, 0.8705882, 0, 1,
-1.076473, 1.652991, -0.2043955, 1, 0.8745098, 0, 1,
-1.065866, 0.9060148, -1.037986, 1, 0.8823529, 0, 1,
-1.055254, -0.1222761, -0.8350038, 1, 0.8862745, 0, 1,
-1.048687, 1.000229, -0.6918431, 1, 0.8941177, 0, 1,
-1.042667, 2.341892, -0.4727328, 1, 0.8980392, 0, 1,
-1.042361, -0.9381793, -2.299093, 1, 0.9058824, 0, 1,
-1.040463, 1.569044, -1.161395, 1, 0.9137255, 0, 1,
-1.04026, -0.7832119, -0.4716736, 1, 0.9176471, 0, 1,
-1.039168, 0.5842598, -0.1829377, 1, 0.9254902, 0, 1,
-1.038593, 1.802566, 0.5444134, 1, 0.9294118, 0, 1,
-1.034477, -0.3988912, -3.400305, 1, 0.9372549, 0, 1,
-1.021008, 0.418774, -0.8591834, 1, 0.9411765, 0, 1,
-1.020338, 0.3629003, -0.4767897, 1, 0.9490196, 0, 1,
-1.018301, -0.9551333, -1.410218, 1, 0.9529412, 0, 1,
-1.016658, -0.6413144, -1.131949, 1, 0.9607843, 0, 1,
-1.011082, 1.767406, 0.8063916, 1, 0.9647059, 0, 1,
-0.9983408, 0.5290265, -1.758709, 1, 0.972549, 0, 1,
-0.9976379, 1.452844, -0.1909272, 1, 0.9764706, 0, 1,
-0.9887053, -0.4035619, -3.702552, 1, 0.9843137, 0, 1,
-0.9840053, -0.3491626, -0.2786354, 1, 0.9882353, 0, 1,
-0.9735896, -1.096619, -3.847592, 1, 0.9960784, 0, 1,
-0.9726347, 1.229203, -1.256897, 0.9960784, 1, 0, 1,
-0.9707057, -1.160403, -1.834114, 0.9921569, 1, 0, 1,
-0.9698693, -0.1575439, -1.253294, 0.9843137, 1, 0, 1,
-0.9670181, -0.4775527, -3.836329, 0.9803922, 1, 0, 1,
-0.966328, 2.678154, -0.3822389, 0.972549, 1, 0, 1,
-0.9646877, 1.02219, 1.008027, 0.9686275, 1, 0, 1,
-0.9456965, -0.0790445, -1.839957, 0.9607843, 1, 0, 1,
-0.9437307, 0.87782, 0.07743323, 0.9568627, 1, 0, 1,
-0.9388436, 0.06009643, -0.2787129, 0.9490196, 1, 0, 1,
-0.9356807, -0.8291186, -3.88034, 0.945098, 1, 0, 1,
-0.9333221, -0.3273308, -1.618326, 0.9372549, 1, 0, 1,
-0.9325856, -0.5777192, -2.781964, 0.9333333, 1, 0, 1,
-0.9322844, -2.864016, -2.609291, 0.9254902, 1, 0, 1,
-0.9310277, -0.8044635, -0.21156, 0.9215686, 1, 0, 1,
-0.9287831, -0.4481546, -2.579928, 0.9137255, 1, 0, 1,
-0.9280366, 0.4482259, -0.3433788, 0.9098039, 1, 0, 1,
-0.9249196, -0.8690979, -3.778022, 0.9019608, 1, 0, 1,
-0.9214543, 0.6123241, -1.030385, 0.8941177, 1, 0, 1,
-0.9211022, 0.8246353, -1.118953, 0.8901961, 1, 0, 1,
-0.9177828, -0.9345607, -2.445165, 0.8823529, 1, 0, 1,
-0.9117416, -0.8332849, -1.750288, 0.8784314, 1, 0, 1,
-0.9082322, 1.167889, -3.387082, 0.8705882, 1, 0, 1,
-0.9012344, 0.1691371, -2.203253, 0.8666667, 1, 0, 1,
-0.89947, -0.588966, -3.19951, 0.8588235, 1, 0, 1,
-0.8923719, -0.2441759, -1.323282, 0.854902, 1, 0, 1,
-0.8905241, 0.7336416, 0.1134307, 0.8470588, 1, 0, 1,
-0.8890832, -2.493496, -2.714588, 0.8431373, 1, 0, 1,
-0.8849961, -0.9554689, -0.330881, 0.8352941, 1, 0, 1,
-0.8828784, 1.180074, -0.7901326, 0.8313726, 1, 0, 1,
-0.8807569, -1.341947, -2.958318, 0.8235294, 1, 0, 1,
-0.8777822, 0.6854757, -0.546611, 0.8196079, 1, 0, 1,
-0.876278, -1.514622, -3.989194, 0.8117647, 1, 0, 1,
-0.8686881, 0.2165014, -1.909713, 0.8078431, 1, 0, 1,
-0.8686534, -0.3548957, -0.9869385, 0.8, 1, 0, 1,
-0.8647991, 0.3749324, -0.3949826, 0.7921569, 1, 0, 1,
-0.8647939, 0.4784763, -0.849553, 0.7882353, 1, 0, 1,
-0.8635243, 1.94502, 0.5424576, 0.7803922, 1, 0, 1,
-0.8615422, 1.101247, 0.4689332, 0.7764706, 1, 0, 1,
-0.8601681, -0.7710387, -3.600424, 0.7686275, 1, 0, 1,
-0.8550174, -0.208018, -3.195359, 0.7647059, 1, 0, 1,
-0.8515785, -0.8279926, -2.459243, 0.7568628, 1, 0, 1,
-0.8467564, -0.08688165, -0.9212572, 0.7529412, 1, 0, 1,
-0.8464066, 0.4138355, -1.381758, 0.7450981, 1, 0, 1,
-0.8393702, -1.199203, -4.403584, 0.7411765, 1, 0, 1,
-0.8307183, 0.5039239, -0.1169127, 0.7333333, 1, 0, 1,
-0.8275348, -0.04071191, -1.349195, 0.7294118, 1, 0, 1,
-0.8246775, 0.6969087, -0.8258255, 0.7215686, 1, 0, 1,
-0.819679, -0.513925, -2.83382, 0.7176471, 1, 0, 1,
-0.8168716, 0.4544761, -1.761919, 0.7098039, 1, 0, 1,
-0.8123674, -0.006745948, -1.271125, 0.7058824, 1, 0, 1,
-0.8087162, 0.413132, -2.859978, 0.6980392, 1, 0, 1,
-0.7978051, 0.1540687, -1.718792, 0.6901961, 1, 0, 1,
-0.7929449, 0.1936491, -1.888767, 0.6862745, 1, 0, 1,
-0.7902211, -1.826861, -3.170829, 0.6784314, 1, 0, 1,
-0.7890452, -0.3918941, -2.226851, 0.6745098, 1, 0, 1,
-0.788438, 0.2471967, -3.324234, 0.6666667, 1, 0, 1,
-0.7876832, 1.117324, 0.3210563, 0.6627451, 1, 0, 1,
-0.7871598, 0.5554545, 0.05857369, 0.654902, 1, 0, 1,
-0.785423, -0.05364297, -2.700756, 0.6509804, 1, 0, 1,
-0.7808456, 0.02511878, -1.379434, 0.6431373, 1, 0, 1,
-0.7777035, 0.3930931, -2.386065, 0.6392157, 1, 0, 1,
-0.7772259, 0.3795551, -2.399864, 0.6313726, 1, 0, 1,
-0.7768657, -1.908903, -2.47906, 0.627451, 1, 0, 1,
-0.7729024, 1.489677, -0.3869398, 0.6196079, 1, 0, 1,
-0.7697418, -0.6697258, -3.389698, 0.6156863, 1, 0, 1,
-0.7650215, 0.3018465, -1.853533, 0.6078432, 1, 0, 1,
-0.7625535, 0.5869362, -0.3171631, 0.6039216, 1, 0, 1,
-0.7621309, -1.434359, -2.483802, 0.5960785, 1, 0, 1,
-0.7565466, -0.1279185, -2.922834, 0.5882353, 1, 0, 1,
-0.7561963, -0.08204243, -0.05928729, 0.5843138, 1, 0, 1,
-0.7521081, -0.6074595, -2.566092, 0.5764706, 1, 0, 1,
-0.7493766, 0.6383501, 0.3568733, 0.572549, 1, 0, 1,
-0.7480146, 1.24322, -0.6768491, 0.5647059, 1, 0, 1,
-0.7468955, -0.4290355, -1.923869, 0.5607843, 1, 0, 1,
-0.7453203, 0.4525218, 0.2166806, 0.5529412, 1, 0, 1,
-0.7438533, 1.214021, -1.661809, 0.5490196, 1, 0, 1,
-0.7390391, 1.138962, -1.759885, 0.5411765, 1, 0, 1,
-0.7369142, -0.2573819, -1.019116, 0.5372549, 1, 0, 1,
-0.7337939, -0.7347021, -0.4681177, 0.5294118, 1, 0, 1,
-0.7296672, -0.6947324, -2.477014, 0.5254902, 1, 0, 1,
-0.7283415, -0.4062713, -1.367058, 0.5176471, 1, 0, 1,
-0.7263939, -0.8134121, -1.520761, 0.5137255, 1, 0, 1,
-0.708727, -0.8709835, -2.447599, 0.5058824, 1, 0, 1,
-0.7013569, 2.010268, 0.6971121, 0.5019608, 1, 0, 1,
-0.6982353, 0.2056344, -0.9562467, 0.4941176, 1, 0, 1,
-0.6975376, 0.07005297, 0.3206629, 0.4862745, 1, 0, 1,
-0.6961913, -0.8224148, -0.8508865, 0.4823529, 1, 0, 1,
-0.6911774, -0.4621181, -1.695168, 0.4745098, 1, 0, 1,
-0.6896783, 0.1360283, -0.2833471, 0.4705882, 1, 0, 1,
-0.6891805, 0.2390854, -1.497302, 0.4627451, 1, 0, 1,
-0.6876745, -0.09952201, -2.782556, 0.4588235, 1, 0, 1,
-0.6855595, 0.4539044, -0.5887982, 0.4509804, 1, 0, 1,
-0.6821037, 0.35705, -1.280717, 0.4470588, 1, 0, 1,
-0.6768672, 0.8451098, -0.08333679, 0.4392157, 1, 0, 1,
-0.6683047, 0.8390226, -0.207821, 0.4352941, 1, 0, 1,
-0.6649878, -0.5556437, -4.200582, 0.427451, 1, 0, 1,
-0.661291, 0.03050211, -1.717394, 0.4235294, 1, 0, 1,
-0.6612076, 0.628861, 1.666579, 0.4156863, 1, 0, 1,
-0.6544832, -1.044328, -1.208952, 0.4117647, 1, 0, 1,
-0.6453033, 0.04818141, -1.020473, 0.4039216, 1, 0, 1,
-0.6441761, -0.2189963, -4.290462, 0.3960784, 1, 0, 1,
-0.6401459, 0.3665394, -0.5980086, 0.3921569, 1, 0, 1,
-0.63184, 0.2472794, 0.1170062, 0.3843137, 1, 0, 1,
-0.6270779, 0.2095034, -0.1919061, 0.3803922, 1, 0, 1,
-0.624447, 0.01674808, -1.092794, 0.372549, 1, 0, 1,
-0.6240485, -2.141155, -0.9922881, 0.3686275, 1, 0, 1,
-0.6225951, -0.1681264, -1.679024, 0.3607843, 1, 0, 1,
-0.6189417, -0.2394508, -3.176564, 0.3568628, 1, 0, 1,
-0.6155371, 1.164172, 0.7703935, 0.3490196, 1, 0, 1,
-0.6154506, 0.7960291, 0.4475428, 0.345098, 1, 0, 1,
-0.6022046, 1.570956, 0.2623744, 0.3372549, 1, 0, 1,
-0.5988532, -0.273587, -2.430566, 0.3333333, 1, 0, 1,
-0.598491, 0.8059395, -1.287096, 0.3254902, 1, 0, 1,
-0.5966835, -0.1726862, -1.974257, 0.3215686, 1, 0, 1,
-0.5961976, -0.02993419, -1.596815, 0.3137255, 1, 0, 1,
-0.5961814, 0.981421, -0.3063699, 0.3098039, 1, 0, 1,
-0.5956918, -1.261376, -3.269412, 0.3019608, 1, 0, 1,
-0.59399, 1.115546, -1.61539, 0.2941177, 1, 0, 1,
-0.5926436, 0.4661065, -0.8210976, 0.2901961, 1, 0, 1,
-0.5893596, 0.0445121, -1.130519, 0.282353, 1, 0, 1,
-0.5862974, 1.193143, -0.9513928, 0.2784314, 1, 0, 1,
-0.586132, 2.293518, -0.8443238, 0.2705882, 1, 0, 1,
-0.5860478, -0.337759, -2.126997, 0.2666667, 1, 0, 1,
-0.5851659, -0.6774698, -3.162453, 0.2588235, 1, 0, 1,
-0.5810444, -0.8600182, -4.211075, 0.254902, 1, 0, 1,
-0.5785223, 0.7042795, -1.155464, 0.2470588, 1, 0, 1,
-0.5732775, 1.056592, 0.1511722, 0.2431373, 1, 0, 1,
-0.5707911, 0.08814318, -3.310474, 0.2352941, 1, 0, 1,
-0.5700082, 0.8197809, -2.358688, 0.2313726, 1, 0, 1,
-0.5691587, 0.634828, -0.9615336, 0.2235294, 1, 0, 1,
-0.5672139, 0.2380285, -0.7198281, 0.2196078, 1, 0, 1,
-0.5648288, 0.2426476, -1.231365, 0.2117647, 1, 0, 1,
-0.560498, -0.4378471, -3.15346, 0.2078431, 1, 0, 1,
-0.5550417, -1.728186, -2.098247, 0.2, 1, 0, 1,
-0.5528557, 0.1419855, -2.295764, 0.1921569, 1, 0, 1,
-0.5527855, -0.9534331, -4.602526, 0.1882353, 1, 0, 1,
-0.5483807, -2.370781, -3.238324, 0.1803922, 1, 0, 1,
-0.5482793, -0.8322204, -2.789969, 0.1764706, 1, 0, 1,
-0.5475226, 0.3241338, -1.409766, 0.1686275, 1, 0, 1,
-0.5447575, -0.6000807, -0.1192212, 0.1647059, 1, 0, 1,
-0.5424371, -0.4605846, -3.294797, 0.1568628, 1, 0, 1,
-0.5418963, -0.3079737, -2.208833, 0.1529412, 1, 0, 1,
-0.5365635, -0.2812195, -2.075812, 0.145098, 1, 0, 1,
-0.5353774, 0.2762698, -1.840661, 0.1411765, 1, 0, 1,
-0.5306848, 0.88771, -0.4733745, 0.1333333, 1, 0, 1,
-0.529794, 1.023572, -1.129238, 0.1294118, 1, 0, 1,
-0.5223982, 0.9609228, 0.03460686, 0.1215686, 1, 0, 1,
-0.5186897, -0.689116, -2.402753, 0.1176471, 1, 0, 1,
-0.5129216, -2.435948, -2.665909, 0.1098039, 1, 0, 1,
-0.5108214, -1.765101, -2.35469, 0.1058824, 1, 0, 1,
-0.5086195, 0.8374003, 0.7898189, 0.09803922, 1, 0, 1,
-0.5071736, 0.1593146, -1.896458, 0.09019608, 1, 0, 1,
-0.5036778, 1.423152, 1.081766, 0.08627451, 1, 0, 1,
-0.5013398, 0.6959969, -0.226803, 0.07843138, 1, 0, 1,
-0.498635, -1.208396, -1.549101, 0.07450981, 1, 0, 1,
-0.4981827, 0.3679719, 0.1473616, 0.06666667, 1, 0, 1,
-0.4959594, 0.1382781, -0.4742717, 0.0627451, 1, 0, 1,
-0.4885717, -0.5474724, -2.957976, 0.05490196, 1, 0, 1,
-0.4872753, -0.2400564, -2.975199, 0.05098039, 1, 0, 1,
-0.4872223, 0.5400264, -0.7441214, 0.04313726, 1, 0, 1,
-0.4822582, 0.6469651, -1.983777, 0.03921569, 1, 0, 1,
-0.478924, 0.6077794, -0.08170699, 0.03137255, 1, 0, 1,
-0.4787389, -0.9945322, -2.416892, 0.02745098, 1, 0, 1,
-0.4745049, -0.02079594, 0.9150001, 0.01960784, 1, 0, 1,
-0.4705181, -1.205333, -2.134035, 0.01568628, 1, 0, 1,
-0.4701932, 0.01688291, -1.714574, 0.007843138, 1, 0, 1,
-0.4660638, -1.211447, -3.632976, 0.003921569, 1, 0, 1,
-0.4635828, 0.6541935, 0.3716522, 0, 1, 0.003921569, 1,
-0.4604008, 0.9974486, 0.4896959, 0, 1, 0.01176471, 1,
-0.4600751, 1.131161, -0.9509246, 0, 1, 0.01568628, 1,
-0.459835, -1.583073, -2.867147, 0, 1, 0.02352941, 1,
-0.4574045, 0.2338202, -1.251588, 0, 1, 0.02745098, 1,
-0.4558721, -0.1416463, -1.341573, 0, 1, 0.03529412, 1,
-0.4511159, 0.2376711, -2.824902, 0, 1, 0.03921569, 1,
-0.4509809, -0.2740422, -1.594814, 0, 1, 0.04705882, 1,
-0.4504988, 0.4240648, -1.605468, 0, 1, 0.05098039, 1,
-0.4481731, -1.272422, -4.257941, 0, 1, 0.05882353, 1,
-0.4462076, -0.89637, -2.878652, 0, 1, 0.0627451, 1,
-0.4436174, 1.144906, 0.7838387, 0, 1, 0.07058824, 1,
-0.434756, -0.9371449, -3.607906, 0, 1, 0.07450981, 1,
-0.4343211, -0.6267601, -2.716963, 0, 1, 0.08235294, 1,
-0.4325573, 1.167862, -0.249764, 0, 1, 0.08627451, 1,
-0.4303719, 0.2827173, -0.8609316, 0, 1, 0.09411765, 1,
-0.4280507, -0.1237568, 0.04437717, 0, 1, 0.1019608, 1,
-0.4278022, -0.1548632, 1.015279, 0, 1, 0.1058824, 1,
-0.4262065, 1.457547, 0.9358139, 0, 1, 0.1137255, 1,
-0.4248608, 2.198446, 0.4660069, 0, 1, 0.1176471, 1,
-0.4217238, -1.251137, -3.273196, 0, 1, 0.1254902, 1,
-0.4201096, 0.8711286, -0.2395791, 0, 1, 0.1294118, 1,
-0.4136177, 1.549059, -0.1175148, 0, 1, 0.1372549, 1,
-0.413086, 0.09088826, -1.160079, 0, 1, 0.1411765, 1,
-0.4107316, 0.3487138, -1.816235, 0, 1, 0.1490196, 1,
-0.410576, 0.2931675, -1.056434, 0, 1, 0.1529412, 1,
-0.4101361, -1.980267, -4.214015, 0, 1, 0.1607843, 1,
-0.4097848, 0.3116, -1.758017, 0, 1, 0.1647059, 1,
-0.4095058, -0.4015901, -1.969752, 0, 1, 0.172549, 1,
-0.4077534, -0.5814619, -3.581664, 0, 1, 0.1764706, 1,
-0.4048172, -2.492945, -3.366757, 0, 1, 0.1843137, 1,
-0.4027515, 1.40149, -0.05780901, 0, 1, 0.1882353, 1,
-0.399289, 0.6725075, 0.2995167, 0, 1, 0.1960784, 1,
-0.3977334, -0.7816685, -2.966915, 0, 1, 0.2039216, 1,
-0.3960708, -0.400333, -2.925817, 0, 1, 0.2078431, 1,
-0.3956978, -1.259968, -1.937118, 0, 1, 0.2156863, 1,
-0.3927406, 0.33446, -1.552415, 0, 1, 0.2196078, 1,
-0.3917723, 0.4105608, -0.1291717, 0, 1, 0.227451, 1,
-0.3827151, 0.7632341, -1.518417, 0, 1, 0.2313726, 1,
-0.38263, -0.1330633, -1.815349, 0, 1, 0.2392157, 1,
-0.3819053, 1.492875, -0.677719, 0, 1, 0.2431373, 1,
-0.3664217, 0.5964316, -0.5747827, 0, 1, 0.2509804, 1,
-0.3636076, -1.309193, -2.639087, 0, 1, 0.254902, 1,
-0.3628199, -0.5719005, -2.251108, 0, 1, 0.2627451, 1,
-0.3570406, 0.4966643, 0.6587652, 0, 1, 0.2666667, 1,
-0.3569965, 0.5706245, 0.4460527, 0, 1, 0.2745098, 1,
-0.3556073, 0.529714, -2.342061, 0, 1, 0.2784314, 1,
-0.3489267, -1.96791, -4.368116, 0, 1, 0.2862745, 1,
-0.3479275, -0.5936643, -4.643293, 0, 1, 0.2901961, 1,
-0.3476796, -0.9273617, -4.625129, 0, 1, 0.2980392, 1,
-0.3455841, 0.5279502, -0.6988075, 0, 1, 0.3058824, 1,
-0.3406, -1.904863, -1.294637, 0, 1, 0.3098039, 1,
-0.3398004, -0.1743151, -2.934094, 0, 1, 0.3176471, 1,
-0.3374601, -1.700896, -2.147784, 0, 1, 0.3215686, 1,
-0.337438, -1.596299, -2.359246, 0, 1, 0.3294118, 1,
-0.3332075, -0.1524757, -0.8191135, 0, 1, 0.3333333, 1,
-0.3310159, -0.4075771, -2.176856, 0, 1, 0.3411765, 1,
-0.3244785, -0.6630883, -2.377355, 0, 1, 0.345098, 1,
-0.3182056, 0.7743335, -1.193141, 0, 1, 0.3529412, 1,
-0.3175603, 0.05655879, -2.701218, 0, 1, 0.3568628, 1,
-0.3159077, 0.7186521, -1.724994, 0, 1, 0.3647059, 1,
-0.315888, -0.8521224, -2.541185, 0, 1, 0.3686275, 1,
-0.3069341, -0.7956435, -1.69528, 0, 1, 0.3764706, 1,
-0.306514, 0.6701107, -0.1806567, 0, 1, 0.3803922, 1,
-0.2998537, -1.219025, -2.540575, 0, 1, 0.3882353, 1,
-0.2983545, -0.2220327, -1.651383, 0, 1, 0.3921569, 1,
-0.297895, 0.2470296, -2.030218, 0, 1, 0.4, 1,
-0.2933724, 1.0402, 0.9066015, 0, 1, 0.4078431, 1,
-0.2801507, 1.079692, 2.699901, 0, 1, 0.4117647, 1,
-0.2784568, 0.7277246, 0.4927299, 0, 1, 0.4196078, 1,
-0.276724, 0.3298788, -0.9618714, 0, 1, 0.4235294, 1,
-0.2745895, -1.240906, -2.506363, 0, 1, 0.4313726, 1,
-0.2740193, -1.27631, -3.403237, 0, 1, 0.4352941, 1,
-0.2656757, 0.007297956, -1.28419, 0, 1, 0.4431373, 1,
-0.260427, 0.3831597, -0.4392434, 0, 1, 0.4470588, 1,
-0.2476671, -0.2051677, -2.462895, 0, 1, 0.454902, 1,
-0.2464064, 0.08886285, -0.799979, 0, 1, 0.4588235, 1,
-0.2305452, 1.796547, 0.882285, 0, 1, 0.4666667, 1,
-0.2296925, -0.1173011, -3.074743, 0, 1, 0.4705882, 1,
-0.2288801, -0.6750256, -2.637043, 0, 1, 0.4784314, 1,
-0.2263227, -0.3294412, -1.820726, 0, 1, 0.4823529, 1,
-0.2244202, 1.451928, 3.072192, 0, 1, 0.4901961, 1,
-0.2227065, 1.982093, -1.066704, 0, 1, 0.4941176, 1,
-0.2213952, -0.281388, -3.313681, 0, 1, 0.5019608, 1,
-0.2125445, -0.2961423, -1.752716, 0, 1, 0.509804, 1,
-0.2122773, 0.1717052, -1.235782, 0, 1, 0.5137255, 1,
-0.211123, -0.5960918, -2.011356, 0, 1, 0.5215687, 1,
-0.2056805, -0.8941461, -2.240119, 0, 1, 0.5254902, 1,
-0.2048287, -0.06299338, -1.57013, 0, 1, 0.5333334, 1,
-0.2046546, -0.9173754, -3.855315, 0, 1, 0.5372549, 1,
-0.2003877, -1.000052, -2.926044, 0, 1, 0.5450981, 1,
-0.1985865, -0.4487624, -1.000948, 0, 1, 0.5490196, 1,
-0.1985865, 1.04974, -0.2620305, 0, 1, 0.5568628, 1,
-0.1965194, 0.02870771, -0.7557998, 0, 1, 0.5607843, 1,
-0.1946304, -1.182581, -3.374511, 0, 1, 0.5686275, 1,
-0.1941036, 1.252255, -1.432605, 0, 1, 0.572549, 1,
-0.1929505, -1.066317, -4.017668, 0, 1, 0.5803922, 1,
-0.1901014, 0.6576442, 1.029826, 0, 1, 0.5843138, 1,
-0.1889516, -0.09862646, -2.191806, 0, 1, 0.5921569, 1,
-0.1867974, -0.6083494, -3.228325, 0, 1, 0.5960785, 1,
-0.186677, 0.2336111, -1.786888, 0, 1, 0.6039216, 1,
-0.1853892, -0.4984653, -3.435365, 0, 1, 0.6117647, 1,
-0.1851545, 0.5750194, 0.7632565, 0, 1, 0.6156863, 1,
-0.1828021, 0.1677743, -1.53178, 0, 1, 0.6235294, 1,
-0.1821111, 0.4645945, -0.566542, 0, 1, 0.627451, 1,
-0.1760207, -0.1331314, -2.782355, 0, 1, 0.6352941, 1,
-0.1757264, 0.1896678, -0.1594782, 0, 1, 0.6392157, 1,
-0.170886, 1.149979, 0.8148842, 0, 1, 0.6470588, 1,
-0.1697752, 0.9937876, -3.306404, 0, 1, 0.6509804, 1,
-0.1695003, 0.05863288, -0.4954169, 0, 1, 0.6588235, 1,
-0.16891, -1.188491, -5.864893, 0, 1, 0.6627451, 1,
-0.1677449, 0.7804946, -0.5245737, 0, 1, 0.6705883, 1,
-0.1672448, 0.07175409, 0.6809316, 0, 1, 0.6745098, 1,
-0.1645113, -0.1873808, -3.956007, 0, 1, 0.682353, 1,
-0.1606697, 0.6115056, -0.3603859, 0, 1, 0.6862745, 1,
-0.1604274, 2.66022, -0.5541343, 0, 1, 0.6941177, 1,
-0.1586987, -1.05761, -2.290441, 0, 1, 0.7019608, 1,
-0.157072, -0.5590327, -2.146419, 0, 1, 0.7058824, 1,
-0.1519108, -0.2354682, -1.921689, 0, 1, 0.7137255, 1,
-0.1517638, -0.1305704, -4.798488, 0, 1, 0.7176471, 1,
-0.1497555, 0.94208, -1.978572, 0, 1, 0.7254902, 1,
-0.146263, 0.1961297, -0.8359162, 0, 1, 0.7294118, 1,
-0.1445379, -0.3709637, -3.409891, 0, 1, 0.7372549, 1,
-0.1315444, 2.320947, -2.724452, 0, 1, 0.7411765, 1,
-0.1294074, -0.1984321, -2.866031, 0, 1, 0.7490196, 1,
-0.1293213, -0.5923918, -2.038697, 0, 1, 0.7529412, 1,
-0.1247142, 1.346748, 0.6339313, 0, 1, 0.7607843, 1,
-0.1246833, -0.1925128, -2.906087, 0, 1, 0.7647059, 1,
-0.119787, 1.334477, -0.8375588, 0, 1, 0.772549, 1,
-0.1156242, 0.3884279, -0.4161132, 0, 1, 0.7764706, 1,
-0.1142918, 0.1045982, -0.7505494, 0, 1, 0.7843137, 1,
-0.1115477, -2.181227, -2.832572, 0, 1, 0.7882353, 1,
-0.1103476, 0.7611541, 0.07956552, 0, 1, 0.7960784, 1,
-0.1091853, -1.031037, -4.274783, 0, 1, 0.8039216, 1,
-0.1038889, 0.2728311, -0.4442791, 0, 1, 0.8078431, 1,
-0.09879635, -0.07752277, -2.906457, 0, 1, 0.8156863, 1,
-0.09531073, 1.224563, -0.0946506, 0, 1, 0.8196079, 1,
-0.08980761, 1.001216, 0.7851931, 0, 1, 0.827451, 1,
-0.08210362, -2.364885, -1.256828, 0, 1, 0.8313726, 1,
-0.07726128, -0.4518164, -2.475322, 0, 1, 0.8392157, 1,
-0.07481722, 0.9329054, -1.712798, 0, 1, 0.8431373, 1,
-0.06470253, -1.446244, -2.996676, 0, 1, 0.8509804, 1,
-0.06027333, -0.05120124, -3.08865, 0, 1, 0.854902, 1,
-0.05281293, -0.6979437, -2.911377, 0, 1, 0.8627451, 1,
-0.05166763, -0.3864881, -4.56037, 0, 1, 0.8666667, 1,
-0.04938999, 0.4191838, -0.3836543, 0, 1, 0.8745098, 1,
-0.04672863, -2.383251, -4.12981, 0, 1, 0.8784314, 1,
-0.04569869, -1.672246, -4.083126, 0, 1, 0.8862745, 1,
-0.04163655, -0.1808677, -1.559259, 0, 1, 0.8901961, 1,
-0.04099701, -0.5615717, -3.013371, 0, 1, 0.8980392, 1,
-0.04040888, -1.094638, -3.295171, 0, 1, 0.9058824, 1,
-0.03833127, 0.3994296, 0.6904728, 0, 1, 0.9098039, 1,
-0.03466476, 1.573617, -0.3442245, 0, 1, 0.9176471, 1,
-0.03388873, 0.6968252, -0.5502733, 0, 1, 0.9215686, 1,
-0.03125107, 1.159857, -0.7376019, 0, 1, 0.9294118, 1,
-0.02052179, -0.2029853, -1.024555, 0, 1, 0.9333333, 1,
-0.01840835, 0.6705021, 0.2558833, 0, 1, 0.9411765, 1,
-0.01133411, 1.335032, -0.5078668, 0, 1, 0.945098, 1,
-0.01083069, -0.04277637, -4.051066, 0, 1, 0.9529412, 1,
-0.00772914, 1.636811, 0.105321, 0, 1, 0.9568627, 1,
-0.005585086, 0.2479014, 0.1559037, 0, 1, 0.9647059, 1,
-0.0008024165, 0.3020969, 0.2144085, 0, 1, 0.9686275, 1,
-0.000129914, 0.5983144, 1.268496, 0, 1, 0.9764706, 1,
0.0006085749, 0.5940909, -0.6632129, 0, 1, 0.9803922, 1,
0.002090671, -0.7808354, 2.913493, 0, 1, 0.9882353, 1,
0.00259342, 2.018452, 0.6857919, 0, 1, 0.9921569, 1,
0.003692883, -0.6611626, 4.881212, 0, 1, 1, 1,
0.003898435, -0.9846376, 2.651631, 0, 0.9921569, 1, 1,
0.004285249, 0.7742557, 0.4398691, 0, 0.9882353, 1, 1,
0.004521785, 0.3141393, 0.9486209, 0, 0.9803922, 1, 1,
0.008735759, -0.6141622, 3.381626, 0, 0.9764706, 1, 1,
0.0098535, -6.7801e-05, 2.176882, 0, 0.9686275, 1, 1,
0.01276764, -0.400332, 3.467099, 0, 0.9647059, 1, 1,
0.01598726, 0.2995229, -0.2492078, 0, 0.9568627, 1, 1,
0.01627007, 1.061721, 0.7881288, 0, 0.9529412, 1, 1,
0.0186238, 1.812795, 0.8108163, 0, 0.945098, 1, 1,
0.0200543, -0.930009, 3.290445, 0, 0.9411765, 1, 1,
0.02519683, -0.5577791, 4.46325, 0, 0.9333333, 1, 1,
0.02568503, -0.2327821, 2.201763, 0, 0.9294118, 1, 1,
0.02620656, -0.76451, 2.222773, 0, 0.9215686, 1, 1,
0.02965717, -0.01183857, 1.22295, 0, 0.9176471, 1, 1,
0.03043192, -0.1739214, 1.994672, 0, 0.9098039, 1, 1,
0.0346753, 1.342174, -0.06891419, 0, 0.9058824, 1, 1,
0.03537732, 0.5875015, 1.001131, 0, 0.8980392, 1, 1,
0.03579077, 0.0206125, 0.9753131, 0, 0.8901961, 1, 1,
0.03698608, -0.4162884, 2.052234, 0, 0.8862745, 1, 1,
0.0374934, 0.8271823, -0.5171478, 0, 0.8784314, 1, 1,
0.038418, 1.15143, 0.4986102, 0, 0.8745098, 1, 1,
0.04808597, -0.1806023, 3.815195, 0, 0.8666667, 1, 1,
0.05543686, 0.02716767, 1.768288, 0, 0.8627451, 1, 1,
0.05665691, -1.691916, 1.620775, 0, 0.854902, 1, 1,
0.0578368, 0.008185375, 0.9397112, 0, 0.8509804, 1, 1,
0.05845385, 0.4129123, -0.2867638, 0, 0.8431373, 1, 1,
0.05965442, -0.5242091, 2.600377, 0, 0.8392157, 1, 1,
0.06060774, -2.936394, 1.864693, 0, 0.8313726, 1, 1,
0.06417373, 1.20899, -0.6734436, 0, 0.827451, 1, 1,
0.06626116, 3.132247, -0.541111, 0, 0.8196079, 1, 1,
0.06706874, -0.3533879, 2.215962, 0, 0.8156863, 1, 1,
0.06838394, 2.044775, 0.07438826, 0, 0.8078431, 1, 1,
0.07090071, 0.8525111, 0.5575054, 0, 0.8039216, 1, 1,
0.07282526, -1.081087, 3.835864, 0, 0.7960784, 1, 1,
0.07748388, 2.029121, 0.4538714, 0, 0.7882353, 1, 1,
0.07807489, -1.984192, 2.146193, 0, 0.7843137, 1, 1,
0.07906295, 1.138447, -0.516317, 0, 0.7764706, 1, 1,
0.08392748, -0.38671, 3.535944, 0, 0.772549, 1, 1,
0.08484236, -1.812656, 3.100952, 0, 0.7647059, 1, 1,
0.08627286, -1.170707, 2.103791, 0, 0.7607843, 1, 1,
0.08690608, 1.028617, -0.2664055, 0, 0.7529412, 1, 1,
0.08786871, -0.02883758, 1.73589, 0, 0.7490196, 1, 1,
0.08809339, 1.056705, 0.6932843, 0, 0.7411765, 1, 1,
0.0916995, -0.8663912, 2.437116, 0, 0.7372549, 1, 1,
0.09317663, 1.538149, -0.2244312, 0, 0.7294118, 1, 1,
0.09422107, -1.299505, 1.66452, 0, 0.7254902, 1, 1,
0.0947047, 0.4301253, 0.04289768, 0, 0.7176471, 1, 1,
0.09578758, -0.6633177, 2.391929, 0, 0.7137255, 1, 1,
0.09845258, -2.755723, 2.897341, 0, 0.7058824, 1, 1,
0.09986372, 1.935563, 0.1595133, 0, 0.6980392, 1, 1,
0.1000817, 1.297823, -1.119123, 0, 0.6941177, 1, 1,
0.1061403, -1.156685, 2.902713, 0, 0.6862745, 1, 1,
0.1160889, 0.6919898, 0.3712839, 0, 0.682353, 1, 1,
0.1181004, 0.664425, 0.8613278, 0, 0.6745098, 1, 1,
0.1255979, 2.706015, -1.728395, 0, 0.6705883, 1, 1,
0.1318742, 0.1496917, -0.2383565, 0, 0.6627451, 1, 1,
0.1389956, 0.2986265, 2.585084, 0, 0.6588235, 1, 1,
0.1403762, 0.9587893, 1.700638, 0, 0.6509804, 1, 1,
0.1418887, 0.6321959, -0.2080665, 0, 0.6470588, 1, 1,
0.1422274, 0.411674, -0.06339575, 0, 0.6392157, 1, 1,
0.1446885, 0.1363963, -0.1042081, 0, 0.6352941, 1, 1,
0.1458025, 2.562503, -0.3528205, 0, 0.627451, 1, 1,
0.1478465, -0.744655, 4.625081, 0, 0.6235294, 1, 1,
0.1567991, 0.5039545, 1.553646, 0, 0.6156863, 1, 1,
0.1572102, -1.304229, 4.059308, 0, 0.6117647, 1, 1,
0.1593925, -0.613476, 2.999436, 0, 0.6039216, 1, 1,
0.1598725, -0.7895953, 3.381144, 0, 0.5960785, 1, 1,
0.1640409, 0.04614743, 2.32224, 0, 0.5921569, 1, 1,
0.1683883, -0.5359027, 3.809948, 0, 0.5843138, 1, 1,
0.170125, -1.007833, 4.920326, 0, 0.5803922, 1, 1,
0.1709295, 0.3201072, 0.4595785, 0, 0.572549, 1, 1,
0.1736982, -0.4941359, 3.835079, 0, 0.5686275, 1, 1,
0.1803025, 0.8263581, 1.120299, 0, 0.5607843, 1, 1,
0.1817664, -1.019421, 2.135676, 0, 0.5568628, 1, 1,
0.1872678, -1.352926, 3.565547, 0, 0.5490196, 1, 1,
0.1894017, 1.222529, 0.6207029, 0, 0.5450981, 1, 1,
0.1907551, -1.337794, 3.383808, 0, 0.5372549, 1, 1,
0.1938418, 1.332964, -0.2066274, 0, 0.5333334, 1, 1,
0.2000498, 0.7589893, 1.151909, 0, 0.5254902, 1, 1,
0.2001594, -1.965584, 3.444184, 0, 0.5215687, 1, 1,
0.2037206, 0.3165853, -0.4169878, 0, 0.5137255, 1, 1,
0.2067227, 0.4402859, 0.5534568, 0, 0.509804, 1, 1,
0.2070438, 0.4985201, 1.076942, 0, 0.5019608, 1, 1,
0.218808, -0.4982955, 3.12907, 0, 0.4941176, 1, 1,
0.2195671, -1.029199, 4.781924, 0, 0.4901961, 1, 1,
0.2218269, 0.315773, -0.8468976, 0, 0.4823529, 1, 1,
0.2228469, -1.332371, 2.410478, 0, 0.4784314, 1, 1,
0.2245152, 0.757344, 0.9824556, 0, 0.4705882, 1, 1,
0.2267338, 0.8788878, -0.4107376, 0, 0.4666667, 1, 1,
0.2294283, -1.190658, 5.395192, 0, 0.4588235, 1, 1,
0.2297985, 0.4208632, 0.5703403, 0, 0.454902, 1, 1,
0.2309666, 0.7445237, -0.3041536, 0, 0.4470588, 1, 1,
0.231088, -0.3267056, 1.299764, 0, 0.4431373, 1, 1,
0.2364916, 0.9387375, 2.157973, 0, 0.4352941, 1, 1,
0.2411311, -1.102833, 4.264606, 0, 0.4313726, 1, 1,
0.2415265, 0.3580658, 0.6250509, 0, 0.4235294, 1, 1,
0.2419535, 0.4171631, -0.2189656, 0, 0.4196078, 1, 1,
0.2427162, -0.4879175, 2.879962, 0, 0.4117647, 1, 1,
0.2432743, 0.08405598, 1.499303, 0, 0.4078431, 1, 1,
0.2461697, 1.091145, 1.866666, 0, 0.4, 1, 1,
0.250473, -0.6940768, 3.868694, 0, 0.3921569, 1, 1,
0.2537526, 0.5261119, 3.948122, 0, 0.3882353, 1, 1,
0.2559458, 2.928477, 1.742032, 0, 0.3803922, 1, 1,
0.2566036, -0.08829118, -0.6779813, 0, 0.3764706, 1, 1,
0.2606902, 1.842907, -0.94411, 0, 0.3686275, 1, 1,
0.2621804, -0.4244719, 2.534372, 0, 0.3647059, 1, 1,
0.2692694, -0.8449218, 3.27926, 0, 0.3568628, 1, 1,
0.2701133, 0.06427507, 2.721466, 0, 0.3529412, 1, 1,
0.2760943, 0.02786352, 1.193241, 0, 0.345098, 1, 1,
0.2774951, -2.168587, 2.781089, 0, 0.3411765, 1, 1,
0.280207, 2.171509, 1.003613, 0, 0.3333333, 1, 1,
0.2814687, -1.306357, 2.799821, 0, 0.3294118, 1, 1,
0.2814752, 0.6642518, 1.709048, 0, 0.3215686, 1, 1,
0.2895129, 1.110396, -1.662968, 0, 0.3176471, 1, 1,
0.2897138, -0.5119923, 1.79776, 0, 0.3098039, 1, 1,
0.2898602, 1.163128, 1.477825, 0, 0.3058824, 1, 1,
0.2951558, 1.288129, -0.605287, 0, 0.2980392, 1, 1,
0.3031879, -0.522219, 3.354067, 0, 0.2901961, 1, 1,
0.3049279, 0.3318371, 1.006614, 0, 0.2862745, 1, 1,
0.3176606, -2.314227, 3.479644, 0, 0.2784314, 1, 1,
0.3188444, -1.35827, 2.089042, 0, 0.2745098, 1, 1,
0.319611, 0.906588, 0.7905301, 0, 0.2666667, 1, 1,
0.3209996, 1.150898, 0.7352856, 0, 0.2627451, 1, 1,
0.3275986, 0.9404396, -1.308532, 0, 0.254902, 1, 1,
0.3308365, -0.6341399, 2.061612, 0, 0.2509804, 1, 1,
0.334517, 1.313924, 0.2121286, 0, 0.2431373, 1, 1,
0.3404043, 0.5417848, 0.1098687, 0, 0.2392157, 1, 1,
0.3406031, 1.510429, 2.310055, 0, 0.2313726, 1, 1,
0.3465448, 1.096961, 1.422407, 0, 0.227451, 1, 1,
0.3481606, -1.753737, 3.379028, 0, 0.2196078, 1, 1,
0.3497526, -1.109118, 3.080826, 0, 0.2156863, 1, 1,
0.3545164, -1.159125, 1.659757, 0, 0.2078431, 1, 1,
0.3565008, -0.1184452, 3.000556, 0, 0.2039216, 1, 1,
0.3572497, -0.8279447, 4.034829, 0, 0.1960784, 1, 1,
0.3584187, 1.341977, 1.428162, 0, 0.1882353, 1, 1,
0.3593143, 0.3666732, 0.009717974, 0, 0.1843137, 1, 1,
0.3604964, -0.02229247, 1.718086, 0, 0.1764706, 1, 1,
0.3631574, -0.7265929, 2.590407, 0, 0.172549, 1, 1,
0.3642772, -0.5557269, 3.319626, 0, 0.1647059, 1, 1,
0.3646258, 1.593851, -0.06575456, 0, 0.1607843, 1, 1,
0.3697231, -2.072834, 1.032489, 0, 0.1529412, 1, 1,
0.3732637, 0.145684, 1.922724, 0, 0.1490196, 1, 1,
0.3771918, 0.9681166, -0.2653458, 0, 0.1411765, 1, 1,
0.382373, 1.16958, -0.2677514, 0, 0.1372549, 1, 1,
0.3832445, 0.2887412, 1.926993, 0, 0.1294118, 1, 1,
0.3885233, 0.4184991, -0.2662785, 0, 0.1254902, 1, 1,
0.3894193, -0.6544113, 3.039687, 0, 0.1176471, 1, 1,
0.3996505, 1.890278, 0.6921022, 0, 0.1137255, 1, 1,
0.4016042, 0.327462, -0.003552553, 0, 0.1058824, 1, 1,
0.4028702, -0.9105809, 1.496565, 0, 0.09803922, 1, 1,
0.4063511, -0.3617385, 1.777279, 0, 0.09411765, 1, 1,
0.4069793, 0.4311883, -0.5127591, 0, 0.08627451, 1, 1,
0.4073432, -1.028953, 2.046576, 0, 0.08235294, 1, 1,
0.4080075, -0.6345794, 2.311311, 0, 0.07450981, 1, 1,
0.4113317, -0.5323302, 1.609394, 0, 0.07058824, 1, 1,
0.4121731, 0.4632515, 0.8452457, 0, 0.0627451, 1, 1,
0.4130663, -0.2714235, 2.003742, 0, 0.05882353, 1, 1,
0.4193574, -0.2185758, 2.279352, 0, 0.05098039, 1, 1,
0.419954, -1.017159, 2.139997, 0, 0.04705882, 1, 1,
0.4214472, 0.3243043, 1.762673, 0, 0.03921569, 1, 1,
0.4230001, 1.157795, 0.6978489, 0, 0.03529412, 1, 1,
0.4264715, -0.5002592, 2.724773, 0, 0.02745098, 1, 1,
0.4272552, -0.2642549, 3.092386, 0, 0.02352941, 1, 1,
0.4314644, 0.1055881, 1.092844, 0, 0.01568628, 1, 1,
0.4319572, 0.9754561, -0.7732804, 0, 0.01176471, 1, 1,
0.4328057, -2.015242, 2.976831, 0, 0.003921569, 1, 1,
0.4344668, 0.3601272, 2.597183, 0.003921569, 0, 1, 1,
0.4345958, 0.2179911, 0.3334475, 0.007843138, 0, 1, 1,
0.4349012, 0.9422951, 1.085181, 0.01568628, 0, 1, 1,
0.4372652, -1.281718, 3.706635, 0.01960784, 0, 1, 1,
0.4424672, 0.6437876, 0.9952566, 0.02745098, 0, 1, 1,
0.4473197, 0.1965932, 0.8391469, 0.03137255, 0, 1, 1,
0.4499668, -1.22317, 3.906678, 0.03921569, 0, 1, 1,
0.4569933, 1.078014, 0.7220034, 0.04313726, 0, 1, 1,
0.4582353, -0.5457497, 1.742839, 0.05098039, 0, 1, 1,
0.4588747, -0.4703138, 4.091312, 0.05490196, 0, 1, 1,
0.4714303, -0.06771453, -0.8525872, 0.0627451, 0, 1, 1,
0.4724773, -0.2580304, 3.811574, 0.06666667, 0, 1, 1,
0.4908256, 1.743335, 0.951692, 0.07450981, 0, 1, 1,
0.4927464, 0.1508653, -0.1429797, 0.07843138, 0, 1, 1,
0.4937564, -0.9117811, 1.444715, 0.08627451, 0, 1, 1,
0.4939319, -1.449437, 2.290598, 0.09019608, 0, 1, 1,
0.4965834, -1.629028, 3.79873, 0.09803922, 0, 1, 1,
0.4967239, -0.9002584, 4.152294, 0.1058824, 0, 1, 1,
0.4988258, -1.770201, 3.140129, 0.1098039, 0, 1, 1,
0.5000163, -2.748476, 2.086842, 0.1176471, 0, 1, 1,
0.501806, -0.1516601, 2.054254, 0.1215686, 0, 1, 1,
0.5019794, -0.6419486, 1.73895, 0.1294118, 0, 1, 1,
0.5023414, -0.1272556, 2.12197, 0.1333333, 0, 1, 1,
0.5043097, 0.5819438, -1.29266, 0.1411765, 0, 1, 1,
0.5043739, -1.055766, 2.16117, 0.145098, 0, 1, 1,
0.5073854, 0.8791111, -0.07430828, 0.1529412, 0, 1, 1,
0.5081089, -0.6985917, 2.228629, 0.1568628, 0, 1, 1,
0.5112324, -1.04707, 2.964146, 0.1647059, 0, 1, 1,
0.5164995, 1.330088, 0.08544627, 0.1686275, 0, 1, 1,
0.5172353, 2.087049, 0.7757573, 0.1764706, 0, 1, 1,
0.5201583, -0.5149248, 1.805337, 0.1803922, 0, 1, 1,
0.5268548, 0.7258759, -0.3389833, 0.1882353, 0, 1, 1,
0.5275674, -1.888315, 2.633756, 0.1921569, 0, 1, 1,
0.5318038, -0.2554046, 1.824779, 0.2, 0, 1, 1,
0.5352523, 1.141379, 1.180988, 0.2078431, 0, 1, 1,
0.5352665, -0.48277, 0.9091805, 0.2117647, 0, 1, 1,
0.5354672, 1.085663, 0.4862379, 0.2196078, 0, 1, 1,
0.557901, 0.2721544, -0.5439885, 0.2235294, 0, 1, 1,
0.5608219, 0.09293621, 2.450669, 0.2313726, 0, 1, 1,
0.5675734, -0.6863927, 2.516973, 0.2352941, 0, 1, 1,
0.5693714, -0.8577243, 3.225535, 0.2431373, 0, 1, 1,
0.5713921, 0.7346419, -0.4967183, 0.2470588, 0, 1, 1,
0.5794433, 1.277489, 1.926129, 0.254902, 0, 1, 1,
0.5795828, 1.384575, 1.43386, 0.2588235, 0, 1, 1,
0.5795832, -0.9576244, 1.91905, 0.2666667, 0, 1, 1,
0.5814935, -0.775659, 3.118237, 0.2705882, 0, 1, 1,
0.5835904, 1.176807, 0.7702028, 0.2784314, 0, 1, 1,
0.5860873, 1.009704, 0.3404214, 0.282353, 0, 1, 1,
0.5872638, -1.52673, 3.83677, 0.2901961, 0, 1, 1,
0.5941789, -0.6450302, 1.34566, 0.2941177, 0, 1, 1,
0.6035765, 1.098805, 0.2093482, 0.3019608, 0, 1, 1,
0.6047906, 1.527093, 1.494324, 0.3098039, 0, 1, 1,
0.6103718, 0.5466632, 2.518152, 0.3137255, 0, 1, 1,
0.6106398, 0.4414397, 0.03855516, 0.3215686, 0, 1, 1,
0.6141819, 0.1629078, -0.2671492, 0.3254902, 0, 1, 1,
0.6183025, -1.689801, 3.188626, 0.3333333, 0, 1, 1,
0.6208552, 0.9535457, 1.351049, 0.3372549, 0, 1, 1,
0.6233181, 0.1430644, 0.4804351, 0.345098, 0, 1, 1,
0.6233647, 0.2738799, 1.583471, 0.3490196, 0, 1, 1,
0.628933, 1.127291, -0.198023, 0.3568628, 0, 1, 1,
0.6290144, 1.065792, -0.0948657, 0.3607843, 0, 1, 1,
0.6311772, -2.256629, 1.513377, 0.3686275, 0, 1, 1,
0.6329925, 1.378332, -1.318807, 0.372549, 0, 1, 1,
0.6331412, -1.296191, 3.472314, 0.3803922, 0, 1, 1,
0.6369973, 0.6471826, 1.727946, 0.3843137, 0, 1, 1,
0.6462283, 1.455544, 0.2440164, 0.3921569, 0, 1, 1,
0.6495242, 2.597354, 0.03498901, 0.3960784, 0, 1, 1,
0.6502579, -0.6131398, 1.171316, 0.4039216, 0, 1, 1,
0.650733, 1.979547, 0.4502654, 0.4117647, 0, 1, 1,
0.6517173, 0.7114749, 0.6211985, 0.4156863, 0, 1, 1,
0.6579477, 0.127239, -0.7627069, 0.4235294, 0, 1, 1,
0.6629668, -2.792106, 3.656672, 0.427451, 0, 1, 1,
0.6652161, 1.527786, -0.01302201, 0.4352941, 0, 1, 1,
0.6669666, -0.6799275, 4.517737, 0.4392157, 0, 1, 1,
0.6686028, -1.101977, 3.547225, 0.4470588, 0, 1, 1,
0.677002, -0.8862187, 2.34531, 0.4509804, 0, 1, 1,
0.6789528, -0.134579, 1.755283, 0.4588235, 0, 1, 1,
0.6800495, -1.115623, 4.051681, 0.4627451, 0, 1, 1,
0.6886066, 0.51511, 2.240995, 0.4705882, 0, 1, 1,
0.6923254, 0.9803112, 0.940815, 0.4745098, 0, 1, 1,
0.6923407, 0.04586557, 1.611145, 0.4823529, 0, 1, 1,
0.6952128, -0.396581, 1.413449, 0.4862745, 0, 1, 1,
0.7185585, 1.530281, 1.087008, 0.4941176, 0, 1, 1,
0.7190253, -0.866937, 2.803449, 0.5019608, 0, 1, 1,
0.723742, 0.3648258, 1.446141, 0.5058824, 0, 1, 1,
0.7280039, 1.280605, 1.924536, 0.5137255, 0, 1, 1,
0.7292581, 0.3509378, 1.077121, 0.5176471, 0, 1, 1,
0.7349442, -0.2083173, 2.224396, 0.5254902, 0, 1, 1,
0.7387266, -1.061604, 2.308963, 0.5294118, 0, 1, 1,
0.7418161, -0.3548719, 2.503201, 0.5372549, 0, 1, 1,
0.745851, 0.5483177, 0.8820154, 0.5411765, 0, 1, 1,
0.7479349, 2.200671, 0.6701344, 0.5490196, 0, 1, 1,
0.750138, 0.4514679, 0.2090481, 0.5529412, 0, 1, 1,
0.7529839, 0.6384284, 0.2533897, 0.5607843, 0, 1, 1,
0.7534011, 0.7605568, 2.835307, 0.5647059, 0, 1, 1,
0.7555208, -0.6895041, 3.612188, 0.572549, 0, 1, 1,
0.7592304, -0.2014611, 3.011123, 0.5764706, 0, 1, 1,
0.7607002, -0.7460945, 3.188758, 0.5843138, 0, 1, 1,
0.7611142, 0.8544642, 0.1900889, 0.5882353, 0, 1, 1,
0.7644268, 0.3936587, 0.2929569, 0.5960785, 0, 1, 1,
0.7664646, -0.8004272, 2.438153, 0.6039216, 0, 1, 1,
0.7706068, 1.727932, -1.148454, 0.6078432, 0, 1, 1,
0.7725786, -1.106354, 4.002801, 0.6156863, 0, 1, 1,
0.7728735, 0.656215, 1.414913, 0.6196079, 0, 1, 1,
0.7749329, 0.4166351, 2.656965, 0.627451, 0, 1, 1,
0.7757816, 0.6885602, -0.1410785, 0.6313726, 0, 1, 1,
0.7761677, 0.3411063, 1.062535, 0.6392157, 0, 1, 1,
0.7793568, -0.1669919, 0.3347184, 0.6431373, 0, 1, 1,
0.7804828, -0.1254071, 1.375932, 0.6509804, 0, 1, 1,
0.7806554, 0.03466088, 3.038679, 0.654902, 0, 1, 1,
0.7808704, -1.953622, 2.62478, 0.6627451, 0, 1, 1,
0.7820168, -0.2238833, 3.406132, 0.6666667, 0, 1, 1,
0.7825485, -0.6014055, 3.049586, 0.6745098, 0, 1, 1,
0.7877088, -1.642, 3.547873, 0.6784314, 0, 1, 1,
0.7881901, -0.4858588, 1.938186, 0.6862745, 0, 1, 1,
0.7903314, 0.002804436, 0.8785757, 0.6901961, 0, 1, 1,
0.8000148, -1.340807, 2.163996, 0.6980392, 0, 1, 1,
0.8006841, 1.179614, -0.1522512, 0.7058824, 0, 1, 1,
0.8089359, -0.4129924, 2.431509, 0.7098039, 0, 1, 1,
0.8092687, -0.9552636, 2.381342, 0.7176471, 0, 1, 1,
0.8131772, 0.5810707, -0.3510286, 0.7215686, 0, 1, 1,
0.8190656, -3.107071, 2.956943, 0.7294118, 0, 1, 1,
0.8206857, 1.123786, 1.384458, 0.7333333, 0, 1, 1,
0.8224084, -0.8509309, 2.891131, 0.7411765, 0, 1, 1,
0.8226197, 0.3162466, 2.275618, 0.7450981, 0, 1, 1,
0.8289062, 1.684422, -1.564303, 0.7529412, 0, 1, 1,
0.8342843, -1.358189, 1.281504, 0.7568628, 0, 1, 1,
0.8347456, -1.848926, 0.9860061, 0.7647059, 0, 1, 1,
0.8442742, -0.3451529, 2.153188, 0.7686275, 0, 1, 1,
0.8463202, -0.07498506, 2.500789, 0.7764706, 0, 1, 1,
0.8477073, 1.772603, 1.257837, 0.7803922, 0, 1, 1,
0.8492087, 0.2761077, 2.091184, 0.7882353, 0, 1, 1,
0.8516635, -0.3121293, 0.8415419, 0.7921569, 0, 1, 1,
0.8519455, 0.6395285, 0.6415418, 0.8, 0, 1, 1,
0.8527068, -0.4638449, 2.000447, 0.8078431, 0, 1, 1,
0.8595557, 0.06034384, 2.202808, 0.8117647, 0, 1, 1,
0.8602111, 1.13026, 0.1100327, 0.8196079, 0, 1, 1,
0.8637086, 0.7590007, 1.822324, 0.8235294, 0, 1, 1,
0.8637761, 0.8147889, 0.4647287, 0.8313726, 0, 1, 1,
0.8638803, -0.3702986, 0.2966674, 0.8352941, 0, 1, 1,
0.8639308, 1.020228, 0.228215, 0.8431373, 0, 1, 1,
0.8660759, -0.844939, 2.740521, 0.8470588, 0, 1, 1,
0.8665072, -0.4572582, 1.543422, 0.854902, 0, 1, 1,
0.8718549, 0.7101986, 2.234848, 0.8588235, 0, 1, 1,
0.8739727, -1.128596, 3.369134, 0.8666667, 0, 1, 1,
0.876855, -1.078055, 3.393203, 0.8705882, 0, 1, 1,
0.8810089, -0.5481031, 1.95973, 0.8784314, 0, 1, 1,
0.8858551, 0.88239, 0.8473524, 0.8823529, 0, 1, 1,
0.891701, 0.01033345, -0.04954142, 0.8901961, 0, 1, 1,
0.8952298, -0.8311189, 1.11205, 0.8941177, 0, 1, 1,
0.8961457, 0.7410534, 1.084894, 0.9019608, 0, 1, 1,
0.8965749, 0.1430414, 2.771366, 0.9098039, 0, 1, 1,
0.9020135, 0.1387207, 1.508352, 0.9137255, 0, 1, 1,
0.9051651, 0.8314319, -0.01997055, 0.9215686, 0, 1, 1,
0.9092314, -0.2868292, 2.401864, 0.9254902, 0, 1, 1,
0.9145136, -0.8917041, 2.30383, 0.9333333, 0, 1, 1,
0.9152247, 0.1764483, 2.399245, 0.9372549, 0, 1, 1,
0.9193993, -0.1236733, -0.8034278, 0.945098, 0, 1, 1,
0.9225891, 1.437435, 0.2425518, 0.9490196, 0, 1, 1,
0.9249322, -0.517501, 2.019514, 0.9568627, 0, 1, 1,
0.9297869, -0.4833332, 0.8735215, 0.9607843, 0, 1, 1,
0.9309334, -1.610724, 3.202926, 0.9686275, 0, 1, 1,
0.9385083, -1.889546, 2.877882, 0.972549, 0, 1, 1,
0.9497039, -0.3046609, 2.295094, 0.9803922, 0, 1, 1,
0.9501686, 0.9586409, 1.119343, 0.9843137, 0, 1, 1,
0.9514189, 0.4670574, 0.7984225, 0.9921569, 0, 1, 1,
0.9575588, -0.1099826, 1.398622, 0.9960784, 0, 1, 1,
0.9675333, 2.492094, 0.08159329, 1, 0, 0.9960784, 1,
0.9711676, 0.08874562, -0.657801, 1, 0, 0.9882353, 1,
0.9772316, -1.789412, 1.033978, 1, 0, 0.9843137, 1,
0.9883843, -0.3249927, 2.029338, 1, 0, 0.9764706, 1,
0.9904293, -0.3774006, 1.382735, 1, 0, 0.972549, 1,
0.9912629, -0.8667951, 1.356833, 1, 0, 0.9647059, 1,
0.9942997, -0.312869, 1.237044, 1, 0, 0.9607843, 1,
0.9962261, -1.762945, 2.07472, 1, 0, 0.9529412, 1,
1.007773, 0.4006103, 0.780296, 1, 0, 0.9490196, 1,
1.013151, 2.079925, 1.06871, 1, 0, 0.9411765, 1,
1.018717, -0.2756634, 0.5783866, 1, 0, 0.9372549, 1,
1.025081, -0.9054421, 2.875603, 1, 0, 0.9294118, 1,
1.033281, -0.3158595, 2.401347, 1, 0, 0.9254902, 1,
1.033419, -1.082055, 2.010761, 1, 0, 0.9176471, 1,
1.040324, 0.4893253, 2.017854, 1, 0, 0.9137255, 1,
1.042189, -1.929422, 2.522483, 1, 0, 0.9058824, 1,
1.043762, -0.4251059, -0.08646023, 1, 0, 0.9019608, 1,
1.04406, -0.6603327, 1.692785, 1, 0, 0.8941177, 1,
1.051488, -0.01175271, 1.563334, 1, 0, 0.8862745, 1,
1.068371, 0.6992888, 1.397432, 1, 0, 0.8823529, 1,
1.068531, 1.500601, 0.473953, 1, 0, 0.8745098, 1,
1.086766, -0.3724697, 1.134752, 1, 0, 0.8705882, 1,
1.087238, -0.1306938, 1.833881, 1, 0, 0.8627451, 1,
1.10448, 0.4362831, -0.008796677, 1, 0, 0.8588235, 1,
1.106376, 0.8081725, -0.09430733, 1, 0, 0.8509804, 1,
1.107356, -0.4580367, 0.3845429, 1, 0, 0.8470588, 1,
1.109118, 1.546731, 1.668795, 1, 0, 0.8392157, 1,
1.11184, 1.545185, -0.5733255, 1, 0, 0.8352941, 1,
1.116263, 0.8246056, 1.260465, 1, 0, 0.827451, 1,
1.119979, -0.2077127, 0.764335, 1, 0, 0.8235294, 1,
1.122396, -1.548387, 2.126686, 1, 0, 0.8156863, 1,
1.122468, 0.03632943, 1.087375, 1, 0, 0.8117647, 1,
1.126317, -0.2662898, 1.688472, 1, 0, 0.8039216, 1,
1.131094, -0.303308, 2.008263, 1, 0, 0.7960784, 1,
1.132872, -1.947244, 1.70674, 1, 0, 0.7921569, 1,
1.133279, 1.012999, 0.6263582, 1, 0, 0.7843137, 1,
1.138257, -2.686516, 1.446344, 1, 0, 0.7803922, 1,
1.144313, 0.1678814, 1.666456, 1, 0, 0.772549, 1,
1.14802, -0.04121504, 1.290629, 1, 0, 0.7686275, 1,
1.152664, -0.4181274, 0.5335793, 1, 0, 0.7607843, 1,
1.154077, -1.380661, 2.159164, 1, 0, 0.7568628, 1,
1.157145, 1.403604, -0.503134, 1, 0, 0.7490196, 1,
1.15754, -0.2594764, 1.159836, 1, 0, 0.7450981, 1,
1.160628, 0.9557338, 1.205295, 1, 0, 0.7372549, 1,
1.172301, 1.676577, 0.06537396, 1, 0, 0.7333333, 1,
1.17284, -0.9020007, 1.534655, 1, 0, 0.7254902, 1,
1.181087, -1.160253, 2.172151, 1, 0, 0.7215686, 1,
1.181589, -0.5689879, 3.732009, 1, 0, 0.7137255, 1,
1.182319, -1.743176, 2.923464, 1, 0, 0.7098039, 1,
1.182921, -0.1957549, 1.443177, 1, 0, 0.7019608, 1,
1.183744, -1.338991, 2.149911, 1, 0, 0.6941177, 1,
1.191587, 0.1837382, 1.922577, 1, 0, 0.6901961, 1,
1.194496, -1.099224, 1.824496, 1, 0, 0.682353, 1,
1.206278, -0.4852771, 3.648519, 1, 0, 0.6784314, 1,
1.206405, 2.638346, -0.1740593, 1, 0, 0.6705883, 1,
1.215967, -2.280882, 2.047749, 1, 0, 0.6666667, 1,
1.241013, 0.3957209, 2.526448, 1, 0, 0.6588235, 1,
1.242622, 0.4193362, 0.5635913, 1, 0, 0.654902, 1,
1.247804, 0.7564039, 2.942717, 1, 0, 0.6470588, 1,
1.248059, -0.1219613, 0.3118098, 1, 0, 0.6431373, 1,
1.252374, -0.3008374, 1.190482, 1, 0, 0.6352941, 1,
1.254748, -1.321906, 2.363837, 1, 0, 0.6313726, 1,
1.258791, -0.4569104, 2.357249, 1, 0, 0.6235294, 1,
1.259632, 1.1004, 2.292356, 1, 0, 0.6196079, 1,
1.281771, 1.260883, 0.7276473, 1, 0, 0.6117647, 1,
1.282468, -0.4307671, 1.132374, 1, 0, 0.6078432, 1,
1.283198, -1.179099, 1.310862, 1, 0, 0.6, 1,
1.286331, -0.9509858, 4.092017, 1, 0, 0.5921569, 1,
1.288876, 0.2706372, 3.080242, 1, 0, 0.5882353, 1,
1.299057, 3.004136, -0.2558849, 1, 0, 0.5803922, 1,
1.301036, -0.178212, 1.460766, 1, 0, 0.5764706, 1,
1.306343, -1.034604, 2.468061, 1, 0, 0.5686275, 1,
1.310112, -0.6687106, 1.887676, 1, 0, 0.5647059, 1,
1.311145, 0.6981356, 3.216809, 1, 0, 0.5568628, 1,
1.315171, 0.133162, 2.513986, 1, 0, 0.5529412, 1,
1.316298, -0.3950456, 1.344555, 1, 0, 0.5450981, 1,
1.337129, 1.442832, 1.376047, 1, 0, 0.5411765, 1,
1.363206, -1.121186, 2.315281, 1, 0, 0.5333334, 1,
1.375786, -0.8442637, 3.121741, 1, 0, 0.5294118, 1,
1.382624, -0.8151689, 2.862578, 1, 0, 0.5215687, 1,
1.385351, -0.4887601, 3.562744, 1, 0, 0.5176471, 1,
1.385611, -0.6006613, 1.226103, 1, 0, 0.509804, 1,
1.391831, 0.2543387, 3.75177, 1, 0, 0.5058824, 1,
1.394174, 0.7779444, 1.745335, 1, 0, 0.4980392, 1,
1.395005, 0.8061909, 0.922561, 1, 0, 0.4901961, 1,
1.396388, -0.2524649, 2.383688, 1, 0, 0.4862745, 1,
1.399135, 0.08617457, 2.645452, 1, 0, 0.4784314, 1,
1.403279, 0.2494838, 1.219958, 1, 0, 0.4745098, 1,
1.404898, 0.1229745, 0.9726645, 1, 0, 0.4666667, 1,
1.413374, 0.9390367, 0.114881, 1, 0, 0.4627451, 1,
1.415241, 0.1491265, 1.27862, 1, 0, 0.454902, 1,
1.420003, 1.752405, -0.878639, 1, 0, 0.4509804, 1,
1.4222, -0.1960277, 1.800142, 1, 0, 0.4431373, 1,
1.422691, 1.521219, 1.232648, 1, 0, 0.4392157, 1,
1.433443, 0.3683864, 1.062417, 1, 0, 0.4313726, 1,
1.436093, 1.520922, 1.0723, 1, 0, 0.427451, 1,
1.437251, -1.49792, 2.910944, 1, 0, 0.4196078, 1,
1.476654, -0.08005825, -0.9817684, 1, 0, 0.4156863, 1,
1.480015, 0.881865, 1.631123, 1, 0, 0.4078431, 1,
1.490845, 1.125424, 2.148192, 1, 0, 0.4039216, 1,
1.497432, -0.1624833, 1.180503, 1, 0, 0.3960784, 1,
1.50434, 0.4678321, 1.003551, 1, 0, 0.3882353, 1,
1.52092, 0.813364, -0.2825813, 1, 0, 0.3843137, 1,
1.523802, 0.5529213, -0.1326273, 1, 0, 0.3764706, 1,
1.524083, 0.1121531, 1.645483, 1, 0, 0.372549, 1,
1.525099, -1.125193, 4.033932, 1, 0, 0.3647059, 1,
1.54067, 0.987247, -0.9737376, 1, 0, 0.3607843, 1,
1.541265, -0.2894756, 4.421693, 1, 0, 0.3529412, 1,
1.54316, 1.15106, 0.2996, 1, 0, 0.3490196, 1,
1.551187, 0.7553232, -0.2006364, 1, 0, 0.3411765, 1,
1.552382, -0.04785717, 0.6575209, 1, 0, 0.3372549, 1,
1.55307, -0.1309009, 0.9553695, 1, 0, 0.3294118, 1,
1.580204, 0.3346969, 3.091921, 1, 0, 0.3254902, 1,
1.581713, 0.4879718, 1.01566, 1, 0, 0.3176471, 1,
1.582872, -0.6332184, 2.199342, 1, 0, 0.3137255, 1,
1.591207, 2.089972, 0.09171402, 1, 0, 0.3058824, 1,
1.591938, -1.64809, 2.441071, 1, 0, 0.2980392, 1,
1.597779, -0.7376522, 1.460515, 1, 0, 0.2941177, 1,
1.612483, 0.4248904, 1.595994, 1, 0, 0.2862745, 1,
1.613862, 0.444498, 2.104406, 1, 0, 0.282353, 1,
1.616608, -0.4069249, 3.520197, 1, 0, 0.2745098, 1,
1.627555, 0.2140867, 0.6277822, 1, 0, 0.2705882, 1,
1.644189, -1.108272, 1.663633, 1, 0, 0.2627451, 1,
1.652364, -0.3599221, 2.878501, 1, 0, 0.2588235, 1,
1.65287, -0.3310367, 1.941876, 1, 0, 0.2509804, 1,
1.65351, -0.1874524, 2.602775, 1, 0, 0.2470588, 1,
1.672296, -1.134554, 1.604257, 1, 0, 0.2392157, 1,
1.685652, -0.6754496, 2.187674, 1, 0, 0.2352941, 1,
1.696822, 0.2797484, 0.608049, 1, 0, 0.227451, 1,
1.705583, 0.1858459, 1.194224, 1, 0, 0.2235294, 1,
1.723395, -0.5644728, 3.821973, 1, 0, 0.2156863, 1,
1.731176, 1.419403, 0.8285507, 1, 0, 0.2117647, 1,
1.733056, 1.530804, 0.6345285, 1, 0, 0.2039216, 1,
1.733431, -0.5493057, 1.907017, 1, 0, 0.1960784, 1,
1.736126, -1.422749, 2.881019, 1, 0, 0.1921569, 1,
1.736634, 1.33233, -0.5863712, 1, 0, 0.1843137, 1,
1.747518, -0.157886, 2.747606, 1, 0, 0.1803922, 1,
1.749627, -0.3067895, 1.910614, 1, 0, 0.172549, 1,
1.751116, -0.1880845, 2.663982, 1, 0, 0.1686275, 1,
1.76251, 0.3207822, 2.023749, 1, 0, 0.1607843, 1,
1.78562, -1.508257, 1.411879, 1, 0, 0.1568628, 1,
1.805911, -0.8686662, 3.198694, 1, 0, 0.1490196, 1,
1.851971, -1.346979, 2.583178, 1, 0, 0.145098, 1,
1.876241, 0.4704679, 2.381301, 1, 0, 0.1372549, 1,
1.882542, -0.1753309, 1.362124, 1, 0, 0.1333333, 1,
1.904401, 0.3829073, 0.7616777, 1, 0, 0.1254902, 1,
1.955834, -1.191, 1.354669, 1, 0, 0.1215686, 1,
1.958488, 0.07617495, 1.57932, 1, 0, 0.1137255, 1,
1.960691, 1.309392, -2.327263, 1, 0, 0.1098039, 1,
1.974084, 0.4996161, 2.945539, 1, 0, 0.1019608, 1,
1.98136, 0.05977997, 0.5582252, 1, 0, 0.09411765, 1,
2.088467, 1.257421, 1.249689, 1, 0, 0.09019608, 1,
2.100721, -0.278957, 1.117642, 1, 0, 0.08235294, 1,
2.10931, 0.2181415, 2.510392, 1, 0, 0.07843138, 1,
2.124695, -1.777559, 0.3057823, 1, 0, 0.07058824, 1,
2.175743, 0.5071098, 1.802862, 1, 0, 0.06666667, 1,
2.20122, 0.5923312, 1.648607, 1, 0, 0.05882353, 1,
2.237928, 0.09792993, 0.5896808, 1, 0, 0.05490196, 1,
2.259027, -0.04306117, 0.5459797, 1, 0, 0.04705882, 1,
2.280025, 0.4189027, 1.326537, 1, 0, 0.04313726, 1,
2.317141, -0.06890825, 1.611166, 1, 0, 0.03529412, 1,
2.325235, -0.2502645, 2.28241, 1, 0, 0.03137255, 1,
2.57447, -0.2282185, 2.525289, 1, 0, 0.02352941, 1,
2.825751, 1.062176, 2.967658, 1, 0, 0.01960784, 1,
2.84436, 0.8380916, 1.170825, 1, 0, 0.01176471, 1,
2.923602, 0.0003988282, 1.875841, 1, 0, 0.007843138, 1
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
-0.09479952, -4.164635, -7.773478, 0, -0.5, 0.5, 0.5,
-0.09479952, -4.164635, -7.773478, 1, -0.5, 0.5, 0.5,
-0.09479952, -4.164635, -7.773478, 1, 1.5, 0.5, 0.5,
-0.09479952, -4.164635, -7.773478, 0, 1.5, 0.5, 0.5
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
-4.136439, 0.01258814, -7.773478, 0, -0.5, 0.5, 0.5,
-4.136439, 0.01258814, -7.773478, 1, -0.5, 0.5, 0.5,
-4.136439, 0.01258814, -7.773478, 1, 1.5, 0.5, 0.5,
-4.136439, 0.01258814, -7.773478, 0, 1.5, 0.5, 0.5
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
-4.136439, -4.164635, -0.2348504, 0, -0.5, 0.5, 0.5,
-4.136439, -4.164635, -0.2348504, 1, -0.5, 0.5, 0.5,
-4.136439, -4.164635, -0.2348504, 1, 1.5, 0.5, 0.5,
-4.136439, -4.164635, -0.2348504, 0, 1.5, 0.5, 0.5
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
-3, -3.200661, -6.033794,
2, -3.200661, -6.033794,
-3, -3.200661, -6.033794,
-3, -3.361323, -6.323741,
-2, -3.200661, -6.033794,
-2, -3.361323, -6.323741,
-1, -3.200661, -6.033794,
-1, -3.361323, -6.323741,
0, -3.200661, -6.033794,
0, -3.361323, -6.323741,
1, -3.200661, -6.033794,
1, -3.361323, -6.323741,
2, -3.200661, -6.033794,
2, -3.361323, -6.323741
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
-3, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
-3, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
-3, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
-3, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5,
-2, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
-2, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
-2, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
-2, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5,
-1, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
-1, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
-1, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
-1, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5,
0, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
0, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
0, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
0, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5,
1, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
1, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
1, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
1, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5,
2, -3.682648, -6.903636, 0, -0.5, 0.5, 0.5,
2, -3.682648, -6.903636, 1, -0.5, 0.5, 0.5,
2, -3.682648, -6.903636, 1, 1.5, 0.5, 0.5,
2, -3.682648, -6.903636, 0, 1.5, 0.5, 0.5
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
-3.203753, -3, -6.033794,
-3.203753, 3, -6.033794,
-3.203753, -3, -6.033794,
-3.359201, -3, -6.323741,
-3.203753, -2, -6.033794,
-3.359201, -2, -6.323741,
-3.203753, -1, -6.033794,
-3.359201, -1, -6.323741,
-3.203753, 0, -6.033794,
-3.359201, 0, -6.323741,
-3.203753, 1, -6.033794,
-3.359201, 1, -6.323741,
-3.203753, 2, -6.033794,
-3.359201, 2, -6.323741,
-3.203753, 3, -6.033794,
-3.359201, 3, -6.323741
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
-3.670096, -3, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, -3, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, -3, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, -3, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, -2, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, -2, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, -2, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, -2, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, -1, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, -1, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, -1, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, -1, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, 0, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, 0, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, 0, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, 0, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, 1, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, 1, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, 1, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, 1, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, 2, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, 2, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, 2, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, 2, -6.903636, 0, 1.5, 0.5, 0.5,
-3.670096, 3, -6.903636, 0, -0.5, 0.5, 0.5,
-3.670096, 3, -6.903636, 1, -0.5, 0.5, 0.5,
-3.670096, 3, -6.903636, 1, 1.5, 0.5, 0.5,
-3.670096, 3, -6.903636, 0, 1.5, 0.5, 0.5
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
-3.203753, -3.200661, -4,
-3.203753, -3.200661, 4,
-3.203753, -3.200661, -4,
-3.359201, -3.361323, -4,
-3.203753, -3.200661, -2,
-3.359201, -3.361323, -2,
-3.203753, -3.200661, 0,
-3.359201, -3.361323, 0,
-3.203753, -3.200661, 2,
-3.359201, -3.361323, 2,
-3.203753, -3.200661, 4,
-3.359201, -3.361323, 4
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
-3.670096, -3.682648, -4, 0, -0.5, 0.5, 0.5,
-3.670096, -3.682648, -4, 1, -0.5, 0.5, 0.5,
-3.670096, -3.682648, -4, 1, 1.5, 0.5, 0.5,
-3.670096, -3.682648, -4, 0, 1.5, 0.5, 0.5,
-3.670096, -3.682648, -2, 0, -0.5, 0.5, 0.5,
-3.670096, -3.682648, -2, 1, -0.5, 0.5, 0.5,
-3.670096, -3.682648, -2, 1, 1.5, 0.5, 0.5,
-3.670096, -3.682648, -2, 0, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 0, 0, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 0, 1, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 0, 1, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 0, 0, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 2, 0, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 2, 1, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 2, 1, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 2, 0, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 4, 0, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 4, 1, -0.5, 0.5, 0.5,
-3.670096, -3.682648, 4, 1, 1.5, 0.5, 0.5,
-3.670096, -3.682648, 4, 0, 1.5, 0.5, 0.5
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
-3.203753, -3.200661, -6.033794,
-3.203753, 3.225837, -6.033794,
-3.203753, -3.200661, 5.564094,
-3.203753, 3.225837, 5.564094,
-3.203753, -3.200661, -6.033794,
-3.203753, -3.200661, 5.564094,
-3.203753, 3.225837, -6.033794,
-3.203753, 3.225837, 5.564094,
-3.203753, -3.200661, -6.033794,
3.014154, -3.200661, -6.033794,
-3.203753, -3.200661, 5.564094,
3.014154, -3.200661, 5.564094,
-3.203753, 3.225837, -6.033794,
3.014154, 3.225837, -6.033794,
-3.203753, 3.225837, 5.564094,
3.014154, 3.225837, 5.564094,
3.014154, -3.200661, -6.033794,
3.014154, 3.225837, -6.033794,
3.014154, -3.200661, 5.564094,
3.014154, 3.225837, 5.564094,
3.014154, -3.200661, -6.033794,
3.014154, -3.200661, 5.564094,
3.014154, 3.225837, -6.033794,
3.014154, 3.225837, 5.564094
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
var radius = 7.820095;
var distance = 34.79248;
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
mvMatrix.translate( 0.09479952, -0.01258814, 0.2348504 );
mvMatrix.scale( 1.359821, 1.315684, 0.7290328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79248);
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
phosdiphen<-read.table("phosdiphen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosdiphen$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
```

```r
y<-phosdiphen$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
```

```r
z<-phosdiphen$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
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
-3.113201, -0.4386342, -1.535704, 0, 0, 1, 1, 1,
-2.61574, -1.513162, -3.819345, 1, 0, 0, 1, 1,
-2.603588, 0.1270877, -0.1384499, 1, 0, 0, 1, 1,
-2.597225, -0.578324, -3.019141, 1, 0, 0, 1, 1,
-2.531209, 1.554068, -0.8811353, 1, 0, 0, 1, 1,
-2.446644, 0.9872641, -1.009697, 1, 0, 0, 1, 1,
-2.38404, -0.4422598, -2.699964, 0, 0, 0, 1, 1,
-2.319554, 0.4832838, -2.453472, 0, 0, 0, 1, 1,
-2.306607, 0.731352, 0.01024215, 0, 0, 0, 1, 1,
-2.246359, -0.2185565, -0.1593899, 0, 0, 0, 1, 1,
-2.240817, 0.1607828, 0.2303081, 0, 0, 0, 1, 1,
-2.230999, 1.354496, 0.002552976, 0, 0, 0, 1, 1,
-2.204328, -0.4618201, -3.239281, 0, 0, 0, 1, 1,
-2.189059, 0.09777771, -1.207051, 1, 1, 1, 1, 1,
-2.184143, 0.2082718, -0.7512334, 1, 1, 1, 1, 1,
-2.180737, -0.7242109, -1.515934, 1, 1, 1, 1, 1,
-2.13179, 1.655728, 1.402356, 1, 1, 1, 1, 1,
-2.108495, -1.219174, -3.131366, 1, 1, 1, 1, 1,
-2.102332, 0.7116085, -1.364094, 1, 1, 1, 1, 1,
-2.095991, -1.828598, -0.7899745, 1, 1, 1, 1, 1,
-2.091308, 2.059342, 0.5606036, 1, 1, 1, 1, 1,
-2.090129, 1.1439, -0.6661899, 1, 1, 1, 1, 1,
-2.08788, 1.65102, -1.169034, 1, 1, 1, 1, 1,
-2.059878, 0.68598, 0.4482781, 1, 1, 1, 1, 1,
-2.011937, 0.9155259, -1.105048, 1, 1, 1, 1, 1,
-1.997021, 2.380267, -0.6485025, 1, 1, 1, 1, 1,
-1.962382, -0.2533979, -0.4991139, 1, 1, 1, 1, 1,
-1.960694, 0.5002922, -2.079267, 1, 1, 1, 1, 1,
-1.921725, -1.242977, -3.180825, 0, 0, 1, 1, 1,
-1.905677, 0.16891, -1.094515, 1, 0, 0, 1, 1,
-1.905278, -2.486742, -2.787528, 1, 0, 0, 1, 1,
-1.896505, -1.481251, -1.365768, 1, 0, 0, 1, 1,
-1.879176, -0.3751404, -0.8573053, 1, 0, 0, 1, 1,
-1.870219, 1.422994, -1.202021, 1, 0, 0, 1, 1,
-1.852867, -0.7923241, -0.9752076, 0, 0, 0, 1, 1,
-1.8369, 0.1612993, -2.640729, 0, 0, 0, 1, 1,
-1.809204, 1.3196, -1.21231, 0, 0, 0, 1, 1,
-1.807719, 0.4832023, 0.083065, 0, 0, 0, 1, 1,
-1.798743, 0.2711308, -1.410253, 0, 0, 0, 1, 1,
-1.78485, -0.3962516, -0.83217, 0, 0, 0, 1, 1,
-1.784788, 0.4043401, -2.22516, 0, 0, 0, 1, 1,
-1.773538, 0.5026624, -0.7178797, 1, 1, 1, 1, 1,
-1.746985, 0.8490385, -0.7197657, 1, 1, 1, 1, 1,
-1.715309, -0.5646148, -1.92981, 1, 1, 1, 1, 1,
-1.712785, -1.139188, -1.949514, 1, 1, 1, 1, 1,
-1.710957, -0.2556502, -0.2742865, 1, 1, 1, 1, 1,
-1.710163, 0.03568777, -1.638198, 1, 1, 1, 1, 1,
-1.701154, 0.638782, -2.108967, 1, 1, 1, 1, 1,
-1.700722, 0.356426, -1.818879, 1, 1, 1, 1, 1,
-1.689326, -1.224941, -2.348248, 1, 1, 1, 1, 1,
-1.682957, -0.2115647, -1.964127, 1, 1, 1, 1, 1,
-1.671466, -0.3112281, -2.032307, 1, 1, 1, 1, 1,
-1.665562, -0.5718992, -2.269364, 1, 1, 1, 1, 1,
-1.662422, -0.7131829, -1.603863, 1, 1, 1, 1, 1,
-1.661349, -1.463269, -1.500448, 1, 1, 1, 1, 1,
-1.640272, -2.405412, -2.137768, 1, 1, 1, 1, 1,
-1.638898, -0.3420007, -2.632401, 0, 0, 1, 1, 1,
-1.629105, 1.539441, -3.400842, 1, 0, 0, 1, 1,
-1.620087, 1.609116, -0.766428, 1, 0, 0, 1, 1,
-1.613665, -0.1258699, -3.315248, 1, 0, 0, 1, 1,
-1.613267, -1.192925, -2.396313, 1, 0, 0, 1, 1,
-1.609798, 0.6474238, -2.519523, 1, 0, 0, 1, 1,
-1.596284, -0.5762665, -4.261931, 0, 0, 0, 1, 1,
-1.593154, -0.1358098, -1.931368, 0, 0, 0, 1, 1,
-1.586146, 1.652927, -0.5805295, 0, 0, 0, 1, 1,
-1.562711, 1.142453, -1.224392, 0, 0, 0, 1, 1,
-1.558149, 0.9411824, -0.5890701, 0, 0, 0, 1, 1,
-1.556883, -0.2547676, -0.8364392, 0, 0, 0, 1, 1,
-1.543266, 0.4069801, -2.181763, 0, 0, 0, 1, 1,
-1.527832, -0.01694446, -1.047088, 1, 1, 1, 1, 1,
-1.486567, -0.3919462, -1.199206, 1, 1, 1, 1, 1,
-1.468805, -0.02382599, -0.3876027, 1, 1, 1, 1, 1,
-1.467434, -0.5723053, -1.731816, 1, 1, 1, 1, 1,
-1.465834, -0.8579038, -3.327074, 1, 1, 1, 1, 1,
-1.455969, 0.8143385, -0.04431413, 1, 1, 1, 1, 1,
-1.441245, -0.5107523, -1.381309, 1, 1, 1, 1, 1,
-1.438459, -2.355677, -2.267883, 1, 1, 1, 1, 1,
-1.423462, -1.081461, -0.638216, 1, 1, 1, 1, 1,
-1.420092, 0.8118917, -1.617732, 1, 1, 1, 1, 1,
-1.401471, 1.294638, 0.4415165, 1, 1, 1, 1, 1,
-1.396024, -0.1343161, -2.01725, 1, 1, 1, 1, 1,
-1.385179, -2.103919, -2.859619, 1, 1, 1, 1, 1,
-1.383978, 0.3126322, -0.8035617, 1, 1, 1, 1, 1,
-1.381761, -0.1438019, -1.18261, 1, 1, 1, 1, 1,
-1.374177, 1.778911, -1.255781, 0, 0, 1, 1, 1,
-1.345573, -0.4958484, -0.8260052, 1, 0, 0, 1, 1,
-1.338048, -1.486672, -1.807349, 1, 0, 0, 1, 1,
-1.337644, -0.1267737, -1.948919, 1, 0, 0, 1, 1,
-1.326433, 0.4396304, -1.273399, 1, 0, 0, 1, 1,
-1.323999, 0.1855868, -2.098057, 1, 0, 0, 1, 1,
-1.321512, -0.6475354, -2.477387, 0, 0, 0, 1, 1,
-1.320441, -0.1197447, -1.128188, 0, 0, 0, 1, 1,
-1.312395, 0.6831195, -1.771793, 0, 0, 0, 1, 1,
-1.310839, 0.4886847, -2.103139, 0, 0, 0, 1, 1,
-1.309492, 0.6295307, -0.6475351, 0, 0, 0, 1, 1,
-1.296556, 1.152165, -1.687425, 0, 0, 0, 1, 1,
-1.296034, -1.13844, -1.757351, 0, 0, 0, 1, 1,
-1.288619, 1.072248, 0.1618513, 1, 1, 1, 1, 1,
-1.287739, -0.5576478, -2.972959, 1, 1, 1, 1, 1,
-1.276883, -1.31574, -2.149717, 1, 1, 1, 1, 1,
-1.26746, -0.5649527, -0.590884, 1, 1, 1, 1, 1,
-1.257236, 0.1840446, -0.7769344, 1, 1, 1, 1, 1,
-1.253469, 2.007929, -0.4766646, 1, 1, 1, 1, 1,
-1.247161, -0.5819596, -0.07343433, 1, 1, 1, 1, 1,
-1.24401, 1.397018, -0.814728, 1, 1, 1, 1, 1,
-1.24309, -0.9158846, -3.788126, 1, 1, 1, 1, 1,
-1.242218, -0.2799254, -1.003006, 1, 1, 1, 1, 1,
-1.239583, 0.2773314, -1.598179, 1, 1, 1, 1, 1,
-1.238852, 1.617356, -1.561456, 1, 1, 1, 1, 1,
-1.230848, -1.295135, -2.735408, 1, 1, 1, 1, 1,
-1.221004, 0.9550847, -1.598084, 1, 1, 1, 1, 1,
-1.220578, -0.5970373, 0.03750683, 1, 1, 1, 1, 1,
-1.211107, 0.4520359, -3.800815, 0, 0, 1, 1, 1,
-1.209769, 0.5677678, -1.083408, 1, 0, 0, 1, 1,
-1.204912, 0.0742095, -1.998465, 1, 0, 0, 1, 1,
-1.201778, 0.01617319, -3.948207, 1, 0, 0, 1, 1,
-1.174338, 1.534603, -0.2494819, 1, 0, 0, 1, 1,
-1.174268, 0.2505373, -1.235829, 1, 0, 0, 1, 1,
-1.17154, 0.7481852, -1.702236, 0, 0, 0, 1, 1,
-1.169423, 1.823997, 0.3190694, 0, 0, 0, 1, 1,
-1.168804, -0.2564477, -1.985409, 0, 0, 0, 1, 1,
-1.165029, 2.312519, 0.1572578, 0, 0, 0, 1, 1,
-1.158367, 0.7125544, -0.6872501, 0, 0, 0, 1, 1,
-1.157471, 0.7921906, -2.004821, 0, 0, 0, 1, 1,
-1.153947, -0.8876793, -1.14509, 0, 0, 0, 1, 1,
-1.151246, -0.9201342, -0.8529583, 1, 1, 1, 1, 1,
-1.148292, 0.7842797, -1.482028, 1, 1, 1, 1, 1,
-1.139899, 1.050889, 0.1354567, 1, 1, 1, 1, 1,
-1.137785, 2.14177, 0.4463342, 1, 1, 1, 1, 1,
-1.13562, -1.306861, -2.748128, 1, 1, 1, 1, 1,
-1.133372, 0.2632803, -1.627051, 1, 1, 1, 1, 1,
-1.131292, -0.06705288, -1.253035, 1, 1, 1, 1, 1,
-1.129001, -1.282439, -2.096076, 1, 1, 1, 1, 1,
-1.128361, 0.04071223, -1.799433, 1, 1, 1, 1, 1,
-1.124942, -0.6470606, -1.657255, 1, 1, 1, 1, 1,
-1.119671, 1.301588, -0.6343985, 1, 1, 1, 1, 1,
-1.117261, -0.962725, -2.200062, 1, 1, 1, 1, 1,
-1.114714, 1.821826, -1.223054, 1, 1, 1, 1, 1,
-1.114695, 0.2807771, -1.990273, 1, 1, 1, 1, 1,
-1.113634, -0.8374491, -1.56173, 1, 1, 1, 1, 1,
-1.108401, 0.1817859, -4.341029, 0, 0, 1, 1, 1,
-1.106155, 0.1624343, -1.449958, 1, 0, 0, 1, 1,
-1.087161, -0.451034, -2.743023, 1, 0, 0, 1, 1,
-1.08621, -0.2356383, 0.2374203, 1, 0, 0, 1, 1,
-1.081531, -0.909526, -2.854104, 1, 0, 0, 1, 1,
-1.078295, -1.523994, -3.650891, 1, 0, 0, 1, 1,
-1.076473, 1.652991, -0.2043955, 0, 0, 0, 1, 1,
-1.065866, 0.9060148, -1.037986, 0, 0, 0, 1, 1,
-1.055254, -0.1222761, -0.8350038, 0, 0, 0, 1, 1,
-1.048687, 1.000229, -0.6918431, 0, 0, 0, 1, 1,
-1.042667, 2.341892, -0.4727328, 0, 0, 0, 1, 1,
-1.042361, -0.9381793, -2.299093, 0, 0, 0, 1, 1,
-1.040463, 1.569044, -1.161395, 0, 0, 0, 1, 1,
-1.04026, -0.7832119, -0.4716736, 1, 1, 1, 1, 1,
-1.039168, 0.5842598, -0.1829377, 1, 1, 1, 1, 1,
-1.038593, 1.802566, 0.5444134, 1, 1, 1, 1, 1,
-1.034477, -0.3988912, -3.400305, 1, 1, 1, 1, 1,
-1.021008, 0.418774, -0.8591834, 1, 1, 1, 1, 1,
-1.020338, 0.3629003, -0.4767897, 1, 1, 1, 1, 1,
-1.018301, -0.9551333, -1.410218, 1, 1, 1, 1, 1,
-1.016658, -0.6413144, -1.131949, 1, 1, 1, 1, 1,
-1.011082, 1.767406, 0.8063916, 1, 1, 1, 1, 1,
-0.9983408, 0.5290265, -1.758709, 1, 1, 1, 1, 1,
-0.9976379, 1.452844, -0.1909272, 1, 1, 1, 1, 1,
-0.9887053, -0.4035619, -3.702552, 1, 1, 1, 1, 1,
-0.9840053, -0.3491626, -0.2786354, 1, 1, 1, 1, 1,
-0.9735896, -1.096619, -3.847592, 1, 1, 1, 1, 1,
-0.9726347, 1.229203, -1.256897, 1, 1, 1, 1, 1,
-0.9707057, -1.160403, -1.834114, 0, 0, 1, 1, 1,
-0.9698693, -0.1575439, -1.253294, 1, 0, 0, 1, 1,
-0.9670181, -0.4775527, -3.836329, 1, 0, 0, 1, 1,
-0.966328, 2.678154, -0.3822389, 1, 0, 0, 1, 1,
-0.9646877, 1.02219, 1.008027, 1, 0, 0, 1, 1,
-0.9456965, -0.0790445, -1.839957, 1, 0, 0, 1, 1,
-0.9437307, 0.87782, 0.07743323, 0, 0, 0, 1, 1,
-0.9388436, 0.06009643, -0.2787129, 0, 0, 0, 1, 1,
-0.9356807, -0.8291186, -3.88034, 0, 0, 0, 1, 1,
-0.9333221, -0.3273308, -1.618326, 0, 0, 0, 1, 1,
-0.9325856, -0.5777192, -2.781964, 0, 0, 0, 1, 1,
-0.9322844, -2.864016, -2.609291, 0, 0, 0, 1, 1,
-0.9310277, -0.8044635, -0.21156, 0, 0, 0, 1, 1,
-0.9287831, -0.4481546, -2.579928, 1, 1, 1, 1, 1,
-0.9280366, 0.4482259, -0.3433788, 1, 1, 1, 1, 1,
-0.9249196, -0.8690979, -3.778022, 1, 1, 1, 1, 1,
-0.9214543, 0.6123241, -1.030385, 1, 1, 1, 1, 1,
-0.9211022, 0.8246353, -1.118953, 1, 1, 1, 1, 1,
-0.9177828, -0.9345607, -2.445165, 1, 1, 1, 1, 1,
-0.9117416, -0.8332849, -1.750288, 1, 1, 1, 1, 1,
-0.9082322, 1.167889, -3.387082, 1, 1, 1, 1, 1,
-0.9012344, 0.1691371, -2.203253, 1, 1, 1, 1, 1,
-0.89947, -0.588966, -3.19951, 1, 1, 1, 1, 1,
-0.8923719, -0.2441759, -1.323282, 1, 1, 1, 1, 1,
-0.8905241, 0.7336416, 0.1134307, 1, 1, 1, 1, 1,
-0.8890832, -2.493496, -2.714588, 1, 1, 1, 1, 1,
-0.8849961, -0.9554689, -0.330881, 1, 1, 1, 1, 1,
-0.8828784, 1.180074, -0.7901326, 1, 1, 1, 1, 1,
-0.8807569, -1.341947, -2.958318, 0, 0, 1, 1, 1,
-0.8777822, 0.6854757, -0.546611, 1, 0, 0, 1, 1,
-0.876278, -1.514622, -3.989194, 1, 0, 0, 1, 1,
-0.8686881, 0.2165014, -1.909713, 1, 0, 0, 1, 1,
-0.8686534, -0.3548957, -0.9869385, 1, 0, 0, 1, 1,
-0.8647991, 0.3749324, -0.3949826, 1, 0, 0, 1, 1,
-0.8647939, 0.4784763, -0.849553, 0, 0, 0, 1, 1,
-0.8635243, 1.94502, 0.5424576, 0, 0, 0, 1, 1,
-0.8615422, 1.101247, 0.4689332, 0, 0, 0, 1, 1,
-0.8601681, -0.7710387, -3.600424, 0, 0, 0, 1, 1,
-0.8550174, -0.208018, -3.195359, 0, 0, 0, 1, 1,
-0.8515785, -0.8279926, -2.459243, 0, 0, 0, 1, 1,
-0.8467564, -0.08688165, -0.9212572, 0, 0, 0, 1, 1,
-0.8464066, 0.4138355, -1.381758, 1, 1, 1, 1, 1,
-0.8393702, -1.199203, -4.403584, 1, 1, 1, 1, 1,
-0.8307183, 0.5039239, -0.1169127, 1, 1, 1, 1, 1,
-0.8275348, -0.04071191, -1.349195, 1, 1, 1, 1, 1,
-0.8246775, 0.6969087, -0.8258255, 1, 1, 1, 1, 1,
-0.819679, -0.513925, -2.83382, 1, 1, 1, 1, 1,
-0.8168716, 0.4544761, -1.761919, 1, 1, 1, 1, 1,
-0.8123674, -0.006745948, -1.271125, 1, 1, 1, 1, 1,
-0.8087162, 0.413132, -2.859978, 1, 1, 1, 1, 1,
-0.7978051, 0.1540687, -1.718792, 1, 1, 1, 1, 1,
-0.7929449, 0.1936491, -1.888767, 1, 1, 1, 1, 1,
-0.7902211, -1.826861, -3.170829, 1, 1, 1, 1, 1,
-0.7890452, -0.3918941, -2.226851, 1, 1, 1, 1, 1,
-0.788438, 0.2471967, -3.324234, 1, 1, 1, 1, 1,
-0.7876832, 1.117324, 0.3210563, 1, 1, 1, 1, 1,
-0.7871598, 0.5554545, 0.05857369, 0, 0, 1, 1, 1,
-0.785423, -0.05364297, -2.700756, 1, 0, 0, 1, 1,
-0.7808456, 0.02511878, -1.379434, 1, 0, 0, 1, 1,
-0.7777035, 0.3930931, -2.386065, 1, 0, 0, 1, 1,
-0.7772259, 0.3795551, -2.399864, 1, 0, 0, 1, 1,
-0.7768657, -1.908903, -2.47906, 1, 0, 0, 1, 1,
-0.7729024, 1.489677, -0.3869398, 0, 0, 0, 1, 1,
-0.7697418, -0.6697258, -3.389698, 0, 0, 0, 1, 1,
-0.7650215, 0.3018465, -1.853533, 0, 0, 0, 1, 1,
-0.7625535, 0.5869362, -0.3171631, 0, 0, 0, 1, 1,
-0.7621309, -1.434359, -2.483802, 0, 0, 0, 1, 1,
-0.7565466, -0.1279185, -2.922834, 0, 0, 0, 1, 1,
-0.7561963, -0.08204243, -0.05928729, 0, 0, 0, 1, 1,
-0.7521081, -0.6074595, -2.566092, 1, 1, 1, 1, 1,
-0.7493766, 0.6383501, 0.3568733, 1, 1, 1, 1, 1,
-0.7480146, 1.24322, -0.6768491, 1, 1, 1, 1, 1,
-0.7468955, -0.4290355, -1.923869, 1, 1, 1, 1, 1,
-0.7453203, 0.4525218, 0.2166806, 1, 1, 1, 1, 1,
-0.7438533, 1.214021, -1.661809, 1, 1, 1, 1, 1,
-0.7390391, 1.138962, -1.759885, 1, 1, 1, 1, 1,
-0.7369142, -0.2573819, -1.019116, 1, 1, 1, 1, 1,
-0.7337939, -0.7347021, -0.4681177, 1, 1, 1, 1, 1,
-0.7296672, -0.6947324, -2.477014, 1, 1, 1, 1, 1,
-0.7283415, -0.4062713, -1.367058, 1, 1, 1, 1, 1,
-0.7263939, -0.8134121, -1.520761, 1, 1, 1, 1, 1,
-0.708727, -0.8709835, -2.447599, 1, 1, 1, 1, 1,
-0.7013569, 2.010268, 0.6971121, 1, 1, 1, 1, 1,
-0.6982353, 0.2056344, -0.9562467, 1, 1, 1, 1, 1,
-0.6975376, 0.07005297, 0.3206629, 0, 0, 1, 1, 1,
-0.6961913, -0.8224148, -0.8508865, 1, 0, 0, 1, 1,
-0.6911774, -0.4621181, -1.695168, 1, 0, 0, 1, 1,
-0.6896783, 0.1360283, -0.2833471, 1, 0, 0, 1, 1,
-0.6891805, 0.2390854, -1.497302, 1, 0, 0, 1, 1,
-0.6876745, -0.09952201, -2.782556, 1, 0, 0, 1, 1,
-0.6855595, 0.4539044, -0.5887982, 0, 0, 0, 1, 1,
-0.6821037, 0.35705, -1.280717, 0, 0, 0, 1, 1,
-0.6768672, 0.8451098, -0.08333679, 0, 0, 0, 1, 1,
-0.6683047, 0.8390226, -0.207821, 0, 0, 0, 1, 1,
-0.6649878, -0.5556437, -4.200582, 0, 0, 0, 1, 1,
-0.661291, 0.03050211, -1.717394, 0, 0, 0, 1, 1,
-0.6612076, 0.628861, 1.666579, 0, 0, 0, 1, 1,
-0.6544832, -1.044328, -1.208952, 1, 1, 1, 1, 1,
-0.6453033, 0.04818141, -1.020473, 1, 1, 1, 1, 1,
-0.6441761, -0.2189963, -4.290462, 1, 1, 1, 1, 1,
-0.6401459, 0.3665394, -0.5980086, 1, 1, 1, 1, 1,
-0.63184, 0.2472794, 0.1170062, 1, 1, 1, 1, 1,
-0.6270779, 0.2095034, -0.1919061, 1, 1, 1, 1, 1,
-0.624447, 0.01674808, -1.092794, 1, 1, 1, 1, 1,
-0.6240485, -2.141155, -0.9922881, 1, 1, 1, 1, 1,
-0.6225951, -0.1681264, -1.679024, 1, 1, 1, 1, 1,
-0.6189417, -0.2394508, -3.176564, 1, 1, 1, 1, 1,
-0.6155371, 1.164172, 0.7703935, 1, 1, 1, 1, 1,
-0.6154506, 0.7960291, 0.4475428, 1, 1, 1, 1, 1,
-0.6022046, 1.570956, 0.2623744, 1, 1, 1, 1, 1,
-0.5988532, -0.273587, -2.430566, 1, 1, 1, 1, 1,
-0.598491, 0.8059395, -1.287096, 1, 1, 1, 1, 1,
-0.5966835, -0.1726862, -1.974257, 0, 0, 1, 1, 1,
-0.5961976, -0.02993419, -1.596815, 1, 0, 0, 1, 1,
-0.5961814, 0.981421, -0.3063699, 1, 0, 0, 1, 1,
-0.5956918, -1.261376, -3.269412, 1, 0, 0, 1, 1,
-0.59399, 1.115546, -1.61539, 1, 0, 0, 1, 1,
-0.5926436, 0.4661065, -0.8210976, 1, 0, 0, 1, 1,
-0.5893596, 0.0445121, -1.130519, 0, 0, 0, 1, 1,
-0.5862974, 1.193143, -0.9513928, 0, 0, 0, 1, 1,
-0.586132, 2.293518, -0.8443238, 0, 0, 0, 1, 1,
-0.5860478, -0.337759, -2.126997, 0, 0, 0, 1, 1,
-0.5851659, -0.6774698, -3.162453, 0, 0, 0, 1, 1,
-0.5810444, -0.8600182, -4.211075, 0, 0, 0, 1, 1,
-0.5785223, 0.7042795, -1.155464, 0, 0, 0, 1, 1,
-0.5732775, 1.056592, 0.1511722, 1, 1, 1, 1, 1,
-0.5707911, 0.08814318, -3.310474, 1, 1, 1, 1, 1,
-0.5700082, 0.8197809, -2.358688, 1, 1, 1, 1, 1,
-0.5691587, 0.634828, -0.9615336, 1, 1, 1, 1, 1,
-0.5672139, 0.2380285, -0.7198281, 1, 1, 1, 1, 1,
-0.5648288, 0.2426476, -1.231365, 1, 1, 1, 1, 1,
-0.560498, -0.4378471, -3.15346, 1, 1, 1, 1, 1,
-0.5550417, -1.728186, -2.098247, 1, 1, 1, 1, 1,
-0.5528557, 0.1419855, -2.295764, 1, 1, 1, 1, 1,
-0.5527855, -0.9534331, -4.602526, 1, 1, 1, 1, 1,
-0.5483807, -2.370781, -3.238324, 1, 1, 1, 1, 1,
-0.5482793, -0.8322204, -2.789969, 1, 1, 1, 1, 1,
-0.5475226, 0.3241338, -1.409766, 1, 1, 1, 1, 1,
-0.5447575, -0.6000807, -0.1192212, 1, 1, 1, 1, 1,
-0.5424371, -0.4605846, -3.294797, 1, 1, 1, 1, 1,
-0.5418963, -0.3079737, -2.208833, 0, 0, 1, 1, 1,
-0.5365635, -0.2812195, -2.075812, 1, 0, 0, 1, 1,
-0.5353774, 0.2762698, -1.840661, 1, 0, 0, 1, 1,
-0.5306848, 0.88771, -0.4733745, 1, 0, 0, 1, 1,
-0.529794, 1.023572, -1.129238, 1, 0, 0, 1, 1,
-0.5223982, 0.9609228, 0.03460686, 1, 0, 0, 1, 1,
-0.5186897, -0.689116, -2.402753, 0, 0, 0, 1, 1,
-0.5129216, -2.435948, -2.665909, 0, 0, 0, 1, 1,
-0.5108214, -1.765101, -2.35469, 0, 0, 0, 1, 1,
-0.5086195, 0.8374003, 0.7898189, 0, 0, 0, 1, 1,
-0.5071736, 0.1593146, -1.896458, 0, 0, 0, 1, 1,
-0.5036778, 1.423152, 1.081766, 0, 0, 0, 1, 1,
-0.5013398, 0.6959969, -0.226803, 0, 0, 0, 1, 1,
-0.498635, -1.208396, -1.549101, 1, 1, 1, 1, 1,
-0.4981827, 0.3679719, 0.1473616, 1, 1, 1, 1, 1,
-0.4959594, 0.1382781, -0.4742717, 1, 1, 1, 1, 1,
-0.4885717, -0.5474724, -2.957976, 1, 1, 1, 1, 1,
-0.4872753, -0.2400564, -2.975199, 1, 1, 1, 1, 1,
-0.4872223, 0.5400264, -0.7441214, 1, 1, 1, 1, 1,
-0.4822582, 0.6469651, -1.983777, 1, 1, 1, 1, 1,
-0.478924, 0.6077794, -0.08170699, 1, 1, 1, 1, 1,
-0.4787389, -0.9945322, -2.416892, 1, 1, 1, 1, 1,
-0.4745049, -0.02079594, 0.9150001, 1, 1, 1, 1, 1,
-0.4705181, -1.205333, -2.134035, 1, 1, 1, 1, 1,
-0.4701932, 0.01688291, -1.714574, 1, 1, 1, 1, 1,
-0.4660638, -1.211447, -3.632976, 1, 1, 1, 1, 1,
-0.4635828, 0.6541935, 0.3716522, 1, 1, 1, 1, 1,
-0.4604008, 0.9974486, 0.4896959, 1, 1, 1, 1, 1,
-0.4600751, 1.131161, -0.9509246, 0, 0, 1, 1, 1,
-0.459835, -1.583073, -2.867147, 1, 0, 0, 1, 1,
-0.4574045, 0.2338202, -1.251588, 1, 0, 0, 1, 1,
-0.4558721, -0.1416463, -1.341573, 1, 0, 0, 1, 1,
-0.4511159, 0.2376711, -2.824902, 1, 0, 0, 1, 1,
-0.4509809, -0.2740422, -1.594814, 1, 0, 0, 1, 1,
-0.4504988, 0.4240648, -1.605468, 0, 0, 0, 1, 1,
-0.4481731, -1.272422, -4.257941, 0, 0, 0, 1, 1,
-0.4462076, -0.89637, -2.878652, 0, 0, 0, 1, 1,
-0.4436174, 1.144906, 0.7838387, 0, 0, 0, 1, 1,
-0.434756, -0.9371449, -3.607906, 0, 0, 0, 1, 1,
-0.4343211, -0.6267601, -2.716963, 0, 0, 0, 1, 1,
-0.4325573, 1.167862, -0.249764, 0, 0, 0, 1, 1,
-0.4303719, 0.2827173, -0.8609316, 1, 1, 1, 1, 1,
-0.4280507, -0.1237568, 0.04437717, 1, 1, 1, 1, 1,
-0.4278022, -0.1548632, 1.015279, 1, 1, 1, 1, 1,
-0.4262065, 1.457547, 0.9358139, 1, 1, 1, 1, 1,
-0.4248608, 2.198446, 0.4660069, 1, 1, 1, 1, 1,
-0.4217238, -1.251137, -3.273196, 1, 1, 1, 1, 1,
-0.4201096, 0.8711286, -0.2395791, 1, 1, 1, 1, 1,
-0.4136177, 1.549059, -0.1175148, 1, 1, 1, 1, 1,
-0.413086, 0.09088826, -1.160079, 1, 1, 1, 1, 1,
-0.4107316, 0.3487138, -1.816235, 1, 1, 1, 1, 1,
-0.410576, 0.2931675, -1.056434, 1, 1, 1, 1, 1,
-0.4101361, -1.980267, -4.214015, 1, 1, 1, 1, 1,
-0.4097848, 0.3116, -1.758017, 1, 1, 1, 1, 1,
-0.4095058, -0.4015901, -1.969752, 1, 1, 1, 1, 1,
-0.4077534, -0.5814619, -3.581664, 1, 1, 1, 1, 1,
-0.4048172, -2.492945, -3.366757, 0, 0, 1, 1, 1,
-0.4027515, 1.40149, -0.05780901, 1, 0, 0, 1, 1,
-0.399289, 0.6725075, 0.2995167, 1, 0, 0, 1, 1,
-0.3977334, -0.7816685, -2.966915, 1, 0, 0, 1, 1,
-0.3960708, -0.400333, -2.925817, 1, 0, 0, 1, 1,
-0.3956978, -1.259968, -1.937118, 1, 0, 0, 1, 1,
-0.3927406, 0.33446, -1.552415, 0, 0, 0, 1, 1,
-0.3917723, 0.4105608, -0.1291717, 0, 0, 0, 1, 1,
-0.3827151, 0.7632341, -1.518417, 0, 0, 0, 1, 1,
-0.38263, -0.1330633, -1.815349, 0, 0, 0, 1, 1,
-0.3819053, 1.492875, -0.677719, 0, 0, 0, 1, 1,
-0.3664217, 0.5964316, -0.5747827, 0, 0, 0, 1, 1,
-0.3636076, -1.309193, -2.639087, 0, 0, 0, 1, 1,
-0.3628199, -0.5719005, -2.251108, 1, 1, 1, 1, 1,
-0.3570406, 0.4966643, 0.6587652, 1, 1, 1, 1, 1,
-0.3569965, 0.5706245, 0.4460527, 1, 1, 1, 1, 1,
-0.3556073, 0.529714, -2.342061, 1, 1, 1, 1, 1,
-0.3489267, -1.96791, -4.368116, 1, 1, 1, 1, 1,
-0.3479275, -0.5936643, -4.643293, 1, 1, 1, 1, 1,
-0.3476796, -0.9273617, -4.625129, 1, 1, 1, 1, 1,
-0.3455841, 0.5279502, -0.6988075, 1, 1, 1, 1, 1,
-0.3406, -1.904863, -1.294637, 1, 1, 1, 1, 1,
-0.3398004, -0.1743151, -2.934094, 1, 1, 1, 1, 1,
-0.3374601, -1.700896, -2.147784, 1, 1, 1, 1, 1,
-0.337438, -1.596299, -2.359246, 1, 1, 1, 1, 1,
-0.3332075, -0.1524757, -0.8191135, 1, 1, 1, 1, 1,
-0.3310159, -0.4075771, -2.176856, 1, 1, 1, 1, 1,
-0.3244785, -0.6630883, -2.377355, 1, 1, 1, 1, 1,
-0.3182056, 0.7743335, -1.193141, 0, 0, 1, 1, 1,
-0.3175603, 0.05655879, -2.701218, 1, 0, 0, 1, 1,
-0.3159077, 0.7186521, -1.724994, 1, 0, 0, 1, 1,
-0.315888, -0.8521224, -2.541185, 1, 0, 0, 1, 1,
-0.3069341, -0.7956435, -1.69528, 1, 0, 0, 1, 1,
-0.306514, 0.6701107, -0.1806567, 1, 0, 0, 1, 1,
-0.2998537, -1.219025, -2.540575, 0, 0, 0, 1, 1,
-0.2983545, -0.2220327, -1.651383, 0, 0, 0, 1, 1,
-0.297895, 0.2470296, -2.030218, 0, 0, 0, 1, 1,
-0.2933724, 1.0402, 0.9066015, 0, 0, 0, 1, 1,
-0.2801507, 1.079692, 2.699901, 0, 0, 0, 1, 1,
-0.2784568, 0.7277246, 0.4927299, 0, 0, 0, 1, 1,
-0.276724, 0.3298788, -0.9618714, 0, 0, 0, 1, 1,
-0.2745895, -1.240906, -2.506363, 1, 1, 1, 1, 1,
-0.2740193, -1.27631, -3.403237, 1, 1, 1, 1, 1,
-0.2656757, 0.007297956, -1.28419, 1, 1, 1, 1, 1,
-0.260427, 0.3831597, -0.4392434, 1, 1, 1, 1, 1,
-0.2476671, -0.2051677, -2.462895, 1, 1, 1, 1, 1,
-0.2464064, 0.08886285, -0.799979, 1, 1, 1, 1, 1,
-0.2305452, 1.796547, 0.882285, 1, 1, 1, 1, 1,
-0.2296925, -0.1173011, -3.074743, 1, 1, 1, 1, 1,
-0.2288801, -0.6750256, -2.637043, 1, 1, 1, 1, 1,
-0.2263227, -0.3294412, -1.820726, 1, 1, 1, 1, 1,
-0.2244202, 1.451928, 3.072192, 1, 1, 1, 1, 1,
-0.2227065, 1.982093, -1.066704, 1, 1, 1, 1, 1,
-0.2213952, -0.281388, -3.313681, 1, 1, 1, 1, 1,
-0.2125445, -0.2961423, -1.752716, 1, 1, 1, 1, 1,
-0.2122773, 0.1717052, -1.235782, 1, 1, 1, 1, 1,
-0.211123, -0.5960918, -2.011356, 0, 0, 1, 1, 1,
-0.2056805, -0.8941461, -2.240119, 1, 0, 0, 1, 1,
-0.2048287, -0.06299338, -1.57013, 1, 0, 0, 1, 1,
-0.2046546, -0.9173754, -3.855315, 1, 0, 0, 1, 1,
-0.2003877, -1.000052, -2.926044, 1, 0, 0, 1, 1,
-0.1985865, -0.4487624, -1.000948, 1, 0, 0, 1, 1,
-0.1985865, 1.04974, -0.2620305, 0, 0, 0, 1, 1,
-0.1965194, 0.02870771, -0.7557998, 0, 0, 0, 1, 1,
-0.1946304, -1.182581, -3.374511, 0, 0, 0, 1, 1,
-0.1941036, 1.252255, -1.432605, 0, 0, 0, 1, 1,
-0.1929505, -1.066317, -4.017668, 0, 0, 0, 1, 1,
-0.1901014, 0.6576442, 1.029826, 0, 0, 0, 1, 1,
-0.1889516, -0.09862646, -2.191806, 0, 0, 0, 1, 1,
-0.1867974, -0.6083494, -3.228325, 1, 1, 1, 1, 1,
-0.186677, 0.2336111, -1.786888, 1, 1, 1, 1, 1,
-0.1853892, -0.4984653, -3.435365, 1, 1, 1, 1, 1,
-0.1851545, 0.5750194, 0.7632565, 1, 1, 1, 1, 1,
-0.1828021, 0.1677743, -1.53178, 1, 1, 1, 1, 1,
-0.1821111, 0.4645945, -0.566542, 1, 1, 1, 1, 1,
-0.1760207, -0.1331314, -2.782355, 1, 1, 1, 1, 1,
-0.1757264, 0.1896678, -0.1594782, 1, 1, 1, 1, 1,
-0.170886, 1.149979, 0.8148842, 1, 1, 1, 1, 1,
-0.1697752, 0.9937876, -3.306404, 1, 1, 1, 1, 1,
-0.1695003, 0.05863288, -0.4954169, 1, 1, 1, 1, 1,
-0.16891, -1.188491, -5.864893, 1, 1, 1, 1, 1,
-0.1677449, 0.7804946, -0.5245737, 1, 1, 1, 1, 1,
-0.1672448, 0.07175409, 0.6809316, 1, 1, 1, 1, 1,
-0.1645113, -0.1873808, -3.956007, 1, 1, 1, 1, 1,
-0.1606697, 0.6115056, -0.3603859, 0, 0, 1, 1, 1,
-0.1604274, 2.66022, -0.5541343, 1, 0, 0, 1, 1,
-0.1586987, -1.05761, -2.290441, 1, 0, 0, 1, 1,
-0.157072, -0.5590327, -2.146419, 1, 0, 0, 1, 1,
-0.1519108, -0.2354682, -1.921689, 1, 0, 0, 1, 1,
-0.1517638, -0.1305704, -4.798488, 1, 0, 0, 1, 1,
-0.1497555, 0.94208, -1.978572, 0, 0, 0, 1, 1,
-0.146263, 0.1961297, -0.8359162, 0, 0, 0, 1, 1,
-0.1445379, -0.3709637, -3.409891, 0, 0, 0, 1, 1,
-0.1315444, 2.320947, -2.724452, 0, 0, 0, 1, 1,
-0.1294074, -0.1984321, -2.866031, 0, 0, 0, 1, 1,
-0.1293213, -0.5923918, -2.038697, 0, 0, 0, 1, 1,
-0.1247142, 1.346748, 0.6339313, 0, 0, 0, 1, 1,
-0.1246833, -0.1925128, -2.906087, 1, 1, 1, 1, 1,
-0.119787, 1.334477, -0.8375588, 1, 1, 1, 1, 1,
-0.1156242, 0.3884279, -0.4161132, 1, 1, 1, 1, 1,
-0.1142918, 0.1045982, -0.7505494, 1, 1, 1, 1, 1,
-0.1115477, -2.181227, -2.832572, 1, 1, 1, 1, 1,
-0.1103476, 0.7611541, 0.07956552, 1, 1, 1, 1, 1,
-0.1091853, -1.031037, -4.274783, 1, 1, 1, 1, 1,
-0.1038889, 0.2728311, -0.4442791, 1, 1, 1, 1, 1,
-0.09879635, -0.07752277, -2.906457, 1, 1, 1, 1, 1,
-0.09531073, 1.224563, -0.0946506, 1, 1, 1, 1, 1,
-0.08980761, 1.001216, 0.7851931, 1, 1, 1, 1, 1,
-0.08210362, -2.364885, -1.256828, 1, 1, 1, 1, 1,
-0.07726128, -0.4518164, -2.475322, 1, 1, 1, 1, 1,
-0.07481722, 0.9329054, -1.712798, 1, 1, 1, 1, 1,
-0.06470253, -1.446244, -2.996676, 1, 1, 1, 1, 1,
-0.06027333, -0.05120124, -3.08865, 0, 0, 1, 1, 1,
-0.05281293, -0.6979437, -2.911377, 1, 0, 0, 1, 1,
-0.05166763, -0.3864881, -4.56037, 1, 0, 0, 1, 1,
-0.04938999, 0.4191838, -0.3836543, 1, 0, 0, 1, 1,
-0.04672863, -2.383251, -4.12981, 1, 0, 0, 1, 1,
-0.04569869, -1.672246, -4.083126, 1, 0, 0, 1, 1,
-0.04163655, -0.1808677, -1.559259, 0, 0, 0, 1, 1,
-0.04099701, -0.5615717, -3.013371, 0, 0, 0, 1, 1,
-0.04040888, -1.094638, -3.295171, 0, 0, 0, 1, 1,
-0.03833127, 0.3994296, 0.6904728, 0, 0, 0, 1, 1,
-0.03466476, 1.573617, -0.3442245, 0, 0, 0, 1, 1,
-0.03388873, 0.6968252, -0.5502733, 0, 0, 0, 1, 1,
-0.03125107, 1.159857, -0.7376019, 0, 0, 0, 1, 1,
-0.02052179, -0.2029853, -1.024555, 1, 1, 1, 1, 1,
-0.01840835, 0.6705021, 0.2558833, 1, 1, 1, 1, 1,
-0.01133411, 1.335032, -0.5078668, 1, 1, 1, 1, 1,
-0.01083069, -0.04277637, -4.051066, 1, 1, 1, 1, 1,
-0.00772914, 1.636811, 0.105321, 1, 1, 1, 1, 1,
-0.005585086, 0.2479014, 0.1559037, 1, 1, 1, 1, 1,
-0.0008024165, 0.3020969, 0.2144085, 1, 1, 1, 1, 1,
-0.000129914, 0.5983144, 1.268496, 1, 1, 1, 1, 1,
0.0006085749, 0.5940909, -0.6632129, 1, 1, 1, 1, 1,
0.002090671, -0.7808354, 2.913493, 1, 1, 1, 1, 1,
0.00259342, 2.018452, 0.6857919, 1, 1, 1, 1, 1,
0.003692883, -0.6611626, 4.881212, 1, 1, 1, 1, 1,
0.003898435, -0.9846376, 2.651631, 1, 1, 1, 1, 1,
0.004285249, 0.7742557, 0.4398691, 1, 1, 1, 1, 1,
0.004521785, 0.3141393, 0.9486209, 1, 1, 1, 1, 1,
0.008735759, -0.6141622, 3.381626, 0, 0, 1, 1, 1,
0.0098535, -6.7801e-05, 2.176882, 1, 0, 0, 1, 1,
0.01276764, -0.400332, 3.467099, 1, 0, 0, 1, 1,
0.01598726, 0.2995229, -0.2492078, 1, 0, 0, 1, 1,
0.01627007, 1.061721, 0.7881288, 1, 0, 0, 1, 1,
0.0186238, 1.812795, 0.8108163, 1, 0, 0, 1, 1,
0.0200543, -0.930009, 3.290445, 0, 0, 0, 1, 1,
0.02519683, -0.5577791, 4.46325, 0, 0, 0, 1, 1,
0.02568503, -0.2327821, 2.201763, 0, 0, 0, 1, 1,
0.02620656, -0.76451, 2.222773, 0, 0, 0, 1, 1,
0.02965717, -0.01183857, 1.22295, 0, 0, 0, 1, 1,
0.03043192, -0.1739214, 1.994672, 0, 0, 0, 1, 1,
0.0346753, 1.342174, -0.06891419, 0, 0, 0, 1, 1,
0.03537732, 0.5875015, 1.001131, 1, 1, 1, 1, 1,
0.03579077, 0.0206125, 0.9753131, 1, 1, 1, 1, 1,
0.03698608, -0.4162884, 2.052234, 1, 1, 1, 1, 1,
0.0374934, 0.8271823, -0.5171478, 1, 1, 1, 1, 1,
0.038418, 1.15143, 0.4986102, 1, 1, 1, 1, 1,
0.04808597, -0.1806023, 3.815195, 1, 1, 1, 1, 1,
0.05543686, 0.02716767, 1.768288, 1, 1, 1, 1, 1,
0.05665691, -1.691916, 1.620775, 1, 1, 1, 1, 1,
0.0578368, 0.008185375, 0.9397112, 1, 1, 1, 1, 1,
0.05845385, 0.4129123, -0.2867638, 1, 1, 1, 1, 1,
0.05965442, -0.5242091, 2.600377, 1, 1, 1, 1, 1,
0.06060774, -2.936394, 1.864693, 1, 1, 1, 1, 1,
0.06417373, 1.20899, -0.6734436, 1, 1, 1, 1, 1,
0.06626116, 3.132247, -0.541111, 1, 1, 1, 1, 1,
0.06706874, -0.3533879, 2.215962, 1, 1, 1, 1, 1,
0.06838394, 2.044775, 0.07438826, 0, 0, 1, 1, 1,
0.07090071, 0.8525111, 0.5575054, 1, 0, 0, 1, 1,
0.07282526, -1.081087, 3.835864, 1, 0, 0, 1, 1,
0.07748388, 2.029121, 0.4538714, 1, 0, 0, 1, 1,
0.07807489, -1.984192, 2.146193, 1, 0, 0, 1, 1,
0.07906295, 1.138447, -0.516317, 1, 0, 0, 1, 1,
0.08392748, -0.38671, 3.535944, 0, 0, 0, 1, 1,
0.08484236, -1.812656, 3.100952, 0, 0, 0, 1, 1,
0.08627286, -1.170707, 2.103791, 0, 0, 0, 1, 1,
0.08690608, 1.028617, -0.2664055, 0, 0, 0, 1, 1,
0.08786871, -0.02883758, 1.73589, 0, 0, 0, 1, 1,
0.08809339, 1.056705, 0.6932843, 0, 0, 0, 1, 1,
0.0916995, -0.8663912, 2.437116, 0, 0, 0, 1, 1,
0.09317663, 1.538149, -0.2244312, 1, 1, 1, 1, 1,
0.09422107, -1.299505, 1.66452, 1, 1, 1, 1, 1,
0.0947047, 0.4301253, 0.04289768, 1, 1, 1, 1, 1,
0.09578758, -0.6633177, 2.391929, 1, 1, 1, 1, 1,
0.09845258, -2.755723, 2.897341, 1, 1, 1, 1, 1,
0.09986372, 1.935563, 0.1595133, 1, 1, 1, 1, 1,
0.1000817, 1.297823, -1.119123, 1, 1, 1, 1, 1,
0.1061403, -1.156685, 2.902713, 1, 1, 1, 1, 1,
0.1160889, 0.6919898, 0.3712839, 1, 1, 1, 1, 1,
0.1181004, 0.664425, 0.8613278, 1, 1, 1, 1, 1,
0.1255979, 2.706015, -1.728395, 1, 1, 1, 1, 1,
0.1318742, 0.1496917, -0.2383565, 1, 1, 1, 1, 1,
0.1389956, 0.2986265, 2.585084, 1, 1, 1, 1, 1,
0.1403762, 0.9587893, 1.700638, 1, 1, 1, 1, 1,
0.1418887, 0.6321959, -0.2080665, 1, 1, 1, 1, 1,
0.1422274, 0.411674, -0.06339575, 0, 0, 1, 1, 1,
0.1446885, 0.1363963, -0.1042081, 1, 0, 0, 1, 1,
0.1458025, 2.562503, -0.3528205, 1, 0, 0, 1, 1,
0.1478465, -0.744655, 4.625081, 1, 0, 0, 1, 1,
0.1567991, 0.5039545, 1.553646, 1, 0, 0, 1, 1,
0.1572102, -1.304229, 4.059308, 1, 0, 0, 1, 1,
0.1593925, -0.613476, 2.999436, 0, 0, 0, 1, 1,
0.1598725, -0.7895953, 3.381144, 0, 0, 0, 1, 1,
0.1640409, 0.04614743, 2.32224, 0, 0, 0, 1, 1,
0.1683883, -0.5359027, 3.809948, 0, 0, 0, 1, 1,
0.170125, -1.007833, 4.920326, 0, 0, 0, 1, 1,
0.1709295, 0.3201072, 0.4595785, 0, 0, 0, 1, 1,
0.1736982, -0.4941359, 3.835079, 0, 0, 0, 1, 1,
0.1803025, 0.8263581, 1.120299, 1, 1, 1, 1, 1,
0.1817664, -1.019421, 2.135676, 1, 1, 1, 1, 1,
0.1872678, -1.352926, 3.565547, 1, 1, 1, 1, 1,
0.1894017, 1.222529, 0.6207029, 1, 1, 1, 1, 1,
0.1907551, -1.337794, 3.383808, 1, 1, 1, 1, 1,
0.1938418, 1.332964, -0.2066274, 1, 1, 1, 1, 1,
0.2000498, 0.7589893, 1.151909, 1, 1, 1, 1, 1,
0.2001594, -1.965584, 3.444184, 1, 1, 1, 1, 1,
0.2037206, 0.3165853, -0.4169878, 1, 1, 1, 1, 1,
0.2067227, 0.4402859, 0.5534568, 1, 1, 1, 1, 1,
0.2070438, 0.4985201, 1.076942, 1, 1, 1, 1, 1,
0.218808, -0.4982955, 3.12907, 1, 1, 1, 1, 1,
0.2195671, -1.029199, 4.781924, 1, 1, 1, 1, 1,
0.2218269, 0.315773, -0.8468976, 1, 1, 1, 1, 1,
0.2228469, -1.332371, 2.410478, 1, 1, 1, 1, 1,
0.2245152, 0.757344, 0.9824556, 0, 0, 1, 1, 1,
0.2267338, 0.8788878, -0.4107376, 1, 0, 0, 1, 1,
0.2294283, -1.190658, 5.395192, 1, 0, 0, 1, 1,
0.2297985, 0.4208632, 0.5703403, 1, 0, 0, 1, 1,
0.2309666, 0.7445237, -0.3041536, 1, 0, 0, 1, 1,
0.231088, -0.3267056, 1.299764, 1, 0, 0, 1, 1,
0.2364916, 0.9387375, 2.157973, 0, 0, 0, 1, 1,
0.2411311, -1.102833, 4.264606, 0, 0, 0, 1, 1,
0.2415265, 0.3580658, 0.6250509, 0, 0, 0, 1, 1,
0.2419535, 0.4171631, -0.2189656, 0, 0, 0, 1, 1,
0.2427162, -0.4879175, 2.879962, 0, 0, 0, 1, 1,
0.2432743, 0.08405598, 1.499303, 0, 0, 0, 1, 1,
0.2461697, 1.091145, 1.866666, 0, 0, 0, 1, 1,
0.250473, -0.6940768, 3.868694, 1, 1, 1, 1, 1,
0.2537526, 0.5261119, 3.948122, 1, 1, 1, 1, 1,
0.2559458, 2.928477, 1.742032, 1, 1, 1, 1, 1,
0.2566036, -0.08829118, -0.6779813, 1, 1, 1, 1, 1,
0.2606902, 1.842907, -0.94411, 1, 1, 1, 1, 1,
0.2621804, -0.4244719, 2.534372, 1, 1, 1, 1, 1,
0.2692694, -0.8449218, 3.27926, 1, 1, 1, 1, 1,
0.2701133, 0.06427507, 2.721466, 1, 1, 1, 1, 1,
0.2760943, 0.02786352, 1.193241, 1, 1, 1, 1, 1,
0.2774951, -2.168587, 2.781089, 1, 1, 1, 1, 1,
0.280207, 2.171509, 1.003613, 1, 1, 1, 1, 1,
0.2814687, -1.306357, 2.799821, 1, 1, 1, 1, 1,
0.2814752, 0.6642518, 1.709048, 1, 1, 1, 1, 1,
0.2895129, 1.110396, -1.662968, 1, 1, 1, 1, 1,
0.2897138, -0.5119923, 1.79776, 1, 1, 1, 1, 1,
0.2898602, 1.163128, 1.477825, 0, 0, 1, 1, 1,
0.2951558, 1.288129, -0.605287, 1, 0, 0, 1, 1,
0.3031879, -0.522219, 3.354067, 1, 0, 0, 1, 1,
0.3049279, 0.3318371, 1.006614, 1, 0, 0, 1, 1,
0.3176606, -2.314227, 3.479644, 1, 0, 0, 1, 1,
0.3188444, -1.35827, 2.089042, 1, 0, 0, 1, 1,
0.319611, 0.906588, 0.7905301, 0, 0, 0, 1, 1,
0.3209996, 1.150898, 0.7352856, 0, 0, 0, 1, 1,
0.3275986, 0.9404396, -1.308532, 0, 0, 0, 1, 1,
0.3308365, -0.6341399, 2.061612, 0, 0, 0, 1, 1,
0.334517, 1.313924, 0.2121286, 0, 0, 0, 1, 1,
0.3404043, 0.5417848, 0.1098687, 0, 0, 0, 1, 1,
0.3406031, 1.510429, 2.310055, 0, 0, 0, 1, 1,
0.3465448, 1.096961, 1.422407, 1, 1, 1, 1, 1,
0.3481606, -1.753737, 3.379028, 1, 1, 1, 1, 1,
0.3497526, -1.109118, 3.080826, 1, 1, 1, 1, 1,
0.3545164, -1.159125, 1.659757, 1, 1, 1, 1, 1,
0.3565008, -0.1184452, 3.000556, 1, 1, 1, 1, 1,
0.3572497, -0.8279447, 4.034829, 1, 1, 1, 1, 1,
0.3584187, 1.341977, 1.428162, 1, 1, 1, 1, 1,
0.3593143, 0.3666732, 0.009717974, 1, 1, 1, 1, 1,
0.3604964, -0.02229247, 1.718086, 1, 1, 1, 1, 1,
0.3631574, -0.7265929, 2.590407, 1, 1, 1, 1, 1,
0.3642772, -0.5557269, 3.319626, 1, 1, 1, 1, 1,
0.3646258, 1.593851, -0.06575456, 1, 1, 1, 1, 1,
0.3697231, -2.072834, 1.032489, 1, 1, 1, 1, 1,
0.3732637, 0.145684, 1.922724, 1, 1, 1, 1, 1,
0.3771918, 0.9681166, -0.2653458, 1, 1, 1, 1, 1,
0.382373, 1.16958, -0.2677514, 0, 0, 1, 1, 1,
0.3832445, 0.2887412, 1.926993, 1, 0, 0, 1, 1,
0.3885233, 0.4184991, -0.2662785, 1, 0, 0, 1, 1,
0.3894193, -0.6544113, 3.039687, 1, 0, 0, 1, 1,
0.3996505, 1.890278, 0.6921022, 1, 0, 0, 1, 1,
0.4016042, 0.327462, -0.003552553, 1, 0, 0, 1, 1,
0.4028702, -0.9105809, 1.496565, 0, 0, 0, 1, 1,
0.4063511, -0.3617385, 1.777279, 0, 0, 0, 1, 1,
0.4069793, 0.4311883, -0.5127591, 0, 0, 0, 1, 1,
0.4073432, -1.028953, 2.046576, 0, 0, 0, 1, 1,
0.4080075, -0.6345794, 2.311311, 0, 0, 0, 1, 1,
0.4113317, -0.5323302, 1.609394, 0, 0, 0, 1, 1,
0.4121731, 0.4632515, 0.8452457, 0, 0, 0, 1, 1,
0.4130663, -0.2714235, 2.003742, 1, 1, 1, 1, 1,
0.4193574, -0.2185758, 2.279352, 1, 1, 1, 1, 1,
0.419954, -1.017159, 2.139997, 1, 1, 1, 1, 1,
0.4214472, 0.3243043, 1.762673, 1, 1, 1, 1, 1,
0.4230001, 1.157795, 0.6978489, 1, 1, 1, 1, 1,
0.4264715, -0.5002592, 2.724773, 1, 1, 1, 1, 1,
0.4272552, -0.2642549, 3.092386, 1, 1, 1, 1, 1,
0.4314644, 0.1055881, 1.092844, 1, 1, 1, 1, 1,
0.4319572, 0.9754561, -0.7732804, 1, 1, 1, 1, 1,
0.4328057, -2.015242, 2.976831, 1, 1, 1, 1, 1,
0.4344668, 0.3601272, 2.597183, 1, 1, 1, 1, 1,
0.4345958, 0.2179911, 0.3334475, 1, 1, 1, 1, 1,
0.4349012, 0.9422951, 1.085181, 1, 1, 1, 1, 1,
0.4372652, -1.281718, 3.706635, 1, 1, 1, 1, 1,
0.4424672, 0.6437876, 0.9952566, 1, 1, 1, 1, 1,
0.4473197, 0.1965932, 0.8391469, 0, 0, 1, 1, 1,
0.4499668, -1.22317, 3.906678, 1, 0, 0, 1, 1,
0.4569933, 1.078014, 0.7220034, 1, 0, 0, 1, 1,
0.4582353, -0.5457497, 1.742839, 1, 0, 0, 1, 1,
0.4588747, -0.4703138, 4.091312, 1, 0, 0, 1, 1,
0.4714303, -0.06771453, -0.8525872, 1, 0, 0, 1, 1,
0.4724773, -0.2580304, 3.811574, 0, 0, 0, 1, 1,
0.4908256, 1.743335, 0.951692, 0, 0, 0, 1, 1,
0.4927464, 0.1508653, -0.1429797, 0, 0, 0, 1, 1,
0.4937564, -0.9117811, 1.444715, 0, 0, 0, 1, 1,
0.4939319, -1.449437, 2.290598, 0, 0, 0, 1, 1,
0.4965834, -1.629028, 3.79873, 0, 0, 0, 1, 1,
0.4967239, -0.9002584, 4.152294, 0, 0, 0, 1, 1,
0.4988258, -1.770201, 3.140129, 1, 1, 1, 1, 1,
0.5000163, -2.748476, 2.086842, 1, 1, 1, 1, 1,
0.501806, -0.1516601, 2.054254, 1, 1, 1, 1, 1,
0.5019794, -0.6419486, 1.73895, 1, 1, 1, 1, 1,
0.5023414, -0.1272556, 2.12197, 1, 1, 1, 1, 1,
0.5043097, 0.5819438, -1.29266, 1, 1, 1, 1, 1,
0.5043739, -1.055766, 2.16117, 1, 1, 1, 1, 1,
0.5073854, 0.8791111, -0.07430828, 1, 1, 1, 1, 1,
0.5081089, -0.6985917, 2.228629, 1, 1, 1, 1, 1,
0.5112324, -1.04707, 2.964146, 1, 1, 1, 1, 1,
0.5164995, 1.330088, 0.08544627, 1, 1, 1, 1, 1,
0.5172353, 2.087049, 0.7757573, 1, 1, 1, 1, 1,
0.5201583, -0.5149248, 1.805337, 1, 1, 1, 1, 1,
0.5268548, 0.7258759, -0.3389833, 1, 1, 1, 1, 1,
0.5275674, -1.888315, 2.633756, 1, 1, 1, 1, 1,
0.5318038, -0.2554046, 1.824779, 0, 0, 1, 1, 1,
0.5352523, 1.141379, 1.180988, 1, 0, 0, 1, 1,
0.5352665, -0.48277, 0.9091805, 1, 0, 0, 1, 1,
0.5354672, 1.085663, 0.4862379, 1, 0, 0, 1, 1,
0.557901, 0.2721544, -0.5439885, 1, 0, 0, 1, 1,
0.5608219, 0.09293621, 2.450669, 1, 0, 0, 1, 1,
0.5675734, -0.6863927, 2.516973, 0, 0, 0, 1, 1,
0.5693714, -0.8577243, 3.225535, 0, 0, 0, 1, 1,
0.5713921, 0.7346419, -0.4967183, 0, 0, 0, 1, 1,
0.5794433, 1.277489, 1.926129, 0, 0, 0, 1, 1,
0.5795828, 1.384575, 1.43386, 0, 0, 0, 1, 1,
0.5795832, -0.9576244, 1.91905, 0, 0, 0, 1, 1,
0.5814935, -0.775659, 3.118237, 0, 0, 0, 1, 1,
0.5835904, 1.176807, 0.7702028, 1, 1, 1, 1, 1,
0.5860873, 1.009704, 0.3404214, 1, 1, 1, 1, 1,
0.5872638, -1.52673, 3.83677, 1, 1, 1, 1, 1,
0.5941789, -0.6450302, 1.34566, 1, 1, 1, 1, 1,
0.6035765, 1.098805, 0.2093482, 1, 1, 1, 1, 1,
0.6047906, 1.527093, 1.494324, 1, 1, 1, 1, 1,
0.6103718, 0.5466632, 2.518152, 1, 1, 1, 1, 1,
0.6106398, 0.4414397, 0.03855516, 1, 1, 1, 1, 1,
0.6141819, 0.1629078, -0.2671492, 1, 1, 1, 1, 1,
0.6183025, -1.689801, 3.188626, 1, 1, 1, 1, 1,
0.6208552, 0.9535457, 1.351049, 1, 1, 1, 1, 1,
0.6233181, 0.1430644, 0.4804351, 1, 1, 1, 1, 1,
0.6233647, 0.2738799, 1.583471, 1, 1, 1, 1, 1,
0.628933, 1.127291, -0.198023, 1, 1, 1, 1, 1,
0.6290144, 1.065792, -0.0948657, 1, 1, 1, 1, 1,
0.6311772, -2.256629, 1.513377, 0, 0, 1, 1, 1,
0.6329925, 1.378332, -1.318807, 1, 0, 0, 1, 1,
0.6331412, -1.296191, 3.472314, 1, 0, 0, 1, 1,
0.6369973, 0.6471826, 1.727946, 1, 0, 0, 1, 1,
0.6462283, 1.455544, 0.2440164, 1, 0, 0, 1, 1,
0.6495242, 2.597354, 0.03498901, 1, 0, 0, 1, 1,
0.6502579, -0.6131398, 1.171316, 0, 0, 0, 1, 1,
0.650733, 1.979547, 0.4502654, 0, 0, 0, 1, 1,
0.6517173, 0.7114749, 0.6211985, 0, 0, 0, 1, 1,
0.6579477, 0.127239, -0.7627069, 0, 0, 0, 1, 1,
0.6629668, -2.792106, 3.656672, 0, 0, 0, 1, 1,
0.6652161, 1.527786, -0.01302201, 0, 0, 0, 1, 1,
0.6669666, -0.6799275, 4.517737, 0, 0, 0, 1, 1,
0.6686028, -1.101977, 3.547225, 1, 1, 1, 1, 1,
0.677002, -0.8862187, 2.34531, 1, 1, 1, 1, 1,
0.6789528, -0.134579, 1.755283, 1, 1, 1, 1, 1,
0.6800495, -1.115623, 4.051681, 1, 1, 1, 1, 1,
0.6886066, 0.51511, 2.240995, 1, 1, 1, 1, 1,
0.6923254, 0.9803112, 0.940815, 1, 1, 1, 1, 1,
0.6923407, 0.04586557, 1.611145, 1, 1, 1, 1, 1,
0.6952128, -0.396581, 1.413449, 1, 1, 1, 1, 1,
0.7185585, 1.530281, 1.087008, 1, 1, 1, 1, 1,
0.7190253, -0.866937, 2.803449, 1, 1, 1, 1, 1,
0.723742, 0.3648258, 1.446141, 1, 1, 1, 1, 1,
0.7280039, 1.280605, 1.924536, 1, 1, 1, 1, 1,
0.7292581, 0.3509378, 1.077121, 1, 1, 1, 1, 1,
0.7349442, -0.2083173, 2.224396, 1, 1, 1, 1, 1,
0.7387266, -1.061604, 2.308963, 1, 1, 1, 1, 1,
0.7418161, -0.3548719, 2.503201, 0, 0, 1, 1, 1,
0.745851, 0.5483177, 0.8820154, 1, 0, 0, 1, 1,
0.7479349, 2.200671, 0.6701344, 1, 0, 0, 1, 1,
0.750138, 0.4514679, 0.2090481, 1, 0, 0, 1, 1,
0.7529839, 0.6384284, 0.2533897, 1, 0, 0, 1, 1,
0.7534011, 0.7605568, 2.835307, 1, 0, 0, 1, 1,
0.7555208, -0.6895041, 3.612188, 0, 0, 0, 1, 1,
0.7592304, -0.2014611, 3.011123, 0, 0, 0, 1, 1,
0.7607002, -0.7460945, 3.188758, 0, 0, 0, 1, 1,
0.7611142, 0.8544642, 0.1900889, 0, 0, 0, 1, 1,
0.7644268, 0.3936587, 0.2929569, 0, 0, 0, 1, 1,
0.7664646, -0.8004272, 2.438153, 0, 0, 0, 1, 1,
0.7706068, 1.727932, -1.148454, 0, 0, 0, 1, 1,
0.7725786, -1.106354, 4.002801, 1, 1, 1, 1, 1,
0.7728735, 0.656215, 1.414913, 1, 1, 1, 1, 1,
0.7749329, 0.4166351, 2.656965, 1, 1, 1, 1, 1,
0.7757816, 0.6885602, -0.1410785, 1, 1, 1, 1, 1,
0.7761677, 0.3411063, 1.062535, 1, 1, 1, 1, 1,
0.7793568, -0.1669919, 0.3347184, 1, 1, 1, 1, 1,
0.7804828, -0.1254071, 1.375932, 1, 1, 1, 1, 1,
0.7806554, 0.03466088, 3.038679, 1, 1, 1, 1, 1,
0.7808704, -1.953622, 2.62478, 1, 1, 1, 1, 1,
0.7820168, -0.2238833, 3.406132, 1, 1, 1, 1, 1,
0.7825485, -0.6014055, 3.049586, 1, 1, 1, 1, 1,
0.7877088, -1.642, 3.547873, 1, 1, 1, 1, 1,
0.7881901, -0.4858588, 1.938186, 1, 1, 1, 1, 1,
0.7903314, 0.002804436, 0.8785757, 1, 1, 1, 1, 1,
0.8000148, -1.340807, 2.163996, 1, 1, 1, 1, 1,
0.8006841, 1.179614, -0.1522512, 0, 0, 1, 1, 1,
0.8089359, -0.4129924, 2.431509, 1, 0, 0, 1, 1,
0.8092687, -0.9552636, 2.381342, 1, 0, 0, 1, 1,
0.8131772, 0.5810707, -0.3510286, 1, 0, 0, 1, 1,
0.8190656, -3.107071, 2.956943, 1, 0, 0, 1, 1,
0.8206857, 1.123786, 1.384458, 1, 0, 0, 1, 1,
0.8224084, -0.8509309, 2.891131, 0, 0, 0, 1, 1,
0.8226197, 0.3162466, 2.275618, 0, 0, 0, 1, 1,
0.8289062, 1.684422, -1.564303, 0, 0, 0, 1, 1,
0.8342843, -1.358189, 1.281504, 0, 0, 0, 1, 1,
0.8347456, -1.848926, 0.9860061, 0, 0, 0, 1, 1,
0.8442742, -0.3451529, 2.153188, 0, 0, 0, 1, 1,
0.8463202, -0.07498506, 2.500789, 0, 0, 0, 1, 1,
0.8477073, 1.772603, 1.257837, 1, 1, 1, 1, 1,
0.8492087, 0.2761077, 2.091184, 1, 1, 1, 1, 1,
0.8516635, -0.3121293, 0.8415419, 1, 1, 1, 1, 1,
0.8519455, 0.6395285, 0.6415418, 1, 1, 1, 1, 1,
0.8527068, -0.4638449, 2.000447, 1, 1, 1, 1, 1,
0.8595557, 0.06034384, 2.202808, 1, 1, 1, 1, 1,
0.8602111, 1.13026, 0.1100327, 1, 1, 1, 1, 1,
0.8637086, 0.7590007, 1.822324, 1, 1, 1, 1, 1,
0.8637761, 0.8147889, 0.4647287, 1, 1, 1, 1, 1,
0.8638803, -0.3702986, 0.2966674, 1, 1, 1, 1, 1,
0.8639308, 1.020228, 0.228215, 1, 1, 1, 1, 1,
0.8660759, -0.844939, 2.740521, 1, 1, 1, 1, 1,
0.8665072, -0.4572582, 1.543422, 1, 1, 1, 1, 1,
0.8718549, 0.7101986, 2.234848, 1, 1, 1, 1, 1,
0.8739727, -1.128596, 3.369134, 1, 1, 1, 1, 1,
0.876855, -1.078055, 3.393203, 0, 0, 1, 1, 1,
0.8810089, -0.5481031, 1.95973, 1, 0, 0, 1, 1,
0.8858551, 0.88239, 0.8473524, 1, 0, 0, 1, 1,
0.891701, 0.01033345, -0.04954142, 1, 0, 0, 1, 1,
0.8952298, -0.8311189, 1.11205, 1, 0, 0, 1, 1,
0.8961457, 0.7410534, 1.084894, 1, 0, 0, 1, 1,
0.8965749, 0.1430414, 2.771366, 0, 0, 0, 1, 1,
0.9020135, 0.1387207, 1.508352, 0, 0, 0, 1, 1,
0.9051651, 0.8314319, -0.01997055, 0, 0, 0, 1, 1,
0.9092314, -0.2868292, 2.401864, 0, 0, 0, 1, 1,
0.9145136, -0.8917041, 2.30383, 0, 0, 0, 1, 1,
0.9152247, 0.1764483, 2.399245, 0, 0, 0, 1, 1,
0.9193993, -0.1236733, -0.8034278, 0, 0, 0, 1, 1,
0.9225891, 1.437435, 0.2425518, 1, 1, 1, 1, 1,
0.9249322, -0.517501, 2.019514, 1, 1, 1, 1, 1,
0.9297869, -0.4833332, 0.8735215, 1, 1, 1, 1, 1,
0.9309334, -1.610724, 3.202926, 1, 1, 1, 1, 1,
0.9385083, -1.889546, 2.877882, 1, 1, 1, 1, 1,
0.9497039, -0.3046609, 2.295094, 1, 1, 1, 1, 1,
0.9501686, 0.9586409, 1.119343, 1, 1, 1, 1, 1,
0.9514189, 0.4670574, 0.7984225, 1, 1, 1, 1, 1,
0.9575588, -0.1099826, 1.398622, 1, 1, 1, 1, 1,
0.9675333, 2.492094, 0.08159329, 1, 1, 1, 1, 1,
0.9711676, 0.08874562, -0.657801, 1, 1, 1, 1, 1,
0.9772316, -1.789412, 1.033978, 1, 1, 1, 1, 1,
0.9883843, -0.3249927, 2.029338, 1, 1, 1, 1, 1,
0.9904293, -0.3774006, 1.382735, 1, 1, 1, 1, 1,
0.9912629, -0.8667951, 1.356833, 1, 1, 1, 1, 1,
0.9942997, -0.312869, 1.237044, 0, 0, 1, 1, 1,
0.9962261, -1.762945, 2.07472, 1, 0, 0, 1, 1,
1.007773, 0.4006103, 0.780296, 1, 0, 0, 1, 1,
1.013151, 2.079925, 1.06871, 1, 0, 0, 1, 1,
1.018717, -0.2756634, 0.5783866, 1, 0, 0, 1, 1,
1.025081, -0.9054421, 2.875603, 1, 0, 0, 1, 1,
1.033281, -0.3158595, 2.401347, 0, 0, 0, 1, 1,
1.033419, -1.082055, 2.010761, 0, 0, 0, 1, 1,
1.040324, 0.4893253, 2.017854, 0, 0, 0, 1, 1,
1.042189, -1.929422, 2.522483, 0, 0, 0, 1, 1,
1.043762, -0.4251059, -0.08646023, 0, 0, 0, 1, 1,
1.04406, -0.6603327, 1.692785, 0, 0, 0, 1, 1,
1.051488, -0.01175271, 1.563334, 0, 0, 0, 1, 1,
1.068371, 0.6992888, 1.397432, 1, 1, 1, 1, 1,
1.068531, 1.500601, 0.473953, 1, 1, 1, 1, 1,
1.086766, -0.3724697, 1.134752, 1, 1, 1, 1, 1,
1.087238, -0.1306938, 1.833881, 1, 1, 1, 1, 1,
1.10448, 0.4362831, -0.008796677, 1, 1, 1, 1, 1,
1.106376, 0.8081725, -0.09430733, 1, 1, 1, 1, 1,
1.107356, -0.4580367, 0.3845429, 1, 1, 1, 1, 1,
1.109118, 1.546731, 1.668795, 1, 1, 1, 1, 1,
1.11184, 1.545185, -0.5733255, 1, 1, 1, 1, 1,
1.116263, 0.8246056, 1.260465, 1, 1, 1, 1, 1,
1.119979, -0.2077127, 0.764335, 1, 1, 1, 1, 1,
1.122396, -1.548387, 2.126686, 1, 1, 1, 1, 1,
1.122468, 0.03632943, 1.087375, 1, 1, 1, 1, 1,
1.126317, -0.2662898, 1.688472, 1, 1, 1, 1, 1,
1.131094, -0.303308, 2.008263, 1, 1, 1, 1, 1,
1.132872, -1.947244, 1.70674, 0, 0, 1, 1, 1,
1.133279, 1.012999, 0.6263582, 1, 0, 0, 1, 1,
1.138257, -2.686516, 1.446344, 1, 0, 0, 1, 1,
1.144313, 0.1678814, 1.666456, 1, 0, 0, 1, 1,
1.14802, -0.04121504, 1.290629, 1, 0, 0, 1, 1,
1.152664, -0.4181274, 0.5335793, 1, 0, 0, 1, 1,
1.154077, -1.380661, 2.159164, 0, 0, 0, 1, 1,
1.157145, 1.403604, -0.503134, 0, 0, 0, 1, 1,
1.15754, -0.2594764, 1.159836, 0, 0, 0, 1, 1,
1.160628, 0.9557338, 1.205295, 0, 0, 0, 1, 1,
1.172301, 1.676577, 0.06537396, 0, 0, 0, 1, 1,
1.17284, -0.9020007, 1.534655, 0, 0, 0, 1, 1,
1.181087, -1.160253, 2.172151, 0, 0, 0, 1, 1,
1.181589, -0.5689879, 3.732009, 1, 1, 1, 1, 1,
1.182319, -1.743176, 2.923464, 1, 1, 1, 1, 1,
1.182921, -0.1957549, 1.443177, 1, 1, 1, 1, 1,
1.183744, -1.338991, 2.149911, 1, 1, 1, 1, 1,
1.191587, 0.1837382, 1.922577, 1, 1, 1, 1, 1,
1.194496, -1.099224, 1.824496, 1, 1, 1, 1, 1,
1.206278, -0.4852771, 3.648519, 1, 1, 1, 1, 1,
1.206405, 2.638346, -0.1740593, 1, 1, 1, 1, 1,
1.215967, -2.280882, 2.047749, 1, 1, 1, 1, 1,
1.241013, 0.3957209, 2.526448, 1, 1, 1, 1, 1,
1.242622, 0.4193362, 0.5635913, 1, 1, 1, 1, 1,
1.247804, 0.7564039, 2.942717, 1, 1, 1, 1, 1,
1.248059, -0.1219613, 0.3118098, 1, 1, 1, 1, 1,
1.252374, -0.3008374, 1.190482, 1, 1, 1, 1, 1,
1.254748, -1.321906, 2.363837, 1, 1, 1, 1, 1,
1.258791, -0.4569104, 2.357249, 0, 0, 1, 1, 1,
1.259632, 1.1004, 2.292356, 1, 0, 0, 1, 1,
1.281771, 1.260883, 0.7276473, 1, 0, 0, 1, 1,
1.282468, -0.4307671, 1.132374, 1, 0, 0, 1, 1,
1.283198, -1.179099, 1.310862, 1, 0, 0, 1, 1,
1.286331, -0.9509858, 4.092017, 1, 0, 0, 1, 1,
1.288876, 0.2706372, 3.080242, 0, 0, 0, 1, 1,
1.299057, 3.004136, -0.2558849, 0, 0, 0, 1, 1,
1.301036, -0.178212, 1.460766, 0, 0, 0, 1, 1,
1.306343, -1.034604, 2.468061, 0, 0, 0, 1, 1,
1.310112, -0.6687106, 1.887676, 0, 0, 0, 1, 1,
1.311145, 0.6981356, 3.216809, 0, 0, 0, 1, 1,
1.315171, 0.133162, 2.513986, 0, 0, 0, 1, 1,
1.316298, -0.3950456, 1.344555, 1, 1, 1, 1, 1,
1.337129, 1.442832, 1.376047, 1, 1, 1, 1, 1,
1.363206, -1.121186, 2.315281, 1, 1, 1, 1, 1,
1.375786, -0.8442637, 3.121741, 1, 1, 1, 1, 1,
1.382624, -0.8151689, 2.862578, 1, 1, 1, 1, 1,
1.385351, -0.4887601, 3.562744, 1, 1, 1, 1, 1,
1.385611, -0.6006613, 1.226103, 1, 1, 1, 1, 1,
1.391831, 0.2543387, 3.75177, 1, 1, 1, 1, 1,
1.394174, 0.7779444, 1.745335, 1, 1, 1, 1, 1,
1.395005, 0.8061909, 0.922561, 1, 1, 1, 1, 1,
1.396388, -0.2524649, 2.383688, 1, 1, 1, 1, 1,
1.399135, 0.08617457, 2.645452, 1, 1, 1, 1, 1,
1.403279, 0.2494838, 1.219958, 1, 1, 1, 1, 1,
1.404898, 0.1229745, 0.9726645, 1, 1, 1, 1, 1,
1.413374, 0.9390367, 0.114881, 1, 1, 1, 1, 1,
1.415241, 0.1491265, 1.27862, 0, 0, 1, 1, 1,
1.420003, 1.752405, -0.878639, 1, 0, 0, 1, 1,
1.4222, -0.1960277, 1.800142, 1, 0, 0, 1, 1,
1.422691, 1.521219, 1.232648, 1, 0, 0, 1, 1,
1.433443, 0.3683864, 1.062417, 1, 0, 0, 1, 1,
1.436093, 1.520922, 1.0723, 1, 0, 0, 1, 1,
1.437251, -1.49792, 2.910944, 0, 0, 0, 1, 1,
1.476654, -0.08005825, -0.9817684, 0, 0, 0, 1, 1,
1.480015, 0.881865, 1.631123, 0, 0, 0, 1, 1,
1.490845, 1.125424, 2.148192, 0, 0, 0, 1, 1,
1.497432, -0.1624833, 1.180503, 0, 0, 0, 1, 1,
1.50434, 0.4678321, 1.003551, 0, 0, 0, 1, 1,
1.52092, 0.813364, -0.2825813, 0, 0, 0, 1, 1,
1.523802, 0.5529213, -0.1326273, 1, 1, 1, 1, 1,
1.524083, 0.1121531, 1.645483, 1, 1, 1, 1, 1,
1.525099, -1.125193, 4.033932, 1, 1, 1, 1, 1,
1.54067, 0.987247, -0.9737376, 1, 1, 1, 1, 1,
1.541265, -0.2894756, 4.421693, 1, 1, 1, 1, 1,
1.54316, 1.15106, 0.2996, 1, 1, 1, 1, 1,
1.551187, 0.7553232, -0.2006364, 1, 1, 1, 1, 1,
1.552382, -0.04785717, 0.6575209, 1, 1, 1, 1, 1,
1.55307, -0.1309009, 0.9553695, 1, 1, 1, 1, 1,
1.580204, 0.3346969, 3.091921, 1, 1, 1, 1, 1,
1.581713, 0.4879718, 1.01566, 1, 1, 1, 1, 1,
1.582872, -0.6332184, 2.199342, 1, 1, 1, 1, 1,
1.591207, 2.089972, 0.09171402, 1, 1, 1, 1, 1,
1.591938, -1.64809, 2.441071, 1, 1, 1, 1, 1,
1.597779, -0.7376522, 1.460515, 1, 1, 1, 1, 1,
1.612483, 0.4248904, 1.595994, 0, 0, 1, 1, 1,
1.613862, 0.444498, 2.104406, 1, 0, 0, 1, 1,
1.616608, -0.4069249, 3.520197, 1, 0, 0, 1, 1,
1.627555, 0.2140867, 0.6277822, 1, 0, 0, 1, 1,
1.644189, -1.108272, 1.663633, 1, 0, 0, 1, 1,
1.652364, -0.3599221, 2.878501, 1, 0, 0, 1, 1,
1.65287, -0.3310367, 1.941876, 0, 0, 0, 1, 1,
1.65351, -0.1874524, 2.602775, 0, 0, 0, 1, 1,
1.672296, -1.134554, 1.604257, 0, 0, 0, 1, 1,
1.685652, -0.6754496, 2.187674, 0, 0, 0, 1, 1,
1.696822, 0.2797484, 0.608049, 0, 0, 0, 1, 1,
1.705583, 0.1858459, 1.194224, 0, 0, 0, 1, 1,
1.723395, -0.5644728, 3.821973, 0, 0, 0, 1, 1,
1.731176, 1.419403, 0.8285507, 1, 1, 1, 1, 1,
1.733056, 1.530804, 0.6345285, 1, 1, 1, 1, 1,
1.733431, -0.5493057, 1.907017, 1, 1, 1, 1, 1,
1.736126, -1.422749, 2.881019, 1, 1, 1, 1, 1,
1.736634, 1.33233, -0.5863712, 1, 1, 1, 1, 1,
1.747518, -0.157886, 2.747606, 1, 1, 1, 1, 1,
1.749627, -0.3067895, 1.910614, 1, 1, 1, 1, 1,
1.751116, -0.1880845, 2.663982, 1, 1, 1, 1, 1,
1.76251, 0.3207822, 2.023749, 1, 1, 1, 1, 1,
1.78562, -1.508257, 1.411879, 1, 1, 1, 1, 1,
1.805911, -0.8686662, 3.198694, 1, 1, 1, 1, 1,
1.851971, -1.346979, 2.583178, 1, 1, 1, 1, 1,
1.876241, 0.4704679, 2.381301, 1, 1, 1, 1, 1,
1.882542, -0.1753309, 1.362124, 1, 1, 1, 1, 1,
1.904401, 0.3829073, 0.7616777, 1, 1, 1, 1, 1,
1.955834, -1.191, 1.354669, 0, 0, 1, 1, 1,
1.958488, 0.07617495, 1.57932, 1, 0, 0, 1, 1,
1.960691, 1.309392, -2.327263, 1, 0, 0, 1, 1,
1.974084, 0.4996161, 2.945539, 1, 0, 0, 1, 1,
1.98136, 0.05977997, 0.5582252, 1, 0, 0, 1, 1,
2.088467, 1.257421, 1.249689, 1, 0, 0, 1, 1,
2.100721, -0.278957, 1.117642, 0, 0, 0, 1, 1,
2.10931, 0.2181415, 2.510392, 0, 0, 0, 1, 1,
2.124695, -1.777559, 0.3057823, 0, 0, 0, 1, 1,
2.175743, 0.5071098, 1.802862, 0, 0, 0, 1, 1,
2.20122, 0.5923312, 1.648607, 0, 0, 0, 1, 1,
2.237928, 0.09792993, 0.5896808, 0, 0, 0, 1, 1,
2.259027, -0.04306117, 0.5459797, 0, 0, 0, 1, 1,
2.280025, 0.4189027, 1.326537, 1, 1, 1, 1, 1,
2.317141, -0.06890825, 1.611166, 1, 1, 1, 1, 1,
2.325235, -0.2502645, 2.28241, 1, 1, 1, 1, 1,
2.57447, -0.2282185, 2.525289, 1, 1, 1, 1, 1,
2.825751, 1.062176, 2.967658, 1, 1, 1, 1, 1,
2.84436, 0.8380916, 1.170825, 1, 1, 1, 1, 1,
2.923602, 0.0003988282, 1.875841, 1, 1, 1, 1, 1
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
var radius = 9.657261;
var distance = 33.92072;
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
mvMatrix.translate( 0.09479952, -0.01258802, 0.2348504 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92072);
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