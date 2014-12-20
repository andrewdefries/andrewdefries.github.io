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
-3.295061, 0.5198572, -1.949061, 1, 0, 0, 1,
-3.02382, 1.103452, -1.047459, 1, 0.007843138, 0, 1,
-2.997654, -1.316971, -2.977613, 1, 0.01176471, 0, 1,
-2.910205, 0.4118316, -0.3744827, 1, 0.01960784, 0, 1,
-2.815619, -0.3557163, 0.08198705, 1, 0.02352941, 0, 1,
-2.506608, -0.8375509, -0.8999422, 1, 0.03137255, 0, 1,
-2.504694, 1.009933, -0.1461394, 1, 0.03529412, 0, 1,
-2.483461, -2.457652, -2.321419, 1, 0.04313726, 0, 1,
-2.448472, -1.195617, -1.650994, 1, 0.04705882, 0, 1,
-2.42111, 0.1360115, -1.126911, 1, 0.05490196, 0, 1,
-2.364957, 0.01006461, -3.263603, 1, 0.05882353, 0, 1,
-2.305411, -0.5907258, -0.9926171, 1, 0.06666667, 0, 1,
-2.245722, -1.694464, -2.543917, 1, 0.07058824, 0, 1,
-2.188559, 0.2772275, 0.2653825, 1, 0.07843138, 0, 1,
-2.182382, -0.4205492, -2.641384, 1, 0.08235294, 0, 1,
-2.182339, 0.4809022, -1.068257, 1, 0.09019608, 0, 1,
-2.172469, -0.6058497, -2.840538, 1, 0.09411765, 0, 1,
-2.164788, 2.040621, -1.097577, 1, 0.1019608, 0, 1,
-2.137188, -0.317501, -1.189817, 1, 0.1098039, 0, 1,
-2.104568, -0.03882515, -1.368094, 1, 0.1137255, 0, 1,
-2.099128, -2.07975, -1.353962, 1, 0.1215686, 0, 1,
-2.063869, 0.6598243, -0.5265071, 1, 0.1254902, 0, 1,
-2.058477, -0.1954489, -2.729442, 1, 0.1333333, 0, 1,
-2.043617, -0.4075129, -1.490896, 1, 0.1372549, 0, 1,
-1.987287, -0.0002514046, -0.9980264, 1, 0.145098, 0, 1,
-1.974972, 0.06051831, -1.711682, 1, 0.1490196, 0, 1,
-1.956537, -0.3251346, -0.554113, 1, 0.1568628, 0, 1,
-1.897935, -0.1832581, -1.234685, 1, 0.1607843, 0, 1,
-1.897375, -1.204689, -1.729298, 1, 0.1686275, 0, 1,
-1.877081, 0.9551478, -2.311689, 1, 0.172549, 0, 1,
-1.856996, 1.002259, 0.4444267, 1, 0.1803922, 0, 1,
-1.843115, 0.3613828, -0.8935488, 1, 0.1843137, 0, 1,
-1.824907, 0.5740889, -1.816226, 1, 0.1921569, 0, 1,
-1.819428, -1.048085, -4.463152, 1, 0.1960784, 0, 1,
-1.786517, 0.6522923, -3.309251, 1, 0.2039216, 0, 1,
-1.777265, -1.603723, -2.213859, 1, 0.2117647, 0, 1,
-1.742942, -0.03391213, -2.407364, 1, 0.2156863, 0, 1,
-1.738783, -0.1605323, -2.559473, 1, 0.2235294, 0, 1,
-1.714142, -0.2604847, -1.207309, 1, 0.227451, 0, 1,
-1.68329, -1.088531, -1.141518, 1, 0.2352941, 0, 1,
-1.667922, -0.8737559, -2.508434, 1, 0.2392157, 0, 1,
-1.648254, -0.3909622, -0.01315621, 1, 0.2470588, 0, 1,
-1.638498, -0.7957397, -2.907383, 1, 0.2509804, 0, 1,
-1.637664, 1.278098, 0.2124388, 1, 0.2588235, 0, 1,
-1.619706, -0.3555408, -0.5086122, 1, 0.2627451, 0, 1,
-1.614148, 0.8848122, -0.5741118, 1, 0.2705882, 0, 1,
-1.599705, -0.008462708, -0.9459698, 1, 0.2745098, 0, 1,
-1.595582, 0.1212748, -2.920101, 1, 0.282353, 0, 1,
-1.592644, -0.1084925, -0.7645989, 1, 0.2862745, 0, 1,
-1.548945, -0.953257, -2.562509, 1, 0.2941177, 0, 1,
-1.543406, -0.9348846, -3.264732, 1, 0.3019608, 0, 1,
-1.537185, -0.46235, -1.817394, 1, 0.3058824, 0, 1,
-1.526363, -0.4068063, -2.334903, 1, 0.3137255, 0, 1,
-1.515839, -1.074804, -2.383583, 1, 0.3176471, 0, 1,
-1.515345, -0.4684604, -2.573263, 1, 0.3254902, 0, 1,
-1.515043, -0.2557073, -2.797212, 1, 0.3294118, 0, 1,
-1.512787, -1.249207, -2.853345, 1, 0.3372549, 0, 1,
-1.501602, -0.108606, -0.9909954, 1, 0.3411765, 0, 1,
-1.5015, -0.8659141, -1.553553, 1, 0.3490196, 0, 1,
-1.494349, 0.2961952, 0.3886595, 1, 0.3529412, 0, 1,
-1.479351, -0.2823469, -2.178995, 1, 0.3607843, 0, 1,
-1.468236, 0.439463, -2.027151, 1, 0.3647059, 0, 1,
-1.452939, 1.226197, -1.323443, 1, 0.372549, 0, 1,
-1.450092, -0.6838418, -2.418637, 1, 0.3764706, 0, 1,
-1.443662, 1.172796, -1.002637, 1, 0.3843137, 0, 1,
-1.436426, 2.191117, 0.5446645, 1, 0.3882353, 0, 1,
-1.434366, 0.349424, -2.329552, 1, 0.3960784, 0, 1,
-1.427792, 0.2173901, -1.08395, 1, 0.4039216, 0, 1,
-1.427014, -1.540541, 0.1744171, 1, 0.4078431, 0, 1,
-1.423017, 0.6663617, -2.099826, 1, 0.4156863, 0, 1,
-1.406673, -0.08715885, -1.39866, 1, 0.4196078, 0, 1,
-1.399874, -0.6549589, -2.324288, 1, 0.427451, 0, 1,
-1.398163, 0.8621444, 0.5147573, 1, 0.4313726, 0, 1,
-1.393565, 0.9305546, -2.029861, 1, 0.4392157, 0, 1,
-1.376126, 1.705577, -1.276693, 1, 0.4431373, 0, 1,
-1.36688, 0.4960107, -0.2221278, 1, 0.4509804, 0, 1,
-1.353078, 0.1037423, -0.918085, 1, 0.454902, 0, 1,
-1.340496, 0.5440951, -1.22465, 1, 0.4627451, 0, 1,
-1.337074, 0.1831178, -3.617325, 1, 0.4666667, 0, 1,
-1.330113, 0.4413145, -0.5426315, 1, 0.4745098, 0, 1,
-1.325144, -0.0227045, -2.056756, 1, 0.4784314, 0, 1,
-1.317291, 0.08015029, -1.860838, 1, 0.4862745, 0, 1,
-1.315495, 1.371514, -1.500012, 1, 0.4901961, 0, 1,
-1.305837, 0.3696499, -2.228301, 1, 0.4980392, 0, 1,
-1.302593, -0.9300046, -1.925028, 1, 0.5058824, 0, 1,
-1.296177, 0.549476, -1.838452, 1, 0.509804, 0, 1,
-1.285174, -0.1660643, -1.238583, 1, 0.5176471, 0, 1,
-1.281015, -0.06763012, -2.087931, 1, 0.5215687, 0, 1,
-1.279724, -0.9995578, -3.261135, 1, 0.5294118, 0, 1,
-1.277449, -0.08688453, -0.7768444, 1, 0.5333334, 0, 1,
-1.27416, 1.465696, -0.3634506, 1, 0.5411765, 0, 1,
-1.271601, 0.2963084, -1.680424, 1, 0.5450981, 0, 1,
-1.269489, -1.416315, -3.159024, 1, 0.5529412, 0, 1,
-1.265275, -1.221456, -3.855556, 1, 0.5568628, 0, 1,
-1.264453, 0.7953063, 0.2989574, 1, 0.5647059, 0, 1,
-1.264391, -0.02173367, -3.390766, 1, 0.5686275, 0, 1,
-1.257548, 0.03771538, -0.3342839, 1, 0.5764706, 0, 1,
-1.256738, 1.458589, -1.018497, 1, 0.5803922, 0, 1,
-1.256716, 0.1404387, -0.733086, 1, 0.5882353, 0, 1,
-1.255718, 1.385487, 0.2839516, 1, 0.5921569, 0, 1,
-1.254036, 0.9305099, 0.4613358, 1, 0.6, 0, 1,
-1.244449, 0.04111129, -1.022898, 1, 0.6078432, 0, 1,
-1.243062, 1.351736, -1.009829, 1, 0.6117647, 0, 1,
-1.241208, -0.4349954, -2.49024, 1, 0.6196079, 0, 1,
-1.236529, -0.6486894, -2.969471, 1, 0.6235294, 0, 1,
-1.231682, -2.740306, -1.437076, 1, 0.6313726, 0, 1,
-1.229086, -0.6986182, -1.093198, 1, 0.6352941, 0, 1,
-1.222314, 1.351758, -0.2218469, 1, 0.6431373, 0, 1,
-1.21926, -1.222233, -2.309137, 1, 0.6470588, 0, 1,
-1.209431, -0.5862497, -3.294909, 1, 0.654902, 0, 1,
-1.206627, -1.129372, -1.523477, 1, 0.6588235, 0, 1,
-1.197868, 0.01317438, -2.159014, 1, 0.6666667, 0, 1,
-1.190912, 0.09266645, -1.393352, 1, 0.6705883, 0, 1,
-1.187717, -1.597252, -3.035562, 1, 0.6784314, 0, 1,
-1.186224, 0.5088185, -0.4139778, 1, 0.682353, 0, 1,
-1.183843, 1.364046, -1.218196, 1, 0.6901961, 0, 1,
-1.180887, -0.1552915, -1.732675, 1, 0.6941177, 0, 1,
-1.180097, -0.7404746, -0.5382413, 1, 0.7019608, 0, 1,
-1.176114, 0.1463211, -2.552496, 1, 0.7098039, 0, 1,
-1.174052, 1.07561, 0.1746439, 1, 0.7137255, 0, 1,
-1.1668, -1.306044, -2.557205, 1, 0.7215686, 0, 1,
-1.165334, 0.6261261, -2.311528, 1, 0.7254902, 0, 1,
-1.16378, 1.825239, -1.018076, 1, 0.7333333, 0, 1,
-1.153577, -0.625303, -1.510957, 1, 0.7372549, 0, 1,
-1.137575, -2.401222, -2.599801, 1, 0.7450981, 0, 1,
-1.132794, 1.580718, -1.004952, 1, 0.7490196, 0, 1,
-1.128072, -0.8998106, -1.810492, 1, 0.7568628, 0, 1,
-1.126626, 0.6600192, -2.891028, 1, 0.7607843, 0, 1,
-1.125499, 1.285345, 1.022734, 1, 0.7686275, 0, 1,
-1.113185, 0.7862098, -2.408872, 1, 0.772549, 0, 1,
-1.104006, -0.3055354, -1.96602, 1, 0.7803922, 0, 1,
-1.095471, 1.127738, -1.215098, 1, 0.7843137, 0, 1,
-1.093311, 1.471035, -0.5373833, 1, 0.7921569, 0, 1,
-1.090697, 1.291124, 0.388155, 1, 0.7960784, 0, 1,
-1.085589, 0.05056307, -1.000363, 1, 0.8039216, 0, 1,
-1.067498, -0.4796511, -2.811741, 1, 0.8117647, 0, 1,
-1.062085, -0.6225556, -0.8670179, 1, 0.8156863, 0, 1,
-1.059934, -0.07794985, -1.764737, 1, 0.8235294, 0, 1,
-1.058803, -0.2441324, -1.517081, 1, 0.827451, 0, 1,
-1.057407, -1.997297, -4.686306, 1, 0.8352941, 0, 1,
-1.054918, -0.6073222, -1.589499, 1, 0.8392157, 0, 1,
-1.051044, 1.345511, 0.3260228, 1, 0.8470588, 0, 1,
-1.04872, 1.62366, -1.289561, 1, 0.8509804, 0, 1,
-1.046906, -0.1682019, -1.499685, 1, 0.8588235, 0, 1,
-1.04459, -0.1079047, -2.587185, 1, 0.8627451, 0, 1,
-1.044266, -0.5664504, -1.931597, 1, 0.8705882, 0, 1,
-1.021795, -1.864397, -2.19177, 1, 0.8745098, 0, 1,
-1.020642, 0.0581851, -0.7481661, 1, 0.8823529, 0, 1,
-1.018628, -0.6767337, -2.784514, 1, 0.8862745, 0, 1,
-1.015504, 1.060682, -0.7469394, 1, 0.8941177, 0, 1,
-1.013958, 0.1314484, -0.3033932, 1, 0.8980392, 0, 1,
-0.9960622, -1.791399, -1.916429, 1, 0.9058824, 0, 1,
-0.995615, 1.13795, -0.5419989, 1, 0.9137255, 0, 1,
-0.9857588, -0.103797, -1.003188, 1, 0.9176471, 0, 1,
-0.9839963, 0.4307327, -1.295127, 1, 0.9254902, 0, 1,
-0.9794157, -0.09517872, -2.520413, 1, 0.9294118, 0, 1,
-0.9702427, 0.5510755, -1.20436, 1, 0.9372549, 0, 1,
-0.9695553, -0.1735172, -2.032279, 1, 0.9411765, 0, 1,
-0.9660042, 0.5264664, 0.8018214, 1, 0.9490196, 0, 1,
-0.9573881, -1.622928, -3.596516, 1, 0.9529412, 0, 1,
-0.957182, -1.171552, -2.617659, 1, 0.9607843, 0, 1,
-0.9501055, -0.4646469, -2.935004, 1, 0.9647059, 0, 1,
-0.9286152, 0.8951602, -1.711643, 1, 0.972549, 0, 1,
-0.9151033, -1.021071, -3.221136, 1, 0.9764706, 0, 1,
-0.912509, -0.6930551, -3.132293, 1, 0.9843137, 0, 1,
-0.9074725, -0.4076294, -2.791017, 1, 0.9882353, 0, 1,
-0.9039224, 0.04930022, -1.749416, 1, 0.9960784, 0, 1,
-0.8973563, 0.7504396, -1.207261, 0.9960784, 1, 0, 1,
-0.8959435, 0.9756197, -2.010875, 0.9921569, 1, 0, 1,
-0.8928761, -0.5917537, -2.691744, 0.9843137, 1, 0, 1,
-0.8837239, 0.5389223, -0.7265918, 0.9803922, 1, 0, 1,
-0.8766738, 1.069239, -0.7286191, 0.972549, 1, 0, 1,
-0.8688529, 0.06235395, -0.08051491, 0.9686275, 1, 0, 1,
-0.8683537, -0.7306447, -1.544503, 0.9607843, 1, 0, 1,
-0.8650391, -0.4524582, -3.84257, 0.9568627, 1, 0, 1,
-0.859122, 0.2753018, -1.147783, 0.9490196, 1, 0, 1,
-0.8437412, 0.574684, -0.744429, 0.945098, 1, 0, 1,
-0.843568, -0.3720131, -2.77164, 0.9372549, 1, 0, 1,
-0.8407789, -0.1225185, -1.331356, 0.9333333, 1, 0, 1,
-0.8373317, -0.1876569, -0.8601231, 0.9254902, 1, 0, 1,
-0.8341556, 0.7785177, 1.399907, 0.9215686, 1, 0, 1,
-0.8300735, 1.750225, -0.8459769, 0.9137255, 1, 0, 1,
-0.8276905, 0.3731215, -0.792515, 0.9098039, 1, 0, 1,
-0.8134388, 0.3131787, -0.6158623, 0.9019608, 1, 0, 1,
-0.812737, 0.4403212, -3.474995, 0.8941177, 1, 0, 1,
-0.8094239, -1.922117, -6.39409, 0.8901961, 1, 0, 1,
-0.8044564, -0.5711902, -1.098988, 0.8823529, 1, 0, 1,
-0.8006958, -1.872105, -1.48201, 0.8784314, 1, 0, 1,
-0.7997383, -0.4373687, -1.29098, 0.8705882, 1, 0, 1,
-0.7992637, 2.609734, 0.8317053, 0.8666667, 1, 0, 1,
-0.7987768, 1.237875, -1.534354, 0.8588235, 1, 0, 1,
-0.7934958, -0.4672128, -3.957325, 0.854902, 1, 0, 1,
-0.7886963, -0.4854154, -4.66875, 0.8470588, 1, 0, 1,
-0.7866936, 0.4090708, 0.7487172, 0.8431373, 1, 0, 1,
-0.7856653, -0.6639057, -2.957924, 0.8352941, 1, 0, 1,
-0.7853899, 0.4983207, -1.412243, 0.8313726, 1, 0, 1,
-0.7815903, -0.4270782, -0.9374101, 0.8235294, 1, 0, 1,
-0.7807651, -0.296566, -2.503929, 0.8196079, 1, 0, 1,
-0.7783695, 0.6453456, -2.523183, 0.8117647, 1, 0, 1,
-0.777917, -0.6774263, -2.781678, 0.8078431, 1, 0, 1,
-0.7735801, -0.9420546, 0.4589356, 0.8, 1, 0, 1,
-0.773259, -1.207608, -3.110813, 0.7921569, 1, 0, 1,
-0.7680211, 0.5827651, -1.142182, 0.7882353, 1, 0, 1,
-0.7622853, -0.04236779, -2.192964, 0.7803922, 1, 0, 1,
-0.7614809, -0.4611355, -3.285467, 0.7764706, 1, 0, 1,
-0.7544047, -1.054546, -3.827246, 0.7686275, 1, 0, 1,
-0.7537895, 1.220777, -0.01251806, 0.7647059, 1, 0, 1,
-0.7449499, -1.737297, -1.488208, 0.7568628, 1, 0, 1,
-0.7365822, 0.2330082, -1.973243, 0.7529412, 1, 0, 1,
-0.731756, 1.955126, 1.090136, 0.7450981, 1, 0, 1,
-0.7312544, 0.6706331, 0.447491, 0.7411765, 1, 0, 1,
-0.7285019, -0.5010551, -1.816715, 0.7333333, 1, 0, 1,
-0.7270652, -1.556457, -1.284652, 0.7294118, 1, 0, 1,
-0.7231457, -0.1937984, 0.1220835, 0.7215686, 1, 0, 1,
-0.7215447, 1.273139, -1.552181, 0.7176471, 1, 0, 1,
-0.714511, 0.8883577, 0.1585682, 0.7098039, 1, 0, 1,
-0.7136627, -0.008332358, -2.325522, 0.7058824, 1, 0, 1,
-0.7105849, -0.4649345, -3.384033, 0.6980392, 1, 0, 1,
-0.7079358, 0.5705586, -1.356188, 0.6901961, 1, 0, 1,
-0.7068883, -0.2997306, -1.686663, 0.6862745, 1, 0, 1,
-0.7042103, -0.4162228, -2.151514, 0.6784314, 1, 0, 1,
-0.7038033, -1.008586, -2.678587, 0.6745098, 1, 0, 1,
-0.7037124, -0.2529066, -2.076119, 0.6666667, 1, 0, 1,
-0.7026038, -0.5802867, -2.670509, 0.6627451, 1, 0, 1,
-0.7024246, -1.183303, -1.943052, 0.654902, 1, 0, 1,
-0.6991813, 0.9800128, 0.5922934, 0.6509804, 1, 0, 1,
-0.6863281, 0.6718737, -2.194271, 0.6431373, 1, 0, 1,
-0.6851547, -1.358591, -2.898542, 0.6392157, 1, 0, 1,
-0.6780257, -0.1861956, -1.697991, 0.6313726, 1, 0, 1,
-0.6753021, 0.02881624, -0.2837876, 0.627451, 1, 0, 1,
-0.6751289, -0.06968699, -0.8726973, 0.6196079, 1, 0, 1,
-0.6722323, 0.5428423, 0.6868385, 0.6156863, 1, 0, 1,
-0.6695282, -0.3899074, -1.325198, 0.6078432, 1, 0, 1,
-0.6652483, 1.884628, 0.338262, 0.6039216, 1, 0, 1,
-0.6625827, 0.1103669, -0.7600239, 0.5960785, 1, 0, 1,
-0.6528713, -0.9769778, -1.646347, 0.5882353, 1, 0, 1,
-0.6526607, 1.664297, -0.7849434, 0.5843138, 1, 0, 1,
-0.6472617, -0.6655779, -2.92405, 0.5764706, 1, 0, 1,
-0.6462102, -1.402863, -3.259095, 0.572549, 1, 0, 1,
-0.6447041, 1.601169, -0.938348, 0.5647059, 1, 0, 1,
-0.6439349, 1.110167, 0.992503, 0.5607843, 1, 0, 1,
-0.6340888, 2.119612, -0.7465366, 0.5529412, 1, 0, 1,
-0.632287, 1.823082, -2.076512, 0.5490196, 1, 0, 1,
-0.6302027, -0.4989774, -2.932209, 0.5411765, 1, 0, 1,
-0.6292678, 0.7611765, -0.07401081, 0.5372549, 1, 0, 1,
-0.6282873, -0.2447728, -0.2188568, 0.5294118, 1, 0, 1,
-0.6274308, 0.07238453, -0.9572508, 0.5254902, 1, 0, 1,
-0.619762, -1.173357, -2.251187, 0.5176471, 1, 0, 1,
-0.6185781, -0.3329197, -2.598244, 0.5137255, 1, 0, 1,
-0.6173794, 0.7689427, -1.313134, 0.5058824, 1, 0, 1,
-0.6170499, 1.969915, -1.341161, 0.5019608, 1, 0, 1,
-0.6137189, 0.7027206, -1.001604, 0.4941176, 1, 0, 1,
-0.6093403, 1.121747, -0.1830066, 0.4862745, 1, 0, 1,
-0.6087623, 1.041251, -2.067458, 0.4823529, 1, 0, 1,
-0.6082513, -1.376181, -2.761136, 0.4745098, 1, 0, 1,
-0.6059858, -1.002787, -2.098976, 0.4705882, 1, 0, 1,
-0.6044129, 1.144214, -1.528011, 0.4627451, 1, 0, 1,
-0.5995556, -1.111751, -1.657693, 0.4588235, 1, 0, 1,
-0.5957941, 0.217748, -1.837404, 0.4509804, 1, 0, 1,
-0.5942568, -2.251349, -1.885552, 0.4470588, 1, 0, 1,
-0.5917596, -0.02317706, 0.07324538, 0.4392157, 1, 0, 1,
-0.5892869, 0.0580455, -1.113265, 0.4352941, 1, 0, 1,
-0.5887826, -0.116463, -0.5161631, 0.427451, 1, 0, 1,
-0.5880316, -0.71842, -2.518764, 0.4235294, 1, 0, 1,
-0.5870245, 1.137882, 0.7797505, 0.4156863, 1, 0, 1,
-0.5802912, 1.473352, 0.7186727, 0.4117647, 1, 0, 1,
-0.5792994, -0.8755527, -2.024826, 0.4039216, 1, 0, 1,
-0.5773596, -0.05971649, -1.973319, 0.3960784, 1, 0, 1,
-0.5748042, 0.7542707, -0.9713626, 0.3921569, 1, 0, 1,
-0.5728579, -1.099658, -2.641448, 0.3843137, 1, 0, 1,
-0.572716, -0.8450409, -4.266586, 0.3803922, 1, 0, 1,
-0.5670825, -0.7091397, -2.110339, 0.372549, 1, 0, 1,
-0.5616235, -0.7726715, -1.780827, 0.3686275, 1, 0, 1,
-0.5511267, -0.8042571, -3.370026, 0.3607843, 1, 0, 1,
-0.548456, 0.3584966, -2.637565, 0.3568628, 1, 0, 1,
-0.5457649, -1.470887, -4.140608, 0.3490196, 1, 0, 1,
-0.5447776, -0.3459075, -1.27325, 0.345098, 1, 0, 1,
-0.5434448, 0.3611617, -2.252338, 0.3372549, 1, 0, 1,
-0.5392142, 0.01183251, -1.38904, 0.3333333, 1, 0, 1,
-0.5390922, 1.191037, -0.8739846, 0.3254902, 1, 0, 1,
-0.5379111, 1.228717, 0.5962241, 0.3215686, 1, 0, 1,
-0.5350122, 0.5432622, 0.4513521, 0.3137255, 1, 0, 1,
-0.5336417, 0.4280745, -0.644671, 0.3098039, 1, 0, 1,
-0.5318063, 0.8311663, -2.348909, 0.3019608, 1, 0, 1,
-0.52678, -1.841811, -3.312706, 0.2941177, 1, 0, 1,
-0.5265853, -0.7488598, -4.410946, 0.2901961, 1, 0, 1,
-0.524431, 0.9962964, -0.7637129, 0.282353, 1, 0, 1,
-0.5202854, 0.7763373, -0.0359737, 0.2784314, 1, 0, 1,
-0.5185112, -1.03563, -3.920929, 0.2705882, 1, 0, 1,
-0.5172486, 0.04726093, -2.033427, 0.2666667, 1, 0, 1,
-0.5158606, 2.748541, -0.2869805, 0.2588235, 1, 0, 1,
-0.513406, 0.8989241, -0.001014229, 0.254902, 1, 0, 1,
-0.5128668, 0.786865, -2.390369, 0.2470588, 1, 0, 1,
-0.5003431, -1.570441, -1.752793, 0.2431373, 1, 0, 1,
-0.4947638, -0.7498025, -2.178132, 0.2352941, 1, 0, 1,
-0.4922116, -1.610894, -3.993081, 0.2313726, 1, 0, 1,
-0.4891058, -0.451541, -3.278716, 0.2235294, 1, 0, 1,
-0.4886134, -0.2046396, -2.022757, 0.2196078, 1, 0, 1,
-0.48755, -0.4437658, -2.396555, 0.2117647, 1, 0, 1,
-0.4849437, -3.349304, -2.166385, 0.2078431, 1, 0, 1,
-0.4848242, 0.1572254, -0.2377733, 0.2, 1, 0, 1,
-0.4804524, -0.7955547, -3.656751, 0.1921569, 1, 0, 1,
-0.4789185, 0.1969388, -1.491812, 0.1882353, 1, 0, 1,
-0.4782878, -0.6894965, -3.120036, 0.1803922, 1, 0, 1,
-0.4715723, 0.7881337, -1.211736, 0.1764706, 1, 0, 1,
-0.4715263, 1.27387, 0.3504902, 0.1686275, 1, 0, 1,
-0.4699763, 1.508523, -1.507048, 0.1647059, 1, 0, 1,
-0.4686577, -1.501289, -2.445178, 0.1568628, 1, 0, 1,
-0.4669402, 0.6201186, 0.2027095, 0.1529412, 1, 0, 1,
-0.4668732, -1.950951, -1.816351, 0.145098, 1, 0, 1,
-0.4667196, -0.5814031, -1.895088, 0.1411765, 1, 0, 1,
-0.4640843, -0.7638092, -3.72638, 0.1333333, 1, 0, 1,
-0.4640012, 0.6925249, -1.020183, 0.1294118, 1, 0, 1,
-0.4604261, 0.06441011, -0.9051751, 0.1215686, 1, 0, 1,
-0.4573569, 0.3421274, 0.8889947, 0.1176471, 1, 0, 1,
-0.453056, -0.05772436, -1.628754, 0.1098039, 1, 0, 1,
-0.4489151, -1.384104, -2.924003, 0.1058824, 1, 0, 1,
-0.4462591, 1.531105, -0.8862512, 0.09803922, 1, 0, 1,
-0.4460785, -1.649515, -1.467816, 0.09019608, 1, 0, 1,
-0.4438343, 0.9297768, -0.8908983, 0.08627451, 1, 0, 1,
-0.443014, 0.2981887, -0.5132948, 0.07843138, 1, 0, 1,
-0.4398894, -0.4590397, -4.80721, 0.07450981, 1, 0, 1,
-0.4383096, 1.046497, -0.0008753134, 0.06666667, 1, 0, 1,
-0.4381036, 0.7848712, 0.2693622, 0.0627451, 1, 0, 1,
-0.4363475, 2.276055, -0.04073334, 0.05490196, 1, 0, 1,
-0.4352293, 0.4068711, -1.049517, 0.05098039, 1, 0, 1,
-0.4332942, 0.7945327, -0.9579903, 0.04313726, 1, 0, 1,
-0.4324762, 0.2232323, 1.367247, 0.03921569, 1, 0, 1,
-0.4324688, 1.730332, -1.440577, 0.03137255, 1, 0, 1,
-0.4247542, 0.09685928, -2.370371, 0.02745098, 1, 0, 1,
-0.4235049, 0.9192253, -0.06069366, 0.01960784, 1, 0, 1,
-0.4229409, -0.6867347, -2.340879, 0.01568628, 1, 0, 1,
-0.4198322, -2.558114, -2.970955, 0.007843138, 1, 0, 1,
-0.4185461, 0.03294976, -1.604134, 0.003921569, 1, 0, 1,
-0.4183415, -0.3973345, -2.933524, 0, 1, 0.003921569, 1,
-0.4177622, -2.455769, -3.147175, 0, 1, 0.01176471, 1,
-0.4163493, 1.042067, -0.9718956, 0, 1, 0.01568628, 1,
-0.4070604, 1.155253, -0.4630553, 0, 1, 0.02352941, 1,
-0.4018845, -0.06033047, -2.193293, 0, 1, 0.02745098, 1,
-0.4007854, 0.3370207, -0.7424013, 0, 1, 0.03529412, 1,
-0.3997021, -0.6696288, -0.7794968, 0, 1, 0.03921569, 1,
-0.3984012, -1.561699, -3.272303, 0, 1, 0.04705882, 1,
-0.3955563, -0.6806793, -2.095517, 0, 1, 0.05098039, 1,
-0.3923783, -2.69054, -4.150529, 0, 1, 0.05882353, 1,
-0.386921, 1.244775, 0.4022214, 0, 1, 0.0627451, 1,
-0.3848206, -0.4949847, -1.899297, 0, 1, 0.07058824, 1,
-0.3782514, 0.4411896, -1.004098, 0, 1, 0.07450981, 1,
-0.377933, -0.8472555, -3.162637, 0, 1, 0.08235294, 1,
-0.3697277, 0.5355047, -0.8857831, 0, 1, 0.08627451, 1,
-0.3682261, 0.107961, -0.9882591, 0, 1, 0.09411765, 1,
-0.3675155, -0.3528351, -3.328491, 0, 1, 0.1019608, 1,
-0.362585, 0.9037537, -0.4139634, 0, 1, 0.1058824, 1,
-0.3567008, -0.5029742, -2.547115, 0, 1, 0.1137255, 1,
-0.3510166, 1.147969, -0.04508707, 0, 1, 0.1176471, 1,
-0.3509109, 1.647158, 0.2357831, 0, 1, 0.1254902, 1,
-0.3498328, 0.4410751, -1.530843, 0, 1, 0.1294118, 1,
-0.3462939, -1.655628, -3.691459, 0, 1, 0.1372549, 1,
-0.3441155, 0.4733193, -2.518071, 0, 1, 0.1411765, 1,
-0.3437901, 1.763744, 0.2719129, 0, 1, 0.1490196, 1,
-0.3399339, -0.3364734, -3.163296, 0, 1, 0.1529412, 1,
-0.3385463, -0.5805691, -2.087455, 0, 1, 0.1607843, 1,
-0.3344361, -0.9369959, -2.235998, 0, 1, 0.1647059, 1,
-0.3327722, -0.1642411, -1.941293, 0, 1, 0.172549, 1,
-0.3290627, 0.8180711, -0.1816635, 0, 1, 0.1764706, 1,
-0.3229227, 0.6163765, 0.3399056, 0, 1, 0.1843137, 1,
-0.3182625, 0.4243256, -0.7090294, 0, 1, 0.1882353, 1,
-0.3137009, -0.3274567, -3.257492, 0, 1, 0.1960784, 1,
-0.3128953, -1.125848, -3.71714, 0, 1, 0.2039216, 1,
-0.3095403, 1.729366, 0.1015172, 0, 1, 0.2078431, 1,
-0.3074374, -0.4389664, -3.429801, 0, 1, 0.2156863, 1,
-0.3064517, -0.7280751, -2.22916, 0, 1, 0.2196078, 1,
-0.3060244, -1.323255, -3.214029, 0, 1, 0.227451, 1,
-0.3054116, -1.963003, -5.830853, 0, 1, 0.2313726, 1,
-0.3013467, 0.2893499, -0.7829409, 0, 1, 0.2392157, 1,
-0.2962742, -0.748514, -3.621611, 0, 1, 0.2431373, 1,
-0.2945393, -0.08209117, -1.257394, 0, 1, 0.2509804, 1,
-0.2942237, -0.1782433, -3.872051, 0, 1, 0.254902, 1,
-0.292366, 0.1565388, -1.524822, 0, 1, 0.2627451, 1,
-0.2875505, 0.1783151, -0.6632514, 0, 1, 0.2666667, 1,
-0.2869562, -0.1640709, -3.520508, 0, 1, 0.2745098, 1,
-0.2865696, -0.1791165, -1.511162, 0, 1, 0.2784314, 1,
-0.2857842, -0.0571361, -2.237414, 0, 1, 0.2862745, 1,
-0.2839162, 0.03809446, -0.4636334, 0, 1, 0.2901961, 1,
-0.2797908, -0.3617995, -2.649137, 0, 1, 0.2980392, 1,
-0.2749744, -0.1648761, -2.218758, 0, 1, 0.3058824, 1,
-0.2730357, -0.4798338, -2.997766, 0, 1, 0.3098039, 1,
-0.2724271, -0.5321751, -2.397017, 0, 1, 0.3176471, 1,
-0.2718694, 1.474543, -0.4141267, 0, 1, 0.3215686, 1,
-0.2714826, 0.05471708, -1.307777, 0, 1, 0.3294118, 1,
-0.2702571, -0.02709909, -0.2420135, 0, 1, 0.3333333, 1,
-0.2687185, 0.5048473, -0.7288021, 0, 1, 0.3411765, 1,
-0.2604508, -0.9603309, -3.722409, 0, 1, 0.345098, 1,
-0.2574588, -0.2212438, -0.8446274, 0, 1, 0.3529412, 1,
-0.2568054, -0.6875727, -3.319349, 0, 1, 0.3568628, 1,
-0.2497375, -0.7648251, -0.3424394, 0, 1, 0.3647059, 1,
-0.2426722, 0.6067548, -0.2811439, 0, 1, 0.3686275, 1,
-0.2406434, -0.6837357, -1.26381, 0, 1, 0.3764706, 1,
-0.2376893, 0.5401815, 1.855555, 0, 1, 0.3803922, 1,
-0.2338048, 1.04177, -1.613342, 0, 1, 0.3882353, 1,
-0.2331354, 0.01870747, -0.9652685, 0, 1, 0.3921569, 1,
-0.2316957, 0.8666995, -1.313772, 0, 1, 0.4, 1,
-0.2269762, -1.308365, -3.831659, 0, 1, 0.4078431, 1,
-0.2258842, -0.03500064, -1.837276, 0, 1, 0.4117647, 1,
-0.2240845, 0.2894904, -0.2516823, 0, 1, 0.4196078, 1,
-0.223985, -0.837236, -3.438727, 0, 1, 0.4235294, 1,
-0.2229936, 0.3234425, -0.8001344, 0, 1, 0.4313726, 1,
-0.2207759, 0.5960494, 0.2683038, 0, 1, 0.4352941, 1,
-0.2188414, 0.6443114, -0.3209178, 0, 1, 0.4431373, 1,
-0.2166563, 1.08523, 1.549152, 0, 1, 0.4470588, 1,
-0.2156781, 0.03607238, -1.063555, 0, 1, 0.454902, 1,
-0.2102989, -0.03016207, 0.576377, 0, 1, 0.4588235, 1,
-0.2054331, -0.7091878, -3.799004, 0, 1, 0.4666667, 1,
-0.2048233, -0.1762418, -2.018352, 0, 1, 0.4705882, 1,
-0.201611, -1.705059, -5.263088, 0, 1, 0.4784314, 1,
-0.2005097, 0.1226656, 0.579495, 0, 1, 0.4823529, 1,
-0.1960049, 1.00858, 0.6758775, 0, 1, 0.4901961, 1,
-0.1958326, 1.410964, -0.7028535, 0, 1, 0.4941176, 1,
-0.195097, -0.7677521, -3.546518, 0, 1, 0.5019608, 1,
-0.1948806, 0.135968, -2.096132, 0, 1, 0.509804, 1,
-0.1946539, -0.6604733, -2.368477, 0, 1, 0.5137255, 1,
-0.194007, 2.579284, 0.1283818, 0, 1, 0.5215687, 1,
-0.1929021, -0.8061992, -3.238787, 0, 1, 0.5254902, 1,
-0.1913216, -1.645305, -3.523044, 0, 1, 0.5333334, 1,
-0.1912553, -2.093151, -2.258102, 0, 1, 0.5372549, 1,
-0.1900203, -0.9234077, -1.397893, 0, 1, 0.5450981, 1,
-0.1894359, 1.262565, 2.203376, 0, 1, 0.5490196, 1,
-0.1877918, 0.1340973, -1.155905, 0, 1, 0.5568628, 1,
-0.1860537, 0.1729926, -0.6628295, 0, 1, 0.5607843, 1,
-0.1851317, -0.02959704, -2.140646, 0, 1, 0.5686275, 1,
-0.183506, -0.4178129, -2.606008, 0, 1, 0.572549, 1,
-0.1806811, -0.1219502, -2.401213, 0, 1, 0.5803922, 1,
-0.1787062, -0.7364769, -1.08228, 0, 1, 0.5843138, 1,
-0.1743467, -0.6201562, -1.915378, 0, 1, 0.5921569, 1,
-0.1731984, -0.8090014, -3.273063, 0, 1, 0.5960785, 1,
-0.1567427, -1.076034, -4.134863, 0, 1, 0.6039216, 1,
-0.156085, 0.8984842, -0.1446635, 0, 1, 0.6117647, 1,
-0.1538653, 0.292048, -0.8345088, 0, 1, 0.6156863, 1,
-0.1537684, -1.469762, -1.577836, 0, 1, 0.6235294, 1,
-0.1532939, 0.06897307, -2.070285, 0, 1, 0.627451, 1,
-0.1510355, 1.556479, 0.3636563, 0, 1, 0.6352941, 1,
-0.1436537, 0.4515303, -0.5066123, 0, 1, 0.6392157, 1,
-0.1418005, -0.2944806, -2.686131, 0, 1, 0.6470588, 1,
-0.1389336, -1.653586, -2.4965, 0, 1, 0.6509804, 1,
-0.1388722, -1.382021, -1.811152, 0, 1, 0.6588235, 1,
-0.138787, 0.1605327, -2.378049, 0, 1, 0.6627451, 1,
-0.1383588, -0.2715473, -1.380836, 0, 1, 0.6705883, 1,
-0.1354243, -0.2651694, -3.401787, 0, 1, 0.6745098, 1,
-0.1325394, -0.9749721, -3.095407, 0, 1, 0.682353, 1,
-0.1315707, 0.8898633, 0.7548574, 0, 1, 0.6862745, 1,
-0.130445, -0.06807279, -0.8824582, 0, 1, 0.6941177, 1,
-0.1297795, -0.004021026, -1.470453, 0, 1, 0.7019608, 1,
-0.1295876, 0.414843, 1.163163, 0, 1, 0.7058824, 1,
-0.1273652, -0.0503685, -1.25916, 0, 1, 0.7137255, 1,
-0.1269317, 0.461629, 0.004994201, 0, 1, 0.7176471, 1,
-0.121794, -1.304753, -2.118677, 0, 1, 0.7254902, 1,
-0.1190155, 0.4826725, -1.192241, 0, 1, 0.7294118, 1,
-0.118775, 0.6560391, 1.436088, 0, 1, 0.7372549, 1,
-0.1176715, -0.1344409, -0.6714504, 0, 1, 0.7411765, 1,
-0.1156805, -1.464457, -1.728957, 0, 1, 0.7490196, 1,
-0.111186, 0.5427812, -0.3108732, 0, 1, 0.7529412, 1,
-0.1086925, 1.272237, 0.5082279, 0, 1, 0.7607843, 1,
-0.1030556, -0.6942786, -1.483298, 0, 1, 0.7647059, 1,
-0.1014907, 0.08268641, -0.5525309, 0, 1, 0.772549, 1,
-0.1007035, -1.465027, -2.193636, 0, 1, 0.7764706, 1,
-0.09567983, 1.646301, -0.7648148, 0, 1, 0.7843137, 1,
-0.088899, -1.499642, -2.669152, 0, 1, 0.7882353, 1,
-0.08844333, 0.6156932, -0.8010322, 0, 1, 0.7960784, 1,
-0.08762508, -0.2514774, -2.94572, 0, 1, 0.8039216, 1,
-0.08532845, -0.5424089, -2.735781, 0, 1, 0.8078431, 1,
-0.08508866, -0.0001330008, -0.6907853, 0, 1, 0.8156863, 1,
-0.08455059, -0.5450866, -2.768616, 0, 1, 0.8196079, 1,
-0.08141364, -0.1808778, -5.649702, 0, 1, 0.827451, 1,
-0.06272005, -0.09976278, -1.616618, 0, 1, 0.8313726, 1,
-0.05251107, 0.9656624, 1.379377, 0, 1, 0.8392157, 1,
-0.05241416, 0.6629757, 0.08806219, 0, 1, 0.8431373, 1,
-0.05105402, 0.01509335, -1.117539, 0, 1, 0.8509804, 1,
-0.04953877, 0.8630909, 1.686019, 0, 1, 0.854902, 1,
-0.04832976, 0.3832825, 0.4282393, 0, 1, 0.8627451, 1,
-0.04800614, 0.1883338, 0.530034, 0, 1, 0.8666667, 1,
-0.04662498, 0.3880569, -0.4796665, 0, 1, 0.8745098, 1,
-0.04481978, -0.6674739, -5.038132, 0, 1, 0.8784314, 1,
-0.04135232, 0.6708279, -0.3958626, 0, 1, 0.8862745, 1,
-0.04087052, -1.709114, -1.985591, 0, 1, 0.8901961, 1,
-0.035191, -0.6657296, -1.658686, 0, 1, 0.8980392, 1,
-0.02713076, 1.666286, -1.262484, 0, 1, 0.9058824, 1,
-0.02075457, 0.1277334, 0.2576104, 0, 1, 0.9098039, 1,
-0.01308128, -0.04941885, -3.395993, 0, 1, 0.9176471, 1,
-0.01162583, 0.174222, -0.6429687, 0, 1, 0.9215686, 1,
-0.01104226, -2.008395, -1.712062, 0, 1, 0.9294118, 1,
-0.006026308, 0.1360127, 0.705409, 0, 1, 0.9333333, 1,
-0.005271705, 0.06558603, 0.05347094, 0, 1, 0.9411765, 1,
-0.003216041, -0.8998395, -2.144118, 0, 1, 0.945098, 1,
0.003512411, -1.382954, 5.10463, 0, 1, 0.9529412, 1,
0.005387414, -1.314277, 3.096776, 0, 1, 0.9568627, 1,
0.006377861, -0.007446852, 2.950661, 0, 1, 0.9647059, 1,
0.006889096, 0.08625243, 1.088024, 0, 1, 0.9686275, 1,
0.008281487, 2.643731, -2.651522, 0, 1, 0.9764706, 1,
0.01166255, 0.3405627, 1.142126, 0, 1, 0.9803922, 1,
0.01230045, -0.002846387, 2.127654, 0, 1, 0.9882353, 1,
0.01237993, -0.349473, 2.440192, 0, 1, 0.9921569, 1,
0.01331526, 1.036376, 1.0677, 0, 1, 1, 1,
0.01346085, -0.2849696, 3.887448, 0, 0.9921569, 1, 1,
0.0139877, 0.5305276, 0.141702, 0, 0.9882353, 1, 1,
0.01535864, -0.7759971, 2.799782, 0, 0.9803922, 1, 1,
0.02332681, -0.8957615, 4.088351, 0, 0.9764706, 1, 1,
0.02355659, 0.9532513, 0.1408624, 0, 0.9686275, 1, 1,
0.02387251, 0.8029743, 0.4295103, 0, 0.9647059, 1, 1,
0.02401739, -0.3369649, 3.507771, 0, 0.9568627, 1, 1,
0.02499665, 0.01969284, 1.757361, 0, 0.9529412, 1, 1,
0.02571834, -1.29382, 3.775175, 0, 0.945098, 1, 1,
0.02800851, -0.2750838, 0.8367956, 0, 0.9411765, 1, 1,
0.0307465, 0.0872497, 0.112175, 0, 0.9333333, 1, 1,
0.04086369, 0.4871694, 1.038015, 0, 0.9294118, 1, 1,
0.04118374, 0.6447736, -0.2658706, 0, 0.9215686, 1, 1,
0.04158767, -1.182264, 4.886753, 0, 0.9176471, 1, 1,
0.04504132, -0.04261774, 4.319115, 0, 0.9098039, 1, 1,
0.05272135, 0.05065472, 0.4672787, 0, 0.9058824, 1, 1,
0.05440743, -1.633538, 2.85272, 0, 0.8980392, 1, 1,
0.05630039, 1.717692, 0.3592791, 0, 0.8901961, 1, 1,
0.05778731, -0.8474382, 3.401209, 0, 0.8862745, 1, 1,
0.06153952, 2.168875, -1.301939, 0, 0.8784314, 1, 1,
0.0666021, 1.257619, -2.1201, 0, 0.8745098, 1, 1,
0.06851845, 1.167951, -0.5283614, 0, 0.8666667, 1, 1,
0.06976517, 2.766862, -0.9751819, 0, 0.8627451, 1, 1,
0.06978032, 0.7792454, 0.4332679, 0, 0.854902, 1, 1,
0.06996621, -0.06093081, 2.070252, 0, 0.8509804, 1, 1,
0.0739783, 0.4806157, 0.2298267, 0, 0.8431373, 1, 1,
0.07484487, 0.1135689, -0.1127668, 0, 0.8392157, 1, 1,
0.07546575, 1.724748, 0.9109715, 0, 0.8313726, 1, 1,
0.07691628, 0.5690209, -0.02462418, 0, 0.827451, 1, 1,
0.08030079, -0.4795564, 2.249804, 0, 0.8196079, 1, 1,
0.08358808, -0.5129983, 2.951389, 0, 0.8156863, 1, 1,
0.08637591, -0.4769519, 2.720747, 0, 0.8078431, 1, 1,
0.09045554, -1.148672, 4.386063, 0, 0.8039216, 1, 1,
0.09204675, 0.3140734, 0.5524118, 0, 0.7960784, 1, 1,
0.09269355, -0.5165957, 3.247299, 0, 0.7882353, 1, 1,
0.0928214, 0.8530017, 1.212715, 0, 0.7843137, 1, 1,
0.09454162, 0.3695018, 0.6481467, 0, 0.7764706, 1, 1,
0.1001096, -0.8452594, 2.754745, 0, 0.772549, 1, 1,
0.1013341, -0.1060517, 0.577942, 0, 0.7647059, 1, 1,
0.1025842, -1.691182, 2.444788, 0, 0.7607843, 1, 1,
0.1043358, -1.632051, 3.170292, 0, 0.7529412, 1, 1,
0.1078243, -0.419383, 1.527945, 0, 0.7490196, 1, 1,
0.1094077, 1.405576, -0.4874234, 0, 0.7411765, 1, 1,
0.1094642, 0.8442054, -0.4769625, 0, 0.7372549, 1, 1,
0.1109069, 0.5291336, 0.4175397, 0, 0.7294118, 1, 1,
0.1128499, -0.3782412, 2.910229, 0, 0.7254902, 1, 1,
0.1171554, -0.5571481, 0.2316456, 0, 0.7176471, 1, 1,
0.1208318, 2.275305, 0.496482, 0, 0.7137255, 1, 1,
0.1239938, -0.9469848, 2.735561, 0, 0.7058824, 1, 1,
0.1247068, 0.3059839, 1.010929, 0, 0.6980392, 1, 1,
0.1264585, 0.2620846, -0.3200467, 0, 0.6941177, 1, 1,
0.1270936, -1.78197, 4.096171, 0, 0.6862745, 1, 1,
0.1290275, 0.2322677, -0.2390634, 0, 0.682353, 1, 1,
0.135336, -0.8443298, 1.89969, 0, 0.6745098, 1, 1,
0.1368798, 0.2950806, 1.107005, 0, 0.6705883, 1, 1,
0.1371214, -1.21632, 1.803474, 0, 0.6627451, 1, 1,
0.139613, -0.02033639, 2.110958, 0, 0.6588235, 1, 1,
0.1428649, -0.0146267, 2.564797, 0, 0.6509804, 1, 1,
0.1440278, 1.583584, 1.751578, 0, 0.6470588, 1, 1,
0.1442398, -1.280302, 3.946284, 0, 0.6392157, 1, 1,
0.1449813, -0.02585225, 1.86063, 0, 0.6352941, 1, 1,
0.1451693, 1.214975, 1.03337, 0, 0.627451, 1, 1,
0.1471681, -0.09616785, 0.8860362, 0, 0.6235294, 1, 1,
0.1484842, -0.04880156, 1.306463, 0, 0.6156863, 1, 1,
0.1521011, 1.102515, 1.69864, 0, 0.6117647, 1, 1,
0.1522542, 1.186016, -0.1441753, 0, 0.6039216, 1, 1,
0.1539397, -3.939961, 3.89953, 0, 0.5960785, 1, 1,
0.1586896, 0.08423881, 2.774994, 0, 0.5921569, 1, 1,
0.1656019, 0.6589194, 0.225563, 0, 0.5843138, 1, 1,
0.1702122, 0.1528423, 1.182395, 0, 0.5803922, 1, 1,
0.1740882, 0.4995067, 0.003074718, 0, 0.572549, 1, 1,
0.174203, -0.2875434, 1.879186, 0, 0.5686275, 1, 1,
0.1757709, -0.6538857, 2.198534, 0, 0.5607843, 1, 1,
0.1758092, -1.365129, 2.882135, 0, 0.5568628, 1, 1,
0.175944, 1.877092, 0.9082097, 0, 0.5490196, 1, 1,
0.1760455, -0.03557863, 3.221217, 0, 0.5450981, 1, 1,
0.1784999, 1.325619, 0.5958273, 0, 0.5372549, 1, 1,
0.1792203, -0.3476426, 4.603805, 0, 0.5333334, 1, 1,
0.179595, 0.8448523, 1.577389, 0, 0.5254902, 1, 1,
0.1818359, 0.6653351, 0.8143949, 0, 0.5215687, 1, 1,
0.1824067, -0.184785, 0.3158051, 0, 0.5137255, 1, 1,
0.1859131, -0.3275177, 2.807912, 0, 0.509804, 1, 1,
0.1869815, 1.619342, -0.8132889, 0, 0.5019608, 1, 1,
0.1890654, 0.1300431, -0.5366697, 0, 0.4941176, 1, 1,
0.2005548, -0.6895573, 1.823693, 0, 0.4901961, 1, 1,
0.2071388, 2.760668, 1.557635, 0, 0.4823529, 1, 1,
0.212986, 0.09003457, 2.088883, 0, 0.4784314, 1, 1,
0.2144982, -1.369002, 2.470791, 0, 0.4705882, 1, 1,
0.2145047, 1.46703, 0.09536184, 0, 0.4666667, 1, 1,
0.2194621, 0.7318379, 0.4588798, 0, 0.4588235, 1, 1,
0.2207348, 1.367838, 1.172333, 0, 0.454902, 1, 1,
0.2239028, 0.8178232, -0.07013654, 0, 0.4470588, 1, 1,
0.2252632, -1.031257, 2.633435, 0, 0.4431373, 1, 1,
0.2270564, 0.1258069, 1.818666, 0, 0.4352941, 1, 1,
0.2294486, 0.2443147, 1.591488, 0, 0.4313726, 1, 1,
0.2306943, 0.9836116, -0.3425956, 0, 0.4235294, 1, 1,
0.2329211, 2.522799, 0.8300635, 0, 0.4196078, 1, 1,
0.2376491, 0.1382628, 1.023339, 0, 0.4117647, 1, 1,
0.240541, 1.441287, -0.2773566, 0, 0.4078431, 1, 1,
0.2410022, 0.5160977, -1.958112, 0, 0.4, 1, 1,
0.2438461, 0.3467537, 2.151165, 0, 0.3921569, 1, 1,
0.2449914, 1.109722, 1.050472, 0, 0.3882353, 1, 1,
0.2486024, -0.8595716, 2.122258, 0, 0.3803922, 1, 1,
0.2495716, -0.4968742, 4.499147, 0, 0.3764706, 1, 1,
0.2521197, 1.789001, 0.8484074, 0, 0.3686275, 1, 1,
0.2527774, 0.2658962, -0.7920986, 0, 0.3647059, 1, 1,
0.2541865, 0.1001776, 1.057391, 0, 0.3568628, 1, 1,
0.2544107, 0.8125596, 0.4846871, 0, 0.3529412, 1, 1,
0.2564974, 1.086179, -0.361406, 0, 0.345098, 1, 1,
0.2588938, 0.5840706, 2.377957, 0, 0.3411765, 1, 1,
0.2610619, -1.047779, 3.378605, 0, 0.3333333, 1, 1,
0.2618114, 1.677712, -0.6465307, 0, 0.3294118, 1, 1,
0.2621457, 0.2313758, 1.063744, 0, 0.3215686, 1, 1,
0.2674643, -1.207902, 1.929157, 0, 0.3176471, 1, 1,
0.2683776, -0.2784435, 3.539219, 0, 0.3098039, 1, 1,
0.2710296, 0.387462, 0.5441041, 0, 0.3058824, 1, 1,
0.2710966, 1.939581, 0.4974577, 0, 0.2980392, 1, 1,
0.271364, 1.497496, -1.185745, 0, 0.2901961, 1, 1,
0.2719004, -1.187013, 1.391513, 0, 0.2862745, 1, 1,
0.2777427, 0.4456216, -0.9122734, 0, 0.2784314, 1, 1,
0.2806662, 0.2054406, -0.02117793, 0, 0.2745098, 1, 1,
0.2818061, -0.6222606, 3.138258, 0, 0.2666667, 1, 1,
0.2840914, 1.032122, -0.2357265, 0, 0.2627451, 1, 1,
0.2868019, 1.604642, 0.7706826, 0, 0.254902, 1, 1,
0.2920125, -1.317392, 1.876576, 0, 0.2509804, 1, 1,
0.2999396, 1.263909, -0.3469321, 0, 0.2431373, 1, 1,
0.3011073, -1.589386, 4.195744, 0, 0.2392157, 1, 1,
0.3019932, 1.773687, 2.052119, 0, 0.2313726, 1, 1,
0.304626, 0.1134239, 0.6916639, 0, 0.227451, 1, 1,
0.3051074, 0.6429393, -0.1333295, 0, 0.2196078, 1, 1,
0.3070907, 0.6765747, -0.09521713, 0, 0.2156863, 1, 1,
0.3105327, 1.127759, 0.7314197, 0, 0.2078431, 1, 1,
0.3115471, -1.687136, 2.194036, 0, 0.2039216, 1, 1,
0.3146724, 0.722205, 0.8600606, 0, 0.1960784, 1, 1,
0.3161927, -0.1324393, 2.511403, 0, 0.1882353, 1, 1,
0.3186283, -0.2299105, 2.579905, 0, 0.1843137, 1, 1,
0.3206038, -0.4915255, 2.711983, 0, 0.1764706, 1, 1,
0.3242051, 1.156411, 1.164946, 0, 0.172549, 1, 1,
0.3261772, -1.758148, 2.074724, 0, 0.1647059, 1, 1,
0.3286344, -0.6363187, 3.491294, 0, 0.1607843, 1, 1,
0.3393726, -0.775776, 1.931089, 0, 0.1529412, 1, 1,
0.3409868, 0.5583929, 0.5378003, 0, 0.1490196, 1, 1,
0.3436674, 0.5781317, 1.083164, 0, 0.1411765, 1, 1,
0.3489749, -1.487895, 2.680547, 0, 0.1372549, 1, 1,
0.3501102, 0.629134, 1.834067, 0, 0.1294118, 1, 1,
0.3501168, -0.5265944, 3.01938, 0, 0.1254902, 1, 1,
0.3525008, -0.5615396, 3.182342, 0, 0.1176471, 1, 1,
0.3622065, 0.2239161, -0.3137292, 0, 0.1137255, 1, 1,
0.3626007, 0.221911, 0.794516, 0, 0.1058824, 1, 1,
0.3646138, -0.9146695, 3.098785, 0, 0.09803922, 1, 1,
0.3654584, 0.7035612, -0.06577255, 0, 0.09411765, 1, 1,
0.3654897, 0.6269056, -1.091653, 0, 0.08627451, 1, 1,
0.3723101, -0.07214213, 3.165818, 0, 0.08235294, 1, 1,
0.3730329, 0.03558958, 1.980644, 0, 0.07450981, 1, 1,
0.3785445, 1.066913, -0.2301692, 0, 0.07058824, 1, 1,
0.3798836, 1.324223, 2.005507, 0, 0.0627451, 1, 1,
0.380441, 1.030284, 1.705064, 0, 0.05882353, 1, 1,
0.3820967, 0.5962397, 2.136137, 0, 0.05098039, 1, 1,
0.3825806, -0.7055851, 2.565218, 0, 0.04705882, 1, 1,
0.3853827, -0.8965076, 3.422011, 0, 0.03921569, 1, 1,
0.3871373, 0.8144525, 1.819568, 0, 0.03529412, 1, 1,
0.3927549, -0.2216337, 0.5739715, 0, 0.02745098, 1, 1,
0.3933952, 0.5156707, 1.41286, 0, 0.02352941, 1, 1,
0.3956057, -1.2457, 3.026546, 0, 0.01568628, 1, 1,
0.4006463, 0.9913426, 2.441399, 0, 0.01176471, 1, 1,
0.4011504, -0.2787257, 3.157368, 0, 0.003921569, 1, 1,
0.4032175, -0.4991169, 3.28073, 0.003921569, 0, 1, 1,
0.4060582, 0.2575804, 0.639446, 0.007843138, 0, 1, 1,
0.4121849, -0.1294432, 2.350095, 0.01568628, 0, 1, 1,
0.4127319, 0.7036156, 0.6772904, 0.01960784, 0, 1, 1,
0.4205113, 0.02107382, 1.026608, 0.02745098, 0, 1, 1,
0.4271126, 0.4905903, 0.08283442, 0.03137255, 0, 1, 1,
0.4294698, -1.38166, 2.453472, 0.03921569, 0, 1, 1,
0.4341276, -1.328273, 1.812284, 0.04313726, 0, 1, 1,
0.4380965, -0.9509566, 3.220403, 0.05098039, 0, 1, 1,
0.4403567, -1.966113, 1.52389, 0.05490196, 0, 1, 1,
0.4449632, 0.651361, -0.9285889, 0.0627451, 0, 1, 1,
0.4491695, -0.8304207, 2.15347, 0.06666667, 0, 1, 1,
0.4506039, -0.07488675, 3.70919, 0.07450981, 0, 1, 1,
0.4507695, 1.597924, -0.9591537, 0.07843138, 0, 1, 1,
0.4546522, 0.02647355, 0.8694106, 0.08627451, 0, 1, 1,
0.4584877, 0.008729005, 2.392434, 0.09019608, 0, 1, 1,
0.4608767, -0.4672382, 3.811412, 0.09803922, 0, 1, 1,
0.4669211, -0.4876449, 2.898428, 0.1058824, 0, 1, 1,
0.4679292, -0.4804444, 2.394773, 0.1098039, 0, 1, 1,
0.4687044, 0.4815739, 0.9967649, 0.1176471, 0, 1, 1,
0.4708897, -0.619846, 1.592878, 0.1215686, 0, 1, 1,
0.4719638, 0.7980475, -0.9091594, 0.1294118, 0, 1, 1,
0.4769876, 2.031151, -0.9550332, 0.1333333, 0, 1, 1,
0.4903393, 1.074296, 3.554974, 0.1411765, 0, 1, 1,
0.4925516, 1.418009, -0.4548268, 0.145098, 0, 1, 1,
0.4932712, 1.712472, 0.2236994, 0.1529412, 0, 1, 1,
0.4968824, 1.655947, -1.141208, 0.1568628, 0, 1, 1,
0.5011204, 0.9485295, 0.7691852, 0.1647059, 0, 1, 1,
0.501765, 0.2975762, 1.063567, 0.1686275, 0, 1, 1,
0.5039404, 0.2581176, 0.9303349, 0.1764706, 0, 1, 1,
0.5040398, 1.058674, 1.323203, 0.1803922, 0, 1, 1,
0.50819, 1.984488, 0.5038022, 0.1882353, 0, 1, 1,
0.5099267, 0.5316, -0.4956398, 0.1921569, 0, 1, 1,
0.5141282, -0.4191867, 2.608222, 0.2, 0, 1, 1,
0.519887, 0.0561429, 1.470468, 0.2078431, 0, 1, 1,
0.5234911, 0.3195048, 1.382891, 0.2117647, 0, 1, 1,
0.5283439, -1.956098, 3.408042, 0.2196078, 0, 1, 1,
0.5303883, -0.4388618, 2.867203, 0.2235294, 0, 1, 1,
0.5413495, -0.3723309, 3.423604, 0.2313726, 0, 1, 1,
0.5478542, -0.05011603, 1.183296, 0.2352941, 0, 1, 1,
0.5500126, -0.8667413, 0.6537504, 0.2431373, 0, 1, 1,
0.5577952, 1.285882, 0.6205626, 0.2470588, 0, 1, 1,
0.5622089, -0.178203, 3.019956, 0.254902, 0, 1, 1,
0.5632977, 1.413764, 0.1479651, 0.2588235, 0, 1, 1,
0.5664493, 0.9912618, 1.374252, 0.2666667, 0, 1, 1,
0.5683405, -0.1888519, 2.508053, 0.2705882, 0, 1, 1,
0.5711479, 0.8124053, 2.274274, 0.2784314, 0, 1, 1,
0.5783875, -0.1940402, 0.6400162, 0.282353, 0, 1, 1,
0.5801709, 0.8099811, 2.755225, 0.2901961, 0, 1, 1,
0.5827203, -1.237887, 3.653311, 0.2941177, 0, 1, 1,
0.5859402, 2.195755, 0.427432, 0.3019608, 0, 1, 1,
0.5895445, -3.074272, 3.817251, 0.3098039, 0, 1, 1,
0.5896662, 0.5601673, 2.40955, 0.3137255, 0, 1, 1,
0.5964592, -0.5596772, 1.954221, 0.3215686, 0, 1, 1,
0.5991026, -0.09312567, 1.790927, 0.3254902, 0, 1, 1,
0.6019045, -0.6106077, 3.091562, 0.3333333, 0, 1, 1,
0.6056512, 0.4943475, 3.446484, 0.3372549, 0, 1, 1,
0.6082633, 0.0510448, 3.275364, 0.345098, 0, 1, 1,
0.6101281, -1.018357, 1.702233, 0.3490196, 0, 1, 1,
0.6155589, 2.441846, -0.3736357, 0.3568628, 0, 1, 1,
0.6213009, -0.5269643, 2.530919, 0.3607843, 0, 1, 1,
0.6217099, 1.380606, 0.9948829, 0.3686275, 0, 1, 1,
0.6230719, 1.190206, 1.680418, 0.372549, 0, 1, 1,
0.6258044, 0.6766246, 0.1150174, 0.3803922, 0, 1, 1,
0.637722, -1.125482, 1.812875, 0.3843137, 0, 1, 1,
0.646, 0.7554259, 1.29092, 0.3921569, 0, 1, 1,
0.6492652, -1.58619, 1.953554, 0.3960784, 0, 1, 1,
0.6510647, -1.124142, 4.348285, 0.4039216, 0, 1, 1,
0.6510925, -0.657234, 2.623883, 0.4117647, 0, 1, 1,
0.6518253, 1.123355, 1.471679, 0.4156863, 0, 1, 1,
0.6582611, -1.205616, 3.294801, 0.4235294, 0, 1, 1,
0.6597031, 0.3774327, 1.843018, 0.427451, 0, 1, 1,
0.6608123, -0.8837925, 2.10628, 0.4352941, 0, 1, 1,
0.6633005, 0.1333068, 1.553692, 0.4392157, 0, 1, 1,
0.6685638, 0.3119481, 0.7252015, 0.4470588, 0, 1, 1,
0.671939, -1.111694, 3.271298, 0.4509804, 0, 1, 1,
0.6771418, 0.8929225, 1.163517, 0.4588235, 0, 1, 1,
0.6775802, 0.9329002, -0.486625, 0.4627451, 0, 1, 1,
0.6811217, 0.513712, 1.404901, 0.4705882, 0, 1, 1,
0.6859212, -1.306908, 4.484232, 0.4745098, 0, 1, 1,
0.6894615, 0.3532568, 0.396571, 0.4823529, 0, 1, 1,
0.6904641, -0.7209739, 1.19984, 0.4862745, 0, 1, 1,
0.692883, 0.3490805, 2.469764, 0.4941176, 0, 1, 1,
0.6931136, -1.855845, 2.367622, 0.5019608, 0, 1, 1,
0.6953757, 0.5704649, 1.2772, 0.5058824, 0, 1, 1,
0.6969926, 0.4266419, -0.19541, 0.5137255, 0, 1, 1,
0.6998183, 0.4972124, 1.114447, 0.5176471, 0, 1, 1,
0.7027843, 0.3830511, -1.704952, 0.5254902, 0, 1, 1,
0.7058549, -0.3062475, 2.315926, 0.5294118, 0, 1, 1,
0.7082305, 0.566647, 1.575715, 0.5372549, 0, 1, 1,
0.7088706, -1.937601, 3.713854, 0.5411765, 0, 1, 1,
0.7102166, -1.480189, 1.625146, 0.5490196, 0, 1, 1,
0.7121841, -0.8693058, 3.103843, 0.5529412, 0, 1, 1,
0.7129931, 0.1187468, 1.273994, 0.5607843, 0, 1, 1,
0.7153475, -0.281163, 1.213722, 0.5647059, 0, 1, 1,
0.7169195, -0.3930418, 2.32132, 0.572549, 0, 1, 1,
0.7181461, 1.983443, 1.666907, 0.5764706, 0, 1, 1,
0.724855, -0.2920921, 2.641564, 0.5843138, 0, 1, 1,
0.7264938, -0.4840386, 2.458637, 0.5882353, 0, 1, 1,
0.7296063, -0.08560474, 2.120926, 0.5960785, 0, 1, 1,
0.7305956, -0.2770349, 1.525172, 0.6039216, 0, 1, 1,
0.7342806, -0.8152354, 2.049495, 0.6078432, 0, 1, 1,
0.7401209, 0.5932745, -0.2910114, 0.6156863, 0, 1, 1,
0.7414811, 0.491181, 1.05738, 0.6196079, 0, 1, 1,
0.7426992, 0.8168033, -0.3418401, 0.627451, 0, 1, 1,
0.7439308, -0.9108626, 1.747301, 0.6313726, 0, 1, 1,
0.7459197, 0.6548668, 1.139859, 0.6392157, 0, 1, 1,
0.7496176, 1.395361, 0.4780854, 0.6431373, 0, 1, 1,
0.7503638, 1.776251, 0.5049638, 0.6509804, 0, 1, 1,
0.7529157, 1.183069, 0.907002, 0.654902, 0, 1, 1,
0.7575898, -0.4558273, 1.207267, 0.6627451, 0, 1, 1,
0.7611972, 1.564647, -0.07670394, 0.6666667, 0, 1, 1,
0.7616459, -1.129439, 2.78681, 0.6745098, 0, 1, 1,
0.7662332, -2.086986, 2.650372, 0.6784314, 0, 1, 1,
0.7696459, -1.480802, 3.106971, 0.6862745, 0, 1, 1,
0.7717793, 0.5902294, -0.08715659, 0.6901961, 0, 1, 1,
0.7719726, 1.753899, 1.256212, 0.6980392, 0, 1, 1,
0.7768992, 0.02041303, 1.570614, 0.7058824, 0, 1, 1,
0.779059, 0.7054533, 1.425687, 0.7098039, 0, 1, 1,
0.783825, -0.5490435, 1.290966, 0.7176471, 0, 1, 1,
0.7896957, 1.160486, 0.9339809, 0.7215686, 0, 1, 1,
0.7922664, 0.5801983, -0.814072, 0.7294118, 0, 1, 1,
0.7962959, 1.502557, -2.582227, 0.7333333, 0, 1, 1,
0.7987485, 1.005156, 2.670339, 0.7411765, 0, 1, 1,
0.799961, 0.6357443, -0.4723037, 0.7450981, 0, 1, 1,
0.8042444, -0.4119501, 0.2676359, 0.7529412, 0, 1, 1,
0.8100659, 0.8669178, 2.267487, 0.7568628, 0, 1, 1,
0.816787, 0.9319924, -1.207796, 0.7647059, 0, 1, 1,
0.8177195, -0.3436432, 2.365294, 0.7686275, 0, 1, 1,
0.8221028, 0.4346958, 0.06950053, 0.7764706, 0, 1, 1,
0.8226716, 0.5864409, 0.3804772, 0.7803922, 0, 1, 1,
0.831623, -0.4402016, 2.48427, 0.7882353, 0, 1, 1,
0.8316448, 0.4701834, -0.5295598, 0.7921569, 0, 1, 1,
0.8324198, -1.549364, 2.612999, 0.8, 0, 1, 1,
0.8372408, 0.2690993, 1.326352, 0.8078431, 0, 1, 1,
0.8491151, -0.06991904, 1.647788, 0.8117647, 0, 1, 1,
0.852761, -0.9669573, 1.073418, 0.8196079, 0, 1, 1,
0.8598251, 1.421959, 1.250791, 0.8235294, 0, 1, 1,
0.8604475, 1.460888, 1.428922, 0.8313726, 0, 1, 1,
0.8629549, -1.29176, 3.377092, 0.8352941, 0, 1, 1,
0.8658397, 0.6722796, 0.4051758, 0.8431373, 0, 1, 1,
0.870755, 1.328512, -0.1423467, 0.8470588, 0, 1, 1,
0.8759378, 0.6249351, -0.2261046, 0.854902, 0, 1, 1,
0.8773095, -0.4314489, 2.127562, 0.8588235, 0, 1, 1,
0.8839476, -1.083734, 2.482922, 0.8666667, 0, 1, 1,
0.8897155, -0.4679219, 3.094479, 0.8705882, 0, 1, 1,
0.8917755, 2.258442, 0.6694182, 0.8784314, 0, 1, 1,
0.9015351, 0.3875769, 1.374103, 0.8823529, 0, 1, 1,
0.9121332, 0.7188292, 1.435385, 0.8901961, 0, 1, 1,
0.9162183, -0.2685161, 3.217531, 0.8941177, 0, 1, 1,
0.9204428, 1.894775, 1.429789, 0.9019608, 0, 1, 1,
0.9207634, -0.4669937, -0.7792313, 0.9098039, 0, 1, 1,
0.9244333, 0.171398, 2.010124, 0.9137255, 0, 1, 1,
0.9288718, -0.01278534, 1.686898, 0.9215686, 0, 1, 1,
0.9302011, 1.030849, 0.9960897, 0.9254902, 0, 1, 1,
0.9331648, -0.616161, 1.787772, 0.9333333, 0, 1, 1,
0.9332319, 0.3346076, 1.33399, 0.9372549, 0, 1, 1,
0.9408245, 0.2268713, 2.258528, 0.945098, 0, 1, 1,
0.9417511, -0.5569162, 0.7144624, 0.9490196, 0, 1, 1,
0.9460394, 1.482008, -0.2642666, 0.9568627, 0, 1, 1,
0.9464705, 1.18809, 1.433353, 0.9607843, 0, 1, 1,
0.9495137, 1.353207, 1.188105, 0.9686275, 0, 1, 1,
0.9527277, 1.490904, 1.601501, 0.972549, 0, 1, 1,
0.9645644, 1.194481, -1.12167, 0.9803922, 0, 1, 1,
0.9662657, 1.349171, 1.524497, 0.9843137, 0, 1, 1,
0.970944, 1.910023, 0.4701921, 0.9921569, 0, 1, 1,
0.9736414, -1.007028, 0.8838401, 0.9960784, 0, 1, 1,
0.9857074, -2.5507, 2.520548, 1, 0, 0.9960784, 1,
0.994489, -1.281954, 2.393075, 1, 0, 0.9882353, 1,
0.9953528, 0.4715883, 1.272031, 1, 0, 0.9843137, 1,
0.997956, 0.2598865, 1.115718, 1, 0, 0.9764706, 1,
1.007705, 0.8410452, 1.248415, 1, 0, 0.972549, 1,
1.010736, -1.887148, 2.543106, 1, 0, 0.9647059, 1,
1.01522, 0.7605735, 1.664009, 1, 0, 0.9607843, 1,
1.017105, 0.3270755, 1.568935, 1, 0, 0.9529412, 1,
1.018469, -0.7933576, 0.8784323, 1, 0, 0.9490196, 1,
1.019236, 0.1894126, 2.222834, 1, 0, 0.9411765, 1,
1.022651, -0.438307, 3.462706, 1, 0, 0.9372549, 1,
1.024966, 0.2343314, 0.02422218, 1, 0, 0.9294118, 1,
1.028141, -0.9783278, 3.078542, 1, 0, 0.9254902, 1,
1.030942, -0.8499787, 0.4766132, 1, 0, 0.9176471, 1,
1.033442, -2.009102, 2.072921, 1, 0, 0.9137255, 1,
1.033583, 0.3485829, 2.175693, 1, 0, 0.9058824, 1,
1.047801, 0.7959534, 1.856236, 1, 0, 0.9019608, 1,
1.04959, 1.535908, 2.08432, 1, 0, 0.8941177, 1,
1.052024, 1.541625, -2.02299, 1, 0, 0.8862745, 1,
1.052025, 0.1197676, 1.777752, 1, 0, 0.8823529, 1,
1.063573, 1.549735, 1.593042, 1, 0, 0.8745098, 1,
1.065515, -2.151275, 1.394748, 1, 0, 0.8705882, 1,
1.068038, 2.311132, 0.6721062, 1, 0, 0.8627451, 1,
1.070144, 1.82797, -0.115133, 1, 0, 0.8588235, 1,
1.071242, 0.1362826, 1.562819, 1, 0, 0.8509804, 1,
1.083309, -0.9902923, 0.735199, 1, 0, 0.8470588, 1,
1.084728, -0.7522274, 1.021255, 1, 0, 0.8392157, 1,
1.092838, 0.4195785, 0.4663612, 1, 0, 0.8352941, 1,
1.096989, 0.4075985, -1.57776, 1, 0, 0.827451, 1,
1.100386, -0.7346159, 0.942624, 1, 0, 0.8235294, 1,
1.112083, 0.2543256, 1.215105, 1, 0, 0.8156863, 1,
1.113165, 0.1136862, 1.499739, 1, 0, 0.8117647, 1,
1.114509, 0.01115961, 2.986229, 1, 0, 0.8039216, 1,
1.1175, 3.222736, 0.5183748, 1, 0, 0.7960784, 1,
1.122961, -0.7605764, 2.462337, 1, 0, 0.7921569, 1,
1.123239, -0.3452198, 1.812459, 1, 0, 0.7843137, 1,
1.124862, 0.9304656, -2.011828, 1, 0, 0.7803922, 1,
1.126492, -0.6256517, 2.43655, 1, 0, 0.772549, 1,
1.13167, -2.045708, 2.126547, 1, 0, 0.7686275, 1,
1.132021, 0.2765461, 0.8634865, 1, 0, 0.7607843, 1,
1.133124, -0.2499896, 1.91663, 1, 0, 0.7568628, 1,
1.134743, 0.1532792, 2.722481, 1, 0, 0.7490196, 1,
1.13599, -1.655276, 1.477267, 1, 0, 0.7450981, 1,
1.136572, -0.1143379, 0.923628, 1, 0, 0.7372549, 1,
1.140103, 0.5207605, 1.808024, 1, 0, 0.7333333, 1,
1.14275, 0.7188517, 0.6806694, 1, 0, 0.7254902, 1,
1.145548, -0.02010549, 0.8345262, 1, 0, 0.7215686, 1,
1.145826, 1.090341, 1.722513, 1, 0, 0.7137255, 1,
1.146595, 1.148176, 1.20281, 1, 0, 0.7098039, 1,
1.152688, 0.3131753, 1.78436, 1, 0, 0.7019608, 1,
1.155149, -0.7876249, 1.528571, 1, 0, 0.6941177, 1,
1.174273, 0.969551, 1.281992, 1, 0, 0.6901961, 1,
1.177973, 1.00104, 3.773241, 1, 0, 0.682353, 1,
1.181366, 1.053079, 2.353131, 1, 0, 0.6784314, 1,
1.184339, -0.580979, 0.771709, 1, 0, 0.6705883, 1,
1.190828, 1.387643, 0.5061486, 1, 0, 0.6666667, 1,
1.205535, -0.421357, 2.237673, 1, 0, 0.6588235, 1,
1.210087, 0.4869983, 0.5657288, 1, 0, 0.654902, 1,
1.215238, 2.429091, 0.7480811, 1, 0, 0.6470588, 1,
1.217898, -0.3806611, 2.36477, 1, 0, 0.6431373, 1,
1.222316, -1.418867, 2.392389, 1, 0, 0.6352941, 1,
1.226002, 1.438001, 0.334085, 1, 0, 0.6313726, 1,
1.244546, 0.6748081, 2.795003, 1, 0, 0.6235294, 1,
1.246671, 0.9096348, 1.53411, 1, 0, 0.6196079, 1,
1.264538, 0.2275368, 1.965629, 1, 0, 0.6117647, 1,
1.269394, 0.08182765, 1.906366, 1, 0, 0.6078432, 1,
1.288736, -0.6729711, 1.127302, 1, 0, 0.6, 1,
1.295187, 0.5943686, 1.709887, 1, 0, 0.5921569, 1,
1.315554, -0.4547177, 2.781729, 1, 0, 0.5882353, 1,
1.330179, 0.5690044, 0.1664368, 1, 0, 0.5803922, 1,
1.336624, -0.1792635, 1.762933, 1, 0, 0.5764706, 1,
1.338097, -0.2303048, 1.729067, 1, 0, 0.5686275, 1,
1.338598, 0.3790227, -0.3414636, 1, 0, 0.5647059, 1,
1.347939, -0.2365335, 2.184536, 1, 0, 0.5568628, 1,
1.353983, 0.07367079, 0.9907556, 1, 0, 0.5529412, 1,
1.354989, 2.011516, -1.441542, 1, 0, 0.5450981, 1,
1.35653, 1.144252, 0.8018859, 1, 0, 0.5411765, 1,
1.362757, -0.2835886, 1.705103, 1, 0, 0.5333334, 1,
1.374774, -2.00526, 2.014685, 1, 0, 0.5294118, 1,
1.376934, -0.8375859, 0.771137, 1, 0, 0.5215687, 1,
1.385927, 0.2776397, 1.733835, 1, 0, 0.5176471, 1,
1.388997, -0.1100031, 1.698564, 1, 0, 0.509804, 1,
1.392084, 1.457481, 0.6929097, 1, 0, 0.5058824, 1,
1.401251, 0.03044439, 3.824867, 1, 0, 0.4980392, 1,
1.40218, 1.091651, 1.138528, 1, 0, 0.4901961, 1,
1.413211, -0.490493, 2.80216, 1, 0, 0.4862745, 1,
1.434101, -1.001923, 2.833622, 1, 0, 0.4784314, 1,
1.435104, 0.08712672, 2.082479, 1, 0, 0.4745098, 1,
1.441385, -1.6922, -0.1915487, 1, 0, 0.4666667, 1,
1.444843, 0.9702883, -0.1255124, 1, 0, 0.4627451, 1,
1.459624, -2.192159, 3.568182, 1, 0, 0.454902, 1,
1.470808, 0.2485449, 2.691796, 1, 0, 0.4509804, 1,
1.50735, 0.2312352, 0.8850899, 1, 0, 0.4431373, 1,
1.508796, -0.06756883, 1.32124, 1, 0, 0.4392157, 1,
1.508978, 1.026039, 1.304985, 1, 0, 0.4313726, 1,
1.511106, 0.4418962, 0.6718238, 1, 0, 0.427451, 1,
1.519966, 2.09669, 0.7288293, 1, 0, 0.4196078, 1,
1.531507, -0.08149797, 1.841398, 1, 0, 0.4156863, 1,
1.533198, -0.1259981, 2.131002, 1, 0, 0.4078431, 1,
1.536053, -1.226627, 2.014156, 1, 0, 0.4039216, 1,
1.536293, 1.33335, -1.42485, 1, 0, 0.3960784, 1,
1.539129, -1.404603, 1.704358, 1, 0, 0.3882353, 1,
1.545168, -1.320996, 3.110953, 1, 0, 0.3843137, 1,
1.545364, -0.6772577, 1.207543, 1, 0, 0.3764706, 1,
1.546466, -0.3446263, 3.261067, 1, 0, 0.372549, 1,
1.558564, -0.6694816, 1.365443, 1, 0, 0.3647059, 1,
1.574469, -1.122074, 1.719128, 1, 0, 0.3607843, 1,
1.574895, -1.035005, 1.966919, 1, 0, 0.3529412, 1,
1.576882, 1.474476, 0.5115107, 1, 0, 0.3490196, 1,
1.583783, -0.4033307, -0.2221429, 1, 0, 0.3411765, 1,
1.585849, 1.178626, -0.1729646, 1, 0, 0.3372549, 1,
1.588289, -0.685378, 1.752383, 1, 0, 0.3294118, 1,
1.598136, 1.565817, 1.281084, 1, 0, 0.3254902, 1,
1.626634, -0.4347091, 2.376471, 1, 0, 0.3176471, 1,
1.63789, 0.07566125, 0.6580228, 1, 0, 0.3137255, 1,
1.646708, -0.8612978, 3.525496, 1, 0, 0.3058824, 1,
1.649938, -0.007558311, 1.50412, 1, 0, 0.2980392, 1,
1.67451, 0.4662069, 2.355269, 1, 0, 0.2941177, 1,
1.693769, 2.321311, 0.7159786, 1, 0, 0.2862745, 1,
1.698203, -1.052286, 1.659274, 1, 0, 0.282353, 1,
1.698657, -0.700567, 0.7562359, 1, 0, 0.2745098, 1,
1.703087, -1.046344, 2.653021, 1, 0, 0.2705882, 1,
1.713703, 0.06864132, 1.9338, 1, 0, 0.2627451, 1,
1.720292, -0.9703237, 2.997522, 1, 0, 0.2588235, 1,
1.726352, 0.1539726, 2.6188, 1, 0, 0.2509804, 1,
1.735358, -0.832152, 1.726787, 1, 0, 0.2470588, 1,
1.749269, -1.07265, 3.881018, 1, 0, 0.2392157, 1,
1.774972, 1.203274, 1.262049, 1, 0, 0.2352941, 1,
1.775807, 0.03739144, 2.478678, 1, 0, 0.227451, 1,
1.786881, -0.07190022, 1.843665, 1, 0, 0.2235294, 1,
1.81152, 0.09104275, 2.96558, 1, 0, 0.2156863, 1,
1.842294, 1.306021, 0.1677913, 1, 0, 0.2117647, 1,
1.855517, 0.523285, 2.349045, 1, 0, 0.2039216, 1,
1.8816, -1.058926, 1.115162, 1, 0, 0.1960784, 1,
1.88366, -1.292268, 1.68894, 1, 0, 0.1921569, 1,
1.883679, 1.000727, 2.745672, 1, 0, 0.1843137, 1,
1.913228, 1.511692, 3.123573, 1, 0, 0.1803922, 1,
1.924497, -0.124888, 3.256938, 1, 0, 0.172549, 1,
1.940581, 0.4984522, -0.9755905, 1, 0, 0.1686275, 1,
1.943506, -1.818453, 1.477216, 1, 0, 0.1607843, 1,
1.943574, -2.30075, 2.111974, 1, 0, 0.1568628, 1,
1.987893, -0.5969249, 1.426555, 1, 0, 0.1490196, 1,
2.003717, -0.6341472, 1.365651, 1, 0, 0.145098, 1,
2.041344, 1.449923, 0.836587, 1, 0, 0.1372549, 1,
2.044241, 0.6479563, 2.177815, 1, 0, 0.1333333, 1,
2.070644, 0.6114087, 2.170499, 1, 0, 0.1254902, 1,
2.097916, -0.5742362, 3.625055, 1, 0, 0.1215686, 1,
2.105576, 0.500602, 0.5948978, 1, 0, 0.1137255, 1,
2.210445, 1.599859, -0.4814509, 1, 0, 0.1098039, 1,
2.213386, 0.2976498, 1.300641, 1, 0, 0.1019608, 1,
2.305288, -0.1959691, 1.965533, 1, 0, 0.09411765, 1,
2.334272, 0.810671, 1.364711, 1, 0, 0.09019608, 1,
2.356293, -0.2538117, 1.442737, 1, 0, 0.08235294, 1,
2.398042, 1.333508, 0.02381179, 1, 0, 0.07843138, 1,
2.408405, -1.104544, 2.027119, 1, 0, 0.07058824, 1,
2.484857, -0.603817, 1.568624, 1, 0, 0.06666667, 1,
2.486371, 1.612761, 1.699023, 1, 0, 0.05882353, 1,
2.525022, 0.3437397, 2.358659, 1, 0, 0.05490196, 1,
2.543251, 0.5463932, 0.3597971, 1, 0, 0.04705882, 1,
2.62324, -0.8055727, 1.014264, 1, 0, 0.04313726, 1,
2.641481, 2.106727, -0.6045378, 1, 0, 0.03529412, 1,
2.658426, 0.7614827, 0.4315813, 1, 0, 0.03137255, 1,
2.711783, 2.334418, 0.1656124, 1, 0, 0.02352941, 1,
2.928101, -0.6228528, 1.324425, 1, 0, 0.01960784, 1,
2.974377, -0.22251, 1.539226, 1, 0, 0.01176471, 1,
3.031569, -0.7947239, 3.725435, 1, 0, 0.007843138, 1
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
-0.1317459, -5.154038, -8.343123, 0, -0.5, 0.5, 0.5,
-0.1317459, -5.154038, -8.343123, 1, -0.5, 0.5, 0.5,
-0.1317459, -5.154038, -8.343123, 1, 1.5, 0.5, 0.5,
-0.1317459, -5.154038, -8.343123, 0, 1.5, 0.5, 0.5
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
-4.367425, -0.3586124, -8.343123, 0, -0.5, 0.5, 0.5,
-4.367425, -0.3586124, -8.343123, 1, -0.5, 0.5, 0.5,
-4.367425, -0.3586124, -8.343123, 1, 1.5, 0.5, 0.5,
-4.367425, -0.3586124, -8.343123, 0, 1.5, 0.5, 0.5
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
-4.367425, -5.154038, -0.6447299, 0, -0.5, 0.5, 0.5,
-4.367425, -5.154038, -0.6447299, 1, -0.5, 0.5, 0.5,
-4.367425, -5.154038, -0.6447299, 1, 1.5, 0.5, 0.5,
-4.367425, -5.154038, -0.6447299, 0, 1.5, 0.5, 0.5
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
-3, -4.047401, -6.566571,
3, -4.047401, -6.566571,
-3, -4.047401, -6.566571,
-3, -4.231841, -6.862663,
-2, -4.047401, -6.566571,
-2, -4.231841, -6.862663,
-1, -4.047401, -6.566571,
-1, -4.231841, -6.862663,
0, -4.047401, -6.566571,
0, -4.231841, -6.862663,
1, -4.047401, -6.566571,
1, -4.231841, -6.862663,
2, -4.047401, -6.566571,
2, -4.231841, -6.862663,
3, -4.047401, -6.566571,
3, -4.231841, -6.862663
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
-3, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
-3, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
-3, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
-3, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
-2, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
-2, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
-2, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
-2, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
-1, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
-1, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
-1, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
-1, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
0, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
0, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
0, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
0, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
1, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
1, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
1, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
1, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
2, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
2, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
2, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
2, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5,
3, -4.60072, -7.454847, 0, -0.5, 0.5, 0.5,
3, -4.60072, -7.454847, 1, -0.5, 0.5, 0.5,
3, -4.60072, -7.454847, 1, 1.5, 0.5, 0.5,
3, -4.60072, -7.454847, 0, 1.5, 0.5, 0.5
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
-3.389961, -2, -6.566571,
-3.389961, 2, -6.566571,
-3.389961, -2, -6.566571,
-3.552871, -2, -6.862663,
-3.389961, 0, -6.566571,
-3.552871, 0, -6.862663,
-3.389961, 2, -6.566571,
-3.552871, 2, -6.862663
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
-3.878693, -2, -7.454847, 0, -0.5, 0.5, 0.5,
-3.878693, -2, -7.454847, 1, -0.5, 0.5, 0.5,
-3.878693, -2, -7.454847, 1, 1.5, 0.5, 0.5,
-3.878693, -2, -7.454847, 0, 1.5, 0.5, 0.5,
-3.878693, 0, -7.454847, 0, -0.5, 0.5, 0.5,
-3.878693, 0, -7.454847, 1, -0.5, 0.5, 0.5,
-3.878693, 0, -7.454847, 1, 1.5, 0.5, 0.5,
-3.878693, 0, -7.454847, 0, 1.5, 0.5, 0.5,
-3.878693, 2, -7.454847, 0, -0.5, 0.5, 0.5,
-3.878693, 2, -7.454847, 1, -0.5, 0.5, 0.5,
-3.878693, 2, -7.454847, 1, 1.5, 0.5, 0.5,
-3.878693, 2, -7.454847, 0, 1.5, 0.5, 0.5
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
-3.389961, -4.047401, -6,
-3.389961, -4.047401, 4,
-3.389961, -4.047401, -6,
-3.552871, -4.231841, -6,
-3.389961, -4.047401, -4,
-3.552871, -4.231841, -4,
-3.389961, -4.047401, -2,
-3.552871, -4.231841, -2,
-3.389961, -4.047401, 0,
-3.552871, -4.231841, 0,
-3.389961, -4.047401, 2,
-3.552871, -4.231841, 2,
-3.389961, -4.047401, 4,
-3.552871, -4.231841, 4
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
-3.878693, -4.60072, -6, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -6, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -6, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, -6, 0, 1.5, 0.5, 0.5,
-3.878693, -4.60072, -4, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -4, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -4, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, -4, 0, 1.5, 0.5, 0.5,
-3.878693, -4.60072, -2, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -2, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, -2, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, -2, 0, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 0, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 0, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 0, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 0, 0, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 2, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 2, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 2, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 2, 0, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 4, 0, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 4, 1, -0.5, 0.5, 0.5,
-3.878693, -4.60072, 4, 1, 1.5, 0.5, 0.5,
-3.878693, -4.60072, 4, 0, 1.5, 0.5, 0.5
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
-3.389961, -4.047401, -6.566571,
-3.389961, 3.330177, -6.566571,
-3.389961, -4.047401, 5.277111,
-3.389961, 3.330177, 5.277111,
-3.389961, -4.047401, -6.566571,
-3.389961, -4.047401, 5.277111,
-3.389961, 3.330177, -6.566571,
-3.389961, 3.330177, 5.277111,
-3.389961, -4.047401, -6.566571,
3.126469, -4.047401, -6.566571,
-3.389961, -4.047401, 5.277111,
3.126469, -4.047401, 5.277111,
-3.389961, 3.330177, -6.566571,
3.126469, 3.330177, -6.566571,
-3.389961, 3.330177, 5.277111,
3.126469, 3.330177, 5.277111,
3.126469, -4.047401, -6.566571,
3.126469, 3.330177, -6.566571,
3.126469, -4.047401, 5.277111,
3.126469, 3.330177, 5.277111,
3.126469, -4.047401, -6.566571,
3.126469, -4.047401, 5.277111,
3.126469, 3.330177, -6.566571,
3.126469, 3.330177, 5.277111
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
var radius = 8.223393;
var distance = 36.58681;
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
mvMatrix.translate( 0.1317459, 0.3586124, 0.6447299 );
mvMatrix.scale( 1.364443, 1.205178, 0.7507204 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.58681);
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
quinol_sulfate<-read.table("quinol_sulfate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinol_sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
```

```r
y<-quinol_sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
```

```r
z<-quinol_sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
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
-3.295061, 0.5198572, -1.949061, 0, 0, 1, 1, 1,
-3.02382, 1.103452, -1.047459, 1, 0, 0, 1, 1,
-2.997654, -1.316971, -2.977613, 1, 0, 0, 1, 1,
-2.910205, 0.4118316, -0.3744827, 1, 0, 0, 1, 1,
-2.815619, -0.3557163, 0.08198705, 1, 0, 0, 1, 1,
-2.506608, -0.8375509, -0.8999422, 1, 0, 0, 1, 1,
-2.504694, 1.009933, -0.1461394, 0, 0, 0, 1, 1,
-2.483461, -2.457652, -2.321419, 0, 0, 0, 1, 1,
-2.448472, -1.195617, -1.650994, 0, 0, 0, 1, 1,
-2.42111, 0.1360115, -1.126911, 0, 0, 0, 1, 1,
-2.364957, 0.01006461, -3.263603, 0, 0, 0, 1, 1,
-2.305411, -0.5907258, -0.9926171, 0, 0, 0, 1, 1,
-2.245722, -1.694464, -2.543917, 0, 0, 0, 1, 1,
-2.188559, 0.2772275, 0.2653825, 1, 1, 1, 1, 1,
-2.182382, -0.4205492, -2.641384, 1, 1, 1, 1, 1,
-2.182339, 0.4809022, -1.068257, 1, 1, 1, 1, 1,
-2.172469, -0.6058497, -2.840538, 1, 1, 1, 1, 1,
-2.164788, 2.040621, -1.097577, 1, 1, 1, 1, 1,
-2.137188, -0.317501, -1.189817, 1, 1, 1, 1, 1,
-2.104568, -0.03882515, -1.368094, 1, 1, 1, 1, 1,
-2.099128, -2.07975, -1.353962, 1, 1, 1, 1, 1,
-2.063869, 0.6598243, -0.5265071, 1, 1, 1, 1, 1,
-2.058477, -0.1954489, -2.729442, 1, 1, 1, 1, 1,
-2.043617, -0.4075129, -1.490896, 1, 1, 1, 1, 1,
-1.987287, -0.0002514046, -0.9980264, 1, 1, 1, 1, 1,
-1.974972, 0.06051831, -1.711682, 1, 1, 1, 1, 1,
-1.956537, -0.3251346, -0.554113, 1, 1, 1, 1, 1,
-1.897935, -0.1832581, -1.234685, 1, 1, 1, 1, 1,
-1.897375, -1.204689, -1.729298, 0, 0, 1, 1, 1,
-1.877081, 0.9551478, -2.311689, 1, 0, 0, 1, 1,
-1.856996, 1.002259, 0.4444267, 1, 0, 0, 1, 1,
-1.843115, 0.3613828, -0.8935488, 1, 0, 0, 1, 1,
-1.824907, 0.5740889, -1.816226, 1, 0, 0, 1, 1,
-1.819428, -1.048085, -4.463152, 1, 0, 0, 1, 1,
-1.786517, 0.6522923, -3.309251, 0, 0, 0, 1, 1,
-1.777265, -1.603723, -2.213859, 0, 0, 0, 1, 1,
-1.742942, -0.03391213, -2.407364, 0, 0, 0, 1, 1,
-1.738783, -0.1605323, -2.559473, 0, 0, 0, 1, 1,
-1.714142, -0.2604847, -1.207309, 0, 0, 0, 1, 1,
-1.68329, -1.088531, -1.141518, 0, 0, 0, 1, 1,
-1.667922, -0.8737559, -2.508434, 0, 0, 0, 1, 1,
-1.648254, -0.3909622, -0.01315621, 1, 1, 1, 1, 1,
-1.638498, -0.7957397, -2.907383, 1, 1, 1, 1, 1,
-1.637664, 1.278098, 0.2124388, 1, 1, 1, 1, 1,
-1.619706, -0.3555408, -0.5086122, 1, 1, 1, 1, 1,
-1.614148, 0.8848122, -0.5741118, 1, 1, 1, 1, 1,
-1.599705, -0.008462708, -0.9459698, 1, 1, 1, 1, 1,
-1.595582, 0.1212748, -2.920101, 1, 1, 1, 1, 1,
-1.592644, -0.1084925, -0.7645989, 1, 1, 1, 1, 1,
-1.548945, -0.953257, -2.562509, 1, 1, 1, 1, 1,
-1.543406, -0.9348846, -3.264732, 1, 1, 1, 1, 1,
-1.537185, -0.46235, -1.817394, 1, 1, 1, 1, 1,
-1.526363, -0.4068063, -2.334903, 1, 1, 1, 1, 1,
-1.515839, -1.074804, -2.383583, 1, 1, 1, 1, 1,
-1.515345, -0.4684604, -2.573263, 1, 1, 1, 1, 1,
-1.515043, -0.2557073, -2.797212, 1, 1, 1, 1, 1,
-1.512787, -1.249207, -2.853345, 0, 0, 1, 1, 1,
-1.501602, -0.108606, -0.9909954, 1, 0, 0, 1, 1,
-1.5015, -0.8659141, -1.553553, 1, 0, 0, 1, 1,
-1.494349, 0.2961952, 0.3886595, 1, 0, 0, 1, 1,
-1.479351, -0.2823469, -2.178995, 1, 0, 0, 1, 1,
-1.468236, 0.439463, -2.027151, 1, 0, 0, 1, 1,
-1.452939, 1.226197, -1.323443, 0, 0, 0, 1, 1,
-1.450092, -0.6838418, -2.418637, 0, 0, 0, 1, 1,
-1.443662, 1.172796, -1.002637, 0, 0, 0, 1, 1,
-1.436426, 2.191117, 0.5446645, 0, 0, 0, 1, 1,
-1.434366, 0.349424, -2.329552, 0, 0, 0, 1, 1,
-1.427792, 0.2173901, -1.08395, 0, 0, 0, 1, 1,
-1.427014, -1.540541, 0.1744171, 0, 0, 0, 1, 1,
-1.423017, 0.6663617, -2.099826, 1, 1, 1, 1, 1,
-1.406673, -0.08715885, -1.39866, 1, 1, 1, 1, 1,
-1.399874, -0.6549589, -2.324288, 1, 1, 1, 1, 1,
-1.398163, 0.8621444, 0.5147573, 1, 1, 1, 1, 1,
-1.393565, 0.9305546, -2.029861, 1, 1, 1, 1, 1,
-1.376126, 1.705577, -1.276693, 1, 1, 1, 1, 1,
-1.36688, 0.4960107, -0.2221278, 1, 1, 1, 1, 1,
-1.353078, 0.1037423, -0.918085, 1, 1, 1, 1, 1,
-1.340496, 0.5440951, -1.22465, 1, 1, 1, 1, 1,
-1.337074, 0.1831178, -3.617325, 1, 1, 1, 1, 1,
-1.330113, 0.4413145, -0.5426315, 1, 1, 1, 1, 1,
-1.325144, -0.0227045, -2.056756, 1, 1, 1, 1, 1,
-1.317291, 0.08015029, -1.860838, 1, 1, 1, 1, 1,
-1.315495, 1.371514, -1.500012, 1, 1, 1, 1, 1,
-1.305837, 0.3696499, -2.228301, 1, 1, 1, 1, 1,
-1.302593, -0.9300046, -1.925028, 0, 0, 1, 1, 1,
-1.296177, 0.549476, -1.838452, 1, 0, 0, 1, 1,
-1.285174, -0.1660643, -1.238583, 1, 0, 0, 1, 1,
-1.281015, -0.06763012, -2.087931, 1, 0, 0, 1, 1,
-1.279724, -0.9995578, -3.261135, 1, 0, 0, 1, 1,
-1.277449, -0.08688453, -0.7768444, 1, 0, 0, 1, 1,
-1.27416, 1.465696, -0.3634506, 0, 0, 0, 1, 1,
-1.271601, 0.2963084, -1.680424, 0, 0, 0, 1, 1,
-1.269489, -1.416315, -3.159024, 0, 0, 0, 1, 1,
-1.265275, -1.221456, -3.855556, 0, 0, 0, 1, 1,
-1.264453, 0.7953063, 0.2989574, 0, 0, 0, 1, 1,
-1.264391, -0.02173367, -3.390766, 0, 0, 0, 1, 1,
-1.257548, 0.03771538, -0.3342839, 0, 0, 0, 1, 1,
-1.256738, 1.458589, -1.018497, 1, 1, 1, 1, 1,
-1.256716, 0.1404387, -0.733086, 1, 1, 1, 1, 1,
-1.255718, 1.385487, 0.2839516, 1, 1, 1, 1, 1,
-1.254036, 0.9305099, 0.4613358, 1, 1, 1, 1, 1,
-1.244449, 0.04111129, -1.022898, 1, 1, 1, 1, 1,
-1.243062, 1.351736, -1.009829, 1, 1, 1, 1, 1,
-1.241208, -0.4349954, -2.49024, 1, 1, 1, 1, 1,
-1.236529, -0.6486894, -2.969471, 1, 1, 1, 1, 1,
-1.231682, -2.740306, -1.437076, 1, 1, 1, 1, 1,
-1.229086, -0.6986182, -1.093198, 1, 1, 1, 1, 1,
-1.222314, 1.351758, -0.2218469, 1, 1, 1, 1, 1,
-1.21926, -1.222233, -2.309137, 1, 1, 1, 1, 1,
-1.209431, -0.5862497, -3.294909, 1, 1, 1, 1, 1,
-1.206627, -1.129372, -1.523477, 1, 1, 1, 1, 1,
-1.197868, 0.01317438, -2.159014, 1, 1, 1, 1, 1,
-1.190912, 0.09266645, -1.393352, 0, 0, 1, 1, 1,
-1.187717, -1.597252, -3.035562, 1, 0, 0, 1, 1,
-1.186224, 0.5088185, -0.4139778, 1, 0, 0, 1, 1,
-1.183843, 1.364046, -1.218196, 1, 0, 0, 1, 1,
-1.180887, -0.1552915, -1.732675, 1, 0, 0, 1, 1,
-1.180097, -0.7404746, -0.5382413, 1, 0, 0, 1, 1,
-1.176114, 0.1463211, -2.552496, 0, 0, 0, 1, 1,
-1.174052, 1.07561, 0.1746439, 0, 0, 0, 1, 1,
-1.1668, -1.306044, -2.557205, 0, 0, 0, 1, 1,
-1.165334, 0.6261261, -2.311528, 0, 0, 0, 1, 1,
-1.16378, 1.825239, -1.018076, 0, 0, 0, 1, 1,
-1.153577, -0.625303, -1.510957, 0, 0, 0, 1, 1,
-1.137575, -2.401222, -2.599801, 0, 0, 0, 1, 1,
-1.132794, 1.580718, -1.004952, 1, 1, 1, 1, 1,
-1.128072, -0.8998106, -1.810492, 1, 1, 1, 1, 1,
-1.126626, 0.6600192, -2.891028, 1, 1, 1, 1, 1,
-1.125499, 1.285345, 1.022734, 1, 1, 1, 1, 1,
-1.113185, 0.7862098, -2.408872, 1, 1, 1, 1, 1,
-1.104006, -0.3055354, -1.96602, 1, 1, 1, 1, 1,
-1.095471, 1.127738, -1.215098, 1, 1, 1, 1, 1,
-1.093311, 1.471035, -0.5373833, 1, 1, 1, 1, 1,
-1.090697, 1.291124, 0.388155, 1, 1, 1, 1, 1,
-1.085589, 0.05056307, -1.000363, 1, 1, 1, 1, 1,
-1.067498, -0.4796511, -2.811741, 1, 1, 1, 1, 1,
-1.062085, -0.6225556, -0.8670179, 1, 1, 1, 1, 1,
-1.059934, -0.07794985, -1.764737, 1, 1, 1, 1, 1,
-1.058803, -0.2441324, -1.517081, 1, 1, 1, 1, 1,
-1.057407, -1.997297, -4.686306, 1, 1, 1, 1, 1,
-1.054918, -0.6073222, -1.589499, 0, 0, 1, 1, 1,
-1.051044, 1.345511, 0.3260228, 1, 0, 0, 1, 1,
-1.04872, 1.62366, -1.289561, 1, 0, 0, 1, 1,
-1.046906, -0.1682019, -1.499685, 1, 0, 0, 1, 1,
-1.04459, -0.1079047, -2.587185, 1, 0, 0, 1, 1,
-1.044266, -0.5664504, -1.931597, 1, 0, 0, 1, 1,
-1.021795, -1.864397, -2.19177, 0, 0, 0, 1, 1,
-1.020642, 0.0581851, -0.7481661, 0, 0, 0, 1, 1,
-1.018628, -0.6767337, -2.784514, 0, 0, 0, 1, 1,
-1.015504, 1.060682, -0.7469394, 0, 0, 0, 1, 1,
-1.013958, 0.1314484, -0.3033932, 0, 0, 0, 1, 1,
-0.9960622, -1.791399, -1.916429, 0, 0, 0, 1, 1,
-0.995615, 1.13795, -0.5419989, 0, 0, 0, 1, 1,
-0.9857588, -0.103797, -1.003188, 1, 1, 1, 1, 1,
-0.9839963, 0.4307327, -1.295127, 1, 1, 1, 1, 1,
-0.9794157, -0.09517872, -2.520413, 1, 1, 1, 1, 1,
-0.9702427, 0.5510755, -1.20436, 1, 1, 1, 1, 1,
-0.9695553, -0.1735172, -2.032279, 1, 1, 1, 1, 1,
-0.9660042, 0.5264664, 0.8018214, 1, 1, 1, 1, 1,
-0.9573881, -1.622928, -3.596516, 1, 1, 1, 1, 1,
-0.957182, -1.171552, -2.617659, 1, 1, 1, 1, 1,
-0.9501055, -0.4646469, -2.935004, 1, 1, 1, 1, 1,
-0.9286152, 0.8951602, -1.711643, 1, 1, 1, 1, 1,
-0.9151033, -1.021071, -3.221136, 1, 1, 1, 1, 1,
-0.912509, -0.6930551, -3.132293, 1, 1, 1, 1, 1,
-0.9074725, -0.4076294, -2.791017, 1, 1, 1, 1, 1,
-0.9039224, 0.04930022, -1.749416, 1, 1, 1, 1, 1,
-0.8973563, 0.7504396, -1.207261, 1, 1, 1, 1, 1,
-0.8959435, 0.9756197, -2.010875, 0, 0, 1, 1, 1,
-0.8928761, -0.5917537, -2.691744, 1, 0, 0, 1, 1,
-0.8837239, 0.5389223, -0.7265918, 1, 0, 0, 1, 1,
-0.8766738, 1.069239, -0.7286191, 1, 0, 0, 1, 1,
-0.8688529, 0.06235395, -0.08051491, 1, 0, 0, 1, 1,
-0.8683537, -0.7306447, -1.544503, 1, 0, 0, 1, 1,
-0.8650391, -0.4524582, -3.84257, 0, 0, 0, 1, 1,
-0.859122, 0.2753018, -1.147783, 0, 0, 0, 1, 1,
-0.8437412, 0.574684, -0.744429, 0, 0, 0, 1, 1,
-0.843568, -0.3720131, -2.77164, 0, 0, 0, 1, 1,
-0.8407789, -0.1225185, -1.331356, 0, 0, 0, 1, 1,
-0.8373317, -0.1876569, -0.8601231, 0, 0, 0, 1, 1,
-0.8341556, 0.7785177, 1.399907, 0, 0, 0, 1, 1,
-0.8300735, 1.750225, -0.8459769, 1, 1, 1, 1, 1,
-0.8276905, 0.3731215, -0.792515, 1, 1, 1, 1, 1,
-0.8134388, 0.3131787, -0.6158623, 1, 1, 1, 1, 1,
-0.812737, 0.4403212, -3.474995, 1, 1, 1, 1, 1,
-0.8094239, -1.922117, -6.39409, 1, 1, 1, 1, 1,
-0.8044564, -0.5711902, -1.098988, 1, 1, 1, 1, 1,
-0.8006958, -1.872105, -1.48201, 1, 1, 1, 1, 1,
-0.7997383, -0.4373687, -1.29098, 1, 1, 1, 1, 1,
-0.7992637, 2.609734, 0.8317053, 1, 1, 1, 1, 1,
-0.7987768, 1.237875, -1.534354, 1, 1, 1, 1, 1,
-0.7934958, -0.4672128, -3.957325, 1, 1, 1, 1, 1,
-0.7886963, -0.4854154, -4.66875, 1, 1, 1, 1, 1,
-0.7866936, 0.4090708, 0.7487172, 1, 1, 1, 1, 1,
-0.7856653, -0.6639057, -2.957924, 1, 1, 1, 1, 1,
-0.7853899, 0.4983207, -1.412243, 1, 1, 1, 1, 1,
-0.7815903, -0.4270782, -0.9374101, 0, 0, 1, 1, 1,
-0.7807651, -0.296566, -2.503929, 1, 0, 0, 1, 1,
-0.7783695, 0.6453456, -2.523183, 1, 0, 0, 1, 1,
-0.777917, -0.6774263, -2.781678, 1, 0, 0, 1, 1,
-0.7735801, -0.9420546, 0.4589356, 1, 0, 0, 1, 1,
-0.773259, -1.207608, -3.110813, 1, 0, 0, 1, 1,
-0.7680211, 0.5827651, -1.142182, 0, 0, 0, 1, 1,
-0.7622853, -0.04236779, -2.192964, 0, 0, 0, 1, 1,
-0.7614809, -0.4611355, -3.285467, 0, 0, 0, 1, 1,
-0.7544047, -1.054546, -3.827246, 0, 0, 0, 1, 1,
-0.7537895, 1.220777, -0.01251806, 0, 0, 0, 1, 1,
-0.7449499, -1.737297, -1.488208, 0, 0, 0, 1, 1,
-0.7365822, 0.2330082, -1.973243, 0, 0, 0, 1, 1,
-0.731756, 1.955126, 1.090136, 1, 1, 1, 1, 1,
-0.7312544, 0.6706331, 0.447491, 1, 1, 1, 1, 1,
-0.7285019, -0.5010551, -1.816715, 1, 1, 1, 1, 1,
-0.7270652, -1.556457, -1.284652, 1, 1, 1, 1, 1,
-0.7231457, -0.1937984, 0.1220835, 1, 1, 1, 1, 1,
-0.7215447, 1.273139, -1.552181, 1, 1, 1, 1, 1,
-0.714511, 0.8883577, 0.1585682, 1, 1, 1, 1, 1,
-0.7136627, -0.008332358, -2.325522, 1, 1, 1, 1, 1,
-0.7105849, -0.4649345, -3.384033, 1, 1, 1, 1, 1,
-0.7079358, 0.5705586, -1.356188, 1, 1, 1, 1, 1,
-0.7068883, -0.2997306, -1.686663, 1, 1, 1, 1, 1,
-0.7042103, -0.4162228, -2.151514, 1, 1, 1, 1, 1,
-0.7038033, -1.008586, -2.678587, 1, 1, 1, 1, 1,
-0.7037124, -0.2529066, -2.076119, 1, 1, 1, 1, 1,
-0.7026038, -0.5802867, -2.670509, 1, 1, 1, 1, 1,
-0.7024246, -1.183303, -1.943052, 0, 0, 1, 1, 1,
-0.6991813, 0.9800128, 0.5922934, 1, 0, 0, 1, 1,
-0.6863281, 0.6718737, -2.194271, 1, 0, 0, 1, 1,
-0.6851547, -1.358591, -2.898542, 1, 0, 0, 1, 1,
-0.6780257, -0.1861956, -1.697991, 1, 0, 0, 1, 1,
-0.6753021, 0.02881624, -0.2837876, 1, 0, 0, 1, 1,
-0.6751289, -0.06968699, -0.8726973, 0, 0, 0, 1, 1,
-0.6722323, 0.5428423, 0.6868385, 0, 0, 0, 1, 1,
-0.6695282, -0.3899074, -1.325198, 0, 0, 0, 1, 1,
-0.6652483, 1.884628, 0.338262, 0, 0, 0, 1, 1,
-0.6625827, 0.1103669, -0.7600239, 0, 0, 0, 1, 1,
-0.6528713, -0.9769778, -1.646347, 0, 0, 0, 1, 1,
-0.6526607, 1.664297, -0.7849434, 0, 0, 0, 1, 1,
-0.6472617, -0.6655779, -2.92405, 1, 1, 1, 1, 1,
-0.6462102, -1.402863, -3.259095, 1, 1, 1, 1, 1,
-0.6447041, 1.601169, -0.938348, 1, 1, 1, 1, 1,
-0.6439349, 1.110167, 0.992503, 1, 1, 1, 1, 1,
-0.6340888, 2.119612, -0.7465366, 1, 1, 1, 1, 1,
-0.632287, 1.823082, -2.076512, 1, 1, 1, 1, 1,
-0.6302027, -0.4989774, -2.932209, 1, 1, 1, 1, 1,
-0.6292678, 0.7611765, -0.07401081, 1, 1, 1, 1, 1,
-0.6282873, -0.2447728, -0.2188568, 1, 1, 1, 1, 1,
-0.6274308, 0.07238453, -0.9572508, 1, 1, 1, 1, 1,
-0.619762, -1.173357, -2.251187, 1, 1, 1, 1, 1,
-0.6185781, -0.3329197, -2.598244, 1, 1, 1, 1, 1,
-0.6173794, 0.7689427, -1.313134, 1, 1, 1, 1, 1,
-0.6170499, 1.969915, -1.341161, 1, 1, 1, 1, 1,
-0.6137189, 0.7027206, -1.001604, 1, 1, 1, 1, 1,
-0.6093403, 1.121747, -0.1830066, 0, 0, 1, 1, 1,
-0.6087623, 1.041251, -2.067458, 1, 0, 0, 1, 1,
-0.6082513, -1.376181, -2.761136, 1, 0, 0, 1, 1,
-0.6059858, -1.002787, -2.098976, 1, 0, 0, 1, 1,
-0.6044129, 1.144214, -1.528011, 1, 0, 0, 1, 1,
-0.5995556, -1.111751, -1.657693, 1, 0, 0, 1, 1,
-0.5957941, 0.217748, -1.837404, 0, 0, 0, 1, 1,
-0.5942568, -2.251349, -1.885552, 0, 0, 0, 1, 1,
-0.5917596, -0.02317706, 0.07324538, 0, 0, 0, 1, 1,
-0.5892869, 0.0580455, -1.113265, 0, 0, 0, 1, 1,
-0.5887826, -0.116463, -0.5161631, 0, 0, 0, 1, 1,
-0.5880316, -0.71842, -2.518764, 0, 0, 0, 1, 1,
-0.5870245, 1.137882, 0.7797505, 0, 0, 0, 1, 1,
-0.5802912, 1.473352, 0.7186727, 1, 1, 1, 1, 1,
-0.5792994, -0.8755527, -2.024826, 1, 1, 1, 1, 1,
-0.5773596, -0.05971649, -1.973319, 1, 1, 1, 1, 1,
-0.5748042, 0.7542707, -0.9713626, 1, 1, 1, 1, 1,
-0.5728579, -1.099658, -2.641448, 1, 1, 1, 1, 1,
-0.572716, -0.8450409, -4.266586, 1, 1, 1, 1, 1,
-0.5670825, -0.7091397, -2.110339, 1, 1, 1, 1, 1,
-0.5616235, -0.7726715, -1.780827, 1, 1, 1, 1, 1,
-0.5511267, -0.8042571, -3.370026, 1, 1, 1, 1, 1,
-0.548456, 0.3584966, -2.637565, 1, 1, 1, 1, 1,
-0.5457649, -1.470887, -4.140608, 1, 1, 1, 1, 1,
-0.5447776, -0.3459075, -1.27325, 1, 1, 1, 1, 1,
-0.5434448, 0.3611617, -2.252338, 1, 1, 1, 1, 1,
-0.5392142, 0.01183251, -1.38904, 1, 1, 1, 1, 1,
-0.5390922, 1.191037, -0.8739846, 1, 1, 1, 1, 1,
-0.5379111, 1.228717, 0.5962241, 0, 0, 1, 1, 1,
-0.5350122, 0.5432622, 0.4513521, 1, 0, 0, 1, 1,
-0.5336417, 0.4280745, -0.644671, 1, 0, 0, 1, 1,
-0.5318063, 0.8311663, -2.348909, 1, 0, 0, 1, 1,
-0.52678, -1.841811, -3.312706, 1, 0, 0, 1, 1,
-0.5265853, -0.7488598, -4.410946, 1, 0, 0, 1, 1,
-0.524431, 0.9962964, -0.7637129, 0, 0, 0, 1, 1,
-0.5202854, 0.7763373, -0.0359737, 0, 0, 0, 1, 1,
-0.5185112, -1.03563, -3.920929, 0, 0, 0, 1, 1,
-0.5172486, 0.04726093, -2.033427, 0, 0, 0, 1, 1,
-0.5158606, 2.748541, -0.2869805, 0, 0, 0, 1, 1,
-0.513406, 0.8989241, -0.001014229, 0, 0, 0, 1, 1,
-0.5128668, 0.786865, -2.390369, 0, 0, 0, 1, 1,
-0.5003431, -1.570441, -1.752793, 1, 1, 1, 1, 1,
-0.4947638, -0.7498025, -2.178132, 1, 1, 1, 1, 1,
-0.4922116, -1.610894, -3.993081, 1, 1, 1, 1, 1,
-0.4891058, -0.451541, -3.278716, 1, 1, 1, 1, 1,
-0.4886134, -0.2046396, -2.022757, 1, 1, 1, 1, 1,
-0.48755, -0.4437658, -2.396555, 1, 1, 1, 1, 1,
-0.4849437, -3.349304, -2.166385, 1, 1, 1, 1, 1,
-0.4848242, 0.1572254, -0.2377733, 1, 1, 1, 1, 1,
-0.4804524, -0.7955547, -3.656751, 1, 1, 1, 1, 1,
-0.4789185, 0.1969388, -1.491812, 1, 1, 1, 1, 1,
-0.4782878, -0.6894965, -3.120036, 1, 1, 1, 1, 1,
-0.4715723, 0.7881337, -1.211736, 1, 1, 1, 1, 1,
-0.4715263, 1.27387, 0.3504902, 1, 1, 1, 1, 1,
-0.4699763, 1.508523, -1.507048, 1, 1, 1, 1, 1,
-0.4686577, -1.501289, -2.445178, 1, 1, 1, 1, 1,
-0.4669402, 0.6201186, 0.2027095, 0, 0, 1, 1, 1,
-0.4668732, -1.950951, -1.816351, 1, 0, 0, 1, 1,
-0.4667196, -0.5814031, -1.895088, 1, 0, 0, 1, 1,
-0.4640843, -0.7638092, -3.72638, 1, 0, 0, 1, 1,
-0.4640012, 0.6925249, -1.020183, 1, 0, 0, 1, 1,
-0.4604261, 0.06441011, -0.9051751, 1, 0, 0, 1, 1,
-0.4573569, 0.3421274, 0.8889947, 0, 0, 0, 1, 1,
-0.453056, -0.05772436, -1.628754, 0, 0, 0, 1, 1,
-0.4489151, -1.384104, -2.924003, 0, 0, 0, 1, 1,
-0.4462591, 1.531105, -0.8862512, 0, 0, 0, 1, 1,
-0.4460785, -1.649515, -1.467816, 0, 0, 0, 1, 1,
-0.4438343, 0.9297768, -0.8908983, 0, 0, 0, 1, 1,
-0.443014, 0.2981887, -0.5132948, 0, 0, 0, 1, 1,
-0.4398894, -0.4590397, -4.80721, 1, 1, 1, 1, 1,
-0.4383096, 1.046497, -0.0008753134, 1, 1, 1, 1, 1,
-0.4381036, 0.7848712, 0.2693622, 1, 1, 1, 1, 1,
-0.4363475, 2.276055, -0.04073334, 1, 1, 1, 1, 1,
-0.4352293, 0.4068711, -1.049517, 1, 1, 1, 1, 1,
-0.4332942, 0.7945327, -0.9579903, 1, 1, 1, 1, 1,
-0.4324762, 0.2232323, 1.367247, 1, 1, 1, 1, 1,
-0.4324688, 1.730332, -1.440577, 1, 1, 1, 1, 1,
-0.4247542, 0.09685928, -2.370371, 1, 1, 1, 1, 1,
-0.4235049, 0.9192253, -0.06069366, 1, 1, 1, 1, 1,
-0.4229409, -0.6867347, -2.340879, 1, 1, 1, 1, 1,
-0.4198322, -2.558114, -2.970955, 1, 1, 1, 1, 1,
-0.4185461, 0.03294976, -1.604134, 1, 1, 1, 1, 1,
-0.4183415, -0.3973345, -2.933524, 1, 1, 1, 1, 1,
-0.4177622, -2.455769, -3.147175, 1, 1, 1, 1, 1,
-0.4163493, 1.042067, -0.9718956, 0, 0, 1, 1, 1,
-0.4070604, 1.155253, -0.4630553, 1, 0, 0, 1, 1,
-0.4018845, -0.06033047, -2.193293, 1, 0, 0, 1, 1,
-0.4007854, 0.3370207, -0.7424013, 1, 0, 0, 1, 1,
-0.3997021, -0.6696288, -0.7794968, 1, 0, 0, 1, 1,
-0.3984012, -1.561699, -3.272303, 1, 0, 0, 1, 1,
-0.3955563, -0.6806793, -2.095517, 0, 0, 0, 1, 1,
-0.3923783, -2.69054, -4.150529, 0, 0, 0, 1, 1,
-0.386921, 1.244775, 0.4022214, 0, 0, 0, 1, 1,
-0.3848206, -0.4949847, -1.899297, 0, 0, 0, 1, 1,
-0.3782514, 0.4411896, -1.004098, 0, 0, 0, 1, 1,
-0.377933, -0.8472555, -3.162637, 0, 0, 0, 1, 1,
-0.3697277, 0.5355047, -0.8857831, 0, 0, 0, 1, 1,
-0.3682261, 0.107961, -0.9882591, 1, 1, 1, 1, 1,
-0.3675155, -0.3528351, -3.328491, 1, 1, 1, 1, 1,
-0.362585, 0.9037537, -0.4139634, 1, 1, 1, 1, 1,
-0.3567008, -0.5029742, -2.547115, 1, 1, 1, 1, 1,
-0.3510166, 1.147969, -0.04508707, 1, 1, 1, 1, 1,
-0.3509109, 1.647158, 0.2357831, 1, 1, 1, 1, 1,
-0.3498328, 0.4410751, -1.530843, 1, 1, 1, 1, 1,
-0.3462939, -1.655628, -3.691459, 1, 1, 1, 1, 1,
-0.3441155, 0.4733193, -2.518071, 1, 1, 1, 1, 1,
-0.3437901, 1.763744, 0.2719129, 1, 1, 1, 1, 1,
-0.3399339, -0.3364734, -3.163296, 1, 1, 1, 1, 1,
-0.3385463, -0.5805691, -2.087455, 1, 1, 1, 1, 1,
-0.3344361, -0.9369959, -2.235998, 1, 1, 1, 1, 1,
-0.3327722, -0.1642411, -1.941293, 1, 1, 1, 1, 1,
-0.3290627, 0.8180711, -0.1816635, 1, 1, 1, 1, 1,
-0.3229227, 0.6163765, 0.3399056, 0, 0, 1, 1, 1,
-0.3182625, 0.4243256, -0.7090294, 1, 0, 0, 1, 1,
-0.3137009, -0.3274567, -3.257492, 1, 0, 0, 1, 1,
-0.3128953, -1.125848, -3.71714, 1, 0, 0, 1, 1,
-0.3095403, 1.729366, 0.1015172, 1, 0, 0, 1, 1,
-0.3074374, -0.4389664, -3.429801, 1, 0, 0, 1, 1,
-0.3064517, -0.7280751, -2.22916, 0, 0, 0, 1, 1,
-0.3060244, -1.323255, -3.214029, 0, 0, 0, 1, 1,
-0.3054116, -1.963003, -5.830853, 0, 0, 0, 1, 1,
-0.3013467, 0.2893499, -0.7829409, 0, 0, 0, 1, 1,
-0.2962742, -0.748514, -3.621611, 0, 0, 0, 1, 1,
-0.2945393, -0.08209117, -1.257394, 0, 0, 0, 1, 1,
-0.2942237, -0.1782433, -3.872051, 0, 0, 0, 1, 1,
-0.292366, 0.1565388, -1.524822, 1, 1, 1, 1, 1,
-0.2875505, 0.1783151, -0.6632514, 1, 1, 1, 1, 1,
-0.2869562, -0.1640709, -3.520508, 1, 1, 1, 1, 1,
-0.2865696, -0.1791165, -1.511162, 1, 1, 1, 1, 1,
-0.2857842, -0.0571361, -2.237414, 1, 1, 1, 1, 1,
-0.2839162, 0.03809446, -0.4636334, 1, 1, 1, 1, 1,
-0.2797908, -0.3617995, -2.649137, 1, 1, 1, 1, 1,
-0.2749744, -0.1648761, -2.218758, 1, 1, 1, 1, 1,
-0.2730357, -0.4798338, -2.997766, 1, 1, 1, 1, 1,
-0.2724271, -0.5321751, -2.397017, 1, 1, 1, 1, 1,
-0.2718694, 1.474543, -0.4141267, 1, 1, 1, 1, 1,
-0.2714826, 0.05471708, -1.307777, 1, 1, 1, 1, 1,
-0.2702571, -0.02709909, -0.2420135, 1, 1, 1, 1, 1,
-0.2687185, 0.5048473, -0.7288021, 1, 1, 1, 1, 1,
-0.2604508, -0.9603309, -3.722409, 1, 1, 1, 1, 1,
-0.2574588, -0.2212438, -0.8446274, 0, 0, 1, 1, 1,
-0.2568054, -0.6875727, -3.319349, 1, 0, 0, 1, 1,
-0.2497375, -0.7648251, -0.3424394, 1, 0, 0, 1, 1,
-0.2426722, 0.6067548, -0.2811439, 1, 0, 0, 1, 1,
-0.2406434, -0.6837357, -1.26381, 1, 0, 0, 1, 1,
-0.2376893, 0.5401815, 1.855555, 1, 0, 0, 1, 1,
-0.2338048, 1.04177, -1.613342, 0, 0, 0, 1, 1,
-0.2331354, 0.01870747, -0.9652685, 0, 0, 0, 1, 1,
-0.2316957, 0.8666995, -1.313772, 0, 0, 0, 1, 1,
-0.2269762, -1.308365, -3.831659, 0, 0, 0, 1, 1,
-0.2258842, -0.03500064, -1.837276, 0, 0, 0, 1, 1,
-0.2240845, 0.2894904, -0.2516823, 0, 0, 0, 1, 1,
-0.223985, -0.837236, -3.438727, 0, 0, 0, 1, 1,
-0.2229936, 0.3234425, -0.8001344, 1, 1, 1, 1, 1,
-0.2207759, 0.5960494, 0.2683038, 1, 1, 1, 1, 1,
-0.2188414, 0.6443114, -0.3209178, 1, 1, 1, 1, 1,
-0.2166563, 1.08523, 1.549152, 1, 1, 1, 1, 1,
-0.2156781, 0.03607238, -1.063555, 1, 1, 1, 1, 1,
-0.2102989, -0.03016207, 0.576377, 1, 1, 1, 1, 1,
-0.2054331, -0.7091878, -3.799004, 1, 1, 1, 1, 1,
-0.2048233, -0.1762418, -2.018352, 1, 1, 1, 1, 1,
-0.201611, -1.705059, -5.263088, 1, 1, 1, 1, 1,
-0.2005097, 0.1226656, 0.579495, 1, 1, 1, 1, 1,
-0.1960049, 1.00858, 0.6758775, 1, 1, 1, 1, 1,
-0.1958326, 1.410964, -0.7028535, 1, 1, 1, 1, 1,
-0.195097, -0.7677521, -3.546518, 1, 1, 1, 1, 1,
-0.1948806, 0.135968, -2.096132, 1, 1, 1, 1, 1,
-0.1946539, -0.6604733, -2.368477, 1, 1, 1, 1, 1,
-0.194007, 2.579284, 0.1283818, 0, 0, 1, 1, 1,
-0.1929021, -0.8061992, -3.238787, 1, 0, 0, 1, 1,
-0.1913216, -1.645305, -3.523044, 1, 0, 0, 1, 1,
-0.1912553, -2.093151, -2.258102, 1, 0, 0, 1, 1,
-0.1900203, -0.9234077, -1.397893, 1, 0, 0, 1, 1,
-0.1894359, 1.262565, 2.203376, 1, 0, 0, 1, 1,
-0.1877918, 0.1340973, -1.155905, 0, 0, 0, 1, 1,
-0.1860537, 0.1729926, -0.6628295, 0, 0, 0, 1, 1,
-0.1851317, -0.02959704, -2.140646, 0, 0, 0, 1, 1,
-0.183506, -0.4178129, -2.606008, 0, 0, 0, 1, 1,
-0.1806811, -0.1219502, -2.401213, 0, 0, 0, 1, 1,
-0.1787062, -0.7364769, -1.08228, 0, 0, 0, 1, 1,
-0.1743467, -0.6201562, -1.915378, 0, 0, 0, 1, 1,
-0.1731984, -0.8090014, -3.273063, 1, 1, 1, 1, 1,
-0.1567427, -1.076034, -4.134863, 1, 1, 1, 1, 1,
-0.156085, 0.8984842, -0.1446635, 1, 1, 1, 1, 1,
-0.1538653, 0.292048, -0.8345088, 1, 1, 1, 1, 1,
-0.1537684, -1.469762, -1.577836, 1, 1, 1, 1, 1,
-0.1532939, 0.06897307, -2.070285, 1, 1, 1, 1, 1,
-0.1510355, 1.556479, 0.3636563, 1, 1, 1, 1, 1,
-0.1436537, 0.4515303, -0.5066123, 1, 1, 1, 1, 1,
-0.1418005, -0.2944806, -2.686131, 1, 1, 1, 1, 1,
-0.1389336, -1.653586, -2.4965, 1, 1, 1, 1, 1,
-0.1388722, -1.382021, -1.811152, 1, 1, 1, 1, 1,
-0.138787, 0.1605327, -2.378049, 1, 1, 1, 1, 1,
-0.1383588, -0.2715473, -1.380836, 1, 1, 1, 1, 1,
-0.1354243, -0.2651694, -3.401787, 1, 1, 1, 1, 1,
-0.1325394, -0.9749721, -3.095407, 1, 1, 1, 1, 1,
-0.1315707, 0.8898633, 0.7548574, 0, 0, 1, 1, 1,
-0.130445, -0.06807279, -0.8824582, 1, 0, 0, 1, 1,
-0.1297795, -0.004021026, -1.470453, 1, 0, 0, 1, 1,
-0.1295876, 0.414843, 1.163163, 1, 0, 0, 1, 1,
-0.1273652, -0.0503685, -1.25916, 1, 0, 0, 1, 1,
-0.1269317, 0.461629, 0.004994201, 1, 0, 0, 1, 1,
-0.121794, -1.304753, -2.118677, 0, 0, 0, 1, 1,
-0.1190155, 0.4826725, -1.192241, 0, 0, 0, 1, 1,
-0.118775, 0.6560391, 1.436088, 0, 0, 0, 1, 1,
-0.1176715, -0.1344409, -0.6714504, 0, 0, 0, 1, 1,
-0.1156805, -1.464457, -1.728957, 0, 0, 0, 1, 1,
-0.111186, 0.5427812, -0.3108732, 0, 0, 0, 1, 1,
-0.1086925, 1.272237, 0.5082279, 0, 0, 0, 1, 1,
-0.1030556, -0.6942786, -1.483298, 1, 1, 1, 1, 1,
-0.1014907, 0.08268641, -0.5525309, 1, 1, 1, 1, 1,
-0.1007035, -1.465027, -2.193636, 1, 1, 1, 1, 1,
-0.09567983, 1.646301, -0.7648148, 1, 1, 1, 1, 1,
-0.088899, -1.499642, -2.669152, 1, 1, 1, 1, 1,
-0.08844333, 0.6156932, -0.8010322, 1, 1, 1, 1, 1,
-0.08762508, -0.2514774, -2.94572, 1, 1, 1, 1, 1,
-0.08532845, -0.5424089, -2.735781, 1, 1, 1, 1, 1,
-0.08508866, -0.0001330008, -0.6907853, 1, 1, 1, 1, 1,
-0.08455059, -0.5450866, -2.768616, 1, 1, 1, 1, 1,
-0.08141364, -0.1808778, -5.649702, 1, 1, 1, 1, 1,
-0.06272005, -0.09976278, -1.616618, 1, 1, 1, 1, 1,
-0.05251107, 0.9656624, 1.379377, 1, 1, 1, 1, 1,
-0.05241416, 0.6629757, 0.08806219, 1, 1, 1, 1, 1,
-0.05105402, 0.01509335, -1.117539, 1, 1, 1, 1, 1,
-0.04953877, 0.8630909, 1.686019, 0, 0, 1, 1, 1,
-0.04832976, 0.3832825, 0.4282393, 1, 0, 0, 1, 1,
-0.04800614, 0.1883338, 0.530034, 1, 0, 0, 1, 1,
-0.04662498, 0.3880569, -0.4796665, 1, 0, 0, 1, 1,
-0.04481978, -0.6674739, -5.038132, 1, 0, 0, 1, 1,
-0.04135232, 0.6708279, -0.3958626, 1, 0, 0, 1, 1,
-0.04087052, -1.709114, -1.985591, 0, 0, 0, 1, 1,
-0.035191, -0.6657296, -1.658686, 0, 0, 0, 1, 1,
-0.02713076, 1.666286, -1.262484, 0, 0, 0, 1, 1,
-0.02075457, 0.1277334, 0.2576104, 0, 0, 0, 1, 1,
-0.01308128, -0.04941885, -3.395993, 0, 0, 0, 1, 1,
-0.01162583, 0.174222, -0.6429687, 0, 0, 0, 1, 1,
-0.01104226, -2.008395, -1.712062, 0, 0, 0, 1, 1,
-0.006026308, 0.1360127, 0.705409, 1, 1, 1, 1, 1,
-0.005271705, 0.06558603, 0.05347094, 1, 1, 1, 1, 1,
-0.003216041, -0.8998395, -2.144118, 1, 1, 1, 1, 1,
0.003512411, -1.382954, 5.10463, 1, 1, 1, 1, 1,
0.005387414, -1.314277, 3.096776, 1, 1, 1, 1, 1,
0.006377861, -0.007446852, 2.950661, 1, 1, 1, 1, 1,
0.006889096, 0.08625243, 1.088024, 1, 1, 1, 1, 1,
0.008281487, 2.643731, -2.651522, 1, 1, 1, 1, 1,
0.01166255, 0.3405627, 1.142126, 1, 1, 1, 1, 1,
0.01230045, -0.002846387, 2.127654, 1, 1, 1, 1, 1,
0.01237993, -0.349473, 2.440192, 1, 1, 1, 1, 1,
0.01331526, 1.036376, 1.0677, 1, 1, 1, 1, 1,
0.01346085, -0.2849696, 3.887448, 1, 1, 1, 1, 1,
0.0139877, 0.5305276, 0.141702, 1, 1, 1, 1, 1,
0.01535864, -0.7759971, 2.799782, 1, 1, 1, 1, 1,
0.02332681, -0.8957615, 4.088351, 0, 0, 1, 1, 1,
0.02355659, 0.9532513, 0.1408624, 1, 0, 0, 1, 1,
0.02387251, 0.8029743, 0.4295103, 1, 0, 0, 1, 1,
0.02401739, -0.3369649, 3.507771, 1, 0, 0, 1, 1,
0.02499665, 0.01969284, 1.757361, 1, 0, 0, 1, 1,
0.02571834, -1.29382, 3.775175, 1, 0, 0, 1, 1,
0.02800851, -0.2750838, 0.8367956, 0, 0, 0, 1, 1,
0.0307465, 0.0872497, 0.112175, 0, 0, 0, 1, 1,
0.04086369, 0.4871694, 1.038015, 0, 0, 0, 1, 1,
0.04118374, 0.6447736, -0.2658706, 0, 0, 0, 1, 1,
0.04158767, -1.182264, 4.886753, 0, 0, 0, 1, 1,
0.04504132, -0.04261774, 4.319115, 0, 0, 0, 1, 1,
0.05272135, 0.05065472, 0.4672787, 0, 0, 0, 1, 1,
0.05440743, -1.633538, 2.85272, 1, 1, 1, 1, 1,
0.05630039, 1.717692, 0.3592791, 1, 1, 1, 1, 1,
0.05778731, -0.8474382, 3.401209, 1, 1, 1, 1, 1,
0.06153952, 2.168875, -1.301939, 1, 1, 1, 1, 1,
0.0666021, 1.257619, -2.1201, 1, 1, 1, 1, 1,
0.06851845, 1.167951, -0.5283614, 1, 1, 1, 1, 1,
0.06976517, 2.766862, -0.9751819, 1, 1, 1, 1, 1,
0.06978032, 0.7792454, 0.4332679, 1, 1, 1, 1, 1,
0.06996621, -0.06093081, 2.070252, 1, 1, 1, 1, 1,
0.0739783, 0.4806157, 0.2298267, 1, 1, 1, 1, 1,
0.07484487, 0.1135689, -0.1127668, 1, 1, 1, 1, 1,
0.07546575, 1.724748, 0.9109715, 1, 1, 1, 1, 1,
0.07691628, 0.5690209, -0.02462418, 1, 1, 1, 1, 1,
0.08030079, -0.4795564, 2.249804, 1, 1, 1, 1, 1,
0.08358808, -0.5129983, 2.951389, 1, 1, 1, 1, 1,
0.08637591, -0.4769519, 2.720747, 0, 0, 1, 1, 1,
0.09045554, -1.148672, 4.386063, 1, 0, 0, 1, 1,
0.09204675, 0.3140734, 0.5524118, 1, 0, 0, 1, 1,
0.09269355, -0.5165957, 3.247299, 1, 0, 0, 1, 1,
0.0928214, 0.8530017, 1.212715, 1, 0, 0, 1, 1,
0.09454162, 0.3695018, 0.6481467, 1, 0, 0, 1, 1,
0.1001096, -0.8452594, 2.754745, 0, 0, 0, 1, 1,
0.1013341, -0.1060517, 0.577942, 0, 0, 0, 1, 1,
0.1025842, -1.691182, 2.444788, 0, 0, 0, 1, 1,
0.1043358, -1.632051, 3.170292, 0, 0, 0, 1, 1,
0.1078243, -0.419383, 1.527945, 0, 0, 0, 1, 1,
0.1094077, 1.405576, -0.4874234, 0, 0, 0, 1, 1,
0.1094642, 0.8442054, -0.4769625, 0, 0, 0, 1, 1,
0.1109069, 0.5291336, 0.4175397, 1, 1, 1, 1, 1,
0.1128499, -0.3782412, 2.910229, 1, 1, 1, 1, 1,
0.1171554, -0.5571481, 0.2316456, 1, 1, 1, 1, 1,
0.1208318, 2.275305, 0.496482, 1, 1, 1, 1, 1,
0.1239938, -0.9469848, 2.735561, 1, 1, 1, 1, 1,
0.1247068, 0.3059839, 1.010929, 1, 1, 1, 1, 1,
0.1264585, 0.2620846, -0.3200467, 1, 1, 1, 1, 1,
0.1270936, -1.78197, 4.096171, 1, 1, 1, 1, 1,
0.1290275, 0.2322677, -0.2390634, 1, 1, 1, 1, 1,
0.135336, -0.8443298, 1.89969, 1, 1, 1, 1, 1,
0.1368798, 0.2950806, 1.107005, 1, 1, 1, 1, 1,
0.1371214, -1.21632, 1.803474, 1, 1, 1, 1, 1,
0.139613, -0.02033639, 2.110958, 1, 1, 1, 1, 1,
0.1428649, -0.0146267, 2.564797, 1, 1, 1, 1, 1,
0.1440278, 1.583584, 1.751578, 1, 1, 1, 1, 1,
0.1442398, -1.280302, 3.946284, 0, 0, 1, 1, 1,
0.1449813, -0.02585225, 1.86063, 1, 0, 0, 1, 1,
0.1451693, 1.214975, 1.03337, 1, 0, 0, 1, 1,
0.1471681, -0.09616785, 0.8860362, 1, 0, 0, 1, 1,
0.1484842, -0.04880156, 1.306463, 1, 0, 0, 1, 1,
0.1521011, 1.102515, 1.69864, 1, 0, 0, 1, 1,
0.1522542, 1.186016, -0.1441753, 0, 0, 0, 1, 1,
0.1539397, -3.939961, 3.89953, 0, 0, 0, 1, 1,
0.1586896, 0.08423881, 2.774994, 0, 0, 0, 1, 1,
0.1656019, 0.6589194, 0.225563, 0, 0, 0, 1, 1,
0.1702122, 0.1528423, 1.182395, 0, 0, 0, 1, 1,
0.1740882, 0.4995067, 0.003074718, 0, 0, 0, 1, 1,
0.174203, -0.2875434, 1.879186, 0, 0, 0, 1, 1,
0.1757709, -0.6538857, 2.198534, 1, 1, 1, 1, 1,
0.1758092, -1.365129, 2.882135, 1, 1, 1, 1, 1,
0.175944, 1.877092, 0.9082097, 1, 1, 1, 1, 1,
0.1760455, -0.03557863, 3.221217, 1, 1, 1, 1, 1,
0.1784999, 1.325619, 0.5958273, 1, 1, 1, 1, 1,
0.1792203, -0.3476426, 4.603805, 1, 1, 1, 1, 1,
0.179595, 0.8448523, 1.577389, 1, 1, 1, 1, 1,
0.1818359, 0.6653351, 0.8143949, 1, 1, 1, 1, 1,
0.1824067, -0.184785, 0.3158051, 1, 1, 1, 1, 1,
0.1859131, -0.3275177, 2.807912, 1, 1, 1, 1, 1,
0.1869815, 1.619342, -0.8132889, 1, 1, 1, 1, 1,
0.1890654, 0.1300431, -0.5366697, 1, 1, 1, 1, 1,
0.2005548, -0.6895573, 1.823693, 1, 1, 1, 1, 1,
0.2071388, 2.760668, 1.557635, 1, 1, 1, 1, 1,
0.212986, 0.09003457, 2.088883, 1, 1, 1, 1, 1,
0.2144982, -1.369002, 2.470791, 0, 0, 1, 1, 1,
0.2145047, 1.46703, 0.09536184, 1, 0, 0, 1, 1,
0.2194621, 0.7318379, 0.4588798, 1, 0, 0, 1, 1,
0.2207348, 1.367838, 1.172333, 1, 0, 0, 1, 1,
0.2239028, 0.8178232, -0.07013654, 1, 0, 0, 1, 1,
0.2252632, -1.031257, 2.633435, 1, 0, 0, 1, 1,
0.2270564, 0.1258069, 1.818666, 0, 0, 0, 1, 1,
0.2294486, 0.2443147, 1.591488, 0, 0, 0, 1, 1,
0.2306943, 0.9836116, -0.3425956, 0, 0, 0, 1, 1,
0.2329211, 2.522799, 0.8300635, 0, 0, 0, 1, 1,
0.2376491, 0.1382628, 1.023339, 0, 0, 0, 1, 1,
0.240541, 1.441287, -0.2773566, 0, 0, 0, 1, 1,
0.2410022, 0.5160977, -1.958112, 0, 0, 0, 1, 1,
0.2438461, 0.3467537, 2.151165, 1, 1, 1, 1, 1,
0.2449914, 1.109722, 1.050472, 1, 1, 1, 1, 1,
0.2486024, -0.8595716, 2.122258, 1, 1, 1, 1, 1,
0.2495716, -0.4968742, 4.499147, 1, 1, 1, 1, 1,
0.2521197, 1.789001, 0.8484074, 1, 1, 1, 1, 1,
0.2527774, 0.2658962, -0.7920986, 1, 1, 1, 1, 1,
0.2541865, 0.1001776, 1.057391, 1, 1, 1, 1, 1,
0.2544107, 0.8125596, 0.4846871, 1, 1, 1, 1, 1,
0.2564974, 1.086179, -0.361406, 1, 1, 1, 1, 1,
0.2588938, 0.5840706, 2.377957, 1, 1, 1, 1, 1,
0.2610619, -1.047779, 3.378605, 1, 1, 1, 1, 1,
0.2618114, 1.677712, -0.6465307, 1, 1, 1, 1, 1,
0.2621457, 0.2313758, 1.063744, 1, 1, 1, 1, 1,
0.2674643, -1.207902, 1.929157, 1, 1, 1, 1, 1,
0.2683776, -0.2784435, 3.539219, 1, 1, 1, 1, 1,
0.2710296, 0.387462, 0.5441041, 0, 0, 1, 1, 1,
0.2710966, 1.939581, 0.4974577, 1, 0, 0, 1, 1,
0.271364, 1.497496, -1.185745, 1, 0, 0, 1, 1,
0.2719004, -1.187013, 1.391513, 1, 0, 0, 1, 1,
0.2777427, 0.4456216, -0.9122734, 1, 0, 0, 1, 1,
0.2806662, 0.2054406, -0.02117793, 1, 0, 0, 1, 1,
0.2818061, -0.6222606, 3.138258, 0, 0, 0, 1, 1,
0.2840914, 1.032122, -0.2357265, 0, 0, 0, 1, 1,
0.2868019, 1.604642, 0.7706826, 0, 0, 0, 1, 1,
0.2920125, -1.317392, 1.876576, 0, 0, 0, 1, 1,
0.2999396, 1.263909, -0.3469321, 0, 0, 0, 1, 1,
0.3011073, -1.589386, 4.195744, 0, 0, 0, 1, 1,
0.3019932, 1.773687, 2.052119, 0, 0, 0, 1, 1,
0.304626, 0.1134239, 0.6916639, 1, 1, 1, 1, 1,
0.3051074, 0.6429393, -0.1333295, 1, 1, 1, 1, 1,
0.3070907, 0.6765747, -0.09521713, 1, 1, 1, 1, 1,
0.3105327, 1.127759, 0.7314197, 1, 1, 1, 1, 1,
0.3115471, -1.687136, 2.194036, 1, 1, 1, 1, 1,
0.3146724, 0.722205, 0.8600606, 1, 1, 1, 1, 1,
0.3161927, -0.1324393, 2.511403, 1, 1, 1, 1, 1,
0.3186283, -0.2299105, 2.579905, 1, 1, 1, 1, 1,
0.3206038, -0.4915255, 2.711983, 1, 1, 1, 1, 1,
0.3242051, 1.156411, 1.164946, 1, 1, 1, 1, 1,
0.3261772, -1.758148, 2.074724, 1, 1, 1, 1, 1,
0.3286344, -0.6363187, 3.491294, 1, 1, 1, 1, 1,
0.3393726, -0.775776, 1.931089, 1, 1, 1, 1, 1,
0.3409868, 0.5583929, 0.5378003, 1, 1, 1, 1, 1,
0.3436674, 0.5781317, 1.083164, 1, 1, 1, 1, 1,
0.3489749, -1.487895, 2.680547, 0, 0, 1, 1, 1,
0.3501102, 0.629134, 1.834067, 1, 0, 0, 1, 1,
0.3501168, -0.5265944, 3.01938, 1, 0, 0, 1, 1,
0.3525008, -0.5615396, 3.182342, 1, 0, 0, 1, 1,
0.3622065, 0.2239161, -0.3137292, 1, 0, 0, 1, 1,
0.3626007, 0.221911, 0.794516, 1, 0, 0, 1, 1,
0.3646138, -0.9146695, 3.098785, 0, 0, 0, 1, 1,
0.3654584, 0.7035612, -0.06577255, 0, 0, 0, 1, 1,
0.3654897, 0.6269056, -1.091653, 0, 0, 0, 1, 1,
0.3723101, -0.07214213, 3.165818, 0, 0, 0, 1, 1,
0.3730329, 0.03558958, 1.980644, 0, 0, 0, 1, 1,
0.3785445, 1.066913, -0.2301692, 0, 0, 0, 1, 1,
0.3798836, 1.324223, 2.005507, 0, 0, 0, 1, 1,
0.380441, 1.030284, 1.705064, 1, 1, 1, 1, 1,
0.3820967, 0.5962397, 2.136137, 1, 1, 1, 1, 1,
0.3825806, -0.7055851, 2.565218, 1, 1, 1, 1, 1,
0.3853827, -0.8965076, 3.422011, 1, 1, 1, 1, 1,
0.3871373, 0.8144525, 1.819568, 1, 1, 1, 1, 1,
0.3927549, -0.2216337, 0.5739715, 1, 1, 1, 1, 1,
0.3933952, 0.5156707, 1.41286, 1, 1, 1, 1, 1,
0.3956057, -1.2457, 3.026546, 1, 1, 1, 1, 1,
0.4006463, 0.9913426, 2.441399, 1, 1, 1, 1, 1,
0.4011504, -0.2787257, 3.157368, 1, 1, 1, 1, 1,
0.4032175, -0.4991169, 3.28073, 1, 1, 1, 1, 1,
0.4060582, 0.2575804, 0.639446, 1, 1, 1, 1, 1,
0.4121849, -0.1294432, 2.350095, 1, 1, 1, 1, 1,
0.4127319, 0.7036156, 0.6772904, 1, 1, 1, 1, 1,
0.4205113, 0.02107382, 1.026608, 1, 1, 1, 1, 1,
0.4271126, 0.4905903, 0.08283442, 0, 0, 1, 1, 1,
0.4294698, -1.38166, 2.453472, 1, 0, 0, 1, 1,
0.4341276, -1.328273, 1.812284, 1, 0, 0, 1, 1,
0.4380965, -0.9509566, 3.220403, 1, 0, 0, 1, 1,
0.4403567, -1.966113, 1.52389, 1, 0, 0, 1, 1,
0.4449632, 0.651361, -0.9285889, 1, 0, 0, 1, 1,
0.4491695, -0.8304207, 2.15347, 0, 0, 0, 1, 1,
0.4506039, -0.07488675, 3.70919, 0, 0, 0, 1, 1,
0.4507695, 1.597924, -0.9591537, 0, 0, 0, 1, 1,
0.4546522, 0.02647355, 0.8694106, 0, 0, 0, 1, 1,
0.4584877, 0.008729005, 2.392434, 0, 0, 0, 1, 1,
0.4608767, -0.4672382, 3.811412, 0, 0, 0, 1, 1,
0.4669211, -0.4876449, 2.898428, 0, 0, 0, 1, 1,
0.4679292, -0.4804444, 2.394773, 1, 1, 1, 1, 1,
0.4687044, 0.4815739, 0.9967649, 1, 1, 1, 1, 1,
0.4708897, -0.619846, 1.592878, 1, 1, 1, 1, 1,
0.4719638, 0.7980475, -0.9091594, 1, 1, 1, 1, 1,
0.4769876, 2.031151, -0.9550332, 1, 1, 1, 1, 1,
0.4903393, 1.074296, 3.554974, 1, 1, 1, 1, 1,
0.4925516, 1.418009, -0.4548268, 1, 1, 1, 1, 1,
0.4932712, 1.712472, 0.2236994, 1, 1, 1, 1, 1,
0.4968824, 1.655947, -1.141208, 1, 1, 1, 1, 1,
0.5011204, 0.9485295, 0.7691852, 1, 1, 1, 1, 1,
0.501765, 0.2975762, 1.063567, 1, 1, 1, 1, 1,
0.5039404, 0.2581176, 0.9303349, 1, 1, 1, 1, 1,
0.5040398, 1.058674, 1.323203, 1, 1, 1, 1, 1,
0.50819, 1.984488, 0.5038022, 1, 1, 1, 1, 1,
0.5099267, 0.5316, -0.4956398, 1, 1, 1, 1, 1,
0.5141282, -0.4191867, 2.608222, 0, 0, 1, 1, 1,
0.519887, 0.0561429, 1.470468, 1, 0, 0, 1, 1,
0.5234911, 0.3195048, 1.382891, 1, 0, 0, 1, 1,
0.5283439, -1.956098, 3.408042, 1, 0, 0, 1, 1,
0.5303883, -0.4388618, 2.867203, 1, 0, 0, 1, 1,
0.5413495, -0.3723309, 3.423604, 1, 0, 0, 1, 1,
0.5478542, -0.05011603, 1.183296, 0, 0, 0, 1, 1,
0.5500126, -0.8667413, 0.6537504, 0, 0, 0, 1, 1,
0.5577952, 1.285882, 0.6205626, 0, 0, 0, 1, 1,
0.5622089, -0.178203, 3.019956, 0, 0, 0, 1, 1,
0.5632977, 1.413764, 0.1479651, 0, 0, 0, 1, 1,
0.5664493, 0.9912618, 1.374252, 0, 0, 0, 1, 1,
0.5683405, -0.1888519, 2.508053, 0, 0, 0, 1, 1,
0.5711479, 0.8124053, 2.274274, 1, 1, 1, 1, 1,
0.5783875, -0.1940402, 0.6400162, 1, 1, 1, 1, 1,
0.5801709, 0.8099811, 2.755225, 1, 1, 1, 1, 1,
0.5827203, -1.237887, 3.653311, 1, 1, 1, 1, 1,
0.5859402, 2.195755, 0.427432, 1, 1, 1, 1, 1,
0.5895445, -3.074272, 3.817251, 1, 1, 1, 1, 1,
0.5896662, 0.5601673, 2.40955, 1, 1, 1, 1, 1,
0.5964592, -0.5596772, 1.954221, 1, 1, 1, 1, 1,
0.5991026, -0.09312567, 1.790927, 1, 1, 1, 1, 1,
0.6019045, -0.6106077, 3.091562, 1, 1, 1, 1, 1,
0.6056512, 0.4943475, 3.446484, 1, 1, 1, 1, 1,
0.6082633, 0.0510448, 3.275364, 1, 1, 1, 1, 1,
0.6101281, -1.018357, 1.702233, 1, 1, 1, 1, 1,
0.6155589, 2.441846, -0.3736357, 1, 1, 1, 1, 1,
0.6213009, -0.5269643, 2.530919, 1, 1, 1, 1, 1,
0.6217099, 1.380606, 0.9948829, 0, 0, 1, 1, 1,
0.6230719, 1.190206, 1.680418, 1, 0, 0, 1, 1,
0.6258044, 0.6766246, 0.1150174, 1, 0, 0, 1, 1,
0.637722, -1.125482, 1.812875, 1, 0, 0, 1, 1,
0.646, 0.7554259, 1.29092, 1, 0, 0, 1, 1,
0.6492652, -1.58619, 1.953554, 1, 0, 0, 1, 1,
0.6510647, -1.124142, 4.348285, 0, 0, 0, 1, 1,
0.6510925, -0.657234, 2.623883, 0, 0, 0, 1, 1,
0.6518253, 1.123355, 1.471679, 0, 0, 0, 1, 1,
0.6582611, -1.205616, 3.294801, 0, 0, 0, 1, 1,
0.6597031, 0.3774327, 1.843018, 0, 0, 0, 1, 1,
0.6608123, -0.8837925, 2.10628, 0, 0, 0, 1, 1,
0.6633005, 0.1333068, 1.553692, 0, 0, 0, 1, 1,
0.6685638, 0.3119481, 0.7252015, 1, 1, 1, 1, 1,
0.671939, -1.111694, 3.271298, 1, 1, 1, 1, 1,
0.6771418, 0.8929225, 1.163517, 1, 1, 1, 1, 1,
0.6775802, 0.9329002, -0.486625, 1, 1, 1, 1, 1,
0.6811217, 0.513712, 1.404901, 1, 1, 1, 1, 1,
0.6859212, -1.306908, 4.484232, 1, 1, 1, 1, 1,
0.6894615, 0.3532568, 0.396571, 1, 1, 1, 1, 1,
0.6904641, -0.7209739, 1.19984, 1, 1, 1, 1, 1,
0.692883, 0.3490805, 2.469764, 1, 1, 1, 1, 1,
0.6931136, -1.855845, 2.367622, 1, 1, 1, 1, 1,
0.6953757, 0.5704649, 1.2772, 1, 1, 1, 1, 1,
0.6969926, 0.4266419, -0.19541, 1, 1, 1, 1, 1,
0.6998183, 0.4972124, 1.114447, 1, 1, 1, 1, 1,
0.7027843, 0.3830511, -1.704952, 1, 1, 1, 1, 1,
0.7058549, -0.3062475, 2.315926, 1, 1, 1, 1, 1,
0.7082305, 0.566647, 1.575715, 0, 0, 1, 1, 1,
0.7088706, -1.937601, 3.713854, 1, 0, 0, 1, 1,
0.7102166, -1.480189, 1.625146, 1, 0, 0, 1, 1,
0.7121841, -0.8693058, 3.103843, 1, 0, 0, 1, 1,
0.7129931, 0.1187468, 1.273994, 1, 0, 0, 1, 1,
0.7153475, -0.281163, 1.213722, 1, 0, 0, 1, 1,
0.7169195, -0.3930418, 2.32132, 0, 0, 0, 1, 1,
0.7181461, 1.983443, 1.666907, 0, 0, 0, 1, 1,
0.724855, -0.2920921, 2.641564, 0, 0, 0, 1, 1,
0.7264938, -0.4840386, 2.458637, 0, 0, 0, 1, 1,
0.7296063, -0.08560474, 2.120926, 0, 0, 0, 1, 1,
0.7305956, -0.2770349, 1.525172, 0, 0, 0, 1, 1,
0.7342806, -0.8152354, 2.049495, 0, 0, 0, 1, 1,
0.7401209, 0.5932745, -0.2910114, 1, 1, 1, 1, 1,
0.7414811, 0.491181, 1.05738, 1, 1, 1, 1, 1,
0.7426992, 0.8168033, -0.3418401, 1, 1, 1, 1, 1,
0.7439308, -0.9108626, 1.747301, 1, 1, 1, 1, 1,
0.7459197, 0.6548668, 1.139859, 1, 1, 1, 1, 1,
0.7496176, 1.395361, 0.4780854, 1, 1, 1, 1, 1,
0.7503638, 1.776251, 0.5049638, 1, 1, 1, 1, 1,
0.7529157, 1.183069, 0.907002, 1, 1, 1, 1, 1,
0.7575898, -0.4558273, 1.207267, 1, 1, 1, 1, 1,
0.7611972, 1.564647, -0.07670394, 1, 1, 1, 1, 1,
0.7616459, -1.129439, 2.78681, 1, 1, 1, 1, 1,
0.7662332, -2.086986, 2.650372, 1, 1, 1, 1, 1,
0.7696459, -1.480802, 3.106971, 1, 1, 1, 1, 1,
0.7717793, 0.5902294, -0.08715659, 1, 1, 1, 1, 1,
0.7719726, 1.753899, 1.256212, 1, 1, 1, 1, 1,
0.7768992, 0.02041303, 1.570614, 0, 0, 1, 1, 1,
0.779059, 0.7054533, 1.425687, 1, 0, 0, 1, 1,
0.783825, -0.5490435, 1.290966, 1, 0, 0, 1, 1,
0.7896957, 1.160486, 0.9339809, 1, 0, 0, 1, 1,
0.7922664, 0.5801983, -0.814072, 1, 0, 0, 1, 1,
0.7962959, 1.502557, -2.582227, 1, 0, 0, 1, 1,
0.7987485, 1.005156, 2.670339, 0, 0, 0, 1, 1,
0.799961, 0.6357443, -0.4723037, 0, 0, 0, 1, 1,
0.8042444, -0.4119501, 0.2676359, 0, 0, 0, 1, 1,
0.8100659, 0.8669178, 2.267487, 0, 0, 0, 1, 1,
0.816787, 0.9319924, -1.207796, 0, 0, 0, 1, 1,
0.8177195, -0.3436432, 2.365294, 0, 0, 0, 1, 1,
0.8221028, 0.4346958, 0.06950053, 0, 0, 0, 1, 1,
0.8226716, 0.5864409, 0.3804772, 1, 1, 1, 1, 1,
0.831623, -0.4402016, 2.48427, 1, 1, 1, 1, 1,
0.8316448, 0.4701834, -0.5295598, 1, 1, 1, 1, 1,
0.8324198, -1.549364, 2.612999, 1, 1, 1, 1, 1,
0.8372408, 0.2690993, 1.326352, 1, 1, 1, 1, 1,
0.8491151, -0.06991904, 1.647788, 1, 1, 1, 1, 1,
0.852761, -0.9669573, 1.073418, 1, 1, 1, 1, 1,
0.8598251, 1.421959, 1.250791, 1, 1, 1, 1, 1,
0.8604475, 1.460888, 1.428922, 1, 1, 1, 1, 1,
0.8629549, -1.29176, 3.377092, 1, 1, 1, 1, 1,
0.8658397, 0.6722796, 0.4051758, 1, 1, 1, 1, 1,
0.870755, 1.328512, -0.1423467, 1, 1, 1, 1, 1,
0.8759378, 0.6249351, -0.2261046, 1, 1, 1, 1, 1,
0.8773095, -0.4314489, 2.127562, 1, 1, 1, 1, 1,
0.8839476, -1.083734, 2.482922, 1, 1, 1, 1, 1,
0.8897155, -0.4679219, 3.094479, 0, 0, 1, 1, 1,
0.8917755, 2.258442, 0.6694182, 1, 0, 0, 1, 1,
0.9015351, 0.3875769, 1.374103, 1, 0, 0, 1, 1,
0.9121332, 0.7188292, 1.435385, 1, 0, 0, 1, 1,
0.9162183, -0.2685161, 3.217531, 1, 0, 0, 1, 1,
0.9204428, 1.894775, 1.429789, 1, 0, 0, 1, 1,
0.9207634, -0.4669937, -0.7792313, 0, 0, 0, 1, 1,
0.9244333, 0.171398, 2.010124, 0, 0, 0, 1, 1,
0.9288718, -0.01278534, 1.686898, 0, 0, 0, 1, 1,
0.9302011, 1.030849, 0.9960897, 0, 0, 0, 1, 1,
0.9331648, -0.616161, 1.787772, 0, 0, 0, 1, 1,
0.9332319, 0.3346076, 1.33399, 0, 0, 0, 1, 1,
0.9408245, 0.2268713, 2.258528, 0, 0, 0, 1, 1,
0.9417511, -0.5569162, 0.7144624, 1, 1, 1, 1, 1,
0.9460394, 1.482008, -0.2642666, 1, 1, 1, 1, 1,
0.9464705, 1.18809, 1.433353, 1, 1, 1, 1, 1,
0.9495137, 1.353207, 1.188105, 1, 1, 1, 1, 1,
0.9527277, 1.490904, 1.601501, 1, 1, 1, 1, 1,
0.9645644, 1.194481, -1.12167, 1, 1, 1, 1, 1,
0.9662657, 1.349171, 1.524497, 1, 1, 1, 1, 1,
0.970944, 1.910023, 0.4701921, 1, 1, 1, 1, 1,
0.9736414, -1.007028, 0.8838401, 1, 1, 1, 1, 1,
0.9857074, -2.5507, 2.520548, 1, 1, 1, 1, 1,
0.994489, -1.281954, 2.393075, 1, 1, 1, 1, 1,
0.9953528, 0.4715883, 1.272031, 1, 1, 1, 1, 1,
0.997956, 0.2598865, 1.115718, 1, 1, 1, 1, 1,
1.007705, 0.8410452, 1.248415, 1, 1, 1, 1, 1,
1.010736, -1.887148, 2.543106, 1, 1, 1, 1, 1,
1.01522, 0.7605735, 1.664009, 0, 0, 1, 1, 1,
1.017105, 0.3270755, 1.568935, 1, 0, 0, 1, 1,
1.018469, -0.7933576, 0.8784323, 1, 0, 0, 1, 1,
1.019236, 0.1894126, 2.222834, 1, 0, 0, 1, 1,
1.022651, -0.438307, 3.462706, 1, 0, 0, 1, 1,
1.024966, 0.2343314, 0.02422218, 1, 0, 0, 1, 1,
1.028141, -0.9783278, 3.078542, 0, 0, 0, 1, 1,
1.030942, -0.8499787, 0.4766132, 0, 0, 0, 1, 1,
1.033442, -2.009102, 2.072921, 0, 0, 0, 1, 1,
1.033583, 0.3485829, 2.175693, 0, 0, 0, 1, 1,
1.047801, 0.7959534, 1.856236, 0, 0, 0, 1, 1,
1.04959, 1.535908, 2.08432, 0, 0, 0, 1, 1,
1.052024, 1.541625, -2.02299, 0, 0, 0, 1, 1,
1.052025, 0.1197676, 1.777752, 1, 1, 1, 1, 1,
1.063573, 1.549735, 1.593042, 1, 1, 1, 1, 1,
1.065515, -2.151275, 1.394748, 1, 1, 1, 1, 1,
1.068038, 2.311132, 0.6721062, 1, 1, 1, 1, 1,
1.070144, 1.82797, -0.115133, 1, 1, 1, 1, 1,
1.071242, 0.1362826, 1.562819, 1, 1, 1, 1, 1,
1.083309, -0.9902923, 0.735199, 1, 1, 1, 1, 1,
1.084728, -0.7522274, 1.021255, 1, 1, 1, 1, 1,
1.092838, 0.4195785, 0.4663612, 1, 1, 1, 1, 1,
1.096989, 0.4075985, -1.57776, 1, 1, 1, 1, 1,
1.100386, -0.7346159, 0.942624, 1, 1, 1, 1, 1,
1.112083, 0.2543256, 1.215105, 1, 1, 1, 1, 1,
1.113165, 0.1136862, 1.499739, 1, 1, 1, 1, 1,
1.114509, 0.01115961, 2.986229, 1, 1, 1, 1, 1,
1.1175, 3.222736, 0.5183748, 1, 1, 1, 1, 1,
1.122961, -0.7605764, 2.462337, 0, 0, 1, 1, 1,
1.123239, -0.3452198, 1.812459, 1, 0, 0, 1, 1,
1.124862, 0.9304656, -2.011828, 1, 0, 0, 1, 1,
1.126492, -0.6256517, 2.43655, 1, 0, 0, 1, 1,
1.13167, -2.045708, 2.126547, 1, 0, 0, 1, 1,
1.132021, 0.2765461, 0.8634865, 1, 0, 0, 1, 1,
1.133124, -0.2499896, 1.91663, 0, 0, 0, 1, 1,
1.134743, 0.1532792, 2.722481, 0, 0, 0, 1, 1,
1.13599, -1.655276, 1.477267, 0, 0, 0, 1, 1,
1.136572, -0.1143379, 0.923628, 0, 0, 0, 1, 1,
1.140103, 0.5207605, 1.808024, 0, 0, 0, 1, 1,
1.14275, 0.7188517, 0.6806694, 0, 0, 0, 1, 1,
1.145548, -0.02010549, 0.8345262, 0, 0, 0, 1, 1,
1.145826, 1.090341, 1.722513, 1, 1, 1, 1, 1,
1.146595, 1.148176, 1.20281, 1, 1, 1, 1, 1,
1.152688, 0.3131753, 1.78436, 1, 1, 1, 1, 1,
1.155149, -0.7876249, 1.528571, 1, 1, 1, 1, 1,
1.174273, 0.969551, 1.281992, 1, 1, 1, 1, 1,
1.177973, 1.00104, 3.773241, 1, 1, 1, 1, 1,
1.181366, 1.053079, 2.353131, 1, 1, 1, 1, 1,
1.184339, -0.580979, 0.771709, 1, 1, 1, 1, 1,
1.190828, 1.387643, 0.5061486, 1, 1, 1, 1, 1,
1.205535, -0.421357, 2.237673, 1, 1, 1, 1, 1,
1.210087, 0.4869983, 0.5657288, 1, 1, 1, 1, 1,
1.215238, 2.429091, 0.7480811, 1, 1, 1, 1, 1,
1.217898, -0.3806611, 2.36477, 1, 1, 1, 1, 1,
1.222316, -1.418867, 2.392389, 1, 1, 1, 1, 1,
1.226002, 1.438001, 0.334085, 1, 1, 1, 1, 1,
1.244546, 0.6748081, 2.795003, 0, 0, 1, 1, 1,
1.246671, 0.9096348, 1.53411, 1, 0, 0, 1, 1,
1.264538, 0.2275368, 1.965629, 1, 0, 0, 1, 1,
1.269394, 0.08182765, 1.906366, 1, 0, 0, 1, 1,
1.288736, -0.6729711, 1.127302, 1, 0, 0, 1, 1,
1.295187, 0.5943686, 1.709887, 1, 0, 0, 1, 1,
1.315554, -0.4547177, 2.781729, 0, 0, 0, 1, 1,
1.330179, 0.5690044, 0.1664368, 0, 0, 0, 1, 1,
1.336624, -0.1792635, 1.762933, 0, 0, 0, 1, 1,
1.338097, -0.2303048, 1.729067, 0, 0, 0, 1, 1,
1.338598, 0.3790227, -0.3414636, 0, 0, 0, 1, 1,
1.347939, -0.2365335, 2.184536, 0, 0, 0, 1, 1,
1.353983, 0.07367079, 0.9907556, 0, 0, 0, 1, 1,
1.354989, 2.011516, -1.441542, 1, 1, 1, 1, 1,
1.35653, 1.144252, 0.8018859, 1, 1, 1, 1, 1,
1.362757, -0.2835886, 1.705103, 1, 1, 1, 1, 1,
1.374774, -2.00526, 2.014685, 1, 1, 1, 1, 1,
1.376934, -0.8375859, 0.771137, 1, 1, 1, 1, 1,
1.385927, 0.2776397, 1.733835, 1, 1, 1, 1, 1,
1.388997, -0.1100031, 1.698564, 1, 1, 1, 1, 1,
1.392084, 1.457481, 0.6929097, 1, 1, 1, 1, 1,
1.401251, 0.03044439, 3.824867, 1, 1, 1, 1, 1,
1.40218, 1.091651, 1.138528, 1, 1, 1, 1, 1,
1.413211, -0.490493, 2.80216, 1, 1, 1, 1, 1,
1.434101, -1.001923, 2.833622, 1, 1, 1, 1, 1,
1.435104, 0.08712672, 2.082479, 1, 1, 1, 1, 1,
1.441385, -1.6922, -0.1915487, 1, 1, 1, 1, 1,
1.444843, 0.9702883, -0.1255124, 1, 1, 1, 1, 1,
1.459624, -2.192159, 3.568182, 0, 0, 1, 1, 1,
1.470808, 0.2485449, 2.691796, 1, 0, 0, 1, 1,
1.50735, 0.2312352, 0.8850899, 1, 0, 0, 1, 1,
1.508796, -0.06756883, 1.32124, 1, 0, 0, 1, 1,
1.508978, 1.026039, 1.304985, 1, 0, 0, 1, 1,
1.511106, 0.4418962, 0.6718238, 1, 0, 0, 1, 1,
1.519966, 2.09669, 0.7288293, 0, 0, 0, 1, 1,
1.531507, -0.08149797, 1.841398, 0, 0, 0, 1, 1,
1.533198, -0.1259981, 2.131002, 0, 0, 0, 1, 1,
1.536053, -1.226627, 2.014156, 0, 0, 0, 1, 1,
1.536293, 1.33335, -1.42485, 0, 0, 0, 1, 1,
1.539129, -1.404603, 1.704358, 0, 0, 0, 1, 1,
1.545168, -1.320996, 3.110953, 0, 0, 0, 1, 1,
1.545364, -0.6772577, 1.207543, 1, 1, 1, 1, 1,
1.546466, -0.3446263, 3.261067, 1, 1, 1, 1, 1,
1.558564, -0.6694816, 1.365443, 1, 1, 1, 1, 1,
1.574469, -1.122074, 1.719128, 1, 1, 1, 1, 1,
1.574895, -1.035005, 1.966919, 1, 1, 1, 1, 1,
1.576882, 1.474476, 0.5115107, 1, 1, 1, 1, 1,
1.583783, -0.4033307, -0.2221429, 1, 1, 1, 1, 1,
1.585849, 1.178626, -0.1729646, 1, 1, 1, 1, 1,
1.588289, -0.685378, 1.752383, 1, 1, 1, 1, 1,
1.598136, 1.565817, 1.281084, 1, 1, 1, 1, 1,
1.626634, -0.4347091, 2.376471, 1, 1, 1, 1, 1,
1.63789, 0.07566125, 0.6580228, 1, 1, 1, 1, 1,
1.646708, -0.8612978, 3.525496, 1, 1, 1, 1, 1,
1.649938, -0.007558311, 1.50412, 1, 1, 1, 1, 1,
1.67451, 0.4662069, 2.355269, 1, 1, 1, 1, 1,
1.693769, 2.321311, 0.7159786, 0, 0, 1, 1, 1,
1.698203, -1.052286, 1.659274, 1, 0, 0, 1, 1,
1.698657, -0.700567, 0.7562359, 1, 0, 0, 1, 1,
1.703087, -1.046344, 2.653021, 1, 0, 0, 1, 1,
1.713703, 0.06864132, 1.9338, 1, 0, 0, 1, 1,
1.720292, -0.9703237, 2.997522, 1, 0, 0, 1, 1,
1.726352, 0.1539726, 2.6188, 0, 0, 0, 1, 1,
1.735358, -0.832152, 1.726787, 0, 0, 0, 1, 1,
1.749269, -1.07265, 3.881018, 0, 0, 0, 1, 1,
1.774972, 1.203274, 1.262049, 0, 0, 0, 1, 1,
1.775807, 0.03739144, 2.478678, 0, 0, 0, 1, 1,
1.786881, -0.07190022, 1.843665, 0, 0, 0, 1, 1,
1.81152, 0.09104275, 2.96558, 0, 0, 0, 1, 1,
1.842294, 1.306021, 0.1677913, 1, 1, 1, 1, 1,
1.855517, 0.523285, 2.349045, 1, 1, 1, 1, 1,
1.8816, -1.058926, 1.115162, 1, 1, 1, 1, 1,
1.88366, -1.292268, 1.68894, 1, 1, 1, 1, 1,
1.883679, 1.000727, 2.745672, 1, 1, 1, 1, 1,
1.913228, 1.511692, 3.123573, 1, 1, 1, 1, 1,
1.924497, -0.124888, 3.256938, 1, 1, 1, 1, 1,
1.940581, 0.4984522, -0.9755905, 1, 1, 1, 1, 1,
1.943506, -1.818453, 1.477216, 1, 1, 1, 1, 1,
1.943574, -2.30075, 2.111974, 1, 1, 1, 1, 1,
1.987893, -0.5969249, 1.426555, 1, 1, 1, 1, 1,
2.003717, -0.6341472, 1.365651, 1, 1, 1, 1, 1,
2.041344, 1.449923, 0.836587, 1, 1, 1, 1, 1,
2.044241, 0.6479563, 2.177815, 1, 1, 1, 1, 1,
2.070644, 0.6114087, 2.170499, 1, 1, 1, 1, 1,
2.097916, -0.5742362, 3.625055, 0, 0, 1, 1, 1,
2.105576, 0.500602, 0.5948978, 1, 0, 0, 1, 1,
2.210445, 1.599859, -0.4814509, 1, 0, 0, 1, 1,
2.213386, 0.2976498, 1.300641, 1, 0, 0, 1, 1,
2.305288, -0.1959691, 1.965533, 1, 0, 0, 1, 1,
2.334272, 0.810671, 1.364711, 1, 0, 0, 1, 1,
2.356293, -0.2538117, 1.442737, 0, 0, 0, 1, 1,
2.398042, 1.333508, 0.02381179, 0, 0, 0, 1, 1,
2.408405, -1.104544, 2.027119, 0, 0, 0, 1, 1,
2.484857, -0.603817, 1.568624, 0, 0, 0, 1, 1,
2.486371, 1.612761, 1.699023, 0, 0, 0, 1, 1,
2.525022, 0.3437397, 2.358659, 0, 0, 0, 1, 1,
2.543251, 0.5463932, 0.3597971, 0, 0, 0, 1, 1,
2.62324, -0.8055727, 1.014264, 1, 1, 1, 1, 1,
2.641481, 2.106727, -0.6045378, 1, 1, 1, 1, 1,
2.658426, 0.7614827, 0.4315813, 1, 1, 1, 1, 1,
2.711783, 2.334418, 0.1656124, 1, 1, 1, 1, 1,
2.928101, -0.6228528, 1.324425, 1, 1, 1, 1, 1,
2.974377, -0.22251, 1.539226, 1, 1, 1, 1, 1,
3.031569, -0.7947239, 3.725435, 1, 1, 1, 1, 1
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
var radius = 10.07421;
var distance = 35.38524;
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
mvMatrix.translate( 0.1317458, 0.3586123, 0.6447299 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.38524);
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
