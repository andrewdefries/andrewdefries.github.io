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
-3.036368, 0.5837106, -1.006169, 1, 0, 0, 1,
-2.620494, 0.1523123, -0.9216553, 1, 0.007843138, 0, 1,
-2.601627, -1.056502, -1.917924, 1, 0.01176471, 0, 1,
-2.592625, -0.2248001, -1.636604, 1, 0.01960784, 0, 1,
-2.448111, -0.4611622, -0.1240926, 1, 0.02352941, 0, 1,
-2.374067, -0.09942492, -2.02942, 1, 0.03137255, 0, 1,
-2.31922, -0.1895917, 0.2134195, 1, 0.03529412, 0, 1,
-2.295405, -1.044137, -3.908771, 1, 0.04313726, 0, 1,
-2.24794, -0.04169621, -2.577348, 1, 0.04705882, 0, 1,
-2.233931, 0.6551977, -0.8817533, 1, 0.05490196, 0, 1,
-2.184206, 2.115863, -0.3560513, 1, 0.05882353, 0, 1,
-2.050532, -0.03867559, -1.232947, 1, 0.06666667, 0, 1,
-2.042411, 0.1702316, -2.850231, 1, 0.07058824, 0, 1,
-1.958743, 1.934011, -1.213958, 1, 0.07843138, 0, 1,
-1.956147, -0.1224743, -1.530762, 1, 0.08235294, 0, 1,
-1.923923, -0.7444556, -2.091181, 1, 0.09019608, 0, 1,
-1.913042, -1.636973, -3.411266, 1, 0.09411765, 0, 1,
-1.872535, 0.007002516, -1.841479, 1, 0.1019608, 0, 1,
-1.83886, 1.1166, -1.050884, 1, 0.1098039, 0, 1,
-1.812775, -1.925866, -3.211119, 1, 0.1137255, 0, 1,
-1.805273, 1.356713, -1.0094, 1, 0.1215686, 0, 1,
-1.804767, 1.219015, -3.566956, 1, 0.1254902, 0, 1,
-1.798605, -0.2939644, -1.050083, 1, 0.1333333, 0, 1,
-1.788754, 0.4744752, -1.681001, 1, 0.1372549, 0, 1,
-1.77331, -1.529491, -2.866549, 1, 0.145098, 0, 1,
-1.773075, -0.4976517, -1.263369, 1, 0.1490196, 0, 1,
-1.761119, -0.2002001, -0.87823, 1, 0.1568628, 0, 1,
-1.745103, 0.402345, -1.262482, 1, 0.1607843, 0, 1,
-1.728164, 0.6377258, -1.038754, 1, 0.1686275, 0, 1,
-1.724113, 1.995919, 0.2214858, 1, 0.172549, 0, 1,
-1.721108, 1.245895, -1.275489, 1, 0.1803922, 0, 1,
-1.70324, -0.3389975, -2.196139, 1, 0.1843137, 0, 1,
-1.678759, -0.9350954, -0.7503152, 1, 0.1921569, 0, 1,
-1.649747, -2.309603, -3.330343, 1, 0.1960784, 0, 1,
-1.649319, -0.7542679, -2.273172, 1, 0.2039216, 0, 1,
-1.640507, -0.6499314, -0.7409755, 1, 0.2117647, 0, 1,
-1.640373, 0.7362012, -2.753399, 1, 0.2156863, 0, 1,
-1.6127, 0.06661552, -4.1102, 1, 0.2235294, 0, 1,
-1.611063, -0.00874285, -1.421289, 1, 0.227451, 0, 1,
-1.604798, 1.516454, -0.4181291, 1, 0.2352941, 0, 1,
-1.577693, -1.724768, -2.131534, 1, 0.2392157, 0, 1,
-1.567058, -0.3125191, -0.2805668, 1, 0.2470588, 0, 1,
-1.559118, 0.03132615, -2.861114, 1, 0.2509804, 0, 1,
-1.543437, 0.498141, -1.854606, 1, 0.2588235, 0, 1,
-1.53634, 0.02672818, -1.4834, 1, 0.2627451, 0, 1,
-1.526552, 0.1048512, -2.592393, 1, 0.2705882, 0, 1,
-1.516687, 1.490601, -1.020114, 1, 0.2745098, 0, 1,
-1.502194, 0.536575, -1.923791, 1, 0.282353, 0, 1,
-1.499776, -0.5563121, -2.100864, 1, 0.2862745, 0, 1,
-1.499198, 1.071864, -0.1637795, 1, 0.2941177, 0, 1,
-1.4933, -0.07882214, -1.090534, 1, 0.3019608, 0, 1,
-1.49328, -2.232525, -1.953631, 1, 0.3058824, 0, 1,
-1.471508, -0.8133789, -1.144116, 1, 0.3137255, 0, 1,
-1.469203, 1.222731, -1.685205, 1, 0.3176471, 0, 1,
-1.466846, -0.7855934, -2.372006, 1, 0.3254902, 0, 1,
-1.455632, -0.9742854, -1.914312, 1, 0.3294118, 0, 1,
-1.444838, -0.8404548, -1.12004, 1, 0.3372549, 0, 1,
-1.441006, -0.8136926, -2.504196, 1, 0.3411765, 0, 1,
-1.437357, 0.6981093, -1.045916, 1, 0.3490196, 0, 1,
-1.436499, 0.4343041, -2.010112, 1, 0.3529412, 0, 1,
-1.432617, -0.2548982, -1.700652, 1, 0.3607843, 0, 1,
-1.425803, 0.2560249, -1.13002, 1, 0.3647059, 0, 1,
-1.421974, 0.3066441, -2.788621, 1, 0.372549, 0, 1,
-1.421434, 0.3497191, -1.278664, 1, 0.3764706, 0, 1,
-1.41558, 0.6694304, -1.473071, 1, 0.3843137, 0, 1,
-1.39872, -0.3775727, -2.314505, 1, 0.3882353, 0, 1,
-1.354911, 0.09088738, -1.761415, 1, 0.3960784, 0, 1,
-1.354839, -0.5017729, -3.204831, 1, 0.4039216, 0, 1,
-1.350399, -0.2085669, -1.406906, 1, 0.4078431, 0, 1,
-1.349372, 0.7005228, -1.031997, 1, 0.4156863, 0, 1,
-1.337053, -1.792444, -2.891757, 1, 0.4196078, 0, 1,
-1.333207, 0.634721, -0.5428778, 1, 0.427451, 0, 1,
-1.321475, 0.676946, -1.645918, 1, 0.4313726, 0, 1,
-1.321137, 1.648546, -2.00661, 1, 0.4392157, 0, 1,
-1.319111, -0.1081303, -1.934453, 1, 0.4431373, 0, 1,
-1.31704, -0.6100969, -2.133602, 1, 0.4509804, 0, 1,
-1.30806, 0.6299499, -1.238748, 1, 0.454902, 0, 1,
-1.306649, -0.3409699, -2.024343, 1, 0.4627451, 0, 1,
-1.284791, 2.123624, -0.1320115, 1, 0.4666667, 0, 1,
-1.284322, -0.1270075, -1.694946, 1, 0.4745098, 0, 1,
-1.282019, -0.6838726, -3.507447, 1, 0.4784314, 0, 1,
-1.273979, -2.291475, -2.70457, 1, 0.4862745, 0, 1,
-1.272734, 0.4729819, -0.4942377, 1, 0.4901961, 0, 1,
-1.267097, -0.6037241, -1.520487, 1, 0.4980392, 0, 1,
-1.261201, -0.9082989, -1.67549, 1, 0.5058824, 0, 1,
-1.248058, 1.535886, -1.542058, 1, 0.509804, 0, 1,
-1.247579, -0.7874348, -3.302029, 1, 0.5176471, 0, 1,
-1.243973, 0.4006117, -0.9970115, 1, 0.5215687, 0, 1,
-1.242566, 1.919645, -0.6446628, 1, 0.5294118, 0, 1,
-1.237382, 0.7252464, -1.721084, 1, 0.5333334, 0, 1,
-1.222449, -0.8240815, -2.032139, 1, 0.5411765, 0, 1,
-1.22189, 0.8523651, -1.26317, 1, 0.5450981, 0, 1,
-1.217847, -0.2267964, -3.031612, 1, 0.5529412, 0, 1,
-1.216122, -0.3938479, -2.550417, 1, 0.5568628, 0, 1,
-1.215307, 1.268282, -1.359807, 1, 0.5647059, 0, 1,
-1.2148, 1.240845, -1.827707, 1, 0.5686275, 0, 1,
-1.203461, 0.8672733, -1.970285, 1, 0.5764706, 0, 1,
-1.200631, -0.7001358, -2.468153, 1, 0.5803922, 0, 1,
-1.191667, 0.8298569, 0.2643221, 1, 0.5882353, 0, 1,
-1.181067, 0.501417, -1.460236, 1, 0.5921569, 0, 1,
-1.179977, -0.3600335, -2.393646, 1, 0.6, 0, 1,
-1.176395, 0.08543208, -0.267056, 1, 0.6078432, 0, 1,
-1.170676, -0.5808461, -2.22938, 1, 0.6117647, 0, 1,
-1.167405, 1.411785, -1.170728, 1, 0.6196079, 0, 1,
-1.15875, -1.171891, -2.571631, 1, 0.6235294, 0, 1,
-1.142611, 0.508947, -0.9045819, 1, 0.6313726, 0, 1,
-1.136743, -2.140842, -2.539518, 1, 0.6352941, 0, 1,
-1.135264, -0.4050075, -2.654565, 1, 0.6431373, 0, 1,
-1.12501, 1.972827, -1.837954, 1, 0.6470588, 0, 1,
-1.120032, -1.363859, -4.472556, 1, 0.654902, 0, 1,
-1.118441, 0.6973626, -1.55789, 1, 0.6588235, 0, 1,
-1.116489, -0.9044465, -1.330029, 1, 0.6666667, 0, 1,
-1.115876, 1.608144, -1.948959, 1, 0.6705883, 0, 1,
-1.112975, -0.4944693, -2.281235, 1, 0.6784314, 0, 1,
-1.102162, -0.3867241, -1.880132, 1, 0.682353, 0, 1,
-1.097719, 0.2212507, -0.8772695, 1, 0.6901961, 0, 1,
-1.09261, 0.1771332, -2.708554, 1, 0.6941177, 0, 1,
-1.083497, 0.8807287, -0.7251713, 1, 0.7019608, 0, 1,
-1.080776, -0.7303624, -1.473794, 1, 0.7098039, 0, 1,
-1.078672, -1.510667, -3.343181, 1, 0.7137255, 0, 1,
-1.07033, -0.6422369, -2.179916, 1, 0.7215686, 0, 1,
-1.068778, 0.02063379, -3.749128, 1, 0.7254902, 0, 1,
-1.068499, 1.141217, 1.936379, 1, 0.7333333, 0, 1,
-1.067497, 0.6938944, -0.5653147, 1, 0.7372549, 0, 1,
-1.056191, 2.360005, -0.3868207, 1, 0.7450981, 0, 1,
-1.052095, 0.8284557, -1.51172, 1, 0.7490196, 0, 1,
-1.050934, -0.9320526, -1.695974, 1, 0.7568628, 0, 1,
-1.041404, 0.2519039, 0.1392823, 1, 0.7607843, 0, 1,
-1.039605, 0.8720172, 0.6554562, 1, 0.7686275, 0, 1,
-1.037481, -0.3245501, -1.829047, 1, 0.772549, 0, 1,
-1.037357, -1.570156, -2.048687, 1, 0.7803922, 0, 1,
-1.03722, -1.493325, -3.115975, 1, 0.7843137, 0, 1,
-1.036675, -0.2545009, -3.100522, 1, 0.7921569, 0, 1,
-1.035771, 0.1639799, -2.814143, 1, 0.7960784, 0, 1,
-1.032778, 0.7628229, -2.028698, 1, 0.8039216, 0, 1,
-1.030964, -0.5322112, -2.489424, 1, 0.8117647, 0, 1,
-1.028712, -2.089602, -2.339028, 1, 0.8156863, 0, 1,
-1.02307, -0.08534255, -1.55797, 1, 0.8235294, 0, 1,
-1.014519, 0.2152399, -1.647617, 1, 0.827451, 0, 1,
-1.014461, 0.4327684, -2.57427, 1, 0.8352941, 0, 1,
-1.011837, 0.22045, -3.861649, 1, 0.8392157, 0, 1,
-1.011125, -0.2502946, -3.6853, 1, 0.8470588, 0, 1,
-1.00321, 0.1582789, -1.319377, 1, 0.8509804, 0, 1,
-0.9999032, -1.263795, -1.584733, 1, 0.8588235, 0, 1,
-0.9998184, -0.5733791, -2.092179, 1, 0.8627451, 0, 1,
-0.9997643, -1.617738, -2.879864, 1, 0.8705882, 0, 1,
-0.9936668, 0.03721609, -2.087821, 1, 0.8745098, 0, 1,
-0.9898843, 1.287114, -0.2092922, 1, 0.8823529, 0, 1,
-0.9898672, 0.01569405, -1.029751, 1, 0.8862745, 0, 1,
-0.9870618, 3.036795, 1.149831, 1, 0.8941177, 0, 1,
-0.9735188, -1.209091, -2.059459, 1, 0.8980392, 0, 1,
-0.9720533, 1.392736, -0.8644222, 1, 0.9058824, 0, 1,
-0.9715239, -1.374829, -1.349902, 1, 0.9137255, 0, 1,
-0.9625029, -0.3672328, -1.734768, 1, 0.9176471, 0, 1,
-0.9621417, -0.1989779, -0.9116214, 1, 0.9254902, 0, 1,
-0.9589, -0.5175237, -2.011641, 1, 0.9294118, 0, 1,
-0.9548168, 0.1731945, -1.430288, 1, 0.9372549, 0, 1,
-0.9505149, -0.4938644, -1.027205, 1, 0.9411765, 0, 1,
-0.9411891, -0.9571813, -2.784698, 1, 0.9490196, 0, 1,
-0.9397274, 0.1125304, 1.381912, 1, 0.9529412, 0, 1,
-0.9373749, 0.02906837, -1.141882, 1, 0.9607843, 0, 1,
-0.9367787, -0.09046122, -0.9782926, 1, 0.9647059, 0, 1,
-0.9362752, 0.09191396, -1.487642, 1, 0.972549, 0, 1,
-0.9258022, -0.2244195, -3.164459, 1, 0.9764706, 0, 1,
-0.9182126, 1.087026, -0.2239752, 1, 0.9843137, 0, 1,
-0.9176229, 2.159046, 0.9939393, 1, 0.9882353, 0, 1,
-0.9175677, -0.7416648, -2.13923, 1, 0.9960784, 0, 1,
-0.91378, 0.3727361, -1.725397, 0.9960784, 1, 0, 1,
-0.9110608, 0.9008058, -0.6389725, 0.9921569, 1, 0, 1,
-0.9103391, -0.7406512, -3.599993, 0.9843137, 1, 0, 1,
-0.9081923, 0.7719606, -1.618676, 0.9803922, 1, 0, 1,
-0.9063083, -1.556837, -1.590148, 0.972549, 1, 0, 1,
-0.9047568, 0.7736756, -1.778285, 0.9686275, 1, 0, 1,
-0.9012806, -0.7953046, -0.6429849, 0.9607843, 1, 0, 1,
-0.8939689, -0.7511174, -2.615498, 0.9568627, 1, 0, 1,
-0.8899232, -0.4097618, -2.578791, 0.9490196, 1, 0, 1,
-0.8773281, -0.5079789, -1.301211, 0.945098, 1, 0, 1,
-0.866774, -1.573699, -4.728859, 0.9372549, 1, 0, 1,
-0.8650608, -1.083661, -2.856881, 0.9333333, 1, 0, 1,
-0.8637652, 1.00506, 0.03831668, 0.9254902, 1, 0, 1,
-0.8612328, -1.000362, -2.711385, 0.9215686, 1, 0, 1,
-0.8605692, 0.03570036, -1.313068, 0.9137255, 1, 0, 1,
-0.8589976, -0.9996946, -3.144228, 0.9098039, 1, 0, 1,
-0.8555533, 0.1654967, -2.174615, 0.9019608, 1, 0, 1,
-0.8487875, 0.1877817, -1.677233, 0.8941177, 1, 0, 1,
-0.8465217, 0.1912486, -0.6204264, 0.8901961, 1, 0, 1,
-0.8278644, 0.9840664, 0.6073188, 0.8823529, 1, 0, 1,
-0.8243449, -0.481329, -3.140297, 0.8784314, 1, 0, 1,
-0.8214703, 0.2023236, -0.7648707, 0.8705882, 1, 0, 1,
-0.8166639, -0.7375618, -1.910522, 0.8666667, 1, 0, 1,
-0.801034, 0.4909967, -2.3152, 0.8588235, 1, 0, 1,
-0.7899232, -0.2177983, -1.293563, 0.854902, 1, 0, 1,
-0.7890912, 1.525401, 0.5505668, 0.8470588, 1, 0, 1,
-0.7776801, 2.466538, -0.5357667, 0.8431373, 1, 0, 1,
-0.7763944, 0.03455385, -1.985905, 0.8352941, 1, 0, 1,
-0.7743949, -0.6629998, -3.243322, 0.8313726, 1, 0, 1,
-0.7707615, 2.230745, -2.546396, 0.8235294, 1, 0, 1,
-0.7678295, 0.1487807, -0.7354699, 0.8196079, 1, 0, 1,
-0.7638643, 0.6933933, -1.435159, 0.8117647, 1, 0, 1,
-0.7636591, 0.7584761, -0.6505155, 0.8078431, 1, 0, 1,
-0.7611226, -2.658109, -2.675378, 0.8, 1, 0, 1,
-0.7577997, 0.3050584, -0.1021001, 0.7921569, 1, 0, 1,
-0.7553179, 0.01497903, -1.104436, 0.7882353, 1, 0, 1,
-0.7545698, 0.05030387, -2.724595, 0.7803922, 1, 0, 1,
-0.7540233, -0.5562379, -0.5868033, 0.7764706, 1, 0, 1,
-0.7537177, 1.58693, 0.7094737, 0.7686275, 1, 0, 1,
-0.7537145, 1.453217, -2.774484, 0.7647059, 1, 0, 1,
-0.7501552, 2.213965, -1.012752, 0.7568628, 1, 0, 1,
-0.746525, -0.8482341, -1.889562, 0.7529412, 1, 0, 1,
-0.7455193, -1.677306, -2.106781, 0.7450981, 1, 0, 1,
-0.7379681, -1.887719, -2.119593, 0.7411765, 1, 0, 1,
-0.7360479, 1.514699, -1.332151, 0.7333333, 1, 0, 1,
-0.7335593, -2.597882, -3.65941, 0.7294118, 1, 0, 1,
-0.7321898, 0.0702747, -1.570158, 0.7215686, 1, 0, 1,
-0.7245792, 1.21848, 0.04778327, 0.7176471, 1, 0, 1,
-0.7227687, 0.04998888, -2.679636, 0.7098039, 1, 0, 1,
-0.7210176, 1.143253, -1.534494, 0.7058824, 1, 0, 1,
-0.7194943, -2.313418, -2.998985, 0.6980392, 1, 0, 1,
-0.717296, -0.7803602, -2.277427, 0.6901961, 1, 0, 1,
-0.7143089, -2.422162, -2.468661, 0.6862745, 1, 0, 1,
-0.7122334, -0.2016837, -3.07178, 0.6784314, 1, 0, 1,
-0.7079673, 0.5069764, -1.126869, 0.6745098, 1, 0, 1,
-0.7018723, 0.01555039, -0.6796259, 0.6666667, 1, 0, 1,
-0.6870467, 1.651287, -1.079984, 0.6627451, 1, 0, 1,
-0.6858578, -0.483085, -2.235593, 0.654902, 1, 0, 1,
-0.6828497, 0.09456506, -2.157047, 0.6509804, 1, 0, 1,
-0.6821585, 1.370005, 2.466902, 0.6431373, 1, 0, 1,
-0.6769578, -0.5481192, -0.2849458, 0.6392157, 1, 0, 1,
-0.6743177, -1.955542, -3.023429, 0.6313726, 1, 0, 1,
-0.674001, 0.5543642, 0.483163, 0.627451, 1, 0, 1,
-0.6717024, 0.8054854, 0.3880334, 0.6196079, 1, 0, 1,
-0.6704056, 0.586353, -0.8029982, 0.6156863, 1, 0, 1,
-0.6696835, -0.1156045, -1.846488, 0.6078432, 1, 0, 1,
-0.6659729, -1.596703, -2.46014, 0.6039216, 1, 0, 1,
-0.6640792, -0.4952077, -2.376225, 0.5960785, 1, 0, 1,
-0.6620902, 1.074249, -0.8610992, 0.5882353, 1, 0, 1,
-0.6616879, -0.168147, -0.7695258, 0.5843138, 1, 0, 1,
-0.6490371, 1.829157, -0.1917543, 0.5764706, 1, 0, 1,
-0.6383265, 0.05443255, -0.9538792, 0.572549, 1, 0, 1,
-0.6273517, -0.8498206, -0.5622547, 0.5647059, 1, 0, 1,
-0.6189291, -0.7720111, -2.011019, 0.5607843, 1, 0, 1,
-0.6133144, -1.014343, -1.421371, 0.5529412, 1, 0, 1,
-0.6123965, 0.452879, -0.6049168, 0.5490196, 1, 0, 1,
-0.6054384, -0.2509826, -3.073842, 0.5411765, 1, 0, 1,
-0.6047503, 0.7571993, -0.7956134, 0.5372549, 1, 0, 1,
-0.604423, 0.1293921, -0.39561, 0.5294118, 1, 0, 1,
-0.591035, 0.9448833, -1.883714, 0.5254902, 1, 0, 1,
-0.5815521, 1.174217, 1.250884, 0.5176471, 1, 0, 1,
-0.579406, 2.342122, -1.602543, 0.5137255, 1, 0, 1,
-0.5707986, 1.975824, 0.384887, 0.5058824, 1, 0, 1,
-0.5703863, -0.6671292, -2.847926, 0.5019608, 1, 0, 1,
-0.5693194, -0.7841369, -2.84954, 0.4941176, 1, 0, 1,
-0.5679119, -0.8703172, -3.021995, 0.4862745, 1, 0, 1,
-0.566268, 0.5022451, -0.2473889, 0.4823529, 1, 0, 1,
-0.5648825, 0.1159306, -0.805453, 0.4745098, 1, 0, 1,
-0.5617203, 1.616996, 0.04765325, 0.4705882, 1, 0, 1,
-0.56149, 0.9315, -1.63545, 0.4627451, 1, 0, 1,
-0.5583807, 0.1805861, -0.8846384, 0.4588235, 1, 0, 1,
-0.5559974, 0.5122008, 0.005031269, 0.4509804, 1, 0, 1,
-0.545822, 0.8307326, -2.390911, 0.4470588, 1, 0, 1,
-0.5441631, 1.152457, -1.797226, 0.4392157, 1, 0, 1,
-0.5438743, -1.31868, -1.868607, 0.4352941, 1, 0, 1,
-0.54217, 0.6669647, 0.9502822, 0.427451, 1, 0, 1,
-0.5405032, -0.9743931, -1.033293, 0.4235294, 1, 0, 1,
-0.5363511, -0.7756618, -4.665746, 0.4156863, 1, 0, 1,
-0.5333866, -0.9548998, -2.749815, 0.4117647, 1, 0, 1,
-0.5288227, -1.415044, -4.4972, 0.4039216, 1, 0, 1,
-0.5221061, -0.8711305, -3.438981, 0.3960784, 1, 0, 1,
-0.5217252, -1.301124, -1.5415, 0.3921569, 1, 0, 1,
-0.5208272, -0.2419218, -1.92433, 0.3843137, 1, 0, 1,
-0.5205252, 0.2704936, -1.076492, 0.3803922, 1, 0, 1,
-0.5189754, 1.016442, -1.756195, 0.372549, 1, 0, 1,
-0.5172135, 0.812162, -0.1536293, 0.3686275, 1, 0, 1,
-0.515772, -0.9194335, -1.723211, 0.3607843, 1, 0, 1,
-0.5147851, -0.2205726, -2.427606, 0.3568628, 1, 0, 1,
-0.5138366, -0.3677817, -2.022104, 0.3490196, 1, 0, 1,
-0.5122252, -0.6406318, -2.643925, 0.345098, 1, 0, 1,
-0.5102892, -0.5856484, -4.09297, 0.3372549, 1, 0, 1,
-0.5100792, -0.9068463, -1.713261, 0.3333333, 1, 0, 1,
-0.5085976, 0.06496985, -1.377548, 0.3254902, 1, 0, 1,
-0.5034897, 1.849681, -0.9510095, 0.3215686, 1, 0, 1,
-0.4968828, -1.119035, -2.007484, 0.3137255, 1, 0, 1,
-0.4928232, 1.351519, 0.4363268, 0.3098039, 1, 0, 1,
-0.4927398, 0.0221337, -2.97639, 0.3019608, 1, 0, 1,
-0.4924425, 0.0782994, -1.355508, 0.2941177, 1, 0, 1,
-0.4848809, -0.4879597, -1.381037, 0.2901961, 1, 0, 1,
-0.4846127, 1.176849, 0.6715398, 0.282353, 1, 0, 1,
-0.4844759, -1.089918, -3.825852, 0.2784314, 1, 0, 1,
-0.4837565, 0.3357294, 0.09195277, 0.2705882, 1, 0, 1,
-0.4811282, 1.687377, -0.8955215, 0.2666667, 1, 0, 1,
-0.4787937, -0.8418738, -3.928015, 0.2588235, 1, 0, 1,
-0.4781751, 0.6449065, -0.9046727, 0.254902, 1, 0, 1,
-0.4769906, -1.323316, -3.454124, 0.2470588, 1, 0, 1,
-0.4739586, 1.363415, -0.7706065, 0.2431373, 1, 0, 1,
-0.472682, -1.125975, -0.9291578, 0.2352941, 1, 0, 1,
-0.472095, -0.980487, -4.580915, 0.2313726, 1, 0, 1,
-0.4690849, 0.3455888, 0.859696, 0.2235294, 1, 0, 1,
-0.4660392, -0.6338748, -2.054468, 0.2196078, 1, 0, 1,
-0.4646399, -1.775392, -2.287192, 0.2117647, 1, 0, 1,
-0.4640487, -1.229249, -3.873319, 0.2078431, 1, 0, 1,
-0.4635287, 1.47955, -0.93505, 0.2, 1, 0, 1,
-0.4620217, 0.2900158, -0.7092782, 0.1921569, 1, 0, 1,
-0.4610917, -1.58533, -3.131582, 0.1882353, 1, 0, 1,
-0.4510452, 1.123833, -0.07657146, 0.1803922, 1, 0, 1,
-0.4487605, -0.5178857, -1.580528, 0.1764706, 1, 0, 1,
-0.4442863, -0.3866329, -1.861418, 0.1686275, 1, 0, 1,
-0.4441339, 1.498387, 1.126317, 0.1647059, 1, 0, 1,
-0.4401602, -0.202627, -2.142735, 0.1568628, 1, 0, 1,
-0.4384739, -0.4851686, -2.937666, 0.1529412, 1, 0, 1,
-0.4366379, -0.2927508, -1.687563, 0.145098, 1, 0, 1,
-0.4356441, 1.026802, 0.4041128, 0.1411765, 1, 0, 1,
-0.4345107, -1.192095, -0.8755467, 0.1333333, 1, 0, 1,
-0.4345072, -0.0004744595, -2.857153, 0.1294118, 1, 0, 1,
-0.4343717, -0.6146608, -2.972009, 0.1215686, 1, 0, 1,
-0.430804, 0.5103714, -1.771015, 0.1176471, 1, 0, 1,
-0.4289955, 0.5302739, -2.99762, 0.1098039, 1, 0, 1,
-0.4257929, -0.7262522, -3.851239, 0.1058824, 1, 0, 1,
-0.4249777, -1.416828, -2.590168, 0.09803922, 1, 0, 1,
-0.4192811, 0.5518473, 0.8525963, 0.09019608, 1, 0, 1,
-0.4144397, -0.4233239, -0.9152294, 0.08627451, 1, 0, 1,
-0.4090519, -2.069366, -1.535609, 0.07843138, 1, 0, 1,
-0.4082188, -1.821435, -3.943875, 0.07450981, 1, 0, 1,
-0.4040113, 0.948128, 0.8658567, 0.06666667, 1, 0, 1,
-0.3973306, -0.3797913, -3.74508, 0.0627451, 1, 0, 1,
-0.3909092, 2.313834, -0.5734172, 0.05490196, 1, 0, 1,
-0.3862095, -1.234992, -3.946097, 0.05098039, 1, 0, 1,
-0.3832003, 0.7048579, 0.2360349, 0.04313726, 1, 0, 1,
-0.3827655, -0.9420962, -0.2235764, 0.03921569, 1, 0, 1,
-0.3825047, 0.9871194, -0.2570956, 0.03137255, 1, 0, 1,
-0.3822195, -2.401324, -1.256724, 0.02745098, 1, 0, 1,
-0.3764689, -0.3194469, -2.735929, 0.01960784, 1, 0, 1,
-0.3763532, 0.1339228, -2.949165, 0.01568628, 1, 0, 1,
-0.3755738, 1.382584, -1.04232, 0.007843138, 1, 0, 1,
-0.374697, -0.099387, -1.610661, 0.003921569, 1, 0, 1,
-0.3658749, -0.4256068, -2.120629, 0, 1, 0.003921569, 1,
-0.3570818, -0.1270091, -2.304121, 0, 1, 0.01176471, 1,
-0.3566117, -0.8913756, -2.493449, 0, 1, 0.01568628, 1,
-0.3548053, -0.551892, -2.272988, 0, 1, 0.02352941, 1,
-0.3543096, 1.281174, -1.511998, 0, 1, 0.02745098, 1,
-0.3515946, 0.4147844, -0.3249381, 0, 1, 0.03529412, 1,
-0.3511068, -1.981447, -2.4215, 0, 1, 0.03921569, 1,
-0.3501012, -1.012193, -4.063107, 0, 1, 0.04705882, 1,
-0.346649, 1.358132, -1.580323, 0, 1, 0.05098039, 1,
-0.3414031, -0.2825834, -3.41713, 0, 1, 0.05882353, 1,
-0.3410332, -0.3517757, -3.109731, 0, 1, 0.0627451, 1,
-0.3406246, 1.359304, -1.550715, 0, 1, 0.07058824, 1,
-0.3331975, 1.502169, 0.1434968, 0, 1, 0.07450981, 1,
-0.3323203, 0.8012826, -0.9417147, 0, 1, 0.08235294, 1,
-0.3300263, -1.678079, -1.603379, 0, 1, 0.08627451, 1,
-0.3268546, -0.9020382, -2.239358, 0, 1, 0.09411765, 1,
-0.3264336, -1.105765, -3.658907, 0, 1, 0.1019608, 1,
-0.3242727, -1.699811, -3.625512, 0, 1, 0.1058824, 1,
-0.3175663, 0.529741, -0.8998936, 0, 1, 0.1137255, 1,
-0.3166636, 1.130882, 2.353429, 0, 1, 0.1176471, 1,
-0.3162202, 0.8045238, 0.9354784, 0, 1, 0.1254902, 1,
-0.3150661, 2.242239, -0.4907258, 0, 1, 0.1294118, 1,
-0.3121568, -1.387385, -3.482089, 0, 1, 0.1372549, 1,
-0.308586, 0.378344, -0.8947585, 0, 1, 0.1411765, 1,
-0.3085061, 1.801783, -0.3765974, 0, 1, 0.1490196, 1,
-0.3060615, 1.033941, 0.5730208, 0, 1, 0.1529412, 1,
-0.3056332, 0.1770907, -0.9121307, 0, 1, 0.1607843, 1,
-0.3013559, -1.883047, -3.125829, 0, 1, 0.1647059, 1,
-0.3001604, -0.3104647, -3.638814, 0, 1, 0.172549, 1,
-0.2976595, -0.5778026, -1.96103, 0, 1, 0.1764706, 1,
-0.2941452, 1.164895, 0.7263435, 0, 1, 0.1843137, 1,
-0.2917883, -0.9927597, -2.399719, 0, 1, 0.1882353, 1,
-0.2880708, 1.553149, -0.2622771, 0, 1, 0.1960784, 1,
-0.2874747, 1.22663, 1.84994, 0, 1, 0.2039216, 1,
-0.2817437, 2.178211, -0.7880983, 0, 1, 0.2078431, 1,
-0.2816818, 1.834282, 1.359166, 0, 1, 0.2156863, 1,
-0.2788989, 1.224932, -0.8823992, 0, 1, 0.2196078, 1,
-0.2778772, 0.05290586, -3.147981, 0, 1, 0.227451, 1,
-0.2767885, -0.2199642, -2.194963, 0, 1, 0.2313726, 1,
-0.2739826, 0.4220115, 0.5037658, 0, 1, 0.2392157, 1,
-0.2708648, -1.22966, -3.866543, 0, 1, 0.2431373, 1,
-0.2676558, -0.4027214, -2.634581, 0, 1, 0.2509804, 1,
-0.2644392, 0.1724977, 0.6835837, 0, 1, 0.254902, 1,
-0.2622945, -0.8007037, -2.877026, 0, 1, 0.2627451, 1,
-0.2592419, 0.1696309, -0.8808247, 0, 1, 0.2666667, 1,
-0.2588425, 0.2495129, -1.741346, 0, 1, 0.2745098, 1,
-0.2586538, -0.2016631, -3.489407, 0, 1, 0.2784314, 1,
-0.2574961, 0.6756634, -0.4296267, 0, 1, 0.2862745, 1,
-0.2554865, -0.7953609, -4.646543, 0, 1, 0.2901961, 1,
-0.2538451, -1.78306, -2.999849, 0, 1, 0.2980392, 1,
-0.2528008, 0.3165599, -0.7195348, 0, 1, 0.3058824, 1,
-0.2473873, 1.044839, -0.01935195, 0, 1, 0.3098039, 1,
-0.2463026, 0.3899927, -1.260497, 0, 1, 0.3176471, 1,
-0.246302, -0.6958334, -2.590163, 0, 1, 0.3215686, 1,
-0.245887, -0.2779512, -2.016006, 0, 1, 0.3294118, 1,
-0.2449767, 1.242157, -1.609742, 0, 1, 0.3333333, 1,
-0.2448754, 1.19462, -1.817716, 0, 1, 0.3411765, 1,
-0.2436039, -1.862076, -2.069366, 0, 1, 0.345098, 1,
-0.2389244, -0.5950583, -0.9805284, 0, 1, 0.3529412, 1,
-0.238438, -0.3852247, -2.657059, 0, 1, 0.3568628, 1,
-0.2372915, -0.527473, -2.858501, 0, 1, 0.3647059, 1,
-0.2366757, 1.195123, 1.749106, 0, 1, 0.3686275, 1,
-0.233355, 0.6739374, 0.150895, 0, 1, 0.3764706, 1,
-0.2322256, -0.7052791, -0.9724849, 0, 1, 0.3803922, 1,
-0.2252836, 1.423109, 1.320982, 0, 1, 0.3882353, 1,
-0.2251208, 1.330519, -0.1240163, 0, 1, 0.3921569, 1,
-0.2238288, 0.3182277, -0.01979103, 0, 1, 0.4, 1,
-0.2205174, -0.6377947, -2.955752, 0, 1, 0.4078431, 1,
-0.2161558, -0.2828622, -1.482589, 0, 1, 0.4117647, 1,
-0.2156388, -0.6006408, -1.70881, 0, 1, 0.4196078, 1,
-0.2132085, 1.008677, -1.663867, 0, 1, 0.4235294, 1,
-0.2129479, 0.2411294, 1.462982, 0, 1, 0.4313726, 1,
-0.212536, -1.51072, -2.554672, 0, 1, 0.4352941, 1,
-0.2112485, -0.1628218, -1.558037, 0, 1, 0.4431373, 1,
-0.2097639, 0.0324114, -0.4115382, 0, 1, 0.4470588, 1,
-0.2086975, -2.128891, -3.838361, 0, 1, 0.454902, 1,
-0.2086095, -0.4604239, -2.833065, 0, 1, 0.4588235, 1,
-0.2059725, 2.538079, 1.358694, 0, 1, 0.4666667, 1,
-0.1957804, 0.178596, -0.2979648, 0, 1, 0.4705882, 1,
-0.1955097, 0.5256768, -1.682114, 0, 1, 0.4784314, 1,
-0.1951999, -1.036909, -2.171205, 0, 1, 0.4823529, 1,
-0.1927065, -0.6066873, -3.574227, 0, 1, 0.4901961, 1,
-0.1832808, -0.6039102, -1.162469, 0, 1, 0.4941176, 1,
-0.1801038, 0.7008791, 0.02412206, 0, 1, 0.5019608, 1,
-0.1798438, 0.0001985934, -2.534771, 0, 1, 0.509804, 1,
-0.1775859, -0.2622923, -2.122491, 0, 1, 0.5137255, 1,
-0.1756995, -1.595907, -3.705794, 0, 1, 0.5215687, 1,
-0.1738702, 0.5429786, -0.09819851, 0, 1, 0.5254902, 1,
-0.1734992, 1.258979, -1.538225, 0, 1, 0.5333334, 1,
-0.1700533, -2.377236, -3.115203, 0, 1, 0.5372549, 1,
-0.169422, 2.174986, -0.7707615, 0, 1, 0.5450981, 1,
-0.1666342, -0.6331469, -3.03717, 0, 1, 0.5490196, 1,
-0.1659575, -1.174168, -3.084002, 0, 1, 0.5568628, 1,
-0.1635877, 0.2110949, -0.4023905, 0, 1, 0.5607843, 1,
-0.1630597, -0.6350446, -2.172654, 0, 1, 0.5686275, 1,
-0.1627951, 0.5311761, -0.3221119, 0, 1, 0.572549, 1,
-0.1561756, -0.2552193, -3.346172, 0, 1, 0.5803922, 1,
-0.1455717, -1.860219, -2.903844, 0, 1, 0.5843138, 1,
-0.1455586, -0.7254083, -2.268023, 0, 1, 0.5921569, 1,
-0.1426702, 0.8981849, -0.1076844, 0, 1, 0.5960785, 1,
-0.1421822, 0.220509, -0.6877496, 0, 1, 0.6039216, 1,
-0.1394685, 0.4569874, -0.8258049, 0, 1, 0.6117647, 1,
-0.1378088, -0.8812488, -3.091324, 0, 1, 0.6156863, 1,
-0.1351449, 1.081221, 1.121462, 0, 1, 0.6235294, 1,
-0.1292817, 1.157556, -3.259224, 0, 1, 0.627451, 1,
-0.1260003, -0.6756608, -3.780422, 0, 1, 0.6352941, 1,
-0.1226898, -1.493079, -4.848028, 0, 1, 0.6392157, 1,
-0.1220158, -2.466418, -3.148504, 0, 1, 0.6470588, 1,
-0.1204867, -0.06923474, -1.876044, 0, 1, 0.6509804, 1,
-0.1191286, -1.629588, -2.627492, 0, 1, 0.6588235, 1,
-0.1166365, 1.317001, 0.1262176, 0, 1, 0.6627451, 1,
-0.1162519, 0.5911401, -0.2437608, 0, 1, 0.6705883, 1,
-0.1151075, -0.7085813, -3.017491, 0, 1, 0.6745098, 1,
-0.114021, -2.332829, -2.445666, 0, 1, 0.682353, 1,
-0.1137234, -0.1251894, -3.127318, 0, 1, 0.6862745, 1,
-0.1107277, -0.2670217, -3.606737, 0, 1, 0.6941177, 1,
-0.1095942, 0.3433256, -0.5421937, 0, 1, 0.7019608, 1,
-0.1086079, 0.7509076, -0.4266008, 0, 1, 0.7058824, 1,
-0.1086037, 0.3400561, -1.080966, 0, 1, 0.7137255, 1,
-0.1078987, 0.9221808, 2.642742, 0, 1, 0.7176471, 1,
-0.1042958, -2.862085, -2.158985, 0, 1, 0.7254902, 1,
-0.09789588, -1.284701, -0.5537027, 0, 1, 0.7294118, 1,
-0.09753154, -0.1219206, -3.235709, 0, 1, 0.7372549, 1,
-0.09098639, 1.717009, -1.127893, 0, 1, 0.7411765, 1,
-0.08956166, -0.2517631, -2.36743, 0, 1, 0.7490196, 1,
-0.07671112, -0.8158671, -3.262427, 0, 1, 0.7529412, 1,
-0.07597516, -0.4497202, -3.717972, 0, 1, 0.7607843, 1,
-0.07481997, -0.06616919, -3.179892, 0, 1, 0.7647059, 1,
-0.0726359, 1.789576, -2.083584, 0, 1, 0.772549, 1,
-0.06820228, -0.7372482, -2.46489, 0, 1, 0.7764706, 1,
-0.06815365, 0.1311285, 0.5217907, 0, 1, 0.7843137, 1,
-0.06221328, 0.4501295, -0.2648153, 0, 1, 0.7882353, 1,
-0.06201986, 0.141432, -0.01168637, 0, 1, 0.7960784, 1,
-0.06026832, -0.7512531, -2.362637, 0, 1, 0.8039216, 1,
-0.05951728, -0.8596533, -3.445649, 0, 1, 0.8078431, 1,
-0.05783881, 0.1586142, -2.091013, 0, 1, 0.8156863, 1,
-0.0537781, 1.314368, 0.9261478, 0, 1, 0.8196079, 1,
-0.05043614, 0.8972861, 0.2673913, 0, 1, 0.827451, 1,
-0.04950683, 1.541896, 0.81434, 0, 1, 0.8313726, 1,
-0.04862691, -1.536407, -1.985791, 0, 1, 0.8392157, 1,
-0.04763102, 1.033448, 0.8815981, 0, 1, 0.8431373, 1,
-0.04593695, 0.3666577, -0.5565425, 0, 1, 0.8509804, 1,
-0.04073021, 0.5160497, 0.4099641, 0, 1, 0.854902, 1,
-0.03605347, 2.69798, 0.4328608, 0, 1, 0.8627451, 1,
-0.03355265, -0.1378987, -2.825238, 0, 1, 0.8666667, 1,
-0.03070012, -0.964708, -3.223117, 0, 1, 0.8745098, 1,
-0.030291, -1.886587, -1.120047, 0, 1, 0.8784314, 1,
-0.02913073, -0.4982231, -3.711509, 0, 1, 0.8862745, 1,
-0.02824596, -0.5616817, -2.752467, 0, 1, 0.8901961, 1,
-0.02795777, -0.0380441, -2.751322, 0, 1, 0.8980392, 1,
-0.02668255, -0.5567957, -3.961004, 0, 1, 0.9058824, 1,
-0.0255971, -0.1370201, -3.397673, 0, 1, 0.9098039, 1,
-0.01785392, 0.3146136, 0.1976358, 0, 1, 0.9176471, 1,
-0.01687052, 0.7762917, -0.7989525, 0, 1, 0.9215686, 1,
-0.01412468, -0.8766376, -2.350043, 0, 1, 0.9294118, 1,
-0.01335329, 0.4841447, 0.9878829, 0, 1, 0.9333333, 1,
-0.007411567, -1.579533, -2.675283, 0, 1, 0.9411765, 1,
-0.005509881, 0.01359341, -0.9666994, 0, 1, 0.945098, 1,
-0.00509137, -0.05672293, -4.234132, 0, 1, 0.9529412, 1,
-0.001618847, 1.407129, -0.9183022, 0, 1, 0.9568627, 1,
-0.001347344, 1.079706, -0.06276942, 0, 1, 0.9647059, 1,
-0.0009965289, -1.611926, -4.97525, 0, 1, 0.9686275, 1,
-0.0003626111, -1.092808, -2.254482, 0, 1, 0.9764706, 1,
0.002946013, 0.2637199, 0.8144488, 0, 1, 0.9803922, 1,
0.005608781, 0.930829, 0.09894563, 0, 1, 0.9882353, 1,
0.007322366, -0.9410589, 4.552613, 0, 1, 0.9921569, 1,
0.00891555, 0.05034141, 1.816366, 0, 1, 1, 1,
0.01061926, -0.2436312, 2.996989, 0, 0.9921569, 1, 1,
0.01203843, 0.4259917, 0.2164654, 0, 0.9882353, 1, 1,
0.01267386, 2.002266, 0.7761484, 0, 0.9803922, 1, 1,
0.01947331, 1.050049, 0.9196874, 0, 0.9764706, 1, 1,
0.02325805, -0.09430371, 4.997897, 0, 0.9686275, 1, 1,
0.02391608, -0.8966127, 3.088639, 0, 0.9647059, 1, 1,
0.02394908, -0.9764863, 4.046177, 0, 0.9568627, 1, 1,
0.02424131, 0.103472, -0.2436861, 0, 0.9529412, 1, 1,
0.02432754, -1.045065, 3.287204, 0, 0.945098, 1, 1,
0.02545619, -0.5875074, 2.305773, 0, 0.9411765, 1, 1,
0.03016687, 0.4049037, 0.417062, 0, 0.9333333, 1, 1,
0.03678219, -1.164014, 2.029567, 0, 0.9294118, 1, 1,
0.0373183, 0.1529365, 0.7651785, 0, 0.9215686, 1, 1,
0.03821237, 0.1838002, 0.3546669, 0, 0.9176471, 1, 1,
0.04377513, -0.2104416, 2.902499, 0, 0.9098039, 1, 1,
0.04395564, 1.3502, -1.488394, 0, 0.9058824, 1, 1,
0.04494807, -1.481927, 3.364229, 0, 0.8980392, 1, 1,
0.04511346, -0.4393526, 2.554476, 0, 0.8901961, 1, 1,
0.04555865, -0.1971534, 3.446313, 0, 0.8862745, 1, 1,
0.04699028, -0.468873, 3.874311, 0, 0.8784314, 1, 1,
0.04985812, -0.2987526, 2.742115, 0, 0.8745098, 1, 1,
0.0500262, 2.381762, 0.7796925, 0, 0.8666667, 1, 1,
0.05076055, 0.2565344, 1.557563, 0, 0.8627451, 1, 1,
0.05290692, 1.406177, -0.2103925, 0, 0.854902, 1, 1,
0.05519561, -1.340766, 3.855877, 0, 0.8509804, 1, 1,
0.05709875, 1.62336, -0.4038686, 0, 0.8431373, 1, 1,
0.05907539, -0.3355437, 1.83218, 0, 0.8392157, 1, 1,
0.05921542, -0.1797472, 2.961332, 0, 0.8313726, 1, 1,
0.06034435, -0.6328027, 2.913141, 0, 0.827451, 1, 1,
0.06311813, -0.01224219, 1.006158, 0, 0.8196079, 1, 1,
0.06332534, 1.912606, 0.5407751, 0, 0.8156863, 1, 1,
0.06431717, 1.123648, 0.1683706, 0, 0.8078431, 1, 1,
0.0644044, -0.5996375, 3.352176, 0, 0.8039216, 1, 1,
0.06623136, -1.519854, 3.534888, 0, 0.7960784, 1, 1,
0.06933571, 0.3875692, 0.9930988, 0, 0.7882353, 1, 1,
0.06964189, -0.3655321, 4.43817, 0, 0.7843137, 1, 1,
0.07075353, 0.5075692, -0.9401962, 0, 0.7764706, 1, 1,
0.07108448, 0.05242116, 0.1739382, 0, 0.772549, 1, 1,
0.07305877, -0.8602503, 2.431186, 0, 0.7647059, 1, 1,
0.0748341, -0.5288416, 4.473743, 0, 0.7607843, 1, 1,
0.07711048, 0.2286417, -1.562497, 0, 0.7529412, 1, 1,
0.08079295, -0.2541254, 3.524547, 0, 0.7490196, 1, 1,
0.08122922, -0.1513032, 2.803989, 0, 0.7411765, 1, 1,
0.08310243, 2.419323, 0.4645722, 0, 0.7372549, 1, 1,
0.08329584, -0.3836324, 4.385038, 0, 0.7294118, 1, 1,
0.08352707, 1.351026, 1.060835, 0, 0.7254902, 1, 1,
0.08430416, 0.9966142, -0.5069655, 0, 0.7176471, 1, 1,
0.08560631, -0.1741994, 2.479687, 0, 0.7137255, 1, 1,
0.08867228, 0.6359587, 1.518128, 0, 0.7058824, 1, 1,
0.09124419, 1.570144, -2.109784, 0, 0.6980392, 1, 1,
0.09281688, 0.6835405, -0.0634414, 0, 0.6941177, 1, 1,
0.1000868, 3.432067, -0.1082856, 0, 0.6862745, 1, 1,
0.1022562, 0.3828214, -2.211535, 0, 0.682353, 1, 1,
0.1033622, -0.7306863, 3.094845, 0, 0.6745098, 1, 1,
0.103546, -0.02453419, 1.589335, 0, 0.6705883, 1, 1,
0.1090886, 0.2323962, 0.3067659, 0, 0.6627451, 1, 1,
0.1094551, 1.006211, 0.5880535, 0, 0.6588235, 1, 1,
0.1117619, 0.8503886, 0.8965139, 0, 0.6509804, 1, 1,
0.1131575, 0.3922136, -0.4594991, 0, 0.6470588, 1, 1,
0.1151967, -0.5209395, 3.802353, 0, 0.6392157, 1, 1,
0.1153576, -1.24878, 3.734749, 0, 0.6352941, 1, 1,
0.119643, -0.9130169, 6.269881, 0, 0.627451, 1, 1,
0.1203009, -0.7057025, 1.523179, 0, 0.6235294, 1, 1,
0.123434, -0.3507556, 2.709787, 0, 0.6156863, 1, 1,
0.1235599, 0.4243222, -0.00307668, 0, 0.6117647, 1, 1,
0.126429, 1.997323, 0.2791918, 0, 0.6039216, 1, 1,
0.1267223, -0.8096219, 4.280166, 0, 0.5960785, 1, 1,
0.1288103, 1.219, 0.4145148, 0, 0.5921569, 1, 1,
0.1313722, 0.5007327, 1.909756, 0, 0.5843138, 1, 1,
0.1318197, 0.6618605, -1.284418, 0, 0.5803922, 1, 1,
0.1367765, -0.6844213, 2.627666, 0, 0.572549, 1, 1,
0.1434271, 0.2296767, 0.1016301, 0, 0.5686275, 1, 1,
0.1438045, 0.8928947, 0.254902, 0, 0.5607843, 1, 1,
0.1543759, 0.01193837, 1.186576, 0, 0.5568628, 1, 1,
0.1604608, 0.6793498, 1.334357, 0, 0.5490196, 1, 1,
0.160916, 0.3261881, 0.1925495, 0, 0.5450981, 1, 1,
0.1631801, -0.6979811, 2.634525, 0, 0.5372549, 1, 1,
0.1654126, 0.1691412, 2.392538, 0, 0.5333334, 1, 1,
0.1654475, -1.18116, 3.68725, 0, 0.5254902, 1, 1,
0.1716297, -0.3496153, 3.807728, 0, 0.5215687, 1, 1,
0.1815714, -0.07241937, 2.647542, 0, 0.5137255, 1, 1,
0.1831522, -1.150962, 4.79959, 0, 0.509804, 1, 1,
0.1840898, 1.102505, -0.9805214, 0, 0.5019608, 1, 1,
0.1852725, -0.09968819, 1.720894, 0, 0.4941176, 1, 1,
0.1889481, -0.5604573, 1.924626, 0, 0.4901961, 1, 1,
0.1890339, 1.268388, -0.9479942, 0, 0.4823529, 1, 1,
0.1892085, 0.874863, 0.0009620299, 0, 0.4784314, 1, 1,
0.1910945, -0.3231254, 2.244801, 0, 0.4705882, 1, 1,
0.191108, 1.363247, 1.101347, 0, 0.4666667, 1, 1,
0.1948329, 0.8434299, -0.07704528, 0, 0.4588235, 1, 1,
0.1965188, 1.545156, 0.3094054, 0, 0.454902, 1, 1,
0.1992257, 0.07898611, 0.9994731, 0, 0.4470588, 1, 1,
0.1994891, -1.852034, 2.576824, 0, 0.4431373, 1, 1,
0.2005357, 0.5592513, -0.6912241, 0, 0.4352941, 1, 1,
0.2049779, -0.4567644, 2.984989, 0, 0.4313726, 1, 1,
0.2058996, -0.2804694, 1.913318, 0, 0.4235294, 1, 1,
0.2094397, -1.098368, 3.156228, 0, 0.4196078, 1, 1,
0.2110259, -0.1965959, -0.2529091, 0, 0.4117647, 1, 1,
0.2125007, -0.03836586, 2.63248, 0, 0.4078431, 1, 1,
0.2200933, 1.05715, 0.9677227, 0, 0.4, 1, 1,
0.2250882, 1.621279, 1.523779, 0, 0.3921569, 1, 1,
0.2254531, -1.912898, 2.827266, 0, 0.3882353, 1, 1,
0.2331713, -0.3456948, 2.741973, 0, 0.3803922, 1, 1,
0.2380973, -0.4974318, 0.7023755, 0, 0.3764706, 1, 1,
0.2382099, 1.848972, -0.3523269, 0, 0.3686275, 1, 1,
0.2444902, -0.01706738, 1.922858, 0, 0.3647059, 1, 1,
0.2479385, 1.62007, 0.9253756, 0, 0.3568628, 1, 1,
0.2535774, 1.082055, -1.067952, 0, 0.3529412, 1, 1,
0.2541304, -0.2105734, 3.89687, 0, 0.345098, 1, 1,
0.2590118, -0.03924537, 2.779788, 0, 0.3411765, 1, 1,
0.2616542, 1.475213, -0.2557572, 0, 0.3333333, 1, 1,
0.2633119, 1.854411, 2.917781, 0, 0.3294118, 1, 1,
0.2666331, 0.7191845, -1.963999, 0, 0.3215686, 1, 1,
0.2692453, -1.831909, 2.317549, 0, 0.3176471, 1, 1,
0.2713968, 1.495226, -0.405421, 0, 0.3098039, 1, 1,
0.2727911, 0.8421159, 1.383895, 0, 0.3058824, 1, 1,
0.2736388, -0.7180035, 3.322863, 0, 0.2980392, 1, 1,
0.2770668, -0.2325664, 2.723485, 0, 0.2901961, 1, 1,
0.2826874, 1.171333, 1.182641, 0, 0.2862745, 1, 1,
0.2859936, 0.5629684, -0.3710768, 0, 0.2784314, 1, 1,
0.2867687, -0.3321232, 3.293581, 0, 0.2745098, 1, 1,
0.2876987, -1.235957, 2.492288, 0, 0.2666667, 1, 1,
0.2889174, -0.2402601, 3.495868, 0, 0.2627451, 1, 1,
0.2897031, 2.024649, 0.5904184, 0, 0.254902, 1, 1,
0.2897787, -0.4108307, 4.2884, 0, 0.2509804, 1, 1,
0.2913439, 0.01878597, 3.207041, 0, 0.2431373, 1, 1,
0.2915662, -0.428367, 0.8536462, 0, 0.2392157, 1, 1,
0.2928723, -0.02059203, 3.635581, 0, 0.2313726, 1, 1,
0.2970961, -0.06157802, 1.890789, 0, 0.227451, 1, 1,
0.3000957, -1.665067, 2.789697, 0, 0.2196078, 1, 1,
0.3036329, -0.1278041, 3.233112, 0, 0.2156863, 1, 1,
0.3053427, -0.851423, 2.735206, 0, 0.2078431, 1, 1,
0.3064909, -0.05863702, 0.5683215, 0, 0.2039216, 1, 1,
0.3071624, 0.470977, -1.26283, 0, 0.1960784, 1, 1,
0.3114159, -2.245648, 3.962461, 0, 0.1882353, 1, 1,
0.3141006, -0.9757958, 2.858399, 0, 0.1843137, 1, 1,
0.3150233, -0.9748811, 2.420142, 0, 0.1764706, 1, 1,
0.3150496, -0.283126, 2.460346, 0, 0.172549, 1, 1,
0.3175327, -0.4675675, 2.952113, 0, 0.1647059, 1, 1,
0.318073, 2.098823, 1.366643, 0, 0.1607843, 1, 1,
0.3184769, 0.8004414, 0.7539538, 0, 0.1529412, 1, 1,
0.3213688, 2.00262, 1.214976, 0, 0.1490196, 1, 1,
0.3247446, 0.4468377, 0.7703253, 0, 0.1411765, 1, 1,
0.3252401, 2.827264, 1.63333, 0, 0.1372549, 1, 1,
0.3277322, 1.940041, -0.2974817, 0, 0.1294118, 1, 1,
0.3294662, 0.5147331, 0.2988472, 0, 0.1254902, 1, 1,
0.329841, -0.4403544, 3.824382, 0, 0.1176471, 1, 1,
0.3300776, 0.8961998, 1.470252, 0, 0.1137255, 1, 1,
0.33041, -0.8511812, 2.395764, 0, 0.1058824, 1, 1,
0.3314742, -0.8212124, 1.896855, 0, 0.09803922, 1, 1,
0.3365889, 1.060498, -0.08559175, 0, 0.09411765, 1, 1,
0.3379779, 0.9639623, 0.1154932, 0, 0.08627451, 1, 1,
0.3406221, 0.3830334, 0.7701196, 0, 0.08235294, 1, 1,
0.3443261, -0.7236965, 3.842084, 0, 0.07450981, 1, 1,
0.3444636, -1.438987, 1.541517, 0, 0.07058824, 1, 1,
0.3446091, -0.3868729, 2.181022, 0, 0.0627451, 1, 1,
0.3461656, -2.298669, 3.80918, 0, 0.05882353, 1, 1,
0.3473444, 0.3978189, 1.919974, 0, 0.05098039, 1, 1,
0.3492101, -0.7769352, 2.054885, 0, 0.04705882, 1, 1,
0.3533574, -0.1797644, 2.300213, 0, 0.03921569, 1, 1,
0.3538933, 0.138347, 1.630487, 0, 0.03529412, 1, 1,
0.3556027, -1.481694, 2.291243, 0, 0.02745098, 1, 1,
0.3584051, -0.3667158, 1.51869, 0, 0.02352941, 1, 1,
0.3589596, 0.2333985, 2.994512, 0, 0.01568628, 1, 1,
0.3603026, -0.6843379, 2.102428, 0, 0.01176471, 1, 1,
0.3647336, -0.0493454, 0.5701471, 0, 0.003921569, 1, 1,
0.3731201, -0.6145679, 2.441916, 0.003921569, 0, 1, 1,
0.3742192, -1.266585, 3.384681, 0.007843138, 0, 1, 1,
0.3786352, 1.034332, -0.5781885, 0.01568628, 0, 1, 1,
0.3810809, 0.03178015, 0.4240644, 0.01960784, 0, 1, 1,
0.381797, 1.463357, 1.584006, 0.02745098, 0, 1, 1,
0.3837487, 0.1915475, 0.8966646, 0.03137255, 0, 1, 1,
0.3856224, 0.2380662, 1.024909, 0.03921569, 0, 1, 1,
0.386574, 1.437748, 0.2562575, 0.04313726, 0, 1, 1,
0.3928146, -0.6036297, 1.879226, 0.05098039, 0, 1, 1,
0.3932433, 1.626275, 0.6165183, 0.05490196, 0, 1, 1,
0.3951102, -0.06439817, 1.957588, 0.0627451, 0, 1, 1,
0.3956186, 0.004649788, 3.177146, 0.06666667, 0, 1, 1,
0.4049549, 0.2198281, 0.7417068, 0.07450981, 0, 1, 1,
0.405429, -2.639212, 1.859217, 0.07843138, 0, 1, 1,
0.407572, 2.126927, 0.5155504, 0.08627451, 0, 1, 1,
0.4093169, -2.502766, 2.449166, 0.09019608, 0, 1, 1,
0.4138741, -0.6344926, 3.046255, 0.09803922, 0, 1, 1,
0.4156176, 0.7286064, -0.2640271, 0.1058824, 0, 1, 1,
0.4163247, 0.6858038, -0.05643722, 0.1098039, 0, 1, 1,
0.4171427, 1.096662, -0.4762902, 0.1176471, 0, 1, 1,
0.4175357, 0.3214723, -0.5486252, 0.1215686, 0, 1, 1,
0.423593, 1.248726, -0.4877406, 0.1294118, 0, 1, 1,
0.4287966, -0.9137933, 3.292571, 0.1333333, 0, 1, 1,
0.4312186, 1.806932, 1.577755, 0.1411765, 0, 1, 1,
0.4319866, -0.5108405, 3.797447, 0.145098, 0, 1, 1,
0.4367795, 1.551732, -0.04993013, 0.1529412, 0, 1, 1,
0.4369848, -1.635025, 1.799186, 0.1568628, 0, 1, 1,
0.4383537, 0.2284305, 1.040971, 0.1647059, 0, 1, 1,
0.4388216, 1.108349, 0.4640174, 0.1686275, 0, 1, 1,
0.4410647, 0.9257935, 1.800357, 0.1764706, 0, 1, 1,
0.4414295, -0.553503, 2.946273, 0.1803922, 0, 1, 1,
0.4439637, 0.8176198, 1.793364, 0.1882353, 0, 1, 1,
0.4457368, 1.465745, -0.3651133, 0.1921569, 0, 1, 1,
0.4511936, 0.6656427, 0.3701562, 0.2, 0, 1, 1,
0.4565297, 0.9630288, -1.321283, 0.2078431, 0, 1, 1,
0.4635093, 2.071639, -0.6312766, 0.2117647, 0, 1, 1,
0.4636387, 0.1518915, 0.753809, 0.2196078, 0, 1, 1,
0.4640553, -0.3002825, 3.120699, 0.2235294, 0, 1, 1,
0.4777411, -0.7200934, 2.320924, 0.2313726, 0, 1, 1,
0.4782069, -0.5857608, 3.211054, 0.2352941, 0, 1, 1,
0.4787488, -0.3989049, 2.85891, 0.2431373, 0, 1, 1,
0.4822125, 0.38173, 2.362154, 0.2470588, 0, 1, 1,
0.4851953, -0.8872011, 2.182053, 0.254902, 0, 1, 1,
0.4872961, -1.125069, 3.06504, 0.2588235, 0, 1, 1,
0.490443, -1.300005, 1.494825, 0.2666667, 0, 1, 1,
0.4908459, 0.3656867, 0.3130444, 0.2705882, 0, 1, 1,
0.4910302, -1.544999, 2.726038, 0.2784314, 0, 1, 1,
0.4929629, -0.4641383, 2.337398, 0.282353, 0, 1, 1,
0.4948463, -0.4364343, 2.293073, 0.2901961, 0, 1, 1,
0.4968097, 0.6813381, -1.532712, 0.2941177, 0, 1, 1,
0.4973111, 0.4019994, 1.429591, 0.3019608, 0, 1, 1,
0.5011917, -0.0731978, 1.821567, 0.3098039, 0, 1, 1,
0.5080574, -0.004221702, 0.3604172, 0.3137255, 0, 1, 1,
0.5114499, -0.2304847, 1.94372, 0.3215686, 0, 1, 1,
0.517606, 0.3324099, 0.2027892, 0.3254902, 0, 1, 1,
0.526454, -1.210835, 1.899628, 0.3333333, 0, 1, 1,
0.5264593, 0.8367731, -0.3214211, 0.3372549, 0, 1, 1,
0.5290127, -1.064084, 0.7461731, 0.345098, 0, 1, 1,
0.5347729, 2.143397, 0.8579206, 0.3490196, 0, 1, 1,
0.5370449, -0.3109916, 0.7586227, 0.3568628, 0, 1, 1,
0.5389, 0.6448435, 2.565711, 0.3607843, 0, 1, 1,
0.5465242, -0.1672894, 0.6716573, 0.3686275, 0, 1, 1,
0.5481685, -0.2593737, 2.53154, 0.372549, 0, 1, 1,
0.5500548, -0.1211168, 1.265337, 0.3803922, 0, 1, 1,
0.5552188, 0.8852279, 0.08600842, 0.3843137, 0, 1, 1,
0.5593032, 0.9410636, 0.1815238, 0.3921569, 0, 1, 1,
0.5594764, 0.967064, -0.3286858, 0.3960784, 0, 1, 1,
0.5599938, 0.03895608, 2.172954, 0.4039216, 0, 1, 1,
0.5600373, 3.797351, -0.6068982, 0.4117647, 0, 1, 1,
0.5605295, 1.045265, 0.5706284, 0.4156863, 0, 1, 1,
0.5634731, -1.628664, 1.755798, 0.4235294, 0, 1, 1,
0.566269, -0.05035707, 2.013225, 0.427451, 0, 1, 1,
0.5760192, 0.1240954, 3.570082, 0.4352941, 0, 1, 1,
0.5761577, 1.415764, 0.9340446, 0.4392157, 0, 1, 1,
0.576282, 0.8553326, 0.4254332, 0.4470588, 0, 1, 1,
0.5790673, 0.2933471, 0.7836733, 0.4509804, 0, 1, 1,
0.5810116, 1.383879, 1.18226, 0.4588235, 0, 1, 1,
0.5849085, 1.550038, -1.285731, 0.4627451, 0, 1, 1,
0.5869933, 0.1041799, 1.253016, 0.4705882, 0, 1, 1,
0.5930531, -2.164652, 3.114876, 0.4745098, 0, 1, 1,
0.6015437, 0.7168716, 0.4799428, 0.4823529, 0, 1, 1,
0.602201, -1.195269, 2.016658, 0.4862745, 0, 1, 1,
0.6076064, -0.5696842, 2.406327, 0.4941176, 0, 1, 1,
0.6102604, -1.146548, 1.178708, 0.5019608, 0, 1, 1,
0.6162786, 0.7644664, 0.9115417, 0.5058824, 0, 1, 1,
0.6216086, 0.1748066, 2.404832, 0.5137255, 0, 1, 1,
0.6219676, 0.4654829, 0.3300775, 0.5176471, 0, 1, 1,
0.6226794, 0.1324927, 0.9403534, 0.5254902, 0, 1, 1,
0.6250191, 0.776866, 1.472535, 0.5294118, 0, 1, 1,
0.6251481, 1.95548, -0.2232608, 0.5372549, 0, 1, 1,
0.6265385, 1.281141, -0.4770328, 0.5411765, 0, 1, 1,
0.6320616, 1.035877, 0.7694046, 0.5490196, 0, 1, 1,
0.6328818, 0.3903538, 0.6870447, 0.5529412, 0, 1, 1,
0.6337332, -0.7031453, 2.407327, 0.5607843, 0, 1, 1,
0.6353961, 0.6735162, 1.018757, 0.5647059, 0, 1, 1,
0.63609, 0.004951149, 1.076183, 0.572549, 0, 1, 1,
0.6419149, -0.6258543, 1.440668, 0.5764706, 0, 1, 1,
0.6465104, 2.388587, -0.4641451, 0.5843138, 0, 1, 1,
0.6489425, 0.03512824, 1.927182, 0.5882353, 0, 1, 1,
0.6507645, -1.133334, 4.808561, 0.5960785, 0, 1, 1,
0.6508434, -0.6192623, 0.01056217, 0.6039216, 0, 1, 1,
0.6524461, 0.4624758, 1.533902, 0.6078432, 0, 1, 1,
0.6577523, 1.009767, 1.78345, 0.6156863, 0, 1, 1,
0.6588851, -0.1678376, 2.264853, 0.6196079, 0, 1, 1,
0.6596531, 0.8520316, 1.392357, 0.627451, 0, 1, 1,
0.6608976, -0.3589196, 1.217722, 0.6313726, 0, 1, 1,
0.6649879, 0.4053358, 1.446895, 0.6392157, 0, 1, 1,
0.6779902, 0.08105714, 2.346432, 0.6431373, 0, 1, 1,
0.6805207, -0.9387396, 2.76313, 0.6509804, 0, 1, 1,
0.681367, 0.3922639, 1.345603, 0.654902, 0, 1, 1,
0.6883417, 0.6038079, 0.9018788, 0.6627451, 0, 1, 1,
0.6942656, 0.2804886, 3.053276, 0.6666667, 0, 1, 1,
0.694935, 1.035295, 0.04138822, 0.6745098, 0, 1, 1,
0.6962196, 1.00217, 0.9168856, 0.6784314, 0, 1, 1,
0.7041922, 0.1214203, 2.137689, 0.6862745, 0, 1, 1,
0.7046104, -1.140126, 3.40404, 0.6901961, 0, 1, 1,
0.7049498, 0.3225244, 0.830397, 0.6980392, 0, 1, 1,
0.7054141, -0.3034061, 0.9833395, 0.7058824, 0, 1, 1,
0.7107925, -1.345936, 1.655782, 0.7098039, 0, 1, 1,
0.7126764, 0.2931994, 0.7812449, 0.7176471, 0, 1, 1,
0.7190143, -2.276713, 2.137693, 0.7215686, 0, 1, 1,
0.7198153, -0.1841388, 2.265796, 0.7294118, 0, 1, 1,
0.7203792, -0.1479698, 1.213939, 0.7333333, 0, 1, 1,
0.723817, -0.5870197, 1.634858, 0.7411765, 0, 1, 1,
0.7316646, 1.067043, 1.062706, 0.7450981, 0, 1, 1,
0.7335123, -1.527675, 3.908808, 0.7529412, 0, 1, 1,
0.7499608, -0.2680318, 1.297631, 0.7568628, 0, 1, 1,
0.7503448, -0.4323304, 1.22014, 0.7647059, 0, 1, 1,
0.7536778, 0.7114187, 1.554153, 0.7686275, 0, 1, 1,
0.7554683, 0.5921797, -0.4050534, 0.7764706, 0, 1, 1,
0.7576217, 2.256852, 0.2579574, 0.7803922, 0, 1, 1,
0.7581007, -0.9905148, 2.859788, 0.7882353, 0, 1, 1,
0.7609707, 2.746539, 0.305656, 0.7921569, 0, 1, 1,
0.7631727, -0.1066662, 1.199834, 0.8, 0, 1, 1,
0.7641454, -0.3092272, 2.05906, 0.8078431, 0, 1, 1,
0.7667866, -0.3932604, 2.292005, 0.8117647, 0, 1, 1,
0.768815, -1.41654, 2.836379, 0.8196079, 0, 1, 1,
0.775044, 0.8666452, 0.6865428, 0.8235294, 0, 1, 1,
0.7789544, 1.992809, 1.289829, 0.8313726, 0, 1, 1,
0.7858238, 0.5172874, 1.483464, 0.8352941, 0, 1, 1,
0.7865669, 0.2706401, 1.035335, 0.8431373, 0, 1, 1,
0.7913982, -0.7702307, 0.3637666, 0.8470588, 0, 1, 1,
0.8204038, 2.127949, 0.04984338, 0.854902, 0, 1, 1,
0.8234349, -0.293296, 2.433997, 0.8588235, 0, 1, 1,
0.8389336, -0.7304649, 3.914731, 0.8666667, 0, 1, 1,
0.8396512, -0.1438513, 1.546877, 0.8705882, 0, 1, 1,
0.8399631, -0.4778005, 2.429879, 0.8784314, 0, 1, 1,
0.8399904, 2.609566, -0.1187383, 0.8823529, 0, 1, 1,
0.8462161, 0.6175088, 1.083255, 0.8901961, 0, 1, 1,
0.8486696, 0.7140213, 2.409744, 0.8941177, 0, 1, 1,
0.8615862, -0.7854702, 1.15432, 0.9019608, 0, 1, 1,
0.8624899, -2.132465, 2.592463, 0.9098039, 0, 1, 1,
0.8641738, 0.9098716, 0.4277511, 0.9137255, 0, 1, 1,
0.8700294, -1.486973, 2.140304, 0.9215686, 0, 1, 1,
0.8798621, -0.6841465, 2.124666, 0.9254902, 0, 1, 1,
0.8823903, 2.580585, -0.6539587, 0.9333333, 0, 1, 1,
0.8855353, 0.3875274, 1.263323, 0.9372549, 0, 1, 1,
0.8866197, -1.141098, 3.045732, 0.945098, 0, 1, 1,
0.8912306, -0.3272407, 3.637322, 0.9490196, 0, 1, 1,
0.8914479, -1.387163, 2.626836, 0.9568627, 0, 1, 1,
0.8918794, -0.0877794, 0.4114165, 0.9607843, 0, 1, 1,
0.8931347, 0.05397001, 0.823038, 0.9686275, 0, 1, 1,
0.8954607, -0.1254653, 0.5958546, 0.972549, 0, 1, 1,
0.8954769, -1.002319, 2.281905, 0.9803922, 0, 1, 1,
0.8983013, -0.1328124, 1.630487, 0.9843137, 0, 1, 1,
0.9031788, 0.6912532, -0.6527821, 0.9921569, 0, 1, 1,
0.9058989, 0.7771041, -0.3492531, 0.9960784, 0, 1, 1,
0.9062046, 0.06116423, 2.651884, 1, 0, 0.9960784, 1,
0.9098031, -1.293801, 1.210719, 1, 0, 0.9882353, 1,
0.910158, -0.3361319, 1.415326, 1, 0, 0.9843137, 1,
0.9104197, 1.179051, 0.3204938, 1, 0, 0.9764706, 1,
0.9120076, -0.1314439, 0.6750776, 1, 0, 0.972549, 1,
0.9120667, 0.4236388, 3.02457, 1, 0, 0.9647059, 1,
0.9149301, -0.1405476, 2.212644, 1, 0, 0.9607843, 1,
0.9162844, 0.1607003, 3.020693, 1, 0, 0.9529412, 1,
0.920908, -0.9056486, 2.407019, 1, 0, 0.9490196, 1,
0.9248452, -0.5806596, 0.6170243, 1, 0, 0.9411765, 1,
0.9302848, 1.04923, 1.053896, 1, 0, 0.9372549, 1,
0.9324527, 0.7568532, 1.348472, 1, 0, 0.9294118, 1,
0.9365547, -2.160328, 3.58003, 1, 0, 0.9254902, 1,
0.9399637, -2.159343, 3.923782, 1, 0, 0.9176471, 1,
0.9406772, 0.9979724, 1.605083, 1, 0, 0.9137255, 1,
0.9456931, 1.327803, 1.439795, 1, 0, 0.9058824, 1,
0.9466048, 0.6385956, 2.098551, 1, 0, 0.9019608, 1,
0.9474323, 1.095908, 2.293121, 1, 0, 0.8941177, 1,
0.9475662, 0.1972907, 0.9556106, 1, 0, 0.8862745, 1,
0.9549943, 0.1360781, 0.2724791, 1, 0, 0.8823529, 1,
0.9584318, 0.000830228, 1.259778, 1, 0, 0.8745098, 1,
0.9629703, 0.2773532, 2.647416, 1, 0, 0.8705882, 1,
0.9658042, 0.4436704, 1.632685, 1, 0, 0.8627451, 1,
0.9786627, 0.6127895, 3.537357, 1, 0, 0.8588235, 1,
0.9882969, 0.9026909, 1.025546, 1, 0, 0.8509804, 1,
0.9974842, -0.5540482, 0.6656366, 1, 0, 0.8470588, 1,
1.001173, -0.01496311, 1.253223, 1, 0, 0.8392157, 1,
1.007252, 0.7021214, 2.205131, 1, 0, 0.8352941, 1,
1.010951, 0.1183499, -0.2669207, 1, 0, 0.827451, 1,
1.018116, -0.9769092, 1.567391, 1, 0, 0.8235294, 1,
1.02619, -1.004996, 2.864199, 1, 0, 0.8156863, 1,
1.030188, -0.8419102, 1.254843, 1, 0, 0.8117647, 1,
1.030846, -1.366444, 2.471339, 1, 0, 0.8039216, 1,
1.033771, 1.50334, 2.752175, 1, 0, 0.7960784, 1,
1.03994, 0.7257887, 0.2017719, 1, 0, 0.7921569, 1,
1.040655, -0.3773451, 1.628653, 1, 0, 0.7843137, 1,
1.045234, 0.1603232, 0.00406228, 1, 0, 0.7803922, 1,
1.047337, 0.7362264, 0.2909851, 1, 0, 0.772549, 1,
1.048051, -0.4378581, 3.71963, 1, 0, 0.7686275, 1,
1.051321, 0.5011371, 1.450689, 1, 0, 0.7607843, 1,
1.059679, 1.340475, -1.821383, 1, 0, 0.7568628, 1,
1.06649, -0.6095632, 2.470125, 1, 0, 0.7490196, 1,
1.067058, -1.591291, 0.6311691, 1, 0, 0.7450981, 1,
1.07827, -0.4802235, 3.327225, 1, 0, 0.7372549, 1,
1.081854, -1.462465, 4.778989, 1, 0, 0.7333333, 1,
1.082877, 0.6112995, 0.1931551, 1, 0, 0.7254902, 1,
1.083007, -1.209968, 1.585591, 1, 0, 0.7215686, 1,
1.086261, 2.111635, 0.361224, 1, 0, 0.7137255, 1,
1.089699, 0.7545004, 1.521991, 1, 0, 0.7098039, 1,
1.092307, 0.3113863, 0.6560991, 1, 0, 0.7019608, 1,
1.10286, -0.6647301, 2.383787, 1, 0, 0.6941177, 1,
1.110419, 0.6765388, 0.9265195, 1, 0, 0.6901961, 1,
1.119877, -0.3205535, 3.863896, 1, 0, 0.682353, 1,
1.127094, 0.9895158, 0.01555576, 1, 0, 0.6784314, 1,
1.130143, -0.7237422, 3.267927, 1, 0, 0.6705883, 1,
1.140748, -1.120252, 2.35651, 1, 0, 0.6666667, 1,
1.159705, -0.2453075, 1.99376, 1, 0, 0.6588235, 1,
1.16111, -0.8038883, 2.490934, 1, 0, 0.654902, 1,
1.172003, -1.500407, 3.590066, 1, 0, 0.6470588, 1,
1.184625, -0.8014383, 1.713735, 1, 0, 0.6431373, 1,
1.18767, -1.760894, 2.132129, 1, 0, 0.6352941, 1,
1.218621, -1.249897, 3.786121, 1, 0, 0.6313726, 1,
1.220176, -0.119361, 1.313463, 1, 0, 0.6235294, 1,
1.238411, -1.547307, 4.836963, 1, 0, 0.6196079, 1,
1.239706, 0.3164734, 1.821059, 1, 0, 0.6117647, 1,
1.240768, -0.4089888, 0.8242389, 1, 0, 0.6078432, 1,
1.2444, -0.760359, 0.5610443, 1, 0, 0.6, 1,
1.252315, 0.2857415, 0.2273512, 1, 0, 0.5921569, 1,
1.25692, 0.3722753, 1.086796, 1, 0, 0.5882353, 1,
1.265818, -1.292497, 2.114498, 1, 0, 0.5803922, 1,
1.267142, 0.8182516, -1.14076, 1, 0, 0.5764706, 1,
1.267409, 0.04681678, 2.670421, 1, 0, 0.5686275, 1,
1.278971, -0.03927444, 3.062869, 1, 0, 0.5647059, 1,
1.289425, 0.3061945, 1.319572, 1, 0, 0.5568628, 1,
1.292963, 1.905789, 0.884522, 1, 0, 0.5529412, 1,
1.293212, -0.2457245, 2.159469, 1, 0, 0.5450981, 1,
1.294484, -1.523519, 1.611179, 1, 0, 0.5411765, 1,
1.297835, -0.06264526, 2.108372, 1, 0, 0.5333334, 1,
1.310211, 0.2242339, 2.333794, 1, 0, 0.5294118, 1,
1.328264, -0.353293, 3.11451, 1, 0, 0.5215687, 1,
1.330761, 1.376402, 1.368882, 1, 0, 0.5176471, 1,
1.336375, 0.2622136, 1.893914, 1, 0, 0.509804, 1,
1.345991, 0.3775388, 1.326492, 1, 0, 0.5058824, 1,
1.347567, -0.6918409, 1.335519, 1, 0, 0.4980392, 1,
1.353963, -1.72328, 2.362622, 1, 0, 0.4901961, 1,
1.379747, -0.4738609, 2.712363, 1, 0, 0.4862745, 1,
1.387281, 0.2369252, 2.712438, 1, 0, 0.4784314, 1,
1.396628, 1.620346, 0.05046814, 1, 0, 0.4745098, 1,
1.403593, 0.6152779, 1.755396, 1, 0, 0.4666667, 1,
1.410247, -0.1137721, 1.677419, 1, 0, 0.4627451, 1,
1.412076, 1.464972, 0.8158319, 1, 0, 0.454902, 1,
1.414908, 0.6146901, 1.685509, 1, 0, 0.4509804, 1,
1.420727, -1.256616, 1.439111, 1, 0, 0.4431373, 1,
1.424132, 0.2996856, 1.300292, 1, 0, 0.4392157, 1,
1.426798, -2.409772, 4.423212, 1, 0, 0.4313726, 1,
1.432672, -0.5151121, 1.455455, 1, 0, 0.427451, 1,
1.43566, 0.1954789, 2.504344, 1, 0, 0.4196078, 1,
1.449084, -0.782336, 1.993906, 1, 0, 0.4156863, 1,
1.451196, 1.28037, -0.9018087, 1, 0, 0.4078431, 1,
1.453666, -0.7442088, 1.677174, 1, 0, 0.4039216, 1,
1.458245, -1.829996, 3.741054, 1, 0, 0.3960784, 1,
1.459339, 0.1006906, 1.181697, 1, 0, 0.3882353, 1,
1.45954, 0.2519151, 0.7747201, 1, 0, 0.3843137, 1,
1.459587, -0.4287773, 1.306535, 1, 0, 0.3764706, 1,
1.46576, 0.5000287, 1.964924, 1, 0, 0.372549, 1,
1.469168, 1.802826, 0.9708116, 1, 0, 0.3647059, 1,
1.481147, 0.8539584, 0.2019599, 1, 0, 0.3607843, 1,
1.490642, 0.05781087, 1.204701, 1, 0, 0.3529412, 1,
1.497621, 1.436777, 1.014393, 1, 0, 0.3490196, 1,
1.514395, -0.266021, 1.693544, 1, 0, 0.3411765, 1,
1.51557, 0.0447023, 1.452399, 1, 0, 0.3372549, 1,
1.541808, 0.2856817, 0.09194336, 1, 0, 0.3294118, 1,
1.545718, -0.817955, 2.084104, 1, 0, 0.3254902, 1,
1.551019, 0.09636351, 1.990041, 1, 0, 0.3176471, 1,
1.552205, -1.111897, -0.3236077, 1, 0, 0.3137255, 1,
1.572976, -0.3889371, -0.09848103, 1, 0, 0.3058824, 1,
1.573774, 0.2004606, 1.516273, 1, 0, 0.2980392, 1,
1.58739, 0.5553402, 2.212796, 1, 0, 0.2941177, 1,
1.626763, 0.6104293, 1.360178, 1, 0, 0.2862745, 1,
1.627257, 0.4643863, 1.577498, 1, 0, 0.282353, 1,
1.6789, -0.4987706, 2.511157, 1, 0, 0.2745098, 1,
1.684737, 0.4765006, 0.5783335, 1, 0, 0.2705882, 1,
1.691741, -1.20553, 2.585526, 1, 0, 0.2627451, 1,
1.695515, -1.781307, 3.825244, 1, 0, 0.2588235, 1,
1.699865, 0.647541, 1.939048, 1, 0, 0.2509804, 1,
1.711349, 1.938468, 1.323006, 1, 0, 0.2470588, 1,
1.714474, -0.3811787, 1.356904, 1, 0, 0.2392157, 1,
1.722179, 1.287259, 1.656067, 1, 0, 0.2352941, 1,
1.725077, -0.6624002, -0.9427327, 1, 0, 0.227451, 1,
1.730759, 0.2275888, 1.322404, 1, 0, 0.2235294, 1,
1.733349, -0.2207157, 1.643379, 1, 0, 0.2156863, 1,
1.746058, -1.15179, 2.547175, 1, 0, 0.2117647, 1,
1.753661, -0.9567887, 1.398751, 1, 0, 0.2039216, 1,
1.756676, 2.038405, 2.024365, 1, 0, 0.1960784, 1,
1.765674, 0.3080167, 3.022884, 1, 0, 0.1921569, 1,
1.802154, 1.747396, 1.880619, 1, 0, 0.1843137, 1,
1.823542, 0.1422561, 1.267302, 1, 0, 0.1803922, 1,
1.833983, -0.2271117, 0.02168396, 1, 0, 0.172549, 1,
1.842672, 1.116528, 0.9612131, 1, 0, 0.1686275, 1,
1.847049, -1.138869, 3.979093, 1, 0, 0.1607843, 1,
1.860182, -0.9456028, 1.786152, 1, 0, 0.1568628, 1,
1.868043, -0.2070644, 2.566695, 1, 0, 0.1490196, 1,
1.875529, -0.1834984, 2.917887, 1, 0, 0.145098, 1,
1.885253, -1.048358, 1.959686, 1, 0, 0.1372549, 1,
1.88751, -0.2611644, -0.01225144, 1, 0, 0.1333333, 1,
1.894778, -1.048957, -0.535263, 1, 0, 0.1254902, 1,
1.954332, 0.7045422, 1.983238, 1, 0, 0.1215686, 1,
1.971871, -0.3505043, 1.421664, 1, 0, 0.1137255, 1,
1.983226, 0.5457643, 1.304332, 1, 0, 0.1098039, 1,
1.994953, 0.7418651, 0.3015941, 1, 0, 0.1019608, 1,
2.041636, 0.8012565, 1.072377, 1, 0, 0.09411765, 1,
2.15403, -2.760366, 2.185699, 1, 0, 0.09019608, 1,
2.173185, -0.1790138, 0.598784, 1, 0, 0.08235294, 1,
2.208205, 0.4605589, 2.854486, 1, 0, 0.07843138, 1,
2.313264, -1.378029, 1.464558, 1, 0, 0.07058824, 1,
2.337794, -2.724379, 2.554141, 1, 0, 0.06666667, 1,
2.338968, -1.269732, 2.295475, 1, 0, 0.05882353, 1,
2.365041, 0.05329141, 0.3560116, 1, 0, 0.05490196, 1,
2.376278, -1.116735, 1.752036, 1, 0, 0.04705882, 1,
2.524194, 1.485773, 2.340037, 1, 0, 0.04313726, 1,
2.527455, -0.3429278, 2.42536, 1, 0, 0.03529412, 1,
2.614621, -0.8836908, 2.328372, 1, 0, 0.03137255, 1,
2.620406, -1.377408, 0.4360112, 1, 0, 0.02352941, 1,
2.984934, -0.4149315, 0.7947674, 1, 0, 0.01960784, 1,
3.019132, 0.3444958, 4.534583, 1, 0, 0.01176471, 1,
3.827734, -0.458343, 1.925555, 1, 0, 0.007843138, 1
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
0.3956827, -3.99086, -6.881299, 0, -0.5, 0.5, 0.5,
0.3956827, -3.99086, -6.881299, 1, -0.5, 0.5, 0.5,
0.3956827, -3.99086, -6.881299, 1, 1.5, 0.5, 0.5,
0.3956827, -3.99086, -6.881299, 0, 1.5, 0.5, 0.5
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
-4.199833, 0.4676329, -6.881299, 0, -0.5, 0.5, 0.5,
-4.199833, 0.4676329, -6.881299, 1, -0.5, 0.5, 0.5,
-4.199833, 0.4676329, -6.881299, 1, 1.5, 0.5, 0.5,
-4.199833, 0.4676329, -6.881299, 0, 1.5, 0.5, 0.5
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
-4.199833, -3.99086, 0.6473157, 0, -0.5, 0.5, 0.5,
-4.199833, -3.99086, 0.6473157, 1, -0.5, 0.5, 0.5,
-4.199833, -3.99086, 0.6473157, 1, 1.5, 0.5, 0.5,
-4.199833, -3.99086, 0.6473157, 0, 1.5, 0.5, 0.5
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
-3, -2.961977, -5.143927,
3, -2.961977, -5.143927,
-3, -2.961977, -5.143927,
-3, -3.133457, -5.433489,
-2, -2.961977, -5.143927,
-2, -3.133457, -5.433489,
-1, -2.961977, -5.143927,
-1, -3.133457, -5.433489,
0, -2.961977, -5.143927,
0, -3.133457, -5.433489,
1, -2.961977, -5.143927,
1, -3.133457, -5.433489,
2, -2.961977, -5.143927,
2, -3.133457, -5.433489,
3, -2.961977, -5.143927,
3, -3.133457, -5.433489
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
-3, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
-3, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
-3, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
-3, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
-2, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
-2, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
-2, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
-2, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
-1, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
-1, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
-1, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
-1, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
0, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
0, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
0, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
0, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
1, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
1, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
1, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
1, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
2, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
2, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
2, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
2, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5,
3, -3.476418, -6.012613, 0, -0.5, 0.5, 0.5,
3, -3.476418, -6.012613, 1, -0.5, 0.5, 0.5,
3, -3.476418, -6.012613, 1, 1.5, 0.5, 0.5,
3, -3.476418, -6.012613, 0, 1.5, 0.5, 0.5
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
-3.13933, -2, -5.143927,
-3.13933, 3, -5.143927,
-3.13933, -2, -5.143927,
-3.31608, -2, -5.433489,
-3.13933, -1, -5.143927,
-3.31608, -1, -5.433489,
-3.13933, 0, -5.143927,
-3.31608, 0, -5.433489,
-3.13933, 1, -5.143927,
-3.31608, 1, -5.433489,
-3.13933, 2, -5.143927,
-3.31608, 2, -5.433489,
-3.13933, 3, -5.143927,
-3.31608, 3, -5.433489
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
-3.669581, -2, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, -2, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, -2, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, -2, -6.012613, 0, 1.5, 0.5, 0.5,
-3.669581, -1, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, -1, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, -1, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, -1, -6.012613, 0, 1.5, 0.5, 0.5,
-3.669581, 0, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, 0, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, 0, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, 0, -6.012613, 0, 1.5, 0.5, 0.5,
-3.669581, 1, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, 1, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, 1, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, 1, -6.012613, 0, 1.5, 0.5, 0.5,
-3.669581, 2, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, 2, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, 2, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, 2, -6.012613, 0, 1.5, 0.5, 0.5,
-3.669581, 3, -6.012613, 0, -0.5, 0.5, 0.5,
-3.669581, 3, -6.012613, 1, -0.5, 0.5, 0.5,
-3.669581, 3, -6.012613, 1, 1.5, 0.5, 0.5,
-3.669581, 3, -6.012613, 0, 1.5, 0.5, 0.5
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
-3.13933, -2.961977, -4,
-3.13933, -2.961977, 6,
-3.13933, -2.961977, -4,
-3.31608, -3.133457, -4,
-3.13933, -2.961977, -2,
-3.31608, -3.133457, -2,
-3.13933, -2.961977, 0,
-3.31608, -3.133457, 0,
-3.13933, -2.961977, 2,
-3.31608, -3.133457, 2,
-3.13933, -2.961977, 4,
-3.31608, -3.133457, 4,
-3.13933, -2.961977, 6,
-3.31608, -3.133457, 6
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
"4",
"6"
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
-3.669581, -3.476418, -4, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, -4, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, -4, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, -4, 0, 1.5, 0.5, 0.5,
-3.669581, -3.476418, -2, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, -2, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, -2, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, -2, 0, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 0, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 0, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 0, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 0, 0, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 2, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 2, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 2, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 2, 0, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 4, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 4, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 4, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 4, 0, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 6, 0, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 6, 1, -0.5, 0.5, 0.5,
-3.669581, -3.476418, 6, 1, 1.5, 0.5, 0.5,
-3.669581, -3.476418, 6, 0, 1.5, 0.5, 0.5
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
-3.13933, -2.961977, -5.143927,
-3.13933, 3.897242, -5.143927,
-3.13933, -2.961977, 6.438558,
-3.13933, 3.897242, 6.438558,
-3.13933, -2.961977, -5.143927,
-3.13933, -2.961977, 6.438558,
-3.13933, 3.897242, -5.143927,
-3.13933, 3.897242, 6.438558,
-3.13933, -2.961977, -5.143927,
3.930695, -2.961977, -5.143927,
-3.13933, -2.961977, 6.438558,
3.930695, -2.961977, 6.438558,
-3.13933, 3.897242, -5.143927,
3.930695, 3.897242, -5.143927,
-3.13933, 3.897242, 6.438558,
3.930695, 3.897242, 6.438558,
3.930695, -2.961977, -5.143927,
3.930695, 3.897242, -5.143927,
3.930695, -2.961977, 6.438558,
3.930695, 3.897242, 6.438558,
3.930695, -2.961977, -5.143927,
3.930695, -2.961977, 6.438558,
3.930695, 3.897242, -5.143927,
3.930695, 3.897242, 6.438558
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
var radius = 8.119106;
var distance = 36.12282;
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
mvMatrix.translate( -0.3956827, -0.4676329, -0.6473157 );
mvMatrix.scale( 1.241656, 1.279816, 0.7579147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.12282);
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
triallate<-read.table("triallate.xyz")
```

```
## Error in read.table("triallate.xyz"): no lines available in input
```

```r
x<-triallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
y<-triallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
z<-triallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
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
-3.036368, 0.5837106, -1.006169, 0, 0, 1, 1, 1,
-2.620494, 0.1523123, -0.9216553, 1, 0, 0, 1, 1,
-2.601627, -1.056502, -1.917924, 1, 0, 0, 1, 1,
-2.592625, -0.2248001, -1.636604, 1, 0, 0, 1, 1,
-2.448111, -0.4611622, -0.1240926, 1, 0, 0, 1, 1,
-2.374067, -0.09942492, -2.02942, 1, 0, 0, 1, 1,
-2.31922, -0.1895917, 0.2134195, 0, 0, 0, 1, 1,
-2.295405, -1.044137, -3.908771, 0, 0, 0, 1, 1,
-2.24794, -0.04169621, -2.577348, 0, 0, 0, 1, 1,
-2.233931, 0.6551977, -0.8817533, 0, 0, 0, 1, 1,
-2.184206, 2.115863, -0.3560513, 0, 0, 0, 1, 1,
-2.050532, -0.03867559, -1.232947, 0, 0, 0, 1, 1,
-2.042411, 0.1702316, -2.850231, 0, 0, 0, 1, 1,
-1.958743, 1.934011, -1.213958, 1, 1, 1, 1, 1,
-1.956147, -0.1224743, -1.530762, 1, 1, 1, 1, 1,
-1.923923, -0.7444556, -2.091181, 1, 1, 1, 1, 1,
-1.913042, -1.636973, -3.411266, 1, 1, 1, 1, 1,
-1.872535, 0.007002516, -1.841479, 1, 1, 1, 1, 1,
-1.83886, 1.1166, -1.050884, 1, 1, 1, 1, 1,
-1.812775, -1.925866, -3.211119, 1, 1, 1, 1, 1,
-1.805273, 1.356713, -1.0094, 1, 1, 1, 1, 1,
-1.804767, 1.219015, -3.566956, 1, 1, 1, 1, 1,
-1.798605, -0.2939644, -1.050083, 1, 1, 1, 1, 1,
-1.788754, 0.4744752, -1.681001, 1, 1, 1, 1, 1,
-1.77331, -1.529491, -2.866549, 1, 1, 1, 1, 1,
-1.773075, -0.4976517, -1.263369, 1, 1, 1, 1, 1,
-1.761119, -0.2002001, -0.87823, 1, 1, 1, 1, 1,
-1.745103, 0.402345, -1.262482, 1, 1, 1, 1, 1,
-1.728164, 0.6377258, -1.038754, 0, 0, 1, 1, 1,
-1.724113, 1.995919, 0.2214858, 1, 0, 0, 1, 1,
-1.721108, 1.245895, -1.275489, 1, 0, 0, 1, 1,
-1.70324, -0.3389975, -2.196139, 1, 0, 0, 1, 1,
-1.678759, -0.9350954, -0.7503152, 1, 0, 0, 1, 1,
-1.649747, -2.309603, -3.330343, 1, 0, 0, 1, 1,
-1.649319, -0.7542679, -2.273172, 0, 0, 0, 1, 1,
-1.640507, -0.6499314, -0.7409755, 0, 0, 0, 1, 1,
-1.640373, 0.7362012, -2.753399, 0, 0, 0, 1, 1,
-1.6127, 0.06661552, -4.1102, 0, 0, 0, 1, 1,
-1.611063, -0.00874285, -1.421289, 0, 0, 0, 1, 1,
-1.604798, 1.516454, -0.4181291, 0, 0, 0, 1, 1,
-1.577693, -1.724768, -2.131534, 0, 0, 0, 1, 1,
-1.567058, -0.3125191, -0.2805668, 1, 1, 1, 1, 1,
-1.559118, 0.03132615, -2.861114, 1, 1, 1, 1, 1,
-1.543437, 0.498141, -1.854606, 1, 1, 1, 1, 1,
-1.53634, 0.02672818, -1.4834, 1, 1, 1, 1, 1,
-1.526552, 0.1048512, -2.592393, 1, 1, 1, 1, 1,
-1.516687, 1.490601, -1.020114, 1, 1, 1, 1, 1,
-1.502194, 0.536575, -1.923791, 1, 1, 1, 1, 1,
-1.499776, -0.5563121, -2.100864, 1, 1, 1, 1, 1,
-1.499198, 1.071864, -0.1637795, 1, 1, 1, 1, 1,
-1.4933, -0.07882214, -1.090534, 1, 1, 1, 1, 1,
-1.49328, -2.232525, -1.953631, 1, 1, 1, 1, 1,
-1.471508, -0.8133789, -1.144116, 1, 1, 1, 1, 1,
-1.469203, 1.222731, -1.685205, 1, 1, 1, 1, 1,
-1.466846, -0.7855934, -2.372006, 1, 1, 1, 1, 1,
-1.455632, -0.9742854, -1.914312, 1, 1, 1, 1, 1,
-1.444838, -0.8404548, -1.12004, 0, 0, 1, 1, 1,
-1.441006, -0.8136926, -2.504196, 1, 0, 0, 1, 1,
-1.437357, 0.6981093, -1.045916, 1, 0, 0, 1, 1,
-1.436499, 0.4343041, -2.010112, 1, 0, 0, 1, 1,
-1.432617, -0.2548982, -1.700652, 1, 0, 0, 1, 1,
-1.425803, 0.2560249, -1.13002, 1, 0, 0, 1, 1,
-1.421974, 0.3066441, -2.788621, 0, 0, 0, 1, 1,
-1.421434, 0.3497191, -1.278664, 0, 0, 0, 1, 1,
-1.41558, 0.6694304, -1.473071, 0, 0, 0, 1, 1,
-1.39872, -0.3775727, -2.314505, 0, 0, 0, 1, 1,
-1.354911, 0.09088738, -1.761415, 0, 0, 0, 1, 1,
-1.354839, -0.5017729, -3.204831, 0, 0, 0, 1, 1,
-1.350399, -0.2085669, -1.406906, 0, 0, 0, 1, 1,
-1.349372, 0.7005228, -1.031997, 1, 1, 1, 1, 1,
-1.337053, -1.792444, -2.891757, 1, 1, 1, 1, 1,
-1.333207, 0.634721, -0.5428778, 1, 1, 1, 1, 1,
-1.321475, 0.676946, -1.645918, 1, 1, 1, 1, 1,
-1.321137, 1.648546, -2.00661, 1, 1, 1, 1, 1,
-1.319111, -0.1081303, -1.934453, 1, 1, 1, 1, 1,
-1.31704, -0.6100969, -2.133602, 1, 1, 1, 1, 1,
-1.30806, 0.6299499, -1.238748, 1, 1, 1, 1, 1,
-1.306649, -0.3409699, -2.024343, 1, 1, 1, 1, 1,
-1.284791, 2.123624, -0.1320115, 1, 1, 1, 1, 1,
-1.284322, -0.1270075, -1.694946, 1, 1, 1, 1, 1,
-1.282019, -0.6838726, -3.507447, 1, 1, 1, 1, 1,
-1.273979, -2.291475, -2.70457, 1, 1, 1, 1, 1,
-1.272734, 0.4729819, -0.4942377, 1, 1, 1, 1, 1,
-1.267097, -0.6037241, -1.520487, 1, 1, 1, 1, 1,
-1.261201, -0.9082989, -1.67549, 0, 0, 1, 1, 1,
-1.248058, 1.535886, -1.542058, 1, 0, 0, 1, 1,
-1.247579, -0.7874348, -3.302029, 1, 0, 0, 1, 1,
-1.243973, 0.4006117, -0.9970115, 1, 0, 0, 1, 1,
-1.242566, 1.919645, -0.6446628, 1, 0, 0, 1, 1,
-1.237382, 0.7252464, -1.721084, 1, 0, 0, 1, 1,
-1.222449, -0.8240815, -2.032139, 0, 0, 0, 1, 1,
-1.22189, 0.8523651, -1.26317, 0, 0, 0, 1, 1,
-1.217847, -0.2267964, -3.031612, 0, 0, 0, 1, 1,
-1.216122, -0.3938479, -2.550417, 0, 0, 0, 1, 1,
-1.215307, 1.268282, -1.359807, 0, 0, 0, 1, 1,
-1.2148, 1.240845, -1.827707, 0, 0, 0, 1, 1,
-1.203461, 0.8672733, -1.970285, 0, 0, 0, 1, 1,
-1.200631, -0.7001358, -2.468153, 1, 1, 1, 1, 1,
-1.191667, 0.8298569, 0.2643221, 1, 1, 1, 1, 1,
-1.181067, 0.501417, -1.460236, 1, 1, 1, 1, 1,
-1.179977, -0.3600335, -2.393646, 1, 1, 1, 1, 1,
-1.176395, 0.08543208, -0.267056, 1, 1, 1, 1, 1,
-1.170676, -0.5808461, -2.22938, 1, 1, 1, 1, 1,
-1.167405, 1.411785, -1.170728, 1, 1, 1, 1, 1,
-1.15875, -1.171891, -2.571631, 1, 1, 1, 1, 1,
-1.142611, 0.508947, -0.9045819, 1, 1, 1, 1, 1,
-1.136743, -2.140842, -2.539518, 1, 1, 1, 1, 1,
-1.135264, -0.4050075, -2.654565, 1, 1, 1, 1, 1,
-1.12501, 1.972827, -1.837954, 1, 1, 1, 1, 1,
-1.120032, -1.363859, -4.472556, 1, 1, 1, 1, 1,
-1.118441, 0.6973626, -1.55789, 1, 1, 1, 1, 1,
-1.116489, -0.9044465, -1.330029, 1, 1, 1, 1, 1,
-1.115876, 1.608144, -1.948959, 0, 0, 1, 1, 1,
-1.112975, -0.4944693, -2.281235, 1, 0, 0, 1, 1,
-1.102162, -0.3867241, -1.880132, 1, 0, 0, 1, 1,
-1.097719, 0.2212507, -0.8772695, 1, 0, 0, 1, 1,
-1.09261, 0.1771332, -2.708554, 1, 0, 0, 1, 1,
-1.083497, 0.8807287, -0.7251713, 1, 0, 0, 1, 1,
-1.080776, -0.7303624, -1.473794, 0, 0, 0, 1, 1,
-1.078672, -1.510667, -3.343181, 0, 0, 0, 1, 1,
-1.07033, -0.6422369, -2.179916, 0, 0, 0, 1, 1,
-1.068778, 0.02063379, -3.749128, 0, 0, 0, 1, 1,
-1.068499, 1.141217, 1.936379, 0, 0, 0, 1, 1,
-1.067497, 0.6938944, -0.5653147, 0, 0, 0, 1, 1,
-1.056191, 2.360005, -0.3868207, 0, 0, 0, 1, 1,
-1.052095, 0.8284557, -1.51172, 1, 1, 1, 1, 1,
-1.050934, -0.9320526, -1.695974, 1, 1, 1, 1, 1,
-1.041404, 0.2519039, 0.1392823, 1, 1, 1, 1, 1,
-1.039605, 0.8720172, 0.6554562, 1, 1, 1, 1, 1,
-1.037481, -0.3245501, -1.829047, 1, 1, 1, 1, 1,
-1.037357, -1.570156, -2.048687, 1, 1, 1, 1, 1,
-1.03722, -1.493325, -3.115975, 1, 1, 1, 1, 1,
-1.036675, -0.2545009, -3.100522, 1, 1, 1, 1, 1,
-1.035771, 0.1639799, -2.814143, 1, 1, 1, 1, 1,
-1.032778, 0.7628229, -2.028698, 1, 1, 1, 1, 1,
-1.030964, -0.5322112, -2.489424, 1, 1, 1, 1, 1,
-1.028712, -2.089602, -2.339028, 1, 1, 1, 1, 1,
-1.02307, -0.08534255, -1.55797, 1, 1, 1, 1, 1,
-1.014519, 0.2152399, -1.647617, 1, 1, 1, 1, 1,
-1.014461, 0.4327684, -2.57427, 1, 1, 1, 1, 1,
-1.011837, 0.22045, -3.861649, 0, 0, 1, 1, 1,
-1.011125, -0.2502946, -3.6853, 1, 0, 0, 1, 1,
-1.00321, 0.1582789, -1.319377, 1, 0, 0, 1, 1,
-0.9999032, -1.263795, -1.584733, 1, 0, 0, 1, 1,
-0.9998184, -0.5733791, -2.092179, 1, 0, 0, 1, 1,
-0.9997643, -1.617738, -2.879864, 1, 0, 0, 1, 1,
-0.9936668, 0.03721609, -2.087821, 0, 0, 0, 1, 1,
-0.9898843, 1.287114, -0.2092922, 0, 0, 0, 1, 1,
-0.9898672, 0.01569405, -1.029751, 0, 0, 0, 1, 1,
-0.9870618, 3.036795, 1.149831, 0, 0, 0, 1, 1,
-0.9735188, -1.209091, -2.059459, 0, 0, 0, 1, 1,
-0.9720533, 1.392736, -0.8644222, 0, 0, 0, 1, 1,
-0.9715239, -1.374829, -1.349902, 0, 0, 0, 1, 1,
-0.9625029, -0.3672328, -1.734768, 1, 1, 1, 1, 1,
-0.9621417, -0.1989779, -0.9116214, 1, 1, 1, 1, 1,
-0.9589, -0.5175237, -2.011641, 1, 1, 1, 1, 1,
-0.9548168, 0.1731945, -1.430288, 1, 1, 1, 1, 1,
-0.9505149, -0.4938644, -1.027205, 1, 1, 1, 1, 1,
-0.9411891, -0.9571813, -2.784698, 1, 1, 1, 1, 1,
-0.9397274, 0.1125304, 1.381912, 1, 1, 1, 1, 1,
-0.9373749, 0.02906837, -1.141882, 1, 1, 1, 1, 1,
-0.9367787, -0.09046122, -0.9782926, 1, 1, 1, 1, 1,
-0.9362752, 0.09191396, -1.487642, 1, 1, 1, 1, 1,
-0.9258022, -0.2244195, -3.164459, 1, 1, 1, 1, 1,
-0.9182126, 1.087026, -0.2239752, 1, 1, 1, 1, 1,
-0.9176229, 2.159046, 0.9939393, 1, 1, 1, 1, 1,
-0.9175677, -0.7416648, -2.13923, 1, 1, 1, 1, 1,
-0.91378, 0.3727361, -1.725397, 1, 1, 1, 1, 1,
-0.9110608, 0.9008058, -0.6389725, 0, 0, 1, 1, 1,
-0.9103391, -0.7406512, -3.599993, 1, 0, 0, 1, 1,
-0.9081923, 0.7719606, -1.618676, 1, 0, 0, 1, 1,
-0.9063083, -1.556837, -1.590148, 1, 0, 0, 1, 1,
-0.9047568, 0.7736756, -1.778285, 1, 0, 0, 1, 1,
-0.9012806, -0.7953046, -0.6429849, 1, 0, 0, 1, 1,
-0.8939689, -0.7511174, -2.615498, 0, 0, 0, 1, 1,
-0.8899232, -0.4097618, -2.578791, 0, 0, 0, 1, 1,
-0.8773281, -0.5079789, -1.301211, 0, 0, 0, 1, 1,
-0.866774, -1.573699, -4.728859, 0, 0, 0, 1, 1,
-0.8650608, -1.083661, -2.856881, 0, 0, 0, 1, 1,
-0.8637652, 1.00506, 0.03831668, 0, 0, 0, 1, 1,
-0.8612328, -1.000362, -2.711385, 0, 0, 0, 1, 1,
-0.8605692, 0.03570036, -1.313068, 1, 1, 1, 1, 1,
-0.8589976, -0.9996946, -3.144228, 1, 1, 1, 1, 1,
-0.8555533, 0.1654967, -2.174615, 1, 1, 1, 1, 1,
-0.8487875, 0.1877817, -1.677233, 1, 1, 1, 1, 1,
-0.8465217, 0.1912486, -0.6204264, 1, 1, 1, 1, 1,
-0.8278644, 0.9840664, 0.6073188, 1, 1, 1, 1, 1,
-0.8243449, -0.481329, -3.140297, 1, 1, 1, 1, 1,
-0.8214703, 0.2023236, -0.7648707, 1, 1, 1, 1, 1,
-0.8166639, -0.7375618, -1.910522, 1, 1, 1, 1, 1,
-0.801034, 0.4909967, -2.3152, 1, 1, 1, 1, 1,
-0.7899232, -0.2177983, -1.293563, 1, 1, 1, 1, 1,
-0.7890912, 1.525401, 0.5505668, 1, 1, 1, 1, 1,
-0.7776801, 2.466538, -0.5357667, 1, 1, 1, 1, 1,
-0.7763944, 0.03455385, -1.985905, 1, 1, 1, 1, 1,
-0.7743949, -0.6629998, -3.243322, 1, 1, 1, 1, 1,
-0.7707615, 2.230745, -2.546396, 0, 0, 1, 1, 1,
-0.7678295, 0.1487807, -0.7354699, 1, 0, 0, 1, 1,
-0.7638643, 0.6933933, -1.435159, 1, 0, 0, 1, 1,
-0.7636591, 0.7584761, -0.6505155, 1, 0, 0, 1, 1,
-0.7611226, -2.658109, -2.675378, 1, 0, 0, 1, 1,
-0.7577997, 0.3050584, -0.1021001, 1, 0, 0, 1, 1,
-0.7553179, 0.01497903, -1.104436, 0, 0, 0, 1, 1,
-0.7545698, 0.05030387, -2.724595, 0, 0, 0, 1, 1,
-0.7540233, -0.5562379, -0.5868033, 0, 0, 0, 1, 1,
-0.7537177, 1.58693, 0.7094737, 0, 0, 0, 1, 1,
-0.7537145, 1.453217, -2.774484, 0, 0, 0, 1, 1,
-0.7501552, 2.213965, -1.012752, 0, 0, 0, 1, 1,
-0.746525, -0.8482341, -1.889562, 0, 0, 0, 1, 1,
-0.7455193, -1.677306, -2.106781, 1, 1, 1, 1, 1,
-0.7379681, -1.887719, -2.119593, 1, 1, 1, 1, 1,
-0.7360479, 1.514699, -1.332151, 1, 1, 1, 1, 1,
-0.7335593, -2.597882, -3.65941, 1, 1, 1, 1, 1,
-0.7321898, 0.0702747, -1.570158, 1, 1, 1, 1, 1,
-0.7245792, 1.21848, 0.04778327, 1, 1, 1, 1, 1,
-0.7227687, 0.04998888, -2.679636, 1, 1, 1, 1, 1,
-0.7210176, 1.143253, -1.534494, 1, 1, 1, 1, 1,
-0.7194943, -2.313418, -2.998985, 1, 1, 1, 1, 1,
-0.717296, -0.7803602, -2.277427, 1, 1, 1, 1, 1,
-0.7143089, -2.422162, -2.468661, 1, 1, 1, 1, 1,
-0.7122334, -0.2016837, -3.07178, 1, 1, 1, 1, 1,
-0.7079673, 0.5069764, -1.126869, 1, 1, 1, 1, 1,
-0.7018723, 0.01555039, -0.6796259, 1, 1, 1, 1, 1,
-0.6870467, 1.651287, -1.079984, 1, 1, 1, 1, 1,
-0.6858578, -0.483085, -2.235593, 0, 0, 1, 1, 1,
-0.6828497, 0.09456506, -2.157047, 1, 0, 0, 1, 1,
-0.6821585, 1.370005, 2.466902, 1, 0, 0, 1, 1,
-0.6769578, -0.5481192, -0.2849458, 1, 0, 0, 1, 1,
-0.6743177, -1.955542, -3.023429, 1, 0, 0, 1, 1,
-0.674001, 0.5543642, 0.483163, 1, 0, 0, 1, 1,
-0.6717024, 0.8054854, 0.3880334, 0, 0, 0, 1, 1,
-0.6704056, 0.586353, -0.8029982, 0, 0, 0, 1, 1,
-0.6696835, -0.1156045, -1.846488, 0, 0, 0, 1, 1,
-0.6659729, -1.596703, -2.46014, 0, 0, 0, 1, 1,
-0.6640792, -0.4952077, -2.376225, 0, 0, 0, 1, 1,
-0.6620902, 1.074249, -0.8610992, 0, 0, 0, 1, 1,
-0.6616879, -0.168147, -0.7695258, 0, 0, 0, 1, 1,
-0.6490371, 1.829157, -0.1917543, 1, 1, 1, 1, 1,
-0.6383265, 0.05443255, -0.9538792, 1, 1, 1, 1, 1,
-0.6273517, -0.8498206, -0.5622547, 1, 1, 1, 1, 1,
-0.6189291, -0.7720111, -2.011019, 1, 1, 1, 1, 1,
-0.6133144, -1.014343, -1.421371, 1, 1, 1, 1, 1,
-0.6123965, 0.452879, -0.6049168, 1, 1, 1, 1, 1,
-0.6054384, -0.2509826, -3.073842, 1, 1, 1, 1, 1,
-0.6047503, 0.7571993, -0.7956134, 1, 1, 1, 1, 1,
-0.604423, 0.1293921, -0.39561, 1, 1, 1, 1, 1,
-0.591035, 0.9448833, -1.883714, 1, 1, 1, 1, 1,
-0.5815521, 1.174217, 1.250884, 1, 1, 1, 1, 1,
-0.579406, 2.342122, -1.602543, 1, 1, 1, 1, 1,
-0.5707986, 1.975824, 0.384887, 1, 1, 1, 1, 1,
-0.5703863, -0.6671292, -2.847926, 1, 1, 1, 1, 1,
-0.5693194, -0.7841369, -2.84954, 1, 1, 1, 1, 1,
-0.5679119, -0.8703172, -3.021995, 0, 0, 1, 1, 1,
-0.566268, 0.5022451, -0.2473889, 1, 0, 0, 1, 1,
-0.5648825, 0.1159306, -0.805453, 1, 0, 0, 1, 1,
-0.5617203, 1.616996, 0.04765325, 1, 0, 0, 1, 1,
-0.56149, 0.9315, -1.63545, 1, 0, 0, 1, 1,
-0.5583807, 0.1805861, -0.8846384, 1, 0, 0, 1, 1,
-0.5559974, 0.5122008, 0.005031269, 0, 0, 0, 1, 1,
-0.545822, 0.8307326, -2.390911, 0, 0, 0, 1, 1,
-0.5441631, 1.152457, -1.797226, 0, 0, 0, 1, 1,
-0.5438743, -1.31868, -1.868607, 0, 0, 0, 1, 1,
-0.54217, 0.6669647, 0.9502822, 0, 0, 0, 1, 1,
-0.5405032, -0.9743931, -1.033293, 0, 0, 0, 1, 1,
-0.5363511, -0.7756618, -4.665746, 0, 0, 0, 1, 1,
-0.5333866, -0.9548998, -2.749815, 1, 1, 1, 1, 1,
-0.5288227, -1.415044, -4.4972, 1, 1, 1, 1, 1,
-0.5221061, -0.8711305, -3.438981, 1, 1, 1, 1, 1,
-0.5217252, -1.301124, -1.5415, 1, 1, 1, 1, 1,
-0.5208272, -0.2419218, -1.92433, 1, 1, 1, 1, 1,
-0.5205252, 0.2704936, -1.076492, 1, 1, 1, 1, 1,
-0.5189754, 1.016442, -1.756195, 1, 1, 1, 1, 1,
-0.5172135, 0.812162, -0.1536293, 1, 1, 1, 1, 1,
-0.515772, -0.9194335, -1.723211, 1, 1, 1, 1, 1,
-0.5147851, -0.2205726, -2.427606, 1, 1, 1, 1, 1,
-0.5138366, -0.3677817, -2.022104, 1, 1, 1, 1, 1,
-0.5122252, -0.6406318, -2.643925, 1, 1, 1, 1, 1,
-0.5102892, -0.5856484, -4.09297, 1, 1, 1, 1, 1,
-0.5100792, -0.9068463, -1.713261, 1, 1, 1, 1, 1,
-0.5085976, 0.06496985, -1.377548, 1, 1, 1, 1, 1,
-0.5034897, 1.849681, -0.9510095, 0, 0, 1, 1, 1,
-0.4968828, -1.119035, -2.007484, 1, 0, 0, 1, 1,
-0.4928232, 1.351519, 0.4363268, 1, 0, 0, 1, 1,
-0.4927398, 0.0221337, -2.97639, 1, 0, 0, 1, 1,
-0.4924425, 0.0782994, -1.355508, 1, 0, 0, 1, 1,
-0.4848809, -0.4879597, -1.381037, 1, 0, 0, 1, 1,
-0.4846127, 1.176849, 0.6715398, 0, 0, 0, 1, 1,
-0.4844759, -1.089918, -3.825852, 0, 0, 0, 1, 1,
-0.4837565, 0.3357294, 0.09195277, 0, 0, 0, 1, 1,
-0.4811282, 1.687377, -0.8955215, 0, 0, 0, 1, 1,
-0.4787937, -0.8418738, -3.928015, 0, 0, 0, 1, 1,
-0.4781751, 0.6449065, -0.9046727, 0, 0, 0, 1, 1,
-0.4769906, -1.323316, -3.454124, 0, 0, 0, 1, 1,
-0.4739586, 1.363415, -0.7706065, 1, 1, 1, 1, 1,
-0.472682, -1.125975, -0.9291578, 1, 1, 1, 1, 1,
-0.472095, -0.980487, -4.580915, 1, 1, 1, 1, 1,
-0.4690849, 0.3455888, 0.859696, 1, 1, 1, 1, 1,
-0.4660392, -0.6338748, -2.054468, 1, 1, 1, 1, 1,
-0.4646399, -1.775392, -2.287192, 1, 1, 1, 1, 1,
-0.4640487, -1.229249, -3.873319, 1, 1, 1, 1, 1,
-0.4635287, 1.47955, -0.93505, 1, 1, 1, 1, 1,
-0.4620217, 0.2900158, -0.7092782, 1, 1, 1, 1, 1,
-0.4610917, -1.58533, -3.131582, 1, 1, 1, 1, 1,
-0.4510452, 1.123833, -0.07657146, 1, 1, 1, 1, 1,
-0.4487605, -0.5178857, -1.580528, 1, 1, 1, 1, 1,
-0.4442863, -0.3866329, -1.861418, 1, 1, 1, 1, 1,
-0.4441339, 1.498387, 1.126317, 1, 1, 1, 1, 1,
-0.4401602, -0.202627, -2.142735, 1, 1, 1, 1, 1,
-0.4384739, -0.4851686, -2.937666, 0, 0, 1, 1, 1,
-0.4366379, -0.2927508, -1.687563, 1, 0, 0, 1, 1,
-0.4356441, 1.026802, 0.4041128, 1, 0, 0, 1, 1,
-0.4345107, -1.192095, -0.8755467, 1, 0, 0, 1, 1,
-0.4345072, -0.0004744595, -2.857153, 1, 0, 0, 1, 1,
-0.4343717, -0.6146608, -2.972009, 1, 0, 0, 1, 1,
-0.430804, 0.5103714, -1.771015, 0, 0, 0, 1, 1,
-0.4289955, 0.5302739, -2.99762, 0, 0, 0, 1, 1,
-0.4257929, -0.7262522, -3.851239, 0, 0, 0, 1, 1,
-0.4249777, -1.416828, -2.590168, 0, 0, 0, 1, 1,
-0.4192811, 0.5518473, 0.8525963, 0, 0, 0, 1, 1,
-0.4144397, -0.4233239, -0.9152294, 0, 0, 0, 1, 1,
-0.4090519, -2.069366, -1.535609, 0, 0, 0, 1, 1,
-0.4082188, -1.821435, -3.943875, 1, 1, 1, 1, 1,
-0.4040113, 0.948128, 0.8658567, 1, 1, 1, 1, 1,
-0.3973306, -0.3797913, -3.74508, 1, 1, 1, 1, 1,
-0.3909092, 2.313834, -0.5734172, 1, 1, 1, 1, 1,
-0.3862095, -1.234992, -3.946097, 1, 1, 1, 1, 1,
-0.3832003, 0.7048579, 0.2360349, 1, 1, 1, 1, 1,
-0.3827655, -0.9420962, -0.2235764, 1, 1, 1, 1, 1,
-0.3825047, 0.9871194, -0.2570956, 1, 1, 1, 1, 1,
-0.3822195, -2.401324, -1.256724, 1, 1, 1, 1, 1,
-0.3764689, -0.3194469, -2.735929, 1, 1, 1, 1, 1,
-0.3763532, 0.1339228, -2.949165, 1, 1, 1, 1, 1,
-0.3755738, 1.382584, -1.04232, 1, 1, 1, 1, 1,
-0.374697, -0.099387, -1.610661, 1, 1, 1, 1, 1,
-0.3658749, -0.4256068, -2.120629, 1, 1, 1, 1, 1,
-0.3570818, -0.1270091, -2.304121, 1, 1, 1, 1, 1,
-0.3566117, -0.8913756, -2.493449, 0, 0, 1, 1, 1,
-0.3548053, -0.551892, -2.272988, 1, 0, 0, 1, 1,
-0.3543096, 1.281174, -1.511998, 1, 0, 0, 1, 1,
-0.3515946, 0.4147844, -0.3249381, 1, 0, 0, 1, 1,
-0.3511068, -1.981447, -2.4215, 1, 0, 0, 1, 1,
-0.3501012, -1.012193, -4.063107, 1, 0, 0, 1, 1,
-0.346649, 1.358132, -1.580323, 0, 0, 0, 1, 1,
-0.3414031, -0.2825834, -3.41713, 0, 0, 0, 1, 1,
-0.3410332, -0.3517757, -3.109731, 0, 0, 0, 1, 1,
-0.3406246, 1.359304, -1.550715, 0, 0, 0, 1, 1,
-0.3331975, 1.502169, 0.1434968, 0, 0, 0, 1, 1,
-0.3323203, 0.8012826, -0.9417147, 0, 0, 0, 1, 1,
-0.3300263, -1.678079, -1.603379, 0, 0, 0, 1, 1,
-0.3268546, -0.9020382, -2.239358, 1, 1, 1, 1, 1,
-0.3264336, -1.105765, -3.658907, 1, 1, 1, 1, 1,
-0.3242727, -1.699811, -3.625512, 1, 1, 1, 1, 1,
-0.3175663, 0.529741, -0.8998936, 1, 1, 1, 1, 1,
-0.3166636, 1.130882, 2.353429, 1, 1, 1, 1, 1,
-0.3162202, 0.8045238, 0.9354784, 1, 1, 1, 1, 1,
-0.3150661, 2.242239, -0.4907258, 1, 1, 1, 1, 1,
-0.3121568, -1.387385, -3.482089, 1, 1, 1, 1, 1,
-0.308586, 0.378344, -0.8947585, 1, 1, 1, 1, 1,
-0.3085061, 1.801783, -0.3765974, 1, 1, 1, 1, 1,
-0.3060615, 1.033941, 0.5730208, 1, 1, 1, 1, 1,
-0.3056332, 0.1770907, -0.9121307, 1, 1, 1, 1, 1,
-0.3013559, -1.883047, -3.125829, 1, 1, 1, 1, 1,
-0.3001604, -0.3104647, -3.638814, 1, 1, 1, 1, 1,
-0.2976595, -0.5778026, -1.96103, 1, 1, 1, 1, 1,
-0.2941452, 1.164895, 0.7263435, 0, 0, 1, 1, 1,
-0.2917883, -0.9927597, -2.399719, 1, 0, 0, 1, 1,
-0.2880708, 1.553149, -0.2622771, 1, 0, 0, 1, 1,
-0.2874747, 1.22663, 1.84994, 1, 0, 0, 1, 1,
-0.2817437, 2.178211, -0.7880983, 1, 0, 0, 1, 1,
-0.2816818, 1.834282, 1.359166, 1, 0, 0, 1, 1,
-0.2788989, 1.224932, -0.8823992, 0, 0, 0, 1, 1,
-0.2778772, 0.05290586, -3.147981, 0, 0, 0, 1, 1,
-0.2767885, -0.2199642, -2.194963, 0, 0, 0, 1, 1,
-0.2739826, 0.4220115, 0.5037658, 0, 0, 0, 1, 1,
-0.2708648, -1.22966, -3.866543, 0, 0, 0, 1, 1,
-0.2676558, -0.4027214, -2.634581, 0, 0, 0, 1, 1,
-0.2644392, 0.1724977, 0.6835837, 0, 0, 0, 1, 1,
-0.2622945, -0.8007037, -2.877026, 1, 1, 1, 1, 1,
-0.2592419, 0.1696309, -0.8808247, 1, 1, 1, 1, 1,
-0.2588425, 0.2495129, -1.741346, 1, 1, 1, 1, 1,
-0.2586538, -0.2016631, -3.489407, 1, 1, 1, 1, 1,
-0.2574961, 0.6756634, -0.4296267, 1, 1, 1, 1, 1,
-0.2554865, -0.7953609, -4.646543, 1, 1, 1, 1, 1,
-0.2538451, -1.78306, -2.999849, 1, 1, 1, 1, 1,
-0.2528008, 0.3165599, -0.7195348, 1, 1, 1, 1, 1,
-0.2473873, 1.044839, -0.01935195, 1, 1, 1, 1, 1,
-0.2463026, 0.3899927, -1.260497, 1, 1, 1, 1, 1,
-0.246302, -0.6958334, -2.590163, 1, 1, 1, 1, 1,
-0.245887, -0.2779512, -2.016006, 1, 1, 1, 1, 1,
-0.2449767, 1.242157, -1.609742, 1, 1, 1, 1, 1,
-0.2448754, 1.19462, -1.817716, 1, 1, 1, 1, 1,
-0.2436039, -1.862076, -2.069366, 1, 1, 1, 1, 1,
-0.2389244, -0.5950583, -0.9805284, 0, 0, 1, 1, 1,
-0.238438, -0.3852247, -2.657059, 1, 0, 0, 1, 1,
-0.2372915, -0.527473, -2.858501, 1, 0, 0, 1, 1,
-0.2366757, 1.195123, 1.749106, 1, 0, 0, 1, 1,
-0.233355, 0.6739374, 0.150895, 1, 0, 0, 1, 1,
-0.2322256, -0.7052791, -0.9724849, 1, 0, 0, 1, 1,
-0.2252836, 1.423109, 1.320982, 0, 0, 0, 1, 1,
-0.2251208, 1.330519, -0.1240163, 0, 0, 0, 1, 1,
-0.2238288, 0.3182277, -0.01979103, 0, 0, 0, 1, 1,
-0.2205174, -0.6377947, -2.955752, 0, 0, 0, 1, 1,
-0.2161558, -0.2828622, -1.482589, 0, 0, 0, 1, 1,
-0.2156388, -0.6006408, -1.70881, 0, 0, 0, 1, 1,
-0.2132085, 1.008677, -1.663867, 0, 0, 0, 1, 1,
-0.2129479, 0.2411294, 1.462982, 1, 1, 1, 1, 1,
-0.212536, -1.51072, -2.554672, 1, 1, 1, 1, 1,
-0.2112485, -0.1628218, -1.558037, 1, 1, 1, 1, 1,
-0.2097639, 0.0324114, -0.4115382, 1, 1, 1, 1, 1,
-0.2086975, -2.128891, -3.838361, 1, 1, 1, 1, 1,
-0.2086095, -0.4604239, -2.833065, 1, 1, 1, 1, 1,
-0.2059725, 2.538079, 1.358694, 1, 1, 1, 1, 1,
-0.1957804, 0.178596, -0.2979648, 1, 1, 1, 1, 1,
-0.1955097, 0.5256768, -1.682114, 1, 1, 1, 1, 1,
-0.1951999, -1.036909, -2.171205, 1, 1, 1, 1, 1,
-0.1927065, -0.6066873, -3.574227, 1, 1, 1, 1, 1,
-0.1832808, -0.6039102, -1.162469, 1, 1, 1, 1, 1,
-0.1801038, 0.7008791, 0.02412206, 1, 1, 1, 1, 1,
-0.1798438, 0.0001985934, -2.534771, 1, 1, 1, 1, 1,
-0.1775859, -0.2622923, -2.122491, 1, 1, 1, 1, 1,
-0.1756995, -1.595907, -3.705794, 0, 0, 1, 1, 1,
-0.1738702, 0.5429786, -0.09819851, 1, 0, 0, 1, 1,
-0.1734992, 1.258979, -1.538225, 1, 0, 0, 1, 1,
-0.1700533, -2.377236, -3.115203, 1, 0, 0, 1, 1,
-0.169422, 2.174986, -0.7707615, 1, 0, 0, 1, 1,
-0.1666342, -0.6331469, -3.03717, 1, 0, 0, 1, 1,
-0.1659575, -1.174168, -3.084002, 0, 0, 0, 1, 1,
-0.1635877, 0.2110949, -0.4023905, 0, 0, 0, 1, 1,
-0.1630597, -0.6350446, -2.172654, 0, 0, 0, 1, 1,
-0.1627951, 0.5311761, -0.3221119, 0, 0, 0, 1, 1,
-0.1561756, -0.2552193, -3.346172, 0, 0, 0, 1, 1,
-0.1455717, -1.860219, -2.903844, 0, 0, 0, 1, 1,
-0.1455586, -0.7254083, -2.268023, 0, 0, 0, 1, 1,
-0.1426702, 0.8981849, -0.1076844, 1, 1, 1, 1, 1,
-0.1421822, 0.220509, -0.6877496, 1, 1, 1, 1, 1,
-0.1394685, 0.4569874, -0.8258049, 1, 1, 1, 1, 1,
-0.1378088, -0.8812488, -3.091324, 1, 1, 1, 1, 1,
-0.1351449, 1.081221, 1.121462, 1, 1, 1, 1, 1,
-0.1292817, 1.157556, -3.259224, 1, 1, 1, 1, 1,
-0.1260003, -0.6756608, -3.780422, 1, 1, 1, 1, 1,
-0.1226898, -1.493079, -4.848028, 1, 1, 1, 1, 1,
-0.1220158, -2.466418, -3.148504, 1, 1, 1, 1, 1,
-0.1204867, -0.06923474, -1.876044, 1, 1, 1, 1, 1,
-0.1191286, -1.629588, -2.627492, 1, 1, 1, 1, 1,
-0.1166365, 1.317001, 0.1262176, 1, 1, 1, 1, 1,
-0.1162519, 0.5911401, -0.2437608, 1, 1, 1, 1, 1,
-0.1151075, -0.7085813, -3.017491, 1, 1, 1, 1, 1,
-0.114021, -2.332829, -2.445666, 1, 1, 1, 1, 1,
-0.1137234, -0.1251894, -3.127318, 0, 0, 1, 1, 1,
-0.1107277, -0.2670217, -3.606737, 1, 0, 0, 1, 1,
-0.1095942, 0.3433256, -0.5421937, 1, 0, 0, 1, 1,
-0.1086079, 0.7509076, -0.4266008, 1, 0, 0, 1, 1,
-0.1086037, 0.3400561, -1.080966, 1, 0, 0, 1, 1,
-0.1078987, 0.9221808, 2.642742, 1, 0, 0, 1, 1,
-0.1042958, -2.862085, -2.158985, 0, 0, 0, 1, 1,
-0.09789588, -1.284701, -0.5537027, 0, 0, 0, 1, 1,
-0.09753154, -0.1219206, -3.235709, 0, 0, 0, 1, 1,
-0.09098639, 1.717009, -1.127893, 0, 0, 0, 1, 1,
-0.08956166, -0.2517631, -2.36743, 0, 0, 0, 1, 1,
-0.07671112, -0.8158671, -3.262427, 0, 0, 0, 1, 1,
-0.07597516, -0.4497202, -3.717972, 0, 0, 0, 1, 1,
-0.07481997, -0.06616919, -3.179892, 1, 1, 1, 1, 1,
-0.0726359, 1.789576, -2.083584, 1, 1, 1, 1, 1,
-0.06820228, -0.7372482, -2.46489, 1, 1, 1, 1, 1,
-0.06815365, 0.1311285, 0.5217907, 1, 1, 1, 1, 1,
-0.06221328, 0.4501295, -0.2648153, 1, 1, 1, 1, 1,
-0.06201986, 0.141432, -0.01168637, 1, 1, 1, 1, 1,
-0.06026832, -0.7512531, -2.362637, 1, 1, 1, 1, 1,
-0.05951728, -0.8596533, -3.445649, 1, 1, 1, 1, 1,
-0.05783881, 0.1586142, -2.091013, 1, 1, 1, 1, 1,
-0.0537781, 1.314368, 0.9261478, 1, 1, 1, 1, 1,
-0.05043614, 0.8972861, 0.2673913, 1, 1, 1, 1, 1,
-0.04950683, 1.541896, 0.81434, 1, 1, 1, 1, 1,
-0.04862691, -1.536407, -1.985791, 1, 1, 1, 1, 1,
-0.04763102, 1.033448, 0.8815981, 1, 1, 1, 1, 1,
-0.04593695, 0.3666577, -0.5565425, 1, 1, 1, 1, 1,
-0.04073021, 0.5160497, 0.4099641, 0, 0, 1, 1, 1,
-0.03605347, 2.69798, 0.4328608, 1, 0, 0, 1, 1,
-0.03355265, -0.1378987, -2.825238, 1, 0, 0, 1, 1,
-0.03070012, -0.964708, -3.223117, 1, 0, 0, 1, 1,
-0.030291, -1.886587, -1.120047, 1, 0, 0, 1, 1,
-0.02913073, -0.4982231, -3.711509, 1, 0, 0, 1, 1,
-0.02824596, -0.5616817, -2.752467, 0, 0, 0, 1, 1,
-0.02795777, -0.0380441, -2.751322, 0, 0, 0, 1, 1,
-0.02668255, -0.5567957, -3.961004, 0, 0, 0, 1, 1,
-0.0255971, -0.1370201, -3.397673, 0, 0, 0, 1, 1,
-0.01785392, 0.3146136, 0.1976358, 0, 0, 0, 1, 1,
-0.01687052, 0.7762917, -0.7989525, 0, 0, 0, 1, 1,
-0.01412468, -0.8766376, -2.350043, 0, 0, 0, 1, 1,
-0.01335329, 0.4841447, 0.9878829, 1, 1, 1, 1, 1,
-0.007411567, -1.579533, -2.675283, 1, 1, 1, 1, 1,
-0.005509881, 0.01359341, -0.9666994, 1, 1, 1, 1, 1,
-0.00509137, -0.05672293, -4.234132, 1, 1, 1, 1, 1,
-0.001618847, 1.407129, -0.9183022, 1, 1, 1, 1, 1,
-0.001347344, 1.079706, -0.06276942, 1, 1, 1, 1, 1,
-0.0009965289, -1.611926, -4.97525, 1, 1, 1, 1, 1,
-0.0003626111, -1.092808, -2.254482, 1, 1, 1, 1, 1,
0.002946013, 0.2637199, 0.8144488, 1, 1, 1, 1, 1,
0.005608781, 0.930829, 0.09894563, 1, 1, 1, 1, 1,
0.007322366, -0.9410589, 4.552613, 1, 1, 1, 1, 1,
0.00891555, 0.05034141, 1.816366, 1, 1, 1, 1, 1,
0.01061926, -0.2436312, 2.996989, 1, 1, 1, 1, 1,
0.01203843, 0.4259917, 0.2164654, 1, 1, 1, 1, 1,
0.01267386, 2.002266, 0.7761484, 1, 1, 1, 1, 1,
0.01947331, 1.050049, 0.9196874, 0, 0, 1, 1, 1,
0.02325805, -0.09430371, 4.997897, 1, 0, 0, 1, 1,
0.02391608, -0.8966127, 3.088639, 1, 0, 0, 1, 1,
0.02394908, -0.9764863, 4.046177, 1, 0, 0, 1, 1,
0.02424131, 0.103472, -0.2436861, 1, 0, 0, 1, 1,
0.02432754, -1.045065, 3.287204, 1, 0, 0, 1, 1,
0.02545619, -0.5875074, 2.305773, 0, 0, 0, 1, 1,
0.03016687, 0.4049037, 0.417062, 0, 0, 0, 1, 1,
0.03678219, -1.164014, 2.029567, 0, 0, 0, 1, 1,
0.0373183, 0.1529365, 0.7651785, 0, 0, 0, 1, 1,
0.03821237, 0.1838002, 0.3546669, 0, 0, 0, 1, 1,
0.04377513, -0.2104416, 2.902499, 0, 0, 0, 1, 1,
0.04395564, 1.3502, -1.488394, 0, 0, 0, 1, 1,
0.04494807, -1.481927, 3.364229, 1, 1, 1, 1, 1,
0.04511346, -0.4393526, 2.554476, 1, 1, 1, 1, 1,
0.04555865, -0.1971534, 3.446313, 1, 1, 1, 1, 1,
0.04699028, -0.468873, 3.874311, 1, 1, 1, 1, 1,
0.04985812, -0.2987526, 2.742115, 1, 1, 1, 1, 1,
0.0500262, 2.381762, 0.7796925, 1, 1, 1, 1, 1,
0.05076055, 0.2565344, 1.557563, 1, 1, 1, 1, 1,
0.05290692, 1.406177, -0.2103925, 1, 1, 1, 1, 1,
0.05519561, -1.340766, 3.855877, 1, 1, 1, 1, 1,
0.05709875, 1.62336, -0.4038686, 1, 1, 1, 1, 1,
0.05907539, -0.3355437, 1.83218, 1, 1, 1, 1, 1,
0.05921542, -0.1797472, 2.961332, 1, 1, 1, 1, 1,
0.06034435, -0.6328027, 2.913141, 1, 1, 1, 1, 1,
0.06311813, -0.01224219, 1.006158, 1, 1, 1, 1, 1,
0.06332534, 1.912606, 0.5407751, 1, 1, 1, 1, 1,
0.06431717, 1.123648, 0.1683706, 0, 0, 1, 1, 1,
0.0644044, -0.5996375, 3.352176, 1, 0, 0, 1, 1,
0.06623136, -1.519854, 3.534888, 1, 0, 0, 1, 1,
0.06933571, 0.3875692, 0.9930988, 1, 0, 0, 1, 1,
0.06964189, -0.3655321, 4.43817, 1, 0, 0, 1, 1,
0.07075353, 0.5075692, -0.9401962, 1, 0, 0, 1, 1,
0.07108448, 0.05242116, 0.1739382, 0, 0, 0, 1, 1,
0.07305877, -0.8602503, 2.431186, 0, 0, 0, 1, 1,
0.0748341, -0.5288416, 4.473743, 0, 0, 0, 1, 1,
0.07711048, 0.2286417, -1.562497, 0, 0, 0, 1, 1,
0.08079295, -0.2541254, 3.524547, 0, 0, 0, 1, 1,
0.08122922, -0.1513032, 2.803989, 0, 0, 0, 1, 1,
0.08310243, 2.419323, 0.4645722, 0, 0, 0, 1, 1,
0.08329584, -0.3836324, 4.385038, 1, 1, 1, 1, 1,
0.08352707, 1.351026, 1.060835, 1, 1, 1, 1, 1,
0.08430416, 0.9966142, -0.5069655, 1, 1, 1, 1, 1,
0.08560631, -0.1741994, 2.479687, 1, 1, 1, 1, 1,
0.08867228, 0.6359587, 1.518128, 1, 1, 1, 1, 1,
0.09124419, 1.570144, -2.109784, 1, 1, 1, 1, 1,
0.09281688, 0.6835405, -0.0634414, 1, 1, 1, 1, 1,
0.1000868, 3.432067, -0.1082856, 1, 1, 1, 1, 1,
0.1022562, 0.3828214, -2.211535, 1, 1, 1, 1, 1,
0.1033622, -0.7306863, 3.094845, 1, 1, 1, 1, 1,
0.103546, -0.02453419, 1.589335, 1, 1, 1, 1, 1,
0.1090886, 0.2323962, 0.3067659, 1, 1, 1, 1, 1,
0.1094551, 1.006211, 0.5880535, 1, 1, 1, 1, 1,
0.1117619, 0.8503886, 0.8965139, 1, 1, 1, 1, 1,
0.1131575, 0.3922136, -0.4594991, 1, 1, 1, 1, 1,
0.1151967, -0.5209395, 3.802353, 0, 0, 1, 1, 1,
0.1153576, -1.24878, 3.734749, 1, 0, 0, 1, 1,
0.119643, -0.9130169, 6.269881, 1, 0, 0, 1, 1,
0.1203009, -0.7057025, 1.523179, 1, 0, 0, 1, 1,
0.123434, -0.3507556, 2.709787, 1, 0, 0, 1, 1,
0.1235599, 0.4243222, -0.00307668, 1, 0, 0, 1, 1,
0.126429, 1.997323, 0.2791918, 0, 0, 0, 1, 1,
0.1267223, -0.8096219, 4.280166, 0, 0, 0, 1, 1,
0.1288103, 1.219, 0.4145148, 0, 0, 0, 1, 1,
0.1313722, 0.5007327, 1.909756, 0, 0, 0, 1, 1,
0.1318197, 0.6618605, -1.284418, 0, 0, 0, 1, 1,
0.1367765, -0.6844213, 2.627666, 0, 0, 0, 1, 1,
0.1434271, 0.2296767, 0.1016301, 0, 0, 0, 1, 1,
0.1438045, 0.8928947, 0.254902, 1, 1, 1, 1, 1,
0.1543759, 0.01193837, 1.186576, 1, 1, 1, 1, 1,
0.1604608, 0.6793498, 1.334357, 1, 1, 1, 1, 1,
0.160916, 0.3261881, 0.1925495, 1, 1, 1, 1, 1,
0.1631801, -0.6979811, 2.634525, 1, 1, 1, 1, 1,
0.1654126, 0.1691412, 2.392538, 1, 1, 1, 1, 1,
0.1654475, -1.18116, 3.68725, 1, 1, 1, 1, 1,
0.1716297, -0.3496153, 3.807728, 1, 1, 1, 1, 1,
0.1815714, -0.07241937, 2.647542, 1, 1, 1, 1, 1,
0.1831522, -1.150962, 4.79959, 1, 1, 1, 1, 1,
0.1840898, 1.102505, -0.9805214, 1, 1, 1, 1, 1,
0.1852725, -0.09968819, 1.720894, 1, 1, 1, 1, 1,
0.1889481, -0.5604573, 1.924626, 1, 1, 1, 1, 1,
0.1890339, 1.268388, -0.9479942, 1, 1, 1, 1, 1,
0.1892085, 0.874863, 0.0009620299, 1, 1, 1, 1, 1,
0.1910945, -0.3231254, 2.244801, 0, 0, 1, 1, 1,
0.191108, 1.363247, 1.101347, 1, 0, 0, 1, 1,
0.1948329, 0.8434299, -0.07704528, 1, 0, 0, 1, 1,
0.1965188, 1.545156, 0.3094054, 1, 0, 0, 1, 1,
0.1992257, 0.07898611, 0.9994731, 1, 0, 0, 1, 1,
0.1994891, -1.852034, 2.576824, 1, 0, 0, 1, 1,
0.2005357, 0.5592513, -0.6912241, 0, 0, 0, 1, 1,
0.2049779, -0.4567644, 2.984989, 0, 0, 0, 1, 1,
0.2058996, -0.2804694, 1.913318, 0, 0, 0, 1, 1,
0.2094397, -1.098368, 3.156228, 0, 0, 0, 1, 1,
0.2110259, -0.1965959, -0.2529091, 0, 0, 0, 1, 1,
0.2125007, -0.03836586, 2.63248, 0, 0, 0, 1, 1,
0.2200933, 1.05715, 0.9677227, 0, 0, 0, 1, 1,
0.2250882, 1.621279, 1.523779, 1, 1, 1, 1, 1,
0.2254531, -1.912898, 2.827266, 1, 1, 1, 1, 1,
0.2331713, -0.3456948, 2.741973, 1, 1, 1, 1, 1,
0.2380973, -0.4974318, 0.7023755, 1, 1, 1, 1, 1,
0.2382099, 1.848972, -0.3523269, 1, 1, 1, 1, 1,
0.2444902, -0.01706738, 1.922858, 1, 1, 1, 1, 1,
0.2479385, 1.62007, 0.9253756, 1, 1, 1, 1, 1,
0.2535774, 1.082055, -1.067952, 1, 1, 1, 1, 1,
0.2541304, -0.2105734, 3.89687, 1, 1, 1, 1, 1,
0.2590118, -0.03924537, 2.779788, 1, 1, 1, 1, 1,
0.2616542, 1.475213, -0.2557572, 1, 1, 1, 1, 1,
0.2633119, 1.854411, 2.917781, 1, 1, 1, 1, 1,
0.2666331, 0.7191845, -1.963999, 1, 1, 1, 1, 1,
0.2692453, -1.831909, 2.317549, 1, 1, 1, 1, 1,
0.2713968, 1.495226, -0.405421, 1, 1, 1, 1, 1,
0.2727911, 0.8421159, 1.383895, 0, 0, 1, 1, 1,
0.2736388, -0.7180035, 3.322863, 1, 0, 0, 1, 1,
0.2770668, -0.2325664, 2.723485, 1, 0, 0, 1, 1,
0.2826874, 1.171333, 1.182641, 1, 0, 0, 1, 1,
0.2859936, 0.5629684, -0.3710768, 1, 0, 0, 1, 1,
0.2867687, -0.3321232, 3.293581, 1, 0, 0, 1, 1,
0.2876987, -1.235957, 2.492288, 0, 0, 0, 1, 1,
0.2889174, -0.2402601, 3.495868, 0, 0, 0, 1, 1,
0.2897031, 2.024649, 0.5904184, 0, 0, 0, 1, 1,
0.2897787, -0.4108307, 4.2884, 0, 0, 0, 1, 1,
0.2913439, 0.01878597, 3.207041, 0, 0, 0, 1, 1,
0.2915662, -0.428367, 0.8536462, 0, 0, 0, 1, 1,
0.2928723, -0.02059203, 3.635581, 0, 0, 0, 1, 1,
0.2970961, -0.06157802, 1.890789, 1, 1, 1, 1, 1,
0.3000957, -1.665067, 2.789697, 1, 1, 1, 1, 1,
0.3036329, -0.1278041, 3.233112, 1, 1, 1, 1, 1,
0.3053427, -0.851423, 2.735206, 1, 1, 1, 1, 1,
0.3064909, -0.05863702, 0.5683215, 1, 1, 1, 1, 1,
0.3071624, 0.470977, -1.26283, 1, 1, 1, 1, 1,
0.3114159, -2.245648, 3.962461, 1, 1, 1, 1, 1,
0.3141006, -0.9757958, 2.858399, 1, 1, 1, 1, 1,
0.3150233, -0.9748811, 2.420142, 1, 1, 1, 1, 1,
0.3150496, -0.283126, 2.460346, 1, 1, 1, 1, 1,
0.3175327, -0.4675675, 2.952113, 1, 1, 1, 1, 1,
0.318073, 2.098823, 1.366643, 1, 1, 1, 1, 1,
0.3184769, 0.8004414, 0.7539538, 1, 1, 1, 1, 1,
0.3213688, 2.00262, 1.214976, 1, 1, 1, 1, 1,
0.3247446, 0.4468377, 0.7703253, 1, 1, 1, 1, 1,
0.3252401, 2.827264, 1.63333, 0, 0, 1, 1, 1,
0.3277322, 1.940041, -0.2974817, 1, 0, 0, 1, 1,
0.3294662, 0.5147331, 0.2988472, 1, 0, 0, 1, 1,
0.329841, -0.4403544, 3.824382, 1, 0, 0, 1, 1,
0.3300776, 0.8961998, 1.470252, 1, 0, 0, 1, 1,
0.33041, -0.8511812, 2.395764, 1, 0, 0, 1, 1,
0.3314742, -0.8212124, 1.896855, 0, 0, 0, 1, 1,
0.3365889, 1.060498, -0.08559175, 0, 0, 0, 1, 1,
0.3379779, 0.9639623, 0.1154932, 0, 0, 0, 1, 1,
0.3406221, 0.3830334, 0.7701196, 0, 0, 0, 1, 1,
0.3443261, -0.7236965, 3.842084, 0, 0, 0, 1, 1,
0.3444636, -1.438987, 1.541517, 0, 0, 0, 1, 1,
0.3446091, -0.3868729, 2.181022, 0, 0, 0, 1, 1,
0.3461656, -2.298669, 3.80918, 1, 1, 1, 1, 1,
0.3473444, 0.3978189, 1.919974, 1, 1, 1, 1, 1,
0.3492101, -0.7769352, 2.054885, 1, 1, 1, 1, 1,
0.3533574, -0.1797644, 2.300213, 1, 1, 1, 1, 1,
0.3538933, 0.138347, 1.630487, 1, 1, 1, 1, 1,
0.3556027, -1.481694, 2.291243, 1, 1, 1, 1, 1,
0.3584051, -0.3667158, 1.51869, 1, 1, 1, 1, 1,
0.3589596, 0.2333985, 2.994512, 1, 1, 1, 1, 1,
0.3603026, -0.6843379, 2.102428, 1, 1, 1, 1, 1,
0.3647336, -0.0493454, 0.5701471, 1, 1, 1, 1, 1,
0.3731201, -0.6145679, 2.441916, 1, 1, 1, 1, 1,
0.3742192, -1.266585, 3.384681, 1, 1, 1, 1, 1,
0.3786352, 1.034332, -0.5781885, 1, 1, 1, 1, 1,
0.3810809, 0.03178015, 0.4240644, 1, 1, 1, 1, 1,
0.381797, 1.463357, 1.584006, 1, 1, 1, 1, 1,
0.3837487, 0.1915475, 0.8966646, 0, 0, 1, 1, 1,
0.3856224, 0.2380662, 1.024909, 1, 0, 0, 1, 1,
0.386574, 1.437748, 0.2562575, 1, 0, 0, 1, 1,
0.3928146, -0.6036297, 1.879226, 1, 0, 0, 1, 1,
0.3932433, 1.626275, 0.6165183, 1, 0, 0, 1, 1,
0.3951102, -0.06439817, 1.957588, 1, 0, 0, 1, 1,
0.3956186, 0.004649788, 3.177146, 0, 0, 0, 1, 1,
0.4049549, 0.2198281, 0.7417068, 0, 0, 0, 1, 1,
0.405429, -2.639212, 1.859217, 0, 0, 0, 1, 1,
0.407572, 2.126927, 0.5155504, 0, 0, 0, 1, 1,
0.4093169, -2.502766, 2.449166, 0, 0, 0, 1, 1,
0.4138741, -0.6344926, 3.046255, 0, 0, 0, 1, 1,
0.4156176, 0.7286064, -0.2640271, 0, 0, 0, 1, 1,
0.4163247, 0.6858038, -0.05643722, 1, 1, 1, 1, 1,
0.4171427, 1.096662, -0.4762902, 1, 1, 1, 1, 1,
0.4175357, 0.3214723, -0.5486252, 1, 1, 1, 1, 1,
0.423593, 1.248726, -0.4877406, 1, 1, 1, 1, 1,
0.4287966, -0.9137933, 3.292571, 1, 1, 1, 1, 1,
0.4312186, 1.806932, 1.577755, 1, 1, 1, 1, 1,
0.4319866, -0.5108405, 3.797447, 1, 1, 1, 1, 1,
0.4367795, 1.551732, -0.04993013, 1, 1, 1, 1, 1,
0.4369848, -1.635025, 1.799186, 1, 1, 1, 1, 1,
0.4383537, 0.2284305, 1.040971, 1, 1, 1, 1, 1,
0.4388216, 1.108349, 0.4640174, 1, 1, 1, 1, 1,
0.4410647, 0.9257935, 1.800357, 1, 1, 1, 1, 1,
0.4414295, -0.553503, 2.946273, 1, 1, 1, 1, 1,
0.4439637, 0.8176198, 1.793364, 1, 1, 1, 1, 1,
0.4457368, 1.465745, -0.3651133, 1, 1, 1, 1, 1,
0.4511936, 0.6656427, 0.3701562, 0, 0, 1, 1, 1,
0.4565297, 0.9630288, -1.321283, 1, 0, 0, 1, 1,
0.4635093, 2.071639, -0.6312766, 1, 0, 0, 1, 1,
0.4636387, 0.1518915, 0.753809, 1, 0, 0, 1, 1,
0.4640553, -0.3002825, 3.120699, 1, 0, 0, 1, 1,
0.4777411, -0.7200934, 2.320924, 1, 0, 0, 1, 1,
0.4782069, -0.5857608, 3.211054, 0, 0, 0, 1, 1,
0.4787488, -0.3989049, 2.85891, 0, 0, 0, 1, 1,
0.4822125, 0.38173, 2.362154, 0, 0, 0, 1, 1,
0.4851953, -0.8872011, 2.182053, 0, 0, 0, 1, 1,
0.4872961, -1.125069, 3.06504, 0, 0, 0, 1, 1,
0.490443, -1.300005, 1.494825, 0, 0, 0, 1, 1,
0.4908459, 0.3656867, 0.3130444, 0, 0, 0, 1, 1,
0.4910302, -1.544999, 2.726038, 1, 1, 1, 1, 1,
0.4929629, -0.4641383, 2.337398, 1, 1, 1, 1, 1,
0.4948463, -0.4364343, 2.293073, 1, 1, 1, 1, 1,
0.4968097, 0.6813381, -1.532712, 1, 1, 1, 1, 1,
0.4973111, 0.4019994, 1.429591, 1, 1, 1, 1, 1,
0.5011917, -0.0731978, 1.821567, 1, 1, 1, 1, 1,
0.5080574, -0.004221702, 0.3604172, 1, 1, 1, 1, 1,
0.5114499, -0.2304847, 1.94372, 1, 1, 1, 1, 1,
0.517606, 0.3324099, 0.2027892, 1, 1, 1, 1, 1,
0.526454, -1.210835, 1.899628, 1, 1, 1, 1, 1,
0.5264593, 0.8367731, -0.3214211, 1, 1, 1, 1, 1,
0.5290127, -1.064084, 0.7461731, 1, 1, 1, 1, 1,
0.5347729, 2.143397, 0.8579206, 1, 1, 1, 1, 1,
0.5370449, -0.3109916, 0.7586227, 1, 1, 1, 1, 1,
0.5389, 0.6448435, 2.565711, 1, 1, 1, 1, 1,
0.5465242, -0.1672894, 0.6716573, 0, 0, 1, 1, 1,
0.5481685, -0.2593737, 2.53154, 1, 0, 0, 1, 1,
0.5500548, -0.1211168, 1.265337, 1, 0, 0, 1, 1,
0.5552188, 0.8852279, 0.08600842, 1, 0, 0, 1, 1,
0.5593032, 0.9410636, 0.1815238, 1, 0, 0, 1, 1,
0.5594764, 0.967064, -0.3286858, 1, 0, 0, 1, 1,
0.5599938, 0.03895608, 2.172954, 0, 0, 0, 1, 1,
0.5600373, 3.797351, -0.6068982, 0, 0, 0, 1, 1,
0.5605295, 1.045265, 0.5706284, 0, 0, 0, 1, 1,
0.5634731, -1.628664, 1.755798, 0, 0, 0, 1, 1,
0.566269, -0.05035707, 2.013225, 0, 0, 0, 1, 1,
0.5760192, 0.1240954, 3.570082, 0, 0, 0, 1, 1,
0.5761577, 1.415764, 0.9340446, 0, 0, 0, 1, 1,
0.576282, 0.8553326, 0.4254332, 1, 1, 1, 1, 1,
0.5790673, 0.2933471, 0.7836733, 1, 1, 1, 1, 1,
0.5810116, 1.383879, 1.18226, 1, 1, 1, 1, 1,
0.5849085, 1.550038, -1.285731, 1, 1, 1, 1, 1,
0.5869933, 0.1041799, 1.253016, 1, 1, 1, 1, 1,
0.5930531, -2.164652, 3.114876, 1, 1, 1, 1, 1,
0.6015437, 0.7168716, 0.4799428, 1, 1, 1, 1, 1,
0.602201, -1.195269, 2.016658, 1, 1, 1, 1, 1,
0.6076064, -0.5696842, 2.406327, 1, 1, 1, 1, 1,
0.6102604, -1.146548, 1.178708, 1, 1, 1, 1, 1,
0.6162786, 0.7644664, 0.9115417, 1, 1, 1, 1, 1,
0.6216086, 0.1748066, 2.404832, 1, 1, 1, 1, 1,
0.6219676, 0.4654829, 0.3300775, 1, 1, 1, 1, 1,
0.6226794, 0.1324927, 0.9403534, 1, 1, 1, 1, 1,
0.6250191, 0.776866, 1.472535, 1, 1, 1, 1, 1,
0.6251481, 1.95548, -0.2232608, 0, 0, 1, 1, 1,
0.6265385, 1.281141, -0.4770328, 1, 0, 0, 1, 1,
0.6320616, 1.035877, 0.7694046, 1, 0, 0, 1, 1,
0.6328818, 0.3903538, 0.6870447, 1, 0, 0, 1, 1,
0.6337332, -0.7031453, 2.407327, 1, 0, 0, 1, 1,
0.6353961, 0.6735162, 1.018757, 1, 0, 0, 1, 1,
0.63609, 0.004951149, 1.076183, 0, 0, 0, 1, 1,
0.6419149, -0.6258543, 1.440668, 0, 0, 0, 1, 1,
0.6465104, 2.388587, -0.4641451, 0, 0, 0, 1, 1,
0.6489425, 0.03512824, 1.927182, 0, 0, 0, 1, 1,
0.6507645, -1.133334, 4.808561, 0, 0, 0, 1, 1,
0.6508434, -0.6192623, 0.01056217, 0, 0, 0, 1, 1,
0.6524461, 0.4624758, 1.533902, 0, 0, 0, 1, 1,
0.6577523, 1.009767, 1.78345, 1, 1, 1, 1, 1,
0.6588851, -0.1678376, 2.264853, 1, 1, 1, 1, 1,
0.6596531, 0.8520316, 1.392357, 1, 1, 1, 1, 1,
0.6608976, -0.3589196, 1.217722, 1, 1, 1, 1, 1,
0.6649879, 0.4053358, 1.446895, 1, 1, 1, 1, 1,
0.6779902, 0.08105714, 2.346432, 1, 1, 1, 1, 1,
0.6805207, -0.9387396, 2.76313, 1, 1, 1, 1, 1,
0.681367, 0.3922639, 1.345603, 1, 1, 1, 1, 1,
0.6883417, 0.6038079, 0.9018788, 1, 1, 1, 1, 1,
0.6942656, 0.2804886, 3.053276, 1, 1, 1, 1, 1,
0.694935, 1.035295, 0.04138822, 1, 1, 1, 1, 1,
0.6962196, 1.00217, 0.9168856, 1, 1, 1, 1, 1,
0.7041922, 0.1214203, 2.137689, 1, 1, 1, 1, 1,
0.7046104, -1.140126, 3.40404, 1, 1, 1, 1, 1,
0.7049498, 0.3225244, 0.830397, 1, 1, 1, 1, 1,
0.7054141, -0.3034061, 0.9833395, 0, 0, 1, 1, 1,
0.7107925, -1.345936, 1.655782, 1, 0, 0, 1, 1,
0.7126764, 0.2931994, 0.7812449, 1, 0, 0, 1, 1,
0.7190143, -2.276713, 2.137693, 1, 0, 0, 1, 1,
0.7198153, -0.1841388, 2.265796, 1, 0, 0, 1, 1,
0.7203792, -0.1479698, 1.213939, 1, 0, 0, 1, 1,
0.723817, -0.5870197, 1.634858, 0, 0, 0, 1, 1,
0.7316646, 1.067043, 1.062706, 0, 0, 0, 1, 1,
0.7335123, -1.527675, 3.908808, 0, 0, 0, 1, 1,
0.7499608, -0.2680318, 1.297631, 0, 0, 0, 1, 1,
0.7503448, -0.4323304, 1.22014, 0, 0, 0, 1, 1,
0.7536778, 0.7114187, 1.554153, 0, 0, 0, 1, 1,
0.7554683, 0.5921797, -0.4050534, 0, 0, 0, 1, 1,
0.7576217, 2.256852, 0.2579574, 1, 1, 1, 1, 1,
0.7581007, -0.9905148, 2.859788, 1, 1, 1, 1, 1,
0.7609707, 2.746539, 0.305656, 1, 1, 1, 1, 1,
0.7631727, -0.1066662, 1.199834, 1, 1, 1, 1, 1,
0.7641454, -0.3092272, 2.05906, 1, 1, 1, 1, 1,
0.7667866, -0.3932604, 2.292005, 1, 1, 1, 1, 1,
0.768815, -1.41654, 2.836379, 1, 1, 1, 1, 1,
0.775044, 0.8666452, 0.6865428, 1, 1, 1, 1, 1,
0.7789544, 1.992809, 1.289829, 1, 1, 1, 1, 1,
0.7858238, 0.5172874, 1.483464, 1, 1, 1, 1, 1,
0.7865669, 0.2706401, 1.035335, 1, 1, 1, 1, 1,
0.7913982, -0.7702307, 0.3637666, 1, 1, 1, 1, 1,
0.8204038, 2.127949, 0.04984338, 1, 1, 1, 1, 1,
0.8234349, -0.293296, 2.433997, 1, 1, 1, 1, 1,
0.8389336, -0.7304649, 3.914731, 1, 1, 1, 1, 1,
0.8396512, -0.1438513, 1.546877, 0, 0, 1, 1, 1,
0.8399631, -0.4778005, 2.429879, 1, 0, 0, 1, 1,
0.8399904, 2.609566, -0.1187383, 1, 0, 0, 1, 1,
0.8462161, 0.6175088, 1.083255, 1, 0, 0, 1, 1,
0.8486696, 0.7140213, 2.409744, 1, 0, 0, 1, 1,
0.8615862, -0.7854702, 1.15432, 1, 0, 0, 1, 1,
0.8624899, -2.132465, 2.592463, 0, 0, 0, 1, 1,
0.8641738, 0.9098716, 0.4277511, 0, 0, 0, 1, 1,
0.8700294, -1.486973, 2.140304, 0, 0, 0, 1, 1,
0.8798621, -0.6841465, 2.124666, 0, 0, 0, 1, 1,
0.8823903, 2.580585, -0.6539587, 0, 0, 0, 1, 1,
0.8855353, 0.3875274, 1.263323, 0, 0, 0, 1, 1,
0.8866197, -1.141098, 3.045732, 0, 0, 0, 1, 1,
0.8912306, -0.3272407, 3.637322, 1, 1, 1, 1, 1,
0.8914479, -1.387163, 2.626836, 1, 1, 1, 1, 1,
0.8918794, -0.0877794, 0.4114165, 1, 1, 1, 1, 1,
0.8931347, 0.05397001, 0.823038, 1, 1, 1, 1, 1,
0.8954607, -0.1254653, 0.5958546, 1, 1, 1, 1, 1,
0.8954769, -1.002319, 2.281905, 1, 1, 1, 1, 1,
0.8983013, -0.1328124, 1.630487, 1, 1, 1, 1, 1,
0.9031788, 0.6912532, -0.6527821, 1, 1, 1, 1, 1,
0.9058989, 0.7771041, -0.3492531, 1, 1, 1, 1, 1,
0.9062046, 0.06116423, 2.651884, 1, 1, 1, 1, 1,
0.9098031, -1.293801, 1.210719, 1, 1, 1, 1, 1,
0.910158, -0.3361319, 1.415326, 1, 1, 1, 1, 1,
0.9104197, 1.179051, 0.3204938, 1, 1, 1, 1, 1,
0.9120076, -0.1314439, 0.6750776, 1, 1, 1, 1, 1,
0.9120667, 0.4236388, 3.02457, 1, 1, 1, 1, 1,
0.9149301, -0.1405476, 2.212644, 0, 0, 1, 1, 1,
0.9162844, 0.1607003, 3.020693, 1, 0, 0, 1, 1,
0.920908, -0.9056486, 2.407019, 1, 0, 0, 1, 1,
0.9248452, -0.5806596, 0.6170243, 1, 0, 0, 1, 1,
0.9302848, 1.04923, 1.053896, 1, 0, 0, 1, 1,
0.9324527, 0.7568532, 1.348472, 1, 0, 0, 1, 1,
0.9365547, -2.160328, 3.58003, 0, 0, 0, 1, 1,
0.9399637, -2.159343, 3.923782, 0, 0, 0, 1, 1,
0.9406772, 0.9979724, 1.605083, 0, 0, 0, 1, 1,
0.9456931, 1.327803, 1.439795, 0, 0, 0, 1, 1,
0.9466048, 0.6385956, 2.098551, 0, 0, 0, 1, 1,
0.9474323, 1.095908, 2.293121, 0, 0, 0, 1, 1,
0.9475662, 0.1972907, 0.9556106, 0, 0, 0, 1, 1,
0.9549943, 0.1360781, 0.2724791, 1, 1, 1, 1, 1,
0.9584318, 0.000830228, 1.259778, 1, 1, 1, 1, 1,
0.9629703, 0.2773532, 2.647416, 1, 1, 1, 1, 1,
0.9658042, 0.4436704, 1.632685, 1, 1, 1, 1, 1,
0.9786627, 0.6127895, 3.537357, 1, 1, 1, 1, 1,
0.9882969, 0.9026909, 1.025546, 1, 1, 1, 1, 1,
0.9974842, -0.5540482, 0.6656366, 1, 1, 1, 1, 1,
1.001173, -0.01496311, 1.253223, 1, 1, 1, 1, 1,
1.007252, 0.7021214, 2.205131, 1, 1, 1, 1, 1,
1.010951, 0.1183499, -0.2669207, 1, 1, 1, 1, 1,
1.018116, -0.9769092, 1.567391, 1, 1, 1, 1, 1,
1.02619, -1.004996, 2.864199, 1, 1, 1, 1, 1,
1.030188, -0.8419102, 1.254843, 1, 1, 1, 1, 1,
1.030846, -1.366444, 2.471339, 1, 1, 1, 1, 1,
1.033771, 1.50334, 2.752175, 1, 1, 1, 1, 1,
1.03994, 0.7257887, 0.2017719, 0, 0, 1, 1, 1,
1.040655, -0.3773451, 1.628653, 1, 0, 0, 1, 1,
1.045234, 0.1603232, 0.00406228, 1, 0, 0, 1, 1,
1.047337, 0.7362264, 0.2909851, 1, 0, 0, 1, 1,
1.048051, -0.4378581, 3.71963, 1, 0, 0, 1, 1,
1.051321, 0.5011371, 1.450689, 1, 0, 0, 1, 1,
1.059679, 1.340475, -1.821383, 0, 0, 0, 1, 1,
1.06649, -0.6095632, 2.470125, 0, 0, 0, 1, 1,
1.067058, -1.591291, 0.6311691, 0, 0, 0, 1, 1,
1.07827, -0.4802235, 3.327225, 0, 0, 0, 1, 1,
1.081854, -1.462465, 4.778989, 0, 0, 0, 1, 1,
1.082877, 0.6112995, 0.1931551, 0, 0, 0, 1, 1,
1.083007, -1.209968, 1.585591, 0, 0, 0, 1, 1,
1.086261, 2.111635, 0.361224, 1, 1, 1, 1, 1,
1.089699, 0.7545004, 1.521991, 1, 1, 1, 1, 1,
1.092307, 0.3113863, 0.6560991, 1, 1, 1, 1, 1,
1.10286, -0.6647301, 2.383787, 1, 1, 1, 1, 1,
1.110419, 0.6765388, 0.9265195, 1, 1, 1, 1, 1,
1.119877, -0.3205535, 3.863896, 1, 1, 1, 1, 1,
1.127094, 0.9895158, 0.01555576, 1, 1, 1, 1, 1,
1.130143, -0.7237422, 3.267927, 1, 1, 1, 1, 1,
1.140748, -1.120252, 2.35651, 1, 1, 1, 1, 1,
1.159705, -0.2453075, 1.99376, 1, 1, 1, 1, 1,
1.16111, -0.8038883, 2.490934, 1, 1, 1, 1, 1,
1.172003, -1.500407, 3.590066, 1, 1, 1, 1, 1,
1.184625, -0.8014383, 1.713735, 1, 1, 1, 1, 1,
1.18767, -1.760894, 2.132129, 1, 1, 1, 1, 1,
1.218621, -1.249897, 3.786121, 1, 1, 1, 1, 1,
1.220176, -0.119361, 1.313463, 0, 0, 1, 1, 1,
1.238411, -1.547307, 4.836963, 1, 0, 0, 1, 1,
1.239706, 0.3164734, 1.821059, 1, 0, 0, 1, 1,
1.240768, -0.4089888, 0.8242389, 1, 0, 0, 1, 1,
1.2444, -0.760359, 0.5610443, 1, 0, 0, 1, 1,
1.252315, 0.2857415, 0.2273512, 1, 0, 0, 1, 1,
1.25692, 0.3722753, 1.086796, 0, 0, 0, 1, 1,
1.265818, -1.292497, 2.114498, 0, 0, 0, 1, 1,
1.267142, 0.8182516, -1.14076, 0, 0, 0, 1, 1,
1.267409, 0.04681678, 2.670421, 0, 0, 0, 1, 1,
1.278971, -0.03927444, 3.062869, 0, 0, 0, 1, 1,
1.289425, 0.3061945, 1.319572, 0, 0, 0, 1, 1,
1.292963, 1.905789, 0.884522, 0, 0, 0, 1, 1,
1.293212, -0.2457245, 2.159469, 1, 1, 1, 1, 1,
1.294484, -1.523519, 1.611179, 1, 1, 1, 1, 1,
1.297835, -0.06264526, 2.108372, 1, 1, 1, 1, 1,
1.310211, 0.2242339, 2.333794, 1, 1, 1, 1, 1,
1.328264, -0.353293, 3.11451, 1, 1, 1, 1, 1,
1.330761, 1.376402, 1.368882, 1, 1, 1, 1, 1,
1.336375, 0.2622136, 1.893914, 1, 1, 1, 1, 1,
1.345991, 0.3775388, 1.326492, 1, 1, 1, 1, 1,
1.347567, -0.6918409, 1.335519, 1, 1, 1, 1, 1,
1.353963, -1.72328, 2.362622, 1, 1, 1, 1, 1,
1.379747, -0.4738609, 2.712363, 1, 1, 1, 1, 1,
1.387281, 0.2369252, 2.712438, 1, 1, 1, 1, 1,
1.396628, 1.620346, 0.05046814, 1, 1, 1, 1, 1,
1.403593, 0.6152779, 1.755396, 1, 1, 1, 1, 1,
1.410247, -0.1137721, 1.677419, 1, 1, 1, 1, 1,
1.412076, 1.464972, 0.8158319, 0, 0, 1, 1, 1,
1.414908, 0.6146901, 1.685509, 1, 0, 0, 1, 1,
1.420727, -1.256616, 1.439111, 1, 0, 0, 1, 1,
1.424132, 0.2996856, 1.300292, 1, 0, 0, 1, 1,
1.426798, -2.409772, 4.423212, 1, 0, 0, 1, 1,
1.432672, -0.5151121, 1.455455, 1, 0, 0, 1, 1,
1.43566, 0.1954789, 2.504344, 0, 0, 0, 1, 1,
1.449084, -0.782336, 1.993906, 0, 0, 0, 1, 1,
1.451196, 1.28037, -0.9018087, 0, 0, 0, 1, 1,
1.453666, -0.7442088, 1.677174, 0, 0, 0, 1, 1,
1.458245, -1.829996, 3.741054, 0, 0, 0, 1, 1,
1.459339, 0.1006906, 1.181697, 0, 0, 0, 1, 1,
1.45954, 0.2519151, 0.7747201, 0, 0, 0, 1, 1,
1.459587, -0.4287773, 1.306535, 1, 1, 1, 1, 1,
1.46576, 0.5000287, 1.964924, 1, 1, 1, 1, 1,
1.469168, 1.802826, 0.9708116, 1, 1, 1, 1, 1,
1.481147, 0.8539584, 0.2019599, 1, 1, 1, 1, 1,
1.490642, 0.05781087, 1.204701, 1, 1, 1, 1, 1,
1.497621, 1.436777, 1.014393, 1, 1, 1, 1, 1,
1.514395, -0.266021, 1.693544, 1, 1, 1, 1, 1,
1.51557, 0.0447023, 1.452399, 1, 1, 1, 1, 1,
1.541808, 0.2856817, 0.09194336, 1, 1, 1, 1, 1,
1.545718, -0.817955, 2.084104, 1, 1, 1, 1, 1,
1.551019, 0.09636351, 1.990041, 1, 1, 1, 1, 1,
1.552205, -1.111897, -0.3236077, 1, 1, 1, 1, 1,
1.572976, -0.3889371, -0.09848103, 1, 1, 1, 1, 1,
1.573774, 0.2004606, 1.516273, 1, 1, 1, 1, 1,
1.58739, 0.5553402, 2.212796, 1, 1, 1, 1, 1,
1.626763, 0.6104293, 1.360178, 0, 0, 1, 1, 1,
1.627257, 0.4643863, 1.577498, 1, 0, 0, 1, 1,
1.6789, -0.4987706, 2.511157, 1, 0, 0, 1, 1,
1.684737, 0.4765006, 0.5783335, 1, 0, 0, 1, 1,
1.691741, -1.20553, 2.585526, 1, 0, 0, 1, 1,
1.695515, -1.781307, 3.825244, 1, 0, 0, 1, 1,
1.699865, 0.647541, 1.939048, 0, 0, 0, 1, 1,
1.711349, 1.938468, 1.323006, 0, 0, 0, 1, 1,
1.714474, -0.3811787, 1.356904, 0, 0, 0, 1, 1,
1.722179, 1.287259, 1.656067, 0, 0, 0, 1, 1,
1.725077, -0.6624002, -0.9427327, 0, 0, 0, 1, 1,
1.730759, 0.2275888, 1.322404, 0, 0, 0, 1, 1,
1.733349, -0.2207157, 1.643379, 0, 0, 0, 1, 1,
1.746058, -1.15179, 2.547175, 1, 1, 1, 1, 1,
1.753661, -0.9567887, 1.398751, 1, 1, 1, 1, 1,
1.756676, 2.038405, 2.024365, 1, 1, 1, 1, 1,
1.765674, 0.3080167, 3.022884, 1, 1, 1, 1, 1,
1.802154, 1.747396, 1.880619, 1, 1, 1, 1, 1,
1.823542, 0.1422561, 1.267302, 1, 1, 1, 1, 1,
1.833983, -0.2271117, 0.02168396, 1, 1, 1, 1, 1,
1.842672, 1.116528, 0.9612131, 1, 1, 1, 1, 1,
1.847049, -1.138869, 3.979093, 1, 1, 1, 1, 1,
1.860182, -0.9456028, 1.786152, 1, 1, 1, 1, 1,
1.868043, -0.2070644, 2.566695, 1, 1, 1, 1, 1,
1.875529, -0.1834984, 2.917887, 1, 1, 1, 1, 1,
1.885253, -1.048358, 1.959686, 1, 1, 1, 1, 1,
1.88751, -0.2611644, -0.01225144, 1, 1, 1, 1, 1,
1.894778, -1.048957, -0.535263, 1, 1, 1, 1, 1,
1.954332, 0.7045422, 1.983238, 0, 0, 1, 1, 1,
1.971871, -0.3505043, 1.421664, 1, 0, 0, 1, 1,
1.983226, 0.5457643, 1.304332, 1, 0, 0, 1, 1,
1.994953, 0.7418651, 0.3015941, 1, 0, 0, 1, 1,
2.041636, 0.8012565, 1.072377, 1, 0, 0, 1, 1,
2.15403, -2.760366, 2.185699, 1, 0, 0, 1, 1,
2.173185, -0.1790138, 0.598784, 0, 0, 0, 1, 1,
2.208205, 0.4605589, 2.854486, 0, 0, 0, 1, 1,
2.313264, -1.378029, 1.464558, 0, 0, 0, 1, 1,
2.337794, -2.724379, 2.554141, 0, 0, 0, 1, 1,
2.338968, -1.269732, 2.295475, 0, 0, 0, 1, 1,
2.365041, 0.05329141, 0.3560116, 0, 0, 0, 1, 1,
2.376278, -1.116735, 1.752036, 0, 0, 0, 1, 1,
2.524194, 1.485773, 2.340037, 1, 1, 1, 1, 1,
2.527455, -0.3429278, 2.42536, 1, 1, 1, 1, 1,
2.614621, -0.8836908, 2.328372, 1, 1, 1, 1, 1,
2.620406, -1.377408, 0.4360112, 1, 1, 1, 1, 1,
2.984934, -0.4149315, 0.7947674, 1, 1, 1, 1, 1,
3.019132, 0.3444958, 4.534583, 1, 1, 1, 1, 1,
3.827734, -0.458343, 1.925555, 1, 1, 1, 1, 1
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
var radius = 9.97597;
var distance = 35.04017;
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
mvMatrix.translate( -0.3956826, -0.4676329, -0.6473157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.04017);
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
