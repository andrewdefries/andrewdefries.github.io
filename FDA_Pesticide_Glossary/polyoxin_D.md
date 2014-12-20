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
-3.41742, -0.3198936, -1.441992, 1, 0, 0, 1,
-2.848271, 0.8702374, -1.061585, 1, 0.007843138, 0, 1,
-2.809428, -0.3192795, -0.09814193, 1, 0.01176471, 0, 1,
-2.587153, 0.4444251, -4.497693, 1, 0.01960784, 0, 1,
-2.538267, 1.006074, -0.1151163, 1, 0.02352941, 0, 1,
-2.42204, 0.3055284, -1.703692, 1, 0.03137255, 0, 1,
-2.354654, 0.03070577, -2.17845, 1, 0.03529412, 0, 1,
-2.341965, -0.7110163, -1.738574, 1, 0.04313726, 0, 1,
-2.284289, 0.2396459, -0.6567581, 1, 0.04705882, 0, 1,
-2.276524, -0.1151943, -1.571302, 1, 0.05490196, 0, 1,
-2.263345, 0.6390364, -4.190838, 1, 0.05882353, 0, 1,
-2.241491, 0.1725276, -0.5351762, 1, 0.06666667, 0, 1,
-2.148308, 0.9835391, -1.361939, 1, 0.07058824, 0, 1,
-2.112154, -1.919857, -3.564997, 1, 0.07843138, 0, 1,
-2.101558, -0.09055098, -1.153155, 1, 0.08235294, 0, 1,
-2.055647, 0.1407735, -2.555735, 1, 0.09019608, 0, 1,
-2.018339, 0.9737098, 0.626485, 1, 0.09411765, 0, 1,
-1.970169, -0.2278027, -0.2860542, 1, 0.1019608, 0, 1,
-1.924163, 1.087505, -1.462068, 1, 0.1098039, 0, 1,
-1.910373, 0.4952892, -1.132079, 1, 0.1137255, 0, 1,
-1.90189, 0.4969311, -0.5546286, 1, 0.1215686, 0, 1,
-1.894992, -0.2971255, -0.01811733, 1, 0.1254902, 0, 1,
-1.888838, 1.295854, -1.435669, 1, 0.1333333, 0, 1,
-1.861227, -0.395709, -3.706446, 1, 0.1372549, 0, 1,
-1.847686, -0.1101755, -0.7934288, 1, 0.145098, 0, 1,
-1.845845, 1.133354, -0.605049, 1, 0.1490196, 0, 1,
-1.845225, 0.8136732, 0.4290946, 1, 0.1568628, 0, 1,
-1.816224, -0.5251245, -2.265878, 1, 0.1607843, 0, 1,
-1.801277, -0.9883894, -1.96346, 1, 0.1686275, 0, 1,
-1.799555, 0.3100497, -1.091626, 1, 0.172549, 0, 1,
-1.787032, -1.282386, -0.7939516, 1, 0.1803922, 0, 1,
-1.783461, -0.1355261, -0.9999156, 1, 0.1843137, 0, 1,
-1.775726, -1.678805, -2.366394, 1, 0.1921569, 0, 1,
-1.773501, -1.004204, -1.868353, 1, 0.1960784, 0, 1,
-1.750446, 2.183474, 0.2084186, 1, 0.2039216, 0, 1,
-1.746568, -0.6048322, -1.039079, 1, 0.2117647, 0, 1,
-1.739349, -0.4541388, -1.423843, 1, 0.2156863, 0, 1,
-1.699659, -0.9938653, -1.526655, 1, 0.2235294, 0, 1,
-1.693642, 1.833985, -1.485474, 1, 0.227451, 0, 1,
-1.690407, 1.587461, -3.055024, 1, 0.2352941, 0, 1,
-1.682869, -1.63543, -3.811648, 1, 0.2392157, 0, 1,
-1.677392, -0.1480533, -3.358062, 1, 0.2470588, 0, 1,
-1.662802, -0.9979324, -0.8095466, 1, 0.2509804, 0, 1,
-1.656219, 1.323407, -0.731301, 1, 0.2588235, 0, 1,
-1.632952, -2.160778, -2.719235, 1, 0.2627451, 0, 1,
-1.610155, 1.568027, -2.074258, 1, 0.2705882, 0, 1,
-1.610053, -1.123472, -2.126158, 1, 0.2745098, 0, 1,
-1.596142, 0.20332, -0.9682283, 1, 0.282353, 0, 1,
-1.571492, -0.9296199, -2.697746, 1, 0.2862745, 0, 1,
-1.566332, -0.8321463, -0.9024007, 1, 0.2941177, 0, 1,
-1.563932, 1.16186, -1.39058, 1, 0.3019608, 0, 1,
-1.56293, 0.02486037, -1.976036, 1, 0.3058824, 0, 1,
-1.549345, -1.486328, -2.02683, 1, 0.3137255, 0, 1,
-1.544361, -0.4234768, 0.5686749, 1, 0.3176471, 0, 1,
-1.530199, 0.2415817, -1.075504, 1, 0.3254902, 0, 1,
-1.528393, 0.3947103, -2.04587, 1, 0.3294118, 0, 1,
-1.51972, -0.3164329, -1.522004, 1, 0.3372549, 0, 1,
-1.517663, -0.6806262, -2.511745, 1, 0.3411765, 0, 1,
-1.514088, 1.203151, -0.3438023, 1, 0.3490196, 0, 1,
-1.509544, -0.5515406, -2.767999, 1, 0.3529412, 0, 1,
-1.5061, 1.565004, -0.8659637, 1, 0.3607843, 0, 1,
-1.504501, -0.2826141, -0.5091389, 1, 0.3647059, 0, 1,
-1.493487, -1.780715, -2.319955, 1, 0.372549, 0, 1,
-1.485649, 0.4818028, -2.14308, 1, 0.3764706, 0, 1,
-1.478476, -1.415462, -2.41972, 1, 0.3843137, 0, 1,
-1.476779, -0.1099975, -0.9438404, 1, 0.3882353, 0, 1,
-1.476655, -1.326733, -1.179428, 1, 0.3960784, 0, 1,
-1.464072, -1.864387, -3.434663, 1, 0.4039216, 0, 1,
-1.439809, -1.347365, -3.238077, 1, 0.4078431, 0, 1,
-1.437827, 0.8665492, -0.1687407, 1, 0.4156863, 0, 1,
-1.4363, 1.048364, 0.2183009, 1, 0.4196078, 0, 1,
-1.427972, 1.736874, 1.17837, 1, 0.427451, 0, 1,
-1.426953, 0.3937895, -1.650162, 1, 0.4313726, 0, 1,
-1.424417, 0.1384361, -2.39024, 1, 0.4392157, 0, 1,
-1.420829, -0.09353477, -1.790293, 1, 0.4431373, 0, 1,
-1.415699, 0.07722491, -1.975778, 1, 0.4509804, 0, 1,
-1.408706, -0.8412653, -4.339515, 1, 0.454902, 0, 1,
-1.403147, -2.076131, -2.726458, 1, 0.4627451, 0, 1,
-1.400799, -0.05342977, -1.390274, 1, 0.4666667, 0, 1,
-1.384619, 0.9584087, -0.3569205, 1, 0.4745098, 0, 1,
-1.384209, -1.227291, -2.673581, 1, 0.4784314, 0, 1,
-1.378345, -0.3034975, -0.594048, 1, 0.4862745, 0, 1,
-1.35725, -0.2383612, -2.985803, 1, 0.4901961, 0, 1,
-1.347338, 0.8456885, 1.084447, 1, 0.4980392, 0, 1,
-1.335893, 0.2662169, -0.1842193, 1, 0.5058824, 0, 1,
-1.323413, -0.2196621, 0.3415983, 1, 0.509804, 0, 1,
-1.317584, -2.123653, -1.068712, 1, 0.5176471, 0, 1,
-1.316092, -0.8212005, -2.944287, 1, 0.5215687, 0, 1,
-1.290029, 0.2447689, -2.404151, 1, 0.5294118, 0, 1,
-1.289819, 1.168902, -1.493766, 1, 0.5333334, 0, 1,
-1.280621, -0.4876301, -1.945643, 1, 0.5411765, 0, 1,
-1.268236, 0.8033106, 0.07943961, 1, 0.5450981, 0, 1,
-1.263992, -0.3242165, -0.7959191, 1, 0.5529412, 0, 1,
-1.256226, 1.273429, -1.5836, 1, 0.5568628, 0, 1,
-1.253136, 1.201946, -0.8799095, 1, 0.5647059, 0, 1,
-1.221805, 0.2565767, 0.6237141, 1, 0.5686275, 0, 1,
-1.221071, -0.007332669, -1.731331, 1, 0.5764706, 0, 1,
-1.218709, 2.002585, 0.5964581, 1, 0.5803922, 0, 1,
-1.200638, -1.134187, -2.637206, 1, 0.5882353, 0, 1,
-1.196285, -0.2037783, -1.43836, 1, 0.5921569, 0, 1,
-1.193681, 0.6837294, 0.394743, 1, 0.6, 0, 1,
-1.189118, -1.347822, -3.863103, 1, 0.6078432, 0, 1,
-1.18251, 0.2877968, -2.113346, 1, 0.6117647, 0, 1,
-1.182227, 0.7192754, -1.819146, 1, 0.6196079, 0, 1,
-1.179417, 1.334644, -2.011198, 1, 0.6235294, 0, 1,
-1.169889, -0.6925691, -1.901707, 1, 0.6313726, 0, 1,
-1.169318, 0.4279961, -1.279967, 1, 0.6352941, 0, 1,
-1.168667, -0.5336413, -2.75096, 1, 0.6431373, 0, 1,
-1.165514, 0.9059628, -1.258617, 1, 0.6470588, 0, 1,
-1.16202, -0.3313079, -1.522241, 1, 0.654902, 0, 1,
-1.160753, 1.603039, 1.178674, 1, 0.6588235, 0, 1,
-1.160087, 0.7427965, -0.6227512, 1, 0.6666667, 0, 1,
-1.159323, 0.09692545, -1.533077, 1, 0.6705883, 0, 1,
-1.157824, 0.4795725, -3.409936, 1, 0.6784314, 0, 1,
-1.155395, -1.04251, -2.885918, 1, 0.682353, 0, 1,
-1.146119, -0.2742286, -1.417316, 1, 0.6901961, 0, 1,
-1.143072, -1.418961, -1.708806, 1, 0.6941177, 0, 1,
-1.127058, 2.015981, 1.545855, 1, 0.7019608, 0, 1,
-1.126779, -0.362671, -4.306096, 1, 0.7098039, 0, 1,
-1.122068, -0.4951755, -1.121447, 1, 0.7137255, 0, 1,
-1.119451, -2.697004, -3.09867, 1, 0.7215686, 0, 1,
-1.10792, 1.163983, 0.6305817, 1, 0.7254902, 0, 1,
-1.105339, -2.368394, -1.987086, 1, 0.7333333, 0, 1,
-1.098435, 0.3153575, -1.343866, 1, 0.7372549, 0, 1,
-1.096377, -1.666421, -1.534093, 1, 0.7450981, 0, 1,
-1.093384, -0.8993641, -2.045676, 1, 0.7490196, 0, 1,
-1.092904, -0.3480626, -0.9215215, 1, 0.7568628, 0, 1,
-1.092481, -0.2920488, -1.975927, 1, 0.7607843, 0, 1,
-1.091524, -0.3528423, -0.8275149, 1, 0.7686275, 0, 1,
-1.075691, 0.8129703, -0.3410571, 1, 0.772549, 0, 1,
-1.073256, 1.339561, -1.719033, 1, 0.7803922, 0, 1,
-1.070055, 0.5794328, -0.7158576, 1, 0.7843137, 0, 1,
-1.069581, 0.6268997, -1.521659, 1, 0.7921569, 0, 1,
-1.066456, 0.7088475, 1.008103, 1, 0.7960784, 0, 1,
-1.065146, -0.7651248, -2.08094, 1, 0.8039216, 0, 1,
-1.044107, -0.2537271, -1.001124, 1, 0.8117647, 0, 1,
-1.033842, 0.504303, -0.06838444, 1, 0.8156863, 0, 1,
-1.030245, 1.663254, 0.6255505, 1, 0.8235294, 0, 1,
-1.026872, -0.07694666, -2.778781, 1, 0.827451, 0, 1,
-1.016324, 0.4301221, -2.266521, 1, 0.8352941, 0, 1,
-1.01436, 0.7435901, 0.3075903, 1, 0.8392157, 0, 1,
-1.010405, -1.013452, -2.53116, 1, 0.8470588, 0, 1,
-1.008888, 0.5676348, -1.256858, 1, 0.8509804, 0, 1,
-1.007149, -0.5970756, -3.337935, 1, 0.8588235, 0, 1,
-1.006743, -1.056928, -2.03827, 1, 0.8627451, 0, 1,
-1.001816, 1.504624, -1.478775, 1, 0.8705882, 0, 1,
-0.9852479, 0.7831788, -0.0536998, 1, 0.8745098, 0, 1,
-0.984181, -1.698724, -0.4781579, 1, 0.8823529, 0, 1,
-0.9805591, 0.5368432, 0.7732646, 1, 0.8862745, 0, 1,
-0.9605966, 0.5736409, -0.4716085, 1, 0.8941177, 0, 1,
-0.9588142, -2.747058, -1.387704, 1, 0.8980392, 0, 1,
-0.9582762, -0.3220581, -1.256829, 1, 0.9058824, 0, 1,
-0.954858, -0.5963113, -1.702998, 1, 0.9137255, 0, 1,
-0.9537643, 1.413287, -0.323733, 1, 0.9176471, 0, 1,
-0.9497952, -1.66517, -2.102909, 1, 0.9254902, 0, 1,
-0.9471339, 0.1439097, -1.428174, 1, 0.9294118, 0, 1,
-0.942019, 1.578725, -1.151697, 1, 0.9372549, 0, 1,
-0.9404463, 0.2666349, -0.3378761, 1, 0.9411765, 0, 1,
-0.9396771, 1.016355, -2.280018, 1, 0.9490196, 0, 1,
-0.9381816, 0.4300725, 0.04968063, 1, 0.9529412, 0, 1,
-0.9366487, 1.132956, -1.474248, 1, 0.9607843, 0, 1,
-0.9300999, -0.411456, -2.753181, 1, 0.9647059, 0, 1,
-0.927802, -1.0619, -1.753268, 1, 0.972549, 0, 1,
-0.9241441, -1.095435, -0.8834237, 1, 0.9764706, 0, 1,
-0.9151425, 2.65105, -1.403367, 1, 0.9843137, 0, 1,
-0.9145567, -0.09297488, -1.303899, 1, 0.9882353, 0, 1,
-0.9129982, -2.307659, -2.97931, 1, 0.9960784, 0, 1,
-0.9108944, 0.4545449, -0.144324, 0.9960784, 1, 0, 1,
-0.9072948, -1.756099, -3.011428, 0.9921569, 1, 0, 1,
-0.9060643, 0.05681987, -1.70716, 0.9843137, 1, 0, 1,
-0.9005362, -0.9409291, -1.283718, 0.9803922, 1, 0, 1,
-0.8983665, 0.7844878, -2.025708, 0.972549, 1, 0, 1,
-0.8942904, -0.8419155, -1.951241, 0.9686275, 1, 0, 1,
-0.8922678, -1.285606, -3.141476, 0.9607843, 1, 0, 1,
-0.8896284, -0.4697688, -1.175528, 0.9568627, 1, 0, 1,
-0.8807773, 1.088624, -1.877961, 0.9490196, 1, 0, 1,
-0.8764926, 0.369491, -0.154149, 0.945098, 1, 0, 1,
-0.8720579, -1.519681, -2.044654, 0.9372549, 1, 0, 1,
-0.8717899, 1.250227, -1.070684, 0.9333333, 1, 0, 1,
-0.8714043, 0.0824679, -1.019354, 0.9254902, 1, 0, 1,
-0.8676621, -1.238534, -1.539223, 0.9215686, 1, 0, 1,
-0.865957, -0.4041314, -1.760331, 0.9137255, 1, 0, 1,
-0.8650755, -1.57931, -2.827741, 0.9098039, 1, 0, 1,
-0.8512528, -0.1527111, -1.864095, 0.9019608, 1, 0, 1,
-0.8498251, 0.3895386, -0.07565644, 0.8941177, 1, 0, 1,
-0.8490018, 0.1917789, -0.8208703, 0.8901961, 1, 0, 1,
-0.8452992, 1.519623, 0.3752435, 0.8823529, 1, 0, 1,
-0.8424031, 0.5655999, 0.173089, 0.8784314, 1, 0, 1,
-0.8423256, 1.4317, 0.4872648, 0.8705882, 1, 0, 1,
-0.841266, -0.1224922, -0.7566016, 0.8666667, 1, 0, 1,
-0.8330037, -0.4923202, -1.092489, 0.8588235, 1, 0, 1,
-0.8308302, 0.9109747, -1.489275, 0.854902, 1, 0, 1,
-0.8274467, 0.289878, -3.082311, 0.8470588, 1, 0, 1,
-0.8259333, 1.3912, -0.05235756, 0.8431373, 1, 0, 1,
-0.8256735, 0.0607591, -0.003844585, 0.8352941, 1, 0, 1,
-0.8193989, -0.3641187, -1.70908, 0.8313726, 1, 0, 1,
-0.8059953, -0.1960177, -0.5104236, 0.8235294, 1, 0, 1,
-0.8053638, -1.173533, -3.881979, 0.8196079, 1, 0, 1,
-0.7995805, 0.4940641, -0.8496221, 0.8117647, 1, 0, 1,
-0.7932256, 0.3837696, -0.3325421, 0.8078431, 1, 0, 1,
-0.7863387, -0.8671899, -3.038026, 0.8, 1, 0, 1,
-0.7822887, -1.271217, -3.13201, 0.7921569, 1, 0, 1,
-0.7761211, -1.217502, -1.86582, 0.7882353, 1, 0, 1,
-0.7737287, -0.9435298, -2.465002, 0.7803922, 1, 0, 1,
-0.7705734, -0.6988139, -1.724005, 0.7764706, 1, 0, 1,
-0.7622499, -0.3889579, -2.275508, 0.7686275, 1, 0, 1,
-0.7606321, -0.8442675, -2.98127, 0.7647059, 1, 0, 1,
-0.7599031, -0.4307145, -2.559196, 0.7568628, 1, 0, 1,
-0.7580265, -1.10176, -0.2539812, 0.7529412, 1, 0, 1,
-0.7537171, 0.3617726, 0.2802579, 0.7450981, 1, 0, 1,
-0.752475, 0.4576259, -1.041616, 0.7411765, 1, 0, 1,
-0.7404868, 0.2326481, 1.261721, 0.7333333, 1, 0, 1,
-0.738574, 0.1323035, -2.255111, 0.7294118, 1, 0, 1,
-0.7383226, 0.5940708, -0.30672, 0.7215686, 1, 0, 1,
-0.7371328, 0.285551, -1.479175, 0.7176471, 1, 0, 1,
-0.7329843, -0.3545085, -3.61416, 0.7098039, 1, 0, 1,
-0.7274499, -1.709856, -2.922346, 0.7058824, 1, 0, 1,
-0.7274299, -1.289346, -3.572486, 0.6980392, 1, 0, 1,
-0.7262909, -0.08997256, -0.500028, 0.6901961, 1, 0, 1,
-0.7245197, -2.039695, -3.657189, 0.6862745, 1, 0, 1,
-0.723498, -0.5694977, -3.546964, 0.6784314, 1, 0, 1,
-0.7219555, 0.7760088, 0.5387073, 0.6745098, 1, 0, 1,
-0.7216552, 0.09528846, -0.5898774, 0.6666667, 1, 0, 1,
-0.7068596, -0.01720873, -0.8534774, 0.6627451, 1, 0, 1,
-0.7048386, 0.1260829, -0.8303982, 0.654902, 1, 0, 1,
-0.704262, 0.5457497, 0.1449203, 0.6509804, 1, 0, 1,
-0.6900857, 0.8664315, 0.2284521, 0.6431373, 1, 0, 1,
-0.6869957, 0.004787536, -3.069629, 0.6392157, 1, 0, 1,
-0.6847857, 0.1455939, -3.131963, 0.6313726, 1, 0, 1,
-0.6847134, 1.281877, 0.135511, 0.627451, 1, 0, 1,
-0.6846826, -0.05248981, -0.7999386, 0.6196079, 1, 0, 1,
-0.6837035, -0.6622946, -2.310162, 0.6156863, 1, 0, 1,
-0.6806509, 1.087894, 0.3504862, 0.6078432, 1, 0, 1,
-0.6795636, -0.5828164, -2.433209, 0.6039216, 1, 0, 1,
-0.6754722, -0.1942588, -1.157185, 0.5960785, 1, 0, 1,
-0.6732108, -2.953049, -2.617657, 0.5882353, 1, 0, 1,
-0.6729044, -0.7349787, -2.885893, 0.5843138, 1, 0, 1,
-0.6727318, -0.2184807, -0.6141849, 0.5764706, 1, 0, 1,
-0.6715314, -0.9135125, -2.919691, 0.572549, 1, 0, 1,
-0.6668532, 0.9062614, -0.7800289, 0.5647059, 1, 0, 1,
-0.6665806, -0.3347528, -0.8471707, 0.5607843, 1, 0, 1,
-0.6662223, -1.151702, -2.409144, 0.5529412, 1, 0, 1,
-0.6653055, -0.3244515, -1.84625, 0.5490196, 1, 0, 1,
-0.6559268, 0.3805525, 0.1367855, 0.5411765, 1, 0, 1,
-0.6553565, -0.7568439, -1.99848, 0.5372549, 1, 0, 1,
-0.6543152, 0.02480441, -1.626582, 0.5294118, 1, 0, 1,
-0.6507543, 1.092921, 0.5073028, 0.5254902, 1, 0, 1,
-0.647733, -1.128864, -1.9661, 0.5176471, 1, 0, 1,
-0.6473796, 0.6193814, -1.298318, 0.5137255, 1, 0, 1,
-0.6465422, -0.1990438, -1.459025, 0.5058824, 1, 0, 1,
-0.6455464, 0.9774691, -0.077343, 0.5019608, 1, 0, 1,
-0.6376215, -1.624122, -2.195502, 0.4941176, 1, 0, 1,
-0.6321785, 0.5009338, -1.360231, 0.4862745, 1, 0, 1,
-0.6299887, -1.394203, -1.393649, 0.4823529, 1, 0, 1,
-0.629296, 0.4710794, -0.2824344, 0.4745098, 1, 0, 1,
-0.6271241, -0.2527861, -2.369112, 0.4705882, 1, 0, 1,
-0.6266623, -0.02431371, -0.4820251, 0.4627451, 1, 0, 1,
-0.6246758, 0.441244, 0.3603848, 0.4588235, 1, 0, 1,
-0.6175925, -1.090876, -2.677232, 0.4509804, 1, 0, 1,
-0.6115958, -0.5207657, -3.036619, 0.4470588, 1, 0, 1,
-0.6088246, -0.6362066, -0.4714537, 0.4392157, 1, 0, 1,
-0.6073436, -1.745573, -2.704294, 0.4352941, 1, 0, 1,
-0.6070603, 1.559385, 0.8481635, 0.427451, 1, 0, 1,
-0.6033549, -0.8992915, -3.496367, 0.4235294, 1, 0, 1,
-0.6029394, -1.773092, -2.957822, 0.4156863, 1, 0, 1,
-0.5997843, -0.6641937, -1.81255, 0.4117647, 1, 0, 1,
-0.593344, -2.152429, -2.780819, 0.4039216, 1, 0, 1,
-0.587242, 0.6013594, 0.0571175, 0.3960784, 1, 0, 1,
-0.5843549, -1.293506, -1.636238, 0.3921569, 1, 0, 1,
-0.5822247, 0.6407803, -0.5386195, 0.3843137, 1, 0, 1,
-0.5820842, -1.138106, -5.622241, 0.3803922, 1, 0, 1,
-0.5803539, 0.2029843, -2.884319, 0.372549, 1, 0, 1,
-0.5759445, -0.9793833, -0.8783206, 0.3686275, 1, 0, 1,
-0.5649107, -1.658915, -2.561475, 0.3607843, 1, 0, 1,
-0.5627295, -0.1130621, -1.711596, 0.3568628, 1, 0, 1,
-0.5625338, -0.1459412, -1.246143, 0.3490196, 1, 0, 1,
-0.5589821, -1.177221, -2.275372, 0.345098, 1, 0, 1,
-0.5568854, 1.079519, -2.378342, 0.3372549, 1, 0, 1,
-0.5559455, 0.3671539, -1.667672, 0.3333333, 1, 0, 1,
-0.5557959, 0.3267076, -0.7168332, 0.3254902, 1, 0, 1,
-0.5525676, 0.1796195, -0.8917388, 0.3215686, 1, 0, 1,
-0.5494336, -0.2275083, -1.992604, 0.3137255, 1, 0, 1,
-0.5447745, 0.3100345, -2.332297, 0.3098039, 1, 0, 1,
-0.5432983, -0.9880931, -2.786962, 0.3019608, 1, 0, 1,
-0.5420979, -0.3114199, 0.7794945, 0.2941177, 1, 0, 1,
-0.5387198, 1.321535, -0.6737769, 0.2901961, 1, 0, 1,
-0.5377298, 0.1594206, -1.907104, 0.282353, 1, 0, 1,
-0.5347822, -1.848513, -3.116306, 0.2784314, 1, 0, 1,
-0.5345582, 0.3981855, -1.374854, 0.2705882, 1, 0, 1,
-0.532341, -1.079124, 0.02101109, 0.2666667, 1, 0, 1,
-0.5274793, 0.5519006, -0.7559361, 0.2588235, 1, 0, 1,
-0.5269603, -0.4304261, -1.635772, 0.254902, 1, 0, 1,
-0.5045335, -0.4089549, -1.614499, 0.2470588, 1, 0, 1,
-0.4949118, 2.234346, -0.4196749, 0.2431373, 1, 0, 1,
-0.4903169, -1.161149, -4.591568, 0.2352941, 1, 0, 1,
-0.4887289, 0.7318469, -0.5010257, 0.2313726, 1, 0, 1,
-0.4831558, 0.7341039, -1.750996, 0.2235294, 1, 0, 1,
-0.4821466, 0.361232, -0.8341572, 0.2196078, 1, 0, 1,
-0.4797446, 0.6923385, -0.001220021, 0.2117647, 1, 0, 1,
-0.479112, 2.601647, -0.1653406, 0.2078431, 1, 0, 1,
-0.4740988, 0.9502898, 0.5861124, 0.2, 1, 0, 1,
-0.4734514, 0.4773194, -1.454492, 0.1921569, 1, 0, 1,
-0.4687772, 0.1255123, -1.462149, 0.1882353, 1, 0, 1,
-0.4686981, -0.049035, -1.52185, 0.1803922, 1, 0, 1,
-0.4678041, 1.053939, -2.024487, 0.1764706, 1, 0, 1,
-0.4654016, -0.3604808, -2.97165, 0.1686275, 1, 0, 1,
-0.4628141, 1.325278, 0.2878183, 0.1647059, 1, 0, 1,
-0.4588674, 0.3657332, -2.548863, 0.1568628, 1, 0, 1,
-0.4550896, 0.07432012, -2.871441, 0.1529412, 1, 0, 1,
-0.450302, -0.8595942, -1.880019, 0.145098, 1, 0, 1,
-0.4502776, 0.9699116, -0.4405327, 0.1411765, 1, 0, 1,
-0.4496702, 1.405862, -0.8907056, 0.1333333, 1, 0, 1,
-0.4464338, -1.58198, -1.98934, 0.1294118, 1, 0, 1,
-0.4451717, 1.651348, 0.07021386, 0.1215686, 1, 0, 1,
-0.4438856, -0.9897001, -2.866636, 0.1176471, 1, 0, 1,
-0.441384, 1.201449, 2.377096, 0.1098039, 1, 0, 1,
-0.4393082, -0.2847336, -2.917877, 0.1058824, 1, 0, 1,
-0.4344412, -0.09743676, -2.305177, 0.09803922, 1, 0, 1,
-0.434419, 0.09086739, -2.225121, 0.09019608, 1, 0, 1,
-0.4308326, -0.4918923, -2.018517, 0.08627451, 1, 0, 1,
-0.4284507, -0.2127901, -1.873293, 0.07843138, 1, 0, 1,
-0.4275442, -0.8453976, -2.313488, 0.07450981, 1, 0, 1,
-0.4257748, -0.9550219, -2.013491, 0.06666667, 1, 0, 1,
-0.4176244, 0.9064889, -1.240348, 0.0627451, 1, 0, 1,
-0.4172873, 0.3982641, -0.2567048, 0.05490196, 1, 0, 1,
-0.4171355, -1.740611, -2.910609, 0.05098039, 1, 0, 1,
-0.4153549, -0.7111241, -3.758683, 0.04313726, 1, 0, 1,
-0.4137601, 0.515576, -1.752721, 0.03921569, 1, 0, 1,
-0.4117668, -0.5407481, -3.183533, 0.03137255, 1, 0, 1,
-0.409801, 0.8795236, -0.6748432, 0.02745098, 1, 0, 1,
-0.4075307, -0.8328964, -3.51631, 0.01960784, 1, 0, 1,
-0.4061345, -0.6781514, -3.138757, 0.01568628, 1, 0, 1,
-0.4031042, -1.25153, -2.921053, 0.007843138, 1, 0, 1,
-0.4029402, 1.193482, 0.1053851, 0.003921569, 1, 0, 1,
-0.3989851, -1.454215, -3.173448, 0, 1, 0.003921569, 1,
-0.396899, -2.027736, -5.10406, 0, 1, 0.01176471, 1,
-0.3945655, 0.01589189, -1.767243, 0, 1, 0.01568628, 1,
-0.3794998, -0.8552273, -1.752306, 0, 1, 0.02352941, 1,
-0.3787926, -0.05547114, -2.296405, 0, 1, 0.02745098, 1,
-0.377525, 0.588755, -0.4827843, 0, 1, 0.03529412, 1,
-0.3747555, -1.969589, -3.846185, 0, 1, 0.03921569, 1,
-0.3693984, 1.055498, -0.9882299, 0, 1, 0.04705882, 1,
-0.3678842, 0.3592246, -0.8387718, 0, 1, 0.05098039, 1,
-0.3650704, 1.823842, -1.007521, 0, 1, 0.05882353, 1,
-0.3616415, -0.2007789, -1.904127, 0, 1, 0.0627451, 1,
-0.3587321, 0.7861346, 0.415016, 0, 1, 0.07058824, 1,
-0.3573424, -0.2842782, -1.062104, 0, 1, 0.07450981, 1,
-0.3556938, -0.9550282, -2.735352, 0, 1, 0.08235294, 1,
-0.3552518, -1.467171, -2.580412, 0, 1, 0.08627451, 1,
-0.3549849, -2.270607, -4.026666, 0, 1, 0.09411765, 1,
-0.3528406, -0.8282452, -3.202158, 0, 1, 0.1019608, 1,
-0.3505038, -0.0482056, -1.564536, 0, 1, 0.1058824, 1,
-0.3478422, 0.9647262, 0.5646594, 0, 1, 0.1137255, 1,
-0.3474384, -0.945582, -3.713463, 0, 1, 0.1176471, 1,
-0.3453592, -0.1435675, -1.81389, 0, 1, 0.1254902, 1,
-0.3408395, -2.634513, -2.325662, 0, 1, 0.1294118, 1,
-0.3384623, 1.536367, -0.06701288, 0, 1, 0.1372549, 1,
-0.3370173, 2.250594, -0.1739117, 0, 1, 0.1411765, 1,
-0.3368488, 1.179536, -0.7822083, 0, 1, 0.1490196, 1,
-0.3300778, 0.1970854, -1.010189, 0, 1, 0.1529412, 1,
-0.3292929, 2.170597, -0.9866796, 0, 1, 0.1607843, 1,
-0.3287424, -0.5727559, -1.155214, 0, 1, 0.1647059, 1,
-0.326924, -0.1906849, -1.521602, 0, 1, 0.172549, 1,
-0.3264742, 0.6244681, -0.8310379, 0, 1, 0.1764706, 1,
-0.3247794, 0.376411, 0.108323, 0, 1, 0.1843137, 1,
-0.3247606, 0.5079796, -2.23939, 0, 1, 0.1882353, 1,
-0.3190444, 0.9894759, -0.4155172, 0, 1, 0.1960784, 1,
-0.3156349, -0.7101528, -2.216536, 0, 1, 0.2039216, 1,
-0.3151687, 0.1042223, -2.8296, 0, 1, 0.2078431, 1,
-0.3107406, 0.7233393, 1.388235, 0, 1, 0.2156863, 1,
-0.3105019, -1.164271, -2.912182, 0, 1, 0.2196078, 1,
-0.3086358, 0.3517647, 0.1648105, 0, 1, 0.227451, 1,
-0.2958657, 0.02461635, -0.7787855, 0, 1, 0.2313726, 1,
-0.2922359, -0.301042, -0.9706632, 0, 1, 0.2392157, 1,
-0.2913899, 0.1699716, -1.561552, 0, 1, 0.2431373, 1,
-0.2888961, 0.2783484, -1.676891, 0, 1, 0.2509804, 1,
-0.285344, 0.6044527, 0.01988887, 0, 1, 0.254902, 1,
-0.2831767, 1.675306, 0.1333594, 0, 1, 0.2627451, 1,
-0.2823877, -0.7774363, -3.659769, 0, 1, 0.2666667, 1,
-0.2819187, -2.077837, -3.36529, 0, 1, 0.2745098, 1,
-0.27452, 1.372013, -0.166254, 0, 1, 0.2784314, 1,
-0.2652554, -0.8434885, -4.449848, 0, 1, 0.2862745, 1,
-0.2612208, -0.05305204, -1.283605, 0, 1, 0.2901961, 1,
-0.2595401, -0.2288433, -1.529864, 0, 1, 0.2980392, 1,
-0.2580643, 0.6471047, -0.2501534, 0, 1, 0.3058824, 1,
-0.2497549, -0.622988, -1.356172, 0, 1, 0.3098039, 1,
-0.2495366, 0.4811252, 0.2492303, 0, 1, 0.3176471, 1,
-0.2478765, 0.730265, -0.7390643, 0, 1, 0.3215686, 1,
-0.2419409, -0.1312808, -1.672117, 0, 1, 0.3294118, 1,
-0.2402183, -0.9619236, -3.460228, 0, 1, 0.3333333, 1,
-0.2392433, -0.02279061, -1.610904, 0, 1, 0.3411765, 1,
-0.233662, 0.2047389, -1.908253, 0, 1, 0.345098, 1,
-0.2276592, -0.1720578, -2.405245, 0, 1, 0.3529412, 1,
-0.2206291, -0.4057881, -2.944005, 0, 1, 0.3568628, 1,
-0.2160842, 0.2813378, -0.05441894, 0, 1, 0.3647059, 1,
-0.211944, -0.8770947, -3.028656, 0, 1, 0.3686275, 1,
-0.2111824, -0.0412071, -1.078866, 0, 1, 0.3764706, 1,
-0.2064484, -0.7809154, -2.468236, 0, 1, 0.3803922, 1,
-0.1999744, 0.2564801, 0.9816854, 0, 1, 0.3882353, 1,
-0.1996094, 0.3851847, -1.091431, 0, 1, 0.3921569, 1,
-0.1977956, 0.2913329, -0.2110529, 0, 1, 0.4, 1,
-0.1961642, 1.139937, -2.110557, 0, 1, 0.4078431, 1,
-0.1932635, -1.275275, -4.645656, 0, 1, 0.4117647, 1,
-0.193027, -0.5117949, -3.046538, 0, 1, 0.4196078, 1,
-0.1924488, -0.2189061, -0.810297, 0, 1, 0.4235294, 1,
-0.186376, -0.07189728, -3.395185, 0, 1, 0.4313726, 1,
-0.1839795, 0.2286501, 0.5292954, 0, 1, 0.4352941, 1,
-0.1838235, 0.0567503, -1.285825, 0, 1, 0.4431373, 1,
-0.1806759, 0.1571123, -3.032243, 0, 1, 0.4470588, 1,
-0.180121, 0.370139, 0.04946592, 0, 1, 0.454902, 1,
-0.1794364, 0.2375206, 0.2175745, 0, 1, 0.4588235, 1,
-0.1753803, -0.6753574, -2.571078, 0, 1, 0.4666667, 1,
-0.1734671, -1.905581, -2.806887, 0, 1, 0.4705882, 1,
-0.1726429, -0.333553, -4.986223, 0, 1, 0.4784314, 1,
-0.1702787, -0.8327777, -2.869025, 0, 1, 0.4823529, 1,
-0.164682, -0.6800796, -3.40257, 0, 1, 0.4901961, 1,
-0.1598604, 0.708773, -1.360677, 0, 1, 0.4941176, 1,
-0.1576926, -1.184814, -3.598284, 0, 1, 0.5019608, 1,
-0.1540293, 1.793123, 1.237636, 0, 1, 0.509804, 1,
-0.1360361, 1.864759, -0.9639765, 0, 1, 0.5137255, 1,
-0.1245095, -0.4172714, -2.881779, 0, 1, 0.5215687, 1,
-0.1185198, -1.194909, -2.393898, 0, 1, 0.5254902, 1,
-0.1178434, 0.8729609, 2.134794, 0, 1, 0.5333334, 1,
-0.1162567, 0.3298612, -0.4627935, 0, 1, 0.5372549, 1,
-0.1157834, 0.1425074, -0.5585564, 0, 1, 0.5450981, 1,
-0.1146903, -0.1885397, -2.741485, 0, 1, 0.5490196, 1,
-0.1113136, -0.1945607, -3.41132, 0, 1, 0.5568628, 1,
-0.1101694, 1.043794, -0.6363623, 0, 1, 0.5607843, 1,
-0.1063489, -1.602837, -2.937673, 0, 1, 0.5686275, 1,
-0.1052996, 0.3215908, 0.292383, 0, 1, 0.572549, 1,
-0.1025529, 0.324654, -0.8571465, 0, 1, 0.5803922, 1,
-0.09527802, -0.3124562, -2.790087, 0, 1, 0.5843138, 1,
-0.09510943, -0.3624904, -3.231169, 0, 1, 0.5921569, 1,
-0.09159391, 0.07984486, -2.400102, 0, 1, 0.5960785, 1,
-0.07994621, 1.943595, -0.4146346, 0, 1, 0.6039216, 1,
-0.07615525, 0.9554981, 0.3321936, 0, 1, 0.6117647, 1,
-0.07262506, 3.040544, 0.5239043, 0, 1, 0.6156863, 1,
-0.07060253, -1.230008, -0.2816892, 0, 1, 0.6235294, 1,
-0.06992213, 0.9535723, 0.1811567, 0, 1, 0.627451, 1,
-0.06779905, -0.5611717, -3.809348, 0, 1, 0.6352941, 1,
-0.06529121, -0.4442145, -1.9811, 0, 1, 0.6392157, 1,
-0.06456287, 0.4241156, -0.3258015, 0, 1, 0.6470588, 1,
-0.06393003, -0.266015, -1.800159, 0, 1, 0.6509804, 1,
-0.06379664, -1.88295, -3.521209, 0, 1, 0.6588235, 1,
-0.06346645, -1.153614, -3.510449, 0, 1, 0.6627451, 1,
-0.06171223, 0.446659, 0.3506291, 0, 1, 0.6705883, 1,
-0.06133349, 0.1260888, -0.8284089, 0, 1, 0.6745098, 1,
-0.05048329, 0.123272, 0.05229589, 0, 1, 0.682353, 1,
-0.03978813, -0.6397243, -2.495334, 0, 1, 0.6862745, 1,
-0.03754771, -1.792922, -2.921022, 0, 1, 0.6941177, 1,
-0.03658635, -0.2544279, -3.299819, 0, 1, 0.7019608, 1,
-0.03506259, 0.4602434, -0.8420181, 0, 1, 0.7058824, 1,
-0.03460513, -0.3410074, -3.953411, 0, 1, 0.7137255, 1,
-0.02999577, -0.176275, -0.3848453, 0, 1, 0.7176471, 1,
-0.02958339, -1.580074, -3.424786, 0, 1, 0.7254902, 1,
-0.01645088, 0.8436225, 0.1020079, 0, 1, 0.7294118, 1,
-0.01595509, 1.627163, 1.033929, 0, 1, 0.7372549, 1,
-0.01500029, 0.6907962, -0.391641, 0, 1, 0.7411765, 1,
-0.01400059, -0.0223395, -2.22906, 0, 1, 0.7490196, 1,
-0.01358771, -0.395553, -2.378517, 0, 1, 0.7529412, 1,
-0.01278671, 0.4386468, 0.3585114, 0, 1, 0.7607843, 1,
-0.01247986, -0.2022617, -4.337011, 0, 1, 0.7647059, 1,
-0.01070379, 1.520882, -0.5898799, 0, 1, 0.772549, 1,
-0.00931935, 1.224547, 0.1671286, 0, 1, 0.7764706, 1,
-0.006413107, 1.658097, -0.2284994, 0, 1, 0.7843137, 1,
-0.006398939, 0.6864809, -0.2244479, 0, 1, 0.7882353, 1,
-0.005831938, -0.2973537, -1.508079, 0, 1, 0.7960784, 1,
-0.003216453, -1.138494, -1.447084, 0, 1, 0.8039216, 1,
-0.003006737, 0.93699, 0.3875541, 0, 1, 0.8078431, 1,
-0.001761645, -1.055188, -2.439296, 0, 1, 0.8156863, 1,
0.002477521, -0.49772, 3.394755, 0, 1, 0.8196079, 1,
0.007103075, -0.3014303, 3.672647, 0, 1, 0.827451, 1,
0.01335092, -0.6415351, 1.341778, 0, 1, 0.8313726, 1,
0.0176154, -1.40246, 3.837791, 0, 1, 0.8392157, 1,
0.0202211, 0.9075972, -0.6026436, 0, 1, 0.8431373, 1,
0.02058909, -1.659398, 1.455978, 0, 1, 0.8509804, 1,
0.02578366, -0.9521676, 2.400477, 0, 1, 0.854902, 1,
0.02648297, -2.160777, 3.285693, 0, 1, 0.8627451, 1,
0.02674013, 1.077274, 1.360895, 0, 1, 0.8666667, 1,
0.02675543, 1.374901, 0.2301402, 0, 1, 0.8745098, 1,
0.02866583, -0.3957764, 2.419506, 0, 1, 0.8784314, 1,
0.02908037, -0.6412353, 2.611501, 0, 1, 0.8862745, 1,
0.0293998, 0.5036387, -0.9484145, 0, 1, 0.8901961, 1,
0.0319435, -0.8860364, 0.6396266, 0, 1, 0.8980392, 1,
0.03248798, 0.584941, 0.1157395, 0, 1, 0.9058824, 1,
0.03467055, -0.01393986, 2.94124, 0, 1, 0.9098039, 1,
0.03978652, 0.6437694, 1.527924, 0, 1, 0.9176471, 1,
0.04228053, 1.550457, -3.027724, 0, 1, 0.9215686, 1,
0.04275189, -2.73355, 4.808553, 0, 1, 0.9294118, 1,
0.04596588, -2.77682, 3.697636, 0, 1, 0.9333333, 1,
0.0506006, -0.5069211, 2.715806, 0, 1, 0.9411765, 1,
0.0528359, 1.334185, -1.239851, 0, 1, 0.945098, 1,
0.0528413, -0.6757897, 2.391682, 0, 1, 0.9529412, 1,
0.05841814, 1.326056, 0.5026745, 0, 1, 0.9568627, 1,
0.06227148, 0.1351971, -0.7282752, 0, 1, 0.9647059, 1,
0.06258784, 0.6914114, 0.3482486, 0, 1, 0.9686275, 1,
0.0693933, 1.724191, 1.20013, 0, 1, 0.9764706, 1,
0.07061071, -2.359984, 3.293734, 0, 1, 0.9803922, 1,
0.07112486, 1.483795, -0.3207978, 0, 1, 0.9882353, 1,
0.07277449, 0.9863574, 0.8614165, 0, 1, 0.9921569, 1,
0.07677995, -1.7235, 4.609756, 0, 1, 1, 1,
0.08117996, -0.8171524, 2.659005, 0, 0.9921569, 1, 1,
0.08312473, 0.7983185, 0.9238223, 0, 0.9882353, 1, 1,
0.08501415, 0.6567162, 0.06321788, 0, 0.9803922, 1, 1,
0.0890223, 0.1118952, 1.34497, 0, 0.9764706, 1, 1,
0.08917443, 0.5152516, -0.8622805, 0, 0.9686275, 1, 1,
0.09731486, 0.6114687, -0.04333083, 0, 0.9647059, 1, 1,
0.1007, 1.200542, -0.01475724, 0, 0.9568627, 1, 1,
0.1037207, 1.003489, 1.451149, 0, 0.9529412, 1, 1,
0.1044402, 1.339216, 0.04213778, 0, 0.945098, 1, 1,
0.1056092, -1.232927, 2.93994, 0, 0.9411765, 1, 1,
0.1082384, 1.094903, 0.5999631, 0, 0.9333333, 1, 1,
0.11203, 0.2267265, -0.3741428, 0, 0.9294118, 1, 1,
0.1138432, 0.9124117, 0.7362839, 0, 0.9215686, 1, 1,
0.1145571, -1.641594, 3.385233, 0, 0.9176471, 1, 1,
0.1164751, 0.4266211, 0.7017398, 0, 0.9098039, 1, 1,
0.1175971, -1.661047, 1.811693, 0, 0.9058824, 1, 1,
0.1183131, 1.532524, 0.3957306, 0, 0.8980392, 1, 1,
0.1206955, -0.03483452, 4.255488, 0, 0.8901961, 1, 1,
0.1212218, -1.145468, 2.128338, 0, 0.8862745, 1, 1,
0.1273272, 0.1137976, 1.088739, 0, 0.8784314, 1, 1,
0.1455982, 1.686108, 0.7373052, 0, 0.8745098, 1, 1,
0.1475647, -0.6051769, 2.927068, 0, 0.8666667, 1, 1,
0.1582711, 1.558731, -1.356842, 0, 0.8627451, 1, 1,
0.1587067, 0.2213175, -1.142, 0, 0.854902, 1, 1,
0.1644093, -1.00795, 3.513327, 0, 0.8509804, 1, 1,
0.1672051, 0.5975701, 0.09595525, 0, 0.8431373, 1, 1,
0.1750424, 1.305506, 1.293301, 0, 0.8392157, 1, 1,
0.1758286, 1.157532, 1.622942, 0, 0.8313726, 1, 1,
0.1762658, -0.4256512, 2.206416, 0, 0.827451, 1, 1,
0.1763557, 0.4063863, 0.4883986, 0, 0.8196079, 1, 1,
0.1764661, 1.046655, 0.7529946, 0, 0.8156863, 1, 1,
0.1777795, -0.4609351, 1.491678, 0, 0.8078431, 1, 1,
0.1813243, -0.5636604, 0.06231378, 0, 0.8039216, 1, 1,
0.1839565, 0.7488094, 0.7437772, 0, 0.7960784, 1, 1,
0.1855267, 1.652957, 0.07463599, 0, 0.7882353, 1, 1,
0.1885651, -0.1279316, 2.792335, 0, 0.7843137, 1, 1,
0.1922808, 0.6619825, 2.314347, 0, 0.7764706, 1, 1,
0.1986585, 0.8700485, -0.9164848, 0, 0.772549, 1, 1,
0.2072269, -0.1201077, 1.969692, 0, 0.7647059, 1, 1,
0.2080857, 1.683533, -1.73829, 0, 0.7607843, 1, 1,
0.2091739, 2.300287, 0.7661166, 0, 0.7529412, 1, 1,
0.2098462, -1.170217, 2.775187, 0, 0.7490196, 1, 1,
0.2105353, -0.6809449, 3.181523, 0, 0.7411765, 1, 1,
0.2113786, -0.3409206, 0.9539984, 0, 0.7372549, 1, 1,
0.2115438, 2.583784, 0.3801448, 0, 0.7294118, 1, 1,
0.2133344, -0.1500453, 2.252288, 0, 0.7254902, 1, 1,
0.2134351, -0.8714448, 3.350073, 0, 0.7176471, 1, 1,
0.216461, -1.694881, 2.821863, 0, 0.7137255, 1, 1,
0.218508, -0.5396715, 4.086144, 0, 0.7058824, 1, 1,
0.2220883, -0.4406868, 1.796238, 0, 0.6980392, 1, 1,
0.225684, 1.018767, 0.1575195, 0, 0.6941177, 1, 1,
0.2315507, -1.765055, 2.411683, 0, 0.6862745, 1, 1,
0.2359945, -0.0099214, 0.07713393, 0, 0.682353, 1, 1,
0.2360678, 0.2417569, 0.687182, 0, 0.6745098, 1, 1,
0.2366717, 1.1364, 0.6131042, 0, 0.6705883, 1, 1,
0.2368999, 1.01247, -0.1638657, 0, 0.6627451, 1, 1,
0.2369098, -1.807211, 2.363897, 0, 0.6588235, 1, 1,
0.2370562, -1.164058, 2.116695, 0, 0.6509804, 1, 1,
0.2421682, 1.130627, 0.6660771, 0, 0.6470588, 1, 1,
0.2438573, 0.002017766, -0.1612138, 0, 0.6392157, 1, 1,
0.2471683, 0.1025519, 1.643628, 0, 0.6352941, 1, 1,
0.2496696, 0.9088991, 0.2187091, 0, 0.627451, 1, 1,
0.2501546, -1.859611, 2.79322, 0, 0.6235294, 1, 1,
0.2524361, -1.841998, 3.460938, 0, 0.6156863, 1, 1,
0.2602613, 1.4467, 1.004612, 0, 0.6117647, 1, 1,
0.2654316, -1.290329, 1.632167, 0, 0.6039216, 1, 1,
0.2663378, 1.724343, 0.1713794, 0, 0.5960785, 1, 1,
0.2675858, -1.282114, 2.829261, 0, 0.5921569, 1, 1,
0.2678318, 0.3368168, 0.8559752, 0, 0.5843138, 1, 1,
0.2757138, -0.1135872, 2.464561, 0, 0.5803922, 1, 1,
0.2780686, 0.137005, 1.060245, 0, 0.572549, 1, 1,
0.2799451, -0.2587168, 2.035107, 0, 0.5686275, 1, 1,
0.2824352, -0.562884, 2.610728, 0, 0.5607843, 1, 1,
0.2883718, 0.3517427, 2.591459, 0, 0.5568628, 1, 1,
0.2896288, 0.633986, -0.5615035, 0, 0.5490196, 1, 1,
0.2947165, 0.803288, 1.355422, 0, 0.5450981, 1, 1,
0.2960997, -0.8454643, 2.40623, 0, 0.5372549, 1, 1,
0.3003194, -1.111308, 4.831393, 0, 0.5333334, 1, 1,
0.3042809, -1.329968, 3.885384, 0, 0.5254902, 1, 1,
0.304578, -0.004499636, 2.373708, 0, 0.5215687, 1, 1,
0.3054238, -0.6108609, 1.034296, 0, 0.5137255, 1, 1,
0.3064134, 2.265285, -1.329164, 0, 0.509804, 1, 1,
0.3084847, 0.6247845, 0.7609149, 0, 0.5019608, 1, 1,
0.3093404, 1.872666, 1.045255, 0, 0.4941176, 1, 1,
0.3123601, -1.298826, 3.787411, 0, 0.4901961, 1, 1,
0.3124012, -0.8914308, 2.648998, 0, 0.4823529, 1, 1,
0.3134537, -0.188932, 3.116879, 0, 0.4784314, 1, 1,
0.3159916, 1.266044, -0.4243723, 0, 0.4705882, 1, 1,
0.3168743, 0.2827856, 1.420219, 0, 0.4666667, 1, 1,
0.3245965, -1.049044, 0.9167407, 0, 0.4588235, 1, 1,
0.3256778, 2.463821, -0.07417388, 0, 0.454902, 1, 1,
0.3263171, 0.1978808, 0.6229944, 0, 0.4470588, 1, 1,
0.3303568, 0.2324847, 1.159983, 0, 0.4431373, 1, 1,
0.3342611, 1.841621, 1.739968, 0, 0.4352941, 1, 1,
0.3347863, 0.2919633, 2.095899, 0, 0.4313726, 1, 1,
0.335363, 0.7057625, 1.20485, 0, 0.4235294, 1, 1,
0.3365918, -0.579038, 3.10264, 0, 0.4196078, 1, 1,
0.3366897, 0.1444074, 2.066963, 0, 0.4117647, 1, 1,
0.3388883, 0.2275658, 0.9116957, 0, 0.4078431, 1, 1,
0.34097, -0.6237887, 0.737473, 0, 0.4, 1, 1,
0.3466328, -1.941166, 3.217733, 0, 0.3921569, 1, 1,
0.3479839, -1.691125, 3.585366, 0, 0.3882353, 1, 1,
0.3480844, -0.2308146, 3.741438, 0, 0.3803922, 1, 1,
0.3480845, -1.729887, 3.456927, 0, 0.3764706, 1, 1,
0.3492352, 1.36422, -0.2677363, 0, 0.3686275, 1, 1,
0.3534934, -1.301152, 3.658705, 0, 0.3647059, 1, 1,
0.3535508, -0.3955999, 1.624037, 0, 0.3568628, 1, 1,
0.3538154, 0.2273281, 0.6876317, 0, 0.3529412, 1, 1,
0.3554888, -1.564541, 2.456347, 0, 0.345098, 1, 1,
0.3576542, -0.2216602, 1.778509, 0, 0.3411765, 1, 1,
0.3660098, 1.342915, -0.5200834, 0, 0.3333333, 1, 1,
0.3798812, -0.1979356, 1.443718, 0, 0.3294118, 1, 1,
0.3824712, -0.6982557, 3.095511, 0, 0.3215686, 1, 1,
0.3932119, -0.8702765, 4.171046, 0, 0.3176471, 1, 1,
0.3946125, -0.1649594, 1.803581, 0, 0.3098039, 1, 1,
0.4024336, 1.211915, 0.3889945, 0, 0.3058824, 1, 1,
0.403165, 1.594208, 0.4952369, 0, 0.2980392, 1, 1,
0.4032549, -0.9135351, 4.060548, 0, 0.2901961, 1, 1,
0.4098213, 0.4660476, 1.092113, 0, 0.2862745, 1, 1,
0.4138547, -0.8910912, 1.447107, 0, 0.2784314, 1, 1,
0.4172487, -0.791876, 2.381552, 0, 0.2745098, 1, 1,
0.4211486, 1.92354, 0.3587748, 0, 0.2666667, 1, 1,
0.4238337, 0.7098714, 2.004827, 0, 0.2627451, 1, 1,
0.4244069, -1.59246, 3.72528, 0, 0.254902, 1, 1,
0.4257662, -0.5006372, 1.515395, 0, 0.2509804, 1, 1,
0.4296643, -0.1528022, 3.386906, 0, 0.2431373, 1, 1,
0.429899, -0.7913612, 2.011911, 0, 0.2392157, 1, 1,
0.4306002, -0.643968, 3.419468, 0, 0.2313726, 1, 1,
0.4391195, 0.06730168, 1.43577, 0, 0.227451, 1, 1,
0.4429863, -1.94285, 4.462644, 0, 0.2196078, 1, 1,
0.4436812, -1.008364, 4.270077, 0, 0.2156863, 1, 1,
0.4440368, 1.444025, 0.854156, 0, 0.2078431, 1, 1,
0.4455592, 0.7694615, 1.022071, 0, 0.2039216, 1, 1,
0.4462874, 1.217159, 0.06209232, 0, 0.1960784, 1, 1,
0.4513281, -0.4891171, 2.071339, 0, 0.1882353, 1, 1,
0.4579539, 0.9505525, 0.2747922, 0, 0.1843137, 1, 1,
0.4593664, 0.3541864, -0.2957117, 0, 0.1764706, 1, 1,
0.4596918, 1.705077, 1.058049, 0, 0.172549, 1, 1,
0.4616616, -0.729962, 2.266858, 0, 0.1647059, 1, 1,
0.4701856, -1.048838, 2.775376, 0, 0.1607843, 1, 1,
0.4708807, -1.156615, 3.158655, 0, 0.1529412, 1, 1,
0.4735531, -0.2249458, 2.012592, 0, 0.1490196, 1, 1,
0.476039, -0.7784187, 3.784352, 0, 0.1411765, 1, 1,
0.4825867, 0.3955146, 1.53327, 0, 0.1372549, 1, 1,
0.4927923, 1.258104, 0.01552881, 0, 0.1294118, 1, 1,
0.4932627, 1.148899, 1.235338, 0, 0.1254902, 1, 1,
0.4942579, 0.7910464, 0.2840534, 0, 0.1176471, 1, 1,
0.4961537, -1.026094, 1.656478, 0, 0.1137255, 1, 1,
0.5004092, 2.111501, 0.9911232, 0, 0.1058824, 1, 1,
0.5025132, 0.4292569, 0.2907704, 0, 0.09803922, 1, 1,
0.50573, -0.1385336, 1.274252, 0, 0.09411765, 1, 1,
0.505932, -1.656665, 3.846584, 0, 0.08627451, 1, 1,
0.506466, -0.8750325, 3.062626, 0, 0.08235294, 1, 1,
0.5067576, -1.547743, 4.103243, 0, 0.07450981, 1, 1,
0.5094227, -0.6713396, 1.653906, 0, 0.07058824, 1, 1,
0.5100559, 0.4160291, 2.447243, 0, 0.0627451, 1, 1,
0.5101562, -1.126871, 1.907419, 0, 0.05882353, 1, 1,
0.5101781, -0.3923742, 2.813531, 0, 0.05098039, 1, 1,
0.5128108, -1.623384, 2.11328, 0, 0.04705882, 1, 1,
0.5146523, 0.3540669, 1.617007, 0, 0.03921569, 1, 1,
0.5200937, -1.83904, 0.9005808, 0, 0.03529412, 1, 1,
0.5282655, -1.672104, 1.240346, 0, 0.02745098, 1, 1,
0.5333784, -0.8561767, 3.437495, 0, 0.02352941, 1, 1,
0.5370052, 0.2345084, 0.349783, 0, 0.01568628, 1, 1,
0.5374308, -1.384398, 2.604545, 0, 0.01176471, 1, 1,
0.5382199, -0.5593861, 0.8495286, 0, 0.003921569, 1, 1,
0.5404794, 0.1646465, 2.241287, 0.003921569, 0, 1, 1,
0.5435835, -1.249317, 1.766524, 0.007843138, 0, 1, 1,
0.54561, -0.6689348, 1.813631, 0.01568628, 0, 1, 1,
0.5535862, -0.4513785, 2.210405, 0.01960784, 0, 1, 1,
0.5539325, -1.47136, 2.682953, 0.02745098, 0, 1, 1,
0.5569896, -0.5847959, 1.79145, 0.03137255, 0, 1, 1,
0.5604495, -0.9012194, 3.312547, 0.03921569, 0, 1, 1,
0.5608028, -0.9366024, 3.067255, 0.04313726, 0, 1, 1,
0.5614854, 0.2389714, 1.015592, 0.05098039, 0, 1, 1,
0.5631788, 1.723128, 0.5620516, 0.05490196, 0, 1, 1,
0.5641384, -0.2813847, 2.548685, 0.0627451, 0, 1, 1,
0.5656904, 0.1897731, 0.5941822, 0.06666667, 0, 1, 1,
0.5682174, 1.80232, 1.612926, 0.07450981, 0, 1, 1,
0.568639, 0.9032271, 1.844907, 0.07843138, 0, 1, 1,
0.5705435, -1.120667, 2.193972, 0.08627451, 0, 1, 1,
0.5712575, -0.1685028, -0.5161307, 0.09019608, 0, 1, 1,
0.5715284, -0.6035451, 2.991411, 0.09803922, 0, 1, 1,
0.5735254, 0.5860516, 2.440178, 0.1058824, 0, 1, 1,
0.5754284, 1.410272, 0.8445091, 0.1098039, 0, 1, 1,
0.5806687, -0.5680471, 1.832593, 0.1176471, 0, 1, 1,
0.5817304, -0.09832275, 1.872006, 0.1215686, 0, 1, 1,
0.5854478, -0.6836113, 4.620959, 0.1294118, 0, 1, 1,
0.5858836, -0.4989763, 0.5778347, 0.1333333, 0, 1, 1,
0.5882871, -0.2055733, 3.073524, 0.1411765, 0, 1, 1,
0.5927117, 0.02851533, 1.083482, 0.145098, 0, 1, 1,
0.5996942, 0.9428964, 0.4147063, 0.1529412, 0, 1, 1,
0.6015149, -1.005536, 1.599743, 0.1568628, 0, 1, 1,
0.602342, 0.4835037, 1.516691, 0.1647059, 0, 1, 1,
0.6075369, -0.2381875, 2.051847, 0.1686275, 0, 1, 1,
0.6111463, 0.5815788, 0.3777368, 0.1764706, 0, 1, 1,
0.6123764, 0.7431031, 0.4710551, 0.1803922, 0, 1, 1,
0.6147934, 0.3536582, 3.075874, 0.1882353, 0, 1, 1,
0.6158388, 0.3694826, 0.1662926, 0.1921569, 0, 1, 1,
0.6187127, 2.591275, -0.617101, 0.2, 0, 1, 1,
0.6277369, 0.08367445, 0.136087, 0.2078431, 0, 1, 1,
0.6281423, 0.7641115, 0.6298251, 0.2117647, 0, 1, 1,
0.6293052, 0.2192641, 0.8961859, 0.2196078, 0, 1, 1,
0.6357484, -0.04882469, 3.25857, 0.2235294, 0, 1, 1,
0.6365311, 1.427932, -0.315653, 0.2313726, 0, 1, 1,
0.6373623, -0.9766315, 3.178549, 0.2352941, 0, 1, 1,
0.6392226, 1.307115, 0.04040733, 0.2431373, 0, 1, 1,
0.6429368, -1.502, 1.19741, 0.2470588, 0, 1, 1,
0.6473065, -1.131706, 4.050191, 0.254902, 0, 1, 1,
0.6546037, -1.374729, 3.248233, 0.2588235, 0, 1, 1,
0.6567161, -0.3354008, 2.11243, 0.2666667, 0, 1, 1,
0.6568674, 1.232188, 0.14602, 0.2705882, 0, 1, 1,
0.6598026, -0.3643308, 3.527433, 0.2784314, 0, 1, 1,
0.6681275, -0.7996994, 3.819851, 0.282353, 0, 1, 1,
0.6744865, -0.3464108, 1.405738, 0.2901961, 0, 1, 1,
0.6764312, -1.061497, 1.368712, 0.2941177, 0, 1, 1,
0.6787967, 0.1417126, 0.9379243, 0.3019608, 0, 1, 1,
0.6915626, -0.9351607, 2.31275, 0.3098039, 0, 1, 1,
0.6938314, -0.1247449, 2.061958, 0.3137255, 0, 1, 1,
0.7015461, 0.6754054, 2.367238, 0.3215686, 0, 1, 1,
0.7068862, 0.5815434, 0.9030765, 0.3254902, 0, 1, 1,
0.7083223, 0.9241366, 2.184231, 0.3333333, 0, 1, 1,
0.7092057, -0.9551441, 1.746957, 0.3372549, 0, 1, 1,
0.7125919, -1.819898, 1.864812, 0.345098, 0, 1, 1,
0.7130896, 2.147805, 0.2528516, 0.3490196, 0, 1, 1,
0.7136415, 3.571099, -0.4214719, 0.3568628, 0, 1, 1,
0.7143365, 0.3151115, 1.346521, 0.3607843, 0, 1, 1,
0.7180325, 0.6467942, 0.2599886, 0.3686275, 0, 1, 1,
0.7217125, -0.8945709, 2.418757, 0.372549, 0, 1, 1,
0.7238919, 0.1967723, 1.938049, 0.3803922, 0, 1, 1,
0.7240334, -0.007130639, 1.855765, 0.3843137, 0, 1, 1,
0.7245872, 0.6209551, 0.06304346, 0.3921569, 0, 1, 1,
0.7253031, 0.5116094, 1.355567, 0.3960784, 0, 1, 1,
0.7280604, -0.4227802, 1.382972, 0.4039216, 0, 1, 1,
0.7303125, -0.7052354, 1.003762, 0.4117647, 0, 1, 1,
0.7309044, 0.3490094, -0.01952373, 0.4156863, 0, 1, 1,
0.7335492, -0.6911595, 3.412025, 0.4235294, 0, 1, 1,
0.7336499, -0.5745249, 2.777977, 0.427451, 0, 1, 1,
0.7402072, 1.91667, 0.5190228, 0.4352941, 0, 1, 1,
0.7409613, 2.062007, 0.7947168, 0.4392157, 0, 1, 1,
0.7410566, 1.415002, 0.7688041, 0.4470588, 0, 1, 1,
0.7473155, 2.226439, 0.6176704, 0.4509804, 0, 1, 1,
0.7473159, -0.5456934, 1.352695, 0.4588235, 0, 1, 1,
0.7528683, 0.1193802, -0.2136963, 0.4627451, 0, 1, 1,
0.7566981, -0.1650897, 2.890435, 0.4705882, 0, 1, 1,
0.758953, 0.9024839, -0.3678332, 0.4745098, 0, 1, 1,
0.7640118, -0.2336324, 0.3435202, 0.4823529, 0, 1, 1,
0.7685528, 0.9830534, 0.8783375, 0.4862745, 0, 1, 1,
0.7741831, 0.2610111, 2.617485, 0.4941176, 0, 1, 1,
0.7805164, -2.62646, 3.0421, 0.5019608, 0, 1, 1,
0.7836721, -0.8668678, 3.278924, 0.5058824, 0, 1, 1,
0.7854763, -0.3166183, 1.481587, 0.5137255, 0, 1, 1,
0.7896903, -0.6146449, 0.7305549, 0.5176471, 0, 1, 1,
0.7936024, -1.46874, 3.743656, 0.5254902, 0, 1, 1,
0.7980399, -1.030954, 1.85745, 0.5294118, 0, 1, 1,
0.7991281, 0.3315857, 1.752079, 0.5372549, 0, 1, 1,
0.8187628, -1.096502, 2.70684, 0.5411765, 0, 1, 1,
0.820525, -1.678965, 1.714335, 0.5490196, 0, 1, 1,
0.8251123, -0.6266845, 3.771691, 0.5529412, 0, 1, 1,
0.8272004, 0.1084668, 0.9558899, 0.5607843, 0, 1, 1,
0.8306925, 1.80915, 0.2902674, 0.5647059, 0, 1, 1,
0.8314797, -1.512051, 2.654545, 0.572549, 0, 1, 1,
0.8324564, -1.38891, 1.964429, 0.5764706, 0, 1, 1,
0.8453683, 1.115621, -0.7373708, 0.5843138, 0, 1, 1,
0.8507732, 0.4561738, 1.936873, 0.5882353, 0, 1, 1,
0.8538043, -0.3039712, 2.198877, 0.5960785, 0, 1, 1,
0.8556468, -0.6109568, 1.485047, 0.6039216, 0, 1, 1,
0.8562432, -0.5989575, 1.583435, 0.6078432, 0, 1, 1,
0.8568492, 0.8792182, -0.05898936, 0.6156863, 0, 1, 1,
0.8605759, 0.6524922, 1.337927, 0.6196079, 0, 1, 1,
0.8609353, -0.7333501, 2.156568, 0.627451, 0, 1, 1,
0.8647012, 0.1450378, 1.007448, 0.6313726, 0, 1, 1,
0.8651727, 0.7414287, 0.7437511, 0.6392157, 0, 1, 1,
0.8656121, 0.9714131, 1.585388, 0.6431373, 0, 1, 1,
0.872552, -0.4628726, 2.701273, 0.6509804, 0, 1, 1,
0.8788348, -0.6800572, 2.319816, 0.654902, 0, 1, 1,
0.8797116, -0.5171139, 4.619884, 0.6627451, 0, 1, 1,
0.8817164, 0.4481409, 1.848787, 0.6666667, 0, 1, 1,
0.8817844, -0.97418, 3.399825, 0.6745098, 0, 1, 1,
0.883405, -0.7277111, 1.766837, 0.6784314, 0, 1, 1,
0.8875282, -0.2483941, 1.775431, 0.6862745, 0, 1, 1,
0.8923625, -0.4164475, 1.18763, 0.6901961, 0, 1, 1,
0.8939934, 0.028817, 1.035281, 0.6980392, 0, 1, 1,
0.8958482, -0.3451628, 3.35223, 0.7058824, 0, 1, 1,
0.8974708, -0.3187267, 3.045716, 0.7098039, 0, 1, 1,
0.9003752, 2.036243, 0.9084713, 0.7176471, 0, 1, 1,
0.9045442, -0.3825356, 1.948889, 0.7215686, 0, 1, 1,
0.908455, -0.6670415, 2.62326, 0.7294118, 0, 1, 1,
0.9100129, -0.4092294, 4.244301, 0.7333333, 0, 1, 1,
0.9106649, 1.606616, 0.4688716, 0.7411765, 0, 1, 1,
0.9164214, -1.684264, 1.892304, 0.7450981, 0, 1, 1,
0.9176952, -1.037152, 2.911511, 0.7529412, 0, 1, 1,
0.9229709, 1.386298, -0.3871452, 0.7568628, 0, 1, 1,
0.924832, 0.41667, 0.6787972, 0.7647059, 0, 1, 1,
0.9422909, -0.03375864, 2.615719, 0.7686275, 0, 1, 1,
0.9434859, -0.1470241, 1.573779, 0.7764706, 0, 1, 1,
0.9487746, 0.1653621, 1.637726, 0.7803922, 0, 1, 1,
0.9506958, -0.5691636, 2.030991, 0.7882353, 0, 1, 1,
0.9545852, -0.192704, 0.1336558, 0.7921569, 0, 1, 1,
0.9547703, -0.04519232, 1.127774, 0.8, 0, 1, 1,
0.9583853, 1.856715, 0.6788172, 0.8078431, 0, 1, 1,
0.9583876, -0.7664805, 4.210246, 0.8117647, 0, 1, 1,
0.9615125, -0.4967966, 1.142282, 0.8196079, 0, 1, 1,
0.9621145, 0.05158323, 1.846482, 0.8235294, 0, 1, 1,
0.962576, 0.5456594, 1.390658, 0.8313726, 0, 1, 1,
0.9628046, 0.9765943, 0.3068639, 0.8352941, 0, 1, 1,
0.9639207, -0.682339, 2.681887, 0.8431373, 0, 1, 1,
0.968896, -0.4989249, 1.877126, 0.8470588, 0, 1, 1,
0.9690474, 1.272476, 0.05979601, 0.854902, 0, 1, 1,
0.9717005, -0.2467075, 1.541093, 0.8588235, 0, 1, 1,
0.9751656, -0.7829421, 1.903831, 0.8666667, 0, 1, 1,
0.9795882, -0.6279018, 1.147491, 0.8705882, 0, 1, 1,
0.9802746, 1.023443, 0.3283039, 0.8784314, 0, 1, 1,
0.9838135, -0.3280339, 1.177098, 0.8823529, 0, 1, 1,
0.986981, -0.8531904, 2.451935, 0.8901961, 0, 1, 1,
0.9881437, 0.1249065, 0.9145729, 0.8941177, 0, 1, 1,
0.9886526, -2.872909, 5.329996, 0.9019608, 0, 1, 1,
0.989144, -0.6936306, 2.181382, 0.9098039, 0, 1, 1,
0.9961551, -1.876503, 4.104574, 0.9137255, 0, 1, 1,
0.9962404, -0.4364997, 1.740544, 0.9215686, 0, 1, 1,
0.9967589, -0.5845015, 2.404043, 0.9254902, 0, 1, 1,
1.000872, -0.5562919, 1.79761, 0.9333333, 0, 1, 1,
1.002872, 0.04880675, 3.01418, 0.9372549, 0, 1, 1,
1.003114, 0.1524231, 2.247601, 0.945098, 0, 1, 1,
1.003275, -0.6409788, 0.5114883, 0.9490196, 0, 1, 1,
1.005635, -0.6623594, 0.5498908, 0.9568627, 0, 1, 1,
1.011683, 0.1398586, 0.6774315, 0.9607843, 0, 1, 1,
1.015164, 1.356356, 2.011297, 0.9686275, 0, 1, 1,
1.018404, -0.2476023, -0.4224934, 0.972549, 0, 1, 1,
1.018728, 0.7664757, -0.750437, 0.9803922, 0, 1, 1,
1.021214, 0.7986156, 0.7263373, 0.9843137, 0, 1, 1,
1.027435, -0.52516, 0.6149071, 0.9921569, 0, 1, 1,
1.029604, -1.152148, 1.196549, 0.9960784, 0, 1, 1,
1.03008, 0.3037738, 2.469416, 1, 0, 0.9960784, 1,
1.041159, 1.18219, 0.2873632, 1, 0, 0.9882353, 1,
1.045767, 0.6674947, 1.519521, 1, 0, 0.9843137, 1,
1.046259, -0.126402, 2.493103, 1, 0, 0.9764706, 1,
1.047382, 0.9122033, 0.1954815, 1, 0, 0.972549, 1,
1.051578, 1.46276, 1.651672, 1, 0, 0.9647059, 1,
1.058975, -2.481593, 2.901904, 1, 0, 0.9607843, 1,
1.05909, -0.3163266, 2.67956, 1, 0, 0.9529412, 1,
1.065688, 1.983334, -0.3945157, 1, 0, 0.9490196, 1,
1.069338, 1.472384, -0.2429937, 1, 0, 0.9411765, 1,
1.083939, -0.1664549, 1.701087, 1, 0, 0.9372549, 1,
1.087991, -1.050649, 0.546266, 1, 0, 0.9294118, 1,
1.088812, 0.2890905, 1.369273, 1, 0, 0.9254902, 1,
1.090391, -0.4302106, 1.882019, 1, 0, 0.9176471, 1,
1.095559, -1.857801, 2.047646, 1, 0, 0.9137255, 1,
1.106956, -0.3399915, 1.358998, 1, 0, 0.9058824, 1,
1.111445, -0.4442474, 2.764525, 1, 0, 0.9019608, 1,
1.114255, -0.7154946, 1.937759, 1, 0, 0.8941177, 1,
1.116199, -1.812039, 2.457201, 1, 0, 0.8862745, 1,
1.119892, 0.5518573, -0.6694403, 1, 0, 0.8823529, 1,
1.126509, 0.2637147, 1.47534, 1, 0, 0.8745098, 1,
1.128428, 1.34706, 0.5209773, 1, 0, 0.8705882, 1,
1.128766, 0.4877843, 0.5964489, 1, 0, 0.8627451, 1,
1.129762, 0.1280219, 0.4742273, 1, 0, 0.8588235, 1,
1.132238, -1.781025, 1.194475, 1, 0, 0.8509804, 1,
1.139836, -1.669435, 2.52796, 1, 0, 0.8470588, 1,
1.141885, -0.60496, 2.471413, 1, 0, 0.8392157, 1,
1.142909, -2.396683, 2.175097, 1, 0, 0.8352941, 1,
1.147236, 0.685936, 0.9947054, 1, 0, 0.827451, 1,
1.150533, 0.7021276, 0.404436, 1, 0, 0.8235294, 1,
1.152883, 1.189359, 1.130099, 1, 0, 0.8156863, 1,
1.161121, 0.2414294, 0.9856271, 1, 0, 0.8117647, 1,
1.172599, 1.373582, 0.9760512, 1, 0, 0.8039216, 1,
1.175337, -0.9287512, 3.852105, 1, 0, 0.7960784, 1,
1.17666, 1.955517, 1.78579, 1, 0, 0.7921569, 1,
1.189676, -0.1886701, 2.230757, 1, 0, 0.7843137, 1,
1.195724, 0.08933557, 2.129513, 1, 0, 0.7803922, 1,
1.196113, 1.222224, 0.8403933, 1, 0, 0.772549, 1,
1.199309, 0.4284123, 0.2069937, 1, 0, 0.7686275, 1,
1.202514, 0.2906995, 2.477694, 1, 0, 0.7607843, 1,
1.205402, -0.217254, 2.461105, 1, 0, 0.7568628, 1,
1.207944, 0.2793522, 1.500494, 1, 0, 0.7490196, 1,
1.224778, 1.748874, -1.196822, 1, 0, 0.7450981, 1,
1.226464, 1.034507, 0.1765611, 1, 0, 0.7372549, 1,
1.22974, 1.058965, -0.2087041, 1, 0, 0.7333333, 1,
1.233204, 0.3609169, 1.262929, 1, 0, 0.7254902, 1,
1.240123, 0.08528303, 1.517214, 1, 0, 0.7215686, 1,
1.24653, 0.3390311, 0.5678204, 1, 0, 0.7137255, 1,
1.249786, -1.331391, 2.881726, 1, 0, 0.7098039, 1,
1.250348, 0.1977767, 2.024512, 1, 0, 0.7019608, 1,
1.254408, 0.7943526, -0.7487255, 1, 0, 0.6941177, 1,
1.26113, -1.891007, 2.614156, 1, 0, 0.6901961, 1,
1.264521, -1.551745, 2.633959, 1, 0, 0.682353, 1,
1.265276, -0.4436429, 1.368572, 1, 0, 0.6784314, 1,
1.266301, 0.7110932, 2.049278, 1, 0, 0.6705883, 1,
1.266975, 1.074291, 1.902339, 1, 0, 0.6666667, 1,
1.292291, 0.1092904, 2.778884, 1, 0, 0.6588235, 1,
1.295629, 1.411431, 1.868678, 1, 0, 0.654902, 1,
1.296306, 1.258774, -0.5192108, 1, 0, 0.6470588, 1,
1.308871, -0.5247968, 1.808679, 1, 0, 0.6431373, 1,
1.324562, 0.3416374, 0.8694198, 1, 0, 0.6352941, 1,
1.325392, -0.01330159, 1.307675, 1, 0, 0.6313726, 1,
1.326278, -1.8088, 3.987864, 1, 0, 0.6235294, 1,
1.328107, -2.289846, 2.906398, 1, 0, 0.6196079, 1,
1.344263, 1.079001, 0.005310973, 1, 0, 0.6117647, 1,
1.35282, -1.375258, 0.8635902, 1, 0, 0.6078432, 1,
1.356606, -0.6909879, 0.1034934, 1, 0, 0.6, 1,
1.359618, 0.5962408, 0.4556459, 1, 0, 0.5921569, 1,
1.364843, 0.7944579, 1.442236, 1, 0, 0.5882353, 1,
1.371773, 0.1688186, 0.1671252, 1, 0, 0.5803922, 1,
1.372784, 0.9711083, -0.5186993, 1, 0, 0.5764706, 1,
1.376725, -0.1066802, 1.501117, 1, 0, 0.5686275, 1,
1.393384, -0.1383559, 0.661992, 1, 0, 0.5647059, 1,
1.396532, 0.6651847, 1.190088, 1, 0, 0.5568628, 1,
1.403612, -2.022861, 2.608841, 1, 0, 0.5529412, 1,
1.417536, 1.54618, -0.3199744, 1, 0, 0.5450981, 1,
1.422989, 1.114894, 1.065642, 1, 0, 0.5411765, 1,
1.429103, 2.589236, 0.9081039, 1, 0, 0.5333334, 1,
1.434014, -0.3245218, 0.3472035, 1, 0, 0.5294118, 1,
1.443003, -1.242683, 2.296871, 1, 0, 0.5215687, 1,
1.447447, 0.349649, 2.082036, 1, 0, 0.5176471, 1,
1.447969, -1.893528, 1.712763, 1, 0, 0.509804, 1,
1.454683, -0.007291569, 1.701578, 1, 0, 0.5058824, 1,
1.459247, -1.425362, 1.36356, 1, 0, 0.4980392, 1,
1.464046, -1.426412, 2.276677, 1, 0, 0.4901961, 1,
1.478134, 1.456796, 0.8416633, 1, 0, 0.4862745, 1,
1.479993, -0.3253973, 0.6835076, 1, 0, 0.4784314, 1,
1.481479, -0.6522006, 1.652646, 1, 0, 0.4745098, 1,
1.486907, -2.783849, 1.053097, 1, 0, 0.4666667, 1,
1.495132, -1.295343, 1.500381, 1, 0, 0.4627451, 1,
1.497076, 1.303965, 0.04741614, 1, 0, 0.454902, 1,
1.522299, -0.9886783, 1.074186, 1, 0, 0.4509804, 1,
1.544375, -1.221268, 2.57401, 1, 0, 0.4431373, 1,
1.545602, -2.111611, 2.296782, 1, 0, 0.4392157, 1,
1.548057, -0.5970061, 2.696057, 1, 0, 0.4313726, 1,
1.551789, 0.2712013, 2.821158, 1, 0, 0.427451, 1,
1.564263, 0.4435249, 2.87517, 1, 0, 0.4196078, 1,
1.588974, 0.6246153, 2.847858, 1, 0, 0.4156863, 1,
1.590496, 0.09393061, 0.999891, 1, 0, 0.4078431, 1,
1.594831, -0.3355834, 3.483772, 1, 0, 0.4039216, 1,
1.596845, 1.971884, -0.06627275, 1, 0, 0.3960784, 1,
1.61207, -0.3064877, 1.582128, 1, 0, 0.3882353, 1,
1.625289, 0.8148943, 1.427304, 1, 0, 0.3843137, 1,
1.648483, -1.294161, 4.243165, 1, 0, 0.3764706, 1,
1.649992, -1.974683, 1.734564, 1, 0, 0.372549, 1,
1.670756, 1.264589, 1.43462, 1, 0, 0.3647059, 1,
1.674229, 1.324392, -0.2304927, 1, 0, 0.3607843, 1,
1.67799, 1.292986, -0.5315382, 1, 0, 0.3529412, 1,
1.690753, 0.04194164, -0.4360601, 1, 0, 0.3490196, 1,
1.703695, -0.07450256, 4.462533, 1, 0, 0.3411765, 1,
1.705869, 1.572187, 0.3291595, 1, 0, 0.3372549, 1,
1.708752, -0.3618015, 0.8254067, 1, 0, 0.3294118, 1,
1.709351, -1.6119, 1.56713, 1, 0, 0.3254902, 1,
1.722327, -1.048825, 1.390354, 1, 0, 0.3176471, 1,
1.726964, 0.1558459, 0.1393185, 1, 0, 0.3137255, 1,
1.7451, -1.339228, 1.8467, 1, 0, 0.3058824, 1,
1.783674, -0.5164416, 1.716962, 1, 0, 0.2980392, 1,
1.792375, 0.4620468, 0.5394734, 1, 0, 0.2941177, 1,
1.796492, -0.003930909, 1.716897, 1, 0, 0.2862745, 1,
1.80529, -0.1514532, 2.255337, 1, 0, 0.282353, 1,
1.811679, -0.8147871, 1.66664, 1, 0, 0.2745098, 1,
1.816309, 0.04328876, 2.156163, 1, 0, 0.2705882, 1,
1.818647, 0.4510051, 0.8020724, 1, 0, 0.2627451, 1,
1.827012, 0.009412476, 2.522229, 1, 0, 0.2588235, 1,
1.830393, 0.8359486, 2.217134, 1, 0, 0.2509804, 1,
1.837319, 1.458277, -1.327492, 1, 0, 0.2470588, 1,
1.838368, 0.3312048, 1.416925, 1, 0, 0.2392157, 1,
1.843166, 1.404434, 1.187965, 1, 0, 0.2352941, 1,
1.870295, 0.6112127, 2.605599, 1, 0, 0.227451, 1,
1.914212, -1.708206, 4.748816, 1, 0, 0.2235294, 1,
1.94778, 0.934852, 0.4113173, 1, 0, 0.2156863, 1,
1.949468, -0.3094662, 1.877695, 1, 0, 0.2117647, 1,
1.960542, -0.1325167, 1.469503, 1, 0, 0.2039216, 1,
1.984579, 1.14186, 1.350749, 1, 0, 0.1960784, 1,
1.995854, 0.1095675, -0.3350332, 1, 0, 0.1921569, 1,
2.038591, -1.301801, 1.732476, 1, 0, 0.1843137, 1,
2.039419, 1.170659, 0.7191381, 1, 0, 0.1803922, 1,
2.07123, 0.1031419, 1.616645, 1, 0, 0.172549, 1,
2.071793, -1.751007, 1.529892, 1, 0, 0.1686275, 1,
2.08921, -1.005658, 2.971059, 1, 0, 0.1607843, 1,
2.09353, -0.2819817, 2.586806, 1, 0, 0.1568628, 1,
2.109265, 0.4267517, 1.628199, 1, 0, 0.1490196, 1,
2.129577, 0.2844204, 1.766603, 1, 0, 0.145098, 1,
2.137009, -0.4637825, 0.5907062, 1, 0, 0.1372549, 1,
2.138281, 0.7249307, 0.3084296, 1, 0, 0.1333333, 1,
2.168775, -0.1140158, 2.878422, 1, 0, 0.1254902, 1,
2.171869, -1.401235, 2.334131, 1, 0, 0.1215686, 1,
2.21135, -0.9070971, 3.664824, 1, 0, 0.1137255, 1,
2.212157, -0.6042622, 1.771034, 1, 0, 0.1098039, 1,
2.258753, -0.1807768, 2.468535, 1, 0, 0.1019608, 1,
2.276982, -0.5408087, 2.966764, 1, 0, 0.09411765, 1,
2.277791, -0.2110583, 1.782295, 1, 0, 0.09019608, 1,
2.292719, 1.031655, 1.346337, 1, 0, 0.08235294, 1,
2.336833, -1.331783, 3.069085, 1, 0, 0.07843138, 1,
2.343551, 1.52822, 1.107549, 1, 0, 0.07058824, 1,
2.372719, -1.062565, 3.572043, 1, 0, 0.06666667, 1,
2.437367, 0.09798001, 2.423343, 1, 0, 0.05882353, 1,
2.465592, -1.01096, 1.415859, 1, 0, 0.05490196, 1,
2.475266, -0.8731455, 0.9501705, 1, 0, 0.04705882, 1,
2.487309, 2.609146, 2.082876, 1, 0, 0.04313726, 1,
2.584136, 0.8997877, -0.323856, 1, 0, 0.03529412, 1,
2.838444, 0.8669161, 0.0514779, 1, 0, 0.03137255, 1,
2.867034, 0.9559692, 2.230056, 1, 0, 0.02352941, 1,
2.910633, 1.144545, 0.6628488, 1, 0, 0.01960784, 1,
3.418984, 0.2095913, 1.35549, 1, 0, 0.01176471, 1,
3.583274, 0.3975218, 3.237636, 1, 0, 0.007843138, 1
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
0.08292675, -4.058892, -7.478645, 0, -0.5, 0.5, 0.5,
0.08292675, -4.058892, -7.478645, 1, -0.5, 0.5, 0.5,
0.08292675, -4.058892, -7.478645, 1, 1.5, 0.5, 0.5,
0.08292675, -4.058892, -7.478645, 0, 1.5, 0.5, 0.5
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
-4.604038, 0.309025, -7.478645, 0, -0.5, 0.5, 0.5,
-4.604038, 0.309025, -7.478645, 1, -0.5, 0.5, 0.5,
-4.604038, 0.309025, -7.478645, 1, 1.5, 0.5, 0.5,
-4.604038, 0.309025, -7.478645, 0, 1.5, 0.5, 0.5
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
-4.604038, -4.058892, -0.1461222, 0, -0.5, 0.5, 0.5,
-4.604038, -4.058892, -0.1461222, 1, -0.5, 0.5, 0.5,
-4.604038, -4.058892, -0.1461222, 1, 1.5, 0.5, 0.5,
-4.604038, -4.058892, -0.1461222, 0, 1.5, 0.5, 0.5
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
-2, -3.050911, -5.786524,
2, -3.050911, -5.786524,
-2, -3.050911, -5.786524,
-2, -3.218908, -6.068544,
0, -3.050911, -5.786524,
0, -3.218908, -6.068544,
2, -3.050911, -5.786524,
2, -3.218908, -6.068544
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
-2, -3.554902, -6.632585, 0, -0.5, 0.5, 0.5,
-2, -3.554902, -6.632585, 1, -0.5, 0.5, 0.5,
-2, -3.554902, -6.632585, 1, 1.5, 0.5, 0.5,
-2, -3.554902, -6.632585, 0, 1.5, 0.5, 0.5,
0, -3.554902, -6.632585, 0, -0.5, 0.5, 0.5,
0, -3.554902, -6.632585, 1, -0.5, 0.5, 0.5,
0, -3.554902, -6.632585, 1, 1.5, 0.5, 0.5,
0, -3.554902, -6.632585, 0, 1.5, 0.5, 0.5,
2, -3.554902, -6.632585, 0, -0.5, 0.5, 0.5,
2, -3.554902, -6.632585, 1, -0.5, 0.5, 0.5,
2, -3.554902, -6.632585, 1, 1.5, 0.5, 0.5,
2, -3.554902, -6.632585, 0, 1.5, 0.5, 0.5
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
-3.522431, -2, -5.786524,
-3.522431, 3, -5.786524,
-3.522431, -2, -5.786524,
-3.702698, -2, -6.068544,
-3.522431, -1, -5.786524,
-3.702698, -1, -6.068544,
-3.522431, 0, -5.786524,
-3.702698, 0, -6.068544,
-3.522431, 1, -5.786524,
-3.702698, 1, -6.068544,
-3.522431, 2, -5.786524,
-3.702698, 2, -6.068544,
-3.522431, 3, -5.786524,
-3.702698, 3, -6.068544
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
-4.063234, -2, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, -2, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, -2, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, -2, -6.632585, 0, 1.5, 0.5, 0.5,
-4.063234, -1, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, -1, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, -1, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, -1, -6.632585, 0, 1.5, 0.5, 0.5,
-4.063234, 0, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, 0, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, 0, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, 0, -6.632585, 0, 1.5, 0.5, 0.5,
-4.063234, 1, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, 1, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, 1, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, 1, -6.632585, 0, 1.5, 0.5, 0.5,
-4.063234, 2, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, 2, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, 2, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, 2, -6.632585, 0, 1.5, 0.5, 0.5,
-4.063234, 3, -6.632585, 0, -0.5, 0.5, 0.5,
-4.063234, 3, -6.632585, 1, -0.5, 0.5, 0.5,
-4.063234, 3, -6.632585, 1, 1.5, 0.5, 0.5,
-4.063234, 3, -6.632585, 0, 1.5, 0.5, 0.5
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
-3.522431, -3.050911, -4,
-3.522431, -3.050911, 4,
-3.522431, -3.050911, -4,
-3.702698, -3.218908, -4,
-3.522431, -3.050911, -2,
-3.702698, -3.218908, -2,
-3.522431, -3.050911, 0,
-3.702698, -3.218908, 0,
-3.522431, -3.050911, 2,
-3.702698, -3.218908, 2,
-3.522431, -3.050911, 4,
-3.702698, -3.218908, 4
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
-4.063234, -3.554902, -4, 0, -0.5, 0.5, 0.5,
-4.063234, -3.554902, -4, 1, -0.5, 0.5, 0.5,
-4.063234, -3.554902, -4, 1, 1.5, 0.5, 0.5,
-4.063234, -3.554902, -4, 0, 1.5, 0.5, 0.5,
-4.063234, -3.554902, -2, 0, -0.5, 0.5, 0.5,
-4.063234, -3.554902, -2, 1, -0.5, 0.5, 0.5,
-4.063234, -3.554902, -2, 1, 1.5, 0.5, 0.5,
-4.063234, -3.554902, -2, 0, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 0, 0, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 0, 1, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 0, 1, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 0, 0, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 2, 0, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 2, 1, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 2, 1, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 2, 0, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 4, 0, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 4, 1, -0.5, 0.5, 0.5,
-4.063234, -3.554902, 4, 1, 1.5, 0.5, 0.5,
-4.063234, -3.554902, 4, 0, 1.5, 0.5, 0.5
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
-3.522431, -3.050911, -5.786524,
-3.522431, 3.668962, -5.786524,
-3.522431, -3.050911, 5.49428,
-3.522431, 3.668962, 5.49428,
-3.522431, -3.050911, -5.786524,
-3.522431, -3.050911, 5.49428,
-3.522431, 3.668962, -5.786524,
-3.522431, 3.668962, 5.49428,
-3.522431, -3.050911, -5.786524,
3.688284, -3.050911, -5.786524,
-3.522431, -3.050911, 5.49428,
3.688284, -3.050911, 5.49428,
-3.522431, 3.668962, -5.786524,
3.688284, 3.668962, -5.786524,
-3.522431, 3.668962, 5.49428,
3.688284, 3.668962, 5.49428,
3.688284, -3.050911, -5.786524,
3.688284, 3.668962, -5.786524,
3.688284, -3.050911, 5.49428,
3.688284, 3.668962, 5.49428,
3.688284, -3.050911, -5.786524,
3.688284, -3.050911, 5.49428,
3.688284, 3.668962, -5.786524,
3.688284, 3.668962, 5.49428
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
var radius = 7.999158;
var distance = 35.58916;
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
mvMatrix.translate( -0.08292675, -0.309025, 0.1461222 );
mvMatrix.scale( 1.199444, 1.287055, 0.7666871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58916);
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
polyoxin_D<-read.table("polyoxin_D.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-polyoxin_D$V2
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
y<-polyoxin_D$V3
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
z<-polyoxin_D$V4
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
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
-3.41742, -0.3198936, -1.441992, 0, 0, 1, 1, 1,
-2.848271, 0.8702374, -1.061585, 1, 0, 0, 1, 1,
-2.809428, -0.3192795, -0.09814193, 1, 0, 0, 1, 1,
-2.587153, 0.4444251, -4.497693, 1, 0, 0, 1, 1,
-2.538267, 1.006074, -0.1151163, 1, 0, 0, 1, 1,
-2.42204, 0.3055284, -1.703692, 1, 0, 0, 1, 1,
-2.354654, 0.03070577, -2.17845, 0, 0, 0, 1, 1,
-2.341965, -0.7110163, -1.738574, 0, 0, 0, 1, 1,
-2.284289, 0.2396459, -0.6567581, 0, 0, 0, 1, 1,
-2.276524, -0.1151943, -1.571302, 0, 0, 0, 1, 1,
-2.263345, 0.6390364, -4.190838, 0, 0, 0, 1, 1,
-2.241491, 0.1725276, -0.5351762, 0, 0, 0, 1, 1,
-2.148308, 0.9835391, -1.361939, 0, 0, 0, 1, 1,
-2.112154, -1.919857, -3.564997, 1, 1, 1, 1, 1,
-2.101558, -0.09055098, -1.153155, 1, 1, 1, 1, 1,
-2.055647, 0.1407735, -2.555735, 1, 1, 1, 1, 1,
-2.018339, 0.9737098, 0.626485, 1, 1, 1, 1, 1,
-1.970169, -0.2278027, -0.2860542, 1, 1, 1, 1, 1,
-1.924163, 1.087505, -1.462068, 1, 1, 1, 1, 1,
-1.910373, 0.4952892, -1.132079, 1, 1, 1, 1, 1,
-1.90189, 0.4969311, -0.5546286, 1, 1, 1, 1, 1,
-1.894992, -0.2971255, -0.01811733, 1, 1, 1, 1, 1,
-1.888838, 1.295854, -1.435669, 1, 1, 1, 1, 1,
-1.861227, -0.395709, -3.706446, 1, 1, 1, 1, 1,
-1.847686, -0.1101755, -0.7934288, 1, 1, 1, 1, 1,
-1.845845, 1.133354, -0.605049, 1, 1, 1, 1, 1,
-1.845225, 0.8136732, 0.4290946, 1, 1, 1, 1, 1,
-1.816224, -0.5251245, -2.265878, 1, 1, 1, 1, 1,
-1.801277, -0.9883894, -1.96346, 0, 0, 1, 1, 1,
-1.799555, 0.3100497, -1.091626, 1, 0, 0, 1, 1,
-1.787032, -1.282386, -0.7939516, 1, 0, 0, 1, 1,
-1.783461, -0.1355261, -0.9999156, 1, 0, 0, 1, 1,
-1.775726, -1.678805, -2.366394, 1, 0, 0, 1, 1,
-1.773501, -1.004204, -1.868353, 1, 0, 0, 1, 1,
-1.750446, 2.183474, 0.2084186, 0, 0, 0, 1, 1,
-1.746568, -0.6048322, -1.039079, 0, 0, 0, 1, 1,
-1.739349, -0.4541388, -1.423843, 0, 0, 0, 1, 1,
-1.699659, -0.9938653, -1.526655, 0, 0, 0, 1, 1,
-1.693642, 1.833985, -1.485474, 0, 0, 0, 1, 1,
-1.690407, 1.587461, -3.055024, 0, 0, 0, 1, 1,
-1.682869, -1.63543, -3.811648, 0, 0, 0, 1, 1,
-1.677392, -0.1480533, -3.358062, 1, 1, 1, 1, 1,
-1.662802, -0.9979324, -0.8095466, 1, 1, 1, 1, 1,
-1.656219, 1.323407, -0.731301, 1, 1, 1, 1, 1,
-1.632952, -2.160778, -2.719235, 1, 1, 1, 1, 1,
-1.610155, 1.568027, -2.074258, 1, 1, 1, 1, 1,
-1.610053, -1.123472, -2.126158, 1, 1, 1, 1, 1,
-1.596142, 0.20332, -0.9682283, 1, 1, 1, 1, 1,
-1.571492, -0.9296199, -2.697746, 1, 1, 1, 1, 1,
-1.566332, -0.8321463, -0.9024007, 1, 1, 1, 1, 1,
-1.563932, 1.16186, -1.39058, 1, 1, 1, 1, 1,
-1.56293, 0.02486037, -1.976036, 1, 1, 1, 1, 1,
-1.549345, -1.486328, -2.02683, 1, 1, 1, 1, 1,
-1.544361, -0.4234768, 0.5686749, 1, 1, 1, 1, 1,
-1.530199, 0.2415817, -1.075504, 1, 1, 1, 1, 1,
-1.528393, 0.3947103, -2.04587, 1, 1, 1, 1, 1,
-1.51972, -0.3164329, -1.522004, 0, 0, 1, 1, 1,
-1.517663, -0.6806262, -2.511745, 1, 0, 0, 1, 1,
-1.514088, 1.203151, -0.3438023, 1, 0, 0, 1, 1,
-1.509544, -0.5515406, -2.767999, 1, 0, 0, 1, 1,
-1.5061, 1.565004, -0.8659637, 1, 0, 0, 1, 1,
-1.504501, -0.2826141, -0.5091389, 1, 0, 0, 1, 1,
-1.493487, -1.780715, -2.319955, 0, 0, 0, 1, 1,
-1.485649, 0.4818028, -2.14308, 0, 0, 0, 1, 1,
-1.478476, -1.415462, -2.41972, 0, 0, 0, 1, 1,
-1.476779, -0.1099975, -0.9438404, 0, 0, 0, 1, 1,
-1.476655, -1.326733, -1.179428, 0, 0, 0, 1, 1,
-1.464072, -1.864387, -3.434663, 0, 0, 0, 1, 1,
-1.439809, -1.347365, -3.238077, 0, 0, 0, 1, 1,
-1.437827, 0.8665492, -0.1687407, 1, 1, 1, 1, 1,
-1.4363, 1.048364, 0.2183009, 1, 1, 1, 1, 1,
-1.427972, 1.736874, 1.17837, 1, 1, 1, 1, 1,
-1.426953, 0.3937895, -1.650162, 1, 1, 1, 1, 1,
-1.424417, 0.1384361, -2.39024, 1, 1, 1, 1, 1,
-1.420829, -0.09353477, -1.790293, 1, 1, 1, 1, 1,
-1.415699, 0.07722491, -1.975778, 1, 1, 1, 1, 1,
-1.408706, -0.8412653, -4.339515, 1, 1, 1, 1, 1,
-1.403147, -2.076131, -2.726458, 1, 1, 1, 1, 1,
-1.400799, -0.05342977, -1.390274, 1, 1, 1, 1, 1,
-1.384619, 0.9584087, -0.3569205, 1, 1, 1, 1, 1,
-1.384209, -1.227291, -2.673581, 1, 1, 1, 1, 1,
-1.378345, -0.3034975, -0.594048, 1, 1, 1, 1, 1,
-1.35725, -0.2383612, -2.985803, 1, 1, 1, 1, 1,
-1.347338, 0.8456885, 1.084447, 1, 1, 1, 1, 1,
-1.335893, 0.2662169, -0.1842193, 0, 0, 1, 1, 1,
-1.323413, -0.2196621, 0.3415983, 1, 0, 0, 1, 1,
-1.317584, -2.123653, -1.068712, 1, 0, 0, 1, 1,
-1.316092, -0.8212005, -2.944287, 1, 0, 0, 1, 1,
-1.290029, 0.2447689, -2.404151, 1, 0, 0, 1, 1,
-1.289819, 1.168902, -1.493766, 1, 0, 0, 1, 1,
-1.280621, -0.4876301, -1.945643, 0, 0, 0, 1, 1,
-1.268236, 0.8033106, 0.07943961, 0, 0, 0, 1, 1,
-1.263992, -0.3242165, -0.7959191, 0, 0, 0, 1, 1,
-1.256226, 1.273429, -1.5836, 0, 0, 0, 1, 1,
-1.253136, 1.201946, -0.8799095, 0, 0, 0, 1, 1,
-1.221805, 0.2565767, 0.6237141, 0, 0, 0, 1, 1,
-1.221071, -0.007332669, -1.731331, 0, 0, 0, 1, 1,
-1.218709, 2.002585, 0.5964581, 1, 1, 1, 1, 1,
-1.200638, -1.134187, -2.637206, 1, 1, 1, 1, 1,
-1.196285, -0.2037783, -1.43836, 1, 1, 1, 1, 1,
-1.193681, 0.6837294, 0.394743, 1, 1, 1, 1, 1,
-1.189118, -1.347822, -3.863103, 1, 1, 1, 1, 1,
-1.18251, 0.2877968, -2.113346, 1, 1, 1, 1, 1,
-1.182227, 0.7192754, -1.819146, 1, 1, 1, 1, 1,
-1.179417, 1.334644, -2.011198, 1, 1, 1, 1, 1,
-1.169889, -0.6925691, -1.901707, 1, 1, 1, 1, 1,
-1.169318, 0.4279961, -1.279967, 1, 1, 1, 1, 1,
-1.168667, -0.5336413, -2.75096, 1, 1, 1, 1, 1,
-1.165514, 0.9059628, -1.258617, 1, 1, 1, 1, 1,
-1.16202, -0.3313079, -1.522241, 1, 1, 1, 1, 1,
-1.160753, 1.603039, 1.178674, 1, 1, 1, 1, 1,
-1.160087, 0.7427965, -0.6227512, 1, 1, 1, 1, 1,
-1.159323, 0.09692545, -1.533077, 0, 0, 1, 1, 1,
-1.157824, 0.4795725, -3.409936, 1, 0, 0, 1, 1,
-1.155395, -1.04251, -2.885918, 1, 0, 0, 1, 1,
-1.146119, -0.2742286, -1.417316, 1, 0, 0, 1, 1,
-1.143072, -1.418961, -1.708806, 1, 0, 0, 1, 1,
-1.127058, 2.015981, 1.545855, 1, 0, 0, 1, 1,
-1.126779, -0.362671, -4.306096, 0, 0, 0, 1, 1,
-1.122068, -0.4951755, -1.121447, 0, 0, 0, 1, 1,
-1.119451, -2.697004, -3.09867, 0, 0, 0, 1, 1,
-1.10792, 1.163983, 0.6305817, 0, 0, 0, 1, 1,
-1.105339, -2.368394, -1.987086, 0, 0, 0, 1, 1,
-1.098435, 0.3153575, -1.343866, 0, 0, 0, 1, 1,
-1.096377, -1.666421, -1.534093, 0, 0, 0, 1, 1,
-1.093384, -0.8993641, -2.045676, 1, 1, 1, 1, 1,
-1.092904, -0.3480626, -0.9215215, 1, 1, 1, 1, 1,
-1.092481, -0.2920488, -1.975927, 1, 1, 1, 1, 1,
-1.091524, -0.3528423, -0.8275149, 1, 1, 1, 1, 1,
-1.075691, 0.8129703, -0.3410571, 1, 1, 1, 1, 1,
-1.073256, 1.339561, -1.719033, 1, 1, 1, 1, 1,
-1.070055, 0.5794328, -0.7158576, 1, 1, 1, 1, 1,
-1.069581, 0.6268997, -1.521659, 1, 1, 1, 1, 1,
-1.066456, 0.7088475, 1.008103, 1, 1, 1, 1, 1,
-1.065146, -0.7651248, -2.08094, 1, 1, 1, 1, 1,
-1.044107, -0.2537271, -1.001124, 1, 1, 1, 1, 1,
-1.033842, 0.504303, -0.06838444, 1, 1, 1, 1, 1,
-1.030245, 1.663254, 0.6255505, 1, 1, 1, 1, 1,
-1.026872, -0.07694666, -2.778781, 1, 1, 1, 1, 1,
-1.016324, 0.4301221, -2.266521, 1, 1, 1, 1, 1,
-1.01436, 0.7435901, 0.3075903, 0, 0, 1, 1, 1,
-1.010405, -1.013452, -2.53116, 1, 0, 0, 1, 1,
-1.008888, 0.5676348, -1.256858, 1, 0, 0, 1, 1,
-1.007149, -0.5970756, -3.337935, 1, 0, 0, 1, 1,
-1.006743, -1.056928, -2.03827, 1, 0, 0, 1, 1,
-1.001816, 1.504624, -1.478775, 1, 0, 0, 1, 1,
-0.9852479, 0.7831788, -0.0536998, 0, 0, 0, 1, 1,
-0.984181, -1.698724, -0.4781579, 0, 0, 0, 1, 1,
-0.9805591, 0.5368432, 0.7732646, 0, 0, 0, 1, 1,
-0.9605966, 0.5736409, -0.4716085, 0, 0, 0, 1, 1,
-0.9588142, -2.747058, -1.387704, 0, 0, 0, 1, 1,
-0.9582762, -0.3220581, -1.256829, 0, 0, 0, 1, 1,
-0.954858, -0.5963113, -1.702998, 0, 0, 0, 1, 1,
-0.9537643, 1.413287, -0.323733, 1, 1, 1, 1, 1,
-0.9497952, -1.66517, -2.102909, 1, 1, 1, 1, 1,
-0.9471339, 0.1439097, -1.428174, 1, 1, 1, 1, 1,
-0.942019, 1.578725, -1.151697, 1, 1, 1, 1, 1,
-0.9404463, 0.2666349, -0.3378761, 1, 1, 1, 1, 1,
-0.9396771, 1.016355, -2.280018, 1, 1, 1, 1, 1,
-0.9381816, 0.4300725, 0.04968063, 1, 1, 1, 1, 1,
-0.9366487, 1.132956, -1.474248, 1, 1, 1, 1, 1,
-0.9300999, -0.411456, -2.753181, 1, 1, 1, 1, 1,
-0.927802, -1.0619, -1.753268, 1, 1, 1, 1, 1,
-0.9241441, -1.095435, -0.8834237, 1, 1, 1, 1, 1,
-0.9151425, 2.65105, -1.403367, 1, 1, 1, 1, 1,
-0.9145567, -0.09297488, -1.303899, 1, 1, 1, 1, 1,
-0.9129982, -2.307659, -2.97931, 1, 1, 1, 1, 1,
-0.9108944, 0.4545449, -0.144324, 1, 1, 1, 1, 1,
-0.9072948, -1.756099, -3.011428, 0, 0, 1, 1, 1,
-0.9060643, 0.05681987, -1.70716, 1, 0, 0, 1, 1,
-0.9005362, -0.9409291, -1.283718, 1, 0, 0, 1, 1,
-0.8983665, 0.7844878, -2.025708, 1, 0, 0, 1, 1,
-0.8942904, -0.8419155, -1.951241, 1, 0, 0, 1, 1,
-0.8922678, -1.285606, -3.141476, 1, 0, 0, 1, 1,
-0.8896284, -0.4697688, -1.175528, 0, 0, 0, 1, 1,
-0.8807773, 1.088624, -1.877961, 0, 0, 0, 1, 1,
-0.8764926, 0.369491, -0.154149, 0, 0, 0, 1, 1,
-0.8720579, -1.519681, -2.044654, 0, 0, 0, 1, 1,
-0.8717899, 1.250227, -1.070684, 0, 0, 0, 1, 1,
-0.8714043, 0.0824679, -1.019354, 0, 0, 0, 1, 1,
-0.8676621, -1.238534, -1.539223, 0, 0, 0, 1, 1,
-0.865957, -0.4041314, -1.760331, 1, 1, 1, 1, 1,
-0.8650755, -1.57931, -2.827741, 1, 1, 1, 1, 1,
-0.8512528, -0.1527111, -1.864095, 1, 1, 1, 1, 1,
-0.8498251, 0.3895386, -0.07565644, 1, 1, 1, 1, 1,
-0.8490018, 0.1917789, -0.8208703, 1, 1, 1, 1, 1,
-0.8452992, 1.519623, 0.3752435, 1, 1, 1, 1, 1,
-0.8424031, 0.5655999, 0.173089, 1, 1, 1, 1, 1,
-0.8423256, 1.4317, 0.4872648, 1, 1, 1, 1, 1,
-0.841266, -0.1224922, -0.7566016, 1, 1, 1, 1, 1,
-0.8330037, -0.4923202, -1.092489, 1, 1, 1, 1, 1,
-0.8308302, 0.9109747, -1.489275, 1, 1, 1, 1, 1,
-0.8274467, 0.289878, -3.082311, 1, 1, 1, 1, 1,
-0.8259333, 1.3912, -0.05235756, 1, 1, 1, 1, 1,
-0.8256735, 0.0607591, -0.003844585, 1, 1, 1, 1, 1,
-0.8193989, -0.3641187, -1.70908, 1, 1, 1, 1, 1,
-0.8059953, -0.1960177, -0.5104236, 0, 0, 1, 1, 1,
-0.8053638, -1.173533, -3.881979, 1, 0, 0, 1, 1,
-0.7995805, 0.4940641, -0.8496221, 1, 0, 0, 1, 1,
-0.7932256, 0.3837696, -0.3325421, 1, 0, 0, 1, 1,
-0.7863387, -0.8671899, -3.038026, 1, 0, 0, 1, 1,
-0.7822887, -1.271217, -3.13201, 1, 0, 0, 1, 1,
-0.7761211, -1.217502, -1.86582, 0, 0, 0, 1, 1,
-0.7737287, -0.9435298, -2.465002, 0, 0, 0, 1, 1,
-0.7705734, -0.6988139, -1.724005, 0, 0, 0, 1, 1,
-0.7622499, -0.3889579, -2.275508, 0, 0, 0, 1, 1,
-0.7606321, -0.8442675, -2.98127, 0, 0, 0, 1, 1,
-0.7599031, -0.4307145, -2.559196, 0, 0, 0, 1, 1,
-0.7580265, -1.10176, -0.2539812, 0, 0, 0, 1, 1,
-0.7537171, 0.3617726, 0.2802579, 1, 1, 1, 1, 1,
-0.752475, 0.4576259, -1.041616, 1, 1, 1, 1, 1,
-0.7404868, 0.2326481, 1.261721, 1, 1, 1, 1, 1,
-0.738574, 0.1323035, -2.255111, 1, 1, 1, 1, 1,
-0.7383226, 0.5940708, -0.30672, 1, 1, 1, 1, 1,
-0.7371328, 0.285551, -1.479175, 1, 1, 1, 1, 1,
-0.7329843, -0.3545085, -3.61416, 1, 1, 1, 1, 1,
-0.7274499, -1.709856, -2.922346, 1, 1, 1, 1, 1,
-0.7274299, -1.289346, -3.572486, 1, 1, 1, 1, 1,
-0.7262909, -0.08997256, -0.500028, 1, 1, 1, 1, 1,
-0.7245197, -2.039695, -3.657189, 1, 1, 1, 1, 1,
-0.723498, -0.5694977, -3.546964, 1, 1, 1, 1, 1,
-0.7219555, 0.7760088, 0.5387073, 1, 1, 1, 1, 1,
-0.7216552, 0.09528846, -0.5898774, 1, 1, 1, 1, 1,
-0.7068596, -0.01720873, -0.8534774, 1, 1, 1, 1, 1,
-0.7048386, 0.1260829, -0.8303982, 0, 0, 1, 1, 1,
-0.704262, 0.5457497, 0.1449203, 1, 0, 0, 1, 1,
-0.6900857, 0.8664315, 0.2284521, 1, 0, 0, 1, 1,
-0.6869957, 0.004787536, -3.069629, 1, 0, 0, 1, 1,
-0.6847857, 0.1455939, -3.131963, 1, 0, 0, 1, 1,
-0.6847134, 1.281877, 0.135511, 1, 0, 0, 1, 1,
-0.6846826, -0.05248981, -0.7999386, 0, 0, 0, 1, 1,
-0.6837035, -0.6622946, -2.310162, 0, 0, 0, 1, 1,
-0.6806509, 1.087894, 0.3504862, 0, 0, 0, 1, 1,
-0.6795636, -0.5828164, -2.433209, 0, 0, 0, 1, 1,
-0.6754722, -0.1942588, -1.157185, 0, 0, 0, 1, 1,
-0.6732108, -2.953049, -2.617657, 0, 0, 0, 1, 1,
-0.6729044, -0.7349787, -2.885893, 0, 0, 0, 1, 1,
-0.6727318, -0.2184807, -0.6141849, 1, 1, 1, 1, 1,
-0.6715314, -0.9135125, -2.919691, 1, 1, 1, 1, 1,
-0.6668532, 0.9062614, -0.7800289, 1, 1, 1, 1, 1,
-0.6665806, -0.3347528, -0.8471707, 1, 1, 1, 1, 1,
-0.6662223, -1.151702, -2.409144, 1, 1, 1, 1, 1,
-0.6653055, -0.3244515, -1.84625, 1, 1, 1, 1, 1,
-0.6559268, 0.3805525, 0.1367855, 1, 1, 1, 1, 1,
-0.6553565, -0.7568439, -1.99848, 1, 1, 1, 1, 1,
-0.6543152, 0.02480441, -1.626582, 1, 1, 1, 1, 1,
-0.6507543, 1.092921, 0.5073028, 1, 1, 1, 1, 1,
-0.647733, -1.128864, -1.9661, 1, 1, 1, 1, 1,
-0.6473796, 0.6193814, -1.298318, 1, 1, 1, 1, 1,
-0.6465422, -0.1990438, -1.459025, 1, 1, 1, 1, 1,
-0.6455464, 0.9774691, -0.077343, 1, 1, 1, 1, 1,
-0.6376215, -1.624122, -2.195502, 1, 1, 1, 1, 1,
-0.6321785, 0.5009338, -1.360231, 0, 0, 1, 1, 1,
-0.6299887, -1.394203, -1.393649, 1, 0, 0, 1, 1,
-0.629296, 0.4710794, -0.2824344, 1, 0, 0, 1, 1,
-0.6271241, -0.2527861, -2.369112, 1, 0, 0, 1, 1,
-0.6266623, -0.02431371, -0.4820251, 1, 0, 0, 1, 1,
-0.6246758, 0.441244, 0.3603848, 1, 0, 0, 1, 1,
-0.6175925, -1.090876, -2.677232, 0, 0, 0, 1, 1,
-0.6115958, -0.5207657, -3.036619, 0, 0, 0, 1, 1,
-0.6088246, -0.6362066, -0.4714537, 0, 0, 0, 1, 1,
-0.6073436, -1.745573, -2.704294, 0, 0, 0, 1, 1,
-0.6070603, 1.559385, 0.8481635, 0, 0, 0, 1, 1,
-0.6033549, -0.8992915, -3.496367, 0, 0, 0, 1, 1,
-0.6029394, -1.773092, -2.957822, 0, 0, 0, 1, 1,
-0.5997843, -0.6641937, -1.81255, 1, 1, 1, 1, 1,
-0.593344, -2.152429, -2.780819, 1, 1, 1, 1, 1,
-0.587242, 0.6013594, 0.0571175, 1, 1, 1, 1, 1,
-0.5843549, -1.293506, -1.636238, 1, 1, 1, 1, 1,
-0.5822247, 0.6407803, -0.5386195, 1, 1, 1, 1, 1,
-0.5820842, -1.138106, -5.622241, 1, 1, 1, 1, 1,
-0.5803539, 0.2029843, -2.884319, 1, 1, 1, 1, 1,
-0.5759445, -0.9793833, -0.8783206, 1, 1, 1, 1, 1,
-0.5649107, -1.658915, -2.561475, 1, 1, 1, 1, 1,
-0.5627295, -0.1130621, -1.711596, 1, 1, 1, 1, 1,
-0.5625338, -0.1459412, -1.246143, 1, 1, 1, 1, 1,
-0.5589821, -1.177221, -2.275372, 1, 1, 1, 1, 1,
-0.5568854, 1.079519, -2.378342, 1, 1, 1, 1, 1,
-0.5559455, 0.3671539, -1.667672, 1, 1, 1, 1, 1,
-0.5557959, 0.3267076, -0.7168332, 1, 1, 1, 1, 1,
-0.5525676, 0.1796195, -0.8917388, 0, 0, 1, 1, 1,
-0.5494336, -0.2275083, -1.992604, 1, 0, 0, 1, 1,
-0.5447745, 0.3100345, -2.332297, 1, 0, 0, 1, 1,
-0.5432983, -0.9880931, -2.786962, 1, 0, 0, 1, 1,
-0.5420979, -0.3114199, 0.7794945, 1, 0, 0, 1, 1,
-0.5387198, 1.321535, -0.6737769, 1, 0, 0, 1, 1,
-0.5377298, 0.1594206, -1.907104, 0, 0, 0, 1, 1,
-0.5347822, -1.848513, -3.116306, 0, 0, 0, 1, 1,
-0.5345582, 0.3981855, -1.374854, 0, 0, 0, 1, 1,
-0.532341, -1.079124, 0.02101109, 0, 0, 0, 1, 1,
-0.5274793, 0.5519006, -0.7559361, 0, 0, 0, 1, 1,
-0.5269603, -0.4304261, -1.635772, 0, 0, 0, 1, 1,
-0.5045335, -0.4089549, -1.614499, 0, 0, 0, 1, 1,
-0.4949118, 2.234346, -0.4196749, 1, 1, 1, 1, 1,
-0.4903169, -1.161149, -4.591568, 1, 1, 1, 1, 1,
-0.4887289, 0.7318469, -0.5010257, 1, 1, 1, 1, 1,
-0.4831558, 0.7341039, -1.750996, 1, 1, 1, 1, 1,
-0.4821466, 0.361232, -0.8341572, 1, 1, 1, 1, 1,
-0.4797446, 0.6923385, -0.001220021, 1, 1, 1, 1, 1,
-0.479112, 2.601647, -0.1653406, 1, 1, 1, 1, 1,
-0.4740988, 0.9502898, 0.5861124, 1, 1, 1, 1, 1,
-0.4734514, 0.4773194, -1.454492, 1, 1, 1, 1, 1,
-0.4687772, 0.1255123, -1.462149, 1, 1, 1, 1, 1,
-0.4686981, -0.049035, -1.52185, 1, 1, 1, 1, 1,
-0.4678041, 1.053939, -2.024487, 1, 1, 1, 1, 1,
-0.4654016, -0.3604808, -2.97165, 1, 1, 1, 1, 1,
-0.4628141, 1.325278, 0.2878183, 1, 1, 1, 1, 1,
-0.4588674, 0.3657332, -2.548863, 1, 1, 1, 1, 1,
-0.4550896, 0.07432012, -2.871441, 0, 0, 1, 1, 1,
-0.450302, -0.8595942, -1.880019, 1, 0, 0, 1, 1,
-0.4502776, 0.9699116, -0.4405327, 1, 0, 0, 1, 1,
-0.4496702, 1.405862, -0.8907056, 1, 0, 0, 1, 1,
-0.4464338, -1.58198, -1.98934, 1, 0, 0, 1, 1,
-0.4451717, 1.651348, 0.07021386, 1, 0, 0, 1, 1,
-0.4438856, -0.9897001, -2.866636, 0, 0, 0, 1, 1,
-0.441384, 1.201449, 2.377096, 0, 0, 0, 1, 1,
-0.4393082, -0.2847336, -2.917877, 0, 0, 0, 1, 1,
-0.4344412, -0.09743676, -2.305177, 0, 0, 0, 1, 1,
-0.434419, 0.09086739, -2.225121, 0, 0, 0, 1, 1,
-0.4308326, -0.4918923, -2.018517, 0, 0, 0, 1, 1,
-0.4284507, -0.2127901, -1.873293, 0, 0, 0, 1, 1,
-0.4275442, -0.8453976, -2.313488, 1, 1, 1, 1, 1,
-0.4257748, -0.9550219, -2.013491, 1, 1, 1, 1, 1,
-0.4176244, 0.9064889, -1.240348, 1, 1, 1, 1, 1,
-0.4172873, 0.3982641, -0.2567048, 1, 1, 1, 1, 1,
-0.4171355, -1.740611, -2.910609, 1, 1, 1, 1, 1,
-0.4153549, -0.7111241, -3.758683, 1, 1, 1, 1, 1,
-0.4137601, 0.515576, -1.752721, 1, 1, 1, 1, 1,
-0.4117668, -0.5407481, -3.183533, 1, 1, 1, 1, 1,
-0.409801, 0.8795236, -0.6748432, 1, 1, 1, 1, 1,
-0.4075307, -0.8328964, -3.51631, 1, 1, 1, 1, 1,
-0.4061345, -0.6781514, -3.138757, 1, 1, 1, 1, 1,
-0.4031042, -1.25153, -2.921053, 1, 1, 1, 1, 1,
-0.4029402, 1.193482, 0.1053851, 1, 1, 1, 1, 1,
-0.3989851, -1.454215, -3.173448, 1, 1, 1, 1, 1,
-0.396899, -2.027736, -5.10406, 1, 1, 1, 1, 1,
-0.3945655, 0.01589189, -1.767243, 0, 0, 1, 1, 1,
-0.3794998, -0.8552273, -1.752306, 1, 0, 0, 1, 1,
-0.3787926, -0.05547114, -2.296405, 1, 0, 0, 1, 1,
-0.377525, 0.588755, -0.4827843, 1, 0, 0, 1, 1,
-0.3747555, -1.969589, -3.846185, 1, 0, 0, 1, 1,
-0.3693984, 1.055498, -0.9882299, 1, 0, 0, 1, 1,
-0.3678842, 0.3592246, -0.8387718, 0, 0, 0, 1, 1,
-0.3650704, 1.823842, -1.007521, 0, 0, 0, 1, 1,
-0.3616415, -0.2007789, -1.904127, 0, 0, 0, 1, 1,
-0.3587321, 0.7861346, 0.415016, 0, 0, 0, 1, 1,
-0.3573424, -0.2842782, -1.062104, 0, 0, 0, 1, 1,
-0.3556938, -0.9550282, -2.735352, 0, 0, 0, 1, 1,
-0.3552518, -1.467171, -2.580412, 0, 0, 0, 1, 1,
-0.3549849, -2.270607, -4.026666, 1, 1, 1, 1, 1,
-0.3528406, -0.8282452, -3.202158, 1, 1, 1, 1, 1,
-0.3505038, -0.0482056, -1.564536, 1, 1, 1, 1, 1,
-0.3478422, 0.9647262, 0.5646594, 1, 1, 1, 1, 1,
-0.3474384, -0.945582, -3.713463, 1, 1, 1, 1, 1,
-0.3453592, -0.1435675, -1.81389, 1, 1, 1, 1, 1,
-0.3408395, -2.634513, -2.325662, 1, 1, 1, 1, 1,
-0.3384623, 1.536367, -0.06701288, 1, 1, 1, 1, 1,
-0.3370173, 2.250594, -0.1739117, 1, 1, 1, 1, 1,
-0.3368488, 1.179536, -0.7822083, 1, 1, 1, 1, 1,
-0.3300778, 0.1970854, -1.010189, 1, 1, 1, 1, 1,
-0.3292929, 2.170597, -0.9866796, 1, 1, 1, 1, 1,
-0.3287424, -0.5727559, -1.155214, 1, 1, 1, 1, 1,
-0.326924, -0.1906849, -1.521602, 1, 1, 1, 1, 1,
-0.3264742, 0.6244681, -0.8310379, 1, 1, 1, 1, 1,
-0.3247794, 0.376411, 0.108323, 0, 0, 1, 1, 1,
-0.3247606, 0.5079796, -2.23939, 1, 0, 0, 1, 1,
-0.3190444, 0.9894759, -0.4155172, 1, 0, 0, 1, 1,
-0.3156349, -0.7101528, -2.216536, 1, 0, 0, 1, 1,
-0.3151687, 0.1042223, -2.8296, 1, 0, 0, 1, 1,
-0.3107406, 0.7233393, 1.388235, 1, 0, 0, 1, 1,
-0.3105019, -1.164271, -2.912182, 0, 0, 0, 1, 1,
-0.3086358, 0.3517647, 0.1648105, 0, 0, 0, 1, 1,
-0.2958657, 0.02461635, -0.7787855, 0, 0, 0, 1, 1,
-0.2922359, -0.301042, -0.9706632, 0, 0, 0, 1, 1,
-0.2913899, 0.1699716, -1.561552, 0, 0, 0, 1, 1,
-0.2888961, 0.2783484, -1.676891, 0, 0, 0, 1, 1,
-0.285344, 0.6044527, 0.01988887, 0, 0, 0, 1, 1,
-0.2831767, 1.675306, 0.1333594, 1, 1, 1, 1, 1,
-0.2823877, -0.7774363, -3.659769, 1, 1, 1, 1, 1,
-0.2819187, -2.077837, -3.36529, 1, 1, 1, 1, 1,
-0.27452, 1.372013, -0.166254, 1, 1, 1, 1, 1,
-0.2652554, -0.8434885, -4.449848, 1, 1, 1, 1, 1,
-0.2612208, -0.05305204, -1.283605, 1, 1, 1, 1, 1,
-0.2595401, -0.2288433, -1.529864, 1, 1, 1, 1, 1,
-0.2580643, 0.6471047, -0.2501534, 1, 1, 1, 1, 1,
-0.2497549, -0.622988, -1.356172, 1, 1, 1, 1, 1,
-0.2495366, 0.4811252, 0.2492303, 1, 1, 1, 1, 1,
-0.2478765, 0.730265, -0.7390643, 1, 1, 1, 1, 1,
-0.2419409, -0.1312808, -1.672117, 1, 1, 1, 1, 1,
-0.2402183, -0.9619236, -3.460228, 1, 1, 1, 1, 1,
-0.2392433, -0.02279061, -1.610904, 1, 1, 1, 1, 1,
-0.233662, 0.2047389, -1.908253, 1, 1, 1, 1, 1,
-0.2276592, -0.1720578, -2.405245, 0, 0, 1, 1, 1,
-0.2206291, -0.4057881, -2.944005, 1, 0, 0, 1, 1,
-0.2160842, 0.2813378, -0.05441894, 1, 0, 0, 1, 1,
-0.211944, -0.8770947, -3.028656, 1, 0, 0, 1, 1,
-0.2111824, -0.0412071, -1.078866, 1, 0, 0, 1, 1,
-0.2064484, -0.7809154, -2.468236, 1, 0, 0, 1, 1,
-0.1999744, 0.2564801, 0.9816854, 0, 0, 0, 1, 1,
-0.1996094, 0.3851847, -1.091431, 0, 0, 0, 1, 1,
-0.1977956, 0.2913329, -0.2110529, 0, 0, 0, 1, 1,
-0.1961642, 1.139937, -2.110557, 0, 0, 0, 1, 1,
-0.1932635, -1.275275, -4.645656, 0, 0, 0, 1, 1,
-0.193027, -0.5117949, -3.046538, 0, 0, 0, 1, 1,
-0.1924488, -0.2189061, -0.810297, 0, 0, 0, 1, 1,
-0.186376, -0.07189728, -3.395185, 1, 1, 1, 1, 1,
-0.1839795, 0.2286501, 0.5292954, 1, 1, 1, 1, 1,
-0.1838235, 0.0567503, -1.285825, 1, 1, 1, 1, 1,
-0.1806759, 0.1571123, -3.032243, 1, 1, 1, 1, 1,
-0.180121, 0.370139, 0.04946592, 1, 1, 1, 1, 1,
-0.1794364, 0.2375206, 0.2175745, 1, 1, 1, 1, 1,
-0.1753803, -0.6753574, -2.571078, 1, 1, 1, 1, 1,
-0.1734671, -1.905581, -2.806887, 1, 1, 1, 1, 1,
-0.1726429, -0.333553, -4.986223, 1, 1, 1, 1, 1,
-0.1702787, -0.8327777, -2.869025, 1, 1, 1, 1, 1,
-0.164682, -0.6800796, -3.40257, 1, 1, 1, 1, 1,
-0.1598604, 0.708773, -1.360677, 1, 1, 1, 1, 1,
-0.1576926, -1.184814, -3.598284, 1, 1, 1, 1, 1,
-0.1540293, 1.793123, 1.237636, 1, 1, 1, 1, 1,
-0.1360361, 1.864759, -0.9639765, 1, 1, 1, 1, 1,
-0.1245095, -0.4172714, -2.881779, 0, 0, 1, 1, 1,
-0.1185198, -1.194909, -2.393898, 1, 0, 0, 1, 1,
-0.1178434, 0.8729609, 2.134794, 1, 0, 0, 1, 1,
-0.1162567, 0.3298612, -0.4627935, 1, 0, 0, 1, 1,
-0.1157834, 0.1425074, -0.5585564, 1, 0, 0, 1, 1,
-0.1146903, -0.1885397, -2.741485, 1, 0, 0, 1, 1,
-0.1113136, -0.1945607, -3.41132, 0, 0, 0, 1, 1,
-0.1101694, 1.043794, -0.6363623, 0, 0, 0, 1, 1,
-0.1063489, -1.602837, -2.937673, 0, 0, 0, 1, 1,
-0.1052996, 0.3215908, 0.292383, 0, 0, 0, 1, 1,
-0.1025529, 0.324654, -0.8571465, 0, 0, 0, 1, 1,
-0.09527802, -0.3124562, -2.790087, 0, 0, 0, 1, 1,
-0.09510943, -0.3624904, -3.231169, 0, 0, 0, 1, 1,
-0.09159391, 0.07984486, -2.400102, 1, 1, 1, 1, 1,
-0.07994621, 1.943595, -0.4146346, 1, 1, 1, 1, 1,
-0.07615525, 0.9554981, 0.3321936, 1, 1, 1, 1, 1,
-0.07262506, 3.040544, 0.5239043, 1, 1, 1, 1, 1,
-0.07060253, -1.230008, -0.2816892, 1, 1, 1, 1, 1,
-0.06992213, 0.9535723, 0.1811567, 1, 1, 1, 1, 1,
-0.06779905, -0.5611717, -3.809348, 1, 1, 1, 1, 1,
-0.06529121, -0.4442145, -1.9811, 1, 1, 1, 1, 1,
-0.06456287, 0.4241156, -0.3258015, 1, 1, 1, 1, 1,
-0.06393003, -0.266015, -1.800159, 1, 1, 1, 1, 1,
-0.06379664, -1.88295, -3.521209, 1, 1, 1, 1, 1,
-0.06346645, -1.153614, -3.510449, 1, 1, 1, 1, 1,
-0.06171223, 0.446659, 0.3506291, 1, 1, 1, 1, 1,
-0.06133349, 0.1260888, -0.8284089, 1, 1, 1, 1, 1,
-0.05048329, 0.123272, 0.05229589, 1, 1, 1, 1, 1,
-0.03978813, -0.6397243, -2.495334, 0, 0, 1, 1, 1,
-0.03754771, -1.792922, -2.921022, 1, 0, 0, 1, 1,
-0.03658635, -0.2544279, -3.299819, 1, 0, 0, 1, 1,
-0.03506259, 0.4602434, -0.8420181, 1, 0, 0, 1, 1,
-0.03460513, -0.3410074, -3.953411, 1, 0, 0, 1, 1,
-0.02999577, -0.176275, -0.3848453, 1, 0, 0, 1, 1,
-0.02958339, -1.580074, -3.424786, 0, 0, 0, 1, 1,
-0.01645088, 0.8436225, 0.1020079, 0, 0, 0, 1, 1,
-0.01595509, 1.627163, 1.033929, 0, 0, 0, 1, 1,
-0.01500029, 0.6907962, -0.391641, 0, 0, 0, 1, 1,
-0.01400059, -0.0223395, -2.22906, 0, 0, 0, 1, 1,
-0.01358771, -0.395553, -2.378517, 0, 0, 0, 1, 1,
-0.01278671, 0.4386468, 0.3585114, 0, 0, 0, 1, 1,
-0.01247986, -0.2022617, -4.337011, 1, 1, 1, 1, 1,
-0.01070379, 1.520882, -0.5898799, 1, 1, 1, 1, 1,
-0.00931935, 1.224547, 0.1671286, 1, 1, 1, 1, 1,
-0.006413107, 1.658097, -0.2284994, 1, 1, 1, 1, 1,
-0.006398939, 0.6864809, -0.2244479, 1, 1, 1, 1, 1,
-0.005831938, -0.2973537, -1.508079, 1, 1, 1, 1, 1,
-0.003216453, -1.138494, -1.447084, 1, 1, 1, 1, 1,
-0.003006737, 0.93699, 0.3875541, 1, 1, 1, 1, 1,
-0.001761645, -1.055188, -2.439296, 1, 1, 1, 1, 1,
0.002477521, -0.49772, 3.394755, 1, 1, 1, 1, 1,
0.007103075, -0.3014303, 3.672647, 1, 1, 1, 1, 1,
0.01335092, -0.6415351, 1.341778, 1, 1, 1, 1, 1,
0.0176154, -1.40246, 3.837791, 1, 1, 1, 1, 1,
0.0202211, 0.9075972, -0.6026436, 1, 1, 1, 1, 1,
0.02058909, -1.659398, 1.455978, 1, 1, 1, 1, 1,
0.02578366, -0.9521676, 2.400477, 0, 0, 1, 1, 1,
0.02648297, -2.160777, 3.285693, 1, 0, 0, 1, 1,
0.02674013, 1.077274, 1.360895, 1, 0, 0, 1, 1,
0.02675543, 1.374901, 0.2301402, 1, 0, 0, 1, 1,
0.02866583, -0.3957764, 2.419506, 1, 0, 0, 1, 1,
0.02908037, -0.6412353, 2.611501, 1, 0, 0, 1, 1,
0.0293998, 0.5036387, -0.9484145, 0, 0, 0, 1, 1,
0.0319435, -0.8860364, 0.6396266, 0, 0, 0, 1, 1,
0.03248798, 0.584941, 0.1157395, 0, 0, 0, 1, 1,
0.03467055, -0.01393986, 2.94124, 0, 0, 0, 1, 1,
0.03978652, 0.6437694, 1.527924, 0, 0, 0, 1, 1,
0.04228053, 1.550457, -3.027724, 0, 0, 0, 1, 1,
0.04275189, -2.73355, 4.808553, 0, 0, 0, 1, 1,
0.04596588, -2.77682, 3.697636, 1, 1, 1, 1, 1,
0.0506006, -0.5069211, 2.715806, 1, 1, 1, 1, 1,
0.0528359, 1.334185, -1.239851, 1, 1, 1, 1, 1,
0.0528413, -0.6757897, 2.391682, 1, 1, 1, 1, 1,
0.05841814, 1.326056, 0.5026745, 1, 1, 1, 1, 1,
0.06227148, 0.1351971, -0.7282752, 1, 1, 1, 1, 1,
0.06258784, 0.6914114, 0.3482486, 1, 1, 1, 1, 1,
0.0693933, 1.724191, 1.20013, 1, 1, 1, 1, 1,
0.07061071, -2.359984, 3.293734, 1, 1, 1, 1, 1,
0.07112486, 1.483795, -0.3207978, 1, 1, 1, 1, 1,
0.07277449, 0.9863574, 0.8614165, 1, 1, 1, 1, 1,
0.07677995, -1.7235, 4.609756, 1, 1, 1, 1, 1,
0.08117996, -0.8171524, 2.659005, 1, 1, 1, 1, 1,
0.08312473, 0.7983185, 0.9238223, 1, 1, 1, 1, 1,
0.08501415, 0.6567162, 0.06321788, 1, 1, 1, 1, 1,
0.0890223, 0.1118952, 1.34497, 0, 0, 1, 1, 1,
0.08917443, 0.5152516, -0.8622805, 1, 0, 0, 1, 1,
0.09731486, 0.6114687, -0.04333083, 1, 0, 0, 1, 1,
0.1007, 1.200542, -0.01475724, 1, 0, 0, 1, 1,
0.1037207, 1.003489, 1.451149, 1, 0, 0, 1, 1,
0.1044402, 1.339216, 0.04213778, 1, 0, 0, 1, 1,
0.1056092, -1.232927, 2.93994, 0, 0, 0, 1, 1,
0.1082384, 1.094903, 0.5999631, 0, 0, 0, 1, 1,
0.11203, 0.2267265, -0.3741428, 0, 0, 0, 1, 1,
0.1138432, 0.9124117, 0.7362839, 0, 0, 0, 1, 1,
0.1145571, -1.641594, 3.385233, 0, 0, 0, 1, 1,
0.1164751, 0.4266211, 0.7017398, 0, 0, 0, 1, 1,
0.1175971, -1.661047, 1.811693, 0, 0, 0, 1, 1,
0.1183131, 1.532524, 0.3957306, 1, 1, 1, 1, 1,
0.1206955, -0.03483452, 4.255488, 1, 1, 1, 1, 1,
0.1212218, -1.145468, 2.128338, 1, 1, 1, 1, 1,
0.1273272, 0.1137976, 1.088739, 1, 1, 1, 1, 1,
0.1455982, 1.686108, 0.7373052, 1, 1, 1, 1, 1,
0.1475647, -0.6051769, 2.927068, 1, 1, 1, 1, 1,
0.1582711, 1.558731, -1.356842, 1, 1, 1, 1, 1,
0.1587067, 0.2213175, -1.142, 1, 1, 1, 1, 1,
0.1644093, -1.00795, 3.513327, 1, 1, 1, 1, 1,
0.1672051, 0.5975701, 0.09595525, 1, 1, 1, 1, 1,
0.1750424, 1.305506, 1.293301, 1, 1, 1, 1, 1,
0.1758286, 1.157532, 1.622942, 1, 1, 1, 1, 1,
0.1762658, -0.4256512, 2.206416, 1, 1, 1, 1, 1,
0.1763557, 0.4063863, 0.4883986, 1, 1, 1, 1, 1,
0.1764661, 1.046655, 0.7529946, 1, 1, 1, 1, 1,
0.1777795, -0.4609351, 1.491678, 0, 0, 1, 1, 1,
0.1813243, -0.5636604, 0.06231378, 1, 0, 0, 1, 1,
0.1839565, 0.7488094, 0.7437772, 1, 0, 0, 1, 1,
0.1855267, 1.652957, 0.07463599, 1, 0, 0, 1, 1,
0.1885651, -0.1279316, 2.792335, 1, 0, 0, 1, 1,
0.1922808, 0.6619825, 2.314347, 1, 0, 0, 1, 1,
0.1986585, 0.8700485, -0.9164848, 0, 0, 0, 1, 1,
0.2072269, -0.1201077, 1.969692, 0, 0, 0, 1, 1,
0.2080857, 1.683533, -1.73829, 0, 0, 0, 1, 1,
0.2091739, 2.300287, 0.7661166, 0, 0, 0, 1, 1,
0.2098462, -1.170217, 2.775187, 0, 0, 0, 1, 1,
0.2105353, -0.6809449, 3.181523, 0, 0, 0, 1, 1,
0.2113786, -0.3409206, 0.9539984, 0, 0, 0, 1, 1,
0.2115438, 2.583784, 0.3801448, 1, 1, 1, 1, 1,
0.2133344, -0.1500453, 2.252288, 1, 1, 1, 1, 1,
0.2134351, -0.8714448, 3.350073, 1, 1, 1, 1, 1,
0.216461, -1.694881, 2.821863, 1, 1, 1, 1, 1,
0.218508, -0.5396715, 4.086144, 1, 1, 1, 1, 1,
0.2220883, -0.4406868, 1.796238, 1, 1, 1, 1, 1,
0.225684, 1.018767, 0.1575195, 1, 1, 1, 1, 1,
0.2315507, -1.765055, 2.411683, 1, 1, 1, 1, 1,
0.2359945, -0.0099214, 0.07713393, 1, 1, 1, 1, 1,
0.2360678, 0.2417569, 0.687182, 1, 1, 1, 1, 1,
0.2366717, 1.1364, 0.6131042, 1, 1, 1, 1, 1,
0.2368999, 1.01247, -0.1638657, 1, 1, 1, 1, 1,
0.2369098, -1.807211, 2.363897, 1, 1, 1, 1, 1,
0.2370562, -1.164058, 2.116695, 1, 1, 1, 1, 1,
0.2421682, 1.130627, 0.6660771, 1, 1, 1, 1, 1,
0.2438573, 0.002017766, -0.1612138, 0, 0, 1, 1, 1,
0.2471683, 0.1025519, 1.643628, 1, 0, 0, 1, 1,
0.2496696, 0.9088991, 0.2187091, 1, 0, 0, 1, 1,
0.2501546, -1.859611, 2.79322, 1, 0, 0, 1, 1,
0.2524361, -1.841998, 3.460938, 1, 0, 0, 1, 1,
0.2602613, 1.4467, 1.004612, 1, 0, 0, 1, 1,
0.2654316, -1.290329, 1.632167, 0, 0, 0, 1, 1,
0.2663378, 1.724343, 0.1713794, 0, 0, 0, 1, 1,
0.2675858, -1.282114, 2.829261, 0, 0, 0, 1, 1,
0.2678318, 0.3368168, 0.8559752, 0, 0, 0, 1, 1,
0.2757138, -0.1135872, 2.464561, 0, 0, 0, 1, 1,
0.2780686, 0.137005, 1.060245, 0, 0, 0, 1, 1,
0.2799451, -0.2587168, 2.035107, 0, 0, 0, 1, 1,
0.2824352, -0.562884, 2.610728, 1, 1, 1, 1, 1,
0.2883718, 0.3517427, 2.591459, 1, 1, 1, 1, 1,
0.2896288, 0.633986, -0.5615035, 1, 1, 1, 1, 1,
0.2947165, 0.803288, 1.355422, 1, 1, 1, 1, 1,
0.2960997, -0.8454643, 2.40623, 1, 1, 1, 1, 1,
0.3003194, -1.111308, 4.831393, 1, 1, 1, 1, 1,
0.3042809, -1.329968, 3.885384, 1, 1, 1, 1, 1,
0.304578, -0.004499636, 2.373708, 1, 1, 1, 1, 1,
0.3054238, -0.6108609, 1.034296, 1, 1, 1, 1, 1,
0.3064134, 2.265285, -1.329164, 1, 1, 1, 1, 1,
0.3084847, 0.6247845, 0.7609149, 1, 1, 1, 1, 1,
0.3093404, 1.872666, 1.045255, 1, 1, 1, 1, 1,
0.3123601, -1.298826, 3.787411, 1, 1, 1, 1, 1,
0.3124012, -0.8914308, 2.648998, 1, 1, 1, 1, 1,
0.3134537, -0.188932, 3.116879, 1, 1, 1, 1, 1,
0.3159916, 1.266044, -0.4243723, 0, 0, 1, 1, 1,
0.3168743, 0.2827856, 1.420219, 1, 0, 0, 1, 1,
0.3245965, -1.049044, 0.9167407, 1, 0, 0, 1, 1,
0.3256778, 2.463821, -0.07417388, 1, 0, 0, 1, 1,
0.3263171, 0.1978808, 0.6229944, 1, 0, 0, 1, 1,
0.3303568, 0.2324847, 1.159983, 1, 0, 0, 1, 1,
0.3342611, 1.841621, 1.739968, 0, 0, 0, 1, 1,
0.3347863, 0.2919633, 2.095899, 0, 0, 0, 1, 1,
0.335363, 0.7057625, 1.20485, 0, 0, 0, 1, 1,
0.3365918, -0.579038, 3.10264, 0, 0, 0, 1, 1,
0.3366897, 0.1444074, 2.066963, 0, 0, 0, 1, 1,
0.3388883, 0.2275658, 0.9116957, 0, 0, 0, 1, 1,
0.34097, -0.6237887, 0.737473, 0, 0, 0, 1, 1,
0.3466328, -1.941166, 3.217733, 1, 1, 1, 1, 1,
0.3479839, -1.691125, 3.585366, 1, 1, 1, 1, 1,
0.3480844, -0.2308146, 3.741438, 1, 1, 1, 1, 1,
0.3480845, -1.729887, 3.456927, 1, 1, 1, 1, 1,
0.3492352, 1.36422, -0.2677363, 1, 1, 1, 1, 1,
0.3534934, -1.301152, 3.658705, 1, 1, 1, 1, 1,
0.3535508, -0.3955999, 1.624037, 1, 1, 1, 1, 1,
0.3538154, 0.2273281, 0.6876317, 1, 1, 1, 1, 1,
0.3554888, -1.564541, 2.456347, 1, 1, 1, 1, 1,
0.3576542, -0.2216602, 1.778509, 1, 1, 1, 1, 1,
0.3660098, 1.342915, -0.5200834, 1, 1, 1, 1, 1,
0.3798812, -0.1979356, 1.443718, 1, 1, 1, 1, 1,
0.3824712, -0.6982557, 3.095511, 1, 1, 1, 1, 1,
0.3932119, -0.8702765, 4.171046, 1, 1, 1, 1, 1,
0.3946125, -0.1649594, 1.803581, 1, 1, 1, 1, 1,
0.4024336, 1.211915, 0.3889945, 0, 0, 1, 1, 1,
0.403165, 1.594208, 0.4952369, 1, 0, 0, 1, 1,
0.4032549, -0.9135351, 4.060548, 1, 0, 0, 1, 1,
0.4098213, 0.4660476, 1.092113, 1, 0, 0, 1, 1,
0.4138547, -0.8910912, 1.447107, 1, 0, 0, 1, 1,
0.4172487, -0.791876, 2.381552, 1, 0, 0, 1, 1,
0.4211486, 1.92354, 0.3587748, 0, 0, 0, 1, 1,
0.4238337, 0.7098714, 2.004827, 0, 0, 0, 1, 1,
0.4244069, -1.59246, 3.72528, 0, 0, 0, 1, 1,
0.4257662, -0.5006372, 1.515395, 0, 0, 0, 1, 1,
0.4296643, -0.1528022, 3.386906, 0, 0, 0, 1, 1,
0.429899, -0.7913612, 2.011911, 0, 0, 0, 1, 1,
0.4306002, -0.643968, 3.419468, 0, 0, 0, 1, 1,
0.4391195, 0.06730168, 1.43577, 1, 1, 1, 1, 1,
0.4429863, -1.94285, 4.462644, 1, 1, 1, 1, 1,
0.4436812, -1.008364, 4.270077, 1, 1, 1, 1, 1,
0.4440368, 1.444025, 0.854156, 1, 1, 1, 1, 1,
0.4455592, 0.7694615, 1.022071, 1, 1, 1, 1, 1,
0.4462874, 1.217159, 0.06209232, 1, 1, 1, 1, 1,
0.4513281, -0.4891171, 2.071339, 1, 1, 1, 1, 1,
0.4579539, 0.9505525, 0.2747922, 1, 1, 1, 1, 1,
0.4593664, 0.3541864, -0.2957117, 1, 1, 1, 1, 1,
0.4596918, 1.705077, 1.058049, 1, 1, 1, 1, 1,
0.4616616, -0.729962, 2.266858, 1, 1, 1, 1, 1,
0.4701856, -1.048838, 2.775376, 1, 1, 1, 1, 1,
0.4708807, -1.156615, 3.158655, 1, 1, 1, 1, 1,
0.4735531, -0.2249458, 2.012592, 1, 1, 1, 1, 1,
0.476039, -0.7784187, 3.784352, 1, 1, 1, 1, 1,
0.4825867, 0.3955146, 1.53327, 0, 0, 1, 1, 1,
0.4927923, 1.258104, 0.01552881, 1, 0, 0, 1, 1,
0.4932627, 1.148899, 1.235338, 1, 0, 0, 1, 1,
0.4942579, 0.7910464, 0.2840534, 1, 0, 0, 1, 1,
0.4961537, -1.026094, 1.656478, 1, 0, 0, 1, 1,
0.5004092, 2.111501, 0.9911232, 1, 0, 0, 1, 1,
0.5025132, 0.4292569, 0.2907704, 0, 0, 0, 1, 1,
0.50573, -0.1385336, 1.274252, 0, 0, 0, 1, 1,
0.505932, -1.656665, 3.846584, 0, 0, 0, 1, 1,
0.506466, -0.8750325, 3.062626, 0, 0, 0, 1, 1,
0.5067576, -1.547743, 4.103243, 0, 0, 0, 1, 1,
0.5094227, -0.6713396, 1.653906, 0, 0, 0, 1, 1,
0.5100559, 0.4160291, 2.447243, 0, 0, 0, 1, 1,
0.5101562, -1.126871, 1.907419, 1, 1, 1, 1, 1,
0.5101781, -0.3923742, 2.813531, 1, 1, 1, 1, 1,
0.5128108, -1.623384, 2.11328, 1, 1, 1, 1, 1,
0.5146523, 0.3540669, 1.617007, 1, 1, 1, 1, 1,
0.5200937, -1.83904, 0.9005808, 1, 1, 1, 1, 1,
0.5282655, -1.672104, 1.240346, 1, 1, 1, 1, 1,
0.5333784, -0.8561767, 3.437495, 1, 1, 1, 1, 1,
0.5370052, 0.2345084, 0.349783, 1, 1, 1, 1, 1,
0.5374308, -1.384398, 2.604545, 1, 1, 1, 1, 1,
0.5382199, -0.5593861, 0.8495286, 1, 1, 1, 1, 1,
0.5404794, 0.1646465, 2.241287, 1, 1, 1, 1, 1,
0.5435835, -1.249317, 1.766524, 1, 1, 1, 1, 1,
0.54561, -0.6689348, 1.813631, 1, 1, 1, 1, 1,
0.5535862, -0.4513785, 2.210405, 1, 1, 1, 1, 1,
0.5539325, -1.47136, 2.682953, 1, 1, 1, 1, 1,
0.5569896, -0.5847959, 1.79145, 0, 0, 1, 1, 1,
0.5604495, -0.9012194, 3.312547, 1, 0, 0, 1, 1,
0.5608028, -0.9366024, 3.067255, 1, 0, 0, 1, 1,
0.5614854, 0.2389714, 1.015592, 1, 0, 0, 1, 1,
0.5631788, 1.723128, 0.5620516, 1, 0, 0, 1, 1,
0.5641384, -0.2813847, 2.548685, 1, 0, 0, 1, 1,
0.5656904, 0.1897731, 0.5941822, 0, 0, 0, 1, 1,
0.5682174, 1.80232, 1.612926, 0, 0, 0, 1, 1,
0.568639, 0.9032271, 1.844907, 0, 0, 0, 1, 1,
0.5705435, -1.120667, 2.193972, 0, 0, 0, 1, 1,
0.5712575, -0.1685028, -0.5161307, 0, 0, 0, 1, 1,
0.5715284, -0.6035451, 2.991411, 0, 0, 0, 1, 1,
0.5735254, 0.5860516, 2.440178, 0, 0, 0, 1, 1,
0.5754284, 1.410272, 0.8445091, 1, 1, 1, 1, 1,
0.5806687, -0.5680471, 1.832593, 1, 1, 1, 1, 1,
0.5817304, -0.09832275, 1.872006, 1, 1, 1, 1, 1,
0.5854478, -0.6836113, 4.620959, 1, 1, 1, 1, 1,
0.5858836, -0.4989763, 0.5778347, 1, 1, 1, 1, 1,
0.5882871, -0.2055733, 3.073524, 1, 1, 1, 1, 1,
0.5927117, 0.02851533, 1.083482, 1, 1, 1, 1, 1,
0.5996942, 0.9428964, 0.4147063, 1, 1, 1, 1, 1,
0.6015149, -1.005536, 1.599743, 1, 1, 1, 1, 1,
0.602342, 0.4835037, 1.516691, 1, 1, 1, 1, 1,
0.6075369, -0.2381875, 2.051847, 1, 1, 1, 1, 1,
0.6111463, 0.5815788, 0.3777368, 1, 1, 1, 1, 1,
0.6123764, 0.7431031, 0.4710551, 1, 1, 1, 1, 1,
0.6147934, 0.3536582, 3.075874, 1, 1, 1, 1, 1,
0.6158388, 0.3694826, 0.1662926, 1, 1, 1, 1, 1,
0.6187127, 2.591275, -0.617101, 0, 0, 1, 1, 1,
0.6277369, 0.08367445, 0.136087, 1, 0, 0, 1, 1,
0.6281423, 0.7641115, 0.6298251, 1, 0, 0, 1, 1,
0.6293052, 0.2192641, 0.8961859, 1, 0, 0, 1, 1,
0.6357484, -0.04882469, 3.25857, 1, 0, 0, 1, 1,
0.6365311, 1.427932, -0.315653, 1, 0, 0, 1, 1,
0.6373623, -0.9766315, 3.178549, 0, 0, 0, 1, 1,
0.6392226, 1.307115, 0.04040733, 0, 0, 0, 1, 1,
0.6429368, -1.502, 1.19741, 0, 0, 0, 1, 1,
0.6473065, -1.131706, 4.050191, 0, 0, 0, 1, 1,
0.6546037, -1.374729, 3.248233, 0, 0, 0, 1, 1,
0.6567161, -0.3354008, 2.11243, 0, 0, 0, 1, 1,
0.6568674, 1.232188, 0.14602, 0, 0, 0, 1, 1,
0.6598026, -0.3643308, 3.527433, 1, 1, 1, 1, 1,
0.6681275, -0.7996994, 3.819851, 1, 1, 1, 1, 1,
0.6744865, -0.3464108, 1.405738, 1, 1, 1, 1, 1,
0.6764312, -1.061497, 1.368712, 1, 1, 1, 1, 1,
0.6787967, 0.1417126, 0.9379243, 1, 1, 1, 1, 1,
0.6915626, -0.9351607, 2.31275, 1, 1, 1, 1, 1,
0.6938314, -0.1247449, 2.061958, 1, 1, 1, 1, 1,
0.7015461, 0.6754054, 2.367238, 1, 1, 1, 1, 1,
0.7068862, 0.5815434, 0.9030765, 1, 1, 1, 1, 1,
0.7083223, 0.9241366, 2.184231, 1, 1, 1, 1, 1,
0.7092057, -0.9551441, 1.746957, 1, 1, 1, 1, 1,
0.7125919, -1.819898, 1.864812, 1, 1, 1, 1, 1,
0.7130896, 2.147805, 0.2528516, 1, 1, 1, 1, 1,
0.7136415, 3.571099, -0.4214719, 1, 1, 1, 1, 1,
0.7143365, 0.3151115, 1.346521, 1, 1, 1, 1, 1,
0.7180325, 0.6467942, 0.2599886, 0, 0, 1, 1, 1,
0.7217125, -0.8945709, 2.418757, 1, 0, 0, 1, 1,
0.7238919, 0.1967723, 1.938049, 1, 0, 0, 1, 1,
0.7240334, -0.007130639, 1.855765, 1, 0, 0, 1, 1,
0.7245872, 0.6209551, 0.06304346, 1, 0, 0, 1, 1,
0.7253031, 0.5116094, 1.355567, 1, 0, 0, 1, 1,
0.7280604, -0.4227802, 1.382972, 0, 0, 0, 1, 1,
0.7303125, -0.7052354, 1.003762, 0, 0, 0, 1, 1,
0.7309044, 0.3490094, -0.01952373, 0, 0, 0, 1, 1,
0.7335492, -0.6911595, 3.412025, 0, 0, 0, 1, 1,
0.7336499, -0.5745249, 2.777977, 0, 0, 0, 1, 1,
0.7402072, 1.91667, 0.5190228, 0, 0, 0, 1, 1,
0.7409613, 2.062007, 0.7947168, 0, 0, 0, 1, 1,
0.7410566, 1.415002, 0.7688041, 1, 1, 1, 1, 1,
0.7473155, 2.226439, 0.6176704, 1, 1, 1, 1, 1,
0.7473159, -0.5456934, 1.352695, 1, 1, 1, 1, 1,
0.7528683, 0.1193802, -0.2136963, 1, 1, 1, 1, 1,
0.7566981, -0.1650897, 2.890435, 1, 1, 1, 1, 1,
0.758953, 0.9024839, -0.3678332, 1, 1, 1, 1, 1,
0.7640118, -0.2336324, 0.3435202, 1, 1, 1, 1, 1,
0.7685528, 0.9830534, 0.8783375, 1, 1, 1, 1, 1,
0.7741831, 0.2610111, 2.617485, 1, 1, 1, 1, 1,
0.7805164, -2.62646, 3.0421, 1, 1, 1, 1, 1,
0.7836721, -0.8668678, 3.278924, 1, 1, 1, 1, 1,
0.7854763, -0.3166183, 1.481587, 1, 1, 1, 1, 1,
0.7896903, -0.6146449, 0.7305549, 1, 1, 1, 1, 1,
0.7936024, -1.46874, 3.743656, 1, 1, 1, 1, 1,
0.7980399, -1.030954, 1.85745, 1, 1, 1, 1, 1,
0.7991281, 0.3315857, 1.752079, 0, 0, 1, 1, 1,
0.8187628, -1.096502, 2.70684, 1, 0, 0, 1, 1,
0.820525, -1.678965, 1.714335, 1, 0, 0, 1, 1,
0.8251123, -0.6266845, 3.771691, 1, 0, 0, 1, 1,
0.8272004, 0.1084668, 0.9558899, 1, 0, 0, 1, 1,
0.8306925, 1.80915, 0.2902674, 1, 0, 0, 1, 1,
0.8314797, -1.512051, 2.654545, 0, 0, 0, 1, 1,
0.8324564, -1.38891, 1.964429, 0, 0, 0, 1, 1,
0.8453683, 1.115621, -0.7373708, 0, 0, 0, 1, 1,
0.8507732, 0.4561738, 1.936873, 0, 0, 0, 1, 1,
0.8538043, -0.3039712, 2.198877, 0, 0, 0, 1, 1,
0.8556468, -0.6109568, 1.485047, 0, 0, 0, 1, 1,
0.8562432, -0.5989575, 1.583435, 0, 0, 0, 1, 1,
0.8568492, 0.8792182, -0.05898936, 1, 1, 1, 1, 1,
0.8605759, 0.6524922, 1.337927, 1, 1, 1, 1, 1,
0.8609353, -0.7333501, 2.156568, 1, 1, 1, 1, 1,
0.8647012, 0.1450378, 1.007448, 1, 1, 1, 1, 1,
0.8651727, 0.7414287, 0.7437511, 1, 1, 1, 1, 1,
0.8656121, 0.9714131, 1.585388, 1, 1, 1, 1, 1,
0.872552, -0.4628726, 2.701273, 1, 1, 1, 1, 1,
0.8788348, -0.6800572, 2.319816, 1, 1, 1, 1, 1,
0.8797116, -0.5171139, 4.619884, 1, 1, 1, 1, 1,
0.8817164, 0.4481409, 1.848787, 1, 1, 1, 1, 1,
0.8817844, -0.97418, 3.399825, 1, 1, 1, 1, 1,
0.883405, -0.7277111, 1.766837, 1, 1, 1, 1, 1,
0.8875282, -0.2483941, 1.775431, 1, 1, 1, 1, 1,
0.8923625, -0.4164475, 1.18763, 1, 1, 1, 1, 1,
0.8939934, 0.028817, 1.035281, 1, 1, 1, 1, 1,
0.8958482, -0.3451628, 3.35223, 0, 0, 1, 1, 1,
0.8974708, -0.3187267, 3.045716, 1, 0, 0, 1, 1,
0.9003752, 2.036243, 0.9084713, 1, 0, 0, 1, 1,
0.9045442, -0.3825356, 1.948889, 1, 0, 0, 1, 1,
0.908455, -0.6670415, 2.62326, 1, 0, 0, 1, 1,
0.9100129, -0.4092294, 4.244301, 1, 0, 0, 1, 1,
0.9106649, 1.606616, 0.4688716, 0, 0, 0, 1, 1,
0.9164214, -1.684264, 1.892304, 0, 0, 0, 1, 1,
0.9176952, -1.037152, 2.911511, 0, 0, 0, 1, 1,
0.9229709, 1.386298, -0.3871452, 0, 0, 0, 1, 1,
0.924832, 0.41667, 0.6787972, 0, 0, 0, 1, 1,
0.9422909, -0.03375864, 2.615719, 0, 0, 0, 1, 1,
0.9434859, -0.1470241, 1.573779, 0, 0, 0, 1, 1,
0.9487746, 0.1653621, 1.637726, 1, 1, 1, 1, 1,
0.9506958, -0.5691636, 2.030991, 1, 1, 1, 1, 1,
0.9545852, -0.192704, 0.1336558, 1, 1, 1, 1, 1,
0.9547703, -0.04519232, 1.127774, 1, 1, 1, 1, 1,
0.9583853, 1.856715, 0.6788172, 1, 1, 1, 1, 1,
0.9583876, -0.7664805, 4.210246, 1, 1, 1, 1, 1,
0.9615125, -0.4967966, 1.142282, 1, 1, 1, 1, 1,
0.9621145, 0.05158323, 1.846482, 1, 1, 1, 1, 1,
0.962576, 0.5456594, 1.390658, 1, 1, 1, 1, 1,
0.9628046, 0.9765943, 0.3068639, 1, 1, 1, 1, 1,
0.9639207, -0.682339, 2.681887, 1, 1, 1, 1, 1,
0.968896, -0.4989249, 1.877126, 1, 1, 1, 1, 1,
0.9690474, 1.272476, 0.05979601, 1, 1, 1, 1, 1,
0.9717005, -0.2467075, 1.541093, 1, 1, 1, 1, 1,
0.9751656, -0.7829421, 1.903831, 1, 1, 1, 1, 1,
0.9795882, -0.6279018, 1.147491, 0, 0, 1, 1, 1,
0.9802746, 1.023443, 0.3283039, 1, 0, 0, 1, 1,
0.9838135, -0.3280339, 1.177098, 1, 0, 0, 1, 1,
0.986981, -0.8531904, 2.451935, 1, 0, 0, 1, 1,
0.9881437, 0.1249065, 0.9145729, 1, 0, 0, 1, 1,
0.9886526, -2.872909, 5.329996, 1, 0, 0, 1, 1,
0.989144, -0.6936306, 2.181382, 0, 0, 0, 1, 1,
0.9961551, -1.876503, 4.104574, 0, 0, 0, 1, 1,
0.9962404, -0.4364997, 1.740544, 0, 0, 0, 1, 1,
0.9967589, -0.5845015, 2.404043, 0, 0, 0, 1, 1,
1.000872, -0.5562919, 1.79761, 0, 0, 0, 1, 1,
1.002872, 0.04880675, 3.01418, 0, 0, 0, 1, 1,
1.003114, 0.1524231, 2.247601, 0, 0, 0, 1, 1,
1.003275, -0.6409788, 0.5114883, 1, 1, 1, 1, 1,
1.005635, -0.6623594, 0.5498908, 1, 1, 1, 1, 1,
1.011683, 0.1398586, 0.6774315, 1, 1, 1, 1, 1,
1.015164, 1.356356, 2.011297, 1, 1, 1, 1, 1,
1.018404, -0.2476023, -0.4224934, 1, 1, 1, 1, 1,
1.018728, 0.7664757, -0.750437, 1, 1, 1, 1, 1,
1.021214, 0.7986156, 0.7263373, 1, 1, 1, 1, 1,
1.027435, -0.52516, 0.6149071, 1, 1, 1, 1, 1,
1.029604, -1.152148, 1.196549, 1, 1, 1, 1, 1,
1.03008, 0.3037738, 2.469416, 1, 1, 1, 1, 1,
1.041159, 1.18219, 0.2873632, 1, 1, 1, 1, 1,
1.045767, 0.6674947, 1.519521, 1, 1, 1, 1, 1,
1.046259, -0.126402, 2.493103, 1, 1, 1, 1, 1,
1.047382, 0.9122033, 0.1954815, 1, 1, 1, 1, 1,
1.051578, 1.46276, 1.651672, 1, 1, 1, 1, 1,
1.058975, -2.481593, 2.901904, 0, 0, 1, 1, 1,
1.05909, -0.3163266, 2.67956, 1, 0, 0, 1, 1,
1.065688, 1.983334, -0.3945157, 1, 0, 0, 1, 1,
1.069338, 1.472384, -0.2429937, 1, 0, 0, 1, 1,
1.083939, -0.1664549, 1.701087, 1, 0, 0, 1, 1,
1.087991, -1.050649, 0.546266, 1, 0, 0, 1, 1,
1.088812, 0.2890905, 1.369273, 0, 0, 0, 1, 1,
1.090391, -0.4302106, 1.882019, 0, 0, 0, 1, 1,
1.095559, -1.857801, 2.047646, 0, 0, 0, 1, 1,
1.106956, -0.3399915, 1.358998, 0, 0, 0, 1, 1,
1.111445, -0.4442474, 2.764525, 0, 0, 0, 1, 1,
1.114255, -0.7154946, 1.937759, 0, 0, 0, 1, 1,
1.116199, -1.812039, 2.457201, 0, 0, 0, 1, 1,
1.119892, 0.5518573, -0.6694403, 1, 1, 1, 1, 1,
1.126509, 0.2637147, 1.47534, 1, 1, 1, 1, 1,
1.128428, 1.34706, 0.5209773, 1, 1, 1, 1, 1,
1.128766, 0.4877843, 0.5964489, 1, 1, 1, 1, 1,
1.129762, 0.1280219, 0.4742273, 1, 1, 1, 1, 1,
1.132238, -1.781025, 1.194475, 1, 1, 1, 1, 1,
1.139836, -1.669435, 2.52796, 1, 1, 1, 1, 1,
1.141885, -0.60496, 2.471413, 1, 1, 1, 1, 1,
1.142909, -2.396683, 2.175097, 1, 1, 1, 1, 1,
1.147236, 0.685936, 0.9947054, 1, 1, 1, 1, 1,
1.150533, 0.7021276, 0.404436, 1, 1, 1, 1, 1,
1.152883, 1.189359, 1.130099, 1, 1, 1, 1, 1,
1.161121, 0.2414294, 0.9856271, 1, 1, 1, 1, 1,
1.172599, 1.373582, 0.9760512, 1, 1, 1, 1, 1,
1.175337, -0.9287512, 3.852105, 1, 1, 1, 1, 1,
1.17666, 1.955517, 1.78579, 0, 0, 1, 1, 1,
1.189676, -0.1886701, 2.230757, 1, 0, 0, 1, 1,
1.195724, 0.08933557, 2.129513, 1, 0, 0, 1, 1,
1.196113, 1.222224, 0.8403933, 1, 0, 0, 1, 1,
1.199309, 0.4284123, 0.2069937, 1, 0, 0, 1, 1,
1.202514, 0.2906995, 2.477694, 1, 0, 0, 1, 1,
1.205402, -0.217254, 2.461105, 0, 0, 0, 1, 1,
1.207944, 0.2793522, 1.500494, 0, 0, 0, 1, 1,
1.224778, 1.748874, -1.196822, 0, 0, 0, 1, 1,
1.226464, 1.034507, 0.1765611, 0, 0, 0, 1, 1,
1.22974, 1.058965, -0.2087041, 0, 0, 0, 1, 1,
1.233204, 0.3609169, 1.262929, 0, 0, 0, 1, 1,
1.240123, 0.08528303, 1.517214, 0, 0, 0, 1, 1,
1.24653, 0.3390311, 0.5678204, 1, 1, 1, 1, 1,
1.249786, -1.331391, 2.881726, 1, 1, 1, 1, 1,
1.250348, 0.1977767, 2.024512, 1, 1, 1, 1, 1,
1.254408, 0.7943526, -0.7487255, 1, 1, 1, 1, 1,
1.26113, -1.891007, 2.614156, 1, 1, 1, 1, 1,
1.264521, -1.551745, 2.633959, 1, 1, 1, 1, 1,
1.265276, -0.4436429, 1.368572, 1, 1, 1, 1, 1,
1.266301, 0.7110932, 2.049278, 1, 1, 1, 1, 1,
1.266975, 1.074291, 1.902339, 1, 1, 1, 1, 1,
1.292291, 0.1092904, 2.778884, 1, 1, 1, 1, 1,
1.295629, 1.411431, 1.868678, 1, 1, 1, 1, 1,
1.296306, 1.258774, -0.5192108, 1, 1, 1, 1, 1,
1.308871, -0.5247968, 1.808679, 1, 1, 1, 1, 1,
1.324562, 0.3416374, 0.8694198, 1, 1, 1, 1, 1,
1.325392, -0.01330159, 1.307675, 1, 1, 1, 1, 1,
1.326278, -1.8088, 3.987864, 0, 0, 1, 1, 1,
1.328107, -2.289846, 2.906398, 1, 0, 0, 1, 1,
1.344263, 1.079001, 0.005310973, 1, 0, 0, 1, 1,
1.35282, -1.375258, 0.8635902, 1, 0, 0, 1, 1,
1.356606, -0.6909879, 0.1034934, 1, 0, 0, 1, 1,
1.359618, 0.5962408, 0.4556459, 1, 0, 0, 1, 1,
1.364843, 0.7944579, 1.442236, 0, 0, 0, 1, 1,
1.371773, 0.1688186, 0.1671252, 0, 0, 0, 1, 1,
1.372784, 0.9711083, -0.5186993, 0, 0, 0, 1, 1,
1.376725, -0.1066802, 1.501117, 0, 0, 0, 1, 1,
1.393384, -0.1383559, 0.661992, 0, 0, 0, 1, 1,
1.396532, 0.6651847, 1.190088, 0, 0, 0, 1, 1,
1.403612, -2.022861, 2.608841, 0, 0, 0, 1, 1,
1.417536, 1.54618, -0.3199744, 1, 1, 1, 1, 1,
1.422989, 1.114894, 1.065642, 1, 1, 1, 1, 1,
1.429103, 2.589236, 0.9081039, 1, 1, 1, 1, 1,
1.434014, -0.3245218, 0.3472035, 1, 1, 1, 1, 1,
1.443003, -1.242683, 2.296871, 1, 1, 1, 1, 1,
1.447447, 0.349649, 2.082036, 1, 1, 1, 1, 1,
1.447969, -1.893528, 1.712763, 1, 1, 1, 1, 1,
1.454683, -0.007291569, 1.701578, 1, 1, 1, 1, 1,
1.459247, -1.425362, 1.36356, 1, 1, 1, 1, 1,
1.464046, -1.426412, 2.276677, 1, 1, 1, 1, 1,
1.478134, 1.456796, 0.8416633, 1, 1, 1, 1, 1,
1.479993, -0.3253973, 0.6835076, 1, 1, 1, 1, 1,
1.481479, -0.6522006, 1.652646, 1, 1, 1, 1, 1,
1.486907, -2.783849, 1.053097, 1, 1, 1, 1, 1,
1.495132, -1.295343, 1.500381, 1, 1, 1, 1, 1,
1.497076, 1.303965, 0.04741614, 0, 0, 1, 1, 1,
1.522299, -0.9886783, 1.074186, 1, 0, 0, 1, 1,
1.544375, -1.221268, 2.57401, 1, 0, 0, 1, 1,
1.545602, -2.111611, 2.296782, 1, 0, 0, 1, 1,
1.548057, -0.5970061, 2.696057, 1, 0, 0, 1, 1,
1.551789, 0.2712013, 2.821158, 1, 0, 0, 1, 1,
1.564263, 0.4435249, 2.87517, 0, 0, 0, 1, 1,
1.588974, 0.6246153, 2.847858, 0, 0, 0, 1, 1,
1.590496, 0.09393061, 0.999891, 0, 0, 0, 1, 1,
1.594831, -0.3355834, 3.483772, 0, 0, 0, 1, 1,
1.596845, 1.971884, -0.06627275, 0, 0, 0, 1, 1,
1.61207, -0.3064877, 1.582128, 0, 0, 0, 1, 1,
1.625289, 0.8148943, 1.427304, 0, 0, 0, 1, 1,
1.648483, -1.294161, 4.243165, 1, 1, 1, 1, 1,
1.649992, -1.974683, 1.734564, 1, 1, 1, 1, 1,
1.670756, 1.264589, 1.43462, 1, 1, 1, 1, 1,
1.674229, 1.324392, -0.2304927, 1, 1, 1, 1, 1,
1.67799, 1.292986, -0.5315382, 1, 1, 1, 1, 1,
1.690753, 0.04194164, -0.4360601, 1, 1, 1, 1, 1,
1.703695, -0.07450256, 4.462533, 1, 1, 1, 1, 1,
1.705869, 1.572187, 0.3291595, 1, 1, 1, 1, 1,
1.708752, -0.3618015, 0.8254067, 1, 1, 1, 1, 1,
1.709351, -1.6119, 1.56713, 1, 1, 1, 1, 1,
1.722327, -1.048825, 1.390354, 1, 1, 1, 1, 1,
1.726964, 0.1558459, 0.1393185, 1, 1, 1, 1, 1,
1.7451, -1.339228, 1.8467, 1, 1, 1, 1, 1,
1.783674, -0.5164416, 1.716962, 1, 1, 1, 1, 1,
1.792375, 0.4620468, 0.5394734, 1, 1, 1, 1, 1,
1.796492, -0.003930909, 1.716897, 0, 0, 1, 1, 1,
1.80529, -0.1514532, 2.255337, 1, 0, 0, 1, 1,
1.811679, -0.8147871, 1.66664, 1, 0, 0, 1, 1,
1.816309, 0.04328876, 2.156163, 1, 0, 0, 1, 1,
1.818647, 0.4510051, 0.8020724, 1, 0, 0, 1, 1,
1.827012, 0.009412476, 2.522229, 1, 0, 0, 1, 1,
1.830393, 0.8359486, 2.217134, 0, 0, 0, 1, 1,
1.837319, 1.458277, -1.327492, 0, 0, 0, 1, 1,
1.838368, 0.3312048, 1.416925, 0, 0, 0, 1, 1,
1.843166, 1.404434, 1.187965, 0, 0, 0, 1, 1,
1.870295, 0.6112127, 2.605599, 0, 0, 0, 1, 1,
1.914212, -1.708206, 4.748816, 0, 0, 0, 1, 1,
1.94778, 0.934852, 0.4113173, 0, 0, 0, 1, 1,
1.949468, -0.3094662, 1.877695, 1, 1, 1, 1, 1,
1.960542, -0.1325167, 1.469503, 1, 1, 1, 1, 1,
1.984579, 1.14186, 1.350749, 1, 1, 1, 1, 1,
1.995854, 0.1095675, -0.3350332, 1, 1, 1, 1, 1,
2.038591, -1.301801, 1.732476, 1, 1, 1, 1, 1,
2.039419, 1.170659, 0.7191381, 1, 1, 1, 1, 1,
2.07123, 0.1031419, 1.616645, 1, 1, 1, 1, 1,
2.071793, -1.751007, 1.529892, 1, 1, 1, 1, 1,
2.08921, -1.005658, 2.971059, 1, 1, 1, 1, 1,
2.09353, -0.2819817, 2.586806, 1, 1, 1, 1, 1,
2.109265, 0.4267517, 1.628199, 1, 1, 1, 1, 1,
2.129577, 0.2844204, 1.766603, 1, 1, 1, 1, 1,
2.137009, -0.4637825, 0.5907062, 1, 1, 1, 1, 1,
2.138281, 0.7249307, 0.3084296, 1, 1, 1, 1, 1,
2.168775, -0.1140158, 2.878422, 1, 1, 1, 1, 1,
2.171869, -1.401235, 2.334131, 0, 0, 1, 1, 1,
2.21135, -0.9070971, 3.664824, 1, 0, 0, 1, 1,
2.212157, -0.6042622, 1.771034, 1, 0, 0, 1, 1,
2.258753, -0.1807768, 2.468535, 1, 0, 0, 1, 1,
2.276982, -0.5408087, 2.966764, 1, 0, 0, 1, 1,
2.277791, -0.2110583, 1.782295, 1, 0, 0, 1, 1,
2.292719, 1.031655, 1.346337, 0, 0, 0, 1, 1,
2.336833, -1.331783, 3.069085, 0, 0, 0, 1, 1,
2.343551, 1.52822, 1.107549, 0, 0, 0, 1, 1,
2.372719, -1.062565, 3.572043, 0, 0, 0, 1, 1,
2.437367, 0.09798001, 2.423343, 0, 0, 0, 1, 1,
2.465592, -1.01096, 1.415859, 0, 0, 0, 1, 1,
2.475266, -0.8731455, 0.9501705, 0, 0, 0, 1, 1,
2.487309, 2.609146, 2.082876, 1, 1, 1, 1, 1,
2.584136, 0.8997877, -0.323856, 1, 1, 1, 1, 1,
2.838444, 0.8669161, 0.0514779, 1, 1, 1, 1, 1,
2.867034, 0.9559692, 2.230056, 1, 1, 1, 1, 1,
2.910633, 1.144545, 0.6628488, 1, 1, 1, 1, 1,
3.418984, 0.2095913, 1.35549, 1, 1, 1, 1, 1,
3.583274, 0.3975218, 3.237636, 1, 1, 1, 1, 1
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
var radius = 9.86072;
var distance = 34.63536;
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
mvMatrix.translate( -0.08292675, -0.309025, 0.1461222 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63536);
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
