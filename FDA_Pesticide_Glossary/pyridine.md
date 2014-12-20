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
-3.036519, 0.4072872, -1.960158, 1, 0, 0, 1,
-2.713359, -1.437683, -1.482464, 1, 0.007843138, 0, 1,
-2.469868, -2.353463, -0.9015117, 1, 0.01176471, 0, 1,
-2.310213, 0.6041348, -0.04605575, 1, 0.01960784, 0, 1,
-2.264479, -0.01710808, -0.6499994, 1, 0.02352941, 0, 1,
-2.231657, -0.1234917, -0.3933667, 1, 0.03137255, 0, 1,
-2.211394, -1.670098, -1.172371, 1, 0.03529412, 0, 1,
-2.153501, -0.01467802, -0.783419, 1, 0.04313726, 0, 1,
-2.153466, 0.9243084, -0.9202865, 1, 0.04705882, 0, 1,
-2.126235, 1.151455, -1.845498, 1, 0.05490196, 0, 1,
-2.039196, -1.831326, -4.267507, 1, 0.05882353, 0, 1,
-2.026934, -0.478487, -1.35539, 1, 0.06666667, 0, 1,
-2.024475, -0.712783, -2.104277, 1, 0.07058824, 0, 1,
-1.998775, 2.239234, 0.4924311, 1, 0.07843138, 0, 1,
-1.976259, -0.6589478, -1.414036, 1, 0.08235294, 0, 1,
-1.910683, 0.2150567, -3.812419, 1, 0.09019608, 0, 1,
-1.902468, 0.2119764, -0.9900204, 1, 0.09411765, 0, 1,
-1.898661, -1.221105, -0.5330629, 1, 0.1019608, 0, 1,
-1.881018, -0.0007398454, -3.499469, 1, 0.1098039, 0, 1,
-1.860321, 0.5140358, -0.9669613, 1, 0.1137255, 0, 1,
-1.852895, 0.03136122, -2.20347, 1, 0.1215686, 0, 1,
-1.837303, -1.045855, -1.2432, 1, 0.1254902, 0, 1,
-1.831916, -0.8918058, -2.249226, 1, 0.1333333, 0, 1,
-1.801307, 1.057434, -3.123895, 1, 0.1372549, 0, 1,
-1.783441, -0.8519073, -2.288398, 1, 0.145098, 0, 1,
-1.781497, 0.8465292, -0.520514, 1, 0.1490196, 0, 1,
-1.700523, -0.2452534, -2.064577, 1, 0.1568628, 0, 1,
-1.698489, -0.8584965, -0.8012484, 1, 0.1607843, 0, 1,
-1.69074, 0.3869132, 0.6748133, 1, 0.1686275, 0, 1,
-1.680042, -0.768114, -2.271101, 1, 0.172549, 0, 1,
-1.675075, 1.664094, -0.2548741, 1, 0.1803922, 0, 1,
-1.664141, -0.7665941, -2.210868, 1, 0.1843137, 0, 1,
-1.656717, 0.6290879, -2.239335, 1, 0.1921569, 0, 1,
-1.656016, 0.3674594, -1.535758, 1, 0.1960784, 0, 1,
-1.654831, 1.528881, -1.262309, 1, 0.2039216, 0, 1,
-1.649476, -0.6223379, -1.555713, 1, 0.2117647, 0, 1,
-1.632792, 1.088033, -0.7692834, 1, 0.2156863, 0, 1,
-1.628966, -0.1674016, -0.743074, 1, 0.2235294, 0, 1,
-1.621811, 0.3954108, -1.387308, 1, 0.227451, 0, 1,
-1.607031, 0.1615578, -0.2526283, 1, 0.2352941, 0, 1,
-1.59502, -0.3487849, -2.149391, 1, 0.2392157, 0, 1,
-1.587131, 1.807907, -0.5155709, 1, 0.2470588, 0, 1,
-1.585775, 0.06258669, -3.291204, 1, 0.2509804, 0, 1,
-1.584536, -1.301518, -3.691037, 1, 0.2588235, 0, 1,
-1.584185, -2.190485, -3.034962, 1, 0.2627451, 0, 1,
-1.584053, -0.1643836, -2.329806, 1, 0.2705882, 0, 1,
-1.546477, -1.966245, -2.185075, 1, 0.2745098, 0, 1,
-1.526913, 0.5668682, 0.2434898, 1, 0.282353, 0, 1,
-1.514565, -0.3365282, -2.064321, 1, 0.2862745, 0, 1,
-1.504225, -0.05820365, -1.008798, 1, 0.2941177, 0, 1,
-1.503455, -0.9313786, -2.073448, 1, 0.3019608, 0, 1,
-1.494463, 0.1553593, -1.425312, 1, 0.3058824, 0, 1,
-1.484365, 1.26125, -2.134972, 1, 0.3137255, 0, 1,
-1.475085, 1.868106, 0.7077189, 1, 0.3176471, 0, 1,
-1.470148, -0.7345142, -1.256397, 1, 0.3254902, 0, 1,
-1.45859, 1.48764, -0.7461538, 1, 0.3294118, 0, 1,
-1.436269, 0.6788553, -2.459583, 1, 0.3372549, 0, 1,
-1.427834, 0.3474998, -3.239793, 1, 0.3411765, 0, 1,
-1.42482, -0.193747, -2.240558, 1, 0.3490196, 0, 1,
-1.420956, 2.727971, -0.8306469, 1, 0.3529412, 0, 1,
-1.411272, 1.912996, -0.001745598, 1, 0.3607843, 0, 1,
-1.398122, -2.073068, -1.602172, 1, 0.3647059, 0, 1,
-1.391911, 0.3035765, -1.762044, 1, 0.372549, 0, 1,
-1.387358, 0.8908187, -1.197924, 1, 0.3764706, 0, 1,
-1.387116, 0.2403644, -2.085938, 1, 0.3843137, 0, 1,
-1.385727, 0.2092504, -1.798177, 1, 0.3882353, 0, 1,
-1.365528, -0.6636921, -2.530321, 1, 0.3960784, 0, 1,
-1.363561, -0.02823405, -0.7367699, 1, 0.4039216, 0, 1,
-1.359807, -2.037412, -1.515556, 1, 0.4078431, 0, 1,
-1.352227, -0.5565402, -2.951103, 1, 0.4156863, 0, 1,
-1.34725, -1.116173, -1.139386, 1, 0.4196078, 0, 1,
-1.339758, 0.5188446, -0.6711892, 1, 0.427451, 0, 1,
-1.338036, 1.148641, -0.1754932, 1, 0.4313726, 0, 1,
-1.33195, -0.2718578, -1.117071, 1, 0.4392157, 0, 1,
-1.331687, -1.660344, -1.575691, 1, 0.4431373, 0, 1,
-1.323677, 1.249575, -1.250493, 1, 0.4509804, 0, 1,
-1.318298, 1.117605, -1.402147, 1, 0.454902, 0, 1,
-1.315864, -0.3892599, -1.56598, 1, 0.4627451, 0, 1,
-1.313185, -0.8641976, -0.6538789, 1, 0.4666667, 0, 1,
-1.302767, -1.183874, -2.77779, 1, 0.4745098, 0, 1,
-1.301432, 0.9953455, -1.258881, 1, 0.4784314, 0, 1,
-1.300318, 0.5299076, -1.821293, 1, 0.4862745, 0, 1,
-1.292823, -0.4276427, -1.439467, 1, 0.4901961, 0, 1,
-1.288852, 0.5100581, -2.038104, 1, 0.4980392, 0, 1,
-1.286487, 0.5097331, -1.232144, 1, 0.5058824, 0, 1,
-1.274548, 0.0708431, -2.641294, 1, 0.509804, 0, 1,
-1.269769, -0.8497386, -2.473835, 1, 0.5176471, 0, 1,
-1.263285, 0.1031774, -1.141562, 1, 0.5215687, 0, 1,
-1.262021, 0.06103592, -3.474889, 1, 0.5294118, 0, 1,
-1.259715, 0.1076332, -2.192946, 1, 0.5333334, 0, 1,
-1.252959, -1.586929, -3.179996, 1, 0.5411765, 0, 1,
-1.24634, 0.2404936, -2.994569, 1, 0.5450981, 0, 1,
-1.240542, 0.4195528, -0.7153811, 1, 0.5529412, 0, 1,
-1.236982, -2.617373, -2.89487, 1, 0.5568628, 0, 1,
-1.236309, -0.7602515, -0.5912537, 1, 0.5647059, 0, 1,
-1.235726, -0.03372151, -0.1458266, 1, 0.5686275, 0, 1,
-1.229741, -0.1647454, -2.386705, 1, 0.5764706, 0, 1,
-1.212875, -0.2498092, -2.158581, 1, 0.5803922, 0, 1,
-1.210797, -0.0526057, -2.054053, 1, 0.5882353, 0, 1,
-1.208123, 0.3158661, -0.185471, 1, 0.5921569, 0, 1,
-1.199697, -0.6924028, -2.700296, 1, 0.6, 0, 1,
-1.193199, -1.682181, -1.835982, 1, 0.6078432, 0, 1,
-1.192378, -2.115509, -2.920824, 1, 0.6117647, 0, 1,
-1.187849, 0.3505472, -0.709866, 1, 0.6196079, 0, 1,
-1.184424, -1.746851, -3.223131, 1, 0.6235294, 0, 1,
-1.184212, 1.139524, -2.82166, 1, 0.6313726, 0, 1,
-1.174193, 1.136096, -1.54288, 1, 0.6352941, 0, 1,
-1.17294, 1.178283, -0.9947069, 1, 0.6431373, 0, 1,
-1.162822, 0.2391942, -0.390159, 1, 0.6470588, 0, 1,
-1.154654, -0.3421486, -1.641817, 1, 0.654902, 0, 1,
-1.146052, -1.688548, -2.167207, 1, 0.6588235, 0, 1,
-1.142164, 0.5007542, -0.1616673, 1, 0.6666667, 0, 1,
-1.139955, 1.339471, 1.472752, 1, 0.6705883, 0, 1,
-1.134825, -2.423471, -1.113645, 1, 0.6784314, 0, 1,
-1.130426, 0.3122648, -1.087024, 1, 0.682353, 0, 1,
-1.129829, -0.5826595, -1.691886, 1, 0.6901961, 0, 1,
-1.129797, 0.1587243, -1.720993, 1, 0.6941177, 0, 1,
-1.122073, -0.1473351, -2.577497, 1, 0.7019608, 0, 1,
-1.114015, -0.6034805, -2.03969, 1, 0.7098039, 0, 1,
-1.110657, -0.7750433, -1.115731, 1, 0.7137255, 0, 1,
-1.110627, -1.027253, -0.195885, 1, 0.7215686, 0, 1,
-1.104882, 1.211984, -2.329586, 1, 0.7254902, 0, 1,
-1.103315, -0.3085663, -1.603631, 1, 0.7333333, 0, 1,
-1.085183, 1.779153, 0.5973912, 1, 0.7372549, 0, 1,
-1.081722, 0.5017378, -1.392577, 1, 0.7450981, 0, 1,
-1.078651, -0.2351578, -0.7916373, 1, 0.7490196, 0, 1,
-1.074731, -0.2171775, -0.8066633, 1, 0.7568628, 0, 1,
-1.070585, -0.2502408, -4.677455, 1, 0.7607843, 0, 1,
-1.069927, -0.1649111, -1.256486, 1, 0.7686275, 0, 1,
-1.067067, 0.178789, -0.779116, 1, 0.772549, 0, 1,
-1.063131, -1.031678, -2.144093, 1, 0.7803922, 0, 1,
-1.061163, -0.9934248, -2.024577, 1, 0.7843137, 0, 1,
-1.059548, 1.113389, -0.1001989, 1, 0.7921569, 0, 1,
-1.055631, 0.6501756, -1.299559, 1, 0.7960784, 0, 1,
-1.04892, 1.384719, -1.343211, 1, 0.8039216, 0, 1,
-1.045988, -0.6033925, 0.1135403, 1, 0.8117647, 0, 1,
-1.044868, 0.966676, 0.9670873, 1, 0.8156863, 0, 1,
-1.040143, -0.4153791, -2.574242, 1, 0.8235294, 0, 1,
-1.037517, -0.9097012, -2.651786, 1, 0.827451, 0, 1,
-1.033281, 1.468731, -0.5362521, 1, 0.8352941, 0, 1,
-1.030748, -0.003344605, -2.057908, 1, 0.8392157, 0, 1,
-1.02532, 0.4735376, -1.153656, 1, 0.8470588, 0, 1,
-1.024664, 0.522015, -1.005259, 1, 0.8509804, 0, 1,
-1.02369, -0.4392734, -3.685775, 1, 0.8588235, 0, 1,
-1.01583, 1.680918, -0.8385593, 1, 0.8627451, 0, 1,
-1.013241, -0.9233568, -1.148429, 1, 0.8705882, 0, 1,
-1.013125, -1.147051, -3.941562, 1, 0.8745098, 0, 1,
-1.011892, 1.267509, -1.198809, 1, 0.8823529, 0, 1,
-1.009273, -0.01816776, -2.1662, 1, 0.8862745, 0, 1,
-1.007931, 0.2930912, 0.03163945, 1, 0.8941177, 0, 1,
-1.001053, -0.8809223, -3.009098, 1, 0.8980392, 0, 1,
-0.9949886, -0.3977171, -3.2833, 1, 0.9058824, 0, 1,
-0.9897876, 0.2940337, -1.410901, 1, 0.9137255, 0, 1,
-0.9879307, 1.241016, 0.18963, 1, 0.9176471, 0, 1,
-0.9871438, 0.1694376, -2.327434, 1, 0.9254902, 0, 1,
-0.9753516, -0.6001105, -1.287662, 1, 0.9294118, 0, 1,
-0.9738591, -0.04386906, -2.312039, 1, 0.9372549, 0, 1,
-0.9703372, -1.620503, -2.301018, 1, 0.9411765, 0, 1,
-0.9685367, 0.4125809, -1.407658, 1, 0.9490196, 0, 1,
-0.967418, -0.7113718, -1.660157, 1, 0.9529412, 0, 1,
-0.9557725, -1.790426, -2.13137, 1, 0.9607843, 0, 1,
-0.9536521, -1.079942, -1.936418, 1, 0.9647059, 0, 1,
-0.9460841, -0.7848116, -1.363294, 1, 0.972549, 0, 1,
-0.9452481, 0.8639051, -0.09350969, 1, 0.9764706, 0, 1,
-0.9401188, 1.093427, -0.1968653, 1, 0.9843137, 0, 1,
-0.9394193, -0.08171546, -1.000603, 1, 0.9882353, 0, 1,
-0.9353297, 0.1067252, -0.5076621, 1, 0.9960784, 0, 1,
-0.9244766, 0.3738025, -0.6663753, 0.9960784, 1, 0, 1,
-0.9239525, 0.1229939, -0.7415785, 0.9921569, 1, 0, 1,
-0.9146777, 0.526657, -0.9726705, 0.9843137, 1, 0, 1,
-0.9145947, 0.8486015, -0.6206096, 0.9803922, 1, 0, 1,
-0.9077227, 1.233503, -0.6251237, 0.972549, 1, 0, 1,
-0.9002611, 0.3566259, -1.973989, 0.9686275, 1, 0, 1,
-0.8983901, 0.7393861, -0.5769704, 0.9607843, 1, 0, 1,
-0.8976393, -0.5538336, -1.057134, 0.9568627, 1, 0, 1,
-0.8961935, -0.2371178, -1.430038, 0.9490196, 1, 0, 1,
-0.8942278, 0.8139207, -1.126122, 0.945098, 1, 0, 1,
-0.8909368, -1.157805, -3.049631, 0.9372549, 1, 0, 1,
-0.8901916, 0.1203238, -1.071156, 0.9333333, 1, 0, 1,
-0.8828673, -0.3255838, -1.269789, 0.9254902, 1, 0, 1,
-0.8762005, -1.763242, -3.603383, 0.9215686, 1, 0, 1,
-0.8756115, -0.4359349, -0.4878312, 0.9137255, 1, 0, 1,
-0.8754116, 0.2754937, -2.467623, 0.9098039, 1, 0, 1,
-0.8706229, -0.02891752, -1.061465, 0.9019608, 1, 0, 1,
-0.8693682, 0.5140781, -2.585279, 0.8941177, 1, 0, 1,
-0.867126, -0.415563, -3.680114, 0.8901961, 1, 0, 1,
-0.8647235, 1.50554, -1.847202, 0.8823529, 1, 0, 1,
-0.8603352, -0.3585093, -0.5969328, 0.8784314, 1, 0, 1,
-0.8556703, -0.9992032, -2.516027, 0.8705882, 1, 0, 1,
-0.8517183, -1.281785, -3.273893, 0.8666667, 1, 0, 1,
-0.8484972, 0.1249651, -0.07157873, 0.8588235, 1, 0, 1,
-0.8480903, 0.3165849, 0.3495696, 0.854902, 1, 0, 1,
-0.8456487, 0.758242, -0.7779263, 0.8470588, 1, 0, 1,
-0.8415576, -0.3769149, -2.73613, 0.8431373, 1, 0, 1,
-0.8372214, 0.3341853, -2.791225, 0.8352941, 1, 0, 1,
-0.8234684, -0.9723166, -1.08348, 0.8313726, 1, 0, 1,
-0.8226605, -0.08415504, -1.696595, 0.8235294, 1, 0, 1,
-0.8198302, -0.4165857, -2.183904, 0.8196079, 1, 0, 1,
-0.8144248, -0.08277182, -1.362319, 0.8117647, 1, 0, 1,
-0.8108706, -1.427285, -2.823022, 0.8078431, 1, 0, 1,
-0.8095073, 0.1697092, -1.027939, 0.8, 1, 0, 1,
-0.8083386, -0.07880333, -2.759121, 0.7921569, 1, 0, 1,
-0.8064775, -0.387524, -2.443298, 0.7882353, 1, 0, 1,
-0.8031446, 0.1468117, -2.250302, 0.7803922, 1, 0, 1,
-0.7959209, 0.3359598, -1.155225, 0.7764706, 1, 0, 1,
-0.7928842, 0.8580044, -0.237467, 0.7686275, 1, 0, 1,
-0.7910801, 1.691927, -1.174881, 0.7647059, 1, 0, 1,
-0.7874799, -0.001857769, -1.516786, 0.7568628, 1, 0, 1,
-0.7863754, 0.3764044, -1.894317, 0.7529412, 1, 0, 1,
-0.7862487, -0.6687139, -2.251673, 0.7450981, 1, 0, 1,
-0.7710399, -0.1983408, -0.6229097, 0.7411765, 1, 0, 1,
-0.7663413, -1.332053, -2.709519, 0.7333333, 1, 0, 1,
-0.7635536, 0.4791689, -1.766042, 0.7294118, 1, 0, 1,
-0.7594985, 0.5782285, -2.086422, 0.7215686, 1, 0, 1,
-0.7590162, -0.6018768, -2.814538, 0.7176471, 1, 0, 1,
-0.7577679, 0.4816269, -1.648341, 0.7098039, 1, 0, 1,
-0.7568401, -0.09537827, 0.1916603, 0.7058824, 1, 0, 1,
-0.7526866, -0.5328039, -1.460489, 0.6980392, 1, 0, 1,
-0.7519429, 2.153198, -0.8060743, 0.6901961, 1, 0, 1,
-0.7498305, 0.7228628, -0.2696663, 0.6862745, 1, 0, 1,
-0.7497663, -0.162554, -2.854887, 0.6784314, 1, 0, 1,
-0.7453035, 1.052048, 0.4723398, 0.6745098, 1, 0, 1,
-0.7430456, -1.417397, -4.056169, 0.6666667, 1, 0, 1,
-0.7398965, 0.8945854, -1.422072, 0.6627451, 1, 0, 1,
-0.7398009, -0.01007543, -1.635979, 0.654902, 1, 0, 1,
-0.7392971, -1.156452, -1.945366, 0.6509804, 1, 0, 1,
-0.7391738, 1.028771, -2.258594, 0.6431373, 1, 0, 1,
-0.7337225, 0.3349852, -2.168082, 0.6392157, 1, 0, 1,
-0.7334792, -2.233479, -1.846941, 0.6313726, 1, 0, 1,
-0.7270571, -0.6056865, -1.560181, 0.627451, 1, 0, 1,
-0.7211081, 0.1162115, -1.616943, 0.6196079, 1, 0, 1,
-0.7191969, -0.1684454, -1.409888, 0.6156863, 1, 0, 1,
-0.7175503, 0.1711307, -4.092282, 0.6078432, 1, 0, 1,
-0.7146879, -0.8845609, -2.427407, 0.6039216, 1, 0, 1,
-0.7097836, 0.4447476, -0.336051, 0.5960785, 1, 0, 1,
-0.7067626, -0.1231342, -1.343273, 0.5882353, 1, 0, 1,
-0.703792, -0.03097107, -1.14372, 0.5843138, 1, 0, 1,
-0.6990468, -0.1000144, -0.921353, 0.5764706, 1, 0, 1,
-0.6990185, -0.2238608, -1.813981, 0.572549, 1, 0, 1,
-0.697732, -0.36983, -2.198478, 0.5647059, 1, 0, 1,
-0.6955699, -1.141846, -3.164861, 0.5607843, 1, 0, 1,
-0.6928335, 0.9751892, -2.194372, 0.5529412, 1, 0, 1,
-0.6920904, -2.096937, -3.899962, 0.5490196, 1, 0, 1,
-0.6863713, -2.034326, -2.055639, 0.5411765, 1, 0, 1,
-0.682313, -0.6492302, -2.142328, 0.5372549, 1, 0, 1,
-0.6805914, -0.7403795, -2.604206, 0.5294118, 1, 0, 1,
-0.6787283, 0.6592104, -1.306053, 0.5254902, 1, 0, 1,
-0.6773911, 0.8527452, -0.1518243, 0.5176471, 1, 0, 1,
-0.6750826, 0.1271041, -0.06348975, 0.5137255, 1, 0, 1,
-0.6747075, -0.8951126, -4.170951, 0.5058824, 1, 0, 1,
-0.674534, 0.2870252, -1.278691, 0.5019608, 1, 0, 1,
-0.6643054, 0.5411836, -2.084456, 0.4941176, 1, 0, 1,
-0.6601086, -1.182016, -2.838333, 0.4862745, 1, 0, 1,
-0.6575477, 1.393246, 0.01412258, 0.4823529, 1, 0, 1,
-0.6556777, 1.775715, -1.724923, 0.4745098, 1, 0, 1,
-0.6556314, 0.3153631, -3.053452, 0.4705882, 1, 0, 1,
-0.6508262, -0.3700583, -1.175583, 0.4627451, 1, 0, 1,
-0.6466141, -0.2433328, -3.965152, 0.4588235, 1, 0, 1,
-0.64361, -0.7837299, -2.088899, 0.4509804, 1, 0, 1,
-0.643223, 0.8577817, -0.3031587, 0.4470588, 1, 0, 1,
-0.6408844, 0.3368664, -1.220544, 0.4392157, 1, 0, 1,
-0.6372509, 0.231777, -2.308764, 0.4352941, 1, 0, 1,
-0.6352234, -0.2780839, -1.390604, 0.427451, 1, 0, 1,
-0.6351137, -2.812087, -3.708325, 0.4235294, 1, 0, 1,
-0.6197463, 1.964214, -1.688862, 0.4156863, 1, 0, 1,
-0.6174404, 1.039864, -1.332151, 0.4117647, 1, 0, 1,
-0.6159754, -0.5197272, -2.436856, 0.4039216, 1, 0, 1,
-0.6106103, -0.2585712, -1.0268, 0.3960784, 1, 0, 1,
-0.6058457, 0.4518468, -4.159973, 0.3921569, 1, 0, 1,
-0.6033258, -1.270341, -1.747088, 0.3843137, 1, 0, 1,
-0.5969253, 0.01874067, -1.400751, 0.3803922, 1, 0, 1,
-0.591861, 1.403289, 0.2290399, 0.372549, 1, 0, 1,
-0.5914022, 0.6023279, -1.791428, 0.3686275, 1, 0, 1,
-0.5908937, 1.470237, -0.2292341, 0.3607843, 1, 0, 1,
-0.5874156, -0.109576, -2.704139, 0.3568628, 1, 0, 1,
-0.5857818, -0.2433887, -3.342957, 0.3490196, 1, 0, 1,
-0.5854846, -1.290098, -5.203697, 0.345098, 1, 0, 1,
-0.5822928, -0.5138032, -4.030272, 0.3372549, 1, 0, 1,
-0.5785943, 1.006178, -1.409316, 0.3333333, 1, 0, 1,
-0.5770736, 1.260585, -0.04692374, 0.3254902, 1, 0, 1,
-0.575926, 0.5846081, -2.961712, 0.3215686, 1, 0, 1,
-0.5741092, 1.005493, 0.3721528, 0.3137255, 1, 0, 1,
-0.5725855, 0.8316282, -1.283513, 0.3098039, 1, 0, 1,
-0.5688854, 0.5540407, 1.041147, 0.3019608, 1, 0, 1,
-0.5680953, 0.2832983, -0.4525507, 0.2941177, 1, 0, 1,
-0.5668783, -2.378325, -2.446653, 0.2901961, 1, 0, 1,
-0.5647286, 1.44632, 0.5005932, 0.282353, 1, 0, 1,
-0.5560414, -0.5520453, -1.13045, 0.2784314, 1, 0, 1,
-0.5559292, 1.152322, -0.8303965, 0.2705882, 1, 0, 1,
-0.5495548, 0.3961296, -1.229638, 0.2666667, 1, 0, 1,
-0.5433161, 0.2321088, -0.6354162, 0.2588235, 1, 0, 1,
-0.5423858, -0.005437536, -2.307563, 0.254902, 1, 0, 1,
-0.5380054, 1.922265, -0.1143846, 0.2470588, 1, 0, 1,
-0.5377508, -0.8492385, 0.7797019, 0.2431373, 1, 0, 1,
-0.537577, 1.061894, -0.3560688, 0.2352941, 1, 0, 1,
-0.5371779, -0.4148313, -2.809957, 0.2313726, 1, 0, 1,
-0.5359462, 0.6876499, -0.2548667, 0.2235294, 1, 0, 1,
-0.534512, -0.2030034, -1.001854, 0.2196078, 1, 0, 1,
-0.534381, 0.08166586, -1.132913, 0.2117647, 1, 0, 1,
-0.533946, -0.9257085, -2.241981, 0.2078431, 1, 0, 1,
-0.5332727, 1.579531, -0.4331713, 0.2, 1, 0, 1,
-0.53291, 0.01587179, -1.867135, 0.1921569, 1, 0, 1,
-0.531166, 1.13438, -0.7411646, 0.1882353, 1, 0, 1,
-0.5253181, 1.229249, -1.475533, 0.1803922, 1, 0, 1,
-0.5224597, 1.355102, 0.1791631, 0.1764706, 1, 0, 1,
-0.5200264, -0.5650178, -2.212101, 0.1686275, 1, 0, 1,
-0.5141062, 0.1544247, -0.881579, 0.1647059, 1, 0, 1,
-0.5125617, -0.5623805, -1.512663, 0.1568628, 1, 0, 1,
-0.5082507, -0.347541, -3.212486, 0.1529412, 1, 0, 1,
-0.5044618, -0.145145, -2.806326, 0.145098, 1, 0, 1,
-0.5044091, -0.5820032, -3.182008, 0.1411765, 1, 0, 1,
-0.5007543, 0.5910866, 0.1023072, 0.1333333, 1, 0, 1,
-0.4940716, -0.6903325, -2.818194, 0.1294118, 1, 0, 1,
-0.4919813, -0.4006687, -0.9218022, 0.1215686, 1, 0, 1,
-0.4902669, -0.6240757, -3.307788, 0.1176471, 1, 0, 1,
-0.4888093, 0.6411566, 0.08421671, 0.1098039, 1, 0, 1,
-0.4860653, 1.157218, 0.5705727, 0.1058824, 1, 0, 1,
-0.4848168, -0.9625465, -4.20957, 0.09803922, 1, 0, 1,
-0.4845574, 0.4449439, 0.9273517, 0.09019608, 1, 0, 1,
-0.4839617, 0.7109823, 0.3245786, 0.08627451, 1, 0, 1,
-0.4825331, 1.240486, -0.1134635, 0.07843138, 1, 0, 1,
-0.4820914, -0.934375, -2.087722, 0.07450981, 1, 0, 1,
-0.4707592, -0.4487025, -2.136003, 0.06666667, 1, 0, 1,
-0.4676141, 1.33524, -1.120617, 0.0627451, 1, 0, 1,
-0.4646356, -0.006854054, -2.731471, 0.05490196, 1, 0, 1,
-0.4627803, -0.9048668, -2.758096, 0.05098039, 1, 0, 1,
-0.4600937, 0.1720565, -0.05293701, 0.04313726, 1, 0, 1,
-0.4523906, -0.6169903, -1.708648, 0.03921569, 1, 0, 1,
-0.4482803, -2.594335, -2.890398, 0.03137255, 1, 0, 1,
-0.4474758, 1.346089, -0.4467117, 0.02745098, 1, 0, 1,
-0.446695, 0.2824113, 0.5564721, 0.01960784, 1, 0, 1,
-0.4453839, 0.9938173, -1.235879, 0.01568628, 1, 0, 1,
-0.4399026, -1.639408, -2.125434, 0.007843138, 1, 0, 1,
-0.4397691, 0.04683711, -0.3584585, 0.003921569, 1, 0, 1,
-0.434666, 1.216515, 1.182307, 0, 1, 0.003921569, 1,
-0.4312711, -0.6205418, -2.107871, 0, 1, 0.01176471, 1,
-0.4281246, -1.802368, -0.07931126, 0, 1, 0.01568628, 1,
-0.4247004, -0.4537248, -1.453936, 0, 1, 0.02352941, 1,
-0.4246616, -0.04623385, -1.699394, 0, 1, 0.02745098, 1,
-0.4234765, 0.2419073, -1.515329, 0, 1, 0.03529412, 1,
-0.4205855, 2.156143, 0.504465, 0, 1, 0.03921569, 1,
-0.4202841, 1.219845, -1.812647, 0, 1, 0.04705882, 1,
-0.4188028, -0.5142311, -1.87881, 0, 1, 0.05098039, 1,
-0.4130193, 0.2789601, -1.800911, 0, 1, 0.05882353, 1,
-0.4114592, -0.5412005, -1.699922, 0, 1, 0.0627451, 1,
-0.4058649, 0.330579, 0.07449926, 0, 1, 0.07058824, 1,
-0.4003887, -0.6638485, -0.9973713, 0, 1, 0.07450981, 1,
-0.3987302, -0.6288319, -2.633905, 0, 1, 0.08235294, 1,
-0.3970498, 0.4386759, -0.1038135, 0, 1, 0.08627451, 1,
-0.396499, 0.6638733, -0.8748204, 0, 1, 0.09411765, 1,
-0.3857606, -0.6573588, -1.910267, 0, 1, 0.1019608, 1,
-0.3835526, -0.6376262, -2.754599, 0, 1, 0.1058824, 1,
-0.3820271, -0.9527321, -1.469105, 0, 1, 0.1137255, 1,
-0.378945, 0.3612736, -1.223951, 0, 1, 0.1176471, 1,
-0.3751844, 0.2648092, 0.8122188, 0, 1, 0.1254902, 1,
-0.3749617, 1.764395, 0.8708862, 0, 1, 0.1294118, 1,
-0.3713492, -1.430369, -3.703096, 0, 1, 0.1372549, 1,
-0.3686998, -0.9152535, -3.294581, 0, 1, 0.1411765, 1,
-0.361405, -0.8603139, -3.247618, 0, 1, 0.1490196, 1,
-0.3602558, 0.4565264, 0.8681946, 0, 1, 0.1529412, 1,
-0.3563785, -1.137963, -3.030678, 0, 1, 0.1607843, 1,
-0.3555448, -0.7656547, -3.014057, 0, 1, 0.1647059, 1,
-0.3552116, 0.00889059, -1.194503, 0, 1, 0.172549, 1,
-0.3526997, -0.02753904, -0.7586772, 0, 1, 0.1764706, 1,
-0.3513582, -0.3370939, -3.147809, 0, 1, 0.1843137, 1,
-0.347062, -1.608645, -1.524106, 0, 1, 0.1882353, 1,
-0.3468633, 0.1786125, -1.296578, 0, 1, 0.1960784, 1,
-0.3463646, -0.4297682, -2.649914, 0, 1, 0.2039216, 1,
-0.3456806, 0.08819879, -2.793399, 0, 1, 0.2078431, 1,
-0.3427014, -0.4783044, -2.488995, 0, 1, 0.2156863, 1,
-0.3338955, -2.067237, -2.20398, 0, 1, 0.2196078, 1,
-0.3310662, -0.3057341, -2.903699, 0, 1, 0.227451, 1,
-0.3310591, -0.0776505, -1.509518, 0, 1, 0.2313726, 1,
-0.3309785, -0.4481331, -1.075715, 0, 1, 0.2392157, 1,
-0.3286826, 0.01269477, -1.677678, 0, 1, 0.2431373, 1,
-0.3251087, -0.9645437, -4.005813, 0, 1, 0.2509804, 1,
-0.3242487, 1.699142, -0.2008814, 0, 1, 0.254902, 1,
-0.3198791, -0.5216638, -3.423383, 0, 1, 0.2627451, 1,
-0.3141876, -2.215307, -2.836577, 0, 1, 0.2666667, 1,
-0.3131875, -2.144967, -3.500667, 0, 1, 0.2745098, 1,
-0.312171, -2.477202, -4.309615, 0, 1, 0.2784314, 1,
-0.3108353, -0.7144563, -1.464843, 0, 1, 0.2862745, 1,
-0.3092062, 0.36545, -0.4157025, 0, 1, 0.2901961, 1,
-0.3027251, 0.6348003, 0.8383242, 0, 1, 0.2980392, 1,
-0.3002593, 2.504594, 2.308905, 0, 1, 0.3058824, 1,
-0.2990629, 0.9769335, -0.9842059, 0, 1, 0.3098039, 1,
-0.2922908, 0.678389, -0.3491247, 0, 1, 0.3176471, 1,
-0.2921199, 1.562085, -0.1113506, 0, 1, 0.3215686, 1,
-0.2910258, -0.004821541, 0.2348901, 0, 1, 0.3294118, 1,
-0.2890414, -1.010674, -4.254886, 0, 1, 0.3333333, 1,
-0.2851212, -0.05858909, -1.378334, 0, 1, 0.3411765, 1,
-0.2842065, 0.3485083, -0.372786, 0, 1, 0.345098, 1,
-0.2832868, 0.9661207, -0.4778826, 0, 1, 0.3529412, 1,
-0.2797002, 0.7534271, -0.1035714, 0, 1, 0.3568628, 1,
-0.278803, -0.5941818, -2.278334, 0, 1, 0.3647059, 1,
-0.273842, -0.2636656, -0.6909013, 0, 1, 0.3686275, 1,
-0.272807, 1.220431, 0.653722, 0, 1, 0.3764706, 1,
-0.2721969, -0.7612813, -3.588816, 0, 1, 0.3803922, 1,
-0.2716717, 1.607559, -0.5346925, 0, 1, 0.3882353, 1,
-0.2668737, 1.294042, -0.8034766, 0, 1, 0.3921569, 1,
-0.2668357, 2.047879, 1.118375, 0, 1, 0.4, 1,
-0.2667862, -0.765827, -1.552331, 0, 1, 0.4078431, 1,
-0.2658263, 0.6098667, -0.895719, 0, 1, 0.4117647, 1,
-0.2650238, 0.5175682, -1.706662, 0, 1, 0.4196078, 1,
-0.2584239, 0.03047374, -1.909526, 0, 1, 0.4235294, 1,
-0.2527992, -1.325558, -3.528971, 0, 1, 0.4313726, 1,
-0.2493183, -0.6400305, -1.622873, 0, 1, 0.4352941, 1,
-0.2478364, 0.2953267, -1.8504, 0, 1, 0.4431373, 1,
-0.2471141, 1.383738, 1.14022, 0, 1, 0.4470588, 1,
-0.2447471, 1.303413, -0.8769759, 0, 1, 0.454902, 1,
-0.2422121, -0.5665017, -3.68509, 0, 1, 0.4588235, 1,
-0.2382534, 0.2886048, -0.6084842, 0, 1, 0.4666667, 1,
-0.2376088, 0.6673245, 1.264283, 0, 1, 0.4705882, 1,
-0.2325395, -0.84649, -3.626019, 0, 1, 0.4784314, 1,
-0.2307969, -0.4159999, -2.220177, 0, 1, 0.4823529, 1,
-0.2237464, -1.989793, -4.830486, 0, 1, 0.4901961, 1,
-0.2196166, -0.6439488, -2.363892, 0, 1, 0.4941176, 1,
-0.2171382, -1.062498, -2.649778, 0, 1, 0.5019608, 1,
-0.2158236, -0.3046136, -3.473968, 0, 1, 0.509804, 1,
-0.2138891, 0.1888234, -2.398896, 0, 1, 0.5137255, 1,
-0.2134498, -1.830042, -3.34985, 0, 1, 0.5215687, 1,
-0.2118309, 1.267151, -0.04494306, 0, 1, 0.5254902, 1,
-0.2095253, 0.5591116, -2.113858, 0, 1, 0.5333334, 1,
-0.2044389, 0.144343, 0.5645974, 0, 1, 0.5372549, 1,
-0.2022268, -0.00733182, -1.081528, 0, 1, 0.5450981, 1,
-0.2019746, -1.75905, -2.242704, 0, 1, 0.5490196, 1,
-0.2015953, -0.2084087, -1.808503, 0, 1, 0.5568628, 1,
-0.2008035, 0.6981568, -0.2958623, 0, 1, 0.5607843, 1,
-0.1963544, 1.707872, -0.9127635, 0, 1, 0.5686275, 1,
-0.1914221, 0.5131338, 0.2731609, 0, 1, 0.572549, 1,
-0.1899393, -0.3307265, -1.501775, 0, 1, 0.5803922, 1,
-0.1895533, 0.99137, -0.7322795, 0, 1, 0.5843138, 1,
-0.1891918, -0.2112628, -1.38121, 0, 1, 0.5921569, 1,
-0.1873756, 1.16053, -0.08770271, 0, 1, 0.5960785, 1,
-0.1855325, 0.08302955, -0.3583822, 0, 1, 0.6039216, 1,
-0.1761644, 1.02243, -1.26863, 0, 1, 0.6117647, 1,
-0.1747577, 0.5947969, -0.2860506, 0, 1, 0.6156863, 1,
-0.1731664, -1.004653, -3.330418, 0, 1, 0.6235294, 1,
-0.1725925, 0.2628854, -0.3831142, 0, 1, 0.627451, 1,
-0.1724985, 0.5151508, -0.145743, 0, 1, 0.6352941, 1,
-0.1716177, 0.08252958, -2.483431, 0, 1, 0.6392157, 1,
-0.1710428, -1.650241, -2.392628, 0, 1, 0.6470588, 1,
-0.1626147, 1.022214, 1.414827, 0, 1, 0.6509804, 1,
-0.1623697, -0.3203154, -3.149516, 0, 1, 0.6588235, 1,
-0.1596543, -0.3592856, -0.4188216, 0, 1, 0.6627451, 1,
-0.1552484, -0.1528086, -2.50334, 0, 1, 0.6705883, 1,
-0.1509756, 0.6798695, -0.9849593, 0, 1, 0.6745098, 1,
-0.1466121, 0.7671753, -0.9443446, 0, 1, 0.682353, 1,
-0.1443205, -1.153303, -2.955717, 0, 1, 0.6862745, 1,
-0.1428819, -1.264545, -3.099006, 0, 1, 0.6941177, 1,
-0.1392949, -1.177723, -4.169884, 0, 1, 0.7019608, 1,
-0.1377254, -1.049443, -2.734427, 0, 1, 0.7058824, 1,
-0.1366, 0.7907583, 1.753581, 0, 1, 0.7137255, 1,
-0.1360493, 0.2073178, -2.290248, 0, 1, 0.7176471, 1,
-0.134175, 0.1425541, 0.107705, 0, 1, 0.7254902, 1,
-0.1332613, 1.688277, 1.648112, 0, 1, 0.7294118, 1,
-0.1309668, -0.4598533, -4.410873, 0, 1, 0.7372549, 1,
-0.1297928, -0.4367256, -3.276322, 0, 1, 0.7411765, 1,
-0.1282297, -1.038031, -1.772579, 0, 1, 0.7490196, 1,
-0.127008, -0.6801597, -3.698925, 0, 1, 0.7529412, 1,
-0.1239231, -0.4046501, -2.651372, 0, 1, 0.7607843, 1,
-0.1221354, -0.5801331, -2.786204, 0, 1, 0.7647059, 1,
-0.1201746, 0.8227509, -0.07369559, 0, 1, 0.772549, 1,
-0.1197455, -0.4672269, -2.993558, 0, 1, 0.7764706, 1,
-0.1192248, 1.078482, -0.571364, 0, 1, 0.7843137, 1,
-0.1116612, -0.1763738, -2.779991, 0, 1, 0.7882353, 1,
-0.1108275, 0.4027237, -0.4827197, 0, 1, 0.7960784, 1,
-0.1101366, 0.1280985, -0.2166987, 0, 1, 0.8039216, 1,
-0.1087302, -0.4523085, -4.739216, 0, 1, 0.8078431, 1,
-0.1082483, -0.5469353, -1.685458, 0, 1, 0.8156863, 1,
-0.1069624, 1.353591, 1.695127, 0, 1, 0.8196079, 1,
-0.09598394, -1.920402, -3.490509, 0, 1, 0.827451, 1,
-0.09421916, 1.142014, 0.05872005, 0, 1, 0.8313726, 1,
-0.08756259, -0.06650484, -2.865074, 0, 1, 0.8392157, 1,
-0.08525345, -0.1071026, -2.165245, 0, 1, 0.8431373, 1,
-0.08272804, 1.858222, 2.575301, 0, 1, 0.8509804, 1,
-0.07664528, -2.512022, -3.32498, 0, 1, 0.854902, 1,
-0.07440028, -0.2656076, -3.022547, 0, 1, 0.8627451, 1,
-0.07339284, 0.2796848, -1.959936, 0, 1, 0.8666667, 1,
-0.06818421, -0.06101956, -2.22083, 0, 1, 0.8745098, 1,
-0.0670268, -0.5446318, -3.415796, 0, 1, 0.8784314, 1,
-0.06611713, -0.7721611, -3.580027, 0, 1, 0.8862745, 1,
-0.0643028, 1.636455, -0.8712319, 0, 1, 0.8901961, 1,
-0.05994953, 0.7669631, -0.2461773, 0, 1, 0.8980392, 1,
-0.05748434, -0.6862116, -2.821506, 0, 1, 0.9058824, 1,
-0.0554142, 0.5235237, 1.432774, 0, 1, 0.9098039, 1,
-0.0552236, 0.1915218, -0.4395753, 0, 1, 0.9176471, 1,
-0.05198057, 0.8051381, 0.1768112, 0, 1, 0.9215686, 1,
-0.04711936, 2.467391, 0.5763711, 0, 1, 0.9294118, 1,
-0.0454916, 0.8668226, 0.07771192, 0, 1, 0.9333333, 1,
-0.04536297, -1.207988, -5.560034, 0, 1, 0.9411765, 1,
-0.04534579, 0.3802736, 0.2631965, 0, 1, 0.945098, 1,
-0.04234145, -0.009905373, -2.297071, 0, 1, 0.9529412, 1,
-0.03997643, -0.508998, -3.105558, 0, 1, 0.9568627, 1,
-0.03907818, 1.332823, 1.459079, 0, 1, 0.9647059, 1,
-0.03572262, -0.2874365, -4.243943, 0, 1, 0.9686275, 1,
-0.03179526, -1.088655, -3.371791, 0, 1, 0.9764706, 1,
-0.02750276, -1.249179, -3.721086, 0, 1, 0.9803922, 1,
-0.02450258, 1.311542, 0.1401275, 0, 1, 0.9882353, 1,
-0.02429512, -0.561599, -2.990734, 0, 1, 0.9921569, 1,
-0.02289832, 1.966313, 1.242087, 0, 1, 1, 1,
-0.02022696, 0.864881, 0.9102264, 0, 0.9921569, 1, 1,
-0.01856617, 0.1576916, 1.33875, 0, 0.9882353, 1, 1,
-0.01635838, 1.996857, 1.395891, 0, 0.9803922, 1, 1,
-0.01413443, -1.113459, -4.104327, 0, 0.9764706, 1, 1,
-0.01368907, 1.20714, 1.034265, 0, 0.9686275, 1, 1,
-0.005901925, 1.027674, -1.810439, 0, 0.9647059, 1, 1,
-0.005822346, 1.380079, -0.055742, 0, 0.9568627, 1, 1,
0.01844384, -1.895393, 4.837136, 0, 0.9529412, 1, 1,
0.02312803, -0.7456151, 2.285077, 0, 0.945098, 1, 1,
0.02328965, 0.1307147, -1.761835, 0, 0.9411765, 1, 1,
0.03216473, -0.9682782, 2.242701, 0, 0.9333333, 1, 1,
0.03338334, -0.940621, 3.200216, 0, 0.9294118, 1, 1,
0.04470849, 0.7091694, 0.942898, 0, 0.9215686, 1, 1,
0.04964699, 0.6967409, -0.8399666, 0, 0.9176471, 1, 1,
0.05088226, 0.1752452, -0.8122084, 0, 0.9098039, 1, 1,
0.05325468, -0.3535626, 4.046976, 0, 0.9058824, 1, 1,
0.05389878, 0.7757037, 1.841538, 0, 0.8980392, 1, 1,
0.05543325, -0.4500413, 5.426331, 0, 0.8901961, 1, 1,
0.05631406, -0.2428736, 5.545089, 0, 0.8862745, 1, 1,
0.05801442, -0.07664485, 2.567346, 0, 0.8784314, 1, 1,
0.06233605, -0.5685754, 3.181758, 0, 0.8745098, 1, 1,
0.06479973, -1.396884, 3.182455, 0, 0.8666667, 1, 1,
0.06640624, -0.2007926, 2.734392, 0, 0.8627451, 1, 1,
0.06931082, -0.756143, 3.347283, 0, 0.854902, 1, 1,
0.07067784, 1.169228, -0.2685399, 0, 0.8509804, 1, 1,
0.07110849, -0.8531312, 2.934886, 0, 0.8431373, 1, 1,
0.07210425, -0.9169586, 2.481043, 0, 0.8392157, 1, 1,
0.07233626, -1.638158, 3.749825, 0, 0.8313726, 1, 1,
0.07617582, 2.780395, -0.3479626, 0, 0.827451, 1, 1,
0.07799125, 0.7112433, -2.200869, 0, 0.8196079, 1, 1,
0.07822917, 1.189622, 0.5107664, 0, 0.8156863, 1, 1,
0.08428665, -0.07468931, 4.167234, 0, 0.8078431, 1, 1,
0.08879182, -1.863973, 3.190546, 0, 0.8039216, 1, 1,
0.09215846, 0.6604805, -0.8869489, 0, 0.7960784, 1, 1,
0.09998807, 0.1965746, 0.3657129, 0, 0.7882353, 1, 1,
0.1077716, 0.04540783, -0.9395995, 0, 0.7843137, 1, 1,
0.115752, -0.5930713, 3.62694, 0, 0.7764706, 1, 1,
0.1184436, 0.6029172, 0.682543, 0, 0.772549, 1, 1,
0.1292681, 1.225544, 0.4586087, 0, 0.7647059, 1, 1,
0.1330016, -0.1695758, 2.822593, 0, 0.7607843, 1, 1,
0.1334755, -0.7833557, 4.360771, 0, 0.7529412, 1, 1,
0.1346196, 0.7437486, 1.229945, 0, 0.7490196, 1, 1,
0.1349709, 0.9928716, 1.877766, 0, 0.7411765, 1, 1,
0.1471963, -0.9775461, 2.647899, 0, 0.7372549, 1, 1,
0.1549483, -1.68925, 2.983586, 0, 0.7294118, 1, 1,
0.1581458, -0.1057809, 1.286463, 0, 0.7254902, 1, 1,
0.1601813, -0.9143224, 2.873734, 0, 0.7176471, 1, 1,
0.1664545, 0.5507869, 0.2658975, 0, 0.7137255, 1, 1,
0.1699882, -0.4153984, 1.466158, 0, 0.7058824, 1, 1,
0.1706039, -1.705457, 1.994581, 0, 0.6980392, 1, 1,
0.1751412, 0.529968, 1.316383, 0, 0.6941177, 1, 1,
0.1763852, -0.4757551, 2.029229, 0, 0.6862745, 1, 1,
0.1828763, 0.07192937, 2.086857, 0, 0.682353, 1, 1,
0.1842536, 0.7425706, 0.870129, 0, 0.6745098, 1, 1,
0.1867914, -0.06865166, 2.659888, 0, 0.6705883, 1, 1,
0.1878764, 0.3130077, 1.193162, 0, 0.6627451, 1, 1,
0.1881177, 0.1122433, 2.184574, 0, 0.6588235, 1, 1,
0.18835, 1.472213, 2.126936, 0, 0.6509804, 1, 1,
0.1919244, -1.495354, 4.056592, 0, 0.6470588, 1, 1,
0.1931027, 0.841282, -0.3664152, 0, 0.6392157, 1, 1,
0.1957701, -0.5300218, 1.788056, 0, 0.6352941, 1, 1,
0.1989487, 0.350859, 1.679104, 0, 0.627451, 1, 1,
0.2003734, 0.06406838, 1.744866, 0, 0.6235294, 1, 1,
0.2017289, 0.01779048, 1.095442, 0, 0.6156863, 1, 1,
0.2035911, 0.9981859, -2.071541, 0, 0.6117647, 1, 1,
0.2049735, 2.158351, -1.559521, 0, 0.6039216, 1, 1,
0.2111751, 1.260726, 1.543485, 0, 0.5960785, 1, 1,
0.2125964, 0.1277422, 2.073195, 0, 0.5921569, 1, 1,
0.2148897, 0.5050803, -0.5701797, 0, 0.5843138, 1, 1,
0.2192645, 0.5355331, -0.7392265, 0, 0.5803922, 1, 1,
0.2229609, 0.6751274, 0.4135853, 0, 0.572549, 1, 1,
0.2235459, -0.7748327, 2.477782, 0, 0.5686275, 1, 1,
0.2255574, -0.1594506, 3.053383, 0, 0.5607843, 1, 1,
0.2332681, 0.6270712, 0.6570903, 0, 0.5568628, 1, 1,
0.2347276, -0.5122355, 3.720212, 0, 0.5490196, 1, 1,
0.2416037, 0.6243007, 1.938799, 0, 0.5450981, 1, 1,
0.2431362, 1.12268, 0.9414587, 0, 0.5372549, 1, 1,
0.2480814, -0.782856, 1.882535, 0, 0.5333334, 1, 1,
0.2493565, 0.5783926, 1.53037, 0, 0.5254902, 1, 1,
0.2518856, 0.3411123, 0.08106293, 0, 0.5215687, 1, 1,
0.2522933, -1.71101, 3.775584, 0, 0.5137255, 1, 1,
0.2561938, -0.2024366, 2.713708, 0, 0.509804, 1, 1,
0.2595755, 0.5395275, 1.24426, 0, 0.5019608, 1, 1,
0.2630775, 0.1220667, 2.303683, 0, 0.4941176, 1, 1,
0.2646104, -1.696272, 3.072052, 0, 0.4901961, 1, 1,
0.2649641, -1.496597, 1.451208, 0, 0.4823529, 1, 1,
0.2745142, -0.995413, 3.793371, 0, 0.4784314, 1, 1,
0.2755608, 0.1425924, 0.5949274, 0, 0.4705882, 1, 1,
0.2765202, -1.394782, 3.794962, 0, 0.4666667, 1, 1,
0.2765233, -0.2481411, 1.863236, 0, 0.4588235, 1, 1,
0.2796003, -0.44313, 3.230563, 0, 0.454902, 1, 1,
0.2807131, 1.973541, -0.1158662, 0, 0.4470588, 1, 1,
0.2828873, -2.37551, 1.711139, 0, 0.4431373, 1, 1,
0.283257, 1.477182, -0.4976561, 0, 0.4352941, 1, 1,
0.2859222, 0.7905106, -1.253646, 0, 0.4313726, 1, 1,
0.2879183, 0.6906909, 1.084338, 0, 0.4235294, 1, 1,
0.2880001, 0.282721, 0.5866967, 0, 0.4196078, 1, 1,
0.2889879, 0.8800578, -0.7178445, 0, 0.4117647, 1, 1,
0.2892949, -0.1239718, 2.623974, 0, 0.4078431, 1, 1,
0.2903756, 1.586803, -0.8217768, 0, 0.4, 1, 1,
0.294668, -0.3678129, 3.155023, 0, 0.3921569, 1, 1,
0.2962526, 0.6278706, -2.205298, 0, 0.3882353, 1, 1,
0.2985144, -1.11492, 2.505237, 0, 0.3803922, 1, 1,
0.2992508, -0.6572921, 3.125714, 0, 0.3764706, 1, 1,
0.3017486, 0.008967232, 3.071088, 0, 0.3686275, 1, 1,
0.3057432, -0.2968664, 2.724014, 0, 0.3647059, 1, 1,
0.3077474, 0.3609228, 1.025488, 0, 0.3568628, 1, 1,
0.3082688, 0.7620369, -1.369341, 0, 0.3529412, 1, 1,
0.3086963, 0.4705682, -1.782535, 0, 0.345098, 1, 1,
0.3104091, 0.2321042, 1.66315, 0, 0.3411765, 1, 1,
0.3113613, -0.3259261, 1.744222, 0, 0.3333333, 1, 1,
0.3121323, -0.08239461, 1.163664, 0, 0.3294118, 1, 1,
0.3122456, -0.5862477, 2.296647, 0, 0.3215686, 1, 1,
0.3145274, -1.72727, 2.106472, 0, 0.3176471, 1, 1,
0.3145584, 1.110038, 1.809046, 0, 0.3098039, 1, 1,
0.315711, 0.3850886, -0.5349531, 0, 0.3058824, 1, 1,
0.3177194, -0.4968179, 1.743039, 0, 0.2980392, 1, 1,
0.3212417, 0.2860093, 0.7936157, 0, 0.2901961, 1, 1,
0.3234571, -0.567428, 2.957239, 0, 0.2862745, 1, 1,
0.3288584, 0.6608314, 1.651651, 0, 0.2784314, 1, 1,
0.3318281, 0.09117452, 1.564398, 0, 0.2745098, 1, 1,
0.3342583, 0.2426993, 0.3657933, 0, 0.2666667, 1, 1,
0.3372886, 1.041108, 0.5109323, 0, 0.2627451, 1, 1,
0.3398663, 0.780559, 2.276318, 0, 0.254902, 1, 1,
0.3399029, 0.9707546, 0.6492923, 0, 0.2509804, 1, 1,
0.3400882, -0.5142595, 2.89048, 0, 0.2431373, 1, 1,
0.3426659, 0.226493, 1.024424, 0, 0.2392157, 1, 1,
0.3436987, 0.182553, 0.6210942, 0, 0.2313726, 1, 1,
0.34553, -0.5189591, 2.998541, 0, 0.227451, 1, 1,
0.3458097, -1.546675, 2.885864, 0, 0.2196078, 1, 1,
0.3469867, 1.53195, 0.4280584, 0, 0.2156863, 1, 1,
0.349995, -0.1794735, 2.788573, 0, 0.2078431, 1, 1,
0.3552779, 1.000896, -0.3143319, 0, 0.2039216, 1, 1,
0.3562949, -0.02843223, 3.041043, 0, 0.1960784, 1, 1,
0.3573165, -0.6908156, 2.317875, 0, 0.1882353, 1, 1,
0.3617066, -1.200295, 1.055054, 0, 0.1843137, 1, 1,
0.3623935, -0.6871482, 2.467135, 0, 0.1764706, 1, 1,
0.3644696, -0.3190565, 2.392316, 0, 0.172549, 1, 1,
0.3672539, 1.386629, 0.9037149, 0, 0.1647059, 1, 1,
0.3700127, -0.8713384, 2.147388, 0, 0.1607843, 1, 1,
0.3717843, 1.303991, -0.0163219, 0, 0.1529412, 1, 1,
0.3770953, 0.753845, -1.395331, 0, 0.1490196, 1, 1,
0.3839545, 0.1125754, 0.5701652, 0, 0.1411765, 1, 1,
0.3875451, 0.3632441, 1.498578, 0, 0.1372549, 1, 1,
0.3876022, 0.1518745, 1.850539, 0, 0.1294118, 1, 1,
0.3963112, -1.028482, 3.205143, 0, 0.1254902, 1, 1,
0.3995588, -0.1553393, 2.1051, 0, 0.1176471, 1, 1,
0.4016624, -0.1696613, 1.177458, 0, 0.1137255, 1, 1,
0.4022829, -0.5009308, 1.931669, 0, 0.1058824, 1, 1,
0.4046727, -0.1269204, 2.764616, 0, 0.09803922, 1, 1,
0.4084453, -0.4463189, 3.271878, 0, 0.09411765, 1, 1,
0.4088795, 0.19391, 0.9134678, 0, 0.08627451, 1, 1,
0.4110881, -0.6134304, 1.540126, 0, 0.08235294, 1, 1,
0.4119019, 1.783781, 0.1402434, 0, 0.07450981, 1, 1,
0.416024, 0.8271465, 0.7446702, 0, 0.07058824, 1, 1,
0.419194, 0.6287995, 1.195248, 0, 0.0627451, 1, 1,
0.4198911, 0.2077953, 1.184372, 0, 0.05882353, 1, 1,
0.4222084, 0.9711991, -1.091001, 0, 0.05098039, 1, 1,
0.4266187, -0.03093651, -0.3342668, 0, 0.04705882, 1, 1,
0.4271233, -1.161404, 4.057633, 0, 0.03921569, 1, 1,
0.4274233, 1.181518, 1.876058, 0, 0.03529412, 1, 1,
0.4279014, -0.8608624, 1.117063, 0, 0.02745098, 1, 1,
0.4335924, -0.5476115, 3.912383, 0, 0.02352941, 1, 1,
0.437904, 0.400843, 2.157095, 0, 0.01568628, 1, 1,
0.4411227, 0.8694282, 2.185545, 0, 0.01176471, 1, 1,
0.4476526, -0.01671534, 1.509025, 0, 0.003921569, 1, 1,
0.448197, 0.03059368, -0.4513152, 0.003921569, 0, 1, 1,
0.4496726, -0.1471821, 0.1707375, 0.007843138, 0, 1, 1,
0.452239, 1.592995, 1.995698, 0.01568628, 0, 1, 1,
0.4558806, 1.36383, 1.899281, 0.01960784, 0, 1, 1,
0.4609112, -1.529284, 2.386175, 0.02745098, 0, 1, 1,
0.4635481, -0.9153579, 4.293598, 0.03137255, 0, 1, 1,
0.4677115, 0.170639, 1.626293, 0.03921569, 0, 1, 1,
0.4685923, 0.4166181, 0.5880399, 0.04313726, 0, 1, 1,
0.471846, 1.376898, 0.4901772, 0.05098039, 0, 1, 1,
0.4726589, -1.5698, 1.560092, 0.05490196, 0, 1, 1,
0.4728476, 1.178688, 1.435808, 0.0627451, 0, 1, 1,
0.4771718, 0.007304695, 1.002342, 0.06666667, 0, 1, 1,
0.4802137, -0.6391116, 4.350648, 0.07450981, 0, 1, 1,
0.4820983, 0.2960335, 0.9447532, 0.07843138, 0, 1, 1,
0.4821685, 1.413574, -0.44793, 0.08627451, 0, 1, 1,
0.4872042, -1.030632, 3.617565, 0.09019608, 0, 1, 1,
0.4927214, -1.193442, 0.9097311, 0.09803922, 0, 1, 1,
0.4994127, 0.8947138, -0.04226866, 0.1058824, 0, 1, 1,
0.5010129, -0.2658373, 0.8611254, 0.1098039, 0, 1, 1,
0.5012864, -0.7019694, 2.520133, 0.1176471, 0, 1, 1,
0.5033425, 0.4640672, 2.332006, 0.1215686, 0, 1, 1,
0.5035774, 0.1064003, 2.212458, 0.1294118, 0, 1, 1,
0.5080301, 1.109447, 0.2355618, 0.1333333, 0, 1, 1,
0.5103195, 0.7477517, 0.3543853, 0.1411765, 0, 1, 1,
0.5118577, 0.2922945, 3.102186, 0.145098, 0, 1, 1,
0.5175895, 0.3891031, -0.8019037, 0.1529412, 0, 1, 1,
0.5189695, 0.745722, 2.174006, 0.1568628, 0, 1, 1,
0.520362, 0.5110542, 0.3190391, 0.1647059, 0, 1, 1,
0.5272157, -0.7970631, 2.792778, 0.1686275, 0, 1, 1,
0.5403327, 0.9965445, 0.4668502, 0.1764706, 0, 1, 1,
0.5409306, 0.3226634, 3.208644, 0.1803922, 0, 1, 1,
0.5420841, 0.2526261, 1.092765, 0.1882353, 0, 1, 1,
0.5440388, 1.644563, 1.733674, 0.1921569, 0, 1, 1,
0.5474067, 0.4327207, 0.9492246, 0.2, 0, 1, 1,
0.5496006, -0.334653, 3.146638, 0.2078431, 0, 1, 1,
0.5503911, -0.7722185, 3.151132, 0.2117647, 0, 1, 1,
0.5514603, 0.6681402, 0.326641, 0.2196078, 0, 1, 1,
0.5532981, -0.4084655, 0.9559303, 0.2235294, 0, 1, 1,
0.554283, -0.2339909, 3.088344, 0.2313726, 0, 1, 1,
0.554361, -0.3057024, 1.86618, 0.2352941, 0, 1, 1,
0.559145, 0.2523303, 0.3799153, 0.2431373, 0, 1, 1,
0.5591631, -1.138534, 3.77414, 0.2470588, 0, 1, 1,
0.5597782, 1.289901, 1.139866, 0.254902, 0, 1, 1,
0.5605569, -1.713689, 4.163611, 0.2588235, 0, 1, 1,
0.5645506, 1.492216, 0.0577813, 0.2666667, 0, 1, 1,
0.5645968, 1.086848, 0.05512927, 0.2705882, 0, 1, 1,
0.5689837, 0.0146007, 0.04488799, 0.2784314, 0, 1, 1,
0.5732568, 0.3007333, -1.253665, 0.282353, 0, 1, 1,
0.5736347, -2.165092, 2.317265, 0.2901961, 0, 1, 1,
0.5818248, 0.2607208, 2.010892, 0.2941177, 0, 1, 1,
0.5849375, -0.2331469, 2.073387, 0.3019608, 0, 1, 1,
0.5913241, 0.7983218, -0.6636176, 0.3098039, 0, 1, 1,
0.5916567, 0.6731524, 1.219712, 0.3137255, 0, 1, 1,
0.5957759, 0.1822339, 1.084584, 0.3215686, 0, 1, 1,
0.6019703, -0.03954733, 1.204538, 0.3254902, 0, 1, 1,
0.6034775, 0.6968732, 1.055181, 0.3333333, 0, 1, 1,
0.6101528, -1.306911, 4.198631, 0.3372549, 0, 1, 1,
0.6114326, 0.8006983, 1.030125, 0.345098, 0, 1, 1,
0.6130269, -0.7987367, 1.408836, 0.3490196, 0, 1, 1,
0.613847, -0.4014665, 2.58464, 0.3568628, 0, 1, 1,
0.6179849, -0.9339631, 1.680613, 0.3607843, 0, 1, 1,
0.6192484, 0.1573889, 1.395737, 0.3686275, 0, 1, 1,
0.6238102, -1.528783, 2.604806, 0.372549, 0, 1, 1,
0.6272804, 1.112684, 0.09448034, 0.3803922, 0, 1, 1,
0.6300957, 0.8271036, -0.1882346, 0.3843137, 0, 1, 1,
0.6329645, -0.5691468, 2.516306, 0.3921569, 0, 1, 1,
0.6337326, 1.315923, 0.5792251, 0.3960784, 0, 1, 1,
0.6359962, 0.8142991, -0.07449891, 0.4039216, 0, 1, 1,
0.6386086, 0.1667545, 0.7889895, 0.4117647, 0, 1, 1,
0.6412979, 1.359617, -0.3132094, 0.4156863, 0, 1, 1,
0.6450269, -0.9929872, 2.683796, 0.4235294, 0, 1, 1,
0.6502658, 1.566828, 1.099604, 0.427451, 0, 1, 1,
0.6515104, -0.8936026, -0.1263333, 0.4352941, 0, 1, 1,
0.6518312, -1.00129, 1.664376, 0.4392157, 0, 1, 1,
0.6625927, 0.990034, 0.1107301, 0.4470588, 0, 1, 1,
0.6651245, -1.947122, 2.818876, 0.4509804, 0, 1, 1,
0.6652333, 1.882199, 0.4992112, 0.4588235, 0, 1, 1,
0.6685987, 0.2250473, 0.7006511, 0.4627451, 0, 1, 1,
0.6690485, -0.2080642, 2.619825, 0.4705882, 0, 1, 1,
0.6707795, -1.504205, 0.6476273, 0.4745098, 0, 1, 1,
0.6722494, 0.4771089, 2.044481, 0.4823529, 0, 1, 1,
0.6734081, 0.7843444, -0.5801355, 0.4862745, 0, 1, 1,
0.6743219, -0.7695628, 3.152725, 0.4941176, 0, 1, 1,
0.6813528, 0.5030453, 1.164982, 0.5019608, 0, 1, 1,
0.6846402, 1.729611, 1.092679, 0.5058824, 0, 1, 1,
0.6848647, -0.8380852, 1.300965, 0.5137255, 0, 1, 1,
0.6859308, -0.1168802, -0.5238191, 0.5176471, 0, 1, 1,
0.6924133, 0.7036837, -1.393685, 0.5254902, 0, 1, 1,
0.7027742, 0.8182357, 0.5187362, 0.5294118, 0, 1, 1,
0.703339, -0.6742595, 3.366997, 0.5372549, 0, 1, 1,
0.7035286, 0.1874914, 0.3386513, 0.5411765, 0, 1, 1,
0.7102858, 1.499207, -0.3229481, 0.5490196, 0, 1, 1,
0.7111264, -1.08658, 4.750097, 0.5529412, 0, 1, 1,
0.7117681, 1.163513, 0.5190405, 0.5607843, 0, 1, 1,
0.7129357, 1.084262, 0.9873926, 0.5647059, 0, 1, 1,
0.7156178, -2.15031, 1.481359, 0.572549, 0, 1, 1,
0.7170558, -0.02539844, 2.147899, 0.5764706, 0, 1, 1,
0.7202469, 0.02407515, 2.649053, 0.5843138, 0, 1, 1,
0.7224209, 0.653906, 0.7860702, 0.5882353, 0, 1, 1,
0.7254778, 2.079623, -1.29603, 0.5960785, 0, 1, 1,
0.7258331, 0.2898869, 1.322386, 0.6039216, 0, 1, 1,
0.7288463, -2.215286, 1.947405, 0.6078432, 0, 1, 1,
0.7296599, 0.3175209, 0.6395597, 0.6156863, 0, 1, 1,
0.7338715, 0.1361481, 1.302713, 0.6196079, 0, 1, 1,
0.7404073, 2.394975, -0.001156398, 0.627451, 0, 1, 1,
0.7412215, -0.235543, 1.978241, 0.6313726, 0, 1, 1,
0.7423992, -1.099414, 2.36591, 0.6392157, 0, 1, 1,
0.7456241, 0.6756105, 0.467139, 0.6431373, 0, 1, 1,
0.7467446, 2.612972, 0.2632503, 0.6509804, 0, 1, 1,
0.7481304, -0.5300088, 1.722192, 0.654902, 0, 1, 1,
0.7486698, 1.28902, 1.275994, 0.6627451, 0, 1, 1,
0.7562817, 0.005887197, 0.7457542, 0.6666667, 0, 1, 1,
0.7571753, 0.1831041, -0.8771172, 0.6745098, 0, 1, 1,
0.7761626, 0.2910571, 2.426748, 0.6784314, 0, 1, 1,
0.7770441, -0.261488, -0.7760292, 0.6862745, 0, 1, 1,
0.7802176, 0.82891, 2.918762, 0.6901961, 0, 1, 1,
0.7847319, 0.3132851, 3.397969, 0.6980392, 0, 1, 1,
0.7867106, -1.108734, 2.110597, 0.7058824, 0, 1, 1,
0.7930304, 0.218082, 0.8376748, 0.7098039, 0, 1, 1,
0.7931163, 0.6727063, 1.181597, 0.7176471, 0, 1, 1,
0.7973729, 1.130193, 0.8582417, 0.7215686, 0, 1, 1,
0.8043573, 0.6726981, 1.237595, 0.7294118, 0, 1, 1,
0.8066676, -2.41785, 2.212996, 0.7333333, 0, 1, 1,
0.8193113, -0.6192352, 2.885591, 0.7411765, 0, 1, 1,
0.8340803, 0.08971168, 0.3065226, 0.7450981, 0, 1, 1,
0.8367378, -0.3482353, 0.8394423, 0.7529412, 0, 1, 1,
0.8442671, -0.6221138, 0.8886687, 0.7568628, 0, 1, 1,
0.8567054, -0.3278016, 3.295366, 0.7647059, 0, 1, 1,
0.8594478, 1.110039, 0.7750791, 0.7686275, 0, 1, 1,
0.8653916, -0.747861, 1.753596, 0.7764706, 0, 1, 1,
0.8672469, -1.948815, 2.974199, 0.7803922, 0, 1, 1,
0.8787726, -0.3271737, 1.008048, 0.7882353, 0, 1, 1,
0.9012311, 0.6440125, -0.5027438, 0.7921569, 0, 1, 1,
0.9013421, -1.600103, 0.5655566, 0.8, 0, 1, 1,
0.9113119, -0.8565232, 3.42839, 0.8078431, 0, 1, 1,
0.9150285, 0.3272009, 1.377645, 0.8117647, 0, 1, 1,
0.9164909, -1.190163, 1.502802, 0.8196079, 0, 1, 1,
0.920067, 0.06716108, 1.958373, 0.8235294, 0, 1, 1,
0.9204903, 0.2800095, 0.6459476, 0.8313726, 0, 1, 1,
0.9236904, 0.7399163, 0.2225248, 0.8352941, 0, 1, 1,
0.927326, 0.1269095, 2.225641, 0.8431373, 0, 1, 1,
0.9346664, 0.1980409, 1.28775, 0.8470588, 0, 1, 1,
0.9351836, -0.6233158, 0.6271806, 0.854902, 0, 1, 1,
0.9361192, 0.8966253, 0.1922298, 0.8588235, 0, 1, 1,
0.9486035, -0.06413081, 2.508176, 0.8666667, 0, 1, 1,
0.9518111, -0.8705291, 2.884705, 0.8705882, 0, 1, 1,
0.9556135, -0.96773, 2.362071, 0.8784314, 0, 1, 1,
0.9567561, 2.380754, 0.7978178, 0.8823529, 0, 1, 1,
0.961201, -1.402761, 1.945526, 0.8901961, 0, 1, 1,
0.9629546, 0.2203827, 0.3914806, 0.8941177, 0, 1, 1,
0.9634715, 0.04509612, 0.745182, 0.9019608, 0, 1, 1,
0.9925703, 0.1288906, 2.341647, 0.9098039, 0, 1, 1,
0.9942304, -0.6409838, 1.358444, 0.9137255, 0, 1, 1,
0.994421, -0.699168, 1.163464, 0.9215686, 0, 1, 1,
0.9951221, 0.4583939, 1.373184, 0.9254902, 0, 1, 1,
0.9990898, -0.4077357, 0.3235363, 0.9333333, 0, 1, 1,
1.001879, 1.440601, 1.385423, 0.9372549, 0, 1, 1,
1.002116, 0.2053364, 0.8504696, 0.945098, 0, 1, 1,
1.007327, -0.9289604, 2.121614, 0.9490196, 0, 1, 1,
1.008327, 0.2017761, 0.961283, 0.9568627, 0, 1, 1,
1.016732, 1.310294, -0.4686377, 0.9607843, 0, 1, 1,
1.017066, 1.385612, 0.5050367, 0.9686275, 0, 1, 1,
1.021763, 1.209939, -0.1469043, 0.972549, 0, 1, 1,
1.027174, -1.290944, 1.637516, 0.9803922, 0, 1, 1,
1.0277, -0.7785935, 3.050028, 0.9843137, 0, 1, 1,
1.028362, -0.3239061, 2.912548, 0.9921569, 0, 1, 1,
1.028913, -0.1888873, 2.32542, 0.9960784, 0, 1, 1,
1.032568, -0.1904534, 1.513499, 1, 0, 0.9960784, 1,
1.033129, 1.071699, -0.07857458, 1, 0, 0.9882353, 1,
1.033582, 0.7019671, -0.2215425, 1, 0, 0.9843137, 1,
1.038082, 0.4389923, 3.244231, 1, 0, 0.9764706, 1,
1.038885, -0.0245193, 2.348122, 1, 0, 0.972549, 1,
1.041055, 0.04957227, 3.464021, 1, 0, 0.9647059, 1,
1.041206, 1.448095, 0.9366957, 1, 0, 0.9607843, 1,
1.044757, -0.2419469, 0.8169755, 1, 0, 0.9529412, 1,
1.045181, 1.487912, 0.729376, 1, 0, 0.9490196, 1,
1.045855, -0.3582526, 0.5222798, 1, 0, 0.9411765, 1,
1.049225, -0.1500342, 2.033596, 1, 0, 0.9372549, 1,
1.050403, -0.306969, 2.840848, 1, 0, 0.9294118, 1,
1.060531, 1.732193, -0.2175639, 1, 0, 0.9254902, 1,
1.06457, -0.3295071, 2.079965, 1, 0, 0.9176471, 1,
1.065668, -1.052665, 1.29681, 1, 0, 0.9137255, 1,
1.066895, -2.225033, 3.309165, 1, 0, 0.9058824, 1,
1.076939, 1.756777, 0.1422941, 1, 0, 0.9019608, 1,
1.07722, 0.02070144, 2.969945, 1, 0, 0.8941177, 1,
1.08531, -0.0913688, 2.100039, 1, 0, 0.8862745, 1,
1.087232, -0.7910925, 3.106963, 1, 0, 0.8823529, 1,
1.091082, 0.5998069, 0.03794962, 1, 0, 0.8745098, 1,
1.092471, -0.3814835, 2.9521, 1, 0, 0.8705882, 1,
1.098006, -1.123785, 1.815209, 1, 0, 0.8627451, 1,
1.102288, -0.3876034, 2.696852, 1, 0, 0.8588235, 1,
1.103846, -0.4309983, 2.921272, 1, 0, 0.8509804, 1,
1.106586, 0.5738309, 0.6011184, 1, 0, 0.8470588, 1,
1.108616, -1.868313, 2.914249, 1, 0, 0.8392157, 1,
1.116676, 1.337212, 2.902119, 1, 0, 0.8352941, 1,
1.117584, 1.415283, 1.004889, 1, 0, 0.827451, 1,
1.12076, -0.9699255, 1.450286, 1, 0, 0.8235294, 1,
1.134887, 0.5395018, 2.225489, 1, 0, 0.8156863, 1,
1.138573, 0.00783899, 1.467782, 1, 0, 0.8117647, 1,
1.14309, -1.27713, 2.307149, 1, 0, 0.8039216, 1,
1.150565, -0.2316466, 3.401801, 1, 0, 0.7960784, 1,
1.152245, -0.5161124, 2.482846, 1, 0, 0.7921569, 1,
1.152892, -0.1607977, 2.590761, 1, 0, 0.7843137, 1,
1.158588, -0.71189, 2.831848, 1, 0, 0.7803922, 1,
1.162619, 0.3067752, 1.95126, 1, 0, 0.772549, 1,
1.165565, -0.8977405, 3.274543, 1, 0, 0.7686275, 1,
1.167096, -1.734521, 3.090565, 1, 0, 0.7607843, 1,
1.167651, -0.850969, 1.771254, 1, 0, 0.7568628, 1,
1.171781, 0.5853161, 0.6362299, 1, 0, 0.7490196, 1,
1.17199, 0.2827639, 1.275011, 1, 0, 0.7450981, 1,
1.182385, -1.066346, 2.127552, 1, 0, 0.7372549, 1,
1.183036, 0.9845404, 1.959538, 1, 0, 0.7333333, 1,
1.18542, -1.004396, 2.43315, 1, 0, 0.7254902, 1,
1.188276, -0.4244521, 4.051338, 1, 0, 0.7215686, 1,
1.190964, -1.912302, 1.877688, 1, 0, 0.7137255, 1,
1.191198, 2.28522, -0.3623506, 1, 0, 0.7098039, 1,
1.193538, -0.865934, 1.841718, 1, 0, 0.7019608, 1,
1.197989, -1.054742, 3.51796, 1, 0, 0.6941177, 1,
1.198461, -0.05690648, 1.543471, 1, 0, 0.6901961, 1,
1.210646, 0.1531461, 0.2433465, 1, 0, 0.682353, 1,
1.213028, 0.8111359, 0.8898641, 1, 0, 0.6784314, 1,
1.218796, -0.1730651, 2.421694, 1, 0, 0.6705883, 1,
1.224947, -0.3701666, 2.422999, 1, 0, 0.6666667, 1,
1.228168, -0.5869691, 2.903331, 1, 0, 0.6588235, 1,
1.230392, -0.5878229, 2.836862, 1, 0, 0.654902, 1,
1.23096, 0.3430969, 0.8051689, 1, 0, 0.6470588, 1,
1.242176, 1.266822, 2.710836, 1, 0, 0.6431373, 1,
1.243183, 0.9742658, 0.5890129, 1, 0, 0.6352941, 1,
1.250871, 0.1045295, 0.7463847, 1, 0, 0.6313726, 1,
1.266116, 0.07554433, 2.003411, 1, 0, 0.6235294, 1,
1.266157, 1.662405, -0.382218, 1, 0, 0.6196079, 1,
1.272531, -1.185574, 2.673369, 1, 0, 0.6117647, 1,
1.275517, -0.1835768, 0.9387758, 1, 0, 0.6078432, 1,
1.2786, 1.054774, 1.598464, 1, 0, 0.6, 1,
1.284748, 1.890987, -0.3644904, 1, 0, 0.5921569, 1,
1.295485, 1.170073, 0.2189065, 1, 0, 0.5882353, 1,
1.299521, -1.301573, 1.772984, 1, 0, 0.5803922, 1,
1.301516, -0.8187351, 2.141722, 1, 0, 0.5764706, 1,
1.318199, 0.723744, 2.27602, 1, 0, 0.5686275, 1,
1.330263, -2.088548, 1.104977, 1, 0, 0.5647059, 1,
1.331298, 1.711867, 1.881015, 1, 0, 0.5568628, 1,
1.332971, -0.4014221, 2.320351, 1, 0, 0.5529412, 1,
1.335231, 0.08524032, 0.8052257, 1, 0, 0.5450981, 1,
1.33834, -0.5445598, 3.067393, 1, 0, 0.5411765, 1,
1.347034, 0.9641649, 1.261013, 1, 0, 0.5333334, 1,
1.355545, 0.2451396, 1.260464, 1, 0, 0.5294118, 1,
1.357891, 0.3314905, 0.1669826, 1, 0, 0.5215687, 1,
1.360734, 0.4468235, 2.344287, 1, 0, 0.5176471, 1,
1.364648, 1.508624, 1.68959, 1, 0, 0.509804, 1,
1.368855, 1.180428, 2.5915, 1, 0, 0.5058824, 1,
1.369481, 0.7635567, 3.760176, 1, 0, 0.4980392, 1,
1.370329, -1.302775, 2.203538, 1, 0, 0.4901961, 1,
1.37707, 2.369948, 1.78185, 1, 0, 0.4862745, 1,
1.379819, 1.727403, 0.6684843, 1, 0, 0.4784314, 1,
1.386086, -0.9152704, 2.523327, 1, 0, 0.4745098, 1,
1.386899, -0.2024547, 1.649091, 1, 0, 0.4666667, 1,
1.39498, 0.1563959, 1.824083, 1, 0, 0.4627451, 1,
1.399014, -2.116183, 2.94383, 1, 0, 0.454902, 1,
1.403089, -1.166925, 2.672409, 1, 0, 0.4509804, 1,
1.42189, 0.01236639, 0.3175812, 1, 0, 0.4431373, 1,
1.426962, 1.364224, 1.148859, 1, 0, 0.4392157, 1,
1.430328, 0.732741, 0.1375954, 1, 0, 0.4313726, 1,
1.434469, 0.05287635, 0.6750447, 1, 0, 0.427451, 1,
1.442416, 0.01521098, 0.3196141, 1, 0, 0.4196078, 1,
1.458007, 0.538097, 0.5991327, 1, 0, 0.4156863, 1,
1.481515, 0.08592956, 2.122202, 1, 0, 0.4078431, 1,
1.501786, -1.133861, 1.440825, 1, 0, 0.4039216, 1,
1.501995, -0.04744893, 1.503381, 1, 0, 0.3960784, 1,
1.521461, -0.002396634, 2.226504, 1, 0, 0.3882353, 1,
1.523187, -1.175102, 1.169933, 1, 0, 0.3843137, 1,
1.537697, -0.4620608, 2.860264, 1, 0, 0.3764706, 1,
1.54115, 1.904857, 1.695483, 1, 0, 0.372549, 1,
1.559053, -1.023594, 2.927933, 1, 0, 0.3647059, 1,
1.565057, -1.620509, 2.181685, 1, 0, 0.3607843, 1,
1.576571, 0.9022304, 0.2792386, 1, 0, 0.3529412, 1,
1.579853, 0.3961, 2.460617, 1, 0, 0.3490196, 1,
1.587466, 0.4659157, 1.361588, 1, 0, 0.3411765, 1,
1.594384, -0.9001909, 2.914522, 1, 0, 0.3372549, 1,
1.607374, 0.9730523, -0.1963362, 1, 0, 0.3294118, 1,
1.609153, -0.3119574, 1.518684, 1, 0, 0.3254902, 1,
1.621504, 1.106448, 1.623606, 1, 0, 0.3176471, 1,
1.63479, -0.6490081, 1.555676, 1, 0, 0.3137255, 1,
1.636677, 0.452766, 1.732144, 1, 0, 0.3058824, 1,
1.645792, -1.575493, 2.563339, 1, 0, 0.2980392, 1,
1.679862, -1.18792, 4.707656, 1, 0, 0.2941177, 1,
1.688304, -0.3225977, 2.159562, 1, 0, 0.2862745, 1,
1.695346, -1.368411, 2.467191, 1, 0, 0.282353, 1,
1.695518, -0.771691, 0.7979423, 1, 0, 0.2745098, 1,
1.713426, 1.495061, 0.6957728, 1, 0, 0.2705882, 1,
1.738641, -1.491256, 1.863097, 1, 0, 0.2627451, 1,
1.744353, -0.7627907, 2.16947, 1, 0, 0.2588235, 1,
1.748583, -0.1744506, 0.9324825, 1, 0, 0.2509804, 1,
1.779111, -1.762737, 3.967452, 1, 0, 0.2470588, 1,
1.779805, 0.4516521, 1.156879, 1, 0, 0.2392157, 1,
1.780413, -0.9385031, 1.856514, 1, 0, 0.2352941, 1,
1.781032, -0.8279108, 1.735213, 1, 0, 0.227451, 1,
1.794022, -0.3700757, 1.13641, 1, 0, 0.2235294, 1,
1.798033, -0.3218533, 0.8304325, 1, 0, 0.2156863, 1,
1.830953, -0.5933189, 1.211047, 1, 0, 0.2117647, 1,
1.833167, 0.2578368, 0.8548027, 1, 0, 0.2039216, 1,
1.840842, 0.8943509, 0.7213097, 1, 0, 0.1960784, 1,
1.868197, 0.04854893, 2.378723, 1, 0, 0.1921569, 1,
1.880561, 0.4251056, 2.648564, 1, 0, 0.1843137, 1,
1.903214, -0.1926318, 2.967412, 1, 0, 0.1803922, 1,
1.907923, -1.107135, 1.442118, 1, 0, 0.172549, 1,
1.919343, -0.1924243, 2.189066, 1, 0, 0.1686275, 1,
1.943108, -0.2190216, 0.237656, 1, 0, 0.1607843, 1,
1.946962, -1.035861, 3.412568, 1, 0, 0.1568628, 1,
1.948667, 1.892422, 0.5549457, 1, 0, 0.1490196, 1,
1.966302, -0.4297752, 1.845985, 1, 0, 0.145098, 1,
1.975157, 0.2299761, -0.8623822, 1, 0, 0.1372549, 1,
2.002955, 0.3729655, 2.578875, 1, 0, 0.1333333, 1,
2.039771, 0.10099, 3.206532, 1, 0, 0.1254902, 1,
2.047615, -1.187859, 1.621978, 1, 0, 0.1215686, 1,
2.08791, 0.05041683, 0.6696261, 1, 0, 0.1137255, 1,
2.159416, -0.6267375, 2.155635, 1, 0, 0.1098039, 1,
2.170501, -0.4346844, 1.671388, 1, 0, 0.1019608, 1,
2.174784, -1.095835, 3.242497, 1, 0, 0.09411765, 1,
2.17915, 1.110795, 0.5821165, 1, 0, 0.09019608, 1,
2.204254, 1.222734, -0.08035889, 1, 0, 0.08235294, 1,
2.218642, -1.093393, 1.680698, 1, 0, 0.07843138, 1,
2.222424, -0.8158134, 0.4513291, 1, 0, 0.07058824, 1,
2.24197, -1.805353, 1.957524, 1, 0, 0.06666667, 1,
2.273757, 0.2625656, 0.9782223, 1, 0, 0.05882353, 1,
2.288379, 0.5104685, 2.384954, 1, 0, 0.05490196, 1,
2.316482, -0.1575579, 1.857404, 1, 0, 0.04705882, 1,
2.435758, -0.3291435, 2.888844, 1, 0, 0.04313726, 1,
2.447091, 0.2307869, 1.299716, 1, 0, 0.03529412, 1,
2.465304, 0.9165536, 1.062182, 1, 0, 0.03137255, 1,
2.531842, -1.033338, 2.874537, 1, 0, 0.02352941, 1,
2.712758, -0.5112171, 2.578349, 1, 0, 0.01960784, 1,
2.972847, -0.3074895, 0.394028, 1, 0, 0.01176471, 1,
3.605975, -0.6620628, 1.968459, 1, 0, 0.007843138, 1
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
0.2847281, -3.760012, -7.442353, 0, -0.5, 0.5, 0.5,
0.2847281, -3.760012, -7.442353, 1, -0.5, 0.5, 0.5,
0.2847281, -3.760012, -7.442353, 1, 1.5, 0.5, 0.5,
0.2847281, -3.760012, -7.442353, 0, 1.5, 0.5, 0.5
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
-4.162421, -0.01584566, -7.442353, 0, -0.5, 0.5, 0.5,
-4.162421, -0.01584566, -7.442353, 1, -0.5, 0.5, 0.5,
-4.162421, -0.01584566, -7.442353, 1, 1.5, 0.5, 0.5,
-4.162421, -0.01584566, -7.442353, 0, 1.5, 0.5, 0.5
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
-4.162421, -3.760012, -0.007472754, 0, -0.5, 0.5, 0.5,
-4.162421, -3.760012, -0.007472754, 1, -0.5, 0.5, 0.5,
-4.162421, -3.760012, -0.007472754, 1, 1.5, 0.5, 0.5,
-4.162421, -3.760012, -0.007472754, 0, 1.5, 0.5, 0.5
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
-3, -2.895974, -5.726611,
3, -2.895974, -5.726611,
-3, -2.895974, -5.726611,
-3, -3.03998, -6.012568,
-2, -2.895974, -5.726611,
-2, -3.03998, -6.012568,
-1, -2.895974, -5.726611,
-1, -3.03998, -6.012568,
0, -2.895974, -5.726611,
0, -3.03998, -6.012568,
1, -2.895974, -5.726611,
1, -3.03998, -6.012568,
2, -2.895974, -5.726611,
2, -3.03998, -6.012568,
3, -2.895974, -5.726611,
3, -3.03998, -6.012568
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
-3, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
-3, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
-3, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
-3, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
-2, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
-2, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
-2, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
-2, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
-1, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
-1, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
-1, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
-1, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
0, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
0, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
0, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
0, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
1, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
1, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
1, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
1, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
2, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
2, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
2, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
2, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5,
3, -3.327993, -6.584482, 0, -0.5, 0.5, 0.5,
3, -3.327993, -6.584482, 1, -0.5, 0.5, 0.5,
3, -3.327993, -6.584482, 1, 1.5, 0.5, 0.5,
3, -3.327993, -6.584482, 0, 1.5, 0.5, 0.5
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
-3.136156, -2, -5.726611,
-3.136156, 2, -5.726611,
-3.136156, -2, -5.726611,
-3.3072, -2, -6.012568,
-3.136156, -1, -5.726611,
-3.3072, -1, -6.012568,
-3.136156, 0, -5.726611,
-3.3072, 0, -6.012568,
-3.136156, 1, -5.726611,
-3.3072, 1, -6.012568,
-3.136156, 2, -5.726611,
-3.3072, 2, -6.012568
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
-3.649289, -2, -6.584482, 0, -0.5, 0.5, 0.5,
-3.649289, -2, -6.584482, 1, -0.5, 0.5, 0.5,
-3.649289, -2, -6.584482, 1, 1.5, 0.5, 0.5,
-3.649289, -2, -6.584482, 0, 1.5, 0.5, 0.5,
-3.649289, -1, -6.584482, 0, -0.5, 0.5, 0.5,
-3.649289, -1, -6.584482, 1, -0.5, 0.5, 0.5,
-3.649289, -1, -6.584482, 1, 1.5, 0.5, 0.5,
-3.649289, -1, -6.584482, 0, 1.5, 0.5, 0.5,
-3.649289, 0, -6.584482, 0, -0.5, 0.5, 0.5,
-3.649289, 0, -6.584482, 1, -0.5, 0.5, 0.5,
-3.649289, 0, -6.584482, 1, 1.5, 0.5, 0.5,
-3.649289, 0, -6.584482, 0, 1.5, 0.5, 0.5,
-3.649289, 1, -6.584482, 0, -0.5, 0.5, 0.5,
-3.649289, 1, -6.584482, 1, -0.5, 0.5, 0.5,
-3.649289, 1, -6.584482, 1, 1.5, 0.5, 0.5,
-3.649289, 1, -6.584482, 0, 1.5, 0.5, 0.5,
-3.649289, 2, -6.584482, 0, -0.5, 0.5, 0.5,
-3.649289, 2, -6.584482, 1, -0.5, 0.5, 0.5,
-3.649289, 2, -6.584482, 1, 1.5, 0.5, 0.5,
-3.649289, 2, -6.584482, 0, 1.5, 0.5, 0.5
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
-3.136156, -2.895974, -4,
-3.136156, -2.895974, 4,
-3.136156, -2.895974, -4,
-3.3072, -3.03998, -4,
-3.136156, -2.895974, -2,
-3.3072, -3.03998, -2,
-3.136156, -2.895974, 0,
-3.3072, -3.03998, 0,
-3.136156, -2.895974, 2,
-3.3072, -3.03998, 2,
-3.136156, -2.895974, 4,
-3.3072, -3.03998, 4
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
-3.649289, -3.327993, -4, 0, -0.5, 0.5, 0.5,
-3.649289, -3.327993, -4, 1, -0.5, 0.5, 0.5,
-3.649289, -3.327993, -4, 1, 1.5, 0.5, 0.5,
-3.649289, -3.327993, -4, 0, 1.5, 0.5, 0.5,
-3.649289, -3.327993, -2, 0, -0.5, 0.5, 0.5,
-3.649289, -3.327993, -2, 1, -0.5, 0.5, 0.5,
-3.649289, -3.327993, -2, 1, 1.5, 0.5, 0.5,
-3.649289, -3.327993, -2, 0, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 0, 0, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 0, 1, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 0, 1, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 0, 0, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 2, 0, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 2, 1, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 2, 1, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 2, 0, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 4, 0, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 4, 1, -0.5, 0.5, 0.5,
-3.649289, -3.327993, 4, 1, 1.5, 0.5, 0.5,
-3.649289, -3.327993, 4, 0, 1.5, 0.5, 0.5
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
-3.136156, -2.895974, -5.726611,
-3.136156, 2.864283, -5.726611,
-3.136156, -2.895974, 5.711666,
-3.136156, 2.864283, 5.711666,
-3.136156, -2.895974, -5.726611,
-3.136156, -2.895974, 5.711666,
-3.136156, 2.864283, -5.726611,
-3.136156, 2.864283, 5.711666,
-3.136156, -2.895974, -5.726611,
3.705612, -2.895974, -5.726611,
-3.136156, -2.895974, 5.711666,
3.705612, -2.895974, 5.711666,
-3.136156, 2.864283, -5.726611,
3.705612, 2.864283, -5.726611,
-3.136156, 2.864283, 5.711666,
3.705612, 2.864283, 5.711666,
3.705612, -2.895974, -5.726611,
3.705612, 2.864283, -5.726611,
3.705612, -2.895974, 5.711666,
3.705612, 2.864283, 5.711666,
3.705612, -2.895974, -5.726611,
3.705612, -2.895974, 5.711666,
3.705612, 2.864283, -5.726611,
3.705612, 2.864283, 5.711666
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
var radius = 7.75329;
var distance = 34.49526;
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
mvMatrix.translate( -0.2847281, 0.01584566, 0.007472754 );
mvMatrix.scale( 1.225269, 1.455319, 0.7328909 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49526);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
pyridine<-read.table("pyridine.xyz")
```

```
## Error in read.table("pyridine.xyz"): no lines available in input
```

```r
x<-pyridine$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
y<-pyridine$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
z<-pyridine$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
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
-3.036519, 0.4072872, -1.960158, 0, 0, 1, 1, 1,
-2.713359, -1.437683, -1.482464, 1, 0, 0, 1, 1,
-2.469868, -2.353463, -0.9015117, 1, 0, 0, 1, 1,
-2.310213, 0.6041348, -0.04605575, 1, 0, 0, 1, 1,
-2.264479, -0.01710808, -0.6499994, 1, 0, 0, 1, 1,
-2.231657, -0.1234917, -0.3933667, 1, 0, 0, 1, 1,
-2.211394, -1.670098, -1.172371, 0, 0, 0, 1, 1,
-2.153501, -0.01467802, -0.783419, 0, 0, 0, 1, 1,
-2.153466, 0.9243084, -0.9202865, 0, 0, 0, 1, 1,
-2.126235, 1.151455, -1.845498, 0, 0, 0, 1, 1,
-2.039196, -1.831326, -4.267507, 0, 0, 0, 1, 1,
-2.026934, -0.478487, -1.35539, 0, 0, 0, 1, 1,
-2.024475, -0.712783, -2.104277, 0, 0, 0, 1, 1,
-1.998775, 2.239234, 0.4924311, 1, 1, 1, 1, 1,
-1.976259, -0.6589478, -1.414036, 1, 1, 1, 1, 1,
-1.910683, 0.2150567, -3.812419, 1, 1, 1, 1, 1,
-1.902468, 0.2119764, -0.9900204, 1, 1, 1, 1, 1,
-1.898661, -1.221105, -0.5330629, 1, 1, 1, 1, 1,
-1.881018, -0.0007398454, -3.499469, 1, 1, 1, 1, 1,
-1.860321, 0.5140358, -0.9669613, 1, 1, 1, 1, 1,
-1.852895, 0.03136122, -2.20347, 1, 1, 1, 1, 1,
-1.837303, -1.045855, -1.2432, 1, 1, 1, 1, 1,
-1.831916, -0.8918058, -2.249226, 1, 1, 1, 1, 1,
-1.801307, 1.057434, -3.123895, 1, 1, 1, 1, 1,
-1.783441, -0.8519073, -2.288398, 1, 1, 1, 1, 1,
-1.781497, 0.8465292, -0.520514, 1, 1, 1, 1, 1,
-1.700523, -0.2452534, -2.064577, 1, 1, 1, 1, 1,
-1.698489, -0.8584965, -0.8012484, 1, 1, 1, 1, 1,
-1.69074, 0.3869132, 0.6748133, 0, 0, 1, 1, 1,
-1.680042, -0.768114, -2.271101, 1, 0, 0, 1, 1,
-1.675075, 1.664094, -0.2548741, 1, 0, 0, 1, 1,
-1.664141, -0.7665941, -2.210868, 1, 0, 0, 1, 1,
-1.656717, 0.6290879, -2.239335, 1, 0, 0, 1, 1,
-1.656016, 0.3674594, -1.535758, 1, 0, 0, 1, 1,
-1.654831, 1.528881, -1.262309, 0, 0, 0, 1, 1,
-1.649476, -0.6223379, -1.555713, 0, 0, 0, 1, 1,
-1.632792, 1.088033, -0.7692834, 0, 0, 0, 1, 1,
-1.628966, -0.1674016, -0.743074, 0, 0, 0, 1, 1,
-1.621811, 0.3954108, -1.387308, 0, 0, 0, 1, 1,
-1.607031, 0.1615578, -0.2526283, 0, 0, 0, 1, 1,
-1.59502, -0.3487849, -2.149391, 0, 0, 0, 1, 1,
-1.587131, 1.807907, -0.5155709, 1, 1, 1, 1, 1,
-1.585775, 0.06258669, -3.291204, 1, 1, 1, 1, 1,
-1.584536, -1.301518, -3.691037, 1, 1, 1, 1, 1,
-1.584185, -2.190485, -3.034962, 1, 1, 1, 1, 1,
-1.584053, -0.1643836, -2.329806, 1, 1, 1, 1, 1,
-1.546477, -1.966245, -2.185075, 1, 1, 1, 1, 1,
-1.526913, 0.5668682, 0.2434898, 1, 1, 1, 1, 1,
-1.514565, -0.3365282, -2.064321, 1, 1, 1, 1, 1,
-1.504225, -0.05820365, -1.008798, 1, 1, 1, 1, 1,
-1.503455, -0.9313786, -2.073448, 1, 1, 1, 1, 1,
-1.494463, 0.1553593, -1.425312, 1, 1, 1, 1, 1,
-1.484365, 1.26125, -2.134972, 1, 1, 1, 1, 1,
-1.475085, 1.868106, 0.7077189, 1, 1, 1, 1, 1,
-1.470148, -0.7345142, -1.256397, 1, 1, 1, 1, 1,
-1.45859, 1.48764, -0.7461538, 1, 1, 1, 1, 1,
-1.436269, 0.6788553, -2.459583, 0, 0, 1, 1, 1,
-1.427834, 0.3474998, -3.239793, 1, 0, 0, 1, 1,
-1.42482, -0.193747, -2.240558, 1, 0, 0, 1, 1,
-1.420956, 2.727971, -0.8306469, 1, 0, 0, 1, 1,
-1.411272, 1.912996, -0.001745598, 1, 0, 0, 1, 1,
-1.398122, -2.073068, -1.602172, 1, 0, 0, 1, 1,
-1.391911, 0.3035765, -1.762044, 0, 0, 0, 1, 1,
-1.387358, 0.8908187, -1.197924, 0, 0, 0, 1, 1,
-1.387116, 0.2403644, -2.085938, 0, 0, 0, 1, 1,
-1.385727, 0.2092504, -1.798177, 0, 0, 0, 1, 1,
-1.365528, -0.6636921, -2.530321, 0, 0, 0, 1, 1,
-1.363561, -0.02823405, -0.7367699, 0, 0, 0, 1, 1,
-1.359807, -2.037412, -1.515556, 0, 0, 0, 1, 1,
-1.352227, -0.5565402, -2.951103, 1, 1, 1, 1, 1,
-1.34725, -1.116173, -1.139386, 1, 1, 1, 1, 1,
-1.339758, 0.5188446, -0.6711892, 1, 1, 1, 1, 1,
-1.338036, 1.148641, -0.1754932, 1, 1, 1, 1, 1,
-1.33195, -0.2718578, -1.117071, 1, 1, 1, 1, 1,
-1.331687, -1.660344, -1.575691, 1, 1, 1, 1, 1,
-1.323677, 1.249575, -1.250493, 1, 1, 1, 1, 1,
-1.318298, 1.117605, -1.402147, 1, 1, 1, 1, 1,
-1.315864, -0.3892599, -1.56598, 1, 1, 1, 1, 1,
-1.313185, -0.8641976, -0.6538789, 1, 1, 1, 1, 1,
-1.302767, -1.183874, -2.77779, 1, 1, 1, 1, 1,
-1.301432, 0.9953455, -1.258881, 1, 1, 1, 1, 1,
-1.300318, 0.5299076, -1.821293, 1, 1, 1, 1, 1,
-1.292823, -0.4276427, -1.439467, 1, 1, 1, 1, 1,
-1.288852, 0.5100581, -2.038104, 1, 1, 1, 1, 1,
-1.286487, 0.5097331, -1.232144, 0, 0, 1, 1, 1,
-1.274548, 0.0708431, -2.641294, 1, 0, 0, 1, 1,
-1.269769, -0.8497386, -2.473835, 1, 0, 0, 1, 1,
-1.263285, 0.1031774, -1.141562, 1, 0, 0, 1, 1,
-1.262021, 0.06103592, -3.474889, 1, 0, 0, 1, 1,
-1.259715, 0.1076332, -2.192946, 1, 0, 0, 1, 1,
-1.252959, -1.586929, -3.179996, 0, 0, 0, 1, 1,
-1.24634, 0.2404936, -2.994569, 0, 0, 0, 1, 1,
-1.240542, 0.4195528, -0.7153811, 0, 0, 0, 1, 1,
-1.236982, -2.617373, -2.89487, 0, 0, 0, 1, 1,
-1.236309, -0.7602515, -0.5912537, 0, 0, 0, 1, 1,
-1.235726, -0.03372151, -0.1458266, 0, 0, 0, 1, 1,
-1.229741, -0.1647454, -2.386705, 0, 0, 0, 1, 1,
-1.212875, -0.2498092, -2.158581, 1, 1, 1, 1, 1,
-1.210797, -0.0526057, -2.054053, 1, 1, 1, 1, 1,
-1.208123, 0.3158661, -0.185471, 1, 1, 1, 1, 1,
-1.199697, -0.6924028, -2.700296, 1, 1, 1, 1, 1,
-1.193199, -1.682181, -1.835982, 1, 1, 1, 1, 1,
-1.192378, -2.115509, -2.920824, 1, 1, 1, 1, 1,
-1.187849, 0.3505472, -0.709866, 1, 1, 1, 1, 1,
-1.184424, -1.746851, -3.223131, 1, 1, 1, 1, 1,
-1.184212, 1.139524, -2.82166, 1, 1, 1, 1, 1,
-1.174193, 1.136096, -1.54288, 1, 1, 1, 1, 1,
-1.17294, 1.178283, -0.9947069, 1, 1, 1, 1, 1,
-1.162822, 0.2391942, -0.390159, 1, 1, 1, 1, 1,
-1.154654, -0.3421486, -1.641817, 1, 1, 1, 1, 1,
-1.146052, -1.688548, -2.167207, 1, 1, 1, 1, 1,
-1.142164, 0.5007542, -0.1616673, 1, 1, 1, 1, 1,
-1.139955, 1.339471, 1.472752, 0, 0, 1, 1, 1,
-1.134825, -2.423471, -1.113645, 1, 0, 0, 1, 1,
-1.130426, 0.3122648, -1.087024, 1, 0, 0, 1, 1,
-1.129829, -0.5826595, -1.691886, 1, 0, 0, 1, 1,
-1.129797, 0.1587243, -1.720993, 1, 0, 0, 1, 1,
-1.122073, -0.1473351, -2.577497, 1, 0, 0, 1, 1,
-1.114015, -0.6034805, -2.03969, 0, 0, 0, 1, 1,
-1.110657, -0.7750433, -1.115731, 0, 0, 0, 1, 1,
-1.110627, -1.027253, -0.195885, 0, 0, 0, 1, 1,
-1.104882, 1.211984, -2.329586, 0, 0, 0, 1, 1,
-1.103315, -0.3085663, -1.603631, 0, 0, 0, 1, 1,
-1.085183, 1.779153, 0.5973912, 0, 0, 0, 1, 1,
-1.081722, 0.5017378, -1.392577, 0, 0, 0, 1, 1,
-1.078651, -0.2351578, -0.7916373, 1, 1, 1, 1, 1,
-1.074731, -0.2171775, -0.8066633, 1, 1, 1, 1, 1,
-1.070585, -0.2502408, -4.677455, 1, 1, 1, 1, 1,
-1.069927, -0.1649111, -1.256486, 1, 1, 1, 1, 1,
-1.067067, 0.178789, -0.779116, 1, 1, 1, 1, 1,
-1.063131, -1.031678, -2.144093, 1, 1, 1, 1, 1,
-1.061163, -0.9934248, -2.024577, 1, 1, 1, 1, 1,
-1.059548, 1.113389, -0.1001989, 1, 1, 1, 1, 1,
-1.055631, 0.6501756, -1.299559, 1, 1, 1, 1, 1,
-1.04892, 1.384719, -1.343211, 1, 1, 1, 1, 1,
-1.045988, -0.6033925, 0.1135403, 1, 1, 1, 1, 1,
-1.044868, 0.966676, 0.9670873, 1, 1, 1, 1, 1,
-1.040143, -0.4153791, -2.574242, 1, 1, 1, 1, 1,
-1.037517, -0.9097012, -2.651786, 1, 1, 1, 1, 1,
-1.033281, 1.468731, -0.5362521, 1, 1, 1, 1, 1,
-1.030748, -0.003344605, -2.057908, 0, 0, 1, 1, 1,
-1.02532, 0.4735376, -1.153656, 1, 0, 0, 1, 1,
-1.024664, 0.522015, -1.005259, 1, 0, 0, 1, 1,
-1.02369, -0.4392734, -3.685775, 1, 0, 0, 1, 1,
-1.01583, 1.680918, -0.8385593, 1, 0, 0, 1, 1,
-1.013241, -0.9233568, -1.148429, 1, 0, 0, 1, 1,
-1.013125, -1.147051, -3.941562, 0, 0, 0, 1, 1,
-1.011892, 1.267509, -1.198809, 0, 0, 0, 1, 1,
-1.009273, -0.01816776, -2.1662, 0, 0, 0, 1, 1,
-1.007931, 0.2930912, 0.03163945, 0, 0, 0, 1, 1,
-1.001053, -0.8809223, -3.009098, 0, 0, 0, 1, 1,
-0.9949886, -0.3977171, -3.2833, 0, 0, 0, 1, 1,
-0.9897876, 0.2940337, -1.410901, 0, 0, 0, 1, 1,
-0.9879307, 1.241016, 0.18963, 1, 1, 1, 1, 1,
-0.9871438, 0.1694376, -2.327434, 1, 1, 1, 1, 1,
-0.9753516, -0.6001105, -1.287662, 1, 1, 1, 1, 1,
-0.9738591, -0.04386906, -2.312039, 1, 1, 1, 1, 1,
-0.9703372, -1.620503, -2.301018, 1, 1, 1, 1, 1,
-0.9685367, 0.4125809, -1.407658, 1, 1, 1, 1, 1,
-0.967418, -0.7113718, -1.660157, 1, 1, 1, 1, 1,
-0.9557725, -1.790426, -2.13137, 1, 1, 1, 1, 1,
-0.9536521, -1.079942, -1.936418, 1, 1, 1, 1, 1,
-0.9460841, -0.7848116, -1.363294, 1, 1, 1, 1, 1,
-0.9452481, 0.8639051, -0.09350969, 1, 1, 1, 1, 1,
-0.9401188, 1.093427, -0.1968653, 1, 1, 1, 1, 1,
-0.9394193, -0.08171546, -1.000603, 1, 1, 1, 1, 1,
-0.9353297, 0.1067252, -0.5076621, 1, 1, 1, 1, 1,
-0.9244766, 0.3738025, -0.6663753, 1, 1, 1, 1, 1,
-0.9239525, 0.1229939, -0.7415785, 0, 0, 1, 1, 1,
-0.9146777, 0.526657, -0.9726705, 1, 0, 0, 1, 1,
-0.9145947, 0.8486015, -0.6206096, 1, 0, 0, 1, 1,
-0.9077227, 1.233503, -0.6251237, 1, 0, 0, 1, 1,
-0.9002611, 0.3566259, -1.973989, 1, 0, 0, 1, 1,
-0.8983901, 0.7393861, -0.5769704, 1, 0, 0, 1, 1,
-0.8976393, -0.5538336, -1.057134, 0, 0, 0, 1, 1,
-0.8961935, -0.2371178, -1.430038, 0, 0, 0, 1, 1,
-0.8942278, 0.8139207, -1.126122, 0, 0, 0, 1, 1,
-0.8909368, -1.157805, -3.049631, 0, 0, 0, 1, 1,
-0.8901916, 0.1203238, -1.071156, 0, 0, 0, 1, 1,
-0.8828673, -0.3255838, -1.269789, 0, 0, 0, 1, 1,
-0.8762005, -1.763242, -3.603383, 0, 0, 0, 1, 1,
-0.8756115, -0.4359349, -0.4878312, 1, 1, 1, 1, 1,
-0.8754116, 0.2754937, -2.467623, 1, 1, 1, 1, 1,
-0.8706229, -0.02891752, -1.061465, 1, 1, 1, 1, 1,
-0.8693682, 0.5140781, -2.585279, 1, 1, 1, 1, 1,
-0.867126, -0.415563, -3.680114, 1, 1, 1, 1, 1,
-0.8647235, 1.50554, -1.847202, 1, 1, 1, 1, 1,
-0.8603352, -0.3585093, -0.5969328, 1, 1, 1, 1, 1,
-0.8556703, -0.9992032, -2.516027, 1, 1, 1, 1, 1,
-0.8517183, -1.281785, -3.273893, 1, 1, 1, 1, 1,
-0.8484972, 0.1249651, -0.07157873, 1, 1, 1, 1, 1,
-0.8480903, 0.3165849, 0.3495696, 1, 1, 1, 1, 1,
-0.8456487, 0.758242, -0.7779263, 1, 1, 1, 1, 1,
-0.8415576, -0.3769149, -2.73613, 1, 1, 1, 1, 1,
-0.8372214, 0.3341853, -2.791225, 1, 1, 1, 1, 1,
-0.8234684, -0.9723166, -1.08348, 1, 1, 1, 1, 1,
-0.8226605, -0.08415504, -1.696595, 0, 0, 1, 1, 1,
-0.8198302, -0.4165857, -2.183904, 1, 0, 0, 1, 1,
-0.8144248, -0.08277182, -1.362319, 1, 0, 0, 1, 1,
-0.8108706, -1.427285, -2.823022, 1, 0, 0, 1, 1,
-0.8095073, 0.1697092, -1.027939, 1, 0, 0, 1, 1,
-0.8083386, -0.07880333, -2.759121, 1, 0, 0, 1, 1,
-0.8064775, -0.387524, -2.443298, 0, 0, 0, 1, 1,
-0.8031446, 0.1468117, -2.250302, 0, 0, 0, 1, 1,
-0.7959209, 0.3359598, -1.155225, 0, 0, 0, 1, 1,
-0.7928842, 0.8580044, -0.237467, 0, 0, 0, 1, 1,
-0.7910801, 1.691927, -1.174881, 0, 0, 0, 1, 1,
-0.7874799, -0.001857769, -1.516786, 0, 0, 0, 1, 1,
-0.7863754, 0.3764044, -1.894317, 0, 0, 0, 1, 1,
-0.7862487, -0.6687139, -2.251673, 1, 1, 1, 1, 1,
-0.7710399, -0.1983408, -0.6229097, 1, 1, 1, 1, 1,
-0.7663413, -1.332053, -2.709519, 1, 1, 1, 1, 1,
-0.7635536, 0.4791689, -1.766042, 1, 1, 1, 1, 1,
-0.7594985, 0.5782285, -2.086422, 1, 1, 1, 1, 1,
-0.7590162, -0.6018768, -2.814538, 1, 1, 1, 1, 1,
-0.7577679, 0.4816269, -1.648341, 1, 1, 1, 1, 1,
-0.7568401, -0.09537827, 0.1916603, 1, 1, 1, 1, 1,
-0.7526866, -0.5328039, -1.460489, 1, 1, 1, 1, 1,
-0.7519429, 2.153198, -0.8060743, 1, 1, 1, 1, 1,
-0.7498305, 0.7228628, -0.2696663, 1, 1, 1, 1, 1,
-0.7497663, -0.162554, -2.854887, 1, 1, 1, 1, 1,
-0.7453035, 1.052048, 0.4723398, 1, 1, 1, 1, 1,
-0.7430456, -1.417397, -4.056169, 1, 1, 1, 1, 1,
-0.7398965, 0.8945854, -1.422072, 1, 1, 1, 1, 1,
-0.7398009, -0.01007543, -1.635979, 0, 0, 1, 1, 1,
-0.7392971, -1.156452, -1.945366, 1, 0, 0, 1, 1,
-0.7391738, 1.028771, -2.258594, 1, 0, 0, 1, 1,
-0.7337225, 0.3349852, -2.168082, 1, 0, 0, 1, 1,
-0.7334792, -2.233479, -1.846941, 1, 0, 0, 1, 1,
-0.7270571, -0.6056865, -1.560181, 1, 0, 0, 1, 1,
-0.7211081, 0.1162115, -1.616943, 0, 0, 0, 1, 1,
-0.7191969, -0.1684454, -1.409888, 0, 0, 0, 1, 1,
-0.7175503, 0.1711307, -4.092282, 0, 0, 0, 1, 1,
-0.7146879, -0.8845609, -2.427407, 0, 0, 0, 1, 1,
-0.7097836, 0.4447476, -0.336051, 0, 0, 0, 1, 1,
-0.7067626, -0.1231342, -1.343273, 0, 0, 0, 1, 1,
-0.703792, -0.03097107, -1.14372, 0, 0, 0, 1, 1,
-0.6990468, -0.1000144, -0.921353, 1, 1, 1, 1, 1,
-0.6990185, -0.2238608, -1.813981, 1, 1, 1, 1, 1,
-0.697732, -0.36983, -2.198478, 1, 1, 1, 1, 1,
-0.6955699, -1.141846, -3.164861, 1, 1, 1, 1, 1,
-0.6928335, 0.9751892, -2.194372, 1, 1, 1, 1, 1,
-0.6920904, -2.096937, -3.899962, 1, 1, 1, 1, 1,
-0.6863713, -2.034326, -2.055639, 1, 1, 1, 1, 1,
-0.682313, -0.6492302, -2.142328, 1, 1, 1, 1, 1,
-0.6805914, -0.7403795, -2.604206, 1, 1, 1, 1, 1,
-0.6787283, 0.6592104, -1.306053, 1, 1, 1, 1, 1,
-0.6773911, 0.8527452, -0.1518243, 1, 1, 1, 1, 1,
-0.6750826, 0.1271041, -0.06348975, 1, 1, 1, 1, 1,
-0.6747075, -0.8951126, -4.170951, 1, 1, 1, 1, 1,
-0.674534, 0.2870252, -1.278691, 1, 1, 1, 1, 1,
-0.6643054, 0.5411836, -2.084456, 1, 1, 1, 1, 1,
-0.6601086, -1.182016, -2.838333, 0, 0, 1, 1, 1,
-0.6575477, 1.393246, 0.01412258, 1, 0, 0, 1, 1,
-0.6556777, 1.775715, -1.724923, 1, 0, 0, 1, 1,
-0.6556314, 0.3153631, -3.053452, 1, 0, 0, 1, 1,
-0.6508262, -0.3700583, -1.175583, 1, 0, 0, 1, 1,
-0.6466141, -0.2433328, -3.965152, 1, 0, 0, 1, 1,
-0.64361, -0.7837299, -2.088899, 0, 0, 0, 1, 1,
-0.643223, 0.8577817, -0.3031587, 0, 0, 0, 1, 1,
-0.6408844, 0.3368664, -1.220544, 0, 0, 0, 1, 1,
-0.6372509, 0.231777, -2.308764, 0, 0, 0, 1, 1,
-0.6352234, -0.2780839, -1.390604, 0, 0, 0, 1, 1,
-0.6351137, -2.812087, -3.708325, 0, 0, 0, 1, 1,
-0.6197463, 1.964214, -1.688862, 0, 0, 0, 1, 1,
-0.6174404, 1.039864, -1.332151, 1, 1, 1, 1, 1,
-0.6159754, -0.5197272, -2.436856, 1, 1, 1, 1, 1,
-0.6106103, -0.2585712, -1.0268, 1, 1, 1, 1, 1,
-0.6058457, 0.4518468, -4.159973, 1, 1, 1, 1, 1,
-0.6033258, -1.270341, -1.747088, 1, 1, 1, 1, 1,
-0.5969253, 0.01874067, -1.400751, 1, 1, 1, 1, 1,
-0.591861, 1.403289, 0.2290399, 1, 1, 1, 1, 1,
-0.5914022, 0.6023279, -1.791428, 1, 1, 1, 1, 1,
-0.5908937, 1.470237, -0.2292341, 1, 1, 1, 1, 1,
-0.5874156, -0.109576, -2.704139, 1, 1, 1, 1, 1,
-0.5857818, -0.2433887, -3.342957, 1, 1, 1, 1, 1,
-0.5854846, -1.290098, -5.203697, 1, 1, 1, 1, 1,
-0.5822928, -0.5138032, -4.030272, 1, 1, 1, 1, 1,
-0.5785943, 1.006178, -1.409316, 1, 1, 1, 1, 1,
-0.5770736, 1.260585, -0.04692374, 1, 1, 1, 1, 1,
-0.575926, 0.5846081, -2.961712, 0, 0, 1, 1, 1,
-0.5741092, 1.005493, 0.3721528, 1, 0, 0, 1, 1,
-0.5725855, 0.8316282, -1.283513, 1, 0, 0, 1, 1,
-0.5688854, 0.5540407, 1.041147, 1, 0, 0, 1, 1,
-0.5680953, 0.2832983, -0.4525507, 1, 0, 0, 1, 1,
-0.5668783, -2.378325, -2.446653, 1, 0, 0, 1, 1,
-0.5647286, 1.44632, 0.5005932, 0, 0, 0, 1, 1,
-0.5560414, -0.5520453, -1.13045, 0, 0, 0, 1, 1,
-0.5559292, 1.152322, -0.8303965, 0, 0, 0, 1, 1,
-0.5495548, 0.3961296, -1.229638, 0, 0, 0, 1, 1,
-0.5433161, 0.2321088, -0.6354162, 0, 0, 0, 1, 1,
-0.5423858, -0.005437536, -2.307563, 0, 0, 0, 1, 1,
-0.5380054, 1.922265, -0.1143846, 0, 0, 0, 1, 1,
-0.5377508, -0.8492385, 0.7797019, 1, 1, 1, 1, 1,
-0.537577, 1.061894, -0.3560688, 1, 1, 1, 1, 1,
-0.5371779, -0.4148313, -2.809957, 1, 1, 1, 1, 1,
-0.5359462, 0.6876499, -0.2548667, 1, 1, 1, 1, 1,
-0.534512, -0.2030034, -1.001854, 1, 1, 1, 1, 1,
-0.534381, 0.08166586, -1.132913, 1, 1, 1, 1, 1,
-0.533946, -0.9257085, -2.241981, 1, 1, 1, 1, 1,
-0.5332727, 1.579531, -0.4331713, 1, 1, 1, 1, 1,
-0.53291, 0.01587179, -1.867135, 1, 1, 1, 1, 1,
-0.531166, 1.13438, -0.7411646, 1, 1, 1, 1, 1,
-0.5253181, 1.229249, -1.475533, 1, 1, 1, 1, 1,
-0.5224597, 1.355102, 0.1791631, 1, 1, 1, 1, 1,
-0.5200264, -0.5650178, -2.212101, 1, 1, 1, 1, 1,
-0.5141062, 0.1544247, -0.881579, 1, 1, 1, 1, 1,
-0.5125617, -0.5623805, -1.512663, 1, 1, 1, 1, 1,
-0.5082507, -0.347541, -3.212486, 0, 0, 1, 1, 1,
-0.5044618, -0.145145, -2.806326, 1, 0, 0, 1, 1,
-0.5044091, -0.5820032, -3.182008, 1, 0, 0, 1, 1,
-0.5007543, 0.5910866, 0.1023072, 1, 0, 0, 1, 1,
-0.4940716, -0.6903325, -2.818194, 1, 0, 0, 1, 1,
-0.4919813, -0.4006687, -0.9218022, 1, 0, 0, 1, 1,
-0.4902669, -0.6240757, -3.307788, 0, 0, 0, 1, 1,
-0.4888093, 0.6411566, 0.08421671, 0, 0, 0, 1, 1,
-0.4860653, 1.157218, 0.5705727, 0, 0, 0, 1, 1,
-0.4848168, -0.9625465, -4.20957, 0, 0, 0, 1, 1,
-0.4845574, 0.4449439, 0.9273517, 0, 0, 0, 1, 1,
-0.4839617, 0.7109823, 0.3245786, 0, 0, 0, 1, 1,
-0.4825331, 1.240486, -0.1134635, 0, 0, 0, 1, 1,
-0.4820914, -0.934375, -2.087722, 1, 1, 1, 1, 1,
-0.4707592, -0.4487025, -2.136003, 1, 1, 1, 1, 1,
-0.4676141, 1.33524, -1.120617, 1, 1, 1, 1, 1,
-0.4646356, -0.006854054, -2.731471, 1, 1, 1, 1, 1,
-0.4627803, -0.9048668, -2.758096, 1, 1, 1, 1, 1,
-0.4600937, 0.1720565, -0.05293701, 1, 1, 1, 1, 1,
-0.4523906, -0.6169903, -1.708648, 1, 1, 1, 1, 1,
-0.4482803, -2.594335, -2.890398, 1, 1, 1, 1, 1,
-0.4474758, 1.346089, -0.4467117, 1, 1, 1, 1, 1,
-0.446695, 0.2824113, 0.5564721, 1, 1, 1, 1, 1,
-0.4453839, 0.9938173, -1.235879, 1, 1, 1, 1, 1,
-0.4399026, -1.639408, -2.125434, 1, 1, 1, 1, 1,
-0.4397691, 0.04683711, -0.3584585, 1, 1, 1, 1, 1,
-0.434666, 1.216515, 1.182307, 1, 1, 1, 1, 1,
-0.4312711, -0.6205418, -2.107871, 1, 1, 1, 1, 1,
-0.4281246, -1.802368, -0.07931126, 0, 0, 1, 1, 1,
-0.4247004, -0.4537248, -1.453936, 1, 0, 0, 1, 1,
-0.4246616, -0.04623385, -1.699394, 1, 0, 0, 1, 1,
-0.4234765, 0.2419073, -1.515329, 1, 0, 0, 1, 1,
-0.4205855, 2.156143, 0.504465, 1, 0, 0, 1, 1,
-0.4202841, 1.219845, -1.812647, 1, 0, 0, 1, 1,
-0.4188028, -0.5142311, -1.87881, 0, 0, 0, 1, 1,
-0.4130193, 0.2789601, -1.800911, 0, 0, 0, 1, 1,
-0.4114592, -0.5412005, -1.699922, 0, 0, 0, 1, 1,
-0.4058649, 0.330579, 0.07449926, 0, 0, 0, 1, 1,
-0.4003887, -0.6638485, -0.9973713, 0, 0, 0, 1, 1,
-0.3987302, -0.6288319, -2.633905, 0, 0, 0, 1, 1,
-0.3970498, 0.4386759, -0.1038135, 0, 0, 0, 1, 1,
-0.396499, 0.6638733, -0.8748204, 1, 1, 1, 1, 1,
-0.3857606, -0.6573588, -1.910267, 1, 1, 1, 1, 1,
-0.3835526, -0.6376262, -2.754599, 1, 1, 1, 1, 1,
-0.3820271, -0.9527321, -1.469105, 1, 1, 1, 1, 1,
-0.378945, 0.3612736, -1.223951, 1, 1, 1, 1, 1,
-0.3751844, 0.2648092, 0.8122188, 1, 1, 1, 1, 1,
-0.3749617, 1.764395, 0.8708862, 1, 1, 1, 1, 1,
-0.3713492, -1.430369, -3.703096, 1, 1, 1, 1, 1,
-0.3686998, -0.9152535, -3.294581, 1, 1, 1, 1, 1,
-0.361405, -0.8603139, -3.247618, 1, 1, 1, 1, 1,
-0.3602558, 0.4565264, 0.8681946, 1, 1, 1, 1, 1,
-0.3563785, -1.137963, -3.030678, 1, 1, 1, 1, 1,
-0.3555448, -0.7656547, -3.014057, 1, 1, 1, 1, 1,
-0.3552116, 0.00889059, -1.194503, 1, 1, 1, 1, 1,
-0.3526997, -0.02753904, -0.7586772, 1, 1, 1, 1, 1,
-0.3513582, -0.3370939, -3.147809, 0, 0, 1, 1, 1,
-0.347062, -1.608645, -1.524106, 1, 0, 0, 1, 1,
-0.3468633, 0.1786125, -1.296578, 1, 0, 0, 1, 1,
-0.3463646, -0.4297682, -2.649914, 1, 0, 0, 1, 1,
-0.3456806, 0.08819879, -2.793399, 1, 0, 0, 1, 1,
-0.3427014, -0.4783044, -2.488995, 1, 0, 0, 1, 1,
-0.3338955, -2.067237, -2.20398, 0, 0, 0, 1, 1,
-0.3310662, -0.3057341, -2.903699, 0, 0, 0, 1, 1,
-0.3310591, -0.0776505, -1.509518, 0, 0, 0, 1, 1,
-0.3309785, -0.4481331, -1.075715, 0, 0, 0, 1, 1,
-0.3286826, 0.01269477, -1.677678, 0, 0, 0, 1, 1,
-0.3251087, -0.9645437, -4.005813, 0, 0, 0, 1, 1,
-0.3242487, 1.699142, -0.2008814, 0, 0, 0, 1, 1,
-0.3198791, -0.5216638, -3.423383, 1, 1, 1, 1, 1,
-0.3141876, -2.215307, -2.836577, 1, 1, 1, 1, 1,
-0.3131875, -2.144967, -3.500667, 1, 1, 1, 1, 1,
-0.312171, -2.477202, -4.309615, 1, 1, 1, 1, 1,
-0.3108353, -0.7144563, -1.464843, 1, 1, 1, 1, 1,
-0.3092062, 0.36545, -0.4157025, 1, 1, 1, 1, 1,
-0.3027251, 0.6348003, 0.8383242, 1, 1, 1, 1, 1,
-0.3002593, 2.504594, 2.308905, 1, 1, 1, 1, 1,
-0.2990629, 0.9769335, -0.9842059, 1, 1, 1, 1, 1,
-0.2922908, 0.678389, -0.3491247, 1, 1, 1, 1, 1,
-0.2921199, 1.562085, -0.1113506, 1, 1, 1, 1, 1,
-0.2910258, -0.004821541, 0.2348901, 1, 1, 1, 1, 1,
-0.2890414, -1.010674, -4.254886, 1, 1, 1, 1, 1,
-0.2851212, -0.05858909, -1.378334, 1, 1, 1, 1, 1,
-0.2842065, 0.3485083, -0.372786, 1, 1, 1, 1, 1,
-0.2832868, 0.9661207, -0.4778826, 0, 0, 1, 1, 1,
-0.2797002, 0.7534271, -0.1035714, 1, 0, 0, 1, 1,
-0.278803, -0.5941818, -2.278334, 1, 0, 0, 1, 1,
-0.273842, -0.2636656, -0.6909013, 1, 0, 0, 1, 1,
-0.272807, 1.220431, 0.653722, 1, 0, 0, 1, 1,
-0.2721969, -0.7612813, -3.588816, 1, 0, 0, 1, 1,
-0.2716717, 1.607559, -0.5346925, 0, 0, 0, 1, 1,
-0.2668737, 1.294042, -0.8034766, 0, 0, 0, 1, 1,
-0.2668357, 2.047879, 1.118375, 0, 0, 0, 1, 1,
-0.2667862, -0.765827, -1.552331, 0, 0, 0, 1, 1,
-0.2658263, 0.6098667, -0.895719, 0, 0, 0, 1, 1,
-0.2650238, 0.5175682, -1.706662, 0, 0, 0, 1, 1,
-0.2584239, 0.03047374, -1.909526, 0, 0, 0, 1, 1,
-0.2527992, -1.325558, -3.528971, 1, 1, 1, 1, 1,
-0.2493183, -0.6400305, -1.622873, 1, 1, 1, 1, 1,
-0.2478364, 0.2953267, -1.8504, 1, 1, 1, 1, 1,
-0.2471141, 1.383738, 1.14022, 1, 1, 1, 1, 1,
-0.2447471, 1.303413, -0.8769759, 1, 1, 1, 1, 1,
-0.2422121, -0.5665017, -3.68509, 1, 1, 1, 1, 1,
-0.2382534, 0.2886048, -0.6084842, 1, 1, 1, 1, 1,
-0.2376088, 0.6673245, 1.264283, 1, 1, 1, 1, 1,
-0.2325395, -0.84649, -3.626019, 1, 1, 1, 1, 1,
-0.2307969, -0.4159999, -2.220177, 1, 1, 1, 1, 1,
-0.2237464, -1.989793, -4.830486, 1, 1, 1, 1, 1,
-0.2196166, -0.6439488, -2.363892, 1, 1, 1, 1, 1,
-0.2171382, -1.062498, -2.649778, 1, 1, 1, 1, 1,
-0.2158236, -0.3046136, -3.473968, 1, 1, 1, 1, 1,
-0.2138891, 0.1888234, -2.398896, 1, 1, 1, 1, 1,
-0.2134498, -1.830042, -3.34985, 0, 0, 1, 1, 1,
-0.2118309, 1.267151, -0.04494306, 1, 0, 0, 1, 1,
-0.2095253, 0.5591116, -2.113858, 1, 0, 0, 1, 1,
-0.2044389, 0.144343, 0.5645974, 1, 0, 0, 1, 1,
-0.2022268, -0.00733182, -1.081528, 1, 0, 0, 1, 1,
-0.2019746, -1.75905, -2.242704, 1, 0, 0, 1, 1,
-0.2015953, -0.2084087, -1.808503, 0, 0, 0, 1, 1,
-0.2008035, 0.6981568, -0.2958623, 0, 0, 0, 1, 1,
-0.1963544, 1.707872, -0.9127635, 0, 0, 0, 1, 1,
-0.1914221, 0.5131338, 0.2731609, 0, 0, 0, 1, 1,
-0.1899393, -0.3307265, -1.501775, 0, 0, 0, 1, 1,
-0.1895533, 0.99137, -0.7322795, 0, 0, 0, 1, 1,
-0.1891918, -0.2112628, -1.38121, 0, 0, 0, 1, 1,
-0.1873756, 1.16053, -0.08770271, 1, 1, 1, 1, 1,
-0.1855325, 0.08302955, -0.3583822, 1, 1, 1, 1, 1,
-0.1761644, 1.02243, -1.26863, 1, 1, 1, 1, 1,
-0.1747577, 0.5947969, -0.2860506, 1, 1, 1, 1, 1,
-0.1731664, -1.004653, -3.330418, 1, 1, 1, 1, 1,
-0.1725925, 0.2628854, -0.3831142, 1, 1, 1, 1, 1,
-0.1724985, 0.5151508, -0.145743, 1, 1, 1, 1, 1,
-0.1716177, 0.08252958, -2.483431, 1, 1, 1, 1, 1,
-0.1710428, -1.650241, -2.392628, 1, 1, 1, 1, 1,
-0.1626147, 1.022214, 1.414827, 1, 1, 1, 1, 1,
-0.1623697, -0.3203154, -3.149516, 1, 1, 1, 1, 1,
-0.1596543, -0.3592856, -0.4188216, 1, 1, 1, 1, 1,
-0.1552484, -0.1528086, -2.50334, 1, 1, 1, 1, 1,
-0.1509756, 0.6798695, -0.9849593, 1, 1, 1, 1, 1,
-0.1466121, 0.7671753, -0.9443446, 1, 1, 1, 1, 1,
-0.1443205, -1.153303, -2.955717, 0, 0, 1, 1, 1,
-0.1428819, -1.264545, -3.099006, 1, 0, 0, 1, 1,
-0.1392949, -1.177723, -4.169884, 1, 0, 0, 1, 1,
-0.1377254, -1.049443, -2.734427, 1, 0, 0, 1, 1,
-0.1366, 0.7907583, 1.753581, 1, 0, 0, 1, 1,
-0.1360493, 0.2073178, -2.290248, 1, 0, 0, 1, 1,
-0.134175, 0.1425541, 0.107705, 0, 0, 0, 1, 1,
-0.1332613, 1.688277, 1.648112, 0, 0, 0, 1, 1,
-0.1309668, -0.4598533, -4.410873, 0, 0, 0, 1, 1,
-0.1297928, -0.4367256, -3.276322, 0, 0, 0, 1, 1,
-0.1282297, -1.038031, -1.772579, 0, 0, 0, 1, 1,
-0.127008, -0.6801597, -3.698925, 0, 0, 0, 1, 1,
-0.1239231, -0.4046501, -2.651372, 0, 0, 0, 1, 1,
-0.1221354, -0.5801331, -2.786204, 1, 1, 1, 1, 1,
-0.1201746, 0.8227509, -0.07369559, 1, 1, 1, 1, 1,
-0.1197455, -0.4672269, -2.993558, 1, 1, 1, 1, 1,
-0.1192248, 1.078482, -0.571364, 1, 1, 1, 1, 1,
-0.1116612, -0.1763738, -2.779991, 1, 1, 1, 1, 1,
-0.1108275, 0.4027237, -0.4827197, 1, 1, 1, 1, 1,
-0.1101366, 0.1280985, -0.2166987, 1, 1, 1, 1, 1,
-0.1087302, -0.4523085, -4.739216, 1, 1, 1, 1, 1,
-0.1082483, -0.5469353, -1.685458, 1, 1, 1, 1, 1,
-0.1069624, 1.353591, 1.695127, 1, 1, 1, 1, 1,
-0.09598394, -1.920402, -3.490509, 1, 1, 1, 1, 1,
-0.09421916, 1.142014, 0.05872005, 1, 1, 1, 1, 1,
-0.08756259, -0.06650484, -2.865074, 1, 1, 1, 1, 1,
-0.08525345, -0.1071026, -2.165245, 1, 1, 1, 1, 1,
-0.08272804, 1.858222, 2.575301, 1, 1, 1, 1, 1,
-0.07664528, -2.512022, -3.32498, 0, 0, 1, 1, 1,
-0.07440028, -0.2656076, -3.022547, 1, 0, 0, 1, 1,
-0.07339284, 0.2796848, -1.959936, 1, 0, 0, 1, 1,
-0.06818421, -0.06101956, -2.22083, 1, 0, 0, 1, 1,
-0.0670268, -0.5446318, -3.415796, 1, 0, 0, 1, 1,
-0.06611713, -0.7721611, -3.580027, 1, 0, 0, 1, 1,
-0.0643028, 1.636455, -0.8712319, 0, 0, 0, 1, 1,
-0.05994953, 0.7669631, -0.2461773, 0, 0, 0, 1, 1,
-0.05748434, -0.6862116, -2.821506, 0, 0, 0, 1, 1,
-0.0554142, 0.5235237, 1.432774, 0, 0, 0, 1, 1,
-0.0552236, 0.1915218, -0.4395753, 0, 0, 0, 1, 1,
-0.05198057, 0.8051381, 0.1768112, 0, 0, 0, 1, 1,
-0.04711936, 2.467391, 0.5763711, 0, 0, 0, 1, 1,
-0.0454916, 0.8668226, 0.07771192, 1, 1, 1, 1, 1,
-0.04536297, -1.207988, -5.560034, 1, 1, 1, 1, 1,
-0.04534579, 0.3802736, 0.2631965, 1, 1, 1, 1, 1,
-0.04234145, -0.009905373, -2.297071, 1, 1, 1, 1, 1,
-0.03997643, -0.508998, -3.105558, 1, 1, 1, 1, 1,
-0.03907818, 1.332823, 1.459079, 1, 1, 1, 1, 1,
-0.03572262, -0.2874365, -4.243943, 1, 1, 1, 1, 1,
-0.03179526, -1.088655, -3.371791, 1, 1, 1, 1, 1,
-0.02750276, -1.249179, -3.721086, 1, 1, 1, 1, 1,
-0.02450258, 1.311542, 0.1401275, 1, 1, 1, 1, 1,
-0.02429512, -0.561599, -2.990734, 1, 1, 1, 1, 1,
-0.02289832, 1.966313, 1.242087, 1, 1, 1, 1, 1,
-0.02022696, 0.864881, 0.9102264, 1, 1, 1, 1, 1,
-0.01856617, 0.1576916, 1.33875, 1, 1, 1, 1, 1,
-0.01635838, 1.996857, 1.395891, 1, 1, 1, 1, 1,
-0.01413443, -1.113459, -4.104327, 0, 0, 1, 1, 1,
-0.01368907, 1.20714, 1.034265, 1, 0, 0, 1, 1,
-0.005901925, 1.027674, -1.810439, 1, 0, 0, 1, 1,
-0.005822346, 1.380079, -0.055742, 1, 0, 0, 1, 1,
0.01844384, -1.895393, 4.837136, 1, 0, 0, 1, 1,
0.02312803, -0.7456151, 2.285077, 1, 0, 0, 1, 1,
0.02328965, 0.1307147, -1.761835, 0, 0, 0, 1, 1,
0.03216473, -0.9682782, 2.242701, 0, 0, 0, 1, 1,
0.03338334, -0.940621, 3.200216, 0, 0, 0, 1, 1,
0.04470849, 0.7091694, 0.942898, 0, 0, 0, 1, 1,
0.04964699, 0.6967409, -0.8399666, 0, 0, 0, 1, 1,
0.05088226, 0.1752452, -0.8122084, 0, 0, 0, 1, 1,
0.05325468, -0.3535626, 4.046976, 0, 0, 0, 1, 1,
0.05389878, 0.7757037, 1.841538, 1, 1, 1, 1, 1,
0.05543325, -0.4500413, 5.426331, 1, 1, 1, 1, 1,
0.05631406, -0.2428736, 5.545089, 1, 1, 1, 1, 1,
0.05801442, -0.07664485, 2.567346, 1, 1, 1, 1, 1,
0.06233605, -0.5685754, 3.181758, 1, 1, 1, 1, 1,
0.06479973, -1.396884, 3.182455, 1, 1, 1, 1, 1,
0.06640624, -0.2007926, 2.734392, 1, 1, 1, 1, 1,
0.06931082, -0.756143, 3.347283, 1, 1, 1, 1, 1,
0.07067784, 1.169228, -0.2685399, 1, 1, 1, 1, 1,
0.07110849, -0.8531312, 2.934886, 1, 1, 1, 1, 1,
0.07210425, -0.9169586, 2.481043, 1, 1, 1, 1, 1,
0.07233626, -1.638158, 3.749825, 1, 1, 1, 1, 1,
0.07617582, 2.780395, -0.3479626, 1, 1, 1, 1, 1,
0.07799125, 0.7112433, -2.200869, 1, 1, 1, 1, 1,
0.07822917, 1.189622, 0.5107664, 1, 1, 1, 1, 1,
0.08428665, -0.07468931, 4.167234, 0, 0, 1, 1, 1,
0.08879182, -1.863973, 3.190546, 1, 0, 0, 1, 1,
0.09215846, 0.6604805, -0.8869489, 1, 0, 0, 1, 1,
0.09998807, 0.1965746, 0.3657129, 1, 0, 0, 1, 1,
0.1077716, 0.04540783, -0.9395995, 1, 0, 0, 1, 1,
0.115752, -0.5930713, 3.62694, 1, 0, 0, 1, 1,
0.1184436, 0.6029172, 0.682543, 0, 0, 0, 1, 1,
0.1292681, 1.225544, 0.4586087, 0, 0, 0, 1, 1,
0.1330016, -0.1695758, 2.822593, 0, 0, 0, 1, 1,
0.1334755, -0.7833557, 4.360771, 0, 0, 0, 1, 1,
0.1346196, 0.7437486, 1.229945, 0, 0, 0, 1, 1,
0.1349709, 0.9928716, 1.877766, 0, 0, 0, 1, 1,
0.1471963, -0.9775461, 2.647899, 0, 0, 0, 1, 1,
0.1549483, -1.68925, 2.983586, 1, 1, 1, 1, 1,
0.1581458, -0.1057809, 1.286463, 1, 1, 1, 1, 1,
0.1601813, -0.9143224, 2.873734, 1, 1, 1, 1, 1,
0.1664545, 0.5507869, 0.2658975, 1, 1, 1, 1, 1,
0.1699882, -0.4153984, 1.466158, 1, 1, 1, 1, 1,
0.1706039, -1.705457, 1.994581, 1, 1, 1, 1, 1,
0.1751412, 0.529968, 1.316383, 1, 1, 1, 1, 1,
0.1763852, -0.4757551, 2.029229, 1, 1, 1, 1, 1,
0.1828763, 0.07192937, 2.086857, 1, 1, 1, 1, 1,
0.1842536, 0.7425706, 0.870129, 1, 1, 1, 1, 1,
0.1867914, -0.06865166, 2.659888, 1, 1, 1, 1, 1,
0.1878764, 0.3130077, 1.193162, 1, 1, 1, 1, 1,
0.1881177, 0.1122433, 2.184574, 1, 1, 1, 1, 1,
0.18835, 1.472213, 2.126936, 1, 1, 1, 1, 1,
0.1919244, -1.495354, 4.056592, 1, 1, 1, 1, 1,
0.1931027, 0.841282, -0.3664152, 0, 0, 1, 1, 1,
0.1957701, -0.5300218, 1.788056, 1, 0, 0, 1, 1,
0.1989487, 0.350859, 1.679104, 1, 0, 0, 1, 1,
0.2003734, 0.06406838, 1.744866, 1, 0, 0, 1, 1,
0.2017289, 0.01779048, 1.095442, 1, 0, 0, 1, 1,
0.2035911, 0.9981859, -2.071541, 1, 0, 0, 1, 1,
0.2049735, 2.158351, -1.559521, 0, 0, 0, 1, 1,
0.2111751, 1.260726, 1.543485, 0, 0, 0, 1, 1,
0.2125964, 0.1277422, 2.073195, 0, 0, 0, 1, 1,
0.2148897, 0.5050803, -0.5701797, 0, 0, 0, 1, 1,
0.2192645, 0.5355331, -0.7392265, 0, 0, 0, 1, 1,
0.2229609, 0.6751274, 0.4135853, 0, 0, 0, 1, 1,
0.2235459, -0.7748327, 2.477782, 0, 0, 0, 1, 1,
0.2255574, -0.1594506, 3.053383, 1, 1, 1, 1, 1,
0.2332681, 0.6270712, 0.6570903, 1, 1, 1, 1, 1,
0.2347276, -0.5122355, 3.720212, 1, 1, 1, 1, 1,
0.2416037, 0.6243007, 1.938799, 1, 1, 1, 1, 1,
0.2431362, 1.12268, 0.9414587, 1, 1, 1, 1, 1,
0.2480814, -0.782856, 1.882535, 1, 1, 1, 1, 1,
0.2493565, 0.5783926, 1.53037, 1, 1, 1, 1, 1,
0.2518856, 0.3411123, 0.08106293, 1, 1, 1, 1, 1,
0.2522933, -1.71101, 3.775584, 1, 1, 1, 1, 1,
0.2561938, -0.2024366, 2.713708, 1, 1, 1, 1, 1,
0.2595755, 0.5395275, 1.24426, 1, 1, 1, 1, 1,
0.2630775, 0.1220667, 2.303683, 1, 1, 1, 1, 1,
0.2646104, -1.696272, 3.072052, 1, 1, 1, 1, 1,
0.2649641, -1.496597, 1.451208, 1, 1, 1, 1, 1,
0.2745142, -0.995413, 3.793371, 1, 1, 1, 1, 1,
0.2755608, 0.1425924, 0.5949274, 0, 0, 1, 1, 1,
0.2765202, -1.394782, 3.794962, 1, 0, 0, 1, 1,
0.2765233, -0.2481411, 1.863236, 1, 0, 0, 1, 1,
0.2796003, -0.44313, 3.230563, 1, 0, 0, 1, 1,
0.2807131, 1.973541, -0.1158662, 1, 0, 0, 1, 1,
0.2828873, -2.37551, 1.711139, 1, 0, 0, 1, 1,
0.283257, 1.477182, -0.4976561, 0, 0, 0, 1, 1,
0.2859222, 0.7905106, -1.253646, 0, 0, 0, 1, 1,
0.2879183, 0.6906909, 1.084338, 0, 0, 0, 1, 1,
0.2880001, 0.282721, 0.5866967, 0, 0, 0, 1, 1,
0.2889879, 0.8800578, -0.7178445, 0, 0, 0, 1, 1,
0.2892949, -0.1239718, 2.623974, 0, 0, 0, 1, 1,
0.2903756, 1.586803, -0.8217768, 0, 0, 0, 1, 1,
0.294668, -0.3678129, 3.155023, 1, 1, 1, 1, 1,
0.2962526, 0.6278706, -2.205298, 1, 1, 1, 1, 1,
0.2985144, -1.11492, 2.505237, 1, 1, 1, 1, 1,
0.2992508, -0.6572921, 3.125714, 1, 1, 1, 1, 1,
0.3017486, 0.008967232, 3.071088, 1, 1, 1, 1, 1,
0.3057432, -0.2968664, 2.724014, 1, 1, 1, 1, 1,
0.3077474, 0.3609228, 1.025488, 1, 1, 1, 1, 1,
0.3082688, 0.7620369, -1.369341, 1, 1, 1, 1, 1,
0.3086963, 0.4705682, -1.782535, 1, 1, 1, 1, 1,
0.3104091, 0.2321042, 1.66315, 1, 1, 1, 1, 1,
0.3113613, -0.3259261, 1.744222, 1, 1, 1, 1, 1,
0.3121323, -0.08239461, 1.163664, 1, 1, 1, 1, 1,
0.3122456, -0.5862477, 2.296647, 1, 1, 1, 1, 1,
0.3145274, -1.72727, 2.106472, 1, 1, 1, 1, 1,
0.3145584, 1.110038, 1.809046, 1, 1, 1, 1, 1,
0.315711, 0.3850886, -0.5349531, 0, 0, 1, 1, 1,
0.3177194, -0.4968179, 1.743039, 1, 0, 0, 1, 1,
0.3212417, 0.2860093, 0.7936157, 1, 0, 0, 1, 1,
0.3234571, -0.567428, 2.957239, 1, 0, 0, 1, 1,
0.3288584, 0.6608314, 1.651651, 1, 0, 0, 1, 1,
0.3318281, 0.09117452, 1.564398, 1, 0, 0, 1, 1,
0.3342583, 0.2426993, 0.3657933, 0, 0, 0, 1, 1,
0.3372886, 1.041108, 0.5109323, 0, 0, 0, 1, 1,
0.3398663, 0.780559, 2.276318, 0, 0, 0, 1, 1,
0.3399029, 0.9707546, 0.6492923, 0, 0, 0, 1, 1,
0.3400882, -0.5142595, 2.89048, 0, 0, 0, 1, 1,
0.3426659, 0.226493, 1.024424, 0, 0, 0, 1, 1,
0.3436987, 0.182553, 0.6210942, 0, 0, 0, 1, 1,
0.34553, -0.5189591, 2.998541, 1, 1, 1, 1, 1,
0.3458097, -1.546675, 2.885864, 1, 1, 1, 1, 1,
0.3469867, 1.53195, 0.4280584, 1, 1, 1, 1, 1,
0.349995, -0.1794735, 2.788573, 1, 1, 1, 1, 1,
0.3552779, 1.000896, -0.3143319, 1, 1, 1, 1, 1,
0.3562949, -0.02843223, 3.041043, 1, 1, 1, 1, 1,
0.3573165, -0.6908156, 2.317875, 1, 1, 1, 1, 1,
0.3617066, -1.200295, 1.055054, 1, 1, 1, 1, 1,
0.3623935, -0.6871482, 2.467135, 1, 1, 1, 1, 1,
0.3644696, -0.3190565, 2.392316, 1, 1, 1, 1, 1,
0.3672539, 1.386629, 0.9037149, 1, 1, 1, 1, 1,
0.3700127, -0.8713384, 2.147388, 1, 1, 1, 1, 1,
0.3717843, 1.303991, -0.0163219, 1, 1, 1, 1, 1,
0.3770953, 0.753845, -1.395331, 1, 1, 1, 1, 1,
0.3839545, 0.1125754, 0.5701652, 1, 1, 1, 1, 1,
0.3875451, 0.3632441, 1.498578, 0, 0, 1, 1, 1,
0.3876022, 0.1518745, 1.850539, 1, 0, 0, 1, 1,
0.3963112, -1.028482, 3.205143, 1, 0, 0, 1, 1,
0.3995588, -0.1553393, 2.1051, 1, 0, 0, 1, 1,
0.4016624, -0.1696613, 1.177458, 1, 0, 0, 1, 1,
0.4022829, -0.5009308, 1.931669, 1, 0, 0, 1, 1,
0.4046727, -0.1269204, 2.764616, 0, 0, 0, 1, 1,
0.4084453, -0.4463189, 3.271878, 0, 0, 0, 1, 1,
0.4088795, 0.19391, 0.9134678, 0, 0, 0, 1, 1,
0.4110881, -0.6134304, 1.540126, 0, 0, 0, 1, 1,
0.4119019, 1.783781, 0.1402434, 0, 0, 0, 1, 1,
0.416024, 0.8271465, 0.7446702, 0, 0, 0, 1, 1,
0.419194, 0.6287995, 1.195248, 0, 0, 0, 1, 1,
0.4198911, 0.2077953, 1.184372, 1, 1, 1, 1, 1,
0.4222084, 0.9711991, -1.091001, 1, 1, 1, 1, 1,
0.4266187, -0.03093651, -0.3342668, 1, 1, 1, 1, 1,
0.4271233, -1.161404, 4.057633, 1, 1, 1, 1, 1,
0.4274233, 1.181518, 1.876058, 1, 1, 1, 1, 1,
0.4279014, -0.8608624, 1.117063, 1, 1, 1, 1, 1,
0.4335924, -0.5476115, 3.912383, 1, 1, 1, 1, 1,
0.437904, 0.400843, 2.157095, 1, 1, 1, 1, 1,
0.4411227, 0.8694282, 2.185545, 1, 1, 1, 1, 1,
0.4476526, -0.01671534, 1.509025, 1, 1, 1, 1, 1,
0.448197, 0.03059368, -0.4513152, 1, 1, 1, 1, 1,
0.4496726, -0.1471821, 0.1707375, 1, 1, 1, 1, 1,
0.452239, 1.592995, 1.995698, 1, 1, 1, 1, 1,
0.4558806, 1.36383, 1.899281, 1, 1, 1, 1, 1,
0.4609112, -1.529284, 2.386175, 1, 1, 1, 1, 1,
0.4635481, -0.9153579, 4.293598, 0, 0, 1, 1, 1,
0.4677115, 0.170639, 1.626293, 1, 0, 0, 1, 1,
0.4685923, 0.4166181, 0.5880399, 1, 0, 0, 1, 1,
0.471846, 1.376898, 0.4901772, 1, 0, 0, 1, 1,
0.4726589, -1.5698, 1.560092, 1, 0, 0, 1, 1,
0.4728476, 1.178688, 1.435808, 1, 0, 0, 1, 1,
0.4771718, 0.007304695, 1.002342, 0, 0, 0, 1, 1,
0.4802137, -0.6391116, 4.350648, 0, 0, 0, 1, 1,
0.4820983, 0.2960335, 0.9447532, 0, 0, 0, 1, 1,
0.4821685, 1.413574, -0.44793, 0, 0, 0, 1, 1,
0.4872042, -1.030632, 3.617565, 0, 0, 0, 1, 1,
0.4927214, -1.193442, 0.9097311, 0, 0, 0, 1, 1,
0.4994127, 0.8947138, -0.04226866, 0, 0, 0, 1, 1,
0.5010129, -0.2658373, 0.8611254, 1, 1, 1, 1, 1,
0.5012864, -0.7019694, 2.520133, 1, 1, 1, 1, 1,
0.5033425, 0.4640672, 2.332006, 1, 1, 1, 1, 1,
0.5035774, 0.1064003, 2.212458, 1, 1, 1, 1, 1,
0.5080301, 1.109447, 0.2355618, 1, 1, 1, 1, 1,
0.5103195, 0.7477517, 0.3543853, 1, 1, 1, 1, 1,
0.5118577, 0.2922945, 3.102186, 1, 1, 1, 1, 1,
0.5175895, 0.3891031, -0.8019037, 1, 1, 1, 1, 1,
0.5189695, 0.745722, 2.174006, 1, 1, 1, 1, 1,
0.520362, 0.5110542, 0.3190391, 1, 1, 1, 1, 1,
0.5272157, -0.7970631, 2.792778, 1, 1, 1, 1, 1,
0.5403327, 0.9965445, 0.4668502, 1, 1, 1, 1, 1,
0.5409306, 0.3226634, 3.208644, 1, 1, 1, 1, 1,
0.5420841, 0.2526261, 1.092765, 1, 1, 1, 1, 1,
0.5440388, 1.644563, 1.733674, 1, 1, 1, 1, 1,
0.5474067, 0.4327207, 0.9492246, 0, 0, 1, 1, 1,
0.5496006, -0.334653, 3.146638, 1, 0, 0, 1, 1,
0.5503911, -0.7722185, 3.151132, 1, 0, 0, 1, 1,
0.5514603, 0.6681402, 0.326641, 1, 0, 0, 1, 1,
0.5532981, -0.4084655, 0.9559303, 1, 0, 0, 1, 1,
0.554283, -0.2339909, 3.088344, 1, 0, 0, 1, 1,
0.554361, -0.3057024, 1.86618, 0, 0, 0, 1, 1,
0.559145, 0.2523303, 0.3799153, 0, 0, 0, 1, 1,
0.5591631, -1.138534, 3.77414, 0, 0, 0, 1, 1,
0.5597782, 1.289901, 1.139866, 0, 0, 0, 1, 1,
0.5605569, -1.713689, 4.163611, 0, 0, 0, 1, 1,
0.5645506, 1.492216, 0.0577813, 0, 0, 0, 1, 1,
0.5645968, 1.086848, 0.05512927, 0, 0, 0, 1, 1,
0.5689837, 0.0146007, 0.04488799, 1, 1, 1, 1, 1,
0.5732568, 0.3007333, -1.253665, 1, 1, 1, 1, 1,
0.5736347, -2.165092, 2.317265, 1, 1, 1, 1, 1,
0.5818248, 0.2607208, 2.010892, 1, 1, 1, 1, 1,
0.5849375, -0.2331469, 2.073387, 1, 1, 1, 1, 1,
0.5913241, 0.7983218, -0.6636176, 1, 1, 1, 1, 1,
0.5916567, 0.6731524, 1.219712, 1, 1, 1, 1, 1,
0.5957759, 0.1822339, 1.084584, 1, 1, 1, 1, 1,
0.6019703, -0.03954733, 1.204538, 1, 1, 1, 1, 1,
0.6034775, 0.6968732, 1.055181, 1, 1, 1, 1, 1,
0.6101528, -1.306911, 4.198631, 1, 1, 1, 1, 1,
0.6114326, 0.8006983, 1.030125, 1, 1, 1, 1, 1,
0.6130269, -0.7987367, 1.408836, 1, 1, 1, 1, 1,
0.613847, -0.4014665, 2.58464, 1, 1, 1, 1, 1,
0.6179849, -0.9339631, 1.680613, 1, 1, 1, 1, 1,
0.6192484, 0.1573889, 1.395737, 0, 0, 1, 1, 1,
0.6238102, -1.528783, 2.604806, 1, 0, 0, 1, 1,
0.6272804, 1.112684, 0.09448034, 1, 0, 0, 1, 1,
0.6300957, 0.8271036, -0.1882346, 1, 0, 0, 1, 1,
0.6329645, -0.5691468, 2.516306, 1, 0, 0, 1, 1,
0.6337326, 1.315923, 0.5792251, 1, 0, 0, 1, 1,
0.6359962, 0.8142991, -0.07449891, 0, 0, 0, 1, 1,
0.6386086, 0.1667545, 0.7889895, 0, 0, 0, 1, 1,
0.6412979, 1.359617, -0.3132094, 0, 0, 0, 1, 1,
0.6450269, -0.9929872, 2.683796, 0, 0, 0, 1, 1,
0.6502658, 1.566828, 1.099604, 0, 0, 0, 1, 1,
0.6515104, -0.8936026, -0.1263333, 0, 0, 0, 1, 1,
0.6518312, -1.00129, 1.664376, 0, 0, 0, 1, 1,
0.6625927, 0.990034, 0.1107301, 1, 1, 1, 1, 1,
0.6651245, -1.947122, 2.818876, 1, 1, 1, 1, 1,
0.6652333, 1.882199, 0.4992112, 1, 1, 1, 1, 1,
0.6685987, 0.2250473, 0.7006511, 1, 1, 1, 1, 1,
0.6690485, -0.2080642, 2.619825, 1, 1, 1, 1, 1,
0.6707795, -1.504205, 0.6476273, 1, 1, 1, 1, 1,
0.6722494, 0.4771089, 2.044481, 1, 1, 1, 1, 1,
0.6734081, 0.7843444, -0.5801355, 1, 1, 1, 1, 1,
0.6743219, -0.7695628, 3.152725, 1, 1, 1, 1, 1,
0.6813528, 0.5030453, 1.164982, 1, 1, 1, 1, 1,
0.6846402, 1.729611, 1.092679, 1, 1, 1, 1, 1,
0.6848647, -0.8380852, 1.300965, 1, 1, 1, 1, 1,
0.6859308, -0.1168802, -0.5238191, 1, 1, 1, 1, 1,
0.6924133, 0.7036837, -1.393685, 1, 1, 1, 1, 1,
0.7027742, 0.8182357, 0.5187362, 1, 1, 1, 1, 1,
0.703339, -0.6742595, 3.366997, 0, 0, 1, 1, 1,
0.7035286, 0.1874914, 0.3386513, 1, 0, 0, 1, 1,
0.7102858, 1.499207, -0.3229481, 1, 0, 0, 1, 1,
0.7111264, -1.08658, 4.750097, 1, 0, 0, 1, 1,
0.7117681, 1.163513, 0.5190405, 1, 0, 0, 1, 1,
0.7129357, 1.084262, 0.9873926, 1, 0, 0, 1, 1,
0.7156178, -2.15031, 1.481359, 0, 0, 0, 1, 1,
0.7170558, -0.02539844, 2.147899, 0, 0, 0, 1, 1,
0.7202469, 0.02407515, 2.649053, 0, 0, 0, 1, 1,
0.7224209, 0.653906, 0.7860702, 0, 0, 0, 1, 1,
0.7254778, 2.079623, -1.29603, 0, 0, 0, 1, 1,
0.7258331, 0.2898869, 1.322386, 0, 0, 0, 1, 1,
0.7288463, -2.215286, 1.947405, 0, 0, 0, 1, 1,
0.7296599, 0.3175209, 0.6395597, 1, 1, 1, 1, 1,
0.7338715, 0.1361481, 1.302713, 1, 1, 1, 1, 1,
0.7404073, 2.394975, -0.001156398, 1, 1, 1, 1, 1,
0.7412215, -0.235543, 1.978241, 1, 1, 1, 1, 1,
0.7423992, -1.099414, 2.36591, 1, 1, 1, 1, 1,
0.7456241, 0.6756105, 0.467139, 1, 1, 1, 1, 1,
0.7467446, 2.612972, 0.2632503, 1, 1, 1, 1, 1,
0.7481304, -0.5300088, 1.722192, 1, 1, 1, 1, 1,
0.7486698, 1.28902, 1.275994, 1, 1, 1, 1, 1,
0.7562817, 0.005887197, 0.7457542, 1, 1, 1, 1, 1,
0.7571753, 0.1831041, -0.8771172, 1, 1, 1, 1, 1,
0.7761626, 0.2910571, 2.426748, 1, 1, 1, 1, 1,
0.7770441, -0.261488, -0.7760292, 1, 1, 1, 1, 1,
0.7802176, 0.82891, 2.918762, 1, 1, 1, 1, 1,
0.7847319, 0.3132851, 3.397969, 1, 1, 1, 1, 1,
0.7867106, -1.108734, 2.110597, 0, 0, 1, 1, 1,
0.7930304, 0.218082, 0.8376748, 1, 0, 0, 1, 1,
0.7931163, 0.6727063, 1.181597, 1, 0, 0, 1, 1,
0.7973729, 1.130193, 0.8582417, 1, 0, 0, 1, 1,
0.8043573, 0.6726981, 1.237595, 1, 0, 0, 1, 1,
0.8066676, -2.41785, 2.212996, 1, 0, 0, 1, 1,
0.8193113, -0.6192352, 2.885591, 0, 0, 0, 1, 1,
0.8340803, 0.08971168, 0.3065226, 0, 0, 0, 1, 1,
0.8367378, -0.3482353, 0.8394423, 0, 0, 0, 1, 1,
0.8442671, -0.6221138, 0.8886687, 0, 0, 0, 1, 1,
0.8567054, -0.3278016, 3.295366, 0, 0, 0, 1, 1,
0.8594478, 1.110039, 0.7750791, 0, 0, 0, 1, 1,
0.8653916, -0.747861, 1.753596, 0, 0, 0, 1, 1,
0.8672469, -1.948815, 2.974199, 1, 1, 1, 1, 1,
0.8787726, -0.3271737, 1.008048, 1, 1, 1, 1, 1,
0.9012311, 0.6440125, -0.5027438, 1, 1, 1, 1, 1,
0.9013421, -1.600103, 0.5655566, 1, 1, 1, 1, 1,
0.9113119, -0.8565232, 3.42839, 1, 1, 1, 1, 1,
0.9150285, 0.3272009, 1.377645, 1, 1, 1, 1, 1,
0.9164909, -1.190163, 1.502802, 1, 1, 1, 1, 1,
0.920067, 0.06716108, 1.958373, 1, 1, 1, 1, 1,
0.9204903, 0.2800095, 0.6459476, 1, 1, 1, 1, 1,
0.9236904, 0.7399163, 0.2225248, 1, 1, 1, 1, 1,
0.927326, 0.1269095, 2.225641, 1, 1, 1, 1, 1,
0.9346664, 0.1980409, 1.28775, 1, 1, 1, 1, 1,
0.9351836, -0.6233158, 0.6271806, 1, 1, 1, 1, 1,
0.9361192, 0.8966253, 0.1922298, 1, 1, 1, 1, 1,
0.9486035, -0.06413081, 2.508176, 1, 1, 1, 1, 1,
0.9518111, -0.8705291, 2.884705, 0, 0, 1, 1, 1,
0.9556135, -0.96773, 2.362071, 1, 0, 0, 1, 1,
0.9567561, 2.380754, 0.7978178, 1, 0, 0, 1, 1,
0.961201, -1.402761, 1.945526, 1, 0, 0, 1, 1,
0.9629546, 0.2203827, 0.3914806, 1, 0, 0, 1, 1,
0.9634715, 0.04509612, 0.745182, 1, 0, 0, 1, 1,
0.9925703, 0.1288906, 2.341647, 0, 0, 0, 1, 1,
0.9942304, -0.6409838, 1.358444, 0, 0, 0, 1, 1,
0.994421, -0.699168, 1.163464, 0, 0, 0, 1, 1,
0.9951221, 0.4583939, 1.373184, 0, 0, 0, 1, 1,
0.9990898, -0.4077357, 0.3235363, 0, 0, 0, 1, 1,
1.001879, 1.440601, 1.385423, 0, 0, 0, 1, 1,
1.002116, 0.2053364, 0.8504696, 0, 0, 0, 1, 1,
1.007327, -0.9289604, 2.121614, 1, 1, 1, 1, 1,
1.008327, 0.2017761, 0.961283, 1, 1, 1, 1, 1,
1.016732, 1.310294, -0.4686377, 1, 1, 1, 1, 1,
1.017066, 1.385612, 0.5050367, 1, 1, 1, 1, 1,
1.021763, 1.209939, -0.1469043, 1, 1, 1, 1, 1,
1.027174, -1.290944, 1.637516, 1, 1, 1, 1, 1,
1.0277, -0.7785935, 3.050028, 1, 1, 1, 1, 1,
1.028362, -0.3239061, 2.912548, 1, 1, 1, 1, 1,
1.028913, -0.1888873, 2.32542, 1, 1, 1, 1, 1,
1.032568, -0.1904534, 1.513499, 1, 1, 1, 1, 1,
1.033129, 1.071699, -0.07857458, 1, 1, 1, 1, 1,
1.033582, 0.7019671, -0.2215425, 1, 1, 1, 1, 1,
1.038082, 0.4389923, 3.244231, 1, 1, 1, 1, 1,
1.038885, -0.0245193, 2.348122, 1, 1, 1, 1, 1,
1.041055, 0.04957227, 3.464021, 1, 1, 1, 1, 1,
1.041206, 1.448095, 0.9366957, 0, 0, 1, 1, 1,
1.044757, -0.2419469, 0.8169755, 1, 0, 0, 1, 1,
1.045181, 1.487912, 0.729376, 1, 0, 0, 1, 1,
1.045855, -0.3582526, 0.5222798, 1, 0, 0, 1, 1,
1.049225, -0.1500342, 2.033596, 1, 0, 0, 1, 1,
1.050403, -0.306969, 2.840848, 1, 0, 0, 1, 1,
1.060531, 1.732193, -0.2175639, 0, 0, 0, 1, 1,
1.06457, -0.3295071, 2.079965, 0, 0, 0, 1, 1,
1.065668, -1.052665, 1.29681, 0, 0, 0, 1, 1,
1.066895, -2.225033, 3.309165, 0, 0, 0, 1, 1,
1.076939, 1.756777, 0.1422941, 0, 0, 0, 1, 1,
1.07722, 0.02070144, 2.969945, 0, 0, 0, 1, 1,
1.08531, -0.0913688, 2.100039, 0, 0, 0, 1, 1,
1.087232, -0.7910925, 3.106963, 1, 1, 1, 1, 1,
1.091082, 0.5998069, 0.03794962, 1, 1, 1, 1, 1,
1.092471, -0.3814835, 2.9521, 1, 1, 1, 1, 1,
1.098006, -1.123785, 1.815209, 1, 1, 1, 1, 1,
1.102288, -0.3876034, 2.696852, 1, 1, 1, 1, 1,
1.103846, -0.4309983, 2.921272, 1, 1, 1, 1, 1,
1.106586, 0.5738309, 0.6011184, 1, 1, 1, 1, 1,
1.108616, -1.868313, 2.914249, 1, 1, 1, 1, 1,
1.116676, 1.337212, 2.902119, 1, 1, 1, 1, 1,
1.117584, 1.415283, 1.004889, 1, 1, 1, 1, 1,
1.12076, -0.9699255, 1.450286, 1, 1, 1, 1, 1,
1.134887, 0.5395018, 2.225489, 1, 1, 1, 1, 1,
1.138573, 0.00783899, 1.467782, 1, 1, 1, 1, 1,
1.14309, -1.27713, 2.307149, 1, 1, 1, 1, 1,
1.150565, -0.2316466, 3.401801, 1, 1, 1, 1, 1,
1.152245, -0.5161124, 2.482846, 0, 0, 1, 1, 1,
1.152892, -0.1607977, 2.590761, 1, 0, 0, 1, 1,
1.158588, -0.71189, 2.831848, 1, 0, 0, 1, 1,
1.162619, 0.3067752, 1.95126, 1, 0, 0, 1, 1,
1.165565, -0.8977405, 3.274543, 1, 0, 0, 1, 1,
1.167096, -1.734521, 3.090565, 1, 0, 0, 1, 1,
1.167651, -0.850969, 1.771254, 0, 0, 0, 1, 1,
1.171781, 0.5853161, 0.6362299, 0, 0, 0, 1, 1,
1.17199, 0.2827639, 1.275011, 0, 0, 0, 1, 1,
1.182385, -1.066346, 2.127552, 0, 0, 0, 1, 1,
1.183036, 0.9845404, 1.959538, 0, 0, 0, 1, 1,
1.18542, -1.004396, 2.43315, 0, 0, 0, 1, 1,
1.188276, -0.4244521, 4.051338, 0, 0, 0, 1, 1,
1.190964, -1.912302, 1.877688, 1, 1, 1, 1, 1,
1.191198, 2.28522, -0.3623506, 1, 1, 1, 1, 1,
1.193538, -0.865934, 1.841718, 1, 1, 1, 1, 1,
1.197989, -1.054742, 3.51796, 1, 1, 1, 1, 1,
1.198461, -0.05690648, 1.543471, 1, 1, 1, 1, 1,
1.210646, 0.1531461, 0.2433465, 1, 1, 1, 1, 1,
1.213028, 0.8111359, 0.8898641, 1, 1, 1, 1, 1,
1.218796, -0.1730651, 2.421694, 1, 1, 1, 1, 1,
1.224947, -0.3701666, 2.422999, 1, 1, 1, 1, 1,
1.228168, -0.5869691, 2.903331, 1, 1, 1, 1, 1,
1.230392, -0.5878229, 2.836862, 1, 1, 1, 1, 1,
1.23096, 0.3430969, 0.8051689, 1, 1, 1, 1, 1,
1.242176, 1.266822, 2.710836, 1, 1, 1, 1, 1,
1.243183, 0.9742658, 0.5890129, 1, 1, 1, 1, 1,
1.250871, 0.1045295, 0.7463847, 1, 1, 1, 1, 1,
1.266116, 0.07554433, 2.003411, 0, 0, 1, 1, 1,
1.266157, 1.662405, -0.382218, 1, 0, 0, 1, 1,
1.272531, -1.185574, 2.673369, 1, 0, 0, 1, 1,
1.275517, -0.1835768, 0.9387758, 1, 0, 0, 1, 1,
1.2786, 1.054774, 1.598464, 1, 0, 0, 1, 1,
1.284748, 1.890987, -0.3644904, 1, 0, 0, 1, 1,
1.295485, 1.170073, 0.2189065, 0, 0, 0, 1, 1,
1.299521, -1.301573, 1.772984, 0, 0, 0, 1, 1,
1.301516, -0.8187351, 2.141722, 0, 0, 0, 1, 1,
1.318199, 0.723744, 2.27602, 0, 0, 0, 1, 1,
1.330263, -2.088548, 1.104977, 0, 0, 0, 1, 1,
1.331298, 1.711867, 1.881015, 0, 0, 0, 1, 1,
1.332971, -0.4014221, 2.320351, 0, 0, 0, 1, 1,
1.335231, 0.08524032, 0.8052257, 1, 1, 1, 1, 1,
1.33834, -0.5445598, 3.067393, 1, 1, 1, 1, 1,
1.347034, 0.9641649, 1.261013, 1, 1, 1, 1, 1,
1.355545, 0.2451396, 1.260464, 1, 1, 1, 1, 1,
1.357891, 0.3314905, 0.1669826, 1, 1, 1, 1, 1,
1.360734, 0.4468235, 2.344287, 1, 1, 1, 1, 1,
1.364648, 1.508624, 1.68959, 1, 1, 1, 1, 1,
1.368855, 1.180428, 2.5915, 1, 1, 1, 1, 1,
1.369481, 0.7635567, 3.760176, 1, 1, 1, 1, 1,
1.370329, -1.302775, 2.203538, 1, 1, 1, 1, 1,
1.37707, 2.369948, 1.78185, 1, 1, 1, 1, 1,
1.379819, 1.727403, 0.6684843, 1, 1, 1, 1, 1,
1.386086, -0.9152704, 2.523327, 1, 1, 1, 1, 1,
1.386899, -0.2024547, 1.649091, 1, 1, 1, 1, 1,
1.39498, 0.1563959, 1.824083, 1, 1, 1, 1, 1,
1.399014, -2.116183, 2.94383, 0, 0, 1, 1, 1,
1.403089, -1.166925, 2.672409, 1, 0, 0, 1, 1,
1.42189, 0.01236639, 0.3175812, 1, 0, 0, 1, 1,
1.426962, 1.364224, 1.148859, 1, 0, 0, 1, 1,
1.430328, 0.732741, 0.1375954, 1, 0, 0, 1, 1,
1.434469, 0.05287635, 0.6750447, 1, 0, 0, 1, 1,
1.442416, 0.01521098, 0.3196141, 0, 0, 0, 1, 1,
1.458007, 0.538097, 0.5991327, 0, 0, 0, 1, 1,
1.481515, 0.08592956, 2.122202, 0, 0, 0, 1, 1,
1.501786, -1.133861, 1.440825, 0, 0, 0, 1, 1,
1.501995, -0.04744893, 1.503381, 0, 0, 0, 1, 1,
1.521461, -0.002396634, 2.226504, 0, 0, 0, 1, 1,
1.523187, -1.175102, 1.169933, 0, 0, 0, 1, 1,
1.537697, -0.4620608, 2.860264, 1, 1, 1, 1, 1,
1.54115, 1.904857, 1.695483, 1, 1, 1, 1, 1,
1.559053, -1.023594, 2.927933, 1, 1, 1, 1, 1,
1.565057, -1.620509, 2.181685, 1, 1, 1, 1, 1,
1.576571, 0.9022304, 0.2792386, 1, 1, 1, 1, 1,
1.579853, 0.3961, 2.460617, 1, 1, 1, 1, 1,
1.587466, 0.4659157, 1.361588, 1, 1, 1, 1, 1,
1.594384, -0.9001909, 2.914522, 1, 1, 1, 1, 1,
1.607374, 0.9730523, -0.1963362, 1, 1, 1, 1, 1,
1.609153, -0.3119574, 1.518684, 1, 1, 1, 1, 1,
1.621504, 1.106448, 1.623606, 1, 1, 1, 1, 1,
1.63479, -0.6490081, 1.555676, 1, 1, 1, 1, 1,
1.636677, 0.452766, 1.732144, 1, 1, 1, 1, 1,
1.645792, -1.575493, 2.563339, 1, 1, 1, 1, 1,
1.679862, -1.18792, 4.707656, 1, 1, 1, 1, 1,
1.688304, -0.3225977, 2.159562, 0, 0, 1, 1, 1,
1.695346, -1.368411, 2.467191, 1, 0, 0, 1, 1,
1.695518, -0.771691, 0.7979423, 1, 0, 0, 1, 1,
1.713426, 1.495061, 0.6957728, 1, 0, 0, 1, 1,
1.738641, -1.491256, 1.863097, 1, 0, 0, 1, 1,
1.744353, -0.7627907, 2.16947, 1, 0, 0, 1, 1,
1.748583, -0.1744506, 0.9324825, 0, 0, 0, 1, 1,
1.779111, -1.762737, 3.967452, 0, 0, 0, 1, 1,
1.779805, 0.4516521, 1.156879, 0, 0, 0, 1, 1,
1.780413, -0.9385031, 1.856514, 0, 0, 0, 1, 1,
1.781032, -0.8279108, 1.735213, 0, 0, 0, 1, 1,
1.794022, -0.3700757, 1.13641, 0, 0, 0, 1, 1,
1.798033, -0.3218533, 0.8304325, 0, 0, 0, 1, 1,
1.830953, -0.5933189, 1.211047, 1, 1, 1, 1, 1,
1.833167, 0.2578368, 0.8548027, 1, 1, 1, 1, 1,
1.840842, 0.8943509, 0.7213097, 1, 1, 1, 1, 1,
1.868197, 0.04854893, 2.378723, 1, 1, 1, 1, 1,
1.880561, 0.4251056, 2.648564, 1, 1, 1, 1, 1,
1.903214, -0.1926318, 2.967412, 1, 1, 1, 1, 1,
1.907923, -1.107135, 1.442118, 1, 1, 1, 1, 1,
1.919343, -0.1924243, 2.189066, 1, 1, 1, 1, 1,
1.943108, -0.2190216, 0.237656, 1, 1, 1, 1, 1,
1.946962, -1.035861, 3.412568, 1, 1, 1, 1, 1,
1.948667, 1.892422, 0.5549457, 1, 1, 1, 1, 1,
1.966302, -0.4297752, 1.845985, 1, 1, 1, 1, 1,
1.975157, 0.2299761, -0.8623822, 1, 1, 1, 1, 1,
2.002955, 0.3729655, 2.578875, 1, 1, 1, 1, 1,
2.039771, 0.10099, 3.206532, 1, 1, 1, 1, 1,
2.047615, -1.187859, 1.621978, 0, 0, 1, 1, 1,
2.08791, 0.05041683, 0.6696261, 1, 0, 0, 1, 1,
2.159416, -0.6267375, 2.155635, 1, 0, 0, 1, 1,
2.170501, -0.4346844, 1.671388, 1, 0, 0, 1, 1,
2.174784, -1.095835, 3.242497, 1, 0, 0, 1, 1,
2.17915, 1.110795, 0.5821165, 1, 0, 0, 1, 1,
2.204254, 1.222734, -0.08035889, 0, 0, 0, 1, 1,
2.218642, -1.093393, 1.680698, 0, 0, 0, 1, 1,
2.222424, -0.8158134, 0.4513291, 0, 0, 0, 1, 1,
2.24197, -1.805353, 1.957524, 0, 0, 0, 1, 1,
2.273757, 0.2625656, 0.9782223, 0, 0, 0, 1, 1,
2.288379, 0.5104685, 2.384954, 0, 0, 0, 1, 1,
2.316482, -0.1575579, 1.857404, 0, 0, 0, 1, 1,
2.435758, -0.3291435, 2.888844, 1, 1, 1, 1, 1,
2.447091, 0.2307869, 1.299716, 1, 1, 1, 1, 1,
2.465304, 0.9165536, 1.062182, 1, 1, 1, 1, 1,
2.531842, -1.033338, 2.874537, 1, 1, 1, 1, 1,
2.712758, -0.5112171, 2.578349, 1, 1, 1, 1, 1,
2.972847, -0.3074895, 0.394028, 1, 1, 1, 1, 1,
3.605975, -0.6620628, 1.968459, 1, 1, 1, 1, 1
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
var radius = 9.590882;
var distance = 33.68756;
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
mvMatrix.translate( -0.2847281, 0.01584566, 0.007472754 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68756);
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
