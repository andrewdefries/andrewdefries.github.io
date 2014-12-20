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
-3.504039, 0.02247601, -2.936555, 1, 0, 0, 1,
-3.185688, -0.2362005, -1.749405, 1, 0.007843138, 0, 1,
-2.87729, 0.05327643, -0.8081501, 1, 0.01176471, 0, 1,
-2.872848, 0.4266836, -1.674841, 1, 0.01960784, 0, 1,
-2.800961, 2.775337, -0.798835, 1, 0.02352941, 0, 1,
-2.721091, -1.097304, -1.133349, 1, 0.03137255, 0, 1,
-2.637904, -0.6654438, -3.12215, 1, 0.03529412, 0, 1,
-2.604109, -0.9260978, -2.482874, 1, 0.04313726, 0, 1,
-2.538388, -0.9467443, -1.359608, 1, 0.04705882, 0, 1,
-2.525266, -0.9289717, -2.725919, 1, 0.05490196, 0, 1,
-2.462523, 1.496929, -1.753057, 1, 0.05882353, 0, 1,
-2.44581, -1.60234, -2.980987, 1, 0.06666667, 0, 1,
-2.334005, 1.010402, -1.405032, 1, 0.07058824, 0, 1,
-2.301251, 0.8998989, -0.7171198, 1, 0.07843138, 0, 1,
-2.273266, 0.0002616615, -1.435809, 1, 0.08235294, 0, 1,
-2.228106, 0.3285286, -1.629237, 1, 0.09019608, 0, 1,
-2.177382, -0.3019197, -1.753569, 1, 0.09411765, 0, 1,
-2.162615, -0.2610192, -0.7874247, 1, 0.1019608, 0, 1,
-2.047951, -0.7146116, -0.8707829, 1, 0.1098039, 0, 1,
-2.04745, -0.003061083, -1.441169, 1, 0.1137255, 0, 1,
-2.029209, -1.337275, -2.590364, 1, 0.1215686, 0, 1,
-1.996988, 0.976522, -2.033682, 1, 0.1254902, 0, 1,
-1.982848, 0.2975455, -2.75074, 1, 0.1333333, 0, 1,
-1.951402, 1.000909, -2.014154, 1, 0.1372549, 0, 1,
-1.930089, -0.7107255, -1.194787, 1, 0.145098, 0, 1,
-1.91344, 1.814564, -1.855716, 1, 0.1490196, 0, 1,
-1.878842, 0.1547263, -2.328084, 1, 0.1568628, 0, 1,
-1.856474, -1.112485, -2.739688, 1, 0.1607843, 0, 1,
-1.836895, -0.1410289, -1.878944, 1, 0.1686275, 0, 1,
-1.82048, 1.616646, 0.07906534, 1, 0.172549, 0, 1,
-1.820122, 0.2837312, -1.66211, 1, 0.1803922, 0, 1,
-1.817421, 1.844872, -2.021385, 1, 0.1843137, 0, 1,
-1.806184, -0.5150374, -1.538421, 1, 0.1921569, 0, 1,
-1.800762, 0.6039762, -1.620737, 1, 0.1960784, 0, 1,
-1.792422, 0.1636523, -1.621732, 1, 0.2039216, 0, 1,
-1.787004, -0.2652998, -1.608003, 1, 0.2117647, 0, 1,
-1.786307, 0.3501381, -0.7289405, 1, 0.2156863, 0, 1,
-1.766343, -0.3708132, -1.788629, 1, 0.2235294, 0, 1,
-1.75298, 1.417071, -0.8673351, 1, 0.227451, 0, 1,
-1.750993, 0.6770198, -0.7300917, 1, 0.2352941, 0, 1,
-1.745612, -0.3503865, -1.630666, 1, 0.2392157, 0, 1,
-1.723449, 0.3724767, 0.7958583, 1, 0.2470588, 0, 1,
-1.721996, 0.6019584, -2.091895, 1, 0.2509804, 0, 1,
-1.696805, -0.8414033, -3.427088, 1, 0.2588235, 0, 1,
-1.695114, 0.3251736, 0.7212622, 1, 0.2627451, 0, 1,
-1.686204, 0.6692451, -0.2563035, 1, 0.2705882, 0, 1,
-1.684309, -0.9500189, -1.747865, 1, 0.2745098, 0, 1,
-1.680374, 0.2497446, -1.306721, 1, 0.282353, 0, 1,
-1.660727, -1.266396, -1.780284, 1, 0.2862745, 0, 1,
-1.645179, -1.317119, -1.245891, 1, 0.2941177, 0, 1,
-1.640601, 1.362719, -1.470422, 1, 0.3019608, 0, 1,
-1.640293, 0.9291689, 0.1370471, 1, 0.3058824, 0, 1,
-1.626927, -1.151959, -2.780408, 1, 0.3137255, 0, 1,
-1.596128, 1.214023, -0.3437946, 1, 0.3176471, 0, 1,
-1.595691, 1.392963, -0.4979488, 1, 0.3254902, 0, 1,
-1.582559, -0.1489579, -1.820528, 1, 0.3294118, 0, 1,
-1.560157, 1.068276, -0.4868546, 1, 0.3372549, 0, 1,
-1.559471, -0.2986809, -0.9863633, 1, 0.3411765, 0, 1,
-1.55769, 0.0766366, -0.6746584, 1, 0.3490196, 0, 1,
-1.555164, -0.2438097, -2.390955, 1, 0.3529412, 0, 1,
-1.552597, -0.1028432, -0.7753198, 1, 0.3607843, 0, 1,
-1.546147, 1.121816, -0.6658415, 1, 0.3647059, 0, 1,
-1.539602, 0.7696277, -0.7304391, 1, 0.372549, 0, 1,
-1.529353, -1.006231, -1.329701, 1, 0.3764706, 0, 1,
-1.518823, -0.1832706, -2.056105, 1, 0.3843137, 0, 1,
-1.508019, -0.2704542, -2.884899, 1, 0.3882353, 0, 1,
-1.49041, -1.714064, -1.940171, 1, 0.3960784, 0, 1,
-1.490317, -0.2437639, -0.4144455, 1, 0.4039216, 0, 1,
-1.474278, 0.1960887, -1.207297, 1, 0.4078431, 0, 1,
-1.474228, 0.1884523, -2.393766, 1, 0.4156863, 0, 1,
-1.459302, 1.283516, -2.103623, 1, 0.4196078, 0, 1,
-1.452133, -0.6801516, -1.61243, 1, 0.427451, 0, 1,
-1.450451, 0.6911337, -2.45604, 1, 0.4313726, 0, 1,
-1.445638, -0.204496, -1.064221, 1, 0.4392157, 0, 1,
-1.422855, 1.974433, -2.622012, 1, 0.4431373, 0, 1,
-1.420736, -0.3877153, -2.703521, 1, 0.4509804, 0, 1,
-1.41576, 0.8887434, -1.982859, 1, 0.454902, 0, 1,
-1.410456, -0.5981169, -0.7813874, 1, 0.4627451, 0, 1,
-1.403086, -0.1598055, -3.793922, 1, 0.4666667, 0, 1,
-1.402509, 1.836971, -1.287664, 1, 0.4745098, 0, 1,
-1.402413, 1.88309, -1.137643, 1, 0.4784314, 0, 1,
-1.392272, -0.02855333, -1.629472, 1, 0.4862745, 0, 1,
-1.384032, -0.2558533, -1.413337, 1, 0.4901961, 0, 1,
-1.383156, 0.8580894, -0.1489207, 1, 0.4980392, 0, 1,
-1.380114, -2.146052, -2.479287, 1, 0.5058824, 0, 1,
-1.372643, 0.18007, -1.580585, 1, 0.509804, 0, 1,
-1.362709, 0.09316237, -1.5348, 1, 0.5176471, 0, 1,
-1.362164, 0.5519701, -1.38511, 1, 0.5215687, 0, 1,
-1.355432, 0.3082035, -1.655853, 1, 0.5294118, 0, 1,
-1.353707, 1.123541, 0.3546076, 1, 0.5333334, 0, 1,
-1.35016, -0.6622638, -1.600852, 1, 0.5411765, 0, 1,
-1.347639, -1.032805, -1.33362, 1, 0.5450981, 0, 1,
-1.34574, 0.5411224, -1.484339, 1, 0.5529412, 0, 1,
-1.34262, 0.1237801, -0.8730293, 1, 0.5568628, 0, 1,
-1.339018, -1.167538, -1.094958, 1, 0.5647059, 0, 1,
-1.334742, -0.3470045, -0.7389774, 1, 0.5686275, 0, 1,
-1.311921, 0.2670965, -1.596864, 1, 0.5764706, 0, 1,
-1.297633, -0.1632411, -0.02108303, 1, 0.5803922, 0, 1,
-1.289971, -0.4280041, -1.868299, 1, 0.5882353, 0, 1,
-1.288034, -1.174182, -1.396245, 1, 0.5921569, 0, 1,
-1.284221, 1.5172, 0.1597877, 1, 0.6, 0, 1,
-1.281456, -1.67992, -3.75027, 1, 0.6078432, 0, 1,
-1.275128, -0.3308659, -3.146522, 1, 0.6117647, 0, 1,
-1.272845, -0.2971444, -0.1258849, 1, 0.6196079, 0, 1,
-1.266713, 0.03980653, 1.05441, 1, 0.6235294, 0, 1,
-1.265297, 0.5355548, -1.897136, 1, 0.6313726, 0, 1,
-1.26387, -0.5156252, -3.032291, 1, 0.6352941, 0, 1,
-1.256859, -1.536746, -2.650348, 1, 0.6431373, 0, 1,
-1.252865, 0.006087795, -0.9168182, 1, 0.6470588, 0, 1,
-1.238213, -0.6372163, -1.570481, 1, 0.654902, 0, 1,
-1.237223, 0.5576535, -0.6332319, 1, 0.6588235, 0, 1,
-1.236703, 0.3064889, -1.570144, 1, 0.6666667, 0, 1,
-1.233837, 0.4999352, -1.021801, 1, 0.6705883, 0, 1,
-1.230773, -0.327129, -1.694761, 1, 0.6784314, 0, 1,
-1.229941, 1.161223, -1.854563, 1, 0.682353, 0, 1,
-1.217006, 2.216427, -0.7807275, 1, 0.6901961, 0, 1,
-1.215265, -1.900464, -1.27865, 1, 0.6941177, 0, 1,
-1.215211, 0.2321759, -1.270913, 1, 0.7019608, 0, 1,
-1.206654, 0.7942933, -1.101352, 1, 0.7098039, 0, 1,
-1.198694, 0.3890677, -1.97958, 1, 0.7137255, 0, 1,
-1.198468, 0.2751394, -1.732361, 1, 0.7215686, 0, 1,
-1.19673, 0.8450279, 0.3161743, 1, 0.7254902, 0, 1,
-1.194116, 3.134656, 0.519096, 1, 0.7333333, 0, 1,
-1.187723, -0.3269953, -1.825679, 1, 0.7372549, 0, 1,
-1.184968, -0.05990425, -1.250743, 1, 0.7450981, 0, 1,
-1.179878, -0.6629849, -3.157794, 1, 0.7490196, 0, 1,
-1.17439, -1.313224, -1.914458, 1, 0.7568628, 0, 1,
-1.166075, 0.707391, 0.9890829, 1, 0.7607843, 0, 1,
-1.153845, -0.5484983, -2.962912, 1, 0.7686275, 0, 1,
-1.148478, -0.6922275, -3.331411, 1, 0.772549, 0, 1,
-1.143, -0.4800129, -1.369317, 1, 0.7803922, 0, 1,
-1.140275, 0.9218168, -1.840084, 1, 0.7843137, 0, 1,
-1.137585, -1.287631, -2.285875, 1, 0.7921569, 0, 1,
-1.137072, 0.08225798, -1.630725, 1, 0.7960784, 0, 1,
-1.131809, -2.060064, -2.593647, 1, 0.8039216, 0, 1,
-1.124205, -1.111712, -1.906838, 1, 0.8117647, 0, 1,
-1.119367, 1.433858, -0.1754398, 1, 0.8156863, 0, 1,
-1.115275, 3.003565, 0.6068696, 1, 0.8235294, 0, 1,
-1.113868, 0.7297518, -1.040163, 1, 0.827451, 0, 1,
-1.111543, 1.925192, -0.05253312, 1, 0.8352941, 0, 1,
-1.11041, -0.6949508, -3.726064, 1, 0.8392157, 0, 1,
-1.09908, -0.01038363, 0.6195487, 1, 0.8470588, 0, 1,
-1.090425, 0.8234751, -0.5015352, 1, 0.8509804, 0, 1,
-1.087804, -0.1980046, -2.179125, 1, 0.8588235, 0, 1,
-1.07965, -0.1809078, -0.8415418, 1, 0.8627451, 0, 1,
-1.063443, 1.537041, 0.1083715, 1, 0.8705882, 0, 1,
-1.061583, 0.2398845, -1.20332, 1, 0.8745098, 0, 1,
-1.061581, 0.7569404, -0.2901851, 1, 0.8823529, 0, 1,
-1.05903, 0.8634116, -0.8940345, 1, 0.8862745, 0, 1,
-1.058515, -0.2426472, 0.4482099, 1, 0.8941177, 0, 1,
-1.056972, -0.7158497, -2.595293, 1, 0.8980392, 0, 1,
-1.052142, -1.462163, -2.621545, 1, 0.9058824, 0, 1,
-1.043611, -1.795441, -3.041208, 1, 0.9137255, 0, 1,
-1.040349, 0.0872432, -0.7800179, 1, 0.9176471, 0, 1,
-1.03716, 0.374353, -0.3698695, 1, 0.9254902, 0, 1,
-1.030378, 0.9813518, -1.499329, 1, 0.9294118, 0, 1,
-1.024728, 1.330016, 0.09262209, 1, 0.9372549, 0, 1,
-1.02351, -1.159165, -2.473849, 1, 0.9411765, 0, 1,
-1.023108, -0.3240283, -1.381432, 1, 0.9490196, 0, 1,
-1.016842, 0.9686201, 1.186371, 1, 0.9529412, 0, 1,
-1.014366, -0.2225051, -2.353559, 1, 0.9607843, 0, 1,
-1.011656, -1.722541, -2.461138, 1, 0.9647059, 0, 1,
-1.001156, -0.5218209, -1.548245, 1, 0.972549, 0, 1,
-0.999573, -0.4998764, -0.6540255, 1, 0.9764706, 0, 1,
-0.9946453, -0.7968441, -1.772988, 1, 0.9843137, 0, 1,
-0.9789731, -0.05819801, -2.114424, 1, 0.9882353, 0, 1,
-0.9786944, 0.2743061, -2.356366, 1, 0.9960784, 0, 1,
-0.9718145, 0.441587, -2.238281, 0.9960784, 1, 0, 1,
-0.9696994, 0.5489234, -1.217301, 0.9921569, 1, 0, 1,
-0.9578932, -1.250708, -1.726786, 0.9843137, 1, 0, 1,
-0.9574448, -0.7552981, -3.415091, 0.9803922, 1, 0, 1,
-0.9567512, -0.08469766, -1.085715, 0.972549, 1, 0, 1,
-0.9552557, -0.2972621, -2.305958, 0.9686275, 1, 0, 1,
-0.9536417, 1.431242, -1.323613, 0.9607843, 1, 0, 1,
-0.9534248, -0.1584622, -2.37429, 0.9568627, 1, 0, 1,
-0.9501957, -1.021091, 0.2680258, 0.9490196, 1, 0, 1,
-0.9485041, 0.1392222, -1.323045, 0.945098, 1, 0, 1,
-0.944686, -1.831632, -2.945202, 0.9372549, 1, 0, 1,
-0.943783, 0.8640685, 0.9838859, 0.9333333, 1, 0, 1,
-0.9377939, 0.9869624, -1.36394, 0.9254902, 1, 0, 1,
-0.9350086, 1.938946, -0.1582274, 0.9215686, 1, 0, 1,
-0.9341671, -1.247524, -1.32224, 0.9137255, 1, 0, 1,
-0.92992, -1.818548, -3.433365, 0.9098039, 1, 0, 1,
-0.9187117, -0.4073553, -2.422088, 0.9019608, 1, 0, 1,
-0.9183909, 0.09105559, -0.5448877, 0.8941177, 1, 0, 1,
-0.9137171, -1.850341, -1.756651, 0.8901961, 1, 0, 1,
-0.9121482, 0.04057895, -3.502133, 0.8823529, 1, 0, 1,
-0.910278, 0.1476966, -1.921799, 0.8784314, 1, 0, 1,
-0.9060095, 0.8589458, -1.903002, 0.8705882, 1, 0, 1,
-0.9017895, -0.5841717, -2.906956, 0.8666667, 1, 0, 1,
-0.8998035, -0.5409843, -2.325524, 0.8588235, 1, 0, 1,
-0.8918448, 0.2772821, -0.4601066, 0.854902, 1, 0, 1,
-0.8813913, -1.675967, -3.431392, 0.8470588, 1, 0, 1,
-0.8792337, 0.3123642, 0.1777856, 0.8431373, 1, 0, 1,
-0.8725907, 1.569427, 0.7153705, 0.8352941, 1, 0, 1,
-0.8707048, 0.9221067, -2.148203, 0.8313726, 1, 0, 1,
-0.8684546, -0.5038019, -1.990097, 0.8235294, 1, 0, 1,
-0.8623352, 1.657251, -1.079376, 0.8196079, 1, 0, 1,
-0.8584073, 0.7157362, -1.793239, 0.8117647, 1, 0, 1,
-0.8561049, -2.120608, -2.996569, 0.8078431, 1, 0, 1,
-0.8550372, 0.1358442, 0.9839302, 0.8, 1, 0, 1,
-0.851096, 0.4727429, -1.238057, 0.7921569, 1, 0, 1,
-0.8510079, 1.009063, -0.8083009, 0.7882353, 1, 0, 1,
-0.8476671, -0.0829677, -1.513475, 0.7803922, 1, 0, 1,
-0.8448833, -0.03139052, -0.6811632, 0.7764706, 1, 0, 1,
-0.842663, 1.216262, -1.305275, 0.7686275, 1, 0, 1,
-0.8361984, -0.2896784, -3.723257, 0.7647059, 1, 0, 1,
-0.8328239, 0.2334959, -1.526245, 0.7568628, 1, 0, 1,
-0.8230625, 0.6404688, -1.190393, 0.7529412, 1, 0, 1,
-0.8156931, 1.454386, -2.096624, 0.7450981, 1, 0, 1,
-0.8128245, 2.96295, 1.291782, 0.7411765, 1, 0, 1,
-0.8124999, -0.1584124, -3.744431, 0.7333333, 1, 0, 1,
-0.8091019, -2.553909, -2.369078, 0.7294118, 1, 0, 1,
-0.8068282, -0.351514, -0.8890001, 0.7215686, 1, 0, 1,
-0.8051401, 0.7395561, -2.780288, 0.7176471, 1, 0, 1,
-0.8045664, 2.030702, 0.9232918, 0.7098039, 1, 0, 1,
-0.8034083, 0.4092632, -0.8442708, 0.7058824, 1, 0, 1,
-0.7955408, -1.121139, -3.420755, 0.6980392, 1, 0, 1,
-0.794055, 0.06187019, -2.260612, 0.6901961, 1, 0, 1,
-0.7876229, 0.03730886, -1.276427, 0.6862745, 1, 0, 1,
-0.7860869, 0.6346979, -1.958479, 0.6784314, 1, 0, 1,
-0.7840056, -0.2785822, -1.775929, 0.6745098, 1, 0, 1,
-0.7784822, -1.482905, -3.719018, 0.6666667, 1, 0, 1,
-0.7778892, 0.07715902, -0.6573245, 0.6627451, 1, 0, 1,
-0.7769006, 0.2194023, -0.1037419, 0.654902, 1, 0, 1,
-0.775853, -0.2082102, -2.576922, 0.6509804, 1, 0, 1,
-0.7752538, -1.390284, -3.520226, 0.6431373, 1, 0, 1,
-0.7745507, 0.3725523, -0.7157675, 0.6392157, 1, 0, 1,
-0.7621734, -1.115256, -2.831371, 0.6313726, 1, 0, 1,
-0.7611136, -0.4837958, -1.309803, 0.627451, 1, 0, 1,
-0.7600738, -1.626352, -2.987051, 0.6196079, 1, 0, 1,
-0.7549955, 0.03107036, 0.04108692, 0.6156863, 1, 0, 1,
-0.7539473, -0.9056715, -1.283969, 0.6078432, 1, 0, 1,
-0.7531745, 1.347462, -1.250791, 0.6039216, 1, 0, 1,
-0.7529575, -2.230335, -3.504757, 0.5960785, 1, 0, 1,
-0.7489019, -1.064027, -3.332796, 0.5882353, 1, 0, 1,
-0.7479247, 1.207446, -1.679262, 0.5843138, 1, 0, 1,
-0.7440352, -0.07064772, -2.196201, 0.5764706, 1, 0, 1,
-0.7431054, 0.4076225, -2.624981, 0.572549, 1, 0, 1,
-0.7420202, -2.103825, -3.100501, 0.5647059, 1, 0, 1,
-0.7402477, -0.4834371, -0.6859111, 0.5607843, 1, 0, 1,
-0.7389891, -0.3060794, -2.813153, 0.5529412, 1, 0, 1,
-0.7383091, -0.8718942, -1.335498, 0.5490196, 1, 0, 1,
-0.7287351, 0.7596247, -2.528004, 0.5411765, 1, 0, 1,
-0.7249767, -0.3275304, -4.628726, 0.5372549, 1, 0, 1,
-0.7227877, -0.2047867, -1.919426, 0.5294118, 1, 0, 1,
-0.7154385, 0.6487496, 0.2141941, 0.5254902, 1, 0, 1,
-0.7132415, -1.196996, 0.3741351, 0.5176471, 1, 0, 1,
-0.7124336, 0.1511135, -3.693297, 0.5137255, 1, 0, 1,
-0.7023492, -0.2086327, -2.549301, 0.5058824, 1, 0, 1,
-0.6981304, -0.3829585, -3.386261, 0.5019608, 1, 0, 1,
-0.696068, -0.1487219, -1.984584, 0.4941176, 1, 0, 1,
-0.6946611, -0.116596, -2.727238, 0.4862745, 1, 0, 1,
-0.6910706, 2.398226, 0.180659, 0.4823529, 1, 0, 1,
-0.6874831, -1.693775, -3.041958, 0.4745098, 1, 0, 1,
-0.6851252, -2.414662, -2.823057, 0.4705882, 1, 0, 1,
-0.679465, 0.1404488, -1.238896, 0.4627451, 1, 0, 1,
-0.6780161, -1.426787, -3.953155, 0.4588235, 1, 0, 1,
-0.6749577, -1.191957, -3.595029, 0.4509804, 1, 0, 1,
-0.6656919, -1.000148, -1.697199, 0.4470588, 1, 0, 1,
-0.6632256, 0.6367465, 0.4531311, 0.4392157, 1, 0, 1,
-0.6624323, 0.9691113, -0.5985575, 0.4352941, 1, 0, 1,
-0.6623628, 1.650138, 0.2258439, 0.427451, 1, 0, 1,
-0.6610553, 2.23715, 1.041458, 0.4235294, 1, 0, 1,
-0.660551, -0.2630416, -1.115408, 0.4156863, 1, 0, 1,
-0.6603776, -1.440088, -3.254636, 0.4117647, 1, 0, 1,
-0.6595343, 0.9688432, -1.409634, 0.4039216, 1, 0, 1,
-0.65862, 0.9934586, -0.4984142, 0.3960784, 1, 0, 1,
-0.6508331, -2.294566, -1.017661, 0.3921569, 1, 0, 1,
-0.6489897, 0.006963347, -2.730137, 0.3843137, 1, 0, 1,
-0.6477711, 0.6601878, -1.178393, 0.3803922, 1, 0, 1,
-0.6438479, 0.2814544, -1.314984, 0.372549, 1, 0, 1,
-0.6434441, -0.3286388, -2.723428, 0.3686275, 1, 0, 1,
-0.6383057, 0.6281549, -1.520757, 0.3607843, 1, 0, 1,
-0.6336805, -1.394292, -1.98893, 0.3568628, 1, 0, 1,
-0.6296806, -1.204012, -3.898006, 0.3490196, 1, 0, 1,
-0.6261165, -0.2044004, -1.86316, 0.345098, 1, 0, 1,
-0.6259359, -0.8014618, -2.361708, 0.3372549, 1, 0, 1,
-0.6222754, 0.5685282, -1.446708, 0.3333333, 1, 0, 1,
-0.6212834, 0.9688189, 0.4335231, 0.3254902, 1, 0, 1,
-0.6175411, -0.216866, -3.518086, 0.3215686, 1, 0, 1,
-0.6084323, 1.050269, -0.2943474, 0.3137255, 1, 0, 1,
-0.6076621, -2.648115, -3.102761, 0.3098039, 1, 0, 1,
-0.6053165, 0.3611927, -1.711818, 0.3019608, 1, 0, 1,
-0.6024317, 0.629456, -0.01992805, 0.2941177, 1, 0, 1,
-0.601905, -1.368194, -3.958751, 0.2901961, 1, 0, 1,
-0.6012903, -1.633644, -2.831042, 0.282353, 1, 0, 1,
-0.6011035, 0.2053355, -0.5929847, 0.2784314, 1, 0, 1,
-0.5984964, -0.09702121, -0.2228912, 0.2705882, 1, 0, 1,
-0.5980699, -0.3716274, -1.682467, 0.2666667, 1, 0, 1,
-0.597919, 0.1777247, -1.487438, 0.2588235, 1, 0, 1,
-0.5957705, -1.974123, -0.8354312, 0.254902, 1, 0, 1,
-0.589597, 1.698082, -1.019015, 0.2470588, 1, 0, 1,
-0.5856814, 0.04072541, -2.110754, 0.2431373, 1, 0, 1,
-0.5847211, -0.1976299, -2.823388, 0.2352941, 1, 0, 1,
-0.5822122, 0.3160118, -1.840966, 0.2313726, 1, 0, 1,
-0.5816993, 1.41248, 1.176759, 0.2235294, 1, 0, 1,
-0.5798813, -0.2969747, -1.498085, 0.2196078, 1, 0, 1,
-0.5791473, -0.6312944, -2.014968, 0.2117647, 1, 0, 1,
-0.5721685, -1.170549, -2.239103, 0.2078431, 1, 0, 1,
-0.567935, 0.9793978, -0.7202159, 0.2, 1, 0, 1,
-0.567644, 0.401476, -1.969222, 0.1921569, 1, 0, 1,
-0.5584377, 0.9686023, -0.7215751, 0.1882353, 1, 0, 1,
-0.5548258, -0.6067371, -0.7211818, 0.1803922, 1, 0, 1,
-0.5547132, -0.1535594, -1.810423, 0.1764706, 1, 0, 1,
-0.5544409, -0.9230707, -1.589928, 0.1686275, 1, 0, 1,
-0.5542818, 0.5211102, -0.214933, 0.1647059, 1, 0, 1,
-0.5538304, 1.122824, 1.426002, 0.1568628, 1, 0, 1,
-0.5452572, -0.5490823, -2.44443, 0.1529412, 1, 0, 1,
-0.5439501, 0.7349156, -1.769065, 0.145098, 1, 0, 1,
-0.5376385, 0.9582317, 0.3578311, 0.1411765, 1, 0, 1,
-0.5348467, 1.546796, -0.8778999, 0.1333333, 1, 0, 1,
-0.5338141, -0.1401742, -1.821502, 0.1294118, 1, 0, 1,
-0.5315999, -1.587446, -1.739611, 0.1215686, 1, 0, 1,
-0.5276801, -0.6140184, -2.17207, 0.1176471, 1, 0, 1,
-0.526324, 1.782893, -0.1889872, 0.1098039, 1, 0, 1,
-0.5250375, -0.4658285, -1.613368, 0.1058824, 1, 0, 1,
-0.5206337, -1.410743, -2.420644, 0.09803922, 1, 0, 1,
-0.5132561, -0.9834146, -2.241088, 0.09019608, 1, 0, 1,
-0.5104876, -0.9662865, -1.696451, 0.08627451, 1, 0, 1,
-0.5092313, 0.3060293, -0.3528827, 0.07843138, 1, 0, 1,
-0.5078583, 0.270326, 0.06774311, 0.07450981, 1, 0, 1,
-0.5035731, 0.3048845, -2.242682, 0.06666667, 1, 0, 1,
-0.5018696, 0.4208614, -1.065391, 0.0627451, 1, 0, 1,
-0.4968107, 1.868226, -1.431641, 0.05490196, 1, 0, 1,
-0.4879954, 0.3148227, -2.311249, 0.05098039, 1, 0, 1,
-0.4851117, 0.673416, -0.6997969, 0.04313726, 1, 0, 1,
-0.4836507, 0.1833918, -1.916834, 0.03921569, 1, 0, 1,
-0.4827205, -0.7268097, -4.730532, 0.03137255, 1, 0, 1,
-0.4826217, 0.001971765, 0.4423724, 0.02745098, 1, 0, 1,
-0.4817144, 0.5388321, 0.3058152, 0.01960784, 1, 0, 1,
-0.4694259, 1.126298, 0.8275411, 0.01568628, 1, 0, 1,
-0.4673187, -1.043417, -2.386156, 0.007843138, 1, 0, 1,
-0.4639392, 0.5716743, -0.173167, 0.003921569, 1, 0, 1,
-0.4637055, -1.27801, -3.298262, 0, 1, 0.003921569, 1,
-0.4635659, 0.006606889, -0.6033118, 0, 1, 0.01176471, 1,
-0.4464355, -0.1946741, -1.818603, 0, 1, 0.01568628, 1,
-0.4454615, -0.04923234, -0.7336845, 0, 1, 0.02352941, 1,
-0.4451699, 0.6388633, -0.7207665, 0, 1, 0.02745098, 1,
-0.4449438, 0.005581883, -1.820961, 0, 1, 0.03529412, 1,
-0.4398007, 1.629718, 0.5530587, 0, 1, 0.03921569, 1,
-0.4366989, 0.4214592, -1.55265, 0, 1, 0.04705882, 1,
-0.4347053, 0.3651667, 1.224831, 0, 1, 0.05098039, 1,
-0.4257192, -0.3526658, -0.05445048, 0, 1, 0.05882353, 1,
-0.423102, 0.09383093, 0.08581237, 0, 1, 0.0627451, 1,
-0.4230739, 0.9799263, -0.2044466, 0, 1, 0.07058824, 1,
-0.4146839, -1.090926, -2.674529, 0, 1, 0.07450981, 1,
-0.4140906, 1.194868, -1.161754, 0, 1, 0.08235294, 1,
-0.4136558, 0.8347895, 0.2375808, 0, 1, 0.08627451, 1,
-0.413215, 0.5174818, -0.3128321, 0, 1, 0.09411765, 1,
-0.4122142, 1.222322, 0.0313747, 0, 1, 0.1019608, 1,
-0.4074124, 0.2928805, -0.7580853, 0, 1, 0.1058824, 1,
-0.3977754, -0.3123116, -2.301525, 0, 1, 0.1137255, 1,
-0.3974828, -0.1007937, -2.958196, 0, 1, 0.1176471, 1,
-0.38995, 1.360351, 0.5328344, 0, 1, 0.1254902, 1,
-0.389143, 1.190745, 0.2975336, 0, 1, 0.1294118, 1,
-0.3876712, 1.003769, 0.2295739, 0, 1, 0.1372549, 1,
-0.3853059, 1.652955, -0.09820128, 0, 1, 0.1411765, 1,
-0.3830964, 1.33849, -0.7720461, 0, 1, 0.1490196, 1,
-0.3795392, 1.081486, 0.0934466, 0, 1, 0.1529412, 1,
-0.3764305, 0.9105213, -0.9618193, 0, 1, 0.1607843, 1,
-0.3760436, 0.0145225, -1.216817, 0, 1, 0.1647059, 1,
-0.3756019, 1.201285, -1.221472, 0, 1, 0.172549, 1,
-0.3722818, -0.1851377, 0.1458323, 0, 1, 0.1764706, 1,
-0.372143, 0.9586294, -0.3825429, 0, 1, 0.1843137, 1,
-0.3719532, 0.123774, -1.189203, 0, 1, 0.1882353, 1,
-0.3689345, -1.731268, -4.190974, 0, 1, 0.1960784, 1,
-0.3653926, -0.812511, -3.381489, 0, 1, 0.2039216, 1,
-0.3640758, -1.187491, -1.843969, 0, 1, 0.2078431, 1,
-0.3599649, 1.355624, -0.8633685, 0, 1, 0.2156863, 1,
-0.3593361, 1.032005, -0.8254992, 0, 1, 0.2196078, 1,
-0.3528258, -0.4174899, 0.2520236, 0, 1, 0.227451, 1,
-0.3515729, -1.309512, -2.706117, 0, 1, 0.2313726, 1,
-0.3499193, 1.603864, 0.8045022, 0, 1, 0.2392157, 1,
-0.3496991, -0.02204357, -3.153757, 0, 1, 0.2431373, 1,
-0.3378394, -2.118021, -3.554741, 0, 1, 0.2509804, 1,
-0.3338584, -1.381227, -1.142991, 0, 1, 0.254902, 1,
-0.3260531, 1.061336, -2.026187, 0, 1, 0.2627451, 1,
-0.3259899, 0.1909677, -1.447107, 0, 1, 0.2666667, 1,
-0.3232475, -0.7272573, -3.511711, 0, 1, 0.2745098, 1,
-0.3224144, 0.01146523, -1.256243, 0, 1, 0.2784314, 1,
-0.3211754, -0.1104208, -0.6024165, 0, 1, 0.2862745, 1,
-0.3136407, 1.628949, -0.09832744, 0, 1, 0.2901961, 1,
-0.3131212, 1.05685, 1.64187, 0, 1, 0.2980392, 1,
-0.3124974, -0.9336365, -3.872435, 0, 1, 0.3058824, 1,
-0.31245, 1.819834, 1.843107, 0, 1, 0.3098039, 1,
-0.3119458, -0.7396003, -2.7443, 0, 1, 0.3176471, 1,
-0.3087997, -1.978065, -3.160854, 0, 1, 0.3215686, 1,
-0.3071955, 0.166101, 0.2051723, 0, 1, 0.3294118, 1,
-0.3071549, -0.03006145, -3.046442, 0, 1, 0.3333333, 1,
-0.3035524, -1.500861, -3.935084, 0, 1, 0.3411765, 1,
-0.3012008, 0.8470876, -0.7513271, 0, 1, 0.345098, 1,
-0.2980456, 0.599805, -0.6900598, 0, 1, 0.3529412, 1,
-0.2979416, -1.025131, -2.873889, 0, 1, 0.3568628, 1,
-0.2918657, -0.5124974, -3.078404, 0, 1, 0.3647059, 1,
-0.2906006, -0.09979542, -2.089737, 0, 1, 0.3686275, 1,
-0.2870663, -1.220601, -2.933881, 0, 1, 0.3764706, 1,
-0.2845294, -0.7493634, -2.977661, 0, 1, 0.3803922, 1,
-0.2840874, 0.243447, -0.8775269, 0, 1, 0.3882353, 1,
-0.2779797, -0.3897233, -3.625887, 0, 1, 0.3921569, 1,
-0.2727954, -0.170619, -2.439914, 0, 1, 0.4, 1,
-0.2719097, 0.02634164, -2.122437, 0, 1, 0.4078431, 1,
-0.2646584, -1.742727, -1.091883, 0, 1, 0.4117647, 1,
-0.2627852, 1.392573, -0.9250521, 0, 1, 0.4196078, 1,
-0.2626467, 0.1761221, -2.854054, 0, 1, 0.4235294, 1,
-0.2616055, -1.663241, -1.149768, 0, 1, 0.4313726, 1,
-0.2604553, -1.444293, -1.844931, 0, 1, 0.4352941, 1,
-0.2584657, 0.1899925, -0.7194505, 0, 1, 0.4431373, 1,
-0.2551882, 1.006398, -0.7046188, 0, 1, 0.4470588, 1,
-0.2481309, 0.5017448, -0.486389, 0, 1, 0.454902, 1,
-0.2477809, -1.963985, -4.657186, 0, 1, 0.4588235, 1,
-0.2469898, 0.1871309, -0.661464, 0, 1, 0.4666667, 1,
-0.2464201, 0.4306874, 0.3824, 0, 1, 0.4705882, 1,
-0.2396342, 0.9772683, -0.6778474, 0, 1, 0.4784314, 1,
-0.2386404, 0.3353266, -0.8666748, 0, 1, 0.4823529, 1,
-0.2365546, 1.021542, -0.2700471, 0, 1, 0.4901961, 1,
-0.2356008, -0.0131599, -2.853683, 0, 1, 0.4941176, 1,
-0.2337995, -0.6730042, -3.696165, 0, 1, 0.5019608, 1,
-0.2313541, -1.479729, -1.760631, 0, 1, 0.509804, 1,
-0.2310145, -1.200537, -2.561035, 0, 1, 0.5137255, 1,
-0.2247599, -0.2503865, -4.171837, 0, 1, 0.5215687, 1,
-0.2238841, -0.403439, -1.175303, 0, 1, 0.5254902, 1,
-0.2208668, -1.386292, -3.418941, 0, 1, 0.5333334, 1,
-0.2199228, -1.251355, -3.764732, 0, 1, 0.5372549, 1,
-0.2185362, 0.2921121, -0.4418308, 0, 1, 0.5450981, 1,
-0.2173958, 0.1134791, -0.3729847, 0, 1, 0.5490196, 1,
-0.2171388, -0.9482014, -3.105693, 0, 1, 0.5568628, 1,
-0.2163061, 0.7247555, -2.739889, 0, 1, 0.5607843, 1,
-0.2162326, -1.425976, -2.306305, 0, 1, 0.5686275, 1,
-0.2155214, -0.1393687, -2.497332, 0, 1, 0.572549, 1,
-0.2149137, -0.5650977, -3.846945, 0, 1, 0.5803922, 1,
-0.2130271, -0.4837894, -2.011595, 0, 1, 0.5843138, 1,
-0.2118374, -0.3253046, -2.148866, 0, 1, 0.5921569, 1,
-0.2097927, -0.3982502, -1.61409, 0, 1, 0.5960785, 1,
-0.208864, 1.1011, 0.6624259, 0, 1, 0.6039216, 1,
-0.2086074, 1.090644, -0.3681717, 0, 1, 0.6117647, 1,
-0.2061502, -0.7713199, -3.847821, 0, 1, 0.6156863, 1,
-0.1973184, 2.18265, 0.2434446, 0, 1, 0.6235294, 1,
-0.1948683, 0.7399065, 0.4346183, 0, 1, 0.627451, 1,
-0.1886005, 0.5174807, -2.313102, 0, 1, 0.6352941, 1,
-0.1867013, 1.434429, -0.8866041, 0, 1, 0.6392157, 1,
-0.1863963, -0.0290773, -2.607943, 0, 1, 0.6470588, 1,
-0.1821771, 0.8455309, 0.3431237, 0, 1, 0.6509804, 1,
-0.1687663, -0.4877591, -4.757405, 0, 1, 0.6588235, 1,
-0.1617787, -0.3893249, -1.940446, 0, 1, 0.6627451, 1,
-0.1612985, -0.3491088, -2.958189, 0, 1, 0.6705883, 1,
-0.1590149, -0.4768899, -1.483896, 0, 1, 0.6745098, 1,
-0.156918, -1.08771, -1.790005, 0, 1, 0.682353, 1,
-0.1545163, 0.9959579, -0.04579127, 0, 1, 0.6862745, 1,
-0.1531219, -0.5107861, -1.85005, 0, 1, 0.6941177, 1,
-0.1510436, -0.835575, -3.996746, 0, 1, 0.7019608, 1,
-0.1508236, 0.9089196, 0.1528157, 0, 1, 0.7058824, 1,
-0.1476589, -1.898749, -0.929899, 0, 1, 0.7137255, 1,
-0.1441964, 0.4260808, 1.862006, 0, 1, 0.7176471, 1,
-0.1426404, 0.9567196, -0.8895581, 0, 1, 0.7254902, 1,
-0.1421511, -0.8156794, -3.424035, 0, 1, 0.7294118, 1,
-0.1416479, 1.279004, -0.9935834, 0, 1, 0.7372549, 1,
-0.1364286, 0.9534669, -0.1954938, 0, 1, 0.7411765, 1,
-0.1358502, -1.747485, -1.521951, 0, 1, 0.7490196, 1,
-0.1342281, -1.955331, -2.93294, 0, 1, 0.7529412, 1,
-0.1328736, -0.4377823, -2.343558, 0, 1, 0.7607843, 1,
-0.1291252, -0.7028545, -3.755241, 0, 1, 0.7647059, 1,
-0.1205411, 1.297876, -0.7642106, 0, 1, 0.772549, 1,
-0.1168711, 1.132351, -1.717837, 0, 1, 0.7764706, 1,
-0.111422, -0.1458212, -0.9995774, 0, 1, 0.7843137, 1,
-0.108558, -0.5666929, -2.821176, 0, 1, 0.7882353, 1,
-0.1070839, 0.2061576, 0.03707678, 0, 1, 0.7960784, 1,
-0.1043601, 0.04192901, -0.9633139, 0, 1, 0.8039216, 1,
-0.09684075, -0.5351159, -2.890257, 0, 1, 0.8078431, 1,
-0.09657721, -0.8281164, -2.503055, 0, 1, 0.8156863, 1,
-0.08587823, 0.6266438, 0.4836333, 0, 1, 0.8196079, 1,
-0.08528066, -0.1725198, -3.661063, 0, 1, 0.827451, 1,
-0.08492783, -0.9566881, -3.329929, 0, 1, 0.8313726, 1,
-0.08489462, 1.288524, -0.2220206, 0, 1, 0.8392157, 1,
-0.07948408, 0.8466862, -0.4501746, 0, 1, 0.8431373, 1,
-0.0784977, 0.7467068, 0.07952616, 0, 1, 0.8509804, 1,
-0.07736684, 0.4049364, 0.319148, 0, 1, 0.854902, 1,
-0.07626469, 0.8497232, -0.4661711, 0, 1, 0.8627451, 1,
-0.07487348, 0.5076033, 1.248791, 0, 1, 0.8666667, 1,
-0.07452235, -0.978046, -3.779789, 0, 1, 0.8745098, 1,
-0.07142342, -0.76446, -1.667725, 0, 1, 0.8784314, 1,
-0.06984802, -1.7114, -5.384764, 0, 1, 0.8862745, 1,
-0.0651425, 0.2176304, -0.4398716, 0, 1, 0.8901961, 1,
-0.05671046, -1.594726, -2.068509, 0, 1, 0.8980392, 1,
-0.05375343, 1.113197, 0.3119899, 0, 1, 0.9058824, 1,
-0.05360589, 0.06179597, -0.376142, 0, 1, 0.9098039, 1,
-0.04511994, 1.667157, 2.596071, 0, 1, 0.9176471, 1,
-0.04445411, 0.288943, 1.562747, 0, 1, 0.9215686, 1,
-0.04327773, -0.6817618, -3.343249, 0, 1, 0.9294118, 1,
-0.04297691, 0.4005184, -0.4984348, 0, 1, 0.9333333, 1,
-0.04192894, -0.3220522, -3.160581, 0, 1, 0.9411765, 1,
-0.03816103, 0.256972, 0.9815054, 0, 1, 0.945098, 1,
-0.03777684, -0.9418432, -3.735178, 0, 1, 0.9529412, 1,
-0.03732807, 1.532077, 1.189111, 0, 1, 0.9568627, 1,
-0.03406493, 1.175432, 0.6092785, 0, 1, 0.9647059, 1,
-0.03354553, -0.607816, -3.312447, 0, 1, 0.9686275, 1,
-0.02683477, -0.1486323, -2.635151, 0, 1, 0.9764706, 1,
-0.02563464, 0.7724389, -2.162727, 0, 1, 0.9803922, 1,
-0.01847389, 0.06182444, 0.4217076, 0, 1, 0.9882353, 1,
-0.01739353, -1.556826, -3.633709, 0, 1, 0.9921569, 1,
-0.0151837, -0.6212456, -3.528409, 0, 1, 1, 1,
-0.01489008, -0.533456, -2.033992, 0, 0.9921569, 1, 1,
-0.01349735, -0.6288805, -1.832226, 0, 0.9882353, 1, 1,
-0.008253279, -1.313354, -4.000268, 0, 0.9803922, 1, 1,
-0.00799678, 0.4165781, -3.238311, 0, 0.9764706, 1, 1,
-0.0008737915, -2.160764, -1.84899, 0, 0.9686275, 1, 1,
0.0001694652, -1.852398, 2.604977, 0, 0.9647059, 1, 1,
0.000579973, 0.5913463, 0.7160794, 0, 0.9568627, 1, 1,
0.00269908, -0.2783794, 2.374219, 0, 0.9529412, 1, 1,
0.004329364, 0.8451776, -0.9026975, 0, 0.945098, 1, 1,
0.01215857, 0.8036731, 1.697345, 0, 0.9411765, 1, 1,
0.01502574, -0.625724, 2.727202, 0, 0.9333333, 1, 1,
0.01542961, -0.2054654, 1.193839, 0, 0.9294118, 1, 1,
0.01975477, -0.2744009, 3.708687, 0, 0.9215686, 1, 1,
0.02720815, -0.7944533, 4.411847, 0, 0.9176471, 1, 1,
0.02991602, 0.5713609, 0.3287298, 0, 0.9098039, 1, 1,
0.03036214, 0.02680807, 3.042624, 0, 0.9058824, 1, 1,
0.03509128, -0.9230409, 2.204507, 0, 0.8980392, 1, 1,
0.03522725, -0.2052237, 2.389898, 0, 0.8901961, 1, 1,
0.03760283, 0.6152881, 1.250429, 0, 0.8862745, 1, 1,
0.03962824, 0.1147019, 0.6350697, 0, 0.8784314, 1, 1,
0.03963024, -0.0564569, 1.424235, 0, 0.8745098, 1, 1,
0.04667343, -0.5270078, 1.080001, 0, 0.8666667, 1, 1,
0.04835036, 0.179811, 1.105402, 0, 0.8627451, 1, 1,
0.04945086, -0.9650388, 3.090305, 0, 0.854902, 1, 1,
0.04970452, -0.400459, 2.439919, 0, 0.8509804, 1, 1,
0.05474992, 0.1427927, 1.49575, 0, 0.8431373, 1, 1,
0.05596621, -0.3406376, 3.318687, 0, 0.8392157, 1, 1,
0.05753314, 0.632478, -1.389773, 0, 0.8313726, 1, 1,
0.05757993, 0.06074899, -0.3288736, 0, 0.827451, 1, 1,
0.06077421, -0.9025276, 2.465386, 0, 0.8196079, 1, 1,
0.06213184, -1.503468, 3.536954, 0, 0.8156863, 1, 1,
0.06407464, 1.036956, 0.5536495, 0, 0.8078431, 1, 1,
0.06414564, 1.464237, 1.150555, 0, 0.8039216, 1, 1,
0.06457239, 0.3127691, 0.5530014, 0, 0.7960784, 1, 1,
0.0651562, -0.3603854, 1.043243, 0, 0.7882353, 1, 1,
0.06535191, 0.7032434, 1.199444, 0, 0.7843137, 1, 1,
0.07140464, -1.614481, 2.081798, 0, 0.7764706, 1, 1,
0.07161196, -0.6640231, 4.250194, 0, 0.772549, 1, 1,
0.07335575, -0.623338, 3.57511, 0, 0.7647059, 1, 1,
0.07386804, 0.02675172, 2.403375, 0, 0.7607843, 1, 1,
0.07396659, 0.1046127, 1.347793, 0, 0.7529412, 1, 1,
0.07761059, -0.6235712, 4.531803, 0, 0.7490196, 1, 1,
0.07941249, -0.7368064, 3.04821, 0, 0.7411765, 1, 1,
0.08231345, 0.5858639, 0.1184122, 0, 0.7372549, 1, 1,
0.08273493, 0.02075489, 0.8516484, 0, 0.7294118, 1, 1,
0.08535162, 1.018962, -0.2453201, 0, 0.7254902, 1, 1,
0.087626, -1.16903, 4.30711, 0, 0.7176471, 1, 1,
0.08884554, -0.8376614, 4.618629, 0, 0.7137255, 1, 1,
0.0903765, -0.9140497, 3.364, 0, 0.7058824, 1, 1,
0.09281869, -0.1016252, 2.72159, 0, 0.6980392, 1, 1,
0.09741624, -0.536678, 3.817877, 0, 0.6941177, 1, 1,
0.09774131, 1.19837, 0.8486587, 0, 0.6862745, 1, 1,
0.09860471, -1.440254, 4.687888, 0, 0.682353, 1, 1,
0.09877869, -0.2055018, 4.146182, 0, 0.6745098, 1, 1,
0.1027792, -0.0912267, 1.091074, 0, 0.6705883, 1, 1,
0.107842, -0.2613574, 3.382429, 0, 0.6627451, 1, 1,
0.1125468, -0.214616, 2.365842, 0, 0.6588235, 1, 1,
0.1137939, -0.7683533, 2.156341, 0, 0.6509804, 1, 1,
0.1157353, -0.7496223, 4.867984, 0, 0.6470588, 1, 1,
0.116378, 0.4563582, -2.268282, 0, 0.6392157, 1, 1,
0.1175528, -0.1926128, 3.143839, 0, 0.6352941, 1, 1,
0.1197468, -0.5749863, 1.991865, 0, 0.627451, 1, 1,
0.120284, -0.7752059, 2.569997, 0, 0.6235294, 1, 1,
0.122979, 0.5052155, 0.8521869, 0, 0.6156863, 1, 1,
0.1246879, -0.1600954, 0.8113337, 0, 0.6117647, 1, 1,
0.1257466, -1.240476, 2.628712, 0, 0.6039216, 1, 1,
0.1278091, 0.2737266, -0.3946204, 0, 0.5960785, 1, 1,
0.1331729, 0.4317702, 0.4103223, 0, 0.5921569, 1, 1,
0.139364, 2.51362, -0.2546863, 0, 0.5843138, 1, 1,
0.1403775, -0.7263274, 4.08406, 0, 0.5803922, 1, 1,
0.1406971, 1.179396, -0.3386111, 0, 0.572549, 1, 1,
0.1449685, -1.469521, 4.014055, 0, 0.5686275, 1, 1,
0.1452675, 0.3641399, -0.5293046, 0, 0.5607843, 1, 1,
0.146328, 1.502027, -0.1990812, 0, 0.5568628, 1, 1,
0.1530578, 0.1707475, 2.168735, 0, 0.5490196, 1, 1,
0.1556045, 0.744589, -0.05706249, 0, 0.5450981, 1, 1,
0.1581139, -1.179528, 3.12104, 0, 0.5372549, 1, 1,
0.1581455, 0.1184847, 0.5978644, 0, 0.5333334, 1, 1,
0.1587776, -0.7156817, 3.476685, 0, 0.5254902, 1, 1,
0.1604285, -1.94511, 2.389174, 0, 0.5215687, 1, 1,
0.1608378, 0.386081, -2.049239, 0, 0.5137255, 1, 1,
0.1637719, 1.606256, -0.1722862, 0, 0.509804, 1, 1,
0.1672682, 0.8845308, -0.6606991, 0, 0.5019608, 1, 1,
0.1703124, 0.9723203, 1.103406, 0, 0.4941176, 1, 1,
0.1733141, -1.127635, 1.59869, 0, 0.4901961, 1, 1,
0.174224, 0.4475294, -0.7425362, 0, 0.4823529, 1, 1,
0.1767876, 0.6571766, 1.603934, 0, 0.4784314, 1, 1,
0.1774262, -0.9464254, 4.135822, 0, 0.4705882, 1, 1,
0.1777697, -1.593212, 4.436142, 0, 0.4666667, 1, 1,
0.1778297, -1.129614, 4.578969, 0, 0.4588235, 1, 1,
0.1790352, 0.7936009, -0.2362224, 0, 0.454902, 1, 1,
0.1842772, -1.229395, 2.889831, 0, 0.4470588, 1, 1,
0.1871897, 0.8154451, -0.8545414, 0, 0.4431373, 1, 1,
0.1872849, -0.8525635, 4.981515, 0, 0.4352941, 1, 1,
0.1881809, -0.667366, 4.293523, 0, 0.4313726, 1, 1,
0.1886073, -1.626046, 1.026077, 0, 0.4235294, 1, 1,
0.1887613, 2.404666, -1.43526, 0, 0.4196078, 1, 1,
0.1933925, -1.091736, 2.41436, 0, 0.4117647, 1, 1,
0.1939994, 1.608754, -0.4514409, 0, 0.4078431, 1, 1,
0.2082725, 0.1018454, 0.351154, 0, 0.4, 1, 1,
0.2098205, -0.4941469, 2.074134, 0, 0.3921569, 1, 1,
0.2159832, 0.1798481, -0.1287724, 0, 0.3882353, 1, 1,
0.2170764, -0.4539261, 3.458308, 0, 0.3803922, 1, 1,
0.2212674, 0.4571311, 0.3331962, 0, 0.3764706, 1, 1,
0.2236187, 0.1408368, 0.8827509, 0, 0.3686275, 1, 1,
0.2271428, -1.135751, 3.808512, 0, 0.3647059, 1, 1,
0.2285436, 1.176114, 1.256074, 0, 0.3568628, 1, 1,
0.2287116, -0.8211596, 3.967162, 0, 0.3529412, 1, 1,
0.2309186, 1.302686, -0.3328619, 0, 0.345098, 1, 1,
0.2318151, -0.5464025, 5.045489, 0, 0.3411765, 1, 1,
0.2335633, 0.3851791, 1.693653, 0, 0.3333333, 1, 1,
0.239682, 1.082862, 0.3764673, 0, 0.3294118, 1, 1,
0.2446495, -1.128393, 1.804182, 0, 0.3215686, 1, 1,
0.254147, 0.03682257, 1.219897, 0, 0.3176471, 1, 1,
0.2556111, -0.3325502, 4.112222, 0, 0.3098039, 1, 1,
0.2621205, -1.133028, 3.029838, 0, 0.3058824, 1, 1,
0.2624733, -0.4031299, 2.873847, 0, 0.2980392, 1, 1,
0.2634733, -1.143576, 3.734126, 0, 0.2901961, 1, 1,
0.2684765, -2.175598, 1.555704, 0, 0.2862745, 1, 1,
0.2692305, -0.04234596, 1.45744, 0, 0.2784314, 1, 1,
0.2701637, -1.559542, 2.168733, 0, 0.2745098, 1, 1,
0.2734998, 0.5999364, 0.9715856, 0, 0.2666667, 1, 1,
0.2741135, 0.5621209, 1.443841, 0, 0.2627451, 1, 1,
0.2748222, 2.257674, -0.5595162, 0, 0.254902, 1, 1,
0.2769053, -1.101327, 3.741235, 0, 0.2509804, 1, 1,
0.2853263, -0.9788474, 2.507244, 0, 0.2431373, 1, 1,
0.2931033, -0.2047237, 1.196561, 0, 0.2392157, 1, 1,
0.2941615, 0.2825704, 1.516459, 0, 0.2313726, 1, 1,
0.2947153, -0.02447811, 0.7894437, 0, 0.227451, 1, 1,
0.2953043, 0.4960066, -0.7411917, 0, 0.2196078, 1, 1,
0.2969815, 1.188156, -1.13202, 0, 0.2156863, 1, 1,
0.3052135, 0.2204713, 0.439012, 0, 0.2078431, 1, 1,
0.3061963, -0.6297547, 5.477054, 0, 0.2039216, 1, 1,
0.3071768, -0.7475952, 4.452315, 0, 0.1960784, 1, 1,
0.3130722, -1.426426, 2.368972, 0, 0.1882353, 1, 1,
0.3133829, -1.509206, 2.535008, 0, 0.1843137, 1, 1,
0.3173994, -0.7241942, 2.612805, 0, 0.1764706, 1, 1,
0.3176437, -0.280531, 3.619403, 0, 0.172549, 1, 1,
0.3180353, 0.3669375, 0.484707, 0, 0.1647059, 1, 1,
0.3185559, -1.619692, 4.346095, 0, 0.1607843, 1, 1,
0.3260294, -1.648482, 2.574164, 0, 0.1529412, 1, 1,
0.3270669, 0.6430671, 0.8122457, 0, 0.1490196, 1, 1,
0.3303131, -0.219527, 1.019984, 0, 0.1411765, 1, 1,
0.3335614, -0.04385247, 1.698817, 0, 0.1372549, 1, 1,
0.3392929, -0.2798079, 3.319733, 0, 0.1294118, 1, 1,
0.3462086, 1.556921, -1.445166, 0, 0.1254902, 1, 1,
0.3465558, -1.614609, 2.356805, 0, 0.1176471, 1, 1,
0.3480664, 1.425972, 0.6491178, 0, 0.1137255, 1, 1,
0.3483375, -0.5588822, 4.20281, 0, 0.1058824, 1, 1,
0.3486792, -0.5822973, 1.517222, 0, 0.09803922, 1, 1,
0.3495542, 0.5906135, 0.2597449, 0, 0.09411765, 1, 1,
0.3634468, 1.056064, 0.09089015, 0, 0.08627451, 1, 1,
0.3638109, -1.079745, 3.600666, 0, 0.08235294, 1, 1,
0.3648056, 0.1316003, 0.4566689, 0, 0.07450981, 1, 1,
0.3675234, -0.8101583, 2.614841, 0, 0.07058824, 1, 1,
0.3689933, 0.3647169, 1.274307, 0, 0.0627451, 1, 1,
0.3720573, 0.4666149, 2.758426, 0, 0.05882353, 1, 1,
0.3777081, 0.4761524, -2.121437, 0, 0.05098039, 1, 1,
0.3779243, 0.384782, 1.467243, 0, 0.04705882, 1, 1,
0.3839759, -0.3323664, 3.184121, 0, 0.03921569, 1, 1,
0.3866085, -0.2692593, 0.8740997, 0, 0.03529412, 1, 1,
0.3889098, 0.1003329, 1.095767, 0, 0.02745098, 1, 1,
0.3922648, 0.051224, 2.593567, 0, 0.02352941, 1, 1,
0.3944943, 0.480188, -0.01989833, 0, 0.01568628, 1, 1,
0.394847, 1.502072, 3.648528, 0, 0.01176471, 1, 1,
0.4033916, 0.2885946, 2.571645, 0, 0.003921569, 1, 1,
0.4101296, -0.176708, 1.932336, 0.003921569, 0, 1, 1,
0.4181381, -0.1567169, 2.294404, 0.007843138, 0, 1, 1,
0.4228733, -2.006154, 3.182808, 0.01568628, 0, 1, 1,
0.4258484, -1.760317, 2.10269, 0.01960784, 0, 1, 1,
0.4322189, 0.3747877, -0.5088645, 0.02745098, 0, 1, 1,
0.4372134, -1.116404, 2.125772, 0.03137255, 0, 1, 1,
0.4379332, -0.1407154, 2.235264, 0.03921569, 0, 1, 1,
0.4393861, -1.052963, 1.402056, 0.04313726, 0, 1, 1,
0.4435894, 2.274727, 0.2068322, 0.05098039, 0, 1, 1,
0.4502242, -1.517223, 3.321985, 0.05490196, 0, 1, 1,
0.4513823, 1.892114, 0.2855677, 0.0627451, 0, 1, 1,
0.4527082, -0.8667649, 4.978967, 0.06666667, 0, 1, 1,
0.4528343, -0.1171325, 1.060351, 0.07450981, 0, 1, 1,
0.4549447, -0.8825184, 4.160684, 0.07843138, 0, 1, 1,
0.4565536, 0.6746397, 0.3968208, 0.08627451, 0, 1, 1,
0.4603364, 0.116161, 2.093229, 0.09019608, 0, 1, 1,
0.4614019, 0.3126474, 1.51783, 0.09803922, 0, 1, 1,
0.4616813, -0.02208978, 3.103612, 0.1058824, 0, 1, 1,
0.4619284, -1.084578, 2.223699, 0.1098039, 0, 1, 1,
0.4621554, 0.2510633, 0.3072598, 0.1176471, 0, 1, 1,
0.4623452, -1.449384, 1.837447, 0.1215686, 0, 1, 1,
0.4630514, -0.7288646, 2.631256, 0.1294118, 0, 1, 1,
0.463497, 0.2733024, 0.01820728, 0.1333333, 0, 1, 1,
0.4672292, 0.3155021, 2.079241, 0.1411765, 0, 1, 1,
0.4704466, 2.431148, 0.6368492, 0.145098, 0, 1, 1,
0.4801452, 1.276388, 0.2529989, 0.1529412, 0, 1, 1,
0.4922939, -0.7970471, 1.59312, 0.1568628, 0, 1, 1,
0.5056562, -0.0694166, 2.56738, 0.1647059, 0, 1, 1,
0.5070827, -0.5439464, 3.818645, 0.1686275, 0, 1, 1,
0.508922, 2.038329, 0.6034855, 0.1764706, 0, 1, 1,
0.5143974, -1.002279, 3.499161, 0.1803922, 0, 1, 1,
0.5150366, -0.9924754, 4.357262, 0.1882353, 0, 1, 1,
0.5159014, 2.681952, 0.07507743, 0.1921569, 0, 1, 1,
0.5238094, 0.6025767, -0.5121598, 0.2, 0, 1, 1,
0.5277705, -2.729902, 2.3186, 0.2078431, 0, 1, 1,
0.5290788, -0.6922377, 1.060844, 0.2117647, 0, 1, 1,
0.529444, 0.6741732, 0.8009025, 0.2196078, 0, 1, 1,
0.5305859, -0.5072649, 3.211692, 0.2235294, 0, 1, 1,
0.5307797, 0.7991511, 0.138753, 0.2313726, 0, 1, 1,
0.533671, 0.8506236, 1.458148, 0.2352941, 0, 1, 1,
0.5346282, -1.275133, 2.965579, 0.2431373, 0, 1, 1,
0.5363962, -0.2461328, 1.454768, 0.2470588, 0, 1, 1,
0.540781, 1.068325, -0.8472049, 0.254902, 0, 1, 1,
0.5425825, -0.1346977, 1.868065, 0.2588235, 0, 1, 1,
0.5469, 0.06438747, 1.44997, 0.2666667, 0, 1, 1,
0.5506755, -0.296258, 2.182608, 0.2705882, 0, 1, 1,
0.5543302, -0.4830236, 2.447666, 0.2784314, 0, 1, 1,
0.5581446, 0.09447621, -0.2416786, 0.282353, 0, 1, 1,
0.5586717, -2.258777, 2.201136, 0.2901961, 0, 1, 1,
0.5626732, 0.6717703, 0.5958117, 0.2941177, 0, 1, 1,
0.5629032, -2.00814, 0.6872564, 0.3019608, 0, 1, 1,
0.5640123, -1.145231, 2.503983, 0.3098039, 0, 1, 1,
0.5685828, 0.637814, -0.5480502, 0.3137255, 0, 1, 1,
0.5685901, 0.1852545, 0.821526, 0.3215686, 0, 1, 1,
0.5692494, 2.162559, 0.05073334, 0.3254902, 0, 1, 1,
0.5709163, 1.534739, -0.9997572, 0.3333333, 0, 1, 1,
0.5725551, -0.02783333, 0.2093817, 0.3372549, 0, 1, 1,
0.5732008, 1.526901, -0.009082232, 0.345098, 0, 1, 1,
0.5752645, -1.165835, 3.156855, 0.3490196, 0, 1, 1,
0.5760351, 0.5623958, -0.5212728, 0.3568628, 0, 1, 1,
0.5761979, -1.816893, 5.090271, 0.3607843, 0, 1, 1,
0.5769892, 0.273191, 1.51472, 0.3686275, 0, 1, 1,
0.5775622, -1.209632, 2.524395, 0.372549, 0, 1, 1,
0.5776072, -0.128743, 1.689554, 0.3803922, 0, 1, 1,
0.5810053, 0.3330259, 0.5997078, 0.3843137, 0, 1, 1,
0.5875975, -0.5058158, 2.337544, 0.3921569, 0, 1, 1,
0.5880802, 0.362592, 0.9358925, 0.3960784, 0, 1, 1,
0.5922216, -0.4146325, 2.552032, 0.4039216, 0, 1, 1,
0.5930865, -1.760467, 2.491637, 0.4117647, 0, 1, 1,
0.5940511, -1.154078, 3.1661, 0.4156863, 0, 1, 1,
0.5993311, 0.5297005, -0.01227147, 0.4235294, 0, 1, 1,
0.5994888, 0.4710251, 0.7829666, 0.427451, 0, 1, 1,
0.601219, -0.03508953, 2.518646, 0.4352941, 0, 1, 1,
0.6070338, 0.3677162, 2.784798, 0.4392157, 0, 1, 1,
0.6092575, -1.25445, 1.637568, 0.4470588, 0, 1, 1,
0.6109618, -2.353975, 2.55095, 0.4509804, 0, 1, 1,
0.6129288, 0.3674829, 1.378902, 0.4588235, 0, 1, 1,
0.6180031, 1.042385, -0.1117401, 0.4627451, 0, 1, 1,
0.6182559, -0.5578696, 0.466158, 0.4705882, 0, 1, 1,
0.6209033, -1.096395, 1.074908, 0.4745098, 0, 1, 1,
0.6241023, -0.5809148, 1.817693, 0.4823529, 0, 1, 1,
0.629432, 1.128385, 1.283291, 0.4862745, 0, 1, 1,
0.6372401, 0.486931, 1.273481, 0.4941176, 0, 1, 1,
0.6416148, -0.06378613, 1.722914, 0.5019608, 0, 1, 1,
0.6441025, -0.4458404, 2.042138, 0.5058824, 0, 1, 1,
0.6710756, 0.2966116, 2.941818, 0.5137255, 0, 1, 1,
0.6732646, -0.8497282, 3.01347, 0.5176471, 0, 1, 1,
0.6765589, -0.2188788, 0.6699634, 0.5254902, 0, 1, 1,
0.6812941, 0.1831824, 0.6929575, 0.5294118, 0, 1, 1,
0.6863052, 0.5418563, 0.6090001, 0.5372549, 0, 1, 1,
0.6969166, -1.461738, 1.789835, 0.5411765, 0, 1, 1,
0.7075672, 2.856736, 1.00236, 0.5490196, 0, 1, 1,
0.7118683, 1.602682, -1.23148, 0.5529412, 0, 1, 1,
0.7160936, 1.687274, 1.54815, 0.5607843, 0, 1, 1,
0.7164614, 1.280555, 0.1467551, 0.5647059, 0, 1, 1,
0.7166352, -1.581741, 1.642734, 0.572549, 0, 1, 1,
0.7172929, 1.555289, -0.2080966, 0.5764706, 0, 1, 1,
0.7259527, -0.6958449, 3.185464, 0.5843138, 0, 1, 1,
0.7308462, -0.3045394, 2.055838, 0.5882353, 0, 1, 1,
0.7383373, -1.165709, 1.523641, 0.5960785, 0, 1, 1,
0.7395632, -1.026009, 2.097966, 0.6039216, 0, 1, 1,
0.7456176, 0.06019091, 3.890532, 0.6078432, 0, 1, 1,
0.7474056, -0.4484242, 2.262093, 0.6156863, 0, 1, 1,
0.7546177, 0.4228969, 0.3798939, 0.6196079, 0, 1, 1,
0.7584044, -1.021793, 2.616326, 0.627451, 0, 1, 1,
0.7629158, -0.2223256, -0.03949818, 0.6313726, 0, 1, 1,
0.7675381, -0.7058334, 1.258193, 0.6392157, 0, 1, 1,
0.7675903, 0.4615918, 1.964779, 0.6431373, 0, 1, 1,
0.7715133, 0.2668753, 2.711297, 0.6509804, 0, 1, 1,
0.780701, 0.3651419, 1.192051, 0.654902, 0, 1, 1,
0.7813923, -0.01310052, 2.52561, 0.6627451, 0, 1, 1,
0.7894681, 1.562677, -1.30519, 0.6666667, 0, 1, 1,
0.7908429, 0.1588566, 1.295269, 0.6745098, 0, 1, 1,
0.7912291, -0.4423685, 2.692494, 0.6784314, 0, 1, 1,
0.7936095, -0.4169683, 2.200717, 0.6862745, 0, 1, 1,
0.7971733, 1.577701, -0.3467273, 0.6901961, 0, 1, 1,
0.7983544, -0.5321282, 0.1757644, 0.6980392, 0, 1, 1,
0.8023595, 0.9092955, 0.1824275, 0.7058824, 0, 1, 1,
0.8074148, -2.162912, 4.394826, 0.7098039, 0, 1, 1,
0.8093089, 1.954105, 0.450332, 0.7176471, 0, 1, 1,
0.809411, -0.1726893, 1.229765, 0.7215686, 0, 1, 1,
0.813811, -0.008075496, 2.856116, 0.7294118, 0, 1, 1,
0.8184342, -1.683276, 3.196069, 0.7333333, 0, 1, 1,
0.8187332, -0.9777594, 3.392609, 0.7411765, 0, 1, 1,
0.8209634, 0.4868387, 1.720965, 0.7450981, 0, 1, 1,
0.8233055, 0.8495709, -0.1523179, 0.7529412, 0, 1, 1,
0.8268085, 0.2108359, 2.590418, 0.7568628, 0, 1, 1,
0.8363762, 1.427923, -1.325375, 0.7647059, 0, 1, 1,
0.8383934, 0.2799585, 1.327562, 0.7686275, 0, 1, 1,
0.8442217, -0.7317908, 2.964743, 0.7764706, 0, 1, 1,
0.8459152, -1.425043, 2.899899, 0.7803922, 0, 1, 1,
0.8474627, 0.4430471, -0.5404077, 0.7882353, 0, 1, 1,
0.8481355, 1.053316, -0.08925445, 0.7921569, 0, 1, 1,
0.8592348, -0.7088934, 0.9559922, 0.8, 0, 1, 1,
0.8672868, -1.410763, 2.35608, 0.8078431, 0, 1, 1,
0.8694246, 0.2240053, 3.38083, 0.8117647, 0, 1, 1,
0.8764725, 0.8162288, 1.972906, 0.8196079, 0, 1, 1,
0.8782311, 0.2298482, 1.750547, 0.8235294, 0, 1, 1,
0.882126, -0.5012321, 3.027236, 0.8313726, 0, 1, 1,
0.8868167, -2.021356, 5.079018, 0.8352941, 0, 1, 1,
0.8920808, -0.04188684, 1.322013, 0.8431373, 0, 1, 1,
0.8982021, 0.03540533, 1.753385, 0.8470588, 0, 1, 1,
0.9018818, 0.1814467, 1.994525, 0.854902, 0, 1, 1,
0.9052066, -1.227293, 3.565595, 0.8588235, 0, 1, 1,
0.9068569, 0.3868709, 2.133561, 0.8666667, 0, 1, 1,
0.9103866, 1.208877, -1.182958, 0.8705882, 0, 1, 1,
0.9117154, 0.523981, -0.3197867, 0.8784314, 0, 1, 1,
0.913964, -0.6921278, 5.280134, 0.8823529, 0, 1, 1,
0.9161091, -0.2613455, 1.540301, 0.8901961, 0, 1, 1,
0.9182789, 0.3157009, 1.018656, 0.8941177, 0, 1, 1,
0.9275333, 0.7167429, 2.001714, 0.9019608, 0, 1, 1,
0.9341589, -0.01342797, 1.658885, 0.9098039, 0, 1, 1,
0.944953, -0.9771247, 2.163047, 0.9137255, 0, 1, 1,
0.945696, 0.2063253, 1.236619, 0.9215686, 0, 1, 1,
0.9489662, -0.8178658, 3.78432, 0.9254902, 0, 1, 1,
0.9509187, 0.5657222, 2.112313, 0.9333333, 0, 1, 1,
0.9683955, 0.6099486, 2.695312, 0.9372549, 0, 1, 1,
0.9749085, -0.6330078, 3.337644, 0.945098, 0, 1, 1,
0.9753767, -0.3676376, 0.9463742, 0.9490196, 0, 1, 1,
0.9788112, -1.135999, 2.421891, 0.9568627, 0, 1, 1,
0.9853233, -0.5608702, 3.338467, 0.9607843, 0, 1, 1,
0.9863718, -0.6722739, 1.072439, 0.9686275, 0, 1, 1,
0.9939483, 0.5555238, 0.1435406, 0.972549, 0, 1, 1,
0.9972646, 0.2274509, 0.4533377, 0.9803922, 0, 1, 1,
1.006458, 0.06944631, 1.72269, 0.9843137, 0, 1, 1,
1.007, -1.289163, 1.040771, 0.9921569, 0, 1, 1,
1.017843, -0.2642753, 3.060553, 0.9960784, 0, 1, 1,
1.020131, -0.09416568, 2.318625, 1, 0, 0.9960784, 1,
1.021602, 0.2694381, 1.439366, 1, 0, 0.9882353, 1,
1.021866, -0.7644914, 3.833724, 1, 0, 0.9843137, 1,
1.024793, -0.1183992, 1.740749, 1, 0, 0.9764706, 1,
1.029387, 1.181496, -1.277016, 1, 0, 0.972549, 1,
1.036976, -0.1949947, 1.689242, 1, 0, 0.9647059, 1,
1.040493, -0.7071164, 1.548434, 1, 0, 0.9607843, 1,
1.046951, 0.3854756, -0.693531, 1, 0, 0.9529412, 1,
1.049218, 0.08731303, 3.366573, 1, 0, 0.9490196, 1,
1.052985, 1.321109, -0.6809068, 1, 0, 0.9411765, 1,
1.055766, -1.803399, 3.382234, 1, 0, 0.9372549, 1,
1.064104, 0.6043434, -0.3619011, 1, 0, 0.9294118, 1,
1.070844, 0.6824519, 0.9656792, 1, 0, 0.9254902, 1,
1.072122, 0.009471597, 2.391615, 1, 0, 0.9176471, 1,
1.072219, 0.4358945, 0.2009078, 1, 0, 0.9137255, 1,
1.076367, -1.010095, 2.920209, 1, 0, 0.9058824, 1,
1.079974, 0.05713297, 1.213216, 1, 0, 0.9019608, 1,
1.088045, 0.6361576, 0.9119378, 1, 0, 0.8941177, 1,
1.092412, -0.9824644, 2.0946, 1, 0, 0.8862745, 1,
1.092976, -0.5155851, 2.191671, 1, 0, 0.8823529, 1,
1.095132, -0.4437141, 1.341229, 1, 0, 0.8745098, 1,
1.096283, -0.407931, 0.6129422, 1, 0, 0.8705882, 1,
1.097644, -0.6931587, 2.099221, 1, 0, 0.8627451, 1,
1.102436, -1.31959, 3.035779, 1, 0, 0.8588235, 1,
1.103372, 0.2877048, 1.778103, 1, 0, 0.8509804, 1,
1.103671, -0.1064719, 0.6243984, 1, 0, 0.8470588, 1,
1.107541, 0.7076315, 1.650726, 1, 0, 0.8392157, 1,
1.109128, -1.111188, 3.119922, 1, 0, 0.8352941, 1,
1.11005, 0.03481188, 2.307604, 1, 0, 0.827451, 1,
1.117043, -1.691697, 3.511416, 1, 0, 0.8235294, 1,
1.11957, -2.090182, 3.128665, 1, 0, 0.8156863, 1,
1.121591, 0.1534828, -0.138273, 1, 0, 0.8117647, 1,
1.128579, 0.7460162, 2.376238, 1, 0, 0.8039216, 1,
1.129098, -0.5199359, -0.05106108, 1, 0, 0.7960784, 1,
1.134708, -0.2881691, 1.268165, 1, 0, 0.7921569, 1,
1.147608, -0.3359359, 1.92118, 1, 0, 0.7843137, 1,
1.151479, -0.3769511, 2.806452, 1, 0, 0.7803922, 1,
1.154565, 0.205503, -0.07064045, 1, 0, 0.772549, 1,
1.159858, -0.2652777, 1.144848, 1, 0, 0.7686275, 1,
1.169491, 0.9238819, -0.7159294, 1, 0, 0.7607843, 1,
1.171161, -0.9463043, 2.863346, 1, 0, 0.7568628, 1,
1.172567, 1.601851, 0.6437597, 1, 0, 0.7490196, 1,
1.176706, 0.3786859, 0.1079873, 1, 0, 0.7450981, 1,
1.178077, 0.5810285, 2.215854, 1, 0, 0.7372549, 1,
1.180669, -1.144909, 1.242066, 1, 0, 0.7333333, 1,
1.18145, -0.5374429, 2.892573, 1, 0, 0.7254902, 1,
1.191339, -1.088823, 2.657519, 1, 0, 0.7215686, 1,
1.193478, 1.206388, 1.309899, 1, 0, 0.7137255, 1,
1.200681, 2.350075, -0.7090272, 1, 0, 0.7098039, 1,
1.203716, -0.8629607, 2.611455, 1, 0, 0.7019608, 1,
1.207756, 0.6742495, 0.5089185, 1, 0, 0.6941177, 1,
1.208079, -0.5732982, 2.787999, 1, 0, 0.6901961, 1,
1.217685, -0.1506299, 0.8566433, 1, 0, 0.682353, 1,
1.217774, -0.1949059, -0.02061042, 1, 0, 0.6784314, 1,
1.232182, -0.3124753, 1.488239, 1, 0, 0.6705883, 1,
1.237952, 0.9843786, 2.761249, 1, 0, 0.6666667, 1,
1.250538, 0.2081245, 1.941463, 1, 0, 0.6588235, 1,
1.26099, -0.305495, 1.551881, 1, 0, 0.654902, 1,
1.266878, 0.3446346, 0.6624352, 1, 0, 0.6470588, 1,
1.27457, 0.7402078, 2.006851, 1, 0, 0.6431373, 1,
1.278086, -1.388716, 1.469197, 1, 0, 0.6352941, 1,
1.278805, 0.2297748, 0.9334607, 1, 0, 0.6313726, 1,
1.282274, 1.273402, 0.2235554, 1, 0, 0.6235294, 1,
1.312286, -0.7367581, 1.538238, 1, 0, 0.6196079, 1,
1.315725, -2.03299, 3.290323, 1, 0, 0.6117647, 1,
1.323, 0.1494016, 0.6755433, 1, 0, 0.6078432, 1,
1.336544, 1.367361, 0.7326916, 1, 0, 0.6, 1,
1.338688, -0.7578625, 2.378443, 1, 0, 0.5921569, 1,
1.347073, -0.5885845, 1.007119, 1, 0, 0.5882353, 1,
1.356282, -0.5062987, 0.8656642, 1, 0, 0.5803922, 1,
1.357855, 0.8711678, 0.3825257, 1, 0, 0.5764706, 1,
1.362184, 1.130917, -0.6095463, 1, 0, 0.5686275, 1,
1.37437, -0.4652652, 1.832669, 1, 0, 0.5647059, 1,
1.376464, 0.2470974, 0.8016691, 1, 0, 0.5568628, 1,
1.378453, 1.430814, 0.1272011, 1, 0, 0.5529412, 1,
1.389555, -0.7603096, -0.257457, 1, 0, 0.5450981, 1,
1.39113, 0.1084028, 1.691333, 1, 0, 0.5411765, 1,
1.408027, 0.09218287, 1.147829, 1, 0, 0.5333334, 1,
1.409956, -0.9790765, 4.385966, 1, 0, 0.5294118, 1,
1.41504, -1.648498, 2.134567, 1, 0, 0.5215687, 1,
1.423606, 1.123374, 1.257733, 1, 0, 0.5176471, 1,
1.429309, -0.04536508, 2.253303, 1, 0, 0.509804, 1,
1.429782, 0.4043708, 1.646737, 1, 0, 0.5058824, 1,
1.440079, 1.091513, 1.171859, 1, 0, 0.4980392, 1,
1.442156, -0.9392011, 4.296046, 1, 0, 0.4901961, 1,
1.445695, -0.614251, 1.815461, 1, 0, 0.4862745, 1,
1.456012, 1.849241, -0.3189417, 1, 0, 0.4784314, 1,
1.4661, -0.1552816, 1.671885, 1, 0, 0.4745098, 1,
1.47869, 0.3144531, 0.4528077, 1, 0, 0.4666667, 1,
1.483966, 0.6397803, -0.8504204, 1, 0, 0.4627451, 1,
1.500691, 1.31937, 1.051464, 1, 0, 0.454902, 1,
1.503003, 1.353038, 2.074222, 1, 0, 0.4509804, 1,
1.508189, -0.5917463, 1.646155, 1, 0, 0.4431373, 1,
1.53221, 1.114875, 0.7669587, 1, 0, 0.4392157, 1,
1.549639, 1.71681, -0.2849467, 1, 0, 0.4313726, 1,
1.552727, -1.78465, 3.177947, 1, 0, 0.427451, 1,
1.559704, -0.05036764, 2.050771, 1, 0, 0.4196078, 1,
1.560773, -0.3406405, 2.45478, 1, 0, 0.4156863, 1,
1.571742, 0.5694206, 1.243702, 1, 0, 0.4078431, 1,
1.592525, -1.189405, -1.096566, 1, 0, 0.4039216, 1,
1.595139, 0.5424628, 1.237501, 1, 0, 0.3960784, 1,
1.599419, -0.7994961, 1.06573, 1, 0, 0.3882353, 1,
1.608357, 0.4502539, 1.311335, 1, 0, 0.3843137, 1,
1.618934, -0.3565191, 2.595085, 1, 0, 0.3764706, 1,
1.624189, -1.455061, 2.121707, 1, 0, 0.372549, 1,
1.637424, -0.1284692, 1.264225, 1, 0, 0.3647059, 1,
1.654857, 1.433399, 2.557947, 1, 0, 0.3607843, 1,
1.684752, 0.6708719, 2.416525, 1, 0, 0.3529412, 1,
1.691578, 1.025357, 1.933292, 1, 0, 0.3490196, 1,
1.698567, 1.064943, 0.6972944, 1, 0, 0.3411765, 1,
1.701159, 0.2857184, 2.715311, 1, 0, 0.3372549, 1,
1.706528, -0.9687028, 2.637906, 1, 0, 0.3294118, 1,
1.724606, 0.2424325, 0.6877033, 1, 0, 0.3254902, 1,
1.734263, -0.250113, 2.074515, 1, 0, 0.3176471, 1,
1.738342, 0.7777832, 2.952532, 1, 0, 0.3137255, 1,
1.754043, 2.832197, 0.2978172, 1, 0, 0.3058824, 1,
1.776656, -0.1023315, 1.754054, 1, 0, 0.2980392, 1,
1.78083, -0.5137689, 2.586046, 1, 0, 0.2941177, 1,
1.784415, 0.3459689, 2.421133, 1, 0, 0.2862745, 1,
1.785586, -1.296538, 1.568, 1, 0, 0.282353, 1,
1.789624, -0.3203938, 2.579366, 1, 0, 0.2745098, 1,
1.806067, 0.1662479, 3.197687, 1, 0, 0.2705882, 1,
1.811971, 0.1671294, 2.531801, 1, 0, 0.2627451, 1,
1.832364, 0.7282836, 2.094105, 1, 0, 0.2588235, 1,
1.844303, -1.762411, 1.260081, 1, 0, 0.2509804, 1,
1.856504, -1.570441, 3.640366, 1, 0, 0.2470588, 1,
1.866033, 0.4084485, 2.416521, 1, 0, 0.2392157, 1,
1.880897, -0.3802226, 2.579408, 1, 0, 0.2352941, 1,
1.889393, 0.1318931, -0.04537304, 1, 0, 0.227451, 1,
1.898086, 2.366023, 0.06364781, 1, 0, 0.2235294, 1,
1.900706, 1.404943, -0.3914089, 1, 0, 0.2156863, 1,
1.903253, 1.281777, 2.016229, 1, 0, 0.2117647, 1,
1.919955, -0.1631571, 1.146583, 1, 0, 0.2039216, 1,
1.924296, 0.1539245, 1.175697, 1, 0, 0.1960784, 1,
1.924469, -1.341598, 1.900226, 1, 0, 0.1921569, 1,
1.937777, -0.319818, 3.062435, 1, 0, 0.1843137, 1,
2.00349, 1.505411, -0.04962028, 1, 0, 0.1803922, 1,
2.01978, -0.4907844, 1.72642, 1, 0, 0.172549, 1,
2.020033, 0.158108, 1.114683, 1, 0, 0.1686275, 1,
2.031052, -0.07821997, 1.589965, 1, 0, 0.1607843, 1,
2.036118, -1.183976, 4.033453, 1, 0, 0.1568628, 1,
2.082049, 1.10516, 0.3986575, 1, 0, 0.1490196, 1,
2.094976, 0.1538651, 1.574217, 1, 0, 0.145098, 1,
2.09773, 0.6410811, -0.1602083, 1, 0, 0.1372549, 1,
2.11463, 0.7899104, 1.71192, 1, 0, 0.1333333, 1,
2.121852, 0.1910762, 1.370485, 1, 0, 0.1254902, 1,
2.15497, -1.325401, 1.716222, 1, 0, 0.1215686, 1,
2.16578, -0.3521569, 1.998522, 1, 0, 0.1137255, 1,
2.172089, 0.6756067, 0.33224, 1, 0, 0.1098039, 1,
2.274865, 0.2064989, 2.104894, 1, 0, 0.1019608, 1,
2.286858, -0.9098648, 3.058627, 1, 0, 0.09411765, 1,
2.317468, 0.5688387, -0.8454518, 1, 0, 0.09019608, 1,
2.3347, -0.6267363, 2.790303, 1, 0, 0.08235294, 1,
2.407656, 0.6746687, 1.378327, 1, 0, 0.07843138, 1,
2.473924, -1.645356, 0.3189484, 1, 0, 0.07058824, 1,
2.496106, 1.016288, -0.8598527, 1, 0, 0.06666667, 1,
2.496532, -0.7592273, 1.986326, 1, 0, 0.05882353, 1,
2.570221, -1.970204, 2.717113, 1, 0, 0.05490196, 1,
2.73804, 1.013775, 1.260547, 1, 0, 0.04705882, 1,
2.778742, -0.2176867, 3.849325, 1, 0, 0.04313726, 1,
2.854376, 1.33533, -0.639984, 1, 0, 0.03529412, 1,
2.895113, -0.05444792, 1.34089, 1, 0, 0.03137255, 1,
2.912104, 2.348944, -0.3679963, 1, 0, 0.02352941, 1,
2.937887, -0.9661736, 4.390333, 1, 0, 0.01960784, 1,
3.035396, -1.268071, 1.315779, 1, 0, 0.01176471, 1,
3.521925, 1.217004, -1.155874, 1, 0, 0.007843138, 1
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
0.0089432, -3.723945, -7.225842, 0, -0.5, 0.5, 0.5,
0.0089432, -3.723945, -7.225842, 1, -0.5, 0.5, 0.5,
0.0089432, -3.723945, -7.225842, 1, 1.5, 0.5, 0.5,
0.0089432, -3.723945, -7.225842, 0, 1.5, 0.5, 0.5
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
-4.69494, 0.2023771, -7.225842, 0, -0.5, 0.5, 0.5,
-4.69494, 0.2023771, -7.225842, 1, -0.5, 0.5, 0.5,
-4.69494, 0.2023771, -7.225842, 1, 1.5, 0.5, 0.5,
-4.69494, 0.2023771, -7.225842, 0, 1.5, 0.5, 0.5
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
-4.69494, -3.723945, 0.04614472, 0, -0.5, 0.5, 0.5,
-4.69494, -3.723945, 0.04614472, 1, -0.5, 0.5, 0.5,
-4.69494, -3.723945, 0.04614472, 1, 1.5, 0.5, 0.5,
-4.69494, -3.723945, 0.04614472, 0, 1.5, 0.5, 0.5
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
-2, -2.81787, -5.547691,
2, -2.81787, -5.547691,
-2, -2.81787, -5.547691,
-2, -2.968883, -5.827383,
0, -2.81787, -5.547691,
0, -2.968883, -5.827383,
2, -2.81787, -5.547691,
2, -2.968883, -5.827383
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
"0",
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
-2, -3.270908, -6.386767, 0, -0.5, 0.5, 0.5,
-2, -3.270908, -6.386767, 1, -0.5, 0.5, 0.5,
-2, -3.270908, -6.386767, 1, 1.5, 0.5, 0.5,
-2, -3.270908, -6.386767, 0, 1.5, 0.5, 0.5,
0, -3.270908, -6.386767, 0, -0.5, 0.5, 0.5,
0, -3.270908, -6.386767, 1, -0.5, 0.5, 0.5,
0, -3.270908, -6.386767, 1, 1.5, 0.5, 0.5,
0, -3.270908, -6.386767, 0, 1.5, 0.5, 0.5,
2, -3.270908, -6.386767, 0, -0.5, 0.5, 0.5,
2, -3.270908, -6.386767, 1, -0.5, 0.5, 0.5,
2, -3.270908, -6.386767, 1, 1.5, 0.5, 0.5,
2, -3.270908, -6.386767, 0, 1.5, 0.5, 0.5
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
-3.609428, -2, -5.547691,
-3.609428, 3, -5.547691,
-3.609428, -2, -5.547691,
-3.790347, -2, -5.827383,
-3.609428, -1, -5.547691,
-3.790347, -1, -5.827383,
-3.609428, 0, -5.547691,
-3.790347, 0, -5.827383,
-3.609428, 1, -5.547691,
-3.790347, 1, -5.827383,
-3.609428, 2, -5.547691,
-3.790347, 2, -5.827383,
-3.609428, 3, -5.547691,
-3.790347, 3, -5.827383
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
-4.152184, -2, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, -2, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, -2, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, -2, -6.386767, 0, 1.5, 0.5, 0.5,
-4.152184, -1, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, -1, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, -1, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, -1, -6.386767, 0, 1.5, 0.5, 0.5,
-4.152184, 0, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, 0, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, 0, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, 0, -6.386767, 0, 1.5, 0.5, 0.5,
-4.152184, 1, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, 1, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, 1, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, 1, -6.386767, 0, 1.5, 0.5, 0.5,
-4.152184, 2, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, 2, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, 2, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, 2, -6.386767, 0, 1.5, 0.5, 0.5,
-4.152184, 3, -6.386767, 0, -0.5, 0.5, 0.5,
-4.152184, 3, -6.386767, 1, -0.5, 0.5, 0.5,
-4.152184, 3, -6.386767, 1, 1.5, 0.5, 0.5,
-4.152184, 3, -6.386767, 0, 1.5, 0.5, 0.5
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
-3.609428, -2.81787, -4,
-3.609428, -2.81787, 4,
-3.609428, -2.81787, -4,
-3.790347, -2.968883, -4,
-3.609428, -2.81787, -2,
-3.790347, -2.968883, -2,
-3.609428, -2.81787, 0,
-3.790347, -2.968883, 0,
-3.609428, -2.81787, 2,
-3.790347, -2.968883, 2,
-3.609428, -2.81787, 4,
-3.790347, -2.968883, 4
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
-4.152184, -3.270908, -4, 0, -0.5, 0.5, 0.5,
-4.152184, -3.270908, -4, 1, -0.5, 0.5, 0.5,
-4.152184, -3.270908, -4, 1, 1.5, 0.5, 0.5,
-4.152184, -3.270908, -4, 0, 1.5, 0.5, 0.5,
-4.152184, -3.270908, -2, 0, -0.5, 0.5, 0.5,
-4.152184, -3.270908, -2, 1, -0.5, 0.5, 0.5,
-4.152184, -3.270908, -2, 1, 1.5, 0.5, 0.5,
-4.152184, -3.270908, -2, 0, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 0, 0, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 0, 1, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 0, 1, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 0, 0, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 2, 0, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 2, 1, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 2, 1, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 2, 0, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 4, 0, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 4, 1, -0.5, 0.5, 0.5,
-4.152184, -3.270908, 4, 1, 1.5, 0.5, 0.5,
-4.152184, -3.270908, 4, 0, 1.5, 0.5, 0.5
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
-3.609428, -2.81787, -5.547691,
-3.609428, 3.222625, -5.547691,
-3.609428, -2.81787, 5.639981,
-3.609428, 3.222625, 5.639981,
-3.609428, -2.81787, -5.547691,
-3.609428, -2.81787, 5.639981,
-3.609428, 3.222625, -5.547691,
-3.609428, 3.222625, 5.639981,
-3.609428, -2.81787, -5.547691,
3.627315, -2.81787, -5.547691,
-3.609428, -2.81787, 5.639981,
3.627315, -2.81787, 5.639981,
-3.609428, 3.222625, -5.547691,
3.627315, 3.222625, -5.547691,
-3.609428, 3.222625, 5.639981,
3.627315, 3.222625, 5.639981,
3.627315, -2.81787, -5.547691,
3.627315, 3.222625, -5.547691,
3.627315, -2.81787, 5.639981,
3.627315, 3.222625, 5.639981,
3.627315, -2.81787, -5.547691,
3.627315, -2.81787, 5.639981,
3.627315, 3.222625, -5.547691,
3.627315, 3.222625, 5.639981
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
var radius = 7.811865;
var distance = 34.75587;
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
mvMatrix.translate( -0.0089432, -0.2023771, -0.04614472 );
mvMatrix.scale( 1.167147, 1.398286, 0.7549686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.75587);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
triflumuron<-read.table("triflumuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflumuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
```

```r
y<-triflumuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
```

```r
z<-triflumuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
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
-3.504039, 0.02247601, -2.936555, 0, 0, 1, 1, 1,
-3.185688, -0.2362005, -1.749405, 1, 0, 0, 1, 1,
-2.87729, 0.05327643, -0.8081501, 1, 0, 0, 1, 1,
-2.872848, 0.4266836, -1.674841, 1, 0, 0, 1, 1,
-2.800961, 2.775337, -0.798835, 1, 0, 0, 1, 1,
-2.721091, -1.097304, -1.133349, 1, 0, 0, 1, 1,
-2.637904, -0.6654438, -3.12215, 0, 0, 0, 1, 1,
-2.604109, -0.9260978, -2.482874, 0, 0, 0, 1, 1,
-2.538388, -0.9467443, -1.359608, 0, 0, 0, 1, 1,
-2.525266, -0.9289717, -2.725919, 0, 0, 0, 1, 1,
-2.462523, 1.496929, -1.753057, 0, 0, 0, 1, 1,
-2.44581, -1.60234, -2.980987, 0, 0, 0, 1, 1,
-2.334005, 1.010402, -1.405032, 0, 0, 0, 1, 1,
-2.301251, 0.8998989, -0.7171198, 1, 1, 1, 1, 1,
-2.273266, 0.0002616615, -1.435809, 1, 1, 1, 1, 1,
-2.228106, 0.3285286, -1.629237, 1, 1, 1, 1, 1,
-2.177382, -0.3019197, -1.753569, 1, 1, 1, 1, 1,
-2.162615, -0.2610192, -0.7874247, 1, 1, 1, 1, 1,
-2.047951, -0.7146116, -0.8707829, 1, 1, 1, 1, 1,
-2.04745, -0.003061083, -1.441169, 1, 1, 1, 1, 1,
-2.029209, -1.337275, -2.590364, 1, 1, 1, 1, 1,
-1.996988, 0.976522, -2.033682, 1, 1, 1, 1, 1,
-1.982848, 0.2975455, -2.75074, 1, 1, 1, 1, 1,
-1.951402, 1.000909, -2.014154, 1, 1, 1, 1, 1,
-1.930089, -0.7107255, -1.194787, 1, 1, 1, 1, 1,
-1.91344, 1.814564, -1.855716, 1, 1, 1, 1, 1,
-1.878842, 0.1547263, -2.328084, 1, 1, 1, 1, 1,
-1.856474, -1.112485, -2.739688, 1, 1, 1, 1, 1,
-1.836895, -0.1410289, -1.878944, 0, 0, 1, 1, 1,
-1.82048, 1.616646, 0.07906534, 1, 0, 0, 1, 1,
-1.820122, 0.2837312, -1.66211, 1, 0, 0, 1, 1,
-1.817421, 1.844872, -2.021385, 1, 0, 0, 1, 1,
-1.806184, -0.5150374, -1.538421, 1, 0, 0, 1, 1,
-1.800762, 0.6039762, -1.620737, 1, 0, 0, 1, 1,
-1.792422, 0.1636523, -1.621732, 0, 0, 0, 1, 1,
-1.787004, -0.2652998, -1.608003, 0, 0, 0, 1, 1,
-1.786307, 0.3501381, -0.7289405, 0, 0, 0, 1, 1,
-1.766343, -0.3708132, -1.788629, 0, 0, 0, 1, 1,
-1.75298, 1.417071, -0.8673351, 0, 0, 0, 1, 1,
-1.750993, 0.6770198, -0.7300917, 0, 0, 0, 1, 1,
-1.745612, -0.3503865, -1.630666, 0, 0, 0, 1, 1,
-1.723449, 0.3724767, 0.7958583, 1, 1, 1, 1, 1,
-1.721996, 0.6019584, -2.091895, 1, 1, 1, 1, 1,
-1.696805, -0.8414033, -3.427088, 1, 1, 1, 1, 1,
-1.695114, 0.3251736, 0.7212622, 1, 1, 1, 1, 1,
-1.686204, 0.6692451, -0.2563035, 1, 1, 1, 1, 1,
-1.684309, -0.9500189, -1.747865, 1, 1, 1, 1, 1,
-1.680374, 0.2497446, -1.306721, 1, 1, 1, 1, 1,
-1.660727, -1.266396, -1.780284, 1, 1, 1, 1, 1,
-1.645179, -1.317119, -1.245891, 1, 1, 1, 1, 1,
-1.640601, 1.362719, -1.470422, 1, 1, 1, 1, 1,
-1.640293, 0.9291689, 0.1370471, 1, 1, 1, 1, 1,
-1.626927, -1.151959, -2.780408, 1, 1, 1, 1, 1,
-1.596128, 1.214023, -0.3437946, 1, 1, 1, 1, 1,
-1.595691, 1.392963, -0.4979488, 1, 1, 1, 1, 1,
-1.582559, -0.1489579, -1.820528, 1, 1, 1, 1, 1,
-1.560157, 1.068276, -0.4868546, 0, 0, 1, 1, 1,
-1.559471, -0.2986809, -0.9863633, 1, 0, 0, 1, 1,
-1.55769, 0.0766366, -0.6746584, 1, 0, 0, 1, 1,
-1.555164, -0.2438097, -2.390955, 1, 0, 0, 1, 1,
-1.552597, -0.1028432, -0.7753198, 1, 0, 0, 1, 1,
-1.546147, 1.121816, -0.6658415, 1, 0, 0, 1, 1,
-1.539602, 0.7696277, -0.7304391, 0, 0, 0, 1, 1,
-1.529353, -1.006231, -1.329701, 0, 0, 0, 1, 1,
-1.518823, -0.1832706, -2.056105, 0, 0, 0, 1, 1,
-1.508019, -0.2704542, -2.884899, 0, 0, 0, 1, 1,
-1.49041, -1.714064, -1.940171, 0, 0, 0, 1, 1,
-1.490317, -0.2437639, -0.4144455, 0, 0, 0, 1, 1,
-1.474278, 0.1960887, -1.207297, 0, 0, 0, 1, 1,
-1.474228, 0.1884523, -2.393766, 1, 1, 1, 1, 1,
-1.459302, 1.283516, -2.103623, 1, 1, 1, 1, 1,
-1.452133, -0.6801516, -1.61243, 1, 1, 1, 1, 1,
-1.450451, 0.6911337, -2.45604, 1, 1, 1, 1, 1,
-1.445638, -0.204496, -1.064221, 1, 1, 1, 1, 1,
-1.422855, 1.974433, -2.622012, 1, 1, 1, 1, 1,
-1.420736, -0.3877153, -2.703521, 1, 1, 1, 1, 1,
-1.41576, 0.8887434, -1.982859, 1, 1, 1, 1, 1,
-1.410456, -0.5981169, -0.7813874, 1, 1, 1, 1, 1,
-1.403086, -0.1598055, -3.793922, 1, 1, 1, 1, 1,
-1.402509, 1.836971, -1.287664, 1, 1, 1, 1, 1,
-1.402413, 1.88309, -1.137643, 1, 1, 1, 1, 1,
-1.392272, -0.02855333, -1.629472, 1, 1, 1, 1, 1,
-1.384032, -0.2558533, -1.413337, 1, 1, 1, 1, 1,
-1.383156, 0.8580894, -0.1489207, 1, 1, 1, 1, 1,
-1.380114, -2.146052, -2.479287, 0, 0, 1, 1, 1,
-1.372643, 0.18007, -1.580585, 1, 0, 0, 1, 1,
-1.362709, 0.09316237, -1.5348, 1, 0, 0, 1, 1,
-1.362164, 0.5519701, -1.38511, 1, 0, 0, 1, 1,
-1.355432, 0.3082035, -1.655853, 1, 0, 0, 1, 1,
-1.353707, 1.123541, 0.3546076, 1, 0, 0, 1, 1,
-1.35016, -0.6622638, -1.600852, 0, 0, 0, 1, 1,
-1.347639, -1.032805, -1.33362, 0, 0, 0, 1, 1,
-1.34574, 0.5411224, -1.484339, 0, 0, 0, 1, 1,
-1.34262, 0.1237801, -0.8730293, 0, 0, 0, 1, 1,
-1.339018, -1.167538, -1.094958, 0, 0, 0, 1, 1,
-1.334742, -0.3470045, -0.7389774, 0, 0, 0, 1, 1,
-1.311921, 0.2670965, -1.596864, 0, 0, 0, 1, 1,
-1.297633, -0.1632411, -0.02108303, 1, 1, 1, 1, 1,
-1.289971, -0.4280041, -1.868299, 1, 1, 1, 1, 1,
-1.288034, -1.174182, -1.396245, 1, 1, 1, 1, 1,
-1.284221, 1.5172, 0.1597877, 1, 1, 1, 1, 1,
-1.281456, -1.67992, -3.75027, 1, 1, 1, 1, 1,
-1.275128, -0.3308659, -3.146522, 1, 1, 1, 1, 1,
-1.272845, -0.2971444, -0.1258849, 1, 1, 1, 1, 1,
-1.266713, 0.03980653, 1.05441, 1, 1, 1, 1, 1,
-1.265297, 0.5355548, -1.897136, 1, 1, 1, 1, 1,
-1.26387, -0.5156252, -3.032291, 1, 1, 1, 1, 1,
-1.256859, -1.536746, -2.650348, 1, 1, 1, 1, 1,
-1.252865, 0.006087795, -0.9168182, 1, 1, 1, 1, 1,
-1.238213, -0.6372163, -1.570481, 1, 1, 1, 1, 1,
-1.237223, 0.5576535, -0.6332319, 1, 1, 1, 1, 1,
-1.236703, 0.3064889, -1.570144, 1, 1, 1, 1, 1,
-1.233837, 0.4999352, -1.021801, 0, 0, 1, 1, 1,
-1.230773, -0.327129, -1.694761, 1, 0, 0, 1, 1,
-1.229941, 1.161223, -1.854563, 1, 0, 0, 1, 1,
-1.217006, 2.216427, -0.7807275, 1, 0, 0, 1, 1,
-1.215265, -1.900464, -1.27865, 1, 0, 0, 1, 1,
-1.215211, 0.2321759, -1.270913, 1, 0, 0, 1, 1,
-1.206654, 0.7942933, -1.101352, 0, 0, 0, 1, 1,
-1.198694, 0.3890677, -1.97958, 0, 0, 0, 1, 1,
-1.198468, 0.2751394, -1.732361, 0, 0, 0, 1, 1,
-1.19673, 0.8450279, 0.3161743, 0, 0, 0, 1, 1,
-1.194116, 3.134656, 0.519096, 0, 0, 0, 1, 1,
-1.187723, -0.3269953, -1.825679, 0, 0, 0, 1, 1,
-1.184968, -0.05990425, -1.250743, 0, 0, 0, 1, 1,
-1.179878, -0.6629849, -3.157794, 1, 1, 1, 1, 1,
-1.17439, -1.313224, -1.914458, 1, 1, 1, 1, 1,
-1.166075, 0.707391, 0.9890829, 1, 1, 1, 1, 1,
-1.153845, -0.5484983, -2.962912, 1, 1, 1, 1, 1,
-1.148478, -0.6922275, -3.331411, 1, 1, 1, 1, 1,
-1.143, -0.4800129, -1.369317, 1, 1, 1, 1, 1,
-1.140275, 0.9218168, -1.840084, 1, 1, 1, 1, 1,
-1.137585, -1.287631, -2.285875, 1, 1, 1, 1, 1,
-1.137072, 0.08225798, -1.630725, 1, 1, 1, 1, 1,
-1.131809, -2.060064, -2.593647, 1, 1, 1, 1, 1,
-1.124205, -1.111712, -1.906838, 1, 1, 1, 1, 1,
-1.119367, 1.433858, -0.1754398, 1, 1, 1, 1, 1,
-1.115275, 3.003565, 0.6068696, 1, 1, 1, 1, 1,
-1.113868, 0.7297518, -1.040163, 1, 1, 1, 1, 1,
-1.111543, 1.925192, -0.05253312, 1, 1, 1, 1, 1,
-1.11041, -0.6949508, -3.726064, 0, 0, 1, 1, 1,
-1.09908, -0.01038363, 0.6195487, 1, 0, 0, 1, 1,
-1.090425, 0.8234751, -0.5015352, 1, 0, 0, 1, 1,
-1.087804, -0.1980046, -2.179125, 1, 0, 0, 1, 1,
-1.07965, -0.1809078, -0.8415418, 1, 0, 0, 1, 1,
-1.063443, 1.537041, 0.1083715, 1, 0, 0, 1, 1,
-1.061583, 0.2398845, -1.20332, 0, 0, 0, 1, 1,
-1.061581, 0.7569404, -0.2901851, 0, 0, 0, 1, 1,
-1.05903, 0.8634116, -0.8940345, 0, 0, 0, 1, 1,
-1.058515, -0.2426472, 0.4482099, 0, 0, 0, 1, 1,
-1.056972, -0.7158497, -2.595293, 0, 0, 0, 1, 1,
-1.052142, -1.462163, -2.621545, 0, 0, 0, 1, 1,
-1.043611, -1.795441, -3.041208, 0, 0, 0, 1, 1,
-1.040349, 0.0872432, -0.7800179, 1, 1, 1, 1, 1,
-1.03716, 0.374353, -0.3698695, 1, 1, 1, 1, 1,
-1.030378, 0.9813518, -1.499329, 1, 1, 1, 1, 1,
-1.024728, 1.330016, 0.09262209, 1, 1, 1, 1, 1,
-1.02351, -1.159165, -2.473849, 1, 1, 1, 1, 1,
-1.023108, -0.3240283, -1.381432, 1, 1, 1, 1, 1,
-1.016842, 0.9686201, 1.186371, 1, 1, 1, 1, 1,
-1.014366, -0.2225051, -2.353559, 1, 1, 1, 1, 1,
-1.011656, -1.722541, -2.461138, 1, 1, 1, 1, 1,
-1.001156, -0.5218209, -1.548245, 1, 1, 1, 1, 1,
-0.999573, -0.4998764, -0.6540255, 1, 1, 1, 1, 1,
-0.9946453, -0.7968441, -1.772988, 1, 1, 1, 1, 1,
-0.9789731, -0.05819801, -2.114424, 1, 1, 1, 1, 1,
-0.9786944, 0.2743061, -2.356366, 1, 1, 1, 1, 1,
-0.9718145, 0.441587, -2.238281, 1, 1, 1, 1, 1,
-0.9696994, 0.5489234, -1.217301, 0, 0, 1, 1, 1,
-0.9578932, -1.250708, -1.726786, 1, 0, 0, 1, 1,
-0.9574448, -0.7552981, -3.415091, 1, 0, 0, 1, 1,
-0.9567512, -0.08469766, -1.085715, 1, 0, 0, 1, 1,
-0.9552557, -0.2972621, -2.305958, 1, 0, 0, 1, 1,
-0.9536417, 1.431242, -1.323613, 1, 0, 0, 1, 1,
-0.9534248, -0.1584622, -2.37429, 0, 0, 0, 1, 1,
-0.9501957, -1.021091, 0.2680258, 0, 0, 0, 1, 1,
-0.9485041, 0.1392222, -1.323045, 0, 0, 0, 1, 1,
-0.944686, -1.831632, -2.945202, 0, 0, 0, 1, 1,
-0.943783, 0.8640685, 0.9838859, 0, 0, 0, 1, 1,
-0.9377939, 0.9869624, -1.36394, 0, 0, 0, 1, 1,
-0.9350086, 1.938946, -0.1582274, 0, 0, 0, 1, 1,
-0.9341671, -1.247524, -1.32224, 1, 1, 1, 1, 1,
-0.92992, -1.818548, -3.433365, 1, 1, 1, 1, 1,
-0.9187117, -0.4073553, -2.422088, 1, 1, 1, 1, 1,
-0.9183909, 0.09105559, -0.5448877, 1, 1, 1, 1, 1,
-0.9137171, -1.850341, -1.756651, 1, 1, 1, 1, 1,
-0.9121482, 0.04057895, -3.502133, 1, 1, 1, 1, 1,
-0.910278, 0.1476966, -1.921799, 1, 1, 1, 1, 1,
-0.9060095, 0.8589458, -1.903002, 1, 1, 1, 1, 1,
-0.9017895, -0.5841717, -2.906956, 1, 1, 1, 1, 1,
-0.8998035, -0.5409843, -2.325524, 1, 1, 1, 1, 1,
-0.8918448, 0.2772821, -0.4601066, 1, 1, 1, 1, 1,
-0.8813913, -1.675967, -3.431392, 1, 1, 1, 1, 1,
-0.8792337, 0.3123642, 0.1777856, 1, 1, 1, 1, 1,
-0.8725907, 1.569427, 0.7153705, 1, 1, 1, 1, 1,
-0.8707048, 0.9221067, -2.148203, 1, 1, 1, 1, 1,
-0.8684546, -0.5038019, -1.990097, 0, 0, 1, 1, 1,
-0.8623352, 1.657251, -1.079376, 1, 0, 0, 1, 1,
-0.8584073, 0.7157362, -1.793239, 1, 0, 0, 1, 1,
-0.8561049, -2.120608, -2.996569, 1, 0, 0, 1, 1,
-0.8550372, 0.1358442, 0.9839302, 1, 0, 0, 1, 1,
-0.851096, 0.4727429, -1.238057, 1, 0, 0, 1, 1,
-0.8510079, 1.009063, -0.8083009, 0, 0, 0, 1, 1,
-0.8476671, -0.0829677, -1.513475, 0, 0, 0, 1, 1,
-0.8448833, -0.03139052, -0.6811632, 0, 0, 0, 1, 1,
-0.842663, 1.216262, -1.305275, 0, 0, 0, 1, 1,
-0.8361984, -0.2896784, -3.723257, 0, 0, 0, 1, 1,
-0.8328239, 0.2334959, -1.526245, 0, 0, 0, 1, 1,
-0.8230625, 0.6404688, -1.190393, 0, 0, 0, 1, 1,
-0.8156931, 1.454386, -2.096624, 1, 1, 1, 1, 1,
-0.8128245, 2.96295, 1.291782, 1, 1, 1, 1, 1,
-0.8124999, -0.1584124, -3.744431, 1, 1, 1, 1, 1,
-0.8091019, -2.553909, -2.369078, 1, 1, 1, 1, 1,
-0.8068282, -0.351514, -0.8890001, 1, 1, 1, 1, 1,
-0.8051401, 0.7395561, -2.780288, 1, 1, 1, 1, 1,
-0.8045664, 2.030702, 0.9232918, 1, 1, 1, 1, 1,
-0.8034083, 0.4092632, -0.8442708, 1, 1, 1, 1, 1,
-0.7955408, -1.121139, -3.420755, 1, 1, 1, 1, 1,
-0.794055, 0.06187019, -2.260612, 1, 1, 1, 1, 1,
-0.7876229, 0.03730886, -1.276427, 1, 1, 1, 1, 1,
-0.7860869, 0.6346979, -1.958479, 1, 1, 1, 1, 1,
-0.7840056, -0.2785822, -1.775929, 1, 1, 1, 1, 1,
-0.7784822, -1.482905, -3.719018, 1, 1, 1, 1, 1,
-0.7778892, 0.07715902, -0.6573245, 1, 1, 1, 1, 1,
-0.7769006, 0.2194023, -0.1037419, 0, 0, 1, 1, 1,
-0.775853, -0.2082102, -2.576922, 1, 0, 0, 1, 1,
-0.7752538, -1.390284, -3.520226, 1, 0, 0, 1, 1,
-0.7745507, 0.3725523, -0.7157675, 1, 0, 0, 1, 1,
-0.7621734, -1.115256, -2.831371, 1, 0, 0, 1, 1,
-0.7611136, -0.4837958, -1.309803, 1, 0, 0, 1, 1,
-0.7600738, -1.626352, -2.987051, 0, 0, 0, 1, 1,
-0.7549955, 0.03107036, 0.04108692, 0, 0, 0, 1, 1,
-0.7539473, -0.9056715, -1.283969, 0, 0, 0, 1, 1,
-0.7531745, 1.347462, -1.250791, 0, 0, 0, 1, 1,
-0.7529575, -2.230335, -3.504757, 0, 0, 0, 1, 1,
-0.7489019, -1.064027, -3.332796, 0, 0, 0, 1, 1,
-0.7479247, 1.207446, -1.679262, 0, 0, 0, 1, 1,
-0.7440352, -0.07064772, -2.196201, 1, 1, 1, 1, 1,
-0.7431054, 0.4076225, -2.624981, 1, 1, 1, 1, 1,
-0.7420202, -2.103825, -3.100501, 1, 1, 1, 1, 1,
-0.7402477, -0.4834371, -0.6859111, 1, 1, 1, 1, 1,
-0.7389891, -0.3060794, -2.813153, 1, 1, 1, 1, 1,
-0.7383091, -0.8718942, -1.335498, 1, 1, 1, 1, 1,
-0.7287351, 0.7596247, -2.528004, 1, 1, 1, 1, 1,
-0.7249767, -0.3275304, -4.628726, 1, 1, 1, 1, 1,
-0.7227877, -0.2047867, -1.919426, 1, 1, 1, 1, 1,
-0.7154385, 0.6487496, 0.2141941, 1, 1, 1, 1, 1,
-0.7132415, -1.196996, 0.3741351, 1, 1, 1, 1, 1,
-0.7124336, 0.1511135, -3.693297, 1, 1, 1, 1, 1,
-0.7023492, -0.2086327, -2.549301, 1, 1, 1, 1, 1,
-0.6981304, -0.3829585, -3.386261, 1, 1, 1, 1, 1,
-0.696068, -0.1487219, -1.984584, 1, 1, 1, 1, 1,
-0.6946611, -0.116596, -2.727238, 0, 0, 1, 1, 1,
-0.6910706, 2.398226, 0.180659, 1, 0, 0, 1, 1,
-0.6874831, -1.693775, -3.041958, 1, 0, 0, 1, 1,
-0.6851252, -2.414662, -2.823057, 1, 0, 0, 1, 1,
-0.679465, 0.1404488, -1.238896, 1, 0, 0, 1, 1,
-0.6780161, -1.426787, -3.953155, 1, 0, 0, 1, 1,
-0.6749577, -1.191957, -3.595029, 0, 0, 0, 1, 1,
-0.6656919, -1.000148, -1.697199, 0, 0, 0, 1, 1,
-0.6632256, 0.6367465, 0.4531311, 0, 0, 0, 1, 1,
-0.6624323, 0.9691113, -0.5985575, 0, 0, 0, 1, 1,
-0.6623628, 1.650138, 0.2258439, 0, 0, 0, 1, 1,
-0.6610553, 2.23715, 1.041458, 0, 0, 0, 1, 1,
-0.660551, -0.2630416, -1.115408, 0, 0, 0, 1, 1,
-0.6603776, -1.440088, -3.254636, 1, 1, 1, 1, 1,
-0.6595343, 0.9688432, -1.409634, 1, 1, 1, 1, 1,
-0.65862, 0.9934586, -0.4984142, 1, 1, 1, 1, 1,
-0.6508331, -2.294566, -1.017661, 1, 1, 1, 1, 1,
-0.6489897, 0.006963347, -2.730137, 1, 1, 1, 1, 1,
-0.6477711, 0.6601878, -1.178393, 1, 1, 1, 1, 1,
-0.6438479, 0.2814544, -1.314984, 1, 1, 1, 1, 1,
-0.6434441, -0.3286388, -2.723428, 1, 1, 1, 1, 1,
-0.6383057, 0.6281549, -1.520757, 1, 1, 1, 1, 1,
-0.6336805, -1.394292, -1.98893, 1, 1, 1, 1, 1,
-0.6296806, -1.204012, -3.898006, 1, 1, 1, 1, 1,
-0.6261165, -0.2044004, -1.86316, 1, 1, 1, 1, 1,
-0.6259359, -0.8014618, -2.361708, 1, 1, 1, 1, 1,
-0.6222754, 0.5685282, -1.446708, 1, 1, 1, 1, 1,
-0.6212834, 0.9688189, 0.4335231, 1, 1, 1, 1, 1,
-0.6175411, -0.216866, -3.518086, 0, 0, 1, 1, 1,
-0.6084323, 1.050269, -0.2943474, 1, 0, 0, 1, 1,
-0.6076621, -2.648115, -3.102761, 1, 0, 0, 1, 1,
-0.6053165, 0.3611927, -1.711818, 1, 0, 0, 1, 1,
-0.6024317, 0.629456, -0.01992805, 1, 0, 0, 1, 1,
-0.601905, -1.368194, -3.958751, 1, 0, 0, 1, 1,
-0.6012903, -1.633644, -2.831042, 0, 0, 0, 1, 1,
-0.6011035, 0.2053355, -0.5929847, 0, 0, 0, 1, 1,
-0.5984964, -0.09702121, -0.2228912, 0, 0, 0, 1, 1,
-0.5980699, -0.3716274, -1.682467, 0, 0, 0, 1, 1,
-0.597919, 0.1777247, -1.487438, 0, 0, 0, 1, 1,
-0.5957705, -1.974123, -0.8354312, 0, 0, 0, 1, 1,
-0.589597, 1.698082, -1.019015, 0, 0, 0, 1, 1,
-0.5856814, 0.04072541, -2.110754, 1, 1, 1, 1, 1,
-0.5847211, -0.1976299, -2.823388, 1, 1, 1, 1, 1,
-0.5822122, 0.3160118, -1.840966, 1, 1, 1, 1, 1,
-0.5816993, 1.41248, 1.176759, 1, 1, 1, 1, 1,
-0.5798813, -0.2969747, -1.498085, 1, 1, 1, 1, 1,
-0.5791473, -0.6312944, -2.014968, 1, 1, 1, 1, 1,
-0.5721685, -1.170549, -2.239103, 1, 1, 1, 1, 1,
-0.567935, 0.9793978, -0.7202159, 1, 1, 1, 1, 1,
-0.567644, 0.401476, -1.969222, 1, 1, 1, 1, 1,
-0.5584377, 0.9686023, -0.7215751, 1, 1, 1, 1, 1,
-0.5548258, -0.6067371, -0.7211818, 1, 1, 1, 1, 1,
-0.5547132, -0.1535594, -1.810423, 1, 1, 1, 1, 1,
-0.5544409, -0.9230707, -1.589928, 1, 1, 1, 1, 1,
-0.5542818, 0.5211102, -0.214933, 1, 1, 1, 1, 1,
-0.5538304, 1.122824, 1.426002, 1, 1, 1, 1, 1,
-0.5452572, -0.5490823, -2.44443, 0, 0, 1, 1, 1,
-0.5439501, 0.7349156, -1.769065, 1, 0, 0, 1, 1,
-0.5376385, 0.9582317, 0.3578311, 1, 0, 0, 1, 1,
-0.5348467, 1.546796, -0.8778999, 1, 0, 0, 1, 1,
-0.5338141, -0.1401742, -1.821502, 1, 0, 0, 1, 1,
-0.5315999, -1.587446, -1.739611, 1, 0, 0, 1, 1,
-0.5276801, -0.6140184, -2.17207, 0, 0, 0, 1, 1,
-0.526324, 1.782893, -0.1889872, 0, 0, 0, 1, 1,
-0.5250375, -0.4658285, -1.613368, 0, 0, 0, 1, 1,
-0.5206337, -1.410743, -2.420644, 0, 0, 0, 1, 1,
-0.5132561, -0.9834146, -2.241088, 0, 0, 0, 1, 1,
-0.5104876, -0.9662865, -1.696451, 0, 0, 0, 1, 1,
-0.5092313, 0.3060293, -0.3528827, 0, 0, 0, 1, 1,
-0.5078583, 0.270326, 0.06774311, 1, 1, 1, 1, 1,
-0.5035731, 0.3048845, -2.242682, 1, 1, 1, 1, 1,
-0.5018696, 0.4208614, -1.065391, 1, 1, 1, 1, 1,
-0.4968107, 1.868226, -1.431641, 1, 1, 1, 1, 1,
-0.4879954, 0.3148227, -2.311249, 1, 1, 1, 1, 1,
-0.4851117, 0.673416, -0.6997969, 1, 1, 1, 1, 1,
-0.4836507, 0.1833918, -1.916834, 1, 1, 1, 1, 1,
-0.4827205, -0.7268097, -4.730532, 1, 1, 1, 1, 1,
-0.4826217, 0.001971765, 0.4423724, 1, 1, 1, 1, 1,
-0.4817144, 0.5388321, 0.3058152, 1, 1, 1, 1, 1,
-0.4694259, 1.126298, 0.8275411, 1, 1, 1, 1, 1,
-0.4673187, -1.043417, -2.386156, 1, 1, 1, 1, 1,
-0.4639392, 0.5716743, -0.173167, 1, 1, 1, 1, 1,
-0.4637055, -1.27801, -3.298262, 1, 1, 1, 1, 1,
-0.4635659, 0.006606889, -0.6033118, 1, 1, 1, 1, 1,
-0.4464355, -0.1946741, -1.818603, 0, 0, 1, 1, 1,
-0.4454615, -0.04923234, -0.7336845, 1, 0, 0, 1, 1,
-0.4451699, 0.6388633, -0.7207665, 1, 0, 0, 1, 1,
-0.4449438, 0.005581883, -1.820961, 1, 0, 0, 1, 1,
-0.4398007, 1.629718, 0.5530587, 1, 0, 0, 1, 1,
-0.4366989, 0.4214592, -1.55265, 1, 0, 0, 1, 1,
-0.4347053, 0.3651667, 1.224831, 0, 0, 0, 1, 1,
-0.4257192, -0.3526658, -0.05445048, 0, 0, 0, 1, 1,
-0.423102, 0.09383093, 0.08581237, 0, 0, 0, 1, 1,
-0.4230739, 0.9799263, -0.2044466, 0, 0, 0, 1, 1,
-0.4146839, -1.090926, -2.674529, 0, 0, 0, 1, 1,
-0.4140906, 1.194868, -1.161754, 0, 0, 0, 1, 1,
-0.4136558, 0.8347895, 0.2375808, 0, 0, 0, 1, 1,
-0.413215, 0.5174818, -0.3128321, 1, 1, 1, 1, 1,
-0.4122142, 1.222322, 0.0313747, 1, 1, 1, 1, 1,
-0.4074124, 0.2928805, -0.7580853, 1, 1, 1, 1, 1,
-0.3977754, -0.3123116, -2.301525, 1, 1, 1, 1, 1,
-0.3974828, -0.1007937, -2.958196, 1, 1, 1, 1, 1,
-0.38995, 1.360351, 0.5328344, 1, 1, 1, 1, 1,
-0.389143, 1.190745, 0.2975336, 1, 1, 1, 1, 1,
-0.3876712, 1.003769, 0.2295739, 1, 1, 1, 1, 1,
-0.3853059, 1.652955, -0.09820128, 1, 1, 1, 1, 1,
-0.3830964, 1.33849, -0.7720461, 1, 1, 1, 1, 1,
-0.3795392, 1.081486, 0.0934466, 1, 1, 1, 1, 1,
-0.3764305, 0.9105213, -0.9618193, 1, 1, 1, 1, 1,
-0.3760436, 0.0145225, -1.216817, 1, 1, 1, 1, 1,
-0.3756019, 1.201285, -1.221472, 1, 1, 1, 1, 1,
-0.3722818, -0.1851377, 0.1458323, 1, 1, 1, 1, 1,
-0.372143, 0.9586294, -0.3825429, 0, 0, 1, 1, 1,
-0.3719532, 0.123774, -1.189203, 1, 0, 0, 1, 1,
-0.3689345, -1.731268, -4.190974, 1, 0, 0, 1, 1,
-0.3653926, -0.812511, -3.381489, 1, 0, 0, 1, 1,
-0.3640758, -1.187491, -1.843969, 1, 0, 0, 1, 1,
-0.3599649, 1.355624, -0.8633685, 1, 0, 0, 1, 1,
-0.3593361, 1.032005, -0.8254992, 0, 0, 0, 1, 1,
-0.3528258, -0.4174899, 0.2520236, 0, 0, 0, 1, 1,
-0.3515729, -1.309512, -2.706117, 0, 0, 0, 1, 1,
-0.3499193, 1.603864, 0.8045022, 0, 0, 0, 1, 1,
-0.3496991, -0.02204357, -3.153757, 0, 0, 0, 1, 1,
-0.3378394, -2.118021, -3.554741, 0, 0, 0, 1, 1,
-0.3338584, -1.381227, -1.142991, 0, 0, 0, 1, 1,
-0.3260531, 1.061336, -2.026187, 1, 1, 1, 1, 1,
-0.3259899, 0.1909677, -1.447107, 1, 1, 1, 1, 1,
-0.3232475, -0.7272573, -3.511711, 1, 1, 1, 1, 1,
-0.3224144, 0.01146523, -1.256243, 1, 1, 1, 1, 1,
-0.3211754, -0.1104208, -0.6024165, 1, 1, 1, 1, 1,
-0.3136407, 1.628949, -0.09832744, 1, 1, 1, 1, 1,
-0.3131212, 1.05685, 1.64187, 1, 1, 1, 1, 1,
-0.3124974, -0.9336365, -3.872435, 1, 1, 1, 1, 1,
-0.31245, 1.819834, 1.843107, 1, 1, 1, 1, 1,
-0.3119458, -0.7396003, -2.7443, 1, 1, 1, 1, 1,
-0.3087997, -1.978065, -3.160854, 1, 1, 1, 1, 1,
-0.3071955, 0.166101, 0.2051723, 1, 1, 1, 1, 1,
-0.3071549, -0.03006145, -3.046442, 1, 1, 1, 1, 1,
-0.3035524, -1.500861, -3.935084, 1, 1, 1, 1, 1,
-0.3012008, 0.8470876, -0.7513271, 1, 1, 1, 1, 1,
-0.2980456, 0.599805, -0.6900598, 0, 0, 1, 1, 1,
-0.2979416, -1.025131, -2.873889, 1, 0, 0, 1, 1,
-0.2918657, -0.5124974, -3.078404, 1, 0, 0, 1, 1,
-0.2906006, -0.09979542, -2.089737, 1, 0, 0, 1, 1,
-0.2870663, -1.220601, -2.933881, 1, 0, 0, 1, 1,
-0.2845294, -0.7493634, -2.977661, 1, 0, 0, 1, 1,
-0.2840874, 0.243447, -0.8775269, 0, 0, 0, 1, 1,
-0.2779797, -0.3897233, -3.625887, 0, 0, 0, 1, 1,
-0.2727954, -0.170619, -2.439914, 0, 0, 0, 1, 1,
-0.2719097, 0.02634164, -2.122437, 0, 0, 0, 1, 1,
-0.2646584, -1.742727, -1.091883, 0, 0, 0, 1, 1,
-0.2627852, 1.392573, -0.9250521, 0, 0, 0, 1, 1,
-0.2626467, 0.1761221, -2.854054, 0, 0, 0, 1, 1,
-0.2616055, -1.663241, -1.149768, 1, 1, 1, 1, 1,
-0.2604553, -1.444293, -1.844931, 1, 1, 1, 1, 1,
-0.2584657, 0.1899925, -0.7194505, 1, 1, 1, 1, 1,
-0.2551882, 1.006398, -0.7046188, 1, 1, 1, 1, 1,
-0.2481309, 0.5017448, -0.486389, 1, 1, 1, 1, 1,
-0.2477809, -1.963985, -4.657186, 1, 1, 1, 1, 1,
-0.2469898, 0.1871309, -0.661464, 1, 1, 1, 1, 1,
-0.2464201, 0.4306874, 0.3824, 1, 1, 1, 1, 1,
-0.2396342, 0.9772683, -0.6778474, 1, 1, 1, 1, 1,
-0.2386404, 0.3353266, -0.8666748, 1, 1, 1, 1, 1,
-0.2365546, 1.021542, -0.2700471, 1, 1, 1, 1, 1,
-0.2356008, -0.0131599, -2.853683, 1, 1, 1, 1, 1,
-0.2337995, -0.6730042, -3.696165, 1, 1, 1, 1, 1,
-0.2313541, -1.479729, -1.760631, 1, 1, 1, 1, 1,
-0.2310145, -1.200537, -2.561035, 1, 1, 1, 1, 1,
-0.2247599, -0.2503865, -4.171837, 0, 0, 1, 1, 1,
-0.2238841, -0.403439, -1.175303, 1, 0, 0, 1, 1,
-0.2208668, -1.386292, -3.418941, 1, 0, 0, 1, 1,
-0.2199228, -1.251355, -3.764732, 1, 0, 0, 1, 1,
-0.2185362, 0.2921121, -0.4418308, 1, 0, 0, 1, 1,
-0.2173958, 0.1134791, -0.3729847, 1, 0, 0, 1, 1,
-0.2171388, -0.9482014, -3.105693, 0, 0, 0, 1, 1,
-0.2163061, 0.7247555, -2.739889, 0, 0, 0, 1, 1,
-0.2162326, -1.425976, -2.306305, 0, 0, 0, 1, 1,
-0.2155214, -0.1393687, -2.497332, 0, 0, 0, 1, 1,
-0.2149137, -0.5650977, -3.846945, 0, 0, 0, 1, 1,
-0.2130271, -0.4837894, -2.011595, 0, 0, 0, 1, 1,
-0.2118374, -0.3253046, -2.148866, 0, 0, 0, 1, 1,
-0.2097927, -0.3982502, -1.61409, 1, 1, 1, 1, 1,
-0.208864, 1.1011, 0.6624259, 1, 1, 1, 1, 1,
-0.2086074, 1.090644, -0.3681717, 1, 1, 1, 1, 1,
-0.2061502, -0.7713199, -3.847821, 1, 1, 1, 1, 1,
-0.1973184, 2.18265, 0.2434446, 1, 1, 1, 1, 1,
-0.1948683, 0.7399065, 0.4346183, 1, 1, 1, 1, 1,
-0.1886005, 0.5174807, -2.313102, 1, 1, 1, 1, 1,
-0.1867013, 1.434429, -0.8866041, 1, 1, 1, 1, 1,
-0.1863963, -0.0290773, -2.607943, 1, 1, 1, 1, 1,
-0.1821771, 0.8455309, 0.3431237, 1, 1, 1, 1, 1,
-0.1687663, -0.4877591, -4.757405, 1, 1, 1, 1, 1,
-0.1617787, -0.3893249, -1.940446, 1, 1, 1, 1, 1,
-0.1612985, -0.3491088, -2.958189, 1, 1, 1, 1, 1,
-0.1590149, -0.4768899, -1.483896, 1, 1, 1, 1, 1,
-0.156918, -1.08771, -1.790005, 1, 1, 1, 1, 1,
-0.1545163, 0.9959579, -0.04579127, 0, 0, 1, 1, 1,
-0.1531219, -0.5107861, -1.85005, 1, 0, 0, 1, 1,
-0.1510436, -0.835575, -3.996746, 1, 0, 0, 1, 1,
-0.1508236, 0.9089196, 0.1528157, 1, 0, 0, 1, 1,
-0.1476589, -1.898749, -0.929899, 1, 0, 0, 1, 1,
-0.1441964, 0.4260808, 1.862006, 1, 0, 0, 1, 1,
-0.1426404, 0.9567196, -0.8895581, 0, 0, 0, 1, 1,
-0.1421511, -0.8156794, -3.424035, 0, 0, 0, 1, 1,
-0.1416479, 1.279004, -0.9935834, 0, 0, 0, 1, 1,
-0.1364286, 0.9534669, -0.1954938, 0, 0, 0, 1, 1,
-0.1358502, -1.747485, -1.521951, 0, 0, 0, 1, 1,
-0.1342281, -1.955331, -2.93294, 0, 0, 0, 1, 1,
-0.1328736, -0.4377823, -2.343558, 0, 0, 0, 1, 1,
-0.1291252, -0.7028545, -3.755241, 1, 1, 1, 1, 1,
-0.1205411, 1.297876, -0.7642106, 1, 1, 1, 1, 1,
-0.1168711, 1.132351, -1.717837, 1, 1, 1, 1, 1,
-0.111422, -0.1458212, -0.9995774, 1, 1, 1, 1, 1,
-0.108558, -0.5666929, -2.821176, 1, 1, 1, 1, 1,
-0.1070839, 0.2061576, 0.03707678, 1, 1, 1, 1, 1,
-0.1043601, 0.04192901, -0.9633139, 1, 1, 1, 1, 1,
-0.09684075, -0.5351159, -2.890257, 1, 1, 1, 1, 1,
-0.09657721, -0.8281164, -2.503055, 1, 1, 1, 1, 1,
-0.08587823, 0.6266438, 0.4836333, 1, 1, 1, 1, 1,
-0.08528066, -0.1725198, -3.661063, 1, 1, 1, 1, 1,
-0.08492783, -0.9566881, -3.329929, 1, 1, 1, 1, 1,
-0.08489462, 1.288524, -0.2220206, 1, 1, 1, 1, 1,
-0.07948408, 0.8466862, -0.4501746, 1, 1, 1, 1, 1,
-0.0784977, 0.7467068, 0.07952616, 1, 1, 1, 1, 1,
-0.07736684, 0.4049364, 0.319148, 0, 0, 1, 1, 1,
-0.07626469, 0.8497232, -0.4661711, 1, 0, 0, 1, 1,
-0.07487348, 0.5076033, 1.248791, 1, 0, 0, 1, 1,
-0.07452235, -0.978046, -3.779789, 1, 0, 0, 1, 1,
-0.07142342, -0.76446, -1.667725, 1, 0, 0, 1, 1,
-0.06984802, -1.7114, -5.384764, 1, 0, 0, 1, 1,
-0.0651425, 0.2176304, -0.4398716, 0, 0, 0, 1, 1,
-0.05671046, -1.594726, -2.068509, 0, 0, 0, 1, 1,
-0.05375343, 1.113197, 0.3119899, 0, 0, 0, 1, 1,
-0.05360589, 0.06179597, -0.376142, 0, 0, 0, 1, 1,
-0.04511994, 1.667157, 2.596071, 0, 0, 0, 1, 1,
-0.04445411, 0.288943, 1.562747, 0, 0, 0, 1, 1,
-0.04327773, -0.6817618, -3.343249, 0, 0, 0, 1, 1,
-0.04297691, 0.4005184, -0.4984348, 1, 1, 1, 1, 1,
-0.04192894, -0.3220522, -3.160581, 1, 1, 1, 1, 1,
-0.03816103, 0.256972, 0.9815054, 1, 1, 1, 1, 1,
-0.03777684, -0.9418432, -3.735178, 1, 1, 1, 1, 1,
-0.03732807, 1.532077, 1.189111, 1, 1, 1, 1, 1,
-0.03406493, 1.175432, 0.6092785, 1, 1, 1, 1, 1,
-0.03354553, -0.607816, -3.312447, 1, 1, 1, 1, 1,
-0.02683477, -0.1486323, -2.635151, 1, 1, 1, 1, 1,
-0.02563464, 0.7724389, -2.162727, 1, 1, 1, 1, 1,
-0.01847389, 0.06182444, 0.4217076, 1, 1, 1, 1, 1,
-0.01739353, -1.556826, -3.633709, 1, 1, 1, 1, 1,
-0.0151837, -0.6212456, -3.528409, 1, 1, 1, 1, 1,
-0.01489008, -0.533456, -2.033992, 1, 1, 1, 1, 1,
-0.01349735, -0.6288805, -1.832226, 1, 1, 1, 1, 1,
-0.008253279, -1.313354, -4.000268, 1, 1, 1, 1, 1,
-0.00799678, 0.4165781, -3.238311, 0, 0, 1, 1, 1,
-0.0008737915, -2.160764, -1.84899, 1, 0, 0, 1, 1,
0.0001694652, -1.852398, 2.604977, 1, 0, 0, 1, 1,
0.000579973, 0.5913463, 0.7160794, 1, 0, 0, 1, 1,
0.00269908, -0.2783794, 2.374219, 1, 0, 0, 1, 1,
0.004329364, 0.8451776, -0.9026975, 1, 0, 0, 1, 1,
0.01215857, 0.8036731, 1.697345, 0, 0, 0, 1, 1,
0.01502574, -0.625724, 2.727202, 0, 0, 0, 1, 1,
0.01542961, -0.2054654, 1.193839, 0, 0, 0, 1, 1,
0.01975477, -0.2744009, 3.708687, 0, 0, 0, 1, 1,
0.02720815, -0.7944533, 4.411847, 0, 0, 0, 1, 1,
0.02991602, 0.5713609, 0.3287298, 0, 0, 0, 1, 1,
0.03036214, 0.02680807, 3.042624, 0, 0, 0, 1, 1,
0.03509128, -0.9230409, 2.204507, 1, 1, 1, 1, 1,
0.03522725, -0.2052237, 2.389898, 1, 1, 1, 1, 1,
0.03760283, 0.6152881, 1.250429, 1, 1, 1, 1, 1,
0.03962824, 0.1147019, 0.6350697, 1, 1, 1, 1, 1,
0.03963024, -0.0564569, 1.424235, 1, 1, 1, 1, 1,
0.04667343, -0.5270078, 1.080001, 1, 1, 1, 1, 1,
0.04835036, 0.179811, 1.105402, 1, 1, 1, 1, 1,
0.04945086, -0.9650388, 3.090305, 1, 1, 1, 1, 1,
0.04970452, -0.400459, 2.439919, 1, 1, 1, 1, 1,
0.05474992, 0.1427927, 1.49575, 1, 1, 1, 1, 1,
0.05596621, -0.3406376, 3.318687, 1, 1, 1, 1, 1,
0.05753314, 0.632478, -1.389773, 1, 1, 1, 1, 1,
0.05757993, 0.06074899, -0.3288736, 1, 1, 1, 1, 1,
0.06077421, -0.9025276, 2.465386, 1, 1, 1, 1, 1,
0.06213184, -1.503468, 3.536954, 1, 1, 1, 1, 1,
0.06407464, 1.036956, 0.5536495, 0, 0, 1, 1, 1,
0.06414564, 1.464237, 1.150555, 1, 0, 0, 1, 1,
0.06457239, 0.3127691, 0.5530014, 1, 0, 0, 1, 1,
0.0651562, -0.3603854, 1.043243, 1, 0, 0, 1, 1,
0.06535191, 0.7032434, 1.199444, 1, 0, 0, 1, 1,
0.07140464, -1.614481, 2.081798, 1, 0, 0, 1, 1,
0.07161196, -0.6640231, 4.250194, 0, 0, 0, 1, 1,
0.07335575, -0.623338, 3.57511, 0, 0, 0, 1, 1,
0.07386804, 0.02675172, 2.403375, 0, 0, 0, 1, 1,
0.07396659, 0.1046127, 1.347793, 0, 0, 0, 1, 1,
0.07761059, -0.6235712, 4.531803, 0, 0, 0, 1, 1,
0.07941249, -0.7368064, 3.04821, 0, 0, 0, 1, 1,
0.08231345, 0.5858639, 0.1184122, 0, 0, 0, 1, 1,
0.08273493, 0.02075489, 0.8516484, 1, 1, 1, 1, 1,
0.08535162, 1.018962, -0.2453201, 1, 1, 1, 1, 1,
0.087626, -1.16903, 4.30711, 1, 1, 1, 1, 1,
0.08884554, -0.8376614, 4.618629, 1, 1, 1, 1, 1,
0.0903765, -0.9140497, 3.364, 1, 1, 1, 1, 1,
0.09281869, -0.1016252, 2.72159, 1, 1, 1, 1, 1,
0.09741624, -0.536678, 3.817877, 1, 1, 1, 1, 1,
0.09774131, 1.19837, 0.8486587, 1, 1, 1, 1, 1,
0.09860471, -1.440254, 4.687888, 1, 1, 1, 1, 1,
0.09877869, -0.2055018, 4.146182, 1, 1, 1, 1, 1,
0.1027792, -0.0912267, 1.091074, 1, 1, 1, 1, 1,
0.107842, -0.2613574, 3.382429, 1, 1, 1, 1, 1,
0.1125468, -0.214616, 2.365842, 1, 1, 1, 1, 1,
0.1137939, -0.7683533, 2.156341, 1, 1, 1, 1, 1,
0.1157353, -0.7496223, 4.867984, 1, 1, 1, 1, 1,
0.116378, 0.4563582, -2.268282, 0, 0, 1, 1, 1,
0.1175528, -0.1926128, 3.143839, 1, 0, 0, 1, 1,
0.1197468, -0.5749863, 1.991865, 1, 0, 0, 1, 1,
0.120284, -0.7752059, 2.569997, 1, 0, 0, 1, 1,
0.122979, 0.5052155, 0.8521869, 1, 0, 0, 1, 1,
0.1246879, -0.1600954, 0.8113337, 1, 0, 0, 1, 1,
0.1257466, -1.240476, 2.628712, 0, 0, 0, 1, 1,
0.1278091, 0.2737266, -0.3946204, 0, 0, 0, 1, 1,
0.1331729, 0.4317702, 0.4103223, 0, 0, 0, 1, 1,
0.139364, 2.51362, -0.2546863, 0, 0, 0, 1, 1,
0.1403775, -0.7263274, 4.08406, 0, 0, 0, 1, 1,
0.1406971, 1.179396, -0.3386111, 0, 0, 0, 1, 1,
0.1449685, -1.469521, 4.014055, 0, 0, 0, 1, 1,
0.1452675, 0.3641399, -0.5293046, 1, 1, 1, 1, 1,
0.146328, 1.502027, -0.1990812, 1, 1, 1, 1, 1,
0.1530578, 0.1707475, 2.168735, 1, 1, 1, 1, 1,
0.1556045, 0.744589, -0.05706249, 1, 1, 1, 1, 1,
0.1581139, -1.179528, 3.12104, 1, 1, 1, 1, 1,
0.1581455, 0.1184847, 0.5978644, 1, 1, 1, 1, 1,
0.1587776, -0.7156817, 3.476685, 1, 1, 1, 1, 1,
0.1604285, -1.94511, 2.389174, 1, 1, 1, 1, 1,
0.1608378, 0.386081, -2.049239, 1, 1, 1, 1, 1,
0.1637719, 1.606256, -0.1722862, 1, 1, 1, 1, 1,
0.1672682, 0.8845308, -0.6606991, 1, 1, 1, 1, 1,
0.1703124, 0.9723203, 1.103406, 1, 1, 1, 1, 1,
0.1733141, -1.127635, 1.59869, 1, 1, 1, 1, 1,
0.174224, 0.4475294, -0.7425362, 1, 1, 1, 1, 1,
0.1767876, 0.6571766, 1.603934, 1, 1, 1, 1, 1,
0.1774262, -0.9464254, 4.135822, 0, 0, 1, 1, 1,
0.1777697, -1.593212, 4.436142, 1, 0, 0, 1, 1,
0.1778297, -1.129614, 4.578969, 1, 0, 0, 1, 1,
0.1790352, 0.7936009, -0.2362224, 1, 0, 0, 1, 1,
0.1842772, -1.229395, 2.889831, 1, 0, 0, 1, 1,
0.1871897, 0.8154451, -0.8545414, 1, 0, 0, 1, 1,
0.1872849, -0.8525635, 4.981515, 0, 0, 0, 1, 1,
0.1881809, -0.667366, 4.293523, 0, 0, 0, 1, 1,
0.1886073, -1.626046, 1.026077, 0, 0, 0, 1, 1,
0.1887613, 2.404666, -1.43526, 0, 0, 0, 1, 1,
0.1933925, -1.091736, 2.41436, 0, 0, 0, 1, 1,
0.1939994, 1.608754, -0.4514409, 0, 0, 0, 1, 1,
0.2082725, 0.1018454, 0.351154, 0, 0, 0, 1, 1,
0.2098205, -0.4941469, 2.074134, 1, 1, 1, 1, 1,
0.2159832, 0.1798481, -0.1287724, 1, 1, 1, 1, 1,
0.2170764, -0.4539261, 3.458308, 1, 1, 1, 1, 1,
0.2212674, 0.4571311, 0.3331962, 1, 1, 1, 1, 1,
0.2236187, 0.1408368, 0.8827509, 1, 1, 1, 1, 1,
0.2271428, -1.135751, 3.808512, 1, 1, 1, 1, 1,
0.2285436, 1.176114, 1.256074, 1, 1, 1, 1, 1,
0.2287116, -0.8211596, 3.967162, 1, 1, 1, 1, 1,
0.2309186, 1.302686, -0.3328619, 1, 1, 1, 1, 1,
0.2318151, -0.5464025, 5.045489, 1, 1, 1, 1, 1,
0.2335633, 0.3851791, 1.693653, 1, 1, 1, 1, 1,
0.239682, 1.082862, 0.3764673, 1, 1, 1, 1, 1,
0.2446495, -1.128393, 1.804182, 1, 1, 1, 1, 1,
0.254147, 0.03682257, 1.219897, 1, 1, 1, 1, 1,
0.2556111, -0.3325502, 4.112222, 1, 1, 1, 1, 1,
0.2621205, -1.133028, 3.029838, 0, 0, 1, 1, 1,
0.2624733, -0.4031299, 2.873847, 1, 0, 0, 1, 1,
0.2634733, -1.143576, 3.734126, 1, 0, 0, 1, 1,
0.2684765, -2.175598, 1.555704, 1, 0, 0, 1, 1,
0.2692305, -0.04234596, 1.45744, 1, 0, 0, 1, 1,
0.2701637, -1.559542, 2.168733, 1, 0, 0, 1, 1,
0.2734998, 0.5999364, 0.9715856, 0, 0, 0, 1, 1,
0.2741135, 0.5621209, 1.443841, 0, 0, 0, 1, 1,
0.2748222, 2.257674, -0.5595162, 0, 0, 0, 1, 1,
0.2769053, -1.101327, 3.741235, 0, 0, 0, 1, 1,
0.2853263, -0.9788474, 2.507244, 0, 0, 0, 1, 1,
0.2931033, -0.2047237, 1.196561, 0, 0, 0, 1, 1,
0.2941615, 0.2825704, 1.516459, 0, 0, 0, 1, 1,
0.2947153, -0.02447811, 0.7894437, 1, 1, 1, 1, 1,
0.2953043, 0.4960066, -0.7411917, 1, 1, 1, 1, 1,
0.2969815, 1.188156, -1.13202, 1, 1, 1, 1, 1,
0.3052135, 0.2204713, 0.439012, 1, 1, 1, 1, 1,
0.3061963, -0.6297547, 5.477054, 1, 1, 1, 1, 1,
0.3071768, -0.7475952, 4.452315, 1, 1, 1, 1, 1,
0.3130722, -1.426426, 2.368972, 1, 1, 1, 1, 1,
0.3133829, -1.509206, 2.535008, 1, 1, 1, 1, 1,
0.3173994, -0.7241942, 2.612805, 1, 1, 1, 1, 1,
0.3176437, -0.280531, 3.619403, 1, 1, 1, 1, 1,
0.3180353, 0.3669375, 0.484707, 1, 1, 1, 1, 1,
0.3185559, -1.619692, 4.346095, 1, 1, 1, 1, 1,
0.3260294, -1.648482, 2.574164, 1, 1, 1, 1, 1,
0.3270669, 0.6430671, 0.8122457, 1, 1, 1, 1, 1,
0.3303131, -0.219527, 1.019984, 1, 1, 1, 1, 1,
0.3335614, -0.04385247, 1.698817, 0, 0, 1, 1, 1,
0.3392929, -0.2798079, 3.319733, 1, 0, 0, 1, 1,
0.3462086, 1.556921, -1.445166, 1, 0, 0, 1, 1,
0.3465558, -1.614609, 2.356805, 1, 0, 0, 1, 1,
0.3480664, 1.425972, 0.6491178, 1, 0, 0, 1, 1,
0.3483375, -0.5588822, 4.20281, 1, 0, 0, 1, 1,
0.3486792, -0.5822973, 1.517222, 0, 0, 0, 1, 1,
0.3495542, 0.5906135, 0.2597449, 0, 0, 0, 1, 1,
0.3634468, 1.056064, 0.09089015, 0, 0, 0, 1, 1,
0.3638109, -1.079745, 3.600666, 0, 0, 0, 1, 1,
0.3648056, 0.1316003, 0.4566689, 0, 0, 0, 1, 1,
0.3675234, -0.8101583, 2.614841, 0, 0, 0, 1, 1,
0.3689933, 0.3647169, 1.274307, 0, 0, 0, 1, 1,
0.3720573, 0.4666149, 2.758426, 1, 1, 1, 1, 1,
0.3777081, 0.4761524, -2.121437, 1, 1, 1, 1, 1,
0.3779243, 0.384782, 1.467243, 1, 1, 1, 1, 1,
0.3839759, -0.3323664, 3.184121, 1, 1, 1, 1, 1,
0.3866085, -0.2692593, 0.8740997, 1, 1, 1, 1, 1,
0.3889098, 0.1003329, 1.095767, 1, 1, 1, 1, 1,
0.3922648, 0.051224, 2.593567, 1, 1, 1, 1, 1,
0.3944943, 0.480188, -0.01989833, 1, 1, 1, 1, 1,
0.394847, 1.502072, 3.648528, 1, 1, 1, 1, 1,
0.4033916, 0.2885946, 2.571645, 1, 1, 1, 1, 1,
0.4101296, -0.176708, 1.932336, 1, 1, 1, 1, 1,
0.4181381, -0.1567169, 2.294404, 1, 1, 1, 1, 1,
0.4228733, -2.006154, 3.182808, 1, 1, 1, 1, 1,
0.4258484, -1.760317, 2.10269, 1, 1, 1, 1, 1,
0.4322189, 0.3747877, -0.5088645, 1, 1, 1, 1, 1,
0.4372134, -1.116404, 2.125772, 0, 0, 1, 1, 1,
0.4379332, -0.1407154, 2.235264, 1, 0, 0, 1, 1,
0.4393861, -1.052963, 1.402056, 1, 0, 0, 1, 1,
0.4435894, 2.274727, 0.2068322, 1, 0, 0, 1, 1,
0.4502242, -1.517223, 3.321985, 1, 0, 0, 1, 1,
0.4513823, 1.892114, 0.2855677, 1, 0, 0, 1, 1,
0.4527082, -0.8667649, 4.978967, 0, 0, 0, 1, 1,
0.4528343, -0.1171325, 1.060351, 0, 0, 0, 1, 1,
0.4549447, -0.8825184, 4.160684, 0, 0, 0, 1, 1,
0.4565536, 0.6746397, 0.3968208, 0, 0, 0, 1, 1,
0.4603364, 0.116161, 2.093229, 0, 0, 0, 1, 1,
0.4614019, 0.3126474, 1.51783, 0, 0, 0, 1, 1,
0.4616813, -0.02208978, 3.103612, 0, 0, 0, 1, 1,
0.4619284, -1.084578, 2.223699, 1, 1, 1, 1, 1,
0.4621554, 0.2510633, 0.3072598, 1, 1, 1, 1, 1,
0.4623452, -1.449384, 1.837447, 1, 1, 1, 1, 1,
0.4630514, -0.7288646, 2.631256, 1, 1, 1, 1, 1,
0.463497, 0.2733024, 0.01820728, 1, 1, 1, 1, 1,
0.4672292, 0.3155021, 2.079241, 1, 1, 1, 1, 1,
0.4704466, 2.431148, 0.6368492, 1, 1, 1, 1, 1,
0.4801452, 1.276388, 0.2529989, 1, 1, 1, 1, 1,
0.4922939, -0.7970471, 1.59312, 1, 1, 1, 1, 1,
0.5056562, -0.0694166, 2.56738, 1, 1, 1, 1, 1,
0.5070827, -0.5439464, 3.818645, 1, 1, 1, 1, 1,
0.508922, 2.038329, 0.6034855, 1, 1, 1, 1, 1,
0.5143974, -1.002279, 3.499161, 1, 1, 1, 1, 1,
0.5150366, -0.9924754, 4.357262, 1, 1, 1, 1, 1,
0.5159014, 2.681952, 0.07507743, 1, 1, 1, 1, 1,
0.5238094, 0.6025767, -0.5121598, 0, 0, 1, 1, 1,
0.5277705, -2.729902, 2.3186, 1, 0, 0, 1, 1,
0.5290788, -0.6922377, 1.060844, 1, 0, 0, 1, 1,
0.529444, 0.6741732, 0.8009025, 1, 0, 0, 1, 1,
0.5305859, -0.5072649, 3.211692, 1, 0, 0, 1, 1,
0.5307797, 0.7991511, 0.138753, 1, 0, 0, 1, 1,
0.533671, 0.8506236, 1.458148, 0, 0, 0, 1, 1,
0.5346282, -1.275133, 2.965579, 0, 0, 0, 1, 1,
0.5363962, -0.2461328, 1.454768, 0, 0, 0, 1, 1,
0.540781, 1.068325, -0.8472049, 0, 0, 0, 1, 1,
0.5425825, -0.1346977, 1.868065, 0, 0, 0, 1, 1,
0.5469, 0.06438747, 1.44997, 0, 0, 0, 1, 1,
0.5506755, -0.296258, 2.182608, 0, 0, 0, 1, 1,
0.5543302, -0.4830236, 2.447666, 1, 1, 1, 1, 1,
0.5581446, 0.09447621, -0.2416786, 1, 1, 1, 1, 1,
0.5586717, -2.258777, 2.201136, 1, 1, 1, 1, 1,
0.5626732, 0.6717703, 0.5958117, 1, 1, 1, 1, 1,
0.5629032, -2.00814, 0.6872564, 1, 1, 1, 1, 1,
0.5640123, -1.145231, 2.503983, 1, 1, 1, 1, 1,
0.5685828, 0.637814, -0.5480502, 1, 1, 1, 1, 1,
0.5685901, 0.1852545, 0.821526, 1, 1, 1, 1, 1,
0.5692494, 2.162559, 0.05073334, 1, 1, 1, 1, 1,
0.5709163, 1.534739, -0.9997572, 1, 1, 1, 1, 1,
0.5725551, -0.02783333, 0.2093817, 1, 1, 1, 1, 1,
0.5732008, 1.526901, -0.009082232, 1, 1, 1, 1, 1,
0.5752645, -1.165835, 3.156855, 1, 1, 1, 1, 1,
0.5760351, 0.5623958, -0.5212728, 1, 1, 1, 1, 1,
0.5761979, -1.816893, 5.090271, 1, 1, 1, 1, 1,
0.5769892, 0.273191, 1.51472, 0, 0, 1, 1, 1,
0.5775622, -1.209632, 2.524395, 1, 0, 0, 1, 1,
0.5776072, -0.128743, 1.689554, 1, 0, 0, 1, 1,
0.5810053, 0.3330259, 0.5997078, 1, 0, 0, 1, 1,
0.5875975, -0.5058158, 2.337544, 1, 0, 0, 1, 1,
0.5880802, 0.362592, 0.9358925, 1, 0, 0, 1, 1,
0.5922216, -0.4146325, 2.552032, 0, 0, 0, 1, 1,
0.5930865, -1.760467, 2.491637, 0, 0, 0, 1, 1,
0.5940511, -1.154078, 3.1661, 0, 0, 0, 1, 1,
0.5993311, 0.5297005, -0.01227147, 0, 0, 0, 1, 1,
0.5994888, 0.4710251, 0.7829666, 0, 0, 0, 1, 1,
0.601219, -0.03508953, 2.518646, 0, 0, 0, 1, 1,
0.6070338, 0.3677162, 2.784798, 0, 0, 0, 1, 1,
0.6092575, -1.25445, 1.637568, 1, 1, 1, 1, 1,
0.6109618, -2.353975, 2.55095, 1, 1, 1, 1, 1,
0.6129288, 0.3674829, 1.378902, 1, 1, 1, 1, 1,
0.6180031, 1.042385, -0.1117401, 1, 1, 1, 1, 1,
0.6182559, -0.5578696, 0.466158, 1, 1, 1, 1, 1,
0.6209033, -1.096395, 1.074908, 1, 1, 1, 1, 1,
0.6241023, -0.5809148, 1.817693, 1, 1, 1, 1, 1,
0.629432, 1.128385, 1.283291, 1, 1, 1, 1, 1,
0.6372401, 0.486931, 1.273481, 1, 1, 1, 1, 1,
0.6416148, -0.06378613, 1.722914, 1, 1, 1, 1, 1,
0.6441025, -0.4458404, 2.042138, 1, 1, 1, 1, 1,
0.6710756, 0.2966116, 2.941818, 1, 1, 1, 1, 1,
0.6732646, -0.8497282, 3.01347, 1, 1, 1, 1, 1,
0.6765589, -0.2188788, 0.6699634, 1, 1, 1, 1, 1,
0.6812941, 0.1831824, 0.6929575, 1, 1, 1, 1, 1,
0.6863052, 0.5418563, 0.6090001, 0, 0, 1, 1, 1,
0.6969166, -1.461738, 1.789835, 1, 0, 0, 1, 1,
0.7075672, 2.856736, 1.00236, 1, 0, 0, 1, 1,
0.7118683, 1.602682, -1.23148, 1, 0, 0, 1, 1,
0.7160936, 1.687274, 1.54815, 1, 0, 0, 1, 1,
0.7164614, 1.280555, 0.1467551, 1, 0, 0, 1, 1,
0.7166352, -1.581741, 1.642734, 0, 0, 0, 1, 1,
0.7172929, 1.555289, -0.2080966, 0, 0, 0, 1, 1,
0.7259527, -0.6958449, 3.185464, 0, 0, 0, 1, 1,
0.7308462, -0.3045394, 2.055838, 0, 0, 0, 1, 1,
0.7383373, -1.165709, 1.523641, 0, 0, 0, 1, 1,
0.7395632, -1.026009, 2.097966, 0, 0, 0, 1, 1,
0.7456176, 0.06019091, 3.890532, 0, 0, 0, 1, 1,
0.7474056, -0.4484242, 2.262093, 1, 1, 1, 1, 1,
0.7546177, 0.4228969, 0.3798939, 1, 1, 1, 1, 1,
0.7584044, -1.021793, 2.616326, 1, 1, 1, 1, 1,
0.7629158, -0.2223256, -0.03949818, 1, 1, 1, 1, 1,
0.7675381, -0.7058334, 1.258193, 1, 1, 1, 1, 1,
0.7675903, 0.4615918, 1.964779, 1, 1, 1, 1, 1,
0.7715133, 0.2668753, 2.711297, 1, 1, 1, 1, 1,
0.780701, 0.3651419, 1.192051, 1, 1, 1, 1, 1,
0.7813923, -0.01310052, 2.52561, 1, 1, 1, 1, 1,
0.7894681, 1.562677, -1.30519, 1, 1, 1, 1, 1,
0.7908429, 0.1588566, 1.295269, 1, 1, 1, 1, 1,
0.7912291, -0.4423685, 2.692494, 1, 1, 1, 1, 1,
0.7936095, -0.4169683, 2.200717, 1, 1, 1, 1, 1,
0.7971733, 1.577701, -0.3467273, 1, 1, 1, 1, 1,
0.7983544, -0.5321282, 0.1757644, 1, 1, 1, 1, 1,
0.8023595, 0.9092955, 0.1824275, 0, 0, 1, 1, 1,
0.8074148, -2.162912, 4.394826, 1, 0, 0, 1, 1,
0.8093089, 1.954105, 0.450332, 1, 0, 0, 1, 1,
0.809411, -0.1726893, 1.229765, 1, 0, 0, 1, 1,
0.813811, -0.008075496, 2.856116, 1, 0, 0, 1, 1,
0.8184342, -1.683276, 3.196069, 1, 0, 0, 1, 1,
0.8187332, -0.9777594, 3.392609, 0, 0, 0, 1, 1,
0.8209634, 0.4868387, 1.720965, 0, 0, 0, 1, 1,
0.8233055, 0.8495709, -0.1523179, 0, 0, 0, 1, 1,
0.8268085, 0.2108359, 2.590418, 0, 0, 0, 1, 1,
0.8363762, 1.427923, -1.325375, 0, 0, 0, 1, 1,
0.8383934, 0.2799585, 1.327562, 0, 0, 0, 1, 1,
0.8442217, -0.7317908, 2.964743, 0, 0, 0, 1, 1,
0.8459152, -1.425043, 2.899899, 1, 1, 1, 1, 1,
0.8474627, 0.4430471, -0.5404077, 1, 1, 1, 1, 1,
0.8481355, 1.053316, -0.08925445, 1, 1, 1, 1, 1,
0.8592348, -0.7088934, 0.9559922, 1, 1, 1, 1, 1,
0.8672868, -1.410763, 2.35608, 1, 1, 1, 1, 1,
0.8694246, 0.2240053, 3.38083, 1, 1, 1, 1, 1,
0.8764725, 0.8162288, 1.972906, 1, 1, 1, 1, 1,
0.8782311, 0.2298482, 1.750547, 1, 1, 1, 1, 1,
0.882126, -0.5012321, 3.027236, 1, 1, 1, 1, 1,
0.8868167, -2.021356, 5.079018, 1, 1, 1, 1, 1,
0.8920808, -0.04188684, 1.322013, 1, 1, 1, 1, 1,
0.8982021, 0.03540533, 1.753385, 1, 1, 1, 1, 1,
0.9018818, 0.1814467, 1.994525, 1, 1, 1, 1, 1,
0.9052066, -1.227293, 3.565595, 1, 1, 1, 1, 1,
0.9068569, 0.3868709, 2.133561, 1, 1, 1, 1, 1,
0.9103866, 1.208877, -1.182958, 0, 0, 1, 1, 1,
0.9117154, 0.523981, -0.3197867, 1, 0, 0, 1, 1,
0.913964, -0.6921278, 5.280134, 1, 0, 0, 1, 1,
0.9161091, -0.2613455, 1.540301, 1, 0, 0, 1, 1,
0.9182789, 0.3157009, 1.018656, 1, 0, 0, 1, 1,
0.9275333, 0.7167429, 2.001714, 1, 0, 0, 1, 1,
0.9341589, -0.01342797, 1.658885, 0, 0, 0, 1, 1,
0.944953, -0.9771247, 2.163047, 0, 0, 0, 1, 1,
0.945696, 0.2063253, 1.236619, 0, 0, 0, 1, 1,
0.9489662, -0.8178658, 3.78432, 0, 0, 0, 1, 1,
0.9509187, 0.5657222, 2.112313, 0, 0, 0, 1, 1,
0.9683955, 0.6099486, 2.695312, 0, 0, 0, 1, 1,
0.9749085, -0.6330078, 3.337644, 0, 0, 0, 1, 1,
0.9753767, -0.3676376, 0.9463742, 1, 1, 1, 1, 1,
0.9788112, -1.135999, 2.421891, 1, 1, 1, 1, 1,
0.9853233, -0.5608702, 3.338467, 1, 1, 1, 1, 1,
0.9863718, -0.6722739, 1.072439, 1, 1, 1, 1, 1,
0.9939483, 0.5555238, 0.1435406, 1, 1, 1, 1, 1,
0.9972646, 0.2274509, 0.4533377, 1, 1, 1, 1, 1,
1.006458, 0.06944631, 1.72269, 1, 1, 1, 1, 1,
1.007, -1.289163, 1.040771, 1, 1, 1, 1, 1,
1.017843, -0.2642753, 3.060553, 1, 1, 1, 1, 1,
1.020131, -0.09416568, 2.318625, 1, 1, 1, 1, 1,
1.021602, 0.2694381, 1.439366, 1, 1, 1, 1, 1,
1.021866, -0.7644914, 3.833724, 1, 1, 1, 1, 1,
1.024793, -0.1183992, 1.740749, 1, 1, 1, 1, 1,
1.029387, 1.181496, -1.277016, 1, 1, 1, 1, 1,
1.036976, -0.1949947, 1.689242, 1, 1, 1, 1, 1,
1.040493, -0.7071164, 1.548434, 0, 0, 1, 1, 1,
1.046951, 0.3854756, -0.693531, 1, 0, 0, 1, 1,
1.049218, 0.08731303, 3.366573, 1, 0, 0, 1, 1,
1.052985, 1.321109, -0.6809068, 1, 0, 0, 1, 1,
1.055766, -1.803399, 3.382234, 1, 0, 0, 1, 1,
1.064104, 0.6043434, -0.3619011, 1, 0, 0, 1, 1,
1.070844, 0.6824519, 0.9656792, 0, 0, 0, 1, 1,
1.072122, 0.009471597, 2.391615, 0, 0, 0, 1, 1,
1.072219, 0.4358945, 0.2009078, 0, 0, 0, 1, 1,
1.076367, -1.010095, 2.920209, 0, 0, 0, 1, 1,
1.079974, 0.05713297, 1.213216, 0, 0, 0, 1, 1,
1.088045, 0.6361576, 0.9119378, 0, 0, 0, 1, 1,
1.092412, -0.9824644, 2.0946, 0, 0, 0, 1, 1,
1.092976, -0.5155851, 2.191671, 1, 1, 1, 1, 1,
1.095132, -0.4437141, 1.341229, 1, 1, 1, 1, 1,
1.096283, -0.407931, 0.6129422, 1, 1, 1, 1, 1,
1.097644, -0.6931587, 2.099221, 1, 1, 1, 1, 1,
1.102436, -1.31959, 3.035779, 1, 1, 1, 1, 1,
1.103372, 0.2877048, 1.778103, 1, 1, 1, 1, 1,
1.103671, -0.1064719, 0.6243984, 1, 1, 1, 1, 1,
1.107541, 0.7076315, 1.650726, 1, 1, 1, 1, 1,
1.109128, -1.111188, 3.119922, 1, 1, 1, 1, 1,
1.11005, 0.03481188, 2.307604, 1, 1, 1, 1, 1,
1.117043, -1.691697, 3.511416, 1, 1, 1, 1, 1,
1.11957, -2.090182, 3.128665, 1, 1, 1, 1, 1,
1.121591, 0.1534828, -0.138273, 1, 1, 1, 1, 1,
1.128579, 0.7460162, 2.376238, 1, 1, 1, 1, 1,
1.129098, -0.5199359, -0.05106108, 1, 1, 1, 1, 1,
1.134708, -0.2881691, 1.268165, 0, 0, 1, 1, 1,
1.147608, -0.3359359, 1.92118, 1, 0, 0, 1, 1,
1.151479, -0.3769511, 2.806452, 1, 0, 0, 1, 1,
1.154565, 0.205503, -0.07064045, 1, 0, 0, 1, 1,
1.159858, -0.2652777, 1.144848, 1, 0, 0, 1, 1,
1.169491, 0.9238819, -0.7159294, 1, 0, 0, 1, 1,
1.171161, -0.9463043, 2.863346, 0, 0, 0, 1, 1,
1.172567, 1.601851, 0.6437597, 0, 0, 0, 1, 1,
1.176706, 0.3786859, 0.1079873, 0, 0, 0, 1, 1,
1.178077, 0.5810285, 2.215854, 0, 0, 0, 1, 1,
1.180669, -1.144909, 1.242066, 0, 0, 0, 1, 1,
1.18145, -0.5374429, 2.892573, 0, 0, 0, 1, 1,
1.191339, -1.088823, 2.657519, 0, 0, 0, 1, 1,
1.193478, 1.206388, 1.309899, 1, 1, 1, 1, 1,
1.200681, 2.350075, -0.7090272, 1, 1, 1, 1, 1,
1.203716, -0.8629607, 2.611455, 1, 1, 1, 1, 1,
1.207756, 0.6742495, 0.5089185, 1, 1, 1, 1, 1,
1.208079, -0.5732982, 2.787999, 1, 1, 1, 1, 1,
1.217685, -0.1506299, 0.8566433, 1, 1, 1, 1, 1,
1.217774, -0.1949059, -0.02061042, 1, 1, 1, 1, 1,
1.232182, -0.3124753, 1.488239, 1, 1, 1, 1, 1,
1.237952, 0.9843786, 2.761249, 1, 1, 1, 1, 1,
1.250538, 0.2081245, 1.941463, 1, 1, 1, 1, 1,
1.26099, -0.305495, 1.551881, 1, 1, 1, 1, 1,
1.266878, 0.3446346, 0.6624352, 1, 1, 1, 1, 1,
1.27457, 0.7402078, 2.006851, 1, 1, 1, 1, 1,
1.278086, -1.388716, 1.469197, 1, 1, 1, 1, 1,
1.278805, 0.2297748, 0.9334607, 1, 1, 1, 1, 1,
1.282274, 1.273402, 0.2235554, 0, 0, 1, 1, 1,
1.312286, -0.7367581, 1.538238, 1, 0, 0, 1, 1,
1.315725, -2.03299, 3.290323, 1, 0, 0, 1, 1,
1.323, 0.1494016, 0.6755433, 1, 0, 0, 1, 1,
1.336544, 1.367361, 0.7326916, 1, 0, 0, 1, 1,
1.338688, -0.7578625, 2.378443, 1, 0, 0, 1, 1,
1.347073, -0.5885845, 1.007119, 0, 0, 0, 1, 1,
1.356282, -0.5062987, 0.8656642, 0, 0, 0, 1, 1,
1.357855, 0.8711678, 0.3825257, 0, 0, 0, 1, 1,
1.362184, 1.130917, -0.6095463, 0, 0, 0, 1, 1,
1.37437, -0.4652652, 1.832669, 0, 0, 0, 1, 1,
1.376464, 0.2470974, 0.8016691, 0, 0, 0, 1, 1,
1.378453, 1.430814, 0.1272011, 0, 0, 0, 1, 1,
1.389555, -0.7603096, -0.257457, 1, 1, 1, 1, 1,
1.39113, 0.1084028, 1.691333, 1, 1, 1, 1, 1,
1.408027, 0.09218287, 1.147829, 1, 1, 1, 1, 1,
1.409956, -0.9790765, 4.385966, 1, 1, 1, 1, 1,
1.41504, -1.648498, 2.134567, 1, 1, 1, 1, 1,
1.423606, 1.123374, 1.257733, 1, 1, 1, 1, 1,
1.429309, -0.04536508, 2.253303, 1, 1, 1, 1, 1,
1.429782, 0.4043708, 1.646737, 1, 1, 1, 1, 1,
1.440079, 1.091513, 1.171859, 1, 1, 1, 1, 1,
1.442156, -0.9392011, 4.296046, 1, 1, 1, 1, 1,
1.445695, -0.614251, 1.815461, 1, 1, 1, 1, 1,
1.456012, 1.849241, -0.3189417, 1, 1, 1, 1, 1,
1.4661, -0.1552816, 1.671885, 1, 1, 1, 1, 1,
1.47869, 0.3144531, 0.4528077, 1, 1, 1, 1, 1,
1.483966, 0.6397803, -0.8504204, 1, 1, 1, 1, 1,
1.500691, 1.31937, 1.051464, 0, 0, 1, 1, 1,
1.503003, 1.353038, 2.074222, 1, 0, 0, 1, 1,
1.508189, -0.5917463, 1.646155, 1, 0, 0, 1, 1,
1.53221, 1.114875, 0.7669587, 1, 0, 0, 1, 1,
1.549639, 1.71681, -0.2849467, 1, 0, 0, 1, 1,
1.552727, -1.78465, 3.177947, 1, 0, 0, 1, 1,
1.559704, -0.05036764, 2.050771, 0, 0, 0, 1, 1,
1.560773, -0.3406405, 2.45478, 0, 0, 0, 1, 1,
1.571742, 0.5694206, 1.243702, 0, 0, 0, 1, 1,
1.592525, -1.189405, -1.096566, 0, 0, 0, 1, 1,
1.595139, 0.5424628, 1.237501, 0, 0, 0, 1, 1,
1.599419, -0.7994961, 1.06573, 0, 0, 0, 1, 1,
1.608357, 0.4502539, 1.311335, 0, 0, 0, 1, 1,
1.618934, -0.3565191, 2.595085, 1, 1, 1, 1, 1,
1.624189, -1.455061, 2.121707, 1, 1, 1, 1, 1,
1.637424, -0.1284692, 1.264225, 1, 1, 1, 1, 1,
1.654857, 1.433399, 2.557947, 1, 1, 1, 1, 1,
1.684752, 0.6708719, 2.416525, 1, 1, 1, 1, 1,
1.691578, 1.025357, 1.933292, 1, 1, 1, 1, 1,
1.698567, 1.064943, 0.6972944, 1, 1, 1, 1, 1,
1.701159, 0.2857184, 2.715311, 1, 1, 1, 1, 1,
1.706528, -0.9687028, 2.637906, 1, 1, 1, 1, 1,
1.724606, 0.2424325, 0.6877033, 1, 1, 1, 1, 1,
1.734263, -0.250113, 2.074515, 1, 1, 1, 1, 1,
1.738342, 0.7777832, 2.952532, 1, 1, 1, 1, 1,
1.754043, 2.832197, 0.2978172, 1, 1, 1, 1, 1,
1.776656, -0.1023315, 1.754054, 1, 1, 1, 1, 1,
1.78083, -0.5137689, 2.586046, 1, 1, 1, 1, 1,
1.784415, 0.3459689, 2.421133, 0, 0, 1, 1, 1,
1.785586, -1.296538, 1.568, 1, 0, 0, 1, 1,
1.789624, -0.3203938, 2.579366, 1, 0, 0, 1, 1,
1.806067, 0.1662479, 3.197687, 1, 0, 0, 1, 1,
1.811971, 0.1671294, 2.531801, 1, 0, 0, 1, 1,
1.832364, 0.7282836, 2.094105, 1, 0, 0, 1, 1,
1.844303, -1.762411, 1.260081, 0, 0, 0, 1, 1,
1.856504, -1.570441, 3.640366, 0, 0, 0, 1, 1,
1.866033, 0.4084485, 2.416521, 0, 0, 0, 1, 1,
1.880897, -0.3802226, 2.579408, 0, 0, 0, 1, 1,
1.889393, 0.1318931, -0.04537304, 0, 0, 0, 1, 1,
1.898086, 2.366023, 0.06364781, 0, 0, 0, 1, 1,
1.900706, 1.404943, -0.3914089, 0, 0, 0, 1, 1,
1.903253, 1.281777, 2.016229, 1, 1, 1, 1, 1,
1.919955, -0.1631571, 1.146583, 1, 1, 1, 1, 1,
1.924296, 0.1539245, 1.175697, 1, 1, 1, 1, 1,
1.924469, -1.341598, 1.900226, 1, 1, 1, 1, 1,
1.937777, -0.319818, 3.062435, 1, 1, 1, 1, 1,
2.00349, 1.505411, -0.04962028, 1, 1, 1, 1, 1,
2.01978, -0.4907844, 1.72642, 1, 1, 1, 1, 1,
2.020033, 0.158108, 1.114683, 1, 1, 1, 1, 1,
2.031052, -0.07821997, 1.589965, 1, 1, 1, 1, 1,
2.036118, -1.183976, 4.033453, 1, 1, 1, 1, 1,
2.082049, 1.10516, 0.3986575, 1, 1, 1, 1, 1,
2.094976, 0.1538651, 1.574217, 1, 1, 1, 1, 1,
2.09773, 0.6410811, -0.1602083, 1, 1, 1, 1, 1,
2.11463, 0.7899104, 1.71192, 1, 1, 1, 1, 1,
2.121852, 0.1910762, 1.370485, 1, 1, 1, 1, 1,
2.15497, -1.325401, 1.716222, 0, 0, 1, 1, 1,
2.16578, -0.3521569, 1.998522, 1, 0, 0, 1, 1,
2.172089, 0.6756067, 0.33224, 1, 0, 0, 1, 1,
2.274865, 0.2064989, 2.104894, 1, 0, 0, 1, 1,
2.286858, -0.9098648, 3.058627, 1, 0, 0, 1, 1,
2.317468, 0.5688387, -0.8454518, 1, 0, 0, 1, 1,
2.3347, -0.6267363, 2.790303, 0, 0, 0, 1, 1,
2.407656, 0.6746687, 1.378327, 0, 0, 0, 1, 1,
2.473924, -1.645356, 0.3189484, 0, 0, 0, 1, 1,
2.496106, 1.016288, -0.8598527, 0, 0, 0, 1, 1,
2.496532, -0.7592273, 1.986326, 0, 0, 0, 1, 1,
2.570221, -1.970204, 2.717113, 0, 0, 0, 1, 1,
2.73804, 1.013775, 1.260547, 0, 0, 0, 1, 1,
2.778742, -0.2176867, 3.849325, 1, 1, 1, 1, 1,
2.854376, 1.33533, -0.639984, 1, 1, 1, 1, 1,
2.895113, -0.05444792, 1.34089, 1, 1, 1, 1, 1,
2.912104, 2.348944, -0.3679963, 1, 1, 1, 1, 1,
2.937887, -0.9661736, 4.390333, 1, 1, 1, 1, 1,
3.035396, -1.268071, 1.315779, 1, 1, 1, 1, 1,
3.521925, 1.217004, -1.155874, 1, 1, 1, 1, 1
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
var radius = 9.664138;
var distance = 33.94487;
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
mvMatrix.translate( -0.008943081, -0.202377, -0.04614472 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94487);
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
