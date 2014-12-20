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
-3.705497, 0.2158967, 0.1980905, 1, 0, 0, 1,
-2.928574, -1.846628, -2.821742, 1, 0.007843138, 0, 1,
-2.738856, 0.5774454, -0.8492406, 1, 0.01176471, 0, 1,
-2.692244, 0.2578657, -1.773427, 1, 0.01960784, 0, 1,
-2.69089, 0.836081, -0.5195721, 1, 0.02352941, 0, 1,
-2.645702, -0.2033989, -2.267003, 1, 0.03137255, 0, 1,
-2.599348, 0.6197233, -1.055696, 1, 0.03529412, 0, 1,
-2.487001, 0.8201186, -2.184151, 1, 0.04313726, 0, 1,
-2.462442, -1.348503, -1.9904, 1, 0.04705882, 0, 1,
-2.413723, -1.538586, -2.368008, 1, 0.05490196, 0, 1,
-2.346692, -0.2653024, -1.095374, 1, 0.05882353, 0, 1,
-2.275963, -1.057874, -1.626978, 1, 0.06666667, 0, 1,
-2.248445, 0.3500435, -1.576818, 1, 0.07058824, 0, 1,
-2.207615, 0.6342316, -1.808167, 1, 0.07843138, 0, 1,
-2.187624, 0.5096148, -0.7854207, 1, 0.08235294, 0, 1,
-2.136343, -0.8968912, -0.1274211, 1, 0.09019608, 0, 1,
-2.119563, 0.4754741, -3.068685, 1, 0.09411765, 0, 1,
-2.096281, -1.378676, -2.550493, 1, 0.1019608, 0, 1,
-2.063937, 1.222633, 1.030472, 1, 0.1098039, 0, 1,
-2.061365, -0.3544177, -0.04549946, 1, 0.1137255, 0, 1,
-2.044131, 0.7215028, 1.447996, 1, 0.1215686, 0, 1,
-2.022997, -0.8377576, -3.034949, 1, 0.1254902, 0, 1,
-2.020929, -0.2544842, -1.883957, 1, 0.1333333, 0, 1,
-2.019619, 0.9549971, -2.115812, 1, 0.1372549, 0, 1,
-2.008519, -0.9206017, -1.474638, 1, 0.145098, 0, 1,
-2.003315, 1.225214, -1.410288, 1, 0.1490196, 0, 1,
-1.974177, 0.6379909, -2.305103, 1, 0.1568628, 0, 1,
-1.973189, 0.5821488, -1.342396, 1, 0.1607843, 0, 1,
-1.953181, -0.9381592, -0.6809001, 1, 0.1686275, 0, 1,
-1.946949, -0.4747341, -1.124653, 1, 0.172549, 0, 1,
-1.930346, 0.3107198, -0.5858633, 1, 0.1803922, 0, 1,
-1.91603, 0.260998, -2.323229, 1, 0.1843137, 0, 1,
-1.885862, 1.582104, 0.7990414, 1, 0.1921569, 0, 1,
-1.878076, 0.9696607, 0.7057557, 1, 0.1960784, 0, 1,
-1.859781, 0.4862097, 0.9329048, 1, 0.2039216, 0, 1,
-1.854411, -1.058887, -0.8612579, 1, 0.2117647, 0, 1,
-1.852129, 0.7489715, -1.577353, 1, 0.2156863, 0, 1,
-1.745205, 1.396607, -1.500139, 1, 0.2235294, 0, 1,
-1.743593, 0.0951675, -1.393624, 1, 0.227451, 0, 1,
-1.718179, 0.4187688, -2.00473, 1, 0.2352941, 0, 1,
-1.700373, -0.703845, -1.012452, 1, 0.2392157, 0, 1,
-1.696824, -0.2854483, -2.516292, 1, 0.2470588, 0, 1,
-1.696367, 1.691636, -0.1684437, 1, 0.2509804, 0, 1,
-1.692805, 0.3881194, -3.164886, 1, 0.2588235, 0, 1,
-1.686896, -0.01406868, -2.936182, 1, 0.2627451, 0, 1,
-1.681058, -0.339607, -2.393322, 1, 0.2705882, 0, 1,
-1.661379, 0.8846588, -0.8574455, 1, 0.2745098, 0, 1,
-1.639005, -0.8541009, -1.971841, 1, 0.282353, 0, 1,
-1.638478, -0.9825474, -2.560547, 1, 0.2862745, 0, 1,
-1.635492, -0.6153028, -2.194691, 1, 0.2941177, 0, 1,
-1.620172, 0.1629641, -0.6717542, 1, 0.3019608, 0, 1,
-1.617217, 0.09853725, -3.107014, 1, 0.3058824, 0, 1,
-1.611254, 0.5539179, -1.185877, 1, 0.3137255, 0, 1,
-1.595236, -0.5866506, -1.642298, 1, 0.3176471, 0, 1,
-1.589995, 0.3203853, -1.967176, 1, 0.3254902, 0, 1,
-1.586647, 1.567885, -0.4240085, 1, 0.3294118, 0, 1,
-1.584856, -0.2255135, -2.158033, 1, 0.3372549, 0, 1,
-1.568382, 0.07317813, -0.2415429, 1, 0.3411765, 0, 1,
-1.559793, 0.7612184, 0.1234572, 1, 0.3490196, 0, 1,
-1.556177, 0.8727454, -1.55904, 1, 0.3529412, 0, 1,
-1.532551, -1.759244, -1.038155, 1, 0.3607843, 0, 1,
-1.522401, -0.8728408, -1.60661, 1, 0.3647059, 0, 1,
-1.521052, -1.034547, -3.380565, 1, 0.372549, 0, 1,
-1.516969, -1.434265, -2.69524, 1, 0.3764706, 0, 1,
-1.488141, 0.1186518, -1.483951, 1, 0.3843137, 0, 1,
-1.478637, -0.7979178, -3.703647, 1, 0.3882353, 0, 1,
-1.472157, -0.8937981, -1.387876, 1, 0.3960784, 0, 1,
-1.462259, 0.1081232, -1.82576, 1, 0.4039216, 0, 1,
-1.460233, -0.4184624, -1.437421, 1, 0.4078431, 0, 1,
-1.459357, 1.024579, -0.8628914, 1, 0.4156863, 0, 1,
-1.451002, -0.8012912, -1.224053, 1, 0.4196078, 0, 1,
-1.436886, -1.58081, -5.358179, 1, 0.427451, 0, 1,
-1.434982, 1.226968, 1.035248, 1, 0.4313726, 0, 1,
-1.413329, -1.374697, -3.485159, 1, 0.4392157, 0, 1,
-1.406809, 1.716058, -0.8357034, 1, 0.4431373, 0, 1,
-1.401399, -1.49079, -3.855685, 1, 0.4509804, 0, 1,
-1.399593, -2.229271, -4.12872, 1, 0.454902, 0, 1,
-1.398571, -0.8032521, -1.837551, 1, 0.4627451, 0, 1,
-1.393963, 1.625378, 0.7882367, 1, 0.4666667, 0, 1,
-1.39369, -0.9923444, -4.478501, 1, 0.4745098, 0, 1,
-1.38623, -0.01450095, -2.451065, 1, 0.4784314, 0, 1,
-1.379847, 0.9004104, -1.925094, 1, 0.4862745, 0, 1,
-1.371757, 0.1830048, -3.953677, 1, 0.4901961, 0, 1,
-1.370157, 0.3906568, -2.828645, 1, 0.4980392, 0, 1,
-1.367255, -0.5431416, -3.126998, 1, 0.5058824, 0, 1,
-1.367101, 0.3968583, 0.155052, 1, 0.509804, 0, 1,
-1.355258, 0.0712942, -0.8202658, 1, 0.5176471, 0, 1,
-1.349963, -0.7137517, -2.732727, 1, 0.5215687, 0, 1,
-1.349555, -0.5608703, -2.207571, 1, 0.5294118, 0, 1,
-1.342723, -0.07873598, -2.422121, 1, 0.5333334, 0, 1,
-1.332032, 0.3036864, -1.317644, 1, 0.5411765, 0, 1,
-1.320869, 0.2159181, -3.055356, 1, 0.5450981, 0, 1,
-1.318513, 0.1344838, -2.479075, 1, 0.5529412, 0, 1,
-1.317009, -0.1030774, -1.334656, 1, 0.5568628, 0, 1,
-1.314825, 0.03622437, -0.3728547, 1, 0.5647059, 0, 1,
-1.313686, 1.350573, -0.4038762, 1, 0.5686275, 0, 1,
-1.310306, 1.569464, 0.1276924, 1, 0.5764706, 0, 1,
-1.30943, -0.06646643, -1.709599, 1, 0.5803922, 0, 1,
-1.305067, -0.8490614, -0.03531295, 1, 0.5882353, 0, 1,
-1.301798, 1.572531, -0.5147837, 1, 0.5921569, 0, 1,
-1.296305, 1.372754, -1.013514, 1, 0.6, 0, 1,
-1.294098, -0.07017271, -3.410486, 1, 0.6078432, 0, 1,
-1.279373, 0.03000369, -0.8988206, 1, 0.6117647, 0, 1,
-1.272976, 0.6711637, 0.8238802, 1, 0.6196079, 0, 1,
-1.267453, 0.4197899, -0.05203899, 1, 0.6235294, 0, 1,
-1.255764, -0.9546717, -2.485481, 1, 0.6313726, 0, 1,
-1.25207, 0.1530469, -0.4235945, 1, 0.6352941, 0, 1,
-1.249136, -1.620069, -1.553746, 1, 0.6431373, 0, 1,
-1.227294, -0.07756732, -0.9997768, 1, 0.6470588, 0, 1,
-1.217193, 0.1260162, -0.7864792, 1, 0.654902, 0, 1,
-1.215847, 1.88029, -1.549144, 1, 0.6588235, 0, 1,
-1.20774, -0.1489367, -0.9713157, 1, 0.6666667, 0, 1,
-1.207168, 0.6110154, -1.031788, 1, 0.6705883, 0, 1,
-1.201679, -0.7360981, -1.361457, 1, 0.6784314, 0, 1,
-1.200514, 0.7075921, -0.9727839, 1, 0.682353, 0, 1,
-1.199807, 0.3986645, -2.19353, 1, 0.6901961, 0, 1,
-1.197194, -0.3492576, -2.142024, 1, 0.6941177, 0, 1,
-1.191438, 0.5436649, -0.8052791, 1, 0.7019608, 0, 1,
-1.186844, -0.1383955, -1.568983, 1, 0.7098039, 0, 1,
-1.182871, -0.0954363, -0.238259, 1, 0.7137255, 0, 1,
-1.179572, 1.289508, 0.1838664, 1, 0.7215686, 0, 1,
-1.175633, -0.4652623, -2.691494, 1, 0.7254902, 0, 1,
-1.169935, -1.326852, -2.316657, 1, 0.7333333, 0, 1,
-1.16959, -0.5673554, -1.288812, 1, 0.7372549, 0, 1,
-1.167729, -0.7885745, -1.283923, 1, 0.7450981, 0, 1,
-1.163464, -0.1765556, -2.314319, 1, 0.7490196, 0, 1,
-1.156831, 0.4638565, -1.73343, 1, 0.7568628, 0, 1,
-1.155239, -0.699311, -2.199003, 1, 0.7607843, 0, 1,
-1.136901, 1.44331, -1.295261, 1, 0.7686275, 0, 1,
-1.136236, 0.3354061, -0.1741079, 1, 0.772549, 0, 1,
-1.134666, -1.281576, -4.152456, 1, 0.7803922, 0, 1,
-1.129311, -0.2399899, -2.195581, 1, 0.7843137, 0, 1,
-1.125694, -0.8443174, -1.314209, 1, 0.7921569, 0, 1,
-1.124008, 0.7655753, -0.309409, 1, 0.7960784, 0, 1,
-1.111974, 1.557039, -0.8083398, 1, 0.8039216, 0, 1,
-1.107916, -1.111582, -4.220754, 1, 0.8117647, 0, 1,
-1.095742, -0.03795465, -1.802471, 1, 0.8156863, 0, 1,
-1.094316, 0.3574571, -1.266323, 1, 0.8235294, 0, 1,
-1.092331, -1.98479, -1.05109, 1, 0.827451, 0, 1,
-1.082136, -0.194042, -1.113681, 1, 0.8352941, 0, 1,
-1.0809, 0.91452, -1.909385, 1, 0.8392157, 0, 1,
-1.078456, -0.6940464, -2.098318, 1, 0.8470588, 0, 1,
-1.072445, -2.074277, -2.425776, 1, 0.8509804, 0, 1,
-1.07154, 1.411541, 0.05424844, 1, 0.8588235, 0, 1,
-1.069804, 0.3283793, -0.2568024, 1, 0.8627451, 0, 1,
-1.06951, 0.7345214, -1.845019, 1, 0.8705882, 0, 1,
-1.059281, 0.556814, -1.996833, 1, 0.8745098, 0, 1,
-1.053766, 0.09479304, -1.032435, 1, 0.8823529, 0, 1,
-1.045233, 1.193087, -0.5549495, 1, 0.8862745, 0, 1,
-1.042325, -1.32636, -2.232706, 1, 0.8941177, 0, 1,
-1.035053, 0.1123186, -0.7888232, 1, 0.8980392, 0, 1,
-1.029526, 1.343174, -0.9884365, 1, 0.9058824, 0, 1,
-1.013196, -0.1999564, -1.072205, 1, 0.9137255, 0, 1,
-1.012074, -0.05475996, 0.7797887, 1, 0.9176471, 0, 1,
-1.012007, -0.4026086, -1.098752, 1, 0.9254902, 0, 1,
-1.010737, -0.1544093, -0.9280105, 1, 0.9294118, 0, 1,
-1.009889, 0.3925569, -0.7014194, 1, 0.9372549, 0, 1,
-1.008174, 0.8299761, -1.600165, 1, 0.9411765, 0, 1,
-1.004136, -1.242882, -3.219405, 1, 0.9490196, 0, 1,
-0.9969814, -0.9796897, -1.834488, 1, 0.9529412, 0, 1,
-0.9946468, 0.1241653, 0.8708752, 1, 0.9607843, 0, 1,
-0.98243, 0.6702173, 0.1520837, 1, 0.9647059, 0, 1,
-0.9802022, 0.9401867, -2.64871, 1, 0.972549, 0, 1,
-0.9760519, 1.217693, -1.23912, 1, 0.9764706, 0, 1,
-0.9742813, 1.110275, 0.189245, 1, 0.9843137, 0, 1,
-0.970248, 0.6025246, -0.670445, 1, 0.9882353, 0, 1,
-0.9654761, -0.2003143, -0.4872218, 1, 0.9960784, 0, 1,
-0.9653256, 1.591698, -0.2433501, 0.9960784, 1, 0, 1,
-0.9633785, 1.246479, -1.692147, 0.9921569, 1, 0, 1,
-0.9607536, -1.180378, -0.1777286, 0.9843137, 1, 0, 1,
-0.9599603, 0.6196122, -0.6521006, 0.9803922, 1, 0, 1,
-0.9542027, 0.05718323, -0.9064815, 0.972549, 1, 0, 1,
-0.946749, -1.310726, -2.084841, 0.9686275, 1, 0, 1,
-0.9316373, -0.8121141, -1.290618, 0.9607843, 1, 0, 1,
-0.9311845, 0.1007481, -1.23407, 0.9568627, 1, 0, 1,
-0.927845, -0.983431, -3.376951, 0.9490196, 1, 0, 1,
-0.9219971, -1.794348, -1.192261, 0.945098, 1, 0, 1,
-0.9148697, 0.7319926, 0.2295053, 0.9372549, 1, 0, 1,
-0.9135713, -0.22863, -1.338447, 0.9333333, 1, 0, 1,
-0.9094637, 0.6853005, -0.4596595, 0.9254902, 1, 0, 1,
-0.9087948, 0.6618523, -0.3288503, 0.9215686, 1, 0, 1,
-0.9040521, 1.834882, 0.8476862, 0.9137255, 1, 0, 1,
-0.9035349, 0.8453788, -0.3201669, 0.9098039, 1, 0, 1,
-0.9017285, -0.1853968, -1.36542, 0.9019608, 1, 0, 1,
-0.8974869, -0.3607331, -3.344707, 0.8941177, 1, 0, 1,
-0.8934612, 1.433657, -1.884308, 0.8901961, 1, 0, 1,
-0.8915411, -0.9740864, -1.42381, 0.8823529, 1, 0, 1,
-0.890579, -0.07565149, -1.449472, 0.8784314, 1, 0, 1,
-0.8857049, -0.5067096, -2.481503, 0.8705882, 1, 0, 1,
-0.8856544, 0.2323761, -1.492924, 0.8666667, 1, 0, 1,
-0.8769563, 0.5839153, -0.7565352, 0.8588235, 1, 0, 1,
-0.875186, -0.2434784, -2.125431, 0.854902, 1, 0, 1,
-0.8723091, -0.04817659, -1.429879, 0.8470588, 1, 0, 1,
-0.8629904, -0.2984511, -1.293643, 0.8431373, 1, 0, 1,
-0.8616691, -0.823145, -3.161377, 0.8352941, 1, 0, 1,
-0.8427446, 1.485234, 0.1660302, 0.8313726, 1, 0, 1,
-0.8404061, -1.645316, -2.217612, 0.8235294, 1, 0, 1,
-0.8402945, -1.474807, -3.161506, 0.8196079, 1, 0, 1,
-0.832697, 0.9532099, -0.217273, 0.8117647, 1, 0, 1,
-0.8234186, 0.8049306, -1.889703, 0.8078431, 1, 0, 1,
-0.8177696, 0.1404443, -0.4519667, 0.8, 1, 0, 1,
-0.8174474, -1.633047, -1.613734, 0.7921569, 1, 0, 1,
-0.8168243, -1.671445, -2.193191, 0.7882353, 1, 0, 1,
-0.8157687, -0.0008753893, 0.4401298, 0.7803922, 1, 0, 1,
-0.8144341, 0.7392051, -0.06966885, 0.7764706, 1, 0, 1,
-0.8141079, 0.5363289, 0.2022457, 0.7686275, 1, 0, 1,
-0.8057234, 0.903039, 0.1572979, 0.7647059, 1, 0, 1,
-0.8044441, 0.6315435, 0.3708821, 0.7568628, 1, 0, 1,
-0.8032657, 1.300661, -0.497738, 0.7529412, 1, 0, 1,
-0.798439, 0.3121102, 0.02352585, 0.7450981, 1, 0, 1,
-0.7969013, 0.1696516, -0.4539203, 0.7411765, 1, 0, 1,
-0.793259, -0.0403304, -1.135921, 0.7333333, 1, 0, 1,
-0.7928322, -1.041238, -2.966652, 0.7294118, 1, 0, 1,
-0.7909132, -1.705732, -2.54606, 0.7215686, 1, 0, 1,
-0.7869323, 0.5528424, 0.3702716, 0.7176471, 1, 0, 1,
-0.7842018, -0.5032294, -1.726237, 0.7098039, 1, 0, 1,
-0.7802244, -2.450986, -2.566446, 0.7058824, 1, 0, 1,
-0.7753872, -0.2398428, -0.991289, 0.6980392, 1, 0, 1,
-0.7720171, -0.3453062, -1.839613, 0.6901961, 1, 0, 1,
-0.7701654, 1.344286, 0.5740277, 0.6862745, 1, 0, 1,
-0.7632424, -1.161581, -3.23122, 0.6784314, 1, 0, 1,
-0.7613676, 0.08067383, -0.4793033, 0.6745098, 1, 0, 1,
-0.7578845, -2.700508, -4.484774, 0.6666667, 1, 0, 1,
-0.7554559, 1.730413, 0.7397822, 0.6627451, 1, 0, 1,
-0.7399318, -2.030119, -1.358746, 0.654902, 1, 0, 1,
-0.7378699, -1.27021, -3.254706, 0.6509804, 1, 0, 1,
-0.7346639, -1.026474, -2.185368, 0.6431373, 1, 0, 1,
-0.7338557, -0.1704595, -0.3852352, 0.6392157, 1, 0, 1,
-0.7337962, -0.01727766, -1.888377, 0.6313726, 1, 0, 1,
-0.7266364, -0.2542934, -0.38323, 0.627451, 1, 0, 1,
-0.7217333, 0.989586, -1.766701, 0.6196079, 1, 0, 1,
-0.7149442, -1.433367, -2.471388, 0.6156863, 1, 0, 1,
-0.7101327, -0.2993283, -3.488408, 0.6078432, 1, 0, 1,
-0.7096629, 0.4496938, -3.324873, 0.6039216, 1, 0, 1,
-0.709274, -0.7220764, -1.669236, 0.5960785, 1, 0, 1,
-0.7039838, -1.205522, -4.654574, 0.5882353, 1, 0, 1,
-0.6984698, -0.8485408, -1.237727, 0.5843138, 1, 0, 1,
-0.6927634, 0.2735821, -2.605652, 0.5764706, 1, 0, 1,
-0.6908822, -1.426186, -4.196, 0.572549, 1, 0, 1,
-0.6804491, -1.068923, -0.9981574, 0.5647059, 1, 0, 1,
-0.679668, -0.7589292, -3.487546, 0.5607843, 1, 0, 1,
-0.6794559, -0.891138, -2.945881, 0.5529412, 1, 0, 1,
-0.6772621, 0.4940786, 1.48241, 0.5490196, 1, 0, 1,
-0.6765392, -0.7840114, -2.447688, 0.5411765, 1, 0, 1,
-0.6731269, -0.08770797, -3.076568, 0.5372549, 1, 0, 1,
-0.6717204, -1.564054, -3.71181, 0.5294118, 1, 0, 1,
-0.6704976, -0.8793814, -1.294209, 0.5254902, 1, 0, 1,
-0.6700046, 1.023827, -1.53045, 0.5176471, 1, 0, 1,
-0.6620759, 0.3335207, -0.8819871, 0.5137255, 1, 0, 1,
-0.6564636, -1.29635, -2.741536, 0.5058824, 1, 0, 1,
-0.6477026, 1.038783, -1.648708, 0.5019608, 1, 0, 1,
-0.6392592, 0.7514941, -0.2256445, 0.4941176, 1, 0, 1,
-0.6321898, -0.2295278, -1.376088, 0.4862745, 1, 0, 1,
-0.6315241, -3.033598, -2.631531, 0.4823529, 1, 0, 1,
-0.6224819, 0.8034283, 0.6419717, 0.4745098, 1, 0, 1,
-0.619028, 0.2373663, -1.106446, 0.4705882, 1, 0, 1,
-0.6187323, 0.9395654, -1.18108, 0.4627451, 1, 0, 1,
-0.6109126, 0.923724, -1.487095, 0.4588235, 1, 0, 1,
-0.6003295, 0.3304387, -1.428557, 0.4509804, 1, 0, 1,
-0.6002482, -0.2098006, -2.510751, 0.4470588, 1, 0, 1,
-0.5987049, 0.2621868, -0.8677649, 0.4392157, 1, 0, 1,
-0.5948938, -0.7714098, -3.027757, 0.4352941, 1, 0, 1,
-0.5914848, 1.047342, -0.1945558, 0.427451, 1, 0, 1,
-0.5899843, 0.3388681, -2.069872, 0.4235294, 1, 0, 1,
-0.5897544, 1.338554, -2.452066, 0.4156863, 1, 0, 1,
-0.5883222, 1.701144, -1.998872, 0.4117647, 1, 0, 1,
-0.5865566, -0.2998935, -1.067445, 0.4039216, 1, 0, 1,
-0.5859068, -0.3650556, -2.12661, 0.3960784, 1, 0, 1,
-0.583275, -1.020383, -4.123005, 0.3921569, 1, 0, 1,
-0.5796123, -0.01273355, -1.928853, 0.3843137, 1, 0, 1,
-0.5775499, -0.1198935, -2.910074, 0.3803922, 1, 0, 1,
-0.5716714, -0.3125097, 1.201618, 0.372549, 1, 0, 1,
-0.5702565, -0.9913238, -3.574824, 0.3686275, 1, 0, 1,
-0.567394, -0.2552708, -2.624478, 0.3607843, 1, 0, 1,
-0.5664598, -1.556213, -4.42073, 0.3568628, 1, 0, 1,
-0.5640081, 0.6092477, -0.9399194, 0.3490196, 1, 0, 1,
-0.5625999, -0.9262571, -1.430059, 0.345098, 1, 0, 1,
-0.5620228, 1.455734, 0.9824895, 0.3372549, 1, 0, 1,
-0.5598873, 0.2500419, -0.5570023, 0.3333333, 1, 0, 1,
-0.55875, 1.496635, 1.177085, 0.3254902, 1, 0, 1,
-0.5578246, -0.4385569, -1.648769, 0.3215686, 1, 0, 1,
-0.5542387, 1.420551, 0.3142766, 0.3137255, 1, 0, 1,
-0.5541919, -0.2235268, -1.760503, 0.3098039, 1, 0, 1,
-0.5488576, 0.4598763, -1.941309, 0.3019608, 1, 0, 1,
-0.5454208, 0.6790912, -0.7776307, 0.2941177, 1, 0, 1,
-0.543067, 0.515439, -0.9967752, 0.2901961, 1, 0, 1,
-0.5403971, 0.7160264, -0.1537219, 0.282353, 1, 0, 1,
-0.5381958, -1.308625, -0.7528301, 0.2784314, 1, 0, 1,
-0.5367242, -0.6226141, -3.198385, 0.2705882, 1, 0, 1,
-0.5358527, -1.593068, -2.445014, 0.2666667, 1, 0, 1,
-0.5264736, 0.9044089, -0.8116259, 0.2588235, 1, 0, 1,
-0.5263973, -0.7443079, 0.3604451, 0.254902, 1, 0, 1,
-0.5178851, 3.257674, -1.831129, 0.2470588, 1, 0, 1,
-0.51671, -0.6135316, -1.563816, 0.2431373, 1, 0, 1,
-0.5144035, -0.5656289, -4.434209, 0.2352941, 1, 0, 1,
-0.5006695, 0.8690209, -1.324127, 0.2313726, 1, 0, 1,
-0.500312, -1.024133, -4.507807, 0.2235294, 1, 0, 1,
-0.4998972, -0.6857998, -4.163273, 0.2196078, 1, 0, 1,
-0.4969371, 0.01366759, -1.697164, 0.2117647, 1, 0, 1,
-0.495924, 0.4609906, -1.082476, 0.2078431, 1, 0, 1,
-0.4863315, 0.6869624, -0.8202624, 0.2, 1, 0, 1,
-0.4857734, -0.8462312, -0.8470189, 0.1921569, 1, 0, 1,
-0.485065, -0.1944817, -1.4529, 0.1882353, 1, 0, 1,
-0.4773355, 0.03027888, -1.347505, 0.1803922, 1, 0, 1,
-0.4713444, 0.260946, -0.5563293, 0.1764706, 1, 0, 1,
-0.4663137, -0.908212, -2.159622, 0.1686275, 1, 0, 1,
-0.455585, -0.3799739, -0.4344772, 0.1647059, 1, 0, 1,
-0.4551889, 1.707407, -1.875254, 0.1568628, 1, 0, 1,
-0.454964, 0.1878886, -1.036279, 0.1529412, 1, 0, 1,
-0.4535645, 0.7638662, -0.7696491, 0.145098, 1, 0, 1,
-0.4533753, 0.00955498, -1.951307, 0.1411765, 1, 0, 1,
-0.4533681, -0.6779981, -0.1400791, 0.1333333, 1, 0, 1,
-0.4495095, -0.04852734, -2.630565, 0.1294118, 1, 0, 1,
-0.4487337, -0.7340694, -3.270911, 0.1215686, 1, 0, 1,
-0.4433089, -1.427847, -1.924486, 0.1176471, 1, 0, 1,
-0.4404119, -0.6265939, -1.614885, 0.1098039, 1, 0, 1,
-0.439867, 0.464814, -0.767152, 0.1058824, 1, 0, 1,
-0.4375482, -0.8387326, -2.737514, 0.09803922, 1, 0, 1,
-0.4369051, 0.7340128, -0.7978715, 0.09019608, 1, 0, 1,
-0.434864, -1.073739, -0.9741896, 0.08627451, 1, 0, 1,
-0.4334784, 1.480993, -1.741302, 0.07843138, 1, 0, 1,
-0.426655, 0.03486255, -2.091831, 0.07450981, 1, 0, 1,
-0.4263779, -1.397066, -3.731816, 0.06666667, 1, 0, 1,
-0.425936, 0.8018584, 1.01728, 0.0627451, 1, 0, 1,
-0.4257674, 0.08590832, -1.748548, 0.05490196, 1, 0, 1,
-0.4220013, 1.034083, -2.99607, 0.05098039, 1, 0, 1,
-0.4186597, -0.1692738, -4.393958, 0.04313726, 1, 0, 1,
-0.4173222, 0.8710066, -0.2718734, 0.03921569, 1, 0, 1,
-0.4096729, -0.210434, -1.915926, 0.03137255, 1, 0, 1,
-0.4018223, 0.5089847, -0.8490567, 0.02745098, 1, 0, 1,
-0.4017508, -0.0364993, -3.290946, 0.01960784, 1, 0, 1,
-0.4015946, 0.8661035, -0.1363815, 0.01568628, 1, 0, 1,
-0.3976187, 0.295177, 0.2698007, 0.007843138, 1, 0, 1,
-0.395975, 0.09973191, -2.068799, 0.003921569, 1, 0, 1,
-0.3946071, 0.7973557, -1.33545, 0, 1, 0.003921569, 1,
-0.3921282, -0.6777385, -2.918546, 0, 1, 0.01176471, 1,
-0.3903204, 0.9473439, -0.128716, 0, 1, 0.01568628, 1,
-0.390233, -1.38505, -3.314025, 0, 1, 0.02352941, 1,
-0.3899761, -1.51159, -2.145905, 0, 1, 0.02745098, 1,
-0.3865216, -1.559597, -3.272569, 0, 1, 0.03529412, 1,
-0.3779292, -0.4390218, -0.8993482, 0, 1, 0.03921569, 1,
-0.3774612, -0.285556, -3.626437, 0, 1, 0.04705882, 1,
-0.372606, 2.058312, -0.1542393, 0, 1, 0.05098039, 1,
-0.3700852, -1.262289, -2.350963, 0, 1, 0.05882353, 1,
-0.3662903, -0.01471857, -1.929473, 0, 1, 0.0627451, 1,
-0.3649517, -0.3600599, -1.888315, 0, 1, 0.07058824, 1,
-0.3623566, 1.807774, -1.231713, 0, 1, 0.07450981, 1,
-0.361499, -0.1996537, -1.376674, 0, 1, 0.08235294, 1,
-0.3589848, 0.7356586, -0.4687111, 0, 1, 0.08627451, 1,
-0.358622, -1.10842, -3.470317, 0, 1, 0.09411765, 1,
-0.3542513, 0.1352522, -0.9269016, 0, 1, 0.1019608, 1,
-0.3455238, 0.1865808, -0.9657604, 0, 1, 0.1058824, 1,
-0.3449841, 0.1912752, -0.09409487, 0, 1, 0.1137255, 1,
-0.343401, 0.1745044, -1.175014, 0, 1, 0.1176471, 1,
-0.3429981, -0.08561642, -1.345706, 0, 1, 0.1254902, 1,
-0.3411513, -0.3912997, -3.089078, 0, 1, 0.1294118, 1,
-0.3399038, 2.676523, 0.5438339, 0, 1, 0.1372549, 1,
-0.3371982, -1.324875, -4.959129, 0, 1, 0.1411765, 1,
-0.3363445, -0.4665713, -2.439704, 0, 1, 0.1490196, 1,
-0.3348398, 1.354539, -0.3881862, 0, 1, 0.1529412, 1,
-0.3310536, -1.693119, -2.84995, 0, 1, 0.1607843, 1,
-0.3273216, 0.389387, 0.8768486, 0, 1, 0.1647059, 1,
-0.3273127, 0.7087772, -0.6512076, 0, 1, 0.172549, 1,
-0.3238847, -0.5120376, -2.80719, 0, 1, 0.1764706, 1,
-0.3209412, -0.8821633, -2.238695, 0, 1, 0.1843137, 1,
-0.3189043, -1.043705, -2.515072, 0, 1, 0.1882353, 1,
-0.3167018, 1.060825, -1.220659, 0, 1, 0.1960784, 1,
-0.3163057, -1.445715, -2.464055, 0, 1, 0.2039216, 1,
-0.3124116, -0.9397447, -2.257505, 0, 1, 0.2078431, 1,
-0.3068306, 0.7349745, -0.5373294, 0, 1, 0.2156863, 1,
-0.2965387, 0.5156207, -1.207134, 0, 1, 0.2196078, 1,
-0.2923965, -0.8699049, -3.959136, 0, 1, 0.227451, 1,
-0.2914688, 2.285898, -1.649082, 0, 1, 0.2313726, 1,
-0.288999, -1.020973, -4.365561, 0, 1, 0.2392157, 1,
-0.2877325, 0.3293605, 0.8977677, 0, 1, 0.2431373, 1,
-0.2862228, -0.8053856, -3.278831, 0, 1, 0.2509804, 1,
-0.2755627, -0.9813223, -2.735048, 0, 1, 0.254902, 1,
-0.274643, -0.6174408, -3.013164, 0, 1, 0.2627451, 1,
-0.2705631, 1.727643, 0.03744539, 0, 1, 0.2666667, 1,
-0.2701215, -0.8493616, -1.895713, 0, 1, 0.2745098, 1,
-0.2667829, 0.9394389, 0.1612232, 0, 1, 0.2784314, 1,
-0.2659399, 0.2104581, -1.118653, 0, 1, 0.2862745, 1,
-0.2659018, 1.321288, -0.9977525, 0, 1, 0.2901961, 1,
-0.2655862, 1.20743, -1.891056, 0, 1, 0.2980392, 1,
-0.2649457, -0.108838, -2.425124, 0, 1, 0.3058824, 1,
-0.2595388, -0.6279814, -2.881463, 0, 1, 0.3098039, 1,
-0.2531013, -1.484128, -2.561931, 0, 1, 0.3176471, 1,
-0.2525536, 2.89296, -0.1776389, 0, 1, 0.3215686, 1,
-0.2523874, 0.5624238, -1.33193, 0, 1, 0.3294118, 1,
-0.2475161, 0.5921711, -1.501233, 0, 1, 0.3333333, 1,
-0.24623, 0.1695381, 0.1698437, 0, 1, 0.3411765, 1,
-0.2450422, 0.6875465, -0.412171, 0, 1, 0.345098, 1,
-0.2445711, 0.3276891, 0.4180858, 0, 1, 0.3529412, 1,
-0.2444957, -0.7431742, -2.97465, 0, 1, 0.3568628, 1,
-0.2396115, 1.566783, 0.3556477, 0, 1, 0.3647059, 1,
-0.2364776, 0.3099751, -1.155898, 0, 1, 0.3686275, 1,
-0.2335781, -0.3546605, -1.844646, 0, 1, 0.3764706, 1,
-0.2315576, -2.995821, -2.283061, 0, 1, 0.3803922, 1,
-0.2299372, -0.9993164, -2.334997, 0, 1, 0.3882353, 1,
-0.228021, -1.836043, -2.833866, 0, 1, 0.3921569, 1,
-0.2273354, 0.3205787, -0.4932163, 0, 1, 0.4, 1,
-0.2246405, 1.575229, 0.3493301, 0, 1, 0.4078431, 1,
-0.2245072, -1.673594, -2.816507, 0, 1, 0.4117647, 1,
-0.2214191, -0.9895355, -0.6542505, 0, 1, 0.4196078, 1,
-0.2153958, 0.5013983, 0.1449719, 0, 1, 0.4235294, 1,
-0.2150668, -0.1122069, -0.8214545, 0, 1, 0.4313726, 1,
-0.2131155, 0.1183564, -1.679582, 0, 1, 0.4352941, 1,
-0.2085964, 1.12438, -2.842057, 0, 1, 0.4431373, 1,
-0.2083754, 0.8097438, 0.03938301, 0, 1, 0.4470588, 1,
-0.2079876, 0.1789105, -0.8537998, 0, 1, 0.454902, 1,
-0.2047628, 0.3475135, -0.5481543, 0, 1, 0.4588235, 1,
-0.203981, -0.9806638, -2.551586, 0, 1, 0.4666667, 1,
-0.2004794, 0.1501353, -1.975953, 0, 1, 0.4705882, 1,
-0.1999998, 1.268653, -0.6185502, 0, 1, 0.4784314, 1,
-0.195476, 1.370042, -0.3717982, 0, 1, 0.4823529, 1,
-0.1869969, -0.1812597, -1.969089, 0, 1, 0.4901961, 1,
-0.1865136, 0.5284981, 0.3492805, 0, 1, 0.4941176, 1,
-0.1842534, -0.4807046, -3.773322, 0, 1, 0.5019608, 1,
-0.182551, -0.1552191, -3.150022, 0, 1, 0.509804, 1,
-0.1758048, 0.7877998, -0.6741167, 0, 1, 0.5137255, 1,
-0.1718511, -0.7042885, -3.281246, 0, 1, 0.5215687, 1,
-0.1709056, 1.15759, 1.064171, 0, 1, 0.5254902, 1,
-0.1692049, 0.962334, -1.322358, 0, 1, 0.5333334, 1,
-0.1653356, -0.3824965, -3.0199, 0, 1, 0.5372549, 1,
-0.1650841, -0.06755798, -1.433586, 0, 1, 0.5450981, 1,
-0.163589, -0.979317, -1.79065, 0, 1, 0.5490196, 1,
-0.1633126, -1.330928, -1.973649, 0, 1, 0.5568628, 1,
-0.1607741, -0.6439026, -3.720951, 0, 1, 0.5607843, 1,
-0.1576065, 0.6252255, 0.5248433, 0, 1, 0.5686275, 1,
-0.1572932, 1.113396, -2.350045, 0, 1, 0.572549, 1,
-0.1505129, -0.6288806, -2.280212, 0, 1, 0.5803922, 1,
-0.1503884, 0.04072582, -2.425219, 0, 1, 0.5843138, 1,
-0.1473642, -0.3986742, -3.768513, 0, 1, 0.5921569, 1,
-0.1462936, -0.8686323, -3.176011, 0, 1, 0.5960785, 1,
-0.1398906, -0.9115762, -3.604044, 0, 1, 0.6039216, 1,
-0.1396907, 0.6469877, 1.549312, 0, 1, 0.6117647, 1,
-0.1378526, -1.500896, -2.905001, 0, 1, 0.6156863, 1,
-0.1334391, 0.02815549, -1.148672, 0, 1, 0.6235294, 1,
-0.1329337, 0.1083338, -3.529987, 0, 1, 0.627451, 1,
-0.1316132, 0.301405, -0.4346217, 0, 1, 0.6352941, 1,
-0.1299957, -0.3777602, -3.189853, 0, 1, 0.6392157, 1,
-0.1287795, 0.3438475, -0.4609124, 0, 1, 0.6470588, 1,
-0.1283995, 0.4402257, 0.5370682, 0, 1, 0.6509804, 1,
-0.1272591, -1.036767, -1.757363, 0, 1, 0.6588235, 1,
-0.1252916, 0.08805771, -2.215299, 0, 1, 0.6627451, 1,
-0.1223521, 0.3494759, -1.096256, 0, 1, 0.6705883, 1,
-0.1216997, 0.6587882, 0.7851692, 0, 1, 0.6745098, 1,
-0.1194161, -0.2116637, -3.788902, 0, 1, 0.682353, 1,
-0.1151002, -0.344148, -2.098846, 0, 1, 0.6862745, 1,
-0.114546, 0.8339962, 0.4924991, 0, 1, 0.6941177, 1,
-0.113346, -1.102275, -2.706972, 0, 1, 0.7019608, 1,
-0.1131541, 0.7936147, -1.261762, 0, 1, 0.7058824, 1,
-0.1111843, -1.230215, -2.349465, 0, 1, 0.7137255, 1,
-0.1075462, -0.6167971, -3.782843, 0, 1, 0.7176471, 1,
-0.1058636, -0.4397478, -3.086601, 0, 1, 0.7254902, 1,
-0.104991, -0.8767783, -2.241271, 0, 1, 0.7294118, 1,
-0.104543, 0.2124941, 0.04535935, 0, 1, 0.7372549, 1,
-0.1024307, -0.2293071, -1.62069, 0, 1, 0.7411765, 1,
-0.1023023, 1.167268, 0.08163908, 0, 1, 0.7490196, 1,
-0.100747, -0.6458301, -2.766901, 0, 1, 0.7529412, 1,
-0.1006701, -0.09164497, -0.9029042, 0, 1, 0.7607843, 1,
-0.09709209, -0.7817264, -1.517422, 0, 1, 0.7647059, 1,
-0.09693148, 1.467886, 0.4502162, 0, 1, 0.772549, 1,
-0.09563156, 0.9200802, 1.391834, 0, 1, 0.7764706, 1,
-0.09550022, 1.683837, 0.807861, 0, 1, 0.7843137, 1,
-0.08956336, 0.6272202, 0.1318932, 0, 1, 0.7882353, 1,
-0.07697937, -0.3452134, -4.805482, 0, 1, 0.7960784, 1,
-0.07453313, 1.471085, -0.6455663, 0, 1, 0.8039216, 1,
-0.07329723, 1.375703, -0.834936, 0, 1, 0.8078431, 1,
-0.06535727, 0.529443, -1.315793, 0, 1, 0.8156863, 1,
-0.0559578, 1.85817, -0.3681484, 0, 1, 0.8196079, 1,
-0.05392473, 0.2783282, -0.5805368, 0, 1, 0.827451, 1,
-0.05308856, -0.06581741, -2.845033, 0, 1, 0.8313726, 1,
-0.05150507, 2.333931, 1.993636, 0, 1, 0.8392157, 1,
-0.0457337, -1.135122, -2.324834, 0, 1, 0.8431373, 1,
-0.04499027, 1.483672, 1.927071, 0, 1, 0.8509804, 1,
-0.03736439, -0.2686924, -3.725543, 0, 1, 0.854902, 1,
-0.03680895, -0.2852107, -2.456339, 0, 1, 0.8627451, 1,
-0.03428975, -0.1132748, -2.820906, 0, 1, 0.8666667, 1,
-0.03227571, -1.308726, -3.064277, 0, 1, 0.8745098, 1,
-0.03161545, 0.3030023, 0.8214189, 0, 1, 0.8784314, 1,
-0.03088244, 0.291237, -0.3186656, 0, 1, 0.8862745, 1,
-0.02978733, -1.084718, -1.802837, 0, 1, 0.8901961, 1,
-0.02846218, -1.057868, -3.914053, 0, 1, 0.8980392, 1,
-0.02461048, 1.037794, 0.009081613, 0, 1, 0.9058824, 1,
-0.02430924, -1.781241, -3.697369, 0, 1, 0.9098039, 1,
-0.02276466, -0.01501871, -2.543492, 0, 1, 0.9176471, 1,
-0.01881064, -0.5749773, -2.550138, 0, 1, 0.9215686, 1,
-0.0134135, 0.4742395, -1.018749, 0, 1, 0.9294118, 1,
-0.01229597, -0.5984337, -2.00688, 0, 1, 0.9333333, 1,
-0.008069802, 0.3421706, -1.726289, 0, 1, 0.9411765, 1,
-0.008046304, 0.1244147, -0.9807513, 0, 1, 0.945098, 1,
-0.007896442, 1.751183, 0.6501086, 0, 1, 0.9529412, 1,
-0.006262876, -0.5624158, -3.645906, 0, 1, 0.9568627, 1,
-0.006135599, -0.1682174, -4.077893, 0, 1, 0.9647059, 1,
-0.005919868, 0.3484641, 1.38748, 0, 1, 0.9686275, 1,
-0.004258209, 0.3644364, 0.6985277, 0, 1, 0.9764706, 1,
-0.001078966, 0.1694005, -1.551956, 0, 1, 0.9803922, 1,
-0.0002007492, -1.575122, -2.697208, 0, 1, 0.9882353, 1,
0.001670264, -1.701174, 2.583592, 0, 1, 0.9921569, 1,
0.002735087, 1.250937, 0.8219575, 0, 1, 1, 1,
0.003700029, 0.4719132, 0.4915729, 0, 0.9921569, 1, 1,
0.007303592, 0.6051837, -0.8974284, 0, 0.9882353, 1, 1,
0.01104548, -0.3290976, 3.03825, 0, 0.9803922, 1, 1,
0.01146342, -0.3680833, 3.011713, 0, 0.9764706, 1, 1,
0.01243426, -1.614566, 3.2062, 0, 0.9686275, 1, 1,
0.01857791, 0.8965957, 2.139994, 0, 0.9647059, 1, 1,
0.0189919, 1.917386, 1.764556, 0, 0.9568627, 1, 1,
0.02027256, 0.536423, -1.368945, 0, 0.9529412, 1, 1,
0.02572348, -0.8776811, 2.340167, 0, 0.945098, 1, 1,
0.02771886, -2.02031, 3.175484, 0, 0.9411765, 1, 1,
0.03271792, 1.488894, -0.8626363, 0, 0.9333333, 1, 1,
0.03446633, 0.5496307, -0.6370245, 0, 0.9294118, 1, 1,
0.03930782, 0.2986759, 1.173616, 0, 0.9215686, 1, 1,
0.04566382, -2.245186, 3.992227, 0, 0.9176471, 1, 1,
0.04749688, -0.07543037, 1.899388, 0, 0.9098039, 1, 1,
0.0475299, 1.961072, -1.230241, 0, 0.9058824, 1, 1,
0.05466185, -0.6794398, 2.344893, 0, 0.8980392, 1, 1,
0.05885811, 0.6695877, -1.567251, 0, 0.8901961, 1, 1,
0.05950239, -0.5040085, 3.920946, 0, 0.8862745, 1, 1,
0.05958952, -0.222772, 4.010454, 0, 0.8784314, 1, 1,
0.06554048, -1.268779, 3.646916, 0, 0.8745098, 1, 1,
0.0681921, -0.3141953, 3.155202, 0, 0.8666667, 1, 1,
0.07807591, 2.142535, 1.473694, 0, 0.8627451, 1, 1,
0.07815936, -0.02708326, 2.982762, 0, 0.854902, 1, 1,
0.08073595, 0.9233477, 0.9769258, 0, 0.8509804, 1, 1,
0.08127778, 0.01777657, 1.076283, 0, 0.8431373, 1, 1,
0.08706196, 0.862995, -0.7421492, 0, 0.8392157, 1, 1,
0.09062621, 0.7060016, -0.6671101, 0, 0.8313726, 1, 1,
0.09077208, -0.07845788, 3.036884, 0, 0.827451, 1, 1,
0.09147409, -1.406215, 3.104717, 0, 0.8196079, 1, 1,
0.09173694, -1.007462, 3.539166, 0, 0.8156863, 1, 1,
0.09687488, -1.362103, 2.637525, 0, 0.8078431, 1, 1,
0.1030281, -1.115613, 2.656639, 0, 0.8039216, 1, 1,
0.1035313, -0.2126171, 3.12614, 0, 0.7960784, 1, 1,
0.1046462, -0.4822075, 3.204479, 0, 0.7882353, 1, 1,
0.1075497, 1.445508, -0.8063117, 0, 0.7843137, 1, 1,
0.1094275, 1.381035, 1.023981, 0, 0.7764706, 1, 1,
0.110698, 0.6418499, 0.02549378, 0, 0.772549, 1, 1,
0.1144221, -2.1682, 3.117142, 0, 0.7647059, 1, 1,
0.1145752, 0.7918401, 0.1968887, 0, 0.7607843, 1, 1,
0.1155165, 0.4226754, -0.1556784, 0, 0.7529412, 1, 1,
0.116534, -1.143157, 1.290997, 0, 0.7490196, 1, 1,
0.1210772, -0.002462732, 2.414186, 0, 0.7411765, 1, 1,
0.1227444, 0.6691729, -0.4910527, 0, 0.7372549, 1, 1,
0.1268785, -1.158479, 4.431666, 0, 0.7294118, 1, 1,
0.1278046, -1.732693, 3.078131, 0, 0.7254902, 1, 1,
0.1284389, -2.078384, 3.480516, 0, 0.7176471, 1, 1,
0.1288583, -0.2776669, 3.504425, 0, 0.7137255, 1, 1,
0.1328729, -0.3501133, 3.146886, 0, 0.7058824, 1, 1,
0.1337183, 0.2253362, -0.04744383, 0, 0.6980392, 1, 1,
0.1358094, -1.066575, 2.934064, 0, 0.6941177, 1, 1,
0.1359158, 0.5425976, -1.722802, 0, 0.6862745, 1, 1,
0.1380605, 2.627403, 1.152639, 0, 0.682353, 1, 1,
0.1390062, -1.816217, 3.073826, 0, 0.6745098, 1, 1,
0.1449679, -0.1584906, 0.3018604, 0, 0.6705883, 1, 1,
0.1469102, 1.735336, -0.1370659, 0, 0.6627451, 1, 1,
0.1471225, 0.3394729, -0.4594742, 0, 0.6588235, 1, 1,
0.1472825, -0.1568461, 3.005566, 0, 0.6509804, 1, 1,
0.1528361, 0.6563212, 0.8020946, 0, 0.6470588, 1, 1,
0.1664077, -0.2749385, 4.102411, 0, 0.6392157, 1, 1,
0.1677138, 0.3312606, -1.644597, 0, 0.6352941, 1, 1,
0.1688668, 2.042159, -0.03594356, 0, 0.627451, 1, 1,
0.1698289, -0.3715442, 4.371547, 0, 0.6235294, 1, 1,
0.1737858, 0.4634566, 2.31643, 0, 0.6156863, 1, 1,
0.1753584, -0.1525731, 3.605371, 0, 0.6117647, 1, 1,
0.1790763, 1.81075, -0.05897506, 0, 0.6039216, 1, 1,
0.1874522, -0.3723762, 2.44393, 0, 0.5960785, 1, 1,
0.1924032, -2.662088, 3.849817, 0, 0.5921569, 1, 1,
0.1938328, 1.482647, 1.054626, 0, 0.5843138, 1, 1,
0.194012, 0.3385813, -0.8845613, 0, 0.5803922, 1, 1,
0.2000993, -0.2097228, 2.15274, 0, 0.572549, 1, 1,
0.2043489, 0.7550887, 0.7482412, 0, 0.5686275, 1, 1,
0.2081531, 0.5748346, 0.3339064, 0, 0.5607843, 1, 1,
0.2098376, 0.01040278, 2.185845, 0, 0.5568628, 1, 1,
0.2112151, -0.06615388, -0.8640295, 0, 0.5490196, 1, 1,
0.2119761, 0.3224154, 0.8340858, 0, 0.5450981, 1, 1,
0.2134618, -1.226895, 3.179408, 0, 0.5372549, 1, 1,
0.2207174, 0.6931784, 0.3194655, 0, 0.5333334, 1, 1,
0.22081, -0.01988997, 0.933955, 0, 0.5254902, 1, 1,
0.2208156, 1.726861, 0.7607459, 0, 0.5215687, 1, 1,
0.2212442, -0.4036205, 2.26728, 0, 0.5137255, 1, 1,
0.223548, 0.1937538, 2.896438, 0, 0.509804, 1, 1,
0.2275978, -0.4505212, 1.546254, 0, 0.5019608, 1, 1,
0.228332, -1.033282, 3.320414, 0, 0.4941176, 1, 1,
0.2306494, -0.08766104, 0.8045352, 0, 0.4901961, 1, 1,
0.2329592, 0.6115938, 0.2313657, 0, 0.4823529, 1, 1,
0.2342057, 1.095753, 0.1342597, 0, 0.4784314, 1, 1,
0.2357445, -1.46393, 2.717248, 0, 0.4705882, 1, 1,
0.2373986, 0.934604, -0.5315058, 0, 0.4666667, 1, 1,
0.238722, -0.8570356, 1.827926, 0, 0.4588235, 1, 1,
0.2396848, -0.7392336, 3.176373, 0, 0.454902, 1, 1,
0.2462084, 1.922315, 0.1808235, 0, 0.4470588, 1, 1,
0.2502829, -0.64284, 4.05059, 0, 0.4431373, 1, 1,
0.2503463, -0.2886866, 0.5135779, 0, 0.4352941, 1, 1,
0.2660291, 0.8535507, 0.9223847, 0, 0.4313726, 1, 1,
0.2694439, -1.255685, 4.461988, 0, 0.4235294, 1, 1,
0.2708773, -0.6923461, 1.013293, 0, 0.4196078, 1, 1,
0.2761914, -0.8462393, 3.700743, 0, 0.4117647, 1, 1,
0.2784368, 1.827074, 1.812373, 0, 0.4078431, 1, 1,
0.2808985, 0.9483426, 0.8711619, 0, 0.4, 1, 1,
0.2815453, 0.5963478, 1.494893, 0, 0.3921569, 1, 1,
0.2905217, 0.2192741, 0.926352, 0, 0.3882353, 1, 1,
0.293816, 0.757856, 1.71001, 0, 0.3803922, 1, 1,
0.2942853, 0.6505257, 0.1623925, 0, 0.3764706, 1, 1,
0.2957526, -0.9051421, 2.790096, 0, 0.3686275, 1, 1,
0.2989541, -0.729923, 2.764453, 0, 0.3647059, 1, 1,
0.3006177, 1.052815, -2.084159, 0, 0.3568628, 1, 1,
0.3023494, -1.104841, 2.906174, 0, 0.3529412, 1, 1,
0.3028694, 0.3306632, 1.337355, 0, 0.345098, 1, 1,
0.3045566, -0.8994793, 4.333815, 0, 0.3411765, 1, 1,
0.3046232, -0.199458, 3.103436, 0, 0.3333333, 1, 1,
0.3098433, 0.5279082, 1.689815, 0, 0.3294118, 1, 1,
0.3099527, 0.08684766, 0.9671011, 0, 0.3215686, 1, 1,
0.3127692, -0.7903232, 4.40313, 0, 0.3176471, 1, 1,
0.3140564, 1.104531, -0.2179402, 0, 0.3098039, 1, 1,
0.3144612, -0.2757515, 1.6649, 0, 0.3058824, 1, 1,
0.3154373, 0.4422479, -1.133462, 0, 0.2980392, 1, 1,
0.3189252, -2.054302, 1.757929, 0, 0.2901961, 1, 1,
0.3243901, 0.1359429, 0.6707076, 0, 0.2862745, 1, 1,
0.3259433, 0.6336646, 1.941354, 0, 0.2784314, 1, 1,
0.3311421, 1.147562, 0.4892392, 0, 0.2745098, 1, 1,
0.3330744, -0.5035291, 2.184999, 0, 0.2666667, 1, 1,
0.3349031, 0.2498598, 0.5133529, 0, 0.2627451, 1, 1,
0.3391588, 0.3754793, 0.8551304, 0, 0.254902, 1, 1,
0.3393087, -1.092431, 4.794418, 0, 0.2509804, 1, 1,
0.343693, -0.7685854, 3.97797, 0, 0.2431373, 1, 1,
0.3448533, -0.7067183, 2.32699, 0, 0.2392157, 1, 1,
0.3498966, 0.3149664, 1.157173, 0, 0.2313726, 1, 1,
0.3530964, 0.9192568, -0.2118813, 0, 0.227451, 1, 1,
0.3532927, 1.215997, -1.082371, 0, 0.2196078, 1, 1,
0.3534942, -0.00421508, 1.120301, 0, 0.2156863, 1, 1,
0.3605982, 1.614323, -0.6446312, 0, 0.2078431, 1, 1,
0.3639591, 2.516348, 0.9741174, 0, 0.2039216, 1, 1,
0.3647884, 0.3556841, -0.491305, 0, 0.1960784, 1, 1,
0.365004, 1.180949, 0.01410703, 0, 0.1882353, 1, 1,
0.3653738, 1.107493, -0.7778877, 0, 0.1843137, 1, 1,
0.3660228, 0.791689, 0.8279715, 0, 0.1764706, 1, 1,
0.3665361, 1.285672, 0.1971566, 0, 0.172549, 1, 1,
0.367894, 0.4396595, 0.04794954, 0, 0.1647059, 1, 1,
0.3683896, -0.9308217, 4.398721, 0, 0.1607843, 1, 1,
0.3710342, 0.01607371, 1.553858, 0, 0.1529412, 1, 1,
0.3718564, 0.4471767, 1.108752, 0, 0.1490196, 1, 1,
0.3724845, 2.342572, 0.7263089, 0, 0.1411765, 1, 1,
0.3742735, 1.0345, -0.8608173, 0, 0.1372549, 1, 1,
0.3762531, -1.187309, 3.1373, 0, 0.1294118, 1, 1,
0.3762831, -0.1471815, 1.077742, 0, 0.1254902, 1, 1,
0.3774632, -0.5730695, 2.090553, 0, 0.1176471, 1, 1,
0.3787919, 2.425244, 1.130055, 0, 0.1137255, 1, 1,
0.3803322, 0.5190526, 1.015152, 0, 0.1058824, 1, 1,
0.3813982, -2.343494, 3.040892, 0, 0.09803922, 1, 1,
0.3844341, -0.6415309, 2.935345, 0, 0.09411765, 1, 1,
0.3848844, -0.4618638, 2.585367, 0, 0.08627451, 1, 1,
0.392076, 1.242763, 1.721522, 0, 0.08235294, 1, 1,
0.3924026, -0.4802363, 1.58569, 0, 0.07450981, 1, 1,
0.3926144, 1.256431, -0.583022, 0, 0.07058824, 1, 1,
0.3938968, 0.4357692, -0.4180565, 0, 0.0627451, 1, 1,
0.394684, 0.3548797, 1.006999, 0, 0.05882353, 1, 1,
0.3950539, -0.4670881, 3.27626, 0, 0.05098039, 1, 1,
0.3960099, -1.088168, 1.900073, 0, 0.04705882, 1, 1,
0.3963597, -1.531633, 3.108175, 0, 0.03921569, 1, 1,
0.3993309, 0.8109506, 1.284941, 0, 0.03529412, 1, 1,
0.3994928, 0.04737211, 1.220301, 0, 0.02745098, 1, 1,
0.4003795, 0.1589354, 2.681644, 0, 0.02352941, 1, 1,
0.4014571, -0.124351, 1.950216, 0, 0.01568628, 1, 1,
0.4048154, -0.7880222, 4.426974, 0, 0.01176471, 1, 1,
0.4049987, -1.231578, 2.724488, 0, 0.003921569, 1, 1,
0.4072406, 2.450486, -0.1900095, 0.003921569, 0, 1, 1,
0.4079962, -1.444681, 2.642363, 0.007843138, 0, 1, 1,
0.4084479, -0.8106306, 3.469795, 0.01568628, 0, 1, 1,
0.4085228, -1.10883, 3.172701, 0.01960784, 0, 1, 1,
0.4086451, -0.677264, 2.949987, 0.02745098, 0, 1, 1,
0.4099169, -0.5806072, 1.278079, 0.03137255, 0, 1, 1,
0.4099967, 0.8099099, 1.172489, 0.03921569, 0, 1, 1,
0.4147604, 0.02672742, 1.156352, 0.04313726, 0, 1, 1,
0.4176645, -0.2811588, 0.4239491, 0.05098039, 0, 1, 1,
0.4196567, 1.516248, -0.2341402, 0.05490196, 0, 1, 1,
0.4215294, -0.9610787, 1.827706, 0.0627451, 0, 1, 1,
0.421981, -1.100778, 2.128558, 0.06666667, 0, 1, 1,
0.4234991, 1.907543, -0.1399048, 0.07450981, 0, 1, 1,
0.4268073, -0.4705127, 2.829671, 0.07843138, 0, 1, 1,
0.4273764, -0.4896155, 2.580613, 0.08627451, 0, 1, 1,
0.4315038, 0.1729567, 1.201982, 0.09019608, 0, 1, 1,
0.433095, 1.230891, 0.9510723, 0.09803922, 0, 1, 1,
0.4397073, -0.02360317, 1.02727, 0.1058824, 0, 1, 1,
0.4417455, -0.06209059, 1.636857, 0.1098039, 0, 1, 1,
0.4442882, -0.5543516, 1.847969, 0.1176471, 0, 1, 1,
0.4504879, -0.6008239, 1.758688, 0.1215686, 0, 1, 1,
0.450496, -0.3082164, 2.117294, 0.1294118, 0, 1, 1,
0.4524374, 0.1935422, 1.123059, 0.1333333, 0, 1, 1,
0.4529307, -0.360023, 1.900148, 0.1411765, 0, 1, 1,
0.4536003, 0.8260507, 1.405914, 0.145098, 0, 1, 1,
0.4622393, 0.6201352, -1.021077, 0.1529412, 0, 1, 1,
0.4631786, -0.006318234, 0.190183, 0.1568628, 0, 1, 1,
0.4749536, 0.03510067, 2.085697, 0.1647059, 0, 1, 1,
0.4794016, 0.5889113, -0.3070862, 0.1686275, 0, 1, 1,
0.4806205, 0.05428684, 2.195871, 0.1764706, 0, 1, 1,
0.4863185, -0.1104434, 1.272626, 0.1803922, 0, 1, 1,
0.4889553, 0.6213794, 1.202013, 0.1882353, 0, 1, 1,
0.4890488, 0.3236655, 3.438124, 0.1921569, 0, 1, 1,
0.4935956, 0.3073523, -0.925227, 0.2, 0, 1, 1,
0.4940171, 0.5603092, -0.2482292, 0.2078431, 0, 1, 1,
0.4975922, -0.5661163, 2.676757, 0.2117647, 0, 1, 1,
0.5015352, 0.5515729, 0.6307477, 0.2196078, 0, 1, 1,
0.504952, 1.592879, -0.329373, 0.2235294, 0, 1, 1,
0.5081893, 1.530509, -0.6127661, 0.2313726, 0, 1, 1,
0.5084616, 0.3904058, 2.194658, 0.2352941, 0, 1, 1,
0.5115055, -0.2299113, 1.02008, 0.2431373, 0, 1, 1,
0.512799, -0.6880001, 3.388158, 0.2470588, 0, 1, 1,
0.5196565, -0.4483603, 2.352481, 0.254902, 0, 1, 1,
0.5241688, -1.051678, 1.806298, 0.2588235, 0, 1, 1,
0.52422, -0.2666618, -0.756056, 0.2666667, 0, 1, 1,
0.52983, -0.9120825, 2.448143, 0.2705882, 0, 1, 1,
0.5343996, -0.4012183, 2.294244, 0.2784314, 0, 1, 1,
0.5360757, 0.3173103, 2.863803, 0.282353, 0, 1, 1,
0.5372915, -0.4414649, 3.927817, 0.2901961, 0, 1, 1,
0.5425276, 0.7778124, -0.03411761, 0.2941177, 0, 1, 1,
0.5446026, -0.889371, 1.219509, 0.3019608, 0, 1, 1,
0.5481149, 2.126413, 1.531181, 0.3098039, 0, 1, 1,
0.5509812, -1.477282, 3.152582, 0.3137255, 0, 1, 1,
0.5535342, 0.04260449, 1.299928, 0.3215686, 0, 1, 1,
0.5541788, -0.2773495, 1.693546, 0.3254902, 0, 1, 1,
0.5543617, 0.5806915, 1.867475, 0.3333333, 0, 1, 1,
0.5668889, 0.2397597, 0.7931471, 0.3372549, 0, 1, 1,
0.571736, -0.2100538, 1.269246, 0.345098, 0, 1, 1,
0.5803121, -1.810519, 3.741296, 0.3490196, 0, 1, 1,
0.5867999, -0.6483449, 3.093225, 0.3568628, 0, 1, 1,
0.597674, 1.031844, 0.5921898, 0.3607843, 0, 1, 1,
0.6105819, 1.122342, -0.7865704, 0.3686275, 0, 1, 1,
0.6126515, -1.128399, 1.696793, 0.372549, 0, 1, 1,
0.6139295, -0.9661203, 3.95775, 0.3803922, 0, 1, 1,
0.6158118, 0.7802052, 0.4935508, 0.3843137, 0, 1, 1,
0.6179135, -0.4570378, 1.995461, 0.3921569, 0, 1, 1,
0.6192989, 0.226597, 1.34614, 0.3960784, 0, 1, 1,
0.6193367, 1.509172, -0.1351032, 0.4039216, 0, 1, 1,
0.6202775, -1.835125, 3.802275, 0.4117647, 0, 1, 1,
0.6270663, 0.7336101, -1.068949, 0.4156863, 0, 1, 1,
0.6282277, -0.1714834, 3.255463, 0.4235294, 0, 1, 1,
0.6353711, -0.2380829, 1.165107, 0.427451, 0, 1, 1,
0.6357734, 0.5320319, 0.56564, 0.4352941, 0, 1, 1,
0.6411318, 0.9429988, 0.06115081, 0.4392157, 0, 1, 1,
0.6446331, -1.971765, 3.068024, 0.4470588, 0, 1, 1,
0.647206, 1.021615, 0.0479159, 0.4509804, 0, 1, 1,
0.6497328, 0.8842941, -0.02667575, 0.4588235, 0, 1, 1,
0.6566219, -1.413355, 2.253458, 0.4627451, 0, 1, 1,
0.6635625, 0.5392107, -0.4254291, 0.4705882, 0, 1, 1,
0.6663921, -0.2924002, 0.5797588, 0.4745098, 0, 1, 1,
0.6670713, 0.7571316, 0.03701023, 0.4823529, 0, 1, 1,
0.6671035, 0.8932379, 1.266225, 0.4862745, 0, 1, 1,
0.6677018, -0.4739885, 1.432267, 0.4941176, 0, 1, 1,
0.6696781, -0.1222667, 0.1251057, 0.5019608, 0, 1, 1,
0.6730061, -0.5246617, 2.479354, 0.5058824, 0, 1, 1,
0.6779069, 0.6168184, -0.4879296, 0.5137255, 0, 1, 1,
0.6792134, -2.21205, 3.365405, 0.5176471, 0, 1, 1,
0.6803271, -0.3912279, 2.586711, 0.5254902, 0, 1, 1,
0.6832386, 1.485477, 0.2404366, 0.5294118, 0, 1, 1,
0.6894041, 0.1526927, 0.8606741, 0.5372549, 0, 1, 1,
0.690479, 1.987993, 2.064587, 0.5411765, 0, 1, 1,
0.6931482, 0.7668487, 1.479051, 0.5490196, 0, 1, 1,
0.6963032, -2.445388, 0.2604726, 0.5529412, 0, 1, 1,
0.6974044, -0.9687875, 2.611579, 0.5607843, 0, 1, 1,
0.6995353, -2.414495, 0.7953286, 0.5647059, 0, 1, 1,
0.7009895, -0.9268122, 2.848028, 0.572549, 0, 1, 1,
0.7058851, 0.3504593, 0.8170726, 0.5764706, 0, 1, 1,
0.7067052, 0.382264, 2.05139, 0.5843138, 0, 1, 1,
0.714266, 1.572714, 0.07300179, 0.5882353, 0, 1, 1,
0.714384, 0.3141533, 1.497405, 0.5960785, 0, 1, 1,
0.7146788, 0.02213873, 1.74822, 0.6039216, 0, 1, 1,
0.7173678, 1.285733, 0.3226309, 0.6078432, 0, 1, 1,
0.7213355, -1.52648, 4.338834, 0.6156863, 0, 1, 1,
0.7319564, -0.7109957, 2.324651, 0.6196079, 0, 1, 1,
0.734697, -1.349103, 2.113041, 0.627451, 0, 1, 1,
0.735199, 1.096613, 1.366453, 0.6313726, 0, 1, 1,
0.7400392, -0.2528936, 1.636111, 0.6392157, 0, 1, 1,
0.7421563, -0.1048542, 2.051498, 0.6431373, 0, 1, 1,
0.7425148, -0.7174621, 2.450256, 0.6509804, 0, 1, 1,
0.7455279, 0.4807149, 0.5796295, 0.654902, 0, 1, 1,
0.7489133, 0.4969367, 0.8088361, 0.6627451, 0, 1, 1,
0.7506499, -0.995024, 3.400292, 0.6666667, 0, 1, 1,
0.7538126, -0.5160148, 3.063447, 0.6745098, 0, 1, 1,
0.7600843, -0.3791971, 3.597244, 0.6784314, 0, 1, 1,
0.7746207, 2.158956, -0.2254953, 0.6862745, 0, 1, 1,
0.7782012, -1.465923, 1.549818, 0.6901961, 0, 1, 1,
0.7858514, -0.9357233, 1.41047, 0.6980392, 0, 1, 1,
0.7943646, -0.3608181, 0.2461884, 0.7058824, 0, 1, 1,
0.7963511, 2.051354, 1.340949, 0.7098039, 0, 1, 1,
0.7974622, 0.1648916, 0.6478767, 0.7176471, 0, 1, 1,
0.7979701, 0.2496232, 0.9176887, 0.7215686, 0, 1, 1,
0.7987276, 0.06052319, 0.7583805, 0.7294118, 0, 1, 1,
0.8073131, -0.6171963, 2.158722, 0.7333333, 0, 1, 1,
0.8108674, -2.206428, 2.821738, 0.7411765, 0, 1, 1,
0.8209218, 0.2879942, 1.612619, 0.7450981, 0, 1, 1,
0.8213087, -1.477889, 3.539903, 0.7529412, 0, 1, 1,
0.8238614, -0.3349312, 2.037071, 0.7568628, 0, 1, 1,
0.8266222, -1.307409, 2.371184, 0.7647059, 0, 1, 1,
0.8280474, 0.07852242, -0.3233118, 0.7686275, 0, 1, 1,
0.8286504, -0.6366764, 1.411171, 0.7764706, 0, 1, 1,
0.8509883, -0.9400234, 2.498269, 0.7803922, 0, 1, 1,
0.8550594, 1.274159, 1.466681, 0.7882353, 0, 1, 1,
0.8569509, -0.417078, 2.669158, 0.7921569, 0, 1, 1,
0.858808, 0.1247298, 0.9725896, 0.8, 0, 1, 1,
0.8590218, 0.9443229, -0.3642101, 0.8078431, 0, 1, 1,
0.8689075, -0.2186667, 2.452574, 0.8117647, 0, 1, 1,
0.8822601, -0.9588957, 1.088328, 0.8196079, 0, 1, 1,
0.8828918, -0.05661016, 1.735816, 0.8235294, 0, 1, 1,
0.8881609, 0.7807598, 0.09646051, 0.8313726, 0, 1, 1,
0.8903506, -0.3912079, 2.055298, 0.8352941, 0, 1, 1,
0.8930808, 1.317916, -0.04869362, 0.8431373, 0, 1, 1,
0.894559, -1.270534, 2.83684, 0.8470588, 0, 1, 1,
0.896142, -1.617218, 4.716699, 0.854902, 0, 1, 1,
0.8988215, -0.8114092, 1.337258, 0.8588235, 0, 1, 1,
0.8996807, 1.900452, -0.5686003, 0.8666667, 0, 1, 1,
0.9024102, -0.4903145, 2.642315, 0.8705882, 0, 1, 1,
0.9117154, 0.960445, 0.6346025, 0.8784314, 0, 1, 1,
0.9147664, 1.101216, 1.56467, 0.8823529, 0, 1, 1,
0.9190109, 0.1460247, 0.6612012, 0.8901961, 0, 1, 1,
0.9213011, -0.792614, 2.735335, 0.8941177, 0, 1, 1,
0.9232171, -0.024823, 2.167167, 0.9019608, 0, 1, 1,
0.9250302, -0.6366061, 3.536752, 0.9098039, 0, 1, 1,
0.9311491, 0.3509472, 2.565844, 0.9137255, 0, 1, 1,
0.9402893, 0.07307852, 3.03038, 0.9215686, 0, 1, 1,
0.9443976, 0.3031806, 1.113666, 0.9254902, 0, 1, 1,
0.9489478, 1.154364, 2.146803, 0.9333333, 0, 1, 1,
0.9494308, 1.531867, 2.069824, 0.9372549, 0, 1, 1,
0.9543548, 1.043742, 1.148635, 0.945098, 0, 1, 1,
0.9590605, -0.5585806, 2.931998, 0.9490196, 0, 1, 1,
0.9591563, -0.04706044, 3.965213, 0.9568627, 0, 1, 1,
0.9608556, -1.855228, 2.943357, 0.9607843, 0, 1, 1,
0.9611326, 1.422541, 2.291484, 0.9686275, 0, 1, 1,
0.9622397, -0.7609024, 2.399624, 0.972549, 0, 1, 1,
0.9635669, -0.4583312, 0.5973956, 0.9803922, 0, 1, 1,
0.965544, -0.6046989, 2.26734, 0.9843137, 0, 1, 1,
0.9699673, 0.1330292, 1.984299, 0.9921569, 0, 1, 1,
0.9723251, -0.3568481, 3.027923, 0.9960784, 0, 1, 1,
0.9775827, 1.990719, 1.999496, 1, 0, 0.9960784, 1,
0.9797758, -1.346292, 2.216428, 1, 0, 0.9882353, 1,
0.9821305, 2.020893, -0.9495908, 1, 0, 0.9843137, 1,
0.9918728, -0.1214308, 1.150683, 1, 0, 0.9764706, 1,
0.9946116, 0.09336925, 1.661551, 1, 0, 0.972549, 1,
1.00616, 1.513468, 0.5196185, 1, 0, 0.9647059, 1,
1.007005, -0.3250436, 2.625352, 1, 0, 0.9607843, 1,
1.013764, 0.4979883, 0.9694421, 1, 0, 0.9529412, 1,
1.016455, -0.3893346, 2.560668, 1, 0, 0.9490196, 1,
1.018587, 1.084322, 0.6171304, 1, 0, 0.9411765, 1,
1.024017, -0.7426957, 2.609353, 1, 0, 0.9372549, 1,
1.031686, 1.193458, 0.3819146, 1, 0, 0.9294118, 1,
1.03751, -1.518594, 2.773947, 1, 0, 0.9254902, 1,
1.039159, -0.3051319, 1.161115, 1, 0, 0.9176471, 1,
1.052005, 0.5506601, -1.165377, 1, 0, 0.9137255, 1,
1.062218, 0.9884431, -0.405537, 1, 0, 0.9058824, 1,
1.064022, 0.29524, 0.2460754, 1, 0, 0.9019608, 1,
1.075966, 1.92906, 1.155436, 1, 0, 0.8941177, 1,
1.083716, -0.0471854, 1.656436, 1, 0, 0.8862745, 1,
1.087568, 0.01529004, 2.314472, 1, 0, 0.8823529, 1,
1.093671, 1.082225, 0.9461136, 1, 0, 0.8745098, 1,
1.095779, 0.8455979, 0.03156305, 1, 0, 0.8705882, 1,
1.097039, -0.8376952, 1.804207, 1, 0, 0.8627451, 1,
1.104509, 0.3095564, 0.6228892, 1, 0, 0.8588235, 1,
1.107226, 1.529105, 1.164782, 1, 0, 0.8509804, 1,
1.111753, 0.7623528, -1.541199, 1, 0, 0.8470588, 1,
1.121646, -0.9037121, 2.087569, 1, 0, 0.8392157, 1,
1.125479, -2.441246, 2.729094, 1, 0, 0.8352941, 1,
1.128492, 0.3592439, -0.1348998, 1, 0, 0.827451, 1,
1.130474, 0.6859939, 0.8631624, 1, 0, 0.8235294, 1,
1.133851, 0.6185539, 3.07276, 1, 0, 0.8156863, 1,
1.140573, -0.002929778, 1.066991, 1, 0, 0.8117647, 1,
1.141833, -0.3220484, 2.412547, 1, 0, 0.8039216, 1,
1.147359, -0.3167824, 1.661208, 1, 0, 0.7960784, 1,
1.149743, -1.182318, 1.836308, 1, 0, 0.7921569, 1,
1.156753, -0.121872, 2.883905, 1, 0, 0.7843137, 1,
1.158298, -0.4036116, 2.768089, 1, 0, 0.7803922, 1,
1.158958, -0.3349169, 4.369036, 1, 0, 0.772549, 1,
1.170923, 2.219127, 0.04259223, 1, 0, 0.7686275, 1,
1.174415, -0.4206463, 0.0967347, 1, 0, 0.7607843, 1,
1.187512, 1.099735, 0.5364591, 1, 0, 0.7568628, 1,
1.189842, 0.4503056, -0.329501, 1, 0, 0.7490196, 1,
1.191055, -0.7727017, 2.600803, 1, 0, 0.7450981, 1,
1.195281, 1.705257, 0.4879253, 1, 0, 0.7372549, 1,
1.211653, 0.517559, 0.0276885, 1, 0, 0.7333333, 1,
1.221046, -0.2538885, 2.832936, 1, 0, 0.7254902, 1,
1.224367, 0.410574, 1.792294, 1, 0, 0.7215686, 1,
1.230361, -0.04264401, 2.838259, 1, 0, 0.7137255, 1,
1.232332, 1.311741, 1.999247, 1, 0, 0.7098039, 1,
1.234053, 3.478551, 0.3448769, 1, 0, 0.7019608, 1,
1.238817, 0.04088472, 1.968807, 1, 0, 0.6941177, 1,
1.239854, 1.492618, 0.8687624, 1, 0, 0.6901961, 1,
1.250769, -0.6027357, 2.839824, 1, 0, 0.682353, 1,
1.253075, -0.7217813, 1.053068, 1, 0, 0.6784314, 1,
1.258751, -0.1668733, 3.008798, 1, 0, 0.6705883, 1,
1.260193, 0.3962672, 2.344895, 1, 0, 0.6666667, 1,
1.267671, 0.438292, 0.3574051, 1, 0, 0.6588235, 1,
1.268926, -0.6470702, 1.306589, 1, 0, 0.654902, 1,
1.269822, -0.1057531, 2.768187, 1, 0, 0.6470588, 1,
1.273923, 0.2522945, 1.090438, 1, 0, 0.6431373, 1,
1.280271, -0.4502876, 1.888887, 1, 0, 0.6352941, 1,
1.281635, -1.599257, 1.424934, 1, 0, 0.6313726, 1,
1.290887, -0.9702532, 2.812116, 1, 0, 0.6235294, 1,
1.30919, -0.2844994, 2.19881, 1, 0, 0.6196079, 1,
1.311854, 0.6698307, 2.385183, 1, 0, 0.6117647, 1,
1.318076, 0.9545839, 1.159801, 1, 0, 0.6078432, 1,
1.318689, 0.653579, 1.848135, 1, 0, 0.6, 1,
1.319374, -0.8339856, 4.067248, 1, 0, 0.5921569, 1,
1.319723, -0.01445672, 0.783347, 1, 0, 0.5882353, 1,
1.329458, -0.06568807, 3.015373, 1, 0, 0.5803922, 1,
1.336242, -0.3467517, 3.458499, 1, 0, 0.5764706, 1,
1.337885, 0.5426201, -0.5074896, 1, 0, 0.5686275, 1,
1.338816, -0.4328233, 0.8496165, 1, 0, 0.5647059, 1,
1.342671, -0.03576963, 1.057037, 1, 0, 0.5568628, 1,
1.348424, -0.5017534, 3.786237, 1, 0, 0.5529412, 1,
1.349488, 0.02679548, 2.247015, 1, 0, 0.5450981, 1,
1.363302, 1.662163, 2.04111, 1, 0, 0.5411765, 1,
1.363622, -1.423503, 2.528703, 1, 0, 0.5333334, 1,
1.365043, 0.2727344, -0.5137035, 1, 0, 0.5294118, 1,
1.380864, -0.225501, 1.631944, 1, 0, 0.5215687, 1,
1.383536, 0.9275207, 2.27708, 1, 0, 0.5176471, 1,
1.385879, 0.4560933, 1.503014, 1, 0, 0.509804, 1,
1.40702, -0.762194, 1.856486, 1, 0, 0.5058824, 1,
1.407501, -0.5762288, 1.944305, 1, 0, 0.4980392, 1,
1.40836, -1.285342, 1.518618, 1, 0, 0.4901961, 1,
1.413703, 0.7382281, 0.1612994, 1, 0, 0.4862745, 1,
1.419876, 0.4282021, 1.337913, 1, 0, 0.4784314, 1,
1.423635, -0.199567, 2.525721, 1, 0, 0.4745098, 1,
1.439903, 0.6563081, 1.924776, 1, 0, 0.4666667, 1,
1.444301, 1.230684, -0.5310876, 1, 0, 0.4627451, 1,
1.446966, -0.5593991, 3.868642, 1, 0, 0.454902, 1,
1.447765, -1.095386, 4.340598, 1, 0, 0.4509804, 1,
1.457964, -0.3416794, 3.764151, 1, 0, 0.4431373, 1,
1.471851, -1.59156, 3.186276, 1, 0, 0.4392157, 1,
1.48345, -0.3683533, 0.8465472, 1, 0, 0.4313726, 1,
1.491812, 0.7952265, 1.015995, 1, 0, 0.427451, 1,
1.493505, 0.373276, 2.109706, 1, 0, 0.4196078, 1,
1.523612, -0.3398564, 2.141416, 1, 0, 0.4156863, 1,
1.534585, -1.496589, 1.909443, 1, 0, 0.4078431, 1,
1.535274, -0.5536292, 1.78807, 1, 0, 0.4039216, 1,
1.538409, 0.199196, 1.781644, 1, 0, 0.3960784, 1,
1.540473, 0.7994279, -0.5977968, 1, 0, 0.3882353, 1,
1.541694, -1.066206, 2.167933, 1, 0, 0.3843137, 1,
1.56188, -0.7288162, 1.379075, 1, 0, 0.3764706, 1,
1.570874, -0.6532453, 1.233925, 1, 0, 0.372549, 1,
1.576938, 0.2113942, 1.725389, 1, 0, 0.3647059, 1,
1.581253, -1.788916, 1.97647, 1, 0, 0.3607843, 1,
1.593349, -0.802865, 1.058821, 1, 0, 0.3529412, 1,
1.601963, -1.976039, 1.904143, 1, 0, 0.3490196, 1,
1.608097, -0.02792201, 0.5212023, 1, 0, 0.3411765, 1,
1.60903, -0.6828651, 1.464374, 1, 0, 0.3372549, 1,
1.616568, -1.781565, 2.174094, 1, 0, 0.3294118, 1,
1.616727, -2.355742, 2.045988, 1, 0, 0.3254902, 1,
1.63898, -0.6912883, 0.3965981, 1, 0, 0.3176471, 1,
1.644118, -0.01875255, 2.502161, 1, 0, 0.3137255, 1,
1.646349, -1.019343, 0.3203032, 1, 0, 0.3058824, 1,
1.657535, -0.3599721, 4.652594, 1, 0, 0.2980392, 1,
1.657686, 1.260921, -0.4135932, 1, 0, 0.2941177, 1,
1.684728, 0.05755068, 2.932855, 1, 0, 0.2862745, 1,
1.690305, -2.679347, 4.01646, 1, 0, 0.282353, 1,
1.707752, 2.082496, -0.683524, 1, 0, 0.2745098, 1,
1.726212, -0.5503945, 3.411569, 1, 0, 0.2705882, 1,
1.733921, -1.220331, 1.69893, 1, 0, 0.2627451, 1,
1.741354, 0.7944446, 2.31344, 1, 0, 0.2588235, 1,
1.741444, -1.465232, 3.506117, 1, 0, 0.2509804, 1,
1.742274, -0.2696135, -0.0995281, 1, 0, 0.2470588, 1,
1.774299, -1.508054, 2.243261, 1, 0, 0.2392157, 1,
1.790074, -0.6422444, -0.6417776, 1, 0, 0.2352941, 1,
1.793409, 1.373376, -0.5926069, 1, 0, 0.227451, 1,
1.797952, -0.4591113, 1.712858, 1, 0, 0.2235294, 1,
1.809723, -0.6788543, 1.172073, 1, 0, 0.2156863, 1,
1.828739, 0.1730668, 2.173739, 1, 0, 0.2117647, 1,
1.868569, -0.07941169, -0.0290171, 1, 0, 0.2039216, 1,
1.874149, 0.6988537, 0.9516355, 1, 0, 0.1960784, 1,
1.8773, -0.6989399, 4.496801, 1, 0, 0.1921569, 1,
1.894894, 0.1465109, 2.213082, 1, 0, 0.1843137, 1,
1.903421, -0.7358185, 0.9829796, 1, 0, 0.1803922, 1,
1.907893, -2.06307, 1.368051, 1, 0, 0.172549, 1,
1.920718, -1.599402, 2.108679, 1, 0, 0.1686275, 1,
1.92856, 0.4885213, -0.1912681, 1, 0, 0.1607843, 1,
1.931924, 0.7245189, 1.776087, 1, 0, 0.1568628, 1,
1.945119, 0.04573461, 0.1544501, 1, 0, 0.1490196, 1,
1.951596, -0.2334129, 1.737383, 1, 0, 0.145098, 1,
1.972082, -0.08958037, 2.648789, 1, 0, 0.1372549, 1,
1.97289, 0.568698, -0.07694229, 1, 0, 0.1333333, 1,
1.973931, -0.8036578, 2.155721, 1, 0, 0.1254902, 1,
1.978591, -0.6596513, 0.03109315, 1, 0, 0.1215686, 1,
1.97962, 0.1340791, 2.72428, 1, 0, 0.1137255, 1,
1.996141, -0.8079613, 0.2617597, 1, 0, 0.1098039, 1,
2.027331, 0.02511236, 2.346257, 1, 0, 0.1019608, 1,
2.029368, -0.2992037, 3.139192, 1, 0, 0.09411765, 1,
2.048464, -0.7639755, 2.003489, 1, 0, 0.09019608, 1,
2.067183, 2.121572, 0.6877055, 1, 0, 0.08235294, 1,
2.076795, 0.7144919, 1.201668, 1, 0, 0.07843138, 1,
2.089968, -1.04557, 1.826226, 1, 0, 0.07058824, 1,
2.130382, -0.3960654, 1.449681, 1, 0, 0.06666667, 1,
2.181921, -0.187824, 2.284881, 1, 0, 0.05882353, 1,
2.262306, -0.4839918, 3.100853, 1, 0, 0.05490196, 1,
2.387521, -1.000262, 3.006072, 1, 0, 0.04705882, 1,
2.412218, -1.203522, 1.246957, 1, 0, 0.04313726, 1,
2.441264, 0.06359427, 2.084813, 1, 0, 0.03529412, 1,
2.516308, 0.2611116, 0.2782082, 1, 0, 0.03137255, 1,
2.607513, -1.287857, 3.133145, 1, 0, 0.02352941, 1,
2.788541, 2.142632, 0.3531554, 1, 0, 0.01960784, 1,
2.968406, -1.139786, 0.3536115, 1, 0, 0.01176471, 1,
3.173938, -0.4701329, 2.100973, 1, 0, 0.007843138, 1
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
-0.2657796, -4.137407, -7.079044, 0, -0.5, 0.5, 0.5,
-0.2657796, -4.137407, -7.079044, 1, -0.5, 0.5, 0.5,
-0.2657796, -4.137407, -7.079044, 1, 1.5, 0.5, 0.5,
-0.2657796, -4.137407, -7.079044, 0, 1.5, 0.5, 0.5
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
-4.871562, 0.2224765, -7.079044, 0, -0.5, 0.5, 0.5,
-4.871562, 0.2224765, -7.079044, 1, -0.5, 0.5, 0.5,
-4.871562, 0.2224765, -7.079044, 1, 1.5, 0.5, 0.5,
-4.871562, 0.2224765, -7.079044, 0, 1.5, 0.5, 0.5
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
-4.871562, -4.137407, -0.2818804, 0, -0.5, 0.5, 0.5,
-4.871562, -4.137407, -0.2818804, 1, -0.5, 0.5, 0.5,
-4.871562, -4.137407, -0.2818804, 1, 1.5, 0.5, 0.5,
-4.871562, -4.137407, -0.2818804, 0, 1.5, 0.5, 0.5
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
-3, -3.13128, -5.510468,
3, -3.13128, -5.510468,
-3, -3.13128, -5.510468,
-3, -3.298968, -5.771897,
-2, -3.13128, -5.510468,
-2, -3.298968, -5.771897,
-1, -3.13128, -5.510468,
-1, -3.298968, -5.771897,
0, -3.13128, -5.510468,
0, -3.298968, -5.771897,
1, -3.13128, -5.510468,
1, -3.298968, -5.771897,
2, -3.13128, -5.510468,
2, -3.298968, -5.771897,
3, -3.13128, -5.510468,
3, -3.298968, -5.771897
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
-3, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
-3, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
-3, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
-3, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
-2, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
-2, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
-2, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
-2, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
-1, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
-1, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
-1, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
-1, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
0, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
0, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
0, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
0, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
1, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
1, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
1, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
1, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
2, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
2, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
2, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
2, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5,
3, -3.634344, -6.294756, 0, -0.5, 0.5, 0.5,
3, -3.634344, -6.294756, 1, -0.5, 0.5, 0.5,
3, -3.634344, -6.294756, 1, 1.5, 0.5, 0.5,
3, -3.634344, -6.294756, 0, 1.5, 0.5, 0.5
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
-3.808689, -3, -5.510468,
-3.808689, 3, -5.510468,
-3.808689, -3, -5.510468,
-3.985834, -3, -5.771897,
-3.808689, -2, -5.510468,
-3.985834, -2, -5.771897,
-3.808689, -1, -5.510468,
-3.985834, -1, -5.771897,
-3.808689, 0, -5.510468,
-3.985834, 0, -5.771897,
-3.808689, 1, -5.510468,
-3.985834, 1, -5.771897,
-3.808689, 2, -5.510468,
-3.985834, 2, -5.771897,
-3.808689, 3, -5.510468,
-3.985834, 3, -5.771897
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
-4.340125, -3, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, -3, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, -3, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, -3, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, -2, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, -2, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, -2, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, -2, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, -1, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, -1, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, -1, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, -1, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, 0, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, 0, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, 0, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, 0, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, 1, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, 1, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, 1, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, 1, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, 2, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, 2, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, 2, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, 2, -6.294756, 0, 1.5, 0.5, 0.5,
-4.340125, 3, -6.294756, 0, -0.5, 0.5, 0.5,
-4.340125, 3, -6.294756, 1, -0.5, 0.5, 0.5,
-4.340125, 3, -6.294756, 1, 1.5, 0.5, 0.5,
-4.340125, 3, -6.294756, 0, 1.5, 0.5, 0.5
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
-3.808689, -3.13128, -4,
-3.808689, -3.13128, 4,
-3.808689, -3.13128, -4,
-3.985834, -3.298968, -4,
-3.808689, -3.13128, -2,
-3.985834, -3.298968, -2,
-3.808689, -3.13128, 0,
-3.985834, -3.298968, 0,
-3.808689, -3.13128, 2,
-3.985834, -3.298968, 2,
-3.808689, -3.13128, 4,
-3.985834, -3.298968, 4
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
-4.340125, -3.634344, -4, 0, -0.5, 0.5, 0.5,
-4.340125, -3.634344, -4, 1, -0.5, 0.5, 0.5,
-4.340125, -3.634344, -4, 1, 1.5, 0.5, 0.5,
-4.340125, -3.634344, -4, 0, 1.5, 0.5, 0.5,
-4.340125, -3.634344, -2, 0, -0.5, 0.5, 0.5,
-4.340125, -3.634344, -2, 1, -0.5, 0.5, 0.5,
-4.340125, -3.634344, -2, 1, 1.5, 0.5, 0.5,
-4.340125, -3.634344, -2, 0, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 0, 0, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 0, 1, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 0, 1, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 0, 0, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 2, 0, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 2, 1, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 2, 1, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 2, 0, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 4, 0, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 4, 1, -0.5, 0.5, 0.5,
-4.340125, -3.634344, 4, 1, 1.5, 0.5, 0.5,
-4.340125, -3.634344, 4, 0, 1.5, 0.5, 0.5
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
-3.808689, -3.13128, -5.510468,
-3.808689, 3.576233, -5.510468,
-3.808689, -3.13128, 4.946707,
-3.808689, 3.576233, 4.946707,
-3.808689, -3.13128, -5.510468,
-3.808689, -3.13128, 4.946707,
-3.808689, 3.576233, -5.510468,
-3.808689, 3.576233, 4.946707,
-3.808689, -3.13128, -5.510468,
3.27713, -3.13128, -5.510468,
-3.808689, -3.13128, 4.946707,
3.27713, -3.13128, 4.946707,
-3.808689, 3.576233, -5.510468,
3.27713, 3.576233, -5.510468,
-3.808689, 3.576233, 4.946707,
3.27713, 3.576233, 4.946707,
3.27713, -3.13128, -5.510468,
3.27713, 3.576233, -5.510468,
3.27713, -3.13128, 4.946707,
3.27713, 3.576233, 4.946707,
3.27713, -3.13128, -5.510468,
3.27713, -3.13128, 4.946707,
3.27713, 3.576233, -5.510468,
3.27713, 3.576233, 4.946707
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
var radius = 7.637081;
var distance = 33.97823;
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
mvMatrix.translate( 0.2657796, -0.2224765, 0.2818804 );
mvMatrix.scale( 1.165336, 1.231062, 0.789636 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97823);
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
tetrathiin<-read.table("tetrathiin.xyz")
```

```
## Error in read.table("tetrathiin.xyz"): no lines available in input
```

```r
x<-tetrathiin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
```

```r
y<-tetrathiin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
```

```r
z<-tetrathiin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
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
-3.705497, 0.2158967, 0.1980905, 0, 0, 1, 1, 1,
-2.928574, -1.846628, -2.821742, 1, 0, 0, 1, 1,
-2.738856, 0.5774454, -0.8492406, 1, 0, 0, 1, 1,
-2.692244, 0.2578657, -1.773427, 1, 0, 0, 1, 1,
-2.69089, 0.836081, -0.5195721, 1, 0, 0, 1, 1,
-2.645702, -0.2033989, -2.267003, 1, 0, 0, 1, 1,
-2.599348, 0.6197233, -1.055696, 0, 0, 0, 1, 1,
-2.487001, 0.8201186, -2.184151, 0, 0, 0, 1, 1,
-2.462442, -1.348503, -1.9904, 0, 0, 0, 1, 1,
-2.413723, -1.538586, -2.368008, 0, 0, 0, 1, 1,
-2.346692, -0.2653024, -1.095374, 0, 0, 0, 1, 1,
-2.275963, -1.057874, -1.626978, 0, 0, 0, 1, 1,
-2.248445, 0.3500435, -1.576818, 0, 0, 0, 1, 1,
-2.207615, 0.6342316, -1.808167, 1, 1, 1, 1, 1,
-2.187624, 0.5096148, -0.7854207, 1, 1, 1, 1, 1,
-2.136343, -0.8968912, -0.1274211, 1, 1, 1, 1, 1,
-2.119563, 0.4754741, -3.068685, 1, 1, 1, 1, 1,
-2.096281, -1.378676, -2.550493, 1, 1, 1, 1, 1,
-2.063937, 1.222633, 1.030472, 1, 1, 1, 1, 1,
-2.061365, -0.3544177, -0.04549946, 1, 1, 1, 1, 1,
-2.044131, 0.7215028, 1.447996, 1, 1, 1, 1, 1,
-2.022997, -0.8377576, -3.034949, 1, 1, 1, 1, 1,
-2.020929, -0.2544842, -1.883957, 1, 1, 1, 1, 1,
-2.019619, 0.9549971, -2.115812, 1, 1, 1, 1, 1,
-2.008519, -0.9206017, -1.474638, 1, 1, 1, 1, 1,
-2.003315, 1.225214, -1.410288, 1, 1, 1, 1, 1,
-1.974177, 0.6379909, -2.305103, 1, 1, 1, 1, 1,
-1.973189, 0.5821488, -1.342396, 1, 1, 1, 1, 1,
-1.953181, -0.9381592, -0.6809001, 0, 0, 1, 1, 1,
-1.946949, -0.4747341, -1.124653, 1, 0, 0, 1, 1,
-1.930346, 0.3107198, -0.5858633, 1, 0, 0, 1, 1,
-1.91603, 0.260998, -2.323229, 1, 0, 0, 1, 1,
-1.885862, 1.582104, 0.7990414, 1, 0, 0, 1, 1,
-1.878076, 0.9696607, 0.7057557, 1, 0, 0, 1, 1,
-1.859781, 0.4862097, 0.9329048, 0, 0, 0, 1, 1,
-1.854411, -1.058887, -0.8612579, 0, 0, 0, 1, 1,
-1.852129, 0.7489715, -1.577353, 0, 0, 0, 1, 1,
-1.745205, 1.396607, -1.500139, 0, 0, 0, 1, 1,
-1.743593, 0.0951675, -1.393624, 0, 0, 0, 1, 1,
-1.718179, 0.4187688, -2.00473, 0, 0, 0, 1, 1,
-1.700373, -0.703845, -1.012452, 0, 0, 0, 1, 1,
-1.696824, -0.2854483, -2.516292, 1, 1, 1, 1, 1,
-1.696367, 1.691636, -0.1684437, 1, 1, 1, 1, 1,
-1.692805, 0.3881194, -3.164886, 1, 1, 1, 1, 1,
-1.686896, -0.01406868, -2.936182, 1, 1, 1, 1, 1,
-1.681058, -0.339607, -2.393322, 1, 1, 1, 1, 1,
-1.661379, 0.8846588, -0.8574455, 1, 1, 1, 1, 1,
-1.639005, -0.8541009, -1.971841, 1, 1, 1, 1, 1,
-1.638478, -0.9825474, -2.560547, 1, 1, 1, 1, 1,
-1.635492, -0.6153028, -2.194691, 1, 1, 1, 1, 1,
-1.620172, 0.1629641, -0.6717542, 1, 1, 1, 1, 1,
-1.617217, 0.09853725, -3.107014, 1, 1, 1, 1, 1,
-1.611254, 0.5539179, -1.185877, 1, 1, 1, 1, 1,
-1.595236, -0.5866506, -1.642298, 1, 1, 1, 1, 1,
-1.589995, 0.3203853, -1.967176, 1, 1, 1, 1, 1,
-1.586647, 1.567885, -0.4240085, 1, 1, 1, 1, 1,
-1.584856, -0.2255135, -2.158033, 0, 0, 1, 1, 1,
-1.568382, 0.07317813, -0.2415429, 1, 0, 0, 1, 1,
-1.559793, 0.7612184, 0.1234572, 1, 0, 0, 1, 1,
-1.556177, 0.8727454, -1.55904, 1, 0, 0, 1, 1,
-1.532551, -1.759244, -1.038155, 1, 0, 0, 1, 1,
-1.522401, -0.8728408, -1.60661, 1, 0, 0, 1, 1,
-1.521052, -1.034547, -3.380565, 0, 0, 0, 1, 1,
-1.516969, -1.434265, -2.69524, 0, 0, 0, 1, 1,
-1.488141, 0.1186518, -1.483951, 0, 0, 0, 1, 1,
-1.478637, -0.7979178, -3.703647, 0, 0, 0, 1, 1,
-1.472157, -0.8937981, -1.387876, 0, 0, 0, 1, 1,
-1.462259, 0.1081232, -1.82576, 0, 0, 0, 1, 1,
-1.460233, -0.4184624, -1.437421, 0, 0, 0, 1, 1,
-1.459357, 1.024579, -0.8628914, 1, 1, 1, 1, 1,
-1.451002, -0.8012912, -1.224053, 1, 1, 1, 1, 1,
-1.436886, -1.58081, -5.358179, 1, 1, 1, 1, 1,
-1.434982, 1.226968, 1.035248, 1, 1, 1, 1, 1,
-1.413329, -1.374697, -3.485159, 1, 1, 1, 1, 1,
-1.406809, 1.716058, -0.8357034, 1, 1, 1, 1, 1,
-1.401399, -1.49079, -3.855685, 1, 1, 1, 1, 1,
-1.399593, -2.229271, -4.12872, 1, 1, 1, 1, 1,
-1.398571, -0.8032521, -1.837551, 1, 1, 1, 1, 1,
-1.393963, 1.625378, 0.7882367, 1, 1, 1, 1, 1,
-1.39369, -0.9923444, -4.478501, 1, 1, 1, 1, 1,
-1.38623, -0.01450095, -2.451065, 1, 1, 1, 1, 1,
-1.379847, 0.9004104, -1.925094, 1, 1, 1, 1, 1,
-1.371757, 0.1830048, -3.953677, 1, 1, 1, 1, 1,
-1.370157, 0.3906568, -2.828645, 1, 1, 1, 1, 1,
-1.367255, -0.5431416, -3.126998, 0, 0, 1, 1, 1,
-1.367101, 0.3968583, 0.155052, 1, 0, 0, 1, 1,
-1.355258, 0.0712942, -0.8202658, 1, 0, 0, 1, 1,
-1.349963, -0.7137517, -2.732727, 1, 0, 0, 1, 1,
-1.349555, -0.5608703, -2.207571, 1, 0, 0, 1, 1,
-1.342723, -0.07873598, -2.422121, 1, 0, 0, 1, 1,
-1.332032, 0.3036864, -1.317644, 0, 0, 0, 1, 1,
-1.320869, 0.2159181, -3.055356, 0, 0, 0, 1, 1,
-1.318513, 0.1344838, -2.479075, 0, 0, 0, 1, 1,
-1.317009, -0.1030774, -1.334656, 0, 0, 0, 1, 1,
-1.314825, 0.03622437, -0.3728547, 0, 0, 0, 1, 1,
-1.313686, 1.350573, -0.4038762, 0, 0, 0, 1, 1,
-1.310306, 1.569464, 0.1276924, 0, 0, 0, 1, 1,
-1.30943, -0.06646643, -1.709599, 1, 1, 1, 1, 1,
-1.305067, -0.8490614, -0.03531295, 1, 1, 1, 1, 1,
-1.301798, 1.572531, -0.5147837, 1, 1, 1, 1, 1,
-1.296305, 1.372754, -1.013514, 1, 1, 1, 1, 1,
-1.294098, -0.07017271, -3.410486, 1, 1, 1, 1, 1,
-1.279373, 0.03000369, -0.8988206, 1, 1, 1, 1, 1,
-1.272976, 0.6711637, 0.8238802, 1, 1, 1, 1, 1,
-1.267453, 0.4197899, -0.05203899, 1, 1, 1, 1, 1,
-1.255764, -0.9546717, -2.485481, 1, 1, 1, 1, 1,
-1.25207, 0.1530469, -0.4235945, 1, 1, 1, 1, 1,
-1.249136, -1.620069, -1.553746, 1, 1, 1, 1, 1,
-1.227294, -0.07756732, -0.9997768, 1, 1, 1, 1, 1,
-1.217193, 0.1260162, -0.7864792, 1, 1, 1, 1, 1,
-1.215847, 1.88029, -1.549144, 1, 1, 1, 1, 1,
-1.20774, -0.1489367, -0.9713157, 1, 1, 1, 1, 1,
-1.207168, 0.6110154, -1.031788, 0, 0, 1, 1, 1,
-1.201679, -0.7360981, -1.361457, 1, 0, 0, 1, 1,
-1.200514, 0.7075921, -0.9727839, 1, 0, 0, 1, 1,
-1.199807, 0.3986645, -2.19353, 1, 0, 0, 1, 1,
-1.197194, -0.3492576, -2.142024, 1, 0, 0, 1, 1,
-1.191438, 0.5436649, -0.8052791, 1, 0, 0, 1, 1,
-1.186844, -0.1383955, -1.568983, 0, 0, 0, 1, 1,
-1.182871, -0.0954363, -0.238259, 0, 0, 0, 1, 1,
-1.179572, 1.289508, 0.1838664, 0, 0, 0, 1, 1,
-1.175633, -0.4652623, -2.691494, 0, 0, 0, 1, 1,
-1.169935, -1.326852, -2.316657, 0, 0, 0, 1, 1,
-1.16959, -0.5673554, -1.288812, 0, 0, 0, 1, 1,
-1.167729, -0.7885745, -1.283923, 0, 0, 0, 1, 1,
-1.163464, -0.1765556, -2.314319, 1, 1, 1, 1, 1,
-1.156831, 0.4638565, -1.73343, 1, 1, 1, 1, 1,
-1.155239, -0.699311, -2.199003, 1, 1, 1, 1, 1,
-1.136901, 1.44331, -1.295261, 1, 1, 1, 1, 1,
-1.136236, 0.3354061, -0.1741079, 1, 1, 1, 1, 1,
-1.134666, -1.281576, -4.152456, 1, 1, 1, 1, 1,
-1.129311, -0.2399899, -2.195581, 1, 1, 1, 1, 1,
-1.125694, -0.8443174, -1.314209, 1, 1, 1, 1, 1,
-1.124008, 0.7655753, -0.309409, 1, 1, 1, 1, 1,
-1.111974, 1.557039, -0.8083398, 1, 1, 1, 1, 1,
-1.107916, -1.111582, -4.220754, 1, 1, 1, 1, 1,
-1.095742, -0.03795465, -1.802471, 1, 1, 1, 1, 1,
-1.094316, 0.3574571, -1.266323, 1, 1, 1, 1, 1,
-1.092331, -1.98479, -1.05109, 1, 1, 1, 1, 1,
-1.082136, -0.194042, -1.113681, 1, 1, 1, 1, 1,
-1.0809, 0.91452, -1.909385, 0, 0, 1, 1, 1,
-1.078456, -0.6940464, -2.098318, 1, 0, 0, 1, 1,
-1.072445, -2.074277, -2.425776, 1, 0, 0, 1, 1,
-1.07154, 1.411541, 0.05424844, 1, 0, 0, 1, 1,
-1.069804, 0.3283793, -0.2568024, 1, 0, 0, 1, 1,
-1.06951, 0.7345214, -1.845019, 1, 0, 0, 1, 1,
-1.059281, 0.556814, -1.996833, 0, 0, 0, 1, 1,
-1.053766, 0.09479304, -1.032435, 0, 0, 0, 1, 1,
-1.045233, 1.193087, -0.5549495, 0, 0, 0, 1, 1,
-1.042325, -1.32636, -2.232706, 0, 0, 0, 1, 1,
-1.035053, 0.1123186, -0.7888232, 0, 0, 0, 1, 1,
-1.029526, 1.343174, -0.9884365, 0, 0, 0, 1, 1,
-1.013196, -0.1999564, -1.072205, 0, 0, 0, 1, 1,
-1.012074, -0.05475996, 0.7797887, 1, 1, 1, 1, 1,
-1.012007, -0.4026086, -1.098752, 1, 1, 1, 1, 1,
-1.010737, -0.1544093, -0.9280105, 1, 1, 1, 1, 1,
-1.009889, 0.3925569, -0.7014194, 1, 1, 1, 1, 1,
-1.008174, 0.8299761, -1.600165, 1, 1, 1, 1, 1,
-1.004136, -1.242882, -3.219405, 1, 1, 1, 1, 1,
-0.9969814, -0.9796897, -1.834488, 1, 1, 1, 1, 1,
-0.9946468, 0.1241653, 0.8708752, 1, 1, 1, 1, 1,
-0.98243, 0.6702173, 0.1520837, 1, 1, 1, 1, 1,
-0.9802022, 0.9401867, -2.64871, 1, 1, 1, 1, 1,
-0.9760519, 1.217693, -1.23912, 1, 1, 1, 1, 1,
-0.9742813, 1.110275, 0.189245, 1, 1, 1, 1, 1,
-0.970248, 0.6025246, -0.670445, 1, 1, 1, 1, 1,
-0.9654761, -0.2003143, -0.4872218, 1, 1, 1, 1, 1,
-0.9653256, 1.591698, -0.2433501, 1, 1, 1, 1, 1,
-0.9633785, 1.246479, -1.692147, 0, 0, 1, 1, 1,
-0.9607536, -1.180378, -0.1777286, 1, 0, 0, 1, 1,
-0.9599603, 0.6196122, -0.6521006, 1, 0, 0, 1, 1,
-0.9542027, 0.05718323, -0.9064815, 1, 0, 0, 1, 1,
-0.946749, -1.310726, -2.084841, 1, 0, 0, 1, 1,
-0.9316373, -0.8121141, -1.290618, 1, 0, 0, 1, 1,
-0.9311845, 0.1007481, -1.23407, 0, 0, 0, 1, 1,
-0.927845, -0.983431, -3.376951, 0, 0, 0, 1, 1,
-0.9219971, -1.794348, -1.192261, 0, 0, 0, 1, 1,
-0.9148697, 0.7319926, 0.2295053, 0, 0, 0, 1, 1,
-0.9135713, -0.22863, -1.338447, 0, 0, 0, 1, 1,
-0.9094637, 0.6853005, -0.4596595, 0, 0, 0, 1, 1,
-0.9087948, 0.6618523, -0.3288503, 0, 0, 0, 1, 1,
-0.9040521, 1.834882, 0.8476862, 1, 1, 1, 1, 1,
-0.9035349, 0.8453788, -0.3201669, 1, 1, 1, 1, 1,
-0.9017285, -0.1853968, -1.36542, 1, 1, 1, 1, 1,
-0.8974869, -0.3607331, -3.344707, 1, 1, 1, 1, 1,
-0.8934612, 1.433657, -1.884308, 1, 1, 1, 1, 1,
-0.8915411, -0.9740864, -1.42381, 1, 1, 1, 1, 1,
-0.890579, -0.07565149, -1.449472, 1, 1, 1, 1, 1,
-0.8857049, -0.5067096, -2.481503, 1, 1, 1, 1, 1,
-0.8856544, 0.2323761, -1.492924, 1, 1, 1, 1, 1,
-0.8769563, 0.5839153, -0.7565352, 1, 1, 1, 1, 1,
-0.875186, -0.2434784, -2.125431, 1, 1, 1, 1, 1,
-0.8723091, -0.04817659, -1.429879, 1, 1, 1, 1, 1,
-0.8629904, -0.2984511, -1.293643, 1, 1, 1, 1, 1,
-0.8616691, -0.823145, -3.161377, 1, 1, 1, 1, 1,
-0.8427446, 1.485234, 0.1660302, 1, 1, 1, 1, 1,
-0.8404061, -1.645316, -2.217612, 0, 0, 1, 1, 1,
-0.8402945, -1.474807, -3.161506, 1, 0, 0, 1, 1,
-0.832697, 0.9532099, -0.217273, 1, 0, 0, 1, 1,
-0.8234186, 0.8049306, -1.889703, 1, 0, 0, 1, 1,
-0.8177696, 0.1404443, -0.4519667, 1, 0, 0, 1, 1,
-0.8174474, -1.633047, -1.613734, 1, 0, 0, 1, 1,
-0.8168243, -1.671445, -2.193191, 0, 0, 0, 1, 1,
-0.8157687, -0.0008753893, 0.4401298, 0, 0, 0, 1, 1,
-0.8144341, 0.7392051, -0.06966885, 0, 0, 0, 1, 1,
-0.8141079, 0.5363289, 0.2022457, 0, 0, 0, 1, 1,
-0.8057234, 0.903039, 0.1572979, 0, 0, 0, 1, 1,
-0.8044441, 0.6315435, 0.3708821, 0, 0, 0, 1, 1,
-0.8032657, 1.300661, -0.497738, 0, 0, 0, 1, 1,
-0.798439, 0.3121102, 0.02352585, 1, 1, 1, 1, 1,
-0.7969013, 0.1696516, -0.4539203, 1, 1, 1, 1, 1,
-0.793259, -0.0403304, -1.135921, 1, 1, 1, 1, 1,
-0.7928322, -1.041238, -2.966652, 1, 1, 1, 1, 1,
-0.7909132, -1.705732, -2.54606, 1, 1, 1, 1, 1,
-0.7869323, 0.5528424, 0.3702716, 1, 1, 1, 1, 1,
-0.7842018, -0.5032294, -1.726237, 1, 1, 1, 1, 1,
-0.7802244, -2.450986, -2.566446, 1, 1, 1, 1, 1,
-0.7753872, -0.2398428, -0.991289, 1, 1, 1, 1, 1,
-0.7720171, -0.3453062, -1.839613, 1, 1, 1, 1, 1,
-0.7701654, 1.344286, 0.5740277, 1, 1, 1, 1, 1,
-0.7632424, -1.161581, -3.23122, 1, 1, 1, 1, 1,
-0.7613676, 0.08067383, -0.4793033, 1, 1, 1, 1, 1,
-0.7578845, -2.700508, -4.484774, 1, 1, 1, 1, 1,
-0.7554559, 1.730413, 0.7397822, 1, 1, 1, 1, 1,
-0.7399318, -2.030119, -1.358746, 0, 0, 1, 1, 1,
-0.7378699, -1.27021, -3.254706, 1, 0, 0, 1, 1,
-0.7346639, -1.026474, -2.185368, 1, 0, 0, 1, 1,
-0.7338557, -0.1704595, -0.3852352, 1, 0, 0, 1, 1,
-0.7337962, -0.01727766, -1.888377, 1, 0, 0, 1, 1,
-0.7266364, -0.2542934, -0.38323, 1, 0, 0, 1, 1,
-0.7217333, 0.989586, -1.766701, 0, 0, 0, 1, 1,
-0.7149442, -1.433367, -2.471388, 0, 0, 0, 1, 1,
-0.7101327, -0.2993283, -3.488408, 0, 0, 0, 1, 1,
-0.7096629, 0.4496938, -3.324873, 0, 0, 0, 1, 1,
-0.709274, -0.7220764, -1.669236, 0, 0, 0, 1, 1,
-0.7039838, -1.205522, -4.654574, 0, 0, 0, 1, 1,
-0.6984698, -0.8485408, -1.237727, 0, 0, 0, 1, 1,
-0.6927634, 0.2735821, -2.605652, 1, 1, 1, 1, 1,
-0.6908822, -1.426186, -4.196, 1, 1, 1, 1, 1,
-0.6804491, -1.068923, -0.9981574, 1, 1, 1, 1, 1,
-0.679668, -0.7589292, -3.487546, 1, 1, 1, 1, 1,
-0.6794559, -0.891138, -2.945881, 1, 1, 1, 1, 1,
-0.6772621, 0.4940786, 1.48241, 1, 1, 1, 1, 1,
-0.6765392, -0.7840114, -2.447688, 1, 1, 1, 1, 1,
-0.6731269, -0.08770797, -3.076568, 1, 1, 1, 1, 1,
-0.6717204, -1.564054, -3.71181, 1, 1, 1, 1, 1,
-0.6704976, -0.8793814, -1.294209, 1, 1, 1, 1, 1,
-0.6700046, 1.023827, -1.53045, 1, 1, 1, 1, 1,
-0.6620759, 0.3335207, -0.8819871, 1, 1, 1, 1, 1,
-0.6564636, -1.29635, -2.741536, 1, 1, 1, 1, 1,
-0.6477026, 1.038783, -1.648708, 1, 1, 1, 1, 1,
-0.6392592, 0.7514941, -0.2256445, 1, 1, 1, 1, 1,
-0.6321898, -0.2295278, -1.376088, 0, 0, 1, 1, 1,
-0.6315241, -3.033598, -2.631531, 1, 0, 0, 1, 1,
-0.6224819, 0.8034283, 0.6419717, 1, 0, 0, 1, 1,
-0.619028, 0.2373663, -1.106446, 1, 0, 0, 1, 1,
-0.6187323, 0.9395654, -1.18108, 1, 0, 0, 1, 1,
-0.6109126, 0.923724, -1.487095, 1, 0, 0, 1, 1,
-0.6003295, 0.3304387, -1.428557, 0, 0, 0, 1, 1,
-0.6002482, -0.2098006, -2.510751, 0, 0, 0, 1, 1,
-0.5987049, 0.2621868, -0.8677649, 0, 0, 0, 1, 1,
-0.5948938, -0.7714098, -3.027757, 0, 0, 0, 1, 1,
-0.5914848, 1.047342, -0.1945558, 0, 0, 0, 1, 1,
-0.5899843, 0.3388681, -2.069872, 0, 0, 0, 1, 1,
-0.5897544, 1.338554, -2.452066, 0, 0, 0, 1, 1,
-0.5883222, 1.701144, -1.998872, 1, 1, 1, 1, 1,
-0.5865566, -0.2998935, -1.067445, 1, 1, 1, 1, 1,
-0.5859068, -0.3650556, -2.12661, 1, 1, 1, 1, 1,
-0.583275, -1.020383, -4.123005, 1, 1, 1, 1, 1,
-0.5796123, -0.01273355, -1.928853, 1, 1, 1, 1, 1,
-0.5775499, -0.1198935, -2.910074, 1, 1, 1, 1, 1,
-0.5716714, -0.3125097, 1.201618, 1, 1, 1, 1, 1,
-0.5702565, -0.9913238, -3.574824, 1, 1, 1, 1, 1,
-0.567394, -0.2552708, -2.624478, 1, 1, 1, 1, 1,
-0.5664598, -1.556213, -4.42073, 1, 1, 1, 1, 1,
-0.5640081, 0.6092477, -0.9399194, 1, 1, 1, 1, 1,
-0.5625999, -0.9262571, -1.430059, 1, 1, 1, 1, 1,
-0.5620228, 1.455734, 0.9824895, 1, 1, 1, 1, 1,
-0.5598873, 0.2500419, -0.5570023, 1, 1, 1, 1, 1,
-0.55875, 1.496635, 1.177085, 1, 1, 1, 1, 1,
-0.5578246, -0.4385569, -1.648769, 0, 0, 1, 1, 1,
-0.5542387, 1.420551, 0.3142766, 1, 0, 0, 1, 1,
-0.5541919, -0.2235268, -1.760503, 1, 0, 0, 1, 1,
-0.5488576, 0.4598763, -1.941309, 1, 0, 0, 1, 1,
-0.5454208, 0.6790912, -0.7776307, 1, 0, 0, 1, 1,
-0.543067, 0.515439, -0.9967752, 1, 0, 0, 1, 1,
-0.5403971, 0.7160264, -0.1537219, 0, 0, 0, 1, 1,
-0.5381958, -1.308625, -0.7528301, 0, 0, 0, 1, 1,
-0.5367242, -0.6226141, -3.198385, 0, 0, 0, 1, 1,
-0.5358527, -1.593068, -2.445014, 0, 0, 0, 1, 1,
-0.5264736, 0.9044089, -0.8116259, 0, 0, 0, 1, 1,
-0.5263973, -0.7443079, 0.3604451, 0, 0, 0, 1, 1,
-0.5178851, 3.257674, -1.831129, 0, 0, 0, 1, 1,
-0.51671, -0.6135316, -1.563816, 1, 1, 1, 1, 1,
-0.5144035, -0.5656289, -4.434209, 1, 1, 1, 1, 1,
-0.5006695, 0.8690209, -1.324127, 1, 1, 1, 1, 1,
-0.500312, -1.024133, -4.507807, 1, 1, 1, 1, 1,
-0.4998972, -0.6857998, -4.163273, 1, 1, 1, 1, 1,
-0.4969371, 0.01366759, -1.697164, 1, 1, 1, 1, 1,
-0.495924, 0.4609906, -1.082476, 1, 1, 1, 1, 1,
-0.4863315, 0.6869624, -0.8202624, 1, 1, 1, 1, 1,
-0.4857734, -0.8462312, -0.8470189, 1, 1, 1, 1, 1,
-0.485065, -0.1944817, -1.4529, 1, 1, 1, 1, 1,
-0.4773355, 0.03027888, -1.347505, 1, 1, 1, 1, 1,
-0.4713444, 0.260946, -0.5563293, 1, 1, 1, 1, 1,
-0.4663137, -0.908212, -2.159622, 1, 1, 1, 1, 1,
-0.455585, -0.3799739, -0.4344772, 1, 1, 1, 1, 1,
-0.4551889, 1.707407, -1.875254, 1, 1, 1, 1, 1,
-0.454964, 0.1878886, -1.036279, 0, 0, 1, 1, 1,
-0.4535645, 0.7638662, -0.7696491, 1, 0, 0, 1, 1,
-0.4533753, 0.00955498, -1.951307, 1, 0, 0, 1, 1,
-0.4533681, -0.6779981, -0.1400791, 1, 0, 0, 1, 1,
-0.4495095, -0.04852734, -2.630565, 1, 0, 0, 1, 1,
-0.4487337, -0.7340694, -3.270911, 1, 0, 0, 1, 1,
-0.4433089, -1.427847, -1.924486, 0, 0, 0, 1, 1,
-0.4404119, -0.6265939, -1.614885, 0, 0, 0, 1, 1,
-0.439867, 0.464814, -0.767152, 0, 0, 0, 1, 1,
-0.4375482, -0.8387326, -2.737514, 0, 0, 0, 1, 1,
-0.4369051, 0.7340128, -0.7978715, 0, 0, 0, 1, 1,
-0.434864, -1.073739, -0.9741896, 0, 0, 0, 1, 1,
-0.4334784, 1.480993, -1.741302, 0, 0, 0, 1, 1,
-0.426655, 0.03486255, -2.091831, 1, 1, 1, 1, 1,
-0.4263779, -1.397066, -3.731816, 1, 1, 1, 1, 1,
-0.425936, 0.8018584, 1.01728, 1, 1, 1, 1, 1,
-0.4257674, 0.08590832, -1.748548, 1, 1, 1, 1, 1,
-0.4220013, 1.034083, -2.99607, 1, 1, 1, 1, 1,
-0.4186597, -0.1692738, -4.393958, 1, 1, 1, 1, 1,
-0.4173222, 0.8710066, -0.2718734, 1, 1, 1, 1, 1,
-0.4096729, -0.210434, -1.915926, 1, 1, 1, 1, 1,
-0.4018223, 0.5089847, -0.8490567, 1, 1, 1, 1, 1,
-0.4017508, -0.0364993, -3.290946, 1, 1, 1, 1, 1,
-0.4015946, 0.8661035, -0.1363815, 1, 1, 1, 1, 1,
-0.3976187, 0.295177, 0.2698007, 1, 1, 1, 1, 1,
-0.395975, 0.09973191, -2.068799, 1, 1, 1, 1, 1,
-0.3946071, 0.7973557, -1.33545, 1, 1, 1, 1, 1,
-0.3921282, -0.6777385, -2.918546, 1, 1, 1, 1, 1,
-0.3903204, 0.9473439, -0.128716, 0, 0, 1, 1, 1,
-0.390233, -1.38505, -3.314025, 1, 0, 0, 1, 1,
-0.3899761, -1.51159, -2.145905, 1, 0, 0, 1, 1,
-0.3865216, -1.559597, -3.272569, 1, 0, 0, 1, 1,
-0.3779292, -0.4390218, -0.8993482, 1, 0, 0, 1, 1,
-0.3774612, -0.285556, -3.626437, 1, 0, 0, 1, 1,
-0.372606, 2.058312, -0.1542393, 0, 0, 0, 1, 1,
-0.3700852, -1.262289, -2.350963, 0, 0, 0, 1, 1,
-0.3662903, -0.01471857, -1.929473, 0, 0, 0, 1, 1,
-0.3649517, -0.3600599, -1.888315, 0, 0, 0, 1, 1,
-0.3623566, 1.807774, -1.231713, 0, 0, 0, 1, 1,
-0.361499, -0.1996537, -1.376674, 0, 0, 0, 1, 1,
-0.3589848, 0.7356586, -0.4687111, 0, 0, 0, 1, 1,
-0.358622, -1.10842, -3.470317, 1, 1, 1, 1, 1,
-0.3542513, 0.1352522, -0.9269016, 1, 1, 1, 1, 1,
-0.3455238, 0.1865808, -0.9657604, 1, 1, 1, 1, 1,
-0.3449841, 0.1912752, -0.09409487, 1, 1, 1, 1, 1,
-0.343401, 0.1745044, -1.175014, 1, 1, 1, 1, 1,
-0.3429981, -0.08561642, -1.345706, 1, 1, 1, 1, 1,
-0.3411513, -0.3912997, -3.089078, 1, 1, 1, 1, 1,
-0.3399038, 2.676523, 0.5438339, 1, 1, 1, 1, 1,
-0.3371982, -1.324875, -4.959129, 1, 1, 1, 1, 1,
-0.3363445, -0.4665713, -2.439704, 1, 1, 1, 1, 1,
-0.3348398, 1.354539, -0.3881862, 1, 1, 1, 1, 1,
-0.3310536, -1.693119, -2.84995, 1, 1, 1, 1, 1,
-0.3273216, 0.389387, 0.8768486, 1, 1, 1, 1, 1,
-0.3273127, 0.7087772, -0.6512076, 1, 1, 1, 1, 1,
-0.3238847, -0.5120376, -2.80719, 1, 1, 1, 1, 1,
-0.3209412, -0.8821633, -2.238695, 0, 0, 1, 1, 1,
-0.3189043, -1.043705, -2.515072, 1, 0, 0, 1, 1,
-0.3167018, 1.060825, -1.220659, 1, 0, 0, 1, 1,
-0.3163057, -1.445715, -2.464055, 1, 0, 0, 1, 1,
-0.3124116, -0.9397447, -2.257505, 1, 0, 0, 1, 1,
-0.3068306, 0.7349745, -0.5373294, 1, 0, 0, 1, 1,
-0.2965387, 0.5156207, -1.207134, 0, 0, 0, 1, 1,
-0.2923965, -0.8699049, -3.959136, 0, 0, 0, 1, 1,
-0.2914688, 2.285898, -1.649082, 0, 0, 0, 1, 1,
-0.288999, -1.020973, -4.365561, 0, 0, 0, 1, 1,
-0.2877325, 0.3293605, 0.8977677, 0, 0, 0, 1, 1,
-0.2862228, -0.8053856, -3.278831, 0, 0, 0, 1, 1,
-0.2755627, -0.9813223, -2.735048, 0, 0, 0, 1, 1,
-0.274643, -0.6174408, -3.013164, 1, 1, 1, 1, 1,
-0.2705631, 1.727643, 0.03744539, 1, 1, 1, 1, 1,
-0.2701215, -0.8493616, -1.895713, 1, 1, 1, 1, 1,
-0.2667829, 0.9394389, 0.1612232, 1, 1, 1, 1, 1,
-0.2659399, 0.2104581, -1.118653, 1, 1, 1, 1, 1,
-0.2659018, 1.321288, -0.9977525, 1, 1, 1, 1, 1,
-0.2655862, 1.20743, -1.891056, 1, 1, 1, 1, 1,
-0.2649457, -0.108838, -2.425124, 1, 1, 1, 1, 1,
-0.2595388, -0.6279814, -2.881463, 1, 1, 1, 1, 1,
-0.2531013, -1.484128, -2.561931, 1, 1, 1, 1, 1,
-0.2525536, 2.89296, -0.1776389, 1, 1, 1, 1, 1,
-0.2523874, 0.5624238, -1.33193, 1, 1, 1, 1, 1,
-0.2475161, 0.5921711, -1.501233, 1, 1, 1, 1, 1,
-0.24623, 0.1695381, 0.1698437, 1, 1, 1, 1, 1,
-0.2450422, 0.6875465, -0.412171, 1, 1, 1, 1, 1,
-0.2445711, 0.3276891, 0.4180858, 0, 0, 1, 1, 1,
-0.2444957, -0.7431742, -2.97465, 1, 0, 0, 1, 1,
-0.2396115, 1.566783, 0.3556477, 1, 0, 0, 1, 1,
-0.2364776, 0.3099751, -1.155898, 1, 0, 0, 1, 1,
-0.2335781, -0.3546605, -1.844646, 1, 0, 0, 1, 1,
-0.2315576, -2.995821, -2.283061, 1, 0, 0, 1, 1,
-0.2299372, -0.9993164, -2.334997, 0, 0, 0, 1, 1,
-0.228021, -1.836043, -2.833866, 0, 0, 0, 1, 1,
-0.2273354, 0.3205787, -0.4932163, 0, 0, 0, 1, 1,
-0.2246405, 1.575229, 0.3493301, 0, 0, 0, 1, 1,
-0.2245072, -1.673594, -2.816507, 0, 0, 0, 1, 1,
-0.2214191, -0.9895355, -0.6542505, 0, 0, 0, 1, 1,
-0.2153958, 0.5013983, 0.1449719, 0, 0, 0, 1, 1,
-0.2150668, -0.1122069, -0.8214545, 1, 1, 1, 1, 1,
-0.2131155, 0.1183564, -1.679582, 1, 1, 1, 1, 1,
-0.2085964, 1.12438, -2.842057, 1, 1, 1, 1, 1,
-0.2083754, 0.8097438, 0.03938301, 1, 1, 1, 1, 1,
-0.2079876, 0.1789105, -0.8537998, 1, 1, 1, 1, 1,
-0.2047628, 0.3475135, -0.5481543, 1, 1, 1, 1, 1,
-0.203981, -0.9806638, -2.551586, 1, 1, 1, 1, 1,
-0.2004794, 0.1501353, -1.975953, 1, 1, 1, 1, 1,
-0.1999998, 1.268653, -0.6185502, 1, 1, 1, 1, 1,
-0.195476, 1.370042, -0.3717982, 1, 1, 1, 1, 1,
-0.1869969, -0.1812597, -1.969089, 1, 1, 1, 1, 1,
-0.1865136, 0.5284981, 0.3492805, 1, 1, 1, 1, 1,
-0.1842534, -0.4807046, -3.773322, 1, 1, 1, 1, 1,
-0.182551, -0.1552191, -3.150022, 1, 1, 1, 1, 1,
-0.1758048, 0.7877998, -0.6741167, 1, 1, 1, 1, 1,
-0.1718511, -0.7042885, -3.281246, 0, 0, 1, 1, 1,
-0.1709056, 1.15759, 1.064171, 1, 0, 0, 1, 1,
-0.1692049, 0.962334, -1.322358, 1, 0, 0, 1, 1,
-0.1653356, -0.3824965, -3.0199, 1, 0, 0, 1, 1,
-0.1650841, -0.06755798, -1.433586, 1, 0, 0, 1, 1,
-0.163589, -0.979317, -1.79065, 1, 0, 0, 1, 1,
-0.1633126, -1.330928, -1.973649, 0, 0, 0, 1, 1,
-0.1607741, -0.6439026, -3.720951, 0, 0, 0, 1, 1,
-0.1576065, 0.6252255, 0.5248433, 0, 0, 0, 1, 1,
-0.1572932, 1.113396, -2.350045, 0, 0, 0, 1, 1,
-0.1505129, -0.6288806, -2.280212, 0, 0, 0, 1, 1,
-0.1503884, 0.04072582, -2.425219, 0, 0, 0, 1, 1,
-0.1473642, -0.3986742, -3.768513, 0, 0, 0, 1, 1,
-0.1462936, -0.8686323, -3.176011, 1, 1, 1, 1, 1,
-0.1398906, -0.9115762, -3.604044, 1, 1, 1, 1, 1,
-0.1396907, 0.6469877, 1.549312, 1, 1, 1, 1, 1,
-0.1378526, -1.500896, -2.905001, 1, 1, 1, 1, 1,
-0.1334391, 0.02815549, -1.148672, 1, 1, 1, 1, 1,
-0.1329337, 0.1083338, -3.529987, 1, 1, 1, 1, 1,
-0.1316132, 0.301405, -0.4346217, 1, 1, 1, 1, 1,
-0.1299957, -0.3777602, -3.189853, 1, 1, 1, 1, 1,
-0.1287795, 0.3438475, -0.4609124, 1, 1, 1, 1, 1,
-0.1283995, 0.4402257, 0.5370682, 1, 1, 1, 1, 1,
-0.1272591, -1.036767, -1.757363, 1, 1, 1, 1, 1,
-0.1252916, 0.08805771, -2.215299, 1, 1, 1, 1, 1,
-0.1223521, 0.3494759, -1.096256, 1, 1, 1, 1, 1,
-0.1216997, 0.6587882, 0.7851692, 1, 1, 1, 1, 1,
-0.1194161, -0.2116637, -3.788902, 1, 1, 1, 1, 1,
-0.1151002, -0.344148, -2.098846, 0, 0, 1, 1, 1,
-0.114546, 0.8339962, 0.4924991, 1, 0, 0, 1, 1,
-0.113346, -1.102275, -2.706972, 1, 0, 0, 1, 1,
-0.1131541, 0.7936147, -1.261762, 1, 0, 0, 1, 1,
-0.1111843, -1.230215, -2.349465, 1, 0, 0, 1, 1,
-0.1075462, -0.6167971, -3.782843, 1, 0, 0, 1, 1,
-0.1058636, -0.4397478, -3.086601, 0, 0, 0, 1, 1,
-0.104991, -0.8767783, -2.241271, 0, 0, 0, 1, 1,
-0.104543, 0.2124941, 0.04535935, 0, 0, 0, 1, 1,
-0.1024307, -0.2293071, -1.62069, 0, 0, 0, 1, 1,
-0.1023023, 1.167268, 0.08163908, 0, 0, 0, 1, 1,
-0.100747, -0.6458301, -2.766901, 0, 0, 0, 1, 1,
-0.1006701, -0.09164497, -0.9029042, 0, 0, 0, 1, 1,
-0.09709209, -0.7817264, -1.517422, 1, 1, 1, 1, 1,
-0.09693148, 1.467886, 0.4502162, 1, 1, 1, 1, 1,
-0.09563156, 0.9200802, 1.391834, 1, 1, 1, 1, 1,
-0.09550022, 1.683837, 0.807861, 1, 1, 1, 1, 1,
-0.08956336, 0.6272202, 0.1318932, 1, 1, 1, 1, 1,
-0.07697937, -0.3452134, -4.805482, 1, 1, 1, 1, 1,
-0.07453313, 1.471085, -0.6455663, 1, 1, 1, 1, 1,
-0.07329723, 1.375703, -0.834936, 1, 1, 1, 1, 1,
-0.06535727, 0.529443, -1.315793, 1, 1, 1, 1, 1,
-0.0559578, 1.85817, -0.3681484, 1, 1, 1, 1, 1,
-0.05392473, 0.2783282, -0.5805368, 1, 1, 1, 1, 1,
-0.05308856, -0.06581741, -2.845033, 1, 1, 1, 1, 1,
-0.05150507, 2.333931, 1.993636, 1, 1, 1, 1, 1,
-0.0457337, -1.135122, -2.324834, 1, 1, 1, 1, 1,
-0.04499027, 1.483672, 1.927071, 1, 1, 1, 1, 1,
-0.03736439, -0.2686924, -3.725543, 0, 0, 1, 1, 1,
-0.03680895, -0.2852107, -2.456339, 1, 0, 0, 1, 1,
-0.03428975, -0.1132748, -2.820906, 1, 0, 0, 1, 1,
-0.03227571, -1.308726, -3.064277, 1, 0, 0, 1, 1,
-0.03161545, 0.3030023, 0.8214189, 1, 0, 0, 1, 1,
-0.03088244, 0.291237, -0.3186656, 1, 0, 0, 1, 1,
-0.02978733, -1.084718, -1.802837, 0, 0, 0, 1, 1,
-0.02846218, -1.057868, -3.914053, 0, 0, 0, 1, 1,
-0.02461048, 1.037794, 0.009081613, 0, 0, 0, 1, 1,
-0.02430924, -1.781241, -3.697369, 0, 0, 0, 1, 1,
-0.02276466, -0.01501871, -2.543492, 0, 0, 0, 1, 1,
-0.01881064, -0.5749773, -2.550138, 0, 0, 0, 1, 1,
-0.0134135, 0.4742395, -1.018749, 0, 0, 0, 1, 1,
-0.01229597, -0.5984337, -2.00688, 1, 1, 1, 1, 1,
-0.008069802, 0.3421706, -1.726289, 1, 1, 1, 1, 1,
-0.008046304, 0.1244147, -0.9807513, 1, 1, 1, 1, 1,
-0.007896442, 1.751183, 0.6501086, 1, 1, 1, 1, 1,
-0.006262876, -0.5624158, -3.645906, 1, 1, 1, 1, 1,
-0.006135599, -0.1682174, -4.077893, 1, 1, 1, 1, 1,
-0.005919868, 0.3484641, 1.38748, 1, 1, 1, 1, 1,
-0.004258209, 0.3644364, 0.6985277, 1, 1, 1, 1, 1,
-0.001078966, 0.1694005, -1.551956, 1, 1, 1, 1, 1,
-0.0002007492, -1.575122, -2.697208, 1, 1, 1, 1, 1,
0.001670264, -1.701174, 2.583592, 1, 1, 1, 1, 1,
0.002735087, 1.250937, 0.8219575, 1, 1, 1, 1, 1,
0.003700029, 0.4719132, 0.4915729, 1, 1, 1, 1, 1,
0.007303592, 0.6051837, -0.8974284, 1, 1, 1, 1, 1,
0.01104548, -0.3290976, 3.03825, 1, 1, 1, 1, 1,
0.01146342, -0.3680833, 3.011713, 0, 0, 1, 1, 1,
0.01243426, -1.614566, 3.2062, 1, 0, 0, 1, 1,
0.01857791, 0.8965957, 2.139994, 1, 0, 0, 1, 1,
0.0189919, 1.917386, 1.764556, 1, 0, 0, 1, 1,
0.02027256, 0.536423, -1.368945, 1, 0, 0, 1, 1,
0.02572348, -0.8776811, 2.340167, 1, 0, 0, 1, 1,
0.02771886, -2.02031, 3.175484, 0, 0, 0, 1, 1,
0.03271792, 1.488894, -0.8626363, 0, 0, 0, 1, 1,
0.03446633, 0.5496307, -0.6370245, 0, 0, 0, 1, 1,
0.03930782, 0.2986759, 1.173616, 0, 0, 0, 1, 1,
0.04566382, -2.245186, 3.992227, 0, 0, 0, 1, 1,
0.04749688, -0.07543037, 1.899388, 0, 0, 0, 1, 1,
0.0475299, 1.961072, -1.230241, 0, 0, 0, 1, 1,
0.05466185, -0.6794398, 2.344893, 1, 1, 1, 1, 1,
0.05885811, 0.6695877, -1.567251, 1, 1, 1, 1, 1,
0.05950239, -0.5040085, 3.920946, 1, 1, 1, 1, 1,
0.05958952, -0.222772, 4.010454, 1, 1, 1, 1, 1,
0.06554048, -1.268779, 3.646916, 1, 1, 1, 1, 1,
0.0681921, -0.3141953, 3.155202, 1, 1, 1, 1, 1,
0.07807591, 2.142535, 1.473694, 1, 1, 1, 1, 1,
0.07815936, -0.02708326, 2.982762, 1, 1, 1, 1, 1,
0.08073595, 0.9233477, 0.9769258, 1, 1, 1, 1, 1,
0.08127778, 0.01777657, 1.076283, 1, 1, 1, 1, 1,
0.08706196, 0.862995, -0.7421492, 1, 1, 1, 1, 1,
0.09062621, 0.7060016, -0.6671101, 1, 1, 1, 1, 1,
0.09077208, -0.07845788, 3.036884, 1, 1, 1, 1, 1,
0.09147409, -1.406215, 3.104717, 1, 1, 1, 1, 1,
0.09173694, -1.007462, 3.539166, 1, 1, 1, 1, 1,
0.09687488, -1.362103, 2.637525, 0, 0, 1, 1, 1,
0.1030281, -1.115613, 2.656639, 1, 0, 0, 1, 1,
0.1035313, -0.2126171, 3.12614, 1, 0, 0, 1, 1,
0.1046462, -0.4822075, 3.204479, 1, 0, 0, 1, 1,
0.1075497, 1.445508, -0.8063117, 1, 0, 0, 1, 1,
0.1094275, 1.381035, 1.023981, 1, 0, 0, 1, 1,
0.110698, 0.6418499, 0.02549378, 0, 0, 0, 1, 1,
0.1144221, -2.1682, 3.117142, 0, 0, 0, 1, 1,
0.1145752, 0.7918401, 0.1968887, 0, 0, 0, 1, 1,
0.1155165, 0.4226754, -0.1556784, 0, 0, 0, 1, 1,
0.116534, -1.143157, 1.290997, 0, 0, 0, 1, 1,
0.1210772, -0.002462732, 2.414186, 0, 0, 0, 1, 1,
0.1227444, 0.6691729, -0.4910527, 0, 0, 0, 1, 1,
0.1268785, -1.158479, 4.431666, 1, 1, 1, 1, 1,
0.1278046, -1.732693, 3.078131, 1, 1, 1, 1, 1,
0.1284389, -2.078384, 3.480516, 1, 1, 1, 1, 1,
0.1288583, -0.2776669, 3.504425, 1, 1, 1, 1, 1,
0.1328729, -0.3501133, 3.146886, 1, 1, 1, 1, 1,
0.1337183, 0.2253362, -0.04744383, 1, 1, 1, 1, 1,
0.1358094, -1.066575, 2.934064, 1, 1, 1, 1, 1,
0.1359158, 0.5425976, -1.722802, 1, 1, 1, 1, 1,
0.1380605, 2.627403, 1.152639, 1, 1, 1, 1, 1,
0.1390062, -1.816217, 3.073826, 1, 1, 1, 1, 1,
0.1449679, -0.1584906, 0.3018604, 1, 1, 1, 1, 1,
0.1469102, 1.735336, -0.1370659, 1, 1, 1, 1, 1,
0.1471225, 0.3394729, -0.4594742, 1, 1, 1, 1, 1,
0.1472825, -0.1568461, 3.005566, 1, 1, 1, 1, 1,
0.1528361, 0.6563212, 0.8020946, 1, 1, 1, 1, 1,
0.1664077, -0.2749385, 4.102411, 0, 0, 1, 1, 1,
0.1677138, 0.3312606, -1.644597, 1, 0, 0, 1, 1,
0.1688668, 2.042159, -0.03594356, 1, 0, 0, 1, 1,
0.1698289, -0.3715442, 4.371547, 1, 0, 0, 1, 1,
0.1737858, 0.4634566, 2.31643, 1, 0, 0, 1, 1,
0.1753584, -0.1525731, 3.605371, 1, 0, 0, 1, 1,
0.1790763, 1.81075, -0.05897506, 0, 0, 0, 1, 1,
0.1874522, -0.3723762, 2.44393, 0, 0, 0, 1, 1,
0.1924032, -2.662088, 3.849817, 0, 0, 0, 1, 1,
0.1938328, 1.482647, 1.054626, 0, 0, 0, 1, 1,
0.194012, 0.3385813, -0.8845613, 0, 0, 0, 1, 1,
0.2000993, -0.2097228, 2.15274, 0, 0, 0, 1, 1,
0.2043489, 0.7550887, 0.7482412, 0, 0, 0, 1, 1,
0.2081531, 0.5748346, 0.3339064, 1, 1, 1, 1, 1,
0.2098376, 0.01040278, 2.185845, 1, 1, 1, 1, 1,
0.2112151, -0.06615388, -0.8640295, 1, 1, 1, 1, 1,
0.2119761, 0.3224154, 0.8340858, 1, 1, 1, 1, 1,
0.2134618, -1.226895, 3.179408, 1, 1, 1, 1, 1,
0.2207174, 0.6931784, 0.3194655, 1, 1, 1, 1, 1,
0.22081, -0.01988997, 0.933955, 1, 1, 1, 1, 1,
0.2208156, 1.726861, 0.7607459, 1, 1, 1, 1, 1,
0.2212442, -0.4036205, 2.26728, 1, 1, 1, 1, 1,
0.223548, 0.1937538, 2.896438, 1, 1, 1, 1, 1,
0.2275978, -0.4505212, 1.546254, 1, 1, 1, 1, 1,
0.228332, -1.033282, 3.320414, 1, 1, 1, 1, 1,
0.2306494, -0.08766104, 0.8045352, 1, 1, 1, 1, 1,
0.2329592, 0.6115938, 0.2313657, 1, 1, 1, 1, 1,
0.2342057, 1.095753, 0.1342597, 1, 1, 1, 1, 1,
0.2357445, -1.46393, 2.717248, 0, 0, 1, 1, 1,
0.2373986, 0.934604, -0.5315058, 1, 0, 0, 1, 1,
0.238722, -0.8570356, 1.827926, 1, 0, 0, 1, 1,
0.2396848, -0.7392336, 3.176373, 1, 0, 0, 1, 1,
0.2462084, 1.922315, 0.1808235, 1, 0, 0, 1, 1,
0.2502829, -0.64284, 4.05059, 1, 0, 0, 1, 1,
0.2503463, -0.2886866, 0.5135779, 0, 0, 0, 1, 1,
0.2660291, 0.8535507, 0.9223847, 0, 0, 0, 1, 1,
0.2694439, -1.255685, 4.461988, 0, 0, 0, 1, 1,
0.2708773, -0.6923461, 1.013293, 0, 0, 0, 1, 1,
0.2761914, -0.8462393, 3.700743, 0, 0, 0, 1, 1,
0.2784368, 1.827074, 1.812373, 0, 0, 0, 1, 1,
0.2808985, 0.9483426, 0.8711619, 0, 0, 0, 1, 1,
0.2815453, 0.5963478, 1.494893, 1, 1, 1, 1, 1,
0.2905217, 0.2192741, 0.926352, 1, 1, 1, 1, 1,
0.293816, 0.757856, 1.71001, 1, 1, 1, 1, 1,
0.2942853, 0.6505257, 0.1623925, 1, 1, 1, 1, 1,
0.2957526, -0.9051421, 2.790096, 1, 1, 1, 1, 1,
0.2989541, -0.729923, 2.764453, 1, 1, 1, 1, 1,
0.3006177, 1.052815, -2.084159, 1, 1, 1, 1, 1,
0.3023494, -1.104841, 2.906174, 1, 1, 1, 1, 1,
0.3028694, 0.3306632, 1.337355, 1, 1, 1, 1, 1,
0.3045566, -0.8994793, 4.333815, 1, 1, 1, 1, 1,
0.3046232, -0.199458, 3.103436, 1, 1, 1, 1, 1,
0.3098433, 0.5279082, 1.689815, 1, 1, 1, 1, 1,
0.3099527, 0.08684766, 0.9671011, 1, 1, 1, 1, 1,
0.3127692, -0.7903232, 4.40313, 1, 1, 1, 1, 1,
0.3140564, 1.104531, -0.2179402, 1, 1, 1, 1, 1,
0.3144612, -0.2757515, 1.6649, 0, 0, 1, 1, 1,
0.3154373, 0.4422479, -1.133462, 1, 0, 0, 1, 1,
0.3189252, -2.054302, 1.757929, 1, 0, 0, 1, 1,
0.3243901, 0.1359429, 0.6707076, 1, 0, 0, 1, 1,
0.3259433, 0.6336646, 1.941354, 1, 0, 0, 1, 1,
0.3311421, 1.147562, 0.4892392, 1, 0, 0, 1, 1,
0.3330744, -0.5035291, 2.184999, 0, 0, 0, 1, 1,
0.3349031, 0.2498598, 0.5133529, 0, 0, 0, 1, 1,
0.3391588, 0.3754793, 0.8551304, 0, 0, 0, 1, 1,
0.3393087, -1.092431, 4.794418, 0, 0, 0, 1, 1,
0.343693, -0.7685854, 3.97797, 0, 0, 0, 1, 1,
0.3448533, -0.7067183, 2.32699, 0, 0, 0, 1, 1,
0.3498966, 0.3149664, 1.157173, 0, 0, 0, 1, 1,
0.3530964, 0.9192568, -0.2118813, 1, 1, 1, 1, 1,
0.3532927, 1.215997, -1.082371, 1, 1, 1, 1, 1,
0.3534942, -0.00421508, 1.120301, 1, 1, 1, 1, 1,
0.3605982, 1.614323, -0.6446312, 1, 1, 1, 1, 1,
0.3639591, 2.516348, 0.9741174, 1, 1, 1, 1, 1,
0.3647884, 0.3556841, -0.491305, 1, 1, 1, 1, 1,
0.365004, 1.180949, 0.01410703, 1, 1, 1, 1, 1,
0.3653738, 1.107493, -0.7778877, 1, 1, 1, 1, 1,
0.3660228, 0.791689, 0.8279715, 1, 1, 1, 1, 1,
0.3665361, 1.285672, 0.1971566, 1, 1, 1, 1, 1,
0.367894, 0.4396595, 0.04794954, 1, 1, 1, 1, 1,
0.3683896, -0.9308217, 4.398721, 1, 1, 1, 1, 1,
0.3710342, 0.01607371, 1.553858, 1, 1, 1, 1, 1,
0.3718564, 0.4471767, 1.108752, 1, 1, 1, 1, 1,
0.3724845, 2.342572, 0.7263089, 1, 1, 1, 1, 1,
0.3742735, 1.0345, -0.8608173, 0, 0, 1, 1, 1,
0.3762531, -1.187309, 3.1373, 1, 0, 0, 1, 1,
0.3762831, -0.1471815, 1.077742, 1, 0, 0, 1, 1,
0.3774632, -0.5730695, 2.090553, 1, 0, 0, 1, 1,
0.3787919, 2.425244, 1.130055, 1, 0, 0, 1, 1,
0.3803322, 0.5190526, 1.015152, 1, 0, 0, 1, 1,
0.3813982, -2.343494, 3.040892, 0, 0, 0, 1, 1,
0.3844341, -0.6415309, 2.935345, 0, 0, 0, 1, 1,
0.3848844, -0.4618638, 2.585367, 0, 0, 0, 1, 1,
0.392076, 1.242763, 1.721522, 0, 0, 0, 1, 1,
0.3924026, -0.4802363, 1.58569, 0, 0, 0, 1, 1,
0.3926144, 1.256431, -0.583022, 0, 0, 0, 1, 1,
0.3938968, 0.4357692, -0.4180565, 0, 0, 0, 1, 1,
0.394684, 0.3548797, 1.006999, 1, 1, 1, 1, 1,
0.3950539, -0.4670881, 3.27626, 1, 1, 1, 1, 1,
0.3960099, -1.088168, 1.900073, 1, 1, 1, 1, 1,
0.3963597, -1.531633, 3.108175, 1, 1, 1, 1, 1,
0.3993309, 0.8109506, 1.284941, 1, 1, 1, 1, 1,
0.3994928, 0.04737211, 1.220301, 1, 1, 1, 1, 1,
0.4003795, 0.1589354, 2.681644, 1, 1, 1, 1, 1,
0.4014571, -0.124351, 1.950216, 1, 1, 1, 1, 1,
0.4048154, -0.7880222, 4.426974, 1, 1, 1, 1, 1,
0.4049987, -1.231578, 2.724488, 1, 1, 1, 1, 1,
0.4072406, 2.450486, -0.1900095, 1, 1, 1, 1, 1,
0.4079962, -1.444681, 2.642363, 1, 1, 1, 1, 1,
0.4084479, -0.8106306, 3.469795, 1, 1, 1, 1, 1,
0.4085228, -1.10883, 3.172701, 1, 1, 1, 1, 1,
0.4086451, -0.677264, 2.949987, 1, 1, 1, 1, 1,
0.4099169, -0.5806072, 1.278079, 0, 0, 1, 1, 1,
0.4099967, 0.8099099, 1.172489, 1, 0, 0, 1, 1,
0.4147604, 0.02672742, 1.156352, 1, 0, 0, 1, 1,
0.4176645, -0.2811588, 0.4239491, 1, 0, 0, 1, 1,
0.4196567, 1.516248, -0.2341402, 1, 0, 0, 1, 1,
0.4215294, -0.9610787, 1.827706, 1, 0, 0, 1, 1,
0.421981, -1.100778, 2.128558, 0, 0, 0, 1, 1,
0.4234991, 1.907543, -0.1399048, 0, 0, 0, 1, 1,
0.4268073, -0.4705127, 2.829671, 0, 0, 0, 1, 1,
0.4273764, -0.4896155, 2.580613, 0, 0, 0, 1, 1,
0.4315038, 0.1729567, 1.201982, 0, 0, 0, 1, 1,
0.433095, 1.230891, 0.9510723, 0, 0, 0, 1, 1,
0.4397073, -0.02360317, 1.02727, 0, 0, 0, 1, 1,
0.4417455, -0.06209059, 1.636857, 1, 1, 1, 1, 1,
0.4442882, -0.5543516, 1.847969, 1, 1, 1, 1, 1,
0.4504879, -0.6008239, 1.758688, 1, 1, 1, 1, 1,
0.450496, -0.3082164, 2.117294, 1, 1, 1, 1, 1,
0.4524374, 0.1935422, 1.123059, 1, 1, 1, 1, 1,
0.4529307, -0.360023, 1.900148, 1, 1, 1, 1, 1,
0.4536003, 0.8260507, 1.405914, 1, 1, 1, 1, 1,
0.4622393, 0.6201352, -1.021077, 1, 1, 1, 1, 1,
0.4631786, -0.006318234, 0.190183, 1, 1, 1, 1, 1,
0.4749536, 0.03510067, 2.085697, 1, 1, 1, 1, 1,
0.4794016, 0.5889113, -0.3070862, 1, 1, 1, 1, 1,
0.4806205, 0.05428684, 2.195871, 1, 1, 1, 1, 1,
0.4863185, -0.1104434, 1.272626, 1, 1, 1, 1, 1,
0.4889553, 0.6213794, 1.202013, 1, 1, 1, 1, 1,
0.4890488, 0.3236655, 3.438124, 1, 1, 1, 1, 1,
0.4935956, 0.3073523, -0.925227, 0, 0, 1, 1, 1,
0.4940171, 0.5603092, -0.2482292, 1, 0, 0, 1, 1,
0.4975922, -0.5661163, 2.676757, 1, 0, 0, 1, 1,
0.5015352, 0.5515729, 0.6307477, 1, 0, 0, 1, 1,
0.504952, 1.592879, -0.329373, 1, 0, 0, 1, 1,
0.5081893, 1.530509, -0.6127661, 1, 0, 0, 1, 1,
0.5084616, 0.3904058, 2.194658, 0, 0, 0, 1, 1,
0.5115055, -0.2299113, 1.02008, 0, 0, 0, 1, 1,
0.512799, -0.6880001, 3.388158, 0, 0, 0, 1, 1,
0.5196565, -0.4483603, 2.352481, 0, 0, 0, 1, 1,
0.5241688, -1.051678, 1.806298, 0, 0, 0, 1, 1,
0.52422, -0.2666618, -0.756056, 0, 0, 0, 1, 1,
0.52983, -0.9120825, 2.448143, 0, 0, 0, 1, 1,
0.5343996, -0.4012183, 2.294244, 1, 1, 1, 1, 1,
0.5360757, 0.3173103, 2.863803, 1, 1, 1, 1, 1,
0.5372915, -0.4414649, 3.927817, 1, 1, 1, 1, 1,
0.5425276, 0.7778124, -0.03411761, 1, 1, 1, 1, 1,
0.5446026, -0.889371, 1.219509, 1, 1, 1, 1, 1,
0.5481149, 2.126413, 1.531181, 1, 1, 1, 1, 1,
0.5509812, -1.477282, 3.152582, 1, 1, 1, 1, 1,
0.5535342, 0.04260449, 1.299928, 1, 1, 1, 1, 1,
0.5541788, -0.2773495, 1.693546, 1, 1, 1, 1, 1,
0.5543617, 0.5806915, 1.867475, 1, 1, 1, 1, 1,
0.5668889, 0.2397597, 0.7931471, 1, 1, 1, 1, 1,
0.571736, -0.2100538, 1.269246, 1, 1, 1, 1, 1,
0.5803121, -1.810519, 3.741296, 1, 1, 1, 1, 1,
0.5867999, -0.6483449, 3.093225, 1, 1, 1, 1, 1,
0.597674, 1.031844, 0.5921898, 1, 1, 1, 1, 1,
0.6105819, 1.122342, -0.7865704, 0, 0, 1, 1, 1,
0.6126515, -1.128399, 1.696793, 1, 0, 0, 1, 1,
0.6139295, -0.9661203, 3.95775, 1, 0, 0, 1, 1,
0.6158118, 0.7802052, 0.4935508, 1, 0, 0, 1, 1,
0.6179135, -0.4570378, 1.995461, 1, 0, 0, 1, 1,
0.6192989, 0.226597, 1.34614, 1, 0, 0, 1, 1,
0.6193367, 1.509172, -0.1351032, 0, 0, 0, 1, 1,
0.6202775, -1.835125, 3.802275, 0, 0, 0, 1, 1,
0.6270663, 0.7336101, -1.068949, 0, 0, 0, 1, 1,
0.6282277, -0.1714834, 3.255463, 0, 0, 0, 1, 1,
0.6353711, -0.2380829, 1.165107, 0, 0, 0, 1, 1,
0.6357734, 0.5320319, 0.56564, 0, 0, 0, 1, 1,
0.6411318, 0.9429988, 0.06115081, 0, 0, 0, 1, 1,
0.6446331, -1.971765, 3.068024, 1, 1, 1, 1, 1,
0.647206, 1.021615, 0.0479159, 1, 1, 1, 1, 1,
0.6497328, 0.8842941, -0.02667575, 1, 1, 1, 1, 1,
0.6566219, -1.413355, 2.253458, 1, 1, 1, 1, 1,
0.6635625, 0.5392107, -0.4254291, 1, 1, 1, 1, 1,
0.6663921, -0.2924002, 0.5797588, 1, 1, 1, 1, 1,
0.6670713, 0.7571316, 0.03701023, 1, 1, 1, 1, 1,
0.6671035, 0.8932379, 1.266225, 1, 1, 1, 1, 1,
0.6677018, -0.4739885, 1.432267, 1, 1, 1, 1, 1,
0.6696781, -0.1222667, 0.1251057, 1, 1, 1, 1, 1,
0.6730061, -0.5246617, 2.479354, 1, 1, 1, 1, 1,
0.6779069, 0.6168184, -0.4879296, 1, 1, 1, 1, 1,
0.6792134, -2.21205, 3.365405, 1, 1, 1, 1, 1,
0.6803271, -0.3912279, 2.586711, 1, 1, 1, 1, 1,
0.6832386, 1.485477, 0.2404366, 1, 1, 1, 1, 1,
0.6894041, 0.1526927, 0.8606741, 0, 0, 1, 1, 1,
0.690479, 1.987993, 2.064587, 1, 0, 0, 1, 1,
0.6931482, 0.7668487, 1.479051, 1, 0, 0, 1, 1,
0.6963032, -2.445388, 0.2604726, 1, 0, 0, 1, 1,
0.6974044, -0.9687875, 2.611579, 1, 0, 0, 1, 1,
0.6995353, -2.414495, 0.7953286, 1, 0, 0, 1, 1,
0.7009895, -0.9268122, 2.848028, 0, 0, 0, 1, 1,
0.7058851, 0.3504593, 0.8170726, 0, 0, 0, 1, 1,
0.7067052, 0.382264, 2.05139, 0, 0, 0, 1, 1,
0.714266, 1.572714, 0.07300179, 0, 0, 0, 1, 1,
0.714384, 0.3141533, 1.497405, 0, 0, 0, 1, 1,
0.7146788, 0.02213873, 1.74822, 0, 0, 0, 1, 1,
0.7173678, 1.285733, 0.3226309, 0, 0, 0, 1, 1,
0.7213355, -1.52648, 4.338834, 1, 1, 1, 1, 1,
0.7319564, -0.7109957, 2.324651, 1, 1, 1, 1, 1,
0.734697, -1.349103, 2.113041, 1, 1, 1, 1, 1,
0.735199, 1.096613, 1.366453, 1, 1, 1, 1, 1,
0.7400392, -0.2528936, 1.636111, 1, 1, 1, 1, 1,
0.7421563, -0.1048542, 2.051498, 1, 1, 1, 1, 1,
0.7425148, -0.7174621, 2.450256, 1, 1, 1, 1, 1,
0.7455279, 0.4807149, 0.5796295, 1, 1, 1, 1, 1,
0.7489133, 0.4969367, 0.8088361, 1, 1, 1, 1, 1,
0.7506499, -0.995024, 3.400292, 1, 1, 1, 1, 1,
0.7538126, -0.5160148, 3.063447, 1, 1, 1, 1, 1,
0.7600843, -0.3791971, 3.597244, 1, 1, 1, 1, 1,
0.7746207, 2.158956, -0.2254953, 1, 1, 1, 1, 1,
0.7782012, -1.465923, 1.549818, 1, 1, 1, 1, 1,
0.7858514, -0.9357233, 1.41047, 1, 1, 1, 1, 1,
0.7943646, -0.3608181, 0.2461884, 0, 0, 1, 1, 1,
0.7963511, 2.051354, 1.340949, 1, 0, 0, 1, 1,
0.7974622, 0.1648916, 0.6478767, 1, 0, 0, 1, 1,
0.7979701, 0.2496232, 0.9176887, 1, 0, 0, 1, 1,
0.7987276, 0.06052319, 0.7583805, 1, 0, 0, 1, 1,
0.8073131, -0.6171963, 2.158722, 1, 0, 0, 1, 1,
0.8108674, -2.206428, 2.821738, 0, 0, 0, 1, 1,
0.8209218, 0.2879942, 1.612619, 0, 0, 0, 1, 1,
0.8213087, -1.477889, 3.539903, 0, 0, 0, 1, 1,
0.8238614, -0.3349312, 2.037071, 0, 0, 0, 1, 1,
0.8266222, -1.307409, 2.371184, 0, 0, 0, 1, 1,
0.8280474, 0.07852242, -0.3233118, 0, 0, 0, 1, 1,
0.8286504, -0.6366764, 1.411171, 0, 0, 0, 1, 1,
0.8509883, -0.9400234, 2.498269, 1, 1, 1, 1, 1,
0.8550594, 1.274159, 1.466681, 1, 1, 1, 1, 1,
0.8569509, -0.417078, 2.669158, 1, 1, 1, 1, 1,
0.858808, 0.1247298, 0.9725896, 1, 1, 1, 1, 1,
0.8590218, 0.9443229, -0.3642101, 1, 1, 1, 1, 1,
0.8689075, -0.2186667, 2.452574, 1, 1, 1, 1, 1,
0.8822601, -0.9588957, 1.088328, 1, 1, 1, 1, 1,
0.8828918, -0.05661016, 1.735816, 1, 1, 1, 1, 1,
0.8881609, 0.7807598, 0.09646051, 1, 1, 1, 1, 1,
0.8903506, -0.3912079, 2.055298, 1, 1, 1, 1, 1,
0.8930808, 1.317916, -0.04869362, 1, 1, 1, 1, 1,
0.894559, -1.270534, 2.83684, 1, 1, 1, 1, 1,
0.896142, -1.617218, 4.716699, 1, 1, 1, 1, 1,
0.8988215, -0.8114092, 1.337258, 1, 1, 1, 1, 1,
0.8996807, 1.900452, -0.5686003, 1, 1, 1, 1, 1,
0.9024102, -0.4903145, 2.642315, 0, 0, 1, 1, 1,
0.9117154, 0.960445, 0.6346025, 1, 0, 0, 1, 1,
0.9147664, 1.101216, 1.56467, 1, 0, 0, 1, 1,
0.9190109, 0.1460247, 0.6612012, 1, 0, 0, 1, 1,
0.9213011, -0.792614, 2.735335, 1, 0, 0, 1, 1,
0.9232171, -0.024823, 2.167167, 1, 0, 0, 1, 1,
0.9250302, -0.6366061, 3.536752, 0, 0, 0, 1, 1,
0.9311491, 0.3509472, 2.565844, 0, 0, 0, 1, 1,
0.9402893, 0.07307852, 3.03038, 0, 0, 0, 1, 1,
0.9443976, 0.3031806, 1.113666, 0, 0, 0, 1, 1,
0.9489478, 1.154364, 2.146803, 0, 0, 0, 1, 1,
0.9494308, 1.531867, 2.069824, 0, 0, 0, 1, 1,
0.9543548, 1.043742, 1.148635, 0, 0, 0, 1, 1,
0.9590605, -0.5585806, 2.931998, 1, 1, 1, 1, 1,
0.9591563, -0.04706044, 3.965213, 1, 1, 1, 1, 1,
0.9608556, -1.855228, 2.943357, 1, 1, 1, 1, 1,
0.9611326, 1.422541, 2.291484, 1, 1, 1, 1, 1,
0.9622397, -0.7609024, 2.399624, 1, 1, 1, 1, 1,
0.9635669, -0.4583312, 0.5973956, 1, 1, 1, 1, 1,
0.965544, -0.6046989, 2.26734, 1, 1, 1, 1, 1,
0.9699673, 0.1330292, 1.984299, 1, 1, 1, 1, 1,
0.9723251, -0.3568481, 3.027923, 1, 1, 1, 1, 1,
0.9775827, 1.990719, 1.999496, 1, 1, 1, 1, 1,
0.9797758, -1.346292, 2.216428, 1, 1, 1, 1, 1,
0.9821305, 2.020893, -0.9495908, 1, 1, 1, 1, 1,
0.9918728, -0.1214308, 1.150683, 1, 1, 1, 1, 1,
0.9946116, 0.09336925, 1.661551, 1, 1, 1, 1, 1,
1.00616, 1.513468, 0.5196185, 1, 1, 1, 1, 1,
1.007005, -0.3250436, 2.625352, 0, 0, 1, 1, 1,
1.013764, 0.4979883, 0.9694421, 1, 0, 0, 1, 1,
1.016455, -0.3893346, 2.560668, 1, 0, 0, 1, 1,
1.018587, 1.084322, 0.6171304, 1, 0, 0, 1, 1,
1.024017, -0.7426957, 2.609353, 1, 0, 0, 1, 1,
1.031686, 1.193458, 0.3819146, 1, 0, 0, 1, 1,
1.03751, -1.518594, 2.773947, 0, 0, 0, 1, 1,
1.039159, -0.3051319, 1.161115, 0, 0, 0, 1, 1,
1.052005, 0.5506601, -1.165377, 0, 0, 0, 1, 1,
1.062218, 0.9884431, -0.405537, 0, 0, 0, 1, 1,
1.064022, 0.29524, 0.2460754, 0, 0, 0, 1, 1,
1.075966, 1.92906, 1.155436, 0, 0, 0, 1, 1,
1.083716, -0.0471854, 1.656436, 0, 0, 0, 1, 1,
1.087568, 0.01529004, 2.314472, 1, 1, 1, 1, 1,
1.093671, 1.082225, 0.9461136, 1, 1, 1, 1, 1,
1.095779, 0.8455979, 0.03156305, 1, 1, 1, 1, 1,
1.097039, -0.8376952, 1.804207, 1, 1, 1, 1, 1,
1.104509, 0.3095564, 0.6228892, 1, 1, 1, 1, 1,
1.107226, 1.529105, 1.164782, 1, 1, 1, 1, 1,
1.111753, 0.7623528, -1.541199, 1, 1, 1, 1, 1,
1.121646, -0.9037121, 2.087569, 1, 1, 1, 1, 1,
1.125479, -2.441246, 2.729094, 1, 1, 1, 1, 1,
1.128492, 0.3592439, -0.1348998, 1, 1, 1, 1, 1,
1.130474, 0.6859939, 0.8631624, 1, 1, 1, 1, 1,
1.133851, 0.6185539, 3.07276, 1, 1, 1, 1, 1,
1.140573, -0.002929778, 1.066991, 1, 1, 1, 1, 1,
1.141833, -0.3220484, 2.412547, 1, 1, 1, 1, 1,
1.147359, -0.3167824, 1.661208, 1, 1, 1, 1, 1,
1.149743, -1.182318, 1.836308, 0, 0, 1, 1, 1,
1.156753, -0.121872, 2.883905, 1, 0, 0, 1, 1,
1.158298, -0.4036116, 2.768089, 1, 0, 0, 1, 1,
1.158958, -0.3349169, 4.369036, 1, 0, 0, 1, 1,
1.170923, 2.219127, 0.04259223, 1, 0, 0, 1, 1,
1.174415, -0.4206463, 0.0967347, 1, 0, 0, 1, 1,
1.187512, 1.099735, 0.5364591, 0, 0, 0, 1, 1,
1.189842, 0.4503056, -0.329501, 0, 0, 0, 1, 1,
1.191055, -0.7727017, 2.600803, 0, 0, 0, 1, 1,
1.195281, 1.705257, 0.4879253, 0, 0, 0, 1, 1,
1.211653, 0.517559, 0.0276885, 0, 0, 0, 1, 1,
1.221046, -0.2538885, 2.832936, 0, 0, 0, 1, 1,
1.224367, 0.410574, 1.792294, 0, 0, 0, 1, 1,
1.230361, -0.04264401, 2.838259, 1, 1, 1, 1, 1,
1.232332, 1.311741, 1.999247, 1, 1, 1, 1, 1,
1.234053, 3.478551, 0.3448769, 1, 1, 1, 1, 1,
1.238817, 0.04088472, 1.968807, 1, 1, 1, 1, 1,
1.239854, 1.492618, 0.8687624, 1, 1, 1, 1, 1,
1.250769, -0.6027357, 2.839824, 1, 1, 1, 1, 1,
1.253075, -0.7217813, 1.053068, 1, 1, 1, 1, 1,
1.258751, -0.1668733, 3.008798, 1, 1, 1, 1, 1,
1.260193, 0.3962672, 2.344895, 1, 1, 1, 1, 1,
1.267671, 0.438292, 0.3574051, 1, 1, 1, 1, 1,
1.268926, -0.6470702, 1.306589, 1, 1, 1, 1, 1,
1.269822, -0.1057531, 2.768187, 1, 1, 1, 1, 1,
1.273923, 0.2522945, 1.090438, 1, 1, 1, 1, 1,
1.280271, -0.4502876, 1.888887, 1, 1, 1, 1, 1,
1.281635, -1.599257, 1.424934, 1, 1, 1, 1, 1,
1.290887, -0.9702532, 2.812116, 0, 0, 1, 1, 1,
1.30919, -0.2844994, 2.19881, 1, 0, 0, 1, 1,
1.311854, 0.6698307, 2.385183, 1, 0, 0, 1, 1,
1.318076, 0.9545839, 1.159801, 1, 0, 0, 1, 1,
1.318689, 0.653579, 1.848135, 1, 0, 0, 1, 1,
1.319374, -0.8339856, 4.067248, 1, 0, 0, 1, 1,
1.319723, -0.01445672, 0.783347, 0, 0, 0, 1, 1,
1.329458, -0.06568807, 3.015373, 0, 0, 0, 1, 1,
1.336242, -0.3467517, 3.458499, 0, 0, 0, 1, 1,
1.337885, 0.5426201, -0.5074896, 0, 0, 0, 1, 1,
1.338816, -0.4328233, 0.8496165, 0, 0, 0, 1, 1,
1.342671, -0.03576963, 1.057037, 0, 0, 0, 1, 1,
1.348424, -0.5017534, 3.786237, 0, 0, 0, 1, 1,
1.349488, 0.02679548, 2.247015, 1, 1, 1, 1, 1,
1.363302, 1.662163, 2.04111, 1, 1, 1, 1, 1,
1.363622, -1.423503, 2.528703, 1, 1, 1, 1, 1,
1.365043, 0.2727344, -0.5137035, 1, 1, 1, 1, 1,
1.380864, -0.225501, 1.631944, 1, 1, 1, 1, 1,
1.383536, 0.9275207, 2.27708, 1, 1, 1, 1, 1,
1.385879, 0.4560933, 1.503014, 1, 1, 1, 1, 1,
1.40702, -0.762194, 1.856486, 1, 1, 1, 1, 1,
1.407501, -0.5762288, 1.944305, 1, 1, 1, 1, 1,
1.40836, -1.285342, 1.518618, 1, 1, 1, 1, 1,
1.413703, 0.7382281, 0.1612994, 1, 1, 1, 1, 1,
1.419876, 0.4282021, 1.337913, 1, 1, 1, 1, 1,
1.423635, -0.199567, 2.525721, 1, 1, 1, 1, 1,
1.439903, 0.6563081, 1.924776, 1, 1, 1, 1, 1,
1.444301, 1.230684, -0.5310876, 1, 1, 1, 1, 1,
1.446966, -0.5593991, 3.868642, 0, 0, 1, 1, 1,
1.447765, -1.095386, 4.340598, 1, 0, 0, 1, 1,
1.457964, -0.3416794, 3.764151, 1, 0, 0, 1, 1,
1.471851, -1.59156, 3.186276, 1, 0, 0, 1, 1,
1.48345, -0.3683533, 0.8465472, 1, 0, 0, 1, 1,
1.491812, 0.7952265, 1.015995, 1, 0, 0, 1, 1,
1.493505, 0.373276, 2.109706, 0, 0, 0, 1, 1,
1.523612, -0.3398564, 2.141416, 0, 0, 0, 1, 1,
1.534585, -1.496589, 1.909443, 0, 0, 0, 1, 1,
1.535274, -0.5536292, 1.78807, 0, 0, 0, 1, 1,
1.538409, 0.199196, 1.781644, 0, 0, 0, 1, 1,
1.540473, 0.7994279, -0.5977968, 0, 0, 0, 1, 1,
1.541694, -1.066206, 2.167933, 0, 0, 0, 1, 1,
1.56188, -0.7288162, 1.379075, 1, 1, 1, 1, 1,
1.570874, -0.6532453, 1.233925, 1, 1, 1, 1, 1,
1.576938, 0.2113942, 1.725389, 1, 1, 1, 1, 1,
1.581253, -1.788916, 1.97647, 1, 1, 1, 1, 1,
1.593349, -0.802865, 1.058821, 1, 1, 1, 1, 1,
1.601963, -1.976039, 1.904143, 1, 1, 1, 1, 1,
1.608097, -0.02792201, 0.5212023, 1, 1, 1, 1, 1,
1.60903, -0.6828651, 1.464374, 1, 1, 1, 1, 1,
1.616568, -1.781565, 2.174094, 1, 1, 1, 1, 1,
1.616727, -2.355742, 2.045988, 1, 1, 1, 1, 1,
1.63898, -0.6912883, 0.3965981, 1, 1, 1, 1, 1,
1.644118, -0.01875255, 2.502161, 1, 1, 1, 1, 1,
1.646349, -1.019343, 0.3203032, 1, 1, 1, 1, 1,
1.657535, -0.3599721, 4.652594, 1, 1, 1, 1, 1,
1.657686, 1.260921, -0.4135932, 1, 1, 1, 1, 1,
1.684728, 0.05755068, 2.932855, 0, 0, 1, 1, 1,
1.690305, -2.679347, 4.01646, 1, 0, 0, 1, 1,
1.707752, 2.082496, -0.683524, 1, 0, 0, 1, 1,
1.726212, -0.5503945, 3.411569, 1, 0, 0, 1, 1,
1.733921, -1.220331, 1.69893, 1, 0, 0, 1, 1,
1.741354, 0.7944446, 2.31344, 1, 0, 0, 1, 1,
1.741444, -1.465232, 3.506117, 0, 0, 0, 1, 1,
1.742274, -0.2696135, -0.0995281, 0, 0, 0, 1, 1,
1.774299, -1.508054, 2.243261, 0, 0, 0, 1, 1,
1.790074, -0.6422444, -0.6417776, 0, 0, 0, 1, 1,
1.793409, 1.373376, -0.5926069, 0, 0, 0, 1, 1,
1.797952, -0.4591113, 1.712858, 0, 0, 0, 1, 1,
1.809723, -0.6788543, 1.172073, 0, 0, 0, 1, 1,
1.828739, 0.1730668, 2.173739, 1, 1, 1, 1, 1,
1.868569, -0.07941169, -0.0290171, 1, 1, 1, 1, 1,
1.874149, 0.6988537, 0.9516355, 1, 1, 1, 1, 1,
1.8773, -0.6989399, 4.496801, 1, 1, 1, 1, 1,
1.894894, 0.1465109, 2.213082, 1, 1, 1, 1, 1,
1.903421, -0.7358185, 0.9829796, 1, 1, 1, 1, 1,
1.907893, -2.06307, 1.368051, 1, 1, 1, 1, 1,
1.920718, -1.599402, 2.108679, 1, 1, 1, 1, 1,
1.92856, 0.4885213, -0.1912681, 1, 1, 1, 1, 1,
1.931924, 0.7245189, 1.776087, 1, 1, 1, 1, 1,
1.945119, 0.04573461, 0.1544501, 1, 1, 1, 1, 1,
1.951596, -0.2334129, 1.737383, 1, 1, 1, 1, 1,
1.972082, -0.08958037, 2.648789, 1, 1, 1, 1, 1,
1.97289, 0.568698, -0.07694229, 1, 1, 1, 1, 1,
1.973931, -0.8036578, 2.155721, 1, 1, 1, 1, 1,
1.978591, -0.6596513, 0.03109315, 0, 0, 1, 1, 1,
1.97962, 0.1340791, 2.72428, 1, 0, 0, 1, 1,
1.996141, -0.8079613, 0.2617597, 1, 0, 0, 1, 1,
2.027331, 0.02511236, 2.346257, 1, 0, 0, 1, 1,
2.029368, -0.2992037, 3.139192, 1, 0, 0, 1, 1,
2.048464, -0.7639755, 2.003489, 1, 0, 0, 1, 1,
2.067183, 2.121572, 0.6877055, 0, 0, 0, 1, 1,
2.076795, 0.7144919, 1.201668, 0, 0, 0, 1, 1,
2.089968, -1.04557, 1.826226, 0, 0, 0, 1, 1,
2.130382, -0.3960654, 1.449681, 0, 0, 0, 1, 1,
2.181921, -0.187824, 2.284881, 0, 0, 0, 1, 1,
2.262306, -0.4839918, 3.100853, 0, 0, 0, 1, 1,
2.387521, -1.000262, 3.006072, 0, 0, 0, 1, 1,
2.412218, -1.203522, 1.246957, 1, 1, 1, 1, 1,
2.441264, 0.06359427, 2.084813, 1, 1, 1, 1, 1,
2.516308, 0.2611116, 0.2782082, 1, 1, 1, 1, 1,
2.607513, -1.287857, 3.133145, 1, 1, 1, 1, 1,
2.788541, 2.142632, 0.3531554, 1, 1, 1, 1, 1,
2.968406, -1.139786, 0.3536115, 1, 1, 1, 1, 1,
3.173938, -0.4701329, 2.100973, 1, 1, 1, 1, 1
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
var radius = 9.510177;
var distance = 33.40409;
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
mvMatrix.translate( 0.2657797, -0.2224765, 0.2818804 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40409);
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
