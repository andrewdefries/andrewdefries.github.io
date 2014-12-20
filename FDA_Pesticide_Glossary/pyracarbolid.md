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
-3.278324, 0.9229767, -1.079009, 1, 0, 0, 1,
-2.84181, -0.6277887, -2.372855, 1, 0.007843138, 0, 1,
-2.791451, -1.129881, -2.462343, 1, 0.01176471, 0, 1,
-2.578402, 0.3422003, -1.755958, 1, 0.01960784, 0, 1,
-2.551512, -0.2696832, -2.133568, 1, 0.02352941, 0, 1,
-2.520689, 0.2109068, -0.428012, 1, 0.03137255, 0, 1,
-2.497766, -0.03760321, -0.7114379, 1, 0.03529412, 0, 1,
-2.450586, -1.584991, -2.317698, 1, 0.04313726, 0, 1,
-2.395911, 0.2704484, -0.6788652, 1, 0.04705882, 0, 1,
-2.370092, -0.988167, -2.599293, 1, 0.05490196, 0, 1,
-2.34482, -0.8720875, -3.178782, 1, 0.05882353, 0, 1,
-2.329319, -0.5355124, -1.631071, 1, 0.06666667, 0, 1,
-2.276625, 0.4873207, -4.317616, 1, 0.07058824, 0, 1,
-2.233128, 0.5045578, -1.135363, 1, 0.07843138, 0, 1,
-2.200722, -0.8184151, 0.5718355, 1, 0.08235294, 0, 1,
-2.152763, -1.483505, -1.060218, 1, 0.09019608, 0, 1,
-2.129718, 0.00502463, -1.254916, 1, 0.09411765, 0, 1,
-2.109876, 0.1909808, -1.081218, 1, 0.1019608, 0, 1,
-2.08976, 0.9092063, -2.085634, 1, 0.1098039, 0, 1,
-2.07223, 0.3072596, -0.9668941, 1, 0.1137255, 0, 1,
-2.0679, -0.9033714, -1.391515, 1, 0.1215686, 0, 1,
-2.065258, 0.5060387, -2.49192, 1, 0.1254902, 0, 1,
-2.058955, 1.270782, -1.671092, 1, 0.1333333, 0, 1,
-2.039932, 0.1126656, -2.485584, 1, 0.1372549, 0, 1,
-2.011638, -1.311592, -0.6261793, 1, 0.145098, 0, 1,
-1.967255, -0.372988, -2.559405, 1, 0.1490196, 0, 1,
-1.966874, 2.006925, -1.916723, 1, 0.1568628, 0, 1,
-1.949401, -1.044235, -2.12091, 1, 0.1607843, 0, 1,
-1.946498, 0.3039431, -0.8512473, 1, 0.1686275, 0, 1,
-1.934535, -1.046449, -2.850431, 1, 0.172549, 0, 1,
-1.895573, 1.045935, 0.6430271, 1, 0.1803922, 0, 1,
-1.891676, -1.501942, -2.666501, 1, 0.1843137, 0, 1,
-1.878965, 1.209628, -1.584786, 1, 0.1921569, 0, 1,
-1.865995, 0.02890443, -2.33181, 1, 0.1960784, 0, 1,
-1.861827, -0.3841622, -0.4402512, 1, 0.2039216, 0, 1,
-1.857007, 0.256418, -2.541852, 1, 0.2117647, 0, 1,
-1.848307, 0.727436, -2.234921, 1, 0.2156863, 0, 1,
-1.838449, -0.3888272, -0.7409232, 1, 0.2235294, 0, 1,
-1.81884, 0.3719099, -1.564337, 1, 0.227451, 0, 1,
-1.81761, 0.4606041, -0.2763631, 1, 0.2352941, 0, 1,
-1.804557, -0.3130037, -3.093194, 1, 0.2392157, 0, 1,
-1.784866, -1.767157, -4.871436, 1, 0.2470588, 0, 1,
-1.780607, -1.068233, -1.657493, 1, 0.2509804, 0, 1,
-1.776856, -1.00521, -0.9950814, 1, 0.2588235, 0, 1,
-1.77312, 1.142744, -2.106943, 1, 0.2627451, 0, 1,
-1.763578, -2.572732, -1.592756, 1, 0.2705882, 0, 1,
-1.74974, -0.1773117, -2.326207, 1, 0.2745098, 0, 1,
-1.734714, -0.9483912, -1.482534, 1, 0.282353, 0, 1,
-1.712578, 0.7204949, -1.872133, 1, 0.2862745, 0, 1,
-1.706404, -0.8018965, -2.541504, 1, 0.2941177, 0, 1,
-1.703333, 0.5183388, -0.4741519, 1, 0.3019608, 0, 1,
-1.697893, 1.231703, -1.600526, 1, 0.3058824, 0, 1,
-1.696947, 1.036506, -1.304496, 1, 0.3137255, 0, 1,
-1.695955, -1.949291, -4.124899, 1, 0.3176471, 0, 1,
-1.686496, 0.2851079, 0.3488645, 1, 0.3254902, 0, 1,
-1.679922, 0.4094232, -1.000068, 1, 0.3294118, 0, 1,
-1.672365, 0.03708796, -1.730712, 1, 0.3372549, 0, 1,
-1.668968, -0.5282782, -1.532409, 1, 0.3411765, 0, 1,
-1.65733, -0.6791658, -1.28385, 1, 0.3490196, 0, 1,
-1.656816, -0.4194638, 0.6749178, 1, 0.3529412, 0, 1,
-1.656436, 1.491694, -2.084702, 1, 0.3607843, 0, 1,
-1.649031, 0.5377309, -2.324238, 1, 0.3647059, 0, 1,
-1.647103, 1.107308, -1.41918, 1, 0.372549, 0, 1,
-1.624257, 0.2641454, -0.3493185, 1, 0.3764706, 0, 1,
-1.595553, -0.2736842, -1.593484, 1, 0.3843137, 0, 1,
-1.595396, -0.7653236, -3.090621, 1, 0.3882353, 0, 1,
-1.58512, -0.7748303, -3.054701, 1, 0.3960784, 0, 1,
-1.57168, 0.8897073, -1.185532, 1, 0.4039216, 0, 1,
-1.568095, 0.2628918, -3.361972, 1, 0.4078431, 0, 1,
-1.534893, 2.280479, -0.3669679, 1, 0.4156863, 0, 1,
-1.530398, 1.488281, -1.505926, 1, 0.4196078, 0, 1,
-1.500297, 0.793098, -0.08225375, 1, 0.427451, 0, 1,
-1.489484, 3.157125, -0.9272401, 1, 0.4313726, 0, 1,
-1.484885, -0.3589829, -2.245495, 1, 0.4392157, 0, 1,
-1.479646, 1.530604, 1.461048, 1, 0.4431373, 0, 1,
-1.477026, -0.5817029, -2.520333, 1, 0.4509804, 0, 1,
-1.472417, -0.9581189, -1.283799, 1, 0.454902, 0, 1,
-1.471564, 0.6629874, -0.2802335, 1, 0.4627451, 0, 1,
-1.468858, 1.021625, -2.624156, 1, 0.4666667, 0, 1,
-1.468355, -2.373969, -2.795913, 1, 0.4745098, 0, 1,
-1.460708, -1.362309, -1.969805, 1, 0.4784314, 0, 1,
-1.456087, 0.648263, -2.217744, 1, 0.4862745, 0, 1,
-1.440826, -0.2783533, -2.252867, 1, 0.4901961, 0, 1,
-1.435764, 0.2615257, -1.714775, 1, 0.4980392, 0, 1,
-1.434744, 0.08633769, -0.9669014, 1, 0.5058824, 0, 1,
-1.416706, -1.918114, -2.017823, 1, 0.509804, 0, 1,
-1.410582, 0.3029905, -2.36214, 1, 0.5176471, 0, 1,
-1.40996, 0.7125732, -0.8794088, 1, 0.5215687, 0, 1,
-1.407314, 0.1253017, -1.95537, 1, 0.5294118, 0, 1,
-1.407006, 1.907848, -1.264647, 1, 0.5333334, 0, 1,
-1.406114, 0.8436209, -0.09896894, 1, 0.5411765, 0, 1,
-1.404555, 0.05671752, -3.328768, 1, 0.5450981, 0, 1,
-1.402636, 1.234085, -1.088328, 1, 0.5529412, 0, 1,
-1.402122, 0.6186669, -1.292532, 1, 0.5568628, 0, 1,
-1.391489, -0.3226165, -3.159013, 1, 0.5647059, 0, 1,
-1.391179, -0.003542074, -2.799947, 1, 0.5686275, 0, 1,
-1.375029, -0.9941819, -2.57142, 1, 0.5764706, 0, 1,
-1.363864, 1.089002, -3.899125, 1, 0.5803922, 0, 1,
-1.334205, -0.8541776, -3.981572, 1, 0.5882353, 0, 1,
-1.333391, -0.8564774, -1.697045, 1, 0.5921569, 0, 1,
-1.332326, 0.9526896, -1.911427, 1, 0.6, 0, 1,
-1.32135, 0.2235325, -1.202417, 1, 0.6078432, 0, 1,
-1.312847, -0.2755366, -0.8636639, 1, 0.6117647, 0, 1,
-1.309436, 1.034457, -1.456666, 1, 0.6196079, 0, 1,
-1.299251, 1.182542, -0.3942848, 1, 0.6235294, 0, 1,
-1.293678, -2.15431, -3.166566, 1, 0.6313726, 0, 1,
-1.28581, 1.190081, 0.4022354, 1, 0.6352941, 0, 1,
-1.285065, -0.2014434, -0.9297678, 1, 0.6431373, 0, 1,
-1.27603, 1.681686, -0.5467939, 1, 0.6470588, 0, 1,
-1.270803, 1.334606, -1.951109, 1, 0.654902, 0, 1,
-1.270711, 0.3592655, -0.216538, 1, 0.6588235, 0, 1,
-1.266643, 0.05964242, -3.339911, 1, 0.6666667, 0, 1,
-1.261718, 2.837575, -0.005444893, 1, 0.6705883, 0, 1,
-1.249105, 0.3411815, -2.912632, 1, 0.6784314, 0, 1,
-1.242439, -0.4340028, -2.261563, 1, 0.682353, 0, 1,
-1.23114, 1.334132, 1.957825, 1, 0.6901961, 0, 1,
-1.226449, -0.6119366, -2.624241, 1, 0.6941177, 0, 1,
-1.206785, -0.075402, -1.571109, 1, 0.7019608, 0, 1,
-1.203433, 0.005198925, -1.174951, 1, 0.7098039, 0, 1,
-1.198044, -0.4201351, -0.8153496, 1, 0.7137255, 0, 1,
-1.183498, 0.007505808, -2.844776, 1, 0.7215686, 0, 1,
-1.159358, -0.01922431, -3.343799, 1, 0.7254902, 0, 1,
-1.158149, -0.6080089, -0.5973601, 1, 0.7333333, 0, 1,
-1.138324, 1.041181, -0.4989823, 1, 0.7372549, 0, 1,
-1.132662, 0.6592135, -2.327343, 1, 0.7450981, 0, 1,
-1.123098, -0.200086, -1.49382, 1, 0.7490196, 0, 1,
-1.115674, -0.4866583, -2.180592, 1, 0.7568628, 0, 1,
-1.111997, 0.9544927, -0.4352818, 1, 0.7607843, 0, 1,
-1.1017, -0.1834713, 0.341052, 1, 0.7686275, 0, 1,
-1.100968, -0.926746, -2.11085, 1, 0.772549, 0, 1,
-1.100394, -0.2727714, -2.764267, 1, 0.7803922, 0, 1,
-1.093651, 0.6110303, -2.424678, 1, 0.7843137, 0, 1,
-1.092847, 0.3023066, -2.358605, 1, 0.7921569, 0, 1,
-1.085487, 0.06221994, -0.8697442, 1, 0.7960784, 0, 1,
-1.077026, -0.5247998, -3.964047, 1, 0.8039216, 0, 1,
-1.073326, -0.2656166, -3.032993, 1, 0.8117647, 0, 1,
-1.06656, 0.4068574, 0.1909501, 1, 0.8156863, 0, 1,
-1.06392, -0.1106704, -3.006061, 1, 0.8235294, 0, 1,
-1.058901, -0.3636301, -1.170689, 1, 0.827451, 0, 1,
-1.053176, 1.557621, -2.134363, 1, 0.8352941, 0, 1,
-1.049481, 1.181841, -1.120131, 1, 0.8392157, 0, 1,
-1.048344, 0.5096707, 0.9366755, 1, 0.8470588, 0, 1,
-1.047223, 1.709284, -0.1349133, 1, 0.8509804, 0, 1,
-1.040539, 0.1996192, 0.1275779, 1, 0.8588235, 0, 1,
-1.036009, 0.2356971, -0.1472574, 1, 0.8627451, 0, 1,
-1.032679, -1.005129, -2.342303, 1, 0.8705882, 0, 1,
-1.030929, 0.6429717, 0.49143, 1, 0.8745098, 0, 1,
-1.028609, -1.256161, -2.201389, 1, 0.8823529, 0, 1,
-1.026459, -0.7051222, -1.70045, 1, 0.8862745, 0, 1,
-1.026107, 0.9574226, -0.07139382, 1, 0.8941177, 0, 1,
-1.025735, -0.6274411, -0.7757099, 1, 0.8980392, 0, 1,
-1.021454, -1.392623, -2.799466, 1, 0.9058824, 0, 1,
-1.017107, 0.9771389, -1.390793, 1, 0.9137255, 0, 1,
-1.015916, -1.386392, -2.454099, 1, 0.9176471, 0, 1,
-1.005422, 0.7850791, -2.073913, 1, 0.9254902, 0, 1,
-1.004224, 1.143779, 1.358246, 1, 0.9294118, 0, 1,
-0.9984099, 0.2905397, -2.528174, 1, 0.9372549, 0, 1,
-0.9942757, -2.050476, -3.020727, 1, 0.9411765, 0, 1,
-0.9930982, -0.568803, -2.420972, 1, 0.9490196, 0, 1,
-0.9905617, -0.5947964, -3.048888, 1, 0.9529412, 0, 1,
-0.9893868, 0.7305135, -2.22044, 1, 0.9607843, 0, 1,
-0.9849374, 0.06263785, 0.1527346, 1, 0.9647059, 0, 1,
-0.9835709, -0.6530402, -1.483346, 1, 0.972549, 0, 1,
-0.9833389, -0.535934, -1.959769, 1, 0.9764706, 0, 1,
-0.9804769, 0.3232932, -1.878911, 1, 0.9843137, 0, 1,
-0.9785359, -0.665078, -1.896023, 1, 0.9882353, 0, 1,
-0.9749558, 0.2207864, -1.834064, 1, 0.9960784, 0, 1,
-0.9644586, -0.2428801, -3.723109, 0.9960784, 1, 0, 1,
-0.9620152, 0.223023, -0.9783612, 0.9921569, 1, 0, 1,
-0.9550823, 1.008911, -0.3216656, 0.9843137, 1, 0, 1,
-0.9539461, 0.6601993, -1.646019, 0.9803922, 1, 0, 1,
-0.9478979, -0.04082678, -1.605014, 0.972549, 1, 0, 1,
-0.9476152, -0.5424379, -2.273992, 0.9686275, 1, 0, 1,
-0.9425262, 0.2120457, -1.621543, 0.9607843, 1, 0, 1,
-0.9421766, 0.4726206, 1.664504, 0.9568627, 1, 0, 1,
-0.9419338, 0.8060429, -1.333323, 0.9490196, 1, 0, 1,
-0.9362537, -0.3054291, -1.101629, 0.945098, 1, 0, 1,
-0.9305641, -0.6228362, -1.405728, 0.9372549, 1, 0, 1,
-0.9295907, -0.3320212, -3.131108, 0.9333333, 1, 0, 1,
-0.9207852, -0.0718039, -2.433188, 0.9254902, 1, 0, 1,
-0.9088954, -0.790253, -3.582189, 0.9215686, 1, 0, 1,
-0.9080117, 0.3684042, -1.41966, 0.9137255, 1, 0, 1,
-0.9049259, 0.6440175, -0.3466298, 0.9098039, 1, 0, 1,
-0.8987221, -3.315214, -3.050946, 0.9019608, 1, 0, 1,
-0.8983368, 0.3542311, -0.7135545, 0.8941177, 1, 0, 1,
-0.8978719, 2.051543, -0.09029577, 0.8901961, 1, 0, 1,
-0.8927047, 0.5990808, -2.818139, 0.8823529, 1, 0, 1,
-0.892208, -1.656857, -1.513387, 0.8784314, 1, 0, 1,
-0.886308, 1.116149, -0.4121747, 0.8705882, 1, 0, 1,
-0.8856317, -0.5610064, -1.119099, 0.8666667, 1, 0, 1,
-0.8793516, -0.3552696, -2.369188, 0.8588235, 1, 0, 1,
-0.877919, -0.8989357, -2.293967, 0.854902, 1, 0, 1,
-0.8720586, -0.4314605, -0.5468557, 0.8470588, 1, 0, 1,
-0.8714098, 0.5749225, 0.4974911, 0.8431373, 1, 0, 1,
-0.8667188, 0.2574482, 0.4087195, 0.8352941, 1, 0, 1,
-0.8642329, -0.08505266, -1.32772, 0.8313726, 1, 0, 1,
-0.8617332, 0.9325595, -0.1568905, 0.8235294, 1, 0, 1,
-0.8613054, -1.397023, -2.606253, 0.8196079, 1, 0, 1,
-0.8577194, 0.6475568, -0.3527554, 0.8117647, 1, 0, 1,
-0.8559046, 1.038523, -0.6500402, 0.8078431, 1, 0, 1,
-0.8513088, 1.214842, -0.5306937, 0.8, 1, 0, 1,
-0.8399038, -0.04664685, -0.2179518, 0.7921569, 1, 0, 1,
-0.8375572, 1.146083, -1.565084, 0.7882353, 1, 0, 1,
-0.8358523, -0.2278276, -1.839981, 0.7803922, 1, 0, 1,
-0.8273246, -0.6400286, -1.591647, 0.7764706, 1, 0, 1,
-0.8270394, 0.1803342, -1.688158, 0.7686275, 1, 0, 1,
-0.8252543, -0.2850128, -0.04061254, 0.7647059, 1, 0, 1,
-0.8248134, -0.1659924, -3.020121, 0.7568628, 1, 0, 1,
-0.819822, 1.692601, -0.7443195, 0.7529412, 1, 0, 1,
-0.8165441, 0.6922349, -0.9228543, 0.7450981, 1, 0, 1,
-0.8165415, 1.158169, -0.8974822, 0.7411765, 1, 0, 1,
-0.8161537, 0.6896808, -0.2037122, 0.7333333, 1, 0, 1,
-0.8133648, -0.2085587, -1.407072, 0.7294118, 1, 0, 1,
-0.8122979, -0.8990089, -1.30567, 0.7215686, 1, 0, 1,
-0.8111662, -2.150087, -4.073872, 0.7176471, 1, 0, 1,
-0.8077971, 1.075228, -1.911288, 0.7098039, 1, 0, 1,
-0.8073893, -0.8730838, -2.783741, 0.7058824, 1, 0, 1,
-0.8020044, -0.5457384, -2.383081, 0.6980392, 1, 0, 1,
-0.7964301, -0.4063202, -2.002548, 0.6901961, 1, 0, 1,
-0.7929739, 0.1751895, -1.843494, 0.6862745, 1, 0, 1,
-0.7850588, -1.951926, -3.725343, 0.6784314, 1, 0, 1,
-0.7839448, 0.03020525, -1.032395, 0.6745098, 1, 0, 1,
-0.7769572, 0.1303765, -0.4761042, 0.6666667, 1, 0, 1,
-0.7744668, -0.1227894, -1.860244, 0.6627451, 1, 0, 1,
-0.7738113, -2.6121, -3.661564, 0.654902, 1, 0, 1,
-0.7732998, -0.6335982, -3.798571, 0.6509804, 1, 0, 1,
-0.7721658, 0.3385123, -1.092089, 0.6431373, 1, 0, 1,
-0.7694458, 2.265395, -1.61189, 0.6392157, 1, 0, 1,
-0.7632872, -0.02578764, -3.177426, 0.6313726, 1, 0, 1,
-0.7586877, -0.7790755, -3.423704, 0.627451, 1, 0, 1,
-0.7576222, -0.4805612, -2.89624, 0.6196079, 1, 0, 1,
-0.7565821, 0.07373422, 0.4333604, 0.6156863, 1, 0, 1,
-0.7556618, -0.8819367, -1.700937, 0.6078432, 1, 0, 1,
-0.7531395, 0.318703, -0.9739627, 0.6039216, 1, 0, 1,
-0.7521986, -2.045044, -1.650244, 0.5960785, 1, 0, 1,
-0.7473761, 0.3903546, -0.1291951, 0.5882353, 1, 0, 1,
-0.7426783, -0.7588467, -1.49943, 0.5843138, 1, 0, 1,
-0.7388952, -1.053402, -2.337587, 0.5764706, 1, 0, 1,
-0.7379992, -1.087084, -2.181291, 0.572549, 1, 0, 1,
-0.7358511, -1.604383, -2.436451, 0.5647059, 1, 0, 1,
-0.7291071, 1.341528, -1.258596, 0.5607843, 1, 0, 1,
-0.7171444, 0.7850875, -0.8233655, 0.5529412, 1, 0, 1,
-0.7139165, -1.386373, -2.895672, 0.5490196, 1, 0, 1,
-0.7105067, 0.6012948, -0.5291931, 0.5411765, 1, 0, 1,
-0.7103932, -1.354431, -2.728006, 0.5372549, 1, 0, 1,
-0.7094065, 1.993011, -0.7920747, 0.5294118, 1, 0, 1,
-0.7088126, 0.5487701, -1.423485, 0.5254902, 1, 0, 1,
-0.7027091, -0.2521765, -0.7615284, 0.5176471, 1, 0, 1,
-0.7004408, 2.177049, -0.6928053, 0.5137255, 1, 0, 1,
-0.6979164, 0.5623161, 1.446733, 0.5058824, 1, 0, 1,
-0.6916795, -1.380352, -2.482549, 0.5019608, 1, 0, 1,
-0.688127, -0.9506958, -2.634318, 0.4941176, 1, 0, 1,
-0.6841618, 0.8857387, -1.442209, 0.4862745, 1, 0, 1,
-0.6823521, -0.6257874, -2.737223, 0.4823529, 1, 0, 1,
-0.6760067, -0.1892118, -3.251242, 0.4745098, 1, 0, 1,
-0.6743668, 1.113549, 0.4858106, 0.4705882, 1, 0, 1,
-0.67313, 0.4354932, 1.175628, 0.4627451, 1, 0, 1,
-0.6691836, -1.82726, -3.590567, 0.4588235, 1, 0, 1,
-0.6682135, -0.7170004, -5.080023, 0.4509804, 1, 0, 1,
-0.667284, -0.1634271, -3.030103, 0.4470588, 1, 0, 1,
-0.6647658, -0.7964313, -3.602082, 0.4392157, 1, 0, 1,
-0.6633449, 2.189502, 1.366271, 0.4352941, 1, 0, 1,
-0.6630172, -0.2162204, -1.386227, 0.427451, 1, 0, 1,
-0.6625662, 0.8090765, -1.513958, 0.4235294, 1, 0, 1,
-0.6619736, -1.822175, -2.751187, 0.4156863, 1, 0, 1,
-0.6603967, -0.7902995, -1.153428, 0.4117647, 1, 0, 1,
-0.6575136, 0.4861364, -3.34485, 0.4039216, 1, 0, 1,
-0.648479, -0.5665884, -2.259597, 0.3960784, 1, 0, 1,
-0.647837, -0.5008468, -3.009435, 0.3921569, 1, 0, 1,
-0.6439106, 0.9051309, -3.069128, 0.3843137, 1, 0, 1,
-0.6414344, 0.1052847, 0.8704908, 0.3803922, 1, 0, 1,
-0.637638, -0.6805992, -2.022521, 0.372549, 1, 0, 1,
-0.6340089, 0.2762038, -2.489853, 0.3686275, 1, 0, 1,
-0.6337108, -1.049343, -1.949901, 0.3607843, 1, 0, 1,
-0.6307345, 0.5868672, -2.672042, 0.3568628, 1, 0, 1,
-0.6240825, -1.378206, -3.181136, 0.3490196, 1, 0, 1,
-0.619022, -0.508899, -1.716418, 0.345098, 1, 0, 1,
-0.6185769, -0.8309491, -2.606701, 0.3372549, 1, 0, 1,
-0.6181093, -0.02124069, -3.533437, 0.3333333, 1, 0, 1,
-0.6171189, -1.238948, -3.501482, 0.3254902, 1, 0, 1,
-0.6169457, -0.9928062, -2.874569, 0.3215686, 1, 0, 1,
-0.6168257, 0.04546365, -1.122902, 0.3137255, 1, 0, 1,
-0.6155046, -1.09087, -3.135365, 0.3098039, 1, 0, 1,
-0.6145274, -1.098209, -0.2075077, 0.3019608, 1, 0, 1,
-0.6085024, 0.9819573, 0.8204873, 0.2941177, 1, 0, 1,
-0.6067891, 0.3102129, -0.1130294, 0.2901961, 1, 0, 1,
-0.6054651, 0.6158968, -2.255553, 0.282353, 1, 0, 1,
-0.6027262, -0.1739952, -1.589939, 0.2784314, 1, 0, 1,
-0.602155, 0.8949611, 0.6267949, 0.2705882, 1, 0, 1,
-0.6016303, -0.7878292, -3.903718, 0.2666667, 1, 0, 1,
-0.5878925, -0.1372369, -2.330047, 0.2588235, 1, 0, 1,
-0.5876338, -0.3501852, -3.09116, 0.254902, 1, 0, 1,
-0.5819118, 0.3336875, -0.3765745, 0.2470588, 1, 0, 1,
-0.5795408, -0.1888143, -0.2921044, 0.2431373, 1, 0, 1,
-0.5711556, -0.9446239, -1.813538, 0.2352941, 1, 0, 1,
-0.5704389, 0.47468, -1.775971, 0.2313726, 1, 0, 1,
-0.567946, 0.6649752, -1.83319, 0.2235294, 1, 0, 1,
-0.5628125, 0.07264604, -1.519608, 0.2196078, 1, 0, 1,
-0.5623626, 0.8147868, -3.007906, 0.2117647, 1, 0, 1,
-0.55946, -0.4309663, -2.632706, 0.2078431, 1, 0, 1,
-0.5586372, -0.5686831, -2.091501, 0.2, 1, 0, 1,
-0.5580257, -0.5572345, -3.188079, 0.1921569, 1, 0, 1,
-0.5572038, 0.4510503, -2.030206, 0.1882353, 1, 0, 1,
-0.5532532, -1.184458, -2.497536, 0.1803922, 1, 0, 1,
-0.5523154, 0.6477044, 0.9536344, 0.1764706, 1, 0, 1,
-0.5517262, 1.015503, -1.624534, 0.1686275, 1, 0, 1,
-0.548506, -1.783077, -2.728877, 0.1647059, 1, 0, 1,
-0.5476644, 0.086449, -0.3016836, 0.1568628, 1, 0, 1,
-0.5459258, 1.856433, -0.5555416, 0.1529412, 1, 0, 1,
-0.5419969, -1.270135, -3.544876, 0.145098, 1, 0, 1,
-0.5406646, 1.170766, -1.861078, 0.1411765, 1, 0, 1,
-0.5377283, -1.439998, -3.082027, 0.1333333, 1, 0, 1,
-0.5336221, 0.2164072, -0.6138316, 0.1294118, 1, 0, 1,
-0.5277862, -0.4541271, -3.664974, 0.1215686, 1, 0, 1,
-0.5202493, 0.4897397, -1.346665, 0.1176471, 1, 0, 1,
-0.5156678, 0.2318951, -0.6189949, 0.1098039, 1, 0, 1,
-0.4999453, 0.3816991, -0.1793655, 0.1058824, 1, 0, 1,
-0.4994092, 0.06714965, -0.1999756, 0.09803922, 1, 0, 1,
-0.4993432, 1.661092, -1.927423, 0.09019608, 1, 0, 1,
-0.4990716, -0.1589258, -2.036475, 0.08627451, 1, 0, 1,
-0.493922, 1.177158, -0.99209, 0.07843138, 1, 0, 1,
-0.4908038, -0.5385213, -3.252691, 0.07450981, 1, 0, 1,
-0.4824532, -0.8323583, -4.092165, 0.06666667, 1, 0, 1,
-0.4771518, 0.9124612, 0.3949854, 0.0627451, 1, 0, 1,
-0.4720583, -1.056621, -2.315038, 0.05490196, 1, 0, 1,
-0.463406, 0.4110232, -3.017179, 0.05098039, 1, 0, 1,
-0.4594221, 0.9622536, 0.8517288, 0.04313726, 1, 0, 1,
-0.4580958, 0.8096628, -0.1963092, 0.03921569, 1, 0, 1,
-0.4571896, -1.502885, -3.219898, 0.03137255, 1, 0, 1,
-0.4556083, 0.3923014, -1.173464, 0.02745098, 1, 0, 1,
-0.4527453, -0.9862245, -3.007161, 0.01960784, 1, 0, 1,
-0.4505412, 0.1264073, -0.9219718, 0.01568628, 1, 0, 1,
-0.4499401, 1.243954, -1.163663, 0.007843138, 1, 0, 1,
-0.4439384, 0.2674029, -1.942672, 0.003921569, 1, 0, 1,
-0.4411236, -2.318023, -5.334755, 0, 1, 0.003921569, 1,
-0.4409929, 0.6606258, 0.6554552, 0, 1, 0.01176471, 1,
-0.4380471, 0.9170442, -0.5065826, 0, 1, 0.01568628, 1,
-0.4317639, 0.8128774, 0.2944511, 0, 1, 0.02352941, 1,
-0.4306689, -0.01634576, -2.904086, 0, 1, 0.02745098, 1,
-0.4258337, 0.3745982, -0.5047945, 0, 1, 0.03529412, 1,
-0.4248409, -1.542308, -3.795316, 0, 1, 0.03921569, 1,
-0.4233559, -0.811194, -4.39632, 0, 1, 0.04705882, 1,
-0.4220008, 0.6419725, -1.270888, 0, 1, 0.05098039, 1,
-0.4180416, 0.1514969, -0.3875476, 0, 1, 0.05882353, 1,
-0.414899, -1.915372, -1.951328, 0, 1, 0.0627451, 1,
-0.4142246, 0.5315231, -0.8511397, 0, 1, 0.07058824, 1,
-0.4130565, -1.229794, -2.517844, 0, 1, 0.07450981, 1,
-0.4108972, 0.5628282, -1.176786, 0, 1, 0.08235294, 1,
-0.4081073, -0.07397336, -1.455601, 0, 1, 0.08627451, 1,
-0.4072066, -0.6599098, -3.021295, 0, 1, 0.09411765, 1,
-0.4067624, -1.350614, -2.223356, 0, 1, 0.1019608, 1,
-0.4052698, -1.083458, -3.116209, 0, 1, 0.1058824, 1,
-0.3870876, 0.6898192, -0.1499444, 0, 1, 0.1137255, 1,
-0.3833366, 0.6310153, 0.2898896, 0, 1, 0.1176471, 1,
-0.3815203, -0.2512077, -3.216667, 0, 1, 0.1254902, 1,
-0.3806854, -0.2633292, -1.438151, 0, 1, 0.1294118, 1,
-0.3780876, 0.1975422, -1.178236, 0, 1, 0.1372549, 1,
-0.3742245, -1.975903, -2.918089, 0, 1, 0.1411765, 1,
-0.3697207, -0.376604, -2.12146, 0, 1, 0.1490196, 1,
-0.368006, -0.07238567, -0.9051908, 0, 1, 0.1529412, 1,
-0.3668239, 2.469893, 1.45073, 0, 1, 0.1607843, 1,
-0.3638227, 0.1394877, -0.3841638, 0, 1, 0.1647059, 1,
-0.3635357, -0.32989, -1.052159, 0, 1, 0.172549, 1,
-0.360427, 1.924745, -0.4222951, 0, 1, 0.1764706, 1,
-0.3583674, 0.3761029, -0.7820426, 0, 1, 0.1843137, 1,
-0.3576814, 0.8899819, -2.24725, 0, 1, 0.1882353, 1,
-0.3553635, 0.0586461, -1.81029, 0, 1, 0.1960784, 1,
-0.3406026, -0.2923639, -1.164032, 0, 1, 0.2039216, 1,
-0.3404701, -0.8289153, -2.203563, 0, 1, 0.2078431, 1,
-0.335238, -0.06155667, -2.315247, 0, 1, 0.2156863, 1,
-0.3296854, 1.370247, 0.7968609, 0, 1, 0.2196078, 1,
-0.323642, -0.8434668, -2.65245, 0, 1, 0.227451, 1,
-0.3220004, -0.7922324, -2.298648, 0, 1, 0.2313726, 1,
-0.3124861, -1.142632, -3.159929, 0, 1, 0.2392157, 1,
-0.3108681, -0.9287327, -2.240986, 0, 1, 0.2431373, 1,
-0.3084204, 0.3477347, -1.017953, 0, 1, 0.2509804, 1,
-0.3059034, -0.1685155, -2.092244, 0, 1, 0.254902, 1,
-0.305684, -1.904189, -2.696593, 0, 1, 0.2627451, 1,
-0.3045349, -1.588212, -4.620385, 0, 1, 0.2666667, 1,
-0.2941171, 0.3478363, -2.159684, 0, 1, 0.2745098, 1,
-0.2904282, 0.4718376, -0.3144976, 0, 1, 0.2784314, 1,
-0.2892872, 1.295343, -0.3866307, 0, 1, 0.2862745, 1,
-0.2839905, 0.729322, -1.775439, 0, 1, 0.2901961, 1,
-0.2833714, -0.7100229, -1.448287, 0, 1, 0.2980392, 1,
-0.2799282, 1.143595, -0.2611725, 0, 1, 0.3058824, 1,
-0.27742, 1.042549, 0.5117989, 0, 1, 0.3098039, 1,
-0.2772874, 0.2106412, -1.419344, 0, 1, 0.3176471, 1,
-0.276565, -1.774873, -3.148371, 0, 1, 0.3215686, 1,
-0.2758046, 0.8250903, 0.06032831, 0, 1, 0.3294118, 1,
-0.2737924, -1.015694, -2.304105, 0, 1, 0.3333333, 1,
-0.2639354, -1.183223, -3.395835, 0, 1, 0.3411765, 1,
-0.2623018, -0.2429775, -0.490049, 0, 1, 0.345098, 1,
-0.2615101, 0.2245719, 0.9567682, 0, 1, 0.3529412, 1,
-0.2521577, -0.9421575, -1.843396, 0, 1, 0.3568628, 1,
-0.2514645, 0.2493465, -2.257223, 0, 1, 0.3647059, 1,
-0.2486303, 0.4775441, 0.1414293, 0, 1, 0.3686275, 1,
-0.2470375, 1.517885, 0.4003855, 0, 1, 0.3764706, 1,
-0.2426656, 0.4288485, 0.05914822, 0, 1, 0.3803922, 1,
-0.2414734, -1.754735, -3.217543, 0, 1, 0.3882353, 1,
-0.2408899, 1.414799, 0.510223, 0, 1, 0.3921569, 1,
-0.2376813, 0.4150107, -0.302234, 0, 1, 0.4, 1,
-0.2344774, 1.810125, -1.206825, 0, 1, 0.4078431, 1,
-0.2337768, 0.2584627, -1.421703, 0, 1, 0.4117647, 1,
-0.2321859, -0.8099916, -4.64628, 0, 1, 0.4196078, 1,
-0.2248085, -0.1852978, -2.748785, 0, 1, 0.4235294, 1,
-0.2187022, -0.5282298, -1.986046, 0, 1, 0.4313726, 1,
-0.2166609, 0.9985958, 1.248323, 0, 1, 0.4352941, 1,
-0.2108276, -1.382339, -1.34812, 0, 1, 0.4431373, 1,
-0.2099678, -0.9247572, -3.070713, 0, 1, 0.4470588, 1,
-0.2081863, -0.6326337, -3.037001, 0, 1, 0.454902, 1,
-0.2029624, -0.0439897, 0.5244155, 0, 1, 0.4588235, 1,
-0.1994351, 0.01433427, 0.1082267, 0, 1, 0.4666667, 1,
-0.1974522, -1.833343, -1.906786, 0, 1, 0.4705882, 1,
-0.1971526, -0.9643165, -3.847258, 0, 1, 0.4784314, 1,
-0.1928574, -1.492705, -3.911942, 0, 1, 0.4823529, 1,
-0.1915612, -0.2801206, -2.17977, 0, 1, 0.4901961, 1,
-0.1886596, -0.2717991, -2.750583, 0, 1, 0.4941176, 1,
-0.1881104, 0.4946228, 0.007587423, 0, 1, 0.5019608, 1,
-0.1875758, -1.696225, -2.513632, 0, 1, 0.509804, 1,
-0.1835214, -1.444601, -4.012114, 0, 1, 0.5137255, 1,
-0.1830358, -0.4192657, -2.514106, 0, 1, 0.5215687, 1,
-0.1804955, -0.6941866, -3.535597, 0, 1, 0.5254902, 1,
-0.1796491, -0.5168515, -3.356545, 0, 1, 0.5333334, 1,
-0.1796238, -1.032171, -4.471889, 0, 1, 0.5372549, 1,
-0.1760733, -0.8897415, -1.183343, 0, 1, 0.5450981, 1,
-0.176018, -0.1158353, -0.7649508, 0, 1, 0.5490196, 1,
-0.1751915, 2.075746, -0.6365522, 0, 1, 0.5568628, 1,
-0.1741638, 0.4345269, -1.853438, 0, 1, 0.5607843, 1,
-0.1700092, 0.1855687, 0.4493923, 0, 1, 0.5686275, 1,
-0.168379, 0.5395907, -1.110867, 0, 1, 0.572549, 1,
-0.1672145, 0.6079659, 0.07378054, 0, 1, 0.5803922, 1,
-0.1628153, 0.1472397, 0.5032049, 0, 1, 0.5843138, 1,
-0.1551629, 0.1488347, -1.170052, 0, 1, 0.5921569, 1,
-0.153749, 0.9992424, 0.6086062, 0, 1, 0.5960785, 1,
-0.1533315, -0.2868467, -2.545811, 0, 1, 0.6039216, 1,
-0.1520596, -0.6331632, -3.482039, 0, 1, 0.6117647, 1,
-0.1495531, -0.01159562, -1.296777, 0, 1, 0.6156863, 1,
-0.149544, -1.532188, -1.276613, 0, 1, 0.6235294, 1,
-0.1378458, -0.7330478, -0.7537089, 0, 1, 0.627451, 1,
-0.1305306, 0.04187557, -2.295407, 0, 1, 0.6352941, 1,
-0.1305204, 0.4819496, 0.179199, 0, 1, 0.6392157, 1,
-0.1282076, 0.3239426, -1.195066, 0, 1, 0.6470588, 1,
-0.1177877, 2.953451, 0.06357001, 0, 1, 0.6509804, 1,
-0.1175111, 0.7386231, 0.4002291, 0, 1, 0.6588235, 1,
-0.1167543, 0.1286103, -0.7601739, 0, 1, 0.6627451, 1,
-0.1161517, -0.1418994, -4.400654, 0, 1, 0.6705883, 1,
-0.1107927, 0.2700339, 0.3920956, 0, 1, 0.6745098, 1,
-0.1096635, -0.06967345, -1.737564, 0, 1, 0.682353, 1,
-0.1084403, 0.6942647, -1.116265, 0, 1, 0.6862745, 1,
-0.107497, 1.599091, 0.4439056, 0, 1, 0.6941177, 1,
-0.1022176, -1.927506, -3.619085, 0, 1, 0.7019608, 1,
-0.09585959, 0.9725986, -0.7105271, 0, 1, 0.7058824, 1,
-0.09494907, 2.172077, -2.284952, 0, 1, 0.7137255, 1,
-0.09260053, 0.6783054, -1.001812, 0, 1, 0.7176471, 1,
-0.0909125, 1.4439, -0.4639304, 0, 1, 0.7254902, 1,
-0.09085371, 0.8020759, -1.572903, 0, 1, 0.7294118, 1,
-0.09003229, -0.4934975, -2.709976, 0, 1, 0.7372549, 1,
-0.08459479, -0.4696563, -2.065898, 0, 1, 0.7411765, 1,
-0.08422662, -0.3070725, -1.519956, 0, 1, 0.7490196, 1,
-0.0832546, -0.4761972, -2.913138, 0, 1, 0.7529412, 1,
-0.08296234, -0.5150195, -4.133543, 0, 1, 0.7607843, 1,
-0.08291013, 0.5992492, -0.5270655, 0, 1, 0.7647059, 1,
-0.08135989, -0.8996201, -3.139094, 0, 1, 0.772549, 1,
-0.07840995, 0.6713647, -0.5052747, 0, 1, 0.7764706, 1,
-0.07781024, -2.495825, -2.094729, 0, 1, 0.7843137, 1,
-0.0748938, 0.1545209, -0.4549484, 0, 1, 0.7882353, 1,
-0.07373592, 1.128767, 0.07328635, 0, 1, 0.7960784, 1,
-0.07241227, -1.290029, -2.974171, 0, 1, 0.8039216, 1,
-0.06644744, 0.8913429, -0.2797853, 0, 1, 0.8078431, 1,
-0.06587695, 1.216455, -0.9539059, 0, 1, 0.8156863, 1,
-0.05715414, 0.03852137, -0.6395099, 0, 1, 0.8196079, 1,
-0.05196185, -0.02357754, -1.988519, 0, 1, 0.827451, 1,
-0.05098139, 1.91446, 0.4394543, 0, 1, 0.8313726, 1,
-0.04878909, -0.07190432, -1.118389, 0, 1, 0.8392157, 1,
-0.04811785, 0.9889208, 0.914398, 0, 1, 0.8431373, 1,
-0.04669224, 2.024196, -0.2964091, 0, 1, 0.8509804, 1,
-0.04598967, -1.494165, -4.244624, 0, 1, 0.854902, 1,
-0.04313316, -0.7553901, -2.201396, 0, 1, 0.8627451, 1,
-0.04184682, -2.552008, -2.669906, 0, 1, 0.8666667, 1,
-0.04058646, -0.3411071, -4.036225, 0, 1, 0.8745098, 1,
-0.0384195, -2.406948, -3.561094, 0, 1, 0.8784314, 1,
-0.03326359, 0.9532824, 0.3557582, 0, 1, 0.8862745, 1,
-0.0330208, 1.272237, -1.597719, 0, 1, 0.8901961, 1,
-0.03295005, 1.076555, 0.04762976, 0, 1, 0.8980392, 1,
-0.03209603, -0.3995277, -1.839489, 0, 1, 0.9058824, 1,
-0.02890418, 0.3204908, 0.4300058, 0, 1, 0.9098039, 1,
-0.02868444, -0.01794538, -1.093744, 0, 1, 0.9176471, 1,
-0.02805538, 1.309489, -0.8990573, 0, 1, 0.9215686, 1,
-0.02724971, 0.1647506, -1.366538, 0, 1, 0.9294118, 1,
-0.0171454, -1.595305, -2.708252, 0, 1, 0.9333333, 1,
-0.01016092, 0.3010039, -1.848506, 0, 1, 0.9411765, 1,
-0.001679356, -2.173304, -2.434061, 0, 1, 0.945098, 1,
-0.0009050067, -0.9855803, -3.437167, 0, 1, 0.9529412, 1,
0.002532076, 0.7014288, 1.580564, 0, 1, 0.9568627, 1,
0.006881903, -0.3888736, 2.154668, 0, 1, 0.9647059, 1,
0.007309399, 0.5146709, -0.7338429, 0, 1, 0.9686275, 1,
0.007663281, 0.4037264, 0.8223313, 0, 1, 0.9764706, 1,
0.0089634, -0.6056882, 3.17585, 0, 1, 0.9803922, 1,
0.01464712, 1.148345, -0.5404963, 0, 1, 0.9882353, 1,
0.01729165, -0.1766131, 2.673969, 0, 1, 0.9921569, 1,
0.0174293, -0.8067976, 3.2458, 0, 1, 1, 1,
0.02690921, 0.04590842, -0.2020202, 0, 0.9921569, 1, 1,
0.02818708, 0.01890507, 1.72232, 0, 0.9882353, 1, 1,
0.02829355, -0.7792146, 2.757122, 0, 0.9803922, 1, 1,
0.03039725, 0.1907609, -0.7517999, 0, 0.9764706, 1, 1,
0.03077672, -0.5573748, 1.513002, 0, 0.9686275, 1, 1,
0.03105314, 1.091182, 0.7979547, 0, 0.9647059, 1, 1,
0.03253001, -1.018558, 1.822357, 0, 0.9568627, 1, 1,
0.03592551, 1.775147, 0.7788329, 0, 0.9529412, 1, 1,
0.03752843, 0.7495857, 0.5631224, 0, 0.945098, 1, 1,
0.03944828, 1.120017, 0.7254428, 0, 0.9411765, 1, 1,
0.0433946, -0.1609272, 3.565519, 0, 0.9333333, 1, 1,
0.04493741, 1.240538, -0.8424857, 0, 0.9294118, 1, 1,
0.04682837, -1.493582, 4.594961, 0, 0.9215686, 1, 1,
0.04836312, -0.5056861, 4.878694, 0, 0.9176471, 1, 1,
0.05486669, -0.8799496, 3.458167, 0, 0.9098039, 1, 1,
0.05558739, 0.01456285, 2.161784, 0, 0.9058824, 1, 1,
0.05608741, 1.028556, 0.6592104, 0, 0.8980392, 1, 1,
0.05957067, 0.6442716, 0.1952506, 0, 0.8901961, 1, 1,
0.06065508, -0.02294512, 3.107031, 0, 0.8862745, 1, 1,
0.06212184, -0.8285324, 2.668147, 0, 0.8784314, 1, 1,
0.06311288, 1.609651, -0.3095284, 0, 0.8745098, 1, 1,
0.06525443, 0.6947131, 0.3679958, 0, 0.8666667, 1, 1,
0.06934396, -0.04287655, 1.267566, 0, 0.8627451, 1, 1,
0.07058419, -1.189476, 3.842165, 0, 0.854902, 1, 1,
0.07321464, 0.04643413, 2.478101, 0, 0.8509804, 1, 1,
0.07837836, -0.2749436, 3.91841, 0, 0.8431373, 1, 1,
0.07877395, -0.8867574, 4.140221, 0, 0.8392157, 1, 1,
0.08245754, -0.641563, 0.8747522, 0, 0.8313726, 1, 1,
0.08306216, 0.05721271, 0.3845544, 0, 0.827451, 1, 1,
0.08313265, -0.5953988, 4.935182, 0, 0.8196079, 1, 1,
0.08400677, -1.534581, 1.718992, 0, 0.8156863, 1, 1,
0.08561393, -1.333027, 2.168905, 0, 0.8078431, 1, 1,
0.08964875, 0.3249056, -0.425106, 0, 0.8039216, 1, 1,
0.0907979, 0.2078502, 0.7375161, 0, 0.7960784, 1, 1,
0.09310786, 1.562842, 0.9586115, 0, 0.7882353, 1, 1,
0.09367022, 1.116905, -0.5696401, 0, 0.7843137, 1, 1,
0.1007886, 1.021252, 0.7852505, 0, 0.7764706, 1, 1,
0.1043367, -0.7924243, 1.258555, 0, 0.772549, 1, 1,
0.1088249, -0.2574816, 3.740776, 0, 0.7647059, 1, 1,
0.1122589, 0.5503061, -0.2480107, 0, 0.7607843, 1, 1,
0.1146123, 0.8599728, 1.081718, 0, 0.7529412, 1, 1,
0.1149543, 0.144578, 1.375961, 0, 0.7490196, 1, 1,
0.1228343, -0.4838192, 2.052628, 0, 0.7411765, 1, 1,
0.1242983, -1.002251, 3.26875, 0, 0.7372549, 1, 1,
0.1250354, 0.4576699, 0.9592614, 0, 0.7294118, 1, 1,
0.1272314, -1.302068, 2.107613, 0, 0.7254902, 1, 1,
0.1359653, 0.04702396, 1.038909, 0, 0.7176471, 1, 1,
0.1377841, -0.7063774, 3.21252, 0, 0.7137255, 1, 1,
0.1410791, 1.609603, 2.19665, 0, 0.7058824, 1, 1,
0.1416607, 0.8510605, -1.043646, 0, 0.6980392, 1, 1,
0.1432576, 0.243288, 0.1319027, 0, 0.6941177, 1, 1,
0.14477, 0.3980697, -0.4585723, 0, 0.6862745, 1, 1,
0.1470683, -1.33274, 3.27898, 0, 0.682353, 1, 1,
0.151234, 0.7489825, 0.5956032, 0, 0.6745098, 1, 1,
0.1539487, -0.248131, 1.981573, 0, 0.6705883, 1, 1,
0.154091, -0.6980106, 2.084172, 0, 0.6627451, 1, 1,
0.1637624, -0.36897, 1.904657, 0, 0.6588235, 1, 1,
0.1646986, 0.3979712, -0.1219508, 0, 0.6509804, 1, 1,
0.1665877, -1.878414, 3.827046, 0, 0.6470588, 1, 1,
0.1676306, -0.6086034, 3.349777, 0, 0.6392157, 1, 1,
0.1683575, -0.0415565, 1.260858, 0, 0.6352941, 1, 1,
0.1691707, 0.8873942, 0.2813618, 0, 0.627451, 1, 1,
0.1718214, 0.6951924, 2.021188, 0, 0.6235294, 1, 1,
0.1720089, -0.1555318, 3.643325, 0, 0.6156863, 1, 1,
0.1728397, -0.008346193, 0.3163908, 0, 0.6117647, 1, 1,
0.1776282, -0.9563636, 3.421427, 0, 0.6039216, 1, 1,
0.1789677, -0.8897071, 2.829366, 0, 0.5960785, 1, 1,
0.1792891, 1.15307, -0.334529, 0, 0.5921569, 1, 1,
0.1831712, -0.2197697, 3.78699, 0, 0.5843138, 1, 1,
0.1883113, 1.198605, 1.182243, 0, 0.5803922, 1, 1,
0.1910793, 0.500073, 0.1202226, 0, 0.572549, 1, 1,
0.1969702, 2.900275, -0.3742328, 0, 0.5686275, 1, 1,
0.2019, -0.9165621, 1.321213, 0, 0.5607843, 1, 1,
0.2038892, -0.3979474, 2.484312, 0, 0.5568628, 1, 1,
0.206926, 0.0892894, 0.9072542, 0, 0.5490196, 1, 1,
0.2145262, 1.18714, -1.659839, 0, 0.5450981, 1, 1,
0.2149488, -0.1735916, 3.47898, 0, 0.5372549, 1, 1,
0.220972, 0.5603854, 0.5502987, 0, 0.5333334, 1, 1,
0.2222042, -0.4127175, 3.987327, 0, 0.5254902, 1, 1,
0.2241235, 0.1963272, -0.1718187, 0, 0.5215687, 1, 1,
0.2245072, 1.367278, -0.5393223, 0, 0.5137255, 1, 1,
0.2250172, 0.1854234, -0.5621103, 0, 0.509804, 1, 1,
0.2269479, -0.2657038, 2.764206, 0, 0.5019608, 1, 1,
0.228669, 0.1521508, 0.8257126, 0, 0.4941176, 1, 1,
0.2305829, 0.006547863, 1.343707, 0, 0.4901961, 1, 1,
0.2430786, -1.250173, 3.294373, 0, 0.4823529, 1, 1,
0.2431044, -0.009527352, 1.833212, 0, 0.4784314, 1, 1,
0.2436616, 0.242368, 3.187665, 0, 0.4705882, 1, 1,
0.2438348, -0.6462551, 2.223379, 0, 0.4666667, 1, 1,
0.2448179, 0.4105487, 0.04711261, 0, 0.4588235, 1, 1,
0.2481182, -0.2200688, 1.781437, 0, 0.454902, 1, 1,
0.2489735, -2.239133, 3.518458, 0, 0.4470588, 1, 1,
0.2490788, -0.4426332, 2.107777, 0, 0.4431373, 1, 1,
0.2511984, -0.4315437, 3.062656, 0, 0.4352941, 1, 1,
0.2538768, -0.4193456, 2.980361, 0, 0.4313726, 1, 1,
0.254286, -0.9226779, 3.622965, 0, 0.4235294, 1, 1,
0.2545802, -1.272135, 2.855386, 0, 0.4196078, 1, 1,
0.2563434, -1.16473, 2.249904, 0, 0.4117647, 1, 1,
0.2567991, -0.5558696, 1.729596, 0, 0.4078431, 1, 1,
0.2619253, 0.11476, -0.6785585, 0, 0.4, 1, 1,
0.2622144, -0.4906998, 3.5736, 0, 0.3921569, 1, 1,
0.2624241, 0.5193833, 1.213633, 0, 0.3882353, 1, 1,
0.2668948, -1.000125, 2.880293, 0, 0.3803922, 1, 1,
0.2684506, -0.394822, 0.7617779, 0, 0.3764706, 1, 1,
0.2708568, 1.057434, 0.547344, 0, 0.3686275, 1, 1,
0.2720604, 1.240443, 0.1574024, 0, 0.3647059, 1, 1,
0.2723708, 1.100097, 1.05635, 0, 0.3568628, 1, 1,
0.2758727, -0.4302445, 2.62638, 0, 0.3529412, 1, 1,
0.2764238, -0.8187305, 4.035631, 0, 0.345098, 1, 1,
0.2830749, 1.612326, -0.9859568, 0, 0.3411765, 1, 1,
0.2833884, 0.4997891, 1.531557, 0, 0.3333333, 1, 1,
0.2852512, -0.2686954, 1.547705, 0, 0.3294118, 1, 1,
0.2853688, 1.461997, 1.475, 0, 0.3215686, 1, 1,
0.2855352, 0.1639433, 1.232979, 0, 0.3176471, 1, 1,
0.2863685, -0.5868565, 1.097402, 0, 0.3098039, 1, 1,
0.2864833, -0.4692163, 2.334576, 0, 0.3058824, 1, 1,
0.2905344, 0.6378301, -0.6284324, 0, 0.2980392, 1, 1,
0.2926972, 1.340336, 0.6061017, 0, 0.2901961, 1, 1,
0.293311, 0.732515, 1.17837, 0, 0.2862745, 1, 1,
0.2933466, -1.251225, 3.11335, 0, 0.2784314, 1, 1,
0.2937688, -1.769241, 2.726622, 0, 0.2745098, 1, 1,
0.3014056, 0.3549303, 2.353203, 0, 0.2666667, 1, 1,
0.3067257, -2.129149, 2.635869, 0, 0.2627451, 1, 1,
0.3116659, 1.486827, -1.851045, 0, 0.254902, 1, 1,
0.3145305, 1.363053, -1.224137, 0, 0.2509804, 1, 1,
0.3148693, 0.06882431, -0.4447562, 0, 0.2431373, 1, 1,
0.3170087, 0.2402466, 3.399827, 0, 0.2392157, 1, 1,
0.3181656, -0.4420622, 3.540049, 0, 0.2313726, 1, 1,
0.3200413, 0.7837337, 1.213457, 0, 0.227451, 1, 1,
0.3233946, 1.06945, 2.711154, 0, 0.2196078, 1, 1,
0.3272222, 0.4129601, 1.503945, 0, 0.2156863, 1, 1,
0.3296726, -1.058121, 2.693112, 0, 0.2078431, 1, 1,
0.329766, -0.5643414, 2.365933, 0, 0.2039216, 1, 1,
0.3316009, -0.4187009, 2.23822, 0, 0.1960784, 1, 1,
0.3344043, -0.5192455, 3.822494, 0, 0.1882353, 1, 1,
0.3345517, -0.7992586, 1.526715, 0, 0.1843137, 1, 1,
0.3345586, -0.8200662, 4.281846, 0, 0.1764706, 1, 1,
0.3383662, 0.1341744, 1.267121, 0, 0.172549, 1, 1,
0.3384193, -0.2528357, 1.626872, 0, 0.1647059, 1, 1,
0.3521492, 1.145248, 0.1557451, 0, 0.1607843, 1, 1,
0.3524482, 0.9798218, 0.3998769, 0, 0.1529412, 1, 1,
0.356114, 0.1650209, 1.743933, 0, 0.1490196, 1, 1,
0.3599366, -0.9399697, 2.112153, 0, 0.1411765, 1, 1,
0.3614143, -0.2268294, 2.05613, 0, 0.1372549, 1, 1,
0.3636212, 1.678627, -0.5174997, 0, 0.1294118, 1, 1,
0.3657565, -0.6048422, 0.9867206, 0, 0.1254902, 1, 1,
0.3663814, -1.404148, 5.664045, 0, 0.1176471, 1, 1,
0.367297, -0.8239551, 2.474492, 0, 0.1137255, 1, 1,
0.3675528, 0.9009363, 0.3074516, 0, 0.1058824, 1, 1,
0.3684811, 0.1655414, -0.6932876, 0, 0.09803922, 1, 1,
0.3706681, -1.241141, 3.357587, 0, 0.09411765, 1, 1,
0.3716795, -0.02709394, 1.818247, 0, 0.08627451, 1, 1,
0.3729573, 1.902228, 0.05824695, 0, 0.08235294, 1, 1,
0.3729829, -0.3287984, 1.180989, 0, 0.07450981, 1, 1,
0.3749254, -0.3189308, 3.812276, 0, 0.07058824, 1, 1,
0.3761574, -1.804332, 1.038864, 0, 0.0627451, 1, 1,
0.3763235, -0.2989315, 2.558443, 0, 0.05882353, 1, 1,
0.3766381, -0.2826996, 1.05918, 0, 0.05098039, 1, 1,
0.3798789, 0.1668062, 1.499112, 0, 0.04705882, 1, 1,
0.380621, 1.109789, -0.5392178, 0, 0.03921569, 1, 1,
0.3817571, 1.128574, -1.628061, 0, 0.03529412, 1, 1,
0.38863, 1.052587, 1.550056, 0, 0.02745098, 1, 1,
0.3890772, -0.3886833, 1.855204, 0, 0.02352941, 1, 1,
0.3960856, -0.8146469, 1.860704, 0, 0.01568628, 1, 1,
0.3979082, -0.8714397, 1.676026, 0, 0.01176471, 1, 1,
0.4025604, -0.259167, 1.381277, 0, 0.003921569, 1, 1,
0.4031193, -1.330455, 0.9077712, 0.003921569, 0, 1, 1,
0.4046786, 2.161752, -1.291127, 0.007843138, 0, 1, 1,
0.4065987, -0.01215628, 1.570307, 0.01568628, 0, 1, 1,
0.4082949, -0.6870195, 1.858519, 0.01960784, 0, 1, 1,
0.411673, -0.554777, 1.308891, 0.02745098, 0, 1, 1,
0.413072, -1.327793, 4.17132, 0.03137255, 0, 1, 1,
0.4130879, 0.4303368, 2.076625, 0.03921569, 0, 1, 1,
0.4144111, 0.2940611, 0.5836356, 0.04313726, 0, 1, 1,
0.4162082, -0.1942005, 4.575098, 0.05098039, 0, 1, 1,
0.4265938, -0.5598445, 1.285459, 0.05490196, 0, 1, 1,
0.4274505, 0.4840568, 0.3355249, 0.0627451, 0, 1, 1,
0.431969, 2.343056, -0.851368, 0.06666667, 0, 1, 1,
0.4425038, -0.9365916, 2.613532, 0.07450981, 0, 1, 1,
0.447355, 0.2647199, 0.2165704, 0.07843138, 0, 1, 1,
0.4516802, -0.0009786593, 1.049169, 0.08627451, 0, 1, 1,
0.4549452, 0.5137228, 0.9779139, 0.09019608, 0, 1, 1,
0.4593541, 0.8771728, 1.244024, 0.09803922, 0, 1, 1,
0.4649314, -0.497359, 2.605973, 0.1058824, 0, 1, 1,
0.4689444, 0.04158314, 1.446158, 0.1098039, 0, 1, 1,
0.4709559, -0.4058699, 1.999412, 0.1176471, 0, 1, 1,
0.4737463, 0.3904612, 0.770787, 0.1215686, 0, 1, 1,
0.4776157, 0.8362228, 1.66051, 0.1294118, 0, 1, 1,
0.4821519, 0.3120754, 0.5925723, 0.1333333, 0, 1, 1,
0.4925836, 0.6020195, 0.7389799, 0.1411765, 0, 1, 1,
0.4981507, -0.4309236, 3.295237, 0.145098, 0, 1, 1,
0.4993062, 0.831356, -0.4548066, 0.1529412, 0, 1, 1,
0.511322, -0.2030378, 1.245245, 0.1568628, 0, 1, 1,
0.5114387, -0.4406966, 1.187847, 0.1647059, 0, 1, 1,
0.5186785, 0.6177623, 0.757949, 0.1686275, 0, 1, 1,
0.5196528, -0.4767429, 3.141981, 0.1764706, 0, 1, 1,
0.5214428, -0.5061923, 0.5706093, 0.1803922, 0, 1, 1,
0.5221455, -1.170496, 3.466884, 0.1882353, 0, 1, 1,
0.5243742, 1.493749, -0.6895817, 0.1921569, 0, 1, 1,
0.5255331, 0.4043927, -0.3950318, 0.2, 0, 1, 1,
0.5266926, -1.87011, 1.874557, 0.2078431, 0, 1, 1,
0.5272967, 0.2974482, -0.5474389, 0.2117647, 0, 1, 1,
0.541137, -0.1308654, 0.8251163, 0.2196078, 0, 1, 1,
0.5424683, -0.8587407, 3.149381, 0.2235294, 0, 1, 1,
0.5427817, -0.8705077, 1.257697, 0.2313726, 0, 1, 1,
0.5433393, 0.7701473, 0.9437408, 0.2352941, 0, 1, 1,
0.5493036, -0.6361506, 2.127023, 0.2431373, 0, 1, 1,
0.5551206, 0.3536262, 0.6869699, 0.2470588, 0, 1, 1,
0.5618833, 0.4550832, 2.167653, 0.254902, 0, 1, 1,
0.5687525, -0.3229908, 2.567083, 0.2588235, 0, 1, 1,
0.5700046, -1.163894, 1.076507, 0.2666667, 0, 1, 1,
0.5845909, 0.4752043, 0.1747973, 0.2705882, 0, 1, 1,
0.5860744, -0.9422041, 2.375284, 0.2784314, 0, 1, 1,
0.5872148, 0.06172189, 2.122227, 0.282353, 0, 1, 1,
0.5886937, 1.96274, 2.424607, 0.2901961, 0, 1, 1,
0.5915016, -0.01526624, 2.1151, 0.2941177, 0, 1, 1,
0.5935814, -0.005617248, 1.368696, 0.3019608, 0, 1, 1,
0.5955405, -0.8117105, 1.362814, 0.3098039, 0, 1, 1,
0.5984846, 1.473164, -3.186539, 0.3137255, 0, 1, 1,
0.6128407, 0.07377782, 1.410475, 0.3215686, 0, 1, 1,
0.6129845, -0.5013695, 3.110167, 0.3254902, 0, 1, 1,
0.6164331, 0.3018612, 1.265252, 0.3333333, 0, 1, 1,
0.6182098, 1.892329, 0.6878666, 0.3372549, 0, 1, 1,
0.618999, -0.002437342, 2.756861, 0.345098, 0, 1, 1,
0.619126, -0.2788723, 1.864769, 0.3490196, 0, 1, 1,
0.6222462, 0.3547238, -0.3825202, 0.3568628, 0, 1, 1,
0.6243016, -0.211034, 1.792102, 0.3607843, 0, 1, 1,
0.625139, -0.3686178, 2.693078, 0.3686275, 0, 1, 1,
0.6268737, -0.2294405, 2.544027, 0.372549, 0, 1, 1,
0.6283919, 1.389207, -0.08720934, 0.3803922, 0, 1, 1,
0.6429067, -0.646373, 1.005916, 0.3843137, 0, 1, 1,
0.6469129, 1.528676, 0.9461334, 0.3921569, 0, 1, 1,
0.648376, 0.3668414, 3.02611, 0.3960784, 0, 1, 1,
0.6511832, 0.8225297, -0.002984763, 0.4039216, 0, 1, 1,
0.651743, 0.9459339, 1.604886, 0.4117647, 0, 1, 1,
0.6548826, 0.2126555, 0.6983495, 0.4156863, 0, 1, 1,
0.657024, -0.5221723, 2.844321, 0.4235294, 0, 1, 1,
0.658179, 0.7173703, 2.022022, 0.427451, 0, 1, 1,
0.6609742, 0.5871164, -0.5129559, 0.4352941, 0, 1, 1,
0.6628056, 0.3656642, 1.986093, 0.4392157, 0, 1, 1,
0.664603, -0.2480557, 1.915529, 0.4470588, 0, 1, 1,
0.6656893, 0.8463421, 0.686547, 0.4509804, 0, 1, 1,
0.6668867, 0.890337, 0.3110049, 0.4588235, 0, 1, 1,
0.6669089, 0.785994, -0.5922043, 0.4627451, 0, 1, 1,
0.6682378, 0.08221664, 3.176691, 0.4705882, 0, 1, 1,
0.670177, 1.039537, 1.332313, 0.4745098, 0, 1, 1,
0.6721095, 1.635919, -0.02932117, 0.4823529, 0, 1, 1,
0.6849543, 1.343707, 0.4924351, 0.4862745, 0, 1, 1,
0.6870873, 0.02867492, 2.090032, 0.4941176, 0, 1, 1,
0.6878035, -0.787998, 1.956163, 0.5019608, 0, 1, 1,
0.692035, 0.06357033, 0.3934621, 0.5058824, 0, 1, 1,
0.6928574, -0.4859956, 1.295541, 0.5137255, 0, 1, 1,
0.6947261, -0.1782728, 3.437208, 0.5176471, 0, 1, 1,
0.6971457, 2.109767, 1.034005, 0.5254902, 0, 1, 1,
0.7026101, -1.076076, 3.052715, 0.5294118, 0, 1, 1,
0.7074637, -0.2777593, 1.84268, 0.5372549, 0, 1, 1,
0.7117992, 1.754288, 0.337804, 0.5411765, 0, 1, 1,
0.717641, -0.3780117, 3.28302, 0.5490196, 0, 1, 1,
0.7176968, 1.168096, 1.487139, 0.5529412, 0, 1, 1,
0.7191032, 0.8455227, 1.08448, 0.5607843, 0, 1, 1,
0.7203802, -0.4770297, 1.008891, 0.5647059, 0, 1, 1,
0.7208638, 1.266804, 0.8915134, 0.572549, 0, 1, 1,
0.7211425, 0.4727946, 1.54751, 0.5764706, 0, 1, 1,
0.7232208, -0.196037, 1.853436, 0.5843138, 0, 1, 1,
0.7250873, -0.2858716, 1.535702, 0.5882353, 0, 1, 1,
0.7280845, -1.169109, 4.213409, 0.5960785, 0, 1, 1,
0.7283179, 0.544571, -0.3940697, 0.6039216, 0, 1, 1,
0.7285957, -2.076174, 3.844089, 0.6078432, 0, 1, 1,
0.7303666, 0.4276944, 2.801514, 0.6156863, 0, 1, 1,
0.73175, -1.641727, 4.497413, 0.6196079, 0, 1, 1,
0.7343702, 3.001216, 1.644804, 0.627451, 0, 1, 1,
0.7375465, -2.447111, 2.097823, 0.6313726, 0, 1, 1,
0.7417952, 0.4368259, 1.114736, 0.6392157, 0, 1, 1,
0.7460569, -1.440627, 2.300232, 0.6431373, 0, 1, 1,
0.7557952, -0.3234556, 2.390489, 0.6509804, 0, 1, 1,
0.7581578, -1.878448, 2.387471, 0.654902, 0, 1, 1,
0.759944, -0.07138339, 1.957556, 0.6627451, 0, 1, 1,
0.7686214, -0.486967, 0.07552101, 0.6666667, 0, 1, 1,
0.7735251, 0.3888158, 2.889714, 0.6745098, 0, 1, 1,
0.7758713, 0.3748784, -0.3398475, 0.6784314, 0, 1, 1,
0.7904097, -1.132785, 2.843548, 0.6862745, 0, 1, 1,
0.7937608, -0.6796704, 3.033212, 0.6901961, 0, 1, 1,
0.7979052, 0.05934398, 1.257232, 0.6980392, 0, 1, 1,
0.8037335, -1.9225, 1.859022, 0.7058824, 0, 1, 1,
0.8218032, 0.1820221, 0.4991815, 0.7098039, 0, 1, 1,
0.8220212, -0.5824096, 2.962798, 0.7176471, 0, 1, 1,
0.8230962, -0.7425853, 3.005143, 0.7215686, 0, 1, 1,
0.8256109, -0.548632, 1.98251, 0.7294118, 0, 1, 1,
0.8290045, -1.487565, 2.618193, 0.7333333, 0, 1, 1,
0.8318874, -0.6642835, 2.290987, 0.7411765, 0, 1, 1,
0.8318903, 2.021129, 0.730705, 0.7450981, 0, 1, 1,
0.8373513, 0.558827, 1.493371, 0.7529412, 0, 1, 1,
0.8418635, -0.4392422, 0.2567371, 0.7568628, 0, 1, 1,
0.8440498, -1.066977, 2.530381, 0.7647059, 0, 1, 1,
0.8447998, -1.06429, 3.627945, 0.7686275, 0, 1, 1,
0.8517424, 0.6080108, 1.630911, 0.7764706, 0, 1, 1,
0.8576646, 0.5422145, 2.616191, 0.7803922, 0, 1, 1,
0.8587504, 1.903507, 0.07498998, 0.7882353, 0, 1, 1,
0.8665742, -0.6511767, 2.407493, 0.7921569, 0, 1, 1,
0.8723231, 0.03929266, 1.048734, 0.8, 0, 1, 1,
0.8821777, 0.946254, 1.994611, 0.8078431, 0, 1, 1,
0.8821803, -0.08019495, 2.620662, 0.8117647, 0, 1, 1,
0.8868669, -0.6188732, 0.8756076, 0.8196079, 0, 1, 1,
0.8878976, -1.794776, 2.218548, 0.8235294, 0, 1, 1,
0.8917322, -1.322417, 3.507919, 0.8313726, 0, 1, 1,
0.8989719, 0.5725997, 1.470148, 0.8352941, 0, 1, 1,
0.9000511, 0.4169407, 2.074802, 0.8431373, 0, 1, 1,
0.9027517, 1.169955, -0.2730449, 0.8470588, 0, 1, 1,
0.9044406, -1.004327, 3.930528, 0.854902, 0, 1, 1,
0.9073867, 0.2568381, 1.625528, 0.8588235, 0, 1, 1,
0.9098786, -0.01358934, 1.901885, 0.8666667, 0, 1, 1,
0.9150149, 0.8871388, -0.1027798, 0.8705882, 0, 1, 1,
0.9159968, -0.3233984, 2.379461, 0.8784314, 0, 1, 1,
0.9253107, -0.1283343, 1.490652, 0.8823529, 0, 1, 1,
0.9397528, -0.1072357, 2.131649, 0.8901961, 0, 1, 1,
0.9440394, -0.586149, 2.216737, 0.8941177, 0, 1, 1,
0.9477249, 0.2423522, 0.5976295, 0.9019608, 0, 1, 1,
0.951529, 0.9461479, 1.72608, 0.9098039, 0, 1, 1,
0.9524243, -1.154903, 3.796485, 0.9137255, 0, 1, 1,
0.9525432, -0.1917787, 2.980144, 0.9215686, 0, 1, 1,
0.9568033, -1.146412, 2.439923, 0.9254902, 0, 1, 1,
0.9585593, 1.455366, 2.462459, 0.9333333, 0, 1, 1,
0.970046, -1.600807, 1.142089, 0.9372549, 0, 1, 1,
0.9714251, 0.5475789, 0.5908818, 0.945098, 0, 1, 1,
0.9796991, 1.387839, -0.4545596, 0.9490196, 0, 1, 1,
0.9830845, 0.8365959, 1.828049, 0.9568627, 0, 1, 1,
0.989522, 0.5679715, 1.246622, 0.9607843, 0, 1, 1,
0.9902301, 0.09916059, 1.379396, 0.9686275, 0, 1, 1,
0.991523, 0.918407, 1.2084, 0.972549, 0, 1, 1,
0.9922454, -1.73129, 3.556926, 0.9803922, 0, 1, 1,
0.9929397, 0.7450728, 0.4058852, 0.9843137, 0, 1, 1,
1.0026, -0.03960993, 0.51008, 0.9921569, 0, 1, 1,
1.014607, 0.04484572, 0.3813297, 0.9960784, 0, 1, 1,
1.016481, 1.617438, 1.487788, 1, 0, 0.9960784, 1,
1.022304, -0.4175382, 2.395473, 1, 0, 0.9882353, 1,
1.023112, -0.2580526, 1.32321, 1, 0, 0.9843137, 1,
1.023763, 1.005464, 0.6776288, 1, 0, 0.9764706, 1,
1.033935, -1.058522, 2.620998, 1, 0, 0.972549, 1,
1.047516, -0.9995381, 1.040652, 1, 0, 0.9647059, 1,
1.049498, 0.01606547, 0.5092186, 1, 0, 0.9607843, 1,
1.049927, 1.118918, 0.5357264, 1, 0, 0.9529412, 1,
1.05367, -1.283146, 3.499454, 1, 0, 0.9490196, 1,
1.05529, 0.02231324, 2.176704, 1, 0, 0.9411765, 1,
1.058779, -0.4471668, 1.072556, 1, 0, 0.9372549, 1,
1.061625, 1.836522, 0.7535303, 1, 0, 0.9294118, 1,
1.064933, 0.1916456, 1.573339, 1, 0, 0.9254902, 1,
1.075603, 0.6664884, -0.04407464, 1, 0, 0.9176471, 1,
1.077796, 0.7750245, 0.1092174, 1, 0, 0.9137255, 1,
1.086829, -0.2983213, 2.457994, 1, 0, 0.9058824, 1,
1.089459, -0.4687755, 2.677596, 1, 0, 0.9019608, 1,
1.092425, 0.9268916, -0.9870616, 1, 0, 0.8941177, 1,
1.092921, 0.2180554, 0.9537198, 1, 0, 0.8862745, 1,
1.09565, 1.320007, -0.7631633, 1, 0, 0.8823529, 1,
1.102278, -0.2855344, 1.345586, 1, 0, 0.8745098, 1,
1.102861, -0.3035298, 1.027128, 1, 0, 0.8705882, 1,
1.106917, -0.6180202, 3.717306, 1, 0, 0.8627451, 1,
1.107618, -0.1326896, 0.6212426, 1, 0, 0.8588235, 1,
1.115577, 0.1048856, -0.155684, 1, 0, 0.8509804, 1,
1.117441, -0.573895, 0.2740673, 1, 0, 0.8470588, 1,
1.118059, -0.3764031, 2.288876, 1, 0, 0.8392157, 1,
1.118993, 0.2561077, 1.335291, 1, 0, 0.8352941, 1,
1.120496, -0.3820922, 2.918198, 1, 0, 0.827451, 1,
1.120564, -0.2294665, 1.017608, 1, 0, 0.8235294, 1,
1.121565, -0.3308829, -0.04468792, 1, 0, 0.8156863, 1,
1.122268, -0.270227, 0.6058142, 1, 0, 0.8117647, 1,
1.123013, 0.7172791, -0.496514, 1, 0, 0.8039216, 1,
1.123585, 0.9978936, 1.85255, 1, 0, 0.7960784, 1,
1.129569, 0.4382106, 1.201674, 1, 0, 0.7921569, 1,
1.134286, 1.471038, -0.2158724, 1, 0, 0.7843137, 1,
1.13886, 0.2054938, 0.4399654, 1, 0, 0.7803922, 1,
1.147237, 0.2937383, 1.650479, 1, 0, 0.772549, 1,
1.14786, -1.547716, 4.86891, 1, 0, 0.7686275, 1,
1.159769, -1.268049, 1.685046, 1, 0, 0.7607843, 1,
1.174291, -0.6523368, 2.842808, 1, 0, 0.7568628, 1,
1.17545, 0.7546458, 1.470689, 1, 0, 0.7490196, 1,
1.176942, 0.7968615, 1.551235, 1, 0, 0.7450981, 1,
1.184479, 0.7890983, 2.411037, 1, 0, 0.7372549, 1,
1.184943, 1.682197, -0.1852088, 1, 0, 0.7333333, 1,
1.186877, -0.2995028, 2.82423, 1, 0, 0.7254902, 1,
1.189062, -0.03172296, 0.1831856, 1, 0, 0.7215686, 1,
1.192417, 0.6874697, 0.9741232, 1, 0, 0.7137255, 1,
1.193193, 2.078281, 0.06078599, 1, 0, 0.7098039, 1,
1.196162, 0.7691139, 0.9931717, 1, 0, 0.7019608, 1,
1.19979, -2.054102, 2.006556, 1, 0, 0.6941177, 1,
1.206511, 1.216513, 1.096587, 1, 0, 0.6901961, 1,
1.207188, 0.486633, 0.02872775, 1, 0, 0.682353, 1,
1.210811, -0.2169462, 0.5390587, 1, 0, 0.6784314, 1,
1.214033, 0.7336119, 1.733136, 1, 0, 0.6705883, 1,
1.226068, -0.6289481, 3.16554, 1, 0, 0.6666667, 1,
1.231906, -1.744014, 2.685654, 1, 0, 0.6588235, 1,
1.235645, 1.824934, 0.6327336, 1, 0, 0.654902, 1,
1.238556, 1.376281, 1.139212, 1, 0, 0.6470588, 1,
1.248393, -0.4979197, 2.374681, 1, 0, 0.6431373, 1,
1.249648, -0.217224, 3.157153, 1, 0, 0.6352941, 1,
1.254983, -0.5988479, 3.481153, 1, 0, 0.6313726, 1,
1.2555, -0.0943482, 0.1018218, 1, 0, 0.6235294, 1,
1.267689, 0.1377524, 0.9575755, 1, 0, 0.6196079, 1,
1.270064, 0.1283459, 0.2231659, 1, 0, 0.6117647, 1,
1.273113, -1.732475, 2.935911, 1, 0, 0.6078432, 1,
1.275515, 0.533757, 0.5356271, 1, 0, 0.6, 1,
1.282273, 1.058853, 0.8487449, 1, 0, 0.5921569, 1,
1.293887, 1.346011, -0.1178761, 1, 0, 0.5882353, 1,
1.297298, 1.050651, 1.109178, 1, 0, 0.5803922, 1,
1.315013, -0.1826314, 2.123556, 1, 0, 0.5764706, 1,
1.315877, -1.026049, 2.57174, 1, 0, 0.5686275, 1,
1.320064, -0.6097842, 3.158202, 1, 0, 0.5647059, 1,
1.335863, -1.43464, 2.010045, 1, 0, 0.5568628, 1,
1.338663, -0.8361026, 2.254973, 1, 0, 0.5529412, 1,
1.346169, -0.9133568, 0.7366433, 1, 0, 0.5450981, 1,
1.355734, 1.142373, 1.199208, 1, 0, 0.5411765, 1,
1.362539, 0.9803948, 0.8423365, 1, 0, 0.5333334, 1,
1.363125, -0.2213349, 0.7090659, 1, 0, 0.5294118, 1,
1.380061, 0.731813, 2.290136, 1, 0, 0.5215687, 1,
1.382925, 0.5451879, 0.2651316, 1, 0, 0.5176471, 1,
1.385645, -2.09366, 4.213804, 1, 0, 0.509804, 1,
1.401883, 0.7886978, 1.553007, 1, 0, 0.5058824, 1,
1.411418, 0.5700801, 1.510042, 1, 0, 0.4980392, 1,
1.426354, 0.2913776, 2.541056, 1, 0, 0.4901961, 1,
1.431705, 0.04199616, 1.577291, 1, 0, 0.4862745, 1,
1.440281, -0.3402449, 1.314106, 1, 0, 0.4784314, 1,
1.442377, 0.4450789, 1.198774, 1, 0, 0.4745098, 1,
1.442603, -0.3779992, 2.675368, 1, 0, 0.4666667, 1,
1.442686, 1.614357, -0.4738933, 1, 0, 0.4627451, 1,
1.445999, -1.40161, 2.424653, 1, 0, 0.454902, 1,
1.447482, 1.531005, 0.3572129, 1, 0, 0.4509804, 1,
1.457706, 0.5143932, 1.201241, 1, 0, 0.4431373, 1,
1.463743, -0.4452717, 0.5178619, 1, 0, 0.4392157, 1,
1.485709, -1.316973, 0.7506201, 1, 0, 0.4313726, 1,
1.49298, -1.872981, 3.634807, 1, 0, 0.427451, 1,
1.496776, -1.158539, 1.694787, 1, 0, 0.4196078, 1,
1.498186, 1.21549, 0.06569957, 1, 0, 0.4156863, 1,
1.51, 0.1948329, 1.250682, 1, 0, 0.4078431, 1,
1.51386, 1.95742, -1.607643, 1, 0, 0.4039216, 1,
1.51396, 0.1814322, 1.299338, 1, 0, 0.3960784, 1,
1.514019, 1.151237, 0.5095645, 1, 0, 0.3882353, 1,
1.525305, -1.900939, 2.886706, 1, 0, 0.3843137, 1,
1.537723, -0.5276115, 0.3609036, 1, 0, 0.3764706, 1,
1.547584, 0.3993593, -0.5484473, 1, 0, 0.372549, 1,
1.564429, 0.3180783, 0.0797268, 1, 0, 0.3647059, 1,
1.595637, -0.6306607, 2.665225, 1, 0, 0.3607843, 1,
1.600183, 0.1980975, 0.5513679, 1, 0, 0.3529412, 1,
1.604661, 1.225527, 1.171663, 1, 0, 0.3490196, 1,
1.617999, -0.3451529, 1.878498, 1, 0, 0.3411765, 1,
1.635941, 0.7126591, 1.164144, 1, 0, 0.3372549, 1,
1.638151, 1.142276, 0.9821173, 1, 0, 0.3294118, 1,
1.638916, 0.3253252, 0.7729657, 1, 0, 0.3254902, 1,
1.64019, 0.1527891, -0.5562403, 1, 0, 0.3176471, 1,
1.645583, 0.3545652, 2.70955, 1, 0, 0.3137255, 1,
1.668402, -0.1517979, 1.183332, 1, 0, 0.3058824, 1,
1.671507, 1.124727, 3.25944, 1, 0, 0.2980392, 1,
1.682132, -1.376498, 1.322984, 1, 0, 0.2941177, 1,
1.684043, -0.402418, 2.465974, 1, 0, 0.2862745, 1,
1.685313, -1.752642, 3.158778, 1, 0, 0.282353, 1,
1.688471, 3.214072, 0.6709279, 1, 0, 0.2745098, 1,
1.689188, 0.5568466, 2.184122, 1, 0, 0.2705882, 1,
1.700142, 0.05227655, 2.366435, 1, 0, 0.2627451, 1,
1.734364, -1.862862, 3.200273, 1, 0, 0.2588235, 1,
1.753556, 0.4929094, 1.883698, 1, 0, 0.2509804, 1,
1.754283, 0.2901441, 1.424134, 1, 0, 0.2470588, 1,
1.805609, 0.8616319, 0.7514855, 1, 0, 0.2392157, 1,
1.822551, 0.234874, 2.252467, 1, 0, 0.2352941, 1,
1.82764, -1.139865, 3.315275, 1, 0, 0.227451, 1,
1.837437, -0.4947804, 2.426903, 1, 0, 0.2235294, 1,
1.874166, -0.232053, 1.856761, 1, 0, 0.2156863, 1,
1.878595, 1.015016, 0.5489973, 1, 0, 0.2117647, 1,
1.890365, -0.5255746, 2.362441, 1, 0, 0.2039216, 1,
1.890962, 0.5859424, 0.5144057, 1, 0, 0.1960784, 1,
1.894527, 0.3099796, 0.9511658, 1, 0, 0.1921569, 1,
1.906163, 0.9195904, -0.04607348, 1, 0, 0.1843137, 1,
1.909445, 1.110576, 1.699751, 1, 0, 0.1803922, 1,
1.924741, -0.6351545, 2.376295, 1, 0, 0.172549, 1,
1.938714, 0.2872125, 2.768262, 1, 0, 0.1686275, 1,
1.949659, -0.6783546, 1.475833, 1, 0, 0.1607843, 1,
1.988047, 0.08771379, 2.150746, 1, 0, 0.1568628, 1,
2.013796, -0.2584373, 1.945775, 1, 0, 0.1490196, 1,
2.072079, 1.226067, 1.93697, 1, 0, 0.145098, 1,
2.082329, 0.7287363, 2.619313, 1, 0, 0.1372549, 1,
2.084543, 1.547472, -0.8911985, 1, 0, 0.1333333, 1,
2.110726, 0.9802371, 0.7947471, 1, 0, 0.1254902, 1,
2.14065, -0.1840576, 1.637601, 1, 0, 0.1215686, 1,
2.141512, -1.201234, 2.106206, 1, 0, 0.1137255, 1,
2.365616, 1.015161, -0.7671134, 1, 0, 0.1098039, 1,
2.403167, 2.608385, -0.9735242, 1, 0, 0.1019608, 1,
2.411683, -0.5659685, 2.035743, 1, 0, 0.09411765, 1,
2.492146, -0.4740241, 2.110878, 1, 0, 0.09019608, 1,
2.510743, -1.62747, 2.409634, 1, 0, 0.08235294, 1,
2.512475, -0.951991, 2.948781, 1, 0, 0.07843138, 1,
2.521398, -1.484814, 2.241447, 1, 0, 0.07058824, 1,
2.535514, -0.2306243, 2.22012, 1, 0, 0.06666667, 1,
2.550483, 1.785776, 1.393386, 1, 0, 0.05882353, 1,
2.608438, 1.641011, 0.1579134, 1, 0, 0.05490196, 1,
2.62908, 0.4621576, 1.365501, 1, 0, 0.04705882, 1,
2.667168, -0.5652723, 3.343166, 1, 0, 0.04313726, 1,
2.671593, -0.8263932, 1.461226, 1, 0, 0.03529412, 1,
2.74504, -0.3680177, -0.4079654, 1, 0, 0.03137255, 1,
2.748815, -0.3306498, 2.085069, 1, 0, 0.02352941, 1,
2.817456, -0.16898, 2.530103, 1, 0, 0.01960784, 1,
2.869713, 0.180992, 0.9172297, 1, 0, 0.01176471, 1,
2.875001, -0.7618063, 2.499631, 1, 0, 0.007843138, 1
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
-0.2016615, -4.421927, -7.199051, 0, -0.5, 0.5, 0.5,
-0.2016615, -4.421927, -7.199051, 1, -0.5, 0.5, 0.5,
-0.2016615, -4.421927, -7.199051, 1, 1.5, 0.5, 0.5,
-0.2016615, -4.421927, -7.199051, 0, 1.5, 0.5, 0.5
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
-4.321312, -0.05057096, -7.199051, 0, -0.5, 0.5, 0.5,
-4.321312, -0.05057096, -7.199051, 1, -0.5, 0.5, 0.5,
-4.321312, -0.05057096, -7.199051, 1, 1.5, 0.5, 0.5,
-4.321312, -0.05057096, -7.199051, 0, 1.5, 0.5, 0.5
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
-4.321312, -4.421927, 0.1646452, 0, -0.5, 0.5, 0.5,
-4.321312, -4.421927, 0.1646452, 1, -0.5, 0.5, 0.5,
-4.321312, -4.421927, 0.1646452, 1, 1.5, 0.5, 0.5,
-4.321312, -4.421927, 0.1646452, 0, 1.5, 0.5, 0.5
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
-3, -3.413153, -5.499737,
2, -3.413153, -5.499737,
-3, -3.413153, -5.499737,
-3, -3.581282, -5.782956,
-2, -3.413153, -5.499737,
-2, -3.581282, -5.782956,
-1, -3.413153, -5.499737,
-1, -3.581282, -5.782956,
0, -3.413153, -5.499737,
0, -3.581282, -5.782956,
1, -3.413153, -5.499737,
1, -3.581282, -5.782956,
2, -3.413153, -5.499737,
2, -3.581282, -5.782956
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
-3, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
-3, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
-3, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
-3, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5,
-2, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
-2, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
-2, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
-2, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5,
-1, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
-1, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
-1, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
-1, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5,
0, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
0, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
0, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
0, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5,
1, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
1, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
1, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
1, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5,
2, -3.91754, -6.349394, 0, -0.5, 0.5, 0.5,
2, -3.91754, -6.349394, 1, -0.5, 0.5, 0.5,
2, -3.91754, -6.349394, 1, 1.5, 0.5, 0.5,
2, -3.91754, -6.349394, 0, 1.5, 0.5, 0.5
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
-3.370624, -3, -5.499737,
-3.370624, 3, -5.499737,
-3.370624, -3, -5.499737,
-3.529072, -3, -5.782956,
-3.370624, -2, -5.499737,
-3.529072, -2, -5.782956,
-3.370624, -1, -5.499737,
-3.529072, -1, -5.782956,
-3.370624, 0, -5.499737,
-3.529072, 0, -5.782956,
-3.370624, 1, -5.499737,
-3.529072, 1, -5.782956,
-3.370624, 2, -5.499737,
-3.529072, 2, -5.782956,
-3.370624, 3, -5.499737,
-3.529072, 3, -5.782956
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
-3.845968, -3, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, -3, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, -3, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, -3, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, -2, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, -2, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, -2, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, -2, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, -1, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, -1, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, -1, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, -1, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, 0, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, 0, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, 0, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, 0, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, 1, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, 1, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, 1, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, 1, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, 2, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, 2, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, 2, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, 2, -6.349394, 0, 1.5, 0.5, 0.5,
-3.845968, 3, -6.349394, 0, -0.5, 0.5, 0.5,
-3.845968, 3, -6.349394, 1, -0.5, 0.5, 0.5,
-3.845968, 3, -6.349394, 1, 1.5, 0.5, 0.5,
-3.845968, 3, -6.349394, 0, 1.5, 0.5, 0.5
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
-3.370624, -3.413153, -4,
-3.370624, -3.413153, 4,
-3.370624, -3.413153, -4,
-3.529072, -3.581282, -4,
-3.370624, -3.413153, -2,
-3.529072, -3.581282, -2,
-3.370624, -3.413153, 0,
-3.529072, -3.581282, 0,
-3.370624, -3.413153, 2,
-3.529072, -3.581282, 2,
-3.370624, -3.413153, 4,
-3.529072, -3.581282, 4
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
-3.845968, -3.91754, -4, 0, -0.5, 0.5, 0.5,
-3.845968, -3.91754, -4, 1, -0.5, 0.5, 0.5,
-3.845968, -3.91754, -4, 1, 1.5, 0.5, 0.5,
-3.845968, -3.91754, -4, 0, 1.5, 0.5, 0.5,
-3.845968, -3.91754, -2, 0, -0.5, 0.5, 0.5,
-3.845968, -3.91754, -2, 1, -0.5, 0.5, 0.5,
-3.845968, -3.91754, -2, 1, 1.5, 0.5, 0.5,
-3.845968, -3.91754, -2, 0, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 0, 0, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 0, 1, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 0, 1, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 0, 0, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 2, 0, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 2, 1, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 2, 1, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 2, 0, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 4, 0, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 4, 1, -0.5, 0.5, 0.5,
-3.845968, -3.91754, 4, 1, 1.5, 0.5, 0.5,
-3.845968, -3.91754, 4, 0, 1.5, 0.5, 0.5
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
-3.370624, -3.413153, -5.499737,
-3.370624, 3.312011, -5.499737,
-3.370624, -3.413153, 5.829027,
-3.370624, 3.312011, 5.829027,
-3.370624, -3.413153, -5.499737,
-3.370624, -3.413153, 5.829027,
-3.370624, 3.312011, -5.499737,
-3.370624, 3.312011, 5.829027,
-3.370624, -3.413153, -5.499737,
2.967301, -3.413153, -5.499737,
-3.370624, -3.413153, 5.829027,
2.967301, -3.413153, 5.829027,
-3.370624, 3.312011, -5.499737,
2.967301, 3.312011, -5.499737,
-3.370624, 3.312011, 5.829027,
2.967301, 3.312011, 5.829027,
2.967301, -3.413153, -5.499737,
2.967301, 3.312011, -5.499737,
2.967301, -3.413153, 5.829027,
2.967301, 3.312011, 5.829027,
2.967301, -3.413153, -5.499737,
2.967301, -3.413153, 5.829027,
2.967301, 3.312011, -5.499737,
2.967301, 3.312011, 5.829027
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
var radius = 7.80668;
var distance = 34.7328;
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
mvMatrix.translate( 0.2016615, 0.05057096, -0.1646452 );
mvMatrix.scale( 1.331782, 1.255097, 0.7450711 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.7328);
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
pyracarbolid<-read.table("pyracarbolid.xyz")
```

```
## Error in read.table("pyracarbolid.xyz"): no lines available in input
```

```r
x<-pyracarbolid$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
y<-pyracarbolid$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
z<-pyracarbolid$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
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
-3.278324, 0.9229767, -1.079009, 0, 0, 1, 1, 1,
-2.84181, -0.6277887, -2.372855, 1, 0, 0, 1, 1,
-2.791451, -1.129881, -2.462343, 1, 0, 0, 1, 1,
-2.578402, 0.3422003, -1.755958, 1, 0, 0, 1, 1,
-2.551512, -0.2696832, -2.133568, 1, 0, 0, 1, 1,
-2.520689, 0.2109068, -0.428012, 1, 0, 0, 1, 1,
-2.497766, -0.03760321, -0.7114379, 0, 0, 0, 1, 1,
-2.450586, -1.584991, -2.317698, 0, 0, 0, 1, 1,
-2.395911, 0.2704484, -0.6788652, 0, 0, 0, 1, 1,
-2.370092, -0.988167, -2.599293, 0, 0, 0, 1, 1,
-2.34482, -0.8720875, -3.178782, 0, 0, 0, 1, 1,
-2.329319, -0.5355124, -1.631071, 0, 0, 0, 1, 1,
-2.276625, 0.4873207, -4.317616, 0, 0, 0, 1, 1,
-2.233128, 0.5045578, -1.135363, 1, 1, 1, 1, 1,
-2.200722, -0.8184151, 0.5718355, 1, 1, 1, 1, 1,
-2.152763, -1.483505, -1.060218, 1, 1, 1, 1, 1,
-2.129718, 0.00502463, -1.254916, 1, 1, 1, 1, 1,
-2.109876, 0.1909808, -1.081218, 1, 1, 1, 1, 1,
-2.08976, 0.9092063, -2.085634, 1, 1, 1, 1, 1,
-2.07223, 0.3072596, -0.9668941, 1, 1, 1, 1, 1,
-2.0679, -0.9033714, -1.391515, 1, 1, 1, 1, 1,
-2.065258, 0.5060387, -2.49192, 1, 1, 1, 1, 1,
-2.058955, 1.270782, -1.671092, 1, 1, 1, 1, 1,
-2.039932, 0.1126656, -2.485584, 1, 1, 1, 1, 1,
-2.011638, -1.311592, -0.6261793, 1, 1, 1, 1, 1,
-1.967255, -0.372988, -2.559405, 1, 1, 1, 1, 1,
-1.966874, 2.006925, -1.916723, 1, 1, 1, 1, 1,
-1.949401, -1.044235, -2.12091, 1, 1, 1, 1, 1,
-1.946498, 0.3039431, -0.8512473, 0, 0, 1, 1, 1,
-1.934535, -1.046449, -2.850431, 1, 0, 0, 1, 1,
-1.895573, 1.045935, 0.6430271, 1, 0, 0, 1, 1,
-1.891676, -1.501942, -2.666501, 1, 0, 0, 1, 1,
-1.878965, 1.209628, -1.584786, 1, 0, 0, 1, 1,
-1.865995, 0.02890443, -2.33181, 1, 0, 0, 1, 1,
-1.861827, -0.3841622, -0.4402512, 0, 0, 0, 1, 1,
-1.857007, 0.256418, -2.541852, 0, 0, 0, 1, 1,
-1.848307, 0.727436, -2.234921, 0, 0, 0, 1, 1,
-1.838449, -0.3888272, -0.7409232, 0, 0, 0, 1, 1,
-1.81884, 0.3719099, -1.564337, 0, 0, 0, 1, 1,
-1.81761, 0.4606041, -0.2763631, 0, 0, 0, 1, 1,
-1.804557, -0.3130037, -3.093194, 0, 0, 0, 1, 1,
-1.784866, -1.767157, -4.871436, 1, 1, 1, 1, 1,
-1.780607, -1.068233, -1.657493, 1, 1, 1, 1, 1,
-1.776856, -1.00521, -0.9950814, 1, 1, 1, 1, 1,
-1.77312, 1.142744, -2.106943, 1, 1, 1, 1, 1,
-1.763578, -2.572732, -1.592756, 1, 1, 1, 1, 1,
-1.74974, -0.1773117, -2.326207, 1, 1, 1, 1, 1,
-1.734714, -0.9483912, -1.482534, 1, 1, 1, 1, 1,
-1.712578, 0.7204949, -1.872133, 1, 1, 1, 1, 1,
-1.706404, -0.8018965, -2.541504, 1, 1, 1, 1, 1,
-1.703333, 0.5183388, -0.4741519, 1, 1, 1, 1, 1,
-1.697893, 1.231703, -1.600526, 1, 1, 1, 1, 1,
-1.696947, 1.036506, -1.304496, 1, 1, 1, 1, 1,
-1.695955, -1.949291, -4.124899, 1, 1, 1, 1, 1,
-1.686496, 0.2851079, 0.3488645, 1, 1, 1, 1, 1,
-1.679922, 0.4094232, -1.000068, 1, 1, 1, 1, 1,
-1.672365, 0.03708796, -1.730712, 0, 0, 1, 1, 1,
-1.668968, -0.5282782, -1.532409, 1, 0, 0, 1, 1,
-1.65733, -0.6791658, -1.28385, 1, 0, 0, 1, 1,
-1.656816, -0.4194638, 0.6749178, 1, 0, 0, 1, 1,
-1.656436, 1.491694, -2.084702, 1, 0, 0, 1, 1,
-1.649031, 0.5377309, -2.324238, 1, 0, 0, 1, 1,
-1.647103, 1.107308, -1.41918, 0, 0, 0, 1, 1,
-1.624257, 0.2641454, -0.3493185, 0, 0, 0, 1, 1,
-1.595553, -0.2736842, -1.593484, 0, 0, 0, 1, 1,
-1.595396, -0.7653236, -3.090621, 0, 0, 0, 1, 1,
-1.58512, -0.7748303, -3.054701, 0, 0, 0, 1, 1,
-1.57168, 0.8897073, -1.185532, 0, 0, 0, 1, 1,
-1.568095, 0.2628918, -3.361972, 0, 0, 0, 1, 1,
-1.534893, 2.280479, -0.3669679, 1, 1, 1, 1, 1,
-1.530398, 1.488281, -1.505926, 1, 1, 1, 1, 1,
-1.500297, 0.793098, -0.08225375, 1, 1, 1, 1, 1,
-1.489484, 3.157125, -0.9272401, 1, 1, 1, 1, 1,
-1.484885, -0.3589829, -2.245495, 1, 1, 1, 1, 1,
-1.479646, 1.530604, 1.461048, 1, 1, 1, 1, 1,
-1.477026, -0.5817029, -2.520333, 1, 1, 1, 1, 1,
-1.472417, -0.9581189, -1.283799, 1, 1, 1, 1, 1,
-1.471564, 0.6629874, -0.2802335, 1, 1, 1, 1, 1,
-1.468858, 1.021625, -2.624156, 1, 1, 1, 1, 1,
-1.468355, -2.373969, -2.795913, 1, 1, 1, 1, 1,
-1.460708, -1.362309, -1.969805, 1, 1, 1, 1, 1,
-1.456087, 0.648263, -2.217744, 1, 1, 1, 1, 1,
-1.440826, -0.2783533, -2.252867, 1, 1, 1, 1, 1,
-1.435764, 0.2615257, -1.714775, 1, 1, 1, 1, 1,
-1.434744, 0.08633769, -0.9669014, 0, 0, 1, 1, 1,
-1.416706, -1.918114, -2.017823, 1, 0, 0, 1, 1,
-1.410582, 0.3029905, -2.36214, 1, 0, 0, 1, 1,
-1.40996, 0.7125732, -0.8794088, 1, 0, 0, 1, 1,
-1.407314, 0.1253017, -1.95537, 1, 0, 0, 1, 1,
-1.407006, 1.907848, -1.264647, 1, 0, 0, 1, 1,
-1.406114, 0.8436209, -0.09896894, 0, 0, 0, 1, 1,
-1.404555, 0.05671752, -3.328768, 0, 0, 0, 1, 1,
-1.402636, 1.234085, -1.088328, 0, 0, 0, 1, 1,
-1.402122, 0.6186669, -1.292532, 0, 0, 0, 1, 1,
-1.391489, -0.3226165, -3.159013, 0, 0, 0, 1, 1,
-1.391179, -0.003542074, -2.799947, 0, 0, 0, 1, 1,
-1.375029, -0.9941819, -2.57142, 0, 0, 0, 1, 1,
-1.363864, 1.089002, -3.899125, 1, 1, 1, 1, 1,
-1.334205, -0.8541776, -3.981572, 1, 1, 1, 1, 1,
-1.333391, -0.8564774, -1.697045, 1, 1, 1, 1, 1,
-1.332326, 0.9526896, -1.911427, 1, 1, 1, 1, 1,
-1.32135, 0.2235325, -1.202417, 1, 1, 1, 1, 1,
-1.312847, -0.2755366, -0.8636639, 1, 1, 1, 1, 1,
-1.309436, 1.034457, -1.456666, 1, 1, 1, 1, 1,
-1.299251, 1.182542, -0.3942848, 1, 1, 1, 1, 1,
-1.293678, -2.15431, -3.166566, 1, 1, 1, 1, 1,
-1.28581, 1.190081, 0.4022354, 1, 1, 1, 1, 1,
-1.285065, -0.2014434, -0.9297678, 1, 1, 1, 1, 1,
-1.27603, 1.681686, -0.5467939, 1, 1, 1, 1, 1,
-1.270803, 1.334606, -1.951109, 1, 1, 1, 1, 1,
-1.270711, 0.3592655, -0.216538, 1, 1, 1, 1, 1,
-1.266643, 0.05964242, -3.339911, 1, 1, 1, 1, 1,
-1.261718, 2.837575, -0.005444893, 0, 0, 1, 1, 1,
-1.249105, 0.3411815, -2.912632, 1, 0, 0, 1, 1,
-1.242439, -0.4340028, -2.261563, 1, 0, 0, 1, 1,
-1.23114, 1.334132, 1.957825, 1, 0, 0, 1, 1,
-1.226449, -0.6119366, -2.624241, 1, 0, 0, 1, 1,
-1.206785, -0.075402, -1.571109, 1, 0, 0, 1, 1,
-1.203433, 0.005198925, -1.174951, 0, 0, 0, 1, 1,
-1.198044, -0.4201351, -0.8153496, 0, 0, 0, 1, 1,
-1.183498, 0.007505808, -2.844776, 0, 0, 0, 1, 1,
-1.159358, -0.01922431, -3.343799, 0, 0, 0, 1, 1,
-1.158149, -0.6080089, -0.5973601, 0, 0, 0, 1, 1,
-1.138324, 1.041181, -0.4989823, 0, 0, 0, 1, 1,
-1.132662, 0.6592135, -2.327343, 0, 0, 0, 1, 1,
-1.123098, -0.200086, -1.49382, 1, 1, 1, 1, 1,
-1.115674, -0.4866583, -2.180592, 1, 1, 1, 1, 1,
-1.111997, 0.9544927, -0.4352818, 1, 1, 1, 1, 1,
-1.1017, -0.1834713, 0.341052, 1, 1, 1, 1, 1,
-1.100968, -0.926746, -2.11085, 1, 1, 1, 1, 1,
-1.100394, -0.2727714, -2.764267, 1, 1, 1, 1, 1,
-1.093651, 0.6110303, -2.424678, 1, 1, 1, 1, 1,
-1.092847, 0.3023066, -2.358605, 1, 1, 1, 1, 1,
-1.085487, 0.06221994, -0.8697442, 1, 1, 1, 1, 1,
-1.077026, -0.5247998, -3.964047, 1, 1, 1, 1, 1,
-1.073326, -0.2656166, -3.032993, 1, 1, 1, 1, 1,
-1.06656, 0.4068574, 0.1909501, 1, 1, 1, 1, 1,
-1.06392, -0.1106704, -3.006061, 1, 1, 1, 1, 1,
-1.058901, -0.3636301, -1.170689, 1, 1, 1, 1, 1,
-1.053176, 1.557621, -2.134363, 1, 1, 1, 1, 1,
-1.049481, 1.181841, -1.120131, 0, 0, 1, 1, 1,
-1.048344, 0.5096707, 0.9366755, 1, 0, 0, 1, 1,
-1.047223, 1.709284, -0.1349133, 1, 0, 0, 1, 1,
-1.040539, 0.1996192, 0.1275779, 1, 0, 0, 1, 1,
-1.036009, 0.2356971, -0.1472574, 1, 0, 0, 1, 1,
-1.032679, -1.005129, -2.342303, 1, 0, 0, 1, 1,
-1.030929, 0.6429717, 0.49143, 0, 0, 0, 1, 1,
-1.028609, -1.256161, -2.201389, 0, 0, 0, 1, 1,
-1.026459, -0.7051222, -1.70045, 0, 0, 0, 1, 1,
-1.026107, 0.9574226, -0.07139382, 0, 0, 0, 1, 1,
-1.025735, -0.6274411, -0.7757099, 0, 0, 0, 1, 1,
-1.021454, -1.392623, -2.799466, 0, 0, 0, 1, 1,
-1.017107, 0.9771389, -1.390793, 0, 0, 0, 1, 1,
-1.015916, -1.386392, -2.454099, 1, 1, 1, 1, 1,
-1.005422, 0.7850791, -2.073913, 1, 1, 1, 1, 1,
-1.004224, 1.143779, 1.358246, 1, 1, 1, 1, 1,
-0.9984099, 0.2905397, -2.528174, 1, 1, 1, 1, 1,
-0.9942757, -2.050476, -3.020727, 1, 1, 1, 1, 1,
-0.9930982, -0.568803, -2.420972, 1, 1, 1, 1, 1,
-0.9905617, -0.5947964, -3.048888, 1, 1, 1, 1, 1,
-0.9893868, 0.7305135, -2.22044, 1, 1, 1, 1, 1,
-0.9849374, 0.06263785, 0.1527346, 1, 1, 1, 1, 1,
-0.9835709, -0.6530402, -1.483346, 1, 1, 1, 1, 1,
-0.9833389, -0.535934, -1.959769, 1, 1, 1, 1, 1,
-0.9804769, 0.3232932, -1.878911, 1, 1, 1, 1, 1,
-0.9785359, -0.665078, -1.896023, 1, 1, 1, 1, 1,
-0.9749558, 0.2207864, -1.834064, 1, 1, 1, 1, 1,
-0.9644586, -0.2428801, -3.723109, 1, 1, 1, 1, 1,
-0.9620152, 0.223023, -0.9783612, 0, 0, 1, 1, 1,
-0.9550823, 1.008911, -0.3216656, 1, 0, 0, 1, 1,
-0.9539461, 0.6601993, -1.646019, 1, 0, 0, 1, 1,
-0.9478979, -0.04082678, -1.605014, 1, 0, 0, 1, 1,
-0.9476152, -0.5424379, -2.273992, 1, 0, 0, 1, 1,
-0.9425262, 0.2120457, -1.621543, 1, 0, 0, 1, 1,
-0.9421766, 0.4726206, 1.664504, 0, 0, 0, 1, 1,
-0.9419338, 0.8060429, -1.333323, 0, 0, 0, 1, 1,
-0.9362537, -0.3054291, -1.101629, 0, 0, 0, 1, 1,
-0.9305641, -0.6228362, -1.405728, 0, 0, 0, 1, 1,
-0.9295907, -0.3320212, -3.131108, 0, 0, 0, 1, 1,
-0.9207852, -0.0718039, -2.433188, 0, 0, 0, 1, 1,
-0.9088954, -0.790253, -3.582189, 0, 0, 0, 1, 1,
-0.9080117, 0.3684042, -1.41966, 1, 1, 1, 1, 1,
-0.9049259, 0.6440175, -0.3466298, 1, 1, 1, 1, 1,
-0.8987221, -3.315214, -3.050946, 1, 1, 1, 1, 1,
-0.8983368, 0.3542311, -0.7135545, 1, 1, 1, 1, 1,
-0.8978719, 2.051543, -0.09029577, 1, 1, 1, 1, 1,
-0.8927047, 0.5990808, -2.818139, 1, 1, 1, 1, 1,
-0.892208, -1.656857, -1.513387, 1, 1, 1, 1, 1,
-0.886308, 1.116149, -0.4121747, 1, 1, 1, 1, 1,
-0.8856317, -0.5610064, -1.119099, 1, 1, 1, 1, 1,
-0.8793516, -0.3552696, -2.369188, 1, 1, 1, 1, 1,
-0.877919, -0.8989357, -2.293967, 1, 1, 1, 1, 1,
-0.8720586, -0.4314605, -0.5468557, 1, 1, 1, 1, 1,
-0.8714098, 0.5749225, 0.4974911, 1, 1, 1, 1, 1,
-0.8667188, 0.2574482, 0.4087195, 1, 1, 1, 1, 1,
-0.8642329, -0.08505266, -1.32772, 1, 1, 1, 1, 1,
-0.8617332, 0.9325595, -0.1568905, 0, 0, 1, 1, 1,
-0.8613054, -1.397023, -2.606253, 1, 0, 0, 1, 1,
-0.8577194, 0.6475568, -0.3527554, 1, 0, 0, 1, 1,
-0.8559046, 1.038523, -0.6500402, 1, 0, 0, 1, 1,
-0.8513088, 1.214842, -0.5306937, 1, 0, 0, 1, 1,
-0.8399038, -0.04664685, -0.2179518, 1, 0, 0, 1, 1,
-0.8375572, 1.146083, -1.565084, 0, 0, 0, 1, 1,
-0.8358523, -0.2278276, -1.839981, 0, 0, 0, 1, 1,
-0.8273246, -0.6400286, -1.591647, 0, 0, 0, 1, 1,
-0.8270394, 0.1803342, -1.688158, 0, 0, 0, 1, 1,
-0.8252543, -0.2850128, -0.04061254, 0, 0, 0, 1, 1,
-0.8248134, -0.1659924, -3.020121, 0, 0, 0, 1, 1,
-0.819822, 1.692601, -0.7443195, 0, 0, 0, 1, 1,
-0.8165441, 0.6922349, -0.9228543, 1, 1, 1, 1, 1,
-0.8165415, 1.158169, -0.8974822, 1, 1, 1, 1, 1,
-0.8161537, 0.6896808, -0.2037122, 1, 1, 1, 1, 1,
-0.8133648, -0.2085587, -1.407072, 1, 1, 1, 1, 1,
-0.8122979, -0.8990089, -1.30567, 1, 1, 1, 1, 1,
-0.8111662, -2.150087, -4.073872, 1, 1, 1, 1, 1,
-0.8077971, 1.075228, -1.911288, 1, 1, 1, 1, 1,
-0.8073893, -0.8730838, -2.783741, 1, 1, 1, 1, 1,
-0.8020044, -0.5457384, -2.383081, 1, 1, 1, 1, 1,
-0.7964301, -0.4063202, -2.002548, 1, 1, 1, 1, 1,
-0.7929739, 0.1751895, -1.843494, 1, 1, 1, 1, 1,
-0.7850588, -1.951926, -3.725343, 1, 1, 1, 1, 1,
-0.7839448, 0.03020525, -1.032395, 1, 1, 1, 1, 1,
-0.7769572, 0.1303765, -0.4761042, 1, 1, 1, 1, 1,
-0.7744668, -0.1227894, -1.860244, 1, 1, 1, 1, 1,
-0.7738113, -2.6121, -3.661564, 0, 0, 1, 1, 1,
-0.7732998, -0.6335982, -3.798571, 1, 0, 0, 1, 1,
-0.7721658, 0.3385123, -1.092089, 1, 0, 0, 1, 1,
-0.7694458, 2.265395, -1.61189, 1, 0, 0, 1, 1,
-0.7632872, -0.02578764, -3.177426, 1, 0, 0, 1, 1,
-0.7586877, -0.7790755, -3.423704, 1, 0, 0, 1, 1,
-0.7576222, -0.4805612, -2.89624, 0, 0, 0, 1, 1,
-0.7565821, 0.07373422, 0.4333604, 0, 0, 0, 1, 1,
-0.7556618, -0.8819367, -1.700937, 0, 0, 0, 1, 1,
-0.7531395, 0.318703, -0.9739627, 0, 0, 0, 1, 1,
-0.7521986, -2.045044, -1.650244, 0, 0, 0, 1, 1,
-0.7473761, 0.3903546, -0.1291951, 0, 0, 0, 1, 1,
-0.7426783, -0.7588467, -1.49943, 0, 0, 0, 1, 1,
-0.7388952, -1.053402, -2.337587, 1, 1, 1, 1, 1,
-0.7379992, -1.087084, -2.181291, 1, 1, 1, 1, 1,
-0.7358511, -1.604383, -2.436451, 1, 1, 1, 1, 1,
-0.7291071, 1.341528, -1.258596, 1, 1, 1, 1, 1,
-0.7171444, 0.7850875, -0.8233655, 1, 1, 1, 1, 1,
-0.7139165, -1.386373, -2.895672, 1, 1, 1, 1, 1,
-0.7105067, 0.6012948, -0.5291931, 1, 1, 1, 1, 1,
-0.7103932, -1.354431, -2.728006, 1, 1, 1, 1, 1,
-0.7094065, 1.993011, -0.7920747, 1, 1, 1, 1, 1,
-0.7088126, 0.5487701, -1.423485, 1, 1, 1, 1, 1,
-0.7027091, -0.2521765, -0.7615284, 1, 1, 1, 1, 1,
-0.7004408, 2.177049, -0.6928053, 1, 1, 1, 1, 1,
-0.6979164, 0.5623161, 1.446733, 1, 1, 1, 1, 1,
-0.6916795, -1.380352, -2.482549, 1, 1, 1, 1, 1,
-0.688127, -0.9506958, -2.634318, 1, 1, 1, 1, 1,
-0.6841618, 0.8857387, -1.442209, 0, 0, 1, 1, 1,
-0.6823521, -0.6257874, -2.737223, 1, 0, 0, 1, 1,
-0.6760067, -0.1892118, -3.251242, 1, 0, 0, 1, 1,
-0.6743668, 1.113549, 0.4858106, 1, 0, 0, 1, 1,
-0.67313, 0.4354932, 1.175628, 1, 0, 0, 1, 1,
-0.6691836, -1.82726, -3.590567, 1, 0, 0, 1, 1,
-0.6682135, -0.7170004, -5.080023, 0, 0, 0, 1, 1,
-0.667284, -0.1634271, -3.030103, 0, 0, 0, 1, 1,
-0.6647658, -0.7964313, -3.602082, 0, 0, 0, 1, 1,
-0.6633449, 2.189502, 1.366271, 0, 0, 0, 1, 1,
-0.6630172, -0.2162204, -1.386227, 0, 0, 0, 1, 1,
-0.6625662, 0.8090765, -1.513958, 0, 0, 0, 1, 1,
-0.6619736, -1.822175, -2.751187, 0, 0, 0, 1, 1,
-0.6603967, -0.7902995, -1.153428, 1, 1, 1, 1, 1,
-0.6575136, 0.4861364, -3.34485, 1, 1, 1, 1, 1,
-0.648479, -0.5665884, -2.259597, 1, 1, 1, 1, 1,
-0.647837, -0.5008468, -3.009435, 1, 1, 1, 1, 1,
-0.6439106, 0.9051309, -3.069128, 1, 1, 1, 1, 1,
-0.6414344, 0.1052847, 0.8704908, 1, 1, 1, 1, 1,
-0.637638, -0.6805992, -2.022521, 1, 1, 1, 1, 1,
-0.6340089, 0.2762038, -2.489853, 1, 1, 1, 1, 1,
-0.6337108, -1.049343, -1.949901, 1, 1, 1, 1, 1,
-0.6307345, 0.5868672, -2.672042, 1, 1, 1, 1, 1,
-0.6240825, -1.378206, -3.181136, 1, 1, 1, 1, 1,
-0.619022, -0.508899, -1.716418, 1, 1, 1, 1, 1,
-0.6185769, -0.8309491, -2.606701, 1, 1, 1, 1, 1,
-0.6181093, -0.02124069, -3.533437, 1, 1, 1, 1, 1,
-0.6171189, -1.238948, -3.501482, 1, 1, 1, 1, 1,
-0.6169457, -0.9928062, -2.874569, 0, 0, 1, 1, 1,
-0.6168257, 0.04546365, -1.122902, 1, 0, 0, 1, 1,
-0.6155046, -1.09087, -3.135365, 1, 0, 0, 1, 1,
-0.6145274, -1.098209, -0.2075077, 1, 0, 0, 1, 1,
-0.6085024, 0.9819573, 0.8204873, 1, 0, 0, 1, 1,
-0.6067891, 0.3102129, -0.1130294, 1, 0, 0, 1, 1,
-0.6054651, 0.6158968, -2.255553, 0, 0, 0, 1, 1,
-0.6027262, -0.1739952, -1.589939, 0, 0, 0, 1, 1,
-0.602155, 0.8949611, 0.6267949, 0, 0, 0, 1, 1,
-0.6016303, -0.7878292, -3.903718, 0, 0, 0, 1, 1,
-0.5878925, -0.1372369, -2.330047, 0, 0, 0, 1, 1,
-0.5876338, -0.3501852, -3.09116, 0, 0, 0, 1, 1,
-0.5819118, 0.3336875, -0.3765745, 0, 0, 0, 1, 1,
-0.5795408, -0.1888143, -0.2921044, 1, 1, 1, 1, 1,
-0.5711556, -0.9446239, -1.813538, 1, 1, 1, 1, 1,
-0.5704389, 0.47468, -1.775971, 1, 1, 1, 1, 1,
-0.567946, 0.6649752, -1.83319, 1, 1, 1, 1, 1,
-0.5628125, 0.07264604, -1.519608, 1, 1, 1, 1, 1,
-0.5623626, 0.8147868, -3.007906, 1, 1, 1, 1, 1,
-0.55946, -0.4309663, -2.632706, 1, 1, 1, 1, 1,
-0.5586372, -0.5686831, -2.091501, 1, 1, 1, 1, 1,
-0.5580257, -0.5572345, -3.188079, 1, 1, 1, 1, 1,
-0.5572038, 0.4510503, -2.030206, 1, 1, 1, 1, 1,
-0.5532532, -1.184458, -2.497536, 1, 1, 1, 1, 1,
-0.5523154, 0.6477044, 0.9536344, 1, 1, 1, 1, 1,
-0.5517262, 1.015503, -1.624534, 1, 1, 1, 1, 1,
-0.548506, -1.783077, -2.728877, 1, 1, 1, 1, 1,
-0.5476644, 0.086449, -0.3016836, 1, 1, 1, 1, 1,
-0.5459258, 1.856433, -0.5555416, 0, 0, 1, 1, 1,
-0.5419969, -1.270135, -3.544876, 1, 0, 0, 1, 1,
-0.5406646, 1.170766, -1.861078, 1, 0, 0, 1, 1,
-0.5377283, -1.439998, -3.082027, 1, 0, 0, 1, 1,
-0.5336221, 0.2164072, -0.6138316, 1, 0, 0, 1, 1,
-0.5277862, -0.4541271, -3.664974, 1, 0, 0, 1, 1,
-0.5202493, 0.4897397, -1.346665, 0, 0, 0, 1, 1,
-0.5156678, 0.2318951, -0.6189949, 0, 0, 0, 1, 1,
-0.4999453, 0.3816991, -0.1793655, 0, 0, 0, 1, 1,
-0.4994092, 0.06714965, -0.1999756, 0, 0, 0, 1, 1,
-0.4993432, 1.661092, -1.927423, 0, 0, 0, 1, 1,
-0.4990716, -0.1589258, -2.036475, 0, 0, 0, 1, 1,
-0.493922, 1.177158, -0.99209, 0, 0, 0, 1, 1,
-0.4908038, -0.5385213, -3.252691, 1, 1, 1, 1, 1,
-0.4824532, -0.8323583, -4.092165, 1, 1, 1, 1, 1,
-0.4771518, 0.9124612, 0.3949854, 1, 1, 1, 1, 1,
-0.4720583, -1.056621, -2.315038, 1, 1, 1, 1, 1,
-0.463406, 0.4110232, -3.017179, 1, 1, 1, 1, 1,
-0.4594221, 0.9622536, 0.8517288, 1, 1, 1, 1, 1,
-0.4580958, 0.8096628, -0.1963092, 1, 1, 1, 1, 1,
-0.4571896, -1.502885, -3.219898, 1, 1, 1, 1, 1,
-0.4556083, 0.3923014, -1.173464, 1, 1, 1, 1, 1,
-0.4527453, -0.9862245, -3.007161, 1, 1, 1, 1, 1,
-0.4505412, 0.1264073, -0.9219718, 1, 1, 1, 1, 1,
-0.4499401, 1.243954, -1.163663, 1, 1, 1, 1, 1,
-0.4439384, 0.2674029, -1.942672, 1, 1, 1, 1, 1,
-0.4411236, -2.318023, -5.334755, 1, 1, 1, 1, 1,
-0.4409929, 0.6606258, 0.6554552, 1, 1, 1, 1, 1,
-0.4380471, 0.9170442, -0.5065826, 0, 0, 1, 1, 1,
-0.4317639, 0.8128774, 0.2944511, 1, 0, 0, 1, 1,
-0.4306689, -0.01634576, -2.904086, 1, 0, 0, 1, 1,
-0.4258337, 0.3745982, -0.5047945, 1, 0, 0, 1, 1,
-0.4248409, -1.542308, -3.795316, 1, 0, 0, 1, 1,
-0.4233559, -0.811194, -4.39632, 1, 0, 0, 1, 1,
-0.4220008, 0.6419725, -1.270888, 0, 0, 0, 1, 1,
-0.4180416, 0.1514969, -0.3875476, 0, 0, 0, 1, 1,
-0.414899, -1.915372, -1.951328, 0, 0, 0, 1, 1,
-0.4142246, 0.5315231, -0.8511397, 0, 0, 0, 1, 1,
-0.4130565, -1.229794, -2.517844, 0, 0, 0, 1, 1,
-0.4108972, 0.5628282, -1.176786, 0, 0, 0, 1, 1,
-0.4081073, -0.07397336, -1.455601, 0, 0, 0, 1, 1,
-0.4072066, -0.6599098, -3.021295, 1, 1, 1, 1, 1,
-0.4067624, -1.350614, -2.223356, 1, 1, 1, 1, 1,
-0.4052698, -1.083458, -3.116209, 1, 1, 1, 1, 1,
-0.3870876, 0.6898192, -0.1499444, 1, 1, 1, 1, 1,
-0.3833366, 0.6310153, 0.2898896, 1, 1, 1, 1, 1,
-0.3815203, -0.2512077, -3.216667, 1, 1, 1, 1, 1,
-0.3806854, -0.2633292, -1.438151, 1, 1, 1, 1, 1,
-0.3780876, 0.1975422, -1.178236, 1, 1, 1, 1, 1,
-0.3742245, -1.975903, -2.918089, 1, 1, 1, 1, 1,
-0.3697207, -0.376604, -2.12146, 1, 1, 1, 1, 1,
-0.368006, -0.07238567, -0.9051908, 1, 1, 1, 1, 1,
-0.3668239, 2.469893, 1.45073, 1, 1, 1, 1, 1,
-0.3638227, 0.1394877, -0.3841638, 1, 1, 1, 1, 1,
-0.3635357, -0.32989, -1.052159, 1, 1, 1, 1, 1,
-0.360427, 1.924745, -0.4222951, 1, 1, 1, 1, 1,
-0.3583674, 0.3761029, -0.7820426, 0, 0, 1, 1, 1,
-0.3576814, 0.8899819, -2.24725, 1, 0, 0, 1, 1,
-0.3553635, 0.0586461, -1.81029, 1, 0, 0, 1, 1,
-0.3406026, -0.2923639, -1.164032, 1, 0, 0, 1, 1,
-0.3404701, -0.8289153, -2.203563, 1, 0, 0, 1, 1,
-0.335238, -0.06155667, -2.315247, 1, 0, 0, 1, 1,
-0.3296854, 1.370247, 0.7968609, 0, 0, 0, 1, 1,
-0.323642, -0.8434668, -2.65245, 0, 0, 0, 1, 1,
-0.3220004, -0.7922324, -2.298648, 0, 0, 0, 1, 1,
-0.3124861, -1.142632, -3.159929, 0, 0, 0, 1, 1,
-0.3108681, -0.9287327, -2.240986, 0, 0, 0, 1, 1,
-0.3084204, 0.3477347, -1.017953, 0, 0, 0, 1, 1,
-0.3059034, -0.1685155, -2.092244, 0, 0, 0, 1, 1,
-0.305684, -1.904189, -2.696593, 1, 1, 1, 1, 1,
-0.3045349, -1.588212, -4.620385, 1, 1, 1, 1, 1,
-0.2941171, 0.3478363, -2.159684, 1, 1, 1, 1, 1,
-0.2904282, 0.4718376, -0.3144976, 1, 1, 1, 1, 1,
-0.2892872, 1.295343, -0.3866307, 1, 1, 1, 1, 1,
-0.2839905, 0.729322, -1.775439, 1, 1, 1, 1, 1,
-0.2833714, -0.7100229, -1.448287, 1, 1, 1, 1, 1,
-0.2799282, 1.143595, -0.2611725, 1, 1, 1, 1, 1,
-0.27742, 1.042549, 0.5117989, 1, 1, 1, 1, 1,
-0.2772874, 0.2106412, -1.419344, 1, 1, 1, 1, 1,
-0.276565, -1.774873, -3.148371, 1, 1, 1, 1, 1,
-0.2758046, 0.8250903, 0.06032831, 1, 1, 1, 1, 1,
-0.2737924, -1.015694, -2.304105, 1, 1, 1, 1, 1,
-0.2639354, -1.183223, -3.395835, 1, 1, 1, 1, 1,
-0.2623018, -0.2429775, -0.490049, 1, 1, 1, 1, 1,
-0.2615101, 0.2245719, 0.9567682, 0, 0, 1, 1, 1,
-0.2521577, -0.9421575, -1.843396, 1, 0, 0, 1, 1,
-0.2514645, 0.2493465, -2.257223, 1, 0, 0, 1, 1,
-0.2486303, 0.4775441, 0.1414293, 1, 0, 0, 1, 1,
-0.2470375, 1.517885, 0.4003855, 1, 0, 0, 1, 1,
-0.2426656, 0.4288485, 0.05914822, 1, 0, 0, 1, 1,
-0.2414734, -1.754735, -3.217543, 0, 0, 0, 1, 1,
-0.2408899, 1.414799, 0.510223, 0, 0, 0, 1, 1,
-0.2376813, 0.4150107, -0.302234, 0, 0, 0, 1, 1,
-0.2344774, 1.810125, -1.206825, 0, 0, 0, 1, 1,
-0.2337768, 0.2584627, -1.421703, 0, 0, 0, 1, 1,
-0.2321859, -0.8099916, -4.64628, 0, 0, 0, 1, 1,
-0.2248085, -0.1852978, -2.748785, 0, 0, 0, 1, 1,
-0.2187022, -0.5282298, -1.986046, 1, 1, 1, 1, 1,
-0.2166609, 0.9985958, 1.248323, 1, 1, 1, 1, 1,
-0.2108276, -1.382339, -1.34812, 1, 1, 1, 1, 1,
-0.2099678, -0.9247572, -3.070713, 1, 1, 1, 1, 1,
-0.2081863, -0.6326337, -3.037001, 1, 1, 1, 1, 1,
-0.2029624, -0.0439897, 0.5244155, 1, 1, 1, 1, 1,
-0.1994351, 0.01433427, 0.1082267, 1, 1, 1, 1, 1,
-0.1974522, -1.833343, -1.906786, 1, 1, 1, 1, 1,
-0.1971526, -0.9643165, -3.847258, 1, 1, 1, 1, 1,
-0.1928574, -1.492705, -3.911942, 1, 1, 1, 1, 1,
-0.1915612, -0.2801206, -2.17977, 1, 1, 1, 1, 1,
-0.1886596, -0.2717991, -2.750583, 1, 1, 1, 1, 1,
-0.1881104, 0.4946228, 0.007587423, 1, 1, 1, 1, 1,
-0.1875758, -1.696225, -2.513632, 1, 1, 1, 1, 1,
-0.1835214, -1.444601, -4.012114, 1, 1, 1, 1, 1,
-0.1830358, -0.4192657, -2.514106, 0, 0, 1, 1, 1,
-0.1804955, -0.6941866, -3.535597, 1, 0, 0, 1, 1,
-0.1796491, -0.5168515, -3.356545, 1, 0, 0, 1, 1,
-0.1796238, -1.032171, -4.471889, 1, 0, 0, 1, 1,
-0.1760733, -0.8897415, -1.183343, 1, 0, 0, 1, 1,
-0.176018, -0.1158353, -0.7649508, 1, 0, 0, 1, 1,
-0.1751915, 2.075746, -0.6365522, 0, 0, 0, 1, 1,
-0.1741638, 0.4345269, -1.853438, 0, 0, 0, 1, 1,
-0.1700092, 0.1855687, 0.4493923, 0, 0, 0, 1, 1,
-0.168379, 0.5395907, -1.110867, 0, 0, 0, 1, 1,
-0.1672145, 0.6079659, 0.07378054, 0, 0, 0, 1, 1,
-0.1628153, 0.1472397, 0.5032049, 0, 0, 0, 1, 1,
-0.1551629, 0.1488347, -1.170052, 0, 0, 0, 1, 1,
-0.153749, 0.9992424, 0.6086062, 1, 1, 1, 1, 1,
-0.1533315, -0.2868467, -2.545811, 1, 1, 1, 1, 1,
-0.1520596, -0.6331632, -3.482039, 1, 1, 1, 1, 1,
-0.1495531, -0.01159562, -1.296777, 1, 1, 1, 1, 1,
-0.149544, -1.532188, -1.276613, 1, 1, 1, 1, 1,
-0.1378458, -0.7330478, -0.7537089, 1, 1, 1, 1, 1,
-0.1305306, 0.04187557, -2.295407, 1, 1, 1, 1, 1,
-0.1305204, 0.4819496, 0.179199, 1, 1, 1, 1, 1,
-0.1282076, 0.3239426, -1.195066, 1, 1, 1, 1, 1,
-0.1177877, 2.953451, 0.06357001, 1, 1, 1, 1, 1,
-0.1175111, 0.7386231, 0.4002291, 1, 1, 1, 1, 1,
-0.1167543, 0.1286103, -0.7601739, 1, 1, 1, 1, 1,
-0.1161517, -0.1418994, -4.400654, 1, 1, 1, 1, 1,
-0.1107927, 0.2700339, 0.3920956, 1, 1, 1, 1, 1,
-0.1096635, -0.06967345, -1.737564, 1, 1, 1, 1, 1,
-0.1084403, 0.6942647, -1.116265, 0, 0, 1, 1, 1,
-0.107497, 1.599091, 0.4439056, 1, 0, 0, 1, 1,
-0.1022176, -1.927506, -3.619085, 1, 0, 0, 1, 1,
-0.09585959, 0.9725986, -0.7105271, 1, 0, 0, 1, 1,
-0.09494907, 2.172077, -2.284952, 1, 0, 0, 1, 1,
-0.09260053, 0.6783054, -1.001812, 1, 0, 0, 1, 1,
-0.0909125, 1.4439, -0.4639304, 0, 0, 0, 1, 1,
-0.09085371, 0.8020759, -1.572903, 0, 0, 0, 1, 1,
-0.09003229, -0.4934975, -2.709976, 0, 0, 0, 1, 1,
-0.08459479, -0.4696563, -2.065898, 0, 0, 0, 1, 1,
-0.08422662, -0.3070725, -1.519956, 0, 0, 0, 1, 1,
-0.0832546, -0.4761972, -2.913138, 0, 0, 0, 1, 1,
-0.08296234, -0.5150195, -4.133543, 0, 0, 0, 1, 1,
-0.08291013, 0.5992492, -0.5270655, 1, 1, 1, 1, 1,
-0.08135989, -0.8996201, -3.139094, 1, 1, 1, 1, 1,
-0.07840995, 0.6713647, -0.5052747, 1, 1, 1, 1, 1,
-0.07781024, -2.495825, -2.094729, 1, 1, 1, 1, 1,
-0.0748938, 0.1545209, -0.4549484, 1, 1, 1, 1, 1,
-0.07373592, 1.128767, 0.07328635, 1, 1, 1, 1, 1,
-0.07241227, -1.290029, -2.974171, 1, 1, 1, 1, 1,
-0.06644744, 0.8913429, -0.2797853, 1, 1, 1, 1, 1,
-0.06587695, 1.216455, -0.9539059, 1, 1, 1, 1, 1,
-0.05715414, 0.03852137, -0.6395099, 1, 1, 1, 1, 1,
-0.05196185, -0.02357754, -1.988519, 1, 1, 1, 1, 1,
-0.05098139, 1.91446, 0.4394543, 1, 1, 1, 1, 1,
-0.04878909, -0.07190432, -1.118389, 1, 1, 1, 1, 1,
-0.04811785, 0.9889208, 0.914398, 1, 1, 1, 1, 1,
-0.04669224, 2.024196, -0.2964091, 1, 1, 1, 1, 1,
-0.04598967, -1.494165, -4.244624, 0, 0, 1, 1, 1,
-0.04313316, -0.7553901, -2.201396, 1, 0, 0, 1, 1,
-0.04184682, -2.552008, -2.669906, 1, 0, 0, 1, 1,
-0.04058646, -0.3411071, -4.036225, 1, 0, 0, 1, 1,
-0.0384195, -2.406948, -3.561094, 1, 0, 0, 1, 1,
-0.03326359, 0.9532824, 0.3557582, 1, 0, 0, 1, 1,
-0.0330208, 1.272237, -1.597719, 0, 0, 0, 1, 1,
-0.03295005, 1.076555, 0.04762976, 0, 0, 0, 1, 1,
-0.03209603, -0.3995277, -1.839489, 0, 0, 0, 1, 1,
-0.02890418, 0.3204908, 0.4300058, 0, 0, 0, 1, 1,
-0.02868444, -0.01794538, -1.093744, 0, 0, 0, 1, 1,
-0.02805538, 1.309489, -0.8990573, 0, 0, 0, 1, 1,
-0.02724971, 0.1647506, -1.366538, 0, 0, 0, 1, 1,
-0.0171454, -1.595305, -2.708252, 1, 1, 1, 1, 1,
-0.01016092, 0.3010039, -1.848506, 1, 1, 1, 1, 1,
-0.001679356, -2.173304, -2.434061, 1, 1, 1, 1, 1,
-0.0009050067, -0.9855803, -3.437167, 1, 1, 1, 1, 1,
0.002532076, 0.7014288, 1.580564, 1, 1, 1, 1, 1,
0.006881903, -0.3888736, 2.154668, 1, 1, 1, 1, 1,
0.007309399, 0.5146709, -0.7338429, 1, 1, 1, 1, 1,
0.007663281, 0.4037264, 0.8223313, 1, 1, 1, 1, 1,
0.0089634, -0.6056882, 3.17585, 1, 1, 1, 1, 1,
0.01464712, 1.148345, -0.5404963, 1, 1, 1, 1, 1,
0.01729165, -0.1766131, 2.673969, 1, 1, 1, 1, 1,
0.0174293, -0.8067976, 3.2458, 1, 1, 1, 1, 1,
0.02690921, 0.04590842, -0.2020202, 1, 1, 1, 1, 1,
0.02818708, 0.01890507, 1.72232, 1, 1, 1, 1, 1,
0.02829355, -0.7792146, 2.757122, 1, 1, 1, 1, 1,
0.03039725, 0.1907609, -0.7517999, 0, 0, 1, 1, 1,
0.03077672, -0.5573748, 1.513002, 1, 0, 0, 1, 1,
0.03105314, 1.091182, 0.7979547, 1, 0, 0, 1, 1,
0.03253001, -1.018558, 1.822357, 1, 0, 0, 1, 1,
0.03592551, 1.775147, 0.7788329, 1, 0, 0, 1, 1,
0.03752843, 0.7495857, 0.5631224, 1, 0, 0, 1, 1,
0.03944828, 1.120017, 0.7254428, 0, 0, 0, 1, 1,
0.0433946, -0.1609272, 3.565519, 0, 0, 0, 1, 1,
0.04493741, 1.240538, -0.8424857, 0, 0, 0, 1, 1,
0.04682837, -1.493582, 4.594961, 0, 0, 0, 1, 1,
0.04836312, -0.5056861, 4.878694, 0, 0, 0, 1, 1,
0.05486669, -0.8799496, 3.458167, 0, 0, 0, 1, 1,
0.05558739, 0.01456285, 2.161784, 0, 0, 0, 1, 1,
0.05608741, 1.028556, 0.6592104, 1, 1, 1, 1, 1,
0.05957067, 0.6442716, 0.1952506, 1, 1, 1, 1, 1,
0.06065508, -0.02294512, 3.107031, 1, 1, 1, 1, 1,
0.06212184, -0.8285324, 2.668147, 1, 1, 1, 1, 1,
0.06311288, 1.609651, -0.3095284, 1, 1, 1, 1, 1,
0.06525443, 0.6947131, 0.3679958, 1, 1, 1, 1, 1,
0.06934396, -0.04287655, 1.267566, 1, 1, 1, 1, 1,
0.07058419, -1.189476, 3.842165, 1, 1, 1, 1, 1,
0.07321464, 0.04643413, 2.478101, 1, 1, 1, 1, 1,
0.07837836, -0.2749436, 3.91841, 1, 1, 1, 1, 1,
0.07877395, -0.8867574, 4.140221, 1, 1, 1, 1, 1,
0.08245754, -0.641563, 0.8747522, 1, 1, 1, 1, 1,
0.08306216, 0.05721271, 0.3845544, 1, 1, 1, 1, 1,
0.08313265, -0.5953988, 4.935182, 1, 1, 1, 1, 1,
0.08400677, -1.534581, 1.718992, 1, 1, 1, 1, 1,
0.08561393, -1.333027, 2.168905, 0, 0, 1, 1, 1,
0.08964875, 0.3249056, -0.425106, 1, 0, 0, 1, 1,
0.0907979, 0.2078502, 0.7375161, 1, 0, 0, 1, 1,
0.09310786, 1.562842, 0.9586115, 1, 0, 0, 1, 1,
0.09367022, 1.116905, -0.5696401, 1, 0, 0, 1, 1,
0.1007886, 1.021252, 0.7852505, 1, 0, 0, 1, 1,
0.1043367, -0.7924243, 1.258555, 0, 0, 0, 1, 1,
0.1088249, -0.2574816, 3.740776, 0, 0, 0, 1, 1,
0.1122589, 0.5503061, -0.2480107, 0, 0, 0, 1, 1,
0.1146123, 0.8599728, 1.081718, 0, 0, 0, 1, 1,
0.1149543, 0.144578, 1.375961, 0, 0, 0, 1, 1,
0.1228343, -0.4838192, 2.052628, 0, 0, 0, 1, 1,
0.1242983, -1.002251, 3.26875, 0, 0, 0, 1, 1,
0.1250354, 0.4576699, 0.9592614, 1, 1, 1, 1, 1,
0.1272314, -1.302068, 2.107613, 1, 1, 1, 1, 1,
0.1359653, 0.04702396, 1.038909, 1, 1, 1, 1, 1,
0.1377841, -0.7063774, 3.21252, 1, 1, 1, 1, 1,
0.1410791, 1.609603, 2.19665, 1, 1, 1, 1, 1,
0.1416607, 0.8510605, -1.043646, 1, 1, 1, 1, 1,
0.1432576, 0.243288, 0.1319027, 1, 1, 1, 1, 1,
0.14477, 0.3980697, -0.4585723, 1, 1, 1, 1, 1,
0.1470683, -1.33274, 3.27898, 1, 1, 1, 1, 1,
0.151234, 0.7489825, 0.5956032, 1, 1, 1, 1, 1,
0.1539487, -0.248131, 1.981573, 1, 1, 1, 1, 1,
0.154091, -0.6980106, 2.084172, 1, 1, 1, 1, 1,
0.1637624, -0.36897, 1.904657, 1, 1, 1, 1, 1,
0.1646986, 0.3979712, -0.1219508, 1, 1, 1, 1, 1,
0.1665877, -1.878414, 3.827046, 1, 1, 1, 1, 1,
0.1676306, -0.6086034, 3.349777, 0, 0, 1, 1, 1,
0.1683575, -0.0415565, 1.260858, 1, 0, 0, 1, 1,
0.1691707, 0.8873942, 0.2813618, 1, 0, 0, 1, 1,
0.1718214, 0.6951924, 2.021188, 1, 0, 0, 1, 1,
0.1720089, -0.1555318, 3.643325, 1, 0, 0, 1, 1,
0.1728397, -0.008346193, 0.3163908, 1, 0, 0, 1, 1,
0.1776282, -0.9563636, 3.421427, 0, 0, 0, 1, 1,
0.1789677, -0.8897071, 2.829366, 0, 0, 0, 1, 1,
0.1792891, 1.15307, -0.334529, 0, 0, 0, 1, 1,
0.1831712, -0.2197697, 3.78699, 0, 0, 0, 1, 1,
0.1883113, 1.198605, 1.182243, 0, 0, 0, 1, 1,
0.1910793, 0.500073, 0.1202226, 0, 0, 0, 1, 1,
0.1969702, 2.900275, -0.3742328, 0, 0, 0, 1, 1,
0.2019, -0.9165621, 1.321213, 1, 1, 1, 1, 1,
0.2038892, -0.3979474, 2.484312, 1, 1, 1, 1, 1,
0.206926, 0.0892894, 0.9072542, 1, 1, 1, 1, 1,
0.2145262, 1.18714, -1.659839, 1, 1, 1, 1, 1,
0.2149488, -0.1735916, 3.47898, 1, 1, 1, 1, 1,
0.220972, 0.5603854, 0.5502987, 1, 1, 1, 1, 1,
0.2222042, -0.4127175, 3.987327, 1, 1, 1, 1, 1,
0.2241235, 0.1963272, -0.1718187, 1, 1, 1, 1, 1,
0.2245072, 1.367278, -0.5393223, 1, 1, 1, 1, 1,
0.2250172, 0.1854234, -0.5621103, 1, 1, 1, 1, 1,
0.2269479, -0.2657038, 2.764206, 1, 1, 1, 1, 1,
0.228669, 0.1521508, 0.8257126, 1, 1, 1, 1, 1,
0.2305829, 0.006547863, 1.343707, 1, 1, 1, 1, 1,
0.2430786, -1.250173, 3.294373, 1, 1, 1, 1, 1,
0.2431044, -0.009527352, 1.833212, 1, 1, 1, 1, 1,
0.2436616, 0.242368, 3.187665, 0, 0, 1, 1, 1,
0.2438348, -0.6462551, 2.223379, 1, 0, 0, 1, 1,
0.2448179, 0.4105487, 0.04711261, 1, 0, 0, 1, 1,
0.2481182, -0.2200688, 1.781437, 1, 0, 0, 1, 1,
0.2489735, -2.239133, 3.518458, 1, 0, 0, 1, 1,
0.2490788, -0.4426332, 2.107777, 1, 0, 0, 1, 1,
0.2511984, -0.4315437, 3.062656, 0, 0, 0, 1, 1,
0.2538768, -0.4193456, 2.980361, 0, 0, 0, 1, 1,
0.254286, -0.9226779, 3.622965, 0, 0, 0, 1, 1,
0.2545802, -1.272135, 2.855386, 0, 0, 0, 1, 1,
0.2563434, -1.16473, 2.249904, 0, 0, 0, 1, 1,
0.2567991, -0.5558696, 1.729596, 0, 0, 0, 1, 1,
0.2619253, 0.11476, -0.6785585, 0, 0, 0, 1, 1,
0.2622144, -0.4906998, 3.5736, 1, 1, 1, 1, 1,
0.2624241, 0.5193833, 1.213633, 1, 1, 1, 1, 1,
0.2668948, -1.000125, 2.880293, 1, 1, 1, 1, 1,
0.2684506, -0.394822, 0.7617779, 1, 1, 1, 1, 1,
0.2708568, 1.057434, 0.547344, 1, 1, 1, 1, 1,
0.2720604, 1.240443, 0.1574024, 1, 1, 1, 1, 1,
0.2723708, 1.100097, 1.05635, 1, 1, 1, 1, 1,
0.2758727, -0.4302445, 2.62638, 1, 1, 1, 1, 1,
0.2764238, -0.8187305, 4.035631, 1, 1, 1, 1, 1,
0.2830749, 1.612326, -0.9859568, 1, 1, 1, 1, 1,
0.2833884, 0.4997891, 1.531557, 1, 1, 1, 1, 1,
0.2852512, -0.2686954, 1.547705, 1, 1, 1, 1, 1,
0.2853688, 1.461997, 1.475, 1, 1, 1, 1, 1,
0.2855352, 0.1639433, 1.232979, 1, 1, 1, 1, 1,
0.2863685, -0.5868565, 1.097402, 1, 1, 1, 1, 1,
0.2864833, -0.4692163, 2.334576, 0, 0, 1, 1, 1,
0.2905344, 0.6378301, -0.6284324, 1, 0, 0, 1, 1,
0.2926972, 1.340336, 0.6061017, 1, 0, 0, 1, 1,
0.293311, 0.732515, 1.17837, 1, 0, 0, 1, 1,
0.2933466, -1.251225, 3.11335, 1, 0, 0, 1, 1,
0.2937688, -1.769241, 2.726622, 1, 0, 0, 1, 1,
0.3014056, 0.3549303, 2.353203, 0, 0, 0, 1, 1,
0.3067257, -2.129149, 2.635869, 0, 0, 0, 1, 1,
0.3116659, 1.486827, -1.851045, 0, 0, 0, 1, 1,
0.3145305, 1.363053, -1.224137, 0, 0, 0, 1, 1,
0.3148693, 0.06882431, -0.4447562, 0, 0, 0, 1, 1,
0.3170087, 0.2402466, 3.399827, 0, 0, 0, 1, 1,
0.3181656, -0.4420622, 3.540049, 0, 0, 0, 1, 1,
0.3200413, 0.7837337, 1.213457, 1, 1, 1, 1, 1,
0.3233946, 1.06945, 2.711154, 1, 1, 1, 1, 1,
0.3272222, 0.4129601, 1.503945, 1, 1, 1, 1, 1,
0.3296726, -1.058121, 2.693112, 1, 1, 1, 1, 1,
0.329766, -0.5643414, 2.365933, 1, 1, 1, 1, 1,
0.3316009, -0.4187009, 2.23822, 1, 1, 1, 1, 1,
0.3344043, -0.5192455, 3.822494, 1, 1, 1, 1, 1,
0.3345517, -0.7992586, 1.526715, 1, 1, 1, 1, 1,
0.3345586, -0.8200662, 4.281846, 1, 1, 1, 1, 1,
0.3383662, 0.1341744, 1.267121, 1, 1, 1, 1, 1,
0.3384193, -0.2528357, 1.626872, 1, 1, 1, 1, 1,
0.3521492, 1.145248, 0.1557451, 1, 1, 1, 1, 1,
0.3524482, 0.9798218, 0.3998769, 1, 1, 1, 1, 1,
0.356114, 0.1650209, 1.743933, 1, 1, 1, 1, 1,
0.3599366, -0.9399697, 2.112153, 1, 1, 1, 1, 1,
0.3614143, -0.2268294, 2.05613, 0, 0, 1, 1, 1,
0.3636212, 1.678627, -0.5174997, 1, 0, 0, 1, 1,
0.3657565, -0.6048422, 0.9867206, 1, 0, 0, 1, 1,
0.3663814, -1.404148, 5.664045, 1, 0, 0, 1, 1,
0.367297, -0.8239551, 2.474492, 1, 0, 0, 1, 1,
0.3675528, 0.9009363, 0.3074516, 1, 0, 0, 1, 1,
0.3684811, 0.1655414, -0.6932876, 0, 0, 0, 1, 1,
0.3706681, -1.241141, 3.357587, 0, 0, 0, 1, 1,
0.3716795, -0.02709394, 1.818247, 0, 0, 0, 1, 1,
0.3729573, 1.902228, 0.05824695, 0, 0, 0, 1, 1,
0.3729829, -0.3287984, 1.180989, 0, 0, 0, 1, 1,
0.3749254, -0.3189308, 3.812276, 0, 0, 0, 1, 1,
0.3761574, -1.804332, 1.038864, 0, 0, 0, 1, 1,
0.3763235, -0.2989315, 2.558443, 1, 1, 1, 1, 1,
0.3766381, -0.2826996, 1.05918, 1, 1, 1, 1, 1,
0.3798789, 0.1668062, 1.499112, 1, 1, 1, 1, 1,
0.380621, 1.109789, -0.5392178, 1, 1, 1, 1, 1,
0.3817571, 1.128574, -1.628061, 1, 1, 1, 1, 1,
0.38863, 1.052587, 1.550056, 1, 1, 1, 1, 1,
0.3890772, -0.3886833, 1.855204, 1, 1, 1, 1, 1,
0.3960856, -0.8146469, 1.860704, 1, 1, 1, 1, 1,
0.3979082, -0.8714397, 1.676026, 1, 1, 1, 1, 1,
0.4025604, -0.259167, 1.381277, 1, 1, 1, 1, 1,
0.4031193, -1.330455, 0.9077712, 1, 1, 1, 1, 1,
0.4046786, 2.161752, -1.291127, 1, 1, 1, 1, 1,
0.4065987, -0.01215628, 1.570307, 1, 1, 1, 1, 1,
0.4082949, -0.6870195, 1.858519, 1, 1, 1, 1, 1,
0.411673, -0.554777, 1.308891, 1, 1, 1, 1, 1,
0.413072, -1.327793, 4.17132, 0, 0, 1, 1, 1,
0.4130879, 0.4303368, 2.076625, 1, 0, 0, 1, 1,
0.4144111, 0.2940611, 0.5836356, 1, 0, 0, 1, 1,
0.4162082, -0.1942005, 4.575098, 1, 0, 0, 1, 1,
0.4265938, -0.5598445, 1.285459, 1, 0, 0, 1, 1,
0.4274505, 0.4840568, 0.3355249, 1, 0, 0, 1, 1,
0.431969, 2.343056, -0.851368, 0, 0, 0, 1, 1,
0.4425038, -0.9365916, 2.613532, 0, 0, 0, 1, 1,
0.447355, 0.2647199, 0.2165704, 0, 0, 0, 1, 1,
0.4516802, -0.0009786593, 1.049169, 0, 0, 0, 1, 1,
0.4549452, 0.5137228, 0.9779139, 0, 0, 0, 1, 1,
0.4593541, 0.8771728, 1.244024, 0, 0, 0, 1, 1,
0.4649314, -0.497359, 2.605973, 0, 0, 0, 1, 1,
0.4689444, 0.04158314, 1.446158, 1, 1, 1, 1, 1,
0.4709559, -0.4058699, 1.999412, 1, 1, 1, 1, 1,
0.4737463, 0.3904612, 0.770787, 1, 1, 1, 1, 1,
0.4776157, 0.8362228, 1.66051, 1, 1, 1, 1, 1,
0.4821519, 0.3120754, 0.5925723, 1, 1, 1, 1, 1,
0.4925836, 0.6020195, 0.7389799, 1, 1, 1, 1, 1,
0.4981507, -0.4309236, 3.295237, 1, 1, 1, 1, 1,
0.4993062, 0.831356, -0.4548066, 1, 1, 1, 1, 1,
0.511322, -0.2030378, 1.245245, 1, 1, 1, 1, 1,
0.5114387, -0.4406966, 1.187847, 1, 1, 1, 1, 1,
0.5186785, 0.6177623, 0.757949, 1, 1, 1, 1, 1,
0.5196528, -0.4767429, 3.141981, 1, 1, 1, 1, 1,
0.5214428, -0.5061923, 0.5706093, 1, 1, 1, 1, 1,
0.5221455, -1.170496, 3.466884, 1, 1, 1, 1, 1,
0.5243742, 1.493749, -0.6895817, 1, 1, 1, 1, 1,
0.5255331, 0.4043927, -0.3950318, 0, 0, 1, 1, 1,
0.5266926, -1.87011, 1.874557, 1, 0, 0, 1, 1,
0.5272967, 0.2974482, -0.5474389, 1, 0, 0, 1, 1,
0.541137, -0.1308654, 0.8251163, 1, 0, 0, 1, 1,
0.5424683, -0.8587407, 3.149381, 1, 0, 0, 1, 1,
0.5427817, -0.8705077, 1.257697, 1, 0, 0, 1, 1,
0.5433393, 0.7701473, 0.9437408, 0, 0, 0, 1, 1,
0.5493036, -0.6361506, 2.127023, 0, 0, 0, 1, 1,
0.5551206, 0.3536262, 0.6869699, 0, 0, 0, 1, 1,
0.5618833, 0.4550832, 2.167653, 0, 0, 0, 1, 1,
0.5687525, -0.3229908, 2.567083, 0, 0, 0, 1, 1,
0.5700046, -1.163894, 1.076507, 0, 0, 0, 1, 1,
0.5845909, 0.4752043, 0.1747973, 0, 0, 0, 1, 1,
0.5860744, -0.9422041, 2.375284, 1, 1, 1, 1, 1,
0.5872148, 0.06172189, 2.122227, 1, 1, 1, 1, 1,
0.5886937, 1.96274, 2.424607, 1, 1, 1, 1, 1,
0.5915016, -0.01526624, 2.1151, 1, 1, 1, 1, 1,
0.5935814, -0.005617248, 1.368696, 1, 1, 1, 1, 1,
0.5955405, -0.8117105, 1.362814, 1, 1, 1, 1, 1,
0.5984846, 1.473164, -3.186539, 1, 1, 1, 1, 1,
0.6128407, 0.07377782, 1.410475, 1, 1, 1, 1, 1,
0.6129845, -0.5013695, 3.110167, 1, 1, 1, 1, 1,
0.6164331, 0.3018612, 1.265252, 1, 1, 1, 1, 1,
0.6182098, 1.892329, 0.6878666, 1, 1, 1, 1, 1,
0.618999, -0.002437342, 2.756861, 1, 1, 1, 1, 1,
0.619126, -0.2788723, 1.864769, 1, 1, 1, 1, 1,
0.6222462, 0.3547238, -0.3825202, 1, 1, 1, 1, 1,
0.6243016, -0.211034, 1.792102, 1, 1, 1, 1, 1,
0.625139, -0.3686178, 2.693078, 0, 0, 1, 1, 1,
0.6268737, -0.2294405, 2.544027, 1, 0, 0, 1, 1,
0.6283919, 1.389207, -0.08720934, 1, 0, 0, 1, 1,
0.6429067, -0.646373, 1.005916, 1, 0, 0, 1, 1,
0.6469129, 1.528676, 0.9461334, 1, 0, 0, 1, 1,
0.648376, 0.3668414, 3.02611, 1, 0, 0, 1, 1,
0.6511832, 0.8225297, -0.002984763, 0, 0, 0, 1, 1,
0.651743, 0.9459339, 1.604886, 0, 0, 0, 1, 1,
0.6548826, 0.2126555, 0.6983495, 0, 0, 0, 1, 1,
0.657024, -0.5221723, 2.844321, 0, 0, 0, 1, 1,
0.658179, 0.7173703, 2.022022, 0, 0, 0, 1, 1,
0.6609742, 0.5871164, -0.5129559, 0, 0, 0, 1, 1,
0.6628056, 0.3656642, 1.986093, 0, 0, 0, 1, 1,
0.664603, -0.2480557, 1.915529, 1, 1, 1, 1, 1,
0.6656893, 0.8463421, 0.686547, 1, 1, 1, 1, 1,
0.6668867, 0.890337, 0.3110049, 1, 1, 1, 1, 1,
0.6669089, 0.785994, -0.5922043, 1, 1, 1, 1, 1,
0.6682378, 0.08221664, 3.176691, 1, 1, 1, 1, 1,
0.670177, 1.039537, 1.332313, 1, 1, 1, 1, 1,
0.6721095, 1.635919, -0.02932117, 1, 1, 1, 1, 1,
0.6849543, 1.343707, 0.4924351, 1, 1, 1, 1, 1,
0.6870873, 0.02867492, 2.090032, 1, 1, 1, 1, 1,
0.6878035, -0.787998, 1.956163, 1, 1, 1, 1, 1,
0.692035, 0.06357033, 0.3934621, 1, 1, 1, 1, 1,
0.6928574, -0.4859956, 1.295541, 1, 1, 1, 1, 1,
0.6947261, -0.1782728, 3.437208, 1, 1, 1, 1, 1,
0.6971457, 2.109767, 1.034005, 1, 1, 1, 1, 1,
0.7026101, -1.076076, 3.052715, 1, 1, 1, 1, 1,
0.7074637, -0.2777593, 1.84268, 0, 0, 1, 1, 1,
0.7117992, 1.754288, 0.337804, 1, 0, 0, 1, 1,
0.717641, -0.3780117, 3.28302, 1, 0, 0, 1, 1,
0.7176968, 1.168096, 1.487139, 1, 0, 0, 1, 1,
0.7191032, 0.8455227, 1.08448, 1, 0, 0, 1, 1,
0.7203802, -0.4770297, 1.008891, 1, 0, 0, 1, 1,
0.7208638, 1.266804, 0.8915134, 0, 0, 0, 1, 1,
0.7211425, 0.4727946, 1.54751, 0, 0, 0, 1, 1,
0.7232208, -0.196037, 1.853436, 0, 0, 0, 1, 1,
0.7250873, -0.2858716, 1.535702, 0, 0, 0, 1, 1,
0.7280845, -1.169109, 4.213409, 0, 0, 0, 1, 1,
0.7283179, 0.544571, -0.3940697, 0, 0, 0, 1, 1,
0.7285957, -2.076174, 3.844089, 0, 0, 0, 1, 1,
0.7303666, 0.4276944, 2.801514, 1, 1, 1, 1, 1,
0.73175, -1.641727, 4.497413, 1, 1, 1, 1, 1,
0.7343702, 3.001216, 1.644804, 1, 1, 1, 1, 1,
0.7375465, -2.447111, 2.097823, 1, 1, 1, 1, 1,
0.7417952, 0.4368259, 1.114736, 1, 1, 1, 1, 1,
0.7460569, -1.440627, 2.300232, 1, 1, 1, 1, 1,
0.7557952, -0.3234556, 2.390489, 1, 1, 1, 1, 1,
0.7581578, -1.878448, 2.387471, 1, 1, 1, 1, 1,
0.759944, -0.07138339, 1.957556, 1, 1, 1, 1, 1,
0.7686214, -0.486967, 0.07552101, 1, 1, 1, 1, 1,
0.7735251, 0.3888158, 2.889714, 1, 1, 1, 1, 1,
0.7758713, 0.3748784, -0.3398475, 1, 1, 1, 1, 1,
0.7904097, -1.132785, 2.843548, 1, 1, 1, 1, 1,
0.7937608, -0.6796704, 3.033212, 1, 1, 1, 1, 1,
0.7979052, 0.05934398, 1.257232, 1, 1, 1, 1, 1,
0.8037335, -1.9225, 1.859022, 0, 0, 1, 1, 1,
0.8218032, 0.1820221, 0.4991815, 1, 0, 0, 1, 1,
0.8220212, -0.5824096, 2.962798, 1, 0, 0, 1, 1,
0.8230962, -0.7425853, 3.005143, 1, 0, 0, 1, 1,
0.8256109, -0.548632, 1.98251, 1, 0, 0, 1, 1,
0.8290045, -1.487565, 2.618193, 1, 0, 0, 1, 1,
0.8318874, -0.6642835, 2.290987, 0, 0, 0, 1, 1,
0.8318903, 2.021129, 0.730705, 0, 0, 0, 1, 1,
0.8373513, 0.558827, 1.493371, 0, 0, 0, 1, 1,
0.8418635, -0.4392422, 0.2567371, 0, 0, 0, 1, 1,
0.8440498, -1.066977, 2.530381, 0, 0, 0, 1, 1,
0.8447998, -1.06429, 3.627945, 0, 0, 0, 1, 1,
0.8517424, 0.6080108, 1.630911, 0, 0, 0, 1, 1,
0.8576646, 0.5422145, 2.616191, 1, 1, 1, 1, 1,
0.8587504, 1.903507, 0.07498998, 1, 1, 1, 1, 1,
0.8665742, -0.6511767, 2.407493, 1, 1, 1, 1, 1,
0.8723231, 0.03929266, 1.048734, 1, 1, 1, 1, 1,
0.8821777, 0.946254, 1.994611, 1, 1, 1, 1, 1,
0.8821803, -0.08019495, 2.620662, 1, 1, 1, 1, 1,
0.8868669, -0.6188732, 0.8756076, 1, 1, 1, 1, 1,
0.8878976, -1.794776, 2.218548, 1, 1, 1, 1, 1,
0.8917322, -1.322417, 3.507919, 1, 1, 1, 1, 1,
0.8989719, 0.5725997, 1.470148, 1, 1, 1, 1, 1,
0.9000511, 0.4169407, 2.074802, 1, 1, 1, 1, 1,
0.9027517, 1.169955, -0.2730449, 1, 1, 1, 1, 1,
0.9044406, -1.004327, 3.930528, 1, 1, 1, 1, 1,
0.9073867, 0.2568381, 1.625528, 1, 1, 1, 1, 1,
0.9098786, -0.01358934, 1.901885, 1, 1, 1, 1, 1,
0.9150149, 0.8871388, -0.1027798, 0, 0, 1, 1, 1,
0.9159968, -0.3233984, 2.379461, 1, 0, 0, 1, 1,
0.9253107, -0.1283343, 1.490652, 1, 0, 0, 1, 1,
0.9397528, -0.1072357, 2.131649, 1, 0, 0, 1, 1,
0.9440394, -0.586149, 2.216737, 1, 0, 0, 1, 1,
0.9477249, 0.2423522, 0.5976295, 1, 0, 0, 1, 1,
0.951529, 0.9461479, 1.72608, 0, 0, 0, 1, 1,
0.9524243, -1.154903, 3.796485, 0, 0, 0, 1, 1,
0.9525432, -0.1917787, 2.980144, 0, 0, 0, 1, 1,
0.9568033, -1.146412, 2.439923, 0, 0, 0, 1, 1,
0.9585593, 1.455366, 2.462459, 0, 0, 0, 1, 1,
0.970046, -1.600807, 1.142089, 0, 0, 0, 1, 1,
0.9714251, 0.5475789, 0.5908818, 0, 0, 0, 1, 1,
0.9796991, 1.387839, -0.4545596, 1, 1, 1, 1, 1,
0.9830845, 0.8365959, 1.828049, 1, 1, 1, 1, 1,
0.989522, 0.5679715, 1.246622, 1, 1, 1, 1, 1,
0.9902301, 0.09916059, 1.379396, 1, 1, 1, 1, 1,
0.991523, 0.918407, 1.2084, 1, 1, 1, 1, 1,
0.9922454, -1.73129, 3.556926, 1, 1, 1, 1, 1,
0.9929397, 0.7450728, 0.4058852, 1, 1, 1, 1, 1,
1.0026, -0.03960993, 0.51008, 1, 1, 1, 1, 1,
1.014607, 0.04484572, 0.3813297, 1, 1, 1, 1, 1,
1.016481, 1.617438, 1.487788, 1, 1, 1, 1, 1,
1.022304, -0.4175382, 2.395473, 1, 1, 1, 1, 1,
1.023112, -0.2580526, 1.32321, 1, 1, 1, 1, 1,
1.023763, 1.005464, 0.6776288, 1, 1, 1, 1, 1,
1.033935, -1.058522, 2.620998, 1, 1, 1, 1, 1,
1.047516, -0.9995381, 1.040652, 1, 1, 1, 1, 1,
1.049498, 0.01606547, 0.5092186, 0, 0, 1, 1, 1,
1.049927, 1.118918, 0.5357264, 1, 0, 0, 1, 1,
1.05367, -1.283146, 3.499454, 1, 0, 0, 1, 1,
1.05529, 0.02231324, 2.176704, 1, 0, 0, 1, 1,
1.058779, -0.4471668, 1.072556, 1, 0, 0, 1, 1,
1.061625, 1.836522, 0.7535303, 1, 0, 0, 1, 1,
1.064933, 0.1916456, 1.573339, 0, 0, 0, 1, 1,
1.075603, 0.6664884, -0.04407464, 0, 0, 0, 1, 1,
1.077796, 0.7750245, 0.1092174, 0, 0, 0, 1, 1,
1.086829, -0.2983213, 2.457994, 0, 0, 0, 1, 1,
1.089459, -0.4687755, 2.677596, 0, 0, 0, 1, 1,
1.092425, 0.9268916, -0.9870616, 0, 0, 0, 1, 1,
1.092921, 0.2180554, 0.9537198, 0, 0, 0, 1, 1,
1.09565, 1.320007, -0.7631633, 1, 1, 1, 1, 1,
1.102278, -0.2855344, 1.345586, 1, 1, 1, 1, 1,
1.102861, -0.3035298, 1.027128, 1, 1, 1, 1, 1,
1.106917, -0.6180202, 3.717306, 1, 1, 1, 1, 1,
1.107618, -0.1326896, 0.6212426, 1, 1, 1, 1, 1,
1.115577, 0.1048856, -0.155684, 1, 1, 1, 1, 1,
1.117441, -0.573895, 0.2740673, 1, 1, 1, 1, 1,
1.118059, -0.3764031, 2.288876, 1, 1, 1, 1, 1,
1.118993, 0.2561077, 1.335291, 1, 1, 1, 1, 1,
1.120496, -0.3820922, 2.918198, 1, 1, 1, 1, 1,
1.120564, -0.2294665, 1.017608, 1, 1, 1, 1, 1,
1.121565, -0.3308829, -0.04468792, 1, 1, 1, 1, 1,
1.122268, -0.270227, 0.6058142, 1, 1, 1, 1, 1,
1.123013, 0.7172791, -0.496514, 1, 1, 1, 1, 1,
1.123585, 0.9978936, 1.85255, 1, 1, 1, 1, 1,
1.129569, 0.4382106, 1.201674, 0, 0, 1, 1, 1,
1.134286, 1.471038, -0.2158724, 1, 0, 0, 1, 1,
1.13886, 0.2054938, 0.4399654, 1, 0, 0, 1, 1,
1.147237, 0.2937383, 1.650479, 1, 0, 0, 1, 1,
1.14786, -1.547716, 4.86891, 1, 0, 0, 1, 1,
1.159769, -1.268049, 1.685046, 1, 0, 0, 1, 1,
1.174291, -0.6523368, 2.842808, 0, 0, 0, 1, 1,
1.17545, 0.7546458, 1.470689, 0, 0, 0, 1, 1,
1.176942, 0.7968615, 1.551235, 0, 0, 0, 1, 1,
1.184479, 0.7890983, 2.411037, 0, 0, 0, 1, 1,
1.184943, 1.682197, -0.1852088, 0, 0, 0, 1, 1,
1.186877, -0.2995028, 2.82423, 0, 0, 0, 1, 1,
1.189062, -0.03172296, 0.1831856, 0, 0, 0, 1, 1,
1.192417, 0.6874697, 0.9741232, 1, 1, 1, 1, 1,
1.193193, 2.078281, 0.06078599, 1, 1, 1, 1, 1,
1.196162, 0.7691139, 0.9931717, 1, 1, 1, 1, 1,
1.19979, -2.054102, 2.006556, 1, 1, 1, 1, 1,
1.206511, 1.216513, 1.096587, 1, 1, 1, 1, 1,
1.207188, 0.486633, 0.02872775, 1, 1, 1, 1, 1,
1.210811, -0.2169462, 0.5390587, 1, 1, 1, 1, 1,
1.214033, 0.7336119, 1.733136, 1, 1, 1, 1, 1,
1.226068, -0.6289481, 3.16554, 1, 1, 1, 1, 1,
1.231906, -1.744014, 2.685654, 1, 1, 1, 1, 1,
1.235645, 1.824934, 0.6327336, 1, 1, 1, 1, 1,
1.238556, 1.376281, 1.139212, 1, 1, 1, 1, 1,
1.248393, -0.4979197, 2.374681, 1, 1, 1, 1, 1,
1.249648, -0.217224, 3.157153, 1, 1, 1, 1, 1,
1.254983, -0.5988479, 3.481153, 1, 1, 1, 1, 1,
1.2555, -0.0943482, 0.1018218, 0, 0, 1, 1, 1,
1.267689, 0.1377524, 0.9575755, 1, 0, 0, 1, 1,
1.270064, 0.1283459, 0.2231659, 1, 0, 0, 1, 1,
1.273113, -1.732475, 2.935911, 1, 0, 0, 1, 1,
1.275515, 0.533757, 0.5356271, 1, 0, 0, 1, 1,
1.282273, 1.058853, 0.8487449, 1, 0, 0, 1, 1,
1.293887, 1.346011, -0.1178761, 0, 0, 0, 1, 1,
1.297298, 1.050651, 1.109178, 0, 0, 0, 1, 1,
1.315013, -0.1826314, 2.123556, 0, 0, 0, 1, 1,
1.315877, -1.026049, 2.57174, 0, 0, 0, 1, 1,
1.320064, -0.6097842, 3.158202, 0, 0, 0, 1, 1,
1.335863, -1.43464, 2.010045, 0, 0, 0, 1, 1,
1.338663, -0.8361026, 2.254973, 0, 0, 0, 1, 1,
1.346169, -0.9133568, 0.7366433, 1, 1, 1, 1, 1,
1.355734, 1.142373, 1.199208, 1, 1, 1, 1, 1,
1.362539, 0.9803948, 0.8423365, 1, 1, 1, 1, 1,
1.363125, -0.2213349, 0.7090659, 1, 1, 1, 1, 1,
1.380061, 0.731813, 2.290136, 1, 1, 1, 1, 1,
1.382925, 0.5451879, 0.2651316, 1, 1, 1, 1, 1,
1.385645, -2.09366, 4.213804, 1, 1, 1, 1, 1,
1.401883, 0.7886978, 1.553007, 1, 1, 1, 1, 1,
1.411418, 0.5700801, 1.510042, 1, 1, 1, 1, 1,
1.426354, 0.2913776, 2.541056, 1, 1, 1, 1, 1,
1.431705, 0.04199616, 1.577291, 1, 1, 1, 1, 1,
1.440281, -0.3402449, 1.314106, 1, 1, 1, 1, 1,
1.442377, 0.4450789, 1.198774, 1, 1, 1, 1, 1,
1.442603, -0.3779992, 2.675368, 1, 1, 1, 1, 1,
1.442686, 1.614357, -0.4738933, 1, 1, 1, 1, 1,
1.445999, -1.40161, 2.424653, 0, 0, 1, 1, 1,
1.447482, 1.531005, 0.3572129, 1, 0, 0, 1, 1,
1.457706, 0.5143932, 1.201241, 1, 0, 0, 1, 1,
1.463743, -0.4452717, 0.5178619, 1, 0, 0, 1, 1,
1.485709, -1.316973, 0.7506201, 1, 0, 0, 1, 1,
1.49298, -1.872981, 3.634807, 1, 0, 0, 1, 1,
1.496776, -1.158539, 1.694787, 0, 0, 0, 1, 1,
1.498186, 1.21549, 0.06569957, 0, 0, 0, 1, 1,
1.51, 0.1948329, 1.250682, 0, 0, 0, 1, 1,
1.51386, 1.95742, -1.607643, 0, 0, 0, 1, 1,
1.51396, 0.1814322, 1.299338, 0, 0, 0, 1, 1,
1.514019, 1.151237, 0.5095645, 0, 0, 0, 1, 1,
1.525305, -1.900939, 2.886706, 0, 0, 0, 1, 1,
1.537723, -0.5276115, 0.3609036, 1, 1, 1, 1, 1,
1.547584, 0.3993593, -0.5484473, 1, 1, 1, 1, 1,
1.564429, 0.3180783, 0.0797268, 1, 1, 1, 1, 1,
1.595637, -0.6306607, 2.665225, 1, 1, 1, 1, 1,
1.600183, 0.1980975, 0.5513679, 1, 1, 1, 1, 1,
1.604661, 1.225527, 1.171663, 1, 1, 1, 1, 1,
1.617999, -0.3451529, 1.878498, 1, 1, 1, 1, 1,
1.635941, 0.7126591, 1.164144, 1, 1, 1, 1, 1,
1.638151, 1.142276, 0.9821173, 1, 1, 1, 1, 1,
1.638916, 0.3253252, 0.7729657, 1, 1, 1, 1, 1,
1.64019, 0.1527891, -0.5562403, 1, 1, 1, 1, 1,
1.645583, 0.3545652, 2.70955, 1, 1, 1, 1, 1,
1.668402, -0.1517979, 1.183332, 1, 1, 1, 1, 1,
1.671507, 1.124727, 3.25944, 1, 1, 1, 1, 1,
1.682132, -1.376498, 1.322984, 1, 1, 1, 1, 1,
1.684043, -0.402418, 2.465974, 0, 0, 1, 1, 1,
1.685313, -1.752642, 3.158778, 1, 0, 0, 1, 1,
1.688471, 3.214072, 0.6709279, 1, 0, 0, 1, 1,
1.689188, 0.5568466, 2.184122, 1, 0, 0, 1, 1,
1.700142, 0.05227655, 2.366435, 1, 0, 0, 1, 1,
1.734364, -1.862862, 3.200273, 1, 0, 0, 1, 1,
1.753556, 0.4929094, 1.883698, 0, 0, 0, 1, 1,
1.754283, 0.2901441, 1.424134, 0, 0, 0, 1, 1,
1.805609, 0.8616319, 0.7514855, 0, 0, 0, 1, 1,
1.822551, 0.234874, 2.252467, 0, 0, 0, 1, 1,
1.82764, -1.139865, 3.315275, 0, 0, 0, 1, 1,
1.837437, -0.4947804, 2.426903, 0, 0, 0, 1, 1,
1.874166, -0.232053, 1.856761, 0, 0, 0, 1, 1,
1.878595, 1.015016, 0.5489973, 1, 1, 1, 1, 1,
1.890365, -0.5255746, 2.362441, 1, 1, 1, 1, 1,
1.890962, 0.5859424, 0.5144057, 1, 1, 1, 1, 1,
1.894527, 0.3099796, 0.9511658, 1, 1, 1, 1, 1,
1.906163, 0.9195904, -0.04607348, 1, 1, 1, 1, 1,
1.909445, 1.110576, 1.699751, 1, 1, 1, 1, 1,
1.924741, -0.6351545, 2.376295, 1, 1, 1, 1, 1,
1.938714, 0.2872125, 2.768262, 1, 1, 1, 1, 1,
1.949659, -0.6783546, 1.475833, 1, 1, 1, 1, 1,
1.988047, 0.08771379, 2.150746, 1, 1, 1, 1, 1,
2.013796, -0.2584373, 1.945775, 1, 1, 1, 1, 1,
2.072079, 1.226067, 1.93697, 1, 1, 1, 1, 1,
2.082329, 0.7287363, 2.619313, 1, 1, 1, 1, 1,
2.084543, 1.547472, -0.8911985, 1, 1, 1, 1, 1,
2.110726, 0.9802371, 0.7947471, 1, 1, 1, 1, 1,
2.14065, -0.1840576, 1.637601, 0, 0, 1, 1, 1,
2.141512, -1.201234, 2.106206, 1, 0, 0, 1, 1,
2.365616, 1.015161, -0.7671134, 1, 0, 0, 1, 1,
2.403167, 2.608385, -0.9735242, 1, 0, 0, 1, 1,
2.411683, -0.5659685, 2.035743, 1, 0, 0, 1, 1,
2.492146, -0.4740241, 2.110878, 1, 0, 0, 1, 1,
2.510743, -1.62747, 2.409634, 0, 0, 0, 1, 1,
2.512475, -0.951991, 2.948781, 0, 0, 0, 1, 1,
2.521398, -1.484814, 2.241447, 0, 0, 0, 1, 1,
2.535514, -0.2306243, 2.22012, 0, 0, 0, 1, 1,
2.550483, 1.785776, 1.393386, 0, 0, 0, 1, 1,
2.608438, 1.641011, 0.1579134, 0, 0, 0, 1, 1,
2.62908, 0.4621576, 1.365501, 0, 0, 0, 1, 1,
2.667168, -0.5652723, 3.343166, 1, 1, 1, 1, 1,
2.671593, -0.8263932, 1.461226, 1, 1, 1, 1, 1,
2.74504, -0.3680177, -0.4079654, 1, 1, 1, 1, 1,
2.748815, -0.3306498, 2.085069, 1, 1, 1, 1, 1,
2.817456, -0.16898, 2.530103, 1, 1, 1, 1, 1,
2.869713, 0.180992, 0.9172297, 1, 1, 1, 1, 1,
2.875001, -0.7618063, 2.499631, 1, 1, 1, 1, 1
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
var radius = 9.655504;
var distance = 33.91455;
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
mvMatrix.translate( 0.2016616, 0.05057096, -0.1646452 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91455);
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
