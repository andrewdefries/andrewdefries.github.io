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
-3.143385, 0.3031451, -2.874075, 1, 0, 0, 1,
-3.065285, -1.105536, -0.8777966, 1, 0.007843138, 0, 1,
-2.983149, 1.871882, -0.1378878, 1, 0.01176471, 0, 1,
-2.748518, -1.375698, -3.621855, 1, 0.01960784, 0, 1,
-2.65569, 0.4218886, -1.600112, 1, 0.02352941, 0, 1,
-2.655665, 0.5301265, -2.308554, 1, 0.03137255, 0, 1,
-2.62822, -0.4354264, -1.005968, 1, 0.03529412, 0, 1,
-2.588472, 0.8797564, -1.125744, 1, 0.04313726, 0, 1,
-2.571079, 0.6044523, -0.7375689, 1, 0.04705882, 0, 1,
-2.523808, -2.052099, -2.411971, 1, 0.05490196, 0, 1,
-2.431375, 1.181886, -1.358535, 1, 0.05882353, 0, 1,
-2.404258, 0.03532611, 0.6874391, 1, 0.06666667, 0, 1,
-2.403604, 0.423822, -1.346933, 1, 0.07058824, 0, 1,
-2.334549, -0.3186545, -1.239316, 1, 0.07843138, 0, 1,
-2.325118, 0.6568888, -2.871912, 1, 0.08235294, 0, 1,
-2.323119, 0.1272593, -0.2667653, 1, 0.09019608, 0, 1,
-2.306889, -1.245874, -1.784493, 1, 0.09411765, 0, 1,
-2.265636, -1.176059, -2.260958, 1, 0.1019608, 0, 1,
-2.160873, 1.148981, -2.750457, 1, 0.1098039, 0, 1,
-2.141772, -0.330503, -0.9206794, 1, 0.1137255, 0, 1,
-2.133001, -0.7454934, -3.145904, 1, 0.1215686, 0, 1,
-2.109612, 0.8281641, -1.004059, 1, 0.1254902, 0, 1,
-2.103969, -0.5058308, -1.915657, 1, 0.1333333, 0, 1,
-2.098219, 0.7585039, 1.734363, 1, 0.1372549, 0, 1,
-2.093642, -0.9703348, -2.671733, 1, 0.145098, 0, 1,
-2.082047, -0.7051167, -1.376324, 1, 0.1490196, 0, 1,
-2.054935, 0.918789, -0.6401693, 1, 0.1568628, 0, 1,
-2.046798, 0.2856095, -2.2966, 1, 0.1607843, 0, 1,
-2.005265, -1.648253, -1.080233, 1, 0.1686275, 0, 1,
-1.981242, 1.250234, -2.088337, 1, 0.172549, 0, 1,
-1.955364, 1.175115, 0.03972642, 1, 0.1803922, 0, 1,
-1.920245, 1.10202, -0.4672108, 1, 0.1843137, 0, 1,
-1.877822, 1.353354, -2.00841, 1, 0.1921569, 0, 1,
-1.876026, -1.467407, -0.8156267, 1, 0.1960784, 0, 1,
-1.814062, 0.9442629, -1.503596, 1, 0.2039216, 0, 1,
-1.80705, 0.5311446, -0.984031, 1, 0.2117647, 0, 1,
-1.797106, 1.186204, -0.9418173, 1, 0.2156863, 0, 1,
-1.785658, 0.1011581, -0.6965736, 1, 0.2235294, 0, 1,
-1.763283, -0.9037322, -2.861862, 1, 0.227451, 0, 1,
-1.757236, 0.1868748, -1.672246, 1, 0.2352941, 0, 1,
-1.70403, -1.261519, -2.135631, 1, 0.2392157, 0, 1,
-1.702878, -0.4291657, -0.4232637, 1, 0.2470588, 0, 1,
-1.680691, -0.8539426, -0.4228044, 1, 0.2509804, 0, 1,
-1.673283, 0.6373251, -0.2543302, 1, 0.2588235, 0, 1,
-1.667485, -0.1756207, 0.9456263, 1, 0.2627451, 0, 1,
-1.646468, -0.2655817, -1.304834, 1, 0.2705882, 0, 1,
-1.63594, -1.035771, -1.503872, 1, 0.2745098, 0, 1,
-1.612924, -0.2594457, -1.411885, 1, 0.282353, 0, 1,
-1.605308, 0.1188068, -1.073112, 1, 0.2862745, 0, 1,
-1.603298, 0.2964224, -0.5471469, 1, 0.2941177, 0, 1,
-1.602561, 0.9826409, -1.884815, 1, 0.3019608, 0, 1,
-1.599328, 0.7099561, -1.680502, 1, 0.3058824, 0, 1,
-1.592001, 2.878732, -2.3245, 1, 0.3137255, 0, 1,
-1.581836, 1.273679, -0.826711, 1, 0.3176471, 0, 1,
-1.544394, 0.6190444, -0.4125944, 1, 0.3254902, 0, 1,
-1.534087, 1.006232, -1.838848, 1, 0.3294118, 0, 1,
-1.531206, 0.4669053, -0.5215195, 1, 0.3372549, 0, 1,
-1.530085, 1.632649, 0.04067478, 1, 0.3411765, 0, 1,
-1.526503, 0.1684378, -1.802703, 1, 0.3490196, 0, 1,
-1.522311, -0.9392865, -1.666615, 1, 0.3529412, 0, 1,
-1.518273, 0.590725, -1.278406, 1, 0.3607843, 0, 1,
-1.511535, -1.307104, -3.856785, 1, 0.3647059, 0, 1,
-1.511465, 0.1826509, -1.778817, 1, 0.372549, 0, 1,
-1.511153, -2.597397, -1.489198, 1, 0.3764706, 0, 1,
-1.509223, -0.7083827, -1.650566, 1, 0.3843137, 0, 1,
-1.506027, -1.363296, -2.22875, 1, 0.3882353, 0, 1,
-1.498554, -0.266511, -2.967418, 1, 0.3960784, 0, 1,
-1.492805, -0.9326016, -2.578871, 1, 0.4039216, 0, 1,
-1.490157, -0.5379611, -0.6692334, 1, 0.4078431, 0, 1,
-1.488114, 1.955918, -0.9640848, 1, 0.4156863, 0, 1,
-1.484025, -0.304484, -2.434546, 1, 0.4196078, 0, 1,
-1.47939, 0.6407395, -0.8412498, 1, 0.427451, 0, 1,
-1.475602, 0.4216517, -3.092508, 1, 0.4313726, 0, 1,
-1.462121, -1.145818, -1.401254, 1, 0.4392157, 0, 1,
-1.455437, 0.2707653, -2.524911, 1, 0.4431373, 0, 1,
-1.454095, 0.9510312, -2.046375, 1, 0.4509804, 0, 1,
-1.435953, 0.7279693, 0.2566657, 1, 0.454902, 0, 1,
-1.420081, 0.1199385, -0.449711, 1, 0.4627451, 0, 1,
-1.419594, 1.2008, -0.5182366, 1, 0.4666667, 0, 1,
-1.419085, 1.193616, -1.386925, 1, 0.4745098, 0, 1,
-1.416921, -1.142741, -2.231925, 1, 0.4784314, 0, 1,
-1.40384, 0.07780357, -2.014512, 1, 0.4862745, 0, 1,
-1.403099, -0.1643967, -0.8892477, 1, 0.4901961, 0, 1,
-1.383056, -0.5259787, -3.588113, 1, 0.4980392, 0, 1,
-1.377046, -2.202581, -2.737177, 1, 0.5058824, 0, 1,
-1.37577, -1.620752, -1.541291, 1, 0.509804, 0, 1,
-1.373, -0.1406278, -2.23549, 1, 0.5176471, 0, 1,
-1.368229, -0.6009297, -1.713446, 1, 0.5215687, 0, 1,
-1.364877, 1.192065, -0.3653016, 1, 0.5294118, 0, 1,
-1.362473, -0.7268507, -3.632311, 1, 0.5333334, 0, 1,
-1.350701, 1.231804, -0.9934574, 1, 0.5411765, 0, 1,
-1.341155, 0.7302769, -0.7941525, 1, 0.5450981, 0, 1,
-1.324223, 0.1736895, -0.6617373, 1, 0.5529412, 0, 1,
-1.323087, 0.5674722, -1.312363, 1, 0.5568628, 0, 1,
-1.293659, 0.9213586, -3.024169, 1, 0.5647059, 0, 1,
-1.291754, -0.1281917, -1.664613, 1, 0.5686275, 0, 1,
-1.281891, -1.020211, -3.209557, 1, 0.5764706, 0, 1,
-1.280968, -0.1042912, -3.215044, 1, 0.5803922, 0, 1,
-1.270149, 0.6760438, -2.072933, 1, 0.5882353, 0, 1,
-1.263004, 0.5983562, -3.021178, 1, 0.5921569, 0, 1,
-1.256339, 0.5080149, -1.29446, 1, 0.6, 0, 1,
-1.253521, -0.4766027, -1.887988, 1, 0.6078432, 0, 1,
-1.251607, 0.3415862, -3.459975, 1, 0.6117647, 0, 1,
-1.248807, 0.2681383, -1.945009, 1, 0.6196079, 0, 1,
-1.246889, 0.8919929, 0.002325078, 1, 0.6235294, 0, 1,
-1.245011, -0.7559147, -1.918451, 1, 0.6313726, 0, 1,
-1.24328, 0.1869685, -0.8231285, 1, 0.6352941, 0, 1,
-1.24199, -0.1571733, -5.001577, 1, 0.6431373, 0, 1,
-1.241691, 1.770483, -0.9405561, 1, 0.6470588, 0, 1,
-1.238602, -0.4333763, -2.350178, 1, 0.654902, 0, 1,
-1.237213, -0.211107, -0.9666322, 1, 0.6588235, 0, 1,
-1.235701, -1.466339, -2.873208, 1, 0.6666667, 0, 1,
-1.234801, 0.1356755, -2.568319, 1, 0.6705883, 0, 1,
-1.23026, 1.446038, -0.92997, 1, 0.6784314, 0, 1,
-1.219629, 1.373537, -0.8636383, 1, 0.682353, 0, 1,
-1.206145, 1.06126, 0.2188256, 1, 0.6901961, 0, 1,
-1.204849, -0.8483202, -3.159896, 1, 0.6941177, 0, 1,
-1.202601, 1.621955, -0.8977888, 1, 0.7019608, 0, 1,
-1.200033, 0.3653097, -1.206198, 1, 0.7098039, 0, 1,
-1.200003, -1.176426, -2.390609, 1, 0.7137255, 0, 1,
-1.188834, -0.4664805, -1.602527, 1, 0.7215686, 0, 1,
-1.181893, -0.6960999, -3.045198, 1, 0.7254902, 0, 1,
-1.174769, -1.133193, -2.430223, 1, 0.7333333, 0, 1,
-1.170691, 0.6198633, -0.348125, 1, 0.7372549, 0, 1,
-1.167417, 0.7359408, -2.11151, 1, 0.7450981, 0, 1,
-1.164686, -0.8492873, -2.461739, 1, 0.7490196, 0, 1,
-1.164511, -0.6693155, -4.173184, 1, 0.7568628, 0, 1,
-1.161112, -0.01368898, -1.885003, 1, 0.7607843, 0, 1,
-1.15651, 0.2912803, -0.7139345, 1, 0.7686275, 0, 1,
-1.150257, -0.4436516, -2.236314, 1, 0.772549, 0, 1,
-1.149519, 0.8839579, 0.7095534, 1, 0.7803922, 0, 1,
-1.146188, -0.8292184, -0.7641628, 1, 0.7843137, 0, 1,
-1.145384, -0.07296305, -3.019127, 1, 0.7921569, 0, 1,
-1.139964, 1.650648, -2.099191, 1, 0.7960784, 0, 1,
-1.139749, 0.7205749, -1.271109, 1, 0.8039216, 0, 1,
-1.099044, -2.042815, -1.117545, 1, 0.8117647, 0, 1,
-1.090602, -0.7166991, -1.796252, 1, 0.8156863, 0, 1,
-1.084003, -0.03632201, 0.2859679, 1, 0.8235294, 0, 1,
-1.079359, -0.2407629, -1.214252, 1, 0.827451, 0, 1,
-1.07857, 3.365809, -0.9591485, 1, 0.8352941, 0, 1,
-1.078444, 1.327716, -2.25617, 1, 0.8392157, 0, 1,
-1.077826, 0.014828, -0.365649, 1, 0.8470588, 0, 1,
-1.077427, -1.489622, -2.650706, 1, 0.8509804, 0, 1,
-1.061584, -1.112722, -1.651365, 1, 0.8588235, 0, 1,
-1.060846, -1.119527, -2.391603, 1, 0.8627451, 0, 1,
-1.051124, 0.8640518, -0.5842733, 1, 0.8705882, 0, 1,
-1.045343, -0.3367958, -1.301789, 1, 0.8745098, 0, 1,
-1.045314, -2.012231, -2.227, 1, 0.8823529, 0, 1,
-1.04153, 0.7918381, -1.191922, 1, 0.8862745, 0, 1,
-1.030047, 0.16799, -0.2688177, 1, 0.8941177, 0, 1,
-1.024001, 0.5467576, -1.644302, 1, 0.8980392, 0, 1,
-1.020401, 0.127054, -3.721228, 1, 0.9058824, 0, 1,
-1.019367, 0.6899063, -0.8872691, 1, 0.9137255, 0, 1,
-1.008119, 0.2377847, -1.152784, 1, 0.9176471, 0, 1,
-1.004316, -1.32635, -2.007987, 1, 0.9254902, 0, 1,
-1.000767, 0.2988405, 0.7750105, 1, 0.9294118, 0, 1,
-0.9948565, -2.028083, -1.362585, 1, 0.9372549, 0, 1,
-0.9904745, -0.7769478, -1.206356, 1, 0.9411765, 0, 1,
-0.9894549, 0.03142168, -0.708079, 1, 0.9490196, 0, 1,
-0.9853074, -0.09311579, -2.490032, 1, 0.9529412, 0, 1,
-0.9848787, -0.7317979, -2.926355, 1, 0.9607843, 0, 1,
-0.9781789, -0.1642734, -0.9333306, 1, 0.9647059, 0, 1,
-0.9724393, -1.36665, -1.588745, 1, 0.972549, 0, 1,
-0.9707283, -1.130564, -2.843085, 1, 0.9764706, 0, 1,
-0.9676565, -0.220822, -1.780929, 1, 0.9843137, 0, 1,
-0.9526612, 0.5080456, -0.5413646, 1, 0.9882353, 0, 1,
-0.9503082, -0.9548072, -3.440113, 1, 0.9960784, 0, 1,
-0.9472529, -1.140225, -1.125336, 0.9960784, 1, 0, 1,
-0.9443008, 1.511523, -2.583786, 0.9921569, 1, 0, 1,
-0.9421669, -0.7942332, -3.25235, 0.9843137, 1, 0, 1,
-0.9413806, 0.02804706, -2.260192, 0.9803922, 1, 0, 1,
-0.9388979, 1.388057, 0.2319555, 0.972549, 1, 0, 1,
-0.9381491, 0.07007208, -1.16216, 0.9686275, 1, 0, 1,
-0.9360719, 0.3530632, 0.2576596, 0.9607843, 1, 0, 1,
-0.9337897, -0.06608877, -0.3344544, 0.9568627, 1, 0, 1,
-0.9320838, -1.682484, -1.547735, 0.9490196, 1, 0, 1,
-0.9293002, 0.494914, -1.901422, 0.945098, 1, 0, 1,
-0.9288025, 2.730612, -0.9280256, 0.9372549, 1, 0, 1,
-0.9274172, -0.1002483, -1.38183, 0.9333333, 1, 0, 1,
-0.9269178, -2.051545, -3.901624, 0.9254902, 1, 0, 1,
-0.917055, 0.7023293, -1.325106, 0.9215686, 1, 0, 1,
-0.9140906, -0.5110143, -3.56551, 0.9137255, 1, 0, 1,
-0.905479, -0.05043596, -0.9654008, 0.9098039, 1, 0, 1,
-0.9016426, -2.489387, -4.096003, 0.9019608, 1, 0, 1,
-0.8994367, 0.1454362, -1.779225, 0.8941177, 1, 0, 1,
-0.8974044, -1.661905, -4.108235, 0.8901961, 1, 0, 1,
-0.8954074, 0.8389149, -1.452181, 0.8823529, 1, 0, 1,
-0.8924105, -0.1648464, -2.015919, 0.8784314, 1, 0, 1,
-0.8899983, -0.303107, -0.2975731, 0.8705882, 1, 0, 1,
-0.8877329, 1.004824, 0.662416, 0.8666667, 1, 0, 1,
-0.886412, -0.8653663, -1.919372, 0.8588235, 1, 0, 1,
-0.8863783, -0.7101978, -2.893492, 0.854902, 1, 0, 1,
-0.8555893, 1.479837, -1.306232, 0.8470588, 1, 0, 1,
-0.8531202, 1.98079, -1.08817, 0.8431373, 1, 0, 1,
-0.8460673, -0.476528, -2.198066, 0.8352941, 1, 0, 1,
-0.8393604, 1.069037, -1.32645, 0.8313726, 1, 0, 1,
-0.8392426, 0.1990484, -0.9606825, 0.8235294, 1, 0, 1,
-0.8363938, 1.406907, -1.108076, 0.8196079, 1, 0, 1,
-0.8347208, -2.116972, -3.172941, 0.8117647, 1, 0, 1,
-0.8265279, 1.389215, -1.01858, 0.8078431, 1, 0, 1,
-0.8208786, -1.63871, -3.09451, 0.8, 1, 0, 1,
-0.815369, -0.8832812, -2.815352, 0.7921569, 1, 0, 1,
-0.8103834, 0.9958999, -0.5014135, 0.7882353, 1, 0, 1,
-0.8101436, 0.06765942, -1.999794, 0.7803922, 1, 0, 1,
-0.8089857, 1.077979, -1.433363, 0.7764706, 1, 0, 1,
-0.806182, 0.6026826, -0.8798857, 0.7686275, 1, 0, 1,
-0.8060535, -1.106931, -0.5165921, 0.7647059, 1, 0, 1,
-0.803781, 1.218289, -1.371807, 0.7568628, 1, 0, 1,
-0.8011959, 0.1501824, -1.319718, 0.7529412, 1, 0, 1,
-0.8000587, 0.4566513, -1.795532, 0.7450981, 1, 0, 1,
-0.7982609, -0.6795701, -1.737037, 0.7411765, 1, 0, 1,
-0.7948182, 0.8781266, 0.2494128, 0.7333333, 1, 0, 1,
-0.7927638, 1.492437, 1.320462, 0.7294118, 1, 0, 1,
-0.7865393, 2.180034, -0.2452641, 0.7215686, 1, 0, 1,
-0.7849848, 0.9561889, -2.45001, 0.7176471, 1, 0, 1,
-0.7830023, 0.315887, -1.642529, 0.7098039, 1, 0, 1,
-0.7815171, -0.8619451, -2.932555, 0.7058824, 1, 0, 1,
-0.7804099, 0.4310857, -0.3967151, 0.6980392, 1, 0, 1,
-0.7779199, -0.3357546, -3.596403, 0.6901961, 1, 0, 1,
-0.7754601, 0.6804408, -1.369042, 0.6862745, 1, 0, 1,
-0.7665345, -0.6688285, -0.3341656, 0.6784314, 1, 0, 1,
-0.7610871, -1.21246, -4.671479, 0.6745098, 1, 0, 1,
-0.7601523, -0.4284746, -2.048969, 0.6666667, 1, 0, 1,
-0.7558191, -2.258261, -2.010279, 0.6627451, 1, 0, 1,
-0.7539485, -0.3810469, -2.294791, 0.654902, 1, 0, 1,
-0.7508805, 2.10749, 0.5211266, 0.6509804, 1, 0, 1,
-0.7468156, -0.7898557, -3.951453, 0.6431373, 1, 0, 1,
-0.7440234, 0.2469382, -1.392264, 0.6392157, 1, 0, 1,
-0.7414162, 1.286699, -0.9154915, 0.6313726, 1, 0, 1,
-0.732744, -0.1694756, -1.258464, 0.627451, 1, 0, 1,
-0.7325683, -2.890843, -4.647324, 0.6196079, 1, 0, 1,
-0.7320488, -0.1729119, -0.1078626, 0.6156863, 1, 0, 1,
-0.7267016, 1.096958, 1.586742, 0.6078432, 1, 0, 1,
-0.7258407, -1.00717, -1.517421, 0.6039216, 1, 0, 1,
-0.7239943, 0.2143344, -2.788791, 0.5960785, 1, 0, 1,
-0.7236055, 1.192294, -0.0939526, 0.5882353, 1, 0, 1,
-0.7224566, 0.3351996, -1.767648, 0.5843138, 1, 0, 1,
-0.7176311, 0.4704402, -0.6134881, 0.5764706, 1, 0, 1,
-0.7117107, 1.302324, 0.5571728, 0.572549, 1, 0, 1,
-0.7093001, 0.4772474, 0.0987727, 0.5647059, 1, 0, 1,
-0.7037461, -0.3253072, -1.997892, 0.5607843, 1, 0, 1,
-0.7035272, 0.3038991, -1.557473, 0.5529412, 1, 0, 1,
-0.7034299, -0.4927554, -1.918466, 0.5490196, 1, 0, 1,
-0.7032384, -0.7322105, -2.917029, 0.5411765, 1, 0, 1,
-0.6911635, -0.8475853, -0.6387626, 0.5372549, 1, 0, 1,
-0.688552, 1.227219, -1.2517, 0.5294118, 1, 0, 1,
-0.6883302, -0.3700944, -2.468798, 0.5254902, 1, 0, 1,
-0.687754, -1.691515, -3.633228, 0.5176471, 1, 0, 1,
-0.6874338, -0.1918403, -2.989463, 0.5137255, 1, 0, 1,
-0.6832409, 0.8594825, -0.4154488, 0.5058824, 1, 0, 1,
-0.6824017, 2.063806, -1.023902, 0.5019608, 1, 0, 1,
-0.6823449, 0.3417203, -2.647051, 0.4941176, 1, 0, 1,
-0.6819251, 1.061156, 0.5055966, 0.4862745, 1, 0, 1,
-0.6816185, 0.7784168, -0.234546, 0.4823529, 1, 0, 1,
-0.6815952, 1.817006, 0.5639152, 0.4745098, 1, 0, 1,
-0.6814975, 0.7332534, -0.3152481, 0.4705882, 1, 0, 1,
-0.6784981, -1.311383, -2.300576, 0.4627451, 1, 0, 1,
-0.6762852, -0.009756817, -0.08416319, 0.4588235, 1, 0, 1,
-0.6751414, 0.009547926, -2.511526, 0.4509804, 1, 0, 1,
-0.673218, 0.03055348, -0.9907736, 0.4470588, 1, 0, 1,
-0.6723367, -0.4142466, -0.8509988, 0.4392157, 1, 0, 1,
-0.6707398, 0.5489008, -2.167215, 0.4352941, 1, 0, 1,
-0.6707019, 1.802445, 0.09644588, 0.427451, 1, 0, 1,
-0.6705457, -0.3917343, -2.101222, 0.4235294, 1, 0, 1,
-0.660404, -1.730789, -1.362845, 0.4156863, 1, 0, 1,
-0.6590236, 0.703576, 0.8042174, 0.4117647, 1, 0, 1,
-0.6565367, 0.5632964, 0.2427347, 0.4039216, 1, 0, 1,
-0.656048, -0.8070266, -3.381678, 0.3960784, 1, 0, 1,
-0.65576, 0.7094888, 0.3764614, 0.3921569, 1, 0, 1,
-0.6507642, -0.4583981, -1.623643, 0.3843137, 1, 0, 1,
-0.6482096, -1.788718, -2.974725, 0.3803922, 1, 0, 1,
-0.6458782, 1.719284, 0.1914013, 0.372549, 1, 0, 1,
-0.6456931, 0.3506852, -2.533626, 0.3686275, 1, 0, 1,
-0.6434485, -2.041825, -2.083547, 0.3607843, 1, 0, 1,
-0.6383811, 1.171727, 0.02194969, 0.3568628, 1, 0, 1,
-0.638057, 0.6170593, -0.427787, 0.3490196, 1, 0, 1,
-0.637439, -0.3212151, -3.02382, 0.345098, 1, 0, 1,
-0.6356938, 0.1175142, -2.117775, 0.3372549, 1, 0, 1,
-0.6341283, 0.5119792, -1.815336, 0.3333333, 1, 0, 1,
-0.6325538, 0.7786208, -0.7428182, 0.3254902, 1, 0, 1,
-0.6305636, -0.08996037, -1.239201, 0.3215686, 1, 0, 1,
-0.6302767, 0.482703, -1.98619, 0.3137255, 1, 0, 1,
-0.6281819, 0.8484083, -1.118719, 0.3098039, 1, 0, 1,
-0.6274905, 0.8454313, 0.8553324, 0.3019608, 1, 0, 1,
-0.6268101, 0.132792, 0.5005794, 0.2941177, 1, 0, 1,
-0.6240695, -0.418523, -2.045828, 0.2901961, 1, 0, 1,
-0.6210846, -0.09852425, -1.015762, 0.282353, 1, 0, 1,
-0.6188433, -1.649613, -1.17445, 0.2784314, 1, 0, 1,
-0.6172201, 1.27048, -2.140426, 0.2705882, 1, 0, 1,
-0.6147897, 0.506596, -1.263239, 0.2666667, 1, 0, 1,
-0.607146, 0.06353369, -0.9665002, 0.2588235, 1, 0, 1,
-0.6060138, -0.349831, -2.047287, 0.254902, 1, 0, 1,
-0.5948809, 0.7196724, 0.5314372, 0.2470588, 1, 0, 1,
-0.5945691, -0.4374968, -1.673262, 0.2431373, 1, 0, 1,
-0.5915247, 0.499347, -2.141803, 0.2352941, 1, 0, 1,
-0.5891208, 1.104556, -1.688247, 0.2313726, 1, 0, 1,
-0.5890655, -1.996476, -2.547793, 0.2235294, 1, 0, 1,
-0.5854228, 0.04385308, -1.298219, 0.2196078, 1, 0, 1,
-0.5835214, -0.09567975, -1.462812, 0.2117647, 1, 0, 1,
-0.5796598, -0.347588, -2.557915, 0.2078431, 1, 0, 1,
-0.5766434, -0.4270934, -2.723372, 0.2, 1, 0, 1,
-0.5715426, -2.25336, -3.942385, 0.1921569, 1, 0, 1,
-0.5695288, -1.649964, -3.261077, 0.1882353, 1, 0, 1,
-0.5643454, -0.1858904, -1.992796, 0.1803922, 1, 0, 1,
-0.5530968, -0.2950067, -1.302029, 0.1764706, 1, 0, 1,
-0.5422928, 0.2945429, -1.499554, 0.1686275, 1, 0, 1,
-0.5394248, 0.4650745, -0.6615684, 0.1647059, 1, 0, 1,
-0.5378261, -0.4161244, -1.63098, 0.1568628, 1, 0, 1,
-0.5346281, -0.6453206, -1.768385, 0.1529412, 1, 0, 1,
-0.5325565, 1.371502, -0.2420157, 0.145098, 1, 0, 1,
-0.5262178, 0.7979153, -0.2188728, 0.1411765, 1, 0, 1,
-0.5211105, 0.624903, -2.851523, 0.1333333, 1, 0, 1,
-0.518539, -0.6157855, -3.21462, 0.1294118, 1, 0, 1,
-0.5134017, 0.4949957, -2.834685, 0.1215686, 1, 0, 1,
-0.5132026, 0.0619699, -0.880335, 0.1176471, 1, 0, 1,
-0.5115673, 1.911985, 0.3448966, 0.1098039, 1, 0, 1,
-0.5114694, 1.748474, 1.130367, 0.1058824, 1, 0, 1,
-0.5066826, -0.3826625, -2.820041, 0.09803922, 1, 0, 1,
-0.4979198, -0.5218714, -2.654323, 0.09019608, 1, 0, 1,
-0.4957161, -0.412931, -0.4849491, 0.08627451, 1, 0, 1,
-0.4952655, -0.56149, -1.255593, 0.07843138, 1, 0, 1,
-0.4941041, -1.494876, -3.621498, 0.07450981, 1, 0, 1,
-0.490315, -0.1926699, -1.80088, 0.06666667, 1, 0, 1,
-0.4886155, 0.9401588, -0.08120528, 0.0627451, 1, 0, 1,
-0.4871657, 0.2801556, -1.962169, 0.05490196, 1, 0, 1,
-0.4860441, 0.7606727, -0.3912194, 0.05098039, 1, 0, 1,
-0.4853697, -0.5728671, -3.136322, 0.04313726, 1, 0, 1,
-0.484616, -3.271948, -2.5158, 0.03921569, 1, 0, 1,
-0.4810551, 1.855328, 1.037327, 0.03137255, 1, 0, 1,
-0.4793448, -0.7812019, -1.648411, 0.02745098, 1, 0, 1,
-0.4780893, -0.1704314, -2.102451, 0.01960784, 1, 0, 1,
-0.4770172, 0.530548, -2.436932, 0.01568628, 1, 0, 1,
-0.4727728, 0.4443771, -0.8520282, 0.007843138, 1, 0, 1,
-0.4694714, -0.09994316, -0.7472116, 0.003921569, 1, 0, 1,
-0.4689266, -1.847494, -1.895438, 0, 1, 0.003921569, 1,
-0.4662666, -1.736153, -3.364652, 0, 1, 0.01176471, 1,
-0.4640105, 0.6352136, 0.1706243, 0, 1, 0.01568628, 1,
-0.4634072, -1.759741, -3.592569, 0, 1, 0.02352941, 1,
-0.4631568, 0.7236626, -0.9912524, 0, 1, 0.02745098, 1,
-0.4574772, -0.5731797, -1.738471, 0, 1, 0.03529412, 1,
-0.4571737, -0.4911765, -2.055099, 0, 1, 0.03921569, 1,
-0.4507324, -0.9978728, -1.269953, 0, 1, 0.04705882, 1,
-0.4423192, 0.2695871, -1.547444, 0, 1, 0.05098039, 1,
-0.4389063, -0.8328764, -1.313253, 0, 1, 0.05882353, 1,
-0.4367012, 1.704251, 0.865759, 0, 1, 0.0627451, 1,
-0.4331047, -0.5419341, -3.506792, 0, 1, 0.07058824, 1,
-0.4320767, -1.12712, -1.651237, 0, 1, 0.07450981, 1,
-0.4266337, -0.7633206, -0.3847288, 0, 1, 0.08235294, 1,
-0.4024197, -0.1698824, -1.795678, 0, 1, 0.08627451, 1,
-0.4012108, -1.397393, -3.255115, 0, 1, 0.09411765, 1,
-0.3952196, 0.3167927, -0.5043927, 0, 1, 0.1019608, 1,
-0.3939013, 0.6411836, -0.8922367, 0, 1, 0.1058824, 1,
-0.393035, 0.06255329, -1.092708, 0, 1, 0.1137255, 1,
-0.3911002, -1.122942, -4.648094, 0, 1, 0.1176471, 1,
-0.3873728, 0.3780037, -0.2553672, 0, 1, 0.1254902, 1,
-0.3873235, 0.230399, -1.075721, 0, 1, 0.1294118, 1,
-0.3861107, 1.111635, -0.1152138, 0, 1, 0.1372549, 1,
-0.3803882, 0.4979567, -0.5187556, 0, 1, 0.1411765, 1,
-0.3791489, -0.381365, -2.498983, 0, 1, 0.1490196, 1,
-0.3769942, 2.076986, 1.401328, 0, 1, 0.1529412, 1,
-0.3726916, 0.4259845, -0.8556288, 0, 1, 0.1607843, 1,
-0.3725664, -2.938452, -2.771361, 0, 1, 0.1647059, 1,
-0.3691157, 2.514623, 0.12695, 0, 1, 0.172549, 1,
-0.3670647, -1.434471, -3.402061, 0, 1, 0.1764706, 1,
-0.3658569, 0.2987211, -1.971889, 0, 1, 0.1843137, 1,
-0.3629793, 0.5450477, -0.3709239, 0, 1, 0.1882353, 1,
-0.3628534, 1.319146, -0.1273661, 0, 1, 0.1960784, 1,
-0.3626628, -0.2094746, -2.875058, 0, 1, 0.2039216, 1,
-0.3602782, 0.1998836, -1.133974, 0, 1, 0.2078431, 1,
-0.3598121, -0.7010463, -0.5022568, 0, 1, 0.2156863, 1,
-0.3587621, -0.3172325, -2.36059, 0, 1, 0.2196078, 1,
-0.3562799, 0.7113673, 0.1654325, 0, 1, 0.227451, 1,
-0.3536782, 0.2519316, 0.1575964, 0, 1, 0.2313726, 1,
-0.352724, -1.30491, -3.247358, 0, 1, 0.2392157, 1,
-0.3513683, 1.449964, -0.3438053, 0, 1, 0.2431373, 1,
-0.3380099, 0.5633512, -2.98086, 0, 1, 0.2509804, 1,
-0.3292128, -1.193091, -2.103696, 0, 1, 0.254902, 1,
-0.3256077, -3.24122, -3.03726, 0, 1, 0.2627451, 1,
-0.3244545, 1.262052, -0.08341891, 0, 1, 0.2666667, 1,
-0.3198807, 1.602762, 0.2464425, 0, 1, 0.2745098, 1,
-0.3189463, -0.5757143, -4.223041, 0, 1, 0.2784314, 1,
-0.3173949, 0.3812138, -0.3640262, 0, 1, 0.2862745, 1,
-0.3161755, 0.9767782, -1.060707, 0, 1, 0.2901961, 1,
-0.3139607, -0.6326835, -3.383656, 0, 1, 0.2980392, 1,
-0.3137817, -0.1584105, -1.081345, 0, 1, 0.3058824, 1,
-0.3126332, 1.592927, 0.9866126, 0, 1, 0.3098039, 1,
-0.3124197, -1.584175, -2.103311, 0, 1, 0.3176471, 1,
-0.3106215, -2.003547, -1.013866, 0, 1, 0.3215686, 1,
-0.3104789, -1.243676, -1.319963, 0, 1, 0.3294118, 1,
-0.309326, -0.8161011, -1.486667, 0, 1, 0.3333333, 1,
-0.3084945, -0.5771916, -3.207303, 0, 1, 0.3411765, 1,
-0.3070823, 0.4475411, 0.2269314, 0, 1, 0.345098, 1,
-0.302946, 1.177392, 0.3920728, 0, 1, 0.3529412, 1,
-0.3025155, 0.9384353, 0.2481939, 0, 1, 0.3568628, 1,
-0.2965046, 0.3278394, 1.278392, 0, 1, 0.3647059, 1,
-0.2945279, -0.6470934, -4.706315, 0, 1, 0.3686275, 1,
-0.2792627, 0.1732965, -0.919167, 0, 1, 0.3764706, 1,
-0.2781513, -0.02661149, -1.574839, 0, 1, 0.3803922, 1,
-0.2769778, -1.583419, -3.720782, 0, 1, 0.3882353, 1,
-0.276172, 0.6582245, -1.601969, 0, 1, 0.3921569, 1,
-0.2756291, -0.5284885, -3.468567, 0, 1, 0.4, 1,
-0.2748208, -0.5065981, -3.384477, 0, 1, 0.4078431, 1,
-0.2741335, 1.026181, -0.1746276, 0, 1, 0.4117647, 1,
-0.2679851, -0.5513874, -2.864365, 0, 1, 0.4196078, 1,
-0.2659127, -0.04253277, -3.864584, 0, 1, 0.4235294, 1,
-0.2605179, -1.64674, -2.371437, 0, 1, 0.4313726, 1,
-0.2565445, -0.3223332, -2.183015, 0, 1, 0.4352941, 1,
-0.2560224, 0.1018248, 0.1065256, 0, 1, 0.4431373, 1,
-0.2550785, -0.6632463, -1.645693, 0, 1, 0.4470588, 1,
-0.2502882, 0.7581904, -2.087425, 0, 1, 0.454902, 1,
-0.2486131, 1.075059, 0.548851, 0, 1, 0.4588235, 1,
-0.2477518, -0.5955272, -3.734648, 0, 1, 0.4666667, 1,
-0.2471674, 2.514976, 0.8745235, 0, 1, 0.4705882, 1,
-0.2396096, -0.4431166, -3.218483, 0, 1, 0.4784314, 1,
-0.2386521, -2.394743, -0.9314747, 0, 1, 0.4823529, 1,
-0.2384697, -0.0008369266, -2.864549, 0, 1, 0.4901961, 1,
-0.2335271, 1.281568, 0.2832051, 0, 1, 0.4941176, 1,
-0.2333504, 1.271449, -0.4502242, 0, 1, 0.5019608, 1,
-0.2305643, -0.1630734, -0.9897346, 0, 1, 0.509804, 1,
-0.2265442, -0.7339866, -1.7547, 0, 1, 0.5137255, 1,
-0.2262079, 0.6564516, 0.3166495, 0, 1, 0.5215687, 1,
-0.2256012, -0.0375895, -3.229646, 0, 1, 0.5254902, 1,
-0.2239918, 0.9010787, -0.8518553, 0, 1, 0.5333334, 1,
-0.22352, -1.266315, -3.500508, 0, 1, 0.5372549, 1,
-0.2227389, -1.394364, -0.9688211, 0, 1, 0.5450981, 1,
-0.2217125, -0.8276953, -2.28625, 0, 1, 0.5490196, 1,
-0.2210629, 0.0974004, -1.224468, 0, 1, 0.5568628, 1,
-0.2192747, 1.616798, -1.838442, 0, 1, 0.5607843, 1,
-0.2186039, 0.7047996, -0.6466485, 0, 1, 0.5686275, 1,
-0.2179045, -0.7336767, -2.500169, 0, 1, 0.572549, 1,
-0.2155038, 1.344151, 1.703572, 0, 1, 0.5803922, 1,
-0.2119646, -0.09030862, -2.196444, 0, 1, 0.5843138, 1,
-0.2070669, 0.3751981, -1.25682, 0, 1, 0.5921569, 1,
-0.2056638, -1.08616, -3.097089, 0, 1, 0.5960785, 1,
-0.2054176, -0.5292817, -2.547647, 0, 1, 0.6039216, 1,
-0.2051508, -0.1966486, -1.280628, 0, 1, 0.6117647, 1,
-0.2036656, 0.4467943, -1.492279, 0, 1, 0.6156863, 1,
-0.197761, 1.002004, -1.547347, 0, 1, 0.6235294, 1,
-0.1923552, -0.984749, -1.921949, 0, 1, 0.627451, 1,
-0.1920264, -1.250797, -3.264896, 0, 1, 0.6352941, 1,
-0.1892579, -0.7655997, -2.578766, 0, 1, 0.6392157, 1,
-0.1880325, -0.3984704, -3.630155, 0, 1, 0.6470588, 1,
-0.1859096, 1.292644, 0.5641738, 0, 1, 0.6509804, 1,
-0.1835041, -1.156991, -3.583238, 0, 1, 0.6588235, 1,
-0.1827082, -0.6417526, -2.253237, 0, 1, 0.6627451, 1,
-0.1799776, -0.3166656, -0.3793916, 0, 1, 0.6705883, 1,
-0.1798311, 1.579623, -0.4374222, 0, 1, 0.6745098, 1,
-0.1755892, 2.101389, 0.7022083, 0, 1, 0.682353, 1,
-0.1737605, -0.8478302, -2.218772, 0, 1, 0.6862745, 1,
-0.1688033, 2.076755, 1.33627, 0, 1, 0.6941177, 1,
-0.1678521, 0.5491769, -0.3514002, 0, 1, 0.7019608, 1,
-0.1624945, 0.7641102, -1.212258, 0, 1, 0.7058824, 1,
-0.159427, 0.6444237, 1.576847, 0, 1, 0.7137255, 1,
-0.1563589, -0.2400928, -3.907676, 0, 1, 0.7176471, 1,
-0.1548757, 1.473853, 1.584693, 0, 1, 0.7254902, 1,
-0.1548472, 0.2751062, -1.656391, 0, 1, 0.7294118, 1,
-0.1525529, 0.3723099, 0.154752, 0, 1, 0.7372549, 1,
-0.1507135, 1.565316, 0.1764666, 0, 1, 0.7411765, 1,
-0.1495658, -0.6949657, -1.414505, 0, 1, 0.7490196, 1,
-0.1489, 0.5074277, -0.4966528, 0, 1, 0.7529412, 1,
-0.1470874, 1.955261, -1.633886, 0, 1, 0.7607843, 1,
-0.1447507, 1.39231, -0.8796976, 0, 1, 0.7647059, 1,
-0.1438218, 0.6450537, 1.255097, 0, 1, 0.772549, 1,
-0.1411615, -0.1067065, -1.587492, 0, 1, 0.7764706, 1,
-0.1358494, 0.3463627, -0.2181536, 0, 1, 0.7843137, 1,
-0.135241, 0.3705052, -0.1672031, 0, 1, 0.7882353, 1,
-0.1307981, -1.165008, -4.21456, 0, 1, 0.7960784, 1,
-0.1255419, 0.7644769, 0.2393549, 0, 1, 0.8039216, 1,
-0.1227931, -1.230206, -3.555449, 0, 1, 0.8078431, 1,
-0.1203802, 1.123993, 0.3429721, 0, 1, 0.8156863, 1,
-0.1195329, -1.744642, -1.286338, 0, 1, 0.8196079, 1,
-0.1146364, -0.05343901, -1.515379, 0, 1, 0.827451, 1,
-0.1146231, -0.759398, -3.39765, 0, 1, 0.8313726, 1,
-0.1113306, -0.7169217, -2.254185, 0, 1, 0.8392157, 1,
-0.1073437, 1.404095, -0.7232032, 0, 1, 0.8431373, 1,
-0.106607, 1.443559, -1.221775, 0, 1, 0.8509804, 1,
-0.09967022, 0.8631828, -1.637495, 0, 1, 0.854902, 1,
-0.0994642, 2.130146, -1.671746, 0, 1, 0.8627451, 1,
-0.09828926, 0.2461361, -0.8611271, 0, 1, 0.8666667, 1,
-0.08946554, 0.6026267, 1.117527, 0, 1, 0.8745098, 1,
-0.08938744, -0.8333722, -3.138591, 0, 1, 0.8784314, 1,
-0.0887828, -0.05976183, -0.3170006, 0, 1, 0.8862745, 1,
-0.08652448, 0.6013014, -0.2798504, 0, 1, 0.8901961, 1,
-0.08480373, -0.9429408, -2.432413, 0, 1, 0.8980392, 1,
-0.08387052, -1.2901, -1.933833, 0, 1, 0.9058824, 1,
-0.08121482, 0.07211141, -1.454085, 0, 1, 0.9098039, 1,
-0.07899246, -0.1295969, -2.924478, 0, 1, 0.9176471, 1,
-0.07596395, 1.179595, -1.668539, 0, 1, 0.9215686, 1,
-0.07301468, -0.4463696, -1.63754, 0, 1, 0.9294118, 1,
-0.06869479, 1.501974, 1.031865, 0, 1, 0.9333333, 1,
-0.06669573, 0.03697747, -1.509175, 0, 1, 0.9411765, 1,
-0.06655995, -0.9118538, -2.433209, 0, 1, 0.945098, 1,
-0.06082384, -0.1559468, -3.530627, 0, 1, 0.9529412, 1,
-0.0585541, 0.6274661, -0.6167073, 0, 1, 0.9568627, 1,
-0.05648729, -0.5327303, -3.186188, 0, 1, 0.9647059, 1,
-0.05472849, -0.5937265, -2.550198, 0, 1, 0.9686275, 1,
-0.05236487, -0.9570492, -3.254557, 0, 1, 0.9764706, 1,
-0.04812639, -0.5380387, -5.22068, 0, 1, 0.9803922, 1,
-0.04740083, -0.880419, -2.574031, 0, 1, 0.9882353, 1,
-0.04571398, -0.3123237, -2.766384, 0, 1, 0.9921569, 1,
-0.0414918, 0.6682388, 0.2522575, 0, 1, 1, 1,
-0.03907425, 0.5720641, 0.0008583537, 0, 0.9921569, 1, 1,
-0.0381631, 0.8103679, -1.455919, 0, 0.9882353, 1, 1,
-0.03662489, 0.5422117, -1.78415, 0, 0.9803922, 1, 1,
-0.03522304, -0.2228411, -1.46556, 0, 0.9764706, 1, 1,
-0.03035503, 1.116231, -0.8740863, 0, 0.9686275, 1, 1,
-0.02970718, 1.025351, -0.3841121, 0, 0.9647059, 1, 1,
-0.0283484, 1.931378, 1.343824, 0, 0.9568627, 1, 1,
-0.02682577, 1.30292, -0.1820135, 0, 0.9529412, 1, 1,
-0.0251222, -0.2110636, -4.457019, 0, 0.945098, 1, 1,
-0.01761472, 0.9834691, 1.212374, 0, 0.9411765, 1, 1,
-0.01420069, -0.2187485, -1.537666, 0, 0.9333333, 1, 1,
-0.01347976, 0.07298523, -0.2187648, 0, 0.9294118, 1, 1,
-0.01188787, 0.4395663, 1.334929, 0, 0.9215686, 1, 1,
-0.007970236, 0.535064, 0.1772785, 0, 0.9176471, 1, 1,
-0.006713724, -0.709562, -4.030293, 0, 0.9098039, 1, 1,
-0.001689179, -1.395579, -3.360506, 0, 0.9058824, 1, 1,
-0.0006935755, -0.1530003, -2.15967, 0, 0.8980392, 1, 1,
0.001487616, 0.4697402, -0.3725243, 0, 0.8901961, 1, 1,
0.008957685, -0.661307, 3.789029, 0, 0.8862745, 1, 1,
0.01554545, 2.360245, -0.05391993, 0, 0.8784314, 1, 1,
0.01719102, -0.6226302, 3.703576, 0, 0.8745098, 1, 1,
0.02120821, -0.05111483, 5.079398, 0, 0.8666667, 1, 1,
0.02572707, 1.412769, 0.6810637, 0, 0.8627451, 1, 1,
0.03155901, 0.3895352, 0.9185203, 0, 0.854902, 1, 1,
0.0386478, -0.90548, 3.024004, 0, 0.8509804, 1, 1,
0.03914373, -0.1780808, 2.02046, 0, 0.8431373, 1, 1,
0.04036532, -0.02161407, 3.635863, 0, 0.8392157, 1, 1,
0.04132644, -1.287852, 2.672273, 0, 0.8313726, 1, 1,
0.06109573, 0.135779, 1.869339, 0, 0.827451, 1, 1,
0.06210878, -0.3765457, 2.435583, 0, 0.8196079, 1, 1,
0.06762125, 0.5661125, -0.986267, 0, 0.8156863, 1, 1,
0.06930222, 0.043147, 1.662293, 0, 0.8078431, 1, 1,
0.07287045, 0.0578903, 1.067108, 0, 0.8039216, 1, 1,
0.0747878, 0.4264639, 0.4689706, 0, 0.7960784, 1, 1,
0.07509492, -0.3941896, 2.67193, 0, 0.7882353, 1, 1,
0.07643418, -0.1718144, 1.980323, 0, 0.7843137, 1, 1,
0.07670442, 0.005256792, -0.4827997, 0, 0.7764706, 1, 1,
0.08992738, -1.686176, 2.008643, 0, 0.772549, 1, 1,
0.08998112, -2.391772, 4.121044, 0, 0.7647059, 1, 1,
0.0935263, 2.235596, 0.1116358, 0, 0.7607843, 1, 1,
0.09490429, 0.9827268, -1.06145, 0, 0.7529412, 1, 1,
0.09510177, -1.392214, 3.88443, 0, 0.7490196, 1, 1,
0.09667165, -0.7362576, 2.142723, 0, 0.7411765, 1, 1,
0.09669916, 1.175199, -0.1629968, 0, 0.7372549, 1, 1,
0.09805249, 2.315425, -1.17772, 0, 0.7294118, 1, 1,
0.100597, -0.2124264, 3.277644, 0, 0.7254902, 1, 1,
0.1014537, 0.9303119, -0.861472, 0, 0.7176471, 1, 1,
0.1073743, 0.08108306, 0.8974361, 0, 0.7137255, 1, 1,
0.1098879, 1.759756, -0.5324783, 0, 0.7058824, 1, 1,
0.1221738, -0.6065143, 2.706386, 0, 0.6980392, 1, 1,
0.1241672, -0.01813984, 1.602262, 0, 0.6941177, 1, 1,
0.1293622, 0.4333835, -0.2124699, 0, 0.6862745, 1, 1,
0.1342582, 0.03602207, 1.067472, 0, 0.682353, 1, 1,
0.1357705, 0.04394691, 1.367881, 0, 0.6745098, 1, 1,
0.1364003, -0.3182355, 2.59277, 0, 0.6705883, 1, 1,
0.1415366, 2.310942, 1.981475, 0, 0.6627451, 1, 1,
0.1424931, 1.198459, -0.3872995, 0, 0.6588235, 1, 1,
0.1490749, -0.6367387, 4.167004, 0, 0.6509804, 1, 1,
0.1528502, -0.1074254, 2.446024, 0, 0.6470588, 1, 1,
0.1564717, -0.4341294, 3.631204, 0, 0.6392157, 1, 1,
0.1566834, 0.273574, 0.3832599, 0, 0.6352941, 1, 1,
0.1569089, -1.939888, 1.952415, 0, 0.627451, 1, 1,
0.1578253, 0.5900527, 0.06141097, 0, 0.6235294, 1, 1,
0.160822, 0.4606003, 0.5310631, 0, 0.6156863, 1, 1,
0.1633586, -0.1963495, 1.940577, 0, 0.6117647, 1, 1,
0.1665943, 1.089261, -0.8090698, 0, 0.6039216, 1, 1,
0.1694343, 0.5928607, 0.1526802, 0, 0.5960785, 1, 1,
0.1761822, -1.482239, 4.664816, 0, 0.5921569, 1, 1,
0.1776408, 0.4116923, 0.4287213, 0, 0.5843138, 1, 1,
0.1776971, 0.9740656, 1.215703, 0, 0.5803922, 1, 1,
0.1819907, 1.191779, 0.9577045, 0, 0.572549, 1, 1,
0.1833268, 1.141, -0.7501976, 0, 0.5686275, 1, 1,
0.1840323, 0.7674567, 0.7265144, 0, 0.5607843, 1, 1,
0.1869445, -0.108945, 1.95354, 0, 0.5568628, 1, 1,
0.1874633, 0.8639892, 0.0423957, 0, 0.5490196, 1, 1,
0.1885711, -1.566347, 1.767531, 0, 0.5450981, 1, 1,
0.1899862, 0.4155812, 0.09804552, 0, 0.5372549, 1, 1,
0.1903138, -2.475084, 3.27149, 0, 0.5333334, 1, 1,
0.1914073, 0.1632401, -0.1004941, 0, 0.5254902, 1, 1,
0.1988829, 0.6329302, 0.6078158, 0, 0.5215687, 1, 1,
0.1994485, 1.230239, 0.4874042, 0, 0.5137255, 1, 1,
0.205376, 0.3446298, -0.8569345, 0, 0.509804, 1, 1,
0.2083003, 0.8575279, -0.1459744, 0, 0.5019608, 1, 1,
0.2128687, 0.3849439, 0.546339, 0, 0.4941176, 1, 1,
0.215643, 0.5047486, 1.214141, 0, 0.4901961, 1, 1,
0.2178202, -1.129075, 2.285791, 0, 0.4823529, 1, 1,
0.2197741, -0.8316923, 4.38836, 0, 0.4784314, 1, 1,
0.2201404, 0.3148987, -0.3072209, 0, 0.4705882, 1, 1,
0.2212684, 0.6155221, -0.2889585, 0, 0.4666667, 1, 1,
0.2241812, -0.4154769, 1.833135, 0, 0.4588235, 1, 1,
0.2257659, 1.550601, 2.052797, 0, 0.454902, 1, 1,
0.228079, 0.7044306, -0.2053036, 0, 0.4470588, 1, 1,
0.2286354, 0.9599925, -0.09378409, 0, 0.4431373, 1, 1,
0.2339213, -0.8099069, 3.168465, 0, 0.4352941, 1, 1,
0.2383282, 0.3863179, -1.458535, 0, 0.4313726, 1, 1,
0.2394733, -0.8234174, 3.819067, 0, 0.4235294, 1, 1,
0.2416803, 0.4286881, 0.83568, 0, 0.4196078, 1, 1,
0.2417546, 0.1919174, -0.1771475, 0, 0.4117647, 1, 1,
0.2500507, -0.08337123, 2.537919, 0, 0.4078431, 1, 1,
0.2509669, -0.5960881, 2.705942, 0, 0.4, 1, 1,
0.2563863, 0.3923284, 1.445485, 0, 0.3921569, 1, 1,
0.2615987, -0.008001251, 0.2167113, 0, 0.3882353, 1, 1,
0.2695988, -0.5462986, 1.819521, 0, 0.3803922, 1, 1,
0.2704778, 1.472654, 0.7100217, 0, 0.3764706, 1, 1,
0.2705542, -1.572488, 4.111709, 0, 0.3686275, 1, 1,
0.2796604, -0.5815574, 2.50613, 0, 0.3647059, 1, 1,
0.2846007, -1.187544, 2.084101, 0, 0.3568628, 1, 1,
0.2885812, -1.260902, 1.669115, 0, 0.3529412, 1, 1,
0.2906516, -1.220853, 2.994476, 0, 0.345098, 1, 1,
0.2913087, -1.959153, 4.068589, 0, 0.3411765, 1, 1,
0.2929469, 0.7883152, 1.435727, 0, 0.3333333, 1, 1,
0.2929678, -2.14461, 3.472717, 0, 0.3294118, 1, 1,
0.2953902, -1.334339, 1.911656, 0, 0.3215686, 1, 1,
0.2969156, -1.469645, 1.798455, 0, 0.3176471, 1, 1,
0.2979715, 0.1698821, 0.5122629, 0, 0.3098039, 1, 1,
0.3056589, 0.1676223, 1.202713, 0, 0.3058824, 1, 1,
0.306693, -1.199489, 2.99754, 0, 0.2980392, 1, 1,
0.3134326, 0.2986438, 2.553988, 0, 0.2901961, 1, 1,
0.315513, 0.08691771, 3.029421, 0, 0.2862745, 1, 1,
0.3189269, -0.5112499, 1.448121, 0, 0.2784314, 1, 1,
0.3201014, 1.102935, 2.31764, 0, 0.2745098, 1, 1,
0.3219613, -0.3115648, 1.900232, 0, 0.2666667, 1, 1,
0.3223505, -0.05088349, 0.5226988, 0, 0.2627451, 1, 1,
0.3252325, -1.657039, 2.507402, 0, 0.254902, 1, 1,
0.3265981, -0.937653, 3.414027, 0, 0.2509804, 1, 1,
0.3272752, 0.595742, -0.07584225, 0, 0.2431373, 1, 1,
0.3286286, 0.2647735, -1.037689, 0, 0.2392157, 1, 1,
0.3320209, 0.8851743, 0.4429958, 0, 0.2313726, 1, 1,
0.3325197, 0.1675347, 1.913798, 0, 0.227451, 1, 1,
0.3325311, -0.2921364, 1.869711, 0, 0.2196078, 1, 1,
0.3383479, -0.8875902, 1.676224, 0, 0.2156863, 1, 1,
0.3391908, -1.201538, 4.842521, 0, 0.2078431, 1, 1,
0.3420577, -1.443886, 3.30977, 0, 0.2039216, 1, 1,
0.3444649, -0.3728646, 1.54523, 0, 0.1960784, 1, 1,
0.3452663, -0.7495112, 2.021436, 0, 0.1882353, 1, 1,
0.3501476, 2.924751, -1.310009, 0, 0.1843137, 1, 1,
0.3516688, -1.19366, 4.318613, 0, 0.1764706, 1, 1,
0.3534389, -2.305151, 2.469483, 0, 0.172549, 1, 1,
0.3599134, 0.4667798, 0.2536871, 0, 0.1647059, 1, 1,
0.3627056, 0.8777221, 1.399172, 0, 0.1607843, 1, 1,
0.3634468, -1.508863, 4.424077, 0, 0.1529412, 1, 1,
0.3680505, -0.3911005, 2.98997, 0, 0.1490196, 1, 1,
0.3694574, 0.6536784, 0.9563909, 0, 0.1411765, 1, 1,
0.369883, -1.211441, 3.333696, 0, 0.1372549, 1, 1,
0.3722036, -0.8622843, 3.381828, 0, 0.1294118, 1, 1,
0.3740483, -0.2397317, 0.5826627, 0, 0.1254902, 1, 1,
0.374505, -0.9361991, 2.454069, 0, 0.1176471, 1, 1,
0.3757791, -0.04069713, 1.867772, 0, 0.1137255, 1, 1,
0.3773106, 0.3753635, 0.2180057, 0, 0.1058824, 1, 1,
0.3793202, 2.046806, 1.383882, 0, 0.09803922, 1, 1,
0.3813622, 0.1860421, -0.7425488, 0, 0.09411765, 1, 1,
0.3869, -0.3410925, 3.150696, 0, 0.08627451, 1, 1,
0.387941, 0.2517539, -0.1607063, 0, 0.08235294, 1, 1,
0.3912588, 2.25236, 1.267639, 0, 0.07450981, 1, 1,
0.3942623, 0.08765321, 1.333897, 0, 0.07058824, 1, 1,
0.4034688, -3.347453, 2.47041, 0, 0.0627451, 1, 1,
0.4087055, 0.2421391, -0.4133062, 0, 0.05882353, 1, 1,
0.4114253, 0.007288889, 2.175293, 0, 0.05098039, 1, 1,
0.4117989, 0.4776357, 1.218428, 0, 0.04705882, 1, 1,
0.412012, -0.1471915, 0.06804798, 0, 0.03921569, 1, 1,
0.4126339, -1.179154, 4.040005, 0, 0.03529412, 1, 1,
0.4134197, 0.7468298, 1.22738, 0, 0.02745098, 1, 1,
0.4178353, 0.1278895, 0.6520235, 0, 0.02352941, 1, 1,
0.4185458, 0.3183978, 1.412734, 0, 0.01568628, 1, 1,
0.4208588, 1.754919, 0.2589785, 0, 0.01176471, 1, 1,
0.4217544, 0.007934236, 0.4894839, 0, 0.003921569, 1, 1,
0.423479, -0.7068857, 1.996027, 0.003921569, 0, 1, 1,
0.4238307, 0.2077879, -0.8971437, 0.007843138, 0, 1, 1,
0.4242996, 0.7759916, 0.7484195, 0.01568628, 0, 1, 1,
0.4269375, 0.3685915, 0.8409607, 0.01960784, 0, 1, 1,
0.4423807, -0.6532918, 1.865827, 0.02745098, 0, 1, 1,
0.4425322, 0.9270927, 0.2958219, 0.03137255, 0, 1, 1,
0.4437318, -0.7502507, 2.02819, 0.03921569, 0, 1, 1,
0.4469214, -0.3706021, 0.9342687, 0.04313726, 0, 1, 1,
0.4485312, 0.01456112, 0.2434107, 0.05098039, 0, 1, 1,
0.453431, 0.6288047, 1.64212, 0.05490196, 0, 1, 1,
0.4550143, 0.9348361, 0.6799024, 0.0627451, 0, 1, 1,
0.4555431, -0.6386207, 0.6736718, 0.06666667, 0, 1, 1,
0.4608422, 1.497821, -0.5216449, 0.07450981, 0, 1, 1,
0.4632086, 0.3526613, 0.404254, 0.07843138, 0, 1, 1,
0.4640157, 0.1991636, 1.28723, 0.08627451, 0, 1, 1,
0.4660099, 0.8222294, 0.4477407, 0.09019608, 0, 1, 1,
0.466486, 0.08362444, 4.024369, 0.09803922, 0, 1, 1,
0.4665231, 1.445255, 0.09346254, 0.1058824, 0, 1, 1,
0.4681342, -1.397492, 3.23433, 0.1098039, 0, 1, 1,
0.4710899, -0.158638, 1.346247, 0.1176471, 0, 1, 1,
0.4711191, 1.027833, -0.6525025, 0.1215686, 0, 1, 1,
0.4753165, 1.203876, 1.868462, 0.1294118, 0, 1, 1,
0.4787604, -1.050507, 2.866709, 0.1333333, 0, 1, 1,
0.4854413, -1.116794, 3.829442, 0.1411765, 0, 1, 1,
0.4860462, -0.8441802, 1.872945, 0.145098, 0, 1, 1,
0.4864761, -0.7504234, 2.675046, 0.1529412, 0, 1, 1,
0.4865654, 0.6717527, 2.095358, 0.1568628, 0, 1, 1,
0.4915096, 1.420598, 1.034612, 0.1647059, 0, 1, 1,
0.4922611, 0.6149234, 0.7955285, 0.1686275, 0, 1, 1,
0.5026939, -0.3035578, 1.88193, 0.1764706, 0, 1, 1,
0.5055802, 0.3945184, 0.3026684, 0.1803922, 0, 1, 1,
0.5059345, 0.3084948, -0.3783451, 0.1882353, 0, 1, 1,
0.507174, 0.117801, 1.519471, 0.1921569, 0, 1, 1,
0.5075639, -0.6953296, 2.480631, 0.2, 0, 1, 1,
0.5082682, -0.6686066, 2.468381, 0.2078431, 0, 1, 1,
0.5094263, -0.7709049, 4.370861, 0.2117647, 0, 1, 1,
0.5107322, -0.3418088, 1.353988, 0.2196078, 0, 1, 1,
0.5112804, 0.5688474, 1.321324, 0.2235294, 0, 1, 1,
0.5122288, 0.9225278, 0.3185918, 0.2313726, 0, 1, 1,
0.5140998, -1.755512, 3.207923, 0.2352941, 0, 1, 1,
0.5176099, 1.153747, -0.008577048, 0.2431373, 0, 1, 1,
0.5184331, 0.7116662, 0.7673534, 0.2470588, 0, 1, 1,
0.5196199, 0.5253443, 1.952531, 0.254902, 0, 1, 1,
0.5270978, -0.3405142, 2.747863, 0.2588235, 0, 1, 1,
0.5286473, -0.6203383, 1.819711, 0.2666667, 0, 1, 1,
0.5304974, 0.5765654, -1.105932, 0.2705882, 0, 1, 1,
0.5319737, 0.9123123, 0.4879019, 0.2784314, 0, 1, 1,
0.5451492, -0.7088684, 3.385649, 0.282353, 0, 1, 1,
0.5459678, -0.08153876, 2.465351, 0.2901961, 0, 1, 1,
0.5480492, 0.466972, 0.8703699, 0.2941177, 0, 1, 1,
0.5489373, -0.5365461, 2.105357, 0.3019608, 0, 1, 1,
0.5490834, 0.6441242, 1.577314, 0.3098039, 0, 1, 1,
0.5538825, -0.595428, 1.97337, 0.3137255, 0, 1, 1,
0.5542592, 0.5009784, 1.330472, 0.3215686, 0, 1, 1,
0.5588377, 0.5756801, 0.2408207, 0.3254902, 0, 1, 1,
0.567062, -0.08671793, 0.9809621, 0.3333333, 0, 1, 1,
0.5675436, 0.7292292, 2.577116, 0.3372549, 0, 1, 1,
0.5705817, -2.570903, 1.67869, 0.345098, 0, 1, 1,
0.5765369, -0.6184279, 3.576361, 0.3490196, 0, 1, 1,
0.5768974, -0.7273457, 2.518139, 0.3568628, 0, 1, 1,
0.5802347, -1.28183, 4.560053, 0.3607843, 0, 1, 1,
0.5825246, 2.099233, 1.149713, 0.3686275, 0, 1, 1,
0.5852655, -0.6383433, 2.377512, 0.372549, 0, 1, 1,
0.5885559, -0.02038044, 3.460202, 0.3803922, 0, 1, 1,
0.5912129, 1.926105, 1.418947, 0.3843137, 0, 1, 1,
0.5924689, 0.1245303, 0.885417, 0.3921569, 0, 1, 1,
0.592945, -1.529095, 2.273933, 0.3960784, 0, 1, 1,
0.5970966, 0.001845424, 1.561329, 0.4039216, 0, 1, 1,
0.5983438, -1.085087, 2.143928, 0.4117647, 0, 1, 1,
0.6063646, -0.6387225, 2.766617, 0.4156863, 0, 1, 1,
0.6129214, 0.5378246, 1.716416, 0.4235294, 0, 1, 1,
0.6130227, -2.461307, 2.485133, 0.427451, 0, 1, 1,
0.6185808, -0.5567726, 0.8486489, 0.4352941, 0, 1, 1,
0.6192355, 0.6030446, 0.6369011, 0.4392157, 0, 1, 1,
0.6276919, -0.5514877, 2.584374, 0.4470588, 0, 1, 1,
0.6284252, -0.5602598, 2.568159, 0.4509804, 0, 1, 1,
0.6328736, 0.361153, 0.802192, 0.4588235, 0, 1, 1,
0.6353707, 0.1354286, 1.059079, 0.4627451, 0, 1, 1,
0.6375026, 0.01727541, 1.517777, 0.4705882, 0, 1, 1,
0.6395776, -0.1873698, 0.5806501, 0.4745098, 0, 1, 1,
0.6426819, 0.5585117, 0.02095894, 0.4823529, 0, 1, 1,
0.6430811, 0.7017735, 2.200196, 0.4862745, 0, 1, 1,
0.6487767, -0.5299804, 2.275555, 0.4941176, 0, 1, 1,
0.6532285, 1.359521, -0.6401712, 0.5019608, 0, 1, 1,
0.6567038, 0.4558347, -0.3741083, 0.5058824, 0, 1, 1,
0.6572285, 0.1064101, 1.615907, 0.5137255, 0, 1, 1,
0.6613255, -0.4794038, 3.034803, 0.5176471, 0, 1, 1,
0.6630228, 0.3042043, 2.02363, 0.5254902, 0, 1, 1,
0.6643054, 0.3703755, 0.6245748, 0.5294118, 0, 1, 1,
0.6721601, -0.8106181, 1.280322, 0.5372549, 0, 1, 1,
0.672425, 0.6501275, -0.9518676, 0.5411765, 0, 1, 1,
0.6739877, -2.00868, 2.431325, 0.5490196, 0, 1, 1,
0.6749979, -0.05721339, 3.391824, 0.5529412, 0, 1, 1,
0.6754612, 0.7196052, 0.3649779, 0.5607843, 0, 1, 1,
0.6789023, -1.429738, 2.619698, 0.5647059, 0, 1, 1,
0.67959, 0.4893436, 1.451041, 0.572549, 0, 1, 1,
0.6861179, 0.9264036, 0.02378675, 0.5764706, 0, 1, 1,
0.6897553, 0.2708502, -0.8096116, 0.5843138, 0, 1, 1,
0.698886, 1.416461, 0.7643641, 0.5882353, 0, 1, 1,
0.7035016, 0.6700504, 0.7534277, 0.5960785, 0, 1, 1,
0.7081985, 0.682687, 1.826453, 0.6039216, 0, 1, 1,
0.7091759, -0.9725461, 3.613303, 0.6078432, 0, 1, 1,
0.7127094, -1.61286, 1.706679, 0.6156863, 0, 1, 1,
0.7137467, -0.8270548, 2.49391, 0.6196079, 0, 1, 1,
0.7145894, -1.349567, 2.846766, 0.627451, 0, 1, 1,
0.716293, 0.1424146, 1.975328, 0.6313726, 0, 1, 1,
0.7186962, 1.409032, 1.16946, 0.6392157, 0, 1, 1,
0.7204493, -0.1662989, 2.457992, 0.6431373, 0, 1, 1,
0.7382834, -1.809031, 3.622168, 0.6509804, 0, 1, 1,
0.7396279, -0.1634229, 2.275428, 0.654902, 0, 1, 1,
0.7425038, -0.134864, 2.360316, 0.6627451, 0, 1, 1,
0.750231, -0.8919411, 1.271456, 0.6666667, 0, 1, 1,
0.75071, 1.024459, -0.5796372, 0.6745098, 0, 1, 1,
0.7510067, -2.120895, 3.987514, 0.6784314, 0, 1, 1,
0.76849, 0.2615258, 1.787926, 0.6862745, 0, 1, 1,
0.7768802, 0.6643347, 0.4588119, 0.6901961, 0, 1, 1,
0.7838407, -1.568947, 5.269833, 0.6980392, 0, 1, 1,
0.7849363, 0.4216806, 2.416003, 0.7058824, 0, 1, 1,
0.7883084, 2.159325, 1.164162, 0.7098039, 0, 1, 1,
0.7901139, 1.684489, 0.9883013, 0.7176471, 0, 1, 1,
0.7925928, 0.3950642, 1.188751, 0.7215686, 0, 1, 1,
0.7944241, -1.80132, 4.278393, 0.7294118, 0, 1, 1,
0.8067338, 0.1610486, 0.6808004, 0.7333333, 0, 1, 1,
0.8075987, 0.3792935, 1.764318, 0.7411765, 0, 1, 1,
0.8101686, -1.984747, 2.086093, 0.7450981, 0, 1, 1,
0.8143846, 0.2385984, 1.854641, 0.7529412, 0, 1, 1,
0.8221602, 0.4249933, -0.7332233, 0.7568628, 0, 1, 1,
0.8231317, 0.8703228, 2.273938, 0.7647059, 0, 1, 1,
0.823543, 0.476594, 1.164565, 0.7686275, 0, 1, 1,
0.8312384, 0.5960118, 1.735318, 0.7764706, 0, 1, 1,
0.831809, -0.7657309, 1.755704, 0.7803922, 0, 1, 1,
0.8351526, 2.796417, 0.7378623, 0.7882353, 0, 1, 1,
0.8353549, -0.8007822, 1.998512, 0.7921569, 0, 1, 1,
0.8416354, -1.497652, 2.532396, 0.8, 0, 1, 1,
0.8422698, -0.02306045, 1.910293, 0.8078431, 0, 1, 1,
0.8423669, 0.2934232, 2.148638, 0.8117647, 0, 1, 1,
0.8453627, 0.8803726, 0.9950557, 0.8196079, 0, 1, 1,
0.8460737, 0.4994147, 0.7233153, 0.8235294, 0, 1, 1,
0.8461037, 1.097007, 0.4870579, 0.8313726, 0, 1, 1,
0.8495974, 0.5821673, 2.321475, 0.8352941, 0, 1, 1,
0.8569154, 0.7249066, 1.729266, 0.8431373, 0, 1, 1,
0.8774416, -0.2582138, 1.010912, 0.8470588, 0, 1, 1,
0.8783188, 1.268193, 1.260306, 0.854902, 0, 1, 1,
0.8851544, -0.05903299, -0.6353574, 0.8588235, 0, 1, 1,
0.9025024, -0.8653297, 1.427521, 0.8666667, 0, 1, 1,
0.9043409, 0.2550089, 2.117432, 0.8705882, 0, 1, 1,
0.905705, 1.136765, 1.524851, 0.8784314, 0, 1, 1,
0.908996, 1.477871, 1.113744, 0.8823529, 0, 1, 1,
0.9091601, 0.2408919, 0.5717725, 0.8901961, 0, 1, 1,
0.9096169, -0.6427096, 1.236278, 0.8941177, 0, 1, 1,
0.9160493, -0.3133832, 0.9297526, 0.9019608, 0, 1, 1,
0.9240531, -0.7813642, 1.868627, 0.9098039, 0, 1, 1,
0.9298649, 0.8776945, 0.6801549, 0.9137255, 0, 1, 1,
0.9311089, -0.2670414, 2.95499, 0.9215686, 0, 1, 1,
0.9357422, 0.9134246, 0.2000045, 0.9254902, 0, 1, 1,
0.9361789, -0.1187978, 1.831636, 0.9333333, 0, 1, 1,
0.9394673, -0.3393408, 1.735962, 0.9372549, 0, 1, 1,
0.9424034, -0.6940482, 2.621259, 0.945098, 0, 1, 1,
0.9429113, 1.711097, -0.5517443, 0.9490196, 0, 1, 1,
0.9529876, -0.1170001, 0.613271, 0.9568627, 0, 1, 1,
0.9547418, -0.544929, 3.563775, 0.9607843, 0, 1, 1,
0.9675225, 0.1752487, 1.212649, 0.9686275, 0, 1, 1,
0.9704425, 0.1332256, 0.6320667, 0.972549, 0, 1, 1,
0.9722229, 1.007062, 1.298246, 0.9803922, 0, 1, 1,
0.9889688, 1.320154, 2.280478, 0.9843137, 0, 1, 1,
0.9961299, -0.4715042, 1.444217, 0.9921569, 0, 1, 1,
1.004976, 0.9957016, -0.2305205, 0.9960784, 0, 1, 1,
1.005568, -0.789117, 0.669765, 1, 0, 0.9960784, 1,
1.012557, 0.2916167, -0.09742565, 1, 0, 0.9882353, 1,
1.012584, 0.6434032, 0.1658045, 1, 0, 0.9843137, 1,
1.017729, -0.06624483, 1.047095, 1, 0, 0.9764706, 1,
1.018485, -0.2107106, 2.587282, 1, 0, 0.972549, 1,
1.020055, -1.004312, 1.951913, 1, 0, 0.9647059, 1,
1.021163, -1.554181, 0.8351167, 1, 0, 0.9607843, 1,
1.021508, -0.9355149, 1.428155, 1, 0, 0.9529412, 1,
1.033051, 0.3425201, 1.609048, 1, 0, 0.9490196, 1,
1.035873, -0.4243238, 3.374528, 1, 0, 0.9411765, 1,
1.039096, -0.4031991, 3.457707, 1, 0, 0.9372549, 1,
1.042213, -0.131436, 2.022076, 1, 0, 0.9294118, 1,
1.042493, 0.3553112, 0.7736799, 1, 0, 0.9254902, 1,
1.042575, -0.6555258, 1.382582, 1, 0, 0.9176471, 1,
1.045542, 0.713897, 0.690921, 1, 0, 0.9137255, 1,
1.054116, 0.4553132, 0.2819949, 1, 0, 0.9058824, 1,
1.055484, 0.4063533, 0.7994559, 1, 0, 0.9019608, 1,
1.057005, -0.5333828, 4.888329, 1, 0, 0.8941177, 1,
1.062475, -0.3276625, 1.554628, 1, 0, 0.8862745, 1,
1.067723, 0.3006766, 2.788101, 1, 0, 0.8823529, 1,
1.070565, 1.037449, -0.5373945, 1, 0, 0.8745098, 1,
1.07749, -1.253961, 1.073905, 1, 0, 0.8705882, 1,
1.080948, -1.211116, 4.465867, 1, 0, 0.8627451, 1,
1.082314, -0.252747, 1.798648, 1, 0, 0.8588235, 1,
1.086836, 1.873082, 0.7959044, 1, 0, 0.8509804, 1,
1.09282, -0.9865952, 1.686976, 1, 0, 0.8470588, 1,
1.095045, -0.05583144, 2.716432, 1, 0, 0.8392157, 1,
1.108618, 0.4283401, 0.1579657, 1, 0, 0.8352941, 1,
1.118627, -1.338567, 1.206772, 1, 0, 0.827451, 1,
1.119566, -0.7657139, 1.772583, 1, 0, 0.8235294, 1,
1.120545, -2.258186, 2.432384, 1, 0, 0.8156863, 1,
1.122217, 0.4264907, 1.80938, 1, 0, 0.8117647, 1,
1.138449, -1.005434, 2.352019, 1, 0, 0.8039216, 1,
1.140373, -1.664226, 2.12832, 1, 0, 0.7960784, 1,
1.140813, 1.541649, 0.809639, 1, 0, 0.7921569, 1,
1.141412, 0.9750984, 2.806325, 1, 0, 0.7843137, 1,
1.141895, -0.9952794, 1.280135, 1, 0, 0.7803922, 1,
1.146843, -0.8010524, 3.91384, 1, 0, 0.772549, 1,
1.147582, -1.373093, 2.402973, 1, 0, 0.7686275, 1,
1.155698, 0.117634, 1.853499, 1, 0, 0.7607843, 1,
1.161469, -0.6149361, 0.5962299, 1, 0, 0.7568628, 1,
1.168517, -0.5170819, 2.062943, 1, 0, 0.7490196, 1,
1.169136, 0.5092171, 1.125168, 1, 0, 0.7450981, 1,
1.180638, 0.4958031, 2.321665, 1, 0, 0.7372549, 1,
1.180893, 1.029625, 0.783681, 1, 0, 0.7333333, 1,
1.183489, 0.1221493, 0.8483675, 1, 0, 0.7254902, 1,
1.184064, -1.052295, 2.368049, 1, 0, 0.7215686, 1,
1.18763, 0.3609045, 1.301739, 1, 0, 0.7137255, 1,
1.188408, 0.04184351, 2.898429, 1, 0, 0.7098039, 1,
1.189754, -1.736829, 2.935814, 1, 0, 0.7019608, 1,
1.200096, -1.626825, 3.824952, 1, 0, 0.6941177, 1,
1.203668, -1.108583, 2.474064, 1, 0, 0.6901961, 1,
1.208427, -2.163751, 2.990854, 1, 0, 0.682353, 1,
1.212145, -0.6107739, -0.1001829, 1, 0, 0.6784314, 1,
1.212965, -0.01942616, 2.003585, 1, 0, 0.6705883, 1,
1.212968, 0.132026, 2.772372, 1, 0, 0.6666667, 1,
1.213926, -0.5254067, 3.223557, 1, 0, 0.6588235, 1,
1.231499, 1.262638, 0.8006796, 1, 0, 0.654902, 1,
1.231621, 0.8038642, 2.031805, 1, 0, 0.6470588, 1,
1.241259, -1.423185, 1.319083, 1, 0, 0.6431373, 1,
1.250932, -0.1569312, 1.230223, 1, 0, 0.6352941, 1,
1.253459, 0.3240187, 2.813029, 1, 0, 0.6313726, 1,
1.263303, -0.1105975, 2.512664, 1, 0, 0.6235294, 1,
1.286954, -0.2182683, 2.139688, 1, 0, 0.6196079, 1,
1.300295, -0.511456, 2.005641, 1, 0, 0.6117647, 1,
1.314233, -0.307355, 2.782124, 1, 0, 0.6078432, 1,
1.315175, 2.001035, 0.9312007, 1, 0, 0.6, 1,
1.320196, 0.9425734, 0.7388264, 1, 0, 0.5921569, 1,
1.323804, 1.181191, 2.660303, 1, 0, 0.5882353, 1,
1.33913, 0.6943841, 0.5872638, 1, 0, 0.5803922, 1,
1.35262, 0.9475683, 0.03165949, 1, 0, 0.5764706, 1,
1.353972, 1.541101, 0.8427538, 1, 0, 0.5686275, 1,
1.36179, -0.03488216, 2.40133, 1, 0, 0.5647059, 1,
1.363123, 0.9945783, 0.6803179, 1, 0, 0.5568628, 1,
1.368801, -0.2959954, 1.385496, 1, 0, 0.5529412, 1,
1.369323, -0.9553654, 2.871605, 1, 0, 0.5450981, 1,
1.384729, -0.535702, 3.607275, 1, 0, 0.5411765, 1,
1.387728, -0.8813491, 1.729311, 1, 0, 0.5333334, 1,
1.395702, -1.398454, 3.087391, 1, 0, 0.5294118, 1,
1.423931, -0.5604602, 1.50597, 1, 0, 0.5215687, 1,
1.424797, 0.8928433, 0.2091857, 1, 0, 0.5176471, 1,
1.428083, 1.679659, 0.3478225, 1, 0, 0.509804, 1,
1.430744, -0.5257018, 3.115083, 1, 0, 0.5058824, 1,
1.433286, 0.7920893, 0.4398005, 1, 0, 0.4980392, 1,
1.447874, -0.891284, 2.922876, 1, 0, 0.4901961, 1,
1.450435, -1.698246, 3.097951, 1, 0, 0.4862745, 1,
1.451328, 0.5177764, 2.192505, 1, 0, 0.4784314, 1,
1.456101, 0.5745696, 0.8653961, 1, 0, 0.4745098, 1,
1.456612, 1.078452, 0.1353554, 1, 0, 0.4666667, 1,
1.460463, -0.3795294, 2.282353, 1, 0, 0.4627451, 1,
1.468837, 0.1788721, 2.109629, 1, 0, 0.454902, 1,
1.470563, 1.519754, 0.6409061, 1, 0, 0.4509804, 1,
1.475721, -0.4140444, 2.310832, 1, 0, 0.4431373, 1,
1.478826, 0.4727154, 2.281887, 1, 0, 0.4392157, 1,
1.485748, 1.014107, 2.95959, 1, 0, 0.4313726, 1,
1.494468, 0.4152642, 0.1239569, 1, 0, 0.427451, 1,
1.496849, -1.435768, 2.998844, 1, 0, 0.4196078, 1,
1.508913, 1.022859, 2.492625, 1, 0, 0.4156863, 1,
1.512979, -2.272564, 3.832123, 1, 0, 0.4078431, 1,
1.514439, -0.2268252, 2.344434, 1, 0, 0.4039216, 1,
1.524891, -0.9777091, 3.23393, 1, 0, 0.3960784, 1,
1.53653, 0.6914532, 0.8730282, 1, 0, 0.3882353, 1,
1.550645, 1.872238, -0.5131435, 1, 0, 0.3843137, 1,
1.564049, -0.9894472, 2.031352, 1, 0, 0.3764706, 1,
1.585089, 0.9702488, 2.182132, 1, 0, 0.372549, 1,
1.608312, -0.3366757, 4.172853, 1, 0, 0.3647059, 1,
1.616455, -0.1866957, 1.670229, 1, 0, 0.3607843, 1,
1.619233, 0.5468197, 2.571886, 1, 0, 0.3529412, 1,
1.651541, -0.494837, 3.044777, 1, 0, 0.3490196, 1,
1.675237, 1.023081, 2.147407, 1, 0, 0.3411765, 1,
1.680804, -0.9740145, 1.402978, 1, 0, 0.3372549, 1,
1.686709, -1.108075, 2.558596, 1, 0, 0.3294118, 1,
1.699223, -0.3465225, 1.296753, 1, 0, 0.3254902, 1,
1.71304, 0.4685633, 2.005888, 1, 0, 0.3176471, 1,
1.715057, 1.2526, -0.9295418, 1, 0, 0.3137255, 1,
1.731855, -0.2075245, 1.869982, 1, 0, 0.3058824, 1,
1.742182, -0.8569422, 2.975426, 1, 0, 0.2980392, 1,
1.757219, 0.2373057, 2.729754, 1, 0, 0.2941177, 1,
1.766405, 0.5643157, 1.324157, 1, 0, 0.2862745, 1,
1.776643, -1.81678, 4.373031, 1, 0, 0.282353, 1,
1.793956, -0.5229141, 3.238128, 1, 0, 0.2745098, 1,
1.799273, -0.5111462, 0.683956, 1, 0, 0.2705882, 1,
1.803923, -0.2172721, 0.5399236, 1, 0, 0.2627451, 1,
1.818715, 0.7969099, 2.402485, 1, 0, 0.2588235, 1,
1.826047, 0.05449024, 1.177187, 1, 0, 0.2509804, 1,
1.840148, -0.04214888, 1.673734, 1, 0, 0.2470588, 1,
1.842642, -0.3182648, 0.6116618, 1, 0, 0.2392157, 1,
1.856271, 1.449828, -0.182432, 1, 0, 0.2352941, 1,
1.893829, 1.788879, 1.608865, 1, 0, 0.227451, 1,
1.907337, -0.3900634, 2.343604, 1, 0, 0.2235294, 1,
1.919655, 0.5257784, 2.581841, 1, 0, 0.2156863, 1,
1.921349, -0.8913954, 1.252676, 1, 0, 0.2117647, 1,
1.929767, 0.7784982, 0.4104193, 1, 0, 0.2039216, 1,
1.950605, 0.3656331, 0.3685687, 1, 0, 0.1960784, 1,
1.961137, 0.5094177, 1.201088, 1, 0, 0.1921569, 1,
1.975122, 1.741414, 1.364165, 1, 0, 0.1843137, 1,
1.99229, 3.242161, 0.8043658, 1, 0, 0.1803922, 1,
1.996611, 0.365696, 1.304348, 1, 0, 0.172549, 1,
2.019096, 1.214459, 0.08211358, 1, 0, 0.1686275, 1,
2.09869, 1.135521, 1.30588, 1, 0, 0.1607843, 1,
2.10868, -0.3254579, 1.648242, 1, 0, 0.1568628, 1,
2.150558, 1.86428, 0.1054542, 1, 0, 0.1490196, 1,
2.156186, -0.1651422, 0.3625202, 1, 0, 0.145098, 1,
2.159767, -1.231516, 2.125576, 1, 0, 0.1372549, 1,
2.171554, 1.462601, 0.8147004, 1, 0, 0.1333333, 1,
2.182094, 0.06125546, 1.242856, 1, 0, 0.1254902, 1,
2.19579, -0.4804619, 3.349874, 1, 0, 0.1215686, 1,
2.200322, -1.290683, 2.572901, 1, 0, 0.1137255, 1,
2.260696, 1.334447, 1.269831, 1, 0, 0.1098039, 1,
2.283282, -1.747274, 2.307223, 1, 0, 0.1019608, 1,
2.309357, 0.1339899, 1.027582, 1, 0, 0.09411765, 1,
2.309852, 0.6124581, 0.8210112, 1, 0, 0.09019608, 1,
2.328086, 0.9104391, 2.640474, 1, 0, 0.08235294, 1,
2.41814, 0.9715191, -0.6099759, 1, 0, 0.07843138, 1,
2.438196, 0.3990707, 1.596474, 1, 0, 0.07058824, 1,
2.451485, -0.9345574, 3.224567, 1, 0, 0.06666667, 1,
2.460541, 0.5201141, 1.744258, 1, 0, 0.05882353, 1,
2.470355, -0.3667195, 1.298847, 1, 0, 0.05490196, 1,
2.622329, -0.1356526, 1.328671, 1, 0, 0.04705882, 1,
2.679601, -0.4635566, 1.083404, 1, 0, 0.04313726, 1,
2.723762, -0.5831571, 3.094497, 1, 0, 0.03529412, 1,
2.742491, -1.036765, 1.194561, 1, 0, 0.03137255, 1,
2.758497, -0.08874177, 0.496518, 1, 0, 0.02352941, 1,
2.95392, -0.2515295, 1.266514, 1, 0, 0.01960784, 1,
3.226176, 1.661025, 0.9715873, 1, 0, 0.01176471, 1,
3.283613, -0.06171324, 0.5990633, 1, 0, 0.007843138, 1
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
0.0701139, -4.485351, -6.998822, 0, -0.5, 0.5, 0.5,
0.0701139, -4.485351, -6.998822, 1, -0.5, 0.5, 0.5,
0.0701139, -4.485351, -6.998822, 1, 1.5, 0.5, 0.5,
0.0701139, -4.485351, -6.998822, 0, 1.5, 0.5, 0.5
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
-4.232762, 0.009177923, -6.998822, 0, -0.5, 0.5, 0.5,
-4.232762, 0.009177923, -6.998822, 1, -0.5, 0.5, 0.5,
-4.232762, 0.009177923, -6.998822, 1, 1.5, 0.5, 0.5,
-4.232762, 0.009177923, -6.998822, 0, 1.5, 0.5, 0.5
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
-4.232762, -4.485351, 0.02457619, 0, -0.5, 0.5, 0.5,
-4.232762, -4.485351, 0.02457619, 1, -0.5, 0.5, 0.5,
-4.232762, -4.485351, 0.02457619, 1, 1.5, 0.5, 0.5,
-4.232762, -4.485351, 0.02457619, 0, 1.5, 0.5, 0.5
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
-3, -3.448152, -5.378038,
3, -3.448152, -5.378038,
-3, -3.448152, -5.378038,
-3, -3.621019, -5.648169,
-2, -3.448152, -5.378038,
-2, -3.621019, -5.648169,
-1, -3.448152, -5.378038,
-1, -3.621019, -5.648169,
0, -3.448152, -5.378038,
0, -3.621019, -5.648169,
1, -3.448152, -5.378038,
1, -3.621019, -5.648169,
2, -3.448152, -5.378038,
2, -3.621019, -5.648169,
3, -3.448152, -5.378038,
3, -3.621019, -5.648169
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
-3, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
-3, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
-3, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
-3, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
-2, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
-2, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
-2, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
-2, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
-1, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
-1, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
-1, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
-1, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
0, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
0, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
0, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
0, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
1, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
1, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
1, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
1, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
2, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
2, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
2, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
2, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5,
3, -3.966752, -6.18843, 0, -0.5, 0.5, 0.5,
3, -3.966752, -6.18843, 1, -0.5, 0.5, 0.5,
3, -3.966752, -6.18843, 1, 1.5, 0.5, 0.5,
3, -3.966752, -6.18843, 0, 1.5, 0.5, 0.5
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
-3.23979, -3, -5.378038,
-3.23979, 3, -5.378038,
-3.23979, -3, -5.378038,
-3.405286, -3, -5.648169,
-3.23979, -2, -5.378038,
-3.405286, -2, -5.648169,
-3.23979, -1, -5.378038,
-3.405286, -1, -5.648169,
-3.23979, 0, -5.378038,
-3.405286, 0, -5.648169,
-3.23979, 1, -5.378038,
-3.405286, 1, -5.648169,
-3.23979, 2, -5.378038,
-3.405286, 2, -5.648169,
-3.23979, 3, -5.378038,
-3.405286, 3, -5.648169
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
-3.736276, -3, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, -3, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, -3, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, -3, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, -2, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, -2, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, -2, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, -2, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, -1, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, -1, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, -1, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, -1, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, 0, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, 0, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, 0, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, 0, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, 1, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, 1, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, 1, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, 1, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, 2, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, 2, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, 2, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, 2, -6.18843, 0, 1.5, 0.5, 0.5,
-3.736276, 3, -6.18843, 0, -0.5, 0.5, 0.5,
-3.736276, 3, -6.18843, 1, -0.5, 0.5, 0.5,
-3.736276, 3, -6.18843, 1, 1.5, 0.5, 0.5,
-3.736276, 3, -6.18843, 0, 1.5, 0.5, 0.5
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
-3.23979, -3.448152, -4,
-3.23979, -3.448152, 4,
-3.23979, -3.448152, -4,
-3.405286, -3.621019, -4,
-3.23979, -3.448152, -2,
-3.405286, -3.621019, -2,
-3.23979, -3.448152, 0,
-3.405286, -3.621019, 0,
-3.23979, -3.448152, 2,
-3.405286, -3.621019, 2,
-3.23979, -3.448152, 4,
-3.405286, -3.621019, 4
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
-3.736276, -3.966752, -4, 0, -0.5, 0.5, 0.5,
-3.736276, -3.966752, -4, 1, -0.5, 0.5, 0.5,
-3.736276, -3.966752, -4, 1, 1.5, 0.5, 0.5,
-3.736276, -3.966752, -4, 0, 1.5, 0.5, 0.5,
-3.736276, -3.966752, -2, 0, -0.5, 0.5, 0.5,
-3.736276, -3.966752, -2, 1, -0.5, 0.5, 0.5,
-3.736276, -3.966752, -2, 1, 1.5, 0.5, 0.5,
-3.736276, -3.966752, -2, 0, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 0, 0, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 0, 1, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 0, 1, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 0, 0, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 2, 0, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 2, 1, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 2, 1, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 2, 0, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 4, 0, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 4, 1, -0.5, 0.5, 0.5,
-3.736276, -3.966752, 4, 1, 1.5, 0.5, 0.5,
-3.736276, -3.966752, 4, 0, 1.5, 0.5, 0.5
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
-3.23979, -3.448152, -5.378038,
-3.23979, 3.466508, -5.378038,
-3.23979, -3.448152, 5.42719,
-3.23979, 3.466508, 5.42719,
-3.23979, -3.448152, -5.378038,
-3.23979, -3.448152, 5.42719,
-3.23979, 3.466508, -5.378038,
-3.23979, 3.466508, 5.42719,
-3.23979, -3.448152, -5.378038,
3.380018, -3.448152, -5.378038,
-3.23979, -3.448152, 5.42719,
3.380018, -3.448152, 5.42719,
-3.23979, 3.466508, -5.378038,
3.380018, 3.466508, -5.378038,
-3.23979, 3.466508, 5.42719,
3.380018, 3.466508, 5.42719,
3.380018, -3.448152, -5.378038,
3.380018, 3.466508, -5.378038,
3.380018, -3.448152, 5.42719,
3.380018, 3.466508, 5.42719,
3.380018, -3.448152, -5.378038,
3.380018, -3.448152, 5.42719,
3.380018, 3.466508, -5.378038,
3.380018, 3.466508, 5.42719
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
var radius = 7.708345;
var distance = 34.2953;
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
mvMatrix.translate( -0.0701139, -0.009177923, -0.02457619 );
mvMatrix.scale( 1.259011, 1.205325, 0.7713315 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2953);
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
thiodicarbamate<-read.table("thiodicarbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiodicarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
y<-thiodicarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
z<-thiodicarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
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
-3.143385, 0.3031451, -2.874075, 0, 0, 1, 1, 1,
-3.065285, -1.105536, -0.8777966, 1, 0, 0, 1, 1,
-2.983149, 1.871882, -0.1378878, 1, 0, 0, 1, 1,
-2.748518, -1.375698, -3.621855, 1, 0, 0, 1, 1,
-2.65569, 0.4218886, -1.600112, 1, 0, 0, 1, 1,
-2.655665, 0.5301265, -2.308554, 1, 0, 0, 1, 1,
-2.62822, -0.4354264, -1.005968, 0, 0, 0, 1, 1,
-2.588472, 0.8797564, -1.125744, 0, 0, 0, 1, 1,
-2.571079, 0.6044523, -0.7375689, 0, 0, 0, 1, 1,
-2.523808, -2.052099, -2.411971, 0, 0, 0, 1, 1,
-2.431375, 1.181886, -1.358535, 0, 0, 0, 1, 1,
-2.404258, 0.03532611, 0.6874391, 0, 0, 0, 1, 1,
-2.403604, 0.423822, -1.346933, 0, 0, 0, 1, 1,
-2.334549, -0.3186545, -1.239316, 1, 1, 1, 1, 1,
-2.325118, 0.6568888, -2.871912, 1, 1, 1, 1, 1,
-2.323119, 0.1272593, -0.2667653, 1, 1, 1, 1, 1,
-2.306889, -1.245874, -1.784493, 1, 1, 1, 1, 1,
-2.265636, -1.176059, -2.260958, 1, 1, 1, 1, 1,
-2.160873, 1.148981, -2.750457, 1, 1, 1, 1, 1,
-2.141772, -0.330503, -0.9206794, 1, 1, 1, 1, 1,
-2.133001, -0.7454934, -3.145904, 1, 1, 1, 1, 1,
-2.109612, 0.8281641, -1.004059, 1, 1, 1, 1, 1,
-2.103969, -0.5058308, -1.915657, 1, 1, 1, 1, 1,
-2.098219, 0.7585039, 1.734363, 1, 1, 1, 1, 1,
-2.093642, -0.9703348, -2.671733, 1, 1, 1, 1, 1,
-2.082047, -0.7051167, -1.376324, 1, 1, 1, 1, 1,
-2.054935, 0.918789, -0.6401693, 1, 1, 1, 1, 1,
-2.046798, 0.2856095, -2.2966, 1, 1, 1, 1, 1,
-2.005265, -1.648253, -1.080233, 0, 0, 1, 1, 1,
-1.981242, 1.250234, -2.088337, 1, 0, 0, 1, 1,
-1.955364, 1.175115, 0.03972642, 1, 0, 0, 1, 1,
-1.920245, 1.10202, -0.4672108, 1, 0, 0, 1, 1,
-1.877822, 1.353354, -2.00841, 1, 0, 0, 1, 1,
-1.876026, -1.467407, -0.8156267, 1, 0, 0, 1, 1,
-1.814062, 0.9442629, -1.503596, 0, 0, 0, 1, 1,
-1.80705, 0.5311446, -0.984031, 0, 0, 0, 1, 1,
-1.797106, 1.186204, -0.9418173, 0, 0, 0, 1, 1,
-1.785658, 0.1011581, -0.6965736, 0, 0, 0, 1, 1,
-1.763283, -0.9037322, -2.861862, 0, 0, 0, 1, 1,
-1.757236, 0.1868748, -1.672246, 0, 0, 0, 1, 1,
-1.70403, -1.261519, -2.135631, 0, 0, 0, 1, 1,
-1.702878, -0.4291657, -0.4232637, 1, 1, 1, 1, 1,
-1.680691, -0.8539426, -0.4228044, 1, 1, 1, 1, 1,
-1.673283, 0.6373251, -0.2543302, 1, 1, 1, 1, 1,
-1.667485, -0.1756207, 0.9456263, 1, 1, 1, 1, 1,
-1.646468, -0.2655817, -1.304834, 1, 1, 1, 1, 1,
-1.63594, -1.035771, -1.503872, 1, 1, 1, 1, 1,
-1.612924, -0.2594457, -1.411885, 1, 1, 1, 1, 1,
-1.605308, 0.1188068, -1.073112, 1, 1, 1, 1, 1,
-1.603298, 0.2964224, -0.5471469, 1, 1, 1, 1, 1,
-1.602561, 0.9826409, -1.884815, 1, 1, 1, 1, 1,
-1.599328, 0.7099561, -1.680502, 1, 1, 1, 1, 1,
-1.592001, 2.878732, -2.3245, 1, 1, 1, 1, 1,
-1.581836, 1.273679, -0.826711, 1, 1, 1, 1, 1,
-1.544394, 0.6190444, -0.4125944, 1, 1, 1, 1, 1,
-1.534087, 1.006232, -1.838848, 1, 1, 1, 1, 1,
-1.531206, 0.4669053, -0.5215195, 0, 0, 1, 1, 1,
-1.530085, 1.632649, 0.04067478, 1, 0, 0, 1, 1,
-1.526503, 0.1684378, -1.802703, 1, 0, 0, 1, 1,
-1.522311, -0.9392865, -1.666615, 1, 0, 0, 1, 1,
-1.518273, 0.590725, -1.278406, 1, 0, 0, 1, 1,
-1.511535, -1.307104, -3.856785, 1, 0, 0, 1, 1,
-1.511465, 0.1826509, -1.778817, 0, 0, 0, 1, 1,
-1.511153, -2.597397, -1.489198, 0, 0, 0, 1, 1,
-1.509223, -0.7083827, -1.650566, 0, 0, 0, 1, 1,
-1.506027, -1.363296, -2.22875, 0, 0, 0, 1, 1,
-1.498554, -0.266511, -2.967418, 0, 0, 0, 1, 1,
-1.492805, -0.9326016, -2.578871, 0, 0, 0, 1, 1,
-1.490157, -0.5379611, -0.6692334, 0, 0, 0, 1, 1,
-1.488114, 1.955918, -0.9640848, 1, 1, 1, 1, 1,
-1.484025, -0.304484, -2.434546, 1, 1, 1, 1, 1,
-1.47939, 0.6407395, -0.8412498, 1, 1, 1, 1, 1,
-1.475602, 0.4216517, -3.092508, 1, 1, 1, 1, 1,
-1.462121, -1.145818, -1.401254, 1, 1, 1, 1, 1,
-1.455437, 0.2707653, -2.524911, 1, 1, 1, 1, 1,
-1.454095, 0.9510312, -2.046375, 1, 1, 1, 1, 1,
-1.435953, 0.7279693, 0.2566657, 1, 1, 1, 1, 1,
-1.420081, 0.1199385, -0.449711, 1, 1, 1, 1, 1,
-1.419594, 1.2008, -0.5182366, 1, 1, 1, 1, 1,
-1.419085, 1.193616, -1.386925, 1, 1, 1, 1, 1,
-1.416921, -1.142741, -2.231925, 1, 1, 1, 1, 1,
-1.40384, 0.07780357, -2.014512, 1, 1, 1, 1, 1,
-1.403099, -0.1643967, -0.8892477, 1, 1, 1, 1, 1,
-1.383056, -0.5259787, -3.588113, 1, 1, 1, 1, 1,
-1.377046, -2.202581, -2.737177, 0, 0, 1, 1, 1,
-1.37577, -1.620752, -1.541291, 1, 0, 0, 1, 1,
-1.373, -0.1406278, -2.23549, 1, 0, 0, 1, 1,
-1.368229, -0.6009297, -1.713446, 1, 0, 0, 1, 1,
-1.364877, 1.192065, -0.3653016, 1, 0, 0, 1, 1,
-1.362473, -0.7268507, -3.632311, 1, 0, 0, 1, 1,
-1.350701, 1.231804, -0.9934574, 0, 0, 0, 1, 1,
-1.341155, 0.7302769, -0.7941525, 0, 0, 0, 1, 1,
-1.324223, 0.1736895, -0.6617373, 0, 0, 0, 1, 1,
-1.323087, 0.5674722, -1.312363, 0, 0, 0, 1, 1,
-1.293659, 0.9213586, -3.024169, 0, 0, 0, 1, 1,
-1.291754, -0.1281917, -1.664613, 0, 0, 0, 1, 1,
-1.281891, -1.020211, -3.209557, 0, 0, 0, 1, 1,
-1.280968, -0.1042912, -3.215044, 1, 1, 1, 1, 1,
-1.270149, 0.6760438, -2.072933, 1, 1, 1, 1, 1,
-1.263004, 0.5983562, -3.021178, 1, 1, 1, 1, 1,
-1.256339, 0.5080149, -1.29446, 1, 1, 1, 1, 1,
-1.253521, -0.4766027, -1.887988, 1, 1, 1, 1, 1,
-1.251607, 0.3415862, -3.459975, 1, 1, 1, 1, 1,
-1.248807, 0.2681383, -1.945009, 1, 1, 1, 1, 1,
-1.246889, 0.8919929, 0.002325078, 1, 1, 1, 1, 1,
-1.245011, -0.7559147, -1.918451, 1, 1, 1, 1, 1,
-1.24328, 0.1869685, -0.8231285, 1, 1, 1, 1, 1,
-1.24199, -0.1571733, -5.001577, 1, 1, 1, 1, 1,
-1.241691, 1.770483, -0.9405561, 1, 1, 1, 1, 1,
-1.238602, -0.4333763, -2.350178, 1, 1, 1, 1, 1,
-1.237213, -0.211107, -0.9666322, 1, 1, 1, 1, 1,
-1.235701, -1.466339, -2.873208, 1, 1, 1, 1, 1,
-1.234801, 0.1356755, -2.568319, 0, 0, 1, 1, 1,
-1.23026, 1.446038, -0.92997, 1, 0, 0, 1, 1,
-1.219629, 1.373537, -0.8636383, 1, 0, 0, 1, 1,
-1.206145, 1.06126, 0.2188256, 1, 0, 0, 1, 1,
-1.204849, -0.8483202, -3.159896, 1, 0, 0, 1, 1,
-1.202601, 1.621955, -0.8977888, 1, 0, 0, 1, 1,
-1.200033, 0.3653097, -1.206198, 0, 0, 0, 1, 1,
-1.200003, -1.176426, -2.390609, 0, 0, 0, 1, 1,
-1.188834, -0.4664805, -1.602527, 0, 0, 0, 1, 1,
-1.181893, -0.6960999, -3.045198, 0, 0, 0, 1, 1,
-1.174769, -1.133193, -2.430223, 0, 0, 0, 1, 1,
-1.170691, 0.6198633, -0.348125, 0, 0, 0, 1, 1,
-1.167417, 0.7359408, -2.11151, 0, 0, 0, 1, 1,
-1.164686, -0.8492873, -2.461739, 1, 1, 1, 1, 1,
-1.164511, -0.6693155, -4.173184, 1, 1, 1, 1, 1,
-1.161112, -0.01368898, -1.885003, 1, 1, 1, 1, 1,
-1.15651, 0.2912803, -0.7139345, 1, 1, 1, 1, 1,
-1.150257, -0.4436516, -2.236314, 1, 1, 1, 1, 1,
-1.149519, 0.8839579, 0.7095534, 1, 1, 1, 1, 1,
-1.146188, -0.8292184, -0.7641628, 1, 1, 1, 1, 1,
-1.145384, -0.07296305, -3.019127, 1, 1, 1, 1, 1,
-1.139964, 1.650648, -2.099191, 1, 1, 1, 1, 1,
-1.139749, 0.7205749, -1.271109, 1, 1, 1, 1, 1,
-1.099044, -2.042815, -1.117545, 1, 1, 1, 1, 1,
-1.090602, -0.7166991, -1.796252, 1, 1, 1, 1, 1,
-1.084003, -0.03632201, 0.2859679, 1, 1, 1, 1, 1,
-1.079359, -0.2407629, -1.214252, 1, 1, 1, 1, 1,
-1.07857, 3.365809, -0.9591485, 1, 1, 1, 1, 1,
-1.078444, 1.327716, -2.25617, 0, 0, 1, 1, 1,
-1.077826, 0.014828, -0.365649, 1, 0, 0, 1, 1,
-1.077427, -1.489622, -2.650706, 1, 0, 0, 1, 1,
-1.061584, -1.112722, -1.651365, 1, 0, 0, 1, 1,
-1.060846, -1.119527, -2.391603, 1, 0, 0, 1, 1,
-1.051124, 0.8640518, -0.5842733, 1, 0, 0, 1, 1,
-1.045343, -0.3367958, -1.301789, 0, 0, 0, 1, 1,
-1.045314, -2.012231, -2.227, 0, 0, 0, 1, 1,
-1.04153, 0.7918381, -1.191922, 0, 0, 0, 1, 1,
-1.030047, 0.16799, -0.2688177, 0, 0, 0, 1, 1,
-1.024001, 0.5467576, -1.644302, 0, 0, 0, 1, 1,
-1.020401, 0.127054, -3.721228, 0, 0, 0, 1, 1,
-1.019367, 0.6899063, -0.8872691, 0, 0, 0, 1, 1,
-1.008119, 0.2377847, -1.152784, 1, 1, 1, 1, 1,
-1.004316, -1.32635, -2.007987, 1, 1, 1, 1, 1,
-1.000767, 0.2988405, 0.7750105, 1, 1, 1, 1, 1,
-0.9948565, -2.028083, -1.362585, 1, 1, 1, 1, 1,
-0.9904745, -0.7769478, -1.206356, 1, 1, 1, 1, 1,
-0.9894549, 0.03142168, -0.708079, 1, 1, 1, 1, 1,
-0.9853074, -0.09311579, -2.490032, 1, 1, 1, 1, 1,
-0.9848787, -0.7317979, -2.926355, 1, 1, 1, 1, 1,
-0.9781789, -0.1642734, -0.9333306, 1, 1, 1, 1, 1,
-0.9724393, -1.36665, -1.588745, 1, 1, 1, 1, 1,
-0.9707283, -1.130564, -2.843085, 1, 1, 1, 1, 1,
-0.9676565, -0.220822, -1.780929, 1, 1, 1, 1, 1,
-0.9526612, 0.5080456, -0.5413646, 1, 1, 1, 1, 1,
-0.9503082, -0.9548072, -3.440113, 1, 1, 1, 1, 1,
-0.9472529, -1.140225, -1.125336, 1, 1, 1, 1, 1,
-0.9443008, 1.511523, -2.583786, 0, 0, 1, 1, 1,
-0.9421669, -0.7942332, -3.25235, 1, 0, 0, 1, 1,
-0.9413806, 0.02804706, -2.260192, 1, 0, 0, 1, 1,
-0.9388979, 1.388057, 0.2319555, 1, 0, 0, 1, 1,
-0.9381491, 0.07007208, -1.16216, 1, 0, 0, 1, 1,
-0.9360719, 0.3530632, 0.2576596, 1, 0, 0, 1, 1,
-0.9337897, -0.06608877, -0.3344544, 0, 0, 0, 1, 1,
-0.9320838, -1.682484, -1.547735, 0, 0, 0, 1, 1,
-0.9293002, 0.494914, -1.901422, 0, 0, 0, 1, 1,
-0.9288025, 2.730612, -0.9280256, 0, 0, 0, 1, 1,
-0.9274172, -0.1002483, -1.38183, 0, 0, 0, 1, 1,
-0.9269178, -2.051545, -3.901624, 0, 0, 0, 1, 1,
-0.917055, 0.7023293, -1.325106, 0, 0, 0, 1, 1,
-0.9140906, -0.5110143, -3.56551, 1, 1, 1, 1, 1,
-0.905479, -0.05043596, -0.9654008, 1, 1, 1, 1, 1,
-0.9016426, -2.489387, -4.096003, 1, 1, 1, 1, 1,
-0.8994367, 0.1454362, -1.779225, 1, 1, 1, 1, 1,
-0.8974044, -1.661905, -4.108235, 1, 1, 1, 1, 1,
-0.8954074, 0.8389149, -1.452181, 1, 1, 1, 1, 1,
-0.8924105, -0.1648464, -2.015919, 1, 1, 1, 1, 1,
-0.8899983, -0.303107, -0.2975731, 1, 1, 1, 1, 1,
-0.8877329, 1.004824, 0.662416, 1, 1, 1, 1, 1,
-0.886412, -0.8653663, -1.919372, 1, 1, 1, 1, 1,
-0.8863783, -0.7101978, -2.893492, 1, 1, 1, 1, 1,
-0.8555893, 1.479837, -1.306232, 1, 1, 1, 1, 1,
-0.8531202, 1.98079, -1.08817, 1, 1, 1, 1, 1,
-0.8460673, -0.476528, -2.198066, 1, 1, 1, 1, 1,
-0.8393604, 1.069037, -1.32645, 1, 1, 1, 1, 1,
-0.8392426, 0.1990484, -0.9606825, 0, 0, 1, 1, 1,
-0.8363938, 1.406907, -1.108076, 1, 0, 0, 1, 1,
-0.8347208, -2.116972, -3.172941, 1, 0, 0, 1, 1,
-0.8265279, 1.389215, -1.01858, 1, 0, 0, 1, 1,
-0.8208786, -1.63871, -3.09451, 1, 0, 0, 1, 1,
-0.815369, -0.8832812, -2.815352, 1, 0, 0, 1, 1,
-0.8103834, 0.9958999, -0.5014135, 0, 0, 0, 1, 1,
-0.8101436, 0.06765942, -1.999794, 0, 0, 0, 1, 1,
-0.8089857, 1.077979, -1.433363, 0, 0, 0, 1, 1,
-0.806182, 0.6026826, -0.8798857, 0, 0, 0, 1, 1,
-0.8060535, -1.106931, -0.5165921, 0, 0, 0, 1, 1,
-0.803781, 1.218289, -1.371807, 0, 0, 0, 1, 1,
-0.8011959, 0.1501824, -1.319718, 0, 0, 0, 1, 1,
-0.8000587, 0.4566513, -1.795532, 1, 1, 1, 1, 1,
-0.7982609, -0.6795701, -1.737037, 1, 1, 1, 1, 1,
-0.7948182, 0.8781266, 0.2494128, 1, 1, 1, 1, 1,
-0.7927638, 1.492437, 1.320462, 1, 1, 1, 1, 1,
-0.7865393, 2.180034, -0.2452641, 1, 1, 1, 1, 1,
-0.7849848, 0.9561889, -2.45001, 1, 1, 1, 1, 1,
-0.7830023, 0.315887, -1.642529, 1, 1, 1, 1, 1,
-0.7815171, -0.8619451, -2.932555, 1, 1, 1, 1, 1,
-0.7804099, 0.4310857, -0.3967151, 1, 1, 1, 1, 1,
-0.7779199, -0.3357546, -3.596403, 1, 1, 1, 1, 1,
-0.7754601, 0.6804408, -1.369042, 1, 1, 1, 1, 1,
-0.7665345, -0.6688285, -0.3341656, 1, 1, 1, 1, 1,
-0.7610871, -1.21246, -4.671479, 1, 1, 1, 1, 1,
-0.7601523, -0.4284746, -2.048969, 1, 1, 1, 1, 1,
-0.7558191, -2.258261, -2.010279, 1, 1, 1, 1, 1,
-0.7539485, -0.3810469, -2.294791, 0, 0, 1, 1, 1,
-0.7508805, 2.10749, 0.5211266, 1, 0, 0, 1, 1,
-0.7468156, -0.7898557, -3.951453, 1, 0, 0, 1, 1,
-0.7440234, 0.2469382, -1.392264, 1, 0, 0, 1, 1,
-0.7414162, 1.286699, -0.9154915, 1, 0, 0, 1, 1,
-0.732744, -0.1694756, -1.258464, 1, 0, 0, 1, 1,
-0.7325683, -2.890843, -4.647324, 0, 0, 0, 1, 1,
-0.7320488, -0.1729119, -0.1078626, 0, 0, 0, 1, 1,
-0.7267016, 1.096958, 1.586742, 0, 0, 0, 1, 1,
-0.7258407, -1.00717, -1.517421, 0, 0, 0, 1, 1,
-0.7239943, 0.2143344, -2.788791, 0, 0, 0, 1, 1,
-0.7236055, 1.192294, -0.0939526, 0, 0, 0, 1, 1,
-0.7224566, 0.3351996, -1.767648, 0, 0, 0, 1, 1,
-0.7176311, 0.4704402, -0.6134881, 1, 1, 1, 1, 1,
-0.7117107, 1.302324, 0.5571728, 1, 1, 1, 1, 1,
-0.7093001, 0.4772474, 0.0987727, 1, 1, 1, 1, 1,
-0.7037461, -0.3253072, -1.997892, 1, 1, 1, 1, 1,
-0.7035272, 0.3038991, -1.557473, 1, 1, 1, 1, 1,
-0.7034299, -0.4927554, -1.918466, 1, 1, 1, 1, 1,
-0.7032384, -0.7322105, -2.917029, 1, 1, 1, 1, 1,
-0.6911635, -0.8475853, -0.6387626, 1, 1, 1, 1, 1,
-0.688552, 1.227219, -1.2517, 1, 1, 1, 1, 1,
-0.6883302, -0.3700944, -2.468798, 1, 1, 1, 1, 1,
-0.687754, -1.691515, -3.633228, 1, 1, 1, 1, 1,
-0.6874338, -0.1918403, -2.989463, 1, 1, 1, 1, 1,
-0.6832409, 0.8594825, -0.4154488, 1, 1, 1, 1, 1,
-0.6824017, 2.063806, -1.023902, 1, 1, 1, 1, 1,
-0.6823449, 0.3417203, -2.647051, 1, 1, 1, 1, 1,
-0.6819251, 1.061156, 0.5055966, 0, 0, 1, 1, 1,
-0.6816185, 0.7784168, -0.234546, 1, 0, 0, 1, 1,
-0.6815952, 1.817006, 0.5639152, 1, 0, 0, 1, 1,
-0.6814975, 0.7332534, -0.3152481, 1, 0, 0, 1, 1,
-0.6784981, -1.311383, -2.300576, 1, 0, 0, 1, 1,
-0.6762852, -0.009756817, -0.08416319, 1, 0, 0, 1, 1,
-0.6751414, 0.009547926, -2.511526, 0, 0, 0, 1, 1,
-0.673218, 0.03055348, -0.9907736, 0, 0, 0, 1, 1,
-0.6723367, -0.4142466, -0.8509988, 0, 0, 0, 1, 1,
-0.6707398, 0.5489008, -2.167215, 0, 0, 0, 1, 1,
-0.6707019, 1.802445, 0.09644588, 0, 0, 0, 1, 1,
-0.6705457, -0.3917343, -2.101222, 0, 0, 0, 1, 1,
-0.660404, -1.730789, -1.362845, 0, 0, 0, 1, 1,
-0.6590236, 0.703576, 0.8042174, 1, 1, 1, 1, 1,
-0.6565367, 0.5632964, 0.2427347, 1, 1, 1, 1, 1,
-0.656048, -0.8070266, -3.381678, 1, 1, 1, 1, 1,
-0.65576, 0.7094888, 0.3764614, 1, 1, 1, 1, 1,
-0.6507642, -0.4583981, -1.623643, 1, 1, 1, 1, 1,
-0.6482096, -1.788718, -2.974725, 1, 1, 1, 1, 1,
-0.6458782, 1.719284, 0.1914013, 1, 1, 1, 1, 1,
-0.6456931, 0.3506852, -2.533626, 1, 1, 1, 1, 1,
-0.6434485, -2.041825, -2.083547, 1, 1, 1, 1, 1,
-0.6383811, 1.171727, 0.02194969, 1, 1, 1, 1, 1,
-0.638057, 0.6170593, -0.427787, 1, 1, 1, 1, 1,
-0.637439, -0.3212151, -3.02382, 1, 1, 1, 1, 1,
-0.6356938, 0.1175142, -2.117775, 1, 1, 1, 1, 1,
-0.6341283, 0.5119792, -1.815336, 1, 1, 1, 1, 1,
-0.6325538, 0.7786208, -0.7428182, 1, 1, 1, 1, 1,
-0.6305636, -0.08996037, -1.239201, 0, 0, 1, 1, 1,
-0.6302767, 0.482703, -1.98619, 1, 0, 0, 1, 1,
-0.6281819, 0.8484083, -1.118719, 1, 0, 0, 1, 1,
-0.6274905, 0.8454313, 0.8553324, 1, 0, 0, 1, 1,
-0.6268101, 0.132792, 0.5005794, 1, 0, 0, 1, 1,
-0.6240695, -0.418523, -2.045828, 1, 0, 0, 1, 1,
-0.6210846, -0.09852425, -1.015762, 0, 0, 0, 1, 1,
-0.6188433, -1.649613, -1.17445, 0, 0, 0, 1, 1,
-0.6172201, 1.27048, -2.140426, 0, 0, 0, 1, 1,
-0.6147897, 0.506596, -1.263239, 0, 0, 0, 1, 1,
-0.607146, 0.06353369, -0.9665002, 0, 0, 0, 1, 1,
-0.6060138, -0.349831, -2.047287, 0, 0, 0, 1, 1,
-0.5948809, 0.7196724, 0.5314372, 0, 0, 0, 1, 1,
-0.5945691, -0.4374968, -1.673262, 1, 1, 1, 1, 1,
-0.5915247, 0.499347, -2.141803, 1, 1, 1, 1, 1,
-0.5891208, 1.104556, -1.688247, 1, 1, 1, 1, 1,
-0.5890655, -1.996476, -2.547793, 1, 1, 1, 1, 1,
-0.5854228, 0.04385308, -1.298219, 1, 1, 1, 1, 1,
-0.5835214, -0.09567975, -1.462812, 1, 1, 1, 1, 1,
-0.5796598, -0.347588, -2.557915, 1, 1, 1, 1, 1,
-0.5766434, -0.4270934, -2.723372, 1, 1, 1, 1, 1,
-0.5715426, -2.25336, -3.942385, 1, 1, 1, 1, 1,
-0.5695288, -1.649964, -3.261077, 1, 1, 1, 1, 1,
-0.5643454, -0.1858904, -1.992796, 1, 1, 1, 1, 1,
-0.5530968, -0.2950067, -1.302029, 1, 1, 1, 1, 1,
-0.5422928, 0.2945429, -1.499554, 1, 1, 1, 1, 1,
-0.5394248, 0.4650745, -0.6615684, 1, 1, 1, 1, 1,
-0.5378261, -0.4161244, -1.63098, 1, 1, 1, 1, 1,
-0.5346281, -0.6453206, -1.768385, 0, 0, 1, 1, 1,
-0.5325565, 1.371502, -0.2420157, 1, 0, 0, 1, 1,
-0.5262178, 0.7979153, -0.2188728, 1, 0, 0, 1, 1,
-0.5211105, 0.624903, -2.851523, 1, 0, 0, 1, 1,
-0.518539, -0.6157855, -3.21462, 1, 0, 0, 1, 1,
-0.5134017, 0.4949957, -2.834685, 1, 0, 0, 1, 1,
-0.5132026, 0.0619699, -0.880335, 0, 0, 0, 1, 1,
-0.5115673, 1.911985, 0.3448966, 0, 0, 0, 1, 1,
-0.5114694, 1.748474, 1.130367, 0, 0, 0, 1, 1,
-0.5066826, -0.3826625, -2.820041, 0, 0, 0, 1, 1,
-0.4979198, -0.5218714, -2.654323, 0, 0, 0, 1, 1,
-0.4957161, -0.412931, -0.4849491, 0, 0, 0, 1, 1,
-0.4952655, -0.56149, -1.255593, 0, 0, 0, 1, 1,
-0.4941041, -1.494876, -3.621498, 1, 1, 1, 1, 1,
-0.490315, -0.1926699, -1.80088, 1, 1, 1, 1, 1,
-0.4886155, 0.9401588, -0.08120528, 1, 1, 1, 1, 1,
-0.4871657, 0.2801556, -1.962169, 1, 1, 1, 1, 1,
-0.4860441, 0.7606727, -0.3912194, 1, 1, 1, 1, 1,
-0.4853697, -0.5728671, -3.136322, 1, 1, 1, 1, 1,
-0.484616, -3.271948, -2.5158, 1, 1, 1, 1, 1,
-0.4810551, 1.855328, 1.037327, 1, 1, 1, 1, 1,
-0.4793448, -0.7812019, -1.648411, 1, 1, 1, 1, 1,
-0.4780893, -0.1704314, -2.102451, 1, 1, 1, 1, 1,
-0.4770172, 0.530548, -2.436932, 1, 1, 1, 1, 1,
-0.4727728, 0.4443771, -0.8520282, 1, 1, 1, 1, 1,
-0.4694714, -0.09994316, -0.7472116, 1, 1, 1, 1, 1,
-0.4689266, -1.847494, -1.895438, 1, 1, 1, 1, 1,
-0.4662666, -1.736153, -3.364652, 1, 1, 1, 1, 1,
-0.4640105, 0.6352136, 0.1706243, 0, 0, 1, 1, 1,
-0.4634072, -1.759741, -3.592569, 1, 0, 0, 1, 1,
-0.4631568, 0.7236626, -0.9912524, 1, 0, 0, 1, 1,
-0.4574772, -0.5731797, -1.738471, 1, 0, 0, 1, 1,
-0.4571737, -0.4911765, -2.055099, 1, 0, 0, 1, 1,
-0.4507324, -0.9978728, -1.269953, 1, 0, 0, 1, 1,
-0.4423192, 0.2695871, -1.547444, 0, 0, 0, 1, 1,
-0.4389063, -0.8328764, -1.313253, 0, 0, 0, 1, 1,
-0.4367012, 1.704251, 0.865759, 0, 0, 0, 1, 1,
-0.4331047, -0.5419341, -3.506792, 0, 0, 0, 1, 1,
-0.4320767, -1.12712, -1.651237, 0, 0, 0, 1, 1,
-0.4266337, -0.7633206, -0.3847288, 0, 0, 0, 1, 1,
-0.4024197, -0.1698824, -1.795678, 0, 0, 0, 1, 1,
-0.4012108, -1.397393, -3.255115, 1, 1, 1, 1, 1,
-0.3952196, 0.3167927, -0.5043927, 1, 1, 1, 1, 1,
-0.3939013, 0.6411836, -0.8922367, 1, 1, 1, 1, 1,
-0.393035, 0.06255329, -1.092708, 1, 1, 1, 1, 1,
-0.3911002, -1.122942, -4.648094, 1, 1, 1, 1, 1,
-0.3873728, 0.3780037, -0.2553672, 1, 1, 1, 1, 1,
-0.3873235, 0.230399, -1.075721, 1, 1, 1, 1, 1,
-0.3861107, 1.111635, -0.1152138, 1, 1, 1, 1, 1,
-0.3803882, 0.4979567, -0.5187556, 1, 1, 1, 1, 1,
-0.3791489, -0.381365, -2.498983, 1, 1, 1, 1, 1,
-0.3769942, 2.076986, 1.401328, 1, 1, 1, 1, 1,
-0.3726916, 0.4259845, -0.8556288, 1, 1, 1, 1, 1,
-0.3725664, -2.938452, -2.771361, 1, 1, 1, 1, 1,
-0.3691157, 2.514623, 0.12695, 1, 1, 1, 1, 1,
-0.3670647, -1.434471, -3.402061, 1, 1, 1, 1, 1,
-0.3658569, 0.2987211, -1.971889, 0, 0, 1, 1, 1,
-0.3629793, 0.5450477, -0.3709239, 1, 0, 0, 1, 1,
-0.3628534, 1.319146, -0.1273661, 1, 0, 0, 1, 1,
-0.3626628, -0.2094746, -2.875058, 1, 0, 0, 1, 1,
-0.3602782, 0.1998836, -1.133974, 1, 0, 0, 1, 1,
-0.3598121, -0.7010463, -0.5022568, 1, 0, 0, 1, 1,
-0.3587621, -0.3172325, -2.36059, 0, 0, 0, 1, 1,
-0.3562799, 0.7113673, 0.1654325, 0, 0, 0, 1, 1,
-0.3536782, 0.2519316, 0.1575964, 0, 0, 0, 1, 1,
-0.352724, -1.30491, -3.247358, 0, 0, 0, 1, 1,
-0.3513683, 1.449964, -0.3438053, 0, 0, 0, 1, 1,
-0.3380099, 0.5633512, -2.98086, 0, 0, 0, 1, 1,
-0.3292128, -1.193091, -2.103696, 0, 0, 0, 1, 1,
-0.3256077, -3.24122, -3.03726, 1, 1, 1, 1, 1,
-0.3244545, 1.262052, -0.08341891, 1, 1, 1, 1, 1,
-0.3198807, 1.602762, 0.2464425, 1, 1, 1, 1, 1,
-0.3189463, -0.5757143, -4.223041, 1, 1, 1, 1, 1,
-0.3173949, 0.3812138, -0.3640262, 1, 1, 1, 1, 1,
-0.3161755, 0.9767782, -1.060707, 1, 1, 1, 1, 1,
-0.3139607, -0.6326835, -3.383656, 1, 1, 1, 1, 1,
-0.3137817, -0.1584105, -1.081345, 1, 1, 1, 1, 1,
-0.3126332, 1.592927, 0.9866126, 1, 1, 1, 1, 1,
-0.3124197, -1.584175, -2.103311, 1, 1, 1, 1, 1,
-0.3106215, -2.003547, -1.013866, 1, 1, 1, 1, 1,
-0.3104789, -1.243676, -1.319963, 1, 1, 1, 1, 1,
-0.309326, -0.8161011, -1.486667, 1, 1, 1, 1, 1,
-0.3084945, -0.5771916, -3.207303, 1, 1, 1, 1, 1,
-0.3070823, 0.4475411, 0.2269314, 1, 1, 1, 1, 1,
-0.302946, 1.177392, 0.3920728, 0, 0, 1, 1, 1,
-0.3025155, 0.9384353, 0.2481939, 1, 0, 0, 1, 1,
-0.2965046, 0.3278394, 1.278392, 1, 0, 0, 1, 1,
-0.2945279, -0.6470934, -4.706315, 1, 0, 0, 1, 1,
-0.2792627, 0.1732965, -0.919167, 1, 0, 0, 1, 1,
-0.2781513, -0.02661149, -1.574839, 1, 0, 0, 1, 1,
-0.2769778, -1.583419, -3.720782, 0, 0, 0, 1, 1,
-0.276172, 0.6582245, -1.601969, 0, 0, 0, 1, 1,
-0.2756291, -0.5284885, -3.468567, 0, 0, 0, 1, 1,
-0.2748208, -0.5065981, -3.384477, 0, 0, 0, 1, 1,
-0.2741335, 1.026181, -0.1746276, 0, 0, 0, 1, 1,
-0.2679851, -0.5513874, -2.864365, 0, 0, 0, 1, 1,
-0.2659127, -0.04253277, -3.864584, 0, 0, 0, 1, 1,
-0.2605179, -1.64674, -2.371437, 1, 1, 1, 1, 1,
-0.2565445, -0.3223332, -2.183015, 1, 1, 1, 1, 1,
-0.2560224, 0.1018248, 0.1065256, 1, 1, 1, 1, 1,
-0.2550785, -0.6632463, -1.645693, 1, 1, 1, 1, 1,
-0.2502882, 0.7581904, -2.087425, 1, 1, 1, 1, 1,
-0.2486131, 1.075059, 0.548851, 1, 1, 1, 1, 1,
-0.2477518, -0.5955272, -3.734648, 1, 1, 1, 1, 1,
-0.2471674, 2.514976, 0.8745235, 1, 1, 1, 1, 1,
-0.2396096, -0.4431166, -3.218483, 1, 1, 1, 1, 1,
-0.2386521, -2.394743, -0.9314747, 1, 1, 1, 1, 1,
-0.2384697, -0.0008369266, -2.864549, 1, 1, 1, 1, 1,
-0.2335271, 1.281568, 0.2832051, 1, 1, 1, 1, 1,
-0.2333504, 1.271449, -0.4502242, 1, 1, 1, 1, 1,
-0.2305643, -0.1630734, -0.9897346, 1, 1, 1, 1, 1,
-0.2265442, -0.7339866, -1.7547, 1, 1, 1, 1, 1,
-0.2262079, 0.6564516, 0.3166495, 0, 0, 1, 1, 1,
-0.2256012, -0.0375895, -3.229646, 1, 0, 0, 1, 1,
-0.2239918, 0.9010787, -0.8518553, 1, 0, 0, 1, 1,
-0.22352, -1.266315, -3.500508, 1, 0, 0, 1, 1,
-0.2227389, -1.394364, -0.9688211, 1, 0, 0, 1, 1,
-0.2217125, -0.8276953, -2.28625, 1, 0, 0, 1, 1,
-0.2210629, 0.0974004, -1.224468, 0, 0, 0, 1, 1,
-0.2192747, 1.616798, -1.838442, 0, 0, 0, 1, 1,
-0.2186039, 0.7047996, -0.6466485, 0, 0, 0, 1, 1,
-0.2179045, -0.7336767, -2.500169, 0, 0, 0, 1, 1,
-0.2155038, 1.344151, 1.703572, 0, 0, 0, 1, 1,
-0.2119646, -0.09030862, -2.196444, 0, 0, 0, 1, 1,
-0.2070669, 0.3751981, -1.25682, 0, 0, 0, 1, 1,
-0.2056638, -1.08616, -3.097089, 1, 1, 1, 1, 1,
-0.2054176, -0.5292817, -2.547647, 1, 1, 1, 1, 1,
-0.2051508, -0.1966486, -1.280628, 1, 1, 1, 1, 1,
-0.2036656, 0.4467943, -1.492279, 1, 1, 1, 1, 1,
-0.197761, 1.002004, -1.547347, 1, 1, 1, 1, 1,
-0.1923552, -0.984749, -1.921949, 1, 1, 1, 1, 1,
-0.1920264, -1.250797, -3.264896, 1, 1, 1, 1, 1,
-0.1892579, -0.7655997, -2.578766, 1, 1, 1, 1, 1,
-0.1880325, -0.3984704, -3.630155, 1, 1, 1, 1, 1,
-0.1859096, 1.292644, 0.5641738, 1, 1, 1, 1, 1,
-0.1835041, -1.156991, -3.583238, 1, 1, 1, 1, 1,
-0.1827082, -0.6417526, -2.253237, 1, 1, 1, 1, 1,
-0.1799776, -0.3166656, -0.3793916, 1, 1, 1, 1, 1,
-0.1798311, 1.579623, -0.4374222, 1, 1, 1, 1, 1,
-0.1755892, 2.101389, 0.7022083, 1, 1, 1, 1, 1,
-0.1737605, -0.8478302, -2.218772, 0, 0, 1, 1, 1,
-0.1688033, 2.076755, 1.33627, 1, 0, 0, 1, 1,
-0.1678521, 0.5491769, -0.3514002, 1, 0, 0, 1, 1,
-0.1624945, 0.7641102, -1.212258, 1, 0, 0, 1, 1,
-0.159427, 0.6444237, 1.576847, 1, 0, 0, 1, 1,
-0.1563589, -0.2400928, -3.907676, 1, 0, 0, 1, 1,
-0.1548757, 1.473853, 1.584693, 0, 0, 0, 1, 1,
-0.1548472, 0.2751062, -1.656391, 0, 0, 0, 1, 1,
-0.1525529, 0.3723099, 0.154752, 0, 0, 0, 1, 1,
-0.1507135, 1.565316, 0.1764666, 0, 0, 0, 1, 1,
-0.1495658, -0.6949657, -1.414505, 0, 0, 0, 1, 1,
-0.1489, 0.5074277, -0.4966528, 0, 0, 0, 1, 1,
-0.1470874, 1.955261, -1.633886, 0, 0, 0, 1, 1,
-0.1447507, 1.39231, -0.8796976, 1, 1, 1, 1, 1,
-0.1438218, 0.6450537, 1.255097, 1, 1, 1, 1, 1,
-0.1411615, -0.1067065, -1.587492, 1, 1, 1, 1, 1,
-0.1358494, 0.3463627, -0.2181536, 1, 1, 1, 1, 1,
-0.135241, 0.3705052, -0.1672031, 1, 1, 1, 1, 1,
-0.1307981, -1.165008, -4.21456, 1, 1, 1, 1, 1,
-0.1255419, 0.7644769, 0.2393549, 1, 1, 1, 1, 1,
-0.1227931, -1.230206, -3.555449, 1, 1, 1, 1, 1,
-0.1203802, 1.123993, 0.3429721, 1, 1, 1, 1, 1,
-0.1195329, -1.744642, -1.286338, 1, 1, 1, 1, 1,
-0.1146364, -0.05343901, -1.515379, 1, 1, 1, 1, 1,
-0.1146231, -0.759398, -3.39765, 1, 1, 1, 1, 1,
-0.1113306, -0.7169217, -2.254185, 1, 1, 1, 1, 1,
-0.1073437, 1.404095, -0.7232032, 1, 1, 1, 1, 1,
-0.106607, 1.443559, -1.221775, 1, 1, 1, 1, 1,
-0.09967022, 0.8631828, -1.637495, 0, 0, 1, 1, 1,
-0.0994642, 2.130146, -1.671746, 1, 0, 0, 1, 1,
-0.09828926, 0.2461361, -0.8611271, 1, 0, 0, 1, 1,
-0.08946554, 0.6026267, 1.117527, 1, 0, 0, 1, 1,
-0.08938744, -0.8333722, -3.138591, 1, 0, 0, 1, 1,
-0.0887828, -0.05976183, -0.3170006, 1, 0, 0, 1, 1,
-0.08652448, 0.6013014, -0.2798504, 0, 0, 0, 1, 1,
-0.08480373, -0.9429408, -2.432413, 0, 0, 0, 1, 1,
-0.08387052, -1.2901, -1.933833, 0, 0, 0, 1, 1,
-0.08121482, 0.07211141, -1.454085, 0, 0, 0, 1, 1,
-0.07899246, -0.1295969, -2.924478, 0, 0, 0, 1, 1,
-0.07596395, 1.179595, -1.668539, 0, 0, 0, 1, 1,
-0.07301468, -0.4463696, -1.63754, 0, 0, 0, 1, 1,
-0.06869479, 1.501974, 1.031865, 1, 1, 1, 1, 1,
-0.06669573, 0.03697747, -1.509175, 1, 1, 1, 1, 1,
-0.06655995, -0.9118538, -2.433209, 1, 1, 1, 1, 1,
-0.06082384, -0.1559468, -3.530627, 1, 1, 1, 1, 1,
-0.0585541, 0.6274661, -0.6167073, 1, 1, 1, 1, 1,
-0.05648729, -0.5327303, -3.186188, 1, 1, 1, 1, 1,
-0.05472849, -0.5937265, -2.550198, 1, 1, 1, 1, 1,
-0.05236487, -0.9570492, -3.254557, 1, 1, 1, 1, 1,
-0.04812639, -0.5380387, -5.22068, 1, 1, 1, 1, 1,
-0.04740083, -0.880419, -2.574031, 1, 1, 1, 1, 1,
-0.04571398, -0.3123237, -2.766384, 1, 1, 1, 1, 1,
-0.0414918, 0.6682388, 0.2522575, 1, 1, 1, 1, 1,
-0.03907425, 0.5720641, 0.0008583537, 1, 1, 1, 1, 1,
-0.0381631, 0.8103679, -1.455919, 1, 1, 1, 1, 1,
-0.03662489, 0.5422117, -1.78415, 1, 1, 1, 1, 1,
-0.03522304, -0.2228411, -1.46556, 0, 0, 1, 1, 1,
-0.03035503, 1.116231, -0.8740863, 1, 0, 0, 1, 1,
-0.02970718, 1.025351, -0.3841121, 1, 0, 0, 1, 1,
-0.0283484, 1.931378, 1.343824, 1, 0, 0, 1, 1,
-0.02682577, 1.30292, -0.1820135, 1, 0, 0, 1, 1,
-0.0251222, -0.2110636, -4.457019, 1, 0, 0, 1, 1,
-0.01761472, 0.9834691, 1.212374, 0, 0, 0, 1, 1,
-0.01420069, -0.2187485, -1.537666, 0, 0, 0, 1, 1,
-0.01347976, 0.07298523, -0.2187648, 0, 0, 0, 1, 1,
-0.01188787, 0.4395663, 1.334929, 0, 0, 0, 1, 1,
-0.007970236, 0.535064, 0.1772785, 0, 0, 0, 1, 1,
-0.006713724, -0.709562, -4.030293, 0, 0, 0, 1, 1,
-0.001689179, -1.395579, -3.360506, 0, 0, 0, 1, 1,
-0.0006935755, -0.1530003, -2.15967, 1, 1, 1, 1, 1,
0.001487616, 0.4697402, -0.3725243, 1, 1, 1, 1, 1,
0.008957685, -0.661307, 3.789029, 1, 1, 1, 1, 1,
0.01554545, 2.360245, -0.05391993, 1, 1, 1, 1, 1,
0.01719102, -0.6226302, 3.703576, 1, 1, 1, 1, 1,
0.02120821, -0.05111483, 5.079398, 1, 1, 1, 1, 1,
0.02572707, 1.412769, 0.6810637, 1, 1, 1, 1, 1,
0.03155901, 0.3895352, 0.9185203, 1, 1, 1, 1, 1,
0.0386478, -0.90548, 3.024004, 1, 1, 1, 1, 1,
0.03914373, -0.1780808, 2.02046, 1, 1, 1, 1, 1,
0.04036532, -0.02161407, 3.635863, 1, 1, 1, 1, 1,
0.04132644, -1.287852, 2.672273, 1, 1, 1, 1, 1,
0.06109573, 0.135779, 1.869339, 1, 1, 1, 1, 1,
0.06210878, -0.3765457, 2.435583, 1, 1, 1, 1, 1,
0.06762125, 0.5661125, -0.986267, 1, 1, 1, 1, 1,
0.06930222, 0.043147, 1.662293, 0, 0, 1, 1, 1,
0.07287045, 0.0578903, 1.067108, 1, 0, 0, 1, 1,
0.0747878, 0.4264639, 0.4689706, 1, 0, 0, 1, 1,
0.07509492, -0.3941896, 2.67193, 1, 0, 0, 1, 1,
0.07643418, -0.1718144, 1.980323, 1, 0, 0, 1, 1,
0.07670442, 0.005256792, -0.4827997, 1, 0, 0, 1, 1,
0.08992738, -1.686176, 2.008643, 0, 0, 0, 1, 1,
0.08998112, -2.391772, 4.121044, 0, 0, 0, 1, 1,
0.0935263, 2.235596, 0.1116358, 0, 0, 0, 1, 1,
0.09490429, 0.9827268, -1.06145, 0, 0, 0, 1, 1,
0.09510177, -1.392214, 3.88443, 0, 0, 0, 1, 1,
0.09667165, -0.7362576, 2.142723, 0, 0, 0, 1, 1,
0.09669916, 1.175199, -0.1629968, 0, 0, 0, 1, 1,
0.09805249, 2.315425, -1.17772, 1, 1, 1, 1, 1,
0.100597, -0.2124264, 3.277644, 1, 1, 1, 1, 1,
0.1014537, 0.9303119, -0.861472, 1, 1, 1, 1, 1,
0.1073743, 0.08108306, 0.8974361, 1, 1, 1, 1, 1,
0.1098879, 1.759756, -0.5324783, 1, 1, 1, 1, 1,
0.1221738, -0.6065143, 2.706386, 1, 1, 1, 1, 1,
0.1241672, -0.01813984, 1.602262, 1, 1, 1, 1, 1,
0.1293622, 0.4333835, -0.2124699, 1, 1, 1, 1, 1,
0.1342582, 0.03602207, 1.067472, 1, 1, 1, 1, 1,
0.1357705, 0.04394691, 1.367881, 1, 1, 1, 1, 1,
0.1364003, -0.3182355, 2.59277, 1, 1, 1, 1, 1,
0.1415366, 2.310942, 1.981475, 1, 1, 1, 1, 1,
0.1424931, 1.198459, -0.3872995, 1, 1, 1, 1, 1,
0.1490749, -0.6367387, 4.167004, 1, 1, 1, 1, 1,
0.1528502, -0.1074254, 2.446024, 1, 1, 1, 1, 1,
0.1564717, -0.4341294, 3.631204, 0, 0, 1, 1, 1,
0.1566834, 0.273574, 0.3832599, 1, 0, 0, 1, 1,
0.1569089, -1.939888, 1.952415, 1, 0, 0, 1, 1,
0.1578253, 0.5900527, 0.06141097, 1, 0, 0, 1, 1,
0.160822, 0.4606003, 0.5310631, 1, 0, 0, 1, 1,
0.1633586, -0.1963495, 1.940577, 1, 0, 0, 1, 1,
0.1665943, 1.089261, -0.8090698, 0, 0, 0, 1, 1,
0.1694343, 0.5928607, 0.1526802, 0, 0, 0, 1, 1,
0.1761822, -1.482239, 4.664816, 0, 0, 0, 1, 1,
0.1776408, 0.4116923, 0.4287213, 0, 0, 0, 1, 1,
0.1776971, 0.9740656, 1.215703, 0, 0, 0, 1, 1,
0.1819907, 1.191779, 0.9577045, 0, 0, 0, 1, 1,
0.1833268, 1.141, -0.7501976, 0, 0, 0, 1, 1,
0.1840323, 0.7674567, 0.7265144, 1, 1, 1, 1, 1,
0.1869445, -0.108945, 1.95354, 1, 1, 1, 1, 1,
0.1874633, 0.8639892, 0.0423957, 1, 1, 1, 1, 1,
0.1885711, -1.566347, 1.767531, 1, 1, 1, 1, 1,
0.1899862, 0.4155812, 0.09804552, 1, 1, 1, 1, 1,
0.1903138, -2.475084, 3.27149, 1, 1, 1, 1, 1,
0.1914073, 0.1632401, -0.1004941, 1, 1, 1, 1, 1,
0.1988829, 0.6329302, 0.6078158, 1, 1, 1, 1, 1,
0.1994485, 1.230239, 0.4874042, 1, 1, 1, 1, 1,
0.205376, 0.3446298, -0.8569345, 1, 1, 1, 1, 1,
0.2083003, 0.8575279, -0.1459744, 1, 1, 1, 1, 1,
0.2128687, 0.3849439, 0.546339, 1, 1, 1, 1, 1,
0.215643, 0.5047486, 1.214141, 1, 1, 1, 1, 1,
0.2178202, -1.129075, 2.285791, 1, 1, 1, 1, 1,
0.2197741, -0.8316923, 4.38836, 1, 1, 1, 1, 1,
0.2201404, 0.3148987, -0.3072209, 0, 0, 1, 1, 1,
0.2212684, 0.6155221, -0.2889585, 1, 0, 0, 1, 1,
0.2241812, -0.4154769, 1.833135, 1, 0, 0, 1, 1,
0.2257659, 1.550601, 2.052797, 1, 0, 0, 1, 1,
0.228079, 0.7044306, -0.2053036, 1, 0, 0, 1, 1,
0.2286354, 0.9599925, -0.09378409, 1, 0, 0, 1, 1,
0.2339213, -0.8099069, 3.168465, 0, 0, 0, 1, 1,
0.2383282, 0.3863179, -1.458535, 0, 0, 0, 1, 1,
0.2394733, -0.8234174, 3.819067, 0, 0, 0, 1, 1,
0.2416803, 0.4286881, 0.83568, 0, 0, 0, 1, 1,
0.2417546, 0.1919174, -0.1771475, 0, 0, 0, 1, 1,
0.2500507, -0.08337123, 2.537919, 0, 0, 0, 1, 1,
0.2509669, -0.5960881, 2.705942, 0, 0, 0, 1, 1,
0.2563863, 0.3923284, 1.445485, 1, 1, 1, 1, 1,
0.2615987, -0.008001251, 0.2167113, 1, 1, 1, 1, 1,
0.2695988, -0.5462986, 1.819521, 1, 1, 1, 1, 1,
0.2704778, 1.472654, 0.7100217, 1, 1, 1, 1, 1,
0.2705542, -1.572488, 4.111709, 1, 1, 1, 1, 1,
0.2796604, -0.5815574, 2.50613, 1, 1, 1, 1, 1,
0.2846007, -1.187544, 2.084101, 1, 1, 1, 1, 1,
0.2885812, -1.260902, 1.669115, 1, 1, 1, 1, 1,
0.2906516, -1.220853, 2.994476, 1, 1, 1, 1, 1,
0.2913087, -1.959153, 4.068589, 1, 1, 1, 1, 1,
0.2929469, 0.7883152, 1.435727, 1, 1, 1, 1, 1,
0.2929678, -2.14461, 3.472717, 1, 1, 1, 1, 1,
0.2953902, -1.334339, 1.911656, 1, 1, 1, 1, 1,
0.2969156, -1.469645, 1.798455, 1, 1, 1, 1, 1,
0.2979715, 0.1698821, 0.5122629, 1, 1, 1, 1, 1,
0.3056589, 0.1676223, 1.202713, 0, 0, 1, 1, 1,
0.306693, -1.199489, 2.99754, 1, 0, 0, 1, 1,
0.3134326, 0.2986438, 2.553988, 1, 0, 0, 1, 1,
0.315513, 0.08691771, 3.029421, 1, 0, 0, 1, 1,
0.3189269, -0.5112499, 1.448121, 1, 0, 0, 1, 1,
0.3201014, 1.102935, 2.31764, 1, 0, 0, 1, 1,
0.3219613, -0.3115648, 1.900232, 0, 0, 0, 1, 1,
0.3223505, -0.05088349, 0.5226988, 0, 0, 0, 1, 1,
0.3252325, -1.657039, 2.507402, 0, 0, 0, 1, 1,
0.3265981, -0.937653, 3.414027, 0, 0, 0, 1, 1,
0.3272752, 0.595742, -0.07584225, 0, 0, 0, 1, 1,
0.3286286, 0.2647735, -1.037689, 0, 0, 0, 1, 1,
0.3320209, 0.8851743, 0.4429958, 0, 0, 0, 1, 1,
0.3325197, 0.1675347, 1.913798, 1, 1, 1, 1, 1,
0.3325311, -0.2921364, 1.869711, 1, 1, 1, 1, 1,
0.3383479, -0.8875902, 1.676224, 1, 1, 1, 1, 1,
0.3391908, -1.201538, 4.842521, 1, 1, 1, 1, 1,
0.3420577, -1.443886, 3.30977, 1, 1, 1, 1, 1,
0.3444649, -0.3728646, 1.54523, 1, 1, 1, 1, 1,
0.3452663, -0.7495112, 2.021436, 1, 1, 1, 1, 1,
0.3501476, 2.924751, -1.310009, 1, 1, 1, 1, 1,
0.3516688, -1.19366, 4.318613, 1, 1, 1, 1, 1,
0.3534389, -2.305151, 2.469483, 1, 1, 1, 1, 1,
0.3599134, 0.4667798, 0.2536871, 1, 1, 1, 1, 1,
0.3627056, 0.8777221, 1.399172, 1, 1, 1, 1, 1,
0.3634468, -1.508863, 4.424077, 1, 1, 1, 1, 1,
0.3680505, -0.3911005, 2.98997, 1, 1, 1, 1, 1,
0.3694574, 0.6536784, 0.9563909, 1, 1, 1, 1, 1,
0.369883, -1.211441, 3.333696, 0, 0, 1, 1, 1,
0.3722036, -0.8622843, 3.381828, 1, 0, 0, 1, 1,
0.3740483, -0.2397317, 0.5826627, 1, 0, 0, 1, 1,
0.374505, -0.9361991, 2.454069, 1, 0, 0, 1, 1,
0.3757791, -0.04069713, 1.867772, 1, 0, 0, 1, 1,
0.3773106, 0.3753635, 0.2180057, 1, 0, 0, 1, 1,
0.3793202, 2.046806, 1.383882, 0, 0, 0, 1, 1,
0.3813622, 0.1860421, -0.7425488, 0, 0, 0, 1, 1,
0.3869, -0.3410925, 3.150696, 0, 0, 0, 1, 1,
0.387941, 0.2517539, -0.1607063, 0, 0, 0, 1, 1,
0.3912588, 2.25236, 1.267639, 0, 0, 0, 1, 1,
0.3942623, 0.08765321, 1.333897, 0, 0, 0, 1, 1,
0.4034688, -3.347453, 2.47041, 0, 0, 0, 1, 1,
0.4087055, 0.2421391, -0.4133062, 1, 1, 1, 1, 1,
0.4114253, 0.007288889, 2.175293, 1, 1, 1, 1, 1,
0.4117989, 0.4776357, 1.218428, 1, 1, 1, 1, 1,
0.412012, -0.1471915, 0.06804798, 1, 1, 1, 1, 1,
0.4126339, -1.179154, 4.040005, 1, 1, 1, 1, 1,
0.4134197, 0.7468298, 1.22738, 1, 1, 1, 1, 1,
0.4178353, 0.1278895, 0.6520235, 1, 1, 1, 1, 1,
0.4185458, 0.3183978, 1.412734, 1, 1, 1, 1, 1,
0.4208588, 1.754919, 0.2589785, 1, 1, 1, 1, 1,
0.4217544, 0.007934236, 0.4894839, 1, 1, 1, 1, 1,
0.423479, -0.7068857, 1.996027, 1, 1, 1, 1, 1,
0.4238307, 0.2077879, -0.8971437, 1, 1, 1, 1, 1,
0.4242996, 0.7759916, 0.7484195, 1, 1, 1, 1, 1,
0.4269375, 0.3685915, 0.8409607, 1, 1, 1, 1, 1,
0.4423807, -0.6532918, 1.865827, 1, 1, 1, 1, 1,
0.4425322, 0.9270927, 0.2958219, 0, 0, 1, 1, 1,
0.4437318, -0.7502507, 2.02819, 1, 0, 0, 1, 1,
0.4469214, -0.3706021, 0.9342687, 1, 0, 0, 1, 1,
0.4485312, 0.01456112, 0.2434107, 1, 0, 0, 1, 1,
0.453431, 0.6288047, 1.64212, 1, 0, 0, 1, 1,
0.4550143, 0.9348361, 0.6799024, 1, 0, 0, 1, 1,
0.4555431, -0.6386207, 0.6736718, 0, 0, 0, 1, 1,
0.4608422, 1.497821, -0.5216449, 0, 0, 0, 1, 1,
0.4632086, 0.3526613, 0.404254, 0, 0, 0, 1, 1,
0.4640157, 0.1991636, 1.28723, 0, 0, 0, 1, 1,
0.4660099, 0.8222294, 0.4477407, 0, 0, 0, 1, 1,
0.466486, 0.08362444, 4.024369, 0, 0, 0, 1, 1,
0.4665231, 1.445255, 0.09346254, 0, 0, 0, 1, 1,
0.4681342, -1.397492, 3.23433, 1, 1, 1, 1, 1,
0.4710899, -0.158638, 1.346247, 1, 1, 1, 1, 1,
0.4711191, 1.027833, -0.6525025, 1, 1, 1, 1, 1,
0.4753165, 1.203876, 1.868462, 1, 1, 1, 1, 1,
0.4787604, -1.050507, 2.866709, 1, 1, 1, 1, 1,
0.4854413, -1.116794, 3.829442, 1, 1, 1, 1, 1,
0.4860462, -0.8441802, 1.872945, 1, 1, 1, 1, 1,
0.4864761, -0.7504234, 2.675046, 1, 1, 1, 1, 1,
0.4865654, 0.6717527, 2.095358, 1, 1, 1, 1, 1,
0.4915096, 1.420598, 1.034612, 1, 1, 1, 1, 1,
0.4922611, 0.6149234, 0.7955285, 1, 1, 1, 1, 1,
0.5026939, -0.3035578, 1.88193, 1, 1, 1, 1, 1,
0.5055802, 0.3945184, 0.3026684, 1, 1, 1, 1, 1,
0.5059345, 0.3084948, -0.3783451, 1, 1, 1, 1, 1,
0.507174, 0.117801, 1.519471, 1, 1, 1, 1, 1,
0.5075639, -0.6953296, 2.480631, 0, 0, 1, 1, 1,
0.5082682, -0.6686066, 2.468381, 1, 0, 0, 1, 1,
0.5094263, -0.7709049, 4.370861, 1, 0, 0, 1, 1,
0.5107322, -0.3418088, 1.353988, 1, 0, 0, 1, 1,
0.5112804, 0.5688474, 1.321324, 1, 0, 0, 1, 1,
0.5122288, 0.9225278, 0.3185918, 1, 0, 0, 1, 1,
0.5140998, -1.755512, 3.207923, 0, 0, 0, 1, 1,
0.5176099, 1.153747, -0.008577048, 0, 0, 0, 1, 1,
0.5184331, 0.7116662, 0.7673534, 0, 0, 0, 1, 1,
0.5196199, 0.5253443, 1.952531, 0, 0, 0, 1, 1,
0.5270978, -0.3405142, 2.747863, 0, 0, 0, 1, 1,
0.5286473, -0.6203383, 1.819711, 0, 0, 0, 1, 1,
0.5304974, 0.5765654, -1.105932, 0, 0, 0, 1, 1,
0.5319737, 0.9123123, 0.4879019, 1, 1, 1, 1, 1,
0.5451492, -0.7088684, 3.385649, 1, 1, 1, 1, 1,
0.5459678, -0.08153876, 2.465351, 1, 1, 1, 1, 1,
0.5480492, 0.466972, 0.8703699, 1, 1, 1, 1, 1,
0.5489373, -0.5365461, 2.105357, 1, 1, 1, 1, 1,
0.5490834, 0.6441242, 1.577314, 1, 1, 1, 1, 1,
0.5538825, -0.595428, 1.97337, 1, 1, 1, 1, 1,
0.5542592, 0.5009784, 1.330472, 1, 1, 1, 1, 1,
0.5588377, 0.5756801, 0.2408207, 1, 1, 1, 1, 1,
0.567062, -0.08671793, 0.9809621, 1, 1, 1, 1, 1,
0.5675436, 0.7292292, 2.577116, 1, 1, 1, 1, 1,
0.5705817, -2.570903, 1.67869, 1, 1, 1, 1, 1,
0.5765369, -0.6184279, 3.576361, 1, 1, 1, 1, 1,
0.5768974, -0.7273457, 2.518139, 1, 1, 1, 1, 1,
0.5802347, -1.28183, 4.560053, 1, 1, 1, 1, 1,
0.5825246, 2.099233, 1.149713, 0, 0, 1, 1, 1,
0.5852655, -0.6383433, 2.377512, 1, 0, 0, 1, 1,
0.5885559, -0.02038044, 3.460202, 1, 0, 0, 1, 1,
0.5912129, 1.926105, 1.418947, 1, 0, 0, 1, 1,
0.5924689, 0.1245303, 0.885417, 1, 0, 0, 1, 1,
0.592945, -1.529095, 2.273933, 1, 0, 0, 1, 1,
0.5970966, 0.001845424, 1.561329, 0, 0, 0, 1, 1,
0.5983438, -1.085087, 2.143928, 0, 0, 0, 1, 1,
0.6063646, -0.6387225, 2.766617, 0, 0, 0, 1, 1,
0.6129214, 0.5378246, 1.716416, 0, 0, 0, 1, 1,
0.6130227, -2.461307, 2.485133, 0, 0, 0, 1, 1,
0.6185808, -0.5567726, 0.8486489, 0, 0, 0, 1, 1,
0.6192355, 0.6030446, 0.6369011, 0, 0, 0, 1, 1,
0.6276919, -0.5514877, 2.584374, 1, 1, 1, 1, 1,
0.6284252, -0.5602598, 2.568159, 1, 1, 1, 1, 1,
0.6328736, 0.361153, 0.802192, 1, 1, 1, 1, 1,
0.6353707, 0.1354286, 1.059079, 1, 1, 1, 1, 1,
0.6375026, 0.01727541, 1.517777, 1, 1, 1, 1, 1,
0.6395776, -0.1873698, 0.5806501, 1, 1, 1, 1, 1,
0.6426819, 0.5585117, 0.02095894, 1, 1, 1, 1, 1,
0.6430811, 0.7017735, 2.200196, 1, 1, 1, 1, 1,
0.6487767, -0.5299804, 2.275555, 1, 1, 1, 1, 1,
0.6532285, 1.359521, -0.6401712, 1, 1, 1, 1, 1,
0.6567038, 0.4558347, -0.3741083, 1, 1, 1, 1, 1,
0.6572285, 0.1064101, 1.615907, 1, 1, 1, 1, 1,
0.6613255, -0.4794038, 3.034803, 1, 1, 1, 1, 1,
0.6630228, 0.3042043, 2.02363, 1, 1, 1, 1, 1,
0.6643054, 0.3703755, 0.6245748, 1, 1, 1, 1, 1,
0.6721601, -0.8106181, 1.280322, 0, 0, 1, 1, 1,
0.672425, 0.6501275, -0.9518676, 1, 0, 0, 1, 1,
0.6739877, -2.00868, 2.431325, 1, 0, 0, 1, 1,
0.6749979, -0.05721339, 3.391824, 1, 0, 0, 1, 1,
0.6754612, 0.7196052, 0.3649779, 1, 0, 0, 1, 1,
0.6789023, -1.429738, 2.619698, 1, 0, 0, 1, 1,
0.67959, 0.4893436, 1.451041, 0, 0, 0, 1, 1,
0.6861179, 0.9264036, 0.02378675, 0, 0, 0, 1, 1,
0.6897553, 0.2708502, -0.8096116, 0, 0, 0, 1, 1,
0.698886, 1.416461, 0.7643641, 0, 0, 0, 1, 1,
0.7035016, 0.6700504, 0.7534277, 0, 0, 0, 1, 1,
0.7081985, 0.682687, 1.826453, 0, 0, 0, 1, 1,
0.7091759, -0.9725461, 3.613303, 0, 0, 0, 1, 1,
0.7127094, -1.61286, 1.706679, 1, 1, 1, 1, 1,
0.7137467, -0.8270548, 2.49391, 1, 1, 1, 1, 1,
0.7145894, -1.349567, 2.846766, 1, 1, 1, 1, 1,
0.716293, 0.1424146, 1.975328, 1, 1, 1, 1, 1,
0.7186962, 1.409032, 1.16946, 1, 1, 1, 1, 1,
0.7204493, -0.1662989, 2.457992, 1, 1, 1, 1, 1,
0.7382834, -1.809031, 3.622168, 1, 1, 1, 1, 1,
0.7396279, -0.1634229, 2.275428, 1, 1, 1, 1, 1,
0.7425038, -0.134864, 2.360316, 1, 1, 1, 1, 1,
0.750231, -0.8919411, 1.271456, 1, 1, 1, 1, 1,
0.75071, 1.024459, -0.5796372, 1, 1, 1, 1, 1,
0.7510067, -2.120895, 3.987514, 1, 1, 1, 1, 1,
0.76849, 0.2615258, 1.787926, 1, 1, 1, 1, 1,
0.7768802, 0.6643347, 0.4588119, 1, 1, 1, 1, 1,
0.7838407, -1.568947, 5.269833, 1, 1, 1, 1, 1,
0.7849363, 0.4216806, 2.416003, 0, 0, 1, 1, 1,
0.7883084, 2.159325, 1.164162, 1, 0, 0, 1, 1,
0.7901139, 1.684489, 0.9883013, 1, 0, 0, 1, 1,
0.7925928, 0.3950642, 1.188751, 1, 0, 0, 1, 1,
0.7944241, -1.80132, 4.278393, 1, 0, 0, 1, 1,
0.8067338, 0.1610486, 0.6808004, 1, 0, 0, 1, 1,
0.8075987, 0.3792935, 1.764318, 0, 0, 0, 1, 1,
0.8101686, -1.984747, 2.086093, 0, 0, 0, 1, 1,
0.8143846, 0.2385984, 1.854641, 0, 0, 0, 1, 1,
0.8221602, 0.4249933, -0.7332233, 0, 0, 0, 1, 1,
0.8231317, 0.8703228, 2.273938, 0, 0, 0, 1, 1,
0.823543, 0.476594, 1.164565, 0, 0, 0, 1, 1,
0.8312384, 0.5960118, 1.735318, 0, 0, 0, 1, 1,
0.831809, -0.7657309, 1.755704, 1, 1, 1, 1, 1,
0.8351526, 2.796417, 0.7378623, 1, 1, 1, 1, 1,
0.8353549, -0.8007822, 1.998512, 1, 1, 1, 1, 1,
0.8416354, -1.497652, 2.532396, 1, 1, 1, 1, 1,
0.8422698, -0.02306045, 1.910293, 1, 1, 1, 1, 1,
0.8423669, 0.2934232, 2.148638, 1, 1, 1, 1, 1,
0.8453627, 0.8803726, 0.9950557, 1, 1, 1, 1, 1,
0.8460737, 0.4994147, 0.7233153, 1, 1, 1, 1, 1,
0.8461037, 1.097007, 0.4870579, 1, 1, 1, 1, 1,
0.8495974, 0.5821673, 2.321475, 1, 1, 1, 1, 1,
0.8569154, 0.7249066, 1.729266, 1, 1, 1, 1, 1,
0.8774416, -0.2582138, 1.010912, 1, 1, 1, 1, 1,
0.8783188, 1.268193, 1.260306, 1, 1, 1, 1, 1,
0.8851544, -0.05903299, -0.6353574, 1, 1, 1, 1, 1,
0.9025024, -0.8653297, 1.427521, 1, 1, 1, 1, 1,
0.9043409, 0.2550089, 2.117432, 0, 0, 1, 1, 1,
0.905705, 1.136765, 1.524851, 1, 0, 0, 1, 1,
0.908996, 1.477871, 1.113744, 1, 0, 0, 1, 1,
0.9091601, 0.2408919, 0.5717725, 1, 0, 0, 1, 1,
0.9096169, -0.6427096, 1.236278, 1, 0, 0, 1, 1,
0.9160493, -0.3133832, 0.9297526, 1, 0, 0, 1, 1,
0.9240531, -0.7813642, 1.868627, 0, 0, 0, 1, 1,
0.9298649, 0.8776945, 0.6801549, 0, 0, 0, 1, 1,
0.9311089, -0.2670414, 2.95499, 0, 0, 0, 1, 1,
0.9357422, 0.9134246, 0.2000045, 0, 0, 0, 1, 1,
0.9361789, -0.1187978, 1.831636, 0, 0, 0, 1, 1,
0.9394673, -0.3393408, 1.735962, 0, 0, 0, 1, 1,
0.9424034, -0.6940482, 2.621259, 0, 0, 0, 1, 1,
0.9429113, 1.711097, -0.5517443, 1, 1, 1, 1, 1,
0.9529876, -0.1170001, 0.613271, 1, 1, 1, 1, 1,
0.9547418, -0.544929, 3.563775, 1, 1, 1, 1, 1,
0.9675225, 0.1752487, 1.212649, 1, 1, 1, 1, 1,
0.9704425, 0.1332256, 0.6320667, 1, 1, 1, 1, 1,
0.9722229, 1.007062, 1.298246, 1, 1, 1, 1, 1,
0.9889688, 1.320154, 2.280478, 1, 1, 1, 1, 1,
0.9961299, -0.4715042, 1.444217, 1, 1, 1, 1, 1,
1.004976, 0.9957016, -0.2305205, 1, 1, 1, 1, 1,
1.005568, -0.789117, 0.669765, 1, 1, 1, 1, 1,
1.012557, 0.2916167, -0.09742565, 1, 1, 1, 1, 1,
1.012584, 0.6434032, 0.1658045, 1, 1, 1, 1, 1,
1.017729, -0.06624483, 1.047095, 1, 1, 1, 1, 1,
1.018485, -0.2107106, 2.587282, 1, 1, 1, 1, 1,
1.020055, -1.004312, 1.951913, 1, 1, 1, 1, 1,
1.021163, -1.554181, 0.8351167, 0, 0, 1, 1, 1,
1.021508, -0.9355149, 1.428155, 1, 0, 0, 1, 1,
1.033051, 0.3425201, 1.609048, 1, 0, 0, 1, 1,
1.035873, -0.4243238, 3.374528, 1, 0, 0, 1, 1,
1.039096, -0.4031991, 3.457707, 1, 0, 0, 1, 1,
1.042213, -0.131436, 2.022076, 1, 0, 0, 1, 1,
1.042493, 0.3553112, 0.7736799, 0, 0, 0, 1, 1,
1.042575, -0.6555258, 1.382582, 0, 0, 0, 1, 1,
1.045542, 0.713897, 0.690921, 0, 0, 0, 1, 1,
1.054116, 0.4553132, 0.2819949, 0, 0, 0, 1, 1,
1.055484, 0.4063533, 0.7994559, 0, 0, 0, 1, 1,
1.057005, -0.5333828, 4.888329, 0, 0, 0, 1, 1,
1.062475, -0.3276625, 1.554628, 0, 0, 0, 1, 1,
1.067723, 0.3006766, 2.788101, 1, 1, 1, 1, 1,
1.070565, 1.037449, -0.5373945, 1, 1, 1, 1, 1,
1.07749, -1.253961, 1.073905, 1, 1, 1, 1, 1,
1.080948, -1.211116, 4.465867, 1, 1, 1, 1, 1,
1.082314, -0.252747, 1.798648, 1, 1, 1, 1, 1,
1.086836, 1.873082, 0.7959044, 1, 1, 1, 1, 1,
1.09282, -0.9865952, 1.686976, 1, 1, 1, 1, 1,
1.095045, -0.05583144, 2.716432, 1, 1, 1, 1, 1,
1.108618, 0.4283401, 0.1579657, 1, 1, 1, 1, 1,
1.118627, -1.338567, 1.206772, 1, 1, 1, 1, 1,
1.119566, -0.7657139, 1.772583, 1, 1, 1, 1, 1,
1.120545, -2.258186, 2.432384, 1, 1, 1, 1, 1,
1.122217, 0.4264907, 1.80938, 1, 1, 1, 1, 1,
1.138449, -1.005434, 2.352019, 1, 1, 1, 1, 1,
1.140373, -1.664226, 2.12832, 1, 1, 1, 1, 1,
1.140813, 1.541649, 0.809639, 0, 0, 1, 1, 1,
1.141412, 0.9750984, 2.806325, 1, 0, 0, 1, 1,
1.141895, -0.9952794, 1.280135, 1, 0, 0, 1, 1,
1.146843, -0.8010524, 3.91384, 1, 0, 0, 1, 1,
1.147582, -1.373093, 2.402973, 1, 0, 0, 1, 1,
1.155698, 0.117634, 1.853499, 1, 0, 0, 1, 1,
1.161469, -0.6149361, 0.5962299, 0, 0, 0, 1, 1,
1.168517, -0.5170819, 2.062943, 0, 0, 0, 1, 1,
1.169136, 0.5092171, 1.125168, 0, 0, 0, 1, 1,
1.180638, 0.4958031, 2.321665, 0, 0, 0, 1, 1,
1.180893, 1.029625, 0.783681, 0, 0, 0, 1, 1,
1.183489, 0.1221493, 0.8483675, 0, 0, 0, 1, 1,
1.184064, -1.052295, 2.368049, 0, 0, 0, 1, 1,
1.18763, 0.3609045, 1.301739, 1, 1, 1, 1, 1,
1.188408, 0.04184351, 2.898429, 1, 1, 1, 1, 1,
1.189754, -1.736829, 2.935814, 1, 1, 1, 1, 1,
1.200096, -1.626825, 3.824952, 1, 1, 1, 1, 1,
1.203668, -1.108583, 2.474064, 1, 1, 1, 1, 1,
1.208427, -2.163751, 2.990854, 1, 1, 1, 1, 1,
1.212145, -0.6107739, -0.1001829, 1, 1, 1, 1, 1,
1.212965, -0.01942616, 2.003585, 1, 1, 1, 1, 1,
1.212968, 0.132026, 2.772372, 1, 1, 1, 1, 1,
1.213926, -0.5254067, 3.223557, 1, 1, 1, 1, 1,
1.231499, 1.262638, 0.8006796, 1, 1, 1, 1, 1,
1.231621, 0.8038642, 2.031805, 1, 1, 1, 1, 1,
1.241259, -1.423185, 1.319083, 1, 1, 1, 1, 1,
1.250932, -0.1569312, 1.230223, 1, 1, 1, 1, 1,
1.253459, 0.3240187, 2.813029, 1, 1, 1, 1, 1,
1.263303, -0.1105975, 2.512664, 0, 0, 1, 1, 1,
1.286954, -0.2182683, 2.139688, 1, 0, 0, 1, 1,
1.300295, -0.511456, 2.005641, 1, 0, 0, 1, 1,
1.314233, -0.307355, 2.782124, 1, 0, 0, 1, 1,
1.315175, 2.001035, 0.9312007, 1, 0, 0, 1, 1,
1.320196, 0.9425734, 0.7388264, 1, 0, 0, 1, 1,
1.323804, 1.181191, 2.660303, 0, 0, 0, 1, 1,
1.33913, 0.6943841, 0.5872638, 0, 0, 0, 1, 1,
1.35262, 0.9475683, 0.03165949, 0, 0, 0, 1, 1,
1.353972, 1.541101, 0.8427538, 0, 0, 0, 1, 1,
1.36179, -0.03488216, 2.40133, 0, 0, 0, 1, 1,
1.363123, 0.9945783, 0.6803179, 0, 0, 0, 1, 1,
1.368801, -0.2959954, 1.385496, 0, 0, 0, 1, 1,
1.369323, -0.9553654, 2.871605, 1, 1, 1, 1, 1,
1.384729, -0.535702, 3.607275, 1, 1, 1, 1, 1,
1.387728, -0.8813491, 1.729311, 1, 1, 1, 1, 1,
1.395702, -1.398454, 3.087391, 1, 1, 1, 1, 1,
1.423931, -0.5604602, 1.50597, 1, 1, 1, 1, 1,
1.424797, 0.8928433, 0.2091857, 1, 1, 1, 1, 1,
1.428083, 1.679659, 0.3478225, 1, 1, 1, 1, 1,
1.430744, -0.5257018, 3.115083, 1, 1, 1, 1, 1,
1.433286, 0.7920893, 0.4398005, 1, 1, 1, 1, 1,
1.447874, -0.891284, 2.922876, 1, 1, 1, 1, 1,
1.450435, -1.698246, 3.097951, 1, 1, 1, 1, 1,
1.451328, 0.5177764, 2.192505, 1, 1, 1, 1, 1,
1.456101, 0.5745696, 0.8653961, 1, 1, 1, 1, 1,
1.456612, 1.078452, 0.1353554, 1, 1, 1, 1, 1,
1.460463, -0.3795294, 2.282353, 1, 1, 1, 1, 1,
1.468837, 0.1788721, 2.109629, 0, 0, 1, 1, 1,
1.470563, 1.519754, 0.6409061, 1, 0, 0, 1, 1,
1.475721, -0.4140444, 2.310832, 1, 0, 0, 1, 1,
1.478826, 0.4727154, 2.281887, 1, 0, 0, 1, 1,
1.485748, 1.014107, 2.95959, 1, 0, 0, 1, 1,
1.494468, 0.4152642, 0.1239569, 1, 0, 0, 1, 1,
1.496849, -1.435768, 2.998844, 0, 0, 0, 1, 1,
1.508913, 1.022859, 2.492625, 0, 0, 0, 1, 1,
1.512979, -2.272564, 3.832123, 0, 0, 0, 1, 1,
1.514439, -0.2268252, 2.344434, 0, 0, 0, 1, 1,
1.524891, -0.9777091, 3.23393, 0, 0, 0, 1, 1,
1.53653, 0.6914532, 0.8730282, 0, 0, 0, 1, 1,
1.550645, 1.872238, -0.5131435, 0, 0, 0, 1, 1,
1.564049, -0.9894472, 2.031352, 1, 1, 1, 1, 1,
1.585089, 0.9702488, 2.182132, 1, 1, 1, 1, 1,
1.608312, -0.3366757, 4.172853, 1, 1, 1, 1, 1,
1.616455, -0.1866957, 1.670229, 1, 1, 1, 1, 1,
1.619233, 0.5468197, 2.571886, 1, 1, 1, 1, 1,
1.651541, -0.494837, 3.044777, 1, 1, 1, 1, 1,
1.675237, 1.023081, 2.147407, 1, 1, 1, 1, 1,
1.680804, -0.9740145, 1.402978, 1, 1, 1, 1, 1,
1.686709, -1.108075, 2.558596, 1, 1, 1, 1, 1,
1.699223, -0.3465225, 1.296753, 1, 1, 1, 1, 1,
1.71304, 0.4685633, 2.005888, 1, 1, 1, 1, 1,
1.715057, 1.2526, -0.9295418, 1, 1, 1, 1, 1,
1.731855, -0.2075245, 1.869982, 1, 1, 1, 1, 1,
1.742182, -0.8569422, 2.975426, 1, 1, 1, 1, 1,
1.757219, 0.2373057, 2.729754, 1, 1, 1, 1, 1,
1.766405, 0.5643157, 1.324157, 0, 0, 1, 1, 1,
1.776643, -1.81678, 4.373031, 1, 0, 0, 1, 1,
1.793956, -0.5229141, 3.238128, 1, 0, 0, 1, 1,
1.799273, -0.5111462, 0.683956, 1, 0, 0, 1, 1,
1.803923, -0.2172721, 0.5399236, 1, 0, 0, 1, 1,
1.818715, 0.7969099, 2.402485, 1, 0, 0, 1, 1,
1.826047, 0.05449024, 1.177187, 0, 0, 0, 1, 1,
1.840148, -0.04214888, 1.673734, 0, 0, 0, 1, 1,
1.842642, -0.3182648, 0.6116618, 0, 0, 0, 1, 1,
1.856271, 1.449828, -0.182432, 0, 0, 0, 1, 1,
1.893829, 1.788879, 1.608865, 0, 0, 0, 1, 1,
1.907337, -0.3900634, 2.343604, 0, 0, 0, 1, 1,
1.919655, 0.5257784, 2.581841, 0, 0, 0, 1, 1,
1.921349, -0.8913954, 1.252676, 1, 1, 1, 1, 1,
1.929767, 0.7784982, 0.4104193, 1, 1, 1, 1, 1,
1.950605, 0.3656331, 0.3685687, 1, 1, 1, 1, 1,
1.961137, 0.5094177, 1.201088, 1, 1, 1, 1, 1,
1.975122, 1.741414, 1.364165, 1, 1, 1, 1, 1,
1.99229, 3.242161, 0.8043658, 1, 1, 1, 1, 1,
1.996611, 0.365696, 1.304348, 1, 1, 1, 1, 1,
2.019096, 1.214459, 0.08211358, 1, 1, 1, 1, 1,
2.09869, 1.135521, 1.30588, 1, 1, 1, 1, 1,
2.10868, -0.3254579, 1.648242, 1, 1, 1, 1, 1,
2.150558, 1.86428, 0.1054542, 1, 1, 1, 1, 1,
2.156186, -0.1651422, 0.3625202, 1, 1, 1, 1, 1,
2.159767, -1.231516, 2.125576, 1, 1, 1, 1, 1,
2.171554, 1.462601, 0.8147004, 1, 1, 1, 1, 1,
2.182094, 0.06125546, 1.242856, 1, 1, 1, 1, 1,
2.19579, -0.4804619, 3.349874, 0, 0, 1, 1, 1,
2.200322, -1.290683, 2.572901, 1, 0, 0, 1, 1,
2.260696, 1.334447, 1.269831, 1, 0, 0, 1, 1,
2.283282, -1.747274, 2.307223, 1, 0, 0, 1, 1,
2.309357, 0.1339899, 1.027582, 1, 0, 0, 1, 1,
2.309852, 0.6124581, 0.8210112, 1, 0, 0, 1, 1,
2.328086, 0.9104391, 2.640474, 0, 0, 0, 1, 1,
2.41814, 0.9715191, -0.6099759, 0, 0, 0, 1, 1,
2.438196, 0.3990707, 1.596474, 0, 0, 0, 1, 1,
2.451485, -0.9345574, 3.224567, 0, 0, 0, 1, 1,
2.460541, 0.5201141, 1.744258, 0, 0, 0, 1, 1,
2.470355, -0.3667195, 1.298847, 0, 0, 0, 1, 1,
2.622329, -0.1356526, 1.328671, 0, 0, 0, 1, 1,
2.679601, -0.4635566, 1.083404, 1, 1, 1, 1, 1,
2.723762, -0.5831571, 3.094497, 1, 1, 1, 1, 1,
2.742491, -1.036765, 1.194561, 1, 1, 1, 1, 1,
2.758497, -0.08874177, 0.496518, 1, 1, 1, 1, 1,
2.95392, -0.2515295, 1.266514, 1, 1, 1, 1, 1,
3.226176, 1.661025, 0.9715873, 1, 1, 1, 1, 1,
3.283613, -0.06171324, 0.5990633, 1, 1, 1, 1, 1
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
var radius = 9.572973;
var distance = 33.62466;
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
mvMatrix.translate( -0.0701139, -0.009177923, -0.02457619 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62466);
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
