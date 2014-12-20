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
-2.983161, -0.4605327, -2.776444, 1, 0, 0, 1,
-2.741446, 0.59084, -0.1558272, 1, 0.007843138, 0, 1,
-2.702075, 0.02737208, -0.8978912, 1, 0.01176471, 0, 1,
-2.628065, 0.6599724, -0.762447, 1, 0.01960784, 0, 1,
-2.60706, -1.041282, -2.884549, 1, 0.02352941, 0, 1,
-2.566899, -0.5207075, -1.303822, 1, 0.03137255, 0, 1,
-2.529538, -1.10016, -2.157369, 1, 0.03529412, 0, 1,
-2.409748, -0.8119453, -2.397878, 1, 0.04313726, 0, 1,
-2.311002, 0.2189656, -3.248775, 1, 0.04705882, 0, 1,
-2.244638, -0.02060139, -2.713245, 1, 0.05490196, 0, 1,
-2.241482, -2.569535, -3.746075, 1, 0.05882353, 0, 1,
-2.142587, 0.1650012, -1.750685, 1, 0.06666667, 0, 1,
-2.041174, -1.292248, -5.315689, 1, 0.07058824, 0, 1,
-2.017795, 1.091744, -1.014238, 1, 0.07843138, 0, 1,
-1.992999, -0.8746827, -2.382663, 1, 0.08235294, 0, 1,
-1.96023, 0.310472, -1.716189, 1, 0.09019608, 0, 1,
-1.954034, 0.7654744, -0.5083919, 1, 0.09411765, 0, 1,
-1.940081, -0.4960696, -2.911308, 1, 0.1019608, 0, 1,
-1.912136, -0.4522738, -2.115369, 1, 0.1098039, 0, 1,
-1.91021, -0.4130707, -1.761342, 1, 0.1137255, 0, 1,
-1.885876, -1.158951, -2.43845, 1, 0.1215686, 0, 1,
-1.864363, 0.3185258, -2.750308, 1, 0.1254902, 0, 1,
-1.864266, -0.6040815, -0.8258831, 1, 0.1333333, 0, 1,
-1.852534, 1.236493, -0.6865603, 1, 0.1372549, 0, 1,
-1.85025, 0.7807546, -1.148059, 1, 0.145098, 0, 1,
-1.838382, 0.3793968, -2.423905, 1, 0.1490196, 0, 1,
-1.818288, -1.632915, -4.072991, 1, 0.1568628, 0, 1,
-1.793276, 0.9350223, -1.558363, 1, 0.1607843, 0, 1,
-1.771531, -0.800963, -2.265825, 1, 0.1686275, 0, 1,
-1.769826, -1.940103, -2.500714, 1, 0.172549, 0, 1,
-1.760687, 1.909011, 0.01487105, 1, 0.1803922, 0, 1,
-1.750351, -0.7560623, -2.618058, 1, 0.1843137, 0, 1,
-1.749707, -0.1762206, -3.101745, 1, 0.1921569, 0, 1,
-1.748003, -0.7266585, -1.290446, 1, 0.1960784, 0, 1,
-1.7169, -0.3137134, -2.789852, 1, 0.2039216, 0, 1,
-1.695155, -0.7104197, -2.623997, 1, 0.2117647, 0, 1,
-1.691549, 0.5937393, 0.2402864, 1, 0.2156863, 0, 1,
-1.688933, -0.5169792, -2.001538, 1, 0.2235294, 0, 1,
-1.687698, 1.811044, -1.682592, 1, 0.227451, 0, 1,
-1.680454, 0.02797562, -0.2231781, 1, 0.2352941, 0, 1,
-1.680202, -0.5964285, -2.417053, 1, 0.2392157, 0, 1,
-1.654113, -0.687229, -2.708147, 1, 0.2470588, 0, 1,
-1.648892, -0.8226487, -1.342144, 1, 0.2509804, 0, 1,
-1.647297, -0.800378, -3.371001, 1, 0.2588235, 0, 1,
-1.629605, 0.6676887, -0.288067, 1, 0.2627451, 0, 1,
-1.624521, 0.5996883, -0.7676785, 1, 0.2705882, 0, 1,
-1.619484, -0.04607864, -0.5448806, 1, 0.2745098, 0, 1,
-1.609053, -1.667673, -2.519521, 1, 0.282353, 0, 1,
-1.599845, 0.3046751, -1.552112, 1, 0.2862745, 0, 1,
-1.585606, -0.6335465, -0.5228265, 1, 0.2941177, 0, 1,
-1.582846, -0.6280634, -3.046996, 1, 0.3019608, 0, 1,
-1.557368, -0.5633692, -1.251033, 1, 0.3058824, 0, 1,
-1.556642, 2.020017, -0.8751847, 1, 0.3137255, 0, 1,
-1.547094, -0.275208, -0.9538416, 1, 0.3176471, 0, 1,
-1.546225, -1.477292, -1.148372, 1, 0.3254902, 0, 1,
-1.534564, -0.1302672, -1.570457, 1, 0.3294118, 0, 1,
-1.531801, -2.341943, -3.891862, 1, 0.3372549, 0, 1,
-1.507343, 2.529636, 1.284249, 1, 0.3411765, 0, 1,
-1.505409, 1.510396, -0.7145892, 1, 0.3490196, 0, 1,
-1.49374, -2.214165, -4.668669, 1, 0.3529412, 0, 1,
-1.4931, -0.2372921, -3.871246, 1, 0.3607843, 0, 1,
-1.488987, -0.7978078, -0.4759763, 1, 0.3647059, 0, 1,
-1.48038, 0.6515813, 0.1815717, 1, 0.372549, 0, 1,
-1.471767, 1.451403, -1.87429, 1, 0.3764706, 0, 1,
-1.466298, -0.6150816, -2.646458, 1, 0.3843137, 0, 1,
-1.464034, 1.831711, -1.532965, 1, 0.3882353, 0, 1,
-1.45904, 0.5120074, -2.520178, 1, 0.3960784, 0, 1,
-1.454649, 0.08950522, -0.4353735, 1, 0.4039216, 0, 1,
-1.450267, -1.512355, -1.220444, 1, 0.4078431, 0, 1,
-1.448928, 0.7174547, -2.390488, 1, 0.4156863, 0, 1,
-1.447181, -0.3528836, -2.628295, 1, 0.4196078, 0, 1,
-1.446668, -0.3046985, -1.18486, 1, 0.427451, 0, 1,
-1.443779, -0.9778088, -0.6348144, 1, 0.4313726, 0, 1,
-1.4293, 1.505744, -0.1530968, 1, 0.4392157, 0, 1,
-1.40585, -1.146462, -1.510689, 1, 0.4431373, 0, 1,
-1.399596, -0.1074982, -2.599063, 1, 0.4509804, 0, 1,
-1.399423, -1.178489, -3.576906, 1, 0.454902, 0, 1,
-1.39269, -0.9468333, -4.269234, 1, 0.4627451, 0, 1,
-1.376258, 1.172058, -1.530805, 1, 0.4666667, 0, 1,
-1.369656, -0.4549479, -0.6522076, 1, 0.4745098, 0, 1,
-1.362514, -0.6812519, -1.866667, 1, 0.4784314, 0, 1,
-1.360343, 0.08509732, -0.02362655, 1, 0.4862745, 0, 1,
-1.345409, 0.2893275, -1.034397, 1, 0.4901961, 0, 1,
-1.338449, 1.943333, 0.8913392, 1, 0.4980392, 0, 1,
-1.331525, 0.7774489, -0.8889813, 1, 0.5058824, 0, 1,
-1.326823, -0.1884824, -0.9246403, 1, 0.509804, 0, 1,
-1.315968, 0.01784863, 1.204381, 1, 0.5176471, 0, 1,
-1.300532, 0.432572, -3.312564, 1, 0.5215687, 0, 1,
-1.298157, 0.2985975, -2.691152, 1, 0.5294118, 0, 1,
-1.294285, 0.9371238, -0.3033155, 1, 0.5333334, 0, 1,
-1.291631, -0.4338951, -2.757347, 1, 0.5411765, 0, 1,
-1.289768, -0.9667682, -2.039468, 1, 0.5450981, 0, 1,
-1.275901, -1.168392, -3.114611, 1, 0.5529412, 0, 1,
-1.272892, 0.9986522, -0.6826649, 1, 0.5568628, 0, 1,
-1.268143, -1.173329, -1.302935, 1, 0.5647059, 0, 1,
-1.264147, -0.785916, -1.358945, 1, 0.5686275, 0, 1,
-1.258967, -0.7798695, -1.700267, 1, 0.5764706, 0, 1,
-1.255877, -1.06156, -2.803612, 1, 0.5803922, 0, 1,
-1.252218, -0.5344877, -2.404366, 1, 0.5882353, 0, 1,
-1.249918, 0.2910818, -1.854033, 1, 0.5921569, 0, 1,
-1.249608, -1.224631, -3.069948, 1, 0.6, 0, 1,
-1.246963, -0.06437287, -1.611569, 1, 0.6078432, 0, 1,
-1.237893, -0.493683, -1.604082, 1, 0.6117647, 0, 1,
-1.237363, -1.73821, -3.913997, 1, 0.6196079, 0, 1,
-1.219066, -0.01743769, -0.8168638, 1, 0.6235294, 0, 1,
-1.21434, -1.656656, -2.218967, 1, 0.6313726, 0, 1,
-1.209787, -1.2848, -3.777179, 1, 0.6352941, 0, 1,
-1.203699, -1.147165, -0.2205173, 1, 0.6431373, 0, 1,
-1.195358, -0.3303418, -1.9181, 1, 0.6470588, 0, 1,
-1.191681, -0.4388255, -3.036597, 1, 0.654902, 0, 1,
-1.187485, -1.945687, -3.666998, 1, 0.6588235, 0, 1,
-1.186852, 0.2659713, -2.373969, 1, 0.6666667, 0, 1,
-1.157386, 1.19701, 0.3379797, 1, 0.6705883, 0, 1,
-1.155152, 0.8815463, -2.105134, 1, 0.6784314, 0, 1,
-1.139431, -0.3117786, -1.121629, 1, 0.682353, 0, 1,
-1.122996, 0.909551, 0.70698, 1, 0.6901961, 0, 1,
-1.12194, 0.2368864, -0.02156224, 1, 0.6941177, 0, 1,
-1.117097, -0.1388685, -0.7258714, 1, 0.7019608, 0, 1,
-1.113651, -1.207, -0.5876583, 1, 0.7098039, 0, 1,
-1.112232, -0.6765601, -3.539747, 1, 0.7137255, 0, 1,
-1.111255, -1.132037, -1.984464, 1, 0.7215686, 0, 1,
-1.10906, 0.3965622, -1.314912, 1, 0.7254902, 0, 1,
-1.10643, 0.08977291, -2.242818, 1, 0.7333333, 0, 1,
-1.103823, -0.3764907, -1.161228, 1, 0.7372549, 0, 1,
-1.102433, 0.1042928, -0.9368423, 1, 0.7450981, 0, 1,
-1.092027, -0.549086, -0.7169919, 1, 0.7490196, 0, 1,
-1.088665, 0.7760375, -1.483648, 1, 0.7568628, 0, 1,
-1.081724, -2.049772, -3.036755, 1, 0.7607843, 0, 1,
-1.073464, 0.6114184, -1.732979, 1, 0.7686275, 0, 1,
-1.068821, -1.727298, -3.071749, 1, 0.772549, 0, 1,
-1.067762, 1.466376, -0.3689905, 1, 0.7803922, 0, 1,
-1.062963, 0.9828598, -0.4859923, 1, 0.7843137, 0, 1,
-1.055992, -1.18597, -2.338498, 1, 0.7921569, 0, 1,
-1.051939, -0.09074717, -1.600996, 1, 0.7960784, 0, 1,
-1.048144, 2.075372, -0.6654385, 1, 0.8039216, 0, 1,
-1.03284, 0.2342112, -0.9735261, 1, 0.8117647, 0, 1,
-1.03262, -1.029638, -4.348312, 1, 0.8156863, 0, 1,
-1.029482, -0.7986091, -3.654092, 1, 0.8235294, 0, 1,
-1.026648, 1.172654, -1.362292, 1, 0.827451, 0, 1,
-1.025333, -0.4940321, -2.983151, 1, 0.8352941, 0, 1,
-1.010093, -0.4826788, -4.803206, 1, 0.8392157, 0, 1,
-1.008537, -1.071073, -3.200324, 1, 0.8470588, 0, 1,
-1.006621, -0.3231606, -2.580865, 1, 0.8509804, 0, 1,
-1.003908, 0.1014646, -1.902228, 1, 0.8588235, 0, 1,
-1.003733, 0.6994961, -0.6225531, 1, 0.8627451, 0, 1,
-0.9986032, 1.720408, -1.195947, 1, 0.8705882, 0, 1,
-0.9977196, -0.4596437, -2.372581, 1, 0.8745098, 0, 1,
-0.9916098, 0.3756841, 1.13849, 1, 0.8823529, 0, 1,
-0.9909631, 0.8157809, -1.068874, 1, 0.8862745, 0, 1,
-0.9842528, 1.35406, -2.7524, 1, 0.8941177, 0, 1,
-0.9818974, 0.3620354, 0.04808907, 1, 0.8980392, 0, 1,
-0.9799981, -0.5653821, -1.701675, 1, 0.9058824, 0, 1,
-0.9751934, -0.2371047, -2.986904, 1, 0.9137255, 0, 1,
-0.9750451, -1.217542, -1.392825, 1, 0.9176471, 0, 1,
-0.9703117, 0.05922295, -1.642249, 1, 0.9254902, 0, 1,
-0.9637039, 0.3306178, -1.818255, 1, 0.9294118, 0, 1,
-0.9611313, -1.758542, -3.511795, 1, 0.9372549, 0, 1,
-0.9484122, -0.199487, -1.538766, 1, 0.9411765, 0, 1,
-0.948231, -0.5690368, -0.2094322, 1, 0.9490196, 0, 1,
-0.9445381, 0.1898292, -1.624992, 1, 0.9529412, 0, 1,
-0.9440434, 1.30435, -2.064894, 1, 0.9607843, 0, 1,
-0.939486, -1.082304, -3.403016, 1, 0.9647059, 0, 1,
-0.9352098, -0.6725937, -1.775168, 1, 0.972549, 0, 1,
-0.929471, -2.272966, -2.711456, 1, 0.9764706, 0, 1,
-0.9159769, 1.009746, -0.4704265, 1, 0.9843137, 0, 1,
-0.9086984, -1.805399, -1.933525, 1, 0.9882353, 0, 1,
-0.9017661, -0.527014, -2.266594, 1, 0.9960784, 0, 1,
-0.8921874, -1.647412, -1.685524, 0.9960784, 1, 0, 1,
-0.8872209, 1.728446, -1.557642, 0.9921569, 1, 0, 1,
-0.8837207, 0.8906813, -2.213819, 0.9843137, 1, 0, 1,
-0.8804808, -0.148925, -0.7967086, 0.9803922, 1, 0, 1,
-0.8768024, 0.4888378, -1.512017, 0.972549, 1, 0, 1,
-0.8573255, 0.494104, -0.5512137, 0.9686275, 1, 0, 1,
-0.8501739, -0.5429586, -2.738876, 0.9607843, 1, 0, 1,
-0.841482, -0.6326828, -2.060459, 0.9568627, 1, 0, 1,
-0.8380609, -0.3913821, -1.155125, 0.9490196, 1, 0, 1,
-0.8375985, -0.1759689, -2.043906, 0.945098, 1, 0, 1,
-0.8363885, -0.431809, -2.5604, 0.9372549, 1, 0, 1,
-0.8284826, -1.846624, -3.546059, 0.9333333, 1, 0, 1,
-0.8245703, 2.547984, -1.10219, 0.9254902, 1, 0, 1,
-0.8244061, 0.9264047, -0.3792731, 0.9215686, 1, 0, 1,
-0.8215486, -0.07603768, -1.385629, 0.9137255, 1, 0, 1,
-0.8197712, -1.528196, -2.625663, 0.9098039, 1, 0, 1,
-0.8172263, -0.2689425, -1.498676, 0.9019608, 1, 0, 1,
-0.8044106, 0.3894041, -1.877158, 0.8941177, 1, 0, 1,
-0.8028928, -0.6240072, -3.336485, 0.8901961, 1, 0, 1,
-0.8009016, -0.2202651, -1.888274, 0.8823529, 1, 0, 1,
-0.7999125, -0.1506422, -1.312925, 0.8784314, 1, 0, 1,
-0.7996625, -0.6306331, -1.937451, 0.8705882, 1, 0, 1,
-0.7947021, -0.7485673, -3.069808, 0.8666667, 1, 0, 1,
-0.7892185, 0.1896152, -0.9227738, 0.8588235, 1, 0, 1,
-0.7891253, -0.2642643, -1.26266, 0.854902, 1, 0, 1,
-0.7865117, 0.7179098, 0.1278779, 0.8470588, 1, 0, 1,
-0.7832716, 1.27987, -0.4352028, 0.8431373, 1, 0, 1,
-0.7763121, 0.1183115, -1.740723, 0.8352941, 1, 0, 1,
-0.7744278, 0.1220431, -1.172174, 0.8313726, 1, 0, 1,
-0.7727444, 0.06185072, -1.972143, 0.8235294, 1, 0, 1,
-0.7700952, 0.9533592, -2.348394, 0.8196079, 1, 0, 1,
-0.766883, 1.304598, -0.3501559, 0.8117647, 1, 0, 1,
-0.7659735, 0.04421576, -1.250697, 0.8078431, 1, 0, 1,
-0.7657616, -0.254829, -0.3707313, 0.8, 1, 0, 1,
-0.7631336, -1.552561, -3.103606, 0.7921569, 1, 0, 1,
-0.7557813, -1.237569, -1.184504, 0.7882353, 1, 0, 1,
-0.7513377, 0.5948515, -0.8252845, 0.7803922, 1, 0, 1,
-0.7497859, -2.708398, -2.001101, 0.7764706, 1, 0, 1,
-0.7472799, -0.5243178, -2.519521, 0.7686275, 1, 0, 1,
-0.7472724, 0.001934476, -1.565888, 0.7647059, 1, 0, 1,
-0.7442093, 0.7891947, -0.8246115, 0.7568628, 1, 0, 1,
-0.7412762, 0.4206193, -0.6625809, 0.7529412, 1, 0, 1,
-0.7412142, 0.6564186, 0.407558, 0.7450981, 1, 0, 1,
-0.7409821, 3.007531, 1.766702, 0.7411765, 1, 0, 1,
-0.7394231, -0.8663098, -2.253998, 0.7333333, 1, 0, 1,
-0.7387125, -0.09980059, -3.556603, 0.7294118, 1, 0, 1,
-0.7386006, -0.1493118, -0.567793, 0.7215686, 1, 0, 1,
-0.7346166, -0.2970642, -3.063353, 0.7176471, 1, 0, 1,
-0.7327623, -0.3860046, -2.498878, 0.7098039, 1, 0, 1,
-0.7312172, 0.3009427, -0.3623881, 0.7058824, 1, 0, 1,
-0.7294109, 0.02866602, -2.666865, 0.6980392, 1, 0, 1,
-0.7258566, 0.3497643, -0.2365988, 0.6901961, 1, 0, 1,
-0.7215204, 0.2870936, -2.933162, 0.6862745, 1, 0, 1,
-0.7195346, -0.09967396, -1.679702, 0.6784314, 1, 0, 1,
-0.7174883, 1.626018, 0.06484595, 0.6745098, 1, 0, 1,
-0.7164596, 0.2285476, -1.011122, 0.6666667, 1, 0, 1,
-0.7127832, 2.074304, -1.473686, 0.6627451, 1, 0, 1,
-0.7127288, 0.2430844, -0.4001167, 0.654902, 1, 0, 1,
-0.7125537, 2.391711, 0.7921831, 0.6509804, 1, 0, 1,
-0.7119174, 0.422815, -2.015076, 0.6431373, 1, 0, 1,
-0.7069638, -1.239416, -0.9343274, 0.6392157, 1, 0, 1,
-0.7053604, 0.05321657, -2.593879, 0.6313726, 1, 0, 1,
-0.6988608, 1.246543, -1.724296, 0.627451, 1, 0, 1,
-0.6928441, -0.8851866, -3.304286, 0.6196079, 1, 0, 1,
-0.6840415, 0.5923237, -0.8913088, 0.6156863, 1, 0, 1,
-0.6817681, 0.1905701, -0.3776477, 0.6078432, 1, 0, 1,
-0.6773574, -1.89408, -2.867304, 0.6039216, 1, 0, 1,
-0.6745248, 1.019857, 0.1087008, 0.5960785, 1, 0, 1,
-0.6727375, -0.3987367, -1.050581, 0.5882353, 1, 0, 1,
-0.6688935, -0.4825346, -2.984354, 0.5843138, 1, 0, 1,
-0.6688466, -0.7404354, -4.015265, 0.5764706, 1, 0, 1,
-0.6648939, 1.444578, -2.0018, 0.572549, 1, 0, 1,
-0.6623703, 0.8860848, -0.7160743, 0.5647059, 1, 0, 1,
-0.6596951, -0.1459428, -2.961277, 0.5607843, 1, 0, 1,
-0.6569489, 0.04115786, -2.634628, 0.5529412, 1, 0, 1,
-0.6495104, 1.902559, -0.04256794, 0.5490196, 1, 0, 1,
-0.6493717, -1.040905, -3.25195, 0.5411765, 1, 0, 1,
-0.6419477, 0.2549728, -0.3100902, 0.5372549, 1, 0, 1,
-0.6356352, 0.8671005, 0.7243517, 0.5294118, 1, 0, 1,
-0.6343175, -0.578021, -3.780574, 0.5254902, 1, 0, 1,
-0.6282414, 0.0663565, -1.452035, 0.5176471, 1, 0, 1,
-0.6216897, 1.159974, -2.305249, 0.5137255, 1, 0, 1,
-0.6198155, -0.2562662, -0.7067289, 0.5058824, 1, 0, 1,
-0.6181965, 0.7164213, -1.63845, 0.5019608, 1, 0, 1,
-0.6165007, 2.45838, 0.4783465, 0.4941176, 1, 0, 1,
-0.6104279, 1.854232, -1.050568, 0.4862745, 1, 0, 1,
-0.6052365, 1.074913, -0.457172, 0.4823529, 1, 0, 1,
-0.6044756, 1.660856, -1.705376, 0.4745098, 1, 0, 1,
-0.6028849, 0.5215805, 0.2746621, 0.4705882, 1, 0, 1,
-0.6014497, 0.6227047, -0.3598775, 0.4627451, 1, 0, 1,
-0.5957769, -0.6575992, -0.08525196, 0.4588235, 1, 0, 1,
-0.5896553, 0.9722272, -0.6136082, 0.4509804, 1, 0, 1,
-0.5851095, 1.809538, 0.08785454, 0.4470588, 1, 0, 1,
-0.5841779, -0.4334538, -0.7137653, 0.4392157, 1, 0, 1,
-0.5822247, 0.4992483, -0.7971677, 0.4352941, 1, 0, 1,
-0.5816078, 0.9918077, -1.187143, 0.427451, 1, 0, 1,
-0.5806935, -0.3641482, -2.796381, 0.4235294, 1, 0, 1,
-0.5778216, -0.8855729, -0.2316251, 0.4156863, 1, 0, 1,
-0.5750899, 1.600882, 0.8607575, 0.4117647, 1, 0, 1,
-0.5720128, 1.887006, 0.3488865, 0.4039216, 1, 0, 1,
-0.5717412, -0.8335559, -2.851829, 0.3960784, 1, 0, 1,
-0.5714777, 0.1552982, -2.023128, 0.3921569, 1, 0, 1,
-0.5655079, -0.7101836, -0.5441168, 0.3843137, 1, 0, 1,
-0.5628208, 0.3473111, -0.1872184, 0.3803922, 1, 0, 1,
-0.5626586, -0.4469557, -1.732241, 0.372549, 1, 0, 1,
-0.5623127, -1.164083, -3.401803, 0.3686275, 1, 0, 1,
-0.5609111, 0.5070112, -0.9449162, 0.3607843, 1, 0, 1,
-0.5596689, -0.06143481, -1.26485, 0.3568628, 1, 0, 1,
-0.557734, -1.136506, -3.718282, 0.3490196, 1, 0, 1,
-0.5574313, -0.1979637, -0.897782, 0.345098, 1, 0, 1,
-0.5554121, 1.650106, -2.752051, 0.3372549, 1, 0, 1,
-0.5540714, 0.6337292, -0.6075196, 0.3333333, 1, 0, 1,
-0.5529563, 0.9086533, -0.920027, 0.3254902, 1, 0, 1,
-0.5527816, -0.3453195, -2.337611, 0.3215686, 1, 0, 1,
-0.5508013, -1.784848, -2.365887, 0.3137255, 1, 0, 1,
-0.5477536, 0.5031853, -1.037066, 0.3098039, 1, 0, 1,
-0.5463275, 0.9164761, -2.360746, 0.3019608, 1, 0, 1,
-0.5450132, -0.9791359, -2.538178, 0.2941177, 1, 0, 1,
-0.5448433, 1.75713, 0.6790533, 0.2901961, 1, 0, 1,
-0.5380198, -0.9645231, -2.348323, 0.282353, 1, 0, 1,
-0.533693, 0.533778, -2.238392, 0.2784314, 1, 0, 1,
-0.532411, -0.8117259, -2.966964, 0.2705882, 1, 0, 1,
-0.53231, 0.4384674, 0.2434692, 0.2666667, 1, 0, 1,
-0.5318539, -2.452689, -2.364599, 0.2588235, 1, 0, 1,
-0.5309995, 1.345266, 0.6368408, 0.254902, 1, 0, 1,
-0.5308314, 0.6681255, 0.6874511, 0.2470588, 1, 0, 1,
-0.5230681, 0.29662, -0.2634803, 0.2431373, 1, 0, 1,
-0.5165163, 0.08776812, -1.615723, 0.2352941, 1, 0, 1,
-0.5154594, 0.6894479, -0.7670347, 0.2313726, 1, 0, 1,
-0.515048, -0.3246384, -2.938772, 0.2235294, 1, 0, 1,
-0.5063502, -1.326979, -3.481089, 0.2196078, 1, 0, 1,
-0.5048612, -1.042437, -3.494145, 0.2117647, 1, 0, 1,
-0.5046788, 1.118284, -0.6177456, 0.2078431, 1, 0, 1,
-0.5016921, 0.9975668, 0.6862047, 0.2, 1, 0, 1,
-0.4955361, -0.1914776, -0.545601, 0.1921569, 1, 0, 1,
-0.4945784, 1.400505, 0.08617474, 0.1882353, 1, 0, 1,
-0.4934368, 0.06796084, -1.630285, 0.1803922, 1, 0, 1,
-0.4900498, -1.595701, -3.650292, 0.1764706, 1, 0, 1,
-0.4887685, -0.6233285, -1.924184, 0.1686275, 1, 0, 1,
-0.4877969, -0.7353663, -3.137289, 0.1647059, 1, 0, 1,
-0.4859657, -1.64855, -3.084472, 0.1568628, 1, 0, 1,
-0.4835473, -0.3318797, -4.076271, 0.1529412, 1, 0, 1,
-0.4821418, -1.274654, -4.604534, 0.145098, 1, 0, 1,
-0.4807214, 0.7797745, -1.430433, 0.1411765, 1, 0, 1,
-0.4766015, 1.363537, -1.669441, 0.1333333, 1, 0, 1,
-0.4765857, 0.7502331, -0.9223422, 0.1294118, 1, 0, 1,
-0.475093, -0.7855971, -2.427342, 0.1215686, 1, 0, 1,
-0.4748301, 1.174209, -1.956975, 0.1176471, 1, 0, 1,
-0.4713845, 0.03639713, 0.3668827, 0.1098039, 1, 0, 1,
-0.4674377, -2.707943, -2.234166, 0.1058824, 1, 0, 1,
-0.4669218, 0.7876734, 0.01253405, 0.09803922, 1, 0, 1,
-0.4667001, -0.4599694, -2.968879, 0.09019608, 1, 0, 1,
-0.4587795, -0.2158359, -2.986479, 0.08627451, 1, 0, 1,
-0.448474, -1.156997, -3.487151, 0.07843138, 1, 0, 1,
-0.4438911, 0.6448258, -1.800328, 0.07450981, 1, 0, 1,
-0.44375, -0.1896224, -1.019, 0.06666667, 1, 0, 1,
-0.4380503, -0.281739, -3.139656, 0.0627451, 1, 0, 1,
-0.4378572, 0.8327188, -1.106127, 0.05490196, 1, 0, 1,
-0.4339922, -1.753914, -2.623924, 0.05098039, 1, 0, 1,
-0.4318711, 0.6034621, -0.1964876, 0.04313726, 1, 0, 1,
-0.4302017, 0.05840344, -2.664605, 0.03921569, 1, 0, 1,
-0.4300605, -0.5404677, -1.100925, 0.03137255, 1, 0, 1,
-0.4273513, -0.3893192, -1.739704, 0.02745098, 1, 0, 1,
-0.4268577, -0.3284586, -3.148724, 0.01960784, 1, 0, 1,
-0.4236769, 1.623972, -1.448824, 0.01568628, 1, 0, 1,
-0.4219328, 0.8525406, 0.5822182, 0.007843138, 1, 0, 1,
-0.4212909, -1.878486, -3.248997, 0.003921569, 1, 0, 1,
-0.4195594, 0.675317, -0.8902535, 0, 1, 0.003921569, 1,
-0.4159672, 1.12128, -0.4689867, 0, 1, 0.01176471, 1,
-0.4129866, 0.1130563, -3.022636, 0, 1, 0.01568628, 1,
-0.4096028, -1.386817, -3.767161, 0, 1, 0.02352941, 1,
-0.4049827, 0.8234203, -1.075809, 0, 1, 0.02745098, 1,
-0.4019336, -0.314354, -0.9092736, 0, 1, 0.03529412, 1,
-0.3980559, -0.1670459, -3.381586, 0, 1, 0.03921569, 1,
-0.3940836, 0.4719894, -1.083985, 0, 1, 0.04705882, 1,
-0.3788497, 1.293175, 0.5153573, 0, 1, 0.05098039, 1,
-0.3758387, 0.3825661, -2.002471, 0, 1, 0.05882353, 1,
-0.3692903, -0.1712798, -3.207716, 0, 1, 0.0627451, 1,
-0.3681879, -0.5616699, -2.7943, 0, 1, 0.07058824, 1,
-0.3670418, -1.274573, -2.081386, 0, 1, 0.07450981, 1,
-0.3641467, -0.8151849, -3.240193, 0, 1, 0.08235294, 1,
-0.3619912, -0.5461056, -1.367868, 0, 1, 0.08627451, 1,
-0.3616001, 0.01071063, -2.366501, 0, 1, 0.09411765, 1,
-0.3519582, 0.6591441, -0.7825674, 0, 1, 0.1019608, 1,
-0.3491631, 0.521976, -1.514037, 0, 1, 0.1058824, 1,
-0.3491319, -0.1135243, -0.6123545, 0, 1, 0.1137255, 1,
-0.3445279, -0.1208426, -1.146412, 0, 1, 0.1176471, 1,
-0.3352943, 1.553316, -1.647744, 0, 1, 0.1254902, 1,
-0.3345109, -0.6117873, -0.7203147, 0, 1, 0.1294118, 1,
-0.3314964, -1.229971, -2.390683, 0, 1, 0.1372549, 1,
-0.330957, -0.2975993, -4.446577, 0, 1, 0.1411765, 1,
-0.3306184, 0.5929098, 0.2597429, 0, 1, 0.1490196, 1,
-0.323547, -0.1913387, -3.377963, 0, 1, 0.1529412, 1,
-0.3234762, 0.1221421, -2.519636, 0, 1, 0.1607843, 1,
-0.3233095, -1.383894, -1.781815, 0, 1, 0.1647059, 1,
-0.322376, 0.8556857, -1.54488, 0, 1, 0.172549, 1,
-0.3220378, -0.242883, -3.270642, 0, 1, 0.1764706, 1,
-0.3197491, -2.135297, -3.940772, 0, 1, 0.1843137, 1,
-0.3170297, 1.505703, 0.08442046, 0, 1, 0.1882353, 1,
-0.3163281, -1.285825, -3.337103, 0, 1, 0.1960784, 1,
-0.3127388, -0.3111219, -3.677656, 0, 1, 0.2039216, 1,
-0.3115618, -0.6967317, -1.63026, 0, 1, 0.2078431, 1,
-0.3070541, -0.9522312, -3.101192, 0, 1, 0.2156863, 1,
-0.3061076, -0.6129648, -3.369304, 0, 1, 0.2196078, 1,
-0.3058333, -1.531627, -5.354177, 0, 1, 0.227451, 1,
-0.3056196, 0.07307907, -2.098399, 0, 1, 0.2313726, 1,
-0.305032, -0.4756465, -3.162852, 0, 1, 0.2392157, 1,
-0.2922524, -2.065047, -3.565244, 0, 1, 0.2431373, 1,
-0.2914086, -1.305378, -1.658206, 0, 1, 0.2509804, 1,
-0.2906414, 0.6381396, 0.7247879, 0, 1, 0.254902, 1,
-0.2790963, -0.6856882, -4.929082, 0, 1, 0.2627451, 1,
-0.2780992, -0.5182747, -1.36588, 0, 1, 0.2666667, 1,
-0.274538, -0.009156547, -1.649909, 0, 1, 0.2745098, 1,
-0.2734708, 2.124446, -1.242427, 0, 1, 0.2784314, 1,
-0.2728002, 2.38167, -1.577798, 0, 1, 0.2862745, 1,
-0.2708524, -0.9615038, -1.888023, 0, 1, 0.2901961, 1,
-0.2688903, -2.662755, -2.832279, 0, 1, 0.2980392, 1,
-0.2645264, 2.358549, 0.750054, 0, 1, 0.3058824, 1,
-0.264449, 2.874096, 0.2941265, 0, 1, 0.3098039, 1,
-0.2623671, 0.2781638, -1.2335, 0, 1, 0.3176471, 1,
-0.2591728, -0.4471467, -4.00419, 0, 1, 0.3215686, 1,
-0.2589625, 0.1582395, -0.151792, 0, 1, 0.3294118, 1,
-0.2583367, 0.9871424, 0.6537088, 0, 1, 0.3333333, 1,
-0.2575718, 0.9195591, -1.7188, 0, 1, 0.3411765, 1,
-0.2553568, -0.5245929, -3.318337, 0, 1, 0.345098, 1,
-0.2533181, 0.1745612, 0.3782344, 0, 1, 0.3529412, 1,
-0.2525562, 0.90782, 0.355762, 0, 1, 0.3568628, 1,
-0.2505732, 0.2438128, 1.304378, 0, 1, 0.3647059, 1,
-0.2489672, -0.6563881, -3.387894, 0, 1, 0.3686275, 1,
-0.2466668, -0.3132875, -2.32335, 0, 1, 0.3764706, 1,
-0.2444109, 0.4908492, -0.1992788, 0, 1, 0.3803922, 1,
-0.2424756, -0.05787702, -0.603949, 0, 1, 0.3882353, 1,
-0.2361277, -0.002465513, -2.018577, 0, 1, 0.3921569, 1,
-0.2354476, -0.09375838, -0.9693036, 0, 1, 0.4, 1,
-0.2341857, -0.6328734, -2.589918, 0, 1, 0.4078431, 1,
-0.2284572, -1.413779, -3.527878, 0, 1, 0.4117647, 1,
-0.2177119, 0.008918621, -1.603137, 0, 1, 0.4196078, 1,
-0.2176277, -0.3322801, -2.625317, 0, 1, 0.4235294, 1,
-0.2164725, 0.8782201, 0.5194907, 0, 1, 0.4313726, 1,
-0.2160735, 0.3906589, -0.5256149, 0, 1, 0.4352941, 1,
-0.21448, -0.8658704, -3.68608, 0, 1, 0.4431373, 1,
-0.2101388, 1.439697, 1.296772, 0, 1, 0.4470588, 1,
-0.2086149, -0.6581905, -2.512411, 0, 1, 0.454902, 1,
-0.2072546, 0.2702723, 1.059413, 0, 1, 0.4588235, 1,
-0.2057707, 0.02327027, -1.078231, 0, 1, 0.4666667, 1,
-0.1911177, 0.5443013, -1.748475, 0, 1, 0.4705882, 1,
-0.1894644, -0.6943377, -3.813498, 0, 1, 0.4784314, 1,
-0.1855258, 1.503089, 1.258709, 0, 1, 0.4823529, 1,
-0.183111, 1.593308, -0.2314425, 0, 1, 0.4901961, 1,
-0.1759993, 1.104875, 0.384912, 0, 1, 0.4941176, 1,
-0.171407, 0.8947099, -0.8299348, 0, 1, 0.5019608, 1,
-0.1706465, -0.03139868, -1.372144, 0, 1, 0.509804, 1,
-0.1702665, 1.194331, -0.196885, 0, 1, 0.5137255, 1,
-0.1695113, -1.28848, -1.688955, 0, 1, 0.5215687, 1,
-0.1670189, -2.207469, -5.233775, 0, 1, 0.5254902, 1,
-0.1664492, -1.476781, -3.733289, 0, 1, 0.5333334, 1,
-0.1623201, 1.720805, 0.3638057, 0, 1, 0.5372549, 1,
-0.1619287, 1.086852, 1.236895, 0, 1, 0.5450981, 1,
-0.1599345, 0.7383577, -0.3758576, 0, 1, 0.5490196, 1,
-0.1592397, -0.3408445, -3.524346, 0, 1, 0.5568628, 1,
-0.1563572, -0.3048337, -1.320572, 0, 1, 0.5607843, 1,
-0.15627, -0.6195263, -1.974591, 0, 1, 0.5686275, 1,
-0.155031, -0.5246193, -2.199867, 0, 1, 0.572549, 1,
-0.1506033, 0.6989968, 1.155952, 0, 1, 0.5803922, 1,
-0.1502299, 0.6845878, -0.009000789, 0, 1, 0.5843138, 1,
-0.150042, 0.183278, -1.942193, 0, 1, 0.5921569, 1,
-0.1469172, 0.04028966, -2.130104, 0, 1, 0.5960785, 1,
-0.1457322, 0.8130925, 1.547995, 0, 1, 0.6039216, 1,
-0.1404528, 1.024378, -1.037595, 0, 1, 0.6117647, 1,
-0.1402384, 1.640213, 0.4604852, 0, 1, 0.6156863, 1,
-0.1364443, 0.06826302, -0.9695535, 0, 1, 0.6235294, 1,
-0.1344652, -0.352809, -2.430499, 0, 1, 0.627451, 1,
-0.1322621, -1.157673, -5.147102, 0, 1, 0.6352941, 1,
-0.1175097, -1.006766, -2.796392, 0, 1, 0.6392157, 1,
-0.1170556, -0.2988144, -2.153241, 0, 1, 0.6470588, 1,
-0.1141733, 0.6048312, 0.587782, 0, 1, 0.6509804, 1,
-0.1135977, 0.5148008, -0.6312122, 0, 1, 0.6588235, 1,
-0.1097611, 0.596741, -1.205003, 0, 1, 0.6627451, 1,
-0.1094119, -0.6851597, -4.181455, 0, 1, 0.6705883, 1,
-0.1082414, 0.7645361, -1.475894, 0, 1, 0.6745098, 1,
-0.1055507, 0.8796141, 1.0861, 0, 1, 0.682353, 1,
-0.1048791, 0.5993115, 1.72385, 0, 1, 0.6862745, 1,
-0.09862402, 1.127512, -0.8120052, 0, 1, 0.6941177, 1,
-0.09724172, 0.2633248, -0.2925648, 0, 1, 0.7019608, 1,
-0.0972259, -0.0596175, -1.685378, 0, 1, 0.7058824, 1,
-0.09618117, -0.1173485, -1.282068, 0, 1, 0.7137255, 1,
-0.09599502, 1.587195, 0.8979464, 0, 1, 0.7176471, 1,
-0.09419569, -1.657571, -3.476659, 0, 1, 0.7254902, 1,
-0.0926033, -1.084566, -2.427456, 0, 1, 0.7294118, 1,
-0.08749281, 0.1439267, 0.9482489, 0, 1, 0.7372549, 1,
-0.08655479, 0.6815498, 0.2086625, 0, 1, 0.7411765, 1,
-0.08633425, -0.5424082, -4.088659, 0, 1, 0.7490196, 1,
-0.07929116, -0.0734348, -3.251328, 0, 1, 0.7529412, 1,
-0.07876436, -0.7034549, -3.482986, 0, 1, 0.7607843, 1,
-0.07583418, -0.1909858, -0.6575679, 0, 1, 0.7647059, 1,
-0.0699919, -1.089209, -1.2597, 0, 1, 0.772549, 1,
-0.06943024, 0.3914062, -1.438008, 0, 1, 0.7764706, 1,
-0.0651635, 0.4332017, 1.240001, 0, 1, 0.7843137, 1,
-0.06434796, 0.08219881, -0.7224759, 0, 1, 0.7882353, 1,
-0.063822, 0.4513477, -0.3229787, 0, 1, 0.7960784, 1,
-0.05396384, -0.1598518, -2.556116, 0, 1, 0.8039216, 1,
-0.04894226, -0.8555661, -3.702617, 0, 1, 0.8078431, 1,
-0.04838848, 1.759658, -0.2477394, 0, 1, 0.8156863, 1,
-0.04577447, 0.3369765, -0.4850496, 0, 1, 0.8196079, 1,
-0.04034407, 0.8305488, -0.5279087, 0, 1, 0.827451, 1,
-0.03900884, 0.4160253, -0.3255618, 0, 1, 0.8313726, 1,
-0.03842739, -0.8071778, -3.532561, 0, 1, 0.8392157, 1,
-0.03808887, -0.09837379, -3.111227, 0, 1, 0.8431373, 1,
-0.03726998, 1.237522, 1.461955, 0, 1, 0.8509804, 1,
-0.02961637, -0.848644, -2.278807, 0, 1, 0.854902, 1,
-0.02833347, -1.444816, -3.178174, 0, 1, 0.8627451, 1,
-0.02716765, -1.141328, -3.769792, 0, 1, 0.8666667, 1,
-0.02638684, -0.120088, -2.24465, 0, 1, 0.8745098, 1,
-0.02547391, -1.494514, -3.703477, 0, 1, 0.8784314, 1,
-0.01999944, -0.3499889, -0.6556301, 0, 1, 0.8862745, 1,
-0.01971923, -1.140505, -3.365381, 0, 1, 0.8901961, 1,
-0.01868116, 0.2555921, -0.4856578, 0, 1, 0.8980392, 1,
-0.014172, -0.3294059, -2.198037, 0, 1, 0.9058824, 1,
-0.0092296, 0.227233, 0.459098, 0, 1, 0.9098039, 1,
-0.008252986, 0.7802532, -0.3670007, 0, 1, 0.9176471, 1,
-0.006316996, -0.92747, -2.668292, 0, 1, 0.9215686, 1,
-0.006170404, 0.425607, -0.5089638, 0, 1, 0.9294118, 1,
-0.005595843, 0.4122518, -1.481673, 0, 1, 0.9333333, 1,
-0.002345616, 1.744862, -0.6040328, 0, 1, 0.9411765, 1,
-0.0005895994, -0.08236275, -2.497552, 0, 1, 0.945098, 1,
0.00480463, 0.1116851, 0.6923797, 0, 1, 0.9529412, 1,
0.005020477, 0.9114717, -0.2091826, 0, 1, 0.9568627, 1,
0.008342326, 0.2642447, 0.6422386, 0, 1, 0.9647059, 1,
0.009271025, 1.207546, -0.2770882, 0, 1, 0.9686275, 1,
0.01534745, 0.3319757, -2.176746, 0, 1, 0.9764706, 1,
0.01657332, -1.020924, 2.928674, 0, 1, 0.9803922, 1,
0.01931754, 0.8629277, 0.9889311, 0, 1, 0.9882353, 1,
0.02391803, -0.381862, 2.86281, 0, 1, 0.9921569, 1,
0.02835423, 0.4390756, -0.5283256, 0, 1, 1, 1,
0.02994996, -0.355907, 3.792058, 0, 0.9921569, 1, 1,
0.03006522, -1.656099, 3.184409, 0, 0.9882353, 1, 1,
0.03450126, -1.333419, 3.858365, 0, 0.9803922, 1, 1,
0.04350023, -1.131616, 4.367459, 0, 0.9764706, 1, 1,
0.04381749, 0.06465574, 0.847894, 0, 0.9686275, 1, 1,
0.04723305, 0.6195191, 0.3474415, 0, 0.9647059, 1, 1,
0.04782172, 1.251109, 0.05304277, 0, 0.9568627, 1, 1,
0.05084705, 0.7829682, -2.456032, 0, 0.9529412, 1, 1,
0.05302065, 0.7258509, 1.01076, 0, 0.945098, 1, 1,
0.05306229, 2.350347, 0.03894368, 0, 0.9411765, 1, 1,
0.05379228, 1.103512, -1.920627, 0, 0.9333333, 1, 1,
0.05517711, -0.3095241, 1.853416, 0, 0.9294118, 1, 1,
0.05858458, 0.237941, -0.3868922, 0, 0.9215686, 1, 1,
0.05933774, 2.94445, 1.737728, 0, 0.9176471, 1, 1,
0.06188971, -0.4759234, 2.059717, 0, 0.9098039, 1, 1,
0.06198712, 0.424986, -1.100071, 0, 0.9058824, 1, 1,
0.06224621, -1.764521, 2.621504, 0, 0.8980392, 1, 1,
0.06254536, 1.507923, 1.429421, 0, 0.8901961, 1, 1,
0.06389338, -1.28327, 1.304116, 0, 0.8862745, 1, 1,
0.0667228, -0.8892246, 3.744294, 0, 0.8784314, 1, 1,
0.06715837, -1.093053, 3.9963, 0, 0.8745098, 1, 1,
0.06803097, 0.2724566, 1.324618, 0, 0.8666667, 1, 1,
0.07188027, -0.4333586, 2.442723, 0, 0.8627451, 1, 1,
0.07202908, 1.145309, -0.6513256, 0, 0.854902, 1, 1,
0.07406544, -0.09757937, 2.699206, 0, 0.8509804, 1, 1,
0.07931931, 0.1695593, 2.62474, 0, 0.8431373, 1, 1,
0.07973009, -1.685711, 3.045761, 0, 0.8392157, 1, 1,
0.08500767, -1.029972, 2.506975, 0, 0.8313726, 1, 1,
0.08751591, 1.913063, 1.166392, 0, 0.827451, 1, 1,
0.08785115, 0.3098822, 0.5780784, 0, 0.8196079, 1, 1,
0.09627441, -2.166477, 2.417278, 0, 0.8156863, 1, 1,
0.09852356, -0.3277517, 3.849025, 0, 0.8078431, 1, 1,
0.1017175, -1.179022, 3.516796, 0, 0.8039216, 1, 1,
0.1046304, -1.164773, 3.064175, 0, 0.7960784, 1, 1,
0.107106, 1.670095, 0.2679053, 0, 0.7882353, 1, 1,
0.1072785, -1.595225, 2.613128, 0, 0.7843137, 1, 1,
0.1094414, -2.288321, 3.884026, 0, 0.7764706, 1, 1,
0.1130288, 0.5082965, -0.1612644, 0, 0.772549, 1, 1,
0.1146573, -0.9624434, 2.568489, 0, 0.7647059, 1, 1,
0.116595, -0.9221211, 2.828066, 0, 0.7607843, 1, 1,
0.1170986, 1.254329, 0.3167961, 0, 0.7529412, 1, 1,
0.1189499, -0.9855148, 2.524393, 0, 0.7490196, 1, 1,
0.1191094, -0.01898044, 2.433077, 0, 0.7411765, 1, 1,
0.1219584, 0.8395053, 1.772741, 0, 0.7372549, 1, 1,
0.1224819, -1.488341, 2.628207, 0, 0.7294118, 1, 1,
0.1245976, -0.578858, 0.6442901, 0, 0.7254902, 1, 1,
0.1268236, -2.029654, 2.590513, 0, 0.7176471, 1, 1,
0.1301997, 0.242319, 0.1794093, 0, 0.7137255, 1, 1,
0.1404725, 0.7273634, -1.499933, 0, 0.7058824, 1, 1,
0.1408457, 1.035749, 0.3935572, 0, 0.6980392, 1, 1,
0.150424, 0.9559013, -2.365289, 0, 0.6941177, 1, 1,
0.1518899, -0.9903404, 1.518714, 0, 0.6862745, 1, 1,
0.1535293, -1.116475, 2.568103, 0, 0.682353, 1, 1,
0.154751, -1.374622, 2.797009, 0, 0.6745098, 1, 1,
0.1547582, -0.2671192, 2.491054, 0, 0.6705883, 1, 1,
0.1571278, -1.287526, 2.075086, 0, 0.6627451, 1, 1,
0.1588241, 0.771601, -0.2403637, 0, 0.6588235, 1, 1,
0.161889, 0.1341058, 0.2948096, 0, 0.6509804, 1, 1,
0.1644146, -0.1468951, 2.318097, 0, 0.6470588, 1, 1,
0.1660606, -0.4894504, 4.249584, 0, 0.6392157, 1, 1,
0.1684577, 0.1081845, 0.4957041, 0, 0.6352941, 1, 1,
0.174607, 0.7331913, -1.067378, 0, 0.627451, 1, 1,
0.1777773, -0.2323709, 2.718055, 0, 0.6235294, 1, 1,
0.1807049, 0.3409493, 0.7946563, 0, 0.6156863, 1, 1,
0.1809074, -0.1733367, 2.159076, 0, 0.6117647, 1, 1,
0.1817555, -0.9444935, 1.308707, 0, 0.6039216, 1, 1,
0.1820525, -0.6444719, 3.153378, 0, 0.5960785, 1, 1,
0.1834704, 0.3493766, 1.378772, 0, 0.5921569, 1, 1,
0.1835604, 1.295297, -0.2274267, 0, 0.5843138, 1, 1,
0.1835677, -0.01354789, 1.881355, 0, 0.5803922, 1, 1,
0.1855209, -0.05338772, 2.434117, 0, 0.572549, 1, 1,
0.1885406, 0.4720952, -1.656914, 0, 0.5686275, 1, 1,
0.1890252, -1.050308, 1.360389, 0, 0.5607843, 1, 1,
0.1933752, -2.768107, 2.337549, 0, 0.5568628, 1, 1,
0.1963629, 0.3548475, 0.7230419, 0, 0.5490196, 1, 1,
0.2004394, -0.04308584, -0.7244902, 0, 0.5450981, 1, 1,
0.2022683, 0.910989, 0.2907302, 0, 0.5372549, 1, 1,
0.2084707, -0.3189128, 2.190398, 0, 0.5333334, 1, 1,
0.2121036, -0.8049213, 3.575762, 0, 0.5254902, 1, 1,
0.2122902, -0.4295363, 3.798759, 0, 0.5215687, 1, 1,
0.2133836, 1.09447, -1.758495, 0, 0.5137255, 1, 1,
0.2152063, -0.8055072, 2.890909, 0, 0.509804, 1, 1,
0.222448, 0.4380485, 0.09395296, 0, 0.5019608, 1, 1,
0.2248414, -1.36031, 4.709801, 0, 0.4941176, 1, 1,
0.2250068, 0.7875757, -1.500089, 0, 0.4901961, 1, 1,
0.2264536, -1.231273, 3.675378, 0, 0.4823529, 1, 1,
0.2267571, 0.2243482, 1.413679, 0, 0.4784314, 1, 1,
0.2284613, -2.201479, 3.302158, 0, 0.4705882, 1, 1,
0.2299473, -0.4784649, 3.229111, 0, 0.4666667, 1, 1,
0.231133, -0.4550875, 3.325873, 0, 0.4588235, 1, 1,
0.2344965, 0.2307323, 0.4025562, 0, 0.454902, 1, 1,
0.2356723, 0.06537957, 2.37823, 0, 0.4470588, 1, 1,
0.2377062, -0.2983197, 2.240028, 0, 0.4431373, 1, 1,
0.2382067, -0.6571054, 2.065987, 0, 0.4352941, 1, 1,
0.2384627, 1.705311, 2.91088, 0, 0.4313726, 1, 1,
0.2495521, 1.405333, 0.8238756, 0, 0.4235294, 1, 1,
0.2508665, 1.104549, 1.014218, 0, 0.4196078, 1, 1,
0.2522283, 1.214538, 1.269279, 0, 0.4117647, 1, 1,
0.2547099, 2.887976, -0.9541424, 0, 0.4078431, 1, 1,
0.2547858, -0.006601083, -0.3562187, 0, 0.4, 1, 1,
0.2565578, -0.4211601, 2.245311, 0, 0.3921569, 1, 1,
0.2675148, 2.029378, 0.5268624, 0, 0.3882353, 1, 1,
0.2679268, -0.1329373, 2.540316, 0, 0.3803922, 1, 1,
0.2685121, 0.692641, 1.940141, 0, 0.3764706, 1, 1,
0.2689609, 0.3197937, 0.8524086, 0, 0.3686275, 1, 1,
0.2755546, -0.4803133, 2.903488, 0, 0.3647059, 1, 1,
0.2759244, 0.032361, 0.292123, 0, 0.3568628, 1, 1,
0.2771771, 1.432124, -1.345554, 0, 0.3529412, 1, 1,
0.2832745, -0.1417183, 3.478704, 0, 0.345098, 1, 1,
0.2877878, 0.3075328, -0.6117324, 0, 0.3411765, 1, 1,
0.2894888, -0.6149856, 3.292618, 0, 0.3333333, 1, 1,
0.2896775, -0.05100121, 0.770804, 0, 0.3294118, 1, 1,
0.2905297, -0.1812328, 1.672721, 0, 0.3215686, 1, 1,
0.2940017, -0.4464774, 4.007951, 0, 0.3176471, 1, 1,
0.2940839, 0.1124593, 0.3088663, 0, 0.3098039, 1, 1,
0.3018526, -0.6537489, 3.903268, 0, 0.3058824, 1, 1,
0.3086439, -1.497453, 3.734748, 0, 0.2980392, 1, 1,
0.3090272, 0.8154352, 0.9181353, 0, 0.2901961, 1, 1,
0.313909, 1.266292, -1.287543, 0, 0.2862745, 1, 1,
0.3140458, 0.9290131, 1.075375, 0, 0.2784314, 1, 1,
0.3153352, -1.283022, 2.293246, 0, 0.2745098, 1, 1,
0.3164571, -0.1754197, 2.420694, 0, 0.2666667, 1, 1,
0.3171071, 1.290243, 0.5951259, 0, 0.2627451, 1, 1,
0.3178522, 1.326052, 0.3647951, 0, 0.254902, 1, 1,
0.3193014, 0.6791873, 0.6878086, 0, 0.2509804, 1, 1,
0.3211839, -0.3688457, 1.607257, 0, 0.2431373, 1, 1,
0.3222568, 0.3685164, -0.9424108, 0, 0.2392157, 1, 1,
0.3224926, 0.3671803, 0.7063262, 0, 0.2313726, 1, 1,
0.3229636, -1.082384, 3.032097, 0, 0.227451, 1, 1,
0.3252123, -1.037785, 0.3363225, 0, 0.2196078, 1, 1,
0.3274355, 0.6015314, 2.240462, 0, 0.2156863, 1, 1,
0.3300223, -0.3655726, 0.8054173, 0, 0.2078431, 1, 1,
0.3309129, 0.2061033, 2.251045, 0, 0.2039216, 1, 1,
0.3326348, -1.553469, 2.694794, 0, 0.1960784, 1, 1,
0.3382623, 1.492624, 1.336208, 0, 0.1882353, 1, 1,
0.3393769, -0.05114293, 1.286775, 0, 0.1843137, 1, 1,
0.3445371, -0.5325387, 3.312847, 0, 0.1764706, 1, 1,
0.3449867, 0.3289841, 1.426824, 0, 0.172549, 1, 1,
0.3456505, 0.7397708, 0.2744043, 0, 0.1647059, 1, 1,
0.347904, -0.500928, 3.043185, 0, 0.1607843, 1, 1,
0.3486745, 1.044372, 0.7607335, 0, 0.1529412, 1, 1,
0.3506157, -0.6813433, 4.207324, 0, 0.1490196, 1, 1,
0.3508525, 0.04892139, -0.7297587, 0, 0.1411765, 1, 1,
0.3550231, -0.6107793, 3.304151, 0, 0.1372549, 1, 1,
0.3601369, 0.3084464, 1.906498, 0, 0.1294118, 1, 1,
0.3603343, 0.1165715, 1.736759, 0, 0.1254902, 1, 1,
0.3616417, -0.6732445, 2.017727, 0, 0.1176471, 1, 1,
0.3622404, 0.4312035, 0.07334273, 0, 0.1137255, 1, 1,
0.3664751, -0.4569158, 4.337655, 0, 0.1058824, 1, 1,
0.3678074, 0.547063, 0.9032953, 0, 0.09803922, 1, 1,
0.3710908, 1.746663, -0.5408018, 0, 0.09411765, 1, 1,
0.3718055, -0.4823014, 3.0922, 0, 0.08627451, 1, 1,
0.3725677, -0.3493291, 2.993448, 0, 0.08235294, 1, 1,
0.3746568, 0.04917858, 0.5860766, 0, 0.07450981, 1, 1,
0.377445, 0.09243887, 0.6380134, 0, 0.07058824, 1, 1,
0.377631, 1.076823, 1.072783, 0, 0.0627451, 1, 1,
0.3793644, -0.5525359, 2.23499, 0, 0.05882353, 1, 1,
0.383311, -0.5015808, 1.796321, 0, 0.05098039, 1, 1,
0.3849995, -1.881621, 2.929668, 0, 0.04705882, 1, 1,
0.3854257, -0.4304723, 2.905342, 0, 0.03921569, 1, 1,
0.3854721, 1.389847, -1.353543, 0, 0.03529412, 1, 1,
0.3910519, -0.9559155, 3.719627, 0, 0.02745098, 1, 1,
0.3952833, 0.06467713, -0.8314855, 0, 0.02352941, 1, 1,
0.3989035, -2.543371, 3.685077, 0, 0.01568628, 1, 1,
0.399003, -1.125086, 3.984725, 0, 0.01176471, 1, 1,
0.4004317, 0.4926732, 1.11949, 0, 0.003921569, 1, 1,
0.4021606, -0.8138113, 4.735695, 0.003921569, 0, 1, 1,
0.4025631, -1.332969, 3.913073, 0.007843138, 0, 1, 1,
0.403912, 0.5346916, -0.5249501, 0.01568628, 0, 1, 1,
0.407204, 2.098057, 0.5540349, 0.01960784, 0, 1, 1,
0.4111938, -1.188514, 2.299909, 0.02745098, 0, 1, 1,
0.4147483, 1.231788, 1.532071, 0.03137255, 0, 1, 1,
0.4161051, 0.3873323, -0.0745092, 0.03921569, 0, 1, 1,
0.4256522, -1.359137, 2.476568, 0.04313726, 0, 1, 1,
0.4268658, -0.7468755, 1.578475, 0.05098039, 0, 1, 1,
0.4293787, -1.083641, 0.9513004, 0.05490196, 0, 1, 1,
0.4313408, -0.7282735, 1.995983, 0.0627451, 0, 1, 1,
0.4316919, -0.6091694, 1.809674, 0.06666667, 0, 1, 1,
0.4386965, 2.350791, -1.350069, 0.07450981, 0, 1, 1,
0.4489453, 0.4627028, -1.308209, 0.07843138, 0, 1, 1,
0.4493663, 0.4808983, 0.6008534, 0.08627451, 0, 1, 1,
0.4510077, -0.04764578, 1.558765, 0.09019608, 0, 1, 1,
0.4544059, -0.08399139, 1.631329, 0.09803922, 0, 1, 1,
0.4614818, -0.952777, 2.336659, 0.1058824, 0, 1, 1,
0.4658812, -0.2731949, 0.3442893, 0.1098039, 0, 1, 1,
0.4724537, -0.06991086, 0.9615132, 0.1176471, 0, 1, 1,
0.4741299, -1.491939, 3.298474, 0.1215686, 0, 1, 1,
0.4782135, 1.373936, 0.985105, 0.1294118, 0, 1, 1,
0.4859163, -0.6290165, 1.709005, 0.1333333, 0, 1, 1,
0.4877785, -0.3676153, 1.84411, 0.1411765, 0, 1, 1,
0.4920776, -0.3418249, 2.809518, 0.145098, 0, 1, 1,
0.494075, -1.060469, 3.177181, 0.1529412, 0, 1, 1,
0.4944098, 0.8384696, 1.572694, 0.1568628, 0, 1, 1,
0.4953285, -0.7740004, 3.654471, 0.1647059, 0, 1, 1,
0.4956364, -0.1458369, 3.862498, 0.1686275, 0, 1, 1,
0.4973018, -0.453974, 2.305691, 0.1764706, 0, 1, 1,
0.5029548, -0.08501278, 2.35246, 0.1803922, 0, 1, 1,
0.5043774, -0.6992956, 1.974247, 0.1882353, 0, 1, 1,
0.5071225, -0.4201888, 1.372188, 0.1921569, 0, 1, 1,
0.5084214, 0.9529181, 0.3131361, 0.2, 0, 1, 1,
0.5100884, 0.6666, -0.471606, 0.2078431, 0, 1, 1,
0.5113267, -0.5515713, 2.590085, 0.2117647, 0, 1, 1,
0.5120493, 1.190098, 0.6929439, 0.2196078, 0, 1, 1,
0.5222299, 0.2496182, 2.109066, 0.2235294, 0, 1, 1,
0.5243508, -0.1109726, 1.952159, 0.2313726, 0, 1, 1,
0.5292523, -0.7867711, 2.685091, 0.2352941, 0, 1, 1,
0.5292673, 0.4667088, 0.9343184, 0.2431373, 0, 1, 1,
0.5371508, 0.620181, 0.03815516, 0.2470588, 0, 1, 1,
0.5380958, -0.7332483, 4.637962, 0.254902, 0, 1, 1,
0.5386134, 0.6804222, 1.722967, 0.2588235, 0, 1, 1,
0.5439308, -0.1111288, 2.560087, 0.2666667, 0, 1, 1,
0.5482535, 0.2723264, -0.5431024, 0.2705882, 0, 1, 1,
0.5482621, 0.8099548, 1.913993, 0.2784314, 0, 1, 1,
0.5508102, -0.3432465, 4.114778, 0.282353, 0, 1, 1,
0.5519066, -0.310413, 2.087834, 0.2901961, 0, 1, 1,
0.5559283, -1.611856, 1.756109, 0.2941177, 0, 1, 1,
0.5575597, -0.3182842, 2.223531, 0.3019608, 0, 1, 1,
0.5598732, -0.123431, 1.34796, 0.3098039, 0, 1, 1,
0.5627363, -0.8064848, 2.197106, 0.3137255, 0, 1, 1,
0.5632514, 0.1365085, 0.8626288, 0.3215686, 0, 1, 1,
0.5645527, 0.1705307, 1.067545, 0.3254902, 0, 1, 1,
0.5650839, 0.1591275, 1.803629, 0.3333333, 0, 1, 1,
0.5652847, -1.709044, 1.993801, 0.3372549, 0, 1, 1,
0.5689614, 0.7731383, 0.2585808, 0.345098, 0, 1, 1,
0.5705312, 0.1411881, 2.542418, 0.3490196, 0, 1, 1,
0.5711428, -0.6847319, 1.254026, 0.3568628, 0, 1, 1,
0.5723425, 0.7176808, 0.8185365, 0.3607843, 0, 1, 1,
0.5790028, 0.7765824, 1.722236, 0.3686275, 0, 1, 1,
0.5879531, 0.191623, 0.9545338, 0.372549, 0, 1, 1,
0.5881982, -1.237767, 3.112564, 0.3803922, 0, 1, 1,
0.5884655, 0.1391019, 1.019937, 0.3843137, 0, 1, 1,
0.5902244, 1.690078, 0.5193218, 0.3921569, 0, 1, 1,
0.5945428, -0.7325162, 0.4202137, 0.3960784, 0, 1, 1,
0.5950158, -0.6358586, 4.143308, 0.4039216, 0, 1, 1,
0.5977373, -1.644524, 1.272943, 0.4117647, 0, 1, 1,
0.6008775, 0.4266102, 0.1834929, 0.4156863, 0, 1, 1,
0.608557, 0.6131833, 0.1395491, 0.4235294, 0, 1, 1,
0.6096526, -2.850296, 3.526396, 0.427451, 0, 1, 1,
0.6108902, -0.1382858, 2.13955, 0.4352941, 0, 1, 1,
0.6221501, -1.196581, 2.979928, 0.4392157, 0, 1, 1,
0.6263494, 0.6708168, 0.4146006, 0.4470588, 0, 1, 1,
0.6374825, 0.1517325, -0.5604326, 0.4509804, 0, 1, 1,
0.641535, 0.3367608, 0.8564532, 0.4588235, 0, 1, 1,
0.641951, -0.1167465, 1.565485, 0.4627451, 0, 1, 1,
0.6468174, -0.4765702, 0.7559322, 0.4705882, 0, 1, 1,
0.651713, 0.3884139, 0.3536939, 0.4745098, 0, 1, 1,
0.6539218, 0.198775, 0.9498162, 0.4823529, 0, 1, 1,
0.6572264, -1.560501, 0.9807028, 0.4862745, 0, 1, 1,
0.6582173, -0.9493919, 1.859984, 0.4941176, 0, 1, 1,
0.6656508, -0.01902285, 3.299727, 0.5019608, 0, 1, 1,
0.6694484, -1.045657, 2.069528, 0.5058824, 0, 1, 1,
0.6699723, 0.1889324, 2.763205, 0.5137255, 0, 1, 1,
0.6741511, -0.7989681, 1.832417, 0.5176471, 0, 1, 1,
0.677298, -0.4847026, 2.729698, 0.5254902, 0, 1, 1,
0.6838776, 0.7476858, 0.06561038, 0.5294118, 0, 1, 1,
0.6858927, -1.557034, 2.591347, 0.5372549, 0, 1, 1,
0.688343, 1.153754, 0.959191, 0.5411765, 0, 1, 1,
0.6930846, -1.048763, 1.326503, 0.5490196, 0, 1, 1,
0.7034701, 0.4642234, 1.153429, 0.5529412, 0, 1, 1,
0.7051962, 0.9379462, 1.136477, 0.5607843, 0, 1, 1,
0.706885, -0.4295317, 2.221395, 0.5647059, 0, 1, 1,
0.7113154, 0.09967896, 1.070335, 0.572549, 0, 1, 1,
0.7119321, 1.442379, 1.139275, 0.5764706, 0, 1, 1,
0.7164704, -0.1934472, 0.7290184, 0.5843138, 0, 1, 1,
0.7167202, 0.8601863, 0.1077573, 0.5882353, 0, 1, 1,
0.7173781, 0.7310485, -0.2456404, 0.5960785, 0, 1, 1,
0.7182519, -0.003541193, 1.279491, 0.6039216, 0, 1, 1,
0.7187046, 1.003399, 2.150718, 0.6078432, 0, 1, 1,
0.719444, -0.5474619, 3.042645, 0.6156863, 0, 1, 1,
0.7226407, 0.6320037, 1.593917, 0.6196079, 0, 1, 1,
0.7283968, -0.02533287, 3.155632, 0.627451, 0, 1, 1,
0.7299469, 2.188245, 0.5904219, 0.6313726, 0, 1, 1,
0.7327685, -1.434564, 2.578666, 0.6392157, 0, 1, 1,
0.7373462, 1.88073, 0.01237304, 0.6431373, 0, 1, 1,
0.7377447, 0.7015768, -0.6642606, 0.6509804, 0, 1, 1,
0.7462817, -0.5304768, 3.042049, 0.654902, 0, 1, 1,
0.7478708, -0.7052023, 4.373322, 0.6627451, 0, 1, 1,
0.7484055, -0.05069704, 1.182228, 0.6666667, 0, 1, 1,
0.7495844, -0.4504505, 2.592078, 0.6745098, 0, 1, 1,
0.7547174, 2.050348, 0.07378484, 0.6784314, 0, 1, 1,
0.7569311, 1.658017, 1.617094, 0.6862745, 0, 1, 1,
0.7586916, 0.765616, 0.8735864, 0.6901961, 0, 1, 1,
0.7612995, 0.5047289, 1.135921, 0.6980392, 0, 1, 1,
0.7629004, -0.130271, 2.107536, 0.7058824, 0, 1, 1,
0.7663451, 1.261379, 1.290082, 0.7098039, 0, 1, 1,
0.767326, -1.142231, 1.651044, 0.7176471, 0, 1, 1,
0.7687311, -0.89079, 1.813734, 0.7215686, 0, 1, 1,
0.7687894, -0.6174688, 2.778627, 0.7294118, 0, 1, 1,
0.7777046, -0.8850083, 4.727148, 0.7333333, 0, 1, 1,
0.7817215, -0.7910851, 2.846885, 0.7411765, 0, 1, 1,
0.7818568, -0.7007579, 2.99053, 0.7450981, 0, 1, 1,
0.7820011, 0.1523793, 0.02609929, 0.7529412, 0, 1, 1,
0.7829193, 0.05567231, 0.05974323, 0.7568628, 0, 1, 1,
0.7850823, 0.7553571, -0.329321, 0.7647059, 0, 1, 1,
0.7921628, 0.2396751, 2.162905, 0.7686275, 0, 1, 1,
0.7949824, 0.1249183, 2.061694, 0.7764706, 0, 1, 1,
0.7957365, 0.6195107, 2.214644, 0.7803922, 0, 1, 1,
0.7981896, -0.4211133, 2.885992, 0.7882353, 0, 1, 1,
0.8048899, 1.100755, -1.07693, 0.7921569, 0, 1, 1,
0.8051998, -0.9973874, 4.110739, 0.8, 0, 1, 1,
0.8074988, -0.686226, 2.022489, 0.8078431, 0, 1, 1,
0.808705, -0.6527205, 3.237494, 0.8117647, 0, 1, 1,
0.8095314, 0.8912193, 2.651257, 0.8196079, 0, 1, 1,
0.813594, -1.460092, 2.171238, 0.8235294, 0, 1, 1,
0.8156699, 1.029881, 1.282231, 0.8313726, 0, 1, 1,
0.8207465, -0.7535279, 1.987429, 0.8352941, 0, 1, 1,
0.8306905, -0.9285302, 2.853683, 0.8431373, 0, 1, 1,
0.8315252, 0.5665758, 0.940088, 0.8470588, 0, 1, 1,
0.8315526, -0.1986195, 3.413788, 0.854902, 0, 1, 1,
0.8384723, 0.513629, 0.4596148, 0.8588235, 0, 1, 1,
0.841853, -0.4766478, 1.686993, 0.8666667, 0, 1, 1,
0.8459629, -1.067605, 2.645454, 0.8705882, 0, 1, 1,
0.8516855, -1.565244, 4.158393, 0.8784314, 0, 1, 1,
0.866306, 2.430194, -1.14956, 0.8823529, 0, 1, 1,
0.8670292, 1.310564, 2.716212, 0.8901961, 0, 1, 1,
0.8699921, -0.1881272, 2.35183, 0.8941177, 0, 1, 1,
0.8986983, -0.6563429, 2.353388, 0.9019608, 0, 1, 1,
0.8991868, -1.761095, 2.222197, 0.9098039, 0, 1, 1,
0.9039772, -0.1850501, 1.554485, 0.9137255, 0, 1, 1,
0.9084362, 0.3059123, 1.886365, 0.9215686, 0, 1, 1,
0.9147956, -1.14827, 2.83983, 0.9254902, 0, 1, 1,
0.9224842, -0.2780925, 3.057699, 0.9333333, 0, 1, 1,
0.9372059, 0.7252271, -0.1876574, 0.9372549, 0, 1, 1,
0.950142, -1.060486, 2.601126, 0.945098, 0, 1, 1,
0.9516132, 1.088262, -0.7059876, 0.9490196, 0, 1, 1,
0.9548849, -1.904045, 4.441252, 0.9568627, 0, 1, 1,
0.9556117, -0.970654, 2.195071, 0.9607843, 0, 1, 1,
0.9558902, 0.9997002, 0.5451272, 0.9686275, 0, 1, 1,
0.9631582, -1.589725, 4.322137, 0.972549, 0, 1, 1,
0.9647372, -1.347934, 3.10327, 0.9803922, 0, 1, 1,
0.9732437, 1.505615, -0.07405484, 0.9843137, 0, 1, 1,
0.9807165, 0.4096221, 2.958497, 0.9921569, 0, 1, 1,
0.9809914, -0.1870808, 3.252897, 0.9960784, 0, 1, 1,
0.9848943, 0.3362177, 1.904081, 1, 0, 0.9960784, 1,
0.9895388, 0.715196, 0.1817414, 1, 0, 0.9882353, 1,
0.9897495, -2.345066, 0.7695282, 1, 0, 0.9843137, 1,
0.9910186, 0.682648, 1.557831, 1, 0, 0.9764706, 1,
0.9935164, 0.6210201, 2.680881, 1, 0, 0.972549, 1,
0.9948015, -0.5260171, 2.134709, 1, 0, 0.9647059, 1,
0.9956769, 0.4182102, 1.300831, 1, 0, 0.9607843, 1,
0.9958687, 0.9207429, 1.027515, 1, 0, 0.9529412, 1,
1.000798, -0.6636102, 0.5550217, 1, 0, 0.9490196, 1,
1.011534, -1.096671, 3.032819, 1, 0, 0.9411765, 1,
1.01272, -0.4715921, 1.857825, 1, 0, 0.9372549, 1,
1.020799, 0.260389, 1.851164, 1, 0, 0.9294118, 1,
1.02129, 1.629942, 0.2999395, 1, 0, 0.9254902, 1,
1.025148, 0.2604726, 0.7657554, 1, 0, 0.9176471, 1,
1.031339, -1.055101, 2.040025, 1, 0, 0.9137255, 1,
1.034043, -0.09164041, 1.070634, 1, 0, 0.9058824, 1,
1.035253, 1.051618, 1.429817, 1, 0, 0.9019608, 1,
1.037299, 1.202088, 2.821362, 1, 0, 0.8941177, 1,
1.04326, 0.9138126, -1.124585, 1, 0, 0.8862745, 1,
1.045117, -2.245304, 3.78818, 1, 0, 0.8823529, 1,
1.047925, 1.627473, 1.31009, 1, 0, 0.8745098, 1,
1.047929, 0.7125993, -0.04702999, 1, 0, 0.8705882, 1,
1.04849, 1.136535, 0.218197, 1, 0, 0.8627451, 1,
1.059642, 2.301244, -0.6463794, 1, 0, 0.8588235, 1,
1.07272, 1.255964, -0.7084462, 1, 0, 0.8509804, 1,
1.077215, 1.140267, 2.467483, 1, 0, 0.8470588, 1,
1.081308, -1.010647, 0.6945297, 1, 0, 0.8392157, 1,
1.084903, -0.2419045, 2.288087, 1, 0, 0.8352941, 1,
1.100508, -1.536586, 2.847045, 1, 0, 0.827451, 1,
1.110466, -0.3053764, 2.921928, 1, 0, 0.8235294, 1,
1.113712, -0.4142126, 0.3129339, 1, 0, 0.8156863, 1,
1.12142, -0.9100778, 2.791209, 1, 0, 0.8117647, 1,
1.134367, -0.2198006, 0.7087436, 1, 0, 0.8039216, 1,
1.140095, -1.330369, 2.784586, 1, 0, 0.7960784, 1,
1.14214, -1.05301, 1.53001, 1, 0, 0.7921569, 1,
1.146349, -0.09794961, 0.4554136, 1, 0, 0.7843137, 1,
1.146514, 0.4627957, -0.1477482, 1, 0, 0.7803922, 1,
1.147688, -0.8901376, 1.984579, 1, 0, 0.772549, 1,
1.148457, 1.17992, 1.4433, 1, 0, 0.7686275, 1,
1.155099, 0.09251521, 1.253677, 1, 0, 0.7607843, 1,
1.161075, -1.322896, 1.379895, 1, 0, 0.7568628, 1,
1.164612, 0.7463602, 1.228671, 1, 0, 0.7490196, 1,
1.168162, 0.3592467, 0.6401521, 1, 0, 0.7450981, 1,
1.173941, 0.479051, 0.5922388, 1, 0, 0.7372549, 1,
1.179064, -0.4361679, 3.002688, 1, 0, 0.7333333, 1,
1.180176, -2.751579, 2.324968, 1, 0, 0.7254902, 1,
1.191809, -0.7661165, 2.785375, 1, 0, 0.7215686, 1,
1.196106, 0.9882057, 0.4008167, 1, 0, 0.7137255, 1,
1.197406, -0.7294043, 1.222974, 1, 0, 0.7098039, 1,
1.207783, 0.5633853, 1.709842, 1, 0, 0.7019608, 1,
1.212474, 0.07211698, 0.8860477, 1, 0, 0.6941177, 1,
1.21966, -0.2709333, 0.8565838, 1, 0, 0.6901961, 1,
1.2273, -0.7263523, 0.3255835, 1, 0, 0.682353, 1,
1.227835, -2.882937, 2.174094, 1, 0, 0.6784314, 1,
1.232948, 0.9321966, 1.89328, 1, 0, 0.6705883, 1,
1.246294, -0.3266968, -0.2841617, 1, 0, 0.6666667, 1,
1.248796, 0.2048839, 1.471095, 1, 0, 0.6588235, 1,
1.258021, 1.235882, -0.7416579, 1, 0, 0.654902, 1,
1.260115, 0.1309341, 0.7734512, 1, 0, 0.6470588, 1,
1.262502, -1.387623, 1.625285, 1, 0, 0.6431373, 1,
1.26364, 0.3952674, 1.864487, 1, 0, 0.6352941, 1,
1.264228, 2.496418, 1.759124, 1, 0, 0.6313726, 1,
1.268329, -0.6298657, 2.606575, 1, 0, 0.6235294, 1,
1.269522, -0.1699994, 0.2698675, 1, 0, 0.6196079, 1,
1.272864, -0.653006, 1.483094, 1, 0, 0.6117647, 1,
1.273285, -0.09036177, 1.672555, 1, 0, 0.6078432, 1,
1.298455, -0.4640675, 0.527791, 1, 0, 0.6, 1,
1.298667, -0.3884267, 0.9062567, 1, 0, 0.5921569, 1,
1.300039, 0.7023859, 1.652429, 1, 0, 0.5882353, 1,
1.300479, 0.2112744, 1.845611, 1, 0, 0.5803922, 1,
1.301793, 1.002668, -0.927312, 1, 0, 0.5764706, 1,
1.306687, -2.594367, 4.153465, 1, 0, 0.5686275, 1,
1.309995, -1.133687, 1.018958, 1, 0, 0.5647059, 1,
1.321387, -1.198993, 2.155105, 1, 0, 0.5568628, 1,
1.328194, -2.795123, 2.193815, 1, 0, 0.5529412, 1,
1.332228, -0.2327649, 1.414569, 1, 0, 0.5450981, 1,
1.333007, 0.2193977, 0.9600713, 1, 0, 0.5411765, 1,
1.341713, -0.3876517, 0.2721943, 1, 0, 0.5333334, 1,
1.348041, -1.543233, 1.572692, 1, 0, 0.5294118, 1,
1.369383, -0.6571794, 1.218822, 1, 0, 0.5215687, 1,
1.372022, -0.1208736, 0.3366777, 1, 0, 0.5176471, 1,
1.384361, 3.050099, 1.290826, 1, 0, 0.509804, 1,
1.386916, 0.2063908, 0.4623202, 1, 0, 0.5058824, 1,
1.390282, 1.012468, 1.314328, 1, 0, 0.4980392, 1,
1.400913, 0.7221882, 2.062162, 1, 0, 0.4901961, 1,
1.402484, -0.7307092, 1.248314, 1, 0, 0.4862745, 1,
1.417811, -0.4893446, 0.8747982, 1, 0, 0.4784314, 1,
1.418207, 0.9766326, 0.8267985, 1, 0, 0.4745098, 1,
1.420229, 0.8834071, 1.771477, 1, 0, 0.4666667, 1,
1.421579, 1.180339, 0.8292896, 1, 0, 0.4627451, 1,
1.421823, 0.9077826, 1.255201, 1, 0, 0.454902, 1,
1.429157, 0.6462743, 2.036387, 1, 0, 0.4509804, 1,
1.429178, -0.5062511, 1.426887, 1, 0, 0.4431373, 1,
1.435525, -0.1235025, 2.269006, 1, 0, 0.4392157, 1,
1.441235, 0.1210225, 1.087191, 1, 0, 0.4313726, 1,
1.468077, 0.3216166, 0.6553357, 1, 0, 0.427451, 1,
1.472142, -0.5622832, 2.174813, 1, 0, 0.4196078, 1,
1.493522, 1.205219, -0.05772743, 1, 0, 0.4156863, 1,
1.498053, -0.1192002, 0.225861, 1, 0, 0.4078431, 1,
1.503303, 0.4305077, 1.611145, 1, 0, 0.4039216, 1,
1.508645, 1.4458, 2.205644, 1, 0, 0.3960784, 1,
1.514256, 0.07050623, 2.002238, 1, 0, 0.3882353, 1,
1.529189, -1.860971, 3.435686, 1, 0, 0.3843137, 1,
1.547833, -0.2598697, 3.033346, 1, 0, 0.3764706, 1,
1.547944, -0.6727055, 2.410112, 1, 0, 0.372549, 1,
1.548499, -0.5551896, 2.724559, 1, 0, 0.3647059, 1,
1.555797, 0.5037544, 0.4134747, 1, 0, 0.3607843, 1,
1.557568, -1.319604, 1.457547, 1, 0, 0.3529412, 1,
1.558426, -0.3351821, 0.9048912, 1, 0, 0.3490196, 1,
1.569057, 1.812501, 1.854833, 1, 0, 0.3411765, 1,
1.57273, 0.4147317, 0.1964644, 1, 0, 0.3372549, 1,
1.573592, -1.370529, 0.4528879, 1, 0, 0.3294118, 1,
1.575233, -0.9619747, 3.352517, 1, 0, 0.3254902, 1,
1.617201, -0.02033358, -0.02680675, 1, 0, 0.3176471, 1,
1.649463, -0.6159095, 1.24738, 1, 0, 0.3137255, 1,
1.650999, -0.6684976, 0.9135998, 1, 0, 0.3058824, 1,
1.661928, -1.070089, 2.303925, 1, 0, 0.2980392, 1,
1.674666, 2.652554, -0.08836258, 1, 0, 0.2941177, 1,
1.675743, 0.3629169, 0.9760612, 1, 0, 0.2862745, 1,
1.681572, 0.1479596, 2.391349, 1, 0, 0.282353, 1,
1.687451, 0.0214062, 1.582341, 1, 0, 0.2745098, 1,
1.720881, -0.5356743, -0.5444455, 1, 0, 0.2705882, 1,
1.72355, 0.2793844, 0.7685781, 1, 0, 0.2627451, 1,
1.726899, 0.6495658, 1.821246, 1, 0, 0.2588235, 1,
1.733513, 1.481556, -0.004410329, 1, 0, 0.2509804, 1,
1.799338, 0.8486626, 0.6646082, 1, 0, 0.2470588, 1,
1.80863, 2.084222, 0.7619747, 1, 0, 0.2392157, 1,
1.825384, 0.09143589, 0.892642, 1, 0, 0.2352941, 1,
1.825666, 1.276257, 0.5725647, 1, 0, 0.227451, 1,
1.829343, -1.966795, 0.8974029, 1, 0, 0.2235294, 1,
1.903638, 0.7689666, 2.337209, 1, 0, 0.2156863, 1,
1.92834, -1.386676, 1.609259, 1, 0, 0.2117647, 1,
2.017678, 0.2567579, 1.009952, 1, 0, 0.2039216, 1,
2.02063, 0.8007489, 1.301774, 1, 0, 0.1960784, 1,
2.021789, -0.1961822, 0.02425554, 1, 0, 0.1921569, 1,
2.024012, -0.6714742, 2.069633, 1, 0, 0.1843137, 1,
2.036119, -0.3301352, 1.670011, 1, 0, 0.1803922, 1,
2.047422, -0.8769282, 0.5730089, 1, 0, 0.172549, 1,
2.049046, -1.670959, 1.212247, 1, 0, 0.1686275, 1,
2.052217, -0.1839648, 1.085633, 1, 0, 0.1607843, 1,
2.052458, -0.8954998, 2.12411, 1, 0, 0.1568628, 1,
2.096727, -0.2418203, 1.68475, 1, 0, 0.1490196, 1,
2.101521, 0.9145647, 0.2479025, 1, 0, 0.145098, 1,
2.114151, 0.8777532, 2.212812, 1, 0, 0.1372549, 1,
2.114578, 0.1202543, 3.667126, 1, 0, 0.1333333, 1,
2.124454, 1.547125, -0.5208953, 1, 0, 0.1254902, 1,
2.17509, -1.863615, 1.662109, 1, 0, 0.1215686, 1,
2.194169, 2.279488, 0.2756222, 1, 0, 0.1137255, 1,
2.261551, 0.6698971, 1.3855, 1, 0, 0.1098039, 1,
2.261674, -0.4452415, 1.247634, 1, 0, 0.1019608, 1,
2.26279, 3.493032, 1.563857, 1, 0, 0.09411765, 1,
2.291987, 0.2939585, 1.111577, 1, 0, 0.09019608, 1,
2.305312, 0.6496911, 2.912699, 1, 0, 0.08235294, 1,
2.353193, -1.004157, 4.225093, 1, 0, 0.07843138, 1,
2.364518, -0.09648739, 0.810941, 1, 0, 0.07058824, 1,
2.389575, -0.9755658, 3.164481, 1, 0, 0.06666667, 1,
2.393238, 1.072181, -0.2468601, 1, 0, 0.05882353, 1,
2.421363, -0.008349377, 1.000377, 1, 0, 0.05490196, 1,
2.425761, 1.005279, 0.7782789, 1, 0, 0.04705882, 1,
2.474865, -0.5947198, 2.656821, 1, 0, 0.04313726, 1,
2.525652, 1.840817, 0.5121329, 1, 0, 0.03529412, 1,
2.578161, 0.2333532, 1.77356, 1, 0, 0.03137255, 1,
2.695461, 0.1893937, 1.500579, 1, 0, 0.02352941, 1,
2.853878, -1.430416, 2.147144, 1, 0, 0.01960784, 1,
2.978684, -0.04897553, 1.724274, 1, 0, 0.01176471, 1,
3.06582, -0.01451664, -0.2601081, 1, 0, 0.007843138, 1
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
0.0413295, -3.963664, -7.06441, 0, -0.5, 0.5, 0.5,
0.0413295, -3.963664, -7.06441, 1, -0.5, 0.5, 0.5,
0.0413295, -3.963664, -7.06441, 1, 1.5, 0.5, 0.5,
0.0413295, -3.963664, -7.06441, 0, 1.5, 0.5, 0.5
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
-4.008463, 0.3050472, -7.06441, 0, -0.5, 0.5, 0.5,
-4.008463, 0.3050472, -7.06441, 1, -0.5, 0.5, 0.5,
-4.008463, 0.3050472, -7.06441, 1, 1.5, 0.5, 0.5,
-4.008463, 0.3050472, -7.06441, 0, 1.5, 0.5, 0.5
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
-4.008463, -3.963664, -0.3092406, 0, -0.5, 0.5, 0.5,
-4.008463, -3.963664, -0.3092406, 1, -0.5, 0.5, 0.5,
-4.008463, -3.963664, -0.3092406, 1, 1.5, 0.5, 0.5,
-4.008463, -3.963664, -0.3092406, 0, 1.5, 0.5, 0.5
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
-2, -2.978577, -5.505525,
3, -2.978577, -5.505525,
-2, -2.978577, -5.505525,
-2, -3.142758, -5.765339,
-1, -2.978577, -5.505525,
-1, -3.142758, -5.765339,
0, -2.978577, -5.505525,
0, -3.142758, -5.765339,
1, -2.978577, -5.505525,
1, -3.142758, -5.765339,
2, -2.978577, -5.505525,
2, -3.142758, -5.765339,
3, -2.978577, -5.505525,
3, -3.142758, -5.765339
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
-2, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
-2, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
-2, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
-2, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5,
-1, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
-1, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
-1, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
-1, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5,
0, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
0, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
0, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
0, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5,
1, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
1, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
1, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
1, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5,
2, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
2, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
2, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
2, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5,
3, -3.471121, -6.284967, 0, -0.5, 0.5, 0.5,
3, -3.471121, -6.284967, 1, -0.5, 0.5, 0.5,
3, -3.471121, -6.284967, 1, 1.5, 0.5, 0.5,
3, -3.471121, -6.284967, 0, 1.5, 0.5, 0.5
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
-3.073895, -2, -5.505525,
-3.073895, 3, -5.505525,
-3.073895, -2, -5.505525,
-3.229657, -2, -5.765339,
-3.073895, -1, -5.505525,
-3.229657, -1, -5.765339,
-3.073895, 0, -5.505525,
-3.229657, 0, -5.765339,
-3.073895, 1, -5.505525,
-3.229657, 1, -5.765339,
-3.073895, 2, -5.505525,
-3.229657, 2, -5.765339,
-3.073895, 3, -5.505525,
-3.229657, 3, -5.765339
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
-3.541179, -2, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, -2, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, -2, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, -2, -6.284967, 0, 1.5, 0.5, 0.5,
-3.541179, -1, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, -1, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, -1, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, -1, -6.284967, 0, 1.5, 0.5, 0.5,
-3.541179, 0, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, 0, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, 0, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, 0, -6.284967, 0, 1.5, 0.5, 0.5,
-3.541179, 1, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, 1, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, 1, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, 1, -6.284967, 0, 1.5, 0.5, 0.5,
-3.541179, 2, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, 2, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, 2, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, 2, -6.284967, 0, 1.5, 0.5, 0.5,
-3.541179, 3, -6.284967, 0, -0.5, 0.5, 0.5,
-3.541179, 3, -6.284967, 1, -0.5, 0.5, 0.5,
-3.541179, 3, -6.284967, 1, 1.5, 0.5, 0.5,
-3.541179, 3, -6.284967, 0, 1.5, 0.5, 0.5
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
-3.073895, -2.978577, -4,
-3.073895, -2.978577, 4,
-3.073895, -2.978577, -4,
-3.229657, -3.142758, -4,
-3.073895, -2.978577, -2,
-3.229657, -3.142758, -2,
-3.073895, -2.978577, 0,
-3.229657, -3.142758, 0,
-3.073895, -2.978577, 2,
-3.229657, -3.142758, 2,
-3.073895, -2.978577, 4,
-3.229657, -3.142758, 4
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
-3.541179, -3.471121, -4, 0, -0.5, 0.5, 0.5,
-3.541179, -3.471121, -4, 1, -0.5, 0.5, 0.5,
-3.541179, -3.471121, -4, 1, 1.5, 0.5, 0.5,
-3.541179, -3.471121, -4, 0, 1.5, 0.5, 0.5,
-3.541179, -3.471121, -2, 0, -0.5, 0.5, 0.5,
-3.541179, -3.471121, -2, 1, -0.5, 0.5, 0.5,
-3.541179, -3.471121, -2, 1, 1.5, 0.5, 0.5,
-3.541179, -3.471121, -2, 0, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 0, 0, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 0, 1, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 0, 1, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 0, 0, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 2, 0, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 2, 1, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 2, 1, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 2, 0, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 4, 0, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 4, 1, -0.5, 0.5, 0.5,
-3.541179, -3.471121, 4, 1, 1.5, 0.5, 0.5,
-3.541179, -3.471121, 4, 0, 1.5, 0.5, 0.5
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
-3.073895, -2.978577, -5.505525,
-3.073895, 3.588671, -5.505525,
-3.073895, -2.978577, 4.887043,
-3.073895, 3.588671, 4.887043,
-3.073895, -2.978577, -5.505525,
-3.073895, -2.978577, 4.887043,
-3.073895, 3.588671, -5.505525,
-3.073895, 3.588671, 4.887043,
-3.073895, -2.978577, -5.505525,
3.156554, -2.978577, -5.505525,
-3.073895, -2.978577, 4.887043,
3.156554, -2.978577, 4.887043,
-3.073895, 3.588671, -5.505525,
3.156554, 3.588671, -5.505525,
-3.073895, 3.588671, 4.887043,
3.156554, 3.588671, 4.887043,
3.156554, -2.978577, -5.505525,
3.156554, 3.588671, -5.505525,
3.156554, -2.978577, 4.887043,
3.156554, 3.588671, 4.887043,
3.156554, -2.978577, -5.505525,
3.156554, -2.978577, 4.887043,
3.156554, 3.588671, -5.505525,
3.156554, 3.588671, 4.887043
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
var radius = 7.359499;
var distance = 32.74324;
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
mvMatrix.translate( -0.0413295, -0.3050472, 0.3092406 );
mvMatrix.scale( 1.277152, 1.211654, 0.7656658 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.74324);
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
tebuthiuron<-read.table("tebuthiuron.xyz")
```

```
## Error in read.table("tebuthiuron.xyz"): no lines available in input
```

```r
x<-tebuthiuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
```

```r
y<-tebuthiuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
```

```r
z<-tebuthiuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
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
-2.983161, -0.4605327, -2.776444, 0, 0, 1, 1, 1,
-2.741446, 0.59084, -0.1558272, 1, 0, 0, 1, 1,
-2.702075, 0.02737208, -0.8978912, 1, 0, 0, 1, 1,
-2.628065, 0.6599724, -0.762447, 1, 0, 0, 1, 1,
-2.60706, -1.041282, -2.884549, 1, 0, 0, 1, 1,
-2.566899, -0.5207075, -1.303822, 1, 0, 0, 1, 1,
-2.529538, -1.10016, -2.157369, 0, 0, 0, 1, 1,
-2.409748, -0.8119453, -2.397878, 0, 0, 0, 1, 1,
-2.311002, 0.2189656, -3.248775, 0, 0, 0, 1, 1,
-2.244638, -0.02060139, -2.713245, 0, 0, 0, 1, 1,
-2.241482, -2.569535, -3.746075, 0, 0, 0, 1, 1,
-2.142587, 0.1650012, -1.750685, 0, 0, 0, 1, 1,
-2.041174, -1.292248, -5.315689, 0, 0, 0, 1, 1,
-2.017795, 1.091744, -1.014238, 1, 1, 1, 1, 1,
-1.992999, -0.8746827, -2.382663, 1, 1, 1, 1, 1,
-1.96023, 0.310472, -1.716189, 1, 1, 1, 1, 1,
-1.954034, 0.7654744, -0.5083919, 1, 1, 1, 1, 1,
-1.940081, -0.4960696, -2.911308, 1, 1, 1, 1, 1,
-1.912136, -0.4522738, -2.115369, 1, 1, 1, 1, 1,
-1.91021, -0.4130707, -1.761342, 1, 1, 1, 1, 1,
-1.885876, -1.158951, -2.43845, 1, 1, 1, 1, 1,
-1.864363, 0.3185258, -2.750308, 1, 1, 1, 1, 1,
-1.864266, -0.6040815, -0.8258831, 1, 1, 1, 1, 1,
-1.852534, 1.236493, -0.6865603, 1, 1, 1, 1, 1,
-1.85025, 0.7807546, -1.148059, 1, 1, 1, 1, 1,
-1.838382, 0.3793968, -2.423905, 1, 1, 1, 1, 1,
-1.818288, -1.632915, -4.072991, 1, 1, 1, 1, 1,
-1.793276, 0.9350223, -1.558363, 1, 1, 1, 1, 1,
-1.771531, -0.800963, -2.265825, 0, 0, 1, 1, 1,
-1.769826, -1.940103, -2.500714, 1, 0, 0, 1, 1,
-1.760687, 1.909011, 0.01487105, 1, 0, 0, 1, 1,
-1.750351, -0.7560623, -2.618058, 1, 0, 0, 1, 1,
-1.749707, -0.1762206, -3.101745, 1, 0, 0, 1, 1,
-1.748003, -0.7266585, -1.290446, 1, 0, 0, 1, 1,
-1.7169, -0.3137134, -2.789852, 0, 0, 0, 1, 1,
-1.695155, -0.7104197, -2.623997, 0, 0, 0, 1, 1,
-1.691549, 0.5937393, 0.2402864, 0, 0, 0, 1, 1,
-1.688933, -0.5169792, -2.001538, 0, 0, 0, 1, 1,
-1.687698, 1.811044, -1.682592, 0, 0, 0, 1, 1,
-1.680454, 0.02797562, -0.2231781, 0, 0, 0, 1, 1,
-1.680202, -0.5964285, -2.417053, 0, 0, 0, 1, 1,
-1.654113, -0.687229, -2.708147, 1, 1, 1, 1, 1,
-1.648892, -0.8226487, -1.342144, 1, 1, 1, 1, 1,
-1.647297, -0.800378, -3.371001, 1, 1, 1, 1, 1,
-1.629605, 0.6676887, -0.288067, 1, 1, 1, 1, 1,
-1.624521, 0.5996883, -0.7676785, 1, 1, 1, 1, 1,
-1.619484, -0.04607864, -0.5448806, 1, 1, 1, 1, 1,
-1.609053, -1.667673, -2.519521, 1, 1, 1, 1, 1,
-1.599845, 0.3046751, -1.552112, 1, 1, 1, 1, 1,
-1.585606, -0.6335465, -0.5228265, 1, 1, 1, 1, 1,
-1.582846, -0.6280634, -3.046996, 1, 1, 1, 1, 1,
-1.557368, -0.5633692, -1.251033, 1, 1, 1, 1, 1,
-1.556642, 2.020017, -0.8751847, 1, 1, 1, 1, 1,
-1.547094, -0.275208, -0.9538416, 1, 1, 1, 1, 1,
-1.546225, -1.477292, -1.148372, 1, 1, 1, 1, 1,
-1.534564, -0.1302672, -1.570457, 1, 1, 1, 1, 1,
-1.531801, -2.341943, -3.891862, 0, 0, 1, 1, 1,
-1.507343, 2.529636, 1.284249, 1, 0, 0, 1, 1,
-1.505409, 1.510396, -0.7145892, 1, 0, 0, 1, 1,
-1.49374, -2.214165, -4.668669, 1, 0, 0, 1, 1,
-1.4931, -0.2372921, -3.871246, 1, 0, 0, 1, 1,
-1.488987, -0.7978078, -0.4759763, 1, 0, 0, 1, 1,
-1.48038, 0.6515813, 0.1815717, 0, 0, 0, 1, 1,
-1.471767, 1.451403, -1.87429, 0, 0, 0, 1, 1,
-1.466298, -0.6150816, -2.646458, 0, 0, 0, 1, 1,
-1.464034, 1.831711, -1.532965, 0, 0, 0, 1, 1,
-1.45904, 0.5120074, -2.520178, 0, 0, 0, 1, 1,
-1.454649, 0.08950522, -0.4353735, 0, 0, 0, 1, 1,
-1.450267, -1.512355, -1.220444, 0, 0, 0, 1, 1,
-1.448928, 0.7174547, -2.390488, 1, 1, 1, 1, 1,
-1.447181, -0.3528836, -2.628295, 1, 1, 1, 1, 1,
-1.446668, -0.3046985, -1.18486, 1, 1, 1, 1, 1,
-1.443779, -0.9778088, -0.6348144, 1, 1, 1, 1, 1,
-1.4293, 1.505744, -0.1530968, 1, 1, 1, 1, 1,
-1.40585, -1.146462, -1.510689, 1, 1, 1, 1, 1,
-1.399596, -0.1074982, -2.599063, 1, 1, 1, 1, 1,
-1.399423, -1.178489, -3.576906, 1, 1, 1, 1, 1,
-1.39269, -0.9468333, -4.269234, 1, 1, 1, 1, 1,
-1.376258, 1.172058, -1.530805, 1, 1, 1, 1, 1,
-1.369656, -0.4549479, -0.6522076, 1, 1, 1, 1, 1,
-1.362514, -0.6812519, -1.866667, 1, 1, 1, 1, 1,
-1.360343, 0.08509732, -0.02362655, 1, 1, 1, 1, 1,
-1.345409, 0.2893275, -1.034397, 1, 1, 1, 1, 1,
-1.338449, 1.943333, 0.8913392, 1, 1, 1, 1, 1,
-1.331525, 0.7774489, -0.8889813, 0, 0, 1, 1, 1,
-1.326823, -0.1884824, -0.9246403, 1, 0, 0, 1, 1,
-1.315968, 0.01784863, 1.204381, 1, 0, 0, 1, 1,
-1.300532, 0.432572, -3.312564, 1, 0, 0, 1, 1,
-1.298157, 0.2985975, -2.691152, 1, 0, 0, 1, 1,
-1.294285, 0.9371238, -0.3033155, 1, 0, 0, 1, 1,
-1.291631, -0.4338951, -2.757347, 0, 0, 0, 1, 1,
-1.289768, -0.9667682, -2.039468, 0, 0, 0, 1, 1,
-1.275901, -1.168392, -3.114611, 0, 0, 0, 1, 1,
-1.272892, 0.9986522, -0.6826649, 0, 0, 0, 1, 1,
-1.268143, -1.173329, -1.302935, 0, 0, 0, 1, 1,
-1.264147, -0.785916, -1.358945, 0, 0, 0, 1, 1,
-1.258967, -0.7798695, -1.700267, 0, 0, 0, 1, 1,
-1.255877, -1.06156, -2.803612, 1, 1, 1, 1, 1,
-1.252218, -0.5344877, -2.404366, 1, 1, 1, 1, 1,
-1.249918, 0.2910818, -1.854033, 1, 1, 1, 1, 1,
-1.249608, -1.224631, -3.069948, 1, 1, 1, 1, 1,
-1.246963, -0.06437287, -1.611569, 1, 1, 1, 1, 1,
-1.237893, -0.493683, -1.604082, 1, 1, 1, 1, 1,
-1.237363, -1.73821, -3.913997, 1, 1, 1, 1, 1,
-1.219066, -0.01743769, -0.8168638, 1, 1, 1, 1, 1,
-1.21434, -1.656656, -2.218967, 1, 1, 1, 1, 1,
-1.209787, -1.2848, -3.777179, 1, 1, 1, 1, 1,
-1.203699, -1.147165, -0.2205173, 1, 1, 1, 1, 1,
-1.195358, -0.3303418, -1.9181, 1, 1, 1, 1, 1,
-1.191681, -0.4388255, -3.036597, 1, 1, 1, 1, 1,
-1.187485, -1.945687, -3.666998, 1, 1, 1, 1, 1,
-1.186852, 0.2659713, -2.373969, 1, 1, 1, 1, 1,
-1.157386, 1.19701, 0.3379797, 0, 0, 1, 1, 1,
-1.155152, 0.8815463, -2.105134, 1, 0, 0, 1, 1,
-1.139431, -0.3117786, -1.121629, 1, 0, 0, 1, 1,
-1.122996, 0.909551, 0.70698, 1, 0, 0, 1, 1,
-1.12194, 0.2368864, -0.02156224, 1, 0, 0, 1, 1,
-1.117097, -0.1388685, -0.7258714, 1, 0, 0, 1, 1,
-1.113651, -1.207, -0.5876583, 0, 0, 0, 1, 1,
-1.112232, -0.6765601, -3.539747, 0, 0, 0, 1, 1,
-1.111255, -1.132037, -1.984464, 0, 0, 0, 1, 1,
-1.10906, 0.3965622, -1.314912, 0, 0, 0, 1, 1,
-1.10643, 0.08977291, -2.242818, 0, 0, 0, 1, 1,
-1.103823, -0.3764907, -1.161228, 0, 0, 0, 1, 1,
-1.102433, 0.1042928, -0.9368423, 0, 0, 0, 1, 1,
-1.092027, -0.549086, -0.7169919, 1, 1, 1, 1, 1,
-1.088665, 0.7760375, -1.483648, 1, 1, 1, 1, 1,
-1.081724, -2.049772, -3.036755, 1, 1, 1, 1, 1,
-1.073464, 0.6114184, -1.732979, 1, 1, 1, 1, 1,
-1.068821, -1.727298, -3.071749, 1, 1, 1, 1, 1,
-1.067762, 1.466376, -0.3689905, 1, 1, 1, 1, 1,
-1.062963, 0.9828598, -0.4859923, 1, 1, 1, 1, 1,
-1.055992, -1.18597, -2.338498, 1, 1, 1, 1, 1,
-1.051939, -0.09074717, -1.600996, 1, 1, 1, 1, 1,
-1.048144, 2.075372, -0.6654385, 1, 1, 1, 1, 1,
-1.03284, 0.2342112, -0.9735261, 1, 1, 1, 1, 1,
-1.03262, -1.029638, -4.348312, 1, 1, 1, 1, 1,
-1.029482, -0.7986091, -3.654092, 1, 1, 1, 1, 1,
-1.026648, 1.172654, -1.362292, 1, 1, 1, 1, 1,
-1.025333, -0.4940321, -2.983151, 1, 1, 1, 1, 1,
-1.010093, -0.4826788, -4.803206, 0, 0, 1, 1, 1,
-1.008537, -1.071073, -3.200324, 1, 0, 0, 1, 1,
-1.006621, -0.3231606, -2.580865, 1, 0, 0, 1, 1,
-1.003908, 0.1014646, -1.902228, 1, 0, 0, 1, 1,
-1.003733, 0.6994961, -0.6225531, 1, 0, 0, 1, 1,
-0.9986032, 1.720408, -1.195947, 1, 0, 0, 1, 1,
-0.9977196, -0.4596437, -2.372581, 0, 0, 0, 1, 1,
-0.9916098, 0.3756841, 1.13849, 0, 0, 0, 1, 1,
-0.9909631, 0.8157809, -1.068874, 0, 0, 0, 1, 1,
-0.9842528, 1.35406, -2.7524, 0, 0, 0, 1, 1,
-0.9818974, 0.3620354, 0.04808907, 0, 0, 0, 1, 1,
-0.9799981, -0.5653821, -1.701675, 0, 0, 0, 1, 1,
-0.9751934, -0.2371047, -2.986904, 0, 0, 0, 1, 1,
-0.9750451, -1.217542, -1.392825, 1, 1, 1, 1, 1,
-0.9703117, 0.05922295, -1.642249, 1, 1, 1, 1, 1,
-0.9637039, 0.3306178, -1.818255, 1, 1, 1, 1, 1,
-0.9611313, -1.758542, -3.511795, 1, 1, 1, 1, 1,
-0.9484122, -0.199487, -1.538766, 1, 1, 1, 1, 1,
-0.948231, -0.5690368, -0.2094322, 1, 1, 1, 1, 1,
-0.9445381, 0.1898292, -1.624992, 1, 1, 1, 1, 1,
-0.9440434, 1.30435, -2.064894, 1, 1, 1, 1, 1,
-0.939486, -1.082304, -3.403016, 1, 1, 1, 1, 1,
-0.9352098, -0.6725937, -1.775168, 1, 1, 1, 1, 1,
-0.929471, -2.272966, -2.711456, 1, 1, 1, 1, 1,
-0.9159769, 1.009746, -0.4704265, 1, 1, 1, 1, 1,
-0.9086984, -1.805399, -1.933525, 1, 1, 1, 1, 1,
-0.9017661, -0.527014, -2.266594, 1, 1, 1, 1, 1,
-0.8921874, -1.647412, -1.685524, 1, 1, 1, 1, 1,
-0.8872209, 1.728446, -1.557642, 0, 0, 1, 1, 1,
-0.8837207, 0.8906813, -2.213819, 1, 0, 0, 1, 1,
-0.8804808, -0.148925, -0.7967086, 1, 0, 0, 1, 1,
-0.8768024, 0.4888378, -1.512017, 1, 0, 0, 1, 1,
-0.8573255, 0.494104, -0.5512137, 1, 0, 0, 1, 1,
-0.8501739, -0.5429586, -2.738876, 1, 0, 0, 1, 1,
-0.841482, -0.6326828, -2.060459, 0, 0, 0, 1, 1,
-0.8380609, -0.3913821, -1.155125, 0, 0, 0, 1, 1,
-0.8375985, -0.1759689, -2.043906, 0, 0, 0, 1, 1,
-0.8363885, -0.431809, -2.5604, 0, 0, 0, 1, 1,
-0.8284826, -1.846624, -3.546059, 0, 0, 0, 1, 1,
-0.8245703, 2.547984, -1.10219, 0, 0, 0, 1, 1,
-0.8244061, 0.9264047, -0.3792731, 0, 0, 0, 1, 1,
-0.8215486, -0.07603768, -1.385629, 1, 1, 1, 1, 1,
-0.8197712, -1.528196, -2.625663, 1, 1, 1, 1, 1,
-0.8172263, -0.2689425, -1.498676, 1, 1, 1, 1, 1,
-0.8044106, 0.3894041, -1.877158, 1, 1, 1, 1, 1,
-0.8028928, -0.6240072, -3.336485, 1, 1, 1, 1, 1,
-0.8009016, -0.2202651, -1.888274, 1, 1, 1, 1, 1,
-0.7999125, -0.1506422, -1.312925, 1, 1, 1, 1, 1,
-0.7996625, -0.6306331, -1.937451, 1, 1, 1, 1, 1,
-0.7947021, -0.7485673, -3.069808, 1, 1, 1, 1, 1,
-0.7892185, 0.1896152, -0.9227738, 1, 1, 1, 1, 1,
-0.7891253, -0.2642643, -1.26266, 1, 1, 1, 1, 1,
-0.7865117, 0.7179098, 0.1278779, 1, 1, 1, 1, 1,
-0.7832716, 1.27987, -0.4352028, 1, 1, 1, 1, 1,
-0.7763121, 0.1183115, -1.740723, 1, 1, 1, 1, 1,
-0.7744278, 0.1220431, -1.172174, 1, 1, 1, 1, 1,
-0.7727444, 0.06185072, -1.972143, 0, 0, 1, 1, 1,
-0.7700952, 0.9533592, -2.348394, 1, 0, 0, 1, 1,
-0.766883, 1.304598, -0.3501559, 1, 0, 0, 1, 1,
-0.7659735, 0.04421576, -1.250697, 1, 0, 0, 1, 1,
-0.7657616, -0.254829, -0.3707313, 1, 0, 0, 1, 1,
-0.7631336, -1.552561, -3.103606, 1, 0, 0, 1, 1,
-0.7557813, -1.237569, -1.184504, 0, 0, 0, 1, 1,
-0.7513377, 0.5948515, -0.8252845, 0, 0, 0, 1, 1,
-0.7497859, -2.708398, -2.001101, 0, 0, 0, 1, 1,
-0.7472799, -0.5243178, -2.519521, 0, 0, 0, 1, 1,
-0.7472724, 0.001934476, -1.565888, 0, 0, 0, 1, 1,
-0.7442093, 0.7891947, -0.8246115, 0, 0, 0, 1, 1,
-0.7412762, 0.4206193, -0.6625809, 0, 0, 0, 1, 1,
-0.7412142, 0.6564186, 0.407558, 1, 1, 1, 1, 1,
-0.7409821, 3.007531, 1.766702, 1, 1, 1, 1, 1,
-0.7394231, -0.8663098, -2.253998, 1, 1, 1, 1, 1,
-0.7387125, -0.09980059, -3.556603, 1, 1, 1, 1, 1,
-0.7386006, -0.1493118, -0.567793, 1, 1, 1, 1, 1,
-0.7346166, -0.2970642, -3.063353, 1, 1, 1, 1, 1,
-0.7327623, -0.3860046, -2.498878, 1, 1, 1, 1, 1,
-0.7312172, 0.3009427, -0.3623881, 1, 1, 1, 1, 1,
-0.7294109, 0.02866602, -2.666865, 1, 1, 1, 1, 1,
-0.7258566, 0.3497643, -0.2365988, 1, 1, 1, 1, 1,
-0.7215204, 0.2870936, -2.933162, 1, 1, 1, 1, 1,
-0.7195346, -0.09967396, -1.679702, 1, 1, 1, 1, 1,
-0.7174883, 1.626018, 0.06484595, 1, 1, 1, 1, 1,
-0.7164596, 0.2285476, -1.011122, 1, 1, 1, 1, 1,
-0.7127832, 2.074304, -1.473686, 1, 1, 1, 1, 1,
-0.7127288, 0.2430844, -0.4001167, 0, 0, 1, 1, 1,
-0.7125537, 2.391711, 0.7921831, 1, 0, 0, 1, 1,
-0.7119174, 0.422815, -2.015076, 1, 0, 0, 1, 1,
-0.7069638, -1.239416, -0.9343274, 1, 0, 0, 1, 1,
-0.7053604, 0.05321657, -2.593879, 1, 0, 0, 1, 1,
-0.6988608, 1.246543, -1.724296, 1, 0, 0, 1, 1,
-0.6928441, -0.8851866, -3.304286, 0, 0, 0, 1, 1,
-0.6840415, 0.5923237, -0.8913088, 0, 0, 0, 1, 1,
-0.6817681, 0.1905701, -0.3776477, 0, 0, 0, 1, 1,
-0.6773574, -1.89408, -2.867304, 0, 0, 0, 1, 1,
-0.6745248, 1.019857, 0.1087008, 0, 0, 0, 1, 1,
-0.6727375, -0.3987367, -1.050581, 0, 0, 0, 1, 1,
-0.6688935, -0.4825346, -2.984354, 0, 0, 0, 1, 1,
-0.6688466, -0.7404354, -4.015265, 1, 1, 1, 1, 1,
-0.6648939, 1.444578, -2.0018, 1, 1, 1, 1, 1,
-0.6623703, 0.8860848, -0.7160743, 1, 1, 1, 1, 1,
-0.6596951, -0.1459428, -2.961277, 1, 1, 1, 1, 1,
-0.6569489, 0.04115786, -2.634628, 1, 1, 1, 1, 1,
-0.6495104, 1.902559, -0.04256794, 1, 1, 1, 1, 1,
-0.6493717, -1.040905, -3.25195, 1, 1, 1, 1, 1,
-0.6419477, 0.2549728, -0.3100902, 1, 1, 1, 1, 1,
-0.6356352, 0.8671005, 0.7243517, 1, 1, 1, 1, 1,
-0.6343175, -0.578021, -3.780574, 1, 1, 1, 1, 1,
-0.6282414, 0.0663565, -1.452035, 1, 1, 1, 1, 1,
-0.6216897, 1.159974, -2.305249, 1, 1, 1, 1, 1,
-0.6198155, -0.2562662, -0.7067289, 1, 1, 1, 1, 1,
-0.6181965, 0.7164213, -1.63845, 1, 1, 1, 1, 1,
-0.6165007, 2.45838, 0.4783465, 1, 1, 1, 1, 1,
-0.6104279, 1.854232, -1.050568, 0, 0, 1, 1, 1,
-0.6052365, 1.074913, -0.457172, 1, 0, 0, 1, 1,
-0.6044756, 1.660856, -1.705376, 1, 0, 0, 1, 1,
-0.6028849, 0.5215805, 0.2746621, 1, 0, 0, 1, 1,
-0.6014497, 0.6227047, -0.3598775, 1, 0, 0, 1, 1,
-0.5957769, -0.6575992, -0.08525196, 1, 0, 0, 1, 1,
-0.5896553, 0.9722272, -0.6136082, 0, 0, 0, 1, 1,
-0.5851095, 1.809538, 0.08785454, 0, 0, 0, 1, 1,
-0.5841779, -0.4334538, -0.7137653, 0, 0, 0, 1, 1,
-0.5822247, 0.4992483, -0.7971677, 0, 0, 0, 1, 1,
-0.5816078, 0.9918077, -1.187143, 0, 0, 0, 1, 1,
-0.5806935, -0.3641482, -2.796381, 0, 0, 0, 1, 1,
-0.5778216, -0.8855729, -0.2316251, 0, 0, 0, 1, 1,
-0.5750899, 1.600882, 0.8607575, 1, 1, 1, 1, 1,
-0.5720128, 1.887006, 0.3488865, 1, 1, 1, 1, 1,
-0.5717412, -0.8335559, -2.851829, 1, 1, 1, 1, 1,
-0.5714777, 0.1552982, -2.023128, 1, 1, 1, 1, 1,
-0.5655079, -0.7101836, -0.5441168, 1, 1, 1, 1, 1,
-0.5628208, 0.3473111, -0.1872184, 1, 1, 1, 1, 1,
-0.5626586, -0.4469557, -1.732241, 1, 1, 1, 1, 1,
-0.5623127, -1.164083, -3.401803, 1, 1, 1, 1, 1,
-0.5609111, 0.5070112, -0.9449162, 1, 1, 1, 1, 1,
-0.5596689, -0.06143481, -1.26485, 1, 1, 1, 1, 1,
-0.557734, -1.136506, -3.718282, 1, 1, 1, 1, 1,
-0.5574313, -0.1979637, -0.897782, 1, 1, 1, 1, 1,
-0.5554121, 1.650106, -2.752051, 1, 1, 1, 1, 1,
-0.5540714, 0.6337292, -0.6075196, 1, 1, 1, 1, 1,
-0.5529563, 0.9086533, -0.920027, 1, 1, 1, 1, 1,
-0.5527816, -0.3453195, -2.337611, 0, 0, 1, 1, 1,
-0.5508013, -1.784848, -2.365887, 1, 0, 0, 1, 1,
-0.5477536, 0.5031853, -1.037066, 1, 0, 0, 1, 1,
-0.5463275, 0.9164761, -2.360746, 1, 0, 0, 1, 1,
-0.5450132, -0.9791359, -2.538178, 1, 0, 0, 1, 1,
-0.5448433, 1.75713, 0.6790533, 1, 0, 0, 1, 1,
-0.5380198, -0.9645231, -2.348323, 0, 0, 0, 1, 1,
-0.533693, 0.533778, -2.238392, 0, 0, 0, 1, 1,
-0.532411, -0.8117259, -2.966964, 0, 0, 0, 1, 1,
-0.53231, 0.4384674, 0.2434692, 0, 0, 0, 1, 1,
-0.5318539, -2.452689, -2.364599, 0, 0, 0, 1, 1,
-0.5309995, 1.345266, 0.6368408, 0, 0, 0, 1, 1,
-0.5308314, 0.6681255, 0.6874511, 0, 0, 0, 1, 1,
-0.5230681, 0.29662, -0.2634803, 1, 1, 1, 1, 1,
-0.5165163, 0.08776812, -1.615723, 1, 1, 1, 1, 1,
-0.5154594, 0.6894479, -0.7670347, 1, 1, 1, 1, 1,
-0.515048, -0.3246384, -2.938772, 1, 1, 1, 1, 1,
-0.5063502, -1.326979, -3.481089, 1, 1, 1, 1, 1,
-0.5048612, -1.042437, -3.494145, 1, 1, 1, 1, 1,
-0.5046788, 1.118284, -0.6177456, 1, 1, 1, 1, 1,
-0.5016921, 0.9975668, 0.6862047, 1, 1, 1, 1, 1,
-0.4955361, -0.1914776, -0.545601, 1, 1, 1, 1, 1,
-0.4945784, 1.400505, 0.08617474, 1, 1, 1, 1, 1,
-0.4934368, 0.06796084, -1.630285, 1, 1, 1, 1, 1,
-0.4900498, -1.595701, -3.650292, 1, 1, 1, 1, 1,
-0.4887685, -0.6233285, -1.924184, 1, 1, 1, 1, 1,
-0.4877969, -0.7353663, -3.137289, 1, 1, 1, 1, 1,
-0.4859657, -1.64855, -3.084472, 1, 1, 1, 1, 1,
-0.4835473, -0.3318797, -4.076271, 0, 0, 1, 1, 1,
-0.4821418, -1.274654, -4.604534, 1, 0, 0, 1, 1,
-0.4807214, 0.7797745, -1.430433, 1, 0, 0, 1, 1,
-0.4766015, 1.363537, -1.669441, 1, 0, 0, 1, 1,
-0.4765857, 0.7502331, -0.9223422, 1, 0, 0, 1, 1,
-0.475093, -0.7855971, -2.427342, 1, 0, 0, 1, 1,
-0.4748301, 1.174209, -1.956975, 0, 0, 0, 1, 1,
-0.4713845, 0.03639713, 0.3668827, 0, 0, 0, 1, 1,
-0.4674377, -2.707943, -2.234166, 0, 0, 0, 1, 1,
-0.4669218, 0.7876734, 0.01253405, 0, 0, 0, 1, 1,
-0.4667001, -0.4599694, -2.968879, 0, 0, 0, 1, 1,
-0.4587795, -0.2158359, -2.986479, 0, 0, 0, 1, 1,
-0.448474, -1.156997, -3.487151, 0, 0, 0, 1, 1,
-0.4438911, 0.6448258, -1.800328, 1, 1, 1, 1, 1,
-0.44375, -0.1896224, -1.019, 1, 1, 1, 1, 1,
-0.4380503, -0.281739, -3.139656, 1, 1, 1, 1, 1,
-0.4378572, 0.8327188, -1.106127, 1, 1, 1, 1, 1,
-0.4339922, -1.753914, -2.623924, 1, 1, 1, 1, 1,
-0.4318711, 0.6034621, -0.1964876, 1, 1, 1, 1, 1,
-0.4302017, 0.05840344, -2.664605, 1, 1, 1, 1, 1,
-0.4300605, -0.5404677, -1.100925, 1, 1, 1, 1, 1,
-0.4273513, -0.3893192, -1.739704, 1, 1, 1, 1, 1,
-0.4268577, -0.3284586, -3.148724, 1, 1, 1, 1, 1,
-0.4236769, 1.623972, -1.448824, 1, 1, 1, 1, 1,
-0.4219328, 0.8525406, 0.5822182, 1, 1, 1, 1, 1,
-0.4212909, -1.878486, -3.248997, 1, 1, 1, 1, 1,
-0.4195594, 0.675317, -0.8902535, 1, 1, 1, 1, 1,
-0.4159672, 1.12128, -0.4689867, 1, 1, 1, 1, 1,
-0.4129866, 0.1130563, -3.022636, 0, 0, 1, 1, 1,
-0.4096028, -1.386817, -3.767161, 1, 0, 0, 1, 1,
-0.4049827, 0.8234203, -1.075809, 1, 0, 0, 1, 1,
-0.4019336, -0.314354, -0.9092736, 1, 0, 0, 1, 1,
-0.3980559, -0.1670459, -3.381586, 1, 0, 0, 1, 1,
-0.3940836, 0.4719894, -1.083985, 1, 0, 0, 1, 1,
-0.3788497, 1.293175, 0.5153573, 0, 0, 0, 1, 1,
-0.3758387, 0.3825661, -2.002471, 0, 0, 0, 1, 1,
-0.3692903, -0.1712798, -3.207716, 0, 0, 0, 1, 1,
-0.3681879, -0.5616699, -2.7943, 0, 0, 0, 1, 1,
-0.3670418, -1.274573, -2.081386, 0, 0, 0, 1, 1,
-0.3641467, -0.8151849, -3.240193, 0, 0, 0, 1, 1,
-0.3619912, -0.5461056, -1.367868, 0, 0, 0, 1, 1,
-0.3616001, 0.01071063, -2.366501, 1, 1, 1, 1, 1,
-0.3519582, 0.6591441, -0.7825674, 1, 1, 1, 1, 1,
-0.3491631, 0.521976, -1.514037, 1, 1, 1, 1, 1,
-0.3491319, -0.1135243, -0.6123545, 1, 1, 1, 1, 1,
-0.3445279, -0.1208426, -1.146412, 1, 1, 1, 1, 1,
-0.3352943, 1.553316, -1.647744, 1, 1, 1, 1, 1,
-0.3345109, -0.6117873, -0.7203147, 1, 1, 1, 1, 1,
-0.3314964, -1.229971, -2.390683, 1, 1, 1, 1, 1,
-0.330957, -0.2975993, -4.446577, 1, 1, 1, 1, 1,
-0.3306184, 0.5929098, 0.2597429, 1, 1, 1, 1, 1,
-0.323547, -0.1913387, -3.377963, 1, 1, 1, 1, 1,
-0.3234762, 0.1221421, -2.519636, 1, 1, 1, 1, 1,
-0.3233095, -1.383894, -1.781815, 1, 1, 1, 1, 1,
-0.322376, 0.8556857, -1.54488, 1, 1, 1, 1, 1,
-0.3220378, -0.242883, -3.270642, 1, 1, 1, 1, 1,
-0.3197491, -2.135297, -3.940772, 0, 0, 1, 1, 1,
-0.3170297, 1.505703, 0.08442046, 1, 0, 0, 1, 1,
-0.3163281, -1.285825, -3.337103, 1, 0, 0, 1, 1,
-0.3127388, -0.3111219, -3.677656, 1, 0, 0, 1, 1,
-0.3115618, -0.6967317, -1.63026, 1, 0, 0, 1, 1,
-0.3070541, -0.9522312, -3.101192, 1, 0, 0, 1, 1,
-0.3061076, -0.6129648, -3.369304, 0, 0, 0, 1, 1,
-0.3058333, -1.531627, -5.354177, 0, 0, 0, 1, 1,
-0.3056196, 0.07307907, -2.098399, 0, 0, 0, 1, 1,
-0.305032, -0.4756465, -3.162852, 0, 0, 0, 1, 1,
-0.2922524, -2.065047, -3.565244, 0, 0, 0, 1, 1,
-0.2914086, -1.305378, -1.658206, 0, 0, 0, 1, 1,
-0.2906414, 0.6381396, 0.7247879, 0, 0, 0, 1, 1,
-0.2790963, -0.6856882, -4.929082, 1, 1, 1, 1, 1,
-0.2780992, -0.5182747, -1.36588, 1, 1, 1, 1, 1,
-0.274538, -0.009156547, -1.649909, 1, 1, 1, 1, 1,
-0.2734708, 2.124446, -1.242427, 1, 1, 1, 1, 1,
-0.2728002, 2.38167, -1.577798, 1, 1, 1, 1, 1,
-0.2708524, -0.9615038, -1.888023, 1, 1, 1, 1, 1,
-0.2688903, -2.662755, -2.832279, 1, 1, 1, 1, 1,
-0.2645264, 2.358549, 0.750054, 1, 1, 1, 1, 1,
-0.264449, 2.874096, 0.2941265, 1, 1, 1, 1, 1,
-0.2623671, 0.2781638, -1.2335, 1, 1, 1, 1, 1,
-0.2591728, -0.4471467, -4.00419, 1, 1, 1, 1, 1,
-0.2589625, 0.1582395, -0.151792, 1, 1, 1, 1, 1,
-0.2583367, 0.9871424, 0.6537088, 1, 1, 1, 1, 1,
-0.2575718, 0.9195591, -1.7188, 1, 1, 1, 1, 1,
-0.2553568, -0.5245929, -3.318337, 1, 1, 1, 1, 1,
-0.2533181, 0.1745612, 0.3782344, 0, 0, 1, 1, 1,
-0.2525562, 0.90782, 0.355762, 1, 0, 0, 1, 1,
-0.2505732, 0.2438128, 1.304378, 1, 0, 0, 1, 1,
-0.2489672, -0.6563881, -3.387894, 1, 0, 0, 1, 1,
-0.2466668, -0.3132875, -2.32335, 1, 0, 0, 1, 1,
-0.2444109, 0.4908492, -0.1992788, 1, 0, 0, 1, 1,
-0.2424756, -0.05787702, -0.603949, 0, 0, 0, 1, 1,
-0.2361277, -0.002465513, -2.018577, 0, 0, 0, 1, 1,
-0.2354476, -0.09375838, -0.9693036, 0, 0, 0, 1, 1,
-0.2341857, -0.6328734, -2.589918, 0, 0, 0, 1, 1,
-0.2284572, -1.413779, -3.527878, 0, 0, 0, 1, 1,
-0.2177119, 0.008918621, -1.603137, 0, 0, 0, 1, 1,
-0.2176277, -0.3322801, -2.625317, 0, 0, 0, 1, 1,
-0.2164725, 0.8782201, 0.5194907, 1, 1, 1, 1, 1,
-0.2160735, 0.3906589, -0.5256149, 1, 1, 1, 1, 1,
-0.21448, -0.8658704, -3.68608, 1, 1, 1, 1, 1,
-0.2101388, 1.439697, 1.296772, 1, 1, 1, 1, 1,
-0.2086149, -0.6581905, -2.512411, 1, 1, 1, 1, 1,
-0.2072546, 0.2702723, 1.059413, 1, 1, 1, 1, 1,
-0.2057707, 0.02327027, -1.078231, 1, 1, 1, 1, 1,
-0.1911177, 0.5443013, -1.748475, 1, 1, 1, 1, 1,
-0.1894644, -0.6943377, -3.813498, 1, 1, 1, 1, 1,
-0.1855258, 1.503089, 1.258709, 1, 1, 1, 1, 1,
-0.183111, 1.593308, -0.2314425, 1, 1, 1, 1, 1,
-0.1759993, 1.104875, 0.384912, 1, 1, 1, 1, 1,
-0.171407, 0.8947099, -0.8299348, 1, 1, 1, 1, 1,
-0.1706465, -0.03139868, -1.372144, 1, 1, 1, 1, 1,
-0.1702665, 1.194331, -0.196885, 1, 1, 1, 1, 1,
-0.1695113, -1.28848, -1.688955, 0, 0, 1, 1, 1,
-0.1670189, -2.207469, -5.233775, 1, 0, 0, 1, 1,
-0.1664492, -1.476781, -3.733289, 1, 0, 0, 1, 1,
-0.1623201, 1.720805, 0.3638057, 1, 0, 0, 1, 1,
-0.1619287, 1.086852, 1.236895, 1, 0, 0, 1, 1,
-0.1599345, 0.7383577, -0.3758576, 1, 0, 0, 1, 1,
-0.1592397, -0.3408445, -3.524346, 0, 0, 0, 1, 1,
-0.1563572, -0.3048337, -1.320572, 0, 0, 0, 1, 1,
-0.15627, -0.6195263, -1.974591, 0, 0, 0, 1, 1,
-0.155031, -0.5246193, -2.199867, 0, 0, 0, 1, 1,
-0.1506033, 0.6989968, 1.155952, 0, 0, 0, 1, 1,
-0.1502299, 0.6845878, -0.009000789, 0, 0, 0, 1, 1,
-0.150042, 0.183278, -1.942193, 0, 0, 0, 1, 1,
-0.1469172, 0.04028966, -2.130104, 1, 1, 1, 1, 1,
-0.1457322, 0.8130925, 1.547995, 1, 1, 1, 1, 1,
-0.1404528, 1.024378, -1.037595, 1, 1, 1, 1, 1,
-0.1402384, 1.640213, 0.4604852, 1, 1, 1, 1, 1,
-0.1364443, 0.06826302, -0.9695535, 1, 1, 1, 1, 1,
-0.1344652, -0.352809, -2.430499, 1, 1, 1, 1, 1,
-0.1322621, -1.157673, -5.147102, 1, 1, 1, 1, 1,
-0.1175097, -1.006766, -2.796392, 1, 1, 1, 1, 1,
-0.1170556, -0.2988144, -2.153241, 1, 1, 1, 1, 1,
-0.1141733, 0.6048312, 0.587782, 1, 1, 1, 1, 1,
-0.1135977, 0.5148008, -0.6312122, 1, 1, 1, 1, 1,
-0.1097611, 0.596741, -1.205003, 1, 1, 1, 1, 1,
-0.1094119, -0.6851597, -4.181455, 1, 1, 1, 1, 1,
-0.1082414, 0.7645361, -1.475894, 1, 1, 1, 1, 1,
-0.1055507, 0.8796141, 1.0861, 1, 1, 1, 1, 1,
-0.1048791, 0.5993115, 1.72385, 0, 0, 1, 1, 1,
-0.09862402, 1.127512, -0.8120052, 1, 0, 0, 1, 1,
-0.09724172, 0.2633248, -0.2925648, 1, 0, 0, 1, 1,
-0.0972259, -0.0596175, -1.685378, 1, 0, 0, 1, 1,
-0.09618117, -0.1173485, -1.282068, 1, 0, 0, 1, 1,
-0.09599502, 1.587195, 0.8979464, 1, 0, 0, 1, 1,
-0.09419569, -1.657571, -3.476659, 0, 0, 0, 1, 1,
-0.0926033, -1.084566, -2.427456, 0, 0, 0, 1, 1,
-0.08749281, 0.1439267, 0.9482489, 0, 0, 0, 1, 1,
-0.08655479, 0.6815498, 0.2086625, 0, 0, 0, 1, 1,
-0.08633425, -0.5424082, -4.088659, 0, 0, 0, 1, 1,
-0.07929116, -0.0734348, -3.251328, 0, 0, 0, 1, 1,
-0.07876436, -0.7034549, -3.482986, 0, 0, 0, 1, 1,
-0.07583418, -0.1909858, -0.6575679, 1, 1, 1, 1, 1,
-0.0699919, -1.089209, -1.2597, 1, 1, 1, 1, 1,
-0.06943024, 0.3914062, -1.438008, 1, 1, 1, 1, 1,
-0.0651635, 0.4332017, 1.240001, 1, 1, 1, 1, 1,
-0.06434796, 0.08219881, -0.7224759, 1, 1, 1, 1, 1,
-0.063822, 0.4513477, -0.3229787, 1, 1, 1, 1, 1,
-0.05396384, -0.1598518, -2.556116, 1, 1, 1, 1, 1,
-0.04894226, -0.8555661, -3.702617, 1, 1, 1, 1, 1,
-0.04838848, 1.759658, -0.2477394, 1, 1, 1, 1, 1,
-0.04577447, 0.3369765, -0.4850496, 1, 1, 1, 1, 1,
-0.04034407, 0.8305488, -0.5279087, 1, 1, 1, 1, 1,
-0.03900884, 0.4160253, -0.3255618, 1, 1, 1, 1, 1,
-0.03842739, -0.8071778, -3.532561, 1, 1, 1, 1, 1,
-0.03808887, -0.09837379, -3.111227, 1, 1, 1, 1, 1,
-0.03726998, 1.237522, 1.461955, 1, 1, 1, 1, 1,
-0.02961637, -0.848644, -2.278807, 0, 0, 1, 1, 1,
-0.02833347, -1.444816, -3.178174, 1, 0, 0, 1, 1,
-0.02716765, -1.141328, -3.769792, 1, 0, 0, 1, 1,
-0.02638684, -0.120088, -2.24465, 1, 0, 0, 1, 1,
-0.02547391, -1.494514, -3.703477, 1, 0, 0, 1, 1,
-0.01999944, -0.3499889, -0.6556301, 1, 0, 0, 1, 1,
-0.01971923, -1.140505, -3.365381, 0, 0, 0, 1, 1,
-0.01868116, 0.2555921, -0.4856578, 0, 0, 0, 1, 1,
-0.014172, -0.3294059, -2.198037, 0, 0, 0, 1, 1,
-0.0092296, 0.227233, 0.459098, 0, 0, 0, 1, 1,
-0.008252986, 0.7802532, -0.3670007, 0, 0, 0, 1, 1,
-0.006316996, -0.92747, -2.668292, 0, 0, 0, 1, 1,
-0.006170404, 0.425607, -0.5089638, 0, 0, 0, 1, 1,
-0.005595843, 0.4122518, -1.481673, 1, 1, 1, 1, 1,
-0.002345616, 1.744862, -0.6040328, 1, 1, 1, 1, 1,
-0.0005895994, -0.08236275, -2.497552, 1, 1, 1, 1, 1,
0.00480463, 0.1116851, 0.6923797, 1, 1, 1, 1, 1,
0.005020477, 0.9114717, -0.2091826, 1, 1, 1, 1, 1,
0.008342326, 0.2642447, 0.6422386, 1, 1, 1, 1, 1,
0.009271025, 1.207546, -0.2770882, 1, 1, 1, 1, 1,
0.01534745, 0.3319757, -2.176746, 1, 1, 1, 1, 1,
0.01657332, -1.020924, 2.928674, 1, 1, 1, 1, 1,
0.01931754, 0.8629277, 0.9889311, 1, 1, 1, 1, 1,
0.02391803, -0.381862, 2.86281, 1, 1, 1, 1, 1,
0.02835423, 0.4390756, -0.5283256, 1, 1, 1, 1, 1,
0.02994996, -0.355907, 3.792058, 1, 1, 1, 1, 1,
0.03006522, -1.656099, 3.184409, 1, 1, 1, 1, 1,
0.03450126, -1.333419, 3.858365, 1, 1, 1, 1, 1,
0.04350023, -1.131616, 4.367459, 0, 0, 1, 1, 1,
0.04381749, 0.06465574, 0.847894, 1, 0, 0, 1, 1,
0.04723305, 0.6195191, 0.3474415, 1, 0, 0, 1, 1,
0.04782172, 1.251109, 0.05304277, 1, 0, 0, 1, 1,
0.05084705, 0.7829682, -2.456032, 1, 0, 0, 1, 1,
0.05302065, 0.7258509, 1.01076, 1, 0, 0, 1, 1,
0.05306229, 2.350347, 0.03894368, 0, 0, 0, 1, 1,
0.05379228, 1.103512, -1.920627, 0, 0, 0, 1, 1,
0.05517711, -0.3095241, 1.853416, 0, 0, 0, 1, 1,
0.05858458, 0.237941, -0.3868922, 0, 0, 0, 1, 1,
0.05933774, 2.94445, 1.737728, 0, 0, 0, 1, 1,
0.06188971, -0.4759234, 2.059717, 0, 0, 0, 1, 1,
0.06198712, 0.424986, -1.100071, 0, 0, 0, 1, 1,
0.06224621, -1.764521, 2.621504, 1, 1, 1, 1, 1,
0.06254536, 1.507923, 1.429421, 1, 1, 1, 1, 1,
0.06389338, -1.28327, 1.304116, 1, 1, 1, 1, 1,
0.0667228, -0.8892246, 3.744294, 1, 1, 1, 1, 1,
0.06715837, -1.093053, 3.9963, 1, 1, 1, 1, 1,
0.06803097, 0.2724566, 1.324618, 1, 1, 1, 1, 1,
0.07188027, -0.4333586, 2.442723, 1, 1, 1, 1, 1,
0.07202908, 1.145309, -0.6513256, 1, 1, 1, 1, 1,
0.07406544, -0.09757937, 2.699206, 1, 1, 1, 1, 1,
0.07931931, 0.1695593, 2.62474, 1, 1, 1, 1, 1,
0.07973009, -1.685711, 3.045761, 1, 1, 1, 1, 1,
0.08500767, -1.029972, 2.506975, 1, 1, 1, 1, 1,
0.08751591, 1.913063, 1.166392, 1, 1, 1, 1, 1,
0.08785115, 0.3098822, 0.5780784, 1, 1, 1, 1, 1,
0.09627441, -2.166477, 2.417278, 1, 1, 1, 1, 1,
0.09852356, -0.3277517, 3.849025, 0, 0, 1, 1, 1,
0.1017175, -1.179022, 3.516796, 1, 0, 0, 1, 1,
0.1046304, -1.164773, 3.064175, 1, 0, 0, 1, 1,
0.107106, 1.670095, 0.2679053, 1, 0, 0, 1, 1,
0.1072785, -1.595225, 2.613128, 1, 0, 0, 1, 1,
0.1094414, -2.288321, 3.884026, 1, 0, 0, 1, 1,
0.1130288, 0.5082965, -0.1612644, 0, 0, 0, 1, 1,
0.1146573, -0.9624434, 2.568489, 0, 0, 0, 1, 1,
0.116595, -0.9221211, 2.828066, 0, 0, 0, 1, 1,
0.1170986, 1.254329, 0.3167961, 0, 0, 0, 1, 1,
0.1189499, -0.9855148, 2.524393, 0, 0, 0, 1, 1,
0.1191094, -0.01898044, 2.433077, 0, 0, 0, 1, 1,
0.1219584, 0.8395053, 1.772741, 0, 0, 0, 1, 1,
0.1224819, -1.488341, 2.628207, 1, 1, 1, 1, 1,
0.1245976, -0.578858, 0.6442901, 1, 1, 1, 1, 1,
0.1268236, -2.029654, 2.590513, 1, 1, 1, 1, 1,
0.1301997, 0.242319, 0.1794093, 1, 1, 1, 1, 1,
0.1404725, 0.7273634, -1.499933, 1, 1, 1, 1, 1,
0.1408457, 1.035749, 0.3935572, 1, 1, 1, 1, 1,
0.150424, 0.9559013, -2.365289, 1, 1, 1, 1, 1,
0.1518899, -0.9903404, 1.518714, 1, 1, 1, 1, 1,
0.1535293, -1.116475, 2.568103, 1, 1, 1, 1, 1,
0.154751, -1.374622, 2.797009, 1, 1, 1, 1, 1,
0.1547582, -0.2671192, 2.491054, 1, 1, 1, 1, 1,
0.1571278, -1.287526, 2.075086, 1, 1, 1, 1, 1,
0.1588241, 0.771601, -0.2403637, 1, 1, 1, 1, 1,
0.161889, 0.1341058, 0.2948096, 1, 1, 1, 1, 1,
0.1644146, -0.1468951, 2.318097, 1, 1, 1, 1, 1,
0.1660606, -0.4894504, 4.249584, 0, 0, 1, 1, 1,
0.1684577, 0.1081845, 0.4957041, 1, 0, 0, 1, 1,
0.174607, 0.7331913, -1.067378, 1, 0, 0, 1, 1,
0.1777773, -0.2323709, 2.718055, 1, 0, 0, 1, 1,
0.1807049, 0.3409493, 0.7946563, 1, 0, 0, 1, 1,
0.1809074, -0.1733367, 2.159076, 1, 0, 0, 1, 1,
0.1817555, -0.9444935, 1.308707, 0, 0, 0, 1, 1,
0.1820525, -0.6444719, 3.153378, 0, 0, 0, 1, 1,
0.1834704, 0.3493766, 1.378772, 0, 0, 0, 1, 1,
0.1835604, 1.295297, -0.2274267, 0, 0, 0, 1, 1,
0.1835677, -0.01354789, 1.881355, 0, 0, 0, 1, 1,
0.1855209, -0.05338772, 2.434117, 0, 0, 0, 1, 1,
0.1885406, 0.4720952, -1.656914, 0, 0, 0, 1, 1,
0.1890252, -1.050308, 1.360389, 1, 1, 1, 1, 1,
0.1933752, -2.768107, 2.337549, 1, 1, 1, 1, 1,
0.1963629, 0.3548475, 0.7230419, 1, 1, 1, 1, 1,
0.2004394, -0.04308584, -0.7244902, 1, 1, 1, 1, 1,
0.2022683, 0.910989, 0.2907302, 1, 1, 1, 1, 1,
0.2084707, -0.3189128, 2.190398, 1, 1, 1, 1, 1,
0.2121036, -0.8049213, 3.575762, 1, 1, 1, 1, 1,
0.2122902, -0.4295363, 3.798759, 1, 1, 1, 1, 1,
0.2133836, 1.09447, -1.758495, 1, 1, 1, 1, 1,
0.2152063, -0.8055072, 2.890909, 1, 1, 1, 1, 1,
0.222448, 0.4380485, 0.09395296, 1, 1, 1, 1, 1,
0.2248414, -1.36031, 4.709801, 1, 1, 1, 1, 1,
0.2250068, 0.7875757, -1.500089, 1, 1, 1, 1, 1,
0.2264536, -1.231273, 3.675378, 1, 1, 1, 1, 1,
0.2267571, 0.2243482, 1.413679, 1, 1, 1, 1, 1,
0.2284613, -2.201479, 3.302158, 0, 0, 1, 1, 1,
0.2299473, -0.4784649, 3.229111, 1, 0, 0, 1, 1,
0.231133, -0.4550875, 3.325873, 1, 0, 0, 1, 1,
0.2344965, 0.2307323, 0.4025562, 1, 0, 0, 1, 1,
0.2356723, 0.06537957, 2.37823, 1, 0, 0, 1, 1,
0.2377062, -0.2983197, 2.240028, 1, 0, 0, 1, 1,
0.2382067, -0.6571054, 2.065987, 0, 0, 0, 1, 1,
0.2384627, 1.705311, 2.91088, 0, 0, 0, 1, 1,
0.2495521, 1.405333, 0.8238756, 0, 0, 0, 1, 1,
0.2508665, 1.104549, 1.014218, 0, 0, 0, 1, 1,
0.2522283, 1.214538, 1.269279, 0, 0, 0, 1, 1,
0.2547099, 2.887976, -0.9541424, 0, 0, 0, 1, 1,
0.2547858, -0.006601083, -0.3562187, 0, 0, 0, 1, 1,
0.2565578, -0.4211601, 2.245311, 1, 1, 1, 1, 1,
0.2675148, 2.029378, 0.5268624, 1, 1, 1, 1, 1,
0.2679268, -0.1329373, 2.540316, 1, 1, 1, 1, 1,
0.2685121, 0.692641, 1.940141, 1, 1, 1, 1, 1,
0.2689609, 0.3197937, 0.8524086, 1, 1, 1, 1, 1,
0.2755546, -0.4803133, 2.903488, 1, 1, 1, 1, 1,
0.2759244, 0.032361, 0.292123, 1, 1, 1, 1, 1,
0.2771771, 1.432124, -1.345554, 1, 1, 1, 1, 1,
0.2832745, -0.1417183, 3.478704, 1, 1, 1, 1, 1,
0.2877878, 0.3075328, -0.6117324, 1, 1, 1, 1, 1,
0.2894888, -0.6149856, 3.292618, 1, 1, 1, 1, 1,
0.2896775, -0.05100121, 0.770804, 1, 1, 1, 1, 1,
0.2905297, -0.1812328, 1.672721, 1, 1, 1, 1, 1,
0.2940017, -0.4464774, 4.007951, 1, 1, 1, 1, 1,
0.2940839, 0.1124593, 0.3088663, 1, 1, 1, 1, 1,
0.3018526, -0.6537489, 3.903268, 0, 0, 1, 1, 1,
0.3086439, -1.497453, 3.734748, 1, 0, 0, 1, 1,
0.3090272, 0.8154352, 0.9181353, 1, 0, 0, 1, 1,
0.313909, 1.266292, -1.287543, 1, 0, 0, 1, 1,
0.3140458, 0.9290131, 1.075375, 1, 0, 0, 1, 1,
0.3153352, -1.283022, 2.293246, 1, 0, 0, 1, 1,
0.3164571, -0.1754197, 2.420694, 0, 0, 0, 1, 1,
0.3171071, 1.290243, 0.5951259, 0, 0, 0, 1, 1,
0.3178522, 1.326052, 0.3647951, 0, 0, 0, 1, 1,
0.3193014, 0.6791873, 0.6878086, 0, 0, 0, 1, 1,
0.3211839, -0.3688457, 1.607257, 0, 0, 0, 1, 1,
0.3222568, 0.3685164, -0.9424108, 0, 0, 0, 1, 1,
0.3224926, 0.3671803, 0.7063262, 0, 0, 0, 1, 1,
0.3229636, -1.082384, 3.032097, 1, 1, 1, 1, 1,
0.3252123, -1.037785, 0.3363225, 1, 1, 1, 1, 1,
0.3274355, 0.6015314, 2.240462, 1, 1, 1, 1, 1,
0.3300223, -0.3655726, 0.8054173, 1, 1, 1, 1, 1,
0.3309129, 0.2061033, 2.251045, 1, 1, 1, 1, 1,
0.3326348, -1.553469, 2.694794, 1, 1, 1, 1, 1,
0.3382623, 1.492624, 1.336208, 1, 1, 1, 1, 1,
0.3393769, -0.05114293, 1.286775, 1, 1, 1, 1, 1,
0.3445371, -0.5325387, 3.312847, 1, 1, 1, 1, 1,
0.3449867, 0.3289841, 1.426824, 1, 1, 1, 1, 1,
0.3456505, 0.7397708, 0.2744043, 1, 1, 1, 1, 1,
0.347904, -0.500928, 3.043185, 1, 1, 1, 1, 1,
0.3486745, 1.044372, 0.7607335, 1, 1, 1, 1, 1,
0.3506157, -0.6813433, 4.207324, 1, 1, 1, 1, 1,
0.3508525, 0.04892139, -0.7297587, 1, 1, 1, 1, 1,
0.3550231, -0.6107793, 3.304151, 0, 0, 1, 1, 1,
0.3601369, 0.3084464, 1.906498, 1, 0, 0, 1, 1,
0.3603343, 0.1165715, 1.736759, 1, 0, 0, 1, 1,
0.3616417, -0.6732445, 2.017727, 1, 0, 0, 1, 1,
0.3622404, 0.4312035, 0.07334273, 1, 0, 0, 1, 1,
0.3664751, -0.4569158, 4.337655, 1, 0, 0, 1, 1,
0.3678074, 0.547063, 0.9032953, 0, 0, 0, 1, 1,
0.3710908, 1.746663, -0.5408018, 0, 0, 0, 1, 1,
0.3718055, -0.4823014, 3.0922, 0, 0, 0, 1, 1,
0.3725677, -0.3493291, 2.993448, 0, 0, 0, 1, 1,
0.3746568, 0.04917858, 0.5860766, 0, 0, 0, 1, 1,
0.377445, 0.09243887, 0.6380134, 0, 0, 0, 1, 1,
0.377631, 1.076823, 1.072783, 0, 0, 0, 1, 1,
0.3793644, -0.5525359, 2.23499, 1, 1, 1, 1, 1,
0.383311, -0.5015808, 1.796321, 1, 1, 1, 1, 1,
0.3849995, -1.881621, 2.929668, 1, 1, 1, 1, 1,
0.3854257, -0.4304723, 2.905342, 1, 1, 1, 1, 1,
0.3854721, 1.389847, -1.353543, 1, 1, 1, 1, 1,
0.3910519, -0.9559155, 3.719627, 1, 1, 1, 1, 1,
0.3952833, 0.06467713, -0.8314855, 1, 1, 1, 1, 1,
0.3989035, -2.543371, 3.685077, 1, 1, 1, 1, 1,
0.399003, -1.125086, 3.984725, 1, 1, 1, 1, 1,
0.4004317, 0.4926732, 1.11949, 1, 1, 1, 1, 1,
0.4021606, -0.8138113, 4.735695, 1, 1, 1, 1, 1,
0.4025631, -1.332969, 3.913073, 1, 1, 1, 1, 1,
0.403912, 0.5346916, -0.5249501, 1, 1, 1, 1, 1,
0.407204, 2.098057, 0.5540349, 1, 1, 1, 1, 1,
0.4111938, -1.188514, 2.299909, 1, 1, 1, 1, 1,
0.4147483, 1.231788, 1.532071, 0, 0, 1, 1, 1,
0.4161051, 0.3873323, -0.0745092, 1, 0, 0, 1, 1,
0.4256522, -1.359137, 2.476568, 1, 0, 0, 1, 1,
0.4268658, -0.7468755, 1.578475, 1, 0, 0, 1, 1,
0.4293787, -1.083641, 0.9513004, 1, 0, 0, 1, 1,
0.4313408, -0.7282735, 1.995983, 1, 0, 0, 1, 1,
0.4316919, -0.6091694, 1.809674, 0, 0, 0, 1, 1,
0.4386965, 2.350791, -1.350069, 0, 0, 0, 1, 1,
0.4489453, 0.4627028, -1.308209, 0, 0, 0, 1, 1,
0.4493663, 0.4808983, 0.6008534, 0, 0, 0, 1, 1,
0.4510077, -0.04764578, 1.558765, 0, 0, 0, 1, 1,
0.4544059, -0.08399139, 1.631329, 0, 0, 0, 1, 1,
0.4614818, -0.952777, 2.336659, 0, 0, 0, 1, 1,
0.4658812, -0.2731949, 0.3442893, 1, 1, 1, 1, 1,
0.4724537, -0.06991086, 0.9615132, 1, 1, 1, 1, 1,
0.4741299, -1.491939, 3.298474, 1, 1, 1, 1, 1,
0.4782135, 1.373936, 0.985105, 1, 1, 1, 1, 1,
0.4859163, -0.6290165, 1.709005, 1, 1, 1, 1, 1,
0.4877785, -0.3676153, 1.84411, 1, 1, 1, 1, 1,
0.4920776, -0.3418249, 2.809518, 1, 1, 1, 1, 1,
0.494075, -1.060469, 3.177181, 1, 1, 1, 1, 1,
0.4944098, 0.8384696, 1.572694, 1, 1, 1, 1, 1,
0.4953285, -0.7740004, 3.654471, 1, 1, 1, 1, 1,
0.4956364, -0.1458369, 3.862498, 1, 1, 1, 1, 1,
0.4973018, -0.453974, 2.305691, 1, 1, 1, 1, 1,
0.5029548, -0.08501278, 2.35246, 1, 1, 1, 1, 1,
0.5043774, -0.6992956, 1.974247, 1, 1, 1, 1, 1,
0.5071225, -0.4201888, 1.372188, 1, 1, 1, 1, 1,
0.5084214, 0.9529181, 0.3131361, 0, 0, 1, 1, 1,
0.5100884, 0.6666, -0.471606, 1, 0, 0, 1, 1,
0.5113267, -0.5515713, 2.590085, 1, 0, 0, 1, 1,
0.5120493, 1.190098, 0.6929439, 1, 0, 0, 1, 1,
0.5222299, 0.2496182, 2.109066, 1, 0, 0, 1, 1,
0.5243508, -0.1109726, 1.952159, 1, 0, 0, 1, 1,
0.5292523, -0.7867711, 2.685091, 0, 0, 0, 1, 1,
0.5292673, 0.4667088, 0.9343184, 0, 0, 0, 1, 1,
0.5371508, 0.620181, 0.03815516, 0, 0, 0, 1, 1,
0.5380958, -0.7332483, 4.637962, 0, 0, 0, 1, 1,
0.5386134, 0.6804222, 1.722967, 0, 0, 0, 1, 1,
0.5439308, -0.1111288, 2.560087, 0, 0, 0, 1, 1,
0.5482535, 0.2723264, -0.5431024, 0, 0, 0, 1, 1,
0.5482621, 0.8099548, 1.913993, 1, 1, 1, 1, 1,
0.5508102, -0.3432465, 4.114778, 1, 1, 1, 1, 1,
0.5519066, -0.310413, 2.087834, 1, 1, 1, 1, 1,
0.5559283, -1.611856, 1.756109, 1, 1, 1, 1, 1,
0.5575597, -0.3182842, 2.223531, 1, 1, 1, 1, 1,
0.5598732, -0.123431, 1.34796, 1, 1, 1, 1, 1,
0.5627363, -0.8064848, 2.197106, 1, 1, 1, 1, 1,
0.5632514, 0.1365085, 0.8626288, 1, 1, 1, 1, 1,
0.5645527, 0.1705307, 1.067545, 1, 1, 1, 1, 1,
0.5650839, 0.1591275, 1.803629, 1, 1, 1, 1, 1,
0.5652847, -1.709044, 1.993801, 1, 1, 1, 1, 1,
0.5689614, 0.7731383, 0.2585808, 1, 1, 1, 1, 1,
0.5705312, 0.1411881, 2.542418, 1, 1, 1, 1, 1,
0.5711428, -0.6847319, 1.254026, 1, 1, 1, 1, 1,
0.5723425, 0.7176808, 0.8185365, 1, 1, 1, 1, 1,
0.5790028, 0.7765824, 1.722236, 0, 0, 1, 1, 1,
0.5879531, 0.191623, 0.9545338, 1, 0, 0, 1, 1,
0.5881982, -1.237767, 3.112564, 1, 0, 0, 1, 1,
0.5884655, 0.1391019, 1.019937, 1, 0, 0, 1, 1,
0.5902244, 1.690078, 0.5193218, 1, 0, 0, 1, 1,
0.5945428, -0.7325162, 0.4202137, 1, 0, 0, 1, 1,
0.5950158, -0.6358586, 4.143308, 0, 0, 0, 1, 1,
0.5977373, -1.644524, 1.272943, 0, 0, 0, 1, 1,
0.6008775, 0.4266102, 0.1834929, 0, 0, 0, 1, 1,
0.608557, 0.6131833, 0.1395491, 0, 0, 0, 1, 1,
0.6096526, -2.850296, 3.526396, 0, 0, 0, 1, 1,
0.6108902, -0.1382858, 2.13955, 0, 0, 0, 1, 1,
0.6221501, -1.196581, 2.979928, 0, 0, 0, 1, 1,
0.6263494, 0.6708168, 0.4146006, 1, 1, 1, 1, 1,
0.6374825, 0.1517325, -0.5604326, 1, 1, 1, 1, 1,
0.641535, 0.3367608, 0.8564532, 1, 1, 1, 1, 1,
0.641951, -0.1167465, 1.565485, 1, 1, 1, 1, 1,
0.6468174, -0.4765702, 0.7559322, 1, 1, 1, 1, 1,
0.651713, 0.3884139, 0.3536939, 1, 1, 1, 1, 1,
0.6539218, 0.198775, 0.9498162, 1, 1, 1, 1, 1,
0.6572264, -1.560501, 0.9807028, 1, 1, 1, 1, 1,
0.6582173, -0.9493919, 1.859984, 1, 1, 1, 1, 1,
0.6656508, -0.01902285, 3.299727, 1, 1, 1, 1, 1,
0.6694484, -1.045657, 2.069528, 1, 1, 1, 1, 1,
0.6699723, 0.1889324, 2.763205, 1, 1, 1, 1, 1,
0.6741511, -0.7989681, 1.832417, 1, 1, 1, 1, 1,
0.677298, -0.4847026, 2.729698, 1, 1, 1, 1, 1,
0.6838776, 0.7476858, 0.06561038, 1, 1, 1, 1, 1,
0.6858927, -1.557034, 2.591347, 0, 0, 1, 1, 1,
0.688343, 1.153754, 0.959191, 1, 0, 0, 1, 1,
0.6930846, -1.048763, 1.326503, 1, 0, 0, 1, 1,
0.7034701, 0.4642234, 1.153429, 1, 0, 0, 1, 1,
0.7051962, 0.9379462, 1.136477, 1, 0, 0, 1, 1,
0.706885, -0.4295317, 2.221395, 1, 0, 0, 1, 1,
0.7113154, 0.09967896, 1.070335, 0, 0, 0, 1, 1,
0.7119321, 1.442379, 1.139275, 0, 0, 0, 1, 1,
0.7164704, -0.1934472, 0.7290184, 0, 0, 0, 1, 1,
0.7167202, 0.8601863, 0.1077573, 0, 0, 0, 1, 1,
0.7173781, 0.7310485, -0.2456404, 0, 0, 0, 1, 1,
0.7182519, -0.003541193, 1.279491, 0, 0, 0, 1, 1,
0.7187046, 1.003399, 2.150718, 0, 0, 0, 1, 1,
0.719444, -0.5474619, 3.042645, 1, 1, 1, 1, 1,
0.7226407, 0.6320037, 1.593917, 1, 1, 1, 1, 1,
0.7283968, -0.02533287, 3.155632, 1, 1, 1, 1, 1,
0.7299469, 2.188245, 0.5904219, 1, 1, 1, 1, 1,
0.7327685, -1.434564, 2.578666, 1, 1, 1, 1, 1,
0.7373462, 1.88073, 0.01237304, 1, 1, 1, 1, 1,
0.7377447, 0.7015768, -0.6642606, 1, 1, 1, 1, 1,
0.7462817, -0.5304768, 3.042049, 1, 1, 1, 1, 1,
0.7478708, -0.7052023, 4.373322, 1, 1, 1, 1, 1,
0.7484055, -0.05069704, 1.182228, 1, 1, 1, 1, 1,
0.7495844, -0.4504505, 2.592078, 1, 1, 1, 1, 1,
0.7547174, 2.050348, 0.07378484, 1, 1, 1, 1, 1,
0.7569311, 1.658017, 1.617094, 1, 1, 1, 1, 1,
0.7586916, 0.765616, 0.8735864, 1, 1, 1, 1, 1,
0.7612995, 0.5047289, 1.135921, 1, 1, 1, 1, 1,
0.7629004, -0.130271, 2.107536, 0, 0, 1, 1, 1,
0.7663451, 1.261379, 1.290082, 1, 0, 0, 1, 1,
0.767326, -1.142231, 1.651044, 1, 0, 0, 1, 1,
0.7687311, -0.89079, 1.813734, 1, 0, 0, 1, 1,
0.7687894, -0.6174688, 2.778627, 1, 0, 0, 1, 1,
0.7777046, -0.8850083, 4.727148, 1, 0, 0, 1, 1,
0.7817215, -0.7910851, 2.846885, 0, 0, 0, 1, 1,
0.7818568, -0.7007579, 2.99053, 0, 0, 0, 1, 1,
0.7820011, 0.1523793, 0.02609929, 0, 0, 0, 1, 1,
0.7829193, 0.05567231, 0.05974323, 0, 0, 0, 1, 1,
0.7850823, 0.7553571, -0.329321, 0, 0, 0, 1, 1,
0.7921628, 0.2396751, 2.162905, 0, 0, 0, 1, 1,
0.7949824, 0.1249183, 2.061694, 0, 0, 0, 1, 1,
0.7957365, 0.6195107, 2.214644, 1, 1, 1, 1, 1,
0.7981896, -0.4211133, 2.885992, 1, 1, 1, 1, 1,
0.8048899, 1.100755, -1.07693, 1, 1, 1, 1, 1,
0.8051998, -0.9973874, 4.110739, 1, 1, 1, 1, 1,
0.8074988, -0.686226, 2.022489, 1, 1, 1, 1, 1,
0.808705, -0.6527205, 3.237494, 1, 1, 1, 1, 1,
0.8095314, 0.8912193, 2.651257, 1, 1, 1, 1, 1,
0.813594, -1.460092, 2.171238, 1, 1, 1, 1, 1,
0.8156699, 1.029881, 1.282231, 1, 1, 1, 1, 1,
0.8207465, -0.7535279, 1.987429, 1, 1, 1, 1, 1,
0.8306905, -0.9285302, 2.853683, 1, 1, 1, 1, 1,
0.8315252, 0.5665758, 0.940088, 1, 1, 1, 1, 1,
0.8315526, -0.1986195, 3.413788, 1, 1, 1, 1, 1,
0.8384723, 0.513629, 0.4596148, 1, 1, 1, 1, 1,
0.841853, -0.4766478, 1.686993, 1, 1, 1, 1, 1,
0.8459629, -1.067605, 2.645454, 0, 0, 1, 1, 1,
0.8516855, -1.565244, 4.158393, 1, 0, 0, 1, 1,
0.866306, 2.430194, -1.14956, 1, 0, 0, 1, 1,
0.8670292, 1.310564, 2.716212, 1, 0, 0, 1, 1,
0.8699921, -0.1881272, 2.35183, 1, 0, 0, 1, 1,
0.8986983, -0.6563429, 2.353388, 1, 0, 0, 1, 1,
0.8991868, -1.761095, 2.222197, 0, 0, 0, 1, 1,
0.9039772, -0.1850501, 1.554485, 0, 0, 0, 1, 1,
0.9084362, 0.3059123, 1.886365, 0, 0, 0, 1, 1,
0.9147956, -1.14827, 2.83983, 0, 0, 0, 1, 1,
0.9224842, -0.2780925, 3.057699, 0, 0, 0, 1, 1,
0.9372059, 0.7252271, -0.1876574, 0, 0, 0, 1, 1,
0.950142, -1.060486, 2.601126, 0, 0, 0, 1, 1,
0.9516132, 1.088262, -0.7059876, 1, 1, 1, 1, 1,
0.9548849, -1.904045, 4.441252, 1, 1, 1, 1, 1,
0.9556117, -0.970654, 2.195071, 1, 1, 1, 1, 1,
0.9558902, 0.9997002, 0.5451272, 1, 1, 1, 1, 1,
0.9631582, -1.589725, 4.322137, 1, 1, 1, 1, 1,
0.9647372, -1.347934, 3.10327, 1, 1, 1, 1, 1,
0.9732437, 1.505615, -0.07405484, 1, 1, 1, 1, 1,
0.9807165, 0.4096221, 2.958497, 1, 1, 1, 1, 1,
0.9809914, -0.1870808, 3.252897, 1, 1, 1, 1, 1,
0.9848943, 0.3362177, 1.904081, 1, 1, 1, 1, 1,
0.9895388, 0.715196, 0.1817414, 1, 1, 1, 1, 1,
0.9897495, -2.345066, 0.7695282, 1, 1, 1, 1, 1,
0.9910186, 0.682648, 1.557831, 1, 1, 1, 1, 1,
0.9935164, 0.6210201, 2.680881, 1, 1, 1, 1, 1,
0.9948015, -0.5260171, 2.134709, 1, 1, 1, 1, 1,
0.9956769, 0.4182102, 1.300831, 0, 0, 1, 1, 1,
0.9958687, 0.9207429, 1.027515, 1, 0, 0, 1, 1,
1.000798, -0.6636102, 0.5550217, 1, 0, 0, 1, 1,
1.011534, -1.096671, 3.032819, 1, 0, 0, 1, 1,
1.01272, -0.4715921, 1.857825, 1, 0, 0, 1, 1,
1.020799, 0.260389, 1.851164, 1, 0, 0, 1, 1,
1.02129, 1.629942, 0.2999395, 0, 0, 0, 1, 1,
1.025148, 0.2604726, 0.7657554, 0, 0, 0, 1, 1,
1.031339, -1.055101, 2.040025, 0, 0, 0, 1, 1,
1.034043, -0.09164041, 1.070634, 0, 0, 0, 1, 1,
1.035253, 1.051618, 1.429817, 0, 0, 0, 1, 1,
1.037299, 1.202088, 2.821362, 0, 0, 0, 1, 1,
1.04326, 0.9138126, -1.124585, 0, 0, 0, 1, 1,
1.045117, -2.245304, 3.78818, 1, 1, 1, 1, 1,
1.047925, 1.627473, 1.31009, 1, 1, 1, 1, 1,
1.047929, 0.7125993, -0.04702999, 1, 1, 1, 1, 1,
1.04849, 1.136535, 0.218197, 1, 1, 1, 1, 1,
1.059642, 2.301244, -0.6463794, 1, 1, 1, 1, 1,
1.07272, 1.255964, -0.7084462, 1, 1, 1, 1, 1,
1.077215, 1.140267, 2.467483, 1, 1, 1, 1, 1,
1.081308, -1.010647, 0.6945297, 1, 1, 1, 1, 1,
1.084903, -0.2419045, 2.288087, 1, 1, 1, 1, 1,
1.100508, -1.536586, 2.847045, 1, 1, 1, 1, 1,
1.110466, -0.3053764, 2.921928, 1, 1, 1, 1, 1,
1.113712, -0.4142126, 0.3129339, 1, 1, 1, 1, 1,
1.12142, -0.9100778, 2.791209, 1, 1, 1, 1, 1,
1.134367, -0.2198006, 0.7087436, 1, 1, 1, 1, 1,
1.140095, -1.330369, 2.784586, 1, 1, 1, 1, 1,
1.14214, -1.05301, 1.53001, 0, 0, 1, 1, 1,
1.146349, -0.09794961, 0.4554136, 1, 0, 0, 1, 1,
1.146514, 0.4627957, -0.1477482, 1, 0, 0, 1, 1,
1.147688, -0.8901376, 1.984579, 1, 0, 0, 1, 1,
1.148457, 1.17992, 1.4433, 1, 0, 0, 1, 1,
1.155099, 0.09251521, 1.253677, 1, 0, 0, 1, 1,
1.161075, -1.322896, 1.379895, 0, 0, 0, 1, 1,
1.164612, 0.7463602, 1.228671, 0, 0, 0, 1, 1,
1.168162, 0.3592467, 0.6401521, 0, 0, 0, 1, 1,
1.173941, 0.479051, 0.5922388, 0, 0, 0, 1, 1,
1.179064, -0.4361679, 3.002688, 0, 0, 0, 1, 1,
1.180176, -2.751579, 2.324968, 0, 0, 0, 1, 1,
1.191809, -0.7661165, 2.785375, 0, 0, 0, 1, 1,
1.196106, 0.9882057, 0.4008167, 1, 1, 1, 1, 1,
1.197406, -0.7294043, 1.222974, 1, 1, 1, 1, 1,
1.207783, 0.5633853, 1.709842, 1, 1, 1, 1, 1,
1.212474, 0.07211698, 0.8860477, 1, 1, 1, 1, 1,
1.21966, -0.2709333, 0.8565838, 1, 1, 1, 1, 1,
1.2273, -0.7263523, 0.3255835, 1, 1, 1, 1, 1,
1.227835, -2.882937, 2.174094, 1, 1, 1, 1, 1,
1.232948, 0.9321966, 1.89328, 1, 1, 1, 1, 1,
1.246294, -0.3266968, -0.2841617, 1, 1, 1, 1, 1,
1.248796, 0.2048839, 1.471095, 1, 1, 1, 1, 1,
1.258021, 1.235882, -0.7416579, 1, 1, 1, 1, 1,
1.260115, 0.1309341, 0.7734512, 1, 1, 1, 1, 1,
1.262502, -1.387623, 1.625285, 1, 1, 1, 1, 1,
1.26364, 0.3952674, 1.864487, 1, 1, 1, 1, 1,
1.264228, 2.496418, 1.759124, 1, 1, 1, 1, 1,
1.268329, -0.6298657, 2.606575, 0, 0, 1, 1, 1,
1.269522, -0.1699994, 0.2698675, 1, 0, 0, 1, 1,
1.272864, -0.653006, 1.483094, 1, 0, 0, 1, 1,
1.273285, -0.09036177, 1.672555, 1, 0, 0, 1, 1,
1.298455, -0.4640675, 0.527791, 1, 0, 0, 1, 1,
1.298667, -0.3884267, 0.9062567, 1, 0, 0, 1, 1,
1.300039, 0.7023859, 1.652429, 0, 0, 0, 1, 1,
1.300479, 0.2112744, 1.845611, 0, 0, 0, 1, 1,
1.301793, 1.002668, -0.927312, 0, 0, 0, 1, 1,
1.306687, -2.594367, 4.153465, 0, 0, 0, 1, 1,
1.309995, -1.133687, 1.018958, 0, 0, 0, 1, 1,
1.321387, -1.198993, 2.155105, 0, 0, 0, 1, 1,
1.328194, -2.795123, 2.193815, 0, 0, 0, 1, 1,
1.332228, -0.2327649, 1.414569, 1, 1, 1, 1, 1,
1.333007, 0.2193977, 0.9600713, 1, 1, 1, 1, 1,
1.341713, -0.3876517, 0.2721943, 1, 1, 1, 1, 1,
1.348041, -1.543233, 1.572692, 1, 1, 1, 1, 1,
1.369383, -0.6571794, 1.218822, 1, 1, 1, 1, 1,
1.372022, -0.1208736, 0.3366777, 1, 1, 1, 1, 1,
1.384361, 3.050099, 1.290826, 1, 1, 1, 1, 1,
1.386916, 0.2063908, 0.4623202, 1, 1, 1, 1, 1,
1.390282, 1.012468, 1.314328, 1, 1, 1, 1, 1,
1.400913, 0.7221882, 2.062162, 1, 1, 1, 1, 1,
1.402484, -0.7307092, 1.248314, 1, 1, 1, 1, 1,
1.417811, -0.4893446, 0.8747982, 1, 1, 1, 1, 1,
1.418207, 0.9766326, 0.8267985, 1, 1, 1, 1, 1,
1.420229, 0.8834071, 1.771477, 1, 1, 1, 1, 1,
1.421579, 1.180339, 0.8292896, 1, 1, 1, 1, 1,
1.421823, 0.9077826, 1.255201, 0, 0, 1, 1, 1,
1.429157, 0.6462743, 2.036387, 1, 0, 0, 1, 1,
1.429178, -0.5062511, 1.426887, 1, 0, 0, 1, 1,
1.435525, -0.1235025, 2.269006, 1, 0, 0, 1, 1,
1.441235, 0.1210225, 1.087191, 1, 0, 0, 1, 1,
1.468077, 0.3216166, 0.6553357, 1, 0, 0, 1, 1,
1.472142, -0.5622832, 2.174813, 0, 0, 0, 1, 1,
1.493522, 1.205219, -0.05772743, 0, 0, 0, 1, 1,
1.498053, -0.1192002, 0.225861, 0, 0, 0, 1, 1,
1.503303, 0.4305077, 1.611145, 0, 0, 0, 1, 1,
1.508645, 1.4458, 2.205644, 0, 0, 0, 1, 1,
1.514256, 0.07050623, 2.002238, 0, 0, 0, 1, 1,
1.529189, -1.860971, 3.435686, 0, 0, 0, 1, 1,
1.547833, -0.2598697, 3.033346, 1, 1, 1, 1, 1,
1.547944, -0.6727055, 2.410112, 1, 1, 1, 1, 1,
1.548499, -0.5551896, 2.724559, 1, 1, 1, 1, 1,
1.555797, 0.5037544, 0.4134747, 1, 1, 1, 1, 1,
1.557568, -1.319604, 1.457547, 1, 1, 1, 1, 1,
1.558426, -0.3351821, 0.9048912, 1, 1, 1, 1, 1,
1.569057, 1.812501, 1.854833, 1, 1, 1, 1, 1,
1.57273, 0.4147317, 0.1964644, 1, 1, 1, 1, 1,
1.573592, -1.370529, 0.4528879, 1, 1, 1, 1, 1,
1.575233, -0.9619747, 3.352517, 1, 1, 1, 1, 1,
1.617201, -0.02033358, -0.02680675, 1, 1, 1, 1, 1,
1.649463, -0.6159095, 1.24738, 1, 1, 1, 1, 1,
1.650999, -0.6684976, 0.9135998, 1, 1, 1, 1, 1,
1.661928, -1.070089, 2.303925, 1, 1, 1, 1, 1,
1.674666, 2.652554, -0.08836258, 1, 1, 1, 1, 1,
1.675743, 0.3629169, 0.9760612, 0, 0, 1, 1, 1,
1.681572, 0.1479596, 2.391349, 1, 0, 0, 1, 1,
1.687451, 0.0214062, 1.582341, 1, 0, 0, 1, 1,
1.720881, -0.5356743, -0.5444455, 1, 0, 0, 1, 1,
1.72355, 0.2793844, 0.7685781, 1, 0, 0, 1, 1,
1.726899, 0.6495658, 1.821246, 1, 0, 0, 1, 1,
1.733513, 1.481556, -0.004410329, 0, 0, 0, 1, 1,
1.799338, 0.8486626, 0.6646082, 0, 0, 0, 1, 1,
1.80863, 2.084222, 0.7619747, 0, 0, 0, 1, 1,
1.825384, 0.09143589, 0.892642, 0, 0, 0, 1, 1,
1.825666, 1.276257, 0.5725647, 0, 0, 0, 1, 1,
1.829343, -1.966795, 0.8974029, 0, 0, 0, 1, 1,
1.903638, 0.7689666, 2.337209, 0, 0, 0, 1, 1,
1.92834, -1.386676, 1.609259, 1, 1, 1, 1, 1,
2.017678, 0.2567579, 1.009952, 1, 1, 1, 1, 1,
2.02063, 0.8007489, 1.301774, 1, 1, 1, 1, 1,
2.021789, -0.1961822, 0.02425554, 1, 1, 1, 1, 1,
2.024012, -0.6714742, 2.069633, 1, 1, 1, 1, 1,
2.036119, -0.3301352, 1.670011, 1, 1, 1, 1, 1,
2.047422, -0.8769282, 0.5730089, 1, 1, 1, 1, 1,
2.049046, -1.670959, 1.212247, 1, 1, 1, 1, 1,
2.052217, -0.1839648, 1.085633, 1, 1, 1, 1, 1,
2.052458, -0.8954998, 2.12411, 1, 1, 1, 1, 1,
2.096727, -0.2418203, 1.68475, 1, 1, 1, 1, 1,
2.101521, 0.9145647, 0.2479025, 1, 1, 1, 1, 1,
2.114151, 0.8777532, 2.212812, 1, 1, 1, 1, 1,
2.114578, 0.1202543, 3.667126, 1, 1, 1, 1, 1,
2.124454, 1.547125, -0.5208953, 1, 1, 1, 1, 1,
2.17509, -1.863615, 1.662109, 0, 0, 1, 1, 1,
2.194169, 2.279488, 0.2756222, 1, 0, 0, 1, 1,
2.261551, 0.6698971, 1.3855, 1, 0, 0, 1, 1,
2.261674, -0.4452415, 1.247634, 1, 0, 0, 1, 1,
2.26279, 3.493032, 1.563857, 1, 0, 0, 1, 1,
2.291987, 0.2939585, 1.111577, 1, 0, 0, 1, 1,
2.305312, 0.6496911, 2.912699, 0, 0, 0, 1, 1,
2.353193, -1.004157, 4.225093, 0, 0, 0, 1, 1,
2.364518, -0.09648739, 0.810941, 0, 0, 0, 1, 1,
2.389575, -0.9755658, 3.164481, 0, 0, 0, 1, 1,
2.393238, 1.072181, -0.2468601, 0, 0, 0, 1, 1,
2.421363, -0.008349377, 1.000377, 0, 0, 0, 1, 1,
2.425761, 1.005279, 0.7782789, 0, 0, 0, 1, 1,
2.474865, -0.5947198, 2.656821, 1, 1, 1, 1, 1,
2.525652, 1.840817, 0.5121329, 1, 1, 1, 1, 1,
2.578161, 0.2333532, 1.77356, 1, 1, 1, 1, 1,
2.695461, 0.1893937, 1.500579, 1, 1, 1, 1, 1,
2.853878, -1.430416, 2.147144, 1, 1, 1, 1, 1,
2.978684, -0.04897553, 1.724274, 1, 1, 1, 1, 1,
3.06582, -0.01451664, -0.2601081, 1, 1, 1, 1, 1
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
var radius = 9.221451;
var distance = 32.38995;
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
mvMatrix.translate( -0.0413295, -0.305047, 0.3092406 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38995);
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
