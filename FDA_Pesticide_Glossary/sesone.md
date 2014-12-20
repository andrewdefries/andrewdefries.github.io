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
-2.623837, 0.2077218, -1.231694, 1, 0, 0, 1,
-2.60529, -0.2231849, -0.3924948, 1, 0.007843138, 0, 1,
-2.544636, -0.6686621, -2.905628, 1, 0.01176471, 0, 1,
-2.536915, 0.4402253, -0.8901287, 1, 0.01960784, 0, 1,
-2.432518, -0.04555782, -0.6119957, 1, 0.02352941, 0, 1,
-2.412668, 0.1086207, -3.062616, 1, 0.03137255, 0, 1,
-2.400684, 0.7632968, -0.8926223, 1, 0.03529412, 0, 1,
-2.332611, -1.622693, -3.682149, 1, 0.04313726, 0, 1,
-2.314737, -0.6328468, -2.302148, 1, 0.04705882, 0, 1,
-2.274539, 0.2346878, -1.405367, 1, 0.05490196, 0, 1,
-2.238833, -0.1248686, -0.3145804, 1, 0.05882353, 0, 1,
-2.230119, 0.1199127, -1.079458, 1, 0.06666667, 0, 1,
-2.174835, 0.497449, -2.738613, 1, 0.07058824, 0, 1,
-2.174674, 0.351579, -0.8431187, 1, 0.07843138, 0, 1,
-2.155065, -1.084718, -0.6803849, 1, 0.08235294, 0, 1,
-2.15456, -0.4862294, -1.138517, 1, 0.09019608, 0, 1,
-2.139472, 0.6609957, -0.8640583, 1, 0.09411765, 0, 1,
-2.110105, 0.4668532, -0.9627244, 1, 0.1019608, 0, 1,
-2.095662, -1.042017, -2.217075, 1, 0.1098039, 0, 1,
-2.058584, -0.2714852, -0.1650939, 1, 0.1137255, 0, 1,
-2.038431, 1.096274, -0.9948873, 1, 0.1215686, 0, 1,
-2.034457, 0.02307184, -0.5895045, 1, 0.1254902, 0, 1,
-2.032712, -0.01842638, -2.630708, 1, 0.1333333, 0, 1,
-2.016537, -1.338734, -0.1049058, 1, 0.1372549, 0, 1,
-2.009771, 0.9104201, -2.438478, 1, 0.145098, 0, 1,
-1.967951, -0.5854203, -0.4990413, 1, 0.1490196, 0, 1,
-1.939249, 1.666069, -0.4699362, 1, 0.1568628, 0, 1,
-1.935383, -1.028659, -1.295434, 1, 0.1607843, 0, 1,
-1.918402, 0.104753, -3.084712, 1, 0.1686275, 0, 1,
-1.897886, -2.715441, -0.5829092, 1, 0.172549, 0, 1,
-1.857615, -1.227627, -2.353654, 1, 0.1803922, 0, 1,
-1.853093, -0.5932475, -3.632766, 1, 0.1843137, 0, 1,
-1.843284, 0.7469705, -2.325154, 1, 0.1921569, 0, 1,
-1.842346, 0.1840994, -1.065051, 1, 0.1960784, 0, 1,
-1.84056, 0.9524026, 1.074918, 1, 0.2039216, 0, 1,
-1.840316, -1.270836, -1.607727, 1, 0.2117647, 0, 1,
-1.833727, -1.595998, -0.8608549, 1, 0.2156863, 0, 1,
-1.806193, 0.05759427, -0.9416432, 1, 0.2235294, 0, 1,
-1.803757, 0.8628151, -1.036487, 1, 0.227451, 0, 1,
-1.738653, -0.3649492, -2.790687, 1, 0.2352941, 0, 1,
-1.703787, -0.72708, -1.571045, 1, 0.2392157, 0, 1,
-1.662953, -1.157102, -1.84863, 1, 0.2470588, 0, 1,
-1.641625, 0.6358345, -1.031459, 1, 0.2509804, 0, 1,
-1.636258, -0.1146737, -2.181243, 1, 0.2588235, 0, 1,
-1.630564, 1.473874, -1.90781, 1, 0.2627451, 0, 1,
-1.609751, -1.650852, -0.9763442, 1, 0.2705882, 0, 1,
-1.60498, -0.1281285, -1.472449, 1, 0.2745098, 0, 1,
-1.583858, 2.145165, -1.368939, 1, 0.282353, 0, 1,
-1.57674, 0.7760304, -1.767875, 1, 0.2862745, 0, 1,
-1.56665, -0.3723483, -2.886334, 1, 0.2941177, 0, 1,
-1.564726, -2.124131, -2.906567, 1, 0.3019608, 0, 1,
-1.554261, -1.389757, -3.159708, 1, 0.3058824, 0, 1,
-1.538478, -0.6401745, -1.481158, 1, 0.3137255, 0, 1,
-1.535535, 0.560809, -1.098219, 1, 0.3176471, 0, 1,
-1.53428, 0.07668377, -1.612909, 1, 0.3254902, 0, 1,
-1.529371, 0.7991322, -0.5623958, 1, 0.3294118, 0, 1,
-1.524011, 0.06080726, -1.863222, 1, 0.3372549, 0, 1,
-1.508164, 1.591324, -2.152471, 1, 0.3411765, 0, 1,
-1.50476, -0.3077874, -0.5463352, 1, 0.3490196, 0, 1,
-1.484577, -0.4340332, -1.686475, 1, 0.3529412, 0, 1,
-1.479722, 0.04371151, -1.897613, 1, 0.3607843, 0, 1,
-1.478365, -0.9574444, -1.20775, 1, 0.3647059, 0, 1,
-1.477517, -0.8240763, -2.789337, 1, 0.372549, 0, 1,
-1.466848, -0.1164984, -3.678548, 1, 0.3764706, 0, 1,
-1.466441, 0.5651863, -1.264904, 1, 0.3843137, 0, 1,
-1.455951, -0.5406373, -2.681454, 1, 0.3882353, 0, 1,
-1.453831, -0.2973424, -1.966843, 1, 0.3960784, 0, 1,
-1.453671, -0.07177223, -1.058363, 1, 0.4039216, 0, 1,
-1.431207, -0.2636689, -2.36726, 1, 0.4078431, 0, 1,
-1.429896, -0.2725324, -1.882957, 1, 0.4156863, 0, 1,
-1.415946, -0.4755982, -0.502027, 1, 0.4196078, 0, 1,
-1.411025, 0.2527699, -2.148732, 1, 0.427451, 0, 1,
-1.408753, 0.7473584, -2.897424, 1, 0.4313726, 0, 1,
-1.397299, 0.2312094, -1.984163, 1, 0.4392157, 0, 1,
-1.390487, -1.154786, -2.191439, 1, 0.4431373, 0, 1,
-1.388849, 0.334689, -2.514924, 1, 0.4509804, 0, 1,
-1.383503, -1.898277, -1.5036, 1, 0.454902, 0, 1,
-1.350595, -1.525371, -2.729023, 1, 0.4627451, 0, 1,
-1.344241, -1.336284, 0.2429956, 1, 0.4666667, 0, 1,
-1.342176, -1.6604, -1.770902, 1, 0.4745098, 0, 1,
-1.341772, -0.699131, 0.09050507, 1, 0.4784314, 0, 1,
-1.33519, 0.6610714, -2.875027, 1, 0.4862745, 0, 1,
-1.326691, -0.4154558, -3.281576, 1, 0.4901961, 0, 1,
-1.3216, 0.3158783, -1.452782, 1, 0.4980392, 0, 1,
-1.319272, 0.2676367, -1.24916, 1, 0.5058824, 0, 1,
-1.305907, 0.4357448, -1.174005, 1, 0.509804, 0, 1,
-1.297181, 0.5559181, -1.177241, 1, 0.5176471, 0, 1,
-1.296776, -1.327033, -1.302116, 1, 0.5215687, 0, 1,
-1.294523, 0.4010914, -0.6472075, 1, 0.5294118, 0, 1,
-1.290417, 1.069059, 0.4085619, 1, 0.5333334, 0, 1,
-1.283656, -0.2189707, -0.8726304, 1, 0.5411765, 0, 1,
-1.281608, -0.7889533, -3.276035, 1, 0.5450981, 0, 1,
-1.280845, 1.115584, -2.294226, 1, 0.5529412, 0, 1,
-1.27622, -1.599354, -1.687856, 1, 0.5568628, 0, 1,
-1.272877, -0.415635, -2.123899, 1, 0.5647059, 0, 1,
-1.267509, 0.07248966, -2.932324, 1, 0.5686275, 0, 1,
-1.266448, 0.5454749, -2.422793, 1, 0.5764706, 0, 1,
-1.262999, -0.7656151, -1.027386, 1, 0.5803922, 0, 1,
-1.244587, -0.8700542, -1.974378, 1, 0.5882353, 0, 1,
-1.242346, -0.3759325, -0.440565, 1, 0.5921569, 0, 1,
-1.235867, -0.707948, -3.823093, 1, 0.6, 0, 1,
-1.234357, 0.3924101, 1.015718, 1, 0.6078432, 0, 1,
-1.231873, 0.3852577, -1.897475, 1, 0.6117647, 0, 1,
-1.229496, 0.7390218, -0.4498286, 1, 0.6196079, 0, 1,
-1.22773, 0.7204773, -2.464836, 1, 0.6235294, 0, 1,
-1.224153, -2.287913, -4.408398, 1, 0.6313726, 0, 1,
-1.219911, -0.2796933, -1.138579, 1, 0.6352941, 0, 1,
-1.218952, 0.6179044, -0.09317943, 1, 0.6431373, 0, 1,
-1.217352, -0.4161904, -0.4781438, 1, 0.6470588, 0, 1,
-1.217071, 1.610071, -0.8161784, 1, 0.654902, 0, 1,
-1.216737, 0.4106177, 0.1929434, 1, 0.6588235, 0, 1,
-1.210109, 1.850448, -0.1858128, 1, 0.6666667, 0, 1,
-1.208719, 0.4386222, -1.182976, 1, 0.6705883, 0, 1,
-1.200278, -0.5189503, -4.335349, 1, 0.6784314, 0, 1,
-1.199115, 1.744511, -0.6342388, 1, 0.682353, 0, 1,
-1.195548, -0.4640277, -1.868813, 1, 0.6901961, 0, 1,
-1.189563, -1.536386, -3.245916, 1, 0.6941177, 0, 1,
-1.180172, 0.2050104, -1.889249, 1, 0.7019608, 0, 1,
-1.178708, -0.3274779, -2.010952, 1, 0.7098039, 0, 1,
-1.177353, -0.5661561, -2.698765, 1, 0.7137255, 0, 1,
-1.171196, -0.195972, -3.995287, 1, 0.7215686, 0, 1,
-1.170282, -0.3569076, -1.1199, 1, 0.7254902, 0, 1,
-1.17005, 0.3257383, -1.758437, 1, 0.7333333, 0, 1,
-1.169582, 0.990364, -0.8931762, 1, 0.7372549, 0, 1,
-1.139827, -0.4338039, -1.374704, 1, 0.7450981, 0, 1,
-1.137097, 0.5223868, -1.428391, 1, 0.7490196, 0, 1,
-1.135519, 1.290542, 0.259068, 1, 0.7568628, 0, 1,
-1.134318, -0.8119206, -1.624998, 1, 0.7607843, 0, 1,
-1.120327, -0.1495502, -1.759799, 1, 0.7686275, 0, 1,
-1.114972, -0.5589541, -2.011801, 1, 0.772549, 0, 1,
-1.111459, -0.07819746, -0.2269669, 1, 0.7803922, 0, 1,
-1.109279, 1.853976, 0.3370136, 1, 0.7843137, 0, 1,
-1.10767, -0.2665828, -1.847473, 1, 0.7921569, 0, 1,
-1.107134, 0.08169644, -0.862721, 1, 0.7960784, 0, 1,
-1.104478, 0.01222028, -0.8643421, 1, 0.8039216, 0, 1,
-1.10137, -1.097231, -3.158968, 1, 0.8117647, 0, 1,
-1.096434, -0.2221528, -0.5090546, 1, 0.8156863, 0, 1,
-1.083315, -1.085879, -1.027331, 1, 0.8235294, 0, 1,
-1.08114, 0.08418678, -1.172943, 1, 0.827451, 0, 1,
-1.077068, 0.4984077, -1.991031, 1, 0.8352941, 0, 1,
-1.072699, 0.491653, -1.908265, 1, 0.8392157, 0, 1,
-1.071752, 0.3389692, -2.247754, 1, 0.8470588, 0, 1,
-1.059849, -0.8974612, -0.767678, 1, 0.8509804, 0, 1,
-1.056727, 1.441772, -1.30342, 1, 0.8588235, 0, 1,
-1.05459, -1.268357, -2.4682, 1, 0.8627451, 0, 1,
-1.037185, -1.493232, -1.092943, 1, 0.8705882, 0, 1,
-1.036461, 0.02858245, -0.6068723, 1, 0.8745098, 0, 1,
-1.025011, 0.09240972, -1.367726, 1, 0.8823529, 0, 1,
-1.018407, 0.4035794, -1.768809, 1, 0.8862745, 0, 1,
-1.017426, 0.5378494, -1.138351, 1, 0.8941177, 0, 1,
-1.015763, -0.4176513, -3.188036, 1, 0.8980392, 0, 1,
-1.008976, -0.01417511, -2.688763, 1, 0.9058824, 0, 1,
-1.004543, 0.1872604, -0.6255832, 1, 0.9137255, 0, 1,
-0.9991818, 1.149278, -0.4213734, 1, 0.9176471, 0, 1,
-0.9935775, 1.338979, -1.247234, 1, 0.9254902, 0, 1,
-0.9901509, -0.6211335, -2.742911, 1, 0.9294118, 0, 1,
-0.9844255, -1.116072, -2.32189, 1, 0.9372549, 0, 1,
-0.9739277, 0.3278517, -1.071087, 1, 0.9411765, 0, 1,
-0.973319, 0.5631305, 0.3748747, 1, 0.9490196, 0, 1,
-0.9727545, 0.1828135, -2.400112, 1, 0.9529412, 0, 1,
-0.9704491, 1.484551, -0.007082772, 1, 0.9607843, 0, 1,
-0.9687401, 0.1967802, -1.616241, 1, 0.9647059, 0, 1,
-0.9684714, -0.5275245, -0.9148566, 1, 0.972549, 0, 1,
-0.9665682, 1.216748, 0.1797931, 1, 0.9764706, 0, 1,
-0.9638035, -0.1667423, -1.698255, 1, 0.9843137, 0, 1,
-0.955058, -0.3854481, -1.475527, 1, 0.9882353, 0, 1,
-0.9521219, 0.6398964, -0.439532, 1, 0.9960784, 0, 1,
-0.9520958, 0.611587, -2.571835, 0.9960784, 1, 0, 1,
-0.9510548, 0.1817982, -1.219381, 0.9921569, 1, 0, 1,
-0.9486955, -0.4373941, -3.263157, 0.9843137, 1, 0, 1,
-0.9477731, -0.1523561, -1.849908, 0.9803922, 1, 0, 1,
-0.9401253, 0.7064685, 0.1433668, 0.972549, 1, 0, 1,
-0.9349239, -0.6980778, -1.136212, 0.9686275, 1, 0, 1,
-0.9335964, -0.3320802, -0.4197442, 0.9607843, 1, 0, 1,
-0.9326692, -0.4897457, -1.019403, 0.9568627, 1, 0, 1,
-0.9311222, -0.6362074, -1.596973, 0.9490196, 1, 0, 1,
-0.9268192, -0.8747658, -3.391679, 0.945098, 1, 0, 1,
-0.9221859, -1.482596, -2.123232, 0.9372549, 1, 0, 1,
-0.9142684, 0.5264189, 0.6084149, 0.9333333, 1, 0, 1,
-0.9092194, 0.4075484, 0.09529766, 0.9254902, 1, 0, 1,
-0.8993787, -0.3525062, -0.3654672, 0.9215686, 1, 0, 1,
-0.8907478, -2.01634, -2.652114, 0.9137255, 1, 0, 1,
-0.8860897, -1.911406, -1.937146, 0.9098039, 1, 0, 1,
-0.8860643, 1.525198, 0.06204383, 0.9019608, 1, 0, 1,
-0.8835868, -0.636157, -1.587405, 0.8941177, 1, 0, 1,
-0.8810956, -0.9183009, -1.348498, 0.8901961, 1, 0, 1,
-0.8776745, -0.7573277, -2.368224, 0.8823529, 1, 0, 1,
-0.8770565, 0.2609196, -2.584387, 0.8784314, 1, 0, 1,
-0.8733918, 0.8572073, -0.366449, 0.8705882, 1, 0, 1,
-0.8645163, -1.004264, -2.089675, 0.8666667, 1, 0, 1,
-0.8626659, -1.425079, -4.571928, 0.8588235, 1, 0, 1,
-0.8624333, -0.1047299, -2.052907, 0.854902, 1, 0, 1,
-0.8610665, -0.3041792, -1.267971, 0.8470588, 1, 0, 1,
-0.8608625, -0.2320976, -3.750971, 0.8431373, 1, 0, 1,
-0.8607827, 0.3985333, -2.002451, 0.8352941, 1, 0, 1,
-0.8594418, 0.2525452, -3.467178, 0.8313726, 1, 0, 1,
-0.8474206, -0.1141024, 0.6601486, 0.8235294, 1, 0, 1,
-0.8440452, -0.04615257, 0.05158331, 0.8196079, 1, 0, 1,
-0.8430791, 0.1925905, -0.6557518, 0.8117647, 1, 0, 1,
-0.8395851, -0.6471902, -1.706839, 0.8078431, 1, 0, 1,
-0.8380837, -0.4696936, -2.705173, 0.8, 1, 0, 1,
-0.8308555, 2.388913, 0.06973839, 0.7921569, 1, 0, 1,
-0.8307241, 0.2713813, -2.046969, 0.7882353, 1, 0, 1,
-0.8228965, -0.3740831, -1.972767, 0.7803922, 1, 0, 1,
-0.8171431, -0.556726, -2.474373, 0.7764706, 1, 0, 1,
-0.8161914, -1.015297, -2.786618, 0.7686275, 1, 0, 1,
-0.8159296, -0.8891234, -4.534776, 0.7647059, 1, 0, 1,
-0.8132749, -0.09335362, 0.13254, 0.7568628, 1, 0, 1,
-0.8112332, -1.379803, -2.540751, 0.7529412, 1, 0, 1,
-0.8102689, 1.631474, 0.4319474, 0.7450981, 1, 0, 1,
-0.8092791, 0.1694279, -2.882686, 0.7411765, 1, 0, 1,
-0.8057628, 0.01607662, -0.9759958, 0.7333333, 1, 0, 1,
-0.8031687, -1.902115, -2.072399, 0.7294118, 1, 0, 1,
-0.8004619, 1.560984, -1.672203, 0.7215686, 1, 0, 1,
-0.7957307, -0.4188473, -0.3939353, 0.7176471, 1, 0, 1,
-0.7920557, 1.23728, -1.094418, 0.7098039, 1, 0, 1,
-0.7872331, 0.7127714, 0.2003339, 0.7058824, 1, 0, 1,
-0.784712, 1.209822, -1.81801, 0.6980392, 1, 0, 1,
-0.7839428, -1.381096, -4.502243, 0.6901961, 1, 0, 1,
-0.7828396, 1.012707, -1.474353, 0.6862745, 1, 0, 1,
-0.7824714, -0.3596346, -2.68904, 0.6784314, 1, 0, 1,
-0.7811931, 0.2656276, -1.61156, 0.6745098, 1, 0, 1,
-0.7808136, -0.976101, -2.189015, 0.6666667, 1, 0, 1,
-0.7799358, -2.579947, -2.720227, 0.6627451, 1, 0, 1,
-0.7776741, -0.9982727, -1.663031, 0.654902, 1, 0, 1,
-0.7698897, 0.231438, -1.6355, 0.6509804, 1, 0, 1,
-0.7671571, -0.6541268, -1.727029, 0.6431373, 1, 0, 1,
-0.7617477, 1.210189, -1.652966, 0.6392157, 1, 0, 1,
-0.759656, 0.7415288, -0.546541, 0.6313726, 1, 0, 1,
-0.7596112, 1.043831, -1.046335, 0.627451, 1, 0, 1,
-0.7521019, 0.6621065, -1.973898, 0.6196079, 1, 0, 1,
-0.7493931, -0.03478019, -4.338472, 0.6156863, 1, 0, 1,
-0.7481874, -2.601503, -1.557481, 0.6078432, 1, 0, 1,
-0.7481489, 0.7407304, -2.762557, 0.6039216, 1, 0, 1,
-0.7456601, -0.5066175, -2.749493, 0.5960785, 1, 0, 1,
-0.7446505, 0.09600489, -1.250819, 0.5882353, 1, 0, 1,
-0.741583, -1.375032, -2.620661, 0.5843138, 1, 0, 1,
-0.7405654, -1.481637, -3.082908, 0.5764706, 1, 0, 1,
-0.7397274, -1.494698, -2.173163, 0.572549, 1, 0, 1,
-0.7387909, -1.181138, -1.651938, 0.5647059, 1, 0, 1,
-0.7371579, -0.07511372, -2.004782, 0.5607843, 1, 0, 1,
-0.733292, -0.743726, -3.826783, 0.5529412, 1, 0, 1,
-0.733266, 1.194883, -2.329838, 0.5490196, 1, 0, 1,
-0.7331611, 0.9330713, -0.2468904, 0.5411765, 1, 0, 1,
-0.7294026, 1.130057, -2.223599, 0.5372549, 1, 0, 1,
-0.7269678, -1.737198, -0.7845706, 0.5294118, 1, 0, 1,
-0.7248257, -0.7584203, -1.974986, 0.5254902, 1, 0, 1,
-0.7221986, 0.5976889, -2.34668, 0.5176471, 1, 0, 1,
-0.7165689, -0.6036116, -3.075552, 0.5137255, 1, 0, 1,
-0.7012752, 0.2683704, -2.680459, 0.5058824, 1, 0, 1,
-0.6955508, -1.216502, -3.373334, 0.5019608, 1, 0, 1,
-0.6943042, 0.1278451, -1.003545, 0.4941176, 1, 0, 1,
-0.6930992, 0.9460583, -1.019096, 0.4862745, 1, 0, 1,
-0.6911762, 0.5865321, 0.09585115, 0.4823529, 1, 0, 1,
-0.6909497, -0.4767073, -2.733607, 0.4745098, 1, 0, 1,
-0.6880548, 1.012372, -0.8741921, 0.4705882, 1, 0, 1,
-0.6864564, -1.261188, -2.259889, 0.4627451, 1, 0, 1,
-0.6821851, -0.09967213, -3.582289, 0.4588235, 1, 0, 1,
-0.6797414, -0.8348714, -1.970529, 0.4509804, 1, 0, 1,
-0.678817, 0.1734308, -2.321528, 0.4470588, 1, 0, 1,
-0.6761287, 0.1217437, -2.485444, 0.4392157, 1, 0, 1,
-0.6712598, 0.2049387, -0.1390492, 0.4352941, 1, 0, 1,
-0.67035, -0.2963218, -1.836995, 0.427451, 1, 0, 1,
-0.6693235, -1.430259, -0.7623879, 0.4235294, 1, 0, 1,
-0.6693176, -1.3457, -0.6902655, 0.4156863, 1, 0, 1,
-0.6587166, 1.56374, -1.468642, 0.4117647, 1, 0, 1,
-0.6542555, 1.019115, 0.7058912, 0.4039216, 1, 0, 1,
-0.6538914, 0.049653, -0.25075, 0.3960784, 1, 0, 1,
-0.6525329, -1.887082, -2.913702, 0.3921569, 1, 0, 1,
-0.652405, 0.09220534, -2.142182, 0.3843137, 1, 0, 1,
-0.649052, 0.2150274, -0.3606152, 0.3803922, 1, 0, 1,
-0.6439261, -0.8293189, -4.2258, 0.372549, 1, 0, 1,
-0.6423457, 2.212633, -0.9900599, 0.3686275, 1, 0, 1,
-0.6401787, 0.7042271, -0.5336264, 0.3607843, 1, 0, 1,
-0.6348162, -0.3240365, -0.1035858, 0.3568628, 1, 0, 1,
-0.6325936, -0.76864, -3.144054, 0.3490196, 1, 0, 1,
-0.6229648, -1.274527, -3.185476, 0.345098, 1, 0, 1,
-0.6226912, 1.249175, -0.9329839, 0.3372549, 1, 0, 1,
-0.6223347, -1.542495, -1.364396, 0.3333333, 1, 0, 1,
-0.6218625, -0.1178744, -3.829627, 0.3254902, 1, 0, 1,
-0.6189552, 0.2993523, 0.1181867, 0.3215686, 1, 0, 1,
-0.6123044, 0.7992538, 0.6628758, 0.3137255, 1, 0, 1,
-0.6120741, -1.366426, -1.70166, 0.3098039, 1, 0, 1,
-0.6116433, -0.9560136, -2.517529, 0.3019608, 1, 0, 1,
-0.5875024, 0.2739546, -0.5124751, 0.2941177, 1, 0, 1,
-0.586289, 0.3138885, -0.898963, 0.2901961, 1, 0, 1,
-0.5859124, -0.6472611, -2.113125, 0.282353, 1, 0, 1,
-0.5850472, 0.8643362, 0.2328665, 0.2784314, 1, 0, 1,
-0.5818377, 2.493744, 0.9336886, 0.2705882, 1, 0, 1,
-0.5728356, 0.7796793, -1.114378, 0.2666667, 1, 0, 1,
-0.5720424, -1.454602, -2.383089, 0.2588235, 1, 0, 1,
-0.5681829, -0.4652887, -2.215124, 0.254902, 1, 0, 1,
-0.5676262, 0.5612957, 0.8555058, 0.2470588, 1, 0, 1,
-0.5670115, -1.03353, -2.455172, 0.2431373, 1, 0, 1,
-0.5647216, -0.9092955, -2.549208, 0.2352941, 1, 0, 1,
-0.5646744, 0.616738, -0.3903093, 0.2313726, 1, 0, 1,
-0.5640693, 0.36771, -1.059656, 0.2235294, 1, 0, 1,
-0.5583051, -1.912223, -3.17301, 0.2196078, 1, 0, 1,
-0.5562817, 0.7595567, -1.37423, 0.2117647, 1, 0, 1,
-0.5535176, 1.109077, -0.7462688, 0.2078431, 1, 0, 1,
-0.5525512, 0.4487178, -0.2323691, 0.2, 1, 0, 1,
-0.5525278, -0.5305126, -1.291786, 0.1921569, 1, 0, 1,
-0.5503824, -1.982666, -3.82857, 0.1882353, 1, 0, 1,
-0.5464767, -0.5773778, -1.771981, 0.1803922, 1, 0, 1,
-0.5364588, -0.4658478, -0.9006609, 0.1764706, 1, 0, 1,
-0.532825, 0.1388007, -1.655561, 0.1686275, 1, 0, 1,
-0.5292209, -1.042624, -3.51913, 0.1647059, 1, 0, 1,
-0.52795, 0.6397243, 0.1435789, 0.1568628, 1, 0, 1,
-0.5269769, 0.1492776, -1.085218, 0.1529412, 1, 0, 1,
-0.5213869, -1.049306, -1.497427, 0.145098, 1, 0, 1,
-0.5170144, -0.2164815, -3.006496, 0.1411765, 1, 0, 1,
-0.516403, -0.5547634, -1.582445, 0.1333333, 1, 0, 1,
-0.5141598, 0.54931, -1.344558, 0.1294118, 1, 0, 1,
-0.5122057, -0.3043737, -3.010476, 0.1215686, 1, 0, 1,
-0.5104797, 0.9146509, 1.709294, 0.1176471, 1, 0, 1,
-0.5094875, 0.6396543, -2.329195, 0.1098039, 1, 0, 1,
-0.5082994, -1.546572, -3.335757, 0.1058824, 1, 0, 1,
-0.499056, 0.0134117, -0.3451437, 0.09803922, 1, 0, 1,
-0.4942564, -0.369186, -2.022135, 0.09019608, 1, 0, 1,
-0.4899128, -0.3923648, -2.980454, 0.08627451, 1, 0, 1,
-0.4875537, -0.2042763, -1.652173, 0.07843138, 1, 0, 1,
-0.4868297, -1.000351, -3.022538, 0.07450981, 1, 0, 1,
-0.4812952, -0.2039059, -0.915881, 0.06666667, 1, 0, 1,
-0.481254, -1.52755, -2.13962, 0.0627451, 1, 0, 1,
-0.4771459, -0.4884057, -3.013232, 0.05490196, 1, 0, 1,
-0.474083, 1.272095, -0.1962324, 0.05098039, 1, 0, 1,
-0.4726105, 0.1104509, 0.7538089, 0.04313726, 1, 0, 1,
-0.4722716, -2.175573, -2.56767, 0.03921569, 1, 0, 1,
-0.468962, -0.2670015, -3.052278, 0.03137255, 1, 0, 1,
-0.4667948, 1.120619, -0.955012, 0.02745098, 1, 0, 1,
-0.4657375, 0.9598374, -1.707007, 0.01960784, 1, 0, 1,
-0.4647118, 0.3141218, -0.4953334, 0.01568628, 1, 0, 1,
-0.4586682, -0.1158522, -3.562107, 0.007843138, 1, 0, 1,
-0.4541218, 0.7414498, 2.07935, 0.003921569, 1, 0, 1,
-0.4536879, 0.4265628, 2.536946, 0, 1, 0.003921569, 1,
-0.4518554, 0.3133614, -0.3445057, 0, 1, 0.01176471, 1,
-0.4479909, 0.2929635, -3.371872, 0, 1, 0.01568628, 1,
-0.4444553, 0.4870829, -0.7490388, 0, 1, 0.02352941, 1,
-0.4443007, 0.3534874, -2.026108, 0, 1, 0.02745098, 1,
-0.4436005, -1.216625, -1.357852, 0, 1, 0.03529412, 1,
-0.4410537, -1.246563, -2.304924, 0, 1, 0.03921569, 1,
-0.4389356, -1.512765, -2.89563, 0, 1, 0.04705882, 1,
-0.4341444, -1.204613, -3.780911, 0, 1, 0.05098039, 1,
-0.4300603, -2.586554, -3.081341, 0, 1, 0.05882353, 1,
-0.4280301, -0.297861, -1.268013, 0, 1, 0.0627451, 1,
-0.4181301, -1.278464, -3.909215, 0, 1, 0.07058824, 1,
-0.4115651, 0.3998847, -2.1471, 0, 1, 0.07450981, 1,
-0.4102691, 0.1391203, 0.1646193, 0, 1, 0.08235294, 1,
-0.405867, -0.6426688, -2.392029, 0, 1, 0.08627451, 1,
-0.4045171, 0.9345972, -0.1332199, 0, 1, 0.09411765, 1,
-0.4031382, -0.2920825, -2.961727, 0, 1, 0.1019608, 1,
-0.4016796, -0.8873156, -3.529988, 0, 1, 0.1058824, 1,
-0.4008701, -1.968745, -3.300192, 0, 1, 0.1137255, 1,
-0.3996775, -0.1822941, -1.816731, 0, 1, 0.1176471, 1,
-0.3980331, -0.06079959, -0.6076102, 0, 1, 0.1254902, 1,
-0.3958905, 0.8550432, -0.02682373, 0, 1, 0.1294118, 1,
-0.3955654, 0.03319442, -2.705976, 0, 1, 0.1372549, 1,
-0.393602, -0.2391552, -2.097274, 0, 1, 0.1411765, 1,
-0.3914967, 1.343957, 1.313303, 0, 1, 0.1490196, 1,
-0.3914815, -0.01269995, -1.513615, 0, 1, 0.1529412, 1,
-0.3887548, 0.8308163, 0.6654595, 0, 1, 0.1607843, 1,
-0.3877164, -0.01130311, -3.516079, 0, 1, 0.1647059, 1,
-0.3813506, -0.2695664, -2.529083, 0, 1, 0.172549, 1,
-0.3810915, -1.907657, -3.458936, 0, 1, 0.1764706, 1,
-0.3772038, -1.267271, -3.598161, 0, 1, 0.1843137, 1,
-0.3744303, 1.242184, 1.452806, 0, 1, 0.1882353, 1,
-0.3706054, 1.006791, 0.648665, 0, 1, 0.1960784, 1,
-0.3693515, -0.3585992, -3.821922, 0, 1, 0.2039216, 1,
-0.3643075, -0.2564535, -3.109356, 0, 1, 0.2078431, 1,
-0.3599393, -0.158144, -0.6920223, 0, 1, 0.2156863, 1,
-0.3517606, -0.3177082, -2.060001, 0, 1, 0.2196078, 1,
-0.3500413, -0.1578005, -2.553282, 0, 1, 0.227451, 1,
-0.3476449, 1.019282, -1.037367, 0, 1, 0.2313726, 1,
-0.3446733, 1.117723, -0.7194037, 0, 1, 0.2392157, 1,
-0.3416753, -0.5265504, -2.160192, 0, 1, 0.2431373, 1,
-0.3400575, -1.799297, -3.237887, 0, 1, 0.2509804, 1,
-0.3383549, -0.1103686, -2.973382, 0, 1, 0.254902, 1,
-0.335543, -0.07924039, -2.658697, 0, 1, 0.2627451, 1,
-0.3351582, 0.5292231, 0.7342123, 0, 1, 0.2666667, 1,
-0.3317762, 1.141466, 0.2434232, 0, 1, 0.2745098, 1,
-0.3300835, -0.8308, -2.692761, 0, 1, 0.2784314, 1,
-0.3299386, -0.5079991, -0.9746679, 0, 1, 0.2862745, 1,
-0.3242992, 1.54272, -0.6891262, 0, 1, 0.2901961, 1,
-0.3217877, 0.4277472, -1.10198, 0, 1, 0.2980392, 1,
-0.3138311, -1.119737, -2.941944, 0, 1, 0.3058824, 1,
-0.3134602, -0.1559382, -0.9817232, 0, 1, 0.3098039, 1,
-0.3122753, -0.5100361, -1.231996, 0, 1, 0.3176471, 1,
-0.3076572, -1.43015, -2.014654, 0, 1, 0.3215686, 1,
-0.3072234, -1.614902, -5.023938, 0, 1, 0.3294118, 1,
-0.3063329, -0.5248397, -1.306534, 0, 1, 0.3333333, 1,
-0.3054227, -1.00076, -2.485319, 0, 1, 0.3411765, 1,
-0.3042393, -0.2367751, -1.601254, 0, 1, 0.345098, 1,
-0.3025746, -0.05187875, -3.244961, 0, 1, 0.3529412, 1,
-0.3008236, -0.7535427, -2.041293, 0, 1, 0.3568628, 1,
-0.3004938, 0.9598404, 0.4743893, 0, 1, 0.3647059, 1,
-0.2939061, 0.6662985, -1.308479, 0, 1, 0.3686275, 1,
-0.2938215, -1.795402, -3.208969, 0, 1, 0.3764706, 1,
-0.2861595, -0.1418045, -2.69585, 0, 1, 0.3803922, 1,
-0.277572, -0.2018754, -2.365108, 0, 1, 0.3882353, 1,
-0.2762758, 0.3160001, -0.8005106, 0, 1, 0.3921569, 1,
-0.2734786, -0.5805175, -3.197015, 0, 1, 0.4, 1,
-0.2728819, -0.7353027, -3.605848, 0, 1, 0.4078431, 1,
-0.2713341, 0.9390551, 1.043388, 0, 1, 0.4117647, 1,
-0.2707897, -1.774848, -4.23297, 0, 1, 0.4196078, 1,
-0.2671473, -0.7178656, -2.775549, 0, 1, 0.4235294, 1,
-0.260378, 0.6603495, 1.005025, 0, 1, 0.4313726, 1,
-0.2569567, -1.264373, -4.076842, 0, 1, 0.4352941, 1,
-0.2549109, -0.2968944, -3.911526, 0, 1, 0.4431373, 1,
-0.2539405, -0.3142107, -3.044316, 0, 1, 0.4470588, 1,
-0.2397585, 0.7165407, 1.150989, 0, 1, 0.454902, 1,
-0.2357219, 0.8327001, -0.191333, 0, 1, 0.4588235, 1,
-0.2353041, -1.275043, -4.32741, 0, 1, 0.4666667, 1,
-0.2327104, -1.710923, -2.622614, 0, 1, 0.4705882, 1,
-0.2286886, 0.4567588, 0.778551, 0, 1, 0.4784314, 1,
-0.228224, -1.349824, -2.95117, 0, 1, 0.4823529, 1,
-0.2250964, 0.5951561, 0.8420297, 0, 1, 0.4901961, 1,
-0.2247231, 0.2081444, -0.7875427, 0, 1, 0.4941176, 1,
-0.2192327, 1.056819, -0.08707827, 0, 1, 0.5019608, 1,
-0.2191905, -1.00876, -3.528264, 0, 1, 0.509804, 1,
-0.2190602, -2.387785, -3.135051, 0, 1, 0.5137255, 1,
-0.2177445, -0.5796961, -2.02137, 0, 1, 0.5215687, 1,
-0.2082448, -0.2870977, -2.6238, 0, 1, 0.5254902, 1,
-0.2077563, -0.1965014, -4.777322, 0, 1, 0.5333334, 1,
-0.206573, 1.894839, 0.6717623, 0, 1, 0.5372549, 1,
-0.2052396, -0.2130043, -3.209404, 0, 1, 0.5450981, 1,
-0.2017063, 0.999108, -0.9908409, 0, 1, 0.5490196, 1,
-0.2010494, -1.019702, -1.225727, 0, 1, 0.5568628, 1,
-0.2007453, -0.4421111, -2.191591, 0, 1, 0.5607843, 1,
-0.1999137, -0.7098747, -4.120481, 0, 1, 0.5686275, 1,
-0.1973956, -0.9260375, -2.622935, 0, 1, 0.572549, 1,
-0.1965985, -0.6192211, -1.739748, 0, 1, 0.5803922, 1,
-0.1958228, 0.1167995, -1.653753, 0, 1, 0.5843138, 1,
-0.1936242, 2.611153, 0.003057334, 0, 1, 0.5921569, 1,
-0.1933716, -0.3806943, -3.513581, 0, 1, 0.5960785, 1,
-0.1904551, 0.1724773, -0.8146998, 0, 1, 0.6039216, 1,
-0.1898802, 1.428468, -0.2755333, 0, 1, 0.6117647, 1,
-0.1859431, 0.860608, 0.02275483, 0, 1, 0.6156863, 1,
-0.1786352, 0.3005419, -1.428136, 0, 1, 0.6235294, 1,
-0.1721755, 0.8142652, 1.089251, 0, 1, 0.627451, 1,
-0.1713335, 0.5843189, -2.814843, 0, 1, 0.6352941, 1,
-0.1650662, -0.1655586, -2.744048, 0, 1, 0.6392157, 1,
-0.1642491, 0.9149086, -0.257362, 0, 1, 0.6470588, 1,
-0.1641897, 0.2035384, -0.2032629, 0, 1, 0.6509804, 1,
-0.1637769, -0.2986323, -1.14172, 0, 1, 0.6588235, 1,
-0.162358, -0.4889289, -2.685362, 0, 1, 0.6627451, 1,
-0.1623364, -0.7095977, -4.281877, 0, 1, 0.6705883, 1,
-0.1589428, -0.04360259, -0.3159097, 0, 1, 0.6745098, 1,
-0.1557747, 0.5529509, -0.07672405, 0, 1, 0.682353, 1,
-0.1535867, -0.008675328, -0.4871409, 0, 1, 0.6862745, 1,
-0.1498406, 1.491435, -0.5778946, 0, 1, 0.6941177, 1,
-0.1459888, 1.040357, -0.2087272, 0, 1, 0.7019608, 1,
-0.1444434, 1.105652, 0.8227814, 0, 1, 0.7058824, 1,
-0.1436292, -0.1730687, -3.246659, 0, 1, 0.7137255, 1,
-0.1416885, 0.9935088, 0.3130496, 0, 1, 0.7176471, 1,
-0.1414661, -1.217086, -3.730215, 0, 1, 0.7254902, 1,
-0.1414462, -1.109698, -3.17325, 0, 1, 0.7294118, 1,
-0.1391441, 0.2271783, -0.342122, 0, 1, 0.7372549, 1,
-0.1383569, 0.4611129, -2.010232, 0, 1, 0.7411765, 1,
-0.1322963, 0.6939813, 0.6154279, 0, 1, 0.7490196, 1,
-0.1234191, -0.02650898, -1.367856, 0, 1, 0.7529412, 1,
-0.1219934, 0.7567235, 0.8717071, 0, 1, 0.7607843, 1,
-0.1123962, -0.2454452, -2.915699, 0, 1, 0.7647059, 1,
-0.1095503, 1.157906, 0.6517845, 0, 1, 0.772549, 1,
-0.1080476, -1.919719, -2.485134, 0, 1, 0.7764706, 1,
-0.1054767, 0.7076882, -0.9964527, 0, 1, 0.7843137, 1,
-0.1041978, 0.3151913, -1.456535, 0, 1, 0.7882353, 1,
-0.1014644, 0.5288378, -1.397568, 0, 1, 0.7960784, 1,
-0.09721936, -0.284948, -3.24217, 0, 1, 0.8039216, 1,
-0.09691539, -0.1249833, -2.784624, 0, 1, 0.8078431, 1,
-0.09226391, -1.24189, -3.434114, 0, 1, 0.8156863, 1,
-0.0887851, -0.9243031, -2.162898, 0, 1, 0.8196079, 1,
-0.08673161, -2.405982, -0.8974726, 0, 1, 0.827451, 1,
-0.08007562, -0.3360017, -4.650232, 0, 1, 0.8313726, 1,
-0.07986809, 1.076449, -0.06696215, 0, 1, 0.8392157, 1,
-0.07970104, 1.144605, -0.2574918, 0, 1, 0.8431373, 1,
-0.07912039, 0.2932149, -0.6817616, 0, 1, 0.8509804, 1,
-0.07573934, -0.810322, -2.311706, 0, 1, 0.854902, 1,
-0.07407434, -0.1599598, -3.040162, 0, 1, 0.8627451, 1,
-0.07309161, 1.276577, -0.2974165, 0, 1, 0.8666667, 1,
-0.06893544, -0.4013525, -3.853983, 0, 1, 0.8745098, 1,
-0.06841925, 0.9419148, 0.02133195, 0, 1, 0.8784314, 1,
-0.06791479, 0.3321636, -1.679374, 0, 1, 0.8862745, 1,
-0.06457687, 0.4378816, 0.06656707, 0, 1, 0.8901961, 1,
-0.0537819, 1.567269, -0.009919167, 0, 1, 0.8980392, 1,
-0.04991605, -0.2384014, -2.966666, 0, 1, 0.9058824, 1,
-0.04153828, -0.3236145, -2.99942, 0, 1, 0.9098039, 1,
-0.04136688, 1.325365, -1.647788, 0, 1, 0.9176471, 1,
-0.04113541, 0.6496613, 1.016019, 0, 1, 0.9215686, 1,
-0.03965131, 0.657822, 0.4522763, 0, 1, 0.9294118, 1,
-0.03817663, 1.099403, 0.785305, 0, 1, 0.9333333, 1,
-0.03811067, -0.1154338, -4.013814, 0, 1, 0.9411765, 1,
-0.03716157, 2.08517, 0.5604588, 0, 1, 0.945098, 1,
-0.03424964, -0.6671464, -1.565357, 0, 1, 0.9529412, 1,
-0.02991241, 1.056458, 1.341255, 0, 1, 0.9568627, 1,
-0.02752219, 0.2846788, -2.737541, 0, 1, 0.9647059, 1,
-0.02714175, -0.07154924, -1.645282, 0, 1, 0.9686275, 1,
-0.01982515, 1.37731, -1.024348, 0, 1, 0.9764706, 1,
-0.01298831, 0.4661166, -0.007968117, 0, 1, 0.9803922, 1,
-0.00899333, -0.5311044, -3.538212, 0, 1, 0.9882353, 1,
-0.006878975, 0.1612341, -1.870365, 0, 1, 0.9921569, 1,
0.0002957494, -1.050861, 2.984887, 0, 1, 1, 1,
0.001608473, -0.00644494, 3.54282, 0, 0.9921569, 1, 1,
0.002790574, -1.883304, 2.638438, 0, 0.9882353, 1, 1,
0.005590087, -0.8787081, 3.675351, 0, 0.9803922, 1, 1,
0.005961375, -0.2571678, 1.338738, 0, 0.9764706, 1, 1,
0.0108192, -1.898378, 1.973779, 0, 0.9686275, 1, 1,
0.01615658, -0.1149102, 3.250735, 0, 0.9647059, 1, 1,
0.01637827, 0.5335466, 0.7159731, 0, 0.9568627, 1, 1,
0.01751943, 0.8091658, -0.3287954, 0, 0.9529412, 1, 1,
0.01802693, 1.09925, -0.3149026, 0, 0.945098, 1, 1,
0.02125725, -2.418781, 2.612366, 0, 0.9411765, 1, 1,
0.02305995, -0.1982528, 3.279073, 0, 0.9333333, 1, 1,
0.02891376, 1.409131, -0.9062691, 0, 0.9294118, 1, 1,
0.02929146, -2.145256, 2.793815, 0, 0.9215686, 1, 1,
0.03043213, -0.2835175, 1.91379, 0, 0.9176471, 1, 1,
0.03106965, 0.1685442, 0.06928731, 0, 0.9098039, 1, 1,
0.03128377, -0.2592534, 0.8490741, 0, 0.9058824, 1, 1,
0.03426401, -1.340843, 3.185379, 0, 0.8980392, 1, 1,
0.03430479, 0.004893333, 1.428816, 0, 0.8901961, 1, 1,
0.03478609, -0.03548927, 4.170846, 0, 0.8862745, 1, 1,
0.04218571, 1.117708, -2.204222, 0, 0.8784314, 1, 1,
0.04226834, -0.9659036, 2.673886, 0, 0.8745098, 1, 1,
0.04374613, 0.7228398, -1.688986, 0, 0.8666667, 1, 1,
0.04669281, -0.3458228, 2.949293, 0, 0.8627451, 1, 1,
0.04732048, -0.3435478, 2.154331, 0, 0.854902, 1, 1,
0.04918894, -0.466637, 4.054778, 0, 0.8509804, 1, 1,
0.05036872, 0.3188413, -0.1109571, 0, 0.8431373, 1, 1,
0.05275736, 0.5603933, -0.7370889, 0, 0.8392157, 1, 1,
0.06326695, 0.1175694, 1.686449, 0, 0.8313726, 1, 1,
0.06484365, 1.483396, -0.9682367, 0, 0.827451, 1, 1,
0.06588948, 1.324921, 0.6173279, 0, 0.8196079, 1, 1,
0.06959765, -0.01816447, 3.31254, 0, 0.8156863, 1, 1,
0.07071523, 2.898572, 0.9374472, 0, 0.8078431, 1, 1,
0.08294731, 2.206608, 0.6774098, 0, 0.8039216, 1, 1,
0.08551262, 0.669015, 1.716182, 0, 0.7960784, 1, 1,
0.08815151, -0.4205299, 2.666416, 0, 0.7882353, 1, 1,
0.08903605, -1.279533, 3.966722, 0, 0.7843137, 1, 1,
0.09276173, -0.6156654, 3.021741, 0, 0.7764706, 1, 1,
0.09672482, 1.014218, 0.764516, 0, 0.772549, 1, 1,
0.09761588, 1.468209, 0.2609404, 0, 0.7647059, 1, 1,
0.09833974, -0.6145626, 1.189, 0, 0.7607843, 1, 1,
0.1112215, -0.2891834, 3.436978, 0, 0.7529412, 1, 1,
0.1134865, -1.332438, 1.924299, 0, 0.7490196, 1, 1,
0.1143173, 0.5390322, 2.060793, 0, 0.7411765, 1, 1,
0.1155432, -1.11789, 3.510865, 0, 0.7372549, 1, 1,
0.1171507, 1.876506, -0.3741927, 0, 0.7294118, 1, 1,
0.1175223, 2.617339, -1.128245, 0, 0.7254902, 1, 1,
0.1209819, 0.3246118, -2.369167, 0, 0.7176471, 1, 1,
0.1228206, 0.3965462, -0.3991797, 0, 0.7137255, 1, 1,
0.1354747, 0.5218669, 0.7700086, 0, 0.7058824, 1, 1,
0.1382107, -0.9057252, 2.704828, 0, 0.6980392, 1, 1,
0.1413778, -0.1724993, 2.728076, 0, 0.6941177, 1, 1,
0.1420484, -1.537771, 4.235345, 0, 0.6862745, 1, 1,
0.1471427, 0.754588, 1.818728, 0, 0.682353, 1, 1,
0.1485134, -0.5177515, 2.029633, 0, 0.6745098, 1, 1,
0.1495658, 2.314623, -0.9531392, 0, 0.6705883, 1, 1,
0.1513924, -1.975142, 2.707236, 0, 0.6627451, 1, 1,
0.1539897, -0.001100335, 1.649117, 0, 0.6588235, 1, 1,
0.1562977, -0.8004868, 4.377613, 0, 0.6509804, 1, 1,
0.1608259, 1.67935, -0.0588702, 0, 0.6470588, 1, 1,
0.1632087, 0.03849471, -0.260054, 0, 0.6392157, 1, 1,
0.1656206, -0.3676144, 2.941466, 0, 0.6352941, 1, 1,
0.1658265, 0.7171038, 0.3141485, 0, 0.627451, 1, 1,
0.1666664, 0.5181014, 0.807014, 0, 0.6235294, 1, 1,
0.1670739, -1.060934, 3.50591, 0, 0.6156863, 1, 1,
0.16782, -1.690026, 2.081845, 0, 0.6117647, 1, 1,
0.1720732, 1.706128, 0.7534789, 0, 0.6039216, 1, 1,
0.1742878, 0.8303348, 0.7675096, 0, 0.5960785, 1, 1,
0.176115, -0.9711033, 3.317559, 0, 0.5921569, 1, 1,
0.1797303, 0.4871038, -0.05274229, 0, 0.5843138, 1, 1,
0.1854595, -1.809003, 3.369538, 0, 0.5803922, 1, 1,
0.1919531, 0.04391928, 2.496941, 0, 0.572549, 1, 1,
0.1921483, 1.399954, -0.9161015, 0, 0.5686275, 1, 1,
0.1932443, 0.5502909, 1.786074, 0, 0.5607843, 1, 1,
0.1940678, 0.8613083, -1.239466, 0, 0.5568628, 1, 1,
0.2087314, -1.202285, 3.750521, 0, 0.5490196, 1, 1,
0.212096, 1.244564, -0.2538744, 0, 0.5450981, 1, 1,
0.2151953, 0.56709, 0.6812802, 0, 0.5372549, 1, 1,
0.2166557, -1.089104, 2.575832, 0, 0.5333334, 1, 1,
0.2205373, 0.3638315, 2.163038, 0, 0.5254902, 1, 1,
0.2208616, -0.1317449, 1.765393, 0, 0.5215687, 1, 1,
0.2227031, -2.137415, 2.151535, 0, 0.5137255, 1, 1,
0.2360845, -1.784577, 3.796964, 0, 0.509804, 1, 1,
0.2431603, 0.8313232, 0.4925818, 0, 0.5019608, 1, 1,
0.2485347, 0.9856147, -0.6903463, 0, 0.4941176, 1, 1,
0.2511491, 0.8724309, -0.09294967, 0, 0.4901961, 1, 1,
0.2515596, 0.6812582, -0.4978597, 0, 0.4823529, 1, 1,
0.2530593, 1.079963, 2.521997, 0, 0.4784314, 1, 1,
0.2541081, -0.3661764, 1.338621, 0, 0.4705882, 1, 1,
0.2571968, -0.7037117, 1.895595, 0, 0.4666667, 1, 1,
0.2589968, -0.2549106, 1.369711, 0, 0.4588235, 1, 1,
0.2605155, -1.25645, 2.0254, 0, 0.454902, 1, 1,
0.2653905, -0.4413018, 2.493809, 0, 0.4470588, 1, 1,
0.2712816, -1.254443, 2.221842, 0, 0.4431373, 1, 1,
0.2757232, -1.368299, 3.338736, 0, 0.4352941, 1, 1,
0.2798645, -0.2899415, 1.589605, 0, 0.4313726, 1, 1,
0.2822431, -0.2861341, 0.8496401, 0, 0.4235294, 1, 1,
0.283907, -0.4899581, 2.806385, 0, 0.4196078, 1, 1,
0.2846884, -1.279455, 0.9699341, 0, 0.4117647, 1, 1,
0.2856155, -1.882743, 2.401291, 0, 0.4078431, 1, 1,
0.2862782, 1.854685, 0.6101413, 0, 0.4, 1, 1,
0.2901876, 2.042831, -0.6891889, 0, 0.3921569, 1, 1,
0.290958, -1.45503, 3.828867, 0, 0.3882353, 1, 1,
0.2965517, -0.2868979, 2.71433, 0, 0.3803922, 1, 1,
0.3008809, -0.3936348, 4.987147, 0, 0.3764706, 1, 1,
0.3046904, 0.5347086, 1.412135, 0, 0.3686275, 1, 1,
0.305222, 0.1443737, 2.366144, 0, 0.3647059, 1, 1,
0.3098348, 2.080775, 0.2443945, 0, 0.3568628, 1, 1,
0.3107173, -0.5195507, 1.995346, 0, 0.3529412, 1, 1,
0.3119032, 0.3415124, 0.6437606, 0, 0.345098, 1, 1,
0.313129, 0.1669271, 0.5035647, 0, 0.3411765, 1, 1,
0.3134119, -0.2398486, 3.945344, 0, 0.3333333, 1, 1,
0.3143869, 0.9588591, 0.5854874, 0, 0.3294118, 1, 1,
0.3149457, -1.006804, 2.740282, 0, 0.3215686, 1, 1,
0.3172265, -0.1496084, 1.65212, 0, 0.3176471, 1, 1,
0.3211788, -1.111998, 4.254845, 0, 0.3098039, 1, 1,
0.3277768, -1.303928, 3.526074, 0, 0.3058824, 1, 1,
0.3287237, 1.093495, 0.6912742, 0, 0.2980392, 1, 1,
0.3307119, 0.6323729, 0.7384797, 0, 0.2901961, 1, 1,
0.3321477, 0.9654163, -0.105576, 0, 0.2862745, 1, 1,
0.3347146, 0.9791285, 1.372753, 0, 0.2784314, 1, 1,
0.3377562, 0.05645157, 4.105623, 0, 0.2745098, 1, 1,
0.3412336, -0.6741073, 4.095629, 0, 0.2666667, 1, 1,
0.3417372, -0.4927087, 2.663196, 0, 0.2627451, 1, 1,
0.3429363, 0.7181725, 0.9925526, 0, 0.254902, 1, 1,
0.3436334, -0.08478335, 0.7331319, 0, 0.2509804, 1, 1,
0.3501286, -0.18455, 3.501116, 0, 0.2431373, 1, 1,
0.3503698, 1.333933, 0.3480086, 0, 0.2392157, 1, 1,
0.3554798, -1.466431, 1.456567, 0, 0.2313726, 1, 1,
0.3555874, -1.11776, 3.880538, 0, 0.227451, 1, 1,
0.3570635, 1.150494, 0.3107176, 0, 0.2196078, 1, 1,
0.3570668, 2.28912, -0.9124601, 0, 0.2156863, 1, 1,
0.3591038, 0.7199993, 0.9006765, 0, 0.2078431, 1, 1,
0.362445, -0.424448, 1.99327, 0, 0.2039216, 1, 1,
0.3696933, -1.422744, 2.304787, 0, 0.1960784, 1, 1,
0.3701411, 1.948766, 0.4251404, 0, 0.1882353, 1, 1,
0.3705573, 0.9392302, 0.5595366, 0, 0.1843137, 1, 1,
0.3721156, -1.23313, 3.259119, 0, 0.1764706, 1, 1,
0.3723791, 0.322079, 0.1225244, 0, 0.172549, 1, 1,
0.3732255, 0.3142659, -0.4806338, 0, 0.1647059, 1, 1,
0.3750898, -1.042074, 2.943234, 0, 0.1607843, 1, 1,
0.3786213, 0.8763969, 0.07737474, 0, 0.1529412, 1, 1,
0.3787223, -0.6406385, 2.5828, 0, 0.1490196, 1, 1,
0.3826096, 1.31724, -0.1507087, 0, 0.1411765, 1, 1,
0.3877129, 0.08877965, 0.9941943, 0, 0.1372549, 1, 1,
0.3913617, -1.050363, 3.318018, 0, 0.1294118, 1, 1,
0.3984726, -0.1448918, 2.446351, 0, 0.1254902, 1, 1,
0.3991548, 0.3312586, 1.726174, 0, 0.1176471, 1, 1,
0.4008619, -1.981139, 1.703784, 0, 0.1137255, 1, 1,
0.4046807, -1.01593, 4.088862, 0, 0.1058824, 1, 1,
0.4067846, 0.8618404, -0.5918666, 0, 0.09803922, 1, 1,
0.4081368, 0.4053522, -0.04064972, 0, 0.09411765, 1, 1,
0.4166879, 0.4016499, 2.297601, 0, 0.08627451, 1, 1,
0.4174293, 0.4256544, -0.2230555, 0, 0.08235294, 1, 1,
0.417712, -0.5568088, 1.567649, 0, 0.07450981, 1, 1,
0.4203317, -0.8415585, 4.794605, 0, 0.07058824, 1, 1,
0.4206682, -0.2209262, 0.2413901, 0, 0.0627451, 1, 1,
0.4275944, -0.4384965, 2.624101, 0, 0.05882353, 1, 1,
0.4305757, -1.706041, 2.064178, 0, 0.05098039, 1, 1,
0.4316738, -0.7583984, 3.679439, 0, 0.04705882, 1, 1,
0.4353241, -2.492564, 3.787523, 0, 0.03921569, 1, 1,
0.4382789, -0.1902202, 1.296048, 0, 0.03529412, 1, 1,
0.4391937, -0.3193659, 1.457763, 0, 0.02745098, 1, 1,
0.44364, 0.1798847, 0.8968493, 0, 0.02352941, 1, 1,
0.4436485, 0.4784991, 1.779519, 0, 0.01568628, 1, 1,
0.4441549, -1.354112, 3.111836, 0, 0.01176471, 1, 1,
0.4487585, 0.06463476, 1.212204, 0, 0.003921569, 1, 1,
0.4491467, -0.1226776, 2.441272, 0.003921569, 0, 1, 1,
0.4495366, -0.7218563, 2.635116, 0.007843138, 0, 1, 1,
0.4539343, 1.640556, 1.561538, 0.01568628, 0, 1, 1,
0.4576784, -0.7425854, 3.006679, 0.01960784, 0, 1, 1,
0.4598378, -1.874904, 2.036528, 0.02745098, 0, 1, 1,
0.4604012, -0.7483388, 2.709473, 0.03137255, 0, 1, 1,
0.4637826, 0.8082836, -0.1141961, 0.03921569, 0, 1, 1,
0.4645096, 1.566217, 1.216138, 0.04313726, 0, 1, 1,
0.4663128, -0.1435868, -0.08512504, 0.05098039, 0, 1, 1,
0.4669112, 0.07796833, 0.8123729, 0.05490196, 0, 1, 1,
0.4694686, -2.164613, 0.9599202, 0.0627451, 0, 1, 1,
0.4722284, -0.1287622, 1.538478, 0.06666667, 0, 1, 1,
0.4735054, 0.2353242, 1.493453, 0.07450981, 0, 1, 1,
0.4760416, -0.3070646, 3.029615, 0.07843138, 0, 1, 1,
0.4787377, -0.7816187, 1.061467, 0.08627451, 0, 1, 1,
0.4819821, 0.4015883, 1.776041, 0.09019608, 0, 1, 1,
0.4841475, -0.9221873, 0.7681095, 0.09803922, 0, 1, 1,
0.4841749, 1.260634, 0.3887662, 0.1058824, 0, 1, 1,
0.4844703, -1.068093, 5.329105, 0.1098039, 0, 1, 1,
0.4846143, -0.9824845, 3.270357, 0.1176471, 0, 1, 1,
0.4850174, -1.277144, 2.664678, 0.1215686, 0, 1, 1,
0.4918739, 0.3553191, 1.900981, 0.1294118, 0, 1, 1,
0.4923217, -0.5740907, 3.084363, 0.1333333, 0, 1, 1,
0.494091, -0.6754149, 1.797979, 0.1411765, 0, 1, 1,
0.4945105, 0.6894389, 1.305449, 0.145098, 0, 1, 1,
0.5022699, 1.53349, -1.469003, 0.1529412, 0, 1, 1,
0.5058293, -0.2476155, 1.839707, 0.1568628, 0, 1, 1,
0.5061032, 2.022415, 1.533103, 0.1647059, 0, 1, 1,
0.508688, 0.9361365, 1.283807, 0.1686275, 0, 1, 1,
0.5118061, 0.9634926, -0.6356437, 0.1764706, 0, 1, 1,
0.5137449, 0.1927077, 2.153191, 0.1803922, 0, 1, 1,
0.5168953, -1.380897, -0.3486364, 0.1882353, 0, 1, 1,
0.5186039, 1.606622, 0.3944881, 0.1921569, 0, 1, 1,
0.5245017, -0.1300093, 2.95596, 0.2, 0, 1, 1,
0.5285174, -1.547981, 2.880033, 0.2078431, 0, 1, 1,
0.5307975, 0.1477493, 1.242402, 0.2117647, 0, 1, 1,
0.5310268, -1.299237, 3.923297, 0.2196078, 0, 1, 1,
0.5325727, 1.445358, 1.745524, 0.2235294, 0, 1, 1,
0.5392355, 1.580853, 2.424788, 0.2313726, 0, 1, 1,
0.5430287, 1.051038, -1.190648, 0.2352941, 0, 1, 1,
0.5447283, -1.610121, 2.030646, 0.2431373, 0, 1, 1,
0.5470803, -1.766855, 1.215476, 0.2470588, 0, 1, 1,
0.5522002, -0.1343179, 1.117574, 0.254902, 0, 1, 1,
0.5527624, 0.4406914, 2.429852, 0.2588235, 0, 1, 1,
0.5606082, -0.08492496, 0.1729889, 0.2666667, 0, 1, 1,
0.5616263, 0.5791641, 1.281214, 0.2705882, 0, 1, 1,
0.5656403, 1.244938, 0.4164643, 0.2784314, 0, 1, 1,
0.5677072, -0.360824, 2.759458, 0.282353, 0, 1, 1,
0.5677929, -0.8305146, 2.10381, 0.2901961, 0, 1, 1,
0.5715958, 1.126456, 0.352285, 0.2941177, 0, 1, 1,
0.5717387, -1.675413, 2.628909, 0.3019608, 0, 1, 1,
0.5726977, 0.418571, 0.7108126, 0.3098039, 0, 1, 1,
0.5762544, 0.6951513, -0.1415115, 0.3137255, 0, 1, 1,
0.5796214, 1.105929, 2.090444, 0.3215686, 0, 1, 1,
0.5799723, 1.458884, -1.547247, 0.3254902, 0, 1, 1,
0.5850707, 0.6138139, 0.6021541, 0.3333333, 0, 1, 1,
0.5864798, -1.748258, 4.410108, 0.3372549, 0, 1, 1,
0.5895438, 1.762471, 1.993559, 0.345098, 0, 1, 1,
0.5901813, 1.156866, 1.711092, 0.3490196, 0, 1, 1,
0.5926521, 0.8540902, -0.362331, 0.3568628, 0, 1, 1,
0.5940813, 0.205983, -0.2127487, 0.3607843, 0, 1, 1,
0.5954366, 0.8490918, 0.3422344, 0.3686275, 0, 1, 1,
0.6009166, -0.9065262, 3.23658, 0.372549, 0, 1, 1,
0.6025604, -0.7846958, 2.749702, 0.3803922, 0, 1, 1,
0.6061938, -0.9453564, 3.221692, 0.3843137, 0, 1, 1,
0.6063544, -1.247385, 0.3356718, 0.3921569, 0, 1, 1,
0.6069305, 0.6644706, 0.6625933, 0.3960784, 0, 1, 1,
0.6100242, -0.7712616, 1.313466, 0.4039216, 0, 1, 1,
0.6104785, -1.845763, 2.656524, 0.4117647, 0, 1, 1,
0.6111041, -0.2993441, 1.538584, 0.4156863, 0, 1, 1,
0.6145535, -1.205078, 3.200594, 0.4235294, 0, 1, 1,
0.6259215, -1.442631, 2.730886, 0.427451, 0, 1, 1,
0.6284004, -0.275331, 2.009074, 0.4352941, 0, 1, 1,
0.6374071, -0.6642517, 2.274713, 0.4392157, 0, 1, 1,
0.6445696, -0.8213701, 1.433142, 0.4470588, 0, 1, 1,
0.6458988, -0.4287969, 2.527665, 0.4509804, 0, 1, 1,
0.6472337, -1.33243, 2.722364, 0.4588235, 0, 1, 1,
0.6495727, -1.693032, 4.689898, 0.4627451, 0, 1, 1,
0.6553432, -1.32891, 2.242546, 0.4705882, 0, 1, 1,
0.6584941, -0.6162578, 0.4364943, 0.4745098, 0, 1, 1,
0.6633396, 1.15769, 0.2567844, 0.4823529, 0, 1, 1,
0.6650138, -1.312353, 3.781118, 0.4862745, 0, 1, 1,
0.6663533, 0.5013303, 0.1191802, 0.4941176, 0, 1, 1,
0.6678146, -1.010195, 2.492813, 0.5019608, 0, 1, 1,
0.6687267, 1.496109, 0.5227963, 0.5058824, 0, 1, 1,
0.6817989, 1.484081, -0.4630578, 0.5137255, 0, 1, 1,
0.6823424, 0.1070572, -0.8437276, 0.5176471, 0, 1, 1,
0.6853312, -0.1821622, 0.7679169, 0.5254902, 0, 1, 1,
0.6882342, -0.4281055, 2.009345, 0.5294118, 0, 1, 1,
0.6895909, -1.663473, 2.304344, 0.5372549, 0, 1, 1,
0.6897898, 0.9127781, 1.089204, 0.5411765, 0, 1, 1,
0.6989498, 0.9567552, 1.596388, 0.5490196, 0, 1, 1,
0.7008379, 0.9000747, 2.452831, 0.5529412, 0, 1, 1,
0.70232, -0.7542408, 5.941217, 0.5607843, 0, 1, 1,
0.7116541, 0.2767068, -0.4098414, 0.5647059, 0, 1, 1,
0.7166734, -0.8242658, 4.274627, 0.572549, 0, 1, 1,
0.7220094, 1.111142, -0.02828803, 0.5764706, 0, 1, 1,
0.7297106, -0.06219224, 2.638783, 0.5843138, 0, 1, 1,
0.730736, -0.5891008, 3.57657, 0.5882353, 0, 1, 1,
0.7356079, -0.7301091, 3.621532, 0.5960785, 0, 1, 1,
0.737412, -0.01551138, 1.503464, 0.6039216, 0, 1, 1,
0.7403617, -1.759947, 1.713493, 0.6078432, 0, 1, 1,
0.7408278, 0.6373889, 1.738446, 0.6156863, 0, 1, 1,
0.751958, 0.1387586, -0.2733088, 0.6196079, 0, 1, 1,
0.7575977, -1.353848, 3.12625, 0.627451, 0, 1, 1,
0.7628346, 1.026862, 1.231361, 0.6313726, 0, 1, 1,
0.765232, 1.328797, 1.0832, 0.6392157, 0, 1, 1,
0.7698932, 0.2383335, 1.306211, 0.6431373, 0, 1, 1,
0.7790762, 1.073415, 0.612547, 0.6509804, 0, 1, 1,
0.7898356, -0.7675739, 2.361001, 0.654902, 0, 1, 1,
0.7911986, 0.9892615, -0.7075248, 0.6627451, 0, 1, 1,
0.7916992, -0.9746372, 2.527949, 0.6666667, 0, 1, 1,
0.7939168, -0.5930843, 3.074682, 0.6745098, 0, 1, 1,
0.794925, 1.718784, 0.1060194, 0.6784314, 0, 1, 1,
0.7963909, 0.1164431, -0.09141163, 0.6862745, 0, 1, 1,
0.799859, 0.9727678, 1.38703, 0.6901961, 0, 1, 1,
0.8008667, -0.03258118, 1.973994, 0.6980392, 0, 1, 1,
0.802129, 0.5373355, 1.276566, 0.7058824, 0, 1, 1,
0.8031679, 0.9739349, 0.560912, 0.7098039, 0, 1, 1,
0.8032288, -0.7077432, 3.449047, 0.7176471, 0, 1, 1,
0.8041602, 1.591044, 1.975284, 0.7215686, 0, 1, 1,
0.8082827, 1.949154, 0.5251855, 0.7294118, 0, 1, 1,
0.8128662, 0.007214583, 2.083678, 0.7333333, 0, 1, 1,
0.8199265, -0.1741625, 2.505213, 0.7411765, 0, 1, 1,
0.8241678, 0.1315486, 0.6818742, 0.7450981, 0, 1, 1,
0.8259846, 0.384921, 2.422657, 0.7529412, 0, 1, 1,
0.8288966, -0.8489038, 3.329913, 0.7568628, 0, 1, 1,
0.8307517, -0.4215714, 0.8452516, 0.7647059, 0, 1, 1,
0.8320637, 0.3672873, 0.2271876, 0.7686275, 0, 1, 1,
0.8341435, 0.5480999, 1.041917, 0.7764706, 0, 1, 1,
0.8361176, -0.5385243, 2.802825, 0.7803922, 0, 1, 1,
0.8405413, 0.6104549, 0.5892122, 0.7882353, 0, 1, 1,
0.8443228, 0.7494621, -0.3304066, 0.7921569, 0, 1, 1,
0.844563, -1.141308, 1.496725, 0.8, 0, 1, 1,
0.84472, 1.56532, 2.503311, 0.8078431, 0, 1, 1,
0.8471754, 0.3494842, 0.3722941, 0.8117647, 0, 1, 1,
0.8475137, -0.57719, 1.983898, 0.8196079, 0, 1, 1,
0.8526433, -0.07665192, 1.408161, 0.8235294, 0, 1, 1,
0.8572246, -0.08850402, 0.1557862, 0.8313726, 0, 1, 1,
0.8656666, -1.728674, 2.82177, 0.8352941, 0, 1, 1,
0.8731636, 0.9482923, 0.01199508, 0.8431373, 0, 1, 1,
0.8748161, 2.01847, 0.7659183, 0.8470588, 0, 1, 1,
0.8750572, -1.992764, 2.693145, 0.854902, 0, 1, 1,
0.8771132, -0.6429392, -0.6289953, 0.8588235, 0, 1, 1,
0.8839, -1.827127, 1.551293, 0.8666667, 0, 1, 1,
0.89042, 1.519081, 2.907264, 0.8705882, 0, 1, 1,
0.8928238, 2.163125, 0.7980447, 0.8784314, 0, 1, 1,
0.8971562, -0.2224344, 0.7053123, 0.8823529, 0, 1, 1,
0.9126052, 0.5368621, 3.404474, 0.8901961, 0, 1, 1,
0.9168535, 1.153167, 1.574798, 0.8941177, 0, 1, 1,
0.9248287, 0.945211, 0.8752908, 0.9019608, 0, 1, 1,
0.9255812, 0.5892265, 0.4785644, 0.9098039, 0, 1, 1,
0.9370713, 1.344037, 0.5982655, 0.9137255, 0, 1, 1,
0.9391066, -0.8990439, 2.926602, 0.9215686, 0, 1, 1,
0.9403994, -0.3191022, 1.588526, 0.9254902, 0, 1, 1,
0.9416076, 0.5831305, 3.104056, 0.9333333, 0, 1, 1,
0.9502761, -1.040132, 2.248964, 0.9372549, 0, 1, 1,
0.9518772, 1.611218, 0.193025, 0.945098, 0, 1, 1,
0.9542575, 0.7640244, 1.743678, 0.9490196, 0, 1, 1,
0.9551817, 0.669444, 0.2495124, 0.9568627, 0, 1, 1,
0.9562896, 0.1832984, 0.4761928, 0.9607843, 0, 1, 1,
0.9593151, 1.145622, -1.550326, 0.9686275, 0, 1, 1,
0.9621485, -1.608512, 4.439034, 0.972549, 0, 1, 1,
0.9669141, -0.5269464, 1.901454, 0.9803922, 0, 1, 1,
0.971249, 0.4382543, 1.880413, 0.9843137, 0, 1, 1,
0.9733211, 1.539455, 0.4320492, 0.9921569, 0, 1, 1,
0.9757842, 1.563162, 0.1071596, 0.9960784, 0, 1, 1,
0.9771829, 0.4324622, 0.1488542, 1, 0, 0.9960784, 1,
0.9779032, -1.332357, 0.3834022, 1, 0, 0.9882353, 1,
0.9889196, -1.028041, 2.17454, 1, 0, 0.9843137, 1,
0.9896136, -1.522702, 5.077037, 1, 0, 0.9764706, 1,
0.9942966, 0.1362191, 2.422233, 1, 0, 0.972549, 1,
0.9955996, 0.6273735, 1.19822, 1, 0, 0.9647059, 1,
1.001359, 1.023033, -0.7696525, 1, 0, 0.9607843, 1,
1.004809, -0.09518758, 3.718514, 1, 0, 0.9529412, 1,
1.011883, 0.4250947, 1.401342, 1, 0, 0.9490196, 1,
1.017311, 0.2359446, 2.048521, 1, 0, 0.9411765, 1,
1.018287, 0.2766319, 0.282214, 1, 0, 0.9372549, 1,
1.023297, -0.8247745, 0.6588015, 1, 0, 0.9294118, 1,
1.023864, 0.223152, 3.847096, 1, 0, 0.9254902, 1,
1.029983, 0.9964325, -0.5032629, 1, 0, 0.9176471, 1,
1.032866, 1.08123, 1.403522, 1, 0, 0.9137255, 1,
1.036535, 0.4744152, 1.797683, 1, 0, 0.9058824, 1,
1.039358, -1.413562, 2.120632, 1, 0, 0.9019608, 1,
1.041037, -1.404255, 2.508104, 1, 0, 0.8941177, 1,
1.048813, -0.4978952, 3.386302, 1, 0, 0.8862745, 1,
1.050817, -1.564582, 3.038697, 1, 0, 0.8823529, 1,
1.051525, -0.3970683, 0.2269651, 1, 0, 0.8745098, 1,
1.056614, 0.5674843, 0.4768656, 1, 0, 0.8705882, 1,
1.057509, 0.6017072, -0.06594423, 1, 0, 0.8627451, 1,
1.06933, -0.5198578, 0.5234627, 1, 0, 0.8588235, 1,
1.071778, -0.3950508, 2.120835, 1, 0, 0.8509804, 1,
1.08118, 0.5393358, 2.411777, 1, 0, 0.8470588, 1,
1.093269, -0.6096573, 2.494245, 1, 0, 0.8392157, 1,
1.098401, 0.4912956, 1.526568, 1, 0, 0.8352941, 1,
1.098444, 0.2676771, 1.578158, 1, 0, 0.827451, 1,
1.110136, -0.9160085, 1.245178, 1, 0, 0.8235294, 1,
1.110439, 0.1828779, 1.739826, 1, 0, 0.8156863, 1,
1.111727, -0.4776607, 2.557835, 1, 0, 0.8117647, 1,
1.117138, -0.00877832, -0.08309693, 1, 0, 0.8039216, 1,
1.123037, 1.317202, 1.421277, 1, 0, 0.7960784, 1,
1.123967, -0.7116005, 1.118562, 1, 0, 0.7921569, 1,
1.124211, -0.6625522, 0.839202, 1, 0, 0.7843137, 1,
1.129732, 1.4241, 1.391676, 1, 0, 0.7803922, 1,
1.130871, -0.6253186, 2.768223, 1, 0, 0.772549, 1,
1.134043, -1.445234, 3.009316, 1, 0, 0.7686275, 1,
1.134058, 0.7686075, 0.6944582, 1, 0, 0.7607843, 1,
1.139921, -0.1302545, 1.730397, 1, 0, 0.7568628, 1,
1.141869, -0.40773, 1.348719, 1, 0, 0.7490196, 1,
1.14647, -0.2970725, 2.105541, 1, 0, 0.7450981, 1,
1.147383, -0.3488871, 1.983974, 1, 0, 0.7372549, 1,
1.150556, -1.274638, 3.34339, 1, 0, 0.7333333, 1,
1.151604, -0.2970806, 0.9444436, 1, 0, 0.7254902, 1,
1.153172, -0.7984145, 2.459996, 1, 0, 0.7215686, 1,
1.155461, 1.001539, 0.9438685, 1, 0, 0.7137255, 1,
1.159929, 1.668794, 1.170405, 1, 0, 0.7098039, 1,
1.161698, 0.5450088, 0.1427476, 1, 0, 0.7019608, 1,
1.162772, -0.5107824, 2.220084, 1, 0, 0.6941177, 1,
1.165083, 1.05325, 1.609379, 1, 0, 0.6901961, 1,
1.171418, 0.01730861, 0.6584058, 1, 0, 0.682353, 1,
1.177344, -0.647665, 4.38848, 1, 0, 0.6784314, 1,
1.178522, -0.9691668, 3.115835, 1, 0, 0.6705883, 1,
1.180797, -0.7952456, 3.780104, 1, 0, 0.6666667, 1,
1.186219, -0.1061616, 1.071919, 1, 0, 0.6588235, 1,
1.192279, -1.284667, 2.108997, 1, 0, 0.654902, 1,
1.192407, -0.008269475, 1.741259, 1, 0, 0.6470588, 1,
1.193744, -0.4642179, 2.892228, 1, 0, 0.6431373, 1,
1.201212, -0.8955961, 1.11959, 1, 0, 0.6352941, 1,
1.212209, -0.5080814, 2.05134, 1, 0, 0.6313726, 1,
1.216857, 0.6100934, 2.914708, 1, 0, 0.6235294, 1,
1.218154, -0.2009097, 2.580164, 1, 0, 0.6196079, 1,
1.222818, -1.695159, 2.735644, 1, 0, 0.6117647, 1,
1.223874, -0.122933, 0.7602841, 1, 0, 0.6078432, 1,
1.228867, -1.791469, 3.142914, 1, 0, 0.6, 1,
1.232312, 0.335357, 1.780133, 1, 0, 0.5921569, 1,
1.235097, -0.5361735, 0.3624387, 1, 0, 0.5882353, 1,
1.239189, -0.5161901, 2.000485, 1, 0, 0.5803922, 1,
1.250921, 0.08533549, 1.543011, 1, 0, 0.5764706, 1,
1.266207, 2.244508, 0.3153169, 1, 0, 0.5686275, 1,
1.27924, -0.2076232, 2.070176, 1, 0, 0.5647059, 1,
1.282494, -0.04202733, 2.855031, 1, 0, 0.5568628, 1,
1.300133, -0.2664928, 1.803554, 1, 0, 0.5529412, 1,
1.302233, 0.2765582, 1.673014, 1, 0, 0.5450981, 1,
1.303052, 0.3733786, 3.568501, 1, 0, 0.5411765, 1,
1.304599, -0.4203207, 3.249983, 1, 0, 0.5333334, 1,
1.307064, -0.1554646, 2.703105, 1, 0, 0.5294118, 1,
1.30921, 0.5803012, 1.332113, 1, 0, 0.5215687, 1,
1.316112, 1.388674, 2.051754, 1, 0, 0.5176471, 1,
1.32033, -1.877548, 2.571917, 1, 0, 0.509804, 1,
1.323451, -1.006452, 2.325213, 1, 0, 0.5058824, 1,
1.329495, 1.443668, 1.054631, 1, 0, 0.4980392, 1,
1.333143, 1.323069, 0.1410343, 1, 0, 0.4901961, 1,
1.33918, 0.632274, 1.205586, 1, 0, 0.4862745, 1,
1.342698, -0.819225, 2.759941, 1, 0, 0.4784314, 1,
1.347274, 1.16717, 1.427, 1, 0, 0.4745098, 1,
1.349516, -0.6652626, 2.123594, 1, 0, 0.4666667, 1,
1.351547, -0.4395025, 0.358679, 1, 0, 0.4627451, 1,
1.377959, -1.658011, 2.781254, 1, 0, 0.454902, 1,
1.37799, -0.1347921, -0.1889018, 1, 0, 0.4509804, 1,
1.38013, -0.2097099, 2.286544, 1, 0, 0.4431373, 1,
1.382876, -0.9169438, 3.565468, 1, 0, 0.4392157, 1,
1.392396, -0.960767, 3.842977, 1, 0, 0.4313726, 1,
1.426281, 1.046441, 1.184265, 1, 0, 0.427451, 1,
1.436454, -0.7126653, 3.777373, 1, 0, 0.4196078, 1,
1.465498, -0.2318916, 2.769129, 1, 0, 0.4156863, 1,
1.475623, 0.4847955, 1.87751, 1, 0, 0.4078431, 1,
1.491049, 1.626096, -0.234906, 1, 0, 0.4039216, 1,
1.493553, -0.2533963, 0.7007599, 1, 0, 0.3960784, 1,
1.499055, -0.4275768, 1.595754, 1, 0, 0.3882353, 1,
1.506831, -0.2595488, 2.418894, 1, 0, 0.3843137, 1,
1.530338, -0.3527462, 2.064314, 1, 0, 0.3764706, 1,
1.531032, -1.293311, 2.221747, 1, 0, 0.372549, 1,
1.536837, 0.1656231, 2.613556, 1, 0, 0.3647059, 1,
1.546351, -0.7034895, 1.277164, 1, 0, 0.3607843, 1,
1.555888, 0.2131859, 1.244743, 1, 0, 0.3529412, 1,
1.557757, -0.8642335, 1.629502, 1, 0, 0.3490196, 1,
1.564928, -1.398661, 1.719598, 1, 0, 0.3411765, 1,
1.566102, 0.6064032, -0.572535, 1, 0, 0.3372549, 1,
1.56668, 0.6403899, 0.5760201, 1, 0, 0.3294118, 1,
1.574074, -0.7700152, 3.133515, 1, 0, 0.3254902, 1,
1.578693, -0.4009602, 2.728193, 1, 0, 0.3176471, 1,
1.581889, 1.840411, 0.4085641, 1, 0, 0.3137255, 1,
1.585629, -0.6952497, -0.2223624, 1, 0, 0.3058824, 1,
1.600104, -0.5689828, 2.49731, 1, 0, 0.2980392, 1,
1.600219, 1.380013, 0.6133616, 1, 0, 0.2941177, 1,
1.60508, -0.6643731, 1.196813, 1, 0, 0.2862745, 1,
1.611166, -0.6096618, 0.5386342, 1, 0, 0.282353, 1,
1.625487, 0.7457364, 1.058583, 1, 0, 0.2745098, 1,
1.631109, 1.503788, 0.9820629, 1, 0, 0.2705882, 1,
1.634451, 2.147304, 2.317791, 1, 0, 0.2627451, 1,
1.647911, 0.6699984, 0.2473364, 1, 0, 0.2588235, 1,
1.649195, 1.47231, 0.6261297, 1, 0, 0.2509804, 1,
1.650651, -0.6014107, 2.431564, 1, 0, 0.2470588, 1,
1.652395, -1.602195, 1.761264, 1, 0, 0.2392157, 1,
1.678064, 2.072693, 0.4645413, 1, 0, 0.2352941, 1,
1.69371, 0.3100421, 0.8348484, 1, 0, 0.227451, 1,
1.710762, 1.096977, 1.572809, 1, 0, 0.2235294, 1,
1.736932, 0.04562929, 1.896447, 1, 0, 0.2156863, 1,
1.741661, -0.6084604, 3.246092, 1, 0, 0.2117647, 1,
1.748153, 0.1350753, 0.8589424, 1, 0, 0.2039216, 1,
1.769529, -0.1447386, 0.181498, 1, 0, 0.1960784, 1,
1.77282, 0.04674976, 2.688792, 1, 0, 0.1921569, 1,
1.779633, -0.5375822, 1.389274, 1, 0, 0.1843137, 1,
1.786326, -1.47914, 1.537271, 1, 0, 0.1803922, 1,
1.84957, -0.6739266, 1.946738, 1, 0, 0.172549, 1,
1.858011, 0.3458096, 1.791054, 1, 0, 0.1686275, 1,
1.871583, 0.03552569, 1.779329, 1, 0, 0.1607843, 1,
1.873538, 0.3392334, 2.268005, 1, 0, 0.1568628, 1,
1.896757, -0.8894125, 1.733177, 1, 0, 0.1490196, 1,
1.901398, 0.85399, 0.7570186, 1, 0, 0.145098, 1,
1.904139, 1.133858, 0.7183182, 1, 0, 0.1372549, 1,
1.905424, -0.5697809, 1.560688, 1, 0, 0.1333333, 1,
1.912439, 2.68419, -0.7955302, 1, 0, 0.1254902, 1,
2.01021, 0.3943087, 1.335229, 1, 0, 0.1215686, 1,
2.024866, -0.8585691, 0.7541619, 1, 0, 0.1137255, 1,
2.027373, 1.611123, 0.07906719, 1, 0, 0.1098039, 1,
2.074323, 0.01119107, 1.74959, 1, 0, 0.1019608, 1,
2.113926, 0.5740379, 3.097043, 1, 0, 0.09411765, 1,
2.116429, 0.03020121, 1.580446, 1, 0, 0.09019608, 1,
2.129925, 0.4931722, 1.632469, 1, 0, 0.08235294, 1,
2.131202, 0.6020424, 0.04004436, 1, 0, 0.07843138, 1,
2.170841, -0.7410004, 0.2033534, 1, 0, 0.07058824, 1,
2.195049, -0.3273791, 2.005915, 1, 0, 0.06666667, 1,
2.226782, 0.724326, 1.403759, 1, 0, 0.05882353, 1,
2.257452, 0.3003851, 1.33101, 1, 0, 0.05490196, 1,
2.321221, 1.075659, 1.707752, 1, 0, 0.04705882, 1,
2.335, -0.1834588, 3.127929, 1, 0, 0.04313726, 1,
2.335257, -1.172675, 1.217488, 1, 0, 0.03529412, 1,
2.421197, 0.7430848, 4.042301, 1, 0, 0.03137255, 1,
2.488039, -0.1399518, 0.5622657, 1, 0, 0.02352941, 1,
2.599136, -0.7661629, 1.455674, 1, 0, 0.01960784, 1,
2.656329, 0.1135614, 2.182769, 1, 0, 0.01176471, 1,
3.196342, 0.523607, 1.559488, 1, 0, 0.007843138, 1
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
0.286253, -3.667016, -6.882532, 0, -0.5, 0.5, 0.5,
0.286253, -3.667016, -6.882532, 1, -0.5, 0.5, 0.5,
0.286253, -3.667016, -6.882532, 1, 1.5, 0.5, 0.5,
0.286253, -3.667016, -6.882532, 0, 1.5, 0.5, 0.5
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
-3.610357, 0.09156537, -6.882532, 0, -0.5, 0.5, 0.5,
-3.610357, 0.09156537, -6.882532, 1, -0.5, 0.5, 0.5,
-3.610357, 0.09156537, -6.882532, 1, 1.5, 0.5, 0.5,
-3.610357, 0.09156537, -6.882532, 0, 1.5, 0.5, 0.5
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
-3.610357, -3.667016, 0.4586396, 0, -0.5, 0.5, 0.5,
-3.610357, -3.667016, 0.4586396, 1, -0.5, 0.5, 0.5,
-3.610357, -3.667016, 0.4586396, 1, 1.5, 0.5, 0.5,
-3.610357, -3.667016, 0.4586396, 0, 1.5, 0.5, 0.5
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
-2, -2.799651, -5.188416,
3, -2.799651, -5.188416,
-2, -2.799651, -5.188416,
-2, -2.944212, -5.470768,
-1, -2.799651, -5.188416,
-1, -2.944212, -5.470768,
0, -2.799651, -5.188416,
0, -2.944212, -5.470768,
1, -2.799651, -5.188416,
1, -2.944212, -5.470768,
2, -2.799651, -5.188416,
2, -2.944212, -5.470768,
3, -2.799651, -5.188416,
3, -2.944212, -5.470768
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
-2, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
-2, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
-2, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
-2, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5,
-1, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
-1, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
-1, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
-1, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5,
0, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
0, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
0, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
0, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5,
1, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
1, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
1, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
1, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5,
2, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
2, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
2, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
2, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5,
3, -3.233334, -6.035474, 0, -0.5, 0.5, 0.5,
3, -3.233334, -6.035474, 1, -0.5, 0.5, 0.5,
3, -3.233334, -6.035474, 1, 1.5, 0.5, 0.5,
3, -3.233334, -6.035474, 0, 1.5, 0.5, 0.5
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
-2.711139, -2, -5.188416,
-2.711139, 2, -5.188416,
-2.711139, -2, -5.188416,
-2.861009, -2, -5.470768,
-2.711139, -1, -5.188416,
-2.861009, -1, -5.470768,
-2.711139, 0, -5.188416,
-2.861009, 0, -5.470768,
-2.711139, 1, -5.188416,
-2.861009, 1, -5.470768,
-2.711139, 2, -5.188416,
-2.861009, 2, -5.470768
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
-3.160748, -2, -6.035474, 0, -0.5, 0.5, 0.5,
-3.160748, -2, -6.035474, 1, -0.5, 0.5, 0.5,
-3.160748, -2, -6.035474, 1, 1.5, 0.5, 0.5,
-3.160748, -2, -6.035474, 0, 1.5, 0.5, 0.5,
-3.160748, -1, -6.035474, 0, -0.5, 0.5, 0.5,
-3.160748, -1, -6.035474, 1, -0.5, 0.5, 0.5,
-3.160748, -1, -6.035474, 1, 1.5, 0.5, 0.5,
-3.160748, -1, -6.035474, 0, 1.5, 0.5, 0.5,
-3.160748, 0, -6.035474, 0, -0.5, 0.5, 0.5,
-3.160748, 0, -6.035474, 1, -0.5, 0.5, 0.5,
-3.160748, 0, -6.035474, 1, 1.5, 0.5, 0.5,
-3.160748, 0, -6.035474, 0, 1.5, 0.5, 0.5,
-3.160748, 1, -6.035474, 0, -0.5, 0.5, 0.5,
-3.160748, 1, -6.035474, 1, -0.5, 0.5, 0.5,
-3.160748, 1, -6.035474, 1, 1.5, 0.5, 0.5,
-3.160748, 1, -6.035474, 0, 1.5, 0.5, 0.5,
-3.160748, 2, -6.035474, 0, -0.5, 0.5, 0.5,
-3.160748, 2, -6.035474, 1, -0.5, 0.5, 0.5,
-3.160748, 2, -6.035474, 1, 1.5, 0.5, 0.5,
-3.160748, 2, -6.035474, 0, 1.5, 0.5, 0.5
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
-2.711139, -2.799651, -4,
-2.711139, -2.799651, 4,
-2.711139, -2.799651, -4,
-2.861009, -2.944212, -4,
-2.711139, -2.799651, -2,
-2.861009, -2.944212, -2,
-2.711139, -2.799651, 0,
-2.861009, -2.944212, 0,
-2.711139, -2.799651, 2,
-2.861009, -2.944212, 2,
-2.711139, -2.799651, 4,
-2.861009, -2.944212, 4
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
-3.160748, -3.233334, -4, 0, -0.5, 0.5, 0.5,
-3.160748, -3.233334, -4, 1, -0.5, 0.5, 0.5,
-3.160748, -3.233334, -4, 1, 1.5, 0.5, 0.5,
-3.160748, -3.233334, -4, 0, 1.5, 0.5, 0.5,
-3.160748, -3.233334, -2, 0, -0.5, 0.5, 0.5,
-3.160748, -3.233334, -2, 1, -0.5, 0.5, 0.5,
-3.160748, -3.233334, -2, 1, 1.5, 0.5, 0.5,
-3.160748, -3.233334, -2, 0, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 0, 0, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 0, 1, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 0, 1, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 0, 0, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 2, 0, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 2, 1, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 2, 1, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 2, 0, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 4, 0, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 4, 1, -0.5, 0.5, 0.5,
-3.160748, -3.233334, 4, 1, 1.5, 0.5, 0.5,
-3.160748, -3.233334, 4, 0, 1.5, 0.5, 0.5
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
-2.711139, -2.799651, -5.188416,
-2.711139, 2.982782, -5.188416,
-2.711139, -2.799651, 6.105695,
-2.711139, 2.982782, 6.105695,
-2.711139, -2.799651, -5.188416,
-2.711139, -2.799651, 6.105695,
-2.711139, 2.982782, -5.188416,
-2.711139, 2.982782, 6.105695,
-2.711139, -2.799651, -5.188416,
3.283645, -2.799651, -5.188416,
-2.711139, -2.799651, 6.105695,
3.283645, -2.799651, 6.105695,
-2.711139, 2.982782, -5.188416,
3.283645, 2.982782, -5.188416,
-2.711139, 2.982782, 6.105695,
3.283645, 2.982782, 6.105695,
3.283645, -2.799651, -5.188416,
3.283645, 2.982782, -5.188416,
3.283645, -2.799651, 6.105695,
3.283645, 2.982782, 6.105695,
3.283645, -2.799651, -5.188416,
3.283645, -2.799651, 6.105695,
3.283645, 2.982782, -5.188416,
3.283645, 2.982782, 6.105695
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
var radius = 7.49346;
var distance = 33.33925;
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
mvMatrix.translate( -0.286253, -0.09156537, -0.4586396 );
mvMatrix.scale( 1.351521, 1.401153, 0.7173718 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.33925);
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
sesone<-read.table("sesone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sesone$V2
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
```

```r
y<-sesone$V3
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
```

```r
z<-sesone$V4
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
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
-2.623837, 0.2077218, -1.231694, 0, 0, 1, 1, 1,
-2.60529, -0.2231849, -0.3924948, 1, 0, 0, 1, 1,
-2.544636, -0.6686621, -2.905628, 1, 0, 0, 1, 1,
-2.536915, 0.4402253, -0.8901287, 1, 0, 0, 1, 1,
-2.432518, -0.04555782, -0.6119957, 1, 0, 0, 1, 1,
-2.412668, 0.1086207, -3.062616, 1, 0, 0, 1, 1,
-2.400684, 0.7632968, -0.8926223, 0, 0, 0, 1, 1,
-2.332611, -1.622693, -3.682149, 0, 0, 0, 1, 1,
-2.314737, -0.6328468, -2.302148, 0, 0, 0, 1, 1,
-2.274539, 0.2346878, -1.405367, 0, 0, 0, 1, 1,
-2.238833, -0.1248686, -0.3145804, 0, 0, 0, 1, 1,
-2.230119, 0.1199127, -1.079458, 0, 0, 0, 1, 1,
-2.174835, 0.497449, -2.738613, 0, 0, 0, 1, 1,
-2.174674, 0.351579, -0.8431187, 1, 1, 1, 1, 1,
-2.155065, -1.084718, -0.6803849, 1, 1, 1, 1, 1,
-2.15456, -0.4862294, -1.138517, 1, 1, 1, 1, 1,
-2.139472, 0.6609957, -0.8640583, 1, 1, 1, 1, 1,
-2.110105, 0.4668532, -0.9627244, 1, 1, 1, 1, 1,
-2.095662, -1.042017, -2.217075, 1, 1, 1, 1, 1,
-2.058584, -0.2714852, -0.1650939, 1, 1, 1, 1, 1,
-2.038431, 1.096274, -0.9948873, 1, 1, 1, 1, 1,
-2.034457, 0.02307184, -0.5895045, 1, 1, 1, 1, 1,
-2.032712, -0.01842638, -2.630708, 1, 1, 1, 1, 1,
-2.016537, -1.338734, -0.1049058, 1, 1, 1, 1, 1,
-2.009771, 0.9104201, -2.438478, 1, 1, 1, 1, 1,
-1.967951, -0.5854203, -0.4990413, 1, 1, 1, 1, 1,
-1.939249, 1.666069, -0.4699362, 1, 1, 1, 1, 1,
-1.935383, -1.028659, -1.295434, 1, 1, 1, 1, 1,
-1.918402, 0.104753, -3.084712, 0, 0, 1, 1, 1,
-1.897886, -2.715441, -0.5829092, 1, 0, 0, 1, 1,
-1.857615, -1.227627, -2.353654, 1, 0, 0, 1, 1,
-1.853093, -0.5932475, -3.632766, 1, 0, 0, 1, 1,
-1.843284, 0.7469705, -2.325154, 1, 0, 0, 1, 1,
-1.842346, 0.1840994, -1.065051, 1, 0, 0, 1, 1,
-1.84056, 0.9524026, 1.074918, 0, 0, 0, 1, 1,
-1.840316, -1.270836, -1.607727, 0, 0, 0, 1, 1,
-1.833727, -1.595998, -0.8608549, 0, 0, 0, 1, 1,
-1.806193, 0.05759427, -0.9416432, 0, 0, 0, 1, 1,
-1.803757, 0.8628151, -1.036487, 0, 0, 0, 1, 1,
-1.738653, -0.3649492, -2.790687, 0, 0, 0, 1, 1,
-1.703787, -0.72708, -1.571045, 0, 0, 0, 1, 1,
-1.662953, -1.157102, -1.84863, 1, 1, 1, 1, 1,
-1.641625, 0.6358345, -1.031459, 1, 1, 1, 1, 1,
-1.636258, -0.1146737, -2.181243, 1, 1, 1, 1, 1,
-1.630564, 1.473874, -1.90781, 1, 1, 1, 1, 1,
-1.609751, -1.650852, -0.9763442, 1, 1, 1, 1, 1,
-1.60498, -0.1281285, -1.472449, 1, 1, 1, 1, 1,
-1.583858, 2.145165, -1.368939, 1, 1, 1, 1, 1,
-1.57674, 0.7760304, -1.767875, 1, 1, 1, 1, 1,
-1.56665, -0.3723483, -2.886334, 1, 1, 1, 1, 1,
-1.564726, -2.124131, -2.906567, 1, 1, 1, 1, 1,
-1.554261, -1.389757, -3.159708, 1, 1, 1, 1, 1,
-1.538478, -0.6401745, -1.481158, 1, 1, 1, 1, 1,
-1.535535, 0.560809, -1.098219, 1, 1, 1, 1, 1,
-1.53428, 0.07668377, -1.612909, 1, 1, 1, 1, 1,
-1.529371, 0.7991322, -0.5623958, 1, 1, 1, 1, 1,
-1.524011, 0.06080726, -1.863222, 0, 0, 1, 1, 1,
-1.508164, 1.591324, -2.152471, 1, 0, 0, 1, 1,
-1.50476, -0.3077874, -0.5463352, 1, 0, 0, 1, 1,
-1.484577, -0.4340332, -1.686475, 1, 0, 0, 1, 1,
-1.479722, 0.04371151, -1.897613, 1, 0, 0, 1, 1,
-1.478365, -0.9574444, -1.20775, 1, 0, 0, 1, 1,
-1.477517, -0.8240763, -2.789337, 0, 0, 0, 1, 1,
-1.466848, -0.1164984, -3.678548, 0, 0, 0, 1, 1,
-1.466441, 0.5651863, -1.264904, 0, 0, 0, 1, 1,
-1.455951, -0.5406373, -2.681454, 0, 0, 0, 1, 1,
-1.453831, -0.2973424, -1.966843, 0, 0, 0, 1, 1,
-1.453671, -0.07177223, -1.058363, 0, 0, 0, 1, 1,
-1.431207, -0.2636689, -2.36726, 0, 0, 0, 1, 1,
-1.429896, -0.2725324, -1.882957, 1, 1, 1, 1, 1,
-1.415946, -0.4755982, -0.502027, 1, 1, 1, 1, 1,
-1.411025, 0.2527699, -2.148732, 1, 1, 1, 1, 1,
-1.408753, 0.7473584, -2.897424, 1, 1, 1, 1, 1,
-1.397299, 0.2312094, -1.984163, 1, 1, 1, 1, 1,
-1.390487, -1.154786, -2.191439, 1, 1, 1, 1, 1,
-1.388849, 0.334689, -2.514924, 1, 1, 1, 1, 1,
-1.383503, -1.898277, -1.5036, 1, 1, 1, 1, 1,
-1.350595, -1.525371, -2.729023, 1, 1, 1, 1, 1,
-1.344241, -1.336284, 0.2429956, 1, 1, 1, 1, 1,
-1.342176, -1.6604, -1.770902, 1, 1, 1, 1, 1,
-1.341772, -0.699131, 0.09050507, 1, 1, 1, 1, 1,
-1.33519, 0.6610714, -2.875027, 1, 1, 1, 1, 1,
-1.326691, -0.4154558, -3.281576, 1, 1, 1, 1, 1,
-1.3216, 0.3158783, -1.452782, 1, 1, 1, 1, 1,
-1.319272, 0.2676367, -1.24916, 0, 0, 1, 1, 1,
-1.305907, 0.4357448, -1.174005, 1, 0, 0, 1, 1,
-1.297181, 0.5559181, -1.177241, 1, 0, 0, 1, 1,
-1.296776, -1.327033, -1.302116, 1, 0, 0, 1, 1,
-1.294523, 0.4010914, -0.6472075, 1, 0, 0, 1, 1,
-1.290417, 1.069059, 0.4085619, 1, 0, 0, 1, 1,
-1.283656, -0.2189707, -0.8726304, 0, 0, 0, 1, 1,
-1.281608, -0.7889533, -3.276035, 0, 0, 0, 1, 1,
-1.280845, 1.115584, -2.294226, 0, 0, 0, 1, 1,
-1.27622, -1.599354, -1.687856, 0, 0, 0, 1, 1,
-1.272877, -0.415635, -2.123899, 0, 0, 0, 1, 1,
-1.267509, 0.07248966, -2.932324, 0, 0, 0, 1, 1,
-1.266448, 0.5454749, -2.422793, 0, 0, 0, 1, 1,
-1.262999, -0.7656151, -1.027386, 1, 1, 1, 1, 1,
-1.244587, -0.8700542, -1.974378, 1, 1, 1, 1, 1,
-1.242346, -0.3759325, -0.440565, 1, 1, 1, 1, 1,
-1.235867, -0.707948, -3.823093, 1, 1, 1, 1, 1,
-1.234357, 0.3924101, 1.015718, 1, 1, 1, 1, 1,
-1.231873, 0.3852577, -1.897475, 1, 1, 1, 1, 1,
-1.229496, 0.7390218, -0.4498286, 1, 1, 1, 1, 1,
-1.22773, 0.7204773, -2.464836, 1, 1, 1, 1, 1,
-1.224153, -2.287913, -4.408398, 1, 1, 1, 1, 1,
-1.219911, -0.2796933, -1.138579, 1, 1, 1, 1, 1,
-1.218952, 0.6179044, -0.09317943, 1, 1, 1, 1, 1,
-1.217352, -0.4161904, -0.4781438, 1, 1, 1, 1, 1,
-1.217071, 1.610071, -0.8161784, 1, 1, 1, 1, 1,
-1.216737, 0.4106177, 0.1929434, 1, 1, 1, 1, 1,
-1.210109, 1.850448, -0.1858128, 1, 1, 1, 1, 1,
-1.208719, 0.4386222, -1.182976, 0, 0, 1, 1, 1,
-1.200278, -0.5189503, -4.335349, 1, 0, 0, 1, 1,
-1.199115, 1.744511, -0.6342388, 1, 0, 0, 1, 1,
-1.195548, -0.4640277, -1.868813, 1, 0, 0, 1, 1,
-1.189563, -1.536386, -3.245916, 1, 0, 0, 1, 1,
-1.180172, 0.2050104, -1.889249, 1, 0, 0, 1, 1,
-1.178708, -0.3274779, -2.010952, 0, 0, 0, 1, 1,
-1.177353, -0.5661561, -2.698765, 0, 0, 0, 1, 1,
-1.171196, -0.195972, -3.995287, 0, 0, 0, 1, 1,
-1.170282, -0.3569076, -1.1199, 0, 0, 0, 1, 1,
-1.17005, 0.3257383, -1.758437, 0, 0, 0, 1, 1,
-1.169582, 0.990364, -0.8931762, 0, 0, 0, 1, 1,
-1.139827, -0.4338039, -1.374704, 0, 0, 0, 1, 1,
-1.137097, 0.5223868, -1.428391, 1, 1, 1, 1, 1,
-1.135519, 1.290542, 0.259068, 1, 1, 1, 1, 1,
-1.134318, -0.8119206, -1.624998, 1, 1, 1, 1, 1,
-1.120327, -0.1495502, -1.759799, 1, 1, 1, 1, 1,
-1.114972, -0.5589541, -2.011801, 1, 1, 1, 1, 1,
-1.111459, -0.07819746, -0.2269669, 1, 1, 1, 1, 1,
-1.109279, 1.853976, 0.3370136, 1, 1, 1, 1, 1,
-1.10767, -0.2665828, -1.847473, 1, 1, 1, 1, 1,
-1.107134, 0.08169644, -0.862721, 1, 1, 1, 1, 1,
-1.104478, 0.01222028, -0.8643421, 1, 1, 1, 1, 1,
-1.10137, -1.097231, -3.158968, 1, 1, 1, 1, 1,
-1.096434, -0.2221528, -0.5090546, 1, 1, 1, 1, 1,
-1.083315, -1.085879, -1.027331, 1, 1, 1, 1, 1,
-1.08114, 0.08418678, -1.172943, 1, 1, 1, 1, 1,
-1.077068, 0.4984077, -1.991031, 1, 1, 1, 1, 1,
-1.072699, 0.491653, -1.908265, 0, 0, 1, 1, 1,
-1.071752, 0.3389692, -2.247754, 1, 0, 0, 1, 1,
-1.059849, -0.8974612, -0.767678, 1, 0, 0, 1, 1,
-1.056727, 1.441772, -1.30342, 1, 0, 0, 1, 1,
-1.05459, -1.268357, -2.4682, 1, 0, 0, 1, 1,
-1.037185, -1.493232, -1.092943, 1, 0, 0, 1, 1,
-1.036461, 0.02858245, -0.6068723, 0, 0, 0, 1, 1,
-1.025011, 0.09240972, -1.367726, 0, 0, 0, 1, 1,
-1.018407, 0.4035794, -1.768809, 0, 0, 0, 1, 1,
-1.017426, 0.5378494, -1.138351, 0, 0, 0, 1, 1,
-1.015763, -0.4176513, -3.188036, 0, 0, 0, 1, 1,
-1.008976, -0.01417511, -2.688763, 0, 0, 0, 1, 1,
-1.004543, 0.1872604, -0.6255832, 0, 0, 0, 1, 1,
-0.9991818, 1.149278, -0.4213734, 1, 1, 1, 1, 1,
-0.9935775, 1.338979, -1.247234, 1, 1, 1, 1, 1,
-0.9901509, -0.6211335, -2.742911, 1, 1, 1, 1, 1,
-0.9844255, -1.116072, -2.32189, 1, 1, 1, 1, 1,
-0.9739277, 0.3278517, -1.071087, 1, 1, 1, 1, 1,
-0.973319, 0.5631305, 0.3748747, 1, 1, 1, 1, 1,
-0.9727545, 0.1828135, -2.400112, 1, 1, 1, 1, 1,
-0.9704491, 1.484551, -0.007082772, 1, 1, 1, 1, 1,
-0.9687401, 0.1967802, -1.616241, 1, 1, 1, 1, 1,
-0.9684714, -0.5275245, -0.9148566, 1, 1, 1, 1, 1,
-0.9665682, 1.216748, 0.1797931, 1, 1, 1, 1, 1,
-0.9638035, -0.1667423, -1.698255, 1, 1, 1, 1, 1,
-0.955058, -0.3854481, -1.475527, 1, 1, 1, 1, 1,
-0.9521219, 0.6398964, -0.439532, 1, 1, 1, 1, 1,
-0.9520958, 0.611587, -2.571835, 1, 1, 1, 1, 1,
-0.9510548, 0.1817982, -1.219381, 0, 0, 1, 1, 1,
-0.9486955, -0.4373941, -3.263157, 1, 0, 0, 1, 1,
-0.9477731, -0.1523561, -1.849908, 1, 0, 0, 1, 1,
-0.9401253, 0.7064685, 0.1433668, 1, 0, 0, 1, 1,
-0.9349239, -0.6980778, -1.136212, 1, 0, 0, 1, 1,
-0.9335964, -0.3320802, -0.4197442, 1, 0, 0, 1, 1,
-0.9326692, -0.4897457, -1.019403, 0, 0, 0, 1, 1,
-0.9311222, -0.6362074, -1.596973, 0, 0, 0, 1, 1,
-0.9268192, -0.8747658, -3.391679, 0, 0, 0, 1, 1,
-0.9221859, -1.482596, -2.123232, 0, 0, 0, 1, 1,
-0.9142684, 0.5264189, 0.6084149, 0, 0, 0, 1, 1,
-0.9092194, 0.4075484, 0.09529766, 0, 0, 0, 1, 1,
-0.8993787, -0.3525062, -0.3654672, 0, 0, 0, 1, 1,
-0.8907478, -2.01634, -2.652114, 1, 1, 1, 1, 1,
-0.8860897, -1.911406, -1.937146, 1, 1, 1, 1, 1,
-0.8860643, 1.525198, 0.06204383, 1, 1, 1, 1, 1,
-0.8835868, -0.636157, -1.587405, 1, 1, 1, 1, 1,
-0.8810956, -0.9183009, -1.348498, 1, 1, 1, 1, 1,
-0.8776745, -0.7573277, -2.368224, 1, 1, 1, 1, 1,
-0.8770565, 0.2609196, -2.584387, 1, 1, 1, 1, 1,
-0.8733918, 0.8572073, -0.366449, 1, 1, 1, 1, 1,
-0.8645163, -1.004264, -2.089675, 1, 1, 1, 1, 1,
-0.8626659, -1.425079, -4.571928, 1, 1, 1, 1, 1,
-0.8624333, -0.1047299, -2.052907, 1, 1, 1, 1, 1,
-0.8610665, -0.3041792, -1.267971, 1, 1, 1, 1, 1,
-0.8608625, -0.2320976, -3.750971, 1, 1, 1, 1, 1,
-0.8607827, 0.3985333, -2.002451, 1, 1, 1, 1, 1,
-0.8594418, 0.2525452, -3.467178, 1, 1, 1, 1, 1,
-0.8474206, -0.1141024, 0.6601486, 0, 0, 1, 1, 1,
-0.8440452, -0.04615257, 0.05158331, 1, 0, 0, 1, 1,
-0.8430791, 0.1925905, -0.6557518, 1, 0, 0, 1, 1,
-0.8395851, -0.6471902, -1.706839, 1, 0, 0, 1, 1,
-0.8380837, -0.4696936, -2.705173, 1, 0, 0, 1, 1,
-0.8308555, 2.388913, 0.06973839, 1, 0, 0, 1, 1,
-0.8307241, 0.2713813, -2.046969, 0, 0, 0, 1, 1,
-0.8228965, -0.3740831, -1.972767, 0, 0, 0, 1, 1,
-0.8171431, -0.556726, -2.474373, 0, 0, 0, 1, 1,
-0.8161914, -1.015297, -2.786618, 0, 0, 0, 1, 1,
-0.8159296, -0.8891234, -4.534776, 0, 0, 0, 1, 1,
-0.8132749, -0.09335362, 0.13254, 0, 0, 0, 1, 1,
-0.8112332, -1.379803, -2.540751, 0, 0, 0, 1, 1,
-0.8102689, 1.631474, 0.4319474, 1, 1, 1, 1, 1,
-0.8092791, 0.1694279, -2.882686, 1, 1, 1, 1, 1,
-0.8057628, 0.01607662, -0.9759958, 1, 1, 1, 1, 1,
-0.8031687, -1.902115, -2.072399, 1, 1, 1, 1, 1,
-0.8004619, 1.560984, -1.672203, 1, 1, 1, 1, 1,
-0.7957307, -0.4188473, -0.3939353, 1, 1, 1, 1, 1,
-0.7920557, 1.23728, -1.094418, 1, 1, 1, 1, 1,
-0.7872331, 0.7127714, 0.2003339, 1, 1, 1, 1, 1,
-0.784712, 1.209822, -1.81801, 1, 1, 1, 1, 1,
-0.7839428, -1.381096, -4.502243, 1, 1, 1, 1, 1,
-0.7828396, 1.012707, -1.474353, 1, 1, 1, 1, 1,
-0.7824714, -0.3596346, -2.68904, 1, 1, 1, 1, 1,
-0.7811931, 0.2656276, -1.61156, 1, 1, 1, 1, 1,
-0.7808136, -0.976101, -2.189015, 1, 1, 1, 1, 1,
-0.7799358, -2.579947, -2.720227, 1, 1, 1, 1, 1,
-0.7776741, -0.9982727, -1.663031, 0, 0, 1, 1, 1,
-0.7698897, 0.231438, -1.6355, 1, 0, 0, 1, 1,
-0.7671571, -0.6541268, -1.727029, 1, 0, 0, 1, 1,
-0.7617477, 1.210189, -1.652966, 1, 0, 0, 1, 1,
-0.759656, 0.7415288, -0.546541, 1, 0, 0, 1, 1,
-0.7596112, 1.043831, -1.046335, 1, 0, 0, 1, 1,
-0.7521019, 0.6621065, -1.973898, 0, 0, 0, 1, 1,
-0.7493931, -0.03478019, -4.338472, 0, 0, 0, 1, 1,
-0.7481874, -2.601503, -1.557481, 0, 0, 0, 1, 1,
-0.7481489, 0.7407304, -2.762557, 0, 0, 0, 1, 1,
-0.7456601, -0.5066175, -2.749493, 0, 0, 0, 1, 1,
-0.7446505, 0.09600489, -1.250819, 0, 0, 0, 1, 1,
-0.741583, -1.375032, -2.620661, 0, 0, 0, 1, 1,
-0.7405654, -1.481637, -3.082908, 1, 1, 1, 1, 1,
-0.7397274, -1.494698, -2.173163, 1, 1, 1, 1, 1,
-0.7387909, -1.181138, -1.651938, 1, 1, 1, 1, 1,
-0.7371579, -0.07511372, -2.004782, 1, 1, 1, 1, 1,
-0.733292, -0.743726, -3.826783, 1, 1, 1, 1, 1,
-0.733266, 1.194883, -2.329838, 1, 1, 1, 1, 1,
-0.7331611, 0.9330713, -0.2468904, 1, 1, 1, 1, 1,
-0.7294026, 1.130057, -2.223599, 1, 1, 1, 1, 1,
-0.7269678, -1.737198, -0.7845706, 1, 1, 1, 1, 1,
-0.7248257, -0.7584203, -1.974986, 1, 1, 1, 1, 1,
-0.7221986, 0.5976889, -2.34668, 1, 1, 1, 1, 1,
-0.7165689, -0.6036116, -3.075552, 1, 1, 1, 1, 1,
-0.7012752, 0.2683704, -2.680459, 1, 1, 1, 1, 1,
-0.6955508, -1.216502, -3.373334, 1, 1, 1, 1, 1,
-0.6943042, 0.1278451, -1.003545, 1, 1, 1, 1, 1,
-0.6930992, 0.9460583, -1.019096, 0, 0, 1, 1, 1,
-0.6911762, 0.5865321, 0.09585115, 1, 0, 0, 1, 1,
-0.6909497, -0.4767073, -2.733607, 1, 0, 0, 1, 1,
-0.6880548, 1.012372, -0.8741921, 1, 0, 0, 1, 1,
-0.6864564, -1.261188, -2.259889, 1, 0, 0, 1, 1,
-0.6821851, -0.09967213, -3.582289, 1, 0, 0, 1, 1,
-0.6797414, -0.8348714, -1.970529, 0, 0, 0, 1, 1,
-0.678817, 0.1734308, -2.321528, 0, 0, 0, 1, 1,
-0.6761287, 0.1217437, -2.485444, 0, 0, 0, 1, 1,
-0.6712598, 0.2049387, -0.1390492, 0, 0, 0, 1, 1,
-0.67035, -0.2963218, -1.836995, 0, 0, 0, 1, 1,
-0.6693235, -1.430259, -0.7623879, 0, 0, 0, 1, 1,
-0.6693176, -1.3457, -0.6902655, 0, 0, 0, 1, 1,
-0.6587166, 1.56374, -1.468642, 1, 1, 1, 1, 1,
-0.6542555, 1.019115, 0.7058912, 1, 1, 1, 1, 1,
-0.6538914, 0.049653, -0.25075, 1, 1, 1, 1, 1,
-0.6525329, -1.887082, -2.913702, 1, 1, 1, 1, 1,
-0.652405, 0.09220534, -2.142182, 1, 1, 1, 1, 1,
-0.649052, 0.2150274, -0.3606152, 1, 1, 1, 1, 1,
-0.6439261, -0.8293189, -4.2258, 1, 1, 1, 1, 1,
-0.6423457, 2.212633, -0.9900599, 1, 1, 1, 1, 1,
-0.6401787, 0.7042271, -0.5336264, 1, 1, 1, 1, 1,
-0.6348162, -0.3240365, -0.1035858, 1, 1, 1, 1, 1,
-0.6325936, -0.76864, -3.144054, 1, 1, 1, 1, 1,
-0.6229648, -1.274527, -3.185476, 1, 1, 1, 1, 1,
-0.6226912, 1.249175, -0.9329839, 1, 1, 1, 1, 1,
-0.6223347, -1.542495, -1.364396, 1, 1, 1, 1, 1,
-0.6218625, -0.1178744, -3.829627, 1, 1, 1, 1, 1,
-0.6189552, 0.2993523, 0.1181867, 0, 0, 1, 1, 1,
-0.6123044, 0.7992538, 0.6628758, 1, 0, 0, 1, 1,
-0.6120741, -1.366426, -1.70166, 1, 0, 0, 1, 1,
-0.6116433, -0.9560136, -2.517529, 1, 0, 0, 1, 1,
-0.5875024, 0.2739546, -0.5124751, 1, 0, 0, 1, 1,
-0.586289, 0.3138885, -0.898963, 1, 0, 0, 1, 1,
-0.5859124, -0.6472611, -2.113125, 0, 0, 0, 1, 1,
-0.5850472, 0.8643362, 0.2328665, 0, 0, 0, 1, 1,
-0.5818377, 2.493744, 0.9336886, 0, 0, 0, 1, 1,
-0.5728356, 0.7796793, -1.114378, 0, 0, 0, 1, 1,
-0.5720424, -1.454602, -2.383089, 0, 0, 0, 1, 1,
-0.5681829, -0.4652887, -2.215124, 0, 0, 0, 1, 1,
-0.5676262, 0.5612957, 0.8555058, 0, 0, 0, 1, 1,
-0.5670115, -1.03353, -2.455172, 1, 1, 1, 1, 1,
-0.5647216, -0.9092955, -2.549208, 1, 1, 1, 1, 1,
-0.5646744, 0.616738, -0.3903093, 1, 1, 1, 1, 1,
-0.5640693, 0.36771, -1.059656, 1, 1, 1, 1, 1,
-0.5583051, -1.912223, -3.17301, 1, 1, 1, 1, 1,
-0.5562817, 0.7595567, -1.37423, 1, 1, 1, 1, 1,
-0.5535176, 1.109077, -0.7462688, 1, 1, 1, 1, 1,
-0.5525512, 0.4487178, -0.2323691, 1, 1, 1, 1, 1,
-0.5525278, -0.5305126, -1.291786, 1, 1, 1, 1, 1,
-0.5503824, -1.982666, -3.82857, 1, 1, 1, 1, 1,
-0.5464767, -0.5773778, -1.771981, 1, 1, 1, 1, 1,
-0.5364588, -0.4658478, -0.9006609, 1, 1, 1, 1, 1,
-0.532825, 0.1388007, -1.655561, 1, 1, 1, 1, 1,
-0.5292209, -1.042624, -3.51913, 1, 1, 1, 1, 1,
-0.52795, 0.6397243, 0.1435789, 1, 1, 1, 1, 1,
-0.5269769, 0.1492776, -1.085218, 0, 0, 1, 1, 1,
-0.5213869, -1.049306, -1.497427, 1, 0, 0, 1, 1,
-0.5170144, -0.2164815, -3.006496, 1, 0, 0, 1, 1,
-0.516403, -0.5547634, -1.582445, 1, 0, 0, 1, 1,
-0.5141598, 0.54931, -1.344558, 1, 0, 0, 1, 1,
-0.5122057, -0.3043737, -3.010476, 1, 0, 0, 1, 1,
-0.5104797, 0.9146509, 1.709294, 0, 0, 0, 1, 1,
-0.5094875, 0.6396543, -2.329195, 0, 0, 0, 1, 1,
-0.5082994, -1.546572, -3.335757, 0, 0, 0, 1, 1,
-0.499056, 0.0134117, -0.3451437, 0, 0, 0, 1, 1,
-0.4942564, -0.369186, -2.022135, 0, 0, 0, 1, 1,
-0.4899128, -0.3923648, -2.980454, 0, 0, 0, 1, 1,
-0.4875537, -0.2042763, -1.652173, 0, 0, 0, 1, 1,
-0.4868297, -1.000351, -3.022538, 1, 1, 1, 1, 1,
-0.4812952, -0.2039059, -0.915881, 1, 1, 1, 1, 1,
-0.481254, -1.52755, -2.13962, 1, 1, 1, 1, 1,
-0.4771459, -0.4884057, -3.013232, 1, 1, 1, 1, 1,
-0.474083, 1.272095, -0.1962324, 1, 1, 1, 1, 1,
-0.4726105, 0.1104509, 0.7538089, 1, 1, 1, 1, 1,
-0.4722716, -2.175573, -2.56767, 1, 1, 1, 1, 1,
-0.468962, -0.2670015, -3.052278, 1, 1, 1, 1, 1,
-0.4667948, 1.120619, -0.955012, 1, 1, 1, 1, 1,
-0.4657375, 0.9598374, -1.707007, 1, 1, 1, 1, 1,
-0.4647118, 0.3141218, -0.4953334, 1, 1, 1, 1, 1,
-0.4586682, -0.1158522, -3.562107, 1, 1, 1, 1, 1,
-0.4541218, 0.7414498, 2.07935, 1, 1, 1, 1, 1,
-0.4536879, 0.4265628, 2.536946, 1, 1, 1, 1, 1,
-0.4518554, 0.3133614, -0.3445057, 1, 1, 1, 1, 1,
-0.4479909, 0.2929635, -3.371872, 0, 0, 1, 1, 1,
-0.4444553, 0.4870829, -0.7490388, 1, 0, 0, 1, 1,
-0.4443007, 0.3534874, -2.026108, 1, 0, 0, 1, 1,
-0.4436005, -1.216625, -1.357852, 1, 0, 0, 1, 1,
-0.4410537, -1.246563, -2.304924, 1, 0, 0, 1, 1,
-0.4389356, -1.512765, -2.89563, 1, 0, 0, 1, 1,
-0.4341444, -1.204613, -3.780911, 0, 0, 0, 1, 1,
-0.4300603, -2.586554, -3.081341, 0, 0, 0, 1, 1,
-0.4280301, -0.297861, -1.268013, 0, 0, 0, 1, 1,
-0.4181301, -1.278464, -3.909215, 0, 0, 0, 1, 1,
-0.4115651, 0.3998847, -2.1471, 0, 0, 0, 1, 1,
-0.4102691, 0.1391203, 0.1646193, 0, 0, 0, 1, 1,
-0.405867, -0.6426688, -2.392029, 0, 0, 0, 1, 1,
-0.4045171, 0.9345972, -0.1332199, 1, 1, 1, 1, 1,
-0.4031382, -0.2920825, -2.961727, 1, 1, 1, 1, 1,
-0.4016796, -0.8873156, -3.529988, 1, 1, 1, 1, 1,
-0.4008701, -1.968745, -3.300192, 1, 1, 1, 1, 1,
-0.3996775, -0.1822941, -1.816731, 1, 1, 1, 1, 1,
-0.3980331, -0.06079959, -0.6076102, 1, 1, 1, 1, 1,
-0.3958905, 0.8550432, -0.02682373, 1, 1, 1, 1, 1,
-0.3955654, 0.03319442, -2.705976, 1, 1, 1, 1, 1,
-0.393602, -0.2391552, -2.097274, 1, 1, 1, 1, 1,
-0.3914967, 1.343957, 1.313303, 1, 1, 1, 1, 1,
-0.3914815, -0.01269995, -1.513615, 1, 1, 1, 1, 1,
-0.3887548, 0.8308163, 0.6654595, 1, 1, 1, 1, 1,
-0.3877164, -0.01130311, -3.516079, 1, 1, 1, 1, 1,
-0.3813506, -0.2695664, -2.529083, 1, 1, 1, 1, 1,
-0.3810915, -1.907657, -3.458936, 1, 1, 1, 1, 1,
-0.3772038, -1.267271, -3.598161, 0, 0, 1, 1, 1,
-0.3744303, 1.242184, 1.452806, 1, 0, 0, 1, 1,
-0.3706054, 1.006791, 0.648665, 1, 0, 0, 1, 1,
-0.3693515, -0.3585992, -3.821922, 1, 0, 0, 1, 1,
-0.3643075, -0.2564535, -3.109356, 1, 0, 0, 1, 1,
-0.3599393, -0.158144, -0.6920223, 1, 0, 0, 1, 1,
-0.3517606, -0.3177082, -2.060001, 0, 0, 0, 1, 1,
-0.3500413, -0.1578005, -2.553282, 0, 0, 0, 1, 1,
-0.3476449, 1.019282, -1.037367, 0, 0, 0, 1, 1,
-0.3446733, 1.117723, -0.7194037, 0, 0, 0, 1, 1,
-0.3416753, -0.5265504, -2.160192, 0, 0, 0, 1, 1,
-0.3400575, -1.799297, -3.237887, 0, 0, 0, 1, 1,
-0.3383549, -0.1103686, -2.973382, 0, 0, 0, 1, 1,
-0.335543, -0.07924039, -2.658697, 1, 1, 1, 1, 1,
-0.3351582, 0.5292231, 0.7342123, 1, 1, 1, 1, 1,
-0.3317762, 1.141466, 0.2434232, 1, 1, 1, 1, 1,
-0.3300835, -0.8308, -2.692761, 1, 1, 1, 1, 1,
-0.3299386, -0.5079991, -0.9746679, 1, 1, 1, 1, 1,
-0.3242992, 1.54272, -0.6891262, 1, 1, 1, 1, 1,
-0.3217877, 0.4277472, -1.10198, 1, 1, 1, 1, 1,
-0.3138311, -1.119737, -2.941944, 1, 1, 1, 1, 1,
-0.3134602, -0.1559382, -0.9817232, 1, 1, 1, 1, 1,
-0.3122753, -0.5100361, -1.231996, 1, 1, 1, 1, 1,
-0.3076572, -1.43015, -2.014654, 1, 1, 1, 1, 1,
-0.3072234, -1.614902, -5.023938, 1, 1, 1, 1, 1,
-0.3063329, -0.5248397, -1.306534, 1, 1, 1, 1, 1,
-0.3054227, -1.00076, -2.485319, 1, 1, 1, 1, 1,
-0.3042393, -0.2367751, -1.601254, 1, 1, 1, 1, 1,
-0.3025746, -0.05187875, -3.244961, 0, 0, 1, 1, 1,
-0.3008236, -0.7535427, -2.041293, 1, 0, 0, 1, 1,
-0.3004938, 0.9598404, 0.4743893, 1, 0, 0, 1, 1,
-0.2939061, 0.6662985, -1.308479, 1, 0, 0, 1, 1,
-0.2938215, -1.795402, -3.208969, 1, 0, 0, 1, 1,
-0.2861595, -0.1418045, -2.69585, 1, 0, 0, 1, 1,
-0.277572, -0.2018754, -2.365108, 0, 0, 0, 1, 1,
-0.2762758, 0.3160001, -0.8005106, 0, 0, 0, 1, 1,
-0.2734786, -0.5805175, -3.197015, 0, 0, 0, 1, 1,
-0.2728819, -0.7353027, -3.605848, 0, 0, 0, 1, 1,
-0.2713341, 0.9390551, 1.043388, 0, 0, 0, 1, 1,
-0.2707897, -1.774848, -4.23297, 0, 0, 0, 1, 1,
-0.2671473, -0.7178656, -2.775549, 0, 0, 0, 1, 1,
-0.260378, 0.6603495, 1.005025, 1, 1, 1, 1, 1,
-0.2569567, -1.264373, -4.076842, 1, 1, 1, 1, 1,
-0.2549109, -0.2968944, -3.911526, 1, 1, 1, 1, 1,
-0.2539405, -0.3142107, -3.044316, 1, 1, 1, 1, 1,
-0.2397585, 0.7165407, 1.150989, 1, 1, 1, 1, 1,
-0.2357219, 0.8327001, -0.191333, 1, 1, 1, 1, 1,
-0.2353041, -1.275043, -4.32741, 1, 1, 1, 1, 1,
-0.2327104, -1.710923, -2.622614, 1, 1, 1, 1, 1,
-0.2286886, 0.4567588, 0.778551, 1, 1, 1, 1, 1,
-0.228224, -1.349824, -2.95117, 1, 1, 1, 1, 1,
-0.2250964, 0.5951561, 0.8420297, 1, 1, 1, 1, 1,
-0.2247231, 0.2081444, -0.7875427, 1, 1, 1, 1, 1,
-0.2192327, 1.056819, -0.08707827, 1, 1, 1, 1, 1,
-0.2191905, -1.00876, -3.528264, 1, 1, 1, 1, 1,
-0.2190602, -2.387785, -3.135051, 1, 1, 1, 1, 1,
-0.2177445, -0.5796961, -2.02137, 0, 0, 1, 1, 1,
-0.2082448, -0.2870977, -2.6238, 1, 0, 0, 1, 1,
-0.2077563, -0.1965014, -4.777322, 1, 0, 0, 1, 1,
-0.206573, 1.894839, 0.6717623, 1, 0, 0, 1, 1,
-0.2052396, -0.2130043, -3.209404, 1, 0, 0, 1, 1,
-0.2017063, 0.999108, -0.9908409, 1, 0, 0, 1, 1,
-0.2010494, -1.019702, -1.225727, 0, 0, 0, 1, 1,
-0.2007453, -0.4421111, -2.191591, 0, 0, 0, 1, 1,
-0.1999137, -0.7098747, -4.120481, 0, 0, 0, 1, 1,
-0.1973956, -0.9260375, -2.622935, 0, 0, 0, 1, 1,
-0.1965985, -0.6192211, -1.739748, 0, 0, 0, 1, 1,
-0.1958228, 0.1167995, -1.653753, 0, 0, 0, 1, 1,
-0.1936242, 2.611153, 0.003057334, 0, 0, 0, 1, 1,
-0.1933716, -0.3806943, -3.513581, 1, 1, 1, 1, 1,
-0.1904551, 0.1724773, -0.8146998, 1, 1, 1, 1, 1,
-0.1898802, 1.428468, -0.2755333, 1, 1, 1, 1, 1,
-0.1859431, 0.860608, 0.02275483, 1, 1, 1, 1, 1,
-0.1786352, 0.3005419, -1.428136, 1, 1, 1, 1, 1,
-0.1721755, 0.8142652, 1.089251, 1, 1, 1, 1, 1,
-0.1713335, 0.5843189, -2.814843, 1, 1, 1, 1, 1,
-0.1650662, -0.1655586, -2.744048, 1, 1, 1, 1, 1,
-0.1642491, 0.9149086, -0.257362, 1, 1, 1, 1, 1,
-0.1641897, 0.2035384, -0.2032629, 1, 1, 1, 1, 1,
-0.1637769, -0.2986323, -1.14172, 1, 1, 1, 1, 1,
-0.162358, -0.4889289, -2.685362, 1, 1, 1, 1, 1,
-0.1623364, -0.7095977, -4.281877, 1, 1, 1, 1, 1,
-0.1589428, -0.04360259, -0.3159097, 1, 1, 1, 1, 1,
-0.1557747, 0.5529509, -0.07672405, 1, 1, 1, 1, 1,
-0.1535867, -0.008675328, -0.4871409, 0, 0, 1, 1, 1,
-0.1498406, 1.491435, -0.5778946, 1, 0, 0, 1, 1,
-0.1459888, 1.040357, -0.2087272, 1, 0, 0, 1, 1,
-0.1444434, 1.105652, 0.8227814, 1, 0, 0, 1, 1,
-0.1436292, -0.1730687, -3.246659, 1, 0, 0, 1, 1,
-0.1416885, 0.9935088, 0.3130496, 1, 0, 0, 1, 1,
-0.1414661, -1.217086, -3.730215, 0, 0, 0, 1, 1,
-0.1414462, -1.109698, -3.17325, 0, 0, 0, 1, 1,
-0.1391441, 0.2271783, -0.342122, 0, 0, 0, 1, 1,
-0.1383569, 0.4611129, -2.010232, 0, 0, 0, 1, 1,
-0.1322963, 0.6939813, 0.6154279, 0, 0, 0, 1, 1,
-0.1234191, -0.02650898, -1.367856, 0, 0, 0, 1, 1,
-0.1219934, 0.7567235, 0.8717071, 0, 0, 0, 1, 1,
-0.1123962, -0.2454452, -2.915699, 1, 1, 1, 1, 1,
-0.1095503, 1.157906, 0.6517845, 1, 1, 1, 1, 1,
-0.1080476, -1.919719, -2.485134, 1, 1, 1, 1, 1,
-0.1054767, 0.7076882, -0.9964527, 1, 1, 1, 1, 1,
-0.1041978, 0.3151913, -1.456535, 1, 1, 1, 1, 1,
-0.1014644, 0.5288378, -1.397568, 1, 1, 1, 1, 1,
-0.09721936, -0.284948, -3.24217, 1, 1, 1, 1, 1,
-0.09691539, -0.1249833, -2.784624, 1, 1, 1, 1, 1,
-0.09226391, -1.24189, -3.434114, 1, 1, 1, 1, 1,
-0.0887851, -0.9243031, -2.162898, 1, 1, 1, 1, 1,
-0.08673161, -2.405982, -0.8974726, 1, 1, 1, 1, 1,
-0.08007562, -0.3360017, -4.650232, 1, 1, 1, 1, 1,
-0.07986809, 1.076449, -0.06696215, 1, 1, 1, 1, 1,
-0.07970104, 1.144605, -0.2574918, 1, 1, 1, 1, 1,
-0.07912039, 0.2932149, -0.6817616, 1, 1, 1, 1, 1,
-0.07573934, -0.810322, -2.311706, 0, 0, 1, 1, 1,
-0.07407434, -0.1599598, -3.040162, 1, 0, 0, 1, 1,
-0.07309161, 1.276577, -0.2974165, 1, 0, 0, 1, 1,
-0.06893544, -0.4013525, -3.853983, 1, 0, 0, 1, 1,
-0.06841925, 0.9419148, 0.02133195, 1, 0, 0, 1, 1,
-0.06791479, 0.3321636, -1.679374, 1, 0, 0, 1, 1,
-0.06457687, 0.4378816, 0.06656707, 0, 0, 0, 1, 1,
-0.0537819, 1.567269, -0.009919167, 0, 0, 0, 1, 1,
-0.04991605, -0.2384014, -2.966666, 0, 0, 0, 1, 1,
-0.04153828, -0.3236145, -2.99942, 0, 0, 0, 1, 1,
-0.04136688, 1.325365, -1.647788, 0, 0, 0, 1, 1,
-0.04113541, 0.6496613, 1.016019, 0, 0, 0, 1, 1,
-0.03965131, 0.657822, 0.4522763, 0, 0, 0, 1, 1,
-0.03817663, 1.099403, 0.785305, 1, 1, 1, 1, 1,
-0.03811067, -0.1154338, -4.013814, 1, 1, 1, 1, 1,
-0.03716157, 2.08517, 0.5604588, 1, 1, 1, 1, 1,
-0.03424964, -0.6671464, -1.565357, 1, 1, 1, 1, 1,
-0.02991241, 1.056458, 1.341255, 1, 1, 1, 1, 1,
-0.02752219, 0.2846788, -2.737541, 1, 1, 1, 1, 1,
-0.02714175, -0.07154924, -1.645282, 1, 1, 1, 1, 1,
-0.01982515, 1.37731, -1.024348, 1, 1, 1, 1, 1,
-0.01298831, 0.4661166, -0.007968117, 1, 1, 1, 1, 1,
-0.00899333, -0.5311044, -3.538212, 1, 1, 1, 1, 1,
-0.006878975, 0.1612341, -1.870365, 1, 1, 1, 1, 1,
0.0002957494, -1.050861, 2.984887, 1, 1, 1, 1, 1,
0.001608473, -0.00644494, 3.54282, 1, 1, 1, 1, 1,
0.002790574, -1.883304, 2.638438, 1, 1, 1, 1, 1,
0.005590087, -0.8787081, 3.675351, 1, 1, 1, 1, 1,
0.005961375, -0.2571678, 1.338738, 0, 0, 1, 1, 1,
0.0108192, -1.898378, 1.973779, 1, 0, 0, 1, 1,
0.01615658, -0.1149102, 3.250735, 1, 0, 0, 1, 1,
0.01637827, 0.5335466, 0.7159731, 1, 0, 0, 1, 1,
0.01751943, 0.8091658, -0.3287954, 1, 0, 0, 1, 1,
0.01802693, 1.09925, -0.3149026, 1, 0, 0, 1, 1,
0.02125725, -2.418781, 2.612366, 0, 0, 0, 1, 1,
0.02305995, -0.1982528, 3.279073, 0, 0, 0, 1, 1,
0.02891376, 1.409131, -0.9062691, 0, 0, 0, 1, 1,
0.02929146, -2.145256, 2.793815, 0, 0, 0, 1, 1,
0.03043213, -0.2835175, 1.91379, 0, 0, 0, 1, 1,
0.03106965, 0.1685442, 0.06928731, 0, 0, 0, 1, 1,
0.03128377, -0.2592534, 0.8490741, 0, 0, 0, 1, 1,
0.03426401, -1.340843, 3.185379, 1, 1, 1, 1, 1,
0.03430479, 0.004893333, 1.428816, 1, 1, 1, 1, 1,
0.03478609, -0.03548927, 4.170846, 1, 1, 1, 1, 1,
0.04218571, 1.117708, -2.204222, 1, 1, 1, 1, 1,
0.04226834, -0.9659036, 2.673886, 1, 1, 1, 1, 1,
0.04374613, 0.7228398, -1.688986, 1, 1, 1, 1, 1,
0.04669281, -0.3458228, 2.949293, 1, 1, 1, 1, 1,
0.04732048, -0.3435478, 2.154331, 1, 1, 1, 1, 1,
0.04918894, -0.466637, 4.054778, 1, 1, 1, 1, 1,
0.05036872, 0.3188413, -0.1109571, 1, 1, 1, 1, 1,
0.05275736, 0.5603933, -0.7370889, 1, 1, 1, 1, 1,
0.06326695, 0.1175694, 1.686449, 1, 1, 1, 1, 1,
0.06484365, 1.483396, -0.9682367, 1, 1, 1, 1, 1,
0.06588948, 1.324921, 0.6173279, 1, 1, 1, 1, 1,
0.06959765, -0.01816447, 3.31254, 1, 1, 1, 1, 1,
0.07071523, 2.898572, 0.9374472, 0, 0, 1, 1, 1,
0.08294731, 2.206608, 0.6774098, 1, 0, 0, 1, 1,
0.08551262, 0.669015, 1.716182, 1, 0, 0, 1, 1,
0.08815151, -0.4205299, 2.666416, 1, 0, 0, 1, 1,
0.08903605, -1.279533, 3.966722, 1, 0, 0, 1, 1,
0.09276173, -0.6156654, 3.021741, 1, 0, 0, 1, 1,
0.09672482, 1.014218, 0.764516, 0, 0, 0, 1, 1,
0.09761588, 1.468209, 0.2609404, 0, 0, 0, 1, 1,
0.09833974, -0.6145626, 1.189, 0, 0, 0, 1, 1,
0.1112215, -0.2891834, 3.436978, 0, 0, 0, 1, 1,
0.1134865, -1.332438, 1.924299, 0, 0, 0, 1, 1,
0.1143173, 0.5390322, 2.060793, 0, 0, 0, 1, 1,
0.1155432, -1.11789, 3.510865, 0, 0, 0, 1, 1,
0.1171507, 1.876506, -0.3741927, 1, 1, 1, 1, 1,
0.1175223, 2.617339, -1.128245, 1, 1, 1, 1, 1,
0.1209819, 0.3246118, -2.369167, 1, 1, 1, 1, 1,
0.1228206, 0.3965462, -0.3991797, 1, 1, 1, 1, 1,
0.1354747, 0.5218669, 0.7700086, 1, 1, 1, 1, 1,
0.1382107, -0.9057252, 2.704828, 1, 1, 1, 1, 1,
0.1413778, -0.1724993, 2.728076, 1, 1, 1, 1, 1,
0.1420484, -1.537771, 4.235345, 1, 1, 1, 1, 1,
0.1471427, 0.754588, 1.818728, 1, 1, 1, 1, 1,
0.1485134, -0.5177515, 2.029633, 1, 1, 1, 1, 1,
0.1495658, 2.314623, -0.9531392, 1, 1, 1, 1, 1,
0.1513924, -1.975142, 2.707236, 1, 1, 1, 1, 1,
0.1539897, -0.001100335, 1.649117, 1, 1, 1, 1, 1,
0.1562977, -0.8004868, 4.377613, 1, 1, 1, 1, 1,
0.1608259, 1.67935, -0.0588702, 1, 1, 1, 1, 1,
0.1632087, 0.03849471, -0.260054, 0, 0, 1, 1, 1,
0.1656206, -0.3676144, 2.941466, 1, 0, 0, 1, 1,
0.1658265, 0.7171038, 0.3141485, 1, 0, 0, 1, 1,
0.1666664, 0.5181014, 0.807014, 1, 0, 0, 1, 1,
0.1670739, -1.060934, 3.50591, 1, 0, 0, 1, 1,
0.16782, -1.690026, 2.081845, 1, 0, 0, 1, 1,
0.1720732, 1.706128, 0.7534789, 0, 0, 0, 1, 1,
0.1742878, 0.8303348, 0.7675096, 0, 0, 0, 1, 1,
0.176115, -0.9711033, 3.317559, 0, 0, 0, 1, 1,
0.1797303, 0.4871038, -0.05274229, 0, 0, 0, 1, 1,
0.1854595, -1.809003, 3.369538, 0, 0, 0, 1, 1,
0.1919531, 0.04391928, 2.496941, 0, 0, 0, 1, 1,
0.1921483, 1.399954, -0.9161015, 0, 0, 0, 1, 1,
0.1932443, 0.5502909, 1.786074, 1, 1, 1, 1, 1,
0.1940678, 0.8613083, -1.239466, 1, 1, 1, 1, 1,
0.2087314, -1.202285, 3.750521, 1, 1, 1, 1, 1,
0.212096, 1.244564, -0.2538744, 1, 1, 1, 1, 1,
0.2151953, 0.56709, 0.6812802, 1, 1, 1, 1, 1,
0.2166557, -1.089104, 2.575832, 1, 1, 1, 1, 1,
0.2205373, 0.3638315, 2.163038, 1, 1, 1, 1, 1,
0.2208616, -0.1317449, 1.765393, 1, 1, 1, 1, 1,
0.2227031, -2.137415, 2.151535, 1, 1, 1, 1, 1,
0.2360845, -1.784577, 3.796964, 1, 1, 1, 1, 1,
0.2431603, 0.8313232, 0.4925818, 1, 1, 1, 1, 1,
0.2485347, 0.9856147, -0.6903463, 1, 1, 1, 1, 1,
0.2511491, 0.8724309, -0.09294967, 1, 1, 1, 1, 1,
0.2515596, 0.6812582, -0.4978597, 1, 1, 1, 1, 1,
0.2530593, 1.079963, 2.521997, 1, 1, 1, 1, 1,
0.2541081, -0.3661764, 1.338621, 0, 0, 1, 1, 1,
0.2571968, -0.7037117, 1.895595, 1, 0, 0, 1, 1,
0.2589968, -0.2549106, 1.369711, 1, 0, 0, 1, 1,
0.2605155, -1.25645, 2.0254, 1, 0, 0, 1, 1,
0.2653905, -0.4413018, 2.493809, 1, 0, 0, 1, 1,
0.2712816, -1.254443, 2.221842, 1, 0, 0, 1, 1,
0.2757232, -1.368299, 3.338736, 0, 0, 0, 1, 1,
0.2798645, -0.2899415, 1.589605, 0, 0, 0, 1, 1,
0.2822431, -0.2861341, 0.8496401, 0, 0, 0, 1, 1,
0.283907, -0.4899581, 2.806385, 0, 0, 0, 1, 1,
0.2846884, -1.279455, 0.9699341, 0, 0, 0, 1, 1,
0.2856155, -1.882743, 2.401291, 0, 0, 0, 1, 1,
0.2862782, 1.854685, 0.6101413, 0, 0, 0, 1, 1,
0.2901876, 2.042831, -0.6891889, 1, 1, 1, 1, 1,
0.290958, -1.45503, 3.828867, 1, 1, 1, 1, 1,
0.2965517, -0.2868979, 2.71433, 1, 1, 1, 1, 1,
0.3008809, -0.3936348, 4.987147, 1, 1, 1, 1, 1,
0.3046904, 0.5347086, 1.412135, 1, 1, 1, 1, 1,
0.305222, 0.1443737, 2.366144, 1, 1, 1, 1, 1,
0.3098348, 2.080775, 0.2443945, 1, 1, 1, 1, 1,
0.3107173, -0.5195507, 1.995346, 1, 1, 1, 1, 1,
0.3119032, 0.3415124, 0.6437606, 1, 1, 1, 1, 1,
0.313129, 0.1669271, 0.5035647, 1, 1, 1, 1, 1,
0.3134119, -0.2398486, 3.945344, 1, 1, 1, 1, 1,
0.3143869, 0.9588591, 0.5854874, 1, 1, 1, 1, 1,
0.3149457, -1.006804, 2.740282, 1, 1, 1, 1, 1,
0.3172265, -0.1496084, 1.65212, 1, 1, 1, 1, 1,
0.3211788, -1.111998, 4.254845, 1, 1, 1, 1, 1,
0.3277768, -1.303928, 3.526074, 0, 0, 1, 1, 1,
0.3287237, 1.093495, 0.6912742, 1, 0, 0, 1, 1,
0.3307119, 0.6323729, 0.7384797, 1, 0, 0, 1, 1,
0.3321477, 0.9654163, -0.105576, 1, 0, 0, 1, 1,
0.3347146, 0.9791285, 1.372753, 1, 0, 0, 1, 1,
0.3377562, 0.05645157, 4.105623, 1, 0, 0, 1, 1,
0.3412336, -0.6741073, 4.095629, 0, 0, 0, 1, 1,
0.3417372, -0.4927087, 2.663196, 0, 0, 0, 1, 1,
0.3429363, 0.7181725, 0.9925526, 0, 0, 0, 1, 1,
0.3436334, -0.08478335, 0.7331319, 0, 0, 0, 1, 1,
0.3501286, -0.18455, 3.501116, 0, 0, 0, 1, 1,
0.3503698, 1.333933, 0.3480086, 0, 0, 0, 1, 1,
0.3554798, -1.466431, 1.456567, 0, 0, 0, 1, 1,
0.3555874, -1.11776, 3.880538, 1, 1, 1, 1, 1,
0.3570635, 1.150494, 0.3107176, 1, 1, 1, 1, 1,
0.3570668, 2.28912, -0.9124601, 1, 1, 1, 1, 1,
0.3591038, 0.7199993, 0.9006765, 1, 1, 1, 1, 1,
0.362445, -0.424448, 1.99327, 1, 1, 1, 1, 1,
0.3696933, -1.422744, 2.304787, 1, 1, 1, 1, 1,
0.3701411, 1.948766, 0.4251404, 1, 1, 1, 1, 1,
0.3705573, 0.9392302, 0.5595366, 1, 1, 1, 1, 1,
0.3721156, -1.23313, 3.259119, 1, 1, 1, 1, 1,
0.3723791, 0.322079, 0.1225244, 1, 1, 1, 1, 1,
0.3732255, 0.3142659, -0.4806338, 1, 1, 1, 1, 1,
0.3750898, -1.042074, 2.943234, 1, 1, 1, 1, 1,
0.3786213, 0.8763969, 0.07737474, 1, 1, 1, 1, 1,
0.3787223, -0.6406385, 2.5828, 1, 1, 1, 1, 1,
0.3826096, 1.31724, -0.1507087, 1, 1, 1, 1, 1,
0.3877129, 0.08877965, 0.9941943, 0, 0, 1, 1, 1,
0.3913617, -1.050363, 3.318018, 1, 0, 0, 1, 1,
0.3984726, -0.1448918, 2.446351, 1, 0, 0, 1, 1,
0.3991548, 0.3312586, 1.726174, 1, 0, 0, 1, 1,
0.4008619, -1.981139, 1.703784, 1, 0, 0, 1, 1,
0.4046807, -1.01593, 4.088862, 1, 0, 0, 1, 1,
0.4067846, 0.8618404, -0.5918666, 0, 0, 0, 1, 1,
0.4081368, 0.4053522, -0.04064972, 0, 0, 0, 1, 1,
0.4166879, 0.4016499, 2.297601, 0, 0, 0, 1, 1,
0.4174293, 0.4256544, -0.2230555, 0, 0, 0, 1, 1,
0.417712, -0.5568088, 1.567649, 0, 0, 0, 1, 1,
0.4203317, -0.8415585, 4.794605, 0, 0, 0, 1, 1,
0.4206682, -0.2209262, 0.2413901, 0, 0, 0, 1, 1,
0.4275944, -0.4384965, 2.624101, 1, 1, 1, 1, 1,
0.4305757, -1.706041, 2.064178, 1, 1, 1, 1, 1,
0.4316738, -0.7583984, 3.679439, 1, 1, 1, 1, 1,
0.4353241, -2.492564, 3.787523, 1, 1, 1, 1, 1,
0.4382789, -0.1902202, 1.296048, 1, 1, 1, 1, 1,
0.4391937, -0.3193659, 1.457763, 1, 1, 1, 1, 1,
0.44364, 0.1798847, 0.8968493, 1, 1, 1, 1, 1,
0.4436485, 0.4784991, 1.779519, 1, 1, 1, 1, 1,
0.4441549, -1.354112, 3.111836, 1, 1, 1, 1, 1,
0.4487585, 0.06463476, 1.212204, 1, 1, 1, 1, 1,
0.4491467, -0.1226776, 2.441272, 1, 1, 1, 1, 1,
0.4495366, -0.7218563, 2.635116, 1, 1, 1, 1, 1,
0.4539343, 1.640556, 1.561538, 1, 1, 1, 1, 1,
0.4576784, -0.7425854, 3.006679, 1, 1, 1, 1, 1,
0.4598378, -1.874904, 2.036528, 1, 1, 1, 1, 1,
0.4604012, -0.7483388, 2.709473, 0, 0, 1, 1, 1,
0.4637826, 0.8082836, -0.1141961, 1, 0, 0, 1, 1,
0.4645096, 1.566217, 1.216138, 1, 0, 0, 1, 1,
0.4663128, -0.1435868, -0.08512504, 1, 0, 0, 1, 1,
0.4669112, 0.07796833, 0.8123729, 1, 0, 0, 1, 1,
0.4694686, -2.164613, 0.9599202, 1, 0, 0, 1, 1,
0.4722284, -0.1287622, 1.538478, 0, 0, 0, 1, 1,
0.4735054, 0.2353242, 1.493453, 0, 0, 0, 1, 1,
0.4760416, -0.3070646, 3.029615, 0, 0, 0, 1, 1,
0.4787377, -0.7816187, 1.061467, 0, 0, 0, 1, 1,
0.4819821, 0.4015883, 1.776041, 0, 0, 0, 1, 1,
0.4841475, -0.9221873, 0.7681095, 0, 0, 0, 1, 1,
0.4841749, 1.260634, 0.3887662, 0, 0, 0, 1, 1,
0.4844703, -1.068093, 5.329105, 1, 1, 1, 1, 1,
0.4846143, -0.9824845, 3.270357, 1, 1, 1, 1, 1,
0.4850174, -1.277144, 2.664678, 1, 1, 1, 1, 1,
0.4918739, 0.3553191, 1.900981, 1, 1, 1, 1, 1,
0.4923217, -0.5740907, 3.084363, 1, 1, 1, 1, 1,
0.494091, -0.6754149, 1.797979, 1, 1, 1, 1, 1,
0.4945105, 0.6894389, 1.305449, 1, 1, 1, 1, 1,
0.5022699, 1.53349, -1.469003, 1, 1, 1, 1, 1,
0.5058293, -0.2476155, 1.839707, 1, 1, 1, 1, 1,
0.5061032, 2.022415, 1.533103, 1, 1, 1, 1, 1,
0.508688, 0.9361365, 1.283807, 1, 1, 1, 1, 1,
0.5118061, 0.9634926, -0.6356437, 1, 1, 1, 1, 1,
0.5137449, 0.1927077, 2.153191, 1, 1, 1, 1, 1,
0.5168953, -1.380897, -0.3486364, 1, 1, 1, 1, 1,
0.5186039, 1.606622, 0.3944881, 1, 1, 1, 1, 1,
0.5245017, -0.1300093, 2.95596, 0, 0, 1, 1, 1,
0.5285174, -1.547981, 2.880033, 1, 0, 0, 1, 1,
0.5307975, 0.1477493, 1.242402, 1, 0, 0, 1, 1,
0.5310268, -1.299237, 3.923297, 1, 0, 0, 1, 1,
0.5325727, 1.445358, 1.745524, 1, 0, 0, 1, 1,
0.5392355, 1.580853, 2.424788, 1, 0, 0, 1, 1,
0.5430287, 1.051038, -1.190648, 0, 0, 0, 1, 1,
0.5447283, -1.610121, 2.030646, 0, 0, 0, 1, 1,
0.5470803, -1.766855, 1.215476, 0, 0, 0, 1, 1,
0.5522002, -0.1343179, 1.117574, 0, 0, 0, 1, 1,
0.5527624, 0.4406914, 2.429852, 0, 0, 0, 1, 1,
0.5606082, -0.08492496, 0.1729889, 0, 0, 0, 1, 1,
0.5616263, 0.5791641, 1.281214, 0, 0, 0, 1, 1,
0.5656403, 1.244938, 0.4164643, 1, 1, 1, 1, 1,
0.5677072, -0.360824, 2.759458, 1, 1, 1, 1, 1,
0.5677929, -0.8305146, 2.10381, 1, 1, 1, 1, 1,
0.5715958, 1.126456, 0.352285, 1, 1, 1, 1, 1,
0.5717387, -1.675413, 2.628909, 1, 1, 1, 1, 1,
0.5726977, 0.418571, 0.7108126, 1, 1, 1, 1, 1,
0.5762544, 0.6951513, -0.1415115, 1, 1, 1, 1, 1,
0.5796214, 1.105929, 2.090444, 1, 1, 1, 1, 1,
0.5799723, 1.458884, -1.547247, 1, 1, 1, 1, 1,
0.5850707, 0.6138139, 0.6021541, 1, 1, 1, 1, 1,
0.5864798, -1.748258, 4.410108, 1, 1, 1, 1, 1,
0.5895438, 1.762471, 1.993559, 1, 1, 1, 1, 1,
0.5901813, 1.156866, 1.711092, 1, 1, 1, 1, 1,
0.5926521, 0.8540902, -0.362331, 1, 1, 1, 1, 1,
0.5940813, 0.205983, -0.2127487, 1, 1, 1, 1, 1,
0.5954366, 0.8490918, 0.3422344, 0, 0, 1, 1, 1,
0.6009166, -0.9065262, 3.23658, 1, 0, 0, 1, 1,
0.6025604, -0.7846958, 2.749702, 1, 0, 0, 1, 1,
0.6061938, -0.9453564, 3.221692, 1, 0, 0, 1, 1,
0.6063544, -1.247385, 0.3356718, 1, 0, 0, 1, 1,
0.6069305, 0.6644706, 0.6625933, 1, 0, 0, 1, 1,
0.6100242, -0.7712616, 1.313466, 0, 0, 0, 1, 1,
0.6104785, -1.845763, 2.656524, 0, 0, 0, 1, 1,
0.6111041, -0.2993441, 1.538584, 0, 0, 0, 1, 1,
0.6145535, -1.205078, 3.200594, 0, 0, 0, 1, 1,
0.6259215, -1.442631, 2.730886, 0, 0, 0, 1, 1,
0.6284004, -0.275331, 2.009074, 0, 0, 0, 1, 1,
0.6374071, -0.6642517, 2.274713, 0, 0, 0, 1, 1,
0.6445696, -0.8213701, 1.433142, 1, 1, 1, 1, 1,
0.6458988, -0.4287969, 2.527665, 1, 1, 1, 1, 1,
0.6472337, -1.33243, 2.722364, 1, 1, 1, 1, 1,
0.6495727, -1.693032, 4.689898, 1, 1, 1, 1, 1,
0.6553432, -1.32891, 2.242546, 1, 1, 1, 1, 1,
0.6584941, -0.6162578, 0.4364943, 1, 1, 1, 1, 1,
0.6633396, 1.15769, 0.2567844, 1, 1, 1, 1, 1,
0.6650138, -1.312353, 3.781118, 1, 1, 1, 1, 1,
0.6663533, 0.5013303, 0.1191802, 1, 1, 1, 1, 1,
0.6678146, -1.010195, 2.492813, 1, 1, 1, 1, 1,
0.6687267, 1.496109, 0.5227963, 1, 1, 1, 1, 1,
0.6817989, 1.484081, -0.4630578, 1, 1, 1, 1, 1,
0.6823424, 0.1070572, -0.8437276, 1, 1, 1, 1, 1,
0.6853312, -0.1821622, 0.7679169, 1, 1, 1, 1, 1,
0.6882342, -0.4281055, 2.009345, 1, 1, 1, 1, 1,
0.6895909, -1.663473, 2.304344, 0, 0, 1, 1, 1,
0.6897898, 0.9127781, 1.089204, 1, 0, 0, 1, 1,
0.6989498, 0.9567552, 1.596388, 1, 0, 0, 1, 1,
0.7008379, 0.9000747, 2.452831, 1, 0, 0, 1, 1,
0.70232, -0.7542408, 5.941217, 1, 0, 0, 1, 1,
0.7116541, 0.2767068, -0.4098414, 1, 0, 0, 1, 1,
0.7166734, -0.8242658, 4.274627, 0, 0, 0, 1, 1,
0.7220094, 1.111142, -0.02828803, 0, 0, 0, 1, 1,
0.7297106, -0.06219224, 2.638783, 0, 0, 0, 1, 1,
0.730736, -0.5891008, 3.57657, 0, 0, 0, 1, 1,
0.7356079, -0.7301091, 3.621532, 0, 0, 0, 1, 1,
0.737412, -0.01551138, 1.503464, 0, 0, 0, 1, 1,
0.7403617, -1.759947, 1.713493, 0, 0, 0, 1, 1,
0.7408278, 0.6373889, 1.738446, 1, 1, 1, 1, 1,
0.751958, 0.1387586, -0.2733088, 1, 1, 1, 1, 1,
0.7575977, -1.353848, 3.12625, 1, 1, 1, 1, 1,
0.7628346, 1.026862, 1.231361, 1, 1, 1, 1, 1,
0.765232, 1.328797, 1.0832, 1, 1, 1, 1, 1,
0.7698932, 0.2383335, 1.306211, 1, 1, 1, 1, 1,
0.7790762, 1.073415, 0.612547, 1, 1, 1, 1, 1,
0.7898356, -0.7675739, 2.361001, 1, 1, 1, 1, 1,
0.7911986, 0.9892615, -0.7075248, 1, 1, 1, 1, 1,
0.7916992, -0.9746372, 2.527949, 1, 1, 1, 1, 1,
0.7939168, -0.5930843, 3.074682, 1, 1, 1, 1, 1,
0.794925, 1.718784, 0.1060194, 1, 1, 1, 1, 1,
0.7963909, 0.1164431, -0.09141163, 1, 1, 1, 1, 1,
0.799859, 0.9727678, 1.38703, 1, 1, 1, 1, 1,
0.8008667, -0.03258118, 1.973994, 1, 1, 1, 1, 1,
0.802129, 0.5373355, 1.276566, 0, 0, 1, 1, 1,
0.8031679, 0.9739349, 0.560912, 1, 0, 0, 1, 1,
0.8032288, -0.7077432, 3.449047, 1, 0, 0, 1, 1,
0.8041602, 1.591044, 1.975284, 1, 0, 0, 1, 1,
0.8082827, 1.949154, 0.5251855, 1, 0, 0, 1, 1,
0.8128662, 0.007214583, 2.083678, 1, 0, 0, 1, 1,
0.8199265, -0.1741625, 2.505213, 0, 0, 0, 1, 1,
0.8241678, 0.1315486, 0.6818742, 0, 0, 0, 1, 1,
0.8259846, 0.384921, 2.422657, 0, 0, 0, 1, 1,
0.8288966, -0.8489038, 3.329913, 0, 0, 0, 1, 1,
0.8307517, -0.4215714, 0.8452516, 0, 0, 0, 1, 1,
0.8320637, 0.3672873, 0.2271876, 0, 0, 0, 1, 1,
0.8341435, 0.5480999, 1.041917, 0, 0, 0, 1, 1,
0.8361176, -0.5385243, 2.802825, 1, 1, 1, 1, 1,
0.8405413, 0.6104549, 0.5892122, 1, 1, 1, 1, 1,
0.8443228, 0.7494621, -0.3304066, 1, 1, 1, 1, 1,
0.844563, -1.141308, 1.496725, 1, 1, 1, 1, 1,
0.84472, 1.56532, 2.503311, 1, 1, 1, 1, 1,
0.8471754, 0.3494842, 0.3722941, 1, 1, 1, 1, 1,
0.8475137, -0.57719, 1.983898, 1, 1, 1, 1, 1,
0.8526433, -0.07665192, 1.408161, 1, 1, 1, 1, 1,
0.8572246, -0.08850402, 0.1557862, 1, 1, 1, 1, 1,
0.8656666, -1.728674, 2.82177, 1, 1, 1, 1, 1,
0.8731636, 0.9482923, 0.01199508, 1, 1, 1, 1, 1,
0.8748161, 2.01847, 0.7659183, 1, 1, 1, 1, 1,
0.8750572, -1.992764, 2.693145, 1, 1, 1, 1, 1,
0.8771132, -0.6429392, -0.6289953, 1, 1, 1, 1, 1,
0.8839, -1.827127, 1.551293, 1, 1, 1, 1, 1,
0.89042, 1.519081, 2.907264, 0, 0, 1, 1, 1,
0.8928238, 2.163125, 0.7980447, 1, 0, 0, 1, 1,
0.8971562, -0.2224344, 0.7053123, 1, 0, 0, 1, 1,
0.9126052, 0.5368621, 3.404474, 1, 0, 0, 1, 1,
0.9168535, 1.153167, 1.574798, 1, 0, 0, 1, 1,
0.9248287, 0.945211, 0.8752908, 1, 0, 0, 1, 1,
0.9255812, 0.5892265, 0.4785644, 0, 0, 0, 1, 1,
0.9370713, 1.344037, 0.5982655, 0, 0, 0, 1, 1,
0.9391066, -0.8990439, 2.926602, 0, 0, 0, 1, 1,
0.9403994, -0.3191022, 1.588526, 0, 0, 0, 1, 1,
0.9416076, 0.5831305, 3.104056, 0, 0, 0, 1, 1,
0.9502761, -1.040132, 2.248964, 0, 0, 0, 1, 1,
0.9518772, 1.611218, 0.193025, 0, 0, 0, 1, 1,
0.9542575, 0.7640244, 1.743678, 1, 1, 1, 1, 1,
0.9551817, 0.669444, 0.2495124, 1, 1, 1, 1, 1,
0.9562896, 0.1832984, 0.4761928, 1, 1, 1, 1, 1,
0.9593151, 1.145622, -1.550326, 1, 1, 1, 1, 1,
0.9621485, -1.608512, 4.439034, 1, 1, 1, 1, 1,
0.9669141, -0.5269464, 1.901454, 1, 1, 1, 1, 1,
0.971249, 0.4382543, 1.880413, 1, 1, 1, 1, 1,
0.9733211, 1.539455, 0.4320492, 1, 1, 1, 1, 1,
0.9757842, 1.563162, 0.1071596, 1, 1, 1, 1, 1,
0.9771829, 0.4324622, 0.1488542, 1, 1, 1, 1, 1,
0.9779032, -1.332357, 0.3834022, 1, 1, 1, 1, 1,
0.9889196, -1.028041, 2.17454, 1, 1, 1, 1, 1,
0.9896136, -1.522702, 5.077037, 1, 1, 1, 1, 1,
0.9942966, 0.1362191, 2.422233, 1, 1, 1, 1, 1,
0.9955996, 0.6273735, 1.19822, 1, 1, 1, 1, 1,
1.001359, 1.023033, -0.7696525, 0, 0, 1, 1, 1,
1.004809, -0.09518758, 3.718514, 1, 0, 0, 1, 1,
1.011883, 0.4250947, 1.401342, 1, 0, 0, 1, 1,
1.017311, 0.2359446, 2.048521, 1, 0, 0, 1, 1,
1.018287, 0.2766319, 0.282214, 1, 0, 0, 1, 1,
1.023297, -0.8247745, 0.6588015, 1, 0, 0, 1, 1,
1.023864, 0.223152, 3.847096, 0, 0, 0, 1, 1,
1.029983, 0.9964325, -0.5032629, 0, 0, 0, 1, 1,
1.032866, 1.08123, 1.403522, 0, 0, 0, 1, 1,
1.036535, 0.4744152, 1.797683, 0, 0, 0, 1, 1,
1.039358, -1.413562, 2.120632, 0, 0, 0, 1, 1,
1.041037, -1.404255, 2.508104, 0, 0, 0, 1, 1,
1.048813, -0.4978952, 3.386302, 0, 0, 0, 1, 1,
1.050817, -1.564582, 3.038697, 1, 1, 1, 1, 1,
1.051525, -0.3970683, 0.2269651, 1, 1, 1, 1, 1,
1.056614, 0.5674843, 0.4768656, 1, 1, 1, 1, 1,
1.057509, 0.6017072, -0.06594423, 1, 1, 1, 1, 1,
1.06933, -0.5198578, 0.5234627, 1, 1, 1, 1, 1,
1.071778, -0.3950508, 2.120835, 1, 1, 1, 1, 1,
1.08118, 0.5393358, 2.411777, 1, 1, 1, 1, 1,
1.093269, -0.6096573, 2.494245, 1, 1, 1, 1, 1,
1.098401, 0.4912956, 1.526568, 1, 1, 1, 1, 1,
1.098444, 0.2676771, 1.578158, 1, 1, 1, 1, 1,
1.110136, -0.9160085, 1.245178, 1, 1, 1, 1, 1,
1.110439, 0.1828779, 1.739826, 1, 1, 1, 1, 1,
1.111727, -0.4776607, 2.557835, 1, 1, 1, 1, 1,
1.117138, -0.00877832, -0.08309693, 1, 1, 1, 1, 1,
1.123037, 1.317202, 1.421277, 1, 1, 1, 1, 1,
1.123967, -0.7116005, 1.118562, 0, 0, 1, 1, 1,
1.124211, -0.6625522, 0.839202, 1, 0, 0, 1, 1,
1.129732, 1.4241, 1.391676, 1, 0, 0, 1, 1,
1.130871, -0.6253186, 2.768223, 1, 0, 0, 1, 1,
1.134043, -1.445234, 3.009316, 1, 0, 0, 1, 1,
1.134058, 0.7686075, 0.6944582, 1, 0, 0, 1, 1,
1.139921, -0.1302545, 1.730397, 0, 0, 0, 1, 1,
1.141869, -0.40773, 1.348719, 0, 0, 0, 1, 1,
1.14647, -0.2970725, 2.105541, 0, 0, 0, 1, 1,
1.147383, -0.3488871, 1.983974, 0, 0, 0, 1, 1,
1.150556, -1.274638, 3.34339, 0, 0, 0, 1, 1,
1.151604, -0.2970806, 0.9444436, 0, 0, 0, 1, 1,
1.153172, -0.7984145, 2.459996, 0, 0, 0, 1, 1,
1.155461, 1.001539, 0.9438685, 1, 1, 1, 1, 1,
1.159929, 1.668794, 1.170405, 1, 1, 1, 1, 1,
1.161698, 0.5450088, 0.1427476, 1, 1, 1, 1, 1,
1.162772, -0.5107824, 2.220084, 1, 1, 1, 1, 1,
1.165083, 1.05325, 1.609379, 1, 1, 1, 1, 1,
1.171418, 0.01730861, 0.6584058, 1, 1, 1, 1, 1,
1.177344, -0.647665, 4.38848, 1, 1, 1, 1, 1,
1.178522, -0.9691668, 3.115835, 1, 1, 1, 1, 1,
1.180797, -0.7952456, 3.780104, 1, 1, 1, 1, 1,
1.186219, -0.1061616, 1.071919, 1, 1, 1, 1, 1,
1.192279, -1.284667, 2.108997, 1, 1, 1, 1, 1,
1.192407, -0.008269475, 1.741259, 1, 1, 1, 1, 1,
1.193744, -0.4642179, 2.892228, 1, 1, 1, 1, 1,
1.201212, -0.8955961, 1.11959, 1, 1, 1, 1, 1,
1.212209, -0.5080814, 2.05134, 1, 1, 1, 1, 1,
1.216857, 0.6100934, 2.914708, 0, 0, 1, 1, 1,
1.218154, -0.2009097, 2.580164, 1, 0, 0, 1, 1,
1.222818, -1.695159, 2.735644, 1, 0, 0, 1, 1,
1.223874, -0.122933, 0.7602841, 1, 0, 0, 1, 1,
1.228867, -1.791469, 3.142914, 1, 0, 0, 1, 1,
1.232312, 0.335357, 1.780133, 1, 0, 0, 1, 1,
1.235097, -0.5361735, 0.3624387, 0, 0, 0, 1, 1,
1.239189, -0.5161901, 2.000485, 0, 0, 0, 1, 1,
1.250921, 0.08533549, 1.543011, 0, 0, 0, 1, 1,
1.266207, 2.244508, 0.3153169, 0, 0, 0, 1, 1,
1.27924, -0.2076232, 2.070176, 0, 0, 0, 1, 1,
1.282494, -0.04202733, 2.855031, 0, 0, 0, 1, 1,
1.300133, -0.2664928, 1.803554, 0, 0, 0, 1, 1,
1.302233, 0.2765582, 1.673014, 1, 1, 1, 1, 1,
1.303052, 0.3733786, 3.568501, 1, 1, 1, 1, 1,
1.304599, -0.4203207, 3.249983, 1, 1, 1, 1, 1,
1.307064, -0.1554646, 2.703105, 1, 1, 1, 1, 1,
1.30921, 0.5803012, 1.332113, 1, 1, 1, 1, 1,
1.316112, 1.388674, 2.051754, 1, 1, 1, 1, 1,
1.32033, -1.877548, 2.571917, 1, 1, 1, 1, 1,
1.323451, -1.006452, 2.325213, 1, 1, 1, 1, 1,
1.329495, 1.443668, 1.054631, 1, 1, 1, 1, 1,
1.333143, 1.323069, 0.1410343, 1, 1, 1, 1, 1,
1.33918, 0.632274, 1.205586, 1, 1, 1, 1, 1,
1.342698, -0.819225, 2.759941, 1, 1, 1, 1, 1,
1.347274, 1.16717, 1.427, 1, 1, 1, 1, 1,
1.349516, -0.6652626, 2.123594, 1, 1, 1, 1, 1,
1.351547, -0.4395025, 0.358679, 1, 1, 1, 1, 1,
1.377959, -1.658011, 2.781254, 0, 0, 1, 1, 1,
1.37799, -0.1347921, -0.1889018, 1, 0, 0, 1, 1,
1.38013, -0.2097099, 2.286544, 1, 0, 0, 1, 1,
1.382876, -0.9169438, 3.565468, 1, 0, 0, 1, 1,
1.392396, -0.960767, 3.842977, 1, 0, 0, 1, 1,
1.426281, 1.046441, 1.184265, 1, 0, 0, 1, 1,
1.436454, -0.7126653, 3.777373, 0, 0, 0, 1, 1,
1.465498, -0.2318916, 2.769129, 0, 0, 0, 1, 1,
1.475623, 0.4847955, 1.87751, 0, 0, 0, 1, 1,
1.491049, 1.626096, -0.234906, 0, 0, 0, 1, 1,
1.493553, -0.2533963, 0.7007599, 0, 0, 0, 1, 1,
1.499055, -0.4275768, 1.595754, 0, 0, 0, 1, 1,
1.506831, -0.2595488, 2.418894, 0, 0, 0, 1, 1,
1.530338, -0.3527462, 2.064314, 1, 1, 1, 1, 1,
1.531032, -1.293311, 2.221747, 1, 1, 1, 1, 1,
1.536837, 0.1656231, 2.613556, 1, 1, 1, 1, 1,
1.546351, -0.7034895, 1.277164, 1, 1, 1, 1, 1,
1.555888, 0.2131859, 1.244743, 1, 1, 1, 1, 1,
1.557757, -0.8642335, 1.629502, 1, 1, 1, 1, 1,
1.564928, -1.398661, 1.719598, 1, 1, 1, 1, 1,
1.566102, 0.6064032, -0.572535, 1, 1, 1, 1, 1,
1.56668, 0.6403899, 0.5760201, 1, 1, 1, 1, 1,
1.574074, -0.7700152, 3.133515, 1, 1, 1, 1, 1,
1.578693, -0.4009602, 2.728193, 1, 1, 1, 1, 1,
1.581889, 1.840411, 0.4085641, 1, 1, 1, 1, 1,
1.585629, -0.6952497, -0.2223624, 1, 1, 1, 1, 1,
1.600104, -0.5689828, 2.49731, 1, 1, 1, 1, 1,
1.600219, 1.380013, 0.6133616, 1, 1, 1, 1, 1,
1.60508, -0.6643731, 1.196813, 0, 0, 1, 1, 1,
1.611166, -0.6096618, 0.5386342, 1, 0, 0, 1, 1,
1.625487, 0.7457364, 1.058583, 1, 0, 0, 1, 1,
1.631109, 1.503788, 0.9820629, 1, 0, 0, 1, 1,
1.634451, 2.147304, 2.317791, 1, 0, 0, 1, 1,
1.647911, 0.6699984, 0.2473364, 1, 0, 0, 1, 1,
1.649195, 1.47231, 0.6261297, 0, 0, 0, 1, 1,
1.650651, -0.6014107, 2.431564, 0, 0, 0, 1, 1,
1.652395, -1.602195, 1.761264, 0, 0, 0, 1, 1,
1.678064, 2.072693, 0.4645413, 0, 0, 0, 1, 1,
1.69371, 0.3100421, 0.8348484, 0, 0, 0, 1, 1,
1.710762, 1.096977, 1.572809, 0, 0, 0, 1, 1,
1.736932, 0.04562929, 1.896447, 0, 0, 0, 1, 1,
1.741661, -0.6084604, 3.246092, 1, 1, 1, 1, 1,
1.748153, 0.1350753, 0.8589424, 1, 1, 1, 1, 1,
1.769529, -0.1447386, 0.181498, 1, 1, 1, 1, 1,
1.77282, 0.04674976, 2.688792, 1, 1, 1, 1, 1,
1.779633, -0.5375822, 1.389274, 1, 1, 1, 1, 1,
1.786326, -1.47914, 1.537271, 1, 1, 1, 1, 1,
1.84957, -0.6739266, 1.946738, 1, 1, 1, 1, 1,
1.858011, 0.3458096, 1.791054, 1, 1, 1, 1, 1,
1.871583, 0.03552569, 1.779329, 1, 1, 1, 1, 1,
1.873538, 0.3392334, 2.268005, 1, 1, 1, 1, 1,
1.896757, -0.8894125, 1.733177, 1, 1, 1, 1, 1,
1.901398, 0.85399, 0.7570186, 1, 1, 1, 1, 1,
1.904139, 1.133858, 0.7183182, 1, 1, 1, 1, 1,
1.905424, -0.5697809, 1.560688, 1, 1, 1, 1, 1,
1.912439, 2.68419, -0.7955302, 1, 1, 1, 1, 1,
2.01021, 0.3943087, 1.335229, 0, 0, 1, 1, 1,
2.024866, -0.8585691, 0.7541619, 1, 0, 0, 1, 1,
2.027373, 1.611123, 0.07906719, 1, 0, 0, 1, 1,
2.074323, 0.01119107, 1.74959, 1, 0, 0, 1, 1,
2.113926, 0.5740379, 3.097043, 1, 0, 0, 1, 1,
2.116429, 0.03020121, 1.580446, 1, 0, 0, 1, 1,
2.129925, 0.4931722, 1.632469, 0, 0, 0, 1, 1,
2.131202, 0.6020424, 0.04004436, 0, 0, 0, 1, 1,
2.170841, -0.7410004, 0.2033534, 0, 0, 0, 1, 1,
2.195049, -0.3273791, 2.005915, 0, 0, 0, 1, 1,
2.226782, 0.724326, 1.403759, 0, 0, 0, 1, 1,
2.257452, 0.3003851, 1.33101, 0, 0, 0, 1, 1,
2.321221, 1.075659, 1.707752, 0, 0, 0, 1, 1,
2.335, -0.1834588, 3.127929, 1, 1, 1, 1, 1,
2.335257, -1.172675, 1.217488, 1, 1, 1, 1, 1,
2.421197, 0.7430848, 4.042301, 1, 1, 1, 1, 1,
2.488039, -0.1399518, 0.5622657, 1, 1, 1, 1, 1,
2.599136, -0.7661629, 1.455674, 1, 1, 1, 1, 1,
2.656329, 0.1135614, 2.182769, 1, 1, 1, 1, 1,
3.196342, 0.523607, 1.559488, 1, 1, 1, 1, 1
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
var radius = 9.321221;
var distance = 32.74039;
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
mvMatrix.translate( -0.286253, -0.09156537, -0.4586396 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.74039);
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
