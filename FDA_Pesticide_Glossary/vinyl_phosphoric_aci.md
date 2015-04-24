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
-3.490385, 0.7381361, -2.514812, 1, 0, 0, 1,
-2.924961, -0.1185502, -0.489279, 1, 0.007843138, 0, 1,
-2.472789, 0.2793895, -1.812002, 1, 0.01176471, 0, 1,
-2.380508, -0.4703329, -1.514625, 1, 0.01960784, 0, 1,
-2.219617, -0.5958583, -2.020466, 1, 0.02352941, 0, 1,
-2.176466, -0.4212276, -0.7522377, 1, 0.03137255, 0, 1,
-2.126567, 1.088298, -1.655817, 1, 0.03529412, 0, 1,
-2.114576, -0.3372083, -0.1732222, 1, 0.04313726, 0, 1,
-2.060664, 1.121828, 0.8990731, 1, 0.04705882, 0, 1,
-2.055878, -1.214694, -1.271318, 1, 0.05490196, 0, 1,
-2.053462, 1.802166, -1.795766, 1, 0.05882353, 0, 1,
-2.046717, -2.060943, -2.029768, 1, 0.06666667, 0, 1,
-1.998294, -1.551771, -1.866588, 1, 0.07058824, 0, 1,
-1.975761, -0.3734251, -1.004246, 1, 0.07843138, 0, 1,
-1.963201, -0.07748261, -1.888881, 1, 0.08235294, 0, 1,
-1.931708, 0.1497148, -1.845781, 1, 0.09019608, 0, 1,
-1.924587, 0.5682504, -2.631649, 1, 0.09411765, 0, 1,
-1.902024, 0.5702348, -2.25767, 1, 0.1019608, 0, 1,
-1.899673, -0.8054388, -1.539523, 1, 0.1098039, 0, 1,
-1.895569, -0.9468333, -0.5970591, 1, 0.1137255, 0, 1,
-1.888988, -0.4302767, -0.9550118, 1, 0.1215686, 0, 1,
-1.847594, -1.997054, -2.38121, 1, 0.1254902, 0, 1,
-1.844316, -0.600155, -2.338511, 1, 0.1333333, 0, 1,
-1.790123, 0.7016197, -0.605682, 1, 0.1372549, 0, 1,
-1.785245, 1.077695, 0.478795, 1, 0.145098, 0, 1,
-1.781541, -0.3594022, -2.513711, 1, 0.1490196, 0, 1,
-1.770037, 0.01134218, -2.829921, 1, 0.1568628, 0, 1,
-1.76905, 0.2440392, -0.8832151, 1, 0.1607843, 0, 1,
-1.759941, -0.3452626, -0.1120251, 1, 0.1686275, 0, 1,
-1.756094, -0.9841059, -2.654561, 1, 0.172549, 0, 1,
-1.754388, -0.8560301, -3.578436, 1, 0.1803922, 0, 1,
-1.737931, 0.5266002, -0.003329983, 1, 0.1843137, 0, 1,
-1.73763, 0.5037266, -0.8042868, 1, 0.1921569, 0, 1,
-1.712605, -0.4936447, -0.8152905, 1, 0.1960784, 0, 1,
-1.706501, 0.9637349, 0.2282512, 1, 0.2039216, 0, 1,
-1.677664, 0.4509119, -1.357994, 1, 0.2117647, 0, 1,
-1.654516, -1.161587, -2.438653, 1, 0.2156863, 0, 1,
-1.647686, 1.092263, -0.9666122, 1, 0.2235294, 0, 1,
-1.642568, -0.234755, -1.874149, 1, 0.227451, 0, 1,
-1.635244, 1.083741, -0.1361401, 1, 0.2352941, 0, 1,
-1.628956, 0.004577597, -2.812839, 1, 0.2392157, 0, 1,
-1.562871, 0.8985927, -2.104055, 1, 0.2470588, 0, 1,
-1.547123, -0.006767891, -4.416112, 1, 0.2509804, 0, 1,
-1.543529, -2.038389, -1.32885, 1, 0.2588235, 0, 1,
-1.542639, -1.097583, -2.146736, 1, 0.2627451, 0, 1,
-1.538585, 1.221628, -0.4210513, 1, 0.2705882, 0, 1,
-1.534567, -0.2932337, -0.06845701, 1, 0.2745098, 0, 1,
-1.527676, 0.3212377, -0.9892995, 1, 0.282353, 0, 1,
-1.521095, 0.4711806, -2.792558, 1, 0.2862745, 0, 1,
-1.518878, -2.536208, -2.299248, 1, 0.2941177, 0, 1,
-1.48506, -0.09586416, -1.000439, 1, 0.3019608, 0, 1,
-1.481212, 0.996457, 0.02733282, 1, 0.3058824, 0, 1,
-1.470222, 0.3014638, -1.195588, 1, 0.3137255, 0, 1,
-1.466134, -0.5435829, -0.2125173, 1, 0.3176471, 0, 1,
-1.433582, 0.1759498, -0.2014929, 1, 0.3254902, 0, 1,
-1.417618, -0.6762584, -2.870734, 1, 0.3294118, 0, 1,
-1.402265, -0.5507699, 0.5610664, 1, 0.3372549, 0, 1,
-1.400555, -0.3393596, 0.6597369, 1, 0.3411765, 0, 1,
-1.392585, -0.1095341, -2.773767, 1, 0.3490196, 0, 1,
-1.390413, 1.596529, 0.09753668, 1, 0.3529412, 0, 1,
-1.390327, 0.223613, -0.5528756, 1, 0.3607843, 0, 1,
-1.381821, 0.7474541, -1.592297, 1, 0.3647059, 0, 1,
-1.380261, -0.8223499, -3.329313, 1, 0.372549, 0, 1,
-1.370341, 0.5769738, -1.497788, 1, 0.3764706, 0, 1,
-1.369597, 0.531934, 0.549589, 1, 0.3843137, 0, 1,
-1.36224, -0.6088873, -1.683538, 1, 0.3882353, 0, 1,
-1.36145, -0.7722011, -2.332424, 1, 0.3960784, 0, 1,
-1.361127, 2.438673, 0.1592744, 1, 0.4039216, 0, 1,
-1.359891, -0.3679866, -2.390946, 1, 0.4078431, 0, 1,
-1.359602, 0.4621581, -0.8501853, 1, 0.4156863, 0, 1,
-1.356429, -1.403283, -1.934898, 1, 0.4196078, 0, 1,
-1.345719, 1.02086, -1.92517, 1, 0.427451, 0, 1,
-1.342417, -1.791291, -1.021648, 1, 0.4313726, 0, 1,
-1.342077, -1.155918, -0.6085178, 1, 0.4392157, 0, 1,
-1.34192, 0.9724864, -1.616584, 1, 0.4431373, 0, 1,
-1.324111, 0.378749, -0.7346199, 1, 0.4509804, 0, 1,
-1.312356, 0.1735867, -1.532061, 1, 0.454902, 0, 1,
-1.301165, 0.491511, -1.341439, 1, 0.4627451, 0, 1,
-1.287608, 2.265658, -1.04902, 1, 0.4666667, 0, 1,
-1.285496, -0.2468478, -1.319454, 1, 0.4745098, 0, 1,
-1.283908, 0.511251, -1.827082, 1, 0.4784314, 0, 1,
-1.281506, 1.592034, -1.193971, 1, 0.4862745, 0, 1,
-1.275259, 0.0386626, -0.1440764, 1, 0.4901961, 0, 1,
-1.265736, 0.9043901, -1.626805, 1, 0.4980392, 0, 1,
-1.260168, 1.120168, 0.8281364, 1, 0.5058824, 0, 1,
-1.259378, 2.157611, -0.9695761, 1, 0.509804, 0, 1,
-1.251811, 0.1936143, -2.58996, 1, 0.5176471, 0, 1,
-1.244637, 1.827986, -2.241252, 1, 0.5215687, 0, 1,
-1.235242, -0.1585825, -2.480757, 1, 0.5294118, 0, 1,
-1.225401, -0.6690863, -4.053587, 1, 0.5333334, 0, 1,
-1.222184, 0.7465033, -1.378311, 1, 0.5411765, 0, 1,
-1.218266, 0.1817381, -1.849854, 1, 0.5450981, 0, 1,
-1.215022, 1.805176, 0.1083541, 1, 0.5529412, 0, 1,
-1.205358, -0.4452349, -2.274844, 1, 0.5568628, 0, 1,
-1.203901, -0.5744488, -2.333796, 1, 0.5647059, 0, 1,
-1.198463, -0.4149303, -1.97095, 1, 0.5686275, 0, 1,
-1.193828, 0.7581287, -1.98481, 1, 0.5764706, 0, 1,
-1.191313, -0.9414137, -3.132741, 1, 0.5803922, 0, 1,
-1.191288, -1.860108, -1.643548, 1, 0.5882353, 0, 1,
-1.189093, -1.323356, -1.982427, 1, 0.5921569, 0, 1,
-1.187134, 2.802449, 0.6351057, 1, 0.6, 0, 1,
-1.177459, 0.3449358, -2.693209, 1, 0.6078432, 0, 1,
-1.175488, -0.1871907, -2.615666, 1, 0.6117647, 0, 1,
-1.171709, -0.6304566, -0.8309789, 1, 0.6196079, 0, 1,
-1.169297, -0.955067, -2.127084, 1, 0.6235294, 0, 1,
-1.168788, 0.04637472, -2.108575, 1, 0.6313726, 0, 1,
-1.165467, -1.044203, -1.921789, 1, 0.6352941, 0, 1,
-1.164878, -1.055188, -1.70326, 1, 0.6431373, 0, 1,
-1.156036, -0.3429462, -0.6999249, 1, 0.6470588, 0, 1,
-1.152386, -1.044832, -1.665997, 1, 0.654902, 0, 1,
-1.148829, 0.8948187, -0.9360176, 1, 0.6588235, 0, 1,
-1.142983, 1.52782, -0.3703704, 1, 0.6666667, 0, 1,
-1.138953, 1.774529, -0.1581641, 1, 0.6705883, 0, 1,
-1.133851, -0.6705167, -3.180796, 1, 0.6784314, 0, 1,
-1.133685, 0.7304744, -2.053529, 1, 0.682353, 0, 1,
-1.13353, -1.569192, -2.23001, 1, 0.6901961, 0, 1,
-1.132733, -0.1720266, 0.01801864, 1, 0.6941177, 0, 1,
-1.130388, 0.426431, -1.00182, 1, 0.7019608, 0, 1,
-1.12938, -0.01069508, -1.51941, 1, 0.7098039, 0, 1,
-1.122788, -0.07544345, -0.07924262, 1, 0.7137255, 0, 1,
-1.118305, 1.947668, 0.438768, 1, 0.7215686, 0, 1,
-1.11633, 2.390085, -0.7970494, 1, 0.7254902, 0, 1,
-1.115659, 0.3203711, -1.602082, 1, 0.7333333, 0, 1,
-1.113504, 0.1419215, -1.448441, 1, 0.7372549, 0, 1,
-1.113483, 0.001838382, -0.8852842, 1, 0.7450981, 0, 1,
-1.110552, -1.358029, -1.933973, 1, 0.7490196, 0, 1,
-1.090378, -0.545735, -1.496037, 1, 0.7568628, 0, 1,
-1.088541, 0.3735517, -0.7910615, 1, 0.7607843, 0, 1,
-1.084852, -0.2720277, -2.602585, 1, 0.7686275, 0, 1,
-1.077164, -0.8129928, -3.846741, 1, 0.772549, 0, 1,
-1.074915, -0.6186281, -3.679732, 1, 0.7803922, 0, 1,
-1.072118, -0.2874456, -3.475499, 1, 0.7843137, 0, 1,
-1.068204, 2.596258, -0.5946497, 1, 0.7921569, 0, 1,
-1.062201, 0.402916, -0.2301457, 1, 0.7960784, 0, 1,
-1.043597, 1.023606, 0.5396873, 1, 0.8039216, 0, 1,
-1.040531, -0.3578754, -4.664983, 1, 0.8117647, 0, 1,
-1.038484, -0.8650395, -2.321386, 1, 0.8156863, 0, 1,
-1.022381, -0.6241646, -0.2971736, 1, 0.8235294, 0, 1,
-1.011966, -1.173474, -0.4437841, 1, 0.827451, 0, 1,
-1.007767, -0.4525255, -2.384009, 1, 0.8352941, 0, 1,
-1.000335, -0.7847245, -2.3147, 1, 0.8392157, 0, 1,
-0.9961107, 0.1288328, -1.018596, 1, 0.8470588, 0, 1,
-0.9959087, -0.7290828, -3.047565, 1, 0.8509804, 0, 1,
-0.9949476, -0.100863, -0.7111449, 1, 0.8588235, 0, 1,
-0.9921606, 0.8297275, -0.5341249, 1, 0.8627451, 0, 1,
-0.9914387, -1.358005, -3.136926, 1, 0.8705882, 0, 1,
-0.9884583, -0.6805481, -4.602585, 1, 0.8745098, 0, 1,
-0.9882909, -0.04313175, -2.043579, 1, 0.8823529, 0, 1,
-0.9868764, -0.5505209, -3.291779, 1, 0.8862745, 0, 1,
-0.9677641, -0.2437609, -3.206397, 1, 0.8941177, 0, 1,
-0.9671674, -2.134681, -4.323376, 1, 0.8980392, 0, 1,
-0.9654905, 0.3050934, -0.695798, 1, 0.9058824, 0, 1,
-0.9521401, 1.054418, 1.3845, 1, 0.9137255, 0, 1,
-0.9510294, 0.6935487, -2.253825, 1, 0.9176471, 0, 1,
-0.9489601, 0.4890922, -2.561108, 1, 0.9254902, 0, 1,
-0.948494, 0.1873577, -1.723562, 1, 0.9294118, 0, 1,
-0.9480912, 2.153647, -0.5944709, 1, 0.9372549, 0, 1,
-0.945867, -0.2236408, -2.605429, 1, 0.9411765, 0, 1,
-0.9444767, 0.4582404, -1.238405, 1, 0.9490196, 0, 1,
-0.9426187, 0.4033313, -0.9481491, 1, 0.9529412, 0, 1,
-0.9420554, 0.6373028, -0.8940856, 1, 0.9607843, 0, 1,
-0.935904, 1.943279, -2.073782, 1, 0.9647059, 0, 1,
-0.9347292, -0.7613829, -1.611761, 1, 0.972549, 0, 1,
-0.9281649, 0.1085951, -1.566615, 1, 0.9764706, 0, 1,
-0.9239989, -2.635442, -3.996083, 1, 0.9843137, 0, 1,
-0.9238353, -0.29364, -1.660871, 1, 0.9882353, 0, 1,
-0.9236696, -1.044369, -2.92966, 1, 0.9960784, 0, 1,
-0.922758, 0.3491527, -0.3815454, 0.9960784, 1, 0, 1,
-0.9195287, -0.1596664, -1.612568, 0.9921569, 1, 0, 1,
-0.9126, 0.1814696, -2.388721, 0.9843137, 1, 0, 1,
-0.9059086, -0.8315547, -2.104502, 0.9803922, 1, 0, 1,
-0.8957498, -0.5414569, -1.626258, 0.972549, 1, 0, 1,
-0.8956147, -0.4482651, 0.03137299, 0.9686275, 1, 0, 1,
-0.8896506, 0.0002461042, -1.918205, 0.9607843, 1, 0, 1,
-0.8817474, -1.025494, -3.128396, 0.9568627, 1, 0, 1,
-0.8764741, 0.5223035, -0.9314293, 0.9490196, 1, 0, 1,
-0.8740576, -0.9731236, -2.821994, 0.945098, 1, 0, 1,
-0.873731, 0.09190876, -1.251595, 0.9372549, 1, 0, 1,
-0.8722044, 2.259913, -0.7601996, 0.9333333, 1, 0, 1,
-0.8707602, -0.5001498, -1.655473, 0.9254902, 1, 0, 1,
-0.8655986, -0.4572561, -2.594257, 0.9215686, 1, 0, 1,
-0.8639855, -0.2058406, -1.731377, 0.9137255, 1, 0, 1,
-0.84488, -2.697015, -4.185721, 0.9098039, 1, 0, 1,
-0.8419544, -0.9942094, -4.153349, 0.9019608, 1, 0, 1,
-0.8386345, -0.08380612, -1.182477, 0.8941177, 1, 0, 1,
-0.83591, -0.9355437, -1.831421, 0.8901961, 1, 0, 1,
-0.8352328, -1.267405, -2.607622, 0.8823529, 1, 0, 1,
-0.8325823, 0.9611697, -0.2073731, 0.8784314, 1, 0, 1,
-0.8228304, -1.548402, -1.607812, 0.8705882, 1, 0, 1,
-0.8181936, -1.401201, -4.727779, 0.8666667, 1, 0, 1,
-0.8147847, -0.4808967, -2.76633, 0.8588235, 1, 0, 1,
-0.8113929, 0.393906, 0.556164, 0.854902, 1, 0, 1,
-0.8050869, -0.1290631, -2.388115, 0.8470588, 1, 0, 1,
-0.7900648, 0.1280643, -2.290458, 0.8431373, 1, 0, 1,
-0.7859275, 1.387045, 1.187049, 0.8352941, 1, 0, 1,
-0.7816186, 0.3362547, -1.203315, 0.8313726, 1, 0, 1,
-0.7807927, 0.78708, -0.1464328, 0.8235294, 1, 0, 1,
-0.7805396, -0.3466455, -2.027778, 0.8196079, 1, 0, 1,
-0.7803294, 2.510491, -0.7076805, 0.8117647, 1, 0, 1,
-0.7740237, -0.14399, -2.760517, 0.8078431, 1, 0, 1,
-0.7737197, 1.315276, -1.612552, 0.8, 1, 0, 1,
-0.7665315, 0.2728738, -1.450605, 0.7921569, 1, 0, 1,
-0.7646202, 0.310875, -1.630468, 0.7882353, 1, 0, 1,
-0.7641313, -0.006930633, -2.47442, 0.7803922, 1, 0, 1,
-0.7589713, -1.018879, -2.277997, 0.7764706, 1, 0, 1,
-0.7537695, 0.8552905, -1.198393, 0.7686275, 1, 0, 1,
-0.7358944, 0.4013595, -1.837699, 0.7647059, 1, 0, 1,
-0.735193, -2.025814, -2.709758, 0.7568628, 1, 0, 1,
-0.7297075, 1.557282, -0.4924909, 0.7529412, 1, 0, 1,
-0.7277392, -1.334323, -1.846192, 0.7450981, 1, 0, 1,
-0.7264301, -0.454853, -2.814548, 0.7411765, 1, 0, 1,
-0.7257506, -0.2708789, -1.466566, 0.7333333, 1, 0, 1,
-0.7219324, 0.9162624, -3.038256, 0.7294118, 1, 0, 1,
-0.7215912, -1.277288, -1.842345, 0.7215686, 1, 0, 1,
-0.7167941, 1.254616, -1.767587, 0.7176471, 1, 0, 1,
-0.715628, -0.01527503, -1.229625, 0.7098039, 1, 0, 1,
-0.6951279, -0.2739649, -0.7782558, 0.7058824, 1, 0, 1,
-0.6937428, 0.09455256, -1.908794, 0.6980392, 1, 0, 1,
-0.6919191, -2.547191, -2.760666, 0.6901961, 1, 0, 1,
-0.6906659, 0.211734, -1.296441, 0.6862745, 1, 0, 1,
-0.6884746, 0.1399211, -1.044015, 0.6784314, 1, 0, 1,
-0.6883745, 0.5983097, -2.226297, 0.6745098, 1, 0, 1,
-0.6877732, 1.481068, -2.295642, 0.6666667, 1, 0, 1,
-0.6849717, 0.7415869, -1.292961, 0.6627451, 1, 0, 1,
-0.6800086, -0.01045043, 0.3034748, 0.654902, 1, 0, 1,
-0.6784927, 0.3923458, -2.299595, 0.6509804, 1, 0, 1,
-0.676138, -0.4634148, -1.907735, 0.6431373, 1, 0, 1,
-0.6733512, 0.01882987, -0.1987019, 0.6392157, 1, 0, 1,
-0.6724482, 0.06842645, -0.8616087, 0.6313726, 1, 0, 1,
-0.6690288, -0.8838248, -1.071108, 0.627451, 1, 0, 1,
-0.6652455, -1.218844, -3.618943, 0.6196079, 1, 0, 1,
-0.6612685, 0.6539316, -0.3125363, 0.6156863, 1, 0, 1,
-0.6552891, -0.0352743, -3.347369, 0.6078432, 1, 0, 1,
-0.6540742, 0.5887557, -1.796533, 0.6039216, 1, 0, 1,
-0.6536127, -1.918172, -3.725837, 0.5960785, 1, 0, 1,
-0.6415558, 1.020995, -1.983172, 0.5882353, 1, 0, 1,
-0.6399741, -1.087803, -2.977165, 0.5843138, 1, 0, 1,
-0.6376863, -0.2892321, -3.433427, 0.5764706, 1, 0, 1,
-0.6373578, -1.109434, -1.644122, 0.572549, 1, 0, 1,
-0.6357658, 0.1534514, -2.50658, 0.5647059, 1, 0, 1,
-0.6291837, 1.145147, -1.080029, 0.5607843, 1, 0, 1,
-0.6246229, 0.6998053, 0.08305656, 0.5529412, 1, 0, 1,
-0.6225154, -2.049139, -2.223544, 0.5490196, 1, 0, 1,
-0.6200302, -0.2801351, -2.327369, 0.5411765, 1, 0, 1,
-0.6135385, -0.8644347, -0.6549573, 0.5372549, 1, 0, 1,
-0.6134611, 0.774303, -1.279861, 0.5294118, 1, 0, 1,
-0.6128738, 0.7077924, -0.06163502, 0.5254902, 1, 0, 1,
-0.6085064, -1.820014, -2.445117, 0.5176471, 1, 0, 1,
-0.6044391, -0.8803743, -2.811617, 0.5137255, 1, 0, 1,
-0.6024305, 0.05050773, -1.283128, 0.5058824, 1, 0, 1,
-0.6023636, -0.2342591, -1.015113, 0.5019608, 1, 0, 1,
-0.6003892, 0.9873783, -0.2334344, 0.4941176, 1, 0, 1,
-0.5973981, -1.162056, -3.09926, 0.4862745, 1, 0, 1,
-0.5920415, 0.4639035, -0.7806941, 0.4823529, 1, 0, 1,
-0.5859931, -1.23913, -4.228981, 0.4745098, 1, 0, 1,
-0.5856085, -0.2268299, -1.414216, 0.4705882, 1, 0, 1,
-0.5830503, -0.2639023, 0.7820129, 0.4627451, 1, 0, 1,
-0.5823048, -0.669876, -2.983796, 0.4588235, 1, 0, 1,
-0.5780323, 0.3823111, -1.565051, 0.4509804, 1, 0, 1,
-0.5765905, 1.334478, 0.8592355, 0.4470588, 1, 0, 1,
-0.5744519, 1.00481, -1.169738, 0.4392157, 1, 0, 1,
-0.5742099, 1.441509, 0.650282, 0.4352941, 1, 0, 1,
-0.5692219, -0.130748, -1.390001, 0.427451, 1, 0, 1,
-0.5674841, 0.9830366, -1.095845, 0.4235294, 1, 0, 1,
-0.5459679, -1.68567, -4.807021, 0.4156863, 1, 0, 1,
-0.5453511, -0.3401828, -2.193098, 0.4117647, 1, 0, 1,
-0.5445154, -0.4130184, -1.229608, 0.4039216, 1, 0, 1,
-0.5429432, -0.983, -3.173301, 0.3960784, 1, 0, 1,
-0.5385309, -0.8555897, -3.527647, 0.3921569, 1, 0, 1,
-0.5365957, -0.344639, -0.8409303, 0.3843137, 1, 0, 1,
-0.5347988, 2.540137, -1.323267, 0.3803922, 1, 0, 1,
-0.5301387, -0.4481669, -1.353806, 0.372549, 1, 0, 1,
-0.5262823, -0.578992, -0.4401552, 0.3686275, 1, 0, 1,
-0.5236516, -1.636004, -2.518251, 0.3607843, 1, 0, 1,
-0.5136352, -0.900813, -4.319115, 0.3568628, 1, 0, 1,
-0.5090963, 1.191017, -0.248494, 0.3490196, 1, 0, 1,
-0.5051601, -0.4953653, -2.483506, 0.345098, 1, 0, 1,
-0.5048169, -0.8582313, -3.957157, 0.3372549, 1, 0, 1,
-0.5040238, 0.1561957, -0.9677152, 0.3333333, 1, 0, 1,
-0.5006027, -0.8407685, -1.665285, 0.3254902, 1, 0, 1,
-0.50019, -0.2974261, -2.573797, 0.3215686, 1, 0, 1,
-0.4998953, -1.650835, -1.446005, 0.3137255, 1, 0, 1,
-0.4948394, 1.25518, -1.548717, 0.3098039, 1, 0, 1,
-0.4902847, -0.9449383, -2.716573, 0.3019608, 1, 0, 1,
-0.4883024, -0.1278683, -2.1278, 0.2941177, 1, 0, 1,
-0.4799669, -0.0885167, -1.487127, 0.2901961, 1, 0, 1,
-0.4782611, -0.9271957, -2.325061, 0.282353, 1, 0, 1,
-0.4768831, -0.5237868, -2.398983, 0.2784314, 1, 0, 1,
-0.4730886, -0.446531, -3.51624, 0.2705882, 1, 0, 1,
-0.4697766, 0.4232253, 0.9325207, 0.2666667, 1, 0, 1,
-0.4671868, -0.07337102, -0.9503469, 0.2588235, 1, 0, 1,
-0.4650682, 1.10766, 0.6191179, 0.254902, 1, 0, 1,
-0.4630912, -0.985206, -1.942654, 0.2470588, 1, 0, 1,
-0.4565513, 1.907113, -2.35466, 0.2431373, 1, 0, 1,
-0.4556722, -0.9014649, -2.073244, 0.2352941, 1, 0, 1,
-0.4554144, -2.667176, -2.181238, 0.2313726, 1, 0, 1,
-0.455105, 0.282832, -2.318, 0.2235294, 1, 0, 1,
-0.4534828, -0.9066264, -3.362921, 0.2196078, 1, 0, 1,
-0.4510255, -1.718455, -2.85245, 0.2117647, 1, 0, 1,
-0.4492506, 0.07233788, -1.582137, 0.2078431, 1, 0, 1,
-0.4473501, -1.636683, -2.025953, 0.2, 1, 0, 1,
-0.4459138, -1.023521, -2.402339, 0.1921569, 1, 0, 1,
-0.4411792, 1.250602, -1.68461, 0.1882353, 1, 0, 1,
-0.4384736, 1.943578, 0.7488188, 0.1803922, 1, 0, 1,
-0.4368485, -0.972343, -5.869112, 0.1764706, 1, 0, 1,
-0.4356337, -0.3011753, -0.4547397, 0.1686275, 1, 0, 1,
-0.4320998, -0.1570355, -2.81268, 0.1647059, 1, 0, 1,
-0.4294394, -1.064755, -1.504948, 0.1568628, 1, 0, 1,
-0.429254, 0.7201852, -0.3627707, 0.1529412, 1, 0, 1,
-0.4275012, 0.3484219, -2.489681, 0.145098, 1, 0, 1,
-0.4259455, 1.255004, 0.2012915, 0.1411765, 1, 0, 1,
-0.4253455, -0.2471922, -1.615101, 0.1333333, 1, 0, 1,
-0.4251394, 1.441525, 0.6908143, 0.1294118, 1, 0, 1,
-0.4239853, -0.1610628, -1.909395, 0.1215686, 1, 0, 1,
-0.4224294, -0.1617226, -2.511997, 0.1176471, 1, 0, 1,
-0.4198044, 0.5713751, 1.68231, 0.1098039, 1, 0, 1,
-0.4171845, 2.662513, 0.5693325, 0.1058824, 1, 0, 1,
-0.4165013, 0.8979716, 0.05810745, 0.09803922, 1, 0, 1,
-0.4140418, -1.140928, -1.955017, 0.09019608, 1, 0, 1,
-0.4111042, 1.432144, -0.2993558, 0.08627451, 1, 0, 1,
-0.4092619, -1.629291, -2.130461, 0.07843138, 1, 0, 1,
-0.4035741, -0.3523876, -1.374744, 0.07450981, 1, 0, 1,
-0.40263, -0.06166595, -0.6490602, 0.06666667, 1, 0, 1,
-0.3955159, 0.8714973, 1.40728, 0.0627451, 1, 0, 1,
-0.3894722, -1.015047, -2.701011, 0.05490196, 1, 0, 1,
-0.3867839, 0.02485531, -1.269427, 0.05098039, 1, 0, 1,
-0.3843722, -1.533227, -4.661418, 0.04313726, 1, 0, 1,
-0.3801103, -1.279987, -2.036901, 0.03921569, 1, 0, 1,
-0.3742894, 0.3751223, -2.383475, 0.03137255, 1, 0, 1,
-0.3725241, 0.4822987, -1.88913, 0.02745098, 1, 0, 1,
-0.3722707, 0.1108453, -1.131377, 0.01960784, 1, 0, 1,
-0.3668076, -1.13834, -4.394643, 0.01568628, 1, 0, 1,
-0.3636398, 0.5350872, -0.1238438, 0.007843138, 1, 0, 1,
-0.3601523, -1.493815, -2.063837, 0.003921569, 1, 0, 1,
-0.358449, -0.2825025, -1.881784, 0, 1, 0.003921569, 1,
-0.3514788, -0.3691929, -1.401003, 0, 1, 0.01176471, 1,
-0.3504538, 0.07933757, -1.682681, 0, 1, 0.01568628, 1,
-0.3492188, 0.9438935, -1.809452, 0, 1, 0.02352941, 1,
-0.3480401, 0.9925376, 0.9047457, 0, 1, 0.02745098, 1,
-0.3450509, 0.3772425, -1.704435, 0, 1, 0.03529412, 1,
-0.3444378, -0.4994052, -2.237831, 0, 1, 0.03921569, 1,
-0.3368843, 1.055597, 0.4005442, 0, 1, 0.04705882, 1,
-0.3324158, 0.8723829, -0.02091067, 0, 1, 0.05098039, 1,
-0.331339, 0.6192867, 1.036568, 0, 1, 0.05882353, 1,
-0.3312416, 0.6833726, -1.680609, 0, 1, 0.0627451, 1,
-0.3291765, -1.808141, -2.782928, 0, 1, 0.07058824, 1,
-0.323532, 0.3257003, -2.108432, 0, 1, 0.07450981, 1,
-0.3158635, 0.05412957, -2.375327, 0, 1, 0.08235294, 1,
-0.3144575, 0.7042624, -3.461207, 0, 1, 0.08627451, 1,
-0.3137539, 0.2343429, -1.121845, 0, 1, 0.09411765, 1,
-0.3104778, -0.1032093, -0.7209097, 0, 1, 0.1019608, 1,
-0.3093099, 0.5286385, -0.3154593, 0, 1, 0.1058824, 1,
-0.3059467, -0.5973888, -2.49262, 0, 1, 0.1137255, 1,
-0.3026928, 0.8432446, -0.09293973, 0, 1, 0.1176471, 1,
-0.2922479, 0.4556862, 0.1292262, 0, 1, 0.1254902, 1,
-0.2918057, 0.4331679, -1.176127, 0, 1, 0.1294118, 1,
-0.2903214, -0.4108754, -0.2155088, 0, 1, 0.1372549, 1,
-0.28361, 0.7077917, -1.956469, 0, 1, 0.1411765, 1,
-0.282629, -0.1528598, -0.9359925, 0, 1, 0.1490196, 1,
-0.2815845, 0.8287663, -1.011684, 0, 1, 0.1529412, 1,
-0.2777838, -0.2741812, -3.214688, 0, 1, 0.1607843, 1,
-0.2746765, 1.389943, 1.879465, 0, 1, 0.1647059, 1,
-0.27317, -0.5812777, -2.118905, 0, 1, 0.172549, 1,
-0.2718917, -0.2502372, -3.799432, 0, 1, 0.1764706, 1,
-0.2661768, -0.000809658, -1.582594, 0, 1, 0.1843137, 1,
-0.265969, -0.129624, -1.087224, 0, 1, 0.1882353, 1,
-0.2581154, -0.3984658, -4.566226, 0, 1, 0.1960784, 1,
-0.2571509, -2.005318, -3.337067, 0, 1, 0.2039216, 1,
-0.2514441, 0.3890629, 0.3222411, 0, 1, 0.2078431, 1,
-0.2497453, -1.097745, -3.169338, 0, 1, 0.2156863, 1,
-0.2445959, -0.2848094, -3.359575, 0, 1, 0.2196078, 1,
-0.23689, -0.5751086, -1.230278, 0, 1, 0.227451, 1,
-0.2350826, 0.3721989, -0.1312505, 0, 1, 0.2313726, 1,
-0.2348855, -0.591971, -3.983189, 0, 1, 0.2392157, 1,
-0.2326736, -0.4315052, -0.1355514, 0, 1, 0.2431373, 1,
-0.2315283, -0.2170608, -2.776167, 0, 1, 0.2509804, 1,
-0.2299015, -0.7606957, -4.370455, 0, 1, 0.254902, 1,
-0.2275216, 1.326173, -0.7550838, 0, 1, 0.2627451, 1,
-0.2253034, -0.7242109, 0.02552651, 0, 1, 0.2666667, 1,
-0.2250177, -1.55318, -2.454953, 0, 1, 0.2745098, 1,
-0.2241898, 0.6432537, -0.193488, 0, 1, 0.2784314, 1,
-0.22088, -1.58494, -3.908187, 0, 1, 0.2862745, 1,
-0.2151968, 0.4653873, -1.620698, 0, 1, 0.2901961, 1,
-0.2136505, -0.7745578, -3.345115, 0, 1, 0.2980392, 1,
-0.2136283, 0.2586379, -1.004864, 0, 1, 0.3058824, 1,
-0.2124432, -0.2728537, -3.324373, 0, 1, 0.3098039, 1,
-0.2073031, 1.360182, 0.3886758, 0, 1, 0.3176471, 1,
-0.2061261, 0.4506044, 0.076672, 0, 1, 0.3215686, 1,
-0.2044925, -1.084035, -5.425972, 0, 1, 0.3294118, 1,
-0.2032677, 1.43235, 1.337411, 0, 1, 0.3333333, 1,
-0.2031669, -0.1926621, -1.729205, 0, 1, 0.3411765, 1,
-0.1987373, -0.1542424, -1.903838, 0, 1, 0.345098, 1,
-0.1962822, 0.7582875, 1.889791, 0, 1, 0.3529412, 1,
-0.1943492, 0.2041275, -1.868857, 0, 1, 0.3568628, 1,
-0.1929724, -1.374733, -4.416264, 0, 1, 0.3647059, 1,
-0.1921209, 0.608899, -0.5492445, 0, 1, 0.3686275, 1,
-0.187832, 0.3991207, 0.7238992, 0, 1, 0.3764706, 1,
-0.1873502, -0.4492577, -3.482192, 0, 1, 0.3803922, 1,
-0.1872804, -0.8387188, -1.885024, 0, 1, 0.3882353, 1,
-0.1757085, -0.530343, -4.453091, 0, 1, 0.3921569, 1,
-0.175159, -0.4684553, -2.408223, 0, 1, 0.4, 1,
-0.1724715, 0.2687454, -0.831281, 0, 1, 0.4078431, 1,
-0.1722656, -0.3910502, -2.132725, 0, 1, 0.4117647, 1,
-0.1716665, 0.3847687, -1.251541, 0, 1, 0.4196078, 1,
-0.1714676, -1.232443, -1.133559, 0, 1, 0.4235294, 1,
-0.1700708, -1.084341, -2.322631, 0, 1, 0.4313726, 1,
-0.1694003, 0.9821552, -0.5358382, 0, 1, 0.4352941, 1,
-0.1684311, -0.2563675, -3.056464, 0, 1, 0.4431373, 1,
-0.1652598, 0.718979, -1.084615, 0, 1, 0.4470588, 1,
-0.1636758, 0.7430618, 3.224843, 0, 1, 0.454902, 1,
-0.1622576, -0.127903, -4.003706, 0, 1, 0.4588235, 1,
-0.1585315, 0.5932714, -0.132731, 0, 1, 0.4666667, 1,
-0.15813, -0.9891078, -1.779953, 0, 1, 0.4705882, 1,
-0.1534434, 0.3042312, 0.1325019, 0, 1, 0.4784314, 1,
-0.1508557, 0.5109171, -1.765668, 0, 1, 0.4823529, 1,
-0.1504445, 0.2935838, 0.8491144, 0, 1, 0.4901961, 1,
-0.1502231, 0.1135342, -1.989942, 0, 1, 0.4941176, 1,
-0.1488561, -0.3802682, -3.071888, 0, 1, 0.5019608, 1,
-0.1486634, 0.8389455, 0.6586845, 0, 1, 0.509804, 1,
-0.1457169, -0.8325729, -4.043719, 0, 1, 0.5137255, 1,
-0.1386269, -0.5290639, -2.842405, 0, 1, 0.5215687, 1,
-0.1375729, 1.33267, -1.001374, 0, 1, 0.5254902, 1,
-0.135135, 0.257336, 1.299824, 0, 1, 0.5333334, 1,
-0.1313888, 1.505139, -1.802928, 0, 1, 0.5372549, 1,
-0.1307819, -0.1687659, -1.828488, 0, 1, 0.5450981, 1,
-0.1291427, -0.09649699, -2.200504, 0, 1, 0.5490196, 1,
-0.1190292, -1.067768, -4.143404, 0, 1, 0.5568628, 1,
-0.1178558, 0.4803115, -1.483108, 0, 1, 0.5607843, 1,
-0.117785, -0.03276235, -0.5290851, 0, 1, 0.5686275, 1,
-0.1132614, 0.1612636, -0.8381714, 0, 1, 0.572549, 1,
-0.1076454, -1.122595, -0.5544085, 0, 1, 0.5803922, 1,
-0.1024252, -2.211095, -2.186677, 0, 1, 0.5843138, 1,
-0.1000344, -1.398233, -3.862877, 0, 1, 0.5921569, 1,
-0.09982471, -0.8651759, -3.248518, 0, 1, 0.5960785, 1,
-0.0954761, -1.08695, -2.331137, 0, 1, 0.6039216, 1,
-0.09484698, 1.865719, -1.126706, 0, 1, 0.6117647, 1,
-0.0928314, -0.6654018, -0.410082, 0, 1, 0.6156863, 1,
-0.09279143, 0.3279482, 0.9870253, 0, 1, 0.6235294, 1,
-0.09102738, -0.06301778, -3.980437, 0, 1, 0.627451, 1,
-0.09092384, -0.4436904, -2.130537, 0, 1, 0.6352941, 1,
-0.08924992, 1.246618, 0.1256814, 0, 1, 0.6392157, 1,
-0.08396422, 1.273554, 2.423328, 0, 1, 0.6470588, 1,
-0.07651468, 1.286319, 2.082705, 0, 1, 0.6509804, 1,
-0.07182452, 0.6578849, 2.214746, 0, 1, 0.6588235, 1,
-0.06904069, 1.794496, 2.00747, 0, 1, 0.6627451, 1,
-0.06783672, -0.6171451, -2.068104, 0, 1, 0.6705883, 1,
-0.06709589, -0.2377105, -3.415628, 0, 1, 0.6745098, 1,
-0.06421418, -0.2885758, -3.097622, 0, 1, 0.682353, 1,
-0.06236608, 0.4499635, -0.526245, 0, 1, 0.6862745, 1,
-0.05989661, 0.3886014, -0.7884198, 0, 1, 0.6941177, 1,
-0.05847099, 0.3700193, -2.688835, 0, 1, 0.7019608, 1,
-0.05532417, 0.2920295, -0.118652, 0, 1, 0.7058824, 1,
-0.05462511, -0.4043917, -3.377866, 0, 1, 0.7137255, 1,
-0.05091703, -0.4780547, 0.06266765, 0, 1, 0.7176471, 1,
-0.04963972, 0.03878475, -0.545789, 0, 1, 0.7254902, 1,
-0.04589676, 0.1805013, -0.2237572, 0, 1, 0.7294118, 1,
-0.0429735, 0.1601192, -1.385932, 0, 1, 0.7372549, 1,
-0.04191034, 0.1244479, 0.2096601, 0, 1, 0.7411765, 1,
-0.0349033, -0.931878, -3.405518, 0, 1, 0.7490196, 1,
-0.03245265, -0.9241787, -3.93314, 0, 1, 0.7529412, 1,
-0.03108604, 0.09835785, -0.7722571, 0, 1, 0.7607843, 1,
-0.03104558, -0.201381, -3.26192, 0, 1, 0.7647059, 1,
-0.03057136, 1.00017, 2.006468, 0, 1, 0.772549, 1,
-0.02941801, -0.5031563, -2.178162, 0, 1, 0.7764706, 1,
-0.02575531, 0.2861343, 0.7264129, 0, 1, 0.7843137, 1,
-0.01942686, -0.4065646, -3.02385, 0, 1, 0.7882353, 1,
-0.01709474, -2.103211, -4.502734, 0, 1, 0.7960784, 1,
-0.01658024, -1.44143, -3.794503, 0, 1, 0.8039216, 1,
-0.01591733, -1.57821, -2.407588, 0, 1, 0.8078431, 1,
-0.0149477, 1.322532, 0.2406795, 0, 1, 0.8156863, 1,
-0.01248543, 0.3890502, -0.7058055, 0, 1, 0.8196079, 1,
-0.01206044, 0.5387566, 1.409331, 0, 1, 0.827451, 1,
-0.01103016, 2.90873, 0.3066213, 0, 1, 0.8313726, 1,
-0.007792563, -0.1026833, -3.201996, 0, 1, 0.8392157, 1,
-0.007145536, -0.3292093, -2.759953, 0, 1, 0.8431373, 1,
-0.003729166, 1.842881, -0.2635265, 0, 1, 0.8509804, 1,
-0.002198919, 0.8028846, -1.115586, 0, 1, 0.854902, 1,
0.0008759565, -0.9920901, 3.883924, 0, 1, 0.8627451, 1,
0.002542723, 0.3948318, 1.528401, 0, 1, 0.8666667, 1,
0.00348992, -0.6452826, 3.272497, 0, 1, 0.8745098, 1,
0.0126774, 0.4882637, 0.6388581, 0, 1, 0.8784314, 1,
0.01538173, -0.4786556, 1.417454, 0, 1, 0.8862745, 1,
0.01611236, 0.3107803, -1.596205, 0, 1, 0.8901961, 1,
0.01782144, 0.5241553, -0.7361127, 0, 1, 0.8980392, 1,
0.02218254, 0.5447639, 1.056557, 0, 1, 0.9058824, 1,
0.02909904, -0.9534024, 3.938616, 0, 1, 0.9098039, 1,
0.03206414, 1.08217, 0.5003034, 0, 1, 0.9176471, 1,
0.03333638, 0.001724086, 4.095305, 0, 1, 0.9215686, 1,
0.03696641, -0.8345759, 4.351892, 0, 1, 0.9294118, 1,
0.03766859, -0.2597194, 2.417217, 0, 1, 0.9333333, 1,
0.0401313, -0.666966, 2.091727, 0, 1, 0.9411765, 1,
0.04149246, 1.105236, 0.9934717, 0, 1, 0.945098, 1,
0.04283755, -1.287614, 4.625823, 0, 1, 0.9529412, 1,
0.04358491, 0.6636435, -0.08156017, 0, 1, 0.9568627, 1,
0.04608386, -0.05559844, 3.30384, 0, 1, 0.9647059, 1,
0.04754015, 0.1846431, -0.1611138, 0, 1, 0.9686275, 1,
0.04948252, 1.27411, -0.335871, 0, 1, 0.9764706, 1,
0.05319596, -0.591057, 3.693245, 0, 1, 0.9803922, 1,
0.05529342, -0.393027, 1.256143, 0, 1, 0.9882353, 1,
0.05836115, 1.194718, 0.6853881, 0, 1, 0.9921569, 1,
0.0616432, -0.06110254, 2.147594, 0, 1, 1, 1,
0.06244934, -0.1190946, 3.308988, 0, 0.9921569, 1, 1,
0.06327419, 0.8547962, 1.715418, 0, 0.9882353, 1, 1,
0.06353152, 1.178139, 0.8400379, 0, 0.9803922, 1, 1,
0.06436706, -0.5360249, 2.82781, 0, 0.9764706, 1, 1,
0.06601533, -1.593642, 4.346659, 0, 0.9686275, 1, 1,
0.07108123, -1.057612, 5.000212, 0, 0.9647059, 1, 1,
0.07297537, 0.586873, -0.4845022, 0, 0.9568627, 1, 1,
0.07629649, -0.1918212, 3.927693, 0, 0.9529412, 1, 1,
0.07687677, 0.0912047, 0.6506455, 0, 0.945098, 1, 1,
0.08042707, 1.237426, -0.6217411, 0, 0.9411765, 1, 1,
0.08530641, 0.9445437, 0.1549291, 0, 0.9333333, 1, 1,
0.08620224, 0.03279003, 1.90369, 0, 0.9294118, 1, 1,
0.08634123, 0.7909606, -1.091861, 0, 0.9215686, 1, 1,
0.08780911, -1.076653, 5.166288, 0, 0.9176471, 1, 1,
0.09375381, 1.538834, 0.5651959, 0, 0.9098039, 1, 1,
0.09567385, 1.703183, 2.678677, 0, 0.9058824, 1, 1,
0.101784, -0.2917761, 2.035372, 0, 0.8980392, 1, 1,
0.101802, 1.830297, 0.4989482, 0, 0.8901961, 1, 1,
0.1038089, 0.1815918, 1.132669, 0, 0.8862745, 1, 1,
0.1042699, 0.2696651, 0.1873734, 0, 0.8784314, 1, 1,
0.1054104, 1.674754, 1.177358, 0, 0.8745098, 1, 1,
0.1077617, 0.01871244, 1.24987, 0, 0.8666667, 1, 1,
0.1107086, -0.2666134, 3.154634, 0, 0.8627451, 1, 1,
0.1127091, -0.6578193, 2.644442, 0, 0.854902, 1, 1,
0.1127514, -0.3839331, 2.965404, 0, 0.8509804, 1, 1,
0.1128755, 0.2155031, 0.9921846, 0, 0.8431373, 1, 1,
0.1173657, 0.05477731, 0.4341581, 0, 0.8392157, 1, 1,
0.1216996, -0.4185156, 2.530403, 0, 0.8313726, 1, 1,
0.1221786, -1.178633, 2.656181, 0, 0.827451, 1, 1,
0.124849, 0.6971787, -0.07078021, 0, 0.8196079, 1, 1,
0.1248862, -2.149497, 2.455148, 0, 0.8156863, 1, 1,
0.1254408, 0.5270537, -1.445405, 0, 0.8078431, 1, 1,
0.1258829, 0.9924852, 0.2946207, 0, 0.8039216, 1, 1,
0.1315565, 0.3092355, 2.263677, 0, 0.7960784, 1, 1,
0.1320079, -1.961999, 2.467709, 0, 0.7882353, 1, 1,
0.1322585, -0.3737949, 2.41841, 0, 0.7843137, 1, 1,
0.1334349, 0.5581703, 0.06228187, 0, 0.7764706, 1, 1,
0.1394098, 0.5563188, 0.355765, 0, 0.772549, 1, 1,
0.143448, -0.1094917, 1.520641, 0, 0.7647059, 1, 1,
0.1454925, -0.1397711, 4.344548, 0, 0.7607843, 1, 1,
0.1538123, 0.03809093, 1.325818, 0, 0.7529412, 1, 1,
0.1574611, 0.2847186, 0.6318573, 0, 0.7490196, 1, 1,
0.1653984, -1.958766, 2.454477, 0, 0.7411765, 1, 1,
0.1671087, 0.8649842, 0.1510821, 0, 0.7372549, 1, 1,
0.1677116, 0.1713149, 1.527921, 0, 0.7294118, 1, 1,
0.1719541, 0.2326897, 0.0860984, 0, 0.7254902, 1, 1,
0.1721176, -0.4810455, 3.530896, 0, 0.7176471, 1, 1,
0.1808643, -0.09435926, 1.284367, 0, 0.7137255, 1, 1,
0.1832744, 0.4162912, 0.4437324, 0, 0.7058824, 1, 1,
0.1908881, -0.4316531, 2.888179, 0, 0.6980392, 1, 1,
0.1947515, 0.6136199, 2.050144, 0, 0.6941177, 1, 1,
0.1996019, 1.396631, -2.119241, 0, 0.6862745, 1, 1,
0.2030301, 0.3783491, -0.2195098, 0, 0.682353, 1, 1,
0.2041254, -0.03862263, 3.185924, 0, 0.6745098, 1, 1,
0.2064483, 1.407575, -0.6750241, 0, 0.6705883, 1, 1,
0.2104369, -0.666378, 3.484325, 0, 0.6627451, 1, 1,
0.2116322, -0.9255174, 2.904701, 0, 0.6588235, 1, 1,
0.2144194, -0.5170318, 2.314453, 0, 0.6509804, 1, 1,
0.2186119, 1.110447, 1.469442, 0, 0.6470588, 1, 1,
0.2189302, -0.769814, 2.995563, 0, 0.6392157, 1, 1,
0.219673, 1.107292, 1.703759, 0, 0.6352941, 1, 1,
0.223619, -0.6039097, 1.97321, 0, 0.627451, 1, 1,
0.2247316, -0.4142638, 1.724052, 0, 0.6235294, 1, 1,
0.2335777, -0.8674803, 3.92328, 0, 0.6156863, 1, 1,
0.2369981, -0.2706565, 1.183788, 0, 0.6117647, 1, 1,
0.2388528, 1.282092, -0.09166881, 0, 0.6039216, 1, 1,
0.2424224, -0.4349344, 2.339903, 0, 0.5960785, 1, 1,
0.2472338, -1.441141, 3.194397, 0, 0.5921569, 1, 1,
0.2479295, 1.081449, -2.093325, 0, 0.5843138, 1, 1,
0.2495256, -1.475024, 1.181879, 0, 0.5803922, 1, 1,
0.2502099, -0.1291666, 1.952403, 0, 0.572549, 1, 1,
0.2542745, 1.081482, -0.02100539, 0, 0.5686275, 1, 1,
0.2594275, -0.3892547, 2.994796, 0, 0.5607843, 1, 1,
0.2734278, -0.4315985, 3.092339, 0, 0.5568628, 1, 1,
0.2735193, 0.3771259, 0.586836, 0, 0.5490196, 1, 1,
0.2743814, 0.8475884, -1.33966, 0, 0.5450981, 1, 1,
0.2812559, 0.2491292, 1.661154, 0, 0.5372549, 1, 1,
0.2832656, 0.2348788, -0.1606506, 0, 0.5333334, 1, 1,
0.2857865, -1.135348, 2.07635, 0, 0.5254902, 1, 1,
0.2875176, -0.3320057, 1.029317, 0, 0.5215687, 1, 1,
0.2887113, -0.4792919, 1.976634, 0, 0.5137255, 1, 1,
0.2923308, 1.546471, 2.179724, 0, 0.509804, 1, 1,
0.2937916, -0.6322619, 4.204901, 0, 0.5019608, 1, 1,
0.2944887, -0.532211, 2.541551, 0, 0.4941176, 1, 1,
0.2957932, 0.4894188, -0.2849441, 0, 0.4901961, 1, 1,
0.296849, -0.3483043, 3.064613, 0, 0.4823529, 1, 1,
0.3003475, 0.6516758, 0.4043591, 0, 0.4784314, 1, 1,
0.3067302, -0.9777474, 3.126819, 0, 0.4705882, 1, 1,
0.3097451, 1.030727, -0.2981584, 0, 0.4666667, 1, 1,
0.3101146, 1.481454, -0.7418172, 0, 0.4588235, 1, 1,
0.311059, 1.288229, 0.6100535, 0, 0.454902, 1, 1,
0.3145776, -0.5022439, 1.49081, 0, 0.4470588, 1, 1,
0.3160258, -0.09308066, 2.716959, 0, 0.4431373, 1, 1,
0.3171885, -0.8132859, 3.260159, 0, 0.4352941, 1, 1,
0.3187699, -0.5044463, 3.29752, 0, 0.4313726, 1, 1,
0.321601, 0.4229068, 0.5602503, 0, 0.4235294, 1, 1,
0.3224021, 0.8067062, -1.326702, 0, 0.4196078, 1, 1,
0.3237381, 0.8054877, -0.532755, 0, 0.4117647, 1, 1,
0.3251463, 1.008477, 0.4200371, 0, 0.4078431, 1, 1,
0.3257945, 0.7503241, 1.208773, 0, 0.4, 1, 1,
0.3287261, -0.802429, 4.340704, 0, 0.3921569, 1, 1,
0.3295884, 0.1753038, 0.4166064, 0, 0.3882353, 1, 1,
0.3429546, 0.4287284, -1.456085, 0, 0.3803922, 1, 1,
0.3487539, 0.4181203, 1.375778, 0, 0.3764706, 1, 1,
0.3492446, -0.4132652, 2.613453, 0, 0.3686275, 1, 1,
0.3536026, 0.4184194, 2.880035, 0, 0.3647059, 1, 1,
0.3542036, 0.9655408, 0.5509344, 0, 0.3568628, 1, 1,
0.3544261, 0.6645203, 0.9348218, 0, 0.3529412, 1, 1,
0.3548926, -0.1375402, 0.8967305, 0, 0.345098, 1, 1,
0.355903, -0.4549528, 1.711288, 0, 0.3411765, 1, 1,
0.3574112, -0.9498697, 1.699883, 0, 0.3333333, 1, 1,
0.3596598, 0.9781272, -0.2216999, 0, 0.3294118, 1, 1,
0.360252, 1.156821, 0.6175261, 0, 0.3215686, 1, 1,
0.3653929, 0.9035342, -1.458604, 0, 0.3176471, 1, 1,
0.365628, -0.9414986, 1.084596, 0, 0.3098039, 1, 1,
0.3719384, -2.037563, 2.216351, 0, 0.3058824, 1, 1,
0.3725592, 1.027296, -0.4478495, 0, 0.2980392, 1, 1,
0.3730024, -0.2083649, 1.998204, 0, 0.2901961, 1, 1,
0.373063, -2.554989, 3.346323, 0, 0.2862745, 1, 1,
0.3738181, -1.190454, 4.202999, 0, 0.2784314, 1, 1,
0.3740116, -0.3951494, 1.814156, 0, 0.2745098, 1, 1,
0.3806837, -0.436964, 0.9518424, 0, 0.2666667, 1, 1,
0.3843125, -1.106828, 4.701809, 0, 0.2627451, 1, 1,
0.3843704, 2.438771, -0.7168415, 0, 0.254902, 1, 1,
0.3855787, -1.062269, 2.763246, 0, 0.2509804, 1, 1,
0.3888609, 0.546988, 0.7937899, 0, 0.2431373, 1, 1,
0.3933171, -0.3778242, 4.629211, 0, 0.2392157, 1, 1,
0.3940459, -0.3614524, 2.480773, 0, 0.2313726, 1, 1,
0.3952571, 0.0388284, 2.063931, 0, 0.227451, 1, 1,
0.3963288, 0.5373696, 1.179569, 0, 0.2196078, 1, 1,
0.3980571, -2.401599, 1.343663, 0, 0.2156863, 1, 1,
0.4012378, -0.8271404, 2.357993, 0, 0.2078431, 1, 1,
0.4064296, -0.3715238, 2.2224, 0, 0.2039216, 1, 1,
0.407252, 0.5824072, 0.888321, 0, 0.1960784, 1, 1,
0.4073529, -0.1220109, 0.7057488, 0, 0.1882353, 1, 1,
0.4170406, -0.8487744, 2.384953, 0, 0.1843137, 1, 1,
0.4212021, 1.40438, 2.283583, 0, 0.1764706, 1, 1,
0.4214418, 1.170578, -1.009874, 0, 0.172549, 1, 1,
0.4218485, 0.9343713, 0.06298206, 0, 0.1647059, 1, 1,
0.4260136, 0.2677385, 1.293516, 0, 0.1607843, 1, 1,
0.4280953, -0.5001392, 2.692032, 0, 0.1529412, 1, 1,
0.4294145, 0.3435371, 1.723899, 0, 0.1490196, 1, 1,
0.43272, -1.28986, 2.435067, 0, 0.1411765, 1, 1,
0.4343864, 0.5464631, 0.2653348, 0, 0.1372549, 1, 1,
0.4358505, -0.9924977, 1.117939, 0, 0.1294118, 1, 1,
0.4360964, -0.2765879, 2.460075, 0, 0.1254902, 1, 1,
0.4382502, -0.4250706, 3.368314, 0, 0.1176471, 1, 1,
0.4388866, 0.5284591, 0.3679861, 0, 0.1137255, 1, 1,
0.4432279, -1.042476, 2.303771, 0, 0.1058824, 1, 1,
0.447592, -0.206354, 1.994089, 0, 0.09803922, 1, 1,
0.4507588, -0.543462, 4.237065, 0, 0.09411765, 1, 1,
0.455739, 0.4005766, 1.540764, 0, 0.08627451, 1, 1,
0.4566736, -1.877714, 2.514967, 0, 0.08235294, 1, 1,
0.4573242, -1.271357, 3.123306, 0, 0.07450981, 1, 1,
0.4589167, -0.8074624, 3.246721, 0, 0.07058824, 1, 1,
0.4606179, -0.2496922, 3.385238, 0, 0.0627451, 1, 1,
0.4669167, -0.4108469, 2.975904, 0, 0.05882353, 1, 1,
0.4684432, 1.026414, 0.1063236, 0, 0.05098039, 1, 1,
0.4687432, -0.05359732, 2.113744, 0, 0.04705882, 1, 1,
0.4691248, -0.1446761, -1.537315, 0, 0.03921569, 1, 1,
0.4721354, 0.1590053, 2.179903, 0, 0.03529412, 1, 1,
0.4721859, -1.770558, 3.708388, 0, 0.02745098, 1, 1,
0.4752226, -1.175623, 1.736383, 0, 0.02352941, 1, 1,
0.4796262, 0.1508503, -1.562241, 0, 0.01568628, 1, 1,
0.4846267, -1.504766, 1.564452, 0, 0.01176471, 1, 1,
0.4865862, -0.9980217, 0.3350054, 0, 0.003921569, 1, 1,
0.4896251, -0.2923459, 2.115782, 0.003921569, 0, 1, 1,
0.4910342, -1.478284, 1.09455, 0.007843138, 0, 1, 1,
0.4928858, 0.2534614, 1.149796, 0.01568628, 0, 1, 1,
0.4943055, -0.7300934, 1.235861, 0.01960784, 0, 1, 1,
0.5017175, -0.4889556, 3.326532, 0.02745098, 0, 1, 1,
0.5055771, 1.259432, 0.06917918, 0.03137255, 0, 1, 1,
0.5070048, -1.696728, 2.485099, 0.03921569, 0, 1, 1,
0.5085704, 0.5264627, -0.0795243, 0.04313726, 0, 1, 1,
0.5090181, 0.01153625, 1.233137, 0.05098039, 0, 1, 1,
0.5126712, -1.348008, 1.081863, 0.05490196, 0, 1, 1,
0.5129834, -1.815728, 3.336784, 0.0627451, 0, 1, 1,
0.5153278, 1.440032, 0.9203846, 0.06666667, 0, 1, 1,
0.516834, -0.6745155, 2.696737, 0.07450981, 0, 1, 1,
0.5170931, -1.318554, 0.5914899, 0.07843138, 0, 1, 1,
0.5198199, -0.6604346, 1.955754, 0.08627451, 0, 1, 1,
0.5219028, -0.762292, 1.205431, 0.09019608, 0, 1, 1,
0.5266097, -0.6780493, 3.919032, 0.09803922, 0, 1, 1,
0.5270607, 0.04263499, 1.659438, 0.1058824, 0, 1, 1,
0.5284067, 0.3301577, 3.530419, 0.1098039, 0, 1, 1,
0.5293375, 0.1979278, 0.349311, 0.1176471, 0, 1, 1,
0.5394496, 1.516805, -0.2586767, 0.1215686, 0, 1, 1,
0.5453289, 0.5267909, 0.6104325, 0.1294118, 0, 1, 1,
0.5486501, 0.7598662, 0.8002759, 0.1333333, 0, 1, 1,
0.5516254, -0.9970212, 3.867342, 0.1411765, 0, 1, 1,
0.5516918, 0.4208183, 0.7847252, 0.145098, 0, 1, 1,
0.5524495, 0.2123082, -0.4570218, 0.1529412, 0, 1, 1,
0.5590811, -0.7204782, 2.340168, 0.1568628, 0, 1, 1,
0.5591227, -1.883013, 1.395537, 0.1647059, 0, 1, 1,
0.5596988, -1.418623, 1.976121, 0.1686275, 0, 1, 1,
0.56387, -0.3183742, 2.584279, 0.1764706, 0, 1, 1,
0.5655605, -1.420689, 3.172788, 0.1803922, 0, 1, 1,
0.5686707, 0.01742794, 3.948793, 0.1882353, 0, 1, 1,
0.5732312, 0.7713078, 1.473777, 0.1921569, 0, 1, 1,
0.5745996, 0.1707028, 1.37184, 0.2, 0, 1, 1,
0.5784477, -0.03491905, 0.8825356, 0.2078431, 0, 1, 1,
0.5834261, 1.57321, -0.5294498, 0.2117647, 0, 1, 1,
0.5933436, 1.43474, 0.6988596, 0.2196078, 0, 1, 1,
0.5978348, -0.7433348, 1.870083, 0.2235294, 0, 1, 1,
0.5980309, 0.5874258, 1.192227, 0.2313726, 0, 1, 1,
0.5999225, -0.8744983, 2.082026, 0.2352941, 0, 1, 1,
0.6058189, 0.3267069, 1.131554, 0.2431373, 0, 1, 1,
0.6072451, 1.978872, -1.139189, 0.2470588, 0, 1, 1,
0.608073, 0.375174, 0.5566508, 0.254902, 0, 1, 1,
0.610441, -1.442047, 3.156087, 0.2588235, 0, 1, 1,
0.6177647, 0.2894929, -0.3750201, 0.2666667, 0, 1, 1,
0.6206113, 0.09150289, -0.331028, 0.2705882, 0, 1, 1,
0.624303, -0.778326, 3.637667, 0.2784314, 0, 1, 1,
0.6257967, 0.2096505, 0.9673769, 0.282353, 0, 1, 1,
0.6258258, -0.5495894, 0.7034205, 0.2901961, 0, 1, 1,
0.6266733, 1.274009, -2.112413, 0.2941177, 0, 1, 1,
0.6357311, -1.558043, 2.282562, 0.3019608, 0, 1, 1,
0.6360267, -1.176145, 3.069098, 0.3098039, 0, 1, 1,
0.6396624, 0.3385718, 0.7882627, 0.3137255, 0, 1, 1,
0.640581, -0.8186288, 1.754747, 0.3215686, 0, 1, 1,
0.6469865, -0.6153703, 2.153744, 0.3254902, 0, 1, 1,
0.6480061, 1.289432, 1.290274, 0.3333333, 0, 1, 1,
0.6483768, -0.6726564, 1.894712, 0.3372549, 0, 1, 1,
0.6507307, 1.323625, 1.586936, 0.345098, 0, 1, 1,
0.6528643, -1.118443, 3.733459, 0.3490196, 0, 1, 1,
0.6534841, 0.8598719, 0.7123764, 0.3568628, 0, 1, 1,
0.6539559, 1.004132, 0.9397459, 0.3607843, 0, 1, 1,
0.6576082, 0.05090865, 0.9331365, 0.3686275, 0, 1, 1,
0.6578078, 0.2115066, 1.489962, 0.372549, 0, 1, 1,
0.6586168, 0.2139687, 0.6839837, 0.3803922, 0, 1, 1,
0.6636399, 1.94593, -0.3121405, 0.3843137, 0, 1, 1,
0.6691676, 0.7419837, 2.109938, 0.3921569, 0, 1, 1,
0.6703379, 1.044666, 0.6958127, 0.3960784, 0, 1, 1,
0.6752179, -0.2875116, 3.095458, 0.4039216, 0, 1, 1,
0.676356, 0.2074074, 0.7298082, 0.4117647, 0, 1, 1,
0.6795429, -0.2017207, 1.735631, 0.4156863, 0, 1, 1,
0.6818118, 0.3010767, 1.724408, 0.4235294, 0, 1, 1,
0.6853902, -0.2090858, 0.6603475, 0.427451, 0, 1, 1,
0.6880367, -0.9259531, 3.734067, 0.4352941, 0, 1, 1,
0.6882691, -1.296448, 0.5879703, 0.4392157, 0, 1, 1,
0.6907568, -0.7714198, 1.630563, 0.4470588, 0, 1, 1,
0.6908962, 0.4385725, 0.2267118, 0.4509804, 0, 1, 1,
0.6935384, 0.2370785, 1.073557, 0.4588235, 0, 1, 1,
0.6939376, -0.9241623, 1.876073, 0.4627451, 0, 1, 1,
0.6947514, -0.3274153, 2.276397, 0.4705882, 0, 1, 1,
0.6957529, 0.9351153, -0.3249383, 0.4745098, 0, 1, 1,
0.7004963, 1.554917, 0.2114712, 0.4823529, 0, 1, 1,
0.7031066, 0.3990319, 2.686602, 0.4862745, 0, 1, 1,
0.7041076, 0.4825847, 2.179631, 0.4941176, 0, 1, 1,
0.7055812, -1.429672, 2.592788, 0.5019608, 0, 1, 1,
0.7247025, 0.5651926, -0.3218296, 0.5058824, 0, 1, 1,
0.7289261, -0.8826132, 1.294863, 0.5137255, 0, 1, 1,
0.7360984, -1.847126, 3.172298, 0.5176471, 0, 1, 1,
0.7370244, 1.33449, 1.594426, 0.5254902, 0, 1, 1,
0.737583, 0.6480831, 2.32765, 0.5294118, 0, 1, 1,
0.738086, 0.1789545, 1.617053, 0.5372549, 0, 1, 1,
0.7422392, 1.140965, 1.259982, 0.5411765, 0, 1, 1,
0.7465489, -1.083032, 1.977432, 0.5490196, 0, 1, 1,
0.7468216, -0.1317328, 2.011331, 0.5529412, 0, 1, 1,
0.747995, -0.9375092, 4.293556, 0.5607843, 0, 1, 1,
0.749466, -1.910778, 1.262471, 0.5647059, 0, 1, 1,
0.7495175, 1.955065, -0.4986483, 0.572549, 0, 1, 1,
0.7503095, 0.705277, 1.560564, 0.5764706, 0, 1, 1,
0.750856, -0.3395391, 1.692086, 0.5843138, 0, 1, 1,
0.755167, 1.809451, 0.3797806, 0.5882353, 0, 1, 1,
0.7568887, -0.5098221, 2.0581, 0.5960785, 0, 1, 1,
0.7571985, -1.225401, 2.985119, 0.6039216, 0, 1, 1,
0.7574899, -0.4055834, 4.319602, 0.6078432, 0, 1, 1,
0.7579436, -0.7467949, 2.019058, 0.6156863, 0, 1, 1,
0.7638122, -0.3173873, 2.279427, 0.6196079, 0, 1, 1,
0.7660242, 0.501412, 0.1630233, 0.627451, 0, 1, 1,
0.7717958, -0.3362825, 1.960076, 0.6313726, 0, 1, 1,
0.7766933, 0.3147244, 1.672479, 0.6392157, 0, 1, 1,
0.782598, 1.186216, 1.767212, 0.6431373, 0, 1, 1,
0.7831037, 1.268061, 1.992664, 0.6509804, 0, 1, 1,
0.7871989, -1.465484, 3.764888, 0.654902, 0, 1, 1,
0.7885736, 0.5705334, 0.9375761, 0.6627451, 0, 1, 1,
0.7911872, 1.994362, -0.5646803, 0.6666667, 0, 1, 1,
0.7973288, 0.2515753, 4.25953, 0.6745098, 0, 1, 1,
0.7990013, 0.3749799, 1.917493, 0.6784314, 0, 1, 1,
0.7997845, 0.8477403, 1.331729, 0.6862745, 0, 1, 1,
0.8052397, 0.8447424, -0.7533634, 0.6901961, 0, 1, 1,
0.8075261, -0.2246298, -0.5611823, 0.6980392, 0, 1, 1,
0.8115469, -0.8059042, 1.953179, 0.7058824, 0, 1, 1,
0.8178495, -0.3249376, 1.752271, 0.7098039, 0, 1, 1,
0.8195534, 0.3748905, 1.692895, 0.7176471, 0, 1, 1,
0.8243217, 0.6396086, 3.88191, 0.7215686, 0, 1, 1,
0.8260807, -0.9136968, 0.4066996, 0.7294118, 0, 1, 1,
0.8347167, 0.2602109, 1.328481, 0.7333333, 0, 1, 1,
0.839002, -0.6213098, 1.533998, 0.7411765, 0, 1, 1,
0.840637, -2.152913, 2.399418, 0.7450981, 0, 1, 1,
0.8412889, -0.109536, -0.9676479, 0.7529412, 0, 1, 1,
0.8417658, 0.800005, 3.684242, 0.7568628, 0, 1, 1,
0.8430318, -0.4709826, 1.129208, 0.7647059, 0, 1, 1,
0.8497992, -0.6061451, 2.821444, 0.7686275, 0, 1, 1,
0.8579045, 0.1789528, 1.150972, 0.7764706, 0, 1, 1,
0.8585351, 0.591767, 2.561782, 0.7803922, 0, 1, 1,
0.8631617, 0.1590797, 3.403679, 0.7882353, 0, 1, 1,
0.864372, -0.5048446, 2.939682, 0.7921569, 0, 1, 1,
0.8644102, 1.692592, 0.8961961, 0.8, 0, 1, 1,
0.864457, -0.3830978, 2.099437, 0.8078431, 0, 1, 1,
0.8659006, -1.175623, 0.4607916, 0.8117647, 0, 1, 1,
0.8694274, 1.303761, 0.6931302, 0.8196079, 0, 1, 1,
0.8801227, -0.8407297, 4.104492, 0.8235294, 0, 1, 1,
0.8834352, 0.5491064, 1.796263, 0.8313726, 0, 1, 1,
0.8859026, 0.4954548, 1.458534, 0.8352941, 0, 1, 1,
0.8862401, -1.351894, 1.51495, 0.8431373, 0, 1, 1,
0.8902804, -1.204945, 1.752439, 0.8470588, 0, 1, 1,
0.8991851, 0.9589303, -0.1426992, 0.854902, 0, 1, 1,
0.9028169, -1.188991, 1.083485, 0.8588235, 0, 1, 1,
0.9069366, 0.01492782, 2.07464, 0.8666667, 0, 1, 1,
0.911328, 1.494523, -1.627991, 0.8705882, 0, 1, 1,
0.9169108, 2.356532, -0.585753, 0.8784314, 0, 1, 1,
0.9182946, -1.60557, 2.42406, 0.8823529, 0, 1, 1,
0.9209661, 0.5814608, 0.6766679, 0.8901961, 0, 1, 1,
0.9247862, 1.637163, 0.01854545, 0.8941177, 0, 1, 1,
0.9255424, -0.03216531, 0.8162441, 0.9019608, 0, 1, 1,
0.9256157, 0.2201424, 1.730646, 0.9098039, 0, 1, 1,
0.9268718, 0.130335, 3.796509, 0.9137255, 0, 1, 1,
0.9297675, 0.569593, 0.008750129, 0.9215686, 0, 1, 1,
0.9310436, -0.9312871, 2.058294, 0.9254902, 0, 1, 1,
0.9381321, -0.485008, 0.5452781, 0.9333333, 0, 1, 1,
0.947723, -0.7196699, 1.59479, 0.9372549, 0, 1, 1,
0.9480187, -0.7626624, 3.209786, 0.945098, 0, 1, 1,
0.9559958, -0.008018528, 0.3715293, 0.9490196, 0, 1, 1,
0.9675496, 0.3102232, 1.294157, 0.9568627, 0, 1, 1,
0.9678801, -0.434548, 0.8665023, 0.9607843, 0, 1, 1,
0.9712303, -1.103572, 3.042615, 0.9686275, 0, 1, 1,
0.9719303, 0.8978295, 1.527633, 0.972549, 0, 1, 1,
0.9729545, 0.184722, 1.017135, 0.9803922, 0, 1, 1,
0.9781719, -1.164603, 2.0456, 0.9843137, 0, 1, 1,
0.978209, -0.1854117, 3.002022, 0.9921569, 0, 1, 1,
0.9851425, 0.5314199, 0.06348995, 0.9960784, 0, 1, 1,
0.9926947, 0.3077485, 1.316925, 1, 0, 0.9960784, 1,
0.997136, -0.03026174, 1.050022, 1, 0, 0.9882353, 1,
0.9997618, -1.825925, 3.745097, 1, 0, 0.9843137, 1,
1.003259, 0.6601724, 0.701867, 1, 0, 0.9764706, 1,
1.008968, -0.2347767, 2.804646, 1, 0, 0.972549, 1,
1.016874, 0.2004256, 0.3116807, 1, 0, 0.9647059, 1,
1.01757, -0.4866525, 4.802854, 1, 0, 0.9607843, 1,
1.017611, -1.283481, 4.047043, 1, 0, 0.9529412, 1,
1.019331, -2.117555, 3.69228, 1, 0, 0.9490196, 1,
1.027468, -1.560717, 0.1640948, 1, 0, 0.9411765, 1,
1.028828, 0.2009477, 2.211112, 1, 0, 0.9372549, 1,
1.032497, 0.03636238, 2.86991, 1, 0, 0.9294118, 1,
1.035772, 0.7036015, -0.1570147, 1, 0, 0.9254902, 1,
1.035972, 0.5847365, 0.7727849, 1, 0, 0.9176471, 1,
1.036026, 2.061968, 0.2506407, 1, 0, 0.9137255, 1,
1.040535, -0.694764, 2.147966, 1, 0, 0.9058824, 1,
1.040898, -0.2816814, 0.7220637, 1, 0, 0.9019608, 1,
1.047466, 0.6082146, 1.392172, 1, 0, 0.8941177, 1,
1.048812, 0.2738816, 1.793927, 1, 0, 0.8862745, 1,
1.05388, 0.6160699, -0.6673709, 1, 0, 0.8823529, 1,
1.053955, -1.060116, 2.768602, 1, 0, 0.8745098, 1,
1.056401, 1.078206, -1.099447, 1, 0, 0.8705882, 1,
1.059908, -0.7072038, 2.733159, 1, 0, 0.8627451, 1,
1.063787, 0.1093065, 1.007048, 1, 0, 0.8588235, 1,
1.071467, -2.077801, 3.621902, 1, 0, 0.8509804, 1,
1.071732, -0.2324508, 1.942973, 1, 0, 0.8470588, 1,
1.074394, 1.223229, 0.5447477, 1, 0, 0.8392157, 1,
1.081083, 0.9586204, -0.04297215, 1, 0, 0.8352941, 1,
1.082588, 0.9754532, 2.376456, 1, 0, 0.827451, 1,
1.085068, -0.200341, 1.580372, 1, 0, 0.8235294, 1,
1.085799, 1.451407, 1.191896, 1, 0, 0.8156863, 1,
1.087674, -0.9477341, 1.658197, 1, 0, 0.8117647, 1,
1.090468, 0.4078424, 2.016283, 1, 0, 0.8039216, 1,
1.095768, 1.482929, 0.3821667, 1, 0, 0.7960784, 1,
1.097385, 1.648094, 0.8708742, 1, 0, 0.7921569, 1,
1.104071, 1.323328, 1.308876, 1, 0, 0.7843137, 1,
1.109275, -0.5101157, 3.568406, 1, 0, 0.7803922, 1,
1.1169, -0.3237275, 1.193866, 1, 0, 0.772549, 1,
1.118225, 0.1533272, 0.171165, 1, 0, 0.7686275, 1,
1.121062, -0.5961431, 0.8717722, 1, 0, 0.7607843, 1,
1.124969, 0.3122908, 1.483352, 1, 0, 0.7568628, 1,
1.139687, 0.9920803, 0.5335793, 1, 0, 0.7490196, 1,
1.141292, -1.608137, 2.70616, 1, 0, 0.7450981, 1,
1.14541, 0.9844218, -0.8730357, 1, 0, 0.7372549, 1,
1.150945, -1.635125, 2.705025, 1, 0, 0.7333333, 1,
1.169284, -0.3891944, 0.4623668, 1, 0, 0.7254902, 1,
1.179953, 0.02041429, 2.131727, 1, 0, 0.7215686, 1,
1.180148, -0.1786329, 2.307132, 1, 0, 0.7137255, 1,
1.194827, -0.1133392, 2.523065, 1, 0, 0.7098039, 1,
1.20181, 0.3001345, 2.2994, 1, 0, 0.7019608, 1,
1.202292, -1.634337, 3.206324, 1, 0, 0.6941177, 1,
1.204592, -0.6295661, 1.255482, 1, 0, 0.6901961, 1,
1.230264, 1.071972, 2.087911, 1, 0, 0.682353, 1,
1.231217, -1.167356, 1.322629, 1, 0, 0.6784314, 1,
1.253145, -0.4205381, 2.557488, 1, 0, 0.6705883, 1,
1.254339, -1.560777, 2.960114, 1, 0, 0.6666667, 1,
1.254441, -2.33315, 2.888512, 1, 0, 0.6588235, 1,
1.274889, 0.8681611, 1.717279, 1, 0, 0.654902, 1,
1.279882, 0.4492891, 1.305194, 1, 0, 0.6470588, 1,
1.285268, -0.7335212, 1.385579, 1, 0, 0.6431373, 1,
1.286349, -0.9975148, 0.5954945, 1, 0, 0.6352941, 1,
1.288206, -0.1845922, 1.269752, 1, 0, 0.6313726, 1,
1.290196, 0.2801634, 0.1343253, 1, 0, 0.6235294, 1,
1.297389, -1.570829, 3.475461, 1, 0, 0.6196079, 1,
1.31704, -0.6699503, 1.212201, 1, 0, 0.6117647, 1,
1.324753, 1.93381, 0.7304985, 1, 0, 0.6078432, 1,
1.328151, -0.6237743, 2.015425, 1, 0, 0.6, 1,
1.329111, -1.512867, 3.544613, 1, 0, 0.5921569, 1,
1.332242, -0.6068994, 1.270732, 1, 0, 0.5882353, 1,
1.342446, 0.8831254, 1.038481, 1, 0, 0.5803922, 1,
1.349319, -0.4880823, 2.17827, 1, 0, 0.5764706, 1,
1.351026, -0.08101247, 0.9842693, 1, 0, 0.5686275, 1,
1.353394, 0.07873742, 1.21286, 1, 0, 0.5647059, 1,
1.355467, -0.5043333, 1.550034, 1, 0, 0.5568628, 1,
1.365015, 0.4993351, -0.153583, 1, 0, 0.5529412, 1,
1.36559, 0.03528019, 1.436162, 1, 0, 0.5450981, 1,
1.367583, -0.281168, 1.978164, 1, 0, 0.5411765, 1,
1.376646, -0.4120809, 1.707884, 1, 0, 0.5333334, 1,
1.386302, 0.972054, 0.9424175, 1, 0, 0.5294118, 1,
1.386765, 0.6468353, 1.035529, 1, 0, 0.5215687, 1,
1.389377, -0.03455225, 1.468474, 1, 0, 0.5176471, 1,
1.389404, -0.9894238, 1.861938, 1, 0, 0.509804, 1,
1.414693, 0.1973192, 1.605757, 1, 0, 0.5058824, 1,
1.418374, -0.5681913, 1.101265, 1, 0, 0.4980392, 1,
1.422611, -0.3360005, 1.266397, 1, 0, 0.4901961, 1,
1.424926, 0.5363772, 0.9211379, 1, 0, 0.4862745, 1,
1.434165, 0.542855, -0.04490551, 1, 0, 0.4784314, 1,
1.442083, 0.3803812, -1.014179, 1, 0, 0.4745098, 1,
1.463448, 1.704305, 0.3156887, 1, 0, 0.4666667, 1,
1.48366, -0.7103747, 0.7675296, 1, 0, 0.4627451, 1,
1.488644, -2.034747, 2.359554, 1, 0, 0.454902, 1,
1.555091, 0.364915, 0.2095589, 1, 0, 0.4509804, 1,
1.55939, -0.549479, 1.011612, 1, 0, 0.4431373, 1,
1.563957, -1.225339, 3.885675, 1, 0, 0.4392157, 1,
1.572736, 0.8111373, 3.560143, 1, 0, 0.4313726, 1,
1.578166, 0.3640697, 0.4223174, 1, 0, 0.427451, 1,
1.579084, -0.2109153, 1.698909, 1, 0, 0.4196078, 1,
1.600416, -0.2515887, 1.351422, 1, 0, 0.4156863, 1,
1.600519, 0.1870716, 0.841172, 1, 0, 0.4078431, 1,
1.603722, 0.08723143, 0.9986042, 1, 0, 0.4039216, 1,
1.622721, -0.6325156, 2.404504, 1, 0, 0.3960784, 1,
1.630338, -0.108895, -0.3235484, 1, 0, 0.3882353, 1,
1.638, -1.026693, 1.15248, 1, 0, 0.3843137, 1,
1.646953, -0.7505891, 1.312607, 1, 0, 0.3764706, 1,
1.647353, -0.8704751, 1.949165, 1, 0, 0.372549, 1,
1.648788, -0.6131878, 2.362575, 1, 0, 0.3647059, 1,
1.670324, 0.9577077, 1.37492, 1, 0, 0.3607843, 1,
1.67361, -1.833369, 2.694152, 1, 0, 0.3529412, 1,
1.683741, -0.1465706, 1.408633, 1, 0, 0.3490196, 1,
1.68446, -0.9008052, 0.6104441, 1, 0, 0.3411765, 1,
1.694464, -0.558569, 2.046788, 1, 0, 0.3372549, 1,
1.695626, 0.8871174, 1.945257, 1, 0, 0.3294118, 1,
1.71511, 0.8009251, 0.6362765, 1, 0, 0.3254902, 1,
1.741359, 0.6068502, -0.4703209, 1, 0, 0.3176471, 1,
1.743358, -0.3706507, 2.206309, 1, 0, 0.3137255, 1,
1.753994, -1.17796, 2.000946, 1, 0, 0.3058824, 1,
1.754195, 2.189421, 1.214676, 1, 0, 0.2980392, 1,
1.771609, 0.17065, 0.83483, 1, 0, 0.2941177, 1,
1.777414, -0.6605219, 3.26234, 1, 0, 0.2862745, 1,
1.777503, -0.4152691, 1.765416, 1, 0, 0.282353, 1,
1.789546, -0.3701198, 3.802177, 1, 0, 0.2745098, 1,
1.803936, -0.1678109, 2.261477, 1, 0, 0.2705882, 1,
1.830924, -1.452714, 0.6255212, 1, 0, 0.2627451, 1,
1.850373, 1.113592, 0.5636879, 1, 0, 0.2588235, 1,
1.873516, -2.19786, 1.77044, 1, 0, 0.2509804, 1,
1.87797, 0.9442431, 2.135793, 1, 0, 0.2470588, 1,
1.891743, 0.2124776, -0.02650832, 1, 0, 0.2392157, 1,
1.904046, -0.137507, 2.031447, 1, 0, 0.2352941, 1,
1.913396, -1.312095, 0.9926341, 1, 0, 0.227451, 1,
1.923349, 0.2307746, 2.325456, 1, 0, 0.2235294, 1,
1.944592, -2.772956, 2.172481, 1, 0, 0.2156863, 1,
1.956249, -2.015937, 0.1557794, 1, 0, 0.2117647, 1,
2.014947, 0.01432283, 2.503577, 1, 0, 0.2039216, 1,
2.038516, -1.288569, 2.056233, 1, 0, 0.1960784, 1,
2.042518, 0.4430035, 2.51299, 1, 0, 0.1921569, 1,
2.064639, -0.46395, 0.126278, 1, 0, 0.1843137, 1,
2.090033, 1.274761, 2.746488, 1, 0, 0.1803922, 1,
2.094195, -0.5596023, 2.522082, 1, 0, 0.172549, 1,
2.095007, 0.9829543, 3.922382, 1, 0, 0.1686275, 1,
2.143206, 0.9316834, 3.357422, 1, 0, 0.1607843, 1,
2.144581, 1.71075, 2.019948, 1, 0, 0.1568628, 1,
2.145774, -0.3952579, 3.227216, 1, 0, 0.1490196, 1,
2.167469, -0.5721056, 1.265444, 1, 0, 0.145098, 1,
2.18258, 0.502472, 0.9746419, 1, 0, 0.1372549, 1,
2.182611, 0.9989296, 0.1867842, 1, 0, 0.1333333, 1,
2.195696, -1.330701, 0.335415, 1, 0, 0.1254902, 1,
2.19653, -1.218537, 1.996869, 1, 0, 0.1215686, 1,
2.203926, 0.1653958, 0.6671402, 1, 0, 0.1137255, 1,
2.210213, 1.028464, 0.004193487, 1, 0, 0.1098039, 1,
2.243393, 0.5499831, 1.143093, 1, 0, 0.1019608, 1,
2.257067, -0.280221, 2.022528, 1, 0, 0.09411765, 1,
2.310884, 1.282156, 2.759095, 1, 0, 0.09019608, 1,
2.323597, -0.68878, 2.763135, 1, 0, 0.08235294, 1,
2.358106, -1.373832, 1.777192, 1, 0, 0.07843138, 1,
2.371475, 0.2041492, 0.4610827, 1, 0, 0.07058824, 1,
2.383412, -1.151944, -0.2282156, 1, 0, 0.06666667, 1,
2.430925, -0.1716536, 3.421511, 1, 0, 0.05882353, 1,
2.480255, 0.1956025, 0.6491761, 1, 0, 0.05490196, 1,
2.487416, -0.09151292, 2.954288, 1, 0, 0.04705882, 1,
2.60464, 0.1992532, 2.875334, 1, 0, 0.04313726, 1,
2.632262, 0.1073263, -1.367681, 1, 0, 0.03529412, 1,
2.689922, 0.2306205, 2.13172, 1, 0, 0.03137255, 1,
2.824603, -0.1389032, 1.911794, 1, 0, 0.02352941, 1,
2.844058, 0.1023207, 2.028386, 1, 0, 0.01960784, 1,
3.03244, 0.6771584, 0.3354431, 1, 0, 0.01176471, 1,
3.054149, 0.4791405, 0.3736309, 1, 0, 0.007843138, 1
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
-0.2181178, -3.736002, -7.739612, 0, -0.5, 0.5, 0.5,
-0.2181178, -3.736002, -7.739612, 1, -0.5, 0.5, 0.5,
-0.2181178, -3.736002, -7.739612, 1, 1.5, 0.5, 0.5,
-0.2181178, -3.736002, -7.739612, 0, 1.5, 0.5, 0.5
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
-4.599683, 0.06788671, -7.739612, 0, -0.5, 0.5, 0.5,
-4.599683, 0.06788671, -7.739612, 1, -0.5, 0.5, 0.5,
-4.599683, 0.06788671, -7.739612, 1, 1.5, 0.5, 0.5,
-4.599683, 0.06788671, -7.739612, 0, 1.5, 0.5, 0.5
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
-4.599683, -3.736002, -0.3514116, 0, -0.5, 0.5, 0.5,
-4.599683, -3.736002, -0.3514116, 1, -0.5, 0.5, 0.5,
-4.599683, -3.736002, -0.3514116, 1, 1.5, 0.5, 0.5,
-4.599683, -3.736002, -0.3514116, 0, 1.5, 0.5, 0.5
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
-3, -2.858181, -6.034643,
3, -2.858181, -6.034643,
-3, -2.858181, -6.034643,
-3, -3.004485, -6.318804,
-2, -2.858181, -6.034643,
-2, -3.004485, -6.318804,
-1, -2.858181, -6.034643,
-1, -3.004485, -6.318804,
0, -2.858181, -6.034643,
0, -3.004485, -6.318804,
1, -2.858181, -6.034643,
1, -3.004485, -6.318804,
2, -2.858181, -6.034643,
2, -3.004485, -6.318804,
3, -2.858181, -6.034643,
3, -3.004485, -6.318804
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
-3, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
-3, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
-3, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
-3, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
-2, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
-2, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
-2, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
-2, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
-1, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
-1, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
-1, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
-1, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
0, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
0, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
0, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
0, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
1, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
1, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
1, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
1, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
2, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
2, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
2, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
2, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5,
3, -3.297092, -6.887127, 0, -0.5, 0.5, 0.5,
3, -3.297092, -6.887127, 1, -0.5, 0.5, 0.5,
3, -3.297092, -6.887127, 1, 1.5, 0.5, 0.5,
3, -3.297092, -6.887127, 0, 1.5, 0.5, 0.5
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
-3.588552, -2, -6.034643,
-3.588552, 2, -6.034643,
-3.588552, -2, -6.034643,
-3.757074, -2, -6.318804,
-3.588552, -1, -6.034643,
-3.757074, -1, -6.318804,
-3.588552, 0, -6.034643,
-3.757074, 0, -6.318804,
-3.588552, 1, -6.034643,
-3.757074, 1, -6.318804,
-3.588552, 2, -6.034643,
-3.757074, 2, -6.318804
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
-4.094118, -2, -6.887127, 0, -0.5, 0.5, 0.5,
-4.094118, -2, -6.887127, 1, -0.5, 0.5, 0.5,
-4.094118, -2, -6.887127, 1, 1.5, 0.5, 0.5,
-4.094118, -2, -6.887127, 0, 1.5, 0.5, 0.5,
-4.094118, -1, -6.887127, 0, -0.5, 0.5, 0.5,
-4.094118, -1, -6.887127, 1, -0.5, 0.5, 0.5,
-4.094118, -1, -6.887127, 1, 1.5, 0.5, 0.5,
-4.094118, -1, -6.887127, 0, 1.5, 0.5, 0.5,
-4.094118, 0, -6.887127, 0, -0.5, 0.5, 0.5,
-4.094118, 0, -6.887127, 1, -0.5, 0.5, 0.5,
-4.094118, 0, -6.887127, 1, 1.5, 0.5, 0.5,
-4.094118, 0, -6.887127, 0, 1.5, 0.5, 0.5,
-4.094118, 1, -6.887127, 0, -0.5, 0.5, 0.5,
-4.094118, 1, -6.887127, 1, -0.5, 0.5, 0.5,
-4.094118, 1, -6.887127, 1, 1.5, 0.5, 0.5,
-4.094118, 1, -6.887127, 0, 1.5, 0.5, 0.5,
-4.094118, 2, -6.887127, 0, -0.5, 0.5, 0.5,
-4.094118, 2, -6.887127, 1, -0.5, 0.5, 0.5,
-4.094118, 2, -6.887127, 1, 1.5, 0.5, 0.5,
-4.094118, 2, -6.887127, 0, 1.5, 0.5, 0.5
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
-3.588552, -2.858181, -4,
-3.588552, -2.858181, 4,
-3.588552, -2.858181, -4,
-3.757074, -3.004485, -4,
-3.588552, -2.858181, -2,
-3.757074, -3.004485, -2,
-3.588552, -2.858181, 0,
-3.757074, -3.004485, 0,
-3.588552, -2.858181, 2,
-3.757074, -3.004485, 2,
-3.588552, -2.858181, 4,
-3.757074, -3.004485, 4
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
-4.094118, -3.297092, -4, 0, -0.5, 0.5, 0.5,
-4.094118, -3.297092, -4, 1, -0.5, 0.5, 0.5,
-4.094118, -3.297092, -4, 1, 1.5, 0.5, 0.5,
-4.094118, -3.297092, -4, 0, 1.5, 0.5, 0.5,
-4.094118, -3.297092, -2, 0, -0.5, 0.5, 0.5,
-4.094118, -3.297092, -2, 1, -0.5, 0.5, 0.5,
-4.094118, -3.297092, -2, 1, 1.5, 0.5, 0.5,
-4.094118, -3.297092, -2, 0, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 0, 0, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 0, 1, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 0, 1, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 0, 0, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 2, 0, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 2, 1, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 2, 1, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 2, 0, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 4, 0, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 4, 1, -0.5, 0.5, 0.5,
-4.094118, -3.297092, 4, 1, 1.5, 0.5, 0.5,
-4.094118, -3.297092, 4, 0, 1.5, 0.5, 0.5
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
-3.588552, -2.858181, -6.034643,
-3.588552, 2.993955, -6.034643,
-3.588552, -2.858181, 5.33182,
-3.588552, 2.993955, 5.33182,
-3.588552, -2.858181, -6.034643,
-3.588552, -2.858181, 5.33182,
-3.588552, 2.993955, -6.034643,
-3.588552, 2.993955, 5.33182,
-3.588552, -2.858181, -6.034643,
3.152317, -2.858181, -6.034643,
-3.588552, -2.858181, 5.33182,
3.152317, -2.858181, 5.33182,
-3.588552, 2.993955, -6.034643,
3.152317, 2.993955, -6.034643,
-3.588552, 2.993955, 5.33182,
3.152317, 2.993955, 5.33182,
3.152317, -2.858181, -6.034643,
3.152317, 2.993955, -6.034643,
3.152317, -2.858181, 5.33182,
3.152317, 2.993955, 5.33182,
3.152317, -2.858181, -6.034643,
3.152317, -2.858181, 5.33182,
3.152317, 2.993955, -6.034643,
3.152317, 2.993955, 5.33182
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
var radius = 7.717512;
var distance = 34.33608;
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
mvMatrix.translate( 0.2181178, -0.06788671, 0.3514116 );
mvMatrix.scale( 1.237871, 1.42586, 0.734118 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33608);
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
vinyl_phosphoric_aci<-read.table("vinyl_phosphoric_aci.xyz", skip=1)
```

```
## Error in read.table("vinyl_phosphoric_aci.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-vinyl_phosphoric_aci$V2
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
y<-vinyl_phosphoric_aci$V3
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
z<-vinyl_phosphoric_aci$V4
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
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
-3.490385, 0.7381361, -2.514812, 0, 0, 1, 1, 1,
-2.924961, -0.1185502, -0.489279, 1, 0, 0, 1, 1,
-2.472789, 0.2793895, -1.812002, 1, 0, 0, 1, 1,
-2.380508, -0.4703329, -1.514625, 1, 0, 0, 1, 1,
-2.219617, -0.5958583, -2.020466, 1, 0, 0, 1, 1,
-2.176466, -0.4212276, -0.7522377, 1, 0, 0, 1, 1,
-2.126567, 1.088298, -1.655817, 0, 0, 0, 1, 1,
-2.114576, -0.3372083, -0.1732222, 0, 0, 0, 1, 1,
-2.060664, 1.121828, 0.8990731, 0, 0, 0, 1, 1,
-2.055878, -1.214694, -1.271318, 0, 0, 0, 1, 1,
-2.053462, 1.802166, -1.795766, 0, 0, 0, 1, 1,
-2.046717, -2.060943, -2.029768, 0, 0, 0, 1, 1,
-1.998294, -1.551771, -1.866588, 0, 0, 0, 1, 1,
-1.975761, -0.3734251, -1.004246, 1, 1, 1, 1, 1,
-1.963201, -0.07748261, -1.888881, 1, 1, 1, 1, 1,
-1.931708, 0.1497148, -1.845781, 1, 1, 1, 1, 1,
-1.924587, 0.5682504, -2.631649, 1, 1, 1, 1, 1,
-1.902024, 0.5702348, -2.25767, 1, 1, 1, 1, 1,
-1.899673, -0.8054388, -1.539523, 1, 1, 1, 1, 1,
-1.895569, -0.9468333, -0.5970591, 1, 1, 1, 1, 1,
-1.888988, -0.4302767, -0.9550118, 1, 1, 1, 1, 1,
-1.847594, -1.997054, -2.38121, 1, 1, 1, 1, 1,
-1.844316, -0.600155, -2.338511, 1, 1, 1, 1, 1,
-1.790123, 0.7016197, -0.605682, 1, 1, 1, 1, 1,
-1.785245, 1.077695, 0.478795, 1, 1, 1, 1, 1,
-1.781541, -0.3594022, -2.513711, 1, 1, 1, 1, 1,
-1.770037, 0.01134218, -2.829921, 1, 1, 1, 1, 1,
-1.76905, 0.2440392, -0.8832151, 1, 1, 1, 1, 1,
-1.759941, -0.3452626, -0.1120251, 0, 0, 1, 1, 1,
-1.756094, -0.9841059, -2.654561, 1, 0, 0, 1, 1,
-1.754388, -0.8560301, -3.578436, 1, 0, 0, 1, 1,
-1.737931, 0.5266002, -0.003329983, 1, 0, 0, 1, 1,
-1.73763, 0.5037266, -0.8042868, 1, 0, 0, 1, 1,
-1.712605, -0.4936447, -0.8152905, 1, 0, 0, 1, 1,
-1.706501, 0.9637349, 0.2282512, 0, 0, 0, 1, 1,
-1.677664, 0.4509119, -1.357994, 0, 0, 0, 1, 1,
-1.654516, -1.161587, -2.438653, 0, 0, 0, 1, 1,
-1.647686, 1.092263, -0.9666122, 0, 0, 0, 1, 1,
-1.642568, -0.234755, -1.874149, 0, 0, 0, 1, 1,
-1.635244, 1.083741, -0.1361401, 0, 0, 0, 1, 1,
-1.628956, 0.004577597, -2.812839, 0, 0, 0, 1, 1,
-1.562871, 0.8985927, -2.104055, 1, 1, 1, 1, 1,
-1.547123, -0.006767891, -4.416112, 1, 1, 1, 1, 1,
-1.543529, -2.038389, -1.32885, 1, 1, 1, 1, 1,
-1.542639, -1.097583, -2.146736, 1, 1, 1, 1, 1,
-1.538585, 1.221628, -0.4210513, 1, 1, 1, 1, 1,
-1.534567, -0.2932337, -0.06845701, 1, 1, 1, 1, 1,
-1.527676, 0.3212377, -0.9892995, 1, 1, 1, 1, 1,
-1.521095, 0.4711806, -2.792558, 1, 1, 1, 1, 1,
-1.518878, -2.536208, -2.299248, 1, 1, 1, 1, 1,
-1.48506, -0.09586416, -1.000439, 1, 1, 1, 1, 1,
-1.481212, 0.996457, 0.02733282, 1, 1, 1, 1, 1,
-1.470222, 0.3014638, -1.195588, 1, 1, 1, 1, 1,
-1.466134, -0.5435829, -0.2125173, 1, 1, 1, 1, 1,
-1.433582, 0.1759498, -0.2014929, 1, 1, 1, 1, 1,
-1.417618, -0.6762584, -2.870734, 1, 1, 1, 1, 1,
-1.402265, -0.5507699, 0.5610664, 0, 0, 1, 1, 1,
-1.400555, -0.3393596, 0.6597369, 1, 0, 0, 1, 1,
-1.392585, -0.1095341, -2.773767, 1, 0, 0, 1, 1,
-1.390413, 1.596529, 0.09753668, 1, 0, 0, 1, 1,
-1.390327, 0.223613, -0.5528756, 1, 0, 0, 1, 1,
-1.381821, 0.7474541, -1.592297, 1, 0, 0, 1, 1,
-1.380261, -0.8223499, -3.329313, 0, 0, 0, 1, 1,
-1.370341, 0.5769738, -1.497788, 0, 0, 0, 1, 1,
-1.369597, 0.531934, 0.549589, 0, 0, 0, 1, 1,
-1.36224, -0.6088873, -1.683538, 0, 0, 0, 1, 1,
-1.36145, -0.7722011, -2.332424, 0, 0, 0, 1, 1,
-1.361127, 2.438673, 0.1592744, 0, 0, 0, 1, 1,
-1.359891, -0.3679866, -2.390946, 0, 0, 0, 1, 1,
-1.359602, 0.4621581, -0.8501853, 1, 1, 1, 1, 1,
-1.356429, -1.403283, -1.934898, 1, 1, 1, 1, 1,
-1.345719, 1.02086, -1.92517, 1, 1, 1, 1, 1,
-1.342417, -1.791291, -1.021648, 1, 1, 1, 1, 1,
-1.342077, -1.155918, -0.6085178, 1, 1, 1, 1, 1,
-1.34192, 0.9724864, -1.616584, 1, 1, 1, 1, 1,
-1.324111, 0.378749, -0.7346199, 1, 1, 1, 1, 1,
-1.312356, 0.1735867, -1.532061, 1, 1, 1, 1, 1,
-1.301165, 0.491511, -1.341439, 1, 1, 1, 1, 1,
-1.287608, 2.265658, -1.04902, 1, 1, 1, 1, 1,
-1.285496, -0.2468478, -1.319454, 1, 1, 1, 1, 1,
-1.283908, 0.511251, -1.827082, 1, 1, 1, 1, 1,
-1.281506, 1.592034, -1.193971, 1, 1, 1, 1, 1,
-1.275259, 0.0386626, -0.1440764, 1, 1, 1, 1, 1,
-1.265736, 0.9043901, -1.626805, 1, 1, 1, 1, 1,
-1.260168, 1.120168, 0.8281364, 0, 0, 1, 1, 1,
-1.259378, 2.157611, -0.9695761, 1, 0, 0, 1, 1,
-1.251811, 0.1936143, -2.58996, 1, 0, 0, 1, 1,
-1.244637, 1.827986, -2.241252, 1, 0, 0, 1, 1,
-1.235242, -0.1585825, -2.480757, 1, 0, 0, 1, 1,
-1.225401, -0.6690863, -4.053587, 1, 0, 0, 1, 1,
-1.222184, 0.7465033, -1.378311, 0, 0, 0, 1, 1,
-1.218266, 0.1817381, -1.849854, 0, 0, 0, 1, 1,
-1.215022, 1.805176, 0.1083541, 0, 0, 0, 1, 1,
-1.205358, -0.4452349, -2.274844, 0, 0, 0, 1, 1,
-1.203901, -0.5744488, -2.333796, 0, 0, 0, 1, 1,
-1.198463, -0.4149303, -1.97095, 0, 0, 0, 1, 1,
-1.193828, 0.7581287, -1.98481, 0, 0, 0, 1, 1,
-1.191313, -0.9414137, -3.132741, 1, 1, 1, 1, 1,
-1.191288, -1.860108, -1.643548, 1, 1, 1, 1, 1,
-1.189093, -1.323356, -1.982427, 1, 1, 1, 1, 1,
-1.187134, 2.802449, 0.6351057, 1, 1, 1, 1, 1,
-1.177459, 0.3449358, -2.693209, 1, 1, 1, 1, 1,
-1.175488, -0.1871907, -2.615666, 1, 1, 1, 1, 1,
-1.171709, -0.6304566, -0.8309789, 1, 1, 1, 1, 1,
-1.169297, -0.955067, -2.127084, 1, 1, 1, 1, 1,
-1.168788, 0.04637472, -2.108575, 1, 1, 1, 1, 1,
-1.165467, -1.044203, -1.921789, 1, 1, 1, 1, 1,
-1.164878, -1.055188, -1.70326, 1, 1, 1, 1, 1,
-1.156036, -0.3429462, -0.6999249, 1, 1, 1, 1, 1,
-1.152386, -1.044832, -1.665997, 1, 1, 1, 1, 1,
-1.148829, 0.8948187, -0.9360176, 1, 1, 1, 1, 1,
-1.142983, 1.52782, -0.3703704, 1, 1, 1, 1, 1,
-1.138953, 1.774529, -0.1581641, 0, 0, 1, 1, 1,
-1.133851, -0.6705167, -3.180796, 1, 0, 0, 1, 1,
-1.133685, 0.7304744, -2.053529, 1, 0, 0, 1, 1,
-1.13353, -1.569192, -2.23001, 1, 0, 0, 1, 1,
-1.132733, -0.1720266, 0.01801864, 1, 0, 0, 1, 1,
-1.130388, 0.426431, -1.00182, 1, 0, 0, 1, 1,
-1.12938, -0.01069508, -1.51941, 0, 0, 0, 1, 1,
-1.122788, -0.07544345, -0.07924262, 0, 0, 0, 1, 1,
-1.118305, 1.947668, 0.438768, 0, 0, 0, 1, 1,
-1.11633, 2.390085, -0.7970494, 0, 0, 0, 1, 1,
-1.115659, 0.3203711, -1.602082, 0, 0, 0, 1, 1,
-1.113504, 0.1419215, -1.448441, 0, 0, 0, 1, 1,
-1.113483, 0.001838382, -0.8852842, 0, 0, 0, 1, 1,
-1.110552, -1.358029, -1.933973, 1, 1, 1, 1, 1,
-1.090378, -0.545735, -1.496037, 1, 1, 1, 1, 1,
-1.088541, 0.3735517, -0.7910615, 1, 1, 1, 1, 1,
-1.084852, -0.2720277, -2.602585, 1, 1, 1, 1, 1,
-1.077164, -0.8129928, -3.846741, 1, 1, 1, 1, 1,
-1.074915, -0.6186281, -3.679732, 1, 1, 1, 1, 1,
-1.072118, -0.2874456, -3.475499, 1, 1, 1, 1, 1,
-1.068204, 2.596258, -0.5946497, 1, 1, 1, 1, 1,
-1.062201, 0.402916, -0.2301457, 1, 1, 1, 1, 1,
-1.043597, 1.023606, 0.5396873, 1, 1, 1, 1, 1,
-1.040531, -0.3578754, -4.664983, 1, 1, 1, 1, 1,
-1.038484, -0.8650395, -2.321386, 1, 1, 1, 1, 1,
-1.022381, -0.6241646, -0.2971736, 1, 1, 1, 1, 1,
-1.011966, -1.173474, -0.4437841, 1, 1, 1, 1, 1,
-1.007767, -0.4525255, -2.384009, 1, 1, 1, 1, 1,
-1.000335, -0.7847245, -2.3147, 0, 0, 1, 1, 1,
-0.9961107, 0.1288328, -1.018596, 1, 0, 0, 1, 1,
-0.9959087, -0.7290828, -3.047565, 1, 0, 0, 1, 1,
-0.9949476, -0.100863, -0.7111449, 1, 0, 0, 1, 1,
-0.9921606, 0.8297275, -0.5341249, 1, 0, 0, 1, 1,
-0.9914387, -1.358005, -3.136926, 1, 0, 0, 1, 1,
-0.9884583, -0.6805481, -4.602585, 0, 0, 0, 1, 1,
-0.9882909, -0.04313175, -2.043579, 0, 0, 0, 1, 1,
-0.9868764, -0.5505209, -3.291779, 0, 0, 0, 1, 1,
-0.9677641, -0.2437609, -3.206397, 0, 0, 0, 1, 1,
-0.9671674, -2.134681, -4.323376, 0, 0, 0, 1, 1,
-0.9654905, 0.3050934, -0.695798, 0, 0, 0, 1, 1,
-0.9521401, 1.054418, 1.3845, 0, 0, 0, 1, 1,
-0.9510294, 0.6935487, -2.253825, 1, 1, 1, 1, 1,
-0.9489601, 0.4890922, -2.561108, 1, 1, 1, 1, 1,
-0.948494, 0.1873577, -1.723562, 1, 1, 1, 1, 1,
-0.9480912, 2.153647, -0.5944709, 1, 1, 1, 1, 1,
-0.945867, -0.2236408, -2.605429, 1, 1, 1, 1, 1,
-0.9444767, 0.4582404, -1.238405, 1, 1, 1, 1, 1,
-0.9426187, 0.4033313, -0.9481491, 1, 1, 1, 1, 1,
-0.9420554, 0.6373028, -0.8940856, 1, 1, 1, 1, 1,
-0.935904, 1.943279, -2.073782, 1, 1, 1, 1, 1,
-0.9347292, -0.7613829, -1.611761, 1, 1, 1, 1, 1,
-0.9281649, 0.1085951, -1.566615, 1, 1, 1, 1, 1,
-0.9239989, -2.635442, -3.996083, 1, 1, 1, 1, 1,
-0.9238353, -0.29364, -1.660871, 1, 1, 1, 1, 1,
-0.9236696, -1.044369, -2.92966, 1, 1, 1, 1, 1,
-0.922758, 0.3491527, -0.3815454, 1, 1, 1, 1, 1,
-0.9195287, -0.1596664, -1.612568, 0, 0, 1, 1, 1,
-0.9126, 0.1814696, -2.388721, 1, 0, 0, 1, 1,
-0.9059086, -0.8315547, -2.104502, 1, 0, 0, 1, 1,
-0.8957498, -0.5414569, -1.626258, 1, 0, 0, 1, 1,
-0.8956147, -0.4482651, 0.03137299, 1, 0, 0, 1, 1,
-0.8896506, 0.0002461042, -1.918205, 1, 0, 0, 1, 1,
-0.8817474, -1.025494, -3.128396, 0, 0, 0, 1, 1,
-0.8764741, 0.5223035, -0.9314293, 0, 0, 0, 1, 1,
-0.8740576, -0.9731236, -2.821994, 0, 0, 0, 1, 1,
-0.873731, 0.09190876, -1.251595, 0, 0, 0, 1, 1,
-0.8722044, 2.259913, -0.7601996, 0, 0, 0, 1, 1,
-0.8707602, -0.5001498, -1.655473, 0, 0, 0, 1, 1,
-0.8655986, -0.4572561, -2.594257, 0, 0, 0, 1, 1,
-0.8639855, -0.2058406, -1.731377, 1, 1, 1, 1, 1,
-0.84488, -2.697015, -4.185721, 1, 1, 1, 1, 1,
-0.8419544, -0.9942094, -4.153349, 1, 1, 1, 1, 1,
-0.8386345, -0.08380612, -1.182477, 1, 1, 1, 1, 1,
-0.83591, -0.9355437, -1.831421, 1, 1, 1, 1, 1,
-0.8352328, -1.267405, -2.607622, 1, 1, 1, 1, 1,
-0.8325823, 0.9611697, -0.2073731, 1, 1, 1, 1, 1,
-0.8228304, -1.548402, -1.607812, 1, 1, 1, 1, 1,
-0.8181936, -1.401201, -4.727779, 1, 1, 1, 1, 1,
-0.8147847, -0.4808967, -2.76633, 1, 1, 1, 1, 1,
-0.8113929, 0.393906, 0.556164, 1, 1, 1, 1, 1,
-0.8050869, -0.1290631, -2.388115, 1, 1, 1, 1, 1,
-0.7900648, 0.1280643, -2.290458, 1, 1, 1, 1, 1,
-0.7859275, 1.387045, 1.187049, 1, 1, 1, 1, 1,
-0.7816186, 0.3362547, -1.203315, 1, 1, 1, 1, 1,
-0.7807927, 0.78708, -0.1464328, 0, 0, 1, 1, 1,
-0.7805396, -0.3466455, -2.027778, 1, 0, 0, 1, 1,
-0.7803294, 2.510491, -0.7076805, 1, 0, 0, 1, 1,
-0.7740237, -0.14399, -2.760517, 1, 0, 0, 1, 1,
-0.7737197, 1.315276, -1.612552, 1, 0, 0, 1, 1,
-0.7665315, 0.2728738, -1.450605, 1, 0, 0, 1, 1,
-0.7646202, 0.310875, -1.630468, 0, 0, 0, 1, 1,
-0.7641313, -0.006930633, -2.47442, 0, 0, 0, 1, 1,
-0.7589713, -1.018879, -2.277997, 0, 0, 0, 1, 1,
-0.7537695, 0.8552905, -1.198393, 0, 0, 0, 1, 1,
-0.7358944, 0.4013595, -1.837699, 0, 0, 0, 1, 1,
-0.735193, -2.025814, -2.709758, 0, 0, 0, 1, 1,
-0.7297075, 1.557282, -0.4924909, 0, 0, 0, 1, 1,
-0.7277392, -1.334323, -1.846192, 1, 1, 1, 1, 1,
-0.7264301, -0.454853, -2.814548, 1, 1, 1, 1, 1,
-0.7257506, -0.2708789, -1.466566, 1, 1, 1, 1, 1,
-0.7219324, 0.9162624, -3.038256, 1, 1, 1, 1, 1,
-0.7215912, -1.277288, -1.842345, 1, 1, 1, 1, 1,
-0.7167941, 1.254616, -1.767587, 1, 1, 1, 1, 1,
-0.715628, -0.01527503, -1.229625, 1, 1, 1, 1, 1,
-0.6951279, -0.2739649, -0.7782558, 1, 1, 1, 1, 1,
-0.6937428, 0.09455256, -1.908794, 1, 1, 1, 1, 1,
-0.6919191, -2.547191, -2.760666, 1, 1, 1, 1, 1,
-0.6906659, 0.211734, -1.296441, 1, 1, 1, 1, 1,
-0.6884746, 0.1399211, -1.044015, 1, 1, 1, 1, 1,
-0.6883745, 0.5983097, -2.226297, 1, 1, 1, 1, 1,
-0.6877732, 1.481068, -2.295642, 1, 1, 1, 1, 1,
-0.6849717, 0.7415869, -1.292961, 1, 1, 1, 1, 1,
-0.6800086, -0.01045043, 0.3034748, 0, 0, 1, 1, 1,
-0.6784927, 0.3923458, -2.299595, 1, 0, 0, 1, 1,
-0.676138, -0.4634148, -1.907735, 1, 0, 0, 1, 1,
-0.6733512, 0.01882987, -0.1987019, 1, 0, 0, 1, 1,
-0.6724482, 0.06842645, -0.8616087, 1, 0, 0, 1, 1,
-0.6690288, -0.8838248, -1.071108, 1, 0, 0, 1, 1,
-0.6652455, -1.218844, -3.618943, 0, 0, 0, 1, 1,
-0.6612685, 0.6539316, -0.3125363, 0, 0, 0, 1, 1,
-0.6552891, -0.0352743, -3.347369, 0, 0, 0, 1, 1,
-0.6540742, 0.5887557, -1.796533, 0, 0, 0, 1, 1,
-0.6536127, -1.918172, -3.725837, 0, 0, 0, 1, 1,
-0.6415558, 1.020995, -1.983172, 0, 0, 0, 1, 1,
-0.6399741, -1.087803, -2.977165, 0, 0, 0, 1, 1,
-0.6376863, -0.2892321, -3.433427, 1, 1, 1, 1, 1,
-0.6373578, -1.109434, -1.644122, 1, 1, 1, 1, 1,
-0.6357658, 0.1534514, -2.50658, 1, 1, 1, 1, 1,
-0.6291837, 1.145147, -1.080029, 1, 1, 1, 1, 1,
-0.6246229, 0.6998053, 0.08305656, 1, 1, 1, 1, 1,
-0.6225154, -2.049139, -2.223544, 1, 1, 1, 1, 1,
-0.6200302, -0.2801351, -2.327369, 1, 1, 1, 1, 1,
-0.6135385, -0.8644347, -0.6549573, 1, 1, 1, 1, 1,
-0.6134611, 0.774303, -1.279861, 1, 1, 1, 1, 1,
-0.6128738, 0.7077924, -0.06163502, 1, 1, 1, 1, 1,
-0.6085064, -1.820014, -2.445117, 1, 1, 1, 1, 1,
-0.6044391, -0.8803743, -2.811617, 1, 1, 1, 1, 1,
-0.6024305, 0.05050773, -1.283128, 1, 1, 1, 1, 1,
-0.6023636, -0.2342591, -1.015113, 1, 1, 1, 1, 1,
-0.6003892, 0.9873783, -0.2334344, 1, 1, 1, 1, 1,
-0.5973981, -1.162056, -3.09926, 0, 0, 1, 1, 1,
-0.5920415, 0.4639035, -0.7806941, 1, 0, 0, 1, 1,
-0.5859931, -1.23913, -4.228981, 1, 0, 0, 1, 1,
-0.5856085, -0.2268299, -1.414216, 1, 0, 0, 1, 1,
-0.5830503, -0.2639023, 0.7820129, 1, 0, 0, 1, 1,
-0.5823048, -0.669876, -2.983796, 1, 0, 0, 1, 1,
-0.5780323, 0.3823111, -1.565051, 0, 0, 0, 1, 1,
-0.5765905, 1.334478, 0.8592355, 0, 0, 0, 1, 1,
-0.5744519, 1.00481, -1.169738, 0, 0, 0, 1, 1,
-0.5742099, 1.441509, 0.650282, 0, 0, 0, 1, 1,
-0.5692219, -0.130748, -1.390001, 0, 0, 0, 1, 1,
-0.5674841, 0.9830366, -1.095845, 0, 0, 0, 1, 1,
-0.5459679, -1.68567, -4.807021, 0, 0, 0, 1, 1,
-0.5453511, -0.3401828, -2.193098, 1, 1, 1, 1, 1,
-0.5445154, -0.4130184, -1.229608, 1, 1, 1, 1, 1,
-0.5429432, -0.983, -3.173301, 1, 1, 1, 1, 1,
-0.5385309, -0.8555897, -3.527647, 1, 1, 1, 1, 1,
-0.5365957, -0.344639, -0.8409303, 1, 1, 1, 1, 1,
-0.5347988, 2.540137, -1.323267, 1, 1, 1, 1, 1,
-0.5301387, -0.4481669, -1.353806, 1, 1, 1, 1, 1,
-0.5262823, -0.578992, -0.4401552, 1, 1, 1, 1, 1,
-0.5236516, -1.636004, -2.518251, 1, 1, 1, 1, 1,
-0.5136352, -0.900813, -4.319115, 1, 1, 1, 1, 1,
-0.5090963, 1.191017, -0.248494, 1, 1, 1, 1, 1,
-0.5051601, -0.4953653, -2.483506, 1, 1, 1, 1, 1,
-0.5048169, -0.8582313, -3.957157, 1, 1, 1, 1, 1,
-0.5040238, 0.1561957, -0.9677152, 1, 1, 1, 1, 1,
-0.5006027, -0.8407685, -1.665285, 1, 1, 1, 1, 1,
-0.50019, -0.2974261, -2.573797, 0, 0, 1, 1, 1,
-0.4998953, -1.650835, -1.446005, 1, 0, 0, 1, 1,
-0.4948394, 1.25518, -1.548717, 1, 0, 0, 1, 1,
-0.4902847, -0.9449383, -2.716573, 1, 0, 0, 1, 1,
-0.4883024, -0.1278683, -2.1278, 1, 0, 0, 1, 1,
-0.4799669, -0.0885167, -1.487127, 1, 0, 0, 1, 1,
-0.4782611, -0.9271957, -2.325061, 0, 0, 0, 1, 1,
-0.4768831, -0.5237868, -2.398983, 0, 0, 0, 1, 1,
-0.4730886, -0.446531, -3.51624, 0, 0, 0, 1, 1,
-0.4697766, 0.4232253, 0.9325207, 0, 0, 0, 1, 1,
-0.4671868, -0.07337102, -0.9503469, 0, 0, 0, 1, 1,
-0.4650682, 1.10766, 0.6191179, 0, 0, 0, 1, 1,
-0.4630912, -0.985206, -1.942654, 0, 0, 0, 1, 1,
-0.4565513, 1.907113, -2.35466, 1, 1, 1, 1, 1,
-0.4556722, -0.9014649, -2.073244, 1, 1, 1, 1, 1,
-0.4554144, -2.667176, -2.181238, 1, 1, 1, 1, 1,
-0.455105, 0.282832, -2.318, 1, 1, 1, 1, 1,
-0.4534828, -0.9066264, -3.362921, 1, 1, 1, 1, 1,
-0.4510255, -1.718455, -2.85245, 1, 1, 1, 1, 1,
-0.4492506, 0.07233788, -1.582137, 1, 1, 1, 1, 1,
-0.4473501, -1.636683, -2.025953, 1, 1, 1, 1, 1,
-0.4459138, -1.023521, -2.402339, 1, 1, 1, 1, 1,
-0.4411792, 1.250602, -1.68461, 1, 1, 1, 1, 1,
-0.4384736, 1.943578, 0.7488188, 1, 1, 1, 1, 1,
-0.4368485, -0.972343, -5.869112, 1, 1, 1, 1, 1,
-0.4356337, -0.3011753, -0.4547397, 1, 1, 1, 1, 1,
-0.4320998, -0.1570355, -2.81268, 1, 1, 1, 1, 1,
-0.4294394, -1.064755, -1.504948, 1, 1, 1, 1, 1,
-0.429254, 0.7201852, -0.3627707, 0, 0, 1, 1, 1,
-0.4275012, 0.3484219, -2.489681, 1, 0, 0, 1, 1,
-0.4259455, 1.255004, 0.2012915, 1, 0, 0, 1, 1,
-0.4253455, -0.2471922, -1.615101, 1, 0, 0, 1, 1,
-0.4251394, 1.441525, 0.6908143, 1, 0, 0, 1, 1,
-0.4239853, -0.1610628, -1.909395, 1, 0, 0, 1, 1,
-0.4224294, -0.1617226, -2.511997, 0, 0, 0, 1, 1,
-0.4198044, 0.5713751, 1.68231, 0, 0, 0, 1, 1,
-0.4171845, 2.662513, 0.5693325, 0, 0, 0, 1, 1,
-0.4165013, 0.8979716, 0.05810745, 0, 0, 0, 1, 1,
-0.4140418, -1.140928, -1.955017, 0, 0, 0, 1, 1,
-0.4111042, 1.432144, -0.2993558, 0, 0, 0, 1, 1,
-0.4092619, -1.629291, -2.130461, 0, 0, 0, 1, 1,
-0.4035741, -0.3523876, -1.374744, 1, 1, 1, 1, 1,
-0.40263, -0.06166595, -0.6490602, 1, 1, 1, 1, 1,
-0.3955159, 0.8714973, 1.40728, 1, 1, 1, 1, 1,
-0.3894722, -1.015047, -2.701011, 1, 1, 1, 1, 1,
-0.3867839, 0.02485531, -1.269427, 1, 1, 1, 1, 1,
-0.3843722, -1.533227, -4.661418, 1, 1, 1, 1, 1,
-0.3801103, -1.279987, -2.036901, 1, 1, 1, 1, 1,
-0.3742894, 0.3751223, -2.383475, 1, 1, 1, 1, 1,
-0.3725241, 0.4822987, -1.88913, 1, 1, 1, 1, 1,
-0.3722707, 0.1108453, -1.131377, 1, 1, 1, 1, 1,
-0.3668076, -1.13834, -4.394643, 1, 1, 1, 1, 1,
-0.3636398, 0.5350872, -0.1238438, 1, 1, 1, 1, 1,
-0.3601523, -1.493815, -2.063837, 1, 1, 1, 1, 1,
-0.358449, -0.2825025, -1.881784, 1, 1, 1, 1, 1,
-0.3514788, -0.3691929, -1.401003, 1, 1, 1, 1, 1,
-0.3504538, 0.07933757, -1.682681, 0, 0, 1, 1, 1,
-0.3492188, 0.9438935, -1.809452, 1, 0, 0, 1, 1,
-0.3480401, 0.9925376, 0.9047457, 1, 0, 0, 1, 1,
-0.3450509, 0.3772425, -1.704435, 1, 0, 0, 1, 1,
-0.3444378, -0.4994052, -2.237831, 1, 0, 0, 1, 1,
-0.3368843, 1.055597, 0.4005442, 1, 0, 0, 1, 1,
-0.3324158, 0.8723829, -0.02091067, 0, 0, 0, 1, 1,
-0.331339, 0.6192867, 1.036568, 0, 0, 0, 1, 1,
-0.3312416, 0.6833726, -1.680609, 0, 0, 0, 1, 1,
-0.3291765, -1.808141, -2.782928, 0, 0, 0, 1, 1,
-0.323532, 0.3257003, -2.108432, 0, 0, 0, 1, 1,
-0.3158635, 0.05412957, -2.375327, 0, 0, 0, 1, 1,
-0.3144575, 0.7042624, -3.461207, 0, 0, 0, 1, 1,
-0.3137539, 0.2343429, -1.121845, 1, 1, 1, 1, 1,
-0.3104778, -0.1032093, -0.7209097, 1, 1, 1, 1, 1,
-0.3093099, 0.5286385, -0.3154593, 1, 1, 1, 1, 1,
-0.3059467, -0.5973888, -2.49262, 1, 1, 1, 1, 1,
-0.3026928, 0.8432446, -0.09293973, 1, 1, 1, 1, 1,
-0.2922479, 0.4556862, 0.1292262, 1, 1, 1, 1, 1,
-0.2918057, 0.4331679, -1.176127, 1, 1, 1, 1, 1,
-0.2903214, -0.4108754, -0.2155088, 1, 1, 1, 1, 1,
-0.28361, 0.7077917, -1.956469, 1, 1, 1, 1, 1,
-0.282629, -0.1528598, -0.9359925, 1, 1, 1, 1, 1,
-0.2815845, 0.8287663, -1.011684, 1, 1, 1, 1, 1,
-0.2777838, -0.2741812, -3.214688, 1, 1, 1, 1, 1,
-0.2746765, 1.389943, 1.879465, 1, 1, 1, 1, 1,
-0.27317, -0.5812777, -2.118905, 1, 1, 1, 1, 1,
-0.2718917, -0.2502372, -3.799432, 1, 1, 1, 1, 1,
-0.2661768, -0.000809658, -1.582594, 0, 0, 1, 1, 1,
-0.265969, -0.129624, -1.087224, 1, 0, 0, 1, 1,
-0.2581154, -0.3984658, -4.566226, 1, 0, 0, 1, 1,
-0.2571509, -2.005318, -3.337067, 1, 0, 0, 1, 1,
-0.2514441, 0.3890629, 0.3222411, 1, 0, 0, 1, 1,
-0.2497453, -1.097745, -3.169338, 1, 0, 0, 1, 1,
-0.2445959, -0.2848094, -3.359575, 0, 0, 0, 1, 1,
-0.23689, -0.5751086, -1.230278, 0, 0, 0, 1, 1,
-0.2350826, 0.3721989, -0.1312505, 0, 0, 0, 1, 1,
-0.2348855, -0.591971, -3.983189, 0, 0, 0, 1, 1,
-0.2326736, -0.4315052, -0.1355514, 0, 0, 0, 1, 1,
-0.2315283, -0.2170608, -2.776167, 0, 0, 0, 1, 1,
-0.2299015, -0.7606957, -4.370455, 0, 0, 0, 1, 1,
-0.2275216, 1.326173, -0.7550838, 1, 1, 1, 1, 1,
-0.2253034, -0.7242109, 0.02552651, 1, 1, 1, 1, 1,
-0.2250177, -1.55318, -2.454953, 1, 1, 1, 1, 1,
-0.2241898, 0.6432537, -0.193488, 1, 1, 1, 1, 1,
-0.22088, -1.58494, -3.908187, 1, 1, 1, 1, 1,
-0.2151968, 0.4653873, -1.620698, 1, 1, 1, 1, 1,
-0.2136505, -0.7745578, -3.345115, 1, 1, 1, 1, 1,
-0.2136283, 0.2586379, -1.004864, 1, 1, 1, 1, 1,
-0.2124432, -0.2728537, -3.324373, 1, 1, 1, 1, 1,
-0.2073031, 1.360182, 0.3886758, 1, 1, 1, 1, 1,
-0.2061261, 0.4506044, 0.076672, 1, 1, 1, 1, 1,
-0.2044925, -1.084035, -5.425972, 1, 1, 1, 1, 1,
-0.2032677, 1.43235, 1.337411, 1, 1, 1, 1, 1,
-0.2031669, -0.1926621, -1.729205, 1, 1, 1, 1, 1,
-0.1987373, -0.1542424, -1.903838, 1, 1, 1, 1, 1,
-0.1962822, 0.7582875, 1.889791, 0, 0, 1, 1, 1,
-0.1943492, 0.2041275, -1.868857, 1, 0, 0, 1, 1,
-0.1929724, -1.374733, -4.416264, 1, 0, 0, 1, 1,
-0.1921209, 0.608899, -0.5492445, 1, 0, 0, 1, 1,
-0.187832, 0.3991207, 0.7238992, 1, 0, 0, 1, 1,
-0.1873502, -0.4492577, -3.482192, 1, 0, 0, 1, 1,
-0.1872804, -0.8387188, -1.885024, 0, 0, 0, 1, 1,
-0.1757085, -0.530343, -4.453091, 0, 0, 0, 1, 1,
-0.175159, -0.4684553, -2.408223, 0, 0, 0, 1, 1,
-0.1724715, 0.2687454, -0.831281, 0, 0, 0, 1, 1,
-0.1722656, -0.3910502, -2.132725, 0, 0, 0, 1, 1,
-0.1716665, 0.3847687, -1.251541, 0, 0, 0, 1, 1,
-0.1714676, -1.232443, -1.133559, 0, 0, 0, 1, 1,
-0.1700708, -1.084341, -2.322631, 1, 1, 1, 1, 1,
-0.1694003, 0.9821552, -0.5358382, 1, 1, 1, 1, 1,
-0.1684311, -0.2563675, -3.056464, 1, 1, 1, 1, 1,
-0.1652598, 0.718979, -1.084615, 1, 1, 1, 1, 1,
-0.1636758, 0.7430618, 3.224843, 1, 1, 1, 1, 1,
-0.1622576, -0.127903, -4.003706, 1, 1, 1, 1, 1,
-0.1585315, 0.5932714, -0.132731, 1, 1, 1, 1, 1,
-0.15813, -0.9891078, -1.779953, 1, 1, 1, 1, 1,
-0.1534434, 0.3042312, 0.1325019, 1, 1, 1, 1, 1,
-0.1508557, 0.5109171, -1.765668, 1, 1, 1, 1, 1,
-0.1504445, 0.2935838, 0.8491144, 1, 1, 1, 1, 1,
-0.1502231, 0.1135342, -1.989942, 1, 1, 1, 1, 1,
-0.1488561, -0.3802682, -3.071888, 1, 1, 1, 1, 1,
-0.1486634, 0.8389455, 0.6586845, 1, 1, 1, 1, 1,
-0.1457169, -0.8325729, -4.043719, 1, 1, 1, 1, 1,
-0.1386269, -0.5290639, -2.842405, 0, 0, 1, 1, 1,
-0.1375729, 1.33267, -1.001374, 1, 0, 0, 1, 1,
-0.135135, 0.257336, 1.299824, 1, 0, 0, 1, 1,
-0.1313888, 1.505139, -1.802928, 1, 0, 0, 1, 1,
-0.1307819, -0.1687659, -1.828488, 1, 0, 0, 1, 1,
-0.1291427, -0.09649699, -2.200504, 1, 0, 0, 1, 1,
-0.1190292, -1.067768, -4.143404, 0, 0, 0, 1, 1,
-0.1178558, 0.4803115, -1.483108, 0, 0, 0, 1, 1,
-0.117785, -0.03276235, -0.5290851, 0, 0, 0, 1, 1,
-0.1132614, 0.1612636, -0.8381714, 0, 0, 0, 1, 1,
-0.1076454, -1.122595, -0.5544085, 0, 0, 0, 1, 1,
-0.1024252, -2.211095, -2.186677, 0, 0, 0, 1, 1,
-0.1000344, -1.398233, -3.862877, 0, 0, 0, 1, 1,
-0.09982471, -0.8651759, -3.248518, 1, 1, 1, 1, 1,
-0.0954761, -1.08695, -2.331137, 1, 1, 1, 1, 1,
-0.09484698, 1.865719, -1.126706, 1, 1, 1, 1, 1,
-0.0928314, -0.6654018, -0.410082, 1, 1, 1, 1, 1,
-0.09279143, 0.3279482, 0.9870253, 1, 1, 1, 1, 1,
-0.09102738, -0.06301778, -3.980437, 1, 1, 1, 1, 1,
-0.09092384, -0.4436904, -2.130537, 1, 1, 1, 1, 1,
-0.08924992, 1.246618, 0.1256814, 1, 1, 1, 1, 1,
-0.08396422, 1.273554, 2.423328, 1, 1, 1, 1, 1,
-0.07651468, 1.286319, 2.082705, 1, 1, 1, 1, 1,
-0.07182452, 0.6578849, 2.214746, 1, 1, 1, 1, 1,
-0.06904069, 1.794496, 2.00747, 1, 1, 1, 1, 1,
-0.06783672, -0.6171451, -2.068104, 1, 1, 1, 1, 1,
-0.06709589, -0.2377105, -3.415628, 1, 1, 1, 1, 1,
-0.06421418, -0.2885758, -3.097622, 1, 1, 1, 1, 1,
-0.06236608, 0.4499635, -0.526245, 0, 0, 1, 1, 1,
-0.05989661, 0.3886014, -0.7884198, 1, 0, 0, 1, 1,
-0.05847099, 0.3700193, -2.688835, 1, 0, 0, 1, 1,
-0.05532417, 0.2920295, -0.118652, 1, 0, 0, 1, 1,
-0.05462511, -0.4043917, -3.377866, 1, 0, 0, 1, 1,
-0.05091703, -0.4780547, 0.06266765, 1, 0, 0, 1, 1,
-0.04963972, 0.03878475, -0.545789, 0, 0, 0, 1, 1,
-0.04589676, 0.1805013, -0.2237572, 0, 0, 0, 1, 1,
-0.0429735, 0.1601192, -1.385932, 0, 0, 0, 1, 1,
-0.04191034, 0.1244479, 0.2096601, 0, 0, 0, 1, 1,
-0.0349033, -0.931878, -3.405518, 0, 0, 0, 1, 1,
-0.03245265, -0.9241787, -3.93314, 0, 0, 0, 1, 1,
-0.03108604, 0.09835785, -0.7722571, 0, 0, 0, 1, 1,
-0.03104558, -0.201381, -3.26192, 1, 1, 1, 1, 1,
-0.03057136, 1.00017, 2.006468, 1, 1, 1, 1, 1,
-0.02941801, -0.5031563, -2.178162, 1, 1, 1, 1, 1,
-0.02575531, 0.2861343, 0.7264129, 1, 1, 1, 1, 1,
-0.01942686, -0.4065646, -3.02385, 1, 1, 1, 1, 1,
-0.01709474, -2.103211, -4.502734, 1, 1, 1, 1, 1,
-0.01658024, -1.44143, -3.794503, 1, 1, 1, 1, 1,
-0.01591733, -1.57821, -2.407588, 1, 1, 1, 1, 1,
-0.0149477, 1.322532, 0.2406795, 1, 1, 1, 1, 1,
-0.01248543, 0.3890502, -0.7058055, 1, 1, 1, 1, 1,
-0.01206044, 0.5387566, 1.409331, 1, 1, 1, 1, 1,
-0.01103016, 2.90873, 0.3066213, 1, 1, 1, 1, 1,
-0.007792563, -0.1026833, -3.201996, 1, 1, 1, 1, 1,
-0.007145536, -0.3292093, -2.759953, 1, 1, 1, 1, 1,
-0.003729166, 1.842881, -0.2635265, 1, 1, 1, 1, 1,
-0.002198919, 0.8028846, -1.115586, 0, 0, 1, 1, 1,
0.0008759565, -0.9920901, 3.883924, 1, 0, 0, 1, 1,
0.002542723, 0.3948318, 1.528401, 1, 0, 0, 1, 1,
0.00348992, -0.6452826, 3.272497, 1, 0, 0, 1, 1,
0.0126774, 0.4882637, 0.6388581, 1, 0, 0, 1, 1,
0.01538173, -0.4786556, 1.417454, 1, 0, 0, 1, 1,
0.01611236, 0.3107803, -1.596205, 0, 0, 0, 1, 1,
0.01782144, 0.5241553, -0.7361127, 0, 0, 0, 1, 1,
0.02218254, 0.5447639, 1.056557, 0, 0, 0, 1, 1,
0.02909904, -0.9534024, 3.938616, 0, 0, 0, 1, 1,
0.03206414, 1.08217, 0.5003034, 0, 0, 0, 1, 1,
0.03333638, 0.001724086, 4.095305, 0, 0, 0, 1, 1,
0.03696641, -0.8345759, 4.351892, 0, 0, 0, 1, 1,
0.03766859, -0.2597194, 2.417217, 1, 1, 1, 1, 1,
0.0401313, -0.666966, 2.091727, 1, 1, 1, 1, 1,
0.04149246, 1.105236, 0.9934717, 1, 1, 1, 1, 1,
0.04283755, -1.287614, 4.625823, 1, 1, 1, 1, 1,
0.04358491, 0.6636435, -0.08156017, 1, 1, 1, 1, 1,
0.04608386, -0.05559844, 3.30384, 1, 1, 1, 1, 1,
0.04754015, 0.1846431, -0.1611138, 1, 1, 1, 1, 1,
0.04948252, 1.27411, -0.335871, 1, 1, 1, 1, 1,
0.05319596, -0.591057, 3.693245, 1, 1, 1, 1, 1,
0.05529342, -0.393027, 1.256143, 1, 1, 1, 1, 1,
0.05836115, 1.194718, 0.6853881, 1, 1, 1, 1, 1,
0.0616432, -0.06110254, 2.147594, 1, 1, 1, 1, 1,
0.06244934, -0.1190946, 3.308988, 1, 1, 1, 1, 1,
0.06327419, 0.8547962, 1.715418, 1, 1, 1, 1, 1,
0.06353152, 1.178139, 0.8400379, 1, 1, 1, 1, 1,
0.06436706, -0.5360249, 2.82781, 0, 0, 1, 1, 1,
0.06601533, -1.593642, 4.346659, 1, 0, 0, 1, 1,
0.07108123, -1.057612, 5.000212, 1, 0, 0, 1, 1,
0.07297537, 0.586873, -0.4845022, 1, 0, 0, 1, 1,
0.07629649, -0.1918212, 3.927693, 1, 0, 0, 1, 1,
0.07687677, 0.0912047, 0.6506455, 1, 0, 0, 1, 1,
0.08042707, 1.237426, -0.6217411, 0, 0, 0, 1, 1,
0.08530641, 0.9445437, 0.1549291, 0, 0, 0, 1, 1,
0.08620224, 0.03279003, 1.90369, 0, 0, 0, 1, 1,
0.08634123, 0.7909606, -1.091861, 0, 0, 0, 1, 1,
0.08780911, -1.076653, 5.166288, 0, 0, 0, 1, 1,
0.09375381, 1.538834, 0.5651959, 0, 0, 0, 1, 1,
0.09567385, 1.703183, 2.678677, 0, 0, 0, 1, 1,
0.101784, -0.2917761, 2.035372, 1, 1, 1, 1, 1,
0.101802, 1.830297, 0.4989482, 1, 1, 1, 1, 1,
0.1038089, 0.1815918, 1.132669, 1, 1, 1, 1, 1,
0.1042699, 0.2696651, 0.1873734, 1, 1, 1, 1, 1,
0.1054104, 1.674754, 1.177358, 1, 1, 1, 1, 1,
0.1077617, 0.01871244, 1.24987, 1, 1, 1, 1, 1,
0.1107086, -0.2666134, 3.154634, 1, 1, 1, 1, 1,
0.1127091, -0.6578193, 2.644442, 1, 1, 1, 1, 1,
0.1127514, -0.3839331, 2.965404, 1, 1, 1, 1, 1,
0.1128755, 0.2155031, 0.9921846, 1, 1, 1, 1, 1,
0.1173657, 0.05477731, 0.4341581, 1, 1, 1, 1, 1,
0.1216996, -0.4185156, 2.530403, 1, 1, 1, 1, 1,
0.1221786, -1.178633, 2.656181, 1, 1, 1, 1, 1,
0.124849, 0.6971787, -0.07078021, 1, 1, 1, 1, 1,
0.1248862, -2.149497, 2.455148, 1, 1, 1, 1, 1,
0.1254408, 0.5270537, -1.445405, 0, 0, 1, 1, 1,
0.1258829, 0.9924852, 0.2946207, 1, 0, 0, 1, 1,
0.1315565, 0.3092355, 2.263677, 1, 0, 0, 1, 1,
0.1320079, -1.961999, 2.467709, 1, 0, 0, 1, 1,
0.1322585, -0.3737949, 2.41841, 1, 0, 0, 1, 1,
0.1334349, 0.5581703, 0.06228187, 1, 0, 0, 1, 1,
0.1394098, 0.5563188, 0.355765, 0, 0, 0, 1, 1,
0.143448, -0.1094917, 1.520641, 0, 0, 0, 1, 1,
0.1454925, -0.1397711, 4.344548, 0, 0, 0, 1, 1,
0.1538123, 0.03809093, 1.325818, 0, 0, 0, 1, 1,
0.1574611, 0.2847186, 0.6318573, 0, 0, 0, 1, 1,
0.1653984, -1.958766, 2.454477, 0, 0, 0, 1, 1,
0.1671087, 0.8649842, 0.1510821, 0, 0, 0, 1, 1,
0.1677116, 0.1713149, 1.527921, 1, 1, 1, 1, 1,
0.1719541, 0.2326897, 0.0860984, 1, 1, 1, 1, 1,
0.1721176, -0.4810455, 3.530896, 1, 1, 1, 1, 1,
0.1808643, -0.09435926, 1.284367, 1, 1, 1, 1, 1,
0.1832744, 0.4162912, 0.4437324, 1, 1, 1, 1, 1,
0.1908881, -0.4316531, 2.888179, 1, 1, 1, 1, 1,
0.1947515, 0.6136199, 2.050144, 1, 1, 1, 1, 1,
0.1996019, 1.396631, -2.119241, 1, 1, 1, 1, 1,
0.2030301, 0.3783491, -0.2195098, 1, 1, 1, 1, 1,
0.2041254, -0.03862263, 3.185924, 1, 1, 1, 1, 1,
0.2064483, 1.407575, -0.6750241, 1, 1, 1, 1, 1,
0.2104369, -0.666378, 3.484325, 1, 1, 1, 1, 1,
0.2116322, -0.9255174, 2.904701, 1, 1, 1, 1, 1,
0.2144194, -0.5170318, 2.314453, 1, 1, 1, 1, 1,
0.2186119, 1.110447, 1.469442, 1, 1, 1, 1, 1,
0.2189302, -0.769814, 2.995563, 0, 0, 1, 1, 1,
0.219673, 1.107292, 1.703759, 1, 0, 0, 1, 1,
0.223619, -0.6039097, 1.97321, 1, 0, 0, 1, 1,
0.2247316, -0.4142638, 1.724052, 1, 0, 0, 1, 1,
0.2335777, -0.8674803, 3.92328, 1, 0, 0, 1, 1,
0.2369981, -0.2706565, 1.183788, 1, 0, 0, 1, 1,
0.2388528, 1.282092, -0.09166881, 0, 0, 0, 1, 1,
0.2424224, -0.4349344, 2.339903, 0, 0, 0, 1, 1,
0.2472338, -1.441141, 3.194397, 0, 0, 0, 1, 1,
0.2479295, 1.081449, -2.093325, 0, 0, 0, 1, 1,
0.2495256, -1.475024, 1.181879, 0, 0, 0, 1, 1,
0.2502099, -0.1291666, 1.952403, 0, 0, 0, 1, 1,
0.2542745, 1.081482, -0.02100539, 0, 0, 0, 1, 1,
0.2594275, -0.3892547, 2.994796, 1, 1, 1, 1, 1,
0.2734278, -0.4315985, 3.092339, 1, 1, 1, 1, 1,
0.2735193, 0.3771259, 0.586836, 1, 1, 1, 1, 1,
0.2743814, 0.8475884, -1.33966, 1, 1, 1, 1, 1,
0.2812559, 0.2491292, 1.661154, 1, 1, 1, 1, 1,
0.2832656, 0.2348788, -0.1606506, 1, 1, 1, 1, 1,
0.2857865, -1.135348, 2.07635, 1, 1, 1, 1, 1,
0.2875176, -0.3320057, 1.029317, 1, 1, 1, 1, 1,
0.2887113, -0.4792919, 1.976634, 1, 1, 1, 1, 1,
0.2923308, 1.546471, 2.179724, 1, 1, 1, 1, 1,
0.2937916, -0.6322619, 4.204901, 1, 1, 1, 1, 1,
0.2944887, -0.532211, 2.541551, 1, 1, 1, 1, 1,
0.2957932, 0.4894188, -0.2849441, 1, 1, 1, 1, 1,
0.296849, -0.3483043, 3.064613, 1, 1, 1, 1, 1,
0.3003475, 0.6516758, 0.4043591, 1, 1, 1, 1, 1,
0.3067302, -0.9777474, 3.126819, 0, 0, 1, 1, 1,
0.3097451, 1.030727, -0.2981584, 1, 0, 0, 1, 1,
0.3101146, 1.481454, -0.7418172, 1, 0, 0, 1, 1,
0.311059, 1.288229, 0.6100535, 1, 0, 0, 1, 1,
0.3145776, -0.5022439, 1.49081, 1, 0, 0, 1, 1,
0.3160258, -0.09308066, 2.716959, 1, 0, 0, 1, 1,
0.3171885, -0.8132859, 3.260159, 0, 0, 0, 1, 1,
0.3187699, -0.5044463, 3.29752, 0, 0, 0, 1, 1,
0.321601, 0.4229068, 0.5602503, 0, 0, 0, 1, 1,
0.3224021, 0.8067062, -1.326702, 0, 0, 0, 1, 1,
0.3237381, 0.8054877, -0.532755, 0, 0, 0, 1, 1,
0.3251463, 1.008477, 0.4200371, 0, 0, 0, 1, 1,
0.3257945, 0.7503241, 1.208773, 0, 0, 0, 1, 1,
0.3287261, -0.802429, 4.340704, 1, 1, 1, 1, 1,
0.3295884, 0.1753038, 0.4166064, 1, 1, 1, 1, 1,
0.3429546, 0.4287284, -1.456085, 1, 1, 1, 1, 1,
0.3487539, 0.4181203, 1.375778, 1, 1, 1, 1, 1,
0.3492446, -0.4132652, 2.613453, 1, 1, 1, 1, 1,
0.3536026, 0.4184194, 2.880035, 1, 1, 1, 1, 1,
0.3542036, 0.9655408, 0.5509344, 1, 1, 1, 1, 1,
0.3544261, 0.6645203, 0.9348218, 1, 1, 1, 1, 1,
0.3548926, -0.1375402, 0.8967305, 1, 1, 1, 1, 1,
0.355903, -0.4549528, 1.711288, 1, 1, 1, 1, 1,
0.3574112, -0.9498697, 1.699883, 1, 1, 1, 1, 1,
0.3596598, 0.9781272, -0.2216999, 1, 1, 1, 1, 1,
0.360252, 1.156821, 0.6175261, 1, 1, 1, 1, 1,
0.3653929, 0.9035342, -1.458604, 1, 1, 1, 1, 1,
0.365628, -0.9414986, 1.084596, 1, 1, 1, 1, 1,
0.3719384, -2.037563, 2.216351, 0, 0, 1, 1, 1,
0.3725592, 1.027296, -0.4478495, 1, 0, 0, 1, 1,
0.3730024, -0.2083649, 1.998204, 1, 0, 0, 1, 1,
0.373063, -2.554989, 3.346323, 1, 0, 0, 1, 1,
0.3738181, -1.190454, 4.202999, 1, 0, 0, 1, 1,
0.3740116, -0.3951494, 1.814156, 1, 0, 0, 1, 1,
0.3806837, -0.436964, 0.9518424, 0, 0, 0, 1, 1,
0.3843125, -1.106828, 4.701809, 0, 0, 0, 1, 1,
0.3843704, 2.438771, -0.7168415, 0, 0, 0, 1, 1,
0.3855787, -1.062269, 2.763246, 0, 0, 0, 1, 1,
0.3888609, 0.546988, 0.7937899, 0, 0, 0, 1, 1,
0.3933171, -0.3778242, 4.629211, 0, 0, 0, 1, 1,
0.3940459, -0.3614524, 2.480773, 0, 0, 0, 1, 1,
0.3952571, 0.0388284, 2.063931, 1, 1, 1, 1, 1,
0.3963288, 0.5373696, 1.179569, 1, 1, 1, 1, 1,
0.3980571, -2.401599, 1.343663, 1, 1, 1, 1, 1,
0.4012378, -0.8271404, 2.357993, 1, 1, 1, 1, 1,
0.4064296, -0.3715238, 2.2224, 1, 1, 1, 1, 1,
0.407252, 0.5824072, 0.888321, 1, 1, 1, 1, 1,
0.4073529, -0.1220109, 0.7057488, 1, 1, 1, 1, 1,
0.4170406, -0.8487744, 2.384953, 1, 1, 1, 1, 1,
0.4212021, 1.40438, 2.283583, 1, 1, 1, 1, 1,
0.4214418, 1.170578, -1.009874, 1, 1, 1, 1, 1,
0.4218485, 0.9343713, 0.06298206, 1, 1, 1, 1, 1,
0.4260136, 0.2677385, 1.293516, 1, 1, 1, 1, 1,
0.4280953, -0.5001392, 2.692032, 1, 1, 1, 1, 1,
0.4294145, 0.3435371, 1.723899, 1, 1, 1, 1, 1,
0.43272, -1.28986, 2.435067, 1, 1, 1, 1, 1,
0.4343864, 0.5464631, 0.2653348, 0, 0, 1, 1, 1,
0.4358505, -0.9924977, 1.117939, 1, 0, 0, 1, 1,
0.4360964, -0.2765879, 2.460075, 1, 0, 0, 1, 1,
0.4382502, -0.4250706, 3.368314, 1, 0, 0, 1, 1,
0.4388866, 0.5284591, 0.3679861, 1, 0, 0, 1, 1,
0.4432279, -1.042476, 2.303771, 1, 0, 0, 1, 1,
0.447592, -0.206354, 1.994089, 0, 0, 0, 1, 1,
0.4507588, -0.543462, 4.237065, 0, 0, 0, 1, 1,
0.455739, 0.4005766, 1.540764, 0, 0, 0, 1, 1,
0.4566736, -1.877714, 2.514967, 0, 0, 0, 1, 1,
0.4573242, -1.271357, 3.123306, 0, 0, 0, 1, 1,
0.4589167, -0.8074624, 3.246721, 0, 0, 0, 1, 1,
0.4606179, -0.2496922, 3.385238, 0, 0, 0, 1, 1,
0.4669167, -0.4108469, 2.975904, 1, 1, 1, 1, 1,
0.4684432, 1.026414, 0.1063236, 1, 1, 1, 1, 1,
0.4687432, -0.05359732, 2.113744, 1, 1, 1, 1, 1,
0.4691248, -0.1446761, -1.537315, 1, 1, 1, 1, 1,
0.4721354, 0.1590053, 2.179903, 1, 1, 1, 1, 1,
0.4721859, -1.770558, 3.708388, 1, 1, 1, 1, 1,
0.4752226, -1.175623, 1.736383, 1, 1, 1, 1, 1,
0.4796262, 0.1508503, -1.562241, 1, 1, 1, 1, 1,
0.4846267, -1.504766, 1.564452, 1, 1, 1, 1, 1,
0.4865862, -0.9980217, 0.3350054, 1, 1, 1, 1, 1,
0.4896251, -0.2923459, 2.115782, 1, 1, 1, 1, 1,
0.4910342, -1.478284, 1.09455, 1, 1, 1, 1, 1,
0.4928858, 0.2534614, 1.149796, 1, 1, 1, 1, 1,
0.4943055, -0.7300934, 1.235861, 1, 1, 1, 1, 1,
0.5017175, -0.4889556, 3.326532, 1, 1, 1, 1, 1,
0.5055771, 1.259432, 0.06917918, 0, 0, 1, 1, 1,
0.5070048, -1.696728, 2.485099, 1, 0, 0, 1, 1,
0.5085704, 0.5264627, -0.0795243, 1, 0, 0, 1, 1,
0.5090181, 0.01153625, 1.233137, 1, 0, 0, 1, 1,
0.5126712, -1.348008, 1.081863, 1, 0, 0, 1, 1,
0.5129834, -1.815728, 3.336784, 1, 0, 0, 1, 1,
0.5153278, 1.440032, 0.9203846, 0, 0, 0, 1, 1,
0.516834, -0.6745155, 2.696737, 0, 0, 0, 1, 1,
0.5170931, -1.318554, 0.5914899, 0, 0, 0, 1, 1,
0.5198199, -0.6604346, 1.955754, 0, 0, 0, 1, 1,
0.5219028, -0.762292, 1.205431, 0, 0, 0, 1, 1,
0.5266097, -0.6780493, 3.919032, 0, 0, 0, 1, 1,
0.5270607, 0.04263499, 1.659438, 0, 0, 0, 1, 1,
0.5284067, 0.3301577, 3.530419, 1, 1, 1, 1, 1,
0.5293375, 0.1979278, 0.349311, 1, 1, 1, 1, 1,
0.5394496, 1.516805, -0.2586767, 1, 1, 1, 1, 1,
0.5453289, 0.5267909, 0.6104325, 1, 1, 1, 1, 1,
0.5486501, 0.7598662, 0.8002759, 1, 1, 1, 1, 1,
0.5516254, -0.9970212, 3.867342, 1, 1, 1, 1, 1,
0.5516918, 0.4208183, 0.7847252, 1, 1, 1, 1, 1,
0.5524495, 0.2123082, -0.4570218, 1, 1, 1, 1, 1,
0.5590811, -0.7204782, 2.340168, 1, 1, 1, 1, 1,
0.5591227, -1.883013, 1.395537, 1, 1, 1, 1, 1,
0.5596988, -1.418623, 1.976121, 1, 1, 1, 1, 1,
0.56387, -0.3183742, 2.584279, 1, 1, 1, 1, 1,
0.5655605, -1.420689, 3.172788, 1, 1, 1, 1, 1,
0.5686707, 0.01742794, 3.948793, 1, 1, 1, 1, 1,
0.5732312, 0.7713078, 1.473777, 1, 1, 1, 1, 1,
0.5745996, 0.1707028, 1.37184, 0, 0, 1, 1, 1,
0.5784477, -0.03491905, 0.8825356, 1, 0, 0, 1, 1,
0.5834261, 1.57321, -0.5294498, 1, 0, 0, 1, 1,
0.5933436, 1.43474, 0.6988596, 1, 0, 0, 1, 1,
0.5978348, -0.7433348, 1.870083, 1, 0, 0, 1, 1,
0.5980309, 0.5874258, 1.192227, 1, 0, 0, 1, 1,
0.5999225, -0.8744983, 2.082026, 0, 0, 0, 1, 1,
0.6058189, 0.3267069, 1.131554, 0, 0, 0, 1, 1,
0.6072451, 1.978872, -1.139189, 0, 0, 0, 1, 1,
0.608073, 0.375174, 0.5566508, 0, 0, 0, 1, 1,
0.610441, -1.442047, 3.156087, 0, 0, 0, 1, 1,
0.6177647, 0.2894929, -0.3750201, 0, 0, 0, 1, 1,
0.6206113, 0.09150289, -0.331028, 0, 0, 0, 1, 1,
0.624303, -0.778326, 3.637667, 1, 1, 1, 1, 1,
0.6257967, 0.2096505, 0.9673769, 1, 1, 1, 1, 1,
0.6258258, -0.5495894, 0.7034205, 1, 1, 1, 1, 1,
0.6266733, 1.274009, -2.112413, 1, 1, 1, 1, 1,
0.6357311, -1.558043, 2.282562, 1, 1, 1, 1, 1,
0.6360267, -1.176145, 3.069098, 1, 1, 1, 1, 1,
0.6396624, 0.3385718, 0.7882627, 1, 1, 1, 1, 1,
0.640581, -0.8186288, 1.754747, 1, 1, 1, 1, 1,
0.6469865, -0.6153703, 2.153744, 1, 1, 1, 1, 1,
0.6480061, 1.289432, 1.290274, 1, 1, 1, 1, 1,
0.6483768, -0.6726564, 1.894712, 1, 1, 1, 1, 1,
0.6507307, 1.323625, 1.586936, 1, 1, 1, 1, 1,
0.6528643, -1.118443, 3.733459, 1, 1, 1, 1, 1,
0.6534841, 0.8598719, 0.7123764, 1, 1, 1, 1, 1,
0.6539559, 1.004132, 0.9397459, 1, 1, 1, 1, 1,
0.6576082, 0.05090865, 0.9331365, 0, 0, 1, 1, 1,
0.6578078, 0.2115066, 1.489962, 1, 0, 0, 1, 1,
0.6586168, 0.2139687, 0.6839837, 1, 0, 0, 1, 1,
0.6636399, 1.94593, -0.3121405, 1, 0, 0, 1, 1,
0.6691676, 0.7419837, 2.109938, 1, 0, 0, 1, 1,
0.6703379, 1.044666, 0.6958127, 1, 0, 0, 1, 1,
0.6752179, -0.2875116, 3.095458, 0, 0, 0, 1, 1,
0.676356, 0.2074074, 0.7298082, 0, 0, 0, 1, 1,
0.6795429, -0.2017207, 1.735631, 0, 0, 0, 1, 1,
0.6818118, 0.3010767, 1.724408, 0, 0, 0, 1, 1,
0.6853902, -0.2090858, 0.6603475, 0, 0, 0, 1, 1,
0.6880367, -0.9259531, 3.734067, 0, 0, 0, 1, 1,
0.6882691, -1.296448, 0.5879703, 0, 0, 0, 1, 1,
0.6907568, -0.7714198, 1.630563, 1, 1, 1, 1, 1,
0.6908962, 0.4385725, 0.2267118, 1, 1, 1, 1, 1,
0.6935384, 0.2370785, 1.073557, 1, 1, 1, 1, 1,
0.6939376, -0.9241623, 1.876073, 1, 1, 1, 1, 1,
0.6947514, -0.3274153, 2.276397, 1, 1, 1, 1, 1,
0.6957529, 0.9351153, -0.3249383, 1, 1, 1, 1, 1,
0.7004963, 1.554917, 0.2114712, 1, 1, 1, 1, 1,
0.7031066, 0.3990319, 2.686602, 1, 1, 1, 1, 1,
0.7041076, 0.4825847, 2.179631, 1, 1, 1, 1, 1,
0.7055812, -1.429672, 2.592788, 1, 1, 1, 1, 1,
0.7247025, 0.5651926, -0.3218296, 1, 1, 1, 1, 1,
0.7289261, -0.8826132, 1.294863, 1, 1, 1, 1, 1,
0.7360984, -1.847126, 3.172298, 1, 1, 1, 1, 1,
0.7370244, 1.33449, 1.594426, 1, 1, 1, 1, 1,
0.737583, 0.6480831, 2.32765, 1, 1, 1, 1, 1,
0.738086, 0.1789545, 1.617053, 0, 0, 1, 1, 1,
0.7422392, 1.140965, 1.259982, 1, 0, 0, 1, 1,
0.7465489, -1.083032, 1.977432, 1, 0, 0, 1, 1,
0.7468216, -0.1317328, 2.011331, 1, 0, 0, 1, 1,
0.747995, -0.9375092, 4.293556, 1, 0, 0, 1, 1,
0.749466, -1.910778, 1.262471, 1, 0, 0, 1, 1,
0.7495175, 1.955065, -0.4986483, 0, 0, 0, 1, 1,
0.7503095, 0.705277, 1.560564, 0, 0, 0, 1, 1,
0.750856, -0.3395391, 1.692086, 0, 0, 0, 1, 1,
0.755167, 1.809451, 0.3797806, 0, 0, 0, 1, 1,
0.7568887, -0.5098221, 2.0581, 0, 0, 0, 1, 1,
0.7571985, -1.225401, 2.985119, 0, 0, 0, 1, 1,
0.7574899, -0.4055834, 4.319602, 0, 0, 0, 1, 1,
0.7579436, -0.7467949, 2.019058, 1, 1, 1, 1, 1,
0.7638122, -0.3173873, 2.279427, 1, 1, 1, 1, 1,
0.7660242, 0.501412, 0.1630233, 1, 1, 1, 1, 1,
0.7717958, -0.3362825, 1.960076, 1, 1, 1, 1, 1,
0.7766933, 0.3147244, 1.672479, 1, 1, 1, 1, 1,
0.782598, 1.186216, 1.767212, 1, 1, 1, 1, 1,
0.7831037, 1.268061, 1.992664, 1, 1, 1, 1, 1,
0.7871989, -1.465484, 3.764888, 1, 1, 1, 1, 1,
0.7885736, 0.5705334, 0.9375761, 1, 1, 1, 1, 1,
0.7911872, 1.994362, -0.5646803, 1, 1, 1, 1, 1,
0.7973288, 0.2515753, 4.25953, 1, 1, 1, 1, 1,
0.7990013, 0.3749799, 1.917493, 1, 1, 1, 1, 1,
0.7997845, 0.8477403, 1.331729, 1, 1, 1, 1, 1,
0.8052397, 0.8447424, -0.7533634, 1, 1, 1, 1, 1,
0.8075261, -0.2246298, -0.5611823, 1, 1, 1, 1, 1,
0.8115469, -0.8059042, 1.953179, 0, 0, 1, 1, 1,
0.8178495, -0.3249376, 1.752271, 1, 0, 0, 1, 1,
0.8195534, 0.3748905, 1.692895, 1, 0, 0, 1, 1,
0.8243217, 0.6396086, 3.88191, 1, 0, 0, 1, 1,
0.8260807, -0.9136968, 0.4066996, 1, 0, 0, 1, 1,
0.8347167, 0.2602109, 1.328481, 1, 0, 0, 1, 1,
0.839002, -0.6213098, 1.533998, 0, 0, 0, 1, 1,
0.840637, -2.152913, 2.399418, 0, 0, 0, 1, 1,
0.8412889, -0.109536, -0.9676479, 0, 0, 0, 1, 1,
0.8417658, 0.800005, 3.684242, 0, 0, 0, 1, 1,
0.8430318, -0.4709826, 1.129208, 0, 0, 0, 1, 1,
0.8497992, -0.6061451, 2.821444, 0, 0, 0, 1, 1,
0.8579045, 0.1789528, 1.150972, 0, 0, 0, 1, 1,
0.8585351, 0.591767, 2.561782, 1, 1, 1, 1, 1,
0.8631617, 0.1590797, 3.403679, 1, 1, 1, 1, 1,
0.864372, -0.5048446, 2.939682, 1, 1, 1, 1, 1,
0.8644102, 1.692592, 0.8961961, 1, 1, 1, 1, 1,
0.864457, -0.3830978, 2.099437, 1, 1, 1, 1, 1,
0.8659006, -1.175623, 0.4607916, 1, 1, 1, 1, 1,
0.8694274, 1.303761, 0.6931302, 1, 1, 1, 1, 1,
0.8801227, -0.8407297, 4.104492, 1, 1, 1, 1, 1,
0.8834352, 0.5491064, 1.796263, 1, 1, 1, 1, 1,
0.8859026, 0.4954548, 1.458534, 1, 1, 1, 1, 1,
0.8862401, -1.351894, 1.51495, 1, 1, 1, 1, 1,
0.8902804, -1.204945, 1.752439, 1, 1, 1, 1, 1,
0.8991851, 0.9589303, -0.1426992, 1, 1, 1, 1, 1,
0.9028169, -1.188991, 1.083485, 1, 1, 1, 1, 1,
0.9069366, 0.01492782, 2.07464, 1, 1, 1, 1, 1,
0.911328, 1.494523, -1.627991, 0, 0, 1, 1, 1,
0.9169108, 2.356532, -0.585753, 1, 0, 0, 1, 1,
0.9182946, -1.60557, 2.42406, 1, 0, 0, 1, 1,
0.9209661, 0.5814608, 0.6766679, 1, 0, 0, 1, 1,
0.9247862, 1.637163, 0.01854545, 1, 0, 0, 1, 1,
0.9255424, -0.03216531, 0.8162441, 1, 0, 0, 1, 1,
0.9256157, 0.2201424, 1.730646, 0, 0, 0, 1, 1,
0.9268718, 0.130335, 3.796509, 0, 0, 0, 1, 1,
0.9297675, 0.569593, 0.008750129, 0, 0, 0, 1, 1,
0.9310436, -0.9312871, 2.058294, 0, 0, 0, 1, 1,
0.9381321, -0.485008, 0.5452781, 0, 0, 0, 1, 1,
0.947723, -0.7196699, 1.59479, 0, 0, 0, 1, 1,
0.9480187, -0.7626624, 3.209786, 0, 0, 0, 1, 1,
0.9559958, -0.008018528, 0.3715293, 1, 1, 1, 1, 1,
0.9675496, 0.3102232, 1.294157, 1, 1, 1, 1, 1,
0.9678801, -0.434548, 0.8665023, 1, 1, 1, 1, 1,
0.9712303, -1.103572, 3.042615, 1, 1, 1, 1, 1,
0.9719303, 0.8978295, 1.527633, 1, 1, 1, 1, 1,
0.9729545, 0.184722, 1.017135, 1, 1, 1, 1, 1,
0.9781719, -1.164603, 2.0456, 1, 1, 1, 1, 1,
0.978209, -0.1854117, 3.002022, 1, 1, 1, 1, 1,
0.9851425, 0.5314199, 0.06348995, 1, 1, 1, 1, 1,
0.9926947, 0.3077485, 1.316925, 1, 1, 1, 1, 1,
0.997136, -0.03026174, 1.050022, 1, 1, 1, 1, 1,
0.9997618, -1.825925, 3.745097, 1, 1, 1, 1, 1,
1.003259, 0.6601724, 0.701867, 1, 1, 1, 1, 1,
1.008968, -0.2347767, 2.804646, 1, 1, 1, 1, 1,
1.016874, 0.2004256, 0.3116807, 1, 1, 1, 1, 1,
1.01757, -0.4866525, 4.802854, 0, 0, 1, 1, 1,
1.017611, -1.283481, 4.047043, 1, 0, 0, 1, 1,
1.019331, -2.117555, 3.69228, 1, 0, 0, 1, 1,
1.027468, -1.560717, 0.1640948, 1, 0, 0, 1, 1,
1.028828, 0.2009477, 2.211112, 1, 0, 0, 1, 1,
1.032497, 0.03636238, 2.86991, 1, 0, 0, 1, 1,
1.035772, 0.7036015, -0.1570147, 0, 0, 0, 1, 1,
1.035972, 0.5847365, 0.7727849, 0, 0, 0, 1, 1,
1.036026, 2.061968, 0.2506407, 0, 0, 0, 1, 1,
1.040535, -0.694764, 2.147966, 0, 0, 0, 1, 1,
1.040898, -0.2816814, 0.7220637, 0, 0, 0, 1, 1,
1.047466, 0.6082146, 1.392172, 0, 0, 0, 1, 1,
1.048812, 0.2738816, 1.793927, 0, 0, 0, 1, 1,
1.05388, 0.6160699, -0.6673709, 1, 1, 1, 1, 1,
1.053955, -1.060116, 2.768602, 1, 1, 1, 1, 1,
1.056401, 1.078206, -1.099447, 1, 1, 1, 1, 1,
1.059908, -0.7072038, 2.733159, 1, 1, 1, 1, 1,
1.063787, 0.1093065, 1.007048, 1, 1, 1, 1, 1,
1.071467, -2.077801, 3.621902, 1, 1, 1, 1, 1,
1.071732, -0.2324508, 1.942973, 1, 1, 1, 1, 1,
1.074394, 1.223229, 0.5447477, 1, 1, 1, 1, 1,
1.081083, 0.9586204, -0.04297215, 1, 1, 1, 1, 1,
1.082588, 0.9754532, 2.376456, 1, 1, 1, 1, 1,
1.085068, -0.200341, 1.580372, 1, 1, 1, 1, 1,
1.085799, 1.451407, 1.191896, 1, 1, 1, 1, 1,
1.087674, -0.9477341, 1.658197, 1, 1, 1, 1, 1,
1.090468, 0.4078424, 2.016283, 1, 1, 1, 1, 1,
1.095768, 1.482929, 0.3821667, 1, 1, 1, 1, 1,
1.097385, 1.648094, 0.8708742, 0, 0, 1, 1, 1,
1.104071, 1.323328, 1.308876, 1, 0, 0, 1, 1,
1.109275, -0.5101157, 3.568406, 1, 0, 0, 1, 1,
1.1169, -0.3237275, 1.193866, 1, 0, 0, 1, 1,
1.118225, 0.1533272, 0.171165, 1, 0, 0, 1, 1,
1.121062, -0.5961431, 0.8717722, 1, 0, 0, 1, 1,
1.124969, 0.3122908, 1.483352, 0, 0, 0, 1, 1,
1.139687, 0.9920803, 0.5335793, 0, 0, 0, 1, 1,
1.141292, -1.608137, 2.70616, 0, 0, 0, 1, 1,
1.14541, 0.9844218, -0.8730357, 0, 0, 0, 1, 1,
1.150945, -1.635125, 2.705025, 0, 0, 0, 1, 1,
1.169284, -0.3891944, 0.4623668, 0, 0, 0, 1, 1,
1.179953, 0.02041429, 2.131727, 0, 0, 0, 1, 1,
1.180148, -0.1786329, 2.307132, 1, 1, 1, 1, 1,
1.194827, -0.1133392, 2.523065, 1, 1, 1, 1, 1,
1.20181, 0.3001345, 2.2994, 1, 1, 1, 1, 1,
1.202292, -1.634337, 3.206324, 1, 1, 1, 1, 1,
1.204592, -0.6295661, 1.255482, 1, 1, 1, 1, 1,
1.230264, 1.071972, 2.087911, 1, 1, 1, 1, 1,
1.231217, -1.167356, 1.322629, 1, 1, 1, 1, 1,
1.253145, -0.4205381, 2.557488, 1, 1, 1, 1, 1,
1.254339, -1.560777, 2.960114, 1, 1, 1, 1, 1,
1.254441, -2.33315, 2.888512, 1, 1, 1, 1, 1,
1.274889, 0.8681611, 1.717279, 1, 1, 1, 1, 1,
1.279882, 0.4492891, 1.305194, 1, 1, 1, 1, 1,
1.285268, -0.7335212, 1.385579, 1, 1, 1, 1, 1,
1.286349, -0.9975148, 0.5954945, 1, 1, 1, 1, 1,
1.288206, -0.1845922, 1.269752, 1, 1, 1, 1, 1,
1.290196, 0.2801634, 0.1343253, 0, 0, 1, 1, 1,
1.297389, -1.570829, 3.475461, 1, 0, 0, 1, 1,
1.31704, -0.6699503, 1.212201, 1, 0, 0, 1, 1,
1.324753, 1.93381, 0.7304985, 1, 0, 0, 1, 1,
1.328151, -0.6237743, 2.015425, 1, 0, 0, 1, 1,
1.329111, -1.512867, 3.544613, 1, 0, 0, 1, 1,
1.332242, -0.6068994, 1.270732, 0, 0, 0, 1, 1,
1.342446, 0.8831254, 1.038481, 0, 0, 0, 1, 1,
1.349319, -0.4880823, 2.17827, 0, 0, 0, 1, 1,
1.351026, -0.08101247, 0.9842693, 0, 0, 0, 1, 1,
1.353394, 0.07873742, 1.21286, 0, 0, 0, 1, 1,
1.355467, -0.5043333, 1.550034, 0, 0, 0, 1, 1,
1.365015, 0.4993351, -0.153583, 0, 0, 0, 1, 1,
1.36559, 0.03528019, 1.436162, 1, 1, 1, 1, 1,
1.367583, -0.281168, 1.978164, 1, 1, 1, 1, 1,
1.376646, -0.4120809, 1.707884, 1, 1, 1, 1, 1,
1.386302, 0.972054, 0.9424175, 1, 1, 1, 1, 1,
1.386765, 0.6468353, 1.035529, 1, 1, 1, 1, 1,
1.389377, -0.03455225, 1.468474, 1, 1, 1, 1, 1,
1.389404, -0.9894238, 1.861938, 1, 1, 1, 1, 1,
1.414693, 0.1973192, 1.605757, 1, 1, 1, 1, 1,
1.418374, -0.5681913, 1.101265, 1, 1, 1, 1, 1,
1.422611, -0.3360005, 1.266397, 1, 1, 1, 1, 1,
1.424926, 0.5363772, 0.9211379, 1, 1, 1, 1, 1,
1.434165, 0.542855, -0.04490551, 1, 1, 1, 1, 1,
1.442083, 0.3803812, -1.014179, 1, 1, 1, 1, 1,
1.463448, 1.704305, 0.3156887, 1, 1, 1, 1, 1,
1.48366, -0.7103747, 0.7675296, 1, 1, 1, 1, 1,
1.488644, -2.034747, 2.359554, 0, 0, 1, 1, 1,
1.555091, 0.364915, 0.2095589, 1, 0, 0, 1, 1,
1.55939, -0.549479, 1.011612, 1, 0, 0, 1, 1,
1.563957, -1.225339, 3.885675, 1, 0, 0, 1, 1,
1.572736, 0.8111373, 3.560143, 1, 0, 0, 1, 1,
1.578166, 0.3640697, 0.4223174, 1, 0, 0, 1, 1,
1.579084, -0.2109153, 1.698909, 0, 0, 0, 1, 1,
1.600416, -0.2515887, 1.351422, 0, 0, 0, 1, 1,
1.600519, 0.1870716, 0.841172, 0, 0, 0, 1, 1,
1.603722, 0.08723143, 0.9986042, 0, 0, 0, 1, 1,
1.622721, -0.6325156, 2.404504, 0, 0, 0, 1, 1,
1.630338, -0.108895, -0.3235484, 0, 0, 0, 1, 1,
1.638, -1.026693, 1.15248, 0, 0, 0, 1, 1,
1.646953, -0.7505891, 1.312607, 1, 1, 1, 1, 1,
1.647353, -0.8704751, 1.949165, 1, 1, 1, 1, 1,
1.648788, -0.6131878, 2.362575, 1, 1, 1, 1, 1,
1.670324, 0.9577077, 1.37492, 1, 1, 1, 1, 1,
1.67361, -1.833369, 2.694152, 1, 1, 1, 1, 1,
1.683741, -0.1465706, 1.408633, 1, 1, 1, 1, 1,
1.68446, -0.9008052, 0.6104441, 1, 1, 1, 1, 1,
1.694464, -0.558569, 2.046788, 1, 1, 1, 1, 1,
1.695626, 0.8871174, 1.945257, 1, 1, 1, 1, 1,
1.71511, 0.8009251, 0.6362765, 1, 1, 1, 1, 1,
1.741359, 0.6068502, -0.4703209, 1, 1, 1, 1, 1,
1.743358, -0.3706507, 2.206309, 1, 1, 1, 1, 1,
1.753994, -1.17796, 2.000946, 1, 1, 1, 1, 1,
1.754195, 2.189421, 1.214676, 1, 1, 1, 1, 1,
1.771609, 0.17065, 0.83483, 1, 1, 1, 1, 1,
1.777414, -0.6605219, 3.26234, 0, 0, 1, 1, 1,
1.777503, -0.4152691, 1.765416, 1, 0, 0, 1, 1,
1.789546, -0.3701198, 3.802177, 1, 0, 0, 1, 1,
1.803936, -0.1678109, 2.261477, 1, 0, 0, 1, 1,
1.830924, -1.452714, 0.6255212, 1, 0, 0, 1, 1,
1.850373, 1.113592, 0.5636879, 1, 0, 0, 1, 1,
1.873516, -2.19786, 1.77044, 0, 0, 0, 1, 1,
1.87797, 0.9442431, 2.135793, 0, 0, 0, 1, 1,
1.891743, 0.2124776, -0.02650832, 0, 0, 0, 1, 1,
1.904046, -0.137507, 2.031447, 0, 0, 0, 1, 1,
1.913396, -1.312095, 0.9926341, 0, 0, 0, 1, 1,
1.923349, 0.2307746, 2.325456, 0, 0, 0, 1, 1,
1.944592, -2.772956, 2.172481, 0, 0, 0, 1, 1,
1.956249, -2.015937, 0.1557794, 1, 1, 1, 1, 1,
2.014947, 0.01432283, 2.503577, 1, 1, 1, 1, 1,
2.038516, -1.288569, 2.056233, 1, 1, 1, 1, 1,
2.042518, 0.4430035, 2.51299, 1, 1, 1, 1, 1,
2.064639, -0.46395, 0.126278, 1, 1, 1, 1, 1,
2.090033, 1.274761, 2.746488, 1, 1, 1, 1, 1,
2.094195, -0.5596023, 2.522082, 1, 1, 1, 1, 1,
2.095007, 0.9829543, 3.922382, 1, 1, 1, 1, 1,
2.143206, 0.9316834, 3.357422, 1, 1, 1, 1, 1,
2.144581, 1.71075, 2.019948, 1, 1, 1, 1, 1,
2.145774, -0.3952579, 3.227216, 1, 1, 1, 1, 1,
2.167469, -0.5721056, 1.265444, 1, 1, 1, 1, 1,
2.18258, 0.502472, 0.9746419, 1, 1, 1, 1, 1,
2.182611, 0.9989296, 0.1867842, 1, 1, 1, 1, 1,
2.195696, -1.330701, 0.335415, 1, 1, 1, 1, 1,
2.19653, -1.218537, 1.996869, 0, 0, 1, 1, 1,
2.203926, 0.1653958, 0.6671402, 1, 0, 0, 1, 1,
2.210213, 1.028464, 0.004193487, 1, 0, 0, 1, 1,
2.243393, 0.5499831, 1.143093, 1, 0, 0, 1, 1,
2.257067, -0.280221, 2.022528, 1, 0, 0, 1, 1,
2.310884, 1.282156, 2.759095, 1, 0, 0, 1, 1,
2.323597, -0.68878, 2.763135, 0, 0, 0, 1, 1,
2.358106, -1.373832, 1.777192, 0, 0, 0, 1, 1,
2.371475, 0.2041492, 0.4610827, 0, 0, 0, 1, 1,
2.383412, -1.151944, -0.2282156, 0, 0, 0, 1, 1,
2.430925, -0.1716536, 3.421511, 0, 0, 0, 1, 1,
2.480255, 0.1956025, 0.6491761, 0, 0, 0, 1, 1,
2.487416, -0.09151292, 2.954288, 0, 0, 0, 1, 1,
2.60464, 0.1992532, 2.875334, 1, 1, 1, 1, 1,
2.632262, 0.1073263, -1.367681, 1, 1, 1, 1, 1,
2.689922, 0.2306205, 2.13172, 1, 1, 1, 1, 1,
2.824603, -0.1389032, 1.911794, 1, 1, 1, 1, 1,
2.844058, 0.1023207, 2.028386, 1, 1, 1, 1, 1,
3.03244, 0.6771584, 0.3354431, 1, 1, 1, 1, 1,
3.054149, 0.4791405, 0.3736309, 1, 1, 1, 1, 1
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
var radius = 9.557016;
var distance = 33.56861;
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
mvMatrix.translate( 0.218118, -0.06788671, 0.3514116 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56861);
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