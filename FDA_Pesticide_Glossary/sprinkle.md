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
-3.069903, 1.152274, -2.219183, 1, 0, 0, 1,
-2.977459, -1.529263, -2.360884, 1, 0.007843138, 0, 1,
-2.687919, -0.1553756, -2.757747, 1, 0.01176471, 0, 1,
-2.655612, 0.5858483, -1.222405, 1, 0.01960784, 0, 1,
-2.579935, 0.4521389, -2.982459, 1, 0.02352941, 0, 1,
-2.545825, -1.806936, -2.783474, 1, 0.03137255, 0, 1,
-2.535512, -0.621136, -1.835565, 1, 0.03529412, 0, 1,
-2.432917, -0.3195279, -2.499243, 1, 0.04313726, 0, 1,
-2.307113, 0.04483048, -2.354639, 1, 0.04705882, 0, 1,
-2.251512, 0.7779756, 0.4710748, 1, 0.05490196, 0, 1,
-2.185164, -0.03679698, -1.890873, 1, 0.05882353, 0, 1,
-2.156788, 2.307359, -0.4013648, 1, 0.06666667, 0, 1,
-2.154149, -2.652041, -2.950964, 1, 0.07058824, 0, 1,
-2.128952, 3.470917, -0.3365428, 1, 0.07843138, 0, 1,
-2.069457, 0.6029647, 0.117216, 1, 0.08235294, 0, 1,
-2.05514, 1.390816, 1.456937, 1, 0.09019608, 0, 1,
-1.975886, -0.1363147, -0.04635203, 1, 0.09411765, 0, 1,
-1.974499, -0.570293, -1.424076, 1, 0.1019608, 0, 1,
-1.959242, 0.9789683, -1.06345, 1, 0.1098039, 0, 1,
-1.898004, 0.4031526, -3.715532, 1, 0.1137255, 0, 1,
-1.880825, -1.199755, -1.867974, 1, 0.1215686, 0, 1,
-1.876463, 0.6186631, -0.1114106, 1, 0.1254902, 0, 1,
-1.872588, -0.2468938, -2.329731, 1, 0.1333333, 0, 1,
-1.852035, 0.2384642, -0.5412506, 1, 0.1372549, 0, 1,
-1.848669, -0.6003959, -1.124128, 1, 0.145098, 0, 1,
-1.828217, 2.371061, -1.583838, 1, 0.1490196, 0, 1,
-1.825116, 0.1857016, -2.531058, 1, 0.1568628, 0, 1,
-1.814637, 1.21783, -1.845705, 1, 0.1607843, 0, 1,
-1.814327, 0.437024, 0.321791, 1, 0.1686275, 0, 1,
-1.809607, 0.5192974, -1.116851, 1, 0.172549, 0, 1,
-1.778752, -1.372061, -0.7583324, 1, 0.1803922, 0, 1,
-1.762602, 0.426886, -1.308559, 1, 0.1843137, 0, 1,
-1.762493, -0.9844177, -1.780269, 1, 0.1921569, 0, 1,
-1.757205, -0.595515, -2.1808, 1, 0.1960784, 0, 1,
-1.734418, -0.1937829, -1.480231, 1, 0.2039216, 0, 1,
-1.731759, -0.3716144, 0.145981, 1, 0.2117647, 0, 1,
-1.731547, 0.5733033, -0.5876821, 1, 0.2156863, 0, 1,
-1.72267, 0.0508372, -1.740159, 1, 0.2235294, 0, 1,
-1.717233, -1.629093, -2.870092, 1, 0.227451, 0, 1,
-1.713765, -0.4071061, -2.824447, 1, 0.2352941, 0, 1,
-1.713626, 2.494104, -1.072975, 1, 0.2392157, 0, 1,
-1.706179, 1.854004, 0.02718481, 1, 0.2470588, 0, 1,
-1.705879, -0.9335486, -2.132913, 1, 0.2509804, 0, 1,
-1.693568, -0.2346033, -1.346225, 1, 0.2588235, 0, 1,
-1.679932, 0.1649897, -2.204577, 1, 0.2627451, 0, 1,
-1.665269, -0.944992, -2.684427, 1, 0.2705882, 0, 1,
-1.663786, 1.111305, -0.1431527, 1, 0.2745098, 0, 1,
-1.655906, 0.04686916, -1.933099, 1, 0.282353, 0, 1,
-1.641472, -0.2368938, -1.804865, 1, 0.2862745, 0, 1,
-1.640475, -0.4405113, -0.006223951, 1, 0.2941177, 0, 1,
-1.632972, 0.2549677, -1.764411, 1, 0.3019608, 0, 1,
-1.62802, -0.4227064, -2.784183, 1, 0.3058824, 0, 1,
-1.617048, -0.07048493, -3.517189, 1, 0.3137255, 0, 1,
-1.61137, -1.58867, -1.21761, 1, 0.3176471, 0, 1,
-1.593561, -0.6185893, -1.383124, 1, 0.3254902, 0, 1,
-1.578493, 1.038066, -2.206248, 1, 0.3294118, 0, 1,
-1.569093, -0.02944916, -1.59904, 1, 0.3372549, 0, 1,
-1.568263, -1.151994, -2.798906, 1, 0.3411765, 0, 1,
-1.564301, 0.295548, 0.02115676, 1, 0.3490196, 0, 1,
-1.563047, 1.096599, -0.4030802, 1, 0.3529412, 0, 1,
-1.554518, 0.6759886, -2.365024, 1, 0.3607843, 0, 1,
-1.551983, 0.04108179, -0.3531198, 1, 0.3647059, 0, 1,
-1.539299, 0.7129835, -0.6854875, 1, 0.372549, 0, 1,
-1.536653, -1.056639, -0.8286577, 1, 0.3764706, 0, 1,
-1.534528, 0.928739, -0.5036597, 1, 0.3843137, 0, 1,
-1.531115, 0.5579818, 0.2585844, 1, 0.3882353, 0, 1,
-1.523457, 0.6545089, -2.751981, 1, 0.3960784, 0, 1,
-1.519528, 0.156557, -2.769815, 1, 0.4039216, 0, 1,
-1.509186, -0.182448, -1.417845, 1, 0.4078431, 0, 1,
-1.506504, 2.890135, -1.611751, 1, 0.4156863, 0, 1,
-1.490559, 0.5395153, -0.9787685, 1, 0.4196078, 0, 1,
-1.490146, -0.6124797, -3.060583, 1, 0.427451, 0, 1,
-1.487314, -0.1980712, -0.7115504, 1, 0.4313726, 0, 1,
-1.477788, -1.011578, -0.5487996, 1, 0.4392157, 0, 1,
-1.454176, -1.305254, -4.055767, 1, 0.4431373, 0, 1,
-1.44897, 0.4347485, 0.4001974, 1, 0.4509804, 0, 1,
-1.440397, 0.9310338, -1.154744, 1, 0.454902, 0, 1,
-1.440134, -1.222372, -1.916694, 1, 0.4627451, 0, 1,
-1.437908, 0.6104824, -0.6289735, 1, 0.4666667, 0, 1,
-1.431286, -1.067501, -2.739679, 1, 0.4745098, 0, 1,
-1.430817, -0.2228398, -3.079262, 1, 0.4784314, 0, 1,
-1.428823, -0.8569294, -0.4266835, 1, 0.4862745, 0, 1,
-1.427541, 0.3667824, -1.272431, 1, 0.4901961, 0, 1,
-1.422805, -1.741835, -4.26803, 1, 0.4980392, 0, 1,
-1.412749, -1.287992, -3.731611, 1, 0.5058824, 0, 1,
-1.397791, 0.3115408, -1.255559, 1, 0.509804, 0, 1,
-1.381712, -0.07814436, -0.7351044, 1, 0.5176471, 0, 1,
-1.381464, -1.175476, -0.2978804, 1, 0.5215687, 0, 1,
-1.373444, -0.7639176, -1.97371, 1, 0.5294118, 0, 1,
-1.364459, 0.9069518, -0.4531888, 1, 0.5333334, 0, 1,
-1.354779, 1.739887, 0.1924498, 1, 0.5411765, 0, 1,
-1.351373, 0.4834864, -0.7010688, 1, 0.5450981, 0, 1,
-1.347666, -0.1688824, -2.094298, 1, 0.5529412, 0, 1,
-1.340955, -0.1698797, -0.879417, 1, 0.5568628, 0, 1,
-1.336575, 0.8254879, -0.8299608, 1, 0.5647059, 0, 1,
-1.335441, 0.6461459, -0.02658511, 1, 0.5686275, 0, 1,
-1.334576, 1.489, -0.7635292, 1, 0.5764706, 0, 1,
-1.334457, -0.4877115, -2.62135, 1, 0.5803922, 0, 1,
-1.332789, -1.476177, -1.624016, 1, 0.5882353, 0, 1,
-1.332745, -0.5175199, -1.24332, 1, 0.5921569, 0, 1,
-1.312811, 1.012107, -0.3219187, 1, 0.6, 0, 1,
-1.305203, -0.8978551, -3.214214, 1, 0.6078432, 0, 1,
-1.304873, -0.6231664, -2.144376, 1, 0.6117647, 0, 1,
-1.302953, -0.02843561, -2.056419, 1, 0.6196079, 0, 1,
-1.302531, -0.09613764, -1.69553, 1, 0.6235294, 0, 1,
-1.299595, -1.299064, -0.5594258, 1, 0.6313726, 0, 1,
-1.299095, -0.6984473, -1.501287, 1, 0.6352941, 0, 1,
-1.298856, 1.602243, -0.0546767, 1, 0.6431373, 0, 1,
-1.296701, 0.1485872, -2.618538, 1, 0.6470588, 0, 1,
-1.289866, 0.2008669, -3.334428, 1, 0.654902, 0, 1,
-1.288984, -1.293558, -2.361368, 1, 0.6588235, 0, 1,
-1.284402, -0.6359267, -2.492892, 1, 0.6666667, 0, 1,
-1.273682, -0.3892476, -1.039917, 1, 0.6705883, 0, 1,
-1.268674, -0.04404687, 0.1378996, 1, 0.6784314, 0, 1,
-1.265112, -0.7564156, -2.416217, 1, 0.682353, 0, 1,
-1.255463, -0.2522681, -1.277063, 1, 0.6901961, 0, 1,
-1.253233, -0.4913166, -2.457567, 1, 0.6941177, 0, 1,
-1.239772, 1.45013, -1.384248, 1, 0.7019608, 0, 1,
-1.235472, -0.08136668, -0.6658567, 1, 0.7098039, 0, 1,
-1.229691, 0.7592473, -2.645167, 1, 0.7137255, 0, 1,
-1.229089, -0.5401229, -2.978189, 1, 0.7215686, 0, 1,
-1.225445, 0.07732538, 0.2142922, 1, 0.7254902, 0, 1,
-1.222275, -1.05763, -0.4344707, 1, 0.7333333, 0, 1,
-1.220315, -0.2414629, -1.832293, 1, 0.7372549, 0, 1,
-1.21532, -0.9937229, -3.013322, 1, 0.7450981, 0, 1,
-1.209574, -1.15808, -1.92764, 1, 0.7490196, 0, 1,
-1.199444, 1.0175, 0.06019556, 1, 0.7568628, 0, 1,
-1.198887, 0.5933924, -2.426661, 1, 0.7607843, 0, 1,
-1.193616, 1.865742, -1.000339, 1, 0.7686275, 0, 1,
-1.192668, 2.286841, -0.3166107, 1, 0.772549, 0, 1,
-1.192535, -0.6353486, -0.6865625, 1, 0.7803922, 0, 1,
-1.191888, 0.00553795, -1.342252, 1, 0.7843137, 0, 1,
-1.19074, -0.2906054, -3.656575, 1, 0.7921569, 0, 1,
-1.187338, 0.4041083, -0.08596637, 1, 0.7960784, 0, 1,
-1.187141, -0.4785181, -2.826803, 1, 0.8039216, 0, 1,
-1.182734, -0.03979487, -1.670979, 1, 0.8117647, 0, 1,
-1.181523, -0.8900329, -2.702107, 1, 0.8156863, 0, 1,
-1.169768, 0.1035587, -1.727661, 1, 0.8235294, 0, 1,
-1.149785, 0.785442, -0.2581524, 1, 0.827451, 0, 1,
-1.148041, 0.1802426, -1.437544, 1, 0.8352941, 0, 1,
-1.144785, 0.6133291, -0.7697852, 1, 0.8392157, 0, 1,
-1.144723, 1.146232, -0.1487054, 1, 0.8470588, 0, 1,
-1.130587, 1.25102, -1.308712, 1, 0.8509804, 0, 1,
-1.125409, -0.7415056, -1.350524, 1, 0.8588235, 0, 1,
-1.122138, -1.107224, -0.6060403, 1, 0.8627451, 0, 1,
-1.118569, -0.4563267, -2.495033, 1, 0.8705882, 0, 1,
-1.110544, -0.04315618, 0.1393109, 1, 0.8745098, 0, 1,
-1.108476, 1.590171, -1.327712, 1, 0.8823529, 0, 1,
-1.105512, 1.594625, -1.379187, 1, 0.8862745, 0, 1,
-1.099347, -0.317551, -1.774662, 1, 0.8941177, 0, 1,
-1.094345, 0.2156783, -1.821256, 1, 0.8980392, 0, 1,
-1.090545, 1.362632, -1.36583, 1, 0.9058824, 0, 1,
-1.0898, 0.5141875, -1.827582, 1, 0.9137255, 0, 1,
-1.07988, -1.103357, -2.236928, 1, 0.9176471, 0, 1,
-1.079243, -1.001556, -2.866133, 1, 0.9254902, 0, 1,
-1.077291, -0.7982633, -1.660983, 1, 0.9294118, 0, 1,
-1.07396, -1.270589, -2.645177, 1, 0.9372549, 0, 1,
-1.067025, -1.459565, -3.369302, 1, 0.9411765, 0, 1,
-1.058818, -0.8458995, -3.574134, 1, 0.9490196, 0, 1,
-1.057478, -1.095069, -4.311659, 1, 0.9529412, 0, 1,
-1.050627, 0.2884927, -1.990043, 1, 0.9607843, 0, 1,
-1.046113, 0.7509719, -0.4916745, 1, 0.9647059, 0, 1,
-1.042578, -1.027504, -2.214275, 1, 0.972549, 0, 1,
-1.042505, -1.186222, -2.427985, 1, 0.9764706, 0, 1,
-1.041907, 1.479868, -0.6287583, 1, 0.9843137, 0, 1,
-1.028388, -1.126701, -3.953443, 1, 0.9882353, 0, 1,
-1.026572, -0.5307637, 0.5623278, 1, 0.9960784, 0, 1,
-1.02243, 1.687737, -1.481085, 0.9960784, 1, 0, 1,
-1.017463, -0.5314952, -0.7575938, 0.9921569, 1, 0, 1,
-1.009055, 0.9058827, 0.7439368, 0.9843137, 1, 0, 1,
-0.9965589, -0.2735377, -0.8979824, 0.9803922, 1, 0, 1,
-0.9922836, 2.08791, -0.2353379, 0.972549, 1, 0, 1,
-0.9878404, -0.5517167, -3.147609, 0.9686275, 1, 0, 1,
-0.9846005, 0.9506859, -0.8047102, 0.9607843, 1, 0, 1,
-0.9816024, -2.368365, -2.621797, 0.9568627, 1, 0, 1,
-0.9795884, 0.9966639, -1.078997, 0.9490196, 1, 0, 1,
-0.9778399, -0.2210612, -1.325687, 0.945098, 1, 0, 1,
-0.9642436, -1.545231, -4.194904, 0.9372549, 1, 0, 1,
-0.9509506, 1.866332, 0.7384914, 0.9333333, 1, 0, 1,
-0.9491584, 1.269435, -1.16336, 0.9254902, 1, 0, 1,
-0.9478101, -0.6353599, -2.06256, 0.9215686, 1, 0, 1,
-0.9442189, 0.7222502, 0.4286037, 0.9137255, 1, 0, 1,
-0.9411304, 1.301967, -0.4883664, 0.9098039, 1, 0, 1,
-0.9394926, 0.1893171, -2.279051, 0.9019608, 1, 0, 1,
-0.9349943, -1.238888, -3.2893, 0.8941177, 1, 0, 1,
-0.9325771, -0.4690745, -3.678533, 0.8901961, 1, 0, 1,
-0.9273708, -1.860821, -2.897035, 0.8823529, 1, 0, 1,
-0.9250681, 1.509517, -0.08667229, 0.8784314, 1, 0, 1,
-0.9100584, 0.02831316, -2.181901, 0.8705882, 1, 0, 1,
-0.903387, -0.350052, -2.068329, 0.8666667, 1, 0, 1,
-0.9011142, 1.545817, -2.160465, 0.8588235, 1, 0, 1,
-0.8979505, -0.6400454, -1.940012, 0.854902, 1, 0, 1,
-0.8910956, -0.3118645, -3.44492, 0.8470588, 1, 0, 1,
-0.8901197, 0.05813716, -2.616236, 0.8431373, 1, 0, 1,
-0.8850809, 1.413352, 0.5857099, 0.8352941, 1, 0, 1,
-0.8825633, 0.7709606, -1.372681, 0.8313726, 1, 0, 1,
-0.8824617, 0.6552616, -0.4065308, 0.8235294, 1, 0, 1,
-0.8811717, -0.2378623, -1.959144, 0.8196079, 1, 0, 1,
-0.8809424, 1.997848, 0.7146447, 0.8117647, 1, 0, 1,
-0.8701231, 0.5947095, 0.1652075, 0.8078431, 1, 0, 1,
-0.8694957, 0.9511591, -2.635014, 0.8, 1, 0, 1,
-0.867143, 1.128426, -0.9265239, 0.7921569, 1, 0, 1,
-0.8665391, -0.741957, -3.855442, 0.7882353, 1, 0, 1,
-0.8655503, -0.1458065, -2.107734, 0.7803922, 1, 0, 1,
-0.8629928, 1.616574, -0.01974287, 0.7764706, 1, 0, 1,
-0.8607113, -0.6417372, -2.299777, 0.7686275, 1, 0, 1,
-0.8506458, 0.03186032, -1.821536, 0.7647059, 1, 0, 1,
-0.8494523, 0.04799498, -4.449268, 0.7568628, 1, 0, 1,
-0.846181, 1.12348, -1.216298, 0.7529412, 1, 0, 1,
-0.8454525, -0.1355264, -1.675988, 0.7450981, 1, 0, 1,
-0.843125, 0.2702239, -2.070125, 0.7411765, 1, 0, 1,
-0.8420492, -0.08157137, -1.141287, 0.7333333, 1, 0, 1,
-0.8419691, -1.019055, -2.99391, 0.7294118, 1, 0, 1,
-0.8408719, 0.75435, 1.247517, 0.7215686, 1, 0, 1,
-0.8375973, -1.000285, -3.640643, 0.7176471, 1, 0, 1,
-0.8364549, 1.09721, -1.039638, 0.7098039, 1, 0, 1,
-0.8157471, -0.07321753, -2.528957, 0.7058824, 1, 0, 1,
-0.8074859, -0.4499147, -2.072924, 0.6980392, 1, 0, 1,
-0.8003144, -0.8450376, -3.684606, 0.6901961, 1, 0, 1,
-0.7969684, -2.279256, -4.376519, 0.6862745, 1, 0, 1,
-0.7949615, 0.7798902, -0.7372876, 0.6784314, 1, 0, 1,
-0.7876614, 0.6474201, -1.298115, 0.6745098, 1, 0, 1,
-0.774253, -1.601074, -1.340697, 0.6666667, 1, 0, 1,
-0.7699357, -0.06834517, -2.794089, 0.6627451, 1, 0, 1,
-0.7663789, -0.4179006, -4.768422, 0.654902, 1, 0, 1,
-0.766143, -0.5583889, -2.351601, 0.6509804, 1, 0, 1,
-0.7651755, 0.300934, -0.2467927, 0.6431373, 1, 0, 1,
-0.7639101, 0.1503267, -1.568943, 0.6392157, 1, 0, 1,
-0.7610261, -0.6302857, -3.876198, 0.6313726, 1, 0, 1,
-0.7542875, 0.2230074, -1.508579, 0.627451, 1, 0, 1,
-0.7534059, -1.102589, -2.817496, 0.6196079, 1, 0, 1,
-0.7522116, 0.2989253, -1.832868, 0.6156863, 1, 0, 1,
-0.7521529, 1.327663, 0.9264684, 0.6078432, 1, 0, 1,
-0.7505751, 0.7830358, 1.801223, 0.6039216, 1, 0, 1,
-0.7390522, 0.2391923, 0.3254008, 0.5960785, 1, 0, 1,
-0.7374809, 0.9743288, 0.06263437, 0.5882353, 1, 0, 1,
-0.7367107, 1.642074, -1.216648, 0.5843138, 1, 0, 1,
-0.7365479, 0.3357695, -0.4694467, 0.5764706, 1, 0, 1,
-0.7365115, 0.5686774, -1.876373, 0.572549, 1, 0, 1,
-0.7354626, -1.467238, -3.114588, 0.5647059, 1, 0, 1,
-0.7343453, 1.317992, -0.1978688, 0.5607843, 1, 0, 1,
-0.7236753, 0.9016334, -0.6529883, 0.5529412, 1, 0, 1,
-0.7231117, 0.01133397, -0.8850498, 0.5490196, 1, 0, 1,
-0.7151453, 0.6121396, -0.3356617, 0.5411765, 1, 0, 1,
-0.7093353, 0.8366233, -2.678147, 0.5372549, 1, 0, 1,
-0.7091354, 1.177613, -0.6172403, 0.5294118, 1, 0, 1,
-0.707844, 0.9840553, 0.3157104, 0.5254902, 1, 0, 1,
-0.706672, 1.835521, -0.9957094, 0.5176471, 1, 0, 1,
-0.7042947, -0.03792329, -0.1149682, 0.5137255, 1, 0, 1,
-0.7033193, -0.9437587, -3.936835, 0.5058824, 1, 0, 1,
-0.7026737, -0.05957535, -2.624412, 0.5019608, 1, 0, 1,
-0.7025452, -0.4117489, -2.22197, 0.4941176, 1, 0, 1,
-0.69139, 0.8452306, -0.6849604, 0.4862745, 1, 0, 1,
-0.6859604, -0.7094831, -5.892095, 0.4823529, 1, 0, 1,
-0.6769767, 0.1309842, -0.08534188, 0.4745098, 1, 0, 1,
-0.6759034, -0.008278954, -1.397941, 0.4705882, 1, 0, 1,
-0.6729342, -0.5531772, -4.946706, 0.4627451, 1, 0, 1,
-0.6721174, -0.8936837, -2.547678, 0.4588235, 1, 0, 1,
-0.6666976, -1.028161, -3.382744, 0.4509804, 1, 0, 1,
-0.6597881, 0.5856064, 0.2783559, 0.4470588, 1, 0, 1,
-0.6579777, 0.7129294, -2.239066, 0.4392157, 1, 0, 1,
-0.6574997, -1.097034, -2.540564, 0.4352941, 1, 0, 1,
-0.6528391, 0.8118118, -1.412527, 0.427451, 1, 0, 1,
-0.6474651, -0.2269477, -0.13854, 0.4235294, 1, 0, 1,
-0.6468253, -1.125636, -2.562879, 0.4156863, 1, 0, 1,
-0.642368, -0.7681125, -0.6198531, 0.4117647, 1, 0, 1,
-0.6402995, -1.385706, -3.19654, 0.4039216, 1, 0, 1,
-0.6355244, 0.9300777, 1.016548, 0.3960784, 1, 0, 1,
-0.6353009, 0.6025315, -1.706542, 0.3921569, 1, 0, 1,
-0.6351911, 1.005861, -1.957623, 0.3843137, 1, 0, 1,
-0.6350087, -1.868773, -3.190974, 0.3803922, 1, 0, 1,
-0.6349248, 0.3916833, -0.1147396, 0.372549, 1, 0, 1,
-0.6333472, 0.04311458, -0.2447312, 0.3686275, 1, 0, 1,
-0.6301116, -0.4732653, -1.578503, 0.3607843, 1, 0, 1,
-0.6290658, 0.6829762, -1.813487, 0.3568628, 1, 0, 1,
-0.6199982, -0.041402, -1.226121, 0.3490196, 1, 0, 1,
-0.6192475, -0.8482941, -2.352741, 0.345098, 1, 0, 1,
-0.6160917, -0.6657852, -2.023081, 0.3372549, 1, 0, 1,
-0.6106262, -0.7154047, -2.209079, 0.3333333, 1, 0, 1,
-0.6067595, -0.4682955, -3.53047, 0.3254902, 1, 0, 1,
-0.605764, 0.4439939, -0.8821046, 0.3215686, 1, 0, 1,
-0.5977802, -0.1948989, -0.8264451, 0.3137255, 1, 0, 1,
-0.5963785, -0.417587, -1.568766, 0.3098039, 1, 0, 1,
-0.5954095, -1.884954, -3.590328, 0.3019608, 1, 0, 1,
-0.5804455, 1.400418, 0.4307454, 0.2941177, 1, 0, 1,
-0.5765579, 1.938203, -0.3101383, 0.2901961, 1, 0, 1,
-0.5695137, -0.4255414, -1.936474, 0.282353, 1, 0, 1,
-0.5670186, 2.225596, 0.9534495, 0.2784314, 1, 0, 1,
-0.5648278, 0.4393742, -0.5118312, 0.2705882, 1, 0, 1,
-0.5632225, -0.1508261, -3.058556, 0.2666667, 1, 0, 1,
-0.5630534, -1.042914, -3.688229, 0.2588235, 1, 0, 1,
-0.562646, -0.5612645, -3.103323, 0.254902, 1, 0, 1,
-0.5606053, 1.346388, 0.1827418, 0.2470588, 1, 0, 1,
-0.5576513, 1.073409, 0.08850258, 0.2431373, 1, 0, 1,
-0.5564951, -0.6054643, -3.034298, 0.2352941, 1, 0, 1,
-0.5557736, -1.790542, -3.127945, 0.2313726, 1, 0, 1,
-0.5552993, 1.750873, 0.2100928, 0.2235294, 1, 0, 1,
-0.5513293, -1.44824, -1.87864, 0.2196078, 1, 0, 1,
-0.5491219, 0.2724974, -1.321199, 0.2117647, 1, 0, 1,
-0.5469723, -1.318869, -2.301981, 0.2078431, 1, 0, 1,
-0.5459563, -1.671098, -3.570392, 0.2, 1, 0, 1,
-0.5438702, 0.2937806, -0.518109, 0.1921569, 1, 0, 1,
-0.5438504, 1.270784, 0.4635895, 0.1882353, 1, 0, 1,
-0.5302312, 1.300156, -0.8516581, 0.1803922, 1, 0, 1,
-0.5259788, 0.8171477, -0.1658068, 0.1764706, 1, 0, 1,
-0.5249084, 1.054953, -0.0985625, 0.1686275, 1, 0, 1,
-0.5173312, -1.503358, -2.408563, 0.1647059, 1, 0, 1,
-0.5167523, 0.4689867, -0.3479598, 0.1568628, 1, 0, 1,
-0.5098554, -0.1933765, -0.7032564, 0.1529412, 1, 0, 1,
-0.5081894, -1.0869, -2.875611, 0.145098, 1, 0, 1,
-0.5073236, 0.5718203, -1.141142, 0.1411765, 1, 0, 1,
-0.5053344, 0.05288861, -1.154893, 0.1333333, 1, 0, 1,
-0.5049429, -0.9148971, -2.372027, 0.1294118, 1, 0, 1,
-0.4944594, 0.4328704, 1.935302, 0.1215686, 1, 0, 1,
-0.4928737, -0.5197112, -3.672259, 0.1176471, 1, 0, 1,
-0.489559, -0.706282, -3.36413, 0.1098039, 1, 0, 1,
-0.4894835, 1.578157, -3.155703, 0.1058824, 1, 0, 1,
-0.4875219, -0.4898722, -1.930421, 0.09803922, 1, 0, 1,
-0.4854065, -0.4998692, -2.195326, 0.09019608, 1, 0, 1,
-0.4791959, 1.221077, 0.7854126, 0.08627451, 1, 0, 1,
-0.4783402, -0.635784, -2.538294, 0.07843138, 1, 0, 1,
-0.4776675, 0.2003424, 0.90372, 0.07450981, 1, 0, 1,
-0.4735273, -1.077435, -1.69296, 0.06666667, 1, 0, 1,
-0.4733099, 0.5125514, -0.2706833, 0.0627451, 1, 0, 1,
-0.473191, 1.530264, -1.013421, 0.05490196, 1, 0, 1,
-0.470018, 1.085607, 0.6633527, 0.05098039, 1, 0, 1,
-0.4663192, -0.6945022, -0.4889065, 0.04313726, 1, 0, 1,
-0.4601934, 0.05767931, -1.016474, 0.03921569, 1, 0, 1,
-0.4572272, 1.958598, 0.5462742, 0.03137255, 1, 0, 1,
-0.4564061, 2.217142, -0.8974788, 0.02745098, 1, 0, 1,
-0.4526818, -1.473262, -3.365265, 0.01960784, 1, 0, 1,
-0.4498444, -2.129472, -2.272673, 0.01568628, 1, 0, 1,
-0.4446967, -1.143237, -2.443404, 0.007843138, 1, 0, 1,
-0.4390567, -0.9003707, -4.608431, 0.003921569, 1, 0, 1,
-0.4352204, 0.7798115, -1.917753, 0, 1, 0.003921569, 1,
-0.4343633, -0.4071504, -3.276841, 0, 1, 0.01176471, 1,
-0.4341915, 0.4150355, -0.3750523, 0, 1, 0.01568628, 1,
-0.4290281, -0.4169745, -1.472781, 0, 1, 0.02352941, 1,
-0.4249287, 0.7659942, -1.041444, 0, 1, 0.02745098, 1,
-0.423199, -0.8632476, -2.302939, 0, 1, 0.03529412, 1,
-0.4230025, -0.006550357, -2.583388, 0, 1, 0.03921569, 1,
-0.4227734, -0.4527718, -0.3809922, 0, 1, 0.04705882, 1,
-0.4180861, -0.3152821, -0.4372353, 0, 1, 0.05098039, 1,
-0.4167305, 1.737666, -0.00499311, 0, 1, 0.05882353, 1,
-0.4149013, 0.05504134, -1.636001, 0, 1, 0.0627451, 1,
-0.4116696, 1.519675, 1.842741, 0, 1, 0.07058824, 1,
-0.4108539, -1.714741, -2.279299, 0, 1, 0.07450981, 1,
-0.4092273, -0.031756, -1.509176, 0, 1, 0.08235294, 1,
-0.4061994, -0.04991087, -1.006214, 0, 1, 0.08627451, 1,
-0.405555, -1.48229, -2.715158, 0, 1, 0.09411765, 1,
-0.4041323, 0.6809074, 0.6108568, 0, 1, 0.1019608, 1,
-0.3994577, 1.027961, -0.5186221, 0, 1, 0.1058824, 1,
-0.3989421, -0.6074864, -2.70941, 0, 1, 0.1137255, 1,
-0.3949541, 0.5978189, -1.135683, 0, 1, 0.1176471, 1,
-0.3949242, -0.5356517, -3.765238, 0, 1, 0.1254902, 1,
-0.3943568, -0.1541136, -0.8706278, 0, 1, 0.1294118, 1,
-0.3927367, 0.9986712, -1.371846, 0, 1, 0.1372549, 1,
-0.3927284, -1.362467, -2.173921, 0, 1, 0.1411765, 1,
-0.3856067, -0.4534936, -2.189344, 0, 1, 0.1490196, 1,
-0.3830899, -0.05255619, 0.01244481, 0, 1, 0.1529412, 1,
-0.3755425, 1.015813, -0.68929, 0, 1, 0.1607843, 1,
-0.3696577, 0.5747767, -0.7307409, 0, 1, 0.1647059, 1,
-0.3677484, 0.4441167, -0.7921957, 0, 1, 0.172549, 1,
-0.3650427, -0.8283554, -3.609, 0, 1, 0.1764706, 1,
-0.3595002, -0.8286596, -3.734877, 0, 1, 0.1843137, 1,
-0.3580939, 0.7500083, -0.4603031, 0, 1, 0.1882353, 1,
-0.3487736, -1.180878, -3.493849, 0, 1, 0.1960784, 1,
-0.3483666, -0.6351452, -3.668041, 0, 1, 0.2039216, 1,
-0.3454078, 0.1798637, -0.09877244, 0, 1, 0.2078431, 1,
-0.3451068, -0.3269815, -2.633122, 0, 1, 0.2156863, 1,
-0.3447849, -0.6733213, -3.696795, 0, 1, 0.2196078, 1,
-0.3444564, -1.153879, -0.9800935, 0, 1, 0.227451, 1,
-0.3434405, -0.4273596, -1.078772, 0, 1, 0.2313726, 1,
-0.3420511, -1.499326, -3.49292, 0, 1, 0.2392157, 1,
-0.3326276, 0.3520657, -0.5147149, 0, 1, 0.2431373, 1,
-0.3319703, 1.942238, 0.7894645, 0, 1, 0.2509804, 1,
-0.3280976, 1.35038, -1.923459, 0, 1, 0.254902, 1,
-0.3262618, -0.03453704, -2.473097, 0, 1, 0.2627451, 1,
-0.3242792, -0.2780219, -3.174571, 0, 1, 0.2666667, 1,
-0.3238408, 0.104597, -2.309767, 0, 1, 0.2745098, 1,
-0.3230376, -0.6571103, -1.202834, 0, 1, 0.2784314, 1,
-0.3204819, 0.5608743, -1.727447, 0, 1, 0.2862745, 1,
-0.3137144, 0.06122475, -1.24886, 0, 1, 0.2901961, 1,
-0.3123643, -0.4052572, -0.463867, 0, 1, 0.2980392, 1,
-0.3115711, 0.6500505, 0.7683834, 0, 1, 0.3058824, 1,
-0.3089379, -0.082426, -1.815176, 0, 1, 0.3098039, 1,
-0.3020168, 0.2852903, -1.714939, 0, 1, 0.3176471, 1,
-0.3009114, 0.2006242, -1.618356, 0, 1, 0.3215686, 1,
-0.29017, -1.306597, -2.327954, 0, 1, 0.3294118, 1,
-0.2896386, 0.1859151, -0.6673942, 0, 1, 0.3333333, 1,
-0.2802567, -0.4348519, -1.829922, 0, 1, 0.3411765, 1,
-0.2787963, 0.4996253, 0.1769792, 0, 1, 0.345098, 1,
-0.2743093, -0.0835126, -1.583564, 0, 1, 0.3529412, 1,
-0.2694594, 0.1152038, -2.003796, 0, 1, 0.3568628, 1,
-0.2681415, -1.552868, -2.666, 0, 1, 0.3647059, 1,
-0.2672935, 0.4919718, -0.065044, 0, 1, 0.3686275, 1,
-0.2665791, 0.9753752, -0.598474, 0, 1, 0.3764706, 1,
-0.2637387, 0.2633195, -0.3343339, 0, 1, 0.3803922, 1,
-0.2612712, -0.7830306, -2.519137, 0, 1, 0.3882353, 1,
-0.2597679, 0.3776731, -0.09038078, 0, 1, 0.3921569, 1,
-0.2593825, 0.6344177, -0.04537221, 0, 1, 0.4, 1,
-0.2528796, 2.278866, -0.5161834, 0, 1, 0.4078431, 1,
-0.2511763, 0.7898402, 1.406566, 0, 1, 0.4117647, 1,
-0.2468374, 0.03206535, -2.620991, 0, 1, 0.4196078, 1,
-0.243433, -0.1803907, -3.347591, 0, 1, 0.4235294, 1,
-0.2417828, -0.1317958, -2.747602, 0, 1, 0.4313726, 1,
-0.2398885, -0.83069, -2.31342, 0, 1, 0.4352941, 1,
-0.2376538, -0.04618811, -1.050889, 0, 1, 0.4431373, 1,
-0.2300807, -0.9889494, -2.008879, 0, 1, 0.4470588, 1,
-0.2299044, 0.5297845, -0.768575, 0, 1, 0.454902, 1,
-0.228572, -1.514172, -3.894809, 0, 1, 0.4588235, 1,
-0.2269513, 0.1494925, -1.371779, 0, 1, 0.4666667, 1,
-0.2257739, -0.1604832, -3.501541, 0, 1, 0.4705882, 1,
-0.2171581, 1.269507, 0.6059853, 0, 1, 0.4784314, 1,
-0.2149723, -0.8709954, -2.774545, 0, 1, 0.4823529, 1,
-0.2142441, 0.7053013, -0.1679245, 0, 1, 0.4901961, 1,
-0.2140696, -0.779719, -1.260647, 0, 1, 0.4941176, 1,
-0.213553, -0.7297353, -0.5993124, 0, 1, 0.5019608, 1,
-0.2103641, 1.611341, 0.288422, 0, 1, 0.509804, 1,
-0.2085889, -1.483558, -4.157191, 0, 1, 0.5137255, 1,
-0.2073494, 0.3376206, -1.207485, 0, 1, 0.5215687, 1,
-0.2066734, 0.3583938, -1.114994, 0, 1, 0.5254902, 1,
-0.2040022, -1.50477, -3.557841, 0, 1, 0.5333334, 1,
-0.2036729, -0.6979924, -4.993533, 0, 1, 0.5372549, 1,
-0.2025179, -2.600396, -3.979857, 0, 1, 0.5450981, 1,
-0.1973627, 2.203578, -1.466774, 0, 1, 0.5490196, 1,
-0.1972771, -0.4663158, -3.36627, 0, 1, 0.5568628, 1,
-0.194884, -1.507479, -3.105343, 0, 1, 0.5607843, 1,
-0.1914784, -0.2807636, -3.40454, 0, 1, 0.5686275, 1,
-0.1895532, -0.9113539, -3.990545, 0, 1, 0.572549, 1,
-0.1864812, -0.02438564, -0.6290855, 0, 1, 0.5803922, 1,
-0.184358, -0.7024482, -4.179176, 0, 1, 0.5843138, 1,
-0.1839201, -0.5182489, -1.832671, 0, 1, 0.5921569, 1,
-0.183818, -1.523601, -3.568769, 0, 1, 0.5960785, 1,
-0.1763399, 0.1388544, -1.081384, 0, 1, 0.6039216, 1,
-0.1725971, 1.527032, 0.4579539, 0, 1, 0.6117647, 1,
-0.1680188, 0.5014044, -0.5078994, 0, 1, 0.6156863, 1,
-0.1599479, 0.02108009, -0.7156301, 0, 1, 0.6235294, 1,
-0.1596529, 0.1557559, -1.019576, 0, 1, 0.627451, 1,
-0.1594744, -2.082996, -3.479623, 0, 1, 0.6352941, 1,
-0.1573832, 1.739485, -0.90896, 0, 1, 0.6392157, 1,
-0.1558204, 0.5478737, 0.767031, 0, 1, 0.6470588, 1,
-0.1545354, 0.5938841, 0.3543933, 0, 1, 0.6509804, 1,
-0.1536895, -0.2634052, -2.663562, 0, 1, 0.6588235, 1,
-0.1511692, -1.190322, -3.839769, 0, 1, 0.6627451, 1,
-0.1507374, 0.1901377, 0.9803389, 0, 1, 0.6705883, 1,
-0.1487438, -0.6238759, -3.5175, 0, 1, 0.6745098, 1,
-0.147518, 3.008694, -1.54405, 0, 1, 0.682353, 1,
-0.1408908, -0.1338002, -0.4196461, 0, 1, 0.6862745, 1,
-0.1394348, -1.058017, -1.660532, 0, 1, 0.6941177, 1,
-0.1391725, 1.440935, 0.8106422, 0, 1, 0.7019608, 1,
-0.1380903, 0.8846663, 0.2821333, 0, 1, 0.7058824, 1,
-0.1358763, 1.321451, 1.456723, 0, 1, 0.7137255, 1,
-0.1354571, -1.455222, -3.635863, 0, 1, 0.7176471, 1,
-0.1301821, -0.5964631, -2.625226, 0, 1, 0.7254902, 1,
-0.1133438, 0.4409968, -0.05775036, 0, 1, 0.7294118, 1,
-0.1048471, 0.4877252, 1.211611, 0, 1, 0.7372549, 1,
-0.1043578, -0.9095045, -2.664247, 0, 1, 0.7411765, 1,
-0.09887694, -2.156303, -2.973616, 0, 1, 0.7490196, 1,
-0.09066963, 0.3915232, -0.3172698, 0, 1, 0.7529412, 1,
-0.08704031, 0.6350344, 0.4774294, 0, 1, 0.7607843, 1,
-0.0851643, -0.172135, -2.07942, 0, 1, 0.7647059, 1,
-0.08500272, -1.239852, -4.953775, 0, 1, 0.772549, 1,
-0.08496839, 1.153065, -0.3661301, 0, 1, 0.7764706, 1,
-0.08351671, 0.4242047, 1.450153, 0, 1, 0.7843137, 1,
-0.08232518, -0.6235944, -3.131377, 0, 1, 0.7882353, 1,
-0.0805014, 1.472161, 0.09670506, 0, 1, 0.7960784, 1,
-0.07936582, 1.550701, -0.4788483, 0, 1, 0.8039216, 1,
-0.07875185, -0.3865941, -3.548131, 0, 1, 0.8078431, 1,
-0.0744205, 0.4866447, -2.099295, 0, 1, 0.8156863, 1,
-0.07157442, 0.1026195, -0.7259982, 0, 1, 0.8196079, 1,
-0.07090001, -0.6756886, -3.895069, 0, 1, 0.827451, 1,
-0.06610043, 1.324493, -1.14198, 0, 1, 0.8313726, 1,
-0.06532633, -0.8479953, -4.771258, 0, 1, 0.8392157, 1,
-0.06184697, -0.3292675, -4.443771, 0, 1, 0.8431373, 1,
-0.06010195, 1.751782, 0.5746919, 0, 1, 0.8509804, 1,
-0.05995068, -0.6172087, -3.246275, 0, 1, 0.854902, 1,
-0.05660355, -0.9204381, -3.487833, 0, 1, 0.8627451, 1,
-0.05468194, 1.166311, 0.7570929, 0, 1, 0.8666667, 1,
-0.05448482, -0.2353056, -4.031786, 0, 1, 0.8745098, 1,
-0.05068205, -1.969372, -3.46104, 0, 1, 0.8784314, 1,
-0.05060977, -1.941608, -2.073272, 0, 1, 0.8862745, 1,
-0.04904106, -1.446436, -3.29416, 0, 1, 0.8901961, 1,
-0.04467595, -1.964376, -3.353464, 0, 1, 0.8980392, 1,
-0.04244141, 0.1010639, -0.3559724, 0, 1, 0.9058824, 1,
-0.03352967, -0.4423556, -3.633542, 0, 1, 0.9098039, 1,
-0.02571877, -0.197314, -3.024827, 0, 1, 0.9176471, 1,
-0.01947994, -1.099821, -2.909297, 0, 1, 0.9215686, 1,
-0.01735699, -0.7746493, -3.436925, 0, 1, 0.9294118, 1,
-0.01667482, -1.146774, -2.594619, 0, 1, 0.9333333, 1,
-0.01340893, -0.7743232, -2.890962, 0, 1, 0.9411765, 1,
-0.01227284, -1.708827, -2.298404, 0, 1, 0.945098, 1,
-0.008774895, -1.40784, -2.395859, 0, 1, 0.9529412, 1,
-0.00710742, -0.3927905, -4.560743, 0, 1, 0.9568627, 1,
-0.007100608, 0.9032936, 0.4448484, 0, 1, 0.9647059, 1,
-0.006020333, 0.1494559, 0.3310429, 0, 1, 0.9686275, 1,
-0.0002608495, -0.5541583, -3.310925, 0, 1, 0.9764706, 1,
0.00345014, 0.190361, 0.7435219, 0, 1, 0.9803922, 1,
0.005772981, -0.4343778, 2.595188, 0, 1, 0.9882353, 1,
0.008054016, 2.156458, -0.9739341, 0, 1, 0.9921569, 1,
0.009923015, 0.4947612, -0.374444, 0, 1, 1, 1,
0.01176249, -2.120165, 3.95574, 0, 0.9921569, 1, 1,
0.01187924, 0.4708624, 0.9616004, 0, 0.9882353, 1, 1,
0.01197625, -1.229507, 2.609336, 0, 0.9803922, 1, 1,
0.02148599, -0.4747042, 4.591623, 0, 0.9764706, 1, 1,
0.02587798, -2.163078, 2.621613, 0, 0.9686275, 1, 1,
0.02613305, -0.009880353, 0.6380109, 0, 0.9647059, 1, 1,
0.02764386, -1.214538, 1.161903, 0, 0.9568627, 1, 1,
0.02799254, -0.06277925, 4.408524, 0, 0.9529412, 1, 1,
0.02852708, 0.5636129, -2.618423, 0, 0.945098, 1, 1,
0.03272297, -0.2846158, 2.799921, 0, 0.9411765, 1, 1,
0.03904189, 0.04329668, 1.599758, 0, 0.9333333, 1, 1,
0.0403054, 1.674605, 0.1608828, 0, 0.9294118, 1, 1,
0.04324885, 0.2142299, -0.09455359, 0, 0.9215686, 1, 1,
0.04343092, -0.01192324, 2.023615, 0, 0.9176471, 1, 1,
0.04505798, -0.5292569, 1.563276, 0, 0.9098039, 1, 1,
0.05167934, -0.5558485, 1.679934, 0, 0.9058824, 1, 1,
0.05176821, -0.2655777, 1.815374, 0, 0.8980392, 1, 1,
0.05411856, 0.09159882, 1.334146, 0, 0.8901961, 1, 1,
0.05549772, 2.401423, 1.822161, 0, 0.8862745, 1, 1,
0.05694792, -1.339252, 1.598276, 0, 0.8784314, 1, 1,
0.05738601, 0.4071018, -0.4803119, 0, 0.8745098, 1, 1,
0.05786604, 0.205491, -0.4733375, 0, 0.8666667, 1, 1,
0.05970841, 1.045555, -1.332563, 0, 0.8627451, 1, 1,
0.0614158, -0.2462506, 2.847571, 0, 0.854902, 1, 1,
0.0623007, -0.7716203, 3.139894, 0, 0.8509804, 1, 1,
0.06884364, -0.6958649, 2.978467, 0, 0.8431373, 1, 1,
0.07222098, 1.023894, 0.372025, 0, 0.8392157, 1, 1,
0.07262933, -1.11973, 4.136364, 0, 0.8313726, 1, 1,
0.07482446, 0.3168513, 0.381302, 0, 0.827451, 1, 1,
0.0778572, 0.1385386, 0.08291852, 0, 0.8196079, 1, 1,
0.07960045, -1.544628, 2.655571, 0, 0.8156863, 1, 1,
0.09096635, 0.6751865, 0.7274674, 0, 0.8078431, 1, 1,
0.09946591, -1.301188, 4.025107, 0, 0.8039216, 1, 1,
0.1004178, 0.067876, -0.3313867, 0, 0.7960784, 1, 1,
0.1051902, 0.271904, -0.4236247, 0, 0.7882353, 1, 1,
0.1066625, -0.5360053, 2.02797, 0, 0.7843137, 1, 1,
0.1068626, -0.8922524, 3.124175, 0, 0.7764706, 1, 1,
0.1069253, -0.2147956, 2.056084, 0, 0.772549, 1, 1,
0.10711, 1.202988, 0.4300836, 0, 0.7647059, 1, 1,
0.1111041, 0.6068763, 2.395116, 0, 0.7607843, 1, 1,
0.1141592, -0.471638, 2.138836, 0, 0.7529412, 1, 1,
0.1148413, 0.3701731, -2.439835, 0, 0.7490196, 1, 1,
0.1150529, 1.710955, -0.6763542, 0, 0.7411765, 1, 1,
0.1224788, -0.5352774, 1.699589, 0, 0.7372549, 1, 1,
0.1231131, 1.725735, 0.9995732, 0, 0.7294118, 1, 1,
0.128985, 0.218363, -1.080784, 0, 0.7254902, 1, 1,
0.1299924, -0.08557098, 1.482017, 0, 0.7176471, 1, 1,
0.1302115, 0.8275483, 0.92963, 0, 0.7137255, 1, 1,
0.1313935, 0.3911633, 0.5520427, 0, 0.7058824, 1, 1,
0.1319463, -1.085567, 3.22607, 0, 0.6980392, 1, 1,
0.1323587, 1.164792, 0.08868888, 0, 0.6941177, 1, 1,
0.1345166, -1.335339, 4.336392, 0, 0.6862745, 1, 1,
0.1364863, 0.9890822, 1.917253, 0, 0.682353, 1, 1,
0.1398351, -0.1231347, 3.957481, 0, 0.6745098, 1, 1,
0.1445247, 1.237218, -1.166742, 0, 0.6705883, 1, 1,
0.1524331, -0.3509864, 3.19909, 0, 0.6627451, 1, 1,
0.1617358, 0.828287, 0.4072653, 0, 0.6588235, 1, 1,
0.1679775, 1.169205, -0.5937854, 0, 0.6509804, 1, 1,
0.1686578, -0.1123978, 2.063515, 0, 0.6470588, 1, 1,
0.1693428, 0.6480077, -0.8467035, 0, 0.6392157, 1, 1,
0.1704347, -0.5679548, 3.450425, 0, 0.6352941, 1, 1,
0.1709418, -0.2038293, 2.382081, 0, 0.627451, 1, 1,
0.1771058, 0.2624288, 2.539941, 0, 0.6235294, 1, 1,
0.1777369, 0.6449766, 0.3911995, 0, 0.6156863, 1, 1,
0.1812609, 0.2047725, 0.6525019, 0, 0.6117647, 1, 1,
0.1850393, 0.1898903, 0.6117821, 0, 0.6039216, 1, 1,
0.1859263, 0.01239156, 1.922464, 0, 0.5960785, 1, 1,
0.1866176, 0.5183164, 1.237296, 0, 0.5921569, 1, 1,
0.1868278, 2.282334, -0.3996166, 0, 0.5843138, 1, 1,
0.1885548, -1.425473, 3.867102, 0, 0.5803922, 1, 1,
0.1979007, -1.565027, 1.889365, 0, 0.572549, 1, 1,
0.2021676, -0.2331175, 3.411581, 0, 0.5686275, 1, 1,
0.2025391, -1.601486, 3.473269, 0, 0.5607843, 1, 1,
0.2025755, -0.3232684, 5.488528, 0, 0.5568628, 1, 1,
0.2059262, -0.1803652, 1.200164, 0, 0.5490196, 1, 1,
0.207696, 0.7865342, 2.496465, 0, 0.5450981, 1, 1,
0.2098802, -0.2604988, -0.009628637, 0, 0.5372549, 1, 1,
0.2207158, -0.6517122, 2.504419, 0, 0.5333334, 1, 1,
0.2215758, 0.7239683, -1.238344, 0, 0.5254902, 1, 1,
0.2235325, 0.5219594, 2.196926, 0, 0.5215687, 1, 1,
0.2282042, -1.31798, 1.847342, 0, 0.5137255, 1, 1,
0.2307298, -0.4658283, 3.127793, 0, 0.509804, 1, 1,
0.2323871, -1.55106, 2.458303, 0, 0.5019608, 1, 1,
0.2327264, 0.4765339, 0.5686977, 0, 0.4941176, 1, 1,
0.2362526, 0.9059812, -0.401476, 0, 0.4901961, 1, 1,
0.2368318, -0.264142, 2.112156, 0, 0.4823529, 1, 1,
0.2370561, -0.185928, 0.9404588, 0, 0.4784314, 1, 1,
0.2448622, 1.035146, -0.3426426, 0, 0.4705882, 1, 1,
0.2450065, -0.5764288, 2.235283, 0, 0.4666667, 1, 1,
0.247009, -0.6883934, 1.521, 0, 0.4588235, 1, 1,
0.2489756, -0.5505518, 2.891742, 0, 0.454902, 1, 1,
0.2496057, 1.038884, 0.3396434, 0, 0.4470588, 1, 1,
0.2496169, -0.2179881, 3.757353, 0, 0.4431373, 1, 1,
0.2513409, 0.9934822, 0.5251489, 0, 0.4352941, 1, 1,
0.2541098, 2.153755, -0.6514395, 0, 0.4313726, 1, 1,
0.265951, 2.264651, -0.295259, 0, 0.4235294, 1, 1,
0.2663652, -1.994262, 2.70321, 0, 0.4196078, 1, 1,
0.2685322, -1.584535, 4.845689, 0, 0.4117647, 1, 1,
0.2754843, 0.1505125, 1.175049, 0, 0.4078431, 1, 1,
0.2769539, 0.3581188, -0.6647028, 0, 0.4, 1, 1,
0.2816498, -0.2980977, 1.533432, 0, 0.3921569, 1, 1,
0.2888728, 0.2968714, 1.394923, 0, 0.3882353, 1, 1,
0.2934811, -0.3117108, 2.166396, 0, 0.3803922, 1, 1,
0.2964928, 1.165462, -0.9125529, 0, 0.3764706, 1, 1,
0.297186, -0.922039, 1.016511, 0, 0.3686275, 1, 1,
0.2977434, 0.6962554, 0.8855863, 0, 0.3647059, 1, 1,
0.2987615, -0.2176502, 2.885934, 0, 0.3568628, 1, 1,
0.3007763, -1.618027, 2.372269, 0, 0.3529412, 1, 1,
0.3017748, 0.9177505, 1.779763, 0, 0.345098, 1, 1,
0.3032487, 0.6608638, 0.3959417, 0, 0.3411765, 1, 1,
0.3090283, -0.1691091, 1.223692, 0, 0.3333333, 1, 1,
0.3098308, -0.04244539, 0.01140046, 0, 0.3294118, 1, 1,
0.3099513, -0.1612938, 3.229656, 0, 0.3215686, 1, 1,
0.3126779, 0.958313, -1.736693, 0, 0.3176471, 1, 1,
0.3131202, 0.1261335, 0.9122044, 0, 0.3098039, 1, 1,
0.3134733, 1.250376, 1.323136, 0, 0.3058824, 1, 1,
0.3145495, -1.224426, 1.192394, 0, 0.2980392, 1, 1,
0.3156882, -0.5368266, 3.033077, 0, 0.2901961, 1, 1,
0.3172004, -0.3101246, 4.321221, 0, 0.2862745, 1, 1,
0.3216541, 0.6098095, -0.649295, 0, 0.2784314, 1, 1,
0.3259189, -0.1410619, 2.000954, 0, 0.2745098, 1, 1,
0.3347666, 1.165471, 0.7643756, 0, 0.2666667, 1, 1,
0.3354389, -3.079923, 2.189848, 0, 0.2627451, 1, 1,
0.3361583, 0.1713003, 1.387977, 0, 0.254902, 1, 1,
0.3363027, 0.8710794, 2.32453, 0, 0.2509804, 1, 1,
0.336684, -0.6578917, 3.248217, 0, 0.2431373, 1, 1,
0.3367519, -1.024483, 2.612389, 0, 0.2392157, 1, 1,
0.3385296, -1.493777, 3.410617, 0, 0.2313726, 1, 1,
0.3421093, 0.8905733, 0.3898689, 0, 0.227451, 1, 1,
0.3459746, 0.2444895, -0.01017204, 0, 0.2196078, 1, 1,
0.3460345, 0.6913939, 1.009046, 0, 0.2156863, 1, 1,
0.3463063, -0.08611917, 2.269699, 0, 0.2078431, 1, 1,
0.3514418, -0.006246006, 1.828961, 0, 0.2039216, 1, 1,
0.358883, 0.3462093, 2.619146, 0, 0.1960784, 1, 1,
0.3607249, 0.01428376, 2.086552, 0, 0.1882353, 1, 1,
0.3648875, -2.007015, 2.510514, 0, 0.1843137, 1, 1,
0.3659995, 1.395929, -2.060024, 0, 0.1764706, 1, 1,
0.367264, 0.247326, 2.457881, 0, 0.172549, 1, 1,
0.3729455, 0.6120226, -0.6365051, 0, 0.1647059, 1, 1,
0.3753098, -0.4426155, 2.035951, 0, 0.1607843, 1, 1,
0.3765449, -0.04969992, 3.465228, 0, 0.1529412, 1, 1,
0.3770978, -0.8408863, 1.63724, 0, 0.1490196, 1, 1,
0.3784284, 0.07234073, 0.2246065, 0, 0.1411765, 1, 1,
0.3806205, -0.7389077, 2.63568, 0, 0.1372549, 1, 1,
0.3874925, -0.9100814, 3.445689, 0, 0.1294118, 1, 1,
0.3983864, 0.9883115, -1.484865, 0, 0.1254902, 1, 1,
0.3994222, 0.9690723, 0.3669226, 0, 0.1176471, 1, 1,
0.4007296, 0.4367646, 0.558231, 0, 0.1137255, 1, 1,
0.400962, -0.01819779, 2.653742, 0, 0.1058824, 1, 1,
0.4061185, 0.6942626, 0.981343, 0, 0.09803922, 1, 1,
0.4064348, 0.5013613, 0.3586562, 0, 0.09411765, 1, 1,
0.4067799, -0.1091639, 1.217533, 0, 0.08627451, 1, 1,
0.4085869, 0.6749107, 1.161081, 0, 0.08235294, 1, 1,
0.408655, 0.4554179, 0.3988146, 0, 0.07450981, 1, 1,
0.4185675, -0.08440522, 0.4099586, 0, 0.07058824, 1, 1,
0.4198683, 1.416993, 1.764855, 0, 0.0627451, 1, 1,
0.420412, -1.055448, 1.997986, 0, 0.05882353, 1, 1,
0.4204404, 0.2036819, 1.407374, 0, 0.05098039, 1, 1,
0.4221094, 0.3876275, 0.1283162, 0, 0.04705882, 1, 1,
0.4242661, -0.4075736, 2.113499, 0, 0.03921569, 1, 1,
0.4248339, -1.066783, 2.263935, 0, 0.03529412, 1, 1,
0.4298599, 0.3543414, 0.00678442, 0, 0.02745098, 1, 1,
0.4303759, 1.640697, 0.5435595, 0, 0.02352941, 1, 1,
0.4316123, -2.196874, 2.015084, 0, 0.01568628, 1, 1,
0.4321374, 0.927282, 0.4258616, 0, 0.01176471, 1, 1,
0.4362571, 0.3349223, 1.892154, 0, 0.003921569, 1, 1,
0.4415527, -0.9134566, 2.067413, 0.003921569, 0, 1, 1,
0.4443824, -0.5870575, 2.340972, 0.007843138, 0, 1, 1,
0.4480269, -0.8588789, 1.244895, 0.01568628, 0, 1, 1,
0.4502469, -0.08567673, 2.388577, 0.01960784, 0, 1, 1,
0.4548469, -0.4506599, 2.214912, 0.02745098, 0, 1, 1,
0.4618873, -0.4613407, 3.003903, 0.03137255, 0, 1, 1,
0.4671434, 0.8911858, -0.5761157, 0.03921569, 0, 1, 1,
0.4782488, -0.3174993, 0.5310121, 0.04313726, 0, 1, 1,
0.4786606, 0.5600138, 1.647298, 0.05098039, 0, 1, 1,
0.4799511, 1.099123, -1.835112, 0.05490196, 0, 1, 1,
0.4868505, 0.2327065, 2.267264, 0.0627451, 0, 1, 1,
0.4923056, 1.135802, 0.4559238, 0.06666667, 0, 1, 1,
0.4975315, -1.325423, 3.414682, 0.07450981, 0, 1, 1,
0.5008723, -0.2992835, 2.212982, 0.07843138, 0, 1, 1,
0.5026399, 0.1702443, 1.45506, 0.08627451, 0, 1, 1,
0.5064536, -1.074385, 2.659602, 0.09019608, 0, 1, 1,
0.5105631, 0.5500427, 0.7718124, 0.09803922, 0, 1, 1,
0.5122867, 1.249134, 0.5074984, 0.1058824, 0, 1, 1,
0.5148182, -0.2130816, 0.247319, 0.1098039, 0, 1, 1,
0.5187095, -0.5100386, 3.267103, 0.1176471, 0, 1, 1,
0.5213868, 0.1750408, 1.018805, 0.1215686, 0, 1, 1,
0.5221117, -1.094928, 2.8042, 0.1294118, 0, 1, 1,
0.524291, -1.278515, 2.516321, 0.1333333, 0, 1, 1,
0.5259977, 1.222427, 1.442867, 0.1411765, 0, 1, 1,
0.5297994, -1.222504, 3.378749, 0.145098, 0, 1, 1,
0.5312642, 1.331672, -2.468441, 0.1529412, 0, 1, 1,
0.531288, -1.466581, 2.72342, 0.1568628, 0, 1, 1,
0.5335955, -1.377953, 3.698306, 0.1647059, 0, 1, 1,
0.5354819, -0.5865909, 2.758909, 0.1686275, 0, 1, 1,
0.5358909, -0.151074, 2.430296, 0.1764706, 0, 1, 1,
0.5366058, -0.8199072, 2.319462, 0.1803922, 0, 1, 1,
0.5382889, -0.05668436, 2.248767, 0.1882353, 0, 1, 1,
0.5410396, -0.04129159, 0.2050168, 0.1921569, 0, 1, 1,
0.5421985, -0.8917558, 3.095646, 0.2, 0, 1, 1,
0.548313, -0.01830547, 2.597334, 0.2078431, 0, 1, 1,
0.5529824, -0.6476796, 2.331721, 0.2117647, 0, 1, 1,
0.556473, -1.5165, 2.018749, 0.2196078, 0, 1, 1,
0.5613916, 1.093115, 0.5385448, 0.2235294, 0, 1, 1,
0.5674766, -0.2925059, 1.871343, 0.2313726, 0, 1, 1,
0.5693477, -1.717298, 4.459127, 0.2352941, 0, 1, 1,
0.569806, -0.2707497, 3.039528, 0.2431373, 0, 1, 1,
0.5700087, -0.6095777, 0.1888529, 0.2470588, 0, 1, 1,
0.5737624, 0.1494736, 1.165291, 0.254902, 0, 1, 1,
0.578198, -0.03278563, 2.535604, 0.2588235, 0, 1, 1,
0.5874572, 0.7872902, 1.291244, 0.2666667, 0, 1, 1,
0.5889161, -0.07520185, 1.084721, 0.2705882, 0, 1, 1,
0.5892436, -0.5532432, 1.275754, 0.2784314, 0, 1, 1,
0.5955483, -1.712814, 2.27902, 0.282353, 0, 1, 1,
0.5986449, -0.5778981, 0.6779944, 0.2901961, 0, 1, 1,
0.5988784, -0.2323792, 1.520186, 0.2941177, 0, 1, 1,
0.6073992, -0.4120514, 2.373637, 0.3019608, 0, 1, 1,
0.6106957, 0.6688724, 0.9080349, 0.3098039, 0, 1, 1,
0.6137305, 1.06194, 0.9641812, 0.3137255, 0, 1, 1,
0.6144784, 0.237079, 1.724346, 0.3215686, 0, 1, 1,
0.6172149, -0.4402049, 4.585674, 0.3254902, 0, 1, 1,
0.6196565, -0.799652, 3.119283, 0.3333333, 0, 1, 1,
0.6204414, 1.463516, -0.4177171, 0.3372549, 0, 1, 1,
0.6235372, -1.245767, 3.391265, 0.345098, 0, 1, 1,
0.6300772, 0.4724451, 1.60378, 0.3490196, 0, 1, 1,
0.6322029, 1.267467, 1.569323, 0.3568628, 0, 1, 1,
0.6324654, 2.379998, -0.3501555, 0.3607843, 0, 1, 1,
0.6325473, 0.5445957, 1.458377, 0.3686275, 0, 1, 1,
0.6326742, -1.583562, 2.866875, 0.372549, 0, 1, 1,
0.6346384, 0.5915726, 1.868139, 0.3803922, 0, 1, 1,
0.635176, 0.5652048, 0.6938397, 0.3843137, 0, 1, 1,
0.6374453, -0.4943025, 2.378398, 0.3921569, 0, 1, 1,
0.6379345, -0.2644135, 0.7043635, 0.3960784, 0, 1, 1,
0.6389616, 0.6527022, 0.5702612, 0.4039216, 0, 1, 1,
0.644267, -0.8673112, 1.653587, 0.4117647, 0, 1, 1,
0.6458879, 1.716141, 0.4711097, 0.4156863, 0, 1, 1,
0.6474879, -2.021403, 1.824563, 0.4235294, 0, 1, 1,
0.6491005, -0.5388106, 3.248295, 0.427451, 0, 1, 1,
0.6497468, -0.07821777, 2.3428, 0.4352941, 0, 1, 1,
0.6501819, 1.329311, 0.5096834, 0.4392157, 0, 1, 1,
0.6515341, 0.443593, 1.426158, 0.4470588, 0, 1, 1,
0.6555247, -0.1336354, 2.806954, 0.4509804, 0, 1, 1,
0.6581421, -2.256137, 4.044189, 0.4588235, 0, 1, 1,
0.6599215, -1.545384, 2.65712, 0.4627451, 0, 1, 1,
0.6599541, 0.08493073, 2.814138, 0.4705882, 0, 1, 1,
0.6674091, -1.64779, 3.042605, 0.4745098, 0, 1, 1,
0.6683065, -0.3944679, 1.900578, 0.4823529, 0, 1, 1,
0.671223, 0.9226797, 0.8971465, 0.4862745, 0, 1, 1,
0.6736068, -0.253601, -0.203086, 0.4941176, 0, 1, 1,
0.6809127, 0.1897501, 2.632545, 0.5019608, 0, 1, 1,
0.6873349, 1.378579, -0.7489237, 0.5058824, 0, 1, 1,
0.6959947, 0.4723548, 0.3136353, 0.5137255, 0, 1, 1,
0.6988444, -0.08515198, 2.887285, 0.5176471, 0, 1, 1,
0.7025397, 1.235437, 1.227359, 0.5254902, 0, 1, 1,
0.7163181, 1.901553, -0.2567557, 0.5294118, 0, 1, 1,
0.7168151, -0.2742125, 0.991579, 0.5372549, 0, 1, 1,
0.7176473, 0.4777504, -0.0596957, 0.5411765, 0, 1, 1,
0.7232565, 0.851423, 1.397303, 0.5490196, 0, 1, 1,
0.7242253, 0.06971637, 2.428209, 0.5529412, 0, 1, 1,
0.7278586, -0.9335918, 2.222206, 0.5607843, 0, 1, 1,
0.7317886, -0.8932082, 1.672397, 0.5647059, 0, 1, 1,
0.733249, 0.08220504, 1.817351, 0.572549, 0, 1, 1,
0.7354921, -1.67672, 1.837197, 0.5764706, 0, 1, 1,
0.7446918, 0.6660045, 1.179475, 0.5843138, 0, 1, 1,
0.7455274, 1.330626, 1.977633, 0.5882353, 0, 1, 1,
0.7457773, 1.572683, -0.4004441, 0.5960785, 0, 1, 1,
0.7506468, -0.6435497, 0.9395223, 0.6039216, 0, 1, 1,
0.75179, -0.8165538, 2.649495, 0.6078432, 0, 1, 1,
0.7532629, 0.1685773, 1.606871, 0.6156863, 0, 1, 1,
0.7667, -0.6542305, 1.742361, 0.6196079, 0, 1, 1,
0.7675948, -1.392427, 2.213631, 0.627451, 0, 1, 1,
0.7720469, 2.453611, 0.195962, 0.6313726, 0, 1, 1,
0.7721597, 1.229912, 0.2076295, 0.6392157, 0, 1, 1,
0.7782946, 0.3951219, 0.8619679, 0.6431373, 0, 1, 1,
0.7801003, 0.4044652, 2.64113, 0.6509804, 0, 1, 1,
0.7817252, 0.003007137, 1.146817, 0.654902, 0, 1, 1,
0.7842519, 0.4670592, 0.7949346, 0.6627451, 0, 1, 1,
0.7896435, -0.9427278, 2.743396, 0.6666667, 0, 1, 1,
0.8005062, 0.5207679, 1.576192, 0.6745098, 0, 1, 1,
0.8108525, -0.6783963, 3.517483, 0.6784314, 0, 1, 1,
0.8116795, 1.825625, 0.2215346, 0.6862745, 0, 1, 1,
0.812234, 0.9862662, 0.5070705, 0.6901961, 0, 1, 1,
0.8130421, -0.7286251, 3.012141, 0.6980392, 0, 1, 1,
0.8141316, 0.178662, 1.775444, 0.7058824, 0, 1, 1,
0.8203234, -0.5814337, 3.587594, 0.7098039, 0, 1, 1,
0.828074, -0.01483626, 0.7717617, 0.7176471, 0, 1, 1,
0.8299714, 1.131982, 0.9905062, 0.7215686, 0, 1, 1,
0.8299935, 1.840653, 0.4667492, 0.7294118, 0, 1, 1,
0.835312, 0.6437472, 0.03893205, 0.7333333, 0, 1, 1,
0.8357293, 1.44894, -0.03905385, 0.7411765, 0, 1, 1,
0.8362207, 0.6094846, 0.4344234, 0.7450981, 0, 1, 1,
0.8435265, 1.465444, 0.9374853, 0.7529412, 0, 1, 1,
0.8437755, -1.489213, 1.22419, 0.7568628, 0, 1, 1,
0.8515003, 0.6519771, -0.3209664, 0.7647059, 0, 1, 1,
0.8610752, -0.4867792, -0.260466, 0.7686275, 0, 1, 1,
0.8631155, 2.1641, 0.04078332, 0.7764706, 0, 1, 1,
0.8678228, -0.746362, 1.054053, 0.7803922, 0, 1, 1,
0.8685352, -1.477417, 2.476947, 0.7882353, 0, 1, 1,
0.8692226, 0.1127195, 3.295664, 0.7921569, 0, 1, 1,
0.8716694, -0.4515537, 2.839103, 0.8, 0, 1, 1,
0.8724652, 1.165857, 1.384622, 0.8078431, 0, 1, 1,
0.8745889, -0.1137868, 2.56171, 0.8117647, 0, 1, 1,
0.8789951, 1.091773, 0.7069172, 0.8196079, 0, 1, 1,
0.883279, 0.7676754, 1.921805, 0.8235294, 0, 1, 1,
0.884042, -0.5055714, 1.365698, 0.8313726, 0, 1, 1,
0.8858786, -0.1451463, 0.7224284, 0.8352941, 0, 1, 1,
0.8876938, -0.3651196, 3.651167, 0.8431373, 0, 1, 1,
0.8906816, 0.5483366, 1.288369, 0.8470588, 0, 1, 1,
0.8909493, 0.08094055, -0.009464245, 0.854902, 0, 1, 1,
0.8963906, -1.747443, 1.470108, 0.8588235, 0, 1, 1,
0.8986371, -0.4619587, 0.7155483, 0.8666667, 0, 1, 1,
0.8986615, 0.03608353, 1.055735, 0.8705882, 0, 1, 1,
0.9042795, 0.1260867, 1.466498, 0.8784314, 0, 1, 1,
0.906995, -0.1445863, 1.242902, 0.8823529, 0, 1, 1,
0.9167529, 0.8506756, 0.18486, 0.8901961, 0, 1, 1,
0.91838, -0.4338778, 1.515147, 0.8941177, 0, 1, 1,
0.9205357, 0.996936, 0.5342373, 0.9019608, 0, 1, 1,
0.9210743, -1.592281, 1.762663, 0.9098039, 0, 1, 1,
0.9214233, 1.412188, 0.02915395, 0.9137255, 0, 1, 1,
0.9250816, -0.896679, 1.659974, 0.9215686, 0, 1, 1,
0.9282116, 0.1408882, 2.159587, 0.9254902, 0, 1, 1,
0.9325116, -0.2055038, 0.2288661, 0.9333333, 0, 1, 1,
0.9327952, -1.04497, 3.894087, 0.9372549, 0, 1, 1,
0.9349401, -1.856126, 2.744379, 0.945098, 0, 1, 1,
0.935228, 0.9459895, 1.294542, 0.9490196, 0, 1, 1,
0.9356673, -0.3545578, -0.7381769, 0.9568627, 0, 1, 1,
0.9363679, -0.5907673, 2.557217, 0.9607843, 0, 1, 1,
0.9394299, -2.281366, 3.551476, 0.9686275, 0, 1, 1,
0.944032, -0.5526396, 3.584134, 0.972549, 0, 1, 1,
0.9440426, -0.8773078, 3.019383, 0.9803922, 0, 1, 1,
0.9475176, -1.698635, 2.68735, 0.9843137, 0, 1, 1,
0.9609097, -1.12375, 3.572965, 0.9921569, 0, 1, 1,
0.9619713, 0.1211831, 0.8584289, 0.9960784, 0, 1, 1,
0.9666314, 1.85466, 1.707122, 1, 0, 0.9960784, 1,
0.9684699, -0.5843559, 0.8102835, 1, 0, 0.9882353, 1,
0.972227, 0.04622881, 3.587275, 1, 0, 0.9843137, 1,
0.9729535, 0.4408865, 2.236311, 1, 0, 0.9764706, 1,
0.9770871, -2.305549, 2.074079, 1, 0, 0.972549, 1,
0.9818652, 0.1533313, 0.9422969, 1, 0, 0.9647059, 1,
0.9878064, 1.295183, 1.729796, 1, 0, 0.9607843, 1,
0.9889054, 0.2472021, 2.089805, 1, 0, 0.9529412, 1,
1.000654, 0.9887537, 0.5722226, 1, 0, 0.9490196, 1,
1.001952, 0.7142142, 1.164913, 1, 0, 0.9411765, 1,
1.003449, -0.2127178, 0.9531829, 1, 0, 0.9372549, 1,
1.004201, 0.409716, 0.7408901, 1, 0, 0.9294118, 1,
1.010842, -0.5462832, 2.901091, 1, 0, 0.9254902, 1,
1.012465, 0.2562891, 1.694147, 1, 0, 0.9176471, 1,
1.015095, 0.3068783, 0.9217575, 1, 0, 0.9137255, 1,
1.018923, -1.409828, 2.801462, 1, 0, 0.9058824, 1,
1.022108, 1.346945, 2.173679, 1, 0, 0.9019608, 1,
1.031788, -0.3026759, 1.552496, 1, 0, 0.8941177, 1,
1.033756, 1.334059, 0.9125084, 1, 0, 0.8862745, 1,
1.03524, 1.132839, 0.5151861, 1, 0, 0.8823529, 1,
1.042623, 1.346124, 1.030676, 1, 0, 0.8745098, 1,
1.04531, -0.1048192, 1.051988, 1, 0, 0.8705882, 1,
1.04972, -0.8191285, 1.36429, 1, 0, 0.8627451, 1,
1.053563, 1.417084, 0.5804278, 1, 0, 0.8588235, 1,
1.061947, -1.095914, 2.051411, 1, 0, 0.8509804, 1,
1.063783, 0.8042694, 0.5875559, 1, 0, 0.8470588, 1,
1.068599, -0.2386827, 2.624924, 1, 0, 0.8392157, 1,
1.070045, 0.8584986, 0.9256615, 1, 0, 0.8352941, 1,
1.081098, -1.604527, 1.644366, 1, 0, 0.827451, 1,
1.089568, -0.3027279, 2.467438, 1, 0, 0.8235294, 1,
1.089622, -0.1343389, 1.533244, 1, 0, 0.8156863, 1,
1.090074, -0.3995391, 1.712638, 1, 0, 0.8117647, 1,
1.090453, 1.946374, 1.873487, 1, 0, 0.8039216, 1,
1.126823, 1.848632, 1.450232, 1, 0, 0.7960784, 1,
1.128618, -0.6636209, 1.197701, 1, 0, 0.7921569, 1,
1.129631, 0.7924308, 1.219237, 1, 0, 0.7843137, 1,
1.133434, 1.193851, 0.8627388, 1, 0, 0.7803922, 1,
1.134461, -0.4030514, 1.221827, 1, 0, 0.772549, 1,
1.134564, -0.08818502, 1.373106, 1, 0, 0.7686275, 1,
1.142992, 0.2357265, 0.3922542, 1, 0, 0.7607843, 1,
1.149846, 0.9236555, 0.7337905, 1, 0, 0.7568628, 1,
1.154833, -0.3944752, 2.516216, 1, 0, 0.7490196, 1,
1.155245, -0.4405798, 0.1262705, 1, 0, 0.7450981, 1,
1.172059, -1.886139, 1.953624, 1, 0, 0.7372549, 1,
1.183228, 0.3557638, 0.7223104, 1, 0, 0.7333333, 1,
1.186549, 0.6264094, 0.3116381, 1, 0, 0.7254902, 1,
1.186666, -0.7350271, 2.345819, 1, 0, 0.7215686, 1,
1.190663, -0.1241511, 1.763872, 1, 0, 0.7137255, 1,
1.197023, -1.06736, 3.169229, 1, 0, 0.7098039, 1,
1.198545, -0.5566747, 3.787743, 1, 0, 0.7019608, 1,
1.201426, 0.2891613, 2.913346, 1, 0, 0.6941177, 1,
1.204065, -0.5578856, 0.4744529, 1, 0, 0.6901961, 1,
1.209691, 0.05540374, 3.635775, 1, 0, 0.682353, 1,
1.214583, -0.9358484, 1.62664, 1, 0, 0.6784314, 1,
1.21909, -0.4540259, 1.772468, 1, 0, 0.6705883, 1,
1.222139, 0.4755914, 1.732745, 1, 0, 0.6666667, 1,
1.225773, 0.9544229, 1.118838, 1, 0, 0.6588235, 1,
1.226039, -1.637933, 2.60513, 1, 0, 0.654902, 1,
1.236241, 0.6975443, 1.892277, 1, 0, 0.6470588, 1,
1.245268, 0.5744719, 0.2536005, 1, 0, 0.6431373, 1,
1.249273, -0.1154429, 1.477, 1, 0, 0.6352941, 1,
1.26414, 0.06590837, 0.7765666, 1, 0, 0.6313726, 1,
1.264872, -1.093485, 2.541034, 1, 0, 0.6235294, 1,
1.266691, -0.04798574, 0.0788043, 1, 0, 0.6196079, 1,
1.267723, -0.8707061, 2.372769, 1, 0, 0.6117647, 1,
1.274607, -0.2232958, 0.9599708, 1, 0, 0.6078432, 1,
1.279616, 0.4666066, -0.1198109, 1, 0, 0.6, 1,
1.286544, 0.854074, 0.8323571, 1, 0, 0.5921569, 1,
1.286754, -0.02402438, 0.6856023, 1, 0, 0.5882353, 1,
1.287359, -1.241743, 2.37516, 1, 0, 0.5803922, 1,
1.295859, 0.3752176, 0.5580308, 1, 0, 0.5764706, 1,
1.297282, -0.9133927, 2.624609, 1, 0, 0.5686275, 1,
1.299793, 0.4247629, 1.867356, 1, 0, 0.5647059, 1,
1.304328, -1.940127, 1.734168, 1, 0, 0.5568628, 1,
1.307119, -1.098244, 0.856622, 1, 0, 0.5529412, 1,
1.308271, 0.2417728, -0.3653444, 1, 0, 0.5450981, 1,
1.308807, 0.01722736, 1.334349, 1, 0, 0.5411765, 1,
1.310902, 0.9523091, 0.4939882, 1, 0, 0.5333334, 1,
1.31234, 0.1665438, 1.655034, 1, 0, 0.5294118, 1,
1.317121, 0.6898205, 0.4621783, 1, 0, 0.5215687, 1,
1.317381, -0.2886975, 3.224662, 1, 0, 0.5176471, 1,
1.323239, -0.7868541, 2.40029, 1, 0, 0.509804, 1,
1.337781, 0.2940479, 1.005021, 1, 0, 0.5058824, 1,
1.343531, 1.124291, 1.800311, 1, 0, 0.4980392, 1,
1.34566, -1.480453, 3.196811, 1, 0, 0.4901961, 1,
1.354475, 0.1730711, 1.608914, 1, 0, 0.4862745, 1,
1.367823, -0.897286, 0.4142127, 1, 0, 0.4784314, 1,
1.368703, 0.3563794, 1.4488, 1, 0, 0.4745098, 1,
1.385556, -0.8922165, 1.000504, 1, 0, 0.4666667, 1,
1.39056, 0.3120111, 2.074561, 1, 0, 0.4627451, 1,
1.403779, -1.365255, 2.279581, 1, 0, 0.454902, 1,
1.413071, -0.3035676, 1.739906, 1, 0, 0.4509804, 1,
1.442526, 1.353809, 0.2156777, 1, 0, 0.4431373, 1,
1.443851, 0.5850897, 2.827711, 1, 0, 0.4392157, 1,
1.444857, 0.4532394, -0.05577036, 1, 0, 0.4313726, 1,
1.445185, 1.196102, 1.373764, 1, 0, 0.427451, 1,
1.445995, 0.2629878, 0.518836, 1, 0, 0.4196078, 1,
1.449033, -0.8437513, 2.061577, 1, 0, 0.4156863, 1,
1.449381, -0.4003079, 4.044141, 1, 0, 0.4078431, 1,
1.461782, -0.6131423, 3.233629, 1, 0, 0.4039216, 1,
1.463469, -1.184789, 1.047915, 1, 0, 0.3960784, 1,
1.470495, -0.2972422, 2.477954, 1, 0, 0.3882353, 1,
1.479068, 0.6119047, 2.801088, 1, 0, 0.3843137, 1,
1.479312, -0.131386, 2.930331, 1, 0, 0.3764706, 1,
1.479819, -0.1441967, 1.139533, 1, 0, 0.372549, 1,
1.488886, -1.335745, 0.9708582, 1, 0, 0.3647059, 1,
1.498728, 1.200653, 0.1085151, 1, 0, 0.3607843, 1,
1.505556, -0.7141206, 2.57006, 1, 0, 0.3529412, 1,
1.514286, 0.4696868, -1.925483, 1, 0, 0.3490196, 1,
1.515689, -1.100773, 2.219334, 1, 0, 0.3411765, 1,
1.516176, -0.2815927, 0.5190813, 1, 0, 0.3372549, 1,
1.530983, -0.5391004, 2.393127, 1, 0, 0.3294118, 1,
1.543054, -2.098346, 2.712266, 1, 0, 0.3254902, 1,
1.547093, -1.601512, 4.606167, 1, 0, 0.3176471, 1,
1.556502, -0.2067182, 1.231188, 1, 0, 0.3137255, 1,
1.565657, -0.2523618, 1.420023, 1, 0, 0.3058824, 1,
1.567009, 0.59386, -0.597491, 1, 0, 0.2980392, 1,
1.595899, -1.372784, 1.230204, 1, 0, 0.2941177, 1,
1.601797, -1.735765, 3.880919, 1, 0, 0.2862745, 1,
1.60955, 0.9647992, -0.547648, 1, 0, 0.282353, 1,
1.609934, 1.088947, 2.501547, 1, 0, 0.2745098, 1,
1.611166, 0.5492629, 1.495809, 1, 0, 0.2705882, 1,
1.611398, 0.355391, -0.3857773, 1, 0, 0.2627451, 1,
1.656386, 0.2580687, 1.439126, 1, 0, 0.2588235, 1,
1.656654, -2.021939, 2.523628, 1, 0, 0.2509804, 1,
1.691613, 0.1319469, 1.163879, 1, 0, 0.2470588, 1,
1.705071, 0.05684596, 2.379803, 1, 0, 0.2392157, 1,
1.709158, -0.08028725, 1.638524, 1, 0, 0.2352941, 1,
1.711882, -0.6307405, 1.708547, 1, 0, 0.227451, 1,
1.723421, -0.9506229, 3.830397, 1, 0, 0.2235294, 1,
1.731865, 0.4621108, 2.5588, 1, 0, 0.2156863, 1,
1.748643, -0.04071889, 1.895325, 1, 0, 0.2117647, 1,
1.763103, 1.935901, 1.226359, 1, 0, 0.2039216, 1,
1.767518, 1.251373, 1.488556, 1, 0, 0.1960784, 1,
1.776739, 0.2706808, 0.2484004, 1, 0, 0.1921569, 1,
1.788278, 0.3031098, 2.053844, 1, 0, 0.1843137, 1,
1.796712, 0.259914, 2.513983, 1, 0, 0.1803922, 1,
1.811509, -1.735787, 2.662361, 1, 0, 0.172549, 1,
1.82112, 0.2857362, 0.6157165, 1, 0, 0.1686275, 1,
1.82963, 2.968407, 1.310074, 1, 0, 0.1607843, 1,
1.846483, -0.4730715, 2.309101, 1, 0, 0.1568628, 1,
1.848468, 1.006937, 2.301653, 1, 0, 0.1490196, 1,
1.879375, 0.1381663, 1.767758, 1, 0, 0.145098, 1,
1.880508, 3.795464, -0.3385991, 1, 0, 0.1372549, 1,
1.918516, -0.0169876, 3.646875, 1, 0, 0.1333333, 1,
1.930155, 0.5543839, 1.03915, 1, 0, 0.1254902, 1,
1.975662, 0.3703466, 1.266759, 1, 0, 0.1215686, 1,
1.986178, -0.3511156, 1.18801, 1, 0, 0.1137255, 1,
2.028501, -0.2340267, 2.214236, 1, 0, 0.1098039, 1,
2.042882, -1.784823, 2.076923, 1, 0, 0.1019608, 1,
2.050187, -0.6806017, 3.77057, 1, 0, 0.09411765, 1,
2.052595, 0.1155767, 0.9584225, 1, 0, 0.09019608, 1,
2.092172, -0.1308752, 2.042186, 1, 0, 0.08235294, 1,
2.125565, 0.3718413, 2.228546, 1, 0, 0.07843138, 1,
2.134376, -1.189456, 2.976846, 1, 0, 0.07058824, 1,
2.155265, 0.5810562, -0.006207224, 1, 0, 0.06666667, 1,
2.191256, -1.719422, 1.209187, 1, 0, 0.05882353, 1,
2.226174, 1.683905, 0.4390959, 1, 0, 0.05490196, 1,
2.256312, -0.9420492, 2.672015, 1, 0, 0.04705882, 1,
2.281762, 0.3592934, -1.859172, 1, 0, 0.04313726, 1,
2.316959, -2.038909, 2.168784, 1, 0, 0.03529412, 1,
2.54976, -1.707532, 1.976595, 1, 0, 0.03137255, 1,
2.659255, 0.9147966, 1.410324, 1, 0, 0.02352941, 1,
2.849474, -0.08862717, 1.312846, 1, 0, 0.01960784, 1,
3.103964, 0.1172868, 0.8152447, 1, 0, 0.01176471, 1,
3.29722, 1.742446, 0.9661074, 1, 0, 0.007843138, 1
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
0.1136584, -4.245301, -7.821111, 0, -0.5, 0.5, 0.5,
0.1136584, -4.245301, -7.821111, 1, -0.5, 0.5, 0.5,
0.1136584, -4.245301, -7.821111, 1, 1.5, 0.5, 0.5,
0.1136584, -4.245301, -7.821111, 0, 1.5, 0.5, 0.5
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
-4.14913, 0.3577706, -7.821111, 0, -0.5, 0.5, 0.5,
-4.14913, 0.3577706, -7.821111, 1, -0.5, 0.5, 0.5,
-4.14913, 0.3577706, -7.821111, 1, 1.5, 0.5, 0.5,
-4.14913, 0.3577706, -7.821111, 0, 1.5, 0.5, 0.5
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
-4.14913, -4.245301, -0.2017834, 0, -0.5, 0.5, 0.5,
-4.14913, -4.245301, -0.2017834, 1, -0.5, 0.5, 0.5,
-4.14913, -4.245301, -0.2017834, 1, 1.5, 0.5, 0.5,
-4.14913, -4.245301, -0.2017834, 0, 1.5, 0.5, 0.5
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
-3, -3.183054, -6.062804,
3, -3.183054, -6.062804,
-3, -3.183054, -6.062804,
-3, -3.360095, -6.355855,
-2, -3.183054, -6.062804,
-2, -3.360095, -6.355855,
-1, -3.183054, -6.062804,
-1, -3.360095, -6.355855,
0, -3.183054, -6.062804,
0, -3.360095, -6.355855,
1, -3.183054, -6.062804,
1, -3.360095, -6.355855,
2, -3.183054, -6.062804,
2, -3.360095, -6.355855,
3, -3.183054, -6.062804,
3, -3.360095, -6.355855
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
-3, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
-3, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
-3, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
-3, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
-2, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
-2, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
-2, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
-2, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
-1, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
-1, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
-1, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
-1, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
0, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
0, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
0, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
0, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
1, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
1, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
1, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
1, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
2, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
2, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
2, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
2, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5,
3, -3.714178, -6.941957, 0, -0.5, 0.5, 0.5,
3, -3.714178, -6.941957, 1, -0.5, 0.5, 0.5,
3, -3.714178, -6.941957, 1, 1.5, 0.5, 0.5,
3, -3.714178, -6.941957, 0, 1.5, 0.5, 0.5
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
-3.16541, -3, -6.062804,
-3.16541, 3, -6.062804,
-3.16541, -3, -6.062804,
-3.329363, -3, -6.355855,
-3.16541, -2, -6.062804,
-3.329363, -2, -6.355855,
-3.16541, -1, -6.062804,
-3.329363, -1, -6.355855,
-3.16541, 0, -6.062804,
-3.329363, 0, -6.355855,
-3.16541, 1, -6.062804,
-3.329363, 1, -6.355855,
-3.16541, 2, -6.062804,
-3.329363, 2, -6.355855,
-3.16541, 3, -6.062804,
-3.329363, 3, -6.355855
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
-3.65727, -3, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, -3, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, -3, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, -3, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, -2, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, -2, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, -2, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, -2, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, -1, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, -1, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, -1, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, -1, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, 0, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, 0, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, 0, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, 0, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, 1, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, 1, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, 1, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, 1, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, 2, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, 2, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, 2, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, 2, -6.941957, 0, 1.5, 0.5, 0.5,
-3.65727, 3, -6.941957, 0, -0.5, 0.5, 0.5,
-3.65727, 3, -6.941957, 1, -0.5, 0.5, 0.5,
-3.65727, 3, -6.941957, 1, 1.5, 0.5, 0.5,
-3.65727, 3, -6.941957, 0, 1.5, 0.5, 0.5
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
-3.16541, -3.183054, -4,
-3.16541, -3.183054, 4,
-3.16541, -3.183054, -4,
-3.329363, -3.360095, -4,
-3.16541, -3.183054, -2,
-3.329363, -3.360095, -2,
-3.16541, -3.183054, 0,
-3.329363, -3.360095, 0,
-3.16541, -3.183054, 2,
-3.329363, -3.360095, 2,
-3.16541, -3.183054, 4,
-3.329363, -3.360095, 4
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
-3.65727, -3.714178, -4, 0, -0.5, 0.5, 0.5,
-3.65727, -3.714178, -4, 1, -0.5, 0.5, 0.5,
-3.65727, -3.714178, -4, 1, 1.5, 0.5, 0.5,
-3.65727, -3.714178, -4, 0, 1.5, 0.5, 0.5,
-3.65727, -3.714178, -2, 0, -0.5, 0.5, 0.5,
-3.65727, -3.714178, -2, 1, -0.5, 0.5, 0.5,
-3.65727, -3.714178, -2, 1, 1.5, 0.5, 0.5,
-3.65727, -3.714178, -2, 0, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 0, 0, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 0, 1, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 0, 1, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 0, 0, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 2, 0, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 2, 1, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 2, 1, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 2, 0, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 4, 0, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 4, 1, -0.5, 0.5, 0.5,
-3.65727, -3.714178, 4, 1, 1.5, 0.5, 0.5,
-3.65727, -3.714178, 4, 0, 1.5, 0.5, 0.5
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
-3.16541, -3.183054, -6.062804,
-3.16541, 3.898595, -6.062804,
-3.16541, -3.183054, 5.659237,
-3.16541, 3.898595, 5.659237,
-3.16541, -3.183054, -6.062804,
-3.16541, -3.183054, 5.659237,
-3.16541, 3.898595, -6.062804,
-3.16541, 3.898595, 5.659237,
-3.16541, -3.183054, -6.062804,
3.392727, -3.183054, -6.062804,
-3.16541, -3.183054, 5.659237,
3.392727, -3.183054, 5.659237,
-3.16541, 3.898595, -6.062804,
3.392727, 3.898595, -6.062804,
-3.16541, 3.898595, 5.659237,
3.392727, 3.898595, 5.659237,
3.392727, -3.183054, -6.062804,
3.392727, 3.898595, -6.062804,
3.392727, -3.183054, 5.659237,
3.392727, 3.898595, 5.659237,
3.392727, -3.183054, -6.062804,
3.392727, -3.183054, 5.659237,
3.392727, 3.898595, -6.062804,
3.392727, 3.898595, 5.659237
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
var radius = 8.10816;
var distance = 36.07412;
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
mvMatrix.translate( -0.1136584, -0.3577706, 0.2017834 );
mvMatrix.scale( 1.336767, 1.237946, 0.7478818 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.07412);
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
sprinkle<-read.table("sprinkle.xyz")
```

```
## Error in read.table("sprinkle.xyz"): no lines available in input
```

```r
x<-sprinkle$V2
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
```

```r
y<-sprinkle$V3
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
```

```r
z<-sprinkle$V4
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
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
-3.069903, 1.152274, -2.219183, 0, 0, 1, 1, 1,
-2.977459, -1.529263, -2.360884, 1, 0, 0, 1, 1,
-2.687919, -0.1553756, -2.757747, 1, 0, 0, 1, 1,
-2.655612, 0.5858483, -1.222405, 1, 0, 0, 1, 1,
-2.579935, 0.4521389, -2.982459, 1, 0, 0, 1, 1,
-2.545825, -1.806936, -2.783474, 1, 0, 0, 1, 1,
-2.535512, -0.621136, -1.835565, 0, 0, 0, 1, 1,
-2.432917, -0.3195279, -2.499243, 0, 0, 0, 1, 1,
-2.307113, 0.04483048, -2.354639, 0, 0, 0, 1, 1,
-2.251512, 0.7779756, 0.4710748, 0, 0, 0, 1, 1,
-2.185164, -0.03679698, -1.890873, 0, 0, 0, 1, 1,
-2.156788, 2.307359, -0.4013648, 0, 0, 0, 1, 1,
-2.154149, -2.652041, -2.950964, 0, 0, 0, 1, 1,
-2.128952, 3.470917, -0.3365428, 1, 1, 1, 1, 1,
-2.069457, 0.6029647, 0.117216, 1, 1, 1, 1, 1,
-2.05514, 1.390816, 1.456937, 1, 1, 1, 1, 1,
-1.975886, -0.1363147, -0.04635203, 1, 1, 1, 1, 1,
-1.974499, -0.570293, -1.424076, 1, 1, 1, 1, 1,
-1.959242, 0.9789683, -1.06345, 1, 1, 1, 1, 1,
-1.898004, 0.4031526, -3.715532, 1, 1, 1, 1, 1,
-1.880825, -1.199755, -1.867974, 1, 1, 1, 1, 1,
-1.876463, 0.6186631, -0.1114106, 1, 1, 1, 1, 1,
-1.872588, -0.2468938, -2.329731, 1, 1, 1, 1, 1,
-1.852035, 0.2384642, -0.5412506, 1, 1, 1, 1, 1,
-1.848669, -0.6003959, -1.124128, 1, 1, 1, 1, 1,
-1.828217, 2.371061, -1.583838, 1, 1, 1, 1, 1,
-1.825116, 0.1857016, -2.531058, 1, 1, 1, 1, 1,
-1.814637, 1.21783, -1.845705, 1, 1, 1, 1, 1,
-1.814327, 0.437024, 0.321791, 0, 0, 1, 1, 1,
-1.809607, 0.5192974, -1.116851, 1, 0, 0, 1, 1,
-1.778752, -1.372061, -0.7583324, 1, 0, 0, 1, 1,
-1.762602, 0.426886, -1.308559, 1, 0, 0, 1, 1,
-1.762493, -0.9844177, -1.780269, 1, 0, 0, 1, 1,
-1.757205, -0.595515, -2.1808, 1, 0, 0, 1, 1,
-1.734418, -0.1937829, -1.480231, 0, 0, 0, 1, 1,
-1.731759, -0.3716144, 0.145981, 0, 0, 0, 1, 1,
-1.731547, 0.5733033, -0.5876821, 0, 0, 0, 1, 1,
-1.72267, 0.0508372, -1.740159, 0, 0, 0, 1, 1,
-1.717233, -1.629093, -2.870092, 0, 0, 0, 1, 1,
-1.713765, -0.4071061, -2.824447, 0, 0, 0, 1, 1,
-1.713626, 2.494104, -1.072975, 0, 0, 0, 1, 1,
-1.706179, 1.854004, 0.02718481, 1, 1, 1, 1, 1,
-1.705879, -0.9335486, -2.132913, 1, 1, 1, 1, 1,
-1.693568, -0.2346033, -1.346225, 1, 1, 1, 1, 1,
-1.679932, 0.1649897, -2.204577, 1, 1, 1, 1, 1,
-1.665269, -0.944992, -2.684427, 1, 1, 1, 1, 1,
-1.663786, 1.111305, -0.1431527, 1, 1, 1, 1, 1,
-1.655906, 0.04686916, -1.933099, 1, 1, 1, 1, 1,
-1.641472, -0.2368938, -1.804865, 1, 1, 1, 1, 1,
-1.640475, -0.4405113, -0.006223951, 1, 1, 1, 1, 1,
-1.632972, 0.2549677, -1.764411, 1, 1, 1, 1, 1,
-1.62802, -0.4227064, -2.784183, 1, 1, 1, 1, 1,
-1.617048, -0.07048493, -3.517189, 1, 1, 1, 1, 1,
-1.61137, -1.58867, -1.21761, 1, 1, 1, 1, 1,
-1.593561, -0.6185893, -1.383124, 1, 1, 1, 1, 1,
-1.578493, 1.038066, -2.206248, 1, 1, 1, 1, 1,
-1.569093, -0.02944916, -1.59904, 0, 0, 1, 1, 1,
-1.568263, -1.151994, -2.798906, 1, 0, 0, 1, 1,
-1.564301, 0.295548, 0.02115676, 1, 0, 0, 1, 1,
-1.563047, 1.096599, -0.4030802, 1, 0, 0, 1, 1,
-1.554518, 0.6759886, -2.365024, 1, 0, 0, 1, 1,
-1.551983, 0.04108179, -0.3531198, 1, 0, 0, 1, 1,
-1.539299, 0.7129835, -0.6854875, 0, 0, 0, 1, 1,
-1.536653, -1.056639, -0.8286577, 0, 0, 0, 1, 1,
-1.534528, 0.928739, -0.5036597, 0, 0, 0, 1, 1,
-1.531115, 0.5579818, 0.2585844, 0, 0, 0, 1, 1,
-1.523457, 0.6545089, -2.751981, 0, 0, 0, 1, 1,
-1.519528, 0.156557, -2.769815, 0, 0, 0, 1, 1,
-1.509186, -0.182448, -1.417845, 0, 0, 0, 1, 1,
-1.506504, 2.890135, -1.611751, 1, 1, 1, 1, 1,
-1.490559, 0.5395153, -0.9787685, 1, 1, 1, 1, 1,
-1.490146, -0.6124797, -3.060583, 1, 1, 1, 1, 1,
-1.487314, -0.1980712, -0.7115504, 1, 1, 1, 1, 1,
-1.477788, -1.011578, -0.5487996, 1, 1, 1, 1, 1,
-1.454176, -1.305254, -4.055767, 1, 1, 1, 1, 1,
-1.44897, 0.4347485, 0.4001974, 1, 1, 1, 1, 1,
-1.440397, 0.9310338, -1.154744, 1, 1, 1, 1, 1,
-1.440134, -1.222372, -1.916694, 1, 1, 1, 1, 1,
-1.437908, 0.6104824, -0.6289735, 1, 1, 1, 1, 1,
-1.431286, -1.067501, -2.739679, 1, 1, 1, 1, 1,
-1.430817, -0.2228398, -3.079262, 1, 1, 1, 1, 1,
-1.428823, -0.8569294, -0.4266835, 1, 1, 1, 1, 1,
-1.427541, 0.3667824, -1.272431, 1, 1, 1, 1, 1,
-1.422805, -1.741835, -4.26803, 1, 1, 1, 1, 1,
-1.412749, -1.287992, -3.731611, 0, 0, 1, 1, 1,
-1.397791, 0.3115408, -1.255559, 1, 0, 0, 1, 1,
-1.381712, -0.07814436, -0.7351044, 1, 0, 0, 1, 1,
-1.381464, -1.175476, -0.2978804, 1, 0, 0, 1, 1,
-1.373444, -0.7639176, -1.97371, 1, 0, 0, 1, 1,
-1.364459, 0.9069518, -0.4531888, 1, 0, 0, 1, 1,
-1.354779, 1.739887, 0.1924498, 0, 0, 0, 1, 1,
-1.351373, 0.4834864, -0.7010688, 0, 0, 0, 1, 1,
-1.347666, -0.1688824, -2.094298, 0, 0, 0, 1, 1,
-1.340955, -0.1698797, -0.879417, 0, 0, 0, 1, 1,
-1.336575, 0.8254879, -0.8299608, 0, 0, 0, 1, 1,
-1.335441, 0.6461459, -0.02658511, 0, 0, 0, 1, 1,
-1.334576, 1.489, -0.7635292, 0, 0, 0, 1, 1,
-1.334457, -0.4877115, -2.62135, 1, 1, 1, 1, 1,
-1.332789, -1.476177, -1.624016, 1, 1, 1, 1, 1,
-1.332745, -0.5175199, -1.24332, 1, 1, 1, 1, 1,
-1.312811, 1.012107, -0.3219187, 1, 1, 1, 1, 1,
-1.305203, -0.8978551, -3.214214, 1, 1, 1, 1, 1,
-1.304873, -0.6231664, -2.144376, 1, 1, 1, 1, 1,
-1.302953, -0.02843561, -2.056419, 1, 1, 1, 1, 1,
-1.302531, -0.09613764, -1.69553, 1, 1, 1, 1, 1,
-1.299595, -1.299064, -0.5594258, 1, 1, 1, 1, 1,
-1.299095, -0.6984473, -1.501287, 1, 1, 1, 1, 1,
-1.298856, 1.602243, -0.0546767, 1, 1, 1, 1, 1,
-1.296701, 0.1485872, -2.618538, 1, 1, 1, 1, 1,
-1.289866, 0.2008669, -3.334428, 1, 1, 1, 1, 1,
-1.288984, -1.293558, -2.361368, 1, 1, 1, 1, 1,
-1.284402, -0.6359267, -2.492892, 1, 1, 1, 1, 1,
-1.273682, -0.3892476, -1.039917, 0, 0, 1, 1, 1,
-1.268674, -0.04404687, 0.1378996, 1, 0, 0, 1, 1,
-1.265112, -0.7564156, -2.416217, 1, 0, 0, 1, 1,
-1.255463, -0.2522681, -1.277063, 1, 0, 0, 1, 1,
-1.253233, -0.4913166, -2.457567, 1, 0, 0, 1, 1,
-1.239772, 1.45013, -1.384248, 1, 0, 0, 1, 1,
-1.235472, -0.08136668, -0.6658567, 0, 0, 0, 1, 1,
-1.229691, 0.7592473, -2.645167, 0, 0, 0, 1, 1,
-1.229089, -0.5401229, -2.978189, 0, 0, 0, 1, 1,
-1.225445, 0.07732538, 0.2142922, 0, 0, 0, 1, 1,
-1.222275, -1.05763, -0.4344707, 0, 0, 0, 1, 1,
-1.220315, -0.2414629, -1.832293, 0, 0, 0, 1, 1,
-1.21532, -0.9937229, -3.013322, 0, 0, 0, 1, 1,
-1.209574, -1.15808, -1.92764, 1, 1, 1, 1, 1,
-1.199444, 1.0175, 0.06019556, 1, 1, 1, 1, 1,
-1.198887, 0.5933924, -2.426661, 1, 1, 1, 1, 1,
-1.193616, 1.865742, -1.000339, 1, 1, 1, 1, 1,
-1.192668, 2.286841, -0.3166107, 1, 1, 1, 1, 1,
-1.192535, -0.6353486, -0.6865625, 1, 1, 1, 1, 1,
-1.191888, 0.00553795, -1.342252, 1, 1, 1, 1, 1,
-1.19074, -0.2906054, -3.656575, 1, 1, 1, 1, 1,
-1.187338, 0.4041083, -0.08596637, 1, 1, 1, 1, 1,
-1.187141, -0.4785181, -2.826803, 1, 1, 1, 1, 1,
-1.182734, -0.03979487, -1.670979, 1, 1, 1, 1, 1,
-1.181523, -0.8900329, -2.702107, 1, 1, 1, 1, 1,
-1.169768, 0.1035587, -1.727661, 1, 1, 1, 1, 1,
-1.149785, 0.785442, -0.2581524, 1, 1, 1, 1, 1,
-1.148041, 0.1802426, -1.437544, 1, 1, 1, 1, 1,
-1.144785, 0.6133291, -0.7697852, 0, 0, 1, 1, 1,
-1.144723, 1.146232, -0.1487054, 1, 0, 0, 1, 1,
-1.130587, 1.25102, -1.308712, 1, 0, 0, 1, 1,
-1.125409, -0.7415056, -1.350524, 1, 0, 0, 1, 1,
-1.122138, -1.107224, -0.6060403, 1, 0, 0, 1, 1,
-1.118569, -0.4563267, -2.495033, 1, 0, 0, 1, 1,
-1.110544, -0.04315618, 0.1393109, 0, 0, 0, 1, 1,
-1.108476, 1.590171, -1.327712, 0, 0, 0, 1, 1,
-1.105512, 1.594625, -1.379187, 0, 0, 0, 1, 1,
-1.099347, -0.317551, -1.774662, 0, 0, 0, 1, 1,
-1.094345, 0.2156783, -1.821256, 0, 0, 0, 1, 1,
-1.090545, 1.362632, -1.36583, 0, 0, 0, 1, 1,
-1.0898, 0.5141875, -1.827582, 0, 0, 0, 1, 1,
-1.07988, -1.103357, -2.236928, 1, 1, 1, 1, 1,
-1.079243, -1.001556, -2.866133, 1, 1, 1, 1, 1,
-1.077291, -0.7982633, -1.660983, 1, 1, 1, 1, 1,
-1.07396, -1.270589, -2.645177, 1, 1, 1, 1, 1,
-1.067025, -1.459565, -3.369302, 1, 1, 1, 1, 1,
-1.058818, -0.8458995, -3.574134, 1, 1, 1, 1, 1,
-1.057478, -1.095069, -4.311659, 1, 1, 1, 1, 1,
-1.050627, 0.2884927, -1.990043, 1, 1, 1, 1, 1,
-1.046113, 0.7509719, -0.4916745, 1, 1, 1, 1, 1,
-1.042578, -1.027504, -2.214275, 1, 1, 1, 1, 1,
-1.042505, -1.186222, -2.427985, 1, 1, 1, 1, 1,
-1.041907, 1.479868, -0.6287583, 1, 1, 1, 1, 1,
-1.028388, -1.126701, -3.953443, 1, 1, 1, 1, 1,
-1.026572, -0.5307637, 0.5623278, 1, 1, 1, 1, 1,
-1.02243, 1.687737, -1.481085, 1, 1, 1, 1, 1,
-1.017463, -0.5314952, -0.7575938, 0, 0, 1, 1, 1,
-1.009055, 0.9058827, 0.7439368, 1, 0, 0, 1, 1,
-0.9965589, -0.2735377, -0.8979824, 1, 0, 0, 1, 1,
-0.9922836, 2.08791, -0.2353379, 1, 0, 0, 1, 1,
-0.9878404, -0.5517167, -3.147609, 1, 0, 0, 1, 1,
-0.9846005, 0.9506859, -0.8047102, 1, 0, 0, 1, 1,
-0.9816024, -2.368365, -2.621797, 0, 0, 0, 1, 1,
-0.9795884, 0.9966639, -1.078997, 0, 0, 0, 1, 1,
-0.9778399, -0.2210612, -1.325687, 0, 0, 0, 1, 1,
-0.9642436, -1.545231, -4.194904, 0, 0, 0, 1, 1,
-0.9509506, 1.866332, 0.7384914, 0, 0, 0, 1, 1,
-0.9491584, 1.269435, -1.16336, 0, 0, 0, 1, 1,
-0.9478101, -0.6353599, -2.06256, 0, 0, 0, 1, 1,
-0.9442189, 0.7222502, 0.4286037, 1, 1, 1, 1, 1,
-0.9411304, 1.301967, -0.4883664, 1, 1, 1, 1, 1,
-0.9394926, 0.1893171, -2.279051, 1, 1, 1, 1, 1,
-0.9349943, -1.238888, -3.2893, 1, 1, 1, 1, 1,
-0.9325771, -0.4690745, -3.678533, 1, 1, 1, 1, 1,
-0.9273708, -1.860821, -2.897035, 1, 1, 1, 1, 1,
-0.9250681, 1.509517, -0.08667229, 1, 1, 1, 1, 1,
-0.9100584, 0.02831316, -2.181901, 1, 1, 1, 1, 1,
-0.903387, -0.350052, -2.068329, 1, 1, 1, 1, 1,
-0.9011142, 1.545817, -2.160465, 1, 1, 1, 1, 1,
-0.8979505, -0.6400454, -1.940012, 1, 1, 1, 1, 1,
-0.8910956, -0.3118645, -3.44492, 1, 1, 1, 1, 1,
-0.8901197, 0.05813716, -2.616236, 1, 1, 1, 1, 1,
-0.8850809, 1.413352, 0.5857099, 1, 1, 1, 1, 1,
-0.8825633, 0.7709606, -1.372681, 1, 1, 1, 1, 1,
-0.8824617, 0.6552616, -0.4065308, 0, 0, 1, 1, 1,
-0.8811717, -0.2378623, -1.959144, 1, 0, 0, 1, 1,
-0.8809424, 1.997848, 0.7146447, 1, 0, 0, 1, 1,
-0.8701231, 0.5947095, 0.1652075, 1, 0, 0, 1, 1,
-0.8694957, 0.9511591, -2.635014, 1, 0, 0, 1, 1,
-0.867143, 1.128426, -0.9265239, 1, 0, 0, 1, 1,
-0.8665391, -0.741957, -3.855442, 0, 0, 0, 1, 1,
-0.8655503, -0.1458065, -2.107734, 0, 0, 0, 1, 1,
-0.8629928, 1.616574, -0.01974287, 0, 0, 0, 1, 1,
-0.8607113, -0.6417372, -2.299777, 0, 0, 0, 1, 1,
-0.8506458, 0.03186032, -1.821536, 0, 0, 0, 1, 1,
-0.8494523, 0.04799498, -4.449268, 0, 0, 0, 1, 1,
-0.846181, 1.12348, -1.216298, 0, 0, 0, 1, 1,
-0.8454525, -0.1355264, -1.675988, 1, 1, 1, 1, 1,
-0.843125, 0.2702239, -2.070125, 1, 1, 1, 1, 1,
-0.8420492, -0.08157137, -1.141287, 1, 1, 1, 1, 1,
-0.8419691, -1.019055, -2.99391, 1, 1, 1, 1, 1,
-0.8408719, 0.75435, 1.247517, 1, 1, 1, 1, 1,
-0.8375973, -1.000285, -3.640643, 1, 1, 1, 1, 1,
-0.8364549, 1.09721, -1.039638, 1, 1, 1, 1, 1,
-0.8157471, -0.07321753, -2.528957, 1, 1, 1, 1, 1,
-0.8074859, -0.4499147, -2.072924, 1, 1, 1, 1, 1,
-0.8003144, -0.8450376, -3.684606, 1, 1, 1, 1, 1,
-0.7969684, -2.279256, -4.376519, 1, 1, 1, 1, 1,
-0.7949615, 0.7798902, -0.7372876, 1, 1, 1, 1, 1,
-0.7876614, 0.6474201, -1.298115, 1, 1, 1, 1, 1,
-0.774253, -1.601074, -1.340697, 1, 1, 1, 1, 1,
-0.7699357, -0.06834517, -2.794089, 1, 1, 1, 1, 1,
-0.7663789, -0.4179006, -4.768422, 0, 0, 1, 1, 1,
-0.766143, -0.5583889, -2.351601, 1, 0, 0, 1, 1,
-0.7651755, 0.300934, -0.2467927, 1, 0, 0, 1, 1,
-0.7639101, 0.1503267, -1.568943, 1, 0, 0, 1, 1,
-0.7610261, -0.6302857, -3.876198, 1, 0, 0, 1, 1,
-0.7542875, 0.2230074, -1.508579, 1, 0, 0, 1, 1,
-0.7534059, -1.102589, -2.817496, 0, 0, 0, 1, 1,
-0.7522116, 0.2989253, -1.832868, 0, 0, 0, 1, 1,
-0.7521529, 1.327663, 0.9264684, 0, 0, 0, 1, 1,
-0.7505751, 0.7830358, 1.801223, 0, 0, 0, 1, 1,
-0.7390522, 0.2391923, 0.3254008, 0, 0, 0, 1, 1,
-0.7374809, 0.9743288, 0.06263437, 0, 0, 0, 1, 1,
-0.7367107, 1.642074, -1.216648, 0, 0, 0, 1, 1,
-0.7365479, 0.3357695, -0.4694467, 1, 1, 1, 1, 1,
-0.7365115, 0.5686774, -1.876373, 1, 1, 1, 1, 1,
-0.7354626, -1.467238, -3.114588, 1, 1, 1, 1, 1,
-0.7343453, 1.317992, -0.1978688, 1, 1, 1, 1, 1,
-0.7236753, 0.9016334, -0.6529883, 1, 1, 1, 1, 1,
-0.7231117, 0.01133397, -0.8850498, 1, 1, 1, 1, 1,
-0.7151453, 0.6121396, -0.3356617, 1, 1, 1, 1, 1,
-0.7093353, 0.8366233, -2.678147, 1, 1, 1, 1, 1,
-0.7091354, 1.177613, -0.6172403, 1, 1, 1, 1, 1,
-0.707844, 0.9840553, 0.3157104, 1, 1, 1, 1, 1,
-0.706672, 1.835521, -0.9957094, 1, 1, 1, 1, 1,
-0.7042947, -0.03792329, -0.1149682, 1, 1, 1, 1, 1,
-0.7033193, -0.9437587, -3.936835, 1, 1, 1, 1, 1,
-0.7026737, -0.05957535, -2.624412, 1, 1, 1, 1, 1,
-0.7025452, -0.4117489, -2.22197, 1, 1, 1, 1, 1,
-0.69139, 0.8452306, -0.6849604, 0, 0, 1, 1, 1,
-0.6859604, -0.7094831, -5.892095, 1, 0, 0, 1, 1,
-0.6769767, 0.1309842, -0.08534188, 1, 0, 0, 1, 1,
-0.6759034, -0.008278954, -1.397941, 1, 0, 0, 1, 1,
-0.6729342, -0.5531772, -4.946706, 1, 0, 0, 1, 1,
-0.6721174, -0.8936837, -2.547678, 1, 0, 0, 1, 1,
-0.6666976, -1.028161, -3.382744, 0, 0, 0, 1, 1,
-0.6597881, 0.5856064, 0.2783559, 0, 0, 0, 1, 1,
-0.6579777, 0.7129294, -2.239066, 0, 0, 0, 1, 1,
-0.6574997, -1.097034, -2.540564, 0, 0, 0, 1, 1,
-0.6528391, 0.8118118, -1.412527, 0, 0, 0, 1, 1,
-0.6474651, -0.2269477, -0.13854, 0, 0, 0, 1, 1,
-0.6468253, -1.125636, -2.562879, 0, 0, 0, 1, 1,
-0.642368, -0.7681125, -0.6198531, 1, 1, 1, 1, 1,
-0.6402995, -1.385706, -3.19654, 1, 1, 1, 1, 1,
-0.6355244, 0.9300777, 1.016548, 1, 1, 1, 1, 1,
-0.6353009, 0.6025315, -1.706542, 1, 1, 1, 1, 1,
-0.6351911, 1.005861, -1.957623, 1, 1, 1, 1, 1,
-0.6350087, -1.868773, -3.190974, 1, 1, 1, 1, 1,
-0.6349248, 0.3916833, -0.1147396, 1, 1, 1, 1, 1,
-0.6333472, 0.04311458, -0.2447312, 1, 1, 1, 1, 1,
-0.6301116, -0.4732653, -1.578503, 1, 1, 1, 1, 1,
-0.6290658, 0.6829762, -1.813487, 1, 1, 1, 1, 1,
-0.6199982, -0.041402, -1.226121, 1, 1, 1, 1, 1,
-0.6192475, -0.8482941, -2.352741, 1, 1, 1, 1, 1,
-0.6160917, -0.6657852, -2.023081, 1, 1, 1, 1, 1,
-0.6106262, -0.7154047, -2.209079, 1, 1, 1, 1, 1,
-0.6067595, -0.4682955, -3.53047, 1, 1, 1, 1, 1,
-0.605764, 0.4439939, -0.8821046, 0, 0, 1, 1, 1,
-0.5977802, -0.1948989, -0.8264451, 1, 0, 0, 1, 1,
-0.5963785, -0.417587, -1.568766, 1, 0, 0, 1, 1,
-0.5954095, -1.884954, -3.590328, 1, 0, 0, 1, 1,
-0.5804455, 1.400418, 0.4307454, 1, 0, 0, 1, 1,
-0.5765579, 1.938203, -0.3101383, 1, 0, 0, 1, 1,
-0.5695137, -0.4255414, -1.936474, 0, 0, 0, 1, 1,
-0.5670186, 2.225596, 0.9534495, 0, 0, 0, 1, 1,
-0.5648278, 0.4393742, -0.5118312, 0, 0, 0, 1, 1,
-0.5632225, -0.1508261, -3.058556, 0, 0, 0, 1, 1,
-0.5630534, -1.042914, -3.688229, 0, 0, 0, 1, 1,
-0.562646, -0.5612645, -3.103323, 0, 0, 0, 1, 1,
-0.5606053, 1.346388, 0.1827418, 0, 0, 0, 1, 1,
-0.5576513, 1.073409, 0.08850258, 1, 1, 1, 1, 1,
-0.5564951, -0.6054643, -3.034298, 1, 1, 1, 1, 1,
-0.5557736, -1.790542, -3.127945, 1, 1, 1, 1, 1,
-0.5552993, 1.750873, 0.2100928, 1, 1, 1, 1, 1,
-0.5513293, -1.44824, -1.87864, 1, 1, 1, 1, 1,
-0.5491219, 0.2724974, -1.321199, 1, 1, 1, 1, 1,
-0.5469723, -1.318869, -2.301981, 1, 1, 1, 1, 1,
-0.5459563, -1.671098, -3.570392, 1, 1, 1, 1, 1,
-0.5438702, 0.2937806, -0.518109, 1, 1, 1, 1, 1,
-0.5438504, 1.270784, 0.4635895, 1, 1, 1, 1, 1,
-0.5302312, 1.300156, -0.8516581, 1, 1, 1, 1, 1,
-0.5259788, 0.8171477, -0.1658068, 1, 1, 1, 1, 1,
-0.5249084, 1.054953, -0.0985625, 1, 1, 1, 1, 1,
-0.5173312, -1.503358, -2.408563, 1, 1, 1, 1, 1,
-0.5167523, 0.4689867, -0.3479598, 1, 1, 1, 1, 1,
-0.5098554, -0.1933765, -0.7032564, 0, 0, 1, 1, 1,
-0.5081894, -1.0869, -2.875611, 1, 0, 0, 1, 1,
-0.5073236, 0.5718203, -1.141142, 1, 0, 0, 1, 1,
-0.5053344, 0.05288861, -1.154893, 1, 0, 0, 1, 1,
-0.5049429, -0.9148971, -2.372027, 1, 0, 0, 1, 1,
-0.4944594, 0.4328704, 1.935302, 1, 0, 0, 1, 1,
-0.4928737, -0.5197112, -3.672259, 0, 0, 0, 1, 1,
-0.489559, -0.706282, -3.36413, 0, 0, 0, 1, 1,
-0.4894835, 1.578157, -3.155703, 0, 0, 0, 1, 1,
-0.4875219, -0.4898722, -1.930421, 0, 0, 0, 1, 1,
-0.4854065, -0.4998692, -2.195326, 0, 0, 0, 1, 1,
-0.4791959, 1.221077, 0.7854126, 0, 0, 0, 1, 1,
-0.4783402, -0.635784, -2.538294, 0, 0, 0, 1, 1,
-0.4776675, 0.2003424, 0.90372, 1, 1, 1, 1, 1,
-0.4735273, -1.077435, -1.69296, 1, 1, 1, 1, 1,
-0.4733099, 0.5125514, -0.2706833, 1, 1, 1, 1, 1,
-0.473191, 1.530264, -1.013421, 1, 1, 1, 1, 1,
-0.470018, 1.085607, 0.6633527, 1, 1, 1, 1, 1,
-0.4663192, -0.6945022, -0.4889065, 1, 1, 1, 1, 1,
-0.4601934, 0.05767931, -1.016474, 1, 1, 1, 1, 1,
-0.4572272, 1.958598, 0.5462742, 1, 1, 1, 1, 1,
-0.4564061, 2.217142, -0.8974788, 1, 1, 1, 1, 1,
-0.4526818, -1.473262, -3.365265, 1, 1, 1, 1, 1,
-0.4498444, -2.129472, -2.272673, 1, 1, 1, 1, 1,
-0.4446967, -1.143237, -2.443404, 1, 1, 1, 1, 1,
-0.4390567, -0.9003707, -4.608431, 1, 1, 1, 1, 1,
-0.4352204, 0.7798115, -1.917753, 1, 1, 1, 1, 1,
-0.4343633, -0.4071504, -3.276841, 1, 1, 1, 1, 1,
-0.4341915, 0.4150355, -0.3750523, 0, 0, 1, 1, 1,
-0.4290281, -0.4169745, -1.472781, 1, 0, 0, 1, 1,
-0.4249287, 0.7659942, -1.041444, 1, 0, 0, 1, 1,
-0.423199, -0.8632476, -2.302939, 1, 0, 0, 1, 1,
-0.4230025, -0.006550357, -2.583388, 1, 0, 0, 1, 1,
-0.4227734, -0.4527718, -0.3809922, 1, 0, 0, 1, 1,
-0.4180861, -0.3152821, -0.4372353, 0, 0, 0, 1, 1,
-0.4167305, 1.737666, -0.00499311, 0, 0, 0, 1, 1,
-0.4149013, 0.05504134, -1.636001, 0, 0, 0, 1, 1,
-0.4116696, 1.519675, 1.842741, 0, 0, 0, 1, 1,
-0.4108539, -1.714741, -2.279299, 0, 0, 0, 1, 1,
-0.4092273, -0.031756, -1.509176, 0, 0, 0, 1, 1,
-0.4061994, -0.04991087, -1.006214, 0, 0, 0, 1, 1,
-0.405555, -1.48229, -2.715158, 1, 1, 1, 1, 1,
-0.4041323, 0.6809074, 0.6108568, 1, 1, 1, 1, 1,
-0.3994577, 1.027961, -0.5186221, 1, 1, 1, 1, 1,
-0.3989421, -0.6074864, -2.70941, 1, 1, 1, 1, 1,
-0.3949541, 0.5978189, -1.135683, 1, 1, 1, 1, 1,
-0.3949242, -0.5356517, -3.765238, 1, 1, 1, 1, 1,
-0.3943568, -0.1541136, -0.8706278, 1, 1, 1, 1, 1,
-0.3927367, 0.9986712, -1.371846, 1, 1, 1, 1, 1,
-0.3927284, -1.362467, -2.173921, 1, 1, 1, 1, 1,
-0.3856067, -0.4534936, -2.189344, 1, 1, 1, 1, 1,
-0.3830899, -0.05255619, 0.01244481, 1, 1, 1, 1, 1,
-0.3755425, 1.015813, -0.68929, 1, 1, 1, 1, 1,
-0.3696577, 0.5747767, -0.7307409, 1, 1, 1, 1, 1,
-0.3677484, 0.4441167, -0.7921957, 1, 1, 1, 1, 1,
-0.3650427, -0.8283554, -3.609, 1, 1, 1, 1, 1,
-0.3595002, -0.8286596, -3.734877, 0, 0, 1, 1, 1,
-0.3580939, 0.7500083, -0.4603031, 1, 0, 0, 1, 1,
-0.3487736, -1.180878, -3.493849, 1, 0, 0, 1, 1,
-0.3483666, -0.6351452, -3.668041, 1, 0, 0, 1, 1,
-0.3454078, 0.1798637, -0.09877244, 1, 0, 0, 1, 1,
-0.3451068, -0.3269815, -2.633122, 1, 0, 0, 1, 1,
-0.3447849, -0.6733213, -3.696795, 0, 0, 0, 1, 1,
-0.3444564, -1.153879, -0.9800935, 0, 0, 0, 1, 1,
-0.3434405, -0.4273596, -1.078772, 0, 0, 0, 1, 1,
-0.3420511, -1.499326, -3.49292, 0, 0, 0, 1, 1,
-0.3326276, 0.3520657, -0.5147149, 0, 0, 0, 1, 1,
-0.3319703, 1.942238, 0.7894645, 0, 0, 0, 1, 1,
-0.3280976, 1.35038, -1.923459, 0, 0, 0, 1, 1,
-0.3262618, -0.03453704, -2.473097, 1, 1, 1, 1, 1,
-0.3242792, -0.2780219, -3.174571, 1, 1, 1, 1, 1,
-0.3238408, 0.104597, -2.309767, 1, 1, 1, 1, 1,
-0.3230376, -0.6571103, -1.202834, 1, 1, 1, 1, 1,
-0.3204819, 0.5608743, -1.727447, 1, 1, 1, 1, 1,
-0.3137144, 0.06122475, -1.24886, 1, 1, 1, 1, 1,
-0.3123643, -0.4052572, -0.463867, 1, 1, 1, 1, 1,
-0.3115711, 0.6500505, 0.7683834, 1, 1, 1, 1, 1,
-0.3089379, -0.082426, -1.815176, 1, 1, 1, 1, 1,
-0.3020168, 0.2852903, -1.714939, 1, 1, 1, 1, 1,
-0.3009114, 0.2006242, -1.618356, 1, 1, 1, 1, 1,
-0.29017, -1.306597, -2.327954, 1, 1, 1, 1, 1,
-0.2896386, 0.1859151, -0.6673942, 1, 1, 1, 1, 1,
-0.2802567, -0.4348519, -1.829922, 1, 1, 1, 1, 1,
-0.2787963, 0.4996253, 0.1769792, 1, 1, 1, 1, 1,
-0.2743093, -0.0835126, -1.583564, 0, 0, 1, 1, 1,
-0.2694594, 0.1152038, -2.003796, 1, 0, 0, 1, 1,
-0.2681415, -1.552868, -2.666, 1, 0, 0, 1, 1,
-0.2672935, 0.4919718, -0.065044, 1, 0, 0, 1, 1,
-0.2665791, 0.9753752, -0.598474, 1, 0, 0, 1, 1,
-0.2637387, 0.2633195, -0.3343339, 1, 0, 0, 1, 1,
-0.2612712, -0.7830306, -2.519137, 0, 0, 0, 1, 1,
-0.2597679, 0.3776731, -0.09038078, 0, 0, 0, 1, 1,
-0.2593825, 0.6344177, -0.04537221, 0, 0, 0, 1, 1,
-0.2528796, 2.278866, -0.5161834, 0, 0, 0, 1, 1,
-0.2511763, 0.7898402, 1.406566, 0, 0, 0, 1, 1,
-0.2468374, 0.03206535, -2.620991, 0, 0, 0, 1, 1,
-0.243433, -0.1803907, -3.347591, 0, 0, 0, 1, 1,
-0.2417828, -0.1317958, -2.747602, 1, 1, 1, 1, 1,
-0.2398885, -0.83069, -2.31342, 1, 1, 1, 1, 1,
-0.2376538, -0.04618811, -1.050889, 1, 1, 1, 1, 1,
-0.2300807, -0.9889494, -2.008879, 1, 1, 1, 1, 1,
-0.2299044, 0.5297845, -0.768575, 1, 1, 1, 1, 1,
-0.228572, -1.514172, -3.894809, 1, 1, 1, 1, 1,
-0.2269513, 0.1494925, -1.371779, 1, 1, 1, 1, 1,
-0.2257739, -0.1604832, -3.501541, 1, 1, 1, 1, 1,
-0.2171581, 1.269507, 0.6059853, 1, 1, 1, 1, 1,
-0.2149723, -0.8709954, -2.774545, 1, 1, 1, 1, 1,
-0.2142441, 0.7053013, -0.1679245, 1, 1, 1, 1, 1,
-0.2140696, -0.779719, -1.260647, 1, 1, 1, 1, 1,
-0.213553, -0.7297353, -0.5993124, 1, 1, 1, 1, 1,
-0.2103641, 1.611341, 0.288422, 1, 1, 1, 1, 1,
-0.2085889, -1.483558, -4.157191, 1, 1, 1, 1, 1,
-0.2073494, 0.3376206, -1.207485, 0, 0, 1, 1, 1,
-0.2066734, 0.3583938, -1.114994, 1, 0, 0, 1, 1,
-0.2040022, -1.50477, -3.557841, 1, 0, 0, 1, 1,
-0.2036729, -0.6979924, -4.993533, 1, 0, 0, 1, 1,
-0.2025179, -2.600396, -3.979857, 1, 0, 0, 1, 1,
-0.1973627, 2.203578, -1.466774, 1, 0, 0, 1, 1,
-0.1972771, -0.4663158, -3.36627, 0, 0, 0, 1, 1,
-0.194884, -1.507479, -3.105343, 0, 0, 0, 1, 1,
-0.1914784, -0.2807636, -3.40454, 0, 0, 0, 1, 1,
-0.1895532, -0.9113539, -3.990545, 0, 0, 0, 1, 1,
-0.1864812, -0.02438564, -0.6290855, 0, 0, 0, 1, 1,
-0.184358, -0.7024482, -4.179176, 0, 0, 0, 1, 1,
-0.1839201, -0.5182489, -1.832671, 0, 0, 0, 1, 1,
-0.183818, -1.523601, -3.568769, 1, 1, 1, 1, 1,
-0.1763399, 0.1388544, -1.081384, 1, 1, 1, 1, 1,
-0.1725971, 1.527032, 0.4579539, 1, 1, 1, 1, 1,
-0.1680188, 0.5014044, -0.5078994, 1, 1, 1, 1, 1,
-0.1599479, 0.02108009, -0.7156301, 1, 1, 1, 1, 1,
-0.1596529, 0.1557559, -1.019576, 1, 1, 1, 1, 1,
-0.1594744, -2.082996, -3.479623, 1, 1, 1, 1, 1,
-0.1573832, 1.739485, -0.90896, 1, 1, 1, 1, 1,
-0.1558204, 0.5478737, 0.767031, 1, 1, 1, 1, 1,
-0.1545354, 0.5938841, 0.3543933, 1, 1, 1, 1, 1,
-0.1536895, -0.2634052, -2.663562, 1, 1, 1, 1, 1,
-0.1511692, -1.190322, -3.839769, 1, 1, 1, 1, 1,
-0.1507374, 0.1901377, 0.9803389, 1, 1, 1, 1, 1,
-0.1487438, -0.6238759, -3.5175, 1, 1, 1, 1, 1,
-0.147518, 3.008694, -1.54405, 1, 1, 1, 1, 1,
-0.1408908, -0.1338002, -0.4196461, 0, 0, 1, 1, 1,
-0.1394348, -1.058017, -1.660532, 1, 0, 0, 1, 1,
-0.1391725, 1.440935, 0.8106422, 1, 0, 0, 1, 1,
-0.1380903, 0.8846663, 0.2821333, 1, 0, 0, 1, 1,
-0.1358763, 1.321451, 1.456723, 1, 0, 0, 1, 1,
-0.1354571, -1.455222, -3.635863, 1, 0, 0, 1, 1,
-0.1301821, -0.5964631, -2.625226, 0, 0, 0, 1, 1,
-0.1133438, 0.4409968, -0.05775036, 0, 0, 0, 1, 1,
-0.1048471, 0.4877252, 1.211611, 0, 0, 0, 1, 1,
-0.1043578, -0.9095045, -2.664247, 0, 0, 0, 1, 1,
-0.09887694, -2.156303, -2.973616, 0, 0, 0, 1, 1,
-0.09066963, 0.3915232, -0.3172698, 0, 0, 0, 1, 1,
-0.08704031, 0.6350344, 0.4774294, 0, 0, 0, 1, 1,
-0.0851643, -0.172135, -2.07942, 1, 1, 1, 1, 1,
-0.08500272, -1.239852, -4.953775, 1, 1, 1, 1, 1,
-0.08496839, 1.153065, -0.3661301, 1, 1, 1, 1, 1,
-0.08351671, 0.4242047, 1.450153, 1, 1, 1, 1, 1,
-0.08232518, -0.6235944, -3.131377, 1, 1, 1, 1, 1,
-0.0805014, 1.472161, 0.09670506, 1, 1, 1, 1, 1,
-0.07936582, 1.550701, -0.4788483, 1, 1, 1, 1, 1,
-0.07875185, -0.3865941, -3.548131, 1, 1, 1, 1, 1,
-0.0744205, 0.4866447, -2.099295, 1, 1, 1, 1, 1,
-0.07157442, 0.1026195, -0.7259982, 1, 1, 1, 1, 1,
-0.07090001, -0.6756886, -3.895069, 1, 1, 1, 1, 1,
-0.06610043, 1.324493, -1.14198, 1, 1, 1, 1, 1,
-0.06532633, -0.8479953, -4.771258, 1, 1, 1, 1, 1,
-0.06184697, -0.3292675, -4.443771, 1, 1, 1, 1, 1,
-0.06010195, 1.751782, 0.5746919, 1, 1, 1, 1, 1,
-0.05995068, -0.6172087, -3.246275, 0, 0, 1, 1, 1,
-0.05660355, -0.9204381, -3.487833, 1, 0, 0, 1, 1,
-0.05468194, 1.166311, 0.7570929, 1, 0, 0, 1, 1,
-0.05448482, -0.2353056, -4.031786, 1, 0, 0, 1, 1,
-0.05068205, -1.969372, -3.46104, 1, 0, 0, 1, 1,
-0.05060977, -1.941608, -2.073272, 1, 0, 0, 1, 1,
-0.04904106, -1.446436, -3.29416, 0, 0, 0, 1, 1,
-0.04467595, -1.964376, -3.353464, 0, 0, 0, 1, 1,
-0.04244141, 0.1010639, -0.3559724, 0, 0, 0, 1, 1,
-0.03352967, -0.4423556, -3.633542, 0, 0, 0, 1, 1,
-0.02571877, -0.197314, -3.024827, 0, 0, 0, 1, 1,
-0.01947994, -1.099821, -2.909297, 0, 0, 0, 1, 1,
-0.01735699, -0.7746493, -3.436925, 0, 0, 0, 1, 1,
-0.01667482, -1.146774, -2.594619, 1, 1, 1, 1, 1,
-0.01340893, -0.7743232, -2.890962, 1, 1, 1, 1, 1,
-0.01227284, -1.708827, -2.298404, 1, 1, 1, 1, 1,
-0.008774895, -1.40784, -2.395859, 1, 1, 1, 1, 1,
-0.00710742, -0.3927905, -4.560743, 1, 1, 1, 1, 1,
-0.007100608, 0.9032936, 0.4448484, 1, 1, 1, 1, 1,
-0.006020333, 0.1494559, 0.3310429, 1, 1, 1, 1, 1,
-0.0002608495, -0.5541583, -3.310925, 1, 1, 1, 1, 1,
0.00345014, 0.190361, 0.7435219, 1, 1, 1, 1, 1,
0.005772981, -0.4343778, 2.595188, 1, 1, 1, 1, 1,
0.008054016, 2.156458, -0.9739341, 1, 1, 1, 1, 1,
0.009923015, 0.4947612, -0.374444, 1, 1, 1, 1, 1,
0.01176249, -2.120165, 3.95574, 1, 1, 1, 1, 1,
0.01187924, 0.4708624, 0.9616004, 1, 1, 1, 1, 1,
0.01197625, -1.229507, 2.609336, 1, 1, 1, 1, 1,
0.02148599, -0.4747042, 4.591623, 0, 0, 1, 1, 1,
0.02587798, -2.163078, 2.621613, 1, 0, 0, 1, 1,
0.02613305, -0.009880353, 0.6380109, 1, 0, 0, 1, 1,
0.02764386, -1.214538, 1.161903, 1, 0, 0, 1, 1,
0.02799254, -0.06277925, 4.408524, 1, 0, 0, 1, 1,
0.02852708, 0.5636129, -2.618423, 1, 0, 0, 1, 1,
0.03272297, -0.2846158, 2.799921, 0, 0, 0, 1, 1,
0.03904189, 0.04329668, 1.599758, 0, 0, 0, 1, 1,
0.0403054, 1.674605, 0.1608828, 0, 0, 0, 1, 1,
0.04324885, 0.2142299, -0.09455359, 0, 0, 0, 1, 1,
0.04343092, -0.01192324, 2.023615, 0, 0, 0, 1, 1,
0.04505798, -0.5292569, 1.563276, 0, 0, 0, 1, 1,
0.05167934, -0.5558485, 1.679934, 0, 0, 0, 1, 1,
0.05176821, -0.2655777, 1.815374, 1, 1, 1, 1, 1,
0.05411856, 0.09159882, 1.334146, 1, 1, 1, 1, 1,
0.05549772, 2.401423, 1.822161, 1, 1, 1, 1, 1,
0.05694792, -1.339252, 1.598276, 1, 1, 1, 1, 1,
0.05738601, 0.4071018, -0.4803119, 1, 1, 1, 1, 1,
0.05786604, 0.205491, -0.4733375, 1, 1, 1, 1, 1,
0.05970841, 1.045555, -1.332563, 1, 1, 1, 1, 1,
0.0614158, -0.2462506, 2.847571, 1, 1, 1, 1, 1,
0.0623007, -0.7716203, 3.139894, 1, 1, 1, 1, 1,
0.06884364, -0.6958649, 2.978467, 1, 1, 1, 1, 1,
0.07222098, 1.023894, 0.372025, 1, 1, 1, 1, 1,
0.07262933, -1.11973, 4.136364, 1, 1, 1, 1, 1,
0.07482446, 0.3168513, 0.381302, 1, 1, 1, 1, 1,
0.0778572, 0.1385386, 0.08291852, 1, 1, 1, 1, 1,
0.07960045, -1.544628, 2.655571, 1, 1, 1, 1, 1,
0.09096635, 0.6751865, 0.7274674, 0, 0, 1, 1, 1,
0.09946591, -1.301188, 4.025107, 1, 0, 0, 1, 1,
0.1004178, 0.067876, -0.3313867, 1, 0, 0, 1, 1,
0.1051902, 0.271904, -0.4236247, 1, 0, 0, 1, 1,
0.1066625, -0.5360053, 2.02797, 1, 0, 0, 1, 1,
0.1068626, -0.8922524, 3.124175, 1, 0, 0, 1, 1,
0.1069253, -0.2147956, 2.056084, 0, 0, 0, 1, 1,
0.10711, 1.202988, 0.4300836, 0, 0, 0, 1, 1,
0.1111041, 0.6068763, 2.395116, 0, 0, 0, 1, 1,
0.1141592, -0.471638, 2.138836, 0, 0, 0, 1, 1,
0.1148413, 0.3701731, -2.439835, 0, 0, 0, 1, 1,
0.1150529, 1.710955, -0.6763542, 0, 0, 0, 1, 1,
0.1224788, -0.5352774, 1.699589, 0, 0, 0, 1, 1,
0.1231131, 1.725735, 0.9995732, 1, 1, 1, 1, 1,
0.128985, 0.218363, -1.080784, 1, 1, 1, 1, 1,
0.1299924, -0.08557098, 1.482017, 1, 1, 1, 1, 1,
0.1302115, 0.8275483, 0.92963, 1, 1, 1, 1, 1,
0.1313935, 0.3911633, 0.5520427, 1, 1, 1, 1, 1,
0.1319463, -1.085567, 3.22607, 1, 1, 1, 1, 1,
0.1323587, 1.164792, 0.08868888, 1, 1, 1, 1, 1,
0.1345166, -1.335339, 4.336392, 1, 1, 1, 1, 1,
0.1364863, 0.9890822, 1.917253, 1, 1, 1, 1, 1,
0.1398351, -0.1231347, 3.957481, 1, 1, 1, 1, 1,
0.1445247, 1.237218, -1.166742, 1, 1, 1, 1, 1,
0.1524331, -0.3509864, 3.19909, 1, 1, 1, 1, 1,
0.1617358, 0.828287, 0.4072653, 1, 1, 1, 1, 1,
0.1679775, 1.169205, -0.5937854, 1, 1, 1, 1, 1,
0.1686578, -0.1123978, 2.063515, 1, 1, 1, 1, 1,
0.1693428, 0.6480077, -0.8467035, 0, 0, 1, 1, 1,
0.1704347, -0.5679548, 3.450425, 1, 0, 0, 1, 1,
0.1709418, -0.2038293, 2.382081, 1, 0, 0, 1, 1,
0.1771058, 0.2624288, 2.539941, 1, 0, 0, 1, 1,
0.1777369, 0.6449766, 0.3911995, 1, 0, 0, 1, 1,
0.1812609, 0.2047725, 0.6525019, 1, 0, 0, 1, 1,
0.1850393, 0.1898903, 0.6117821, 0, 0, 0, 1, 1,
0.1859263, 0.01239156, 1.922464, 0, 0, 0, 1, 1,
0.1866176, 0.5183164, 1.237296, 0, 0, 0, 1, 1,
0.1868278, 2.282334, -0.3996166, 0, 0, 0, 1, 1,
0.1885548, -1.425473, 3.867102, 0, 0, 0, 1, 1,
0.1979007, -1.565027, 1.889365, 0, 0, 0, 1, 1,
0.2021676, -0.2331175, 3.411581, 0, 0, 0, 1, 1,
0.2025391, -1.601486, 3.473269, 1, 1, 1, 1, 1,
0.2025755, -0.3232684, 5.488528, 1, 1, 1, 1, 1,
0.2059262, -0.1803652, 1.200164, 1, 1, 1, 1, 1,
0.207696, 0.7865342, 2.496465, 1, 1, 1, 1, 1,
0.2098802, -0.2604988, -0.009628637, 1, 1, 1, 1, 1,
0.2207158, -0.6517122, 2.504419, 1, 1, 1, 1, 1,
0.2215758, 0.7239683, -1.238344, 1, 1, 1, 1, 1,
0.2235325, 0.5219594, 2.196926, 1, 1, 1, 1, 1,
0.2282042, -1.31798, 1.847342, 1, 1, 1, 1, 1,
0.2307298, -0.4658283, 3.127793, 1, 1, 1, 1, 1,
0.2323871, -1.55106, 2.458303, 1, 1, 1, 1, 1,
0.2327264, 0.4765339, 0.5686977, 1, 1, 1, 1, 1,
0.2362526, 0.9059812, -0.401476, 1, 1, 1, 1, 1,
0.2368318, -0.264142, 2.112156, 1, 1, 1, 1, 1,
0.2370561, -0.185928, 0.9404588, 1, 1, 1, 1, 1,
0.2448622, 1.035146, -0.3426426, 0, 0, 1, 1, 1,
0.2450065, -0.5764288, 2.235283, 1, 0, 0, 1, 1,
0.247009, -0.6883934, 1.521, 1, 0, 0, 1, 1,
0.2489756, -0.5505518, 2.891742, 1, 0, 0, 1, 1,
0.2496057, 1.038884, 0.3396434, 1, 0, 0, 1, 1,
0.2496169, -0.2179881, 3.757353, 1, 0, 0, 1, 1,
0.2513409, 0.9934822, 0.5251489, 0, 0, 0, 1, 1,
0.2541098, 2.153755, -0.6514395, 0, 0, 0, 1, 1,
0.265951, 2.264651, -0.295259, 0, 0, 0, 1, 1,
0.2663652, -1.994262, 2.70321, 0, 0, 0, 1, 1,
0.2685322, -1.584535, 4.845689, 0, 0, 0, 1, 1,
0.2754843, 0.1505125, 1.175049, 0, 0, 0, 1, 1,
0.2769539, 0.3581188, -0.6647028, 0, 0, 0, 1, 1,
0.2816498, -0.2980977, 1.533432, 1, 1, 1, 1, 1,
0.2888728, 0.2968714, 1.394923, 1, 1, 1, 1, 1,
0.2934811, -0.3117108, 2.166396, 1, 1, 1, 1, 1,
0.2964928, 1.165462, -0.9125529, 1, 1, 1, 1, 1,
0.297186, -0.922039, 1.016511, 1, 1, 1, 1, 1,
0.2977434, 0.6962554, 0.8855863, 1, 1, 1, 1, 1,
0.2987615, -0.2176502, 2.885934, 1, 1, 1, 1, 1,
0.3007763, -1.618027, 2.372269, 1, 1, 1, 1, 1,
0.3017748, 0.9177505, 1.779763, 1, 1, 1, 1, 1,
0.3032487, 0.6608638, 0.3959417, 1, 1, 1, 1, 1,
0.3090283, -0.1691091, 1.223692, 1, 1, 1, 1, 1,
0.3098308, -0.04244539, 0.01140046, 1, 1, 1, 1, 1,
0.3099513, -0.1612938, 3.229656, 1, 1, 1, 1, 1,
0.3126779, 0.958313, -1.736693, 1, 1, 1, 1, 1,
0.3131202, 0.1261335, 0.9122044, 1, 1, 1, 1, 1,
0.3134733, 1.250376, 1.323136, 0, 0, 1, 1, 1,
0.3145495, -1.224426, 1.192394, 1, 0, 0, 1, 1,
0.3156882, -0.5368266, 3.033077, 1, 0, 0, 1, 1,
0.3172004, -0.3101246, 4.321221, 1, 0, 0, 1, 1,
0.3216541, 0.6098095, -0.649295, 1, 0, 0, 1, 1,
0.3259189, -0.1410619, 2.000954, 1, 0, 0, 1, 1,
0.3347666, 1.165471, 0.7643756, 0, 0, 0, 1, 1,
0.3354389, -3.079923, 2.189848, 0, 0, 0, 1, 1,
0.3361583, 0.1713003, 1.387977, 0, 0, 0, 1, 1,
0.3363027, 0.8710794, 2.32453, 0, 0, 0, 1, 1,
0.336684, -0.6578917, 3.248217, 0, 0, 0, 1, 1,
0.3367519, -1.024483, 2.612389, 0, 0, 0, 1, 1,
0.3385296, -1.493777, 3.410617, 0, 0, 0, 1, 1,
0.3421093, 0.8905733, 0.3898689, 1, 1, 1, 1, 1,
0.3459746, 0.2444895, -0.01017204, 1, 1, 1, 1, 1,
0.3460345, 0.6913939, 1.009046, 1, 1, 1, 1, 1,
0.3463063, -0.08611917, 2.269699, 1, 1, 1, 1, 1,
0.3514418, -0.006246006, 1.828961, 1, 1, 1, 1, 1,
0.358883, 0.3462093, 2.619146, 1, 1, 1, 1, 1,
0.3607249, 0.01428376, 2.086552, 1, 1, 1, 1, 1,
0.3648875, -2.007015, 2.510514, 1, 1, 1, 1, 1,
0.3659995, 1.395929, -2.060024, 1, 1, 1, 1, 1,
0.367264, 0.247326, 2.457881, 1, 1, 1, 1, 1,
0.3729455, 0.6120226, -0.6365051, 1, 1, 1, 1, 1,
0.3753098, -0.4426155, 2.035951, 1, 1, 1, 1, 1,
0.3765449, -0.04969992, 3.465228, 1, 1, 1, 1, 1,
0.3770978, -0.8408863, 1.63724, 1, 1, 1, 1, 1,
0.3784284, 0.07234073, 0.2246065, 1, 1, 1, 1, 1,
0.3806205, -0.7389077, 2.63568, 0, 0, 1, 1, 1,
0.3874925, -0.9100814, 3.445689, 1, 0, 0, 1, 1,
0.3983864, 0.9883115, -1.484865, 1, 0, 0, 1, 1,
0.3994222, 0.9690723, 0.3669226, 1, 0, 0, 1, 1,
0.4007296, 0.4367646, 0.558231, 1, 0, 0, 1, 1,
0.400962, -0.01819779, 2.653742, 1, 0, 0, 1, 1,
0.4061185, 0.6942626, 0.981343, 0, 0, 0, 1, 1,
0.4064348, 0.5013613, 0.3586562, 0, 0, 0, 1, 1,
0.4067799, -0.1091639, 1.217533, 0, 0, 0, 1, 1,
0.4085869, 0.6749107, 1.161081, 0, 0, 0, 1, 1,
0.408655, 0.4554179, 0.3988146, 0, 0, 0, 1, 1,
0.4185675, -0.08440522, 0.4099586, 0, 0, 0, 1, 1,
0.4198683, 1.416993, 1.764855, 0, 0, 0, 1, 1,
0.420412, -1.055448, 1.997986, 1, 1, 1, 1, 1,
0.4204404, 0.2036819, 1.407374, 1, 1, 1, 1, 1,
0.4221094, 0.3876275, 0.1283162, 1, 1, 1, 1, 1,
0.4242661, -0.4075736, 2.113499, 1, 1, 1, 1, 1,
0.4248339, -1.066783, 2.263935, 1, 1, 1, 1, 1,
0.4298599, 0.3543414, 0.00678442, 1, 1, 1, 1, 1,
0.4303759, 1.640697, 0.5435595, 1, 1, 1, 1, 1,
0.4316123, -2.196874, 2.015084, 1, 1, 1, 1, 1,
0.4321374, 0.927282, 0.4258616, 1, 1, 1, 1, 1,
0.4362571, 0.3349223, 1.892154, 1, 1, 1, 1, 1,
0.4415527, -0.9134566, 2.067413, 1, 1, 1, 1, 1,
0.4443824, -0.5870575, 2.340972, 1, 1, 1, 1, 1,
0.4480269, -0.8588789, 1.244895, 1, 1, 1, 1, 1,
0.4502469, -0.08567673, 2.388577, 1, 1, 1, 1, 1,
0.4548469, -0.4506599, 2.214912, 1, 1, 1, 1, 1,
0.4618873, -0.4613407, 3.003903, 0, 0, 1, 1, 1,
0.4671434, 0.8911858, -0.5761157, 1, 0, 0, 1, 1,
0.4782488, -0.3174993, 0.5310121, 1, 0, 0, 1, 1,
0.4786606, 0.5600138, 1.647298, 1, 0, 0, 1, 1,
0.4799511, 1.099123, -1.835112, 1, 0, 0, 1, 1,
0.4868505, 0.2327065, 2.267264, 1, 0, 0, 1, 1,
0.4923056, 1.135802, 0.4559238, 0, 0, 0, 1, 1,
0.4975315, -1.325423, 3.414682, 0, 0, 0, 1, 1,
0.5008723, -0.2992835, 2.212982, 0, 0, 0, 1, 1,
0.5026399, 0.1702443, 1.45506, 0, 0, 0, 1, 1,
0.5064536, -1.074385, 2.659602, 0, 0, 0, 1, 1,
0.5105631, 0.5500427, 0.7718124, 0, 0, 0, 1, 1,
0.5122867, 1.249134, 0.5074984, 0, 0, 0, 1, 1,
0.5148182, -0.2130816, 0.247319, 1, 1, 1, 1, 1,
0.5187095, -0.5100386, 3.267103, 1, 1, 1, 1, 1,
0.5213868, 0.1750408, 1.018805, 1, 1, 1, 1, 1,
0.5221117, -1.094928, 2.8042, 1, 1, 1, 1, 1,
0.524291, -1.278515, 2.516321, 1, 1, 1, 1, 1,
0.5259977, 1.222427, 1.442867, 1, 1, 1, 1, 1,
0.5297994, -1.222504, 3.378749, 1, 1, 1, 1, 1,
0.5312642, 1.331672, -2.468441, 1, 1, 1, 1, 1,
0.531288, -1.466581, 2.72342, 1, 1, 1, 1, 1,
0.5335955, -1.377953, 3.698306, 1, 1, 1, 1, 1,
0.5354819, -0.5865909, 2.758909, 1, 1, 1, 1, 1,
0.5358909, -0.151074, 2.430296, 1, 1, 1, 1, 1,
0.5366058, -0.8199072, 2.319462, 1, 1, 1, 1, 1,
0.5382889, -0.05668436, 2.248767, 1, 1, 1, 1, 1,
0.5410396, -0.04129159, 0.2050168, 1, 1, 1, 1, 1,
0.5421985, -0.8917558, 3.095646, 0, 0, 1, 1, 1,
0.548313, -0.01830547, 2.597334, 1, 0, 0, 1, 1,
0.5529824, -0.6476796, 2.331721, 1, 0, 0, 1, 1,
0.556473, -1.5165, 2.018749, 1, 0, 0, 1, 1,
0.5613916, 1.093115, 0.5385448, 1, 0, 0, 1, 1,
0.5674766, -0.2925059, 1.871343, 1, 0, 0, 1, 1,
0.5693477, -1.717298, 4.459127, 0, 0, 0, 1, 1,
0.569806, -0.2707497, 3.039528, 0, 0, 0, 1, 1,
0.5700087, -0.6095777, 0.1888529, 0, 0, 0, 1, 1,
0.5737624, 0.1494736, 1.165291, 0, 0, 0, 1, 1,
0.578198, -0.03278563, 2.535604, 0, 0, 0, 1, 1,
0.5874572, 0.7872902, 1.291244, 0, 0, 0, 1, 1,
0.5889161, -0.07520185, 1.084721, 0, 0, 0, 1, 1,
0.5892436, -0.5532432, 1.275754, 1, 1, 1, 1, 1,
0.5955483, -1.712814, 2.27902, 1, 1, 1, 1, 1,
0.5986449, -0.5778981, 0.6779944, 1, 1, 1, 1, 1,
0.5988784, -0.2323792, 1.520186, 1, 1, 1, 1, 1,
0.6073992, -0.4120514, 2.373637, 1, 1, 1, 1, 1,
0.6106957, 0.6688724, 0.9080349, 1, 1, 1, 1, 1,
0.6137305, 1.06194, 0.9641812, 1, 1, 1, 1, 1,
0.6144784, 0.237079, 1.724346, 1, 1, 1, 1, 1,
0.6172149, -0.4402049, 4.585674, 1, 1, 1, 1, 1,
0.6196565, -0.799652, 3.119283, 1, 1, 1, 1, 1,
0.6204414, 1.463516, -0.4177171, 1, 1, 1, 1, 1,
0.6235372, -1.245767, 3.391265, 1, 1, 1, 1, 1,
0.6300772, 0.4724451, 1.60378, 1, 1, 1, 1, 1,
0.6322029, 1.267467, 1.569323, 1, 1, 1, 1, 1,
0.6324654, 2.379998, -0.3501555, 1, 1, 1, 1, 1,
0.6325473, 0.5445957, 1.458377, 0, 0, 1, 1, 1,
0.6326742, -1.583562, 2.866875, 1, 0, 0, 1, 1,
0.6346384, 0.5915726, 1.868139, 1, 0, 0, 1, 1,
0.635176, 0.5652048, 0.6938397, 1, 0, 0, 1, 1,
0.6374453, -0.4943025, 2.378398, 1, 0, 0, 1, 1,
0.6379345, -0.2644135, 0.7043635, 1, 0, 0, 1, 1,
0.6389616, 0.6527022, 0.5702612, 0, 0, 0, 1, 1,
0.644267, -0.8673112, 1.653587, 0, 0, 0, 1, 1,
0.6458879, 1.716141, 0.4711097, 0, 0, 0, 1, 1,
0.6474879, -2.021403, 1.824563, 0, 0, 0, 1, 1,
0.6491005, -0.5388106, 3.248295, 0, 0, 0, 1, 1,
0.6497468, -0.07821777, 2.3428, 0, 0, 0, 1, 1,
0.6501819, 1.329311, 0.5096834, 0, 0, 0, 1, 1,
0.6515341, 0.443593, 1.426158, 1, 1, 1, 1, 1,
0.6555247, -0.1336354, 2.806954, 1, 1, 1, 1, 1,
0.6581421, -2.256137, 4.044189, 1, 1, 1, 1, 1,
0.6599215, -1.545384, 2.65712, 1, 1, 1, 1, 1,
0.6599541, 0.08493073, 2.814138, 1, 1, 1, 1, 1,
0.6674091, -1.64779, 3.042605, 1, 1, 1, 1, 1,
0.6683065, -0.3944679, 1.900578, 1, 1, 1, 1, 1,
0.671223, 0.9226797, 0.8971465, 1, 1, 1, 1, 1,
0.6736068, -0.253601, -0.203086, 1, 1, 1, 1, 1,
0.6809127, 0.1897501, 2.632545, 1, 1, 1, 1, 1,
0.6873349, 1.378579, -0.7489237, 1, 1, 1, 1, 1,
0.6959947, 0.4723548, 0.3136353, 1, 1, 1, 1, 1,
0.6988444, -0.08515198, 2.887285, 1, 1, 1, 1, 1,
0.7025397, 1.235437, 1.227359, 1, 1, 1, 1, 1,
0.7163181, 1.901553, -0.2567557, 1, 1, 1, 1, 1,
0.7168151, -0.2742125, 0.991579, 0, 0, 1, 1, 1,
0.7176473, 0.4777504, -0.0596957, 1, 0, 0, 1, 1,
0.7232565, 0.851423, 1.397303, 1, 0, 0, 1, 1,
0.7242253, 0.06971637, 2.428209, 1, 0, 0, 1, 1,
0.7278586, -0.9335918, 2.222206, 1, 0, 0, 1, 1,
0.7317886, -0.8932082, 1.672397, 1, 0, 0, 1, 1,
0.733249, 0.08220504, 1.817351, 0, 0, 0, 1, 1,
0.7354921, -1.67672, 1.837197, 0, 0, 0, 1, 1,
0.7446918, 0.6660045, 1.179475, 0, 0, 0, 1, 1,
0.7455274, 1.330626, 1.977633, 0, 0, 0, 1, 1,
0.7457773, 1.572683, -0.4004441, 0, 0, 0, 1, 1,
0.7506468, -0.6435497, 0.9395223, 0, 0, 0, 1, 1,
0.75179, -0.8165538, 2.649495, 0, 0, 0, 1, 1,
0.7532629, 0.1685773, 1.606871, 1, 1, 1, 1, 1,
0.7667, -0.6542305, 1.742361, 1, 1, 1, 1, 1,
0.7675948, -1.392427, 2.213631, 1, 1, 1, 1, 1,
0.7720469, 2.453611, 0.195962, 1, 1, 1, 1, 1,
0.7721597, 1.229912, 0.2076295, 1, 1, 1, 1, 1,
0.7782946, 0.3951219, 0.8619679, 1, 1, 1, 1, 1,
0.7801003, 0.4044652, 2.64113, 1, 1, 1, 1, 1,
0.7817252, 0.003007137, 1.146817, 1, 1, 1, 1, 1,
0.7842519, 0.4670592, 0.7949346, 1, 1, 1, 1, 1,
0.7896435, -0.9427278, 2.743396, 1, 1, 1, 1, 1,
0.8005062, 0.5207679, 1.576192, 1, 1, 1, 1, 1,
0.8108525, -0.6783963, 3.517483, 1, 1, 1, 1, 1,
0.8116795, 1.825625, 0.2215346, 1, 1, 1, 1, 1,
0.812234, 0.9862662, 0.5070705, 1, 1, 1, 1, 1,
0.8130421, -0.7286251, 3.012141, 1, 1, 1, 1, 1,
0.8141316, 0.178662, 1.775444, 0, 0, 1, 1, 1,
0.8203234, -0.5814337, 3.587594, 1, 0, 0, 1, 1,
0.828074, -0.01483626, 0.7717617, 1, 0, 0, 1, 1,
0.8299714, 1.131982, 0.9905062, 1, 0, 0, 1, 1,
0.8299935, 1.840653, 0.4667492, 1, 0, 0, 1, 1,
0.835312, 0.6437472, 0.03893205, 1, 0, 0, 1, 1,
0.8357293, 1.44894, -0.03905385, 0, 0, 0, 1, 1,
0.8362207, 0.6094846, 0.4344234, 0, 0, 0, 1, 1,
0.8435265, 1.465444, 0.9374853, 0, 0, 0, 1, 1,
0.8437755, -1.489213, 1.22419, 0, 0, 0, 1, 1,
0.8515003, 0.6519771, -0.3209664, 0, 0, 0, 1, 1,
0.8610752, -0.4867792, -0.260466, 0, 0, 0, 1, 1,
0.8631155, 2.1641, 0.04078332, 0, 0, 0, 1, 1,
0.8678228, -0.746362, 1.054053, 1, 1, 1, 1, 1,
0.8685352, -1.477417, 2.476947, 1, 1, 1, 1, 1,
0.8692226, 0.1127195, 3.295664, 1, 1, 1, 1, 1,
0.8716694, -0.4515537, 2.839103, 1, 1, 1, 1, 1,
0.8724652, 1.165857, 1.384622, 1, 1, 1, 1, 1,
0.8745889, -0.1137868, 2.56171, 1, 1, 1, 1, 1,
0.8789951, 1.091773, 0.7069172, 1, 1, 1, 1, 1,
0.883279, 0.7676754, 1.921805, 1, 1, 1, 1, 1,
0.884042, -0.5055714, 1.365698, 1, 1, 1, 1, 1,
0.8858786, -0.1451463, 0.7224284, 1, 1, 1, 1, 1,
0.8876938, -0.3651196, 3.651167, 1, 1, 1, 1, 1,
0.8906816, 0.5483366, 1.288369, 1, 1, 1, 1, 1,
0.8909493, 0.08094055, -0.009464245, 1, 1, 1, 1, 1,
0.8963906, -1.747443, 1.470108, 1, 1, 1, 1, 1,
0.8986371, -0.4619587, 0.7155483, 1, 1, 1, 1, 1,
0.8986615, 0.03608353, 1.055735, 0, 0, 1, 1, 1,
0.9042795, 0.1260867, 1.466498, 1, 0, 0, 1, 1,
0.906995, -0.1445863, 1.242902, 1, 0, 0, 1, 1,
0.9167529, 0.8506756, 0.18486, 1, 0, 0, 1, 1,
0.91838, -0.4338778, 1.515147, 1, 0, 0, 1, 1,
0.9205357, 0.996936, 0.5342373, 1, 0, 0, 1, 1,
0.9210743, -1.592281, 1.762663, 0, 0, 0, 1, 1,
0.9214233, 1.412188, 0.02915395, 0, 0, 0, 1, 1,
0.9250816, -0.896679, 1.659974, 0, 0, 0, 1, 1,
0.9282116, 0.1408882, 2.159587, 0, 0, 0, 1, 1,
0.9325116, -0.2055038, 0.2288661, 0, 0, 0, 1, 1,
0.9327952, -1.04497, 3.894087, 0, 0, 0, 1, 1,
0.9349401, -1.856126, 2.744379, 0, 0, 0, 1, 1,
0.935228, 0.9459895, 1.294542, 1, 1, 1, 1, 1,
0.9356673, -0.3545578, -0.7381769, 1, 1, 1, 1, 1,
0.9363679, -0.5907673, 2.557217, 1, 1, 1, 1, 1,
0.9394299, -2.281366, 3.551476, 1, 1, 1, 1, 1,
0.944032, -0.5526396, 3.584134, 1, 1, 1, 1, 1,
0.9440426, -0.8773078, 3.019383, 1, 1, 1, 1, 1,
0.9475176, -1.698635, 2.68735, 1, 1, 1, 1, 1,
0.9609097, -1.12375, 3.572965, 1, 1, 1, 1, 1,
0.9619713, 0.1211831, 0.8584289, 1, 1, 1, 1, 1,
0.9666314, 1.85466, 1.707122, 1, 1, 1, 1, 1,
0.9684699, -0.5843559, 0.8102835, 1, 1, 1, 1, 1,
0.972227, 0.04622881, 3.587275, 1, 1, 1, 1, 1,
0.9729535, 0.4408865, 2.236311, 1, 1, 1, 1, 1,
0.9770871, -2.305549, 2.074079, 1, 1, 1, 1, 1,
0.9818652, 0.1533313, 0.9422969, 1, 1, 1, 1, 1,
0.9878064, 1.295183, 1.729796, 0, 0, 1, 1, 1,
0.9889054, 0.2472021, 2.089805, 1, 0, 0, 1, 1,
1.000654, 0.9887537, 0.5722226, 1, 0, 0, 1, 1,
1.001952, 0.7142142, 1.164913, 1, 0, 0, 1, 1,
1.003449, -0.2127178, 0.9531829, 1, 0, 0, 1, 1,
1.004201, 0.409716, 0.7408901, 1, 0, 0, 1, 1,
1.010842, -0.5462832, 2.901091, 0, 0, 0, 1, 1,
1.012465, 0.2562891, 1.694147, 0, 0, 0, 1, 1,
1.015095, 0.3068783, 0.9217575, 0, 0, 0, 1, 1,
1.018923, -1.409828, 2.801462, 0, 0, 0, 1, 1,
1.022108, 1.346945, 2.173679, 0, 0, 0, 1, 1,
1.031788, -0.3026759, 1.552496, 0, 0, 0, 1, 1,
1.033756, 1.334059, 0.9125084, 0, 0, 0, 1, 1,
1.03524, 1.132839, 0.5151861, 1, 1, 1, 1, 1,
1.042623, 1.346124, 1.030676, 1, 1, 1, 1, 1,
1.04531, -0.1048192, 1.051988, 1, 1, 1, 1, 1,
1.04972, -0.8191285, 1.36429, 1, 1, 1, 1, 1,
1.053563, 1.417084, 0.5804278, 1, 1, 1, 1, 1,
1.061947, -1.095914, 2.051411, 1, 1, 1, 1, 1,
1.063783, 0.8042694, 0.5875559, 1, 1, 1, 1, 1,
1.068599, -0.2386827, 2.624924, 1, 1, 1, 1, 1,
1.070045, 0.8584986, 0.9256615, 1, 1, 1, 1, 1,
1.081098, -1.604527, 1.644366, 1, 1, 1, 1, 1,
1.089568, -0.3027279, 2.467438, 1, 1, 1, 1, 1,
1.089622, -0.1343389, 1.533244, 1, 1, 1, 1, 1,
1.090074, -0.3995391, 1.712638, 1, 1, 1, 1, 1,
1.090453, 1.946374, 1.873487, 1, 1, 1, 1, 1,
1.126823, 1.848632, 1.450232, 1, 1, 1, 1, 1,
1.128618, -0.6636209, 1.197701, 0, 0, 1, 1, 1,
1.129631, 0.7924308, 1.219237, 1, 0, 0, 1, 1,
1.133434, 1.193851, 0.8627388, 1, 0, 0, 1, 1,
1.134461, -0.4030514, 1.221827, 1, 0, 0, 1, 1,
1.134564, -0.08818502, 1.373106, 1, 0, 0, 1, 1,
1.142992, 0.2357265, 0.3922542, 1, 0, 0, 1, 1,
1.149846, 0.9236555, 0.7337905, 0, 0, 0, 1, 1,
1.154833, -0.3944752, 2.516216, 0, 0, 0, 1, 1,
1.155245, -0.4405798, 0.1262705, 0, 0, 0, 1, 1,
1.172059, -1.886139, 1.953624, 0, 0, 0, 1, 1,
1.183228, 0.3557638, 0.7223104, 0, 0, 0, 1, 1,
1.186549, 0.6264094, 0.3116381, 0, 0, 0, 1, 1,
1.186666, -0.7350271, 2.345819, 0, 0, 0, 1, 1,
1.190663, -0.1241511, 1.763872, 1, 1, 1, 1, 1,
1.197023, -1.06736, 3.169229, 1, 1, 1, 1, 1,
1.198545, -0.5566747, 3.787743, 1, 1, 1, 1, 1,
1.201426, 0.2891613, 2.913346, 1, 1, 1, 1, 1,
1.204065, -0.5578856, 0.4744529, 1, 1, 1, 1, 1,
1.209691, 0.05540374, 3.635775, 1, 1, 1, 1, 1,
1.214583, -0.9358484, 1.62664, 1, 1, 1, 1, 1,
1.21909, -0.4540259, 1.772468, 1, 1, 1, 1, 1,
1.222139, 0.4755914, 1.732745, 1, 1, 1, 1, 1,
1.225773, 0.9544229, 1.118838, 1, 1, 1, 1, 1,
1.226039, -1.637933, 2.60513, 1, 1, 1, 1, 1,
1.236241, 0.6975443, 1.892277, 1, 1, 1, 1, 1,
1.245268, 0.5744719, 0.2536005, 1, 1, 1, 1, 1,
1.249273, -0.1154429, 1.477, 1, 1, 1, 1, 1,
1.26414, 0.06590837, 0.7765666, 1, 1, 1, 1, 1,
1.264872, -1.093485, 2.541034, 0, 0, 1, 1, 1,
1.266691, -0.04798574, 0.0788043, 1, 0, 0, 1, 1,
1.267723, -0.8707061, 2.372769, 1, 0, 0, 1, 1,
1.274607, -0.2232958, 0.9599708, 1, 0, 0, 1, 1,
1.279616, 0.4666066, -0.1198109, 1, 0, 0, 1, 1,
1.286544, 0.854074, 0.8323571, 1, 0, 0, 1, 1,
1.286754, -0.02402438, 0.6856023, 0, 0, 0, 1, 1,
1.287359, -1.241743, 2.37516, 0, 0, 0, 1, 1,
1.295859, 0.3752176, 0.5580308, 0, 0, 0, 1, 1,
1.297282, -0.9133927, 2.624609, 0, 0, 0, 1, 1,
1.299793, 0.4247629, 1.867356, 0, 0, 0, 1, 1,
1.304328, -1.940127, 1.734168, 0, 0, 0, 1, 1,
1.307119, -1.098244, 0.856622, 0, 0, 0, 1, 1,
1.308271, 0.2417728, -0.3653444, 1, 1, 1, 1, 1,
1.308807, 0.01722736, 1.334349, 1, 1, 1, 1, 1,
1.310902, 0.9523091, 0.4939882, 1, 1, 1, 1, 1,
1.31234, 0.1665438, 1.655034, 1, 1, 1, 1, 1,
1.317121, 0.6898205, 0.4621783, 1, 1, 1, 1, 1,
1.317381, -0.2886975, 3.224662, 1, 1, 1, 1, 1,
1.323239, -0.7868541, 2.40029, 1, 1, 1, 1, 1,
1.337781, 0.2940479, 1.005021, 1, 1, 1, 1, 1,
1.343531, 1.124291, 1.800311, 1, 1, 1, 1, 1,
1.34566, -1.480453, 3.196811, 1, 1, 1, 1, 1,
1.354475, 0.1730711, 1.608914, 1, 1, 1, 1, 1,
1.367823, -0.897286, 0.4142127, 1, 1, 1, 1, 1,
1.368703, 0.3563794, 1.4488, 1, 1, 1, 1, 1,
1.385556, -0.8922165, 1.000504, 1, 1, 1, 1, 1,
1.39056, 0.3120111, 2.074561, 1, 1, 1, 1, 1,
1.403779, -1.365255, 2.279581, 0, 0, 1, 1, 1,
1.413071, -0.3035676, 1.739906, 1, 0, 0, 1, 1,
1.442526, 1.353809, 0.2156777, 1, 0, 0, 1, 1,
1.443851, 0.5850897, 2.827711, 1, 0, 0, 1, 1,
1.444857, 0.4532394, -0.05577036, 1, 0, 0, 1, 1,
1.445185, 1.196102, 1.373764, 1, 0, 0, 1, 1,
1.445995, 0.2629878, 0.518836, 0, 0, 0, 1, 1,
1.449033, -0.8437513, 2.061577, 0, 0, 0, 1, 1,
1.449381, -0.4003079, 4.044141, 0, 0, 0, 1, 1,
1.461782, -0.6131423, 3.233629, 0, 0, 0, 1, 1,
1.463469, -1.184789, 1.047915, 0, 0, 0, 1, 1,
1.470495, -0.2972422, 2.477954, 0, 0, 0, 1, 1,
1.479068, 0.6119047, 2.801088, 0, 0, 0, 1, 1,
1.479312, -0.131386, 2.930331, 1, 1, 1, 1, 1,
1.479819, -0.1441967, 1.139533, 1, 1, 1, 1, 1,
1.488886, -1.335745, 0.9708582, 1, 1, 1, 1, 1,
1.498728, 1.200653, 0.1085151, 1, 1, 1, 1, 1,
1.505556, -0.7141206, 2.57006, 1, 1, 1, 1, 1,
1.514286, 0.4696868, -1.925483, 1, 1, 1, 1, 1,
1.515689, -1.100773, 2.219334, 1, 1, 1, 1, 1,
1.516176, -0.2815927, 0.5190813, 1, 1, 1, 1, 1,
1.530983, -0.5391004, 2.393127, 1, 1, 1, 1, 1,
1.543054, -2.098346, 2.712266, 1, 1, 1, 1, 1,
1.547093, -1.601512, 4.606167, 1, 1, 1, 1, 1,
1.556502, -0.2067182, 1.231188, 1, 1, 1, 1, 1,
1.565657, -0.2523618, 1.420023, 1, 1, 1, 1, 1,
1.567009, 0.59386, -0.597491, 1, 1, 1, 1, 1,
1.595899, -1.372784, 1.230204, 1, 1, 1, 1, 1,
1.601797, -1.735765, 3.880919, 0, 0, 1, 1, 1,
1.60955, 0.9647992, -0.547648, 1, 0, 0, 1, 1,
1.609934, 1.088947, 2.501547, 1, 0, 0, 1, 1,
1.611166, 0.5492629, 1.495809, 1, 0, 0, 1, 1,
1.611398, 0.355391, -0.3857773, 1, 0, 0, 1, 1,
1.656386, 0.2580687, 1.439126, 1, 0, 0, 1, 1,
1.656654, -2.021939, 2.523628, 0, 0, 0, 1, 1,
1.691613, 0.1319469, 1.163879, 0, 0, 0, 1, 1,
1.705071, 0.05684596, 2.379803, 0, 0, 0, 1, 1,
1.709158, -0.08028725, 1.638524, 0, 0, 0, 1, 1,
1.711882, -0.6307405, 1.708547, 0, 0, 0, 1, 1,
1.723421, -0.9506229, 3.830397, 0, 0, 0, 1, 1,
1.731865, 0.4621108, 2.5588, 0, 0, 0, 1, 1,
1.748643, -0.04071889, 1.895325, 1, 1, 1, 1, 1,
1.763103, 1.935901, 1.226359, 1, 1, 1, 1, 1,
1.767518, 1.251373, 1.488556, 1, 1, 1, 1, 1,
1.776739, 0.2706808, 0.2484004, 1, 1, 1, 1, 1,
1.788278, 0.3031098, 2.053844, 1, 1, 1, 1, 1,
1.796712, 0.259914, 2.513983, 1, 1, 1, 1, 1,
1.811509, -1.735787, 2.662361, 1, 1, 1, 1, 1,
1.82112, 0.2857362, 0.6157165, 1, 1, 1, 1, 1,
1.82963, 2.968407, 1.310074, 1, 1, 1, 1, 1,
1.846483, -0.4730715, 2.309101, 1, 1, 1, 1, 1,
1.848468, 1.006937, 2.301653, 1, 1, 1, 1, 1,
1.879375, 0.1381663, 1.767758, 1, 1, 1, 1, 1,
1.880508, 3.795464, -0.3385991, 1, 1, 1, 1, 1,
1.918516, -0.0169876, 3.646875, 1, 1, 1, 1, 1,
1.930155, 0.5543839, 1.03915, 1, 1, 1, 1, 1,
1.975662, 0.3703466, 1.266759, 0, 0, 1, 1, 1,
1.986178, -0.3511156, 1.18801, 1, 0, 0, 1, 1,
2.028501, -0.2340267, 2.214236, 1, 0, 0, 1, 1,
2.042882, -1.784823, 2.076923, 1, 0, 0, 1, 1,
2.050187, -0.6806017, 3.77057, 1, 0, 0, 1, 1,
2.052595, 0.1155767, 0.9584225, 1, 0, 0, 1, 1,
2.092172, -0.1308752, 2.042186, 0, 0, 0, 1, 1,
2.125565, 0.3718413, 2.228546, 0, 0, 0, 1, 1,
2.134376, -1.189456, 2.976846, 0, 0, 0, 1, 1,
2.155265, 0.5810562, -0.006207224, 0, 0, 0, 1, 1,
2.191256, -1.719422, 1.209187, 0, 0, 0, 1, 1,
2.226174, 1.683905, 0.4390959, 0, 0, 0, 1, 1,
2.256312, -0.9420492, 2.672015, 0, 0, 0, 1, 1,
2.281762, 0.3592934, -1.859172, 1, 1, 1, 1, 1,
2.316959, -2.038909, 2.168784, 1, 1, 1, 1, 1,
2.54976, -1.707532, 1.976595, 1, 1, 1, 1, 1,
2.659255, 0.9147966, 1.410324, 1, 1, 1, 1, 1,
2.849474, -0.08862717, 1.312846, 1, 1, 1, 1, 1,
3.103964, 0.1172868, 0.8152447, 1, 1, 1, 1, 1,
3.29722, 1.742446, 0.9661074, 1, 1, 1, 1, 1
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
var radius = 9.958226;
var distance = 34.97784;
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
mvMatrix.translate( -0.1136584, -0.3577707, 0.2017834 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.97784);
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
