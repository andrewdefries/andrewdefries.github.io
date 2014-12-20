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
-2.957859, -0.4477145, -1.79029, 1, 0, 0, 1,
-2.8954, 0.4285, -0.7538936, 1, 0.007843138, 0, 1,
-2.860395, -0.5314287, -2.228424, 1, 0.01176471, 0, 1,
-2.775322, 1.108927, -2.052293, 1, 0.01960784, 0, 1,
-2.520667, 0.4734624, -0.7455246, 1, 0.02352941, 0, 1,
-2.506859, -1.157912, -1.200127, 1, 0.03137255, 0, 1,
-2.42858, 0.1940459, -0.5407084, 1, 0.03529412, 0, 1,
-2.331421, -2.011594, -2.374238, 1, 0.04313726, 0, 1,
-2.292823, 0.5454402, -1.352053, 1, 0.04705882, 0, 1,
-2.265188, 0.04745852, -1.462102, 1, 0.05490196, 0, 1,
-2.25794, 2.116125, 0.7204013, 1, 0.05882353, 0, 1,
-2.240913, 0.9111049, -1.116858, 1, 0.06666667, 0, 1,
-2.221618, 0.2011973, -1.671969, 1, 0.07058824, 0, 1,
-2.206041, 0.8397093, -1.867565, 1, 0.07843138, 0, 1,
-2.193053, 0.3552551, -0.7883441, 1, 0.08235294, 0, 1,
-2.17944, -0.484693, -1.127907, 1, 0.09019608, 0, 1,
-2.13599, 0.5021705, -1.475676, 1, 0.09411765, 0, 1,
-2.104835, 0.8939267, -2.691701, 1, 0.1019608, 0, 1,
-2.102158, 0.3680534, -2.113874, 1, 0.1098039, 0, 1,
-2.101367, -0.8642811, -3.749104, 1, 0.1137255, 0, 1,
-2.078585, 0.2962242, -1.26476, 1, 0.1215686, 0, 1,
-2.029135, -0.7939913, -1.2314, 1, 0.1254902, 0, 1,
-1.958783, 1.035179, -2.375911, 1, 0.1333333, 0, 1,
-1.936846, -0.05960269, -0.8225401, 1, 0.1372549, 0, 1,
-1.912539, -0.8326777, -1.441862, 1, 0.145098, 0, 1,
-1.893231, 0.6250941, -0.1450422, 1, 0.1490196, 0, 1,
-1.879879, -1.399106, -4.208786, 1, 0.1568628, 0, 1,
-1.863687, 0.9585207, -0.1947197, 1, 0.1607843, 0, 1,
-1.862238, -0.1831012, -3.209995, 1, 0.1686275, 0, 1,
-1.861984, -0.3822952, -1.983588, 1, 0.172549, 0, 1,
-1.8568, 2.050157, -0.1436931, 1, 0.1803922, 0, 1,
-1.84899, 0.2639239, -0.6722972, 1, 0.1843137, 0, 1,
-1.827768, 0.8828458, -1.21556, 1, 0.1921569, 0, 1,
-1.82241, 1.906763, -2.468977, 1, 0.1960784, 0, 1,
-1.817906, 1.440697, -0.6009058, 1, 0.2039216, 0, 1,
-1.794853, -0.2339394, -1.223328, 1, 0.2117647, 0, 1,
-1.791795, -0.3835846, -2.169042, 1, 0.2156863, 0, 1,
-1.770354, 1.92712, -1.504104, 1, 0.2235294, 0, 1,
-1.741914, -1.144687, -4.056497, 1, 0.227451, 0, 1,
-1.725413, -0.1672266, -1.30019, 1, 0.2352941, 0, 1,
-1.696339, 0.2391554, -1.589993, 1, 0.2392157, 0, 1,
-1.678397, -0.8606374, -2.944709, 1, 0.2470588, 0, 1,
-1.677936, 0.1905717, -1.604973, 1, 0.2509804, 0, 1,
-1.677731, 1.346457, 0.3029062, 1, 0.2588235, 0, 1,
-1.674379, -0.3911702, -2.503695, 1, 0.2627451, 0, 1,
-1.671578, 0.5081641, 0.01980422, 1, 0.2705882, 0, 1,
-1.668996, -1.750845, -3.070118, 1, 0.2745098, 0, 1,
-1.660176, 0.1493105, -0.5301194, 1, 0.282353, 0, 1,
-1.643278, -0.7030957, -1.910071, 1, 0.2862745, 0, 1,
-1.639274, -0.505088, -0.2974434, 1, 0.2941177, 0, 1,
-1.624285, -1.328905, -1.777112, 1, 0.3019608, 0, 1,
-1.616929, 0.06905869, -3.016, 1, 0.3058824, 0, 1,
-1.604351, -1.307388, -2.929903, 1, 0.3137255, 0, 1,
-1.602239, 0.7860928, -0.1383168, 1, 0.3176471, 0, 1,
-1.600595, -0.3224721, -2.390772, 1, 0.3254902, 0, 1,
-1.594124, -1.962525, -2.099623, 1, 0.3294118, 0, 1,
-1.580581, -0.2007602, -2.51794, 1, 0.3372549, 0, 1,
-1.576273, -0.450716, -1.825356, 1, 0.3411765, 0, 1,
-1.574079, -0.3155208, -2.278535, 1, 0.3490196, 0, 1,
-1.562292, 0.1016169, -0.8590234, 1, 0.3529412, 0, 1,
-1.535884, -1.733626, -2.652822, 1, 0.3607843, 0, 1,
-1.530346, 1.198539, -0.5911241, 1, 0.3647059, 0, 1,
-1.528515, -1.36828, -1.132437, 1, 0.372549, 0, 1,
-1.51808, -2.09766, -2.234656, 1, 0.3764706, 0, 1,
-1.49202, -0.5036824, -1.611581, 1, 0.3843137, 0, 1,
-1.488924, -1.286438, -2.008634, 1, 0.3882353, 0, 1,
-1.484407, 0.4714383, -1.197037, 1, 0.3960784, 0, 1,
-1.482473, 0.2061537, -0.770512, 1, 0.4039216, 0, 1,
-1.475431, 0.6369424, -1.682244, 1, 0.4078431, 0, 1,
-1.471538, -0.2802791, -0.9308979, 1, 0.4156863, 0, 1,
-1.469675, 0.3556684, -2.555613, 1, 0.4196078, 0, 1,
-1.460404, -1.397852, -3.729975, 1, 0.427451, 0, 1,
-1.460353, -0.8642571, -2.146636, 1, 0.4313726, 0, 1,
-1.453126, -0.1643103, -1.120949, 1, 0.4392157, 0, 1,
-1.444761, 0.3069256, -1.66875, 1, 0.4431373, 0, 1,
-1.429873, -0.117839, -0.9930845, 1, 0.4509804, 0, 1,
-1.41762, 1.186234, -0.8796085, 1, 0.454902, 0, 1,
-1.417084, -1.101065, -3.287208, 1, 0.4627451, 0, 1,
-1.407207, -0.03414534, 0.316978, 1, 0.4666667, 0, 1,
-1.40318, 1.647756, -0.7435084, 1, 0.4745098, 0, 1,
-1.403062, 0.8441307, 0.3596247, 1, 0.4784314, 0, 1,
-1.399429, 0.3176626, -1.583781, 1, 0.4862745, 0, 1,
-1.397612, -0.0806578, 0.2968382, 1, 0.4901961, 0, 1,
-1.396178, 0.2525359, -2.406941, 1, 0.4980392, 0, 1,
-1.392759, 1.073231, -0.4710693, 1, 0.5058824, 0, 1,
-1.390869, -1.044423, -1.844698, 1, 0.509804, 0, 1,
-1.388506, -0.7741041, -1.596448, 1, 0.5176471, 0, 1,
-1.379959, -1.188418, -1.488167, 1, 0.5215687, 0, 1,
-1.374923, -1.363623, -1.690704, 1, 0.5294118, 0, 1,
-1.367072, 2.436755, 1.064322, 1, 0.5333334, 0, 1,
-1.366362, 0.4858921, -0.5549142, 1, 0.5411765, 0, 1,
-1.352583, -0.4237745, -0.2232649, 1, 0.5450981, 0, 1,
-1.347894, -1.309844, -3.262137, 1, 0.5529412, 0, 1,
-1.347472, -0.5686903, -1.125252, 1, 0.5568628, 0, 1,
-1.344422, 1.77167, -0.7226915, 1, 0.5647059, 0, 1,
-1.343543, -0.7798246, -2.096605, 1, 0.5686275, 0, 1,
-1.33207, -2.15294, -2.715063, 1, 0.5764706, 0, 1,
-1.329221, 0.5196922, -3.229598, 1, 0.5803922, 0, 1,
-1.327095, -1.540183, -3.567937, 1, 0.5882353, 0, 1,
-1.32602, 0.9129441, -1.662241, 1, 0.5921569, 0, 1,
-1.324463, -0.531493, -2.49835, 1, 0.6, 0, 1,
-1.317514, 0.03684543, -2.238454, 1, 0.6078432, 0, 1,
-1.31298, 0.9748337, -1.381818, 1, 0.6117647, 0, 1,
-1.310093, -2.191346, -3.987507, 1, 0.6196079, 0, 1,
-1.284671, 0.6439876, -1.601832, 1, 0.6235294, 0, 1,
-1.276264, 0.2573772, -0.02149557, 1, 0.6313726, 0, 1,
-1.274389, 0.3865366, -1.307479, 1, 0.6352941, 0, 1,
-1.266877, -1.025715, -2.815694, 1, 0.6431373, 0, 1,
-1.258492, -0.3131072, -2.498744, 1, 0.6470588, 0, 1,
-1.257989, -0.2794026, -0.7304829, 1, 0.654902, 0, 1,
-1.237521, -0.7730604, -2.568013, 1, 0.6588235, 0, 1,
-1.227488, -0.2329048, -0.8691464, 1, 0.6666667, 0, 1,
-1.221981, -0.5634561, -2.461056, 1, 0.6705883, 0, 1,
-1.220349, -1.36185, -2.209997, 1, 0.6784314, 0, 1,
-1.209121, -0.1064042, -2.901258, 1, 0.682353, 0, 1,
-1.204449, 0.3121958, -2.117198, 1, 0.6901961, 0, 1,
-1.202224, -0.321382, -3.203913, 1, 0.6941177, 0, 1,
-1.198172, -0.00831781, -0.6941112, 1, 0.7019608, 0, 1,
-1.196183, -0.2115326, -0.7016085, 1, 0.7098039, 0, 1,
-1.191867, -1.021041, -4.223441, 1, 0.7137255, 0, 1,
-1.190707, -0.8108903, -2.237069, 1, 0.7215686, 0, 1,
-1.186961, 1.325683, -0.3803823, 1, 0.7254902, 0, 1,
-1.181715, -0.7922543, -0.8554346, 1, 0.7333333, 0, 1,
-1.180668, -0.5280071, -1.724143, 1, 0.7372549, 0, 1,
-1.177847, 0.562821, -1.634763, 1, 0.7450981, 0, 1,
-1.156294, -1.455435, -0.2381617, 1, 0.7490196, 0, 1,
-1.148166, 0.2662483, -1.239567, 1, 0.7568628, 0, 1,
-1.140474, 0.5092812, -2.446712, 1, 0.7607843, 0, 1,
-1.136095, -0.6636186, -2.449114, 1, 0.7686275, 0, 1,
-1.135704, -0.6667961, -3.034168, 1, 0.772549, 0, 1,
-1.13476, -0.01870298, -2.584129, 1, 0.7803922, 0, 1,
-1.12878, -0.4019586, -1.724551, 1, 0.7843137, 0, 1,
-1.12749, 2.023374, 0.05020865, 1, 0.7921569, 0, 1,
-1.121199, 0.258725, -1.88932, 1, 0.7960784, 0, 1,
-1.120678, 1.003153, -0.4034703, 1, 0.8039216, 0, 1,
-1.120199, -0.6458006, -2.705573, 1, 0.8117647, 0, 1,
-1.116593, -0.8185936, -2.444991, 1, 0.8156863, 0, 1,
-1.113673, -0.2711302, -1.425327, 1, 0.8235294, 0, 1,
-1.1133, -1.594567, -2.692864, 1, 0.827451, 0, 1,
-1.103418, 0.3133299, -1.848193, 1, 0.8352941, 0, 1,
-1.101287, -0.1909809, -3.137954, 1, 0.8392157, 0, 1,
-1.100621, -1.187556, -2.202917, 1, 0.8470588, 0, 1,
-1.096356, -0.1301697, -1.907035, 1, 0.8509804, 0, 1,
-1.093077, -0.05339814, -3.094848, 1, 0.8588235, 0, 1,
-1.091804, -0.6592737, -3.590141, 1, 0.8627451, 0, 1,
-1.090789, -0.5665535, -2.23869, 1, 0.8705882, 0, 1,
-1.07855, -0.9622501, -2.561747, 1, 0.8745098, 0, 1,
-1.073658, 0.8352998, -0.003075982, 1, 0.8823529, 0, 1,
-1.066598, -0.9304224, -2.69721, 1, 0.8862745, 0, 1,
-1.06486, 1.800188, -0.1197132, 1, 0.8941177, 0, 1,
-1.054565, -0.2944939, -2.702472, 1, 0.8980392, 0, 1,
-1.053319, -0.04961018, -1.6209, 1, 0.9058824, 0, 1,
-1.051824, -0.3167179, -2.622795, 1, 0.9137255, 0, 1,
-1.047496, -0.2875583, -1.522962, 1, 0.9176471, 0, 1,
-1.04662, -0.294403, -2.037859, 1, 0.9254902, 0, 1,
-1.033805, 0.1442503, -2.763225, 1, 0.9294118, 0, 1,
-1.027708, 0.2889607, 0.1637055, 1, 0.9372549, 0, 1,
-1.027472, 1.056354, 0.2069137, 1, 0.9411765, 0, 1,
-1.026828, -0.9894887, -0.6336985, 1, 0.9490196, 0, 1,
-1.026825, -0.3768514, -1.235752, 1, 0.9529412, 0, 1,
-1.023287, -1.901834, -1.943997, 1, 0.9607843, 0, 1,
-1.021653, 0.3498581, -0.7308796, 1, 0.9647059, 0, 1,
-1.020963, -1.32647, -1.659843, 1, 0.972549, 0, 1,
-1.016853, 0.8277475, -1.545152, 1, 0.9764706, 0, 1,
-1.015319, -0.8269979, -1.885832, 1, 0.9843137, 0, 1,
-1.012793, 1.178066, -1.134887, 1, 0.9882353, 0, 1,
-1.000139, 0.2999749, -0.6426267, 1, 0.9960784, 0, 1,
-0.9921109, -2.30659, -2.636434, 0.9960784, 1, 0, 1,
-0.9764716, -0.2560453, -2.808616, 0.9921569, 1, 0, 1,
-0.9727767, -0.210889, -2.429329, 0.9843137, 1, 0, 1,
-0.966818, -0.967076, -0.8743441, 0.9803922, 1, 0, 1,
-0.9658467, 0.1896483, -0.4622967, 0.972549, 1, 0, 1,
-0.9636974, 0.4557991, -0.5923599, 0.9686275, 1, 0, 1,
-0.9627369, -1.307808, -1.918427, 0.9607843, 1, 0, 1,
-0.956087, -1.125237, -0.9516347, 0.9568627, 1, 0, 1,
-0.9557072, -1.791109, -1.2531, 0.9490196, 1, 0, 1,
-0.9525671, 0.3776555, -1.219233, 0.945098, 1, 0, 1,
-0.942156, -0.04350896, -1.951436, 0.9372549, 1, 0, 1,
-0.9416417, 0.2875575, -1.64729, 0.9333333, 1, 0, 1,
-0.9392303, 0.115378, -2.967152, 0.9254902, 1, 0, 1,
-0.9307483, -0.2907421, -0.2585937, 0.9215686, 1, 0, 1,
-0.9267241, 0.008225149, -1.207401, 0.9137255, 1, 0, 1,
-0.9247857, -0.9158289, -1.455268, 0.9098039, 1, 0, 1,
-0.9216855, -0.9687845, -2.308037, 0.9019608, 1, 0, 1,
-0.9026576, -0.2259719, -1.720164, 0.8941177, 1, 0, 1,
-0.9010548, 0.7552155, -1.04932, 0.8901961, 1, 0, 1,
-0.8960943, 0.1648836, -1.549976, 0.8823529, 1, 0, 1,
-0.8940876, -1.040267, -2.434633, 0.8784314, 1, 0, 1,
-0.8855233, 0.2087554, -0.549535, 0.8705882, 1, 0, 1,
-0.8729936, 0.751039, -0.7108033, 0.8666667, 1, 0, 1,
-0.8676301, 0.359097, -3.24019, 0.8588235, 1, 0, 1,
-0.865126, -0.5986613, -2.145438, 0.854902, 1, 0, 1,
-0.8625441, -0.9391657, -3.293133, 0.8470588, 1, 0, 1,
-0.858793, -1.630144, -3.19067, 0.8431373, 1, 0, 1,
-0.8583321, -1.039788, -3.149448, 0.8352941, 1, 0, 1,
-0.8517326, -0.3973959, -1.03208, 0.8313726, 1, 0, 1,
-0.8484566, -0.7921726, -2.135744, 0.8235294, 1, 0, 1,
-0.8437228, -0.3760024, -4.319384, 0.8196079, 1, 0, 1,
-0.8401484, 0.8727884, -1.525931, 0.8117647, 1, 0, 1,
-0.839238, -2.284151, -3.17986, 0.8078431, 1, 0, 1,
-0.8380848, -0.8254513, -4.028259, 0.8, 1, 0, 1,
-0.835883, 0.3565628, -2.260184, 0.7921569, 1, 0, 1,
-0.8341752, -0.02603309, -1.414913, 0.7882353, 1, 0, 1,
-0.8303505, 0.5822249, -1.659033, 0.7803922, 1, 0, 1,
-0.8264832, 0.5019304, 0.2489439, 0.7764706, 1, 0, 1,
-0.82464, 0.08304504, -1.17301, 0.7686275, 1, 0, 1,
-0.8226674, -0.6933067, -1.839733, 0.7647059, 1, 0, 1,
-0.8130821, 0.3484554, -1.251254, 0.7568628, 1, 0, 1,
-0.810078, -0.170359, -2.155866, 0.7529412, 1, 0, 1,
-0.8040743, 0.5095186, -0.7574406, 0.7450981, 1, 0, 1,
-0.800654, 1.066472, 0.05882234, 0.7411765, 1, 0, 1,
-0.7997866, 0.8213032, -0.08036701, 0.7333333, 1, 0, 1,
-0.7986545, 0.3455548, -0.8412047, 0.7294118, 1, 0, 1,
-0.7984031, 0.468351, -2.230733, 0.7215686, 1, 0, 1,
-0.7941331, -2.648316, -3.502431, 0.7176471, 1, 0, 1,
-0.787349, 1.401815, 0.8882031, 0.7098039, 1, 0, 1,
-0.7865824, 3.417445, 1.148576, 0.7058824, 1, 0, 1,
-0.7822928, -0.6840236, -2.968175, 0.6980392, 1, 0, 1,
-0.7819594, -0.1058529, -3.363281, 0.6901961, 1, 0, 1,
-0.7803678, 3.204968, 0.898768, 0.6862745, 1, 0, 1,
-0.7763643, 1.503564, 0.1672306, 0.6784314, 1, 0, 1,
-0.774563, -2.262158, -0.8995168, 0.6745098, 1, 0, 1,
-0.7744702, -0.1659381, -1.957346, 0.6666667, 1, 0, 1,
-0.7739598, 1.60062, -0.4664896, 0.6627451, 1, 0, 1,
-0.7721145, 0.8438686, -1.237817, 0.654902, 1, 0, 1,
-0.7523922, 0.03510325, -1.336141, 0.6509804, 1, 0, 1,
-0.7446624, -0.3312035, -2.08532, 0.6431373, 1, 0, 1,
-0.740665, 1.239575, 1.868525, 0.6392157, 1, 0, 1,
-0.7395394, 0.7342373, -0.8553812, 0.6313726, 1, 0, 1,
-0.7355546, -0.1797397, -1.31626, 0.627451, 1, 0, 1,
-0.7331432, -0.09498917, -1.119136, 0.6196079, 1, 0, 1,
-0.7303072, 0.13835, -0.8346602, 0.6156863, 1, 0, 1,
-0.7292143, 0.7943192, -0.5862938, 0.6078432, 1, 0, 1,
-0.727033, 1.078994, -2.299816, 0.6039216, 1, 0, 1,
-0.725437, 0.8664582, -0.7260321, 0.5960785, 1, 0, 1,
-0.7253653, 0.9022002, -1.246063, 0.5882353, 1, 0, 1,
-0.7241737, -0.3159938, -1.007979, 0.5843138, 1, 0, 1,
-0.7238361, 1.27239, -1.839015, 0.5764706, 1, 0, 1,
-0.7156605, 0.6708376, -0.9953634, 0.572549, 1, 0, 1,
-0.7111478, -0.174444, -2.341282, 0.5647059, 1, 0, 1,
-0.7085382, -1.038917, -2.561418, 0.5607843, 1, 0, 1,
-0.708191, -0.3496515, -3.279345, 0.5529412, 1, 0, 1,
-0.7060723, -2.057691, -3.412847, 0.5490196, 1, 0, 1,
-0.7052277, -0.2672047, -1.713684, 0.5411765, 1, 0, 1,
-0.7020368, -0.07292426, -3.008134, 0.5372549, 1, 0, 1,
-0.6985936, -0.01245412, -2.640579, 0.5294118, 1, 0, 1,
-0.6982875, -0.7195629, -2.490777, 0.5254902, 1, 0, 1,
-0.6956149, 0.4282492, 0.8541989, 0.5176471, 1, 0, 1,
-0.6821002, -0.1966231, -0.6726702, 0.5137255, 1, 0, 1,
-0.6808892, 0.8537521, -0.5517991, 0.5058824, 1, 0, 1,
-0.6798275, -0.3809682, -4.204233, 0.5019608, 1, 0, 1,
-0.6788078, 1.159331, 0.1181534, 0.4941176, 1, 0, 1,
-0.6775601, -0.3146895, -2.041263, 0.4862745, 1, 0, 1,
-0.6771859, 0.2882918, 0.101095, 0.4823529, 1, 0, 1,
-0.6765247, -0.8750919, -3.223948, 0.4745098, 1, 0, 1,
-0.6675358, 0.2667115, -1.858702, 0.4705882, 1, 0, 1,
-0.6664905, 0.3971709, 0.1537475, 0.4627451, 1, 0, 1,
-0.6662115, -0.2469604, -3.733943, 0.4588235, 1, 0, 1,
-0.6604632, -1.950101, -1.875127, 0.4509804, 1, 0, 1,
-0.6590598, 1.143345, -1.425658, 0.4470588, 1, 0, 1,
-0.6577736, 2.31482, 0.8881163, 0.4392157, 1, 0, 1,
-0.64635, 1.478102, 0.3711728, 0.4352941, 1, 0, 1,
-0.6427456, 0.357332, -1.361238, 0.427451, 1, 0, 1,
-0.6402119, -0.06237322, -3.065765, 0.4235294, 1, 0, 1,
-0.6402109, -0.3858588, -0.8095407, 0.4156863, 1, 0, 1,
-0.6398165, -2.317629, -2.166206, 0.4117647, 1, 0, 1,
-0.638436, -0.1964837, -3.043127, 0.4039216, 1, 0, 1,
-0.6290017, 0.2368409, -1.474145, 0.3960784, 1, 0, 1,
-0.6263455, 0.9260988, -1.410959, 0.3921569, 1, 0, 1,
-0.6210942, -0.4455161, -2.061214, 0.3843137, 1, 0, 1,
-0.6152681, -0.01575949, -1.200424, 0.3803922, 1, 0, 1,
-0.6111666, 0.343488, -1.58257, 0.372549, 1, 0, 1,
-0.5918363, 0.09197409, 0.4012262, 0.3686275, 1, 0, 1,
-0.5881181, 0.9659016, -0.7265107, 0.3607843, 1, 0, 1,
-0.584334, -0.2855158, -1.642894, 0.3568628, 1, 0, 1,
-0.5824202, -0.2840613, -2.131155, 0.3490196, 1, 0, 1,
-0.578172, 0.3506795, -1.241196, 0.345098, 1, 0, 1,
-0.5748277, 1.257564, -0.4166199, 0.3372549, 1, 0, 1,
-0.5735169, -0.9151524, -3.826197, 0.3333333, 1, 0, 1,
-0.5731462, 0.5805802, -0.4475932, 0.3254902, 1, 0, 1,
-0.5714658, -1.739915, -3.464994, 0.3215686, 1, 0, 1,
-0.5683429, -0.7051044, -2.328149, 0.3137255, 1, 0, 1,
-0.5646564, -1.495878, -4.436889, 0.3098039, 1, 0, 1,
-0.5479745, -0.5007262, -1.370562, 0.3019608, 1, 0, 1,
-0.5477192, 0.01179158, -2.347418, 0.2941177, 1, 0, 1,
-0.5476086, 0.1838551, -1.062685, 0.2901961, 1, 0, 1,
-0.5365204, 0.388318, -1.69772, 0.282353, 1, 0, 1,
-0.5363675, -0.05892351, -0.424932, 0.2784314, 1, 0, 1,
-0.5347248, -0.841667, -3.36282, 0.2705882, 1, 0, 1,
-0.5327587, -0.2956092, -1.338009, 0.2666667, 1, 0, 1,
-0.5298868, -0.3827335, -2.976403, 0.2588235, 1, 0, 1,
-0.5287892, -0.3360984, -3.725433, 0.254902, 1, 0, 1,
-0.5270663, 1.33466, -0.3503668, 0.2470588, 1, 0, 1,
-0.5177423, -0.4684094, -2.138993, 0.2431373, 1, 0, 1,
-0.514523, 0.3818667, -2.5015, 0.2352941, 1, 0, 1,
-0.5128334, -1.066208, -4.663204, 0.2313726, 1, 0, 1,
-0.5105978, 0.9940373, -0.6162277, 0.2235294, 1, 0, 1,
-0.5074947, -1.268274, -2.444983, 0.2196078, 1, 0, 1,
-0.5062092, -0.9444045, -1.347712, 0.2117647, 1, 0, 1,
-0.504097, 0.009347802, -2.764228, 0.2078431, 1, 0, 1,
-0.5035571, 0.1302991, -0.06342823, 0.2, 1, 0, 1,
-0.5023038, -0.5073959, -3.853199, 0.1921569, 1, 0, 1,
-0.4891891, -0.5608016, -2.88948, 0.1882353, 1, 0, 1,
-0.4884161, -0.3710246, -1.993006, 0.1803922, 1, 0, 1,
-0.4859223, 1.961808, -0.3533832, 0.1764706, 1, 0, 1,
-0.4836639, -1.736776, -4.387307, 0.1686275, 1, 0, 1,
-0.480069, -1.192146, -1.729793, 0.1647059, 1, 0, 1,
-0.4793081, -0.4118532, -2.868524, 0.1568628, 1, 0, 1,
-0.4789843, -0.8958791, -3.090388, 0.1529412, 1, 0, 1,
-0.4772371, 0.9657823, 0.2214946, 0.145098, 1, 0, 1,
-0.467198, -1.058348, -2.509022, 0.1411765, 1, 0, 1,
-0.4627635, 0.8390079, 0.3153773, 0.1333333, 1, 0, 1,
-0.4521901, 0.8549607, -0.1841642, 0.1294118, 1, 0, 1,
-0.4513307, -1.305754, -3.050578, 0.1215686, 1, 0, 1,
-0.4508004, -2.205448, -1.785014, 0.1176471, 1, 0, 1,
-0.4445305, -1.21689, -3.924696, 0.1098039, 1, 0, 1,
-0.4417274, 1.730939, 0.8242031, 0.1058824, 1, 0, 1,
-0.4383407, 1.00671, -0.09988525, 0.09803922, 1, 0, 1,
-0.4382023, -1.382433, -3.370342, 0.09019608, 1, 0, 1,
-0.4378975, -0.0332377, -1.661597, 0.08627451, 1, 0, 1,
-0.4364975, -0.06048711, -1.643156, 0.07843138, 1, 0, 1,
-0.4362448, 0.4998207, -1.366829, 0.07450981, 1, 0, 1,
-0.4362307, -1.27301, -2.400303, 0.06666667, 1, 0, 1,
-0.4260561, 0.9630921, -0.7929449, 0.0627451, 1, 0, 1,
-0.4247186, 2.004796, 0.8575181, 0.05490196, 1, 0, 1,
-0.4218299, -0.4236425, -1.604712, 0.05098039, 1, 0, 1,
-0.4148282, 2.888414, -1.160823, 0.04313726, 1, 0, 1,
-0.4143086, 0.3980928, -0.1328531, 0.03921569, 1, 0, 1,
-0.4112855, 0.707344, 0.06206669, 0.03137255, 1, 0, 1,
-0.4093678, 1.447941, -0.01689748, 0.02745098, 1, 0, 1,
-0.405838, -1.47885, -4.318093, 0.01960784, 1, 0, 1,
-0.4006481, 0.3538032, -1.795291, 0.01568628, 1, 0, 1,
-0.3992801, 0.5542055, 0.1443911, 0.007843138, 1, 0, 1,
-0.3975454, 0.7868715, -0.500668, 0.003921569, 1, 0, 1,
-0.396233, -0.2553612, -4.26382, 0, 1, 0.003921569, 1,
-0.3938649, -1.029508, -0.7191927, 0, 1, 0.01176471, 1,
-0.3927597, -0.8284256, -3.787769, 0, 1, 0.01568628, 1,
-0.3909351, -0.3953432, -3.062745, 0, 1, 0.02352941, 1,
-0.3864768, -0.8875448, -0.8546356, 0, 1, 0.02745098, 1,
-0.3860733, -0.9248987, -2.959292, 0, 1, 0.03529412, 1,
-0.3762755, -0.1388051, -2.219167, 0, 1, 0.03921569, 1,
-0.3761825, -0.8754778, -4.653842, 0, 1, 0.04705882, 1,
-0.3718797, -1.824987, -2.550491, 0, 1, 0.05098039, 1,
-0.3707348, -0.6179299, -2.427875, 0, 1, 0.05882353, 1,
-0.3663754, -0.06255107, 0.3911178, 0, 1, 0.0627451, 1,
-0.3659979, -1.323429, -3.803527, 0, 1, 0.07058824, 1,
-0.3616992, 0.2217704, -0.567296, 0, 1, 0.07450981, 1,
-0.3589467, 0.77473, -1.972529, 0, 1, 0.08235294, 1,
-0.3588401, 1.58842, 0.7567093, 0, 1, 0.08627451, 1,
-0.3565373, 0.2207364, -1.258154, 0, 1, 0.09411765, 1,
-0.3538197, 1.149049, -0.4148408, 0, 1, 0.1019608, 1,
-0.3534119, -1.466632, -2.669285, 0, 1, 0.1058824, 1,
-0.3509477, 0.7247797, -1.125337, 0, 1, 0.1137255, 1,
-0.3494878, -0.6689189, -3.325662, 0, 1, 0.1176471, 1,
-0.3464698, 0.5916545, 0.39743, 0, 1, 0.1254902, 1,
-0.3349374, -1.08563, -3.401335, 0, 1, 0.1294118, 1,
-0.3338374, -0.45037, -4.082011, 0, 1, 0.1372549, 1,
-0.3324469, 1.030637, -0.7790424, 0, 1, 0.1411765, 1,
-0.3317388, -0.7569141, -3.020326, 0, 1, 0.1490196, 1,
-0.3278588, 2.000581, 0.6367429, 0, 1, 0.1529412, 1,
-0.3273299, 1.011992, 2.229574, 0, 1, 0.1607843, 1,
-0.3232505, -0.3961961, -3.716914, 0, 1, 0.1647059, 1,
-0.321597, -1.913851, -1.881099, 0, 1, 0.172549, 1,
-0.3202116, 1.55839, 0.8545671, 0, 1, 0.1764706, 1,
-0.318025, 0.7279877, -1.862178, 0, 1, 0.1843137, 1,
-0.3116108, 0.2542045, -2.419733, 0, 1, 0.1882353, 1,
-0.3097214, 0.1138399, -0.385708, 0, 1, 0.1960784, 1,
-0.3087311, 1.273127, -1.293263, 0, 1, 0.2039216, 1,
-0.3059738, 0.2557903, -4.05559, 0, 1, 0.2078431, 1,
-0.2991125, -0.1296579, -0.9125406, 0, 1, 0.2156863, 1,
-0.297343, -0.9885021, -2.929104, 0, 1, 0.2196078, 1,
-0.2959426, 0.9281573, -0.3248101, 0, 1, 0.227451, 1,
-0.2930837, 0.8318948, 0.5261982, 0, 1, 0.2313726, 1,
-0.2909576, -1.166766, -2.597193, 0, 1, 0.2392157, 1,
-0.2903155, 0.06278262, -1.586747, 0, 1, 0.2431373, 1,
-0.2886508, -0.9074989, -5.008304, 0, 1, 0.2509804, 1,
-0.282716, -1.023894, -1.811956, 0, 1, 0.254902, 1,
-0.2810605, -0.8858609, -4.263266, 0, 1, 0.2627451, 1,
-0.2748908, 0.5226023, -1.563593, 0, 1, 0.2666667, 1,
-0.2667822, 0.5843293, -0.6243059, 0, 1, 0.2745098, 1,
-0.2661862, -0.08407401, -2.641208, 0, 1, 0.2784314, 1,
-0.2651806, 0.2324893, -2.041815, 0, 1, 0.2862745, 1,
-0.2643038, -1.347415, -2.234138, 0, 1, 0.2901961, 1,
-0.2576241, 0.7419828, -0.1089343, 0, 1, 0.2980392, 1,
-0.257517, 1.712564, 0.02176328, 0, 1, 0.3058824, 1,
-0.257318, 1.882244, 1.55227, 0, 1, 0.3098039, 1,
-0.2557791, -1.376616, -3.136585, 0, 1, 0.3176471, 1,
-0.255015, -0.2416406, -3.053301, 0, 1, 0.3215686, 1,
-0.25292, -0.7551608, -1.663152, 0, 1, 0.3294118, 1,
-0.2506546, 0.3406703, -1.519651, 0, 1, 0.3333333, 1,
-0.2463542, 0.4749947, -1.149051, 0, 1, 0.3411765, 1,
-0.2452423, 0.3778982, -0.1987917, 0, 1, 0.345098, 1,
-0.2431657, 0.2594304, -0.1547357, 0, 1, 0.3529412, 1,
-0.2400947, 1.991521, -0.8405306, 0, 1, 0.3568628, 1,
-0.2391696, 0.7650903, 0.817645, 0, 1, 0.3647059, 1,
-0.2372773, -0.3677571, -1.665196, 0, 1, 0.3686275, 1,
-0.2292188, 1.154598, 0.65828, 0, 1, 0.3764706, 1,
-0.2288403, -2.353287, -1.656006, 0, 1, 0.3803922, 1,
-0.2277968, 2.91702e-05, -3.429832, 0, 1, 0.3882353, 1,
-0.2268007, -0.002651874, -1.540428, 0, 1, 0.3921569, 1,
-0.2255462, 0.829214, -1.916483, 0, 1, 0.4, 1,
-0.2249623, -1.049095, -3.682839, 0, 1, 0.4078431, 1,
-0.223421, -0.7589965, -2.545539, 0, 1, 0.4117647, 1,
-0.2233824, -0.60611, -3.992845, 0, 1, 0.4196078, 1,
-0.2216978, 0.2253616, 0.01013893, 0, 1, 0.4235294, 1,
-0.2190621, -0.5252446, -4.067901, 0, 1, 0.4313726, 1,
-0.2155167, -0.8102809, -4.424495, 0, 1, 0.4352941, 1,
-0.2101428, -0.3226886, -2.285176, 0, 1, 0.4431373, 1,
-0.2021471, -1.411071, -0.3399796, 0, 1, 0.4470588, 1,
-0.2019875, 0.565453, 0.5505678, 0, 1, 0.454902, 1,
-0.1972418, -0.5686068, -4.158772, 0, 1, 0.4588235, 1,
-0.1936542, 1.191507, -0.3624469, 0, 1, 0.4666667, 1,
-0.1897177, 0.9658544, -1.393834, 0, 1, 0.4705882, 1,
-0.1843862, 0.7126878, -1.789826, 0, 1, 0.4784314, 1,
-0.183425, -0.2789482, -4.335656, 0, 1, 0.4823529, 1,
-0.1829064, -0.5102555, -3.195978, 0, 1, 0.4901961, 1,
-0.1791091, -0.7694163, -2.08569, 0, 1, 0.4941176, 1,
-0.1788644, 0.7300985, -0.3244292, 0, 1, 0.5019608, 1,
-0.1770207, 1.30464, 0.1109754, 0, 1, 0.509804, 1,
-0.1756269, 1.939293, 0.3500557, 0, 1, 0.5137255, 1,
-0.1735184, 1.610767, -0.0374742, 0, 1, 0.5215687, 1,
-0.1657529, 0.3537563, -0.9230922, 0, 1, 0.5254902, 1,
-0.1653555, -0.7284732, -3.136635, 0, 1, 0.5333334, 1,
-0.1620513, 3.145248, 0.4162899, 0, 1, 0.5372549, 1,
-0.161401, -0.3567141, -3.031478, 0, 1, 0.5450981, 1,
-0.1611806, 0.2574121, -1.440488, 0, 1, 0.5490196, 1,
-0.1604905, -0.8329437, -3.980515, 0, 1, 0.5568628, 1,
-0.159502, 1.998034, 0.7260326, 0, 1, 0.5607843, 1,
-0.158384, 0.1545288, -1.15453, 0, 1, 0.5686275, 1,
-0.1530152, -0.3593172, -2.888843, 0, 1, 0.572549, 1,
-0.1523475, -2.222022, -3.338439, 0, 1, 0.5803922, 1,
-0.1478252, -1.044624, -3.211824, 0, 1, 0.5843138, 1,
-0.1441411, 1.256548, 0.1285253, 0, 1, 0.5921569, 1,
-0.1404194, 0.6765493, 1.355581, 0, 1, 0.5960785, 1,
-0.138816, 1.547404, -0.1908297, 0, 1, 0.6039216, 1,
-0.1378899, -0.6590104, -3.402428, 0, 1, 0.6117647, 1,
-0.1374958, 0.418716, -0.7127217, 0, 1, 0.6156863, 1,
-0.1329387, -1.435803, -1.421299, 0, 1, 0.6235294, 1,
-0.132451, 0.8513373, -1.264559, 0, 1, 0.627451, 1,
-0.1312294, -0.3662107, -2.616291, 0, 1, 0.6352941, 1,
-0.1311021, 0.7913026, -1.955123, 0, 1, 0.6392157, 1,
-0.1309189, 0.9183175, 0.08564755, 0, 1, 0.6470588, 1,
-0.1241302, 0.232161, -1.232036, 0, 1, 0.6509804, 1,
-0.1207155, -0.05456398, -2.567057, 0, 1, 0.6588235, 1,
-0.1194753, 1.617057, -0.7148108, 0, 1, 0.6627451, 1,
-0.1174662, -0.7897055, -3.134789, 0, 1, 0.6705883, 1,
-0.1144677, -0.5324138, -0.7349248, 0, 1, 0.6745098, 1,
-0.1064615, -2.917668, -3.495412, 0, 1, 0.682353, 1,
-0.1039506, -0.1646875, -2.652129, 0, 1, 0.6862745, 1,
-0.1032006, 1.780719, -0.8555794, 0, 1, 0.6941177, 1,
-0.09848066, 0.9339522, 2.077479, 0, 1, 0.7019608, 1,
-0.09361261, 0.7466277, 0.4920885, 0, 1, 0.7058824, 1,
-0.09072325, 1.836999, -0.1080466, 0, 1, 0.7137255, 1,
-0.08946659, -0.9589146, -1.689889, 0, 1, 0.7176471, 1,
-0.08380292, -0.4281588, -1.487803, 0, 1, 0.7254902, 1,
-0.08304504, 0.4921612, 0.1001747, 0, 1, 0.7294118, 1,
-0.08202845, 1.352598, -0.5389153, 0, 1, 0.7372549, 1,
-0.08029716, -2.241576, -4.486396, 0, 1, 0.7411765, 1,
-0.07758097, 0.1076045, -1.427094, 0, 1, 0.7490196, 1,
-0.07671729, 0.003880366, -0.2820419, 0, 1, 0.7529412, 1,
-0.07518489, 0.3366721, 1.786628, 0, 1, 0.7607843, 1,
-0.07467487, 0.4608572, -1.046228, 0, 1, 0.7647059, 1,
-0.07367275, -0.05128407, -1.238387, 0, 1, 0.772549, 1,
-0.07155539, 0.5458903, -0.9569842, 0, 1, 0.7764706, 1,
-0.07126712, -1.738814, -2.568755, 0, 1, 0.7843137, 1,
-0.07110329, -1.619722, -3.610555, 0, 1, 0.7882353, 1,
-0.06841396, -0.03900029, -1.308608, 0, 1, 0.7960784, 1,
-0.06751469, -1.449114, -3.755006, 0, 1, 0.8039216, 1,
-0.06671023, 1.340045, 1.333643, 0, 1, 0.8078431, 1,
-0.06312655, 1.062521, -0.7030007, 0, 1, 0.8156863, 1,
-0.06090954, -1.19913, -1.469197, 0, 1, 0.8196079, 1,
-0.05422193, 0.1099544, -0.02089937, 0, 1, 0.827451, 1,
-0.0487201, -1.662246, -6.236738, 0, 1, 0.8313726, 1,
-0.04858463, -1.42079, -4.498669, 0, 1, 0.8392157, 1,
-0.03965772, 0.0334741, -2.143193, 0, 1, 0.8431373, 1,
-0.03908148, 1.56233, -0.03580191, 0, 1, 0.8509804, 1,
-0.03453948, 1.32363, 0.5286942, 0, 1, 0.854902, 1,
-0.02967164, 1.577354, 1.588796, 0, 1, 0.8627451, 1,
-0.02152631, -0.2955807, -3.642219, 0, 1, 0.8666667, 1,
-0.02049475, -0.2585689, -3.001766, 0, 1, 0.8745098, 1,
-0.01605232, 0.9930604, -0.3971685, 0, 1, 0.8784314, 1,
-0.01388161, 0.1516827, 0.371702, 0, 1, 0.8862745, 1,
-0.01204909, 0.5929933, 1.151618, 0, 1, 0.8901961, 1,
-0.008737439, 0.2833028, -0.5605798, 0, 1, 0.8980392, 1,
-0.003874592, -1.911789, -4.308866, 0, 1, 0.9058824, 1,
-0.0007258463, 0.4887159, -1.316069, 0, 1, 0.9098039, 1,
0.0003579571, 0.6217738, 1.158499, 0, 1, 0.9176471, 1,
0.001768382, 0.5100074, -0.06540608, 0, 1, 0.9215686, 1,
0.004921315, -0.9811493, 4.785014, 0, 1, 0.9294118, 1,
0.009532786, -1.461683, 4.805394, 0, 1, 0.9333333, 1,
0.01394169, -0.7054539, 2.399935, 0, 1, 0.9411765, 1,
0.01493561, -0.4438838, 1.966929, 0, 1, 0.945098, 1,
0.01499816, -0.4403062, 1.067256, 0, 1, 0.9529412, 1,
0.01500289, 0.8634802, 1.006827, 0, 1, 0.9568627, 1,
0.01637427, -0.5898055, 3.793957, 0, 1, 0.9647059, 1,
0.01684485, -1.209875, 3.551898, 0, 1, 0.9686275, 1,
0.01757368, 0.7588221, -0.3741347, 0, 1, 0.9764706, 1,
0.02412491, -0.6532648, 1.969806, 0, 1, 0.9803922, 1,
0.02547832, 0.5390867, -0.3957686, 0, 1, 0.9882353, 1,
0.03207783, 0.6053089, -0.03353047, 0, 1, 0.9921569, 1,
0.03261094, -0.9771792, 5.132106, 0, 1, 1, 1,
0.03956293, -0.6713144, 1.917537, 0, 0.9921569, 1, 1,
0.04361486, -0.1512182, 2.175492, 0, 0.9882353, 1, 1,
0.04583456, 0.1063624, -0.7326063, 0, 0.9803922, 1, 1,
0.04877886, 1.512419, 0.9966952, 0, 0.9764706, 1, 1,
0.05031311, -0.9839171, 5.663869, 0, 0.9686275, 1, 1,
0.05149837, 0.02330092, -0.04476356, 0, 0.9647059, 1, 1,
0.05467141, -0.0089793, 1.729527, 0, 0.9568627, 1, 1,
0.05593818, -0.4607727, 2.262484, 0, 0.9529412, 1, 1,
0.05661022, -1.30746, 0.5280741, 0, 0.945098, 1, 1,
0.05842965, 2.198787, -0.174093, 0, 0.9411765, 1, 1,
0.05971031, 2.279162, 0.6952917, 0, 0.9333333, 1, 1,
0.0617668, 2.238054, -0.9652097, 0, 0.9294118, 1, 1,
0.06394129, 0.7065996, -2.655984, 0, 0.9215686, 1, 1,
0.0644751, 0.410447, 0.5439788, 0, 0.9176471, 1, 1,
0.06995301, 0.004722615, 1.751613, 0, 0.9098039, 1, 1,
0.07195299, -1.917912, 3.003636, 0, 0.9058824, 1, 1,
0.07538109, -0.3171273, 4.711302, 0, 0.8980392, 1, 1,
0.07622005, -1.086453, 2.431396, 0, 0.8901961, 1, 1,
0.07808532, 1.08542, -1.430504, 0, 0.8862745, 1, 1,
0.08098589, 0.5521516, -0.3858551, 0, 0.8784314, 1, 1,
0.08376615, -0.4718917, 4.320019, 0, 0.8745098, 1, 1,
0.08577647, -0.01597475, 1.932162, 0, 0.8666667, 1, 1,
0.08609997, -0.5901036, 3.419281, 0, 0.8627451, 1, 1,
0.08848712, 0.5230014, -0.9260167, 0, 0.854902, 1, 1,
0.09400523, -0.2650351, 2.416863, 0, 0.8509804, 1, 1,
0.09826758, 0.6243416, 0.3092141, 0, 0.8431373, 1, 1,
0.09947493, 0.6087546, 0.5364599, 0, 0.8392157, 1, 1,
0.1090775, -1.000117, 4.549165, 0, 0.8313726, 1, 1,
0.1138876, -0.450709, 1.890137, 0, 0.827451, 1, 1,
0.1164434, -0.7522629, 2.927677, 0, 0.8196079, 1, 1,
0.1196678, 0.6141661, -1.598621, 0, 0.8156863, 1, 1,
0.122266, -3.205921, 2.773466, 0, 0.8078431, 1, 1,
0.1237229, -0.2208413, 3.286646, 0, 0.8039216, 1, 1,
0.125818, -1.429043, 3.898924, 0, 0.7960784, 1, 1,
0.133551, 0.1882931, 1.001312, 0, 0.7882353, 1, 1,
0.1350688, -0.08644804, 3.144046, 0, 0.7843137, 1, 1,
0.1352666, 0.9405019, -2.338987, 0, 0.7764706, 1, 1,
0.1364521, -0.07783628, 1.941553, 0, 0.772549, 1, 1,
0.1386307, 1.410822, 0.7322155, 0, 0.7647059, 1, 1,
0.1435566, 0.5305305, -1.071181, 0, 0.7607843, 1, 1,
0.1436122, -0.9057278, 2.396683, 0, 0.7529412, 1, 1,
0.1436888, -1.222044, 2.56209, 0, 0.7490196, 1, 1,
0.1442889, -0.9408833, 3.211248, 0, 0.7411765, 1, 1,
0.1453764, -0.4693911, 2.078252, 0, 0.7372549, 1, 1,
0.1519899, -0.3016403, 3.073396, 0, 0.7294118, 1, 1,
0.159265, -0.6624722, 3.294052, 0, 0.7254902, 1, 1,
0.1664861, -1.565561, 3.126449, 0, 0.7176471, 1, 1,
0.1692655, 0.1010486, 0.5210199, 0, 0.7137255, 1, 1,
0.1722183, 0.9663677, 1.297683, 0, 0.7058824, 1, 1,
0.1736567, 0.3588963, 0.259549, 0, 0.6980392, 1, 1,
0.1736686, 1.865698, 0.8967636, 0, 0.6941177, 1, 1,
0.1779797, 0.77415, 1.440054, 0, 0.6862745, 1, 1,
0.1828128, -0.8735976, 2.454133, 0, 0.682353, 1, 1,
0.187627, -0.2571875, 2.397867, 0, 0.6745098, 1, 1,
0.1893893, -0.3243988, 2.244507, 0, 0.6705883, 1, 1,
0.1897884, 0.705267, 0.4936495, 0, 0.6627451, 1, 1,
0.1916835, -1.638723, 1.977896, 0, 0.6588235, 1, 1,
0.1920656, 0.3068824, -1.184335, 0, 0.6509804, 1, 1,
0.1938302, 0.756387, 0.7950152, 0, 0.6470588, 1, 1,
0.1955187, 1.531562, 0.2577902, 0, 0.6392157, 1, 1,
0.1961811, -0.07902587, 1.077189, 0, 0.6352941, 1, 1,
0.1974589, -0.9949671, 3.207396, 0, 0.627451, 1, 1,
0.1997168, -2.119271, 3.778068, 0, 0.6235294, 1, 1,
0.2012022, 1.528922, 0.7010973, 0, 0.6156863, 1, 1,
0.2017016, 1.412868, -0.03127925, 0, 0.6117647, 1, 1,
0.2052193, -0.9745448, 1.946836, 0, 0.6039216, 1, 1,
0.2056439, 2.029159, -0.3876759, 0, 0.5960785, 1, 1,
0.205936, -0.7970694, 2.548297, 0, 0.5921569, 1, 1,
0.207015, -0.4475769, 3.206188, 0, 0.5843138, 1, 1,
0.2076046, 0.336861, -0.2259211, 0, 0.5803922, 1, 1,
0.2100169, 0.3777326, 0.7180447, 0, 0.572549, 1, 1,
0.2139461, 0.4070167, -0.936661, 0, 0.5686275, 1, 1,
0.2139481, -0.4230981, 3.021118, 0, 0.5607843, 1, 1,
0.2151176, 1.565632, -1.84362, 0, 0.5568628, 1, 1,
0.2194032, -0.7486259, 0.8632123, 0, 0.5490196, 1, 1,
0.2229275, 0.02724966, 3.050311, 0, 0.5450981, 1, 1,
0.2232409, -0.2948998, 2.150012, 0, 0.5372549, 1, 1,
0.2254127, -0.2241163, 1.44903, 0, 0.5333334, 1, 1,
0.2294263, -0.304361, 1.594536, 0, 0.5254902, 1, 1,
0.2319579, -1.236508, 2.650311, 0, 0.5215687, 1, 1,
0.2320773, -1.439416, 3.228948, 0, 0.5137255, 1, 1,
0.2328587, -0.1377315, 2.015465, 0, 0.509804, 1, 1,
0.2345686, -1.146491, 4.906201, 0, 0.5019608, 1, 1,
0.2387424, 0.40749, 1.43483, 0, 0.4941176, 1, 1,
0.2412652, -1.283009, 0.4982021, 0, 0.4901961, 1, 1,
0.2414887, 0.6936167, -1.35752, 0, 0.4823529, 1, 1,
0.2443831, 0.3519622, 2.243327, 0, 0.4784314, 1, 1,
0.2454841, -2.946572, 2.280282, 0, 0.4705882, 1, 1,
0.249413, 0.2120005, 1.3835, 0, 0.4666667, 1, 1,
0.2495864, 0.4335857, 0.3820148, 0, 0.4588235, 1, 1,
0.2508772, 0.4187469, 1.349055, 0, 0.454902, 1, 1,
0.2518403, -0.1335767, 2.491976, 0, 0.4470588, 1, 1,
0.2536219, -0.05561869, 2.455431, 0, 0.4431373, 1, 1,
0.2536941, 2.73478, 0.0808, 0, 0.4352941, 1, 1,
0.2580297, 1.297426, 1.404241, 0, 0.4313726, 1, 1,
0.2605781, 0.5273453, 1.71117, 0, 0.4235294, 1, 1,
0.2610745, -1.386576, 2.715209, 0, 0.4196078, 1, 1,
0.2639146, 0.4679433, 2.164459, 0, 0.4117647, 1, 1,
0.264733, 0.6622893, 0.2591331, 0, 0.4078431, 1, 1,
0.265815, -1.876099, 3.209869, 0, 0.4, 1, 1,
0.26612, -1.824846, 3.485253, 0, 0.3921569, 1, 1,
0.2707455, -0.3128978, 2.198691, 0, 0.3882353, 1, 1,
0.270962, 0.4728034, -0.1619923, 0, 0.3803922, 1, 1,
0.2715796, 0.5502009, -0.4443309, 0, 0.3764706, 1, 1,
0.2777148, -0.02082315, 1.318702, 0, 0.3686275, 1, 1,
0.2801511, -1.343317, 3.855157, 0, 0.3647059, 1, 1,
0.2805376, 0.6768335, 0.62479, 0, 0.3568628, 1, 1,
0.2844008, 1.020186, 0.1676094, 0, 0.3529412, 1, 1,
0.2875431, 0.001435955, 1.494644, 0, 0.345098, 1, 1,
0.2961133, 0.6271255, 1.009506, 0, 0.3411765, 1, 1,
0.2973695, -0.8067553, 2.322803, 0, 0.3333333, 1, 1,
0.2989292, 0.32665, -0.3259902, 0, 0.3294118, 1, 1,
0.3034122, -0.3857138, 3.619501, 0, 0.3215686, 1, 1,
0.3035359, 1.860515, 0.8759698, 0, 0.3176471, 1, 1,
0.3066924, 0.1402182, 1.192483, 0, 0.3098039, 1, 1,
0.3145848, 0.1056756, 0.7032889, 0, 0.3058824, 1, 1,
0.316839, -1.187237, 1.999275, 0, 0.2980392, 1, 1,
0.3177806, 0.7500421, 0.5665086, 0, 0.2901961, 1, 1,
0.3179834, 1.148293, 0.1522372, 0, 0.2862745, 1, 1,
0.3191086, 0.5457083, 0.9439957, 0, 0.2784314, 1, 1,
0.3204111, -0.4269262, 1.34348, 0, 0.2745098, 1, 1,
0.3213845, 0.7309959, -0.358169, 0, 0.2666667, 1, 1,
0.3254994, 0.4374956, 1.587552, 0, 0.2627451, 1, 1,
0.3282267, -1.480756, 3.604695, 0, 0.254902, 1, 1,
0.3311059, 0.3771663, -0.09906684, 0, 0.2509804, 1, 1,
0.3342189, -0.02595181, 1.384485, 0, 0.2431373, 1, 1,
0.3378657, -0.177321, 2.623297, 0, 0.2392157, 1, 1,
0.3387913, 0.9721487, 1.124624, 0, 0.2313726, 1, 1,
0.3392611, 0.4324128, 1.702449, 0, 0.227451, 1, 1,
0.3392973, 0.2207855, 0.6629255, 0, 0.2196078, 1, 1,
0.3448332, -1.797966, 5.628941, 0, 0.2156863, 1, 1,
0.3481469, 1.780107, -0.04148239, 0, 0.2078431, 1, 1,
0.3541291, 0.6152946, 0.6044571, 0, 0.2039216, 1, 1,
0.356328, -0.6315577, 3.59121, 0, 0.1960784, 1, 1,
0.3565686, -1.085555, 3.956827, 0, 0.1882353, 1, 1,
0.360748, -1.154604, 1.456115, 0, 0.1843137, 1, 1,
0.3618155, -0.0201328, 1.307889, 0, 0.1764706, 1, 1,
0.3686142, 0.1579737, 2.728049, 0, 0.172549, 1, 1,
0.3692462, 2.275737, -0.7907579, 0, 0.1647059, 1, 1,
0.3714184, -0.1903829, 1.371184, 0, 0.1607843, 1, 1,
0.3716908, -0.21532, -0.1312788, 0, 0.1529412, 1, 1,
0.3727654, -1.788845, 1.528346, 0, 0.1490196, 1, 1,
0.376683, 1.6089, 0.1616924, 0, 0.1411765, 1, 1,
0.3809912, -0.7284983, 3.433223, 0, 0.1372549, 1, 1,
0.3810833, -1.703659, 3.2938, 0, 0.1294118, 1, 1,
0.3836687, 1.29546, 1.039505, 0, 0.1254902, 1, 1,
0.386544, 0.9695973, 0.9614012, 0, 0.1176471, 1, 1,
0.3872, 1.163543, 1.143968, 0, 0.1137255, 1, 1,
0.391263, 0.7105116, 0.3877608, 0, 0.1058824, 1, 1,
0.3923399, -0.1393182, -0.2245618, 0, 0.09803922, 1, 1,
0.3925258, -0.9712549, 3.189751, 0, 0.09411765, 1, 1,
0.3952876, 0.287219, 0.9148442, 0, 0.08627451, 1, 1,
0.3969609, 0.6254311, 0.9780847, 0, 0.08235294, 1, 1,
0.3998298, 0.1069267, 0.9244952, 0, 0.07450981, 1, 1,
0.4010401, 0.6215806, 1.59831, 0, 0.07058824, 1, 1,
0.40268, 0.7786709, 1.258051, 0, 0.0627451, 1, 1,
0.4057323, -1.169914, 1.629241, 0, 0.05882353, 1, 1,
0.409429, -0.6370389, 2.576748, 0, 0.05098039, 1, 1,
0.4098886, -0.4202872, 3.355804, 0, 0.04705882, 1, 1,
0.4109668, 0.06447927, 1.410556, 0, 0.03921569, 1, 1,
0.4114303, 1.071847, -0.726206, 0, 0.03529412, 1, 1,
0.4116485, -1.027236, 3.609448, 0, 0.02745098, 1, 1,
0.4179452, 1.17172, 0.4463859, 0, 0.02352941, 1, 1,
0.4179758, -0.8407205, 2.806532, 0, 0.01568628, 1, 1,
0.4182597, -1.849961, 1.959402, 0, 0.01176471, 1, 1,
0.4213987, -0.7233718, 3.560554, 0, 0.003921569, 1, 1,
0.4266177, -2.682168, 0.9915653, 0.003921569, 0, 1, 1,
0.4269215, 0.1246499, 0.5355462, 0.007843138, 0, 1, 1,
0.428212, 1.104968, 0.05333292, 0.01568628, 0, 1, 1,
0.4360568, -0.1905144, 3.362291, 0.01960784, 0, 1, 1,
0.4415512, -0.7776091, 1.51153, 0.02745098, 0, 1, 1,
0.442347, -0.0803607, 1.705534, 0.03137255, 0, 1, 1,
0.4430345, -1.044619, 2.51531, 0.03921569, 0, 1, 1,
0.4454976, 0.7191243, 1.959814, 0.04313726, 0, 1, 1,
0.4520689, -1.090778, 1.774825, 0.05098039, 0, 1, 1,
0.4539508, 2.062728, 2.258593, 0.05490196, 0, 1, 1,
0.4549367, -0.6722397, 1.492304, 0.0627451, 0, 1, 1,
0.4589044, -0.5683982, 2.452843, 0.06666667, 0, 1, 1,
0.4634815, 1.630489, 1.273196, 0.07450981, 0, 1, 1,
0.4647673, 0.3645682, 1.014402, 0.07843138, 0, 1, 1,
0.4652601, 1.363011, 1.298344, 0.08627451, 0, 1, 1,
0.4665855, 0.1909675, 1.698773, 0.09019608, 0, 1, 1,
0.4676695, -0.9360341, 2.950456, 0.09803922, 0, 1, 1,
0.470155, -0.5693783, 3.318464, 0.1058824, 0, 1, 1,
0.4704178, 0.5604638, 1.796404, 0.1098039, 0, 1, 1,
0.4807414, 1.368305, -0.02924316, 0.1176471, 0, 1, 1,
0.4839521, 0.08105284, 1.715982, 0.1215686, 0, 1, 1,
0.4857809, -1.61952, 4.041768, 0.1294118, 0, 1, 1,
0.4869776, 0.1760688, 2.016951, 0.1333333, 0, 1, 1,
0.4918324, 1.003243, 0.3911252, 0.1411765, 0, 1, 1,
0.4937792, 0.9747929, 1.31537, 0.145098, 0, 1, 1,
0.4938458, -0.2042977, 1.04937, 0.1529412, 0, 1, 1,
0.4968354, -0.1492829, 2.101459, 0.1568628, 0, 1, 1,
0.4973528, 0.2054568, 0.6195369, 0.1647059, 0, 1, 1,
0.5007442, -1.315193, 4.332855, 0.1686275, 0, 1, 1,
0.5064878, 0.549422, -1.255804, 0.1764706, 0, 1, 1,
0.5117728, -0.8521966, 1.474722, 0.1803922, 0, 1, 1,
0.5151049, 0.5146928, -0.133514, 0.1882353, 0, 1, 1,
0.5197535, -2.988118, 3.064495, 0.1921569, 0, 1, 1,
0.5243034, 0.1806736, -0.5880361, 0.2, 0, 1, 1,
0.5282513, 0.8887661, 2.351983, 0.2078431, 0, 1, 1,
0.5333874, -0.3238649, 2.189244, 0.2117647, 0, 1, 1,
0.5365424, -0.5352992, 1.522521, 0.2196078, 0, 1, 1,
0.5402454, 1.747715, 0.7169671, 0.2235294, 0, 1, 1,
0.5465499, -0.8578296, 3.286242, 0.2313726, 0, 1, 1,
0.5494785, 0.3802896, 0.8279199, 0.2352941, 0, 1, 1,
0.5560614, 0.9102688, 1.318799, 0.2431373, 0, 1, 1,
0.5596592, 0.6003396, 0.6190903, 0.2470588, 0, 1, 1,
0.5719111, -0.3691173, 2.10078, 0.254902, 0, 1, 1,
0.5758636, 0.5375677, 1.460172, 0.2588235, 0, 1, 1,
0.5847945, -0.613648, 1.988388, 0.2666667, 0, 1, 1,
0.5902703, 0.6683714, 1.462549, 0.2705882, 0, 1, 1,
0.5914328, 0.1308451, 2.407062, 0.2784314, 0, 1, 1,
0.5929376, 0.421584, 0.9042726, 0.282353, 0, 1, 1,
0.5958475, -0.6116168, 0.7558765, 0.2901961, 0, 1, 1,
0.5965396, 1.249294, -0.6168998, 0.2941177, 0, 1, 1,
0.5995023, 1.002305, 0.3285942, 0.3019608, 0, 1, 1,
0.6017238, -0.9515704, 2.010572, 0.3098039, 0, 1, 1,
0.6022404, -0.3941844, 4.734794, 0.3137255, 0, 1, 1,
0.603246, 1.315017, 0.05294628, 0.3215686, 0, 1, 1,
0.6041326, -0.5807493, 2.686265, 0.3254902, 0, 1, 1,
0.6054519, -0.470658, 2.377436, 0.3333333, 0, 1, 1,
0.6058658, -0.9151638, 2.992399, 0.3372549, 0, 1, 1,
0.6060095, -0.9957522, 4.021751, 0.345098, 0, 1, 1,
0.6115392, -0.9267942, 1.10147, 0.3490196, 0, 1, 1,
0.6121109, -0.9025893, 3.74753, 0.3568628, 0, 1, 1,
0.6127468, -0.389141, 1.735122, 0.3607843, 0, 1, 1,
0.6149555, 0.4513616, 1.042109, 0.3686275, 0, 1, 1,
0.6234099, 1.013765, 0.7026113, 0.372549, 0, 1, 1,
0.6249743, 0.9069649, 0.5743076, 0.3803922, 0, 1, 1,
0.6253504, -0.2013129, -0.8442189, 0.3843137, 0, 1, 1,
0.6308025, 1.766053, 1.613218, 0.3921569, 0, 1, 1,
0.6329526, 1.361186, 1.059012, 0.3960784, 0, 1, 1,
0.6390206, 0.3175638, 0.318978, 0.4039216, 0, 1, 1,
0.6395909, 0.09667663, -0.1695451, 0.4117647, 0, 1, 1,
0.6472122, 0.4579874, -0.29151, 0.4156863, 0, 1, 1,
0.6536592, -0.4650369, 2.005061, 0.4235294, 0, 1, 1,
0.6575301, 1.353661, 0.1283635, 0.427451, 0, 1, 1,
0.6581383, 0.04119955, 1.73064, 0.4352941, 0, 1, 1,
0.6600669, -0.1640944, 1.879558, 0.4392157, 0, 1, 1,
0.6606337, 1.099512, 2.47804, 0.4470588, 0, 1, 1,
0.6639271, -1.07719, 2.085068, 0.4509804, 0, 1, 1,
0.6644338, 0.9770854, 0.3280595, 0.4588235, 0, 1, 1,
0.6713554, -1.116316, -0.6024529, 0.4627451, 0, 1, 1,
0.6767796, 0.6005413, 1.743267, 0.4705882, 0, 1, 1,
0.6787588, 0.9787217, 0.3889412, 0.4745098, 0, 1, 1,
0.6792805, 0.9479969, 2.029829, 0.4823529, 0, 1, 1,
0.6799096, -1.497755, 2.578072, 0.4862745, 0, 1, 1,
0.6855594, 0.8927591, -0.6353382, 0.4941176, 0, 1, 1,
0.6978821, 0.2229975, 1.736999, 0.5019608, 0, 1, 1,
0.6978832, 1.626794, 1.576137, 0.5058824, 0, 1, 1,
0.6983263, 0.4322894, 3.257658, 0.5137255, 0, 1, 1,
0.6987315, 0.2815754, 0.1373083, 0.5176471, 0, 1, 1,
0.6995657, 1.085047, 0.3202635, 0.5254902, 0, 1, 1,
0.7006267, -0.4686865, 2.448956, 0.5294118, 0, 1, 1,
0.7015463, 0.551334, 0.7797327, 0.5372549, 0, 1, 1,
0.7019862, 0.5166734, 1.859903, 0.5411765, 0, 1, 1,
0.7037576, 0.861174, -0.6913739, 0.5490196, 0, 1, 1,
0.7098078, -0.7116485, 1.064904, 0.5529412, 0, 1, 1,
0.7131229, 0.5380039, -0.1562139, 0.5607843, 0, 1, 1,
0.7132609, 1.02052, 1.750055, 0.5647059, 0, 1, 1,
0.7162436, -1.709994, 3.088471, 0.572549, 0, 1, 1,
0.7185015, 1.250372, 2.214818, 0.5764706, 0, 1, 1,
0.7196316, 0.8821059, 0.7700444, 0.5843138, 0, 1, 1,
0.7200266, -0.6514258, 3.554559, 0.5882353, 0, 1, 1,
0.7246069, -0.9773787, 1.763324, 0.5960785, 0, 1, 1,
0.7334897, -0.7447313, 2.66446, 0.6039216, 0, 1, 1,
0.7337214, 2.091245, 0.3724095, 0.6078432, 0, 1, 1,
0.7442905, -1.030198, 0.9284536, 0.6156863, 0, 1, 1,
0.7451909, -0.4954056, 2.532851, 0.6196079, 0, 1, 1,
0.7498989, -0.05827174, 2.251454, 0.627451, 0, 1, 1,
0.7516049, 0.8136708, 1.396418, 0.6313726, 0, 1, 1,
0.754135, -0.5740039, 3.088236, 0.6392157, 0, 1, 1,
0.7541665, 0.270733, 2.210336, 0.6431373, 0, 1, 1,
0.7604067, 1.256686, 1.587562, 0.6509804, 0, 1, 1,
0.7636397, 0.8445975, 0.3484345, 0.654902, 0, 1, 1,
0.7643994, -0.1032406, 1.081708, 0.6627451, 0, 1, 1,
0.7717856, 0.5052952, 1.726347, 0.6666667, 0, 1, 1,
0.7759047, 0.09966159, 3.067978, 0.6745098, 0, 1, 1,
0.776157, 1.146611, 0.1833979, 0.6784314, 0, 1, 1,
0.7798918, 0.1402875, 3.902405, 0.6862745, 0, 1, 1,
0.7800021, 0.3032149, -0.3149455, 0.6901961, 0, 1, 1,
0.7815812, 0.5898181, 0.002463342, 0.6980392, 0, 1, 1,
0.7845943, 1.876944, 2.984259, 0.7058824, 0, 1, 1,
0.7853447, 0.40558, -0.7931594, 0.7098039, 0, 1, 1,
0.7966816, 0.1709501, 1.38578, 0.7176471, 0, 1, 1,
0.7975709, 0.08696288, 1.337829, 0.7215686, 0, 1, 1,
0.8015568, 0.4608743, 1.469997, 0.7294118, 0, 1, 1,
0.8019125, 0.1759028, 0.5814195, 0.7333333, 0, 1, 1,
0.8026316, -0.7710103, 3.216344, 0.7411765, 0, 1, 1,
0.8186234, 0.8430182, 0.7140226, 0.7450981, 0, 1, 1,
0.8206456, 1.755748, 0.4808498, 0.7529412, 0, 1, 1,
0.823383, -0.9671282, 2.715128, 0.7568628, 0, 1, 1,
0.825669, 1.108056, 1.099833, 0.7647059, 0, 1, 1,
0.8353593, 0.1443135, 2.670069, 0.7686275, 0, 1, 1,
0.8367275, -0.2620555, 3.770506, 0.7764706, 0, 1, 1,
0.8387892, 1.146048, 0.6861969, 0.7803922, 0, 1, 1,
0.8408903, -0.1811911, 4.042357, 0.7882353, 0, 1, 1,
0.8593208, 0.7851246, -1.554246, 0.7921569, 0, 1, 1,
0.8597711, 0.7253544, -0.02507236, 0.8, 0, 1, 1,
0.8654507, 1.679416, 0.6110079, 0.8078431, 0, 1, 1,
0.8676116, -0.2296646, 2.074002, 0.8117647, 0, 1, 1,
0.8711837, 2.382356, 0.7368505, 0.8196079, 0, 1, 1,
0.8732545, -0.561134, 1.043592, 0.8235294, 0, 1, 1,
0.8777916, -0.3707173, 0.7803425, 0.8313726, 0, 1, 1,
0.880495, -0.003407973, 0.861623, 0.8352941, 0, 1, 1,
0.8865536, 0.531278, 0.6604566, 0.8431373, 0, 1, 1,
0.8914104, 0.4196452, 0.7881659, 0.8470588, 0, 1, 1,
0.8929566, 0.7356098, 0.7981486, 0.854902, 0, 1, 1,
0.8953997, -0.6668133, 1.691949, 0.8588235, 0, 1, 1,
0.8965709, -0.6196841, 3.891991, 0.8666667, 0, 1, 1,
0.8987642, 0.3859296, 0.5704362, 0.8705882, 0, 1, 1,
0.904373, 0.539003, 0.9619921, 0.8784314, 0, 1, 1,
0.9058656, 0.3325181, 0.2331736, 0.8823529, 0, 1, 1,
0.9093643, -0.4937648, 1.390119, 0.8901961, 0, 1, 1,
0.9163877, 0.01543421, 2.066985, 0.8941177, 0, 1, 1,
0.920211, -1.393973, 0.3964013, 0.9019608, 0, 1, 1,
0.9215773, -0.1291642, 3.107687, 0.9098039, 0, 1, 1,
0.9310008, -2.03452, 1.743016, 0.9137255, 0, 1, 1,
0.9385208, 1.611103, -0.1094912, 0.9215686, 0, 1, 1,
0.9475754, 0.2361368, 0.7712363, 0.9254902, 0, 1, 1,
0.9486318, 0.2374164, 1.740908, 0.9333333, 0, 1, 1,
0.9564157, -0.3080859, 1.641778, 0.9372549, 0, 1, 1,
0.9689999, 1.781634, -1.668078, 0.945098, 0, 1, 1,
0.9714575, 0.247777, 0.4711854, 0.9490196, 0, 1, 1,
0.9861493, -0.9476257, 2.799674, 0.9568627, 0, 1, 1,
0.9899288, 0.4767595, 0.2164142, 0.9607843, 0, 1, 1,
0.9900386, 1.338582, 1.685903, 0.9686275, 0, 1, 1,
0.9991556, -1.201337, 1.44965, 0.972549, 0, 1, 1,
1.003572, -0.3000318, -0.1579011, 0.9803922, 0, 1, 1,
1.003856, 0.5100731, 1.768111, 0.9843137, 0, 1, 1,
1.00393, -0.3600291, 1.263928, 0.9921569, 0, 1, 1,
1.01363, 1.057617, 0.510853, 0.9960784, 0, 1, 1,
1.015382, 0.1056646, 1.332941, 1, 0, 0.9960784, 1,
1.021905, 1.585836, 1.128741, 1, 0, 0.9882353, 1,
1.024902, -0.1368355, 0.9112376, 1, 0, 0.9843137, 1,
1.027337, -0.960985, 1.939685, 1, 0, 0.9764706, 1,
1.036739, 0.7795511, 1.560731, 1, 0, 0.972549, 1,
1.041452, -0.4743174, 1.695033, 1, 0, 0.9647059, 1,
1.04171, -0.653578, 2.076057, 1, 0, 0.9607843, 1,
1.042694, 0.1360913, 0.1750918, 1, 0, 0.9529412, 1,
1.047659, -0.4676659, 1.284457, 1, 0, 0.9490196, 1,
1.053839, -0.4180994, 2.295082, 1, 0, 0.9411765, 1,
1.054736, 0.09136316, 2.18006, 1, 0, 0.9372549, 1,
1.068704, 0.8406537, 0.5774617, 1, 0, 0.9294118, 1,
1.072687, -1.910596, 2.624972, 1, 0, 0.9254902, 1,
1.073248, 0.2780827, 1.648548, 1, 0, 0.9176471, 1,
1.073294, 0.1374828, 1.436193, 1, 0, 0.9137255, 1,
1.077284, 0.6964046, -1.740955, 1, 0, 0.9058824, 1,
1.078359, 0.5920386, 2.074718, 1, 0, 0.9019608, 1,
1.087398, 0.5334047, 1.661693, 1, 0, 0.8941177, 1,
1.088718, -0.3439359, 0.8005707, 1, 0, 0.8862745, 1,
1.093115, 0.6756776, 3.456502, 1, 0, 0.8823529, 1,
1.093253, -0.005329143, 0.8968833, 1, 0, 0.8745098, 1,
1.105141, -0.09015641, 1.665921, 1, 0, 0.8705882, 1,
1.105386, 1.38076, 0.5658271, 1, 0, 0.8627451, 1,
1.10595, -0.4172406, 1.903306, 1, 0, 0.8588235, 1,
1.115904, -0.5647655, 0.5245178, 1, 0, 0.8509804, 1,
1.136527, -0.7663941, 3.19749, 1, 0, 0.8470588, 1,
1.144341, -1.650377, 2.254812, 1, 0, 0.8392157, 1,
1.145967, -2.624018, 2.488183, 1, 0, 0.8352941, 1,
1.147026, -0.1940035, 1.832862, 1, 0, 0.827451, 1,
1.158406, 1.668353, 0.67727, 1, 0, 0.8235294, 1,
1.162853, -0.4220011, 0.9424535, 1, 0, 0.8156863, 1,
1.164157, 0.4674056, 0.2349946, 1, 0, 0.8117647, 1,
1.168087, 0.370418, 0.9512093, 1, 0, 0.8039216, 1,
1.172159, 0.04957955, 1.112457, 1, 0, 0.7960784, 1,
1.173974, 0.4621388, 1.396824, 1, 0, 0.7921569, 1,
1.179435, 0.9132898, -0.406249, 1, 0, 0.7843137, 1,
1.182818, -0.5143377, 3.716655, 1, 0, 0.7803922, 1,
1.190342, -0.030574, 0.5636513, 1, 0, 0.772549, 1,
1.195379, 0.6479686, 1.194923, 1, 0, 0.7686275, 1,
1.199054, 0.472997, -0.3058498, 1, 0, 0.7607843, 1,
1.203226, -0.1189386, 1.606635, 1, 0, 0.7568628, 1,
1.207973, 1.509672, 0.9950595, 1, 0, 0.7490196, 1,
1.216442, 1.139939, 1.387447, 1, 0, 0.7450981, 1,
1.225031, 0.5691578, 1.228252, 1, 0, 0.7372549, 1,
1.230032, -0.2280811, 1.872228, 1, 0, 0.7333333, 1,
1.230591, -0.5435095, 2.427518, 1, 0, 0.7254902, 1,
1.233492, 1.054356, 1.154642, 1, 0, 0.7215686, 1,
1.237987, -0.7527607, 1.546759, 1, 0, 0.7137255, 1,
1.249562, 0.5223537, 1.23989, 1, 0, 0.7098039, 1,
1.252255, 0.9747655, -0.9519578, 1, 0, 0.7019608, 1,
1.257057, 0.9602396, 0.2587204, 1, 0, 0.6941177, 1,
1.268749, 1.525466, -0.4459119, 1, 0, 0.6901961, 1,
1.270163, -1.125476, 3.347843, 1, 0, 0.682353, 1,
1.278258, 0.03910272, 1.328007, 1, 0, 0.6784314, 1,
1.290344, -0.6262134, 2.553638, 1, 0, 0.6705883, 1,
1.291064, 0.6049627, 0.4855591, 1, 0, 0.6666667, 1,
1.2933, -0.1022305, 2.569866, 1, 0, 0.6588235, 1,
1.303554, 0.6150676, 1.668435, 1, 0, 0.654902, 1,
1.303851, 1.889269, 2.053818, 1, 0, 0.6470588, 1,
1.304496, -1.185928, 2.321217, 1, 0, 0.6431373, 1,
1.329227, -1.259004, 2.100213, 1, 0, 0.6352941, 1,
1.330934, 0.5394853, 0.7314481, 1, 0, 0.6313726, 1,
1.336327, 0.8664407, 0.9264267, 1, 0, 0.6235294, 1,
1.342264, 1.103745, -1.015052, 1, 0, 0.6196079, 1,
1.350808, -1.282713, 2.68806, 1, 0, 0.6117647, 1,
1.354766, 1.010586, 0.4618673, 1, 0, 0.6078432, 1,
1.362709, -0.553234, 2.07508, 1, 0, 0.6, 1,
1.368267, 1.306556, -0.003283358, 1, 0, 0.5921569, 1,
1.371514, -1.642091, 3.900958, 1, 0, 0.5882353, 1,
1.3781, -0.5902042, 4.112784, 1, 0, 0.5803922, 1,
1.39381, 0.5632388, 1.549383, 1, 0, 0.5764706, 1,
1.426415, -0.5258927, 0.9228739, 1, 0, 0.5686275, 1,
1.427917, -0.5642699, 1.911208, 1, 0, 0.5647059, 1,
1.438304, 0.1136068, 3.096144, 1, 0, 0.5568628, 1,
1.442762, -1.25209, 2.693227, 1, 0, 0.5529412, 1,
1.444109, 1.915853, -0.158827, 1, 0, 0.5450981, 1,
1.445112, 0.3224683, 1.221851, 1, 0, 0.5411765, 1,
1.449213, 0.8073489, 1.132284, 1, 0, 0.5333334, 1,
1.451798, 3.157199, 0.9163117, 1, 0, 0.5294118, 1,
1.453561, 1.350054, 1.85166, 1, 0, 0.5215687, 1,
1.481364, 1.507766, -1.474623, 1, 0, 0.5176471, 1,
1.49532, 1.623165, -1.595664, 1, 0, 0.509804, 1,
1.497423, 1.030003, 0.4123221, 1, 0, 0.5058824, 1,
1.499243, 0.1337992, 2.695145, 1, 0, 0.4980392, 1,
1.507955, 0.4361016, 2.589975, 1, 0, 0.4901961, 1,
1.52045, -1.422571, 1.81097, 1, 0, 0.4862745, 1,
1.536534, 0.8365957, 2.294215, 1, 0, 0.4784314, 1,
1.537291, -0.972208, 2.133932, 1, 0, 0.4745098, 1,
1.539239, -0.1202257, 1.268945, 1, 0, 0.4666667, 1,
1.547537, -0.1602675, 3.196203, 1, 0, 0.4627451, 1,
1.553195, 0.5431191, 0.6381467, 1, 0, 0.454902, 1,
1.567628, -0.9146905, 3.078971, 1, 0, 0.4509804, 1,
1.577198, 0.2358822, 2.249244, 1, 0, 0.4431373, 1,
1.578171, -0.5184905, 2.235853, 1, 0, 0.4392157, 1,
1.579228, -0.1171521, -1.694134, 1, 0, 0.4313726, 1,
1.592229, -0.6999062, 4.4188, 1, 0, 0.427451, 1,
1.60492, -0.3798914, 0.9824318, 1, 0, 0.4196078, 1,
1.613551, -0.1938171, 2.002898, 1, 0, 0.4156863, 1,
1.615447, 1.194626, 2.568828, 1, 0, 0.4078431, 1,
1.616124, 1.834571, 2.716439, 1, 0, 0.4039216, 1,
1.624378, 0.8274777, -0.07974828, 1, 0, 0.3960784, 1,
1.631343, -0.6185739, 0.9624791, 1, 0, 0.3882353, 1,
1.638798, -1.127376, 2.253356, 1, 0, 0.3843137, 1,
1.640077, 1.87082, 1.223513, 1, 0, 0.3764706, 1,
1.648323, -0.6530975, 1.3511, 1, 0, 0.372549, 1,
1.650349, -1.322699, 3.093875, 1, 0, 0.3647059, 1,
1.652611, -1.370908, 4.028942, 1, 0, 0.3607843, 1,
1.652826, -0.8513728, 2.216055, 1, 0, 0.3529412, 1,
1.665073, 1.309968, 0.8233446, 1, 0, 0.3490196, 1,
1.675827, -0.4025543, 2.096133, 1, 0, 0.3411765, 1,
1.676776, -0.4264357, 0.9498691, 1, 0, 0.3372549, 1,
1.688498, -0.1370995, 2.608735, 1, 0, 0.3294118, 1,
1.695099, -1.77297, 1.07013, 1, 0, 0.3254902, 1,
1.698493, 0.9374951, 1.324163, 1, 0, 0.3176471, 1,
1.69991, -1.161456, 2.347637, 1, 0, 0.3137255, 1,
1.702203, 1.109561, 1.988773, 1, 0, 0.3058824, 1,
1.703181, -1.084677, 3.454796, 1, 0, 0.2980392, 1,
1.711622, 0.5121158, 1.769881, 1, 0, 0.2941177, 1,
1.722561, 0.490925, 1.071105, 1, 0, 0.2862745, 1,
1.722992, -1.225364, 3.272716, 1, 0, 0.282353, 1,
1.725999, 1.062658, 1.959361, 1, 0, 0.2745098, 1,
1.728578, -0.03650019, 3.553714, 1, 0, 0.2705882, 1,
1.744007, 1.666651, 0.07651799, 1, 0, 0.2627451, 1,
1.745871, -0.6545183, 3.098727, 1, 0, 0.2588235, 1,
1.756557, 0.4117307, 1.773423, 1, 0, 0.2509804, 1,
1.766482, -0.5151694, 2.612249, 1, 0, 0.2470588, 1,
1.789615, -0.2271377, 3.556107, 1, 0, 0.2392157, 1,
1.79615, 0.05324527, -0.2721457, 1, 0, 0.2352941, 1,
1.824911, -0.2892939, 1.151182, 1, 0, 0.227451, 1,
1.837114, 0.747935, 1.835896, 1, 0, 0.2235294, 1,
1.838645, -0.1418371, 0.2190581, 1, 0, 0.2156863, 1,
1.844226, 2.352675, 0.9060356, 1, 0, 0.2117647, 1,
1.856347, 1.482159, 1.623265, 1, 0, 0.2039216, 1,
1.867465, 1.399385, 0.1292474, 1, 0, 0.1960784, 1,
1.876274, 0.2583196, 1.224578, 1, 0, 0.1921569, 1,
1.895172, 1.468241, 0.9490442, 1, 0, 0.1843137, 1,
1.95971, -0.6147406, 2.436423, 1, 0, 0.1803922, 1,
1.965581, 0.3722425, 2.745823, 1, 0, 0.172549, 1,
1.975469, -1.038599, 1.700145, 1, 0, 0.1686275, 1,
1.990796, -0.8877913, 4.624708, 1, 0, 0.1607843, 1,
1.999032, -0.5165176, 1.189935, 1, 0, 0.1568628, 1,
2.004897, -0.986661, -0.09654196, 1, 0, 0.1490196, 1,
2.011714, 0.8879706, 2.096619, 1, 0, 0.145098, 1,
2.034056, -0.5753115, 0.7615688, 1, 0, 0.1372549, 1,
2.055669, -1.28151, 2.362409, 1, 0, 0.1333333, 1,
2.059431, -0.2422756, 2.456921, 1, 0, 0.1254902, 1,
2.087603, -1.106715, 2.502399, 1, 0, 0.1215686, 1,
2.093642, 0.1688474, -1.475012, 1, 0, 0.1137255, 1,
2.117612, 0.2699673, 2.444454, 1, 0, 0.1098039, 1,
2.170127, 0.09853506, 0.7919625, 1, 0, 0.1019608, 1,
2.179985, -1.44456, 3.461896, 1, 0, 0.09411765, 1,
2.207297, -1.430344, 1.965431, 1, 0, 0.09019608, 1,
2.216743, -0.664938, 2.826546, 1, 0, 0.08235294, 1,
2.219825, -0.8547519, 2.915286, 1, 0, 0.07843138, 1,
2.22497, -0.2931768, 0.2102792, 1, 0, 0.07058824, 1,
2.248662, -0.7222912, 2.680639, 1, 0, 0.06666667, 1,
2.253406, -1.770308, 3.471532, 1, 0, 0.05882353, 1,
2.263464, 0.7254585, 1.028224, 1, 0, 0.05490196, 1,
2.264495, 0.9996371, -0.003371913, 1, 0, 0.04705882, 1,
2.276331, 0.9746701, 0.7253608, 1, 0, 0.04313726, 1,
2.315783, 0.5023708, 0.7916542, 1, 0, 0.03529412, 1,
2.511786, 0.2557779, 1.00195, 1, 0, 0.03137255, 1,
2.687467, 0.2158613, 1.466722, 1, 0, 0.02352941, 1,
3.051011, 0.1340439, 2.434842, 1, 0, 0.01960784, 1,
3.153392, -1.713336, 1.674691, 1, 0, 0.01176471, 1,
3.479919, 0.6781763, 1.512303, 1, 0, 0.007843138, 1
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
0.2610304, -4.328581, -8.253891, 0, -0.5, 0.5, 0.5,
0.2610304, -4.328581, -8.253891, 1, -0.5, 0.5, 0.5,
0.2610304, -4.328581, -8.253891, 1, 1.5, 0.5, 0.5,
0.2610304, -4.328581, -8.253891, 0, 1.5, 0.5, 0.5
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
-4.049062, 0.1057622, -8.253891, 0, -0.5, 0.5, 0.5,
-4.049062, 0.1057622, -8.253891, 1, -0.5, 0.5, 0.5,
-4.049062, 0.1057622, -8.253891, 1, 1.5, 0.5, 0.5,
-4.049062, 0.1057622, -8.253891, 0, 1.5, 0.5, 0.5
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
-4.049062, -4.328581, -0.2864344, 0, -0.5, 0.5, 0.5,
-4.049062, -4.328581, -0.2864344, 1, -0.5, 0.5, 0.5,
-4.049062, -4.328581, -0.2864344, 1, 1.5, 0.5, 0.5,
-4.049062, -4.328581, -0.2864344, 0, 1.5, 0.5, 0.5
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
-2, -3.305271, -6.415247,
3, -3.305271, -6.415247,
-2, -3.305271, -6.415247,
-2, -3.475823, -6.721688,
-1, -3.305271, -6.415247,
-1, -3.475823, -6.721688,
0, -3.305271, -6.415247,
0, -3.475823, -6.721688,
1, -3.305271, -6.415247,
1, -3.475823, -6.721688,
2, -3.305271, -6.415247,
2, -3.475823, -6.721688,
3, -3.305271, -6.415247,
3, -3.475823, -6.721688
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
-2, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
-2, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
-2, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
-2, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5,
-1, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
-1, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
-1, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
-1, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5,
0, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
0, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
0, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
0, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5,
1, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
1, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
1, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
1, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5,
2, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
2, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
2, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
2, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5,
3, -3.816926, -7.334569, 0, -0.5, 0.5, 0.5,
3, -3.816926, -7.334569, 1, -0.5, 0.5, 0.5,
3, -3.816926, -7.334569, 1, 1.5, 0.5, 0.5,
3, -3.816926, -7.334569, 0, 1.5, 0.5, 0.5
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
-3.054425, -3, -6.415247,
-3.054425, 3, -6.415247,
-3.054425, -3, -6.415247,
-3.220198, -3, -6.721688,
-3.054425, -2, -6.415247,
-3.220198, -2, -6.721688,
-3.054425, -1, -6.415247,
-3.220198, -1, -6.721688,
-3.054425, 0, -6.415247,
-3.220198, 0, -6.721688,
-3.054425, 1, -6.415247,
-3.220198, 1, -6.721688,
-3.054425, 2, -6.415247,
-3.220198, 2, -6.721688,
-3.054425, 3, -6.415247,
-3.220198, 3, -6.721688
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
-3.551744, -3, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, -3, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, -3, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, -3, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, -2, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, -2, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, -2, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, -2, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, -1, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, -1, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, -1, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, -1, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, 0, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, 0, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, 0, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, 0, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, 1, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, 1, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, 1, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, 1, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, 2, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, 2, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, 2, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, 2, -7.334569, 0, 1.5, 0.5, 0.5,
-3.551744, 3, -7.334569, 0, -0.5, 0.5, 0.5,
-3.551744, 3, -7.334569, 1, -0.5, 0.5, 0.5,
-3.551744, 3, -7.334569, 1, 1.5, 0.5, 0.5,
-3.551744, 3, -7.334569, 0, 1.5, 0.5, 0.5
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
-3.054425, -3.305271, -6,
-3.054425, -3.305271, 4,
-3.054425, -3.305271, -6,
-3.220198, -3.475823, -6,
-3.054425, -3.305271, -4,
-3.220198, -3.475823, -4,
-3.054425, -3.305271, -2,
-3.220198, -3.475823, -2,
-3.054425, -3.305271, 0,
-3.220198, -3.475823, 0,
-3.054425, -3.305271, 2,
-3.220198, -3.475823, 2,
-3.054425, -3.305271, 4,
-3.220198, -3.475823, 4
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
-3.551744, -3.816926, -6, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -6, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -6, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, -6, 0, 1.5, 0.5, 0.5,
-3.551744, -3.816926, -4, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -4, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -4, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, -4, 0, 1.5, 0.5, 0.5,
-3.551744, -3.816926, -2, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -2, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, -2, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, -2, 0, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 0, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 0, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 0, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 0, 0, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 2, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 2, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 2, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 2, 0, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 4, 0, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 4, 1, -0.5, 0.5, 0.5,
-3.551744, -3.816926, 4, 1, 1.5, 0.5, 0.5,
-3.551744, -3.816926, 4, 0, 1.5, 0.5, 0.5
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
-3.054425, -3.305271, -6.415247,
-3.054425, 3.516796, -6.415247,
-3.054425, -3.305271, 5.842379,
-3.054425, 3.516796, 5.842379,
-3.054425, -3.305271, -6.415247,
-3.054425, -3.305271, 5.842379,
-3.054425, 3.516796, -6.415247,
-3.054425, 3.516796, 5.842379,
-3.054425, -3.305271, -6.415247,
3.576486, -3.305271, -6.415247,
-3.054425, -3.305271, 5.842379,
3.576486, -3.305271, 5.842379,
-3.054425, 3.516796, -6.415247,
3.576486, 3.516796, -6.415247,
-3.054425, 3.516796, 5.842379,
3.576486, 3.516796, 5.842379,
3.576486, -3.305271, -6.415247,
3.576486, 3.516796, -6.415247,
3.576486, -3.305271, 5.842379,
3.576486, 3.516796, 5.842379,
3.576486, -3.305271, -6.415247,
3.576486, -3.305271, 5.842379,
3.576486, 3.516796, -6.415247,
3.576486, 3.516796, 5.842379
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
var radius = 8.285461;
var distance = 36.86295;
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
mvMatrix.translate( -0.2610304, -0.1057622, 0.2864344 );
mvMatrix.scale( 1.351006, 1.313151, 0.7308432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.86295);
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
propanecarboxylate_2<-read.table("propanecarboxylate_2.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propanecarboxylate_2$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
y<-propanecarboxylate_2$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
z<-propanecarboxylate_2$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
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
-2.957859, -0.4477145, -1.79029, 0, 0, 1, 1, 1,
-2.8954, 0.4285, -0.7538936, 1, 0, 0, 1, 1,
-2.860395, -0.5314287, -2.228424, 1, 0, 0, 1, 1,
-2.775322, 1.108927, -2.052293, 1, 0, 0, 1, 1,
-2.520667, 0.4734624, -0.7455246, 1, 0, 0, 1, 1,
-2.506859, -1.157912, -1.200127, 1, 0, 0, 1, 1,
-2.42858, 0.1940459, -0.5407084, 0, 0, 0, 1, 1,
-2.331421, -2.011594, -2.374238, 0, 0, 0, 1, 1,
-2.292823, 0.5454402, -1.352053, 0, 0, 0, 1, 1,
-2.265188, 0.04745852, -1.462102, 0, 0, 0, 1, 1,
-2.25794, 2.116125, 0.7204013, 0, 0, 0, 1, 1,
-2.240913, 0.9111049, -1.116858, 0, 0, 0, 1, 1,
-2.221618, 0.2011973, -1.671969, 0, 0, 0, 1, 1,
-2.206041, 0.8397093, -1.867565, 1, 1, 1, 1, 1,
-2.193053, 0.3552551, -0.7883441, 1, 1, 1, 1, 1,
-2.17944, -0.484693, -1.127907, 1, 1, 1, 1, 1,
-2.13599, 0.5021705, -1.475676, 1, 1, 1, 1, 1,
-2.104835, 0.8939267, -2.691701, 1, 1, 1, 1, 1,
-2.102158, 0.3680534, -2.113874, 1, 1, 1, 1, 1,
-2.101367, -0.8642811, -3.749104, 1, 1, 1, 1, 1,
-2.078585, 0.2962242, -1.26476, 1, 1, 1, 1, 1,
-2.029135, -0.7939913, -1.2314, 1, 1, 1, 1, 1,
-1.958783, 1.035179, -2.375911, 1, 1, 1, 1, 1,
-1.936846, -0.05960269, -0.8225401, 1, 1, 1, 1, 1,
-1.912539, -0.8326777, -1.441862, 1, 1, 1, 1, 1,
-1.893231, 0.6250941, -0.1450422, 1, 1, 1, 1, 1,
-1.879879, -1.399106, -4.208786, 1, 1, 1, 1, 1,
-1.863687, 0.9585207, -0.1947197, 1, 1, 1, 1, 1,
-1.862238, -0.1831012, -3.209995, 0, 0, 1, 1, 1,
-1.861984, -0.3822952, -1.983588, 1, 0, 0, 1, 1,
-1.8568, 2.050157, -0.1436931, 1, 0, 0, 1, 1,
-1.84899, 0.2639239, -0.6722972, 1, 0, 0, 1, 1,
-1.827768, 0.8828458, -1.21556, 1, 0, 0, 1, 1,
-1.82241, 1.906763, -2.468977, 1, 0, 0, 1, 1,
-1.817906, 1.440697, -0.6009058, 0, 0, 0, 1, 1,
-1.794853, -0.2339394, -1.223328, 0, 0, 0, 1, 1,
-1.791795, -0.3835846, -2.169042, 0, 0, 0, 1, 1,
-1.770354, 1.92712, -1.504104, 0, 0, 0, 1, 1,
-1.741914, -1.144687, -4.056497, 0, 0, 0, 1, 1,
-1.725413, -0.1672266, -1.30019, 0, 0, 0, 1, 1,
-1.696339, 0.2391554, -1.589993, 0, 0, 0, 1, 1,
-1.678397, -0.8606374, -2.944709, 1, 1, 1, 1, 1,
-1.677936, 0.1905717, -1.604973, 1, 1, 1, 1, 1,
-1.677731, 1.346457, 0.3029062, 1, 1, 1, 1, 1,
-1.674379, -0.3911702, -2.503695, 1, 1, 1, 1, 1,
-1.671578, 0.5081641, 0.01980422, 1, 1, 1, 1, 1,
-1.668996, -1.750845, -3.070118, 1, 1, 1, 1, 1,
-1.660176, 0.1493105, -0.5301194, 1, 1, 1, 1, 1,
-1.643278, -0.7030957, -1.910071, 1, 1, 1, 1, 1,
-1.639274, -0.505088, -0.2974434, 1, 1, 1, 1, 1,
-1.624285, -1.328905, -1.777112, 1, 1, 1, 1, 1,
-1.616929, 0.06905869, -3.016, 1, 1, 1, 1, 1,
-1.604351, -1.307388, -2.929903, 1, 1, 1, 1, 1,
-1.602239, 0.7860928, -0.1383168, 1, 1, 1, 1, 1,
-1.600595, -0.3224721, -2.390772, 1, 1, 1, 1, 1,
-1.594124, -1.962525, -2.099623, 1, 1, 1, 1, 1,
-1.580581, -0.2007602, -2.51794, 0, 0, 1, 1, 1,
-1.576273, -0.450716, -1.825356, 1, 0, 0, 1, 1,
-1.574079, -0.3155208, -2.278535, 1, 0, 0, 1, 1,
-1.562292, 0.1016169, -0.8590234, 1, 0, 0, 1, 1,
-1.535884, -1.733626, -2.652822, 1, 0, 0, 1, 1,
-1.530346, 1.198539, -0.5911241, 1, 0, 0, 1, 1,
-1.528515, -1.36828, -1.132437, 0, 0, 0, 1, 1,
-1.51808, -2.09766, -2.234656, 0, 0, 0, 1, 1,
-1.49202, -0.5036824, -1.611581, 0, 0, 0, 1, 1,
-1.488924, -1.286438, -2.008634, 0, 0, 0, 1, 1,
-1.484407, 0.4714383, -1.197037, 0, 0, 0, 1, 1,
-1.482473, 0.2061537, -0.770512, 0, 0, 0, 1, 1,
-1.475431, 0.6369424, -1.682244, 0, 0, 0, 1, 1,
-1.471538, -0.2802791, -0.9308979, 1, 1, 1, 1, 1,
-1.469675, 0.3556684, -2.555613, 1, 1, 1, 1, 1,
-1.460404, -1.397852, -3.729975, 1, 1, 1, 1, 1,
-1.460353, -0.8642571, -2.146636, 1, 1, 1, 1, 1,
-1.453126, -0.1643103, -1.120949, 1, 1, 1, 1, 1,
-1.444761, 0.3069256, -1.66875, 1, 1, 1, 1, 1,
-1.429873, -0.117839, -0.9930845, 1, 1, 1, 1, 1,
-1.41762, 1.186234, -0.8796085, 1, 1, 1, 1, 1,
-1.417084, -1.101065, -3.287208, 1, 1, 1, 1, 1,
-1.407207, -0.03414534, 0.316978, 1, 1, 1, 1, 1,
-1.40318, 1.647756, -0.7435084, 1, 1, 1, 1, 1,
-1.403062, 0.8441307, 0.3596247, 1, 1, 1, 1, 1,
-1.399429, 0.3176626, -1.583781, 1, 1, 1, 1, 1,
-1.397612, -0.0806578, 0.2968382, 1, 1, 1, 1, 1,
-1.396178, 0.2525359, -2.406941, 1, 1, 1, 1, 1,
-1.392759, 1.073231, -0.4710693, 0, 0, 1, 1, 1,
-1.390869, -1.044423, -1.844698, 1, 0, 0, 1, 1,
-1.388506, -0.7741041, -1.596448, 1, 0, 0, 1, 1,
-1.379959, -1.188418, -1.488167, 1, 0, 0, 1, 1,
-1.374923, -1.363623, -1.690704, 1, 0, 0, 1, 1,
-1.367072, 2.436755, 1.064322, 1, 0, 0, 1, 1,
-1.366362, 0.4858921, -0.5549142, 0, 0, 0, 1, 1,
-1.352583, -0.4237745, -0.2232649, 0, 0, 0, 1, 1,
-1.347894, -1.309844, -3.262137, 0, 0, 0, 1, 1,
-1.347472, -0.5686903, -1.125252, 0, 0, 0, 1, 1,
-1.344422, 1.77167, -0.7226915, 0, 0, 0, 1, 1,
-1.343543, -0.7798246, -2.096605, 0, 0, 0, 1, 1,
-1.33207, -2.15294, -2.715063, 0, 0, 0, 1, 1,
-1.329221, 0.5196922, -3.229598, 1, 1, 1, 1, 1,
-1.327095, -1.540183, -3.567937, 1, 1, 1, 1, 1,
-1.32602, 0.9129441, -1.662241, 1, 1, 1, 1, 1,
-1.324463, -0.531493, -2.49835, 1, 1, 1, 1, 1,
-1.317514, 0.03684543, -2.238454, 1, 1, 1, 1, 1,
-1.31298, 0.9748337, -1.381818, 1, 1, 1, 1, 1,
-1.310093, -2.191346, -3.987507, 1, 1, 1, 1, 1,
-1.284671, 0.6439876, -1.601832, 1, 1, 1, 1, 1,
-1.276264, 0.2573772, -0.02149557, 1, 1, 1, 1, 1,
-1.274389, 0.3865366, -1.307479, 1, 1, 1, 1, 1,
-1.266877, -1.025715, -2.815694, 1, 1, 1, 1, 1,
-1.258492, -0.3131072, -2.498744, 1, 1, 1, 1, 1,
-1.257989, -0.2794026, -0.7304829, 1, 1, 1, 1, 1,
-1.237521, -0.7730604, -2.568013, 1, 1, 1, 1, 1,
-1.227488, -0.2329048, -0.8691464, 1, 1, 1, 1, 1,
-1.221981, -0.5634561, -2.461056, 0, 0, 1, 1, 1,
-1.220349, -1.36185, -2.209997, 1, 0, 0, 1, 1,
-1.209121, -0.1064042, -2.901258, 1, 0, 0, 1, 1,
-1.204449, 0.3121958, -2.117198, 1, 0, 0, 1, 1,
-1.202224, -0.321382, -3.203913, 1, 0, 0, 1, 1,
-1.198172, -0.00831781, -0.6941112, 1, 0, 0, 1, 1,
-1.196183, -0.2115326, -0.7016085, 0, 0, 0, 1, 1,
-1.191867, -1.021041, -4.223441, 0, 0, 0, 1, 1,
-1.190707, -0.8108903, -2.237069, 0, 0, 0, 1, 1,
-1.186961, 1.325683, -0.3803823, 0, 0, 0, 1, 1,
-1.181715, -0.7922543, -0.8554346, 0, 0, 0, 1, 1,
-1.180668, -0.5280071, -1.724143, 0, 0, 0, 1, 1,
-1.177847, 0.562821, -1.634763, 0, 0, 0, 1, 1,
-1.156294, -1.455435, -0.2381617, 1, 1, 1, 1, 1,
-1.148166, 0.2662483, -1.239567, 1, 1, 1, 1, 1,
-1.140474, 0.5092812, -2.446712, 1, 1, 1, 1, 1,
-1.136095, -0.6636186, -2.449114, 1, 1, 1, 1, 1,
-1.135704, -0.6667961, -3.034168, 1, 1, 1, 1, 1,
-1.13476, -0.01870298, -2.584129, 1, 1, 1, 1, 1,
-1.12878, -0.4019586, -1.724551, 1, 1, 1, 1, 1,
-1.12749, 2.023374, 0.05020865, 1, 1, 1, 1, 1,
-1.121199, 0.258725, -1.88932, 1, 1, 1, 1, 1,
-1.120678, 1.003153, -0.4034703, 1, 1, 1, 1, 1,
-1.120199, -0.6458006, -2.705573, 1, 1, 1, 1, 1,
-1.116593, -0.8185936, -2.444991, 1, 1, 1, 1, 1,
-1.113673, -0.2711302, -1.425327, 1, 1, 1, 1, 1,
-1.1133, -1.594567, -2.692864, 1, 1, 1, 1, 1,
-1.103418, 0.3133299, -1.848193, 1, 1, 1, 1, 1,
-1.101287, -0.1909809, -3.137954, 0, 0, 1, 1, 1,
-1.100621, -1.187556, -2.202917, 1, 0, 0, 1, 1,
-1.096356, -0.1301697, -1.907035, 1, 0, 0, 1, 1,
-1.093077, -0.05339814, -3.094848, 1, 0, 0, 1, 1,
-1.091804, -0.6592737, -3.590141, 1, 0, 0, 1, 1,
-1.090789, -0.5665535, -2.23869, 1, 0, 0, 1, 1,
-1.07855, -0.9622501, -2.561747, 0, 0, 0, 1, 1,
-1.073658, 0.8352998, -0.003075982, 0, 0, 0, 1, 1,
-1.066598, -0.9304224, -2.69721, 0, 0, 0, 1, 1,
-1.06486, 1.800188, -0.1197132, 0, 0, 0, 1, 1,
-1.054565, -0.2944939, -2.702472, 0, 0, 0, 1, 1,
-1.053319, -0.04961018, -1.6209, 0, 0, 0, 1, 1,
-1.051824, -0.3167179, -2.622795, 0, 0, 0, 1, 1,
-1.047496, -0.2875583, -1.522962, 1, 1, 1, 1, 1,
-1.04662, -0.294403, -2.037859, 1, 1, 1, 1, 1,
-1.033805, 0.1442503, -2.763225, 1, 1, 1, 1, 1,
-1.027708, 0.2889607, 0.1637055, 1, 1, 1, 1, 1,
-1.027472, 1.056354, 0.2069137, 1, 1, 1, 1, 1,
-1.026828, -0.9894887, -0.6336985, 1, 1, 1, 1, 1,
-1.026825, -0.3768514, -1.235752, 1, 1, 1, 1, 1,
-1.023287, -1.901834, -1.943997, 1, 1, 1, 1, 1,
-1.021653, 0.3498581, -0.7308796, 1, 1, 1, 1, 1,
-1.020963, -1.32647, -1.659843, 1, 1, 1, 1, 1,
-1.016853, 0.8277475, -1.545152, 1, 1, 1, 1, 1,
-1.015319, -0.8269979, -1.885832, 1, 1, 1, 1, 1,
-1.012793, 1.178066, -1.134887, 1, 1, 1, 1, 1,
-1.000139, 0.2999749, -0.6426267, 1, 1, 1, 1, 1,
-0.9921109, -2.30659, -2.636434, 1, 1, 1, 1, 1,
-0.9764716, -0.2560453, -2.808616, 0, 0, 1, 1, 1,
-0.9727767, -0.210889, -2.429329, 1, 0, 0, 1, 1,
-0.966818, -0.967076, -0.8743441, 1, 0, 0, 1, 1,
-0.9658467, 0.1896483, -0.4622967, 1, 0, 0, 1, 1,
-0.9636974, 0.4557991, -0.5923599, 1, 0, 0, 1, 1,
-0.9627369, -1.307808, -1.918427, 1, 0, 0, 1, 1,
-0.956087, -1.125237, -0.9516347, 0, 0, 0, 1, 1,
-0.9557072, -1.791109, -1.2531, 0, 0, 0, 1, 1,
-0.9525671, 0.3776555, -1.219233, 0, 0, 0, 1, 1,
-0.942156, -0.04350896, -1.951436, 0, 0, 0, 1, 1,
-0.9416417, 0.2875575, -1.64729, 0, 0, 0, 1, 1,
-0.9392303, 0.115378, -2.967152, 0, 0, 0, 1, 1,
-0.9307483, -0.2907421, -0.2585937, 0, 0, 0, 1, 1,
-0.9267241, 0.008225149, -1.207401, 1, 1, 1, 1, 1,
-0.9247857, -0.9158289, -1.455268, 1, 1, 1, 1, 1,
-0.9216855, -0.9687845, -2.308037, 1, 1, 1, 1, 1,
-0.9026576, -0.2259719, -1.720164, 1, 1, 1, 1, 1,
-0.9010548, 0.7552155, -1.04932, 1, 1, 1, 1, 1,
-0.8960943, 0.1648836, -1.549976, 1, 1, 1, 1, 1,
-0.8940876, -1.040267, -2.434633, 1, 1, 1, 1, 1,
-0.8855233, 0.2087554, -0.549535, 1, 1, 1, 1, 1,
-0.8729936, 0.751039, -0.7108033, 1, 1, 1, 1, 1,
-0.8676301, 0.359097, -3.24019, 1, 1, 1, 1, 1,
-0.865126, -0.5986613, -2.145438, 1, 1, 1, 1, 1,
-0.8625441, -0.9391657, -3.293133, 1, 1, 1, 1, 1,
-0.858793, -1.630144, -3.19067, 1, 1, 1, 1, 1,
-0.8583321, -1.039788, -3.149448, 1, 1, 1, 1, 1,
-0.8517326, -0.3973959, -1.03208, 1, 1, 1, 1, 1,
-0.8484566, -0.7921726, -2.135744, 0, 0, 1, 1, 1,
-0.8437228, -0.3760024, -4.319384, 1, 0, 0, 1, 1,
-0.8401484, 0.8727884, -1.525931, 1, 0, 0, 1, 1,
-0.839238, -2.284151, -3.17986, 1, 0, 0, 1, 1,
-0.8380848, -0.8254513, -4.028259, 1, 0, 0, 1, 1,
-0.835883, 0.3565628, -2.260184, 1, 0, 0, 1, 1,
-0.8341752, -0.02603309, -1.414913, 0, 0, 0, 1, 1,
-0.8303505, 0.5822249, -1.659033, 0, 0, 0, 1, 1,
-0.8264832, 0.5019304, 0.2489439, 0, 0, 0, 1, 1,
-0.82464, 0.08304504, -1.17301, 0, 0, 0, 1, 1,
-0.8226674, -0.6933067, -1.839733, 0, 0, 0, 1, 1,
-0.8130821, 0.3484554, -1.251254, 0, 0, 0, 1, 1,
-0.810078, -0.170359, -2.155866, 0, 0, 0, 1, 1,
-0.8040743, 0.5095186, -0.7574406, 1, 1, 1, 1, 1,
-0.800654, 1.066472, 0.05882234, 1, 1, 1, 1, 1,
-0.7997866, 0.8213032, -0.08036701, 1, 1, 1, 1, 1,
-0.7986545, 0.3455548, -0.8412047, 1, 1, 1, 1, 1,
-0.7984031, 0.468351, -2.230733, 1, 1, 1, 1, 1,
-0.7941331, -2.648316, -3.502431, 1, 1, 1, 1, 1,
-0.787349, 1.401815, 0.8882031, 1, 1, 1, 1, 1,
-0.7865824, 3.417445, 1.148576, 1, 1, 1, 1, 1,
-0.7822928, -0.6840236, -2.968175, 1, 1, 1, 1, 1,
-0.7819594, -0.1058529, -3.363281, 1, 1, 1, 1, 1,
-0.7803678, 3.204968, 0.898768, 1, 1, 1, 1, 1,
-0.7763643, 1.503564, 0.1672306, 1, 1, 1, 1, 1,
-0.774563, -2.262158, -0.8995168, 1, 1, 1, 1, 1,
-0.7744702, -0.1659381, -1.957346, 1, 1, 1, 1, 1,
-0.7739598, 1.60062, -0.4664896, 1, 1, 1, 1, 1,
-0.7721145, 0.8438686, -1.237817, 0, 0, 1, 1, 1,
-0.7523922, 0.03510325, -1.336141, 1, 0, 0, 1, 1,
-0.7446624, -0.3312035, -2.08532, 1, 0, 0, 1, 1,
-0.740665, 1.239575, 1.868525, 1, 0, 0, 1, 1,
-0.7395394, 0.7342373, -0.8553812, 1, 0, 0, 1, 1,
-0.7355546, -0.1797397, -1.31626, 1, 0, 0, 1, 1,
-0.7331432, -0.09498917, -1.119136, 0, 0, 0, 1, 1,
-0.7303072, 0.13835, -0.8346602, 0, 0, 0, 1, 1,
-0.7292143, 0.7943192, -0.5862938, 0, 0, 0, 1, 1,
-0.727033, 1.078994, -2.299816, 0, 0, 0, 1, 1,
-0.725437, 0.8664582, -0.7260321, 0, 0, 0, 1, 1,
-0.7253653, 0.9022002, -1.246063, 0, 0, 0, 1, 1,
-0.7241737, -0.3159938, -1.007979, 0, 0, 0, 1, 1,
-0.7238361, 1.27239, -1.839015, 1, 1, 1, 1, 1,
-0.7156605, 0.6708376, -0.9953634, 1, 1, 1, 1, 1,
-0.7111478, -0.174444, -2.341282, 1, 1, 1, 1, 1,
-0.7085382, -1.038917, -2.561418, 1, 1, 1, 1, 1,
-0.708191, -0.3496515, -3.279345, 1, 1, 1, 1, 1,
-0.7060723, -2.057691, -3.412847, 1, 1, 1, 1, 1,
-0.7052277, -0.2672047, -1.713684, 1, 1, 1, 1, 1,
-0.7020368, -0.07292426, -3.008134, 1, 1, 1, 1, 1,
-0.6985936, -0.01245412, -2.640579, 1, 1, 1, 1, 1,
-0.6982875, -0.7195629, -2.490777, 1, 1, 1, 1, 1,
-0.6956149, 0.4282492, 0.8541989, 1, 1, 1, 1, 1,
-0.6821002, -0.1966231, -0.6726702, 1, 1, 1, 1, 1,
-0.6808892, 0.8537521, -0.5517991, 1, 1, 1, 1, 1,
-0.6798275, -0.3809682, -4.204233, 1, 1, 1, 1, 1,
-0.6788078, 1.159331, 0.1181534, 1, 1, 1, 1, 1,
-0.6775601, -0.3146895, -2.041263, 0, 0, 1, 1, 1,
-0.6771859, 0.2882918, 0.101095, 1, 0, 0, 1, 1,
-0.6765247, -0.8750919, -3.223948, 1, 0, 0, 1, 1,
-0.6675358, 0.2667115, -1.858702, 1, 0, 0, 1, 1,
-0.6664905, 0.3971709, 0.1537475, 1, 0, 0, 1, 1,
-0.6662115, -0.2469604, -3.733943, 1, 0, 0, 1, 1,
-0.6604632, -1.950101, -1.875127, 0, 0, 0, 1, 1,
-0.6590598, 1.143345, -1.425658, 0, 0, 0, 1, 1,
-0.6577736, 2.31482, 0.8881163, 0, 0, 0, 1, 1,
-0.64635, 1.478102, 0.3711728, 0, 0, 0, 1, 1,
-0.6427456, 0.357332, -1.361238, 0, 0, 0, 1, 1,
-0.6402119, -0.06237322, -3.065765, 0, 0, 0, 1, 1,
-0.6402109, -0.3858588, -0.8095407, 0, 0, 0, 1, 1,
-0.6398165, -2.317629, -2.166206, 1, 1, 1, 1, 1,
-0.638436, -0.1964837, -3.043127, 1, 1, 1, 1, 1,
-0.6290017, 0.2368409, -1.474145, 1, 1, 1, 1, 1,
-0.6263455, 0.9260988, -1.410959, 1, 1, 1, 1, 1,
-0.6210942, -0.4455161, -2.061214, 1, 1, 1, 1, 1,
-0.6152681, -0.01575949, -1.200424, 1, 1, 1, 1, 1,
-0.6111666, 0.343488, -1.58257, 1, 1, 1, 1, 1,
-0.5918363, 0.09197409, 0.4012262, 1, 1, 1, 1, 1,
-0.5881181, 0.9659016, -0.7265107, 1, 1, 1, 1, 1,
-0.584334, -0.2855158, -1.642894, 1, 1, 1, 1, 1,
-0.5824202, -0.2840613, -2.131155, 1, 1, 1, 1, 1,
-0.578172, 0.3506795, -1.241196, 1, 1, 1, 1, 1,
-0.5748277, 1.257564, -0.4166199, 1, 1, 1, 1, 1,
-0.5735169, -0.9151524, -3.826197, 1, 1, 1, 1, 1,
-0.5731462, 0.5805802, -0.4475932, 1, 1, 1, 1, 1,
-0.5714658, -1.739915, -3.464994, 0, 0, 1, 1, 1,
-0.5683429, -0.7051044, -2.328149, 1, 0, 0, 1, 1,
-0.5646564, -1.495878, -4.436889, 1, 0, 0, 1, 1,
-0.5479745, -0.5007262, -1.370562, 1, 0, 0, 1, 1,
-0.5477192, 0.01179158, -2.347418, 1, 0, 0, 1, 1,
-0.5476086, 0.1838551, -1.062685, 1, 0, 0, 1, 1,
-0.5365204, 0.388318, -1.69772, 0, 0, 0, 1, 1,
-0.5363675, -0.05892351, -0.424932, 0, 0, 0, 1, 1,
-0.5347248, -0.841667, -3.36282, 0, 0, 0, 1, 1,
-0.5327587, -0.2956092, -1.338009, 0, 0, 0, 1, 1,
-0.5298868, -0.3827335, -2.976403, 0, 0, 0, 1, 1,
-0.5287892, -0.3360984, -3.725433, 0, 0, 0, 1, 1,
-0.5270663, 1.33466, -0.3503668, 0, 0, 0, 1, 1,
-0.5177423, -0.4684094, -2.138993, 1, 1, 1, 1, 1,
-0.514523, 0.3818667, -2.5015, 1, 1, 1, 1, 1,
-0.5128334, -1.066208, -4.663204, 1, 1, 1, 1, 1,
-0.5105978, 0.9940373, -0.6162277, 1, 1, 1, 1, 1,
-0.5074947, -1.268274, -2.444983, 1, 1, 1, 1, 1,
-0.5062092, -0.9444045, -1.347712, 1, 1, 1, 1, 1,
-0.504097, 0.009347802, -2.764228, 1, 1, 1, 1, 1,
-0.5035571, 0.1302991, -0.06342823, 1, 1, 1, 1, 1,
-0.5023038, -0.5073959, -3.853199, 1, 1, 1, 1, 1,
-0.4891891, -0.5608016, -2.88948, 1, 1, 1, 1, 1,
-0.4884161, -0.3710246, -1.993006, 1, 1, 1, 1, 1,
-0.4859223, 1.961808, -0.3533832, 1, 1, 1, 1, 1,
-0.4836639, -1.736776, -4.387307, 1, 1, 1, 1, 1,
-0.480069, -1.192146, -1.729793, 1, 1, 1, 1, 1,
-0.4793081, -0.4118532, -2.868524, 1, 1, 1, 1, 1,
-0.4789843, -0.8958791, -3.090388, 0, 0, 1, 1, 1,
-0.4772371, 0.9657823, 0.2214946, 1, 0, 0, 1, 1,
-0.467198, -1.058348, -2.509022, 1, 0, 0, 1, 1,
-0.4627635, 0.8390079, 0.3153773, 1, 0, 0, 1, 1,
-0.4521901, 0.8549607, -0.1841642, 1, 0, 0, 1, 1,
-0.4513307, -1.305754, -3.050578, 1, 0, 0, 1, 1,
-0.4508004, -2.205448, -1.785014, 0, 0, 0, 1, 1,
-0.4445305, -1.21689, -3.924696, 0, 0, 0, 1, 1,
-0.4417274, 1.730939, 0.8242031, 0, 0, 0, 1, 1,
-0.4383407, 1.00671, -0.09988525, 0, 0, 0, 1, 1,
-0.4382023, -1.382433, -3.370342, 0, 0, 0, 1, 1,
-0.4378975, -0.0332377, -1.661597, 0, 0, 0, 1, 1,
-0.4364975, -0.06048711, -1.643156, 0, 0, 0, 1, 1,
-0.4362448, 0.4998207, -1.366829, 1, 1, 1, 1, 1,
-0.4362307, -1.27301, -2.400303, 1, 1, 1, 1, 1,
-0.4260561, 0.9630921, -0.7929449, 1, 1, 1, 1, 1,
-0.4247186, 2.004796, 0.8575181, 1, 1, 1, 1, 1,
-0.4218299, -0.4236425, -1.604712, 1, 1, 1, 1, 1,
-0.4148282, 2.888414, -1.160823, 1, 1, 1, 1, 1,
-0.4143086, 0.3980928, -0.1328531, 1, 1, 1, 1, 1,
-0.4112855, 0.707344, 0.06206669, 1, 1, 1, 1, 1,
-0.4093678, 1.447941, -0.01689748, 1, 1, 1, 1, 1,
-0.405838, -1.47885, -4.318093, 1, 1, 1, 1, 1,
-0.4006481, 0.3538032, -1.795291, 1, 1, 1, 1, 1,
-0.3992801, 0.5542055, 0.1443911, 1, 1, 1, 1, 1,
-0.3975454, 0.7868715, -0.500668, 1, 1, 1, 1, 1,
-0.396233, -0.2553612, -4.26382, 1, 1, 1, 1, 1,
-0.3938649, -1.029508, -0.7191927, 1, 1, 1, 1, 1,
-0.3927597, -0.8284256, -3.787769, 0, 0, 1, 1, 1,
-0.3909351, -0.3953432, -3.062745, 1, 0, 0, 1, 1,
-0.3864768, -0.8875448, -0.8546356, 1, 0, 0, 1, 1,
-0.3860733, -0.9248987, -2.959292, 1, 0, 0, 1, 1,
-0.3762755, -0.1388051, -2.219167, 1, 0, 0, 1, 1,
-0.3761825, -0.8754778, -4.653842, 1, 0, 0, 1, 1,
-0.3718797, -1.824987, -2.550491, 0, 0, 0, 1, 1,
-0.3707348, -0.6179299, -2.427875, 0, 0, 0, 1, 1,
-0.3663754, -0.06255107, 0.3911178, 0, 0, 0, 1, 1,
-0.3659979, -1.323429, -3.803527, 0, 0, 0, 1, 1,
-0.3616992, 0.2217704, -0.567296, 0, 0, 0, 1, 1,
-0.3589467, 0.77473, -1.972529, 0, 0, 0, 1, 1,
-0.3588401, 1.58842, 0.7567093, 0, 0, 0, 1, 1,
-0.3565373, 0.2207364, -1.258154, 1, 1, 1, 1, 1,
-0.3538197, 1.149049, -0.4148408, 1, 1, 1, 1, 1,
-0.3534119, -1.466632, -2.669285, 1, 1, 1, 1, 1,
-0.3509477, 0.7247797, -1.125337, 1, 1, 1, 1, 1,
-0.3494878, -0.6689189, -3.325662, 1, 1, 1, 1, 1,
-0.3464698, 0.5916545, 0.39743, 1, 1, 1, 1, 1,
-0.3349374, -1.08563, -3.401335, 1, 1, 1, 1, 1,
-0.3338374, -0.45037, -4.082011, 1, 1, 1, 1, 1,
-0.3324469, 1.030637, -0.7790424, 1, 1, 1, 1, 1,
-0.3317388, -0.7569141, -3.020326, 1, 1, 1, 1, 1,
-0.3278588, 2.000581, 0.6367429, 1, 1, 1, 1, 1,
-0.3273299, 1.011992, 2.229574, 1, 1, 1, 1, 1,
-0.3232505, -0.3961961, -3.716914, 1, 1, 1, 1, 1,
-0.321597, -1.913851, -1.881099, 1, 1, 1, 1, 1,
-0.3202116, 1.55839, 0.8545671, 1, 1, 1, 1, 1,
-0.318025, 0.7279877, -1.862178, 0, 0, 1, 1, 1,
-0.3116108, 0.2542045, -2.419733, 1, 0, 0, 1, 1,
-0.3097214, 0.1138399, -0.385708, 1, 0, 0, 1, 1,
-0.3087311, 1.273127, -1.293263, 1, 0, 0, 1, 1,
-0.3059738, 0.2557903, -4.05559, 1, 0, 0, 1, 1,
-0.2991125, -0.1296579, -0.9125406, 1, 0, 0, 1, 1,
-0.297343, -0.9885021, -2.929104, 0, 0, 0, 1, 1,
-0.2959426, 0.9281573, -0.3248101, 0, 0, 0, 1, 1,
-0.2930837, 0.8318948, 0.5261982, 0, 0, 0, 1, 1,
-0.2909576, -1.166766, -2.597193, 0, 0, 0, 1, 1,
-0.2903155, 0.06278262, -1.586747, 0, 0, 0, 1, 1,
-0.2886508, -0.9074989, -5.008304, 0, 0, 0, 1, 1,
-0.282716, -1.023894, -1.811956, 0, 0, 0, 1, 1,
-0.2810605, -0.8858609, -4.263266, 1, 1, 1, 1, 1,
-0.2748908, 0.5226023, -1.563593, 1, 1, 1, 1, 1,
-0.2667822, 0.5843293, -0.6243059, 1, 1, 1, 1, 1,
-0.2661862, -0.08407401, -2.641208, 1, 1, 1, 1, 1,
-0.2651806, 0.2324893, -2.041815, 1, 1, 1, 1, 1,
-0.2643038, -1.347415, -2.234138, 1, 1, 1, 1, 1,
-0.2576241, 0.7419828, -0.1089343, 1, 1, 1, 1, 1,
-0.257517, 1.712564, 0.02176328, 1, 1, 1, 1, 1,
-0.257318, 1.882244, 1.55227, 1, 1, 1, 1, 1,
-0.2557791, -1.376616, -3.136585, 1, 1, 1, 1, 1,
-0.255015, -0.2416406, -3.053301, 1, 1, 1, 1, 1,
-0.25292, -0.7551608, -1.663152, 1, 1, 1, 1, 1,
-0.2506546, 0.3406703, -1.519651, 1, 1, 1, 1, 1,
-0.2463542, 0.4749947, -1.149051, 1, 1, 1, 1, 1,
-0.2452423, 0.3778982, -0.1987917, 1, 1, 1, 1, 1,
-0.2431657, 0.2594304, -0.1547357, 0, 0, 1, 1, 1,
-0.2400947, 1.991521, -0.8405306, 1, 0, 0, 1, 1,
-0.2391696, 0.7650903, 0.817645, 1, 0, 0, 1, 1,
-0.2372773, -0.3677571, -1.665196, 1, 0, 0, 1, 1,
-0.2292188, 1.154598, 0.65828, 1, 0, 0, 1, 1,
-0.2288403, -2.353287, -1.656006, 1, 0, 0, 1, 1,
-0.2277968, 2.91702e-05, -3.429832, 0, 0, 0, 1, 1,
-0.2268007, -0.002651874, -1.540428, 0, 0, 0, 1, 1,
-0.2255462, 0.829214, -1.916483, 0, 0, 0, 1, 1,
-0.2249623, -1.049095, -3.682839, 0, 0, 0, 1, 1,
-0.223421, -0.7589965, -2.545539, 0, 0, 0, 1, 1,
-0.2233824, -0.60611, -3.992845, 0, 0, 0, 1, 1,
-0.2216978, 0.2253616, 0.01013893, 0, 0, 0, 1, 1,
-0.2190621, -0.5252446, -4.067901, 1, 1, 1, 1, 1,
-0.2155167, -0.8102809, -4.424495, 1, 1, 1, 1, 1,
-0.2101428, -0.3226886, -2.285176, 1, 1, 1, 1, 1,
-0.2021471, -1.411071, -0.3399796, 1, 1, 1, 1, 1,
-0.2019875, 0.565453, 0.5505678, 1, 1, 1, 1, 1,
-0.1972418, -0.5686068, -4.158772, 1, 1, 1, 1, 1,
-0.1936542, 1.191507, -0.3624469, 1, 1, 1, 1, 1,
-0.1897177, 0.9658544, -1.393834, 1, 1, 1, 1, 1,
-0.1843862, 0.7126878, -1.789826, 1, 1, 1, 1, 1,
-0.183425, -0.2789482, -4.335656, 1, 1, 1, 1, 1,
-0.1829064, -0.5102555, -3.195978, 1, 1, 1, 1, 1,
-0.1791091, -0.7694163, -2.08569, 1, 1, 1, 1, 1,
-0.1788644, 0.7300985, -0.3244292, 1, 1, 1, 1, 1,
-0.1770207, 1.30464, 0.1109754, 1, 1, 1, 1, 1,
-0.1756269, 1.939293, 0.3500557, 1, 1, 1, 1, 1,
-0.1735184, 1.610767, -0.0374742, 0, 0, 1, 1, 1,
-0.1657529, 0.3537563, -0.9230922, 1, 0, 0, 1, 1,
-0.1653555, -0.7284732, -3.136635, 1, 0, 0, 1, 1,
-0.1620513, 3.145248, 0.4162899, 1, 0, 0, 1, 1,
-0.161401, -0.3567141, -3.031478, 1, 0, 0, 1, 1,
-0.1611806, 0.2574121, -1.440488, 1, 0, 0, 1, 1,
-0.1604905, -0.8329437, -3.980515, 0, 0, 0, 1, 1,
-0.159502, 1.998034, 0.7260326, 0, 0, 0, 1, 1,
-0.158384, 0.1545288, -1.15453, 0, 0, 0, 1, 1,
-0.1530152, -0.3593172, -2.888843, 0, 0, 0, 1, 1,
-0.1523475, -2.222022, -3.338439, 0, 0, 0, 1, 1,
-0.1478252, -1.044624, -3.211824, 0, 0, 0, 1, 1,
-0.1441411, 1.256548, 0.1285253, 0, 0, 0, 1, 1,
-0.1404194, 0.6765493, 1.355581, 1, 1, 1, 1, 1,
-0.138816, 1.547404, -0.1908297, 1, 1, 1, 1, 1,
-0.1378899, -0.6590104, -3.402428, 1, 1, 1, 1, 1,
-0.1374958, 0.418716, -0.7127217, 1, 1, 1, 1, 1,
-0.1329387, -1.435803, -1.421299, 1, 1, 1, 1, 1,
-0.132451, 0.8513373, -1.264559, 1, 1, 1, 1, 1,
-0.1312294, -0.3662107, -2.616291, 1, 1, 1, 1, 1,
-0.1311021, 0.7913026, -1.955123, 1, 1, 1, 1, 1,
-0.1309189, 0.9183175, 0.08564755, 1, 1, 1, 1, 1,
-0.1241302, 0.232161, -1.232036, 1, 1, 1, 1, 1,
-0.1207155, -0.05456398, -2.567057, 1, 1, 1, 1, 1,
-0.1194753, 1.617057, -0.7148108, 1, 1, 1, 1, 1,
-0.1174662, -0.7897055, -3.134789, 1, 1, 1, 1, 1,
-0.1144677, -0.5324138, -0.7349248, 1, 1, 1, 1, 1,
-0.1064615, -2.917668, -3.495412, 1, 1, 1, 1, 1,
-0.1039506, -0.1646875, -2.652129, 0, 0, 1, 1, 1,
-0.1032006, 1.780719, -0.8555794, 1, 0, 0, 1, 1,
-0.09848066, 0.9339522, 2.077479, 1, 0, 0, 1, 1,
-0.09361261, 0.7466277, 0.4920885, 1, 0, 0, 1, 1,
-0.09072325, 1.836999, -0.1080466, 1, 0, 0, 1, 1,
-0.08946659, -0.9589146, -1.689889, 1, 0, 0, 1, 1,
-0.08380292, -0.4281588, -1.487803, 0, 0, 0, 1, 1,
-0.08304504, 0.4921612, 0.1001747, 0, 0, 0, 1, 1,
-0.08202845, 1.352598, -0.5389153, 0, 0, 0, 1, 1,
-0.08029716, -2.241576, -4.486396, 0, 0, 0, 1, 1,
-0.07758097, 0.1076045, -1.427094, 0, 0, 0, 1, 1,
-0.07671729, 0.003880366, -0.2820419, 0, 0, 0, 1, 1,
-0.07518489, 0.3366721, 1.786628, 0, 0, 0, 1, 1,
-0.07467487, 0.4608572, -1.046228, 1, 1, 1, 1, 1,
-0.07367275, -0.05128407, -1.238387, 1, 1, 1, 1, 1,
-0.07155539, 0.5458903, -0.9569842, 1, 1, 1, 1, 1,
-0.07126712, -1.738814, -2.568755, 1, 1, 1, 1, 1,
-0.07110329, -1.619722, -3.610555, 1, 1, 1, 1, 1,
-0.06841396, -0.03900029, -1.308608, 1, 1, 1, 1, 1,
-0.06751469, -1.449114, -3.755006, 1, 1, 1, 1, 1,
-0.06671023, 1.340045, 1.333643, 1, 1, 1, 1, 1,
-0.06312655, 1.062521, -0.7030007, 1, 1, 1, 1, 1,
-0.06090954, -1.19913, -1.469197, 1, 1, 1, 1, 1,
-0.05422193, 0.1099544, -0.02089937, 1, 1, 1, 1, 1,
-0.0487201, -1.662246, -6.236738, 1, 1, 1, 1, 1,
-0.04858463, -1.42079, -4.498669, 1, 1, 1, 1, 1,
-0.03965772, 0.0334741, -2.143193, 1, 1, 1, 1, 1,
-0.03908148, 1.56233, -0.03580191, 1, 1, 1, 1, 1,
-0.03453948, 1.32363, 0.5286942, 0, 0, 1, 1, 1,
-0.02967164, 1.577354, 1.588796, 1, 0, 0, 1, 1,
-0.02152631, -0.2955807, -3.642219, 1, 0, 0, 1, 1,
-0.02049475, -0.2585689, -3.001766, 1, 0, 0, 1, 1,
-0.01605232, 0.9930604, -0.3971685, 1, 0, 0, 1, 1,
-0.01388161, 0.1516827, 0.371702, 1, 0, 0, 1, 1,
-0.01204909, 0.5929933, 1.151618, 0, 0, 0, 1, 1,
-0.008737439, 0.2833028, -0.5605798, 0, 0, 0, 1, 1,
-0.003874592, -1.911789, -4.308866, 0, 0, 0, 1, 1,
-0.0007258463, 0.4887159, -1.316069, 0, 0, 0, 1, 1,
0.0003579571, 0.6217738, 1.158499, 0, 0, 0, 1, 1,
0.001768382, 0.5100074, -0.06540608, 0, 0, 0, 1, 1,
0.004921315, -0.9811493, 4.785014, 0, 0, 0, 1, 1,
0.009532786, -1.461683, 4.805394, 1, 1, 1, 1, 1,
0.01394169, -0.7054539, 2.399935, 1, 1, 1, 1, 1,
0.01493561, -0.4438838, 1.966929, 1, 1, 1, 1, 1,
0.01499816, -0.4403062, 1.067256, 1, 1, 1, 1, 1,
0.01500289, 0.8634802, 1.006827, 1, 1, 1, 1, 1,
0.01637427, -0.5898055, 3.793957, 1, 1, 1, 1, 1,
0.01684485, -1.209875, 3.551898, 1, 1, 1, 1, 1,
0.01757368, 0.7588221, -0.3741347, 1, 1, 1, 1, 1,
0.02412491, -0.6532648, 1.969806, 1, 1, 1, 1, 1,
0.02547832, 0.5390867, -0.3957686, 1, 1, 1, 1, 1,
0.03207783, 0.6053089, -0.03353047, 1, 1, 1, 1, 1,
0.03261094, -0.9771792, 5.132106, 1, 1, 1, 1, 1,
0.03956293, -0.6713144, 1.917537, 1, 1, 1, 1, 1,
0.04361486, -0.1512182, 2.175492, 1, 1, 1, 1, 1,
0.04583456, 0.1063624, -0.7326063, 1, 1, 1, 1, 1,
0.04877886, 1.512419, 0.9966952, 0, 0, 1, 1, 1,
0.05031311, -0.9839171, 5.663869, 1, 0, 0, 1, 1,
0.05149837, 0.02330092, -0.04476356, 1, 0, 0, 1, 1,
0.05467141, -0.0089793, 1.729527, 1, 0, 0, 1, 1,
0.05593818, -0.4607727, 2.262484, 1, 0, 0, 1, 1,
0.05661022, -1.30746, 0.5280741, 1, 0, 0, 1, 1,
0.05842965, 2.198787, -0.174093, 0, 0, 0, 1, 1,
0.05971031, 2.279162, 0.6952917, 0, 0, 0, 1, 1,
0.0617668, 2.238054, -0.9652097, 0, 0, 0, 1, 1,
0.06394129, 0.7065996, -2.655984, 0, 0, 0, 1, 1,
0.0644751, 0.410447, 0.5439788, 0, 0, 0, 1, 1,
0.06995301, 0.004722615, 1.751613, 0, 0, 0, 1, 1,
0.07195299, -1.917912, 3.003636, 0, 0, 0, 1, 1,
0.07538109, -0.3171273, 4.711302, 1, 1, 1, 1, 1,
0.07622005, -1.086453, 2.431396, 1, 1, 1, 1, 1,
0.07808532, 1.08542, -1.430504, 1, 1, 1, 1, 1,
0.08098589, 0.5521516, -0.3858551, 1, 1, 1, 1, 1,
0.08376615, -0.4718917, 4.320019, 1, 1, 1, 1, 1,
0.08577647, -0.01597475, 1.932162, 1, 1, 1, 1, 1,
0.08609997, -0.5901036, 3.419281, 1, 1, 1, 1, 1,
0.08848712, 0.5230014, -0.9260167, 1, 1, 1, 1, 1,
0.09400523, -0.2650351, 2.416863, 1, 1, 1, 1, 1,
0.09826758, 0.6243416, 0.3092141, 1, 1, 1, 1, 1,
0.09947493, 0.6087546, 0.5364599, 1, 1, 1, 1, 1,
0.1090775, -1.000117, 4.549165, 1, 1, 1, 1, 1,
0.1138876, -0.450709, 1.890137, 1, 1, 1, 1, 1,
0.1164434, -0.7522629, 2.927677, 1, 1, 1, 1, 1,
0.1196678, 0.6141661, -1.598621, 1, 1, 1, 1, 1,
0.122266, -3.205921, 2.773466, 0, 0, 1, 1, 1,
0.1237229, -0.2208413, 3.286646, 1, 0, 0, 1, 1,
0.125818, -1.429043, 3.898924, 1, 0, 0, 1, 1,
0.133551, 0.1882931, 1.001312, 1, 0, 0, 1, 1,
0.1350688, -0.08644804, 3.144046, 1, 0, 0, 1, 1,
0.1352666, 0.9405019, -2.338987, 1, 0, 0, 1, 1,
0.1364521, -0.07783628, 1.941553, 0, 0, 0, 1, 1,
0.1386307, 1.410822, 0.7322155, 0, 0, 0, 1, 1,
0.1435566, 0.5305305, -1.071181, 0, 0, 0, 1, 1,
0.1436122, -0.9057278, 2.396683, 0, 0, 0, 1, 1,
0.1436888, -1.222044, 2.56209, 0, 0, 0, 1, 1,
0.1442889, -0.9408833, 3.211248, 0, 0, 0, 1, 1,
0.1453764, -0.4693911, 2.078252, 0, 0, 0, 1, 1,
0.1519899, -0.3016403, 3.073396, 1, 1, 1, 1, 1,
0.159265, -0.6624722, 3.294052, 1, 1, 1, 1, 1,
0.1664861, -1.565561, 3.126449, 1, 1, 1, 1, 1,
0.1692655, 0.1010486, 0.5210199, 1, 1, 1, 1, 1,
0.1722183, 0.9663677, 1.297683, 1, 1, 1, 1, 1,
0.1736567, 0.3588963, 0.259549, 1, 1, 1, 1, 1,
0.1736686, 1.865698, 0.8967636, 1, 1, 1, 1, 1,
0.1779797, 0.77415, 1.440054, 1, 1, 1, 1, 1,
0.1828128, -0.8735976, 2.454133, 1, 1, 1, 1, 1,
0.187627, -0.2571875, 2.397867, 1, 1, 1, 1, 1,
0.1893893, -0.3243988, 2.244507, 1, 1, 1, 1, 1,
0.1897884, 0.705267, 0.4936495, 1, 1, 1, 1, 1,
0.1916835, -1.638723, 1.977896, 1, 1, 1, 1, 1,
0.1920656, 0.3068824, -1.184335, 1, 1, 1, 1, 1,
0.1938302, 0.756387, 0.7950152, 1, 1, 1, 1, 1,
0.1955187, 1.531562, 0.2577902, 0, 0, 1, 1, 1,
0.1961811, -0.07902587, 1.077189, 1, 0, 0, 1, 1,
0.1974589, -0.9949671, 3.207396, 1, 0, 0, 1, 1,
0.1997168, -2.119271, 3.778068, 1, 0, 0, 1, 1,
0.2012022, 1.528922, 0.7010973, 1, 0, 0, 1, 1,
0.2017016, 1.412868, -0.03127925, 1, 0, 0, 1, 1,
0.2052193, -0.9745448, 1.946836, 0, 0, 0, 1, 1,
0.2056439, 2.029159, -0.3876759, 0, 0, 0, 1, 1,
0.205936, -0.7970694, 2.548297, 0, 0, 0, 1, 1,
0.207015, -0.4475769, 3.206188, 0, 0, 0, 1, 1,
0.2076046, 0.336861, -0.2259211, 0, 0, 0, 1, 1,
0.2100169, 0.3777326, 0.7180447, 0, 0, 0, 1, 1,
0.2139461, 0.4070167, -0.936661, 0, 0, 0, 1, 1,
0.2139481, -0.4230981, 3.021118, 1, 1, 1, 1, 1,
0.2151176, 1.565632, -1.84362, 1, 1, 1, 1, 1,
0.2194032, -0.7486259, 0.8632123, 1, 1, 1, 1, 1,
0.2229275, 0.02724966, 3.050311, 1, 1, 1, 1, 1,
0.2232409, -0.2948998, 2.150012, 1, 1, 1, 1, 1,
0.2254127, -0.2241163, 1.44903, 1, 1, 1, 1, 1,
0.2294263, -0.304361, 1.594536, 1, 1, 1, 1, 1,
0.2319579, -1.236508, 2.650311, 1, 1, 1, 1, 1,
0.2320773, -1.439416, 3.228948, 1, 1, 1, 1, 1,
0.2328587, -0.1377315, 2.015465, 1, 1, 1, 1, 1,
0.2345686, -1.146491, 4.906201, 1, 1, 1, 1, 1,
0.2387424, 0.40749, 1.43483, 1, 1, 1, 1, 1,
0.2412652, -1.283009, 0.4982021, 1, 1, 1, 1, 1,
0.2414887, 0.6936167, -1.35752, 1, 1, 1, 1, 1,
0.2443831, 0.3519622, 2.243327, 1, 1, 1, 1, 1,
0.2454841, -2.946572, 2.280282, 0, 0, 1, 1, 1,
0.249413, 0.2120005, 1.3835, 1, 0, 0, 1, 1,
0.2495864, 0.4335857, 0.3820148, 1, 0, 0, 1, 1,
0.2508772, 0.4187469, 1.349055, 1, 0, 0, 1, 1,
0.2518403, -0.1335767, 2.491976, 1, 0, 0, 1, 1,
0.2536219, -0.05561869, 2.455431, 1, 0, 0, 1, 1,
0.2536941, 2.73478, 0.0808, 0, 0, 0, 1, 1,
0.2580297, 1.297426, 1.404241, 0, 0, 0, 1, 1,
0.2605781, 0.5273453, 1.71117, 0, 0, 0, 1, 1,
0.2610745, -1.386576, 2.715209, 0, 0, 0, 1, 1,
0.2639146, 0.4679433, 2.164459, 0, 0, 0, 1, 1,
0.264733, 0.6622893, 0.2591331, 0, 0, 0, 1, 1,
0.265815, -1.876099, 3.209869, 0, 0, 0, 1, 1,
0.26612, -1.824846, 3.485253, 1, 1, 1, 1, 1,
0.2707455, -0.3128978, 2.198691, 1, 1, 1, 1, 1,
0.270962, 0.4728034, -0.1619923, 1, 1, 1, 1, 1,
0.2715796, 0.5502009, -0.4443309, 1, 1, 1, 1, 1,
0.2777148, -0.02082315, 1.318702, 1, 1, 1, 1, 1,
0.2801511, -1.343317, 3.855157, 1, 1, 1, 1, 1,
0.2805376, 0.6768335, 0.62479, 1, 1, 1, 1, 1,
0.2844008, 1.020186, 0.1676094, 1, 1, 1, 1, 1,
0.2875431, 0.001435955, 1.494644, 1, 1, 1, 1, 1,
0.2961133, 0.6271255, 1.009506, 1, 1, 1, 1, 1,
0.2973695, -0.8067553, 2.322803, 1, 1, 1, 1, 1,
0.2989292, 0.32665, -0.3259902, 1, 1, 1, 1, 1,
0.3034122, -0.3857138, 3.619501, 1, 1, 1, 1, 1,
0.3035359, 1.860515, 0.8759698, 1, 1, 1, 1, 1,
0.3066924, 0.1402182, 1.192483, 1, 1, 1, 1, 1,
0.3145848, 0.1056756, 0.7032889, 0, 0, 1, 1, 1,
0.316839, -1.187237, 1.999275, 1, 0, 0, 1, 1,
0.3177806, 0.7500421, 0.5665086, 1, 0, 0, 1, 1,
0.3179834, 1.148293, 0.1522372, 1, 0, 0, 1, 1,
0.3191086, 0.5457083, 0.9439957, 1, 0, 0, 1, 1,
0.3204111, -0.4269262, 1.34348, 1, 0, 0, 1, 1,
0.3213845, 0.7309959, -0.358169, 0, 0, 0, 1, 1,
0.3254994, 0.4374956, 1.587552, 0, 0, 0, 1, 1,
0.3282267, -1.480756, 3.604695, 0, 0, 0, 1, 1,
0.3311059, 0.3771663, -0.09906684, 0, 0, 0, 1, 1,
0.3342189, -0.02595181, 1.384485, 0, 0, 0, 1, 1,
0.3378657, -0.177321, 2.623297, 0, 0, 0, 1, 1,
0.3387913, 0.9721487, 1.124624, 0, 0, 0, 1, 1,
0.3392611, 0.4324128, 1.702449, 1, 1, 1, 1, 1,
0.3392973, 0.2207855, 0.6629255, 1, 1, 1, 1, 1,
0.3448332, -1.797966, 5.628941, 1, 1, 1, 1, 1,
0.3481469, 1.780107, -0.04148239, 1, 1, 1, 1, 1,
0.3541291, 0.6152946, 0.6044571, 1, 1, 1, 1, 1,
0.356328, -0.6315577, 3.59121, 1, 1, 1, 1, 1,
0.3565686, -1.085555, 3.956827, 1, 1, 1, 1, 1,
0.360748, -1.154604, 1.456115, 1, 1, 1, 1, 1,
0.3618155, -0.0201328, 1.307889, 1, 1, 1, 1, 1,
0.3686142, 0.1579737, 2.728049, 1, 1, 1, 1, 1,
0.3692462, 2.275737, -0.7907579, 1, 1, 1, 1, 1,
0.3714184, -0.1903829, 1.371184, 1, 1, 1, 1, 1,
0.3716908, -0.21532, -0.1312788, 1, 1, 1, 1, 1,
0.3727654, -1.788845, 1.528346, 1, 1, 1, 1, 1,
0.376683, 1.6089, 0.1616924, 1, 1, 1, 1, 1,
0.3809912, -0.7284983, 3.433223, 0, 0, 1, 1, 1,
0.3810833, -1.703659, 3.2938, 1, 0, 0, 1, 1,
0.3836687, 1.29546, 1.039505, 1, 0, 0, 1, 1,
0.386544, 0.9695973, 0.9614012, 1, 0, 0, 1, 1,
0.3872, 1.163543, 1.143968, 1, 0, 0, 1, 1,
0.391263, 0.7105116, 0.3877608, 1, 0, 0, 1, 1,
0.3923399, -0.1393182, -0.2245618, 0, 0, 0, 1, 1,
0.3925258, -0.9712549, 3.189751, 0, 0, 0, 1, 1,
0.3952876, 0.287219, 0.9148442, 0, 0, 0, 1, 1,
0.3969609, 0.6254311, 0.9780847, 0, 0, 0, 1, 1,
0.3998298, 0.1069267, 0.9244952, 0, 0, 0, 1, 1,
0.4010401, 0.6215806, 1.59831, 0, 0, 0, 1, 1,
0.40268, 0.7786709, 1.258051, 0, 0, 0, 1, 1,
0.4057323, -1.169914, 1.629241, 1, 1, 1, 1, 1,
0.409429, -0.6370389, 2.576748, 1, 1, 1, 1, 1,
0.4098886, -0.4202872, 3.355804, 1, 1, 1, 1, 1,
0.4109668, 0.06447927, 1.410556, 1, 1, 1, 1, 1,
0.4114303, 1.071847, -0.726206, 1, 1, 1, 1, 1,
0.4116485, -1.027236, 3.609448, 1, 1, 1, 1, 1,
0.4179452, 1.17172, 0.4463859, 1, 1, 1, 1, 1,
0.4179758, -0.8407205, 2.806532, 1, 1, 1, 1, 1,
0.4182597, -1.849961, 1.959402, 1, 1, 1, 1, 1,
0.4213987, -0.7233718, 3.560554, 1, 1, 1, 1, 1,
0.4266177, -2.682168, 0.9915653, 1, 1, 1, 1, 1,
0.4269215, 0.1246499, 0.5355462, 1, 1, 1, 1, 1,
0.428212, 1.104968, 0.05333292, 1, 1, 1, 1, 1,
0.4360568, -0.1905144, 3.362291, 1, 1, 1, 1, 1,
0.4415512, -0.7776091, 1.51153, 1, 1, 1, 1, 1,
0.442347, -0.0803607, 1.705534, 0, 0, 1, 1, 1,
0.4430345, -1.044619, 2.51531, 1, 0, 0, 1, 1,
0.4454976, 0.7191243, 1.959814, 1, 0, 0, 1, 1,
0.4520689, -1.090778, 1.774825, 1, 0, 0, 1, 1,
0.4539508, 2.062728, 2.258593, 1, 0, 0, 1, 1,
0.4549367, -0.6722397, 1.492304, 1, 0, 0, 1, 1,
0.4589044, -0.5683982, 2.452843, 0, 0, 0, 1, 1,
0.4634815, 1.630489, 1.273196, 0, 0, 0, 1, 1,
0.4647673, 0.3645682, 1.014402, 0, 0, 0, 1, 1,
0.4652601, 1.363011, 1.298344, 0, 0, 0, 1, 1,
0.4665855, 0.1909675, 1.698773, 0, 0, 0, 1, 1,
0.4676695, -0.9360341, 2.950456, 0, 0, 0, 1, 1,
0.470155, -0.5693783, 3.318464, 0, 0, 0, 1, 1,
0.4704178, 0.5604638, 1.796404, 1, 1, 1, 1, 1,
0.4807414, 1.368305, -0.02924316, 1, 1, 1, 1, 1,
0.4839521, 0.08105284, 1.715982, 1, 1, 1, 1, 1,
0.4857809, -1.61952, 4.041768, 1, 1, 1, 1, 1,
0.4869776, 0.1760688, 2.016951, 1, 1, 1, 1, 1,
0.4918324, 1.003243, 0.3911252, 1, 1, 1, 1, 1,
0.4937792, 0.9747929, 1.31537, 1, 1, 1, 1, 1,
0.4938458, -0.2042977, 1.04937, 1, 1, 1, 1, 1,
0.4968354, -0.1492829, 2.101459, 1, 1, 1, 1, 1,
0.4973528, 0.2054568, 0.6195369, 1, 1, 1, 1, 1,
0.5007442, -1.315193, 4.332855, 1, 1, 1, 1, 1,
0.5064878, 0.549422, -1.255804, 1, 1, 1, 1, 1,
0.5117728, -0.8521966, 1.474722, 1, 1, 1, 1, 1,
0.5151049, 0.5146928, -0.133514, 1, 1, 1, 1, 1,
0.5197535, -2.988118, 3.064495, 1, 1, 1, 1, 1,
0.5243034, 0.1806736, -0.5880361, 0, 0, 1, 1, 1,
0.5282513, 0.8887661, 2.351983, 1, 0, 0, 1, 1,
0.5333874, -0.3238649, 2.189244, 1, 0, 0, 1, 1,
0.5365424, -0.5352992, 1.522521, 1, 0, 0, 1, 1,
0.5402454, 1.747715, 0.7169671, 1, 0, 0, 1, 1,
0.5465499, -0.8578296, 3.286242, 1, 0, 0, 1, 1,
0.5494785, 0.3802896, 0.8279199, 0, 0, 0, 1, 1,
0.5560614, 0.9102688, 1.318799, 0, 0, 0, 1, 1,
0.5596592, 0.6003396, 0.6190903, 0, 0, 0, 1, 1,
0.5719111, -0.3691173, 2.10078, 0, 0, 0, 1, 1,
0.5758636, 0.5375677, 1.460172, 0, 0, 0, 1, 1,
0.5847945, -0.613648, 1.988388, 0, 0, 0, 1, 1,
0.5902703, 0.6683714, 1.462549, 0, 0, 0, 1, 1,
0.5914328, 0.1308451, 2.407062, 1, 1, 1, 1, 1,
0.5929376, 0.421584, 0.9042726, 1, 1, 1, 1, 1,
0.5958475, -0.6116168, 0.7558765, 1, 1, 1, 1, 1,
0.5965396, 1.249294, -0.6168998, 1, 1, 1, 1, 1,
0.5995023, 1.002305, 0.3285942, 1, 1, 1, 1, 1,
0.6017238, -0.9515704, 2.010572, 1, 1, 1, 1, 1,
0.6022404, -0.3941844, 4.734794, 1, 1, 1, 1, 1,
0.603246, 1.315017, 0.05294628, 1, 1, 1, 1, 1,
0.6041326, -0.5807493, 2.686265, 1, 1, 1, 1, 1,
0.6054519, -0.470658, 2.377436, 1, 1, 1, 1, 1,
0.6058658, -0.9151638, 2.992399, 1, 1, 1, 1, 1,
0.6060095, -0.9957522, 4.021751, 1, 1, 1, 1, 1,
0.6115392, -0.9267942, 1.10147, 1, 1, 1, 1, 1,
0.6121109, -0.9025893, 3.74753, 1, 1, 1, 1, 1,
0.6127468, -0.389141, 1.735122, 1, 1, 1, 1, 1,
0.6149555, 0.4513616, 1.042109, 0, 0, 1, 1, 1,
0.6234099, 1.013765, 0.7026113, 1, 0, 0, 1, 1,
0.6249743, 0.9069649, 0.5743076, 1, 0, 0, 1, 1,
0.6253504, -0.2013129, -0.8442189, 1, 0, 0, 1, 1,
0.6308025, 1.766053, 1.613218, 1, 0, 0, 1, 1,
0.6329526, 1.361186, 1.059012, 1, 0, 0, 1, 1,
0.6390206, 0.3175638, 0.318978, 0, 0, 0, 1, 1,
0.6395909, 0.09667663, -0.1695451, 0, 0, 0, 1, 1,
0.6472122, 0.4579874, -0.29151, 0, 0, 0, 1, 1,
0.6536592, -0.4650369, 2.005061, 0, 0, 0, 1, 1,
0.6575301, 1.353661, 0.1283635, 0, 0, 0, 1, 1,
0.6581383, 0.04119955, 1.73064, 0, 0, 0, 1, 1,
0.6600669, -0.1640944, 1.879558, 0, 0, 0, 1, 1,
0.6606337, 1.099512, 2.47804, 1, 1, 1, 1, 1,
0.6639271, -1.07719, 2.085068, 1, 1, 1, 1, 1,
0.6644338, 0.9770854, 0.3280595, 1, 1, 1, 1, 1,
0.6713554, -1.116316, -0.6024529, 1, 1, 1, 1, 1,
0.6767796, 0.6005413, 1.743267, 1, 1, 1, 1, 1,
0.6787588, 0.9787217, 0.3889412, 1, 1, 1, 1, 1,
0.6792805, 0.9479969, 2.029829, 1, 1, 1, 1, 1,
0.6799096, -1.497755, 2.578072, 1, 1, 1, 1, 1,
0.6855594, 0.8927591, -0.6353382, 1, 1, 1, 1, 1,
0.6978821, 0.2229975, 1.736999, 1, 1, 1, 1, 1,
0.6978832, 1.626794, 1.576137, 1, 1, 1, 1, 1,
0.6983263, 0.4322894, 3.257658, 1, 1, 1, 1, 1,
0.6987315, 0.2815754, 0.1373083, 1, 1, 1, 1, 1,
0.6995657, 1.085047, 0.3202635, 1, 1, 1, 1, 1,
0.7006267, -0.4686865, 2.448956, 1, 1, 1, 1, 1,
0.7015463, 0.551334, 0.7797327, 0, 0, 1, 1, 1,
0.7019862, 0.5166734, 1.859903, 1, 0, 0, 1, 1,
0.7037576, 0.861174, -0.6913739, 1, 0, 0, 1, 1,
0.7098078, -0.7116485, 1.064904, 1, 0, 0, 1, 1,
0.7131229, 0.5380039, -0.1562139, 1, 0, 0, 1, 1,
0.7132609, 1.02052, 1.750055, 1, 0, 0, 1, 1,
0.7162436, -1.709994, 3.088471, 0, 0, 0, 1, 1,
0.7185015, 1.250372, 2.214818, 0, 0, 0, 1, 1,
0.7196316, 0.8821059, 0.7700444, 0, 0, 0, 1, 1,
0.7200266, -0.6514258, 3.554559, 0, 0, 0, 1, 1,
0.7246069, -0.9773787, 1.763324, 0, 0, 0, 1, 1,
0.7334897, -0.7447313, 2.66446, 0, 0, 0, 1, 1,
0.7337214, 2.091245, 0.3724095, 0, 0, 0, 1, 1,
0.7442905, -1.030198, 0.9284536, 1, 1, 1, 1, 1,
0.7451909, -0.4954056, 2.532851, 1, 1, 1, 1, 1,
0.7498989, -0.05827174, 2.251454, 1, 1, 1, 1, 1,
0.7516049, 0.8136708, 1.396418, 1, 1, 1, 1, 1,
0.754135, -0.5740039, 3.088236, 1, 1, 1, 1, 1,
0.7541665, 0.270733, 2.210336, 1, 1, 1, 1, 1,
0.7604067, 1.256686, 1.587562, 1, 1, 1, 1, 1,
0.7636397, 0.8445975, 0.3484345, 1, 1, 1, 1, 1,
0.7643994, -0.1032406, 1.081708, 1, 1, 1, 1, 1,
0.7717856, 0.5052952, 1.726347, 1, 1, 1, 1, 1,
0.7759047, 0.09966159, 3.067978, 1, 1, 1, 1, 1,
0.776157, 1.146611, 0.1833979, 1, 1, 1, 1, 1,
0.7798918, 0.1402875, 3.902405, 1, 1, 1, 1, 1,
0.7800021, 0.3032149, -0.3149455, 1, 1, 1, 1, 1,
0.7815812, 0.5898181, 0.002463342, 1, 1, 1, 1, 1,
0.7845943, 1.876944, 2.984259, 0, 0, 1, 1, 1,
0.7853447, 0.40558, -0.7931594, 1, 0, 0, 1, 1,
0.7966816, 0.1709501, 1.38578, 1, 0, 0, 1, 1,
0.7975709, 0.08696288, 1.337829, 1, 0, 0, 1, 1,
0.8015568, 0.4608743, 1.469997, 1, 0, 0, 1, 1,
0.8019125, 0.1759028, 0.5814195, 1, 0, 0, 1, 1,
0.8026316, -0.7710103, 3.216344, 0, 0, 0, 1, 1,
0.8186234, 0.8430182, 0.7140226, 0, 0, 0, 1, 1,
0.8206456, 1.755748, 0.4808498, 0, 0, 0, 1, 1,
0.823383, -0.9671282, 2.715128, 0, 0, 0, 1, 1,
0.825669, 1.108056, 1.099833, 0, 0, 0, 1, 1,
0.8353593, 0.1443135, 2.670069, 0, 0, 0, 1, 1,
0.8367275, -0.2620555, 3.770506, 0, 0, 0, 1, 1,
0.8387892, 1.146048, 0.6861969, 1, 1, 1, 1, 1,
0.8408903, -0.1811911, 4.042357, 1, 1, 1, 1, 1,
0.8593208, 0.7851246, -1.554246, 1, 1, 1, 1, 1,
0.8597711, 0.7253544, -0.02507236, 1, 1, 1, 1, 1,
0.8654507, 1.679416, 0.6110079, 1, 1, 1, 1, 1,
0.8676116, -0.2296646, 2.074002, 1, 1, 1, 1, 1,
0.8711837, 2.382356, 0.7368505, 1, 1, 1, 1, 1,
0.8732545, -0.561134, 1.043592, 1, 1, 1, 1, 1,
0.8777916, -0.3707173, 0.7803425, 1, 1, 1, 1, 1,
0.880495, -0.003407973, 0.861623, 1, 1, 1, 1, 1,
0.8865536, 0.531278, 0.6604566, 1, 1, 1, 1, 1,
0.8914104, 0.4196452, 0.7881659, 1, 1, 1, 1, 1,
0.8929566, 0.7356098, 0.7981486, 1, 1, 1, 1, 1,
0.8953997, -0.6668133, 1.691949, 1, 1, 1, 1, 1,
0.8965709, -0.6196841, 3.891991, 1, 1, 1, 1, 1,
0.8987642, 0.3859296, 0.5704362, 0, 0, 1, 1, 1,
0.904373, 0.539003, 0.9619921, 1, 0, 0, 1, 1,
0.9058656, 0.3325181, 0.2331736, 1, 0, 0, 1, 1,
0.9093643, -0.4937648, 1.390119, 1, 0, 0, 1, 1,
0.9163877, 0.01543421, 2.066985, 1, 0, 0, 1, 1,
0.920211, -1.393973, 0.3964013, 1, 0, 0, 1, 1,
0.9215773, -0.1291642, 3.107687, 0, 0, 0, 1, 1,
0.9310008, -2.03452, 1.743016, 0, 0, 0, 1, 1,
0.9385208, 1.611103, -0.1094912, 0, 0, 0, 1, 1,
0.9475754, 0.2361368, 0.7712363, 0, 0, 0, 1, 1,
0.9486318, 0.2374164, 1.740908, 0, 0, 0, 1, 1,
0.9564157, -0.3080859, 1.641778, 0, 0, 0, 1, 1,
0.9689999, 1.781634, -1.668078, 0, 0, 0, 1, 1,
0.9714575, 0.247777, 0.4711854, 1, 1, 1, 1, 1,
0.9861493, -0.9476257, 2.799674, 1, 1, 1, 1, 1,
0.9899288, 0.4767595, 0.2164142, 1, 1, 1, 1, 1,
0.9900386, 1.338582, 1.685903, 1, 1, 1, 1, 1,
0.9991556, -1.201337, 1.44965, 1, 1, 1, 1, 1,
1.003572, -0.3000318, -0.1579011, 1, 1, 1, 1, 1,
1.003856, 0.5100731, 1.768111, 1, 1, 1, 1, 1,
1.00393, -0.3600291, 1.263928, 1, 1, 1, 1, 1,
1.01363, 1.057617, 0.510853, 1, 1, 1, 1, 1,
1.015382, 0.1056646, 1.332941, 1, 1, 1, 1, 1,
1.021905, 1.585836, 1.128741, 1, 1, 1, 1, 1,
1.024902, -0.1368355, 0.9112376, 1, 1, 1, 1, 1,
1.027337, -0.960985, 1.939685, 1, 1, 1, 1, 1,
1.036739, 0.7795511, 1.560731, 1, 1, 1, 1, 1,
1.041452, -0.4743174, 1.695033, 1, 1, 1, 1, 1,
1.04171, -0.653578, 2.076057, 0, 0, 1, 1, 1,
1.042694, 0.1360913, 0.1750918, 1, 0, 0, 1, 1,
1.047659, -0.4676659, 1.284457, 1, 0, 0, 1, 1,
1.053839, -0.4180994, 2.295082, 1, 0, 0, 1, 1,
1.054736, 0.09136316, 2.18006, 1, 0, 0, 1, 1,
1.068704, 0.8406537, 0.5774617, 1, 0, 0, 1, 1,
1.072687, -1.910596, 2.624972, 0, 0, 0, 1, 1,
1.073248, 0.2780827, 1.648548, 0, 0, 0, 1, 1,
1.073294, 0.1374828, 1.436193, 0, 0, 0, 1, 1,
1.077284, 0.6964046, -1.740955, 0, 0, 0, 1, 1,
1.078359, 0.5920386, 2.074718, 0, 0, 0, 1, 1,
1.087398, 0.5334047, 1.661693, 0, 0, 0, 1, 1,
1.088718, -0.3439359, 0.8005707, 0, 0, 0, 1, 1,
1.093115, 0.6756776, 3.456502, 1, 1, 1, 1, 1,
1.093253, -0.005329143, 0.8968833, 1, 1, 1, 1, 1,
1.105141, -0.09015641, 1.665921, 1, 1, 1, 1, 1,
1.105386, 1.38076, 0.5658271, 1, 1, 1, 1, 1,
1.10595, -0.4172406, 1.903306, 1, 1, 1, 1, 1,
1.115904, -0.5647655, 0.5245178, 1, 1, 1, 1, 1,
1.136527, -0.7663941, 3.19749, 1, 1, 1, 1, 1,
1.144341, -1.650377, 2.254812, 1, 1, 1, 1, 1,
1.145967, -2.624018, 2.488183, 1, 1, 1, 1, 1,
1.147026, -0.1940035, 1.832862, 1, 1, 1, 1, 1,
1.158406, 1.668353, 0.67727, 1, 1, 1, 1, 1,
1.162853, -0.4220011, 0.9424535, 1, 1, 1, 1, 1,
1.164157, 0.4674056, 0.2349946, 1, 1, 1, 1, 1,
1.168087, 0.370418, 0.9512093, 1, 1, 1, 1, 1,
1.172159, 0.04957955, 1.112457, 1, 1, 1, 1, 1,
1.173974, 0.4621388, 1.396824, 0, 0, 1, 1, 1,
1.179435, 0.9132898, -0.406249, 1, 0, 0, 1, 1,
1.182818, -0.5143377, 3.716655, 1, 0, 0, 1, 1,
1.190342, -0.030574, 0.5636513, 1, 0, 0, 1, 1,
1.195379, 0.6479686, 1.194923, 1, 0, 0, 1, 1,
1.199054, 0.472997, -0.3058498, 1, 0, 0, 1, 1,
1.203226, -0.1189386, 1.606635, 0, 0, 0, 1, 1,
1.207973, 1.509672, 0.9950595, 0, 0, 0, 1, 1,
1.216442, 1.139939, 1.387447, 0, 0, 0, 1, 1,
1.225031, 0.5691578, 1.228252, 0, 0, 0, 1, 1,
1.230032, -0.2280811, 1.872228, 0, 0, 0, 1, 1,
1.230591, -0.5435095, 2.427518, 0, 0, 0, 1, 1,
1.233492, 1.054356, 1.154642, 0, 0, 0, 1, 1,
1.237987, -0.7527607, 1.546759, 1, 1, 1, 1, 1,
1.249562, 0.5223537, 1.23989, 1, 1, 1, 1, 1,
1.252255, 0.9747655, -0.9519578, 1, 1, 1, 1, 1,
1.257057, 0.9602396, 0.2587204, 1, 1, 1, 1, 1,
1.268749, 1.525466, -0.4459119, 1, 1, 1, 1, 1,
1.270163, -1.125476, 3.347843, 1, 1, 1, 1, 1,
1.278258, 0.03910272, 1.328007, 1, 1, 1, 1, 1,
1.290344, -0.6262134, 2.553638, 1, 1, 1, 1, 1,
1.291064, 0.6049627, 0.4855591, 1, 1, 1, 1, 1,
1.2933, -0.1022305, 2.569866, 1, 1, 1, 1, 1,
1.303554, 0.6150676, 1.668435, 1, 1, 1, 1, 1,
1.303851, 1.889269, 2.053818, 1, 1, 1, 1, 1,
1.304496, -1.185928, 2.321217, 1, 1, 1, 1, 1,
1.329227, -1.259004, 2.100213, 1, 1, 1, 1, 1,
1.330934, 0.5394853, 0.7314481, 1, 1, 1, 1, 1,
1.336327, 0.8664407, 0.9264267, 0, 0, 1, 1, 1,
1.342264, 1.103745, -1.015052, 1, 0, 0, 1, 1,
1.350808, -1.282713, 2.68806, 1, 0, 0, 1, 1,
1.354766, 1.010586, 0.4618673, 1, 0, 0, 1, 1,
1.362709, -0.553234, 2.07508, 1, 0, 0, 1, 1,
1.368267, 1.306556, -0.003283358, 1, 0, 0, 1, 1,
1.371514, -1.642091, 3.900958, 0, 0, 0, 1, 1,
1.3781, -0.5902042, 4.112784, 0, 0, 0, 1, 1,
1.39381, 0.5632388, 1.549383, 0, 0, 0, 1, 1,
1.426415, -0.5258927, 0.9228739, 0, 0, 0, 1, 1,
1.427917, -0.5642699, 1.911208, 0, 0, 0, 1, 1,
1.438304, 0.1136068, 3.096144, 0, 0, 0, 1, 1,
1.442762, -1.25209, 2.693227, 0, 0, 0, 1, 1,
1.444109, 1.915853, -0.158827, 1, 1, 1, 1, 1,
1.445112, 0.3224683, 1.221851, 1, 1, 1, 1, 1,
1.449213, 0.8073489, 1.132284, 1, 1, 1, 1, 1,
1.451798, 3.157199, 0.9163117, 1, 1, 1, 1, 1,
1.453561, 1.350054, 1.85166, 1, 1, 1, 1, 1,
1.481364, 1.507766, -1.474623, 1, 1, 1, 1, 1,
1.49532, 1.623165, -1.595664, 1, 1, 1, 1, 1,
1.497423, 1.030003, 0.4123221, 1, 1, 1, 1, 1,
1.499243, 0.1337992, 2.695145, 1, 1, 1, 1, 1,
1.507955, 0.4361016, 2.589975, 1, 1, 1, 1, 1,
1.52045, -1.422571, 1.81097, 1, 1, 1, 1, 1,
1.536534, 0.8365957, 2.294215, 1, 1, 1, 1, 1,
1.537291, -0.972208, 2.133932, 1, 1, 1, 1, 1,
1.539239, -0.1202257, 1.268945, 1, 1, 1, 1, 1,
1.547537, -0.1602675, 3.196203, 1, 1, 1, 1, 1,
1.553195, 0.5431191, 0.6381467, 0, 0, 1, 1, 1,
1.567628, -0.9146905, 3.078971, 1, 0, 0, 1, 1,
1.577198, 0.2358822, 2.249244, 1, 0, 0, 1, 1,
1.578171, -0.5184905, 2.235853, 1, 0, 0, 1, 1,
1.579228, -0.1171521, -1.694134, 1, 0, 0, 1, 1,
1.592229, -0.6999062, 4.4188, 1, 0, 0, 1, 1,
1.60492, -0.3798914, 0.9824318, 0, 0, 0, 1, 1,
1.613551, -0.1938171, 2.002898, 0, 0, 0, 1, 1,
1.615447, 1.194626, 2.568828, 0, 0, 0, 1, 1,
1.616124, 1.834571, 2.716439, 0, 0, 0, 1, 1,
1.624378, 0.8274777, -0.07974828, 0, 0, 0, 1, 1,
1.631343, -0.6185739, 0.9624791, 0, 0, 0, 1, 1,
1.638798, -1.127376, 2.253356, 0, 0, 0, 1, 1,
1.640077, 1.87082, 1.223513, 1, 1, 1, 1, 1,
1.648323, -0.6530975, 1.3511, 1, 1, 1, 1, 1,
1.650349, -1.322699, 3.093875, 1, 1, 1, 1, 1,
1.652611, -1.370908, 4.028942, 1, 1, 1, 1, 1,
1.652826, -0.8513728, 2.216055, 1, 1, 1, 1, 1,
1.665073, 1.309968, 0.8233446, 1, 1, 1, 1, 1,
1.675827, -0.4025543, 2.096133, 1, 1, 1, 1, 1,
1.676776, -0.4264357, 0.9498691, 1, 1, 1, 1, 1,
1.688498, -0.1370995, 2.608735, 1, 1, 1, 1, 1,
1.695099, -1.77297, 1.07013, 1, 1, 1, 1, 1,
1.698493, 0.9374951, 1.324163, 1, 1, 1, 1, 1,
1.69991, -1.161456, 2.347637, 1, 1, 1, 1, 1,
1.702203, 1.109561, 1.988773, 1, 1, 1, 1, 1,
1.703181, -1.084677, 3.454796, 1, 1, 1, 1, 1,
1.711622, 0.5121158, 1.769881, 1, 1, 1, 1, 1,
1.722561, 0.490925, 1.071105, 0, 0, 1, 1, 1,
1.722992, -1.225364, 3.272716, 1, 0, 0, 1, 1,
1.725999, 1.062658, 1.959361, 1, 0, 0, 1, 1,
1.728578, -0.03650019, 3.553714, 1, 0, 0, 1, 1,
1.744007, 1.666651, 0.07651799, 1, 0, 0, 1, 1,
1.745871, -0.6545183, 3.098727, 1, 0, 0, 1, 1,
1.756557, 0.4117307, 1.773423, 0, 0, 0, 1, 1,
1.766482, -0.5151694, 2.612249, 0, 0, 0, 1, 1,
1.789615, -0.2271377, 3.556107, 0, 0, 0, 1, 1,
1.79615, 0.05324527, -0.2721457, 0, 0, 0, 1, 1,
1.824911, -0.2892939, 1.151182, 0, 0, 0, 1, 1,
1.837114, 0.747935, 1.835896, 0, 0, 0, 1, 1,
1.838645, -0.1418371, 0.2190581, 0, 0, 0, 1, 1,
1.844226, 2.352675, 0.9060356, 1, 1, 1, 1, 1,
1.856347, 1.482159, 1.623265, 1, 1, 1, 1, 1,
1.867465, 1.399385, 0.1292474, 1, 1, 1, 1, 1,
1.876274, 0.2583196, 1.224578, 1, 1, 1, 1, 1,
1.895172, 1.468241, 0.9490442, 1, 1, 1, 1, 1,
1.95971, -0.6147406, 2.436423, 1, 1, 1, 1, 1,
1.965581, 0.3722425, 2.745823, 1, 1, 1, 1, 1,
1.975469, -1.038599, 1.700145, 1, 1, 1, 1, 1,
1.990796, -0.8877913, 4.624708, 1, 1, 1, 1, 1,
1.999032, -0.5165176, 1.189935, 1, 1, 1, 1, 1,
2.004897, -0.986661, -0.09654196, 1, 1, 1, 1, 1,
2.011714, 0.8879706, 2.096619, 1, 1, 1, 1, 1,
2.034056, -0.5753115, 0.7615688, 1, 1, 1, 1, 1,
2.055669, -1.28151, 2.362409, 1, 1, 1, 1, 1,
2.059431, -0.2422756, 2.456921, 1, 1, 1, 1, 1,
2.087603, -1.106715, 2.502399, 0, 0, 1, 1, 1,
2.093642, 0.1688474, -1.475012, 1, 0, 0, 1, 1,
2.117612, 0.2699673, 2.444454, 1, 0, 0, 1, 1,
2.170127, 0.09853506, 0.7919625, 1, 0, 0, 1, 1,
2.179985, -1.44456, 3.461896, 1, 0, 0, 1, 1,
2.207297, -1.430344, 1.965431, 1, 0, 0, 1, 1,
2.216743, -0.664938, 2.826546, 0, 0, 0, 1, 1,
2.219825, -0.8547519, 2.915286, 0, 0, 0, 1, 1,
2.22497, -0.2931768, 0.2102792, 0, 0, 0, 1, 1,
2.248662, -0.7222912, 2.680639, 0, 0, 0, 1, 1,
2.253406, -1.770308, 3.471532, 0, 0, 0, 1, 1,
2.263464, 0.7254585, 1.028224, 0, 0, 0, 1, 1,
2.264495, 0.9996371, -0.003371913, 0, 0, 0, 1, 1,
2.276331, 0.9746701, 0.7253608, 1, 1, 1, 1, 1,
2.315783, 0.5023708, 0.7916542, 1, 1, 1, 1, 1,
2.511786, 0.2557779, 1.00195, 1, 1, 1, 1, 1,
2.687467, 0.2158613, 1.466722, 1, 1, 1, 1, 1,
3.051011, 0.1340439, 2.434842, 1, 1, 1, 1, 1,
3.153392, -1.713336, 1.674691, 1, 1, 1, 1, 1,
3.479919, 0.6781763, 1.512303, 1, 1, 1, 1, 1
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
var radius = 10.12337;
var distance = 35.5579;
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
mvMatrix.translate( -0.2610304, -0.1057622, 0.2864344 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.5579);
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
